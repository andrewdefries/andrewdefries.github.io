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
-2.633494, -0.4721914, -2.748994, 1, 0, 0, 1,
-2.469868, 0.861758, -0.4590836, 1, 0.007843138, 0, 1,
-2.45646, -1.788238, -1.216738, 1, 0.01176471, 0, 1,
-2.438518, 0.6497592, -0.5818426, 1, 0.01960784, 0, 1,
-2.367955, -0.4380918, -2.952564, 1, 0.02352941, 0, 1,
-2.344609, 0.5166308, -1.210505, 1, 0.03137255, 0, 1,
-2.321141, -0.4225206, -3.501661, 1, 0.03529412, 0, 1,
-2.292387, -1.032269, -1.22928, 1, 0.04313726, 0, 1,
-2.252125, -0.5459095, -2.114816, 1, 0.04705882, 0, 1,
-2.237049, 0.1894148, -0.1891683, 1, 0.05490196, 0, 1,
-2.22834, -0.8084934, -2.786253, 1, 0.05882353, 0, 1,
-2.220383, 0.5126631, -1.149358, 1, 0.06666667, 0, 1,
-2.21056, -0.9376818, -1.228486, 1, 0.07058824, 0, 1,
-2.081209, -1.271632, -3.456704, 1, 0.07843138, 0, 1,
-2.060592, 1.324468, -1.638507, 1, 0.08235294, 0, 1,
-2.056521, 0.7084797, -0.2300772, 1, 0.09019608, 0, 1,
-2.041618, 0.2333228, -2.604988, 1, 0.09411765, 0, 1,
-2.023848, 0.6843928, -1.015251, 1, 0.1019608, 0, 1,
-2.013693, -0.9915609, -2.364774, 1, 0.1098039, 0, 1,
-1.963965, -1.310787, -2.221536, 1, 0.1137255, 0, 1,
-1.93598, 1.084708, -1.27982, 1, 0.1215686, 0, 1,
-1.907586, -1.394199, -1.710132, 1, 0.1254902, 0, 1,
-1.899379, 0.6520444, -2.738845, 1, 0.1333333, 0, 1,
-1.88523, -0.5011508, -1.776879, 1, 0.1372549, 0, 1,
-1.87531, 1.255747, 1.941122, 1, 0.145098, 0, 1,
-1.843922, 1.150131, -1.497036, 1, 0.1490196, 0, 1,
-1.833971, -0.2162841, -0.7049611, 1, 0.1568628, 0, 1,
-1.811063, -0.8986151, -1.70698, 1, 0.1607843, 0, 1,
-1.786423, 0.7147214, -1.17518, 1, 0.1686275, 0, 1,
-1.774956, 0.5073072, -1.975112, 1, 0.172549, 0, 1,
-1.774722, 1.876333, -0.9331244, 1, 0.1803922, 0, 1,
-1.76102, -0.5600034, -1.005132, 1, 0.1843137, 0, 1,
-1.748394, -1.721385, -0.7425124, 1, 0.1921569, 0, 1,
-1.722178, 0.2304996, -1.815729, 1, 0.1960784, 0, 1,
-1.718605, 1.676315, -0.6520981, 1, 0.2039216, 0, 1,
-1.718521, -0.7736008, -1.865734, 1, 0.2117647, 0, 1,
-1.713077, -0.2169902, -1.549039, 1, 0.2156863, 0, 1,
-1.712482, -0.7076582, -2.103267, 1, 0.2235294, 0, 1,
-1.699959, 1.088966, -1.9745, 1, 0.227451, 0, 1,
-1.686062, -1.864033, -4.278821, 1, 0.2352941, 0, 1,
-1.657716, 0.8591536, 0.1639108, 1, 0.2392157, 0, 1,
-1.646073, -0.2810621, -3.141861, 1, 0.2470588, 0, 1,
-1.629322, 0.05706903, -1.078657, 1, 0.2509804, 0, 1,
-1.622525, -0.1902052, -1.952038, 1, 0.2588235, 0, 1,
-1.617718, -0.6303594, -2.853759, 1, 0.2627451, 0, 1,
-1.609873, -0.9880751, -2.771185, 1, 0.2705882, 0, 1,
-1.609487, -0.2139339, -0.8394296, 1, 0.2745098, 0, 1,
-1.607803, -0.17844, -1.844844, 1, 0.282353, 0, 1,
-1.597888, -1.819977, -3.211274, 1, 0.2862745, 0, 1,
-1.59519, -0.03903709, -2.229834, 1, 0.2941177, 0, 1,
-1.593693, 2.212144, -1.563862, 1, 0.3019608, 0, 1,
-1.583647, -0.5941572, 0.8278598, 1, 0.3058824, 0, 1,
-1.572535, 1.311389, -0.3296164, 1, 0.3137255, 0, 1,
-1.565869, -0.4907683, -1.724463, 1, 0.3176471, 0, 1,
-1.560159, 1.905969, -0.2021965, 1, 0.3254902, 0, 1,
-1.555856, 0.8543627, -1.723138, 1, 0.3294118, 0, 1,
-1.553449, 0.2187846, -1.515605, 1, 0.3372549, 0, 1,
-1.509112, 1.718098, -1.355931, 1, 0.3411765, 0, 1,
-1.492939, -1.332596, 0.04448273, 1, 0.3490196, 0, 1,
-1.490666, -0.09386599, -3.490522, 1, 0.3529412, 0, 1,
-1.481774, 1.820276, 0.8188377, 1, 0.3607843, 0, 1,
-1.477325, 0.4806072, -2.613989, 1, 0.3647059, 0, 1,
-1.458941, 0.3142727, -1.709335, 1, 0.372549, 0, 1,
-1.450042, -0.4392765, -1.87374, 1, 0.3764706, 0, 1,
-1.446152, 1.908099, 0.8303334, 1, 0.3843137, 0, 1,
-1.440433, 2.486634, 1.809087, 1, 0.3882353, 0, 1,
-1.411918, 0.0147452, -0.755932, 1, 0.3960784, 0, 1,
-1.4113, -0.6837689, -2.60338, 1, 0.4039216, 0, 1,
-1.40725, 0.9014474, -0.9677961, 1, 0.4078431, 0, 1,
-1.397071, -0.8823926, -4.587892, 1, 0.4156863, 0, 1,
-1.396441, -0.6791134, -1.895188, 1, 0.4196078, 0, 1,
-1.383692, 0.1427471, 0.01249083, 1, 0.427451, 0, 1,
-1.378931, -1.601593, -2.194808, 1, 0.4313726, 0, 1,
-1.377631, 0.3747812, -0.3850884, 1, 0.4392157, 0, 1,
-1.372828, -1.963256, -2.395243, 1, 0.4431373, 0, 1,
-1.35769, -0.5210748, -1.597382, 1, 0.4509804, 0, 1,
-1.351056, 1.831353, -0.08938622, 1, 0.454902, 0, 1,
-1.342205, 0.4884681, -0.9573812, 1, 0.4627451, 0, 1,
-1.331461, 0.0943862, -3.638689, 1, 0.4666667, 0, 1,
-1.32717, -1.088038, -3.119511, 1, 0.4745098, 0, 1,
-1.322805, 1.415322, 0.4390051, 1, 0.4784314, 0, 1,
-1.320208, 0.8755227, -1.146643, 1, 0.4862745, 0, 1,
-1.316516, -0.61703, -0.688077, 1, 0.4901961, 0, 1,
-1.316326, -1.017467, -2.379246, 1, 0.4980392, 0, 1,
-1.310152, -0.7572297, -1.820114, 1, 0.5058824, 0, 1,
-1.299839, -1.438585, -2.426435, 1, 0.509804, 0, 1,
-1.297206, 0.1612606, -1.382947, 1, 0.5176471, 0, 1,
-1.290556, 0.2853781, -2.463538, 1, 0.5215687, 0, 1,
-1.271277, -2.993032, -1.959754, 1, 0.5294118, 0, 1,
-1.270533, -0.09050976, -2.14058, 1, 0.5333334, 0, 1,
-1.264783, -2.222171, -2.089468, 1, 0.5411765, 0, 1,
-1.263014, 0.811057, -1.297215, 1, 0.5450981, 0, 1,
-1.255877, 2.021811, -0.9807223, 1, 0.5529412, 0, 1,
-1.24781, 0.3458568, -2.045662, 1, 0.5568628, 0, 1,
-1.226112, -1.440348, -2.326788, 1, 0.5647059, 0, 1,
-1.213582, 0.8666191, -0.3892476, 1, 0.5686275, 0, 1,
-1.213512, 0.0828494, -1.99841, 1, 0.5764706, 0, 1,
-1.206332, 0.4208435, -1.760153, 1, 0.5803922, 0, 1,
-1.201901, -1.52311, -2.899643, 1, 0.5882353, 0, 1,
-1.198915, 3.162275, -0.847515, 1, 0.5921569, 0, 1,
-1.198222, -1.267284, -2.397732, 1, 0.6, 0, 1,
-1.193165, -1.117343, -2.021516, 1, 0.6078432, 0, 1,
-1.183561, -0.5701001, -0.2980582, 1, 0.6117647, 0, 1,
-1.178849, 2.168529, 0.8587422, 1, 0.6196079, 0, 1,
-1.17554, -1.123474, -2.834015, 1, 0.6235294, 0, 1,
-1.162157, -0.7018196, -3.030433, 1, 0.6313726, 0, 1,
-1.135921, -0.6031451, -1.897554, 1, 0.6352941, 0, 1,
-1.134147, -0.6543238, -1.212716, 1, 0.6431373, 0, 1,
-1.132607, -0.5713134, -2.583894, 1, 0.6470588, 0, 1,
-1.129999, -1.347808, -1.263271, 1, 0.654902, 0, 1,
-1.127901, -0.8446029, -2.689612, 1, 0.6588235, 0, 1,
-1.127545, -0.4436411, -3.053932, 1, 0.6666667, 0, 1,
-1.110664, -1.457858, -2.627328, 1, 0.6705883, 0, 1,
-1.108587, 0.4317122, -0.855113, 1, 0.6784314, 0, 1,
-1.104657, -1.415781, -2.044223, 1, 0.682353, 0, 1,
-1.099149, 0.2052174, -0.9016695, 1, 0.6901961, 0, 1,
-1.087391, 0.5434787, -0.9006207, 1, 0.6941177, 0, 1,
-1.082919, -0.5997488, -1.059524, 1, 0.7019608, 0, 1,
-1.074651, -1.331329, -2.737472, 1, 0.7098039, 0, 1,
-1.074534, 1.300048, 0.6507792, 1, 0.7137255, 0, 1,
-1.071448, 0.9976269, -1.307791, 1, 0.7215686, 0, 1,
-1.056152, -0.7292894, -1.533909, 1, 0.7254902, 0, 1,
-1.05511, 0.1467101, 1.296441, 1, 0.7333333, 0, 1,
-1.053666, -1.596965, -2.653243, 1, 0.7372549, 0, 1,
-1.051888, -1.969294, -2.432235, 1, 0.7450981, 0, 1,
-1.04832, 0.8050271, -0.3674942, 1, 0.7490196, 0, 1,
-1.045826, -0.7533536, -2.86731, 1, 0.7568628, 0, 1,
-1.044541, -0.1435234, -0.3681925, 1, 0.7607843, 0, 1,
-1.040104, -0.6101419, -1.243822, 1, 0.7686275, 0, 1,
-1.023518, 0.4727598, -0.9123368, 1, 0.772549, 0, 1,
-1.022399, 0.257638, -1.335395, 1, 0.7803922, 0, 1,
-1.021446, -0.5804728, -3.444416, 1, 0.7843137, 0, 1,
-1.018076, 0.2830433, -0.4446022, 1, 0.7921569, 0, 1,
-1.017638, -0.2328845, -2.189257, 1, 0.7960784, 0, 1,
-1.014698, 0.03258771, -1.897202, 1, 0.8039216, 0, 1,
-1.011006, 0.3761692, 0.3204958, 1, 0.8117647, 0, 1,
-1.009701, 1.329825, -3.30373, 1, 0.8156863, 0, 1,
-1.004419, -0.9466669, -0.6461376, 1, 0.8235294, 0, 1,
-0.9997544, -0.6080416, -3.326194, 1, 0.827451, 0, 1,
-0.9955166, -1.719705, -1.710109, 1, 0.8352941, 0, 1,
-0.9947062, -0.3270906, -2.141287, 1, 0.8392157, 0, 1,
-0.9943619, -0.4985199, -2.760784, 1, 0.8470588, 0, 1,
-0.9887506, -0.7777588, -3.235376, 1, 0.8509804, 0, 1,
-0.9825476, 0.5154312, -0.2836049, 1, 0.8588235, 0, 1,
-0.9792622, -0.7240893, -1.779987, 1, 0.8627451, 0, 1,
-0.973281, -0.7258006, -2.865861, 1, 0.8705882, 0, 1,
-0.9717038, -1.131946, -1.892302, 1, 0.8745098, 0, 1,
-0.9649708, 0.02873462, -1.41437, 1, 0.8823529, 0, 1,
-0.9635801, -0.3990453, -2.098106, 1, 0.8862745, 0, 1,
-0.9598764, -0.6468244, -2.302113, 1, 0.8941177, 0, 1,
-0.958036, -0.2860156, -1.584238, 1, 0.8980392, 0, 1,
-0.9543048, 1.339043, -1.731333, 1, 0.9058824, 0, 1,
-0.9542934, 1.241556, -0.9388863, 1, 0.9137255, 0, 1,
-0.9494028, 1.306745, 0.9725558, 1, 0.9176471, 0, 1,
-0.9487652, -1.729289, -2.190521, 1, 0.9254902, 0, 1,
-0.9452678, -0.1598511, -1.262626, 1, 0.9294118, 0, 1,
-0.9417233, 0.2494581, -1.665383, 1, 0.9372549, 0, 1,
-0.9377502, -0.6785294, -1.245407, 1, 0.9411765, 0, 1,
-0.9337562, -1.126531, -3.327307, 1, 0.9490196, 0, 1,
-0.9244402, 0.2154884, -1.722848, 1, 0.9529412, 0, 1,
-0.9216676, 0.1566592, -1.17138, 1, 0.9607843, 0, 1,
-0.9182345, 0.2984128, -2.685332, 1, 0.9647059, 0, 1,
-0.9155453, 0.6061996, 0.4481209, 1, 0.972549, 0, 1,
-0.9150417, 1.666808, -0.0520085, 1, 0.9764706, 0, 1,
-0.9082416, -0.3642627, -1.724877, 1, 0.9843137, 0, 1,
-0.9061384, 0.7530094, -0.3433493, 1, 0.9882353, 0, 1,
-0.8972197, -0.7054843, -1.46223, 1, 0.9960784, 0, 1,
-0.8967608, -0.7822708, -1.621181, 0.9960784, 1, 0, 1,
-0.8914652, -0.3305163, -2.551761, 0.9921569, 1, 0, 1,
-0.8910831, -0.8502318, -0.9430038, 0.9843137, 1, 0, 1,
-0.8851014, -0.2522156, -0.4110715, 0.9803922, 1, 0, 1,
-0.87603, -0.3575012, -1.907154, 0.972549, 1, 0, 1,
-0.8729949, 2.052134, -0.7416962, 0.9686275, 1, 0, 1,
-0.8727577, -0.6442491, -2.092505, 0.9607843, 1, 0, 1,
-0.861809, 0.4900756, -0.5104926, 0.9568627, 1, 0, 1,
-0.8608632, -1.583326, -2.232161, 0.9490196, 1, 0, 1,
-0.8606629, 0.4661658, -0.8980052, 0.945098, 1, 0, 1,
-0.8571051, 0.4465875, -0.1328983, 0.9372549, 1, 0, 1,
-0.8566043, -1.327485, -4.088362, 0.9333333, 1, 0, 1,
-0.8496143, 1.887445, 0.3326402, 0.9254902, 1, 0, 1,
-0.8400482, -0.1617753, -2.634541, 0.9215686, 1, 0, 1,
-0.8381197, -1.198904, -2.654049, 0.9137255, 1, 0, 1,
-0.8377942, -0.3720865, -3.507235, 0.9098039, 1, 0, 1,
-0.8345375, -0.577717, -1.228865, 0.9019608, 1, 0, 1,
-0.8339183, -1.729204, -2.759892, 0.8941177, 1, 0, 1,
-0.8298554, -0.4058161, -3.071537, 0.8901961, 1, 0, 1,
-0.8194805, 0.5258672, -0.2752937, 0.8823529, 1, 0, 1,
-0.8161909, 0.1852634, -1.07716, 0.8784314, 1, 0, 1,
-0.8153352, 0.01983339, -0.9489649, 0.8705882, 1, 0, 1,
-0.8109576, 1.9853, 1.500545, 0.8666667, 1, 0, 1,
-0.8078222, 0.5044046, -0.672709, 0.8588235, 1, 0, 1,
-0.8063426, -0.09415753, -2.754372, 0.854902, 1, 0, 1,
-0.8053746, 3.422606, -1.158804, 0.8470588, 1, 0, 1,
-0.8053683, -0.02567343, -1.103303, 0.8431373, 1, 0, 1,
-0.8031592, -1.065383, -1.820951, 0.8352941, 1, 0, 1,
-0.7956766, 0.6464775, -1.549422, 0.8313726, 1, 0, 1,
-0.7951646, 0.4349436, -0.9576159, 0.8235294, 1, 0, 1,
-0.7878633, 0.07074367, -1.410475, 0.8196079, 1, 0, 1,
-0.7876335, -1.049912, -3.195496, 0.8117647, 1, 0, 1,
-0.7859371, -1.283959, -0.08714143, 0.8078431, 1, 0, 1,
-0.7822505, -0.04063533, -0.896059, 0.8, 1, 0, 1,
-0.7778204, 0.1085055, -1.618995, 0.7921569, 1, 0, 1,
-0.7754655, -0.4504222, -0.5817281, 0.7882353, 1, 0, 1,
-0.7749522, 0.7577279, -1.039856, 0.7803922, 1, 0, 1,
-0.7747555, -1.193163, -3.960957, 0.7764706, 1, 0, 1,
-0.7747064, 1.327637, -1.251893, 0.7686275, 1, 0, 1,
-0.7732179, -0.09182835, -1.455803, 0.7647059, 1, 0, 1,
-0.7691834, -2.065683, -1.822528, 0.7568628, 1, 0, 1,
-0.7671526, -0.6428074, -3.159854, 0.7529412, 1, 0, 1,
-0.75877, -0.4176414, -1.112149, 0.7450981, 1, 0, 1,
-0.7549427, -1.111882, -2.805055, 0.7411765, 1, 0, 1,
-0.7502358, 1.568803, -0.8849682, 0.7333333, 1, 0, 1,
-0.7501125, 1.180112, -0.7449376, 0.7294118, 1, 0, 1,
-0.7499734, -0.02687041, 0.2277546, 0.7215686, 1, 0, 1,
-0.7439191, 0.7287359, 0.9613293, 0.7176471, 1, 0, 1,
-0.7401274, 0.2791313, -2.861936, 0.7098039, 1, 0, 1,
-0.7396683, -0.3328035, -2.085048, 0.7058824, 1, 0, 1,
-0.7389953, -0.6581119, -3.608855, 0.6980392, 1, 0, 1,
-0.7374517, -0.3835839, -2.046563, 0.6901961, 1, 0, 1,
-0.7310655, 0.07441226, -1.843289, 0.6862745, 1, 0, 1,
-0.7308108, -1.293056, -1.283368, 0.6784314, 1, 0, 1,
-0.718685, -0.6821686, -2.672403, 0.6745098, 1, 0, 1,
-0.7106708, -0.7928422, -2.26323, 0.6666667, 1, 0, 1,
-0.7069051, 1.445868, -0.6980166, 0.6627451, 1, 0, 1,
-0.703828, 1.706189, 0.7248174, 0.654902, 1, 0, 1,
-0.7025684, 0.5045103, -1.8769, 0.6509804, 1, 0, 1,
-0.70029, -1.090502, -1.983243, 0.6431373, 1, 0, 1,
-0.6977929, -1.300538, -3.768875, 0.6392157, 1, 0, 1,
-0.6974819, -0.8233333, -2.537877, 0.6313726, 1, 0, 1,
-0.6916793, 0.9012072, 0.1420617, 0.627451, 1, 0, 1,
-0.6826993, -0.2018877, -1.817908, 0.6196079, 1, 0, 1,
-0.6800695, -0.1589046, 0.6978045, 0.6156863, 1, 0, 1,
-0.6779404, -0.2942505, -2.663527, 0.6078432, 1, 0, 1,
-0.675765, 1.318469, -0.7392209, 0.6039216, 1, 0, 1,
-0.6751925, 0.4539909, -2.734575, 0.5960785, 1, 0, 1,
-0.6724663, 1.291554, 0.3378454, 0.5882353, 1, 0, 1,
-0.6723585, -0.8565499, -1.956472, 0.5843138, 1, 0, 1,
-0.669754, 0.0975522, -2.8056, 0.5764706, 1, 0, 1,
-0.6694544, -0.5587347, -2.901822, 0.572549, 1, 0, 1,
-0.6673523, 0.2520381, -0.6040278, 0.5647059, 1, 0, 1,
-0.6614426, 2.462862, 1.725979, 0.5607843, 1, 0, 1,
-0.6554866, 0.142148, -1.88446, 0.5529412, 1, 0, 1,
-0.6518312, 1.975524, 0.04999918, 0.5490196, 1, 0, 1,
-0.6507873, 1.551432, -1.700741, 0.5411765, 1, 0, 1,
-0.6469826, 1.409554, -1.256328, 0.5372549, 1, 0, 1,
-0.6464, -1.952546, -3.315669, 0.5294118, 1, 0, 1,
-0.6461505, -0.0825756, -0.4804411, 0.5254902, 1, 0, 1,
-0.6454094, 0.416233, -1.777477, 0.5176471, 1, 0, 1,
-0.6415503, 0.4787025, -2.792869, 0.5137255, 1, 0, 1,
-0.6401459, 0.5862155, -1.165326, 0.5058824, 1, 0, 1,
-0.6381215, 0.3767398, -0.2163315, 0.5019608, 1, 0, 1,
-0.6346748, -0.6266493, -0.3874898, 0.4941176, 1, 0, 1,
-0.615771, -1.222929, -3.340108, 0.4862745, 1, 0, 1,
-0.6120405, -1.024663, -2.574687, 0.4823529, 1, 0, 1,
-0.6078759, -0.01745483, -2.227796, 0.4745098, 1, 0, 1,
-0.6073186, 0.3341538, -1.697494, 0.4705882, 1, 0, 1,
-0.6045957, 1.066501, -0.309047, 0.4627451, 1, 0, 1,
-0.5990624, -0.6851144, -2.248538, 0.4588235, 1, 0, 1,
-0.5953844, -0.05104624, -0.7419411, 0.4509804, 1, 0, 1,
-0.5941674, 0.9797559, -1.289834, 0.4470588, 1, 0, 1,
-0.5939037, -1.726816, -2.649026, 0.4392157, 1, 0, 1,
-0.5907012, 0.3031458, -1.192425, 0.4352941, 1, 0, 1,
-0.5871895, -0.6153047, -2.041471, 0.427451, 1, 0, 1,
-0.5746923, -0.6015285, -1.171872, 0.4235294, 1, 0, 1,
-0.5727316, 0.6843164, -0.6263053, 0.4156863, 1, 0, 1,
-0.5718971, -0.5752652, -1.663723, 0.4117647, 1, 0, 1,
-0.5712914, 0.6261277, -1.627264, 0.4039216, 1, 0, 1,
-0.5676963, -1.49872, -0.5303295, 0.3960784, 1, 0, 1,
-0.5644161, -0.8013769, -2.874818, 0.3921569, 1, 0, 1,
-0.5539011, 0.7462933, -0.003669646, 0.3843137, 1, 0, 1,
-0.5480829, 0.3241409, -2.871492, 0.3803922, 1, 0, 1,
-0.5480767, -1.495797, -2.660054, 0.372549, 1, 0, 1,
-0.5477947, -0.8197112, -1.837286, 0.3686275, 1, 0, 1,
-0.5465032, -0.9744551, -4.033487, 0.3607843, 1, 0, 1,
-0.5460212, -0.04010959, -4.313998, 0.3568628, 1, 0, 1,
-0.5443884, -0.6738532, -4.154676, 0.3490196, 1, 0, 1,
-0.5437449, -0.7416506, -1.500689, 0.345098, 1, 0, 1,
-0.5426573, -1.483957, -3.736872, 0.3372549, 1, 0, 1,
-0.5304592, -0.3851027, -1.800473, 0.3333333, 1, 0, 1,
-0.5297004, -0.4433721, -1.300444, 0.3254902, 1, 0, 1,
-0.5281243, -1.048967, -1.248496, 0.3215686, 1, 0, 1,
-0.5271663, -0.3183765, -1.304731, 0.3137255, 1, 0, 1,
-0.525738, -0.414436, -2.109302, 0.3098039, 1, 0, 1,
-0.5230935, 0.118884, -2.048, 0.3019608, 1, 0, 1,
-0.5219887, 1.552962, -0.3338502, 0.2941177, 1, 0, 1,
-0.5182264, 0.6588094, -0.2920443, 0.2901961, 1, 0, 1,
-0.5155349, 0.610072, 0.06934364, 0.282353, 1, 0, 1,
-0.5112326, -0.9220889, -3.711949, 0.2784314, 1, 0, 1,
-0.5066064, -0.8148923, -2.042351, 0.2705882, 1, 0, 1,
-0.5047851, 0.8393906, 1.647297, 0.2666667, 1, 0, 1,
-0.5026078, -1.89263, -3.928863, 0.2588235, 1, 0, 1,
-0.5005878, 0.6804107, -0.5690297, 0.254902, 1, 0, 1,
-0.5003823, -1.224739, -1.178627, 0.2470588, 1, 0, 1,
-0.4964253, 0.5506489, -0.01028553, 0.2431373, 1, 0, 1,
-0.4930006, 0.8130723, -1.127236, 0.2352941, 1, 0, 1,
-0.4874534, -0.4335229, -3.515148, 0.2313726, 1, 0, 1,
-0.4793179, 1.012078, -2.312136, 0.2235294, 1, 0, 1,
-0.4789105, 1.450078, -0.6467842, 0.2196078, 1, 0, 1,
-0.4771225, 1.116648, -0.6382362, 0.2117647, 1, 0, 1,
-0.4739963, 0.6570892, -0.9352447, 0.2078431, 1, 0, 1,
-0.4709421, 2.20869, 1.433956, 0.2, 1, 0, 1,
-0.4649007, -1.522295, -2.38948, 0.1921569, 1, 0, 1,
-0.4641644, 0.843392, 0.2890972, 0.1882353, 1, 0, 1,
-0.4628662, 1.19114, -1.623102, 0.1803922, 1, 0, 1,
-0.4616579, -1.106307, -3.899698, 0.1764706, 1, 0, 1,
-0.4550146, -1.115273, -2.592204, 0.1686275, 1, 0, 1,
-0.453741, 0.555268, -1.294464, 0.1647059, 1, 0, 1,
-0.4522131, -0.8543478, -2.829438, 0.1568628, 1, 0, 1,
-0.4503421, 0.5605937, -1.620064, 0.1529412, 1, 0, 1,
-0.4448083, -2.1999, -4.028036, 0.145098, 1, 0, 1,
-0.4420529, -0.5596825, -3.722422, 0.1411765, 1, 0, 1,
-0.438647, -0.522092, -0.6878592, 0.1333333, 1, 0, 1,
-0.4379683, 0.2008203, -0.7280881, 0.1294118, 1, 0, 1,
-0.432745, -0.07211787, -0.6751774, 0.1215686, 1, 0, 1,
-0.4314539, 0.1088379, -2.177351, 0.1176471, 1, 0, 1,
-0.427083, 0.9291234, -1.068916, 0.1098039, 1, 0, 1,
-0.4246481, 0.04207552, -0.7064304, 0.1058824, 1, 0, 1,
-0.4203523, -0.495386, -3.753407, 0.09803922, 1, 0, 1,
-0.419153, 0.1213704, -0.3415069, 0.09019608, 1, 0, 1,
-0.4170757, 0.1095596, -2.405169, 0.08627451, 1, 0, 1,
-0.4159903, 0.3007824, -2.505237, 0.07843138, 1, 0, 1,
-0.4152467, 1.699601, -0.5296224, 0.07450981, 1, 0, 1,
-0.4120966, -0.8177805, -3.676619, 0.06666667, 1, 0, 1,
-0.4099921, 1.076098, -0.5463594, 0.0627451, 1, 0, 1,
-0.4076431, -1.311417, -3.448864, 0.05490196, 1, 0, 1,
-0.403479, -1.138775, -3.101343, 0.05098039, 1, 0, 1,
-0.3987528, -0.8668297, -2.253159, 0.04313726, 1, 0, 1,
-0.3985925, 1.395841, -2.212727, 0.03921569, 1, 0, 1,
-0.3978922, 0.4575654, 0.6119403, 0.03137255, 1, 0, 1,
-0.396939, 0.9002151, 1.136985, 0.02745098, 1, 0, 1,
-0.3940622, 0.2171369, -0.2553629, 0.01960784, 1, 0, 1,
-0.3902662, -0.1925325, -1.771048, 0.01568628, 1, 0, 1,
-0.3877656, -0.3856713, -1.63509, 0.007843138, 1, 0, 1,
-0.3851179, -1.39907, -0.8356692, 0.003921569, 1, 0, 1,
-0.3792809, -0.8393494, -2.213806, 0, 1, 0.003921569, 1,
-0.3741407, -1.011327, -5.648057, 0, 1, 0.01176471, 1,
-0.3731762, 0.4943453, 0.3558899, 0, 1, 0.01568628, 1,
-0.3650778, -0.6841046, -3.650456, 0, 1, 0.02352941, 1,
-0.3628961, -1.093091, -4.965206, 0, 1, 0.02745098, 1,
-0.3620372, -0.9278734, -2.61452, 0, 1, 0.03529412, 1,
-0.3604454, 1.231367, -1.251248, 0, 1, 0.03921569, 1,
-0.3602639, -0.218138, -1.6361, 0, 1, 0.04705882, 1,
-0.3554808, 1.237968, -1.166572, 0, 1, 0.05098039, 1,
-0.3540672, 0.6006343, -1.85726, 0, 1, 0.05882353, 1,
-0.3497285, 1.018503, 1.224374, 0, 1, 0.0627451, 1,
-0.3495451, -1.428571, -3.30977, 0, 1, 0.07058824, 1,
-0.3448799, 1.040408, -0.6353024, 0, 1, 0.07450981, 1,
-0.3447858, 0.1547104, -0.9319016, 0, 1, 0.08235294, 1,
-0.3441614, -0.3550672, -2.278768, 0, 1, 0.08627451, 1,
-0.3434224, 0.4540176, -0.1820099, 0, 1, 0.09411765, 1,
-0.3434097, -0.5856152, -1.76361, 0, 1, 0.1019608, 1,
-0.3416675, -0.8455027, -2.737229, 0, 1, 0.1058824, 1,
-0.3403416, -0.8425156, -1.838381, 0, 1, 0.1137255, 1,
-0.3367926, 0.5707181, -0.677687, 0, 1, 0.1176471, 1,
-0.3365402, 1.586813, 0.2974463, 0, 1, 0.1254902, 1,
-0.3347151, -0.4477031, -1.250287, 0, 1, 0.1294118, 1,
-0.3339235, 0.03160228, -1.204205, 0, 1, 0.1372549, 1,
-0.333522, 0.4181673, -0.3059509, 0, 1, 0.1411765, 1,
-0.32936, -0.6126214, -3.189554, 0, 1, 0.1490196, 1,
-0.3275643, -0.1680671, -5.073876, 0, 1, 0.1529412, 1,
-0.325954, -0.7026094, -3.709411, 0, 1, 0.1607843, 1,
-0.3220847, -0.05238368, -0.917807, 0, 1, 0.1647059, 1,
-0.318286, 0.8739083, 0.08271879, 0, 1, 0.172549, 1,
-0.3177935, -1.066933, -1.48917, 0, 1, 0.1764706, 1,
-0.3162909, -0.8350827, -3.650157, 0, 1, 0.1843137, 1,
-0.3033505, 1.499027, -2.376378, 0, 1, 0.1882353, 1,
-0.3022431, -1.149726, -2.365236, 0, 1, 0.1960784, 1,
-0.2999542, 0.3468741, 0.6800393, 0, 1, 0.2039216, 1,
-0.2988778, 2.474409, -1.850434, 0, 1, 0.2078431, 1,
-0.2965746, 0.6235734, 0.3815193, 0, 1, 0.2156863, 1,
-0.2965469, -0.1121549, -1.297435, 0, 1, 0.2196078, 1,
-0.2953683, -0.8312974, -2.272705, 0, 1, 0.227451, 1,
-0.2944305, 1.930294, 0.3142112, 0, 1, 0.2313726, 1,
-0.2924141, -1.805781, -2.820628, 0, 1, 0.2392157, 1,
-0.2903402, 1.389862, 0.006854923, 0, 1, 0.2431373, 1,
-0.2869345, -0.6769045, -4.808365, 0, 1, 0.2509804, 1,
-0.2843863, -0.7789418, -2.689371, 0, 1, 0.254902, 1,
-0.2796371, 1.197207, -0.8024415, 0, 1, 0.2627451, 1,
-0.2792071, -0.714219, -2.533577, 0, 1, 0.2666667, 1,
-0.2765364, -1.459824, -3.020407, 0, 1, 0.2745098, 1,
-0.2702377, -0.4229591, -2.064299, 0, 1, 0.2784314, 1,
-0.2694387, -0.379647, -2.1232, 0, 1, 0.2862745, 1,
-0.2693605, 2.022523, 1.843195, 0, 1, 0.2901961, 1,
-0.2692495, -0.4168927, -2.078464, 0, 1, 0.2980392, 1,
-0.268225, 0.09772491, -2.979138, 0, 1, 0.3058824, 1,
-0.2656709, 0.1327338, -1.3537, 0, 1, 0.3098039, 1,
-0.2593684, 1.702005, -0.001327238, 0, 1, 0.3176471, 1,
-0.2488646, 0.6970977, 2.319457, 0, 1, 0.3215686, 1,
-0.2462518, -1.007981, -4.087689, 0, 1, 0.3294118, 1,
-0.2452903, -0.1123371, -2.990111, 0, 1, 0.3333333, 1,
-0.2445723, 1.966436, 7.478606e-05, 0, 1, 0.3411765, 1,
-0.2383831, 0.8578686, 2.004976, 0, 1, 0.345098, 1,
-0.2369666, -0.8836222, -2.734721, 0, 1, 0.3529412, 1,
-0.2344186, 2.570018, 0.1054207, 0, 1, 0.3568628, 1,
-0.2327728, 0.6657021, 0.887141, 0, 1, 0.3647059, 1,
-0.2310654, 0.671178, -0.4608592, 0, 1, 0.3686275, 1,
-0.2228073, 0.5858634, 0.1218046, 0, 1, 0.3764706, 1,
-0.2214178, -0.6169075, -4.330276, 0, 1, 0.3803922, 1,
-0.2115734, 1.629169, 0.3349286, 0, 1, 0.3882353, 1,
-0.210501, 0.2524425, -0.4922571, 0, 1, 0.3921569, 1,
-0.2065141, 0.7252701, -1.757625, 0, 1, 0.4, 1,
-0.2032223, 0.01249292, -0.6687338, 0, 1, 0.4078431, 1,
-0.2004141, 0.2430064, -1.711355, 0, 1, 0.4117647, 1,
-0.1999559, -1.107025, -3.85184, 0, 1, 0.4196078, 1,
-0.1985848, -0.8851717, -2.266899, 0, 1, 0.4235294, 1,
-0.1980681, 0.1909995, -2.027451, 0, 1, 0.4313726, 1,
-0.1965071, -0.1071284, -2.07101, 0, 1, 0.4352941, 1,
-0.1963338, -1.274099, -3.931664, 0, 1, 0.4431373, 1,
-0.1958294, 0.002498574, -1.417142, 0, 1, 0.4470588, 1,
-0.1942686, -1.108315, -3.973054, 0, 1, 0.454902, 1,
-0.1930552, 1.252502, 0.4971049, 0, 1, 0.4588235, 1,
-0.192945, -0.8344144, -5.398809, 0, 1, 0.4666667, 1,
-0.1913781, -0.2177724, -2.799684, 0, 1, 0.4705882, 1,
-0.191121, -0.7294714, -4.693775, 0, 1, 0.4784314, 1,
-0.190261, 0.3327677, -0.8650645, 0, 1, 0.4823529, 1,
-0.1844636, 0.5619571, 0.5702997, 0, 1, 0.4901961, 1,
-0.183295, 1.426408, 1.096276, 0, 1, 0.4941176, 1,
-0.1763131, 0.2899328, -2.156959, 0, 1, 0.5019608, 1,
-0.1723559, -0.2952623, -3.702895, 0, 1, 0.509804, 1,
-0.1717257, -0.1343146, -2.21396, 0, 1, 0.5137255, 1,
-0.1694042, -0.2804967, 0.7276149, 0, 1, 0.5215687, 1,
-0.1681755, 0.7110981, -0.2294512, 0, 1, 0.5254902, 1,
-0.167917, 0.7897618, -2.047169, 0, 1, 0.5333334, 1,
-0.1673182, 0.551336, -2.541888, 0, 1, 0.5372549, 1,
-0.1671017, 0.681062, -1.131701, 0, 1, 0.5450981, 1,
-0.1594076, -1.038561, -1.315988, 0, 1, 0.5490196, 1,
-0.1593741, -0.1625227, -3.861753, 0, 1, 0.5568628, 1,
-0.1592888, -1.348124, -2.803682, 0, 1, 0.5607843, 1,
-0.1561985, 0.3704291, 1.313367, 0, 1, 0.5686275, 1,
-0.1543725, 1.640868, 0.6215412, 0, 1, 0.572549, 1,
-0.1495454, 0.6731948, 0.3381535, 0, 1, 0.5803922, 1,
-0.1404085, 1.016027, 1.153612, 0, 1, 0.5843138, 1,
-0.1384308, -1.407635, -3.784908, 0, 1, 0.5921569, 1,
-0.1379362, -0.7151281, -2.905924, 0, 1, 0.5960785, 1,
-0.1372005, 1.041377, -0.5988051, 0, 1, 0.6039216, 1,
-0.1362004, -0.6386032, -1.86024, 0, 1, 0.6117647, 1,
-0.1338453, -1.743588, -5.761654, 0, 1, 0.6156863, 1,
-0.1333923, -0.5893472, -2.946275, 0, 1, 0.6235294, 1,
-0.1332247, -1.109709, -2.083447, 0, 1, 0.627451, 1,
-0.131931, -0.9074849, -2.139887, 0, 1, 0.6352941, 1,
-0.1304072, -0.706093, -0.2202673, 0, 1, 0.6392157, 1,
-0.129086, 0.6661912, -1.785693, 0, 1, 0.6470588, 1,
-0.1214769, 0.2108109, -0.6046203, 0, 1, 0.6509804, 1,
-0.1199507, 2.084323, -1.347483, 0, 1, 0.6588235, 1,
-0.1176541, 1.214597, 1.717291, 0, 1, 0.6627451, 1,
-0.1078387, 0.2652794, 0.6641591, 0, 1, 0.6705883, 1,
-0.1070335, 0.6361596, 0.4760734, 0, 1, 0.6745098, 1,
-0.103268, 0.8079894, -1.136509, 0, 1, 0.682353, 1,
-0.1002608, 0.9237915, -1.029637, 0, 1, 0.6862745, 1,
-0.09871983, 0.3276791, -0.8995026, 0, 1, 0.6941177, 1,
-0.09790476, -1.616583, -3.234263, 0, 1, 0.7019608, 1,
-0.09257314, -0.4368829, -4.25512, 0, 1, 0.7058824, 1,
-0.09225796, 0.6904572, -0.596491, 0, 1, 0.7137255, 1,
-0.09194596, -0.436129, -2.181617, 0, 1, 0.7176471, 1,
-0.0904393, -0.5727636, -1.344324, 0, 1, 0.7254902, 1,
-0.09038729, 1.945313, 0.513344, 0, 1, 0.7294118, 1,
-0.0775885, -0.4419992, -2.423256, 0, 1, 0.7372549, 1,
-0.07527238, 0.07695497, 0.2285324, 0, 1, 0.7411765, 1,
-0.07307558, -0.8982736, -3.96217, 0, 1, 0.7490196, 1,
-0.07243447, 1.94192, 0.8953505, 0, 1, 0.7529412, 1,
-0.06905938, -0.3901885, -2.681282, 0, 1, 0.7607843, 1,
-0.06359071, -0.06560381, -0.9392899, 0, 1, 0.7647059, 1,
-0.06153294, -0.2929363, -0.8979978, 0, 1, 0.772549, 1,
-0.06047787, 0.4768669, 0.6859436, 0, 1, 0.7764706, 1,
-0.0587119, -1.676099, -2.511579, 0, 1, 0.7843137, 1,
-0.05856269, -0.3049233, -2.835435, 0, 1, 0.7882353, 1,
-0.05674158, -0.7420064, -5.01303, 0, 1, 0.7960784, 1,
-0.05557173, -0.441626, -3.871048, 0, 1, 0.8039216, 1,
-0.05505143, -0.9097211, -4.648948, 0, 1, 0.8078431, 1,
-0.04970641, -1.671269, -2.357724, 0, 1, 0.8156863, 1,
-0.04642184, -0.8964234, -4.422779, 0, 1, 0.8196079, 1,
-0.04424595, -1.29698, -1.102528, 0, 1, 0.827451, 1,
-0.042141, -0.8571783, -4.077786, 0, 1, 0.8313726, 1,
-0.03847844, -0.7191006, -2.273905, 0, 1, 0.8392157, 1,
-0.03669579, -0.04782545, -1.391603, 0, 1, 0.8431373, 1,
-0.03417812, -1.025047, -4.369989, 0, 1, 0.8509804, 1,
-0.03152113, 0.4670704, -1.122784, 0, 1, 0.854902, 1,
-0.03147084, 0.2667955, -0.1334417, 0, 1, 0.8627451, 1,
-0.02786239, 0.080212, -0.4304708, 0, 1, 0.8666667, 1,
-0.02309608, 0.0535895, -0.1095199, 0, 1, 0.8745098, 1,
-0.0192078, 1.623018, 2.037307, 0, 1, 0.8784314, 1,
-0.01398363, 0.338334, 0.929814, 0, 1, 0.8862745, 1,
-0.01269821, 0.8036425, 0.2828654, 0, 1, 0.8901961, 1,
-0.01245379, 1.247413, -0.7054091, 0, 1, 0.8980392, 1,
-0.007736949, 0.9491089, 1.380257, 0, 1, 0.9058824, 1,
-0.00709435, 2.355599, -1.262245, 0, 1, 0.9098039, 1,
-0.006286717, -1.616969, -3.339437, 0, 1, 0.9176471, 1,
-0.005920949, -0.7953567, -3.209744, 0, 1, 0.9215686, 1,
-0.001312865, -1.268269, -2.292824, 0, 1, 0.9294118, 1,
0.005233715, -0.4626604, 3.621466, 0, 1, 0.9333333, 1,
0.00853467, -0.5316877, 3.280293, 0, 1, 0.9411765, 1,
0.009066402, -1.784067, 2.55528, 0, 1, 0.945098, 1,
0.009181794, 0.6230197, 0.5972111, 0, 1, 0.9529412, 1,
0.01183667, -0.07212783, 3.221024, 0, 1, 0.9568627, 1,
0.0140465, 1.083359, -2.551741, 0, 1, 0.9647059, 1,
0.0143664, -1.060783, 1.442526, 0, 1, 0.9686275, 1,
0.01506804, -0.08783668, 2.599786, 0, 1, 0.9764706, 1,
0.01789426, -1.890671, 3.319232, 0, 1, 0.9803922, 1,
0.01909502, -0.979561, 4.319538, 0, 1, 0.9882353, 1,
0.02160696, -0.1465363, 2.514405, 0, 1, 0.9921569, 1,
0.02261411, 0.07987713, -0.4038301, 0, 1, 1, 1,
0.02416438, 1.090971, -0.9204263, 0, 0.9921569, 1, 1,
0.02804767, 1.852163, -0.2049831, 0, 0.9882353, 1, 1,
0.03004537, 1.357617, 0.1507216, 0, 0.9803922, 1, 1,
0.03205412, 1.065166, 1.038893, 0, 0.9764706, 1, 1,
0.03423018, -0.162864, 4.198356, 0, 0.9686275, 1, 1,
0.03522107, 1.920485, 2.036812, 0, 0.9647059, 1, 1,
0.03673266, -0.9871788, 4.068571, 0, 0.9568627, 1, 1,
0.03765051, 0.3119268, 0.6619301, 0, 0.9529412, 1, 1,
0.0424857, 0.4408915, 1.915314, 0, 0.945098, 1, 1,
0.0453639, -1.723356, 2.30434, 0, 0.9411765, 1, 1,
0.04563434, 0.05190009, -0.4855359, 0, 0.9333333, 1, 1,
0.04606877, 0.998891, -0.1227413, 0, 0.9294118, 1, 1,
0.05099671, 0.6393322, 1.137368, 0, 0.9215686, 1, 1,
0.0530411, -0.7732343, 2.059879, 0, 0.9176471, 1, 1,
0.05425196, -0.4241771, 0.7476003, 0, 0.9098039, 1, 1,
0.05670846, 1.666075, 2.135257, 0, 0.9058824, 1, 1,
0.05802827, -0.7093945, 2.067182, 0, 0.8980392, 1, 1,
0.0612256, 0.2305707, -0.2896049, 0, 0.8901961, 1, 1,
0.06243986, -0.6615511, 2.442306, 0, 0.8862745, 1, 1,
0.06496157, -0.8842179, 4.007093, 0, 0.8784314, 1, 1,
0.06625118, 0.9061911, -0.1841622, 0, 0.8745098, 1, 1,
0.0663551, 0.3040046, 2.389368, 0, 0.8666667, 1, 1,
0.07121655, 0.5272474, -0.7697631, 0, 0.8627451, 1, 1,
0.07240505, 1.026877, -0.8595064, 0, 0.854902, 1, 1,
0.07892226, 1.155237, -0.5355736, 0, 0.8509804, 1, 1,
0.08006463, 0.6350684, 0.2617038, 0, 0.8431373, 1, 1,
0.08112955, -0.1106381, 1.189907, 0, 0.8392157, 1, 1,
0.08199719, 0.2121548, 0.08243076, 0, 0.8313726, 1, 1,
0.08331019, -0.9669979, 2.837859, 0, 0.827451, 1, 1,
0.09220113, 1.066373, -1.012459, 0, 0.8196079, 1, 1,
0.09654363, -0.5988384, 4.905102, 0, 0.8156863, 1, 1,
0.09825297, -0.5977508, 2.073217, 0, 0.8078431, 1, 1,
0.09867583, -1.949263, 1.744089, 0, 0.8039216, 1, 1,
0.09913159, 1.03533, -1.770362, 0, 0.7960784, 1, 1,
0.09942349, -0.4611368, 1.928495, 0, 0.7882353, 1, 1,
0.09968181, 0.09305299, 1.932781, 0, 0.7843137, 1, 1,
0.1001582, -0.5879027, 4.752831, 0, 0.7764706, 1, 1,
0.1008945, -0.9144608, 3.814407, 0, 0.772549, 1, 1,
0.1010649, 0.07811046, 1.267905, 0, 0.7647059, 1, 1,
0.1032772, 0.3097026, 1.211431, 0, 0.7607843, 1, 1,
0.1059208, -0.006050036, 1.618805, 0, 0.7529412, 1, 1,
0.1093026, -1.185762, 4.220828, 0, 0.7490196, 1, 1,
0.1115063, 0.1442428, 1.698815, 0, 0.7411765, 1, 1,
0.1143241, 0.3045699, 0.4001265, 0, 0.7372549, 1, 1,
0.1189143, 1.510729, -0.2951908, 0, 0.7294118, 1, 1,
0.1202, -0.5278422, 1.901931, 0, 0.7254902, 1, 1,
0.1243581, -0.1828489, 1.716135, 0, 0.7176471, 1, 1,
0.1280741, 1.581189, -1.153848, 0, 0.7137255, 1, 1,
0.1302617, 0.177336, 0.2820303, 0, 0.7058824, 1, 1,
0.1318929, -0.731715, 2.800644, 0, 0.6980392, 1, 1,
0.140815, -0.8700537, 4.71218, 0, 0.6941177, 1, 1,
0.1408937, 1.369187, -2.922645, 0, 0.6862745, 1, 1,
0.1427742, -0.9663942, 2.575197, 0, 0.682353, 1, 1,
0.1504914, -0.6575564, 2.177952, 0, 0.6745098, 1, 1,
0.1519119, -0.03105669, 1.878223, 0, 0.6705883, 1, 1,
0.154276, -0.8663465, 2.269378, 0, 0.6627451, 1, 1,
0.1576237, -0.9689885, 1.323473, 0, 0.6588235, 1, 1,
0.1576601, 0.4834177, -1.944553, 0, 0.6509804, 1, 1,
0.1611511, -1.06596, 4.105509, 0, 0.6470588, 1, 1,
0.1622669, -1.312829, 3.806745, 0, 0.6392157, 1, 1,
0.1657755, -1.15637, 2.152754, 0, 0.6352941, 1, 1,
0.1662518, 0.5121081, -2.233839, 0, 0.627451, 1, 1,
0.1667226, -0.8883569, 1.960734, 0, 0.6235294, 1, 1,
0.1709516, 1.735746, 0.4697925, 0, 0.6156863, 1, 1,
0.1712251, 1.122362, 0.819939, 0, 0.6117647, 1, 1,
0.1781777, -0.005634374, 2.391765, 0, 0.6039216, 1, 1,
0.1797089, 0.7368963, 1.599073, 0, 0.5960785, 1, 1,
0.1802245, -0.6162657, 2.440048, 0, 0.5921569, 1, 1,
0.1810225, 1.062585, -1.538195, 0, 0.5843138, 1, 1,
0.1862072, -0.6741901, 2.885566, 0, 0.5803922, 1, 1,
0.1933355, -0.575836, 1.920177, 0, 0.572549, 1, 1,
0.1958845, 0.4262559, 1.419791, 0, 0.5686275, 1, 1,
0.1991401, 0.8808947, -0.9707715, 0, 0.5607843, 1, 1,
0.1996366, 1.580549, -1.78245, 0, 0.5568628, 1, 1,
0.2035039, -1.691352, 1.945155, 0, 0.5490196, 1, 1,
0.2061807, 1.484115, -0.7866669, 0, 0.5450981, 1, 1,
0.2064809, 0.3125869, 2.153209, 0, 0.5372549, 1, 1,
0.2107182, -0.1146717, 2.822108, 0, 0.5333334, 1, 1,
0.2109547, 1.023349, 0.03904871, 0, 0.5254902, 1, 1,
0.211572, 0.9737806, 0.7049823, 0, 0.5215687, 1, 1,
0.2145321, -0.6463551, 1.980576, 0, 0.5137255, 1, 1,
0.2248992, 0.344388, 0.1338309, 0, 0.509804, 1, 1,
0.2249836, 0.2957387, 0.7978212, 0, 0.5019608, 1, 1,
0.2260316, -0.4555454, 2.621193, 0, 0.4941176, 1, 1,
0.230774, 0.5146605, 0.7075744, 0, 0.4901961, 1, 1,
0.2314237, -0.4129365, 5.18178, 0, 0.4823529, 1, 1,
0.2346515, 0.3479145, -1.067501, 0, 0.4784314, 1, 1,
0.2359767, 0.08569494, 1.521833, 0, 0.4705882, 1, 1,
0.239018, -0.1577471, 2.864303, 0, 0.4666667, 1, 1,
0.2392231, -0.6788176, 3.278099, 0, 0.4588235, 1, 1,
0.2404484, 0.9873049, 0.9198731, 0, 0.454902, 1, 1,
0.2421889, -0.526556, 1.365928, 0, 0.4470588, 1, 1,
0.243002, 1.598304, 0.01992884, 0, 0.4431373, 1, 1,
0.2476774, 0.5514057, 1.704128, 0, 0.4352941, 1, 1,
0.2478225, 0.8116895, -0.3733917, 0, 0.4313726, 1, 1,
0.2483604, -0.4548562, 1.720202, 0, 0.4235294, 1, 1,
0.2484814, -0.1997076, 2.78544, 0, 0.4196078, 1, 1,
0.2505486, 1.572629, -0.1436604, 0, 0.4117647, 1, 1,
0.2505981, -1.259295, 2.613322, 0, 0.4078431, 1, 1,
0.2525196, -0.3715802, 3.886406, 0, 0.4, 1, 1,
0.2571651, -0.9065412, 1.653712, 0, 0.3921569, 1, 1,
0.2575168, 0.3574741, -1.294848, 0, 0.3882353, 1, 1,
0.2636959, -2.100341, 1.073986, 0, 0.3803922, 1, 1,
0.2647679, -1.429163, 3.919628, 0, 0.3764706, 1, 1,
0.26796, -0.8540737, 2.565998, 0, 0.3686275, 1, 1,
0.2723594, 0.9402295, -0.09669884, 0, 0.3647059, 1, 1,
0.2758454, 1.639954, -0.2938404, 0, 0.3568628, 1, 1,
0.2774446, 0.8038421, 0.5915253, 0, 0.3529412, 1, 1,
0.2776935, 1.162447, -0.2747678, 0, 0.345098, 1, 1,
0.277958, 0.3580619, 0.2985956, 0, 0.3411765, 1, 1,
0.2799066, 0.1543588, 1.310234, 0, 0.3333333, 1, 1,
0.2818379, -0.899308, 4.135016, 0, 0.3294118, 1, 1,
0.2840916, -0.05126232, 0.6965667, 0, 0.3215686, 1, 1,
0.2844017, -0.61659, 3.235899, 0, 0.3176471, 1, 1,
0.2847809, -1.192945, 2.171245, 0, 0.3098039, 1, 1,
0.2891491, 0.0006187768, 1.247029, 0, 0.3058824, 1, 1,
0.292683, -0.6970155, 2.230367, 0, 0.2980392, 1, 1,
0.2949922, -0.2048793, 2.103348, 0, 0.2901961, 1, 1,
0.2992435, 0.666245, 1.063464, 0, 0.2862745, 1, 1,
0.3108242, -0.3311528, 3.399426, 0, 0.2784314, 1, 1,
0.3202371, -0.6674762, 2.521663, 0, 0.2745098, 1, 1,
0.3236348, 1.121092, 0.6409084, 0, 0.2666667, 1, 1,
0.3253371, 1.818577, -1.038413, 0, 0.2627451, 1, 1,
0.3270893, 0.072657, 0.1898375, 0, 0.254902, 1, 1,
0.3288691, 2.29141, -1.206886, 0, 0.2509804, 1, 1,
0.332408, 0.06749297, 1.868354, 0, 0.2431373, 1, 1,
0.3375393, 1.322879, 1.214256, 0, 0.2392157, 1, 1,
0.3376219, -1.226179, -0.06358688, 0, 0.2313726, 1, 1,
0.3463839, -0.8704601, 2.204657, 0, 0.227451, 1, 1,
0.3504, 0.3842821, 1.27682, 0, 0.2196078, 1, 1,
0.3511391, 3.871963, -0.4826761, 0, 0.2156863, 1, 1,
0.3525111, 1.564113, -0.7628325, 0, 0.2078431, 1, 1,
0.3609608, 1.268135, 0.09012739, 0, 0.2039216, 1, 1,
0.3689734, -0.3866843, 3.230198, 0, 0.1960784, 1, 1,
0.3698626, 0.3112721, 0.6078795, 0, 0.1882353, 1, 1,
0.3725469, 0.5735775, -0.6055644, 0, 0.1843137, 1, 1,
0.3746611, 0.5406548, 1.134015, 0, 0.1764706, 1, 1,
0.3832088, 1.36419, 0.7811517, 0, 0.172549, 1, 1,
0.383748, 2.111286, -0.7304329, 0, 0.1647059, 1, 1,
0.384547, 1.313367, 2.086808, 0, 0.1607843, 1, 1,
0.3881114, -0.1337702, 3.212011, 0, 0.1529412, 1, 1,
0.3889784, 1.123962, 1.148912, 0, 0.1490196, 1, 1,
0.3924408, -0.1102848, 1.987885, 0, 0.1411765, 1, 1,
0.3953918, -1.355849, 1.353612, 0, 0.1372549, 1, 1,
0.3956741, 0.2114766, 0.7339247, 0, 0.1294118, 1, 1,
0.3963045, -0.3323241, 2.363479, 0, 0.1254902, 1, 1,
0.3970965, 1.362246, 0.1931477, 0, 0.1176471, 1, 1,
0.3995343, -0.2102389, 1.904642, 0, 0.1137255, 1, 1,
0.4000998, -1.251614, 3.747101, 0, 0.1058824, 1, 1,
0.4026087, -0.648506, 2.538622, 0, 0.09803922, 1, 1,
0.4052102, 1.181966, -0.1102391, 0, 0.09411765, 1, 1,
0.408439, -1.071277, 1.296468, 0, 0.08627451, 1, 1,
0.4122182, -0.3939335, 1.753108, 0, 0.08235294, 1, 1,
0.4124098, 0.4268673, 0.4372619, 0, 0.07450981, 1, 1,
0.4154231, -0.2304485, 2.173112, 0, 0.07058824, 1, 1,
0.4202016, -0.5500597, 3.75467, 0, 0.0627451, 1, 1,
0.4233308, 1.858649, 0.1833639, 0, 0.05882353, 1, 1,
0.4263034, -0.1401804, 1.245759, 0, 0.05098039, 1, 1,
0.4319831, 2.845492, -0.6172957, 0, 0.04705882, 1, 1,
0.4359641, -0.622143, 1.983758, 0, 0.03921569, 1, 1,
0.4363863, 0.7324732, -0.4481633, 0, 0.03529412, 1, 1,
0.4376611, 0.1392389, 1.126064, 0, 0.02745098, 1, 1,
0.4409454, 1.748017, 0.07645195, 0, 0.02352941, 1, 1,
0.4415695, 0.8601023, 0.127864, 0, 0.01568628, 1, 1,
0.4438354, 0.1646175, 0.9930668, 0, 0.01176471, 1, 1,
0.451077, 0.6412566, -0.2135095, 0, 0.003921569, 1, 1,
0.4524999, -0.6481549, 3.075114, 0.003921569, 0, 1, 1,
0.4568202, -0.9163977, 2.859246, 0.007843138, 0, 1, 1,
0.4577565, 0.1275337, 3.018934, 0.01568628, 0, 1, 1,
0.466208, -1.239202, 3.175971, 0.01960784, 0, 1, 1,
0.4665265, -0.1790147, 0.6505221, 0.02745098, 0, 1, 1,
0.4670546, 0.707718, -0.7706351, 0.03137255, 0, 1, 1,
0.4674104, 0.6508335, -0.421636, 0.03921569, 0, 1, 1,
0.4752004, -0.08201006, -0.05585738, 0.04313726, 0, 1, 1,
0.4754858, 1.362941, 1.462132, 0.05098039, 0, 1, 1,
0.4759312, -1.65699, 2.039317, 0.05490196, 0, 1, 1,
0.4790328, -0.1792021, 1.550368, 0.0627451, 0, 1, 1,
0.4837282, 0.02214317, 1.711563, 0.06666667, 0, 1, 1,
0.4880178, -0.02695061, 1.053111, 0.07450981, 0, 1, 1,
0.496489, -0.726377, 1.391656, 0.07843138, 0, 1, 1,
0.5002856, 0.1288993, 0.3677399, 0.08627451, 0, 1, 1,
0.5017394, 2.103476, 2.0297, 0.09019608, 0, 1, 1,
0.5022203, 0.1642663, 0.4318509, 0.09803922, 0, 1, 1,
0.5044027, -2.26231, 1.691682, 0.1058824, 0, 1, 1,
0.5091993, 0.1396111, 1.735298, 0.1098039, 0, 1, 1,
0.5097841, 2.014303, -1.82587, 0.1176471, 0, 1, 1,
0.5123624, -0.2698329, 3.310626, 0.1215686, 0, 1, 1,
0.5222803, -0.1100578, 1.918208, 0.1294118, 0, 1, 1,
0.531329, 0.03221516, 1.842697, 0.1333333, 0, 1, 1,
0.5355994, 0.3254225, -0.9718432, 0.1411765, 0, 1, 1,
0.5362089, 1.920377, -0.1443987, 0.145098, 0, 1, 1,
0.5384111, -0.4046664, 1.719594, 0.1529412, 0, 1, 1,
0.5401071, -0.4459273, 1.001974, 0.1568628, 0, 1, 1,
0.5436554, 0.4335676, 1.245688, 0.1647059, 0, 1, 1,
0.5468617, -1.068525, 5.158537, 0.1686275, 0, 1, 1,
0.5498567, 0.5838199, 1.11696, 0.1764706, 0, 1, 1,
0.5528287, 0.1774916, 2.122818, 0.1803922, 0, 1, 1,
0.5604771, -0.8154389, 4.488307, 0.1882353, 0, 1, 1,
0.5678806, 0.8601562, 2.069905, 0.1921569, 0, 1, 1,
0.5679337, -1.624457, 3.138644, 0.2, 0, 1, 1,
0.5704589, -0.7700095, 2.656931, 0.2078431, 0, 1, 1,
0.5739254, 1.013275, 0.4941337, 0.2117647, 0, 1, 1,
0.5759748, 0.4568456, 0.2218894, 0.2196078, 0, 1, 1,
0.576729, 0.1265844, 1.075165, 0.2235294, 0, 1, 1,
0.5814156, -0.6868159, 1.855903, 0.2313726, 0, 1, 1,
0.5852794, -0.3787383, 2.822718, 0.2352941, 0, 1, 1,
0.5864677, -0.112582, 3.252259, 0.2431373, 0, 1, 1,
0.5881691, 0.7393367, -0.3067494, 0.2470588, 0, 1, 1,
0.5884185, -0.0923897, 2.767927, 0.254902, 0, 1, 1,
0.5898936, -0.7436101, 1.895484, 0.2588235, 0, 1, 1,
0.5899612, 0.3354807, 0.3458333, 0.2666667, 0, 1, 1,
0.593474, -0.2696069, 2.37362, 0.2705882, 0, 1, 1,
0.5951236, 1.705155, -0.9880363, 0.2784314, 0, 1, 1,
0.5967126, -0.7482226, 2.188664, 0.282353, 0, 1, 1,
0.5984899, 3.000668, -0.2128403, 0.2901961, 0, 1, 1,
0.5997251, 0.1952888, 1.122742, 0.2941177, 0, 1, 1,
0.6025551, -0.0424246, 1.829602, 0.3019608, 0, 1, 1,
0.6097839, -0.3637679, 1.38031, 0.3098039, 0, 1, 1,
0.6101121, -1.687926, 1.242462, 0.3137255, 0, 1, 1,
0.6101516, 0.09893967, 1.869383, 0.3215686, 0, 1, 1,
0.6120596, 2.479159, -0.07871844, 0.3254902, 0, 1, 1,
0.6135151, 1.56386, 0.03246167, 0.3333333, 0, 1, 1,
0.6160863, -0.1810679, 2.493925, 0.3372549, 0, 1, 1,
0.6191481, -1.835659, 2.015792, 0.345098, 0, 1, 1,
0.6224127, 0.5431235, 0.04808458, 0.3490196, 0, 1, 1,
0.6227244, 1.119227, 1.994613, 0.3568628, 0, 1, 1,
0.6231254, 0.373496, 0.3752206, 0.3607843, 0, 1, 1,
0.6255023, 0.6530933, 0.6912859, 0.3686275, 0, 1, 1,
0.6261259, -0.09267969, 2.093788, 0.372549, 0, 1, 1,
0.6266441, -0.3481588, 2.424129, 0.3803922, 0, 1, 1,
0.6289026, -1.391698, 2.167725, 0.3843137, 0, 1, 1,
0.6294345, 1.374763, 1.263229, 0.3921569, 0, 1, 1,
0.6301768, 0.5699638, 0.607173, 0.3960784, 0, 1, 1,
0.6369898, -1.388767, 2.487345, 0.4039216, 0, 1, 1,
0.6371269, -0.2403902, 3.016861, 0.4117647, 0, 1, 1,
0.6372459, 0.8462243, 0.4371227, 0.4156863, 0, 1, 1,
0.6402404, 0.92078, -0.2725879, 0.4235294, 0, 1, 1,
0.6457165, -1.092474, 2.255607, 0.427451, 0, 1, 1,
0.6558027, 1.387717, -0.05564625, 0.4352941, 0, 1, 1,
0.6596963, -0.5902889, 2.247541, 0.4392157, 0, 1, 1,
0.660076, -0.1522632, 2.134118, 0.4470588, 0, 1, 1,
0.665325, -1.112725, 2.680076, 0.4509804, 0, 1, 1,
0.6654187, -2.244951, 1.814922, 0.4588235, 0, 1, 1,
0.6660563, 0.7160747, 1.012302, 0.4627451, 0, 1, 1,
0.6671086, -1.419372, 1.506194, 0.4705882, 0, 1, 1,
0.667465, -0.8437495, 2.090462, 0.4745098, 0, 1, 1,
0.6686944, -0.369244, 1.383995, 0.4823529, 0, 1, 1,
0.6687751, 1.550718, 0.7173447, 0.4862745, 0, 1, 1,
0.6699228, 0.4185879, 1.847161, 0.4941176, 0, 1, 1,
0.6710505, -0.6079185, 2.082662, 0.5019608, 0, 1, 1,
0.6812636, -1.266296, 3.194477, 0.5058824, 0, 1, 1,
0.6827688, 0.629141, 0.3637953, 0.5137255, 0, 1, 1,
0.6885467, 1.872466, 1.734015, 0.5176471, 0, 1, 1,
0.6944119, 0.9538936, 0.6707236, 0.5254902, 0, 1, 1,
0.6959874, -0.8834007, 3.145669, 0.5294118, 0, 1, 1,
0.6988161, 1.308617, 0.4298607, 0.5372549, 0, 1, 1,
0.7043912, 1.479041, 0.3223167, 0.5411765, 0, 1, 1,
0.7045052, 0.4577713, -0.9229858, 0.5490196, 0, 1, 1,
0.7058252, -0.2401648, 3.078594, 0.5529412, 0, 1, 1,
0.7106463, 0.03616621, 0.8827324, 0.5607843, 0, 1, 1,
0.711677, 0.3519248, 0.7061301, 0.5647059, 0, 1, 1,
0.7146946, 1.576648, 1.285098, 0.572549, 0, 1, 1,
0.7174832, -1.165365, 1.666408, 0.5764706, 0, 1, 1,
0.7188635, -1.027045, 4.737543, 0.5843138, 0, 1, 1,
0.7210971, -0.4381793, 2.181529, 0.5882353, 0, 1, 1,
0.7243696, 0.9942498, 1.277534, 0.5960785, 0, 1, 1,
0.7255307, -0.4445141, 3.161769, 0.6039216, 0, 1, 1,
0.7288091, 0.07246511, 0.4871409, 0.6078432, 0, 1, 1,
0.7297007, -0.4073423, -0.4581331, 0.6156863, 0, 1, 1,
0.7336853, -1.159363, 0.3276765, 0.6196079, 0, 1, 1,
0.7372677, -0.3439066, 2.243233, 0.627451, 0, 1, 1,
0.7436729, -0.9932418, 2.261429, 0.6313726, 0, 1, 1,
0.7463793, 0.2637594, 0.4134223, 0.6392157, 0, 1, 1,
0.7507135, 0.2496802, 1.976696, 0.6431373, 0, 1, 1,
0.7528614, -0.1892729, 3.478579, 0.6509804, 0, 1, 1,
0.7568702, -0.6923161, 1.59705, 0.654902, 0, 1, 1,
0.7600572, 2.375703, 0.8188244, 0.6627451, 0, 1, 1,
0.7628055, -0.1245015, 2.427467, 0.6666667, 0, 1, 1,
0.7632974, 0.04776248, 4.226222, 0.6745098, 0, 1, 1,
0.7656157, -1.016888, 1.699528, 0.6784314, 0, 1, 1,
0.7663417, 2.357394, 1.244046, 0.6862745, 0, 1, 1,
0.776318, -0.4652348, 2.73304, 0.6901961, 0, 1, 1,
0.7766667, -0.0228435, 0.9971373, 0.6980392, 0, 1, 1,
0.7777889, 0.4946145, 1.309895, 0.7058824, 0, 1, 1,
0.7807385, 0.722943, 0.2296717, 0.7098039, 0, 1, 1,
0.7846244, -0.5389562, 1.901913, 0.7176471, 0, 1, 1,
0.7905143, -1.457528, 2.718965, 0.7215686, 0, 1, 1,
0.7983462, -0.3391287, 1.41623, 0.7294118, 0, 1, 1,
0.8025182, 0.4815345, 0.8713948, 0.7333333, 0, 1, 1,
0.8029391, -0.07229892, 3.298891, 0.7411765, 0, 1, 1,
0.8066669, 0.1480761, 0.1834554, 0.7450981, 0, 1, 1,
0.8090541, -2.229272, 4.078418, 0.7529412, 0, 1, 1,
0.8122422, 0.5739884, 1.178776, 0.7568628, 0, 1, 1,
0.8142161, 1.117819, 1.571127, 0.7647059, 0, 1, 1,
0.8175096, 0.4356383, 2.499686, 0.7686275, 0, 1, 1,
0.8184302, 0.2057774, 1.579218, 0.7764706, 0, 1, 1,
0.8226788, -0.5356158, 1.988926, 0.7803922, 0, 1, 1,
0.8271899, -1.416025, 1.952332, 0.7882353, 0, 1, 1,
0.8337182, 0.3881655, 0.915639, 0.7921569, 0, 1, 1,
0.8342568, -2.558123, 1.605483, 0.8, 0, 1, 1,
0.8370704, -0.1410361, 0.8819134, 0.8078431, 0, 1, 1,
0.8417575, 1.357924, 1.655875, 0.8117647, 0, 1, 1,
0.8430763, -0.4362946, 1.696643, 0.8196079, 0, 1, 1,
0.8472155, 1.660207, 0.9720353, 0.8235294, 0, 1, 1,
0.854327, -0.8522792, 2.760482, 0.8313726, 0, 1, 1,
0.8545574, -1.063642, 4.274498, 0.8352941, 0, 1, 1,
0.8552151, 1.005728, 0.831838, 0.8431373, 0, 1, 1,
0.8574874, 0.122549, 2.02467, 0.8470588, 0, 1, 1,
0.872164, 2.745085, -0.6359429, 0.854902, 0, 1, 1,
0.8739513, -0.3521271, 1.547492, 0.8588235, 0, 1, 1,
0.8741935, 0.7506793, 1.885623, 0.8666667, 0, 1, 1,
0.8754864, -0.7622631, 2.523895, 0.8705882, 0, 1, 1,
0.8756208, -1.144527, 1.418317, 0.8784314, 0, 1, 1,
0.8774794, 3.202976, -1.113415, 0.8823529, 0, 1, 1,
0.8796708, -0.5687485, 0.9635442, 0.8901961, 0, 1, 1,
0.8847443, 1.36664, -0.2576903, 0.8941177, 0, 1, 1,
0.8903552, -0.1188321, 1.144739, 0.9019608, 0, 1, 1,
0.8913946, -0.5407491, 2.632731, 0.9098039, 0, 1, 1,
0.8925709, 0.04271102, 4.401647, 0.9137255, 0, 1, 1,
0.8927839, -1.31583, -0.3320316, 0.9215686, 0, 1, 1,
0.8978316, 0.6181204, 1.201264, 0.9254902, 0, 1, 1,
0.8990145, 0.340285, 1.326976, 0.9333333, 0, 1, 1,
0.8990286, -2.244892, 2.856854, 0.9372549, 0, 1, 1,
0.9004477, 0.3214694, 2.169409, 0.945098, 0, 1, 1,
0.9005181, -0.1038697, 3.263087, 0.9490196, 0, 1, 1,
0.9070725, 0.7973878, 1.118708, 0.9568627, 0, 1, 1,
0.9162898, 1.104919, 1.550068, 0.9607843, 0, 1, 1,
0.9200094, 0.2421354, -0.4738477, 0.9686275, 0, 1, 1,
0.9232006, -0.1048492, 3.809204, 0.972549, 0, 1, 1,
0.9248035, -1.846976, 1.669153, 0.9803922, 0, 1, 1,
0.9281265, 0.6206551, 0.2886097, 0.9843137, 0, 1, 1,
0.9319831, -0.00744951, 1.754503, 0.9921569, 0, 1, 1,
0.9369503, 1.090143, 1.217771, 0.9960784, 0, 1, 1,
0.9370838, 1.046704, 0.7172771, 1, 0, 0.9960784, 1,
0.948641, -0.485827, 3.216222, 1, 0, 0.9882353, 1,
0.9583975, 0.9182976, 1.192228, 1, 0, 0.9843137, 1,
0.958806, 0.4149591, 0.5359516, 1, 0, 0.9764706, 1,
0.9620938, -1.804998, 3.665243, 1, 0, 0.972549, 1,
0.9628177, 1.232284, 0.5826618, 1, 0, 0.9647059, 1,
0.9631034, -0.7692426, 0.8971338, 1, 0, 0.9607843, 1,
0.9642264, -0.05772895, 0.9577384, 1, 0, 0.9529412, 1,
0.9644659, 1.190494, 1.268365, 1, 0, 0.9490196, 1,
0.9702015, -1.930991, 3.478018, 1, 0, 0.9411765, 1,
0.9712406, 0.4946838, 1.557334, 1, 0, 0.9372549, 1,
0.9734193, 1.258791, -0.8540531, 1, 0, 0.9294118, 1,
0.9796461, 0.6669997, 2.054089, 1, 0, 0.9254902, 1,
0.9830111, 0.2033569, 0.870918, 1, 0, 0.9176471, 1,
0.9836901, -0.1996311, 4.549073, 1, 0, 0.9137255, 1,
0.9868396, -0.3660003, 1.80756, 1, 0, 0.9058824, 1,
0.989727, -1.427024, 3.791155, 1, 0, 0.9019608, 1,
0.9914123, -0.2539314, -0.2145682, 1, 0, 0.8941177, 1,
0.9928209, 0.8944699, -0.7742701, 1, 0, 0.8862745, 1,
0.9960915, -0.523355, 2.485209, 1, 0, 0.8823529, 1,
0.9977697, 0.7324241, 0.265569, 1, 0, 0.8745098, 1,
0.9992091, -1.344164, 1.500622, 1, 0, 0.8705882, 1,
1.00293, 2.107921, 0.8814981, 1, 0, 0.8627451, 1,
1.004253, 1.025003, 0.9444162, 1, 0, 0.8588235, 1,
1.004458, 0.06932352, 3.233671, 1, 0, 0.8509804, 1,
1.006247, 0.06121301, 1.588008, 1, 0, 0.8470588, 1,
1.017169, 0.7169164, 1.427219, 1, 0, 0.8392157, 1,
1.018291, 1.045171, 0.4935932, 1, 0, 0.8352941, 1,
1.03737, 1.748362, 0.570955, 1, 0, 0.827451, 1,
1.037524, 0.02391493, 1.348835, 1, 0, 0.8235294, 1,
1.045857, 1.319619, 0.6027948, 1, 0, 0.8156863, 1,
1.053046, -0.892779, 1.694589, 1, 0, 0.8117647, 1,
1.057365, -0.9667811, 2.805244, 1, 0, 0.8039216, 1,
1.072463, 0.2486785, 1.637891, 1, 0, 0.7960784, 1,
1.076534, 0.9279578, 1.009694, 1, 0, 0.7921569, 1,
1.086307, 0.8381204, 3.42871, 1, 0, 0.7843137, 1,
1.087546, 0.04842534, 0.9533211, 1, 0, 0.7803922, 1,
1.091311, 0.5942323, 0.6129785, 1, 0, 0.772549, 1,
1.091356, 0.1738283, 2.115447, 1, 0, 0.7686275, 1,
1.095987, -0.3710746, 2.213373, 1, 0, 0.7607843, 1,
1.096544, 1.017995, 0.3217951, 1, 0, 0.7568628, 1,
1.099562, 1.590412, 2.16123, 1, 0, 0.7490196, 1,
1.099946, -1.091545, 0.4961695, 1, 0, 0.7450981, 1,
1.113117, 0.7966591, 1.768872, 1, 0, 0.7372549, 1,
1.113993, 0.2829973, 4.558871, 1, 0, 0.7333333, 1,
1.115635, 0.9956396, 1.323038, 1, 0, 0.7254902, 1,
1.127924, -1.471892, 0.9783885, 1, 0, 0.7215686, 1,
1.141699, 0.3829123, 0.5713018, 1, 0, 0.7137255, 1,
1.14216, -0.7177542, 1.686859, 1, 0, 0.7098039, 1,
1.144004, -0.636941, 2.030865, 1, 0, 0.7019608, 1,
1.148235, -1.480184, 3.380881, 1, 0, 0.6941177, 1,
1.151392, 1.511401, 0.2145102, 1, 0, 0.6901961, 1,
1.154844, -1.023165, 3.583576, 1, 0, 0.682353, 1,
1.16237, -0.04276346, 2.411656, 1, 0, 0.6784314, 1,
1.162514, 0.5177066, 1.070673, 1, 0, 0.6705883, 1,
1.166752, 2.313732, 0.04244441, 1, 0, 0.6666667, 1,
1.173928, -0.0848656, 1.964776, 1, 0, 0.6588235, 1,
1.179589, -2.224467, 2.182192, 1, 0, 0.654902, 1,
1.180017, -1.581577, 3.603523, 1, 0, 0.6470588, 1,
1.18392, 0.7363687, 1.333657, 1, 0, 0.6431373, 1,
1.193499, 1.150049, 0.04080134, 1, 0, 0.6352941, 1,
1.196257, 0.08301347, 1.471647, 1, 0, 0.6313726, 1,
1.208043, 0.07412368, 0.8521364, 1, 0, 0.6235294, 1,
1.209121, 1.671776, -1.01373, 1, 0, 0.6196079, 1,
1.209758, -0.7518448, 1.829375, 1, 0, 0.6117647, 1,
1.217375, 0.9069664, -0.9022214, 1, 0, 0.6078432, 1,
1.224548, 1.369493, 1.49874, 1, 0, 0.6, 1,
1.224864, 0.959295, 1.992893, 1, 0, 0.5921569, 1,
1.234848, -0.2198552, 0.5885456, 1, 0, 0.5882353, 1,
1.245822, -0.2553367, 2.876219, 1, 0, 0.5803922, 1,
1.256071, 1.179463, 0.8521301, 1, 0, 0.5764706, 1,
1.272508, -2.102268, 2.017617, 1, 0, 0.5686275, 1,
1.277217, -0.5581549, 1.706657, 1, 0, 0.5647059, 1,
1.282132, -0.2195402, 2.377087, 1, 0, 0.5568628, 1,
1.284492, -0.05545694, 1.520607, 1, 0, 0.5529412, 1,
1.290702, 0.3953283, 1.491901, 1, 0, 0.5450981, 1,
1.300529, -1.368884, 1.200734, 1, 0, 0.5411765, 1,
1.307166, -0.3221657, 3.129667, 1, 0, 0.5333334, 1,
1.327709, -0.5352036, 1.03153, 1, 0, 0.5294118, 1,
1.337986, 0.6779999, 2.140758, 1, 0, 0.5215687, 1,
1.345712, -1.150946, 3.50818, 1, 0, 0.5176471, 1,
1.347171, -0.2460127, 2.709116, 1, 0, 0.509804, 1,
1.353096, 0.8626299, 0.9397746, 1, 0, 0.5058824, 1,
1.368882, 0.5128654, 0.9932538, 1, 0, 0.4980392, 1,
1.36913, 1.745872, -0.4343293, 1, 0, 0.4901961, 1,
1.369191, -1.292267, 1.250126, 1, 0, 0.4862745, 1,
1.384314, -0.355727, 2.47008, 1, 0, 0.4784314, 1,
1.387419, 0.4752171, 1.239479, 1, 0, 0.4745098, 1,
1.389237, -0.5865175, 0.40512, 1, 0, 0.4666667, 1,
1.39032, -0.06260992, 1.739854, 1, 0, 0.4627451, 1,
1.407654, 0.4139659, 2.510081, 1, 0, 0.454902, 1,
1.411408, 1.635018, 0.2548021, 1, 0, 0.4509804, 1,
1.442285, 0.3297044, -0.009617889, 1, 0, 0.4431373, 1,
1.444366, 0.07707331, 1.426079, 1, 0, 0.4392157, 1,
1.452013, -0.3339303, 1.77124, 1, 0, 0.4313726, 1,
1.470327, -0.0293533, 1.086274, 1, 0, 0.427451, 1,
1.471984, 0.6506622, 0.2411806, 1, 0, 0.4196078, 1,
1.47698, -0.210103, 0.8487245, 1, 0, 0.4156863, 1,
1.490748, -2.172006, 2.218117, 1, 0, 0.4078431, 1,
1.495175, -2.174247, 1.642482, 1, 0, 0.4039216, 1,
1.500526, 0.599232, 0.3855498, 1, 0, 0.3960784, 1,
1.508963, 0.6762171, 1.770206, 1, 0, 0.3882353, 1,
1.512572, -0.2297841, 0.9987832, 1, 0, 0.3843137, 1,
1.516193, 0.7430977, 0.5567852, 1, 0, 0.3764706, 1,
1.540872, 0.9170285, -0.1070694, 1, 0, 0.372549, 1,
1.543772, -1.338184, 2.61944, 1, 0, 0.3647059, 1,
1.548458, 1.24506, -0.7742441, 1, 0, 0.3607843, 1,
1.553697, -0.4155856, 2.681111, 1, 0, 0.3529412, 1,
1.554389, -0.4809822, 2.754638, 1, 0, 0.3490196, 1,
1.592162, 0.3198532, 0.212526, 1, 0, 0.3411765, 1,
1.603746, 0.1775186, -0.3619266, 1, 0, 0.3372549, 1,
1.603843, 0.03337342, 1.015785, 1, 0, 0.3294118, 1,
1.625206, 0.1261579, 0.6211264, 1, 0, 0.3254902, 1,
1.62794, -0.6008788, 3.470696, 1, 0, 0.3176471, 1,
1.628982, 1.795036, 0.7800745, 1, 0, 0.3137255, 1,
1.630829, 0.1632823, 1.080576, 1, 0, 0.3058824, 1,
1.637715, 0.2479146, 1.964998, 1, 0, 0.2980392, 1,
1.658518, -0.2363354, 0.7040507, 1, 0, 0.2941177, 1,
1.66658, 1.071638, 1.025056, 1, 0, 0.2862745, 1,
1.668103, -0.1037125, 1.524283, 1, 0, 0.282353, 1,
1.668313, 0.6116075, 2.32542, 1, 0, 0.2745098, 1,
1.669513, 0.9093745, -0.3552975, 1, 0, 0.2705882, 1,
1.673543, 0.4164562, 1.342288, 1, 0, 0.2627451, 1,
1.692406, -0.2912318, 2.194849, 1, 0, 0.2588235, 1,
1.699984, -0.2698821, 2.925792, 1, 0, 0.2509804, 1,
1.704202, 0.7173964, 2.166678, 1, 0, 0.2470588, 1,
1.714885, 1.307153, -0.4042526, 1, 0, 0.2392157, 1,
1.726683, -0.7731912, 1.164317, 1, 0, 0.2352941, 1,
1.738513, -0.2116627, 2.899858, 1, 0, 0.227451, 1,
1.749969, 0.789208, 0.5949855, 1, 0, 0.2235294, 1,
1.75529, -0.1181498, 0.7299867, 1, 0, 0.2156863, 1,
1.763449, 0.2944405, 1.560832, 1, 0, 0.2117647, 1,
1.769929, 0.7662227, 0.6380956, 1, 0, 0.2039216, 1,
1.796558, 2.459266, 0.657372, 1, 0, 0.1960784, 1,
1.802321, 0.9489066, 0.1754394, 1, 0, 0.1921569, 1,
1.807123, -1.518357, 2.447407, 1, 0, 0.1843137, 1,
1.807325, -0.8488885, 1.382733, 1, 0, 0.1803922, 1,
1.833334, -0.2451897, 1.359718, 1, 0, 0.172549, 1,
1.860179, -1.443519, 2.588645, 1, 0, 0.1686275, 1,
1.866399, -1.431055, 2.796601, 1, 0, 0.1607843, 1,
1.86842, -0.7474268, 1.450546, 1, 0, 0.1568628, 1,
1.871047, 0.3626169, 1.300516, 1, 0, 0.1490196, 1,
1.913965, -0.6915019, 1.218498, 1, 0, 0.145098, 1,
1.940884, 0.6338252, 2.531463, 1, 0, 0.1372549, 1,
1.96209, -0.6088091, 3.183285, 1, 0, 0.1333333, 1,
1.997167, -0.02762917, 1.135928, 1, 0, 0.1254902, 1,
2.036183, -0.8009452, 4.116469, 1, 0, 0.1215686, 1,
2.03663, -0.1770221, 0.7487961, 1, 0, 0.1137255, 1,
2.043267, -1.31406, 0.05983081, 1, 0, 0.1098039, 1,
2.076514, 0.4930895, 1.911724, 1, 0, 0.1019608, 1,
2.104512, 0.6129515, 1.73919, 1, 0, 0.09411765, 1,
2.106583, -0.7931011, 1.203593, 1, 0, 0.09019608, 1,
2.109648, -0.09879163, 2.243708, 1, 0, 0.08235294, 1,
2.189235, 1.182062, -1.615504, 1, 0, 0.07843138, 1,
2.213914, 0.9374345, 1.434256, 1, 0, 0.07058824, 1,
2.240641, -1.582741, 3.618087, 1, 0, 0.06666667, 1,
2.261783, -0.1081507, 2.886639, 1, 0, 0.05882353, 1,
2.278492, 0.3423658, 0.4868286, 1, 0, 0.05490196, 1,
2.39583, 1.720258, 1.939058, 1, 0, 0.04705882, 1,
2.461139, 0.03419485, 2.434102, 1, 0, 0.04313726, 1,
2.479283, -0.2117702, 1.799185, 1, 0, 0.03529412, 1,
2.620999, 1.99055, 1.534627, 1, 0, 0.03137255, 1,
2.69492, 1.812774, -1.814309, 1, 0, 0.02352941, 1,
2.715698, -0.6005455, -0.2708127, 1, 0, 0.01960784, 1,
2.808284, -0.7556093, 0.7786454, 1, 0, 0.01176471, 1,
2.892234, -1.643175, 3.261847, 1, 0, 0.007843138, 1
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
0.1293702, -4.156648, -7.616566, 0, -0.5, 0.5, 0.5,
0.1293702, -4.156648, -7.616566, 1, -0.5, 0.5, 0.5,
0.1293702, -4.156648, -7.616566, 1, 1.5, 0.5, 0.5,
0.1293702, -4.156648, -7.616566, 0, 1.5, 0.5, 0.5
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
-3.570105, 0.4394659, -7.616566, 0, -0.5, 0.5, 0.5,
-3.570105, 0.4394659, -7.616566, 1, -0.5, 0.5, 0.5,
-3.570105, 0.4394659, -7.616566, 1, 1.5, 0.5, 0.5,
-3.570105, 0.4394659, -7.616566, 0, 1.5, 0.5, 0.5
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
-3.570105, -4.156648, -0.2899368, 0, -0.5, 0.5, 0.5,
-3.570105, -4.156648, -0.2899368, 1, -0.5, 0.5, 0.5,
-3.570105, -4.156648, -0.2899368, 1, 1.5, 0.5, 0.5,
-3.570105, -4.156648, -0.2899368, 0, 1.5, 0.5, 0.5
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
-2, -3.096006, -5.925806,
2, -3.096006, -5.925806,
-2, -3.096006, -5.925806,
-2, -3.27278, -6.207599,
-1, -3.096006, -5.925806,
-1, -3.27278, -6.207599,
0, -3.096006, -5.925806,
0, -3.27278, -6.207599,
1, -3.096006, -5.925806,
1, -3.27278, -6.207599,
2, -3.096006, -5.925806,
2, -3.27278, -6.207599
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
-2, -3.626327, -6.771186, 0, -0.5, 0.5, 0.5,
-2, -3.626327, -6.771186, 1, -0.5, 0.5, 0.5,
-2, -3.626327, -6.771186, 1, 1.5, 0.5, 0.5,
-2, -3.626327, -6.771186, 0, 1.5, 0.5, 0.5,
-1, -3.626327, -6.771186, 0, -0.5, 0.5, 0.5,
-1, -3.626327, -6.771186, 1, -0.5, 0.5, 0.5,
-1, -3.626327, -6.771186, 1, 1.5, 0.5, 0.5,
-1, -3.626327, -6.771186, 0, 1.5, 0.5, 0.5,
0, -3.626327, -6.771186, 0, -0.5, 0.5, 0.5,
0, -3.626327, -6.771186, 1, -0.5, 0.5, 0.5,
0, -3.626327, -6.771186, 1, 1.5, 0.5, 0.5,
0, -3.626327, -6.771186, 0, 1.5, 0.5, 0.5,
1, -3.626327, -6.771186, 0, -0.5, 0.5, 0.5,
1, -3.626327, -6.771186, 1, -0.5, 0.5, 0.5,
1, -3.626327, -6.771186, 1, 1.5, 0.5, 0.5,
1, -3.626327, -6.771186, 0, 1.5, 0.5, 0.5,
2, -3.626327, -6.771186, 0, -0.5, 0.5, 0.5,
2, -3.626327, -6.771186, 1, -0.5, 0.5, 0.5,
2, -3.626327, -6.771186, 1, 1.5, 0.5, 0.5,
2, -3.626327, -6.771186, 0, 1.5, 0.5, 0.5
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
-2.71638, -2, -5.925806,
-2.71638, 3, -5.925806,
-2.71638, -2, -5.925806,
-2.858667, -2, -6.207599,
-2.71638, -1, -5.925806,
-2.858667, -1, -6.207599,
-2.71638, 0, -5.925806,
-2.858667, 0, -6.207599,
-2.71638, 1, -5.925806,
-2.858667, 1, -6.207599,
-2.71638, 2, -5.925806,
-2.858667, 2, -6.207599,
-2.71638, 3, -5.925806,
-2.858667, 3, -6.207599
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
-3.143242, -2, -6.771186, 0, -0.5, 0.5, 0.5,
-3.143242, -2, -6.771186, 1, -0.5, 0.5, 0.5,
-3.143242, -2, -6.771186, 1, 1.5, 0.5, 0.5,
-3.143242, -2, -6.771186, 0, 1.5, 0.5, 0.5,
-3.143242, -1, -6.771186, 0, -0.5, 0.5, 0.5,
-3.143242, -1, -6.771186, 1, -0.5, 0.5, 0.5,
-3.143242, -1, -6.771186, 1, 1.5, 0.5, 0.5,
-3.143242, -1, -6.771186, 0, 1.5, 0.5, 0.5,
-3.143242, 0, -6.771186, 0, -0.5, 0.5, 0.5,
-3.143242, 0, -6.771186, 1, -0.5, 0.5, 0.5,
-3.143242, 0, -6.771186, 1, 1.5, 0.5, 0.5,
-3.143242, 0, -6.771186, 0, 1.5, 0.5, 0.5,
-3.143242, 1, -6.771186, 0, -0.5, 0.5, 0.5,
-3.143242, 1, -6.771186, 1, -0.5, 0.5, 0.5,
-3.143242, 1, -6.771186, 1, 1.5, 0.5, 0.5,
-3.143242, 1, -6.771186, 0, 1.5, 0.5, 0.5,
-3.143242, 2, -6.771186, 0, -0.5, 0.5, 0.5,
-3.143242, 2, -6.771186, 1, -0.5, 0.5, 0.5,
-3.143242, 2, -6.771186, 1, 1.5, 0.5, 0.5,
-3.143242, 2, -6.771186, 0, 1.5, 0.5, 0.5,
-3.143242, 3, -6.771186, 0, -0.5, 0.5, 0.5,
-3.143242, 3, -6.771186, 1, -0.5, 0.5, 0.5,
-3.143242, 3, -6.771186, 1, 1.5, 0.5, 0.5,
-3.143242, 3, -6.771186, 0, 1.5, 0.5, 0.5
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
-2.71638, -3.096006, -4,
-2.71638, -3.096006, 4,
-2.71638, -3.096006, -4,
-2.858667, -3.27278, -4,
-2.71638, -3.096006, -2,
-2.858667, -3.27278, -2,
-2.71638, -3.096006, 0,
-2.858667, -3.27278, 0,
-2.71638, -3.096006, 2,
-2.858667, -3.27278, 2,
-2.71638, -3.096006, 4,
-2.858667, -3.27278, 4
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
-3.143242, -3.626327, -4, 0, -0.5, 0.5, 0.5,
-3.143242, -3.626327, -4, 1, -0.5, 0.5, 0.5,
-3.143242, -3.626327, -4, 1, 1.5, 0.5, 0.5,
-3.143242, -3.626327, -4, 0, 1.5, 0.5, 0.5,
-3.143242, -3.626327, -2, 0, -0.5, 0.5, 0.5,
-3.143242, -3.626327, -2, 1, -0.5, 0.5, 0.5,
-3.143242, -3.626327, -2, 1, 1.5, 0.5, 0.5,
-3.143242, -3.626327, -2, 0, 1.5, 0.5, 0.5,
-3.143242, -3.626327, 0, 0, -0.5, 0.5, 0.5,
-3.143242, -3.626327, 0, 1, -0.5, 0.5, 0.5,
-3.143242, -3.626327, 0, 1, 1.5, 0.5, 0.5,
-3.143242, -3.626327, 0, 0, 1.5, 0.5, 0.5,
-3.143242, -3.626327, 2, 0, -0.5, 0.5, 0.5,
-3.143242, -3.626327, 2, 1, -0.5, 0.5, 0.5,
-3.143242, -3.626327, 2, 1, 1.5, 0.5, 0.5,
-3.143242, -3.626327, 2, 0, 1.5, 0.5, 0.5,
-3.143242, -3.626327, 4, 0, -0.5, 0.5, 0.5,
-3.143242, -3.626327, 4, 1, -0.5, 0.5, 0.5,
-3.143242, -3.626327, 4, 1, 1.5, 0.5, 0.5,
-3.143242, -3.626327, 4, 0, 1.5, 0.5, 0.5
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
-2.71638, -3.096006, -5.925806,
-2.71638, 3.974938, -5.925806,
-2.71638, -3.096006, 5.345932,
-2.71638, 3.974938, 5.345932,
-2.71638, -3.096006, -5.925806,
-2.71638, -3.096006, 5.345932,
-2.71638, 3.974938, -5.925806,
-2.71638, 3.974938, 5.345932,
-2.71638, -3.096006, -5.925806,
2.97512, -3.096006, -5.925806,
-2.71638, -3.096006, 5.345932,
2.97512, -3.096006, 5.345932,
-2.71638, 3.974938, -5.925806,
2.97512, 3.974938, -5.925806,
-2.71638, 3.974938, 5.345932,
2.97512, 3.974938, 5.345932,
2.97512, -3.096006, -5.925806,
2.97512, 3.974938, -5.925806,
2.97512, -3.096006, 5.345932,
2.97512, 3.974938, 5.345932,
2.97512, -3.096006, -5.925806,
2.97512, -3.096006, 5.345932,
2.97512, 3.974938, -5.925806,
2.97512, 3.974938, 5.345932
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
var radius = 7.727854;
var distance = 34.3821;
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
mvMatrix.translate( -0.1293702, -0.4394659, 0.2899368 );
mvMatrix.scale( 1.468068, 1.181668, 0.7412794 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.3821);
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
Propyne<-read.table("Propyne.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Propyne$V2
```

```
## Error in eval(expr, envir, enclos): object 'Propyne' not found
```

```r
y<-Propyne$V3
```

```
## Error in eval(expr, envir, enclos): object 'Propyne' not found
```

```r
z<-Propyne$V4
```

```
## Error in eval(expr, envir, enclos): object 'Propyne' not found
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
-2.633494, -0.4721914, -2.748994, 0, 0, 1, 1, 1,
-2.469868, 0.861758, -0.4590836, 1, 0, 0, 1, 1,
-2.45646, -1.788238, -1.216738, 1, 0, 0, 1, 1,
-2.438518, 0.6497592, -0.5818426, 1, 0, 0, 1, 1,
-2.367955, -0.4380918, -2.952564, 1, 0, 0, 1, 1,
-2.344609, 0.5166308, -1.210505, 1, 0, 0, 1, 1,
-2.321141, -0.4225206, -3.501661, 0, 0, 0, 1, 1,
-2.292387, -1.032269, -1.22928, 0, 0, 0, 1, 1,
-2.252125, -0.5459095, -2.114816, 0, 0, 0, 1, 1,
-2.237049, 0.1894148, -0.1891683, 0, 0, 0, 1, 1,
-2.22834, -0.8084934, -2.786253, 0, 0, 0, 1, 1,
-2.220383, 0.5126631, -1.149358, 0, 0, 0, 1, 1,
-2.21056, -0.9376818, -1.228486, 0, 0, 0, 1, 1,
-2.081209, -1.271632, -3.456704, 1, 1, 1, 1, 1,
-2.060592, 1.324468, -1.638507, 1, 1, 1, 1, 1,
-2.056521, 0.7084797, -0.2300772, 1, 1, 1, 1, 1,
-2.041618, 0.2333228, -2.604988, 1, 1, 1, 1, 1,
-2.023848, 0.6843928, -1.015251, 1, 1, 1, 1, 1,
-2.013693, -0.9915609, -2.364774, 1, 1, 1, 1, 1,
-1.963965, -1.310787, -2.221536, 1, 1, 1, 1, 1,
-1.93598, 1.084708, -1.27982, 1, 1, 1, 1, 1,
-1.907586, -1.394199, -1.710132, 1, 1, 1, 1, 1,
-1.899379, 0.6520444, -2.738845, 1, 1, 1, 1, 1,
-1.88523, -0.5011508, -1.776879, 1, 1, 1, 1, 1,
-1.87531, 1.255747, 1.941122, 1, 1, 1, 1, 1,
-1.843922, 1.150131, -1.497036, 1, 1, 1, 1, 1,
-1.833971, -0.2162841, -0.7049611, 1, 1, 1, 1, 1,
-1.811063, -0.8986151, -1.70698, 1, 1, 1, 1, 1,
-1.786423, 0.7147214, -1.17518, 0, 0, 1, 1, 1,
-1.774956, 0.5073072, -1.975112, 1, 0, 0, 1, 1,
-1.774722, 1.876333, -0.9331244, 1, 0, 0, 1, 1,
-1.76102, -0.5600034, -1.005132, 1, 0, 0, 1, 1,
-1.748394, -1.721385, -0.7425124, 1, 0, 0, 1, 1,
-1.722178, 0.2304996, -1.815729, 1, 0, 0, 1, 1,
-1.718605, 1.676315, -0.6520981, 0, 0, 0, 1, 1,
-1.718521, -0.7736008, -1.865734, 0, 0, 0, 1, 1,
-1.713077, -0.2169902, -1.549039, 0, 0, 0, 1, 1,
-1.712482, -0.7076582, -2.103267, 0, 0, 0, 1, 1,
-1.699959, 1.088966, -1.9745, 0, 0, 0, 1, 1,
-1.686062, -1.864033, -4.278821, 0, 0, 0, 1, 1,
-1.657716, 0.8591536, 0.1639108, 0, 0, 0, 1, 1,
-1.646073, -0.2810621, -3.141861, 1, 1, 1, 1, 1,
-1.629322, 0.05706903, -1.078657, 1, 1, 1, 1, 1,
-1.622525, -0.1902052, -1.952038, 1, 1, 1, 1, 1,
-1.617718, -0.6303594, -2.853759, 1, 1, 1, 1, 1,
-1.609873, -0.9880751, -2.771185, 1, 1, 1, 1, 1,
-1.609487, -0.2139339, -0.8394296, 1, 1, 1, 1, 1,
-1.607803, -0.17844, -1.844844, 1, 1, 1, 1, 1,
-1.597888, -1.819977, -3.211274, 1, 1, 1, 1, 1,
-1.59519, -0.03903709, -2.229834, 1, 1, 1, 1, 1,
-1.593693, 2.212144, -1.563862, 1, 1, 1, 1, 1,
-1.583647, -0.5941572, 0.8278598, 1, 1, 1, 1, 1,
-1.572535, 1.311389, -0.3296164, 1, 1, 1, 1, 1,
-1.565869, -0.4907683, -1.724463, 1, 1, 1, 1, 1,
-1.560159, 1.905969, -0.2021965, 1, 1, 1, 1, 1,
-1.555856, 0.8543627, -1.723138, 1, 1, 1, 1, 1,
-1.553449, 0.2187846, -1.515605, 0, 0, 1, 1, 1,
-1.509112, 1.718098, -1.355931, 1, 0, 0, 1, 1,
-1.492939, -1.332596, 0.04448273, 1, 0, 0, 1, 1,
-1.490666, -0.09386599, -3.490522, 1, 0, 0, 1, 1,
-1.481774, 1.820276, 0.8188377, 1, 0, 0, 1, 1,
-1.477325, 0.4806072, -2.613989, 1, 0, 0, 1, 1,
-1.458941, 0.3142727, -1.709335, 0, 0, 0, 1, 1,
-1.450042, -0.4392765, -1.87374, 0, 0, 0, 1, 1,
-1.446152, 1.908099, 0.8303334, 0, 0, 0, 1, 1,
-1.440433, 2.486634, 1.809087, 0, 0, 0, 1, 1,
-1.411918, 0.0147452, -0.755932, 0, 0, 0, 1, 1,
-1.4113, -0.6837689, -2.60338, 0, 0, 0, 1, 1,
-1.40725, 0.9014474, -0.9677961, 0, 0, 0, 1, 1,
-1.397071, -0.8823926, -4.587892, 1, 1, 1, 1, 1,
-1.396441, -0.6791134, -1.895188, 1, 1, 1, 1, 1,
-1.383692, 0.1427471, 0.01249083, 1, 1, 1, 1, 1,
-1.378931, -1.601593, -2.194808, 1, 1, 1, 1, 1,
-1.377631, 0.3747812, -0.3850884, 1, 1, 1, 1, 1,
-1.372828, -1.963256, -2.395243, 1, 1, 1, 1, 1,
-1.35769, -0.5210748, -1.597382, 1, 1, 1, 1, 1,
-1.351056, 1.831353, -0.08938622, 1, 1, 1, 1, 1,
-1.342205, 0.4884681, -0.9573812, 1, 1, 1, 1, 1,
-1.331461, 0.0943862, -3.638689, 1, 1, 1, 1, 1,
-1.32717, -1.088038, -3.119511, 1, 1, 1, 1, 1,
-1.322805, 1.415322, 0.4390051, 1, 1, 1, 1, 1,
-1.320208, 0.8755227, -1.146643, 1, 1, 1, 1, 1,
-1.316516, -0.61703, -0.688077, 1, 1, 1, 1, 1,
-1.316326, -1.017467, -2.379246, 1, 1, 1, 1, 1,
-1.310152, -0.7572297, -1.820114, 0, 0, 1, 1, 1,
-1.299839, -1.438585, -2.426435, 1, 0, 0, 1, 1,
-1.297206, 0.1612606, -1.382947, 1, 0, 0, 1, 1,
-1.290556, 0.2853781, -2.463538, 1, 0, 0, 1, 1,
-1.271277, -2.993032, -1.959754, 1, 0, 0, 1, 1,
-1.270533, -0.09050976, -2.14058, 1, 0, 0, 1, 1,
-1.264783, -2.222171, -2.089468, 0, 0, 0, 1, 1,
-1.263014, 0.811057, -1.297215, 0, 0, 0, 1, 1,
-1.255877, 2.021811, -0.9807223, 0, 0, 0, 1, 1,
-1.24781, 0.3458568, -2.045662, 0, 0, 0, 1, 1,
-1.226112, -1.440348, -2.326788, 0, 0, 0, 1, 1,
-1.213582, 0.8666191, -0.3892476, 0, 0, 0, 1, 1,
-1.213512, 0.0828494, -1.99841, 0, 0, 0, 1, 1,
-1.206332, 0.4208435, -1.760153, 1, 1, 1, 1, 1,
-1.201901, -1.52311, -2.899643, 1, 1, 1, 1, 1,
-1.198915, 3.162275, -0.847515, 1, 1, 1, 1, 1,
-1.198222, -1.267284, -2.397732, 1, 1, 1, 1, 1,
-1.193165, -1.117343, -2.021516, 1, 1, 1, 1, 1,
-1.183561, -0.5701001, -0.2980582, 1, 1, 1, 1, 1,
-1.178849, 2.168529, 0.8587422, 1, 1, 1, 1, 1,
-1.17554, -1.123474, -2.834015, 1, 1, 1, 1, 1,
-1.162157, -0.7018196, -3.030433, 1, 1, 1, 1, 1,
-1.135921, -0.6031451, -1.897554, 1, 1, 1, 1, 1,
-1.134147, -0.6543238, -1.212716, 1, 1, 1, 1, 1,
-1.132607, -0.5713134, -2.583894, 1, 1, 1, 1, 1,
-1.129999, -1.347808, -1.263271, 1, 1, 1, 1, 1,
-1.127901, -0.8446029, -2.689612, 1, 1, 1, 1, 1,
-1.127545, -0.4436411, -3.053932, 1, 1, 1, 1, 1,
-1.110664, -1.457858, -2.627328, 0, 0, 1, 1, 1,
-1.108587, 0.4317122, -0.855113, 1, 0, 0, 1, 1,
-1.104657, -1.415781, -2.044223, 1, 0, 0, 1, 1,
-1.099149, 0.2052174, -0.9016695, 1, 0, 0, 1, 1,
-1.087391, 0.5434787, -0.9006207, 1, 0, 0, 1, 1,
-1.082919, -0.5997488, -1.059524, 1, 0, 0, 1, 1,
-1.074651, -1.331329, -2.737472, 0, 0, 0, 1, 1,
-1.074534, 1.300048, 0.6507792, 0, 0, 0, 1, 1,
-1.071448, 0.9976269, -1.307791, 0, 0, 0, 1, 1,
-1.056152, -0.7292894, -1.533909, 0, 0, 0, 1, 1,
-1.05511, 0.1467101, 1.296441, 0, 0, 0, 1, 1,
-1.053666, -1.596965, -2.653243, 0, 0, 0, 1, 1,
-1.051888, -1.969294, -2.432235, 0, 0, 0, 1, 1,
-1.04832, 0.8050271, -0.3674942, 1, 1, 1, 1, 1,
-1.045826, -0.7533536, -2.86731, 1, 1, 1, 1, 1,
-1.044541, -0.1435234, -0.3681925, 1, 1, 1, 1, 1,
-1.040104, -0.6101419, -1.243822, 1, 1, 1, 1, 1,
-1.023518, 0.4727598, -0.9123368, 1, 1, 1, 1, 1,
-1.022399, 0.257638, -1.335395, 1, 1, 1, 1, 1,
-1.021446, -0.5804728, -3.444416, 1, 1, 1, 1, 1,
-1.018076, 0.2830433, -0.4446022, 1, 1, 1, 1, 1,
-1.017638, -0.2328845, -2.189257, 1, 1, 1, 1, 1,
-1.014698, 0.03258771, -1.897202, 1, 1, 1, 1, 1,
-1.011006, 0.3761692, 0.3204958, 1, 1, 1, 1, 1,
-1.009701, 1.329825, -3.30373, 1, 1, 1, 1, 1,
-1.004419, -0.9466669, -0.6461376, 1, 1, 1, 1, 1,
-0.9997544, -0.6080416, -3.326194, 1, 1, 1, 1, 1,
-0.9955166, -1.719705, -1.710109, 1, 1, 1, 1, 1,
-0.9947062, -0.3270906, -2.141287, 0, 0, 1, 1, 1,
-0.9943619, -0.4985199, -2.760784, 1, 0, 0, 1, 1,
-0.9887506, -0.7777588, -3.235376, 1, 0, 0, 1, 1,
-0.9825476, 0.5154312, -0.2836049, 1, 0, 0, 1, 1,
-0.9792622, -0.7240893, -1.779987, 1, 0, 0, 1, 1,
-0.973281, -0.7258006, -2.865861, 1, 0, 0, 1, 1,
-0.9717038, -1.131946, -1.892302, 0, 0, 0, 1, 1,
-0.9649708, 0.02873462, -1.41437, 0, 0, 0, 1, 1,
-0.9635801, -0.3990453, -2.098106, 0, 0, 0, 1, 1,
-0.9598764, -0.6468244, -2.302113, 0, 0, 0, 1, 1,
-0.958036, -0.2860156, -1.584238, 0, 0, 0, 1, 1,
-0.9543048, 1.339043, -1.731333, 0, 0, 0, 1, 1,
-0.9542934, 1.241556, -0.9388863, 0, 0, 0, 1, 1,
-0.9494028, 1.306745, 0.9725558, 1, 1, 1, 1, 1,
-0.9487652, -1.729289, -2.190521, 1, 1, 1, 1, 1,
-0.9452678, -0.1598511, -1.262626, 1, 1, 1, 1, 1,
-0.9417233, 0.2494581, -1.665383, 1, 1, 1, 1, 1,
-0.9377502, -0.6785294, -1.245407, 1, 1, 1, 1, 1,
-0.9337562, -1.126531, -3.327307, 1, 1, 1, 1, 1,
-0.9244402, 0.2154884, -1.722848, 1, 1, 1, 1, 1,
-0.9216676, 0.1566592, -1.17138, 1, 1, 1, 1, 1,
-0.9182345, 0.2984128, -2.685332, 1, 1, 1, 1, 1,
-0.9155453, 0.6061996, 0.4481209, 1, 1, 1, 1, 1,
-0.9150417, 1.666808, -0.0520085, 1, 1, 1, 1, 1,
-0.9082416, -0.3642627, -1.724877, 1, 1, 1, 1, 1,
-0.9061384, 0.7530094, -0.3433493, 1, 1, 1, 1, 1,
-0.8972197, -0.7054843, -1.46223, 1, 1, 1, 1, 1,
-0.8967608, -0.7822708, -1.621181, 1, 1, 1, 1, 1,
-0.8914652, -0.3305163, -2.551761, 0, 0, 1, 1, 1,
-0.8910831, -0.8502318, -0.9430038, 1, 0, 0, 1, 1,
-0.8851014, -0.2522156, -0.4110715, 1, 0, 0, 1, 1,
-0.87603, -0.3575012, -1.907154, 1, 0, 0, 1, 1,
-0.8729949, 2.052134, -0.7416962, 1, 0, 0, 1, 1,
-0.8727577, -0.6442491, -2.092505, 1, 0, 0, 1, 1,
-0.861809, 0.4900756, -0.5104926, 0, 0, 0, 1, 1,
-0.8608632, -1.583326, -2.232161, 0, 0, 0, 1, 1,
-0.8606629, 0.4661658, -0.8980052, 0, 0, 0, 1, 1,
-0.8571051, 0.4465875, -0.1328983, 0, 0, 0, 1, 1,
-0.8566043, -1.327485, -4.088362, 0, 0, 0, 1, 1,
-0.8496143, 1.887445, 0.3326402, 0, 0, 0, 1, 1,
-0.8400482, -0.1617753, -2.634541, 0, 0, 0, 1, 1,
-0.8381197, -1.198904, -2.654049, 1, 1, 1, 1, 1,
-0.8377942, -0.3720865, -3.507235, 1, 1, 1, 1, 1,
-0.8345375, -0.577717, -1.228865, 1, 1, 1, 1, 1,
-0.8339183, -1.729204, -2.759892, 1, 1, 1, 1, 1,
-0.8298554, -0.4058161, -3.071537, 1, 1, 1, 1, 1,
-0.8194805, 0.5258672, -0.2752937, 1, 1, 1, 1, 1,
-0.8161909, 0.1852634, -1.07716, 1, 1, 1, 1, 1,
-0.8153352, 0.01983339, -0.9489649, 1, 1, 1, 1, 1,
-0.8109576, 1.9853, 1.500545, 1, 1, 1, 1, 1,
-0.8078222, 0.5044046, -0.672709, 1, 1, 1, 1, 1,
-0.8063426, -0.09415753, -2.754372, 1, 1, 1, 1, 1,
-0.8053746, 3.422606, -1.158804, 1, 1, 1, 1, 1,
-0.8053683, -0.02567343, -1.103303, 1, 1, 1, 1, 1,
-0.8031592, -1.065383, -1.820951, 1, 1, 1, 1, 1,
-0.7956766, 0.6464775, -1.549422, 1, 1, 1, 1, 1,
-0.7951646, 0.4349436, -0.9576159, 0, 0, 1, 1, 1,
-0.7878633, 0.07074367, -1.410475, 1, 0, 0, 1, 1,
-0.7876335, -1.049912, -3.195496, 1, 0, 0, 1, 1,
-0.7859371, -1.283959, -0.08714143, 1, 0, 0, 1, 1,
-0.7822505, -0.04063533, -0.896059, 1, 0, 0, 1, 1,
-0.7778204, 0.1085055, -1.618995, 1, 0, 0, 1, 1,
-0.7754655, -0.4504222, -0.5817281, 0, 0, 0, 1, 1,
-0.7749522, 0.7577279, -1.039856, 0, 0, 0, 1, 1,
-0.7747555, -1.193163, -3.960957, 0, 0, 0, 1, 1,
-0.7747064, 1.327637, -1.251893, 0, 0, 0, 1, 1,
-0.7732179, -0.09182835, -1.455803, 0, 0, 0, 1, 1,
-0.7691834, -2.065683, -1.822528, 0, 0, 0, 1, 1,
-0.7671526, -0.6428074, -3.159854, 0, 0, 0, 1, 1,
-0.75877, -0.4176414, -1.112149, 1, 1, 1, 1, 1,
-0.7549427, -1.111882, -2.805055, 1, 1, 1, 1, 1,
-0.7502358, 1.568803, -0.8849682, 1, 1, 1, 1, 1,
-0.7501125, 1.180112, -0.7449376, 1, 1, 1, 1, 1,
-0.7499734, -0.02687041, 0.2277546, 1, 1, 1, 1, 1,
-0.7439191, 0.7287359, 0.9613293, 1, 1, 1, 1, 1,
-0.7401274, 0.2791313, -2.861936, 1, 1, 1, 1, 1,
-0.7396683, -0.3328035, -2.085048, 1, 1, 1, 1, 1,
-0.7389953, -0.6581119, -3.608855, 1, 1, 1, 1, 1,
-0.7374517, -0.3835839, -2.046563, 1, 1, 1, 1, 1,
-0.7310655, 0.07441226, -1.843289, 1, 1, 1, 1, 1,
-0.7308108, -1.293056, -1.283368, 1, 1, 1, 1, 1,
-0.718685, -0.6821686, -2.672403, 1, 1, 1, 1, 1,
-0.7106708, -0.7928422, -2.26323, 1, 1, 1, 1, 1,
-0.7069051, 1.445868, -0.6980166, 1, 1, 1, 1, 1,
-0.703828, 1.706189, 0.7248174, 0, 0, 1, 1, 1,
-0.7025684, 0.5045103, -1.8769, 1, 0, 0, 1, 1,
-0.70029, -1.090502, -1.983243, 1, 0, 0, 1, 1,
-0.6977929, -1.300538, -3.768875, 1, 0, 0, 1, 1,
-0.6974819, -0.8233333, -2.537877, 1, 0, 0, 1, 1,
-0.6916793, 0.9012072, 0.1420617, 1, 0, 0, 1, 1,
-0.6826993, -0.2018877, -1.817908, 0, 0, 0, 1, 1,
-0.6800695, -0.1589046, 0.6978045, 0, 0, 0, 1, 1,
-0.6779404, -0.2942505, -2.663527, 0, 0, 0, 1, 1,
-0.675765, 1.318469, -0.7392209, 0, 0, 0, 1, 1,
-0.6751925, 0.4539909, -2.734575, 0, 0, 0, 1, 1,
-0.6724663, 1.291554, 0.3378454, 0, 0, 0, 1, 1,
-0.6723585, -0.8565499, -1.956472, 0, 0, 0, 1, 1,
-0.669754, 0.0975522, -2.8056, 1, 1, 1, 1, 1,
-0.6694544, -0.5587347, -2.901822, 1, 1, 1, 1, 1,
-0.6673523, 0.2520381, -0.6040278, 1, 1, 1, 1, 1,
-0.6614426, 2.462862, 1.725979, 1, 1, 1, 1, 1,
-0.6554866, 0.142148, -1.88446, 1, 1, 1, 1, 1,
-0.6518312, 1.975524, 0.04999918, 1, 1, 1, 1, 1,
-0.6507873, 1.551432, -1.700741, 1, 1, 1, 1, 1,
-0.6469826, 1.409554, -1.256328, 1, 1, 1, 1, 1,
-0.6464, -1.952546, -3.315669, 1, 1, 1, 1, 1,
-0.6461505, -0.0825756, -0.4804411, 1, 1, 1, 1, 1,
-0.6454094, 0.416233, -1.777477, 1, 1, 1, 1, 1,
-0.6415503, 0.4787025, -2.792869, 1, 1, 1, 1, 1,
-0.6401459, 0.5862155, -1.165326, 1, 1, 1, 1, 1,
-0.6381215, 0.3767398, -0.2163315, 1, 1, 1, 1, 1,
-0.6346748, -0.6266493, -0.3874898, 1, 1, 1, 1, 1,
-0.615771, -1.222929, -3.340108, 0, 0, 1, 1, 1,
-0.6120405, -1.024663, -2.574687, 1, 0, 0, 1, 1,
-0.6078759, -0.01745483, -2.227796, 1, 0, 0, 1, 1,
-0.6073186, 0.3341538, -1.697494, 1, 0, 0, 1, 1,
-0.6045957, 1.066501, -0.309047, 1, 0, 0, 1, 1,
-0.5990624, -0.6851144, -2.248538, 1, 0, 0, 1, 1,
-0.5953844, -0.05104624, -0.7419411, 0, 0, 0, 1, 1,
-0.5941674, 0.9797559, -1.289834, 0, 0, 0, 1, 1,
-0.5939037, -1.726816, -2.649026, 0, 0, 0, 1, 1,
-0.5907012, 0.3031458, -1.192425, 0, 0, 0, 1, 1,
-0.5871895, -0.6153047, -2.041471, 0, 0, 0, 1, 1,
-0.5746923, -0.6015285, -1.171872, 0, 0, 0, 1, 1,
-0.5727316, 0.6843164, -0.6263053, 0, 0, 0, 1, 1,
-0.5718971, -0.5752652, -1.663723, 1, 1, 1, 1, 1,
-0.5712914, 0.6261277, -1.627264, 1, 1, 1, 1, 1,
-0.5676963, -1.49872, -0.5303295, 1, 1, 1, 1, 1,
-0.5644161, -0.8013769, -2.874818, 1, 1, 1, 1, 1,
-0.5539011, 0.7462933, -0.003669646, 1, 1, 1, 1, 1,
-0.5480829, 0.3241409, -2.871492, 1, 1, 1, 1, 1,
-0.5480767, -1.495797, -2.660054, 1, 1, 1, 1, 1,
-0.5477947, -0.8197112, -1.837286, 1, 1, 1, 1, 1,
-0.5465032, -0.9744551, -4.033487, 1, 1, 1, 1, 1,
-0.5460212, -0.04010959, -4.313998, 1, 1, 1, 1, 1,
-0.5443884, -0.6738532, -4.154676, 1, 1, 1, 1, 1,
-0.5437449, -0.7416506, -1.500689, 1, 1, 1, 1, 1,
-0.5426573, -1.483957, -3.736872, 1, 1, 1, 1, 1,
-0.5304592, -0.3851027, -1.800473, 1, 1, 1, 1, 1,
-0.5297004, -0.4433721, -1.300444, 1, 1, 1, 1, 1,
-0.5281243, -1.048967, -1.248496, 0, 0, 1, 1, 1,
-0.5271663, -0.3183765, -1.304731, 1, 0, 0, 1, 1,
-0.525738, -0.414436, -2.109302, 1, 0, 0, 1, 1,
-0.5230935, 0.118884, -2.048, 1, 0, 0, 1, 1,
-0.5219887, 1.552962, -0.3338502, 1, 0, 0, 1, 1,
-0.5182264, 0.6588094, -0.2920443, 1, 0, 0, 1, 1,
-0.5155349, 0.610072, 0.06934364, 0, 0, 0, 1, 1,
-0.5112326, -0.9220889, -3.711949, 0, 0, 0, 1, 1,
-0.5066064, -0.8148923, -2.042351, 0, 0, 0, 1, 1,
-0.5047851, 0.8393906, 1.647297, 0, 0, 0, 1, 1,
-0.5026078, -1.89263, -3.928863, 0, 0, 0, 1, 1,
-0.5005878, 0.6804107, -0.5690297, 0, 0, 0, 1, 1,
-0.5003823, -1.224739, -1.178627, 0, 0, 0, 1, 1,
-0.4964253, 0.5506489, -0.01028553, 1, 1, 1, 1, 1,
-0.4930006, 0.8130723, -1.127236, 1, 1, 1, 1, 1,
-0.4874534, -0.4335229, -3.515148, 1, 1, 1, 1, 1,
-0.4793179, 1.012078, -2.312136, 1, 1, 1, 1, 1,
-0.4789105, 1.450078, -0.6467842, 1, 1, 1, 1, 1,
-0.4771225, 1.116648, -0.6382362, 1, 1, 1, 1, 1,
-0.4739963, 0.6570892, -0.9352447, 1, 1, 1, 1, 1,
-0.4709421, 2.20869, 1.433956, 1, 1, 1, 1, 1,
-0.4649007, -1.522295, -2.38948, 1, 1, 1, 1, 1,
-0.4641644, 0.843392, 0.2890972, 1, 1, 1, 1, 1,
-0.4628662, 1.19114, -1.623102, 1, 1, 1, 1, 1,
-0.4616579, -1.106307, -3.899698, 1, 1, 1, 1, 1,
-0.4550146, -1.115273, -2.592204, 1, 1, 1, 1, 1,
-0.453741, 0.555268, -1.294464, 1, 1, 1, 1, 1,
-0.4522131, -0.8543478, -2.829438, 1, 1, 1, 1, 1,
-0.4503421, 0.5605937, -1.620064, 0, 0, 1, 1, 1,
-0.4448083, -2.1999, -4.028036, 1, 0, 0, 1, 1,
-0.4420529, -0.5596825, -3.722422, 1, 0, 0, 1, 1,
-0.438647, -0.522092, -0.6878592, 1, 0, 0, 1, 1,
-0.4379683, 0.2008203, -0.7280881, 1, 0, 0, 1, 1,
-0.432745, -0.07211787, -0.6751774, 1, 0, 0, 1, 1,
-0.4314539, 0.1088379, -2.177351, 0, 0, 0, 1, 1,
-0.427083, 0.9291234, -1.068916, 0, 0, 0, 1, 1,
-0.4246481, 0.04207552, -0.7064304, 0, 0, 0, 1, 1,
-0.4203523, -0.495386, -3.753407, 0, 0, 0, 1, 1,
-0.419153, 0.1213704, -0.3415069, 0, 0, 0, 1, 1,
-0.4170757, 0.1095596, -2.405169, 0, 0, 0, 1, 1,
-0.4159903, 0.3007824, -2.505237, 0, 0, 0, 1, 1,
-0.4152467, 1.699601, -0.5296224, 1, 1, 1, 1, 1,
-0.4120966, -0.8177805, -3.676619, 1, 1, 1, 1, 1,
-0.4099921, 1.076098, -0.5463594, 1, 1, 1, 1, 1,
-0.4076431, -1.311417, -3.448864, 1, 1, 1, 1, 1,
-0.403479, -1.138775, -3.101343, 1, 1, 1, 1, 1,
-0.3987528, -0.8668297, -2.253159, 1, 1, 1, 1, 1,
-0.3985925, 1.395841, -2.212727, 1, 1, 1, 1, 1,
-0.3978922, 0.4575654, 0.6119403, 1, 1, 1, 1, 1,
-0.396939, 0.9002151, 1.136985, 1, 1, 1, 1, 1,
-0.3940622, 0.2171369, -0.2553629, 1, 1, 1, 1, 1,
-0.3902662, -0.1925325, -1.771048, 1, 1, 1, 1, 1,
-0.3877656, -0.3856713, -1.63509, 1, 1, 1, 1, 1,
-0.3851179, -1.39907, -0.8356692, 1, 1, 1, 1, 1,
-0.3792809, -0.8393494, -2.213806, 1, 1, 1, 1, 1,
-0.3741407, -1.011327, -5.648057, 1, 1, 1, 1, 1,
-0.3731762, 0.4943453, 0.3558899, 0, 0, 1, 1, 1,
-0.3650778, -0.6841046, -3.650456, 1, 0, 0, 1, 1,
-0.3628961, -1.093091, -4.965206, 1, 0, 0, 1, 1,
-0.3620372, -0.9278734, -2.61452, 1, 0, 0, 1, 1,
-0.3604454, 1.231367, -1.251248, 1, 0, 0, 1, 1,
-0.3602639, -0.218138, -1.6361, 1, 0, 0, 1, 1,
-0.3554808, 1.237968, -1.166572, 0, 0, 0, 1, 1,
-0.3540672, 0.6006343, -1.85726, 0, 0, 0, 1, 1,
-0.3497285, 1.018503, 1.224374, 0, 0, 0, 1, 1,
-0.3495451, -1.428571, -3.30977, 0, 0, 0, 1, 1,
-0.3448799, 1.040408, -0.6353024, 0, 0, 0, 1, 1,
-0.3447858, 0.1547104, -0.9319016, 0, 0, 0, 1, 1,
-0.3441614, -0.3550672, -2.278768, 0, 0, 0, 1, 1,
-0.3434224, 0.4540176, -0.1820099, 1, 1, 1, 1, 1,
-0.3434097, -0.5856152, -1.76361, 1, 1, 1, 1, 1,
-0.3416675, -0.8455027, -2.737229, 1, 1, 1, 1, 1,
-0.3403416, -0.8425156, -1.838381, 1, 1, 1, 1, 1,
-0.3367926, 0.5707181, -0.677687, 1, 1, 1, 1, 1,
-0.3365402, 1.586813, 0.2974463, 1, 1, 1, 1, 1,
-0.3347151, -0.4477031, -1.250287, 1, 1, 1, 1, 1,
-0.3339235, 0.03160228, -1.204205, 1, 1, 1, 1, 1,
-0.333522, 0.4181673, -0.3059509, 1, 1, 1, 1, 1,
-0.32936, -0.6126214, -3.189554, 1, 1, 1, 1, 1,
-0.3275643, -0.1680671, -5.073876, 1, 1, 1, 1, 1,
-0.325954, -0.7026094, -3.709411, 1, 1, 1, 1, 1,
-0.3220847, -0.05238368, -0.917807, 1, 1, 1, 1, 1,
-0.318286, 0.8739083, 0.08271879, 1, 1, 1, 1, 1,
-0.3177935, -1.066933, -1.48917, 1, 1, 1, 1, 1,
-0.3162909, -0.8350827, -3.650157, 0, 0, 1, 1, 1,
-0.3033505, 1.499027, -2.376378, 1, 0, 0, 1, 1,
-0.3022431, -1.149726, -2.365236, 1, 0, 0, 1, 1,
-0.2999542, 0.3468741, 0.6800393, 1, 0, 0, 1, 1,
-0.2988778, 2.474409, -1.850434, 1, 0, 0, 1, 1,
-0.2965746, 0.6235734, 0.3815193, 1, 0, 0, 1, 1,
-0.2965469, -0.1121549, -1.297435, 0, 0, 0, 1, 1,
-0.2953683, -0.8312974, -2.272705, 0, 0, 0, 1, 1,
-0.2944305, 1.930294, 0.3142112, 0, 0, 0, 1, 1,
-0.2924141, -1.805781, -2.820628, 0, 0, 0, 1, 1,
-0.2903402, 1.389862, 0.006854923, 0, 0, 0, 1, 1,
-0.2869345, -0.6769045, -4.808365, 0, 0, 0, 1, 1,
-0.2843863, -0.7789418, -2.689371, 0, 0, 0, 1, 1,
-0.2796371, 1.197207, -0.8024415, 1, 1, 1, 1, 1,
-0.2792071, -0.714219, -2.533577, 1, 1, 1, 1, 1,
-0.2765364, -1.459824, -3.020407, 1, 1, 1, 1, 1,
-0.2702377, -0.4229591, -2.064299, 1, 1, 1, 1, 1,
-0.2694387, -0.379647, -2.1232, 1, 1, 1, 1, 1,
-0.2693605, 2.022523, 1.843195, 1, 1, 1, 1, 1,
-0.2692495, -0.4168927, -2.078464, 1, 1, 1, 1, 1,
-0.268225, 0.09772491, -2.979138, 1, 1, 1, 1, 1,
-0.2656709, 0.1327338, -1.3537, 1, 1, 1, 1, 1,
-0.2593684, 1.702005, -0.001327238, 1, 1, 1, 1, 1,
-0.2488646, 0.6970977, 2.319457, 1, 1, 1, 1, 1,
-0.2462518, -1.007981, -4.087689, 1, 1, 1, 1, 1,
-0.2452903, -0.1123371, -2.990111, 1, 1, 1, 1, 1,
-0.2445723, 1.966436, 7.478606e-05, 1, 1, 1, 1, 1,
-0.2383831, 0.8578686, 2.004976, 1, 1, 1, 1, 1,
-0.2369666, -0.8836222, -2.734721, 0, 0, 1, 1, 1,
-0.2344186, 2.570018, 0.1054207, 1, 0, 0, 1, 1,
-0.2327728, 0.6657021, 0.887141, 1, 0, 0, 1, 1,
-0.2310654, 0.671178, -0.4608592, 1, 0, 0, 1, 1,
-0.2228073, 0.5858634, 0.1218046, 1, 0, 0, 1, 1,
-0.2214178, -0.6169075, -4.330276, 1, 0, 0, 1, 1,
-0.2115734, 1.629169, 0.3349286, 0, 0, 0, 1, 1,
-0.210501, 0.2524425, -0.4922571, 0, 0, 0, 1, 1,
-0.2065141, 0.7252701, -1.757625, 0, 0, 0, 1, 1,
-0.2032223, 0.01249292, -0.6687338, 0, 0, 0, 1, 1,
-0.2004141, 0.2430064, -1.711355, 0, 0, 0, 1, 1,
-0.1999559, -1.107025, -3.85184, 0, 0, 0, 1, 1,
-0.1985848, -0.8851717, -2.266899, 0, 0, 0, 1, 1,
-0.1980681, 0.1909995, -2.027451, 1, 1, 1, 1, 1,
-0.1965071, -0.1071284, -2.07101, 1, 1, 1, 1, 1,
-0.1963338, -1.274099, -3.931664, 1, 1, 1, 1, 1,
-0.1958294, 0.002498574, -1.417142, 1, 1, 1, 1, 1,
-0.1942686, -1.108315, -3.973054, 1, 1, 1, 1, 1,
-0.1930552, 1.252502, 0.4971049, 1, 1, 1, 1, 1,
-0.192945, -0.8344144, -5.398809, 1, 1, 1, 1, 1,
-0.1913781, -0.2177724, -2.799684, 1, 1, 1, 1, 1,
-0.191121, -0.7294714, -4.693775, 1, 1, 1, 1, 1,
-0.190261, 0.3327677, -0.8650645, 1, 1, 1, 1, 1,
-0.1844636, 0.5619571, 0.5702997, 1, 1, 1, 1, 1,
-0.183295, 1.426408, 1.096276, 1, 1, 1, 1, 1,
-0.1763131, 0.2899328, -2.156959, 1, 1, 1, 1, 1,
-0.1723559, -0.2952623, -3.702895, 1, 1, 1, 1, 1,
-0.1717257, -0.1343146, -2.21396, 1, 1, 1, 1, 1,
-0.1694042, -0.2804967, 0.7276149, 0, 0, 1, 1, 1,
-0.1681755, 0.7110981, -0.2294512, 1, 0, 0, 1, 1,
-0.167917, 0.7897618, -2.047169, 1, 0, 0, 1, 1,
-0.1673182, 0.551336, -2.541888, 1, 0, 0, 1, 1,
-0.1671017, 0.681062, -1.131701, 1, 0, 0, 1, 1,
-0.1594076, -1.038561, -1.315988, 1, 0, 0, 1, 1,
-0.1593741, -0.1625227, -3.861753, 0, 0, 0, 1, 1,
-0.1592888, -1.348124, -2.803682, 0, 0, 0, 1, 1,
-0.1561985, 0.3704291, 1.313367, 0, 0, 0, 1, 1,
-0.1543725, 1.640868, 0.6215412, 0, 0, 0, 1, 1,
-0.1495454, 0.6731948, 0.3381535, 0, 0, 0, 1, 1,
-0.1404085, 1.016027, 1.153612, 0, 0, 0, 1, 1,
-0.1384308, -1.407635, -3.784908, 0, 0, 0, 1, 1,
-0.1379362, -0.7151281, -2.905924, 1, 1, 1, 1, 1,
-0.1372005, 1.041377, -0.5988051, 1, 1, 1, 1, 1,
-0.1362004, -0.6386032, -1.86024, 1, 1, 1, 1, 1,
-0.1338453, -1.743588, -5.761654, 1, 1, 1, 1, 1,
-0.1333923, -0.5893472, -2.946275, 1, 1, 1, 1, 1,
-0.1332247, -1.109709, -2.083447, 1, 1, 1, 1, 1,
-0.131931, -0.9074849, -2.139887, 1, 1, 1, 1, 1,
-0.1304072, -0.706093, -0.2202673, 1, 1, 1, 1, 1,
-0.129086, 0.6661912, -1.785693, 1, 1, 1, 1, 1,
-0.1214769, 0.2108109, -0.6046203, 1, 1, 1, 1, 1,
-0.1199507, 2.084323, -1.347483, 1, 1, 1, 1, 1,
-0.1176541, 1.214597, 1.717291, 1, 1, 1, 1, 1,
-0.1078387, 0.2652794, 0.6641591, 1, 1, 1, 1, 1,
-0.1070335, 0.6361596, 0.4760734, 1, 1, 1, 1, 1,
-0.103268, 0.8079894, -1.136509, 1, 1, 1, 1, 1,
-0.1002608, 0.9237915, -1.029637, 0, 0, 1, 1, 1,
-0.09871983, 0.3276791, -0.8995026, 1, 0, 0, 1, 1,
-0.09790476, -1.616583, -3.234263, 1, 0, 0, 1, 1,
-0.09257314, -0.4368829, -4.25512, 1, 0, 0, 1, 1,
-0.09225796, 0.6904572, -0.596491, 1, 0, 0, 1, 1,
-0.09194596, -0.436129, -2.181617, 1, 0, 0, 1, 1,
-0.0904393, -0.5727636, -1.344324, 0, 0, 0, 1, 1,
-0.09038729, 1.945313, 0.513344, 0, 0, 0, 1, 1,
-0.0775885, -0.4419992, -2.423256, 0, 0, 0, 1, 1,
-0.07527238, 0.07695497, 0.2285324, 0, 0, 0, 1, 1,
-0.07307558, -0.8982736, -3.96217, 0, 0, 0, 1, 1,
-0.07243447, 1.94192, 0.8953505, 0, 0, 0, 1, 1,
-0.06905938, -0.3901885, -2.681282, 0, 0, 0, 1, 1,
-0.06359071, -0.06560381, -0.9392899, 1, 1, 1, 1, 1,
-0.06153294, -0.2929363, -0.8979978, 1, 1, 1, 1, 1,
-0.06047787, 0.4768669, 0.6859436, 1, 1, 1, 1, 1,
-0.0587119, -1.676099, -2.511579, 1, 1, 1, 1, 1,
-0.05856269, -0.3049233, -2.835435, 1, 1, 1, 1, 1,
-0.05674158, -0.7420064, -5.01303, 1, 1, 1, 1, 1,
-0.05557173, -0.441626, -3.871048, 1, 1, 1, 1, 1,
-0.05505143, -0.9097211, -4.648948, 1, 1, 1, 1, 1,
-0.04970641, -1.671269, -2.357724, 1, 1, 1, 1, 1,
-0.04642184, -0.8964234, -4.422779, 1, 1, 1, 1, 1,
-0.04424595, -1.29698, -1.102528, 1, 1, 1, 1, 1,
-0.042141, -0.8571783, -4.077786, 1, 1, 1, 1, 1,
-0.03847844, -0.7191006, -2.273905, 1, 1, 1, 1, 1,
-0.03669579, -0.04782545, -1.391603, 1, 1, 1, 1, 1,
-0.03417812, -1.025047, -4.369989, 1, 1, 1, 1, 1,
-0.03152113, 0.4670704, -1.122784, 0, 0, 1, 1, 1,
-0.03147084, 0.2667955, -0.1334417, 1, 0, 0, 1, 1,
-0.02786239, 0.080212, -0.4304708, 1, 0, 0, 1, 1,
-0.02309608, 0.0535895, -0.1095199, 1, 0, 0, 1, 1,
-0.0192078, 1.623018, 2.037307, 1, 0, 0, 1, 1,
-0.01398363, 0.338334, 0.929814, 1, 0, 0, 1, 1,
-0.01269821, 0.8036425, 0.2828654, 0, 0, 0, 1, 1,
-0.01245379, 1.247413, -0.7054091, 0, 0, 0, 1, 1,
-0.007736949, 0.9491089, 1.380257, 0, 0, 0, 1, 1,
-0.00709435, 2.355599, -1.262245, 0, 0, 0, 1, 1,
-0.006286717, -1.616969, -3.339437, 0, 0, 0, 1, 1,
-0.005920949, -0.7953567, -3.209744, 0, 0, 0, 1, 1,
-0.001312865, -1.268269, -2.292824, 0, 0, 0, 1, 1,
0.005233715, -0.4626604, 3.621466, 1, 1, 1, 1, 1,
0.00853467, -0.5316877, 3.280293, 1, 1, 1, 1, 1,
0.009066402, -1.784067, 2.55528, 1, 1, 1, 1, 1,
0.009181794, 0.6230197, 0.5972111, 1, 1, 1, 1, 1,
0.01183667, -0.07212783, 3.221024, 1, 1, 1, 1, 1,
0.0140465, 1.083359, -2.551741, 1, 1, 1, 1, 1,
0.0143664, -1.060783, 1.442526, 1, 1, 1, 1, 1,
0.01506804, -0.08783668, 2.599786, 1, 1, 1, 1, 1,
0.01789426, -1.890671, 3.319232, 1, 1, 1, 1, 1,
0.01909502, -0.979561, 4.319538, 1, 1, 1, 1, 1,
0.02160696, -0.1465363, 2.514405, 1, 1, 1, 1, 1,
0.02261411, 0.07987713, -0.4038301, 1, 1, 1, 1, 1,
0.02416438, 1.090971, -0.9204263, 1, 1, 1, 1, 1,
0.02804767, 1.852163, -0.2049831, 1, 1, 1, 1, 1,
0.03004537, 1.357617, 0.1507216, 1, 1, 1, 1, 1,
0.03205412, 1.065166, 1.038893, 0, 0, 1, 1, 1,
0.03423018, -0.162864, 4.198356, 1, 0, 0, 1, 1,
0.03522107, 1.920485, 2.036812, 1, 0, 0, 1, 1,
0.03673266, -0.9871788, 4.068571, 1, 0, 0, 1, 1,
0.03765051, 0.3119268, 0.6619301, 1, 0, 0, 1, 1,
0.0424857, 0.4408915, 1.915314, 1, 0, 0, 1, 1,
0.0453639, -1.723356, 2.30434, 0, 0, 0, 1, 1,
0.04563434, 0.05190009, -0.4855359, 0, 0, 0, 1, 1,
0.04606877, 0.998891, -0.1227413, 0, 0, 0, 1, 1,
0.05099671, 0.6393322, 1.137368, 0, 0, 0, 1, 1,
0.0530411, -0.7732343, 2.059879, 0, 0, 0, 1, 1,
0.05425196, -0.4241771, 0.7476003, 0, 0, 0, 1, 1,
0.05670846, 1.666075, 2.135257, 0, 0, 0, 1, 1,
0.05802827, -0.7093945, 2.067182, 1, 1, 1, 1, 1,
0.0612256, 0.2305707, -0.2896049, 1, 1, 1, 1, 1,
0.06243986, -0.6615511, 2.442306, 1, 1, 1, 1, 1,
0.06496157, -0.8842179, 4.007093, 1, 1, 1, 1, 1,
0.06625118, 0.9061911, -0.1841622, 1, 1, 1, 1, 1,
0.0663551, 0.3040046, 2.389368, 1, 1, 1, 1, 1,
0.07121655, 0.5272474, -0.7697631, 1, 1, 1, 1, 1,
0.07240505, 1.026877, -0.8595064, 1, 1, 1, 1, 1,
0.07892226, 1.155237, -0.5355736, 1, 1, 1, 1, 1,
0.08006463, 0.6350684, 0.2617038, 1, 1, 1, 1, 1,
0.08112955, -0.1106381, 1.189907, 1, 1, 1, 1, 1,
0.08199719, 0.2121548, 0.08243076, 1, 1, 1, 1, 1,
0.08331019, -0.9669979, 2.837859, 1, 1, 1, 1, 1,
0.09220113, 1.066373, -1.012459, 1, 1, 1, 1, 1,
0.09654363, -0.5988384, 4.905102, 1, 1, 1, 1, 1,
0.09825297, -0.5977508, 2.073217, 0, 0, 1, 1, 1,
0.09867583, -1.949263, 1.744089, 1, 0, 0, 1, 1,
0.09913159, 1.03533, -1.770362, 1, 0, 0, 1, 1,
0.09942349, -0.4611368, 1.928495, 1, 0, 0, 1, 1,
0.09968181, 0.09305299, 1.932781, 1, 0, 0, 1, 1,
0.1001582, -0.5879027, 4.752831, 1, 0, 0, 1, 1,
0.1008945, -0.9144608, 3.814407, 0, 0, 0, 1, 1,
0.1010649, 0.07811046, 1.267905, 0, 0, 0, 1, 1,
0.1032772, 0.3097026, 1.211431, 0, 0, 0, 1, 1,
0.1059208, -0.006050036, 1.618805, 0, 0, 0, 1, 1,
0.1093026, -1.185762, 4.220828, 0, 0, 0, 1, 1,
0.1115063, 0.1442428, 1.698815, 0, 0, 0, 1, 1,
0.1143241, 0.3045699, 0.4001265, 0, 0, 0, 1, 1,
0.1189143, 1.510729, -0.2951908, 1, 1, 1, 1, 1,
0.1202, -0.5278422, 1.901931, 1, 1, 1, 1, 1,
0.1243581, -0.1828489, 1.716135, 1, 1, 1, 1, 1,
0.1280741, 1.581189, -1.153848, 1, 1, 1, 1, 1,
0.1302617, 0.177336, 0.2820303, 1, 1, 1, 1, 1,
0.1318929, -0.731715, 2.800644, 1, 1, 1, 1, 1,
0.140815, -0.8700537, 4.71218, 1, 1, 1, 1, 1,
0.1408937, 1.369187, -2.922645, 1, 1, 1, 1, 1,
0.1427742, -0.9663942, 2.575197, 1, 1, 1, 1, 1,
0.1504914, -0.6575564, 2.177952, 1, 1, 1, 1, 1,
0.1519119, -0.03105669, 1.878223, 1, 1, 1, 1, 1,
0.154276, -0.8663465, 2.269378, 1, 1, 1, 1, 1,
0.1576237, -0.9689885, 1.323473, 1, 1, 1, 1, 1,
0.1576601, 0.4834177, -1.944553, 1, 1, 1, 1, 1,
0.1611511, -1.06596, 4.105509, 1, 1, 1, 1, 1,
0.1622669, -1.312829, 3.806745, 0, 0, 1, 1, 1,
0.1657755, -1.15637, 2.152754, 1, 0, 0, 1, 1,
0.1662518, 0.5121081, -2.233839, 1, 0, 0, 1, 1,
0.1667226, -0.8883569, 1.960734, 1, 0, 0, 1, 1,
0.1709516, 1.735746, 0.4697925, 1, 0, 0, 1, 1,
0.1712251, 1.122362, 0.819939, 1, 0, 0, 1, 1,
0.1781777, -0.005634374, 2.391765, 0, 0, 0, 1, 1,
0.1797089, 0.7368963, 1.599073, 0, 0, 0, 1, 1,
0.1802245, -0.6162657, 2.440048, 0, 0, 0, 1, 1,
0.1810225, 1.062585, -1.538195, 0, 0, 0, 1, 1,
0.1862072, -0.6741901, 2.885566, 0, 0, 0, 1, 1,
0.1933355, -0.575836, 1.920177, 0, 0, 0, 1, 1,
0.1958845, 0.4262559, 1.419791, 0, 0, 0, 1, 1,
0.1991401, 0.8808947, -0.9707715, 1, 1, 1, 1, 1,
0.1996366, 1.580549, -1.78245, 1, 1, 1, 1, 1,
0.2035039, -1.691352, 1.945155, 1, 1, 1, 1, 1,
0.2061807, 1.484115, -0.7866669, 1, 1, 1, 1, 1,
0.2064809, 0.3125869, 2.153209, 1, 1, 1, 1, 1,
0.2107182, -0.1146717, 2.822108, 1, 1, 1, 1, 1,
0.2109547, 1.023349, 0.03904871, 1, 1, 1, 1, 1,
0.211572, 0.9737806, 0.7049823, 1, 1, 1, 1, 1,
0.2145321, -0.6463551, 1.980576, 1, 1, 1, 1, 1,
0.2248992, 0.344388, 0.1338309, 1, 1, 1, 1, 1,
0.2249836, 0.2957387, 0.7978212, 1, 1, 1, 1, 1,
0.2260316, -0.4555454, 2.621193, 1, 1, 1, 1, 1,
0.230774, 0.5146605, 0.7075744, 1, 1, 1, 1, 1,
0.2314237, -0.4129365, 5.18178, 1, 1, 1, 1, 1,
0.2346515, 0.3479145, -1.067501, 1, 1, 1, 1, 1,
0.2359767, 0.08569494, 1.521833, 0, 0, 1, 1, 1,
0.239018, -0.1577471, 2.864303, 1, 0, 0, 1, 1,
0.2392231, -0.6788176, 3.278099, 1, 0, 0, 1, 1,
0.2404484, 0.9873049, 0.9198731, 1, 0, 0, 1, 1,
0.2421889, -0.526556, 1.365928, 1, 0, 0, 1, 1,
0.243002, 1.598304, 0.01992884, 1, 0, 0, 1, 1,
0.2476774, 0.5514057, 1.704128, 0, 0, 0, 1, 1,
0.2478225, 0.8116895, -0.3733917, 0, 0, 0, 1, 1,
0.2483604, -0.4548562, 1.720202, 0, 0, 0, 1, 1,
0.2484814, -0.1997076, 2.78544, 0, 0, 0, 1, 1,
0.2505486, 1.572629, -0.1436604, 0, 0, 0, 1, 1,
0.2505981, -1.259295, 2.613322, 0, 0, 0, 1, 1,
0.2525196, -0.3715802, 3.886406, 0, 0, 0, 1, 1,
0.2571651, -0.9065412, 1.653712, 1, 1, 1, 1, 1,
0.2575168, 0.3574741, -1.294848, 1, 1, 1, 1, 1,
0.2636959, -2.100341, 1.073986, 1, 1, 1, 1, 1,
0.2647679, -1.429163, 3.919628, 1, 1, 1, 1, 1,
0.26796, -0.8540737, 2.565998, 1, 1, 1, 1, 1,
0.2723594, 0.9402295, -0.09669884, 1, 1, 1, 1, 1,
0.2758454, 1.639954, -0.2938404, 1, 1, 1, 1, 1,
0.2774446, 0.8038421, 0.5915253, 1, 1, 1, 1, 1,
0.2776935, 1.162447, -0.2747678, 1, 1, 1, 1, 1,
0.277958, 0.3580619, 0.2985956, 1, 1, 1, 1, 1,
0.2799066, 0.1543588, 1.310234, 1, 1, 1, 1, 1,
0.2818379, -0.899308, 4.135016, 1, 1, 1, 1, 1,
0.2840916, -0.05126232, 0.6965667, 1, 1, 1, 1, 1,
0.2844017, -0.61659, 3.235899, 1, 1, 1, 1, 1,
0.2847809, -1.192945, 2.171245, 1, 1, 1, 1, 1,
0.2891491, 0.0006187768, 1.247029, 0, 0, 1, 1, 1,
0.292683, -0.6970155, 2.230367, 1, 0, 0, 1, 1,
0.2949922, -0.2048793, 2.103348, 1, 0, 0, 1, 1,
0.2992435, 0.666245, 1.063464, 1, 0, 0, 1, 1,
0.3108242, -0.3311528, 3.399426, 1, 0, 0, 1, 1,
0.3202371, -0.6674762, 2.521663, 1, 0, 0, 1, 1,
0.3236348, 1.121092, 0.6409084, 0, 0, 0, 1, 1,
0.3253371, 1.818577, -1.038413, 0, 0, 0, 1, 1,
0.3270893, 0.072657, 0.1898375, 0, 0, 0, 1, 1,
0.3288691, 2.29141, -1.206886, 0, 0, 0, 1, 1,
0.332408, 0.06749297, 1.868354, 0, 0, 0, 1, 1,
0.3375393, 1.322879, 1.214256, 0, 0, 0, 1, 1,
0.3376219, -1.226179, -0.06358688, 0, 0, 0, 1, 1,
0.3463839, -0.8704601, 2.204657, 1, 1, 1, 1, 1,
0.3504, 0.3842821, 1.27682, 1, 1, 1, 1, 1,
0.3511391, 3.871963, -0.4826761, 1, 1, 1, 1, 1,
0.3525111, 1.564113, -0.7628325, 1, 1, 1, 1, 1,
0.3609608, 1.268135, 0.09012739, 1, 1, 1, 1, 1,
0.3689734, -0.3866843, 3.230198, 1, 1, 1, 1, 1,
0.3698626, 0.3112721, 0.6078795, 1, 1, 1, 1, 1,
0.3725469, 0.5735775, -0.6055644, 1, 1, 1, 1, 1,
0.3746611, 0.5406548, 1.134015, 1, 1, 1, 1, 1,
0.3832088, 1.36419, 0.7811517, 1, 1, 1, 1, 1,
0.383748, 2.111286, -0.7304329, 1, 1, 1, 1, 1,
0.384547, 1.313367, 2.086808, 1, 1, 1, 1, 1,
0.3881114, -0.1337702, 3.212011, 1, 1, 1, 1, 1,
0.3889784, 1.123962, 1.148912, 1, 1, 1, 1, 1,
0.3924408, -0.1102848, 1.987885, 1, 1, 1, 1, 1,
0.3953918, -1.355849, 1.353612, 0, 0, 1, 1, 1,
0.3956741, 0.2114766, 0.7339247, 1, 0, 0, 1, 1,
0.3963045, -0.3323241, 2.363479, 1, 0, 0, 1, 1,
0.3970965, 1.362246, 0.1931477, 1, 0, 0, 1, 1,
0.3995343, -0.2102389, 1.904642, 1, 0, 0, 1, 1,
0.4000998, -1.251614, 3.747101, 1, 0, 0, 1, 1,
0.4026087, -0.648506, 2.538622, 0, 0, 0, 1, 1,
0.4052102, 1.181966, -0.1102391, 0, 0, 0, 1, 1,
0.408439, -1.071277, 1.296468, 0, 0, 0, 1, 1,
0.4122182, -0.3939335, 1.753108, 0, 0, 0, 1, 1,
0.4124098, 0.4268673, 0.4372619, 0, 0, 0, 1, 1,
0.4154231, -0.2304485, 2.173112, 0, 0, 0, 1, 1,
0.4202016, -0.5500597, 3.75467, 0, 0, 0, 1, 1,
0.4233308, 1.858649, 0.1833639, 1, 1, 1, 1, 1,
0.4263034, -0.1401804, 1.245759, 1, 1, 1, 1, 1,
0.4319831, 2.845492, -0.6172957, 1, 1, 1, 1, 1,
0.4359641, -0.622143, 1.983758, 1, 1, 1, 1, 1,
0.4363863, 0.7324732, -0.4481633, 1, 1, 1, 1, 1,
0.4376611, 0.1392389, 1.126064, 1, 1, 1, 1, 1,
0.4409454, 1.748017, 0.07645195, 1, 1, 1, 1, 1,
0.4415695, 0.8601023, 0.127864, 1, 1, 1, 1, 1,
0.4438354, 0.1646175, 0.9930668, 1, 1, 1, 1, 1,
0.451077, 0.6412566, -0.2135095, 1, 1, 1, 1, 1,
0.4524999, -0.6481549, 3.075114, 1, 1, 1, 1, 1,
0.4568202, -0.9163977, 2.859246, 1, 1, 1, 1, 1,
0.4577565, 0.1275337, 3.018934, 1, 1, 1, 1, 1,
0.466208, -1.239202, 3.175971, 1, 1, 1, 1, 1,
0.4665265, -0.1790147, 0.6505221, 1, 1, 1, 1, 1,
0.4670546, 0.707718, -0.7706351, 0, 0, 1, 1, 1,
0.4674104, 0.6508335, -0.421636, 1, 0, 0, 1, 1,
0.4752004, -0.08201006, -0.05585738, 1, 0, 0, 1, 1,
0.4754858, 1.362941, 1.462132, 1, 0, 0, 1, 1,
0.4759312, -1.65699, 2.039317, 1, 0, 0, 1, 1,
0.4790328, -0.1792021, 1.550368, 1, 0, 0, 1, 1,
0.4837282, 0.02214317, 1.711563, 0, 0, 0, 1, 1,
0.4880178, -0.02695061, 1.053111, 0, 0, 0, 1, 1,
0.496489, -0.726377, 1.391656, 0, 0, 0, 1, 1,
0.5002856, 0.1288993, 0.3677399, 0, 0, 0, 1, 1,
0.5017394, 2.103476, 2.0297, 0, 0, 0, 1, 1,
0.5022203, 0.1642663, 0.4318509, 0, 0, 0, 1, 1,
0.5044027, -2.26231, 1.691682, 0, 0, 0, 1, 1,
0.5091993, 0.1396111, 1.735298, 1, 1, 1, 1, 1,
0.5097841, 2.014303, -1.82587, 1, 1, 1, 1, 1,
0.5123624, -0.2698329, 3.310626, 1, 1, 1, 1, 1,
0.5222803, -0.1100578, 1.918208, 1, 1, 1, 1, 1,
0.531329, 0.03221516, 1.842697, 1, 1, 1, 1, 1,
0.5355994, 0.3254225, -0.9718432, 1, 1, 1, 1, 1,
0.5362089, 1.920377, -0.1443987, 1, 1, 1, 1, 1,
0.5384111, -0.4046664, 1.719594, 1, 1, 1, 1, 1,
0.5401071, -0.4459273, 1.001974, 1, 1, 1, 1, 1,
0.5436554, 0.4335676, 1.245688, 1, 1, 1, 1, 1,
0.5468617, -1.068525, 5.158537, 1, 1, 1, 1, 1,
0.5498567, 0.5838199, 1.11696, 1, 1, 1, 1, 1,
0.5528287, 0.1774916, 2.122818, 1, 1, 1, 1, 1,
0.5604771, -0.8154389, 4.488307, 1, 1, 1, 1, 1,
0.5678806, 0.8601562, 2.069905, 1, 1, 1, 1, 1,
0.5679337, -1.624457, 3.138644, 0, 0, 1, 1, 1,
0.5704589, -0.7700095, 2.656931, 1, 0, 0, 1, 1,
0.5739254, 1.013275, 0.4941337, 1, 0, 0, 1, 1,
0.5759748, 0.4568456, 0.2218894, 1, 0, 0, 1, 1,
0.576729, 0.1265844, 1.075165, 1, 0, 0, 1, 1,
0.5814156, -0.6868159, 1.855903, 1, 0, 0, 1, 1,
0.5852794, -0.3787383, 2.822718, 0, 0, 0, 1, 1,
0.5864677, -0.112582, 3.252259, 0, 0, 0, 1, 1,
0.5881691, 0.7393367, -0.3067494, 0, 0, 0, 1, 1,
0.5884185, -0.0923897, 2.767927, 0, 0, 0, 1, 1,
0.5898936, -0.7436101, 1.895484, 0, 0, 0, 1, 1,
0.5899612, 0.3354807, 0.3458333, 0, 0, 0, 1, 1,
0.593474, -0.2696069, 2.37362, 0, 0, 0, 1, 1,
0.5951236, 1.705155, -0.9880363, 1, 1, 1, 1, 1,
0.5967126, -0.7482226, 2.188664, 1, 1, 1, 1, 1,
0.5984899, 3.000668, -0.2128403, 1, 1, 1, 1, 1,
0.5997251, 0.1952888, 1.122742, 1, 1, 1, 1, 1,
0.6025551, -0.0424246, 1.829602, 1, 1, 1, 1, 1,
0.6097839, -0.3637679, 1.38031, 1, 1, 1, 1, 1,
0.6101121, -1.687926, 1.242462, 1, 1, 1, 1, 1,
0.6101516, 0.09893967, 1.869383, 1, 1, 1, 1, 1,
0.6120596, 2.479159, -0.07871844, 1, 1, 1, 1, 1,
0.6135151, 1.56386, 0.03246167, 1, 1, 1, 1, 1,
0.6160863, -0.1810679, 2.493925, 1, 1, 1, 1, 1,
0.6191481, -1.835659, 2.015792, 1, 1, 1, 1, 1,
0.6224127, 0.5431235, 0.04808458, 1, 1, 1, 1, 1,
0.6227244, 1.119227, 1.994613, 1, 1, 1, 1, 1,
0.6231254, 0.373496, 0.3752206, 1, 1, 1, 1, 1,
0.6255023, 0.6530933, 0.6912859, 0, 0, 1, 1, 1,
0.6261259, -0.09267969, 2.093788, 1, 0, 0, 1, 1,
0.6266441, -0.3481588, 2.424129, 1, 0, 0, 1, 1,
0.6289026, -1.391698, 2.167725, 1, 0, 0, 1, 1,
0.6294345, 1.374763, 1.263229, 1, 0, 0, 1, 1,
0.6301768, 0.5699638, 0.607173, 1, 0, 0, 1, 1,
0.6369898, -1.388767, 2.487345, 0, 0, 0, 1, 1,
0.6371269, -0.2403902, 3.016861, 0, 0, 0, 1, 1,
0.6372459, 0.8462243, 0.4371227, 0, 0, 0, 1, 1,
0.6402404, 0.92078, -0.2725879, 0, 0, 0, 1, 1,
0.6457165, -1.092474, 2.255607, 0, 0, 0, 1, 1,
0.6558027, 1.387717, -0.05564625, 0, 0, 0, 1, 1,
0.6596963, -0.5902889, 2.247541, 0, 0, 0, 1, 1,
0.660076, -0.1522632, 2.134118, 1, 1, 1, 1, 1,
0.665325, -1.112725, 2.680076, 1, 1, 1, 1, 1,
0.6654187, -2.244951, 1.814922, 1, 1, 1, 1, 1,
0.6660563, 0.7160747, 1.012302, 1, 1, 1, 1, 1,
0.6671086, -1.419372, 1.506194, 1, 1, 1, 1, 1,
0.667465, -0.8437495, 2.090462, 1, 1, 1, 1, 1,
0.6686944, -0.369244, 1.383995, 1, 1, 1, 1, 1,
0.6687751, 1.550718, 0.7173447, 1, 1, 1, 1, 1,
0.6699228, 0.4185879, 1.847161, 1, 1, 1, 1, 1,
0.6710505, -0.6079185, 2.082662, 1, 1, 1, 1, 1,
0.6812636, -1.266296, 3.194477, 1, 1, 1, 1, 1,
0.6827688, 0.629141, 0.3637953, 1, 1, 1, 1, 1,
0.6885467, 1.872466, 1.734015, 1, 1, 1, 1, 1,
0.6944119, 0.9538936, 0.6707236, 1, 1, 1, 1, 1,
0.6959874, -0.8834007, 3.145669, 1, 1, 1, 1, 1,
0.6988161, 1.308617, 0.4298607, 0, 0, 1, 1, 1,
0.7043912, 1.479041, 0.3223167, 1, 0, 0, 1, 1,
0.7045052, 0.4577713, -0.9229858, 1, 0, 0, 1, 1,
0.7058252, -0.2401648, 3.078594, 1, 0, 0, 1, 1,
0.7106463, 0.03616621, 0.8827324, 1, 0, 0, 1, 1,
0.711677, 0.3519248, 0.7061301, 1, 0, 0, 1, 1,
0.7146946, 1.576648, 1.285098, 0, 0, 0, 1, 1,
0.7174832, -1.165365, 1.666408, 0, 0, 0, 1, 1,
0.7188635, -1.027045, 4.737543, 0, 0, 0, 1, 1,
0.7210971, -0.4381793, 2.181529, 0, 0, 0, 1, 1,
0.7243696, 0.9942498, 1.277534, 0, 0, 0, 1, 1,
0.7255307, -0.4445141, 3.161769, 0, 0, 0, 1, 1,
0.7288091, 0.07246511, 0.4871409, 0, 0, 0, 1, 1,
0.7297007, -0.4073423, -0.4581331, 1, 1, 1, 1, 1,
0.7336853, -1.159363, 0.3276765, 1, 1, 1, 1, 1,
0.7372677, -0.3439066, 2.243233, 1, 1, 1, 1, 1,
0.7436729, -0.9932418, 2.261429, 1, 1, 1, 1, 1,
0.7463793, 0.2637594, 0.4134223, 1, 1, 1, 1, 1,
0.7507135, 0.2496802, 1.976696, 1, 1, 1, 1, 1,
0.7528614, -0.1892729, 3.478579, 1, 1, 1, 1, 1,
0.7568702, -0.6923161, 1.59705, 1, 1, 1, 1, 1,
0.7600572, 2.375703, 0.8188244, 1, 1, 1, 1, 1,
0.7628055, -0.1245015, 2.427467, 1, 1, 1, 1, 1,
0.7632974, 0.04776248, 4.226222, 1, 1, 1, 1, 1,
0.7656157, -1.016888, 1.699528, 1, 1, 1, 1, 1,
0.7663417, 2.357394, 1.244046, 1, 1, 1, 1, 1,
0.776318, -0.4652348, 2.73304, 1, 1, 1, 1, 1,
0.7766667, -0.0228435, 0.9971373, 1, 1, 1, 1, 1,
0.7777889, 0.4946145, 1.309895, 0, 0, 1, 1, 1,
0.7807385, 0.722943, 0.2296717, 1, 0, 0, 1, 1,
0.7846244, -0.5389562, 1.901913, 1, 0, 0, 1, 1,
0.7905143, -1.457528, 2.718965, 1, 0, 0, 1, 1,
0.7983462, -0.3391287, 1.41623, 1, 0, 0, 1, 1,
0.8025182, 0.4815345, 0.8713948, 1, 0, 0, 1, 1,
0.8029391, -0.07229892, 3.298891, 0, 0, 0, 1, 1,
0.8066669, 0.1480761, 0.1834554, 0, 0, 0, 1, 1,
0.8090541, -2.229272, 4.078418, 0, 0, 0, 1, 1,
0.8122422, 0.5739884, 1.178776, 0, 0, 0, 1, 1,
0.8142161, 1.117819, 1.571127, 0, 0, 0, 1, 1,
0.8175096, 0.4356383, 2.499686, 0, 0, 0, 1, 1,
0.8184302, 0.2057774, 1.579218, 0, 0, 0, 1, 1,
0.8226788, -0.5356158, 1.988926, 1, 1, 1, 1, 1,
0.8271899, -1.416025, 1.952332, 1, 1, 1, 1, 1,
0.8337182, 0.3881655, 0.915639, 1, 1, 1, 1, 1,
0.8342568, -2.558123, 1.605483, 1, 1, 1, 1, 1,
0.8370704, -0.1410361, 0.8819134, 1, 1, 1, 1, 1,
0.8417575, 1.357924, 1.655875, 1, 1, 1, 1, 1,
0.8430763, -0.4362946, 1.696643, 1, 1, 1, 1, 1,
0.8472155, 1.660207, 0.9720353, 1, 1, 1, 1, 1,
0.854327, -0.8522792, 2.760482, 1, 1, 1, 1, 1,
0.8545574, -1.063642, 4.274498, 1, 1, 1, 1, 1,
0.8552151, 1.005728, 0.831838, 1, 1, 1, 1, 1,
0.8574874, 0.122549, 2.02467, 1, 1, 1, 1, 1,
0.872164, 2.745085, -0.6359429, 1, 1, 1, 1, 1,
0.8739513, -0.3521271, 1.547492, 1, 1, 1, 1, 1,
0.8741935, 0.7506793, 1.885623, 1, 1, 1, 1, 1,
0.8754864, -0.7622631, 2.523895, 0, 0, 1, 1, 1,
0.8756208, -1.144527, 1.418317, 1, 0, 0, 1, 1,
0.8774794, 3.202976, -1.113415, 1, 0, 0, 1, 1,
0.8796708, -0.5687485, 0.9635442, 1, 0, 0, 1, 1,
0.8847443, 1.36664, -0.2576903, 1, 0, 0, 1, 1,
0.8903552, -0.1188321, 1.144739, 1, 0, 0, 1, 1,
0.8913946, -0.5407491, 2.632731, 0, 0, 0, 1, 1,
0.8925709, 0.04271102, 4.401647, 0, 0, 0, 1, 1,
0.8927839, -1.31583, -0.3320316, 0, 0, 0, 1, 1,
0.8978316, 0.6181204, 1.201264, 0, 0, 0, 1, 1,
0.8990145, 0.340285, 1.326976, 0, 0, 0, 1, 1,
0.8990286, -2.244892, 2.856854, 0, 0, 0, 1, 1,
0.9004477, 0.3214694, 2.169409, 0, 0, 0, 1, 1,
0.9005181, -0.1038697, 3.263087, 1, 1, 1, 1, 1,
0.9070725, 0.7973878, 1.118708, 1, 1, 1, 1, 1,
0.9162898, 1.104919, 1.550068, 1, 1, 1, 1, 1,
0.9200094, 0.2421354, -0.4738477, 1, 1, 1, 1, 1,
0.9232006, -0.1048492, 3.809204, 1, 1, 1, 1, 1,
0.9248035, -1.846976, 1.669153, 1, 1, 1, 1, 1,
0.9281265, 0.6206551, 0.2886097, 1, 1, 1, 1, 1,
0.9319831, -0.00744951, 1.754503, 1, 1, 1, 1, 1,
0.9369503, 1.090143, 1.217771, 1, 1, 1, 1, 1,
0.9370838, 1.046704, 0.7172771, 1, 1, 1, 1, 1,
0.948641, -0.485827, 3.216222, 1, 1, 1, 1, 1,
0.9583975, 0.9182976, 1.192228, 1, 1, 1, 1, 1,
0.958806, 0.4149591, 0.5359516, 1, 1, 1, 1, 1,
0.9620938, -1.804998, 3.665243, 1, 1, 1, 1, 1,
0.9628177, 1.232284, 0.5826618, 1, 1, 1, 1, 1,
0.9631034, -0.7692426, 0.8971338, 0, 0, 1, 1, 1,
0.9642264, -0.05772895, 0.9577384, 1, 0, 0, 1, 1,
0.9644659, 1.190494, 1.268365, 1, 0, 0, 1, 1,
0.9702015, -1.930991, 3.478018, 1, 0, 0, 1, 1,
0.9712406, 0.4946838, 1.557334, 1, 0, 0, 1, 1,
0.9734193, 1.258791, -0.8540531, 1, 0, 0, 1, 1,
0.9796461, 0.6669997, 2.054089, 0, 0, 0, 1, 1,
0.9830111, 0.2033569, 0.870918, 0, 0, 0, 1, 1,
0.9836901, -0.1996311, 4.549073, 0, 0, 0, 1, 1,
0.9868396, -0.3660003, 1.80756, 0, 0, 0, 1, 1,
0.989727, -1.427024, 3.791155, 0, 0, 0, 1, 1,
0.9914123, -0.2539314, -0.2145682, 0, 0, 0, 1, 1,
0.9928209, 0.8944699, -0.7742701, 0, 0, 0, 1, 1,
0.9960915, -0.523355, 2.485209, 1, 1, 1, 1, 1,
0.9977697, 0.7324241, 0.265569, 1, 1, 1, 1, 1,
0.9992091, -1.344164, 1.500622, 1, 1, 1, 1, 1,
1.00293, 2.107921, 0.8814981, 1, 1, 1, 1, 1,
1.004253, 1.025003, 0.9444162, 1, 1, 1, 1, 1,
1.004458, 0.06932352, 3.233671, 1, 1, 1, 1, 1,
1.006247, 0.06121301, 1.588008, 1, 1, 1, 1, 1,
1.017169, 0.7169164, 1.427219, 1, 1, 1, 1, 1,
1.018291, 1.045171, 0.4935932, 1, 1, 1, 1, 1,
1.03737, 1.748362, 0.570955, 1, 1, 1, 1, 1,
1.037524, 0.02391493, 1.348835, 1, 1, 1, 1, 1,
1.045857, 1.319619, 0.6027948, 1, 1, 1, 1, 1,
1.053046, -0.892779, 1.694589, 1, 1, 1, 1, 1,
1.057365, -0.9667811, 2.805244, 1, 1, 1, 1, 1,
1.072463, 0.2486785, 1.637891, 1, 1, 1, 1, 1,
1.076534, 0.9279578, 1.009694, 0, 0, 1, 1, 1,
1.086307, 0.8381204, 3.42871, 1, 0, 0, 1, 1,
1.087546, 0.04842534, 0.9533211, 1, 0, 0, 1, 1,
1.091311, 0.5942323, 0.6129785, 1, 0, 0, 1, 1,
1.091356, 0.1738283, 2.115447, 1, 0, 0, 1, 1,
1.095987, -0.3710746, 2.213373, 1, 0, 0, 1, 1,
1.096544, 1.017995, 0.3217951, 0, 0, 0, 1, 1,
1.099562, 1.590412, 2.16123, 0, 0, 0, 1, 1,
1.099946, -1.091545, 0.4961695, 0, 0, 0, 1, 1,
1.113117, 0.7966591, 1.768872, 0, 0, 0, 1, 1,
1.113993, 0.2829973, 4.558871, 0, 0, 0, 1, 1,
1.115635, 0.9956396, 1.323038, 0, 0, 0, 1, 1,
1.127924, -1.471892, 0.9783885, 0, 0, 0, 1, 1,
1.141699, 0.3829123, 0.5713018, 1, 1, 1, 1, 1,
1.14216, -0.7177542, 1.686859, 1, 1, 1, 1, 1,
1.144004, -0.636941, 2.030865, 1, 1, 1, 1, 1,
1.148235, -1.480184, 3.380881, 1, 1, 1, 1, 1,
1.151392, 1.511401, 0.2145102, 1, 1, 1, 1, 1,
1.154844, -1.023165, 3.583576, 1, 1, 1, 1, 1,
1.16237, -0.04276346, 2.411656, 1, 1, 1, 1, 1,
1.162514, 0.5177066, 1.070673, 1, 1, 1, 1, 1,
1.166752, 2.313732, 0.04244441, 1, 1, 1, 1, 1,
1.173928, -0.0848656, 1.964776, 1, 1, 1, 1, 1,
1.179589, -2.224467, 2.182192, 1, 1, 1, 1, 1,
1.180017, -1.581577, 3.603523, 1, 1, 1, 1, 1,
1.18392, 0.7363687, 1.333657, 1, 1, 1, 1, 1,
1.193499, 1.150049, 0.04080134, 1, 1, 1, 1, 1,
1.196257, 0.08301347, 1.471647, 1, 1, 1, 1, 1,
1.208043, 0.07412368, 0.8521364, 0, 0, 1, 1, 1,
1.209121, 1.671776, -1.01373, 1, 0, 0, 1, 1,
1.209758, -0.7518448, 1.829375, 1, 0, 0, 1, 1,
1.217375, 0.9069664, -0.9022214, 1, 0, 0, 1, 1,
1.224548, 1.369493, 1.49874, 1, 0, 0, 1, 1,
1.224864, 0.959295, 1.992893, 1, 0, 0, 1, 1,
1.234848, -0.2198552, 0.5885456, 0, 0, 0, 1, 1,
1.245822, -0.2553367, 2.876219, 0, 0, 0, 1, 1,
1.256071, 1.179463, 0.8521301, 0, 0, 0, 1, 1,
1.272508, -2.102268, 2.017617, 0, 0, 0, 1, 1,
1.277217, -0.5581549, 1.706657, 0, 0, 0, 1, 1,
1.282132, -0.2195402, 2.377087, 0, 0, 0, 1, 1,
1.284492, -0.05545694, 1.520607, 0, 0, 0, 1, 1,
1.290702, 0.3953283, 1.491901, 1, 1, 1, 1, 1,
1.300529, -1.368884, 1.200734, 1, 1, 1, 1, 1,
1.307166, -0.3221657, 3.129667, 1, 1, 1, 1, 1,
1.327709, -0.5352036, 1.03153, 1, 1, 1, 1, 1,
1.337986, 0.6779999, 2.140758, 1, 1, 1, 1, 1,
1.345712, -1.150946, 3.50818, 1, 1, 1, 1, 1,
1.347171, -0.2460127, 2.709116, 1, 1, 1, 1, 1,
1.353096, 0.8626299, 0.9397746, 1, 1, 1, 1, 1,
1.368882, 0.5128654, 0.9932538, 1, 1, 1, 1, 1,
1.36913, 1.745872, -0.4343293, 1, 1, 1, 1, 1,
1.369191, -1.292267, 1.250126, 1, 1, 1, 1, 1,
1.384314, -0.355727, 2.47008, 1, 1, 1, 1, 1,
1.387419, 0.4752171, 1.239479, 1, 1, 1, 1, 1,
1.389237, -0.5865175, 0.40512, 1, 1, 1, 1, 1,
1.39032, -0.06260992, 1.739854, 1, 1, 1, 1, 1,
1.407654, 0.4139659, 2.510081, 0, 0, 1, 1, 1,
1.411408, 1.635018, 0.2548021, 1, 0, 0, 1, 1,
1.442285, 0.3297044, -0.009617889, 1, 0, 0, 1, 1,
1.444366, 0.07707331, 1.426079, 1, 0, 0, 1, 1,
1.452013, -0.3339303, 1.77124, 1, 0, 0, 1, 1,
1.470327, -0.0293533, 1.086274, 1, 0, 0, 1, 1,
1.471984, 0.6506622, 0.2411806, 0, 0, 0, 1, 1,
1.47698, -0.210103, 0.8487245, 0, 0, 0, 1, 1,
1.490748, -2.172006, 2.218117, 0, 0, 0, 1, 1,
1.495175, -2.174247, 1.642482, 0, 0, 0, 1, 1,
1.500526, 0.599232, 0.3855498, 0, 0, 0, 1, 1,
1.508963, 0.6762171, 1.770206, 0, 0, 0, 1, 1,
1.512572, -0.2297841, 0.9987832, 0, 0, 0, 1, 1,
1.516193, 0.7430977, 0.5567852, 1, 1, 1, 1, 1,
1.540872, 0.9170285, -0.1070694, 1, 1, 1, 1, 1,
1.543772, -1.338184, 2.61944, 1, 1, 1, 1, 1,
1.548458, 1.24506, -0.7742441, 1, 1, 1, 1, 1,
1.553697, -0.4155856, 2.681111, 1, 1, 1, 1, 1,
1.554389, -0.4809822, 2.754638, 1, 1, 1, 1, 1,
1.592162, 0.3198532, 0.212526, 1, 1, 1, 1, 1,
1.603746, 0.1775186, -0.3619266, 1, 1, 1, 1, 1,
1.603843, 0.03337342, 1.015785, 1, 1, 1, 1, 1,
1.625206, 0.1261579, 0.6211264, 1, 1, 1, 1, 1,
1.62794, -0.6008788, 3.470696, 1, 1, 1, 1, 1,
1.628982, 1.795036, 0.7800745, 1, 1, 1, 1, 1,
1.630829, 0.1632823, 1.080576, 1, 1, 1, 1, 1,
1.637715, 0.2479146, 1.964998, 1, 1, 1, 1, 1,
1.658518, -0.2363354, 0.7040507, 1, 1, 1, 1, 1,
1.66658, 1.071638, 1.025056, 0, 0, 1, 1, 1,
1.668103, -0.1037125, 1.524283, 1, 0, 0, 1, 1,
1.668313, 0.6116075, 2.32542, 1, 0, 0, 1, 1,
1.669513, 0.9093745, -0.3552975, 1, 0, 0, 1, 1,
1.673543, 0.4164562, 1.342288, 1, 0, 0, 1, 1,
1.692406, -0.2912318, 2.194849, 1, 0, 0, 1, 1,
1.699984, -0.2698821, 2.925792, 0, 0, 0, 1, 1,
1.704202, 0.7173964, 2.166678, 0, 0, 0, 1, 1,
1.714885, 1.307153, -0.4042526, 0, 0, 0, 1, 1,
1.726683, -0.7731912, 1.164317, 0, 0, 0, 1, 1,
1.738513, -0.2116627, 2.899858, 0, 0, 0, 1, 1,
1.749969, 0.789208, 0.5949855, 0, 0, 0, 1, 1,
1.75529, -0.1181498, 0.7299867, 0, 0, 0, 1, 1,
1.763449, 0.2944405, 1.560832, 1, 1, 1, 1, 1,
1.769929, 0.7662227, 0.6380956, 1, 1, 1, 1, 1,
1.796558, 2.459266, 0.657372, 1, 1, 1, 1, 1,
1.802321, 0.9489066, 0.1754394, 1, 1, 1, 1, 1,
1.807123, -1.518357, 2.447407, 1, 1, 1, 1, 1,
1.807325, -0.8488885, 1.382733, 1, 1, 1, 1, 1,
1.833334, -0.2451897, 1.359718, 1, 1, 1, 1, 1,
1.860179, -1.443519, 2.588645, 1, 1, 1, 1, 1,
1.866399, -1.431055, 2.796601, 1, 1, 1, 1, 1,
1.86842, -0.7474268, 1.450546, 1, 1, 1, 1, 1,
1.871047, 0.3626169, 1.300516, 1, 1, 1, 1, 1,
1.913965, -0.6915019, 1.218498, 1, 1, 1, 1, 1,
1.940884, 0.6338252, 2.531463, 1, 1, 1, 1, 1,
1.96209, -0.6088091, 3.183285, 1, 1, 1, 1, 1,
1.997167, -0.02762917, 1.135928, 1, 1, 1, 1, 1,
2.036183, -0.8009452, 4.116469, 0, 0, 1, 1, 1,
2.03663, -0.1770221, 0.7487961, 1, 0, 0, 1, 1,
2.043267, -1.31406, 0.05983081, 1, 0, 0, 1, 1,
2.076514, 0.4930895, 1.911724, 1, 0, 0, 1, 1,
2.104512, 0.6129515, 1.73919, 1, 0, 0, 1, 1,
2.106583, -0.7931011, 1.203593, 1, 0, 0, 1, 1,
2.109648, -0.09879163, 2.243708, 0, 0, 0, 1, 1,
2.189235, 1.182062, -1.615504, 0, 0, 0, 1, 1,
2.213914, 0.9374345, 1.434256, 0, 0, 0, 1, 1,
2.240641, -1.582741, 3.618087, 0, 0, 0, 1, 1,
2.261783, -0.1081507, 2.886639, 0, 0, 0, 1, 1,
2.278492, 0.3423658, 0.4868286, 0, 0, 0, 1, 1,
2.39583, 1.720258, 1.939058, 0, 0, 0, 1, 1,
2.461139, 0.03419485, 2.434102, 1, 1, 1, 1, 1,
2.479283, -0.2117702, 1.799185, 1, 1, 1, 1, 1,
2.620999, 1.99055, 1.534627, 1, 1, 1, 1, 1,
2.69492, 1.812774, -1.814309, 1, 1, 1, 1, 1,
2.715698, -0.6005455, -0.2708127, 1, 1, 1, 1, 1,
2.808284, -0.7556093, 0.7786454, 1, 1, 1, 1, 1,
2.892234, -1.643175, 3.261847, 1, 1, 1, 1, 1
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
var radius = 9.569956;
var distance = 33.61406;
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
mvMatrix.translate( -0.1293702, -0.439466, 0.2899368 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.61406);
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