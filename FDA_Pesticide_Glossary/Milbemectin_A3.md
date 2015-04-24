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
-3.05235, -0.4739284, -1.09902, 1, 0, 0, 1,
-2.869162, 0.01339681, -2.554396, 1, 0.007843138, 0, 1,
-2.728504, -0.09576657, -1.78357, 1, 0.01176471, 0, 1,
-2.705791, -1.044598, -1.661764, 1, 0.01960784, 0, 1,
-2.602156, -1.102401, -3.268068, 1, 0.02352941, 0, 1,
-2.478318, 1.256682, -1.417627, 1, 0.03137255, 0, 1,
-2.446008, 0.2220046, -0.9938135, 1, 0.03529412, 0, 1,
-2.432527, -0.1745166, 0.5590835, 1, 0.04313726, 0, 1,
-2.422209, 0.8216563, -0.3063404, 1, 0.04705882, 0, 1,
-2.315788, 0.5506762, -0.5725341, 1, 0.05490196, 0, 1,
-2.301583, 0.2340954, -0.5299609, 1, 0.05882353, 0, 1,
-2.293723, -1.462047, -1.397131, 1, 0.06666667, 0, 1,
-2.264963, 0.5917605, -0.6621806, 1, 0.07058824, 0, 1,
-2.258808, -0.2796206, -1.419689, 1, 0.07843138, 0, 1,
-2.245042, -0.4603446, -2.818312, 1, 0.08235294, 0, 1,
-2.168314, -1.066596, -3.615071, 1, 0.09019608, 0, 1,
-2.151752, 0.282947, -2.455534, 1, 0.09411765, 0, 1,
-2.149221, -1.579759, -2.002484, 1, 0.1019608, 0, 1,
-2.14085, -0.5101265, -2.019022, 1, 0.1098039, 0, 1,
-2.136741, -0.9138776, -0.6762475, 1, 0.1137255, 0, 1,
-2.090548, 1.28234, -1.238311, 1, 0.1215686, 0, 1,
-2.087905, -0.8462104, -2.628289, 1, 0.1254902, 0, 1,
-2.059909, -0.4927398, -2.122212, 1, 0.1333333, 0, 1,
-2.059825, -0.3545834, -1.693393, 1, 0.1372549, 0, 1,
-2.059, -0.488095, -1.708493, 1, 0.145098, 0, 1,
-2.051369, 0.650728, -1.65148, 1, 0.1490196, 0, 1,
-2.03496, -1.322108, -3.039023, 1, 0.1568628, 0, 1,
-2.013823, 0.4356746, -1.6842, 1, 0.1607843, 0, 1,
-1.999703, -0.5255526, -2.510836, 1, 0.1686275, 0, 1,
-1.99948, -1.338503, -2.805486, 1, 0.172549, 0, 1,
-1.957935, -0.9772307, -3.020203, 1, 0.1803922, 0, 1,
-1.957551, 0.6471609, -0.8201283, 1, 0.1843137, 0, 1,
-1.871453, -0.1196517, -1.398018, 1, 0.1921569, 0, 1,
-1.860499, -0.31712, -0.6581323, 1, 0.1960784, 0, 1,
-1.854487, 2.409357, -1.765777, 1, 0.2039216, 0, 1,
-1.841384, 0.4544421, -0.5258898, 1, 0.2117647, 0, 1,
-1.808556, 0.2773314, -2.967174, 1, 0.2156863, 0, 1,
-1.790858, -1.861886, -0.5487762, 1, 0.2235294, 0, 1,
-1.779982, -0.7289368, -1.453245, 1, 0.227451, 0, 1,
-1.770026, 1.597808, 1.871874, 1, 0.2352941, 0, 1,
-1.767872, 0.4919933, -0.7242951, 1, 0.2392157, 0, 1,
-1.75803, -0.3320137, -1.935089, 1, 0.2470588, 0, 1,
-1.745384, -0.5551745, -2.481746, 1, 0.2509804, 0, 1,
-1.735733, 0.6305172, -1.605101, 1, 0.2588235, 0, 1,
-1.731213, 0.3417535, -0.1121957, 1, 0.2627451, 0, 1,
-1.700264, 0.448027, -0.9038818, 1, 0.2705882, 0, 1,
-1.694412, -1.210804, -0.7129587, 1, 0.2745098, 0, 1,
-1.691631, 0.6738657, 0.3971762, 1, 0.282353, 0, 1,
-1.688243, -0.9636609, -2.537918, 1, 0.2862745, 0, 1,
-1.687165, -0.2887031, -1.654564, 1, 0.2941177, 0, 1,
-1.667569, -1.888961, -3.37202, 1, 0.3019608, 0, 1,
-1.664513, 0.523307, 0.1832538, 1, 0.3058824, 0, 1,
-1.664233, 0.3241535, -1.954997, 1, 0.3137255, 0, 1,
-1.662901, 1.510899, -0.01002263, 1, 0.3176471, 0, 1,
-1.661544, -0.4752021, -2.956693, 1, 0.3254902, 0, 1,
-1.654644, 0.03224846, -2.87429, 1, 0.3294118, 0, 1,
-1.638233, -0.3675432, -3.497161, 1, 0.3372549, 0, 1,
-1.614588, 0.1956302, -2.723924, 1, 0.3411765, 0, 1,
-1.612235, 0.2898399, -0.6597165, 1, 0.3490196, 0, 1,
-1.611364, 1.885416, -1.167125, 1, 0.3529412, 0, 1,
-1.609733, -0.1269445, -2.671045, 1, 0.3607843, 0, 1,
-1.606169, 0.4430307, -2.203368, 1, 0.3647059, 0, 1,
-1.596914, -3.618487, -2.107978, 1, 0.372549, 0, 1,
-1.595028, -1.633105, -1.613904, 1, 0.3764706, 0, 1,
-1.590679, 1.283159, -0.5790908, 1, 0.3843137, 0, 1,
-1.579079, -0.8300486, -1.855616, 1, 0.3882353, 0, 1,
-1.575128, 1.521567, -1.200947, 1, 0.3960784, 0, 1,
-1.568622, -0.1602529, -2.295346, 1, 0.4039216, 0, 1,
-1.566288, 0.6886603, -0.8132451, 1, 0.4078431, 0, 1,
-1.554687, -1.014709, -1.776012, 1, 0.4156863, 0, 1,
-1.54615, -1.122478, -1.887925, 1, 0.4196078, 0, 1,
-1.543432, 0.5178753, -1.920957, 1, 0.427451, 0, 1,
-1.542638, -0.6374136, -3.200913, 1, 0.4313726, 0, 1,
-1.541639, -0.9976535, -3.401619, 1, 0.4392157, 0, 1,
-1.532409, 2.108368, -1.725715, 1, 0.4431373, 0, 1,
-1.53101, 0.6056907, -0.6668516, 1, 0.4509804, 0, 1,
-1.527365, -1.751084, -3.508628, 1, 0.454902, 0, 1,
-1.524685, -0.08396062, -0.8505467, 1, 0.4627451, 0, 1,
-1.510402, 1.981172, -0.1313579, 1, 0.4666667, 0, 1,
-1.510219, 1.285716, -0.1853219, 1, 0.4745098, 0, 1,
-1.500756, 1.16011, -0.9637625, 1, 0.4784314, 0, 1,
-1.493704, 2.937854, 0.2250175, 1, 0.4862745, 0, 1,
-1.480344, -0.2197644, -2.687893, 1, 0.4901961, 0, 1,
-1.477044, 1.32022, 0.58169, 1, 0.4980392, 0, 1,
-1.468703, -0.267615, -3.251856, 1, 0.5058824, 0, 1,
-1.462695, -0.7669317, -1.898065, 1, 0.509804, 0, 1,
-1.462324, -2.4305, -1.900864, 1, 0.5176471, 0, 1,
-1.461461, 2.553763, -0.7601614, 1, 0.5215687, 0, 1,
-1.431251, 0.1613642, -1.724789, 1, 0.5294118, 0, 1,
-1.428576, 0.3011749, -1.396733, 1, 0.5333334, 0, 1,
-1.423386, 0.07203968, 0.4669724, 1, 0.5411765, 0, 1,
-1.392492, 0.6393842, -2.249247, 1, 0.5450981, 0, 1,
-1.392152, -0.1864101, -1.930231, 1, 0.5529412, 0, 1,
-1.374964, -0.7166349, -3.14363, 1, 0.5568628, 0, 1,
-1.369277, 0.2165562, -1.857593, 1, 0.5647059, 0, 1,
-1.368464, -0.3034906, -0.2105964, 1, 0.5686275, 0, 1,
-1.366616, -2.183825, -2.874394, 1, 0.5764706, 0, 1,
-1.363645, -0.07760555, -0.1140132, 1, 0.5803922, 0, 1,
-1.358892, -0.04473403, -2.542874, 1, 0.5882353, 0, 1,
-1.357259, -0.9684073, -1.589341, 1, 0.5921569, 0, 1,
-1.350131, -0.1562046, -1.857385, 1, 0.6, 0, 1,
-1.347314, -0.8052128, -3.671553, 1, 0.6078432, 0, 1,
-1.339362, -0.4857651, -0.6188235, 1, 0.6117647, 0, 1,
-1.333386, -0.0558998, -2.461334, 1, 0.6196079, 0, 1,
-1.317783, 0.5364802, -1.586873, 1, 0.6235294, 0, 1,
-1.313601, -0.8690394, -2.882244, 1, 0.6313726, 0, 1,
-1.308835, 0.2609845, -0.05464156, 1, 0.6352941, 0, 1,
-1.295647, 0.1543789, -0.5115779, 1, 0.6431373, 0, 1,
-1.293393, -0.2853514, 0.1442622, 1, 0.6470588, 0, 1,
-1.288644, 0.3272147, 0.7197515, 1, 0.654902, 0, 1,
-1.285545, 0.5680414, 0.6092559, 1, 0.6588235, 0, 1,
-1.284026, 0.6455668, -0.5849326, 1, 0.6666667, 0, 1,
-1.280205, -2.027564, -2.330017, 1, 0.6705883, 0, 1,
-1.272568, 0.6316229, -0.883982, 1, 0.6784314, 0, 1,
-1.261255, 0.7695788, -1.982033, 1, 0.682353, 0, 1,
-1.258227, 1.042639, -1.709261, 1, 0.6901961, 0, 1,
-1.255756, -0.9636694, -2.697495, 1, 0.6941177, 0, 1,
-1.255674, -0.6292681, -2.009666, 1, 0.7019608, 0, 1,
-1.255225, -1.136259, -3.023937, 1, 0.7098039, 0, 1,
-1.252495, -0.8377609, -3.740824, 1, 0.7137255, 0, 1,
-1.252248, 1.787542, -2.180542, 1, 0.7215686, 0, 1,
-1.242598, -0.4504124, -1.608166, 1, 0.7254902, 0, 1,
-1.237085, -0.02503065, -2.47212, 1, 0.7333333, 0, 1,
-1.205657, -0.2764789, -3.206772, 1, 0.7372549, 0, 1,
-1.198967, 0.3095739, -4.195653, 1, 0.7450981, 0, 1,
-1.195652, 0.7731666, 1.089007, 1, 0.7490196, 0, 1,
-1.192654, -0.9809921, -2.719852, 1, 0.7568628, 0, 1,
-1.190502, 1.281599, -0.3451068, 1, 0.7607843, 0, 1,
-1.187703, -0.7679158, -3.725585, 1, 0.7686275, 0, 1,
-1.185127, 1.456691, -1.494314, 1, 0.772549, 0, 1,
-1.179574, 0.004345705, -2.594935, 1, 0.7803922, 0, 1,
-1.17633, 0.264488, -0.8449423, 1, 0.7843137, 0, 1,
-1.171677, 0.2632781, -0.6947585, 1, 0.7921569, 0, 1,
-1.167482, 0.1661649, -1.380522, 1, 0.7960784, 0, 1,
-1.165235, -0.1451372, -1.790848, 1, 0.8039216, 0, 1,
-1.153451, 1.28551, -2.705326, 1, 0.8117647, 0, 1,
-1.150511, 0.04595148, -1.091826, 1, 0.8156863, 0, 1,
-1.145234, -1.869741, -2.728499, 1, 0.8235294, 0, 1,
-1.13964, -0.5824991, -1.053425, 1, 0.827451, 0, 1,
-1.139389, 1.620211, -0.3297532, 1, 0.8352941, 0, 1,
-1.137359, 1.212907, -0.8035508, 1, 0.8392157, 0, 1,
-1.134064, -0.1013544, 0.9573479, 1, 0.8470588, 0, 1,
-1.133291, 1.456585, 0.07126069, 1, 0.8509804, 0, 1,
-1.129539, -0.06005631, -0.385623, 1, 0.8588235, 0, 1,
-1.127016, 0.5995374, -1.087177, 1, 0.8627451, 0, 1,
-1.123643, 0.5614775, 0.7184299, 1, 0.8705882, 0, 1,
-1.119684, 1.225371, -0.6751649, 1, 0.8745098, 0, 1,
-1.106345, -0.7964007, -4.314075, 1, 0.8823529, 0, 1,
-1.099572, 2.432683, -0.01725499, 1, 0.8862745, 0, 1,
-1.099181, 0.7906885, -3.354651, 1, 0.8941177, 0, 1,
-1.094269, 0.949458, 0.3753774, 1, 0.8980392, 0, 1,
-1.093562, -0.2447229, 0.9316295, 1, 0.9058824, 0, 1,
-1.092049, -1.901673, -4.464885, 1, 0.9137255, 0, 1,
-1.0848, -0.4125205, -1.451516, 1, 0.9176471, 0, 1,
-1.082735, 0.1762529, -2.082059, 1, 0.9254902, 0, 1,
-1.08192, 1.000871, -2.007717, 1, 0.9294118, 0, 1,
-1.079242, -0.2012888, -2.097655, 1, 0.9372549, 0, 1,
-1.073194, 0.8409755, -2.32548, 1, 0.9411765, 0, 1,
-1.070222, -0.2072896, -1.706831, 1, 0.9490196, 0, 1,
-1.06941, 1.075853, -1.353425, 1, 0.9529412, 0, 1,
-1.068981, 0.5571582, -1.881412, 1, 0.9607843, 0, 1,
-1.068756, 1.94557, -1.563052, 1, 0.9647059, 0, 1,
-1.063762, -1.589222, -2.333336, 1, 0.972549, 0, 1,
-1.062533, -0.8484003, -2.372114, 1, 0.9764706, 0, 1,
-1.055166, -1.090592, -2.352011, 1, 0.9843137, 0, 1,
-1.049458, -1.4811, -3.058687, 1, 0.9882353, 0, 1,
-1.045157, -0.007807307, -0.3797869, 1, 0.9960784, 0, 1,
-1.043234, -0.7400228, -2.319314, 0.9960784, 1, 0, 1,
-1.036783, 0.8498772, 0.1882202, 0.9921569, 1, 0, 1,
-1.033621, 1.369404, -1.460432, 0.9843137, 1, 0, 1,
-1.029945, -0.805804, -2.854179, 0.9803922, 1, 0, 1,
-1.027287, -1.938949, -4.201622, 0.972549, 1, 0, 1,
-1.025001, -0.6320961, -3.101512, 0.9686275, 1, 0, 1,
-1.017799, -0.8641173, -2.825922, 0.9607843, 1, 0, 1,
-1.016993, 0.7812553, -0.1814807, 0.9568627, 1, 0, 1,
-1.014099, 1.074939, -0.7159087, 0.9490196, 1, 0, 1,
-1.004315, -0.467367, -1.060317, 0.945098, 1, 0, 1,
-0.9987732, 0.1050951, -2.023643, 0.9372549, 1, 0, 1,
-0.996689, -0.6195462, -3.170744, 0.9333333, 1, 0, 1,
-0.9953488, -0.2170503, -4.303138, 0.9254902, 1, 0, 1,
-0.9942614, 0.8332817, -1.415683, 0.9215686, 1, 0, 1,
-0.9925687, 0.8520203, -0.1764455, 0.9137255, 1, 0, 1,
-0.9893305, 0.9768093, -1.444212, 0.9098039, 1, 0, 1,
-0.9769335, -1.551748, -2.927954, 0.9019608, 1, 0, 1,
-0.9744983, -1.194923, -3.280066, 0.8941177, 1, 0, 1,
-0.9698554, 0.09168459, -1.631211, 0.8901961, 1, 0, 1,
-0.9664377, 0.3293005, -3.050884, 0.8823529, 1, 0, 1,
-0.9590699, 1.410397, -1.035022, 0.8784314, 1, 0, 1,
-0.9535041, 1.307606, -0.199777, 0.8705882, 1, 0, 1,
-0.9463813, 0.6097888, -0.9354568, 0.8666667, 1, 0, 1,
-0.9451466, 0.9303544, 0.2135938, 0.8588235, 1, 0, 1,
-0.9324906, 1.081364, -0.9103616, 0.854902, 1, 0, 1,
-0.9311554, 0.4614536, -0.07542641, 0.8470588, 1, 0, 1,
-0.9284452, -0.6409971, -1.843617, 0.8431373, 1, 0, 1,
-0.9255282, -0.4411775, -2.486403, 0.8352941, 1, 0, 1,
-0.9229178, -0.7519031, -2.172899, 0.8313726, 1, 0, 1,
-0.9203863, -1.196595, -3.191266, 0.8235294, 1, 0, 1,
-0.9169092, 0.3072534, 0.7632791, 0.8196079, 1, 0, 1,
-0.9140632, 0.5128002, -3.091364, 0.8117647, 1, 0, 1,
-0.9098209, 0.1364142, -1.57372, 0.8078431, 1, 0, 1,
-0.9034957, 0.39639, -0.9843655, 0.8, 1, 0, 1,
-0.901924, -0.2493661, -1.927632, 0.7921569, 1, 0, 1,
-0.9015817, 2.025717, -1.883554, 0.7882353, 1, 0, 1,
-0.8798465, -0.002865701, -1.466756, 0.7803922, 1, 0, 1,
-0.8781387, -0.1035568, -2.848982, 0.7764706, 1, 0, 1,
-0.8778205, 0.7135684, -0.05145255, 0.7686275, 1, 0, 1,
-0.8683512, -0.7068519, -4.300878, 0.7647059, 1, 0, 1,
-0.8664813, 0.7333955, -1.760833, 0.7568628, 1, 0, 1,
-0.8616868, 0.04225734, 0.1312544, 0.7529412, 1, 0, 1,
-0.8596163, 0.9933231, -0.2868153, 0.7450981, 1, 0, 1,
-0.8511716, -0.5617496, -2.104213, 0.7411765, 1, 0, 1,
-0.8479692, 0.08046269, -0.7105519, 0.7333333, 1, 0, 1,
-0.8454205, 0.259564, -2.021639, 0.7294118, 1, 0, 1,
-0.843001, -0.2773661, -2.132067, 0.7215686, 1, 0, 1,
-0.8371147, -0.9926069, -1.641328, 0.7176471, 1, 0, 1,
-0.827978, 0.2865684, -0.1592366, 0.7098039, 1, 0, 1,
-0.8255782, 1.131205, -1.091009, 0.7058824, 1, 0, 1,
-0.8245523, 0.2077114, -0.275282, 0.6980392, 1, 0, 1,
-0.8200473, -0.3242727, -2.272004, 0.6901961, 1, 0, 1,
-0.8183083, 1.174717, 0.1354239, 0.6862745, 1, 0, 1,
-0.8141863, -0.01593513, -2.233642, 0.6784314, 1, 0, 1,
-0.807343, -0.4041469, -2.65316, 0.6745098, 1, 0, 1,
-0.7884682, 0.6660488, -1.14587, 0.6666667, 1, 0, 1,
-0.7854092, -0.4750587, -2.769427, 0.6627451, 1, 0, 1,
-0.7825722, 1.462107, -0.755586, 0.654902, 1, 0, 1,
-0.7793239, 2.629759, 1.145273, 0.6509804, 1, 0, 1,
-0.7693891, -0.720278, -4.269231, 0.6431373, 1, 0, 1,
-0.7688994, 1.321686, 0.7933574, 0.6392157, 1, 0, 1,
-0.7656804, -0.4796908, -2.610281, 0.6313726, 1, 0, 1,
-0.762018, -0.3622767, -3.908408, 0.627451, 1, 0, 1,
-0.7618179, -1.104525, -3.576215, 0.6196079, 1, 0, 1,
-0.7608292, -1.810607, -2.621212, 0.6156863, 1, 0, 1,
-0.7605913, 0.7012911, -1.703515, 0.6078432, 1, 0, 1,
-0.7576678, -1.721342, -2.453707, 0.6039216, 1, 0, 1,
-0.7568123, 0.01798813, -1.089754, 0.5960785, 1, 0, 1,
-0.7556149, 0.2408825, -1.887429, 0.5882353, 1, 0, 1,
-0.7512124, -0.8719268, -2.793505, 0.5843138, 1, 0, 1,
-0.7434616, -0.4245102, -2.813023, 0.5764706, 1, 0, 1,
-0.7389724, 0.01661137, -2.105552, 0.572549, 1, 0, 1,
-0.7353101, -0.2051708, -1.235958, 0.5647059, 1, 0, 1,
-0.7346429, -1.611157, -1.948724, 0.5607843, 1, 0, 1,
-0.7343593, -0.9942157, -2.235897, 0.5529412, 1, 0, 1,
-0.7308469, 3.20319, -1.178463, 0.5490196, 1, 0, 1,
-0.7269896, -1.134043, -2.385539, 0.5411765, 1, 0, 1,
-0.7231032, 1.039444, 0.6670563, 0.5372549, 1, 0, 1,
-0.7211807, -1.015846, -2.35748, 0.5294118, 1, 0, 1,
-0.7183242, 2.533629, -0.6051848, 0.5254902, 1, 0, 1,
-0.7154424, 1.251295, -0.1465807, 0.5176471, 1, 0, 1,
-0.713281, -0.7183778, -2.809368, 0.5137255, 1, 0, 1,
-0.7116899, -0.5551614, -2.694808, 0.5058824, 1, 0, 1,
-0.7086712, 1.252239, -0.3877516, 0.5019608, 1, 0, 1,
-0.7041994, 0.1673336, -1.423806, 0.4941176, 1, 0, 1,
-0.7029286, -0.07021052, -1.934105, 0.4862745, 1, 0, 1,
-0.6938679, -0.3309473, -2.936662, 0.4823529, 1, 0, 1,
-0.6883083, 0.9275652, -1.077559, 0.4745098, 1, 0, 1,
-0.6831881, -1.956569, -2.545339, 0.4705882, 1, 0, 1,
-0.6738961, -1.491717, -2.593654, 0.4627451, 1, 0, 1,
-0.6685854, 2.020756, -0.2275357, 0.4588235, 1, 0, 1,
-0.6670218, -0.1499038, -2.030284, 0.4509804, 1, 0, 1,
-0.6660184, -0.3680792, -0.6580797, 0.4470588, 1, 0, 1,
-0.6630061, -1.678028, -0.9064955, 0.4392157, 1, 0, 1,
-0.6578956, -0.8697417, -3.025009, 0.4352941, 1, 0, 1,
-0.6563094, -1.139068, -2.552579, 0.427451, 1, 0, 1,
-0.6527127, 1.491234, 0.4105257, 0.4235294, 1, 0, 1,
-0.6392788, 0.3618001, -1.549946, 0.4156863, 1, 0, 1,
-0.6389149, -0.4826393, -2.206819, 0.4117647, 1, 0, 1,
-0.6377074, 0.201673, -0.3173743, 0.4039216, 1, 0, 1,
-0.6354743, 1.037891, 0.7493451, 0.3960784, 1, 0, 1,
-0.6276127, -0.5426956, -1.203637, 0.3921569, 1, 0, 1,
-0.6265073, -0.2476357, -0.7918891, 0.3843137, 1, 0, 1,
-0.6256089, 1.113718, -0.6417612, 0.3803922, 1, 0, 1,
-0.6253384, -0.5765272, -1.770479, 0.372549, 1, 0, 1,
-0.623464, 1.390742, -0.729686, 0.3686275, 1, 0, 1,
-0.6192902, -1.64948, -1.326383, 0.3607843, 1, 0, 1,
-0.618379, 0.6812731, -0.8603188, 0.3568628, 1, 0, 1,
-0.6181839, 0.2077027, -2.795632, 0.3490196, 1, 0, 1,
-0.6138382, 0.9419973, 0.8462557, 0.345098, 1, 0, 1,
-0.6104277, 0.5173473, -1.463806, 0.3372549, 1, 0, 1,
-0.6079637, -0.5163319, -1.649453, 0.3333333, 1, 0, 1,
-0.6068954, -0.1769231, -1.684811, 0.3254902, 1, 0, 1,
-0.6042341, -1.257445, -1.357363, 0.3215686, 1, 0, 1,
-0.6026253, -0.08088537, -1.349674, 0.3137255, 1, 0, 1,
-0.6018394, -0.5934078, -1.317839, 0.3098039, 1, 0, 1,
-0.5929002, -0.9697132, -0.7289125, 0.3019608, 1, 0, 1,
-0.5912735, -0.1741372, -0.5554931, 0.2941177, 1, 0, 1,
-0.5764681, -0.5891287, -1.212727, 0.2901961, 1, 0, 1,
-0.5756214, 0.8579676, -1.735046, 0.282353, 1, 0, 1,
-0.5748853, -0.7455791, -3.33474, 0.2784314, 1, 0, 1,
-0.5655737, 0.3732851, 0.4838329, 0.2705882, 1, 0, 1,
-0.5637013, -0.5597631, -2.055147, 0.2666667, 1, 0, 1,
-0.5603642, 0.8348018, -1.08657, 0.2588235, 1, 0, 1,
-0.5579744, 2.737612, -0.5169111, 0.254902, 1, 0, 1,
-0.5576573, 0.6923059, -0.6442908, 0.2470588, 1, 0, 1,
-0.5528904, 0.6618084, -1.462532, 0.2431373, 1, 0, 1,
-0.551263, 0.6994676, 0.03801225, 0.2352941, 1, 0, 1,
-0.5510234, 0.7280578, -3.25593, 0.2313726, 1, 0, 1,
-0.5490559, -1.013001, -1.303903, 0.2235294, 1, 0, 1,
-0.5474076, -0.05730729, -0.8937559, 0.2196078, 1, 0, 1,
-0.5431477, 1.145293, -0.9143971, 0.2117647, 1, 0, 1,
-0.5391348, 0.3481648, 0.01298976, 0.2078431, 1, 0, 1,
-0.5382303, -0.9599804, -2.200231, 0.2, 1, 0, 1,
-0.5368995, -0.2813468, -2.919585, 0.1921569, 1, 0, 1,
-0.5363827, 0.679545, -0.8590555, 0.1882353, 1, 0, 1,
-0.5209588, 1.332477, -1.474246, 0.1803922, 1, 0, 1,
-0.5206636, 1.20471, 0.8778487, 0.1764706, 1, 0, 1,
-0.5134164, -0.2033418, -1.503183, 0.1686275, 1, 0, 1,
-0.5130616, 1.097346, -0.8850106, 0.1647059, 1, 0, 1,
-0.5084446, -1.607564, -1.53979, 0.1568628, 1, 0, 1,
-0.505724, -1.470671, -1.683025, 0.1529412, 1, 0, 1,
-0.5056472, -1.553808, -3.118268, 0.145098, 1, 0, 1,
-0.4990887, -0.6731505, -2.810981, 0.1411765, 1, 0, 1,
-0.4978992, 0.2348304, -2.586309, 0.1333333, 1, 0, 1,
-0.4975859, 0.4807043, -1.486267, 0.1294118, 1, 0, 1,
-0.49753, -1.586884, -3.992727, 0.1215686, 1, 0, 1,
-0.4966907, -1.13604, -3.432632, 0.1176471, 1, 0, 1,
-0.4946957, -0.7243363, -1.467243, 0.1098039, 1, 0, 1,
-0.4915222, 0.3187498, -1.249605, 0.1058824, 1, 0, 1,
-0.4907581, 0.7215575, -2.775287, 0.09803922, 1, 0, 1,
-0.4872049, 0.2258258, -1.916404, 0.09019608, 1, 0, 1,
-0.4850371, -0.7504285, -3.216191, 0.08627451, 1, 0, 1,
-0.4826632, 0.4368111, 0.2380058, 0.07843138, 1, 0, 1,
-0.4826443, 1.82153, -1.080465, 0.07450981, 1, 0, 1,
-0.4818183, -2.624973, -1.918087, 0.06666667, 1, 0, 1,
-0.4669815, -1.908333, -2.255028, 0.0627451, 1, 0, 1,
-0.466215, -0.7610754, -2.773957, 0.05490196, 1, 0, 1,
-0.462056, 2.503405, -1.17677, 0.05098039, 1, 0, 1,
-0.4554491, -0.4484781, -2.174266, 0.04313726, 1, 0, 1,
-0.4499977, 1.082523, 0.4628138, 0.03921569, 1, 0, 1,
-0.4495731, 0.1923808, -0.3034286, 0.03137255, 1, 0, 1,
-0.4490979, 0.555372, -0.5185218, 0.02745098, 1, 0, 1,
-0.443614, -0.4766283, -4.583864, 0.01960784, 1, 0, 1,
-0.44004, 0.2153035, -0.6317063, 0.01568628, 1, 0, 1,
-0.4337105, 1.787886, 1.032182, 0.007843138, 1, 0, 1,
-0.4322467, 0.8036255, -0.02884438, 0.003921569, 1, 0, 1,
-0.4202392, 1.05184, -0.4128772, 0, 1, 0.003921569, 1,
-0.417431, -2.067172, -2.244416, 0, 1, 0.01176471, 1,
-0.4132727, 0.05922115, -1.601053, 0, 1, 0.01568628, 1,
-0.4103451, 0.3457954, -1.772559, 0, 1, 0.02352941, 1,
-0.4073426, -0.4031, -0.8594736, 0, 1, 0.02745098, 1,
-0.4073278, 0.6529839, -1.575843, 0, 1, 0.03529412, 1,
-0.4043862, -0.713664, -2.091544, 0, 1, 0.03921569, 1,
-0.4040436, -0.323146, -1.400038, 0, 1, 0.04705882, 1,
-0.4002546, 0.3234259, -2.808709, 0, 1, 0.05098039, 1,
-0.3989298, -1.639189, -2.356558, 0, 1, 0.05882353, 1,
-0.396924, -0.1822825, 0.03543564, 0, 1, 0.0627451, 1,
-0.3930052, -1.068772, -1.800977, 0, 1, 0.07058824, 1,
-0.3881706, 0.3192278, -1.657644, 0, 1, 0.07450981, 1,
-0.3877989, -1.572735, -3.370347, 0, 1, 0.08235294, 1,
-0.3783708, -2.557137, -3.805264, 0, 1, 0.08627451, 1,
-0.3776539, -0.5284925, -3.749125, 0, 1, 0.09411765, 1,
-0.3739889, 1.475338, -0.3615029, 0, 1, 0.1019608, 1,
-0.3717066, 1.438089, -1.064996, 0, 1, 0.1058824, 1,
-0.3710177, 0.3825702, 0.4453027, 0, 1, 0.1137255, 1,
-0.3708002, 1.071444, -1.374591, 0, 1, 0.1176471, 1,
-0.3702952, -0.6452553, -4.477719, 0, 1, 0.1254902, 1,
-0.3693736, -0.03955321, -1.997521, 0, 1, 0.1294118, 1,
-0.3630657, 0.4021858, -1.743474, 0, 1, 0.1372549, 1,
-0.357677, 0.6364005, -1.56007, 0, 1, 0.1411765, 1,
-0.3568748, 0.4121905, 0.04621774, 0, 1, 0.1490196, 1,
-0.3548706, -1.565679, -2.880792, 0, 1, 0.1529412, 1,
-0.3522378, 2.389562, 0.5441301, 0, 1, 0.1607843, 1,
-0.3417148, -0.192476, -2.198849, 0, 1, 0.1647059, 1,
-0.3407509, -0.2000764, -1.813732, 0, 1, 0.172549, 1,
-0.3394556, -0.59408, -1.40314, 0, 1, 0.1764706, 1,
-0.3377292, -0.09747357, -2.401524, 0, 1, 0.1843137, 1,
-0.3335891, 0.4704278, -0.0299599, 0, 1, 0.1882353, 1,
-0.3259777, -0.3720721, -1.83511, 0, 1, 0.1960784, 1,
-0.3241836, -0.4352494, -2.527975, 0, 1, 0.2039216, 1,
-0.3233432, 0.02297944, -3.079062, 0, 1, 0.2078431, 1,
-0.3220762, -0.358914, -2.153747, 0, 1, 0.2156863, 1,
-0.3215519, 1.212851, -1.20526, 0, 1, 0.2196078, 1,
-0.3193427, 1.83354, -0.5469142, 0, 1, 0.227451, 1,
-0.3130699, 0.1200797, -0.1444437, 0, 1, 0.2313726, 1,
-0.2975332, 1.130358, -0.3306938, 0, 1, 0.2392157, 1,
-0.2891648, -0.6890453, -1.848287, 0, 1, 0.2431373, 1,
-0.2889898, -0.6976716, -4.094835, 0, 1, 0.2509804, 1,
-0.286191, -1.113534, -2.750415, 0, 1, 0.254902, 1,
-0.2850311, -1.006142, -1.732207, 0, 1, 0.2627451, 1,
-0.2841706, -1.708472, -2.371711, 0, 1, 0.2666667, 1,
-0.283913, 1.190446, -0.5132951, 0, 1, 0.2745098, 1,
-0.2761844, -0.4424897, -2.581805, 0, 1, 0.2784314, 1,
-0.2746044, -1.419347, -3.300497, 0, 1, 0.2862745, 1,
-0.2709552, 0.5677513, 0.3982163, 0, 1, 0.2901961, 1,
-0.2693994, -0.1931338, -1.987316, 0, 1, 0.2980392, 1,
-0.2656936, -0.4856907, -0.845504, 0, 1, 0.3058824, 1,
-0.2628362, 1.857628, -0.6595846, 0, 1, 0.3098039, 1,
-0.2587946, 0.1255616, 0.5716349, 0, 1, 0.3176471, 1,
-0.2572866, 0.5515128, -1.349489, 0, 1, 0.3215686, 1,
-0.2544755, -1.20094, -3.256935, 0, 1, 0.3294118, 1,
-0.2533968, 0.446622, -1.263147, 0, 1, 0.3333333, 1,
-0.2533874, -1.130521, -1.722848, 0, 1, 0.3411765, 1,
-0.2486582, -0.829137, -2.045632, 0, 1, 0.345098, 1,
-0.248217, -0.4979663, -0.7886055, 0, 1, 0.3529412, 1,
-0.2474941, -0.4353307, -2.736135, 0, 1, 0.3568628, 1,
-0.2456064, -0.8431783, -3.185374, 0, 1, 0.3647059, 1,
-0.2449797, -1.114119, -3.124989, 0, 1, 0.3686275, 1,
-0.2423647, 0.3130201, 0.6717765, 0, 1, 0.3764706, 1,
-0.2409132, -1.13263, -0.5101136, 0, 1, 0.3803922, 1,
-0.2403388, -0.2883014, -2.786714, 0, 1, 0.3882353, 1,
-0.2389382, -1.898229, -2.935791, 0, 1, 0.3921569, 1,
-0.2374815, 0.6478227, -2.426167, 0, 1, 0.4, 1,
-0.2336576, 0.1284231, -0.705929, 0, 1, 0.4078431, 1,
-0.2312514, 0.878512, -1.554217, 0, 1, 0.4117647, 1,
-0.2274941, -2.001415, -3.112209, 0, 1, 0.4196078, 1,
-0.2268771, -0.01787338, -2.196754, 0, 1, 0.4235294, 1,
-0.2258221, 0.9229354, -0.3506162, 0, 1, 0.4313726, 1,
-0.2255507, -1.139131, -3.208346, 0, 1, 0.4352941, 1,
-0.2179512, -1.441253, -4.138415, 0, 1, 0.4431373, 1,
-0.2179271, -0.1373012, -3.097751, 0, 1, 0.4470588, 1,
-0.2174287, -0.2746969, -1.922504, 0, 1, 0.454902, 1,
-0.2156474, -3.010672, -1.994237, 0, 1, 0.4588235, 1,
-0.215332, 1.093343, 1.024228, 0, 1, 0.4666667, 1,
-0.2130713, -0.6272063, -1.43834, 0, 1, 0.4705882, 1,
-0.2123768, 0.9369825, -0.1008959, 0, 1, 0.4784314, 1,
-0.2103834, -1.10073, -1.61549, 0, 1, 0.4823529, 1,
-0.2057405, -0.3692965, -4.119943, 0, 1, 0.4901961, 1,
-0.1969023, 0.6096449, 1.162626, 0, 1, 0.4941176, 1,
-0.1916871, 0.2626699, 0.5525133, 0, 1, 0.5019608, 1,
-0.1896673, -0.808028, -1.999599, 0, 1, 0.509804, 1,
-0.1882917, 0.2298153, -1.28344, 0, 1, 0.5137255, 1,
-0.1881752, -1.168768, -3.649994, 0, 1, 0.5215687, 1,
-0.1806565, 0.8358458, -1.372815, 0, 1, 0.5254902, 1,
-0.1761502, -0.4374035, -2.357296, 0, 1, 0.5333334, 1,
-0.1736147, 0.2627544, 0.5343966, 0, 1, 0.5372549, 1,
-0.167242, 0.3738207, -0.05465547, 0, 1, 0.5450981, 1,
-0.1649434, -0.299627, -2.625784, 0, 1, 0.5490196, 1,
-0.1612927, 0.1680283, -1.796445, 0, 1, 0.5568628, 1,
-0.157292, -1.688626, -5.093442, 0, 1, 0.5607843, 1,
-0.1540632, -1.017439, -2.942389, 0, 1, 0.5686275, 1,
-0.1539443, -1.127476, -3.309914, 0, 1, 0.572549, 1,
-0.1536026, 0.0835124, -0.9324482, 0, 1, 0.5803922, 1,
-0.1532714, 0.0934381, -1.395759, 0, 1, 0.5843138, 1,
-0.1524078, 0.2189714, -0.4215473, 0, 1, 0.5921569, 1,
-0.1501096, 1.441815, -0.7454479, 0, 1, 0.5960785, 1,
-0.1500966, -0.05183565, -2.179942, 0, 1, 0.6039216, 1,
-0.1499633, 1.188616, 0.2270431, 0, 1, 0.6117647, 1,
-0.1487448, -0.3969699, -1.937517, 0, 1, 0.6156863, 1,
-0.1442636, 0.3420101, 1.470778, 0, 1, 0.6235294, 1,
-0.1436249, -0.4919414, -2.945215, 0, 1, 0.627451, 1,
-0.140945, 0.1527299, -1.468077, 0, 1, 0.6352941, 1,
-0.1391817, 0.9670826, -0.9453964, 0, 1, 0.6392157, 1,
-0.135511, -1.073416, -4.243623, 0, 1, 0.6470588, 1,
-0.129487, -2.149594, -2.364114, 0, 1, 0.6509804, 1,
-0.1245873, -1.124082, -3.605524, 0, 1, 0.6588235, 1,
-0.1226419, 0.5584531, -1.353488, 0, 1, 0.6627451, 1,
-0.1221213, 0.5290794, 1.313203, 0, 1, 0.6705883, 1,
-0.1132995, 0.8239847, -0.418678, 0, 1, 0.6745098, 1,
-0.1100041, 1.409249, 0.5549169, 0, 1, 0.682353, 1,
-0.1082613, -0.7150143, -3.99544, 0, 1, 0.6862745, 1,
-0.1034826, -0.7234792, -1.515652, 0, 1, 0.6941177, 1,
-0.1025736, -1.190651, -3.333842, 0, 1, 0.7019608, 1,
-0.09506609, 0.5471209, -2.506412, 0, 1, 0.7058824, 1,
-0.0931571, -1.861821, -4.131588, 0, 1, 0.7137255, 1,
-0.09083591, -1.415998, -4.182199, 0, 1, 0.7176471, 1,
-0.08629254, 1.181234, -0.4240994, 0, 1, 0.7254902, 1,
-0.0842101, 0.4099247, 0.9917525, 0, 1, 0.7294118, 1,
-0.07049046, -0.7330751, -2.156498, 0, 1, 0.7372549, 1,
-0.06986085, -0.9751027, -4.452911, 0, 1, 0.7411765, 1,
-0.06893583, -0.05110108, -1.105505, 0, 1, 0.7490196, 1,
-0.06819507, 0.9226728, -1.493384, 0, 1, 0.7529412, 1,
-0.0665495, 1.814687, 1.26028, 0, 1, 0.7607843, 1,
-0.06579646, -1.213513, -1.795251, 0, 1, 0.7647059, 1,
-0.0626945, -0.1649809, -3.331748, 0, 1, 0.772549, 1,
-0.06235476, -0.8934271, -3.686435, 0, 1, 0.7764706, 1,
-0.05821961, -0.2053208, -2.138673, 0, 1, 0.7843137, 1,
-0.05508205, -0.8309011, -2.898375, 0, 1, 0.7882353, 1,
-0.05223221, -0.6968295, -2.225734, 0, 1, 0.7960784, 1,
-0.05042353, 0.6488581, -1.239, 0, 1, 0.8039216, 1,
-0.04896319, 0.3313569, 0.5795858, 0, 1, 0.8078431, 1,
-0.0469777, -0.1356961, -1.771633, 0, 1, 0.8156863, 1,
-0.04674329, 1.403237, -0.2360922, 0, 1, 0.8196079, 1,
-0.04550912, -1.116659, -2.384001, 0, 1, 0.827451, 1,
-0.0440766, -0.04379197, -2.562089, 0, 1, 0.8313726, 1,
-0.04246742, 1.192364, -2.002825, 0, 1, 0.8392157, 1,
-0.04209206, -0.6514499, -4.558815, 0, 1, 0.8431373, 1,
-0.03665326, -1.006617, -1.73883, 0, 1, 0.8509804, 1,
-0.0344802, 1.830427, 1.601328, 0, 1, 0.854902, 1,
-0.03102843, 0.6277562, 0.8023399, 0, 1, 0.8627451, 1,
-0.03004232, 0.1850951, 0.3775408, 0, 1, 0.8666667, 1,
-0.02904373, -1.202049, -3.604731, 0, 1, 0.8745098, 1,
-0.02704646, 0.150972, 0.2988821, 0, 1, 0.8784314, 1,
-0.02598322, -0.7972937, -2.153198, 0, 1, 0.8862745, 1,
-0.02487523, 2.148256, -0.789164, 0, 1, 0.8901961, 1,
-0.02194702, 0.7765351, -0.2342469, 0, 1, 0.8980392, 1,
-0.02106068, -1.521867, -3.052978, 0, 1, 0.9058824, 1,
-0.006863053, -0.3385917, -2.869919, 0, 1, 0.9098039, 1,
-0.004997446, 0.6371806, -0.5931218, 0, 1, 0.9176471, 1,
-0.002440246, -0.4595717, -3.359582, 0, 1, 0.9215686, 1,
-0.0001620475, 0.4963954, -0.5493884, 0, 1, 0.9294118, 1,
0.0003026309, -0.01642183, 3.052392, 0, 1, 0.9333333, 1,
0.0008672323, 1.259635, -1.541145, 0, 1, 0.9411765, 1,
0.001810709, -1.438713, 4.187267, 0, 1, 0.945098, 1,
0.002548603, 1.262687, -0.2080441, 0, 1, 0.9529412, 1,
0.005386202, 0.3163965, -0.2301116, 0, 1, 0.9568627, 1,
0.005624434, 0.09062821, 0.4576588, 0, 1, 0.9647059, 1,
0.006481591, 0.4027736, -1.635776, 0, 1, 0.9686275, 1,
0.007384611, 0.4016654, 1.771774, 0, 1, 0.9764706, 1,
0.01321617, 1.95374, -0.1121521, 0, 1, 0.9803922, 1,
0.01401018, -0.9432459, 2.06313, 0, 1, 0.9882353, 1,
0.01420756, -0.2228895, 1.856252, 0, 1, 0.9921569, 1,
0.01608071, -1.38875, 3.280695, 0, 1, 1, 1,
0.0201264, -0.03901558, 3.797964, 0, 0.9921569, 1, 1,
0.02439321, -0.3008562, 2.545757, 0, 0.9882353, 1, 1,
0.03116206, -1.704959, 4.130167, 0, 0.9803922, 1, 1,
0.03141104, -1.739926, 2.342622, 0, 0.9764706, 1, 1,
0.03262228, -1.217549, 3.608781, 0, 0.9686275, 1, 1,
0.03306446, -0.6483576, 3.248729, 0, 0.9647059, 1, 1,
0.0349247, 0.6601676, 1.27915, 0, 0.9568627, 1, 1,
0.03793245, 0.2250835, 1.484159, 0, 0.9529412, 1, 1,
0.03999356, -0.3435123, 2.499917, 0, 0.945098, 1, 1,
0.04447436, 0.3274653, -0.2944816, 0, 0.9411765, 1, 1,
0.05351194, -0.2426283, 2.548594, 0, 0.9333333, 1, 1,
0.05820953, -1.530897, 3.28038, 0, 0.9294118, 1, 1,
0.06535398, 0.4746578, -0.964089, 0, 0.9215686, 1, 1,
0.06622824, -1.052475, 3.680915, 0, 0.9176471, 1, 1,
0.0665529, -0.04843154, 0.81477, 0, 0.9098039, 1, 1,
0.06761798, 0.2675331, 0.815444, 0, 0.9058824, 1, 1,
0.06905128, -0.6310343, 3.730707, 0, 0.8980392, 1, 1,
0.07011555, -0.008421467, 1.954661, 0, 0.8901961, 1, 1,
0.07127724, -0.2646607, 2.792515, 0, 0.8862745, 1, 1,
0.07168574, 0.2294302, -0.07219917, 0, 0.8784314, 1, 1,
0.07249512, -0.1012421, 3.424781, 0, 0.8745098, 1, 1,
0.07339162, -0.05345355, 2.737709, 0, 0.8666667, 1, 1,
0.079226, -0.01502407, 2.431583, 0, 0.8627451, 1, 1,
0.08175338, 0.6737493, -0.399693, 0, 0.854902, 1, 1,
0.08552372, -0.3513224, 2.347559, 0, 0.8509804, 1, 1,
0.09383734, -0.4604692, 2.334656, 0, 0.8431373, 1, 1,
0.1000452, -0.8477669, 1.154976, 0, 0.8392157, 1, 1,
0.1065888, -0.2250113, 2.6541, 0, 0.8313726, 1, 1,
0.1090637, -1.075386, 2.309532, 0, 0.827451, 1, 1,
0.1094215, 1.077814, -0.5718197, 0, 0.8196079, 1, 1,
0.1111121, -1.497527, 1.684519, 0, 0.8156863, 1, 1,
0.1118319, 0.5381199, -0.3004566, 0, 0.8078431, 1, 1,
0.112466, -0.85871, 0.902014, 0, 0.8039216, 1, 1,
0.1167666, -0.5595115, 2.486568, 0, 0.7960784, 1, 1,
0.1260877, 0.05014677, 1.0192, 0, 0.7882353, 1, 1,
0.1267318, 0.6325465, -0.4674048, 0, 0.7843137, 1, 1,
0.1310157, -0.3007281, 2.617148, 0, 0.7764706, 1, 1,
0.1337824, -1.545669, 3.277165, 0, 0.772549, 1, 1,
0.1389895, -1.564236, 1.555982, 0, 0.7647059, 1, 1,
0.1444292, -0.5079941, 1.356361, 0, 0.7607843, 1, 1,
0.1446005, -0.3547387, 4.143314, 0, 0.7529412, 1, 1,
0.1446241, 0.4097825, -0.9093812, 0, 0.7490196, 1, 1,
0.1456055, -1.853478, 3.424249, 0, 0.7411765, 1, 1,
0.1478998, 0.8209509, 2.319556, 0, 0.7372549, 1, 1,
0.1506978, -0.1312514, 2.769476, 0, 0.7294118, 1, 1,
0.1575679, -1.536768, 1.852044, 0, 0.7254902, 1, 1,
0.1618767, 1.047387, 1.416908, 0, 0.7176471, 1, 1,
0.1698087, 1.553131, 0.5550981, 0, 0.7137255, 1, 1,
0.1757161, 0.6965395, -2.026137, 0, 0.7058824, 1, 1,
0.1772847, -0.1956749, 3.469572, 0, 0.6980392, 1, 1,
0.1809357, 1.597529, -1.637305, 0, 0.6941177, 1, 1,
0.1857338, -0.9770607, 2.896786, 0, 0.6862745, 1, 1,
0.1902043, -0.2695649, 2.308353, 0, 0.682353, 1, 1,
0.1904754, 0.02611097, -0.2812577, 0, 0.6745098, 1, 1,
0.1920383, -0.2770522, 3.987336, 0, 0.6705883, 1, 1,
0.196306, 2.092233, 0.6780258, 0, 0.6627451, 1, 1,
0.1973414, -1.467713, 3.111126, 0, 0.6588235, 1, 1,
0.1981158, 0.5291387, -1.219273, 0, 0.6509804, 1, 1,
0.2064974, -0.9290045, 3.488041, 0, 0.6470588, 1, 1,
0.2067963, 0.1327319, 2.083591, 0, 0.6392157, 1, 1,
0.2073822, 0.04377002, -0.2214768, 0, 0.6352941, 1, 1,
0.2074575, -0.8483847, 2.110671, 0, 0.627451, 1, 1,
0.2081297, 0.2109918, 0.6188254, 0, 0.6235294, 1, 1,
0.2164024, 0.8229737, 1.922406, 0, 0.6156863, 1, 1,
0.2172339, -0.7034076, 1.893593, 0, 0.6117647, 1, 1,
0.2188258, -0.09751748, 1.414019, 0, 0.6039216, 1, 1,
0.2191833, 0.8224823, 1.851908, 0, 0.5960785, 1, 1,
0.2201558, 0.4265698, 0.995943, 0, 0.5921569, 1, 1,
0.2261083, 1.723577, 0.04191696, 0, 0.5843138, 1, 1,
0.2280075, -0.218368, 2.576445, 0, 0.5803922, 1, 1,
0.230671, 0.4984694, 1.184669, 0, 0.572549, 1, 1,
0.2361985, -1.065477, 3.540441, 0, 0.5686275, 1, 1,
0.2389549, -0.6231772, 2.303381, 0, 0.5607843, 1, 1,
0.2393301, -0.558937, 1.907727, 0, 0.5568628, 1, 1,
0.2399512, 1.180738, -0.25425, 0, 0.5490196, 1, 1,
0.2425813, 0.9118252, 0.4992945, 0, 0.5450981, 1, 1,
0.2426226, 0.5966303, -0.7487634, 0, 0.5372549, 1, 1,
0.2457789, 0.4284284, 3.768927, 0, 0.5333334, 1, 1,
0.2458285, -1.086254, 4.065376, 0, 0.5254902, 1, 1,
0.2495556, 0.4657215, -0.1512941, 0, 0.5215687, 1, 1,
0.2496941, -0.02112803, 1.256144, 0, 0.5137255, 1, 1,
0.2552853, 0.6809387, 1.143377, 0, 0.509804, 1, 1,
0.2682439, 1.183573, -0.8372473, 0, 0.5019608, 1, 1,
0.2687235, 1.275962, -0.6401621, 0, 0.4941176, 1, 1,
0.2716331, -1.087283, 2.091211, 0, 0.4901961, 1, 1,
0.2739158, -0.7106021, 4.698754, 0, 0.4823529, 1, 1,
0.2739425, 0.3444786, -1.259314, 0, 0.4784314, 1, 1,
0.2791559, -0.9644438, 4.936569, 0, 0.4705882, 1, 1,
0.2792609, -1.491674, 3.03577, 0, 0.4666667, 1, 1,
0.2824824, -1.418883, 1.625266, 0, 0.4588235, 1, 1,
0.2856966, -1.950446, 3.140001, 0, 0.454902, 1, 1,
0.2914643, -0.4682449, 2.321179, 0, 0.4470588, 1, 1,
0.2921404, -0.1178464, 0.7570307, 0, 0.4431373, 1, 1,
0.2950866, -0.5497233, 3.897329, 0, 0.4352941, 1, 1,
0.2978789, 1.267515, 0.8806496, 0, 0.4313726, 1, 1,
0.2980346, 0.3027871, -1.226808, 0, 0.4235294, 1, 1,
0.2987075, 2.339171, 0.6275295, 0, 0.4196078, 1, 1,
0.3038712, -0.9682721, 0.8453737, 0, 0.4117647, 1, 1,
0.3046633, -0.2795249, 2.585885, 0, 0.4078431, 1, 1,
0.3064855, 0.155909, 1.925011, 0, 0.4, 1, 1,
0.3088239, -0.6530463, 3.664604, 0, 0.3921569, 1, 1,
0.3143678, 0.475593, 1.045224, 0, 0.3882353, 1, 1,
0.3165049, -2.056785, 3.884198, 0, 0.3803922, 1, 1,
0.3184781, -1.789723, 2.672692, 0, 0.3764706, 1, 1,
0.3196833, -0.7345759, 2.477021, 0, 0.3686275, 1, 1,
0.3206261, 1.282959, 0.3663191, 0, 0.3647059, 1, 1,
0.3273456, -1.245432, 2.126586, 0, 0.3568628, 1, 1,
0.3278704, -1.076423, 2.275888, 0, 0.3529412, 1, 1,
0.3286685, 0.6190798, 0.5020287, 0, 0.345098, 1, 1,
0.3298531, 1.736061, 1.11963, 0, 0.3411765, 1, 1,
0.333792, 0.01460249, 2.508011, 0, 0.3333333, 1, 1,
0.3370467, -0.1571402, 1.695473, 0, 0.3294118, 1, 1,
0.3405217, -0.03371903, 2.791751, 0, 0.3215686, 1, 1,
0.3415396, 0.9446967, 0.4005462, 0, 0.3176471, 1, 1,
0.3427823, -0.1159478, 3.988747, 0, 0.3098039, 1, 1,
0.345064, -0.1016047, 1.173297, 0, 0.3058824, 1, 1,
0.3475016, -1.031459, 2.481507, 0, 0.2980392, 1, 1,
0.3484237, 0.4285899, 1.596132, 0, 0.2901961, 1, 1,
0.3514472, 0.0712036, 2.200143, 0, 0.2862745, 1, 1,
0.3530929, 0.2309183, 0.7094774, 0, 0.2784314, 1, 1,
0.3603047, 2.020602, -0.3562755, 0, 0.2745098, 1, 1,
0.3646055, 0.694803, 0.7475451, 0, 0.2666667, 1, 1,
0.3646485, 0.478953, 2.197046, 0, 0.2627451, 1, 1,
0.3687198, -0.168203, 1.552545, 0, 0.254902, 1, 1,
0.3732479, -1.149619, 2.82816, 0, 0.2509804, 1, 1,
0.3854264, 1.014326, -0.9659121, 0, 0.2431373, 1, 1,
0.3855436, -0.5339397, -0.1523331, 0, 0.2392157, 1, 1,
0.3861131, 0.4211929, 1.223368, 0, 0.2313726, 1, 1,
0.3867682, -0.1475108, 2.072627, 0, 0.227451, 1, 1,
0.3876774, -0.2241448, 2.615934, 0, 0.2196078, 1, 1,
0.3889085, 0.1607968, 0.2607588, 0, 0.2156863, 1, 1,
0.3904409, 0.7743036, 0.7037959, 0, 0.2078431, 1, 1,
0.3932491, 0.6491992, -1.084795, 0, 0.2039216, 1, 1,
0.3966067, -0.2288206, 2.271791, 0, 0.1960784, 1, 1,
0.3988211, 0.2092839, 2.587082, 0, 0.1882353, 1, 1,
0.3989668, -0.7118418, 1.817721, 0, 0.1843137, 1, 1,
0.4002295, 0.7788727, 0.6436085, 0, 0.1764706, 1, 1,
0.4043195, -0.7840396, 2.858434, 0, 0.172549, 1, 1,
0.4053541, 0.1481807, 1.066072, 0, 0.1647059, 1, 1,
0.4089238, 0.5430114, 0.4136578, 0, 0.1607843, 1, 1,
0.4097801, -0.6059802, 2.543818, 0, 0.1529412, 1, 1,
0.4122761, 0.1008646, 2.068146, 0, 0.1490196, 1, 1,
0.4140508, 0.4413739, -1.096199, 0, 0.1411765, 1, 1,
0.4203409, 0.9646731, -0.5679163, 0, 0.1372549, 1, 1,
0.4207205, 0.5678422, 0.2583873, 0, 0.1294118, 1, 1,
0.4213102, 1.64427, -1.759043, 0, 0.1254902, 1, 1,
0.4221664, 0.3162532, 0.1851651, 0, 0.1176471, 1, 1,
0.4232495, 0.3242279, 0.01708958, 0, 0.1137255, 1, 1,
0.4251842, 2.76087, 1.82284, 0, 0.1058824, 1, 1,
0.4257032, 1.054973, -1.061751, 0, 0.09803922, 1, 1,
0.4257911, -1.149524, 4.069093, 0, 0.09411765, 1, 1,
0.4265364, 0.1281979, 0.1057446, 0, 0.08627451, 1, 1,
0.4279112, 0.7262661, 1.024124, 0, 0.08235294, 1, 1,
0.4286426, -0.2508222, 2.195261, 0, 0.07450981, 1, 1,
0.4317084, 0.3301648, 0.3139327, 0, 0.07058824, 1, 1,
0.4337036, -0.180988, 2.6625, 0, 0.0627451, 1, 1,
0.4374224, 0.4271928, 0.2338923, 0, 0.05882353, 1, 1,
0.4421386, -0.6603358, 1.794319, 0, 0.05098039, 1, 1,
0.4432189, -0.07911057, 1.189654, 0, 0.04705882, 1, 1,
0.4435574, -1.183158, 0.3268972, 0, 0.03921569, 1, 1,
0.4506759, 0.1404478, 1.322877, 0, 0.03529412, 1, 1,
0.4514313, -0.7553071, 1.898098, 0, 0.02745098, 1, 1,
0.4518101, -0.1717618, 3.565523, 0, 0.02352941, 1, 1,
0.4582334, -0.6931428, 2.567623, 0, 0.01568628, 1, 1,
0.4652701, 0.03587566, 1.336994, 0, 0.01176471, 1, 1,
0.4674245, 0.2558765, 1.055807, 0, 0.003921569, 1, 1,
0.4729372, -0.03143908, 2.864351, 0.003921569, 0, 1, 1,
0.4790066, -1.151328, 2.181448, 0.007843138, 0, 1, 1,
0.4800139, 0.1322359, 1.099115, 0.01568628, 0, 1, 1,
0.4880732, -0.09710395, 0.7924571, 0.01960784, 0, 1, 1,
0.4887099, -0.7102927, 2.55459, 0.02745098, 0, 1, 1,
0.4948553, 0.8565913, 0.778442, 0.03137255, 0, 1, 1,
0.4995584, 1.180821, 0.3668749, 0.03921569, 0, 1, 1,
0.4999524, -2.642032, 2.117089, 0.04313726, 0, 1, 1,
0.5007938, -1.134548, 5.789799, 0.05098039, 0, 1, 1,
0.5052661, -0.03386129, 0.9951696, 0.05490196, 0, 1, 1,
0.5054697, -0.6926721, 2.950506, 0.0627451, 0, 1, 1,
0.5072823, 1.241881, 1.886787, 0.06666667, 0, 1, 1,
0.5094491, 0.7948411, 0.5446648, 0.07450981, 0, 1, 1,
0.5242748, -0.0708965, 3.257498, 0.07843138, 0, 1, 1,
0.5249265, -0.8049458, 3.577615, 0.08627451, 0, 1, 1,
0.5262914, -0.4880336, 3.296726, 0.09019608, 0, 1, 1,
0.5263872, -0.1229705, -0.4384913, 0.09803922, 0, 1, 1,
0.5281293, 0.5242268, 0.05145878, 0.1058824, 0, 1, 1,
0.5297271, -0.4131933, 1.890198, 0.1098039, 0, 1, 1,
0.5373701, 1.465079, -0.4137796, 0.1176471, 0, 1, 1,
0.5396531, -0.8812899, 4.953817, 0.1215686, 0, 1, 1,
0.5424386, -0.4031472, 3.228633, 0.1294118, 0, 1, 1,
0.5447943, -0.7680121, 3.298114, 0.1333333, 0, 1, 1,
0.5495882, 0.7035212, 1.260324, 0.1411765, 0, 1, 1,
0.5497344, -0.06580885, 1.3485, 0.145098, 0, 1, 1,
0.5511212, -0.0642219, 0.2500122, 0.1529412, 0, 1, 1,
0.5545223, -0.4984102, 2.41263, 0.1568628, 0, 1, 1,
0.5563827, 0.7586551, 1.902279, 0.1647059, 0, 1, 1,
0.5565649, -0.09618089, -0.6688839, 0.1686275, 0, 1, 1,
0.5567887, 0.8293793, 0.4262621, 0.1764706, 0, 1, 1,
0.557826, -0.9350018, 3.62158, 0.1803922, 0, 1, 1,
0.5667183, -1.234151, 2.63539, 0.1882353, 0, 1, 1,
0.567257, 0.8202833, 1.516699, 0.1921569, 0, 1, 1,
0.5676092, -0.04510767, 1.782162, 0.2, 0, 1, 1,
0.5695341, 1.364251, -1.745315, 0.2078431, 0, 1, 1,
0.5709019, -0.3324286, 3.127427, 0.2117647, 0, 1, 1,
0.573279, -0.3248763, 2.670405, 0.2196078, 0, 1, 1,
0.5785081, 1.896322, 0.1368667, 0.2235294, 0, 1, 1,
0.5872735, 0.421103, 2.473461, 0.2313726, 0, 1, 1,
0.5915821, -1.035626, 2.846979, 0.2352941, 0, 1, 1,
0.5934743, 2.221906, -0.50756, 0.2431373, 0, 1, 1,
0.5946184, -0.2332268, 1.657467, 0.2470588, 0, 1, 1,
0.597467, 1.238495, -0.1774634, 0.254902, 0, 1, 1,
0.5976765, -0.4760621, 1.680618, 0.2588235, 0, 1, 1,
0.5977829, -0.4179426, 1.601276, 0.2666667, 0, 1, 1,
0.5982975, 0.6681072, 0.5155716, 0.2705882, 0, 1, 1,
0.6017455, 0.1046554, 0.9281368, 0.2784314, 0, 1, 1,
0.6101942, -0.5259134, 1.273288, 0.282353, 0, 1, 1,
0.6110548, -1.786948, 1.871603, 0.2901961, 0, 1, 1,
0.6115856, -2.562773, 0.8362321, 0.2941177, 0, 1, 1,
0.612276, -0.1136972, 1.688822, 0.3019608, 0, 1, 1,
0.6144077, -1.386909, 2.260358, 0.3098039, 0, 1, 1,
0.6186312, -0.3330591, 4.174343, 0.3137255, 0, 1, 1,
0.6188561, 0.06514429, 1.797378, 0.3215686, 0, 1, 1,
0.6274121, -1.575036, 2.935726, 0.3254902, 0, 1, 1,
0.628657, -0.09145001, 1.532026, 0.3333333, 0, 1, 1,
0.6336474, 0.728425, 2.153896, 0.3372549, 0, 1, 1,
0.6374996, 0.4720154, -0.9858313, 0.345098, 0, 1, 1,
0.6393147, -0.8297942, 2.760607, 0.3490196, 0, 1, 1,
0.6399782, 0.8796921, -0.7610888, 0.3568628, 0, 1, 1,
0.6408311, 0.557886, 1.562117, 0.3607843, 0, 1, 1,
0.6446681, -0.7504046, 1.667838, 0.3686275, 0, 1, 1,
0.6460204, 0.5955344, 1.167965, 0.372549, 0, 1, 1,
0.6463061, -0.2803379, 0.8448063, 0.3803922, 0, 1, 1,
0.6478168, 0.2932262, 0.6663241, 0.3843137, 0, 1, 1,
0.6557785, -1.964652, 2.875849, 0.3921569, 0, 1, 1,
0.6562985, -0.9202015, 3.51016, 0.3960784, 0, 1, 1,
0.6630157, 2.586887, -0.7194282, 0.4039216, 0, 1, 1,
0.6711165, -1.075201, 2.664803, 0.4117647, 0, 1, 1,
0.6721017, -1.690959, 2.472808, 0.4156863, 0, 1, 1,
0.6731967, -0.7463239, 2.625395, 0.4235294, 0, 1, 1,
0.6778239, -0.173403, 1.093917, 0.427451, 0, 1, 1,
0.6778386, 0.1250015, -0.0361223, 0.4352941, 0, 1, 1,
0.6786303, -0.8023663, 1.052484, 0.4392157, 0, 1, 1,
0.6808972, -0.5110998, 1.874501, 0.4470588, 0, 1, 1,
0.6824815, -1.038641, 1.618427, 0.4509804, 0, 1, 1,
0.6857987, 0.1739399, 0.981711, 0.4588235, 0, 1, 1,
0.6859857, 0.5206411, 1.080207, 0.4627451, 0, 1, 1,
0.6861081, 1.468649, 0.09627896, 0.4705882, 0, 1, 1,
0.6864318, 0.8521144, 0.9586463, 0.4745098, 0, 1, 1,
0.686536, 0.3548304, 2.196985, 0.4823529, 0, 1, 1,
0.6900247, 1.528477, -0.657097, 0.4862745, 0, 1, 1,
0.6931025, 0.08647234, 2.953905, 0.4941176, 0, 1, 1,
0.7039181, -0.8157914, 0.8816563, 0.5019608, 0, 1, 1,
0.7043011, 0.9106947, 1.438639, 0.5058824, 0, 1, 1,
0.7070651, -0.7115148, 1.908635, 0.5137255, 0, 1, 1,
0.717294, -0.5203549, 3.153568, 0.5176471, 0, 1, 1,
0.719614, 0.3932303, 1.11684, 0.5254902, 0, 1, 1,
0.72331, 0.587476, 1.067204, 0.5294118, 0, 1, 1,
0.7247271, 1.727522, 1.65755, 0.5372549, 0, 1, 1,
0.7298768, -1.423779, 1.618893, 0.5411765, 0, 1, 1,
0.7307535, 0.04977209, 1.723632, 0.5490196, 0, 1, 1,
0.7312216, 0.2749206, 2.349199, 0.5529412, 0, 1, 1,
0.7371027, -0.9446282, 3.425894, 0.5607843, 0, 1, 1,
0.7389783, 0.1971462, 3.896364, 0.5647059, 0, 1, 1,
0.7409056, 2.049196, 1.069322, 0.572549, 0, 1, 1,
0.7412515, -0.1211195, 0.5913533, 0.5764706, 0, 1, 1,
0.745743, 0.2339811, -0.2790395, 0.5843138, 0, 1, 1,
0.7483112, -0.1686873, 2.236396, 0.5882353, 0, 1, 1,
0.749298, -0.6668401, 2.803977, 0.5960785, 0, 1, 1,
0.7681357, -0.3171419, 3.211961, 0.6039216, 0, 1, 1,
0.7715758, 2.205871, 0.5436979, 0.6078432, 0, 1, 1,
0.7746704, 0.2740151, 0.7069435, 0.6156863, 0, 1, 1,
0.7779312, -0.07265214, 0.9649713, 0.6196079, 0, 1, 1,
0.7814485, 0.9168864, 1.711402, 0.627451, 0, 1, 1,
0.7863759, 0.01515644, 2.002322, 0.6313726, 0, 1, 1,
0.796685, -0.3857348, 2.564749, 0.6392157, 0, 1, 1,
0.7984921, 0.4757573, 2.774606, 0.6431373, 0, 1, 1,
0.7998385, 1.186069, 0.4501457, 0.6509804, 0, 1, 1,
0.8016838, 0.2061211, 2.956965, 0.654902, 0, 1, 1,
0.8034219, -1.585997, 1.82183, 0.6627451, 0, 1, 1,
0.8064005, 0.4298976, 0.1576447, 0.6666667, 0, 1, 1,
0.8097368, -1.175146, 1.905521, 0.6745098, 0, 1, 1,
0.8110529, -2.014431, 1.945609, 0.6784314, 0, 1, 1,
0.8113837, -1.064735, 0.9983094, 0.6862745, 0, 1, 1,
0.8120219, -0.6114428, 1.732066, 0.6901961, 0, 1, 1,
0.813746, 0.02561786, 0.5377271, 0.6980392, 0, 1, 1,
0.8171354, 0.02123102, 2.053255, 0.7058824, 0, 1, 1,
0.8202702, 0.6668996, 1.53285, 0.7098039, 0, 1, 1,
0.8212538, -1.461609, 2.278727, 0.7176471, 0, 1, 1,
0.8239655, 0.8916377, 0.623651, 0.7215686, 0, 1, 1,
0.8243116, 0.7759931, 0.8721497, 0.7294118, 0, 1, 1,
0.8245122, -0.9945991, 3.244319, 0.7333333, 0, 1, 1,
0.8277922, -0.4941198, 0.3967147, 0.7411765, 0, 1, 1,
0.8291162, 0.8908429, 1.196518, 0.7450981, 0, 1, 1,
0.8293377, 0.9623581, 0.611114, 0.7529412, 0, 1, 1,
0.8315037, 2.03378, 0.2969216, 0.7568628, 0, 1, 1,
0.8383184, 0.2681608, 0.8830072, 0.7647059, 0, 1, 1,
0.8410636, -0.4684696, 2.591157, 0.7686275, 0, 1, 1,
0.8446109, -0.4374768, 2.650103, 0.7764706, 0, 1, 1,
0.8499424, 0.4638939, 1.104705, 0.7803922, 0, 1, 1,
0.8548831, -0.5100649, 2.163846, 0.7882353, 0, 1, 1,
0.8642312, -0.4912748, 2.173342, 0.7921569, 0, 1, 1,
0.8643475, 1.022943, -0.3534347, 0.8, 0, 1, 1,
0.8650945, -0.07099944, 2.158612, 0.8078431, 0, 1, 1,
0.866234, 0.9940583, -0.1823884, 0.8117647, 0, 1, 1,
0.8668527, -0.03217274, 2.97945, 0.8196079, 0, 1, 1,
0.8689889, -1.862373, 1.667292, 0.8235294, 0, 1, 1,
0.8726408, -0.4168503, 2.550207, 0.8313726, 0, 1, 1,
0.8726569, 0.04445204, 1.003636, 0.8352941, 0, 1, 1,
0.8815613, -0.4334547, 2.433489, 0.8431373, 0, 1, 1,
0.884183, -1.385011, 2.200949, 0.8470588, 0, 1, 1,
0.8855239, -0.5397862, 0.3005243, 0.854902, 0, 1, 1,
0.8858739, -0.4419327, 0.6954805, 0.8588235, 0, 1, 1,
0.8911051, -0.4443873, 1.188448, 0.8666667, 0, 1, 1,
0.8939721, 0.269878, 0.02794143, 0.8705882, 0, 1, 1,
0.8947489, -0.2064342, 2.629871, 0.8784314, 0, 1, 1,
0.8948348, -0.4332914, 2.201983, 0.8823529, 0, 1, 1,
0.9038239, 0.06852502, 3.444112, 0.8901961, 0, 1, 1,
0.903967, -0.2924539, 0.2181618, 0.8941177, 0, 1, 1,
0.9087974, -1.908976, 2.498327, 0.9019608, 0, 1, 1,
0.912064, -1.962875, 3.563846, 0.9098039, 0, 1, 1,
0.9139436, -0.2355879, 2.954898, 0.9137255, 0, 1, 1,
0.9156996, -2.074775, 1.654366, 0.9215686, 0, 1, 1,
0.9173406, -0.1138848, 1.378375, 0.9254902, 0, 1, 1,
0.9185426, -0.1689663, 2.793783, 0.9333333, 0, 1, 1,
0.9193579, 0.3314304, 0.9752756, 0.9372549, 0, 1, 1,
0.9216169, -0.1687915, 2.254447, 0.945098, 0, 1, 1,
0.9231718, -1.348711, 1.800808, 0.9490196, 0, 1, 1,
0.9241275, -1.019522, 3.955282, 0.9568627, 0, 1, 1,
0.9255341, 0.2367631, 0.6048594, 0.9607843, 0, 1, 1,
0.9325029, -0.03196034, 1.269188, 0.9686275, 0, 1, 1,
0.9375845, -0.9862856, 0.9051747, 0.972549, 0, 1, 1,
0.9449728, -1.963793, 2.046792, 0.9803922, 0, 1, 1,
0.9467783, 0.1807875, 1.360204, 0.9843137, 0, 1, 1,
0.9480781, 2.644637, 1.020919, 0.9921569, 0, 1, 1,
0.9530675, -0.09836064, 2.850997, 0.9960784, 0, 1, 1,
0.9542608, 1.211658, 2.219916, 1, 0, 0.9960784, 1,
0.9550845, 0.01116455, 3.675514, 1, 0, 0.9882353, 1,
0.9556683, 0.724755, 0.8915281, 1, 0, 0.9843137, 1,
0.9588216, 1.156312, 0.2205731, 1, 0, 0.9764706, 1,
0.9636965, 0.39421, 1.90812, 1, 0, 0.972549, 1,
0.9667434, -0.05536873, 1.14069, 1, 0, 0.9647059, 1,
0.9683227, -0.9877712, 1.586489, 1, 0, 0.9607843, 1,
0.9721289, 0.09605252, 3.656212, 1, 0, 0.9529412, 1,
0.9730515, -0.5616471, 1.146585, 1, 0, 0.9490196, 1,
0.9757124, -0.383334, 4.594261, 1, 0, 0.9411765, 1,
0.9798007, 1.42544, 1.15684, 1, 0, 0.9372549, 1,
0.9862111, 0.2413848, 1.234604, 1, 0, 0.9294118, 1,
1.012925, -0.2323273, 1.634131, 1, 0, 0.9254902, 1,
1.013906, 0.320915, 1.2313, 1, 0, 0.9176471, 1,
1.018602, -0.81238, 2.329492, 1, 0, 0.9137255, 1,
1.025073, -1.530519, 1.076511, 1, 0, 0.9058824, 1,
1.028426, -0.08963198, 2.184839, 1, 0, 0.9019608, 1,
1.03663, 0.2474967, 0.03178309, 1, 0, 0.8941177, 1,
1.041945, 0.2139215, 1.365387, 1, 0, 0.8862745, 1,
1.044893, -0.02816571, 0.8660169, 1, 0, 0.8823529, 1,
1.045496, 0.6600502, 2.213388, 1, 0, 0.8745098, 1,
1.047326, 0.1513339, 0.2088766, 1, 0, 0.8705882, 1,
1.050604, -0.2676932, 0.8558099, 1, 0, 0.8627451, 1,
1.052003, -3.335481, 2.743947, 1, 0, 0.8588235, 1,
1.053955, -0.9085336, 0.8158381, 1, 0, 0.8509804, 1,
1.055866, 1.619288, -1.044102, 1, 0, 0.8470588, 1,
1.05878, -1.432312, 1.465685, 1, 0, 0.8392157, 1,
1.060725, 0.5016462, 2.805518, 1, 0, 0.8352941, 1,
1.066047, 0.5211738, 0.6048864, 1, 0, 0.827451, 1,
1.067519, -0.1415029, 0.358807, 1, 0, 0.8235294, 1,
1.06768, -0.2434478, 3.582984, 1, 0, 0.8156863, 1,
1.068659, -2.252954, 1.973776, 1, 0, 0.8117647, 1,
1.072801, 1.391691, 0.2296715, 1, 0, 0.8039216, 1,
1.079711, -0.242519, 0.748917, 1, 0, 0.7960784, 1,
1.088275, -0.1088361, 2.54721, 1, 0, 0.7921569, 1,
1.088828, -0.7157725, 2.729804, 1, 0, 0.7843137, 1,
1.089177, 1.097039, 0.2046879, 1, 0, 0.7803922, 1,
1.089679, 0.211657, 1.011758, 1, 0, 0.772549, 1,
1.115598, -1.057231, 1.837833, 1, 0, 0.7686275, 1,
1.119003, 0.4591587, 1.168518, 1, 0, 0.7607843, 1,
1.130451, -1.520257, 4.005751, 1, 0, 0.7568628, 1,
1.132246, 1.0826, 0.4608822, 1, 0, 0.7490196, 1,
1.133137, 1.996931, -0.05902549, 1, 0, 0.7450981, 1,
1.146831, -0.886731, 3.080578, 1, 0, 0.7372549, 1,
1.156855, -0.5111757, 1.967054, 1, 0, 0.7333333, 1,
1.161729, -1.336571, 1.25586, 1, 0, 0.7254902, 1,
1.172313, 0.06098996, 2.398518, 1, 0, 0.7215686, 1,
1.175619, 0.8993828, 0.9343498, 1, 0, 0.7137255, 1,
1.181549, -0.1682652, 0.9953736, 1, 0, 0.7098039, 1,
1.19378, -0.3554425, 2.670178, 1, 0, 0.7019608, 1,
1.203001, 0.7582445, 1.213409, 1, 0, 0.6941177, 1,
1.216107, 0.114267, 0.126429, 1, 0, 0.6901961, 1,
1.230857, 0.2808062, 0.9610297, 1, 0, 0.682353, 1,
1.230913, -0.4127519, 1.72405, 1, 0, 0.6784314, 1,
1.24182, 0.3135039, 1.500994, 1, 0, 0.6705883, 1,
1.255076, -1.450837, 3.60946, 1, 0, 0.6666667, 1,
1.262579, 0.3276289, -0.3498578, 1, 0, 0.6588235, 1,
1.269816, 1.352374, 0.6238391, 1, 0, 0.654902, 1,
1.269839, 1.722407, -0.328708, 1, 0, 0.6470588, 1,
1.270312, -0.4541767, -0.5223524, 1, 0, 0.6431373, 1,
1.270743, -0.149179, 2.815808, 1, 0, 0.6352941, 1,
1.273285, -0.04371752, 2.823213, 1, 0, 0.6313726, 1,
1.28085, 0.991899, 0.01312826, 1, 0, 0.6235294, 1,
1.283626, 0.6990579, 0.6213478, 1, 0, 0.6196079, 1,
1.285171, 0.07605822, 2.172793, 1, 0, 0.6117647, 1,
1.287404, 1.692582, 0.6731545, 1, 0, 0.6078432, 1,
1.29213, -0.252147, 1.921113, 1, 0, 0.6, 1,
1.309349, -0.7573904, 2.953391, 1, 0, 0.5921569, 1,
1.327428, 2.80717, 0.3305159, 1, 0, 0.5882353, 1,
1.328931, -1.354457, 4.034849, 1, 0, 0.5803922, 1,
1.339716, -0.2100026, 1.683957, 1, 0, 0.5764706, 1,
1.345943, -1.493044, 4.438781, 1, 0, 0.5686275, 1,
1.347371, 0.5338483, -0.1108761, 1, 0, 0.5647059, 1,
1.363766, -0.3091407, 0.3897562, 1, 0, 0.5568628, 1,
1.364748, 0.2367884, 1.667062, 1, 0, 0.5529412, 1,
1.366381, -0.7196449, 0.5809435, 1, 0, 0.5450981, 1,
1.374024, -0.2847164, 2.724231, 1, 0, 0.5411765, 1,
1.377494, 1.195395, 0.1395943, 1, 0, 0.5333334, 1,
1.385984, 0.9164521, 0.5423403, 1, 0, 0.5294118, 1,
1.399229, -0.6379119, 0.8763916, 1, 0, 0.5215687, 1,
1.407485, 0.6253544, 0.3958263, 1, 0, 0.5176471, 1,
1.424151, -1.350068, 1.999452, 1, 0, 0.509804, 1,
1.435687, -1.662726, 2.108582, 1, 0, 0.5058824, 1,
1.442428, -1.33673, 4.356431, 1, 0, 0.4980392, 1,
1.453883, 0.1683216, 0.07569751, 1, 0, 0.4901961, 1,
1.468038, -1.77184, 2.454397, 1, 0, 0.4862745, 1,
1.483592, -1.447779, 2.17458, 1, 0, 0.4784314, 1,
1.488972, -2.538504, 2.878866, 1, 0, 0.4745098, 1,
1.502315, -0.85106, 1.356142, 1, 0, 0.4666667, 1,
1.505296, 0.8091609, 0.4481755, 1, 0, 0.4627451, 1,
1.526996, -1.987142, 2.564393, 1, 0, 0.454902, 1,
1.527046, 0.8519851, 1.400374, 1, 0, 0.4509804, 1,
1.578871, -0.4286865, 2.817284, 1, 0, 0.4431373, 1,
1.579215, 0.03221464, 2.821988, 1, 0, 0.4392157, 1,
1.5828, -1.615881, 3.07025, 1, 0, 0.4313726, 1,
1.584643, -1.107013, 2.379897, 1, 0, 0.427451, 1,
1.586345, -0.2678749, 3.561607, 1, 0, 0.4196078, 1,
1.590371, 0.1385696, -0.560184, 1, 0, 0.4156863, 1,
1.612478, -1.764605, 2.648818, 1, 0, 0.4078431, 1,
1.630501, -1.582608, 1.769125, 1, 0, 0.4039216, 1,
1.632007, 0.5062274, 1.492501, 1, 0, 0.3960784, 1,
1.635934, -0.0603904, 3.383778, 1, 0, 0.3882353, 1,
1.642187, -0.6185265, 1.936057, 1, 0, 0.3843137, 1,
1.645027, -0.04997985, 2.532964, 1, 0, 0.3764706, 1,
1.650325, -0.1791423, 0.7929305, 1, 0, 0.372549, 1,
1.654684, 0.9068472, 0.7267663, 1, 0, 0.3647059, 1,
1.659227, 0.668582, 1.557224, 1, 0, 0.3607843, 1,
1.676868, 1.9004, 3.061216, 1, 0, 0.3529412, 1,
1.681147, -0.9088485, 2.298529, 1, 0, 0.3490196, 1,
1.68514, 2.019433, -0.1240931, 1, 0, 0.3411765, 1,
1.698727, -1.62176, 1.443557, 1, 0, 0.3372549, 1,
1.70001, 0.06512903, 0.4869247, 1, 0, 0.3294118, 1,
1.710703, -0.9509087, 3.173172, 1, 0, 0.3254902, 1,
1.714329, -1.680605, 2.115017, 1, 0, 0.3176471, 1,
1.716528, 0.1485036, 1.085584, 1, 0, 0.3137255, 1,
1.720451, 1.083739, 0.915049, 1, 0, 0.3058824, 1,
1.73134, -0.4489253, 1.040468, 1, 0, 0.2980392, 1,
1.733695, 1.747128, 2.887084, 1, 0, 0.2941177, 1,
1.743131, 0.8002957, 1.216106, 1, 0, 0.2862745, 1,
1.764997, 0.0579759, 3.368165, 1, 0, 0.282353, 1,
1.767668, 0.9265158, 1.009495, 1, 0, 0.2745098, 1,
1.771402, -0.08243433, 3.307402, 1, 0, 0.2705882, 1,
1.771785, 0.6411106, 2.490801, 1, 0, 0.2627451, 1,
1.783183, -0.652245, 3.267263, 1, 0, 0.2588235, 1,
1.807116, -1.121012, 3.531481, 1, 0, 0.2509804, 1,
1.812349, -0.6443139, 2.707358, 1, 0, 0.2470588, 1,
1.827685, 0.4622846, 0.2980289, 1, 0, 0.2392157, 1,
1.830629, -0.1790479, 1.187178, 1, 0, 0.2352941, 1,
1.847116, -0.4333501, 2.344815, 1, 0, 0.227451, 1,
1.849667, -0.4552655, 3.266145, 1, 0, 0.2235294, 1,
1.858603, 0.3543956, 1.54741, 1, 0, 0.2156863, 1,
1.873747, 2.277964, 1.963491, 1, 0, 0.2117647, 1,
1.875299, 1.993585, -0.3573375, 1, 0, 0.2039216, 1,
1.878569, 1.331197, 4.311501, 1, 0, 0.1960784, 1,
1.898311, 0.9759221, 1.39573, 1, 0, 0.1921569, 1,
1.907051, -0.8748511, 1.797708, 1, 0, 0.1843137, 1,
1.909872, 1.798148, 1.579306, 1, 0, 0.1803922, 1,
1.921338, 1.228972, 0.803605, 1, 0, 0.172549, 1,
1.922978, 0.3555489, -0.02253314, 1, 0, 0.1686275, 1,
1.933489, -0.9262167, 1.610467, 1, 0, 0.1607843, 1,
1.935362, 0.5323207, 1.081837, 1, 0, 0.1568628, 1,
1.935432, 1.216783, -0.07751042, 1, 0, 0.1490196, 1,
1.945834, 0.428336, 0.4462064, 1, 0, 0.145098, 1,
1.946289, -0.7730159, 1.471174, 1, 0, 0.1372549, 1,
1.991662, 3.031478, 0.6272541, 1, 0, 0.1333333, 1,
1.998692, -0.7203809, 3.086734, 1, 0, 0.1254902, 1,
2.03665, 0.8488262, 1.340462, 1, 0, 0.1215686, 1,
2.04348, -0.6426719, 1.449931, 1, 0, 0.1137255, 1,
2.090686, 1.889622, 0.5239389, 1, 0, 0.1098039, 1,
2.101655, 0.4229071, 3.059144, 1, 0, 0.1019608, 1,
2.1338, 1.826085, 1.709866, 1, 0, 0.09411765, 1,
2.144397, 0.372048, 0.4527719, 1, 0, 0.09019608, 1,
2.165119, 1.371056, 0.466057, 1, 0, 0.08235294, 1,
2.177328, -0.9395034, 1.944976, 1, 0, 0.07843138, 1,
2.228889, -1.721411, 2.951725, 1, 0, 0.07058824, 1,
2.269802, 0.4176016, 0.09626013, 1, 0, 0.06666667, 1,
2.294099, -0.9229268, 2.139196, 1, 0, 0.05882353, 1,
2.448846, -0.8916442, 3.354914, 1, 0, 0.05490196, 1,
2.476563, 0.9286377, -0.6487081, 1, 0, 0.04705882, 1,
2.514329, -1.23064, 2.026857, 1, 0, 0.04313726, 1,
2.548729, 0.9854797, 0.3508506, 1, 0, 0.03529412, 1,
2.567316, 0.1712788, 0.8120567, 1, 0, 0.03137255, 1,
2.759744, 0.387364, 0.2431166, 1, 0, 0.02352941, 1,
2.767046, 1.141765, 1.242782, 1, 0, 0.01960784, 1,
2.816397, 0.3173906, -0.05396923, 1, 0, 0.01176471, 1,
3.130476, 1.432182, 1.720802, 1, 0, 0.007843138, 1
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
0.03906286, -4.774761, -6.938151, 0, -0.5, 0.5, 0.5,
0.03906286, -4.774761, -6.938151, 1, -0.5, 0.5, 0.5,
0.03906286, -4.774761, -6.938151, 1, 1.5, 0.5, 0.5,
0.03906286, -4.774761, -6.938151, 0, 1.5, 0.5, 0.5
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
-4.100339, -0.2076485, -6.938151, 0, -0.5, 0.5, 0.5,
-4.100339, -0.2076485, -6.938151, 1, -0.5, 0.5, 0.5,
-4.100339, -0.2076485, -6.938151, 1, 1.5, 0.5, 0.5,
-4.100339, -0.2076485, -6.938151, 0, 1.5, 0.5, 0.5
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
-4.100339, -4.774761, 0.3481786, 0, -0.5, 0.5, 0.5,
-4.100339, -4.774761, 0.3481786, 1, -0.5, 0.5, 0.5,
-4.100339, -4.774761, 0.3481786, 1, 1.5, 0.5, 0.5,
-4.100339, -4.774761, 0.3481786, 0, 1.5, 0.5, 0.5
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
-3, -3.720812, -5.256691,
3, -3.720812, -5.256691,
-3, -3.720812, -5.256691,
-3, -3.89647, -5.536934,
-2, -3.720812, -5.256691,
-2, -3.89647, -5.536934,
-1, -3.720812, -5.256691,
-1, -3.89647, -5.536934,
0, -3.720812, -5.256691,
0, -3.89647, -5.536934,
1, -3.720812, -5.256691,
1, -3.89647, -5.536934,
2, -3.720812, -5.256691,
2, -3.89647, -5.536934,
3, -3.720812, -5.256691,
3, -3.89647, -5.536934
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
-3, -4.247787, -6.097421, 0, -0.5, 0.5, 0.5,
-3, -4.247787, -6.097421, 1, -0.5, 0.5, 0.5,
-3, -4.247787, -6.097421, 1, 1.5, 0.5, 0.5,
-3, -4.247787, -6.097421, 0, 1.5, 0.5, 0.5,
-2, -4.247787, -6.097421, 0, -0.5, 0.5, 0.5,
-2, -4.247787, -6.097421, 1, -0.5, 0.5, 0.5,
-2, -4.247787, -6.097421, 1, 1.5, 0.5, 0.5,
-2, -4.247787, -6.097421, 0, 1.5, 0.5, 0.5,
-1, -4.247787, -6.097421, 0, -0.5, 0.5, 0.5,
-1, -4.247787, -6.097421, 1, -0.5, 0.5, 0.5,
-1, -4.247787, -6.097421, 1, 1.5, 0.5, 0.5,
-1, -4.247787, -6.097421, 0, 1.5, 0.5, 0.5,
0, -4.247787, -6.097421, 0, -0.5, 0.5, 0.5,
0, -4.247787, -6.097421, 1, -0.5, 0.5, 0.5,
0, -4.247787, -6.097421, 1, 1.5, 0.5, 0.5,
0, -4.247787, -6.097421, 0, 1.5, 0.5, 0.5,
1, -4.247787, -6.097421, 0, -0.5, 0.5, 0.5,
1, -4.247787, -6.097421, 1, -0.5, 0.5, 0.5,
1, -4.247787, -6.097421, 1, 1.5, 0.5, 0.5,
1, -4.247787, -6.097421, 0, 1.5, 0.5, 0.5,
2, -4.247787, -6.097421, 0, -0.5, 0.5, 0.5,
2, -4.247787, -6.097421, 1, -0.5, 0.5, 0.5,
2, -4.247787, -6.097421, 1, 1.5, 0.5, 0.5,
2, -4.247787, -6.097421, 0, 1.5, 0.5, 0.5,
3, -4.247787, -6.097421, 0, -0.5, 0.5, 0.5,
3, -4.247787, -6.097421, 1, -0.5, 0.5, 0.5,
3, -4.247787, -6.097421, 1, 1.5, 0.5, 0.5,
3, -4.247787, -6.097421, 0, 1.5, 0.5, 0.5
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
-3.145092, -3, -5.256691,
-3.145092, 3, -5.256691,
-3.145092, -3, -5.256691,
-3.3043, -3, -5.536934,
-3.145092, -2, -5.256691,
-3.3043, -2, -5.536934,
-3.145092, -1, -5.256691,
-3.3043, -1, -5.536934,
-3.145092, 0, -5.256691,
-3.3043, 0, -5.536934,
-3.145092, 1, -5.256691,
-3.3043, 1, -5.536934,
-3.145092, 2, -5.256691,
-3.3043, 2, -5.536934,
-3.145092, 3, -5.256691,
-3.3043, 3, -5.536934
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
"-3",
"-2",
"-1",
"0",
"1",
"2",
"3"
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
-3.622716, -3, -6.097421, 0, -0.5, 0.5, 0.5,
-3.622716, -3, -6.097421, 1, -0.5, 0.5, 0.5,
-3.622716, -3, -6.097421, 1, 1.5, 0.5, 0.5,
-3.622716, -3, -6.097421, 0, 1.5, 0.5, 0.5,
-3.622716, -2, -6.097421, 0, -0.5, 0.5, 0.5,
-3.622716, -2, -6.097421, 1, -0.5, 0.5, 0.5,
-3.622716, -2, -6.097421, 1, 1.5, 0.5, 0.5,
-3.622716, -2, -6.097421, 0, 1.5, 0.5, 0.5,
-3.622716, -1, -6.097421, 0, -0.5, 0.5, 0.5,
-3.622716, -1, -6.097421, 1, -0.5, 0.5, 0.5,
-3.622716, -1, -6.097421, 1, 1.5, 0.5, 0.5,
-3.622716, -1, -6.097421, 0, 1.5, 0.5, 0.5,
-3.622716, 0, -6.097421, 0, -0.5, 0.5, 0.5,
-3.622716, 0, -6.097421, 1, -0.5, 0.5, 0.5,
-3.622716, 0, -6.097421, 1, 1.5, 0.5, 0.5,
-3.622716, 0, -6.097421, 0, 1.5, 0.5, 0.5,
-3.622716, 1, -6.097421, 0, -0.5, 0.5, 0.5,
-3.622716, 1, -6.097421, 1, -0.5, 0.5, 0.5,
-3.622716, 1, -6.097421, 1, 1.5, 0.5, 0.5,
-3.622716, 1, -6.097421, 0, 1.5, 0.5, 0.5,
-3.622716, 2, -6.097421, 0, -0.5, 0.5, 0.5,
-3.622716, 2, -6.097421, 1, -0.5, 0.5, 0.5,
-3.622716, 2, -6.097421, 1, 1.5, 0.5, 0.5,
-3.622716, 2, -6.097421, 0, 1.5, 0.5, 0.5,
-3.622716, 3, -6.097421, 0, -0.5, 0.5, 0.5,
-3.622716, 3, -6.097421, 1, -0.5, 0.5, 0.5,
-3.622716, 3, -6.097421, 1, 1.5, 0.5, 0.5,
-3.622716, 3, -6.097421, 0, 1.5, 0.5, 0.5
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
-3.145092, -3.720812, -4,
-3.145092, -3.720812, 4,
-3.145092, -3.720812, -4,
-3.3043, -3.89647, -4,
-3.145092, -3.720812, -2,
-3.3043, -3.89647, -2,
-3.145092, -3.720812, 0,
-3.3043, -3.89647, 0,
-3.145092, -3.720812, 2,
-3.3043, -3.89647, 2,
-3.145092, -3.720812, 4,
-3.3043, -3.89647, 4
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
-3.622716, -4.247787, -4, 0, -0.5, 0.5, 0.5,
-3.622716, -4.247787, -4, 1, -0.5, 0.5, 0.5,
-3.622716, -4.247787, -4, 1, 1.5, 0.5, 0.5,
-3.622716, -4.247787, -4, 0, 1.5, 0.5, 0.5,
-3.622716, -4.247787, -2, 0, -0.5, 0.5, 0.5,
-3.622716, -4.247787, -2, 1, -0.5, 0.5, 0.5,
-3.622716, -4.247787, -2, 1, 1.5, 0.5, 0.5,
-3.622716, -4.247787, -2, 0, 1.5, 0.5, 0.5,
-3.622716, -4.247787, 0, 0, -0.5, 0.5, 0.5,
-3.622716, -4.247787, 0, 1, -0.5, 0.5, 0.5,
-3.622716, -4.247787, 0, 1, 1.5, 0.5, 0.5,
-3.622716, -4.247787, 0, 0, 1.5, 0.5, 0.5,
-3.622716, -4.247787, 2, 0, -0.5, 0.5, 0.5,
-3.622716, -4.247787, 2, 1, -0.5, 0.5, 0.5,
-3.622716, -4.247787, 2, 1, 1.5, 0.5, 0.5,
-3.622716, -4.247787, 2, 0, 1.5, 0.5, 0.5,
-3.622716, -4.247787, 4, 0, -0.5, 0.5, 0.5,
-3.622716, -4.247787, 4, 1, -0.5, 0.5, 0.5,
-3.622716, -4.247787, 4, 1, 1.5, 0.5, 0.5,
-3.622716, -4.247787, 4, 0, 1.5, 0.5, 0.5
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
-3.145092, -3.720812, -5.256691,
-3.145092, 3.305515, -5.256691,
-3.145092, -3.720812, 5.953048,
-3.145092, 3.305515, 5.953048,
-3.145092, -3.720812, -5.256691,
-3.145092, -3.720812, 5.953048,
-3.145092, 3.305515, -5.256691,
-3.145092, 3.305515, 5.953048,
-3.145092, -3.720812, -5.256691,
3.223218, -3.720812, -5.256691,
-3.145092, -3.720812, 5.953048,
3.223218, -3.720812, 5.953048,
-3.145092, 3.305515, -5.256691,
3.223218, 3.305515, -5.256691,
-3.145092, 3.305515, 5.953048,
3.223218, 3.305515, 5.953048,
3.223218, -3.720812, -5.256691,
3.223218, 3.305515, -5.256691,
3.223218, -3.720812, 5.953048,
3.223218, 3.305515, 5.953048,
3.223218, -3.720812, -5.256691,
3.223218, -3.720812, 5.953048,
3.223218, 3.305515, -5.256691,
3.223218, 3.305515, 5.953048
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
var radius = 7.840299;
var distance = 34.88237;
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
mvMatrix.translate( -0.03906286, 0.2076485, -0.3481786 );
mvMatrix.scale( 1.331136, 1.206475, 0.756225 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.88237);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
Milbemectin_A3<-read.table("Milbemectin_A3.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Milbemectin_A3$V2
```

```
## Error in eval(expr, envir, enclos): object 'Milbemectin_A3' not found
```

```r
y<-Milbemectin_A3$V3
```

```
## Error in eval(expr, envir, enclos): object 'Milbemectin_A3' not found
```

```r
z<-Milbemectin_A3$V4
```

```
## Error in eval(expr, envir, enclos): object 'Milbemectin_A3' not found
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
-3.05235, -0.4739284, -1.09902, 0, 0, 1, 1, 1,
-2.869162, 0.01339681, -2.554396, 1, 0, 0, 1, 1,
-2.728504, -0.09576657, -1.78357, 1, 0, 0, 1, 1,
-2.705791, -1.044598, -1.661764, 1, 0, 0, 1, 1,
-2.602156, -1.102401, -3.268068, 1, 0, 0, 1, 1,
-2.478318, 1.256682, -1.417627, 1, 0, 0, 1, 1,
-2.446008, 0.2220046, -0.9938135, 0, 0, 0, 1, 1,
-2.432527, -0.1745166, 0.5590835, 0, 0, 0, 1, 1,
-2.422209, 0.8216563, -0.3063404, 0, 0, 0, 1, 1,
-2.315788, 0.5506762, -0.5725341, 0, 0, 0, 1, 1,
-2.301583, 0.2340954, -0.5299609, 0, 0, 0, 1, 1,
-2.293723, -1.462047, -1.397131, 0, 0, 0, 1, 1,
-2.264963, 0.5917605, -0.6621806, 0, 0, 0, 1, 1,
-2.258808, -0.2796206, -1.419689, 1, 1, 1, 1, 1,
-2.245042, -0.4603446, -2.818312, 1, 1, 1, 1, 1,
-2.168314, -1.066596, -3.615071, 1, 1, 1, 1, 1,
-2.151752, 0.282947, -2.455534, 1, 1, 1, 1, 1,
-2.149221, -1.579759, -2.002484, 1, 1, 1, 1, 1,
-2.14085, -0.5101265, -2.019022, 1, 1, 1, 1, 1,
-2.136741, -0.9138776, -0.6762475, 1, 1, 1, 1, 1,
-2.090548, 1.28234, -1.238311, 1, 1, 1, 1, 1,
-2.087905, -0.8462104, -2.628289, 1, 1, 1, 1, 1,
-2.059909, -0.4927398, -2.122212, 1, 1, 1, 1, 1,
-2.059825, -0.3545834, -1.693393, 1, 1, 1, 1, 1,
-2.059, -0.488095, -1.708493, 1, 1, 1, 1, 1,
-2.051369, 0.650728, -1.65148, 1, 1, 1, 1, 1,
-2.03496, -1.322108, -3.039023, 1, 1, 1, 1, 1,
-2.013823, 0.4356746, -1.6842, 1, 1, 1, 1, 1,
-1.999703, -0.5255526, -2.510836, 0, 0, 1, 1, 1,
-1.99948, -1.338503, -2.805486, 1, 0, 0, 1, 1,
-1.957935, -0.9772307, -3.020203, 1, 0, 0, 1, 1,
-1.957551, 0.6471609, -0.8201283, 1, 0, 0, 1, 1,
-1.871453, -0.1196517, -1.398018, 1, 0, 0, 1, 1,
-1.860499, -0.31712, -0.6581323, 1, 0, 0, 1, 1,
-1.854487, 2.409357, -1.765777, 0, 0, 0, 1, 1,
-1.841384, 0.4544421, -0.5258898, 0, 0, 0, 1, 1,
-1.808556, 0.2773314, -2.967174, 0, 0, 0, 1, 1,
-1.790858, -1.861886, -0.5487762, 0, 0, 0, 1, 1,
-1.779982, -0.7289368, -1.453245, 0, 0, 0, 1, 1,
-1.770026, 1.597808, 1.871874, 0, 0, 0, 1, 1,
-1.767872, 0.4919933, -0.7242951, 0, 0, 0, 1, 1,
-1.75803, -0.3320137, -1.935089, 1, 1, 1, 1, 1,
-1.745384, -0.5551745, -2.481746, 1, 1, 1, 1, 1,
-1.735733, 0.6305172, -1.605101, 1, 1, 1, 1, 1,
-1.731213, 0.3417535, -0.1121957, 1, 1, 1, 1, 1,
-1.700264, 0.448027, -0.9038818, 1, 1, 1, 1, 1,
-1.694412, -1.210804, -0.7129587, 1, 1, 1, 1, 1,
-1.691631, 0.6738657, 0.3971762, 1, 1, 1, 1, 1,
-1.688243, -0.9636609, -2.537918, 1, 1, 1, 1, 1,
-1.687165, -0.2887031, -1.654564, 1, 1, 1, 1, 1,
-1.667569, -1.888961, -3.37202, 1, 1, 1, 1, 1,
-1.664513, 0.523307, 0.1832538, 1, 1, 1, 1, 1,
-1.664233, 0.3241535, -1.954997, 1, 1, 1, 1, 1,
-1.662901, 1.510899, -0.01002263, 1, 1, 1, 1, 1,
-1.661544, -0.4752021, -2.956693, 1, 1, 1, 1, 1,
-1.654644, 0.03224846, -2.87429, 1, 1, 1, 1, 1,
-1.638233, -0.3675432, -3.497161, 0, 0, 1, 1, 1,
-1.614588, 0.1956302, -2.723924, 1, 0, 0, 1, 1,
-1.612235, 0.2898399, -0.6597165, 1, 0, 0, 1, 1,
-1.611364, 1.885416, -1.167125, 1, 0, 0, 1, 1,
-1.609733, -0.1269445, -2.671045, 1, 0, 0, 1, 1,
-1.606169, 0.4430307, -2.203368, 1, 0, 0, 1, 1,
-1.596914, -3.618487, -2.107978, 0, 0, 0, 1, 1,
-1.595028, -1.633105, -1.613904, 0, 0, 0, 1, 1,
-1.590679, 1.283159, -0.5790908, 0, 0, 0, 1, 1,
-1.579079, -0.8300486, -1.855616, 0, 0, 0, 1, 1,
-1.575128, 1.521567, -1.200947, 0, 0, 0, 1, 1,
-1.568622, -0.1602529, -2.295346, 0, 0, 0, 1, 1,
-1.566288, 0.6886603, -0.8132451, 0, 0, 0, 1, 1,
-1.554687, -1.014709, -1.776012, 1, 1, 1, 1, 1,
-1.54615, -1.122478, -1.887925, 1, 1, 1, 1, 1,
-1.543432, 0.5178753, -1.920957, 1, 1, 1, 1, 1,
-1.542638, -0.6374136, -3.200913, 1, 1, 1, 1, 1,
-1.541639, -0.9976535, -3.401619, 1, 1, 1, 1, 1,
-1.532409, 2.108368, -1.725715, 1, 1, 1, 1, 1,
-1.53101, 0.6056907, -0.6668516, 1, 1, 1, 1, 1,
-1.527365, -1.751084, -3.508628, 1, 1, 1, 1, 1,
-1.524685, -0.08396062, -0.8505467, 1, 1, 1, 1, 1,
-1.510402, 1.981172, -0.1313579, 1, 1, 1, 1, 1,
-1.510219, 1.285716, -0.1853219, 1, 1, 1, 1, 1,
-1.500756, 1.16011, -0.9637625, 1, 1, 1, 1, 1,
-1.493704, 2.937854, 0.2250175, 1, 1, 1, 1, 1,
-1.480344, -0.2197644, -2.687893, 1, 1, 1, 1, 1,
-1.477044, 1.32022, 0.58169, 1, 1, 1, 1, 1,
-1.468703, -0.267615, -3.251856, 0, 0, 1, 1, 1,
-1.462695, -0.7669317, -1.898065, 1, 0, 0, 1, 1,
-1.462324, -2.4305, -1.900864, 1, 0, 0, 1, 1,
-1.461461, 2.553763, -0.7601614, 1, 0, 0, 1, 1,
-1.431251, 0.1613642, -1.724789, 1, 0, 0, 1, 1,
-1.428576, 0.3011749, -1.396733, 1, 0, 0, 1, 1,
-1.423386, 0.07203968, 0.4669724, 0, 0, 0, 1, 1,
-1.392492, 0.6393842, -2.249247, 0, 0, 0, 1, 1,
-1.392152, -0.1864101, -1.930231, 0, 0, 0, 1, 1,
-1.374964, -0.7166349, -3.14363, 0, 0, 0, 1, 1,
-1.369277, 0.2165562, -1.857593, 0, 0, 0, 1, 1,
-1.368464, -0.3034906, -0.2105964, 0, 0, 0, 1, 1,
-1.366616, -2.183825, -2.874394, 0, 0, 0, 1, 1,
-1.363645, -0.07760555, -0.1140132, 1, 1, 1, 1, 1,
-1.358892, -0.04473403, -2.542874, 1, 1, 1, 1, 1,
-1.357259, -0.9684073, -1.589341, 1, 1, 1, 1, 1,
-1.350131, -0.1562046, -1.857385, 1, 1, 1, 1, 1,
-1.347314, -0.8052128, -3.671553, 1, 1, 1, 1, 1,
-1.339362, -0.4857651, -0.6188235, 1, 1, 1, 1, 1,
-1.333386, -0.0558998, -2.461334, 1, 1, 1, 1, 1,
-1.317783, 0.5364802, -1.586873, 1, 1, 1, 1, 1,
-1.313601, -0.8690394, -2.882244, 1, 1, 1, 1, 1,
-1.308835, 0.2609845, -0.05464156, 1, 1, 1, 1, 1,
-1.295647, 0.1543789, -0.5115779, 1, 1, 1, 1, 1,
-1.293393, -0.2853514, 0.1442622, 1, 1, 1, 1, 1,
-1.288644, 0.3272147, 0.7197515, 1, 1, 1, 1, 1,
-1.285545, 0.5680414, 0.6092559, 1, 1, 1, 1, 1,
-1.284026, 0.6455668, -0.5849326, 1, 1, 1, 1, 1,
-1.280205, -2.027564, -2.330017, 0, 0, 1, 1, 1,
-1.272568, 0.6316229, -0.883982, 1, 0, 0, 1, 1,
-1.261255, 0.7695788, -1.982033, 1, 0, 0, 1, 1,
-1.258227, 1.042639, -1.709261, 1, 0, 0, 1, 1,
-1.255756, -0.9636694, -2.697495, 1, 0, 0, 1, 1,
-1.255674, -0.6292681, -2.009666, 1, 0, 0, 1, 1,
-1.255225, -1.136259, -3.023937, 0, 0, 0, 1, 1,
-1.252495, -0.8377609, -3.740824, 0, 0, 0, 1, 1,
-1.252248, 1.787542, -2.180542, 0, 0, 0, 1, 1,
-1.242598, -0.4504124, -1.608166, 0, 0, 0, 1, 1,
-1.237085, -0.02503065, -2.47212, 0, 0, 0, 1, 1,
-1.205657, -0.2764789, -3.206772, 0, 0, 0, 1, 1,
-1.198967, 0.3095739, -4.195653, 0, 0, 0, 1, 1,
-1.195652, 0.7731666, 1.089007, 1, 1, 1, 1, 1,
-1.192654, -0.9809921, -2.719852, 1, 1, 1, 1, 1,
-1.190502, 1.281599, -0.3451068, 1, 1, 1, 1, 1,
-1.187703, -0.7679158, -3.725585, 1, 1, 1, 1, 1,
-1.185127, 1.456691, -1.494314, 1, 1, 1, 1, 1,
-1.179574, 0.004345705, -2.594935, 1, 1, 1, 1, 1,
-1.17633, 0.264488, -0.8449423, 1, 1, 1, 1, 1,
-1.171677, 0.2632781, -0.6947585, 1, 1, 1, 1, 1,
-1.167482, 0.1661649, -1.380522, 1, 1, 1, 1, 1,
-1.165235, -0.1451372, -1.790848, 1, 1, 1, 1, 1,
-1.153451, 1.28551, -2.705326, 1, 1, 1, 1, 1,
-1.150511, 0.04595148, -1.091826, 1, 1, 1, 1, 1,
-1.145234, -1.869741, -2.728499, 1, 1, 1, 1, 1,
-1.13964, -0.5824991, -1.053425, 1, 1, 1, 1, 1,
-1.139389, 1.620211, -0.3297532, 1, 1, 1, 1, 1,
-1.137359, 1.212907, -0.8035508, 0, 0, 1, 1, 1,
-1.134064, -0.1013544, 0.9573479, 1, 0, 0, 1, 1,
-1.133291, 1.456585, 0.07126069, 1, 0, 0, 1, 1,
-1.129539, -0.06005631, -0.385623, 1, 0, 0, 1, 1,
-1.127016, 0.5995374, -1.087177, 1, 0, 0, 1, 1,
-1.123643, 0.5614775, 0.7184299, 1, 0, 0, 1, 1,
-1.119684, 1.225371, -0.6751649, 0, 0, 0, 1, 1,
-1.106345, -0.7964007, -4.314075, 0, 0, 0, 1, 1,
-1.099572, 2.432683, -0.01725499, 0, 0, 0, 1, 1,
-1.099181, 0.7906885, -3.354651, 0, 0, 0, 1, 1,
-1.094269, 0.949458, 0.3753774, 0, 0, 0, 1, 1,
-1.093562, -0.2447229, 0.9316295, 0, 0, 0, 1, 1,
-1.092049, -1.901673, -4.464885, 0, 0, 0, 1, 1,
-1.0848, -0.4125205, -1.451516, 1, 1, 1, 1, 1,
-1.082735, 0.1762529, -2.082059, 1, 1, 1, 1, 1,
-1.08192, 1.000871, -2.007717, 1, 1, 1, 1, 1,
-1.079242, -0.2012888, -2.097655, 1, 1, 1, 1, 1,
-1.073194, 0.8409755, -2.32548, 1, 1, 1, 1, 1,
-1.070222, -0.2072896, -1.706831, 1, 1, 1, 1, 1,
-1.06941, 1.075853, -1.353425, 1, 1, 1, 1, 1,
-1.068981, 0.5571582, -1.881412, 1, 1, 1, 1, 1,
-1.068756, 1.94557, -1.563052, 1, 1, 1, 1, 1,
-1.063762, -1.589222, -2.333336, 1, 1, 1, 1, 1,
-1.062533, -0.8484003, -2.372114, 1, 1, 1, 1, 1,
-1.055166, -1.090592, -2.352011, 1, 1, 1, 1, 1,
-1.049458, -1.4811, -3.058687, 1, 1, 1, 1, 1,
-1.045157, -0.007807307, -0.3797869, 1, 1, 1, 1, 1,
-1.043234, -0.7400228, -2.319314, 1, 1, 1, 1, 1,
-1.036783, 0.8498772, 0.1882202, 0, 0, 1, 1, 1,
-1.033621, 1.369404, -1.460432, 1, 0, 0, 1, 1,
-1.029945, -0.805804, -2.854179, 1, 0, 0, 1, 1,
-1.027287, -1.938949, -4.201622, 1, 0, 0, 1, 1,
-1.025001, -0.6320961, -3.101512, 1, 0, 0, 1, 1,
-1.017799, -0.8641173, -2.825922, 1, 0, 0, 1, 1,
-1.016993, 0.7812553, -0.1814807, 0, 0, 0, 1, 1,
-1.014099, 1.074939, -0.7159087, 0, 0, 0, 1, 1,
-1.004315, -0.467367, -1.060317, 0, 0, 0, 1, 1,
-0.9987732, 0.1050951, -2.023643, 0, 0, 0, 1, 1,
-0.996689, -0.6195462, -3.170744, 0, 0, 0, 1, 1,
-0.9953488, -0.2170503, -4.303138, 0, 0, 0, 1, 1,
-0.9942614, 0.8332817, -1.415683, 0, 0, 0, 1, 1,
-0.9925687, 0.8520203, -0.1764455, 1, 1, 1, 1, 1,
-0.9893305, 0.9768093, -1.444212, 1, 1, 1, 1, 1,
-0.9769335, -1.551748, -2.927954, 1, 1, 1, 1, 1,
-0.9744983, -1.194923, -3.280066, 1, 1, 1, 1, 1,
-0.9698554, 0.09168459, -1.631211, 1, 1, 1, 1, 1,
-0.9664377, 0.3293005, -3.050884, 1, 1, 1, 1, 1,
-0.9590699, 1.410397, -1.035022, 1, 1, 1, 1, 1,
-0.9535041, 1.307606, -0.199777, 1, 1, 1, 1, 1,
-0.9463813, 0.6097888, -0.9354568, 1, 1, 1, 1, 1,
-0.9451466, 0.9303544, 0.2135938, 1, 1, 1, 1, 1,
-0.9324906, 1.081364, -0.9103616, 1, 1, 1, 1, 1,
-0.9311554, 0.4614536, -0.07542641, 1, 1, 1, 1, 1,
-0.9284452, -0.6409971, -1.843617, 1, 1, 1, 1, 1,
-0.9255282, -0.4411775, -2.486403, 1, 1, 1, 1, 1,
-0.9229178, -0.7519031, -2.172899, 1, 1, 1, 1, 1,
-0.9203863, -1.196595, -3.191266, 0, 0, 1, 1, 1,
-0.9169092, 0.3072534, 0.7632791, 1, 0, 0, 1, 1,
-0.9140632, 0.5128002, -3.091364, 1, 0, 0, 1, 1,
-0.9098209, 0.1364142, -1.57372, 1, 0, 0, 1, 1,
-0.9034957, 0.39639, -0.9843655, 1, 0, 0, 1, 1,
-0.901924, -0.2493661, -1.927632, 1, 0, 0, 1, 1,
-0.9015817, 2.025717, -1.883554, 0, 0, 0, 1, 1,
-0.8798465, -0.002865701, -1.466756, 0, 0, 0, 1, 1,
-0.8781387, -0.1035568, -2.848982, 0, 0, 0, 1, 1,
-0.8778205, 0.7135684, -0.05145255, 0, 0, 0, 1, 1,
-0.8683512, -0.7068519, -4.300878, 0, 0, 0, 1, 1,
-0.8664813, 0.7333955, -1.760833, 0, 0, 0, 1, 1,
-0.8616868, 0.04225734, 0.1312544, 0, 0, 0, 1, 1,
-0.8596163, 0.9933231, -0.2868153, 1, 1, 1, 1, 1,
-0.8511716, -0.5617496, -2.104213, 1, 1, 1, 1, 1,
-0.8479692, 0.08046269, -0.7105519, 1, 1, 1, 1, 1,
-0.8454205, 0.259564, -2.021639, 1, 1, 1, 1, 1,
-0.843001, -0.2773661, -2.132067, 1, 1, 1, 1, 1,
-0.8371147, -0.9926069, -1.641328, 1, 1, 1, 1, 1,
-0.827978, 0.2865684, -0.1592366, 1, 1, 1, 1, 1,
-0.8255782, 1.131205, -1.091009, 1, 1, 1, 1, 1,
-0.8245523, 0.2077114, -0.275282, 1, 1, 1, 1, 1,
-0.8200473, -0.3242727, -2.272004, 1, 1, 1, 1, 1,
-0.8183083, 1.174717, 0.1354239, 1, 1, 1, 1, 1,
-0.8141863, -0.01593513, -2.233642, 1, 1, 1, 1, 1,
-0.807343, -0.4041469, -2.65316, 1, 1, 1, 1, 1,
-0.7884682, 0.6660488, -1.14587, 1, 1, 1, 1, 1,
-0.7854092, -0.4750587, -2.769427, 1, 1, 1, 1, 1,
-0.7825722, 1.462107, -0.755586, 0, 0, 1, 1, 1,
-0.7793239, 2.629759, 1.145273, 1, 0, 0, 1, 1,
-0.7693891, -0.720278, -4.269231, 1, 0, 0, 1, 1,
-0.7688994, 1.321686, 0.7933574, 1, 0, 0, 1, 1,
-0.7656804, -0.4796908, -2.610281, 1, 0, 0, 1, 1,
-0.762018, -0.3622767, -3.908408, 1, 0, 0, 1, 1,
-0.7618179, -1.104525, -3.576215, 0, 0, 0, 1, 1,
-0.7608292, -1.810607, -2.621212, 0, 0, 0, 1, 1,
-0.7605913, 0.7012911, -1.703515, 0, 0, 0, 1, 1,
-0.7576678, -1.721342, -2.453707, 0, 0, 0, 1, 1,
-0.7568123, 0.01798813, -1.089754, 0, 0, 0, 1, 1,
-0.7556149, 0.2408825, -1.887429, 0, 0, 0, 1, 1,
-0.7512124, -0.8719268, -2.793505, 0, 0, 0, 1, 1,
-0.7434616, -0.4245102, -2.813023, 1, 1, 1, 1, 1,
-0.7389724, 0.01661137, -2.105552, 1, 1, 1, 1, 1,
-0.7353101, -0.2051708, -1.235958, 1, 1, 1, 1, 1,
-0.7346429, -1.611157, -1.948724, 1, 1, 1, 1, 1,
-0.7343593, -0.9942157, -2.235897, 1, 1, 1, 1, 1,
-0.7308469, 3.20319, -1.178463, 1, 1, 1, 1, 1,
-0.7269896, -1.134043, -2.385539, 1, 1, 1, 1, 1,
-0.7231032, 1.039444, 0.6670563, 1, 1, 1, 1, 1,
-0.7211807, -1.015846, -2.35748, 1, 1, 1, 1, 1,
-0.7183242, 2.533629, -0.6051848, 1, 1, 1, 1, 1,
-0.7154424, 1.251295, -0.1465807, 1, 1, 1, 1, 1,
-0.713281, -0.7183778, -2.809368, 1, 1, 1, 1, 1,
-0.7116899, -0.5551614, -2.694808, 1, 1, 1, 1, 1,
-0.7086712, 1.252239, -0.3877516, 1, 1, 1, 1, 1,
-0.7041994, 0.1673336, -1.423806, 1, 1, 1, 1, 1,
-0.7029286, -0.07021052, -1.934105, 0, 0, 1, 1, 1,
-0.6938679, -0.3309473, -2.936662, 1, 0, 0, 1, 1,
-0.6883083, 0.9275652, -1.077559, 1, 0, 0, 1, 1,
-0.6831881, -1.956569, -2.545339, 1, 0, 0, 1, 1,
-0.6738961, -1.491717, -2.593654, 1, 0, 0, 1, 1,
-0.6685854, 2.020756, -0.2275357, 1, 0, 0, 1, 1,
-0.6670218, -0.1499038, -2.030284, 0, 0, 0, 1, 1,
-0.6660184, -0.3680792, -0.6580797, 0, 0, 0, 1, 1,
-0.6630061, -1.678028, -0.9064955, 0, 0, 0, 1, 1,
-0.6578956, -0.8697417, -3.025009, 0, 0, 0, 1, 1,
-0.6563094, -1.139068, -2.552579, 0, 0, 0, 1, 1,
-0.6527127, 1.491234, 0.4105257, 0, 0, 0, 1, 1,
-0.6392788, 0.3618001, -1.549946, 0, 0, 0, 1, 1,
-0.6389149, -0.4826393, -2.206819, 1, 1, 1, 1, 1,
-0.6377074, 0.201673, -0.3173743, 1, 1, 1, 1, 1,
-0.6354743, 1.037891, 0.7493451, 1, 1, 1, 1, 1,
-0.6276127, -0.5426956, -1.203637, 1, 1, 1, 1, 1,
-0.6265073, -0.2476357, -0.7918891, 1, 1, 1, 1, 1,
-0.6256089, 1.113718, -0.6417612, 1, 1, 1, 1, 1,
-0.6253384, -0.5765272, -1.770479, 1, 1, 1, 1, 1,
-0.623464, 1.390742, -0.729686, 1, 1, 1, 1, 1,
-0.6192902, -1.64948, -1.326383, 1, 1, 1, 1, 1,
-0.618379, 0.6812731, -0.8603188, 1, 1, 1, 1, 1,
-0.6181839, 0.2077027, -2.795632, 1, 1, 1, 1, 1,
-0.6138382, 0.9419973, 0.8462557, 1, 1, 1, 1, 1,
-0.6104277, 0.5173473, -1.463806, 1, 1, 1, 1, 1,
-0.6079637, -0.5163319, -1.649453, 1, 1, 1, 1, 1,
-0.6068954, -0.1769231, -1.684811, 1, 1, 1, 1, 1,
-0.6042341, -1.257445, -1.357363, 0, 0, 1, 1, 1,
-0.6026253, -0.08088537, -1.349674, 1, 0, 0, 1, 1,
-0.6018394, -0.5934078, -1.317839, 1, 0, 0, 1, 1,
-0.5929002, -0.9697132, -0.7289125, 1, 0, 0, 1, 1,
-0.5912735, -0.1741372, -0.5554931, 1, 0, 0, 1, 1,
-0.5764681, -0.5891287, -1.212727, 1, 0, 0, 1, 1,
-0.5756214, 0.8579676, -1.735046, 0, 0, 0, 1, 1,
-0.5748853, -0.7455791, -3.33474, 0, 0, 0, 1, 1,
-0.5655737, 0.3732851, 0.4838329, 0, 0, 0, 1, 1,
-0.5637013, -0.5597631, -2.055147, 0, 0, 0, 1, 1,
-0.5603642, 0.8348018, -1.08657, 0, 0, 0, 1, 1,
-0.5579744, 2.737612, -0.5169111, 0, 0, 0, 1, 1,
-0.5576573, 0.6923059, -0.6442908, 0, 0, 0, 1, 1,
-0.5528904, 0.6618084, -1.462532, 1, 1, 1, 1, 1,
-0.551263, 0.6994676, 0.03801225, 1, 1, 1, 1, 1,
-0.5510234, 0.7280578, -3.25593, 1, 1, 1, 1, 1,
-0.5490559, -1.013001, -1.303903, 1, 1, 1, 1, 1,
-0.5474076, -0.05730729, -0.8937559, 1, 1, 1, 1, 1,
-0.5431477, 1.145293, -0.9143971, 1, 1, 1, 1, 1,
-0.5391348, 0.3481648, 0.01298976, 1, 1, 1, 1, 1,
-0.5382303, -0.9599804, -2.200231, 1, 1, 1, 1, 1,
-0.5368995, -0.2813468, -2.919585, 1, 1, 1, 1, 1,
-0.5363827, 0.679545, -0.8590555, 1, 1, 1, 1, 1,
-0.5209588, 1.332477, -1.474246, 1, 1, 1, 1, 1,
-0.5206636, 1.20471, 0.8778487, 1, 1, 1, 1, 1,
-0.5134164, -0.2033418, -1.503183, 1, 1, 1, 1, 1,
-0.5130616, 1.097346, -0.8850106, 1, 1, 1, 1, 1,
-0.5084446, -1.607564, -1.53979, 1, 1, 1, 1, 1,
-0.505724, -1.470671, -1.683025, 0, 0, 1, 1, 1,
-0.5056472, -1.553808, -3.118268, 1, 0, 0, 1, 1,
-0.4990887, -0.6731505, -2.810981, 1, 0, 0, 1, 1,
-0.4978992, 0.2348304, -2.586309, 1, 0, 0, 1, 1,
-0.4975859, 0.4807043, -1.486267, 1, 0, 0, 1, 1,
-0.49753, -1.586884, -3.992727, 1, 0, 0, 1, 1,
-0.4966907, -1.13604, -3.432632, 0, 0, 0, 1, 1,
-0.4946957, -0.7243363, -1.467243, 0, 0, 0, 1, 1,
-0.4915222, 0.3187498, -1.249605, 0, 0, 0, 1, 1,
-0.4907581, 0.7215575, -2.775287, 0, 0, 0, 1, 1,
-0.4872049, 0.2258258, -1.916404, 0, 0, 0, 1, 1,
-0.4850371, -0.7504285, -3.216191, 0, 0, 0, 1, 1,
-0.4826632, 0.4368111, 0.2380058, 0, 0, 0, 1, 1,
-0.4826443, 1.82153, -1.080465, 1, 1, 1, 1, 1,
-0.4818183, -2.624973, -1.918087, 1, 1, 1, 1, 1,
-0.4669815, -1.908333, -2.255028, 1, 1, 1, 1, 1,
-0.466215, -0.7610754, -2.773957, 1, 1, 1, 1, 1,
-0.462056, 2.503405, -1.17677, 1, 1, 1, 1, 1,
-0.4554491, -0.4484781, -2.174266, 1, 1, 1, 1, 1,
-0.4499977, 1.082523, 0.4628138, 1, 1, 1, 1, 1,
-0.4495731, 0.1923808, -0.3034286, 1, 1, 1, 1, 1,
-0.4490979, 0.555372, -0.5185218, 1, 1, 1, 1, 1,
-0.443614, -0.4766283, -4.583864, 1, 1, 1, 1, 1,
-0.44004, 0.2153035, -0.6317063, 1, 1, 1, 1, 1,
-0.4337105, 1.787886, 1.032182, 1, 1, 1, 1, 1,
-0.4322467, 0.8036255, -0.02884438, 1, 1, 1, 1, 1,
-0.4202392, 1.05184, -0.4128772, 1, 1, 1, 1, 1,
-0.417431, -2.067172, -2.244416, 1, 1, 1, 1, 1,
-0.4132727, 0.05922115, -1.601053, 0, 0, 1, 1, 1,
-0.4103451, 0.3457954, -1.772559, 1, 0, 0, 1, 1,
-0.4073426, -0.4031, -0.8594736, 1, 0, 0, 1, 1,
-0.4073278, 0.6529839, -1.575843, 1, 0, 0, 1, 1,
-0.4043862, -0.713664, -2.091544, 1, 0, 0, 1, 1,
-0.4040436, -0.323146, -1.400038, 1, 0, 0, 1, 1,
-0.4002546, 0.3234259, -2.808709, 0, 0, 0, 1, 1,
-0.3989298, -1.639189, -2.356558, 0, 0, 0, 1, 1,
-0.396924, -0.1822825, 0.03543564, 0, 0, 0, 1, 1,
-0.3930052, -1.068772, -1.800977, 0, 0, 0, 1, 1,
-0.3881706, 0.3192278, -1.657644, 0, 0, 0, 1, 1,
-0.3877989, -1.572735, -3.370347, 0, 0, 0, 1, 1,
-0.3783708, -2.557137, -3.805264, 0, 0, 0, 1, 1,
-0.3776539, -0.5284925, -3.749125, 1, 1, 1, 1, 1,
-0.3739889, 1.475338, -0.3615029, 1, 1, 1, 1, 1,
-0.3717066, 1.438089, -1.064996, 1, 1, 1, 1, 1,
-0.3710177, 0.3825702, 0.4453027, 1, 1, 1, 1, 1,
-0.3708002, 1.071444, -1.374591, 1, 1, 1, 1, 1,
-0.3702952, -0.6452553, -4.477719, 1, 1, 1, 1, 1,
-0.3693736, -0.03955321, -1.997521, 1, 1, 1, 1, 1,
-0.3630657, 0.4021858, -1.743474, 1, 1, 1, 1, 1,
-0.357677, 0.6364005, -1.56007, 1, 1, 1, 1, 1,
-0.3568748, 0.4121905, 0.04621774, 1, 1, 1, 1, 1,
-0.3548706, -1.565679, -2.880792, 1, 1, 1, 1, 1,
-0.3522378, 2.389562, 0.5441301, 1, 1, 1, 1, 1,
-0.3417148, -0.192476, -2.198849, 1, 1, 1, 1, 1,
-0.3407509, -0.2000764, -1.813732, 1, 1, 1, 1, 1,
-0.3394556, -0.59408, -1.40314, 1, 1, 1, 1, 1,
-0.3377292, -0.09747357, -2.401524, 0, 0, 1, 1, 1,
-0.3335891, 0.4704278, -0.0299599, 1, 0, 0, 1, 1,
-0.3259777, -0.3720721, -1.83511, 1, 0, 0, 1, 1,
-0.3241836, -0.4352494, -2.527975, 1, 0, 0, 1, 1,
-0.3233432, 0.02297944, -3.079062, 1, 0, 0, 1, 1,
-0.3220762, -0.358914, -2.153747, 1, 0, 0, 1, 1,
-0.3215519, 1.212851, -1.20526, 0, 0, 0, 1, 1,
-0.3193427, 1.83354, -0.5469142, 0, 0, 0, 1, 1,
-0.3130699, 0.1200797, -0.1444437, 0, 0, 0, 1, 1,
-0.2975332, 1.130358, -0.3306938, 0, 0, 0, 1, 1,
-0.2891648, -0.6890453, -1.848287, 0, 0, 0, 1, 1,
-0.2889898, -0.6976716, -4.094835, 0, 0, 0, 1, 1,
-0.286191, -1.113534, -2.750415, 0, 0, 0, 1, 1,
-0.2850311, -1.006142, -1.732207, 1, 1, 1, 1, 1,
-0.2841706, -1.708472, -2.371711, 1, 1, 1, 1, 1,
-0.283913, 1.190446, -0.5132951, 1, 1, 1, 1, 1,
-0.2761844, -0.4424897, -2.581805, 1, 1, 1, 1, 1,
-0.2746044, -1.419347, -3.300497, 1, 1, 1, 1, 1,
-0.2709552, 0.5677513, 0.3982163, 1, 1, 1, 1, 1,
-0.2693994, -0.1931338, -1.987316, 1, 1, 1, 1, 1,
-0.2656936, -0.4856907, -0.845504, 1, 1, 1, 1, 1,
-0.2628362, 1.857628, -0.6595846, 1, 1, 1, 1, 1,
-0.2587946, 0.1255616, 0.5716349, 1, 1, 1, 1, 1,
-0.2572866, 0.5515128, -1.349489, 1, 1, 1, 1, 1,
-0.2544755, -1.20094, -3.256935, 1, 1, 1, 1, 1,
-0.2533968, 0.446622, -1.263147, 1, 1, 1, 1, 1,
-0.2533874, -1.130521, -1.722848, 1, 1, 1, 1, 1,
-0.2486582, -0.829137, -2.045632, 1, 1, 1, 1, 1,
-0.248217, -0.4979663, -0.7886055, 0, 0, 1, 1, 1,
-0.2474941, -0.4353307, -2.736135, 1, 0, 0, 1, 1,
-0.2456064, -0.8431783, -3.185374, 1, 0, 0, 1, 1,
-0.2449797, -1.114119, -3.124989, 1, 0, 0, 1, 1,
-0.2423647, 0.3130201, 0.6717765, 1, 0, 0, 1, 1,
-0.2409132, -1.13263, -0.5101136, 1, 0, 0, 1, 1,
-0.2403388, -0.2883014, -2.786714, 0, 0, 0, 1, 1,
-0.2389382, -1.898229, -2.935791, 0, 0, 0, 1, 1,
-0.2374815, 0.6478227, -2.426167, 0, 0, 0, 1, 1,
-0.2336576, 0.1284231, -0.705929, 0, 0, 0, 1, 1,
-0.2312514, 0.878512, -1.554217, 0, 0, 0, 1, 1,
-0.2274941, -2.001415, -3.112209, 0, 0, 0, 1, 1,
-0.2268771, -0.01787338, -2.196754, 0, 0, 0, 1, 1,
-0.2258221, 0.9229354, -0.3506162, 1, 1, 1, 1, 1,
-0.2255507, -1.139131, -3.208346, 1, 1, 1, 1, 1,
-0.2179512, -1.441253, -4.138415, 1, 1, 1, 1, 1,
-0.2179271, -0.1373012, -3.097751, 1, 1, 1, 1, 1,
-0.2174287, -0.2746969, -1.922504, 1, 1, 1, 1, 1,
-0.2156474, -3.010672, -1.994237, 1, 1, 1, 1, 1,
-0.215332, 1.093343, 1.024228, 1, 1, 1, 1, 1,
-0.2130713, -0.6272063, -1.43834, 1, 1, 1, 1, 1,
-0.2123768, 0.9369825, -0.1008959, 1, 1, 1, 1, 1,
-0.2103834, -1.10073, -1.61549, 1, 1, 1, 1, 1,
-0.2057405, -0.3692965, -4.119943, 1, 1, 1, 1, 1,
-0.1969023, 0.6096449, 1.162626, 1, 1, 1, 1, 1,
-0.1916871, 0.2626699, 0.5525133, 1, 1, 1, 1, 1,
-0.1896673, -0.808028, -1.999599, 1, 1, 1, 1, 1,
-0.1882917, 0.2298153, -1.28344, 1, 1, 1, 1, 1,
-0.1881752, -1.168768, -3.649994, 0, 0, 1, 1, 1,
-0.1806565, 0.8358458, -1.372815, 1, 0, 0, 1, 1,
-0.1761502, -0.4374035, -2.357296, 1, 0, 0, 1, 1,
-0.1736147, 0.2627544, 0.5343966, 1, 0, 0, 1, 1,
-0.167242, 0.3738207, -0.05465547, 1, 0, 0, 1, 1,
-0.1649434, -0.299627, -2.625784, 1, 0, 0, 1, 1,
-0.1612927, 0.1680283, -1.796445, 0, 0, 0, 1, 1,
-0.157292, -1.688626, -5.093442, 0, 0, 0, 1, 1,
-0.1540632, -1.017439, -2.942389, 0, 0, 0, 1, 1,
-0.1539443, -1.127476, -3.309914, 0, 0, 0, 1, 1,
-0.1536026, 0.0835124, -0.9324482, 0, 0, 0, 1, 1,
-0.1532714, 0.0934381, -1.395759, 0, 0, 0, 1, 1,
-0.1524078, 0.2189714, -0.4215473, 0, 0, 0, 1, 1,
-0.1501096, 1.441815, -0.7454479, 1, 1, 1, 1, 1,
-0.1500966, -0.05183565, -2.179942, 1, 1, 1, 1, 1,
-0.1499633, 1.188616, 0.2270431, 1, 1, 1, 1, 1,
-0.1487448, -0.3969699, -1.937517, 1, 1, 1, 1, 1,
-0.1442636, 0.3420101, 1.470778, 1, 1, 1, 1, 1,
-0.1436249, -0.4919414, -2.945215, 1, 1, 1, 1, 1,
-0.140945, 0.1527299, -1.468077, 1, 1, 1, 1, 1,
-0.1391817, 0.9670826, -0.9453964, 1, 1, 1, 1, 1,
-0.135511, -1.073416, -4.243623, 1, 1, 1, 1, 1,
-0.129487, -2.149594, -2.364114, 1, 1, 1, 1, 1,
-0.1245873, -1.124082, -3.605524, 1, 1, 1, 1, 1,
-0.1226419, 0.5584531, -1.353488, 1, 1, 1, 1, 1,
-0.1221213, 0.5290794, 1.313203, 1, 1, 1, 1, 1,
-0.1132995, 0.8239847, -0.418678, 1, 1, 1, 1, 1,
-0.1100041, 1.409249, 0.5549169, 1, 1, 1, 1, 1,
-0.1082613, -0.7150143, -3.99544, 0, 0, 1, 1, 1,
-0.1034826, -0.7234792, -1.515652, 1, 0, 0, 1, 1,
-0.1025736, -1.190651, -3.333842, 1, 0, 0, 1, 1,
-0.09506609, 0.5471209, -2.506412, 1, 0, 0, 1, 1,
-0.0931571, -1.861821, -4.131588, 1, 0, 0, 1, 1,
-0.09083591, -1.415998, -4.182199, 1, 0, 0, 1, 1,
-0.08629254, 1.181234, -0.4240994, 0, 0, 0, 1, 1,
-0.0842101, 0.4099247, 0.9917525, 0, 0, 0, 1, 1,
-0.07049046, -0.7330751, -2.156498, 0, 0, 0, 1, 1,
-0.06986085, -0.9751027, -4.452911, 0, 0, 0, 1, 1,
-0.06893583, -0.05110108, -1.105505, 0, 0, 0, 1, 1,
-0.06819507, 0.9226728, -1.493384, 0, 0, 0, 1, 1,
-0.0665495, 1.814687, 1.26028, 0, 0, 0, 1, 1,
-0.06579646, -1.213513, -1.795251, 1, 1, 1, 1, 1,
-0.0626945, -0.1649809, -3.331748, 1, 1, 1, 1, 1,
-0.06235476, -0.8934271, -3.686435, 1, 1, 1, 1, 1,
-0.05821961, -0.2053208, -2.138673, 1, 1, 1, 1, 1,
-0.05508205, -0.8309011, -2.898375, 1, 1, 1, 1, 1,
-0.05223221, -0.6968295, -2.225734, 1, 1, 1, 1, 1,
-0.05042353, 0.6488581, -1.239, 1, 1, 1, 1, 1,
-0.04896319, 0.3313569, 0.5795858, 1, 1, 1, 1, 1,
-0.0469777, -0.1356961, -1.771633, 1, 1, 1, 1, 1,
-0.04674329, 1.403237, -0.2360922, 1, 1, 1, 1, 1,
-0.04550912, -1.116659, -2.384001, 1, 1, 1, 1, 1,
-0.0440766, -0.04379197, -2.562089, 1, 1, 1, 1, 1,
-0.04246742, 1.192364, -2.002825, 1, 1, 1, 1, 1,
-0.04209206, -0.6514499, -4.558815, 1, 1, 1, 1, 1,
-0.03665326, -1.006617, -1.73883, 1, 1, 1, 1, 1,
-0.0344802, 1.830427, 1.601328, 0, 0, 1, 1, 1,
-0.03102843, 0.6277562, 0.8023399, 1, 0, 0, 1, 1,
-0.03004232, 0.1850951, 0.3775408, 1, 0, 0, 1, 1,
-0.02904373, -1.202049, -3.604731, 1, 0, 0, 1, 1,
-0.02704646, 0.150972, 0.2988821, 1, 0, 0, 1, 1,
-0.02598322, -0.7972937, -2.153198, 1, 0, 0, 1, 1,
-0.02487523, 2.148256, -0.789164, 0, 0, 0, 1, 1,
-0.02194702, 0.7765351, -0.2342469, 0, 0, 0, 1, 1,
-0.02106068, -1.521867, -3.052978, 0, 0, 0, 1, 1,
-0.006863053, -0.3385917, -2.869919, 0, 0, 0, 1, 1,
-0.004997446, 0.6371806, -0.5931218, 0, 0, 0, 1, 1,
-0.002440246, -0.4595717, -3.359582, 0, 0, 0, 1, 1,
-0.0001620475, 0.4963954, -0.5493884, 0, 0, 0, 1, 1,
0.0003026309, -0.01642183, 3.052392, 1, 1, 1, 1, 1,
0.0008672323, 1.259635, -1.541145, 1, 1, 1, 1, 1,
0.001810709, -1.438713, 4.187267, 1, 1, 1, 1, 1,
0.002548603, 1.262687, -0.2080441, 1, 1, 1, 1, 1,
0.005386202, 0.3163965, -0.2301116, 1, 1, 1, 1, 1,
0.005624434, 0.09062821, 0.4576588, 1, 1, 1, 1, 1,
0.006481591, 0.4027736, -1.635776, 1, 1, 1, 1, 1,
0.007384611, 0.4016654, 1.771774, 1, 1, 1, 1, 1,
0.01321617, 1.95374, -0.1121521, 1, 1, 1, 1, 1,
0.01401018, -0.9432459, 2.06313, 1, 1, 1, 1, 1,
0.01420756, -0.2228895, 1.856252, 1, 1, 1, 1, 1,
0.01608071, -1.38875, 3.280695, 1, 1, 1, 1, 1,
0.0201264, -0.03901558, 3.797964, 1, 1, 1, 1, 1,
0.02439321, -0.3008562, 2.545757, 1, 1, 1, 1, 1,
0.03116206, -1.704959, 4.130167, 1, 1, 1, 1, 1,
0.03141104, -1.739926, 2.342622, 0, 0, 1, 1, 1,
0.03262228, -1.217549, 3.608781, 1, 0, 0, 1, 1,
0.03306446, -0.6483576, 3.248729, 1, 0, 0, 1, 1,
0.0349247, 0.6601676, 1.27915, 1, 0, 0, 1, 1,
0.03793245, 0.2250835, 1.484159, 1, 0, 0, 1, 1,
0.03999356, -0.3435123, 2.499917, 1, 0, 0, 1, 1,
0.04447436, 0.3274653, -0.2944816, 0, 0, 0, 1, 1,
0.05351194, -0.2426283, 2.548594, 0, 0, 0, 1, 1,
0.05820953, -1.530897, 3.28038, 0, 0, 0, 1, 1,
0.06535398, 0.4746578, -0.964089, 0, 0, 0, 1, 1,
0.06622824, -1.052475, 3.680915, 0, 0, 0, 1, 1,
0.0665529, -0.04843154, 0.81477, 0, 0, 0, 1, 1,
0.06761798, 0.2675331, 0.815444, 0, 0, 0, 1, 1,
0.06905128, -0.6310343, 3.730707, 1, 1, 1, 1, 1,
0.07011555, -0.008421467, 1.954661, 1, 1, 1, 1, 1,
0.07127724, -0.2646607, 2.792515, 1, 1, 1, 1, 1,
0.07168574, 0.2294302, -0.07219917, 1, 1, 1, 1, 1,
0.07249512, -0.1012421, 3.424781, 1, 1, 1, 1, 1,
0.07339162, -0.05345355, 2.737709, 1, 1, 1, 1, 1,
0.079226, -0.01502407, 2.431583, 1, 1, 1, 1, 1,
0.08175338, 0.6737493, -0.399693, 1, 1, 1, 1, 1,
0.08552372, -0.3513224, 2.347559, 1, 1, 1, 1, 1,
0.09383734, -0.4604692, 2.334656, 1, 1, 1, 1, 1,
0.1000452, -0.8477669, 1.154976, 1, 1, 1, 1, 1,
0.1065888, -0.2250113, 2.6541, 1, 1, 1, 1, 1,
0.1090637, -1.075386, 2.309532, 1, 1, 1, 1, 1,
0.1094215, 1.077814, -0.5718197, 1, 1, 1, 1, 1,
0.1111121, -1.497527, 1.684519, 1, 1, 1, 1, 1,
0.1118319, 0.5381199, -0.3004566, 0, 0, 1, 1, 1,
0.112466, -0.85871, 0.902014, 1, 0, 0, 1, 1,
0.1167666, -0.5595115, 2.486568, 1, 0, 0, 1, 1,
0.1260877, 0.05014677, 1.0192, 1, 0, 0, 1, 1,
0.1267318, 0.6325465, -0.4674048, 1, 0, 0, 1, 1,
0.1310157, -0.3007281, 2.617148, 1, 0, 0, 1, 1,
0.1337824, -1.545669, 3.277165, 0, 0, 0, 1, 1,
0.1389895, -1.564236, 1.555982, 0, 0, 0, 1, 1,
0.1444292, -0.5079941, 1.356361, 0, 0, 0, 1, 1,
0.1446005, -0.3547387, 4.143314, 0, 0, 0, 1, 1,
0.1446241, 0.4097825, -0.9093812, 0, 0, 0, 1, 1,
0.1456055, -1.853478, 3.424249, 0, 0, 0, 1, 1,
0.1478998, 0.8209509, 2.319556, 0, 0, 0, 1, 1,
0.1506978, -0.1312514, 2.769476, 1, 1, 1, 1, 1,
0.1575679, -1.536768, 1.852044, 1, 1, 1, 1, 1,
0.1618767, 1.047387, 1.416908, 1, 1, 1, 1, 1,
0.1698087, 1.553131, 0.5550981, 1, 1, 1, 1, 1,
0.1757161, 0.6965395, -2.026137, 1, 1, 1, 1, 1,
0.1772847, -0.1956749, 3.469572, 1, 1, 1, 1, 1,
0.1809357, 1.597529, -1.637305, 1, 1, 1, 1, 1,
0.1857338, -0.9770607, 2.896786, 1, 1, 1, 1, 1,
0.1902043, -0.2695649, 2.308353, 1, 1, 1, 1, 1,
0.1904754, 0.02611097, -0.2812577, 1, 1, 1, 1, 1,
0.1920383, -0.2770522, 3.987336, 1, 1, 1, 1, 1,
0.196306, 2.092233, 0.6780258, 1, 1, 1, 1, 1,
0.1973414, -1.467713, 3.111126, 1, 1, 1, 1, 1,
0.1981158, 0.5291387, -1.219273, 1, 1, 1, 1, 1,
0.2064974, -0.9290045, 3.488041, 1, 1, 1, 1, 1,
0.2067963, 0.1327319, 2.083591, 0, 0, 1, 1, 1,
0.2073822, 0.04377002, -0.2214768, 1, 0, 0, 1, 1,
0.2074575, -0.8483847, 2.110671, 1, 0, 0, 1, 1,
0.2081297, 0.2109918, 0.6188254, 1, 0, 0, 1, 1,
0.2164024, 0.8229737, 1.922406, 1, 0, 0, 1, 1,
0.2172339, -0.7034076, 1.893593, 1, 0, 0, 1, 1,
0.2188258, -0.09751748, 1.414019, 0, 0, 0, 1, 1,
0.2191833, 0.8224823, 1.851908, 0, 0, 0, 1, 1,
0.2201558, 0.4265698, 0.995943, 0, 0, 0, 1, 1,
0.2261083, 1.723577, 0.04191696, 0, 0, 0, 1, 1,
0.2280075, -0.218368, 2.576445, 0, 0, 0, 1, 1,
0.230671, 0.4984694, 1.184669, 0, 0, 0, 1, 1,
0.2361985, -1.065477, 3.540441, 0, 0, 0, 1, 1,
0.2389549, -0.6231772, 2.303381, 1, 1, 1, 1, 1,
0.2393301, -0.558937, 1.907727, 1, 1, 1, 1, 1,
0.2399512, 1.180738, -0.25425, 1, 1, 1, 1, 1,
0.2425813, 0.9118252, 0.4992945, 1, 1, 1, 1, 1,
0.2426226, 0.5966303, -0.7487634, 1, 1, 1, 1, 1,
0.2457789, 0.4284284, 3.768927, 1, 1, 1, 1, 1,
0.2458285, -1.086254, 4.065376, 1, 1, 1, 1, 1,
0.2495556, 0.4657215, -0.1512941, 1, 1, 1, 1, 1,
0.2496941, -0.02112803, 1.256144, 1, 1, 1, 1, 1,
0.2552853, 0.6809387, 1.143377, 1, 1, 1, 1, 1,
0.2682439, 1.183573, -0.8372473, 1, 1, 1, 1, 1,
0.2687235, 1.275962, -0.6401621, 1, 1, 1, 1, 1,
0.2716331, -1.087283, 2.091211, 1, 1, 1, 1, 1,
0.2739158, -0.7106021, 4.698754, 1, 1, 1, 1, 1,
0.2739425, 0.3444786, -1.259314, 1, 1, 1, 1, 1,
0.2791559, -0.9644438, 4.936569, 0, 0, 1, 1, 1,
0.2792609, -1.491674, 3.03577, 1, 0, 0, 1, 1,
0.2824824, -1.418883, 1.625266, 1, 0, 0, 1, 1,
0.2856966, -1.950446, 3.140001, 1, 0, 0, 1, 1,
0.2914643, -0.4682449, 2.321179, 1, 0, 0, 1, 1,
0.2921404, -0.1178464, 0.7570307, 1, 0, 0, 1, 1,
0.2950866, -0.5497233, 3.897329, 0, 0, 0, 1, 1,
0.2978789, 1.267515, 0.8806496, 0, 0, 0, 1, 1,
0.2980346, 0.3027871, -1.226808, 0, 0, 0, 1, 1,
0.2987075, 2.339171, 0.6275295, 0, 0, 0, 1, 1,
0.3038712, -0.9682721, 0.8453737, 0, 0, 0, 1, 1,
0.3046633, -0.2795249, 2.585885, 0, 0, 0, 1, 1,
0.3064855, 0.155909, 1.925011, 0, 0, 0, 1, 1,
0.3088239, -0.6530463, 3.664604, 1, 1, 1, 1, 1,
0.3143678, 0.475593, 1.045224, 1, 1, 1, 1, 1,
0.3165049, -2.056785, 3.884198, 1, 1, 1, 1, 1,
0.3184781, -1.789723, 2.672692, 1, 1, 1, 1, 1,
0.3196833, -0.7345759, 2.477021, 1, 1, 1, 1, 1,
0.3206261, 1.282959, 0.3663191, 1, 1, 1, 1, 1,
0.3273456, -1.245432, 2.126586, 1, 1, 1, 1, 1,
0.3278704, -1.076423, 2.275888, 1, 1, 1, 1, 1,
0.3286685, 0.6190798, 0.5020287, 1, 1, 1, 1, 1,
0.3298531, 1.736061, 1.11963, 1, 1, 1, 1, 1,
0.333792, 0.01460249, 2.508011, 1, 1, 1, 1, 1,
0.3370467, -0.1571402, 1.695473, 1, 1, 1, 1, 1,
0.3405217, -0.03371903, 2.791751, 1, 1, 1, 1, 1,
0.3415396, 0.9446967, 0.4005462, 1, 1, 1, 1, 1,
0.3427823, -0.1159478, 3.988747, 1, 1, 1, 1, 1,
0.345064, -0.1016047, 1.173297, 0, 0, 1, 1, 1,
0.3475016, -1.031459, 2.481507, 1, 0, 0, 1, 1,
0.3484237, 0.4285899, 1.596132, 1, 0, 0, 1, 1,
0.3514472, 0.0712036, 2.200143, 1, 0, 0, 1, 1,
0.3530929, 0.2309183, 0.7094774, 1, 0, 0, 1, 1,
0.3603047, 2.020602, -0.3562755, 1, 0, 0, 1, 1,
0.3646055, 0.694803, 0.7475451, 0, 0, 0, 1, 1,
0.3646485, 0.478953, 2.197046, 0, 0, 0, 1, 1,
0.3687198, -0.168203, 1.552545, 0, 0, 0, 1, 1,
0.3732479, -1.149619, 2.82816, 0, 0, 0, 1, 1,
0.3854264, 1.014326, -0.9659121, 0, 0, 0, 1, 1,
0.3855436, -0.5339397, -0.1523331, 0, 0, 0, 1, 1,
0.3861131, 0.4211929, 1.223368, 0, 0, 0, 1, 1,
0.3867682, -0.1475108, 2.072627, 1, 1, 1, 1, 1,
0.3876774, -0.2241448, 2.615934, 1, 1, 1, 1, 1,
0.3889085, 0.1607968, 0.2607588, 1, 1, 1, 1, 1,
0.3904409, 0.7743036, 0.7037959, 1, 1, 1, 1, 1,
0.3932491, 0.6491992, -1.084795, 1, 1, 1, 1, 1,
0.3966067, -0.2288206, 2.271791, 1, 1, 1, 1, 1,
0.3988211, 0.2092839, 2.587082, 1, 1, 1, 1, 1,
0.3989668, -0.7118418, 1.817721, 1, 1, 1, 1, 1,
0.4002295, 0.7788727, 0.6436085, 1, 1, 1, 1, 1,
0.4043195, -0.7840396, 2.858434, 1, 1, 1, 1, 1,
0.4053541, 0.1481807, 1.066072, 1, 1, 1, 1, 1,
0.4089238, 0.5430114, 0.4136578, 1, 1, 1, 1, 1,
0.4097801, -0.6059802, 2.543818, 1, 1, 1, 1, 1,
0.4122761, 0.1008646, 2.068146, 1, 1, 1, 1, 1,
0.4140508, 0.4413739, -1.096199, 1, 1, 1, 1, 1,
0.4203409, 0.9646731, -0.5679163, 0, 0, 1, 1, 1,
0.4207205, 0.5678422, 0.2583873, 1, 0, 0, 1, 1,
0.4213102, 1.64427, -1.759043, 1, 0, 0, 1, 1,
0.4221664, 0.3162532, 0.1851651, 1, 0, 0, 1, 1,
0.4232495, 0.3242279, 0.01708958, 1, 0, 0, 1, 1,
0.4251842, 2.76087, 1.82284, 1, 0, 0, 1, 1,
0.4257032, 1.054973, -1.061751, 0, 0, 0, 1, 1,
0.4257911, -1.149524, 4.069093, 0, 0, 0, 1, 1,
0.4265364, 0.1281979, 0.1057446, 0, 0, 0, 1, 1,
0.4279112, 0.7262661, 1.024124, 0, 0, 0, 1, 1,
0.4286426, -0.2508222, 2.195261, 0, 0, 0, 1, 1,
0.4317084, 0.3301648, 0.3139327, 0, 0, 0, 1, 1,
0.4337036, -0.180988, 2.6625, 0, 0, 0, 1, 1,
0.4374224, 0.4271928, 0.2338923, 1, 1, 1, 1, 1,
0.4421386, -0.6603358, 1.794319, 1, 1, 1, 1, 1,
0.4432189, -0.07911057, 1.189654, 1, 1, 1, 1, 1,
0.4435574, -1.183158, 0.3268972, 1, 1, 1, 1, 1,
0.4506759, 0.1404478, 1.322877, 1, 1, 1, 1, 1,
0.4514313, -0.7553071, 1.898098, 1, 1, 1, 1, 1,
0.4518101, -0.1717618, 3.565523, 1, 1, 1, 1, 1,
0.4582334, -0.6931428, 2.567623, 1, 1, 1, 1, 1,
0.4652701, 0.03587566, 1.336994, 1, 1, 1, 1, 1,
0.4674245, 0.2558765, 1.055807, 1, 1, 1, 1, 1,
0.4729372, -0.03143908, 2.864351, 1, 1, 1, 1, 1,
0.4790066, -1.151328, 2.181448, 1, 1, 1, 1, 1,
0.4800139, 0.1322359, 1.099115, 1, 1, 1, 1, 1,
0.4880732, -0.09710395, 0.7924571, 1, 1, 1, 1, 1,
0.4887099, -0.7102927, 2.55459, 1, 1, 1, 1, 1,
0.4948553, 0.8565913, 0.778442, 0, 0, 1, 1, 1,
0.4995584, 1.180821, 0.3668749, 1, 0, 0, 1, 1,
0.4999524, -2.642032, 2.117089, 1, 0, 0, 1, 1,
0.5007938, -1.134548, 5.789799, 1, 0, 0, 1, 1,
0.5052661, -0.03386129, 0.9951696, 1, 0, 0, 1, 1,
0.5054697, -0.6926721, 2.950506, 1, 0, 0, 1, 1,
0.5072823, 1.241881, 1.886787, 0, 0, 0, 1, 1,
0.5094491, 0.7948411, 0.5446648, 0, 0, 0, 1, 1,
0.5242748, -0.0708965, 3.257498, 0, 0, 0, 1, 1,
0.5249265, -0.8049458, 3.577615, 0, 0, 0, 1, 1,
0.5262914, -0.4880336, 3.296726, 0, 0, 0, 1, 1,
0.5263872, -0.1229705, -0.4384913, 0, 0, 0, 1, 1,
0.5281293, 0.5242268, 0.05145878, 0, 0, 0, 1, 1,
0.5297271, -0.4131933, 1.890198, 1, 1, 1, 1, 1,
0.5373701, 1.465079, -0.4137796, 1, 1, 1, 1, 1,
0.5396531, -0.8812899, 4.953817, 1, 1, 1, 1, 1,
0.5424386, -0.4031472, 3.228633, 1, 1, 1, 1, 1,
0.5447943, -0.7680121, 3.298114, 1, 1, 1, 1, 1,
0.5495882, 0.7035212, 1.260324, 1, 1, 1, 1, 1,
0.5497344, -0.06580885, 1.3485, 1, 1, 1, 1, 1,
0.5511212, -0.0642219, 0.2500122, 1, 1, 1, 1, 1,
0.5545223, -0.4984102, 2.41263, 1, 1, 1, 1, 1,
0.5563827, 0.7586551, 1.902279, 1, 1, 1, 1, 1,
0.5565649, -0.09618089, -0.6688839, 1, 1, 1, 1, 1,
0.5567887, 0.8293793, 0.4262621, 1, 1, 1, 1, 1,
0.557826, -0.9350018, 3.62158, 1, 1, 1, 1, 1,
0.5667183, -1.234151, 2.63539, 1, 1, 1, 1, 1,
0.567257, 0.8202833, 1.516699, 1, 1, 1, 1, 1,
0.5676092, -0.04510767, 1.782162, 0, 0, 1, 1, 1,
0.5695341, 1.364251, -1.745315, 1, 0, 0, 1, 1,
0.5709019, -0.3324286, 3.127427, 1, 0, 0, 1, 1,
0.573279, -0.3248763, 2.670405, 1, 0, 0, 1, 1,
0.5785081, 1.896322, 0.1368667, 1, 0, 0, 1, 1,
0.5872735, 0.421103, 2.473461, 1, 0, 0, 1, 1,
0.5915821, -1.035626, 2.846979, 0, 0, 0, 1, 1,
0.5934743, 2.221906, -0.50756, 0, 0, 0, 1, 1,
0.5946184, -0.2332268, 1.657467, 0, 0, 0, 1, 1,
0.597467, 1.238495, -0.1774634, 0, 0, 0, 1, 1,
0.5976765, -0.4760621, 1.680618, 0, 0, 0, 1, 1,
0.5977829, -0.4179426, 1.601276, 0, 0, 0, 1, 1,
0.5982975, 0.6681072, 0.5155716, 0, 0, 0, 1, 1,
0.6017455, 0.1046554, 0.9281368, 1, 1, 1, 1, 1,
0.6101942, -0.5259134, 1.273288, 1, 1, 1, 1, 1,
0.6110548, -1.786948, 1.871603, 1, 1, 1, 1, 1,
0.6115856, -2.562773, 0.8362321, 1, 1, 1, 1, 1,
0.612276, -0.1136972, 1.688822, 1, 1, 1, 1, 1,
0.6144077, -1.386909, 2.260358, 1, 1, 1, 1, 1,
0.6186312, -0.3330591, 4.174343, 1, 1, 1, 1, 1,
0.6188561, 0.06514429, 1.797378, 1, 1, 1, 1, 1,
0.6274121, -1.575036, 2.935726, 1, 1, 1, 1, 1,
0.628657, -0.09145001, 1.532026, 1, 1, 1, 1, 1,
0.6336474, 0.728425, 2.153896, 1, 1, 1, 1, 1,
0.6374996, 0.4720154, -0.9858313, 1, 1, 1, 1, 1,
0.6393147, -0.8297942, 2.760607, 1, 1, 1, 1, 1,
0.6399782, 0.8796921, -0.7610888, 1, 1, 1, 1, 1,
0.6408311, 0.557886, 1.562117, 1, 1, 1, 1, 1,
0.6446681, -0.7504046, 1.667838, 0, 0, 1, 1, 1,
0.6460204, 0.5955344, 1.167965, 1, 0, 0, 1, 1,
0.6463061, -0.2803379, 0.8448063, 1, 0, 0, 1, 1,
0.6478168, 0.2932262, 0.6663241, 1, 0, 0, 1, 1,
0.6557785, -1.964652, 2.875849, 1, 0, 0, 1, 1,
0.6562985, -0.9202015, 3.51016, 1, 0, 0, 1, 1,
0.6630157, 2.586887, -0.7194282, 0, 0, 0, 1, 1,
0.6711165, -1.075201, 2.664803, 0, 0, 0, 1, 1,
0.6721017, -1.690959, 2.472808, 0, 0, 0, 1, 1,
0.6731967, -0.7463239, 2.625395, 0, 0, 0, 1, 1,
0.6778239, -0.173403, 1.093917, 0, 0, 0, 1, 1,
0.6778386, 0.1250015, -0.0361223, 0, 0, 0, 1, 1,
0.6786303, -0.8023663, 1.052484, 0, 0, 0, 1, 1,
0.6808972, -0.5110998, 1.874501, 1, 1, 1, 1, 1,
0.6824815, -1.038641, 1.618427, 1, 1, 1, 1, 1,
0.6857987, 0.1739399, 0.981711, 1, 1, 1, 1, 1,
0.6859857, 0.5206411, 1.080207, 1, 1, 1, 1, 1,
0.6861081, 1.468649, 0.09627896, 1, 1, 1, 1, 1,
0.6864318, 0.8521144, 0.9586463, 1, 1, 1, 1, 1,
0.686536, 0.3548304, 2.196985, 1, 1, 1, 1, 1,
0.6900247, 1.528477, -0.657097, 1, 1, 1, 1, 1,
0.6931025, 0.08647234, 2.953905, 1, 1, 1, 1, 1,
0.7039181, -0.8157914, 0.8816563, 1, 1, 1, 1, 1,
0.7043011, 0.9106947, 1.438639, 1, 1, 1, 1, 1,
0.7070651, -0.7115148, 1.908635, 1, 1, 1, 1, 1,
0.717294, -0.5203549, 3.153568, 1, 1, 1, 1, 1,
0.719614, 0.3932303, 1.11684, 1, 1, 1, 1, 1,
0.72331, 0.587476, 1.067204, 1, 1, 1, 1, 1,
0.7247271, 1.727522, 1.65755, 0, 0, 1, 1, 1,
0.7298768, -1.423779, 1.618893, 1, 0, 0, 1, 1,
0.7307535, 0.04977209, 1.723632, 1, 0, 0, 1, 1,
0.7312216, 0.2749206, 2.349199, 1, 0, 0, 1, 1,
0.7371027, -0.9446282, 3.425894, 1, 0, 0, 1, 1,
0.7389783, 0.1971462, 3.896364, 1, 0, 0, 1, 1,
0.7409056, 2.049196, 1.069322, 0, 0, 0, 1, 1,
0.7412515, -0.1211195, 0.5913533, 0, 0, 0, 1, 1,
0.745743, 0.2339811, -0.2790395, 0, 0, 0, 1, 1,
0.7483112, -0.1686873, 2.236396, 0, 0, 0, 1, 1,
0.749298, -0.6668401, 2.803977, 0, 0, 0, 1, 1,
0.7681357, -0.3171419, 3.211961, 0, 0, 0, 1, 1,
0.7715758, 2.205871, 0.5436979, 0, 0, 0, 1, 1,
0.7746704, 0.2740151, 0.7069435, 1, 1, 1, 1, 1,
0.7779312, -0.07265214, 0.9649713, 1, 1, 1, 1, 1,
0.7814485, 0.9168864, 1.711402, 1, 1, 1, 1, 1,
0.7863759, 0.01515644, 2.002322, 1, 1, 1, 1, 1,
0.796685, -0.3857348, 2.564749, 1, 1, 1, 1, 1,
0.7984921, 0.4757573, 2.774606, 1, 1, 1, 1, 1,
0.7998385, 1.186069, 0.4501457, 1, 1, 1, 1, 1,
0.8016838, 0.2061211, 2.956965, 1, 1, 1, 1, 1,
0.8034219, -1.585997, 1.82183, 1, 1, 1, 1, 1,
0.8064005, 0.4298976, 0.1576447, 1, 1, 1, 1, 1,
0.8097368, -1.175146, 1.905521, 1, 1, 1, 1, 1,
0.8110529, -2.014431, 1.945609, 1, 1, 1, 1, 1,
0.8113837, -1.064735, 0.9983094, 1, 1, 1, 1, 1,
0.8120219, -0.6114428, 1.732066, 1, 1, 1, 1, 1,
0.813746, 0.02561786, 0.5377271, 1, 1, 1, 1, 1,
0.8171354, 0.02123102, 2.053255, 0, 0, 1, 1, 1,
0.8202702, 0.6668996, 1.53285, 1, 0, 0, 1, 1,
0.8212538, -1.461609, 2.278727, 1, 0, 0, 1, 1,
0.8239655, 0.8916377, 0.623651, 1, 0, 0, 1, 1,
0.8243116, 0.7759931, 0.8721497, 1, 0, 0, 1, 1,
0.8245122, -0.9945991, 3.244319, 1, 0, 0, 1, 1,
0.8277922, -0.4941198, 0.3967147, 0, 0, 0, 1, 1,
0.8291162, 0.8908429, 1.196518, 0, 0, 0, 1, 1,
0.8293377, 0.9623581, 0.611114, 0, 0, 0, 1, 1,
0.8315037, 2.03378, 0.2969216, 0, 0, 0, 1, 1,
0.8383184, 0.2681608, 0.8830072, 0, 0, 0, 1, 1,
0.8410636, -0.4684696, 2.591157, 0, 0, 0, 1, 1,
0.8446109, -0.4374768, 2.650103, 0, 0, 0, 1, 1,
0.8499424, 0.4638939, 1.104705, 1, 1, 1, 1, 1,
0.8548831, -0.5100649, 2.163846, 1, 1, 1, 1, 1,
0.8642312, -0.4912748, 2.173342, 1, 1, 1, 1, 1,
0.8643475, 1.022943, -0.3534347, 1, 1, 1, 1, 1,
0.8650945, -0.07099944, 2.158612, 1, 1, 1, 1, 1,
0.866234, 0.9940583, -0.1823884, 1, 1, 1, 1, 1,
0.8668527, -0.03217274, 2.97945, 1, 1, 1, 1, 1,
0.8689889, -1.862373, 1.667292, 1, 1, 1, 1, 1,
0.8726408, -0.4168503, 2.550207, 1, 1, 1, 1, 1,
0.8726569, 0.04445204, 1.003636, 1, 1, 1, 1, 1,
0.8815613, -0.4334547, 2.433489, 1, 1, 1, 1, 1,
0.884183, -1.385011, 2.200949, 1, 1, 1, 1, 1,
0.8855239, -0.5397862, 0.3005243, 1, 1, 1, 1, 1,
0.8858739, -0.4419327, 0.6954805, 1, 1, 1, 1, 1,
0.8911051, -0.4443873, 1.188448, 1, 1, 1, 1, 1,
0.8939721, 0.269878, 0.02794143, 0, 0, 1, 1, 1,
0.8947489, -0.2064342, 2.629871, 1, 0, 0, 1, 1,
0.8948348, -0.4332914, 2.201983, 1, 0, 0, 1, 1,
0.9038239, 0.06852502, 3.444112, 1, 0, 0, 1, 1,
0.903967, -0.2924539, 0.2181618, 1, 0, 0, 1, 1,
0.9087974, -1.908976, 2.498327, 1, 0, 0, 1, 1,
0.912064, -1.962875, 3.563846, 0, 0, 0, 1, 1,
0.9139436, -0.2355879, 2.954898, 0, 0, 0, 1, 1,
0.9156996, -2.074775, 1.654366, 0, 0, 0, 1, 1,
0.9173406, -0.1138848, 1.378375, 0, 0, 0, 1, 1,
0.9185426, -0.1689663, 2.793783, 0, 0, 0, 1, 1,
0.9193579, 0.3314304, 0.9752756, 0, 0, 0, 1, 1,
0.9216169, -0.1687915, 2.254447, 0, 0, 0, 1, 1,
0.9231718, -1.348711, 1.800808, 1, 1, 1, 1, 1,
0.9241275, -1.019522, 3.955282, 1, 1, 1, 1, 1,
0.9255341, 0.2367631, 0.6048594, 1, 1, 1, 1, 1,
0.9325029, -0.03196034, 1.269188, 1, 1, 1, 1, 1,
0.9375845, -0.9862856, 0.9051747, 1, 1, 1, 1, 1,
0.9449728, -1.963793, 2.046792, 1, 1, 1, 1, 1,
0.9467783, 0.1807875, 1.360204, 1, 1, 1, 1, 1,
0.9480781, 2.644637, 1.020919, 1, 1, 1, 1, 1,
0.9530675, -0.09836064, 2.850997, 1, 1, 1, 1, 1,
0.9542608, 1.211658, 2.219916, 1, 1, 1, 1, 1,
0.9550845, 0.01116455, 3.675514, 1, 1, 1, 1, 1,
0.9556683, 0.724755, 0.8915281, 1, 1, 1, 1, 1,
0.9588216, 1.156312, 0.2205731, 1, 1, 1, 1, 1,
0.9636965, 0.39421, 1.90812, 1, 1, 1, 1, 1,
0.9667434, -0.05536873, 1.14069, 1, 1, 1, 1, 1,
0.9683227, -0.9877712, 1.586489, 0, 0, 1, 1, 1,
0.9721289, 0.09605252, 3.656212, 1, 0, 0, 1, 1,
0.9730515, -0.5616471, 1.146585, 1, 0, 0, 1, 1,
0.9757124, -0.383334, 4.594261, 1, 0, 0, 1, 1,
0.9798007, 1.42544, 1.15684, 1, 0, 0, 1, 1,
0.9862111, 0.2413848, 1.234604, 1, 0, 0, 1, 1,
1.012925, -0.2323273, 1.634131, 0, 0, 0, 1, 1,
1.013906, 0.320915, 1.2313, 0, 0, 0, 1, 1,
1.018602, -0.81238, 2.329492, 0, 0, 0, 1, 1,
1.025073, -1.530519, 1.076511, 0, 0, 0, 1, 1,
1.028426, -0.08963198, 2.184839, 0, 0, 0, 1, 1,
1.03663, 0.2474967, 0.03178309, 0, 0, 0, 1, 1,
1.041945, 0.2139215, 1.365387, 0, 0, 0, 1, 1,
1.044893, -0.02816571, 0.8660169, 1, 1, 1, 1, 1,
1.045496, 0.6600502, 2.213388, 1, 1, 1, 1, 1,
1.047326, 0.1513339, 0.2088766, 1, 1, 1, 1, 1,
1.050604, -0.2676932, 0.8558099, 1, 1, 1, 1, 1,
1.052003, -3.335481, 2.743947, 1, 1, 1, 1, 1,
1.053955, -0.9085336, 0.8158381, 1, 1, 1, 1, 1,
1.055866, 1.619288, -1.044102, 1, 1, 1, 1, 1,
1.05878, -1.432312, 1.465685, 1, 1, 1, 1, 1,
1.060725, 0.5016462, 2.805518, 1, 1, 1, 1, 1,
1.066047, 0.5211738, 0.6048864, 1, 1, 1, 1, 1,
1.067519, -0.1415029, 0.358807, 1, 1, 1, 1, 1,
1.06768, -0.2434478, 3.582984, 1, 1, 1, 1, 1,
1.068659, -2.252954, 1.973776, 1, 1, 1, 1, 1,
1.072801, 1.391691, 0.2296715, 1, 1, 1, 1, 1,
1.079711, -0.242519, 0.748917, 1, 1, 1, 1, 1,
1.088275, -0.1088361, 2.54721, 0, 0, 1, 1, 1,
1.088828, -0.7157725, 2.729804, 1, 0, 0, 1, 1,
1.089177, 1.097039, 0.2046879, 1, 0, 0, 1, 1,
1.089679, 0.211657, 1.011758, 1, 0, 0, 1, 1,
1.115598, -1.057231, 1.837833, 1, 0, 0, 1, 1,
1.119003, 0.4591587, 1.168518, 1, 0, 0, 1, 1,
1.130451, -1.520257, 4.005751, 0, 0, 0, 1, 1,
1.132246, 1.0826, 0.4608822, 0, 0, 0, 1, 1,
1.133137, 1.996931, -0.05902549, 0, 0, 0, 1, 1,
1.146831, -0.886731, 3.080578, 0, 0, 0, 1, 1,
1.156855, -0.5111757, 1.967054, 0, 0, 0, 1, 1,
1.161729, -1.336571, 1.25586, 0, 0, 0, 1, 1,
1.172313, 0.06098996, 2.398518, 0, 0, 0, 1, 1,
1.175619, 0.8993828, 0.9343498, 1, 1, 1, 1, 1,
1.181549, -0.1682652, 0.9953736, 1, 1, 1, 1, 1,
1.19378, -0.3554425, 2.670178, 1, 1, 1, 1, 1,
1.203001, 0.7582445, 1.213409, 1, 1, 1, 1, 1,
1.216107, 0.114267, 0.126429, 1, 1, 1, 1, 1,
1.230857, 0.2808062, 0.9610297, 1, 1, 1, 1, 1,
1.230913, -0.4127519, 1.72405, 1, 1, 1, 1, 1,
1.24182, 0.3135039, 1.500994, 1, 1, 1, 1, 1,
1.255076, -1.450837, 3.60946, 1, 1, 1, 1, 1,
1.262579, 0.3276289, -0.3498578, 1, 1, 1, 1, 1,
1.269816, 1.352374, 0.6238391, 1, 1, 1, 1, 1,
1.269839, 1.722407, -0.328708, 1, 1, 1, 1, 1,
1.270312, -0.4541767, -0.5223524, 1, 1, 1, 1, 1,
1.270743, -0.149179, 2.815808, 1, 1, 1, 1, 1,
1.273285, -0.04371752, 2.823213, 1, 1, 1, 1, 1,
1.28085, 0.991899, 0.01312826, 0, 0, 1, 1, 1,
1.283626, 0.6990579, 0.6213478, 1, 0, 0, 1, 1,
1.285171, 0.07605822, 2.172793, 1, 0, 0, 1, 1,
1.287404, 1.692582, 0.6731545, 1, 0, 0, 1, 1,
1.29213, -0.252147, 1.921113, 1, 0, 0, 1, 1,
1.309349, -0.7573904, 2.953391, 1, 0, 0, 1, 1,
1.327428, 2.80717, 0.3305159, 0, 0, 0, 1, 1,
1.328931, -1.354457, 4.034849, 0, 0, 0, 1, 1,
1.339716, -0.2100026, 1.683957, 0, 0, 0, 1, 1,
1.345943, -1.493044, 4.438781, 0, 0, 0, 1, 1,
1.347371, 0.5338483, -0.1108761, 0, 0, 0, 1, 1,
1.363766, -0.3091407, 0.3897562, 0, 0, 0, 1, 1,
1.364748, 0.2367884, 1.667062, 0, 0, 0, 1, 1,
1.366381, -0.7196449, 0.5809435, 1, 1, 1, 1, 1,
1.374024, -0.2847164, 2.724231, 1, 1, 1, 1, 1,
1.377494, 1.195395, 0.1395943, 1, 1, 1, 1, 1,
1.385984, 0.9164521, 0.5423403, 1, 1, 1, 1, 1,
1.399229, -0.6379119, 0.8763916, 1, 1, 1, 1, 1,
1.407485, 0.6253544, 0.3958263, 1, 1, 1, 1, 1,
1.424151, -1.350068, 1.999452, 1, 1, 1, 1, 1,
1.435687, -1.662726, 2.108582, 1, 1, 1, 1, 1,
1.442428, -1.33673, 4.356431, 1, 1, 1, 1, 1,
1.453883, 0.1683216, 0.07569751, 1, 1, 1, 1, 1,
1.468038, -1.77184, 2.454397, 1, 1, 1, 1, 1,
1.483592, -1.447779, 2.17458, 1, 1, 1, 1, 1,
1.488972, -2.538504, 2.878866, 1, 1, 1, 1, 1,
1.502315, -0.85106, 1.356142, 1, 1, 1, 1, 1,
1.505296, 0.8091609, 0.4481755, 1, 1, 1, 1, 1,
1.526996, -1.987142, 2.564393, 0, 0, 1, 1, 1,
1.527046, 0.8519851, 1.400374, 1, 0, 0, 1, 1,
1.578871, -0.4286865, 2.817284, 1, 0, 0, 1, 1,
1.579215, 0.03221464, 2.821988, 1, 0, 0, 1, 1,
1.5828, -1.615881, 3.07025, 1, 0, 0, 1, 1,
1.584643, -1.107013, 2.379897, 1, 0, 0, 1, 1,
1.586345, -0.2678749, 3.561607, 0, 0, 0, 1, 1,
1.590371, 0.1385696, -0.560184, 0, 0, 0, 1, 1,
1.612478, -1.764605, 2.648818, 0, 0, 0, 1, 1,
1.630501, -1.582608, 1.769125, 0, 0, 0, 1, 1,
1.632007, 0.5062274, 1.492501, 0, 0, 0, 1, 1,
1.635934, -0.0603904, 3.383778, 0, 0, 0, 1, 1,
1.642187, -0.6185265, 1.936057, 0, 0, 0, 1, 1,
1.645027, -0.04997985, 2.532964, 1, 1, 1, 1, 1,
1.650325, -0.1791423, 0.7929305, 1, 1, 1, 1, 1,
1.654684, 0.9068472, 0.7267663, 1, 1, 1, 1, 1,
1.659227, 0.668582, 1.557224, 1, 1, 1, 1, 1,
1.676868, 1.9004, 3.061216, 1, 1, 1, 1, 1,
1.681147, -0.9088485, 2.298529, 1, 1, 1, 1, 1,
1.68514, 2.019433, -0.1240931, 1, 1, 1, 1, 1,
1.698727, -1.62176, 1.443557, 1, 1, 1, 1, 1,
1.70001, 0.06512903, 0.4869247, 1, 1, 1, 1, 1,
1.710703, -0.9509087, 3.173172, 1, 1, 1, 1, 1,
1.714329, -1.680605, 2.115017, 1, 1, 1, 1, 1,
1.716528, 0.1485036, 1.085584, 1, 1, 1, 1, 1,
1.720451, 1.083739, 0.915049, 1, 1, 1, 1, 1,
1.73134, -0.4489253, 1.040468, 1, 1, 1, 1, 1,
1.733695, 1.747128, 2.887084, 1, 1, 1, 1, 1,
1.743131, 0.8002957, 1.216106, 0, 0, 1, 1, 1,
1.764997, 0.0579759, 3.368165, 1, 0, 0, 1, 1,
1.767668, 0.9265158, 1.009495, 1, 0, 0, 1, 1,
1.771402, -0.08243433, 3.307402, 1, 0, 0, 1, 1,
1.771785, 0.6411106, 2.490801, 1, 0, 0, 1, 1,
1.783183, -0.652245, 3.267263, 1, 0, 0, 1, 1,
1.807116, -1.121012, 3.531481, 0, 0, 0, 1, 1,
1.812349, -0.6443139, 2.707358, 0, 0, 0, 1, 1,
1.827685, 0.4622846, 0.2980289, 0, 0, 0, 1, 1,
1.830629, -0.1790479, 1.187178, 0, 0, 0, 1, 1,
1.847116, -0.4333501, 2.344815, 0, 0, 0, 1, 1,
1.849667, -0.4552655, 3.266145, 0, 0, 0, 1, 1,
1.858603, 0.3543956, 1.54741, 0, 0, 0, 1, 1,
1.873747, 2.277964, 1.963491, 1, 1, 1, 1, 1,
1.875299, 1.993585, -0.3573375, 1, 1, 1, 1, 1,
1.878569, 1.331197, 4.311501, 1, 1, 1, 1, 1,
1.898311, 0.9759221, 1.39573, 1, 1, 1, 1, 1,
1.907051, -0.8748511, 1.797708, 1, 1, 1, 1, 1,
1.909872, 1.798148, 1.579306, 1, 1, 1, 1, 1,
1.921338, 1.228972, 0.803605, 1, 1, 1, 1, 1,
1.922978, 0.3555489, -0.02253314, 1, 1, 1, 1, 1,
1.933489, -0.9262167, 1.610467, 1, 1, 1, 1, 1,
1.935362, 0.5323207, 1.081837, 1, 1, 1, 1, 1,
1.935432, 1.216783, -0.07751042, 1, 1, 1, 1, 1,
1.945834, 0.428336, 0.4462064, 1, 1, 1, 1, 1,
1.946289, -0.7730159, 1.471174, 1, 1, 1, 1, 1,
1.991662, 3.031478, 0.6272541, 1, 1, 1, 1, 1,
1.998692, -0.7203809, 3.086734, 1, 1, 1, 1, 1,
2.03665, 0.8488262, 1.340462, 0, 0, 1, 1, 1,
2.04348, -0.6426719, 1.449931, 1, 0, 0, 1, 1,
2.090686, 1.889622, 0.5239389, 1, 0, 0, 1, 1,
2.101655, 0.4229071, 3.059144, 1, 0, 0, 1, 1,
2.1338, 1.826085, 1.709866, 1, 0, 0, 1, 1,
2.144397, 0.372048, 0.4527719, 1, 0, 0, 1, 1,
2.165119, 1.371056, 0.466057, 0, 0, 0, 1, 1,
2.177328, -0.9395034, 1.944976, 0, 0, 0, 1, 1,
2.228889, -1.721411, 2.951725, 0, 0, 0, 1, 1,
2.269802, 0.4176016, 0.09626013, 0, 0, 0, 1, 1,
2.294099, -0.9229268, 2.139196, 0, 0, 0, 1, 1,
2.448846, -0.8916442, 3.354914, 0, 0, 0, 1, 1,
2.476563, 0.9286377, -0.6487081, 0, 0, 0, 1, 1,
2.514329, -1.23064, 2.026857, 1, 1, 1, 1, 1,
2.548729, 0.9854797, 0.3508506, 1, 1, 1, 1, 1,
2.567316, 0.1712788, 0.8120567, 1, 1, 1, 1, 1,
2.759744, 0.387364, 0.2431166, 1, 1, 1, 1, 1,
2.767046, 1.141765, 1.242782, 1, 1, 1, 1, 1,
2.816397, 0.3173906, -0.05396923, 1, 1, 1, 1, 1,
3.130476, 1.432182, 1.720802, 1, 1, 1, 1, 1
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
var radius = 9.695589;
var distance = 34.05535;
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
mvMatrix.translate( -0.03906298, 0.2076485, -0.3481786 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.05535);
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