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
-3.030317, 1.12728, -2.38087, 1, 0, 0, 1,
-2.981879, 0.2934563, -0.3088638, 1, 0.007843138, 0, 1,
-2.947778, 1.203164, -1.092079, 1, 0.01176471, 0, 1,
-2.734478, 0.3555847, -1.606237, 1, 0.01960784, 0, 1,
-2.725278, -0.4002661, -1.553723, 1, 0.02352941, 0, 1,
-2.62168, 0.2796675, -2.812692, 1, 0.03137255, 0, 1,
-2.617704, -1.07699, -1.721823, 1, 0.03529412, 0, 1,
-2.603066, 1.323987, -2.354145, 1, 0.04313726, 0, 1,
-2.519833, 0.678722, -1.174102, 1, 0.04705882, 0, 1,
-2.323219, -0.2711316, -3.128369, 1, 0.05490196, 0, 1,
-2.271664, -0.7560993, -1.689592, 1, 0.05882353, 0, 1,
-2.263552, -0.6167988, -1.308888, 1, 0.06666667, 0, 1,
-2.195046, 0.8172097, -1.081841, 1, 0.07058824, 0, 1,
-2.179912, -0.6644933, -1.632188, 1, 0.07843138, 0, 1,
-2.145008, 2.332596, -1.185635, 1, 0.08235294, 0, 1,
-2.101304, 1.113904, -0.1939671, 1, 0.09019608, 0, 1,
-2.06436, -2.103724, -1.79938, 1, 0.09411765, 0, 1,
-2.051536, -0.7252071, -2.140915, 1, 0.1019608, 0, 1,
-2.021822, 1.318515, -0.4694426, 1, 0.1098039, 0, 1,
-2.014868, 0.4039082, -2.725906, 1, 0.1137255, 0, 1,
-1.986879, 0.5167242, -1.038001, 1, 0.1215686, 0, 1,
-1.977628, -0.3667253, -1.032524, 1, 0.1254902, 0, 1,
-1.953376, 0.5229015, -1.442839, 1, 0.1333333, 0, 1,
-1.950457, -1.500997, -1.735597, 1, 0.1372549, 0, 1,
-1.947403, -0.1545599, -1.050129, 1, 0.145098, 0, 1,
-1.945829, 0.7145854, -0.2324882, 1, 0.1490196, 0, 1,
-1.930077, -0.1151155, -4.203007, 1, 0.1568628, 0, 1,
-1.903046, -0.5981646, -1.358542, 1, 0.1607843, 0, 1,
-1.892418, -0.2559074, 0.6587369, 1, 0.1686275, 0, 1,
-1.860929, 0.2716287, -1.716137, 1, 0.172549, 0, 1,
-1.849153, -1.005614, -4.169415, 1, 0.1803922, 0, 1,
-1.839276, 0.09359634, -2.392105, 1, 0.1843137, 0, 1,
-1.825287, 0.3265296, -1.835668, 1, 0.1921569, 0, 1,
-1.820793, -1.39025, -2.717408, 1, 0.1960784, 0, 1,
-1.800642, 0.06040413, -2.31413, 1, 0.2039216, 0, 1,
-1.793178, -0.07503989, -0.4051802, 1, 0.2117647, 0, 1,
-1.776385, 0.8716983, -2.345662, 1, 0.2156863, 0, 1,
-1.773854, 0.901742, 1.146374, 1, 0.2235294, 0, 1,
-1.766901, 1.637823, -1.942429, 1, 0.227451, 0, 1,
-1.761455, -0.7062358, -0.5136769, 1, 0.2352941, 0, 1,
-1.75268, 0.3078741, -2.346102, 1, 0.2392157, 0, 1,
-1.740595, 1.171541, 0.6530395, 1, 0.2470588, 0, 1,
-1.736883, 0.3407498, -0.3215851, 1, 0.2509804, 0, 1,
-1.735817, 0.9733971, -2.635208, 1, 0.2588235, 0, 1,
-1.732237, 0.6401537, -1.974258, 1, 0.2627451, 0, 1,
-1.719516, 0.1864714, 0.6107022, 1, 0.2705882, 0, 1,
-1.697257, 0.2077317, -0.9102974, 1, 0.2745098, 0, 1,
-1.679679, 1.20021, -2.3867, 1, 0.282353, 0, 1,
-1.664446, -0.4843096, -1.617794, 1, 0.2862745, 0, 1,
-1.638453, 0.6990778, -0.3320378, 1, 0.2941177, 0, 1,
-1.5985, -0.2772637, -1.000895, 1, 0.3019608, 0, 1,
-1.598369, 1.699546, -1.887277, 1, 0.3058824, 0, 1,
-1.596829, -0.4620267, -2.712765, 1, 0.3137255, 0, 1,
-1.576232, 0.3396811, -3.937678, 1, 0.3176471, 0, 1,
-1.574778, -0.03072199, -0.5673077, 1, 0.3254902, 0, 1,
-1.557588, -0.5426978, -2.621459, 1, 0.3294118, 0, 1,
-1.553496, 0.3962081, -1.036316, 1, 0.3372549, 0, 1,
-1.548539, -1.445402, -1.618717, 1, 0.3411765, 0, 1,
-1.528134, 0.003893734, -2.321634, 1, 0.3490196, 0, 1,
-1.52732, 0.1642018, -2.395744, 1, 0.3529412, 0, 1,
-1.515173, 0.1234746, -1.909893, 1, 0.3607843, 0, 1,
-1.509117, -0.7798122, -1.112579, 1, 0.3647059, 0, 1,
-1.495602, -1.280457, -0.8965309, 1, 0.372549, 0, 1,
-1.493552, -0.9807387, -1.858463, 1, 0.3764706, 0, 1,
-1.481372, -0.114501, -0.9715061, 1, 0.3843137, 0, 1,
-1.480918, 0.5849693, -0.7064791, 1, 0.3882353, 0, 1,
-1.477821, -1.52494, -1.40249, 1, 0.3960784, 0, 1,
-1.477307, 0.8853876, -1.024631, 1, 0.4039216, 0, 1,
-1.447496, 1.123784, -0.008792631, 1, 0.4078431, 0, 1,
-1.444588, -0.1674499, -1.644232, 1, 0.4156863, 0, 1,
-1.423355, -1.076312, -1.71476, 1, 0.4196078, 0, 1,
-1.419586, -0.6176643, -2.395788, 1, 0.427451, 0, 1,
-1.419282, -0.8150266, -1.509429, 1, 0.4313726, 0, 1,
-1.416099, 1.615421, -0.2702391, 1, 0.4392157, 0, 1,
-1.410175, -0.9779491, -1.725585, 1, 0.4431373, 0, 1,
-1.397375, 1.088467, -2.348693, 1, 0.4509804, 0, 1,
-1.396975, 0.4501263, -1.713507, 1, 0.454902, 0, 1,
-1.383932, 0.106664, -2.025099, 1, 0.4627451, 0, 1,
-1.3809, 0.9152488, 0.1490315, 1, 0.4666667, 0, 1,
-1.376347, 1.431394, -1.486257, 1, 0.4745098, 0, 1,
-1.371385, 0.7416915, -1.28402, 1, 0.4784314, 0, 1,
-1.367954, -0.8152313, -2.118427, 1, 0.4862745, 0, 1,
-1.358234, 0.4001012, -2.240887, 1, 0.4901961, 0, 1,
-1.344931, 0.05416065, -0.8598015, 1, 0.4980392, 0, 1,
-1.344364, -1.89161, -4.979507, 1, 0.5058824, 0, 1,
-1.33497, 0.4339844, -1.759632, 1, 0.509804, 0, 1,
-1.325356, 1.272157, -0.8444794, 1, 0.5176471, 0, 1,
-1.325204, 0.1260738, -1.784527, 1, 0.5215687, 0, 1,
-1.317386, -0.06234378, -1.996054, 1, 0.5294118, 0, 1,
-1.310032, 0.305086, -1.017776, 1, 0.5333334, 0, 1,
-1.304215, 1.439858, -1.908885, 1, 0.5411765, 0, 1,
-1.296255, 1.366095, 1.266477, 1, 0.5450981, 0, 1,
-1.292606, 0.8945743, -0.7597636, 1, 0.5529412, 0, 1,
-1.287629, -0.8757336, -1.800707, 1, 0.5568628, 0, 1,
-1.287294, 2.257433, -1.112076, 1, 0.5647059, 0, 1,
-1.286769, -0.2339315, -3.517996, 1, 0.5686275, 0, 1,
-1.286362, -0.7434276, -2.04468, 1, 0.5764706, 0, 1,
-1.268988, -1.13458, -2.310826, 1, 0.5803922, 0, 1,
-1.265098, 0.5418834, -0.07206155, 1, 0.5882353, 0, 1,
-1.26325, 1.570883, -1.577077, 1, 0.5921569, 0, 1,
-1.252321, -0.4558909, -2.904862, 1, 0.6, 0, 1,
-1.245422, 1.714207, -0.8757818, 1, 0.6078432, 0, 1,
-1.24269, 0.2773774, -1.49018, 1, 0.6117647, 0, 1,
-1.24198, -1.397225, -2.297448, 1, 0.6196079, 0, 1,
-1.226868, 0.9587297, -0.5467829, 1, 0.6235294, 0, 1,
-1.223635, 2.081781, -2.95692, 1, 0.6313726, 0, 1,
-1.22345, 0.3520155, -0.9353206, 1, 0.6352941, 0, 1,
-1.222473, -1.316053, -1.263949, 1, 0.6431373, 0, 1,
-1.222272, -0.6389356, -1.547037, 1, 0.6470588, 0, 1,
-1.21527, -1.058765, -3.423155, 1, 0.654902, 0, 1,
-1.209159, 0.8487743, -1.912442, 1, 0.6588235, 0, 1,
-1.208303, -0.7230712, -0.8116013, 1, 0.6666667, 0, 1,
-1.203587, -1.906545, -4.136372, 1, 0.6705883, 0, 1,
-1.200251, 1.949583, -0.1479114, 1, 0.6784314, 0, 1,
-1.19665, -0.9500136, -1.365636, 1, 0.682353, 0, 1,
-1.196016, -0.8339894, -2.888897, 1, 0.6901961, 0, 1,
-1.189933, -0.01194175, 0.2318776, 1, 0.6941177, 0, 1,
-1.188, 0.8408456, 0.4656447, 1, 0.7019608, 0, 1,
-1.185742, 0.5357069, -1.242003, 1, 0.7098039, 0, 1,
-1.173091, 0.7612181, -0.4519807, 1, 0.7137255, 0, 1,
-1.168806, -0.4452552, -0.2861254, 1, 0.7215686, 0, 1,
-1.168198, -0.9649062, -0.9551002, 1, 0.7254902, 0, 1,
-1.164588, 0.79689, -1.06162, 1, 0.7333333, 0, 1,
-1.15419, -0.3333629, -1.298747, 1, 0.7372549, 0, 1,
-1.154121, 1.988999, 0.4097033, 1, 0.7450981, 0, 1,
-1.150494, 2.397954, 1.512938, 1, 0.7490196, 0, 1,
-1.147157, 0.6252488, -1.378083, 1, 0.7568628, 0, 1,
-1.142387, -0.6065329, -1.57369, 1, 0.7607843, 0, 1,
-1.142238, -0.753727, -3.125296, 1, 0.7686275, 0, 1,
-1.140662, 0.4604867, -0.2196763, 1, 0.772549, 0, 1,
-1.135084, 0.8772902, -0.4819483, 1, 0.7803922, 0, 1,
-1.132053, 0.2727541, -2.003523, 1, 0.7843137, 0, 1,
-1.131426, 1.086907, 0.3096173, 1, 0.7921569, 0, 1,
-1.130583, 1.179669, -0.07762806, 1, 0.7960784, 0, 1,
-1.129832, -1.239996, -3.231336, 1, 0.8039216, 0, 1,
-1.123965, -0.5123404, -1.955287, 1, 0.8117647, 0, 1,
-1.119439, -0.6033922, -0.08022503, 1, 0.8156863, 0, 1,
-1.116022, -0.09283418, -1.983832, 1, 0.8235294, 0, 1,
-1.103419, -0.783744, -2.779444, 1, 0.827451, 0, 1,
-1.09088, -1.366256, -3.522229, 1, 0.8352941, 0, 1,
-1.090627, 0.6611813, 0.5426878, 1, 0.8392157, 0, 1,
-1.086721, 0.6709375, -1.211302, 1, 0.8470588, 0, 1,
-1.080125, -0.5437222, -2.262497, 1, 0.8509804, 0, 1,
-1.078604, -1.461372, -1.988485, 1, 0.8588235, 0, 1,
-1.075584, 0.27335, -1.366771, 1, 0.8627451, 0, 1,
-1.07558, -1.678278, -1.307492, 1, 0.8705882, 0, 1,
-1.073918, -1.397004, 0.7873895, 1, 0.8745098, 0, 1,
-1.056188, -1.778886, -2.637217, 1, 0.8823529, 0, 1,
-1.054135, 0.4377052, -1.828081, 1, 0.8862745, 0, 1,
-1.05139, -1.19899, -1.447409, 1, 0.8941177, 0, 1,
-1.050338, -0.04702827, -1.054123, 1, 0.8980392, 0, 1,
-1.050295, -0.6574959, -2.363188, 1, 0.9058824, 0, 1,
-1.049758, 1.092556, 0.9471763, 1, 0.9137255, 0, 1,
-1.049351, 1.774273, -0.6586766, 1, 0.9176471, 0, 1,
-1.04657, -0.7935352, -0.1078423, 1, 0.9254902, 0, 1,
-1.041071, -0.6089261, -2.724427, 1, 0.9294118, 0, 1,
-1.025443, -0.3446328, -2.409639, 1, 0.9372549, 0, 1,
-1.023756, 0.01481439, -0.2603463, 1, 0.9411765, 0, 1,
-1.023551, 0.4030775, -0.444509, 1, 0.9490196, 0, 1,
-1.021301, 1.69309, -0.8048514, 1, 0.9529412, 0, 1,
-1.01823, -0.7113853, -2.388598, 1, 0.9607843, 0, 1,
-1.011903, -0.4816821, -1.780357, 1, 0.9647059, 0, 1,
-1.005359, -0.5188066, -1.901409, 1, 0.972549, 0, 1,
-1.002303, -0.9978772, -3.078782, 1, 0.9764706, 0, 1,
-0.9971735, -0.3222191, -0.7048506, 1, 0.9843137, 0, 1,
-0.9934061, -0.8039311, -2.860584, 1, 0.9882353, 0, 1,
-0.9920763, 0.3161846, 0.03534052, 1, 0.9960784, 0, 1,
-0.9882619, -1.171957, -2.712275, 0.9960784, 1, 0, 1,
-0.9831759, 0.2298816, 0.05337669, 0.9921569, 1, 0, 1,
-0.9805966, 0.2365863, -1.671461, 0.9843137, 1, 0, 1,
-0.9681289, -0.2525881, -2.63619, 0.9803922, 1, 0, 1,
-0.9541615, -2.173452, -1.250253, 0.972549, 1, 0, 1,
-0.9475066, 0.5710179, -0.3848698, 0.9686275, 1, 0, 1,
-0.9453967, -0.2417214, -3.047822, 0.9607843, 1, 0, 1,
-0.9367211, 1.815398, 0.1148792, 0.9568627, 1, 0, 1,
-0.9349878, 0.3242558, -2.611426, 0.9490196, 1, 0, 1,
-0.9337552, 0.7099659, 0.8150861, 0.945098, 1, 0, 1,
-0.9332197, 0.1421613, -2.532524, 0.9372549, 1, 0, 1,
-0.9318022, 0.9966944, 0.0867481, 0.9333333, 1, 0, 1,
-0.9249389, 0.4171125, -1.836164, 0.9254902, 1, 0, 1,
-0.9179599, -1.475344, -3.863947, 0.9215686, 1, 0, 1,
-0.9161923, -1.303116, -3.214926, 0.9137255, 1, 0, 1,
-0.9143447, 0.4759814, -1.313097, 0.9098039, 1, 0, 1,
-0.908975, 0.1015197, -2.589715, 0.9019608, 1, 0, 1,
-0.9035077, -1.032583, -2.010468, 0.8941177, 1, 0, 1,
-0.9017299, -3.568908, -3.897832, 0.8901961, 1, 0, 1,
-0.8917189, -0.03907144, -2.219544, 0.8823529, 1, 0, 1,
-0.891623, 0.9654045, 0.2314327, 0.8784314, 1, 0, 1,
-0.8899506, -0.2107153, -1.679003, 0.8705882, 1, 0, 1,
-0.888824, 0.354989, -1.860884, 0.8666667, 1, 0, 1,
-0.8846321, -0.3970677, -2.904831, 0.8588235, 1, 0, 1,
-0.8828833, -0.106813, -2.762852, 0.854902, 1, 0, 1,
-0.88177, -1.457586, -1.186755, 0.8470588, 1, 0, 1,
-0.8814358, 1.34558, 0.2792726, 0.8431373, 1, 0, 1,
-0.871657, -0.7719407, -2.933746, 0.8352941, 1, 0, 1,
-0.8703081, 0.618008, -1.138709, 0.8313726, 1, 0, 1,
-0.8658648, -2.433354, -1.337748, 0.8235294, 1, 0, 1,
-0.8648039, 0.4746029, -1.557474, 0.8196079, 1, 0, 1,
-0.8619085, -2.024715, -2.506104, 0.8117647, 1, 0, 1,
-0.8602197, 0.04853615, -0.1393456, 0.8078431, 1, 0, 1,
-0.8571874, -1.693095, -1.633386, 0.8, 1, 0, 1,
-0.8550783, -0.7983274, -2.399803, 0.7921569, 1, 0, 1,
-0.8543876, -0.5536536, -1.399811, 0.7882353, 1, 0, 1,
-0.8478711, -0.6070132, -4.312643, 0.7803922, 1, 0, 1,
-0.8474607, 0.9316423, 0.2513981, 0.7764706, 1, 0, 1,
-0.8439636, -1.191635, -1.545346, 0.7686275, 1, 0, 1,
-0.8429865, -1.043275, -2.72674, 0.7647059, 1, 0, 1,
-0.8404182, -1.00679, -4.067199, 0.7568628, 1, 0, 1,
-0.83314, -0.06830876, 0.1772499, 0.7529412, 1, 0, 1,
-0.8283664, 0.2489816, -2.466105, 0.7450981, 1, 0, 1,
-0.8053307, 0.5417058, -3.17288, 0.7411765, 1, 0, 1,
-0.802851, -0.1116557, -1.180478, 0.7333333, 1, 0, 1,
-0.7993921, -0.08683144, -1.726325, 0.7294118, 1, 0, 1,
-0.79399, -1.161528, -1.956367, 0.7215686, 1, 0, 1,
-0.7860363, -0.8094817, -4.239968, 0.7176471, 1, 0, 1,
-0.7840737, -1.090152, -2.743373, 0.7098039, 1, 0, 1,
-0.7762947, 1.019857, -1.016881, 0.7058824, 1, 0, 1,
-0.7750395, 0.1190274, -0.6112133, 0.6980392, 1, 0, 1,
-0.773726, 1.591718, -0.4944205, 0.6901961, 1, 0, 1,
-0.7692249, -0.02072759, -1.91584, 0.6862745, 1, 0, 1,
-0.7687337, -0.4344349, -1.234937, 0.6784314, 1, 0, 1,
-0.7668996, 0.6970589, -1.704443, 0.6745098, 1, 0, 1,
-0.7533047, 1.136683, -0.1514184, 0.6666667, 1, 0, 1,
-0.7527426, -1.08476, -3.767029, 0.6627451, 1, 0, 1,
-0.7518795, -0.5183927, -1.817239, 0.654902, 1, 0, 1,
-0.7517734, 0.6444843, -0.9074423, 0.6509804, 1, 0, 1,
-0.7504417, 0.6928847, -1.64042, 0.6431373, 1, 0, 1,
-0.7497633, 0.7117192, -1.01097, 0.6392157, 1, 0, 1,
-0.7476256, 0.06476475, -0.2191246, 0.6313726, 1, 0, 1,
-0.7463571, -0.4178129, -2.163729, 0.627451, 1, 0, 1,
-0.7408066, 0.7289015, -0.03487302, 0.6196079, 1, 0, 1,
-0.7385778, -0.4715985, -1.730772, 0.6156863, 1, 0, 1,
-0.7360168, 0.6529459, -1.409297, 0.6078432, 1, 0, 1,
-0.7351311, 1.116264, 0.495109, 0.6039216, 1, 0, 1,
-0.7332438, -0.09603283, -1.798027, 0.5960785, 1, 0, 1,
-0.7229949, -0.6047465, -4.193428, 0.5882353, 1, 0, 1,
-0.7189222, 0.8707055, -0.3640647, 0.5843138, 1, 0, 1,
-0.712607, -0.4305343, -1.745452, 0.5764706, 1, 0, 1,
-0.7079154, -0.5409745, -4.042571, 0.572549, 1, 0, 1,
-0.7058564, -0.4914329, -1.563544, 0.5647059, 1, 0, 1,
-0.7039399, -0.5297537, -0.6546044, 0.5607843, 1, 0, 1,
-0.6980006, 1.079502, -1.241883, 0.5529412, 1, 0, 1,
-0.6923347, 0.3591186, -2.108649, 0.5490196, 1, 0, 1,
-0.6882411, -2.297048, -0.7325209, 0.5411765, 1, 0, 1,
-0.687271, -0.3845919, -2.393851, 0.5372549, 1, 0, 1,
-0.6862836, 0.03692159, -2.591244, 0.5294118, 1, 0, 1,
-0.6736342, -0.4886927, -2.880362, 0.5254902, 1, 0, 1,
-0.6727509, 1.612687, 0.3692464, 0.5176471, 1, 0, 1,
-0.6709495, 0.04339438, -2.329899, 0.5137255, 1, 0, 1,
-0.6621271, 0.6345981, -0.5579109, 0.5058824, 1, 0, 1,
-0.6606709, -0.1989471, -2.129218, 0.5019608, 1, 0, 1,
-0.6604399, -1.671396, -2.736114, 0.4941176, 1, 0, 1,
-0.657393, 0.3939555, 0.3835776, 0.4862745, 1, 0, 1,
-0.6527222, -2.727164, -3.693753, 0.4823529, 1, 0, 1,
-0.6492424, -0.3262698, -1.432158, 0.4745098, 1, 0, 1,
-0.6479722, -0.5521005, -3.572023, 0.4705882, 1, 0, 1,
-0.6476415, 0.5363401, -1.246044, 0.4627451, 1, 0, 1,
-0.6441583, 1.347485, -0.2860783, 0.4588235, 1, 0, 1,
-0.6325544, -0.6298715, -2.40732, 0.4509804, 1, 0, 1,
-0.631062, -0.7539055, -1.015126, 0.4470588, 1, 0, 1,
-0.630686, -1.539253, -2.695267, 0.4392157, 1, 0, 1,
-0.6302522, 0.6666991, -1.039582, 0.4352941, 1, 0, 1,
-0.6253129, 1.62182, -1.620372, 0.427451, 1, 0, 1,
-0.6164698, -0.9803828, -3.189987, 0.4235294, 1, 0, 1,
-0.6158633, 1.328973, -1.076923, 0.4156863, 1, 0, 1,
-0.6145827, -0.7532344, -2.214251, 0.4117647, 1, 0, 1,
-0.610485, -0.4463184, -1.801196, 0.4039216, 1, 0, 1,
-0.6083968, 0.2079447, -0.3103679, 0.3960784, 1, 0, 1,
-0.6069246, 1.064655, -0.5263971, 0.3921569, 1, 0, 1,
-0.5948974, 0.881189, 0.278795, 0.3843137, 1, 0, 1,
-0.5944852, 0.4398428, -1.403792, 0.3803922, 1, 0, 1,
-0.5943541, -0.2270399, -1.457823, 0.372549, 1, 0, 1,
-0.5940169, -0.7317787, -2.191652, 0.3686275, 1, 0, 1,
-0.5937428, 0.1543154, -0.4808156, 0.3607843, 1, 0, 1,
-0.5935847, 0.7862705, 0.02168792, 0.3568628, 1, 0, 1,
-0.5835816, 0.6123638, -0.3291741, 0.3490196, 1, 0, 1,
-0.5732877, 0.06197094, -1.436361, 0.345098, 1, 0, 1,
-0.5699687, 0.2364815, -1.980208, 0.3372549, 1, 0, 1,
-0.5659046, 0.8243278, -2.422304, 0.3333333, 1, 0, 1,
-0.5654432, -1.039743, -3.66685, 0.3254902, 1, 0, 1,
-0.564658, 0.7049704, -0.08645879, 0.3215686, 1, 0, 1,
-0.5564648, 0.4980651, -1.626057, 0.3137255, 1, 0, 1,
-0.5558094, -0.2696722, -3.316637, 0.3098039, 1, 0, 1,
-0.5536227, -0.3873061, -2.452869, 0.3019608, 1, 0, 1,
-0.5449873, 0.9489098, -0.8282773, 0.2941177, 1, 0, 1,
-0.5445865, -0.5717661, -1.694513, 0.2901961, 1, 0, 1,
-0.5440081, -0.9625543, -2.286987, 0.282353, 1, 0, 1,
-0.5422065, 0.1770347, -0.3080123, 0.2784314, 1, 0, 1,
-0.5417488, -0.1825556, -3.051023, 0.2705882, 1, 0, 1,
-0.5403787, -0.3176047, -4.205232, 0.2666667, 1, 0, 1,
-0.5403439, -0.5693117, -0.4154488, 0.2588235, 1, 0, 1,
-0.5399821, -0.312798, -2.067006, 0.254902, 1, 0, 1,
-0.5370825, 0.4931181, -2.046745, 0.2470588, 1, 0, 1,
-0.5364586, 1.853657, -1.265881, 0.2431373, 1, 0, 1,
-0.5327263, -1.62672, -3.01579, 0.2352941, 1, 0, 1,
-0.5225273, 0.2786581, -0.1338302, 0.2313726, 1, 0, 1,
-0.5208275, 1.063884, -1.504999, 0.2235294, 1, 0, 1,
-0.5113329, 2.51762, 0.407807, 0.2196078, 1, 0, 1,
-0.5091885, 0.5462639, -0.7418525, 0.2117647, 1, 0, 1,
-0.5082331, -2.294372, -4.680006, 0.2078431, 1, 0, 1,
-0.5060128, -0.2904613, -3.957139, 0.2, 1, 0, 1,
-0.5058311, 0.1013618, -1.327319, 0.1921569, 1, 0, 1,
-0.5038975, 0.9744859, 0.08390848, 0.1882353, 1, 0, 1,
-0.4997128, -0.2775601, -4.08426, 0.1803922, 1, 0, 1,
-0.4982932, 1.146459, -1.850409, 0.1764706, 1, 0, 1,
-0.4960067, -0.3241906, -2.63684, 0.1686275, 1, 0, 1,
-0.4952115, 0.4408931, -0.5593625, 0.1647059, 1, 0, 1,
-0.4941809, -1.253587, -3.989109, 0.1568628, 1, 0, 1,
-0.4927758, 0.3585734, -0.1224449, 0.1529412, 1, 0, 1,
-0.4884512, -0.3872781, -2.220925, 0.145098, 1, 0, 1,
-0.4866399, -0.2492936, -2.262944, 0.1411765, 1, 0, 1,
-0.4848332, -1.069419, -1.823921, 0.1333333, 1, 0, 1,
-0.4835307, -0.5041009, -2.067715, 0.1294118, 1, 0, 1,
-0.4823103, 0.6839508, 0.005824705, 0.1215686, 1, 0, 1,
-0.4809651, -1.166095, -2.575221, 0.1176471, 1, 0, 1,
-0.4805278, -0.9814136, -2.419901, 0.1098039, 1, 0, 1,
-0.4773622, 0.1765428, -1.789078, 0.1058824, 1, 0, 1,
-0.4770635, -2.029653, -3.40508, 0.09803922, 1, 0, 1,
-0.4723336, -1.542897, -2.325032, 0.09019608, 1, 0, 1,
-0.4719636, -0.669626, -2.912794, 0.08627451, 1, 0, 1,
-0.4691387, 0.1188099, -2.833088, 0.07843138, 1, 0, 1,
-0.4650073, -0.9538248, -2.696938, 0.07450981, 1, 0, 1,
-0.4584042, -0.7860315, -2.488536, 0.06666667, 1, 0, 1,
-0.4582261, 1.03404, 1.055533, 0.0627451, 1, 0, 1,
-0.4567819, 0.063581, 0.1816116, 0.05490196, 1, 0, 1,
-0.4534591, 0.9211568, 0.8599184, 0.05098039, 1, 0, 1,
-0.4529003, -1.965801, -2.465601, 0.04313726, 1, 0, 1,
-0.4492051, 0.7469898, -0.02806028, 0.03921569, 1, 0, 1,
-0.4487473, -2.495213, -2.133826, 0.03137255, 1, 0, 1,
-0.4468185, 0.01793764, -1.065315, 0.02745098, 1, 0, 1,
-0.4415734, -0.02147536, -0.975793, 0.01960784, 1, 0, 1,
-0.4404106, -0.6267523, -2.207934, 0.01568628, 1, 0, 1,
-0.4382669, -1.536128, -4.934598, 0.007843138, 1, 0, 1,
-0.4378577, -1.166533, -4.194492, 0.003921569, 1, 0, 1,
-0.4374221, -1.15805, -2.4809, 0, 1, 0.003921569, 1,
-0.4352122, 0.6949521, -0.4631462, 0, 1, 0.01176471, 1,
-0.4350502, 0.1592231, -1.450413, 0, 1, 0.01568628, 1,
-0.4312032, 0.8033943, -0.5330191, 0, 1, 0.02352941, 1,
-0.4277263, -0.3871349, -2.828607, 0, 1, 0.02745098, 1,
-0.4266288, -0.2964247, -3.135162, 0, 1, 0.03529412, 1,
-0.4244107, 0.6114596, 0.2787473, 0, 1, 0.03921569, 1,
-0.4236952, -1.234693, -2.944167, 0, 1, 0.04705882, 1,
-0.418577, -1.724515, -3.514324, 0, 1, 0.05098039, 1,
-0.4169298, -0.4035325, -2.611382, 0, 1, 0.05882353, 1,
-0.416079, -0.5542288, -2.798247, 0, 1, 0.0627451, 1,
-0.4151258, -1.488613, -2.659135, 0, 1, 0.07058824, 1,
-0.4107171, 0.7254835, -0.4956212, 0, 1, 0.07450981, 1,
-0.4070168, -0.08478623, -2.052615, 0, 1, 0.08235294, 1,
-0.402142, -0.8918142, -2.579953, 0, 1, 0.08627451, 1,
-0.4001179, 0.09353634, -1.384225, 0, 1, 0.09411765, 1,
-0.3990591, -2.75612, -1.440879, 0, 1, 0.1019608, 1,
-0.3986717, -0.2594565, -0.9471361, 0, 1, 0.1058824, 1,
-0.3984586, 0.9630475, -0.3728712, 0, 1, 0.1137255, 1,
-0.3962819, -1.722091, -1.414965, 0, 1, 0.1176471, 1,
-0.3945526, -0.1745966, -0.9699494, 0, 1, 0.1254902, 1,
-0.3921692, 0.5722304, -0.706359, 0, 1, 0.1294118, 1,
-0.3871919, -0.8922762, -4.400015, 0, 1, 0.1372549, 1,
-0.38634, 1.779004, 0.296258, 0, 1, 0.1411765, 1,
-0.386264, 0.7401356, 1.259716, 0, 1, 0.1490196, 1,
-0.3860203, 1.4363, -0.5055957, 0, 1, 0.1529412, 1,
-0.3835821, -0.9334675, -3.430421, 0, 1, 0.1607843, 1,
-0.3817227, -0.04745578, -3.950951, 0, 1, 0.1647059, 1,
-0.3774011, 0.2742797, -0.7172324, 0, 1, 0.172549, 1,
-0.3766749, -0.2275953, -1.780156, 0, 1, 0.1764706, 1,
-0.3758157, 0.123617, -0.313087, 0, 1, 0.1843137, 1,
-0.3725255, -0.6344979, -1.415109, 0, 1, 0.1882353, 1,
-0.3659774, 2.488338, 0.2049991, 0, 1, 0.1960784, 1,
-0.3646467, -0.3469648, -4.121732, 0, 1, 0.2039216, 1,
-0.361738, 0.19095, -0.2963892, 0, 1, 0.2078431, 1,
-0.3615273, 0.7066157, 1.636697, 0, 1, 0.2156863, 1,
-0.3611215, -0.1033935, -2.883052, 0, 1, 0.2196078, 1,
-0.3569615, -1.555653, -4.858448, 0, 1, 0.227451, 1,
-0.3562391, -0.443325, -1.202846, 0, 1, 0.2313726, 1,
-0.3546106, -0.7679662, -2.233679, 0, 1, 0.2392157, 1,
-0.3508927, -1.530131, -4.023953, 0, 1, 0.2431373, 1,
-0.3507706, -0.5162029, -3.927605, 0, 1, 0.2509804, 1,
-0.3494008, 1.177312, -1.084281, 0, 1, 0.254902, 1,
-0.3442612, 1.05601, 0.06606159, 0, 1, 0.2627451, 1,
-0.3423572, 0.9756209, -1.159339, 0, 1, 0.2666667, 1,
-0.3366631, -0.1934448, -1.458031, 0, 1, 0.2745098, 1,
-0.3360478, -1.066528, -2.522549, 0, 1, 0.2784314, 1,
-0.3359236, -0.03624224, -2.509086, 0, 1, 0.2862745, 1,
-0.3334581, 1.033151, -1.176466, 0, 1, 0.2901961, 1,
-0.3233087, -0.7312198, -2.538896, 0, 1, 0.2980392, 1,
-0.3217018, 1.731775, 0.3762265, 0, 1, 0.3058824, 1,
-0.319483, 0.6733975, -2.238066, 0, 1, 0.3098039, 1,
-0.3134996, 0.1528545, -3.329484, 0, 1, 0.3176471, 1,
-0.3095974, 0.4730526, -1.688125, 0, 1, 0.3215686, 1,
-0.3089774, -0.3970312, -2.749064, 0, 1, 0.3294118, 1,
-0.3086146, 0.8367774, 0.5041922, 0, 1, 0.3333333, 1,
-0.3075891, -0.004618037, -2.666614, 0, 1, 0.3411765, 1,
-0.3073147, -0.3717122, -2.42137, 0, 1, 0.345098, 1,
-0.3046904, 0.4241418, -0.5732356, 0, 1, 0.3529412, 1,
-0.3016416, -0.9142399, -2.525955, 0, 1, 0.3568628, 1,
-0.2980603, 1.019763, 1.529218, 0, 1, 0.3647059, 1,
-0.2924966, 0.6131335, -0.7452408, 0, 1, 0.3686275, 1,
-0.2923883, 1.329058, -0.01162809, 0, 1, 0.3764706, 1,
-0.2895211, -1.643483, -3.31562, 0, 1, 0.3803922, 1,
-0.2794218, -0.3609466, -2.508077, 0, 1, 0.3882353, 1,
-0.2777356, -0.09928171, -1.324341, 0, 1, 0.3921569, 1,
-0.2723716, 0.2614699, -0.3362448, 0, 1, 0.4, 1,
-0.2695863, -0.1616292, -1.285679, 0, 1, 0.4078431, 1,
-0.2691828, -0.0102366, -0.4795351, 0, 1, 0.4117647, 1,
-0.2688154, 0.3743714, -0.6226355, 0, 1, 0.4196078, 1,
-0.2681649, 1.304017, 0.8237839, 0, 1, 0.4235294, 1,
-0.2632278, -0.8901204, -3.217869, 0, 1, 0.4313726, 1,
-0.2630108, 0.9107304, 0.2466677, 0, 1, 0.4352941, 1,
-0.2596156, -1.28936, -2.407224, 0, 1, 0.4431373, 1,
-0.2577312, 1.528455, -0.6451451, 0, 1, 0.4470588, 1,
-0.2534766, 1.380075, 0.4282011, 0, 1, 0.454902, 1,
-0.2504306, -1.481183, -4.242462, 0, 1, 0.4588235, 1,
-0.249708, 0.03850407, -3.164437, 0, 1, 0.4666667, 1,
-0.2486833, 1.911198, 1.409457, 0, 1, 0.4705882, 1,
-0.248081, 0.9359541, -2.36812, 0, 1, 0.4784314, 1,
-0.2478941, 0.6369393, 0.3277266, 0, 1, 0.4823529, 1,
-0.2469125, -1.767877, -3.95681, 0, 1, 0.4901961, 1,
-0.2468708, 0.6746886, -1.387271, 0, 1, 0.4941176, 1,
-0.2427348, -1.385798, -4.377936, 0, 1, 0.5019608, 1,
-0.2424691, 0.6108938, -0.6273497, 0, 1, 0.509804, 1,
-0.2404477, -0.5300226, -1.969546, 0, 1, 0.5137255, 1,
-0.2369036, -0.6362522, -5.621338, 0, 1, 0.5215687, 1,
-0.235429, -0.2197942, -2.760104, 0, 1, 0.5254902, 1,
-0.2351526, -0.1169847, -2.129721, 0, 1, 0.5333334, 1,
-0.2351512, -0.5318225, -4.107311, 0, 1, 0.5372549, 1,
-0.2347451, -0.9246903, -2.789033, 0, 1, 0.5450981, 1,
-0.2314813, -0.4659568, -1.938936, 0, 1, 0.5490196, 1,
-0.2216546, -1.544386, -3.695761, 0, 1, 0.5568628, 1,
-0.2214416, -0.1773727, -0.1109338, 0, 1, 0.5607843, 1,
-0.2175069, 0.7242263, -0.9236515, 0, 1, 0.5686275, 1,
-0.2140358, 0.04327799, -2.842615, 0, 1, 0.572549, 1,
-0.2139177, 0.1986566, -1.005233, 0, 1, 0.5803922, 1,
-0.2123311, 2.017486, -1.077137, 0, 1, 0.5843138, 1,
-0.2118159, -1.754407, -2.786412, 0, 1, 0.5921569, 1,
-0.2053585, 0.8714095, -0.9305921, 0, 1, 0.5960785, 1,
-0.2044066, -0.1823465, -1.531074, 0, 1, 0.6039216, 1,
-0.2001384, 0.6927614, -0.5931048, 0, 1, 0.6117647, 1,
-0.1984317, 1.264466, 1.934524, 0, 1, 0.6156863, 1,
-0.195265, 0.4440705, 0.0562313, 0, 1, 0.6235294, 1,
-0.188577, 0.8414987, -2.879735, 0, 1, 0.627451, 1,
-0.1827338, -0.3979165, -4.36561, 0, 1, 0.6352941, 1,
-0.1805173, 2.586052, -0.1444532, 0, 1, 0.6392157, 1,
-0.1802838, -0.005514115, -2.906545, 0, 1, 0.6470588, 1,
-0.1766241, 1.084167, -0.8546728, 0, 1, 0.6509804, 1,
-0.1765555, -1.939574, -2.802958, 0, 1, 0.6588235, 1,
-0.1695732, 0.7108586, 0.6689886, 0, 1, 0.6627451, 1,
-0.1678964, -0.04311367, -1.969727, 0, 1, 0.6705883, 1,
-0.1644426, -0.07821274, -2.082841, 0, 1, 0.6745098, 1,
-0.1601714, -1.286704, -3.812773, 0, 1, 0.682353, 1,
-0.1592171, -0.5151099, -2.022997, 0, 1, 0.6862745, 1,
-0.1487636, -1.463155, -1.415687, 0, 1, 0.6941177, 1,
-0.1485006, 3.024992, 0.6666759, 0, 1, 0.7019608, 1,
-0.1357329, 1.056681, 0.7462604, 0, 1, 0.7058824, 1,
-0.133713, -0.07745596, -1.619844, 0, 1, 0.7137255, 1,
-0.1273756, 1.209881, 0.4275616, 0, 1, 0.7176471, 1,
-0.1266261, -1.613969, -1.221536, 0, 1, 0.7254902, 1,
-0.1262143, -0.682531, -3.919791, 0, 1, 0.7294118, 1,
-0.1209329, 1.062849, 1.028488, 0, 1, 0.7372549, 1,
-0.1196088, -2.229792, -3.985892, 0, 1, 0.7411765, 1,
-0.1193968, 0.3482357, -2.098019, 0, 1, 0.7490196, 1,
-0.1139345, -0.2708089, -3.195591, 0, 1, 0.7529412, 1,
-0.1121408, -0.04462496, -3.096509, 0, 1, 0.7607843, 1,
-0.1119799, -0.05597411, 0.8170692, 0, 1, 0.7647059, 1,
-0.1093881, -1.219986, -3.975792, 0, 1, 0.772549, 1,
-0.107585, 0.4490782, -1.04112, 0, 1, 0.7764706, 1,
-0.1062314, 1.266745, 0.9050207, 0, 1, 0.7843137, 1,
-0.1059853, -1.715504, -2.612633, 0, 1, 0.7882353, 1,
-0.1054197, -0.5520127, -0.4742482, 0, 1, 0.7960784, 1,
-0.1044873, 0.6518595, -0.120229, 0, 1, 0.8039216, 1,
-0.09273358, 0.4900156, -1.577644, 0, 1, 0.8078431, 1,
-0.09169292, -0.4461442, -2.654884, 0, 1, 0.8156863, 1,
-0.08953159, 0.4661835, -0.7175599, 0, 1, 0.8196079, 1,
-0.0891946, -0.5592786, -2.142724, 0, 1, 0.827451, 1,
-0.08897346, 1.236793, 2.719764, 0, 1, 0.8313726, 1,
-0.08874219, -1.166691, -3.839035, 0, 1, 0.8392157, 1,
-0.08431853, 1.342245, 1.551028, 0, 1, 0.8431373, 1,
-0.08409982, -0.4588029, -3.351323, 0, 1, 0.8509804, 1,
-0.08361553, -0.9084697, -2.390528, 0, 1, 0.854902, 1,
-0.08357354, -0.2488907, -4.269261, 0, 1, 0.8627451, 1,
-0.07951418, -1.475969, -3.606639, 0, 1, 0.8666667, 1,
-0.07894014, -1.350031, -3.286834, 0, 1, 0.8745098, 1,
-0.07892831, 0.3147331, 0.05889546, 0, 1, 0.8784314, 1,
-0.07823624, -0.1283154, -2.35413, 0, 1, 0.8862745, 1,
-0.07515938, 0.7325981, 0.4260077, 0, 1, 0.8901961, 1,
-0.07501261, -0.4844386, -3.795622, 0, 1, 0.8980392, 1,
-0.07315837, 1.336505, -1.737438, 0, 1, 0.9058824, 1,
-0.07119257, -1.455482, -1.709326, 0, 1, 0.9098039, 1,
-0.06914269, 1.274177, -1.014329, 0, 1, 0.9176471, 1,
-0.06731006, 0.4971843, 2.283132, 0, 1, 0.9215686, 1,
-0.06048679, 0.5193687, -1.69847, 0, 1, 0.9294118, 1,
-0.05931067, -0.4503788, -0.7846016, 0, 1, 0.9333333, 1,
-0.05899327, -0.0335389, -0.4763672, 0, 1, 0.9411765, 1,
-0.0553313, -1.818424, -3.280969, 0, 1, 0.945098, 1,
-0.05094082, -0.3494304, -3.359899, 0, 1, 0.9529412, 1,
-0.05093687, -0.5466751, -2.693578, 0, 1, 0.9568627, 1,
-0.0490111, -0.6968995, -3.334553, 0, 1, 0.9647059, 1,
-0.04465511, 0.8095483, -0.3304683, 0, 1, 0.9686275, 1,
-0.04153375, -0.9122126, -2.807238, 0, 1, 0.9764706, 1,
-0.04108328, 0.9812444, 1.552283, 0, 1, 0.9803922, 1,
-0.03577519, 0.6983938, 0.1578646, 0, 1, 0.9882353, 1,
-0.03562141, -0.1178066, -4.304472, 0, 1, 0.9921569, 1,
-0.0341373, -0.5705249, -1.911564, 0, 1, 1, 1,
-0.03140217, 0.6789568, -0.4260533, 0, 0.9921569, 1, 1,
-0.03101387, -0.2740266, -1.17564, 0, 0.9882353, 1, 1,
-0.03026291, 2.105317, -0.1873297, 0, 0.9803922, 1, 1,
-0.03016824, 0.3249373, -0.2245862, 0, 0.9764706, 1, 1,
-0.02445873, 0.2227464, -0.8973218, 0, 0.9686275, 1, 1,
-0.02377794, -1.033564, -2.275783, 0, 0.9647059, 1, 1,
-0.01859378, 0.4852713, 2.125569, 0, 0.9568627, 1, 1,
-0.01785968, 1.206778, 0.2361794, 0, 0.9529412, 1, 1,
-0.008965872, -1.404696, -2.607264, 0, 0.945098, 1, 1,
-0.00595502, -1.203346, -2.329362, 0, 0.9411765, 1, 1,
-0.001615848, -0.672675, -2.721076, 0, 0.9333333, 1, 1,
0.002528752, 1.583922, -0.5536255, 0, 0.9294118, 1, 1,
0.003048051, -0.1992572, 4.285254, 0, 0.9215686, 1, 1,
0.003700601, 0.9780688, 0.5459782, 0, 0.9176471, 1, 1,
0.007069799, -0.202456, 2.798242, 0, 0.9098039, 1, 1,
0.00808735, 0.5647143, -0.7521799, 0, 0.9058824, 1, 1,
0.01334597, -0.2258056, 1.639406, 0, 0.8980392, 1, 1,
0.01628999, 0.8634905, 1.491952, 0, 0.8901961, 1, 1,
0.01770374, 0.9673643, -1.370532, 0, 0.8862745, 1, 1,
0.02179883, 0.9464779, 1.757189, 0, 0.8784314, 1, 1,
0.02830664, -0.9097863, 2.55955, 0, 0.8745098, 1, 1,
0.02934266, -0.3889691, 4.3044, 0, 0.8666667, 1, 1,
0.03113629, -0.5452114, 4.678439, 0, 0.8627451, 1, 1,
0.03978516, -0.07055915, 2.953466, 0, 0.854902, 1, 1,
0.04110738, 0.5053283, -0.5532774, 0, 0.8509804, 1, 1,
0.04178202, -0.5662724, 2.168642, 0, 0.8431373, 1, 1,
0.04469215, 1.477335, -0.2799513, 0, 0.8392157, 1, 1,
0.04872707, -0.3590543, 0.4653728, 0, 0.8313726, 1, 1,
0.05012485, 0.7295135, -1.076113, 0, 0.827451, 1, 1,
0.0524848, -0.2942378, 0.6903418, 0, 0.8196079, 1, 1,
0.0525235, -1.549215, 2.506579, 0, 0.8156863, 1, 1,
0.06234216, 0.5362886, 0.8359843, 0, 0.8078431, 1, 1,
0.06594565, 0.9099975, 0.1224567, 0, 0.8039216, 1, 1,
0.0662454, 0.5728226, 0.3431652, 0, 0.7960784, 1, 1,
0.0693474, 0.2029188, 0.1045218, 0, 0.7882353, 1, 1,
0.07051802, -0.7428024, 1.049779, 0, 0.7843137, 1, 1,
0.07085864, -0.3917693, 1.003991, 0, 0.7764706, 1, 1,
0.07238761, -0.1006598, 1.729929, 0, 0.772549, 1, 1,
0.07356314, 1.391479, 0.3803724, 0, 0.7647059, 1, 1,
0.07590572, 1.515475, -1.597966, 0, 0.7607843, 1, 1,
0.08440054, 0.5768995, -1.684105, 0, 0.7529412, 1, 1,
0.08616301, 0.4020054, -0.948982, 0, 0.7490196, 1, 1,
0.09029672, -0.1753809, 2.959511, 0, 0.7411765, 1, 1,
0.0903358, -1.707874, 2.424909, 0, 0.7372549, 1, 1,
0.09232899, 1.293881, 0.181995, 0, 0.7294118, 1, 1,
0.09756297, -0.8541711, 1.642224, 0, 0.7254902, 1, 1,
0.09785427, -0.3376264, 3.699714, 0, 0.7176471, 1, 1,
0.09819748, -0.8653855, 3.221499, 0, 0.7137255, 1, 1,
0.09908328, -2.280885, 1.543657, 0, 0.7058824, 1, 1,
0.1005942, -0.02436347, 0.5403611, 0, 0.6980392, 1, 1,
0.1007835, 0.7351276, -0.2977566, 0, 0.6941177, 1, 1,
0.1016756, -1.016589, 2.950586, 0, 0.6862745, 1, 1,
0.102661, -0.3109558, 3.277651, 0, 0.682353, 1, 1,
0.1164105, -1.042136, 4.203171, 0, 0.6745098, 1, 1,
0.1268369, 0.1480175, -1.241423, 0, 0.6705883, 1, 1,
0.1301699, 1.017991, 1.33666, 0, 0.6627451, 1, 1,
0.1344752, 0.2974845, 1.038701, 0, 0.6588235, 1, 1,
0.1366099, 1.214777, 0.3483718, 0, 0.6509804, 1, 1,
0.1369062, 0.1171245, 1.461037, 0, 0.6470588, 1, 1,
0.1379985, -0.9980248, 2.956253, 0, 0.6392157, 1, 1,
0.1398174, 0.7683489, -0.2276038, 0, 0.6352941, 1, 1,
0.1401578, 0.02543875, 1.983995, 0, 0.627451, 1, 1,
0.1422305, 0.6248522, 0.002171659, 0, 0.6235294, 1, 1,
0.1637293, -0.6068195, 4.218922, 0, 0.6156863, 1, 1,
0.1639959, 1.258133, 0.5896826, 0, 0.6117647, 1, 1,
0.1674691, -0.4494971, 2.427237, 0, 0.6039216, 1, 1,
0.1675482, -0.5547132, 3.951152, 0, 0.5960785, 1, 1,
0.1690098, 0.3462, -0.7445134, 0, 0.5921569, 1, 1,
0.16983, 0.5920711, 0.03955736, 0, 0.5843138, 1, 1,
0.170329, 0.2293899, -0.3022557, 0, 0.5803922, 1, 1,
0.1706856, -0.6154446, 3.238689, 0, 0.572549, 1, 1,
0.1752554, -1.205884, 2.581377, 0, 0.5686275, 1, 1,
0.180646, -2.009432, 3.143551, 0, 0.5607843, 1, 1,
0.1863343, -0.4445802, 2.317272, 0, 0.5568628, 1, 1,
0.1895199, 0.13185, 1.765922, 0, 0.5490196, 1, 1,
0.1901692, -2.663522, 3.520762, 0, 0.5450981, 1, 1,
0.1929347, -0.5303015, 2.50031, 0, 0.5372549, 1, 1,
0.1961436, -0.5696493, 3.272096, 0, 0.5333334, 1, 1,
0.1979773, 0.5748402, 0.6849037, 0, 0.5254902, 1, 1,
0.1989277, 2.005117, 0.4082397, 0, 0.5215687, 1, 1,
0.2040812, 1.122901, -0.1822878, 0, 0.5137255, 1, 1,
0.2043232, 1.378915, 0.4698617, 0, 0.509804, 1, 1,
0.2043374, 0.3236679, 0.1784261, 0, 0.5019608, 1, 1,
0.2052476, 0.2502499, 1.658681, 0, 0.4941176, 1, 1,
0.2104346, 0.6359237, -1.300691, 0, 0.4901961, 1, 1,
0.214193, 0.4623468, 0.2772233, 0, 0.4823529, 1, 1,
0.2147894, -0.1979376, 4.389488, 0, 0.4784314, 1, 1,
0.2153085, 0.2685342, 0.5353633, 0, 0.4705882, 1, 1,
0.2213912, -1.782422, 3.101346, 0, 0.4666667, 1, 1,
0.2214822, 0.6969113, 1.517067, 0, 0.4588235, 1, 1,
0.2225149, 0.6125876, 2.102726, 0, 0.454902, 1, 1,
0.2274374, -0.170872, 1.832916, 0, 0.4470588, 1, 1,
0.2276265, 0.5880194, 0.1221979, 0, 0.4431373, 1, 1,
0.2317295, 0.05394098, 2.709878, 0, 0.4352941, 1, 1,
0.232726, 0.4338853, -2.683912, 0, 0.4313726, 1, 1,
0.232803, -0.1064332, 2.059945, 0, 0.4235294, 1, 1,
0.2329438, -0.658657, 3.482745, 0, 0.4196078, 1, 1,
0.2347686, -0.5744997, 3.679374, 0, 0.4117647, 1, 1,
0.2356757, -1.375099, 3.364107, 0, 0.4078431, 1, 1,
0.2371501, 1.503002, 0.09668085, 0, 0.4, 1, 1,
0.2371981, -0.6358581, 1.790351, 0, 0.3921569, 1, 1,
0.2381042, 2.241478, -0.2687946, 0, 0.3882353, 1, 1,
0.2408061, 1.48264, 0.2409842, 0, 0.3803922, 1, 1,
0.2424141, -1.349392, 3.876302, 0, 0.3764706, 1, 1,
0.2425269, -0.2765998, 2.187865, 0, 0.3686275, 1, 1,
0.2481196, -0.356518, 3.099022, 0, 0.3647059, 1, 1,
0.2511665, -1.495234, 1.945049, 0, 0.3568628, 1, 1,
0.2591935, 0.4919476, 0.2577164, 0, 0.3529412, 1, 1,
0.2596465, -0.4906301, 2.983744, 0, 0.345098, 1, 1,
0.2603613, 0.106374, 1.055434, 0, 0.3411765, 1, 1,
0.2609961, 2.198886, 0.009253285, 0, 0.3333333, 1, 1,
0.2626061, -1.731707, 1.347581, 0, 0.3294118, 1, 1,
0.2633668, -0.01160284, 1.497884, 0, 0.3215686, 1, 1,
0.263902, -0.8385724, 2.215693, 0, 0.3176471, 1, 1,
0.2642889, -1.935614, 3.503361, 0, 0.3098039, 1, 1,
0.2646325, -0.4839118, 3.006631, 0, 0.3058824, 1, 1,
0.2693773, -2.226521, 3.681162, 0, 0.2980392, 1, 1,
0.2699969, 0.8803985, 0.1250342, 0, 0.2901961, 1, 1,
0.2711968, -0.7582956, 1.924136, 0, 0.2862745, 1, 1,
0.2744992, 0.6493536, 1.426766, 0, 0.2784314, 1, 1,
0.2771592, -0.8804388, 1.943345, 0, 0.2745098, 1, 1,
0.2777765, -1.442208, 3.31035, 0, 0.2666667, 1, 1,
0.2782174, -1.079201, 2.301666, 0, 0.2627451, 1, 1,
0.2868828, -0.03971532, 2.253852, 0, 0.254902, 1, 1,
0.2914484, -0.1248181, 1.853753, 0, 0.2509804, 1, 1,
0.2919877, -0.3060229, 0.9006193, 0, 0.2431373, 1, 1,
0.2933963, -0.2554547, 2.567583, 0, 0.2392157, 1, 1,
0.2953643, -1.41671, 1.371565, 0, 0.2313726, 1, 1,
0.2979228, 1.445436, 1.091898, 0, 0.227451, 1, 1,
0.3037389, 0.6080692, -0.3067108, 0, 0.2196078, 1, 1,
0.3053454, -0.6875649, 2.521632, 0, 0.2156863, 1, 1,
0.3055468, 0.6268849, 0.4755103, 0, 0.2078431, 1, 1,
0.3079554, 0.001490324, 1.918839, 0, 0.2039216, 1, 1,
0.3111257, 0.4411777, 0.878792, 0, 0.1960784, 1, 1,
0.3153297, -1.633814, 2.890074, 0, 0.1882353, 1, 1,
0.3155227, 1.477664, 1.003593, 0, 0.1843137, 1, 1,
0.3161566, -0.9174723, 1.874184, 0, 0.1764706, 1, 1,
0.3242354, 1.493706, -1.54981, 0, 0.172549, 1, 1,
0.3352602, 0.655615, -0.9164715, 0, 0.1647059, 1, 1,
0.3356694, -1.283103, 2.813271, 0, 0.1607843, 1, 1,
0.3403666, -0.135818, 3.607826, 0, 0.1529412, 1, 1,
0.340516, 0.9837037, 1.570146, 0, 0.1490196, 1, 1,
0.3512837, 0.9164742, -0.3116567, 0, 0.1411765, 1, 1,
0.3582518, -1.122535, 2.875746, 0, 0.1372549, 1, 1,
0.3614595, 1.071906, -0.9810328, 0, 0.1294118, 1, 1,
0.3615229, -0.3903299, 3.587773, 0, 0.1254902, 1, 1,
0.3623946, 2.526347, 0.5161504, 0, 0.1176471, 1, 1,
0.3635133, 0.5323726, 0.8253714, 0, 0.1137255, 1, 1,
0.3666927, 2.46252, -0.1137153, 0, 0.1058824, 1, 1,
0.3673187, -0.2765922, 0.5966893, 0, 0.09803922, 1, 1,
0.3694437, -0.1378331, 1.99345, 0, 0.09411765, 1, 1,
0.3747298, -0.8532571, 2.600423, 0, 0.08627451, 1, 1,
0.377146, 0.4163682, 0.8574557, 0, 0.08235294, 1, 1,
0.3846926, 0.4396708, 2.074372, 0, 0.07450981, 1, 1,
0.3853917, 0.2237502, 0.6039265, 0, 0.07058824, 1, 1,
0.3867453, -0.01350247, 2.242546, 0, 0.0627451, 1, 1,
0.3870086, -0.504079, 0.5500688, 0, 0.05882353, 1, 1,
0.3873182, 0.6856433, 2.30362, 0, 0.05098039, 1, 1,
0.3970565, -0.09246915, 0.737582, 0, 0.04705882, 1, 1,
0.3996779, -0.1464113, 1.929504, 0, 0.03921569, 1, 1,
0.4006874, 0.2650697, 1.346554, 0, 0.03529412, 1, 1,
0.4012342, -0.0246004, 2.582113, 0, 0.02745098, 1, 1,
0.4016723, -0.1437594, 2.604385, 0, 0.02352941, 1, 1,
0.4036026, -0.4433824, 1.201945, 0, 0.01568628, 1, 1,
0.407599, 2.261169, 0.07558276, 0, 0.01176471, 1, 1,
0.4077063, -0.886173, 2.760067, 0, 0.003921569, 1, 1,
0.4121286, -0.6980438, 1.129629, 0.003921569, 0, 1, 1,
0.4168777, 1.478379, -0.8000998, 0.007843138, 0, 1, 1,
0.417044, -0.2777672, 4.367498, 0.01568628, 0, 1, 1,
0.4180296, 0.4380418, 0.8578483, 0.01960784, 0, 1, 1,
0.4200622, -0.785709, 3.851285, 0.02745098, 0, 1, 1,
0.4207642, -1.542822, 4.320991, 0.03137255, 0, 1, 1,
0.4368439, 2.019708, 0.3749917, 0.03921569, 0, 1, 1,
0.43689, 0.6339746, -0.007553773, 0.04313726, 0, 1, 1,
0.4384495, -1.272078, 1.719262, 0.05098039, 0, 1, 1,
0.4463693, 2.439778, -0.9405506, 0.05490196, 0, 1, 1,
0.4496989, -1.289793, 0.9559014, 0.0627451, 0, 1, 1,
0.4563778, 0.09353202, 1.60437, 0.06666667, 0, 1, 1,
0.460434, 0.01182188, 2.003485, 0.07450981, 0, 1, 1,
0.4610489, -0.3116527, 1.524493, 0.07843138, 0, 1, 1,
0.4633821, -0.3219278, -0.3329219, 0.08627451, 0, 1, 1,
0.4648509, 0.5165822, 1.292506, 0.09019608, 0, 1, 1,
0.4685782, -1.405108, 3.203022, 0.09803922, 0, 1, 1,
0.4766001, -1.107166, 2.220124, 0.1058824, 0, 1, 1,
0.4904692, 0.4090907, 1.467948, 0.1098039, 0, 1, 1,
0.4913093, 1.783, 1.508877, 0.1176471, 0, 1, 1,
0.4925453, -0.5342013, 0.9566385, 0.1215686, 0, 1, 1,
0.4928983, 1.194184, 2.501312, 0.1294118, 0, 1, 1,
0.4958768, -1.361979, 1.895017, 0.1333333, 0, 1, 1,
0.4996498, -0.02589155, 3.170468, 0.1411765, 0, 1, 1,
0.5005463, -0.7764168, 1.77983, 0.145098, 0, 1, 1,
0.5049501, 0.09774151, 2.261722, 0.1529412, 0, 1, 1,
0.5052137, -0.3716799, 0.961213, 0.1568628, 0, 1, 1,
0.5059256, 0.0606539, 1.06827, 0.1647059, 0, 1, 1,
0.5071515, 1.697243, 1.090219, 0.1686275, 0, 1, 1,
0.5190552, -0.06815425, 2.294123, 0.1764706, 0, 1, 1,
0.523133, -0.02303571, 1.115429, 0.1803922, 0, 1, 1,
0.5274884, -0.7220097, 2.804674, 0.1882353, 0, 1, 1,
0.5307062, 1.304124, 1.111319, 0.1921569, 0, 1, 1,
0.5309475, -1.003543, 3.15646, 0.2, 0, 1, 1,
0.5334055, -0.3587728, 2.241799, 0.2078431, 0, 1, 1,
0.5401725, -0.4337516, 2.234537, 0.2117647, 0, 1, 1,
0.5406699, 0.2344518, 0.9315903, 0.2196078, 0, 1, 1,
0.5413533, 0.9822319, 1.245817, 0.2235294, 0, 1, 1,
0.5432556, 0.5788418, 0.1499967, 0.2313726, 0, 1, 1,
0.5538409, 0.5411537, 0.2988048, 0.2352941, 0, 1, 1,
0.5574045, -0.4463564, 1.87551, 0.2431373, 0, 1, 1,
0.5581521, -0.1868793, 1.372411, 0.2470588, 0, 1, 1,
0.5585639, -0.01174213, 1.623234, 0.254902, 0, 1, 1,
0.5641524, 1.434196, 1.71427, 0.2588235, 0, 1, 1,
0.5668867, -0.02843773, 3.201452, 0.2666667, 0, 1, 1,
0.5764774, 0.7299488, 1.253027, 0.2705882, 0, 1, 1,
0.581441, 1.873968, 0.7923215, 0.2784314, 0, 1, 1,
0.5814689, -0.01777722, 2.389354, 0.282353, 0, 1, 1,
0.5913652, 0.1898224, 0.8107678, 0.2901961, 0, 1, 1,
0.5921625, 1.503511, 0.4912716, 0.2941177, 0, 1, 1,
0.5943274, -0.5811453, 3.183962, 0.3019608, 0, 1, 1,
0.5988623, -0.7900158, 2.461927, 0.3098039, 0, 1, 1,
0.6000921, -1.1745, 1.246086, 0.3137255, 0, 1, 1,
0.6042324, -1.005156, 2.778409, 0.3215686, 0, 1, 1,
0.6046867, 0.9575257, 2.235277, 0.3254902, 0, 1, 1,
0.6050785, -1.050181, 2.82159, 0.3333333, 0, 1, 1,
0.607108, 0.9504676, 1.951451, 0.3372549, 0, 1, 1,
0.6126868, 1.264707, 2.293257, 0.345098, 0, 1, 1,
0.613358, -1.763622, 2.057968, 0.3490196, 0, 1, 1,
0.6138657, -0.1414462, 2.036314, 0.3568628, 0, 1, 1,
0.6151902, 0.831899, 0.9977724, 0.3607843, 0, 1, 1,
0.6296789, -0.8440218, 1.699766, 0.3686275, 0, 1, 1,
0.6340033, 1.746699, 0.4313163, 0.372549, 0, 1, 1,
0.638559, 0.1664781, -0.378243, 0.3803922, 0, 1, 1,
0.6435137, -0.7338884, 1.554129, 0.3843137, 0, 1, 1,
0.6460537, 0.7950473, -0.2432105, 0.3921569, 0, 1, 1,
0.6466852, 1.796103, 0.2665404, 0.3960784, 0, 1, 1,
0.6486438, -0.6995792, 1.918841, 0.4039216, 0, 1, 1,
0.6506472, 1.017286, 0.976543, 0.4117647, 0, 1, 1,
0.6549385, 0.6900408, 1.440804, 0.4156863, 0, 1, 1,
0.6581478, 0.9317845, 1.555117, 0.4235294, 0, 1, 1,
0.6583036, -0.9770661, 2.535523, 0.427451, 0, 1, 1,
0.6663844, -0.6188167, 3.740483, 0.4352941, 0, 1, 1,
0.6666066, 0.14397, 1.36438, 0.4392157, 0, 1, 1,
0.6692203, 1.794579, 1.320389, 0.4470588, 0, 1, 1,
0.6730005, -1.323823, 0.6003421, 0.4509804, 0, 1, 1,
0.6747721, -0.9102269, 3.418683, 0.4588235, 0, 1, 1,
0.6749543, 1.413121, 0.3915791, 0.4627451, 0, 1, 1,
0.6762584, -0.2993605, 3.243136, 0.4705882, 0, 1, 1,
0.6765404, -1.188224, 2.677982, 0.4745098, 0, 1, 1,
0.6791228, 0.02234074, 2.042153, 0.4823529, 0, 1, 1,
0.6800739, 1.716583, 0.5212544, 0.4862745, 0, 1, 1,
0.6868309, -1.021411, 2.421411, 0.4941176, 0, 1, 1,
0.6937088, 1.66334, -0.4676909, 0.5019608, 0, 1, 1,
0.6940935, 1.883349, -0.04641014, 0.5058824, 0, 1, 1,
0.6955459, -0.3617813, 1.859497, 0.5137255, 0, 1, 1,
0.6959753, -0.6409755, 0.6230581, 0.5176471, 0, 1, 1,
0.7010631, -0.01958384, 2.469692, 0.5254902, 0, 1, 1,
0.7011191, 0.3878184, 3.391995, 0.5294118, 0, 1, 1,
0.7102575, -0.7832638, 2.670665, 0.5372549, 0, 1, 1,
0.7157081, 0.4099264, 2.701732, 0.5411765, 0, 1, 1,
0.7157822, -1.56461, 1.287346, 0.5490196, 0, 1, 1,
0.7171943, -0.2711642, 1.023428, 0.5529412, 0, 1, 1,
0.719329, -0.9593542, 2.541713, 0.5607843, 0, 1, 1,
0.7263988, -0.01725398, 1.969735, 0.5647059, 0, 1, 1,
0.7305745, 0.07209282, -0.1022486, 0.572549, 0, 1, 1,
0.7482986, 0.3739788, -0.8056772, 0.5764706, 0, 1, 1,
0.7519612, -1.109437, 1.981743, 0.5843138, 0, 1, 1,
0.753315, -0.6554007, 3.454871, 0.5882353, 0, 1, 1,
0.7537609, -0.2096439, 2.750093, 0.5960785, 0, 1, 1,
0.7552288, -0.5770039, 2.546487, 0.6039216, 0, 1, 1,
0.7627813, 1.625105, 1.300979, 0.6078432, 0, 1, 1,
0.7675058, 1.195562, -1.323861, 0.6156863, 0, 1, 1,
0.7715482, 0.1955287, 1.889071, 0.6196079, 0, 1, 1,
0.7725158, 0.5954321, 1.053337, 0.627451, 0, 1, 1,
0.7732983, 0.7780958, 0.1809088, 0.6313726, 0, 1, 1,
0.7739669, -1.102786, 2.285125, 0.6392157, 0, 1, 1,
0.7740936, -0.09087002, 2.337816, 0.6431373, 0, 1, 1,
0.7796733, -1.20979, 3.077824, 0.6509804, 0, 1, 1,
0.7804776, -0.306097, 3.366642, 0.654902, 0, 1, 1,
0.781432, -1.53479, 4.053524, 0.6627451, 0, 1, 1,
0.7823537, -0.08706092, 2.086034, 0.6666667, 0, 1, 1,
0.7867994, -0.8276666, 2.876108, 0.6745098, 0, 1, 1,
0.7877929, 1.13885, 1.629163, 0.6784314, 0, 1, 1,
0.787962, 1.587827, -2.507552, 0.6862745, 0, 1, 1,
0.788418, 2.50891, 0.9470636, 0.6901961, 0, 1, 1,
0.7940208, 1.077705, -0.1397501, 0.6980392, 0, 1, 1,
0.7957762, -0.8953221, 1.252066, 0.7058824, 0, 1, 1,
0.7994438, 0.0715168, 2.534869, 0.7098039, 0, 1, 1,
0.8050562, -0.08407921, 1.720041, 0.7176471, 0, 1, 1,
0.8060184, -0.2470698, 2.127295, 0.7215686, 0, 1, 1,
0.819482, 0.1945926, 0.8525878, 0.7294118, 0, 1, 1,
0.8239839, -1.146292, 1.008488, 0.7333333, 0, 1, 1,
0.8269842, -1.043337, 3.547862, 0.7411765, 0, 1, 1,
0.8297681, -1.47609, 3.920764, 0.7450981, 0, 1, 1,
0.8358341, -1.409405, 3.782731, 0.7529412, 0, 1, 1,
0.8454346, 0.6635422, -0.1747517, 0.7568628, 0, 1, 1,
0.8639004, 0.412785, 0.9240109, 0.7647059, 0, 1, 1,
0.867921, -0.2080447, 2.39092, 0.7686275, 0, 1, 1,
0.8707377, 0.3059268, -0.8518504, 0.7764706, 0, 1, 1,
0.8738227, 0.1361766, 2.526876, 0.7803922, 0, 1, 1,
0.8741196, -0.151408, 2.756488, 0.7882353, 0, 1, 1,
0.877872, 0.1478639, 1.964372, 0.7921569, 0, 1, 1,
0.8820851, 0.4912585, 1.053273, 0.8, 0, 1, 1,
0.8845198, -1.295171, 1.478021, 0.8078431, 0, 1, 1,
0.8846086, -0.5351886, 2.493349, 0.8117647, 0, 1, 1,
0.8849342, 0.678712, 1.216997, 0.8196079, 0, 1, 1,
0.8853064, -1.507239, 1.835266, 0.8235294, 0, 1, 1,
0.8907657, -0.8841667, 2.807613, 0.8313726, 0, 1, 1,
0.895126, 0.3972732, 0.152273, 0.8352941, 0, 1, 1,
0.9025328, 1.001793, 0.1477758, 0.8431373, 0, 1, 1,
0.9090387, -0.7452027, 2.485491, 0.8470588, 0, 1, 1,
0.9161777, -1.811612, 2.439389, 0.854902, 0, 1, 1,
0.9166553, 0.3753469, 0.9393892, 0.8588235, 0, 1, 1,
0.9202353, 1.128997, -0.1747606, 0.8666667, 0, 1, 1,
0.9231334, 0.6959208, 0.4117979, 0.8705882, 0, 1, 1,
0.9304724, -1.355701, 3.625624, 0.8784314, 0, 1, 1,
0.9349607, -0.2492962, 2.521804, 0.8823529, 0, 1, 1,
0.9360877, -0.009060315, 3.14754, 0.8901961, 0, 1, 1,
0.9442376, -2.737489, 4.064765, 0.8941177, 0, 1, 1,
0.9455208, 0.4565628, 0.8779327, 0.9019608, 0, 1, 1,
0.9458356, 0.6054222, 0.7764019, 0.9098039, 0, 1, 1,
0.9515801, 2.713149, 0.2956808, 0.9137255, 0, 1, 1,
0.9560195, 0.06737534, 0.682591, 0.9215686, 0, 1, 1,
0.9575154, 0.2838425, 1.277703, 0.9254902, 0, 1, 1,
0.9651047, 1.959905, -0.5385031, 0.9333333, 0, 1, 1,
0.9662555, 0.4247359, 3.59071, 0.9372549, 0, 1, 1,
0.9692506, 0.8139459, 1.354676, 0.945098, 0, 1, 1,
0.9692912, 0.2397954, 2.189092, 0.9490196, 0, 1, 1,
0.9719851, 0.1374947, 1.597903, 0.9568627, 0, 1, 1,
0.9762514, 0.6032944, 0.4938746, 0.9607843, 0, 1, 1,
0.976726, 2.571105, 1.073478, 0.9686275, 0, 1, 1,
0.9823139, -1.375099, 2.614634, 0.972549, 0, 1, 1,
0.9867567, 1.155065, 1.863379, 0.9803922, 0, 1, 1,
0.9923505, -2.3, 1.917855, 0.9843137, 0, 1, 1,
0.9979662, -1.188862, 2.632174, 0.9921569, 0, 1, 1,
0.999284, 0.1633484, 0.4574913, 0.9960784, 0, 1, 1,
1.000381, 0.5612048, 0.3579043, 1, 0, 0.9960784, 1,
1.00054, -0.6130974, 1.74998, 1, 0, 0.9882353, 1,
1.004815, -0.4326285, 2.586466, 1, 0, 0.9843137, 1,
1.006216, 0.826013, 1.232142, 1, 0, 0.9764706, 1,
1.006306, 0.6573928, 1.003034, 1, 0, 0.972549, 1,
1.017669, -0.858806, 2.518965, 1, 0, 0.9647059, 1,
1.031206, 1.152835, 1.417879, 1, 0, 0.9607843, 1,
1.045169, -1.130316, 2.618308, 1, 0, 0.9529412, 1,
1.049993, 0.6083893, 1.936287, 1, 0, 0.9490196, 1,
1.050096, 1.587348, -0.0115791, 1, 0, 0.9411765, 1,
1.056665, -0.4837472, 2.817083, 1, 0, 0.9372549, 1,
1.063292, 0.07320646, 2.429291, 1, 0, 0.9294118, 1,
1.077568, 0.3826352, 0.9422438, 1, 0, 0.9254902, 1,
1.086994, 1.667354, 0.8434836, 1, 0, 0.9176471, 1,
1.089604, -1.172243, 3.305344, 1, 0, 0.9137255, 1,
1.093795, 0.3664523, -1.532598, 1, 0, 0.9058824, 1,
1.100013, -0.2421848, 3.018888, 1, 0, 0.9019608, 1,
1.105043, 0.7197918, 1.828416, 1, 0, 0.8941177, 1,
1.105787, -0.5521504, 3.377249, 1, 0, 0.8862745, 1,
1.109147, -1.258455, 1.525999, 1, 0, 0.8823529, 1,
1.109705, -0.3950118, 0.8914192, 1, 0, 0.8745098, 1,
1.11567, -1.216585, 2.506047, 1, 0, 0.8705882, 1,
1.119627, -0.9525324, 1.325281, 1, 0, 0.8627451, 1,
1.128786, -0.5642174, 3.114248, 1, 0, 0.8588235, 1,
1.132366, -0.5634246, 2.885983, 1, 0, 0.8509804, 1,
1.136845, 1.135234, 0.8913427, 1, 0, 0.8470588, 1,
1.138411, 1.00659, 0.4659782, 1, 0, 0.8392157, 1,
1.141576, -1.980422, 3.41976, 1, 0, 0.8352941, 1,
1.145603, -0.6857304, 1.652176, 1, 0, 0.827451, 1,
1.170038, -1.594439, 2.68988, 1, 0, 0.8235294, 1,
1.172771, 0.00546868, 2.06642, 1, 0, 0.8156863, 1,
1.180616, 0.5883635, 0.1719992, 1, 0, 0.8117647, 1,
1.181711, -1.691153, 0.5980442, 1, 0, 0.8039216, 1,
1.188004, 1.080233, 1.271449, 1, 0, 0.7960784, 1,
1.188309, 0.5306596, 0.3388887, 1, 0, 0.7921569, 1,
1.190411, 1.091043, 0.9901278, 1, 0, 0.7843137, 1,
1.192505, -0.9377899, 1.901581, 1, 0, 0.7803922, 1,
1.192612, -0.7446104, 1.857053, 1, 0, 0.772549, 1,
1.20287, -0.4459284, 1.040223, 1, 0, 0.7686275, 1,
1.204742, -1.514212, 2.815903, 1, 0, 0.7607843, 1,
1.208919, 0.5712149, 2.726767, 1, 0, 0.7568628, 1,
1.211839, 0.7724249, 1.568794, 1, 0, 0.7490196, 1,
1.214359, 0.7521165, 1.661097, 1, 0, 0.7450981, 1,
1.2166, -1.574718, 1.732627, 1, 0, 0.7372549, 1,
1.21866, 0.04406942, 0.8041862, 1, 0, 0.7333333, 1,
1.21972, -0.526945, 2.404262, 1, 0, 0.7254902, 1,
1.220076, -0.4399709, 3.867161, 1, 0, 0.7215686, 1,
1.220304, -0.4216003, 3.54521, 1, 0, 0.7137255, 1,
1.221095, -0.9793512, 5.092782, 1, 0, 0.7098039, 1,
1.236263, 1.368362, -0.2251649, 1, 0, 0.7019608, 1,
1.243123, 0.7988104, 0.0146194, 1, 0, 0.6941177, 1,
1.244434, -0.1021791, 2.251094, 1, 0, 0.6901961, 1,
1.246428, 1.994718, 2.479444, 1, 0, 0.682353, 1,
1.249849, -1.40301, 2.184128, 1, 0, 0.6784314, 1,
1.260983, 1.066489, 0.8306459, 1, 0, 0.6705883, 1,
1.27093, 0.8371758, 0.3851351, 1, 0, 0.6666667, 1,
1.274973, -2.209679, 2.092588, 1, 0, 0.6588235, 1,
1.274986, 0.01396409, 2.695304, 1, 0, 0.654902, 1,
1.282397, -0.884621, 0.3574682, 1, 0, 0.6470588, 1,
1.285661, -0.1623679, 3.95423, 1, 0, 0.6431373, 1,
1.288923, -0.6972163, 1.80346, 1, 0, 0.6352941, 1,
1.290011, -0.06541261, 2.772751, 1, 0, 0.6313726, 1,
1.295096, -0.6045046, 1.570017, 1, 0, 0.6235294, 1,
1.299782, 1.133252, 1.504776, 1, 0, 0.6196079, 1,
1.316482, 0.4969003, 1.635752, 1, 0, 0.6117647, 1,
1.324204, 0.9532022, 2.188689, 1, 0, 0.6078432, 1,
1.337948, 0.5550139, -0.01998647, 1, 0, 0.6, 1,
1.338911, -1.590931, 2.251928, 1, 0, 0.5921569, 1,
1.343993, 1.171984, -1.280014, 1, 0, 0.5882353, 1,
1.358437, 0.3358755, 0.8750253, 1, 0, 0.5803922, 1,
1.362217, 0.7594938, 0.910693, 1, 0, 0.5764706, 1,
1.364238, 0.3091722, 1.355177, 1, 0, 0.5686275, 1,
1.377407, -0.9070717, 2.283808, 1, 0, 0.5647059, 1,
1.381248, -0.6921097, 1.079778, 1, 0, 0.5568628, 1,
1.385477, -0.9089693, 2.930886, 1, 0, 0.5529412, 1,
1.386834, -1.715121, 3.518682, 1, 0, 0.5450981, 1,
1.387391, 0.3978931, 1.854103, 1, 0, 0.5411765, 1,
1.400885, 1.397115, 1.349406, 1, 0, 0.5333334, 1,
1.401902, 0.3711758, 2.363873, 1, 0, 0.5294118, 1,
1.409401, 0.7661385, 0.5416316, 1, 0, 0.5215687, 1,
1.413653, 0.0430581, 3.049924, 1, 0, 0.5176471, 1,
1.419412, -0.5672048, 1.123442, 1, 0, 0.509804, 1,
1.434029, 0.559848, 1.237962, 1, 0, 0.5058824, 1,
1.44065, 0.03714071, 2.884672, 1, 0, 0.4980392, 1,
1.443409, 1.056928, 0.117226, 1, 0, 0.4901961, 1,
1.445326, 0.5182884, 0.8779904, 1, 0, 0.4862745, 1,
1.451151, -0.05525874, 0.9719363, 1, 0, 0.4784314, 1,
1.458234, -0.0125358, 0.910474, 1, 0, 0.4745098, 1,
1.461022, 1.412935, 0.1788153, 1, 0, 0.4666667, 1,
1.46704, -0.07611185, 2.52384, 1, 0, 0.4627451, 1,
1.467654, -2.086029, 3.944399, 1, 0, 0.454902, 1,
1.471825, 0.5477178, 1.417799, 1, 0, 0.4509804, 1,
1.472257, -0.6721169, -0.02476411, 1, 0, 0.4431373, 1,
1.479522, -1.18618, 2.500973, 1, 0, 0.4392157, 1,
1.492459, -0.005935427, 0.8668426, 1, 0, 0.4313726, 1,
1.497219, -0.8855835, 2.580705, 1, 0, 0.427451, 1,
1.499993, 1.125059, 0.3410203, 1, 0, 0.4196078, 1,
1.508586, -0.3010511, 3.856208, 1, 0, 0.4156863, 1,
1.514596, 0.005613104, 2.729506, 1, 0, 0.4078431, 1,
1.518859, -1.388979, 2.024062, 1, 0, 0.4039216, 1,
1.527932, 0.2410682, 0.9163771, 1, 0, 0.3960784, 1,
1.537284, 1.704722, 0.2718372, 1, 0, 0.3882353, 1,
1.543657, 0.06463317, 2.461329, 1, 0, 0.3843137, 1,
1.545595, 1.625583, -1.296882, 1, 0, 0.3764706, 1,
1.546224, 0.1915509, 2.296793, 1, 0, 0.372549, 1,
1.547355, 1.787277, 0.7237226, 1, 0, 0.3647059, 1,
1.548335, -0.3775848, 1.370142, 1, 0, 0.3607843, 1,
1.555826, -0.4684124, 3.542193, 1, 0, 0.3529412, 1,
1.561661, 0.3190426, 2.805022, 1, 0, 0.3490196, 1,
1.576157, -1.185807, 2.9967, 1, 0, 0.3411765, 1,
1.581668, 1.124575, 0.5462405, 1, 0, 0.3372549, 1,
1.613275, 0.3028518, 1.587806, 1, 0, 0.3294118, 1,
1.627216, -0.01130151, 0.7343534, 1, 0, 0.3254902, 1,
1.637403, 0.3099854, -0.484676, 1, 0, 0.3176471, 1,
1.641624, 0.6305905, 1.460657, 1, 0, 0.3137255, 1,
1.650747, -0.5049816, 3.310775, 1, 0, 0.3058824, 1,
1.653997, -0.2769115, 2.063177, 1, 0, 0.2980392, 1,
1.66447, -0.2416809, 0.7218231, 1, 0, 0.2941177, 1,
1.677504, -0.1480885, 1.100257, 1, 0, 0.2862745, 1,
1.682335, 0.7184979, 2.510992, 1, 0, 0.282353, 1,
1.691995, 0.226428, 0.6350609, 1, 0, 0.2745098, 1,
1.713789, 2.329101, 1.540544, 1, 0, 0.2705882, 1,
1.719825, 0.1347947, 0.5046511, 1, 0, 0.2627451, 1,
1.741472, 1.966284, -0.6335373, 1, 0, 0.2588235, 1,
1.747729, -1.987873, 3.552984, 1, 0, 0.2509804, 1,
1.749882, 0.3597502, -0.5446424, 1, 0, 0.2470588, 1,
1.751029, 0.6546495, 1.694161, 1, 0, 0.2392157, 1,
1.765963, -0.1851391, 2.499529, 1, 0, 0.2352941, 1,
1.799233, -1.15712, 2.048587, 1, 0, 0.227451, 1,
1.840599, 0.3547531, 2.071307, 1, 0, 0.2235294, 1,
1.852478, 0.2773096, 2.290802, 1, 0, 0.2156863, 1,
1.85517, -0.5866314, 1.412627, 1, 0, 0.2117647, 1,
1.858704, 0.5729093, 1.140637, 1, 0, 0.2039216, 1,
1.859569, 0.1906696, -0.01248262, 1, 0, 0.1960784, 1,
1.878625, 0.3452833, 1.828924, 1, 0, 0.1921569, 1,
1.889928, -1.257607, 4.452804, 1, 0, 0.1843137, 1,
1.917464, -1.214885, 2.417294, 1, 0, 0.1803922, 1,
1.925098, -0.2744398, 2.034989, 1, 0, 0.172549, 1,
1.926009, -2.177724, 2.90017, 1, 0, 0.1686275, 1,
1.958589, 1.980288, -0.1121053, 1, 0, 0.1607843, 1,
1.974527, -0.6821185, 2.653023, 1, 0, 0.1568628, 1,
1.987882, -0.1658492, 1.238312, 1, 0, 0.1490196, 1,
2.00781, -1.63854, 1.12159, 1, 0, 0.145098, 1,
2.02226, -0.5414437, 1.599531, 1, 0, 0.1372549, 1,
2.039301, 0.07050399, 1.335239, 1, 0, 0.1333333, 1,
2.050339, -0.6774715, 0.7104009, 1, 0, 0.1254902, 1,
2.056877, 0.5980675, 0.7190689, 1, 0, 0.1215686, 1,
2.063785, 0.3901233, 3.052358, 1, 0, 0.1137255, 1,
2.075465, 0.2438723, 1.380705, 1, 0, 0.1098039, 1,
2.077147, -0.9114348, 3.064066, 1, 0, 0.1019608, 1,
2.081376, 0.3940266, 1.746001, 1, 0, 0.09411765, 1,
2.107424, -0.7111825, 3.527958, 1, 0, 0.09019608, 1,
2.114224, -2.017731, 1.87999, 1, 0, 0.08235294, 1,
2.141555, -0.4953105, 1.705827, 1, 0, 0.07843138, 1,
2.152408, -0.688881, 2.415476, 1, 0, 0.07058824, 1,
2.159874, -0.3083005, 2.006359, 1, 0, 0.06666667, 1,
2.276095, 0.7729326, 2.435381, 1, 0, 0.05882353, 1,
2.291141, 0.892278, 0.9725772, 1, 0, 0.05490196, 1,
2.29303, -0.6370162, 2.502972, 1, 0, 0.04705882, 1,
2.33524, -0.2367555, 2.704993, 1, 0, 0.04313726, 1,
2.474719, -0.3600239, 1.018181, 1, 0, 0.03529412, 1,
2.488042, 0.8508216, 1.628281, 1, 0, 0.03137255, 1,
2.651225, -0.7309652, 0.8708935, 1, 0, 0.02352941, 1,
2.707304, -0.4210666, 3.936958, 1, 0, 0.01960784, 1,
2.720212, 0.3218805, 1.458765, 1, 0, 0.01176471, 1,
2.999124, 0.1029, -0.2497226, 1, 0, 0.007843138, 1
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
-0.01559663, -4.686574, -7.437382, 0, -0.5, 0.5, 0.5,
-0.01559663, -4.686574, -7.437382, 1, -0.5, 0.5, 0.5,
-0.01559663, -4.686574, -7.437382, 1, 1.5, 0.5, 0.5,
-0.01559663, -4.686574, -7.437382, 0, 1.5, 0.5, 0.5
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
-4.052307, -0.2719584, -7.437382, 0, -0.5, 0.5, 0.5,
-4.052307, -0.2719584, -7.437382, 1, -0.5, 0.5, 0.5,
-4.052307, -0.2719584, -7.437382, 1, 1.5, 0.5, 0.5,
-4.052307, -0.2719584, -7.437382, 0, 1.5, 0.5, 0.5
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
-4.052307, -4.686574, -0.2642782, 0, -0.5, 0.5, 0.5,
-4.052307, -4.686574, -0.2642782, 1, -0.5, 0.5, 0.5,
-4.052307, -4.686574, -0.2642782, 1, 1.5, 0.5, 0.5,
-4.052307, -4.686574, -0.2642782, 0, 1.5, 0.5, 0.5
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
-3, -3.667817, -5.78205,
2, -3.667817, -5.78205,
-3, -3.667817, -5.78205,
-3, -3.83761, -6.057939,
-2, -3.667817, -5.78205,
-2, -3.83761, -6.057939,
-1, -3.667817, -5.78205,
-1, -3.83761, -6.057939,
0, -3.667817, -5.78205,
0, -3.83761, -6.057939,
1, -3.667817, -5.78205,
1, -3.83761, -6.057939,
2, -3.667817, -5.78205,
2, -3.83761, -6.057939
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
-3, -4.177196, -6.609716, 0, -0.5, 0.5, 0.5,
-3, -4.177196, -6.609716, 1, -0.5, 0.5, 0.5,
-3, -4.177196, -6.609716, 1, 1.5, 0.5, 0.5,
-3, -4.177196, -6.609716, 0, 1.5, 0.5, 0.5,
-2, -4.177196, -6.609716, 0, -0.5, 0.5, 0.5,
-2, -4.177196, -6.609716, 1, -0.5, 0.5, 0.5,
-2, -4.177196, -6.609716, 1, 1.5, 0.5, 0.5,
-2, -4.177196, -6.609716, 0, 1.5, 0.5, 0.5,
-1, -4.177196, -6.609716, 0, -0.5, 0.5, 0.5,
-1, -4.177196, -6.609716, 1, -0.5, 0.5, 0.5,
-1, -4.177196, -6.609716, 1, 1.5, 0.5, 0.5,
-1, -4.177196, -6.609716, 0, 1.5, 0.5, 0.5,
0, -4.177196, -6.609716, 0, -0.5, 0.5, 0.5,
0, -4.177196, -6.609716, 1, -0.5, 0.5, 0.5,
0, -4.177196, -6.609716, 1, 1.5, 0.5, 0.5,
0, -4.177196, -6.609716, 0, 1.5, 0.5, 0.5,
1, -4.177196, -6.609716, 0, -0.5, 0.5, 0.5,
1, -4.177196, -6.609716, 1, -0.5, 0.5, 0.5,
1, -4.177196, -6.609716, 1, 1.5, 0.5, 0.5,
1, -4.177196, -6.609716, 0, 1.5, 0.5, 0.5,
2, -4.177196, -6.609716, 0, -0.5, 0.5, 0.5,
2, -4.177196, -6.609716, 1, -0.5, 0.5, 0.5,
2, -4.177196, -6.609716, 1, 1.5, 0.5, 0.5,
2, -4.177196, -6.609716, 0, 1.5, 0.5, 0.5
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
-3.120759, -3, -5.78205,
-3.120759, 3, -5.78205,
-3.120759, -3, -5.78205,
-3.276016, -3, -6.057939,
-3.120759, -2, -5.78205,
-3.276016, -2, -6.057939,
-3.120759, -1, -5.78205,
-3.276016, -1, -6.057939,
-3.120759, 0, -5.78205,
-3.276016, 0, -6.057939,
-3.120759, 1, -5.78205,
-3.276016, 1, -6.057939,
-3.120759, 2, -5.78205,
-3.276016, 2, -6.057939,
-3.120759, 3, -5.78205,
-3.276016, 3, -6.057939
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
-3.586533, -3, -6.609716, 0, -0.5, 0.5, 0.5,
-3.586533, -3, -6.609716, 1, -0.5, 0.5, 0.5,
-3.586533, -3, -6.609716, 1, 1.5, 0.5, 0.5,
-3.586533, -3, -6.609716, 0, 1.5, 0.5, 0.5,
-3.586533, -2, -6.609716, 0, -0.5, 0.5, 0.5,
-3.586533, -2, -6.609716, 1, -0.5, 0.5, 0.5,
-3.586533, -2, -6.609716, 1, 1.5, 0.5, 0.5,
-3.586533, -2, -6.609716, 0, 1.5, 0.5, 0.5,
-3.586533, -1, -6.609716, 0, -0.5, 0.5, 0.5,
-3.586533, -1, -6.609716, 1, -0.5, 0.5, 0.5,
-3.586533, -1, -6.609716, 1, 1.5, 0.5, 0.5,
-3.586533, -1, -6.609716, 0, 1.5, 0.5, 0.5,
-3.586533, 0, -6.609716, 0, -0.5, 0.5, 0.5,
-3.586533, 0, -6.609716, 1, -0.5, 0.5, 0.5,
-3.586533, 0, -6.609716, 1, 1.5, 0.5, 0.5,
-3.586533, 0, -6.609716, 0, 1.5, 0.5, 0.5,
-3.586533, 1, -6.609716, 0, -0.5, 0.5, 0.5,
-3.586533, 1, -6.609716, 1, -0.5, 0.5, 0.5,
-3.586533, 1, -6.609716, 1, 1.5, 0.5, 0.5,
-3.586533, 1, -6.609716, 0, 1.5, 0.5, 0.5,
-3.586533, 2, -6.609716, 0, -0.5, 0.5, 0.5,
-3.586533, 2, -6.609716, 1, -0.5, 0.5, 0.5,
-3.586533, 2, -6.609716, 1, 1.5, 0.5, 0.5,
-3.586533, 2, -6.609716, 0, 1.5, 0.5, 0.5,
-3.586533, 3, -6.609716, 0, -0.5, 0.5, 0.5,
-3.586533, 3, -6.609716, 1, -0.5, 0.5, 0.5,
-3.586533, 3, -6.609716, 1, 1.5, 0.5, 0.5,
-3.586533, 3, -6.609716, 0, 1.5, 0.5, 0.5
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
-3.120759, -3.667817, -4,
-3.120759, -3.667817, 4,
-3.120759, -3.667817, -4,
-3.276016, -3.83761, -4,
-3.120759, -3.667817, -2,
-3.276016, -3.83761, -2,
-3.120759, -3.667817, 0,
-3.276016, -3.83761, 0,
-3.120759, -3.667817, 2,
-3.276016, -3.83761, 2,
-3.120759, -3.667817, 4,
-3.276016, -3.83761, 4
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
-3.586533, -4.177196, -4, 0, -0.5, 0.5, 0.5,
-3.586533, -4.177196, -4, 1, -0.5, 0.5, 0.5,
-3.586533, -4.177196, -4, 1, 1.5, 0.5, 0.5,
-3.586533, -4.177196, -4, 0, 1.5, 0.5, 0.5,
-3.586533, -4.177196, -2, 0, -0.5, 0.5, 0.5,
-3.586533, -4.177196, -2, 1, -0.5, 0.5, 0.5,
-3.586533, -4.177196, -2, 1, 1.5, 0.5, 0.5,
-3.586533, -4.177196, -2, 0, 1.5, 0.5, 0.5,
-3.586533, -4.177196, 0, 0, -0.5, 0.5, 0.5,
-3.586533, -4.177196, 0, 1, -0.5, 0.5, 0.5,
-3.586533, -4.177196, 0, 1, 1.5, 0.5, 0.5,
-3.586533, -4.177196, 0, 0, 1.5, 0.5, 0.5,
-3.586533, -4.177196, 2, 0, -0.5, 0.5, 0.5,
-3.586533, -4.177196, 2, 1, -0.5, 0.5, 0.5,
-3.586533, -4.177196, 2, 1, 1.5, 0.5, 0.5,
-3.586533, -4.177196, 2, 0, 1.5, 0.5, 0.5,
-3.586533, -4.177196, 4, 0, -0.5, 0.5, 0.5,
-3.586533, -4.177196, 4, 1, -0.5, 0.5, 0.5,
-3.586533, -4.177196, 4, 1, 1.5, 0.5, 0.5,
-3.586533, -4.177196, 4, 0, 1.5, 0.5, 0.5
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
-3.120759, -3.667817, -5.78205,
-3.120759, 3.1239, -5.78205,
-3.120759, -3.667817, 5.253494,
-3.120759, 3.1239, 5.253494,
-3.120759, -3.667817, -5.78205,
-3.120759, -3.667817, 5.253494,
-3.120759, 3.1239, -5.78205,
-3.120759, 3.1239, 5.253494,
-3.120759, -3.667817, -5.78205,
3.089565, -3.667817, -5.78205,
-3.120759, -3.667817, 5.253494,
3.089565, -3.667817, 5.253494,
-3.120759, 3.1239, -5.78205,
3.089565, 3.1239, -5.78205,
-3.120759, 3.1239, 5.253494,
3.089565, 3.1239, 5.253494,
3.089565, -3.667817, -5.78205,
3.089565, 3.1239, -5.78205,
3.089565, -3.667817, 5.253494,
3.089565, 3.1239, 5.253494,
3.089565, -3.667817, -5.78205,
3.089565, -3.667817, 5.253494,
3.089565, 3.1239, -5.78205,
3.089565, 3.1239, 5.253494
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
var radius = 7.672964;
var distance = 34.13788;
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
mvMatrix.translate( 0.01559663, 0.2719584, 0.2642782 );
mvMatrix.scale( 1.335866, 1.221511, 0.7517671 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.13788);
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
Sodium_Isopropyl<-read.table("Sodium_Isopropyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Sodium_Isopropyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'Sodium_Isopropyl' not found
```

```r
y<-Sodium_Isopropyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'Sodium_Isopropyl' not found
```

```r
z<-Sodium_Isopropyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'Sodium_Isopropyl' not found
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
-3.030317, 1.12728, -2.38087, 0, 0, 1, 1, 1,
-2.981879, 0.2934563, -0.3088638, 1, 0, 0, 1, 1,
-2.947778, 1.203164, -1.092079, 1, 0, 0, 1, 1,
-2.734478, 0.3555847, -1.606237, 1, 0, 0, 1, 1,
-2.725278, -0.4002661, -1.553723, 1, 0, 0, 1, 1,
-2.62168, 0.2796675, -2.812692, 1, 0, 0, 1, 1,
-2.617704, -1.07699, -1.721823, 0, 0, 0, 1, 1,
-2.603066, 1.323987, -2.354145, 0, 0, 0, 1, 1,
-2.519833, 0.678722, -1.174102, 0, 0, 0, 1, 1,
-2.323219, -0.2711316, -3.128369, 0, 0, 0, 1, 1,
-2.271664, -0.7560993, -1.689592, 0, 0, 0, 1, 1,
-2.263552, -0.6167988, -1.308888, 0, 0, 0, 1, 1,
-2.195046, 0.8172097, -1.081841, 0, 0, 0, 1, 1,
-2.179912, -0.6644933, -1.632188, 1, 1, 1, 1, 1,
-2.145008, 2.332596, -1.185635, 1, 1, 1, 1, 1,
-2.101304, 1.113904, -0.1939671, 1, 1, 1, 1, 1,
-2.06436, -2.103724, -1.79938, 1, 1, 1, 1, 1,
-2.051536, -0.7252071, -2.140915, 1, 1, 1, 1, 1,
-2.021822, 1.318515, -0.4694426, 1, 1, 1, 1, 1,
-2.014868, 0.4039082, -2.725906, 1, 1, 1, 1, 1,
-1.986879, 0.5167242, -1.038001, 1, 1, 1, 1, 1,
-1.977628, -0.3667253, -1.032524, 1, 1, 1, 1, 1,
-1.953376, 0.5229015, -1.442839, 1, 1, 1, 1, 1,
-1.950457, -1.500997, -1.735597, 1, 1, 1, 1, 1,
-1.947403, -0.1545599, -1.050129, 1, 1, 1, 1, 1,
-1.945829, 0.7145854, -0.2324882, 1, 1, 1, 1, 1,
-1.930077, -0.1151155, -4.203007, 1, 1, 1, 1, 1,
-1.903046, -0.5981646, -1.358542, 1, 1, 1, 1, 1,
-1.892418, -0.2559074, 0.6587369, 0, 0, 1, 1, 1,
-1.860929, 0.2716287, -1.716137, 1, 0, 0, 1, 1,
-1.849153, -1.005614, -4.169415, 1, 0, 0, 1, 1,
-1.839276, 0.09359634, -2.392105, 1, 0, 0, 1, 1,
-1.825287, 0.3265296, -1.835668, 1, 0, 0, 1, 1,
-1.820793, -1.39025, -2.717408, 1, 0, 0, 1, 1,
-1.800642, 0.06040413, -2.31413, 0, 0, 0, 1, 1,
-1.793178, -0.07503989, -0.4051802, 0, 0, 0, 1, 1,
-1.776385, 0.8716983, -2.345662, 0, 0, 0, 1, 1,
-1.773854, 0.901742, 1.146374, 0, 0, 0, 1, 1,
-1.766901, 1.637823, -1.942429, 0, 0, 0, 1, 1,
-1.761455, -0.7062358, -0.5136769, 0, 0, 0, 1, 1,
-1.75268, 0.3078741, -2.346102, 0, 0, 0, 1, 1,
-1.740595, 1.171541, 0.6530395, 1, 1, 1, 1, 1,
-1.736883, 0.3407498, -0.3215851, 1, 1, 1, 1, 1,
-1.735817, 0.9733971, -2.635208, 1, 1, 1, 1, 1,
-1.732237, 0.6401537, -1.974258, 1, 1, 1, 1, 1,
-1.719516, 0.1864714, 0.6107022, 1, 1, 1, 1, 1,
-1.697257, 0.2077317, -0.9102974, 1, 1, 1, 1, 1,
-1.679679, 1.20021, -2.3867, 1, 1, 1, 1, 1,
-1.664446, -0.4843096, -1.617794, 1, 1, 1, 1, 1,
-1.638453, 0.6990778, -0.3320378, 1, 1, 1, 1, 1,
-1.5985, -0.2772637, -1.000895, 1, 1, 1, 1, 1,
-1.598369, 1.699546, -1.887277, 1, 1, 1, 1, 1,
-1.596829, -0.4620267, -2.712765, 1, 1, 1, 1, 1,
-1.576232, 0.3396811, -3.937678, 1, 1, 1, 1, 1,
-1.574778, -0.03072199, -0.5673077, 1, 1, 1, 1, 1,
-1.557588, -0.5426978, -2.621459, 1, 1, 1, 1, 1,
-1.553496, 0.3962081, -1.036316, 0, 0, 1, 1, 1,
-1.548539, -1.445402, -1.618717, 1, 0, 0, 1, 1,
-1.528134, 0.003893734, -2.321634, 1, 0, 0, 1, 1,
-1.52732, 0.1642018, -2.395744, 1, 0, 0, 1, 1,
-1.515173, 0.1234746, -1.909893, 1, 0, 0, 1, 1,
-1.509117, -0.7798122, -1.112579, 1, 0, 0, 1, 1,
-1.495602, -1.280457, -0.8965309, 0, 0, 0, 1, 1,
-1.493552, -0.9807387, -1.858463, 0, 0, 0, 1, 1,
-1.481372, -0.114501, -0.9715061, 0, 0, 0, 1, 1,
-1.480918, 0.5849693, -0.7064791, 0, 0, 0, 1, 1,
-1.477821, -1.52494, -1.40249, 0, 0, 0, 1, 1,
-1.477307, 0.8853876, -1.024631, 0, 0, 0, 1, 1,
-1.447496, 1.123784, -0.008792631, 0, 0, 0, 1, 1,
-1.444588, -0.1674499, -1.644232, 1, 1, 1, 1, 1,
-1.423355, -1.076312, -1.71476, 1, 1, 1, 1, 1,
-1.419586, -0.6176643, -2.395788, 1, 1, 1, 1, 1,
-1.419282, -0.8150266, -1.509429, 1, 1, 1, 1, 1,
-1.416099, 1.615421, -0.2702391, 1, 1, 1, 1, 1,
-1.410175, -0.9779491, -1.725585, 1, 1, 1, 1, 1,
-1.397375, 1.088467, -2.348693, 1, 1, 1, 1, 1,
-1.396975, 0.4501263, -1.713507, 1, 1, 1, 1, 1,
-1.383932, 0.106664, -2.025099, 1, 1, 1, 1, 1,
-1.3809, 0.9152488, 0.1490315, 1, 1, 1, 1, 1,
-1.376347, 1.431394, -1.486257, 1, 1, 1, 1, 1,
-1.371385, 0.7416915, -1.28402, 1, 1, 1, 1, 1,
-1.367954, -0.8152313, -2.118427, 1, 1, 1, 1, 1,
-1.358234, 0.4001012, -2.240887, 1, 1, 1, 1, 1,
-1.344931, 0.05416065, -0.8598015, 1, 1, 1, 1, 1,
-1.344364, -1.89161, -4.979507, 0, 0, 1, 1, 1,
-1.33497, 0.4339844, -1.759632, 1, 0, 0, 1, 1,
-1.325356, 1.272157, -0.8444794, 1, 0, 0, 1, 1,
-1.325204, 0.1260738, -1.784527, 1, 0, 0, 1, 1,
-1.317386, -0.06234378, -1.996054, 1, 0, 0, 1, 1,
-1.310032, 0.305086, -1.017776, 1, 0, 0, 1, 1,
-1.304215, 1.439858, -1.908885, 0, 0, 0, 1, 1,
-1.296255, 1.366095, 1.266477, 0, 0, 0, 1, 1,
-1.292606, 0.8945743, -0.7597636, 0, 0, 0, 1, 1,
-1.287629, -0.8757336, -1.800707, 0, 0, 0, 1, 1,
-1.287294, 2.257433, -1.112076, 0, 0, 0, 1, 1,
-1.286769, -0.2339315, -3.517996, 0, 0, 0, 1, 1,
-1.286362, -0.7434276, -2.04468, 0, 0, 0, 1, 1,
-1.268988, -1.13458, -2.310826, 1, 1, 1, 1, 1,
-1.265098, 0.5418834, -0.07206155, 1, 1, 1, 1, 1,
-1.26325, 1.570883, -1.577077, 1, 1, 1, 1, 1,
-1.252321, -0.4558909, -2.904862, 1, 1, 1, 1, 1,
-1.245422, 1.714207, -0.8757818, 1, 1, 1, 1, 1,
-1.24269, 0.2773774, -1.49018, 1, 1, 1, 1, 1,
-1.24198, -1.397225, -2.297448, 1, 1, 1, 1, 1,
-1.226868, 0.9587297, -0.5467829, 1, 1, 1, 1, 1,
-1.223635, 2.081781, -2.95692, 1, 1, 1, 1, 1,
-1.22345, 0.3520155, -0.9353206, 1, 1, 1, 1, 1,
-1.222473, -1.316053, -1.263949, 1, 1, 1, 1, 1,
-1.222272, -0.6389356, -1.547037, 1, 1, 1, 1, 1,
-1.21527, -1.058765, -3.423155, 1, 1, 1, 1, 1,
-1.209159, 0.8487743, -1.912442, 1, 1, 1, 1, 1,
-1.208303, -0.7230712, -0.8116013, 1, 1, 1, 1, 1,
-1.203587, -1.906545, -4.136372, 0, 0, 1, 1, 1,
-1.200251, 1.949583, -0.1479114, 1, 0, 0, 1, 1,
-1.19665, -0.9500136, -1.365636, 1, 0, 0, 1, 1,
-1.196016, -0.8339894, -2.888897, 1, 0, 0, 1, 1,
-1.189933, -0.01194175, 0.2318776, 1, 0, 0, 1, 1,
-1.188, 0.8408456, 0.4656447, 1, 0, 0, 1, 1,
-1.185742, 0.5357069, -1.242003, 0, 0, 0, 1, 1,
-1.173091, 0.7612181, -0.4519807, 0, 0, 0, 1, 1,
-1.168806, -0.4452552, -0.2861254, 0, 0, 0, 1, 1,
-1.168198, -0.9649062, -0.9551002, 0, 0, 0, 1, 1,
-1.164588, 0.79689, -1.06162, 0, 0, 0, 1, 1,
-1.15419, -0.3333629, -1.298747, 0, 0, 0, 1, 1,
-1.154121, 1.988999, 0.4097033, 0, 0, 0, 1, 1,
-1.150494, 2.397954, 1.512938, 1, 1, 1, 1, 1,
-1.147157, 0.6252488, -1.378083, 1, 1, 1, 1, 1,
-1.142387, -0.6065329, -1.57369, 1, 1, 1, 1, 1,
-1.142238, -0.753727, -3.125296, 1, 1, 1, 1, 1,
-1.140662, 0.4604867, -0.2196763, 1, 1, 1, 1, 1,
-1.135084, 0.8772902, -0.4819483, 1, 1, 1, 1, 1,
-1.132053, 0.2727541, -2.003523, 1, 1, 1, 1, 1,
-1.131426, 1.086907, 0.3096173, 1, 1, 1, 1, 1,
-1.130583, 1.179669, -0.07762806, 1, 1, 1, 1, 1,
-1.129832, -1.239996, -3.231336, 1, 1, 1, 1, 1,
-1.123965, -0.5123404, -1.955287, 1, 1, 1, 1, 1,
-1.119439, -0.6033922, -0.08022503, 1, 1, 1, 1, 1,
-1.116022, -0.09283418, -1.983832, 1, 1, 1, 1, 1,
-1.103419, -0.783744, -2.779444, 1, 1, 1, 1, 1,
-1.09088, -1.366256, -3.522229, 1, 1, 1, 1, 1,
-1.090627, 0.6611813, 0.5426878, 0, 0, 1, 1, 1,
-1.086721, 0.6709375, -1.211302, 1, 0, 0, 1, 1,
-1.080125, -0.5437222, -2.262497, 1, 0, 0, 1, 1,
-1.078604, -1.461372, -1.988485, 1, 0, 0, 1, 1,
-1.075584, 0.27335, -1.366771, 1, 0, 0, 1, 1,
-1.07558, -1.678278, -1.307492, 1, 0, 0, 1, 1,
-1.073918, -1.397004, 0.7873895, 0, 0, 0, 1, 1,
-1.056188, -1.778886, -2.637217, 0, 0, 0, 1, 1,
-1.054135, 0.4377052, -1.828081, 0, 0, 0, 1, 1,
-1.05139, -1.19899, -1.447409, 0, 0, 0, 1, 1,
-1.050338, -0.04702827, -1.054123, 0, 0, 0, 1, 1,
-1.050295, -0.6574959, -2.363188, 0, 0, 0, 1, 1,
-1.049758, 1.092556, 0.9471763, 0, 0, 0, 1, 1,
-1.049351, 1.774273, -0.6586766, 1, 1, 1, 1, 1,
-1.04657, -0.7935352, -0.1078423, 1, 1, 1, 1, 1,
-1.041071, -0.6089261, -2.724427, 1, 1, 1, 1, 1,
-1.025443, -0.3446328, -2.409639, 1, 1, 1, 1, 1,
-1.023756, 0.01481439, -0.2603463, 1, 1, 1, 1, 1,
-1.023551, 0.4030775, -0.444509, 1, 1, 1, 1, 1,
-1.021301, 1.69309, -0.8048514, 1, 1, 1, 1, 1,
-1.01823, -0.7113853, -2.388598, 1, 1, 1, 1, 1,
-1.011903, -0.4816821, -1.780357, 1, 1, 1, 1, 1,
-1.005359, -0.5188066, -1.901409, 1, 1, 1, 1, 1,
-1.002303, -0.9978772, -3.078782, 1, 1, 1, 1, 1,
-0.9971735, -0.3222191, -0.7048506, 1, 1, 1, 1, 1,
-0.9934061, -0.8039311, -2.860584, 1, 1, 1, 1, 1,
-0.9920763, 0.3161846, 0.03534052, 1, 1, 1, 1, 1,
-0.9882619, -1.171957, -2.712275, 1, 1, 1, 1, 1,
-0.9831759, 0.2298816, 0.05337669, 0, 0, 1, 1, 1,
-0.9805966, 0.2365863, -1.671461, 1, 0, 0, 1, 1,
-0.9681289, -0.2525881, -2.63619, 1, 0, 0, 1, 1,
-0.9541615, -2.173452, -1.250253, 1, 0, 0, 1, 1,
-0.9475066, 0.5710179, -0.3848698, 1, 0, 0, 1, 1,
-0.9453967, -0.2417214, -3.047822, 1, 0, 0, 1, 1,
-0.9367211, 1.815398, 0.1148792, 0, 0, 0, 1, 1,
-0.9349878, 0.3242558, -2.611426, 0, 0, 0, 1, 1,
-0.9337552, 0.7099659, 0.8150861, 0, 0, 0, 1, 1,
-0.9332197, 0.1421613, -2.532524, 0, 0, 0, 1, 1,
-0.9318022, 0.9966944, 0.0867481, 0, 0, 0, 1, 1,
-0.9249389, 0.4171125, -1.836164, 0, 0, 0, 1, 1,
-0.9179599, -1.475344, -3.863947, 0, 0, 0, 1, 1,
-0.9161923, -1.303116, -3.214926, 1, 1, 1, 1, 1,
-0.9143447, 0.4759814, -1.313097, 1, 1, 1, 1, 1,
-0.908975, 0.1015197, -2.589715, 1, 1, 1, 1, 1,
-0.9035077, -1.032583, -2.010468, 1, 1, 1, 1, 1,
-0.9017299, -3.568908, -3.897832, 1, 1, 1, 1, 1,
-0.8917189, -0.03907144, -2.219544, 1, 1, 1, 1, 1,
-0.891623, 0.9654045, 0.2314327, 1, 1, 1, 1, 1,
-0.8899506, -0.2107153, -1.679003, 1, 1, 1, 1, 1,
-0.888824, 0.354989, -1.860884, 1, 1, 1, 1, 1,
-0.8846321, -0.3970677, -2.904831, 1, 1, 1, 1, 1,
-0.8828833, -0.106813, -2.762852, 1, 1, 1, 1, 1,
-0.88177, -1.457586, -1.186755, 1, 1, 1, 1, 1,
-0.8814358, 1.34558, 0.2792726, 1, 1, 1, 1, 1,
-0.871657, -0.7719407, -2.933746, 1, 1, 1, 1, 1,
-0.8703081, 0.618008, -1.138709, 1, 1, 1, 1, 1,
-0.8658648, -2.433354, -1.337748, 0, 0, 1, 1, 1,
-0.8648039, 0.4746029, -1.557474, 1, 0, 0, 1, 1,
-0.8619085, -2.024715, -2.506104, 1, 0, 0, 1, 1,
-0.8602197, 0.04853615, -0.1393456, 1, 0, 0, 1, 1,
-0.8571874, -1.693095, -1.633386, 1, 0, 0, 1, 1,
-0.8550783, -0.7983274, -2.399803, 1, 0, 0, 1, 1,
-0.8543876, -0.5536536, -1.399811, 0, 0, 0, 1, 1,
-0.8478711, -0.6070132, -4.312643, 0, 0, 0, 1, 1,
-0.8474607, 0.9316423, 0.2513981, 0, 0, 0, 1, 1,
-0.8439636, -1.191635, -1.545346, 0, 0, 0, 1, 1,
-0.8429865, -1.043275, -2.72674, 0, 0, 0, 1, 1,
-0.8404182, -1.00679, -4.067199, 0, 0, 0, 1, 1,
-0.83314, -0.06830876, 0.1772499, 0, 0, 0, 1, 1,
-0.8283664, 0.2489816, -2.466105, 1, 1, 1, 1, 1,
-0.8053307, 0.5417058, -3.17288, 1, 1, 1, 1, 1,
-0.802851, -0.1116557, -1.180478, 1, 1, 1, 1, 1,
-0.7993921, -0.08683144, -1.726325, 1, 1, 1, 1, 1,
-0.79399, -1.161528, -1.956367, 1, 1, 1, 1, 1,
-0.7860363, -0.8094817, -4.239968, 1, 1, 1, 1, 1,
-0.7840737, -1.090152, -2.743373, 1, 1, 1, 1, 1,
-0.7762947, 1.019857, -1.016881, 1, 1, 1, 1, 1,
-0.7750395, 0.1190274, -0.6112133, 1, 1, 1, 1, 1,
-0.773726, 1.591718, -0.4944205, 1, 1, 1, 1, 1,
-0.7692249, -0.02072759, -1.91584, 1, 1, 1, 1, 1,
-0.7687337, -0.4344349, -1.234937, 1, 1, 1, 1, 1,
-0.7668996, 0.6970589, -1.704443, 1, 1, 1, 1, 1,
-0.7533047, 1.136683, -0.1514184, 1, 1, 1, 1, 1,
-0.7527426, -1.08476, -3.767029, 1, 1, 1, 1, 1,
-0.7518795, -0.5183927, -1.817239, 0, 0, 1, 1, 1,
-0.7517734, 0.6444843, -0.9074423, 1, 0, 0, 1, 1,
-0.7504417, 0.6928847, -1.64042, 1, 0, 0, 1, 1,
-0.7497633, 0.7117192, -1.01097, 1, 0, 0, 1, 1,
-0.7476256, 0.06476475, -0.2191246, 1, 0, 0, 1, 1,
-0.7463571, -0.4178129, -2.163729, 1, 0, 0, 1, 1,
-0.7408066, 0.7289015, -0.03487302, 0, 0, 0, 1, 1,
-0.7385778, -0.4715985, -1.730772, 0, 0, 0, 1, 1,
-0.7360168, 0.6529459, -1.409297, 0, 0, 0, 1, 1,
-0.7351311, 1.116264, 0.495109, 0, 0, 0, 1, 1,
-0.7332438, -0.09603283, -1.798027, 0, 0, 0, 1, 1,
-0.7229949, -0.6047465, -4.193428, 0, 0, 0, 1, 1,
-0.7189222, 0.8707055, -0.3640647, 0, 0, 0, 1, 1,
-0.712607, -0.4305343, -1.745452, 1, 1, 1, 1, 1,
-0.7079154, -0.5409745, -4.042571, 1, 1, 1, 1, 1,
-0.7058564, -0.4914329, -1.563544, 1, 1, 1, 1, 1,
-0.7039399, -0.5297537, -0.6546044, 1, 1, 1, 1, 1,
-0.6980006, 1.079502, -1.241883, 1, 1, 1, 1, 1,
-0.6923347, 0.3591186, -2.108649, 1, 1, 1, 1, 1,
-0.6882411, -2.297048, -0.7325209, 1, 1, 1, 1, 1,
-0.687271, -0.3845919, -2.393851, 1, 1, 1, 1, 1,
-0.6862836, 0.03692159, -2.591244, 1, 1, 1, 1, 1,
-0.6736342, -0.4886927, -2.880362, 1, 1, 1, 1, 1,
-0.6727509, 1.612687, 0.3692464, 1, 1, 1, 1, 1,
-0.6709495, 0.04339438, -2.329899, 1, 1, 1, 1, 1,
-0.6621271, 0.6345981, -0.5579109, 1, 1, 1, 1, 1,
-0.6606709, -0.1989471, -2.129218, 1, 1, 1, 1, 1,
-0.6604399, -1.671396, -2.736114, 1, 1, 1, 1, 1,
-0.657393, 0.3939555, 0.3835776, 0, 0, 1, 1, 1,
-0.6527222, -2.727164, -3.693753, 1, 0, 0, 1, 1,
-0.6492424, -0.3262698, -1.432158, 1, 0, 0, 1, 1,
-0.6479722, -0.5521005, -3.572023, 1, 0, 0, 1, 1,
-0.6476415, 0.5363401, -1.246044, 1, 0, 0, 1, 1,
-0.6441583, 1.347485, -0.2860783, 1, 0, 0, 1, 1,
-0.6325544, -0.6298715, -2.40732, 0, 0, 0, 1, 1,
-0.631062, -0.7539055, -1.015126, 0, 0, 0, 1, 1,
-0.630686, -1.539253, -2.695267, 0, 0, 0, 1, 1,
-0.6302522, 0.6666991, -1.039582, 0, 0, 0, 1, 1,
-0.6253129, 1.62182, -1.620372, 0, 0, 0, 1, 1,
-0.6164698, -0.9803828, -3.189987, 0, 0, 0, 1, 1,
-0.6158633, 1.328973, -1.076923, 0, 0, 0, 1, 1,
-0.6145827, -0.7532344, -2.214251, 1, 1, 1, 1, 1,
-0.610485, -0.4463184, -1.801196, 1, 1, 1, 1, 1,
-0.6083968, 0.2079447, -0.3103679, 1, 1, 1, 1, 1,
-0.6069246, 1.064655, -0.5263971, 1, 1, 1, 1, 1,
-0.5948974, 0.881189, 0.278795, 1, 1, 1, 1, 1,
-0.5944852, 0.4398428, -1.403792, 1, 1, 1, 1, 1,
-0.5943541, -0.2270399, -1.457823, 1, 1, 1, 1, 1,
-0.5940169, -0.7317787, -2.191652, 1, 1, 1, 1, 1,
-0.5937428, 0.1543154, -0.4808156, 1, 1, 1, 1, 1,
-0.5935847, 0.7862705, 0.02168792, 1, 1, 1, 1, 1,
-0.5835816, 0.6123638, -0.3291741, 1, 1, 1, 1, 1,
-0.5732877, 0.06197094, -1.436361, 1, 1, 1, 1, 1,
-0.5699687, 0.2364815, -1.980208, 1, 1, 1, 1, 1,
-0.5659046, 0.8243278, -2.422304, 1, 1, 1, 1, 1,
-0.5654432, -1.039743, -3.66685, 1, 1, 1, 1, 1,
-0.564658, 0.7049704, -0.08645879, 0, 0, 1, 1, 1,
-0.5564648, 0.4980651, -1.626057, 1, 0, 0, 1, 1,
-0.5558094, -0.2696722, -3.316637, 1, 0, 0, 1, 1,
-0.5536227, -0.3873061, -2.452869, 1, 0, 0, 1, 1,
-0.5449873, 0.9489098, -0.8282773, 1, 0, 0, 1, 1,
-0.5445865, -0.5717661, -1.694513, 1, 0, 0, 1, 1,
-0.5440081, -0.9625543, -2.286987, 0, 0, 0, 1, 1,
-0.5422065, 0.1770347, -0.3080123, 0, 0, 0, 1, 1,
-0.5417488, -0.1825556, -3.051023, 0, 0, 0, 1, 1,
-0.5403787, -0.3176047, -4.205232, 0, 0, 0, 1, 1,
-0.5403439, -0.5693117, -0.4154488, 0, 0, 0, 1, 1,
-0.5399821, -0.312798, -2.067006, 0, 0, 0, 1, 1,
-0.5370825, 0.4931181, -2.046745, 0, 0, 0, 1, 1,
-0.5364586, 1.853657, -1.265881, 1, 1, 1, 1, 1,
-0.5327263, -1.62672, -3.01579, 1, 1, 1, 1, 1,
-0.5225273, 0.2786581, -0.1338302, 1, 1, 1, 1, 1,
-0.5208275, 1.063884, -1.504999, 1, 1, 1, 1, 1,
-0.5113329, 2.51762, 0.407807, 1, 1, 1, 1, 1,
-0.5091885, 0.5462639, -0.7418525, 1, 1, 1, 1, 1,
-0.5082331, -2.294372, -4.680006, 1, 1, 1, 1, 1,
-0.5060128, -0.2904613, -3.957139, 1, 1, 1, 1, 1,
-0.5058311, 0.1013618, -1.327319, 1, 1, 1, 1, 1,
-0.5038975, 0.9744859, 0.08390848, 1, 1, 1, 1, 1,
-0.4997128, -0.2775601, -4.08426, 1, 1, 1, 1, 1,
-0.4982932, 1.146459, -1.850409, 1, 1, 1, 1, 1,
-0.4960067, -0.3241906, -2.63684, 1, 1, 1, 1, 1,
-0.4952115, 0.4408931, -0.5593625, 1, 1, 1, 1, 1,
-0.4941809, -1.253587, -3.989109, 1, 1, 1, 1, 1,
-0.4927758, 0.3585734, -0.1224449, 0, 0, 1, 1, 1,
-0.4884512, -0.3872781, -2.220925, 1, 0, 0, 1, 1,
-0.4866399, -0.2492936, -2.262944, 1, 0, 0, 1, 1,
-0.4848332, -1.069419, -1.823921, 1, 0, 0, 1, 1,
-0.4835307, -0.5041009, -2.067715, 1, 0, 0, 1, 1,
-0.4823103, 0.6839508, 0.005824705, 1, 0, 0, 1, 1,
-0.4809651, -1.166095, -2.575221, 0, 0, 0, 1, 1,
-0.4805278, -0.9814136, -2.419901, 0, 0, 0, 1, 1,
-0.4773622, 0.1765428, -1.789078, 0, 0, 0, 1, 1,
-0.4770635, -2.029653, -3.40508, 0, 0, 0, 1, 1,
-0.4723336, -1.542897, -2.325032, 0, 0, 0, 1, 1,
-0.4719636, -0.669626, -2.912794, 0, 0, 0, 1, 1,
-0.4691387, 0.1188099, -2.833088, 0, 0, 0, 1, 1,
-0.4650073, -0.9538248, -2.696938, 1, 1, 1, 1, 1,
-0.4584042, -0.7860315, -2.488536, 1, 1, 1, 1, 1,
-0.4582261, 1.03404, 1.055533, 1, 1, 1, 1, 1,
-0.4567819, 0.063581, 0.1816116, 1, 1, 1, 1, 1,
-0.4534591, 0.9211568, 0.8599184, 1, 1, 1, 1, 1,
-0.4529003, -1.965801, -2.465601, 1, 1, 1, 1, 1,
-0.4492051, 0.7469898, -0.02806028, 1, 1, 1, 1, 1,
-0.4487473, -2.495213, -2.133826, 1, 1, 1, 1, 1,
-0.4468185, 0.01793764, -1.065315, 1, 1, 1, 1, 1,
-0.4415734, -0.02147536, -0.975793, 1, 1, 1, 1, 1,
-0.4404106, -0.6267523, -2.207934, 1, 1, 1, 1, 1,
-0.4382669, -1.536128, -4.934598, 1, 1, 1, 1, 1,
-0.4378577, -1.166533, -4.194492, 1, 1, 1, 1, 1,
-0.4374221, -1.15805, -2.4809, 1, 1, 1, 1, 1,
-0.4352122, 0.6949521, -0.4631462, 1, 1, 1, 1, 1,
-0.4350502, 0.1592231, -1.450413, 0, 0, 1, 1, 1,
-0.4312032, 0.8033943, -0.5330191, 1, 0, 0, 1, 1,
-0.4277263, -0.3871349, -2.828607, 1, 0, 0, 1, 1,
-0.4266288, -0.2964247, -3.135162, 1, 0, 0, 1, 1,
-0.4244107, 0.6114596, 0.2787473, 1, 0, 0, 1, 1,
-0.4236952, -1.234693, -2.944167, 1, 0, 0, 1, 1,
-0.418577, -1.724515, -3.514324, 0, 0, 0, 1, 1,
-0.4169298, -0.4035325, -2.611382, 0, 0, 0, 1, 1,
-0.416079, -0.5542288, -2.798247, 0, 0, 0, 1, 1,
-0.4151258, -1.488613, -2.659135, 0, 0, 0, 1, 1,
-0.4107171, 0.7254835, -0.4956212, 0, 0, 0, 1, 1,
-0.4070168, -0.08478623, -2.052615, 0, 0, 0, 1, 1,
-0.402142, -0.8918142, -2.579953, 0, 0, 0, 1, 1,
-0.4001179, 0.09353634, -1.384225, 1, 1, 1, 1, 1,
-0.3990591, -2.75612, -1.440879, 1, 1, 1, 1, 1,
-0.3986717, -0.2594565, -0.9471361, 1, 1, 1, 1, 1,
-0.3984586, 0.9630475, -0.3728712, 1, 1, 1, 1, 1,
-0.3962819, -1.722091, -1.414965, 1, 1, 1, 1, 1,
-0.3945526, -0.1745966, -0.9699494, 1, 1, 1, 1, 1,
-0.3921692, 0.5722304, -0.706359, 1, 1, 1, 1, 1,
-0.3871919, -0.8922762, -4.400015, 1, 1, 1, 1, 1,
-0.38634, 1.779004, 0.296258, 1, 1, 1, 1, 1,
-0.386264, 0.7401356, 1.259716, 1, 1, 1, 1, 1,
-0.3860203, 1.4363, -0.5055957, 1, 1, 1, 1, 1,
-0.3835821, -0.9334675, -3.430421, 1, 1, 1, 1, 1,
-0.3817227, -0.04745578, -3.950951, 1, 1, 1, 1, 1,
-0.3774011, 0.2742797, -0.7172324, 1, 1, 1, 1, 1,
-0.3766749, -0.2275953, -1.780156, 1, 1, 1, 1, 1,
-0.3758157, 0.123617, -0.313087, 0, 0, 1, 1, 1,
-0.3725255, -0.6344979, -1.415109, 1, 0, 0, 1, 1,
-0.3659774, 2.488338, 0.2049991, 1, 0, 0, 1, 1,
-0.3646467, -0.3469648, -4.121732, 1, 0, 0, 1, 1,
-0.361738, 0.19095, -0.2963892, 1, 0, 0, 1, 1,
-0.3615273, 0.7066157, 1.636697, 1, 0, 0, 1, 1,
-0.3611215, -0.1033935, -2.883052, 0, 0, 0, 1, 1,
-0.3569615, -1.555653, -4.858448, 0, 0, 0, 1, 1,
-0.3562391, -0.443325, -1.202846, 0, 0, 0, 1, 1,
-0.3546106, -0.7679662, -2.233679, 0, 0, 0, 1, 1,
-0.3508927, -1.530131, -4.023953, 0, 0, 0, 1, 1,
-0.3507706, -0.5162029, -3.927605, 0, 0, 0, 1, 1,
-0.3494008, 1.177312, -1.084281, 0, 0, 0, 1, 1,
-0.3442612, 1.05601, 0.06606159, 1, 1, 1, 1, 1,
-0.3423572, 0.9756209, -1.159339, 1, 1, 1, 1, 1,
-0.3366631, -0.1934448, -1.458031, 1, 1, 1, 1, 1,
-0.3360478, -1.066528, -2.522549, 1, 1, 1, 1, 1,
-0.3359236, -0.03624224, -2.509086, 1, 1, 1, 1, 1,
-0.3334581, 1.033151, -1.176466, 1, 1, 1, 1, 1,
-0.3233087, -0.7312198, -2.538896, 1, 1, 1, 1, 1,
-0.3217018, 1.731775, 0.3762265, 1, 1, 1, 1, 1,
-0.319483, 0.6733975, -2.238066, 1, 1, 1, 1, 1,
-0.3134996, 0.1528545, -3.329484, 1, 1, 1, 1, 1,
-0.3095974, 0.4730526, -1.688125, 1, 1, 1, 1, 1,
-0.3089774, -0.3970312, -2.749064, 1, 1, 1, 1, 1,
-0.3086146, 0.8367774, 0.5041922, 1, 1, 1, 1, 1,
-0.3075891, -0.004618037, -2.666614, 1, 1, 1, 1, 1,
-0.3073147, -0.3717122, -2.42137, 1, 1, 1, 1, 1,
-0.3046904, 0.4241418, -0.5732356, 0, 0, 1, 1, 1,
-0.3016416, -0.9142399, -2.525955, 1, 0, 0, 1, 1,
-0.2980603, 1.019763, 1.529218, 1, 0, 0, 1, 1,
-0.2924966, 0.6131335, -0.7452408, 1, 0, 0, 1, 1,
-0.2923883, 1.329058, -0.01162809, 1, 0, 0, 1, 1,
-0.2895211, -1.643483, -3.31562, 1, 0, 0, 1, 1,
-0.2794218, -0.3609466, -2.508077, 0, 0, 0, 1, 1,
-0.2777356, -0.09928171, -1.324341, 0, 0, 0, 1, 1,
-0.2723716, 0.2614699, -0.3362448, 0, 0, 0, 1, 1,
-0.2695863, -0.1616292, -1.285679, 0, 0, 0, 1, 1,
-0.2691828, -0.0102366, -0.4795351, 0, 0, 0, 1, 1,
-0.2688154, 0.3743714, -0.6226355, 0, 0, 0, 1, 1,
-0.2681649, 1.304017, 0.8237839, 0, 0, 0, 1, 1,
-0.2632278, -0.8901204, -3.217869, 1, 1, 1, 1, 1,
-0.2630108, 0.9107304, 0.2466677, 1, 1, 1, 1, 1,
-0.2596156, -1.28936, -2.407224, 1, 1, 1, 1, 1,
-0.2577312, 1.528455, -0.6451451, 1, 1, 1, 1, 1,
-0.2534766, 1.380075, 0.4282011, 1, 1, 1, 1, 1,
-0.2504306, -1.481183, -4.242462, 1, 1, 1, 1, 1,
-0.249708, 0.03850407, -3.164437, 1, 1, 1, 1, 1,
-0.2486833, 1.911198, 1.409457, 1, 1, 1, 1, 1,
-0.248081, 0.9359541, -2.36812, 1, 1, 1, 1, 1,
-0.2478941, 0.6369393, 0.3277266, 1, 1, 1, 1, 1,
-0.2469125, -1.767877, -3.95681, 1, 1, 1, 1, 1,
-0.2468708, 0.6746886, -1.387271, 1, 1, 1, 1, 1,
-0.2427348, -1.385798, -4.377936, 1, 1, 1, 1, 1,
-0.2424691, 0.6108938, -0.6273497, 1, 1, 1, 1, 1,
-0.2404477, -0.5300226, -1.969546, 1, 1, 1, 1, 1,
-0.2369036, -0.6362522, -5.621338, 0, 0, 1, 1, 1,
-0.235429, -0.2197942, -2.760104, 1, 0, 0, 1, 1,
-0.2351526, -0.1169847, -2.129721, 1, 0, 0, 1, 1,
-0.2351512, -0.5318225, -4.107311, 1, 0, 0, 1, 1,
-0.2347451, -0.9246903, -2.789033, 1, 0, 0, 1, 1,
-0.2314813, -0.4659568, -1.938936, 1, 0, 0, 1, 1,
-0.2216546, -1.544386, -3.695761, 0, 0, 0, 1, 1,
-0.2214416, -0.1773727, -0.1109338, 0, 0, 0, 1, 1,
-0.2175069, 0.7242263, -0.9236515, 0, 0, 0, 1, 1,
-0.2140358, 0.04327799, -2.842615, 0, 0, 0, 1, 1,
-0.2139177, 0.1986566, -1.005233, 0, 0, 0, 1, 1,
-0.2123311, 2.017486, -1.077137, 0, 0, 0, 1, 1,
-0.2118159, -1.754407, -2.786412, 0, 0, 0, 1, 1,
-0.2053585, 0.8714095, -0.9305921, 1, 1, 1, 1, 1,
-0.2044066, -0.1823465, -1.531074, 1, 1, 1, 1, 1,
-0.2001384, 0.6927614, -0.5931048, 1, 1, 1, 1, 1,
-0.1984317, 1.264466, 1.934524, 1, 1, 1, 1, 1,
-0.195265, 0.4440705, 0.0562313, 1, 1, 1, 1, 1,
-0.188577, 0.8414987, -2.879735, 1, 1, 1, 1, 1,
-0.1827338, -0.3979165, -4.36561, 1, 1, 1, 1, 1,
-0.1805173, 2.586052, -0.1444532, 1, 1, 1, 1, 1,
-0.1802838, -0.005514115, -2.906545, 1, 1, 1, 1, 1,
-0.1766241, 1.084167, -0.8546728, 1, 1, 1, 1, 1,
-0.1765555, -1.939574, -2.802958, 1, 1, 1, 1, 1,
-0.1695732, 0.7108586, 0.6689886, 1, 1, 1, 1, 1,
-0.1678964, -0.04311367, -1.969727, 1, 1, 1, 1, 1,
-0.1644426, -0.07821274, -2.082841, 1, 1, 1, 1, 1,
-0.1601714, -1.286704, -3.812773, 1, 1, 1, 1, 1,
-0.1592171, -0.5151099, -2.022997, 0, 0, 1, 1, 1,
-0.1487636, -1.463155, -1.415687, 1, 0, 0, 1, 1,
-0.1485006, 3.024992, 0.6666759, 1, 0, 0, 1, 1,
-0.1357329, 1.056681, 0.7462604, 1, 0, 0, 1, 1,
-0.133713, -0.07745596, -1.619844, 1, 0, 0, 1, 1,
-0.1273756, 1.209881, 0.4275616, 1, 0, 0, 1, 1,
-0.1266261, -1.613969, -1.221536, 0, 0, 0, 1, 1,
-0.1262143, -0.682531, -3.919791, 0, 0, 0, 1, 1,
-0.1209329, 1.062849, 1.028488, 0, 0, 0, 1, 1,
-0.1196088, -2.229792, -3.985892, 0, 0, 0, 1, 1,
-0.1193968, 0.3482357, -2.098019, 0, 0, 0, 1, 1,
-0.1139345, -0.2708089, -3.195591, 0, 0, 0, 1, 1,
-0.1121408, -0.04462496, -3.096509, 0, 0, 0, 1, 1,
-0.1119799, -0.05597411, 0.8170692, 1, 1, 1, 1, 1,
-0.1093881, -1.219986, -3.975792, 1, 1, 1, 1, 1,
-0.107585, 0.4490782, -1.04112, 1, 1, 1, 1, 1,
-0.1062314, 1.266745, 0.9050207, 1, 1, 1, 1, 1,
-0.1059853, -1.715504, -2.612633, 1, 1, 1, 1, 1,
-0.1054197, -0.5520127, -0.4742482, 1, 1, 1, 1, 1,
-0.1044873, 0.6518595, -0.120229, 1, 1, 1, 1, 1,
-0.09273358, 0.4900156, -1.577644, 1, 1, 1, 1, 1,
-0.09169292, -0.4461442, -2.654884, 1, 1, 1, 1, 1,
-0.08953159, 0.4661835, -0.7175599, 1, 1, 1, 1, 1,
-0.0891946, -0.5592786, -2.142724, 1, 1, 1, 1, 1,
-0.08897346, 1.236793, 2.719764, 1, 1, 1, 1, 1,
-0.08874219, -1.166691, -3.839035, 1, 1, 1, 1, 1,
-0.08431853, 1.342245, 1.551028, 1, 1, 1, 1, 1,
-0.08409982, -0.4588029, -3.351323, 1, 1, 1, 1, 1,
-0.08361553, -0.9084697, -2.390528, 0, 0, 1, 1, 1,
-0.08357354, -0.2488907, -4.269261, 1, 0, 0, 1, 1,
-0.07951418, -1.475969, -3.606639, 1, 0, 0, 1, 1,
-0.07894014, -1.350031, -3.286834, 1, 0, 0, 1, 1,
-0.07892831, 0.3147331, 0.05889546, 1, 0, 0, 1, 1,
-0.07823624, -0.1283154, -2.35413, 1, 0, 0, 1, 1,
-0.07515938, 0.7325981, 0.4260077, 0, 0, 0, 1, 1,
-0.07501261, -0.4844386, -3.795622, 0, 0, 0, 1, 1,
-0.07315837, 1.336505, -1.737438, 0, 0, 0, 1, 1,
-0.07119257, -1.455482, -1.709326, 0, 0, 0, 1, 1,
-0.06914269, 1.274177, -1.014329, 0, 0, 0, 1, 1,
-0.06731006, 0.4971843, 2.283132, 0, 0, 0, 1, 1,
-0.06048679, 0.5193687, -1.69847, 0, 0, 0, 1, 1,
-0.05931067, -0.4503788, -0.7846016, 1, 1, 1, 1, 1,
-0.05899327, -0.0335389, -0.4763672, 1, 1, 1, 1, 1,
-0.0553313, -1.818424, -3.280969, 1, 1, 1, 1, 1,
-0.05094082, -0.3494304, -3.359899, 1, 1, 1, 1, 1,
-0.05093687, -0.5466751, -2.693578, 1, 1, 1, 1, 1,
-0.0490111, -0.6968995, -3.334553, 1, 1, 1, 1, 1,
-0.04465511, 0.8095483, -0.3304683, 1, 1, 1, 1, 1,
-0.04153375, -0.9122126, -2.807238, 1, 1, 1, 1, 1,
-0.04108328, 0.9812444, 1.552283, 1, 1, 1, 1, 1,
-0.03577519, 0.6983938, 0.1578646, 1, 1, 1, 1, 1,
-0.03562141, -0.1178066, -4.304472, 1, 1, 1, 1, 1,
-0.0341373, -0.5705249, -1.911564, 1, 1, 1, 1, 1,
-0.03140217, 0.6789568, -0.4260533, 1, 1, 1, 1, 1,
-0.03101387, -0.2740266, -1.17564, 1, 1, 1, 1, 1,
-0.03026291, 2.105317, -0.1873297, 1, 1, 1, 1, 1,
-0.03016824, 0.3249373, -0.2245862, 0, 0, 1, 1, 1,
-0.02445873, 0.2227464, -0.8973218, 1, 0, 0, 1, 1,
-0.02377794, -1.033564, -2.275783, 1, 0, 0, 1, 1,
-0.01859378, 0.4852713, 2.125569, 1, 0, 0, 1, 1,
-0.01785968, 1.206778, 0.2361794, 1, 0, 0, 1, 1,
-0.008965872, -1.404696, -2.607264, 1, 0, 0, 1, 1,
-0.00595502, -1.203346, -2.329362, 0, 0, 0, 1, 1,
-0.001615848, -0.672675, -2.721076, 0, 0, 0, 1, 1,
0.002528752, 1.583922, -0.5536255, 0, 0, 0, 1, 1,
0.003048051, -0.1992572, 4.285254, 0, 0, 0, 1, 1,
0.003700601, 0.9780688, 0.5459782, 0, 0, 0, 1, 1,
0.007069799, -0.202456, 2.798242, 0, 0, 0, 1, 1,
0.00808735, 0.5647143, -0.7521799, 0, 0, 0, 1, 1,
0.01334597, -0.2258056, 1.639406, 1, 1, 1, 1, 1,
0.01628999, 0.8634905, 1.491952, 1, 1, 1, 1, 1,
0.01770374, 0.9673643, -1.370532, 1, 1, 1, 1, 1,
0.02179883, 0.9464779, 1.757189, 1, 1, 1, 1, 1,
0.02830664, -0.9097863, 2.55955, 1, 1, 1, 1, 1,
0.02934266, -0.3889691, 4.3044, 1, 1, 1, 1, 1,
0.03113629, -0.5452114, 4.678439, 1, 1, 1, 1, 1,
0.03978516, -0.07055915, 2.953466, 1, 1, 1, 1, 1,
0.04110738, 0.5053283, -0.5532774, 1, 1, 1, 1, 1,
0.04178202, -0.5662724, 2.168642, 1, 1, 1, 1, 1,
0.04469215, 1.477335, -0.2799513, 1, 1, 1, 1, 1,
0.04872707, -0.3590543, 0.4653728, 1, 1, 1, 1, 1,
0.05012485, 0.7295135, -1.076113, 1, 1, 1, 1, 1,
0.0524848, -0.2942378, 0.6903418, 1, 1, 1, 1, 1,
0.0525235, -1.549215, 2.506579, 1, 1, 1, 1, 1,
0.06234216, 0.5362886, 0.8359843, 0, 0, 1, 1, 1,
0.06594565, 0.9099975, 0.1224567, 1, 0, 0, 1, 1,
0.0662454, 0.5728226, 0.3431652, 1, 0, 0, 1, 1,
0.0693474, 0.2029188, 0.1045218, 1, 0, 0, 1, 1,
0.07051802, -0.7428024, 1.049779, 1, 0, 0, 1, 1,
0.07085864, -0.3917693, 1.003991, 1, 0, 0, 1, 1,
0.07238761, -0.1006598, 1.729929, 0, 0, 0, 1, 1,
0.07356314, 1.391479, 0.3803724, 0, 0, 0, 1, 1,
0.07590572, 1.515475, -1.597966, 0, 0, 0, 1, 1,
0.08440054, 0.5768995, -1.684105, 0, 0, 0, 1, 1,
0.08616301, 0.4020054, -0.948982, 0, 0, 0, 1, 1,
0.09029672, -0.1753809, 2.959511, 0, 0, 0, 1, 1,
0.0903358, -1.707874, 2.424909, 0, 0, 0, 1, 1,
0.09232899, 1.293881, 0.181995, 1, 1, 1, 1, 1,
0.09756297, -0.8541711, 1.642224, 1, 1, 1, 1, 1,
0.09785427, -0.3376264, 3.699714, 1, 1, 1, 1, 1,
0.09819748, -0.8653855, 3.221499, 1, 1, 1, 1, 1,
0.09908328, -2.280885, 1.543657, 1, 1, 1, 1, 1,
0.1005942, -0.02436347, 0.5403611, 1, 1, 1, 1, 1,
0.1007835, 0.7351276, -0.2977566, 1, 1, 1, 1, 1,
0.1016756, -1.016589, 2.950586, 1, 1, 1, 1, 1,
0.102661, -0.3109558, 3.277651, 1, 1, 1, 1, 1,
0.1164105, -1.042136, 4.203171, 1, 1, 1, 1, 1,
0.1268369, 0.1480175, -1.241423, 1, 1, 1, 1, 1,
0.1301699, 1.017991, 1.33666, 1, 1, 1, 1, 1,
0.1344752, 0.2974845, 1.038701, 1, 1, 1, 1, 1,
0.1366099, 1.214777, 0.3483718, 1, 1, 1, 1, 1,
0.1369062, 0.1171245, 1.461037, 1, 1, 1, 1, 1,
0.1379985, -0.9980248, 2.956253, 0, 0, 1, 1, 1,
0.1398174, 0.7683489, -0.2276038, 1, 0, 0, 1, 1,
0.1401578, 0.02543875, 1.983995, 1, 0, 0, 1, 1,
0.1422305, 0.6248522, 0.002171659, 1, 0, 0, 1, 1,
0.1637293, -0.6068195, 4.218922, 1, 0, 0, 1, 1,
0.1639959, 1.258133, 0.5896826, 1, 0, 0, 1, 1,
0.1674691, -0.4494971, 2.427237, 0, 0, 0, 1, 1,
0.1675482, -0.5547132, 3.951152, 0, 0, 0, 1, 1,
0.1690098, 0.3462, -0.7445134, 0, 0, 0, 1, 1,
0.16983, 0.5920711, 0.03955736, 0, 0, 0, 1, 1,
0.170329, 0.2293899, -0.3022557, 0, 0, 0, 1, 1,
0.1706856, -0.6154446, 3.238689, 0, 0, 0, 1, 1,
0.1752554, -1.205884, 2.581377, 0, 0, 0, 1, 1,
0.180646, -2.009432, 3.143551, 1, 1, 1, 1, 1,
0.1863343, -0.4445802, 2.317272, 1, 1, 1, 1, 1,
0.1895199, 0.13185, 1.765922, 1, 1, 1, 1, 1,
0.1901692, -2.663522, 3.520762, 1, 1, 1, 1, 1,
0.1929347, -0.5303015, 2.50031, 1, 1, 1, 1, 1,
0.1961436, -0.5696493, 3.272096, 1, 1, 1, 1, 1,
0.1979773, 0.5748402, 0.6849037, 1, 1, 1, 1, 1,
0.1989277, 2.005117, 0.4082397, 1, 1, 1, 1, 1,
0.2040812, 1.122901, -0.1822878, 1, 1, 1, 1, 1,
0.2043232, 1.378915, 0.4698617, 1, 1, 1, 1, 1,
0.2043374, 0.3236679, 0.1784261, 1, 1, 1, 1, 1,
0.2052476, 0.2502499, 1.658681, 1, 1, 1, 1, 1,
0.2104346, 0.6359237, -1.300691, 1, 1, 1, 1, 1,
0.214193, 0.4623468, 0.2772233, 1, 1, 1, 1, 1,
0.2147894, -0.1979376, 4.389488, 1, 1, 1, 1, 1,
0.2153085, 0.2685342, 0.5353633, 0, 0, 1, 1, 1,
0.2213912, -1.782422, 3.101346, 1, 0, 0, 1, 1,
0.2214822, 0.6969113, 1.517067, 1, 0, 0, 1, 1,
0.2225149, 0.6125876, 2.102726, 1, 0, 0, 1, 1,
0.2274374, -0.170872, 1.832916, 1, 0, 0, 1, 1,
0.2276265, 0.5880194, 0.1221979, 1, 0, 0, 1, 1,
0.2317295, 0.05394098, 2.709878, 0, 0, 0, 1, 1,
0.232726, 0.4338853, -2.683912, 0, 0, 0, 1, 1,
0.232803, -0.1064332, 2.059945, 0, 0, 0, 1, 1,
0.2329438, -0.658657, 3.482745, 0, 0, 0, 1, 1,
0.2347686, -0.5744997, 3.679374, 0, 0, 0, 1, 1,
0.2356757, -1.375099, 3.364107, 0, 0, 0, 1, 1,
0.2371501, 1.503002, 0.09668085, 0, 0, 0, 1, 1,
0.2371981, -0.6358581, 1.790351, 1, 1, 1, 1, 1,
0.2381042, 2.241478, -0.2687946, 1, 1, 1, 1, 1,
0.2408061, 1.48264, 0.2409842, 1, 1, 1, 1, 1,
0.2424141, -1.349392, 3.876302, 1, 1, 1, 1, 1,
0.2425269, -0.2765998, 2.187865, 1, 1, 1, 1, 1,
0.2481196, -0.356518, 3.099022, 1, 1, 1, 1, 1,
0.2511665, -1.495234, 1.945049, 1, 1, 1, 1, 1,
0.2591935, 0.4919476, 0.2577164, 1, 1, 1, 1, 1,
0.2596465, -0.4906301, 2.983744, 1, 1, 1, 1, 1,
0.2603613, 0.106374, 1.055434, 1, 1, 1, 1, 1,
0.2609961, 2.198886, 0.009253285, 1, 1, 1, 1, 1,
0.2626061, -1.731707, 1.347581, 1, 1, 1, 1, 1,
0.2633668, -0.01160284, 1.497884, 1, 1, 1, 1, 1,
0.263902, -0.8385724, 2.215693, 1, 1, 1, 1, 1,
0.2642889, -1.935614, 3.503361, 1, 1, 1, 1, 1,
0.2646325, -0.4839118, 3.006631, 0, 0, 1, 1, 1,
0.2693773, -2.226521, 3.681162, 1, 0, 0, 1, 1,
0.2699969, 0.8803985, 0.1250342, 1, 0, 0, 1, 1,
0.2711968, -0.7582956, 1.924136, 1, 0, 0, 1, 1,
0.2744992, 0.6493536, 1.426766, 1, 0, 0, 1, 1,
0.2771592, -0.8804388, 1.943345, 1, 0, 0, 1, 1,
0.2777765, -1.442208, 3.31035, 0, 0, 0, 1, 1,
0.2782174, -1.079201, 2.301666, 0, 0, 0, 1, 1,
0.2868828, -0.03971532, 2.253852, 0, 0, 0, 1, 1,
0.2914484, -0.1248181, 1.853753, 0, 0, 0, 1, 1,
0.2919877, -0.3060229, 0.9006193, 0, 0, 0, 1, 1,
0.2933963, -0.2554547, 2.567583, 0, 0, 0, 1, 1,
0.2953643, -1.41671, 1.371565, 0, 0, 0, 1, 1,
0.2979228, 1.445436, 1.091898, 1, 1, 1, 1, 1,
0.3037389, 0.6080692, -0.3067108, 1, 1, 1, 1, 1,
0.3053454, -0.6875649, 2.521632, 1, 1, 1, 1, 1,
0.3055468, 0.6268849, 0.4755103, 1, 1, 1, 1, 1,
0.3079554, 0.001490324, 1.918839, 1, 1, 1, 1, 1,
0.3111257, 0.4411777, 0.878792, 1, 1, 1, 1, 1,
0.3153297, -1.633814, 2.890074, 1, 1, 1, 1, 1,
0.3155227, 1.477664, 1.003593, 1, 1, 1, 1, 1,
0.3161566, -0.9174723, 1.874184, 1, 1, 1, 1, 1,
0.3242354, 1.493706, -1.54981, 1, 1, 1, 1, 1,
0.3352602, 0.655615, -0.9164715, 1, 1, 1, 1, 1,
0.3356694, -1.283103, 2.813271, 1, 1, 1, 1, 1,
0.3403666, -0.135818, 3.607826, 1, 1, 1, 1, 1,
0.340516, 0.9837037, 1.570146, 1, 1, 1, 1, 1,
0.3512837, 0.9164742, -0.3116567, 1, 1, 1, 1, 1,
0.3582518, -1.122535, 2.875746, 0, 0, 1, 1, 1,
0.3614595, 1.071906, -0.9810328, 1, 0, 0, 1, 1,
0.3615229, -0.3903299, 3.587773, 1, 0, 0, 1, 1,
0.3623946, 2.526347, 0.5161504, 1, 0, 0, 1, 1,
0.3635133, 0.5323726, 0.8253714, 1, 0, 0, 1, 1,
0.3666927, 2.46252, -0.1137153, 1, 0, 0, 1, 1,
0.3673187, -0.2765922, 0.5966893, 0, 0, 0, 1, 1,
0.3694437, -0.1378331, 1.99345, 0, 0, 0, 1, 1,
0.3747298, -0.8532571, 2.600423, 0, 0, 0, 1, 1,
0.377146, 0.4163682, 0.8574557, 0, 0, 0, 1, 1,
0.3846926, 0.4396708, 2.074372, 0, 0, 0, 1, 1,
0.3853917, 0.2237502, 0.6039265, 0, 0, 0, 1, 1,
0.3867453, -0.01350247, 2.242546, 0, 0, 0, 1, 1,
0.3870086, -0.504079, 0.5500688, 1, 1, 1, 1, 1,
0.3873182, 0.6856433, 2.30362, 1, 1, 1, 1, 1,
0.3970565, -0.09246915, 0.737582, 1, 1, 1, 1, 1,
0.3996779, -0.1464113, 1.929504, 1, 1, 1, 1, 1,
0.4006874, 0.2650697, 1.346554, 1, 1, 1, 1, 1,
0.4012342, -0.0246004, 2.582113, 1, 1, 1, 1, 1,
0.4016723, -0.1437594, 2.604385, 1, 1, 1, 1, 1,
0.4036026, -0.4433824, 1.201945, 1, 1, 1, 1, 1,
0.407599, 2.261169, 0.07558276, 1, 1, 1, 1, 1,
0.4077063, -0.886173, 2.760067, 1, 1, 1, 1, 1,
0.4121286, -0.6980438, 1.129629, 1, 1, 1, 1, 1,
0.4168777, 1.478379, -0.8000998, 1, 1, 1, 1, 1,
0.417044, -0.2777672, 4.367498, 1, 1, 1, 1, 1,
0.4180296, 0.4380418, 0.8578483, 1, 1, 1, 1, 1,
0.4200622, -0.785709, 3.851285, 1, 1, 1, 1, 1,
0.4207642, -1.542822, 4.320991, 0, 0, 1, 1, 1,
0.4368439, 2.019708, 0.3749917, 1, 0, 0, 1, 1,
0.43689, 0.6339746, -0.007553773, 1, 0, 0, 1, 1,
0.4384495, -1.272078, 1.719262, 1, 0, 0, 1, 1,
0.4463693, 2.439778, -0.9405506, 1, 0, 0, 1, 1,
0.4496989, -1.289793, 0.9559014, 1, 0, 0, 1, 1,
0.4563778, 0.09353202, 1.60437, 0, 0, 0, 1, 1,
0.460434, 0.01182188, 2.003485, 0, 0, 0, 1, 1,
0.4610489, -0.3116527, 1.524493, 0, 0, 0, 1, 1,
0.4633821, -0.3219278, -0.3329219, 0, 0, 0, 1, 1,
0.4648509, 0.5165822, 1.292506, 0, 0, 0, 1, 1,
0.4685782, -1.405108, 3.203022, 0, 0, 0, 1, 1,
0.4766001, -1.107166, 2.220124, 0, 0, 0, 1, 1,
0.4904692, 0.4090907, 1.467948, 1, 1, 1, 1, 1,
0.4913093, 1.783, 1.508877, 1, 1, 1, 1, 1,
0.4925453, -0.5342013, 0.9566385, 1, 1, 1, 1, 1,
0.4928983, 1.194184, 2.501312, 1, 1, 1, 1, 1,
0.4958768, -1.361979, 1.895017, 1, 1, 1, 1, 1,
0.4996498, -0.02589155, 3.170468, 1, 1, 1, 1, 1,
0.5005463, -0.7764168, 1.77983, 1, 1, 1, 1, 1,
0.5049501, 0.09774151, 2.261722, 1, 1, 1, 1, 1,
0.5052137, -0.3716799, 0.961213, 1, 1, 1, 1, 1,
0.5059256, 0.0606539, 1.06827, 1, 1, 1, 1, 1,
0.5071515, 1.697243, 1.090219, 1, 1, 1, 1, 1,
0.5190552, -0.06815425, 2.294123, 1, 1, 1, 1, 1,
0.523133, -0.02303571, 1.115429, 1, 1, 1, 1, 1,
0.5274884, -0.7220097, 2.804674, 1, 1, 1, 1, 1,
0.5307062, 1.304124, 1.111319, 1, 1, 1, 1, 1,
0.5309475, -1.003543, 3.15646, 0, 0, 1, 1, 1,
0.5334055, -0.3587728, 2.241799, 1, 0, 0, 1, 1,
0.5401725, -0.4337516, 2.234537, 1, 0, 0, 1, 1,
0.5406699, 0.2344518, 0.9315903, 1, 0, 0, 1, 1,
0.5413533, 0.9822319, 1.245817, 1, 0, 0, 1, 1,
0.5432556, 0.5788418, 0.1499967, 1, 0, 0, 1, 1,
0.5538409, 0.5411537, 0.2988048, 0, 0, 0, 1, 1,
0.5574045, -0.4463564, 1.87551, 0, 0, 0, 1, 1,
0.5581521, -0.1868793, 1.372411, 0, 0, 0, 1, 1,
0.5585639, -0.01174213, 1.623234, 0, 0, 0, 1, 1,
0.5641524, 1.434196, 1.71427, 0, 0, 0, 1, 1,
0.5668867, -0.02843773, 3.201452, 0, 0, 0, 1, 1,
0.5764774, 0.7299488, 1.253027, 0, 0, 0, 1, 1,
0.581441, 1.873968, 0.7923215, 1, 1, 1, 1, 1,
0.5814689, -0.01777722, 2.389354, 1, 1, 1, 1, 1,
0.5913652, 0.1898224, 0.8107678, 1, 1, 1, 1, 1,
0.5921625, 1.503511, 0.4912716, 1, 1, 1, 1, 1,
0.5943274, -0.5811453, 3.183962, 1, 1, 1, 1, 1,
0.5988623, -0.7900158, 2.461927, 1, 1, 1, 1, 1,
0.6000921, -1.1745, 1.246086, 1, 1, 1, 1, 1,
0.6042324, -1.005156, 2.778409, 1, 1, 1, 1, 1,
0.6046867, 0.9575257, 2.235277, 1, 1, 1, 1, 1,
0.6050785, -1.050181, 2.82159, 1, 1, 1, 1, 1,
0.607108, 0.9504676, 1.951451, 1, 1, 1, 1, 1,
0.6126868, 1.264707, 2.293257, 1, 1, 1, 1, 1,
0.613358, -1.763622, 2.057968, 1, 1, 1, 1, 1,
0.6138657, -0.1414462, 2.036314, 1, 1, 1, 1, 1,
0.6151902, 0.831899, 0.9977724, 1, 1, 1, 1, 1,
0.6296789, -0.8440218, 1.699766, 0, 0, 1, 1, 1,
0.6340033, 1.746699, 0.4313163, 1, 0, 0, 1, 1,
0.638559, 0.1664781, -0.378243, 1, 0, 0, 1, 1,
0.6435137, -0.7338884, 1.554129, 1, 0, 0, 1, 1,
0.6460537, 0.7950473, -0.2432105, 1, 0, 0, 1, 1,
0.6466852, 1.796103, 0.2665404, 1, 0, 0, 1, 1,
0.6486438, -0.6995792, 1.918841, 0, 0, 0, 1, 1,
0.6506472, 1.017286, 0.976543, 0, 0, 0, 1, 1,
0.6549385, 0.6900408, 1.440804, 0, 0, 0, 1, 1,
0.6581478, 0.9317845, 1.555117, 0, 0, 0, 1, 1,
0.6583036, -0.9770661, 2.535523, 0, 0, 0, 1, 1,
0.6663844, -0.6188167, 3.740483, 0, 0, 0, 1, 1,
0.6666066, 0.14397, 1.36438, 0, 0, 0, 1, 1,
0.6692203, 1.794579, 1.320389, 1, 1, 1, 1, 1,
0.6730005, -1.323823, 0.6003421, 1, 1, 1, 1, 1,
0.6747721, -0.9102269, 3.418683, 1, 1, 1, 1, 1,
0.6749543, 1.413121, 0.3915791, 1, 1, 1, 1, 1,
0.6762584, -0.2993605, 3.243136, 1, 1, 1, 1, 1,
0.6765404, -1.188224, 2.677982, 1, 1, 1, 1, 1,
0.6791228, 0.02234074, 2.042153, 1, 1, 1, 1, 1,
0.6800739, 1.716583, 0.5212544, 1, 1, 1, 1, 1,
0.6868309, -1.021411, 2.421411, 1, 1, 1, 1, 1,
0.6937088, 1.66334, -0.4676909, 1, 1, 1, 1, 1,
0.6940935, 1.883349, -0.04641014, 1, 1, 1, 1, 1,
0.6955459, -0.3617813, 1.859497, 1, 1, 1, 1, 1,
0.6959753, -0.6409755, 0.6230581, 1, 1, 1, 1, 1,
0.7010631, -0.01958384, 2.469692, 1, 1, 1, 1, 1,
0.7011191, 0.3878184, 3.391995, 1, 1, 1, 1, 1,
0.7102575, -0.7832638, 2.670665, 0, 0, 1, 1, 1,
0.7157081, 0.4099264, 2.701732, 1, 0, 0, 1, 1,
0.7157822, -1.56461, 1.287346, 1, 0, 0, 1, 1,
0.7171943, -0.2711642, 1.023428, 1, 0, 0, 1, 1,
0.719329, -0.9593542, 2.541713, 1, 0, 0, 1, 1,
0.7263988, -0.01725398, 1.969735, 1, 0, 0, 1, 1,
0.7305745, 0.07209282, -0.1022486, 0, 0, 0, 1, 1,
0.7482986, 0.3739788, -0.8056772, 0, 0, 0, 1, 1,
0.7519612, -1.109437, 1.981743, 0, 0, 0, 1, 1,
0.753315, -0.6554007, 3.454871, 0, 0, 0, 1, 1,
0.7537609, -0.2096439, 2.750093, 0, 0, 0, 1, 1,
0.7552288, -0.5770039, 2.546487, 0, 0, 0, 1, 1,
0.7627813, 1.625105, 1.300979, 0, 0, 0, 1, 1,
0.7675058, 1.195562, -1.323861, 1, 1, 1, 1, 1,
0.7715482, 0.1955287, 1.889071, 1, 1, 1, 1, 1,
0.7725158, 0.5954321, 1.053337, 1, 1, 1, 1, 1,
0.7732983, 0.7780958, 0.1809088, 1, 1, 1, 1, 1,
0.7739669, -1.102786, 2.285125, 1, 1, 1, 1, 1,
0.7740936, -0.09087002, 2.337816, 1, 1, 1, 1, 1,
0.7796733, -1.20979, 3.077824, 1, 1, 1, 1, 1,
0.7804776, -0.306097, 3.366642, 1, 1, 1, 1, 1,
0.781432, -1.53479, 4.053524, 1, 1, 1, 1, 1,
0.7823537, -0.08706092, 2.086034, 1, 1, 1, 1, 1,
0.7867994, -0.8276666, 2.876108, 1, 1, 1, 1, 1,
0.7877929, 1.13885, 1.629163, 1, 1, 1, 1, 1,
0.787962, 1.587827, -2.507552, 1, 1, 1, 1, 1,
0.788418, 2.50891, 0.9470636, 1, 1, 1, 1, 1,
0.7940208, 1.077705, -0.1397501, 1, 1, 1, 1, 1,
0.7957762, -0.8953221, 1.252066, 0, 0, 1, 1, 1,
0.7994438, 0.0715168, 2.534869, 1, 0, 0, 1, 1,
0.8050562, -0.08407921, 1.720041, 1, 0, 0, 1, 1,
0.8060184, -0.2470698, 2.127295, 1, 0, 0, 1, 1,
0.819482, 0.1945926, 0.8525878, 1, 0, 0, 1, 1,
0.8239839, -1.146292, 1.008488, 1, 0, 0, 1, 1,
0.8269842, -1.043337, 3.547862, 0, 0, 0, 1, 1,
0.8297681, -1.47609, 3.920764, 0, 0, 0, 1, 1,
0.8358341, -1.409405, 3.782731, 0, 0, 0, 1, 1,
0.8454346, 0.6635422, -0.1747517, 0, 0, 0, 1, 1,
0.8639004, 0.412785, 0.9240109, 0, 0, 0, 1, 1,
0.867921, -0.2080447, 2.39092, 0, 0, 0, 1, 1,
0.8707377, 0.3059268, -0.8518504, 0, 0, 0, 1, 1,
0.8738227, 0.1361766, 2.526876, 1, 1, 1, 1, 1,
0.8741196, -0.151408, 2.756488, 1, 1, 1, 1, 1,
0.877872, 0.1478639, 1.964372, 1, 1, 1, 1, 1,
0.8820851, 0.4912585, 1.053273, 1, 1, 1, 1, 1,
0.8845198, -1.295171, 1.478021, 1, 1, 1, 1, 1,
0.8846086, -0.5351886, 2.493349, 1, 1, 1, 1, 1,
0.8849342, 0.678712, 1.216997, 1, 1, 1, 1, 1,
0.8853064, -1.507239, 1.835266, 1, 1, 1, 1, 1,
0.8907657, -0.8841667, 2.807613, 1, 1, 1, 1, 1,
0.895126, 0.3972732, 0.152273, 1, 1, 1, 1, 1,
0.9025328, 1.001793, 0.1477758, 1, 1, 1, 1, 1,
0.9090387, -0.7452027, 2.485491, 1, 1, 1, 1, 1,
0.9161777, -1.811612, 2.439389, 1, 1, 1, 1, 1,
0.9166553, 0.3753469, 0.9393892, 1, 1, 1, 1, 1,
0.9202353, 1.128997, -0.1747606, 1, 1, 1, 1, 1,
0.9231334, 0.6959208, 0.4117979, 0, 0, 1, 1, 1,
0.9304724, -1.355701, 3.625624, 1, 0, 0, 1, 1,
0.9349607, -0.2492962, 2.521804, 1, 0, 0, 1, 1,
0.9360877, -0.009060315, 3.14754, 1, 0, 0, 1, 1,
0.9442376, -2.737489, 4.064765, 1, 0, 0, 1, 1,
0.9455208, 0.4565628, 0.8779327, 1, 0, 0, 1, 1,
0.9458356, 0.6054222, 0.7764019, 0, 0, 0, 1, 1,
0.9515801, 2.713149, 0.2956808, 0, 0, 0, 1, 1,
0.9560195, 0.06737534, 0.682591, 0, 0, 0, 1, 1,
0.9575154, 0.2838425, 1.277703, 0, 0, 0, 1, 1,
0.9651047, 1.959905, -0.5385031, 0, 0, 0, 1, 1,
0.9662555, 0.4247359, 3.59071, 0, 0, 0, 1, 1,
0.9692506, 0.8139459, 1.354676, 0, 0, 0, 1, 1,
0.9692912, 0.2397954, 2.189092, 1, 1, 1, 1, 1,
0.9719851, 0.1374947, 1.597903, 1, 1, 1, 1, 1,
0.9762514, 0.6032944, 0.4938746, 1, 1, 1, 1, 1,
0.976726, 2.571105, 1.073478, 1, 1, 1, 1, 1,
0.9823139, -1.375099, 2.614634, 1, 1, 1, 1, 1,
0.9867567, 1.155065, 1.863379, 1, 1, 1, 1, 1,
0.9923505, -2.3, 1.917855, 1, 1, 1, 1, 1,
0.9979662, -1.188862, 2.632174, 1, 1, 1, 1, 1,
0.999284, 0.1633484, 0.4574913, 1, 1, 1, 1, 1,
1.000381, 0.5612048, 0.3579043, 1, 1, 1, 1, 1,
1.00054, -0.6130974, 1.74998, 1, 1, 1, 1, 1,
1.004815, -0.4326285, 2.586466, 1, 1, 1, 1, 1,
1.006216, 0.826013, 1.232142, 1, 1, 1, 1, 1,
1.006306, 0.6573928, 1.003034, 1, 1, 1, 1, 1,
1.017669, -0.858806, 2.518965, 1, 1, 1, 1, 1,
1.031206, 1.152835, 1.417879, 0, 0, 1, 1, 1,
1.045169, -1.130316, 2.618308, 1, 0, 0, 1, 1,
1.049993, 0.6083893, 1.936287, 1, 0, 0, 1, 1,
1.050096, 1.587348, -0.0115791, 1, 0, 0, 1, 1,
1.056665, -0.4837472, 2.817083, 1, 0, 0, 1, 1,
1.063292, 0.07320646, 2.429291, 1, 0, 0, 1, 1,
1.077568, 0.3826352, 0.9422438, 0, 0, 0, 1, 1,
1.086994, 1.667354, 0.8434836, 0, 0, 0, 1, 1,
1.089604, -1.172243, 3.305344, 0, 0, 0, 1, 1,
1.093795, 0.3664523, -1.532598, 0, 0, 0, 1, 1,
1.100013, -0.2421848, 3.018888, 0, 0, 0, 1, 1,
1.105043, 0.7197918, 1.828416, 0, 0, 0, 1, 1,
1.105787, -0.5521504, 3.377249, 0, 0, 0, 1, 1,
1.109147, -1.258455, 1.525999, 1, 1, 1, 1, 1,
1.109705, -0.3950118, 0.8914192, 1, 1, 1, 1, 1,
1.11567, -1.216585, 2.506047, 1, 1, 1, 1, 1,
1.119627, -0.9525324, 1.325281, 1, 1, 1, 1, 1,
1.128786, -0.5642174, 3.114248, 1, 1, 1, 1, 1,
1.132366, -0.5634246, 2.885983, 1, 1, 1, 1, 1,
1.136845, 1.135234, 0.8913427, 1, 1, 1, 1, 1,
1.138411, 1.00659, 0.4659782, 1, 1, 1, 1, 1,
1.141576, -1.980422, 3.41976, 1, 1, 1, 1, 1,
1.145603, -0.6857304, 1.652176, 1, 1, 1, 1, 1,
1.170038, -1.594439, 2.68988, 1, 1, 1, 1, 1,
1.172771, 0.00546868, 2.06642, 1, 1, 1, 1, 1,
1.180616, 0.5883635, 0.1719992, 1, 1, 1, 1, 1,
1.181711, -1.691153, 0.5980442, 1, 1, 1, 1, 1,
1.188004, 1.080233, 1.271449, 1, 1, 1, 1, 1,
1.188309, 0.5306596, 0.3388887, 0, 0, 1, 1, 1,
1.190411, 1.091043, 0.9901278, 1, 0, 0, 1, 1,
1.192505, -0.9377899, 1.901581, 1, 0, 0, 1, 1,
1.192612, -0.7446104, 1.857053, 1, 0, 0, 1, 1,
1.20287, -0.4459284, 1.040223, 1, 0, 0, 1, 1,
1.204742, -1.514212, 2.815903, 1, 0, 0, 1, 1,
1.208919, 0.5712149, 2.726767, 0, 0, 0, 1, 1,
1.211839, 0.7724249, 1.568794, 0, 0, 0, 1, 1,
1.214359, 0.7521165, 1.661097, 0, 0, 0, 1, 1,
1.2166, -1.574718, 1.732627, 0, 0, 0, 1, 1,
1.21866, 0.04406942, 0.8041862, 0, 0, 0, 1, 1,
1.21972, -0.526945, 2.404262, 0, 0, 0, 1, 1,
1.220076, -0.4399709, 3.867161, 0, 0, 0, 1, 1,
1.220304, -0.4216003, 3.54521, 1, 1, 1, 1, 1,
1.221095, -0.9793512, 5.092782, 1, 1, 1, 1, 1,
1.236263, 1.368362, -0.2251649, 1, 1, 1, 1, 1,
1.243123, 0.7988104, 0.0146194, 1, 1, 1, 1, 1,
1.244434, -0.1021791, 2.251094, 1, 1, 1, 1, 1,
1.246428, 1.994718, 2.479444, 1, 1, 1, 1, 1,
1.249849, -1.40301, 2.184128, 1, 1, 1, 1, 1,
1.260983, 1.066489, 0.8306459, 1, 1, 1, 1, 1,
1.27093, 0.8371758, 0.3851351, 1, 1, 1, 1, 1,
1.274973, -2.209679, 2.092588, 1, 1, 1, 1, 1,
1.274986, 0.01396409, 2.695304, 1, 1, 1, 1, 1,
1.282397, -0.884621, 0.3574682, 1, 1, 1, 1, 1,
1.285661, -0.1623679, 3.95423, 1, 1, 1, 1, 1,
1.288923, -0.6972163, 1.80346, 1, 1, 1, 1, 1,
1.290011, -0.06541261, 2.772751, 1, 1, 1, 1, 1,
1.295096, -0.6045046, 1.570017, 0, 0, 1, 1, 1,
1.299782, 1.133252, 1.504776, 1, 0, 0, 1, 1,
1.316482, 0.4969003, 1.635752, 1, 0, 0, 1, 1,
1.324204, 0.9532022, 2.188689, 1, 0, 0, 1, 1,
1.337948, 0.5550139, -0.01998647, 1, 0, 0, 1, 1,
1.338911, -1.590931, 2.251928, 1, 0, 0, 1, 1,
1.343993, 1.171984, -1.280014, 0, 0, 0, 1, 1,
1.358437, 0.3358755, 0.8750253, 0, 0, 0, 1, 1,
1.362217, 0.7594938, 0.910693, 0, 0, 0, 1, 1,
1.364238, 0.3091722, 1.355177, 0, 0, 0, 1, 1,
1.377407, -0.9070717, 2.283808, 0, 0, 0, 1, 1,
1.381248, -0.6921097, 1.079778, 0, 0, 0, 1, 1,
1.385477, -0.9089693, 2.930886, 0, 0, 0, 1, 1,
1.386834, -1.715121, 3.518682, 1, 1, 1, 1, 1,
1.387391, 0.3978931, 1.854103, 1, 1, 1, 1, 1,
1.400885, 1.397115, 1.349406, 1, 1, 1, 1, 1,
1.401902, 0.3711758, 2.363873, 1, 1, 1, 1, 1,
1.409401, 0.7661385, 0.5416316, 1, 1, 1, 1, 1,
1.413653, 0.0430581, 3.049924, 1, 1, 1, 1, 1,
1.419412, -0.5672048, 1.123442, 1, 1, 1, 1, 1,
1.434029, 0.559848, 1.237962, 1, 1, 1, 1, 1,
1.44065, 0.03714071, 2.884672, 1, 1, 1, 1, 1,
1.443409, 1.056928, 0.117226, 1, 1, 1, 1, 1,
1.445326, 0.5182884, 0.8779904, 1, 1, 1, 1, 1,
1.451151, -0.05525874, 0.9719363, 1, 1, 1, 1, 1,
1.458234, -0.0125358, 0.910474, 1, 1, 1, 1, 1,
1.461022, 1.412935, 0.1788153, 1, 1, 1, 1, 1,
1.46704, -0.07611185, 2.52384, 1, 1, 1, 1, 1,
1.467654, -2.086029, 3.944399, 0, 0, 1, 1, 1,
1.471825, 0.5477178, 1.417799, 1, 0, 0, 1, 1,
1.472257, -0.6721169, -0.02476411, 1, 0, 0, 1, 1,
1.479522, -1.18618, 2.500973, 1, 0, 0, 1, 1,
1.492459, -0.005935427, 0.8668426, 1, 0, 0, 1, 1,
1.497219, -0.8855835, 2.580705, 1, 0, 0, 1, 1,
1.499993, 1.125059, 0.3410203, 0, 0, 0, 1, 1,
1.508586, -0.3010511, 3.856208, 0, 0, 0, 1, 1,
1.514596, 0.005613104, 2.729506, 0, 0, 0, 1, 1,
1.518859, -1.388979, 2.024062, 0, 0, 0, 1, 1,
1.527932, 0.2410682, 0.9163771, 0, 0, 0, 1, 1,
1.537284, 1.704722, 0.2718372, 0, 0, 0, 1, 1,
1.543657, 0.06463317, 2.461329, 0, 0, 0, 1, 1,
1.545595, 1.625583, -1.296882, 1, 1, 1, 1, 1,
1.546224, 0.1915509, 2.296793, 1, 1, 1, 1, 1,
1.547355, 1.787277, 0.7237226, 1, 1, 1, 1, 1,
1.548335, -0.3775848, 1.370142, 1, 1, 1, 1, 1,
1.555826, -0.4684124, 3.542193, 1, 1, 1, 1, 1,
1.561661, 0.3190426, 2.805022, 1, 1, 1, 1, 1,
1.576157, -1.185807, 2.9967, 1, 1, 1, 1, 1,
1.581668, 1.124575, 0.5462405, 1, 1, 1, 1, 1,
1.613275, 0.3028518, 1.587806, 1, 1, 1, 1, 1,
1.627216, -0.01130151, 0.7343534, 1, 1, 1, 1, 1,
1.637403, 0.3099854, -0.484676, 1, 1, 1, 1, 1,
1.641624, 0.6305905, 1.460657, 1, 1, 1, 1, 1,
1.650747, -0.5049816, 3.310775, 1, 1, 1, 1, 1,
1.653997, -0.2769115, 2.063177, 1, 1, 1, 1, 1,
1.66447, -0.2416809, 0.7218231, 1, 1, 1, 1, 1,
1.677504, -0.1480885, 1.100257, 0, 0, 1, 1, 1,
1.682335, 0.7184979, 2.510992, 1, 0, 0, 1, 1,
1.691995, 0.226428, 0.6350609, 1, 0, 0, 1, 1,
1.713789, 2.329101, 1.540544, 1, 0, 0, 1, 1,
1.719825, 0.1347947, 0.5046511, 1, 0, 0, 1, 1,
1.741472, 1.966284, -0.6335373, 1, 0, 0, 1, 1,
1.747729, -1.987873, 3.552984, 0, 0, 0, 1, 1,
1.749882, 0.3597502, -0.5446424, 0, 0, 0, 1, 1,
1.751029, 0.6546495, 1.694161, 0, 0, 0, 1, 1,
1.765963, -0.1851391, 2.499529, 0, 0, 0, 1, 1,
1.799233, -1.15712, 2.048587, 0, 0, 0, 1, 1,
1.840599, 0.3547531, 2.071307, 0, 0, 0, 1, 1,
1.852478, 0.2773096, 2.290802, 0, 0, 0, 1, 1,
1.85517, -0.5866314, 1.412627, 1, 1, 1, 1, 1,
1.858704, 0.5729093, 1.140637, 1, 1, 1, 1, 1,
1.859569, 0.1906696, -0.01248262, 1, 1, 1, 1, 1,
1.878625, 0.3452833, 1.828924, 1, 1, 1, 1, 1,
1.889928, -1.257607, 4.452804, 1, 1, 1, 1, 1,
1.917464, -1.214885, 2.417294, 1, 1, 1, 1, 1,
1.925098, -0.2744398, 2.034989, 1, 1, 1, 1, 1,
1.926009, -2.177724, 2.90017, 1, 1, 1, 1, 1,
1.958589, 1.980288, -0.1121053, 1, 1, 1, 1, 1,
1.974527, -0.6821185, 2.653023, 1, 1, 1, 1, 1,
1.987882, -0.1658492, 1.238312, 1, 1, 1, 1, 1,
2.00781, -1.63854, 1.12159, 1, 1, 1, 1, 1,
2.02226, -0.5414437, 1.599531, 1, 1, 1, 1, 1,
2.039301, 0.07050399, 1.335239, 1, 1, 1, 1, 1,
2.050339, -0.6774715, 0.7104009, 1, 1, 1, 1, 1,
2.056877, 0.5980675, 0.7190689, 0, 0, 1, 1, 1,
2.063785, 0.3901233, 3.052358, 1, 0, 0, 1, 1,
2.075465, 0.2438723, 1.380705, 1, 0, 0, 1, 1,
2.077147, -0.9114348, 3.064066, 1, 0, 0, 1, 1,
2.081376, 0.3940266, 1.746001, 1, 0, 0, 1, 1,
2.107424, -0.7111825, 3.527958, 1, 0, 0, 1, 1,
2.114224, -2.017731, 1.87999, 0, 0, 0, 1, 1,
2.141555, -0.4953105, 1.705827, 0, 0, 0, 1, 1,
2.152408, -0.688881, 2.415476, 0, 0, 0, 1, 1,
2.159874, -0.3083005, 2.006359, 0, 0, 0, 1, 1,
2.276095, 0.7729326, 2.435381, 0, 0, 0, 1, 1,
2.291141, 0.892278, 0.9725772, 0, 0, 0, 1, 1,
2.29303, -0.6370162, 2.502972, 0, 0, 0, 1, 1,
2.33524, -0.2367555, 2.704993, 1, 1, 1, 1, 1,
2.474719, -0.3600239, 1.018181, 1, 1, 1, 1, 1,
2.488042, 0.8508216, 1.628281, 1, 1, 1, 1, 1,
2.651225, -0.7309652, 0.8708935, 1, 1, 1, 1, 1,
2.707304, -0.4210666, 3.936958, 1, 1, 1, 1, 1,
2.720212, 0.3218805, 1.458765, 1, 1, 1, 1, 1,
2.999124, 0.1029, -0.2497226, 1, 1, 1, 1, 1
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
var radius = 9.525897;
var distance = 33.45931;
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
mvMatrix.translate( 0.01559663, 0.2719584, 0.2642782 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.45931);
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
