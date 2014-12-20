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
-3.492634, -1.074648, -2.001407, 1, 0, 0, 1,
-2.991995, 0.25478, -2.174182, 1, 0.007843138, 0, 1,
-2.808663, 0.185167, -1.741799, 1, 0.01176471, 0, 1,
-2.629689, 1.592899, -2.216705, 1, 0.01960784, 0, 1,
-2.533437, 0.449884, -1.753801, 1, 0.02352941, 0, 1,
-2.528413, 1.451891, -0.1942668, 1, 0.03137255, 0, 1,
-2.451626, 0.3595225, -1.519483, 1, 0.03529412, 0, 1,
-2.427053, 0.5896243, 0.1390507, 1, 0.04313726, 0, 1,
-2.405294, 0.8041201, -0.2841393, 1, 0.04705882, 0, 1,
-2.393594, 0.1803953, 0.8618143, 1, 0.05490196, 0, 1,
-2.377862, -1.647475, -1.888969, 1, 0.05882353, 0, 1,
-2.371967, 0.1701298, 1.981736, 1, 0.06666667, 0, 1,
-2.336131, -1.939077, -2.388092, 1, 0.07058824, 0, 1,
-2.307615, 0.6628875, -1.381339, 1, 0.07843138, 0, 1,
-2.306762, 2.617454, -0.853214, 1, 0.08235294, 0, 1,
-2.263285, -0.2719473, -2.467998, 1, 0.09019608, 0, 1,
-2.238267, 0.1919365, -2.260626, 1, 0.09411765, 0, 1,
-2.153337, -0.0761472, -3.103633, 1, 0.1019608, 0, 1,
-2.152302, 1.150959, -2.557506, 1, 0.1098039, 0, 1,
-2.129714, -0.3491575, -0.1536117, 1, 0.1137255, 0, 1,
-2.101724, 0.186283, -1.206448, 1, 0.1215686, 0, 1,
-2.088686, 0.8067545, -1.852169, 1, 0.1254902, 0, 1,
-2.034342, 1.086598, -0.8740694, 1, 0.1333333, 0, 1,
-2.029997, -0.7179229, -2.723747, 1, 0.1372549, 0, 1,
-2.002831, -1.64052, -2.823544, 1, 0.145098, 0, 1,
-2.001423, -0.808086, -3.065223, 1, 0.1490196, 0, 1,
-1.989713, -0.7594869, -3.610291, 1, 0.1568628, 0, 1,
-1.96682, -0.774057, -2.806422, 1, 0.1607843, 0, 1,
-1.94184, -0.5068632, -1.072833, 1, 0.1686275, 0, 1,
-1.938909, -0.3929507, -2.001764, 1, 0.172549, 0, 1,
-1.923298, 1.665986, -2.408083, 1, 0.1803922, 0, 1,
-1.911334, -0.8402941, -2.102862, 1, 0.1843137, 0, 1,
-1.890424, 0.09138403, -1.960074, 1, 0.1921569, 0, 1,
-1.882133, -0.4136682, -2.542419, 1, 0.1960784, 0, 1,
-1.866814, 1.074389, -1.580389, 1, 0.2039216, 0, 1,
-1.850909, 0.9748008, -1.636608, 1, 0.2117647, 0, 1,
-1.838522, 1.745482, 0.6178852, 1, 0.2156863, 0, 1,
-1.829777, 0.670037, -0.3929521, 1, 0.2235294, 0, 1,
-1.819667, 0.301919, -1.38157, 1, 0.227451, 0, 1,
-1.800233, 0.1287618, -0.7944927, 1, 0.2352941, 0, 1,
-1.786979, -0.8445384, -2.756476, 1, 0.2392157, 0, 1,
-1.775481, 1.661921, 0.004028268, 1, 0.2470588, 0, 1,
-1.7601, 0.2384011, -0.8743042, 1, 0.2509804, 0, 1,
-1.752696, 0.2247083, -0.5871214, 1, 0.2588235, 0, 1,
-1.74955, 0.0751434, -2.269625, 1, 0.2627451, 0, 1,
-1.741241, 1.11277, -1.784422, 1, 0.2705882, 0, 1,
-1.723495, -0.4418485, -1.152499, 1, 0.2745098, 0, 1,
-1.711649, 0.5324503, -0.2643864, 1, 0.282353, 0, 1,
-1.700197, 0.8411411, -1.734837, 1, 0.2862745, 0, 1,
-1.694146, 1.422296, -1.666326, 1, 0.2941177, 0, 1,
-1.692611, 1.496239, -1.931515, 1, 0.3019608, 0, 1,
-1.681971, 2.107711, -1.124743, 1, 0.3058824, 0, 1,
-1.680354, -1.172166, -1.955186, 1, 0.3137255, 0, 1,
-1.664693, -0.2869382, -1.595701, 1, 0.3176471, 0, 1,
-1.663521, -0.08688347, -1.887672, 1, 0.3254902, 0, 1,
-1.662969, -1.332954, -2.896062, 1, 0.3294118, 0, 1,
-1.646821, -0.5256132, -2.762157, 1, 0.3372549, 0, 1,
-1.635903, -0.1902598, -0.9693052, 1, 0.3411765, 0, 1,
-1.629659, 1.045398, -3.002155, 1, 0.3490196, 0, 1,
-1.615968, 0.4516026, 0.1441691, 1, 0.3529412, 0, 1,
-1.613316, 2.085293, -0.757488, 1, 0.3607843, 0, 1,
-1.597847, 0.7968788, -3.018071, 1, 0.3647059, 0, 1,
-1.551713, -0.01379531, -2.199839, 1, 0.372549, 0, 1,
-1.549651, -0.06985096, 0.1183233, 1, 0.3764706, 0, 1,
-1.546608, 0.79081, -0.003214439, 1, 0.3843137, 0, 1,
-1.536327, 0.1843496, -2.89896, 1, 0.3882353, 0, 1,
-1.534502, 0.3492461, -1.605158, 1, 0.3960784, 0, 1,
-1.528928, 0.8240439, -2.042727, 1, 0.4039216, 0, 1,
-1.522288, 0.140498, -1.111252, 1, 0.4078431, 0, 1,
-1.521056, 0.01504199, -3.56884, 1, 0.4156863, 0, 1,
-1.516147, -0.9761066, -0.985405, 1, 0.4196078, 0, 1,
-1.511954, 1.333846, 0.2575953, 1, 0.427451, 0, 1,
-1.4973, 0.8058257, -1.98409, 1, 0.4313726, 0, 1,
-1.489306, 0.8854778, -1.615158, 1, 0.4392157, 0, 1,
-1.476431, -0.4751755, -0.9688227, 1, 0.4431373, 0, 1,
-1.468177, -0.08997412, -3.116755, 1, 0.4509804, 0, 1,
-1.457902, -2.02981, -3.038453, 1, 0.454902, 0, 1,
-1.453498, -1.814111, -2.983426, 1, 0.4627451, 0, 1,
-1.452764, -0.4844423, -2.614059, 1, 0.4666667, 0, 1,
-1.434912, -1.131235, -0.8696365, 1, 0.4745098, 0, 1,
-1.42531, -1.074284, -2.574026, 1, 0.4784314, 0, 1,
-1.41839, -3.05728, -2.971973, 1, 0.4862745, 0, 1,
-1.415482, -1.291002, -3.591295, 1, 0.4901961, 0, 1,
-1.412977, 0.5435478, -0.2219154, 1, 0.4980392, 0, 1,
-1.412924, -0.8365267, -1.476195, 1, 0.5058824, 0, 1,
-1.400575, 0.4213165, -2.19419, 1, 0.509804, 0, 1,
-1.400022, 0.4808998, -2.995231, 1, 0.5176471, 0, 1,
-1.377751, 0.1777958, -2.045416, 1, 0.5215687, 0, 1,
-1.36946, -1.898951, -2.550324, 1, 0.5294118, 0, 1,
-1.341662, 0.6950119, -1.992164, 1, 0.5333334, 0, 1,
-1.340791, 0.3463115, 0.09988803, 1, 0.5411765, 0, 1,
-1.33792, -0.2702886, 1.279756, 1, 0.5450981, 0, 1,
-1.335243, -0.8559821, -2.693063, 1, 0.5529412, 0, 1,
-1.332374, -1.432284, -3.748879, 1, 0.5568628, 0, 1,
-1.324232, -0.4079566, -4.115922, 1, 0.5647059, 0, 1,
-1.317455, 0.2490431, 0.06196081, 1, 0.5686275, 0, 1,
-1.314629, -2.239082, -2.834997, 1, 0.5764706, 0, 1,
-1.305424, -0.4065214, -2.433746, 1, 0.5803922, 0, 1,
-1.298306, -0.7003304, -1.033577, 1, 0.5882353, 0, 1,
-1.29579, -2.549746, -2.325276, 1, 0.5921569, 0, 1,
-1.295237, -0.2340317, -1.504798, 1, 0.6, 0, 1,
-1.294478, -0.4391548, -1.794781, 1, 0.6078432, 0, 1,
-1.29359, 1.323086, 0.1027637, 1, 0.6117647, 0, 1,
-1.292132, -0.345976, -2.063248, 1, 0.6196079, 0, 1,
-1.289397, -0.05829742, -2.128932, 1, 0.6235294, 0, 1,
-1.280253, 1.507126, -0.08420178, 1, 0.6313726, 0, 1,
-1.272668, 0.2660268, -2.354228, 1, 0.6352941, 0, 1,
-1.26556, 0.6433491, -0.7540234, 1, 0.6431373, 0, 1,
-1.256634, 0.9272524, -2.051604, 1, 0.6470588, 0, 1,
-1.246491, 0.4001235, -2.77728, 1, 0.654902, 0, 1,
-1.244324, -0.09657849, -2.970958, 1, 0.6588235, 0, 1,
-1.241013, -0.2772745, -1.846292, 1, 0.6666667, 0, 1,
-1.238038, -0.8995646, -2.085271, 1, 0.6705883, 0, 1,
-1.23633, 0.9654045, 0.3214006, 1, 0.6784314, 0, 1,
-1.22911, -1.29054, -1.913798, 1, 0.682353, 0, 1,
-1.223666, 0.6495171, -1.783581, 1, 0.6901961, 0, 1,
-1.220313, 0.1351544, -3.067987, 1, 0.6941177, 0, 1,
-1.212894, 0.1431146, 0.4012308, 1, 0.7019608, 0, 1,
-1.187912, 0.4344411, -2.287508, 1, 0.7098039, 0, 1,
-1.175317, 0.5055143, -0.4458718, 1, 0.7137255, 0, 1,
-1.16527, 0.0696041, -1.198503, 1, 0.7215686, 0, 1,
-1.157356, -0.7476591, -2.512491, 1, 0.7254902, 0, 1,
-1.141986, 1.841494, -0.1572167, 1, 0.7333333, 0, 1,
-1.140753, 0.1071457, 0.3590061, 1, 0.7372549, 0, 1,
-1.139566, 1.285599, -1.6521, 1, 0.7450981, 0, 1,
-1.137675, -0.1879064, -1.311299, 1, 0.7490196, 0, 1,
-1.135008, -0.3937385, -0.3379003, 1, 0.7568628, 0, 1,
-1.134042, 0.8500208, -0.4536124, 1, 0.7607843, 0, 1,
-1.131187, -0.6743453, -2.516321, 1, 0.7686275, 0, 1,
-1.127536, -0.4447262, -2.228046, 1, 0.772549, 0, 1,
-1.124359, -0.4099659, -1.399279, 1, 0.7803922, 0, 1,
-1.099089, -0.3257133, -1.893462, 1, 0.7843137, 0, 1,
-1.097453, -2.364621, -2.438857, 1, 0.7921569, 0, 1,
-1.09358, 0.5832646, -1.672173, 1, 0.7960784, 0, 1,
-1.091108, 1.772869, -1.097764, 1, 0.8039216, 0, 1,
-1.086959, -0.6761739, -1.700732, 1, 0.8117647, 0, 1,
-1.079621, -0.4345708, -1.663382, 1, 0.8156863, 0, 1,
-1.075086, -0.6496574, -2.57619, 1, 0.8235294, 0, 1,
-1.072112, -0.6288147, -1.665915, 1, 0.827451, 0, 1,
-1.071137, -1.206271, -1.063765, 1, 0.8352941, 0, 1,
-1.066484, 0.2574365, -0.92462, 1, 0.8392157, 0, 1,
-1.065554, -0.4569288, -1.793173, 1, 0.8470588, 0, 1,
-1.065432, 0.9627281, 1.180239, 1, 0.8509804, 0, 1,
-1.059963, -0.03785423, -1.536662, 1, 0.8588235, 0, 1,
-1.047256, 1.714384, -0.1189381, 1, 0.8627451, 0, 1,
-1.040443, -0.3125297, -2.720475, 1, 0.8705882, 0, 1,
-1.03466, -0.02185792, -1.074426, 1, 0.8745098, 0, 1,
-1.03326, -2.064713, -4.200845, 1, 0.8823529, 0, 1,
-1.032197, -0.7599964, -1.682685, 1, 0.8862745, 0, 1,
-1.031219, -1.013224, -1.316101, 1, 0.8941177, 0, 1,
-1.023396, -0.6432474, -3.593255, 1, 0.8980392, 0, 1,
-1.022052, -0.3961255, -1.319082, 1, 0.9058824, 0, 1,
-1.015931, 0.2467845, -2.937859, 1, 0.9137255, 0, 1,
-1.006236, -1.274326, -2.537314, 1, 0.9176471, 0, 1,
-1.005695, 0.2796368, -1.009741, 1, 0.9254902, 0, 1,
-1.003605, 0.1824234, -0.4846728, 1, 0.9294118, 0, 1,
-0.9995447, 1.382091, -0.9211842, 1, 0.9372549, 0, 1,
-0.9951549, 0.1816575, -1.402351, 1, 0.9411765, 0, 1,
-0.9933512, -0.409455, -2.48237, 1, 0.9490196, 0, 1,
-0.9899349, -1.125879, -1.344432, 1, 0.9529412, 0, 1,
-0.9866429, 0.6407353, 0.9608404, 1, 0.9607843, 0, 1,
-0.9860545, -0.2175769, -0.6555865, 1, 0.9647059, 0, 1,
-0.9825883, 1.33858, -1.746039, 1, 0.972549, 0, 1,
-0.9818271, 1.305379, -1.516012, 1, 0.9764706, 0, 1,
-0.9803693, 0.08525894, -2.591492, 1, 0.9843137, 0, 1,
-0.9784302, -0.2171117, -2.029262, 1, 0.9882353, 0, 1,
-0.9695754, 0.5619385, -0.1816716, 1, 0.9960784, 0, 1,
-0.9657407, 0.1602303, -0.8346131, 0.9960784, 1, 0, 1,
-0.9650908, 0.1423939, -1.558835, 0.9921569, 1, 0, 1,
-0.964649, -0.5070076, -0.298825, 0.9843137, 1, 0, 1,
-0.9574356, 0.2087635, -1.4107, 0.9803922, 1, 0, 1,
-0.9543219, -0.1641966, -2.21307, 0.972549, 1, 0, 1,
-0.9508258, 0.3995144, -0.5772544, 0.9686275, 1, 0, 1,
-0.9493252, 0.3849429, -0.2155713, 0.9607843, 1, 0, 1,
-0.9476965, 0.311818, -1.670498, 0.9568627, 1, 0, 1,
-0.9462858, 1.284899, 0.4893552, 0.9490196, 1, 0, 1,
-0.9430155, 1.15713, -0.7254168, 0.945098, 1, 0, 1,
-0.9334154, -0.3503585, -1.976277, 0.9372549, 1, 0, 1,
-0.9324225, -0.01927218, -0.6054044, 0.9333333, 1, 0, 1,
-0.9285863, 0.5807014, -2.077113, 0.9254902, 1, 0, 1,
-0.9252121, -1.352912, -4.334375, 0.9215686, 1, 0, 1,
-0.9250315, -0.05310373, -2.426774, 0.9137255, 1, 0, 1,
-0.924737, 0.8207989, -1.869716, 0.9098039, 1, 0, 1,
-0.9216618, 0.3099357, -0.3057039, 0.9019608, 1, 0, 1,
-0.9205778, 0.7153228, -1.886563, 0.8941177, 1, 0, 1,
-0.9168215, 1.34211, 0.1392794, 0.8901961, 1, 0, 1,
-0.9111644, 2.083476, -1.357405, 0.8823529, 1, 0, 1,
-0.9015012, -1.045757, -1.544918, 0.8784314, 1, 0, 1,
-0.9010875, -1.129613, -2.615828, 0.8705882, 1, 0, 1,
-0.8956987, 0.4976653, 0.1852546, 0.8666667, 1, 0, 1,
-0.8831221, -1.088069, -4.040919, 0.8588235, 1, 0, 1,
-0.8820483, 0.6658432, 0.2462022, 0.854902, 1, 0, 1,
-0.8781639, 0.6959626, -0.9587612, 0.8470588, 1, 0, 1,
-0.8723862, 0.147374, -1.147163, 0.8431373, 1, 0, 1,
-0.8681509, -0.2016039, -1.410021, 0.8352941, 1, 0, 1,
-0.8677118, -0.01703023, -1.864339, 0.8313726, 1, 0, 1,
-0.867308, 0.6166139, -1.997776, 0.8235294, 1, 0, 1,
-0.8670454, 1.576668, -1.54322, 0.8196079, 1, 0, 1,
-0.8645548, -0.2149946, -1.31795, 0.8117647, 1, 0, 1,
-0.8631637, 2.295135, -1.163512, 0.8078431, 1, 0, 1,
-0.8601924, 0.09440108, -1.746844, 0.8, 1, 0, 1,
-0.8575075, -0.7053111, -0.8979319, 0.7921569, 1, 0, 1,
-0.8574746, 0.413399, -2.119, 0.7882353, 1, 0, 1,
-0.8571689, 0.430012, -0.8634722, 0.7803922, 1, 0, 1,
-0.8555788, 2.968546, -0.8198951, 0.7764706, 1, 0, 1,
-0.8515186, -0.2397409, -2.148019, 0.7686275, 1, 0, 1,
-0.8447254, 0.8635834, -0.9544488, 0.7647059, 1, 0, 1,
-0.8419904, 0.2060029, -2.21029, 0.7568628, 1, 0, 1,
-0.8372551, -0.2109388, -0.9808183, 0.7529412, 1, 0, 1,
-0.8334687, -2.055679, -3.690974, 0.7450981, 1, 0, 1,
-0.8297657, 0.01258177, -1.950052, 0.7411765, 1, 0, 1,
-0.8255538, -0.8449191, -2.49161, 0.7333333, 1, 0, 1,
-0.8253039, 0.804679, -1.245028, 0.7294118, 1, 0, 1,
-0.8228743, -1.366109, -3.522489, 0.7215686, 1, 0, 1,
-0.8220201, 0.06668274, -1.237105, 0.7176471, 1, 0, 1,
-0.8167847, 0.0832791, -0.6587307, 0.7098039, 1, 0, 1,
-0.816497, -0.4324454, -0.8848558, 0.7058824, 1, 0, 1,
-0.8161988, -0.07251804, -1.572331, 0.6980392, 1, 0, 1,
-0.8125128, -3.386965, -2.209361, 0.6901961, 1, 0, 1,
-0.810935, 0.0528161, -1.116739, 0.6862745, 1, 0, 1,
-0.8066446, 0.1408263, -0.8701164, 0.6784314, 1, 0, 1,
-0.8052269, 0.8206652, 0.1505481, 0.6745098, 1, 0, 1,
-0.8029004, 0.1784208, -1.007737, 0.6666667, 1, 0, 1,
-0.8027567, -1.443697, -1.791265, 0.6627451, 1, 0, 1,
-0.8017168, -0.736987, -2.670312, 0.654902, 1, 0, 1,
-0.7951532, 0.4205568, -1.640104, 0.6509804, 1, 0, 1,
-0.7947578, -0.1344945, -1.160631, 0.6431373, 1, 0, 1,
-0.7931974, -0.1640322, -1.879611, 0.6392157, 1, 0, 1,
-0.7861388, 1.318005, -1.350926, 0.6313726, 1, 0, 1,
-0.7851019, -0.2299009, -1.746526, 0.627451, 1, 0, 1,
-0.7822114, 1.31916, -0.9456726, 0.6196079, 1, 0, 1,
-0.7788556, 0.9541838, -0.8901903, 0.6156863, 1, 0, 1,
-0.7761548, 1.360568, 0.1462882, 0.6078432, 1, 0, 1,
-0.7736876, -0.8998505, -1.377215, 0.6039216, 1, 0, 1,
-0.7663915, 0.4967537, -0.438616, 0.5960785, 1, 0, 1,
-0.761718, 0.2554764, -2.306805, 0.5882353, 1, 0, 1,
-0.7616234, -0.0248768, -0.5948464, 0.5843138, 1, 0, 1,
-0.757571, 1.755638, 1.220678, 0.5764706, 1, 0, 1,
-0.7453019, -1.208994, -2.835493, 0.572549, 1, 0, 1,
-0.7433929, -0.478574, -0.7414281, 0.5647059, 1, 0, 1,
-0.7321693, -2.97743, -4.06343, 0.5607843, 1, 0, 1,
-0.7271841, -0.6339599, -1.376209, 0.5529412, 1, 0, 1,
-0.7246455, 0.0750015, -1.984694, 0.5490196, 1, 0, 1,
-0.7219248, 0.3069386, -2.617961, 0.5411765, 1, 0, 1,
-0.7181667, -0.9635126, -1.750897, 0.5372549, 1, 0, 1,
-0.715701, 0.3483184, -0.7216811, 0.5294118, 1, 0, 1,
-0.7140772, -0.3925484, -1.88413, 0.5254902, 1, 0, 1,
-0.7111221, -0.2247709, -1.66534, 0.5176471, 1, 0, 1,
-0.7018924, 0.2635559, -1.912327, 0.5137255, 1, 0, 1,
-0.7011238, 1.555842, -1.493809, 0.5058824, 1, 0, 1,
-0.696418, -0.383242, -2.441232, 0.5019608, 1, 0, 1,
-0.6948817, 0.3627806, -0.3568794, 0.4941176, 1, 0, 1,
-0.6948321, 1.762086, 0.04798846, 0.4862745, 1, 0, 1,
-0.691258, -3.338763, -2.740592, 0.4823529, 1, 0, 1,
-0.6876805, 0.09433819, -1.248198, 0.4745098, 1, 0, 1,
-0.6847723, 0.4950368, -0.6674616, 0.4705882, 1, 0, 1,
-0.6822062, 1.025453, -1.202745, 0.4627451, 1, 0, 1,
-0.6768486, 0.151971, -1.854443, 0.4588235, 1, 0, 1,
-0.6766096, 1.801756, -0.8921361, 0.4509804, 1, 0, 1,
-0.6762241, 0.5428013, 0.6750676, 0.4470588, 1, 0, 1,
-0.6755478, 0.5823401, -1.955689, 0.4392157, 1, 0, 1,
-0.6732105, 0.1339064, -1.289616, 0.4352941, 1, 0, 1,
-0.6717281, -1.396887, -1.671548, 0.427451, 1, 0, 1,
-0.6707107, -0.9865581, -2.243819, 0.4235294, 1, 0, 1,
-0.6688784, 1.981875, 0.6985186, 0.4156863, 1, 0, 1,
-0.6645699, 0.5356118, 0.3166173, 0.4117647, 1, 0, 1,
-0.6626224, 1.29006, -2.114472, 0.4039216, 1, 0, 1,
-0.6615877, -1.454171, -0.6400476, 0.3960784, 1, 0, 1,
-0.6612555, 0.2686754, -2.415478, 0.3921569, 1, 0, 1,
-0.6597131, 0.2706205, -2.45029, 0.3843137, 1, 0, 1,
-0.6579381, -0.6371158, -3.650282, 0.3803922, 1, 0, 1,
-0.6544459, 0.6800129, -1.250086, 0.372549, 1, 0, 1,
-0.6512196, -0.1908542, -1.239531, 0.3686275, 1, 0, 1,
-0.6493438, 0.4662916, -0.2048747, 0.3607843, 1, 0, 1,
-0.6481727, -1.059074, -2.373644, 0.3568628, 1, 0, 1,
-0.6452046, 0.4526025, -1.194861, 0.3490196, 1, 0, 1,
-0.6429473, -0.2503797, -2.287501, 0.345098, 1, 0, 1,
-0.6380861, -0.6850055, -2.76307, 0.3372549, 1, 0, 1,
-0.637895, 0.06614773, -1.576345, 0.3333333, 1, 0, 1,
-0.6313829, 1.247191, -1.93387, 0.3254902, 1, 0, 1,
-0.6295956, 0.6164168, -0.9730304, 0.3215686, 1, 0, 1,
-0.6272574, -0.5646502, -2.273462, 0.3137255, 1, 0, 1,
-0.6261615, 1.863419, 0.2922326, 0.3098039, 1, 0, 1,
-0.6229898, -0.6637078, -1.151377, 0.3019608, 1, 0, 1,
-0.62155, 0.5362653, -0.4729861, 0.2941177, 1, 0, 1,
-0.6182304, -0.3998444, -0.1907144, 0.2901961, 1, 0, 1,
-0.6181731, -0.2907282, -3.332961, 0.282353, 1, 0, 1,
-0.6172935, -0.8118189, -1.936164, 0.2784314, 1, 0, 1,
-0.6103998, -0.9372609, -1.999915, 0.2705882, 1, 0, 1,
-0.6072569, 0.2681661, -2.702101, 0.2666667, 1, 0, 1,
-0.6049462, 2.896464, -0.3290884, 0.2588235, 1, 0, 1,
-0.5973361, 0.2632476, -1.514723, 0.254902, 1, 0, 1,
-0.5908132, -0.3392302, -2.138144, 0.2470588, 1, 0, 1,
-0.590193, -1.23192, -3.187708, 0.2431373, 1, 0, 1,
-0.5897118, -0.866823, -2.730345, 0.2352941, 1, 0, 1,
-0.5875976, 0.4800574, -0.5216877, 0.2313726, 1, 0, 1,
-0.5823336, 0.5325583, -1.669742, 0.2235294, 1, 0, 1,
-0.5813602, 1.42976, -0.6433822, 0.2196078, 1, 0, 1,
-0.5796537, 0.2127959, 0.172063, 0.2117647, 1, 0, 1,
-0.5717161, -0.1975547, -3.825954, 0.2078431, 1, 0, 1,
-0.5625435, 0.6596864, -1.116103, 0.2, 1, 0, 1,
-0.5624155, -4.669174, -3.281452, 0.1921569, 1, 0, 1,
-0.561902, 1.197909, -0.9129186, 0.1882353, 1, 0, 1,
-0.5591991, 0.1478253, -2.094318, 0.1803922, 1, 0, 1,
-0.5544951, -1.60246, -2.196145, 0.1764706, 1, 0, 1,
-0.5527385, 1.443795, -2.57445, 0.1686275, 1, 0, 1,
-0.5433556, 0.7659224, 0.03675222, 0.1647059, 1, 0, 1,
-0.5427918, -1.94263, -1.703386, 0.1568628, 1, 0, 1,
-0.5425212, 0.1343146, -1.493717, 0.1529412, 1, 0, 1,
-0.541828, -0.3566511, -1.800089, 0.145098, 1, 0, 1,
-0.5410338, -0.5430483, -2.11693, 0.1411765, 1, 0, 1,
-0.5402881, 0.2001863, -1.671877, 0.1333333, 1, 0, 1,
-0.5390532, 0.7321003, -1.040018, 0.1294118, 1, 0, 1,
-0.5332366, -1.334158, -2.409931, 0.1215686, 1, 0, 1,
-0.5318383, -0.9408755, -1.871718, 0.1176471, 1, 0, 1,
-0.5188785, -0.1421385, -2.582, 0.1098039, 1, 0, 1,
-0.5117199, -1.647319, -1.073775, 0.1058824, 1, 0, 1,
-0.5099143, -1.330054, -3.032041, 0.09803922, 1, 0, 1,
-0.5086626, -1.489146, -3.285722, 0.09019608, 1, 0, 1,
-0.5083736, 0.2157073, -0.6476231, 0.08627451, 1, 0, 1,
-0.5037811, 0.4468256, 0.2657529, 0.07843138, 1, 0, 1,
-0.5030178, 1.488771, -0.9171873, 0.07450981, 1, 0, 1,
-0.4956761, -1.636935, -1.990795, 0.06666667, 1, 0, 1,
-0.4904645, -0.5460198, -3.138406, 0.0627451, 1, 0, 1,
-0.4841268, -2.014762, -3.884448, 0.05490196, 1, 0, 1,
-0.483259, -1.372165, -0.8883035, 0.05098039, 1, 0, 1,
-0.4807715, -1.374952, -2.675171, 0.04313726, 1, 0, 1,
-0.4801808, -0.1951933, -2.182782, 0.03921569, 1, 0, 1,
-0.4776843, 2.212117, -0.2087061, 0.03137255, 1, 0, 1,
-0.4739013, -0.7455596, -3.010211, 0.02745098, 1, 0, 1,
-0.4736229, 1.658401, -1.510404, 0.01960784, 1, 0, 1,
-0.473269, 0.7440543, -0.8709343, 0.01568628, 1, 0, 1,
-0.4704585, 1.091092, -2.23427, 0.007843138, 1, 0, 1,
-0.4690956, 0.7871898, -1.357996, 0.003921569, 1, 0, 1,
-0.4656059, 0.9937379, 0.503839, 0, 1, 0.003921569, 1,
-0.4628959, 0.4409017, -0.337113, 0, 1, 0.01176471, 1,
-0.4627057, -0.7514582, -1.679206, 0, 1, 0.01568628, 1,
-0.4602751, -2.031167, -2.521362, 0, 1, 0.02352941, 1,
-0.4600617, -0.1461849, -2.096987, 0, 1, 0.02745098, 1,
-0.4529517, 0.6573074, -0.8094385, 0, 1, 0.03529412, 1,
-0.4447179, 1.252515, 0.2876388, 0, 1, 0.03921569, 1,
-0.4374926, -1.272188, -2.440724, 0, 1, 0.04705882, 1,
-0.4319598, 1.127723, 0.5109201, 0, 1, 0.05098039, 1,
-0.4243512, -0.9256417, -2.52015, 0, 1, 0.05882353, 1,
-0.4184909, 0.2357849, -1.374417, 0, 1, 0.0627451, 1,
-0.4184603, -1.213421, -3.73772, 0, 1, 0.07058824, 1,
-0.4128183, 0.5991547, 1.191155, 0, 1, 0.07450981, 1,
-0.409885, -0.008066009, -2.447692, 0, 1, 0.08235294, 1,
-0.4056797, 0.3753762, -0.5038511, 0, 1, 0.08627451, 1,
-0.4030506, 0.4446963, 0.02321473, 0, 1, 0.09411765, 1,
-0.4022904, -0.6892698, -4.439749, 0, 1, 0.1019608, 1,
-0.4007639, -0.9782277, -3.917405, 0, 1, 0.1058824, 1,
-0.3968787, -0.7188199, -1.633002, 0, 1, 0.1137255, 1,
-0.3931478, 0.9440685, -0.4064797, 0, 1, 0.1176471, 1,
-0.3897199, -0.01683657, -1.704004, 0, 1, 0.1254902, 1,
-0.3896506, -1.129335, -3.809521, 0, 1, 0.1294118, 1,
-0.3884208, 1.301106, -1.53659, 0, 1, 0.1372549, 1,
-0.3797733, 0.2258874, -2.504153, 0, 1, 0.1411765, 1,
-0.3797521, -0.428183, -3.097349, 0, 1, 0.1490196, 1,
-0.3792959, -0.6498042, -3.299927, 0, 1, 0.1529412, 1,
-0.3771045, 0.2127801, -2.249975, 0, 1, 0.1607843, 1,
-0.3747478, 1.476534, 0.2578354, 0, 1, 0.1647059, 1,
-0.374519, 0.9532827, 0.6233155, 0, 1, 0.172549, 1,
-0.373591, 2.992374, -0.5074644, 0, 1, 0.1764706, 1,
-0.3678201, -0.3154251, -2.47144, 0, 1, 0.1843137, 1,
-0.3575418, 1.386695, -1.550891, 0, 1, 0.1882353, 1,
-0.3556271, -0.1116489, -2.229892, 0, 1, 0.1960784, 1,
-0.3518599, 2.619442, 1.79512, 0, 1, 0.2039216, 1,
-0.348532, 0.08580922, -0.9649066, 0, 1, 0.2078431, 1,
-0.3476314, 1.531219, -0.405834, 0, 1, 0.2156863, 1,
-0.3470091, -0.1181223, -2.951237, 0, 1, 0.2196078, 1,
-0.3454762, -1.622497, -1.770097, 0, 1, 0.227451, 1,
-0.3415254, -1.449805, -2.741315, 0, 1, 0.2313726, 1,
-0.3410559, -1.331834, -3.524461, 0, 1, 0.2392157, 1,
-0.3374323, 1.270625, 0.6220218, 0, 1, 0.2431373, 1,
-0.3355635, -0.4064587, -2.462609, 0, 1, 0.2509804, 1,
-0.3319827, -0.3928878, -3.231643, 0, 1, 0.254902, 1,
-0.3318918, -1.057911, -5.153339, 0, 1, 0.2627451, 1,
-0.331487, -0.4835112, -2.793922, 0, 1, 0.2666667, 1,
-0.3310986, -0.5941871, -1.862282, 0, 1, 0.2745098, 1,
-0.3294908, 0.8078936, -0.01625713, 0, 1, 0.2784314, 1,
-0.3268009, -0.3694215, -1.556063, 0, 1, 0.2862745, 1,
-0.3237068, 0.3224241, -0.9257481, 0, 1, 0.2901961, 1,
-0.3222165, -1.671825, -4.201982, 0, 1, 0.2980392, 1,
-0.321921, 0.6408051, -0.6790472, 0, 1, 0.3058824, 1,
-0.3159717, 1.013784, -0.2686273, 0, 1, 0.3098039, 1,
-0.3101514, 0.5423074, -1.368913, 0, 1, 0.3176471, 1,
-0.3062972, 0.2364712, 0.01747438, 0, 1, 0.3215686, 1,
-0.3056272, 0.2975689, 1.376189, 0, 1, 0.3294118, 1,
-0.3049357, 1.546414, 0.5701725, 0, 1, 0.3333333, 1,
-0.3036178, 1.882239, -0.3090513, 0, 1, 0.3411765, 1,
-0.3006157, 2.220814, -1.010567, 0, 1, 0.345098, 1,
-0.2988881, 0.2309232, -1.861921, 0, 1, 0.3529412, 1,
-0.2948951, -1.29299, -3.968524, 0, 1, 0.3568628, 1,
-0.2916741, 0.7253663, -0.3211038, 0, 1, 0.3647059, 1,
-0.2915284, -0.4334603, -2.081835, 0, 1, 0.3686275, 1,
-0.2912004, 0.2744493, -1.023028, 0, 1, 0.3764706, 1,
-0.2904258, -0.8779909, -3.863038, 0, 1, 0.3803922, 1,
-0.2901136, -1.157149, -2.890347, 0, 1, 0.3882353, 1,
-0.2866742, -0.8517182, -3.607656, 0, 1, 0.3921569, 1,
-0.2864954, -0.04870269, -0.688585, 0, 1, 0.4, 1,
-0.2858241, 2.841052, 0.5078206, 0, 1, 0.4078431, 1,
-0.2741156, -0.378812, -2.335199, 0, 1, 0.4117647, 1,
-0.2705359, 1.598764, 1.087962, 0, 1, 0.4196078, 1,
-0.2684959, -0.3471479, -0.6810837, 0, 1, 0.4235294, 1,
-0.2666529, 2.032, -0.001782642, 0, 1, 0.4313726, 1,
-0.2663306, -1.213313, -2.854063, 0, 1, 0.4352941, 1,
-0.26265, 0.314106, -0.1376906, 0, 1, 0.4431373, 1,
-0.2607277, 0.6658785, 0.08442597, 0, 1, 0.4470588, 1,
-0.2601496, -0.6313034, -3.278744, 0, 1, 0.454902, 1,
-0.2560504, 0.5258453, -2.312239, 0, 1, 0.4588235, 1,
-0.2538857, 0.9255833, -2.283657, 0, 1, 0.4666667, 1,
-0.2536995, 0.2231569, -1.198693, 0, 1, 0.4705882, 1,
-0.2500673, -0.7970147, -0.6206217, 0, 1, 0.4784314, 1,
-0.2488106, -0.8422982, -2.135401, 0, 1, 0.4823529, 1,
-0.2442557, 0.3498235, -1.825841, 0, 1, 0.4901961, 1,
-0.2417952, 0.1614792, -2.485297, 0, 1, 0.4941176, 1,
-0.2369452, 1.59233, -0.3593409, 0, 1, 0.5019608, 1,
-0.231509, -0.895586, -4.330761, 0, 1, 0.509804, 1,
-0.2307601, 0.02821739, -1.178968, 0, 1, 0.5137255, 1,
-0.2295346, -1.293659, -2.299843, 0, 1, 0.5215687, 1,
-0.2291648, -0.4121647, -3.811331, 0, 1, 0.5254902, 1,
-0.2287858, 0.9991046, 0.02979559, 0, 1, 0.5333334, 1,
-0.225425, -1.824961, -3.552645, 0, 1, 0.5372549, 1,
-0.2251622, -0.7850125, -0.8042142, 0, 1, 0.5450981, 1,
-0.2186899, 0.6630306, -2.239367, 0, 1, 0.5490196, 1,
-0.2184256, -0.8806998, -3.904591, 0, 1, 0.5568628, 1,
-0.2171335, 0.3335174, 0.009505889, 0, 1, 0.5607843, 1,
-0.2165621, 0.0574541, -1.262883, 0, 1, 0.5686275, 1,
-0.2112818, 0.7543717, -1.35493, 0, 1, 0.572549, 1,
-0.2093139, -1.909144, -1.953126, 0, 1, 0.5803922, 1,
-0.2087709, 2.777751, 0.7689449, 0, 1, 0.5843138, 1,
-0.2064109, -0.4312281, -3.574642, 0, 1, 0.5921569, 1,
-0.2030288, 1.188412, -0.2008503, 0, 1, 0.5960785, 1,
-0.1991924, -0.3247927, -2.730421, 0, 1, 0.6039216, 1,
-0.1991344, 0.2455346, -1.490313, 0, 1, 0.6117647, 1,
-0.1889255, 0.2075439, -2.061118, 0, 1, 0.6156863, 1,
-0.187222, -0.9510329, -4.143474, 0, 1, 0.6235294, 1,
-0.1870532, -0.8675545, -3.537528, 0, 1, 0.627451, 1,
-0.1847281, -0.3845587, -3.15202, 0, 1, 0.6352941, 1,
-0.1745808, -0.656792, -3.072669, 0, 1, 0.6392157, 1,
-0.1679815, -1.647058, -5.271831, 0, 1, 0.6470588, 1,
-0.1673429, 0.4153056, -1.823195, 0, 1, 0.6509804, 1,
-0.1653615, 0.4072736, -2.052962, 0, 1, 0.6588235, 1,
-0.16087, -0.6198846, -1.568535, 0, 1, 0.6627451, 1,
-0.1582568, 0.5724694, -1.45968, 0, 1, 0.6705883, 1,
-0.1570979, -1.303595, -4.034403, 0, 1, 0.6745098, 1,
-0.156869, -0.2124737, -2.617372, 0, 1, 0.682353, 1,
-0.1559953, -1.971733, -3.652577, 0, 1, 0.6862745, 1,
-0.1551883, -0.2447126, -2.605734, 0, 1, 0.6941177, 1,
-0.1533591, -0.3346474, -2.389632, 0, 1, 0.7019608, 1,
-0.1528554, 0.2085372, -0.1856115, 0, 1, 0.7058824, 1,
-0.1519317, -0.0970933, -2.02727, 0, 1, 0.7137255, 1,
-0.1512769, -2.636297, -3.652868, 0, 1, 0.7176471, 1,
-0.1465246, -2.521445, -3.577426, 0, 1, 0.7254902, 1,
-0.1461661, -1.029808, -2.169138, 0, 1, 0.7294118, 1,
-0.1459548, 0.8380981, -0.2536127, 0, 1, 0.7372549, 1,
-0.1446344, 0.2946653, -1.3496, 0, 1, 0.7411765, 1,
-0.1431481, -1.942318, -3.073627, 0, 1, 0.7490196, 1,
-0.1424763, 1.890607, -2.269833, 0, 1, 0.7529412, 1,
-0.1416823, 0.4792078, -0.101554, 0, 1, 0.7607843, 1,
-0.1408168, 1.445907, -0.7328507, 0, 1, 0.7647059, 1,
-0.1403951, -0.5372362, -3.302867, 0, 1, 0.772549, 1,
-0.1356745, 0.9296755, -0.2226994, 0, 1, 0.7764706, 1,
-0.1299279, 0.4533092, -1.109426, 0, 1, 0.7843137, 1,
-0.1298171, -0.2157402, -1.641397, 0, 1, 0.7882353, 1,
-0.124267, -2.194011, -2.88829, 0, 1, 0.7960784, 1,
-0.1224134, -0.2774088, -1.602401, 0, 1, 0.8039216, 1,
-0.1202737, -0.4611815, -2.95148, 0, 1, 0.8078431, 1,
-0.1184125, 0.02914436, -0.6374274, 0, 1, 0.8156863, 1,
-0.1161985, 1.16297, 0.5022332, 0, 1, 0.8196079, 1,
-0.1080683, 1.555271, 0.3393061, 0, 1, 0.827451, 1,
-0.1048702, -0.1554846, -2.957802, 0, 1, 0.8313726, 1,
-0.104467, 0.4974343, 0.6706741, 0, 1, 0.8392157, 1,
-0.09647531, 2.067235, 0.7531307, 0, 1, 0.8431373, 1,
-0.08722215, 0.9489201, -0.05071078, 0, 1, 0.8509804, 1,
-0.08062904, 1.036293, -0.8489006, 0, 1, 0.854902, 1,
-0.07637712, 1.64294, 1.666931, 0, 1, 0.8627451, 1,
-0.07617747, 0.6384709, -0.5640594, 0, 1, 0.8666667, 1,
-0.07523257, 0.1456056, -1.82819, 0, 1, 0.8745098, 1,
-0.07510965, -0.3004887, -2.453099, 0, 1, 0.8784314, 1,
-0.06894407, -0.7102979, -4.259634, 0, 1, 0.8862745, 1,
-0.06313026, -0.4631545, -3.562068, 0, 1, 0.8901961, 1,
-0.05321864, 1.789677, 0.7638127, 0, 1, 0.8980392, 1,
-0.05259181, 1.206619, 0.4954585, 0, 1, 0.9058824, 1,
-0.05215983, -1.204538, -2.399647, 0, 1, 0.9098039, 1,
-0.0519586, 0.2452075, 0.8243302, 0, 1, 0.9176471, 1,
-0.05078266, 0.1912594, 0.3181109, 0, 1, 0.9215686, 1,
-0.04861546, -0.8902228, -4.458726, 0, 1, 0.9294118, 1,
-0.04686472, 0.5534993, -0.1992979, 0, 1, 0.9333333, 1,
-0.04674396, 0.3708848, 1.194043, 0, 1, 0.9411765, 1,
-0.04263239, -0.7536622, -3.897376, 0, 1, 0.945098, 1,
-0.04204101, -0.1758889, -2.665126, 0, 1, 0.9529412, 1,
-0.04115646, 0.533221, 0.4306885, 0, 1, 0.9568627, 1,
-0.03844018, -1.69409, -4.704215, 0, 1, 0.9647059, 1,
-0.03754986, -0.3344806, -3.069162, 0, 1, 0.9686275, 1,
-0.03604864, 1.737294, -0.4862166, 0, 1, 0.9764706, 1,
-0.03539858, -1.178525, -1.146914, 0, 1, 0.9803922, 1,
-0.02968194, -0.7694128, -4.045796, 0, 1, 0.9882353, 1,
-0.02508839, 0.9150102, 1.800086, 0, 1, 0.9921569, 1,
-0.02118105, 1.195636, -1.599363, 0, 1, 1, 1,
-0.02053274, -0.4776284, -3.173241, 0, 0.9921569, 1, 1,
-0.01260623, -0.1216257, -2.818116, 0, 0.9882353, 1, 1,
-0.01048922, 0.05056369, -0.4495091, 0, 0.9803922, 1, 1,
-0.008188577, 0.5669714, 0.07868873, 0, 0.9764706, 1, 1,
-0.008167721, 0.1791551, -0.5225994, 0, 0.9686275, 1, 1,
-0.007429747, -0.8876652, -1.358662, 0, 0.9647059, 1, 1,
-0.007088327, -0.534632, -2.285403, 0, 0.9568627, 1, 1,
-0.004497318, -0.8112052, -2.659869, 0, 0.9529412, 1, 1,
-0.003776671, -0.04705538, -3.72883, 0, 0.945098, 1, 1,
-0.003386935, 0.1132212, -0.1216385, 0, 0.9411765, 1, 1,
-0.00289254, 0.1768687, -0.8000129, 0, 0.9333333, 1, 1,
-0.0004515384, 0.2055533, 0.6964363, 0, 0.9294118, 1, 1,
0.002511994, -2.073751, 2.91761, 0, 0.9215686, 1, 1,
0.004551863, -0.3845995, 3.676321, 0, 0.9176471, 1, 1,
0.004623964, -1.28535, 1.074416, 0, 0.9098039, 1, 1,
0.005587608, -1.826427, 0.8192107, 0, 0.9058824, 1, 1,
0.009800287, 1.288285, -0.8616121, 0, 0.8980392, 1, 1,
0.01544943, -0.9313658, 1.528954, 0, 0.8901961, 1, 1,
0.01710791, 0.1862725, 0.0985667, 0, 0.8862745, 1, 1,
0.01902374, 1.006806, -0.4253694, 0, 0.8784314, 1, 1,
0.02149618, 1.186343, -2.066285, 0, 0.8745098, 1, 1,
0.02384822, 0.1928027, -0.535435, 0, 0.8666667, 1, 1,
0.02405594, -0.7112681, 5.13133, 0, 0.8627451, 1, 1,
0.02576132, -0.5950706, 3.793039, 0, 0.854902, 1, 1,
0.02867794, -0.7354124, 4.078555, 0, 0.8509804, 1, 1,
0.03239653, 0.06140741, 1.909561, 0, 0.8431373, 1, 1,
0.05308228, 0.2198292, 0.3312087, 0, 0.8392157, 1, 1,
0.05421255, -1.408812, 4.364865, 0, 0.8313726, 1, 1,
0.05465226, -0.1590264, 1.962383, 0, 0.827451, 1, 1,
0.05570516, -1.21195, 3.178875, 0, 0.8196079, 1, 1,
0.05598828, -0.3187725, 3.695062, 0, 0.8156863, 1, 1,
0.0560551, -0.6130136, 2.93771, 0, 0.8078431, 1, 1,
0.06232389, 1.192523, 0.4100627, 0, 0.8039216, 1, 1,
0.06298143, 0.1406062, 1.848515, 0, 0.7960784, 1, 1,
0.06368689, -1.0775, 2.504341, 0, 0.7882353, 1, 1,
0.06739201, -0.4251662, 3.519727, 0, 0.7843137, 1, 1,
0.07056399, -0.5190428, 4.5472, 0, 0.7764706, 1, 1,
0.07223503, -0.3686974, 5.071264, 0, 0.772549, 1, 1,
0.07534142, -0.07874791, 2.82556, 0, 0.7647059, 1, 1,
0.0769242, -0.781465, 3.465374, 0, 0.7607843, 1, 1,
0.08287183, 0.4220116, -0.3572341, 0, 0.7529412, 1, 1,
0.08691853, 1.386593, 0.227304, 0, 0.7490196, 1, 1,
0.08926751, 0.5762345, 0.4069825, 0, 0.7411765, 1, 1,
0.0893451, -1.122745, 2.024879, 0, 0.7372549, 1, 1,
0.09068429, 0.3233116, -0.4409647, 0, 0.7294118, 1, 1,
0.0956791, -0.1366823, 2.152714, 0, 0.7254902, 1, 1,
0.09849192, -0.4836431, 3.472839, 0, 0.7176471, 1, 1,
0.09910189, 1.442719, 0.384359, 0, 0.7137255, 1, 1,
0.1002882, 1.841772, 0.9792193, 0, 0.7058824, 1, 1,
0.1060086, -1.333386, 2.810254, 0, 0.6980392, 1, 1,
0.109942, -1.119266, 1.155506, 0, 0.6941177, 1, 1,
0.1104306, 0.220738, 0.3293584, 0, 0.6862745, 1, 1,
0.1130884, 0.5142908, 2.58177, 0, 0.682353, 1, 1,
0.1143155, 0.1869548, 0.1777884, 0, 0.6745098, 1, 1,
0.1145917, -1.43296, 2.998846, 0, 0.6705883, 1, 1,
0.1203238, 0.2344261, 2.133175, 0, 0.6627451, 1, 1,
0.1204928, 1.707029, 0.1658974, 0, 0.6588235, 1, 1,
0.121811, -0.9836448, 3.937362, 0, 0.6509804, 1, 1,
0.1311018, 1.110632, -0.5560886, 0, 0.6470588, 1, 1,
0.1316892, 0.7988122, 0.7286052, 0, 0.6392157, 1, 1,
0.1323561, 0.3429807, 3.081949, 0, 0.6352941, 1, 1,
0.1349427, -0.7175878, 4.087939, 0, 0.627451, 1, 1,
0.1396047, 0.4059772, 0.3148327, 0, 0.6235294, 1, 1,
0.1405514, -0.8922982, 2.964795, 0, 0.6156863, 1, 1,
0.141319, -1.227329, 2.955959, 0, 0.6117647, 1, 1,
0.1462164, 0.03134783, 0.9355442, 0, 0.6039216, 1, 1,
0.1469688, 1.627867, 1.422268, 0, 0.5960785, 1, 1,
0.1469951, 1.71198, -0.9947347, 0, 0.5921569, 1, 1,
0.1493042, 0.1197063, 1.370794, 0, 0.5843138, 1, 1,
0.153477, 0.5544893, 0.3827272, 0, 0.5803922, 1, 1,
0.15523, -0.08139344, 0.2655737, 0, 0.572549, 1, 1,
0.1607379, -0.8176059, 3.798587, 0, 0.5686275, 1, 1,
0.1674255, 2.170007, -1.690148, 0, 0.5607843, 1, 1,
0.168495, 0.9858075, -0.8631917, 0, 0.5568628, 1, 1,
0.1704367, 1.125669, -0.2851772, 0, 0.5490196, 1, 1,
0.1729299, -0.3346563, 1.649162, 0, 0.5450981, 1, 1,
0.1811006, -2.987925, 3.308122, 0, 0.5372549, 1, 1,
0.1943225, 0.5972978, -0.2153286, 0, 0.5333334, 1, 1,
0.1953613, 0.8188295, -0.763563, 0, 0.5254902, 1, 1,
0.196793, 0.93343, -0.05541833, 0, 0.5215687, 1, 1,
0.200591, -0.4170621, 1.333046, 0, 0.5137255, 1, 1,
0.2008759, 0.4492638, -0.7047488, 0, 0.509804, 1, 1,
0.2020627, 1.08098, -0.932433, 0, 0.5019608, 1, 1,
0.2033243, 0.2962582, 2.093628, 0, 0.4941176, 1, 1,
0.2039202, 0.1876806, 2.800166, 0, 0.4901961, 1, 1,
0.2043357, 0.07646137, 3.554284, 0, 0.4823529, 1, 1,
0.2068603, 2.208915, -1.922813, 0, 0.4784314, 1, 1,
0.2077723, -1.693627, 1.884882, 0, 0.4705882, 1, 1,
0.2093536, 0.1786833, 0.6210831, 0, 0.4666667, 1, 1,
0.2152743, 0.06297144, 1.311739, 0, 0.4588235, 1, 1,
0.2162968, -0.5033563, 4.244381, 0, 0.454902, 1, 1,
0.2166662, 0.8185447, 0.01094933, 0, 0.4470588, 1, 1,
0.2176522, -1.14487, 2.172131, 0, 0.4431373, 1, 1,
0.2325435, -1.122859, 3.165868, 0, 0.4352941, 1, 1,
0.234636, -0.8736374, 2.538383, 0, 0.4313726, 1, 1,
0.2403358, -0.3997872, 2.697973, 0, 0.4235294, 1, 1,
0.2405998, -0.1005965, 2.542303, 0, 0.4196078, 1, 1,
0.2436544, -1.508114, 3.554604, 0, 0.4117647, 1, 1,
0.2443022, 0.1120816, 2.6192, 0, 0.4078431, 1, 1,
0.2453979, 2.332543, 1.878352, 0, 0.4, 1, 1,
0.2496593, -0.2278964, 2.970734, 0, 0.3921569, 1, 1,
0.2519007, 2.103852, 1.281633, 0, 0.3882353, 1, 1,
0.2571607, 0.9166613, -1.164551, 0, 0.3803922, 1, 1,
0.2615924, 0.9637064, -0.2578366, 0, 0.3764706, 1, 1,
0.2619158, -0.280259, 1.515666, 0, 0.3686275, 1, 1,
0.2657785, 0.5972787, 1.807526, 0, 0.3647059, 1, 1,
0.2677865, 0.3118858, 1.992202, 0, 0.3568628, 1, 1,
0.2715486, 0.2072129, 1.203191, 0, 0.3529412, 1, 1,
0.2730577, 0.4720872, 0.49401, 0, 0.345098, 1, 1,
0.2743594, -1.109979, 3.124061, 0, 0.3411765, 1, 1,
0.2764819, 0.6944708, 0.1184139, 0, 0.3333333, 1, 1,
0.2799317, 0.3661671, 0.5659944, 0, 0.3294118, 1, 1,
0.2820108, -0.6960985, 2.738532, 0, 0.3215686, 1, 1,
0.2861983, -0.5411094, 1.007561, 0, 0.3176471, 1, 1,
0.2866947, 0.9971486, -0.2305574, 0, 0.3098039, 1, 1,
0.2887591, 0.7460695, 0.7494153, 0, 0.3058824, 1, 1,
0.2963226, 0.958856, 1.280079, 0, 0.2980392, 1, 1,
0.296523, -0.5002826, 2.532837, 0, 0.2901961, 1, 1,
0.2988944, 0.9386725, 0.03188199, 0, 0.2862745, 1, 1,
0.3016328, -0.2447885, 2.373543, 0, 0.2784314, 1, 1,
0.3016742, -1.021114, 2.121534, 0, 0.2745098, 1, 1,
0.3084365, 0.6536257, 1.542252, 0, 0.2666667, 1, 1,
0.3094725, -0.9020067, 3.14034, 0, 0.2627451, 1, 1,
0.310009, 0.3321671, -0.3877317, 0, 0.254902, 1, 1,
0.3107333, -0.7983201, 0.358126, 0, 0.2509804, 1, 1,
0.3125314, -1.370901, 3.994797, 0, 0.2431373, 1, 1,
0.3155212, 1.512824, 0.7689039, 0, 0.2392157, 1, 1,
0.3256498, -0.4377067, 1.705902, 0, 0.2313726, 1, 1,
0.3290475, -0.02151398, 1.917955, 0, 0.227451, 1, 1,
0.3309622, 0.06234443, 1.627622, 0, 0.2196078, 1, 1,
0.3329321, 1.634062, 1.349855, 0, 0.2156863, 1, 1,
0.3388125, -0.1910714, 2.772617, 0, 0.2078431, 1, 1,
0.3393831, -1.627306, 3.643397, 0, 0.2039216, 1, 1,
0.3453746, 0.1969097, 3.02028, 0, 0.1960784, 1, 1,
0.3465951, 0.1416423, 1.142316, 0, 0.1882353, 1, 1,
0.3469228, 0.88782, 0.1855439, 0, 0.1843137, 1, 1,
0.3541779, 0.09516631, 0.8160298, 0, 0.1764706, 1, 1,
0.3609505, -1.462661, 3.084701, 0, 0.172549, 1, 1,
0.3620383, -1.194109, 1.954357, 0, 0.1647059, 1, 1,
0.3645395, 0.2076637, 2.275713, 0, 0.1607843, 1, 1,
0.3672645, 0.088831, 2.651033, 0, 0.1529412, 1, 1,
0.3697959, 1.57107, -0.05363021, 0, 0.1490196, 1, 1,
0.3783613, 0.1286775, 2.451233, 0, 0.1411765, 1, 1,
0.380333, 1.37439, 0.04285202, 0, 0.1372549, 1, 1,
0.3803847, 1.442319, 0.3127691, 0, 0.1294118, 1, 1,
0.3833563, -0.2563697, 1.227985, 0, 0.1254902, 1, 1,
0.3903835, -1.766307, 3.865749, 0, 0.1176471, 1, 1,
0.3993986, -0.4870369, 3.500867, 0, 0.1137255, 1, 1,
0.4000028, -0.1189166, 1.318534, 0, 0.1058824, 1, 1,
0.4030222, -0.1741595, -0.2443794, 0, 0.09803922, 1, 1,
0.4049679, -1.418173, 2.049288, 0, 0.09411765, 1, 1,
0.4069425, -0.5059955, 4.290739, 0, 0.08627451, 1, 1,
0.4079572, -1.094537, 2.147443, 0, 0.08235294, 1, 1,
0.4175239, 1.030244, -1.112836, 0, 0.07450981, 1, 1,
0.4179124, -1.176344, 3.401281, 0, 0.07058824, 1, 1,
0.4192639, 0.2374758, 0.1614091, 0, 0.0627451, 1, 1,
0.4233817, -0.1843845, 1.59989, 0, 0.05882353, 1, 1,
0.4240234, 2.406205, -1.159944, 0, 0.05098039, 1, 1,
0.4266489, 2.72117, 1.226632, 0, 0.04705882, 1, 1,
0.426969, 0.2009749, 1.005287, 0, 0.03921569, 1, 1,
0.4280124, 0.350426, -0.9780026, 0, 0.03529412, 1, 1,
0.4329656, 1.197708, 0.4516924, 0, 0.02745098, 1, 1,
0.4396297, 0.3387811, -0.333207, 0, 0.02352941, 1, 1,
0.439801, 0.05264075, 1.743435, 0, 0.01568628, 1, 1,
0.4400327, -1.069043, 2.417552, 0, 0.01176471, 1, 1,
0.4430898, 0.8311608, 0.8570557, 0, 0.003921569, 1, 1,
0.444687, 1.946751, 1.224247, 0.003921569, 0, 1, 1,
0.4460125, 0.9626667, -1.089568, 0.007843138, 0, 1, 1,
0.4469436, -0.0409376, 2.468863, 0.01568628, 0, 1, 1,
0.4508455, -0.7039201, 2.861009, 0.01960784, 0, 1, 1,
0.4564996, 0.2584053, 1.862996, 0.02745098, 0, 1, 1,
0.460439, 0.5022956, -1.067525, 0.03137255, 0, 1, 1,
0.4656277, -2.299973, 4.121893, 0.03921569, 0, 1, 1,
0.4659884, -0.6989102, 1.737672, 0.04313726, 0, 1, 1,
0.4697302, -0.6459485, 3.742312, 0.05098039, 0, 1, 1,
0.4741089, -1.159534, 3.907732, 0.05490196, 0, 1, 1,
0.4775012, 1.530511, 0.1687519, 0.0627451, 0, 1, 1,
0.4893761, -1.824664, 2.047125, 0.06666667, 0, 1, 1,
0.492199, -0.5598816, 3.813761, 0.07450981, 0, 1, 1,
0.4930593, -0.02001729, 0.3286294, 0.07843138, 0, 1, 1,
0.4951867, 1.419444, -1.42939, 0.08627451, 0, 1, 1,
0.5071189, 0.599709, -0.2875742, 0.09019608, 0, 1, 1,
0.5086154, 1.985106, 1.081094, 0.09803922, 0, 1, 1,
0.5124294, -0.3125432, -0.3631682, 0.1058824, 0, 1, 1,
0.5172726, 0.6222909, 0.2898719, 0.1098039, 0, 1, 1,
0.5222962, -1.16403, 2.474003, 0.1176471, 0, 1, 1,
0.5256064, -0.3675921, 1.210753, 0.1215686, 0, 1, 1,
0.5302643, -0.2917519, 4.141789, 0.1294118, 0, 1, 1,
0.5374458, -0.7857499, 2.439746, 0.1333333, 0, 1, 1,
0.5386739, 2.181676, 0.2153945, 0.1411765, 0, 1, 1,
0.5411772, -0.1367819, 2.238205, 0.145098, 0, 1, 1,
0.5416522, -0.6719503, 2.217738, 0.1529412, 0, 1, 1,
0.5436521, -0.6241143, 1.734428, 0.1568628, 0, 1, 1,
0.5532357, -1.183387, 3.401031, 0.1647059, 0, 1, 1,
0.5543808, -1.50629, 3.190917, 0.1686275, 0, 1, 1,
0.5573747, -0.8019019, 2.709079, 0.1764706, 0, 1, 1,
0.5580994, 0.6571121, 2.118183, 0.1803922, 0, 1, 1,
0.56582, 0.3245235, 0.2027406, 0.1882353, 0, 1, 1,
0.5664137, 0.07617378, 3.364716, 0.1921569, 0, 1, 1,
0.5693104, 0.05666997, 2.552462, 0.2, 0, 1, 1,
0.5713909, 0.1529002, 1.228191, 0.2078431, 0, 1, 1,
0.576703, 1.412188, 0.4300036, 0.2117647, 0, 1, 1,
0.5792926, 0.03864529, 2.8038, 0.2196078, 0, 1, 1,
0.584939, -0.3372859, 2.984218, 0.2235294, 0, 1, 1,
0.5876737, 2.500579, -0.5712018, 0.2313726, 0, 1, 1,
0.5881183, 0.9439254, 1.670689, 0.2352941, 0, 1, 1,
0.5946031, 0.6988575, 2.299823, 0.2431373, 0, 1, 1,
0.5950092, -1.383458, 3.601457, 0.2470588, 0, 1, 1,
0.5985556, -0.2047177, 2.515159, 0.254902, 0, 1, 1,
0.6012657, -0.6281753, 0.8658439, 0.2588235, 0, 1, 1,
0.604523, -1.553418, 2.251049, 0.2666667, 0, 1, 1,
0.6080244, 1.107765, -0.53243, 0.2705882, 0, 1, 1,
0.6157356, 0.5167485, 1.817701, 0.2784314, 0, 1, 1,
0.6168826, 0.9214538, 0.03232341, 0.282353, 0, 1, 1,
0.6208576, 0.2521051, 1.712925, 0.2901961, 0, 1, 1,
0.6227747, -0.6448353, 2.697542, 0.2941177, 0, 1, 1,
0.6254181, 0.5214167, 0.6027338, 0.3019608, 0, 1, 1,
0.6267668, 0.3044896, 2.695368, 0.3098039, 0, 1, 1,
0.6286166, -0.3284755, 2.785994, 0.3137255, 0, 1, 1,
0.6305411, -0.9289376, 3.254762, 0.3215686, 0, 1, 1,
0.6333909, -1.170089, 2.974822, 0.3254902, 0, 1, 1,
0.6359947, 0.3618819, -0.2951575, 0.3333333, 0, 1, 1,
0.6430355, -1.090277, 3.602032, 0.3372549, 0, 1, 1,
0.645111, 1.084521, 3.103132, 0.345098, 0, 1, 1,
0.6452191, 0.1410578, 1.450483, 0.3490196, 0, 1, 1,
0.6477597, 0.2126082, -1.47693, 0.3568628, 0, 1, 1,
0.6513188, -0.04045818, 1.342219, 0.3607843, 0, 1, 1,
0.6601717, 0.4822051, 1.068474, 0.3686275, 0, 1, 1,
0.6615621, 0.2511728, 0.9056622, 0.372549, 0, 1, 1,
0.6727784, -0.0535678, 1.838793, 0.3803922, 0, 1, 1,
0.6756872, 0.2216442, 1.75772, 0.3843137, 0, 1, 1,
0.6850905, 1.270456, -0.06229747, 0.3921569, 0, 1, 1,
0.6858528, -0.3166398, 0.9394751, 0.3960784, 0, 1, 1,
0.6869743, -0.9491018, 2.106598, 0.4039216, 0, 1, 1,
0.6939231, 0.02537162, 1.180323, 0.4117647, 0, 1, 1,
0.6949504, 1.229985, 0.7928144, 0.4156863, 0, 1, 1,
0.6959443, -0.2464849, 1.603813, 0.4235294, 0, 1, 1,
0.7004091, 0.873652, 0.2340072, 0.427451, 0, 1, 1,
0.700664, -1.219145, 3.40044, 0.4352941, 0, 1, 1,
0.7022873, 1.625701, 2.121683, 0.4392157, 0, 1, 1,
0.7195862, -1.592692, 2.255823, 0.4470588, 0, 1, 1,
0.7229074, -2.748821, 3.138526, 0.4509804, 0, 1, 1,
0.7243059, -1.354102, 2.490672, 0.4588235, 0, 1, 1,
0.7299189, -0.1077157, 1.178944, 0.4627451, 0, 1, 1,
0.7311643, -0.6465116, 2.896695, 0.4705882, 0, 1, 1,
0.7327318, -0.9223468, 1.680607, 0.4745098, 0, 1, 1,
0.733717, 1.579324, 0.06511233, 0.4823529, 0, 1, 1,
0.7387797, -0.4886557, 0.6315811, 0.4862745, 0, 1, 1,
0.7392892, -0.3638017, 1.22287, 0.4941176, 0, 1, 1,
0.7511511, -0.9502166, 3.329743, 0.5019608, 0, 1, 1,
0.7639725, 1.262787, 1.005401, 0.5058824, 0, 1, 1,
0.7659827, 0.2845404, -0.200485, 0.5137255, 0, 1, 1,
0.7708435, 0.9765538, -0.1098929, 0.5176471, 0, 1, 1,
0.7734342, -0.5363641, 2.681079, 0.5254902, 0, 1, 1,
0.7834135, -0.4823923, 1.367869, 0.5294118, 0, 1, 1,
0.7855071, 0.7147532, 0.7865492, 0.5372549, 0, 1, 1,
0.7857392, -0.4697961, 2.431406, 0.5411765, 0, 1, 1,
0.7907215, -0.3978328, 2.606134, 0.5490196, 0, 1, 1,
0.7978416, -1.297022, 3.976858, 0.5529412, 0, 1, 1,
0.8013577, 1.812737, -0.3571022, 0.5607843, 0, 1, 1,
0.801382, 0.4351272, 2.012282, 0.5647059, 0, 1, 1,
0.8015357, -0.0974623, 2.941778, 0.572549, 0, 1, 1,
0.803388, -1.041524, 2.822159, 0.5764706, 0, 1, 1,
0.8051487, 0.189191, 0.9916461, 0.5843138, 0, 1, 1,
0.8081304, 1.360078, 0.590563, 0.5882353, 0, 1, 1,
0.8103534, -0.05067359, 1.121721, 0.5960785, 0, 1, 1,
0.8137566, 0.7040988, 1.896879, 0.6039216, 0, 1, 1,
0.8141789, -0.2290652, 1.414997, 0.6078432, 0, 1, 1,
0.822073, -0.8653224, 2.83766, 0.6156863, 0, 1, 1,
0.823935, 0.3823907, 0.9892778, 0.6196079, 0, 1, 1,
0.8259699, -1.153507, 3.060993, 0.627451, 0, 1, 1,
0.8299362, -0.3432259, 2.570076, 0.6313726, 0, 1, 1,
0.8301201, -2.027585, 2.675892, 0.6392157, 0, 1, 1,
0.835225, -0.18338, 2.820526, 0.6431373, 0, 1, 1,
0.837114, -0.6800117, 1.417335, 0.6509804, 0, 1, 1,
0.8383167, -0.8859272, 1.355098, 0.654902, 0, 1, 1,
0.8491879, 1.154739, 1.861366, 0.6627451, 0, 1, 1,
0.8517473, 0.8200512, 0.4216748, 0.6666667, 0, 1, 1,
0.8586234, -0.5936111, 0.8275022, 0.6745098, 0, 1, 1,
0.8588373, -1.235886, 2.702426, 0.6784314, 0, 1, 1,
0.8659813, -0.4200701, 3.029042, 0.6862745, 0, 1, 1,
0.8705286, 0.8457204, 1.105382, 0.6901961, 0, 1, 1,
0.8710643, 0.4407907, 2.168455, 0.6980392, 0, 1, 1,
0.8713331, 1.314565, 0.4494732, 0.7058824, 0, 1, 1,
0.8714268, 0.9043025, 0.8701406, 0.7098039, 0, 1, 1,
0.8749803, 0.3222095, -0.1952794, 0.7176471, 0, 1, 1,
0.8787925, -0.7868589, 2.57144, 0.7215686, 0, 1, 1,
0.887166, 1.301281, -0.2389103, 0.7294118, 0, 1, 1,
0.8883891, -1.331668, 1.521778, 0.7333333, 0, 1, 1,
0.889137, 0.12122, 0.1949709, 0.7411765, 0, 1, 1,
0.8940454, 0.3911979, 0.9880916, 0.7450981, 0, 1, 1,
0.8957103, 0.2302459, 1.400986, 0.7529412, 0, 1, 1,
0.898081, 0.3535681, 1.671692, 0.7568628, 0, 1, 1,
0.8984904, -0.9170431, 3.532255, 0.7647059, 0, 1, 1,
0.9022911, 1.328045, 1.271362, 0.7686275, 0, 1, 1,
0.9023968, -0.1081778, 2.48448, 0.7764706, 0, 1, 1,
0.9043236, 0.3663431, 1.591498, 0.7803922, 0, 1, 1,
0.9070276, -0.09032407, 3.016712, 0.7882353, 0, 1, 1,
0.9135724, -0.3239122, 1.517563, 0.7921569, 0, 1, 1,
0.9152131, 0.08745571, -0.1057092, 0.8, 0, 1, 1,
0.916218, 0.5829756, -0.02593714, 0.8078431, 0, 1, 1,
0.921651, 1.693328, 1.775938, 0.8117647, 0, 1, 1,
0.927491, 0.5751338, 0.4538636, 0.8196079, 0, 1, 1,
0.9291666, 0.05687284, 1.239765, 0.8235294, 0, 1, 1,
0.9294912, 0.08708281, 3.204153, 0.8313726, 0, 1, 1,
0.9376321, -0.09826928, 1.177257, 0.8352941, 0, 1, 1,
0.9391065, 0.5456591, 1.499182, 0.8431373, 0, 1, 1,
0.9483534, 1.07305, 1.2752, 0.8470588, 0, 1, 1,
0.952924, 0.1174878, 2.426157, 0.854902, 0, 1, 1,
0.9533759, 2.590233, -0.3074074, 0.8588235, 0, 1, 1,
0.9540019, -0.8517479, 3.295521, 0.8666667, 0, 1, 1,
0.9568691, -0.6775255, 2.133657, 0.8705882, 0, 1, 1,
0.9583687, -0.9777545, 1.826244, 0.8784314, 0, 1, 1,
0.9601067, 1.265114, 0.6145863, 0.8823529, 0, 1, 1,
0.9605297, -1.725048, 3.068811, 0.8901961, 0, 1, 1,
0.9625064, -0.08798614, 0.7011965, 0.8941177, 0, 1, 1,
0.9633172, -1.635382, 3.06602, 0.9019608, 0, 1, 1,
0.9641463, 0.4220768, 0.8704777, 0.9098039, 0, 1, 1,
0.9668802, 1.252015, 0.08256159, 0.9137255, 0, 1, 1,
0.9754616, -1.821722, 2.418743, 0.9215686, 0, 1, 1,
0.9781787, -1.257481, 2.648844, 0.9254902, 0, 1, 1,
0.9823357, 0.7228048, 1.728441, 0.9333333, 0, 1, 1,
0.9846399, 0.4832282, 1.147148, 0.9372549, 0, 1, 1,
0.9887466, -0.8970306, 2.588323, 0.945098, 0, 1, 1,
0.9897566, 0.4596688, 1.418524, 0.9490196, 0, 1, 1,
0.9903281, 0.1570079, 1.489491, 0.9568627, 0, 1, 1,
0.9908789, 0.2843378, 2.336517, 0.9607843, 0, 1, 1,
1.001829, -0.3830459, 0.5246012, 0.9686275, 0, 1, 1,
1.002042, -1.520989, 3.528682, 0.972549, 0, 1, 1,
1.003555, -0.2872452, 1.251314, 0.9803922, 0, 1, 1,
1.004964, -1.038804, 1.702295, 0.9843137, 0, 1, 1,
1.009032, -1.586605, 2.09301, 0.9921569, 0, 1, 1,
1.009629, 1.754394, 0.5439973, 0.9960784, 0, 1, 1,
1.016398, -0.808916, 0.7082066, 1, 0, 0.9960784, 1,
1.020211, -0.3473716, 2.429365, 1, 0, 0.9882353, 1,
1.030244, 0.3642069, 3.189635, 1, 0, 0.9843137, 1,
1.033148, -0.06409724, 0.878626, 1, 0, 0.9764706, 1,
1.037319, 1.00547, 0.239623, 1, 0, 0.972549, 1,
1.038048, -0.5703015, 2.475006, 1, 0, 0.9647059, 1,
1.042735, -1.170588, 1.703761, 1, 0, 0.9607843, 1,
1.043777, -1.648176, 3.878504, 1, 0, 0.9529412, 1,
1.052881, -1.076329, 3.5427, 1, 0, 0.9490196, 1,
1.064054, -1.918077, 1.304991, 1, 0, 0.9411765, 1,
1.068486, 0.3070255, 3.140266, 1, 0, 0.9372549, 1,
1.071355, -0.65896, 1.193168, 1, 0, 0.9294118, 1,
1.074087, -0.5601124, 2.342815, 1, 0, 0.9254902, 1,
1.076317, -0.8426539, 2.88763, 1, 0, 0.9176471, 1,
1.080483, -0.2287727, 2.52813, 1, 0, 0.9137255, 1,
1.083835, -1.1795, 1.254488, 1, 0, 0.9058824, 1,
1.087155, 0.6705458, 2.182032, 1, 0, 0.9019608, 1,
1.094975, -1.001179, 3.081466, 1, 0, 0.8941177, 1,
1.103062, 0.6440464, 1.868773, 1, 0, 0.8862745, 1,
1.108338, 2.076917, 3.100975, 1, 0, 0.8823529, 1,
1.115524, -1.137536, 0.8995226, 1, 0, 0.8745098, 1,
1.11561, 0.5432043, 0.9572518, 1, 0, 0.8705882, 1,
1.118289, 0.1334395, 0.3085396, 1, 0, 0.8627451, 1,
1.11996, 2.480657, 0.1963068, 1, 0, 0.8588235, 1,
1.121728, -1.2222, 3.843522, 1, 0, 0.8509804, 1,
1.125125, -0.2318135, 2.196711, 1, 0, 0.8470588, 1,
1.133025, 1.837747, -1.606431, 1, 0, 0.8392157, 1,
1.133879, -1.073348, 0.9227154, 1, 0, 0.8352941, 1,
1.134101, 0.04598062, 2.605796, 1, 0, 0.827451, 1,
1.136104, 0.02952127, 1.535205, 1, 0, 0.8235294, 1,
1.145402, 0.5591847, -0.9112549, 1, 0, 0.8156863, 1,
1.152272, -0.1091018, 1.689859, 1, 0, 0.8117647, 1,
1.161754, -1.431992, 3.07532, 1, 0, 0.8039216, 1,
1.164497, 0.2045294, -0.521405, 1, 0, 0.7960784, 1,
1.171718, -0.7424742, 2.589954, 1, 0, 0.7921569, 1,
1.172186, 0.3526979, 3.645348, 1, 0, 0.7843137, 1,
1.173584, 0.7739735, 2.562642, 1, 0, 0.7803922, 1,
1.180928, 1.278356, 1.792406, 1, 0, 0.772549, 1,
1.18191, -1.235753, 0.6280734, 1, 0, 0.7686275, 1,
1.183092, 0.2539656, 0.7689573, 1, 0, 0.7607843, 1,
1.188303, 0.3825513, 1.89384, 1, 0, 0.7568628, 1,
1.189197, -1.464312, 3.519327, 1, 0, 0.7490196, 1,
1.19029, 0.9551331, -0.5624971, 1, 0, 0.7450981, 1,
1.190781, 0.2616795, 1.696108, 1, 0, 0.7372549, 1,
1.198199, 0.6711, 1.088085, 1, 0, 0.7333333, 1,
1.205376, 0.6515085, 3.040846, 1, 0, 0.7254902, 1,
1.212964, -0.4733757, 0.5923066, 1, 0, 0.7215686, 1,
1.224163, 0.3376376, 2.126394, 1, 0, 0.7137255, 1,
1.225915, 1.942988, 0.8542178, 1, 0, 0.7098039, 1,
1.227871, -1.603116, 2.967117, 1, 0, 0.7019608, 1,
1.23038, 0.1474588, -0.1384448, 1, 0, 0.6941177, 1,
1.236391, -0.1282046, 0.9558941, 1, 0, 0.6901961, 1,
1.238453, 0.8404065, 0.1897408, 1, 0, 0.682353, 1,
1.243147, 0.3794665, 1.601882, 1, 0, 0.6784314, 1,
1.246313, -2.364347, 2.698319, 1, 0, 0.6705883, 1,
1.252434, -1.894538, 3.468421, 1, 0, 0.6666667, 1,
1.25814, -0.7126819, 0.7631894, 1, 0, 0.6588235, 1,
1.260601, 0.9384682, 1.302477, 1, 0, 0.654902, 1,
1.262868, -0.5940941, 2.508338, 1, 0, 0.6470588, 1,
1.269012, -1.131669, 3.609134, 1, 0, 0.6431373, 1,
1.278469, -1.937886, 1.102405, 1, 0, 0.6352941, 1,
1.286443, -0.2491524, 1.464276, 1, 0, 0.6313726, 1,
1.287, 0.03777223, 1.115163, 1, 0, 0.6235294, 1,
1.287232, -0.3279989, 1.237003, 1, 0, 0.6196079, 1,
1.288477, -1.345375, 3.066867, 1, 0, 0.6117647, 1,
1.289197, 1.03461, 1.091386, 1, 0, 0.6078432, 1,
1.289535, -0.06372972, 0.7533458, 1, 0, 0.6, 1,
1.294206, 0.8106278, 0.3419664, 1, 0, 0.5921569, 1,
1.296895, 0.2631791, 1.380095, 1, 0, 0.5882353, 1,
1.305961, 1.702726, -0.661992, 1, 0, 0.5803922, 1,
1.324547, 1.058501, 1.85152, 1, 0, 0.5764706, 1,
1.338188, 0.4223856, 0.5162029, 1, 0, 0.5686275, 1,
1.350046, -1.51947, 0.845955, 1, 0, 0.5647059, 1,
1.353989, -0.8342126, 1.827692, 1, 0, 0.5568628, 1,
1.377602, -0.9896837, 0.3879226, 1, 0, 0.5529412, 1,
1.380522, -0.3132744, 1.722004, 1, 0, 0.5450981, 1,
1.386774, 1.503447, 0.7997794, 1, 0, 0.5411765, 1,
1.397114, 0.09533134, 2.48433, 1, 0, 0.5333334, 1,
1.405235, -0.04362933, 2.288651, 1, 0, 0.5294118, 1,
1.410375, 0.8267554, 2.088098, 1, 0, 0.5215687, 1,
1.41197, -2.089527, 0.3323244, 1, 0, 0.5176471, 1,
1.412586, -0.2233597, 1.545396, 1, 0, 0.509804, 1,
1.451962, 1.552042, 1.302145, 1, 0, 0.5058824, 1,
1.46104, 0.2012233, 1.997307, 1, 0, 0.4980392, 1,
1.465434, 0.4073681, 3.530281, 1, 0, 0.4901961, 1,
1.478054, -0.9205056, 2.521584, 1, 0, 0.4862745, 1,
1.489231, -0.3113813, 2.747972, 1, 0, 0.4784314, 1,
1.491228, -2.096592, 2.632887, 1, 0, 0.4745098, 1,
1.508603, 0.4601654, 0.5652274, 1, 0, 0.4666667, 1,
1.524456, -1.804943, 1.489199, 1, 0, 0.4627451, 1,
1.539761, -0.1412163, 1.567432, 1, 0, 0.454902, 1,
1.541353, -0.9185145, 2.354867, 1, 0, 0.4509804, 1,
1.574205, -0.1613697, 2.117028, 1, 0, 0.4431373, 1,
1.5768, 1.362133, 0.3802797, 1, 0, 0.4392157, 1,
1.583607, -1.506528, 2.226639, 1, 0, 0.4313726, 1,
1.587175, 1.176293, 2.005409, 1, 0, 0.427451, 1,
1.595427, 1.141559, 1.177373, 1, 0, 0.4196078, 1,
1.596158, 0.1988121, 0.4601214, 1, 0, 0.4156863, 1,
1.600622, -0.4742972, 1.864023, 1, 0, 0.4078431, 1,
1.60657, -1.558104, 1.781153, 1, 0, 0.4039216, 1,
1.607252, 2.074348, 1.340972, 1, 0, 0.3960784, 1,
1.607346, -0.5328386, 1.311535, 1, 0, 0.3882353, 1,
1.614203, -2.150239, 2.5274, 1, 0, 0.3843137, 1,
1.619961, 0.3382246, 1.005001, 1, 0, 0.3764706, 1,
1.627684, 0.1147925, 2.146686, 1, 0, 0.372549, 1,
1.662102, -1.177184, 1.772651, 1, 0, 0.3647059, 1,
1.664618, 0.3590208, 1.434108, 1, 0, 0.3607843, 1,
1.669172, 1.442302, 2.349259, 1, 0, 0.3529412, 1,
1.685509, -0.008898002, 0.086933, 1, 0, 0.3490196, 1,
1.695319, -0.2943754, 1.224519, 1, 0, 0.3411765, 1,
1.704311, 0.1563641, 2.943379, 1, 0, 0.3372549, 1,
1.718345, -0.1151563, 3.064501, 1, 0, 0.3294118, 1,
1.73184, -0.3010417, 1.844118, 1, 0, 0.3254902, 1,
1.737552, 0.4321989, 0.007182439, 1, 0, 0.3176471, 1,
1.750871, -0.2749282, 1.50452, 1, 0, 0.3137255, 1,
1.755933, 0.2223019, 2.001707, 1, 0, 0.3058824, 1,
1.757505, 0.125256, 1.917213, 1, 0, 0.2980392, 1,
1.758311, -0.07265703, 2.753251, 1, 0, 0.2941177, 1,
1.759359, 0.2290275, 0.915088, 1, 0, 0.2862745, 1,
1.770036, 1.216444, 0.2518398, 1, 0, 0.282353, 1,
1.798712, 0.8426487, 1.891689, 1, 0, 0.2745098, 1,
1.815954, 2.760377, -0.6805673, 1, 0, 0.2705882, 1,
1.818627, -0.1692924, 1.067618, 1, 0, 0.2627451, 1,
1.822997, -1.00568, 2.379117, 1, 0, 0.2588235, 1,
1.825293, 0.06285033, 2.036662, 1, 0, 0.2509804, 1,
1.831155, -0.03904964, 1.401307, 1, 0, 0.2470588, 1,
1.844447, 0.9071004, 1.682142, 1, 0, 0.2392157, 1,
1.84543, 0.2412108, 1.962885, 1, 0, 0.2352941, 1,
1.846512, 0.6620937, 0.7509673, 1, 0, 0.227451, 1,
1.865858, 0.1715787, 0.7391714, 1, 0, 0.2235294, 1,
1.866621, 2.267367, 0.2154911, 1, 0, 0.2156863, 1,
1.89497, -0.5155542, 1.189646, 1, 0, 0.2117647, 1,
1.901094, -0.1914802, 1.977071, 1, 0, 0.2039216, 1,
1.90459, 0.7411517, 2.889791, 1, 0, 0.1960784, 1,
1.90733, 1.126536, 1.649466, 1, 0, 0.1921569, 1,
1.914311, 0.4147962, 1.553823, 1, 0, 0.1843137, 1,
1.928878, -1.323281, 2.034708, 1, 0, 0.1803922, 1,
1.954712, -1.247423, 2.067538, 1, 0, 0.172549, 1,
1.958028, -1.424888, 2.336799, 1, 0, 0.1686275, 1,
1.959841, 0.9597071, 0.9681093, 1, 0, 0.1607843, 1,
1.999026, -0.7668654, 2.61203, 1, 0, 0.1568628, 1,
2.00945, -0.4674117, 2.365382, 1, 0, 0.1490196, 1,
2.035943, -0.7450111, 2.675116, 1, 0, 0.145098, 1,
2.056031, -1.472925, 3.288833, 1, 0, 0.1372549, 1,
2.064463, -0.6112942, 3.065088, 1, 0, 0.1333333, 1,
2.131006, 0.1052324, 3.211029, 1, 0, 0.1254902, 1,
2.144632, 1.556328, 2.067684, 1, 0, 0.1215686, 1,
2.241349, 0.4087618, 1.755791, 1, 0, 0.1137255, 1,
2.257905, 0.7372895, 0.9767983, 1, 0, 0.1098039, 1,
2.285075, 0.8784221, 0.2914754, 1, 0, 0.1019608, 1,
2.29084, 0.6095509, 1.18677, 1, 0, 0.09411765, 1,
2.299783, -0.2820057, 0.6485288, 1, 0, 0.09019608, 1,
2.320433, 1.196689, 1.094125, 1, 0, 0.08235294, 1,
2.324295, -0.2425689, 1.491534, 1, 0, 0.07843138, 1,
2.335213, -0.01164959, 0.7997391, 1, 0, 0.07058824, 1,
2.336867, 0.005565214, 1.427989, 1, 0, 0.06666667, 1,
2.340897, 0.3646206, 1.843267, 1, 0, 0.05882353, 1,
2.357114, -0.09124874, 3.908132, 1, 0, 0.05490196, 1,
2.425758, 0.3682919, 1.815656, 1, 0, 0.04705882, 1,
2.483624, -0.8699, 2.213992, 1, 0, 0.04313726, 1,
2.548709, 1.629212, -0.3925365, 1, 0, 0.03529412, 1,
2.627985, -0.620541, 3.104127, 1, 0, 0.03137255, 1,
2.649255, 0.09794544, 0.5021138, 1, 0, 0.02352941, 1,
2.725468, 0.02842452, 1.12936, 1, 0, 0.01960784, 1,
3.068722, -0.8724838, 3.131123, 1, 0, 0.01176471, 1,
3.47386, 1.123921, 1.256077, 1, 0, 0.007843138, 1
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
-0.009387016, -5.967806, -7.035166, 0, -0.5, 0.5, 0.5,
-0.009387016, -5.967806, -7.035166, 1, -0.5, 0.5, 0.5,
-0.009387016, -5.967806, -7.035166, 1, 1.5, 0.5, 0.5,
-0.009387016, -5.967806, -7.035166, 0, 1.5, 0.5, 0.5
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
-4.673455, -0.8383998, -7.035166, 0, -0.5, 0.5, 0.5,
-4.673455, -0.8383998, -7.035166, 1, -0.5, 0.5, 0.5,
-4.673455, -0.8383998, -7.035166, 1, 1.5, 0.5, 0.5,
-4.673455, -0.8383998, -7.035166, 0, 1.5, 0.5, 0.5
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
-4.673455, -5.967806, -0.07025003, 0, -0.5, 0.5, 0.5,
-4.673455, -5.967806, -0.07025003, 1, -0.5, 0.5, 0.5,
-4.673455, -5.967806, -0.07025003, 1, 1.5, 0.5, 0.5,
-4.673455, -5.967806, -0.07025003, 0, 1.5, 0.5, 0.5
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
-3, -4.784097, -5.427878,
3, -4.784097, -5.427878,
-3, -4.784097, -5.427878,
-3, -4.981382, -5.695759,
-2, -4.784097, -5.427878,
-2, -4.981382, -5.695759,
-1, -4.784097, -5.427878,
-1, -4.981382, -5.695759,
0, -4.784097, -5.427878,
0, -4.981382, -5.695759,
1, -4.784097, -5.427878,
1, -4.981382, -5.695759,
2, -4.784097, -5.427878,
2, -4.981382, -5.695759,
3, -4.784097, -5.427878,
3, -4.981382, -5.695759
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
"-3",
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
-3, -5.375951, -6.231522, 0, -0.5, 0.5, 0.5,
-3, -5.375951, -6.231522, 1, -0.5, 0.5, 0.5,
-3, -5.375951, -6.231522, 1, 1.5, 0.5, 0.5,
-3, -5.375951, -6.231522, 0, 1.5, 0.5, 0.5,
-2, -5.375951, -6.231522, 0, -0.5, 0.5, 0.5,
-2, -5.375951, -6.231522, 1, -0.5, 0.5, 0.5,
-2, -5.375951, -6.231522, 1, 1.5, 0.5, 0.5,
-2, -5.375951, -6.231522, 0, 1.5, 0.5, 0.5,
-1, -5.375951, -6.231522, 0, -0.5, 0.5, 0.5,
-1, -5.375951, -6.231522, 1, -0.5, 0.5, 0.5,
-1, -5.375951, -6.231522, 1, 1.5, 0.5, 0.5,
-1, -5.375951, -6.231522, 0, 1.5, 0.5, 0.5,
0, -5.375951, -6.231522, 0, -0.5, 0.5, 0.5,
0, -5.375951, -6.231522, 1, -0.5, 0.5, 0.5,
0, -5.375951, -6.231522, 1, 1.5, 0.5, 0.5,
0, -5.375951, -6.231522, 0, 1.5, 0.5, 0.5,
1, -5.375951, -6.231522, 0, -0.5, 0.5, 0.5,
1, -5.375951, -6.231522, 1, -0.5, 0.5, 0.5,
1, -5.375951, -6.231522, 1, 1.5, 0.5, 0.5,
1, -5.375951, -6.231522, 0, 1.5, 0.5, 0.5,
2, -5.375951, -6.231522, 0, -0.5, 0.5, 0.5,
2, -5.375951, -6.231522, 1, -0.5, 0.5, 0.5,
2, -5.375951, -6.231522, 1, 1.5, 0.5, 0.5,
2, -5.375951, -6.231522, 0, 1.5, 0.5, 0.5,
3, -5.375951, -6.231522, 0, -0.5, 0.5, 0.5,
3, -5.375951, -6.231522, 1, -0.5, 0.5, 0.5,
3, -5.375951, -6.231522, 1, 1.5, 0.5, 0.5,
3, -5.375951, -6.231522, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
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
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
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
-3.597132, -4, -5.427878,
-3.597132, 2, -5.427878,
-3.597132, -4, -5.427878,
-3.776519, -4, -5.695759,
-3.597132, -2, -5.427878,
-3.776519, -2, -5.695759,
-3.597132, 0, -5.427878,
-3.776519, 0, -5.695759,
-3.597132, 2, -5.427878,
-3.776519, 2, -5.695759
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
"-4",
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
-4.135293, -4, -6.231522, 0, -0.5, 0.5, 0.5,
-4.135293, -4, -6.231522, 1, -0.5, 0.5, 0.5,
-4.135293, -4, -6.231522, 1, 1.5, 0.5, 0.5,
-4.135293, -4, -6.231522, 0, 1.5, 0.5, 0.5,
-4.135293, -2, -6.231522, 0, -0.5, 0.5, 0.5,
-4.135293, -2, -6.231522, 1, -0.5, 0.5, 0.5,
-4.135293, -2, -6.231522, 1, 1.5, 0.5, 0.5,
-4.135293, -2, -6.231522, 0, 1.5, 0.5, 0.5,
-4.135293, 0, -6.231522, 0, -0.5, 0.5, 0.5,
-4.135293, 0, -6.231522, 1, -0.5, 0.5, 0.5,
-4.135293, 0, -6.231522, 1, 1.5, 0.5, 0.5,
-4.135293, 0, -6.231522, 0, 1.5, 0.5, 0.5,
-4.135293, 2, -6.231522, 0, -0.5, 0.5, 0.5,
-4.135293, 2, -6.231522, 1, -0.5, 0.5, 0.5,
-4.135293, 2, -6.231522, 1, 1.5, 0.5, 0.5,
-4.135293, 2, -6.231522, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.597132, -4.784097, -4,
-3.597132, -4.784097, 4,
-3.597132, -4.784097, -4,
-3.776519, -4.981382, -4,
-3.597132, -4.784097, -2,
-3.776519, -4.981382, -2,
-3.597132, -4.784097, 0,
-3.776519, -4.981382, 0,
-3.597132, -4.784097, 2,
-3.776519, -4.981382, 2,
-3.597132, -4.784097, 4,
-3.776519, -4.981382, 4
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
-4.135293, -5.375951, -4, 0, -0.5, 0.5, 0.5,
-4.135293, -5.375951, -4, 1, -0.5, 0.5, 0.5,
-4.135293, -5.375951, -4, 1, 1.5, 0.5, 0.5,
-4.135293, -5.375951, -4, 0, 1.5, 0.5, 0.5,
-4.135293, -5.375951, -2, 0, -0.5, 0.5, 0.5,
-4.135293, -5.375951, -2, 1, -0.5, 0.5, 0.5,
-4.135293, -5.375951, -2, 1, 1.5, 0.5, 0.5,
-4.135293, -5.375951, -2, 0, 1.5, 0.5, 0.5,
-4.135293, -5.375951, 0, 0, -0.5, 0.5, 0.5,
-4.135293, -5.375951, 0, 1, -0.5, 0.5, 0.5,
-4.135293, -5.375951, 0, 1, 1.5, 0.5, 0.5,
-4.135293, -5.375951, 0, 0, 1.5, 0.5, 0.5,
-4.135293, -5.375951, 2, 0, -0.5, 0.5, 0.5,
-4.135293, -5.375951, 2, 1, -0.5, 0.5, 0.5,
-4.135293, -5.375951, 2, 1, 1.5, 0.5, 0.5,
-4.135293, -5.375951, 2, 0, 1.5, 0.5, 0.5,
-4.135293, -5.375951, 4, 0, -0.5, 0.5, 0.5,
-4.135293, -5.375951, 4, 1, -0.5, 0.5, 0.5,
-4.135293, -5.375951, 4, 1, 1.5, 0.5, 0.5,
-4.135293, -5.375951, 4, 0, 1.5, 0.5, 0.5
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
-3.597132, -4.784097, -5.427878,
-3.597132, 3.107297, -5.427878,
-3.597132, -4.784097, 5.287378,
-3.597132, 3.107297, 5.287378,
-3.597132, -4.784097, -5.427878,
-3.597132, -4.784097, 5.287378,
-3.597132, 3.107297, -5.427878,
-3.597132, 3.107297, 5.287378,
-3.597132, -4.784097, -5.427878,
3.578358, -4.784097, -5.427878,
-3.597132, -4.784097, 5.287378,
3.578358, -4.784097, 5.287378,
-3.597132, 3.107297, -5.427878,
3.578358, 3.107297, -5.427878,
-3.597132, 3.107297, 5.287378,
3.578358, 3.107297, 5.287378,
3.578358, -4.784097, -5.427878,
3.578358, 3.107297, -5.427878,
3.578358, -4.784097, 5.287378,
3.578358, 3.107297, 5.287378,
3.578358, -4.784097, -5.427878,
3.578358, -4.784097, 5.287378,
3.578358, 3.107297, -5.427878,
3.578358, 3.107297, 5.287378
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
var radius = 8.073152;
var distance = 35.91837;
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
mvMatrix.translate( 0.009387016, 0.8383998, 0.07025003 );
mvMatrix.scale( 1.216481, 1.106123, 0.8146189 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.91837);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
Mevinphos<-read.table("Mevinphos.xyz")
```

```
## Error in read.table("Mevinphos.xyz"): no lines available in input
```

```r
x<-Mevinphos$V2
```

```
## Error in eval(expr, envir, enclos): object 'Mevinphos' not found
```

```r
y<-Mevinphos$V3
```

```
## Error in eval(expr, envir, enclos): object 'Mevinphos' not found
```

```r
z<-Mevinphos$V4
```

```
## Error in eval(expr, envir, enclos): object 'Mevinphos' not found
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
-3.492634, -1.074648, -2.001407, 0, 0, 1, 1, 1,
-2.991995, 0.25478, -2.174182, 1, 0, 0, 1, 1,
-2.808663, 0.185167, -1.741799, 1, 0, 0, 1, 1,
-2.629689, 1.592899, -2.216705, 1, 0, 0, 1, 1,
-2.533437, 0.449884, -1.753801, 1, 0, 0, 1, 1,
-2.528413, 1.451891, -0.1942668, 1, 0, 0, 1, 1,
-2.451626, 0.3595225, -1.519483, 0, 0, 0, 1, 1,
-2.427053, 0.5896243, 0.1390507, 0, 0, 0, 1, 1,
-2.405294, 0.8041201, -0.2841393, 0, 0, 0, 1, 1,
-2.393594, 0.1803953, 0.8618143, 0, 0, 0, 1, 1,
-2.377862, -1.647475, -1.888969, 0, 0, 0, 1, 1,
-2.371967, 0.1701298, 1.981736, 0, 0, 0, 1, 1,
-2.336131, -1.939077, -2.388092, 0, 0, 0, 1, 1,
-2.307615, 0.6628875, -1.381339, 1, 1, 1, 1, 1,
-2.306762, 2.617454, -0.853214, 1, 1, 1, 1, 1,
-2.263285, -0.2719473, -2.467998, 1, 1, 1, 1, 1,
-2.238267, 0.1919365, -2.260626, 1, 1, 1, 1, 1,
-2.153337, -0.0761472, -3.103633, 1, 1, 1, 1, 1,
-2.152302, 1.150959, -2.557506, 1, 1, 1, 1, 1,
-2.129714, -0.3491575, -0.1536117, 1, 1, 1, 1, 1,
-2.101724, 0.186283, -1.206448, 1, 1, 1, 1, 1,
-2.088686, 0.8067545, -1.852169, 1, 1, 1, 1, 1,
-2.034342, 1.086598, -0.8740694, 1, 1, 1, 1, 1,
-2.029997, -0.7179229, -2.723747, 1, 1, 1, 1, 1,
-2.002831, -1.64052, -2.823544, 1, 1, 1, 1, 1,
-2.001423, -0.808086, -3.065223, 1, 1, 1, 1, 1,
-1.989713, -0.7594869, -3.610291, 1, 1, 1, 1, 1,
-1.96682, -0.774057, -2.806422, 1, 1, 1, 1, 1,
-1.94184, -0.5068632, -1.072833, 0, 0, 1, 1, 1,
-1.938909, -0.3929507, -2.001764, 1, 0, 0, 1, 1,
-1.923298, 1.665986, -2.408083, 1, 0, 0, 1, 1,
-1.911334, -0.8402941, -2.102862, 1, 0, 0, 1, 1,
-1.890424, 0.09138403, -1.960074, 1, 0, 0, 1, 1,
-1.882133, -0.4136682, -2.542419, 1, 0, 0, 1, 1,
-1.866814, 1.074389, -1.580389, 0, 0, 0, 1, 1,
-1.850909, 0.9748008, -1.636608, 0, 0, 0, 1, 1,
-1.838522, 1.745482, 0.6178852, 0, 0, 0, 1, 1,
-1.829777, 0.670037, -0.3929521, 0, 0, 0, 1, 1,
-1.819667, 0.301919, -1.38157, 0, 0, 0, 1, 1,
-1.800233, 0.1287618, -0.7944927, 0, 0, 0, 1, 1,
-1.786979, -0.8445384, -2.756476, 0, 0, 0, 1, 1,
-1.775481, 1.661921, 0.004028268, 1, 1, 1, 1, 1,
-1.7601, 0.2384011, -0.8743042, 1, 1, 1, 1, 1,
-1.752696, 0.2247083, -0.5871214, 1, 1, 1, 1, 1,
-1.74955, 0.0751434, -2.269625, 1, 1, 1, 1, 1,
-1.741241, 1.11277, -1.784422, 1, 1, 1, 1, 1,
-1.723495, -0.4418485, -1.152499, 1, 1, 1, 1, 1,
-1.711649, 0.5324503, -0.2643864, 1, 1, 1, 1, 1,
-1.700197, 0.8411411, -1.734837, 1, 1, 1, 1, 1,
-1.694146, 1.422296, -1.666326, 1, 1, 1, 1, 1,
-1.692611, 1.496239, -1.931515, 1, 1, 1, 1, 1,
-1.681971, 2.107711, -1.124743, 1, 1, 1, 1, 1,
-1.680354, -1.172166, -1.955186, 1, 1, 1, 1, 1,
-1.664693, -0.2869382, -1.595701, 1, 1, 1, 1, 1,
-1.663521, -0.08688347, -1.887672, 1, 1, 1, 1, 1,
-1.662969, -1.332954, -2.896062, 1, 1, 1, 1, 1,
-1.646821, -0.5256132, -2.762157, 0, 0, 1, 1, 1,
-1.635903, -0.1902598, -0.9693052, 1, 0, 0, 1, 1,
-1.629659, 1.045398, -3.002155, 1, 0, 0, 1, 1,
-1.615968, 0.4516026, 0.1441691, 1, 0, 0, 1, 1,
-1.613316, 2.085293, -0.757488, 1, 0, 0, 1, 1,
-1.597847, 0.7968788, -3.018071, 1, 0, 0, 1, 1,
-1.551713, -0.01379531, -2.199839, 0, 0, 0, 1, 1,
-1.549651, -0.06985096, 0.1183233, 0, 0, 0, 1, 1,
-1.546608, 0.79081, -0.003214439, 0, 0, 0, 1, 1,
-1.536327, 0.1843496, -2.89896, 0, 0, 0, 1, 1,
-1.534502, 0.3492461, -1.605158, 0, 0, 0, 1, 1,
-1.528928, 0.8240439, -2.042727, 0, 0, 0, 1, 1,
-1.522288, 0.140498, -1.111252, 0, 0, 0, 1, 1,
-1.521056, 0.01504199, -3.56884, 1, 1, 1, 1, 1,
-1.516147, -0.9761066, -0.985405, 1, 1, 1, 1, 1,
-1.511954, 1.333846, 0.2575953, 1, 1, 1, 1, 1,
-1.4973, 0.8058257, -1.98409, 1, 1, 1, 1, 1,
-1.489306, 0.8854778, -1.615158, 1, 1, 1, 1, 1,
-1.476431, -0.4751755, -0.9688227, 1, 1, 1, 1, 1,
-1.468177, -0.08997412, -3.116755, 1, 1, 1, 1, 1,
-1.457902, -2.02981, -3.038453, 1, 1, 1, 1, 1,
-1.453498, -1.814111, -2.983426, 1, 1, 1, 1, 1,
-1.452764, -0.4844423, -2.614059, 1, 1, 1, 1, 1,
-1.434912, -1.131235, -0.8696365, 1, 1, 1, 1, 1,
-1.42531, -1.074284, -2.574026, 1, 1, 1, 1, 1,
-1.41839, -3.05728, -2.971973, 1, 1, 1, 1, 1,
-1.415482, -1.291002, -3.591295, 1, 1, 1, 1, 1,
-1.412977, 0.5435478, -0.2219154, 1, 1, 1, 1, 1,
-1.412924, -0.8365267, -1.476195, 0, 0, 1, 1, 1,
-1.400575, 0.4213165, -2.19419, 1, 0, 0, 1, 1,
-1.400022, 0.4808998, -2.995231, 1, 0, 0, 1, 1,
-1.377751, 0.1777958, -2.045416, 1, 0, 0, 1, 1,
-1.36946, -1.898951, -2.550324, 1, 0, 0, 1, 1,
-1.341662, 0.6950119, -1.992164, 1, 0, 0, 1, 1,
-1.340791, 0.3463115, 0.09988803, 0, 0, 0, 1, 1,
-1.33792, -0.2702886, 1.279756, 0, 0, 0, 1, 1,
-1.335243, -0.8559821, -2.693063, 0, 0, 0, 1, 1,
-1.332374, -1.432284, -3.748879, 0, 0, 0, 1, 1,
-1.324232, -0.4079566, -4.115922, 0, 0, 0, 1, 1,
-1.317455, 0.2490431, 0.06196081, 0, 0, 0, 1, 1,
-1.314629, -2.239082, -2.834997, 0, 0, 0, 1, 1,
-1.305424, -0.4065214, -2.433746, 1, 1, 1, 1, 1,
-1.298306, -0.7003304, -1.033577, 1, 1, 1, 1, 1,
-1.29579, -2.549746, -2.325276, 1, 1, 1, 1, 1,
-1.295237, -0.2340317, -1.504798, 1, 1, 1, 1, 1,
-1.294478, -0.4391548, -1.794781, 1, 1, 1, 1, 1,
-1.29359, 1.323086, 0.1027637, 1, 1, 1, 1, 1,
-1.292132, -0.345976, -2.063248, 1, 1, 1, 1, 1,
-1.289397, -0.05829742, -2.128932, 1, 1, 1, 1, 1,
-1.280253, 1.507126, -0.08420178, 1, 1, 1, 1, 1,
-1.272668, 0.2660268, -2.354228, 1, 1, 1, 1, 1,
-1.26556, 0.6433491, -0.7540234, 1, 1, 1, 1, 1,
-1.256634, 0.9272524, -2.051604, 1, 1, 1, 1, 1,
-1.246491, 0.4001235, -2.77728, 1, 1, 1, 1, 1,
-1.244324, -0.09657849, -2.970958, 1, 1, 1, 1, 1,
-1.241013, -0.2772745, -1.846292, 1, 1, 1, 1, 1,
-1.238038, -0.8995646, -2.085271, 0, 0, 1, 1, 1,
-1.23633, 0.9654045, 0.3214006, 1, 0, 0, 1, 1,
-1.22911, -1.29054, -1.913798, 1, 0, 0, 1, 1,
-1.223666, 0.6495171, -1.783581, 1, 0, 0, 1, 1,
-1.220313, 0.1351544, -3.067987, 1, 0, 0, 1, 1,
-1.212894, 0.1431146, 0.4012308, 1, 0, 0, 1, 1,
-1.187912, 0.4344411, -2.287508, 0, 0, 0, 1, 1,
-1.175317, 0.5055143, -0.4458718, 0, 0, 0, 1, 1,
-1.16527, 0.0696041, -1.198503, 0, 0, 0, 1, 1,
-1.157356, -0.7476591, -2.512491, 0, 0, 0, 1, 1,
-1.141986, 1.841494, -0.1572167, 0, 0, 0, 1, 1,
-1.140753, 0.1071457, 0.3590061, 0, 0, 0, 1, 1,
-1.139566, 1.285599, -1.6521, 0, 0, 0, 1, 1,
-1.137675, -0.1879064, -1.311299, 1, 1, 1, 1, 1,
-1.135008, -0.3937385, -0.3379003, 1, 1, 1, 1, 1,
-1.134042, 0.8500208, -0.4536124, 1, 1, 1, 1, 1,
-1.131187, -0.6743453, -2.516321, 1, 1, 1, 1, 1,
-1.127536, -0.4447262, -2.228046, 1, 1, 1, 1, 1,
-1.124359, -0.4099659, -1.399279, 1, 1, 1, 1, 1,
-1.099089, -0.3257133, -1.893462, 1, 1, 1, 1, 1,
-1.097453, -2.364621, -2.438857, 1, 1, 1, 1, 1,
-1.09358, 0.5832646, -1.672173, 1, 1, 1, 1, 1,
-1.091108, 1.772869, -1.097764, 1, 1, 1, 1, 1,
-1.086959, -0.6761739, -1.700732, 1, 1, 1, 1, 1,
-1.079621, -0.4345708, -1.663382, 1, 1, 1, 1, 1,
-1.075086, -0.6496574, -2.57619, 1, 1, 1, 1, 1,
-1.072112, -0.6288147, -1.665915, 1, 1, 1, 1, 1,
-1.071137, -1.206271, -1.063765, 1, 1, 1, 1, 1,
-1.066484, 0.2574365, -0.92462, 0, 0, 1, 1, 1,
-1.065554, -0.4569288, -1.793173, 1, 0, 0, 1, 1,
-1.065432, 0.9627281, 1.180239, 1, 0, 0, 1, 1,
-1.059963, -0.03785423, -1.536662, 1, 0, 0, 1, 1,
-1.047256, 1.714384, -0.1189381, 1, 0, 0, 1, 1,
-1.040443, -0.3125297, -2.720475, 1, 0, 0, 1, 1,
-1.03466, -0.02185792, -1.074426, 0, 0, 0, 1, 1,
-1.03326, -2.064713, -4.200845, 0, 0, 0, 1, 1,
-1.032197, -0.7599964, -1.682685, 0, 0, 0, 1, 1,
-1.031219, -1.013224, -1.316101, 0, 0, 0, 1, 1,
-1.023396, -0.6432474, -3.593255, 0, 0, 0, 1, 1,
-1.022052, -0.3961255, -1.319082, 0, 0, 0, 1, 1,
-1.015931, 0.2467845, -2.937859, 0, 0, 0, 1, 1,
-1.006236, -1.274326, -2.537314, 1, 1, 1, 1, 1,
-1.005695, 0.2796368, -1.009741, 1, 1, 1, 1, 1,
-1.003605, 0.1824234, -0.4846728, 1, 1, 1, 1, 1,
-0.9995447, 1.382091, -0.9211842, 1, 1, 1, 1, 1,
-0.9951549, 0.1816575, -1.402351, 1, 1, 1, 1, 1,
-0.9933512, -0.409455, -2.48237, 1, 1, 1, 1, 1,
-0.9899349, -1.125879, -1.344432, 1, 1, 1, 1, 1,
-0.9866429, 0.6407353, 0.9608404, 1, 1, 1, 1, 1,
-0.9860545, -0.2175769, -0.6555865, 1, 1, 1, 1, 1,
-0.9825883, 1.33858, -1.746039, 1, 1, 1, 1, 1,
-0.9818271, 1.305379, -1.516012, 1, 1, 1, 1, 1,
-0.9803693, 0.08525894, -2.591492, 1, 1, 1, 1, 1,
-0.9784302, -0.2171117, -2.029262, 1, 1, 1, 1, 1,
-0.9695754, 0.5619385, -0.1816716, 1, 1, 1, 1, 1,
-0.9657407, 0.1602303, -0.8346131, 1, 1, 1, 1, 1,
-0.9650908, 0.1423939, -1.558835, 0, 0, 1, 1, 1,
-0.964649, -0.5070076, -0.298825, 1, 0, 0, 1, 1,
-0.9574356, 0.2087635, -1.4107, 1, 0, 0, 1, 1,
-0.9543219, -0.1641966, -2.21307, 1, 0, 0, 1, 1,
-0.9508258, 0.3995144, -0.5772544, 1, 0, 0, 1, 1,
-0.9493252, 0.3849429, -0.2155713, 1, 0, 0, 1, 1,
-0.9476965, 0.311818, -1.670498, 0, 0, 0, 1, 1,
-0.9462858, 1.284899, 0.4893552, 0, 0, 0, 1, 1,
-0.9430155, 1.15713, -0.7254168, 0, 0, 0, 1, 1,
-0.9334154, -0.3503585, -1.976277, 0, 0, 0, 1, 1,
-0.9324225, -0.01927218, -0.6054044, 0, 0, 0, 1, 1,
-0.9285863, 0.5807014, -2.077113, 0, 0, 0, 1, 1,
-0.9252121, -1.352912, -4.334375, 0, 0, 0, 1, 1,
-0.9250315, -0.05310373, -2.426774, 1, 1, 1, 1, 1,
-0.924737, 0.8207989, -1.869716, 1, 1, 1, 1, 1,
-0.9216618, 0.3099357, -0.3057039, 1, 1, 1, 1, 1,
-0.9205778, 0.7153228, -1.886563, 1, 1, 1, 1, 1,
-0.9168215, 1.34211, 0.1392794, 1, 1, 1, 1, 1,
-0.9111644, 2.083476, -1.357405, 1, 1, 1, 1, 1,
-0.9015012, -1.045757, -1.544918, 1, 1, 1, 1, 1,
-0.9010875, -1.129613, -2.615828, 1, 1, 1, 1, 1,
-0.8956987, 0.4976653, 0.1852546, 1, 1, 1, 1, 1,
-0.8831221, -1.088069, -4.040919, 1, 1, 1, 1, 1,
-0.8820483, 0.6658432, 0.2462022, 1, 1, 1, 1, 1,
-0.8781639, 0.6959626, -0.9587612, 1, 1, 1, 1, 1,
-0.8723862, 0.147374, -1.147163, 1, 1, 1, 1, 1,
-0.8681509, -0.2016039, -1.410021, 1, 1, 1, 1, 1,
-0.8677118, -0.01703023, -1.864339, 1, 1, 1, 1, 1,
-0.867308, 0.6166139, -1.997776, 0, 0, 1, 1, 1,
-0.8670454, 1.576668, -1.54322, 1, 0, 0, 1, 1,
-0.8645548, -0.2149946, -1.31795, 1, 0, 0, 1, 1,
-0.8631637, 2.295135, -1.163512, 1, 0, 0, 1, 1,
-0.8601924, 0.09440108, -1.746844, 1, 0, 0, 1, 1,
-0.8575075, -0.7053111, -0.8979319, 1, 0, 0, 1, 1,
-0.8574746, 0.413399, -2.119, 0, 0, 0, 1, 1,
-0.8571689, 0.430012, -0.8634722, 0, 0, 0, 1, 1,
-0.8555788, 2.968546, -0.8198951, 0, 0, 0, 1, 1,
-0.8515186, -0.2397409, -2.148019, 0, 0, 0, 1, 1,
-0.8447254, 0.8635834, -0.9544488, 0, 0, 0, 1, 1,
-0.8419904, 0.2060029, -2.21029, 0, 0, 0, 1, 1,
-0.8372551, -0.2109388, -0.9808183, 0, 0, 0, 1, 1,
-0.8334687, -2.055679, -3.690974, 1, 1, 1, 1, 1,
-0.8297657, 0.01258177, -1.950052, 1, 1, 1, 1, 1,
-0.8255538, -0.8449191, -2.49161, 1, 1, 1, 1, 1,
-0.8253039, 0.804679, -1.245028, 1, 1, 1, 1, 1,
-0.8228743, -1.366109, -3.522489, 1, 1, 1, 1, 1,
-0.8220201, 0.06668274, -1.237105, 1, 1, 1, 1, 1,
-0.8167847, 0.0832791, -0.6587307, 1, 1, 1, 1, 1,
-0.816497, -0.4324454, -0.8848558, 1, 1, 1, 1, 1,
-0.8161988, -0.07251804, -1.572331, 1, 1, 1, 1, 1,
-0.8125128, -3.386965, -2.209361, 1, 1, 1, 1, 1,
-0.810935, 0.0528161, -1.116739, 1, 1, 1, 1, 1,
-0.8066446, 0.1408263, -0.8701164, 1, 1, 1, 1, 1,
-0.8052269, 0.8206652, 0.1505481, 1, 1, 1, 1, 1,
-0.8029004, 0.1784208, -1.007737, 1, 1, 1, 1, 1,
-0.8027567, -1.443697, -1.791265, 1, 1, 1, 1, 1,
-0.8017168, -0.736987, -2.670312, 0, 0, 1, 1, 1,
-0.7951532, 0.4205568, -1.640104, 1, 0, 0, 1, 1,
-0.7947578, -0.1344945, -1.160631, 1, 0, 0, 1, 1,
-0.7931974, -0.1640322, -1.879611, 1, 0, 0, 1, 1,
-0.7861388, 1.318005, -1.350926, 1, 0, 0, 1, 1,
-0.7851019, -0.2299009, -1.746526, 1, 0, 0, 1, 1,
-0.7822114, 1.31916, -0.9456726, 0, 0, 0, 1, 1,
-0.7788556, 0.9541838, -0.8901903, 0, 0, 0, 1, 1,
-0.7761548, 1.360568, 0.1462882, 0, 0, 0, 1, 1,
-0.7736876, -0.8998505, -1.377215, 0, 0, 0, 1, 1,
-0.7663915, 0.4967537, -0.438616, 0, 0, 0, 1, 1,
-0.761718, 0.2554764, -2.306805, 0, 0, 0, 1, 1,
-0.7616234, -0.0248768, -0.5948464, 0, 0, 0, 1, 1,
-0.757571, 1.755638, 1.220678, 1, 1, 1, 1, 1,
-0.7453019, -1.208994, -2.835493, 1, 1, 1, 1, 1,
-0.7433929, -0.478574, -0.7414281, 1, 1, 1, 1, 1,
-0.7321693, -2.97743, -4.06343, 1, 1, 1, 1, 1,
-0.7271841, -0.6339599, -1.376209, 1, 1, 1, 1, 1,
-0.7246455, 0.0750015, -1.984694, 1, 1, 1, 1, 1,
-0.7219248, 0.3069386, -2.617961, 1, 1, 1, 1, 1,
-0.7181667, -0.9635126, -1.750897, 1, 1, 1, 1, 1,
-0.715701, 0.3483184, -0.7216811, 1, 1, 1, 1, 1,
-0.7140772, -0.3925484, -1.88413, 1, 1, 1, 1, 1,
-0.7111221, -0.2247709, -1.66534, 1, 1, 1, 1, 1,
-0.7018924, 0.2635559, -1.912327, 1, 1, 1, 1, 1,
-0.7011238, 1.555842, -1.493809, 1, 1, 1, 1, 1,
-0.696418, -0.383242, -2.441232, 1, 1, 1, 1, 1,
-0.6948817, 0.3627806, -0.3568794, 1, 1, 1, 1, 1,
-0.6948321, 1.762086, 0.04798846, 0, 0, 1, 1, 1,
-0.691258, -3.338763, -2.740592, 1, 0, 0, 1, 1,
-0.6876805, 0.09433819, -1.248198, 1, 0, 0, 1, 1,
-0.6847723, 0.4950368, -0.6674616, 1, 0, 0, 1, 1,
-0.6822062, 1.025453, -1.202745, 1, 0, 0, 1, 1,
-0.6768486, 0.151971, -1.854443, 1, 0, 0, 1, 1,
-0.6766096, 1.801756, -0.8921361, 0, 0, 0, 1, 1,
-0.6762241, 0.5428013, 0.6750676, 0, 0, 0, 1, 1,
-0.6755478, 0.5823401, -1.955689, 0, 0, 0, 1, 1,
-0.6732105, 0.1339064, -1.289616, 0, 0, 0, 1, 1,
-0.6717281, -1.396887, -1.671548, 0, 0, 0, 1, 1,
-0.6707107, -0.9865581, -2.243819, 0, 0, 0, 1, 1,
-0.6688784, 1.981875, 0.6985186, 0, 0, 0, 1, 1,
-0.6645699, 0.5356118, 0.3166173, 1, 1, 1, 1, 1,
-0.6626224, 1.29006, -2.114472, 1, 1, 1, 1, 1,
-0.6615877, -1.454171, -0.6400476, 1, 1, 1, 1, 1,
-0.6612555, 0.2686754, -2.415478, 1, 1, 1, 1, 1,
-0.6597131, 0.2706205, -2.45029, 1, 1, 1, 1, 1,
-0.6579381, -0.6371158, -3.650282, 1, 1, 1, 1, 1,
-0.6544459, 0.6800129, -1.250086, 1, 1, 1, 1, 1,
-0.6512196, -0.1908542, -1.239531, 1, 1, 1, 1, 1,
-0.6493438, 0.4662916, -0.2048747, 1, 1, 1, 1, 1,
-0.6481727, -1.059074, -2.373644, 1, 1, 1, 1, 1,
-0.6452046, 0.4526025, -1.194861, 1, 1, 1, 1, 1,
-0.6429473, -0.2503797, -2.287501, 1, 1, 1, 1, 1,
-0.6380861, -0.6850055, -2.76307, 1, 1, 1, 1, 1,
-0.637895, 0.06614773, -1.576345, 1, 1, 1, 1, 1,
-0.6313829, 1.247191, -1.93387, 1, 1, 1, 1, 1,
-0.6295956, 0.6164168, -0.9730304, 0, 0, 1, 1, 1,
-0.6272574, -0.5646502, -2.273462, 1, 0, 0, 1, 1,
-0.6261615, 1.863419, 0.2922326, 1, 0, 0, 1, 1,
-0.6229898, -0.6637078, -1.151377, 1, 0, 0, 1, 1,
-0.62155, 0.5362653, -0.4729861, 1, 0, 0, 1, 1,
-0.6182304, -0.3998444, -0.1907144, 1, 0, 0, 1, 1,
-0.6181731, -0.2907282, -3.332961, 0, 0, 0, 1, 1,
-0.6172935, -0.8118189, -1.936164, 0, 0, 0, 1, 1,
-0.6103998, -0.9372609, -1.999915, 0, 0, 0, 1, 1,
-0.6072569, 0.2681661, -2.702101, 0, 0, 0, 1, 1,
-0.6049462, 2.896464, -0.3290884, 0, 0, 0, 1, 1,
-0.5973361, 0.2632476, -1.514723, 0, 0, 0, 1, 1,
-0.5908132, -0.3392302, -2.138144, 0, 0, 0, 1, 1,
-0.590193, -1.23192, -3.187708, 1, 1, 1, 1, 1,
-0.5897118, -0.866823, -2.730345, 1, 1, 1, 1, 1,
-0.5875976, 0.4800574, -0.5216877, 1, 1, 1, 1, 1,
-0.5823336, 0.5325583, -1.669742, 1, 1, 1, 1, 1,
-0.5813602, 1.42976, -0.6433822, 1, 1, 1, 1, 1,
-0.5796537, 0.2127959, 0.172063, 1, 1, 1, 1, 1,
-0.5717161, -0.1975547, -3.825954, 1, 1, 1, 1, 1,
-0.5625435, 0.6596864, -1.116103, 1, 1, 1, 1, 1,
-0.5624155, -4.669174, -3.281452, 1, 1, 1, 1, 1,
-0.561902, 1.197909, -0.9129186, 1, 1, 1, 1, 1,
-0.5591991, 0.1478253, -2.094318, 1, 1, 1, 1, 1,
-0.5544951, -1.60246, -2.196145, 1, 1, 1, 1, 1,
-0.5527385, 1.443795, -2.57445, 1, 1, 1, 1, 1,
-0.5433556, 0.7659224, 0.03675222, 1, 1, 1, 1, 1,
-0.5427918, -1.94263, -1.703386, 1, 1, 1, 1, 1,
-0.5425212, 0.1343146, -1.493717, 0, 0, 1, 1, 1,
-0.541828, -0.3566511, -1.800089, 1, 0, 0, 1, 1,
-0.5410338, -0.5430483, -2.11693, 1, 0, 0, 1, 1,
-0.5402881, 0.2001863, -1.671877, 1, 0, 0, 1, 1,
-0.5390532, 0.7321003, -1.040018, 1, 0, 0, 1, 1,
-0.5332366, -1.334158, -2.409931, 1, 0, 0, 1, 1,
-0.5318383, -0.9408755, -1.871718, 0, 0, 0, 1, 1,
-0.5188785, -0.1421385, -2.582, 0, 0, 0, 1, 1,
-0.5117199, -1.647319, -1.073775, 0, 0, 0, 1, 1,
-0.5099143, -1.330054, -3.032041, 0, 0, 0, 1, 1,
-0.5086626, -1.489146, -3.285722, 0, 0, 0, 1, 1,
-0.5083736, 0.2157073, -0.6476231, 0, 0, 0, 1, 1,
-0.5037811, 0.4468256, 0.2657529, 0, 0, 0, 1, 1,
-0.5030178, 1.488771, -0.9171873, 1, 1, 1, 1, 1,
-0.4956761, -1.636935, -1.990795, 1, 1, 1, 1, 1,
-0.4904645, -0.5460198, -3.138406, 1, 1, 1, 1, 1,
-0.4841268, -2.014762, -3.884448, 1, 1, 1, 1, 1,
-0.483259, -1.372165, -0.8883035, 1, 1, 1, 1, 1,
-0.4807715, -1.374952, -2.675171, 1, 1, 1, 1, 1,
-0.4801808, -0.1951933, -2.182782, 1, 1, 1, 1, 1,
-0.4776843, 2.212117, -0.2087061, 1, 1, 1, 1, 1,
-0.4739013, -0.7455596, -3.010211, 1, 1, 1, 1, 1,
-0.4736229, 1.658401, -1.510404, 1, 1, 1, 1, 1,
-0.473269, 0.7440543, -0.8709343, 1, 1, 1, 1, 1,
-0.4704585, 1.091092, -2.23427, 1, 1, 1, 1, 1,
-0.4690956, 0.7871898, -1.357996, 1, 1, 1, 1, 1,
-0.4656059, 0.9937379, 0.503839, 1, 1, 1, 1, 1,
-0.4628959, 0.4409017, -0.337113, 1, 1, 1, 1, 1,
-0.4627057, -0.7514582, -1.679206, 0, 0, 1, 1, 1,
-0.4602751, -2.031167, -2.521362, 1, 0, 0, 1, 1,
-0.4600617, -0.1461849, -2.096987, 1, 0, 0, 1, 1,
-0.4529517, 0.6573074, -0.8094385, 1, 0, 0, 1, 1,
-0.4447179, 1.252515, 0.2876388, 1, 0, 0, 1, 1,
-0.4374926, -1.272188, -2.440724, 1, 0, 0, 1, 1,
-0.4319598, 1.127723, 0.5109201, 0, 0, 0, 1, 1,
-0.4243512, -0.9256417, -2.52015, 0, 0, 0, 1, 1,
-0.4184909, 0.2357849, -1.374417, 0, 0, 0, 1, 1,
-0.4184603, -1.213421, -3.73772, 0, 0, 0, 1, 1,
-0.4128183, 0.5991547, 1.191155, 0, 0, 0, 1, 1,
-0.409885, -0.008066009, -2.447692, 0, 0, 0, 1, 1,
-0.4056797, 0.3753762, -0.5038511, 0, 0, 0, 1, 1,
-0.4030506, 0.4446963, 0.02321473, 1, 1, 1, 1, 1,
-0.4022904, -0.6892698, -4.439749, 1, 1, 1, 1, 1,
-0.4007639, -0.9782277, -3.917405, 1, 1, 1, 1, 1,
-0.3968787, -0.7188199, -1.633002, 1, 1, 1, 1, 1,
-0.3931478, 0.9440685, -0.4064797, 1, 1, 1, 1, 1,
-0.3897199, -0.01683657, -1.704004, 1, 1, 1, 1, 1,
-0.3896506, -1.129335, -3.809521, 1, 1, 1, 1, 1,
-0.3884208, 1.301106, -1.53659, 1, 1, 1, 1, 1,
-0.3797733, 0.2258874, -2.504153, 1, 1, 1, 1, 1,
-0.3797521, -0.428183, -3.097349, 1, 1, 1, 1, 1,
-0.3792959, -0.6498042, -3.299927, 1, 1, 1, 1, 1,
-0.3771045, 0.2127801, -2.249975, 1, 1, 1, 1, 1,
-0.3747478, 1.476534, 0.2578354, 1, 1, 1, 1, 1,
-0.374519, 0.9532827, 0.6233155, 1, 1, 1, 1, 1,
-0.373591, 2.992374, -0.5074644, 1, 1, 1, 1, 1,
-0.3678201, -0.3154251, -2.47144, 0, 0, 1, 1, 1,
-0.3575418, 1.386695, -1.550891, 1, 0, 0, 1, 1,
-0.3556271, -0.1116489, -2.229892, 1, 0, 0, 1, 1,
-0.3518599, 2.619442, 1.79512, 1, 0, 0, 1, 1,
-0.348532, 0.08580922, -0.9649066, 1, 0, 0, 1, 1,
-0.3476314, 1.531219, -0.405834, 1, 0, 0, 1, 1,
-0.3470091, -0.1181223, -2.951237, 0, 0, 0, 1, 1,
-0.3454762, -1.622497, -1.770097, 0, 0, 0, 1, 1,
-0.3415254, -1.449805, -2.741315, 0, 0, 0, 1, 1,
-0.3410559, -1.331834, -3.524461, 0, 0, 0, 1, 1,
-0.3374323, 1.270625, 0.6220218, 0, 0, 0, 1, 1,
-0.3355635, -0.4064587, -2.462609, 0, 0, 0, 1, 1,
-0.3319827, -0.3928878, -3.231643, 0, 0, 0, 1, 1,
-0.3318918, -1.057911, -5.153339, 1, 1, 1, 1, 1,
-0.331487, -0.4835112, -2.793922, 1, 1, 1, 1, 1,
-0.3310986, -0.5941871, -1.862282, 1, 1, 1, 1, 1,
-0.3294908, 0.8078936, -0.01625713, 1, 1, 1, 1, 1,
-0.3268009, -0.3694215, -1.556063, 1, 1, 1, 1, 1,
-0.3237068, 0.3224241, -0.9257481, 1, 1, 1, 1, 1,
-0.3222165, -1.671825, -4.201982, 1, 1, 1, 1, 1,
-0.321921, 0.6408051, -0.6790472, 1, 1, 1, 1, 1,
-0.3159717, 1.013784, -0.2686273, 1, 1, 1, 1, 1,
-0.3101514, 0.5423074, -1.368913, 1, 1, 1, 1, 1,
-0.3062972, 0.2364712, 0.01747438, 1, 1, 1, 1, 1,
-0.3056272, 0.2975689, 1.376189, 1, 1, 1, 1, 1,
-0.3049357, 1.546414, 0.5701725, 1, 1, 1, 1, 1,
-0.3036178, 1.882239, -0.3090513, 1, 1, 1, 1, 1,
-0.3006157, 2.220814, -1.010567, 1, 1, 1, 1, 1,
-0.2988881, 0.2309232, -1.861921, 0, 0, 1, 1, 1,
-0.2948951, -1.29299, -3.968524, 1, 0, 0, 1, 1,
-0.2916741, 0.7253663, -0.3211038, 1, 0, 0, 1, 1,
-0.2915284, -0.4334603, -2.081835, 1, 0, 0, 1, 1,
-0.2912004, 0.2744493, -1.023028, 1, 0, 0, 1, 1,
-0.2904258, -0.8779909, -3.863038, 1, 0, 0, 1, 1,
-0.2901136, -1.157149, -2.890347, 0, 0, 0, 1, 1,
-0.2866742, -0.8517182, -3.607656, 0, 0, 0, 1, 1,
-0.2864954, -0.04870269, -0.688585, 0, 0, 0, 1, 1,
-0.2858241, 2.841052, 0.5078206, 0, 0, 0, 1, 1,
-0.2741156, -0.378812, -2.335199, 0, 0, 0, 1, 1,
-0.2705359, 1.598764, 1.087962, 0, 0, 0, 1, 1,
-0.2684959, -0.3471479, -0.6810837, 0, 0, 0, 1, 1,
-0.2666529, 2.032, -0.001782642, 1, 1, 1, 1, 1,
-0.2663306, -1.213313, -2.854063, 1, 1, 1, 1, 1,
-0.26265, 0.314106, -0.1376906, 1, 1, 1, 1, 1,
-0.2607277, 0.6658785, 0.08442597, 1, 1, 1, 1, 1,
-0.2601496, -0.6313034, -3.278744, 1, 1, 1, 1, 1,
-0.2560504, 0.5258453, -2.312239, 1, 1, 1, 1, 1,
-0.2538857, 0.9255833, -2.283657, 1, 1, 1, 1, 1,
-0.2536995, 0.2231569, -1.198693, 1, 1, 1, 1, 1,
-0.2500673, -0.7970147, -0.6206217, 1, 1, 1, 1, 1,
-0.2488106, -0.8422982, -2.135401, 1, 1, 1, 1, 1,
-0.2442557, 0.3498235, -1.825841, 1, 1, 1, 1, 1,
-0.2417952, 0.1614792, -2.485297, 1, 1, 1, 1, 1,
-0.2369452, 1.59233, -0.3593409, 1, 1, 1, 1, 1,
-0.231509, -0.895586, -4.330761, 1, 1, 1, 1, 1,
-0.2307601, 0.02821739, -1.178968, 1, 1, 1, 1, 1,
-0.2295346, -1.293659, -2.299843, 0, 0, 1, 1, 1,
-0.2291648, -0.4121647, -3.811331, 1, 0, 0, 1, 1,
-0.2287858, 0.9991046, 0.02979559, 1, 0, 0, 1, 1,
-0.225425, -1.824961, -3.552645, 1, 0, 0, 1, 1,
-0.2251622, -0.7850125, -0.8042142, 1, 0, 0, 1, 1,
-0.2186899, 0.6630306, -2.239367, 1, 0, 0, 1, 1,
-0.2184256, -0.8806998, -3.904591, 0, 0, 0, 1, 1,
-0.2171335, 0.3335174, 0.009505889, 0, 0, 0, 1, 1,
-0.2165621, 0.0574541, -1.262883, 0, 0, 0, 1, 1,
-0.2112818, 0.7543717, -1.35493, 0, 0, 0, 1, 1,
-0.2093139, -1.909144, -1.953126, 0, 0, 0, 1, 1,
-0.2087709, 2.777751, 0.7689449, 0, 0, 0, 1, 1,
-0.2064109, -0.4312281, -3.574642, 0, 0, 0, 1, 1,
-0.2030288, 1.188412, -0.2008503, 1, 1, 1, 1, 1,
-0.1991924, -0.3247927, -2.730421, 1, 1, 1, 1, 1,
-0.1991344, 0.2455346, -1.490313, 1, 1, 1, 1, 1,
-0.1889255, 0.2075439, -2.061118, 1, 1, 1, 1, 1,
-0.187222, -0.9510329, -4.143474, 1, 1, 1, 1, 1,
-0.1870532, -0.8675545, -3.537528, 1, 1, 1, 1, 1,
-0.1847281, -0.3845587, -3.15202, 1, 1, 1, 1, 1,
-0.1745808, -0.656792, -3.072669, 1, 1, 1, 1, 1,
-0.1679815, -1.647058, -5.271831, 1, 1, 1, 1, 1,
-0.1673429, 0.4153056, -1.823195, 1, 1, 1, 1, 1,
-0.1653615, 0.4072736, -2.052962, 1, 1, 1, 1, 1,
-0.16087, -0.6198846, -1.568535, 1, 1, 1, 1, 1,
-0.1582568, 0.5724694, -1.45968, 1, 1, 1, 1, 1,
-0.1570979, -1.303595, -4.034403, 1, 1, 1, 1, 1,
-0.156869, -0.2124737, -2.617372, 1, 1, 1, 1, 1,
-0.1559953, -1.971733, -3.652577, 0, 0, 1, 1, 1,
-0.1551883, -0.2447126, -2.605734, 1, 0, 0, 1, 1,
-0.1533591, -0.3346474, -2.389632, 1, 0, 0, 1, 1,
-0.1528554, 0.2085372, -0.1856115, 1, 0, 0, 1, 1,
-0.1519317, -0.0970933, -2.02727, 1, 0, 0, 1, 1,
-0.1512769, -2.636297, -3.652868, 1, 0, 0, 1, 1,
-0.1465246, -2.521445, -3.577426, 0, 0, 0, 1, 1,
-0.1461661, -1.029808, -2.169138, 0, 0, 0, 1, 1,
-0.1459548, 0.8380981, -0.2536127, 0, 0, 0, 1, 1,
-0.1446344, 0.2946653, -1.3496, 0, 0, 0, 1, 1,
-0.1431481, -1.942318, -3.073627, 0, 0, 0, 1, 1,
-0.1424763, 1.890607, -2.269833, 0, 0, 0, 1, 1,
-0.1416823, 0.4792078, -0.101554, 0, 0, 0, 1, 1,
-0.1408168, 1.445907, -0.7328507, 1, 1, 1, 1, 1,
-0.1403951, -0.5372362, -3.302867, 1, 1, 1, 1, 1,
-0.1356745, 0.9296755, -0.2226994, 1, 1, 1, 1, 1,
-0.1299279, 0.4533092, -1.109426, 1, 1, 1, 1, 1,
-0.1298171, -0.2157402, -1.641397, 1, 1, 1, 1, 1,
-0.124267, -2.194011, -2.88829, 1, 1, 1, 1, 1,
-0.1224134, -0.2774088, -1.602401, 1, 1, 1, 1, 1,
-0.1202737, -0.4611815, -2.95148, 1, 1, 1, 1, 1,
-0.1184125, 0.02914436, -0.6374274, 1, 1, 1, 1, 1,
-0.1161985, 1.16297, 0.5022332, 1, 1, 1, 1, 1,
-0.1080683, 1.555271, 0.3393061, 1, 1, 1, 1, 1,
-0.1048702, -0.1554846, -2.957802, 1, 1, 1, 1, 1,
-0.104467, 0.4974343, 0.6706741, 1, 1, 1, 1, 1,
-0.09647531, 2.067235, 0.7531307, 1, 1, 1, 1, 1,
-0.08722215, 0.9489201, -0.05071078, 1, 1, 1, 1, 1,
-0.08062904, 1.036293, -0.8489006, 0, 0, 1, 1, 1,
-0.07637712, 1.64294, 1.666931, 1, 0, 0, 1, 1,
-0.07617747, 0.6384709, -0.5640594, 1, 0, 0, 1, 1,
-0.07523257, 0.1456056, -1.82819, 1, 0, 0, 1, 1,
-0.07510965, -0.3004887, -2.453099, 1, 0, 0, 1, 1,
-0.06894407, -0.7102979, -4.259634, 1, 0, 0, 1, 1,
-0.06313026, -0.4631545, -3.562068, 0, 0, 0, 1, 1,
-0.05321864, 1.789677, 0.7638127, 0, 0, 0, 1, 1,
-0.05259181, 1.206619, 0.4954585, 0, 0, 0, 1, 1,
-0.05215983, -1.204538, -2.399647, 0, 0, 0, 1, 1,
-0.0519586, 0.2452075, 0.8243302, 0, 0, 0, 1, 1,
-0.05078266, 0.1912594, 0.3181109, 0, 0, 0, 1, 1,
-0.04861546, -0.8902228, -4.458726, 0, 0, 0, 1, 1,
-0.04686472, 0.5534993, -0.1992979, 1, 1, 1, 1, 1,
-0.04674396, 0.3708848, 1.194043, 1, 1, 1, 1, 1,
-0.04263239, -0.7536622, -3.897376, 1, 1, 1, 1, 1,
-0.04204101, -0.1758889, -2.665126, 1, 1, 1, 1, 1,
-0.04115646, 0.533221, 0.4306885, 1, 1, 1, 1, 1,
-0.03844018, -1.69409, -4.704215, 1, 1, 1, 1, 1,
-0.03754986, -0.3344806, -3.069162, 1, 1, 1, 1, 1,
-0.03604864, 1.737294, -0.4862166, 1, 1, 1, 1, 1,
-0.03539858, -1.178525, -1.146914, 1, 1, 1, 1, 1,
-0.02968194, -0.7694128, -4.045796, 1, 1, 1, 1, 1,
-0.02508839, 0.9150102, 1.800086, 1, 1, 1, 1, 1,
-0.02118105, 1.195636, -1.599363, 1, 1, 1, 1, 1,
-0.02053274, -0.4776284, -3.173241, 1, 1, 1, 1, 1,
-0.01260623, -0.1216257, -2.818116, 1, 1, 1, 1, 1,
-0.01048922, 0.05056369, -0.4495091, 1, 1, 1, 1, 1,
-0.008188577, 0.5669714, 0.07868873, 0, 0, 1, 1, 1,
-0.008167721, 0.1791551, -0.5225994, 1, 0, 0, 1, 1,
-0.007429747, -0.8876652, -1.358662, 1, 0, 0, 1, 1,
-0.007088327, -0.534632, -2.285403, 1, 0, 0, 1, 1,
-0.004497318, -0.8112052, -2.659869, 1, 0, 0, 1, 1,
-0.003776671, -0.04705538, -3.72883, 1, 0, 0, 1, 1,
-0.003386935, 0.1132212, -0.1216385, 0, 0, 0, 1, 1,
-0.00289254, 0.1768687, -0.8000129, 0, 0, 0, 1, 1,
-0.0004515384, 0.2055533, 0.6964363, 0, 0, 0, 1, 1,
0.002511994, -2.073751, 2.91761, 0, 0, 0, 1, 1,
0.004551863, -0.3845995, 3.676321, 0, 0, 0, 1, 1,
0.004623964, -1.28535, 1.074416, 0, 0, 0, 1, 1,
0.005587608, -1.826427, 0.8192107, 0, 0, 0, 1, 1,
0.009800287, 1.288285, -0.8616121, 1, 1, 1, 1, 1,
0.01544943, -0.9313658, 1.528954, 1, 1, 1, 1, 1,
0.01710791, 0.1862725, 0.0985667, 1, 1, 1, 1, 1,
0.01902374, 1.006806, -0.4253694, 1, 1, 1, 1, 1,
0.02149618, 1.186343, -2.066285, 1, 1, 1, 1, 1,
0.02384822, 0.1928027, -0.535435, 1, 1, 1, 1, 1,
0.02405594, -0.7112681, 5.13133, 1, 1, 1, 1, 1,
0.02576132, -0.5950706, 3.793039, 1, 1, 1, 1, 1,
0.02867794, -0.7354124, 4.078555, 1, 1, 1, 1, 1,
0.03239653, 0.06140741, 1.909561, 1, 1, 1, 1, 1,
0.05308228, 0.2198292, 0.3312087, 1, 1, 1, 1, 1,
0.05421255, -1.408812, 4.364865, 1, 1, 1, 1, 1,
0.05465226, -0.1590264, 1.962383, 1, 1, 1, 1, 1,
0.05570516, -1.21195, 3.178875, 1, 1, 1, 1, 1,
0.05598828, -0.3187725, 3.695062, 1, 1, 1, 1, 1,
0.0560551, -0.6130136, 2.93771, 0, 0, 1, 1, 1,
0.06232389, 1.192523, 0.4100627, 1, 0, 0, 1, 1,
0.06298143, 0.1406062, 1.848515, 1, 0, 0, 1, 1,
0.06368689, -1.0775, 2.504341, 1, 0, 0, 1, 1,
0.06739201, -0.4251662, 3.519727, 1, 0, 0, 1, 1,
0.07056399, -0.5190428, 4.5472, 1, 0, 0, 1, 1,
0.07223503, -0.3686974, 5.071264, 0, 0, 0, 1, 1,
0.07534142, -0.07874791, 2.82556, 0, 0, 0, 1, 1,
0.0769242, -0.781465, 3.465374, 0, 0, 0, 1, 1,
0.08287183, 0.4220116, -0.3572341, 0, 0, 0, 1, 1,
0.08691853, 1.386593, 0.227304, 0, 0, 0, 1, 1,
0.08926751, 0.5762345, 0.4069825, 0, 0, 0, 1, 1,
0.0893451, -1.122745, 2.024879, 0, 0, 0, 1, 1,
0.09068429, 0.3233116, -0.4409647, 1, 1, 1, 1, 1,
0.0956791, -0.1366823, 2.152714, 1, 1, 1, 1, 1,
0.09849192, -0.4836431, 3.472839, 1, 1, 1, 1, 1,
0.09910189, 1.442719, 0.384359, 1, 1, 1, 1, 1,
0.1002882, 1.841772, 0.9792193, 1, 1, 1, 1, 1,
0.1060086, -1.333386, 2.810254, 1, 1, 1, 1, 1,
0.109942, -1.119266, 1.155506, 1, 1, 1, 1, 1,
0.1104306, 0.220738, 0.3293584, 1, 1, 1, 1, 1,
0.1130884, 0.5142908, 2.58177, 1, 1, 1, 1, 1,
0.1143155, 0.1869548, 0.1777884, 1, 1, 1, 1, 1,
0.1145917, -1.43296, 2.998846, 1, 1, 1, 1, 1,
0.1203238, 0.2344261, 2.133175, 1, 1, 1, 1, 1,
0.1204928, 1.707029, 0.1658974, 1, 1, 1, 1, 1,
0.121811, -0.9836448, 3.937362, 1, 1, 1, 1, 1,
0.1311018, 1.110632, -0.5560886, 1, 1, 1, 1, 1,
0.1316892, 0.7988122, 0.7286052, 0, 0, 1, 1, 1,
0.1323561, 0.3429807, 3.081949, 1, 0, 0, 1, 1,
0.1349427, -0.7175878, 4.087939, 1, 0, 0, 1, 1,
0.1396047, 0.4059772, 0.3148327, 1, 0, 0, 1, 1,
0.1405514, -0.8922982, 2.964795, 1, 0, 0, 1, 1,
0.141319, -1.227329, 2.955959, 1, 0, 0, 1, 1,
0.1462164, 0.03134783, 0.9355442, 0, 0, 0, 1, 1,
0.1469688, 1.627867, 1.422268, 0, 0, 0, 1, 1,
0.1469951, 1.71198, -0.9947347, 0, 0, 0, 1, 1,
0.1493042, 0.1197063, 1.370794, 0, 0, 0, 1, 1,
0.153477, 0.5544893, 0.3827272, 0, 0, 0, 1, 1,
0.15523, -0.08139344, 0.2655737, 0, 0, 0, 1, 1,
0.1607379, -0.8176059, 3.798587, 0, 0, 0, 1, 1,
0.1674255, 2.170007, -1.690148, 1, 1, 1, 1, 1,
0.168495, 0.9858075, -0.8631917, 1, 1, 1, 1, 1,
0.1704367, 1.125669, -0.2851772, 1, 1, 1, 1, 1,
0.1729299, -0.3346563, 1.649162, 1, 1, 1, 1, 1,
0.1811006, -2.987925, 3.308122, 1, 1, 1, 1, 1,
0.1943225, 0.5972978, -0.2153286, 1, 1, 1, 1, 1,
0.1953613, 0.8188295, -0.763563, 1, 1, 1, 1, 1,
0.196793, 0.93343, -0.05541833, 1, 1, 1, 1, 1,
0.200591, -0.4170621, 1.333046, 1, 1, 1, 1, 1,
0.2008759, 0.4492638, -0.7047488, 1, 1, 1, 1, 1,
0.2020627, 1.08098, -0.932433, 1, 1, 1, 1, 1,
0.2033243, 0.2962582, 2.093628, 1, 1, 1, 1, 1,
0.2039202, 0.1876806, 2.800166, 1, 1, 1, 1, 1,
0.2043357, 0.07646137, 3.554284, 1, 1, 1, 1, 1,
0.2068603, 2.208915, -1.922813, 1, 1, 1, 1, 1,
0.2077723, -1.693627, 1.884882, 0, 0, 1, 1, 1,
0.2093536, 0.1786833, 0.6210831, 1, 0, 0, 1, 1,
0.2152743, 0.06297144, 1.311739, 1, 0, 0, 1, 1,
0.2162968, -0.5033563, 4.244381, 1, 0, 0, 1, 1,
0.2166662, 0.8185447, 0.01094933, 1, 0, 0, 1, 1,
0.2176522, -1.14487, 2.172131, 1, 0, 0, 1, 1,
0.2325435, -1.122859, 3.165868, 0, 0, 0, 1, 1,
0.234636, -0.8736374, 2.538383, 0, 0, 0, 1, 1,
0.2403358, -0.3997872, 2.697973, 0, 0, 0, 1, 1,
0.2405998, -0.1005965, 2.542303, 0, 0, 0, 1, 1,
0.2436544, -1.508114, 3.554604, 0, 0, 0, 1, 1,
0.2443022, 0.1120816, 2.6192, 0, 0, 0, 1, 1,
0.2453979, 2.332543, 1.878352, 0, 0, 0, 1, 1,
0.2496593, -0.2278964, 2.970734, 1, 1, 1, 1, 1,
0.2519007, 2.103852, 1.281633, 1, 1, 1, 1, 1,
0.2571607, 0.9166613, -1.164551, 1, 1, 1, 1, 1,
0.2615924, 0.9637064, -0.2578366, 1, 1, 1, 1, 1,
0.2619158, -0.280259, 1.515666, 1, 1, 1, 1, 1,
0.2657785, 0.5972787, 1.807526, 1, 1, 1, 1, 1,
0.2677865, 0.3118858, 1.992202, 1, 1, 1, 1, 1,
0.2715486, 0.2072129, 1.203191, 1, 1, 1, 1, 1,
0.2730577, 0.4720872, 0.49401, 1, 1, 1, 1, 1,
0.2743594, -1.109979, 3.124061, 1, 1, 1, 1, 1,
0.2764819, 0.6944708, 0.1184139, 1, 1, 1, 1, 1,
0.2799317, 0.3661671, 0.5659944, 1, 1, 1, 1, 1,
0.2820108, -0.6960985, 2.738532, 1, 1, 1, 1, 1,
0.2861983, -0.5411094, 1.007561, 1, 1, 1, 1, 1,
0.2866947, 0.9971486, -0.2305574, 1, 1, 1, 1, 1,
0.2887591, 0.7460695, 0.7494153, 0, 0, 1, 1, 1,
0.2963226, 0.958856, 1.280079, 1, 0, 0, 1, 1,
0.296523, -0.5002826, 2.532837, 1, 0, 0, 1, 1,
0.2988944, 0.9386725, 0.03188199, 1, 0, 0, 1, 1,
0.3016328, -0.2447885, 2.373543, 1, 0, 0, 1, 1,
0.3016742, -1.021114, 2.121534, 1, 0, 0, 1, 1,
0.3084365, 0.6536257, 1.542252, 0, 0, 0, 1, 1,
0.3094725, -0.9020067, 3.14034, 0, 0, 0, 1, 1,
0.310009, 0.3321671, -0.3877317, 0, 0, 0, 1, 1,
0.3107333, -0.7983201, 0.358126, 0, 0, 0, 1, 1,
0.3125314, -1.370901, 3.994797, 0, 0, 0, 1, 1,
0.3155212, 1.512824, 0.7689039, 0, 0, 0, 1, 1,
0.3256498, -0.4377067, 1.705902, 0, 0, 0, 1, 1,
0.3290475, -0.02151398, 1.917955, 1, 1, 1, 1, 1,
0.3309622, 0.06234443, 1.627622, 1, 1, 1, 1, 1,
0.3329321, 1.634062, 1.349855, 1, 1, 1, 1, 1,
0.3388125, -0.1910714, 2.772617, 1, 1, 1, 1, 1,
0.3393831, -1.627306, 3.643397, 1, 1, 1, 1, 1,
0.3453746, 0.1969097, 3.02028, 1, 1, 1, 1, 1,
0.3465951, 0.1416423, 1.142316, 1, 1, 1, 1, 1,
0.3469228, 0.88782, 0.1855439, 1, 1, 1, 1, 1,
0.3541779, 0.09516631, 0.8160298, 1, 1, 1, 1, 1,
0.3609505, -1.462661, 3.084701, 1, 1, 1, 1, 1,
0.3620383, -1.194109, 1.954357, 1, 1, 1, 1, 1,
0.3645395, 0.2076637, 2.275713, 1, 1, 1, 1, 1,
0.3672645, 0.088831, 2.651033, 1, 1, 1, 1, 1,
0.3697959, 1.57107, -0.05363021, 1, 1, 1, 1, 1,
0.3783613, 0.1286775, 2.451233, 1, 1, 1, 1, 1,
0.380333, 1.37439, 0.04285202, 0, 0, 1, 1, 1,
0.3803847, 1.442319, 0.3127691, 1, 0, 0, 1, 1,
0.3833563, -0.2563697, 1.227985, 1, 0, 0, 1, 1,
0.3903835, -1.766307, 3.865749, 1, 0, 0, 1, 1,
0.3993986, -0.4870369, 3.500867, 1, 0, 0, 1, 1,
0.4000028, -0.1189166, 1.318534, 1, 0, 0, 1, 1,
0.4030222, -0.1741595, -0.2443794, 0, 0, 0, 1, 1,
0.4049679, -1.418173, 2.049288, 0, 0, 0, 1, 1,
0.4069425, -0.5059955, 4.290739, 0, 0, 0, 1, 1,
0.4079572, -1.094537, 2.147443, 0, 0, 0, 1, 1,
0.4175239, 1.030244, -1.112836, 0, 0, 0, 1, 1,
0.4179124, -1.176344, 3.401281, 0, 0, 0, 1, 1,
0.4192639, 0.2374758, 0.1614091, 0, 0, 0, 1, 1,
0.4233817, -0.1843845, 1.59989, 1, 1, 1, 1, 1,
0.4240234, 2.406205, -1.159944, 1, 1, 1, 1, 1,
0.4266489, 2.72117, 1.226632, 1, 1, 1, 1, 1,
0.426969, 0.2009749, 1.005287, 1, 1, 1, 1, 1,
0.4280124, 0.350426, -0.9780026, 1, 1, 1, 1, 1,
0.4329656, 1.197708, 0.4516924, 1, 1, 1, 1, 1,
0.4396297, 0.3387811, -0.333207, 1, 1, 1, 1, 1,
0.439801, 0.05264075, 1.743435, 1, 1, 1, 1, 1,
0.4400327, -1.069043, 2.417552, 1, 1, 1, 1, 1,
0.4430898, 0.8311608, 0.8570557, 1, 1, 1, 1, 1,
0.444687, 1.946751, 1.224247, 1, 1, 1, 1, 1,
0.4460125, 0.9626667, -1.089568, 1, 1, 1, 1, 1,
0.4469436, -0.0409376, 2.468863, 1, 1, 1, 1, 1,
0.4508455, -0.7039201, 2.861009, 1, 1, 1, 1, 1,
0.4564996, 0.2584053, 1.862996, 1, 1, 1, 1, 1,
0.460439, 0.5022956, -1.067525, 0, 0, 1, 1, 1,
0.4656277, -2.299973, 4.121893, 1, 0, 0, 1, 1,
0.4659884, -0.6989102, 1.737672, 1, 0, 0, 1, 1,
0.4697302, -0.6459485, 3.742312, 1, 0, 0, 1, 1,
0.4741089, -1.159534, 3.907732, 1, 0, 0, 1, 1,
0.4775012, 1.530511, 0.1687519, 1, 0, 0, 1, 1,
0.4893761, -1.824664, 2.047125, 0, 0, 0, 1, 1,
0.492199, -0.5598816, 3.813761, 0, 0, 0, 1, 1,
0.4930593, -0.02001729, 0.3286294, 0, 0, 0, 1, 1,
0.4951867, 1.419444, -1.42939, 0, 0, 0, 1, 1,
0.5071189, 0.599709, -0.2875742, 0, 0, 0, 1, 1,
0.5086154, 1.985106, 1.081094, 0, 0, 0, 1, 1,
0.5124294, -0.3125432, -0.3631682, 0, 0, 0, 1, 1,
0.5172726, 0.6222909, 0.2898719, 1, 1, 1, 1, 1,
0.5222962, -1.16403, 2.474003, 1, 1, 1, 1, 1,
0.5256064, -0.3675921, 1.210753, 1, 1, 1, 1, 1,
0.5302643, -0.2917519, 4.141789, 1, 1, 1, 1, 1,
0.5374458, -0.7857499, 2.439746, 1, 1, 1, 1, 1,
0.5386739, 2.181676, 0.2153945, 1, 1, 1, 1, 1,
0.5411772, -0.1367819, 2.238205, 1, 1, 1, 1, 1,
0.5416522, -0.6719503, 2.217738, 1, 1, 1, 1, 1,
0.5436521, -0.6241143, 1.734428, 1, 1, 1, 1, 1,
0.5532357, -1.183387, 3.401031, 1, 1, 1, 1, 1,
0.5543808, -1.50629, 3.190917, 1, 1, 1, 1, 1,
0.5573747, -0.8019019, 2.709079, 1, 1, 1, 1, 1,
0.5580994, 0.6571121, 2.118183, 1, 1, 1, 1, 1,
0.56582, 0.3245235, 0.2027406, 1, 1, 1, 1, 1,
0.5664137, 0.07617378, 3.364716, 1, 1, 1, 1, 1,
0.5693104, 0.05666997, 2.552462, 0, 0, 1, 1, 1,
0.5713909, 0.1529002, 1.228191, 1, 0, 0, 1, 1,
0.576703, 1.412188, 0.4300036, 1, 0, 0, 1, 1,
0.5792926, 0.03864529, 2.8038, 1, 0, 0, 1, 1,
0.584939, -0.3372859, 2.984218, 1, 0, 0, 1, 1,
0.5876737, 2.500579, -0.5712018, 1, 0, 0, 1, 1,
0.5881183, 0.9439254, 1.670689, 0, 0, 0, 1, 1,
0.5946031, 0.6988575, 2.299823, 0, 0, 0, 1, 1,
0.5950092, -1.383458, 3.601457, 0, 0, 0, 1, 1,
0.5985556, -0.2047177, 2.515159, 0, 0, 0, 1, 1,
0.6012657, -0.6281753, 0.8658439, 0, 0, 0, 1, 1,
0.604523, -1.553418, 2.251049, 0, 0, 0, 1, 1,
0.6080244, 1.107765, -0.53243, 0, 0, 0, 1, 1,
0.6157356, 0.5167485, 1.817701, 1, 1, 1, 1, 1,
0.6168826, 0.9214538, 0.03232341, 1, 1, 1, 1, 1,
0.6208576, 0.2521051, 1.712925, 1, 1, 1, 1, 1,
0.6227747, -0.6448353, 2.697542, 1, 1, 1, 1, 1,
0.6254181, 0.5214167, 0.6027338, 1, 1, 1, 1, 1,
0.6267668, 0.3044896, 2.695368, 1, 1, 1, 1, 1,
0.6286166, -0.3284755, 2.785994, 1, 1, 1, 1, 1,
0.6305411, -0.9289376, 3.254762, 1, 1, 1, 1, 1,
0.6333909, -1.170089, 2.974822, 1, 1, 1, 1, 1,
0.6359947, 0.3618819, -0.2951575, 1, 1, 1, 1, 1,
0.6430355, -1.090277, 3.602032, 1, 1, 1, 1, 1,
0.645111, 1.084521, 3.103132, 1, 1, 1, 1, 1,
0.6452191, 0.1410578, 1.450483, 1, 1, 1, 1, 1,
0.6477597, 0.2126082, -1.47693, 1, 1, 1, 1, 1,
0.6513188, -0.04045818, 1.342219, 1, 1, 1, 1, 1,
0.6601717, 0.4822051, 1.068474, 0, 0, 1, 1, 1,
0.6615621, 0.2511728, 0.9056622, 1, 0, 0, 1, 1,
0.6727784, -0.0535678, 1.838793, 1, 0, 0, 1, 1,
0.6756872, 0.2216442, 1.75772, 1, 0, 0, 1, 1,
0.6850905, 1.270456, -0.06229747, 1, 0, 0, 1, 1,
0.6858528, -0.3166398, 0.9394751, 1, 0, 0, 1, 1,
0.6869743, -0.9491018, 2.106598, 0, 0, 0, 1, 1,
0.6939231, 0.02537162, 1.180323, 0, 0, 0, 1, 1,
0.6949504, 1.229985, 0.7928144, 0, 0, 0, 1, 1,
0.6959443, -0.2464849, 1.603813, 0, 0, 0, 1, 1,
0.7004091, 0.873652, 0.2340072, 0, 0, 0, 1, 1,
0.700664, -1.219145, 3.40044, 0, 0, 0, 1, 1,
0.7022873, 1.625701, 2.121683, 0, 0, 0, 1, 1,
0.7195862, -1.592692, 2.255823, 1, 1, 1, 1, 1,
0.7229074, -2.748821, 3.138526, 1, 1, 1, 1, 1,
0.7243059, -1.354102, 2.490672, 1, 1, 1, 1, 1,
0.7299189, -0.1077157, 1.178944, 1, 1, 1, 1, 1,
0.7311643, -0.6465116, 2.896695, 1, 1, 1, 1, 1,
0.7327318, -0.9223468, 1.680607, 1, 1, 1, 1, 1,
0.733717, 1.579324, 0.06511233, 1, 1, 1, 1, 1,
0.7387797, -0.4886557, 0.6315811, 1, 1, 1, 1, 1,
0.7392892, -0.3638017, 1.22287, 1, 1, 1, 1, 1,
0.7511511, -0.9502166, 3.329743, 1, 1, 1, 1, 1,
0.7639725, 1.262787, 1.005401, 1, 1, 1, 1, 1,
0.7659827, 0.2845404, -0.200485, 1, 1, 1, 1, 1,
0.7708435, 0.9765538, -0.1098929, 1, 1, 1, 1, 1,
0.7734342, -0.5363641, 2.681079, 1, 1, 1, 1, 1,
0.7834135, -0.4823923, 1.367869, 1, 1, 1, 1, 1,
0.7855071, 0.7147532, 0.7865492, 0, 0, 1, 1, 1,
0.7857392, -0.4697961, 2.431406, 1, 0, 0, 1, 1,
0.7907215, -0.3978328, 2.606134, 1, 0, 0, 1, 1,
0.7978416, -1.297022, 3.976858, 1, 0, 0, 1, 1,
0.8013577, 1.812737, -0.3571022, 1, 0, 0, 1, 1,
0.801382, 0.4351272, 2.012282, 1, 0, 0, 1, 1,
0.8015357, -0.0974623, 2.941778, 0, 0, 0, 1, 1,
0.803388, -1.041524, 2.822159, 0, 0, 0, 1, 1,
0.8051487, 0.189191, 0.9916461, 0, 0, 0, 1, 1,
0.8081304, 1.360078, 0.590563, 0, 0, 0, 1, 1,
0.8103534, -0.05067359, 1.121721, 0, 0, 0, 1, 1,
0.8137566, 0.7040988, 1.896879, 0, 0, 0, 1, 1,
0.8141789, -0.2290652, 1.414997, 0, 0, 0, 1, 1,
0.822073, -0.8653224, 2.83766, 1, 1, 1, 1, 1,
0.823935, 0.3823907, 0.9892778, 1, 1, 1, 1, 1,
0.8259699, -1.153507, 3.060993, 1, 1, 1, 1, 1,
0.8299362, -0.3432259, 2.570076, 1, 1, 1, 1, 1,
0.8301201, -2.027585, 2.675892, 1, 1, 1, 1, 1,
0.835225, -0.18338, 2.820526, 1, 1, 1, 1, 1,
0.837114, -0.6800117, 1.417335, 1, 1, 1, 1, 1,
0.8383167, -0.8859272, 1.355098, 1, 1, 1, 1, 1,
0.8491879, 1.154739, 1.861366, 1, 1, 1, 1, 1,
0.8517473, 0.8200512, 0.4216748, 1, 1, 1, 1, 1,
0.8586234, -0.5936111, 0.8275022, 1, 1, 1, 1, 1,
0.8588373, -1.235886, 2.702426, 1, 1, 1, 1, 1,
0.8659813, -0.4200701, 3.029042, 1, 1, 1, 1, 1,
0.8705286, 0.8457204, 1.105382, 1, 1, 1, 1, 1,
0.8710643, 0.4407907, 2.168455, 1, 1, 1, 1, 1,
0.8713331, 1.314565, 0.4494732, 0, 0, 1, 1, 1,
0.8714268, 0.9043025, 0.8701406, 1, 0, 0, 1, 1,
0.8749803, 0.3222095, -0.1952794, 1, 0, 0, 1, 1,
0.8787925, -0.7868589, 2.57144, 1, 0, 0, 1, 1,
0.887166, 1.301281, -0.2389103, 1, 0, 0, 1, 1,
0.8883891, -1.331668, 1.521778, 1, 0, 0, 1, 1,
0.889137, 0.12122, 0.1949709, 0, 0, 0, 1, 1,
0.8940454, 0.3911979, 0.9880916, 0, 0, 0, 1, 1,
0.8957103, 0.2302459, 1.400986, 0, 0, 0, 1, 1,
0.898081, 0.3535681, 1.671692, 0, 0, 0, 1, 1,
0.8984904, -0.9170431, 3.532255, 0, 0, 0, 1, 1,
0.9022911, 1.328045, 1.271362, 0, 0, 0, 1, 1,
0.9023968, -0.1081778, 2.48448, 0, 0, 0, 1, 1,
0.9043236, 0.3663431, 1.591498, 1, 1, 1, 1, 1,
0.9070276, -0.09032407, 3.016712, 1, 1, 1, 1, 1,
0.9135724, -0.3239122, 1.517563, 1, 1, 1, 1, 1,
0.9152131, 0.08745571, -0.1057092, 1, 1, 1, 1, 1,
0.916218, 0.5829756, -0.02593714, 1, 1, 1, 1, 1,
0.921651, 1.693328, 1.775938, 1, 1, 1, 1, 1,
0.927491, 0.5751338, 0.4538636, 1, 1, 1, 1, 1,
0.9291666, 0.05687284, 1.239765, 1, 1, 1, 1, 1,
0.9294912, 0.08708281, 3.204153, 1, 1, 1, 1, 1,
0.9376321, -0.09826928, 1.177257, 1, 1, 1, 1, 1,
0.9391065, 0.5456591, 1.499182, 1, 1, 1, 1, 1,
0.9483534, 1.07305, 1.2752, 1, 1, 1, 1, 1,
0.952924, 0.1174878, 2.426157, 1, 1, 1, 1, 1,
0.9533759, 2.590233, -0.3074074, 1, 1, 1, 1, 1,
0.9540019, -0.8517479, 3.295521, 1, 1, 1, 1, 1,
0.9568691, -0.6775255, 2.133657, 0, 0, 1, 1, 1,
0.9583687, -0.9777545, 1.826244, 1, 0, 0, 1, 1,
0.9601067, 1.265114, 0.6145863, 1, 0, 0, 1, 1,
0.9605297, -1.725048, 3.068811, 1, 0, 0, 1, 1,
0.9625064, -0.08798614, 0.7011965, 1, 0, 0, 1, 1,
0.9633172, -1.635382, 3.06602, 1, 0, 0, 1, 1,
0.9641463, 0.4220768, 0.8704777, 0, 0, 0, 1, 1,
0.9668802, 1.252015, 0.08256159, 0, 0, 0, 1, 1,
0.9754616, -1.821722, 2.418743, 0, 0, 0, 1, 1,
0.9781787, -1.257481, 2.648844, 0, 0, 0, 1, 1,
0.9823357, 0.7228048, 1.728441, 0, 0, 0, 1, 1,
0.9846399, 0.4832282, 1.147148, 0, 0, 0, 1, 1,
0.9887466, -0.8970306, 2.588323, 0, 0, 0, 1, 1,
0.9897566, 0.4596688, 1.418524, 1, 1, 1, 1, 1,
0.9903281, 0.1570079, 1.489491, 1, 1, 1, 1, 1,
0.9908789, 0.2843378, 2.336517, 1, 1, 1, 1, 1,
1.001829, -0.3830459, 0.5246012, 1, 1, 1, 1, 1,
1.002042, -1.520989, 3.528682, 1, 1, 1, 1, 1,
1.003555, -0.2872452, 1.251314, 1, 1, 1, 1, 1,
1.004964, -1.038804, 1.702295, 1, 1, 1, 1, 1,
1.009032, -1.586605, 2.09301, 1, 1, 1, 1, 1,
1.009629, 1.754394, 0.5439973, 1, 1, 1, 1, 1,
1.016398, -0.808916, 0.7082066, 1, 1, 1, 1, 1,
1.020211, -0.3473716, 2.429365, 1, 1, 1, 1, 1,
1.030244, 0.3642069, 3.189635, 1, 1, 1, 1, 1,
1.033148, -0.06409724, 0.878626, 1, 1, 1, 1, 1,
1.037319, 1.00547, 0.239623, 1, 1, 1, 1, 1,
1.038048, -0.5703015, 2.475006, 1, 1, 1, 1, 1,
1.042735, -1.170588, 1.703761, 0, 0, 1, 1, 1,
1.043777, -1.648176, 3.878504, 1, 0, 0, 1, 1,
1.052881, -1.076329, 3.5427, 1, 0, 0, 1, 1,
1.064054, -1.918077, 1.304991, 1, 0, 0, 1, 1,
1.068486, 0.3070255, 3.140266, 1, 0, 0, 1, 1,
1.071355, -0.65896, 1.193168, 1, 0, 0, 1, 1,
1.074087, -0.5601124, 2.342815, 0, 0, 0, 1, 1,
1.076317, -0.8426539, 2.88763, 0, 0, 0, 1, 1,
1.080483, -0.2287727, 2.52813, 0, 0, 0, 1, 1,
1.083835, -1.1795, 1.254488, 0, 0, 0, 1, 1,
1.087155, 0.6705458, 2.182032, 0, 0, 0, 1, 1,
1.094975, -1.001179, 3.081466, 0, 0, 0, 1, 1,
1.103062, 0.6440464, 1.868773, 0, 0, 0, 1, 1,
1.108338, 2.076917, 3.100975, 1, 1, 1, 1, 1,
1.115524, -1.137536, 0.8995226, 1, 1, 1, 1, 1,
1.11561, 0.5432043, 0.9572518, 1, 1, 1, 1, 1,
1.118289, 0.1334395, 0.3085396, 1, 1, 1, 1, 1,
1.11996, 2.480657, 0.1963068, 1, 1, 1, 1, 1,
1.121728, -1.2222, 3.843522, 1, 1, 1, 1, 1,
1.125125, -0.2318135, 2.196711, 1, 1, 1, 1, 1,
1.133025, 1.837747, -1.606431, 1, 1, 1, 1, 1,
1.133879, -1.073348, 0.9227154, 1, 1, 1, 1, 1,
1.134101, 0.04598062, 2.605796, 1, 1, 1, 1, 1,
1.136104, 0.02952127, 1.535205, 1, 1, 1, 1, 1,
1.145402, 0.5591847, -0.9112549, 1, 1, 1, 1, 1,
1.152272, -0.1091018, 1.689859, 1, 1, 1, 1, 1,
1.161754, -1.431992, 3.07532, 1, 1, 1, 1, 1,
1.164497, 0.2045294, -0.521405, 1, 1, 1, 1, 1,
1.171718, -0.7424742, 2.589954, 0, 0, 1, 1, 1,
1.172186, 0.3526979, 3.645348, 1, 0, 0, 1, 1,
1.173584, 0.7739735, 2.562642, 1, 0, 0, 1, 1,
1.180928, 1.278356, 1.792406, 1, 0, 0, 1, 1,
1.18191, -1.235753, 0.6280734, 1, 0, 0, 1, 1,
1.183092, 0.2539656, 0.7689573, 1, 0, 0, 1, 1,
1.188303, 0.3825513, 1.89384, 0, 0, 0, 1, 1,
1.189197, -1.464312, 3.519327, 0, 0, 0, 1, 1,
1.19029, 0.9551331, -0.5624971, 0, 0, 0, 1, 1,
1.190781, 0.2616795, 1.696108, 0, 0, 0, 1, 1,
1.198199, 0.6711, 1.088085, 0, 0, 0, 1, 1,
1.205376, 0.6515085, 3.040846, 0, 0, 0, 1, 1,
1.212964, -0.4733757, 0.5923066, 0, 0, 0, 1, 1,
1.224163, 0.3376376, 2.126394, 1, 1, 1, 1, 1,
1.225915, 1.942988, 0.8542178, 1, 1, 1, 1, 1,
1.227871, -1.603116, 2.967117, 1, 1, 1, 1, 1,
1.23038, 0.1474588, -0.1384448, 1, 1, 1, 1, 1,
1.236391, -0.1282046, 0.9558941, 1, 1, 1, 1, 1,
1.238453, 0.8404065, 0.1897408, 1, 1, 1, 1, 1,
1.243147, 0.3794665, 1.601882, 1, 1, 1, 1, 1,
1.246313, -2.364347, 2.698319, 1, 1, 1, 1, 1,
1.252434, -1.894538, 3.468421, 1, 1, 1, 1, 1,
1.25814, -0.7126819, 0.7631894, 1, 1, 1, 1, 1,
1.260601, 0.9384682, 1.302477, 1, 1, 1, 1, 1,
1.262868, -0.5940941, 2.508338, 1, 1, 1, 1, 1,
1.269012, -1.131669, 3.609134, 1, 1, 1, 1, 1,
1.278469, -1.937886, 1.102405, 1, 1, 1, 1, 1,
1.286443, -0.2491524, 1.464276, 1, 1, 1, 1, 1,
1.287, 0.03777223, 1.115163, 0, 0, 1, 1, 1,
1.287232, -0.3279989, 1.237003, 1, 0, 0, 1, 1,
1.288477, -1.345375, 3.066867, 1, 0, 0, 1, 1,
1.289197, 1.03461, 1.091386, 1, 0, 0, 1, 1,
1.289535, -0.06372972, 0.7533458, 1, 0, 0, 1, 1,
1.294206, 0.8106278, 0.3419664, 1, 0, 0, 1, 1,
1.296895, 0.2631791, 1.380095, 0, 0, 0, 1, 1,
1.305961, 1.702726, -0.661992, 0, 0, 0, 1, 1,
1.324547, 1.058501, 1.85152, 0, 0, 0, 1, 1,
1.338188, 0.4223856, 0.5162029, 0, 0, 0, 1, 1,
1.350046, -1.51947, 0.845955, 0, 0, 0, 1, 1,
1.353989, -0.8342126, 1.827692, 0, 0, 0, 1, 1,
1.377602, -0.9896837, 0.3879226, 0, 0, 0, 1, 1,
1.380522, -0.3132744, 1.722004, 1, 1, 1, 1, 1,
1.386774, 1.503447, 0.7997794, 1, 1, 1, 1, 1,
1.397114, 0.09533134, 2.48433, 1, 1, 1, 1, 1,
1.405235, -0.04362933, 2.288651, 1, 1, 1, 1, 1,
1.410375, 0.8267554, 2.088098, 1, 1, 1, 1, 1,
1.41197, -2.089527, 0.3323244, 1, 1, 1, 1, 1,
1.412586, -0.2233597, 1.545396, 1, 1, 1, 1, 1,
1.451962, 1.552042, 1.302145, 1, 1, 1, 1, 1,
1.46104, 0.2012233, 1.997307, 1, 1, 1, 1, 1,
1.465434, 0.4073681, 3.530281, 1, 1, 1, 1, 1,
1.478054, -0.9205056, 2.521584, 1, 1, 1, 1, 1,
1.489231, -0.3113813, 2.747972, 1, 1, 1, 1, 1,
1.491228, -2.096592, 2.632887, 1, 1, 1, 1, 1,
1.508603, 0.4601654, 0.5652274, 1, 1, 1, 1, 1,
1.524456, -1.804943, 1.489199, 1, 1, 1, 1, 1,
1.539761, -0.1412163, 1.567432, 0, 0, 1, 1, 1,
1.541353, -0.9185145, 2.354867, 1, 0, 0, 1, 1,
1.574205, -0.1613697, 2.117028, 1, 0, 0, 1, 1,
1.5768, 1.362133, 0.3802797, 1, 0, 0, 1, 1,
1.583607, -1.506528, 2.226639, 1, 0, 0, 1, 1,
1.587175, 1.176293, 2.005409, 1, 0, 0, 1, 1,
1.595427, 1.141559, 1.177373, 0, 0, 0, 1, 1,
1.596158, 0.1988121, 0.4601214, 0, 0, 0, 1, 1,
1.600622, -0.4742972, 1.864023, 0, 0, 0, 1, 1,
1.60657, -1.558104, 1.781153, 0, 0, 0, 1, 1,
1.607252, 2.074348, 1.340972, 0, 0, 0, 1, 1,
1.607346, -0.5328386, 1.311535, 0, 0, 0, 1, 1,
1.614203, -2.150239, 2.5274, 0, 0, 0, 1, 1,
1.619961, 0.3382246, 1.005001, 1, 1, 1, 1, 1,
1.627684, 0.1147925, 2.146686, 1, 1, 1, 1, 1,
1.662102, -1.177184, 1.772651, 1, 1, 1, 1, 1,
1.664618, 0.3590208, 1.434108, 1, 1, 1, 1, 1,
1.669172, 1.442302, 2.349259, 1, 1, 1, 1, 1,
1.685509, -0.008898002, 0.086933, 1, 1, 1, 1, 1,
1.695319, -0.2943754, 1.224519, 1, 1, 1, 1, 1,
1.704311, 0.1563641, 2.943379, 1, 1, 1, 1, 1,
1.718345, -0.1151563, 3.064501, 1, 1, 1, 1, 1,
1.73184, -0.3010417, 1.844118, 1, 1, 1, 1, 1,
1.737552, 0.4321989, 0.007182439, 1, 1, 1, 1, 1,
1.750871, -0.2749282, 1.50452, 1, 1, 1, 1, 1,
1.755933, 0.2223019, 2.001707, 1, 1, 1, 1, 1,
1.757505, 0.125256, 1.917213, 1, 1, 1, 1, 1,
1.758311, -0.07265703, 2.753251, 1, 1, 1, 1, 1,
1.759359, 0.2290275, 0.915088, 0, 0, 1, 1, 1,
1.770036, 1.216444, 0.2518398, 1, 0, 0, 1, 1,
1.798712, 0.8426487, 1.891689, 1, 0, 0, 1, 1,
1.815954, 2.760377, -0.6805673, 1, 0, 0, 1, 1,
1.818627, -0.1692924, 1.067618, 1, 0, 0, 1, 1,
1.822997, -1.00568, 2.379117, 1, 0, 0, 1, 1,
1.825293, 0.06285033, 2.036662, 0, 0, 0, 1, 1,
1.831155, -0.03904964, 1.401307, 0, 0, 0, 1, 1,
1.844447, 0.9071004, 1.682142, 0, 0, 0, 1, 1,
1.84543, 0.2412108, 1.962885, 0, 0, 0, 1, 1,
1.846512, 0.6620937, 0.7509673, 0, 0, 0, 1, 1,
1.865858, 0.1715787, 0.7391714, 0, 0, 0, 1, 1,
1.866621, 2.267367, 0.2154911, 0, 0, 0, 1, 1,
1.89497, -0.5155542, 1.189646, 1, 1, 1, 1, 1,
1.901094, -0.1914802, 1.977071, 1, 1, 1, 1, 1,
1.90459, 0.7411517, 2.889791, 1, 1, 1, 1, 1,
1.90733, 1.126536, 1.649466, 1, 1, 1, 1, 1,
1.914311, 0.4147962, 1.553823, 1, 1, 1, 1, 1,
1.928878, -1.323281, 2.034708, 1, 1, 1, 1, 1,
1.954712, -1.247423, 2.067538, 1, 1, 1, 1, 1,
1.958028, -1.424888, 2.336799, 1, 1, 1, 1, 1,
1.959841, 0.9597071, 0.9681093, 1, 1, 1, 1, 1,
1.999026, -0.7668654, 2.61203, 1, 1, 1, 1, 1,
2.00945, -0.4674117, 2.365382, 1, 1, 1, 1, 1,
2.035943, -0.7450111, 2.675116, 1, 1, 1, 1, 1,
2.056031, -1.472925, 3.288833, 1, 1, 1, 1, 1,
2.064463, -0.6112942, 3.065088, 1, 1, 1, 1, 1,
2.131006, 0.1052324, 3.211029, 1, 1, 1, 1, 1,
2.144632, 1.556328, 2.067684, 0, 0, 1, 1, 1,
2.241349, 0.4087618, 1.755791, 1, 0, 0, 1, 1,
2.257905, 0.7372895, 0.9767983, 1, 0, 0, 1, 1,
2.285075, 0.8784221, 0.2914754, 1, 0, 0, 1, 1,
2.29084, 0.6095509, 1.18677, 1, 0, 0, 1, 1,
2.299783, -0.2820057, 0.6485288, 1, 0, 0, 1, 1,
2.320433, 1.196689, 1.094125, 0, 0, 0, 1, 1,
2.324295, -0.2425689, 1.491534, 0, 0, 0, 1, 1,
2.335213, -0.01164959, 0.7997391, 0, 0, 0, 1, 1,
2.336867, 0.005565214, 1.427989, 0, 0, 0, 1, 1,
2.340897, 0.3646206, 1.843267, 0, 0, 0, 1, 1,
2.357114, -0.09124874, 3.908132, 0, 0, 0, 1, 1,
2.425758, 0.3682919, 1.815656, 0, 0, 0, 1, 1,
2.483624, -0.8699, 2.213992, 1, 1, 1, 1, 1,
2.548709, 1.629212, -0.3925365, 1, 1, 1, 1, 1,
2.627985, -0.620541, 3.104127, 1, 1, 1, 1, 1,
2.649255, 0.09794544, 0.5021138, 1, 1, 1, 1, 1,
2.725468, 0.02842452, 1.12936, 1, 1, 1, 1, 1,
3.068722, -0.8724838, 3.131123, 1, 1, 1, 1, 1,
3.47386, 1.123921, 1.256077, 1, 1, 1, 1, 1
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
var radius = 9.954574;
var distance = 34.96502;
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
mvMatrix.translate( 0.009387016, 0.8383998, 0.07025003 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.96502);
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
