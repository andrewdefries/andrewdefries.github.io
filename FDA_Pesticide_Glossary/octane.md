---
output:
  html_document:
    self_contained: no
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')
```

<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>

This works fine.


```r
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))
```

<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
gl_PointSize = 3.;
vCol = aCol;
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 9 ****** -->
<script id="testglvshader9" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader9" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 10 ****** -->
<script id="testglvshader10" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader10" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 11 ****** -->
<script id="testglvshader11" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader11" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 12 ****** -->
<script id="testglvshader12" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader12" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 13 ****** -->
<script id="testglvshader13" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader13" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 14 ****** -->
<script id="testglvshader14" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader14" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 15 ****** -->
<script id="testglvshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 16 ****** -->
<script id="testglvshader16" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader16" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testglvshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 18 ****** -->
<script id="testglvshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testglwebGLStart() {
var debug = function(msg) {
document.getElementById("testgldebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testglcanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** points object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
-2.64155, -0.9594158, -1.915858, 1, 0, 0, 1,
-2.587564, -0.6520684, -3.245833, 1, 0.007843138, 0, 1,
-2.56423, 0.2946953, 0.645076, 1, 0.01176471, 0, 1,
-2.500002, 0.1807442, -0.681331, 1, 0.01960784, 0, 1,
-2.479237, -1.368851, -1.429891, 1, 0.02352941, 0, 1,
-2.429559, -0.4142672, 0.4184831, 1, 0.03137255, 0, 1,
-2.39821, -0.191848, -1.712448, 1, 0.03529412, 0, 1,
-2.340921, -0.211078, -2.205593, 1, 0.04313726, 0, 1,
-2.271001, -0.04476083, -1.789592, 1, 0.04705882, 0, 1,
-2.157368, 0.07221241, -1.55478, 1, 0.05490196, 0, 1,
-2.151551, -2.053059, -1.439733, 1, 0.05882353, 0, 1,
-2.108775, 0.8197397, -1.516573, 1, 0.06666667, 0, 1,
-2.107782, -0.648025, -1.036454, 1, 0.07058824, 0, 1,
-2.077607, -0.4181074, -2.372644, 1, 0.07843138, 0, 1,
-2.075253, -1.608688e-06, -0.9197401, 1, 0.08235294, 0, 1,
-2.051968, 0.5536492, -3.498714, 1, 0.09019608, 0, 1,
-2.042537, 1.12693, 0.393983, 1, 0.09411765, 0, 1,
-2.037159, 0.2266548, -1.882513, 1, 0.1019608, 0, 1,
-2.033101, 0.5259618, -1.742519, 1, 0.1098039, 0, 1,
-2.030696, 1.291128, -0.4015476, 1, 0.1137255, 0, 1,
-2.018318, -1.213603, -2.393545, 1, 0.1215686, 0, 1,
-2.010036, 0.3787992, -0.1875807, 1, 0.1254902, 0, 1,
-1.999264, -1.519999, -1.624351, 1, 0.1333333, 0, 1,
-1.978457, -0.03787189, -2.295389, 1, 0.1372549, 0, 1,
-1.931337, -0.7789778, -2.052733, 1, 0.145098, 0, 1,
-1.928056, -0.09374997, -0.9448811, 1, 0.1490196, 0, 1,
-1.926176, -1.227306, -0.8655703, 1, 0.1568628, 0, 1,
-1.909025, 0.1829048, -4.169824, 1, 0.1607843, 0, 1,
-1.905652, 1.215815, -2.327772, 1, 0.1686275, 0, 1,
-1.847446, -0.8566143, -2.265329, 1, 0.172549, 0, 1,
-1.846411, -0.9202315, -1.510016, 1, 0.1803922, 0, 1,
-1.845185, -1.498516, -0.6547032, 1, 0.1843137, 0, 1,
-1.844814, 0.8271469, -0.5485548, 1, 0.1921569, 0, 1,
-1.828264, 0.3529623, -2.674443, 1, 0.1960784, 0, 1,
-1.807222, 0.729681, -2.372424, 1, 0.2039216, 0, 1,
-1.807159, -0.4561229, -0.7827195, 1, 0.2117647, 0, 1,
-1.799567, -0.9328578, -2.537708, 1, 0.2156863, 0, 1,
-1.786821, -0.916158, -1.330892, 1, 0.2235294, 0, 1,
-1.75116, -0.373635, -2.123237, 1, 0.227451, 0, 1,
-1.742514, 1.442933, -0.9306739, 1, 0.2352941, 0, 1,
-1.731601, 0.198741, -1.452518, 1, 0.2392157, 0, 1,
-1.724693, -0.07950549, -2.262259, 1, 0.2470588, 0, 1,
-1.701283, -0.3358237, -2.743725, 1, 0.2509804, 0, 1,
-1.679606, 0.9490747, -1.507471, 1, 0.2588235, 0, 1,
-1.679069, 0.0525616, -3.797321, 1, 0.2627451, 0, 1,
-1.675438, 0.9267311, -2.476786, 1, 0.2705882, 0, 1,
-1.670028, -0.1463723, -1.78942, 1, 0.2745098, 0, 1,
-1.646724, 0.3979163, -2.208932, 1, 0.282353, 0, 1,
-1.646097, -1.202918, -2.894604, 1, 0.2862745, 0, 1,
-1.63157, 2.524576, 0.402871, 1, 0.2941177, 0, 1,
-1.61615, 0.8409804, -0.9462289, 1, 0.3019608, 0, 1,
-1.615592, -1.224611, -3.542772, 1, 0.3058824, 0, 1,
-1.613062, 0.1056035, -1.756956, 1, 0.3137255, 0, 1,
-1.605478, 0.1166948, -3.394142, 1, 0.3176471, 0, 1,
-1.597653, -0.3710199, -1.044201, 1, 0.3254902, 0, 1,
-1.592675, -1.848053, -2.182585, 1, 0.3294118, 0, 1,
-1.590037, 1.047084, -0.9323691, 1, 0.3372549, 0, 1,
-1.58791, -0.2265483, -1.214574, 1, 0.3411765, 0, 1,
-1.586639, -0.1980663, -2.542304, 1, 0.3490196, 0, 1,
-1.567682, -0.453335, -2.302903, 1, 0.3529412, 0, 1,
-1.549968, -1.206994, -1.366095, 1, 0.3607843, 0, 1,
-1.540798, 2.09494, -0.6881092, 1, 0.3647059, 0, 1,
-1.536254, 0.2591628, -0.2173158, 1, 0.372549, 0, 1,
-1.533094, -1.014401, -3.90716, 1, 0.3764706, 0, 1,
-1.526245, 0.719822, -2.831149, 1, 0.3843137, 0, 1,
-1.522115, -0.8760294, -1.09955, 1, 0.3882353, 0, 1,
-1.514494, 0.3402608, -2.873231, 1, 0.3960784, 0, 1,
-1.506557, 0.1715014, 0.4252332, 1, 0.4039216, 0, 1,
-1.488781, 0.9571687, 0.1827596, 1, 0.4078431, 0, 1,
-1.485336, -0.4678087, -1.535579, 1, 0.4156863, 0, 1,
-1.484536, 0.9283643, -0.5175773, 1, 0.4196078, 0, 1,
-1.483028, -1.244568, -1.61258, 1, 0.427451, 0, 1,
-1.474189, 0.685092, -0.9863361, 1, 0.4313726, 0, 1,
-1.466259, -1.146722, -2.19495, 1, 0.4392157, 0, 1,
-1.453894, -0.1849752, -1.891984, 1, 0.4431373, 0, 1,
-1.451742, -1.714953, -2.187021, 1, 0.4509804, 0, 1,
-1.429053, 0.6177917, -0.5706968, 1, 0.454902, 0, 1,
-1.428132, 0.5029154, -1.720381, 1, 0.4627451, 0, 1,
-1.425371, 0.525544, -2.025321, 1, 0.4666667, 0, 1,
-1.405039, -0.1820882, -2.720306, 1, 0.4745098, 0, 1,
-1.39914, -0.140535, -1.422553, 1, 0.4784314, 0, 1,
-1.384379, -0.8349566, -2.048725, 1, 0.4862745, 0, 1,
-1.372814, -1.770029, -2.095268, 1, 0.4901961, 0, 1,
-1.369606, -0.1776595, -0.2458772, 1, 0.4980392, 0, 1,
-1.362718, -0.9676098, -1.896774, 1, 0.5058824, 0, 1,
-1.361089, 1.098199, -1.521351, 1, 0.509804, 0, 1,
-1.34685, -0.3664114, -0.9451932, 1, 0.5176471, 0, 1,
-1.342248, 0.8821716, -1.81323, 1, 0.5215687, 0, 1,
-1.326132, -1.889079, -2.688091, 1, 0.5294118, 0, 1,
-1.317574, 0.06417065, -1.110813, 1, 0.5333334, 0, 1,
-1.315445, 0.3336231, -2.319902, 1, 0.5411765, 0, 1,
-1.311816, 1.450776, 0.3726502, 1, 0.5450981, 0, 1,
-1.303182, 0.2761725, -1.913965, 1, 0.5529412, 0, 1,
-1.300501, -0.1797213, 0.1329213, 1, 0.5568628, 0, 1,
-1.292748, 0.3542324, -0.7014578, 1, 0.5647059, 0, 1,
-1.290971, 0.231798, -2.104606, 1, 0.5686275, 0, 1,
-1.275258, 1.898167, -0.574241, 1, 0.5764706, 0, 1,
-1.273883, -0.5650939, -2.940638, 1, 0.5803922, 0, 1,
-1.265038, 1.905095, -3.139411, 1, 0.5882353, 0, 1,
-1.2632, -0.8215496, -4.373779, 1, 0.5921569, 0, 1,
-1.262134, 0.8172636, -0.7283496, 1, 0.6, 0, 1,
-1.251396, -1.161484, -2.274539, 1, 0.6078432, 0, 1,
-1.240639, -0.06280763, -1.127675, 1, 0.6117647, 0, 1,
-1.231704, -1.909927, -3.98244, 1, 0.6196079, 0, 1,
-1.221337, 1.16744, -0.8762316, 1, 0.6235294, 0, 1,
-1.221229, -0.1826257, -1.888527, 1, 0.6313726, 0, 1,
-1.218223, 0.4214183, -0.8090287, 1, 0.6352941, 0, 1,
-1.214517, -0.260858, -1.138059, 1, 0.6431373, 0, 1,
-1.210311, 0.7898673, -0.795631, 1, 0.6470588, 0, 1,
-1.207149, 0.3859696, -1.985201, 1, 0.654902, 0, 1,
-1.206247, -0.5254923, -1.437774, 1, 0.6588235, 0, 1,
-1.20261, -0.9795667, -4.453917, 1, 0.6666667, 0, 1,
-1.200919, -0.1169808, -3.180594, 1, 0.6705883, 0, 1,
-1.200417, 0.5702901, -1.935499, 1, 0.6784314, 0, 1,
-1.195935, 1.02222, -0.4653701, 1, 0.682353, 0, 1,
-1.194598, 0.1775551, -1.738056, 1, 0.6901961, 0, 1,
-1.190891, -0.5640138, -1.360758, 1, 0.6941177, 0, 1,
-1.182588, 1.010487, 0.03497229, 1, 0.7019608, 0, 1,
-1.182579, 1.313449, -0.3304631, 1, 0.7098039, 0, 1,
-1.168995, -0.5143017, -0.9866634, 1, 0.7137255, 0, 1,
-1.168984, 0.1030451, -2.061435, 1, 0.7215686, 0, 1,
-1.165781, -0.1288987, -0.9837262, 1, 0.7254902, 0, 1,
-1.155676, 0.6608698, 0.3328494, 1, 0.7333333, 0, 1,
-1.151128, -0.2344725, -2.511189, 1, 0.7372549, 0, 1,
-1.136657, 0.2754991, -1.965828, 1, 0.7450981, 0, 1,
-1.136282, -0.04073573, -2.296919, 1, 0.7490196, 0, 1,
-1.135407, -0.7554536, -3.378412, 1, 0.7568628, 0, 1,
-1.13401, 1.667311, -0.03431807, 1, 0.7607843, 0, 1,
-1.133656, -0.1975657, -1.306378, 1, 0.7686275, 0, 1,
-1.132777, 1.073902, -0.942075, 1, 0.772549, 0, 1,
-1.129421, -1.592976, -2.913646, 1, 0.7803922, 0, 1,
-1.127646, 0.196884, -0.9906164, 1, 0.7843137, 0, 1,
-1.12391, 2.137711, -1.382908, 1, 0.7921569, 0, 1,
-1.116349, 1.644523, -1.181553, 1, 0.7960784, 0, 1,
-1.102989, 1.692887, 0.09916595, 1, 0.8039216, 0, 1,
-1.096046, 0.2037186, -1.267949, 1, 0.8117647, 0, 1,
-1.093552, 0.1782241, -1.109632, 1, 0.8156863, 0, 1,
-1.091031, 0.8623903, -0.5101069, 1, 0.8235294, 0, 1,
-1.087099, 0.1882545, 0.3961514, 1, 0.827451, 0, 1,
-1.076592, -0.2132321, -0.6547425, 1, 0.8352941, 0, 1,
-1.074107, -0.6528825, -2.041908, 1, 0.8392157, 0, 1,
-1.071549, 1.254871, 0.1889006, 1, 0.8470588, 0, 1,
-1.064589, -1.250355, -3.651996, 1, 0.8509804, 0, 1,
-1.063467, 2.035762, -0.1120421, 1, 0.8588235, 0, 1,
-1.061648, 0.843637, -0.2831148, 1, 0.8627451, 0, 1,
-1.061568, -0.8048735, -3.372845, 1, 0.8705882, 0, 1,
-1.06011, 0.1393507, -2.585033, 1, 0.8745098, 0, 1,
-1.059975, -0.1443393, -0.7470477, 1, 0.8823529, 0, 1,
-1.058957, 1.178068, -0.9650971, 1, 0.8862745, 0, 1,
-1.052196, 0.81976, -0.8800502, 1, 0.8941177, 0, 1,
-1.04685, -0.1935116, -3.083265, 1, 0.8980392, 0, 1,
-1.04539, 1.259558, -0.4013739, 1, 0.9058824, 0, 1,
-1.044755, -0.165678, -3.058385, 1, 0.9137255, 0, 1,
-1.033733, -0.6170046, -1.116776, 1, 0.9176471, 0, 1,
-1.029123, -0.9667004, -0.6040722, 1, 0.9254902, 0, 1,
-1.028651, -0.50032, -1.863466, 1, 0.9294118, 0, 1,
-1.022177, -1.424876, -2.881327, 1, 0.9372549, 0, 1,
-1.019707, 1.20581, -2.727855, 1, 0.9411765, 0, 1,
-1.015048, 1.344184, -0.7409003, 1, 0.9490196, 0, 1,
-1.010476, -1.091244, -2.243376, 1, 0.9529412, 0, 1,
-1.004601, -1.23772, -0.5849468, 1, 0.9607843, 0, 1,
-1.003519, 2.312345, -1.992029, 1, 0.9647059, 0, 1,
-1.002636, 1.496818, 0.407873, 1, 0.972549, 0, 1,
-0.9972577, -1.470891, -3.481693, 1, 0.9764706, 0, 1,
-0.9957398, -0.851254, -3.282324, 1, 0.9843137, 0, 1,
-0.9928262, 0.06533001, -2.534518, 1, 0.9882353, 0, 1,
-0.9889005, -0.3739215, -0.9977186, 1, 0.9960784, 0, 1,
-0.9861011, -1.507663, -1.664203, 0.9960784, 1, 0, 1,
-0.9852933, 0.4233575, -0.5564654, 0.9921569, 1, 0, 1,
-0.9818028, -1.42681, -2.00597, 0.9843137, 1, 0, 1,
-0.981562, -0.378118, -0.9522873, 0.9803922, 1, 0, 1,
-0.9798315, 0.1010502, -1.682624, 0.972549, 1, 0, 1,
-0.9697654, -0.6636177, -2.816013, 0.9686275, 1, 0, 1,
-0.9614333, 0.4783376, 1.757138, 0.9607843, 1, 0, 1,
-0.9600921, -1.918808, -2.413477, 0.9568627, 1, 0, 1,
-0.956829, -1.600046, -4.848169, 0.9490196, 1, 0, 1,
-0.9512234, 1.328598, -1.035458, 0.945098, 1, 0, 1,
-0.950474, 0.03668702, -2.853981, 0.9372549, 1, 0, 1,
-0.946525, -0.6137269, -2.243706, 0.9333333, 1, 0, 1,
-0.9420065, -1.309548, -2.534236, 0.9254902, 1, 0, 1,
-0.9410197, 0.7914836, -1.751062, 0.9215686, 1, 0, 1,
-0.9392615, 0.5734234, -1.404405, 0.9137255, 1, 0, 1,
-0.9303991, 0.6432574, 0.9489404, 0.9098039, 1, 0, 1,
-0.9294611, -0.1587404, -2.06607, 0.9019608, 1, 0, 1,
-0.9255645, 0.279696, -1.563501, 0.8941177, 1, 0, 1,
-0.9221804, 0.3143829, -2.630342, 0.8901961, 1, 0, 1,
-0.9194433, 0.4391878, -0.5707262, 0.8823529, 1, 0, 1,
-0.9171138, 0.357263, -2.282751, 0.8784314, 1, 0, 1,
-0.916607, -0.8111987, -1.320644, 0.8705882, 1, 0, 1,
-0.9154856, 0.570844, -1.477206, 0.8666667, 1, 0, 1,
-0.9026139, 0.4384304, -0.7931114, 0.8588235, 1, 0, 1,
-0.9014037, 2.063938, -1.544124, 0.854902, 1, 0, 1,
-0.8966815, -2.502716, -3.519686, 0.8470588, 1, 0, 1,
-0.8921089, -0.9702905, -1.972683, 0.8431373, 1, 0, 1,
-0.8919504, 0.2544371, -2.595232, 0.8352941, 1, 0, 1,
-0.8918576, 0.9562452, -2.591182, 0.8313726, 1, 0, 1,
-0.8906699, 1.124009, -1.733498, 0.8235294, 1, 0, 1,
-0.8885634, -0.9145334, -2.530653, 0.8196079, 1, 0, 1,
-0.8874256, -0.2276791, -2.811932, 0.8117647, 1, 0, 1,
-0.8856013, -0.2003445, -4.898366, 0.8078431, 1, 0, 1,
-0.8812242, -0.2996081, 0.07598355, 0.8, 1, 0, 1,
-0.8801917, -0.02656793, -3.794687, 0.7921569, 1, 0, 1,
-0.8768554, -1.744254, -3.662127, 0.7882353, 1, 0, 1,
-0.8759316, -0.5850574, -1.572745, 0.7803922, 1, 0, 1,
-0.8681241, 0.7417396, -2.488279, 0.7764706, 1, 0, 1,
-0.862749, 1.851987, -2.159284, 0.7686275, 1, 0, 1,
-0.8596933, 0.2439288, -1.930583, 0.7647059, 1, 0, 1,
-0.8541395, 1.021274, -1.012375, 0.7568628, 1, 0, 1,
-0.8540018, 1.236408, -1.034081, 0.7529412, 1, 0, 1,
-0.8484395, 0.1110422, -0.9568585, 0.7450981, 1, 0, 1,
-0.8463205, -0.08589765, -3.271313, 0.7411765, 1, 0, 1,
-0.8422722, 1.924241, 0.7896562, 0.7333333, 1, 0, 1,
-0.8359437, -0.6972726, -1.115324, 0.7294118, 1, 0, 1,
-0.8359367, -0.0678473, -1.285848, 0.7215686, 1, 0, 1,
-0.8329674, 2.242573, -0.02542572, 0.7176471, 1, 0, 1,
-0.8284461, 1.30265, -2.812695, 0.7098039, 1, 0, 1,
-0.8260605, 0.3035099, -1.658918, 0.7058824, 1, 0, 1,
-0.8217598, -0.2999354, -2.063812, 0.6980392, 1, 0, 1,
-0.8196216, -0.2454569, -1.293715, 0.6901961, 1, 0, 1,
-0.8180558, 0.5262281, -0.7951851, 0.6862745, 1, 0, 1,
-0.8173192, -1.294335, -2.897564, 0.6784314, 1, 0, 1,
-0.815329, 0.1491265, -1.870713, 0.6745098, 1, 0, 1,
-0.811516, 0.6027386, 0.4940199, 0.6666667, 1, 0, 1,
-0.8077, -0.3025884, 0.6295046, 0.6627451, 1, 0, 1,
-0.8045387, 0.6979061, -1.385679, 0.654902, 1, 0, 1,
-0.7981684, 0.4661852, -1.178032, 0.6509804, 1, 0, 1,
-0.7979042, 0.5065739, 0.8272182, 0.6431373, 1, 0, 1,
-0.7945997, -1.7325, -2.079792, 0.6392157, 1, 0, 1,
-0.7913905, -0.1554374, -0.1759341, 0.6313726, 1, 0, 1,
-0.789323, -1.666323, -2.55985, 0.627451, 1, 0, 1,
-0.7892607, 0.4648526, -2.072018, 0.6196079, 1, 0, 1,
-0.7887579, 2.114579, 0.8677945, 0.6156863, 1, 0, 1,
-0.7850503, 1.011195, 0.4012985, 0.6078432, 1, 0, 1,
-0.7849612, 2.143916, 1.863435, 0.6039216, 1, 0, 1,
-0.773865, -0.4661101, -1.906524, 0.5960785, 1, 0, 1,
-0.7696484, -0.06669218, -1.644818, 0.5882353, 1, 0, 1,
-0.7692648, 1.55482, -1.16121, 0.5843138, 1, 0, 1,
-0.7564141, 0.1611019, -1.490605, 0.5764706, 1, 0, 1,
-0.7562754, 0.7014381, -1.63647, 0.572549, 1, 0, 1,
-0.75441, -0.3904402, -1.265507, 0.5647059, 1, 0, 1,
-0.7511618, -0.3061661, -1.827488, 0.5607843, 1, 0, 1,
-0.7489696, -0.7507799, -1.404452, 0.5529412, 1, 0, 1,
-0.7484487, 0.4319864, -1.283328, 0.5490196, 1, 0, 1,
-0.7440456, 0.3902124, -2.125719, 0.5411765, 1, 0, 1,
-0.7422632, 0.1712127, -0.2887703, 0.5372549, 1, 0, 1,
-0.7409279, -0.3094774, -0.1454654, 0.5294118, 1, 0, 1,
-0.7394645, 1.293606, -1.078312, 0.5254902, 1, 0, 1,
-0.7364681, 1.488978, -2.026106, 0.5176471, 1, 0, 1,
-0.7360985, 0.7098931, -1.368924, 0.5137255, 1, 0, 1,
-0.7353042, -0.8707063, -1.514117, 0.5058824, 1, 0, 1,
-0.7337411, -0.2376684, -2.376855, 0.5019608, 1, 0, 1,
-0.7334619, -0.8480768, -3.457482, 0.4941176, 1, 0, 1,
-0.7308327, 0.4620971, -0.9288332, 0.4862745, 1, 0, 1,
-0.729958, 1.134958, -2.133982, 0.4823529, 1, 0, 1,
-0.7204808, -0.5400382, -1.823198, 0.4745098, 1, 0, 1,
-0.7192271, -2.65486, -2.273774, 0.4705882, 1, 0, 1,
-0.7141922, -0.4048583, -3.231353, 0.4627451, 1, 0, 1,
-0.7108809, -0.6935654, -2.330479, 0.4588235, 1, 0, 1,
-0.7005879, -0.2345442, -2.73321, 0.4509804, 1, 0, 1,
-0.6980507, 0.00728952, -1.920959, 0.4470588, 1, 0, 1,
-0.695397, -0.7370491, -2.028481, 0.4392157, 1, 0, 1,
-0.6917953, -0.3267723, -2.205092, 0.4352941, 1, 0, 1,
-0.6852121, 1.591061, 0.1364128, 0.427451, 1, 0, 1,
-0.6842773, -0.1066514, -1.633198, 0.4235294, 1, 0, 1,
-0.6829473, -0.7685394, -1.508919, 0.4156863, 1, 0, 1,
-0.6799285, 0.07028974, -2.465684, 0.4117647, 1, 0, 1,
-0.6782532, 0.4635879, -1.16365, 0.4039216, 1, 0, 1,
-0.6762997, 0.4990186, -0.5420414, 0.3960784, 1, 0, 1,
-0.6730785, 0.7093491, -0.6875327, 0.3921569, 1, 0, 1,
-0.6711308, 0.4794662, -0.1840614, 0.3843137, 1, 0, 1,
-0.6700281, -0.735532, -3.199607, 0.3803922, 1, 0, 1,
-0.668606, -0.980808, -1.913588, 0.372549, 1, 0, 1,
-0.6640686, -0.5217804, -2.225513, 0.3686275, 1, 0, 1,
-0.6605141, 0.9444695, -0.4539711, 0.3607843, 1, 0, 1,
-0.6593903, -0.8332992, -2.909749, 0.3568628, 1, 0, 1,
-0.6577685, -0.06384505, -0.554474, 0.3490196, 1, 0, 1,
-0.6537064, 0.2968411, -0.720608, 0.345098, 1, 0, 1,
-0.6531763, -1.259347, -4.989744, 0.3372549, 1, 0, 1,
-0.6499227, 1.194972, 0.06235058, 0.3333333, 1, 0, 1,
-0.6499121, -0.1603155, -1.933095, 0.3254902, 1, 0, 1,
-0.6491804, -0.8895613, -3.444845, 0.3215686, 1, 0, 1,
-0.6485826, 1.385756, 0.1984613, 0.3137255, 1, 0, 1,
-0.6424716, 1.20865, 0.04734617, 0.3098039, 1, 0, 1,
-0.6382399, 0.7760969, 0.1029484, 0.3019608, 1, 0, 1,
-0.6381346, 1.561598, -0.2797312, 0.2941177, 1, 0, 1,
-0.6355906, 0.1953626, -2.568814, 0.2901961, 1, 0, 1,
-0.6333574, -0.5586532, -3.246263, 0.282353, 1, 0, 1,
-0.6292648, 1.28231, -0.5044382, 0.2784314, 1, 0, 1,
-0.6280586, -1.383734, -2.469242, 0.2705882, 1, 0, 1,
-0.6260805, 0.08705528, -1.514423, 0.2666667, 1, 0, 1,
-0.6191292, -0.2846462, -1.180105, 0.2588235, 1, 0, 1,
-0.6160567, 0.3118191, -1.212725, 0.254902, 1, 0, 1,
-0.615302, -0.7432946, -1.526926, 0.2470588, 1, 0, 1,
-0.6128969, -0.4596463, 1.074957, 0.2431373, 1, 0, 1,
-0.6066627, 0.07980475, -0.7543406, 0.2352941, 1, 0, 1,
-0.6064048, 1.036868, -0.9910127, 0.2313726, 1, 0, 1,
-0.5932775, -0.2156099, -1.413601, 0.2235294, 1, 0, 1,
-0.591266, 2.018755, 0.8277053, 0.2196078, 1, 0, 1,
-0.5895167, -0.6869144, -1.96266, 0.2117647, 1, 0, 1,
-0.5894574, -0.5183709, -1.359963, 0.2078431, 1, 0, 1,
-0.588492, -0.5895094, -2.224356, 0.2, 1, 0, 1,
-0.5859621, 0.1611796, -0.2252047, 0.1921569, 1, 0, 1,
-0.5849301, 0.01504061, -0.7939779, 0.1882353, 1, 0, 1,
-0.5807409, 2.41804, 0.5646799, 0.1803922, 1, 0, 1,
-0.5803194, -0.1915942, -2.136558, 0.1764706, 1, 0, 1,
-0.5797833, 0.3478603, -1.020873, 0.1686275, 1, 0, 1,
-0.5789447, 0.7101462, -1.23937, 0.1647059, 1, 0, 1,
-0.5787121, 0.2478134, -2.374087, 0.1568628, 1, 0, 1,
-0.5780568, -0.3136869, -1.620806, 0.1529412, 1, 0, 1,
-0.5766098, -0.5498012, -2.592965, 0.145098, 1, 0, 1,
-0.5735433, -0.3851807, -3.348813, 0.1411765, 1, 0, 1,
-0.570577, -0.01366818, -1.057527, 0.1333333, 1, 0, 1,
-0.5690897, -0.7731487, -0.6020157, 0.1294118, 1, 0, 1,
-0.5675476, -0.344266, -1.112611, 0.1215686, 1, 0, 1,
-0.5671414, 2.508203, -0.1505424, 0.1176471, 1, 0, 1,
-0.5664507, -1.10503, -4.55456, 0.1098039, 1, 0, 1,
-0.5640557, -0.4323294, -2.056623, 0.1058824, 1, 0, 1,
-0.5638836, 0.2050609, -1.012613, 0.09803922, 1, 0, 1,
-0.562106, 0.6639947, -3.611218, 0.09019608, 1, 0, 1,
-0.5572187, -0.7311745, -2.099871, 0.08627451, 1, 0, 1,
-0.5537208, -0.7457818, -2.758094, 0.07843138, 1, 0, 1,
-0.5490238, 0.3802342, -2.766211, 0.07450981, 1, 0, 1,
-0.5442696, -0.3433633, -1.939769, 0.06666667, 1, 0, 1,
-0.5438918, 0.3671483, -0.162463, 0.0627451, 1, 0, 1,
-0.5425959, -0.5279347, -3.924781, 0.05490196, 1, 0, 1,
-0.5344949, -1.169391, -1.252982, 0.05098039, 1, 0, 1,
-0.5339584, -0.8819292, -2.430099, 0.04313726, 1, 0, 1,
-0.5190777, -0.4779059, -0.6188309, 0.03921569, 1, 0, 1,
-0.513128, 0.07845037, -3.36225, 0.03137255, 1, 0, 1,
-0.5096179, 0.1753114, -2.462497, 0.02745098, 1, 0, 1,
-0.5065004, -0.3482066, -1.596122, 0.01960784, 1, 0, 1,
-0.5060825, 0.9713806, -1.581701, 0.01568628, 1, 0, 1,
-0.5036314, -1.315132, -4.133318, 0.007843138, 1, 0, 1,
-0.4979414, -0.6436599, -2.668049, 0.003921569, 1, 0, 1,
-0.4975992, 0.8331933, -0.9913952, 0, 1, 0.003921569, 1,
-0.4972468, 0.7094293, -1.377984, 0, 1, 0.01176471, 1,
-0.4960189, 0.5376547, 0.1651891, 0, 1, 0.01568628, 1,
-0.4959281, -0.4061814, -1.154553, 0, 1, 0.02352941, 1,
-0.4918573, -0.9775624, -1.380094, 0, 1, 0.02745098, 1,
-0.4913728, -0.07679068, -3.207555, 0, 1, 0.03529412, 1,
-0.4877946, 1.07073, -0.3490293, 0, 1, 0.03921569, 1,
-0.4857669, -0.3668593, -0.7566081, 0, 1, 0.04705882, 1,
-0.4849271, 1.3539, -0.6689208, 0, 1, 0.05098039, 1,
-0.481653, 0.3011176, -1.331866, 0, 1, 0.05882353, 1,
-0.4806704, 0.9804922, -1.404518, 0, 1, 0.0627451, 1,
-0.4803912, 0.6422531, -0.2567094, 0, 1, 0.07058824, 1,
-0.4802573, 2.171206, -1.824394, 0, 1, 0.07450981, 1,
-0.4754556, -1.04006, -2.082027, 0, 1, 0.08235294, 1,
-0.4744644, -0.7765449, -2.546501, 0, 1, 0.08627451, 1,
-0.4720273, -0.08698947, -0.1642399, 0, 1, 0.09411765, 1,
-0.4718969, 1.364716, 0.0212984, 0, 1, 0.1019608, 1,
-0.4671896, -0.3461573, -1.020779, 0, 1, 0.1058824, 1,
-0.467079, 0.1944677, -1.702085, 0, 1, 0.1137255, 1,
-0.4669124, -3.190183, -4.185359, 0, 1, 0.1176471, 1,
-0.4613772, -0.7443736, -3.343974, 0, 1, 0.1254902, 1,
-0.4588683, -1.347837, -2.411318, 0, 1, 0.1294118, 1,
-0.4504716, 0.037179, -2.127602, 0, 1, 0.1372549, 1,
-0.4491112, 3.859775, -2.942993, 0, 1, 0.1411765, 1,
-0.4465022, -0.4369981, -3.241825, 0, 1, 0.1490196, 1,
-0.4451978, -0.0420025, -2.394296, 0, 1, 0.1529412, 1,
-0.4443761, 1.659736, -2.245727, 0, 1, 0.1607843, 1,
-0.443884, -1.025251, -2.723953, 0, 1, 0.1647059, 1,
-0.4438539, -0.512807, -1.149209, 0, 1, 0.172549, 1,
-0.4362812, 0.3620392, -0.7308226, 0, 1, 0.1764706, 1,
-0.4281274, -0.8016234, -2.834384, 0, 1, 0.1843137, 1,
-0.4273008, -0.9905361, -3.79911, 0, 1, 0.1882353, 1,
-0.4270718, 1.484717, -0.7293482, 0, 1, 0.1960784, 1,
-0.4264723, -0.6269525, -3.455357, 0, 1, 0.2039216, 1,
-0.4261498, -0.6733726, -4.519559, 0, 1, 0.2078431, 1,
-0.4260734, -0.7874014, -2.485146, 0, 1, 0.2156863, 1,
-0.4236529, -0.2347784, -2.810162, 0, 1, 0.2196078, 1,
-0.4228115, 0.7158341, -0.642726, 0, 1, 0.227451, 1,
-0.4226931, 3.392778, -2.258415, 0, 1, 0.2313726, 1,
-0.4224888, -2.562746, -2.590625, 0, 1, 0.2392157, 1,
-0.4210505, 0.6685408, 0.906226, 0, 1, 0.2431373, 1,
-0.4147936, 1.087854, 0.1600378, 0, 1, 0.2509804, 1,
-0.4112082, 0.5663306, -0.8442795, 0, 1, 0.254902, 1,
-0.4067142, -0.2036115, -3.538657, 0, 1, 0.2627451, 1,
-0.4051784, 0.3943683, -2.853345, 0, 1, 0.2666667, 1,
-0.4034673, 0.5431737, -1.292158, 0, 1, 0.2745098, 1,
-0.4033334, -1.620109, -1.432014, 0, 1, 0.2784314, 1,
-0.4012629, -0.8237762, -1.904332, 0, 1, 0.2862745, 1,
-0.3961942, 0.2698808, -1.735057, 0, 1, 0.2901961, 1,
-0.3953521, 0.5198237, -0.8971023, 0, 1, 0.2980392, 1,
-0.3911752, 0.6609507, -2.611773, 0, 1, 0.3058824, 1,
-0.3870168, -0.9210597, -2.671981, 0, 1, 0.3098039, 1,
-0.3847019, 0.9489901, 3.08757, 0, 1, 0.3176471, 1,
-0.3828176, 0.695127, -1.802213, 0, 1, 0.3215686, 1,
-0.3811528, 0.8018866, -0.9304069, 0, 1, 0.3294118, 1,
-0.3784454, 0.2731791, -2.932173, 0, 1, 0.3333333, 1,
-0.3777687, -0.1630998, -1.111256, 0, 1, 0.3411765, 1,
-0.3772867, 0.7652341, -1.009784, 0, 1, 0.345098, 1,
-0.369179, 0.008276969, -0.6211388, 0, 1, 0.3529412, 1,
-0.3683611, 0.7759582, -2.686502, 0, 1, 0.3568628, 1,
-0.3628432, -0.2903323, -1.890193, 0, 1, 0.3647059, 1,
-0.3609498, -0.8712228, -1.72784, 0, 1, 0.3686275, 1,
-0.3603274, -0.1759335, -1.453669, 0, 1, 0.3764706, 1,
-0.3572442, 1.437636, 0.003066743, 0, 1, 0.3803922, 1,
-0.3567647, -1.30148, -3.113978, 0, 1, 0.3882353, 1,
-0.3520427, -0.8009278, -1.216309, 0, 1, 0.3921569, 1,
-0.3516606, -2.094038, -2.834535, 0, 1, 0.4, 1,
-0.3508277, -1.783042, -2.424103, 0, 1, 0.4078431, 1,
-0.3404913, 0.02248241, -1.974128, 0, 1, 0.4117647, 1,
-0.338414, -0.230399, -4.951148, 0, 1, 0.4196078, 1,
-0.3363956, 0.586847, -0.5833164, 0, 1, 0.4235294, 1,
-0.3326082, 0.6446033, 2.816718, 0, 1, 0.4313726, 1,
-0.3304328, -0.7407785, -3.820435, 0, 1, 0.4352941, 1,
-0.3297211, 1.182831, -1.535259, 0, 1, 0.4431373, 1,
-0.3285057, -0.3512946, -3.858062, 0, 1, 0.4470588, 1,
-0.3262937, -1.114081, -3.812854, 0, 1, 0.454902, 1,
-0.3254721, -0.5324753, -4.104771, 0, 1, 0.4588235, 1,
-0.3239929, 0.1862223, 0.4509912, 0, 1, 0.4666667, 1,
-0.3224832, 0.6851458, 0.7326889, 0, 1, 0.4705882, 1,
-0.3197459, 0.4898259, -1.626811, 0, 1, 0.4784314, 1,
-0.3149335, -0.3286284, -1.490615, 0, 1, 0.4823529, 1,
-0.3135925, 0.4020071, -1.411755, 0, 1, 0.4901961, 1,
-0.3104207, 0.9999596, 1.300632, 0, 1, 0.4941176, 1,
-0.3065622, -0.6721536, -0.4062861, 0, 1, 0.5019608, 1,
-0.3061517, -0.7692012, -3.821708, 0, 1, 0.509804, 1,
-0.300826, -0.7941587, -3.983386, 0, 1, 0.5137255, 1,
-0.2992421, -1.104922, -2.232442, 0, 1, 0.5215687, 1,
-0.2954425, 1.48933, -2.620002, 0, 1, 0.5254902, 1,
-0.2930701, -0.9411963, -3.352267, 0, 1, 0.5333334, 1,
-0.2922224, 0.48217, -1.129056, 0, 1, 0.5372549, 1,
-0.2876322, 0.2891807, -2.03941, 0, 1, 0.5450981, 1,
-0.2874952, -1.230924, -2.873179, 0, 1, 0.5490196, 1,
-0.2862942, 1.281838, -0.9077161, 0, 1, 0.5568628, 1,
-0.2839088, 0.8239014, 0.02291754, 0, 1, 0.5607843, 1,
-0.2826748, 0.8993072, -0.127221, 0, 1, 0.5686275, 1,
-0.2741509, -0.04996059, -0.9015819, 0, 1, 0.572549, 1,
-0.2681655, 1.903005, -0.01347066, 0, 1, 0.5803922, 1,
-0.2679189, 0.9111339, -2.768749, 0, 1, 0.5843138, 1,
-0.2656456, 0.5307809, -0.4134785, 0, 1, 0.5921569, 1,
-0.2640479, 0.529366, 0.6328002, 0, 1, 0.5960785, 1,
-0.2624227, -0.7053438, -2.121725, 0, 1, 0.6039216, 1,
-0.2576737, -0.2733991, -1.039829, 0, 1, 0.6117647, 1,
-0.2509601, -0.3137451, -2.020974, 0, 1, 0.6156863, 1,
-0.2506484, -1.831254, -2.127282, 0, 1, 0.6235294, 1,
-0.248748, -1.262436, -3.970063, 0, 1, 0.627451, 1,
-0.2456119, -1.108174, -1.61149, 0, 1, 0.6352941, 1,
-0.2423873, -0.05984585, -1.450935, 0, 1, 0.6392157, 1,
-0.2416391, 0.3074041, 0.7728797, 0, 1, 0.6470588, 1,
-0.2329077, 0.1983995, 0.5651382, 0, 1, 0.6509804, 1,
-0.2324882, -0.3873681, -3.075515, 0, 1, 0.6588235, 1,
-0.2307902, 0.4602002, -1.207904, 0, 1, 0.6627451, 1,
-0.2252563, 1.949432, -1.344539, 0, 1, 0.6705883, 1,
-0.2220616, 0.8434386, -0.3080901, 0, 1, 0.6745098, 1,
-0.21765, 0.6276309, -0.7162701, 0, 1, 0.682353, 1,
-0.210401, -1.616536, -2.991481, 0, 1, 0.6862745, 1,
-0.2010871, 0.9985693, -0.732092, 0, 1, 0.6941177, 1,
-0.20001, 1.60478, -0.4623734, 0, 1, 0.7019608, 1,
-0.1981198, 0.5265728, -0.2808094, 0, 1, 0.7058824, 1,
-0.1943809, -0.2020199, -1.710808, 0, 1, 0.7137255, 1,
-0.1918967, -0.6741173, -3.402838, 0, 1, 0.7176471, 1,
-0.1894264, 1.421223, 0.558748, 0, 1, 0.7254902, 1,
-0.1873792, 0.4216836, 0.6662228, 0, 1, 0.7294118, 1,
-0.1855865, -0.9052272, -1.335684, 0, 1, 0.7372549, 1,
-0.184141, -0.1981192, -1.456278, 0, 1, 0.7411765, 1,
-0.1830231, -0.6321542, -4.400426, 0, 1, 0.7490196, 1,
-0.1817107, 1.341217, -0.5007676, 0, 1, 0.7529412, 1,
-0.1793328, -0.4025159, -1.535328, 0, 1, 0.7607843, 1,
-0.1763479, -1.806414, -3.700425, 0, 1, 0.7647059, 1,
-0.1757035, 0.7486788, -1.585427, 0, 1, 0.772549, 1,
-0.1736439, -2.413957, -3.655141, 0, 1, 0.7764706, 1,
-0.1729896, -0.8100129, -3.0646, 0, 1, 0.7843137, 1,
-0.1727369, 0.7206787, -0.7402084, 0, 1, 0.7882353, 1,
-0.1695334, -0.3637669, -3.832576, 0, 1, 0.7960784, 1,
-0.1616728, -0.133687, -2.006681, 0, 1, 0.8039216, 1,
-0.1578029, -0.6655532, -2.115581, 0, 1, 0.8078431, 1,
-0.1548771, 0.02594531, -1.520846, 0, 1, 0.8156863, 1,
-0.1540084, 0.6363919, -0.6510621, 0, 1, 0.8196079, 1,
-0.1526145, 0.668413, 1.214867, 0, 1, 0.827451, 1,
-0.1422938, 1.03937, 0.3208639, 0, 1, 0.8313726, 1,
-0.140731, -0.1369174, -3.292426, 0, 1, 0.8392157, 1,
-0.1355964, 0.2310367, -2.398015, 0, 1, 0.8431373, 1,
-0.1344356, -0.1664246, -2.420572, 0, 1, 0.8509804, 1,
-0.1317697, -0.8614267, -4.058784, 0, 1, 0.854902, 1,
-0.1247799, 1.297891, 0.5569051, 0, 1, 0.8627451, 1,
-0.1226907, 0.3741803, 0.6497982, 0, 1, 0.8666667, 1,
-0.1213019, -0.5117387, -1.955967, 0, 1, 0.8745098, 1,
-0.120805, 0.9286059, -0.7773209, 0, 1, 0.8784314, 1,
-0.1200809, -1.640669, -2.093122, 0, 1, 0.8862745, 1,
-0.118628, -0.09183496, -2.119516, 0, 1, 0.8901961, 1,
-0.118448, -0.1093633, -4.689773, 0, 1, 0.8980392, 1,
-0.1139406, 2.140174, -0.6077587, 0, 1, 0.9058824, 1,
-0.1051419, -0.0816206, -3.363734, 0, 1, 0.9098039, 1,
-0.1029349, 0.03474813, -0.996904, 0, 1, 0.9176471, 1,
-0.1012279, -0.2071456, -2.674102, 0, 1, 0.9215686, 1,
-0.09941838, -1.116814, -2.454798, 0, 1, 0.9294118, 1,
-0.09918454, 2.208354, -0.6563012, 0, 1, 0.9333333, 1,
-0.09786707, -1.7547, -3.7181, 0, 1, 0.9411765, 1,
-0.09771068, -1.13582, -2.912767, 0, 1, 0.945098, 1,
-0.09653122, -0.5931311, -3.175257, 0, 1, 0.9529412, 1,
-0.09028248, -0.780506, -4.749798, 0, 1, 0.9568627, 1,
-0.08690362, 0.2194495, -0.8579739, 0, 1, 0.9647059, 1,
-0.0848455, -0.6578223, -3.645888, 0, 1, 0.9686275, 1,
-0.08309661, 1.534622, -1.897153, 0, 1, 0.9764706, 1,
-0.0799227, 0.6997079, 0.8242542, 0, 1, 0.9803922, 1,
-0.07880975, -0.02087532, -2.410208, 0, 1, 0.9882353, 1,
-0.0762132, -0.1914813, -3.897719, 0, 1, 0.9921569, 1,
-0.07377518, 0.4516796, -1.754929, 0, 1, 1, 1,
-0.07269228, 0.4387218, 0.04235045, 0, 0.9921569, 1, 1,
-0.07267325, 0.87098, -0.572758, 0, 0.9882353, 1, 1,
-0.07083564, -0.6819689, -3.230263, 0, 0.9803922, 1, 1,
-0.06776007, 0.9864749, -1.296644, 0, 0.9764706, 1, 1,
-0.0613482, 0.8789082, 2.244685, 0, 0.9686275, 1, 1,
-0.06099016, -0.714154, -2.469964, 0, 0.9647059, 1, 1,
-0.05961427, -1.405777, -1.733706, 0, 0.9568627, 1, 1,
-0.0595779, 1.143117, -2.118621, 0, 0.9529412, 1, 1,
-0.05689002, 0.4512594, 0.404176, 0, 0.945098, 1, 1,
-0.05417688, -1.678205, -2.258004, 0, 0.9411765, 1, 1,
-0.05091938, 1.108725, -0.3336269, 0, 0.9333333, 1, 1,
-0.0491645, 1.302791, -0.6868319, 0, 0.9294118, 1, 1,
-0.04831519, 0.3227652, -1.150949, 0, 0.9215686, 1, 1,
-0.04412877, 0.9654777, -0.4668596, 0, 0.9176471, 1, 1,
-0.03636776, -0.08321507, -3.053726, 0, 0.9098039, 1, 1,
-0.0338059, 0.00987916, -2.306147, 0, 0.9058824, 1, 1,
-0.02748657, 0.04596346, -1.686837, 0, 0.8980392, 1, 1,
-0.02730679, -0.5783961, -1.788663, 0, 0.8901961, 1, 1,
-0.02624247, 1.807447, -0.8940575, 0, 0.8862745, 1, 1,
-0.02467383, -0.03177097, -2.7968, 0, 0.8784314, 1, 1,
-0.0240141, -0.1720902, -4.002667, 0, 0.8745098, 1, 1,
-0.02382907, 1.250782, -1.05233, 0, 0.8666667, 1, 1,
-0.02366927, -0.5363569, -2.352532, 0, 0.8627451, 1, 1,
-0.01998301, 0.1861045, 0.1867627, 0, 0.854902, 1, 1,
-0.01368775, 1.13119, 1.183733, 0, 0.8509804, 1, 1,
-0.01346504, -1.186124, -2.786824, 0, 0.8431373, 1, 1,
-0.01290981, 0.4030151, 0.08915238, 0, 0.8392157, 1, 1,
-0.008698136, 0.6510586, 0.8162625, 0, 0.8313726, 1, 1,
-0.006086524, -1.613295, -3.321468, 0, 0.827451, 1, 1,
-0.004116052, 1.411147, -0.8279769, 0, 0.8196079, 1, 1,
-0.003264865, 0.6121104, -1.630924, 0, 0.8156863, 1, 1,
0.002073127, -1.847892, 5.701005, 0, 0.8078431, 1, 1,
0.002642267, 0.4335157, 1.322167, 0, 0.8039216, 1, 1,
0.00303026, 1.144368, -1.385103, 0, 0.7960784, 1, 1,
0.0108049, -1.776539, 3.770609, 0, 0.7882353, 1, 1,
0.01154869, 0.8161774, -0.2510374, 0, 0.7843137, 1, 1,
0.01427483, -0.5109381, 2.25478, 0, 0.7764706, 1, 1,
0.02458249, 1.430751, -0.5836151, 0, 0.772549, 1, 1,
0.02658267, -0.3970939, 2.571531, 0, 0.7647059, 1, 1,
0.02952684, 0.3174127, 0.4837823, 0, 0.7607843, 1, 1,
0.03217347, -0.6479771, 3.712377, 0, 0.7529412, 1, 1,
0.03294879, -0.3436209, 3.949917, 0, 0.7490196, 1, 1,
0.03474992, -0.720945, 4.597479, 0, 0.7411765, 1, 1,
0.03536375, 1.276359, -1.106429, 0, 0.7372549, 1, 1,
0.04100681, 0.4246614, 1.543336, 0, 0.7294118, 1, 1,
0.04790421, -0.4726754, 2.989008, 0, 0.7254902, 1, 1,
0.05584902, -0.04238552, 4.826174, 0, 0.7176471, 1, 1,
0.0585723, -0.3562897, 3.715067, 0, 0.7137255, 1, 1,
0.06271839, -0.5555854, 2.943804, 0, 0.7058824, 1, 1,
0.06370272, -1.177021, 3.955214, 0, 0.6980392, 1, 1,
0.06738973, 0.03016486, 2.280551, 0, 0.6941177, 1, 1,
0.06877095, 0.0862599, 0.7547627, 0, 0.6862745, 1, 1,
0.07264992, -1.092941, 4.033452, 0, 0.682353, 1, 1,
0.08053947, 1.218666, -0.6259362, 0, 0.6745098, 1, 1,
0.08269522, -0.4213707, 5.2295, 0, 0.6705883, 1, 1,
0.0834287, -0.3080992, 2.46701, 0, 0.6627451, 1, 1,
0.09364658, -0.6091973, 2.352613, 0, 0.6588235, 1, 1,
0.0949708, 1.476022, 0.9846581, 0, 0.6509804, 1, 1,
0.09764733, 3.309434, 1.389134, 0, 0.6470588, 1, 1,
0.1016517, 0.604217, -3.116447, 0, 0.6392157, 1, 1,
0.1088238, -3.075623, 2.978615, 0, 0.6352941, 1, 1,
0.1131418, 1.07762, -1.525069, 0, 0.627451, 1, 1,
0.1139853, 0.8897176, 1.561494, 0, 0.6235294, 1, 1,
0.1153795, -1.298165, 2.289572, 0, 0.6156863, 1, 1,
0.1191976, -0.6891516, 2.157458, 0, 0.6117647, 1, 1,
0.1231757, -2.14571, 2.77448, 0, 0.6039216, 1, 1,
0.128015, -0.7325875, 4.039948, 0, 0.5960785, 1, 1,
0.1315353, 1.346164, -2.759019, 0, 0.5921569, 1, 1,
0.1413159, 0.920395, 0.7886175, 0, 0.5843138, 1, 1,
0.1434093, 0.01792559, 1.275165, 0, 0.5803922, 1, 1,
0.1460028, -0.2049705, 2.649172, 0, 0.572549, 1, 1,
0.1463676, -1.591919, 2.643606, 0, 0.5686275, 1, 1,
0.1484924, 0.05971875, -0.2374007, 0, 0.5607843, 1, 1,
0.1536783, -0.9395175, 2.509821, 0, 0.5568628, 1, 1,
0.1621256, -1.131084, 3.241393, 0, 0.5490196, 1, 1,
0.1621384, 0.4247805, 0.7733736, 0, 0.5450981, 1, 1,
0.1650148, 0.5192505, 1.330009, 0, 0.5372549, 1, 1,
0.1662593, 1.094548, 1.537457, 0, 0.5333334, 1, 1,
0.1707412, 0.2096201, 1.478208, 0, 0.5254902, 1, 1,
0.1807517, 0.5238807, -0.8050617, 0, 0.5215687, 1, 1,
0.1819085, -0.6643073, 1.199456, 0, 0.5137255, 1, 1,
0.1894283, -0.8849734, 2.052294, 0, 0.509804, 1, 1,
0.1931044, -0.4823743, 4.072833, 0, 0.5019608, 1, 1,
0.1964413, 1.000029, -0.06695675, 0, 0.4941176, 1, 1,
0.1987598, 1.073792, -0.1754911, 0, 0.4901961, 1, 1,
0.1998769, 1.302483, 1.09779, 0, 0.4823529, 1, 1,
0.2005108, -0.5154484, 2.410652, 0, 0.4784314, 1, 1,
0.2033532, -0.07699146, 3.006959, 0, 0.4705882, 1, 1,
0.2038794, -1.946908, 2.532208, 0, 0.4666667, 1, 1,
0.2056682, 0.8148937, -1.439915, 0, 0.4588235, 1, 1,
0.2130288, -0.7236931, 0.9588841, 0, 0.454902, 1, 1,
0.2181201, 0.8461744, 1.842575, 0, 0.4470588, 1, 1,
0.2203489, 1.09035, 0.5061146, 0, 0.4431373, 1, 1,
0.2217318, -0.9241421, 3.174314, 0, 0.4352941, 1, 1,
0.222894, -1.372309, 2.968618, 0, 0.4313726, 1, 1,
0.2238764, -0.6706291, 2.950977, 0, 0.4235294, 1, 1,
0.2258012, 0.7209601, 1.272865, 0, 0.4196078, 1, 1,
0.2282705, 0.1275983, 0.145757, 0, 0.4117647, 1, 1,
0.2381485, 0.5205764, 0.1454173, 0, 0.4078431, 1, 1,
0.2405246, 1.408535, 0.9534534, 0, 0.4, 1, 1,
0.2425489, -0.1583415, 3.371013, 0, 0.3921569, 1, 1,
0.2472916, 0.4111319, -1.0151, 0, 0.3882353, 1, 1,
0.2474094, 0.5904342, -1.984047, 0, 0.3803922, 1, 1,
0.2522055, -0.2126778, 1.120721, 0, 0.3764706, 1, 1,
0.2535006, 1.384634, 0.7141848, 0, 0.3686275, 1, 1,
0.2542454, 0.5638878, -0.1402328, 0, 0.3647059, 1, 1,
0.2560248, 0.2219074, -1.524835, 0, 0.3568628, 1, 1,
0.2594526, 0.963553, 0.1642844, 0, 0.3529412, 1, 1,
0.2647811, 0.3477443, 0.0329784, 0, 0.345098, 1, 1,
0.2669498, 0.1383941, 1.23444, 0, 0.3411765, 1, 1,
0.2700123, 1.128144, 3.26555, 0, 0.3333333, 1, 1,
0.2758202, -0.234316, 2.663137, 0, 0.3294118, 1, 1,
0.2787775, -1.05791, 1.898517, 0, 0.3215686, 1, 1,
0.2841093, 0.7429261, 0.9992387, 0, 0.3176471, 1, 1,
0.2877589, -1.601016, 4.512972, 0, 0.3098039, 1, 1,
0.2989553, 0.5941771, 1.12676, 0, 0.3058824, 1, 1,
0.2991221, -1.125301, 4.955513, 0, 0.2980392, 1, 1,
0.2998326, 0.7291083, -0.02529018, 0, 0.2901961, 1, 1,
0.3058594, 0.161251, 1.412691, 0, 0.2862745, 1, 1,
0.307229, -0.1430538, 1.669241, 0, 0.2784314, 1, 1,
0.3080411, 0.3410362, 0.9774271, 0, 0.2745098, 1, 1,
0.3083793, 0.4334127, -0.1172413, 0, 0.2666667, 1, 1,
0.3105024, 0.6277962, 0.8560803, 0, 0.2627451, 1, 1,
0.3112449, -0.6076717, 1.825195, 0, 0.254902, 1, 1,
0.3121479, 0.8384229, 1.534335, 0, 0.2509804, 1, 1,
0.3147688, -1.222928, 2.233423, 0, 0.2431373, 1, 1,
0.3197624, 1.038674, -0.781179, 0, 0.2392157, 1, 1,
0.3229863, 0.0007367676, 2.581956, 0, 0.2313726, 1, 1,
0.3267901, 0.4964801, -0.2949894, 0, 0.227451, 1, 1,
0.3271657, 0.2134339, 1.786362, 0, 0.2196078, 1, 1,
0.3306483, -1.799889, 1.538643, 0, 0.2156863, 1, 1,
0.3352677, 1.485245, 0.4873596, 0, 0.2078431, 1, 1,
0.3359281, 0.4503523, 0.2745271, 0, 0.2039216, 1, 1,
0.3390297, 0.1139376, -0.2880104, 0, 0.1960784, 1, 1,
0.342718, -0.05296779, 2.06916, 0, 0.1882353, 1, 1,
0.3456017, 0.3178753, 0.5348387, 0, 0.1843137, 1, 1,
0.3477229, 0.4737993, 0.3415793, 0, 0.1764706, 1, 1,
0.3523675, 0.5589662, -0.7628073, 0, 0.172549, 1, 1,
0.3555798, 0.08845554, 3.053714, 0, 0.1647059, 1, 1,
0.3580809, 0.5542289, 1.744045, 0, 0.1607843, 1, 1,
0.363729, 0.09638717, -1.719651, 0, 0.1529412, 1, 1,
0.3694045, 0.04907634, 1.376605, 0, 0.1490196, 1, 1,
0.372651, -0.4569436, 1.578761, 0, 0.1411765, 1, 1,
0.3732896, -1.238246, 2.695268, 0, 0.1372549, 1, 1,
0.3755092, 0.863842, 2.489508, 0, 0.1294118, 1, 1,
0.3762512, -0.8187522, 2.538174, 0, 0.1254902, 1, 1,
0.3771031, 0.08669934, 1.907305, 0, 0.1176471, 1, 1,
0.3802183, 0.3119727, 1.321198, 0, 0.1137255, 1, 1,
0.3864057, -0.7121625, 2.923626, 0, 0.1058824, 1, 1,
0.3887453, -0.0414762, 1.641895, 0, 0.09803922, 1, 1,
0.390816, -2.406738, 2.872922, 0, 0.09411765, 1, 1,
0.3909111, 1.478753, -0.07186035, 0, 0.08627451, 1, 1,
0.3914089, 1.280627, 0.5265916, 0, 0.08235294, 1, 1,
0.4030978, -0.652253, 2.184495, 0, 0.07450981, 1, 1,
0.403839, -0.6441358, 2.783483, 0, 0.07058824, 1, 1,
0.4058862, 0.2673755, -0.1383987, 0, 0.0627451, 1, 1,
0.4066769, -1.262544, 2.473981, 0, 0.05882353, 1, 1,
0.4067238, 1.2647, 0.3886847, 0, 0.05098039, 1, 1,
0.407031, -0.6147314, 1.70955, 0, 0.04705882, 1, 1,
0.4071731, 1.788397, -0.6961758, 0, 0.03921569, 1, 1,
0.4097616, -2.449415, 4.346919, 0, 0.03529412, 1, 1,
0.4102326, -1.500024, 3.7609, 0, 0.02745098, 1, 1,
0.4110734, -1.093444, 3.919769, 0, 0.02352941, 1, 1,
0.4119005, -0.1230024, 0.5338586, 0, 0.01568628, 1, 1,
0.4151492, -0.2482524, 2.233503, 0, 0.01176471, 1, 1,
0.4164125, -0.1037121, 0.2834966, 0, 0.003921569, 1, 1,
0.4206351, -0.4175385, 1.4105, 0.003921569, 0, 1, 1,
0.4229394, 0.1279124, 2.062098, 0.007843138, 0, 1, 1,
0.4317811, 0.1318368, 1.188482, 0.01568628, 0, 1, 1,
0.4320049, 0.5638477, 0.895184, 0.01960784, 0, 1, 1,
0.434316, -0.5247966, 2.13306, 0.02745098, 0, 1, 1,
0.4375346, -0.93643, 1.045223, 0.03137255, 0, 1, 1,
0.4412512, 0.4362783, 0.4524277, 0.03921569, 0, 1, 1,
0.4416103, 0.963506, 2.266109, 0.04313726, 0, 1, 1,
0.4472215, -2.060308, 4.977657, 0.05098039, 0, 1, 1,
0.4496287, -1.194569, 2.828838, 0.05490196, 0, 1, 1,
0.450527, -0.1257069, 2.45965, 0.0627451, 0, 1, 1,
0.4527082, 0.7722314, -0.601136, 0.06666667, 0, 1, 1,
0.4535293, -1.069776, 1.570407, 0.07450981, 0, 1, 1,
0.4540764, -0.7531564, 3.032774, 0.07843138, 0, 1, 1,
0.4563367, 0.8458162, 0.07842872, 0.08627451, 0, 1, 1,
0.45793, -0.2479947, 1.575753, 0.09019608, 0, 1, 1,
0.4623857, -0.1654644, 0.3646019, 0.09803922, 0, 1, 1,
0.4638544, -1.649108, 1.024502, 0.1058824, 0, 1, 1,
0.4655691, 0.3767704, 0.5978925, 0.1098039, 0, 1, 1,
0.4694901, -1.736262, 3.505789, 0.1176471, 0, 1, 1,
0.4697089, 2.993696, -0.170756, 0.1215686, 0, 1, 1,
0.4743042, 0.6054603, -0.1129884, 0.1294118, 0, 1, 1,
0.4752212, -0.2905517, 1.596389, 0.1333333, 0, 1, 1,
0.4796664, 1.192739, 1.301668, 0.1411765, 0, 1, 1,
0.4813097, 0.9017255, -0.4583547, 0.145098, 0, 1, 1,
0.4840655, 0.598096, -0.1902988, 0.1529412, 0, 1, 1,
0.488555, -0.01830254, 0.9585295, 0.1568628, 0, 1, 1,
0.5016581, 0.03077853, 1.860944, 0.1647059, 0, 1, 1,
0.5076451, 1.339613, 1.722355, 0.1686275, 0, 1, 1,
0.5086561, -1.78256, 2.046992, 0.1764706, 0, 1, 1,
0.5117192, -1.923514, 2.22618, 0.1803922, 0, 1, 1,
0.5127553, -0.2308365, 3.051927, 0.1882353, 0, 1, 1,
0.5164035, 0.3239073, 1.377124, 0.1921569, 0, 1, 1,
0.517905, -0.5192699, 0.7486663, 0.2, 0, 1, 1,
0.5183489, 0.03133648, 1.534655, 0.2078431, 0, 1, 1,
0.5202361, 0.9871131, -1.053479, 0.2117647, 0, 1, 1,
0.520552, -0.4968869, 0.1884738, 0.2196078, 0, 1, 1,
0.5218792, -1.542106, 3.330625, 0.2235294, 0, 1, 1,
0.522269, -1.721362, 3.445726, 0.2313726, 0, 1, 1,
0.5224894, 0.6571921, 1.17673, 0.2352941, 0, 1, 1,
0.5268633, -1.466304, 2.085869, 0.2431373, 0, 1, 1,
0.5269485, 0.4668253, 0.9358319, 0.2470588, 0, 1, 1,
0.5275152, -0.4931622, 4.019966, 0.254902, 0, 1, 1,
0.5303019, 0.7547719, -0.2257395, 0.2588235, 0, 1, 1,
0.5318488, -0.08780106, 1.067706, 0.2666667, 0, 1, 1,
0.5324948, -1.079047, 1.982793, 0.2705882, 0, 1, 1,
0.5335274, -0.4912887, 0.4528519, 0.2784314, 0, 1, 1,
0.534242, -0.1721707, 0.4809125, 0.282353, 0, 1, 1,
0.5344719, 2.13686, 0.2362499, 0.2901961, 0, 1, 1,
0.5348128, 0.4626424, 1.127592, 0.2941177, 0, 1, 1,
0.535471, -0.0334137, 1.433001, 0.3019608, 0, 1, 1,
0.5378043, -0.8777571, 1.336995, 0.3098039, 0, 1, 1,
0.5378203, 1.024716, -0.5571584, 0.3137255, 0, 1, 1,
0.5403471, 0.7317518, 0.07489046, 0.3215686, 0, 1, 1,
0.5472769, -1.465324, 4.075511, 0.3254902, 0, 1, 1,
0.5505067, 0.3708348, 0.5444962, 0.3333333, 0, 1, 1,
0.5528204, -0.500263, 2.525278, 0.3372549, 0, 1, 1,
0.5576754, -1.191813, 2.153224, 0.345098, 0, 1, 1,
0.5661674, 0.6356562, -1.47027, 0.3490196, 0, 1, 1,
0.5675772, -0.4122934, 0.8929917, 0.3568628, 0, 1, 1,
0.5726489, 0.7866207, 2.232918, 0.3607843, 0, 1, 1,
0.5727539, -1.576316, 4.121881, 0.3686275, 0, 1, 1,
0.5856407, -0.1189682, 2.423887, 0.372549, 0, 1, 1,
0.5863366, -0.8348437, 1.768164, 0.3803922, 0, 1, 1,
0.593514, 1.60756, 1.028034, 0.3843137, 0, 1, 1,
0.5939022, -0.9943096, 4.22913, 0.3921569, 0, 1, 1,
0.5964146, -0.3552682, 1.86121, 0.3960784, 0, 1, 1,
0.5995939, -0.4378452, 2.440946, 0.4039216, 0, 1, 1,
0.601381, -1.236927, 2.87573, 0.4117647, 0, 1, 1,
0.6014488, -2.027195, 2.555829, 0.4156863, 0, 1, 1,
0.6017226, -1.076894, 2.624837, 0.4235294, 0, 1, 1,
0.6073118, -2.505733, 2.884536, 0.427451, 0, 1, 1,
0.6129656, 2.197432, -0.005141057, 0.4352941, 0, 1, 1,
0.6149136, -0.168736, 2.399106, 0.4392157, 0, 1, 1,
0.6161841, -0.718305, 2.134705, 0.4470588, 0, 1, 1,
0.6166605, -0.4771001, 3.508506, 0.4509804, 0, 1, 1,
0.6185442, 0.2223308, 3.007496, 0.4588235, 0, 1, 1,
0.6205353, 0.8372315, 0.5573934, 0.4627451, 0, 1, 1,
0.6214211, 0.4268386, 1.643379, 0.4705882, 0, 1, 1,
0.6217395, -0.4636107, 0.9901827, 0.4745098, 0, 1, 1,
0.6267701, 1.519325, -0.07374957, 0.4823529, 0, 1, 1,
0.635573, -1.625738, 2.066232, 0.4862745, 0, 1, 1,
0.6367094, -0.1687777, 1.372587, 0.4941176, 0, 1, 1,
0.6386415, 0.3712637, 1.266353, 0.5019608, 0, 1, 1,
0.6397038, 0.2056787, 1.11689, 0.5058824, 0, 1, 1,
0.6437216, 0.9378924, 0.6103581, 0.5137255, 0, 1, 1,
0.6449088, -0.3050916, 3.632505, 0.5176471, 0, 1, 1,
0.6478574, -1.061805, 2.969035, 0.5254902, 0, 1, 1,
0.6557497, 1.369383, 0.939985, 0.5294118, 0, 1, 1,
0.657861, 0.849569, -0.1658917, 0.5372549, 0, 1, 1,
0.6624177, 0.194763, 0.6195967, 0.5411765, 0, 1, 1,
0.6650511, -0.7140732, 2.771622, 0.5490196, 0, 1, 1,
0.6766604, 1.098253, -1.263424, 0.5529412, 0, 1, 1,
0.6832233, -2.303085, 2.229348, 0.5607843, 0, 1, 1,
0.6861001, -0.5856286, 1.846511, 0.5647059, 0, 1, 1,
0.6912441, -0.3029337, 1.762116, 0.572549, 0, 1, 1,
0.6962261, 0.6917683, -0.2132256, 0.5764706, 0, 1, 1,
0.6962504, 0.8477423, 1.280191, 0.5843138, 0, 1, 1,
0.6962567, 0.6809465, 1.994361, 0.5882353, 0, 1, 1,
0.6972168, -1.263712, 2.819518, 0.5960785, 0, 1, 1,
0.6995235, -0.6084207, 2.393099, 0.6039216, 0, 1, 1,
0.7100016, -0.7802818, 3.643, 0.6078432, 0, 1, 1,
0.7145265, -1.676361, 2.63926, 0.6156863, 0, 1, 1,
0.7156201, -0.7488843, 0.2705247, 0.6196079, 0, 1, 1,
0.7192553, 0.09586727, 2.310847, 0.627451, 0, 1, 1,
0.728392, -2.039571, 2.928482, 0.6313726, 0, 1, 1,
0.7290711, 0.8545461, 0.5567224, 0.6392157, 0, 1, 1,
0.7298976, 1.708891, 0.9462468, 0.6431373, 0, 1, 1,
0.7302679, 0.7229015, -1.052869, 0.6509804, 0, 1, 1,
0.7333429, -0.8823206, 3.758793, 0.654902, 0, 1, 1,
0.7357618, 1.097695, 1.689762, 0.6627451, 0, 1, 1,
0.7390016, -0.5290241, 1.495214, 0.6666667, 0, 1, 1,
0.73969, -1.252676, 1.983985, 0.6745098, 0, 1, 1,
0.7410011, -0.6820861, 2.900118, 0.6784314, 0, 1, 1,
0.7487541, -0.09403458, 1.920243, 0.6862745, 0, 1, 1,
0.7500841, 0.8456268, 0.05279414, 0.6901961, 0, 1, 1,
0.7528106, 1.546556, 1.03166, 0.6980392, 0, 1, 1,
0.7541724, 0.5599331, -0.4064923, 0.7058824, 0, 1, 1,
0.7610073, -0.3676955, 1.161295, 0.7098039, 0, 1, 1,
0.7638146, 0.9313678, 1.408055, 0.7176471, 0, 1, 1,
0.7669116, -1.444894, 2.362774, 0.7215686, 0, 1, 1,
0.7672582, 1.217577, -0.7627383, 0.7294118, 0, 1, 1,
0.7698553, 0.2676832, 2.521084, 0.7333333, 0, 1, 1,
0.7698729, -1.047048, 3.65872, 0.7411765, 0, 1, 1,
0.7722147, 0.7079589, 1.790711, 0.7450981, 0, 1, 1,
0.7764466, 1.068663, 1.03776, 0.7529412, 0, 1, 1,
0.7793507, 0.09708982, 1.576123, 0.7568628, 0, 1, 1,
0.7867116, -0.06630753, 1.392462, 0.7647059, 0, 1, 1,
0.7873412, -0.5878868, 3.132928, 0.7686275, 0, 1, 1,
0.7924814, 1.761151, 0.3352536, 0.7764706, 0, 1, 1,
0.7957731, 0.9390576, 1.284375, 0.7803922, 0, 1, 1,
0.7965959, 0.2697334, 2.004062, 0.7882353, 0, 1, 1,
0.798833, -1.081205, 2.960504, 0.7921569, 0, 1, 1,
0.7992715, -0.5204934, 2.235137, 0.8, 0, 1, 1,
0.8018726, 0.02082402, 2.189816, 0.8078431, 0, 1, 1,
0.8037525, -0.2585384, 1.870103, 0.8117647, 0, 1, 1,
0.8112493, -1.758508, 2.225916, 0.8196079, 0, 1, 1,
0.8138667, 1.292864, 0.007249654, 0.8235294, 0, 1, 1,
0.8148382, -0.7982627, 1.496942, 0.8313726, 0, 1, 1,
0.8227125, 0.06102002, 3.492081, 0.8352941, 0, 1, 1,
0.8227571, 0.2457205, -0.2217463, 0.8431373, 0, 1, 1,
0.8249778, -0.6699211, 3.459349, 0.8470588, 0, 1, 1,
0.8321828, -1.2639, 4.256707, 0.854902, 0, 1, 1,
0.833089, -0.06532053, 1.911363, 0.8588235, 0, 1, 1,
0.8337454, -1.617191, 3.229441, 0.8666667, 0, 1, 1,
0.8364682, -0.2482377, 0.2316633, 0.8705882, 0, 1, 1,
0.8398343, 0.4421151, 0.5038554, 0.8784314, 0, 1, 1,
0.8440076, 1.148663, 3.329632, 0.8823529, 0, 1, 1,
0.8462514, 0.5117757, -0.4799871, 0.8901961, 0, 1, 1,
0.8469261, -0.9724393, 1.966517, 0.8941177, 0, 1, 1,
0.850267, 1.03404, 0.7495086, 0.9019608, 0, 1, 1,
0.8554693, -2.543258, 3.034466, 0.9098039, 0, 1, 1,
0.8571159, -1.342346, 1.484899, 0.9137255, 0, 1, 1,
0.861696, -0.8624914, 2.074574, 0.9215686, 0, 1, 1,
0.8656896, -1.540236, 2.213863, 0.9254902, 0, 1, 1,
0.8663463, 0.4686342, 1.190667, 0.9333333, 0, 1, 1,
0.8754549, -0.7157228, 3.789542, 0.9372549, 0, 1, 1,
0.8756989, 1.057082, 0.3005053, 0.945098, 0, 1, 1,
0.8818589, -0.5424816, 2.389925, 0.9490196, 0, 1, 1,
0.8835401, 0.2195913, 0.5949697, 0.9568627, 0, 1, 1,
0.8866259, -0.816766, 3.171593, 0.9607843, 0, 1, 1,
0.902813, -1.401219, 3.675679, 0.9686275, 0, 1, 1,
0.9063141, 0.1065656, 1.957312, 0.972549, 0, 1, 1,
0.906474, 2.173951, 0.2049334, 0.9803922, 0, 1, 1,
0.9104878, 0.6054573, 2.406945, 0.9843137, 0, 1, 1,
0.9186858, -0.7217574, 3.510766, 0.9921569, 0, 1, 1,
0.9260702, -1.405631, 2.401153, 0.9960784, 0, 1, 1,
0.929906, 1.057144, 0.1775589, 1, 0, 0.9960784, 1,
0.9312949, -0.7204554, 3.458154, 1, 0, 0.9882353, 1,
0.9378377, 0.5712825, 1.920361, 1, 0, 0.9843137, 1,
0.940456, 0.9252692, 0.2108115, 1, 0, 0.9764706, 1,
0.945861, -1.448939, 3.149204, 1, 0, 0.972549, 1,
0.9513412, 1.231845, -0.7598361, 1, 0, 0.9647059, 1,
0.9524861, 1.062806, 0.2808473, 1, 0, 0.9607843, 1,
0.952507, 0.9575443, -0.1679884, 1, 0, 0.9529412, 1,
0.9556754, -0.5866855, 2.275143, 1, 0, 0.9490196, 1,
0.9669927, -1.115513, 3.59301, 1, 0, 0.9411765, 1,
0.9704733, 0.08761408, 0.5803688, 1, 0, 0.9372549, 1,
0.9830843, -0.05807086, 3.53168, 1, 0, 0.9294118, 1,
0.9863049, -2.271908, 4.176962, 1, 0, 0.9254902, 1,
0.9866258, -0.4452252, 2.081506, 1, 0, 0.9176471, 1,
0.9867622, 0.5272789, 1.135289, 1, 0, 0.9137255, 1,
0.9878767, 1.165774, 0.08797844, 1, 0, 0.9058824, 1,
0.9909265, 1.893238, 0.4289456, 1, 0, 0.9019608, 1,
0.9912827, 1.141294, -0.7330468, 1, 0, 0.8941177, 1,
0.9967281, 0.5889646, -0.6559271, 1, 0, 0.8862745, 1,
1.006541, -0.764348, 3.540684, 1, 0, 0.8823529, 1,
1.009503, -0.1980601, 2.497573, 1, 0, 0.8745098, 1,
1.014835, 0.3979693, 0.007457698, 1, 0, 0.8705882, 1,
1.021634, -0.2875023, 1.347619, 1, 0, 0.8627451, 1,
1.022615, 0.6605131, 1.607763, 1, 0, 0.8588235, 1,
1.025298, -0.1965545, 1.724841, 1, 0, 0.8509804, 1,
1.027471, -1.471665, 2.730948, 1, 0, 0.8470588, 1,
1.031356, -0.4057217, 0.4437816, 1, 0, 0.8392157, 1,
1.044266, -1.580935, 2.215091, 1, 0, 0.8352941, 1,
1.047715, -0.1249432, 0.8765561, 1, 0, 0.827451, 1,
1.048286, 0.870893, -0.428562, 1, 0, 0.8235294, 1,
1.063498, -0.6858675, 2.852568, 1, 0, 0.8156863, 1,
1.085378, 1.620808, -1.042729, 1, 0, 0.8117647, 1,
1.087097, 1.14964, 0.9609601, 1, 0, 0.8039216, 1,
1.08726, -3.026767, 3.198149, 1, 0, 0.7960784, 1,
1.088099, -0.03158402, 3.65383, 1, 0, 0.7921569, 1,
1.097378, 0.1905779, 1.492227, 1, 0, 0.7843137, 1,
1.097595, 0.03121561, 3.268098, 1, 0, 0.7803922, 1,
1.098423, -1.000245, 1.950497, 1, 0, 0.772549, 1,
1.101367, -0.2975486, 0.6526174, 1, 0, 0.7686275, 1,
1.103216, 1.793211, 0.4267953, 1, 0, 0.7607843, 1,
1.107978, -0.02785779, 0.8247173, 1, 0, 0.7568628, 1,
1.10856, 0.3755776, 0.4654489, 1, 0, 0.7490196, 1,
1.113039, -0.2735218, 3.458206, 1, 0, 0.7450981, 1,
1.114626, -0.03264766, 3.062405, 1, 0, 0.7372549, 1,
1.119723, 0.7879477, 2.400097, 1, 0, 0.7333333, 1,
1.128275, -0.02541856, 1.538707, 1, 0, 0.7254902, 1,
1.131911, 1.27641, 0.821915, 1, 0, 0.7215686, 1,
1.141103, 0.7309864, -0.2713447, 1, 0, 0.7137255, 1,
1.144695, -0.4294451, 4.351005, 1, 0, 0.7098039, 1,
1.14736, -0.3569967, 1.930913, 1, 0, 0.7019608, 1,
1.157004, -0.5905273, 1.430591, 1, 0, 0.6941177, 1,
1.162643, -0.7287188, 1.880315, 1, 0, 0.6901961, 1,
1.166581, 2.515173, 0.05042774, 1, 0, 0.682353, 1,
1.168588, 1.032133, 0.6529806, 1, 0, 0.6784314, 1,
1.176746, -0.7759794, 1.727155, 1, 0, 0.6705883, 1,
1.180089, 1.437174, 1.737677, 1, 0, 0.6666667, 1,
1.183303, 0.06660239, 3.297675, 1, 0, 0.6588235, 1,
1.190988, -0.1207474, 1.961577, 1, 0, 0.654902, 1,
1.194404, 0.3288321, 0.3780007, 1, 0, 0.6470588, 1,
1.203716, -1.492647, 1.872341, 1, 0, 0.6431373, 1,
1.205085, 0.2976114, 0.2781247, 1, 0, 0.6352941, 1,
1.211881, -0.4686211, 2.039327, 1, 0, 0.6313726, 1,
1.224485, 0.6188279, 2.152941, 1, 0, 0.6235294, 1,
1.225148, -2.402602, 2.811366, 1, 0, 0.6196079, 1,
1.226079, 1.785706, 1.10997, 1, 0, 0.6117647, 1,
1.241658, 0.08750989, 1.836432, 1, 0, 0.6078432, 1,
1.250387, -1.029482, 2.404454, 1, 0, 0.6, 1,
1.251258, -1.476664, 2.627724, 1, 0, 0.5921569, 1,
1.255937, -0.5079246, 2.086885, 1, 0, 0.5882353, 1,
1.264966, 0.3101557, 2.211944, 1, 0, 0.5803922, 1,
1.280664, 0.4364412, 1.446802, 1, 0, 0.5764706, 1,
1.281405, -0.2868282, 1.112319, 1, 0, 0.5686275, 1,
1.284469, 1.778569, 1.107095, 1, 0, 0.5647059, 1,
1.285201, -0.03608019, 2.39298, 1, 0, 0.5568628, 1,
1.288322, 0.1458485, 2.498477, 1, 0, 0.5529412, 1,
1.291916, 0.9923377, 0.849637, 1, 0, 0.5450981, 1,
1.308644, -0.5550746, 1.588042, 1, 0, 0.5411765, 1,
1.314465, -0.4732185, 0.8131231, 1, 0, 0.5333334, 1,
1.319366, 0.6249059, 1.290218, 1, 0, 0.5294118, 1,
1.325282, 0.395638, 1.574998, 1, 0, 0.5215687, 1,
1.329029, 0.9427912, 2.020483, 1, 0, 0.5176471, 1,
1.330837, -0.296403, 1.7213, 1, 0, 0.509804, 1,
1.332469, -0.4068513, 2.955361, 1, 0, 0.5058824, 1,
1.332799, -1.192556, 2.781207, 1, 0, 0.4980392, 1,
1.337297, -0.3778427, 2.881857, 1, 0, 0.4901961, 1,
1.353878, 1.498675, 1.095863, 1, 0, 0.4862745, 1,
1.392225, 0.8040966, 2.548998, 1, 0, 0.4784314, 1,
1.392739, 1.118564, 2.194459, 1, 0, 0.4745098, 1,
1.394002, -0.08265435, 0.3131076, 1, 0, 0.4666667, 1,
1.410964, -1.948271, 4.827166, 1, 0, 0.4627451, 1,
1.419172, 1.853937, 1.839815, 1, 0, 0.454902, 1,
1.421141, 1.650524, -0.1232727, 1, 0, 0.4509804, 1,
1.426157, -0.395578, 2.700426, 1, 0, 0.4431373, 1,
1.429138, -0.8131208, 3.553787, 1, 0, 0.4392157, 1,
1.433394, -0.9188358, 2.225964, 1, 0, 0.4313726, 1,
1.44403, 0.3283266, 1.19637, 1, 0, 0.427451, 1,
1.457091, 0.08224241, 1.904399, 1, 0, 0.4196078, 1,
1.46632, -0.000197539, 1.701046, 1, 0, 0.4156863, 1,
1.470501, 1.13471, 1.312119, 1, 0, 0.4078431, 1,
1.489532, 0.97295, 0.5546893, 1, 0, 0.4039216, 1,
1.503697, -1.567942, 2.893399, 1, 0, 0.3960784, 1,
1.509613, -0.4612388, 0.7410878, 1, 0, 0.3882353, 1,
1.51, -0.7299342, 1.749758, 1, 0, 0.3843137, 1,
1.517482, 0.7138319, 1.52613, 1, 0, 0.3764706, 1,
1.517669, -1.726293, 3.375362, 1, 0, 0.372549, 1,
1.521277, -1.268026, 1.689661, 1, 0, 0.3647059, 1,
1.524368, 1.18856, 1.281515, 1, 0, 0.3607843, 1,
1.529442, -0.008737196, 2.130686, 1, 0, 0.3529412, 1,
1.549591, -1.595786, 2.666848, 1, 0, 0.3490196, 1,
1.553727, -0.3452628, 1.761765, 1, 0, 0.3411765, 1,
1.560231, 0.1264628, 2.427593, 1, 0, 0.3372549, 1,
1.57673, 0.7573543, 2.165357, 1, 0, 0.3294118, 1,
1.591596, -0.2913731, 0.1135054, 1, 0, 0.3254902, 1,
1.594682, 1.523139, 2.297403, 1, 0, 0.3176471, 1,
1.617467, 1.273604, 1.669412, 1, 0, 0.3137255, 1,
1.631845, 1.405941, 0.5272828, 1, 0, 0.3058824, 1,
1.666047, -0.9156222, 1.366625, 1, 0, 0.2980392, 1,
1.666678, -1.169641, 2.673225, 1, 0, 0.2941177, 1,
1.680946, 0.8658925, 1.525497, 1, 0, 0.2862745, 1,
1.680948, 1.14496, -0.2315427, 1, 0, 0.282353, 1,
1.687978, 0.4437847, 0.6532577, 1, 0, 0.2745098, 1,
1.692103, -0.05652653, 1.468427, 1, 0, 0.2705882, 1,
1.693593, 0.4342535, 0.4518088, 1, 0, 0.2627451, 1,
1.699147, -0.4817951, 3.650066, 1, 0, 0.2588235, 1,
1.707766, -0.00648208, 1.031586, 1, 0, 0.2509804, 1,
1.715036, -1.370293, 1.002438, 1, 0, 0.2470588, 1,
1.718706, -0.873624, 1.263094, 1, 0, 0.2392157, 1,
1.737091, -0.2638543, 1.406318, 1, 0, 0.2352941, 1,
1.741637, -1.01547, 1.895413, 1, 0, 0.227451, 1,
1.743205, -1.245488, 0.9929301, 1, 0, 0.2235294, 1,
1.745485, 1.313166, 0.535183, 1, 0, 0.2156863, 1,
1.746894, -0.6779192, 1.725336, 1, 0, 0.2117647, 1,
1.750771, -0.3122084, 3.328438, 1, 0, 0.2039216, 1,
1.778252, -1.400405, 2.821494, 1, 0, 0.1960784, 1,
1.802351, -0.1059353, 2.253058, 1, 0, 0.1921569, 1,
1.823883, 1.003306, 0.6692998, 1, 0, 0.1843137, 1,
1.850452, 1.964201, 0.9675858, 1, 0, 0.1803922, 1,
1.867522, 0.2281709, 1.398873, 1, 0, 0.172549, 1,
1.878811, 1.60764, -1.152284, 1, 0, 0.1686275, 1,
1.88019, -1.548767, 4.801932, 1, 0, 0.1607843, 1,
1.903669, -1.385707, 1.892481, 1, 0, 0.1568628, 1,
1.917168, -0.07227658, 0.867321, 1, 0, 0.1490196, 1,
1.920418, -0.8231168, 2.244577, 1, 0, 0.145098, 1,
1.95532, -0.7347696, 3.202912, 1, 0, 0.1372549, 1,
1.961594, 0.4896224, 1.422443, 1, 0, 0.1333333, 1,
2.014774, 0.2631255, 1.450001, 1, 0, 0.1254902, 1,
2.018383, 1.153346, -0.5879695, 1, 0, 0.1215686, 1,
2.065574, -0.2595879, 3.144163, 1, 0, 0.1137255, 1,
2.07772, -1.619115, 3.837798, 1, 0, 0.1098039, 1,
2.082109, -0.8123215, 1.302279, 1, 0, 0.1019608, 1,
2.083909, 0.602897, 1.202511, 1, 0, 0.09411765, 1,
2.08573, -1.629681, 3.286593, 1, 0, 0.09019608, 1,
2.114631, 1.292658, 2.007747, 1, 0, 0.08235294, 1,
2.141453, -1.276528, 3.261698, 1, 0, 0.07843138, 1,
2.151576, -0.2824269, -0.2087403, 1, 0, 0.07058824, 1,
2.191175, -1.02644, 2.144495, 1, 0, 0.06666667, 1,
2.1985, 0.2311698, 0.9431849, 1, 0, 0.05882353, 1,
2.303765, 0.6032571, 1.14555, 1, 0, 0.05490196, 1,
2.308789, -1.720085, 2.003563, 1, 0, 0.04705882, 1,
2.312121, 0.2584186, 1.941364, 1, 0, 0.04313726, 1,
2.500366, 1.003394, 0.6601515, 1, 0, 0.03529412, 1,
2.602084, -0.1909518, 1.856117, 1, 0, 0.03137255, 1,
2.702025, 1.096465, 1.759378, 1, 0, 0.02352941, 1,
2.703233, 0.2243976, 2.230864, 1, 0, 0.01960784, 1,
3.12015, 1.188607, 1.891824, 1, 0, 0.01176471, 1,
3.256959, -0.5554363, 4.653854, 1, 0, 0.007843138, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
// ****** text object 9 ******
var prog9  = gl.createProgram();
gl.attachShader(prog9, getShader( gl, "testglvshader9" ));
gl.attachShader(prog9, getShader( gl, "testglfshader9" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog9, 0, "aPos");
gl.bindAttribLocation(prog9, 1, "aCol");
gl.linkProgram(prog9);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX9 = texinfo.canvasX;
var canvasY9 = texinfo.canvasY;
var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
var texture9 = gl.createTexture();
var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
var sampler9 = gl.getUniformLocation(prog9,"uSampler");
handleLoadedTexture(texture9, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
0.3077047, -4.38515, -6.801826, 0, -0.5, 0.5, 0.5,
0.3077047, -4.38515, -6.801826, 1, -0.5, 0.5, 0.5,
0.3077047, -4.38515, -6.801826, 1, 1.5, 0.5, 0.5,
0.3077047, -4.38515, -6.801826, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf9 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf9 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
var textScaleLoc9 = gl.getUniformLocation(prog9,"textScale");
// ****** text object 10 ******
var prog10  = gl.createProgram();
gl.attachShader(prog10, getShader( gl, "testglvshader10" ));
gl.attachShader(prog10, getShader( gl, "testglfshader10" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog10, 0, "aPos");
gl.bindAttribLocation(prog10, 1, "aCol");
gl.linkProgram(prog10);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX10 = texinfo.canvasX;
var canvasY10 = texinfo.canvasY;
var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
var texture10 = gl.createTexture();
var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
var sampler10 = gl.getUniformLocation(prog10,"uSampler");
handleLoadedTexture(texture10, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.641347, 0.334796, -6.801826, 0, -0.5, 0.5, 0.5,
-3.641347, 0.334796, -6.801826, 1, -0.5, 0.5, 0.5,
-3.641347, 0.334796, -6.801826, 1, 1.5, 0.5, 0.5,
-3.641347, 0.334796, -6.801826, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf10 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf10 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
var textScaleLoc10 = gl.getUniformLocation(prog10,"textScale");
// ****** text object 11 ******
var prog11  = gl.createProgram();
gl.attachShader(prog11, getShader( gl, "testglvshader11" ));
gl.attachShader(prog11, getShader( gl, "testglfshader11" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog11, 0, "aPos");
gl.bindAttribLocation(prog11, 1, "aCol");
gl.linkProgram(prog11);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX11 = texinfo.canvasX;
var canvasY11 = texinfo.canvasY;
var ofsLoc11 = gl.getAttribLocation(prog11, "aOfs");
var texture11 = gl.createTexture();
var texLoc11 = gl.getAttribLocation(prog11, "aTexcoord");
var sampler11 = gl.getUniformLocation(prog11,"uSampler");
handleLoadedTexture(texture11, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.641347, -4.38515, 0.3556304, 0, -0.5, 0.5, 0.5,
-3.641347, -4.38515, 0.3556304, 1, -0.5, 0.5, 0.5,
-3.641347, -4.38515, 0.3556304, 1, 1.5, 0.5, 0.5,
-3.641347, -4.38515, 0.3556304, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf11 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf11 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
var textScaleLoc11 = gl.getUniformLocation(prog11,"textScale");
// ****** lines object 12 ******
var prog12  = gl.createProgram();
gl.attachShader(prog12, getShader( gl, "testglvshader12" ));
gl.attachShader(prog12, getShader( gl, "testglfshader12" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog12, 0, "aPos");
gl.bindAttribLocation(prog12, 1, "aCol");
gl.linkProgram(prog12);
var v=new Float32Array([
-2, -3.295932, -5.150105,
3, -3.295932, -5.150105,
-2, -3.295932, -5.150105,
-2, -3.477468, -5.425392,
-1, -3.295932, -5.150105,
-1, -3.477468, -5.425392,
0, -3.295932, -5.150105,
0, -3.477468, -5.425392,
1, -3.295932, -5.150105,
1, -3.477468, -5.425392,
2, -3.295932, -5.150105,
2, -3.477468, -5.425392,
3, -3.295932, -5.150105,
3, -3.477468, -5.425392
]);
var buf12 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
// ****** text object 13 ******
var prog13  = gl.createProgram();
gl.attachShader(prog13, getShader( gl, "testglvshader13" ));
gl.attachShader(prog13, getShader( gl, "testglfshader13" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog13, 0, "aPos");
gl.bindAttribLocation(prog13, 1, "aCol");
gl.linkProgram(prog13);
var texts = [
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX13 = texinfo.canvasX;
var canvasY13 = texinfo.canvasY;
var ofsLoc13 = gl.getAttribLocation(prog13, "aOfs");
var texture13 = gl.createTexture();
var texLoc13 = gl.getAttribLocation(prog13, "aTexcoord");
var sampler13 = gl.getUniformLocation(prog13,"uSampler");
handleLoadedTexture(texture13, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-2, -3.840541, -5.975965, 0, -0.5, 0.5, 0.5,
-2, -3.840541, -5.975965, 1, -0.5, 0.5, 0.5,
-2, -3.840541, -5.975965, 1, 1.5, 0.5, 0.5,
-2, -3.840541, -5.975965, 0, 1.5, 0.5, 0.5,
-1, -3.840541, -5.975965, 0, -0.5, 0.5, 0.5,
-1, -3.840541, -5.975965, 1, -0.5, 0.5, 0.5,
-1, -3.840541, -5.975965, 1, 1.5, 0.5, 0.5,
-1, -3.840541, -5.975965, 0, 1.5, 0.5, 0.5,
0, -3.840541, -5.975965, 0, -0.5, 0.5, 0.5,
0, -3.840541, -5.975965, 1, -0.5, 0.5, 0.5,
0, -3.840541, -5.975965, 1, 1.5, 0.5, 0.5,
0, -3.840541, -5.975965, 0, 1.5, 0.5, 0.5,
1, -3.840541, -5.975965, 0, -0.5, 0.5, 0.5,
1, -3.840541, -5.975965, 1, -0.5, 0.5, 0.5,
1, -3.840541, -5.975965, 1, 1.5, 0.5, 0.5,
1, -3.840541, -5.975965, 0, 1.5, 0.5, 0.5,
2, -3.840541, -5.975965, 0, -0.5, 0.5, 0.5,
2, -3.840541, -5.975965, 1, -0.5, 0.5, 0.5,
2, -3.840541, -5.975965, 1, 1.5, 0.5, 0.5,
2, -3.840541, -5.975965, 0, 1.5, 0.5, 0.5,
3, -3.840541, -5.975965, 0, -0.5, 0.5, 0.5,
3, -3.840541, -5.975965, 1, -0.5, 0.5, 0.5,
3, -3.840541, -5.975965, 1, 1.5, 0.5, 0.5,
3, -3.840541, -5.975965, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23
]);
var buf13 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf13 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
var textScaleLoc13 = gl.getUniformLocation(prog13,"textScale");
// ****** lines object 14 ******
var prog14  = gl.createProgram();
gl.attachShader(prog14, getShader( gl, "testglvshader14" ));
gl.attachShader(prog14, getShader( gl, "testglfshader14" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog14, 0, "aPos");
gl.bindAttribLocation(prog14, 1, "aCol");
gl.linkProgram(prog14);
var v=new Float32Array([
-2.730027, -2, -5.150105,
-2.730027, 2, -5.150105,
-2.730027, -2, -5.150105,
-2.881914, -2, -5.425392,
-2.730027, 0, -5.150105,
-2.881914, 0, -5.425392,
-2.730027, 2, -5.150105,
-2.881914, 2, -5.425392
]);
var buf14 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
// ****** text object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testglvshader15" ));
gl.attachShader(prog15, getShader( gl, "testglfshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var texts = [
"-2",
"0",
"2"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX15 = texinfo.canvasX;
var canvasY15 = texinfo.canvasY;
var ofsLoc15 = gl.getAttribLocation(prog15, "aOfs");
var texture15 = gl.createTexture();
var texLoc15 = gl.getAttribLocation(prog15, "aTexcoord");
var sampler15 = gl.getUniformLocation(prog15,"uSampler");
handleLoadedTexture(texture15, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.185687, -2, -5.975965, 0, -0.5, 0.5, 0.5,
-3.185687, -2, -5.975965, 1, -0.5, 0.5, 0.5,
-3.185687, -2, -5.975965, 1, 1.5, 0.5, 0.5,
-3.185687, -2, -5.975965, 0, 1.5, 0.5, 0.5,
-3.185687, 0, -5.975965, 0, -0.5, 0.5, 0.5,
-3.185687, 0, -5.975965, 1, -0.5, 0.5, 0.5,
-3.185687, 0, -5.975965, 1, 1.5, 0.5, 0.5,
-3.185687, 0, -5.975965, 0, 1.5, 0.5, 0.5,
-3.185687, 2, -5.975965, 0, -0.5, 0.5, 0.5,
-3.185687, 2, -5.975965, 1, -0.5, 0.5, 0.5,
-3.185687, 2, -5.975965, 1, 1.5, 0.5, 0.5,
-3.185687, 2, -5.975965, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11
]);
var buf15 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf15 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var textScaleLoc15 = gl.getUniformLocation(prog15,"textScale");
// ****** lines object 16 ******
var prog16  = gl.createProgram();
gl.attachShader(prog16, getShader( gl, "testglvshader16" ));
gl.attachShader(prog16, getShader( gl, "testglfshader16" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog16, 0, "aPos");
gl.bindAttribLocation(prog16, 1, "aCol");
gl.linkProgram(prog16);
var v=new Float32Array([
-2.730027, -3.295932, -4,
-2.730027, -3.295932, 4,
-2.730027, -3.295932, -4,
-2.881914, -3.477468, -4,
-2.730027, -3.295932, -2,
-2.881914, -3.477468, -2,
-2.730027, -3.295932, 0,
-2.881914, -3.477468, 0,
-2.730027, -3.295932, 2,
-2.881914, -3.477468, 2,
-2.730027, -3.295932, 4,
-2.881914, -3.477468, 4
]);
var buf16 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testglvshader17" ));
gl.attachShader(prog17, getShader( gl, "testglfshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
"-4",
"-2",
"0",
"2",
"4"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.185687, -3.840541, -4, 0, -0.5, 0.5, 0.5,
-3.185687, -3.840541, -4, 1, -0.5, 0.5, 0.5,
-3.185687, -3.840541, -4, 1, 1.5, 0.5, 0.5,
-3.185687, -3.840541, -4, 0, 1.5, 0.5, 0.5,
-3.185687, -3.840541, -2, 0, -0.5, 0.5, 0.5,
-3.185687, -3.840541, -2, 1, -0.5, 0.5, 0.5,
-3.185687, -3.840541, -2, 1, 1.5, 0.5, 0.5,
-3.185687, -3.840541, -2, 0, 1.5, 0.5, 0.5,
-3.185687, -3.840541, 0, 0, -0.5, 0.5, 0.5,
-3.185687, -3.840541, 0, 1, -0.5, 0.5, 0.5,
-3.185687, -3.840541, 0, 1, 1.5, 0.5, 0.5,
-3.185687, -3.840541, 0, 0, 1.5, 0.5, 0.5,
-3.185687, -3.840541, 2, 0, -0.5, 0.5, 0.5,
-3.185687, -3.840541, 2, 1, -0.5, 0.5, 0.5,
-3.185687, -3.840541, 2, 1, 1.5, 0.5, 0.5,
-3.185687, -3.840541, 2, 0, 1.5, 0.5, 0.5,
-3.185687, -3.840541, 4, 0, -0.5, 0.5, 0.5,
-3.185687, -3.840541, 4, 1, -0.5, 0.5, 0.5,
-3.185687, -3.840541, 4, 1, 1.5, 0.5, 0.5,
-3.185687, -3.840541, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** lines object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testglvshader18" ));
gl.attachShader(prog18, getShader( gl, "testglfshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var v=new Float32Array([
-2.730027, -3.295932, -5.150105,
-2.730027, 3.965524, -5.150105,
-2.730027, -3.295932, 5.861366,
-2.730027, 3.965524, 5.861366,
-2.730027, -3.295932, -5.150105,
-2.730027, -3.295932, 5.861366,
-2.730027, 3.965524, -5.150105,
-2.730027, 3.965524, 5.861366,
-2.730027, -3.295932, -5.150105,
3.345437, -3.295932, -5.150105,
-2.730027, -3.295932, 5.861366,
3.345437, -3.295932, 5.861366,
-2.730027, 3.965524, -5.150105,
3.345437, 3.965524, -5.150105,
-2.730027, 3.965524, 5.861366,
3.345437, 3.965524, 5.861366,
3.345437, -3.295932, -5.150105,
3.345437, 3.965524, -5.150105,
3.345437, -3.295932, 5.861366,
3.345437, 3.965524, 5.861366,
3.345437, -3.295932, -5.150105,
3.345437, -3.295932, 5.861366,
3.345437, 3.965524, -5.150105,
3.345437, 3.965524, 5.861366
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 7.75454;
var distance = 34.50082;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.3077047, -0.334796, -0.3556304 );
mvMatrix.scale( 1.380036, 1.154639, 0.7614205 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.50082);
// ****** points object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 9 *******
gl.useProgram(prog9);
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc9, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc9 );
gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture9);
gl.uniform1i( sampler9, 0);
gl.enableVertexAttribArray( ofsLoc9 );
gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 10 *******
gl.useProgram(prog10);
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc10, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc10 );
gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture10);
gl.uniform1i( sampler10, 0);
gl.enableVertexAttribArray( ofsLoc10 );
gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 11 *******
gl.useProgram(prog11);
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc11, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc11 );
gl.vertexAttribPointer(texLoc11, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture11);
gl.uniform1i( sampler11, 0);
gl.enableVertexAttribArray( ofsLoc11 );
gl.vertexAttribPointer(ofsLoc11, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 12 *******
gl.useProgram(prog12);
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 14);
// ****** text object 13 *******
gl.useProgram(prog13);
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc13, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc13 );
gl.vertexAttribPointer(texLoc13, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture13);
gl.uniform1i( sampler13, 0);
gl.enableVertexAttribArray( ofsLoc13 );
gl.vertexAttribPointer(ofsLoc13, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
// ****** lines object 14 *******
gl.useProgram(prog14);
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 8);
// ****** text object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc15, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc15 );
gl.vertexAttribPointer(texLoc15, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture15);
gl.uniform1i( sampler15, 0);
gl.enableVertexAttribArray( ofsLoc15 );
gl.vertexAttribPointer(ofsLoc15, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
// ****** lines object 16 *******
gl.useProgram(prog16);
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 12);
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
// ****** lines object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 504
};
var vpHeights = {
1: 504
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testglcanvas" width="1" height="1"></canvas> 
<p id="testgldebug">
You must enable Javascript to view this page properly.</p>
<script>testglwebGLStart();</script>

The following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.


```r
open3d()
```

```
## glX 
##   2
```

```r
octane<-read.table("octane.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-octane$V2
```

```
## Error in eval(expr, envir, enclos): object 'octane' not found
```

```r
y<-octane$V3
```

```
## Error in eval(expr, envir, enclos): object 'octane' not found
```

```r
z<-octane$V4
```

```
## Error in eval(expr, envir, enclos): object 'octane' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgl2textureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-2.64155, -0.9594158, -1.915858, 0, 0, 1, 1, 1,
-2.587564, -0.6520684, -3.245833, 1, 0, 0, 1, 1,
-2.56423, 0.2946953, 0.645076, 1, 0, 0, 1, 1,
-2.500002, 0.1807442, -0.681331, 1, 0, 0, 1, 1,
-2.479237, -1.368851, -1.429891, 1, 0, 0, 1, 1,
-2.429559, -0.4142672, 0.4184831, 1, 0, 0, 1, 1,
-2.39821, -0.191848, -1.712448, 0, 0, 0, 1, 1,
-2.340921, -0.211078, -2.205593, 0, 0, 0, 1, 1,
-2.271001, -0.04476083, -1.789592, 0, 0, 0, 1, 1,
-2.157368, 0.07221241, -1.55478, 0, 0, 0, 1, 1,
-2.151551, -2.053059, -1.439733, 0, 0, 0, 1, 1,
-2.108775, 0.8197397, -1.516573, 0, 0, 0, 1, 1,
-2.107782, -0.648025, -1.036454, 0, 0, 0, 1, 1,
-2.077607, -0.4181074, -2.372644, 1, 1, 1, 1, 1,
-2.075253, -1.608688e-06, -0.9197401, 1, 1, 1, 1, 1,
-2.051968, 0.5536492, -3.498714, 1, 1, 1, 1, 1,
-2.042537, 1.12693, 0.393983, 1, 1, 1, 1, 1,
-2.037159, 0.2266548, -1.882513, 1, 1, 1, 1, 1,
-2.033101, 0.5259618, -1.742519, 1, 1, 1, 1, 1,
-2.030696, 1.291128, -0.4015476, 1, 1, 1, 1, 1,
-2.018318, -1.213603, -2.393545, 1, 1, 1, 1, 1,
-2.010036, 0.3787992, -0.1875807, 1, 1, 1, 1, 1,
-1.999264, -1.519999, -1.624351, 1, 1, 1, 1, 1,
-1.978457, -0.03787189, -2.295389, 1, 1, 1, 1, 1,
-1.931337, -0.7789778, -2.052733, 1, 1, 1, 1, 1,
-1.928056, -0.09374997, -0.9448811, 1, 1, 1, 1, 1,
-1.926176, -1.227306, -0.8655703, 1, 1, 1, 1, 1,
-1.909025, 0.1829048, -4.169824, 1, 1, 1, 1, 1,
-1.905652, 1.215815, -2.327772, 0, 0, 1, 1, 1,
-1.847446, -0.8566143, -2.265329, 1, 0, 0, 1, 1,
-1.846411, -0.9202315, -1.510016, 1, 0, 0, 1, 1,
-1.845185, -1.498516, -0.6547032, 1, 0, 0, 1, 1,
-1.844814, 0.8271469, -0.5485548, 1, 0, 0, 1, 1,
-1.828264, 0.3529623, -2.674443, 1, 0, 0, 1, 1,
-1.807222, 0.729681, -2.372424, 0, 0, 0, 1, 1,
-1.807159, -0.4561229, -0.7827195, 0, 0, 0, 1, 1,
-1.799567, -0.9328578, -2.537708, 0, 0, 0, 1, 1,
-1.786821, -0.916158, -1.330892, 0, 0, 0, 1, 1,
-1.75116, -0.373635, -2.123237, 0, 0, 0, 1, 1,
-1.742514, 1.442933, -0.9306739, 0, 0, 0, 1, 1,
-1.731601, 0.198741, -1.452518, 0, 0, 0, 1, 1,
-1.724693, -0.07950549, -2.262259, 1, 1, 1, 1, 1,
-1.701283, -0.3358237, -2.743725, 1, 1, 1, 1, 1,
-1.679606, 0.9490747, -1.507471, 1, 1, 1, 1, 1,
-1.679069, 0.0525616, -3.797321, 1, 1, 1, 1, 1,
-1.675438, 0.9267311, -2.476786, 1, 1, 1, 1, 1,
-1.670028, -0.1463723, -1.78942, 1, 1, 1, 1, 1,
-1.646724, 0.3979163, -2.208932, 1, 1, 1, 1, 1,
-1.646097, -1.202918, -2.894604, 1, 1, 1, 1, 1,
-1.63157, 2.524576, 0.402871, 1, 1, 1, 1, 1,
-1.61615, 0.8409804, -0.9462289, 1, 1, 1, 1, 1,
-1.615592, -1.224611, -3.542772, 1, 1, 1, 1, 1,
-1.613062, 0.1056035, -1.756956, 1, 1, 1, 1, 1,
-1.605478, 0.1166948, -3.394142, 1, 1, 1, 1, 1,
-1.597653, -0.3710199, -1.044201, 1, 1, 1, 1, 1,
-1.592675, -1.848053, -2.182585, 1, 1, 1, 1, 1,
-1.590037, 1.047084, -0.9323691, 0, 0, 1, 1, 1,
-1.58791, -0.2265483, -1.214574, 1, 0, 0, 1, 1,
-1.586639, -0.1980663, -2.542304, 1, 0, 0, 1, 1,
-1.567682, -0.453335, -2.302903, 1, 0, 0, 1, 1,
-1.549968, -1.206994, -1.366095, 1, 0, 0, 1, 1,
-1.540798, 2.09494, -0.6881092, 1, 0, 0, 1, 1,
-1.536254, 0.2591628, -0.2173158, 0, 0, 0, 1, 1,
-1.533094, -1.014401, -3.90716, 0, 0, 0, 1, 1,
-1.526245, 0.719822, -2.831149, 0, 0, 0, 1, 1,
-1.522115, -0.8760294, -1.09955, 0, 0, 0, 1, 1,
-1.514494, 0.3402608, -2.873231, 0, 0, 0, 1, 1,
-1.506557, 0.1715014, 0.4252332, 0, 0, 0, 1, 1,
-1.488781, 0.9571687, 0.1827596, 0, 0, 0, 1, 1,
-1.485336, -0.4678087, -1.535579, 1, 1, 1, 1, 1,
-1.484536, 0.9283643, -0.5175773, 1, 1, 1, 1, 1,
-1.483028, -1.244568, -1.61258, 1, 1, 1, 1, 1,
-1.474189, 0.685092, -0.9863361, 1, 1, 1, 1, 1,
-1.466259, -1.146722, -2.19495, 1, 1, 1, 1, 1,
-1.453894, -0.1849752, -1.891984, 1, 1, 1, 1, 1,
-1.451742, -1.714953, -2.187021, 1, 1, 1, 1, 1,
-1.429053, 0.6177917, -0.5706968, 1, 1, 1, 1, 1,
-1.428132, 0.5029154, -1.720381, 1, 1, 1, 1, 1,
-1.425371, 0.525544, -2.025321, 1, 1, 1, 1, 1,
-1.405039, -0.1820882, -2.720306, 1, 1, 1, 1, 1,
-1.39914, -0.140535, -1.422553, 1, 1, 1, 1, 1,
-1.384379, -0.8349566, -2.048725, 1, 1, 1, 1, 1,
-1.372814, -1.770029, -2.095268, 1, 1, 1, 1, 1,
-1.369606, -0.1776595, -0.2458772, 1, 1, 1, 1, 1,
-1.362718, -0.9676098, -1.896774, 0, 0, 1, 1, 1,
-1.361089, 1.098199, -1.521351, 1, 0, 0, 1, 1,
-1.34685, -0.3664114, -0.9451932, 1, 0, 0, 1, 1,
-1.342248, 0.8821716, -1.81323, 1, 0, 0, 1, 1,
-1.326132, -1.889079, -2.688091, 1, 0, 0, 1, 1,
-1.317574, 0.06417065, -1.110813, 1, 0, 0, 1, 1,
-1.315445, 0.3336231, -2.319902, 0, 0, 0, 1, 1,
-1.311816, 1.450776, 0.3726502, 0, 0, 0, 1, 1,
-1.303182, 0.2761725, -1.913965, 0, 0, 0, 1, 1,
-1.300501, -0.1797213, 0.1329213, 0, 0, 0, 1, 1,
-1.292748, 0.3542324, -0.7014578, 0, 0, 0, 1, 1,
-1.290971, 0.231798, -2.104606, 0, 0, 0, 1, 1,
-1.275258, 1.898167, -0.574241, 0, 0, 0, 1, 1,
-1.273883, -0.5650939, -2.940638, 1, 1, 1, 1, 1,
-1.265038, 1.905095, -3.139411, 1, 1, 1, 1, 1,
-1.2632, -0.8215496, -4.373779, 1, 1, 1, 1, 1,
-1.262134, 0.8172636, -0.7283496, 1, 1, 1, 1, 1,
-1.251396, -1.161484, -2.274539, 1, 1, 1, 1, 1,
-1.240639, -0.06280763, -1.127675, 1, 1, 1, 1, 1,
-1.231704, -1.909927, -3.98244, 1, 1, 1, 1, 1,
-1.221337, 1.16744, -0.8762316, 1, 1, 1, 1, 1,
-1.221229, -0.1826257, -1.888527, 1, 1, 1, 1, 1,
-1.218223, 0.4214183, -0.8090287, 1, 1, 1, 1, 1,
-1.214517, -0.260858, -1.138059, 1, 1, 1, 1, 1,
-1.210311, 0.7898673, -0.795631, 1, 1, 1, 1, 1,
-1.207149, 0.3859696, -1.985201, 1, 1, 1, 1, 1,
-1.206247, -0.5254923, -1.437774, 1, 1, 1, 1, 1,
-1.20261, -0.9795667, -4.453917, 1, 1, 1, 1, 1,
-1.200919, -0.1169808, -3.180594, 0, 0, 1, 1, 1,
-1.200417, 0.5702901, -1.935499, 1, 0, 0, 1, 1,
-1.195935, 1.02222, -0.4653701, 1, 0, 0, 1, 1,
-1.194598, 0.1775551, -1.738056, 1, 0, 0, 1, 1,
-1.190891, -0.5640138, -1.360758, 1, 0, 0, 1, 1,
-1.182588, 1.010487, 0.03497229, 1, 0, 0, 1, 1,
-1.182579, 1.313449, -0.3304631, 0, 0, 0, 1, 1,
-1.168995, -0.5143017, -0.9866634, 0, 0, 0, 1, 1,
-1.168984, 0.1030451, -2.061435, 0, 0, 0, 1, 1,
-1.165781, -0.1288987, -0.9837262, 0, 0, 0, 1, 1,
-1.155676, 0.6608698, 0.3328494, 0, 0, 0, 1, 1,
-1.151128, -0.2344725, -2.511189, 0, 0, 0, 1, 1,
-1.136657, 0.2754991, -1.965828, 0, 0, 0, 1, 1,
-1.136282, -0.04073573, -2.296919, 1, 1, 1, 1, 1,
-1.135407, -0.7554536, -3.378412, 1, 1, 1, 1, 1,
-1.13401, 1.667311, -0.03431807, 1, 1, 1, 1, 1,
-1.133656, -0.1975657, -1.306378, 1, 1, 1, 1, 1,
-1.132777, 1.073902, -0.942075, 1, 1, 1, 1, 1,
-1.129421, -1.592976, -2.913646, 1, 1, 1, 1, 1,
-1.127646, 0.196884, -0.9906164, 1, 1, 1, 1, 1,
-1.12391, 2.137711, -1.382908, 1, 1, 1, 1, 1,
-1.116349, 1.644523, -1.181553, 1, 1, 1, 1, 1,
-1.102989, 1.692887, 0.09916595, 1, 1, 1, 1, 1,
-1.096046, 0.2037186, -1.267949, 1, 1, 1, 1, 1,
-1.093552, 0.1782241, -1.109632, 1, 1, 1, 1, 1,
-1.091031, 0.8623903, -0.5101069, 1, 1, 1, 1, 1,
-1.087099, 0.1882545, 0.3961514, 1, 1, 1, 1, 1,
-1.076592, -0.2132321, -0.6547425, 1, 1, 1, 1, 1,
-1.074107, -0.6528825, -2.041908, 0, 0, 1, 1, 1,
-1.071549, 1.254871, 0.1889006, 1, 0, 0, 1, 1,
-1.064589, -1.250355, -3.651996, 1, 0, 0, 1, 1,
-1.063467, 2.035762, -0.1120421, 1, 0, 0, 1, 1,
-1.061648, 0.843637, -0.2831148, 1, 0, 0, 1, 1,
-1.061568, -0.8048735, -3.372845, 1, 0, 0, 1, 1,
-1.06011, 0.1393507, -2.585033, 0, 0, 0, 1, 1,
-1.059975, -0.1443393, -0.7470477, 0, 0, 0, 1, 1,
-1.058957, 1.178068, -0.9650971, 0, 0, 0, 1, 1,
-1.052196, 0.81976, -0.8800502, 0, 0, 0, 1, 1,
-1.04685, -0.1935116, -3.083265, 0, 0, 0, 1, 1,
-1.04539, 1.259558, -0.4013739, 0, 0, 0, 1, 1,
-1.044755, -0.165678, -3.058385, 0, 0, 0, 1, 1,
-1.033733, -0.6170046, -1.116776, 1, 1, 1, 1, 1,
-1.029123, -0.9667004, -0.6040722, 1, 1, 1, 1, 1,
-1.028651, -0.50032, -1.863466, 1, 1, 1, 1, 1,
-1.022177, -1.424876, -2.881327, 1, 1, 1, 1, 1,
-1.019707, 1.20581, -2.727855, 1, 1, 1, 1, 1,
-1.015048, 1.344184, -0.7409003, 1, 1, 1, 1, 1,
-1.010476, -1.091244, -2.243376, 1, 1, 1, 1, 1,
-1.004601, -1.23772, -0.5849468, 1, 1, 1, 1, 1,
-1.003519, 2.312345, -1.992029, 1, 1, 1, 1, 1,
-1.002636, 1.496818, 0.407873, 1, 1, 1, 1, 1,
-0.9972577, -1.470891, -3.481693, 1, 1, 1, 1, 1,
-0.9957398, -0.851254, -3.282324, 1, 1, 1, 1, 1,
-0.9928262, 0.06533001, -2.534518, 1, 1, 1, 1, 1,
-0.9889005, -0.3739215, -0.9977186, 1, 1, 1, 1, 1,
-0.9861011, -1.507663, -1.664203, 1, 1, 1, 1, 1,
-0.9852933, 0.4233575, -0.5564654, 0, 0, 1, 1, 1,
-0.9818028, -1.42681, -2.00597, 1, 0, 0, 1, 1,
-0.981562, -0.378118, -0.9522873, 1, 0, 0, 1, 1,
-0.9798315, 0.1010502, -1.682624, 1, 0, 0, 1, 1,
-0.9697654, -0.6636177, -2.816013, 1, 0, 0, 1, 1,
-0.9614333, 0.4783376, 1.757138, 1, 0, 0, 1, 1,
-0.9600921, -1.918808, -2.413477, 0, 0, 0, 1, 1,
-0.956829, -1.600046, -4.848169, 0, 0, 0, 1, 1,
-0.9512234, 1.328598, -1.035458, 0, 0, 0, 1, 1,
-0.950474, 0.03668702, -2.853981, 0, 0, 0, 1, 1,
-0.946525, -0.6137269, -2.243706, 0, 0, 0, 1, 1,
-0.9420065, -1.309548, -2.534236, 0, 0, 0, 1, 1,
-0.9410197, 0.7914836, -1.751062, 0, 0, 0, 1, 1,
-0.9392615, 0.5734234, -1.404405, 1, 1, 1, 1, 1,
-0.9303991, 0.6432574, 0.9489404, 1, 1, 1, 1, 1,
-0.9294611, -0.1587404, -2.06607, 1, 1, 1, 1, 1,
-0.9255645, 0.279696, -1.563501, 1, 1, 1, 1, 1,
-0.9221804, 0.3143829, -2.630342, 1, 1, 1, 1, 1,
-0.9194433, 0.4391878, -0.5707262, 1, 1, 1, 1, 1,
-0.9171138, 0.357263, -2.282751, 1, 1, 1, 1, 1,
-0.916607, -0.8111987, -1.320644, 1, 1, 1, 1, 1,
-0.9154856, 0.570844, -1.477206, 1, 1, 1, 1, 1,
-0.9026139, 0.4384304, -0.7931114, 1, 1, 1, 1, 1,
-0.9014037, 2.063938, -1.544124, 1, 1, 1, 1, 1,
-0.8966815, -2.502716, -3.519686, 1, 1, 1, 1, 1,
-0.8921089, -0.9702905, -1.972683, 1, 1, 1, 1, 1,
-0.8919504, 0.2544371, -2.595232, 1, 1, 1, 1, 1,
-0.8918576, 0.9562452, -2.591182, 1, 1, 1, 1, 1,
-0.8906699, 1.124009, -1.733498, 0, 0, 1, 1, 1,
-0.8885634, -0.9145334, -2.530653, 1, 0, 0, 1, 1,
-0.8874256, -0.2276791, -2.811932, 1, 0, 0, 1, 1,
-0.8856013, -0.2003445, -4.898366, 1, 0, 0, 1, 1,
-0.8812242, -0.2996081, 0.07598355, 1, 0, 0, 1, 1,
-0.8801917, -0.02656793, -3.794687, 1, 0, 0, 1, 1,
-0.8768554, -1.744254, -3.662127, 0, 0, 0, 1, 1,
-0.8759316, -0.5850574, -1.572745, 0, 0, 0, 1, 1,
-0.8681241, 0.7417396, -2.488279, 0, 0, 0, 1, 1,
-0.862749, 1.851987, -2.159284, 0, 0, 0, 1, 1,
-0.8596933, 0.2439288, -1.930583, 0, 0, 0, 1, 1,
-0.8541395, 1.021274, -1.012375, 0, 0, 0, 1, 1,
-0.8540018, 1.236408, -1.034081, 0, 0, 0, 1, 1,
-0.8484395, 0.1110422, -0.9568585, 1, 1, 1, 1, 1,
-0.8463205, -0.08589765, -3.271313, 1, 1, 1, 1, 1,
-0.8422722, 1.924241, 0.7896562, 1, 1, 1, 1, 1,
-0.8359437, -0.6972726, -1.115324, 1, 1, 1, 1, 1,
-0.8359367, -0.0678473, -1.285848, 1, 1, 1, 1, 1,
-0.8329674, 2.242573, -0.02542572, 1, 1, 1, 1, 1,
-0.8284461, 1.30265, -2.812695, 1, 1, 1, 1, 1,
-0.8260605, 0.3035099, -1.658918, 1, 1, 1, 1, 1,
-0.8217598, -0.2999354, -2.063812, 1, 1, 1, 1, 1,
-0.8196216, -0.2454569, -1.293715, 1, 1, 1, 1, 1,
-0.8180558, 0.5262281, -0.7951851, 1, 1, 1, 1, 1,
-0.8173192, -1.294335, -2.897564, 1, 1, 1, 1, 1,
-0.815329, 0.1491265, -1.870713, 1, 1, 1, 1, 1,
-0.811516, 0.6027386, 0.4940199, 1, 1, 1, 1, 1,
-0.8077, -0.3025884, 0.6295046, 1, 1, 1, 1, 1,
-0.8045387, 0.6979061, -1.385679, 0, 0, 1, 1, 1,
-0.7981684, 0.4661852, -1.178032, 1, 0, 0, 1, 1,
-0.7979042, 0.5065739, 0.8272182, 1, 0, 0, 1, 1,
-0.7945997, -1.7325, -2.079792, 1, 0, 0, 1, 1,
-0.7913905, -0.1554374, -0.1759341, 1, 0, 0, 1, 1,
-0.789323, -1.666323, -2.55985, 1, 0, 0, 1, 1,
-0.7892607, 0.4648526, -2.072018, 0, 0, 0, 1, 1,
-0.7887579, 2.114579, 0.8677945, 0, 0, 0, 1, 1,
-0.7850503, 1.011195, 0.4012985, 0, 0, 0, 1, 1,
-0.7849612, 2.143916, 1.863435, 0, 0, 0, 1, 1,
-0.773865, -0.4661101, -1.906524, 0, 0, 0, 1, 1,
-0.7696484, -0.06669218, -1.644818, 0, 0, 0, 1, 1,
-0.7692648, 1.55482, -1.16121, 0, 0, 0, 1, 1,
-0.7564141, 0.1611019, -1.490605, 1, 1, 1, 1, 1,
-0.7562754, 0.7014381, -1.63647, 1, 1, 1, 1, 1,
-0.75441, -0.3904402, -1.265507, 1, 1, 1, 1, 1,
-0.7511618, -0.3061661, -1.827488, 1, 1, 1, 1, 1,
-0.7489696, -0.7507799, -1.404452, 1, 1, 1, 1, 1,
-0.7484487, 0.4319864, -1.283328, 1, 1, 1, 1, 1,
-0.7440456, 0.3902124, -2.125719, 1, 1, 1, 1, 1,
-0.7422632, 0.1712127, -0.2887703, 1, 1, 1, 1, 1,
-0.7409279, -0.3094774, -0.1454654, 1, 1, 1, 1, 1,
-0.7394645, 1.293606, -1.078312, 1, 1, 1, 1, 1,
-0.7364681, 1.488978, -2.026106, 1, 1, 1, 1, 1,
-0.7360985, 0.7098931, -1.368924, 1, 1, 1, 1, 1,
-0.7353042, -0.8707063, -1.514117, 1, 1, 1, 1, 1,
-0.7337411, -0.2376684, -2.376855, 1, 1, 1, 1, 1,
-0.7334619, -0.8480768, -3.457482, 1, 1, 1, 1, 1,
-0.7308327, 0.4620971, -0.9288332, 0, 0, 1, 1, 1,
-0.729958, 1.134958, -2.133982, 1, 0, 0, 1, 1,
-0.7204808, -0.5400382, -1.823198, 1, 0, 0, 1, 1,
-0.7192271, -2.65486, -2.273774, 1, 0, 0, 1, 1,
-0.7141922, -0.4048583, -3.231353, 1, 0, 0, 1, 1,
-0.7108809, -0.6935654, -2.330479, 1, 0, 0, 1, 1,
-0.7005879, -0.2345442, -2.73321, 0, 0, 0, 1, 1,
-0.6980507, 0.00728952, -1.920959, 0, 0, 0, 1, 1,
-0.695397, -0.7370491, -2.028481, 0, 0, 0, 1, 1,
-0.6917953, -0.3267723, -2.205092, 0, 0, 0, 1, 1,
-0.6852121, 1.591061, 0.1364128, 0, 0, 0, 1, 1,
-0.6842773, -0.1066514, -1.633198, 0, 0, 0, 1, 1,
-0.6829473, -0.7685394, -1.508919, 0, 0, 0, 1, 1,
-0.6799285, 0.07028974, -2.465684, 1, 1, 1, 1, 1,
-0.6782532, 0.4635879, -1.16365, 1, 1, 1, 1, 1,
-0.6762997, 0.4990186, -0.5420414, 1, 1, 1, 1, 1,
-0.6730785, 0.7093491, -0.6875327, 1, 1, 1, 1, 1,
-0.6711308, 0.4794662, -0.1840614, 1, 1, 1, 1, 1,
-0.6700281, -0.735532, -3.199607, 1, 1, 1, 1, 1,
-0.668606, -0.980808, -1.913588, 1, 1, 1, 1, 1,
-0.6640686, -0.5217804, -2.225513, 1, 1, 1, 1, 1,
-0.6605141, 0.9444695, -0.4539711, 1, 1, 1, 1, 1,
-0.6593903, -0.8332992, -2.909749, 1, 1, 1, 1, 1,
-0.6577685, -0.06384505, -0.554474, 1, 1, 1, 1, 1,
-0.6537064, 0.2968411, -0.720608, 1, 1, 1, 1, 1,
-0.6531763, -1.259347, -4.989744, 1, 1, 1, 1, 1,
-0.6499227, 1.194972, 0.06235058, 1, 1, 1, 1, 1,
-0.6499121, -0.1603155, -1.933095, 1, 1, 1, 1, 1,
-0.6491804, -0.8895613, -3.444845, 0, 0, 1, 1, 1,
-0.6485826, 1.385756, 0.1984613, 1, 0, 0, 1, 1,
-0.6424716, 1.20865, 0.04734617, 1, 0, 0, 1, 1,
-0.6382399, 0.7760969, 0.1029484, 1, 0, 0, 1, 1,
-0.6381346, 1.561598, -0.2797312, 1, 0, 0, 1, 1,
-0.6355906, 0.1953626, -2.568814, 1, 0, 0, 1, 1,
-0.6333574, -0.5586532, -3.246263, 0, 0, 0, 1, 1,
-0.6292648, 1.28231, -0.5044382, 0, 0, 0, 1, 1,
-0.6280586, -1.383734, -2.469242, 0, 0, 0, 1, 1,
-0.6260805, 0.08705528, -1.514423, 0, 0, 0, 1, 1,
-0.6191292, -0.2846462, -1.180105, 0, 0, 0, 1, 1,
-0.6160567, 0.3118191, -1.212725, 0, 0, 0, 1, 1,
-0.615302, -0.7432946, -1.526926, 0, 0, 0, 1, 1,
-0.6128969, -0.4596463, 1.074957, 1, 1, 1, 1, 1,
-0.6066627, 0.07980475, -0.7543406, 1, 1, 1, 1, 1,
-0.6064048, 1.036868, -0.9910127, 1, 1, 1, 1, 1,
-0.5932775, -0.2156099, -1.413601, 1, 1, 1, 1, 1,
-0.591266, 2.018755, 0.8277053, 1, 1, 1, 1, 1,
-0.5895167, -0.6869144, -1.96266, 1, 1, 1, 1, 1,
-0.5894574, -0.5183709, -1.359963, 1, 1, 1, 1, 1,
-0.588492, -0.5895094, -2.224356, 1, 1, 1, 1, 1,
-0.5859621, 0.1611796, -0.2252047, 1, 1, 1, 1, 1,
-0.5849301, 0.01504061, -0.7939779, 1, 1, 1, 1, 1,
-0.5807409, 2.41804, 0.5646799, 1, 1, 1, 1, 1,
-0.5803194, -0.1915942, -2.136558, 1, 1, 1, 1, 1,
-0.5797833, 0.3478603, -1.020873, 1, 1, 1, 1, 1,
-0.5789447, 0.7101462, -1.23937, 1, 1, 1, 1, 1,
-0.5787121, 0.2478134, -2.374087, 1, 1, 1, 1, 1,
-0.5780568, -0.3136869, -1.620806, 0, 0, 1, 1, 1,
-0.5766098, -0.5498012, -2.592965, 1, 0, 0, 1, 1,
-0.5735433, -0.3851807, -3.348813, 1, 0, 0, 1, 1,
-0.570577, -0.01366818, -1.057527, 1, 0, 0, 1, 1,
-0.5690897, -0.7731487, -0.6020157, 1, 0, 0, 1, 1,
-0.5675476, -0.344266, -1.112611, 1, 0, 0, 1, 1,
-0.5671414, 2.508203, -0.1505424, 0, 0, 0, 1, 1,
-0.5664507, -1.10503, -4.55456, 0, 0, 0, 1, 1,
-0.5640557, -0.4323294, -2.056623, 0, 0, 0, 1, 1,
-0.5638836, 0.2050609, -1.012613, 0, 0, 0, 1, 1,
-0.562106, 0.6639947, -3.611218, 0, 0, 0, 1, 1,
-0.5572187, -0.7311745, -2.099871, 0, 0, 0, 1, 1,
-0.5537208, -0.7457818, -2.758094, 0, 0, 0, 1, 1,
-0.5490238, 0.3802342, -2.766211, 1, 1, 1, 1, 1,
-0.5442696, -0.3433633, -1.939769, 1, 1, 1, 1, 1,
-0.5438918, 0.3671483, -0.162463, 1, 1, 1, 1, 1,
-0.5425959, -0.5279347, -3.924781, 1, 1, 1, 1, 1,
-0.5344949, -1.169391, -1.252982, 1, 1, 1, 1, 1,
-0.5339584, -0.8819292, -2.430099, 1, 1, 1, 1, 1,
-0.5190777, -0.4779059, -0.6188309, 1, 1, 1, 1, 1,
-0.513128, 0.07845037, -3.36225, 1, 1, 1, 1, 1,
-0.5096179, 0.1753114, -2.462497, 1, 1, 1, 1, 1,
-0.5065004, -0.3482066, -1.596122, 1, 1, 1, 1, 1,
-0.5060825, 0.9713806, -1.581701, 1, 1, 1, 1, 1,
-0.5036314, -1.315132, -4.133318, 1, 1, 1, 1, 1,
-0.4979414, -0.6436599, -2.668049, 1, 1, 1, 1, 1,
-0.4975992, 0.8331933, -0.9913952, 1, 1, 1, 1, 1,
-0.4972468, 0.7094293, -1.377984, 1, 1, 1, 1, 1,
-0.4960189, 0.5376547, 0.1651891, 0, 0, 1, 1, 1,
-0.4959281, -0.4061814, -1.154553, 1, 0, 0, 1, 1,
-0.4918573, -0.9775624, -1.380094, 1, 0, 0, 1, 1,
-0.4913728, -0.07679068, -3.207555, 1, 0, 0, 1, 1,
-0.4877946, 1.07073, -0.3490293, 1, 0, 0, 1, 1,
-0.4857669, -0.3668593, -0.7566081, 1, 0, 0, 1, 1,
-0.4849271, 1.3539, -0.6689208, 0, 0, 0, 1, 1,
-0.481653, 0.3011176, -1.331866, 0, 0, 0, 1, 1,
-0.4806704, 0.9804922, -1.404518, 0, 0, 0, 1, 1,
-0.4803912, 0.6422531, -0.2567094, 0, 0, 0, 1, 1,
-0.4802573, 2.171206, -1.824394, 0, 0, 0, 1, 1,
-0.4754556, -1.04006, -2.082027, 0, 0, 0, 1, 1,
-0.4744644, -0.7765449, -2.546501, 0, 0, 0, 1, 1,
-0.4720273, -0.08698947, -0.1642399, 1, 1, 1, 1, 1,
-0.4718969, 1.364716, 0.0212984, 1, 1, 1, 1, 1,
-0.4671896, -0.3461573, -1.020779, 1, 1, 1, 1, 1,
-0.467079, 0.1944677, -1.702085, 1, 1, 1, 1, 1,
-0.4669124, -3.190183, -4.185359, 1, 1, 1, 1, 1,
-0.4613772, -0.7443736, -3.343974, 1, 1, 1, 1, 1,
-0.4588683, -1.347837, -2.411318, 1, 1, 1, 1, 1,
-0.4504716, 0.037179, -2.127602, 1, 1, 1, 1, 1,
-0.4491112, 3.859775, -2.942993, 1, 1, 1, 1, 1,
-0.4465022, -0.4369981, -3.241825, 1, 1, 1, 1, 1,
-0.4451978, -0.0420025, -2.394296, 1, 1, 1, 1, 1,
-0.4443761, 1.659736, -2.245727, 1, 1, 1, 1, 1,
-0.443884, -1.025251, -2.723953, 1, 1, 1, 1, 1,
-0.4438539, -0.512807, -1.149209, 1, 1, 1, 1, 1,
-0.4362812, 0.3620392, -0.7308226, 1, 1, 1, 1, 1,
-0.4281274, -0.8016234, -2.834384, 0, 0, 1, 1, 1,
-0.4273008, -0.9905361, -3.79911, 1, 0, 0, 1, 1,
-0.4270718, 1.484717, -0.7293482, 1, 0, 0, 1, 1,
-0.4264723, -0.6269525, -3.455357, 1, 0, 0, 1, 1,
-0.4261498, -0.6733726, -4.519559, 1, 0, 0, 1, 1,
-0.4260734, -0.7874014, -2.485146, 1, 0, 0, 1, 1,
-0.4236529, -0.2347784, -2.810162, 0, 0, 0, 1, 1,
-0.4228115, 0.7158341, -0.642726, 0, 0, 0, 1, 1,
-0.4226931, 3.392778, -2.258415, 0, 0, 0, 1, 1,
-0.4224888, -2.562746, -2.590625, 0, 0, 0, 1, 1,
-0.4210505, 0.6685408, 0.906226, 0, 0, 0, 1, 1,
-0.4147936, 1.087854, 0.1600378, 0, 0, 0, 1, 1,
-0.4112082, 0.5663306, -0.8442795, 0, 0, 0, 1, 1,
-0.4067142, -0.2036115, -3.538657, 1, 1, 1, 1, 1,
-0.4051784, 0.3943683, -2.853345, 1, 1, 1, 1, 1,
-0.4034673, 0.5431737, -1.292158, 1, 1, 1, 1, 1,
-0.4033334, -1.620109, -1.432014, 1, 1, 1, 1, 1,
-0.4012629, -0.8237762, -1.904332, 1, 1, 1, 1, 1,
-0.3961942, 0.2698808, -1.735057, 1, 1, 1, 1, 1,
-0.3953521, 0.5198237, -0.8971023, 1, 1, 1, 1, 1,
-0.3911752, 0.6609507, -2.611773, 1, 1, 1, 1, 1,
-0.3870168, -0.9210597, -2.671981, 1, 1, 1, 1, 1,
-0.3847019, 0.9489901, 3.08757, 1, 1, 1, 1, 1,
-0.3828176, 0.695127, -1.802213, 1, 1, 1, 1, 1,
-0.3811528, 0.8018866, -0.9304069, 1, 1, 1, 1, 1,
-0.3784454, 0.2731791, -2.932173, 1, 1, 1, 1, 1,
-0.3777687, -0.1630998, -1.111256, 1, 1, 1, 1, 1,
-0.3772867, 0.7652341, -1.009784, 1, 1, 1, 1, 1,
-0.369179, 0.008276969, -0.6211388, 0, 0, 1, 1, 1,
-0.3683611, 0.7759582, -2.686502, 1, 0, 0, 1, 1,
-0.3628432, -0.2903323, -1.890193, 1, 0, 0, 1, 1,
-0.3609498, -0.8712228, -1.72784, 1, 0, 0, 1, 1,
-0.3603274, -0.1759335, -1.453669, 1, 0, 0, 1, 1,
-0.3572442, 1.437636, 0.003066743, 1, 0, 0, 1, 1,
-0.3567647, -1.30148, -3.113978, 0, 0, 0, 1, 1,
-0.3520427, -0.8009278, -1.216309, 0, 0, 0, 1, 1,
-0.3516606, -2.094038, -2.834535, 0, 0, 0, 1, 1,
-0.3508277, -1.783042, -2.424103, 0, 0, 0, 1, 1,
-0.3404913, 0.02248241, -1.974128, 0, 0, 0, 1, 1,
-0.338414, -0.230399, -4.951148, 0, 0, 0, 1, 1,
-0.3363956, 0.586847, -0.5833164, 0, 0, 0, 1, 1,
-0.3326082, 0.6446033, 2.816718, 1, 1, 1, 1, 1,
-0.3304328, -0.7407785, -3.820435, 1, 1, 1, 1, 1,
-0.3297211, 1.182831, -1.535259, 1, 1, 1, 1, 1,
-0.3285057, -0.3512946, -3.858062, 1, 1, 1, 1, 1,
-0.3262937, -1.114081, -3.812854, 1, 1, 1, 1, 1,
-0.3254721, -0.5324753, -4.104771, 1, 1, 1, 1, 1,
-0.3239929, 0.1862223, 0.4509912, 1, 1, 1, 1, 1,
-0.3224832, 0.6851458, 0.7326889, 1, 1, 1, 1, 1,
-0.3197459, 0.4898259, -1.626811, 1, 1, 1, 1, 1,
-0.3149335, -0.3286284, -1.490615, 1, 1, 1, 1, 1,
-0.3135925, 0.4020071, -1.411755, 1, 1, 1, 1, 1,
-0.3104207, 0.9999596, 1.300632, 1, 1, 1, 1, 1,
-0.3065622, -0.6721536, -0.4062861, 1, 1, 1, 1, 1,
-0.3061517, -0.7692012, -3.821708, 1, 1, 1, 1, 1,
-0.300826, -0.7941587, -3.983386, 1, 1, 1, 1, 1,
-0.2992421, -1.104922, -2.232442, 0, 0, 1, 1, 1,
-0.2954425, 1.48933, -2.620002, 1, 0, 0, 1, 1,
-0.2930701, -0.9411963, -3.352267, 1, 0, 0, 1, 1,
-0.2922224, 0.48217, -1.129056, 1, 0, 0, 1, 1,
-0.2876322, 0.2891807, -2.03941, 1, 0, 0, 1, 1,
-0.2874952, -1.230924, -2.873179, 1, 0, 0, 1, 1,
-0.2862942, 1.281838, -0.9077161, 0, 0, 0, 1, 1,
-0.2839088, 0.8239014, 0.02291754, 0, 0, 0, 1, 1,
-0.2826748, 0.8993072, -0.127221, 0, 0, 0, 1, 1,
-0.2741509, -0.04996059, -0.9015819, 0, 0, 0, 1, 1,
-0.2681655, 1.903005, -0.01347066, 0, 0, 0, 1, 1,
-0.2679189, 0.9111339, -2.768749, 0, 0, 0, 1, 1,
-0.2656456, 0.5307809, -0.4134785, 0, 0, 0, 1, 1,
-0.2640479, 0.529366, 0.6328002, 1, 1, 1, 1, 1,
-0.2624227, -0.7053438, -2.121725, 1, 1, 1, 1, 1,
-0.2576737, -0.2733991, -1.039829, 1, 1, 1, 1, 1,
-0.2509601, -0.3137451, -2.020974, 1, 1, 1, 1, 1,
-0.2506484, -1.831254, -2.127282, 1, 1, 1, 1, 1,
-0.248748, -1.262436, -3.970063, 1, 1, 1, 1, 1,
-0.2456119, -1.108174, -1.61149, 1, 1, 1, 1, 1,
-0.2423873, -0.05984585, -1.450935, 1, 1, 1, 1, 1,
-0.2416391, 0.3074041, 0.7728797, 1, 1, 1, 1, 1,
-0.2329077, 0.1983995, 0.5651382, 1, 1, 1, 1, 1,
-0.2324882, -0.3873681, -3.075515, 1, 1, 1, 1, 1,
-0.2307902, 0.4602002, -1.207904, 1, 1, 1, 1, 1,
-0.2252563, 1.949432, -1.344539, 1, 1, 1, 1, 1,
-0.2220616, 0.8434386, -0.3080901, 1, 1, 1, 1, 1,
-0.21765, 0.6276309, -0.7162701, 1, 1, 1, 1, 1,
-0.210401, -1.616536, -2.991481, 0, 0, 1, 1, 1,
-0.2010871, 0.9985693, -0.732092, 1, 0, 0, 1, 1,
-0.20001, 1.60478, -0.4623734, 1, 0, 0, 1, 1,
-0.1981198, 0.5265728, -0.2808094, 1, 0, 0, 1, 1,
-0.1943809, -0.2020199, -1.710808, 1, 0, 0, 1, 1,
-0.1918967, -0.6741173, -3.402838, 1, 0, 0, 1, 1,
-0.1894264, 1.421223, 0.558748, 0, 0, 0, 1, 1,
-0.1873792, 0.4216836, 0.6662228, 0, 0, 0, 1, 1,
-0.1855865, -0.9052272, -1.335684, 0, 0, 0, 1, 1,
-0.184141, -0.1981192, -1.456278, 0, 0, 0, 1, 1,
-0.1830231, -0.6321542, -4.400426, 0, 0, 0, 1, 1,
-0.1817107, 1.341217, -0.5007676, 0, 0, 0, 1, 1,
-0.1793328, -0.4025159, -1.535328, 0, 0, 0, 1, 1,
-0.1763479, -1.806414, -3.700425, 1, 1, 1, 1, 1,
-0.1757035, 0.7486788, -1.585427, 1, 1, 1, 1, 1,
-0.1736439, -2.413957, -3.655141, 1, 1, 1, 1, 1,
-0.1729896, -0.8100129, -3.0646, 1, 1, 1, 1, 1,
-0.1727369, 0.7206787, -0.7402084, 1, 1, 1, 1, 1,
-0.1695334, -0.3637669, -3.832576, 1, 1, 1, 1, 1,
-0.1616728, -0.133687, -2.006681, 1, 1, 1, 1, 1,
-0.1578029, -0.6655532, -2.115581, 1, 1, 1, 1, 1,
-0.1548771, 0.02594531, -1.520846, 1, 1, 1, 1, 1,
-0.1540084, 0.6363919, -0.6510621, 1, 1, 1, 1, 1,
-0.1526145, 0.668413, 1.214867, 1, 1, 1, 1, 1,
-0.1422938, 1.03937, 0.3208639, 1, 1, 1, 1, 1,
-0.140731, -0.1369174, -3.292426, 1, 1, 1, 1, 1,
-0.1355964, 0.2310367, -2.398015, 1, 1, 1, 1, 1,
-0.1344356, -0.1664246, -2.420572, 1, 1, 1, 1, 1,
-0.1317697, -0.8614267, -4.058784, 0, 0, 1, 1, 1,
-0.1247799, 1.297891, 0.5569051, 1, 0, 0, 1, 1,
-0.1226907, 0.3741803, 0.6497982, 1, 0, 0, 1, 1,
-0.1213019, -0.5117387, -1.955967, 1, 0, 0, 1, 1,
-0.120805, 0.9286059, -0.7773209, 1, 0, 0, 1, 1,
-0.1200809, -1.640669, -2.093122, 1, 0, 0, 1, 1,
-0.118628, -0.09183496, -2.119516, 0, 0, 0, 1, 1,
-0.118448, -0.1093633, -4.689773, 0, 0, 0, 1, 1,
-0.1139406, 2.140174, -0.6077587, 0, 0, 0, 1, 1,
-0.1051419, -0.0816206, -3.363734, 0, 0, 0, 1, 1,
-0.1029349, 0.03474813, -0.996904, 0, 0, 0, 1, 1,
-0.1012279, -0.2071456, -2.674102, 0, 0, 0, 1, 1,
-0.09941838, -1.116814, -2.454798, 0, 0, 0, 1, 1,
-0.09918454, 2.208354, -0.6563012, 1, 1, 1, 1, 1,
-0.09786707, -1.7547, -3.7181, 1, 1, 1, 1, 1,
-0.09771068, -1.13582, -2.912767, 1, 1, 1, 1, 1,
-0.09653122, -0.5931311, -3.175257, 1, 1, 1, 1, 1,
-0.09028248, -0.780506, -4.749798, 1, 1, 1, 1, 1,
-0.08690362, 0.2194495, -0.8579739, 1, 1, 1, 1, 1,
-0.0848455, -0.6578223, -3.645888, 1, 1, 1, 1, 1,
-0.08309661, 1.534622, -1.897153, 1, 1, 1, 1, 1,
-0.0799227, 0.6997079, 0.8242542, 1, 1, 1, 1, 1,
-0.07880975, -0.02087532, -2.410208, 1, 1, 1, 1, 1,
-0.0762132, -0.1914813, -3.897719, 1, 1, 1, 1, 1,
-0.07377518, 0.4516796, -1.754929, 1, 1, 1, 1, 1,
-0.07269228, 0.4387218, 0.04235045, 1, 1, 1, 1, 1,
-0.07267325, 0.87098, -0.572758, 1, 1, 1, 1, 1,
-0.07083564, -0.6819689, -3.230263, 1, 1, 1, 1, 1,
-0.06776007, 0.9864749, -1.296644, 0, 0, 1, 1, 1,
-0.0613482, 0.8789082, 2.244685, 1, 0, 0, 1, 1,
-0.06099016, -0.714154, -2.469964, 1, 0, 0, 1, 1,
-0.05961427, -1.405777, -1.733706, 1, 0, 0, 1, 1,
-0.0595779, 1.143117, -2.118621, 1, 0, 0, 1, 1,
-0.05689002, 0.4512594, 0.404176, 1, 0, 0, 1, 1,
-0.05417688, -1.678205, -2.258004, 0, 0, 0, 1, 1,
-0.05091938, 1.108725, -0.3336269, 0, 0, 0, 1, 1,
-0.0491645, 1.302791, -0.6868319, 0, 0, 0, 1, 1,
-0.04831519, 0.3227652, -1.150949, 0, 0, 0, 1, 1,
-0.04412877, 0.9654777, -0.4668596, 0, 0, 0, 1, 1,
-0.03636776, -0.08321507, -3.053726, 0, 0, 0, 1, 1,
-0.0338059, 0.00987916, -2.306147, 0, 0, 0, 1, 1,
-0.02748657, 0.04596346, -1.686837, 1, 1, 1, 1, 1,
-0.02730679, -0.5783961, -1.788663, 1, 1, 1, 1, 1,
-0.02624247, 1.807447, -0.8940575, 1, 1, 1, 1, 1,
-0.02467383, -0.03177097, -2.7968, 1, 1, 1, 1, 1,
-0.0240141, -0.1720902, -4.002667, 1, 1, 1, 1, 1,
-0.02382907, 1.250782, -1.05233, 1, 1, 1, 1, 1,
-0.02366927, -0.5363569, -2.352532, 1, 1, 1, 1, 1,
-0.01998301, 0.1861045, 0.1867627, 1, 1, 1, 1, 1,
-0.01368775, 1.13119, 1.183733, 1, 1, 1, 1, 1,
-0.01346504, -1.186124, -2.786824, 1, 1, 1, 1, 1,
-0.01290981, 0.4030151, 0.08915238, 1, 1, 1, 1, 1,
-0.008698136, 0.6510586, 0.8162625, 1, 1, 1, 1, 1,
-0.006086524, -1.613295, -3.321468, 1, 1, 1, 1, 1,
-0.004116052, 1.411147, -0.8279769, 1, 1, 1, 1, 1,
-0.003264865, 0.6121104, -1.630924, 1, 1, 1, 1, 1,
0.002073127, -1.847892, 5.701005, 0, 0, 1, 1, 1,
0.002642267, 0.4335157, 1.322167, 1, 0, 0, 1, 1,
0.00303026, 1.144368, -1.385103, 1, 0, 0, 1, 1,
0.0108049, -1.776539, 3.770609, 1, 0, 0, 1, 1,
0.01154869, 0.8161774, -0.2510374, 1, 0, 0, 1, 1,
0.01427483, -0.5109381, 2.25478, 1, 0, 0, 1, 1,
0.02458249, 1.430751, -0.5836151, 0, 0, 0, 1, 1,
0.02658267, -0.3970939, 2.571531, 0, 0, 0, 1, 1,
0.02952684, 0.3174127, 0.4837823, 0, 0, 0, 1, 1,
0.03217347, -0.6479771, 3.712377, 0, 0, 0, 1, 1,
0.03294879, -0.3436209, 3.949917, 0, 0, 0, 1, 1,
0.03474992, -0.720945, 4.597479, 0, 0, 0, 1, 1,
0.03536375, 1.276359, -1.106429, 0, 0, 0, 1, 1,
0.04100681, 0.4246614, 1.543336, 1, 1, 1, 1, 1,
0.04790421, -0.4726754, 2.989008, 1, 1, 1, 1, 1,
0.05584902, -0.04238552, 4.826174, 1, 1, 1, 1, 1,
0.0585723, -0.3562897, 3.715067, 1, 1, 1, 1, 1,
0.06271839, -0.5555854, 2.943804, 1, 1, 1, 1, 1,
0.06370272, -1.177021, 3.955214, 1, 1, 1, 1, 1,
0.06738973, 0.03016486, 2.280551, 1, 1, 1, 1, 1,
0.06877095, 0.0862599, 0.7547627, 1, 1, 1, 1, 1,
0.07264992, -1.092941, 4.033452, 1, 1, 1, 1, 1,
0.08053947, 1.218666, -0.6259362, 1, 1, 1, 1, 1,
0.08269522, -0.4213707, 5.2295, 1, 1, 1, 1, 1,
0.0834287, -0.3080992, 2.46701, 1, 1, 1, 1, 1,
0.09364658, -0.6091973, 2.352613, 1, 1, 1, 1, 1,
0.0949708, 1.476022, 0.9846581, 1, 1, 1, 1, 1,
0.09764733, 3.309434, 1.389134, 1, 1, 1, 1, 1,
0.1016517, 0.604217, -3.116447, 0, 0, 1, 1, 1,
0.1088238, -3.075623, 2.978615, 1, 0, 0, 1, 1,
0.1131418, 1.07762, -1.525069, 1, 0, 0, 1, 1,
0.1139853, 0.8897176, 1.561494, 1, 0, 0, 1, 1,
0.1153795, -1.298165, 2.289572, 1, 0, 0, 1, 1,
0.1191976, -0.6891516, 2.157458, 1, 0, 0, 1, 1,
0.1231757, -2.14571, 2.77448, 0, 0, 0, 1, 1,
0.128015, -0.7325875, 4.039948, 0, 0, 0, 1, 1,
0.1315353, 1.346164, -2.759019, 0, 0, 0, 1, 1,
0.1413159, 0.920395, 0.7886175, 0, 0, 0, 1, 1,
0.1434093, 0.01792559, 1.275165, 0, 0, 0, 1, 1,
0.1460028, -0.2049705, 2.649172, 0, 0, 0, 1, 1,
0.1463676, -1.591919, 2.643606, 0, 0, 0, 1, 1,
0.1484924, 0.05971875, -0.2374007, 1, 1, 1, 1, 1,
0.1536783, -0.9395175, 2.509821, 1, 1, 1, 1, 1,
0.1621256, -1.131084, 3.241393, 1, 1, 1, 1, 1,
0.1621384, 0.4247805, 0.7733736, 1, 1, 1, 1, 1,
0.1650148, 0.5192505, 1.330009, 1, 1, 1, 1, 1,
0.1662593, 1.094548, 1.537457, 1, 1, 1, 1, 1,
0.1707412, 0.2096201, 1.478208, 1, 1, 1, 1, 1,
0.1807517, 0.5238807, -0.8050617, 1, 1, 1, 1, 1,
0.1819085, -0.6643073, 1.199456, 1, 1, 1, 1, 1,
0.1894283, -0.8849734, 2.052294, 1, 1, 1, 1, 1,
0.1931044, -0.4823743, 4.072833, 1, 1, 1, 1, 1,
0.1964413, 1.000029, -0.06695675, 1, 1, 1, 1, 1,
0.1987598, 1.073792, -0.1754911, 1, 1, 1, 1, 1,
0.1998769, 1.302483, 1.09779, 1, 1, 1, 1, 1,
0.2005108, -0.5154484, 2.410652, 1, 1, 1, 1, 1,
0.2033532, -0.07699146, 3.006959, 0, 0, 1, 1, 1,
0.2038794, -1.946908, 2.532208, 1, 0, 0, 1, 1,
0.2056682, 0.8148937, -1.439915, 1, 0, 0, 1, 1,
0.2130288, -0.7236931, 0.9588841, 1, 0, 0, 1, 1,
0.2181201, 0.8461744, 1.842575, 1, 0, 0, 1, 1,
0.2203489, 1.09035, 0.5061146, 1, 0, 0, 1, 1,
0.2217318, -0.9241421, 3.174314, 0, 0, 0, 1, 1,
0.222894, -1.372309, 2.968618, 0, 0, 0, 1, 1,
0.2238764, -0.6706291, 2.950977, 0, 0, 0, 1, 1,
0.2258012, 0.7209601, 1.272865, 0, 0, 0, 1, 1,
0.2282705, 0.1275983, 0.145757, 0, 0, 0, 1, 1,
0.2381485, 0.5205764, 0.1454173, 0, 0, 0, 1, 1,
0.2405246, 1.408535, 0.9534534, 0, 0, 0, 1, 1,
0.2425489, -0.1583415, 3.371013, 1, 1, 1, 1, 1,
0.2472916, 0.4111319, -1.0151, 1, 1, 1, 1, 1,
0.2474094, 0.5904342, -1.984047, 1, 1, 1, 1, 1,
0.2522055, -0.2126778, 1.120721, 1, 1, 1, 1, 1,
0.2535006, 1.384634, 0.7141848, 1, 1, 1, 1, 1,
0.2542454, 0.5638878, -0.1402328, 1, 1, 1, 1, 1,
0.2560248, 0.2219074, -1.524835, 1, 1, 1, 1, 1,
0.2594526, 0.963553, 0.1642844, 1, 1, 1, 1, 1,
0.2647811, 0.3477443, 0.0329784, 1, 1, 1, 1, 1,
0.2669498, 0.1383941, 1.23444, 1, 1, 1, 1, 1,
0.2700123, 1.128144, 3.26555, 1, 1, 1, 1, 1,
0.2758202, -0.234316, 2.663137, 1, 1, 1, 1, 1,
0.2787775, -1.05791, 1.898517, 1, 1, 1, 1, 1,
0.2841093, 0.7429261, 0.9992387, 1, 1, 1, 1, 1,
0.2877589, -1.601016, 4.512972, 1, 1, 1, 1, 1,
0.2989553, 0.5941771, 1.12676, 0, 0, 1, 1, 1,
0.2991221, -1.125301, 4.955513, 1, 0, 0, 1, 1,
0.2998326, 0.7291083, -0.02529018, 1, 0, 0, 1, 1,
0.3058594, 0.161251, 1.412691, 1, 0, 0, 1, 1,
0.307229, -0.1430538, 1.669241, 1, 0, 0, 1, 1,
0.3080411, 0.3410362, 0.9774271, 1, 0, 0, 1, 1,
0.3083793, 0.4334127, -0.1172413, 0, 0, 0, 1, 1,
0.3105024, 0.6277962, 0.8560803, 0, 0, 0, 1, 1,
0.3112449, -0.6076717, 1.825195, 0, 0, 0, 1, 1,
0.3121479, 0.8384229, 1.534335, 0, 0, 0, 1, 1,
0.3147688, -1.222928, 2.233423, 0, 0, 0, 1, 1,
0.3197624, 1.038674, -0.781179, 0, 0, 0, 1, 1,
0.3229863, 0.0007367676, 2.581956, 0, 0, 0, 1, 1,
0.3267901, 0.4964801, -0.2949894, 1, 1, 1, 1, 1,
0.3271657, 0.2134339, 1.786362, 1, 1, 1, 1, 1,
0.3306483, -1.799889, 1.538643, 1, 1, 1, 1, 1,
0.3352677, 1.485245, 0.4873596, 1, 1, 1, 1, 1,
0.3359281, 0.4503523, 0.2745271, 1, 1, 1, 1, 1,
0.3390297, 0.1139376, -0.2880104, 1, 1, 1, 1, 1,
0.342718, -0.05296779, 2.06916, 1, 1, 1, 1, 1,
0.3456017, 0.3178753, 0.5348387, 1, 1, 1, 1, 1,
0.3477229, 0.4737993, 0.3415793, 1, 1, 1, 1, 1,
0.3523675, 0.5589662, -0.7628073, 1, 1, 1, 1, 1,
0.3555798, 0.08845554, 3.053714, 1, 1, 1, 1, 1,
0.3580809, 0.5542289, 1.744045, 1, 1, 1, 1, 1,
0.363729, 0.09638717, -1.719651, 1, 1, 1, 1, 1,
0.3694045, 0.04907634, 1.376605, 1, 1, 1, 1, 1,
0.372651, -0.4569436, 1.578761, 1, 1, 1, 1, 1,
0.3732896, -1.238246, 2.695268, 0, 0, 1, 1, 1,
0.3755092, 0.863842, 2.489508, 1, 0, 0, 1, 1,
0.3762512, -0.8187522, 2.538174, 1, 0, 0, 1, 1,
0.3771031, 0.08669934, 1.907305, 1, 0, 0, 1, 1,
0.3802183, 0.3119727, 1.321198, 1, 0, 0, 1, 1,
0.3864057, -0.7121625, 2.923626, 1, 0, 0, 1, 1,
0.3887453, -0.0414762, 1.641895, 0, 0, 0, 1, 1,
0.390816, -2.406738, 2.872922, 0, 0, 0, 1, 1,
0.3909111, 1.478753, -0.07186035, 0, 0, 0, 1, 1,
0.3914089, 1.280627, 0.5265916, 0, 0, 0, 1, 1,
0.4030978, -0.652253, 2.184495, 0, 0, 0, 1, 1,
0.403839, -0.6441358, 2.783483, 0, 0, 0, 1, 1,
0.4058862, 0.2673755, -0.1383987, 0, 0, 0, 1, 1,
0.4066769, -1.262544, 2.473981, 1, 1, 1, 1, 1,
0.4067238, 1.2647, 0.3886847, 1, 1, 1, 1, 1,
0.407031, -0.6147314, 1.70955, 1, 1, 1, 1, 1,
0.4071731, 1.788397, -0.6961758, 1, 1, 1, 1, 1,
0.4097616, -2.449415, 4.346919, 1, 1, 1, 1, 1,
0.4102326, -1.500024, 3.7609, 1, 1, 1, 1, 1,
0.4110734, -1.093444, 3.919769, 1, 1, 1, 1, 1,
0.4119005, -0.1230024, 0.5338586, 1, 1, 1, 1, 1,
0.4151492, -0.2482524, 2.233503, 1, 1, 1, 1, 1,
0.4164125, -0.1037121, 0.2834966, 1, 1, 1, 1, 1,
0.4206351, -0.4175385, 1.4105, 1, 1, 1, 1, 1,
0.4229394, 0.1279124, 2.062098, 1, 1, 1, 1, 1,
0.4317811, 0.1318368, 1.188482, 1, 1, 1, 1, 1,
0.4320049, 0.5638477, 0.895184, 1, 1, 1, 1, 1,
0.434316, -0.5247966, 2.13306, 1, 1, 1, 1, 1,
0.4375346, -0.93643, 1.045223, 0, 0, 1, 1, 1,
0.4412512, 0.4362783, 0.4524277, 1, 0, 0, 1, 1,
0.4416103, 0.963506, 2.266109, 1, 0, 0, 1, 1,
0.4472215, -2.060308, 4.977657, 1, 0, 0, 1, 1,
0.4496287, -1.194569, 2.828838, 1, 0, 0, 1, 1,
0.450527, -0.1257069, 2.45965, 1, 0, 0, 1, 1,
0.4527082, 0.7722314, -0.601136, 0, 0, 0, 1, 1,
0.4535293, -1.069776, 1.570407, 0, 0, 0, 1, 1,
0.4540764, -0.7531564, 3.032774, 0, 0, 0, 1, 1,
0.4563367, 0.8458162, 0.07842872, 0, 0, 0, 1, 1,
0.45793, -0.2479947, 1.575753, 0, 0, 0, 1, 1,
0.4623857, -0.1654644, 0.3646019, 0, 0, 0, 1, 1,
0.4638544, -1.649108, 1.024502, 0, 0, 0, 1, 1,
0.4655691, 0.3767704, 0.5978925, 1, 1, 1, 1, 1,
0.4694901, -1.736262, 3.505789, 1, 1, 1, 1, 1,
0.4697089, 2.993696, -0.170756, 1, 1, 1, 1, 1,
0.4743042, 0.6054603, -0.1129884, 1, 1, 1, 1, 1,
0.4752212, -0.2905517, 1.596389, 1, 1, 1, 1, 1,
0.4796664, 1.192739, 1.301668, 1, 1, 1, 1, 1,
0.4813097, 0.9017255, -0.4583547, 1, 1, 1, 1, 1,
0.4840655, 0.598096, -0.1902988, 1, 1, 1, 1, 1,
0.488555, -0.01830254, 0.9585295, 1, 1, 1, 1, 1,
0.5016581, 0.03077853, 1.860944, 1, 1, 1, 1, 1,
0.5076451, 1.339613, 1.722355, 1, 1, 1, 1, 1,
0.5086561, -1.78256, 2.046992, 1, 1, 1, 1, 1,
0.5117192, -1.923514, 2.22618, 1, 1, 1, 1, 1,
0.5127553, -0.2308365, 3.051927, 1, 1, 1, 1, 1,
0.5164035, 0.3239073, 1.377124, 1, 1, 1, 1, 1,
0.517905, -0.5192699, 0.7486663, 0, 0, 1, 1, 1,
0.5183489, 0.03133648, 1.534655, 1, 0, 0, 1, 1,
0.5202361, 0.9871131, -1.053479, 1, 0, 0, 1, 1,
0.520552, -0.4968869, 0.1884738, 1, 0, 0, 1, 1,
0.5218792, -1.542106, 3.330625, 1, 0, 0, 1, 1,
0.522269, -1.721362, 3.445726, 1, 0, 0, 1, 1,
0.5224894, 0.6571921, 1.17673, 0, 0, 0, 1, 1,
0.5268633, -1.466304, 2.085869, 0, 0, 0, 1, 1,
0.5269485, 0.4668253, 0.9358319, 0, 0, 0, 1, 1,
0.5275152, -0.4931622, 4.019966, 0, 0, 0, 1, 1,
0.5303019, 0.7547719, -0.2257395, 0, 0, 0, 1, 1,
0.5318488, -0.08780106, 1.067706, 0, 0, 0, 1, 1,
0.5324948, -1.079047, 1.982793, 0, 0, 0, 1, 1,
0.5335274, -0.4912887, 0.4528519, 1, 1, 1, 1, 1,
0.534242, -0.1721707, 0.4809125, 1, 1, 1, 1, 1,
0.5344719, 2.13686, 0.2362499, 1, 1, 1, 1, 1,
0.5348128, 0.4626424, 1.127592, 1, 1, 1, 1, 1,
0.535471, -0.0334137, 1.433001, 1, 1, 1, 1, 1,
0.5378043, -0.8777571, 1.336995, 1, 1, 1, 1, 1,
0.5378203, 1.024716, -0.5571584, 1, 1, 1, 1, 1,
0.5403471, 0.7317518, 0.07489046, 1, 1, 1, 1, 1,
0.5472769, -1.465324, 4.075511, 1, 1, 1, 1, 1,
0.5505067, 0.3708348, 0.5444962, 1, 1, 1, 1, 1,
0.5528204, -0.500263, 2.525278, 1, 1, 1, 1, 1,
0.5576754, -1.191813, 2.153224, 1, 1, 1, 1, 1,
0.5661674, 0.6356562, -1.47027, 1, 1, 1, 1, 1,
0.5675772, -0.4122934, 0.8929917, 1, 1, 1, 1, 1,
0.5726489, 0.7866207, 2.232918, 1, 1, 1, 1, 1,
0.5727539, -1.576316, 4.121881, 0, 0, 1, 1, 1,
0.5856407, -0.1189682, 2.423887, 1, 0, 0, 1, 1,
0.5863366, -0.8348437, 1.768164, 1, 0, 0, 1, 1,
0.593514, 1.60756, 1.028034, 1, 0, 0, 1, 1,
0.5939022, -0.9943096, 4.22913, 1, 0, 0, 1, 1,
0.5964146, -0.3552682, 1.86121, 1, 0, 0, 1, 1,
0.5995939, -0.4378452, 2.440946, 0, 0, 0, 1, 1,
0.601381, -1.236927, 2.87573, 0, 0, 0, 1, 1,
0.6014488, -2.027195, 2.555829, 0, 0, 0, 1, 1,
0.6017226, -1.076894, 2.624837, 0, 0, 0, 1, 1,
0.6073118, -2.505733, 2.884536, 0, 0, 0, 1, 1,
0.6129656, 2.197432, -0.005141057, 0, 0, 0, 1, 1,
0.6149136, -0.168736, 2.399106, 0, 0, 0, 1, 1,
0.6161841, -0.718305, 2.134705, 1, 1, 1, 1, 1,
0.6166605, -0.4771001, 3.508506, 1, 1, 1, 1, 1,
0.6185442, 0.2223308, 3.007496, 1, 1, 1, 1, 1,
0.6205353, 0.8372315, 0.5573934, 1, 1, 1, 1, 1,
0.6214211, 0.4268386, 1.643379, 1, 1, 1, 1, 1,
0.6217395, -0.4636107, 0.9901827, 1, 1, 1, 1, 1,
0.6267701, 1.519325, -0.07374957, 1, 1, 1, 1, 1,
0.635573, -1.625738, 2.066232, 1, 1, 1, 1, 1,
0.6367094, -0.1687777, 1.372587, 1, 1, 1, 1, 1,
0.6386415, 0.3712637, 1.266353, 1, 1, 1, 1, 1,
0.6397038, 0.2056787, 1.11689, 1, 1, 1, 1, 1,
0.6437216, 0.9378924, 0.6103581, 1, 1, 1, 1, 1,
0.6449088, -0.3050916, 3.632505, 1, 1, 1, 1, 1,
0.6478574, -1.061805, 2.969035, 1, 1, 1, 1, 1,
0.6557497, 1.369383, 0.939985, 1, 1, 1, 1, 1,
0.657861, 0.849569, -0.1658917, 0, 0, 1, 1, 1,
0.6624177, 0.194763, 0.6195967, 1, 0, 0, 1, 1,
0.6650511, -0.7140732, 2.771622, 1, 0, 0, 1, 1,
0.6766604, 1.098253, -1.263424, 1, 0, 0, 1, 1,
0.6832233, -2.303085, 2.229348, 1, 0, 0, 1, 1,
0.6861001, -0.5856286, 1.846511, 1, 0, 0, 1, 1,
0.6912441, -0.3029337, 1.762116, 0, 0, 0, 1, 1,
0.6962261, 0.6917683, -0.2132256, 0, 0, 0, 1, 1,
0.6962504, 0.8477423, 1.280191, 0, 0, 0, 1, 1,
0.6962567, 0.6809465, 1.994361, 0, 0, 0, 1, 1,
0.6972168, -1.263712, 2.819518, 0, 0, 0, 1, 1,
0.6995235, -0.6084207, 2.393099, 0, 0, 0, 1, 1,
0.7100016, -0.7802818, 3.643, 0, 0, 0, 1, 1,
0.7145265, -1.676361, 2.63926, 1, 1, 1, 1, 1,
0.7156201, -0.7488843, 0.2705247, 1, 1, 1, 1, 1,
0.7192553, 0.09586727, 2.310847, 1, 1, 1, 1, 1,
0.728392, -2.039571, 2.928482, 1, 1, 1, 1, 1,
0.7290711, 0.8545461, 0.5567224, 1, 1, 1, 1, 1,
0.7298976, 1.708891, 0.9462468, 1, 1, 1, 1, 1,
0.7302679, 0.7229015, -1.052869, 1, 1, 1, 1, 1,
0.7333429, -0.8823206, 3.758793, 1, 1, 1, 1, 1,
0.7357618, 1.097695, 1.689762, 1, 1, 1, 1, 1,
0.7390016, -0.5290241, 1.495214, 1, 1, 1, 1, 1,
0.73969, -1.252676, 1.983985, 1, 1, 1, 1, 1,
0.7410011, -0.6820861, 2.900118, 1, 1, 1, 1, 1,
0.7487541, -0.09403458, 1.920243, 1, 1, 1, 1, 1,
0.7500841, 0.8456268, 0.05279414, 1, 1, 1, 1, 1,
0.7528106, 1.546556, 1.03166, 1, 1, 1, 1, 1,
0.7541724, 0.5599331, -0.4064923, 0, 0, 1, 1, 1,
0.7610073, -0.3676955, 1.161295, 1, 0, 0, 1, 1,
0.7638146, 0.9313678, 1.408055, 1, 0, 0, 1, 1,
0.7669116, -1.444894, 2.362774, 1, 0, 0, 1, 1,
0.7672582, 1.217577, -0.7627383, 1, 0, 0, 1, 1,
0.7698553, 0.2676832, 2.521084, 1, 0, 0, 1, 1,
0.7698729, -1.047048, 3.65872, 0, 0, 0, 1, 1,
0.7722147, 0.7079589, 1.790711, 0, 0, 0, 1, 1,
0.7764466, 1.068663, 1.03776, 0, 0, 0, 1, 1,
0.7793507, 0.09708982, 1.576123, 0, 0, 0, 1, 1,
0.7867116, -0.06630753, 1.392462, 0, 0, 0, 1, 1,
0.7873412, -0.5878868, 3.132928, 0, 0, 0, 1, 1,
0.7924814, 1.761151, 0.3352536, 0, 0, 0, 1, 1,
0.7957731, 0.9390576, 1.284375, 1, 1, 1, 1, 1,
0.7965959, 0.2697334, 2.004062, 1, 1, 1, 1, 1,
0.798833, -1.081205, 2.960504, 1, 1, 1, 1, 1,
0.7992715, -0.5204934, 2.235137, 1, 1, 1, 1, 1,
0.8018726, 0.02082402, 2.189816, 1, 1, 1, 1, 1,
0.8037525, -0.2585384, 1.870103, 1, 1, 1, 1, 1,
0.8112493, -1.758508, 2.225916, 1, 1, 1, 1, 1,
0.8138667, 1.292864, 0.007249654, 1, 1, 1, 1, 1,
0.8148382, -0.7982627, 1.496942, 1, 1, 1, 1, 1,
0.8227125, 0.06102002, 3.492081, 1, 1, 1, 1, 1,
0.8227571, 0.2457205, -0.2217463, 1, 1, 1, 1, 1,
0.8249778, -0.6699211, 3.459349, 1, 1, 1, 1, 1,
0.8321828, -1.2639, 4.256707, 1, 1, 1, 1, 1,
0.833089, -0.06532053, 1.911363, 1, 1, 1, 1, 1,
0.8337454, -1.617191, 3.229441, 1, 1, 1, 1, 1,
0.8364682, -0.2482377, 0.2316633, 0, 0, 1, 1, 1,
0.8398343, 0.4421151, 0.5038554, 1, 0, 0, 1, 1,
0.8440076, 1.148663, 3.329632, 1, 0, 0, 1, 1,
0.8462514, 0.5117757, -0.4799871, 1, 0, 0, 1, 1,
0.8469261, -0.9724393, 1.966517, 1, 0, 0, 1, 1,
0.850267, 1.03404, 0.7495086, 1, 0, 0, 1, 1,
0.8554693, -2.543258, 3.034466, 0, 0, 0, 1, 1,
0.8571159, -1.342346, 1.484899, 0, 0, 0, 1, 1,
0.861696, -0.8624914, 2.074574, 0, 0, 0, 1, 1,
0.8656896, -1.540236, 2.213863, 0, 0, 0, 1, 1,
0.8663463, 0.4686342, 1.190667, 0, 0, 0, 1, 1,
0.8754549, -0.7157228, 3.789542, 0, 0, 0, 1, 1,
0.8756989, 1.057082, 0.3005053, 0, 0, 0, 1, 1,
0.8818589, -0.5424816, 2.389925, 1, 1, 1, 1, 1,
0.8835401, 0.2195913, 0.5949697, 1, 1, 1, 1, 1,
0.8866259, -0.816766, 3.171593, 1, 1, 1, 1, 1,
0.902813, -1.401219, 3.675679, 1, 1, 1, 1, 1,
0.9063141, 0.1065656, 1.957312, 1, 1, 1, 1, 1,
0.906474, 2.173951, 0.2049334, 1, 1, 1, 1, 1,
0.9104878, 0.6054573, 2.406945, 1, 1, 1, 1, 1,
0.9186858, -0.7217574, 3.510766, 1, 1, 1, 1, 1,
0.9260702, -1.405631, 2.401153, 1, 1, 1, 1, 1,
0.929906, 1.057144, 0.1775589, 1, 1, 1, 1, 1,
0.9312949, -0.7204554, 3.458154, 1, 1, 1, 1, 1,
0.9378377, 0.5712825, 1.920361, 1, 1, 1, 1, 1,
0.940456, 0.9252692, 0.2108115, 1, 1, 1, 1, 1,
0.945861, -1.448939, 3.149204, 1, 1, 1, 1, 1,
0.9513412, 1.231845, -0.7598361, 1, 1, 1, 1, 1,
0.9524861, 1.062806, 0.2808473, 0, 0, 1, 1, 1,
0.952507, 0.9575443, -0.1679884, 1, 0, 0, 1, 1,
0.9556754, -0.5866855, 2.275143, 1, 0, 0, 1, 1,
0.9669927, -1.115513, 3.59301, 1, 0, 0, 1, 1,
0.9704733, 0.08761408, 0.5803688, 1, 0, 0, 1, 1,
0.9830843, -0.05807086, 3.53168, 1, 0, 0, 1, 1,
0.9863049, -2.271908, 4.176962, 0, 0, 0, 1, 1,
0.9866258, -0.4452252, 2.081506, 0, 0, 0, 1, 1,
0.9867622, 0.5272789, 1.135289, 0, 0, 0, 1, 1,
0.9878767, 1.165774, 0.08797844, 0, 0, 0, 1, 1,
0.9909265, 1.893238, 0.4289456, 0, 0, 0, 1, 1,
0.9912827, 1.141294, -0.7330468, 0, 0, 0, 1, 1,
0.9967281, 0.5889646, -0.6559271, 0, 0, 0, 1, 1,
1.006541, -0.764348, 3.540684, 1, 1, 1, 1, 1,
1.009503, -0.1980601, 2.497573, 1, 1, 1, 1, 1,
1.014835, 0.3979693, 0.007457698, 1, 1, 1, 1, 1,
1.021634, -0.2875023, 1.347619, 1, 1, 1, 1, 1,
1.022615, 0.6605131, 1.607763, 1, 1, 1, 1, 1,
1.025298, -0.1965545, 1.724841, 1, 1, 1, 1, 1,
1.027471, -1.471665, 2.730948, 1, 1, 1, 1, 1,
1.031356, -0.4057217, 0.4437816, 1, 1, 1, 1, 1,
1.044266, -1.580935, 2.215091, 1, 1, 1, 1, 1,
1.047715, -0.1249432, 0.8765561, 1, 1, 1, 1, 1,
1.048286, 0.870893, -0.428562, 1, 1, 1, 1, 1,
1.063498, -0.6858675, 2.852568, 1, 1, 1, 1, 1,
1.085378, 1.620808, -1.042729, 1, 1, 1, 1, 1,
1.087097, 1.14964, 0.9609601, 1, 1, 1, 1, 1,
1.08726, -3.026767, 3.198149, 1, 1, 1, 1, 1,
1.088099, -0.03158402, 3.65383, 0, 0, 1, 1, 1,
1.097378, 0.1905779, 1.492227, 1, 0, 0, 1, 1,
1.097595, 0.03121561, 3.268098, 1, 0, 0, 1, 1,
1.098423, -1.000245, 1.950497, 1, 0, 0, 1, 1,
1.101367, -0.2975486, 0.6526174, 1, 0, 0, 1, 1,
1.103216, 1.793211, 0.4267953, 1, 0, 0, 1, 1,
1.107978, -0.02785779, 0.8247173, 0, 0, 0, 1, 1,
1.10856, 0.3755776, 0.4654489, 0, 0, 0, 1, 1,
1.113039, -0.2735218, 3.458206, 0, 0, 0, 1, 1,
1.114626, -0.03264766, 3.062405, 0, 0, 0, 1, 1,
1.119723, 0.7879477, 2.400097, 0, 0, 0, 1, 1,
1.128275, -0.02541856, 1.538707, 0, 0, 0, 1, 1,
1.131911, 1.27641, 0.821915, 0, 0, 0, 1, 1,
1.141103, 0.7309864, -0.2713447, 1, 1, 1, 1, 1,
1.144695, -0.4294451, 4.351005, 1, 1, 1, 1, 1,
1.14736, -0.3569967, 1.930913, 1, 1, 1, 1, 1,
1.157004, -0.5905273, 1.430591, 1, 1, 1, 1, 1,
1.162643, -0.7287188, 1.880315, 1, 1, 1, 1, 1,
1.166581, 2.515173, 0.05042774, 1, 1, 1, 1, 1,
1.168588, 1.032133, 0.6529806, 1, 1, 1, 1, 1,
1.176746, -0.7759794, 1.727155, 1, 1, 1, 1, 1,
1.180089, 1.437174, 1.737677, 1, 1, 1, 1, 1,
1.183303, 0.06660239, 3.297675, 1, 1, 1, 1, 1,
1.190988, -0.1207474, 1.961577, 1, 1, 1, 1, 1,
1.194404, 0.3288321, 0.3780007, 1, 1, 1, 1, 1,
1.203716, -1.492647, 1.872341, 1, 1, 1, 1, 1,
1.205085, 0.2976114, 0.2781247, 1, 1, 1, 1, 1,
1.211881, -0.4686211, 2.039327, 1, 1, 1, 1, 1,
1.224485, 0.6188279, 2.152941, 0, 0, 1, 1, 1,
1.225148, -2.402602, 2.811366, 1, 0, 0, 1, 1,
1.226079, 1.785706, 1.10997, 1, 0, 0, 1, 1,
1.241658, 0.08750989, 1.836432, 1, 0, 0, 1, 1,
1.250387, -1.029482, 2.404454, 1, 0, 0, 1, 1,
1.251258, -1.476664, 2.627724, 1, 0, 0, 1, 1,
1.255937, -0.5079246, 2.086885, 0, 0, 0, 1, 1,
1.264966, 0.3101557, 2.211944, 0, 0, 0, 1, 1,
1.280664, 0.4364412, 1.446802, 0, 0, 0, 1, 1,
1.281405, -0.2868282, 1.112319, 0, 0, 0, 1, 1,
1.284469, 1.778569, 1.107095, 0, 0, 0, 1, 1,
1.285201, -0.03608019, 2.39298, 0, 0, 0, 1, 1,
1.288322, 0.1458485, 2.498477, 0, 0, 0, 1, 1,
1.291916, 0.9923377, 0.849637, 1, 1, 1, 1, 1,
1.308644, -0.5550746, 1.588042, 1, 1, 1, 1, 1,
1.314465, -0.4732185, 0.8131231, 1, 1, 1, 1, 1,
1.319366, 0.6249059, 1.290218, 1, 1, 1, 1, 1,
1.325282, 0.395638, 1.574998, 1, 1, 1, 1, 1,
1.329029, 0.9427912, 2.020483, 1, 1, 1, 1, 1,
1.330837, -0.296403, 1.7213, 1, 1, 1, 1, 1,
1.332469, -0.4068513, 2.955361, 1, 1, 1, 1, 1,
1.332799, -1.192556, 2.781207, 1, 1, 1, 1, 1,
1.337297, -0.3778427, 2.881857, 1, 1, 1, 1, 1,
1.353878, 1.498675, 1.095863, 1, 1, 1, 1, 1,
1.392225, 0.8040966, 2.548998, 1, 1, 1, 1, 1,
1.392739, 1.118564, 2.194459, 1, 1, 1, 1, 1,
1.394002, -0.08265435, 0.3131076, 1, 1, 1, 1, 1,
1.410964, -1.948271, 4.827166, 1, 1, 1, 1, 1,
1.419172, 1.853937, 1.839815, 0, 0, 1, 1, 1,
1.421141, 1.650524, -0.1232727, 1, 0, 0, 1, 1,
1.426157, -0.395578, 2.700426, 1, 0, 0, 1, 1,
1.429138, -0.8131208, 3.553787, 1, 0, 0, 1, 1,
1.433394, -0.9188358, 2.225964, 1, 0, 0, 1, 1,
1.44403, 0.3283266, 1.19637, 1, 0, 0, 1, 1,
1.457091, 0.08224241, 1.904399, 0, 0, 0, 1, 1,
1.46632, -0.000197539, 1.701046, 0, 0, 0, 1, 1,
1.470501, 1.13471, 1.312119, 0, 0, 0, 1, 1,
1.489532, 0.97295, 0.5546893, 0, 0, 0, 1, 1,
1.503697, -1.567942, 2.893399, 0, 0, 0, 1, 1,
1.509613, -0.4612388, 0.7410878, 0, 0, 0, 1, 1,
1.51, -0.7299342, 1.749758, 0, 0, 0, 1, 1,
1.517482, 0.7138319, 1.52613, 1, 1, 1, 1, 1,
1.517669, -1.726293, 3.375362, 1, 1, 1, 1, 1,
1.521277, -1.268026, 1.689661, 1, 1, 1, 1, 1,
1.524368, 1.18856, 1.281515, 1, 1, 1, 1, 1,
1.529442, -0.008737196, 2.130686, 1, 1, 1, 1, 1,
1.549591, -1.595786, 2.666848, 1, 1, 1, 1, 1,
1.553727, -0.3452628, 1.761765, 1, 1, 1, 1, 1,
1.560231, 0.1264628, 2.427593, 1, 1, 1, 1, 1,
1.57673, 0.7573543, 2.165357, 1, 1, 1, 1, 1,
1.591596, -0.2913731, 0.1135054, 1, 1, 1, 1, 1,
1.594682, 1.523139, 2.297403, 1, 1, 1, 1, 1,
1.617467, 1.273604, 1.669412, 1, 1, 1, 1, 1,
1.631845, 1.405941, 0.5272828, 1, 1, 1, 1, 1,
1.666047, -0.9156222, 1.366625, 1, 1, 1, 1, 1,
1.666678, -1.169641, 2.673225, 1, 1, 1, 1, 1,
1.680946, 0.8658925, 1.525497, 0, 0, 1, 1, 1,
1.680948, 1.14496, -0.2315427, 1, 0, 0, 1, 1,
1.687978, 0.4437847, 0.6532577, 1, 0, 0, 1, 1,
1.692103, -0.05652653, 1.468427, 1, 0, 0, 1, 1,
1.693593, 0.4342535, 0.4518088, 1, 0, 0, 1, 1,
1.699147, -0.4817951, 3.650066, 1, 0, 0, 1, 1,
1.707766, -0.00648208, 1.031586, 0, 0, 0, 1, 1,
1.715036, -1.370293, 1.002438, 0, 0, 0, 1, 1,
1.718706, -0.873624, 1.263094, 0, 0, 0, 1, 1,
1.737091, -0.2638543, 1.406318, 0, 0, 0, 1, 1,
1.741637, -1.01547, 1.895413, 0, 0, 0, 1, 1,
1.743205, -1.245488, 0.9929301, 0, 0, 0, 1, 1,
1.745485, 1.313166, 0.535183, 0, 0, 0, 1, 1,
1.746894, -0.6779192, 1.725336, 1, 1, 1, 1, 1,
1.750771, -0.3122084, 3.328438, 1, 1, 1, 1, 1,
1.778252, -1.400405, 2.821494, 1, 1, 1, 1, 1,
1.802351, -0.1059353, 2.253058, 1, 1, 1, 1, 1,
1.823883, 1.003306, 0.6692998, 1, 1, 1, 1, 1,
1.850452, 1.964201, 0.9675858, 1, 1, 1, 1, 1,
1.867522, 0.2281709, 1.398873, 1, 1, 1, 1, 1,
1.878811, 1.60764, -1.152284, 1, 1, 1, 1, 1,
1.88019, -1.548767, 4.801932, 1, 1, 1, 1, 1,
1.903669, -1.385707, 1.892481, 1, 1, 1, 1, 1,
1.917168, -0.07227658, 0.867321, 1, 1, 1, 1, 1,
1.920418, -0.8231168, 2.244577, 1, 1, 1, 1, 1,
1.95532, -0.7347696, 3.202912, 1, 1, 1, 1, 1,
1.961594, 0.4896224, 1.422443, 1, 1, 1, 1, 1,
2.014774, 0.2631255, 1.450001, 1, 1, 1, 1, 1,
2.018383, 1.153346, -0.5879695, 0, 0, 1, 1, 1,
2.065574, -0.2595879, 3.144163, 1, 0, 0, 1, 1,
2.07772, -1.619115, 3.837798, 1, 0, 0, 1, 1,
2.082109, -0.8123215, 1.302279, 1, 0, 0, 1, 1,
2.083909, 0.602897, 1.202511, 1, 0, 0, 1, 1,
2.08573, -1.629681, 3.286593, 1, 0, 0, 1, 1,
2.114631, 1.292658, 2.007747, 0, 0, 0, 1, 1,
2.141453, -1.276528, 3.261698, 0, 0, 0, 1, 1,
2.151576, -0.2824269, -0.2087403, 0, 0, 0, 1, 1,
2.191175, -1.02644, 2.144495, 0, 0, 0, 1, 1,
2.1985, 0.2311698, 0.9431849, 0, 0, 0, 1, 1,
2.303765, 0.6032571, 1.14555, 0, 0, 0, 1, 1,
2.308789, -1.720085, 2.003563, 0, 0, 0, 1, 1,
2.312121, 0.2584186, 1.941364, 1, 1, 1, 1, 1,
2.500366, 1.003394, 0.6601515, 1, 1, 1, 1, 1,
2.602084, -0.1909518, 1.856117, 1, 1, 1, 1, 1,
2.702025, 1.096465, 1.759378, 1, 1, 1, 1, 1,
2.703233, 0.2243976, 2.230864, 1, 1, 1, 1, 1,
3.12015, 1.188607, 1.891824, 1, 1, 1, 1, 1,
3.256959, -0.5554363, 4.653854, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 9.610741;
var distance = 33.75732;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.3077047, -0.334796, -0.3556304 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.75732);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>
