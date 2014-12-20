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
-2.844974, -0.05008872, -1.08889, 1, 0, 0, 1,
-2.818137, 2.100975, -2.604587, 1, 0.007843138, 0, 1,
-2.770049, -0.828769, -0.4174422, 1, 0.01176471, 0, 1,
-2.549603, 1.283127, -1.778372, 1, 0.01960784, 0, 1,
-2.519478, -0.4865321, -2.992092, 1, 0.02352941, 0, 1,
-2.406268, 0.886721, -1.749479, 1, 0.03137255, 0, 1,
-2.378417, -0.3112948, -1.642429, 1, 0.03529412, 0, 1,
-2.365196, 0.247028, -2.395437, 1, 0.04313726, 0, 1,
-2.335551, 0.4543182, -1.640009, 1, 0.04705882, 0, 1,
-2.319818, 0.2273597, -1.525366, 1, 0.05490196, 0, 1,
-2.297531, -0.1067935, -0.8856848, 1, 0.05882353, 0, 1,
-2.266865, -0.8675297, -1.769714, 1, 0.06666667, 0, 1,
-2.262355, -1.327256, -0.3728113, 1, 0.07058824, 0, 1,
-2.205582, -2.404722, -2.027035, 1, 0.07843138, 0, 1,
-2.172142, -0.1961405, -0.5381551, 1, 0.08235294, 0, 1,
-2.171636, -0.1020352, 0.1669883, 1, 0.09019608, 0, 1,
-2.110384, 0.330252, -2.720228, 1, 0.09411765, 0, 1,
-2.07926, -1.029311, -2.092213, 1, 0.1019608, 0, 1,
-2.077088, -0.9824489, -2.780305, 1, 0.1098039, 0, 1,
-2.063369, -2.151286, -3.096805, 1, 0.1137255, 0, 1,
-2.056772, 1.182798, -0.663924, 1, 0.1215686, 0, 1,
-2.050863, -1.853745, -2.747481, 1, 0.1254902, 0, 1,
-2.017103, 0.1591189, -1.107538, 1, 0.1333333, 0, 1,
-2.00341, 0.3477187, 0.5966071, 1, 0.1372549, 0, 1,
-1.957304, 0.06194218, -1.402581, 1, 0.145098, 0, 1,
-1.949478, 0.5616767, -0.688767, 1, 0.1490196, 0, 1,
-1.945815, -0.8457996, -1.564989, 1, 0.1568628, 0, 1,
-1.94575, -0.7127314, -1.525938, 1, 0.1607843, 0, 1,
-1.944614, 0.914883, -1.21545, 1, 0.1686275, 0, 1,
-1.934863, 0.7448642, -2.822896, 1, 0.172549, 0, 1,
-1.909063, -0.299345, -2.569425, 1, 0.1803922, 0, 1,
-1.893667, -0.9289628, -1.406882, 1, 0.1843137, 0, 1,
-1.866002, 0.3512979, -1.575982, 1, 0.1921569, 0, 1,
-1.865878, -0.1190602, -2.818329, 1, 0.1960784, 0, 1,
-1.858009, -0.8728922, -2.107142, 1, 0.2039216, 0, 1,
-1.849045, 1.061281, -1.716232, 1, 0.2117647, 0, 1,
-1.836481, -0.5125294, -1.93636, 1, 0.2156863, 0, 1,
-1.828279, 0.1520181, -0.6601325, 1, 0.2235294, 0, 1,
-1.815055, -0.5380766, -0.4558693, 1, 0.227451, 0, 1,
-1.799812, -0.4610259, -1.265656, 1, 0.2352941, 0, 1,
-1.78809, -1.083214, -2.014901, 1, 0.2392157, 0, 1,
-1.784311, 0.4487055, -1.064005, 1, 0.2470588, 0, 1,
-1.782072, 0.001099886, 0.04428463, 1, 0.2509804, 0, 1,
-1.752513, 1.411957, 1.053153, 1, 0.2588235, 0, 1,
-1.740109, -0.4169889, -1.449193, 1, 0.2627451, 0, 1,
-1.738558, 0.8165951, -0.007119557, 1, 0.2705882, 0, 1,
-1.735283, -0.1702205, -1.669987, 1, 0.2745098, 0, 1,
-1.717954, -0.2425763, 0.1105071, 1, 0.282353, 0, 1,
-1.714417, -0.5877344, -3.015146, 1, 0.2862745, 0, 1,
-1.705193, -0.2093135, -0.896014, 1, 0.2941177, 0, 1,
-1.696517, 1.904903, -0.6788871, 1, 0.3019608, 0, 1,
-1.674475, 0.4885551, -0.6876153, 1, 0.3058824, 0, 1,
-1.664354, -1.502447, -2.270149, 1, 0.3137255, 0, 1,
-1.659645, -0.2176093, -1.286149, 1, 0.3176471, 0, 1,
-1.623038, 0.1882561, -1.813356, 1, 0.3254902, 0, 1,
-1.615636, 2.105011, -1.589882, 1, 0.3294118, 0, 1,
-1.609215, 0.2416022, -1.461656, 1, 0.3372549, 0, 1,
-1.60192, -0.8201314, -2.231941, 1, 0.3411765, 0, 1,
-1.597396, -0.8648044, -1.887683, 1, 0.3490196, 0, 1,
-1.596424, -0.1196369, -1.840324, 1, 0.3529412, 0, 1,
-1.576905, 0.2486198, -1.271702, 1, 0.3607843, 0, 1,
-1.572956, 0.3598334, -2.287271, 1, 0.3647059, 0, 1,
-1.565641, 0.7955546, -0.1629759, 1, 0.372549, 0, 1,
-1.555796, -0.0350452, -2.04576, 1, 0.3764706, 0, 1,
-1.551715, -0.2270897, -0.5132046, 1, 0.3843137, 0, 1,
-1.542757, 0.8789291, -0.8471703, 1, 0.3882353, 0, 1,
-1.534337, -0.7925915, -0.6580934, 1, 0.3960784, 0, 1,
-1.530613, -0.03312266, -2.172271, 1, 0.4039216, 0, 1,
-1.500278, 0.459507, 0.5772538, 1, 0.4078431, 0, 1,
-1.496374, -1.624814, -2.482876, 1, 0.4156863, 0, 1,
-1.496213, -1.001268, -3.400152, 1, 0.4196078, 0, 1,
-1.495059, -0.6915653, -3.235529, 1, 0.427451, 0, 1,
-1.492893, 0.6675258, 0.06858538, 1, 0.4313726, 0, 1,
-1.488789, -0.1816485, -1.976062, 1, 0.4392157, 0, 1,
-1.485548, -0.9600984, -1.363285, 1, 0.4431373, 0, 1,
-1.473795, -0.7277386, -0.2347589, 1, 0.4509804, 0, 1,
-1.46938, 2.058462, -2.376738, 1, 0.454902, 0, 1,
-1.457377, 1.106792, -2.649042, 1, 0.4627451, 0, 1,
-1.448293, -0.4352661, -1.789536, 1, 0.4666667, 0, 1,
-1.444373, -1.239874, -2.198325, 1, 0.4745098, 0, 1,
-1.437182, 0.9402609, -0.500734, 1, 0.4784314, 0, 1,
-1.434083, -1.268071, -1.667878, 1, 0.4862745, 0, 1,
-1.432226, 0.9346803, 0.8490864, 1, 0.4901961, 0, 1,
-1.422156, -0.2146624, -1.465953, 1, 0.4980392, 0, 1,
-1.418702, 0.7400905, -1.049108, 1, 0.5058824, 0, 1,
-1.416352, -1.952952, -3.323072, 1, 0.509804, 0, 1,
-1.396643, 1.687496, -1.759933, 1, 0.5176471, 0, 1,
-1.390435, 0.6860564, -1.325323, 1, 0.5215687, 0, 1,
-1.384896, -0.08828654, -1.59401, 1, 0.5294118, 0, 1,
-1.365704, 0.2738487, -3.103764, 1, 0.5333334, 0, 1,
-1.364883, 0.8042547, -0.6597089, 1, 0.5411765, 0, 1,
-1.350888, 2.331819, -0.3270297, 1, 0.5450981, 0, 1,
-1.340606, 0.1747235, -1.221535, 1, 0.5529412, 0, 1,
-1.338847, 1.050491, 0.6289824, 1, 0.5568628, 0, 1,
-1.338817, 0.481386, -0.6418973, 1, 0.5647059, 0, 1,
-1.334327, 0.02233266, -1.293732, 1, 0.5686275, 0, 1,
-1.333581, 0.05459102, -1.744061, 1, 0.5764706, 0, 1,
-1.321736, 1.200508, -0.6169047, 1, 0.5803922, 0, 1,
-1.31992, -2.74692, -2.33601, 1, 0.5882353, 0, 1,
-1.310332, -0.07939515, -2.832235, 1, 0.5921569, 0, 1,
-1.307308, 0.3002714, 0.7297829, 1, 0.6, 0, 1,
-1.302304, 0.6690973, 0.6369599, 1, 0.6078432, 0, 1,
-1.298291, 0.5296996, -1.635016, 1, 0.6117647, 0, 1,
-1.292616, -0.1416662, -1.601459, 1, 0.6196079, 0, 1,
-1.272095, 0.9866638, -2.8788, 1, 0.6235294, 0, 1,
-1.264497, 0.5037849, -1.953885, 1, 0.6313726, 0, 1,
-1.263136, 1.411275, -1.025164, 1, 0.6352941, 0, 1,
-1.259553, 0.9479314, -0.2189893, 1, 0.6431373, 0, 1,
-1.234766, -0.5710692, -2.401889, 1, 0.6470588, 0, 1,
-1.231722, -0.3497072, -2.440845, 1, 0.654902, 0, 1,
-1.217529, -0.1258107, -2.634885, 1, 0.6588235, 0, 1,
-1.19808, 0.2525302, -1.881469, 1, 0.6666667, 0, 1,
-1.195831, 0.3717864, -1.924819, 1, 0.6705883, 0, 1,
-1.195454, -1.421932, -1.027166, 1, 0.6784314, 0, 1,
-1.195006, -1.175543, -4.989168, 1, 0.682353, 0, 1,
-1.187277, 0.2110914, -0.5698699, 1, 0.6901961, 0, 1,
-1.174677, -0.1425568, -1.06072, 1, 0.6941177, 0, 1,
-1.173433, 0.2608957, -1.614495, 1, 0.7019608, 0, 1,
-1.162732, 0.02943601, -2.210991, 1, 0.7098039, 0, 1,
-1.156516, 0.5361869, -0.3593846, 1, 0.7137255, 0, 1,
-1.147431, 0.05705695, -3.879118, 1, 0.7215686, 0, 1,
-1.14693, -0.09386106, -1.927859, 1, 0.7254902, 0, 1,
-1.140264, 0.8002418, -1.002304, 1, 0.7333333, 0, 1,
-1.14019, -0.8026372, -2.455565, 1, 0.7372549, 0, 1,
-1.137584, -2.692057, -2.538907, 1, 0.7450981, 0, 1,
-1.133431, 0.6115604, -1.227216, 1, 0.7490196, 0, 1,
-1.133429, 0.2455267, -1.975536, 1, 0.7568628, 0, 1,
-1.130463, 0.167005, -0.3560173, 1, 0.7607843, 0, 1,
-1.121537, 1.841701, 0.129567, 1, 0.7686275, 0, 1,
-1.120828, -1.224144, -2.751739, 1, 0.772549, 0, 1,
-1.111705, 0.0950372, -2.394058, 1, 0.7803922, 0, 1,
-1.111089, -0.27657, -3.005349, 1, 0.7843137, 0, 1,
-1.098785, 0.7808126, 0.7146717, 1, 0.7921569, 0, 1,
-1.095712, -0.2424887, -1.653381, 1, 0.7960784, 0, 1,
-1.091697, 0.8751646, -1.455752, 1, 0.8039216, 0, 1,
-1.091, -0.4275201, -0.686803, 1, 0.8117647, 0, 1,
-1.07395, -0.703208, -0.9993656, 1, 0.8156863, 0, 1,
-1.072357, 0.5903739, -2.314955, 1, 0.8235294, 0, 1,
-1.066206, -0.1559147, -2.075095, 1, 0.827451, 0, 1,
-1.065889, -0.3343348, -1.193996, 1, 0.8352941, 0, 1,
-1.061661, -0.5198812, -2.902336, 1, 0.8392157, 0, 1,
-1.060962, 0.8002074, -0.8375828, 1, 0.8470588, 0, 1,
-1.060115, 0.6050804, -0.2575155, 1, 0.8509804, 0, 1,
-1.059996, -1.048854, -3.727746, 1, 0.8588235, 0, 1,
-1.043173, 1.07606, 0.2584776, 1, 0.8627451, 0, 1,
-1.035368, -0.438637, -1.762299, 1, 0.8705882, 0, 1,
-1.032149, 0.9278293, -1.486439, 1, 0.8745098, 0, 1,
-1.029082, -0.3021985, -3.864771, 1, 0.8823529, 0, 1,
-1.021909, 0.408648, -0.9909269, 1, 0.8862745, 0, 1,
-1.015672, -1.53461, -3.354118, 1, 0.8941177, 0, 1,
-1.013657, -0.4261668, -1.74045, 1, 0.8980392, 0, 1,
-1.011821, -0.590501, -2.859642, 1, 0.9058824, 0, 1,
-1.01031, -1.630178, -2.2446, 1, 0.9137255, 0, 1,
-1.007784, -0.798904, -0.543314, 1, 0.9176471, 0, 1,
-1.006993, -0.6755497, -1.28018, 1, 0.9254902, 0, 1,
-1.001538, -1.450826, -3.501372, 1, 0.9294118, 0, 1,
-1.000879, 0.6173614, -0.2241854, 1, 0.9372549, 0, 1,
-0.9984244, -1.113524, -1.305178, 1, 0.9411765, 0, 1,
-0.9938099, 0.6953329, -1.43755, 1, 0.9490196, 0, 1,
-0.9914318, -0.2210534, -1.432434, 1, 0.9529412, 0, 1,
-0.9910895, -0.8931538, -1.007351, 1, 0.9607843, 0, 1,
-0.9890326, 0.5005848, -1.867319, 1, 0.9647059, 0, 1,
-0.984476, -2.449504, -0.8385085, 1, 0.972549, 0, 1,
-0.9798951, -1.190556, -0.7185689, 1, 0.9764706, 0, 1,
-0.9780968, 0.01861347, -3.341166, 1, 0.9843137, 0, 1,
-0.9701248, -0.6749384, -1.934178, 1, 0.9882353, 0, 1,
-0.9624612, -1.50032, -1.447174, 1, 0.9960784, 0, 1,
-0.9600563, -0.1947909, -2.219205, 0.9960784, 1, 0, 1,
-0.9545496, -1.233912, -1.296028, 0.9921569, 1, 0, 1,
-0.9536955, 0.9002368, -0.020978, 0.9843137, 1, 0, 1,
-0.9485026, -0.8853288, -1.726918, 0.9803922, 1, 0, 1,
-0.9462454, -1.023796, -1.425761, 0.972549, 1, 0, 1,
-0.9396508, 0.2177614, -0.9509913, 0.9686275, 1, 0, 1,
-0.916854, -1.257162, -1.269179, 0.9607843, 1, 0, 1,
-0.9126446, 1.581196, 0.0220766, 0.9568627, 1, 0, 1,
-0.9106778, 0.9354169, -2.286066, 0.9490196, 1, 0, 1,
-0.9063079, -0.2448819, -1.27394, 0.945098, 1, 0, 1,
-0.8960344, 0.5781606, -2.722314, 0.9372549, 1, 0, 1,
-0.8947276, -1.806679, -4.293104, 0.9333333, 1, 0, 1,
-0.8913994, 0.5233954, 0.5981922, 0.9254902, 1, 0, 1,
-0.8828367, -1.610447, -3.031656, 0.9215686, 1, 0, 1,
-0.8817065, -0.3598776, -2.613325, 0.9137255, 1, 0, 1,
-0.8772209, 0.5880107, 0.4922435, 0.9098039, 1, 0, 1,
-0.8763092, 0.01121816, -1.323257, 0.9019608, 1, 0, 1,
-0.8749287, 0.4824505, -0.1492879, 0.8941177, 1, 0, 1,
-0.8660185, -1.635967, -2.96175, 0.8901961, 1, 0, 1,
-0.8610364, 0.4631284, -0.5198123, 0.8823529, 1, 0, 1,
-0.8587083, -1.23554, -2.429836, 0.8784314, 1, 0, 1,
-0.8574959, 0.6008352, 0.6714962, 0.8705882, 1, 0, 1,
-0.8408302, 1.217373, -2.383447, 0.8666667, 1, 0, 1,
-0.8332158, -0.7995118, -1.738852, 0.8588235, 1, 0, 1,
-0.8318067, -0.2969163, -0.4470164, 0.854902, 1, 0, 1,
-0.8298651, 1.51828, -0.1245099, 0.8470588, 1, 0, 1,
-0.8285165, -0.6928568, -3.454138, 0.8431373, 1, 0, 1,
-0.8279403, -0.7776868, -1.21468, 0.8352941, 1, 0, 1,
-0.8277586, 0.5149388, -1.180041, 0.8313726, 1, 0, 1,
-0.8242439, 0.7102169, -1.011061, 0.8235294, 1, 0, 1,
-0.8233978, 1.223852, 0.008216105, 0.8196079, 1, 0, 1,
-0.8227614, 0.1071752, -2.049066, 0.8117647, 1, 0, 1,
-0.8181452, -1.184394, -3.07267, 0.8078431, 1, 0, 1,
-0.8158142, -1.310634, -1.990014, 0.8, 1, 0, 1,
-0.8150196, 0.4885158, -2.708353, 0.7921569, 1, 0, 1,
-0.8106394, -0.7938846, -2.11507, 0.7882353, 1, 0, 1,
-0.8077057, -0.1354718, -0.2562329, 0.7803922, 1, 0, 1,
-0.8045197, -0.2217056, -2.516198, 0.7764706, 1, 0, 1,
-0.8038275, 1.940969, -0.5342556, 0.7686275, 1, 0, 1,
-0.7958041, 1.044519, 0.05067079, 0.7647059, 1, 0, 1,
-0.7944221, -1.782256, -1.903952, 0.7568628, 1, 0, 1,
-0.7843847, -1.436737, -2.542573, 0.7529412, 1, 0, 1,
-0.7681747, 1.120999, 0.06943414, 0.7450981, 1, 0, 1,
-0.7666813, -1.536214, -2.153085, 0.7411765, 1, 0, 1,
-0.7654716, -0.7685231, -1.370574, 0.7333333, 1, 0, 1,
-0.760348, 0.6494591, 0.4266319, 0.7294118, 1, 0, 1,
-0.7565281, 0.05904634, -2.362474, 0.7215686, 1, 0, 1,
-0.7535155, 1.624782, -2.128145, 0.7176471, 1, 0, 1,
-0.7476373, -1.342117, -3.037956, 0.7098039, 1, 0, 1,
-0.7475875, -1.553828, -1.15532, 0.7058824, 1, 0, 1,
-0.7427114, -1.375341, -1.360171, 0.6980392, 1, 0, 1,
-0.7375928, -0.3475741, -3.10167, 0.6901961, 1, 0, 1,
-0.7336195, -1.390119, -0.6999699, 0.6862745, 1, 0, 1,
-0.731294, 0.960961, 0.1113981, 0.6784314, 1, 0, 1,
-0.7288042, 1.459106, -1.879758, 0.6745098, 1, 0, 1,
-0.7287803, 0.591652, -2.090004, 0.6666667, 1, 0, 1,
-0.7237429, 0.5006404, -1.146519, 0.6627451, 1, 0, 1,
-0.7231706, 0.6641591, -3.147254, 0.654902, 1, 0, 1,
-0.7194629, 0.6649358, -1.266153, 0.6509804, 1, 0, 1,
-0.7154245, 0.4203651, -2.442328, 0.6431373, 1, 0, 1,
-0.7153124, 0.7702276, 0.6544403, 0.6392157, 1, 0, 1,
-0.7145351, -0.2666064, -1.051476, 0.6313726, 1, 0, 1,
-0.7127572, -1.092348, -0.8369663, 0.627451, 1, 0, 1,
-0.7025488, 0.001913137, -1.165216, 0.6196079, 1, 0, 1,
-0.700455, 1.742262, -0.3608431, 0.6156863, 1, 0, 1,
-0.6939165, -1.322665, -2.007991, 0.6078432, 1, 0, 1,
-0.6875971, -1.357839, -3.346343, 0.6039216, 1, 0, 1,
-0.6801496, 0.2925579, -0.1125543, 0.5960785, 1, 0, 1,
-0.6743631, -0.5028262, -2.746605, 0.5882353, 1, 0, 1,
-0.6705049, -1.766594, -2.873006, 0.5843138, 1, 0, 1,
-0.662082, 1.457188, 0.08177418, 0.5764706, 1, 0, 1,
-0.6620461, 0.2373382, -1.310097, 0.572549, 1, 0, 1,
-0.6456523, -0.3004368, -3.272937, 0.5647059, 1, 0, 1,
-0.6427864, 1.903532, -2.878081, 0.5607843, 1, 0, 1,
-0.6398351, -1.274318, -1.787197, 0.5529412, 1, 0, 1,
-0.6382082, 1.631986, -0.3886924, 0.5490196, 1, 0, 1,
-0.636142, -2.239136, -3.17825, 0.5411765, 1, 0, 1,
-0.6337246, -1.244916, -3.154085, 0.5372549, 1, 0, 1,
-0.6330771, -2.659009, -3.686218, 0.5294118, 1, 0, 1,
-0.6329729, -0.4969273, -1.285849, 0.5254902, 1, 0, 1,
-0.6271152, -0.1984111, -3.518406, 0.5176471, 1, 0, 1,
-0.6179293, -0.3569958, -2.055613, 0.5137255, 1, 0, 1,
-0.6168171, 0.597024, -0.3511151, 0.5058824, 1, 0, 1,
-0.6083065, 1.229407, -0.1620474, 0.5019608, 1, 0, 1,
-0.6067086, -0.314723, -3.20083, 0.4941176, 1, 0, 1,
-0.5904658, 0.1235281, -1.630968, 0.4862745, 1, 0, 1,
-0.5875371, -0.06142552, -2.056006, 0.4823529, 1, 0, 1,
-0.5838589, 0.7149356, -1.586195, 0.4745098, 1, 0, 1,
-0.5819589, 1.149457, -0.655918, 0.4705882, 1, 0, 1,
-0.5793211, 0.1912858, -0.3196703, 0.4627451, 1, 0, 1,
-0.5755537, 0.003211252, -0.5337308, 0.4588235, 1, 0, 1,
-0.5742969, 0.01459656, -1.655529, 0.4509804, 1, 0, 1,
-0.5731907, -0.2700424, -2.833669, 0.4470588, 1, 0, 1,
-0.5712649, 0.726061, -1.130532, 0.4392157, 1, 0, 1,
-0.5630574, -0.1842641, -1.697943, 0.4352941, 1, 0, 1,
-0.5579861, 0.7417451, -1.323598, 0.427451, 1, 0, 1,
-0.548939, -0.3649295, -0.5841398, 0.4235294, 1, 0, 1,
-0.5480228, 0.1043648, -2.646101, 0.4156863, 1, 0, 1,
-0.5457522, -0.1859771, -0.8395257, 0.4117647, 1, 0, 1,
-0.5417001, 1.955112, 0.4037101, 0.4039216, 1, 0, 1,
-0.5414404, -0.7058843, -1.813371, 0.3960784, 1, 0, 1,
-0.532451, -0.9165787, -4.132401, 0.3921569, 1, 0, 1,
-0.5318882, 0.1557859, 0.7659736, 0.3843137, 1, 0, 1,
-0.5291911, -0.1386143, -0.6823542, 0.3803922, 1, 0, 1,
-0.5283927, -1.093691, -2.263159, 0.372549, 1, 0, 1,
-0.5278369, -1.241672, -3.141377, 0.3686275, 1, 0, 1,
-0.5270613, 0.4379277, -0.7290843, 0.3607843, 1, 0, 1,
-0.5248356, 0.6227441, -0.2367948, 0.3568628, 1, 0, 1,
-0.5240903, 0.2026094, -0.7859852, 0.3490196, 1, 0, 1,
-0.5232104, -0.2638646, -2.391573, 0.345098, 1, 0, 1,
-0.5230349, 0.4615451, 1.733982, 0.3372549, 1, 0, 1,
-0.5215236, -1.809953, -3.20727, 0.3333333, 1, 0, 1,
-0.5179907, -0.7829216, -3.857516, 0.3254902, 1, 0, 1,
-0.5178075, -0.574318, -2.465656, 0.3215686, 1, 0, 1,
-0.517425, -1.878021, -4.161638, 0.3137255, 1, 0, 1,
-0.5157992, 1.902184, -0.1425844, 0.3098039, 1, 0, 1,
-0.5121565, 0.8451011, 0.3866186, 0.3019608, 1, 0, 1,
-0.5080881, 1.441132, -0.08670012, 0.2941177, 1, 0, 1,
-0.5079939, -0.02396964, -1.115677, 0.2901961, 1, 0, 1,
-0.5065142, -1.052671, -3.42716, 0.282353, 1, 0, 1,
-0.5036438, 0.0243702, -0.6403763, 0.2784314, 1, 0, 1,
-0.4984851, -1.117012, -3.502296, 0.2705882, 1, 0, 1,
-0.4976682, 1.953451, -0.3459288, 0.2666667, 1, 0, 1,
-0.4935658, 0.1315221, -1.773545, 0.2588235, 1, 0, 1,
-0.4933764, 1.343909, 0.1934941, 0.254902, 1, 0, 1,
-0.4884234, 0.9103298, 0.5542755, 0.2470588, 1, 0, 1,
-0.4865112, 0.6732857, -0.0006812402, 0.2431373, 1, 0, 1,
-0.4726613, 0.6294107, 0.2389641, 0.2352941, 1, 0, 1,
-0.4724437, 0.09395752, -2.108565, 0.2313726, 1, 0, 1,
-0.4719774, 0.3171466, -1.665496, 0.2235294, 1, 0, 1,
-0.4672469, -0.771408, -4.072397, 0.2196078, 1, 0, 1,
-0.4616428, -0.499474, -3.651176, 0.2117647, 1, 0, 1,
-0.4616076, -1.333517, -1.740616, 0.2078431, 1, 0, 1,
-0.4615284, 0.2065135, -0.8190401, 0.2, 1, 0, 1,
-0.4602983, 0.7011762, -1.428946, 0.1921569, 1, 0, 1,
-0.4484718, -0.2730726, -1.003909, 0.1882353, 1, 0, 1,
-0.4410696, -0.392483, -1.569905, 0.1803922, 1, 0, 1,
-0.4388144, -1.116849, -2.85242, 0.1764706, 1, 0, 1,
-0.4349376, -0.6918631, -1.660188, 0.1686275, 1, 0, 1,
-0.4322441, -0.5834386, -0.9752479, 0.1647059, 1, 0, 1,
-0.4315965, -0.1260536, -3.320706, 0.1568628, 1, 0, 1,
-0.4259529, 0.2714926, -0.9006628, 0.1529412, 1, 0, 1,
-0.4255735, 0.4723641, -0.3847752, 0.145098, 1, 0, 1,
-0.4250629, -0.815845, -3.512047, 0.1411765, 1, 0, 1,
-0.4232716, 0.5817742, -0.7924245, 0.1333333, 1, 0, 1,
-0.419246, -0.3589034, -1.312782, 0.1294118, 1, 0, 1,
-0.4138579, 1.294107, 0.006965994, 0.1215686, 1, 0, 1,
-0.4117744, -0.8886752, -3.743869, 0.1176471, 1, 0, 1,
-0.409529, -1.062512, -2.05293, 0.1098039, 1, 0, 1,
-0.4060468, 1.12106, 0.5195246, 0.1058824, 1, 0, 1,
-0.4043039, -2.323591, -2.982466, 0.09803922, 1, 0, 1,
-0.4028258, -0.4963181, -1.129393, 0.09019608, 1, 0, 1,
-0.4003418, 2.444941, -2.346166, 0.08627451, 1, 0, 1,
-0.399357, 0.7040843, -1.898968, 0.07843138, 1, 0, 1,
-0.398127, -0.1143518, -2.429286, 0.07450981, 1, 0, 1,
-0.3950155, -0.3286012, -1.812003, 0.06666667, 1, 0, 1,
-0.3947538, -0.6239913, -3.685551, 0.0627451, 1, 0, 1,
-0.3939283, -0.5890787, -1.485303, 0.05490196, 1, 0, 1,
-0.39319, 0.967258, 0.2683688, 0.05098039, 1, 0, 1,
-0.3915338, 1.297085, 0.202335, 0.04313726, 1, 0, 1,
-0.3840053, 0.199121, -1.016692, 0.03921569, 1, 0, 1,
-0.3825439, 0.1913596, -2.613512, 0.03137255, 1, 0, 1,
-0.3765582, -0.5644135, -4.630812, 0.02745098, 1, 0, 1,
-0.3749363, -1.302786, -2.47788, 0.01960784, 1, 0, 1,
-0.3749045, -1.185501, -1.699991, 0.01568628, 1, 0, 1,
-0.3691901, -1.014724, -3.080606, 0.007843138, 1, 0, 1,
-0.3667027, -0.9071287, -1.179176, 0.003921569, 1, 0, 1,
-0.3596275, 2.490106, -2.056159, 0, 1, 0.003921569, 1,
-0.3522691, 1.372634, -0.06808868, 0, 1, 0.01176471, 1,
-0.3412529, 1.319883, -1.773265, 0, 1, 0.01568628, 1,
-0.3412009, 1.113916, -0.7834625, 0, 1, 0.02352941, 1,
-0.3398832, 0.05909913, -2.293954, 0, 1, 0.02745098, 1,
-0.328153, 0.642373, 0.2443077, 0, 1, 0.03529412, 1,
-0.3242931, 0.7637318, 0.8061859, 0, 1, 0.03921569, 1,
-0.3234705, -2.418165, -2.612888, 0, 1, 0.04705882, 1,
-0.3200181, -0.04416319, -2.483212, 0, 1, 0.05098039, 1,
-0.3187396, -1.427616, -2.250174, 0, 1, 0.05882353, 1,
-0.3147554, -1.357881, -3.734336, 0, 1, 0.0627451, 1,
-0.3122302, -0.5345265, -3.319279, 0, 1, 0.07058824, 1,
-0.3103488, 1.15143, -0.0258395, 0, 1, 0.07450981, 1,
-0.3083903, -0.6461982, -3.566895, 0, 1, 0.08235294, 1,
-0.3029923, 0.9419814, -0.4407154, 0, 1, 0.08627451, 1,
-0.3000462, -1.156841, -3.814883, 0, 1, 0.09411765, 1,
-0.2984965, -0.1862146, -0.7690904, 0, 1, 0.1019608, 1,
-0.2962104, 0.2921414, -1.491907, 0, 1, 0.1058824, 1,
-0.294511, 0.4135017, -1.604379, 0, 1, 0.1137255, 1,
-0.2910784, -0.4527316, -2.277965, 0, 1, 0.1176471, 1,
-0.2885905, 0.6391956, -0.015809, 0, 1, 0.1254902, 1,
-0.2759395, 1.646043, -1.764421, 0, 1, 0.1294118, 1,
-0.2741751, -2.613564, -2.82798, 0, 1, 0.1372549, 1,
-0.2737961, -0.5654733, -0.3879983, 0, 1, 0.1411765, 1,
-0.2711841, -0.6450309, -3.175769, 0, 1, 0.1490196, 1,
-0.2701471, -0.8389174, -1.854542, 0, 1, 0.1529412, 1,
-0.2700861, 1.414828, -0.009812876, 0, 1, 0.1607843, 1,
-0.2693166, 0.965572, 0.07096128, 0, 1, 0.1647059, 1,
-0.2685991, 0.8453041, 0.5650847, 0, 1, 0.172549, 1,
-0.2669424, -0.2538533, -1.151962, 0, 1, 0.1764706, 1,
-0.2662396, -1.155911, -3.334625, 0, 1, 0.1843137, 1,
-0.265914, 0.7906337, -1.322622, 0, 1, 0.1882353, 1,
-0.2610877, 0.2311247, -1.022654, 0, 1, 0.1960784, 1,
-0.2564368, -0.01955711, -3.35054, 0, 1, 0.2039216, 1,
-0.2551386, -1.030184, -3.415619, 0, 1, 0.2078431, 1,
-0.2538474, -0.3032793, -2.200135, 0, 1, 0.2156863, 1,
-0.2463427, -1.182775, -4.609021, 0, 1, 0.2196078, 1,
-0.2449344, -0.5924393, -2.642736, 0, 1, 0.227451, 1,
-0.2447556, -0.9819926, -4.02923, 0, 1, 0.2313726, 1,
-0.2384077, -0.7814075, -3.793127, 0, 1, 0.2392157, 1,
-0.2356734, 1.183091, 0.5645667, 0, 1, 0.2431373, 1,
-0.2352659, -0.3110753, -3.567636, 0, 1, 0.2509804, 1,
-0.234138, -1.498412, -3.106892, 0, 1, 0.254902, 1,
-0.2250968, 0.1389156, -0.6644327, 0, 1, 0.2627451, 1,
-0.2240757, -0.4511061, -3.529027, 0, 1, 0.2666667, 1,
-0.2225564, -0.4046654, -2.995493, 0, 1, 0.2745098, 1,
-0.2193989, 0.2761158, -0.03417136, 0, 1, 0.2784314, 1,
-0.2168468, 0.04662249, -2.743784, 0, 1, 0.2862745, 1,
-0.2155441, -1.266896, -2.58898, 0, 1, 0.2901961, 1,
-0.21554, 0.5387936, 0.7166492, 0, 1, 0.2980392, 1,
-0.2027928, -0.6083179, -5.024489, 0, 1, 0.3058824, 1,
-0.199793, -0.9988561, -3.050971, 0, 1, 0.3098039, 1,
-0.1991906, -1.57088, -1.225638, 0, 1, 0.3176471, 1,
-0.1989364, 0.1505859, -2.003665, 0, 1, 0.3215686, 1,
-0.1983736, -1.142409, -3.624694, 0, 1, 0.3294118, 1,
-0.1920106, -0.5375467, -4.139436, 0, 1, 0.3333333, 1,
-0.1905724, -0.9187303, -3.371348, 0, 1, 0.3411765, 1,
-0.1880776, 0.663262, 0.4314539, 0, 1, 0.345098, 1,
-0.1859834, -1.901556, -2.475232, 0, 1, 0.3529412, 1,
-0.1858588, 0.04934035, -1.341829, 0, 1, 0.3568628, 1,
-0.1839364, 0.2698946, 0.4589426, 0, 1, 0.3647059, 1,
-0.1829534, -0.08412746, -2.203285, 0, 1, 0.3686275, 1,
-0.1817691, 1.208768, -0.4267776, 0, 1, 0.3764706, 1,
-0.178661, 0.9481387, -1.616656, 0, 1, 0.3803922, 1,
-0.1785574, 0.1573121, -2.274169, 0, 1, 0.3882353, 1,
-0.177052, -0.6167145, -2.145449, 0, 1, 0.3921569, 1,
-0.1765504, 0.6976217, 0.7469125, 0, 1, 0.4, 1,
-0.1717149, 0.8466504, -0.1176534, 0, 1, 0.4078431, 1,
-0.1701902, -0.2709422, -2.411524, 0, 1, 0.4117647, 1,
-0.1663966, -1.698478, -2.139538, 0, 1, 0.4196078, 1,
-0.1658152, 1.048785, 1.005261, 0, 1, 0.4235294, 1,
-0.1654575, -1.34952, -4.080347, 0, 1, 0.4313726, 1,
-0.1603764, 1.273452, -0.4774418, 0, 1, 0.4352941, 1,
-0.1584383, 0.3177946, 0.04091361, 0, 1, 0.4431373, 1,
-0.1580677, 2.112422, 0.3094891, 0, 1, 0.4470588, 1,
-0.1551453, 0.8995334, -0.5635357, 0, 1, 0.454902, 1,
-0.152239, 1.271543, 0.3497132, 0, 1, 0.4588235, 1,
-0.1482559, 1.052888, -2.71219, 0, 1, 0.4666667, 1,
-0.1463, -0.2885737, -3.904422, 0, 1, 0.4705882, 1,
-0.1423312, -0.5750926, -3.618719, 0, 1, 0.4784314, 1,
-0.1395719, -1.054264, -2.917346, 0, 1, 0.4823529, 1,
-0.13349, 0.0952756, -1.801094, 0, 1, 0.4901961, 1,
-0.1332432, 0.9119766, -1.702207, 0, 1, 0.4941176, 1,
-0.1328237, 0.4647181, -0.1421621, 0, 1, 0.5019608, 1,
-0.1320666, 0.9370975, 0.1810663, 0, 1, 0.509804, 1,
-0.1299772, -0.9828501, -3.368406, 0, 1, 0.5137255, 1,
-0.1266795, 0.5930642, 0.1239936, 0, 1, 0.5215687, 1,
-0.1256623, 2.633682, -1.023729, 0, 1, 0.5254902, 1,
-0.1248975, 0.3669193, -0.3820061, 0, 1, 0.5333334, 1,
-0.1238648, 0.3155646, -0.2441465, 0, 1, 0.5372549, 1,
-0.1207136, 1.426764, 0.9933335, 0, 1, 0.5450981, 1,
-0.1179155, -0.4339179, -3.238397, 0, 1, 0.5490196, 1,
-0.1155422, 0.7650949, 0.7670696, 0, 1, 0.5568628, 1,
-0.1149175, -0.8739944, -5.336797, 0, 1, 0.5607843, 1,
-0.1123461, -1.091281, -3.856217, 0, 1, 0.5686275, 1,
-0.1082984, 0.1612768, -0.4317942, 0, 1, 0.572549, 1,
-0.1071649, -0.01057769, 0.3665139, 0, 1, 0.5803922, 1,
-0.1067778, -0.2220219, -3.595148, 0, 1, 0.5843138, 1,
-0.1060865, -0.4823799, -2.267462, 0, 1, 0.5921569, 1,
-0.1011935, -1.428491, -5.050345, 0, 1, 0.5960785, 1,
-0.1001947, 1.146833, 0.6507453, 0, 1, 0.6039216, 1,
-0.0986075, -0.656984, -2.495732, 0, 1, 0.6117647, 1,
-0.09777053, -0.4336697, -4.21598, 0, 1, 0.6156863, 1,
-0.09776963, -0.01950388, -1.078434, 0, 1, 0.6235294, 1,
-0.09703591, 0.8605163, -1.068204, 0, 1, 0.627451, 1,
-0.09696173, 0.543326, -1.269655, 0, 1, 0.6352941, 1,
-0.09514488, -0.9452869, -2.800382, 0, 1, 0.6392157, 1,
-0.08720843, -0.7722849, -3.076351, 0, 1, 0.6470588, 1,
-0.08619878, -0.5794538, -4.590965, 0, 1, 0.6509804, 1,
-0.08504738, 0.6810471, -1.105778, 0, 1, 0.6588235, 1,
-0.08381113, 0.9598387, -1.336332, 0, 1, 0.6627451, 1,
-0.08000131, 0.9413626, -0.2646497, 0, 1, 0.6705883, 1,
-0.07591955, 1.408254, -0.9855729, 0, 1, 0.6745098, 1,
-0.07555, -2.031329, -1.879802, 0, 1, 0.682353, 1,
-0.0721269, -0.7033178, -2.022581, 0, 1, 0.6862745, 1,
-0.07121913, -0.3601593, -1.709748, 0, 1, 0.6941177, 1,
-0.06880372, 0.9020648, 0.04850363, 0, 1, 0.7019608, 1,
-0.06719378, 0.3894389, -1.082959, 0, 1, 0.7058824, 1,
-0.0671496, 0.7890394, 0.6979548, 0, 1, 0.7137255, 1,
-0.06671934, 0.1802827, 2.240943, 0, 1, 0.7176471, 1,
-0.06645045, -0.3094478, -3.390296, 0, 1, 0.7254902, 1,
-0.06277782, -0.5695779, -3.073388, 0, 1, 0.7294118, 1,
-0.05937659, 0.2827658, -0.4961427, 0, 1, 0.7372549, 1,
-0.05766191, 0.6303085, -1.483547, 0, 1, 0.7411765, 1,
-0.05118727, -1.323354, -4.249793, 0, 1, 0.7490196, 1,
-0.04707991, 0.9689504, 0.2877038, 0, 1, 0.7529412, 1,
-0.04340138, -0.7924287, -3.077608, 0, 1, 0.7607843, 1,
-0.04255255, -0.3355834, -1.775487, 0, 1, 0.7647059, 1,
-0.03896624, -1.296759, -3.988686, 0, 1, 0.772549, 1,
-0.03797254, -0.3443358, -2.317382, 0, 1, 0.7764706, 1,
-0.03739844, 1.417405, -0.02675146, 0, 1, 0.7843137, 1,
-0.03125574, 0.01374473, -0.435796, 0, 1, 0.7882353, 1,
-0.0285044, 0.8896021, 0.9262288, 0, 1, 0.7960784, 1,
-0.02756352, -0.478444, -3.051074, 0, 1, 0.8039216, 1,
-0.0261677, -0.1191118, -2.357723, 0, 1, 0.8078431, 1,
-0.02204186, -0.5576922, -3.087083, 0, 1, 0.8156863, 1,
-0.02093192, -0.1774824, -3.204661, 0, 1, 0.8196079, 1,
-0.02022556, 0.1049197, -0.3574282, 0, 1, 0.827451, 1,
-0.01774801, -0.1908239, -2.677017, 0, 1, 0.8313726, 1,
-0.01615611, -0.9859699, -4.387534, 0, 1, 0.8392157, 1,
-0.01352173, -1.725415, -2.00877, 0, 1, 0.8431373, 1,
-0.008616708, -0.2738432, -4.83442, 0, 1, 0.8509804, 1,
-0.0059797, 2.099069, 0.08477972, 0, 1, 0.854902, 1,
-0.005716168, 0.1567616, 0.6809068, 0, 1, 0.8627451, 1,
-0.003827951, 0.2770036, 1.500615, 0, 1, 0.8666667, 1,
-0.003747635, 0.9749209, 1.539249, 0, 1, 0.8745098, 1,
0.002502863, -0.6766679, 2.79371, 0, 1, 0.8784314, 1,
0.003418233, 1.287315, 0.3518319, 0, 1, 0.8862745, 1,
0.007818748, -0.644069, 2.24837, 0, 1, 0.8901961, 1,
0.008027446, -1.433992, 3.970611, 0, 1, 0.8980392, 1,
0.0101128, -1.287605, 3.892897, 0, 1, 0.9058824, 1,
0.01430312, 0.2917791, -0.7255844, 0, 1, 0.9098039, 1,
0.02021539, -0.03133191, 2.486851, 0, 1, 0.9176471, 1,
0.0248724, 0.5476437, 1.451047, 0, 1, 0.9215686, 1,
0.02743524, 0.5652345, 1.242025, 0, 1, 0.9294118, 1,
0.02987302, 1.27308, -0.6398219, 0, 1, 0.9333333, 1,
0.03152809, 0.9406139, 0.3464535, 0, 1, 0.9411765, 1,
0.0315516, -1.07031, 1.488664, 0, 1, 0.945098, 1,
0.03274803, -0.2656532, 3.970436, 0, 1, 0.9529412, 1,
0.03654089, 1.14096, 0.2714594, 0, 1, 0.9568627, 1,
0.037068, -1.122487, 2.174664, 0, 1, 0.9647059, 1,
0.03853747, -0.430278, 2.874463, 0, 1, 0.9686275, 1,
0.04018374, 1.447722, 0.5769347, 0, 1, 0.9764706, 1,
0.04315931, -0.2018062, 3.739614, 0, 1, 0.9803922, 1,
0.04528525, 0.8076977, -1.140889, 0, 1, 0.9882353, 1,
0.046765, 0.04982539, -0.8142787, 0, 1, 0.9921569, 1,
0.05252831, 0.8986839, 0.1035131, 0, 1, 1, 1,
0.05283981, -0.0535822, 1.038721, 0, 0.9921569, 1, 1,
0.05486206, -0.4811334, 2.549029, 0, 0.9882353, 1, 1,
0.05535, -1.274886, 3.878664, 0, 0.9803922, 1, 1,
0.05616729, 1.341804, 2.021181, 0, 0.9764706, 1, 1,
0.05632837, -0.110363, 2.39927, 0, 0.9686275, 1, 1,
0.05799751, -1.461046, 4.968017, 0, 0.9647059, 1, 1,
0.06052312, -1.273974, 4.038824, 0, 0.9568627, 1, 1,
0.0621662, -0.2900637, 3.320157, 0, 0.9529412, 1, 1,
0.06674827, 0.3122238, 1.333918, 0, 0.945098, 1, 1,
0.06816182, 2.325921, -0.3226863, 0, 0.9411765, 1, 1,
0.06963026, 1.492808, -0.7131037, 0, 0.9333333, 1, 1,
0.07181121, -0.5615575, 3.713872, 0, 0.9294118, 1, 1,
0.07296579, 0.8670147, 1.299823, 0, 0.9215686, 1, 1,
0.07528718, 0.6485648, 0.2247177, 0, 0.9176471, 1, 1,
0.07893848, -1.782441, 3.437362, 0, 0.9098039, 1, 1,
0.08024555, -1.056996, 2.258332, 0, 0.9058824, 1, 1,
0.08180816, 0.4813806, 0.2680856, 0, 0.8980392, 1, 1,
0.08634007, -0.1057688, 4.688031, 0, 0.8901961, 1, 1,
0.09064852, 0.1477608, 0.6892033, 0, 0.8862745, 1, 1,
0.09092855, -0.4553899, 1.762212, 0, 0.8784314, 1, 1,
0.09137427, 0.4323498, -1.432438, 0, 0.8745098, 1, 1,
0.09157258, -0.3348434, 1.576827, 0, 0.8666667, 1, 1,
0.09170317, 0.2581747, 1.482523, 0, 0.8627451, 1, 1,
0.09262547, -0.00126836, 2.122707, 0, 0.854902, 1, 1,
0.09861271, 2.176882, -0.2875675, 0, 0.8509804, 1, 1,
0.1018448, 1.206109, -0.1033636, 0, 0.8431373, 1, 1,
0.1082961, 0.1694069, 0.1541941, 0, 0.8392157, 1, 1,
0.1136597, 0.3350924, -0.1047722, 0, 0.8313726, 1, 1,
0.1160291, -0.5202599, 3.267435, 0, 0.827451, 1, 1,
0.1172078, -1.409709, 3.455792, 0, 0.8196079, 1, 1,
0.1180074, 0.5154535, 1.03703, 0, 0.8156863, 1, 1,
0.1236303, 0.3656217, 1.166735, 0, 0.8078431, 1, 1,
0.1249006, -0.4149824, 4.29723, 0, 0.8039216, 1, 1,
0.1257272, 0.2255132, -0.2599625, 0, 0.7960784, 1, 1,
0.1275309, 0.7815802, 0.4856369, 0, 0.7882353, 1, 1,
0.1294572, 0.2291717, -0.3174922, 0, 0.7843137, 1, 1,
0.1297496, 0.6022019, 0.7248449, 0, 0.7764706, 1, 1,
0.129907, -0.9475805, 3.015876, 0, 0.772549, 1, 1,
0.1337595, -0.5841284, 1.598507, 0, 0.7647059, 1, 1,
0.1349986, -0.2703691, 2.98271, 0, 0.7607843, 1, 1,
0.1442738, 0.8700876, 2.617598, 0, 0.7529412, 1, 1,
0.1445674, 0.2490848, 0.490527, 0, 0.7490196, 1, 1,
0.1457529, 1.483786, 0.3603555, 0, 0.7411765, 1, 1,
0.1482535, 0.1518885, 2.173831, 0, 0.7372549, 1, 1,
0.1492712, -0.9339124, 4.225996, 0, 0.7294118, 1, 1,
0.1494234, 0.107971, 1.790001, 0, 0.7254902, 1, 1,
0.1494468, 0.2116991, 2.219406, 0, 0.7176471, 1, 1,
0.1520504, 0.2025364, 0.5498941, 0, 0.7137255, 1, 1,
0.1523331, -0.6417111, 4.921311, 0, 0.7058824, 1, 1,
0.1540145, 1.511625, 0.2040164, 0, 0.6980392, 1, 1,
0.1569153, -0.7864593, 2.210855, 0, 0.6941177, 1, 1,
0.1578952, 1.570607, 1.645114, 0, 0.6862745, 1, 1,
0.1619197, -1.914516, 2.482273, 0, 0.682353, 1, 1,
0.1627403, 0.1637857, 1.753261, 0, 0.6745098, 1, 1,
0.1664584, 0.2720284, -0.5068195, 0, 0.6705883, 1, 1,
0.1665819, -0.2316406, 2.532765, 0, 0.6627451, 1, 1,
0.1674892, 1.35577, -0.9772458, 0, 0.6588235, 1, 1,
0.1779282, -0.7373133, 3.402694, 0, 0.6509804, 1, 1,
0.1808237, -0.8137271, 1.396106, 0, 0.6470588, 1, 1,
0.1856809, 0.5576355, -0.2972797, 0, 0.6392157, 1, 1,
0.1865324, 0.6021789, 0.08866719, 0, 0.6352941, 1, 1,
0.1887167, -2.294383, 1.129741, 0, 0.627451, 1, 1,
0.1934571, 0.7866946, 0.6689013, 0, 0.6235294, 1, 1,
0.1986036, 0.7896465, -0.2763128, 0, 0.6156863, 1, 1,
0.2012395, 0.6577794, -1.342515, 0, 0.6117647, 1, 1,
0.2040999, 1.522234, 0.08024386, 0, 0.6039216, 1, 1,
0.2085436, 1.086709, 1.43382, 0, 0.5960785, 1, 1,
0.2126454, 0.02304956, 1.728836, 0, 0.5921569, 1, 1,
0.2136585, -0.8406749, 2.241288, 0, 0.5843138, 1, 1,
0.2136594, -1.451957, 4.157137, 0, 0.5803922, 1, 1,
0.2170991, 0.7029486, 1.502063, 0, 0.572549, 1, 1,
0.2198133, 0.5989951, 2.436262, 0, 0.5686275, 1, 1,
0.2231309, -0.5091071, 1.955035, 0, 0.5607843, 1, 1,
0.2236635, 0.1087522, 0.7758566, 0, 0.5568628, 1, 1,
0.2260514, 0.4356206, 0.5581203, 0, 0.5490196, 1, 1,
0.228824, 0.2729136, 0.5048296, 0, 0.5450981, 1, 1,
0.2303577, 0.3687097, 0.7056977, 0, 0.5372549, 1, 1,
0.2305711, -0.4171229, 4.164132, 0, 0.5333334, 1, 1,
0.2379597, 1.310585, 0.5844341, 0, 0.5254902, 1, 1,
0.2410213, 1.304708, 0.06173785, 0, 0.5215687, 1, 1,
0.247507, -0.2437316, 1.478329, 0, 0.5137255, 1, 1,
0.2504466, -1.104096, 2.788436, 0, 0.509804, 1, 1,
0.2513129, -1.006571, 4.120585, 0, 0.5019608, 1, 1,
0.2540964, 0.6477678, -0.637499, 0, 0.4941176, 1, 1,
0.2544313, -1.384971, 4.152224, 0, 0.4901961, 1, 1,
0.2604251, -0.2538135, 3.988071, 0, 0.4823529, 1, 1,
0.262792, -0.9000984, 1.405412, 0, 0.4784314, 1, 1,
0.2629109, -0.3093319, 2.508874, 0, 0.4705882, 1, 1,
0.2642016, -0.5474045, 1.739831, 0, 0.4666667, 1, 1,
0.2656876, 0.5309315, 0.8924456, 0, 0.4588235, 1, 1,
0.2657687, 0.1309687, 0.9559702, 0, 0.454902, 1, 1,
0.2671774, 0.8212187, -0.1937962, 0, 0.4470588, 1, 1,
0.2698932, 0.172114, 1.532933, 0, 0.4431373, 1, 1,
0.2723018, -0.163013, 3.963375, 0, 0.4352941, 1, 1,
0.2761402, 0.5718589, -0.06317154, 0, 0.4313726, 1, 1,
0.2792961, -0.9172433, 5.139987, 0, 0.4235294, 1, 1,
0.2844988, 0.1638031, 1.364176, 0, 0.4196078, 1, 1,
0.2858889, 1.262938, -0.1069171, 0, 0.4117647, 1, 1,
0.2864636, -2.001402, 0.963864, 0, 0.4078431, 1, 1,
0.2873706, 1.857406, 1.273587, 0, 0.4, 1, 1,
0.2882487, -0.2885556, 1.770864, 0, 0.3921569, 1, 1,
0.2916174, 2.340244, -0.2616747, 0, 0.3882353, 1, 1,
0.2935501, 1.376285, 1.901965, 0, 0.3803922, 1, 1,
0.2971942, -0.5866775, 2.950596, 0, 0.3764706, 1, 1,
0.2992795, -1.427254, 4.649099, 0, 0.3686275, 1, 1,
0.3046094, -0.2888418, 1.812964, 0, 0.3647059, 1, 1,
0.3046418, 0.4874694, 2.284855, 0, 0.3568628, 1, 1,
0.3095326, 0.7929509, 0.209825, 0, 0.3529412, 1, 1,
0.3151765, 0.2249618, 0.8460257, 0, 0.345098, 1, 1,
0.3153691, 0.8560928, 0.4619513, 0, 0.3411765, 1, 1,
0.3156794, -0.1265743, 2.567199, 0, 0.3333333, 1, 1,
0.3166425, 1.263454, -0.03857489, 0, 0.3294118, 1, 1,
0.3180701, 1.342966, 0.05726804, 0, 0.3215686, 1, 1,
0.3216891, -1.656447, 4.100847, 0, 0.3176471, 1, 1,
0.3219007, 1.354459, -0.3056496, 0, 0.3098039, 1, 1,
0.3235096, -0.2330399, 0.8406464, 0, 0.3058824, 1, 1,
0.3250144, -0.2579797, 3.217831, 0, 0.2980392, 1, 1,
0.3275184, 1.454975, -1.441318, 0, 0.2901961, 1, 1,
0.3398462, -0.270073, 1.705001, 0, 0.2862745, 1, 1,
0.3426062, 0.3026421, 1.507174, 0, 0.2784314, 1, 1,
0.3458592, 1.662395, -0.2955329, 0, 0.2745098, 1, 1,
0.3470001, -1.348786, 3.826323, 0, 0.2666667, 1, 1,
0.3477369, -1.008504, 4.30896, 0, 0.2627451, 1, 1,
0.3485128, -0.643374, 3.56738, 0, 0.254902, 1, 1,
0.3490767, -0.9574106, 2.02329, 0, 0.2509804, 1, 1,
0.3604066, 0.2995713, 1.573379, 0, 0.2431373, 1, 1,
0.3621675, -0.2054472, 2.872567, 0, 0.2392157, 1, 1,
0.3726888, 0.6643866, 1.358204, 0, 0.2313726, 1, 1,
0.3735558, 0.7680441, 1.69005, 0, 0.227451, 1, 1,
0.3781814, -0.5311469, 1.288008, 0, 0.2196078, 1, 1,
0.3817348, 0.4094042, 0.9129013, 0, 0.2156863, 1, 1,
0.3833165, 0.8231096, 0.6892675, 0, 0.2078431, 1, 1,
0.38538, -1.847828, 2.143899, 0, 0.2039216, 1, 1,
0.3877477, 0.01499831, 1.241116, 0, 0.1960784, 1, 1,
0.3891727, 0.8010535, -0.6705357, 0, 0.1882353, 1, 1,
0.3897432, -1.037426, 6.078008, 0, 0.1843137, 1, 1,
0.3953032, -0.7890698, 1.159265, 0, 0.1764706, 1, 1,
0.3954477, 0.03047354, 2.19778, 0, 0.172549, 1, 1,
0.4001331, 0.6089221, 0.4980114, 0, 0.1647059, 1, 1,
0.4011011, -2.290669, 1.639115, 0, 0.1607843, 1, 1,
0.4076942, -0.4072459, 0.7465301, 0, 0.1529412, 1, 1,
0.4098018, -0.5184488, 2.478065, 0, 0.1490196, 1, 1,
0.412794, -0.2381904, 2.396857, 0, 0.1411765, 1, 1,
0.4146486, 0.4644881, -0.2091273, 0, 0.1372549, 1, 1,
0.4148156, -0.07198659, 3.104735, 0, 0.1294118, 1, 1,
0.422203, -0.5157239, 3.647231, 0, 0.1254902, 1, 1,
0.4225017, 0.5802643, -0.9377044, 0, 0.1176471, 1, 1,
0.4306299, -1.304942, 2.863024, 0, 0.1137255, 1, 1,
0.430783, 0.527468, -0.1739812, 0, 0.1058824, 1, 1,
0.4314155, 0.08729479, 2.41086, 0, 0.09803922, 1, 1,
0.4319969, 0.6179311, -0.05642887, 0, 0.09411765, 1, 1,
0.4363682, 0.2073463, 0.3015498, 0, 0.08627451, 1, 1,
0.4387225, 0.5290204, 0.3700832, 0, 0.08235294, 1, 1,
0.439994, -0.9045954, 2.542809, 0, 0.07450981, 1, 1,
0.4406702, -0.3553687, 1.764108, 0, 0.07058824, 1, 1,
0.4412443, -1.313779, 4.366067, 0, 0.0627451, 1, 1,
0.4471332, 0.02119136, 0.3703135, 0, 0.05882353, 1, 1,
0.4519659, 1.452598, -0.489463, 0, 0.05098039, 1, 1,
0.4522551, 0.3378363, 1.49949, 0, 0.04705882, 1, 1,
0.4608405, -0.4212355, 1.503963, 0, 0.03921569, 1, 1,
0.4613112, -0.06057943, 1.679519, 0, 0.03529412, 1, 1,
0.4619133, 0.7455742, 1.061735, 0, 0.02745098, 1, 1,
0.4678499, -1.007637, 2.642739, 0, 0.02352941, 1, 1,
0.4717414, -0.5208935, 4.154942, 0, 0.01568628, 1, 1,
0.4767476, -0.2741385, 3.800419, 0, 0.01176471, 1, 1,
0.4768974, -0.4092782, 2.271336, 0, 0.003921569, 1, 1,
0.4809666, -1.205373, 3.078098, 0.003921569, 0, 1, 1,
0.4846497, -1.199521, 4.032904, 0.007843138, 0, 1, 1,
0.4887208, -0.2405448, 0.756019, 0.01568628, 0, 1, 1,
0.4906734, -1.726293, 1.962082, 0.01960784, 0, 1, 1,
0.4912743, 0.6370467, 1.945371, 0.02745098, 0, 1, 1,
0.4933583, -0.0130174, 2.45007, 0.03137255, 0, 1, 1,
0.5028893, 1.407537, 0.5196483, 0.03921569, 0, 1, 1,
0.5061436, 0.4548751, 0.2070315, 0.04313726, 0, 1, 1,
0.5081419, 0.2245345, 0.05676816, 0.05098039, 0, 1, 1,
0.508827, -1.111324, 2.401427, 0.05490196, 0, 1, 1,
0.5103948, 0.3458681, 1.959275, 0.0627451, 0, 1, 1,
0.5125676, -0.7516695, 4.167655, 0.06666667, 0, 1, 1,
0.5133308, 0.006377395, 0.5667868, 0.07450981, 0, 1, 1,
0.5192366, -0.6257088, 3.598951, 0.07843138, 0, 1, 1,
0.5221567, 0.4545949, -0.521876, 0.08627451, 0, 1, 1,
0.5230132, -0.6684796, 1.560752, 0.09019608, 0, 1, 1,
0.5339574, 0.9021663, -0.428937, 0.09803922, 0, 1, 1,
0.5402677, 0.1536103, 1.824723, 0.1058824, 0, 1, 1,
0.5411177, 0.9963343, 0.9130869, 0.1098039, 0, 1, 1,
0.5464618, 0.6117966, 2.361193, 0.1176471, 0, 1, 1,
0.5488493, 0.196884, 1.132356, 0.1215686, 0, 1, 1,
0.5511166, -0.6981758, 3.082193, 0.1294118, 0, 1, 1,
0.5523836, -0.3239185, 2.895251, 0.1333333, 0, 1, 1,
0.5558352, 0.6315487, 2.178676, 0.1411765, 0, 1, 1,
0.5648189, -0.2319915, 2.140106, 0.145098, 0, 1, 1,
0.5653954, -0.6979336, 2.897075, 0.1529412, 0, 1, 1,
0.5664536, 0.4104944, 0.9996096, 0.1568628, 0, 1, 1,
0.5707108, -0.9413876, 1.383118, 0.1647059, 0, 1, 1,
0.5716633, -0.4461819, 2.516613, 0.1686275, 0, 1, 1,
0.57333, 0.343087, 0.641413, 0.1764706, 0, 1, 1,
0.5733941, -0.7561345, 3.819937, 0.1803922, 0, 1, 1,
0.5743917, -0.561662, 3.093617, 0.1882353, 0, 1, 1,
0.5754521, -0.006231177, 1.16054, 0.1921569, 0, 1, 1,
0.5771765, 0.5180339, 0.6708555, 0.2, 0, 1, 1,
0.5772468, 0.001882902, 1.349751, 0.2078431, 0, 1, 1,
0.5776473, 0.1024682, 0.589499, 0.2117647, 0, 1, 1,
0.5793946, 0.2294653, 1.17417, 0.2196078, 0, 1, 1,
0.5807531, -1.319944, 2.582162, 0.2235294, 0, 1, 1,
0.5828328, 0.3768142, 0.5770409, 0.2313726, 0, 1, 1,
0.5918708, -0.7854838, 2.601128, 0.2352941, 0, 1, 1,
0.5966257, 0.08643573, 1.934602, 0.2431373, 0, 1, 1,
0.6027265, 0.7858633, 0.1920488, 0.2470588, 0, 1, 1,
0.6068059, -0.8545672, 1.663551, 0.254902, 0, 1, 1,
0.6076868, -0.7455636, 3.138597, 0.2588235, 0, 1, 1,
0.6100435, 1.237286, 1.082184, 0.2666667, 0, 1, 1,
0.6101896, -1.166182, 4.272787, 0.2705882, 0, 1, 1,
0.6120527, 0.5836992, 0.4494266, 0.2784314, 0, 1, 1,
0.6122952, -1.111881, 2.345025, 0.282353, 0, 1, 1,
0.6129127, 0.1958904, 1.16061, 0.2901961, 0, 1, 1,
0.6140487, 0.04322743, 1.092353, 0.2941177, 0, 1, 1,
0.6144451, 1.842396, -0.3179356, 0.3019608, 0, 1, 1,
0.6167665, 1.13145, -0.2036371, 0.3098039, 0, 1, 1,
0.6200815, 0.1723652, 2.539214, 0.3137255, 0, 1, 1,
0.6217301, 0.1950971, 1.377981, 0.3215686, 0, 1, 1,
0.6224797, 0.2435519, 2.008423, 0.3254902, 0, 1, 1,
0.6255913, 1.050245, 0.9229849, 0.3333333, 0, 1, 1,
0.629289, 1.486853, 1.098979, 0.3372549, 0, 1, 1,
0.6305403, 0.5154458, 1.657171, 0.345098, 0, 1, 1,
0.6379837, 1.660963, 1.168, 0.3490196, 0, 1, 1,
0.6392503, 0.488365, 0.805738, 0.3568628, 0, 1, 1,
0.6423842, 1.774621, 0.9132845, 0.3607843, 0, 1, 1,
0.6446111, 1.320393, 0.7674734, 0.3686275, 0, 1, 1,
0.646035, 0.83555, 0.6387783, 0.372549, 0, 1, 1,
0.6487602, 1.422378, 0.5423133, 0.3803922, 0, 1, 1,
0.6495655, -0.4574203, 2.440969, 0.3843137, 0, 1, 1,
0.6496342, -1.249229, 3.229596, 0.3921569, 0, 1, 1,
0.6497053, -0.7445909, 2.674877, 0.3960784, 0, 1, 1,
0.6553915, 0.6807448, 0.3087925, 0.4039216, 0, 1, 1,
0.6577263, 0.189418, 0.4699368, 0.4117647, 0, 1, 1,
0.6637655, 1.488331, 0.6091474, 0.4156863, 0, 1, 1,
0.6656824, 0.6493451, 1.634191, 0.4235294, 0, 1, 1,
0.6660095, -0.8291357, 0.4676111, 0.427451, 0, 1, 1,
0.6662874, -0.1159745, 0.7265131, 0.4352941, 0, 1, 1,
0.668358, -0.8370286, 2.77722, 0.4392157, 0, 1, 1,
0.6713514, -1.081275, 3.322896, 0.4470588, 0, 1, 1,
0.6749156, 0.8562785, -0.01409301, 0.4509804, 0, 1, 1,
0.6754047, -1.486429, 1.481394, 0.4588235, 0, 1, 1,
0.6782513, 0.1426377, 0.8518969, 0.4627451, 0, 1, 1,
0.6805339, -0.8680136, 4.840429, 0.4705882, 0, 1, 1,
0.6863071, -0.368579, 2.115574, 0.4745098, 0, 1, 1,
0.6887012, -0.7753782, 2.158007, 0.4823529, 0, 1, 1,
0.6922224, -0.8975124, 3.581192, 0.4862745, 0, 1, 1,
0.695724, 0.2524623, 1.370562, 0.4941176, 0, 1, 1,
0.6982808, -1.681779, -0.4101319, 0.5019608, 0, 1, 1,
0.698971, -1.291789, 3.158146, 0.5058824, 0, 1, 1,
0.7017571, 0.06650345, 0.4314842, 0.5137255, 0, 1, 1,
0.705074, 1.032888, 0.6840037, 0.5176471, 0, 1, 1,
0.7090124, -1.414364, 3.24129, 0.5254902, 0, 1, 1,
0.7141364, 1.496584, 0.3164177, 0.5294118, 0, 1, 1,
0.7209268, -1.315697, 3.252138, 0.5372549, 0, 1, 1,
0.7249922, -0.09765064, 2.784081, 0.5411765, 0, 1, 1,
0.7266182, 0.2949129, 0.08860878, 0.5490196, 0, 1, 1,
0.7291031, -0.9087266, 2.353717, 0.5529412, 0, 1, 1,
0.733306, -1.696193, 3.41305, 0.5607843, 0, 1, 1,
0.7338434, -1.671269, 0.9882179, 0.5647059, 0, 1, 1,
0.734987, -1.045812, 0.5868263, 0.572549, 0, 1, 1,
0.7405456, 0.4268324, 2.13278, 0.5764706, 0, 1, 1,
0.7432269, -0.7444444, 1.988743, 0.5843138, 0, 1, 1,
0.7437717, 0.6502597, -0.6071977, 0.5882353, 0, 1, 1,
0.7474181, -1.683333, 2.81116, 0.5960785, 0, 1, 1,
0.7482573, -0.361255, 1.478533, 0.6039216, 0, 1, 1,
0.7487333, 1.539893, -0.7417581, 0.6078432, 0, 1, 1,
0.750018, -0.2803522, 2.582306, 0.6156863, 0, 1, 1,
0.7539379, 1.382185, 1.117554, 0.6196079, 0, 1, 1,
0.7605912, 1.893513, 1.928185, 0.627451, 0, 1, 1,
0.7625788, -0.06750377, 2.41609, 0.6313726, 0, 1, 1,
0.7632993, -0.2295869, 3.538053, 0.6392157, 0, 1, 1,
0.7644678, 0.001934816, 3.332313, 0.6431373, 0, 1, 1,
0.7745669, 0.811507, 0.1664241, 0.6509804, 0, 1, 1,
0.7775361, 1.200214, 0.315615, 0.654902, 0, 1, 1,
0.7799019, 0.6169314, 1.593604, 0.6627451, 0, 1, 1,
0.7822471, 0.1412746, 3.720933, 0.6666667, 0, 1, 1,
0.7877321, -0.8023685, 2.485923, 0.6745098, 0, 1, 1,
0.7900952, -1.368621, 3.76016, 0.6784314, 0, 1, 1,
0.7959049, 0.5171667, 0.8225973, 0.6862745, 0, 1, 1,
0.8046251, 1.612502, 1.556925, 0.6901961, 0, 1, 1,
0.805123, 1.913209, 0.3464802, 0.6980392, 0, 1, 1,
0.8148537, -1.578372, 2.433795, 0.7058824, 0, 1, 1,
0.817179, -0.7792856, 2.69805, 0.7098039, 0, 1, 1,
0.8172783, 0.5998855, 0.4106713, 0.7176471, 0, 1, 1,
0.8203442, -1.547618, 3.912863, 0.7215686, 0, 1, 1,
0.820437, 0.4551258, -0.2750753, 0.7294118, 0, 1, 1,
0.8228018, 0.4930707, 0.1387111, 0.7333333, 0, 1, 1,
0.8249323, -0.560951, 2.688433, 0.7411765, 0, 1, 1,
0.8310344, 0.586098, -0.1326513, 0.7450981, 0, 1, 1,
0.8313316, -0.4252885, 1.734456, 0.7529412, 0, 1, 1,
0.8362702, -0.4144464, 0.9422407, 0.7568628, 0, 1, 1,
0.8368967, 0.4110465, 1.239333, 0.7647059, 0, 1, 1,
0.8426389, -1.803423, 2.259187, 0.7686275, 0, 1, 1,
0.8441159, 0.7656266, 0.6297261, 0.7764706, 0, 1, 1,
0.8463203, 0.1326273, 0.8558774, 0.7803922, 0, 1, 1,
0.8486969, 0.7654523, 0.705884, 0.7882353, 0, 1, 1,
0.8531038, -0.2331024, 2.138237, 0.7921569, 0, 1, 1,
0.8569344, 0.5749419, 0.2673803, 0.8, 0, 1, 1,
0.8570106, -1.092166, 3.004202, 0.8078431, 0, 1, 1,
0.859868, 1.239136, 1.091627, 0.8117647, 0, 1, 1,
0.8598723, 1.154199, 0.2267735, 0.8196079, 0, 1, 1,
0.8604275, -1.010785, 3.018188, 0.8235294, 0, 1, 1,
0.8649282, 1.295371, 1.83748, 0.8313726, 0, 1, 1,
0.8675755, -0.411148, 1.289775, 0.8352941, 0, 1, 1,
0.8687251, -0.1252673, 0.7929975, 0.8431373, 0, 1, 1,
0.8759472, 0.97923, 0.1998761, 0.8470588, 0, 1, 1,
0.8870255, -0.2180613, 2.036188, 0.854902, 0, 1, 1,
0.8884206, -0.3773167, 2.363688, 0.8588235, 0, 1, 1,
0.8907058, -1.30768, 2.403498, 0.8666667, 0, 1, 1,
0.8923347, 1.231504, 0.6007851, 0.8705882, 0, 1, 1,
0.8934478, -0.8595322, 4.143157, 0.8784314, 0, 1, 1,
0.8951526, -0.7676789, 3.586211, 0.8823529, 0, 1, 1,
0.9087907, 0.7385935, 0.3052352, 0.8901961, 0, 1, 1,
0.9101345, 1.440179, 1.387717, 0.8941177, 0, 1, 1,
0.9125091, -1.047979, 0.7960336, 0.9019608, 0, 1, 1,
0.9169847, 0.6924124, 0.3417297, 0.9098039, 0, 1, 1,
0.9224257, 0.7892648, -0.2743606, 0.9137255, 0, 1, 1,
0.9322706, -1.185399, 3.183572, 0.9215686, 0, 1, 1,
0.9336427, -0.1133062, 1.189633, 0.9254902, 0, 1, 1,
0.9400835, 0.1643108, 1.690577, 0.9333333, 0, 1, 1,
0.9435401, 0.5268421, 0.4200117, 0.9372549, 0, 1, 1,
0.9502133, 1.587838, 0.1159654, 0.945098, 0, 1, 1,
0.9521891, 1.171924, 0.9549222, 0.9490196, 0, 1, 1,
0.9542248, -0.6264347, 3.643304, 0.9568627, 0, 1, 1,
0.9549295, -0.225765, 2.137336, 0.9607843, 0, 1, 1,
0.9584657, -1.965571, 3.987701, 0.9686275, 0, 1, 1,
0.9591725, -0.05380098, 1.195664, 0.972549, 0, 1, 1,
0.9628424, -1.168434, 3.902978, 0.9803922, 0, 1, 1,
0.9686849, 0.9878095, 1.123419, 0.9843137, 0, 1, 1,
0.9717049, 1.015976, -0.729094, 0.9921569, 0, 1, 1,
0.9722646, 0.09391636, -0.3986463, 0.9960784, 0, 1, 1,
0.9741231, 0.7044163, 0.892199, 1, 0, 0.9960784, 1,
0.9785158, 1.134169, 3.263587, 1, 0, 0.9882353, 1,
0.979775, 1.101513, 0.9707488, 1, 0, 0.9843137, 1,
0.9820412, -1.233919, 2.179284, 1, 0, 0.9764706, 1,
0.9936245, 0.2053366, 2.525103, 1, 0, 0.972549, 1,
0.9950462, 2.301734, -0.4035317, 1, 0, 0.9647059, 1,
0.9957695, -0.6757006, 4.194479, 1, 0, 0.9607843, 1,
0.9995301, -0.4857639, 1.858435, 1, 0, 0.9529412, 1,
1.001155, 0.7905515, 2.932361, 1, 0, 0.9490196, 1,
1.005463, -1.263866, 3.04804, 1, 0, 0.9411765, 1,
1.005943, -1.378159, 3.517992, 1, 0, 0.9372549, 1,
1.008085, 0.9810189, 1.395263, 1, 0, 0.9294118, 1,
1.015974, 0.6902993, 0.676178, 1, 0, 0.9254902, 1,
1.030279, -0.1565325, -0.1860864, 1, 0, 0.9176471, 1,
1.033016, 0.8881317, -0.9880719, 1, 0, 0.9137255, 1,
1.036095, -0.3606827, 0.5137963, 1, 0, 0.9058824, 1,
1.037266, -1.133506, 1.134883, 1, 0, 0.9019608, 1,
1.043875, 0.2491443, 3.193286, 1, 0, 0.8941177, 1,
1.044005, -1.0409, 4.045783, 1, 0, 0.8862745, 1,
1.046418, -0.1426103, 1.162888, 1, 0, 0.8823529, 1,
1.046698, -0.05278985, 1.616035, 1, 0, 0.8745098, 1,
1.047931, -1.504988, 1.892324, 1, 0, 0.8705882, 1,
1.053224, -0.680298, 2.971831, 1, 0, 0.8627451, 1,
1.058154, 0.6966721, 1.215452, 1, 0, 0.8588235, 1,
1.070148, 0.8498135, 2.004942, 1, 0, 0.8509804, 1,
1.073938, 0.2760194, 0.8339564, 1, 0, 0.8470588, 1,
1.080382, -0.1686282, 2.66763, 1, 0, 0.8392157, 1,
1.081051, 1.993345, 0.7653407, 1, 0, 0.8352941, 1,
1.086597, -1.129793, 2.376895, 1, 0, 0.827451, 1,
1.086975, -0.08082154, 0.9813015, 1, 0, 0.8235294, 1,
1.088326, 0.4607199, 1.669088, 1, 0, 0.8156863, 1,
1.093079, -0.601842, 1.68709, 1, 0, 0.8117647, 1,
1.093828, -0.02036021, 2.314322, 1, 0, 0.8039216, 1,
1.104659, -1.071403, 2.596504, 1, 0, 0.7960784, 1,
1.113826, -0.2394512, 2.078878, 1, 0, 0.7921569, 1,
1.120112, 0.1675068, 2.194453, 1, 0, 0.7843137, 1,
1.123111, -0.58831, 1.765687, 1, 0, 0.7803922, 1,
1.126212, -0.5869684, 1.83861, 1, 0, 0.772549, 1,
1.129431, 2.031546, -0.7348979, 1, 0, 0.7686275, 1,
1.152019, -0.4414178, 1.226425, 1, 0, 0.7607843, 1,
1.155113, -1.050342, 1.684427, 1, 0, 0.7568628, 1,
1.158108, -1.824279, 3.073238, 1, 0, 0.7490196, 1,
1.168577, -0.8315546, 2.428195, 1, 0, 0.7450981, 1,
1.170625, 1.350839, 0.1162007, 1, 0, 0.7372549, 1,
1.176628, 0.5044066, 1.368739, 1, 0, 0.7333333, 1,
1.177835, 0.3398083, 1.44533, 1, 0, 0.7254902, 1,
1.181768, -0.05959564, 0.1567481, 1, 0, 0.7215686, 1,
1.18811, 2.524269, 3.469138, 1, 0, 0.7137255, 1,
1.195652, 1.497358, -0.2007818, 1, 0, 0.7098039, 1,
1.201651, -0.6492743, 1.41696, 1, 0, 0.7019608, 1,
1.20297, -0.9218912, 2.547634, 1, 0, 0.6941177, 1,
1.206832, 0.8570334, 1.186303, 1, 0, 0.6901961, 1,
1.210312, 1.227033, 0.5073799, 1, 0, 0.682353, 1,
1.213478, 0.03521004, 0.3387523, 1, 0, 0.6784314, 1,
1.2194, 0.4478818, 2.16144, 1, 0, 0.6705883, 1,
1.222495, -0.9831552, 2.257816, 1, 0, 0.6666667, 1,
1.224903, -1.243981, 1.807832, 1, 0, 0.6588235, 1,
1.227979, -0.5598587, 3.884185, 1, 0, 0.654902, 1,
1.229674, -1.518453, 3.716935, 1, 0, 0.6470588, 1,
1.240246, -0.4449982, 1.452579, 1, 0, 0.6431373, 1,
1.248279, 0.8624844, 0.9688987, 1, 0, 0.6352941, 1,
1.248817, -0.4235422, 3.006488, 1, 0, 0.6313726, 1,
1.260912, 0.3781087, 1.410014, 1, 0, 0.6235294, 1,
1.269187, -0.2456162, 2.130994, 1, 0, 0.6196079, 1,
1.276943, 1.292108, 1.235146, 1, 0, 0.6117647, 1,
1.28354, 0.239576, 1.95263, 1, 0, 0.6078432, 1,
1.289496, -0.5486219, 1.439646, 1, 0, 0.6, 1,
1.31604, 0.7904528, 1.185438, 1, 0, 0.5921569, 1,
1.32179, 1.303897, 0.3329768, 1, 0, 0.5882353, 1,
1.323968, -0.3660886, 2.52894, 1, 0, 0.5803922, 1,
1.326385, 0.7220905, 0.6720844, 1, 0, 0.5764706, 1,
1.328974, -0.5960599, 2.075266, 1, 0, 0.5686275, 1,
1.329673, 0.9551098, 0.8323966, 1, 0, 0.5647059, 1,
1.329913, 0.04284843, 0.9289564, 1, 0, 0.5568628, 1,
1.337626, -0.7535737, 3.549874, 1, 0, 0.5529412, 1,
1.338542, -0.02626089, 1.119195, 1, 0, 0.5450981, 1,
1.350904, -2.205122, 2.467826, 1, 0, 0.5411765, 1,
1.355694, -0.3290642, 3.951636, 1, 0, 0.5333334, 1,
1.365953, 0.2066812, 0.8381588, 1, 0, 0.5294118, 1,
1.372896, -1.218996, 2.914613, 1, 0, 0.5215687, 1,
1.384763, -1.836274, 1.593996, 1, 0, 0.5176471, 1,
1.385492, 0.0124203, 1.243845, 1, 0, 0.509804, 1,
1.393984, 0.31378, 0.07989059, 1, 0, 0.5058824, 1,
1.401175, 0.565464, 1.284137, 1, 0, 0.4980392, 1,
1.407914, -0.3340907, 0.7819141, 1, 0, 0.4901961, 1,
1.409161, 0.02730179, 0.8066864, 1, 0, 0.4862745, 1,
1.422848, -0.6035139, 1.544238, 1, 0, 0.4784314, 1,
1.4241, 1.275733, -1.038514, 1, 0, 0.4745098, 1,
1.425306, -0.5978033, 0.9245937, 1, 0, 0.4666667, 1,
1.427575, 0.0983217, 2.587673, 1, 0, 0.4627451, 1,
1.428236, -0.3531156, 2.669066, 1, 0, 0.454902, 1,
1.433663, -0.7973443, 1.225647, 1, 0, 0.4509804, 1,
1.435448, 0.6993835, 0.9670798, 1, 0, 0.4431373, 1,
1.436771, -0.520053, 3.020728, 1, 0, 0.4392157, 1,
1.44154, -1.79211, 2.287449, 1, 0, 0.4313726, 1,
1.443098, 0.5308394, 2.13286, 1, 0, 0.427451, 1,
1.444336, -0.8079199, 2.745202, 1, 0, 0.4196078, 1,
1.445544, 0.7046056, 0.787204, 1, 0, 0.4156863, 1,
1.453128, 1.15053, 1.215251, 1, 0, 0.4078431, 1,
1.454355, 0.01746996, 2.752023, 1, 0, 0.4039216, 1,
1.458112, -1.198707, 2.305668, 1, 0, 0.3960784, 1,
1.470654, 2.174854, 0.3622332, 1, 0, 0.3882353, 1,
1.472108, -0.3403329, 1.513777, 1, 0, 0.3843137, 1,
1.473152, 0.7932349, 0.3416691, 1, 0, 0.3764706, 1,
1.483348, 0.4513834, 0.1467391, 1, 0, 0.372549, 1,
1.485638, -0.6704827, 1.441828, 1, 0, 0.3647059, 1,
1.489081, 0.881794, 2.126584, 1, 0, 0.3607843, 1,
1.502944, 0.4996573, 1.476321, 1, 0, 0.3529412, 1,
1.508568, -2.047827, 4.906392, 1, 0, 0.3490196, 1,
1.511735, 0.7327488, 1.839025, 1, 0, 0.3411765, 1,
1.517125, -0.6612718, 3.719785, 1, 0, 0.3372549, 1,
1.535406, -1.174874, 0.4097641, 1, 0, 0.3294118, 1,
1.560126, 0.829715, 2.486228, 1, 0, 0.3254902, 1,
1.560617, -0.4046048, 2.219224, 1, 0, 0.3176471, 1,
1.578337, -0.9328867, 2.472821, 1, 0, 0.3137255, 1,
1.585253, 1.792601, 1.49445, 1, 0, 0.3058824, 1,
1.585694, 1.322925, -0.0146077, 1, 0, 0.2980392, 1,
1.586913, 0.1535409, 2.550897, 1, 0, 0.2941177, 1,
1.597686, 0.8019385, 3.07426, 1, 0, 0.2862745, 1,
1.600166, -3.289097, 3.387892, 1, 0, 0.282353, 1,
1.601403, -1.170044, 1.008178, 1, 0, 0.2745098, 1,
1.613335, 0.3558865, 0.8744509, 1, 0, 0.2705882, 1,
1.61489, -0.7768315, 3.980054, 1, 0, 0.2627451, 1,
1.621922, -0.6766648, 2.2855, 1, 0, 0.2588235, 1,
1.671576, 0.2272855, 0.625125, 1, 0, 0.2509804, 1,
1.673528, 1.026938, 0.9145101, 1, 0, 0.2470588, 1,
1.678876, -0.6069632, 2.092657, 1, 0, 0.2392157, 1,
1.697749, -0.2038304, 0.04647692, 1, 0, 0.2352941, 1,
1.707461, 1.326376, 0.8932269, 1, 0, 0.227451, 1,
1.727676, -0.6325962, 2.05612, 1, 0, 0.2235294, 1,
1.744445, -0.6770836, 0.8921549, 1, 0, 0.2156863, 1,
1.744938, -2.005282, 2.542787, 1, 0, 0.2117647, 1,
1.825546, 1.055065, -0.2487642, 1, 0, 0.2039216, 1,
1.825755, 1.584935, 1.180582, 1, 0, 0.1960784, 1,
1.830567, -1.682488, 3.040941, 1, 0, 0.1921569, 1,
1.837763, -1.442784, 3.281665, 1, 0, 0.1843137, 1,
1.839457, -1.367784, 2.171504, 1, 0, 0.1803922, 1,
1.857091, 1.395712, 2.226224, 1, 0, 0.172549, 1,
1.86168, -1.507352, 2.270329, 1, 0, 0.1686275, 1,
1.862152, -1.198362, 2.127097, 1, 0, 0.1607843, 1,
1.892185, 0.1913843, 2.064133, 1, 0, 0.1568628, 1,
1.914443, -1.074659, 3.766659, 1, 0, 0.1490196, 1,
1.935384, 0.7269953, 2.643319, 1, 0, 0.145098, 1,
1.94318, -0.6897302, 2.878294, 1, 0, 0.1372549, 1,
1.953859, -0.1250286, 0.06761973, 1, 0, 0.1333333, 1,
2.00684, 0.651062, 1.375709, 1, 0, 0.1254902, 1,
2.049489, -0.7211643, 1.263931, 1, 0, 0.1215686, 1,
2.064986, -0.3853926, 1.616444, 1, 0, 0.1137255, 1,
2.069664, 1.734793, 1.508183, 1, 0, 0.1098039, 1,
2.103215, 1.032979, 1.677212, 1, 0, 0.1019608, 1,
2.126124, 0.2618673, 0.2748703, 1, 0, 0.09411765, 1,
2.128869, 1.013429, 0.4989652, 1, 0, 0.09019608, 1,
2.131654, 0.184829, 1.537249, 1, 0, 0.08235294, 1,
2.181849, -2.055488, 1.346038, 1, 0, 0.07843138, 1,
2.21975, 0.7344178, 1.907824, 1, 0, 0.07058824, 1,
2.243646, 1.095662, 1.334633, 1, 0, 0.06666667, 1,
2.267905, 1.238039, 2.544854, 1, 0, 0.05882353, 1,
2.421544, 1.005203, 3.685147, 1, 0, 0.05490196, 1,
2.428937, -1.167171, 2.563175, 1, 0, 0.04705882, 1,
2.529295, -1.133158, 1.384956, 1, 0, 0.04313726, 1,
2.531851, 0.7696614, 1.156804, 1, 0, 0.03529412, 1,
2.559253, 1.080317, 1.648168, 1, 0, 0.03137255, 1,
2.647531, -0.4140152, 2.7986, 1, 0, 0.02352941, 1,
2.690454, -0.3670153, -0.4683944, 1, 0, 0.01960784, 1,
2.876718, -0.2671285, 0.4572932, 1, 0, 0.01176471, 1,
2.918083, 0.8579417, 1.64605, 1, 0, 0.007843138, 1
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
0.03655422, -4.293007, -7.271606, 0, -0.5, 0.5, 0.5,
0.03655422, -4.293007, -7.271606, 1, -0.5, 0.5, 0.5,
0.03655422, -4.293007, -7.271606, 1, 1.5, 0.5, 0.5,
0.03655422, -4.293007, -7.271606, 0, 1.5, 0.5, 0.5
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
-3.821812, -0.3277075, -7.271606, 0, -0.5, 0.5, 0.5,
-3.821812, -0.3277075, -7.271606, 1, -0.5, 0.5, 0.5,
-3.821812, -0.3277075, -7.271606, 1, 1.5, 0.5, 0.5,
-3.821812, -0.3277075, -7.271606, 0, 1.5, 0.5, 0.5
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
-3.821812, -4.293007, 0.3706057, 0, -0.5, 0.5, 0.5,
-3.821812, -4.293007, 0.3706057, 1, -0.5, 0.5, 0.5,
-3.821812, -4.293007, 0.3706057, 1, 1.5, 0.5, 0.5,
-3.821812, -4.293007, 0.3706057, 0, 1.5, 0.5, 0.5
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
-2, -3.377938, -5.508019,
2, -3.377938, -5.508019,
-2, -3.377938, -5.508019,
-2, -3.53045, -5.80195,
-1, -3.377938, -5.508019,
-1, -3.53045, -5.80195,
0, -3.377938, -5.508019,
0, -3.53045, -5.80195,
1, -3.377938, -5.508019,
1, -3.53045, -5.80195,
2, -3.377938, -5.508019,
2, -3.53045, -5.80195
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
"2"
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
-2, -3.835473, -6.389812, 0, -0.5, 0.5, 0.5,
-2, -3.835473, -6.389812, 1, -0.5, 0.5, 0.5,
-2, -3.835473, -6.389812, 1, 1.5, 0.5, 0.5,
-2, -3.835473, -6.389812, 0, 1.5, 0.5, 0.5,
-1, -3.835473, -6.389812, 0, -0.5, 0.5, 0.5,
-1, -3.835473, -6.389812, 1, -0.5, 0.5, 0.5,
-1, -3.835473, -6.389812, 1, 1.5, 0.5, 0.5,
-1, -3.835473, -6.389812, 0, 1.5, 0.5, 0.5,
0, -3.835473, -6.389812, 0, -0.5, 0.5, 0.5,
0, -3.835473, -6.389812, 1, -0.5, 0.5, 0.5,
0, -3.835473, -6.389812, 1, 1.5, 0.5, 0.5,
0, -3.835473, -6.389812, 0, 1.5, 0.5, 0.5,
1, -3.835473, -6.389812, 0, -0.5, 0.5, 0.5,
1, -3.835473, -6.389812, 1, -0.5, 0.5, 0.5,
1, -3.835473, -6.389812, 1, 1.5, 0.5, 0.5,
1, -3.835473, -6.389812, 0, 1.5, 0.5, 0.5,
2, -3.835473, -6.389812, 0, -0.5, 0.5, 0.5,
2, -3.835473, -6.389812, 1, -0.5, 0.5, 0.5,
2, -3.835473, -6.389812, 1, 1.5, 0.5, 0.5,
2, -3.835473, -6.389812, 0, 1.5, 0.5, 0.5
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
-2.93142, -3, -5.508019,
-2.93142, 2, -5.508019,
-2.93142, -3, -5.508019,
-3.079819, -3, -5.80195,
-2.93142, -2, -5.508019,
-3.079819, -2, -5.80195,
-2.93142, -1, -5.508019,
-3.079819, -1, -5.80195,
-2.93142, 0, -5.508019,
-3.079819, 0, -5.80195,
-2.93142, 1, -5.508019,
-3.079819, 1, -5.80195,
-2.93142, 2, -5.508019,
-3.079819, 2, -5.80195
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
-3.376616, -3, -6.389812, 0, -0.5, 0.5, 0.5,
-3.376616, -3, -6.389812, 1, -0.5, 0.5, 0.5,
-3.376616, -3, -6.389812, 1, 1.5, 0.5, 0.5,
-3.376616, -3, -6.389812, 0, 1.5, 0.5, 0.5,
-3.376616, -2, -6.389812, 0, -0.5, 0.5, 0.5,
-3.376616, -2, -6.389812, 1, -0.5, 0.5, 0.5,
-3.376616, -2, -6.389812, 1, 1.5, 0.5, 0.5,
-3.376616, -2, -6.389812, 0, 1.5, 0.5, 0.5,
-3.376616, -1, -6.389812, 0, -0.5, 0.5, 0.5,
-3.376616, -1, -6.389812, 1, -0.5, 0.5, 0.5,
-3.376616, -1, -6.389812, 1, 1.5, 0.5, 0.5,
-3.376616, -1, -6.389812, 0, 1.5, 0.5, 0.5,
-3.376616, 0, -6.389812, 0, -0.5, 0.5, 0.5,
-3.376616, 0, -6.389812, 1, -0.5, 0.5, 0.5,
-3.376616, 0, -6.389812, 1, 1.5, 0.5, 0.5,
-3.376616, 0, -6.389812, 0, 1.5, 0.5, 0.5,
-3.376616, 1, -6.389812, 0, -0.5, 0.5, 0.5,
-3.376616, 1, -6.389812, 1, -0.5, 0.5, 0.5,
-3.376616, 1, -6.389812, 1, 1.5, 0.5, 0.5,
-3.376616, 1, -6.389812, 0, 1.5, 0.5, 0.5,
-3.376616, 2, -6.389812, 0, -0.5, 0.5, 0.5,
-3.376616, 2, -6.389812, 1, -0.5, 0.5, 0.5,
-3.376616, 2, -6.389812, 1, 1.5, 0.5, 0.5,
-3.376616, 2, -6.389812, 0, 1.5, 0.5, 0.5
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
-2.93142, -3.377938, -4,
-2.93142, -3.377938, 6,
-2.93142, -3.377938, -4,
-3.079819, -3.53045, -4,
-2.93142, -3.377938, -2,
-3.079819, -3.53045, -2,
-2.93142, -3.377938, 0,
-3.079819, -3.53045, 0,
-2.93142, -3.377938, 2,
-3.079819, -3.53045, 2,
-2.93142, -3.377938, 4,
-3.079819, -3.53045, 4,
-2.93142, -3.377938, 6,
-3.079819, -3.53045, 6
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
"4",
"6"
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
-3.376616, -3.835473, -4, 0, -0.5, 0.5, 0.5,
-3.376616, -3.835473, -4, 1, -0.5, 0.5, 0.5,
-3.376616, -3.835473, -4, 1, 1.5, 0.5, 0.5,
-3.376616, -3.835473, -4, 0, 1.5, 0.5, 0.5,
-3.376616, -3.835473, -2, 0, -0.5, 0.5, 0.5,
-3.376616, -3.835473, -2, 1, -0.5, 0.5, 0.5,
-3.376616, -3.835473, -2, 1, 1.5, 0.5, 0.5,
-3.376616, -3.835473, -2, 0, 1.5, 0.5, 0.5,
-3.376616, -3.835473, 0, 0, -0.5, 0.5, 0.5,
-3.376616, -3.835473, 0, 1, -0.5, 0.5, 0.5,
-3.376616, -3.835473, 0, 1, 1.5, 0.5, 0.5,
-3.376616, -3.835473, 0, 0, 1.5, 0.5, 0.5,
-3.376616, -3.835473, 2, 0, -0.5, 0.5, 0.5,
-3.376616, -3.835473, 2, 1, -0.5, 0.5, 0.5,
-3.376616, -3.835473, 2, 1, 1.5, 0.5, 0.5,
-3.376616, -3.835473, 2, 0, 1.5, 0.5, 0.5,
-3.376616, -3.835473, 4, 0, -0.5, 0.5, 0.5,
-3.376616, -3.835473, 4, 1, -0.5, 0.5, 0.5,
-3.376616, -3.835473, 4, 1, 1.5, 0.5, 0.5,
-3.376616, -3.835473, 4, 0, 1.5, 0.5, 0.5,
-3.376616, -3.835473, 6, 0, -0.5, 0.5, 0.5,
-3.376616, -3.835473, 6, 1, -0.5, 0.5, 0.5,
-3.376616, -3.835473, 6, 1, 1.5, 0.5, 0.5,
-3.376616, -3.835473, 6, 0, 1.5, 0.5, 0.5
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
-2.93142, -3.377938, -5.508019,
-2.93142, 2.722523, -5.508019,
-2.93142, -3.377938, 6.24923,
-2.93142, 2.722523, 6.24923,
-2.93142, -3.377938, -5.508019,
-2.93142, -3.377938, 6.24923,
-2.93142, 2.722523, -5.508019,
-2.93142, 2.722523, 6.24923,
-2.93142, -3.377938, -5.508019,
3.004529, -3.377938, -5.508019,
-2.93142, -3.377938, 6.24923,
3.004529, -3.377938, 6.24923,
-2.93142, 2.722523, -5.508019,
3.004529, 2.722523, -5.508019,
-2.93142, 2.722523, 6.24923,
3.004529, 2.722523, 6.24923,
3.004529, -3.377938, -5.508019,
3.004529, 2.722523, -5.508019,
3.004529, -3.377938, 6.24923,
3.004529, 2.722523, 6.24923,
3.004529, -3.377938, -5.508019,
3.004529, -3.377938, 6.24923,
3.004529, 2.722523, -5.508019,
3.004529, 2.722523, 6.24923
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
var radius = 7.750706;
var distance = 34.48377;
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
mvMatrix.translate( -0.03655422, 0.3277075, -0.3706057 );
mvMatrix.scale( 1.411774, 1.373702, 0.71277 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.48377);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
Pestan<-read.table("Pestan.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Pestan$V2
```

```
## Error in eval(expr, envir, enclos): object 'Pestan' not found
```

```r
y<-Pestan$V3
```

```
## Error in eval(expr, envir, enclos): object 'Pestan' not found
```

```r
z<-Pestan$V4
```

```
## Error in eval(expr, envir, enclos): object 'Pestan' not found
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
-2.844974, -0.05008872, -1.08889, 0, 0, 1, 1, 1,
-2.818137, 2.100975, -2.604587, 1, 0, 0, 1, 1,
-2.770049, -0.828769, -0.4174422, 1, 0, 0, 1, 1,
-2.549603, 1.283127, -1.778372, 1, 0, 0, 1, 1,
-2.519478, -0.4865321, -2.992092, 1, 0, 0, 1, 1,
-2.406268, 0.886721, -1.749479, 1, 0, 0, 1, 1,
-2.378417, -0.3112948, -1.642429, 0, 0, 0, 1, 1,
-2.365196, 0.247028, -2.395437, 0, 0, 0, 1, 1,
-2.335551, 0.4543182, -1.640009, 0, 0, 0, 1, 1,
-2.319818, 0.2273597, -1.525366, 0, 0, 0, 1, 1,
-2.297531, -0.1067935, -0.8856848, 0, 0, 0, 1, 1,
-2.266865, -0.8675297, -1.769714, 0, 0, 0, 1, 1,
-2.262355, -1.327256, -0.3728113, 0, 0, 0, 1, 1,
-2.205582, -2.404722, -2.027035, 1, 1, 1, 1, 1,
-2.172142, -0.1961405, -0.5381551, 1, 1, 1, 1, 1,
-2.171636, -0.1020352, 0.1669883, 1, 1, 1, 1, 1,
-2.110384, 0.330252, -2.720228, 1, 1, 1, 1, 1,
-2.07926, -1.029311, -2.092213, 1, 1, 1, 1, 1,
-2.077088, -0.9824489, -2.780305, 1, 1, 1, 1, 1,
-2.063369, -2.151286, -3.096805, 1, 1, 1, 1, 1,
-2.056772, 1.182798, -0.663924, 1, 1, 1, 1, 1,
-2.050863, -1.853745, -2.747481, 1, 1, 1, 1, 1,
-2.017103, 0.1591189, -1.107538, 1, 1, 1, 1, 1,
-2.00341, 0.3477187, 0.5966071, 1, 1, 1, 1, 1,
-1.957304, 0.06194218, -1.402581, 1, 1, 1, 1, 1,
-1.949478, 0.5616767, -0.688767, 1, 1, 1, 1, 1,
-1.945815, -0.8457996, -1.564989, 1, 1, 1, 1, 1,
-1.94575, -0.7127314, -1.525938, 1, 1, 1, 1, 1,
-1.944614, 0.914883, -1.21545, 0, 0, 1, 1, 1,
-1.934863, 0.7448642, -2.822896, 1, 0, 0, 1, 1,
-1.909063, -0.299345, -2.569425, 1, 0, 0, 1, 1,
-1.893667, -0.9289628, -1.406882, 1, 0, 0, 1, 1,
-1.866002, 0.3512979, -1.575982, 1, 0, 0, 1, 1,
-1.865878, -0.1190602, -2.818329, 1, 0, 0, 1, 1,
-1.858009, -0.8728922, -2.107142, 0, 0, 0, 1, 1,
-1.849045, 1.061281, -1.716232, 0, 0, 0, 1, 1,
-1.836481, -0.5125294, -1.93636, 0, 0, 0, 1, 1,
-1.828279, 0.1520181, -0.6601325, 0, 0, 0, 1, 1,
-1.815055, -0.5380766, -0.4558693, 0, 0, 0, 1, 1,
-1.799812, -0.4610259, -1.265656, 0, 0, 0, 1, 1,
-1.78809, -1.083214, -2.014901, 0, 0, 0, 1, 1,
-1.784311, 0.4487055, -1.064005, 1, 1, 1, 1, 1,
-1.782072, 0.001099886, 0.04428463, 1, 1, 1, 1, 1,
-1.752513, 1.411957, 1.053153, 1, 1, 1, 1, 1,
-1.740109, -0.4169889, -1.449193, 1, 1, 1, 1, 1,
-1.738558, 0.8165951, -0.007119557, 1, 1, 1, 1, 1,
-1.735283, -0.1702205, -1.669987, 1, 1, 1, 1, 1,
-1.717954, -0.2425763, 0.1105071, 1, 1, 1, 1, 1,
-1.714417, -0.5877344, -3.015146, 1, 1, 1, 1, 1,
-1.705193, -0.2093135, -0.896014, 1, 1, 1, 1, 1,
-1.696517, 1.904903, -0.6788871, 1, 1, 1, 1, 1,
-1.674475, 0.4885551, -0.6876153, 1, 1, 1, 1, 1,
-1.664354, -1.502447, -2.270149, 1, 1, 1, 1, 1,
-1.659645, -0.2176093, -1.286149, 1, 1, 1, 1, 1,
-1.623038, 0.1882561, -1.813356, 1, 1, 1, 1, 1,
-1.615636, 2.105011, -1.589882, 1, 1, 1, 1, 1,
-1.609215, 0.2416022, -1.461656, 0, 0, 1, 1, 1,
-1.60192, -0.8201314, -2.231941, 1, 0, 0, 1, 1,
-1.597396, -0.8648044, -1.887683, 1, 0, 0, 1, 1,
-1.596424, -0.1196369, -1.840324, 1, 0, 0, 1, 1,
-1.576905, 0.2486198, -1.271702, 1, 0, 0, 1, 1,
-1.572956, 0.3598334, -2.287271, 1, 0, 0, 1, 1,
-1.565641, 0.7955546, -0.1629759, 0, 0, 0, 1, 1,
-1.555796, -0.0350452, -2.04576, 0, 0, 0, 1, 1,
-1.551715, -0.2270897, -0.5132046, 0, 0, 0, 1, 1,
-1.542757, 0.8789291, -0.8471703, 0, 0, 0, 1, 1,
-1.534337, -0.7925915, -0.6580934, 0, 0, 0, 1, 1,
-1.530613, -0.03312266, -2.172271, 0, 0, 0, 1, 1,
-1.500278, 0.459507, 0.5772538, 0, 0, 0, 1, 1,
-1.496374, -1.624814, -2.482876, 1, 1, 1, 1, 1,
-1.496213, -1.001268, -3.400152, 1, 1, 1, 1, 1,
-1.495059, -0.6915653, -3.235529, 1, 1, 1, 1, 1,
-1.492893, 0.6675258, 0.06858538, 1, 1, 1, 1, 1,
-1.488789, -0.1816485, -1.976062, 1, 1, 1, 1, 1,
-1.485548, -0.9600984, -1.363285, 1, 1, 1, 1, 1,
-1.473795, -0.7277386, -0.2347589, 1, 1, 1, 1, 1,
-1.46938, 2.058462, -2.376738, 1, 1, 1, 1, 1,
-1.457377, 1.106792, -2.649042, 1, 1, 1, 1, 1,
-1.448293, -0.4352661, -1.789536, 1, 1, 1, 1, 1,
-1.444373, -1.239874, -2.198325, 1, 1, 1, 1, 1,
-1.437182, 0.9402609, -0.500734, 1, 1, 1, 1, 1,
-1.434083, -1.268071, -1.667878, 1, 1, 1, 1, 1,
-1.432226, 0.9346803, 0.8490864, 1, 1, 1, 1, 1,
-1.422156, -0.2146624, -1.465953, 1, 1, 1, 1, 1,
-1.418702, 0.7400905, -1.049108, 0, 0, 1, 1, 1,
-1.416352, -1.952952, -3.323072, 1, 0, 0, 1, 1,
-1.396643, 1.687496, -1.759933, 1, 0, 0, 1, 1,
-1.390435, 0.6860564, -1.325323, 1, 0, 0, 1, 1,
-1.384896, -0.08828654, -1.59401, 1, 0, 0, 1, 1,
-1.365704, 0.2738487, -3.103764, 1, 0, 0, 1, 1,
-1.364883, 0.8042547, -0.6597089, 0, 0, 0, 1, 1,
-1.350888, 2.331819, -0.3270297, 0, 0, 0, 1, 1,
-1.340606, 0.1747235, -1.221535, 0, 0, 0, 1, 1,
-1.338847, 1.050491, 0.6289824, 0, 0, 0, 1, 1,
-1.338817, 0.481386, -0.6418973, 0, 0, 0, 1, 1,
-1.334327, 0.02233266, -1.293732, 0, 0, 0, 1, 1,
-1.333581, 0.05459102, -1.744061, 0, 0, 0, 1, 1,
-1.321736, 1.200508, -0.6169047, 1, 1, 1, 1, 1,
-1.31992, -2.74692, -2.33601, 1, 1, 1, 1, 1,
-1.310332, -0.07939515, -2.832235, 1, 1, 1, 1, 1,
-1.307308, 0.3002714, 0.7297829, 1, 1, 1, 1, 1,
-1.302304, 0.6690973, 0.6369599, 1, 1, 1, 1, 1,
-1.298291, 0.5296996, -1.635016, 1, 1, 1, 1, 1,
-1.292616, -0.1416662, -1.601459, 1, 1, 1, 1, 1,
-1.272095, 0.9866638, -2.8788, 1, 1, 1, 1, 1,
-1.264497, 0.5037849, -1.953885, 1, 1, 1, 1, 1,
-1.263136, 1.411275, -1.025164, 1, 1, 1, 1, 1,
-1.259553, 0.9479314, -0.2189893, 1, 1, 1, 1, 1,
-1.234766, -0.5710692, -2.401889, 1, 1, 1, 1, 1,
-1.231722, -0.3497072, -2.440845, 1, 1, 1, 1, 1,
-1.217529, -0.1258107, -2.634885, 1, 1, 1, 1, 1,
-1.19808, 0.2525302, -1.881469, 1, 1, 1, 1, 1,
-1.195831, 0.3717864, -1.924819, 0, 0, 1, 1, 1,
-1.195454, -1.421932, -1.027166, 1, 0, 0, 1, 1,
-1.195006, -1.175543, -4.989168, 1, 0, 0, 1, 1,
-1.187277, 0.2110914, -0.5698699, 1, 0, 0, 1, 1,
-1.174677, -0.1425568, -1.06072, 1, 0, 0, 1, 1,
-1.173433, 0.2608957, -1.614495, 1, 0, 0, 1, 1,
-1.162732, 0.02943601, -2.210991, 0, 0, 0, 1, 1,
-1.156516, 0.5361869, -0.3593846, 0, 0, 0, 1, 1,
-1.147431, 0.05705695, -3.879118, 0, 0, 0, 1, 1,
-1.14693, -0.09386106, -1.927859, 0, 0, 0, 1, 1,
-1.140264, 0.8002418, -1.002304, 0, 0, 0, 1, 1,
-1.14019, -0.8026372, -2.455565, 0, 0, 0, 1, 1,
-1.137584, -2.692057, -2.538907, 0, 0, 0, 1, 1,
-1.133431, 0.6115604, -1.227216, 1, 1, 1, 1, 1,
-1.133429, 0.2455267, -1.975536, 1, 1, 1, 1, 1,
-1.130463, 0.167005, -0.3560173, 1, 1, 1, 1, 1,
-1.121537, 1.841701, 0.129567, 1, 1, 1, 1, 1,
-1.120828, -1.224144, -2.751739, 1, 1, 1, 1, 1,
-1.111705, 0.0950372, -2.394058, 1, 1, 1, 1, 1,
-1.111089, -0.27657, -3.005349, 1, 1, 1, 1, 1,
-1.098785, 0.7808126, 0.7146717, 1, 1, 1, 1, 1,
-1.095712, -0.2424887, -1.653381, 1, 1, 1, 1, 1,
-1.091697, 0.8751646, -1.455752, 1, 1, 1, 1, 1,
-1.091, -0.4275201, -0.686803, 1, 1, 1, 1, 1,
-1.07395, -0.703208, -0.9993656, 1, 1, 1, 1, 1,
-1.072357, 0.5903739, -2.314955, 1, 1, 1, 1, 1,
-1.066206, -0.1559147, -2.075095, 1, 1, 1, 1, 1,
-1.065889, -0.3343348, -1.193996, 1, 1, 1, 1, 1,
-1.061661, -0.5198812, -2.902336, 0, 0, 1, 1, 1,
-1.060962, 0.8002074, -0.8375828, 1, 0, 0, 1, 1,
-1.060115, 0.6050804, -0.2575155, 1, 0, 0, 1, 1,
-1.059996, -1.048854, -3.727746, 1, 0, 0, 1, 1,
-1.043173, 1.07606, 0.2584776, 1, 0, 0, 1, 1,
-1.035368, -0.438637, -1.762299, 1, 0, 0, 1, 1,
-1.032149, 0.9278293, -1.486439, 0, 0, 0, 1, 1,
-1.029082, -0.3021985, -3.864771, 0, 0, 0, 1, 1,
-1.021909, 0.408648, -0.9909269, 0, 0, 0, 1, 1,
-1.015672, -1.53461, -3.354118, 0, 0, 0, 1, 1,
-1.013657, -0.4261668, -1.74045, 0, 0, 0, 1, 1,
-1.011821, -0.590501, -2.859642, 0, 0, 0, 1, 1,
-1.01031, -1.630178, -2.2446, 0, 0, 0, 1, 1,
-1.007784, -0.798904, -0.543314, 1, 1, 1, 1, 1,
-1.006993, -0.6755497, -1.28018, 1, 1, 1, 1, 1,
-1.001538, -1.450826, -3.501372, 1, 1, 1, 1, 1,
-1.000879, 0.6173614, -0.2241854, 1, 1, 1, 1, 1,
-0.9984244, -1.113524, -1.305178, 1, 1, 1, 1, 1,
-0.9938099, 0.6953329, -1.43755, 1, 1, 1, 1, 1,
-0.9914318, -0.2210534, -1.432434, 1, 1, 1, 1, 1,
-0.9910895, -0.8931538, -1.007351, 1, 1, 1, 1, 1,
-0.9890326, 0.5005848, -1.867319, 1, 1, 1, 1, 1,
-0.984476, -2.449504, -0.8385085, 1, 1, 1, 1, 1,
-0.9798951, -1.190556, -0.7185689, 1, 1, 1, 1, 1,
-0.9780968, 0.01861347, -3.341166, 1, 1, 1, 1, 1,
-0.9701248, -0.6749384, -1.934178, 1, 1, 1, 1, 1,
-0.9624612, -1.50032, -1.447174, 1, 1, 1, 1, 1,
-0.9600563, -0.1947909, -2.219205, 1, 1, 1, 1, 1,
-0.9545496, -1.233912, -1.296028, 0, 0, 1, 1, 1,
-0.9536955, 0.9002368, -0.020978, 1, 0, 0, 1, 1,
-0.9485026, -0.8853288, -1.726918, 1, 0, 0, 1, 1,
-0.9462454, -1.023796, -1.425761, 1, 0, 0, 1, 1,
-0.9396508, 0.2177614, -0.9509913, 1, 0, 0, 1, 1,
-0.916854, -1.257162, -1.269179, 1, 0, 0, 1, 1,
-0.9126446, 1.581196, 0.0220766, 0, 0, 0, 1, 1,
-0.9106778, 0.9354169, -2.286066, 0, 0, 0, 1, 1,
-0.9063079, -0.2448819, -1.27394, 0, 0, 0, 1, 1,
-0.8960344, 0.5781606, -2.722314, 0, 0, 0, 1, 1,
-0.8947276, -1.806679, -4.293104, 0, 0, 0, 1, 1,
-0.8913994, 0.5233954, 0.5981922, 0, 0, 0, 1, 1,
-0.8828367, -1.610447, -3.031656, 0, 0, 0, 1, 1,
-0.8817065, -0.3598776, -2.613325, 1, 1, 1, 1, 1,
-0.8772209, 0.5880107, 0.4922435, 1, 1, 1, 1, 1,
-0.8763092, 0.01121816, -1.323257, 1, 1, 1, 1, 1,
-0.8749287, 0.4824505, -0.1492879, 1, 1, 1, 1, 1,
-0.8660185, -1.635967, -2.96175, 1, 1, 1, 1, 1,
-0.8610364, 0.4631284, -0.5198123, 1, 1, 1, 1, 1,
-0.8587083, -1.23554, -2.429836, 1, 1, 1, 1, 1,
-0.8574959, 0.6008352, 0.6714962, 1, 1, 1, 1, 1,
-0.8408302, 1.217373, -2.383447, 1, 1, 1, 1, 1,
-0.8332158, -0.7995118, -1.738852, 1, 1, 1, 1, 1,
-0.8318067, -0.2969163, -0.4470164, 1, 1, 1, 1, 1,
-0.8298651, 1.51828, -0.1245099, 1, 1, 1, 1, 1,
-0.8285165, -0.6928568, -3.454138, 1, 1, 1, 1, 1,
-0.8279403, -0.7776868, -1.21468, 1, 1, 1, 1, 1,
-0.8277586, 0.5149388, -1.180041, 1, 1, 1, 1, 1,
-0.8242439, 0.7102169, -1.011061, 0, 0, 1, 1, 1,
-0.8233978, 1.223852, 0.008216105, 1, 0, 0, 1, 1,
-0.8227614, 0.1071752, -2.049066, 1, 0, 0, 1, 1,
-0.8181452, -1.184394, -3.07267, 1, 0, 0, 1, 1,
-0.8158142, -1.310634, -1.990014, 1, 0, 0, 1, 1,
-0.8150196, 0.4885158, -2.708353, 1, 0, 0, 1, 1,
-0.8106394, -0.7938846, -2.11507, 0, 0, 0, 1, 1,
-0.8077057, -0.1354718, -0.2562329, 0, 0, 0, 1, 1,
-0.8045197, -0.2217056, -2.516198, 0, 0, 0, 1, 1,
-0.8038275, 1.940969, -0.5342556, 0, 0, 0, 1, 1,
-0.7958041, 1.044519, 0.05067079, 0, 0, 0, 1, 1,
-0.7944221, -1.782256, -1.903952, 0, 0, 0, 1, 1,
-0.7843847, -1.436737, -2.542573, 0, 0, 0, 1, 1,
-0.7681747, 1.120999, 0.06943414, 1, 1, 1, 1, 1,
-0.7666813, -1.536214, -2.153085, 1, 1, 1, 1, 1,
-0.7654716, -0.7685231, -1.370574, 1, 1, 1, 1, 1,
-0.760348, 0.6494591, 0.4266319, 1, 1, 1, 1, 1,
-0.7565281, 0.05904634, -2.362474, 1, 1, 1, 1, 1,
-0.7535155, 1.624782, -2.128145, 1, 1, 1, 1, 1,
-0.7476373, -1.342117, -3.037956, 1, 1, 1, 1, 1,
-0.7475875, -1.553828, -1.15532, 1, 1, 1, 1, 1,
-0.7427114, -1.375341, -1.360171, 1, 1, 1, 1, 1,
-0.7375928, -0.3475741, -3.10167, 1, 1, 1, 1, 1,
-0.7336195, -1.390119, -0.6999699, 1, 1, 1, 1, 1,
-0.731294, 0.960961, 0.1113981, 1, 1, 1, 1, 1,
-0.7288042, 1.459106, -1.879758, 1, 1, 1, 1, 1,
-0.7287803, 0.591652, -2.090004, 1, 1, 1, 1, 1,
-0.7237429, 0.5006404, -1.146519, 1, 1, 1, 1, 1,
-0.7231706, 0.6641591, -3.147254, 0, 0, 1, 1, 1,
-0.7194629, 0.6649358, -1.266153, 1, 0, 0, 1, 1,
-0.7154245, 0.4203651, -2.442328, 1, 0, 0, 1, 1,
-0.7153124, 0.7702276, 0.6544403, 1, 0, 0, 1, 1,
-0.7145351, -0.2666064, -1.051476, 1, 0, 0, 1, 1,
-0.7127572, -1.092348, -0.8369663, 1, 0, 0, 1, 1,
-0.7025488, 0.001913137, -1.165216, 0, 0, 0, 1, 1,
-0.700455, 1.742262, -0.3608431, 0, 0, 0, 1, 1,
-0.6939165, -1.322665, -2.007991, 0, 0, 0, 1, 1,
-0.6875971, -1.357839, -3.346343, 0, 0, 0, 1, 1,
-0.6801496, 0.2925579, -0.1125543, 0, 0, 0, 1, 1,
-0.6743631, -0.5028262, -2.746605, 0, 0, 0, 1, 1,
-0.6705049, -1.766594, -2.873006, 0, 0, 0, 1, 1,
-0.662082, 1.457188, 0.08177418, 1, 1, 1, 1, 1,
-0.6620461, 0.2373382, -1.310097, 1, 1, 1, 1, 1,
-0.6456523, -0.3004368, -3.272937, 1, 1, 1, 1, 1,
-0.6427864, 1.903532, -2.878081, 1, 1, 1, 1, 1,
-0.6398351, -1.274318, -1.787197, 1, 1, 1, 1, 1,
-0.6382082, 1.631986, -0.3886924, 1, 1, 1, 1, 1,
-0.636142, -2.239136, -3.17825, 1, 1, 1, 1, 1,
-0.6337246, -1.244916, -3.154085, 1, 1, 1, 1, 1,
-0.6330771, -2.659009, -3.686218, 1, 1, 1, 1, 1,
-0.6329729, -0.4969273, -1.285849, 1, 1, 1, 1, 1,
-0.6271152, -0.1984111, -3.518406, 1, 1, 1, 1, 1,
-0.6179293, -0.3569958, -2.055613, 1, 1, 1, 1, 1,
-0.6168171, 0.597024, -0.3511151, 1, 1, 1, 1, 1,
-0.6083065, 1.229407, -0.1620474, 1, 1, 1, 1, 1,
-0.6067086, -0.314723, -3.20083, 1, 1, 1, 1, 1,
-0.5904658, 0.1235281, -1.630968, 0, 0, 1, 1, 1,
-0.5875371, -0.06142552, -2.056006, 1, 0, 0, 1, 1,
-0.5838589, 0.7149356, -1.586195, 1, 0, 0, 1, 1,
-0.5819589, 1.149457, -0.655918, 1, 0, 0, 1, 1,
-0.5793211, 0.1912858, -0.3196703, 1, 0, 0, 1, 1,
-0.5755537, 0.003211252, -0.5337308, 1, 0, 0, 1, 1,
-0.5742969, 0.01459656, -1.655529, 0, 0, 0, 1, 1,
-0.5731907, -0.2700424, -2.833669, 0, 0, 0, 1, 1,
-0.5712649, 0.726061, -1.130532, 0, 0, 0, 1, 1,
-0.5630574, -0.1842641, -1.697943, 0, 0, 0, 1, 1,
-0.5579861, 0.7417451, -1.323598, 0, 0, 0, 1, 1,
-0.548939, -0.3649295, -0.5841398, 0, 0, 0, 1, 1,
-0.5480228, 0.1043648, -2.646101, 0, 0, 0, 1, 1,
-0.5457522, -0.1859771, -0.8395257, 1, 1, 1, 1, 1,
-0.5417001, 1.955112, 0.4037101, 1, 1, 1, 1, 1,
-0.5414404, -0.7058843, -1.813371, 1, 1, 1, 1, 1,
-0.532451, -0.9165787, -4.132401, 1, 1, 1, 1, 1,
-0.5318882, 0.1557859, 0.7659736, 1, 1, 1, 1, 1,
-0.5291911, -0.1386143, -0.6823542, 1, 1, 1, 1, 1,
-0.5283927, -1.093691, -2.263159, 1, 1, 1, 1, 1,
-0.5278369, -1.241672, -3.141377, 1, 1, 1, 1, 1,
-0.5270613, 0.4379277, -0.7290843, 1, 1, 1, 1, 1,
-0.5248356, 0.6227441, -0.2367948, 1, 1, 1, 1, 1,
-0.5240903, 0.2026094, -0.7859852, 1, 1, 1, 1, 1,
-0.5232104, -0.2638646, -2.391573, 1, 1, 1, 1, 1,
-0.5230349, 0.4615451, 1.733982, 1, 1, 1, 1, 1,
-0.5215236, -1.809953, -3.20727, 1, 1, 1, 1, 1,
-0.5179907, -0.7829216, -3.857516, 1, 1, 1, 1, 1,
-0.5178075, -0.574318, -2.465656, 0, 0, 1, 1, 1,
-0.517425, -1.878021, -4.161638, 1, 0, 0, 1, 1,
-0.5157992, 1.902184, -0.1425844, 1, 0, 0, 1, 1,
-0.5121565, 0.8451011, 0.3866186, 1, 0, 0, 1, 1,
-0.5080881, 1.441132, -0.08670012, 1, 0, 0, 1, 1,
-0.5079939, -0.02396964, -1.115677, 1, 0, 0, 1, 1,
-0.5065142, -1.052671, -3.42716, 0, 0, 0, 1, 1,
-0.5036438, 0.0243702, -0.6403763, 0, 0, 0, 1, 1,
-0.4984851, -1.117012, -3.502296, 0, 0, 0, 1, 1,
-0.4976682, 1.953451, -0.3459288, 0, 0, 0, 1, 1,
-0.4935658, 0.1315221, -1.773545, 0, 0, 0, 1, 1,
-0.4933764, 1.343909, 0.1934941, 0, 0, 0, 1, 1,
-0.4884234, 0.9103298, 0.5542755, 0, 0, 0, 1, 1,
-0.4865112, 0.6732857, -0.0006812402, 1, 1, 1, 1, 1,
-0.4726613, 0.6294107, 0.2389641, 1, 1, 1, 1, 1,
-0.4724437, 0.09395752, -2.108565, 1, 1, 1, 1, 1,
-0.4719774, 0.3171466, -1.665496, 1, 1, 1, 1, 1,
-0.4672469, -0.771408, -4.072397, 1, 1, 1, 1, 1,
-0.4616428, -0.499474, -3.651176, 1, 1, 1, 1, 1,
-0.4616076, -1.333517, -1.740616, 1, 1, 1, 1, 1,
-0.4615284, 0.2065135, -0.8190401, 1, 1, 1, 1, 1,
-0.4602983, 0.7011762, -1.428946, 1, 1, 1, 1, 1,
-0.4484718, -0.2730726, -1.003909, 1, 1, 1, 1, 1,
-0.4410696, -0.392483, -1.569905, 1, 1, 1, 1, 1,
-0.4388144, -1.116849, -2.85242, 1, 1, 1, 1, 1,
-0.4349376, -0.6918631, -1.660188, 1, 1, 1, 1, 1,
-0.4322441, -0.5834386, -0.9752479, 1, 1, 1, 1, 1,
-0.4315965, -0.1260536, -3.320706, 1, 1, 1, 1, 1,
-0.4259529, 0.2714926, -0.9006628, 0, 0, 1, 1, 1,
-0.4255735, 0.4723641, -0.3847752, 1, 0, 0, 1, 1,
-0.4250629, -0.815845, -3.512047, 1, 0, 0, 1, 1,
-0.4232716, 0.5817742, -0.7924245, 1, 0, 0, 1, 1,
-0.419246, -0.3589034, -1.312782, 1, 0, 0, 1, 1,
-0.4138579, 1.294107, 0.006965994, 1, 0, 0, 1, 1,
-0.4117744, -0.8886752, -3.743869, 0, 0, 0, 1, 1,
-0.409529, -1.062512, -2.05293, 0, 0, 0, 1, 1,
-0.4060468, 1.12106, 0.5195246, 0, 0, 0, 1, 1,
-0.4043039, -2.323591, -2.982466, 0, 0, 0, 1, 1,
-0.4028258, -0.4963181, -1.129393, 0, 0, 0, 1, 1,
-0.4003418, 2.444941, -2.346166, 0, 0, 0, 1, 1,
-0.399357, 0.7040843, -1.898968, 0, 0, 0, 1, 1,
-0.398127, -0.1143518, -2.429286, 1, 1, 1, 1, 1,
-0.3950155, -0.3286012, -1.812003, 1, 1, 1, 1, 1,
-0.3947538, -0.6239913, -3.685551, 1, 1, 1, 1, 1,
-0.3939283, -0.5890787, -1.485303, 1, 1, 1, 1, 1,
-0.39319, 0.967258, 0.2683688, 1, 1, 1, 1, 1,
-0.3915338, 1.297085, 0.202335, 1, 1, 1, 1, 1,
-0.3840053, 0.199121, -1.016692, 1, 1, 1, 1, 1,
-0.3825439, 0.1913596, -2.613512, 1, 1, 1, 1, 1,
-0.3765582, -0.5644135, -4.630812, 1, 1, 1, 1, 1,
-0.3749363, -1.302786, -2.47788, 1, 1, 1, 1, 1,
-0.3749045, -1.185501, -1.699991, 1, 1, 1, 1, 1,
-0.3691901, -1.014724, -3.080606, 1, 1, 1, 1, 1,
-0.3667027, -0.9071287, -1.179176, 1, 1, 1, 1, 1,
-0.3596275, 2.490106, -2.056159, 1, 1, 1, 1, 1,
-0.3522691, 1.372634, -0.06808868, 1, 1, 1, 1, 1,
-0.3412529, 1.319883, -1.773265, 0, 0, 1, 1, 1,
-0.3412009, 1.113916, -0.7834625, 1, 0, 0, 1, 1,
-0.3398832, 0.05909913, -2.293954, 1, 0, 0, 1, 1,
-0.328153, 0.642373, 0.2443077, 1, 0, 0, 1, 1,
-0.3242931, 0.7637318, 0.8061859, 1, 0, 0, 1, 1,
-0.3234705, -2.418165, -2.612888, 1, 0, 0, 1, 1,
-0.3200181, -0.04416319, -2.483212, 0, 0, 0, 1, 1,
-0.3187396, -1.427616, -2.250174, 0, 0, 0, 1, 1,
-0.3147554, -1.357881, -3.734336, 0, 0, 0, 1, 1,
-0.3122302, -0.5345265, -3.319279, 0, 0, 0, 1, 1,
-0.3103488, 1.15143, -0.0258395, 0, 0, 0, 1, 1,
-0.3083903, -0.6461982, -3.566895, 0, 0, 0, 1, 1,
-0.3029923, 0.9419814, -0.4407154, 0, 0, 0, 1, 1,
-0.3000462, -1.156841, -3.814883, 1, 1, 1, 1, 1,
-0.2984965, -0.1862146, -0.7690904, 1, 1, 1, 1, 1,
-0.2962104, 0.2921414, -1.491907, 1, 1, 1, 1, 1,
-0.294511, 0.4135017, -1.604379, 1, 1, 1, 1, 1,
-0.2910784, -0.4527316, -2.277965, 1, 1, 1, 1, 1,
-0.2885905, 0.6391956, -0.015809, 1, 1, 1, 1, 1,
-0.2759395, 1.646043, -1.764421, 1, 1, 1, 1, 1,
-0.2741751, -2.613564, -2.82798, 1, 1, 1, 1, 1,
-0.2737961, -0.5654733, -0.3879983, 1, 1, 1, 1, 1,
-0.2711841, -0.6450309, -3.175769, 1, 1, 1, 1, 1,
-0.2701471, -0.8389174, -1.854542, 1, 1, 1, 1, 1,
-0.2700861, 1.414828, -0.009812876, 1, 1, 1, 1, 1,
-0.2693166, 0.965572, 0.07096128, 1, 1, 1, 1, 1,
-0.2685991, 0.8453041, 0.5650847, 1, 1, 1, 1, 1,
-0.2669424, -0.2538533, -1.151962, 1, 1, 1, 1, 1,
-0.2662396, -1.155911, -3.334625, 0, 0, 1, 1, 1,
-0.265914, 0.7906337, -1.322622, 1, 0, 0, 1, 1,
-0.2610877, 0.2311247, -1.022654, 1, 0, 0, 1, 1,
-0.2564368, -0.01955711, -3.35054, 1, 0, 0, 1, 1,
-0.2551386, -1.030184, -3.415619, 1, 0, 0, 1, 1,
-0.2538474, -0.3032793, -2.200135, 1, 0, 0, 1, 1,
-0.2463427, -1.182775, -4.609021, 0, 0, 0, 1, 1,
-0.2449344, -0.5924393, -2.642736, 0, 0, 0, 1, 1,
-0.2447556, -0.9819926, -4.02923, 0, 0, 0, 1, 1,
-0.2384077, -0.7814075, -3.793127, 0, 0, 0, 1, 1,
-0.2356734, 1.183091, 0.5645667, 0, 0, 0, 1, 1,
-0.2352659, -0.3110753, -3.567636, 0, 0, 0, 1, 1,
-0.234138, -1.498412, -3.106892, 0, 0, 0, 1, 1,
-0.2250968, 0.1389156, -0.6644327, 1, 1, 1, 1, 1,
-0.2240757, -0.4511061, -3.529027, 1, 1, 1, 1, 1,
-0.2225564, -0.4046654, -2.995493, 1, 1, 1, 1, 1,
-0.2193989, 0.2761158, -0.03417136, 1, 1, 1, 1, 1,
-0.2168468, 0.04662249, -2.743784, 1, 1, 1, 1, 1,
-0.2155441, -1.266896, -2.58898, 1, 1, 1, 1, 1,
-0.21554, 0.5387936, 0.7166492, 1, 1, 1, 1, 1,
-0.2027928, -0.6083179, -5.024489, 1, 1, 1, 1, 1,
-0.199793, -0.9988561, -3.050971, 1, 1, 1, 1, 1,
-0.1991906, -1.57088, -1.225638, 1, 1, 1, 1, 1,
-0.1989364, 0.1505859, -2.003665, 1, 1, 1, 1, 1,
-0.1983736, -1.142409, -3.624694, 1, 1, 1, 1, 1,
-0.1920106, -0.5375467, -4.139436, 1, 1, 1, 1, 1,
-0.1905724, -0.9187303, -3.371348, 1, 1, 1, 1, 1,
-0.1880776, 0.663262, 0.4314539, 1, 1, 1, 1, 1,
-0.1859834, -1.901556, -2.475232, 0, 0, 1, 1, 1,
-0.1858588, 0.04934035, -1.341829, 1, 0, 0, 1, 1,
-0.1839364, 0.2698946, 0.4589426, 1, 0, 0, 1, 1,
-0.1829534, -0.08412746, -2.203285, 1, 0, 0, 1, 1,
-0.1817691, 1.208768, -0.4267776, 1, 0, 0, 1, 1,
-0.178661, 0.9481387, -1.616656, 1, 0, 0, 1, 1,
-0.1785574, 0.1573121, -2.274169, 0, 0, 0, 1, 1,
-0.177052, -0.6167145, -2.145449, 0, 0, 0, 1, 1,
-0.1765504, 0.6976217, 0.7469125, 0, 0, 0, 1, 1,
-0.1717149, 0.8466504, -0.1176534, 0, 0, 0, 1, 1,
-0.1701902, -0.2709422, -2.411524, 0, 0, 0, 1, 1,
-0.1663966, -1.698478, -2.139538, 0, 0, 0, 1, 1,
-0.1658152, 1.048785, 1.005261, 0, 0, 0, 1, 1,
-0.1654575, -1.34952, -4.080347, 1, 1, 1, 1, 1,
-0.1603764, 1.273452, -0.4774418, 1, 1, 1, 1, 1,
-0.1584383, 0.3177946, 0.04091361, 1, 1, 1, 1, 1,
-0.1580677, 2.112422, 0.3094891, 1, 1, 1, 1, 1,
-0.1551453, 0.8995334, -0.5635357, 1, 1, 1, 1, 1,
-0.152239, 1.271543, 0.3497132, 1, 1, 1, 1, 1,
-0.1482559, 1.052888, -2.71219, 1, 1, 1, 1, 1,
-0.1463, -0.2885737, -3.904422, 1, 1, 1, 1, 1,
-0.1423312, -0.5750926, -3.618719, 1, 1, 1, 1, 1,
-0.1395719, -1.054264, -2.917346, 1, 1, 1, 1, 1,
-0.13349, 0.0952756, -1.801094, 1, 1, 1, 1, 1,
-0.1332432, 0.9119766, -1.702207, 1, 1, 1, 1, 1,
-0.1328237, 0.4647181, -0.1421621, 1, 1, 1, 1, 1,
-0.1320666, 0.9370975, 0.1810663, 1, 1, 1, 1, 1,
-0.1299772, -0.9828501, -3.368406, 1, 1, 1, 1, 1,
-0.1266795, 0.5930642, 0.1239936, 0, 0, 1, 1, 1,
-0.1256623, 2.633682, -1.023729, 1, 0, 0, 1, 1,
-0.1248975, 0.3669193, -0.3820061, 1, 0, 0, 1, 1,
-0.1238648, 0.3155646, -0.2441465, 1, 0, 0, 1, 1,
-0.1207136, 1.426764, 0.9933335, 1, 0, 0, 1, 1,
-0.1179155, -0.4339179, -3.238397, 1, 0, 0, 1, 1,
-0.1155422, 0.7650949, 0.7670696, 0, 0, 0, 1, 1,
-0.1149175, -0.8739944, -5.336797, 0, 0, 0, 1, 1,
-0.1123461, -1.091281, -3.856217, 0, 0, 0, 1, 1,
-0.1082984, 0.1612768, -0.4317942, 0, 0, 0, 1, 1,
-0.1071649, -0.01057769, 0.3665139, 0, 0, 0, 1, 1,
-0.1067778, -0.2220219, -3.595148, 0, 0, 0, 1, 1,
-0.1060865, -0.4823799, -2.267462, 0, 0, 0, 1, 1,
-0.1011935, -1.428491, -5.050345, 1, 1, 1, 1, 1,
-0.1001947, 1.146833, 0.6507453, 1, 1, 1, 1, 1,
-0.0986075, -0.656984, -2.495732, 1, 1, 1, 1, 1,
-0.09777053, -0.4336697, -4.21598, 1, 1, 1, 1, 1,
-0.09776963, -0.01950388, -1.078434, 1, 1, 1, 1, 1,
-0.09703591, 0.8605163, -1.068204, 1, 1, 1, 1, 1,
-0.09696173, 0.543326, -1.269655, 1, 1, 1, 1, 1,
-0.09514488, -0.9452869, -2.800382, 1, 1, 1, 1, 1,
-0.08720843, -0.7722849, -3.076351, 1, 1, 1, 1, 1,
-0.08619878, -0.5794538, -4.590965, 1, 1, 1, 1, 1,
-0.08504738, 0.6810471, -1.105778, 1, 1, 1, 1, 1,
-0.08381113, 0.9598387, -1.336332, 1, 1, 1, 1, 1,
-0.08000131, 0.9413626, -0.2646497, 1, 1, 1, 1, 1,
-0.07591955, 1.408254, -0.9855729, 1, 1, 1, 1, 1,
-0.07555, -2.031329, -1.879802, 1, 1, 1, 1, 1,
-0.0721269, -0.7033178, -2.022581, 0, 0, 1, 1, 1,
-0.07121913, -0.3601593, -1.709748, 1, 0, 0, 1, 1,
-0.06880372, 0.9020648, 0.04850363, 1, 0, 0, 1, 1,
-0.06719378, 0.3894389, -1.082959, 1, 0, 0, 1, 1,
-0.0671496, 0.7890394, 0.6979548, 1, 0, 0, 1, 1,
-0.06671934, 0.1802827, 2.240943, 1, 0, 0, 1, 1,
-0.06645045, -0.3094478, -3.390296, 0, 0, 0, 1, 1,
-0.06277782, -0.5695779, -3.073388, 0, 0, 0, 1, 1,
-0.05937659, 0.2827658, -0.4961427, 0, 0, 0, 1, 1,
-0.05766191, 0.6303085, -1.483547, 0, 0, 0, 1, 1,
-0.05118727, -1.323354, -4.249793, 0, 0, 0, 1, 1,
-0.04707991, 0.9689504, 0.2877038, 0, 0, 0, 1, 1,
-0.04340138, -0.7924287, -3.077608, 0, 0, 0, 1, 1,
-0.04255255, -0.3355834, -1.775487, 1, 1, 1, 1, 1,
-0.03896624, -1.296759, -3.988686, 1, 1, 1, 1, 1,
-0.03797254, -0.3443358, -2.317382, 1, 1, 1, 1, 1,
-0.03739844, 1.417405, -0.02675146, 1, 1, 1, 1, 1,
-0.03125574, 0.01374473, -0.435796, 1, 1, 1, 1, 1,
-0.0285044, 0.8896021, 0.9262288, 1, 1, 1, 1, 1,
-0.02756352, -0.478444, -3.051074, 1, 1, 1, 1, 1,
-0.0261677, -0.1191118, -2.357723, 1, 1, 1, 1, 1,
-0.02204186, -0.5576922, -3.087083, 1, 1, 1, 1, 1,
-0.02093192, -0.1774824, -3.204661, 1, 1, 1, 1, 1,
-0.02022556, 0.1049197, -0.3574282, 1, 1, 1, 1, 1,
-0.01774801, -0.1908239, -2.677017, 1, 1, 1, 1, 1,
-0.01615611, -0.9859699, -4.387534, 1, 1, 1, 1, 1,
-0.01352173, -1.725415, -2.00877, 1, 1, 1, 1, 1,
-0.008616708, -0.2738432, -4.83442, 1, 1, 1, 1, 1,
-0.0059797, 2.099069, 0.08477972, 0, 0, 1, 1, 1,
-0.005716168, 0.1567616, 0.6809068, 1, 0, 0, 1, 1,
-0.003827951, 0.2770036, 1.500615, 1, 0, 0, 1, 1,
-0.003747635, 0.9749209, 1.539249, 1, 0, 0, 1, 1,
0.002502863, -0.6766679, 2.79371, 1, 0, 0, 1, 1,
0.003418233, 1.287315, 0.3518319, 1, 0, 0, 1, 1,
0.007818748, -0.644069, 2.24837, 0, 0, 0, 1, 1,
0.008027446, -1.433992, 3.970611, 0, 0, 0, 1, 1,
0.0101128, -1.287605, 3.892897, 0, 0, 0, 1, 1,
0.01430312, 0.2917791, -0.7255844, 0, 0, 0, 1, 1,
0.02021539, -0.03133191, 2.486851, 0, 0, 0, 1, 1,
0.0248724, 0.5476437, 1.451047, 0, 0, 0, 1, 1,
0.02743524, 0.5652345, 1.242025, 0, 0, 0, 1, 1,
0.02987302, 1.27308, -0.6398219, 1, 1, 1, 1, 1,
0.03152809, 0.9406139, 0.3464535, 1, 1, 1, 1, 1,
0.0315516, -1.07031, 1.488664, 1, 1, 1, 1, 1,
0.03274803, -0.2656532, 3.970436, 1, 1, 1, 1, 1,
0.03654089, 1.14096, 0.2714594, 1, 1, 1, 1, 1,
0.037068, -1.122487, 2.174664, 1, 1, 1, 1, 1,
0.03853747, -0.430278, 2.874463, 1, 1, 1, 1, 1,
0.04018374, 1.447722, 0.5769347, 1, 1, 1, 1, 1,
0.04315931, -0.2018062, 3.739614, 1, 1, 1, 1, 1,
0.04528525, 0.8076977, -1.140889, 1, 1, 1, 1, 1,
0.046765, 0.04982539, -0.8142787, 1, 1, 1, 1, 1,
0.05252831, 0.8986839, 0.1035131, 1, 1, 1, 1, 1,
0.05283981, -0.0535822, 1.038721, 1, 1, 1, 1, 1,
0.05486206, -0.4811334, 2.549029, 1, 1, 1, 1, 1,
0.05535, -1.274886, 3.878664, 1, 1, 1, 1, 1,
0.05616729, 1.341804, 2.021181, 0, 0, 1, 1, 1,
0.05632837, -0.110363, 2.39927, 1, 0, 0, 1, 1,
0.05799751, -1.461046, 4.968017, 1, 0, 0, 1, 1,
0.06052312, -1.273974, 4.038824, 1, 0, 0, 1, 1,
0.0621662, -0.2900637, 3.320157, 1, 0, 0, 1, 1,
0.06674827, 0.3122238, 1.333918, 1, 0, 0, 1, 1,
0.06816182, 2.325921, -0.3226863, 0, 0, 0, 1, 1,
0.06963026, 1.492808, -0.7131037, 0, 0, 0, 1, 1,
0.07181121, -0.5615575, 3.713872, 0, 0, 0, 1, 1,
0.07296579, 0.8670147, 1.299823, 0, 0, 0, 1, 1,
0.07528718, 0.6485648, 0.2247177, 0, 0, 0, 1, 1,
0.07893848, -1.782441, 3.437362, 0, 0, 0, 1, 1,
0.08024555, -1.056996, 2.258332, 0, 0, 0, 1, 1,
0.08180816, 0.4813806, 0.2680856, 1, 1, 1, 1, 1,
0.08634007, -0.1057688, 4.688031, 1, 1, 1, 1, 1,
0.09064852, 0.1477608, 0.6892033, 1, 1, 1, 1, 1,
0.09092855, -0.4553899, 1.762212, 1, 1, 1, 1, 1,
0.09137427, 0.4323498, -1.432438, 1, 1, 1, 1, 1,
0.09157258, -0.3348434, 1.576827, 1, 1, 1, 1, 1,
0.09170317, 0.2581747, 1.482523, 1, 1, 1, 1, 1,
0.09262547, -0.00126836, 2.122707, 1, 1, 1, 1, 1,
0.09861271, 2.176882, -0.2875675, 1, 1, 1, 1, 1,
0.1018448, 1.206109, -0.1033636, 1, 1, 1, 1, 1,
0.1082961, 0.1694069, 0.1541941, 1, 1, 1, 1, 1,
0.1136597, 0.3350924, -0.1047722, 1, 1, 1, 1, 1,
0.1160291, -0.5202599, 3.267435, 1, 1, 1, 1, 1,
0.1172078, -1.409709, 3.455792, 1, 1, 1, 1, 1,
0.1180074, 0.5154535, 1.03703, 1, 1, 1, 1, 1,
0.1236303, 0.3656217, 1.166735, 0, 0, 1, 1, 1,
0.1249006, -0.4149824, 4.29723, 1, 0, 0, 1, 1,
0.1257272, 0.2255132, -0.2599625, 1, 0, 0, 1, 1,
0.1275309, 0.7815802, 0.4856369, 1, 0, 0, 1, 1,
0.1294572, 0.2291717, -0.3174922, 1, 0, 0, 1, 1,
0.1297496, 0.6022019, 0.7248449, 1, 0, 0, 1, 1,
0.129907, -0.9475805, 3.015876, 0, 0, 0, 1, 1,
0.1337595, -0.5841284, 1.598507, 0, 0, 0, 1, 1,
0.1349986, -0.2703691, 2.98271, 0, 0, 0, 1, 1,
0.1442738, 0.8700876, 2.617598, 0, 0, 0, 1, 1,
0.1445674, 0.2490848, 0.490527, 0, 0, 0, 1, 1,
0.1457529, 1.483786, 0.3603555, 0, 0, 0, 1, 1,
0.1482535, 0.1518885, 2.173831, 0, 0, 0, 1, 1,
0.1492712, -0.9339124, 4.225996, 1, 1, 1, 1, 1,
0.1494234, 0.107971, 1.790001, 1, 1, 1, 1, 1,
0.1494468, 0.2116991, 2.219406, 1, 1, 1, 1, 1,
0.1520504, 0.2025364, 0.5498941, 1, 1, 1, 1, 1,
0.1523331, -0.6417111, 4.921311, 1, 1, 1, 1, 1,
0.1540145, 1.511625, 0.2040164, 1, 1, 1, 1, 1,
0.1569153, -0.7864593, 2.210855, 1, 1, 1, 1, 1,
0.1578952, 1.570607, 1.645114, 1, 1, 1, 1, 1,
0.1619197, -1.914516, 2.482273, 1, 1, 1, 1, 1,
0.1627403, 0.1637857, 1.753261, 1, 1, 1, 1, 1,
0.1664584, 0.2720284, -0.5068195, 1, 1, 1, 1, 1,
0.1665819, -0.2316406, 2.532765, 1, 1, 1, 1, 1,
0.1674892, 1.35577, -0.9772458, 1, 1, 1, 1, 1,
0.1779282, -0.7373133, 3.402694, 1, 1, 1, 1, 1,
0.1808237, -0.8137271, 1.396106, 1, 1, 1, 1, 1,
0.1856809, 0.5576355, -0.2972797, 0, 0, 1, 1, 1,
0.1865324, 0.6021789, 0.08866719, 1, 0, 0, 1, 1,
0.1887167, -2.294383, 1.129741, 1, 0, 0, 1, 1,
0.1934571, 0.7866946, 0.6689013, 1, 0, 0, 1, 1,
0.1986036, 0.7896465, -0.2763128, 1, 0, 0, 1, 1,
0.2012395, 0.6577794, -1.342515, 1, 0, 0, 1, 1,
0.2040999, 1.522234, 0.08024386, 0, 0, 0, 1, 1,
0.2085436, 1.086709, 1.43382, 0, 0, 0, 1, 1,
0.2126454, 0.02304956, 1.728836, 0, 0, 0, 1, 1,
0.2136585, -0.8406749, 2.241288, 0, 0, 0, 1, 1,
0.2136594, -1.451957, 4.157137, 0, 0, 0, 1, 1,
0.2170991, 0.7029486, 1.502063, 0, 0, 0, 1, 1,
0.2198133, 0.5989951, 2.436262, 0, 0, 0, 1, 1,
0.2231309, -0.5091071, 1.955035, 1, 1, 1, 1, 1,
0.2236635, 0.1087522, 0.7758566, 1, 1, 1, 1, 1,
0.2260514, 0.4356206, 0.5581203, 1, 1, 1, 1, 1,
0.228824, 0.2729136, 0.5048296, 1, 1, 1, 1, 1,
0.2303577, 0.3687097, 0.7056977, 1, 1, 1, 1, 1,
0.2305711, -0.4171229, 4.164132, 1, 1, 1, 1, 1,
0.2379597, 1.310585, 0.5844341, 1, 1, 1, 1, 1,
0.2410213, 1.304708, 0.06173785, 1, 1, 1, 1, 1,
0.247507, -0.2437316, 1.478329, 1, 1, 1, 1, 1,
0.2504466, -1.104096, 2.788436, 1, 1, 1, 1, 1,
0.2513129, -1.006571, 4.120585, 1, 1, 1, 1, 1,
0.2540964, 0.6477678, -0.637499, 1, 1, 1, 1, 1,
0.2544313, -1.384971, 4.152224, 1, 1, 1, 1, 1,
0.2604251, -0.2538135, 3.988071, 1, 1, 1, 1, 1,
0.262792, -0.9000984, 1.405412, 1, 1, 1, 1, 1,
0.2629109, -0.3093319, 2.508874, 0, 0, 1, 1, 1,
0.2642016, -0.5474045, 1.739831, 1, 0, 0, 1, 1,
0.2656876, 0.5309315, 0.8924456, 1, 0, 0, 1, 1,
0.2657687, 0.1309687, 0.9559702, 1, 0, 0, 1, 1,
0.2671774, 0.8212187, -0.1937962, 1, 0, 0, 1, 1,
0.2698932, 0.172114, 1.532933, 1, 0, 0, 1, 1,
0.2723018, -0.163013, 3.963375, 0, 0, 0, 1, 1,
0.2761402, 0.5718589, -0.06317154, 0, 0, 0, 1, 1,
0.2792961, -0.9172433, 5.139987, 0, 0, 0, 1, 1,
0.2844988, 0.1638031, 1.364176, 0, 0, 0, 1, 1,
0.2858889, 1.262938, -0.1069171, 0, 0, 0, 1, 1,
0.2864636, -2.001402, 0.963864, 0, 0, 0, 1, 1,
0.2873706, 1.857406, 1.273587, 0, 0, 0, 1, 1,
0.2882487, -0.2885556, 1.770864, 1, 1, 1, 1, 1,
0.2916174, 2.340244, -0.2616747, 1, 1, 1, 1, 1,
0.2935501, 1.376285, 1.901965, 1, 1, 1, 1, 1,
0.2971942, -0.5866775, 2.950596, 1, 1, 1, 1, 1,
0.2992795, -1.427254, 4.649099, 1, 1, 1, 1, 1,
0.3046094, -0.2888418, 1.812964, 1, 1, 1, 1, 1,
0.3046418, 0.4874694, 2.284855, 1, 1, 1, 1, 1,
0.3095326, 0.7929509, 0.209825, 1, 1, 1, 1, 1,
0.3151765, 0.2249618, 0.8460257, 1, 1, 1, 1, 1,
0.3153691, 0.8560928, 0.4619513, 1, 1, 1, 1, 1,
0.3156794, -0.1265743, 2.567199, 1, 1, 1, 1, 1,
0.3166425, 1.263454, -0.03857489, 1, 1, 1, 1, 1,
0.3180701, 1.342966, 0.05726804, 1, 1, 1, 1, 1,
0.3216891, -1.656447, 4.100847, 1, 1, 1, 1, 1,
0.3219007, 1.354459, -0.3056496, 1, 1, 1, 1, 1,
0.3235096, -0.2330399, 0.8406464, 0, 0, 1, 1, 1,
0.3250144, -0.2579797, 3.217831, 1, 0, 0, 1, 1,
0.3275184, 1.454975, -1.441318, 1, 0, 0, 1, 1,
0.3398462, -0.270073, 1.705001, 1, 0, 0, 1, 1,
0.3426062, 0.3026421, 1.507174, 1, 0, 0, 1, 1,
0.3458592, 1.662395, -0.2955329, 1, 0, 0, 1, 1,
0.3470001, -1.348786, 3.826323, 0, 0, 0, 1, 1,
0.3477369, -1.008504, 4.30896, 0, 0, 0, 1, 1,
0.3485128, -0.643374, 3.56738, 0, 0, 0, 1, 1,
0.3490767, -0.9574106, 2.02329, 0, 0, 0, 1, 1,
0.3604066, 0.2995713, 1.573379, 0, 0, 0, 1, 1,
0.3621675, -0.2054472, 2.872567, 0, 0, 0, 1, 1,
0.3726888, 0.6643866, 1.358204, 0, 0, 0, 1, 1,
0.3735558, 0.7680441, 1.69005, 1, 1, 1, 1, 1,
0.3781814, -0.5311469, 1.288008, 1, 1, 1, 1, 1,
0.3817348, 0.4094042, 0.9129013, 1, 1, 1, 1, 1,
0.3833165, 0.8231096, 0.6892675, 1, 1, 1, 1, 1,
0.38538, -1.847828, 2.143899, 1, 1, 1, 1, 1,
0.3877477, 0.01499831, 1.241116, 1, 1, 1, 1, 1,
0.3891727, 0.8010535, -0.6705357, 1, 1, 1, 1, 1,
0.3897432, -1.037426, 6.078008, 1, 1, 1, 1, 1,
0.3953032, -0.7890698, 1.159265, 1, 1, 1, 1, 1,
0.3954477, 0.03047354, 2.19778, 1, 1, 1, 1, 1,
0.4001331, 0.6089221, 0.4980114, 1, 1, 1, 1, 1,
0.4011011, -2.290669, 1.639115, 1, 1, 1, 1, 1,
0.4076942, -0.4072459, 0.7465301, 1, 1, 1, 1, 1,
0.4098018, -0.5184488, 2.478065, 1, 1, 1, 1, 1,
0.412794, -0.2381904, 2.396857, 1, 1, 1, 1, 1,
0.4146486, 0.4644881, -0.2091273, 0, 0, 1, 1, 1,
0.4148156, -0.07198659, 3.104735, 1, 0, 0, 1, 1,
0.422203, -0.5157239, 3.647231, 1, 0, 0, 1, 1,
0.4225017, 0.5802643, -0.9377044, 1, 0, 0, 1, 1,
0.4306299, -1.304942, 2.863024, 1, 0, 0, 1, 1,
0.430783, 0.527468, -0.1739812, 1, 0, 0, 1, 1,
0.4314155, 0.08729479, 2.41086, 0, 0, 0, 1, 1,
0.4319969, 0.6179311, -0.05642887, 0, 0, 0, 1, 1,
0.4363682, 0.2073463, 0.3015498, 0, 0, 0, 1, 1,
0.4387225, 0.5290204, 0.3700832, 0, 0, 0, 1, 1,
0.439994, -0.9045954, 2.542809, 0, 0, 0, 1, 1,
0.4406702, -0.3553687, 1.764108, 0, 0, 0, 1, 1,
0.4412443, -1.313779, 4.366067, 0, 0, 0, 1, 1,
0.4471332, 0.02119136, 0.3703135, 1, 1, 1, 1, 1,
0.4519659, 1.452598, -0.489463, 1, 1, 1, 1, 1,
0.4522551, 0.3378363, 1.49949, 1, 1, 1, 1, 1,
0.4608405, -0.4212355, 1.503963, 1, 1, 1, 1, 1,
0.4613112, -0.06057943, 1.679519, 1, 1, 1, 1, 1,
0.4619133, 0.7455742, 1.061735, 1, 1, 1, 1, 1,
0.4678499, -1.007637, 2.642739, 1, 1, 1, 1, 1,
0.4717414, -0.5208935, 4.154942, 1, 1, 1, 1, 1,
0.4767476, -0.2741385, 3.800419, 1, 1, 1, 1, 1,
0.4768974, -0.4092782, 2.271336, 1, 1, 1, 1, 1,
0.4809666, -1.205373, 3.078098, 1, 1, 1, 1, 1,
0.4846497, -1.199521, 4.032904, 1, 1, 1, 1, 1,
0.4887208, -0.2405448, 0.756019, 1, 1, 1, 1, 1,
0.4906734, -1.726293, 1.962082, 1, 1, 1, 1, 1,
0.4912743, 0.6370467, 1.945371, 1, 1, 1, 1, 1,
0.4933583, -0.0130174, 2.45007, 0, 0, 1, 1, 1,
0.5028893, 1.407537, 0.5196483, 1, 0, 0, 1, 1,
0.5061436, 0.4548751, 0.2070315, 1, 0, 0, 1, 1,
0.5081419, 0.2245345, 0.05676816, 1, 0, 0, 1, 1,
0.508827, -1.111324, 2.401427, 1, 0, 0, 1, 1,
0.5103948, 0.3458681, 1.959275, 1, 0, 0, 1, 1,
0.5125676, -0.7516695, 4.167655, 0, 0, 0, 1, 1,
0.5133308, 0.006377395, 0.5667868, 0, 0, 0, 1, 1,
0.5192366, -0.6257088, 3.598951, 0, 0, 0, 1, 1,
0.5221567, 0.4545949, -0.521876, 0, 0, 0, 1, 1,
0.5230132, -0.6684796, 1.560752, 0, 0, 0, 1, 1,
0.5339574, 0.9021663, -0.428937, 0, 0, 0, 1, 1,
0.5402677, 0.1536103, 1.824723, 0, 0, 0, 1, 1,
0.5411177, 0.9963343, 0.9130869, 1, 1, 1, 1, 1,
0.5464618, 0.6117966, 2.361193, 1, 1, 1, 1, 1,
0.5488493, 0.196884, 1.132356, 1, 1, 1, 1, 1,
0.5511166, -0.6981758, 3.082193, 1, 1, 1, 1, 1,
0.5523836, -0.3239185, 2.895251, 1, 1, 1, 1, 1,
0.5558352, 0.6315487, 2.178676, 1, 1, 1, 1, 1,
0.5648189, -0.2319915, 2.140106, 1, 1, 1, 1, 1,
0.5653954, -0.6979336, 2.897075, 1, 1, 1, 1, 1,
0.5664536, 0.4104944, 0.9996096, 1, 1, 1, 1, 1,
0.5707108, -0.9413876, 1.383118, 1, 1, 1, 1, 1,
0.5716633, -0.4461819, 2.516613, 1, 1, 1, 1, 1,
0.57333, 0.343087, 0.641413, 1, 1, 1, 1, 1,
0.5733941, -0.7561345, 3.819937, 1, 1, 1, 1, 1,
0.5743917, -0.561662, 3.093617, 1, 1, 1, 1, 1,
0.5754521, -0.006231177, 1.16054, 1, 1, 1, 1, 1,
0.5771765, 0.5180339, 0.6708555, 0, 0, 1, 1, 1,
0.5772468, 0.001882902, 1.349751, 1, 0, 0, 1, 1,
0.5776473, 0.1024682, 0.589499, 1, 0, 0, 1, 1,
0.5793946, 0.2294653, 1.17417, 1, 0, 0, 1, 1,
0.5807531, -1.319944, 2.582162, 1, 0, 0, 1, 1,
0.5828328, 0.3768142, 0.5770409, 1, 0, 0, 1, 1,
0.5918708, -0.7854838, 2.601128, 0, 0, 0, 1, 1,
0.5966257, 0.08643573, 1.934602, 0, 0, 0, 1, 1,
0.6027265, 0.7858633, 0.1920488, 0, 0, 0, 1, 1,
0.6068059, -0.8545672, 1.663551, 0, 0, 0, 1, 1,
0.6076868, -0.7455636, 3.138597, 0, 0, 0, 1, 1,
0.6100435, 1.237286, 1.082184, 0, 0, 0, 1, 1,
0.6101896, -1.166182, 4.272787, 0, 0, 0, 1, 1,
0.6120527, 0.5836992, 0.4494266, 1, 1, 1, 1, 1,
0.6122952, -1.111881, 2.345025, 1, 1, 1, 1, 1,
0.6129127, 0.1958904, 1.16061, 1, 1, 1, 1, 1,
0.6140487, 0.04322743, 1.092353, 1, 1, 1, 1, 1,
0.6144451, 1.842396, -0.3179356, 1, 1, 1, 1, 1,
0.6167665, 1.13145, -0.2036371, 1, 1, 1, 1, 1,
0.6200815, 0.1723652, 2.539214, 1, 1, 1, 1, 1,
0.6217301, 0.1950971, 1.377981, 1, 1, 1, 1, 1,
0.6224797, 0.2435519, 2.008423, 1, 1, 1, 1, 1,
0.6255913, 1.050245, 0.9229849, 1, 1, 1, 1, 1,
0.629289, 1.486853, 1.098979, 1, 1, 1, 1, 1,
0.6305403, 0.5154458, 1.657171, 1, 1, 1, 1, 1,
0.6379837, 1.660963, 1.168, 1, 1, 1, 1, 1,
0.6392503, 0.488365, 0.805738, 1, 1, 1, 1, 1,
0.6423842, 1.774621, 0.9132845, 1, 1, 1, 1, 1,
0.6446111, 1.320393, 0.7674734, 0, 0, 1, 1, 1,
0.646035, 0.83555, 0.6387783, 1, 0, 0, 1, 1,
0.6487602, 1.422378, 0.5423133, 1, 0, 0, 1, 1,
0.6495655, -0.4574203, 2.440969, 1, 0, 0, 1, 1,
0.6496342, -1.249229, 3.229596, 1, 0, 0, 1, 1,
0.6497053, -0.7445909, 2.674877, 1, 0, 0, 1, 1,
0.6553915, 0.6807448, 0.3087925, 0, 0, 0, 1, 1,
0.6577263, 0.189418, 0.4699368, 0, 0, 0, 1, 1,
0.6637655, 1.488331, 0.6091474, 0, 0, 0, 1, 1,
0.6656824, 0.6493451, 1.634191, 0, 0, 0, 1, 1,
0.6660095, -0.8291357, 0.4676111, 0, 0, 0, 1, 1,
0.6662874, -0.1159745, 0.7265131, 0, 0, 0, 1, 1,
0.668358, -0.8370286, 2.77722, 0, 0, 0, 1, 1,
0.6713514, -1.081275, 3.322896, 1, 1, 1, 1, 1,
0.6749156, 0.8562785, -0.01409301, 1, 1, 1, 1, 1,
0.6754047, -1.486429, 1.481394, 1, 1, 1, 1, 1,
0.6782513, 0.1426377, 0.8518969, 1, 1, 1, 1, 1,
0.6805339, -0.8680136, 4.840429, 1, 1, 1, 1, 1,
0.6863071, -0.368579, 2.115574, 1, 1, 1, 1, 1,
0.6887012, -0.7753782, 2.158007, 1, 1, 1, 1, 1,
0.6922224, -0.8975124, 3.581192, 1, 1, 1, 1, 1,
0.695724, 0.2524623, 1.370562, 1, 1, 1, 1, 1,
0.6982808, -1.681779, -0.4101319, 1, 1, 1, 1, 1,
0.698971, -1.291789, 3.158146, 1, 1, 1, 1, 1,
0.7017571, 0.06650345, 0.4314842, 1, 1, 1, 1, 1,
0.705074, 1.032888, 0.6840037, 1, 1, 1, 1, 1,
0.7090124, -1.414364, 3.24129, 1, 1, 1, 1, 1,
0.7141364, 1.496584, 0.3164177, 1, 1, 1, 1, 1,
0.7209268, -1.315697, 3.252138, 0, 0, 1, 1, 1,
0.7249922, -0.09765064, 2.784081, 1, 0, 0, 1, 1,
0.7266182, 0.2949129, 0.08860878, 1, 0, 0, 1, 1,
0.7291031, -0.9087266, 2.353717, 1, 0, 0, 1, 1,
0.733306, -1.696193, 3.41305, 1, 0, 0, 1, 1,
0.7338434, -1.671269, 0.9882179, 1, 0, 0, 1, 1,
0.734987, -1.045812, 0.5868263, 0, 0, 0, 1, 1,
0.7405456, 0.4268324, 2.13278, 0, 0, 0, 1, 1,
0.7432269, -0.7444444, 1.988743, 0, 0, 0, 1, 1,
0.7437717, 0.6502597, -0.6071977, 0, 0, 0, 1, 1,
0.7474181, -1.683333, 2.81116, 0, 0, 0, 1, 1,
0.7482573, -0.361255, 1.478533, 0, 0, 0, 1, 1,
0.7487333, 1.539893, -0.7417581, 0, 0, 0, 1, 1,
0.750018, -0.2803522, 2.582306, 1, 1, 1, 1, 1,
0.7539379, 1.382185, 1.117554, 1, 1, 1, 1, 1,
0.7605912, 1.893513, 1.928185, 1, 1, 1, 1, 1,
0.7625788, -0.06750377, 2.41609, 1, 1, 1, 1, 1,
0.7632993, -0.2295869, 3.538053, 1, 1, 1, 1, 1,
0.7644678, 0.001934816, 3.332313, 1, 1, 1, 1, 1,
0.7745669, 0.811507, 0.1664241, 1, 1, 1, 1, 1,
0.7775361, 1.200214, 0.315615, 1, 1, 1, 1, 1,
0.7799019, 0.6169314, 1.593604, 1, 1, 1, 1, 1,
0.7822471, 0.1412746, 3.720933, 1, 1, 1, 1, 1,
0.7877321, -0.8023685, 2.485923, 1, 1, 1, 1, 1,
0.7900952, -1.368621, 3.76016, 1, 1, 1, 1, 1,
0.7959049, 0.5171667, 0.8225973, 1, 1, 1, 1, 1,
0.8046251, 1.612502, 1.556925, 1, 1, 1, 1, 1,
0.805123, 1.913209, 0.3464802, 1, 1, 1, 1, 1,
0.8148537, -1.578372, 2.433795, 0, 0, 1, 1, 1,
0.817179, -0.7792856, 2.69805, 1, 0, 0, 1, 1,
0.8172783, 0.5998855, 0.4106713, 1, 0, 0, 1, 1,
0.8203442, -1.547618, 3.912863, 1, 0, 0, 1, 1,
0.820437, 0.4551258, -0.2750753, 1, 0, 0, 1, 1,
0.8228018, 0.4930707, 0.1387111, 1, 0, 0, 1, 1,
0.8249323, -0.560951, 2.688433, 0, 0, 0, 1, 1,
0.8310344, 0.586098, -0.1326513, 0, 0, 0, 1, 1,
0.8313316, -0.4252885, 1.734456, 0, 0, 0, 1, 1,
0.8362702, -0.4144464, 0.9422407, 0, 0, 0, 1, 1,
0.8368967, 0.4110465, 1.239333, 0, 0, 0, 1, 1,
0.8426389, -1.803423, 2.259187, 0, 0, 0, 1, 1,
0.8441159, 0.7656266, 0.6297261, 0, 0, 0, 1, 1,
0.8463203, 0.1326273, 0.8558774, 1, 1, 1, 1, 1,
0.8486969, 0.7654523, 0.705884, 1, 1, 1, 1, 1,
0.8531038, -0.2331024, 2.138237, 1, 1, 1, 1, 1,
0.8569344, 0.5749419, 0.2673803, 1, 1, 1, 1, 1,
0.8570106, -1.092166, 3.004202, 1, 1, 1, 1, 1,
0.859868, 1.239136, 1.091627, 1, 1, 1, 1, 1,
0.8598723, 1.154199, 0.2267735, 1, 1, 1, 1, 1,
0.8604275, -1.010785, 3.018188, 1, 1, 1, 1, 1,
0.8649282, 1.295371, 1.83748, 1, 1, 1, 1, 1,
0.8675755, -0.411148, 1.289775, 1, 1, 1, 1, 1,
0.8687251, -0.1252673, 0.7929975, 1, 1, 1, 1, 1,
0.8759472, 0.97923, 0.1998761, 1, 1, 1, 1, 1,
0.8870255, -0.2180613, 2.036188, 1, 1, 1, 1, 1,
0.8884206, -0.3773167, 2.363688, 1, 1, 1, 1, 1,
0.8907058, -1.30768, 2.403498, 1, 1, 1, 1, 1,
0.8923347, 1.231504, 0.6007851, 0, 0, 1, 1, 1,
0.8934478, -0.8595322, 4.143157, 1, 0, 0, 1, 1,
0.8951526, -0.7676789, 3.586211, 1, 0, 0, 1, 1,
0.9087907, 0.7385935, 0.3052352, 1, 0, 0, 1, 1,
0.9101345, 1.440179, 1.387717, 1, 0, 0, 1, 1,
0.9125091, -1.047979, 0.7960336, 1, 0, 0, 1, 1,
0.9169847, 0.6924124, 0.3417297, 0, 0, 0, 1, 1,
0.9224257, 0.7892648, -0.2743606, 0, 0, 0, 1, 1,
0.9322706, -1.185399, 3.183572, 0, 0, 0, 1, 1,
0.9336427, -0.1133062, 1.189633, 0, 0, 0, 1, 1,
0.9400835, 0.1643108, 1.690577, 0, 0, 0, 1, 1,
0.9435401, 0.5268421, 0.4200117, 0, 0, 0, 1, 1,
0.9502133, 1.587838, 0.1159654, 0, 0, 0, 1, 1,
0.9521891, 1.171924, 0.9549222, 1, 1, 1, 1, 1,
0.9542248, -0.6264347, 3.643304, 1, 1, 1, 1, 1,
0.9549295, -0.225765, 2.137336, 1, 1, 1, 1, 1,
0.9584657, -1.965571, 3.987701, 1, 1, 1, 1, 1,
0.9591725, -0.05380098, 1.195664, 1, 1, 1, 1, 1,
0.9628424, -1.168434, 3.902978, 1, 1, 1, 1, 1,
0.9686849, 0.9878095, 1.123419, 1, 1, 1, 1, 1,
0.9717049, 1.015976, -0.729094, 1, 1, 1, 1, 1,
0.9722646, 0.09391636, -0.3986463, 1, 1, 1, 1, 1,
0.9741231, 0.7044163, 0.892199, 1, 1, 1, 1, 1,
0.9785158, 1.134169, 3.263587, 1, 1, 1, 1, 1,
0.979775, 1.101513, 0.9707488, 1, 1, 1, 1, 1,
0.9820412, -1.233919, 2.179284, 1, 1, 1, 1, 1,
0.9936245, 0.2053366, 2.525103, 1, 1, 1, 1, 1,
0.9950462, 2.301734, -0.4035317, 1, 1, 1, 1, 1,
0.9957695, -0.6757006, 4.194479, 0, 0, 1, 1, 1,
0.9995301, -0.4857639, 1.858435, 1, 0, 0, 1, 1,
1.001155, 0.7905515, 2.932361, 1, 0, 0, 1, 1,
1.005463, -1.263866, 3.04804, 1, 0, 0, 1, 1,
1.005943, -1.378159, 3.517992, 1, 0, 0, 1, 1,
1.008085, 0.9810189, 1.395263, 1, 0, 0, 1, 1,
1.015974, 0.6902993, 0.676178, 0, 0, 0, 1, 1,
1.030279, -0.1565325, -0.1860864, 0, 0, 0, 1, 1,
1.033016, 0.8881317, -0.9880719, 0, 0, 0, 1, 1,
1.036095, -0.3606827, 0.5137963, 0, 0, 0, 1, 1,
1.037266, -1.133506, 1.134883, 0, 0, 0, 1, 1,
1.043875, 0.2491443, 3.193286, 0, 0, 0, 1, 1,
1.044005, -1.0409, 4.045783, 0, 0, 0, 1, 1,
1.046418, -0.1426103, 1.162888, 1, 1, 1, 1, 1,
1.046698, -0.05278985, 1.616035, 1, 1, 1, 1, 1,
1.047931, -1.504988, 1.892324, 1, 1, 1, 1, 1,
1.053224, -0.680298, 2.971831, 1, 1, 1, 1, 1,
1.058154, 0.6966721, 1.215452, 1, 1, 1, 1, 1,
1.070148, 0.8498135, 2.004942, 1, 1, 1, 1, 1,
1.073938, 0.2760194, 0.8339564, 1, 1, 1, 1, 1,
1.080382, -0.1686282, 2.66763, 1, 1, 1, 1, 1,
1.081051, 1.993345, 0.7653407, 1, 1, 1, 1, 1,
1.086597, -1.129793, 2.376895, 1, 1, 1, 1, 1,
1.086975, -0.08082154, 0.9813015, 1, 1, 1, 1, 1,
1.088326, 0.4607199, 1.669088, 1, 1, 1, 1, 1,
1.093079, -0.601842, 1.68709, 1, 1, 1, 1, 1,
1.093828, -0.02036021, 2.314322, 1, 1, 1, 1, 1,
1.104659, -1.071403, 2.596504, 1, 1, 1, 1, 1,
1.113826, -0.2394512, 2.078878, 0, 0, 1, 1, 1,
1.120112, 0.1675068, 2.194453, 1, 0, 0, 1, 1,
1.123111, -0.58831, 1.765687, 1, 0, 0, 1, 1,
1.126212, -0.5869684, 1.83861, 1, 0, 0, 1, 1,
1.129431, 2.031546, -0.7348979, 1, 0, 0, 1, 1,
1.152019, -0.4414178, 1.226425, 1, 0, 0, 1, 1,
1.155113, -1.050342, 1.684427, 0, 0, 0, 1, 1,
1.158108, -1.824279, 3.073238, 0, 0, 0, 1, 1,
1.168577, -0.8315546, 2.428195, 0, 0, 0, 1, 1,
1.170625, 1.350839, 0.1162007, 0, 0, 0, 1, 1,
1.176628, 0.5044066, 1.368739, 0, 0, 0, 1, 1,
1.177835, 0.3398083, 1.44533, 0, 0, 0, 1, 1,
1.181768, -0.05959564, 0.1567481, 0, 0, 0, 1, 1,
1.18811, 2.524269, 3.469138, 1, 1, 1, 1, 1,
1.195652, 1.497358, -0.2007818, 1, 1, 1, 1, 1,
1.201651, -0.6492743, 1.41696, 1, 1, 1, 1, 1,
1.20297, -0.9218912, 2.547634, 1, 1, 1, 1, 1,
1.206832, 0.8570334, 1.186303, 1, 1, 1, 1, 1,
1.210312, 1.227033, 0.5073799, 1, 1, 1, 1, 1,
1.213478, 0.03521004, 0.3387523, 1, 1, 1, 1, 1,
1.2194, 0.4478818, 2.16144, 1, 1, 1, 1, 1,
1.222495, -0.9831552, 2.257816, 1, 1, 1, 1, 1,
1.224903, -1.243981, 1.807832, 1, 1, 1, 1, 1,
1.227979, -0.5598587, 3.884185, 1, 1, 1, 1, 1,
1.229674, -1.518453, 3.716935, 1, 1, 1, 1, 1,
1.240246, -0.4449982, 1.452579, 1, 1, 1, 1, 1,
1.248279, 0.8624844, 0.9688987, 1, 1, 1, 1, 1,
1.248817, -0.4235422, 3.006488, 1, 1, 1, 1, 1,
1.260912, 0.3781087, 1.410014, 0, 0, 1, 1, 1,
1.269187, -0.2456162, 2.130994, 1, 0, 0, 1, 1,
1.276943, 1.292108, 1.235146, 1, 0, 0, 1, 1,
1.28354, 0.239576, 1.95263, 1, 0, 0, 1, 1,
1.289496, -0.5486219, 1.439646, 1, 0, 0, 1, 1,
1.31604, 0.7904528, 1.185438, 1, 0, 0, 1, 1,
1.32179, 1.303897, 0.3329768, 0, 0, 0, 1, 1,
1.323968, -0.3660886, 2.52894, 0, 0, 0, 1, 1,
1.326385, 0.7220905, 0.6720844, 0, 0, 0, 1, 1,
1.328974, -0.5960599, 2.075266, 0, 0, 0, 1, 1,
1.329673, 0.9551098, 0.8323966, 0, 0, 0, 1, 1,
1.329913, 0.04284843, 0.9289564, 0, 0, 0, 1, 1,
1.337626, -0.7535737, 3.549874, 0, 0, 0, 1, 1,
1.338542, -0.02626089, 1.119195, 1, 1, 1, 1, 1,
1.350904, -2.205122, 2.467826, 1, 1, 1, 1, 1,
1.355694, -0.3290642, 3.951636, 1, 1, 1, 1, 1,
1.365953, 0.2066812, 0.8381588, 1, 1, 1, 1, 1,
1.372896, -1.218996, 2.914613, 1, 1, 1, 1, 1,
1.384763, -1.836274, 1.593996, 1, 1, 1, 1, 1,
1.385492, 0.0124203, 1.243845, 1, 1, 1, 1, 1,
1.393984, 0.31378, 0.07989059, 1, 1, 1, 1, 1,
1.401175, 0.565464, 1.284137, 1, 1, 1, 1, 1,
1.407914, -0.3340907, 0.7819141, 1, 1, 1, 1, 1,
1.409161, 0.02730179, 0.8066864, 1, 1, 1, 1, 1,
1.422848, -0.6035139, 1.544238, 1, 1, 1, 1, 1,
1.4241, 1.275733, -1.038514, 1, 1, 1, 1, 1,
1.425306, -0.5978033, 0.9245937, 1, 1, 1, 1, 1,
1.427575, 0.0983217, 2.587673, 1, 1, 1, 1, 1,
1.428236, -0.3531156, 2.669066, 0, 0, 1, 1, 1,
1.433663, -0.7973443, 1.225647, 1, 0, 0, 1, 1,
1.435448, 0.6993835, 0.9670798, 1, 0, 0, 1, 1,
1.436771, -0.520053, 3.020728, 1, 0, 0, 1, 1,
1.44154, -1.79211, 2.287449, 1, 0, 0, 1, 1,
1.443098, 0.5308394, 2.13286, 1, 0, 0, 1, 1,
1.444336, -0.8079199, 2.745202, 0, 0, 0, 1, 1,
1.445544, 0.7046056, 0.787204, 0, 0, 0, 1, 1,
1.453128, 1.15053, 1.215251, 0, 0, 0, 1, 1,
1.454355, 0.01746996, 2.752023, 0, 0, 0, 1, 1,
1.458112, -1.198707, 2.305668, 0, 0, 0, 1, 1,
1.470654, 2.174854, 0.3622332, 0, 0, 0, 1, 1,
1.472108, -0.3403329, 1.513777, 0, 0, 0, 1, 1,
1.473152, 0.7932349, 0.3416691, 1, 1, 1, 1, 1,
1.483348, 0.4513834, 0.1467391, 1, 1, 1, 1, 1,
1.485638, -0.6704827, 1.441828, 1, 1, 1, 1, 1,
1.489081, 0.881794, 2.126584, 1, 1, 1, 1, 1,
1.502944, 0.4996573, 1.476321, 1, 1, 1, 1, 1,
1.508568, -2.047827, 4.906392, 1, 1, 1, 1, 1,
1.511735, 0.7327488, 1.839025, 1, 1, 1, 1, 1,
1.517125, -0.6612718, 3.719785, 1, 1, 1, 1, 1,
1.535406, -1.174874, 0.4097641, 1, 1, 1, 1, 1,
1.560126, 0.829715, 2.486228, 1, 1, 1, 1, 1,
1.560617, -0.4046048, 2.219224, 1, 1, 1, 1, 1,
1.578337, -0.9328867, 2.472821, 1, 1, 1, 1, 1,
1.585253, 1.792601, 1.49445, 1, 1, 1, 1, 1,
1.585694, 1.322925, -0.0146077, 1, 1, 1, 1, 1,
1.586913, 0.1535409, 2.550897, 1, 1, 1, 1, 1,
1.597686, 0.8019385, 3.07426, 0, 0, 1, 1, 1,
1.600166, -3.289097, 3.387892, 1, 0, 0, 1, 1,
1.601403, -1.170044, 1.008178, 1, 0, 0, 1, 1,
1.613335, 0.3558865, 0.8744509, 1, 0, 0, 1, 1,
1.61489, -0.7768315, 3.980054, 1, 0, 0, 1, 1,
1.621922, -0.6766648, 2.2855, 1, 0, 0, 1, 1,
1.671576, 0.2272855, 0.625125, 0, 0, 0, 1, 1,
1.673528, 1.026938, 0.9145101, 0, 0, 0, 1, 1,
1.678876, -0.6069632, 2.092657, 0, 0, 0, 1, 1,
1.697749, -0.2038304, 0.04647692, 0, 0, 0, 1, 1,
1.707461, 1.326376, 0.8932269, 0, 0, 0, 1, 1,
1.727676, -0.6325962, 2.05612, 0, 0, 0, 1, 1,
1.744445, -0.6770836, 0.8921549, 0, 0, 0, 1, 1,
1.744938, -2.005282, 2.542787, 1, 1, 1, 1, 1,
1.825546, 1.055065, -0.2487642, 1, 1, 1, 1, 1,
1.825755, 1.584935, 1.180582, 1, 1, 1, 1, 1,
1.830567, -1.682488, 3.040941, 1, 1, 1, 1, 1,
1.837763, -1.442784, 3.281665, 1, 1, 1, 1, 1,
1.839457, -1.367784, 2.171504, 1, 1, 1, 1, 1,
1.857091, 1.395712, 2.226224, 1, 1, 1, 1, 1,
1.86168, -1.507352, 2.270329, 1, 1, 1, 1, 1,
1.862152, -1.198362, 2.127097, 1, 1, 1, 1, 1,
1.892185, 0.1913843, 2.064133, 1, 1, 1, 1, 1,
1.914443, -1.074659, 3.766659, 1, 1, 1, 1, 1,
1.935384, 0.7269953, 2.643319, 1, 1, 1, 1, 1,
1.94318, -0.6897302, 2.878294, 1, 1, 1, 1, 1,
1.953859, -0.1250286, 0.06761973, 1, 1, 1, 1, 1,
2.00684, 0.651062, 1.375709, 1, 1, 1, 1, 1,
2.049489, -0.7211643, 1.263931, 0, 0, 1, 1, 1,
2.064986, -0.3853926, 1.616444, 1, 0, 0, 1, 1,
2.069664, 1.734793, 1.508183, 1, 0, 0, 1, 1,
2.103215, 1.032979, 1.677212, 1, 0, 0, 1, 1,
2.126124, 0.2618673, 0.2748703, 1, 0, 0, 1, 1,
2.128869, 1.013429, 0.4989652, 1, 0, 0, 1, 1,
2.131654, 0.184829, 1.537249, 0, 0, 0, 1, 1,
2.181849, -2.055488, 1.346038, 0, 0, 0, 1, 1,
2.21975, 0.7344178, 1.907824, 0, 0, 0, 1, 1,
2.243646, 1.095662, 1.334633, 0, 0, 0, 1, 1,
2.267905, 1.238039, 2.544854, 0, 0, 0, 1, 1,
2.421544, 1.005203, 3.685147, 0, 0, 0, 1, 1,
2.428937, -1.167171, 2.563175, 0, 0, 0, 1, 1,
2.529295, -1.133158, 1.384956, 1, 1, 1, 1, 1,
2.531851, 0.7696614, 1.156804, 1, 1, 1, 1, 1,
2.559253, 1.080317, 1.648168, 1, 1, 1, 1, 1,
2.647531, -0.4140152, 2.7986, 1, 1, 1, 1, 1,
2.690454, -0.3670153, -0.4683944, 1, 1, 1, 1, 1,
2.876718, -0.2671285, 0.4572932, 1, 1, 1, 1, 1,
2.918083, 0.8579417, 1.64605, 1, 1, 1, 1, 1
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
var radius = 9.573673;
var distance = 33.62712;
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
mvMatrix.translate( -0.03655422, 0.3277076, -0.3706057 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.62712);
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
