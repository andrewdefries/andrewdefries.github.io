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
-2.852045, 0.2414713, -1.758806, 1, 0, 0, 1,
-2.719878, 0.7803417, -1.907188, 1, 0.007843138, 0, 1,
-2.719667, 1.006081, -1.337007, 1, 0.01176471, 0, 1,
-2.571347, 2.839731, 0.4887445, 1, 0.01960784, 0, 1,
-2.492214, 0.8000264, 0.9677203, 1, 0.02352941, 0, 1,
-2.44012, -0.7975188, -0.8351684, 1, 0.03137255, 0, 1,
-2.409513, -0.2707542, -2.654055, 1, 0.03529412, 0, 1,
-2.387741, 1.63297, -3.320934, 1, 0.04313726, 0, 1,
-2.351471, -0.1011904, -3.655818, 1, 0.04705882, 0, 1,
-2.349147, -1.143655, -1.212993, 1, 0.05490196, 0, 1,
-2.320688, -0.7411628, -3.446212, 1, 0.05882353, 0, 1,
-2.242089, 0.06982892, -1.822579, 1, 0.06666667, 0, 1,
-2.129182, 0.1277704, -2.473262, 1, 0.07058824, 0, 1,
-2.103285, 1.212563, 0.06717826, 1, 0.07843138, 0, 1,
-2.071444, 0.6051183, -0.6085578, 1, 0.08235294, 0, 1,
-2.046469, -0.2187902, -2.364269, 1, 0.09019608, 0, 1,
-2.01323, -0.137814, -0.4781699, 1, 0.09411765, 0, 1,
-2.002744, 1.186203, -1.803498, 1, 0.1019608, 0, 1,
-1.963384, 1.331615, -1.106813, 1, 0.1098039, 0, 1,
-1.956246, 0.3472652, -2.52271, 1, 0.1137255, 0, 1,
-1.924413, -0.2872369, -1.909468, 1, 0.1215686, 0, 1,
-1.905929, 1.862528, -0.3272064, 1, 0.1254902, 0, 1,
-1.863632, -1.69571, -2.811988, 1, 0.1333333, 0, 1,
-1.862124, -0.211825, -1.794381, 1, 0.1372549, 0, 1,
-1.860086, 1.164896, 1.077891, 1, 0.145098, 0, 1,
-1.846203, -0.02484012, -2.037059, 1, 0.1490196, 0, 1,
-1.84466, 0.07166073, -1.13633, 1, 0.1568628, 0, 1,
-1.840723, -0.7621729, -1.912985, 1, 0.1607843, 0, 1,
-1.834213, -0.921885, -3.009527, 1, 0.1686275, 0, 1,
-1.831782, 1.561621, -1.349067, 1, 0.172549, 0, 1,
-1.815831, -0.05612115, -1.186015, 1, 0.1803922, 0, 1,
-1.80976, -2.006802, -2.689185, 1, 0.1843137, 0, 1,
-1.800466, -0.2957738, -1.334283, 1, 0.1921569, 0, 1,
-1.789344, 1.778864, 0.4765504, 1, 0.1960784, 0, 1,
-1.783526, -0.4407769, -1.512133, 1, 0.2039216, 0, 1,
-1.780614, 0.7071497, -0.2830748, 1, 0.2117647, 0, 1,
-1.775902, -0.8299049, -1.75517, 1, 0.2156863, 0, 1,
-1.771523, -0.3036594, -2.319185, 1, 0.2235294, 0, 1,
-1.766553, 1.178918, -2.196571, 1, 0.227451, 0, 1,
-1.733423, 0.2553527, -1.658452, 1, 0.2352941, 0, 1,
-1.703093, -0.7290747, -2.439961, 1, 0.2392157, 0, 1,
-1.702915, -0.4796425, -2.161748, 1, 0.2470588, 0, 1,
-1.688832, -1.00872, -2.704137, 1, 0.2509804, 0, 1,
-1.688059, -1.343235, -2.850783, 1, 0.2588235, 0, 1,
-1.6869, 0.6101136, -4.0664, 1, 0.2627451, 0, 1,
-1.685109, -1.505422, -3.384247, 1, 0.2705882, 0, 1,
-1.668905, 0.9508016, -0.100012, 1, 0.2745098, 0, 1,
-1.650426, -0.6173117, -1.453044, 1, 0.282353, 0, 1,
-1.644534, -0.8766735, -2.630727, 1, 0.2862745, 0, 1,
-1.640903, -1.027104, -1.612798, 1, 0.2941177, 0, 1,
-1.625919, 0.3909402, -0.6897533, 1, 0.3019608, 0, 1,
-1.621301, -0.2186548, -2.050112, 1, 0.3058824, 0, 1,
-1.612073, -0.4777166, -3.615937, 1, 0.3137255, 0, 1,
-1.610212, 1.066878, -1.267265, 1, 0.3176471, 0, 1,
-1.60824, 1.877605, -1.158124, 1, 0.3254902, 0, 1,
-1.605311, 1.606986, -0.2763129, 1, 0.3294118, 0, 1,
-1.582733, 1.074457, -1.57026, 1, 0.3372549, 0, 1,
-1.579814, -1.045545, -1.63815, 1, 0.3411765, 0, 1,
-1.561014, 1.842848, -2.084177, 1, 0.3490196, 0, 1,
-1.552762, -0.1049574, -2.458032, 1, 0.3529412, 0, 1,
-1.551461, -0.780177, -2.512651, 1, 0.3607843, 0, 1,
-1.547483, -0.6511602, -1.772937, 1, 0.3647059, 0, 1,
-1.543169, 1.742045, 0.4714926, 1, 0.372549, 0, 1,
-1.539171, 1.198954, -1.074266, 1, 0.3764706, 0, 1,
-1.52932, 1.463441, -1.601623, 1, 0.3843137, 0, 1,
-1.525399, 0.4055559, -0.1300381, 1, 0.3882353, 0, 1,
-1.518944, 0.5055509, -2.671784, 1, 0.3960784, 0, 1,
-1.502716, -1.242148, -2.125593, 1, 0.4039216, 0, 1,
-1.495975, -0.9032193, -2.8829, 1, 0.4078431, 0, 1,
-1.488028, 0.08026602, -2.702616, 1, 0.4156863, 0, 1,
-1.486607, -0.809325, -2.130238, 1, 0.4196078, 0, 1,
-1.48637, -0.2198619, -1.265166, 1, 0.427451, 0, 1,
-1.45702, 0.7765504, -2.05302, 1, 0.4313726, 0, 1,
-1.443965, -1.157484, -3.004591, 1, 0.4392157, 0, 1,
-1.443828, -0.630349, -0.4817222, 1, 0.4431373, 0, 1,
-1.441775, -0.04528968, -0.1637883, 1, 0.4509804, 0, 1,
-1.438488, -1.089796, -2.746363, 1, 0.454902, 0, 1,
-1.437569, -1.629738, -1.826608, 1, 0.4627451, 0, 1,
-1.428178, 0.4962282, -0.6179109, 1, 0.4666667, 0, 1,
-1.426028, -0.141882, -3.195776, 1, 0.4745098, 0, 1,
-1.423591, -0.8744689, -2.692166, 1, 0.4784314, 0, 1,
-1.405398, 1.465919, -2.15411, 1, 0.4862745, 0, 1,
-1.388774, 0.3962287, -1.428233, 1, 0.4901961, 0, 1,
-1.383029, 2.106233, -0.5596542, 1, 0.4980392, 0, 1,
-1.38133, -0.4813513, -2.521187, 1, 0.5058824, 0, 1,
-1.36412, -1.041128, -2.521666, 1, 0.509804, 0, 1,
-1.35482, -1.591284, -2.620188, 1, 0.5176471, 0, 1,
-1.3459, -1.349076, -1.695482, 1, 0.5215687, 0, 1,
-1.344309, -0.293804, -1.411341, 1, 0.5294118, 0, 1,
-1.343372, 0.9177738, 0.03862471, 1, 0.5333334, 0, 1,
-1.343059, 1.210081, 1.415865, 1, 0.5411765, 0, 1,
-1.328562, 1.195099, -0.9329497, 1, 0.5450981, 0, 1,
-1.327267, -0.876493, -1.32641, 1, 0.5529412, 0, 1,
-1.324113, -0.4659019, -2.362813, 1, 0.5568628, 0, 1,
-1.321282, -0.4281575, -2.543438, 1, 0.5647059, 0, 1,
-1.317973, 1.778572, -0.4803029, 1, 0.5686275, 0, 1,
-1.317262, 1.043811, -0.7463368, 1, 0.5764706, 0, 1,
-1.310772, -0.4423011, -1.675418, 1, 0.5803922, 0, 1,
-1.308165, 0.7562885, -1.654158, 1, 0.5882353, 0, 1,
-1.303743, -1.106185, -0.8722417, 1, 0.5921569, 0, 1,
-1.29891, -2.200507, -2.652344, 1, 0.6, 0, 1,
-1.29747, -2.854594, -3.04344, 1, 0.6078432, 0, 1,
-1.295097, -0.4419982, -1.063529, 1, 0.6117647, 0, 1,
-1.28765, -1.004064, -2.969496, 1, 0.6196079, 0, 1,
-1.281921, -0.07112273, -2.201353, 1, 0.6235294, 0, 1,
-1.277626, -0.3446883, -3.225782, 1, 0.6313726, 0, 1,
-1.273998, -2.411082, -2.648003, 1, 0.6352941, 0, 1,
-1.272725, -1.161768, -1.710815, 1, 0.6431373, 0, 1,
-1.269755, -1.852564, -4.188946, 1, 0.6470588, 0, 1,
-1.269719, -0.07679852, -1.204756, 1, 0.654902, 0, 1,
-1.269094, -1.305451, -1.088235, 1, 0.6588235, 0, 1,
-1.2674, -0.1819071, -3.183815, 1, 0.6666667, 0, 1,
-1.256631, -1.391092, -3.775101, 1, 0.6705883, 0, 1,
-1.247575, 0.4440245, -3.02822, 1, 0.6784314, 0, 1,
-1.246319, 1.872456, -0.08221121, 1, 0.682353, 0, 1,
-1.246302, 0.5457776, 0.4690025, 1, 0.6901961, 0, 1,
-1.244697, 0.3255828, -2.45857, 1, 0.6941177, 0, 1,
-1.240975, -0.05725714, -1.764312, 1, 0.7019608, 0, 1,
-1.228668, 0.6709544, 0.235064, 1, 0.7098039, 0, 1,
-1.225583, -0.8948597, -2.384061, 1, 0.7137255, 0, 1,
-1.222287, 0.1473362, -1.374272, 1, 0.7215686, 0, 1,
-1.220691, 1.776955, -2.517667, 1, 0.7254902, 0, 1,
-1.217792, -1.430878, -3.269165, 1, 0.7333333, 0, 1,
-1.213139, 0.463894, 0.1515178, 1, 0.7372549, 0, 1,
-1.201799, 0.5521884, -0.6820782, 1, 0.7450981, 0, 1,
-1.191667, 0.6067091, -2.467107, 1, 0.7490196, 0, 1,
-1.189569, 0.2909373, -1.846849, 1, 0.7568628, 0, 1,
-1.187187, -1.078047, -2.179659, 1, 0.7607843, 0, 1,
-1.184331, 0.1482454, -0.9741011, 1, 0.7686275, 0, 1,
-1.181038, 1.34653, -1.485992, 1, 0.772549, 0, 1,
-1.178813, 0.01793711, -1.009199, 1, 0.7803922, 0, 1,
-1.177495, -0.1136789, 0.04077753, 1, 0.7843137, 0, 1,
-1.140142, 1.310587, -1.33056, 1, 0.7921569, 0, 1,
-1.13267, -0.3927543, -1.968468, 1, 0.7960784, 0, 1,
-1.120365, -0.2615797, -1.130982, 1, 0.8039216, 0, 1,
-1.116721, -1.299368, -2.570569, 1, 0.8117647, 0, 1,
-1.1139, -0.1439561, -1.344193, 1, 0.8156863, 0, 1,
-1.113886, 0.9276967, -0.4677918, 1, 0.8235294, 0, 1,
-1.107982, -0.5285836, -3.014169, 1, 0.827451, 0, 1,
-1.107246, 1.397714, -0.5662974, 1, 0.8352941, 0, 1,
-1.105488, -0.5367216, -2.975989, 1, 0.8392157, 0, 1,
-1.103049, 1.904558, -1.771353, 1, 0.8470588, 0, 1,
-1.100689, 1.274287, -1.710785, 1, 0.8509804, 0, 1,
-1.100267, 0.6198977, -0.7061625, 1, 0.8588235, 0, 1,
-1.080635, -0.6392321, -2.23524, 1, 0.8627451, 0, 1,
-1.080526, 0.5143143, 0.3509079, 1, 0.8705882, 0, 1,
-1.080336, -1.70765, -3.357126, 1, 0.8745098, 0, 1,
-1.079428, -0.8262109, -1.634462, 1, 0.8823529, 0, 1,
-1.078836, 0.9769731, -1.93916, 1, 0.8862745, 0, 1,
-1.075128, -0.07169987, -0.9295302, 1, 0.8941177, 0, 1,
-1.073794, -0.914266, -1.580807, 1, 0.8980392, 0, 1,
-1.071643, 0.03241429, -0.5921487, 1, 0.9058824, 0, 1,
-1.069985, 0.7082455, 0.4344258, 1, 0.9137255, 0, 1,
-1.068606, -0.1822623, -1.293101, 1, 0.9176471, 0, 1,
-1.054696, 1.185171, -0.1939495, 1, 0.9254902, 0, 1,
-1.051592, 0.6623718, -1.231442, 1, 0.9294118, 0, 1,
-1.046301, -1.207503, -0.577384, 1, 0.9372549, 0, 1,
-1.033547, -0.1933216, -1.349057, 1, 0.9411765, 0, 1,
-1.032189, 1.534093, -0.3204786, 1, 0.9490196, 0, 1,
-1.018942, -0.8543335, -2.079301, 1, 0.9529412, 0, 1,
-1.017228, -0.5823085, -4.195134, 1, 0.9607843, 0, 1,
-1.015697, 1.572777, -1.206984, 1, 0.9647059, 0, 1,
-1.011957, -0.3502077, -0.6476483, 1, 0.972549, 0, 1,
-1.007196, -0.6491376, -2.763376, 1, 0.9764706, 0, 1,
-0.9882498, -1.535261, -0.8972759, 1, 0.9843137, 0, 1,
-0.9873078, -0.04529761, -1.778877, 1, 0.9882353, 0, 1,
-0.9731228, 0.7605554, -2.185663, 1, 0.9960784, 0, 1,
-0.9705564, -1.002471, -2.208453, 0.9960784, 1, 0, 1,
-0.9678592, 0.3377977, -0.296363, 0.9921569, 1, 0, 1,
-0.9644241, 1.106446, -1.792319, 0.9843137, 1, 0, 1,
-0.9613032, -1.858669, -2.860298, 0.9803922, 1, 0, 1,
-0.9610369, 1.502576, 0.2863273, 0.972549, 1, 0, 1,
-0.9573748, 0.3059181, -3.488965, 0.9686275, 1, 0, 1,
-0.9571661, -1.156898, -2.915903, 0.9607843, 1, 0, 1,
-0.955738, 1.006019, -1.408371, 0.9568627, 1, 0, 1,
-0.953242, 0.5579148, -2.255778, 0.9490196, 1, 0, 1,
-0.9526252, -1.125659, -2.639466, 0.945098, 1, 0, 1,
-0.9509882, 0.756, -0.6549641, 0.9372549, 1, 0, 1,
-0.9468219, -0.8874713, -1.676701, 0.9333333, 1, 0, 1,
-0.9452866, -0.1856786, -1.700374, 0.9254902, 1, 0, 1,
-0.9392022, -0.4551417, -2.074192, 0.9215686, 1, 0, 1,
-0.9351354, -1.056905, -2.855783, 0.9137255, 1, 0, 1,
-0.9303367, 2.053391, -0.3866737, 0.9098039, 1, 0, 1,
-0.9291999, 0.1927865, -0.6183739, 0.9019608, 1, 0, 1,
-0.9285048, -0.468787, -1.986576, 0.8941177, 1, 0, 1,
-0.9261888, 2.554729, 0.3609055, 0.8901961, 1, 0, 1,
-0.9233443, 0.2874761, -1.859916, 0.8823529, 1, 0, 1,
-0.9210257, -0.4016214, -1.242427, 0.8784314, 1, 0, 1,
-0.9140527, -0.5961354, -2.29589, 0.8705882, 1, 0, 1,
-0.9134272, -0.2970235, -1.011373, 0.8666667, 1, 0, 1,
-0.9119033, -0.04782486, -1.394397, 0.8588235, 1, 0, 1,
-0.905094, 0.5206736, 0.3332058, 0.854902, 1, 0, 1,
-0.904891, -0.1011199, -2.06404, 0.8470588, 1, 0, 1,
-0.9020829, -0.2530764, -3.633266, 0.8431373, 1, 0, 1,
-0.9011738, -0.5644047, -2.145146, 0.8352941, 1, 0, 1,
-0.9006981, 0.3288397, -0.9720144, 0.8313726, 1, 0, 1,
-0.8806381, 0.3732569, -2.658613, 0.8235294, 1, 0, 1,
-0.8773093, -0.6385116, -3.533977, 0.8196079, 1, 0, 1,
-0.8740613, 0.9888895, -1.418638, 0.8117647, 1, 0, 1,
-0.8652944, 0.6160752, 0.8279831, 0.8078431, 1, 0, 1,
-0.864984, 0.4439658, -0.9283501, 0.8, 1, 0, 1,
-0.8640248, 0.5813373, -1.995603, 0.7921569, 1, 0, 1,
-0.8635188, -0.2287785, -3.608586, 0.7882353, 1, 0, 1,
-0.8592171, 0.5365248, -1.227804, 0.7803922, 1, 0, 1,
-0.8492184, -0.2755472, -1.093482, 0.7764706, 1, 0, 1,
-0.8487228, 1.050962, -0.4373515, 0.7686275, 1, 0, 1,
-0.8482899, -0.2120505, -0.7028435, 0.7647059, 1, 0, 1,
-0.8474028, 0.3645984, -2.113913, 0.7568628, 1, 0, 1,
-0.8462347, -0.7566484, -0.8230131, 0.7529412, 1, 0, 1,
-0.8442361, 0.04694919, -1.472028, 0.7450981, 1, 0, 1,
-0.8419054, 1.285514, -0.6447361, 0.7411765, 1, 0, 1,
-0.8384962, 0.8916966, -2.954723, 0.7333333, 1, 0, 1,
-0.829432, -1.322272, -3.510902, 0.7294118, 1, 0, 1,
-0.8250958, 0.4010572, -1.160069, 0.7215686, 1, 0, 1,
-0.8190503, -1.047938, -2.413993, 0.7176471, 1, 0, 1,
-0.8188788, -2.093276, -3.405939, 0.7098039, 1, 0, 1,
-0.8149948, 1.097464, 0.1811445, 0.7058824, 1, 0, 1,
-0.8145786, -0.3778669, -1.665752, 0.6980392, 1, 0, 1,
-0.8103676, -0.5709884, -2.975359, 0.6901961, 1, 0, 1,
-0.8099563, -0.6569878, -2.523702, 0.6862745, 1, 0, 1,
-0.8091393, 0.4064869, -0.5367104, 0.6784314, 1, 0, 1,
-0.801426, -1.057351, -1.608058, 0.6745098, 1, 0, 1,
-0.7981909, 1.603383, 0.01052744, 0.6666667, 1, 0, 1,
-0.7965239, -0.3067652, -1.054923, 0.6627451, 1, 0, 1,
-0.7844317, -1.729312, -3.298376, 0.654902, 1, 0, 1,
-0.7802543, -1.315618, -2.169242, 0.6509804, 1, 0, 1,
-0.7776445, -0.5445819, -3.60828, 0.6431373, 1, 0, 1,
-0.7734959, -0.1151015, -0.6271794, 0.6392157, 1, 0, 1,
-0.7722763, 2.041097, -0.9959562, 0.6313726, 1, 0, 1,
-0.7710685, -2.34498, -4.847494, 0.627451, 1, 0, 1,
-0.7654892, -0.5409155, -3.608173, 0.6196079, 1, 0, 1,
-0.7631587, 0.9703794, -0.1245908, 0.6156863, 1, 0, 1,
-0.7600086, -1.52274, -0.4401661, 0.6078432, 1, 0, 1,
-0.7542643, 1.373629, 0.2846914, 0.6039216, 1, 0, 1,
-0.753675, -1.704575, -2.841264, 0.5960785, 1, 0, 1,
-0.7473101, -0.5443301, -3.362325, 0.5882353, 1, 0, 1,
-0.7464414, 0.5712208, -2.185911, 0.5843138, 1, 0, 1,
-0.7464093, -0.5412379, -2.232463, 0.5764706, 1, 0, 1,
-0.7455602, 0.7740535, -2.106272, 0.572549, 1, 0, 1,
-0.7451976, 1.420143, -0.1035425, 0.5647059, 1, 0, 1,
-0.7420666, 0.02950793, -0.03789417, 0.5607843, 1, 0, 1,
-0.7387578, 0.1407491, -1.105269, 0.5529412, 1, 0, 1,
-0.7380771, -0.587371, -4.518129, 0.5490196, 1, 0, 1,
-0.7379283, -0.7756895, -2.722026, 0.5411765, 1, 0, 1,
-0.730396, -0.6218419, -3.493267, 0.5372549, 1, 0, 1,
-0.7277755, -0.8034353, -3.335526, 0.5294118, 1, 0, 1,
-0.7262169, 0.9832832, -0.8280423, 0.5254902, 1, 0, 1,
-0.7240044, 0.04022678, -0.9121755, 0.5176471, 1, 0, 1,
-0.7175981, -0.8230345, -2.106588, 0.5137255, 1, 0, 1,
-0.7120016, -0.3690627, -1.023437, 0.5058824, 1, 0, 1,
-0.7087298, 1.400706, 0.536838, 0.5019608, 1, 0, 1,
-0.7081035, 0.9674715, -1.23198, 0.4941176, 1, 0, 1,
-0.7079971, 0.144001, -1.875987, 0.4862745, 1, 0, 1,
-0.7066898, 1.474254, 0.2805467, 0.4823529, 1, 0, 1,
-0.7058604, 0.4535939, -1.207587, 0.4745098, 1, 0, 1,
-0.7034332, -0.7424976, -1.804613, 0.4705882, 1, 0, 1,
-0.7021461, 1.27085, -0.8316488, 0.4627451, 1, 0, 1,
-0.7019702, 1.206876, -0.3678007, 0.4588235, 1, 0, 1,
-0.6988243, 0.05864621, -0.5253248, 0.4509804, 1, 0, 1,
-0.6963996, -0.3757007, -1.730013, 0.4470588, 1, 0, 1,
-0.6872743, 0.07612523, -1.185232, 0.4392157, 1, 0, 1,
-0.6857638, 2.402911, 1.139046, 0.4352941, 1, 0, 1,
-0.6843492, 0.3973103, 0.1867372, 0.427451, 1, 0, 1,
-0.6834084, 1.04571, -0.6224145, 0.4235294, 1, 0, 1,
-0.680071, 0.1139422, -1.909723, 0.4156863, 1, 0, 1,
-0.6793641, -0.8519657, -1.814018, 0.4117647, 1, 0, 1,
-0.6783395, -0.9149183, -0.4466423, 0.4039216, 1, 0, 1,
-0.6701421, 0.4390354, 0.4848554, 0.3960784, 1, 0, 1,
-0.6700709, 0.8128376, -0.0829161, 0.3921569, 1, 0, 1,
-0.668251, 0.9972863, 0.4630338, 0.3843137, 1, 0, 1,
-0.6671698, -0.215291, -2.248166, 0.3803922, 1, 0, 1,
-0.6661785, -0.3551086, -1.678776, 0.372549, 1, 0, 1,
-0.6560671, 0.3685378, -1.65922, 0.3686275, 1, 0, 1,
-0.6551411, 0.8344601, 0.2564484, 0.3607843, 1, 0, 1,
-0.6464918, 1.851207, -0.6337257, 0.3568628, 1, 0, 1,
-0.6410515, -0.1890742, 0.137688, 0.3490196, 1, 0, 1,
-0.6366662, 0.06873541, 0.3054868, 0.345098, 1, 0, 1,
-0.6251451, -0.1630833, -1.416341, 0.3372549, 1, 0, 1,
-0.6247044, 1.492045, -1.670988, 0.3333333, 1, 0, 1,
-0.6235587, -0.7558449, -2.865698, 0.3254902, 1, 0, 1,
-0.6192507, -0.7967463, -0.9676145, 0.3215686, 1, 0, 1,
-0.6118015, -0.1424826, -0.7422674, 0.3137255, 1, 0, 1,
-0.6103476, 0.3455147, -0.3829063, 0.3098039, 1, 0, 1,
-0.6103001, 1.807741, -0.5864631, 0.3019608, 1, 0, 1,
-0.6092725, 0.3268613, -1.450991, 0.2941177, 1, 0, 1,
-0.6070803, 0.4402029, -2.629611, 0.2901961, 1, 0, 1,
-0.6052058, 0.2081825, -0.4954029, 0.282353, 1, 0, 1,
-0.6048929, -0.4775338, -1.695256, 0.2784314, 1, 0, 1,
-0.6036934, 0.5247574, -0.0001815498, 0.2705882, 1, 0, 1,
-0.5950824, -2.095265, -3.191104, 0.2666667, 1, 0, 1,
-0.5867331, 0.3151711, -0.4186979, 0.2588235, 1, 0, 1,
-0.5840177, -0.5458641, -1.816256, 0.254902, 1, 0, 1,
-0.5810589, -3.396347, -1.868894, 0.2470588, 1, 0, 1,
-0.5808239, -0.02750185, -0.7079238, 0.2431373, 1, 0, 1,
-0.573583, -0.6017995, -2.712861, 0.2352941, 1, 0, 1,
-0.5731433, -2.424098, -1.052013, 0.2313726, 1, 0, 1,
-0.5688949, 0.2115841, -1.036751, 0.2235294, 1, 0, 1,
-0.5675561, 0.9707708, -0.9524748, 0.2196078, 1, 0, 1,
-0.5637004, -0.2712341, -1.267831, 0.2117647, 1, 0, 1,
-0.5633714, 0.3788118, 0.4665476, 0.2078431, 1, 0, 1,
-0.554799, 1.317623, 0.4423292, 0.2, 1, 0, 1,
-0.5444016, 0.4271283, -1.01231, 0.1921569, 1, 0, 1,
-0.5425081, 0.8282587, 0.1164709, 0.1882353, 1, 0, 1,
-0.5382059, -0.1940611, -0.4023197, 0.1803922, 1, 0, 1,
-0.5374674, -1.179567, -2.158108, 0.1764706, 1, 0, 1,
-0.5373263, -0.6350715, -1.850812, 0.1686275, 1, 0, 1,
-0.5271335, -0.3820183, -3.016977, 0.1647059, 1, 0, 1,
-0.5249046, 1.016955, -0.8129418, 0.1568628, 1, 0, 1,
-0.5227082, -1.667811, -2.676404, 0.1529412, 1, 0, 1,
-0.5185004, 1.154435, -1.321129, 0.145098, 1, 0, 1,
-0.5081821, -0.6928966, -2.297663, 0.1411765, 1, 0, 1,
-0.5069934, 1.99874, -0.1961728, 0.1333333, 1, 0, 1,
-0.5058297, -0.1944256, -0.7635809, 0.1294118, 1, 0, 1,
-0.5042792, 0.6473615, -0.8690634, 0.1215686, 1, 0, 1,
-0.501089, -0.8988757, -3.794076, 0.1176471, 1, 0, 1,
-0.499202, 0.3188857, -1.69357, 0.1098039, 1, 0, 1,
-0.4988143, -2.128854, -1.76065, 0.1058824, 1, 0, 1,
-0.4957999, 0.5155195, -2.084468, 0.09803922, 1, 0, 1,
-0.4953979, 0.4223986, -0.1481153, 0.09019608, 1, 0, 1,
-0.4935239, 0.9427204, -1.173745, 0.08627451, 1, 0, 1,
-0.4895816, 1.160256, -0.1838316, 0.07843138, 1, 0, 1,
-0.4892966, 0.6809021, 0.1172472, 0.07450981, 1, 0, 1,
-0.486858, 3.098139, -1.563222, 0.06666667, 1, 0, 1,
-0.4811602, 0.9826447, 0.1412355, 0.0627451, 1, 0, 1,
-0.4785959, -0.107143, -1.743584, 0.05490196, 1, 0, 1,
-0.4775585, -0.9869829, -4.668923, 0.05098039, 1, 0, 1,
-0.4774534, -0.6489586, 0.6085644, 0.04313726, 1, 0, 1,
-0.4765817, 0.3915285, 1.127164, 0.03921569, 1, 0, 1,
-0.4754097, 1.325368, -1.009199, 0.03137255, 1, 0, 1,
-0.4726626, -0.154241, -2.165377, 0.02745098, 1, 0, 1,
-0.4698839, 0.620207, 0.7227208, 0.01960784, 1, 0, 1,
-0.4691061, 0.4340185, -0.02504468, 0.01568628, 1, 0, 1,
-0.4688899, -0.7260569, -1.409777, 0.007843138, 1, 0, 1,
-0.4683393, -0.1422645, -4.211318, 0.003921569, 1, 0, 1,
-0.4682607, -0.5193011, -3.36363, 0, 1, 0.003921569, 1,
-0.465016, -0.9077818, -3.492012, 0, 1, 0.01176471, 1,
-0.4632241, -0.08028869, 0.08557289, 0, 1, 0.01568628, 1,
-0.4605861, -0.9142905, -2.436968, 0, 1, 0.02352941, 1,
-0.4590782, 0.8388441, 1.270833, 0, 1, 0.02745098, 1,
-0.455968, 0.1717518, -1.454931, 0, 1, 0.03529412, 1,
-0.4523726, -0.2737716, -1.37098, 0, 1, 0.03921569, 1,
-0.4515315, 0.6544458, -1.516946, 0, 1, 0.04705882, 1,
-0.4510517, -0.2246458, -2.613881, 0, 1, 0.05098039, 1,
-0.4413047, 1.720906, -0.182217, 0, 1, 0.05882353, 1,
-0.4403454, 0.7784457, 0.8802568, 0, 1, 0.0627451, 1,
-0.4397876, 1.250853, -0.2284492, 0, 1, 0.07058824, 1,
-0.4371041, -0.482057, -2.983548, 0, 1, 0.07450981, 1,
-0.4330144, -1.160058, -3.713945, 0, 1, 0.08235294, 1,
-0.4326265, 0.1773853, -2.10126, 0, 1, 0.08627451, 1,
-0.4283309, -0.02318054, -1.762243, 0, 1, 0.09411765, 1,
-0.425344, 0.6089639, 0.165412, 0, 1, 0.1019608, 1,
-0.4223945, 0.158529, -1.51171, 0, 1, 0.1058824, 1,
-0.4222201, 1.202628, -1.527997, 0, 1, 0.1137255, 1,
-0.4213364, 0.1487381, -0.2607963, 0, 1, 0.1176471, 1,
-0.4196104, 0.4893356, -0.5001951, 0, 1, 0.1254902, 1,
-0.4136496, 0.4170556, -0.6563081, 0, 1, 0.1294118, 1,
-0.4131665, -0.563777, -2.203909, 0, 1, 0.1372549, 1,
-0.4128455, -0.2426352, -2.522796, 0, 1, 0.1411765, 1,
-0.412356, -0.1149066, -0.1413534, 0, 1, 0.1490196, 1,
-0.4115423, -0.2625276, -3.168979, 0, 1, 0.1529412, 1,
-0.409685, 0.02157833, -1.555758, 0, 1, 0.1607843, 1,
-0.4095251, -0.6194784, -1.753438, 0, 1, 0.1647059, 1,
-0.406121, -2.457922, -2.938652, 0, 1, 0.172549, 1,
-0.3981579, 0.9337938, 0.8869956, 0, 1, 0.1764706, 1,
-0.3932247, 0.1990158, 0.4729373, 0, 1, 0.1843137, 1,
-0.390118, -0.3718652, -1.707174, 0, 1, 0.1882353, 1,
-0.3880884, -0.5910011, -2.673113, 0, 1, 0.1960784, 1,
-0.3874836, 0.4310322, -1.315158, 0, 1, 0.2039216, 1,
-0.3819547, 0.3873094, -0.09316789, 0, 1, 0.2078431, 1,
-0.381205, 0.3344821, -0.5780762, 0, 1, 0.2156863, 1,
-0.3767951, -0.05721347, -1.172817, 0, 1, 0.2196078, 1,
-0.3767224, 0.4850272, -0.02401987, 0, 1, 0.227451, 1,
-0.3748855, 2.002182, -1.25505, 0, 1, 0.2313726, 1,
-0.3703601, 0.5124389, 2.843297, 0, 1, 0.2392157, 1,
-0.3694294, 0.97328, 1.043375, 0, 1, 0.2431373, 1,
-0.368005, 0.1589315, -0.6460447, 0, 1, 0.2509804, 1,
-0.3668883, 2.113359, 0.2658464, 0, 1, 0.254902, 1,
-0.3588489, 0.6089702, 0.2478724, 0, 1, 0.2627451, 1,
-0.3553014, 0.1329242, -0.4590862, 0, 1, 0.2666667, 1,
-0.3425213, 0.614328, -1.062623, 0, 1, 0.2745098, 1,
-0.3399566, -2.447352, -2.916645, 0, 1, 0.2784314, 1,
-0.3395886, -0.1457863, -3.885462, 0, 1, 0.2862745, 1,
-0.3365433, -1.628694, -2.742609, 0, 1, 0.2901961, 1,
-0.3310544, -0.01892331, -1.902495, 0, 1, 0.2980392, 1,
-0.3252187, 0.3494539, 0.250232, 0, 1, 0.3058824, 1,
-0.3248565, -0.5713996, -2.469321, 0, 1, 0.3098039, 1,
-0.3244183, -0.5398236, -2.103629, 0, 1, 0.3176471, 1,
-0.3215688, -0.3556232, -2.839845, 0, 1, 0.3215686, 1,
-0.3189451, 0.7145237, -1.703366, 0, 1, 0.3294118, 1,
-0.3180865, 0.3348107, -2.477591, 0, 1, 0.3333333, 1,
-0.31646, 0.2453224, -0.4244789, 0, 1, 0.3411765, 1,
-0.3124402, 0.1117437, -0.3077911, 0, 1, 0.345098, 1,
-0.304006, -0.3559525, -2.783698, 0, 1, 0.3529412, 1,
-0.3033876, 0.1806218, -0.7607303, 0, 1, 0.3568628, 1,
-0.3022806, 0.2273748, 0.6700703, 0, 1, 0.3647059, 1,
-0.3007026, -1.096482, -1.323012, 0, 1, 0.3686275, 1,
-0.2963195, 0.7980754, -1.131218, 0, 1, 0.3764706, 1,
-0.2854712, -1.498518, -1.789917, 0, 1, 0.3803922, 1,
-0.2799652, -0.3381883, -3.430802, 0, 1, 0.3882353, 1,
-0.2786718, 0.7228385, 0.3190663, 0, 1, 0.3921569, 1,
-0.2777657, 1.009918, -1.289695, 0, 1, 0.4, 1,
-0.2771189, 0.9551073, -0.9980979, 0, 1, 0.4078431, 1,
-0.2747377, -1.681898, -1.275899, 0, 1, 0.4117647, 1,
-0.2713332, 1.021703, -0.3716604, 0, 1, 0.4196078, 1,
-0.2652678, 0.6174771, 0.6562727, 0, 1, 0.4235294, 1,
-0.2607737, -0.5126251, -2.606182, 0, 1, 0.4313726, 1,
-0.2542468, -0.03772008, -2.180949, 0, 1, 0.4352941, 1,
-0.2530377, -0.6084484, -4.925265, 0, 1, 0.4431373, 1,
-0.2511951, 1.434346, -0.7292696, 0, 1, 0.4470588, 1,
-0.2511564, -0.430779, -1.750302, 0, 1, 0.454902, 1,
-0.2501139, -1.305247, -3.175978, 0, 1, 0.4588235, 1,
-0.2487852, 0.6419208, -1.896441, 0, 1, 0.4666667, 1,
-0.2475014, 0.6443685, 0.2359202, 0, 1, 0.4705882, 1,
-0.2450724, -0.5521334, -1.522329, 0, 1, 0.4784314, 1,
-0.2410745, 0.452668, -2.235737, 0, 1, 0.4823529, 1,
-0.2399965, 0.6768464, -1.739064, 0, 1, 0.4901961, 1,
-0.2398153, -0.6922482, -3.728528, 0, 1, 0.4941176, 1,
-0.237946, 0.3350907, -1.718772, 0, 1, 0.5019608, 1,
-0.2346992, -1.048071, -1.999252, 0, 1, 0.509804, 1,
-0.2340156, 0.4284798, -1.943835, 0, 1, 0.5137255, 1,
-0.2337049, -0.1913465, -2.785864, 0, 1, 0.5215687, 1,
-0.2328455, -0.1915707, -1.560474, 0, 1, 0.5254902, 1,
-0.2323481, 0.04976804, -1.443507, 0, 1, 0.5333334, 1,
-0.2305768, 1.583482, -0.08500279, 0, 1, 0.5372549, 1,
-0.2288695, 0.674262, -1.14592, 0, 1, 0.5450981, 1,
-0.221996, -0.1318238, -3.716043, 0, 1, 0.5490196, 1,
-0.2156607, -1.316279, -3.084434, 0, 1, 0.5568628, 1,
-0.2153984, -0.6424292, -2.171976, 0, 1, 0.5607843, 1,
-0.2153507, -0.5101177, -2.178411, 0, 1, 0.5686275, 1,
-0.2147981, -0.2653254, -2.361589, 0, 1, 0.572549, 1,
-0.2127502, -0.7874942, -2.17439, 0, 1, 0.5803922, 1,
-0.2106575, 1.172974, -1.731544, 0, 1, 0.5843138, 1,
-0.206277, -0.2720697, -3.630032, 0, 1, 0.5921569, 1,
-0.2051478, 0.4375403, -0.409337, 0, 1, 0.5960785, 1,
-0.2031272, -1.034128, -3.592285, 0, 1, 0.6039216, 1,
-0.2011651, -0.9237773, -3.059219, 0, 1, 0.6117647, 1,
-0.2006144, 0.6149089, 0.1728448, 0, 1, 0.6156863, 1,
-0.199982, -0.06257316, 0.3467362, 0, 1, 0.6235294, 1,
-0.1968471, 0.2084658, -1.894291, 0, 1, 0.627451, 1,
-0.196323, 0.5556992, -1.545836, 0, 1, 0.6352941, 1,
-0.1934485, -0.3219429, -4.209254, 0, 1, 0.6392157, 1,
-0.1875919, -0.218401, -1.929784, 0, 1, 0.6470588, 1,
-0.1875698, 1.422949, -0.3362689, 0, 1, 0.6509804, 1,
-0.1852994, -0.7755738, -3.551212, 0, 1, 0.6588235, 1,
-0.1840643, 0.3925665, -1.411326, 0, 1, 0.6627451, 1,
-0.1801217, 0.02063854, -1.441417, 0, 1, 0.6705883, 1,
-0.1792882, 0.9516691, -1.113581, 0, 1, 0.6745098, 1,
-0.1786699, -1.452148, -3.623116, 0, 1, 0.682353, 1,
-0.1781196, 1.591009, -0.7357154, 0, 1, 0.6862745, 1,
-0.1777438, -2.110242, -4.987623, 0, 1, 0.6941177, 1,
-0.1763582, 1.006298, -0.3663246, 0, 1, 0.7019608, 1,
-0.1752047, 0.8482636, 1.676033, 0, 1, 0.7058824, 1,
-0.1748981, -0.7763986, -3.064011, 0, 1, 0.7137255, 1,
-0.1732231, -0.7952878, -2.626086, 0, 1, 0.7176471, 1,
-0.1713071, 1.378697, -0.2548941, 0, 1, 0.7254902, 1,
-0.1687922, -0.2564175, -1.34427, 0, 1, 0.7294118, 1,
-0.159506, 0.8733036, 1.628931, 0, 1, 0.7372549, 1,
-0.1591936, 0.1754864, -0.05405331, 0, 1, 0.7411765, 1,
-0.157087, 0.2539526, -1.177123, 0, 1, 0.7490196, 1,
-0.1540192, -1.733038, -5.050071, 0, 1, 0.7529412, 1,
-0.1538365, 0.8404727, 0.2609699, 0, 1, 0.7607843, 1,
-0.1535672, -0.2058893, -1.922634, 0, 1, 0.7647059, 1,
-0.1522735, -0.6432226, -2.437511, 0, 1, 0.772549, 1,
-0.1509525, -2.666851, -1.645615, 0, 1, 0.7764706, 1,
-0.1507619, 0.9217731, 0.5808852, 0, 1, 0.7843137, 1,
-0.1464027, 1.21766, -0.07704847, 0, 1, 0.7882353, 1,
-0.1455518, -0.6286592, -2.626448, 0, 1, 0.7960784, 1,
-0.1414006, -0.2321596, -1.363321, 0, 1, 0.8039216, 1,
-0.1385997, 0.5703909, -2.20716, 0, 1, 0.8078431, 1,
-0.1378791, 2.108138, -0.3976649, 0, 1, 0.8156863, 1,
-0.137657, 0.8941219, -0.6789952, 0, 1, 0.8196079, 1,
-0.136055, 0.113465, -0.3179433, 0, 1, 0.827451, 1,
-0.1332576, -1.163104, -3.144893, 0, 1, 0.8313726, 1,
-0.1331289, 0.2987404, -1.903456, 0, 1, 0.8392157, 1,
-0.1318121, 0.8378015, -0.5847453, 0, 1, 0.8431373, 1,
-0.1293679, -1.257743, -2.278753, 0, 1, 0.8509804, 1,
-0.1292389, -0.4027959, -3.373193, 0, 1, 0.854902, 1,
-0.1260231, 2.752103, 1.208242, 0, 1, 0.8627451, 1,
-0.1197587, 0.1731041, 1.173142, 0, 1, 0.8666667, 1,
-0.1139178, 1.538347, 0.9145188, 0, 1, 0.8745098, 1,
-0.1117413, 0.3145131, -0.3195626, 0, 1, 0.8784314, 1,
-0.1052473, 0.4421599, 0.1711689, 0, 1, 0.8862745, 1,
-0.103037, -1.669675, -4.208621, 0, 1, 0.8901961, 1,
-0.1010427, -0.8244507, -2.75491, 0, 1, 0.8980392, 1,
-0.0996347, 1.991573, 1.880412, 0, 1, 0.9058824, 1,
-0.09691955, -1.234367, -1.099476, 0, 1, 0.9098039, 1,
-0.09432822, -0.560086, -1.821659, 0, 1, 0.9176471, 1,
-0.08871249, -2.039093, -2.595777, 0, 1, 0.9215686, 1,
-0.08566399, 0.3163652, 0.7135907, 0, 1, 0.9294118, 1,
-0.0849945, -0.00019842, -1.567381, 0, 1, 0.9333333, 1,
-0.08400322, 1.852818, -0.7486821, 0, 1, 0.9411765, 1,
-0.08383237, 0.3405329, 0.05177279, 0, 1, 0.945098, 1,
-0.0751138, -0.8232709, -5.112707, 0, 1, 0.9529412, 1,
-0.07082588, -0.8838387, -3.041916, 0, 1, 0.9568627, 1,
-0.06872395, -1.253642, -3.020958, 0, 1, 0.9647059, 1,
-0.06732493, -1.144884, -1.801949, 0, 1, 0.9686275, 1,
-0.06723835, -0.1359349, -0.9442126, 0, 1, 0.9764706, 1,
-0.06151718, 0.7767861, -0.200489, 0, 1, 0.9803922, 1,
-0.05849444, -0.248148, -3.536355, 0, 1, 0.9882353, 1,
-0.0558003, 0.1670455, -0.886744, 0, 1, 0.9921569, 1,
-0.0509486, 0.5761583, 0.1516466, 0, 1, 1, 1,
-0.04807615, -0.8035244, -3.396856, 0, 0.9921569, 1, 1,
-0.04366851, -0.5250334, -3.012434, 0, 0.9882353, 1, 1,
-0.04054732, 3.271482, 0.5009326, 0, 0.9803922, 1, 1,
-0.03924948, -1.058611, -3.586421, 0, 0.9764706, 1, 1,
-0.03424773, 1.339562, 1.008435, 0, 0.9686275, 1, 1,
-0.02988495, 1.468127, -1.37448, 0, 0.9647059, 1, 1,
-0.0280961, 0.9148813, 1.458319, 0, 0.9568627, 1, 1,
-0.02651421, 0.3036227, -0.8241352, 0, 0.9529412, 1, 1,
-0.02377337, 0.1633332, 1.076541, 0, 0.945098, 1, 1,
-0.02116967, 0.08430869, -1.988064, 0, 0.9411765, 1, 1,
-0.01679832, 0.3913749, -0.7108567, 0, 0.9333333, 1, 1,
-0.01435689, -0.9045843, -2.686017, 0, 0.9294118, 1, 1,
-0.00925644, 0.9083427, 1.018592, 0, 0.9215686, 1, 1,
-0.007464124, 0.288751, -0.3986102, 0, 0.9176471, 1, 1,
-0.007365116, -0.5533322, -3.475178, 0, 0.9098039, 1, 1,
-0.006985139, 0.2368036, -0.9807309, 0, 0.9058824, 1, 1,
-0.005094333, 0.1718986, -0.9236544, 0, 0.8980392, 1, 1,
0.002035771, 1.393364, -0.2909614, 0, 0.8901961, 1, 1,
0.003939012, -0.8131129, 4.332757, 0, 0.8862745, 1, 1,
0.004037064, -0.7441004, 3.771997, 0, 0.8784314, 1, 1,
0.004510974, 0.1504777, 1.224109, 0, 0.8745098, 1, 1,
0.01234328, 1.401342, 0.6877972, 0, 0.8666667, 1, 1,
0.016085, 0.6837556, -0.1903036, 0, 0.8627451, 1, 1,
0.01796631, -1.163392, 3.083328, 0, 0.854902, 1, 1,
0.02163547, 0.2510197, 1.932521, 0, 0.8509804, 1, 1,
0.02226836, 0.8164614, -0.3331388, 0, 0.8431373, 1, 1,
0.02242795, -0.4606974, 2.685429, 0, 0.8392157, 1, 1,
0.02446324, 1.941719, 0.4377294, 0, 0.8313726, 1, 1,
0.02602725, -0.2320482, 2.405939, 0, 0.827451, 1, 1,
0.02648563, 1.560381, -0.406448, 0, 0.8196079, 1, 1,
0.0351551, 1.129063, -0.04648711, 0, 0.8156863, 1, 1,
0.03637993, -0.5428529, 3.169056, 0, 0.8078431, 1, 1,
0.04159289, 0.2208899, 0.2414705, 0, 0.8039216, 1, 1,
0.04167945, -0.06360173, 0.8246601, 0, 0.7960784, 1, 1,
0.04224599, 0.2101891, 1.433257, 0, 0.7882353, 1, 1,
0.04558533, -0.4961374, 3.54859, 0, 0.7843137, 1, 1,
0.04653335, -0.66557, 2.635864, 0, 0.7764706, 1, 1,
0.05265474, 0.6873211, 0.3516773, 0, 0.772549, 1, 1,
0.05640212, 2.565415, 0.6382307, 0, 0.7647059, 1, 1,
0.05739521, -0.5572211, 2.646688, 0, 0.7607843, 1, 1,
0.05931446, 0.7983139, 0.0669725, 0, 0.7529412, 1, 1,
0.06151659, 0.784055, 0.06855249, 0, 0.7490196, 1, 1,
0.06283801, 1.33565, 0.3584563, 0, 0.7411765, 1, 1,
0.063567, 2.292847, -1.21794, 0, 0.7372549, 1, 1,
0.06764639, 0.3767633, -0.8204391, 0, 0.7294118, 1, 1,
0.06768396, -0.6994339, 1.530901, 0, 0.7254902, 1, 1,
0.07104936, 0.5824247, -1.204918, 0, 0.7176471, 1, 1,
0.07112838, 0.9004319, -0.6356444, 0, 0.7137255, 1, 1,
0.07394274, 1.126912, 0.02038459, 0, 0.7058824, 1, 1,
0.07826625, 0.4470747, -0.2412539, 0, 0.6980392, 1, 1,
0.07947373, 0.415994, 1.765616, 0, 0.6941177, 1, 1,
0.08449663, -0.6304631, 3.032123, 0, 0.6862745, 1, 1,
0.1033305, -0.134564, 1.129188, 0, 0.682353, 1, 1,
0.1070108, 2.169556, 1.781596, 0, 0.6745098, 1, 1,
0.1148636, -0.9990475, 0.9012685, 0, 0.6705883, 1, 1,
0.1176101, 1.051697, -0.2597178, 0, 0.6627451, 1, 1,
0.1181168, -1.751912, 1.116923, 0, 0.6588235, 1, 1,
0.1206783, -0.6277115, 4.901296, 0, 0.6509804, 1, 1,
0.1212856, -0.8775603, 1.679289, 0, 0.6470588, 1, 1,
0.1267343, -0.6695201, 4.003277, 0, 0.6392157, 1, 1,
0.1312102, 0.7801069, 1.171297, 0, 0.6352941, 1, 1,
0.1317449, -0.4500259, 1.788604, 0, 0.627451, 1, 1,
0.1338344, -1.819196, 4.810829, 0, 0.6235294, 1, 1,
0.135972, -0.3167953, 2.952327, 0, 0.6156863, 1, 1,
0.136452, 0.3523027, 1.626429, 0, 0.6117647, 1, 1,
0.1403798, -1.084484, 3.865208, 0, 0.6039216, 1, 1,
0.14116, 1.257213, 1.607925, 0, 0.5960785, 1, 1,
0.1445033, -0.1054144, 2.674268, 0, 0.5921569, 1, 1,
0.14491, -1.265849, 3.99606, 0, 0.5843138, 1, 1,
0.1492656, -2.498102, 3.467409, 0, 0.5803922, 1, 1,
0.1516174, -0.5589496, 4.602062, 0, 0.572549, 1, 1,
0.152819, -0.9955254, 2.307036, 0, 0.5686275, 1, 1,
0.1539128, -1.564772, 3.002822, 0, 0.5607843, 1, 1,
0.1550364, 0.2597394, 0.003635831, 0, 0.5568628, 1, 1,
0.1661357, -2.43491, 4.035404, 0, 0.5490196, 1, 1,
0.1740185, -0.9596361, 2.881326, 0, 0.5450981, 1, 1,
0.1753485, -0.6933232, 2.822168, 0, 0.5372549, 1, 1,
0.179288, -1.513624, 2.076597, 0, 0.5333334, 1, 1,
0.179358, -0.3449268, 1.443846, 0, 0.5254902, 1, 1,
0.1811938, -0.7574103, 3.329964, 0, 0.5215687, 1, 1,
0.1852084, 0.8652585, 3.105189, 0, 0.5137255, 1, 1,
0.1853069, -0.2503751, 3.928282, 0, 0.509804, 1, 1,
0.1853971, -0.1373064, 3.422689, 0, 0.5019608, 1, 1,
0.1875797, -0.01408848, 2.601043, 0, 0.4941176, 1, 1,
0.189671, 0.3593901, 0.3377091, 0, 0.4901961, 1, 1,
0.192188, -1.963103, 3.276915, 0, 0.4823529, 1, 1,
0.192815, 0.9289249, -0.5374627, 0, 0.4784314, 1, 1,
0.1939292, -0.7470813, 4.44471, 0, 0.4705882, 1, 1,
0.199904, -0.1761642, 1.872625, 0, 0.4666667, 1, 1,
0.1999842, 0.7088127, 0.2695839, 0, 0.4588235, 1, 1,
0.2004863, 0.2813683, 0.8963792, 0, 0.454902, 1, 1,
0.202704, -0.4312996, 1.889467, 0, 0.4470588, 1, 1,
0.2048064, 2.315132, -0.4539113, 0, 0.4431373, 1, 1,
0.2244281, -0.3119477, 3.507303, 0, 0.4352941, 1, 1,
0.2252138, 2.069433, 0.6238165, 0, 0.4313726, 1, 1,
0.2271624, -0.1620861, 3.438802, 0, 0.4235294, 1, 1,
0.2287934, 0.8111725, 0.3499478, 0, 0.4196078, 1, 1,
0.2328225, 0.7428203, 0.5657176, 0, 0.4117647, 1, 1,
0.232861, -2.208354, 3.740333, 0, 0.4078431, 1, 1,
0.233522, -0.2762869, 2.786981, 0, 0.4, 1, 1,
0.2359553, 0.692891, 0.108896, 0, 0.3921569, 1, 1,
0.2360797, -0.9058963, 3.109647, 0, 0.3882353, 1, 1,
0.2384993, -0.9562581, 3.716213, 0, 0.3803922, 1, 1,
0.2426616, 1.433096, 0.08926833, 0, 0.3764706, 1, 1,
0.2437396, -0.6715643, 3.633346, 0, 0.3686275, 1, 1,
0.2472276, 1.262877, -1.584725, 0, 0.3647059, 1, 1,
0.250985, -1.251246, 3.314905, 0, 0.3568628, 1, 1,
0.2537072, -1.400114, 3.317129, 0, 0.3529412, 1, 1,
0.2607645, 2.130833, 0.2563825, 0, 0.345098, 1, 1,
0.2618212, 0.1386162, 0.9200883, 0, 0.3411765, 1, 1,
0.2625186, 0.152197, 0.2588304, 0, 0.3333333, 1, 1,
0.2682779, 0.3826158, 0.4467974, 0, 0.3294118, 1, 1,
0.2708904, -1.23192, 3.332818, 0, 0.3215686, 1, 1,
0.2725405, -1.083005, 3.084505, 0, 0.3176471, 1, 1,
0.2750763, -0.5150194, 2.856713, 0, 0.3098039, 1, 1,
0.2787008, -0.1557996, 0.558539, 0, 0.3058824, 1, 1,
0.2842259, -0.9539363, 3.329207, 0, 0.2980392, 1, 1,
0.2877055, 0.2963539, 0.8979901, 0, 0.2901961, 1, 1,
0.2879033, -1.177373, 2.318063, 0, 0.2862745, 1, 1,
0.2882739, -0.3387649, 0.1847781, 0, 0.2784314, 1, 1,
0.2888581, -0.2405537, 3.073785, 0, 0.2745098, 1, 1,
0.2977481, -2.161942, 1.982619, 0, 0.2666667, 1, 1,
0.2990265, -1.805203, 2.446391, 0, 0.2627451, 1, 1,
0.2997722, 0.9546705, 0.3859446, 0, 0.254902, 1, 1,
0.3069437, -0.5537915, 3.700785, 0, 0.2509804, 1, 1,
0.3076565, -0.4142131, 3.836537, 0, 0.2431373, 1, 1,
0.3084345, -0.8158187, 2.531239, 0, 0.2392157, 1, 1,
0.3171231, -1.233858, 2.822063, 0, 0.2313726, 1, 1,
0.3180384, -0.5883351, 0.537948, 0, 0.227451, 1, 1,
0.3182816, 0.4942691, -0.4312685, 0, 0.2196078, 1, 1,
0.3214581, 1.420366, 1.567194, 0, 0.2156863, 1, 1,
0.3229598, 0.3007797, -0.2861592, 0, 0.2078431, 1, 1,
0.3365491, 0.2532142, 1.537305, 0, 0.2039216, 1, 1,
0.3417724, 0.4039955, 0.9498069, 0, 0.1960784, 1, 1,
0.3461428, 1.592282, -0.364011, 0, 0.1882353, 1, 1,
0.3466929, 1.697696, 0.3482538, 0, 0.1843137, 1, 1,
0.3469534, -0.2099856, 0.8473383, 0, 0.1764706, 1, 1,
0.3477311, -0.7164119, 2.359316, 0, 0.172549, 1, 1,
0.3479641, -0.1660349, 1.862802, 0, 0.1647059, 1, 1,
0.3480587, -0.4464504, 0.8271462, 0, 0.1607843, 1, 1,
0.3487225, -1.15681, 2.483458, 0, 0.1529412, 1, 1,
0.3489331, -1.011236, 2.41339, 0, 0.1490196, 1, 1,
0.3518596, 1.211673, 0.7999383, 0, 0.1411765, 1, 1,
0.3573102, 0.5562342, -1.584729, 0, 0.1372549, 1, 1,
0.3607383, -0.722892, 1.456912, 0, 0.1294118, 1, 1,
0.3625219, 0.1778857, 1.530821, 0, 0.1254902, 1, 1,
0.3630381, -0.1930388, 1.481633, 0, 0.1176471, 1, 1,
0.3638437, -0.1060908, 0.1545076, 0, 0.1137255, 1, 1,
0.3652475, 0.8943992, 0.5827072, 0, 0.1058824, 1, 1,
0.3653772, 0.4704115, -0.7487268, 0, 0.09803922, 1, 1,
0.3677144, -0.7129471, 1.761613, 0, 0.09411765, 1, 1,
0.3705364, -0.06785051, 0.5735236, 0, 0.08627451, 1, 1,
0.3706664, 1.286071, 0.6116696, 0, 0.08235294, 1, 1,
0.3724269, 0.7391337, 0.04501336, 0, 0.07450981, 1, 1,
0.3761458, 0.09461658, 1.525907, 0, 0.07058824, 1, 1,
0.3780493, 0.3170019, -0.4262063, 0, 0.0627451, 1, 1,
0.3812307, -0.9375982, 1.38887, 0, 0.05882353, 1, 1,
0.3849057, -1.550821, 3.65916, 0, 0.05098039, 1, 1,
0.3879728, -0.6116226, 2.708886, 0, 0.04705882, 1, 1,
0.3885752, -0.3943947, 1.553619, 0, 0.03921569, 1, 1,
0.3928014, -1.766253, 4.700938, 0, 0.03529412, 1, 1,
0.3947304, -0.4385934, 1.683382, 0, 0.02745098, 1, 1,
0.3949383, -0.5223063, 1.165201, 0, 0.02352941, 1, 1,
0.4038811, 0.1349998, 1.202323, 0, 0.01568628, 1, 1,
0.4040193, -0.03253991, 3.531857, 0, 0.01176471, 1, 1,
0.4055761, -0.3479153, 1.647081, 0, 0.003921569, 1, 1,
0.4057541, -1.525734, 3.341801, 0.003921569, 0, 1, 1,
0.4070376, 0.6228252, -0.5220143, 0.007843138, 0, 1, 1,
0.4101094, -0.03720764, 0.7893081, 0.01568628, 0, 1, 1,
0.4178655, -1.25694, 4.93827, 0.01960784, 0, 1, 1,
0.4218217, -0.06017161, 3.944059, 0.02745098, 0, 1, 1,
0.4240702, 0.05402846, 2.702198, 0.03137255, 0, 1, 1,
0.4259053, 0.7014029, 0.1879561, 0.03921569, 0, 1, 1,
0.4259456, 0.6107991, 1.284624, 0.04313726, 0, 1, 1,
0.4273179, 0.228352, 0.65522, 0.05098039, 0, 1, 1,
0.4310694, 0.1368455, 2.406357, 0.05490196, 0, 1, 1,
0.4328015, 1.980183, -0.3861844, 0.0627451, 0, 1, 1,
0.4342469, 0.2977133, 1.114458, 0.06666667, 0, 1, 1,
0.4390736, -1.069743, 1.704368, 0.07450981, 0, 1, 1,
0.4422626, -0.3104033, 2.196609, 0.07843138, 0, 1, 1,
0.4447633, -1.09819, 2.067998, 0.08627451, 0, 1, 1,
0.4461114, -0.7045408, 2.772496, 0.09019608, 0, 1, 1,
0.447777, -0.1042148, 1.890629, 0.09803922, 0, 1, 1,
0.4499654, 1.408898, 2.448536, 0.1058824, 0, 1, 1,
0.4513529, -1.113029, 4.109533, 0.1098039, 0, 1, 1,
0.4515227, -0.8963881, 1.058686, 0.1176471, 0, 1, 1,
0.4526247, -0.3993425, 3.683585, 0.1215686, 0, 1, 1,
0.4553202, -0.9953117, 1.493939, 0.1294118, 0, 1, 1,
0.4558668, -0.03712511, 2.132475, 0.1333333, 0, 1, 1,
0.4576746, -0.4093352, 1.148067, 0.1411765, 0, 1, 1,
0.4582863, 0.9003346, 1.026224, 0.145098, 0, 1, 1,
0.459589, 1.620314, -1.501967, 0.1529412, 0, 1, 1,
0.4620899, 0.5812038, -0.1452305, 0.1568628, 0, 1, 1,
0.4635153, -0.4048775, 0.6310608, 0.1647059, 0, 1, 1,
0.4671144, -0.8324431, 0.7067823, 0.1686275, 0, 1, 1,
0.4705937, 0.4644049, -0.4785669, 0.1764706, 0, 1, 1,
0.4716557, 0.2769256, 1.936168, 0.1803922, 0, 1, 1,
0.4729273, -0.6128092, 2.883711, 0.1882353, 0, 1, 1,
0.4756245, 0.2564112, 2.686601, 0.1921569, 0, 1, 1,
0.4788906, -0.4538517, 1.617924, 0.2, 0, 1, 1,
0.4844919, 0.7825999, 0.08333991, 0.2078431, 0, 1, 1,
0.4845206, -0.2975329, 0.7802532, 0.2117647, 0, 1, 1,
0.4846449, -2.949735, 3.220811, 0.2196078, 0, 1, 1,
0.4871855, -0.7515604, 1.763612, 0.2235294, 0, 1, 1,
0.4872591, -0.08403344, 1.034164, 0.2313726, 0, 1, 1,
0.4912504, -1.344822, 2.530583, 0.2352941, 0, 1, 1,
0.4915852, -1.162619, 2.338938, 0.2431373, 0, 1, 1,
0.492787, -1.383235, 3.013736, 0.2470588, 0, 1, 1,
0.4937443, 0.9159379, 0.6485951, 0.254902, 0, 1, 1,
0.4942434, -0.4335224, 1.43536, 0.2588235, 0, 1, 1,
0.4960996, 1.011904, 0.04562883, 0.2666667, 0, 1, 1,
0.4970134, 0.3258932, 1.347497, 0.2705882, 0, 1, 1,
0.4994409, 0.8577798, 1.641506, 0.2784314, 0, 1, 1,
0.5005737, 0.02186058, 3.062766, 0.282353, 0, 1, 1,
0.5019217, -1.761944, 3.938347, 0.2901961, 0, 1, 1,
0.5061782, -1.284685, 3.443354, 0.2941177, 0, 1, 1,
0.5088397, -0.5555452, 2.223019, 0.3019608, 0, 1, 1,
0.5095792, -0.9963353, 4.776659, 0.3098039, 0, 1, 1,
0.5127183, 0.09870178, 1.172139, 0.3137255, 0, 1, 1,
0.5152472, 0.6353747, 0.6051612, 0.3215686, 0, 1, 1,
0.521385, 0.9738095, -0.5710547, 0.3254902, 0, 1, 1,
0.522453, 0.8711762, -0.9884928, 0.3333333, 0, 1, 1,
0.5249016, -1.033843, 1.822306, 0.3372549, 0, 1, 1,
0.527356, -1.028806, 3.450464, 0.345098, 0, 1, 1,
0.531752, 0.2421189, 1.342775, 0.3490196, 0, 1, 1,
0.5327418, 1.151138, 0.4349395, 0.3568628, 0, 1, 1,
0.5340798, -1.008429, 3.244061, 0.3607843, 0, 1, 1,
0.5408469, 0.4561535, 2.440189, 0.3686275, 0, 1, 1,
0.5488787, -0.8909712, 4.101252, 0.372549, 0, 1, 1,
0.5507096, -0.07494219, 1.852092, 0.3803922, 0, 1, 1,
0.5515789, -1.565459, 2.673077, 0.3843137, 0, 1, 1,
0.5553949, 0.8630843, -1.124147, 0.3921569, 0, 1, 1,
0.5613061, -0.2873967, 0.9822593, 0.3960784, 0, 1, 1,
0.5683095, -1.675696, 1.219003, 0.4039216, 0, 1, 1,
0.5719246, -0.1994569, 3.468102, 0.4117647, 0, 1, 1,
0.5723742, -1.147951, 2.858612, 0.4156863, 0, 1, 1,
0.5724455, 1.152017, 2.174144, 0.4235294, 0, 1, 1,
0.5770987, -0.3732639, 1.484095, 0.427451, 0, 1, 1,
0.5785387, -0.1090293, 3.050005, 0.4352941, 0, 1, 1,
0.5788808, 1.019728, 0.4035883, 0.4392157, 0, 1, 1,
0.579285, 0.2216912, -0.3616247, 0.4470588, 0, 1, 1,
0.5818038, 0.3373739, 1.176397, 0.4509804, 0, 1, 1,
0.5828786, -0.4780123, 2.75214, 0.4588235, 0, 1, 1,
0.5834343, -0.622681, 2.752348, 0.4627451, 0, 1, 1,
0.5849438, -0.7773874, 0.6807105, 0.4705882, 0, 1, 1,
0.5930694, 0.8261684, -0.1510414, 0.4745098, 0, 1, 1,
0.5976299, -0.8681171, 1.688378, 0.4823529, 0, 1, 1,
0.6049121, 1.329271, 0.0435955, 0.4862745, 0, 1, 1,
0.6089809, 0.4565524, 1.467933, 0.4941176, 0, 1, 1,
0.6221914, -0.1907099, 1.880985, 0.5019608, 0, 1, 1,
0.6287283, 0.7425351, -0.0299414, 0.5058824, 0, 1, 1,
0.6316282, -0.0276678, 1.473602, 0.5137255, 0, 1, 1,
0.6336353, -0.4313382, 2.783412, 0.5176471, 0, 1, 1,
0.6348158, 0.6249396, -0.08887329, 0.5254902, 0, 1, 1,
0.6361398, 1.894709, 1.050832, 0.5294118, 0, 1, 1,
0.6479866, 0.6325291, 1.316515, 0.5372549, 0, 1, 1,
0.6488013, 2.678241, -0.3549187, 0.5411765, 0, 1, 1,
0.6502877, -1.773594, 1.534722, 0.5490196, 0, 1, 1,
0.6553085, 0.8094075, 0.4987858, 0.5529412, 0, 1, 1,
0.6563141, -0.6302923, 1.122702, 0.5607843, 0, 1, 1,
0.6576609, 0.7021266, -0.591266, 0.5647059, 0, 1, 1,
0.6587501, 0.1498871, 1.350679, 0.572549, 0, 1, 1,
0.6648643, -2.216517, 1.160441, 0.5764706, 0, 1, 1,
0.6663191, -0.7263951, 2.84499, 0.5843138, 0, 1, 1,
0.6686935, -1.916971, 1.779744, 0.5882353, 0, 1, 1,
0.6695588, -0.1027544, 3.144073, 0.5960785, 0, 1, 1,
0.6786034, -0.3452692, 3.316099, 0.6039216, 0, 1, 1,
0.6788329, 1.410329, 0.7399737, 0.6078432, 0, 1, 1,
0.6789196, -0.8251097, 3.554952, 0.6156863, 0, 1, 1,
0.6809838, -0.8887668, 2.790838, 0.6196079, 0, 1, 1,
0.6811673, 0.3934444, 1.374363, 0.627451, 0, 1, 1,
0.6827623, -0.8419477, 2.173624, 0.6313726, 0, 1, 1,
0.686982, -0.5772052, 1.378605, 0.6392157, 0, 1, 1,
0.6873574, -1.361525, 4.049018, 0.6431373, 0, 1, 1,
0.687736, -0.1612937, 2.406444, 0.6509804, 0, 1, 1,
0.6892638, -0.8416299, 1.72278, 0.654902, 0, 1, 1,
0.6910847, -0.6752012, 1.179274, 0.6627451, 0, 1, 1,
0.6937767, -0.2471484, 1.690091, 0.6666667, 0, 1, 1,
0.6961279, -0.614045, 1.709759, 0.6745098, 0, 1, 1,
0.6970977, 1.213678, -0.3056331, 0.6784314, 0, 1, 1,
0.7020452, 1.032188, 1.333782, 0.6862745, 0, 1, 1,
0.7033436, 1.040663, 1.635264, 0.6901961, 0, 1, 1,
0.7058827, -0.3430743, 2.615155, 0.6980392, 0, 1, 1,
0.7117908, 0.324881, 1.085353, 0.7058824, 0, 1, 1,
0.717006, 0.2705942, 0.6310259, 0.7098039, 0, 1, 1,
0.7228521, 1.733613, 0.8283778, 0.7176471, 0, 1, 1,
0.7241149, 2.245843, -0.4903362, 0.7215686, 0, 1, 1,
0.7293384, -0.9323246, 2.715412, 0.7294118, 0, 1, 1,
0.732857, 0.4393855, 2.360308, 0.7333333, 0, 1, 1,
0.738542, 0.2318528, 3.003456, 0.7411765, 0, 1, 1,
0.7411059, 0.6772667, -0.04773296, 0.7450981, 0, 1, 1,
0.7441643, 1.705051, -0.7650447, 0.7529412, 0, 1, 1,
0.7566912, 0.7242112, 1.502929, 0.7568628, 0, 1, 1,
0.7634515, -1.901896, 2.098599, 0.7647059, 0, 1, 1,
0.7639104, -1.212701, 1.712136, 0.7686275, 0, 1, 1,
0.7778878, 0.4960426, 2.636139, 0.7764706, 0, 1, 1,
0.7793568, -0.3703486, 0.9740709, 0.7803922, 0, 1, 1,
0.7798262, 0.4015631, 1.080724, 0.7882353, 0, 1, 1,
0.7835078, 0.7640163, -0.4498838, 0.7921569, 0, 1, 1,
0.7852643, -0.5077532, 1.62628, 0.8, 0, 1, 1,
0.7891507, -0.4132145, 2.707764, 0.8078431, 0, 1, 1,
0.7931495, 0.3625365, 3.561485, 0.8117647, 0, 1, 1,
0.7954333, 1.029168, 0.9874192, 0.8196079, 0, 1, 1,
0.7999011, 0.31632, 2.558654, 0.8235294, 0, 1, 1,
0.8033217, 0.4727997, 1.803746, 0.8313726, 0, 1, 1,
0.8124564, -0.5950105, 2.182533, 0.8352941, 0, 1, 1,
0.8146883, 0.5255138, 0.8618791, 0.8431373, 0, 1, 1,
0.8271703, -0.9636995, 2.405443, 0.8470588, 0, 1, 1,
0.8272685, 1.445442, 0.5852715, 0.854902, 0, 1, 1,
0.8397393, -0.09874347, 1.55776, 0.8588235, 0, 1, 1,
0.8398007, -0.8998247, 3.388338, 0.8666667, 0, 1, 1,
0.8467913, 1.613991, -0.2617627, 0.8705882, 0, 1, 1,
0.8470137, -0.3590814, 2.449627, 0.8784314, 0, 1, 1,
0.8573979, -0.4904597, 2.270409, 0.8823529, 0, 1, 1,
0.8596187, 0.2292886, 3.172586, 0.8901961, 0, 1, 1,
0.8658639, 0.1549606, 2.553789, 0.8941177, 0, 1, 1,
0.8677181, 0.5060162, 0.5138112, 0.9019608, 0, 1, 1,
0.8683411, 1.541122, 0.5168619, 0.9098039, 0, 1, 1,
0.8694152, 1.649577, -1.353318, 0.9137255, 0, 1, 1,
0.8729957, -1.065969, 0.7325965, 0.9215686, 0, 1, 1,
0.8807516, -3.202223, 3.06057, 0.9254902, 0, 1, 1,
0.8897022, 0.8054686, 1.151665, 0.9333333, 0, 1, 1,
0.8919904, 0.8776208, -0.333796, 0.9372549, 0, 1, 1,
0.9069541, -0.3286245, 0.709803, 0.945098, 0, 1, 1,
0.9091363, -1.635421, 2.848906, 0.9490196, 0, 1, 1,
0.9167812, 0.7141808, 0.04738961, 0.9568627, 0, 1, 1,
0.9201603, -0.8392428, 2.747904, 0.9607843, 0, 1, 1,
0.9201912, -2.100154, 1.843045, 0.9686275, 0, 1, 1,
0.9267185, -2.242186, 3.218109, 0.972549, 0, 1, 1,
0.9331035, 1.312318, -0.01642292, 0.9803922, 0, 1, 1,
0.9470336, 0.3754812, 0.3926241, 0.9843137, 0, 1, 1,
0.9495454, 0.5657325, 1.03575, 0.9921569, 0, 1, 1,
0.9614072, 0.644664, 1.546807, 0.9960784, 0, 1, 1,
0.9617895, -0.8829049, 2.825319, 1, 0, 0.9960784, 1,
0.9623376, -0.5634733, 1.369014, 1, 0, 0.9882353, 1,
0.9664983, -0.4487251, 0.6062379, 1, 0, 0.9843137, 1,
0.968623, 2.111037, 1.587826, 1, 0, 0.9764706, 1,
0.9756465, 0.1675421, 2.601452, 1, 0, 0.972549, 1,
0.9818093, -1.07969, 4.087925, 1, 0, 0.9647059, 1,
0.9911072, 1.916514, -0.1483686, 1, 0, 0.9607843, 1,
0.9982588, 0.4380265, 1.517882, 1, 0, 0.9529412, 1,
0.9986545, 0.685104, -0.3686234, 1, 0, 0.9490196, 1,
1.010591, 1.741933, 1.317172, 1, 0, 0.9411765, 1,
1.014281, 0.281394, 1.873816, 1, 0, 0.9372549, 1,
1.01676, 0.7020006, 0.9632387, 1, 0, 0.9294118, 1,
1.017825, -0.04400057, 2.36253, 1, 0, 0.9254902, 1,
1.023955, 0.5313323, -0.4224471, 1, 0, 0.9176471, 1,
1.027268, -0.501864, 1.523421, 1, 0, 0.9137255, 1,
1.034991, 0.8130637, 2.228165, 1, 0, 0.9058824, 1,
1.055933, -0.7180804, 2.57649, 1, 0, 0.9019608, 1,
1.057566, -1.071415, 3.173943, 1, 0, 0.8941177, 1,
1.07422, 0.50427, 0.6982954, 1, 0, 0.8862745, 1,
1.075361, 0.06050766, 1.876767, 1, 0, 0.8823529, 1,
1.080865, 1.36746, -0.9383289, 1, 0, 0.8745098, 1,
1.088815, -0.5511472, 2.566504, 1, 0, 0.8705882, 1,
1.094113, 0.2746949, 1.950064, 1, 0, 0.8627451, 1,
1.096526, -0.3623397, 1.262566, 1, 0, 0.8588235, 1,
1.102358, -0.8457822, 2.914003, 1, 0, 0.8509804, 1,
1.103977, 0.6109695, 2.433079, 1, 0, 0.8470588, 1,
1.115159, 0.2607971, 2.315722, 1, 0, 0.8392157, 1,
1.11771, 0.4065565, 1.18909, 1, 0, 0.8352941, 1,
1.122905, 0.8310988, 0.4501334, 1, 0, 0.827451, 1,
1.130598, 0.76662, 1.851947, 1, 0, 0.8235294, 1,
1.133478, -1.529385, 2.928434, 1, 0, 0.8156863, 1,
1.13558, -2.038332, 3.752498, 1, 0, 0.8117647, 1,
1.137913, 0.9464797, 0.7004581, 1, 0, 0.8039216, 1,
1.141921, 0.2526707, 0.8218496, 1, 0, 0.7960784, 1,
1.157016, 0.1029067, 1.940704, 1, 0, 0.7921569, 1,
1.159013, 0.0676598, 1.855641, 1, 0, 0.7843137, 1,
1.160867, -0.03661592, 0.4804026, 1, 0, 0.7803922, 1,
1.166172, 1.443128, 0.5778294, 1, 0, 0.772549, 1,
1.170424, -0.03903315, 2.03717, 1, 0, 0.7686275, 1,
1.175469, 1.426939, 0.4972643, 1, 0, 0.7607843, 1,
1.175998, 0.4429365, -0.3519657, 1, 0, 0.7568628, 1,
1.183379, 0.4423178, -0.7106962, 1, 0, 0.7490196, 1,
1.194052, -0.5682529, 0.5870858, 1, 0, 0.7450981, 1,
1.197185, -0.5428231, 1.547674, 1, 0, 0.7372549, 1,
1.203419, -0.05920667, 2.587516, 1, 0, 0.7333333, 1,
1.2156, -1.09148, 2.290729, 1, 0, 0.7254902, 1,
1.216055, -0.3057286, 2.249319, 1, 0, 0.7215686, 1,
1.217395, -0.4960182, 2.021539, 1, 0, 0.7137255, 1,
1.221567, -0.1645254, 2.629251, 1, 0, 0.7098039, 1,
1.226597, -0.8600667, 0.4690718, 1, 0, 0.7019608, 1,
1.244379, -0.2653085, 0.4678127, 1, 0, 0.6941177, 1,
1.245051, -1.045772, 0.818057, 1, 0, 0.6901961, 1,
1.246456, 1.835535, -0.03980237, 1, 0, 0.682353, 1,
1.24848, -0.1638579, 0.6614349, 1, 0, 0.6784314, 1,
1.261765, -0.9966781, 0.8682643, 1, 0, 0.6705883, 1,
1.26201, -0.2648466, 1.871983, 1, 0, 0.6666667, 1,
1.265143, -0.09366153, 2.848158, 1, 0, 0.6588235, 1,
1.268512, -0.1184426, 1.954626, 1, 0, 0.654902, 1,
1.279261, 0.3046571, 3.235068, 1, 0, 0.6470588, 1,
1.292709, -0.9381258, 2.03673, 1, 0, 0.6431373, 1,
1.305316, 1.960575, -0.3165306, 1, 0, 0.6352941, 1,
1.310753, 0.6089597, 1.751229, 1, 0, 0.6313726, 1,
1.313807, 1.38416, -0.7307753, 1, 0, 0.6235294, 1,
1.317907, 0.4737282, 0.08159616, 1, 0, 0.6196079, 1,
1.319095, 0.02771464, 1.579987, 1, 0, 0.6117647, 1,
1.319475, 1.374647, 0.5179912, 1, 0, 0.6078432, 1,
1.31992, -0.9368964, 1.759909, 1, 0, 0.6, 1,
1.335956, 1.269304, 0.3961112, 1, 0, 0.5921569, 1,
1.34754, 0.2395549, 2.081852, 1, 0, 0.5882353, 1,
1.352331, 1.656991, 1.715292, 1, 0, 0.5803922, 1,
1.353893, -1.213026, 2.856047, 1, 0, 0.5764706, 1,
1.357366, -0.6705659, 2.274495, 1, 0, 0.5686275, 1,
1.358857, 0.238397, 2.995608, 1, 0, 0.5647059, 1,
1.360679, -0.5774856, 2.790506, 1, 0, 0.5568628, 1,
1.37331, -0.836616, 1.081121, 1, 0, 0.5529412, 1,
1.37683, 1.729259, 0.6238126, 1, 0, 0.5450981, 1,
1.389359, 0.5902824, 0.8396744, 1, 0, 0.5411765, 1,
1.396062, 1.075231, 1.184361, 1, 0, 0.5333334, 1,
1.40699, 0.4803218, 1.976367, 1, 0, 0.5294118, 1,
1.410841, -0.3686192, 0.6743388, 1, 0, 0.5215687, 1,
1.421019, -0.8768168, 1.862865, 1, 0, 0.5176471, 1,
1.423226, 0.2491104, 2.317368, 1, 0, 0.509804, 1,
1.424363, 0.05225864, 1.880361, 1, 0, 0.5058824, 1,
1.432904, -1.354412, 3.441503, 1, 0, 0.4980392, 1,
1.439924, 0.5903631, 0.142462, 1, 0, 0.4901961, 1,
1.444332, -1.57537, 2.434706, 1, 0, 0.4862745, 1,
1.449854, -0.09968646, 0.3787645, 1, 0, 0.4784314, 1,
1.449905, 0.3822233, 1.281836, 1, 0, 0.4745098, 1,
1.473733, 0.723509, -0.9559279, 1, 0, 0.4666667, 1,
1.484498, 0.343431, 1.899609, 1, 0, 0.4627451, 1,
1.490603, -0.9901493, 1.895321, 1, 0, 0.454902, 1,
1.491696, -1.853276, 1.169969, 1, 0, 0.4509804, 1,
1.497764, -0.1497765, 1.775032, 1, 0, 0.4431373, 1,
1.501127, -0.3178026, 1.610852, 1, 0, 0.4392157, 1,
1.513076, 1.919927, 0.7933463, 1, 0, 0.4313726, 1,
1.527448, -0.5242553, 3.306397, 1, 0, 0.427451, 1,
1.540382, 0.1323283, 1.287437, 1, 0, 0.4196078, 1,
1.541892, -0.2020505, 2.474705, 1, 0, 0.4156863, 1,
1.544702, 0.2986062, 0.9690661, 1, 0, 0.4078431, 1,
1.553981, 0.4526644, 2.242414, 1, 0, 0.4039216, 1,
1.558867, -0.790036, 3.608894, 1, 0, 0.3960784, 1,
1.568505, 0.2393657, 2.441479, 1, 0, 0.3882353, 1,
1.581409, -0.8869904, 1.967011, 1, 0, 0.3843137, 1,
1.587548, 0.07279161, 1.65443, 1, 0, 0.3764706, 1,
1.593722, -0.313979, 2.076722, 1, 0, 0.372549, 1,
1.594788, -0.2515097, 1.285455, 1, 0, 0.3647059, 1,
1.600923, 0.8106031, 1.208831, 1, 0, 0.3607843, 1,
1.633227, -0.4745252, 1.239828, 1, 0, 0.3529412, 1,
1.649947, 0.3447909, 0.7320011, 1, 0, 0.3490196, 1,
1.652202, -1.545287, 3.343008, 1, 0, 0.3411765, 1,
1.67037, 1.176555, 2.661997, 1, 0, 0.3372549, 1,
1.688744, 0.1232177, 1.73783, 1, 0, 0.3294118, 1,
1.701529, 2.230574, 0.6115693, 1, 0, 0.3254902, 1,
1.707692, 1.068088, 0.1185993, 1, 0, 0.3176471, 1,
1.710355, 0.1050437, 2.010429, 1, 0, 0.3137255, 1,
1.711627, 1.174308, 0.3560683, 1, 0, 0.3058824, 1,
1.712357, -1.098221, 3.144484, 1, 0, 0.2980392, 1,
1.734314, -1.666135, 2.996479, 1, 0, 0.2941177, 1,
1.739831, -0.5341984, 1.11028, 1, 0, 0.2862745, 1,
1.749863, -0.07290655, 1.121079, 1, 0, 0.282353, 1,
1.755998, 0.670581, 0.7980346, 1, 0, 0.2745098, 1,
1.75649, 0.6152861, 2.755622, 1, 0, 0.2705882, 1,
1.763162, -0.1157439, 0.6350823, 1, 0, 0.2627451, 1,
1.776428, 0.2682423, 1.620125, 1, 0, 0.2588235, 1,
1.787575, -0.2699291, 2.437185, 1, 0, 0.2509804, 1,
1.850434, 0.02279171, -0.2151723, 1, 0, 0.2470588, 1,
1.886244, 0.7647721, 1.211689, 1, 0, 0.2392157, 1,
1.887326, -1.931692, 1.110652, 1, 0, 0.2352941, 1,
1.896372, -0.3441143, 1.198319, 1, 0, 0.227451, 1,
1.907922, -0.7661967, 2.279997, 1, 0, 0.2235294, 1,
1.930753, -0.3732256, 1.818901, 1, 0, 0.2156863, 1,
1.939266, 1.738567, 1.297248, 1, 0, 0.2117647, 1,
1.992522, -1.253506, 2.972545, 1, 0, 0.2039216, 1,
1.997221, -1.831042, 1.327273, 1, 0, 0.1960784, 1,
1.998291, -0.4248965, 2.360455, 1, 0, 0.1921569, 1,
2.006004, -0.01180683, 0.3638683, 1, 0, 0.1843137, 1,
2.01897, -1.392871, 0.7319416, 1, 0, 0.1803922, 1,
2.031489, 0.3593566, -0.2478209, 1, 0, 0.172549, 1,
2.039449, -0.9389399, 2.689234, 1, 0, 0.1686275, 1,
2.042977, -0.137216, 3.171006, 1, 0, 0.1607843, 1,
2.04665, 0.3522711, 0.8846319, 1, 0, 0.1568628, 1,
2.051097, -0.3235272, 2.388229, 1, 0, 0.1490196, 1,
2.11256, 2.018943, -0.4084786, 1, 0, 0.145098, 1,
2.125202, 0.720252, 1.537861, 1, 0, 0.1372549, 1,
2.152818, -0.3940786, 2.457615, 1, 0, 0.1333333, 1,
2.170638, 0.6024801, 0.8939812, 1, 0, 0.1254902, 1,
2.185981, 1.272164, 1.54432, 1, 0, 0.1215686, 1,
2.212416, 0.840887, 0.797529, 1, 0, 0.1137255, 1,
2.222221, -0.9300677, 2.210523, 1, 0, 0.1098039, 1,
2.237703, 0.8922569, -0.6899313, 1, 0, 0.1019608, 1,
2.244793, -0.09582872, 3.604562, 1, 0, 0.09411765, 1,
2.248305, 0.8668075, 2.733301, 1, 0, 0.09019608, 1,
2.261501, 0.7361337, 2.003423, 1, 0, 0.08235294, 1,
2.293748, -0.5154163, 1.059078, 1, 0, 0.07843138, 1,
2.387525, -1.827208, 2.822175, 1, 0, 0.07058824, 1,
2.397907, -1.85414, 0.9220682, 1, 0, 0.06666667, 1,
2.417659, 0.100628, 1.332507, 1, 0, 0.05882353, 1,
2.438649, -1.72686, 2.335976, 1, 0, 0.05490196, 1,
2.48091, -1.199654, 1.42768, 1, 0, 0.04705882, 1,
2.525382, -0.6685814, 1.551667, 1, 0, 0.04313726, 1,
2.533823, 0.05320245, 3.241004, 1, 0, 0.03529412, 1,
2.573423, 0.3835858, 2.015266, 1, 0, 0.03137255, 1,
2.676876, 0.3910246, 0.9348727, 1, 0, 0.02352941, 1,
2.737114, -2.76367, 1.658692, 1, 0, 0.01960784, 1,
2.805886, 0.9688213, 1.949272, 1, 0, 0.01176471, 1,
3.121369, 0.1695237, 1.610052, 1, 0, 0.007843138, 1
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
0.1346618, -4.526544, -6.816347, 0, -0.5, 0.5, 0.5,
0.1346618, -4.526544, -6.816347, 1, -0.5, 0.5, 0.5,
0.1346618, -4.526544, -6.816347, 1, 1.5, 0.5, 0.5,
0.1346618, -4.526544, -6.816347, 0, 1.5, 0.5, 0.5
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
-3.864539, -0.06243253, -6.816347, 0, -0.5, 0.5, 0.5,
-3.864539, -0.06243253, -6.816347, 1, -0.5, 0.5, 0.5,
-3.864539, -0.06243253, -6.816347, 1, 1.5, 0.5, 0.5,
-3.864539, -0.06243253, -6.816347, 0, 1.5, 0.5, 0.5
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
-3.864539, -4.526544, -0.08721828, 0, -0.5, 0.5, 0.5,
-3.864539, -4.526544, -0.08721828, 1, -0.5, 0.5, 0.5,
-3.864539, -4.526544, -0.08721828, 1, 1.5, 0.5, 0.5,
-3.864539, -4.526544, -0.08721828, 0, 1.5, 0.5, 0.5
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
-2, -3.496365, -5.263471,
3, -3.496365, -5.263471,
-2, -3.496365, -5.263471,
-2, -3.668061, -5.522284,
-1, -3.496365, -5.263471,
-1, -3.668061, -5.522284,
0, -3.496365, -5.263471,
0, -3.668061, -5.522284,
1, -3.496365, -5.263471,
1, -3.668061, -5.522284,
2, -3.496365, -5.263471,
2, -3.668061, -5.522284,
3, -3.496365, -5.263471,
3, -3.668061, -5.522284
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
-2, -4.011454, -6.039909, 0, -0.5, 0.5, 0.5,
-2, -4.011454, -6.039909, 1, -0.5, 0.5, 0.5,
-2, -4.011454, -6.039909, 1, 1.5, 0.5, 0.5,
-2, -4.011454, -6.039909, 0, 1.5, 0.5, 0.5,
-1, -4.011454, -6.039909, 0, -0.5, 0.5, 0.5,
-1, -4.011454, -6.039909, 1, -0.5, 0.5, 0.5,
-1, -4.011454, -6.039909, 1, 1.5, 0.5, 0.5,
-1, -4.011454, -6.039909, 0, 1.5, 0.5, 0.5,
0, -4.011454, -6.039909, 0, -0.5, 0.5, 0.5,
0, -4.011454, -6.039909, 1, -0.5, 0.5, 0.5,
0, -4.011454, -6.039909, 1, 1.5, 0.5, 0.5,
0, -4.011454, -6.039909, 0, 1.5, 0.5, 0.5,
1, -4.011454, -6.039909, 0, -0.5, 0.5, 0.5,
1, -4.011454, -6.039909, 1, -0.5, 0.5, 0.5,
1, -4.011454, -6.039909, 1, 1.5, 0.5, 0.5,
1, -4.011454, -6.039909, 0, 1.5, 0.5, 0.5,
2, -4.011454, -6.039909, 0, -0.5, 0.5, 0.5,
2, -4.011454, -6.039909, 1, -0.5, 0.5, 0.5,
2, -4.011454, -6.039909, 1, 1.5, 0.5, 0.5,
2, -4.011454, -6.039909, 0, 1.5, 0.5, 0.5,
3, -4.011454, -6.039909, 0, -0.5, 0.5, 0.5,
3, -4.011454, -6.039909, 1, -0.5, 0.5, 0.5,
3, -4.011454, -6.039909, 1, 1.5, 0.5, 0.5,
3, -4.011454, -6.039909, 0, 1.5, 0.5, 0.5
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
-2.941646, -3, -5.263471,
-2.941646, 3, -5.263471,
-2.941646, -3, -5.263471,
-3.095462, -3, -5.522284,
-2.941646, -2, -5.263471,
-3.095462, -2, -5.522284,
-2.941646, -1, -5.263471,
-3.095462, -1, -5.522284,
-2.941646, 0, -5.263471,
-3.095462, 0, -5.522284,
-2.941646, 1, -5.263471,
-3.095462, 1, -5.522284,
-2.941646, 2, -5.263471,
-3.095462, 2, -5.522284,
-2.941646, 3, -5.263471,
-3.095462, 3, -5.522284
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
-3.403092, -3, -6.039909, 0, -0.5, 0.5, 0.5,
-3.403092, -3, -6.039909, 1, -0.5, 0.5, 0.5,
-3.403092, -3, -6.039909, 1, 1.5, 0.5, 0.5,
-3.403092, -3, -6.039909, 0, 1.5, 0.5, 0.5,
-3.403092, -2, -6.039909, 0, -0.5, 0.5, 0.5,
-3.403092, -2, -6.039909, 1, -0.5, 0.5, 0.5,
-3.403092, -2, -6.039909, 1, 1.5, 0.5, 0.5,
-3.403092, -2, -6.039909, 0, 1.5, 0.5, 0.5,
-3.403092, -1, -6.039909, 0, -0.5, 0.5, 0.5,
-3.403092, -1, -6.039909, 1, -0.5, 0.5, 0.5,
-3.403092, -1, -6.039909, 1, 1.5, 0.5, 0.5,
-3.403092, -1, -6.039909, 0, 1.5, 0.5, 0.5,
-3.403092, 0, -6.039909, 0, -0.5, 0.5, 0.5,
-3.403092, 0, -6.039909, 1, -0.5, 0.5, 0.5,
-3.403092, 0, -6.039909, 1, 1.5, 0.5, 0.5,
-3.403092, 0, -6.039909, 0, 1.5, 0.5, 0.5,
-3.403092, 1, -6.039909, 0, -0.5, 0.5, 0.5,
-3.403092, 1, -6.039909, 1, -0.5, 0.5, 0.5,
-3.403092, 1, -6.039909, 1, 1.5, 0.5, 0.5,
-3.403092, 1, -6.039909, 0, 1.5, 0.5, 0.5,
-3.403092, 2, -6.039909, 0, -0.5, 0.5, 0.5,
-3.403092, 2, -6.039909, 1, -0.5, 0.5, 0.5,
-3.403092, 2, -6.039909, 1, 1.5, 0.5, 0.5,
-3.403092, 2, -6.039909, 0, 1.5, 0.5, 0.5,
-3.403092, 3, -6.039909, 0, -0.5, 0.5, 0.5,
-3.403092, 3, -6.039909, 1, -0.5, 0.5, 0.5,
-3.403092, 3, -6.039909, 1, 1.5, 0.5, 0.5,
-3.403092, 3, -6.039909, 0, 1.5, 0.5, 0.5
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
-2.941646, -3.496365, -4,
-2.941646, -3.496365, 4,
-2.941646, -3.496365, -4,
-3.095462, -3.668061, -4,
-2.941646, -3.496365, -2,
-3.095462, -3.668061, -2,
-2.941646, -3.496365, 0,
-3.095462, -3.668061, 0,
-2.941646, -3.496365, 2,
-3.095462, -3.668061, 2,
-2.941646, -3.496365, 4,
-3.095462, -3.668061, 4
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
-3.403092, -4.011454, -4, 0, -0.5, 0.5, 0.5,
-3.403092, -4.011454, -4, 1, -0.5, 0.5, 0.5,
-3.403092, -4.011454, -4, 1, 1.5, 0.5, 0.5,
-3.403092, -4.011454, -4, 0, 1.5, 0.5, 0.5,
-3.403092, -4.011454, -2, 0, -0.5, 0.5, 0.5,
-3.403092, -4.011454, -2, 1, -0.5, 0.5, 0.5,
-3.403092, -4.011454, -2, 1, 1.5, 0.5, 0.5,
-3.403092, -4.011454, -2, 0, 1.5, 0.5, 0.5,
-3.403092, -4.011454, 0, 0, -0.5, 0.5, 0.5,
-3.403092, -4.011454, 0, 1, -0.5, 0.5, 0.5,
-3.403092, -4.011454, 0, 1, 1.5, 0.5, 0.5,
-3.403092, -4.011454, 0, 0, 1.5, 0.5, 0.5,
-3.403092, -4.011454, 2, 0, -0.5, 0.5, 0.5,
-3.403092, -4.011454, 2, 1, -0.5, 0.5, 0.5,
-3.403092, -4.011454, 2, 1, 1.5, 0.5, 0.5,
-3.403092, -4.011454, 2, 0, 1.5, 0.5, 0.5,
-3.403092, -4.011454, 4, 0, -0.5, 0.5, 0.5,
-3.403092, -4.011454, 4, 1, -0.5, 0.5, 0.5,
-3.403092, -4.011454, 4, 1, 1.5, 0.5, 0.5,
-3.403092, -4.011454, 4, 0, 1.5, 0.5, 0.5
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
-2.941646, -3.496365, -5.263471,
-2.941646, 3.3715, -5.263471,
-2.941646, -3.496365, 5.089035,
-2.941646, 3.3715, 5.089035,
-2.941646, -3.496365, -5.263471,
-2.941646, -3.496365, 5.089035,
-2.941646, 3.3715, -5.263471,
-2.941646, 3.3715, 5.089035,
-2.941646, -3.496365, -5.263471,
3.21097, -3.496365, -5.263471,
-2.941646, -3.496365, 5.089035,
3.21097, -3.496365, 5.089035,
-2.941646, 3.3715, -5.263471,
3.21097, 3.3715, -5.263471,
-2.941646, 3.3715, 5.089035,
3.21097, 3.3715, 5.089035,
3.21097, -3.496365, -5.263471,
3.21097, 3.3715, -5.263471,
3.21097, -3.496365, 5.089035,
3.21097, 3.3715, 5.089035,
3.21097, -3.496365, -5.263471,
3.21097, -3.496365, 5.089035,
3.21097, 3.3715, -5.263471,
3.21097, 3.3715, 5.089035
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
var radius = 7.40284;
var distance = 32.93607;
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
mvMatrix.translate( -0.1346618, 0.06243253, 0.08721828 );
mvMatrix.scale( 1.300925, 1.165442, 0.7731553 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.93607);
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
O-ethyl_phenylphosph<-read.table("O-ethyl_phenylphosph.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-O-ethyl_phenylphosph$V2
```

```
## Error in eval(expr, envir, enclos): object 'O' not found
```

```r
y<-O-ethyl_phenylphosph$V3
```

```
## Error in eval(expr, envir, enclos): object 'O' not found
```

```r
z<-O-ethyl_phenylphosph$V4
```

```
## Error in eval(expr, envir, enclos): object 'O' not found
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
-2.852045, 0.2414713, -1.758806, 0, 0, 1, 1, 1,
-2.719878, 0.7803417, -1.907188, 1, 0, 0, 1, 1,
-2.719667, 1.006081, -1.337007, 1, 0, 0, 1, 1,
-2.571347, 2.839731, 0.4887445, 1, 0, 0, 1, 1,
-2.492214, 0.8000264, 0.9677203, 1, 0, 0, 1, 1,
-2.44012, -0.7975188, -0.8351684, 1, 0, 0, 1, 1,
-2.409513, -0.2707542, -2.654055, 0, 0, 0, 1, 1,
-2.387741, 1.63297, -3.320934, 0, 0, 0, 1, 1,
-2.351471, -0.1011904, -3.655818, 0, 0, 0, 1, 1,
-2.349147, -1.143655, -1.212993, 0, 0, 0, 1, 1,
-2.320688, -0.7411628, -3.446212, 0, 0, 0, 1, 1,
-2.242089, 0.06982892, -1.822579, 0, 0, 0, 1, 1,
-2.129182, 0.1277704, -2.473262, 0, 0, 0, 1, 1,
-2.103285, 1.212563, 0.06717826, 1, 1, 1, 1, 1,
-2.071444, 0.6051183, -0.6085578, 1, 1, 1, 1, 1,
-2.046469, -0.2187902, -2.364269, 1, 1, 1, 1, 1,
-2.01323, -0.137814, -0.4781699, 1, 1, 1, 1, 1,
-2.002744, 1.186203, -1.803498, 1, 1, 1, 1, 1,
-1.963384, 1.331615, -1.106813, 1, 1, 1, 1, 1,
-1.956246, 0.3472652, -2.52271, 1, 1, 1, 1, 1,
-1.924413, -0.2872369, -1.909468, 1, 1, 1, 1, 1,
-1.905929, 1.862528, -0.3272064, 1, 1, 1, 1, 1,
-1.863632, -1.69571, -2.811988, 1, 1, 1, 1, 1,
-1.862124, -0.211825, -1.794381, 1, 1, 1, 1, 1,
-1.860086, 1.164896, 1.077891, 1, 1, 1, 1, 1,
-1.846203, -0.02484012, -2.037059, 1, 1, 1, 1, 1,
-1.84466, 0.07166073, -1.13633, 1, 1, 1, 1, 1,
-1.840723, -0.7621729, -1.912985, 1, 1, 1, 1, 1,
-1.834213, -0.921885, -3.009527, 0, 0, 1, 1, 1,
-1.831782, 1.561621, -1.349067, 1, 0, 0, 1, 1,
-1.815831, -0.05612115, -1.186015, 1, 0, 0, 1, 1,
-1.80976, -2.006802, -2.689185, 1, 0, 0, 1, 1,
-1.800466, -0.2957738, -1.334283, 1, 0, 0, 1, 1,
-1.789344, 1.778864, 0.4765504, 1, 0, 0, 1, 1,
-1.783526, -0.4407769, -1.512133, 0, 0, 0, 1, 1,
-1.780614, 0.7071497, -0.2830748, 0, 0, 0, 1, 1,
-1.775902, -0.8299049, -1.75517, 0, 0, 0, 1, 1,
-1.771523, -0.3036594, -2.319185, 0, 0, 0, 1, 1,
-1.766553, 1.178918, -2.196571, 0, 0, 0, 1, 1,
-1.733423, 0.2553527, -1.658452, 0, 0, 0, 1, 1,
-1.703093, -0.7290747, -2.439961, 0, 0, 0, 1, 1,
-1.702915, -0.4796425, -2.161748, 1, 1, 1, 1, 1,
-1.688832, -1.00872, -2.704137, 1, 1, 1, 1, 1,
-1.688059, -1.343235, -2.850783, 1, 1, 1, 1, 1,
-1.6869, 0.6101136, -4.0664, 1, 1, 1, 1, 1,
-1.685109, -1.505422, -3.384247, 1, 1, 1, 1, 1,
-1.668905, 0.9508016, -0.100012, 1, 1, 1, 1, 1,
-1.650426, -0.6173117, -1.453044, 1, 1, 1, 1, 1,
-1.644534, -0.8766735, -2.630727, 1, 1, 1, 1, 1,
-1.640903, -1.027104, -1.612798, 1, 1, 1, 1, 1,
-1.625919, 0.3909402, -0.6897533, 1, 1, 1, 1, 1,
-1.621301, -0.2186548, -2.050112, 1, 1, 1, 1, 1,
-1.612073, -0.4777166, -3.615937, 1, 1, 1, 1, 1,
-1.610212, 1.066878, -1.267265, 1, 1, 1, 1, 1,
-1.60824, 1.877605, -1.158124, 1, 1, 1, 1, 1,
-1.605311, 1.606986, -0.2763129, 1, 1, 1, 1, 1,
-1.582733, 1.074457, -1.57026, 0, 0, 1, 1, 1,
-1.579814, -1.045545, -1.63815, 1, 0, 0, 1, 1,
-1.561014, 1.842848, -2.084177, 1, 0, 0, 1, 1,
-1.552762, -0.1049574, -2.458032, 1, 0, 0, 1, 1,
-1.551461, -0.780177, -2.512651, 1, 0, 0, 1, 1,
-1.547483, -0.6511602, -1.772937, 1, 0, 0, 1, 1,
-1.543169, 1.742045, 0.4714926, 0, 0, 0, 1, 1,
-1.539171, 1.198954, -1.074266, 0, 0, 0, 1, 1,
-1.52932, 1.463441, -1.601623, 0, 0, 0, 1, 1,
-1.525399, 0.4055559, -0.1300381, 0, 0, 0, 1, 1,
-1.518944, 0.5055509, -2.671784, 0, 0, 0, 1, 1,
-1.502716, -1.242148, -2.125593, 0, 0, 0, 1, 1,
-1.495975, -0.9032193, -2.8829, 0, 0, 0, 1, 1,
-1.488028, 0.08026602, -2.702616, 1, 1, 1, 1, 1,
-1.486607, -0.809325, -2.130238, 1, 1, 1, 1, 1,
-1.48637, -0.2198619, -1.265166, 1, 1, 1, 1, 1,
-1.45702, 0.7765504, -2.05302, 1, 1, 1, 1, 1,
-1.443965, -1.157484, -3.004591, 1, 1, 1, 1, 1,
-1.443828, -0.630349, -0.4817222, 1, 1, 1, 1, 1,
-1.441775, -0.04528968, -0.1637883, 1, 1, 1, 1, 1,
-1.438488, -1.089796, -2.746363, 1, 1, 1, 1, 1,
-1.437569, -1.629738, -1.826608, 1, 1, 1, 1, 1,
-1.428178, 0.4962282, -0.6179109, 1, 1, 1, 1, 1,
-1.426028, -0.141882, -3.195776, 1, 1, 1, 1, 1,
-1.423591, -0.8744689, -2.692166, 1, 1, 1, 1, 1,
-1.405398, 1.465919, -2.15411, 1, 1, 1, 1, 1,
-1.388774, 0.3962287, -1.428233, 1, 1, 1, 1, 1,
-1.383029, 2.106233, -0.5596542, 1, 1, 1, 1, 1,
-1.38133, -0.4813513, -2.521187, 0, 0, 1, 1, 1,
-1.36412, -1.041128, -2.521666, 1, 0, 0, 1, 1,
-1.35482, -1.591284, -2.620188, 1, 0, 0, 1, 1,
-1.3459, -1.349076, -1.695482, 1, 0, 0, 1, 1,
-1.344309, -0.293804, -1.411341, 1, 0, 0, 1, 1,
-1.343372, 0.9177738, 0.03862471, 1, 0, 0, 1, 1,
-1.343059, 1.210081, 1.415865, 0, 0, 0, 1, 1,
-1.328562, 1.195099, -0.9329497, 0, 0, 0, 1, 1,
-1.327267, -0.876493, -1.32641, 0, 0, 0, 1, 1,
-1.324113, -0.4659019, -2.362813, 0, 0, 0, 1, 1,
-1.321282, -0.4281575, -2.543438, 0, 0, 0, 1, 1,
-1.317973, 1.778572, -0.4803029, 0, 0, 0, 1, 1,
-1.317262, 1.043811, -0.7463368, 0, 0, 0, 1, 1,
-1.310772, -0.4423011, -1.675418, 1, 1, 1, 1, 1,
-1.308165, 0.7562885, -1.654158, 1, 1, 1, 1, 1,
-1.303743, -1.106185, -0.8722417, 1, 1, 1, 1, 1,
-1.29891, -2.200507, -2.652344, 1, 1, 1, 1, 1,
-1.29747, -2.854594, -3.04344, 1, 1, 1, 1, 1,
-1.295097, -0.4419982, -1.063529, 1, 1, 1, 1, 1,
-1.28765, -1.004064, -2.969496, 1, 1, 1, 1, 1,
-1.281921, -0.07112273, -2.201353, 1, 1, 1, 1, 1,
-1.277626, -0.3446883, -3.225782, 1, 1, 1, 1, 1,
-1.273998, -2.411082, -2.648003, 1, 1, 1, 1, 1,
-1.272725, -1.161768, -1.710815, 1, 1, 1, 1, 1,
-1.269755, -1.852564, -4.188946, 1, 1, 1, 1, 1,
-1.269719, -0.07679852, -1.204756, 1, 1, 1, 1, 1,
-1.269094, -1.305451, -1.088235, 1, 1, 1, 1, 1,
-1.2674, -0.1819071, -3.183815, 1, 1, 1, 1, 1,
-1.256631, -1.391092, -3.775101, 0, 0, 1, 1, 1,
-1.247575, 0.4440245, -3.02822, 1, 0, 0, 1, 1,
-1.246319, 1.872456, -0.08221121, 1, 0, 0, 1, 1,
-1.246302, 0.5457776, 0.4690025, 1, 0, 0, 1, 1,
-1.244697, 0.3255828, -2.45857, 1, 0, 0, 1, 1,
-1.240975, -0.05725714, -1.764312, 1, 0, 0, 1, 1,
-1.228668, 0.6709544, 0.235064, 0, 0, 0, 1, 1,
-1.225583, -0.8948597, -2.384061, 0, 0, 0, 1, 1,
-1.222287, 0.1473362, -1.374272, 0, 0, 0, 1, 1,
-1.220691, 1.776955, -2.517667, 0, 0, 0, 1, 1,
-1.217792, -1.430878, -3.269165, 0, 0, 0, 1, 1,
-1.213139, 0.463894, 0.1515178, 0, 0, 0, 1, 1,
-1.201799, 0.5521884, -0.6820782, 0, 0, 0, 1, 1,
-1.191667, 0.6067091, -2.467107, 1, 1, 1, 1, 1,
-1.189569, 0.2909373, -1.846849, 1, 1, 1, 1, 1,
-1.187187, -1.078047, -2.179659, 1, 1, 1, 1, 1,
-1.184331, 0.1482454, -0.9741011, 1, 1, 1, 1, 1,
-1.181038, 1.34653, -1.485992, 1, 1, 1, 1, 1,
-1.178813, 0.01793711, -1.009199, 1, 1, 1, 1, 1,
-1.177495, -0.1136789, 0.04077753, 1, 1, 1, 1, 1,
-1.140142, 1.310587, -1.33056, 1, 1, 1, 1, 1,
-1.13267, -0.3927543, -1.968468, 1, 1, 1, 1, 1,
-1.120365, -0.2615797, -1.130982, 1, 1, 1, 1, 1,
-1.116721, -1.299368, -2.570569, 1, 1, 1, 1, 1,
-1.1139, -0.1439561, -1.344193, 1, 1, 1, 1, 1,
-1.113886, 0.9276967, -0.4677918, 1, 1, 1, 1, 1,
-1.107982, -0.5285836, -3.014169, 1, 1, 1, 1, 1,
-1.107246, 1.397714, -0.5662974, 1, 1, 1, 1, 1,
-1.105488, -0.5367216, -2.975989, 0, 0, 1, 1, 1,
-1.103049, 1.904558, -1.771353, 1, 0, 0, 1, 1,
-1.100689, 1.274287, -1.710785, 1, 0, 0, 1, 1,
-1.100267, 0.6198977, -0.7061625, 1, 0, 0, 1, 1,
-1.080635, -0.6392321, -2.23524, 1, 0, 0, 1, 1,
-1.080526, 0.5143143, 0.3509079, 1, 0, 0, 1, 1,
-1.080336, -1.70765, -3.357126, 0, 0, 0, 1, 1,
-1.079428, -0.8262109, -1.634462, 0, 0, 0, 1, 1,
-1.078836, 0.9769731, -1.93916, 0, 0, 0, 1, 1,
-1.075128, -0.07169987, -0.9295302, 0, 0, 0, 1, 1,
-1.073794, -0.914266, -1.580807, 0, 0, 0, 1, 1,
-1.071643, 0.03241429, -0.5921487, 0, 0, 0, 1, 1,
-1.069985, 0.7082455, 0.4344258, 0, 0, 0, 1, 1,
-1.068606, -0.1822623, -1.293101, 1, 1, 1, 1, 1,
-1.054696, 1.185171, -0.1939495, 1, 1, 1, 1, 1,
-1.051592, 0.6623718, -1.231442, 1, 1, 1, 1, 1,
-1.046301, -1.207503, -0.577384, 1, 1, 1, 1, 1,
-1.033547, -0.1933216, -1.349057, 1, 1, 1, 1, 1,
-1.032189, 1.534093, -0.3204786, 1, 1, 1, 1, 1,
-1.018942, -0.8543335, -2.079301, 1, 1, 1, 1, 1,
-1.017228, -0.5823085, -4.195134, 1, 1, 1, 1, 1,
-1.015697, 1.572777, -1.206984, 1, 1, 1, 1, 1,
-1.011957, -0.3502077, -0.6476483, 1, 1, 1, 1, 1,
-1.007196, -0.6491376, -2.763376, 1, 1, 1, 1, 1,
-0.9882498, -1.535261, -0.8972759, 1, 1, 1, 1, 1,
-0.9873078, -0.04529761, -1.778877, 1, 1, 1, 1, 1,
-0.9731228, 0.7605554, -2.185663, 1, 1, 1, 1, 1,
-0.9705564, -1.002471, -2.208453, 1, 1, 1, 1, 1,
-0.9678592, 0.3377977, -0.296363, 0, 0, 1, 1, 1,
-0.9644241, 1.106446, -1.792319, 1, 0, 0, 1, 1,
-0.9613032, -1.858669, -2.860298, 1, 0, 0, 1, 1,
-0.9610369, 1.502576, 0.2863273, 1, 0, 0, 1, 1,
-0.9573748, 0.3059181, -3.488965, 1, 0, 0, 1, 1,
-0.9571661, -1.156898, -2.915903, 1, 0, 0, 1, 1,
-0.955738, 1.006019, -1.408371, 0, 0, 0, 1, 1,
-0.953242, 0.5579148, -2.255778, 0, 0, 0, 1, 1,
-0.9526252, -1.125659, -2.639466, 0, 0, 0, 1, 1,
-0.9509882, 0.756, -0.6549641, 0, 0, 0, 1, 1,
-0.9468219, -0.8874713, -1.676701, 0, 0, 0, 1, 1,
-0.9452866, -0.1856786, -1.700374, 0, 0, 0, 1, 1,
-0.9392022, -0.4551417, -2.074192, 0, 0, 0, 1, 1,
-0.9351354, -1.056905, -2.855783, 1, 1, 1, 1, 1,
-0.9303367, 2.053391, -0.3866737, 1, 1, 1, 1, 1,
-0.9291999, 0.1927865, -0.6183739, 1, 1, 1, 1, 1,
-0.9285048, -0.468787, -1.986576, 1, 1, 1, 1, 1,
-0.9261888, 2.554729, 0.3609055, 1, 1, 1, 1, 1,
-0.9233443, 0.2874761, -1.859916, 1, 1, 1, 1, 1,
-0.9210257, -0.4016214, -1.242427, 1, 1, 1, 1, 1,
-0.9140527, -0.5961354, -2.29589, 1, 1, 1, 1, 1,
-0.9134272, -0.2970235, -1.011373, 1, 1, 1, 1, 1,
-0.9119033, -0.04782486, -1.394397, 1, 1, 1, 1, 1,
-0.905094, 0.5206736, 0.3332058, 1, 1, 1, 1, 1,
-0.904891, -0.1011199, -2.06404, 1, 1, 1, 1, 1,
-0.9020829, -0.2530764, -3.633266, 1, 1, 1, 1, 1,
-0.9011738, -0.5644047, -2.145146, 1, 1, 1, 1, 1,
-0.9006981, 0.3288397, -0.9720144, 1, 1, 1, 1, 1,
-0.8806381, 0.3732569, -2.658613, 0, 0, 1, 1, 1,
-0.8773093, -0.6385116, -3.533977, 1, 0, 0, 1, 1,
-0.8740613, 0.9888895, -1.418638, 1, 0, 0, 1, 1,
-0.8652944, 0.6160752, 0.8279831, 1, 0, 0, 1, 1,
-0.864984, 0.4439658, -0.9283501, 1, 0, 0, 1, 1,
-0.8640248, 0.5813373, -1.995603, 1, 0, 0, 1, 1,
-0.8635188, -0.2287785, -3.608586, 0, 0, 0, 1, 1,
-0.8592171, 0.5365248, -1.227804, 0, 0, 0, 1, 1,
-0.8492184, -0.2755472, -1.093482, 0, 0, 0, 1, 1,
-0.8487228, 1.050962, -0.4373515, 0, 0, 0, 1, 1,
-0.8482899, -0.2120505, -0.7028435, 0, 0, 0, 1, 1,
-0.8474028, 0.3645984, -2.113913, 0, 0, 0, 1, 1,
-0.8462347, -0.7566484, -0.8230131, 0, 0, 0, 1, 1,
-0.8442361, 0.04694919, -1.472028, 1, 1, 1, 1, 1,
-0.8419054, 1.285514, -0.6447361, 1, 1, 1, 1, 1,
-0.8384962, 0.8916966, -2.954723, 1, 1, 1, 1, 1,
-0.829432, -1.322272, -3.510902, 1, 1, 1, 1, 1,
-0.8250958, 0.4010572, -1.160069, 1, 1, 1, 1, 1,
-0.8190503, -1.047938, -2.413993, 1, 1, 1, 1, 1,
-0.8188788, -2.093276, -3.405939, 1, 1, 1, 1, 1,
-0.8149948, 1.097464, 0.1811445, 1, 1, 1, 1, 1,
-0.8145786, -0.3778669, -1.665752, 1, 1, 1, 1, 1,
-0.8103676, -0.5709884, -2.975359, 1, 1, 1, 1, 1,
-0.8099563, -0.6569878, -2.523702, 1, 1, 1, 1, 1,
-0.8091393, 0.4064869, -0.5367104, 1, 1, 1, 1, 1,
-0.801426, -1.057351, -1.608058, 1, 1, 1, 1, 1,
-0.7981909, 1.603383, 0.01052744, 1, 1, 1, 1, 1,
-0.7965239, -0.3067652, -1.054923, 1, 1, 1, 1, 1,
-0.7844317, -1.729312, -3.298376, 0, 0, 1, 1, 1,
-0.7802543, -1.315618, -2.169242, 1, 0, 0, 1, 1,
-0.7776445, -0.5445819, -3.60828, 1, 0, 0, 1, 1,
-0.7734959, -0.1151015, -0.6271794, 1, 0, 0, 1, 1,
-0.7722763, 2.041097, -0.9959562, 1, 0, 0, 1, 1,
-0.7710685, -2.34498, -4.847494, 1, 0, 0, 1, 1,
-0.7654892, -0.5409155, -3.608173, 0, 0, 0, 1, 1,
-0.7631587, 0.9703794, -0.1245908, 0, 0, 0, 1, 1,
-0.7600086, -1.52274, -0.4401661, 0, 0, 0, 1, 1,
-0.7542643, 1.373629, 0.2846914, 0, 0, 0, 1, 1,
-0.753675, -1.704575, -2.841264, 0, 0, 0, 1, 1,
-0.7473101, -0.5443301, -3.362325, 0, 0, 0, 1, 1,
-0.7464414, 0.5712208, -2.185911, 0, 0, 0, 1, 1,
-0.7464093, -0.5412379, -2.232463, 1, 1, 1, 1, 1,
-0.7455602, 0.7740535, -2.106272, 1, 1, 1, 1, 1,
-0.7451976, 1.420143, -0.1035425, 1, 1, 1, 1, 1,
-0.7420666, 0.02950793, -0.03789417, 1, 1, 1, 1, 1,
-0.7387578, 0.1407491, -1.105269, 1, 1, 1, 1, 1,
-0.7380771, -0.587371, -4.518129, 1, 1, 1, 1, 1,
-0.7379283, -0.7756895, -2.722026, 1, 1, 1, 1, 1,
-0.730396, -0.6218419, -3.493267, 1, 1, 1, 1, 1,
-0.7277755, -0.8034353, -3.335526, 1, 1, 1, 1, 1,
-0.7262169, 0.9832832, -0.8280423, 1, 1, 1, 1, 1,
-0.7240044, 0.04022678, -0.9121755, 1, 1, 1, 1, 1,
-0.7175981, -0.8230345, -2.106588, 1, 1, 1, 1, 1,
-0.7120016, -0.3690627, -1.023437, 1, 1, 1, 1, 1,
-0.7087298, 1.400706, 0.536838, 1, 1, 1, 1, 1,
-0.7081035, 0.9674715, -1.23198, 1, 1, 1, 1, 1,
-0.7079971, 0.144001, -1.875987, 0, 0, 1, 1, 1,
-0.7066898, 1.474254, 0.2805467, 1, 0, 0, 1, 1,
-0.7058604, 0.4535939, -1.207587, 1, 0, 0, 1, 1,
-0.7034332, -0.7424976, -1.804613, 1, 0, 0, 1, 1,
-0.7021461, 1.27085, -0.8316488, 1, 0, 0, 1, 1,
-0.7019702, 1.206876, -0.3678007, 1, 0, 0, 1, 1,
-0.6988243, 0.05864621, -0.5253248, 0, 0, 0, 1, 1,
-0.6963996, -0.3757007, -1.730013, 0, 0, 0, 1, 1,
-0.6872743, 0.07612523, -1.185232, 0, 0, 0, 1, 1,
-0.6857638, 2.402911, 1.139046, 0, 0, 0, 1, 1,
-0.6843492, 0.3973103, 0.1867372, 0, 0, 0, 1, 1,
-0.6834084, 1.04571, -0.6224145, 0, 0, 0, 1, 1,
-0.680071, 0.1139422, -1.909723, 0, 0, 0, 1, 1,
-0.6793641, -0.8519657, -1.814018, 1, 1, 1, 1, 1,
-0.6783395, -0.9149183, -0.4466423, 1, 1, 1, 1, 1,
-0.6701421, 0.4390354, 0.4848554, 1, 1, 1, 1, 1,
-0.6700709, 0.8128376, -0.0829161, 1, 1, 1, 1, 1,
-0.668251, 0.9972863, 0.4630338, 1, 1, 1, 1, 1,
-0.6671698, -0.215291, -2.248166, 1, 1, 1, 1, 1,
-0.6661785, -0.3551086, -1.678776, 1, 1, 1, 1, 1,
-0.6560671, 0.3685378, -1.65922, 1, 1, 1, 1, 1,
-0.6551411, 0.8344601, 0.2564484, 1, 1, 1, 1, 1,
-0.6464918, 1.851207, -0.6337257, 1, 1, 1, 1, 1,
-0.6410515, -0.1890742, 0.137688, 1, 1, 1, 1, 1,
-0.6366662, 0.06873541, 0.3054868, 1, 1, 1, 1, 1,
-0.6251451, -0.1630833, -1.416341, 1, 1, 1, 1, 1,
-0.6247044, 1.492045, -1.670988, 1, 1, 1, 1, 1,
-0.6235587, -0.7558449, -2.865698, 1, 1, 1, 1, 1,
-0.6192507, -0.7967463, -0.9676145, 0, 0, 1, 1, 1,
-0.6118015, -0.1424826, -0.7422674, 1, 0, 0, 1, 1,
-0.6103476, 0.3455147, -0.3829063, 1, 0, 0, 1, 1,
-0.6103001, 1.807741, -0.5864631, 1, 0, 0, 1, 1,
-0.6092725, 0.3268613, -1.450991, 1, 0, 0, 1, 1,
-0.6070803, 0.4402029, -2.629611, 1, 0, 0, 1, 1,
-0.6052058, 0.2081825, -0.4954029, 0, 0, 0, 1, 1,
-0.6048929, -0.4775338, -1.695256, 0, 0, 0, 1, 1,
-0.6036934, 0.5247574, -0.0001815498, 0, 0, 0, 1, 1,
-0.5950824, -2.095265, -3.191104, 0, 0, 0, 1, 1,
-0.5867331, 0.3151711, -0.4186979, 0, 0, 0, 1, 1,
-0.5840177, -0.5458641, -1.816256, 0, 0, 0, 1, 1,
-0.5810589, -3.396347, -1.868894, 0, 0, 0, 1, 1,
-0.5808239, -0.02750185, -0.7079238, 1, 1, 1, 1, 1,
-0.573583, -0.6017995, -2.712861, 1, 1, 1, 1, 1,
-0.5731433, -2.424098, -1.052013, 1, 1, 1, 1, 1,
-0.5688949, 0.2115841, -1.036751, 1, 1, 1, 1, 1,
-0.5675561, 0.9707708, -0.9524748, 1, 1, 1, 1, 1,
-0.5637004, -0.2712341, -1.267831, 1, 1, 1, 1, 1,
-0.5633714, 0.3788118, 0.4665476, 1, 1, 1, 1, 1,
-0.554799, 1.317623, 0.4423292, 1, 1, 1, 1, 1,
-0.5444016, 0.4271283, -1.01231, 1, 1, 1, 1, 1,
-0.5425081, 0.8282587, 0.1164709, 1, 1, 1, 1, 1,
-0.5382059, -0.1940611, -0.4023197, 1, 1, 1, 1, 1,
-0.5374674, -1.179567, -2.158108, 1, 1, 1, 1, 1,
-0.5373263, -0.6350715, -1.850812, 1, 1, 1, 1, 1,
-0.5271335, -0.3820183, -3.016977, 1, 1, 1, 1, 1,
-0.5249046, 1.016955, -0.8129418, 1, 1, 1, 1, 1,
-0.5227082, -1.667811, -2.676404, 0, 0, 1, 1, 1,
-0.5185004, 1.154435, -1.321129, 1, 0, 0, 1, 1,
-0.5081821, -0.6928966, -2.297663, 1, 0, 0, 1, 1,
-0.5069934, 1.99874, -0.1961728, 1, 0, 0, 1, 1,
-0.5058297, -0.1944256, -0.7635809, 1, 0, 0, 1, 1,
-0.5042792, 0.6473615, -0.8690634, 1, 0, 0, 1, 1,
-0.501089, -0.8988757, -3.794076, 0, 0, 0, 1, 1,
-0.499202, 0.3188857, -1.69357, 0, 0, 0, 1, 1,
-0.4988143, -2.128854, -1.76065, 0, 0, 0, 1, 1,
-0.4957999, 0.5155195, -2.084468, 0, 0, 0, 1, 1,
-0.4953979, 0.4223986, -0.1481153, 0, 0, 0, 1, 1,
-0.4935239, 0.9427204, -1.173745, 0, 0, 0, 1, 1,
-0.4895816, 1.160256, -0.1838316, 0, 0, 0, 1, 1,
-0.4892966, 0.6809021, 0.1172472, 1, 1, 1, 1, 1,
-0.486858, 3.098139, -1.563222, 1, 1, 1, 1, 1,
-0.4811602, 0.9826447, 0.1412355, 1, 1, 1, 1, 1,
-0.4785959, -0.107143, -1.743584, 1, 1, 1, 1, 1,
-0.4775585, -0.9869829, -4.668923, 1, 1, 1, 1, 1,
-0.4774534, -0.6489586, 0.6085644, 1, 1, 1, 1, 1,
-0.4765817, 0.3915285, 1.127164, 1, 1, 1, 1, 1,
-0.4754097, 1.325368, -1.009199, 1, 1, 1, 1, 1,
-0.4726626, -0.154241, -2.165377, 1, 1, 1, 1, 1,
-0.4698839, 0.620207, 0.7227208, 1, 1, 1, 1, 1,
-0.4691061, 0.4340185, -0.02504468, 1, 1, 1, 1, 1,
-0.4688899, -0.7260569, -1.409777, 1, 1, 1, 1, 1,
-0.4683393, -0.1422645, -4.211318, 1, 1, 1, 1, 1,
-0.4682607, -0.5193011, -3.36363, 1, 1, 1, 1, 1,
-0.465016, -0.9077818, -3.492012, 1, 1, 1, 1, 1,
-0.4632241, -0.08028869, 0.08557289, 0, 0, 1, 1, 1,
-0.4605861, -0.9142905, -2.436968, 1, 0, 0, 1, 1,
-0.4590782, 0.8388441, 1.270833, 1, 0, 0, 1, 1,
-0.455968, 0.1717518, -1.454931, 1, 0, 0, 1, 1,
-0.4523726, -0.2737716, -1.37098, 1, 0, 0, 1, 1,
-0.4515315, 0.6544458, -1.516946, 1, 0, 0, 1, 1,
-0.4510517, -0.2246458, -2.613881, 0, 0, 0, 1, 1,
-0.4413047, 1.720906, -0.182217, 0, 0, 0, 1, 1,
-0.4403454, 0.7784457, 0.8802568, 0, 0, 0, 1, 1,
-0.4397876, 1.250853, -0.2284492, 0, 0, 0, 1, 1,
-0.4371041, -0.482057, -2.983548, 0, 0, 0, 1, 1,
-0.4330144, -1.160058, -3.713945, 0, 0, 0, 1, 1,
-0.4326265, 0.1773853, -2.10126, 0, 0, 0, 1, 1,
-0.4283309, -0.02318054, -1.762243, 1, 1, 1, 1, 1,
-0.425344, 0.6089639, 0.165412, 1, 1, 1, 1, 1,
-0.4223945, 0.158529, -1.51171, 1, 1, 1, 1, 1,
-0.4222201, 1.202628, -1.527997, 1, 1, 1, 1, 1,
-0.4213364, 0.1487381, -0.2607963, 1, 1, 1, 1, 1,
-0.4196104, 0.4893356, -0.5001951, 1, 1, 1, 1, 1,
-0.4136496, 0.4170556, -0.6563081, 1, 1, 1, 1, 1,
-0.4131665, -0.563777, -2.203909, 1, 1, 1, 1, 1,
-0.4128455, -0.2426352, -2.522796, 1, 1, 1, 1, 1,
-0.412356, -0.1149066, -0.1413534, 1, 1, 1, 1, 1,
-0.4115423, -0.2625276, -3.168979, 1, 1, 1, 1, 1,
-0.409685, 0.02157833, -1.555758, 1, 1, 1, 1, 1,
-0.4095251, -0.6194784, -1.753438, 1, 1, 1, 1, 1,
-0.406121, -2.457922, -2.938652, 1, 1, 1, 1, 1,
-0.3981579, 0.9337938, 0.8869956, 1, 1, 1, 1, 1,
-0.3932247, 0.1990158, 0.4729373, 0, 0, 1, 1, 1,
-0.390118, -0.3718652, -1.707174, 1, 0, 0, 1, 1,
-0.3880884, -0.5910011, -2.673113, 1, 0, 0, 1, 1,
-0.3874836, 0.4310322, -1.315158, 1, 0, 0, 1, 1,
-0.3819547, 0.3873094, -0.09316789, 1, 0, 0, 1, 1,
-0.381205, 0.3344821, -0.5780762, 1, 0, 0, 1, 1,
-0.3767951, -0.05721347, -1.172817, 0, 0, 0, 1, 1,
-0.3767224, 0.4850272, -0.02401987, 0, 0, 0, 1, 1,
-0.3748855, 2.002182, -1.25505, 0, 0, 0, 1, 1,
-0.3703601, 0.5124389, 2.843297, 0, 0, 0, 1, 1,
-0.3694294, 0.97328, 1.043375, 0, 0, 0, 1, 1,
-0.368005, 0.1589315, -0.6460447, 0, 0, 0, 1, 1,
-0.3668883, 2.113359, 0.2658464, 0, 0, 0, 1, 1,
-0.3588489, 0.6089702, 0.2478724, 1, 1, 1, 1, 1,
-0.3553014, 0.1329242, -0.4590862, 1, 1, 1, 1, 1,
-0.3425213, 0.614328, -1.062623, 1, 1, 1, 1, 1,
-0.3399566, -2.447352, -2.916645, 1, 1, 1, 1, 1,
-0.3395886, -0.1457863, -3.885462, 1, 1, 1, 1, 1,
-0.3365433, -1.628694, -2.742609, 1, 1, 1, 1, 1,
-0.3310544, -0.01892331, -1.902495, 1, 1, 1, 1, 1,
-0.3252187, 0.3494539, 0.250232, 1, 1, 1, 1, 1,
-0.3248565, -0.5713996, -2.469321, 1, 1, 1, 1, 1,
-0.3244183, -0.5398236, -2.103629, 1, 1, 1, 1, 1,
-0.3215688, -0.3556232, -2.839845, 1, 1, 1, 1, 1,
-0.3189451, 0.7145237, -1.703366, 1, 1, 1, 1, 1,
-0.3180865, 0.3348107, -2.477591, 1, 1, 1, 1, 1,
-0.31646, 0.2453224, -0.4244789, 1, 1, 1, 1, 1,
-0.3124402, 0.1117437, -0.3077911, 1, 1, 1, 1, 1,
-0.304006, -0.3559525, -2.783698, 0, 0, 1, 1, 1,
-0.3033876, 0.1806218, -0.7607303, 1, 0, 0, 1, 1,
-0.3022806, 0.2273748, 0.6700703, 1, 0, 0, 1, 1,
-0.3007026, -1.096482, -1.323012, 1, 0, 0, 1, 1,
-0.2963195, 0.7980754, -1.131218, 1, 0, 0, 1, 1,
-0.2854712, -1.498518, -1.789917, 1, 0, 0, 1, 1,
-0.2799652, -0.3381883, -3.430802, 0, 0, 0, 1, 1,
-0.2786718, 0.7228385, 0.3190663, 0, 0, 0, 1, 1,
-0.2777657, 1.009918, -1.289695, 0, 0, 0, 1, 1,
-0.2771189, 0.9551073, -0.9980979, 0, 0, 0, 1, 1,
-0.2747377, -1.681898, -1.275899, 0, 0, 0, 1, 1,
-0.2713332, 1.021703, -0.3716604, 0, 0, 0, 1, 1,
-0.2652678, 0.6174771, 0.6562727, 0, 0, 0, 1, 1,
-0.2607737, -0.5126251, -2.606182, 1, 1, 1, 1, 1,
-0.2542468, -0.03772008, -2.180949, 1, 1, 1, 1, 1,
-0.2530377, -0.6084484, -4.925265, 1, 1, 1, 1, 1,
-0.2511951, 1.434346, -0.7292696, 1, 1, 1, 1, 1,
-0.2511564, -0.430779, -1.750302, 1, 1, 1, 1, 1,
-0.2501139, -1.305247, -3.175978, 1, 1, 1, 1, 1,
-0.2487852, 0.6419208, -1.896441, 1, 1, 1, 1, 1,
-0.2475014, 0.6443685, 0.2359202, 1, 1, 1, 1, 1,
-0.2450724, -0.5521334, -1.522329, 1, 1, 1, 1, 1,
-0.2410745, 0.452668, -2.235737, 1, 1, 1, 1, 1,
-0.2399965, 0.6768464, -1.739064, 1, 1, 1, 1, 1,
-0.2398153, -0.6922482, -3.728528, 1, 1, 1, 1, 1,
-0.237946, 0.3350907, -1.718772, 1, 1, 1, 1, 1,
-0.2346992, -1.048071, -1.999252, 1, 1, 1, 1, 1,
-0.2340156, 0.4284798, -1.943835, 1, 1, 1, 1, 1,
-0.2337049, -0.1913465, -2.785864, 0, 0, 1, 1, 1,
-0.2328455, -0.1915707, -1.560474, 1, 0, 0, 1, 1,
-0.2323481, 0.04976804, -1.443507, 1, 0, 0, 1, 1,
-0.2305768, 1.583482, -0.08500279, 1, 0, 0, 1, 1,
-0.2288695, 0.674262, -1.14592, 1, 0, 0, 1, 1,
-0.221996, -0.1318238, -3.716043, 1, 0, 0, 1, 1,
-0.2156607, -1.316279, -3.084434, 0, 0, 0, 1, 1,
-0.2153984, -0.6424292, -2.171976, 0, 0, 0, 1, 1,
-0.2153507, -0.5101177, -2.178411, 0, 0, 0, 1, 1,
-0.2147981, -0.2653254, -2.361589, 0, 0, 0, 1, 1,
-0.2127502, -0.7874942, -2.17439, 0, 0, 0, 1, 1,
-0.2106575, 1.172974, -1.731544, 0, 0, 0, 1, 1,
-0.206277, -0.2720697, -3.630032, 0, 0, 0, 1, 1,
-0.2051478, 0.4375403, -0.409337, 1, 1, 1, 1, 1,
-0.2031272, -1.034128, -3.592285, 1, 1, 1, 1, 1,
-0.2011651, -0.9237773, -3.059219, 1, 1, 1, 1, 1,
-0.2006144, 0.6149089, 0.1728448, 1, 1, 1, 1, 1,
-0.199982, -0.06257316, 0.3467362, 1, 1, 1, 1, 1,
-0.1968471, 0.2084658, -1.894291, 1, 1, 1, 1, 1,
-0.196323, 0.5556992, -1.545836, 1, 1, 1, 1, 1,
-0.1934485, -0.3219429, -4.209254, 1, 1, 1, 1, 1,
-0.1875919, -0.218401, -1.929784, 1, 1, 1, 1, 1,
-0.1875698, 1.422949, -0.3362689, 1, 1, 1, 1, 1,
-0.1852994, -0.7755738, -3.551212, 1, 1, 1, 1, 1,
-0.1840643, 0.3925665, -1.411326, 1, 1, 1, 1, 1,
-0.1801217, 0.02063854, -1.441417, 1, 1, 1, 1, 1,
-0.1792882, 0.9516691, -1.113581, 1, 1, 1, 1, 1,
-0.1786699, -1.452148, -3.623116, 1, 1, 1, 1, 1,
-0.1781196, 1.591009, -0.7357154, 0, 0, 1, 1, 1,
-0.1777438, -2.110242, -4.987623, 1, 0, 0, 1, 1,
-0.1763582, 1.006298, -0.3663246, 1, 0, 0, 1, 1,
-0.1752047, 0.8482636, 1.676033, 1, 0, 0, 1, 1,
-0.1748981, -0.7763986, -3.064011, 1, 0, 0, 1, 1,
-0.1732231, -0.7952878, -2.626086, 1, 0, 0, 1, 1,
-0.1713071, 1.378697, -0.2548941, 0, 0, 0, 1, 1,
-0.1687922, -0.2564175, -1.34427, 0, 0, 0, 1, 1,
-0.159506, 0.8733036, 1.628931, 0, 0, 0, 1, 1,
-0.1591936, 0.1754864, -0.05405331, 0, 0, 0, 1, 1,
-0.157087, 0.2539526, -1.177123, 0, 0, 0, 1, 1,
-0.1540192, -1.733038, -5.050071, 0, 0, 0, 1, 1,
-0.1538365, 0.8404727, 0.2609699, 0, 0, 0, 1, 1,
-0.1535672, -0.2058893, -1.922634, 1, 1, 1, 1, 1,
-0.1522735, -0.6432226, -2.437511, 1, 1, 1, 1, 1,
-0.1509525, -2.666851, -1.645615, 1, 1, 1, 1, 1,
-0.1507619, 0.9217731, 0.5808852, 1, 1, 1, 1, 1,
-0.1464027, 1.21766, -0.07704847, 1, 1, 1, 1, 1,
-0.1455518, -0.6286592, -2.626448, 1, 1, 1, 1, 1,
-0.1414006, -0.2321596, -1.363321, 1, 1, 1, 1, 1,
-0.1385997, 0.5703909, -2.20716, 1, 1, 1, 1, 1,
-0.1378791, 2.108138, -0.3976649, 1, 1, 1, 1, 1,
-0.137657, 0.8941219, -0.6789952, 1, 1, 1, 1, 1,
-0.136055, 0.113465, -0.3179433, 1, 1, 1, 1, 1,
-0.1332576, -1.163104, -3.144893, 1, 1, 1, 1, 1,
-0.1331289, 0.2987404, -1.903456, 1, 1, 1, 1, 1,
-0.1318121, 0.8378015, -0.5847453, 1, 1, 1, 1, 1,
-0.1293679, -1.257743, -2.278753, 1, 1, 1, 1, 1,
-0.1292389, -0.4027959, -3.373193, 0, 0, 1, 1, 1,
-0.1260231, 2.752103, 1.208242, 1, 0, 0, 1, 1,
-0.1197587, 0.1731041, 1.173142, 1, 0, 0, 1, 1,
-0.1139178, 1.538347, 0.9145188, 1, 0, 0, 1, 1,
-0.1117413, 0.3145131, -0.3195626, 1, 0, 0, 1, 1,
-0.1052473, 0.4421599, 0.1711689, 1, 0, 0, 1, 1,
-0.103037, -1.669675, -4.208621, 0, 0, 0, 1, 1,
-0.1010427, -0.8244507, -2.75491, 0, 0, 0, 1, 1,
-0.0996347, 1.991573, 1.880412, 0, 0, 0, 1, 1,
-0.09691955, -1.234367, -1.099476, 0, 0, 0, 1, 1,
-0.09432822, -0.560086, -1.821659, 0, 0, 0, 1, 1,
-0.08871249, -2.039093, -2.595777, 0, 0, 0, 1, 1,
-0.08566399, 0.3163652, 0.7135907, 0, 0, 0, 1, 1,
-0.0849945, -0.00019842, -1.567381, 1, 1, 1, 1, 1,
-0.08400322, 1.852818, -0.7486821, 1, 1, 1, 1, 1,
-0.08383237, 0.3405329, 0.05177279, 1, 1, 1, 1, 1,
-0.0751138, -0.8232709, -5.112707, 1, 1, 1, 1, 1,
-0.07082588, -0.8838387, -3.041916, 1, 1, 1, 1, 1,
-0.06872395, -1.253642, -3.020958, 1, 1, 1, 1, 1,
-0.06732493, -1.144884, -1.801949, 1, 1, 1, 1, 1,
-0.06723835, -0.1359349, -0.9442126, 1, 1, 1, 1, 1,
-0.06151718, 0.7767861, -0.200489, 1, 1, 1, 1, 1,
-0.05849444, -0.248148, -3.536355, 1, 1, 1, 1, 1,
-0.0558003, 0.1670455, -0.886744, 1, 1, 1, 1, 1,
-0.0509486, 0.5761583, 0.1516466, 1, 1, 1, 1, 1,
-0.04807615, -0.8035244, -3.396856, 1, 1, 1, 1, 1,
-0.04366851, -0.5250334, -3.012434, 1, 1, 1, 1, 1,
-0.04054732, 3.271482, 0.5009326, 1, 1, 1, 1, 1,
-0.03924948, -1.058611, -3.586421, 0, 0, 1, 1, 1,
-0.03424773, 1.339562, 1.008435, 1, 0, 0, 1, 1,
-0.02988495, 1.468127, -1.37448, 1, 0, 0, 1, 1,
-0.0280961, 0.9148813, 1.458319, 1, 0, 0, 1, 1,
-0.02651421, 0.3036227, -0.8241352, 1, 0, 0, 1, 1,
-0.02377337, 0.1633332, 1.076541, 1, 0, 0, 1, 1,
-0.02116967, 0.08430869, -1.988064, 0, 0, 0, 1, 1,
-0.01679832, 0.3913749, -0.7108567, 0, 0, 0, 1, 1,
-0.01435689, -0.9045843, -2.686017, 0, 0, 0, 1, 1,
-0.00925644, 0.9083427, 1.018592, 0, 0, 0, 1, 1,
-0.007464124, 0.288751, -0.3986102, 0, 0, 0, 1, 1,
-0.007365116, -0.5533322, -3.475178, 0, 0, 0, 1, 1,
-0.006985139, 0.2368036, -0.9807309, 0, 0, 0, 1, 1,
-0.005094333, 0.1718986, -0.9236544, 1, 1, 1, 1, 1,
0.002035771, 1.393364, -0.2909614, 1, 1, 1, 1, 1,
0.003939012, -0.8131129, 4.332757, 1, 1, 1, 1, 1,
0.004037064, -0.7441004, 3.771997, 1, 1, 1, 1, 1,
0.004510974, 0.1504777, 1.224109, 1, 1, 1, 1, 1,
0.01234328, 1.401342, 0.6877972, 1, 1, 1, 1, 1,
0.016085, 0.6837556, -0.1903036, 1, 1, 1, 1, 1,
0.01796631, -1.163392, 3.083328, 1, 1, 1, 1, 1,
0.02163547, 0.2510197, 1.932521, 1, 1, 1, 1, 1,
0.02226836, 0.8164614, -0.3331388, 1, 1, 1, 1, 1,
0.02242795, -0.4606974, 2.685429, 1, 1, 1, 1, 1,
0.02446324, 1.941719, 0.4377294, 1, 1, 1, 1, 1,
0.02602725, -0.2320482, 2.405939, 1, 1, 1, 1, 1,
0.02648563, 1.560381, -0.406448, 1, 1, 1, 1, 1,
0.0351551, 1.129063, -0.04648711, 1, 1, 1, 1, 1,
0.03637993, -0.5428529, 3.169056, 0, 0, 1, 1, 1,
0.04159289, 0.2208899, 0.2414705, 1, 0, 0, 1, 1,
0.04167945, -0.06360173, 0.8246601, 1, 0, 0, 1, 1,
0.04224599, 0.2101891, 1.433257, 1, 0, 0, 1, 1,
0.04558533, -0.4961374, 3.54859, 1, 0, 0, 1, 1,
0.04653335, -0.66557, 2.635864, 1, 0, 0, 1, 1,
0.05265474, 0.6873211, 0.3516773, 0, 0, 0, 1, 1,
0.05640212, 2.565415, 0.6382307, 0, 0, 0, 1, 1,
0.05739521, -0.5572211, 2.646688, 0, 0, 0, 1, 1,
0.05931446, 0.7983139, 0.0669725, 0, 0, 0, 1, 1,
0.06151659, 0.784055, 0.06855249, 0, 0, 0, 1, 1,
0.06283801, 1.33565, 0.3584563, 0, 0, 0, 1, 1,
0.063567, 2.292847, -1.21794, 0, 0, 0, 1, 1,
0.06764639, 0.3767633, -0.8204391, 1, 1, 1, 1, 1,
0.06768396, -0.6994339, 1.530901, 1, 1, 1, 1, 1,
0.07104936, 0.5824247, -1.204918, 1, 1, 1, 1, 1,
0.07112838, 0.9004319, -0.6356444, 1, 1, 1, 1, 1,
0.07394274, 1.126912, 0.02038459, 1, 1, 1, 1, 1,
0.07826625, 0.4470747, -0.2412539, 1, 1, 1, 1, 1,
0.07947373, 0.415994, 1.765616, 1, 1, 1, 1, 1,
0.08449663, -0.6304631, 3.032123, 1, 1, 1, 1, 1,
0.1033305, -0.134564, 1.129188, 1, 1, 1, 1, 1,
0.1070108, 2.169556, 1.781596, 1, 1, 1, 1, 1,
0.1148636, -0.9990475, 0.9012685, 1, 1, 1, 1, 1,
0.1176101, 1.051697, -0.2597178, 1, 1, 1, 1, 1,
0.1181168, -1.751912, 1.116923, 1, 1, 1, 1, 1,
0.1206783, -0.6277115, 4.901296, 1, 1, 1, 1, 1,
0.1212856, -0.8775603, 1.679289, 1, 1, 1, 1, 1,
0.1267343, -0.6695201, 4.003277, 0, 0, 1, 1, 1,
0.1312102, 0.7801069, 1.171297, 1, 0, 0, 1, 1,
0.1317449, -0.4500259, 1.788604, 1, 0, 0, 1, 1,
0.1338344, -1.819196, 4.810829, 1, 0, 0, 1, 1,
0.135972, -0.3167953, 2.952327, 1, 0, 0, 1, 1,
0.136452, 0.3523027, 1.626429, 1, 0, 0, 1, 1,
0.1403798, -1.084484, 3.865208, 0, 0, 0, 1, 1,
0.14116, 1.257213, 1.607925, 0, 0, 0, 1, 1,
0.1445033, -0.1054144, 2.674268, 0, 0, 0, 1, 1,
0.14491, -1.265849, 3.99606, 0, 0, 0, 1, 1,
0.1492656, -2.498102, 3.467409, 0, 0, 0, 1, 1,
0.1516174, -0.5589496, 4.602062, 0, 0, 0, 1, 1,
0.152819, -0.9955254, 2.307036, 0, 0, 0, 1, 1,
0.1539128, -1.564772, 3.002822, 1, 1, 1, 1, 1,
0.1550364, 0.2597394, 0.003635831, 1, 1, 1, 1, 1,
0.1661357, -2.43491, 4.035404, 1, 1, 1, 1, 1,
0.1740185, -0.9596361, 2.881326, 1, 1, 1, 1, 1,
0.1753485, -0.6933232, 2.822168, 1, 1, 1, 1, 1,
0.179288, -1.513624, 2.076597, 1, 1, 1, 1, 1,
0.179358, -0.3449268, 1.443846, 1, 1, 1, 1, 1,
0.1811938, -0.7574103, 3.329964, 1, 1, 1, 1, 1,
0.1852084, 0.8652585, 3.105189, 1, 1, 1, 1, 1,
0.1853069, -0.2503751, 3.928282, 1, 1, 1, 1, 1,
0.1853971, -0.1373064, 3.422689, 1, 1, 1, 1, 1,
0.1875797, -0.01408848, 2.601043, 1, 1, 1, 1, 1,
0.189671, 0.3593901, 0.3377091, 1, 1, 1, 1, 1,
0.192188, -1.963103, 3.276915, 1, 1, 1, 1, 1,
0.192815, 0.9289249, -0.5374627, 1, 1, 1, 1, 1,
0.1939292, -0.7470813, 4.44471, 0, 0, 1, 1, 1,
0.199904, -0.1761642, 1.872625, 1, 0, 0, 1, 1,
0.1999842, 0.7088127, 0.2695839, 1, 0, 0, 1, 1,
0.2004863, 0.2813683, 0.8963792, 1, 0, 0, 1, 1,
0.202704, -0.4312996, 1.889467, 1, 0, 0, 1, 1,
0.2048064, 2.315132, -0.4539113, 1, 0, 0, 1, 1,
0.2244281, -0.3119477, 3.507303, 0, 0, 0, 1, 1,
0.2252138, 2.069433, 0.6238165, 0, 0, 0, 1, 1,
0.2271624, -0.1620861, 3.438802, 0, 0, 0, 1, 1,
0.2287934, 0.8111725, 0.3499478, 0, 0, 0, 1, 1,
0.2328225, 0.7428203, 0.5657176, 0, 0, 0, 1, 1,
0.232861, -2.208354, 3.740333, 0, 0, 0, 1, 1,
0.233522, -0.2762869, 2.786981, 0, 0, 0, 1, 1,
0.2359553, 0.692891, 0.108896, 1, 1, 1, 1, 1,
0.2360797, -0.9058963, 3.109647, 1, 1, 1, 1, 1,
0.2384993, -0.9562581, 3.716213, 1, 1, 1, 1, 1,
0.2426616, 1.433096, 0.08926833, 1, 1, 1, 1, 1,
0.2437396, -0.6715643, 3.633346, 1, 1, 1, 1, 1,
0.2472276, 1.262877, -1.584725, 1, 1, 1, 1, 1,
0.250985, -1.251246, 3.314905, 1, 1, 1, 1, 1,
0.2537072, -1.400114, 3.317129, 1, 1, 1, 1, 1,
0.2607645, 2.130833, 0.2563825, 1, 1, 1, 1, 1,
0.2618212, 0.1386162, 0.9200883, 1, 1, 1, 1, 1,
0.2625186, 0.152197, 0.2588304, 1, 1, 1, 1, 1,
0.2682779, 0.3826158, 0.4467974, 1, 1, 1, 1, 1,
0.2708904, -1.23192, 3.332818, 1, 1, 1, 1, 1,
0.2725405, -1.083005, 3.084505, 1, 1, 1, 1, 1,
0.2750763, -0.5150194, 2.856713, 1, 1, 1, 1, 1,
0.2787008, -0.1557996, 0.558539, 0, 0, 1, 1, 1,
0.2842259, -0.9539363, 3.329207, 1, 0, 0, 1, 1,
0.2877055, 0.2963539, 0.8979901, 1, 0, 0, 1, 1,
0.2879033, -1.177373, 2.318063, 1, 0, 0, 1, 1,
0.2882739, -0.3387649, 0.1847781, 1, 0, 0, 1, 1,
0.2888581, -0.2405537, 3.073785, 1, 0, 0, 1, 1,
0.2977481, -2.161942, 1.982619, 0, 0, 0, 1, 1,
0.2990265, -1.805203, 2.446391, 0, 0, 0, 1, 1,
0.2997722, 0.9546705, 0.3859446, 0, 0, 0, 1, 1,
0.3069437, -0.5537915, 3.700785, 0, 0, 0, 1, 1,
0.3076565, -0.4142131, 3.836537, 0, 0, 0, 1, 1,
0.3084345, -0.8158187, 2.531239, 0, 0, 0, 1, 1,
0.3171231, -1.233858, 2.822063, 0, 0, 0, 1, 1,
0.3180384, -0.5883351, 0.537948, 1, 1, 1, 1, 1,
0.3182816, 0.4942691, -0.4312685, 1, 1, 1, 1, 1,
0.3214581, 1.420366, 1.567194, 1, 1, 1, 1, 1,
0.3229598, 0.3007797, -0.2861592, 1, 1, 1, 1, 1,
0.3365491, 0.2532142, 1.537305, 1, 1, 1, 1, 1,
0.3417724, 0.4039955, 0.9498069, 1, 1, 1, 1, 1,
0.3461428, 1.592282, -0.364011, 1, 1, 1, 1, 1,
0.3466929, 1.697696, 0.3482538, 1, 1, 1, 1, 1,
0.3469534, -0.2099856, 0.8473383, 1, 1, 1, 1, 1,
0.3477311, -0.7164119, 2.359316, 1, 1, 1, 1, 1,
0.3479641, -0.1660349, 1.862802, 1, 1, 1, 1, 1,
0.3480587, -0.4464504, 0.8271462, 1, 1, 1, 1, 1,
0.3487225, -1.15681, 2.483458, 1, 1, 1, 1, 1,
0.3489331, -1.011236, 2.41339, 1, 1, 1, 1, 1,
0.3518596, 1.211673, 0.7999383, 1, 1, 1, 1, 1,
0.3573102, 0.5562342, -1.584729, 0, 0, 1, 1, 1,
0.3607383, -0.722892, 1.456912, 1, 0, 0, 1, 1,
0.3625219, 0.1778857, 1.530821, 1, 0, 0, 1, 1,
0.3630381, -0.1930388, 1.481633, 1, 0, 0, 1, 1,
0.3638437, -0.1060908, 0.1545076, 1, 0, 0, 1, 1,
0.3652475, 0.8943992, 0.5827072, 1, 0, 0, 1, 1,
0.3653772, 0.4704115, -0.7487268, 0, 0, 0, 1, 1,
0.3677144, -0.7129471, 1.761613, 0, 0, 0, 1, 1,
0.3705364, -0.06785051, 0.5735236, 0, 0, 0, 1, 1,
0.3706664, 1.286071, 0.6116696, 0, 0, 0, 1, 1,
0.3724269, 0.7391337, 0.04501336, 0, 0, 0, 1, 1,
0.3761458, 0.09461658, 1.525907, 0, 0, 0, 1, 1,
0.3780493, 0.3170019, -0.4262063, 0, 0, 0, 1, 1,
0.3812307, -0.9375982, 1.38887, 1, 1, 1, 1, 1,
0.3849057, -1.550821, 3.65916, 1, 1, 1, 1, 1,
0.3879728, -0.6116226, 2.708886, 1, 1, 1, 1, 1,
0.3885752, -0.3943947, 1.553619, 1, 1, 1, 1, 1,
0.3928014, -1.766253, 4.700938, 1, 1, 1, 1, 1,
0.3947304, -0.4385934, 1.683382, 1, 1, 1, 1, 1,
0.3949383, -0.5223063, 1.165201, 1, 1, 1, 1, 1,
0.4038811, 0.1349998, 1.202323, 1, 1, 1, 1, 1,
0.4040193, -0.03253991, 3.531857, 1, 1, 1, 1, 1,
0.4055761, -0.3479153, 1.647081, 1, 1, 1, 1, 1,
0.4057541, -1.525734, 3.341801, 1, 1, 1, 1, 1,
0.4070376, 0.6228252, -0.5220143, 1, 1, 1, 1, 1,
0.4101094, -0.03720764, 0.7893081, 1, 1, 1, 1, 1,
0.4178655, -1.25694, 4.93827, 1, 1, 1, 1, 1,
0.4218217, -0.06017161, 3.944059, 1, 1, 1, 1, 1,
0.4240702, 0.05402846, 2.702198, 0, 0, 1, 1, 1,
0.4259053, 0.7014029, 0.1879561, 1, 0, 0, 1, 1,
0.4259456, 0.6107991, 1.284624, 1, 0, 0, 1, 1,
0.4273179, 0.228352, 0.65522, 1, 0, 0, 1, 1,
0.4310694, 0.1368455, 2.406357, 1, 0, 0, 1, 1,
0.4328015, 1.980183, -0.3861844, 1, 0, 0, 1, 1,
0.4342469, 0.2977133, 1.114458, 0, 0, 0, 1, 1,
0.4390736, -1.069743, 1.704368, 0, 0, 0, 1, 1,
0.4422626, -0.3104033, 2.196609, 0, 0, 0, 1, 1,
0.4447633, -1.09819, 2.067998, 0, 0, 0, 1, 1,
0.4461114, -0.7045408, 2.772496, 0, 0, 0, 1, 1,
0.447777, -0.1042148, 1.890629, 0, 0, 0, 1, 1,
0.4499654, 1.408898, 2.448536, 0, 0, 0, 1, 1,
0.4513529, -1.113029, 4.109533, 1, 1, 1, 1, 1,
0.4515227, -0.8963881, 1.058686, 1, 1, 1, 1, 1,
0.4526247, -0.3993425, 3.683585, 1, 1, 1, 1, 1,
0.4553202, -0.9953117, 1.493939, 1, 1, 1, 1, 1,
0.4558668, -0.03712511, 2.132475, 1, 1, 1, 1, 1,
0.4576746, -0.4093352, 1.148067, 1, 1, 1, 1, 1,
0.4582863, 0.9003346, 1.026224, 1, 1, 1, 1, 1,
0.459589, 1.620314, -1.501967, 1, 1, 1, 1, 1,
0.4620899, 0.5812038, -0.1452305, 1, 1, 1, 1, 1,
0.4635153, -0.4048775, 0.6310608, 1, 1, 1, 1, 1,
0.4671144, -0.8324431, 0.7067823, 1, 1, 1, 1, 1,
0.4705937, 0.4644049, -0.4785669, 1, 1, 1, 1, 1,
0.4716557, 0.2769256, 1.936168, 1, 1, 1, 1, 1,
0.4729273, -0.6128092, 2.883711, 1, 1, 1, 1, 1,
0.4756245, 0.2564112, 2.686601, 1, 1, 1, 1, 1,
0.4788906, -0.4538517, 1.617924, 0, 0, 1, 1, 1,
0.4844919, 0.7825999, 0.08333991, 1, 0, 0, 1, 1,
0.4845206, -0.2975329, 0.7802532, 1, 0, 0, 1, 1,
0.4846449, -2.949735, 3.220811, 1, 0, 0, 1, 1,
0.4871855, -0.7515604, 1.763612, 1, 0, 0, 1, 1,
0.4872591, -0.08403344, 1.034164, 1, 0, 0, 1, 1,
0.4912504, -1.344822, 2.530583, 0, 0, 0, 1, 1,
0.4915852, -1.162619, 2.338938, 0, 0, 0, 1, 1,
0.492787, -1.383235, 3.013736, 0, 0, 0, 1, 1,
0.4937443, 0.9159379, 0.6485951, 0, 0, 0, 1, 1,
0.4942434, -0.4335224, 1.43536, 0, 0, 0, 1, 1,
0.4960996, 1.011904, 0.04562883, 0, 0, 0, 1, 1,
0.4970134, 0.3258932, 1.347497, 0, 0, 0, 1, 1,
0.4994409, 0.8577798, 1.641506, 1, 1, 1, 1, 1,
0.5005737, 0.02186058, 3.062766, 1, 1, 1, 1, 1,
0.5019217, -1.761944, 3.938347, 1, 1, 1, 1, 1,
0.5061782, -1.284685, 3.443354, 1, 1, 1, 1, 1,
0.5088397, -0.5555452, 2.223019, 1, 1, 1, 1, 1,
0.5095792, -0.9963353, 4.776659, 1, 1, 1, 1, 1,
0.5127183, 0.09870178, 1.172139, 1, 1, 1, 1, 1,
0.5152472, 0.6353747, 0.6051612, 1, 1, 1, 1, 1,
0.521385, 0.9738095, -0.5710547, 1, 1, 1, 1, 1,
0.522453, 0.8711762, -0.9884928, 1, 1, 1, 1, 1,
0.5249016, -1.033843, 1.822306, 1, 1, 1, 1, 1,
0.527356, -1.028806, 3.450464, 1, 1, 1, 1, 1,
0.531752, 0.2421189, 1.342775, 1, 1, 1, 1, 1,
0.5327418, 1.151138, 0.4349395, 1, 1, 1, 1, 1,
0.5340798, -1.008429, 3.244061, 1, 1, 1, 1, 1,
0.5408469, 0.4561535, 2.440189, 0, 0, 1, 1, 1,
0.5488787, -0.8909712, 4.101252, 1, 0, 0, 1, 1,
0.5507096, -0.07494219, 1.852092, 1, 0, 0, 1, 1,
0.5515789, -1.565459, 2.673077, 1, 0, 0, 1, 1,
0.5553949, 0.8630843, -1.124147, 1, 0, 0, 1, 1,
0.5613061, -0.2873967, 0.9822593, 1, 0, 0, 1, 1,
0.5683095, -1.675696, 1.219003, 0, 0, 0, 1, 1,
0.5719246, -0.1994569, 3.468102, 0, 0, 0, 1, 1,
0.5723742, -1.147951, 2.858612, 0, 0, 0, 1, 1,
0.5724455, 1.152017, 2.174144, 0, 0, 0, 1, 1,
0.5770987, -0.3732639, 1.484095, 0, 0, 0, 1, 1,
0.5785387, -0.1090293, 3.050005, 0, 0, 0, 1, 1,
0.5788808, 1.019728, 0.4035883, 0, 0, 0, 1, 1,
0.579285, 0.2216912, -0.3616247, 1, 1, 1, 1, 1,
0.5818038, 0.3373739, 1.176397, 1, 1, 1, 1, 1,
0.5828786, -0.4780123, 2.75214, 1, 1, 1, 1, 1,
0.5834343, -0.622681, 2.752348, 1, 1, 1, 1, 1,
0.5849438, -0.7773874, 0.6807105, 1, 1, 1, 1, 1,
0.5930694, 0.8261684, -0.1510414, 1, 1, 1, 1, 1,
0.5976299, -0.8681171, 1.688378, 1, 1, 1, 1, 1,
0.6049121, 1.329271, 0.0435955, 1, 1, 1, 1, 1,
0.6089809, 0.4565524, 1.467933, 1, 1, 1, 1, 1,
0.6221914, -0.1907099, 1.880985, 1, 1, 1, 1, 1,
0.6287283, 0.7425351, -0.0299414, 1, 1, 1, 1, 1,
0.6316282, -0.0276678, 1.473602, 1, 1, 1, 1, 1,
0.6336353, -0.4313382, 2.783412, 1, 1, 1, 1, 1,
0.6348158, 0.6249396, -0.08887329, 1, 1, 1, 1, 1,
0.6361398, 1.894709, 1.050832, 1, 1, 1, 1, 1,
0.6479866, 0.6325291, 1.316515, 0, 0, 1, 1, 1,
0.6488013, 2.678241, -0.3549187, 1, 0, 0, 1, 1,
0.6502877, -1.773594, 1.534722, 1, 0, 0, 1, 1,
0.6553085, 0.8094075, 0.4987858, 1, 0, 0, 1, 1,
0.6563141, -0.6302923, 1.122702, 1, 0, 0, 1, 1,
0.6576609, 0.7021266, -0.591266, 1, 0, 0, 1, 1,
0.6587501, 0.1498871, 1.350679, 0, 0, 0, 1, 1,
0.6648643, -2.216517, 1.160441, 0, 0, 0, 1, 1,
0.6663191, -0.7263951, 2.84499, 0, 0, 0, 1, 1,
0.6686935, -1.916971, 1.779744, 0, 0, 0, 1, 1,
0.6695588, -0.1027544, 3.144073, 0, 0, 0, 1, 1,
0.6786034, -0.3452692, 3.316099, 0, 0, 0, 1, 1,
0.6788329, 1.410329, 0.7399737, 0, 0, 0, 1, 1,
0.6789196, -0.8251097, 3.554952, 1, 1, 1, 1, 1,
0.6809838, -0.8887668, 2.790838, 1, 1, 1, 1, 1,
0.6811673, 0.3934444, 1.374363, 1, 1, 1, 1, 1,
0.6827623, -0.8419477, 2.173624, 1, 1, 1, 1, 1,
0.686982, -0.5772052, 1.378605, 1, 1, 1, 1, 1,
0.6873574, -1.361525, 4.049018, 1, 1, 1, 1, 1,
0.687736, -0.1612937, 2.406444, 1, 1, 1, 1, 1,
0.6892638, -0.8416299, 1.72278, 1, 1, 1, 1, 1,
0.6910847, -0.6752012, 1.179274, 1, 1, 1, 1, 1,
0.6937767, -0.2471484, 1.690091, 1, 1, 1, 1, 1,
0.6961279, -0.614045, 1.709759, 1, 1, 1, 1, 1,
0.6970977, 1.213678, -0.3056331, 1, 1, 1, 1, 1,
0.7020452, 1.032188, 1.333782, 1, 1, 1, 1, 1,
0.7033436, 1.040663, 1.635264, 1, 1, 1, 1, 1,
0.7058827, -0.3430743, 2.615155, 1, 1, 1, 1, 1,
0.7117908, 0.324881, 1.085353, 0, 0, 1, 1, 1,
0.717006, 0.2705942, 0.6310259, 1, 0, 0, 1, 1,
0.7228521, 1.733613, 0.8283778, 1, 0, 0, 1, 1,
0.7241149, 2.245843, -0.4903362, 1, 0, 0, 1, 1,
0.7293384, -0.9323246, 2.715412, 1, 0, 0, 1, 1,
0.732857, 0.4393855, 2.360308, 1, 0, 0, 1, 1,
0.738542, 0.2318528, 3.003456, 0, 0, 0, 1, 1,
0.7411059, 0.6772667, -0.04773296, 0, 0, 0, 1, 1,
0.7441643, 1.705051, -0.7650447, 0, 0, 0, 1, 1,
0.7566912, 0.7242112, 1.502929, 0, 0, 0, 1, 1,
0.7634515, -1.901896, 2.098599, 0, 0, 0, 1, 1,
0.7639104, -1.212701, 1.712136, 0, 0, 0, 1, 1,
0.7778878, 0.4960426, 2.636139, 0, 0, 0, 1, 1,
0.7793568, -0.3703486, 0.9740709, 1, 1, 1, 1, 1,
0.7798262, 0.4015631, 1.080724, 1, 1, 1, 1, 1,
0.7835078, 0.7640163, -0.4498838, 1, 1, 1, 1, 1,
0.7852643, -0.5077532, 1.62628, 1, 1, 1, 1, 1,
0.7891507, -0.4132145, 2.707764, 1, 1, 1, 1, 1,
0.7931495, 0.3625365, 3.561485, 1, 1, 1, 1, 1,
0.7954333, 1.029168, 0.9874192, 1, 1, 1, 1, 1,
0.7999011, 0.31632, 2.558654, 1, 1, 1, 1, 1,
0.8033217, 0.4727997, 1.803746, 1, 1, 1, 1, 1,
0.8124564, -0.5950105, 2.182533, 1, 1, 1, 1, 1,
0.8146883, 0.5255138, 0.8618791, 1, 1, 1, 1, 1,
0.8271703, -0.9636995, 2.405443, 1, 1, 1, 1, 1,
0.8272685, 1.445442, 0.5852715, 1, 1, 1, 1, 1,
0.8397393, -0.09874347, 1.55776, 1, 1, 1, 1, 1,
0.8398007, -0.8998247, 3.388338, 1, 1, 1, 1, 1,
0.8467913, 1.613991, -0.2617627, 0, 0, 1, 1, 1,
0.8470137, -0.3590814, 2.449627, 1, 0, 0, 1, 1,
0.8573979, -0.4904597, 2.270409, 1, 0, 0, 1, 1,
0.8596187, 0.2292886, 3.172586, 1, 0, 0, 1, 1,
0.8658639, 0.1549606, 2.553789, 1, 0, 0, 1, 1,
0.8677181, 0.5060162, 0.5138112, 1, 0, 0, 1, 1,
0.8683411, 1.541122, 0.5168619, 0, 0, 0, 1, 1,
0.8694152, 1.649577, -1.353318, 0, 0, 0, 1, 1,
0.8729957, -1.065969, 0.7325965, 0, 0, 0, 1, 1,
0.8807516, -3.202223, 3.06057, 0, 0, 0, 1, 1,
0.8897022, 0.8054686, 1.151665, 0, 0, 0, 1, 1,
0.8919904, 0.8776208, -0.333796, 0, 0, 0, 1, 1,
0.9069541, -0.3286245, 0.709803, 0, 0, 0, 1, 1,
0.9091363, -1.635421, 2.848906, 1, 1, 1, 1, 1,
0.9167812, 0.7141808, 0.04738961, 1, 1, 1, 1, 1,
0.9201603, -0.8392428, 2.747904, 1, 1, 1, 1, 1,
0.9201912, -2.100154, 1.843045, 1, 1, 1, 1, 1,
0.9267185, -2.242186, 3.218109, 1, 1, 1, 1, 1,
0.9331035, 1.312318, -0.01642292, 1, 1, 1, 1, 1,
0.9470336, 0.3754812, 0.3926241, 1, 1, 1, 1, 1,
0.9495454, 0.5657325, 1.03575, 1, 1, 1, 1, 1,
0.9614072, 0.644664, 1.546807, 1, 1, 1, 1, 1,
0.9617895, -0.8829049, 2.825319, 1, 1, 1, 1, 1,
0.9623376, -0.5634733, 1.369014, 1, 1, 1, 1, 1,
0.9664983, -0.4487251, 0.6062379, 1, 1, 1, 1, 1,
0.968623, 2.111037, 1.587826, 1, 1, 1, 1, 1,
0.9756465, 0.1675421, 2.601452, 1, 1, 1, 1, 1,
0.9818093, -1.07969, 4.087925, 1, 1, 1, 1, 1,
0.9911072, 1.916514, -0.1483686, 0, 0, 1, 1, 1,
0.9982588, 0.4380265, 1.517882, 1, 0, 0, 1, 1,
0.9986545, 0.685104, -0.3686234, 1, 0, 0, 1, 1,
1.010591, 1.741933, 1.317172, 1, 0, 0, 1, 1,
1.014281, 0.281394, 1.873816, 1, 0, 0, 1, 1,
1.01676, 0.7020006, 0.9632387, 1, 0, 0, 1, 1,
1.017825, -0.04400057, 2.36253, 0, 0, 0, 1, 1,
1.023955, 0.5313323, -0.4224471, 0, 0, 0, 1, 1,
1.027268, -0.501864, 1.523421, 0, 0, 0, 1, 1,
1.034991, 0.8130637, 2.228165, 0, 0, 0, 1, 1,
1.055933, -0.7180804, 2.57649, 0, 0, 0, 1, 1,
1.057566, -1.071415, 3.173943, 0, 0, 0, 1, 1,
1.07422, 0.50427, 0.6982954, 0, 0, 0, 1, 1,
1.075361, 0.06050766, 1.876767, 1, 1, 1, 1, 1,
1.080865, 1.36746, -0.9383289, 1, 1, 1, 1, 1,
1.088815, -0.5511472, 2.566504, 1, 1, 1, 1, 1,
1.094113, 0.2746949, 1.950064, 1, 1, 1, 1, 1,
1.096526, -0.3623397, 1.262566, 1, 1, 1, 1, 1,
1.102358, -0.8457822, 2.914003, 1, 1, 1, 1, 1,
1.103977, 0.6109695, 2.433079, 1, 1, 1, 1, 1,
1.115159, 0.2607971, 2.315722, 1, 1, 1, 1, 1,
1.11771, 0.4065565, 1.18909, 1, 1, 1, 1, 1,
1.122905, 0.8310988, 0.4501334, 1, 1, 1, 1, 1,
1.130598, 0.76662, 1.851947, 1, 1, 1, 1, 1,
1.133478, -1.529385, 2.928434, 1, 1, 1, 1, 1,
1.13558, -2.038332, 3.752498, 1, 1, 1, 1, 1,
1.137913, 0.9464797, 0.7004581, 1, 1, 1, 1, 1,
1.141921, 0.2526707, 0.8218496, 1, 1, 1, 1, 1,
1.157016, 0.1029067, 1.940704, 0, 0, 1, 1, 1,
1.159013, 0.0676598, 1.855641, 1, 0, 0, 1, 1,
1.160867, -0.03661592, 0.4804026, 1, 0, 0, 1, 1,
1.166172, 1.443128, 0.5778294, 1, 0, 0, 1, 1,
1.170424, -0.03903315, 2.03717, 1, 0, 0, 1, 1,
1.175469, 1.426939, 0.4972643, 1, 0, 0, 1, 1,
1.175998, 0.4429365, -0.3519657, 0, 0, 0, 1, 1,
1.183379, 0.4423178, -0.7106962, 0, 0, 0, 1, 1,
1.194052, -0.5682529, 0.5870858, 0, 0, 0, 1, 1,
1.197185, -0.5428231, 1.547674, 0, 0, 0, 1, 1,
1.203419, -0.05920667, 2.587516, 0, 0, 0, 1, 1,
1.2156, -1.09148, 2.290729, 0, 0, 0, 1, 1,
1.216055, -0.3057286, 2.249319, 0, 0, 0, 1, 1,
1.217395, -0.4960182, 2.021539, 1, 1, 1, 1, 1,
1.221567, -0.1645254, 2.629251, 1, 1, 1, 1, 1,
1.226597, -0.8600667, 0.4690718, 1, 1, 1, 1, 1,
1.244379, -0.2653085, 0.4678127, 1, 1, 1, 1, 1,
1.245051, -1.045772, 0.818057, 1, 1, 1, 1, 1,
1.246456, 1.835535, -0.03980237, 1, 1, 1, 1, 1,
1.24848, -0.1638579, 0.6614349, 1, 1, 1, 1, 1,
1.261765, -0.9966781, 0.8682643, 1, 1, 1, 1, 1,
1.26201, -0.2648466, 1.871983, 1, 1, 1, 1, 1,
1.265143, -0.09366153, 2.848158, 1, 1, 1, 1, 1,
1.268512, -0.1184426, 1.954626, 1, 1, 1, 1, 1,
1.279261, 0.3046571, 3.235068, 1, 1, 1, 1, 1,
1.292709, -0.9381258, 2.03673, 1, 1, 1, 1, 1,
1.305316, 1.960575, -0.3165306, 1, 1, 1, 1, 1,
1.310753, 0.6089597, 1.751229, 1, 1, 1, 1, 1,
1.313807, 1.38416, -0.7307753, 0, 0, 1, 1, 1,
1.317907, 0.4737282, 0.08159616, 1, 0, 0, 1, 1,
1.319095, 0.02771464, 1.579987, 1, 0, 0, 1, 1,
1.319475, 1.374647, 0.5179912, 1, 0, 0, 1, 1,
1.31992, -0.9368964, 1.759909, 1, 0, 0, 1, 1,
1.335956, 1.269304, 0.3961112, 1, 0, 0, 1, 1,
1.34754, 0.2395549, 2.081852, 0, 0, 0, 1, 1,
1.352331, 1.656991, 1.715292, 0, 0, 0, 1, 1,
1.353893, -1.213026, 2.856047, 0, 0, 0, 1, 1,
1.357366, -0.6705659, 2.274495, 0, 0, 0, 1, 1,
1.358857, 0.238397, 2.995608, 0, 0, 0, 1, 1,
1.360679, -0.5774856, 2.790506, 0, 0, 0, 1, 1,
1.37331, -0.836616, 1.081121, 0, 0, 0, 1, 1,
1.37683, 1.729259, 0.6238126, 1, 1, 1, 1, 1,
1.389359, 0.5902824, 0.8396744, 1, 1, 1, 1, 1,
1.396062, 1.075231, 1.184361, 1, 1, 1, 1, 1,
1.40699, 0.4803218, 1.976367, 1, 1, 1, 1, 1,
1.410841, -0.3686192, 0.6743388, 1, 1, 1, 1, 1,
1.421019, -0.8768168, 1.862865, 1, 1, 1, 1, 1,
1.423226, 0.2491104, 2.317368, 1, 1, 1, 1, 1,
1.424363, 0.05225864, 1.880361, 1, 1, 1, 1, 1,
1.432904, -1.354412, 3.441503, 1, 1, 1, 1, 1,
1.439924, 0.5903631, 0.142462, 1, 1, 1, 1, 1,
1.444332, -1.57537, 2.434706, 1, 1, 1, 1, 1,
1.449854, -0.09968646, 0.3787645, 1, 1, 1, 1, 1,
1.449905, 0.3822233, 1.281836, 1, 1, 1, 1, 1,
1.473733, 0.723509, -0.9559279, 1, 1, 1, 1, 1,
1.484498, 0.343431, 1.899609, 1, 1, 1, 1, 1,
1.490603, -0.9901493, 1.895321, 0, 0, 1, 1, 1,
1.491696, -1.853276, 1.169969, 1, 0, 0, 1, 1,
1.497764, -0.1497765, 1.775032, 1, 0, 0, 1, 1,
1.501127, -0.3178026, 1.610852, 1, 0, 0, 1, 1,
1.513076, 1.919927, 0.7933463, 1, 0, 0, 1, 1,
1.527448, -0.5242553, 3.306397, 1, 0, 0, 1, 1,
1.540382, 0.1323283, 1.287437, 0, 0, 0, 1, 1,
1.541892, -0.2020505, 2.474705, 0, 0, 0, 1, 1,
1.544702, 0.2986062, 0.9690661, 0, 0, 0, 1, 1,
1.553981, 0.4526644, 2.242414, 0, 0, 0, 1, 1,
1.558867, -0.790036, 3.608894, 0, 0, 0, 1, 1,
1.568505, 0.2393657, 2.441479, 0, 0, 0, 1, 1,
1.581409, -0.8869904, 1.967011, 0, 0, 0, 1, 1,
1.587548, 0.07279161, 1.65443, 1, 1, 1, 1, 1,
1.593722, -0.313979, 2.076722, 1, 1, 1, 1, 1,
1.594788, -0.2515097, 1.285455, 1, 1, 1, 1, 1,
1.600923, 0.8106031, 1.208831, 1, 1, 1, 1, 1,
1.633227, -0.4745252, 1.239828, 1, 1, 1, 1, 1,
1.649947, 0.3447909, 0.7320011, 1, 1, 1, 1, 1,
1.652202, -1.545287, 3.343008, 1, 1, 1, 1, 1,
1.67037, 1.176555, 2.661997, 1, 1, 1, 1, 1,
1.688744, 0.1232177, 1.73783, 1, 1, 1, 1, 1,
1.701529, 2.230574, 0.6115693, 1, 1, 1, 1, 1,
1.707692, 1.068088, 0.1185993, 1, 1, 1, 1, 1,
1.710355, 0.1050437, 2.010429, 1, 1, 1, 1, 1,
1.711627, 1.174308, 0.3560683, 1, 1, 1, 1, 1,
1.712357, -1.098221, 3.144484, 1, 1, 1, 1, 1,
1.734314, -1.666135, 2.996479, 1, 1, 1, 1, 1,
1.739831, -0.5341984, 1.11028, 0, 0, 1, 1, 1,
1.749863, -0.07290655, 1.121079, 1, 0, 0, 1, 1,
1.755998, 0.670581, 0.7980346, 1, 0, 0, 1, 1,
1.75649, 0.6152861, 2.755622, 1, 0, 0, 1, 1,
1.763162, -0.1157439, 0.6350823, 1, 0, 0, 1, 1,
1.776428, 0.2682423, 1.620125, 1, 0, 0, 1, 1,
1.787575, -0.2699291, 2.437185, 0, 0, 0, 1, 1,
1.850434, 0.02279171, -0.2151723, 0, 0, 0, 1, 1,
1.886244, 0.7647721, 1.211689, 0, 0, 0, 1, 1,
1.887326, -1.931692, 1.110652, 0, 0, 0, 1, 1,
1.896372, -0.3441143, 1.198319, 0, 0, 0, 1, 1,
1.907922, -0.7661967, 2.279997, 0, 0, 0, 1, 1,
1.930753, -0.3732256, 1.818901, 0, 0, 0, 1, 1,
1.939266, 1.738567, 1.297248, 1, 1, 1, 1, 1,
1.992522, -1.253506, 2.972545, 1, 1, 1, 1, 1,
1.997221, -1.831042, 1.327273, 1, 1, 1, 1, 1,
1.998291, -0.4248965, 2.360455, 1, 1, 1, 1, 1,
2.006004, -0.01180683, 0.3638683, 1, 1, 1, 1, 1,
2.01897, -1.392871, 0.7319416, 1, 1, 1, 1, 1,
2.031489, 0.3593566, -0.2478209, 1, 1, 1, 1, 1,
2.039449, -0.9389399, 2.689234, 1, 1, 1, 1, 1,
2.042977, -0.137216, 3.171006, 1, 1, 1, 1, 1,
2.04665, 0.3522711, 0.8846319, 1, 1, 1, 1, 1,
2.051097, -0.3235272, 2.388229, 1, 1, 1, 1, 1,
2.11256, 2.018943, -0.4084786, 1, 1, 1, 1, 1,
2.125202, 0.720252, 1.537861, 1, 1, 1, 1, 1,
2.152818, -0.3940786, 2.457615, 1, 1, 1, 1, 1,
2.170638, 0.6024801, 0.8939812, 1, 1, 1, 1, 1,
2.185981, 1.272164, 1.54432, 0, 0, 1, 1, 1,
2.212416, 0.840887, 0.797529, 1, 0, 0, 1, 1,
2.222221, -0.9300677, 2.210523, 1, 0, 0, 1, 1,
2.237703, 0.8922569, -0.6899313, 1, 0, 0, 1, 1,
2.244793, -0.09582872, 3.604562, 1, 0, 0, 1, 1,
2.248305, 0.8668075, 2.733301, 1, 0, 0, 1, 1,
2.261501, 0.7361337, 2.003423, 0, 0, 0, 1, 1,
2.293748, -0.5154163, 1.059078, 0, 0, 0, 1, 1,
2.387525, -1.827208, 2.822175, 0, 0, 0, 1, 1,
2.397907, -1.85414, 0.9220682, 0, 0, 0, 1, 1,
2.417659, 0.100628, 1.332507, 0, 0, 0, 1, 1,
2.438649, -1.72686, 2.335976, 0, 0, 0, 1, 1,
2.48091, -1.199654, 1.42768, 0, 0, 0, 1, 1,
2.525382, -0.6685814, 1.551667, 1, 1, 1, 1, 1,
2.533823, 0.05320245, 3.241004, 1, 1, 1, 1, 1,
2.573423, 0.3835858, 2.015266, 1, 1, 1, 1, 1,
2.676876, 0.3910246, 0.9348727, 1, 1, 1, 1, 1,
2.737114, -2.76367, 1.658692, 1, 1, 1, 1, 1,
2.805886, 0.9688213, 1.949272, 1, 1, 1, 1, 1,
3.121369, 0.1695237, 1.610052, 1, 1, 1, 1, 1
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
var radius = 9.267665;
var distance = 32.55228;
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
mvMatrix.translate( -0.1346617, 0.06243253, 0.08721828 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.55228);
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
