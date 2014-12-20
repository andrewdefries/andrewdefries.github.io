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
-3.52868, -0.3781004, -2.233028, 1, 0, 0, 1,
-3.079451, -1.022473, -1.623363, 1, 0.007843138, 0, 1,
-3.010925, 0.6447899, -3.167326, 1, 0.01176471, 0, 1,
-2.748352, -1.035133, -0.6784306, 1, 0.01960784, 0, 1,
-2.668616, 0.5803362, -0.383753, 1, 0.02352941, 0, 1,
-2.643093, 0.1126026, 0.04665027, 1, 0.03137255, 0, 1,
-2.626922, -0.425914, -1.829594, 1, 0.03529412, 0, 1,
-2.609757, -0.9632167, -2.566882, 1, 0.04313726, 0, 1,
-2.559655, 0.7558009, -1.487712, 1, 0.04705882, 0, 1,
-2.539069, -0.4159611, -0.902563, 1, 0.05490196, 0, 1,
-2.534308, -0.4080076, -2.814327, 1, 0.05882353, 0, 1,
-2.529525, 1.468918, -2.395634, 1, 0.06666667, 0, 1,
-2.405646, -0.4304181, -1.543093, 1, 0.07058824, 0, 1,
-2.278995, 0.4850406, -1.729838, 1, 0.07843138, 0, 1,
-2.248728, -0.6046001, -2.08159, 1, 0.08235294, 0, 1,
-2.246031, 1.432782, -1.020315, 1, 0.09019608, 0, 1,
-2.21487, -0.4272752, -0.8986529, 1, 0.09411765, 0, 1,
-2.162597, 0.5210584, -1.205172, 1, 0.1019608, 0, 1,
-2.109797, 0.492818, -1.934831, 1, 0.1098039, 0, 1,
-2.05756, -0.7429671, -2.574754, 1, 0.1137255, 0, 1,
-2.055657, 1.417638, -1.145427, 1, 0.1215686, 0, 1,
-2.032362, 1.23527, -1.552406, 1, 0.1254902, 0, 1,
-2.028958, 0.8322508, -0.6334546, 1, 0.1333333, 0, 1,
-2.024004, 0.4269042, -1.878658, 1, 0.1372549, 0, 1,
-1.996812, 1.802201, -1.476746, 1, 0.145098, 0, 1,
-1.994866, 0.3414664, -0.8050832, 1, 0.1490196, 0, 1,
-1.987964, 1.536333, -1.388774, 1, 0.1568628, 0, 1,
-1.959757, 1.805026, -0.6665108, 1, 0.1607843, 0, 1,
-1.959292, -0.6074038, -2.252602, 1, 0.1686275, 0, 1,
-1.955617, 0.6346506, -2.913187, 1, 0.172549, 0, 1,
-1.950726, -2.182321, -2.829893, 1, 0.1803922, 0, 1,
-1.875737, 0.327431, -1.97126, 1, 0.1843137, 0, 1,
-1.874797, -0.785974, -3.08902, 1, 0.1921569, 0, 1,
-1.865113, 0.801833, -1.804767, 1, 0.1960784, 0, 1,
-1.856908, -0.6563609, -0.6147941, 1, 0.2039216, 0, 1,
-1.82461, 0.1315361, -2.317245, 1, 0.2117647, 0, 1,
-1.823963, 0.188049, -2.401376, 1, 0.2156863, 0, 1,
-1.814376, -2.073942, -2.141851, 1, 0.2235294, 0, 1,
-1.813925, 0.9917467, -1.965005, 1, 0.227451, 0, 1,
-1.80676, -0.1163027, -3.741151, 1, 0.2352941, 0, 1,
-1.792537, 0.1451196, 0.604143, 1, 0.2392157, 0, 1,
-1.790451, -0.8007125, -1.140807, 1, 0.2470588, 0, 1,
-1.790154, -0.4861041, -2.054851, 1, 0.2509804, 0, 1,
-1.780429, 0.7994018, -1.619447, 1, 0.2588235, 0, 1,
-1.771902, 1.561704, -0.9613862, 1, 0.2627451, 0, 1,
-1.75522, 0.1238262, -1.674769, 1, 0.2705882, 0, 1,
-1.755174, 0.844624, -3.040708, 1, 0.2745098, 0, 1,
-1.754945, -1.139251, -3.505764, 1, 0.282353, 0, 1,
-1.753615, 0.7947847, -0.8546942, 1, 0.2862745, 0, 1,
-1.745911, 0.1466929, -0.9337587, 1, 0.2941177, 0, 1,
-1.738808, 1.556931, -0.5332183, 1, 0.3019608, 0, 1,
-1.733863, -0.7401127, -2.697144, 1, 0.3058824, 0, 1,
-1.722976, 1.596628, 0.06255125, 1, 0.3137255, 0, 1,
-1.720416, -1.067611, -1.415133, 1, 0.3176471, 0, 1,
-1.703184, -2.885296, -1.489673, 1, 0.3254902, 0, 1,
-1.684548, 0.2969042, 0.4483963, 1, 0.3294118, 0, 1,
-1.680805, -0.3944746, -1.372411, 1, 0.3372549, 0, 1,
-1.675129, -0.5968105, -2.657279, 1, 0.3411765, 0, 1,
-1.665079, 0.825682, -1.062799, 1, 0.3490196, 0, 1,
-1.663563, -1.401453, -2.101163, 1, 0.3529412, 0, 1,
-1.663453, -1.7241, -2.581138, 1, 0.3607843, 0, 1,
-1.65997, 1.687346, -0.9895477, 1, 0.3647059, 0, 1,
-1.629104, -1.969961, -3.065002, 1, 0.372549, 0, 1,
-1.61772, 0.05357042, -3.164854, 1, 0.3764706, 0, 1,
-1.610924, 0.0517301, -2.412906, 1, 0.3843137, 0, 1,
-1.60383, 0.1402808, -3.240602, 1, 0.3882353, 0, 1,
-1.590891, 1.362521, -0.6156593, 1, 0.3960784, 0, 1,
-1.583938, 0.6896425, -1.556085, 1, 0.4039216, 0, 1,
-1.58233, -0.269344, -0.6974, 1, 0.4078431, 0, 1,
-1.575498, -0.8824708, -2.410353, 1, 0.4156863, 0, 1,
-1.573689, -0.1277771, -2.77099, 1, 0.4196078, 0, 1,
-1.570619, 0.7467142, -1.819252, 1, 0.427451, 0, 1,
-1.567291, -1.174073, -3.301789, 1, 0.4313726, 0, 1,
-1.565816, 2.373032, -1.278093, 1, 0.4392157, 0, 1,
-1.55048, -1.322039, -2.680442, 1, 0.4431373, 0, 1,
-1.542215, -2.033262, -1.55326, 1, 0.4509804, 0, 1,
-1.540485, 0.8855743, -1.056269, 1, 0.454902, 0, 1,
-1.533412, -0.5504829, -0.1437181, 1, 0.4627451, 0, 1,
-1.53279, -0.5113068, -2.214566, 1, 0.4666667, 0, 1,
-1.528795, -0.3938657, -1.707369, 1, 0.4745098, 0, 1,
-1.516059, 0.8919604, -2.055389, 1, 0.4784314, 0, 1,
-1.510468, -0.8607156, -3.358947, 1, 0.4862745, 0, 1,
-1.505338, 1.257969, -1.778967, 1, 0.4901961, 0, 1,
-1.501184, -0.8383135, -1.722561, 1, 0.4980392, 0, 1,
-1.499261, -1.23142, -3.759374, 1, 0.5058824, 0, 1,
-1.495669, 1.015063, -0.4355441, 1, 0.509804, 0, 1,
-1.489574, -1.291036, -1.813488, 1, 0.5176471, 0, 1,
-1.485952, 0.3038309, -2.039434, 1, 0.5215687, 0, 1,
-1.485587, -0.8890197, -2.52582, 1, 0.5294118, 0, 1,
-1.484387, -1.789516, -3.830624, 1, 0.5333334, 0, 1,
-1.482784, -1.238715, -3.750845, 1, 0.5411765, 0, 1,
-1.479005, 0.1320886, -2.465231, 1, 0.5450981, 0, 1,
-1.472599, -2.635805, -0.848855, 1, 0.5529412, 0, 1,
-1.470157, -0.2013762, 0.2726937, 1, 0.5568628, 0, 1,
-1.467921, -3.252499, -3.007652, 1, 0.5647059, 0, 1,
-1.448025, -0.7766634, -1.056927, 1, 0.5686275, 0, 1,
-1.447169, 1.881421, -1.329787, 1, 0.5764706, 0, 1,
-1.44655, 0.3930205, -1.753554, 1, 0.5803922, 0, 1,
-1.436118, 0.4286796, 1.057848, 1, 0.5882353, 0, 1,
-1.428027, -0.1746524, -1.224017, 1, 0.5921569, 0, 1,
-1.425064, -0.04823751, -3.014556, 1, 0.6, 0, 1,
-1.423404, 1.452094, -0.8093224, 1, 0.6078432, 0, 1,
-1.401538, 1.207974, -0.3144075, 1, 0.6117647, 0, 1,
-1.399893, 1.624133, -0.07472534, 1, 0.6196079, 0, 1,
-1.384815, 1.780827, -0.3340136, 1, 0.6235294, 0, 1,
-1.373797, -0.7937748, -2.695172, 1, 0.6313726, 0, 1,
-1.365285, -0.3546202, -1.380454, 1, 0.6352941, 0, 1,
-1.362764, 0.849793, -1.602623, 1, 0.6431373, 0, 1,
-1.359638, -0.4944205, -2.762653, 1, 0.6470588, 0, 1,
-1.356135, 1.464069, -0.7402921, 1, 0.654902, 0, 1,
-1.347216, 0.3247332, -0.3756253, 1, 0.6588235, 0, 1,
-1.341772, -1.654135, -3.151978, 1, 0.6666667, 0, 1,
-1.336027, -2.127427, -3.074871, 1, 0.6705883, 0, 1,
-1.333018, 0.3215725, -1.439939, 1, 0.6784314, 0, 1,
-1.324294, 0.5241623, -3.255035, 1, 0.682353, 0, 1,
-1.316362, -1.430158, -2.973016, 1, 0.6901961, 0, 1,
-1.313184, 1.366198, -1.616407, 1, 0.6941177, 0, 1,
-1.310266, -0.4336533, 0.02212068, 1, 0.7019608, 0, 1,
-1.306448, 0.9679964, -1.152189, 1, 0.7098039, 0, 1,
-1.265573, 0.6669545, -0.8945165, 1, 0.7137255, 0, 1,
-1.245973, -0.520126, 0.2513638, 1, 0.7215686, 0, 1,
-1.245512, -1.728279, -1.610551, 1, 0.7254902, 0, 1,
-1.238577, 1.726697, -2.122166, 1, 0.7333333, 0, 1,
-1.237822, 1.176671, -1.310633, 1, 0.7372549, 0, 1,
-1.226748, 1.148371, -1.682639, 1, 0.7450981, 0, 1,
-1.220558, 0.879508, 0.4934705, 1, 0.7490196, 0, 1,
-1.220411, 0.7962399, -2.427706, 1, 0.7568628, 0, 1,
-1.215961, -0.9138142, -2.322021, 1, 0.7607843, 0, 1,
-1.205095, -0.3243607, -2.079974, 1, 0.7686275, 0, 1,
-1.199829, -0.3752729, -3.042024, 1, 0.772549, 0, 1,
-1.196476, -0.9574986, -2.736382, 1, 0.7803922, 0, 1,
-1.191617, -0.1529523, -1.894365, 1, 0.7843137, 0, 1,
-1.188786, -0.1916575, -3.532679, 1, 0.7921569, 0, 1,
-1.186122, -0.9751053, -1.777202, 1, 0.7960784, 0, 1,
-1.185049, 0.3994529, -3.348854, 1, 0.8039216, 0, 1,
-1.181755, -0.02950283, -1.466447, 1, 0.8117647, 0, 1,
-1.177152, -0.3462671, -4.00368, 1, 0.8156863, 0, 1,
-1.175797, -0.5435429, -0.5495654, 1, 0.8235294, 0, 1,
-1.175416, -2.378997, -2.275049, 1, 0.827451, 0, 1,
-1.160672, 0.7305949, -0.9110129, 1, 0.8352941, 0, 1,
-1.158355, -0.9790028, -2.003772, 1, 0.8392157, 0, 1,
-1.154224, -1.888644, -2.719007, 1, 0.8470588, 0, 1,
-1.146455, -0.3150691, -3.735151, 1, 0.8509804, 0, 1,
-1.139616, -1.02328, -2.518992, 1, 0.8588235, 0, 1,
-1.138362, -0.2064807, -3.090713, 1, 0.8627451, 0, 1,
-1.137342, 2.136957, -1.442245, 1, 0.8705882, 0, 1,
-1.137143, 1.25488, 0.3236044, 1, 0.8745098, 0, 1,
-1.135529, 0.1932401, -3.629285, 1, 0.8823529, 0, 1,
-1.133601, 0.3064614, -2.499467, 1, 0.8862745, 0, 1,
-1.12629, -1.57469, -2.839071, 1, 0.8941177, 0, 1,
-1.125933, -2.175591, -3.021056, 1, 0.8980392, 0, 1,
-1.122482, -0.4066181, -2.833221, 1, 0.9058824, 0, 1,
-1.116773, 1.395688, -0.3246181, 1, 0.9137255, 0, 1,
-1.113387, -0.6496059, -1.863177, 1, 0.9176471, 0, 1,
-1.108091, 0.8439927, -1.062058, 1, 0.9254902, 0, 1,
-1.107042, 0.0267084, -0.583104, 1, 0.9294118, 0, 1,
-1.101424, -1.310274, -3.104394, 1, 0.9372549, 0, 1,
-1.100722, 0.5281814, -1.041485, 1, 0.9411765, 0, 1,
-1.097914, 0.1493224, -1.037692, 1, 0.9490196, 0, 1,
-1.085597, 1.685279, -0.2985908, 1, 0.9529412, 0, 1,
-1.083005, 0.9578016, -1.44307, 1, 0.9607843, 0, 1,
-1.082819, -0.7091668, -2.017242, 1, 0.9647059, 0, 1,
-1.07674, -0.8609, -2.91964, 1, 0.972549, 0, 1,
-1.071875, -0.5162064, -1.979863, 1, 0.9764706, 0, 1,
-1.07146, 0.8053855, 0.6453267, 1, 0.9843137, 0, 1,
-1.064792, -1.27944, -1.432024, 1, 0.9882353, 0, 1,
-1.060997, -1.337542, -2.156411, 1, 0.9960784, 0, 1,
-1.059425, -1.521259, -2.993574, 0.9960784, 1, 0, 1,
-1.056306, 1.007449, 0.3044299, 0.9921569, 1, 0, 1,
-1.055115, 0.0119263, -1.439786, 0.9843137, 1, 0, 1,
-1.052438, 0.01496963, -1.20546, 0.9803922, 1, 0, 1,
-1.051622, -0.9311505, -2.462479, 0.972549, 1, 0, 1,
-1.043022, 1.065624, 0.4840019, 0.9686275, 1, 0, 1,
-1.038097, 0.1746407, -0.2276596, 0.9607843, 1, 0, 1,
-1.037879, 0.7487034, -0.2436886, 0.9568627, 1, 0, 1,
-1.03708, -1.332575, -4.241697, 0.9490196, 1, 0, 1,
-1.024379, -0.8472396, -2.161502, 0.945098, 1, 0, 1,
-1.023829, -0.5371244, -1.218871, 0.9372549, 1, 0, 1,
-1.022636, 0.9044765, -1.613324, 0.9333333, 1, 0, 1,
-1.021654, 1.601224, -2.145988, 0.9254902, 1, 0, 1,
-1.015194, 0.7181961, -1.13168, 0.9215686, 1, 0, 1,
-1.0144, -0.3241698, -2.51207, 0.9137255, 1, 0, 1,
-1.013288, 1.303398, 0.04471925, 0.9098039, 1, 0, 1,
-1.012114, 0.6840081, -1.456302, 0.9019608, 1, 0, 1,
-1.003251, -2.354339, -2.311798, 0.8941177, 1, 0, 1,
-0.9955125, -0.09238301, -3.463521, 0.8901961, 1, 0, 1,
-0.9931498, 0.5103365, -0.7275873, 0.8823529, 1, 0, 1,
-0.9878169, 0.02926508, -1.009047, 0.8784314, 1, 0, 1,
-0.985993, -0.1347599, -2.189263, 0.8705882, 1, 0, 1,
-0.9787445, -0.002323872, -3.215567, 0.8666667, 1, 0, 1,
-0.9759018, -0.7404204, -1.390851, 0.8588235, 1, 0, 1,
-0.9750137, 0.2391758, -2.513032, 0.854902, 1, 0, 1,
-0.9555376, -0.1414675, -2.105309, 0.8470588, 1, 0, 1,
-0.9494616, 0.5327742, -1.542879, 0.8431373, 1, 0, 1,
-0.9450216, 0.2996839, -1.644081, 0.8352941, 1, 0, 1,
-0.9300646, 0.5384764, -0.4692954, 0.8313726, 1, 0, 1,
-0.9283774, 0.6480088, -0.1605588, 0.8235294, 1, 0, 1,
-0.926275, 0.03064115, -1.795061, 0.8196079, 1, 0, 1,
-0.924937, 0.8608214, -1.304044, 0.8117647, 1, 0, 1,
-0.9243535, 0.858408, -0.5239424, 0.8078431, 1, 0, 1,
-0.9191226, -0.989242, -0.5346922, 0.8, 1, 0, 1,
-0.9167131, 0.5022963, -1.886213, 0.7921569, 1, 0, 1,
-0.9154397, 0.908182, -1.759769, 0.7882353, 1, 0, 1,
-0.9120232, -1.377785, -0.6616386, 0.7803922, 1, 0, 1,
-0.9041284, 2.073596, 0.5235819, 0.7764706, 1, 0, 1,
-0.8997241, -0.4535736, -0.5967941, 0.7686275, 1, 0, 1,
-0.8989047, 0.09445696, 0.01957082, 0.7647059, 1, 0, 1,
-0.8863454, -0.5174759, -1.924684, 0.7568628, 1, 0, 1,
-0.8849692, -0.1120096, -2.625973, 0.7529412, 1, 0, 1,
-0.8845002, 0.5032101, -2.417457, 0.7450981, 1, 0, 1,
-0.8796077, -1.719969, -2.93182, 0.7411765, 1, 0, 1,
-0.8755378, 0.5084456, 0.9025682, 0.7333333, 1, 0, 1,
-0.8721756, 0.03039788, 0.000533061, 0.7294118, 1, 0, 1,
-0.8705112, 0.5691724, -2.199186, 0.7215686, 1, 0, 1,
-0.8580818, -0.6028731, -2.113712, 0.7176471, 1, 0, 1,
-0.8562366, -0.2490171, -1.307426, 0.7098039, 1, 0, 1,
-0.8547618, -0.7201231, -2.138688, 0.7058824, 1, 0, 1,
-0.8538696, -0.04897795, -1.837413, 0.6980392, 1, 0, 1,
-0.8535336, -1.212527, -1.518136, 0.6901961, 1, 0, 1,
-0.8501414, 1.374045, -1.207876, 0.6862745, 1, 0, 1,
-0.8435477, 0.6604971, -1.242694, 0.6784314, 1, 0, 1,
-0.8353635, 0.7129483, -1.646795, 0.6745098, 1, 0, 1,
-0.833095, 1.665113, -0.6981218, 0.6666667, 1, 0, 1,
-0.8329109, 0.5570003, 0.1933943, 0.6627451, 1, 0, 1,
-0.8302823, 0.761773, -2.238958, 0.654902, 1, 0, 1,
-0.8279096, -0.6646776, -1.339454, 0.6509804, 1, 0, 1,
-0.8236254, -0.2093846, -2.03878, 0.6431373, 1, 0, 1,
-0.821881, 1.146894, -0.3872063, 0.6392157, 1, 0, 1,
-0.8157914, -0.3812003, -3.037869, 0.6313726, 1, 0, 1,
-0.8153296, -1.901944, -1.904977, 0.627451, 1, 0, 1,
-0.814096, 1.148935, 0.3145662, 0.6196079, 1, 0, 1,
-0.7991636, 0.3782851, -0.6197884, 0.6156863, 1, 0, 1,
-0.7981464, -0.2856282, -1.030882, 0.6078432, 1, 0, 1,
-0.7946127, -0.9785312, -1.150059, 0.6039216, 1, 0, 1,
-0.7939016, 0.6483006, -0.2948481, 0.5960785, 1, 0, 1,
-0.7908969, -1.960947, -1.693013, 0.5882353, 1, 0, 1,
-0.7908124, 0.07550011, -1.117202, 0.5843138, 1, 0, 1,
-0.7889593, 0.3990041, -2.54708, 0.5764706, 1, 0, 1,
-0.7889057, 0.3538244, -1.1453, 0.572549, 1, 0, 1,
-0.7877113, 0.3127967, -1.372897, 0.5647059, 1, 0, 1,
-0.7847673, -1.164784, -4.980006, 0.5607843, 1, 0, 1,
-0.780997, 1.043745, -0.7620044, 0.5529412, 1, 0, 1,
-0.778402, -0.3180631, -2.883639, 0.5490196, 1, 0, 1,
-0.7778084, 1.179156, -1.927631, 0.5411765, 1, 0, 1,
-0.7772564, 0.3554972, -1.780707, 0.5372549, 1, 0, 1,
-0.7736008, 1.053009, -0.5539668, 0.5294118, 1, 0, 1,
-0.7725002, -0.3409252, -0.5604541, 0.5254902, 1, 0, 1,
-0.7706488, -1.054597, -3.250614, 0.5176471, 1, 0, 1,
-0.7669085, 0.7781289, -0.505941, 0.5137255, 1, 0, 1,
-0.7667699, -2.820931, -3.967683, 0.5058824, 1, 0, 1,
-0.7619115, -1.630101, -4.490384, 0.5019608, 1, 0, 1,
-0.7609524, 1.244733, 1.886649, 0.4941176, 1, 0, 1,
-0.7572952, 0.2944173, -0.03979911, 0.4862745, 1, 0, 1,
-0.7564725, 1.814639, -1.202982, 0.4823529, 1, 0, 1,
-0.7519708, -0.4192821, -2.955375, 0.4745098, 1, 0, 1,
-0.7484501, 0.1353606, -1.168677, 0.4705882, 1, 0, 1,
-0.7467158, 1.88006, -1.834557, 0.4627451, 1, 0, 1,
-0.7454504, -0.08754475, -1.636041, 0.4588235, 1, 0, 1,
-0.7412464, 0.1873331, -2.405374, 0.4509804, 1, 0, 1,
-0.74081, -0.4742779, -3.025225, 0.4470588, 1, 0, 1,
-0.7405588, 0.5923094, -2.19127, 0.4392157, 1, 0, 1,
-0.7376816, -0.4022631, -1.140364, 0.4352941, 1, 0, 1,
-0.7366431, -2.522587, -2.788115, 0.427451, 1, 0, 1,
-0.7363487, -0.1183669, -1.315916, 0.4235294, 1, 0, 1,
-0.7309802, 1.851352, -0.6400972, 0.4156863, 1, 0, 1,
-0.7305196, 0.234423, -0.9857662, 0.4117647, 1, 0, 1,
-0.7292988, -0.1704778, -1.487702, 0.4039216, 1, 0, 1,
-0.7289391, -0.06170761, -2.611548, 0.3960784, 1, 0, 1,
-0.726361, 1.708682, -1.617672, 0.3921569, 1, 0, 1,
-0.724659, -0.6828433, -2.875668, 0.3843137, 1, 0, 1,
-0.721857, -0.8769176, -0.531101, 0.3803922, 1, 0, 1,
-0.7195049, 0.8971087, -0.7191921, 0.372549, 1, 0, 1,
-0.7180024, 1.752499, 0.2772629, 0.3686275, 1, 0, 1,
-0.715939, -0.3268331, -3.249664, 0.3607843, 1, 0, 1,
-0.7134096, 2.088373, -0.6629324, 0.3568628, 1, 0, 1,
-0.7092006, 0.5615559, 0.8086442, 0.3490196, 1, 0, 1,
-0.708378, -1.424398, -0.5299279, 0.345098, 1, 0, 1,
-0.7080547, 0.5761109, -0.3798388, 0.3372549, 1, 0, 1,
-0.6953123, -0.1835923, -0.5489786, 0.3333333, 1, 0, 1,
-0.6942719, -1.34068, -2.315397, 0.3254902, 1, 0, 1,
-0.6884613, 0.7371323, -0.07033151, 0.3215686, 1, 0, 1,
-0.6818562, 1.794617, 0.3314482, 0.3137255, 1, 0, 1,
-0.6771588, -1.70706, -2.300733, 0.3098039, 1, 0, 1,
-0.6745264, 0.8713766, -1.426923, 0.3019608, 1, 0, 1,
-0.673771, 0.122227, -2.272557, 0.2941177, 1, 0, 1,
-0.6728137, -1.564674, -2.379739, 0.2901961, 1, 0, 1,
-0.6693428, -0.722788, -2.732912, 0.282353, 1, 0, 1,
-0.6614503, -0.5425289, -3.875884, 0.2784314, 1, 0, 1,
-0.6590987, -0.3787019, -4.398984, 0.2705882, 1, 0, 1,
-0.6546649, -0.5425909, -2.959182, 0.2666667, 1, 0, 1,
-0.6443124, 0.7925636, -1.551177, 0.2588235, 1, 0, 1,
-0.6434426, 0.5077096, 0.6390215, 0.254902, 1, 0, 1,
-0.6380651, 0.6505291, -1.049471, 0.2470588, 1, 0, 1,
-0.6377526, 0.6509987, -2.114977, 0.2431373, 1, 0, 1,
-0.6356808, -0.5706524, -2.764752, 0.2352941, 1, 0, 1,
-0.632005, -0.832037, -2.674701, 0.2313726, 1, 0, 1,
-0.6285082, -1.351843, -2.613328, 0.2235294, 1, 0, 1,
-0.6233206, -1.20151, -2.550796, 0.2196078, 1, 0, 1,
-0.61577, -0.08474261, -0.5280585, 0.2117647, 1, 0, 1,
-0.6133685, -0.2054199, -1.477982, 0.2078431, 1, 0, 1,
-0.6131859, -0.5792432, -2.739425, 0.2, 1, 0, 1,
-0.6112724, -0.8965656, -3.018219, 0.1921569, 1, 0, 1,
-0.6052742, -0.2580619, -0.7546639, 0.1882353, 1, 0, 1,
-0.6022102, 2.176607, 0.3840198, 0.1803922, 1, 0, 1,
-0.5996937, -1.548596, -3.238431, 0.1764706, 1, 0, 1,
-0.5992975, -0.6577352, -2.486456, 0.1686275, 1, 0, 1,
-0.5991319, -0.9850808, -3.509312, 0.1647059, 1, 0, 1,
-0.5915603, -2.114784, -4.505095, 0.1568628, 1, 0, 1,
-0.5888962, -0.2664461, -2.712576, 0.1529412, 1, 0, 1,
-0.5832194, -0.6103777, -2.110705, 0.145098, 1, 0, 1,
-0.5827899, 0.09317929, -3.386271, 0.1411765, 1, 0, 1,
-0.5803986, 1.521936, -0.3007428, 0.1333333, 1, 0, 1,
-0.5797818, 0.2536172, -2.451994, 0.1294118, 1, 0, 1,
-0.5772278, 1.399898, 1.33829, 0.1215686, 1, 0, 1,
-0.5726637, 1.058826, -0.5610465, 0.1176471, 1, 0, 1,
-0.5717239, 1.104985, -0.9819391, 0.1098039, 1, 0, 1,
-0.5695049, 1.618532, -1.430055, 0.1058824, 1, 0, 1,
-0.5669611, -0.4347684, -1.741026, 0.09803922, 1, 0, 1,
-0.5664791, -0.2247713, -2.266431, 0.09019608, 1, 0, 1,
-0.5641446, -0.8320796, -3.58871, 0.08627451, 1, 0, 1,
-0.5637873, -1.45269, -2.253582, 0.07843138, 1, 0, 1,
-0.5614645, 1.51388, -0.304985, 0.07450981, 1, 0, 1,
-0.5602474, 0.1290862, -0.3763721, 0.06666667, 1, 0, 1,
-0.5579559, 1.514839, -1.548304, 0.0627451, 1, 0, 1,
-0.5573452, -0.8374175, -3.152273, 0.05490196, 1, 0, 1,
-0.5525331, 0.9001589, -0.764334, 0.05098039, 1, 0, 1,
-0.5466429, 0.2538382, -1.261201, 0.04313726, 1, 0, 1,
-0.5464717, -0.274302, -0.4758644, 0.03921569, 1, 0, 1,
-0.5412374, 0.1984557, -0.1857318, 0.03137255, 1, 0, 1,
-0.5401716, 1.234747, -0.06539574, 0.02745098, 1, 0, 1,
-0.5390258, -1.084388, -2.228531, 0.01960784, 1, 0, 1,
-0.5372941, 3.009205, -0.8155938, 0.01568628, 1, 0, 1,
-0.535778, 1.72393, -0.2757739, 0.007843138, 1, 0, 1,
-0.5356615, -0.2475835, -1.305009, 0.003921569, 1, 0, 1,
-0.5326858, 0.655891, -1.121714, 0, 1, 0.003921569, 1,
-0.5310441, -1.373125, -2.033008, 0, 1, 0.01176471, 1,
-0.5276444, -0.8568618, -2.780866, 0, 1, 0.01568628, 1,
-0.5239335, -1.53883, -2.903666, 0, 1, 0.02352941, 1,
-0.5213838, -0.4077257, -1.985542, 0, 1, 0.02745098, 1,
-0.5206336, 1.930958, -0.1277606, 0, 1, 0.03529412, 1,
-0.5079999, -0.01899643, -2.640139, 0, 1, 0.03921569, 1,
-0.5074938, -0.281211, -1.280097, 0, 1, 0.04705882, 1,
-0.5065455, 0.4457175, 1.448459, 0, 1, 0.05098039, 1,
-0.5049806, -0.03140018, -2.091232, 0, 1, 0.05882353, 1,
-0.5003433, -0.9270628, -3.118629, 0, 1, 0.0627451, 1,
-0.4998197, -1.922803, -2.830667, 0, 1, 0.07058824, 1,
-0.4951189, -0.6101638, -1.668987, 0, 1, 0.07450981, 1,
-0.4902108, 0.4716543, -1.596143, 0, 1, 0.08235294, 1,
-0.4894383, 1.159649, -0.6795791, 0, 1, 0.08627451, 1,
-0.4841992, 1.69733, -0.9053981, 0, 1, 0.09411765, 1,
-0.4831383, 0.885627, -1.667385, 0, 1, 0.1019608, 1,
-0.4801091, 0.5757901, -0.6581238, 0, 1, 0.1058824, 1,
-0.4777392, -1.842111, -2.883549, 0, 1, 0.1137255, 1,
-0.4761093, -1.273625, -2.674476, 0, 1, 0.1176471, 1,
-0.4740562, -1.70652, -3.160459, 0, 1, 0.1254902, 1,
-0.469561, -0.3662795, -1.019181, 0, 1, 0.1294118, 1,
-0.4686708, -0.7818523, -2.493982, 0, 1, 0.1372549, 1,
-0.4672834, 0.6207709, -0.398117, 0, 1, 0.1411765, 1,
-0.4668418, 0.6384953, -0.6211411, 0, 1, 0.1490196, 1,
-0.4645143, -0.4133889, -2.232386, 0, 1, 0.1529412, 1,
-0.4620666, -2.356094, -1.337988, 0, 1, 0.1607843, 1,
-0.4619491, -0.9883388, -2.70979, 0, 1, 0.1647059, 1,
-0.4616156, 1.684096, 0.4444279, 0, 1, 0.172549, 1,
-0.4583911, 0.04392654, -1.969419, 0, 1, 0.1764706, 1,
-0.4571163, 0.07085431, -0.8907489, 0, 1, 0.1843137, 1,
-0.4563261, -0.2647547, -0.9221256, 0, 1, 0.1882353, 1,
-0.4529988, -0.7435698, -4.199842, 0, 1, 0.1960784, 1,
-0.4457663, -0.3083831, -0.8985017, 0, 1, 0.2039216, 1,
-0.44281, 0.2185371, -1.044139, 0, 1, 0.2078431, 1,
-0.4360166, 1.428058, -0.02645166, 0, 1, 0.2156863, 1,
-0.4348654, 0.2463973, 0.03564756, 0, 1, 0.2196078, 1,
-0.4298713, -0.4592404, -3.52448, 0, 1, 0.227451, 1,
-0.4279643, 0.3874892, -0.268136, 0, 1, 0.2313726, 1,
-0.4235362, -1.541664, -3.215812, 0, 1, 0.2392157, 1,
-0.4213643, 1.74053, -1.370468, 0, 1, 0.2431373, 1,
-0.4189914, -2.234625, -3.984807, 0, 1, 0.2509804, 1,
-0.4189185, -0.02308331, -0.4629481, 0, 1, 0.254902, 1,
-0.416434, 1.54488, -1.671932, 0, 1, 0.2627451, 1,
-0.4163151, 0.3480174, -0.7416902, 0, 1, 0.2666667, 1,
-0.4138548, -1.413339, -3.53812, 0, 1, 0.2745098, 1,
-0.4126393, 1.085697, -0.6663035, 0, 1, 0.2784314, 1,
-0.412557, -0.8668538, -3.689434, 0, 1, 0.2862745, 1,
-0.4100479, -0.3469814, -2.064062, 0, 1, 0.2901961, 1,
-0.4064195, 0.4409386, -2.200809, 0, 1, 0.2980392, 1,
-0.4013167, 0.5980161, -0.411545, 0, 1, 0.3058824, 1,
-0.3966759, -0.8986843, -3.494297, 0, 1, 0.3098039, 1,
-0.3938698, 1.189265, -0.5944951, 0, 1, 0.3176471, 1,
-0.3884201, -0.02966398, -1.895875, 0, 1, 0.3215686, 1,
-0.3800037, -0.3771296, -2.477599, 0, 1, 0.3294118, 1,
-0.3792323, 0.854865, -0.8053548, 0, 1, 0.3333333, 1,
-0.3693858, -0.5688621, -5.043046, 0, 1, 0.3411765, 1,
-0.3628851, 0.3992652, -2.091581, 0, 1, 0.345098, 1,
-0.3621375, 0.5576084, 0.1383519, 0, 1, 0.3529412, 1,
-0.3621033, -0.1286222, -2.189714, 0, 1, 0.3568628, 1,
-0.3564765, -0.7982911, -1.991863, 0, 1, 0.3647059, 1,
-0.3549479, -1.320714, -3.692554, 0, 1, 0.3686275, 1,
-0.3536806, -0.8692641, -2.885277, 0, 1, 0.3764706, 1,
-0.3497828, 0.3020773, -2.537657, 0, 1, 0.3803922, 1,
-0.3479379, 1.152673, -0.05815553, 0, 1, 0.3882353, 1,
-0.3477184, 1.122129, 0.2281313, 0, 1, 0.3921569, 1,
-0.3457309, 0.2269486, -0.266651, 0, 1, 0.4, 1,
-0.3456833, 1.683321, -1.558038, 0, 1, 0.4078431, 1,
-0.3452812, -0.5287355, -3.090243, 0, 1, 0.4117647, 1,
-0.3445878, 2.132588, 0.5228388, 0, 1, 0.4196078, 1,
-0.3420146, -1.331751, -2.021072, 0, 1, 0.4235294, 1,
-0.3401664, 0.9807426, -1.097958, 0, 1, 0.4313726, 1,
-0.3349334, -0.9526463, -2.574391, 0, 1, 0.4352941, 1,
-0.3343298, -1.369193, -1.190485, 0, 1, 0.4431373, 1,
-0.3341021, -0.1462148, -2.079978, 0, 1, 0.4470588, 1,
-0.3294005, -1.475262, -3.177036, 0, 1, 0.454902, 1,
-0.3256725, 0.1326917, -0.2289763, 0, 1, 0.4588235, 1,
-0.3252061, 1.014824, 0.7858981, 0, 1, 0.4666667, 1,
-0.3238843, -0.7233219, -4.029798, 0, 1, 0.4705882, 1,
-0.3175074, 1.263921, -0.8772337, 0, 1, 0.4784314, 1,
-0.312962, -0.008452587, -2.805768, 0, 1, 0.4823529, 1,
-0.3111538, -0.3109403, -4.973297, 0, 1, 0.4901961, 1,
-0.3081328, -0.3228128, -2.795276, 0, 1, 0.4941176, 1,
-0.3031672, 0.2040384, 0.9326115, 0, 1, 0.5019608, 1,
-0.3008618, -0.4059376, -3.994634, 0, 1, 0.509804, 1,
-0.2987661, -0.9356541, -2.796311, 0, 1, 0.5137255, 1,
-0.2960196, 0.3740691, -2.720937, 0, 1, 0.5215687, 1,
-0.2952403, -0.01338546, -1.343216, 0, 1, 0.5254902, 1,
-0.2898617, 0.8412871, -0.2904582, 0, 1, 0.5333334, 1,
-0.2890424, 0.7603327, -0.428672, 0, 1, 0.5372549, 1,
-0.2852157, 1.038273, -0.004284534, 0, 1, 0.5450981, 1,
-0.2829809, -1.232869, -3.878389, 0, 1, 0.5490196, 1,
-0.2825927, 0.3004474, 0.2830321, 0, 1, 0.5568628, 1,
-0.2824955, -0.9198133, -0.8250337, 0, 1, 0.5607843, 1,
-0.2794646, -1.339136, -3.170684, 0, 1, 0.5686275, 1,
-0.2723384, 1.896812, -0.1505137, 0, 1, 0.572549, 1,
-0.2713321, -0.4245485, -1.381313, 0, 1, 0.5803922, 1,
-0.264007, 1.63862, -1.020484, 0, 1, 0.5843138, 1,
-0.2584597, -0.09090926, -1.75952, 0, 1, 0.5921569, 1,
-0.2536292, -0.4997701, -3.159479, 0, 1, 0.5960785, 1,
-0.251924, -1.297588, -2.463067, 0, 1, 0.6039216, 1,
-0.250106, -1.185938, -4.680154, 0, 1, 0.6117647, 1,
-0.2490034, -0.1081429, -2.738477, 0, 1, 0.6156863, 1,
-0.2478084, -1.115338, -1.940593, 0, 1, 0.6235294, 1,
-0.2449002, 0.4723897, -0.5214798, 0, 1, 0.627451, 1,
-0.2435404, -0.05389717, 0.2901566, 0, 1, 0.6352941, 1,
-0.2383229, -0.01851223, -1.506148, 0, 1, 0.6392157, 1,
-0.2214223, 0.1755252, -1.827829, 0, 1, 0.6470588, 1,
-0.2209921, 0.546374, -1.843076, 0, 1, 0.6509804, 1,
-0.2161086, 1.398654, 1.076926, 0, 1, 0.6588235, 1,
-0.2130522, -0.3664412, -1.937007, 0, 1, 0.6627451, 1,
-0.2120897, 0.7485662, 0.2921307, 0, 1, 0.6705883, 1,
-0.2117692, 0.2320193, 0.5056931, 0, 1, 0.6745098, 1,
-0.2099634, -0.8289919, -4.307238, 0, 1, 0.682353, 1,
-0.2086868, 0.4907713, 1.771016, 0, 1, 0.6862745, 1,
-0.2069468, 0.02746675, -1.698275, 0, 1, 0.6941177, 1,
-0.2000037, 0.004066037, 0.3467443, 0, 1, 0.7019608, 1,
-0.1994352, -0.4327148, -2.622272, 0, 1, 0.7058824, 1,
-0.1992031, 0.9301888, 0.4152904, 0, 1, 0.7137255, 1,
-0.1970839, -0.6629065, -2.942441, 0, 1, 0.7176471, 1,
-0.1956354, 0.843786, 1.31992, 0, 1, 0.7254902, 1,
-0.1920173, -0.6730488, -1.309427, 0, 1, 0.7294118, 1,
-0.1881566, 1.380518, 1.508881, 0, 1, 0.7372549, 1,
-0.1873234, -1.524096, -3.462506, 0, 1, 0.7411765, 1,
-0.1857163, 1.176932, 1.745968, 0, 1, 0.7490196, 1,
-0.1813774, 0.447467, -0.1397617, 0, 1, 0.7529412, 1,
-0.1773972, 0.1819112, -0.1934102, 0, 1, 0.7607843, 1,
-0.176527, -1.86333, -4.453961, 0, 1, 0.7647059, 1,
-0.1754659, -0.1982686, -2.051309, 0, 1, 0.772549, 1,
-0.171432, -0.9122922, -3.277281, 0, 1, 0.7764706, 1,
-0.1697132, 0.968185, -0.1597069, 0, 1, 0.7843137, 1,
-0.1695199, 0.3229492, -0.427517, 0, 1, 0.7882353, 1,
-0.1694881, 0.4343856, -0.7321603, 0, 1, 0.7960784, 1,
-0.1647186, 0.1845828, -2.707176, 0, 1, 0.8039216, 1,
-0.163286, 0.7975354, -0.936469, 0, 1, 0.8078431, 1,
-0.1618952, 0.873688, -0.8921669, 0, 1, 0.8156863, 1,
-0.1612523, 0.8660906, 0.9038958, 0, 1, 0.8196079, 1,
-0.1524775, 0.3817299, 0.07317462, 0, 1, 0.827451, 1,
-0.147549, 0.2026767, -1.562299, 0, 1, 0.8313726, 1,
-0.1461878, -1.879737, -2.596717, 0, 1, 0.8392157, 1,
-0.143515, -0.05753206, -2.51469, 0, 1, 0.8431373, 1,
-0.1425585, -0.2897862, -4.264511, 0, 1, 0.8509804, 1,
-0.1332874, -0.7645773, -3.194163, 0, 1, 0.854902, 1,
-0.1268784, 1.19312, 0.4920592, 0, 1, 0.8627451, 1,
-0.1255694, -0.3795705, -3.346696, 0, 1, 0.8666667, 1,
-0.1252274, -1.538273, -4.437853, 0, 1, 0.8745098, 1,
-0.1177791, -0.5810921, -3.469347, 0, 1, 0.8784314, 1,
-0.1136474, 2.39159, 0.6793675, 0, 1, 0.8862745, 1,
-0.1059285, -0.5687454, -2.839414, 0, 1, 0.8901961, 1,
-0.1048147, 0.003463825, 0.1223127, 0, 1, 0.8980392, 1,
-0.1006055, 0.757183, 0.7078434, 0, 1, 0.9058824, 1,
-0.09480153, 0.5113326, -0.1963563, 0, 1, 0.9098039, 1,
-0.09172353, -1.010503, -3.677696, 0, 1, 0.9176471, 1,
-0.08957953, 1.65023, 1.149889, 0, 1, 0.9215686, 1,
-0.08870213, -0.3912614, -3.472653, 0, 1, 0.9294118, 1,
-0.08499469, -0.908228, -3.779658, 0, 1, 0.9333333, 1,
-0.08361205, 0.3779169, 0.9801005, 0, 1, 0.9411765, 1,
-0.07906764, 0.08657596, -0.1626491, 0, 1, 0.945098, 1,
-0.07874167, 1.232275, -1.30873, 0, 1, 0.9529412, 1,
-0.07192157, 0.6294431, 0.5691462, 0, 1, 0.9568627, 1,
-0.06537707, -0.3555248, -4.162169, 0, 1, 0.9647059, 1,
-0.06512357, -0.2448717, -0.3897182, 0, 1, 0.9686275, 1,
-0.06431883, 0.2275388, 0.09844384, 0, 1, 0.9764706, 1,
-0.06245152, -0.7596723, -3.488485, 0, 1, 0.9803922, 1,
-0.06234419, 0.9926596, -0.3952408, 0, 1, 0.9882353, 1,
-0.05483246, 1.769318, -0.1068625, 0, 1, 0.9921569, 1,
-0.04840843, -2.017725, -2.735221, 0, 1, 1, 1,
-0.04697191, -0.4279092, -2.203263, 0, 0.9921569, 1, 1,
-0.04255066, 1.334431, -1.634848, 0, 0.9882353, 1, 1,
-0.03973227, 0.8998809, -2.168313, 0, 0.9803922, 1, 1,
-0.03445648, -1.22628, -3.011084, 0, 0.9764706, 1, 1,
-0.03383232, -0.4183185, -1.202261, 0, 0.9686275, 1, 1,
-0.03113464, 0.3692016, -0.388423, 0, 0.9647059, 1, 1,
-0.03075634, 0.5250815, 1.619958, 0, 0.9568627, 1, 1,
-0.02771839, -0.24388, -1.704935, 0, 0.9529412, 1, 1,
-0.02587404, -0.2535018, -1.738126, 0, 0.945098, 1, 1,
-0.02350318, 0.02399815, -0.6407271, 0, 0.9411765, 1, 1,
-0.02310974, -0.01565767, 0.03459811, 0, 0.9333333, 1, 1,
-0.01740953, -0.0220939, -1.38994, 0, 0.9294118, 1, 1,
-0.01739427, -0.8340876, -5.294819, 0, 0.9215686, 1, 1,
-0.01717947, -1.49768, -3.14985, 0, 0.9176471, 1, 1,
-0.0159133, -1.112396, -4.277809, 0, 0.9098039, 1, 1,
-0.006075998, 0.1108853, 1.301029, 0, 0.9058824, 1, 1,
-0.004440701, -0.3508793, -2.511923, 0, 0.8980392, 1, 1,
0.004047103, 1.109703, -1.029245, 0, 0.8901961, 1, 1,
0.005000025, -1.221286, 2.230973, 0, 0.8862745, 1, 1,
0.005696367, -1.862007, 4.835699, 0, 0.8784314, 1, 1,
0.009074135, -0.2236382, 3.576075, 0, 0.8745098, 1, 1,
0.009654106, -0.4995092, 4.352985, 0, 0.8666667, 1, 1,
0.01135504, -0.1888752, 3.514992, 0, 0.8627451, 1, 1,
0.01154383, 0.401145, 1.088347, 0, 0.854902, 1, 1,
0.01322107, -0.3631496, 2.445472, 0, 0.8509804, 1, 1,
0.01596207, 0.3713461, -1.665854, 0, 0.8431373, 1, 1,
0.01916577, -1.421956, 3.350595, 0, 0.8392157, 1, 1,
0.01935699, -0.5102276, 3.493207, 0, 0.8313726, 1, 1,
0.02130882, -0.2052051, 3.890841, 0, 0.827451, 1, 1,
0.02156075, 0.8426525, 1.556015, 0, 0.8196079, 1, 1,
0.02168048, -0.8853273, 2.823297, 0, 0.8156863, 1, 1,
0.02212393, -0.4774233, 4.367725, 0, 0.8078431, 1, 1,
0.02780049, -0.4783738, 4.033805, 0, 0.8039216, 1, 1,
0.03405548, 1.505581, -0.7823197, 0, 0.7960784, 1, 1,
0.03614692, -0.3550149, 2.715143, 0, 0.7882353, 1, 1,
0.04007173, -1.459874, 1.383619, 0, 0.7843137, 1, 1,
0.04166912, 0.5882602, 0.266519, 0, 0.7764706, 1, 1,
0.04336668, -1.291996, 4.089607, 0, 0.772549, 1, 1,
0.04937355, 1.136489, 0.5219736, 0, 0.7647059, 1, 1,
0.05016868, 0.9391879, 0.931064, 0, 0.7607843, 1, 1,
0.05552776, 1.688282, 1.682714, 0, 0.7529412, 1, 1,
0.06157038, 0.4489955, 0.1061898, 0, 0.7490196, 1, 1,
0.07337941, -0.797522, 3.744294, 0, 0.7411765, 1, 1,
0.07437245, -1.843115, 2.645454, 0, 0.7372549, 1, 1,
0.08054721, 2.695637, -0.04669618, 0, 0.7294118, 1, 1,
0.08071406, -1.598804, 2.930719, 0, 0.7254902, 1, 1,
0.08585483, 0.8871729, 0.6653446, 0, 0.7176471, 1, 1,
0.08783024, 1.934889, -1.598897, 0, 0.7137255, 1, 1,
0.0888334, -0.5005554, 3.966797, 0, 0.7058824, 1, 1,
0.09050166, 0.8003718, 1.056807, 0, 0.6980392, 1, 1,
0.09234928, -1.835098, 4.12941, 0, 0.6941177, 1, 1,
0.09247081, 0.3011928, 0.04720184, 0, 0.6862745, 1, 1,
0.0930284, 0.2877788, 1.371679, 0, 0.682353, 1, 1,
0.1003211, -3.060107, 2.697626, 0, 0.6745098, 1, 1,
0.103986, -0.6327036, 4.877617, 0, 0.6705883, 1, 1,
0.1080733, -0.3058316, 5.182175, 0, 0.6627451, 1, 1,
0.1121388, 1.751506, 0.8931162, 0, 0.6588235, 1, 1,
0.1122648, 0.5585737, 3.385747, 0, 0.6509804, 1, 1,
0.1166098, 0.2675575, 0.1270491, 0, 0.6470588, 1, 1,
0.1171138, -0.5542026, 2.725043, 0, 0.6392157, 1, 1,
0.1197282, 0.005585246, 0.7720379, 0, 0.6352941, 1, 1,
0.1218593, 1.150564, 0.03082986, 0, 0.627451, 1, 1,
0.1228022, 1.476988, -0.3803702, 0, 0.6235294, 1, 1,
0.1229568, 0.05900322, 0.7280439, 0, 0.6156863, 1, 1,
0.1261597, 0.2464578, 0.5413685, 0, 0.6117647, 1, 1,
0.1284056, -0.4008196, 4.994278, 0, 0.6039216, 1, 1,
0.1317477, -0.2253766, 1.8283, 0, 0.5960785, 1, 1,
0.1341987, -0.826366, 3.221827, 0, 0.5921569, 1, 1,
0.1352912, 0.5975581, 0.5733927, 0, 0.5843138, 1, 1,
0.1390533, 1.396605, -0.004123023, 0, 0.5803922, 1, 1,
0.1509719, 0.2300062, -0.420298, 0, 0.572549, 1, 1,
0.1541261, 0.916898, 1.04689, 0, 0.5686275, 1, 1,
0.1552231, 0.5210832, 1.465701, 0, 0.5607843, 1, 1,
0.1575879, -0.5226305, 2.45639, 0, 0.5568628, 1, 1,
0.1654879, 0.9874812, 0.2050135, 0, 0.5490196, 1, 1,
0.1663385, 0.09293451, 0.6656194, 0, 0.5450981, 1, 1,
0.167616, -0.4216587, 3.412663, 0, 0.5372549, 1, 1,
0.1697742, -3.141019, 4.078802, 0, 0.5333334, 1, 1,
0.1709748, -0.6145403, 2.029748, 0, 0.5254902, 1, 1,
0.1747426, -0.1135055, 2.263384, 0, 0.5215687, 1, 1,
0.1779988, -1.524899, 3.214875, 0, 0.5137255, 1, 1,
0.182275, -0.5291607, 2.062597, 0, 0.509804, 1, 1,
0.1869385, -1.229593, 3.462934, 0, 0.5019608, 1, 1,
0.188878, -1.27668, 3.154382, 0, 0.4941176, 1, 1,
0.1921484, -0.5151172, 1.228652, 0, 0.4901961, 1, 1,
0.1932639, 0.8272949, -0.08958969, 0, 0.4823529, 1, 1,
0.1952188, -0.3403066, 2.332145, 0, 0.4784314, 1, 1,
0.1996529, 1.913059, 0.6431122, 0, 0.4705882, 1, 1,
0.1997756, -0.9859384, 1.511287, 0, 0.4666667, 1, 1,
0.2025285, 0.07645434, 1.105204, 0, 0.4588235, 1, 1,
0.2082815, 0.2929729, -0.3734167, 0, 0.454902, 1, 1,
0.2100439, 0.3517747, 3.744854, 0, 0.4470588, 1, 1,
0.2114141, -0.06795921, 2.494193, 0, 0.4431373, 1, 1,
0.2159194, -0.419776, 2.11899, 0, 0.4352941, 1, 1,
0.2161625, 0.948589, -1.011013, 0, 0.4313726, 1, 1,
0.2167874, 1.01641, 0.5130445, 0, 0.4235294, 1, 1,
0.2200548, -0.1710047, 3.470411, 0, 0.4196078, 1, 1,
0.2251303, -0.007932091, 2.321087, 0, 0.4117647, 1, 1,
0.2252452, 0.654746, 0.7973248, 0, 0.4078431, 1, 1,
0.2309911, -0.1865886, 2.113338, 0, 0.4, 1, 1,
0.2324997, 0.6262217, 1.483899, 0, 0.3921569, 1, 1,
0.239923, -0.4488299, 3.511805, 0, 0.3882353, 1, 1,
0.2407104, 1.103611, 0.7676342, 0, 0.3803922, 1, 1,
0.2465307, 0.1660007, 1.199964, 0, 0.3764706, 1, 1,
0.250842, -0.6875174, 2.97678, 0, 0.3686275, 1, 1,
0.2510734, -0.7313038, 0.9205154, 0, 0.3647059, 1, 1,
0.2519882, -0.5720871, 1.159785, 0, 0.3568628, 1, 1,
0.2531797, -0.7268341, 2.202121, 0, 0.3529412, 1, 1,
0.2532052, -1.311951, 4.334732, 0, 0.345098, 1, 1,
0.2558715, 1.079279, -0.1816159, 0, 0.3411765, 1, 1,
0.2571243, 1.40017, -0.9788719, 0, 0.3333333, 1, 1,
0.2609851, -1.386839, 2.9833, 0, 0.3294118, 1, 1,
0.2622387, 0.03875188, 0.06684348, 0, 0.3215686, 1, 1,
0.2629886, -1.445625, 3.347317, 0, 0.3176471, 1, 1,
0.2637123, 1.330386, 0.3253531, 0, 0.3098039, 1, 1,
0.2683911, -1.218071, 1.422323, 0, 0.3058824, 1, 1,
0.278074, -0.2713824, 2.654, 0, 0.2980392, 1, 1,
0.2827345, 0.6011781, -0.540638, 0, 0.2901961, 1, 1,
0.2830607, 0.2460735, 1.290753, 0, 0.2862745, 1, 1,
0.2855469, 0.6445656, 1.588707, 0, 0.2784314, 1, 1,
0.2866485, -0.13368, 1.57836, 0, 0.2745098, 1, 1,
0.2870613, 1.215376, -0.06665082, 0, 0.2666667, 1, 1,
0.2896096, -1.004914, 0.779124, 0, 0.2627451, 1, 1,
0.2916657, 1.130928, 0.1989333, 0, 0.254902, 1, 1,
0.2916879, -0.3147086, 2.039981, 0, 0.2509804, 1, 1,
0.2936905, -0.2806234, 2.417918, 0, 0.2431373, 1, 1,
0.2986593, 0.1558191, 0.4029551, 0, 0.2392157, 1, 1,
0.3006537, 1.38761, 0.9614787, 0, 0.2313726, 1, 1,
0.3028282, 0.9891592, -1.064676, 0, 0.227451, 1, 1,
0.3055066, -0.6437706, 3.368904, 0, 0.2196078, 1, 1,
0.3067193, 0.04707792, 0.09369922, 0, 0.2156863, 1, 1,
0.3079682, 1.658229, -1.227938, 0, 0.2078431, 1, 1,
0.3172517, -1.625593, 2.736136, 0, 0.2039216, 1, 1,
0.3185258, 0.01325558, 1.126885, 0, 0.1960784, 1, 1,
0.3198622, 0.1208235, 0.8227391, 0, 0.1882353, 1, 1,
0.3223599, 0.722019, 0.03236301, 0, 0.1843137, 1, 1,
0.3252802, -0.7798409, 2.122936, 0, 0.1764706, 1, 1,
0.3273738, 0.5873311, 0.8137378, 0, 0.172549, 1, 1,
0.3352345, 0.4668221, 2.56858, 0, 0.1647059, 1, 1,
0.3356336, 0.9323246, -0.3881111, 0, 0.1607843, 1, 1,
0.3421085, -0.06797222, 0.4799121, 0, 0.1529412, 1, 1,
0.342517, -1.722756, 2.349063, 0, 0.1490196, 1, 1,
0.3433305, 1.892708, -1.211672, 0, 0.1411765, 1, 1,
0.3456306, 2.873205, -1.058081, 0, 0.1372549, 1, 1,
0.3491556, -1.211971, 2.465701, 0, 0.1294118, 1, 1,
0.350718, 0.7696869, 1.950221, 0, 0.1254902, 1, 1,
0.3517343, -0.8830636, 3.88159, 0, 0.1176471, 1, 1,
0.3542483, -0.9026546, 3.475249, 0, 0.1137255, 1, 1,
0.3617638, 3.18673, 0.02094891, 0, 0.1058824, 1, 1,
0.3658182, 2.522747, -1.019307, 0, 0.09803922, 1, 1,
0.3675525, -0.9155657, 2.506871, 0, 0.09411765, 1, 1,
0.3700523, 0.05985097, 1.503393, 0, 0.08627451, 1, 1,
0.3700791, -0.2789494, 2.212081, 0, 0.08235294, 1, 1,
0.3718474, -1.301026, 4.203296, 0, 0.07450981, 1, 1,
0.3758869, -0.5026673, 2.362973, 0, 0.07058824, 1, 1,
0.3766692, -0.3407486, 3.609859, 0, 0.0627451, 1, 1,
0.38089, -1.150184, 2.728838, 0, 0.05882353, 1, 1,
0.3813441, 0.2863908, 2.356796, 0, 0.05098039, 1, 1,
0.3823239, -0.9540334, 2.522788, 0, 0.04705882, 1, 1,
0.3834014, 0.004361773, 0.9087936, 0, 0.03921569, 1, 1,
0.3996116, 0.8276542, 0.2876718, 0, 0.03529412, 1, 1,
0.4009989, 0.6903636, -0.553094, 0, 0.02745098, 1, 1,
0.4016461, 0.7770976, -0.8941925, 0, 0.02352941, 1, 1,
0.4019496, 1.130002, -0.8237138, 0, 0.01568628, 1, 1,
0.4039072, 0.4020844, 2.793499, 0, 0.01176471, 1, 1,
0.4044272, -0.3117532, 3.214916, 0, 0.003921569, 1, 1,
0.407292, -0.7575358, 3.569915, 0.003921569, 0, 1, 1,
0.4081765, -1.041854, 2.874655, 0.007843138, 0, 1, 1,
0.4093956, -0.403012, 1.731152, 0.01568628, 0, 1, 1,
0.4098257, 0.6021819, 0.4454603, 0.01960784, 0, 1, 1,
0.4123743, 0.1894639, 0.2489811, 0.02745098, 0, 1, 1,
0.4133106, -0.04506447, 1.940984, 0.03137255, 0, 1, 1,
0.419842, 0.01369659, 1.877271, 0.03921569, 0, 1, 1,
0.4203056, 0.1274818, 2.54518, 0.04313726, 0, 1, 1,
0.4218748, -0.6040474, 2.561655, 0.05098039, 0, 1, 1,
0.4248013, 0.571278, -0.9852471, 0.05490196, 0, 1, 1,
0.4315731, -0.01872523, 0.3783516, 0.0627451, 0, 1, 1,
0.4396727, -0.0248178, 1.348821, 0.06666667, 0, 1, 1,
0.4402919, 0.6408153, 0.9862549, 0.07450981, 0, 1, 1,
0.4425597, 1.2367, -0.3225714, 0.07843138, 0, 1, 1,
0.4457404, 2.465278, 0.03200227, 0.08627451, 0, 1, 1,
0.4467374, 0.4387147, 1.699382, 0.09019608, 0, 1, 1,
0.4478506, 1.063806, -0.9349909, 0.09803922, 0, 1, 1,
0.4479938, 0.002542868, 2.488438, 0.1058824, 0, 1, 1,
0.4485094, 0.9848114, 1.248778, 0.1098039, 0, 1, 1,
0.4489201, -1.384244, 2.393239, 0.1176471, 0, 1, 1,
0.4510195, -0.01939618, 2.664822, 0.1215686, 0, 1, 1,
0.4511928, -1.496536, 2.78751, 0.1294118, 0, 1, 1,
0.4550987, 0.4032328, 0.8658248, 0.1333333, 0, 1, 1,
0.4568411, 1.303512, -0.3234651, 0.1411765, 0, 1, 1,
0.4605375, 0.6367112, -0.0983712, 0.145098, 0, 1, 1,
0.4759957, -0.07883027, 0.6653087, 0.1529412, 0, 1, 1,
0.4770021, 1.516831, 0.119282, 0.1568628, 0, 1, 1,
0.4794337, -1.201535, 2.892094, 0.1647059, 0, 1, 1,
0.4814446, 0.02609193, 2.366911, 0.1686275, 0, 1, 1,
0.4820681, -0.3048311, 2.096955, 0.1764706, 0, 1, 1,
0.4822734, -1.84183, 2.629561, 0.1803922, 0, 1, 1,
0.482768, 0.373661, -0.643241, 0.1882353, 0, 1, 1,
0.4881624, -0.8351039, 2.920962, 0.1921569, 0, 1, 1,
0.4974411, -0.1593949, 2.751556, 0.2, 0, 1, 1,
0.5000399, 2.630439, 0.8852396, 0.2078431, 0, 1, 1,
0.5026751, 0.4067829, 2.149975, 0.2117647, 0, 1, 1,
0.5032689, 0.5807239, -0.9321192, 0.2196078, 0, 1, 1,
0.507446, 0.0212633, 2.58229, 0.2235294, 0, 1, 1,
0.5085294, -2.947184, 1.923615, 0.2313726, 0, 1, 1,
0.5156848, -1.025295, 1.616743, 0.2352941, 0, 1, 1,
0.516884, -0.7710553, 3.408307, 0.2431373, 0, 1, 1,
0.5198124, -1.380771, 2.773031, 0.2470588, 0, 1, 1,
0.5349168, 2.405116, 1.0196, 0.254902, 0, 1, 1,
0.5370869, -0.6769104, 2.975933, 0.2588235, 0, 1, 1,
0.5444267, -1.045274, 3.240697, 0.2666667, 0, 1, 1,
0.5475813, 1.387213, 2.297617, 0.2705882, 0, 1, 1,
0.549126, 0.4321454, 0.4139405, 0.2784314, 0, 1, 1,
0.5517274, -2.086371, 2.367636, 0.282353, 0, 1, 1,
0.5537566, -0.7414597, 3.212549, 0.2901961, 0, 1, 1,
0.5582866, -0.6200261, 0.0535962, 0.2941177, 0, 1, 1,
0.5596144, -0.05134854, 1.099147, 0.3019608, 0, 1, 1,
0.5699991, -0.005612082, 0.4754519, 0.3098039, 0, 1, 1,
0.5723807, -1.746744, 0.5695637, 0.3137255, 0, 1, 1,
0.572718, 1.051022, 0.7620701, 0.3215686, 0, 1, 1,
0.5736817, 1.086472, 0.2775055, 0.3254902, 0, 1, 1,
0.5743308, 1.653653, -0.4383248, 0.3333333, 0, 1, 1,
0.5804716, -1.504799, 3.190541, 0.3372549, 0, 1, 1,
0.5830237, -0.9354799, 4.121953, 0.345098, 0, 1, 1,
0.5836993, 0.3848489, 1.045526, 0.3490196, 0, 1, 1,
0.5855257, 0.6628425, 0.3878324, 0.3568628, 0, 1, 1,
0.5917016, -0.5920575, 4.173205, 0.3607843, 0, 1, 1,
0.5951939, -0.9411685, 3.509239, 0.3686275, 0, 1, 1,
0.595731, 1.14069, 2.397451, 0.372549, 0, 1, 1,
0.5971592, -1.578083, 1.93396, 0.3803922, 0, 1, 1,
0.6016591, -0.8086312, 2.469289, 0.3843137, 0, 1, 1,
0.6034027, -0.3329141, 4.334314, 0.3921569, 0, 1, 1,
0.6043907, 0.7363081, 2.463165, 0.3960784, 0, 1, 1,
0.6061838, -0.4406698, 1.965949, 0.4039216, 0, 1, 1,
0.6082932, 0.2117032, 1.943, 0.4117647, 0, 1, 1,
0.6123577, -0.4992853, 3.736218, 0.4156863, 0, 1, 1,
0.6158429, -0.3816393, 3.534219, 0.4235294, 0, 1, 1,
0.616935, 0.7275094, 1.642599, 0.427451, 0, 1, 1,
0.626283, -0.2168619, -0.06476573, 0.4352941, 0, 1, 1,
0.6290362, 0.08701228, 2.034591, 0.4392157, 0, 1, 1,
0.6296451, -0.9609519, 3.504114, 0.4470588, 0, 1, 1,
0.6299546, -0.6579502, 2.165329, 0.4509804, 0, 1, 1,
0.6318254, 0.5791985, 0.614341, 0.4588235, 0, 1, 1,
0.6338162, 1.596394, 1.33635, 0.4627451, 0, 1, 1,
0.6360345, -0.1003794, 2.520546, 0.4705882, 0, 1, 1,
0.6428064, -0.3553642, 1.071925, 0.4745098, 0, 1, 1,
0.6429996, -2.0974, 3.905066, 0.4823529, 0, 1, 1,
0.6446078, -0.4178534, 3.030802, 0.4862745, 0, 1, 1,
0.6452737, -1.354629, 1.062301, 0.4941176, 0, 1, 1,
0.6535045, -1.760137, 3.251202, 0.5019608, 0, 1, 1,
0.6606543, -0.7094034, 1.613386, 0.5058824, 0, 1, 1,
0.6607124, -0.2432169, 0.9845754, 0.5137255, 0, 1, 1,
0.6636966, 0.1752917, 1.508504, 0.5176471, 0, 1, 1,
0.6708973, 0.2097536, -1.903632, 0.5254902, 0, 1, 1,
0.6733289, -1.026594, 3.270299, 0.5294118, 0, 1, 1,
0.6768584, 0.1068566, 1.39227, 0.5372549, 0, 1, 1,
0.6775457, 0.4330517, 0.5338541, 0.5411765, 0, 1, 1,
0.6799989, 0.9030353, 0.3319468, 0.5490196, 0, 1, 1,
0.6947294, 0.2184049, 0.5622515, 0.5529412, 0, 1, 1,
0.6950361, 0.5894981, -0.5018171, 0.5607843, 0, 1, 1,
0.6977036, 1.273217, -1.831021, 0.5647059, 0, 1, 1,
0.7010003, 0.4033008, 0.8455922, 0.572549, 0, 1, 1,
0.7017509, -2.070772, 1.45814, 0.5764706, 0, 1, 1,
0.7065375, -0.2132925, 0.6859571, 0.5843138, 0, 1, 1,
0.7090111, 0.3784878, 1.27877, 0.5882353, 0, 1, 1,
0.7093016, 1.057962, -0.6305105, 0.5960785, 0, 1, 1,
0.7132144, 2.118874, 1.033648, 0.6039216, 0, 1, 1,
0.7185861, 0.3676094, 0.4514846, 0.6078432, 0, 1, 1,
0.7188944, 0.3560903, 0.6166788, 0.6156863, 0, 1, 1,
0.729699, 0.1249403, 2.732462, 0.6196079, 0, 1, 1,
0.7392678, -0.9454171, 2.881275, 0.627451, 0, 1, 1,
0.7395843, 0.2348231, 1.503137, 0.6313726, 0, 1, 1,
0.7549506, 0.3057854, 2.668023, 0.6392157, 0, 1, 1,
0.7558569, 0.3605395, 1.486087, 0.6431373, 0, 1, 1,
0.7611736, 2.12034, 0.632682, 0.6509804, 0, 1, 1,
0.7632218, 1.146319, -0.6696098, 0.654902, 0, 1, 1,
0.764414, -0.146193, 2.078022, 0.6627451, 0, 1, 1,
0.7753544, 0.4349272, 1.246068, 0.6666667, 0, 1, 1,
0.7760469, 0.7831844, 1.598616, 0.6745098, 0, 1, 1,
0.7823933, -0.9215106, 4.584477, 0.6784314, 0, 1, 1,
0.7831712, 0.1896894, 1.260905, 0.6862745, 0, 1, 1,
0.7870865, 1.343694, -0.4638081, 0.6901961, 0, 1, 1,
0.7895547, -1.188236, 4.686124, 0.6980392, 0, 1, 1,
0.7899967, 1.045797, 0.2846822, 0.7058824, 0, 1, 1,
0.7950428, 0.1761044, 0.4373814, 0.7098039, 0, 1, 1,
0.8029014, 0.7464355, 0.8561773, 0.7176471, 0, 1, 1,
0.8084807, -0.7437103, 2.362369, 0.7215686, 0, 1, 1,
0.8096511, 2.50516, 0.1591527, 0.7294118, 0, 1, 1,
0.8197181, -1.065599, 1.766465, 0.7333333, 0, 1, 1,
0.8241311, -0.1652818, 1.249684, 0.7411765, 0, 1, 1,
0.8244278, 0.7509106, 1.230247, 0.7450981, 0, 1, 1,
0.8249757, -0.3953847, 1.451713, 0.7529412, 0, 1, 1,
0.8268396, -0.2317259, 0.5041831, 0.7568628, 0, 1, 1,
0.8281323, -0.1588121, 1.217613, 0.7647059, 0, 1, 1,
0.8312067, 0.1370591, 1.703607, 0.7686275, 0, 1, 1,
0.8323743, -2.507662, 4.606844, 0.7764706, 0, 1, 1,
0.8325565, 1.547018, -0.6113156, 0.7803922, 0, 1, 1,
0.8338068, 0.6211085, 1.172982, 0.7882353, 0, 1, 1,
0.8378726, -0.8052473, 1.452422, 0.7921569, 0, 1, 1,
0.8493645, -0.3423576, 2.32444, 0.8, 0, 1, 1,
0.8523762, -0.9528651, 2.502032, 0.8078431, 0, 1, 1,
0.8587846, -0.6392263, 3.362277, 0.8117647, 0, 1, 1,
0.8654749, -1.966085, 4.676081, 0.8196079, 0, 1, 1,
0.8662779, -0.7311602, 2.047941, 0.8235294, 0, 1, 1,
0.873638, -1.698571, 2.119124, 0.8313726, 0, 1, 1,
0.8789328, 0.8309172, 1.558946, 0.8352941, 0, 1, 1,
0.8843639, 0.485745, 1.034547, 0.8431373, 0, 1, 1,
0.8855072, -2.817546, 2.438948, 0.8470588, 0, 1, 1,
0.8858691, 1.107642, 0.9489201, 0.854902, 0, 1, 1,
0.8892623, 0.6860791, 0.8834933, 0.8588235, 0, 1, 1,
0.8944318, 1.385765, 0.1626154, 0.8666667, 0, 1, 1,
0.9014382, -0.2363839, 2.94932, 0.8705882, 0, 1, 1,
0.9022021, -0.6257035, 3.408062, 0.8784314, 0, 1, 1,
0.9035064, -0.1108121, 2.107994, 0.8823529, 0, 1, 1,
0.9044442, 0.4754387, 1.000426, 0.8901961, 0, 1, 1,
0.9062014, -0.383191, 0.9474578, 0.8941177, 0, 1, 1,
0.9069331, -2.796255, 1.709177, 0.9019608, 0, 1, 1,
0.9073334, 0.961524, 1.197045, 0.9098039, 0, 1, 1,
0.9111142, -1.719581, 3.503186, 0.9137255, 0, 1, 1,
0.9144173, -1.517079, 2.827286, 0.9215686, 0, 1, 1,
0.9181673, -0.3060113, 2.154062, 0.9254902, 0, 1, 1,
0.9341865, -1.018759, 1.630309, 0.9333333, 0, 1, 1,
0.9370705, -2.202202, 4.482094, 0.9372549, 0, 1, 1,
0.9441673, 1.308011, 0.1129076, 0.945098, 0, 1, 1,
0.9537579, -0.6722007, 1.768741, 0.9490196, 0, 1, 1,
0.9556153, -0.01785843, 1.108006, 0.9568627, 0, 1, 1,
0.9584354, -2.126717, 3.0567, 0.9607843, 0, 1, 1,
0.9588363, -0.9428132, 2.84141, 0.9686275, 0, 1, 1,
0.9637185, 1.225185, 1.235738, 0.972549, 0, 1, 1,
0.9675249, 0.1939049, 3.164077, 0.9803922, 0, 1, 1,
0.9681568, -0.1289811, 0.4598291, 0.9843137, 0, 1, 1,
0.9730235, -0.1981503, 2.252975, 0.9921569, 0, 1, 1,
0.9781572, -0.4460069, 1.457149, 0.9960784, 0, 1, 1,
0.9883387, -0.8660813, 2.291106, 1, 0, 0.9960784, 1,
0.9889249, 2.371958, -1.351682, 1, 0, 0.9882353, 1,
0.9894375, 0.8566219, -1.333703, 1, 0, 0.9843137, 1,
0.99254, -0.005410071, 2.298919, 1, 0, 0.9764706, 1,
0.9941447, 0.5303009, 1.001774, 1, 0, 0.972549, 1,
0.9951702, -0.698939, 1.379746, 1, 0, 0.9647059, 1,
0.9962413, 0.5256439, 2.081341, 1, 0, 0.9607843, 1,
0.9966266, 0.01921082, 1.990714, 1, 0, 0.9529412, 1,
0.9976285, 2.115223, -1.479886, 1, 0, 0.9490196, 1,
1.002557, -0.5885119, 1.039479, 1, 0, 0.9411765, 1,
1.003811, -0.6671792, 2.191014, 1, 0, 0.9372549, 1,
1.014259, -0.8636075, 2.747744, 1, 0, 0.9294118, 1,
1.015457, -0.5648058, 2.572308, 1, 0, 0.9254902, 1,
1.016504, 0.03045978, 0.5164047, 1, 0, 0.9176471, 1,
1.017088, 0.2059887, 1.993456, 1, 0, 0.9137255, 1,
1.017583, 0.001009085, 0.5441305, 1, 0, 0.9058824, 1,
1.022381, 0.257443, 1.451184, 1, 0, 0.9019608, 1,
1.030297, 0.8027729, -1.573091, 1, 0, 0.8941177, 1,
1.032178, 0.6810541, 0.5645496, 1, 0, 0.8862745, 1,
1.034581, -0.7383694, 3.862752, 1, 0, 0.8823529, 1,
1.04379, -0.3521074, 1.780347, 1, 0, 0.8745098, 1,
1.046903, 1.383235, 0.2411005, 1, 0, 0.8705882, 1,
1.055982, -1.199518, 2.516989, 1, 0, 0.8627451, 1,
1.061309, -1.139119, 2.478316, 1, 0, 0.8588235, 1,
1.06763, -0.3856452, 1.127603, 1, 0, 0.8509804, 1,
1.068799, -1.786452, 2.024291, 1, 0, 0.8470588, 1,
1.069689, -1.198859, 3.013927, 1, 0, 0.8392157, 1,
1.074415, -0.1506259, 2.506795, 1, 0, 0.8352941, 1,
1.083157, 0.8378705, 1.696, 1, 0, 0.827451, 1,
1.088964, 0.4694239, 1.199243, 1, 0, 0.8235294, 1,
1.09214, 1.726651, 0.6157534, 1, 0, 0.8156863, 1,
1.094531, -0.5759061, 1.671949, 1, 0, 0.8117647, 1,
1.098435, -0.7035254, 3.082975, 1, 0, 0.8039216, 1,
1.099811, 0.5772754, 2.110085, 1, 0, 0.7960784, 1,
1.115201, -0.5634262, 1.153729, 1, 0, 0.7921569, 1,
1.125457, 2.539402, -0.6766287, 1, 0, 0.7843137, 1,
1.134181, 1.538496, -0.2063718, 1, 0, 0.7803922, 1,
1.144516, -0.08891883, 1.94862, 1, 0, 0.772549, 1,
1.155613, -0.6798117, 2.651924, 1, 0, 0.7686275, 1,
1.161207, 0.6233017, 1.579027, 1, 0, 0.7607843, 1,
1.166387, -0.1549842, 3.289636, 1, 0, 0.7568628, 1,
1.166886, -0.04672146, 2.731384, 1, 0, 0.7490196, 1,
1.168009, 2.221025, 0.09474523, 1, 0, 0.7450981, 1,
1.171064, -0.5473108, 3.347144, 1, 0, 0.7372549, 1,
1.173354, -2.082117, 3.428278, 1, 0, 0.7333333, 1,
1.187237, 0.5125126, 0.8156321, 1, 0, 0.7254902, 1,
1.188246, -0.3665828, 3.84252, 1, 0, 0.7215686, 1,
1.188486, -0.8404881, 4.801022, 1, 0, 0.7137255, 1,
1.190319, -0.1482268, 0.2544285, 1, 0, 0.7098039, 1,
1.200067, -0.8538448, 1.264904, 1, 0, 0.7019608, 1,
1.208857, 0.6572404, 2.289868, 1, 0, 0.6941177, 1,
1.213289, 1.419628, 1.465596, 1, 0, 0.6901961, 1,
1.216434, 0.550551, 2.286581, 1, 0, 0.682353, 1,
1.230443, 0.5140287, 2.064899, 1, 0, 0.6784314, 1,
1.234001, -0.5131053, 3.522528, 1, 0, 0.6705883, 1,
1.237879, 1.134575, 0.7725201, 1, 0, 0.6666667, 1,
1.238896, -1.529198, 5.804376, 1, 0, 0.6588235, 1,
1.241227, 1.521284, -0.1286644, 1, 0, 0.654902, 1,
1.241585, -0.6750289, 1.059402, 1, 0, 0.6470588, 1,
1.247588, -0.5330342, 0.7446051, 1, 0, 0.6431373, 1,
1.250997, 0.8204257, 1.428053, 1, 0, 0.6352941, 1,
1.258142, 1.015362, 3.485482, 1, 0, 0.6313726, 1,
1.262901, -1.14052, 2.476793, 1, 0, 0.6235294, 1,
1.275495, 2.058378, 0.04084808, 1, 0, 0.6196079, 1,
1.290967, 1.267687, -0.4167947, 1, 0, 0.6117647, 1,
1.293543, -0.3258232, 2.111592, 1, 0, 0.6078432, 1,
1.307321, 1.456173, 0.1000909, 1, 0, 0.6, 1,
1.31481, -0.5604042, 1.786492, 1, 0, 0.5921569, 1,
1.325678, -0.8936344, 0.9418516, 1, 0, 0.5882353, 1,
1.336603, 0.3662996, -0.6173411, 1, 0, 0.5803922, 1,
1.340123, 1.285776, 0.3330491, 1, 0, 0.5764706, 1,
1.343294, 1.094125, 0.3469416, 1, 0, 0.5686275, 1,
1.345862, 1.566708, -0.02718753, 1, 0, 0.5647059, 1,
1.358534, 0.4794864, 3.269147, 1, 0, 0.5568628, 1,
1.368695, 0.8212399, 0.7602464, 1, 0, 0.5529412, 1,
1.377172, 0.1648205, 0.08416533, 1, 0, 0.5450981, 1,
1.378953, 0.2899754, 2.390319, 1, 0, 0.5411765, 1,
1.383655, 0.9903581, 2.016521, 1, 0, 0.5333334, 1,
1.386245, 0.3451004, 0.4426078, 1, 0, 0.5294118, 1,
1.39916, -0.3632706, -0.4520755, 1, 0, 0.5215687, 1,
1.404479, -1.472831, 2.300948, 1, 0, 0.5176471, 1,
1.407425, 0.01364015, 0.7218261, 1, 0, 0.509804, 1,
1.41111, 0.9124762, 0.1091334, 1, 0, 0.5058824, 1,
1.412139, -0.5820451, 2.244362, 1, 0, 0.4980392, 1,
1.412972, 0.4101108, 0.6495628, 1, 0, 0.4901961, 1,
1.414743, -0.2183466, 0.09241942, 1, 0, 0.4862745, 1,
1.416859, 1.061274, 0.3016078, 1, 0, 0.4784314, 1,
1.422269, -1.693336, 4.171996, 1, 0, 0.4745098, 1,
1.422913, -0.6865774, 1.898266, 1, 0, 0.4666667, 1,
1.431566, -0.6976942, -0.6010622, 1, 0, 0.4627451, 1,
1.432905, 1.10824, 1.137447, 1, 0, 0.454902, 1,
1.437346, -0.164372, 2.469742, 1, 0, 0.4509804, 1,
1.451152, 1.84822, 0.6061681, 1, 0, 0.4431373, 1,
1.45447, 1.050448, 0.2344086, 1, 0, 0.4392157, 1,
1.460436, 0.2752915, -0.1787897, 1, 0, 0.4313726, 1,
1.470314, -0.4826334, 2.191819, 1, 0, 0.427451, 1,
1.487074, -0.9909225, 4.187036, 1, 0, 0.4196078, 1,
1.491898, -0.3208009, 0.5745872, 1, 0, 0.4156863, 1,
1.494805, -1.199369, 3.326202, 1, 0, 0.4078431, 1,
1.500324, 0.9382001, 2.48198, 1, 0, 0.4039216, 1,
1.510815, 1.381486, -1.143756, 1, 0, 0.3960784, 1,
1.515805, 0.7104785, 1.386556, 1, 0, 0.3882353, 1,
1.553057, -0.8737395, 2.454854, 1, 0, 0.3843137, 1,
1.554739, -1.247769, 0.594433, 1, 0, 0.3764706, 1,
1.560854, -2.474643, 2.618902, 1, 0, 0.372549, 1,
1.570225, 1.826299, 1.002895, 1, 0, 0.3647059, 1,
1.579886, -1.136467, 3.284628, 1, 0, 0.3607843, 1,
1.582814, -1.09669, 3.311318, 1, 0, 0.3529412, 1,
1.585846, -1.682639, 4.076158, 1, 0, 0.3490196, 1,
1.592253, -0.2911716, 2.080769, 1, 0, 0.3411765, 1,
1.610362, -0.3760202, 0.988323, 1, 0, 0.3372549, 1,
1.615362, -1.520134, 1.971471, 1, 0, 0.3294118, 1,
1.620355, 0.468412, 1.512452, 1, 0, 0.3254902, 1,
1.626444, 0.3608687, 2.160337, 1, 0, 0.3176471, 1,
1.633799, -0.3058638, 2.393361, 1, 0, 0.3137255, 1,
1.636647, 1.82306, -0.701565, 1, 0, 0.3058824, 1,
1.641906, 0.4694744, 0.6194799, 1, 0, 0.2980392, 1,
1.672237, -0.4151109, 1.649627, 1, 0, 0.2941177, 1,
1.679357, 0.4328874, 1.52793, 1, 0, 0.2862745, 1,
1.694011, -0.6239151, 0.7575862, 1, 0, 0.282353, 1,
1.694893, -0.5192709, 2.236078, 1, 0, 0.2745098, 1,
1.706995, 0.4078424, 1.51089, 1, 0, 0.2705882, 1,
1.716015, 1.980034, -0.9660903, 1, 0, 0.2627451, 1,
1.735012, 0.4243816, 0.4552515, 1, 0, 0.2588235, 1,
1.739081, 0.5008332, 1.263623, 1, 0, 0.2509804, 1,
1.756613, -0.2005765, 0.04827002, 1, 0, 0.2470588, 1,
1.761343, 0.7183112, 1.453661, 1, 0, 0.2392157, 1,
1.767828, 1.444047, 1.597856, 1, 0, 0.2352941, 1,
1.782226, -1.719061, 2.39496, 1, 0, 0.227451, 1,
1.786985, 1.58977, 1.287099, 1, 0, 0.2235294, 1,
1.794167, -0.3425803, 1.09994, 1, 0, 0.2156863, 1,
1.804543, 0.2262638, 0.4766694, 1, 0, 0.2117647, 1,
1.815521, -1.677031, 2.586343, 1, 0, 0.2039216, 1,
1.815793, -1.581448, 1.345224, 1, 0, 0.1960784, 1,
1.8239, 0.2682847, 0.07693955, 1, 0, 0.1921569, 1,
1.824926, 0.5556112, 1.253177, 1, 0, 0.1843137, 1,
1.829329, -0.8011233, 1.540469, 1, 0, 0.1803922, 1,
1.830634, -0.4815856, 1.312972, 1, 0, 0.172549, 1,
1.8664, 0.9615514, -2.379313, 1, 0, 0.1686275, 1,
1.879239, 0.01022622, 2.55911, 1, 0, 0.1607843, 1,
1.901057, -1.110224, 3.204596, 1, 0, 0.1568628, 1,
1.916621, 0.01237256, 1.486585, 1, 0, 0.1490196, 1,
1.946017, -0.2055335, 1.451076, 1, 0, 0.145098, 1,
1.950892, 0.752794, 0.1199945, 1, 0, 0.1372549, 1,
1.981436, -0.3437364, 2.006155, 1, 0, 0.1333333, 1,
2.001445, -2.494659, 2.440317, 1, 0, 0.1254902, 1,
2.022685, -0.124161, 2.048596, 1, 0, 0.1215686, 1,
2.071353, -0.4429126, 0.8581912, 1, 0, 0.1137255, 1,
2.080144, -0.273923, -0.1235242, 1, 0, 0.1098039, 1,
2.081244, -0.3388918, 1.334825, 1, 0, 0.1019608, 1,
2.086433, 0.2025201, 1.018658, 1, 0, 0.09411765, 1,
2.1056, 0.6645529, 2.617836, 1, 0, 0.09019608, 1,
2.142965, -0.9110945, 0.2630891, 1, 0, 0.08235294, 1,
2.16544, 1.09606, 2.288707, 1, 0, 0.07843138, 1,
2.176012, 0.4754675, 1.129, 1, 0, 0.07058824, 1,
2.205042, 0.4697092, 1.585424, 1, 0, 0.06666667, 1,
2.252495, 1.376764, 0.4633226, 1, 0, 0.05882353, 1,
2.398343, 1.255957, 1.51411, 1, 0, 0.05490196, 1,
2.453022, -1.052449, 2.135641, 1, 0, 0.04705882, 1,
2.45727, 0.9096607, 0.9546145, 1, 0, 0.04313726, 1,
2.479656, -0.6207941, -0.1069246, 1, 0, 0.03529412, 1,
2.59402, 0.666663, -0.4534057, 1, 0, 0.03137255, 1,
2.624854, 0.5746375, 0.9848334, 1, 0, 0.02352941, 1,
2.781182, 0.4440725, 1.510169, 1, 0, 0.01960784, 1,
2.838336, -0.4244977, 0.8896826, 1, 0, 0.01176471, 1,
3.459976, 0.6930059, 1.762187, 1, 0, 0.007843138, 1
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
-0.03435194, -4.343948, -7.176133, 0, -0.5, 0.5, 0.5,
-0.03435194, -4.343948, -7.176133, 1, -0.5, 0.5, 0.5,
-0.03435194, -4.343948, -7.176133, 1, 1.5, 0.5, 0.5,
-0.03435194, -4.343948, -7.176133, 0, 1.5, 0.5, 0.5
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
-4.713258, -0.03288424, -7.176133, 0, -0.5, 0.5, 0.5,
-4.713258, -0.03288424, -7.176133, 1, -0.5, 0.5, 0.5,
-4.713258, -0.03288424, -7.176133, 1, 1.5, 0.5, 0.5,
-4.713258, -0.03288424, -7.176133, 0, 1.5, 0.5, 0.5
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
-4.713258, -4.343948, 0.2547784, 0, -0.5, 0.5, 0.5,
-4.713258, -4.343948, 0.2547784, 1, -0.5, 0.5, 0.5,
-4.713258, -4.343948, 0.2547784, 1, 1.5, 0.5, 0.5,
-4.713258, -4.343948, 0.2547784, 0, 1.5, 0.5, 0.5
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
-3, -3.349087, -5.461308,
3, -3.349087, -5.461308,
-3, -3.349087, -5.461308,
-3, -3.514897, -5.747112,
-2, -3.349087, -5.461308,
-2, -3.514897, -5.747112,
-1, -3.349087, -5.461308,
-1, -3.514897, -5.747112,
0, -3.349087, -5.461308,
0, -3.514897, -5.747112,
1, -3.349087, -5.461308,
1, -3.514897, -5.747112,
2, -3.349087, -5.461308,
2, -3.514897, -5.747112,
3, -3.349087, -5.461308,
3, -3.514897, -5.747112
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
-3, -3.846518, -6.31872, 0, -0.5, 0.5, 0.5,
-3, -3.846518, -6.31872, 1, -0.5, 0.5, 0.5,
-3, -3.846518, -6.31872, 1, 1.5, 0.5, 0.5,
-3, -3.846518, -6.31872, 0, 1.5, 0.5, 0.5,
-2, -3.846518, -6.31872, 0, -0.5, 0.5, 0.5,
-2, -3.846518, -6.31872, 1, -0.5, 0.5, 0.5,
-2, -3.846518, -6.31872, 1, 1.5, 0.5, 0.5,
-2, -3.846518, -6.31872, 0, 1.5, 0.5, 0.5,
-1, -3.846518, -6.31872, 0, -0.5, 0.5, 0.5,
-1, -3.846518, -6.31872, 1, -0.5, 0.5, 0.5,
-1, -3.846518, -6.31872, 1, 1.5, 0.5, 0.5,
-1, -3.846518, -6.31872, 0, 1.5, 0.5, 0.5,
0, -3.846518, -6.31872, 0, -0.5, 0.5, 0.5,
0, -3.846518, -6.31872, 1, -0.5, 0.5, 0.5,
0, -3.846518, -6.31872, 1, 1.5, 0.5, 0.5,
0, -3.846518, -6.31872, 0, 1.5, 0.5, 0.5,
1, -3.846518, -6.31872, 0, -0.5, 0.5, 0.5,
1, -3.846518, -6.31872, 1, -0.5, 0.5, 0.5,
1, -3.846518, -6.31872, 1, 1.5, 0.5, 0.5,
1, -3.846518, -6.31872, 0, 1.5, 0.5, 0.5,
2, -3.846518, -6.31872, 0, -0.5, 0.5, 0.5,
2, -3.846518, -6.31872, 1, -0.5, 0.5, 0.5,
2, -3.846518, -6.31872, 1, 1.5, 0.5, 0.5,
2, -3.846518, -6.31872, 0, 1.5, 0.5, 0.5,
3, -3.846518, -6.31872, 0, -0.5, 0.5, 0.5,
3, -3.846518, -6.31872, 1, -0.5, 0.5, 0.5,
3, -3.846518, -6.31872, 1, 1.5, 0.5, 0.5,
3, -3.846518, -6.31872, 0, 1.5, 0.5, 0.5
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
-3.63351, -3, -5.461308,
-3.63351, 3, -5.461308,
-3.63351, -3, -5.461308,
-3.813468, -3, -5.747112,
-3.63351, -2, -5.461308,
-3.813468, -2, -5.747112,
-3.63351, -1, -5.461308,
-3.813468, -1, -5.747112,
-3.63351, 0, -5.461308,
-3.813468, 0, -5.747112,
-3.63351, 1, -5.461308,
-3.813468, 1, -5.747112,
-3.63351, 2, -5.461308,
-3.813468, 2, -5.747112,
-3.63351, 3, -5.461308,
-3.813468, 3, -5.747112
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
-4.173384, -3, -6.31872, 0, -0.5, 0.5, 0.5,
-4.173384, -3, -6.31872, 1, -0.5, 0.5, 0.5,
-4.173384, -3, -6.31872, 1, 1.5, 0.5, 0.5,
-4.173384, -3, -6.31872, 0, 1.5, 0.5, 0.5,
-4.173384, -2, -6.31872, 0, -0.5, 0.5, 0.5,
-4.173384, -2, -6.31872, 1, -0.5, 0.5, 0.5,
-4.173384, -2, -6.31872, 1, 1.5, 0.5, 0.5,
-4.173384, -2, -6.31872, 0, 1.5, 0.5, 0.5,
-4.173384, -1, -6.31872, 0, -0.5, 0.5, 0.5,
-4.173384, -1, -6.31872, 1, -0.5, 0.5, 0.5,
-4.173384, -1, -6.31872, 1, 1.5, 0.5, 0.5,
-4.173384, -1, -6.31872, 0, 1.5, 0.5, 0.5,
-4.173384, 0, -6.31872, 0, -0.5, 0.5, 0.5,
-4.173384, 0, -6.31872, 1, -0.5, 0.5, 0.5,
-4.173384, 0, -6.31872, 1, 1.5, 0.5, 0.5,
-4.173384, 0, -6.31872, 0, 1.5, 0.5, 0.5,
-4.173384, 1, -6.31872, 0, -0.5, 0.5, 0.5,
-4.173384, 1, -6.31872, 1, -0.5, 0.5, 0.5,
-4.173384, 1, -6.31872, 1, 1.5, 0.5, 0.5,
-4.173384, 1, -6.31872, 0, 1.5, 0.5, 0.5,
-4.173384, 2, -6.31872, 0, -0.5, 0.5, 0.5,
-4.173384, 2, -6.31872, 1, -0.5, 0.5, 0.5,
-4.173384, 2, -6.31872, 1, 1.5, 0.5, 0.5,
-4.173384, 2, -6.31872, 0, 1.5, 0.5, 0.5,
-4.173384, 3, -6.31872, 0, -0.5, 0.5, 0.5,
-4.173384, 3, -6.31872, 1, -0.5, 0.5, 0.5,
-4.173384, 3, -6.31872, 1, 1.5, 0.5, 0.5,
-4.173384, 3, -6.31872, 0, 1.5, 0.5, 0.5
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
-3.63351, -3.349087, -4,
-3.63351, -3.349087, 4,
-3.63351, -3.349087, -4,
-3.813468, -3.514897, -4,
-3.63351, -3.349087, -2,
-3.813468, -3.514897, -2,
-3.63351, -3.349087, 0,
-3.813468, -3.514897, 0,
-3.63351, -3.349087, 2,
-3.813468, -3.514897, 2,
-3.63351, -3.349087, 4,
-3.813468, -3.514897, 4
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
-4.173384, -3.846518, -4, 0, -0.5, 0.5, 0.5,
-4.173384, -3.846518, -4, 1, -0.5, 0.5, 0.5,
-4.173384, -3.846518, -4, 1, 1.5, 0.5, 0.5,
-4.173384, -3.846518, -4, 0, 1.5, 0.5, 0.5,
-4.173384, -3.846518, -2, 0, -0.5, 0.5, 0.5,
-4.173384, -3.846518, -2, 1, -0.5, 0.5, 0.5,
-4.173384, -3.846518, -2, 1, 1.5, 0.5, 0.5,
-4.173384, -3.846518, -2, 0, 1.5, 0.5, 0.5,
-4.173384, -3.846518, 0, 0, -0.5, 0.5, 0.5,
-4.173384, -3.846518, 0, 1, -0.5, 0.5, 0.5,
-4.173384, -3.846518, 0, 1, 1.5, 0.5, 0.5,
-4.173384, -3.846518, 0, 0, 1.5, 0.5, 0.5,
-4.173384, -3.846518, 2, 0, -0.5, 0.5, 0.5,
-4.173384, -3.846518, 2, 1, -0.5, 0.5, 0.5,
-4.173384, -3.846518, 2, 1, 1.5, 0.5, 0.5,
-4.173384, -3.846518, 2, 0, 1.5, 0.5, 0.5,
-4.173384, -3.846518, 4, 0, -0.5, 0.5, 0.5,
-4.173384, -3.846518, 4, 1, -0.5, 0.5, 0.5,
-4.173384, -3.846518, 4, 1, 1.5, 0.5, 0.5,
-4.173384, -3.846518, 4, 0, 1.5, 0.5, 0.5
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
-3.63351, -3.349087, -5.461308,
-3.63351, 3.283319, -5.461308,
-3.63351, -3.349087, 5.970864,
-3.63351, 3.283319, 5.970864,
-3.63351, -3.349087, -5.461308,
-3.63351, -3.349087, 5.970864,
-3.63351, 3.283319, -5.461308,
-3.63351, 3.283319, 5.970864,
-3.63351, -3.349087, -5.461308,
3.564806, -3.349087, -5.461308,
-3.63351, -3.349087, 5.970864,
3.564806, -3.349087, 5.970864,
-3.63351, 3.283319, -5.461308,
3.564806, 3.283319, -5.461308,
-3.63351, 3.283319, 5.970864,
3.564806, 3.283319, 5.970864,
3.564806, -3.349087, -5.461308,
3.564806, 3.283319, -5.461308,
3.564806, -3.349087, 5.970864,
3.564806, 3.283319, 5.970864,
3.564806, -3.349087, -5.461308,
3.564806, -3.349087, 5.970864,
3.564806, 3.283319, -5.461308,
3.564806, 3.283319, 5.970864
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
var radius = 8.036348;
var distance = 35.75462;
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
mvMatrix.translate( 0.03435194, 0.03288424, -0.2547784 );
mvMatrix.scale( 1.207096, 1.310091, 0.760053 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.75462);
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
Phoxim<-read.table("Phoxim.xyz")
```

```
## Error in read.table("Phoxim.xyz"): no lines available in input
```

```r
x<-Phoxim$V2
```

```
## Error in eval(expr, envir, enclos): object 'Phoxim' not found
```

```r
y<-Phoxim$V3
```

```
## Error in eval(expr, envir, enclos): object 'Phoxim' not found
```

```r
z<-Phoxim$V4
```

```
## Error in eval(expr, envir, enclos): object 'Phoxim' not found
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
-3.52868, -0.3781004, -2.233028, 0, 0, 1, 1, 1,
-3.079451, -1.022473, -1.623363, 1, 0, 0, 1, 1,
-3.010925, 0.6447899, -3.167326, 1, 0, 0, 1, 1,
-2.748352, -1.035133, -0.6784306, 1, 0, 0, 1, 1,
-2.668616, 0.5803362, -0.383753, 1, 0, 0, 1, 1,
-2.643093, 0.1126026, 0.04665027, 1, 0, 0, 1, 1,
-2.626922, -0.425914, -1.829594, 0, 0, 0, 1, 1,
-2.609757, -0.9632167, -2.566882, 0, 0, 0, 1, 1,
-2.559655, 0.7558009, -1.487712, 0, 0, 0, 1, 1,
-2.539069, -0.4159611, -0.902563, 0, 0, 0, 1, 1,
-2.534308, -0.4080076, -2.814327, 0, 0, 0, 1, 1,
-2.529525, 1.468918, -2.395634, 0, 0, 0, 1, 1,
-2.405646, -0.4304181, -1.543093, 0, 0, 0, 1, 1,
-2.278995, 0.4850406, -1.729838, 1, 1, 1, 1, 1,
-2.248728, -0.6046001, -2.08159, 1, 1, 1, 1, 1,
-2.246031, 1.432782, -1.020315, 1, 1, 1, 1, 1,
-2.21487, -0.4272752, -0.8986529, 1, 1, 1, 1, 1,
-2.162597, 0.5210584, -1.205172, 1, 1, 1, 1, 1,
-2.109797, 0.492818, -1.934831, 1, 1, 1, 1, 1,
-2.05756, -0.7429671, -2.574754, 1, 1, 1, 1, 1,
-2.055657, 1.417638, -1.145427, 1, 1, 1, 1, 1,
-2.032362, 1.23527, -1.552406, 1, 1, 1, 1, 1,
-2.028958, 0.8322508, -0.6334546, 1, 1, 1, 1, 1,
-2.024004, 0.4269042, -1.878658, 1, 1, 1, 1, 1,
-1.996812, 1.802201, -1.476746, 1, 1, 1, 1, 1,
-1.994866, 0.3414664, -0.8050832, 1, 1, 1, 1, 1,
-1.987964, 1.536333, -1.388774, 1, 1, 1, 1, 1,
-1.959757, 1.805026, -0.6665108, 1, 1, 1, 1, 1,
-1.959292, -0.6074038, -2.252602, 0, 0, 1, 1, 1,
-1.955617, 0.6346506, -2.913187, 1, 0, 0, 1, 1,
-1.950726, -2.182321, -2.829893, 1, 0, 0, 1, 1,
-1.875737, 0.327431, -1.97126, 1, 0, 0, 1, 1,
-1.874797, -0.785974, -3.08902, 1, 0, 0, 1, 1,
-1.865113, 0.801833, -1.804767, 1, 0, 0, 1, 1,
-1.856908, -0.6563609, -0.6147941, 0, 0, 0, 1, 1,
-1.82461, 0.1315361, -2.317245, 0, 0, 0, 1, 1,
-1.823963, 0.188049, -2.401376, 0, 0, 0, 1, 1,
-1.814376, -2.073942, -2.141851, 0, 0, 0, 1, 1,
-1.813925, 0.9917467, -1.965005, 0, 0, 0, 1, 1,
-1.80676, -0.1163027, -3.741151, 0, 0, 0, 1, 1,
-1.792537, 0.1451196, 0.604143, 0, 0, 0, 1, 1,
-1.790451, -0.8007125, -1.140807, 1, 1, 1, 1, 1,
-1.790154, -0.4861041, -2.054851, 1, 1, 1, 1, 1,
-1.780429, 0.7994018, -1.619447, 1, 1, 1, 1, 1,
-1.771902, 1.561704, -0.9613862, 1, 1, 1, 1, 1,
-1.75522, 0.1238262, -1.674769, 1, 1, 1, 1, 1,
-1.755174, 0.844624, -3.040708, 1, 1, 1, 1, 1,
-1.754945, -1.139251, -3.505764, 1, 1, 1, 1, 1,
-1.753615, 0.7947847, -0.8546942, 1, 1, 1, 1, 1,
-1.745911, 0.1466929, -0.9337587, 1, 1, 1, 1, 1,
-1.738808, 1.556931, -0.5332183, 1, 1, 1, 1, 1,
-1.733863, -0.7401127, -2.697144, 1, 1, 1, 1, 1,
-1.722976, 1.596628, 0.06255125, 1, 1, 1, 1, 1,
-1.720416, -1.067611, -1.415133, 1, 1, 1, 1, 1,
-1.703184, -2.885296, -1.489673, 1, 1, 1, 1, 1,
-1.684548, 0.2969042, 0.4483963, 1, 1, 1, 1, 1,
-1.680805, -0.3944746, -1.372411, 0, 0, 1, 1, 1,
-1.675129, -0.5968105, -2.657279, 1, 0, 0, 1, 1,
-1.665079, 0.825682, -1.062799, 1, 0, 0, 1, 1,
-1.663563, -1.401453, -2.101163, 1, 0, 0, 1, 1,
-1.663453, -1.7241, -2.581138, 1, 0, 0, 1, 1,
-1.65997, 1.687346, -0.9895477, 1, 0, 0, 1, 1,
-1.629104, -1.969961, -3.065002, 0, 0, 0, 1, 1,
-1.61772, 0.05357042, -3.164854, 0, 0, 0, 1, 1,
-1.610924, 0.0517301, -2.412906, 0, 0, 0, 1, 1,
-1.60383, 0.1402808, -3.240602, 0, 0, 0, 1, 1,
-1.590891, 1.362521, -0.6156593, 0, 0, 0, 1, 1,
-1.583938, 0.6896425, -1.556085, 0, 0, 0, 1, 1,
-1.58233, -0.269344, -0.6974, 0, 0, 0, 1, 1,
-1.575498, -0.8824708, -2.410353, 1, 1, 1, 1, 1,
-1.573689, -0.1277771, -2.77099, 1, 1, 1, 1, 1,
-1.570619, 0.7467142, -1.819252, 1, 1, 1, 1, 1,
-1.567291, -1.174073, -3.301789, 1, 1, 1, 1, 1,
-1.565816, 2.373032, -1.278093, 1, 1, 1, 1, 1,
-1.55048, -1.322039, -2.680442, 1, 1, 1, 1, 1,
-1.542215, -2.033262, -1.55326, 1, 1, 1, 1, 1,
-1.540485, 0.8855743, -1.056269, 1, 1, 1, 1, 1,
-1.533412, -0.5504829, -0.1437181, 1, 1, 1, 1, 1,
-1.53279, -0.5113068, -2.214566, 1, 1, 1, 1, 1,
-1.528795, -0.3938657, -1.707369, 1, 1, 1, 1, 1,
-1.516059, 0.8919604, -2.055389, 1, 1, 1, 1, 1,
-1.510468, -0.8607156, -3.358947, 1, 1, 1, 1, 1,
-1.505338, 1.257969, -1.778967, 1, 1, 1, 1, 1,
-1.501184, -0.8383135, -1.722561, 1, 1, 1, 1, 1,
-1.499261, -1.23142, -3.759374, 0, 0, 1, 1, 1,
-1.495669, 1.015063, -0.4355441, 1, 0, 0, 1, 1,
-1.489574, -1.291036, -1.813488, 1, 0, 0, 1, 1,
-1.485952, 0.3038309, -2.039434, 1, 0, 0, 1, 1,
-1.485587, -0.8890197, -2.52582, 1, 0, 0, 1, 1,
-1.484387, -1.789516, -3.830624, 1, 0, 0, 1, 1,
-1.482784, -1.238715, -3.750845, 0, 0, 0, 1, 1,
-1.479005, 0.1320886, -2.465231, 0, 0, 0, 1, 1,
-1.472599, -2.635805, -0.848855, 0, 0, 0, 1, 1,
-1.470157, -0.2013762, 0.2726937, 0, 0, 0, 1, 1,
-1.467921, -3.252499, -3.007652, 0, 0, 0, 1, 1,
-1.448025, -0.7766634, -1.056927, 0, 0, 0, 1, 1,
-1.447169, 1.881421, -1.329787, 0, 0, 0, 1, 1,
-1.44655, 0.3930205, -1.753554, 1, 1, 1, 1, 1,
-1.436118, 0.4286796, 1.057848, 1, 1, 1, 1, 1,
-1.428027, -0.1746524, -1.224017, 1, 1, 1, 1, 1,
-1.425064, -0.04823751, -3.014556, 1, 1, 1, 1, 1,
-1.423404, 1.452094, -0.8093224, 1, 1, 1, 1, 1,
-1.401538, 1.207974, -0.3144075, 1, 1, 1, 1, 1,
-1.399893, 1.624133, -0.07472534, 1, 1, 1, 1, 1,
-1.384815, 1.780827, -0.3340136, 1, 1, 1, 1, 1,
-1.373797, -0.7937748, -2.695172, 1, 1, 1, 1, 1,
-1.365285, -0.3546202, -1.380454, 1, 1, 1, 1, 1,
-1.362764, 0.849793, -1.602623, 1, 1, 1, 1, 1,
-1.359638, -0.4944205, -2.762653, 1, 1, 1, 1, 1,
-1.356135, 1.464069, -0.7402921, 1, 1, 1, 1, 1,
-1.347216, 0.3247332, -0.3756253, 1, 1, 1, 1, 1,
-1.341772, -1.654135, -3.151978, 1, 1, 1, 1, 1,
-1.336027, -2.127427, -3.074871, 0, 0, 1, 1, 1,
-1.333018, 0.3215725, -1.439939, 1, 0, 0, 1, 1,
-1.324294, 0.5241623, -3.255035, 1, 0, 0, 1, 1,
-1.316362, -1.430158, -2.973016, 1, 0, 0, 1, 1,
-1.313184, 1.366198, -1.616407, 1, 0, 0, 1, 1,
-1.310266, -0.4336533, 0.02212068, 1, 0, 0, 1, 1,
-1.306448, 0.9679964, -1.152189, 0, 0, 0, 1, 1,
-1.265573, 0.6669545, -0.8945165, 0, 0, 0, 1, 1,
-1.245973, -0.520126, 0.2513638, 0, 0, 0, 1, 1,
-1.245512, -1.728279, -1.610551, 0, 0, 0, 1, 1,
-1.238577, 1.726697, -2.122166, 0, 0, 0, 1, 1,
-1.237822, 1.176671, -1.310633, 0, 0, 0, 1, 1,
-1.226748, 1.148371, -1.682639, 0, 0, 0, 1, 1,
-1.220558, 0.879508, 0.4934705, 1, 1, 1, 1, 1,
-1.220411, 0.7962399, -2.427706, 1, 1, 1, 1, 1,
-1.215961, -0.9138142, -2.322021, 1, 1, 1, 1, 1,
-1.205095, -0.3243607, -2.079974, 1, 1, 1, 1, 1,
-1.199829, -0.3752729, -3.042024, 1, 1, 1, 1, 1,
-1.196476, -0.9574986, -2.736382, 1, 1, 1, 1, 1,
-1.191617, -0.1529523, -1.894365, 1, 1, 1, 1, 1,
-1.188786, -0.1916575, -3.532679, 1, 1, 1, 1, 1,
-1.186122, -0.9751053, -1.777202, 1, 1, 1, 1, 1,
-1.185049, 0.3994529, -3.348854, 1, 1, 1, 1, 1,
-1.181755, -0.02950283, -1.466447, 1, 1, 1, 1, 1,
-1.177152, -0.3462671, -4.00368, 1, 1, 1, 1, 1,
-1.175797, -0.5435429, -0.5495654, 1, 1, 1, 1, 1,
-1.175416, -2.378997, -2.275049, 1, 1, 1, 1, 1,
-1.160672, 0.7305949, -0.9110129, 1, 1, 1, 1, 1,
-1.158355, -0.9790028, -2.003772, 0, 0, 1, 1, 1,
-1.154224, -1.888644, -2.719007, 1, 0, 0, 1, 1,
-1.146455, -0.3150691, -3.735151, 1, 0, 0, 1, 1,
-1.139616, -1.02328, -2.518992, 1, 0, 0, 1, 1,
-1.138362, -0.2064807, -3.090713, 1, 0, 0, 1, 1,
-1.137342, 2.136957, -1.442245, 1, 0, 0, 1, 1,
-1.137143, 1.25488, 0.3236044, 0, 0, 0, 1, 1,
-1.135529, 0.1932401, -3.629285, 0, 0, 0, 1, 1,
-1.133601, 0.3064614, -2.499467, 0, 0, 0, 1, 1,
-1.12629, -1.57469, -2.839071, 0, 0, 0, 1, 1,
-1.125933, -2.175591, -3.021056, 0, 0, 0, 1, 1,
-1.122482, -0.4066181, -2.833221, 0, 0, 0, 1, 1,
-1.116773, 1.395688, -0.3246181, 0, 0, 0, 1, 1,
-1.113387, -0.6496059, -1.863177, 1, 1, 1, 1, 1,
-1.108091, 0.8439927, -1.062058, 1, 1, 1, 1, 1,
-1.107042, 0.0267084, -0.583104, 1, 1, 1, 1, 1,
-1.101424, -1.310274, -3.104394, 1, 1, 1, 1, 1,
-1.100722, 0.5281814, -1.041485, 1, 1, 1, 1, 1,
-1.097914, 0.1493224, -1.037692, 1, 1, 1, 1, 1,
-1.085597, 1.685279, -0.2985908, 1, 1, 1, 1, 1,
-1.083005, 0.9578016, -1.44307, 1, 1, 1, 1, 1,
-1.082819, -0.7091668, -2.017242, 1, 1, 1, 1, 1,
-1.07674, -0.8609, -2.91964, 1, 1, 1, 1, 1,
-1.071875, -0.5162064, -1.979863, 1, 1, 1, 1, 1,
-1.07146, 0.8053855, 0.6453267, 1, 1, 1, 1, 1,
-1.064792, -1.27944, -1.432024, 1, 1, 1, 1, 1,
-1.060997, -1.337542, -2.156411, 1, 1, 1, 1, 1,
-1.059425, -1.521259, -2.993574, 1, 1, 1, 1, 1,
-1.056306, 1.007449, 0.3044299, 0, 0, 1, 1, 1,
-1.055115, 0.0119263, -1.439786, 1, 0, 0, 1, 1,
-1.052438, 0.01496963, -1.20546, 1, 0, 0, 1, 1,
-1.051622, -0.9311505, -2.462479, 1, 0, 0, 1, 1,
-1.043022, 1.065624, 0.4840019, 1, 0, 0, 1, 1,
-1.038097, 0.1746407, -0.2276596, 1, 0, 0, 1, 1,
-1.037879, 0.7487034, -0.2436886, 0, 0, 0, 1, 1,
-1.03708, -1.332575, -4.241697, 0, 0, 0, 1, 1,
-1.024379, -0.8472396, -2.161502, 0, 0, 0, 1, 1,
-1.023829, -0.5371244, -1.218871, 0, 0, 0, 1, 1,
-1.022636, 0.9044765, -1.613324, 0, 0, 0, 1, 1,
-1.021654, 1.601224, -2.145988, 0, 0, 0, 1, 1,
-1.015194, 0.7181961, -1.13168, 0, 0, 0, 1, 1,
-1.0144, -0.3241698, -2.51207, 1, 1, 1, 1, 1,
-1.013288, 1.303398, 0.04471925, 1, 1, 1, 1, 1,
-1.012114, 0.6840081, -1.456302, 1, 1, 1, 1, 1,
-1.003251, -2.354339, -2.311798, 1, 1, 1, 1, 1,
-0.9955125, -0.09238301, -3.463521, 1, 1, 1, 1, 1,
-0.9931498, 0.5103365, -0.7275873, 1, 1, 1, 1, 1,
-0.9878169, 0.02926508, -1.009047, 1, 1, 1, 1, 1,
-0.985993, -0.1347599, -2.189263, 1, 1, 1, 1, 1,
-0.9787445, -0.002323872, -3.215567, 1, 1, 1, 1, 1,
-0.9759018, -0.7404204, -1.390851, 1, 1, 1, 1, 1,
-0.9750137, 0.2391758, -2.513032, 1, 1, 1, 1, 1,
-0.9555376, -0.1414675, -2.105309, 1, 1, 1, 1, 1,
-0.9494616, 0.5327742, -1.542879, 1, 1, 1, 1, 1,
-0.9450216, 0.2996839, -1.644081, 1, 1, 1, 1, 1,
-0.9300646, 0.5384764, -0.4692954, 1, 1, 1, 1, 1,
-0.9283774, 0.6480088, -0.1605588, 0, 0, 1, 1, 1,
-0.926275, 0.03064115, -1.795061, 1, 0, 0, 1, 1,
-0.924937, 0.8608214, -1.304044, 1, 0, 0, 1, 1,
-0.9243535, 0.858408, -0.5239424, 1, 0, 0, 1, 1,
-0.9191226, -0.989242, -0.5346922, 1, 0, 0, 1, 1,
-0.9167131, 0.5022963, -1.886213, 1, 0, 0, 1, 1,
-0.9154397, 0.908182, -1.759769, 0, 0, 0, 1, 1,
-0.9120232, -1.377785, -0.6616386, 0, 0, 0, 1, 1,
-0.9041284, 2.073596, 0.5235819, 0, 0, 0, 1, 1,
-0.8997241, -0.4535736, -0.5967941, 0, 0, 0, 1, 1,
-0.8989047, 0.09445696, 0.01957082, 0, 0, 0, 1, 1,
-0.8863454, -0.5174759, -1.924684, 0, 0, 0, 1, 1,
-0.8849692, -0.1120096, -2.625973, 0, 0, 0, 1, 1,
-0.8845002, 0.5032101, -2.417457, 1, 1, 1, 1, 1,
-0.8796077, -1.719969, -2.93182, 1, 1, 1, 1, 1,
-0.8755378, 0.5084456, 0.9025682, 1, 1, 1, 1, 1,
-0.8721756, 0.03039788, 0.000533061, 1, 1, 1, 1, 1,
-0.8705112, 0.5691724, -2.199186, 1, 1, 1, 1, 1,
-0.8580818, -0.6028731, -2.113712, 1, 1, 1, 1, 1,
-0.8562366, -0.2490171, -1.307426, 1, 1, 1, 1, 1,
-0.8547618, -0.7201231, -2.138688, 1, 1, 1, 1, 1,
-0.8538696, -0.04897795, -1.837413, 1, 1, 1, 1, 1,
-0.8535336, -1.212527, -1.518136, 1, 1, 1, 1, 1,
-0.8501414, 1.374045, -1.207876, 1, 1, 1, 1, 1,
-0.8435477, 0.6604971, -1.242694, 1, 1, 1, 1, 1,
-0.8353635, 0.7129483, -1.646795, 1, 1, 1, 1, 1,
-0.833095, 1.665113, -0.6981218, 1, 1, 1, 1, 1,
-0.8329109, 0.5570003, 0.1933943, 1, 1, 1, 1, 1,
-0.8302823, 0.761773, -2.238958, 0, 0, 1, 1, 1,
-0.8279096, -0.6646776, -1.339454, 1, 0, 0, 1, 1,
-0.8236254, -0.2093846, -2.03878, 1, 0, 0, 1, 1,
-0.821881, 1.146894, -0.3872063, 1, 0, 0, 1, 1,
-0.8157914, -0.3812003, -3.037869, 1, 0, 0, 1, 1,
-0.8153296, -1.901944, -1.904977, 1, 0, 0, 1, 1,
-0.814096, 1.148935, 0.3145662, 0, 0, 0, 1, 1,
-0.7991636, 0.3782851, -0.6197884, 0, 0, 0, 1, 1,
-0.7981464, -0.2856282, -1.030882, 0, 0, 0, 1, 1,
-0.7946127, -0.9785312, -1.150059, 0, 0, 0, 1, 1,
-0.7939016, 0.6483006, -0.2948481, 0, 0, 0, 1, 1,
-0.7908969, -1.960947, -1.693013, 0, 0, 0, 1, 1,
-0.7908124, 0.07550011, -1.117202, 0, 0, 0, 1, 1,
-0.7889593, 0.3990041, -2.54708, 1, 1, 1, 1, 1,
-0.7889057, 0.3538244, -1.1453, 1, 1, 1, 1, 1,
-0.7877113, 0.3127967, -1.372897, 1, 1, 1, 1, 1,
-0.7847673, -1.164784, -4.980006, 1, 1, 1, 1, 1,
-0.780997, 1.043745, -0.7620044, 1, 1, 1, 1, 1,
-0.778402, -0.3180631, -2.883639, 1, 1, 1, 1, 1,
-0.7778084, 1.179156, -1.927631, 1, 1, 1, 1, 1,
-0.7772564, 0.3554972, -1.780707, 1, 1, 1, 1, 1,
-0.7736008, 1.053009, -0.5539668, 1, 1, 1, 1, 1,
-0.7725002, -0.3409252, -0.5604541, 1, 1, 1, 1, 1,
-0.7706488, -1.054597, -3.250614, 1, 1, 1, 1, 1,
-0.7669085, 0.7781289, -0.505941, 1, 1, 1, 1, 1,
-0.7667699, -2.820931, -3.967683, 1, 1, 1, 1, 1,
-0.7619115, -1.630101, -4.490384, 1, 1, 1, 1, 1,
-0.7609524, 1.244733, 1.886649, 1, 1, 1, 1, 1,
-0.7572952, 0.2944173, -0.03979911, 0, 0, 1, 1, 1,
-0.7564725, 1.814639, -1.202982, 1, 0, 0, 1, 1,
-0.7519708, -0.4192821, -2.955375, 1, 0, 0, 1, 1,
-0.7484501, 0.1353606, -1.168677, 1, 0, 0, 1, 1,
-0.7467158, 1.88006, -1.834557, 1, 0, 0, 1, 1,
-0.7454504, -0.08754475, -1.636041, 1, 0, 0, 1, 1,
-0.7412464, 0.1873331, -2.405374, 0, 0, 0, 1, 1,
-0.74081, -0.4742779, -3.025225, 0, 0, 0, 1, 1,
-0.7405588, 0.5923094, -2.19127, 0, 0, 0, 1, 1,
-0.7376816, -0.4022631, -1.140364, 0, 0, 0, 1, 1,
-0.7366431, -2.522587, -2.788115, 0, 0, 0, 1, 1,
-0.7363487, -0.1183669, -1.315916, 0, 0, 0, 1, 1,
-0.7309802, 1.851352, -0.6400972, 0, 0, 0, 1, 1,
-0.7305196, 0.234423, -0.9857662, 1, 1, 1, 1, 1,
-0.7292988, -0.1704778, -1.487702, 1, 1, 1, 1, 1,
-0.7289391, -0.06170761, -2.611548, 1, 1, 1, 1, 1,
-0.726361, 1.708682, -1.617672, 1, 1, 1, 1, 1,
-0.724659, -0.6828433, -2.875668, 1, 1, 1, 1, 1,
-0.721857, -0.8769176, -0.531101, 1, 1, 1, 1, 1,
-0.7195049, 0.8971087, -0.7191921, 1, 1, 1, 1, 1,
-0.7180024, 1.752499, 0.2772629, 1, 1, 1, 1, 1,
-0.715939, -0.3268331, -3.249664, 1, 1, 1, 1, 1,
-0.7134096, 2.088373, -0.6629324, 1, 1, 1, 1, 1,
-0.7092006, 0.5615559, 0.8086442, 1, 1, 1, 1, 1,
-0.708378, -1.424398, -0.5299279, 1, 1, 1, 1, 1,
-0.7080547, 0.5761109, -0.3798388, 1, 1, 1, 1, 1,
-0.6953123, -0.1835923, -0.5489786, 1, 1, 1, 1, 1,
-0.6942719, -1.34068, -2.315397, 1, 1, 1, 1, 1,
-0.6884613, 0.7371323, -0.07033151, 0, 0, 1, 1, 1,
-0.6818562, 1.794617, 0.3314482, 1, 0, 0, 1, 1,
-0.6771588, -1.70706, -2.300733, 1, 0, 0, 1, 1,
-0.6745264, 0.8713766, -1.426923, 1, 0, 0, 1, 1,
-0.673771, 0.122227, -2.272557, 1, 0, 0, 1, 1,
-0.6728137, -1.564674, -2.379739, 1, 0, 0, 1, 1,
-0.6693428, -0.722788, -2.732912, 0, 0, 0, 1, 1,
-0.6614503, -0.5425289, -3.875884, 0, 0, 0, 1, 1,
-0.6590987, -0.3787019, -4.398984, 0, 0, 0, 1, 1,
-0.6546649, -0.5425909, -2.959182, 0, 0, 0, 1, 1,
-0.6443124, 0.7925636, -1.551177, 0, 0, 0, 1, 1,
-0.6434426, 0.5077096, 0.6390215, 0, 0, 0, 1, 1,
-0.6380651, 0.6505291, -1.049471, 0, 0, 0, 1, 1,
-0.6377526, 0.6509987, -2.114977, 1, 1, 1, 1, 1,
-0.6356808, -0.5706524, -2.764752, 1, 1, 1, 1, 1,
-0.632005, -0.832037, -2.674701, 1, 1, 1, 1, 1,
-0.6285082, -1.351843, -2.613328, 1, 1, 1, 1, 1,
-0.6233206, -1.20151, -2.550796, 1, 1, 1, 1, 1,
-0.61577, -0.08474261, -0.5280585, 1, 1, 1, 1, 1,
-0.6133685, -0.2054199, -1.477982, 1, 1, 1, 1, 1,
-0.6131859, -0.5792432, -2.739425, 1, 1, 1, 1, 1,
-0.6112724, -0.8965656, -3.018219, 1, 1, 1, 1, 1,
-0.6052742, -0.2580619, -0.7546639, 1, 1, 1, 1, 1,
-0.6022102, 2.176607, 0.3840198, 1, 1, 1, 1, 1,
-0.5996937, -1.548596, -3.238431, 1, 1, 1, 1, 1,
-0.5992975, -0.6577352, -2.486456, 1, 1, 1, 1, 1,
-0.5991319, -0.9850808, -3.509312, 1, 1, 1, 1, 1,
-0.5915603, -2.114784, -4.505095, 1, 1, 1, 1, 1,
-0.5888962, -0.2664461, -2.712576, 0, 0, 1, 1, 1,
-0.5832194, -0.6103777, -2.110705, 1, 0, 0, 1, 1,
-0.5827899, 0.09317929, -3.386271, 1, 0, 0, 1, 1,
-0.5803986, 1.521936, -0.3007428, 1, 0, 0, 1, 1,
-0.5797818, 0.2536172, -2.451994, 1, 0, 0, 1, 1,
-0.5772278, 1.399898, 1.33829, 1, 0, 0, 1, 1,
-0.5726637, 1.058826, -0.5610465, 0, 0, 0, 1, 1,
-0.5717239, 1.104985, -0.9819391, 0, 0, 0, 1, 1,
-0.5695049, 1.618532, -1.430055, 0, 0, 0, 1, 1,
-0.5669611, -0.4347684, -1.741026, 0, 0, 0, 1, 1,
-0.5664791, -0.2247713, -2.266431, 0, 0, 0, 1, 1,
-0.5641446, -0.8320796, -3.58871, 0, 0, 0, 1, 1,
-0.5637873, -1.45269, -2.253582, 0, 0, 0, 1, 1,
-0.5614645, 1.51388, -0.304985, 1, 1, 1, 1, 1,
-0.5602474, 0.1290862, -0.3763721, 1, 1, 1, 1, 1,
-0.5579559, 1.514839, -1.548304, 1, 1, 1, 1, 1,
-0.5573452, -0.8374175, -3.152273, 1, 1, 1, 1, 1,
-0.5525331, 0.9001589, -0.764334, 1, 1, 1, 1, 1,
-0.5466429, 0.2538382, -1.261201, 1, 1, 1, 1, 1,
-0.5464717, -0.274302, -0.4758644, 1, 1, 1, 1, 1,
-0.5412374, 0.1984557, -0.1857318, 1, 1, 1, 1, 1,
-0.5401716, 1.234747, -0.06539574, 1, 1, 1, 1, 1,
-0.5390258, -1.084388, -2.228531, 1, 1, 1, 1, 1,
-0.5372941, 3.009205, -0.8155938, 1, 1, 1, 1, 1,
-0.535778, 1.72393, -0.2757739, 1, 1, 1, 1, 1,
-0.5356615, -0.2475835, -1.305009, 1, 1, 1, 1, 1,
-0.5326858, 0.655891, -1.121714, 1, 1, 1, 1, 1,
-0.5310441, -1.373125, -2.033008, 1, 1, 1, 1, 1,
-0.5276444, -0.8568618, -2.780866, 0, 0, 1, 1, 1,
-0.5239335, -1.53883, -2.903666, 1, 0, 0, 1, 1,
-0.5213838, -0.4077257, -1.985542, 1, 0, 0, 1, 1,
-0.5206336, 1.930958, -0.1277606, 1, 0, 0, 1, 1,
-0.5079999, -0.01899643, -2.640139, 1, 0, 0, 1, 1,
-0.5074938, -0.281211, -1.280097, 1, 0, 0, 1, 1,
-0.5065455, 0.4457175, 1.448459, 0, 0, 0, 1, 1,
-0.5049806, -0.03140018, -2.091232, 0, 0, 0, 1, 1,
-0.5003433, -0.9270628, -3.118629, 0, 0, 0, 1, 1,
-0.4998197, -1.922803, -2.830667, 0, 0, 0, 1, 1,
-0.4951189, -0.6101638, -1.668987, 0, 0, 0, 1, 1,
-0.4902108, 0.4716543, -1.596143, 0, 0, 0, 1, 1,
-0.4894383, 1.159649, -0.6795791, 0, 0, 0, 1, 1,
-0.4841992, 1.69733, -0.9053981, 1, 1, 1, 1, 1,
-0.4831383, 0.885627, -1.667385, 1, 1, 1, 1, 1,
-0.4801091, 0.5757901, -0.6581238, 1, 1, 1, 1, 1,
-0.4777392, -1.842111, -2.883549, 1, 1, 1, 1, 1,
-0.4761093, -1.273625, -2.674476, 1, 1, 1, 1, 1,
-0.4740562, -1.70652, -3.160459, 1, 1, 1, 1, 1,
-0.469561, -0.3662795, -1.019181, 1, 1, 1, 1, 1,
-0.4686708, -0.7818523, -2.493982, 1, 1, 1, 1, 1,
-0.4672834, 0.6207709, -0.398117, 1, 1, 1, 1, 1,
-0.4668418, 0.6384953, -0.6211411, 1, 1, 1, 1, 1,
-0.4645143, -0.4133889, -2.232386, 1, 1, 1, 1, 1,
-0.4620666, -2.356094, -1.337988, 1, 1, 1, 1, 1,
-0.4619491, -0.9883388, -2.70979, 1, 1, 1, 1, 1,
-0.4616156, 1.684096, 0.4444279, 1, 1, 1, 1, 1,
-0.4583911, 0.04392654, -1.969419, 1, 1, 1, 1, 1,
-0.4571163, 0.07085431, -0.8907489, 0, 0, 1, 1, 1,
-0.4563261, -0.2647547, -0.9221256, 1, 0, 0, 1, 1,
-0.4529988, -0.7435698, -4.199842, 1, 0, 0, 1, 1,
-0.4457663, -0.3083831, -0.8985017, 1, 0, 0, 1, 1,
-0.44281, 0.2185371, -1.044139, 1, 0, 0, 1, 1,
-0.4360166, 1.428058, -0.02645166, 1, 0, 0, 1, 1,
-0.4348654, 0.2463973, 0.03564756, 0, 0, 0, 1, 1,
-0.4298713, -0.4592404, -3.52448, 0, 0, 0, 1, 1,
-0.4279643, 0.3874892, -0.268136, 0, 0, 0, 1, 1,
-0.4235362, -1.541664, -3.215812, 0, 0, 0, 1, 1,
-0.4213643, 1.74053, -1.370468, 0, 0, 0, 1, 1,
-0.4189914, -2.234625, -3.984807, 0, 0, 0, 1, 1,
-0.4189185, -0.02308331, -0.4629481, 0, 0, 0, 1, 1,
-0.416434, 1.54488, -1.671932, 1, 1, 1, 1, 1,
-0.4163151, 0.3480174, -0.7416902, 1, 1, 1, 1, 1,
-0.4138548, -1.413339, -3.53812, 1, 1, 1, 1, 1,
-0.4126393, 1.085697, -0.6663035, 1, 1, 1, 1, 1,
-0.412557, -0.8668538, -3.689434, 1, 1, 1, 1, 1,
-0.4100479, -0.3469814, -2.064062, 1, 1, 1, 1, 1,
-0.4064195, 0.4409386, -2.200809, 1, 1, 1, 1, 1,
-0.4013167, 0.5980161, -0.411545, 1, 1, 1, 1, 1,
-0.3966759, -0.8986843, -3.494297, 1, 1, 1, 1, 1,
-0.3938698, 1.189265, -0.5944951, 1, 1, 1, 1, 1,
-0.3884201, -0.02966398, -1.895875, 1, 1, 1, 1, 1,
-0.3800037, -0.3771296, -2.477599, 1, 1, 1, 1, 1,
-0.3792323, 0.854865, -0.8053548, 1, 1, 1, 1, 1,
-0.3693858, -0.5688621, -5.043046, 1, 1, 1, 1, 1,
-0.3628851, 0.3992652, -2.091581, 1, 1, 1, 1, 1,
-0.3621375, 0.5576084, 0.1383519, 0, 0, 1, 1, 1,
-0.3621033, -0.1286222, -2.189714, 1, 0, 0, 1, 1,
-0.3564765, -0.7982911, -1.991863, 1, 0, 0, 1, 1,
-0.3549479, -1.320714, -3.692554, 1, 0, 0, 1, 1,
-0.3536806, -0.8692641, -2.885277, 1, 0, 0, 1, 1,
-0.3497828, 0.3020773, -2.537657, 1, 0, 0, 1, 1,
-0.3479379, 1.152673, -0.05815553, 0, 0, 0, 1, 1,
-0.3477184, 1.122129, 0.2281313, 0, 0, 0, 1, 1,
-0.3457309, 0.2269486, -0.266651, 0, 0, 0, 1, 1,
-0.3456833, 1.683321, -1.558038, 0, 0, 0, 1, 1,
-0.3452812, -0.5287355, -3.090243, 0, 0, 0, 1, 1,
-0.3445878, 2.132588, 0.5228388, 0, 0, 0, 1, 1,
-0.3420146, -1.331751, -2.021072, 0, 0, 0, 1, 1,
-0.3401664, 0.9807426, -1.097958, 1, 1, 1, 1, 1,
-0.3349334, -0.9526463, -2.574391, 1, 1, 1, 1, 1,
-0.3343298, -1.369193, -1.190485, 1, 1, 1, 1, 1,
-0.3341021, -0.1462148, -2.079978, 1, 1, 1, 1, 1,
-0.3294005, -1.475262, -3.177036, 1, 1, 1, 1, 1,
-0.3256725, 0.1326917, -0.2289763, 1, 1, 1, 1, 1,
-0.3252061, 1.014824, 0.7858981, 1, 1, 1, 1, 1,
-0.3238843, -0.7233219, -4.029798, 1, 1, 1, 1, 1,
-0.3175074, 1.263921, -0.8772337, 1, 1, 1, 1, 1,
-0.312962, -0.008452587, -2.805768, 1, 1, 1, 1, 1,
-0.3111538, -0.3109403, -4.973297, 1, 1, 1, 1, 1,
-0.3081328, -0.3228128, -2.795276, 1, 1, 1, 1, 1,
-0.3031672, 0.2040384, 0.9326115, 1, 1, 1, 1, 1,
-0.3008618, -0.4059376, -3.994634, 1, 1, 1, 1, 1,
-0.2987661, -0.9356541, -2.796311, 1, 1, 1, 1, 1,
-0.2960196, 0.3740691, -2.720937, 0, 0, 1, 1, 1,
-0.2952403, -0.01338546, -1.343216, 1, 0, 0, 1, 1,
-0.2898617, 0.8412871, -0.2904582, 1, 0, 0, 1, 1,
-0.2890424, 0.7603327, -0.428672, 1, 0, 0, 1, 1,
-0.2852157, 1.038273, -0.004284534, 1, 0, 0, 1, 1,
-0.2829809, -1.232869, -3.878389, 1, 0, 0, 1, 1,
-0.2825927, 0.3004474, 0.2830321, 0, 0, 0, 1, 1,
-0.2824955, -0.9198133, -0.8250337, 0, 0, 0, 1, 1,
-0.2794646, -1.339136, -3.170684, 0, 0, 0, 1, 1,
-0.2723384, 1.896812, -0.1505137, 0, 0, 0, 1, 1,
-0.2713321, -0.4245485, -1.381313, 0, 0, 0, 1, 1,
-0.264007, 1.63862, -1.020484, 0, 0, 0, 1, 1,
-0.2584597, -0.09090926, -1.75952, 0, 0, 0, 1, 1,
-0.2536292, -0.4997701, -3.159479, 1, 1, 1, 1, 1,
-0.251924, -1.297588, -2.463067, 1, 1, 1, 1, 1,
-0.250106, -1.185938, -4.680154, 1, 1, 1, 1, 1,
-0.2490034, -0.1081429, -2.738477, 1, 1, 1, 1, 1,
-0.2478084, -1.115338, -1.940593, 1, 1, 1, 1, 1,
-0.2449002, 0.4723897, -0.5214798, 1, 1, 1, 1, 1,
-0.2435404, -0.05389717, 0.2901566, 1, 1, 1, 1, 1,
-0.2383229, -0.01851223, -1.506148, 1, 1, 1, 1, 1,
-0.2214223, 0.1755252, -1.827829, 1, 1, 1, 1, 1,
-0.2209921, 0.546374, -1.843076, 1, 1, 1, 1, 1,
-0.2161086, 1.398654, 1.076926, 1, 1, 1, 1, 1,
-0.2130522, -0.3664412, -1.937007, 1, 1, 1, 1, 1,
-0.2120897, 0.7485662, 0.2921307, 1, 1, 1, 1, 1,
-0.2117692, 0.2320193, 0.5056931, 1, 1, 1, 1, 1,
-0.2099634, -0.8289919, -4.307238, 1, 1, 1, 1, 1,
-0.2086868, 0.4907713, 1.771016, 0, 0, 1, 1, 1,
-0.2069468, 0.02746675, -1.698275, 1, 0, 0, 1, 1,
-0.2000037, 0.004066037, 0.3467443, 1, 0, 0, 1, 1,
-0.1994352, -0.4327148, -2.622272, 1, 0, 0, 1, 1,
-0.1992031, 0.9301888, 0.4152904, 1, 0, 0, 1, 1,
-0.1970839, -0.6629065, -2.942441, 1, 0, 0, 1, 1,
-0.1956354, 0.843786, 1.31992, 0, 0, 0, 1, 1,
-0.1920173, -0.6730488, -1.309427, 0, 0, 0, 1, 1,
-0.1881566, 1.380518, 1.508881, 0, 0, 0, 1, 1,
-0.1873234, -1.524096, -3.462506, 0, 0, 0, 1, 1,
-0.1857163, 1.176932, 1.745968, 0, 0, 0, 1, 1,
-0.1813774, 0.447467, -0.1397617, 0, 0, 0, 1, 1,
-0.1773972, 0.1819112, -0.1934102, 0, 0, 0, 1, 1,
-0.176527, -1.86333, -4.453961, 1, 1, 1, 1, 1,
-0.1754659, -0.1982686, -2.051309, 1, 1, 1, 1, 1,
-0.171432, -0.9122922, -3.277281, 1, 1, 1, 1, 1,
-0.1697132, 0.968185, -0.1597069, 1, 1, 1, 1, 1,
-0.1695199, 0.3229492, -0.427517, 1, 1, 1, 1, 1,
-0.1694881, 0.4343856, -0.7321603, 1, 1, 1, 1, 1,
-0.1647186, 0.1845828, -2.707176, 1, 1, 1, 1, 1,
-0.163286, 0.7975354, -0.936469, 1, 1, 1, 1, 1,
-0.1618952, 0.873688, -0.8921669, 1, 1, 1, 1, 1,
-0.1612523, 0.8660906, 0.9038958, 1, 1, 1, 1, 1,
-0.1524775, 0.3817299, 0.07317462, 1, 1, 1, 1, 1,
-0.147549, 0.2026767, -1.562299, 1, 1, 1, 1, 1,
-0.1461878, -1.879737, -2.596717, 1, 1, 1, 1, 1,
-0.143515, -0.05753206, -2.51469, 1, 1, 1, 1, 1,
-0.1425585, -0.2897862, -4.264511, 1, 1, 1, 1, 1,
-0.1332874, -0.7645773, -3.194163, 0, 0, 1, 1, 1,
-0.1268784, 1.19312, 0.4920592, 1, 0, 0, 1, 1,
-0.1255694, -0.3795705, -3.346696, 1, 0, 0, 1, 1,
-0.1252274, -1.538273, -4.437853, 1, 0, 0, 1, 1,
-0.1177791, -0.5810921, -3.469347, 1, 0, 0, 1, 1,
-0.1136474, 2.39159, 0.6793675, 1, 0, 0, 1, 1,
-0.1059285, -0.5687454, -2.839414, 0, 0, 0, 1, 1,
-0.1048147, 0.003463825, 0.1223127, 0, 0, 0, 1, 1,
-0.1006055, 0.757183, 0.7078434, 0, 0, 0, 1, 1,
-0.09480153, 0.5113326, -0.1963563, 0, 0, 0, 1, 1,
-0.09172353, -1.010503, -3.677696, 0, 0, 0, 1, 1,
-0.08957953, 1.65023, 1.149889, 0, 0, 0, 1, 1,
-0.08870213, -0.3912614, -3.472653, 0, 0, 0, 1, 1,
-0.08499469, -0.908228, -3.779658, 1, 1, 1, 1, 1,
-0.08361205, 0.3779169, 0.9801005, 1, 1, 1, 1, 1,
-0.07906764, 0.08657596, -0.1626491, 1, 1, 1, 1, 1,
-0.07874167, 1.232275, -1.30873, 1, 1, 1, 1, 1,
-0.07192157, 0.6294431, 0.5691462, 1, 1, 1, 1, 1,
-0.06537707, -0.3555248, -4.162169, 1, 1, 1, 1, 1,
-0.06512357, -0.2448717, -0.3897182, 1, 1, 1, 1, 1,
-0.06431883, 0.2275388, 0.09844384, 1, 1, 1, 1, 1,
-0.06245152, -0.7596723, -3.488485, 1, 1, 1, 1, 1,
-0.06234419, 0.9926596, -0.3952408, 1, 1, 1, 1, 1,
-0.05483246, 1.769318, -0.1068625, 1, 1, 1, 1, 1,
-0.04840843, -2.017725, -2.735221, 1, 1, 1, 1, 1,
-0.04697191, -0.4279092, -2.203263, 1, 1, 1, 1, 1,
-0.04255066, 1.334431, -1.634848, 1, 1, 1, 1, 1,
-0.03973227, 0.8998809, -2.168313, 1, 1, 1, 1, 1,
-0.03445648, -1.22628, -3.011084, 0, 0, 1, 1, 1,
-0.03383232, -0.4183185, -1.202261, 1, 0, 0, 1, 1,
-0.03113464, 0.3692016, -0.388423, 1, 0, 0, 1, 1,
-0.03075634, 0.5250815, 1.619958, 1, 0, 0, 1, 1,
-0.02771839, -0.24388, -1.704935, 1, 0, 0, 1, 1,
-0.02587404, -0.2535018, -1.738126, 1, 0, 0, 1, 1,
-0.02350318, 0.02399815, -0.6407271, 0, 0, 0, 1, 1,
-0.02310974, -0.01565767, 0.03459811, 0, 0, 0, 1, 1,
-0.01740953, -0.0220939, -1.38994, 0, 0, 0, 1, 1,
-0.01739427, -0.8340876, -5.294819, 0, 0, 0, 1, 1,
-0.01717947, -1.49768, -3.14985, 0, 0, 0, 1, 1,
-0.0159133, -1.112396, -4.277809, 0, 0, 0, 1, 1,
-0.006075998, 0.1108853, 1.301029, 0, 0, 0, 1, 1,
-0.004440701, -0.3508793, -2.511923, 1, 1, 1, 1, 1,
0.004047103, 1.109703, -1.029245, 1, 1, 1, 1, 1,
0.005000025, -1.221286, 2.230973, 1, 1, 1, 1, 1,
0.005696367, -1.862007, 4.835699, 1, 1, 1, 1, 1,
0.009074135, -0.2236382, 3.576075, 1, 1, 1, 1, 1,
0.009654106, -0.4995092, 4.352985, 1, 1, 1, 1, 1,
0.01135504, -0.1888752, 3.514992, 1, 1, 1, 1, 1,
0.01154383, 0.401145, 1.088347, 1, 1, 1, 1, 1,
0.01322107, -0.3631496, 2.445472, 1, 1, 1, 1, 1,
0.01596207, 0.3713461, -1.665854, 1, 1, 1, 1, 1,
0.01916577, -1.421956, 3.350595, 1, 1, 1, 1, 1,
0.01935699, -0.5102276, 3.493207, 1, 1, 1, 1, 1,
0.02130882, -0.2052051, 3.890841, 1, 1, 1, 1, 1,
0.02156075, 0.8426525, 1.556015, 1, 1, 1, 1, 1,
0.02168048, -0.8853273, 2.823297, 1, 1, 1, 1, 1,
0.02212393, -0.4774233, 4.367725, 0, 0, 1, 1, 1,
0.02780049, -0.4783738, 4.033805, 1, 0, 0, 1, 1,
0.03405548, 1.505581, -0.7823197, 1, 0, 0, 1, 1,
0.03614692, -0.3550149, 2.715143, 1, 0, 0, 1, 1,
0.04007173, -1.459874, 1.383619, 1, 0, 0, 1, 1,
0.04166912, 0.5882602, 0.266519, 1, 0, 0, 1, 1,
0.04336668, -1.291996, 4.089607, 0, 0, 0, 1, 1,
0.04937355, 1.136489, 0.5219736, 0, 0, 0, 1, 1,
0.05016868, 0.9391879, 0.931064, 0, 0, 0, 1, 1,
0.05552776, 1.688282, 1.682714, 0, 0, 0, 1, 1,
0.06157038, 0.4489955, 0.1061898, 0, 0, 0, 1, 1,
0.07337941, -0.797522, 3.744294, 0, 0, 0, 1, 1,
0.07437245, -1.843115, 2.645454, 0, 0, 0, 1, 1,
0.08054721, 2.695637, -0.04669618, 1, 1, 1, 1, 1,
0.08071406, -1.598804, 2.930719, 1, 1, 1, 1, 1,
0.08585483, 0.8871729, 0.6653446, 1, 1, 1, 1, 1,
0.08783024, 1.934889, -1.598897, 1, 1, 1, 1, 1,
0.0888334, -0.5005554, 3.966797, 1, 1, 1, 1, 1,
0.09050166, 0.8003718, 1.056807, 1, 1, 1, 1, 1,
0.09234928, -1.835098, 4.12941, 1, 1, 1, 1, 1,
0.09247081, 0.3011928, 0.04720184, 1, 1, 1, 1, 1,
0.0930284, 0.2877788, 1.371679, 1, 1, 1, 1, 1,
0.1003211, -3.060107, 2.697626, 1, 1, 1, 1, 1,
0.103986, -0.6327036, 4.877617, 1, 1, 1, 1, 1,
0.1080733, -0.3058316, 5.182175, 1, 1, 1, 1, 1,
0.1121388, 1.751506, 0.8931162, 1, 1, 1, 1, 1,
0.1122648, 0.5585737, 3.385747, 1, 1, 1, 1, 1,
0.1166098, 0.2675575, 0.1270491, 1, 1, 1, 1, 1,
0.1171138, -0.5542026, 2.725043, 0, 0, 1, 1, 1,
0.1197282, 0.005585246, 0.7720379, 1, 0, 0, 1, 1,
0.1218593, 1.150564, 0.03082986, 1, 0, 0, 1, 1,
0.1228022, 1.476988, -0.3803702, 1, 0, 0, 1, 1,
0.1229568, 0.05900322, 0.7280439, 1, 0, 0, 1, 1,
0.1261597, 0.2464578, 0.5413685, 1, 0, 0, 1, 1,
0.1284056, -0.4008196, 4.994278, 0, 0, 0, 1, 1,
0.1317477, -0.2253766, 1.8283, 0, 0, 0, 1, 1,
0.1341987, -0.826366, 3.221827, 0, 0, 0, 1, 1,
0.1352912, 0.5975581, 0.5733927, 0, 0, 0, 1, 1,
0.1390533, 1.396605, -0.004123023, 0, 0, 0, 1, 1,
0.1509719, 0.2300062, -0.420298, 0, 0, 0, 1, 1,
0.1541261, 0.916898, 1.04689, 0, 0, 0, 1, 1,
0.1552231, 0.5210832, 1.465701, 1, 1, 1, 1, 1,
0.1575879, -0.5226305, 2.45639, 1, 1, 1, 1, 1,
0.1654879, 0.9874812, 0.2050135, 1, 1, 1, 1, 1,
0.1663385, 0.09293451, 0.6656194, 1, 1, 1, 1, 1,
0.167616, -0.4216587, 3.412663, 1, 1, 1, 1, 1,
0.1697742, -3.141019, 4.078802, 1, 1, 1, 1, 1,
0.1709748, -0.6145403, 2.029748, 1, 1, 1, 1, 1,
0.1747426, -0.1135055, 2.263384, 1, 1, 1, 1, 1,
0.1779988, -1.524899, 3.214875, 1, 1, 1, 1, 1,
0.182275, -0.5291607, 2.062597, 1, 1, 1, 1, 1,
0.1869385, -1.229593, 3.462934, 1, 1, 1, 1, 1,
0.188878, -1.27668, 3.154382, 1, 1, 1, 1, 1,
0.1921484, -0.5151172, 1.228652, 1, 1, 1, 1, 1,
0.1932639, 0.8272949, -0.08958969, 1, 1, 1, 1, 1,
0.1952188, -0.3403066, 2.332145, 1, 1, 1, 1, 1,
0.1996529, 1.913059, 0.6431122, 0, 0, 1, 1, 1,
0.1997756, -0.9859384, 1.511287, 1, 0, 0, 1, 1,
0.2025285, 0.07645434, 1.105204, 1, 0, 0, 1, 1,
0.2082815, 0.2929729, -0.3734167, 1, 0, 0, 1, 1,
0.2100439, 0.3517747, 3.744854, 1, 0, 0, 1, 1,
0.2114141, -0.06795921, 2.494193, 1, 0, 0, 1, 1,
0.2159194, -0.419776, 2.11899, 0, 0, 0, 1, 1,
0.2161625, 0.948589, -1.011013, 0, 0, 0, 1, 1,
0.2167874, 1.01641, 0.5130445, 0, 0, 0, 1, 1,
0.2200548, -0.1710047, 3.470411, 0, 0, 0, 1, 1,
0.2251303, -0.007932091, 2.321087, 0, 0, 0, 1, 1,
0.2252452, 0.654746, 0.7973248, 0, 0, 0, 1, 1,
0.2309911, -0.1865886, 2.113338, 0, 0, 0, 1, 1,
0.2324997, 0.6262217, 1.483899, 1, 1, 1, 1, 1,
0.239923, -0.4488299, 3.511805, 1, 1, 1, 1, 1,
0.2407104, 1.103611, 0.7676342, 1, 1, 1, 1, 1,
0.2465307, 0.1660007, 1.199964, 1, 1, 1, 1, 1,
0.250842, -0.6875174, 2.97678, 1, 1, 1, 1, 1,
0.2510734, -0.7313038, 0.9205154, 1, 1, 1, 1, 1,
0.2519882, -0.5720871, 1.159785, 1, 1, 1, 1, 1,
0.2531797, -0.7268341, 2.202121, 1, 1, 1, 1, 1,
0.2532052, -1.311951, 4.334732, 1, 1, 1, 1, 1,
0.2558715, 1.079279, -0.1816159, 1, 1, 1, 1, 1,
0.2571243, 1.40017, -0.9788719, 1, 1, 1, 1, 1,
0.2609851, -1.386839, 2.9833, 1, 1, 1, 1, 1,
0.2622387, 0.03875188, 0.06684348, 1, 1, 1, 1, 1,
0.2629886, -1.445625, 3.347317, 1, 1, 1, 1, 1,
0.2637123, 1.330386, 0.3253531, 1, 1, 1, 1, 1,
0.2683911, -1.218071, 1.422323, 0, 0, 1, 1, 1,
0.278074, -0.2713824, 2.654, 1, 0, 0, 1, 1,
0.2827345, 0.6011781, -0.540638, 1, 0, 0, 1, 1,
0.2830607, 0.2460735, 1.290753, 1, 0, 0, 1, 1,
0.2855469, 0.6445656, 1.588707, 1, 0, 0, 1, 1,
0.2866485, -0.13368, 1.57836, 1, 0, 0, 1, 1,
0.2870613, 1.215376, -0.06665082, 0, 0, 0, 1, 1,
0.2896096, -1.004914, 0.779124, 0, 0, 0, 1, 1,
0.2916657, 1.130928, 0.1989333, 0, 0, 0, 1, 1,
0.2916879, -0.3147086, 2.039981, 0, 0, 0, 1, 1,
0.2936905, -0.2806234, 2.417918, 0, 0, 0, 1, 1,
0.2986593, 0.1558191, 0.4029551, 0, 0, 0, 1, 1,
0.3006537, 1.38761, 0.9614787, 0, 0, 0, 1, 1,
0.3028282, 0.9891592, -1.064676, 1, 1, 1, 1, 1,
0.3055066, -0.6437706, 3.368904, 1, 1, 1, 1, 1,
0.3067193, 0.04707792, 0.09369922, 1, 1, 1, 1, 1,
0.3079682, 1.658229, -1.227938, 1, 1, 1, 1, 1,
0.3172517, -1.625593, 2.736136, 1, 1, 1, 1, 1,
0.3185258, 0.01325558, 1.126885, 1, 1, 1, 1, 1,
0.3198622, 0.1208235, 0.8227391, 1, 1, 1, 1, 1,
0.3223599, 0.722019, 0.03236301, 1, 1, 1, 1, 1,
0.3252802, -0.7798409, 2.122936, 1, 1, 1, 1, 1,
0.3273738, 0.5873311, 0.8137378, 1, 1, 1, 1, 1,
0.3352345, 0.4668221, 2.56858, 1, 1, 1, 1, 1,
0.3356336, 0.9323246, -0.3881111, 1, 1, 1, 1, 1,
0.3421085, -0.06797222, 0.4799121, 1, 1, 1, 1, 1,
0.342517, -1.722756, 2.349063, 1, 1, 1, 1, 1,
0.3433305, 1.892708, -1.211672, 1, 1, 1, 1, 1,
0.3456306, 2.873205, -1.058081, 0, 0, 1, 1, 1,
0.3491556, -1.211971, 2.465701, 1, 0, 0, 1, 1,
0.350718, 0.7696869, 1.950221, 1, 0, 0, 1, 1,
0.3517343, -0.8830636, 3.88159, 1, 0, 0, 1, 1,
0.3542483, -0.9026546, 3.475249, 1, 0, 0, 1, 1,
0.3617638, 3.18673, 0.02094891, 1, 0, 0, 1, 1,
0.3658182, 2.522747, -1.019307, 0, 0, 0, 1, 1,
0.3675525, -0.9155657, 2.506871, 0, 0, 0, 1, 1,
0.3700523, 0.05985097, 1.503393, 0, 0, 0, 1, 1,
0.3700791, -0.2789494, 2.212081, 0, 0, 0, 1, 1,
0.3718474, -1.301026, 4.203296, 0, 0, 0, 1, 1,
0.3758869, -0.5026673, 2.362973, 0, 0, 0, 1, 1,
0.3766692, -0.3407486, 3.609859, 0, 0, 0, 1, 1,
0.38089, -1.150184, 2.728838, 1, 1, 1, 1, 1,
0.3813441, 0.2863908, 2.356796, 1, 1, 1, 1, 1,
0.3823239, -0.9540334, 2.522788, 1, 1, 1, 1, 1,
0.3834014, 0.004361773, 0.9087936, 1, 1, 1, 1, 1,
0.3996116, 0.8276542, 0.2876718, 1, 1, 1, 1, 1,
0.4009989, 0.6903636, -0.553094, 1, 1, 1, 1, 1,
0.4016461, 0.7770976, -0.8941925, 1, 1, 1, 1, 1,
0.4019496, 1.130002, -0.8237138, 1, 1, 1, 1, 1,
0.4039072, 0.4020844, 2.793499, 1, 1, 1, 1, 1,
0.4044272, -0.3117532, 3.214916, 1, 1, 1, 1, 1,
0.407292, -0.7575358, 3.569915, 1, 1, 1, 1, 1,
0.4081765, -1.041854, 2.874655, 1, 1, 1, 1, 1,
0.4093956, -0.403012, 1.731152, 1, 1, 1, 1, 1,
0.4098257, 0.6021819, 0.4454603, 1, 1, 1, 1, 1,
0.4123743, 0.1894639, 0.2489811, 1, 1, 1, 1, 1,
0.4133106, -0.04506447, 1.940984, 0, 0, 1, 1, 1,
0.419842, 0.01369659, 1.877271, 1, 0, 0, 1, 1,
0.4203056, 0.1274818, 2.54518, 1, 0, 0, 1, 1,
0.4218748, -0.6040474, 2.561655, 1, 0, 0, 1, 1,
0.4248013, 0.571278, -0.9852471, 1, 0, 0, 1, 1,
0.4315731, -0.01872523, 0.3783516, 1, 0, 0, 1, 1,
0.4396727, -0.0248178, 1.348821, 0, 0, 0, 1, 1,
0.4402919, 0.6408153, 0.9862549, 0, 0, 0, 1, 1,
0.4425597, 1.2367, -0.3225714, 0, 0, 0, 1, 1,
0.4457404, 2.465278, 0.03200227, 0, 0, 0, 1, 1,
0.4467374, 0.4387147, 1.699382, 0, 0, 0, 1, 1,
0.4478506, 1.063806, -0.9349909, 0, 0, 0, 1, 1,
0.4479938, 0.002542868, 2.488438, 0, 0, 0, 1, 1,
0.4485094, 0.9848114, 1.248778, 1, 1, 1, 1, 1,
0.4489201, -1.384244, 2.393239, 1, 1, 1, 1, 1,
0.4510195, -0.01939618, 2.664822, 1, 1, 1, 1, 1,
0.4511928, -1.496536, 2.78751, 1, 1, 1, 1, 1,
0.4550987, 0.4032328, 0.8658248, 1, 1, 1, 1, 1,
0.4568411, 1.303512, -0.3234651, 1, 1, 1, 1, 1,
0.4605375, 0.6367112, -0.0983712, 1, 1, 1, 1, 1,
0.4759957, -0.07883027, 0.6653087, 1, 1, 1, 1, 1,
0.4770021, 1.516831, 0.119282, 1, 1, 1, 1, 1,
0.4794337, -1.201535, 2.892094, 1, 1, 1, 1, 1,
0.4814446, 0.02609193, 2.366911, 1, 1, 1, 1, 1,
0.4820681, -0.3048311, 2.096955, 1, 1, 1, 1, 1,
0.4822734, -1.84183, 2.629561, 1, 1, 1, 1, 1,
0.482768, 0.373661, -0.643241, 1, 1, 1, 1, 1,
0.4881624, -0.8351039, 2.920962, 1, 1, 1, 1, 1,
0.4974411, -0.1593949, 2.751556, 0, 0, 1, 1, 1,
0.5000399, 2.630439, 0.8852396, 1, 0, 0, 1, 1,
0.5026751, 0.4067829, 2.149975, 1, 0, 0, 1, 1,
0.5032689, 0.5807239, -0.9321192, 1, 0, 0, 1, 1,
0.507446, 0.0212633, 2.58229, 1, 0, 0, 1, 1,
0.5085294, -2.947184, 1.923615, 1, 0, 0, 1, 1,
0.5156848, -1.025295, 1.616743, 0, 0, 0, 1, 1,
0.516884, -0.7710553, 3.408307, 0, 0, 0, 1, 1,
0.5198124, -1.380771, 2.773031, 0, 0, 0, 1, 1,
0.5349168, 2.405116, 1.0196, 0, 0, 0, 1, 1,
0.5370869, -0.6769104, 2.975933, 0, 0, 0, 1, 1,
0.5444267, -1.045274, 3.240697, 0, 0, 0, 1, 1,
0.5475813, 1.387213, 2.297617, 0, 0, 0, 1, 1,
0.549126, 0.4321454, 0.4139405, 1, 1, 1, 1, 1,
0.5517274, -2.086371, 2.367636, 1, 1, 1, 1, 1,
0.5537566, -0.7414597, 3.212549, 1, 1, 1, 1, 1,
0.5582866, -0.6200261, 0.0535962, 1, 1, 1, 1, 1,
0.5596144, -0.05134854, 1.099147, 1, 1, 1, 1, 1,
0.5699991, -0.005612082, 0.4754519, 1, 1, 1, 1, 1,
0.5723807, -1.746744, 0.5695637, 1, 1, 1, 1, 1,
0.572718, 1.051022, 0.7620701, 1, 1, 1, 1, 1,
0.5736817, 1.086472, 0.2775055, 1, 1, 1, 1, 1,
0.5743308, 1.653653, -0.4383248, 1, 1, 1, 1, 1,
0.5804716, -1.504799, 3.190541, 1, 1, 1, 1, 1,
0.5830237, -0.9354799, 4.121953, 1, 1, 1, 1, 1,
0.5836993, 0.3848489, 1.045526, 1, 1, 1, 1, 1,
0.5855257, 0.6628425, 0.3878324, 1, 1, 1, 1, 1,
0.5917016, -0.5920575, 4.173205, 1, 1, 1, 1, 1,
0.5951939, -0.9411685, 3.509239, 0, 0, 1, 1, 1,
0.595731, 1.14069, 2.397451, 1, 0, 0, 1, 1,
0.5971592, -1.578083, 1.93396, 1, 0, 0, 1, 1,
0.6016591, -0.8086312, 2.469289, 1, 0, 0, 1, 1,
0.6034027, -0.3329141, 4.334314, 1, 0, 0, 1, 1,
0.6043907, 0.7363081, 2.463165, 1, 0, 0, 1, 1,
0.6061838, -0.4406698, 1.965949, 0, 0, 0, 1, 1,
0.6082932, 0.2117032, 1.943, 0, 0, 0, 1, 1,
0.6123577, -0.4992853, 3.736218, 0, 0, 0, 1, 1,
0.6158429, -0.3816393, 3.534219, 0, 0, 0, 1, 1,
0.616935, 0.7275094, 1.642599, 0, 0, 0, 1, 1,
0.626283, -0.2168619, -0.06476573, 0, 0, 0, 1, 1,
0.6290362, 0.08701228, 2.034591, 0, 0, 0, 1, 1,
0.6296451, -0.9609519, 3.504114, 1, 1, 1, 1, 1,
0.6299546, -0.6579502, 2.165329, 1, 1, 1, 1, 1,
0.6318254, 0.5791985, 0.614341, 1, 1, 1, 1, 1,
0.6338162, 1.596394, 1.33635, 1, 1, 1, 1, 1,
0.6360345, -0.1003794, 2.520546, 1, 1, 1, 1, 1,
0.6428064, -0.3553642, 1.071925, 1, 1, 1, 1, 1,
0.6429996, -2.0974, 3.905066, 1, 1, 1, 1, 1,
0.6446078, -0.4178534, 3.030802, 1, 1, 1, 1, 1,
0.6452737, -1.354629, 1.062301, 1, 1, 1, 1, 1,
0.6535045, -1.760137, 3.251202, 1, 1, 1, 1, 1,
0.6606543, -0.7094034, 1.613386, 1, 1, 1, 1, 1,
0.6607124, -0.2432169, 0.9845754, 1, 1, 1, 1, 1,
0.6636966, 0.1752917, 1.508504, 1, 1, 1, 1, 1,
0.6708973, 0.2097536, -1.903632, 1, 1, 1, 1, 1,
0.6733289, -1.026594, 3.270299, 1, 1, 1, 1, 1,
0.6768584, 0.1068566, 1.39227, 0, 0, 1, 1, 1,
0.6775457, 0.4330517, 0.5338541, 1, 0, 0, 1, 1,
0.6799989, 0.9030353, 0.3319468, 1, 0, 0, 1, 1,
0.6947294, 0.2184049, 0.5622515, 1, 0, 0, 1, 1,
0.6950361, 0.5894981, -0.5018171, 1, 0, 0, 1, 1,
0.6977036, 1.273217, -1.831021, 1, 0, 0, 1, 1,
0.7010003, 0.4033008, 0.8455922, 0, 0, 0, 1, 1,
0.7017509, -2.070772, 1.45814, 0, 0, 0, 1, 1,
0.7065375, -0.2132925, 0.6859571, 0, 0, 0, 1, 1,
0.7090111, 0.3784878, 1.27877, 0, 0, 0, 1, 1,
0.7093016, 1.057962, -0.6305105, 0, 0, 0, 1, 1,
0.7132144, 2.118874, 1.033648, 0, 0, 0, 1, 1,
0.7185861, 0.3676094, 0.4514846, 0, 0, 0, 1, 1,
0.7188944, 0.3560903, 0.6166788, 1, 1, 1, 1, 1,
0.729699, 0.1249403, 2.732462, 1, 1, 1, 1, 1,
0.7392678, -0.9454171, 2.881275, 1, 1, 1, 1, 1,
0.7395843, 0.2348231, 1.503137, 1, 1, 1, 1, 1,
0.7549506, 0.3057854, 2.668023, 1, 1, 1, 1, 1,
0.7558569, 0.3605395, 1.486087, 1, 1, 1, 1, 1,
0.7611736, 2.12034, 0.632682, 1, 1, 1, 1, 1,
0.7632218, 1.146319, -0.6696098, 1, 1, 1, 1, 1,
0.764414, -0.146193, 2.078022, 1, 1, 1, 1, 1,
0.7753544, 0.4349272, 1.246068, 1, 1, 1, 1, 1,
0.7760469, 0.7831844, 1.598616, 1, 1, 1, 1, 1,
0.7823933, -0.9215106, 4.584477, 1, 1, 1, 1, 1,
0.7831712, 0.1896894, 1.260905, 1, 1, 1, 1, 1,
0.7870865, 1.343694, -0.4638081, 1, 1, 1, 1, 1,
0.7895547, -1.188236, 4.686124, 1, 1, 1, 1, 1,
0.7899967, 1.045797, 0.2846822, 0, 0, 1, 1, 1,
0.7950428, 0.1761044, 0.4373814, 1, 0, 0, 1, 1,
0.8029014, 0.7464355, 0.8561773, 1, 0, 0, 1, 1,
0.8084807, -0.7437103, 2.362369, 1, 0, 0, 1, 1,
0.8096511, 2.50516, 0.1591527, 1, 0, 0, 1, 1,
0.8197181, -1.065599, 1.766465, 1, 0, 0, 1, 1,
0.8241311, -0.1652818, 1.249684, 0, 0, 0, 1, 1,
0.8244278, 0.7509106, 1.230247, 0, 0, 0, 1, 1,
0.8249757, -0.3953847, 1.451713, 0, 0, 0, 1, 1,
0.8268396, -0.2317259, 0.5041831, 0, 0, 0, 1, 1,
0.8281323, -0.1588121, 1.217613, 0, 0, 0, 1, 1,
0.8312067, 0.1370591, 1.703607, 0, 0, 0, 1, 1,
0.8323743, -2.507662, 4.606844, 0, 0, 0, 1, 1,
0.8325565, 1.547018, -0.6113156, 1, 1, 1, 1, 1,
0.8338068, 0.6211085, 1.172982, 1, 1, 1, 1, 1,
0.8378726, -0.8052473, 1.452422, 1, 1, 1, 1, 1,
0.8493645, -0.3423576, 2.32444, 1, 1, 1, 1, 1,
0.8523762, -0.9528651, 2.502032, 1, 1, 1, 1, 1,
0.8587846, -0.6392263, 3.362277, 1, 1, 1, 1, 1,
0.8654749, -1.966085, 4.676081, 1, 1, 1, 1, 1,
0.8662779, -0.7311602, 2.047941, 1, 1, 1, 1, 1,
0.873638, -1.698571, 2.119124, 1, 1, 1, 1, 1,
0.8789328, 0.8309172, 1.558946, 1, 1, 1, 1, 1,
0.8843639, 0.485745, 1.034547, 1, 1, 1, 1, 1,
0.8855072, -2.817546, 2.438948, 1, 1, 1, 1, 1,
0.8858691, 1.107642, 0.9489201, 1, 1, 1, 1, 1,
0.8892623, 0.6860791, 0.8834933, 1, 1, 1, 1, 1,
0.8944318, 1.385765, 0.1626154, 1, 1, 1, 1, 1,
0.9014382, -0.2363839, 2.94932, 0, 0, 1, 1, 1,
0.9022021, -0.6257035, 3.408062, 1, 0, 0, 1, 1,
0.9035064, -0.1108121, 2.107994, 1, 0, 0, 1, 1,
0.9044442, 0.4754387, 1.000426, 1, 0, 0, 1, 1,
0.9062014, -0.383191, 0.9474578, 1, 0, 0, 1, 1,
0.9069331, -2.796255, 1.709177, 1, 0, 0, 1, 1,
0.9073334, 0.961524, 1.197045, 0, 0, 0, 1, 1,
0.9111142, -1.719581, 3.503186, 0, 0, 0, 1, 1,
0.9144173, -1.517079, 2.827286, 0, 0, 0, 1, 1,
0.9181673, -0.3060113, 2.154062, 0, 0, 0, 1, 1,
0.9341865, -1.018759, 1.630309, 0, 0, 0, 1, 1,
0.9370705, -2.202202, 4.482094, 0, 0, 0, 1, 1,
0.9441673, 1.308011, 0.1129076, 0, 0, 0, 1, 1,
0.9537579, -0.6722007, 1.768741, 1, 1, 1, 1, 1,
0.9556153, -0.01785843, 1.108006, 1, 1, 1, 1, 1,
0.9584354, -2.126717, 3.0567, 1, 1, 1, 1, 1,
0.9588363, -0.9428132, 2.84141, 1, 1, 1, 1, 1,
0.9637185, 1.225185, 1.235738, 1, 1, 1, 1, 1,
0.9675249, 0.1939049, 3.164077, 1, 1, 1, 1, 1,
0.9681568, -0.1289811, 0.4598291, 1, 1, 1, 1, 1,
0.9730235, -0.1981503, 2.252975, 1, 1, 1, 1, 1,
0.9781572, -0.4460069, 1.457149, 1, 1, 1, 1, 1,
0.9883387, -0.8660813, 2.291106, 1, 1, 1, 1, 1,
0.9889249, 2.371958, -1.351682, 1, 1, 1, 1, 1,
0.9894375, 0.8566219, -1.333703, 1, 1, 1, 1, 1,
0.99254, -0.005410071, 2.298919, 1, 1, 1, 1, 1,
0.9941447, 0.5303009, 1.001774, 1, 1, 1, 1, 1,
0.9951702, -0.698939, 1.379746, 1, 1, 1, 1, 1,
0.9962413, 0.5256439, 2.081341, 0, 0, 1, 1, 1,
0.9966266, 0.01921082, 1.990714, 1, 0, 0, 1, 1,
0.9976285, 2.115223, -1.479886, 1, 0, 0, 1, 1,
1.002557, -0.5885119, 1.039479, 1, 0, 0, 1, 1,
1.003811, -0.6671792, 2.191014, 1, 0, 0, 1, 1,
1.014259, -0.8636075, 2.747744, 1, 0, 0, 1, 1,
1.015457, -0.5648058, 2.572308, 0, 0, 0, 1, 1,
1.016504, 0.03045978, 0.5164047, 0, 0, 0, 1, 1,
1.017088, 0.2059887, 1.993456, 0, 0, 0, 1, 1,
1.017583, 0.001009085, 0.5441305, 0, 0, 0, 1, 1,
1.022381, 0.257443, 1.451184, 0, 0, 0, 1, 1,
1.030297, 0.8027729, -1.573091, 0, 0, 0, 1, 1,
1.032178, 0.6810541, 0.5645496, 0, 0, 0, 1, 1,
1.034581, -0.7383694, 3.862752, 1, 1, 1, 1, 1,
1.04379, -0.3521074, 1.780347, 1, 1, 1, 1, 1,
1.046903, 1.383235, 0.2411005, 1, 1, 1, 1, 1,
1.055982, -1.199518, 2.516989, 1, 1, 1, 1, 1,
1.061309, -1.139119, 2.478316, 1, 1, 1, 1, 1,
1.06763, -0.3856452, 1.127603, 1, 1, 1, 1, 1,
1.068799, -1.786452, 2.024291, 1, 1, 1, 1, 1,
1.069689, -1.198859, 3.013927, 1, 1, 1, 1, 1,
1.074415, -0.1506259, 2.506795, 1, 1, 1, 1, 1,
1.083157, 0.8378705, 1.696, 1, 1, 1, 1, 1,
1.088964, 0.4694239, 1.199243, 1, 1, 1, 1, 1,
1.09214, 1.726651, 0.6157534, 1, 1, 1, 1, 1,
1.094531, -0.5759061, 1.671949, 1, 1, 1, 1, 1,
1.098435, -0.7035254, 3.082975, 1, 1, 1, 1, 1,
1.099811, 0.5772754, 2.110085, 1, 1, 1, 1, 1,
1.115201, -0.5634262, 1.153729, 0, 0, 1, 1, 1,
1.125457, 2.539402, -0.6766287, 1, 0, 0, 1, 1,
1.134181, 1.538496, -0.2063718, 1, 0, 0, 1, 1,
1.144516, -0.08891883, 1.94862, 1, 0, 0, 1, 1,
1.155613, -0.6798117, 2.651924, 1, 0, 0, 1, 1,
1.161207, 0.6233017, 1.579027, 1, 0, 0, 1, 1,
1.166387, -0.1549842, 3.289636, 0, 0, 0, 1, 1,
1.166886, -0.04672146, 2.731384, 0, 0, 0, 1, 1,
1.168009, 2.221025, 0.09474523, 0, 0, 0, 1, 1,
1.171064, -0.5473108, 3.347144, 0, 0, 0, 1, 1,
1.173354, -2.082117, 3.428278, 0, 0, 0, 1, 1,
1.187237, 0.5125126, 0.8156321, 0, 0, 0, 1, 1,
1.188246, -0.3665828, 3.84252, 0, 0, 0, 1, 1,
1.188486, -0.8404881, 4.801022, 1, 1, 1, 1, 1,
1.190319, -0.1482268, 0.2544285, 1, 1, 1, 1, 1,
1.200067, -0.8538448, 1.264904, 1, 1, 1, 1, 1,
1.208857, 0.6572404, 2.289868, 1, 1, 1, 1, 1,
1.213289, 1.419628, 1.465596, 1, 1, 1, 1, 1,
1.216434, 0.550551, 2.286581, 1, 1, 1, 1, 1,
1.230443, 0.5140287, 2.064899, 1, 1, 1, 1, 1,
1.234001, -0.5131053, 3.522528, 1, 1, 1, 1, 1,
1.237879, 1.134575, 0.7725201, 1, 1, 1, 1, 1,
1.238896, -1.529198, 5.804376, 1, 1, 1, 1, 1,
1.241227, 1.521284, -0.1286644, 1, 1, 1, 1, 1,
1.241585, -0.6750289, 1.059402, 1, 1, 1, 1, 1,
1.247588, -0.5330342, 0.7446051, 1, 1, 1, 1, 1,
1.250997, 0.8204257, 1.428053, 1, 1, 1, 1, 1,
1.258142, 1.015362, 3.485482, 1, 1, 1, 1, 1,
1.262901, -1.14052, 2.476793, 0, 0, 1, 1, 1,
1.275495, 2.058378, 0.04084808, 1, 0, 0, 1, 1,
1.290967, 1.267687, -0.4167947, 1, 0, 0, 1, 1,
1.293543, -0.3258232, 2.111592, 1, 0, 0, 1, 1,
1.307321, 1.456173, 0.1000909, 1, 0, 0, 1, 1,
1.31481, -0.5604042, 1.786492, 1, 0, 0, 1, 1,
1.325678, -0.8936344, 0.9418516, 0, 0, 0, 1, 1,
1.336603, 0.3662996, -0.6173411, 0, 0, 0, 1, 1,
1.340123, 1.285776, 0.3330491, 0, 0, 0, 1, 1,
1.343294, 1.094125, 0.3469416, 0, 0, 0, 1, 1,
1.345862, 1.566708, -0.02718753, 0, 0, 0, 1, 1,
1.358534, 0.4794864, 3.269147, 0, 0, 0, 1, 1,
1.368695, 0.8212399, 0.7602464, 0, 0, 0, 1, 1,
1.377172, 0.1648205, 0.08416533, 1, 1, 1, 1, 1,
1.378953, 0.2899754, 2.390319, 1, 1, 1, 1, 1,
1.383655, 0.9903581, 2.016521, 1, 1, 1, 1, 1,
1.386245, 0.3451004, 0.4426078, 1, 1, 1, 1, 1,
1.39916, -0.3632706, -0.4520755, 1, 1, 1, 1, 1,
1.404479, -1.472831, 2.300948, 1, 1, 1, 1, 1,
1.407425, 0.01364015, 0.7218261, 1, 1, 1, 1, 1,
1.41111, 0.9124762, 0.1091334, 1, 1, 1, 1, 1,
1.412139, -0.5820451, 2.244362, 1, 1, 1, 1, 1,
1.412972, 0.4101108, 0.6495628, 1, 1, 1, 1, 1,
1.414743, -0.2183466, 0.09241942, 1, 1, 1, 1, 1,
1.416859, 1.061274, 0.3016078, 1, 1, 1, 1, 1,
1.422269, -1.693336, 4.171996, 1, 1, 1, 1, 1,
1.422913, -0.6865774, 1.898266, 1, 1, 1, 1, 1,
1.431566, -0.6976942, -0.6010622, 1, 1, 1, 1, 1,
1.432905, 1.10824, 1.137447, 0, 0, 1, 1, 1,
1.437346, -0.164372, 2.469742, 1, 0, 0, 1, 1,
1.451152, 1.84822, 0.6061681, 1, 0, 0, 1, 1,
1.45447, 1.050448, 0.2344086, 1, 0, 0, 1, 1,
1.460436, 0.2752915, -0.1787897, 1, 0, 0, 1, 1,
1.470314, -0.4826334, 2.191819, 1, 0, 0, 1, 1,
1.487074, -0.9909225, 4.187036, 0, 0, 0, 1, 1,
1.491898, -0.3208009, 0.5745872, 0, 0, 0, 1, 1,
1.494805, -1.199369, 3.326202, 0, 0, 0, 1, 1,
1.500324, 0.9382001, 2.48198, 0, 0, 0, 1, 1,
1.510815, 1.381486, -1.143756, 0, 0, 0, 1, 1,
1.515805, 0.7104785, 1.386556, 0, 0, 0, 1, 1,
1.553057, -0.8737395, 2.454854, 0, 0, 0, 1, 1,
1.554739, -1.247769, 0.594433, 1, 1, 1, 1, 1,
1.560854, -2.474643, 2.618902, 1, 1, 1, 1, 1,
1.570225, 1.826299, 1.002895, 1, 1, 1, 1, 1,
1.579886, -1.136467, 3.284628, 1, 1, 1, 1, 1,
1.582814, -1.09669, 3.311318, 1, 1, 1, 1, 1,
1.585846, -1.682639, 4.076158, 1, 1, 1, 1, 1,
1.592253, -0.2911716, 2.080769, 1, 1, 1, 1, 1,
1.610362, -0.3760202, 0.988323, 1, 1, 1, 1, 1,
1.615362, -1.520134, 1.971471, 1, 1, 1, 1, 1,
1.620355, 0.468412, 1.512452, 1, 1, 1, 1, 1,
1.626444, 0.3608687, 2.160337, 1, 1, 1, 1, 1,
1.633799, -0.3058638, 2.393361, 1, 1, 1, 1, 1,
1.636647, 1.82306, -0.701565, 1, 1, 1, 1, 1,
1.641906, 0.4694744, 0.6194799, 1, 1, 1, 1, 1,
1.672237, -0.4151109, 1.649627, 1, 1, 1, 1, 1,
1.679357, 0.4328874, 1.52793, 0, 0, 1, 1, 1,
1.694011, -0.6239151, 0.7575862, 1, 0, 0, 1, 1,
1.694893, -0.5192709, 2.236078, 1, 0, 0, 1, 1,
1.706995, 0.4078424, 1.51089, 1, 0, 0, 1, 1,
1.716015, 1.980034, -0.9660903, 1, 0, 0, 1, 1,
1.735012, 0.4243816, 0.4552515, 1, 0, 0, 1, 1,
1.739081, 0.5008332, 1.263623, 0, 0, 0, 1, 1,
1.756613, -0.2005765, 0.04827002, 0, 0, 0, 1, 1,
1.761343, 0.7183112, 1.453661, 0, 0, 0, 1, 1,
1.767828, 1.444047, 1.597856, 0, 0, 0, 1, 1,
1.782226, -1.719061, 2.39496, 0, 0, 0, 1, 1,
1.786985, 1.58977, 1.287099, 0, 0, 0, 1, 1,
1.794167, -0.3425803, 1.09994, 0, 0, 0, 1, 1,
1.804543, 0.2262638, 0.4766694, 1, 1, 1, 1, 1,
1.815521, -1.677031, 2.586343, 1, 1, 1, 1, 1,
1.815793, -1.581448, 1.345224, 1, 1, 1, 1, 1,
1.8239, 0.2682847, 0.07693955, 1, 1, 1, 1, 1,
1.824926, 0.5556112, 1.253177, 1, 1, 1, 1, 1,
1.829329, -0.8011233, 1.540469, 1, 1, 1, 1, 1,
1.830634, -0.4815856, 1.312972, 1, 1, 1, 1, 1,
1.8664, 0.9615514, -2.379313, 1, 1, 1, 1, 1,
1.879239, 0.01022622, 2.55911, 1, 1, 1, 1, 1,
1.901057, -1.110224, 3.204596, 1, 1, 1, 1, 1,
1.916621, 0.01237256, 1.486585, 1, 1, 1, 1, 1,
1.946017, -0.2055335, 1.451076, 1, 1, 1, 1, 1,
1.950892, 0.752794, 0.1199945, 1, 1, 1, 1, 1,
1.981436, -0.3437364, 2.006155, 1, 1, 1, 1, 1,
2.001445, -2.494659, 2.440317, 1, 1, 1, 1, 1,
2.022685, -0.124161, 2.048596, 0, 0, 1, 1, 1,
2.071353, -0.4429126, 0.8581912, 1, 0, 0, 1, 1,
2.080144, -0.273923, -0.1235242, 1, 0, 0, 1, 1,
2.081244, -0.3388918, 1.334825, 1, 0, 0, 1, 1,
2.086433, 0.2025201, 1.018658, 1, 0, 0, 1, 1,
2.1056, 0.6645529, 2.617836, 1, 0, 0, 1, 1,
2.142965, -0.9110945, 0.2630891, 0, 0, 0, 1, 1,
2.16544, 1.09606, 2.288707, 0, 0, 0, 1, 1,
2.176012, 0.4754675, 1.129, 0, 0, 0, 1, 1,
2.205042, 0.4697092, 1.585424, 0, 0, 0, 1, 1,
2.252495, 1.376764, 0.4633226, 0, 0, 0, 1, 1,
2.398343, 1.255957, 1.51411, 0, 0, 0, 1, 1,
2.453022, -1.052449, 2.135641, 0, 0, 0, 1, 1,
2.45727, 0.9096607, 0.9546145, 1, 1, 1, 1, 1,
2.479656, -0.6207941, -0.1069246, 1, 1, 1, 1, 1,
2.59402, 0.666663, -0.4534057, 1, 1, 1, 1, 1,
2.624854, 0.5746375, 0.9848334, 1, 1, 1, 1, 1,
2.781182, 0.4440725, 1.510169, 1, 1, 1, 1, 1,
2.838336, -0.4244977, 0.8896826, 1, 1, 1, 1, 1,
3.459976, 0.6930059, 1.762187, 1, 1, 1, 1, 1
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
var radius = 9.89397;
var distance = 34.75215;
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
mvMatrix.translate( 0.03435206, 0.03288412, -0.2547784 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.75215);
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
