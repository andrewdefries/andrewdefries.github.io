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
-3.077877, -0.06315597, -1.303259, 1, 0, 0, 1,
-2.925429, -0.7476817, -0.8256087, 1, 0.007843138, 0, 1,
-2.841348, 0.02626893, -1.627198, 1, 0.01176471, 0, 1,
-2.707092, 0.1982501, -2.528429, 1, 0.01960784, 0, 1,
-2.623471, -0.3821885, -1.796364, 1, 0.02352941, 0, 1,
-2.607002, -1.030473, -3.560091, 1, 0.03137255, 0, 1,
-2.592477, 0.3860432, -1.854145, 1, 0.03529412, 0, 1,
-2.529953, -1.473052, -3.463575, 1, 0.04313726, 0, 1,
-2.47316, 1.002089, -1.351956, 1, 0.04705882, 0, 1,
-2.380061, -0.8859382, -0.9682871, 1, 0.05490196, 0, 1,
-2.356727, 1.23603, -2.734499, 1, 0.05882353, 0, 1,
-2.324901, -2.812234, -1.563691, 1, 0.06666667, 0, 1,
-2.246677, 0.6266781, -0.3242817, 1, 0.07058824, 0, 1,
-2.216205, 0.698261, -0.4203609, 1, 0.07843138, 0, 1,
-2.190912, -0.8308918, -0.3697527, 1, 0.08235294, 0, 1,
-2.122009, -2.064368, -2.523365, 1, 0.09019608, 0, 1,
-2.060199, 0.0161304, -2.995183, 1, 0.09411765, 0, 1,
-2.051023, -0.1761277, -2.518987, 1, 0.1019608, 0, 1,
-2.048385, 0.0106721, -1.153363, 1, 0.1098039, 0, 1,
-2.026086, 1.010345, -0.3719283, 1, 0.1137255, 0, 1,
-2.014652, -0.9798705, -0.2940198, 1, 0.1215686, 0, 1,
-2.008658, -0.09322789, 0.2094339, 1, 0.1254902, 0, 1,
-1.969893, 1.088263, -0.7534989, 1, 0.1333333, 0, 1,
-1.965612, -0.7670487, -1.547592, 1, 0.1372549, 0, 1,
-1.942274, -0.4307431, -2.230576, 1, 0.145098, 0, 1,
-1.933691, 0.3021699, -0.307246, 1, 0.1490196, 0, 1,
-1.932343, -0.05046348, -2.169974, 1, 0.1568628, 0, 1,
-1.919222, 0.7316508, -1.943243, 1, 0.1607843, 0, 1,
-1.860731, -2.773224, -0.38598, 1, 0.1686275, 0, 1,
-1.850953, -0.9821619, -2.919271, 1, 0.172549, 0, 1,
-1.846227, 1.110279, -2.212355, 1, 0.1803922, 0, 1,
-1.829141, -0.2833812, -0.8193308, 1, 0.1843137, 0, 1,
-1.817427, 1.004958, -2.244738, 1, 0.1921569, 0, 1,
-1.81471, -0.165138, 0.3272288, 1, 0.1960784, 0, 1,
-1.782247, -0.03605382, -1.998999, 1, 0.2039216, 0, 1,
-1.778647, 0.3095717, -1.006302, 1, 0.2117647, 0, 1,
-1.757707, 0.4160803, -0.8082203, 1, 0.2156863, 0, 1,
-1.752791, 0.1005013, -2.067671, 1, 0.2235294, 0, 1,
-1.729132, -1.062971, -0.5492257, 1, 0.227451, 0, 1,
-1.724367, 1.059977, -1.672017, 1, 0.2352941, 0, 1,
-1.717218, 1.003765, -0.1281275, 1, 0.2392157, 0, 1,
-1.708548, -0.9483277, -0.966524, 1, 0.2470588, 0, 1,
-1.707386, -0.2151839, -1.2165, 1, 0.2509804, 0, 1,
-1.704816, 1.619482, -0.970462, 1, 0.2588235, 0, 1,
-1.692391, 0.04141024, -1.322615, 1, 0.2627451, 0, 1,
-1.67743, -1.214095, -1.908152, 1, 0.2705882, 0, 1,
-1.656053, 0.2928325, -1.694059, 1, 0.2745098, 0, 1,
-1.654827, 0.005773679, -0.01149002, 1, 0.282353, 0, 1,
-1.652118, -0.9993927, -2.610528, 1, 0.2862745, 0, 1,
-1.623442, -0.5089061, -1.779273, 1, 0.2941177, 0, 1,
-1.62061, -1.442028, -2.653041, 1, 0.3019608, 0, 1,
-1.600214, 0.8925386, -0.6825049, 1, 0.3058824, 0, 1,
-1.596046, -0.5900491, -1.980322, 1, 0.3137255, 0, 1,
-1.576768, 0.2356491, -2.134043, 1, 0.3176471, 0, 1,
-1.555255, -0.4229087, -0.08417635, 1, 0.3254902, 0, 1,
-1.532691, 0.1262012, -2.917635, 1, 0.3294118, 0, 1,
-1.524668, -0.7214423, -2.145492, 1, 0.3372549, 0, 1,
-1.523298, 0.1495288, -0.8643328, 1, 0.3411765, 0, 1,
-1.517977, -1.067858, -2.811851, 1, 0.3490196, 0, 1,
-1.515766, -0.6203862, -3.044016, 1, 0.3529412, 0, 1,
-1.507277, -1.402463, -2.757345, 1, 0.3607843, 0, 1,
-1.502662, -0.9428361, -3.278741, 1, 0.3647059, 0, 1,
-1.499888, 2.006832, 0.4801384, 1, 0.372549, 0, 1,
-1.497698, -0.2199895, -1.154679, 1, 0.3764706, 0, 1,
-1.473155, -0.8984425, -2.787544, 1, 0.3843137, 0, 1,
-1.466745, 0.5593294, -1.374073, 1, 0.3882353, 0, 1,
-1.462446, 1.241967, -0.6721739, 1, 0.3960784, 0, 1,
-1.46012, -0.2108374, -1.347948, 1, 0.4039216, 0, 1,
-1.447683, 0.3703304, -1.057273, 1, 0.4078431, 0, 1,
-1.446501, -0.2933409, -1.261012, 1, 0.4156863, 0, 1,
-1.432124, 0.8840728, 0.1199277, 1, 0.4196078, 0, 1,
-1.427697, 0.7138462, -2.20271, 1, 0.427451, 0, 1,
-1.426511, -0.5474654, -3.808314, 1, 0.4313726, 0, 1,
-1.414159, -0.007275552, -0.8206279, 1, 0.4392157, 0, 1,
-1.404842, -1.231691, -2.594206, 1, 0.4431373, 0, 1,
-1.402252, 0.432555, -2.522059, 1, 0.4509804, 0, 1,
-1.402034, -0.7266971, -1.373321, 1, 0.454902, 0, 1,
-1.398492, -0.5280495, -2.399695, 1, 0.4627451, 0, 1,
-1.351699, 0.4263911, -1.619457, 1, 0.4666667, 0, 1,
-1.350236, 0.6677381, -1.620099, 1, 0.4745098, 0, 1,
-1.346085, 0.08492645, -1.994021, 1, 0.4784314, 0, 1,
-1.341485, 1.785821, -1.554598, 1, 0.4862745, 0, 1,
-1.338658, -0.6533977, -1.045161, 1, 0.4901961, 0, 1,
-1.33445, 0.736007, -2.471645, 1, 0.4980392, 0, 1,
-1.333875, 0.213148, -3.139114, 1, 0.5058824, 0, 1,
-1.329137, 0.2271705, -0.3773616, 1, 0.509804, 0, 1,
-1.328176, 0.8988211, 0.08905578, 1, 0.5176471, 0, 1,
-1.316911, 0.2648526, -0.5465991, 1, 0.5215687, 0, 1,
-1.315459, -0.2160183, 0.0353853, 1, 0.5294118, 0, 1,
-1.307207, 0.2243437, -0.7414978, 1, 0.5333334, 0, 1,
-1.304214, -0.894721, -1.254205, 1, 0.5411765, 0, 1,
-1.282163, 1.512903, -0.03804026, 1, 0.5450981, 0, 1,
-1.266679, -0.1227847, -1.599277, 1, 0.5529412, 0, 1,
-1.265052, -0.1151381, -2.209892, 1, 0.5568628, 0, 1,
-1.263554, 0.9271742, -1.5978, 1, 0.5647059, 0, 1,
-1.261972, 0.5356518, -0.8828213, 1, 0.5686275, 0, 1,
-1.256665, 0.3470081, -0.7063197, 1, 0.5764706, 0, 1,
-1.256116, 0.3899864, -0.6959679, 1, 0.5803922, 0, 1,
-1.252623, -0.3247615, -1.268278, 1, 0.5882353, 0, 1,
-1.241393, -1.217365, -3.108516, 1, 0.5921569, 0, 1,
-1.238897, 1.743651, -1.017395, 1, 0.6, 0, 1,
-1.228026, -1.400597, -2.705642, 1, 0.6078432, 0, 1,
-1.219372, 0.07430119, -2.374383, 1, 0.6117647, 0, 1,
-1.21894, -0.7276258, -3.995437, 1, 0.6196079, 0, 1,
-1.218282, -0.36918, -3.154431, 1, 0.6235294, 0, 1,
-1.216072, -0.6803723, -2.312226, 1, 0.6313726, 0, 1,
-1.215331, -2.307739, -3.000283, 1, 0.6352941, 0, 1,
-1.214326, -0.006436615, -0.5480756, 1, 0.6431373, 0, 1,
-1.20826, 0.9577053, -1.131548, 1, 0.6470588, 0, 1,
-1.204113, 1.084199, -2.403694, 1, 0.654902, 0, 1,
-1.202125, -0.9964819, -3.46304, 1, 0.6588235, 0, 1,
-1.20154, 1.03825, 0.6963139, 1, 0.6666667, 0, 1,
-1.199788, -1.799719, -4.055819, 1, 0.6705883, 0, 1,
-1.199251, -0.1956793, -1.391421, 1, 0.6784314, 0, 1,
-1.191068, 1.497332, -0.3227708, 1, 0.682353, 0, 1,
-1.189335, -0.1266198, -2.297569, 1, 0.6901961, 0, 1,
-1.188455, 0.908709, -1.290472, 1, 0.6941177, 0, 1,
-1.172429, -1.620781, -2.111784, 1, 0.7019608, 0, 1,
-1.17162, -1.266879, -1.272145, 1, 0.7098039, 0, 1,
-1.171046, -0.1303153, -2.666719, 1, 0.7137255, 0, 1,
-1.168783, 2.888968, -0.2325901, 1, 0.7215686, 0, 1,
-1.165341, -1.816451, -2.370733, 1, 0.7254902, 0, 1,
-1.156297, 0.1159341, -0.01576024, 1, 0.7333333, 0, 1,
-1.153623, -0.8057395, -2.336683, 1, 0.7372549, 0, 1,
-1.151799, -0.3972214, -2.769926, 1, 0.7450981, 0, 1,
-1.1461, 0.519932, -3.481586, 1, 0.7490196, 0, 1,
-1.143815, 0.3927144, 1.065535, 1, 0.7568628, 0, 1,
-1.143071, -0.4391695, -1.216624, 1, 0.7607843, 0, 1,
-1.141505, 1.180323, -0.6271627, 1, 0.7686275, 0, 1,
-1.098106, -0.3425423, -1.242861, 1, 0.772549, 0, 1,
-1.096325, 0.5553198, 0.3710224, 1, 0.7803922, 0, 1,
-1.091833, 0.9236181, -1.844137, 1, 0.7843137, 0, 1,
-1.086164, 1.993573, -1.637138, 1, 0.7921569, 0, 1,
-1.081807, 0.1209586, -2.61641, 1, 0.7960784, 0, 1,
-1.079018, -0.5608015, -3.559756, 1, 0.8039216, 0, 1,
-1.074186, 1.360014, -0.09267841, 1, 0.8117647, 0, 1,
-1.067694, -0.02520247, -3.103796, 1, 0.8156863, 0, 1,
-1.059997, -0.1247441, -1.851959, 1, 0.8235294, 0, 1,
-1.0591, -0.1760302, -2.593395, 1, 0.827451, 0, 1,
-1.054172, 0.39248, -0.3050838, 1, 0.8352941, 0, 1,
-1.050168, 0.4849381, -1.604329, 1, 0.8392157, 0, 1,
-1.047307, -0.2712444, -0.1926554, 1, 0.8470588, 0, 1,
-1.044684, -0.1177162, -1.216994, 1, 0.8509804, 0, 1,
-1.044376, 2.217651, -0.6095044, 1, 0.8588235, 0, 1,
-1.037844, -0.2368925, -3.216673, 1, 0.8627451, 0, 1,
-1.037519, 0.1503679, -0.2173171, 1, 0.8705882, 0, 1,
-1.029829, 0.6207614, -1.070704, 1, 0.8745098, 0, 1,
-1.025135, 0.6012914, -1.706273, 1, 0.8823529, 0, 1,
-1.017369, 1.881005, -1.115402, 1, 0.8862745, 0, 1,
-1.011576, -0.07142836, -1.025748, 1, 0.8941177, 0, 1,
-1.001974, 0.2924046, -1.369714, 1, 0.8980392, 0, 1,
-0.9997286, -1.715333, -4.015562, 1, 0.9058824, 0, 1,
-0.9926978, 0.1259962, -1.872789, 1, 0.9137255, 0, 1,
-0.9913554, 0.8149993, -0.8390267, 1, 0.9176471, 0, 1,
-0.9865144, 1.082347, 0.1830895, 1, 0.9254902, 0, 1,
-0.9805775, 0.4639978, -0.5693989, 1, 0.9294118, 0, 1,
-0.9753489, -0.3726354, -2.053127, 1, 0.9372549, 0, 1,
-0.9735768, -0.9777007, -2.307818, 1, 0.9411765, 0, 1,
-0.9651214, 0.4995618, -1.334597, 1, 0.9490196, 0, 1,
-0.9651011, 0.9639957, 0.6903596, 1, 0.9529412, 0, 1,
-0.9627122, -0.3266878, -1.921076, 1, 0.9607843, 0, 1,
-0.9605741, -0.3840835, -3.71462, 1, 0.9647059, 0, 1,
-0.9602649, 0.298023, -0.8248422, 1, 0.972549, 0, 1,
-0.9570767, -0.8421413, -1.65637, 1, 0.9764706, 0, 1,
-0.9538993, -0.6780391, -2.017693, 1, 0.9843137, 0, 1,
-0.9534675, -0.01582536, -2.206679, 1, 0.9882353, 0, 1,
-0.9529115, 1.459798, -0.5460346, 1, 0.9960784, 0, 1,
-0.9488636, -0.693671, -3.635063, 0.9960784, 1, 0, 1,
-0.943696, -0.25067, -0.6522882, 0.9921569, 1, 0, 1,
-0.9418744, 0.6026171, -2.457781, 0.9843137, 1, 0, 1,
-0.9404784, -0.9266441, -0.361386, 0.9803922, 1, 0, 1,
-0.9376969, 0.9472818, -0.03116676, 0.972549, 1, 0, 1,
-0.9282586, 2.230618, 1.025836, 0.9686275, 1, 0, 1,
-0.9248051, -0.1044251, -1.664629, 0.9607843, 1, 0, 1,
-0.9243487, 1.421886, -1.434478, 0.9568627, 1, 0, 1,
-0.9242283, 1.052231, -2.283208, 0.9490196, 1, 0, 1,
-0.9125963, -1.282975, -2.686453, 0.945098, 1, 0, 1,
-0.9085035, 0.9207843, -1.511968, 0.9372549, 1, 0, 1,
-0.9059013, 0.4334795, -0.7469255, 0.9333333, 1, 0, 1,
-0.8961618, 0.4994125, -1.420967, 0.9254902, 1, 0, 1,
-0.893362, 0.3828223, -2.501032, 0.9215686, 1, 0, 1,
-0.8823915, -0.7121438, -1.410271, 0.9137255, 1, 0, 1,
-0.8821122, -0.6888663, -2.176692, 0.9098039, 1, 0, 1,
-0.8694264, 0.3537008, 0.103057, 0.9019608, 1, 0, 1,
-0.8691121, -1.789903, -2.864322, 0.8941177, 1, 0, 1,
-0.8600056, 1.072931, -2.113031, 0.8901961, 1, 0, 1,
-0.8573724, -0.6140447, -3.93403, 0.8823529, 1, 0, 1,
-0.8558076, -0.3406183, -1.536298, 0.8784314, 1, 0, 1,
-0.8554286, 0.2883523, -0.7337004, 0.8705882, 1, 0, 1,
-0.8516759, -0.8843163, -2.670706, 0.8666667, 1, 0, 1,
-0.8482418, -0.7203999, -1.91954, 0.8588235, 1, 0, 1,
-0.847674, -1.770749, -5.429608, 0.854902, 1, 0, 1,
-0.8442507, -0.6148911, -1.479278, 0.8470588, 1, 0, 1,
-0.8425702, -0.2989705, -1.073409, 0.8431373, 1, 0, 1,
-0.8422163, 2.319137, 1.025501, 0.8352941, 1, 0, 1,
-0.8408731, -0.2162274, -2.771499, 0.8313726, 1, 0, 1,
-0.8356858, 1.467222, 0.6295956, 0.8235294, 1, 0, 1,
-0.8320374, -0.9126223, -3.526263, 0.8196079, 1, 0, 1,
-0.8284042, 0.8539982, -1.894243, 0.8117647, 1, 0, 1,
-0.8240779, -0.3222526, -1.904771, 0.8078431, 1, 0, 1,
-0.8211911, 0.9295902, 0.2172679, 0.8, 1, 0, 1,
-0.8170761, 1.13833, -2.195554, 0.7921569, 1, 0, 1,
-0.8095791, -1.151891, -0.8844528, 0.7882353, 1, 0, 1,
-0.8084531, 0.773343, -0.07184676, 0.7803922, 1, 0, 1,
-0.8054492, -2.627339, -2.814449, 0.7764706, 1, 0, 1,
-0.8037979, -0.3901604, -2.436137, 0.7686275, 1, 0, 1,
-0.7983642, -0.8947557, -2.349076, 0.7647059, 1, 0, 1,
-0.7958302, 1.432004, -0.8115306, 0.7568628, 1, 0, 1,
-0.7904395, 0.6678786, 0.5733368, 0.7529412, 1, 0, 1,
-0.7862856, -1.799316, -3.211193, 0.7450981, 1, 0, 1,
-0.7791719, -0.3473944, -1.387708, 0.7411765, 1, 0, 1,
-0.77482, 1.903631, 0.1918765, 0.7333333, 1, 0, 1,
-0.7714034, -0.9869666, -2.118081, 0.7294118, 1, 0, 1,
-0.769156, 0.4337815, -1.349631, 0.7215686, 1, 0, 1,
-0.7640578, 0.6157264, -1.362763, 0.7176471, 1, 0, 1,
-0.7618522, 0.4096518, -0.7926668, 0.7098039, 1, 0, 1,
-0.7613832, -0.653994, -3.74986, 0.7058824, 1, 0, 1,
-0.7573494, 0.410306, 0.03060734, 0.6980392, 1, 0, 1,
-0.7553716, 0.09497327, -0.3131306, 0.6901961, 1, 0, 1,
-0.7549807, -1.006549, -2.719702, 0.6862745, 1, 0, 1,
-0.7546619, -0.6980718, -2.399354, 0.6784314, 1, 0, 1,
-0.7507185, 0.1846498, -0.4594058, 0.6745098, 1, 0, 1,
-0.7485937, -0.05835306, -1.95524, 0.6666667, 1, 0, 1,
-0.7484067, -0.2408417, -1.011453, 0.6627451, 1, 0, 1,
-0.7397448, 2.2354, -0.4306709, 0.654902, 1, 0, 1,
-0.7392603, 0.3875295, -0.3805229, 0.6509804, 1, 0, 1,
-0.7368562, 0.6990117, -3.144027, 0.6431373, 1, 0, 1,
-0.7329685, -0.1475598, -2.457268, 0.6392157, 1, 0, 1,
-0.7311962, -2.877315, -3.662094, 0.6313726, 1, 0, 1,
-0.7297997, -0.6079228, -3.271918, 0.627451, 1, 0, 1,
-0.7283107, 0.1176254, -1.343794, 0.6196079, 1, 0, 1,
-0.7249186, -0.354808, -2.980135, 0.6156863, 1, 0, 1,
-0.7231107, -0.2220677, -0.9033008, 0.6078432, 1, 0, 1,
-0.7230905, 0.7050611, -1.161524, 0.6039216, 1, 0, 1,
-0.7205033, -0.5809329, -1.042647, 0.5960785, 1, 0, 1,
-0.7202048, 0.406917, -0.9103132, 0.5882353, 1, 0, 1,
-0.714639, -1.782697, -2.925666, 0.5843138, 1, 0, 1,
-0.7142892, 0.419746, -1.512984, 0.5764706, 1, 0, 1,
-0.7045996, 1.006645, -1.612597, 0.572549, 1, 0, 1,
-0.7027388, -0.4091449, -2.334605, 0.5647059, 1, 0, 1,
-0.6997738, -0.07436495, -1.804379, 0.5607843, 1, 0, 1,
-0.6922749, -0.9733092, -2.164532, 0.5529412, 1, 0, 1,
-0.6818535, 0.05795499, -2.368021, 0.5490196, 1, 0, 1,
-0.6807429, -0.1331893, -1.907583, 0.5411765, 1, 0, 1,
-0.6800056, 0.7148187, -1.076817, 0.5372549, 1, 0, 1,
-0.6785768, 0.3249971, -0.05304004, 0.5294118, 1, 0, 1,
-0.6784446, 0.2113299, -2.127203, 0.5254902, 1, 0, 1,
-0.6773166, -0.9527929, -1.727498, 0.5176471, 1, 0, 1,
-0.6771211, -0.2690933, -1.845702, 0.5137255, 1, 0, 1,
-0.6769223, -0.3906172, -1.331536, 0.5058824, 1, 0, 1,
-0.6749213, -0.2423356, -1.692054, 0.5019608, 1, 0, 1,
-0.673781, -0.9071007, -2.323237, 0.4941176, 1, 0, 1,
-0.6737705, -0.3746922, -1.328812, 0.4862745, 1, 0, 1,
-0.6713647, -0.4776703, -1.891235, 0.4823529, 1, 0, 1,
-0.6703944, 1.212427, -1.236526, 0.4745098, 1, 0, 1,
-0.6672496, 1.632797, -1.220757, 0.4705882, 1, 0, 1,
-0.6661456, 0.9857336, -0.8433677, 0.4627451, 1, 0, 1,
-0.6614786, 1.037452, -0.8974681, 0.4588235, 1, 0, 1,
-0.6603501, 0.9287186, -1.734002, 0.4509804, 1, 0, 1,
-0.6587591, -0.5155154, -1.063374, 0.4470588, 1, 0, 1,
-0.6576841, -0.7955978, -2.026977, 0.4392157, 1, 0, 1,
-0.6556743, -1.628241, -0.9584672, 0.4352941, 1, 0, 1,
-0.6546341, 0.08566066, -2.043578, 0.427451, 1, 0, 1,
-0.6427206, 0.7837067, -0.3128437, 0.4235294, 1, 0, 1,
-0.6426919, -1.092142, -4.325417, 0.4156863, 1, 0, 1,
-0.6333268, -0.1783075, -0.8363414, 0.4117647, 1, 0, 1,
-0.6268175, -1.144048, -2.623171, 0.4039216, 1, 0, 1,
-0.6230699, 0.7203262, -1.883004, 0.3960784, 1, 0, 1,
-0.6217093, -0.09770288, -1.406103, 0.3921569, 1, 0, 1,
-0.6189109, -0.2732265, -2.871163, 0.3843137, 1, 0, 1,
-0.613578, -1.359528, -1.906513, 0.3803922, 1, 0, 1,
-0.6127008, 1.180753, -1.751525, 0.372549, 1, 0, 1,
-0.6103735, -0.4416205, -3.285331, 0.3686275, 1, 0, 1,
-0.60901, -0.3286918, -2.496343, 0.3607843, 1, 0, 1,
-0.6079058, 0.7466096, -0.9214065, 0.3568628, 1, 0, 1,
-0.6063614, -1.366417, -1.568975, 0.3490196, 1, 0, 1,
-0.6053649, 0.1862988, -2.89133, 0.345098, 1, 0, 1,
-0.6044843, 0.7443666, 1.390365, 0.3372549, 1, 0, 1,
-0.6043232, 0.1359157, 0.2108909, 0.3333333, 1, 0, 1,
-0.5994221, -1.334659, -1.234294, 0.3254902, 1, 0, 1,
-0.5970178, -0.6510112, -2.401663, 0.3215686, 1, 0, 1,
-0.5961455, 0.2351152, 0.2654946, 0.3137255, 1, 0, 1,
-0.5957264, -0.4627053, -1.224766, 0.3098039, 1, 0, 1,
-0.5954909, 0.5978753, -0.199083, 0.3019608, 1, 0, 1,
-0.591659, 0.6158988, -1.073042, 0.2941177, 1, 0, 1,
-0.5822206, -0.494997, -1.927842, 0.2901961, 1, 0, 1,
-0.5811793, 1.115019, -0.4643325, 0.282353, 1, 0, 1,
-0.5751351, 1.273424, -0.7399491, 0.2784314, 1, 0, 1,
-0.5726279, -0.4051776, -0.922969, 0.2705882, 1, 0, 1,
-0.5707094, -0.03877864, -0.1969479, 0.2666667, 1, 0, 1,
-0.5582204, 0.3469084, -0.7038564, 0.2588235, 1, 0, 1,
-0.5544419, -1.612655, -2.922907, 0.254902, 1, 0, 1,
-0.5526582, -1.131917, -1.494614, 0.2470588, 1, 0, 1,
-0.5504758, -0.105975, -1.031178, 0.2431373, 1, 0, 1,
-0.5481251, -0.5452515, -1.894866, 0.2352941, 1, 0, 1,
-0.5461354, -1.51603, -2.789207, 0.2313726, 1, 0, 1,
-0.5377337, 0.5582104, -0.7441021, 0.2235294, 1, 0, 1,
-0.5365313, 0.100237, -0.2208076, 0.2196078, 1, 0, 1,
-0.5280336, -0.5484737, -1.191571, 0.2117647, 1, 0, 1,
-0.5230663, -1.125194, -2.506172, 0.2078431, 1, 0, 1,
-0.5210025, -0.7441512, -1.692123, 0.2, 1, 0, 1,
-0.5172165, 0.609591, -0.5854713, 0.1921569, 1, 0, 1,
-0.5170279, -0.5092229, -2.420893, 0.1882353, 1, 0, 1,
-0.5136345, 1.282317, 0.05004646, 0.1803922, 1, 0, 1,
-0.5107489, 0.001027907, -3.02008, 0.1764706, 1, 0, 1,
-0.5029038, -1.690166, -2.27142, 0.1686275, 1, 0, 1,
-0.5013233, 0.2219718, -0.1193335, 0.1647059, 1, 0, 1,
-0.4987163, 0.5376731, 0.1756562, 0.1568628, 1, 0, 1,
-0.4986396, 0.1449241, -0.8333625, 0.1529412, 1, 0, 1,
-0.4983342, -1.177093, -2.302935, 0.145098, 1, 0, 1,
-0.4941994, 0.2772264, -0.92842, 0.1411765, 1, 0, 1,
-0.4870075, 0.4902476, -2.512386, 0.1333333, 1, 0, 1,
-0.4833135, -0.8024089, -3.897135, 0.1294118, 1, 0, 1,
-0.4766117, -2.234581, -2.400558, 0.1215686, 1, 0, 1,
-0.4739456, -0.8695817, -4.208889, 0.1176471, 1, 0, 1,
-0.4728606, 0.05142249, -1.35633, 0.1098039, 1, 0, 1,
-0.4714822, -1.119682, -2.57354, 0.1058824, 1, 0, 1,
-0.4687514, 0.08545776, -1.688024, 0.09803922, 1, 0, 1,
-0.4657452, 0.2146911, -0.7424887, 0.09019608, 1, 0, 1,
-0.4657365, -0.800796, -1.243194, 0.08627451, 1, 0, 1,
-0.4638147, 1.148302, 1.427508, 0.07843138, 1, 0, 1,
-0.4581764, -0.3149098, -4.168032, 0.07450981, 1, 0, 1,
-0.4550263, -0.2229632, -2.11855, 0.06666667, 1, 0, 1,
-0.4528558, 2.193269, -0.7365179, 0.0627451, 1, 0, 1,
-0.4502305, -0.1947121, -3.014617, 0.05490196, 1, 0, 1,
-0.4498475, 0.08110518, -1.565242, 0.05098039, 1, 0, 1,
-0.4359608, 0.6820815, -1.306677, 0.04313726, 1, 0, 1,
-0.4355768, 0.6604193, 1.203789, 0.03921569, 1, 0, 1,
-0.4347058, -0.6109778, -1.962905, 0.03137255, 1, 0, 1,
-0.4326655, 0.2912264, -0.597418, 0.02745098, 1, 0, 1,
-0.4251463, -1.071833, -2.509362, 0.01960784, 1, 0, 1,
-0.4247004, 0.435404, -0.1647542, 0.01568628, 1, 0, 1,
-0.4199823, 2.008467, 0.5451434, 0.007843138, 1, 0, 1,
-0.4176666, 1.444472, 0.7872936, 0.003921569, 1, 0, 1,
-0.4054499, -0.9595619, -2.884671, 0, 1, 0.003921569, 1,
-0.3968196, -0.6715657, -2.101619, 0, 1, 0.01176471, 1,
-0.3924274, 0.07865996, -1.45571, 0, 1, 0.01568628, 1,
-0.3895454, -1.001339, -2.267877, 0, 1, 0.02352941, 1,
-0.3873958, -0.424747, -1.250653, 0, 1, 0.02745098, 1,
-0.3862348, -1.212969, -2.686905, 0, 1, 0.03529412, 1,
-0.3858603, 0.6604089, -1.375706, 0, 1, 0.03921569, 1,
-0.3809898, 0.6231093, -2.789686, 0, 1, 0.04705882, 1,
-0.3801948, 0.2109135, -1.145075, 0, 1, 0.05098039, 1,
-0.3777044, -0.2546958, -2.442561, 0, 1, 0.05882353, 1,
-0.3760598, 0.185021, -1.144713, 0, 1, 0.0627451, 1,
-0.371923, 0.4347373, -1.074237, 0, 1, 0.07058824, 1,
-0.3709272, 0.002832121, -1.933568, 0, 1, 0.07450981, 1,
-0.3661027, -1.21925, -3.58475, 0, 1, 0.08235294, 1,
-0.3644439, -2.193986, -3.566622, 0, 1, 0.08627451, 1,
-0.3620092, 0.07359594, -1.013098, 0, 1, 0.09411765, 1,
-0.3594589, -0.7349145, -2.344187, 0, 1, 0.1019608, 1,
-0.3577406, -0.1064024, -2.398198, 0, 1, 0.1058824, 1,
-0.3565861, 0.6704208, -0.1332319, 0, 1, 0.1137255, 1,
-0.3558791, 0.1512627, -0.2881952, 0, 1, 0.1176471, 1,
-0.3548582, -1.27566, -2.600698, 0, 1, 0.1254902, 1,
-0.352092, 1.469465, -2.488343, 0, 1, 0.1294118, 1,
-0.3512493, -0.7737897, -2.80055, 0, 1, 0.1372549, 1,
-0.3459145, 0.8111112, -1.635964, 0, 1, 0.1411765, 1,
-0.3451861, 1.883658, 0.7707363, 0, 1, 0.1490196, 1,
-0.3348183, -1.270916, -3.873208, 0, 1, 0.1529412, 1,
-0.3314642, -0.8073817, -1.762182, 0, 1, 0.1607843, 1,
-0.330633, 0.5547207, -0.3943255, 0, 1, 0.1647059, 1,
-0.3295292, 0.7878609, -1.464531, 0, 1, 0.172549, 1,
-0.3264152, -0.08349811, -1.688162, 0, 1, 0.1764706, 1,
-0.3238606, 1.973335, 1.5731, 0, 1, 0.1843137, 1,
-0.3233881, -0.3347777, -2.933525, 0, 1, 0.1882353, 1,
-0.322858, 2.471579, -1.482038, 0, 1, 0.1960784, 1,
-0.3171943, -0.06548487, -1.279102, 0, 1, 0.2039216, 1,
-0.3135531, 0.688435, -2.087945, 0, 1, 0.2078431, 1,
-0.312655, 0.7238719, 0.3120621, 0, 1, 0.2156863, 1,
-0.3109024, 1.915123, 1.660445, 0, 1, 0.2196078, 1,
-0.310027, 0.6079677, -1.836248, 0, 1, 0.227451, 1,
-0.3057353, 0.6166286, 0.3124861, 0, 1, 0.2313726, 1,
-0.2950859, -0.05408572, -2.341597, 0, 1, 0.2392157, 1,
-0.2932088, -0.1698708, -1.657721, 0, 1, 0.2431373, 1,
-0.2907919, 1.884198, -1.24081, 0, 1, 0.2509804, 1,
-0.2905714, -0.870923, -2.228736, 0, 1, 0.254902, 1,
-0.2887576, 1.083712, -1.178703, 0, 1, 0.2627451, 1,
-0.2856848, -0.2790149, -1.974727, 0, 1, 0.2666667, 1,
-0.2844421, -0.6917355, -3.415247, 0, 1, 0.2745098, 1,
-0.2820372, -1.548502, -3.011677, 0, 1, 0.2784314, 1,
-0.2815219, 0.1272661, -2.358488, 0, 1, 0.2862745, 1,
-0.2806496, -0.09088791, -0.5653083, 0, 1, 0.2901961, 1,
-0.2797105, -1.06329, -4.126954, 0, 1, 0.2980392, 1,
-0.2783811, 0.889025, -0.1026182, 0, 1, 0.3058824, 1,
-0.2768647, -0.6804977, -4.02516, 0, 1, 0.3098039, 1,
-0.2745424, -1.633371, -4.184526, 0, 1, 0.3176471, 1,
-0.2738308, 2.22665, 1.853642, 0, 1, 0.3215686, 1,
-0.2634353, -1.516232, -2.637462, 0, 1, 0.3294118, 1,
-0.260818, 0.7585478, -1.501641, 0, 1, 0.3333333, 1,
-0.2602436, -1.24559, -3.536383, 0, 1, 0.3411765, 1,
-0.2543753, 0.964676, -0.1867572, 0, 1, 0.345098, 1,
-0.2518802, -0.2771329, -0.2842096, 0, 1, 0.3529412, 1,
-0.25029, -0.6192493, -2.70357, 0, 1, 0.3568628, 1,
-0.2495946, 1.320822, 0.2193876, 0, 1, 0.3647059, 1,
-0.2462968, -1.274584, -4.367843, 0, 1, 0.3686275, 1,
-0.2453336, 0.3869252, -0.966152, 0, 1, 0.3764706, 1,
-0.229601, -1.60875, -3.865167, 0, 1, 0.3803922, 1,
-0.2260407, -0.8679174, -1.685151, 0, 1, 0.3882353, 1,
-0.2232638, -0.1343184, -2.959522, 0, 1, 0.3921569, 1,
-0.2218888, -0.648858, -4.077563, 0, 1, 0.4, 1,
-0.2210095, -0.8831514, -5.402644, 0, 1, 0.4078431, 1,
-0.2189139, 1.791372, -0.2335453, 0, 1, 0.4117647, 1,
-0.2154953, 2.099948, -0.5132216, 0, 1, 0.4196078, 1,
-0.2149181, 0.6099758, 0.7261147, 0, 1, 0.4235294, 1,
-0.2131454, 1.467686, 0.135272, 0, 1, 0.4313726, 1,
-0.2106036, -0.2594979, -1.579639, 0, 1, 0.4352941, 1,
-0.2088856, -0.4702906, -3.428494, 0, 1, 0.4431373, 1,
-0.2072366, 2.470089, -0.9792014, 0, 1, 0.4470588, 1,
-0.1970133, 0.3189233, -3.449315, 0, 1, 0.454902, 1,
-0.1909483, -0.02633914, -1.693427, 0, 1, 0.4588235, 1,
-0.1877358, -1.383992, -4.294417, 0, 1, 0.4666667, 1,
-0.1851532, -0.0914159, -1.669687, 0, 1, 0.4705882, 1,
-0.1791509, -0.7761655, -4.481521, 0, 1, 0.4784314, 1,
-0.1774437, 0.4361179, -2.653248, 0, 1, 0.4823529, 1,
-0.1769352, -0.4396026, -2.626781, 0, 1, 0.4901961, 1,
-0.1768983, 0.7253882, -0.3324406, 0, 1, 0.4941176, 1,
-0.175846, -0.9363817, -1.876419, 0, 1, 0.5019608, 1,
-0.1735918, 0.8079141, 1.719564, 0, 1, 0.509804, 1,
-0.1723554, -0.2463914, -1.230519, 0, 1, 0.5137255, 1,
-0.1673924, 1.148683, 0.8872052, 0, 1, 0.5215687, 1,
-0.1665471, -0.001853986, -0.9619754, 0, 1, 0.5254902, 1,
-0.1662447, -0.7371643, -4.362321, 0, 1, 0.5333334, 1,
-0.1658416, -0.003558553, -2.78016, 0, 1, 0.5372549, 1,
-0.1651092, -0.3804288, -1.795495, 0, 1, 0.5450981, 1,
-0.1637292, 0.1858502, -0.1614939, 0, 1, 0.5490196, 1,
-0.1635074, 1.748869, 0.2827075, 0, 1, 0.5568628, 1,
-0.1604631, 1.587357, -0.2593141, 0, 1, 0.5607843, 1,
-0.1593072, -0.6289139, -4.460442, 0, 1, 0.5686275, 1,
-0.1559849, -0.6087736, -2.628962, 0, 1, 0.572549, 1,
-0.1542553, -0.6422752, -3.87539, 0, 1, 0.5803922, 1,
-0.1539793, -0.3184386, -0.3530284, 0, 1, 0.5843138, 1,
-0.1496815, 1.51276, -0.1005814, 0, 1, 0.5921569, 1,
-0.1428534, -0.1331316, -2.999321, 0, 1, 0.5960785, 1,
-0.1413692, 0.8386317, -0.1626882, 0, 1, 0.6039216, 1,
-0.1413097, -0.3084212, -1.733994, 0, 1, 0.6117647, 1,
-0.1398835, 1.903761, -0.5580056, 0, 1, 0.6156863, 1,
-0.1392896, -0.3870496, -3.739306, 0, 1, 0.6235294, 1,
-0.1388114, -2.186258, -3.25473, 0, 1, 0.627451, 1,
-0.1386612, -0.1042641, -2.800465, 0, 1, 0.6352941, 1,
-0.1348101, 0.9409214, 1.80407, 0, 1, 0.6392157, 1,
-0.1309626, -0.8572496, -2.909519, 0, 1, 0.6470588, 1,
-0.1279934, 0.7602934, -2.192887, 0, 1, 0.6509804, 1,
-0.1273993, -0.5311458, -1.585833, 0, 1, 0.6588235, 1,
-0.1198163, -0.5388554, -2.78784, 0, 1, 0.6627451, 1,
-0.1195935, -0.7833573, -2.800765, 0, 1, 0.6705883, 1,
-0.1179596, -1.50615, -3.045823, 0, 1, 0.6745098, 1,
-0.1153174, 1.94302, -0.6042345, 0, 1, 0.682353, 1,
-0.1073304, -0.03041651, -0.4379939, 0, 1, 0.6862745, 1,
-0.1058628, -0.5020485, -4.575758, 0, 1, 0.6941177, 1,
-0.09890953, -0.1794143, -1.594701, 0, 1, 0.7019608, 1,
-0.09750633, 3.286491, -1.466332, 0, 1, 0.7058824, 1,
-0.09548113, 1.725833, 0.3219363, 0, 1, 0.7137255, 1,
-0.09327748, -0.3897632, -3.871922, 0, 1, 0.7176471, 1,
-0.0907331, -0.5045682, -3.528674, 0, 1, 0.7254902, 1,
-0.09005468, 1.087497, -0.6400781, 0, 1, 0.7294118, 1,
-0.08960099, 0.3276452, -0.2085101, 0, 1, 0.7372549, 1,
-0.08667888, -0.3448357, -3.850269, 0, 1, 0.7411765, 1,
-0.08636831, -1.42236, -2.344933, 0, 1, 0.7490196, 1,
-0.08602675, -0.1849629, -3.231001, 0, 1, 0.7529412, 1,
-0.07873318, -0.3681625, -2.802856, 0, 1, 0.7607843, 1,
-0.07851271, 0.9332319, 1.23463, 0, 1, 0.7647059, 1,
-0.07370824, -2.010574, -1.905193, 0, 1, 0.772549, 1,
-0.07114949, -0.7360449, -1.423298, 0, 1, 0.7764706, 1,
-0.06547971, 0.4368622, -0.1818579, 0, 1, 0.7843137, 1,
-0.064129, 0.9829456, -1.700628, 0, 1, 0.7882353, 1,
-0.0640389, 0.4513474, 2.305676, 0, 1, 0.7960784, 1,
-0.06174423, 0.1975007, 0.3850476, 0, 1, 0.8039216, 1,
-0.06133515, 1.675629, 1.922501, 0, 1, 0.8078431, 1,
-0.05907727, 0.5524897, 0.4594849, 0, 1, 0.8156863, 1,
-0.05727695, -0.5090532, -3.565769, 0, 1, 0.8196079, 1,
-0.05723364, 0.1332822, 0.4307167, 0, 1, 0.827451, 1,
-0.05630306, -1.153103, -3.956495, 0, 1, 0.8313726, 1,
-0.05584114, 0.1100198, -0.2172821, 0, 1, 0.8392157, 1,
-0.05105698, 0.550196, -1.292477, 0, 1, 0.8431373, 1,
-0.04895698, -0.7521427, -1.771264, 0, 1, 0.8509804, 1,
-0.04849182, 0.2802826, 1.020867, 0, 1, 0.854902, 1,
-0.04614308, 1.227805, -0.2093995, 0, 1, 0.8627451, 1,
-0.04026971, 0.2833946, -0.0843199, 0, 1, 0.8666667, 1,
-0.03801495, -1.672334, -3.072517, 0, 1, 0.8745098, 1,
-0.03767668, 0.4407151, -0.1775992, 0, 1, 0.8784314, 1,
-0.03572024, 0.9427897, 0.4565352, 0, 1, 0.8862745, 1,
-0.03500592, 1.185746, -0.1804975, 0, 1, 0.8901961, 1,
-0.03201847, 0.2573958, 0.2889428, 0, 1, 0.8980392, 1,
-0.03175662, 0.5267319, -1.078115, 0, 1, 0.9058824, 1,
-0.02898431, -0.3963522, -3.26109, 0, 1, 0.9098039, 1,
-0.02798697, -0.9039617, -1.992564, 0, 1, 0.9176471, 1,
-0.02780133, 0.6556506, 0.8586524, 0, 1, 0.9215686, 1,
-0.02705898, -0.2059684, -4.219657, 0, 1, 0.9294118, 1,
-0.01907169, -0.4294839, -1.937469, 0, 1, 0.9333333, 1,
-0.01642127, 0.5686659, 1.644869, 0, 1, 0.9411765, 1,
-0.01555682, 1.227693, 0.4897603, 0, 1, 0.945098, 1,
-0.01284874, 2.802722, -2.840499, 0, 1, 0.9529412, 1,
-0.00868804, 0.8444226, 0.9200076, 0, 1, 0.9568627, 1,
-0.006853147, 0.9366946, 0.9767027, 0, 1, 0.9647059, 1,
-0.005766068, -1.447812, -4.503427, 0, 1, 0.9686275, 1,
-0.0001939522, 0.6274282, 1.385402, 0, 1, 0.9764706, 1,
0.004282224, -0.4070355, 1.440065, 0, 1, 0.9803922, 1,
0.007533322, -0.2080693, 4.232831, 0, 1, 0.9882353, 1,
0.00814159, 1.478844, -1.10745, 0, 1, 0.9921569, 1,
0.01610393, 1.5312, 0.07372059, 0, 1, 1, 1,
0.02795487, 0.0139946, 2.444697, 0, 0.9921569, 1, 1,
0.02817336, 0.3923283, 1.33713, 0, 0.9882353, 1, 1,
0.03324733, 0.2683524, 0.3722513, 0, 0.9803922, 1, 1,
0.03475024, -1.082902, 4.403436, 0, 0.9764706, 1, 1,
0.03813407, -0.9476326, 3.117387, 0, 0.9686275, 1, 1,
0.0388787, -0.1774335, 2.734657, 0, 0.9647059, 1, 1,
0.03962712, -0.2766335, 4.612882, 0, 0.9568627, 1, 1,
0.04835427, -1.194729, 2.166206, 0, 0.9529412, 1, 1,
0.05017037, -0.394272, 1.263912, 0, 0.945098, 1, 1,
0.05181614, 0.007882386, -0.009564932, 0, 0.9411765, 1, 1,
0.05255286, 0.8163602, 0.5110971, 0, 0.9333333, 1, 1,
0.05290864, -2.160327, 2.400928, 0, 0.9294118, 1, 1,
0.0543198, -1.613459, 1.869682, 0, 0.9215686, 1, 1,
0.05703491, -0.6124395, 5.231874, 0, 0.9176471, 1, 1,
0.05798259, 0.3699711, -0.3294125, 0, 0.9098039, 1, 1,
0.06170833, -0.8648819, 3.682273, 0, 0.9058824, 1, 1,
0.07142429, -0.1828986, 4.500571, 0, 0.8980392, 1, 1,
0.07597515, -1.359121, 1.61257, 0, 0.8901961, 1, 1,
0.07726232, -0.3318564, 1.383107, 0, 0.8862745, 1, 1,
0.09065651, 0.6566451, -1.298759, 0, 0.8784314, 1, 1,
0.09406155, -0.5231718, 2.926277, 0, 0.8745098, 1, 1,
0.09416055, -0.0007328556, 1.592329, 0, 0.8666667, 1, 1,
0.09507745, 0.0559526, 0.88392, 0, 0.8627451, 1, 1,
0.09520668, 0.5899675, 0.7584022, 0, 0.854902, 1, 1,
0.09537427, -0.3941595, 2.352511, 0, 0.8509804, 1, 1,
0.09663677, 0.2234298, 1.823756, 0, 0.8431373, 1, 1,
0.09780868, 0.9798229, 1.251426, 0, 0.8392157, 1, 1,
0.09874684, -0.00352588, 2.239364, 0, 0.8313726, 1, 1,
0.1007348, -0.3455078, 3.393196, 0, 0.827451, 1, 1,
0.1009, -1.069525, 3.722192, 0, 0.8196079, 1, 1,
0.1030382, -1.618843, 3.232062, 0, 0.8156863, 1, 1,
0.1063242, 0.6796733, 0.0007745774, 0, 0.8078431, 1, 1,
0.109446, 1.550033, 0.8233045, 0, 0.8039216, 1, 1,
0.1116587, -1.532471, 3.956297, 0, 0.7960784, 1, 1,
0.1125572, 0.9371794, 0.6999233, 0, 0.7882353, 1, 1,
0.1139206, 0.3918529, 0.3428743, 0, 0.7843137, 1, 1,
0.1164712, -0.1973077, 1.595078, 0, 0.7764706, 1, 1,
0.1185792, -0.9682983, 3.911382, 0, 0.772549, 1, 1,
0.1188771, 0.9266957, -0.3001841, 0, 0.7647059, 1, 1,
0.1220844, 0.5293699, 0.9231535, 0, 0.7607843, 1, 1,
0.126557, 0.7310587, -0.3493249, 0, 0.7529412, 1, 1,
0.1281618, -0.3731645, 2.771488, 0, 0.7490196, 1, 1,
0.1356843, 0.9435633, -0.0304201, 0, 0.7411765, 1, 1,
0.1392764, -0.4014597, 2.689004, 0, 0.7372549, 1, 1,
0.1429967, -1.321912, 2.73, 0, 0.7294118, 1, 1,
0.1454052, 0.3780878, 0.6146178, 0, 0.7254902, 1, 1,
0.1489416, -0.57833, 1.493858, 0, 0.7176471, 1, 1,
0.1493448, -0.5085028, 1.016841, 0, 0.7137255, 1, 1,
0.1502817, 0.05387536, 2.418221, 0, 0.7058824, 1, 1,
0.1520729, -0.6564651, 3.901061, 0, 0.6980392, 1, 1,
0.1534262, -0.9910843, 2.821353, 0, 0.6941177, 1, 1,
0.1586256, 0.2044933, 0.4978042, 0, 0.6862745, 1, 1,
0.1588259, -0.7760073, 3.000084, 0, 0.682353, 1, 1,
0.1599409, 0.7732281, 2.135487, 0, 0.6745098, 1, 1,
0.1626059, 0.2784119, 1.314971, 0, 0.6705883, 1, 1,
0.1631162, 0.759131, 0.2832789, 0, 0.6627451, 1, 1,
0.1649386, -0.06379709, 2.353408, 0, 0.6588235, 1, 1,
0.1651487, 0.5130183, 0.8994203, 0, 0.6509804, 1, 1,
0.165433, -0.6977379, 3.629765, 0, 0.6470588, 1, 1,
0.1658774, -1.408369, 2.737539, 0, 0.6392157, 1, 1,
0.1732606, 0.9761242, 0.7928411, 0, 0.6352941, 1, 1,
0.1756215, 0.4383464, -1.652553, 0, 0.627451, 1, 1,
0.178043, 0.728938, -0.5134867, 0, 0.6235294, 1, 1,
0.1800284, 0.4955814, -0.3143041, 0, 0.6156863, 1, 1,
0.185987, -2.140197, 2.925838, 0, 0.6117647, 1, 1,
0.186673, 0.5192569, 0.7259349, 0, 0.6039216, 1, 1,
0.1885351, 1.534953, 0.11528, 0, 0.5960785, 1, 1,
0.1904988, -1.530963, 1.233412, 0, 0.5921569, 1, 1,
0.1905437, -0.4404114, 4.588737, 0, 0.5843138, 1, 1,
0.1915779, 1.664606, -1.073973, 0, 0.5803922, 1, 1,
0.1931037, 0.9064917, 0.9273374, 0, 0.572549, 1, 1,
0.1962816, 2.113976, 2.244375, 0, 0.5686275, 1, 1,
0.1983875, -0.4062275, 2.365294, 0, 0.5607843, 1, 1,
0.2024021, 0.4234155, -0.4092544, 0, 0.5568628, 1, 1,
0.202784, 1.237582, 1.328417, 0, 0.5490196, 1, 1,
0.2047441, -0.9528531, 2.159653, 0, 0.5450981, 1, 1,
0.2121347, -0.827677, 2.30775, 0, 0.5372549, 1, 1,
0.2121833, -0.24788, 1.987934, 0, 0.5333334, 1, 1,
0.215734, 0.210815, 1.390221, 0, 0.5254902, 1, 1,
0.2178605, -2.72923, 3.490597, 0, 0.5215687, 1, 1,
0.2214663, -0.07415605, 2.087999, 0, 0.5137255, 1, 1,
0.221878, -0.3693426, 1.545882, 0, 0.509804, 1, 1,
0.2227302, -0.3329674, 2.271353, 0, 0.5019608, 1, 1,
0.2246465, 0.5251027, 1.42864, 0, 0.4941176, 1, 1,
0.2254032, 0.4941553, -0.123475, 0, 0.4901961, 1, 1,
0.226321, -1.296143, 2.184505, 0, 0.4823529, 1, 1,
0.2277811, -0.05726874, 0.07598056, 0, 0.4784314, 1, 1,
0.2303141, 0.3513573, 0.7634333, 0, 0.4705882, 1, 1,
0.232521, 0.5820284, 1.156356, 0, 0.4666667, 1, 1,
0.2338277, 0.3761912, 0.9572232, 0, 0.4588235, 1, 1,
0.2343512, 1.17769, -1.349533, 0, 0.454902, 1, 1,
0.236189, 0.6323209, -2.025788, 0, 0.4470588, 1, 1,
0.2422643, 1.887548, 0.4962922, 0, 0.4431373, 1, 1,
0.2443389, 1.238008, -1.26903, 0, 0.4352941, 1, 1,
0.2449701, -0.3205898, 3.800589, 0, 0.4313726, 1, 1,
0.2460925, -1.803272, 4.29041, 0, 0.4235294, 1, 1,
0.2469094, -0.5982447, 1.070271, 0, 0.4196078, 1, 1,
0.2494356, -1.18214, 2.258361, 0, 0.4117647, 1, 1,
0.2498498, -0.1167237, 1.51006, 0, 0.4078431, 1, 1,
0.2532858, -0.2240096, 3.366507, 0, 0.4, 1, 1,
0.2548499, 1.079133, -0.7530828, 0, 0.3921569, 1, 1,
0.2554514, 0.2401946, 1.698804, 0, 0.3882353, 1, 1,
0.2576957, -0.9381173, 1.817154, 0, 0.3803922, 1, 1,
0.2580388, 0.7353362, -0.8419468, 0, 0.3764706, 1, 1,
0.2588224, 0.703031, -0.08690388, 0, 0.3686275, 1, 1,
0.2629253, -0.3178915, 1.133199, 0, 0.3647059, 1, 1,
0.2635457, -0.5130973, 0.6592827, 0, 0.3568628, 1, 1,
0.2648595, -1.473334, 2.808724, 0, 0.3529412, 1, 1,
0.2729484, -2.109305, 1.954099, 0, 0.345098, 1, 1,
0.2731106, 0.66092, 0.6816165, 0, 0.3411765, 1, 1,
0.27587, -0.122858, 2.118258, 0, 0.3333333, 1, 1,
0.2777736, -0.9797719, 3.139627, 0, 0.3294118, 1, 1,
0.2778558, 0.8252129, 1.111162, 0, 0.3215686, 1, 1,
0.2894473, -0.02987806, 3.431544, 0, 0.3176471, 1, 1,
0.2921646, 0.2676758, 0.9863971, 0, 0.3098039, 1, 1,
0.2928926, -0.507044, 2.684485, 0, 0.3058824, 1, 1,
0.2949429, 0.6982998, -0.9837499, 0, 0.2980392, 1, 1,
0.2963208, 0.4193435, 2.32963, 0, 0.2901961, 1, 1,
0.2964323, -0.2725771, 2.41647, 0, 0.2862745, 1, 1,
0.2971582, -0.7680956, 2.650244, 0, 0.2784314, 1, 1,
0.2983623, -1.321259, 2.955693, 0, 0.2745098, 1, 1,
0.301756, -0.2566697, 4.374769, 0, 0.2666667, 1, 1,
0.3058861, -0.4213908, 3.842649, 0, 0.2627451, 1, 1,
0.3120596, -0.3896438, 1.980376, 0, 0.254902, 1, 1,
0.3140464, 0.08610231, 1.369927, 0, 0.2509804, 1, 1,
0.3165711, -2.374563, 1.667101, 0, 0.2431373, 1, 1,
0.3179799, 2.212565, 2.006839, 0, 0.2392157, 1, 1,
0.3198, 0.7561247, 1.060417, 0, 0.2313726, 1, 1,
0.321058, 0.4966095, 1.18697, 0, 0.227451, 1, 1,
0.3211154, -0.8788803, 3.511597, 0, 0.2196078, 1, 1,
0.321815, -0.2792572, 2.290682, 0, 0.2156863, 1, 1,
0.3262336, 2.535839, 0.4733293, 0, 0.2078431, 1, 1,
0.3268437, -0.3197219, 2.92413, 0, 0.2039216, 1, 1,
0.3314624, -1.45491, 2.38165, 0, 0.1960784, 1, 1,
0.3405008, -0.3536531, 1.032458, 0, 0.1882353, 1, 1,
0.3411599, 0.1089168, -0.12801, 0, 0.1843137, 1, 1,
0.3497294, -0.5580771, 3.769562, 0, 0.1764706, 1, 1,
0.3533284, 2.112807, 1.866415, 0, 0.172549, 1, 1,
0.355134, 0.4516256, -0.3777513, 0, 0.1647059, 1, 1,
0.3595506, 0.04710836, 1.915772, 0, 0.1607843, 1, 1,
0.3596377, -2.597953, 2.321206, 0, 0.1529412, 1, 1,
0.3599474, -1.619729, 4.465462, 0, 0.1490196, 1, 1,
0.3630247, 0.02225286, 2.491818, 0, 0.1411765, 1, 1,
0.3636173, -1.320085, 3.445514, 0, 0.1372549, 1, 1,
0.3644316, -0.1023815, 2.507087, 0, 0.1294118, 1, 1,
0.3650371, 0.4816408, -0.4463631, 0, 0.1254902, 1, 1,
0.3756394, 0.5669654, 1.141304, 0, 0.1176471, 1, 1,
0.3771307, 0.9237617, -0.3551525, 0, 0.1137255, 1, 1,
0.3781476, 0.1272356, 1.659254, 0, 0.1058824, 1, 1,
0.37896, 0.2317097, -0.0822128, 0, 0.09803922, 1, 1,
0.3795796, -0.3472089, 2.146917, 0, 0.09411765, 1, 1,
0.3802367, 0.5935642, 0.6015321, 0, 0.08627451, 1, 1,
0.3827395, -1.826095, 1.707696, 0, 0.08235294, 1, 1,
0.3833497, -1.326509, 4.584209, 0, 0.07450981, 1, 1,
0.3892586, 1.128951, -0.2360379, 0, 0.07058824, 1, 1,
0.3902631, -0.3128834, 1.73134, 0, 0.0627451, 1, 1,
0.3941728, 0.05381626, 3.659231, 0, 0.05882353, 1, 1,
0.3958046, -0.06525934, 1.638936, 0, 0.05098039, 1, 1,
0.3995418, -0.3113759, 3.214699, 0, 0.04705882, 1, 1,
0.4027331, -0.925142, 2.996184, 0, 0.03921569, 1, 1,
0.403834, 0.3340066, -0.1930254, 0, 0.03529412, 1, 1,
0.4051456, 1.957076, 1.474923, 0, 0.02745098, 1, 1,
0.407069, -0.6904702, 3.650408, 0, 0.02352941, 1, 1,
0.4129917, 1.448372, -0.5484733, 0, 0.01568628, 1, 1,
0.4132898, 1.324782, 1.516613, 0, 0.01176471, 1, 1,
0.4142736, -0.2383269, 2.1587, 0, 0.003921569, 1, 1,
0.4163317, -0.5403045, 3.754733, 0.003921569, 0, 1, 1,
0.418041, -0.001987526, 1.920161, 0.007843138, 0, 1, 1,
0.421814, 0.3069351, 1.039309, 0.01568628, 0, 1, 1,
0.4274166, 0.4503511, -0.4810497, 0.01960784, 0, 1, 1,
0.4290325, 0.7358173, 1.224325, 0.02745098, 0, 1, 1,
0.4304914, 0.4602275, 1.991594, 0.03137255, 0, 1, 1,
0.4346491, -2.748605, 4.829423, 0.03921569, 0, 1, 1,
0.4361917, 0.0173422, 2.03077, 0.04313726, 0, 1, 1,
0.4386438, 1.091794, 0.6821973, 0.05098039, 0, 1, 1,
0.4404753, -2.033614, 2.674719, 0.05490196, 0, 1, 1,
0.4446228, 0.1155714, 0.6584287, 0.0627451, 0, 1, 1,
0.448108, -1.180463, 2.873055, 0.06666667, 0, 1, 1,
0.4541028, -0.2064473, 0.288119, 0.07450981, 0, 1, 1,
0.4541944, 1.19618, -0.2394446, 0.07843138, 0, 1, 1,
0.4558318, 0.2069536, 0.8207338, 0.08627451, 0, 1, 1,
0.4633316, -0.1935417, 3.178782, 0.09019608, 0, 1, 1,
0.4674636, -1.380265, 2.632046, 0.09803922, 0, 1, 1,
0.4699925, -1.228658, 3.159815, 0.1058824, 0, 1, 1,
0.4708343, 0.7425854, -0.3282591, 0.1098039, 0, 1, 1,
0.4709548, -1.012473, 4.046488, 0.1176471, 0, 1, 1,
0.4729602, -1.142026, 3.118937, 0.1215686, 0, 1, 1,
0.4742126, 0.518144, 0.2272402, 0.1294118, 0, 1, 1,
0.477085, -0.210703, 3.952908, 0.1333333, 0, 1, 1,
0.4807467, 0.5574499, 2.584924, 0.1411765, 0, 1, 1,
0.4843184, 0.8657588, 0.3617643, 0.145098, 0, 1, 1,
0.4899434, -1.730253, 1.047805, 0.1529412, 0, 1, 1,
0.4943497, -2.389373, 2.068106, 0.1568628, 0, 1, 1,
0.4945955, 0.3203256, 0.7751096, 0.1647059, 0, 1, 1,
0.4983832, -0.8323675, 2.034484, 0.1686275, 0, 1, 1,
0.4984596, 1.75589, -1.165096, 0.1764706, 0, 1, 1,
0.5069597, -1.01062, 3.729653, 0.1803922, 0, 1, 1,
0.5100434, 0.9252003, 0.3758286, 0.1882353, 0, 1, 1,
0.5116041, -0.03653657, 3.683945, 0.1921569, 0, 1, 1,
0.5137672, -0.8597764, 3.14419, 0.2, 0, 1, 1,
0.514475, 0.4153784, 2.353053, 0.2078431, 0, 1, 1,
0.5165011, 1.613652, -1.530856, 0.2117647, 0, 1, 1,
0.5209706, 1.064913, 0.4280007, 0.2196078, 0, 1, 1,
0.5352299, 0.01428205, 1.294517, 0.2235294, 0, 1, 1,
0.5377148, -0.1391787, 1.79817, 0.2313726, 0, 1, 1,
0.5383962, 0.9173019, 0.2373205, 0.2352941, 0, 1, 1,
0.5385026, 0.5099646, 1.094134, 0.2431373, 0, 1, 1,
0.5393829, 0.7787564, 0.3052827, 0.2470588, 0, 1, 1,
0.5404555, -0.277796, 3.322055, 0.254902, 0, 1, 1,
0.5435027, -0.4644613, 2.966549, 0.2588235, 0, 1, 1,
0.5455167, -0.9497647, 1.831775, 0.2666667, 0, 1, 1,
0.5460367, 1.399531, 0.1292197, 0.2705882, 0, 1, 1,
0.5515159, 1.382915, 1.252466, 0.2784314, 0, 1, 1,
0.5517204, -0.3352, 2.064784, 0.282353, 0, 1, 1,
0.5531793, 0.1116484, 0.4651801, 0.2901961, 0, 1, 1,
0.5616635, 1.786357, 1.563247, 0.2941177, 0, 1, 1,
0.5634691, -1.129799, 1.735016, 0.3019608, 0, 1, 1,
0.5679379, -1.161414, 3.218449, 0.3098039, 0, 1, 1,
0.577867, -1.078462, 1.242035, 0.3137255, 0, 1, 1,
0.5892357, 0.2470909, 1.678544, 0.3215686, 0, 1, 1,
0.5938357, 0.183321, 1.15564, 0.3254902, 0, 1, 1,
0.6001291, 0.8302142, -0.1304161, 0.3333333, 0, 1, 1,
0.6030532, -0.3992112, 2.298442, 0.3372549, 0, 1, 1,
0.6069645, -1.391227, 1.128046, 0.345098, 0, 1, 1,
0.6129025, -1.180661, 0.6200143, 0.3490196, 0, 1, 1,
0.6137967, 2.012269, 2.500909, 0.3568628, 0, 1, 1,
0.6174608, -0.2208612, 0.803322, 0.3607843, 0, 1, 1,
0.6216922, -0.4796183, 4.018607, 0.3686275, 0, 1, 1,
0.6290038, 0.2410478, 1.637577, 0.372549, 0, 1, 1,
0.6304423, -1.61854, 4.513677, 0.3803922, 0, 1, 1,
0.6335556, -0.72723, 1.566684, 0.3843137, 0, 1, 1,
0.6421244, -0.3422257, 1.313307, 0.3921569, 0, 1, 1,
0.6435702, -0.01695917, 0.7078551, 0.3960784, 0, 1, 1,
0.6499609, 1.100069, -1.469552, 0.4039216, 0, 1, 1,
0.6585867, 0.9667981, 0.4566139, 0.4117647, 0, 1, 1,
0.6597808, -0.2491789, 0.2573138, 0.4156863, 0, 1, 1,
0.6604275, -0.1617021, 2.529582, 0.4235294, 0, 1, 1,
0.6708292, 0.2368142, 2.948463, 0.427451, 0, 1, 1,
0.6715115, -0.1138374, 1.172666, 0.4352941, 0, 1, 1,
0.672288, 1.311347, 0.7877542, 0.4392157, 0, 1, 1,
0.6722991, 0.8983579, 1.923434, 0.4470588, 0, 1, 1,
0.675253, 0.595916, 1.544605, 0.4509804, 0, 1, 1,
0.6760669, -0.2357519, 3.714449, 0.4588235, 0, 1, 1,
0.6819339, -0.491404, 2.784815, 0.4627451, 0, 1, 1,
0.6875476, 0.2441913, 1.925681, 0.4705882, 0, 1, 1,
0.6922503, 0.5747439, -1.069795, 0.4745098, 0, 1, 1,
0.6939062, -1.363963, 2.126014, 0.4823529, 0, 1, 1,
0.7048253, 1.958865, -1.037258, 0.4862745, 0, 1, 1,
0.7189524, -1.028072, 1.654993, 0.4941176, 0, 1, 1,
0.7222592, 0.1355303, 0.8802696, 0.5019608, 0, 1, 1,
0.7241451, 0.4365838, 1.403871, 0.5058824, 0, 1, 1,
0.7247159, -1.737518, 3.01473, 0.5137255, 0, 1, 1,
0.7248905, -0.8086064, 2.81045, 0.5176471, 0, 1, 1,
0.7284982, 1.526474, 0.3994359, 0.5254902, 0, 1, 1,
0.7319856, 0.3524063, 1.136291, 0.5294118, 0, 1, 1,
0.7360789, 0.6802344, 0.411204, 0.5372549, 0, 1, 1,
0.740381, 0.4143201, 0.3229293, 0.5411765, 0, 1, 1,
0.7419525, -0.4869488, 0.01325218, 0.5490196, 0, 1, 1,
0.7423248, -0.2960376, 1.074256, 0.5529412, 0, 1, 1,
0.7439117, 1.498945, 0.705134, 0.5607843, 0, 1, 1,
0.7444245, -0.9852633, 3.284547, 0.5647059, 0, 1, 1,
0.7495122, -0.2052001, 3.239203, 0.572549, 0, 1, 1,
0.750145, -0.3405428, 2.684675, 0.5764706, 0, 1, 1,
0.7501597, 0.5853321, 2.179949, 0.5843138, 0, 1, 1,
0.7518581, -1.574334, 1.360064, 0.5882353, 0, 1, 1,
0.7525297, -0.5557145, 2.176146, 0.5960785, 0, 1, 1,
0.7531552, -1.379276, 4.009838, 0.6039216, 0, 1, 1,
0.7599054, 0.6966942, 1.307829, 0.6078432, 0, 1, 1,
0.7609648, 0.1335529, 2.289426, 0.6156863, 0, 1, 1,
0.7622574, -2.469475, 2.435931, 0.6196079, 0, 1, 1,
0.7665204, -0.8803806, 3.401255, 0.627451, 0, 1, 1,
0.7678734, 0.612541, 0.7286583, 0.6313726, 0, 1, 1,
0.7701858, -0.2523703, 1.991189, 0.6392157, 0, 1, 1,
0.7733295, -1.513252, 3.261429, 0.6431373, 0, 1, 1,
0.7759861, -0.2902213, 2.306839, 0.6509804, 0, 1, 1,
0.7785196, -1.441635, 4.81482, 0.654902, 0, 1, 1,
0.7816367, -0.6248608, 2.813673, 0.6627451, 0, 1, 1,
0.7818238, -0.5978551, 0.3783597, 0.6666667, 0, 1, 1,
0.7886254, -0.338014, 3.53089, 0.6745098, 0, 1, 1,
0.7937384, -0.8009417, 2.825846, 0.6784314, 0, 1, 1,
0.7944443, 0.4509241, -0.4633183, 0.6862745, 0, 1, 1,
0.796055, 1.661911, 0.8919525, 0.6901961, 0, 1, 1,
0.8010633, 0.6869343, 0.06988911, 0.6980392, 0, 1, 1,
0.8123279, -0.9884077, 2.362697, 0.7058824, 0, 1, 1,
0.8157754, -0.5367643, 2.489546, 0.7098039, 0, 1, 1,
0.8177041, 1.056563, 0.2906205, 0.7176471, 0, 1, 1,
0.8181629, -0.264988, 3.007014, 0.7215686, 0, 1, 1,
0.8182419, 0.8209471, -0.3312218, 0.7294118, 0, 1, 1,
0.8191435, 0.6387063, 0.9829321, 0.7333333, 0, 1, 1,
0.8192737, 0.7010711, 0.1824954, 0.7411765, 0, 1, 1,
0.8214081, 0.04437669, 3.420482, 0.7450981, 0, 1, 1,
0.8277705, -0.1072574, 0.1375069, 0.7529412, 0, 1, 1,
0.8407203, 0.2891442, 1.244494, 0.7568628, 0, 1, 1,
0.8445312, -1.65233, 3.857169, 0.7647059, 0, 1, 1,
0.8469841, 1.618907, 1.43459, 0.7686275, 0, 1, 1,
0.8473504, -1.940795, 2.606953, 0.7764706, 0, 1, 1,
0.8482615, 0.16362, -0.01444199, 0.7803922, 0, 1, 1,
0.851306, 0.3901703, 0.7614403, 0.7882353, 0, 1, 1,
0.8544229, -0.8507956, 3.132238, 0.7921569, 0, 1, 1,
0.8549855, -1.786179, 2.870406, 0.8, 0, 1, 1,
0.8550633, 0.5398214, 1.685449, 0.8078431, 0, 1, 1,
0.8568026, -1.643844, 2.501877, 0.8117647, 0, 1, 1,
0.8604463, 1.288825, 0.243581, 0.8196079, 0, 1, 1,
0.8660582, 0.5353321, 1.116047, 0.8235294, 0, 1, 1,
0.8663065, -0.9900807, 3.255115, 0.8313726, 0, 1, 1,
0.8737162, 0.1054503, 2.268055, 0.8352941, 0, 1, 1,
0.8804975, -0.2641963, -0.1348745, 0.8431373, 0, 1, 1,
0.8823356, 0.5459144, 0.2716155, 0.8470588, 0, 1, 1,
0.8827603, 1.060165, 2.07343, 0.854902, 0, 1, 1,
0.887012, -0.7405491, 2.653275, 0.8588235, 0, 1, 1,
0.8880922, -0.04536021, 0.9975435, 0.8666667, 0, 1, 1,
0.8907319, -0.2530195, -0.02887171, 0.8705882, 0, 1, 1,
0.8930047, -0.0413212, 0.9623598, 0.8784314, 0, 1, 1,
0.8938358, 1.885743, 0.6819508, 0.8823529, 0, 1, 1,
0.8942319, -0.1625515, 2.864405, 0.8901961, 0, 1, 1,
0.896351, -0.1515003, 3.402084, 0.8941177, 0, 1, 1,
0.8963532, 0.1241398, 2.325336, 0.9019608, 0, 1, 1,
0.8964528, -0.5484868, 2.608016, 0.9098039, 0, 1, 1,
0.9028291, -1.099134, 3.466892, 0.9137255, 0, 1, 1,
0.904117, -1.25195, 2.739784, 0.9215686, 0, 1, 1,
0.9099628, 0.6558049, 0.03654232, 0.9254902, 0, 1, 1,
0.9218147, 0.2768808, 2.088964, 0.9333333, 0, 1, 1,
0.9246851, -0.9273995, 0.1916726, 0.9372549, 0, 1, 1,
0.9299893, -1.886734, 3.423674, 0.945098, 0, 1, 1,
0.9330426, 1.619192, 0.7864652, 0.9490196, 0, 1, 1,
0.9331645, 0.4269053, 3.666689, 0.9568627, 0, 1, 1,
0.9331949, -1.85966, 1.220587, 0.9607843, 0, 1, 1,
0.9396471, 0.05413656, 0.4672811, 0.9686275, 0, 1, 1,
0.941622, -1.40389, -0.01827717, 0.972549, 0, 1, 1,
0.9423306, -0.8124906, 1.979176, 0.9803922, 0, 1, 1,
0.9436486, 1.390689, 0.1829172, 0.9843137, 0, 1, 1,
0.9462625, 0.7860957, 1.400417, 0.9921569, 0, 1, 1,
0.9676246, 0.6502346, 1.079159, 0.9960784, 0, 1, 1,
0.9692579, 1.323374, 0.7216049, 1, 0, 0.9960784, 1,
0.9707273, -0.9915131, 2.105823, 1, 0, 0.9882353, 1,
0.9844006, -0.6183976, 2.963153, 1, 0, 0.9843137, 1,
0.9893671, 0.1598118, 2.262439, 1, 0, 0.9764706, 1,
1.004125, 0.209683, 1.797577, 1, 0, 0.972549, 1,
1.005395, -0.7134032, 1.184263, 1, 0, 0.9647059, 1,
1.009767, 1.441827, 0.5129617, 1, 0, 0.9607843, 1,
1.018354, 0.7493312, -0.1403754, 1, 0, 0.9529412, 1,
1.02528, 0.4718725, 1.397052, 1, 0, 0.9490196, 1,
1.027023, 0.4698139, -0.01947256, 1, 0, 0.9411765, 1,
1.029398, -1.598543, 4.069732, 1, 0, 0.9372549, 1,
1.029488, 1.168472, 0.3972585, 1, 0, 0.9294118, 1,
1.031054, 0.8955932, 1.335, 1, 0, 0.9254902, 1,
1.032677, 1.469636, 0.5090109, 1, 0, 0.9176471, 1,
1.043827, 0.1161345, 1.910671, 1, 0, 0.9137255, 1,
1.046436, 0.4563886, 2.881618, 1, 0, 0.9058824, 1,
1.050196, -0.2849969, 3.955742, 1, 0, 0.9019608, 1,
1.055881, -1.271219, 0.73778, 1, 0, 0.8941177, 1,
1.061813, 0.9291705, 1.198889, 1, 0, 0.8862745, 1,
1.062239, -0.1096401, 1.906812, 1, 0, 0.8823529, 1,
1.062801, -0.141553, 2.460408, 1, 0, 0.8745098, 1,
1.063236, 1.397759, -0.183028, 1, 0, 0.8705882, 1,
1.067602, 0.14293, 0.5256059, 1, 0, 0.8627451, 1,
1.071289, -1.137162, 0.8893268, 1, 0, 0.8588235, 1,
1.073912, 1.057015, 1.980037, 1, 0, 0.8509804, 1,
1.075793, -0.09678601, 3.823345, 1, 0, 0.8470588, 1,
1.07814, -0.2071189, 2.276858, 1, 0, 0.8392157, 1,
1.082036, -1.110154, 2.958245, 1, 0, 0.8352941, 1,
1.082565, -0.0421498, 0.2412031, 1, 0, 0.827451, 1,
1.090506, -2.289608, 4.003909, 1, 0, 0.8235294, 1,
1.092716, 0.07328628, 1.86076, 1, 0, 0.8156863, 1,
1.094517, 1.579398, 1.465871, 1, 0, 0.8117647, 1,
1.098951, -1.536538, 2.447113, 1, 0, 0.8039216, 1,
1.113881, -1.331919, 1.992252, 1, 0, 0.7960784, 1,
1.118009, -0.4649709, 1.404138, 1, 0, 0.7921569, 1,
1.122875, 0.4705506, 2.043615, 1, 0, 0.7843137, 1,
1.122927, -1.414951, 3.673146, 1, 0, 0.7803922, 1,
1.124589, 0.2961177, 0.303161, 1, 0, 0.772549, 1,
1.127457, 1.064338, -0.04124193, 1, 0, 0.7686275, 1,
1.130096, 0.6276513, 1.276035, 1, 0, 0.7607843, 1,
1.135591, -1.106137, -0.2588845, 1, 0, 0.7568628, 1,
1.136421, -0.2255646, 2.191556, 1, 0, 0.7490196, 1,
1.144641, -0.4620627, 1.96628, 1, 0, 0.7450981, 1,
1.149454, 0.1625398, 1.539113, 1, 0, 0.7372549, 1,
1.156508, -1.166984, 3.70595, 1, 0, 0.7333333, 1,
1.156654, -0.2286864, 1.908149, 1, 0, 0.7254902, 1,
1.159699, -0.7003447, 0.9365286, 1, 0, 0.7215686, 1,
1.161603, 0.6273484, 0.4672538, 1, 0, 0.7137255, 1,
1.168068, 0.4056002, 0.5723454, 1, 0, 0.7098039, 1,
1.174555, -1.058906, 1.493968, 1, 0, 0.7019608, 1,
1.19466, 0.8992864, 3.270269, 1, 0, 0.6941177, 1,
1.196603, 1.027888, 1.565266, 1, 0, 0.6901961, 1,
1.202762, -1.803572, 2.27796, 1, 0, 0.682353, 1,
1.204764, 2.735394, -0.6963063, 1, 0, 0.6784314, 1,
1.20669, 0.6288953, -1.012695, 1, 0, 0.6705883, 1,
1.212726, -0.1370627, 0.06709848, 1, 0, 0.6666667, 1,
1.22237, -1.200073, 2.294761, 1, 0, 0.6588235, 1,
1.233431, -0.7449909, 2.781678, 1, 0, 0.654902, 1,
1.237787, 0.2697249, 1.166346, 1, 0, 0.6470588, 1,
1.253454, 1.061969, 0.8422166, 1, 0, 0.6431373, 1,
1.254789, -0.7428775, 3.93281, 1, 0, 0.6352941, 1,
1.264276, 0.0837042, 1.215086, 1, 0, 0.6313726, 1,
1.265003, -0.5352251, 2.320042, 1, 0, 0.6235294, 1,
1.266178, 2.137697, 0.3669334, 1, 0, 0.6196079, 1,
1.270494, -1.647817, 2.683822, 1, 0, 0.6117647, 1,
1.272215, 1.0505, 1.077315, 1, 0, 0.6078432, 1,
1.278826, -0.868338, 3.068166, 1, 0, 0.6, 1,
1.279606, -1.049147, 3.407925, 1, 0, 0.5921569, 1,
1.286748, -0.6189288, 1.97888, 1, 0, 0.5882353, 1,
1.287491, -0.5503264, 0.4379511, 1, 0, 0.5803922, 1,
1.287823, -0.7271301, 3.832094, 1, 0, 0.5764706, 1,
1.288469, -0.8180923, 0.6927197, 1, 0, 0.5686275, 1,
1.301912, -0.5699277, 3.315022, 1, 0, 0.5647059, 1,
1.304483, -0.3842146, 2.861083, 1, 0, 0.5568628, 1,
1.306939, 1.519677, 0.9805324, 1, 0, 0.5529412, 1,
1.315397, 0.6358688, 1.452499, 1, 0, 0.5450981, 1,
1.320716, -0.2324241, 2.110908, 1, 0, 0.5411765, 1,
1.32119, 1.636263, 1.701437, 1, 0, 0.5333334, 1,
1.332712, -0.8938761, 2.525223, 1, 0, 0.5294118, 1,
1.334907, 1.445016, 0.920938, 1, 0, 0.5215687, 1,
1.33646, -1.200421, 2.813787, 1, 0, 0.5176471, 1,
1.353809, -0.6444905, 1.748304, 1, 0, 0.509804, 1,
1.365944, 0.7523208, 2.049926, 1, 0, 0.5058824, 1,
1.377285, -0.4344994, 1.108946, 1, 0, 0.4980392, 1,
1.383259, 1.060755, 1.441716, 1, 0, 0.4901961, 1,
1.384292, -1.446589, 1.337595, 1, 0, 0.4862745, 1,
1.38696, 0.07005993, 0.930247, 1, 0, 0.4784314, 1,
1.389613, 0.685859, 0.8139813, 1, 0, 0.4745098, 1,
1.399788, -0.4393631, 2.78234, 1, 0, 0.4666667, 1,
1.409137, -0.9209246, 2.749688, 1, 0, 0.4627451, 1,
1.425599, 0.6698369, 1.901835, 1, 0, 0.454902, 1,
1.428575, -0.205643, 1.34552, 1, 0, 0.4509804, 1,
1.432839, -1.284831, 2.622436, 1, 0, 0.4431373, 1,
1.434528, 0.6842909, 0.4394681, 1, 0, 0.4392157, 1,
1.437496, 0.8778613, 0.5715653, 1, 0, 0.4313726, 1,
1.446954, 0.2943595, 1.841291, 1, 0, 0.427451, 1,
1.455263, 0.1686833, 0.7212819, 1, 0, 0.4196078, 1,
1.459339, 0.5075936, 1.909717, 1, 0, 0.4156863, 1,
1.465755, 1.156511, 1.5503, 1, 0, 0.4078431, 1,
1.466266, 0.5609801, 0.1600201, 1, 0, 0.4039216, 1,
1.468472, 0.4158094, 3.11549, 1, 0, 0.3960784, 1,
1.475513, 0.418179, 1.994011, 1, 0, 0.3882353, 1,
1.49865, -1.28593, 1.951277, 1, 0, 0.3843137, 1,
1.499456, 0.4101671, 2.801525, 1, 0, 0.3764706, 1,
1.530768, 0.4159682, 2.280656, 1, 0, 0.372549, 1,
1.536785, -0.549592, 3.012235, 1, 0, 0.3647059, 1,
1.574517, -0.2985474, 2.110707, 1, 0, 0.3607843, 1,
1.581265, 1.218863, 1.61156, 1, 0, 0.3529412, 1,
1.58174, -0.3104022, 1.922385, 1, 0, 0.3490196, 1,
1.597818, 0.8513056, 2.246112, 1, 0, 0.3411765, 1,
1.634612, -1.558393, 2.646033, 1, 0, 0.3372549, 1,
1.641303, 0.8654534, 1.413601, 1, 0, 0.3294118, 1,
1.645677, 0.4377425, 0.8618841, 1, 0, 0.3254902, 1,
1.650619, -0.04014505, 1.766354, 1, 0, 0.3176471, 1,
1.653543, 2.005794, 0.6037797, 1, 0, 0.3137255, 1,
1.654557, 1.422852, 0.8110233, 1, 0, 0.3058824, 1,
1.681206, 0.2682122, 0.6990362, 1, 0, 0.2980392, 1,
1.683956, 1.447532, 0.4016545, 1, 0, 0.2941177, 1,
1.684594, 0.2515957, 0.9418911, 1, 0, 0.2862745, 1,
1.692634, -0.1082392, 2.772073, 1, 0, 0.282353, 1,
1.698494, 0.882803, 1.239615, 1, 0, 0.2745098, 1,
1.708236, -0.09632905, 0.5180467, 1, 0, 0.2705882, 1,
1.760774, -0.08055843, 3.067291, 1, 0, 0.2627451, 1,
1.761516, 1.284917, 1.345198, 1, 0, 0.2588235, 1,
1.776916, 0.548437, -0.1378329, 1, 0, 0.2509804, 1,
1.786575, -0.3437875, 2.170392, 1, 0, 0.2470588, 1,
1.788414, -1.657439, 2.075679, 1, 0, 0.2392157, 1,
1.807362, -0.8818099, 0.4795241, 1, 0, 0.2352941, 1,
1.814966, 0.7283115, -1.230528, 1, 0, 0.227451, 1,
1.818087, -0.2168239, 2.09911, 1, 0, 0.2235294, 1,
1.832145, -1.822922, 3.663379, 1, 0, 0.2156863, 1,
1.855699, 0.4750961, 2.205309, 1, 0, 0.2117647, 1,
1.860059, -0.2641437, 3.578646, 1, 0, 0.2039216, 1,
1.925371, 2.235838, 1.523754, 1, 0, 0.1960784, 1,
1.92884, 0.3981379, 2.907455, 1, 0, 0.1921569, 1,
1.94888, 0.8401507, 0.03726193, 1, 0, 0.1843137, 1,
1.964047, 0.184348, 1.881989, 1, 0, 0.1803922, 1,
1.973964, -0.4374605, 1.147771, 1, 0, 0.172549, 1,
1.988017, 0.7992239, 0.6231948, 1, 0, 0.1686275, 1,
1.999949, -0.4856522, 1.308787, 1, 0, 0.1607843, 1,
2.006214, 0.11135, 1.379681, 1, 0, 0.1568628, 1,
2.042305, 1.603595, -0.1146818, 1, 0, 0.1490196, 1,
2.054652, -0.5780553, 2.173608, 1, 0, 0.145098, 1,
2.061592, 0.2956284, 1.846986, 1, 0, 0.1372549, 1,
2.082338, -0.7480958, 1.857133, 1, 0, 0.1333333, 1,
2.095067, -1.554786, 2.73236, 1, 0, 0.1254902, 1,
2.098515, -1.64632, 2.12947, 1, 0, 0.1215686, 1,
2.113729, -0.05887634, 2.080111, 1, 0, 0.1137255, 1,
2.115683, 0.1637156, 0.1030702, 1, 0, 0.1098039, 1,
2.158661, -2.091067, 1.86436, 1, 0, 0.1019608, 1,
2.166263, -0.1520147, 1.395442, 1, 0, 0.09411765, 1,
2.167912, -0.9411704, 1.414433, 1, 0, 0.09019608, 1,
2.246707, 0.9298682, 1.82381, 1, 0, 0.08235294, 1,
2.261332, 0.9516606, 0.4528609, 1, 0, 0.07843138, 1,
2.307399, -0.6829668, 0.01948773, 1, 0, 0.07058824, 1,
2.318718, 0.3740349, 3.461617, 1, 0, 0.06666667, 1,
2.356626, 0.9512308, 1.85854, 1, 0, 0.05882353, 1,
2.380669, 0.0473609, 2.159931, 1, 0, 0.05490196, 1,
2.461061, 0.1517264, 0.6763386, 1, 0, 0.04705882, 1,
2.467498, -1.268438, 0.2862821, 1, 0, 0.04313726, 1,
2.535462, -0.7325774, 2.185373, 1, 0, 0.03529412, 1,
2.668312, 0.08606351, 2.513395, 1, 0, 0.03137255, 1,
2.710232, -0.4852489, 2.078097, 1, 0, 0.02352941, 1,
2.833168, -1.197895, 1.682216, 1, 0, 0.01960784, 1,
3.307015, -0.2682232, 1.257612, 1, 0, 0.01176471, 1,
3.78566, 0.5384533, 0.8553154, 1, 0, 0.007843138, 1
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
0.3538914, -3.92208, -7.236729, 0, -0.5, 0.5, 0.5,
0.3538914, -3.92208, -7.236729, 1, -0.5, 0.5, 0.5,
0.3538914, -3.92208, -7.236729, 1, 1.5, 0.5, 0.5,
0.3538914, -3.92208, -7.236729, 0, 1.5, 0.5, 0.5
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
-4.241246, 0.2045882, -7.236729, 0, -0.5, 0.5, 0.5,
-4.241246, 0.2045882, -7.236729, 1, -0.5, 0.5, 0.5,
-4.241246, 0.2045882, -7.236729, 1, 1.5, 0.5, 0.5,
-4.241246, 0.2045882, -7.236729, 0, 1.5, 0.5, 0.5
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
-4.241246, -3.92208, -0.09886694, 0, -0.5, 0.5, 0.5,
-4.241246, -3.92208, -0.09886694, 1, -0.5, 0.5, 0.5,
-4.241246, -3.92208, -0.09886694, 1, 1.5, 0.5, 0.5,
-4.241246, -3.92208, -0.09886694, 0, 1.5, 0.5, 0.5
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
-3, -2.969772, -5.58953,
3, -2.969772, -5.58953,
-3, -2.969772, -5.58953,
-3, -3.12849, -5.864063,
-2, -2.969772, -5.58953,
-2, -3.12849, -5.864063,
-1, -2.969772, -5.58953,
-1, -3.12849, -5.864063,
0, -2.969772, -5.58953,
0, -3.12849, -5.864063,
1, -2.969772, -5.58953,
1, -3.12849, -5.864063,
2, -2.969772, -5.58953,
2, -3.12849, -5.864063,
3, -2.969772, -5.58953,
3, -3.12849, -5.864063
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
-3, -3.445926, -6.41313, 0, -0.5, 0.5, 0.5,
-3, -3.445926, -6.41313, 1, -0.5, 0.5, 0.5,
-3, -3.445926, -6.41313, 1, 1.5, 0.5, 0.5,
-3, -3.445926, -6.41313, 0, 1.5, 0.5, 0.5,
-2, -3.445926, -6.41313, 0, -0.5, 0.5, 0.5,
-2, -3.445926, -6.41313, 1, -0.5, 0.5, 0.5,
-2, -3.445926, -6.41313, 1, 1.5, 0.5, 0.5,
-2, -3.445926, -6.41313, 0, 1.5, 0.5, 0.5,
-1, -3.445926, -6.41313, 0, -0.5, 0.5, 0.5,
-1, -3.445926, -6.41313, 1, -0.5, 0.5, 0.5,
-1, -3.445926, -6.41313, 1, 1.5, 0.5, 0.5,
-1, -3.445926, -6.41313, 0, 1.5, 0.5, 0.5,
0, -3.445926, -6.41313, 0, -0.5, 0.5, 0.5,
0, -3.445926, -6.41313, 1, -0.5, 0.5, 0.5,
0, -3.445926, -6.41313, 1, 1.5, 0.5, 0.5,
0, -3.445926, -6.41313, 0, 1.5, 0.5, 0.5,
1, -3.445926, -6.41313, 0, -0.5, 0.5, 0.5,
1, -3.445926, -6.41313, 1, -0.5, 0.5, 0.5,
1, -3.445926, -6.41313, 1, 1.5, 0.5, 0.5,
1, -3.445926, -6.41313, 0, 1.5, 0.5, 0.5,
2, -3.445926, -6.41313, 0, -0.5, 0.5, 0.5,
2, -3.445926, -6.41313, 1, -0.5, 0.5, 0.5,
2, -3.445926, -6.41313, 1, 1.5, 0.5, 0.5,
2, -3.445926, -6.41313, 0, 1.5, 0.5, 0.5,
3, -3.445926, -6.41313, 0, -0.5, 0.5, 0.5,
3, -3.445926, -6.41313, 1, -0.5, 0.5, 0.5,
3, -3.445926, -6.41313, 1, 1.5, 0.5, 0.5,
3, -3.445926, -6.41313, 0, 1.5, 0.5, 0.5
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
-3.18083, -2, -5.58953,
-3.18083, 3, -5.58953,
-3.18083, -2, -5.58953,
-3.357566, -2, -5.864063,
-3.18083, -1, -5.58953,
-3.357566, -1, -5.864063,
-3.18083, 0, -5.58953,
-3.357566, 0, -5.864063,
-3.18083, 1, -5.58953,
-3.357566, 1, -5.864063,
-3.18083, 2, -5.58953,
-3.357566, 2, -5.864063,
-3.18083, 3, -5.58953,
-3.357566, 3, -5.864063
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
-3.711038, -2, -6.41313, 0, -0.5, 0.5, 0.5,
-3.711038, -2, -6.41313, 1, -0.5, 0.5, 0.5,
-3.711038, -2, -6.41313, 1, 1.5, 0.5, 0.5,
-3.711038, -2, -6.41313, 0, 1.5, 0.5, 0.5,
-3.711038, -1, -6.41313, 0, -0.5, 0.5, 0.5,
-3.711038, -1, -6.41313, 1, -0.5, 0.5, 0.5,
-3.711038, -1, -6.41313, 1, 1.5, 0.5, 0.5,
-3.711038, -1, -6.41313, 0, 1.5, 0.5, 0.5,
-3.711038, 0, -6.41313, 0, -0.5, 0.5, 0.5,
-3.711038, 0, -6.41313, 1, -0.5, 0.5, 0.5,
-3.711038, 0, -6.41313, 1, 1.5, 0.5, 0.5,
-3.711038, 0, -6.41313, 0, 1.5, 0.5, 0.5,
-3.711038, 1, -6.41313, 0, -0.5, 0.5, 0.5,
-3.711038, 1, -6.41313, 1, -0.5, 0.5, 0.5,
-3.711038, 1, -6.41313, 1, 1.5, 0.5, 0.5,
-3.711038, 1, -6.41313, 0, 1.5, 0.5, 0.5,
-3.711038, 2, -6.41313, 0, -0.5, 0.5, 0.5,
-3.711038, 2, -6.41313, 1, -0.5, 0.5, 0.5,
-3.711038, 2, -6.41313, 1, 1.5, 0.5, 0.5,
-3.711038, 2, -6.41313, 0, 1.5, 0.5, 0.5,
-3.711038, 3, -6.41313, 0, -0.5, 0.5, 0.5,
-3.711038, 3, -6.41313, 1, -0.5, 0.5, 0.5,
-3.711038, 3, -6.41313, 1, 1.5, 0.5, 0.5,
-3.711038, 3, -6.41313, 0, 1.5, 0.5, 0.5
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
-3.18083, -2.969772, -4,
-3.18083, -2.969772, 4,
-3.18083, -2.969772, -4,
-3.357566, -3.12849, -4,
-3.18083, -2.969772, -2,
-3.357566, -3.12849, -2,
-3.18083, -2.969772, 0,
-3.357566, -3.12849, 0,
-3.18083, -2.969772, 2,
-3.357566, -3.12849, 2,
-3.18083, -2.969772, 4,
-3.357566, -3.12849, 4
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
-3.711038, -3.445926, -4, 0, -0.5, 0.5, 0.5,
-3.711038, -3.445926, -4, 1, -0.5, 0.5, 0.5,
-3.711038, -3.445926, -4, 1, 1.5, 0.5, 0.5,
-3.711038, -3.445926, -4, 0, 1.5, 0.5, 0.5,
-3.711038, -3.445926, -2, 0, -0.5, 0.5, 0.5,
-3.711038, -3.445926, -2, 1, -0.5, 0.5, 0.5,
-3.711038, -3.445926, -2, 1, 1.5, 0.5, 0.5,
-3.711038, -3.445926, -2, 0, 1.5, 0.5, 0.5,
-3.711038, -3.445926, 0, 0, -0.5, 0.5, 0.5,
-3.711038, -3.445926, 0, 1, -0.5, 0.5, 0.5,
-3.711038, -3.445926, 0, 1, 1.5, 0.5, 0.5,
-3.711038, -3.445926, 0, 0, 1.5, 0.5, 0.5,
-3.711038, -3.445926, 2, 0, -0.5, 0.5, 0.5,
-3.711038, -3.445926, 2, 1, -0.5, 0.5, 0.5,
-3.711038, -3.445926, 2, 1, 1.5, 0.5, 0.5,
-3.711038, -3.445926, 2, 0, 1.5, 0.5, 0.5,
-3.711038, -3.445926, 4, 0, -0.5, 0.5, 0.5,
-3.711038, -3.445926, 4, 1, -0.5, 0.5, 0.5,
-3.711038, -3.445926, 4, 1, 1.5, 0.5, 0.5,
-3.711038, -3.445926, 4, 0, 1.5, 0.5, 0.5
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
-3.18083, -2.969772, -5.58953,
-3.18083, 3.378948, -5.58953,
-3.18083, -2.969772, 5.391796,
-3.18083, 3.378948, 5.391796,
-3.18083, -2.969772, -5.58953,
-3.18083, -2.969772, 5.391796,
-3.18083, 3.378948, -5.58953,
-3.18083, 3.378948, 5.391796,
-3.18083, -2.969772, -5.58953,
3.888613, -2.969772, -5.58953,
-3.18083, -2.969772, 5.391796,
3.888613, -2.969772, 5.391796,
-3.18083, 3.378948, -5.58953,
3.888613, 3.378948, -5.58953,
-3.18083, 3.378948, 5.391796,
3.888613, 3.378948, 5.391796,
3.888613, -2.969772, -5.58953,
3.888613, 3.378948, -5.58953,
3.888613, -2.969772, 5.391796,
3.888613, 3.378948, 5.391796,
3.888613, -2.969772, -5.58953,
3.888613, -2.969772, 5.391796,
3.888613, 3.378948, -5.58953,
3.888613, 3.378948, 5.391796
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
var radius = 7.754178;
var distance = 34.49921;
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
mvMatrix.translate( -0.3538914, -0.2045882, 0.09886694 );
mvMatrix.scale( 1.185945, 1.320576, 0.7634751 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.49921);
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
Tartar_emetic<-read.table("Tartar_emetic.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Tartar_emetic$V2
```

```
## Error in eval(expr, envir, enclos): object 'Tartar_emetic' not found
```

```r
y<-Tartar_emetic$V3
```

```
## Error in eval(expr, envir, enclos): object 'Tartar_emetic' not found
```

```r
z<-Tartar_emetic$V4
```

```
## Error in eval(expr, envir, enclos): object 'Tartar_emetic' not found
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
-3.077877, -0.06315597, -1.303259, 0, 0, 1, 1, 1,
-2.925429, -0.7476817, -0.8256087, 1, 0, 0, 1, 1,
-2.841348, 0.02626893, -1.627198, 1, 0, 0, 1, 1,
-2.707092, 0.1982501, -2.528429, 1, 0, 0, 1, 1,
-2.623471, -0.3821885, -1.796364, 1, 0, 0, 1, 1,
-2.607002, -1.030473, -3.560091, 1, 0, 0, 1, 1,
-2.592477, 0.3860432, -1.854145, 0, 0, 0, 1, 1,
-2.529953, -1.473052, -3.463575, 0, 0, 0, 1, 1,
-2.47316, 1.002089, -1.351956, 0, 0, 0, 1, 1,
-2.380061, -0.8859382, -0.9682871, 0, 0, 0, 1, 1,
-2.356727, 1.23603, -2.734499, 0, 0, 0, 1, 1,
-2.324901, -2.812234, -1.563691, 0, 0, 0, 1, 1,
-2.246677, 0.6266781, -0.3242817, 0, 0, 0, 1, 1,
-2.216205, 0.698261, -0.4203609, 1, 1, 1, 1, 1,
-2.190912, -0.8308918, -0.3697527, 1, 1, 1, 1, 1,
-2.122009, -2.064368, -2.523365, 1, 1, 1, 1, 1,
-2.060199, 0.0161304, -2.995183, 1, 1, 1, 1, 1,
-2.051023, -0.1761277, -2.518987, 1, 1, 1, 1, 1,
-2.048385, 0.0106721, -1.153363, 1, 1, 1, 1, 1,
-2.026086, 1.010345, -0.3719283, 1, 1, 1, 1, 1,
-2.014652, -0.9798705, -0.2940198, 1, 1, 1, 1, 1,
-2.008658, -0.09322789, 0.2094339, 1, 1, 1, 1, 1,
-1.969893, 1.088263, -0.7534989, 1, 1, 1, 1, 1,
-1.965612, -0.7670487, -1.547592, 1, 1, 1, 1, 1,
-1.942274, -0.4307431, -2.230576, 1, 1, 1, 1, 1,
-1.933691, 0.3021699, -0.307246, 1, 1, 1, 1, 1,
-1.932343, -0.05046348, -2.169974, 1, 1, 1, 1, 1,
-1.919222, 0.7316508, -1.943243, 1, 1, 1, 1, 1,
-1.860731, -2.773224, -0.38598, 0, 0, 1, 1, 1,
-1.850953, -0.9821619, -2.919271, 1, 0, 0, 1, 1,
-1.846227, 1.110279, -2.212355, 1, 0, 0, 1, 1,
-1.829141, -0.2833812, -0.8193308, 1, 0, 0, 1, 1,
-1.817427, 1.004958, -2.244738, 1, 0, 0, 1, 1,
-1.81471, -0.165138, 0.3272288, 1, 0, 0, 1, 1,
-1.782247, -0.03605382, -1.998999, 0, 0, 0, 1, 1,
-1.778647, 0.3095717, -1.006302, 0, 0, 0, 1, 1,
-1.757707, 0.4160803, -0.8082203, 0, 0, 0, 1, 1,
-1.752791, 0.1005013, -2.067671, 0, 0, 0, 1, 1,
-1.729132, -1.062971, -0.5492257, 0, 0, 0, 1, 1,
-1.724367, 1.059977, -1.672017, 0, 0, 0, 1, 1,
-1.717218, 1.003765, -0.1281275, 0, 0, 0, 1, 1,
-1.708548, -0.9483277, -0.966524, 1, 1, 1, 1, 1,
-1.707386, -0.2151839, -1.2165, 1, 1, 1, 1, 1,
-1.704816, 1.619482, -0.970462, 1, 1, 1, 1, 1,
-1.692391, 0.04141024, -1.322615, 1, 1, 1, 1, 1,
-1.67743, -1.214095, -1.908152, 1, 1, 1, 1, 1,
-1.656053, 0.2928325, -1.694059, 1, 1, 1, 1, 1,
-1.654827, 0.005773679, -0.01149002, 1, 1, 1, 1, 1,
-1.652118, -0.9993927, -2.610528, 1, 1, 1, 1, 1,
-1.623442, -0.5089061, -1.779273, 1, 1, 1, 1, 1,
-1.62061, -1.442028, -2.653041, 1, 1, 1, 1, 1,
-1.600214, 0.8925386, -0.6825049, 1, 1, 1, 1, 1,
-1.596046, -0.5900491, -1.980322, 1, 1, 1, 1, 1,
-1.576768, 0.2356491, -2.134043, 1, 1, 1, 1, 1,
-1.555255, -0.4229087, -0.08417635, 1, 1, 1, 1, 1,
-1.532691, 0.1262012, -2.917635, 1, 1, 1, 1, 1,
-1.524668, -0.7214423, -2.145492, 0, 0, 1, 1, 1,
-1.523298, 0.1495288, -0.8643328, 1, 0, 0, 1, 1,
-1.517977, -1.067858, -2.811851, 1, 0, 0, 1, 1,
-1.515766, -0.6203862, -3.044016, 1, 0, 0, 1, 1,
-1.507277, -1.402463, -2.757345, 1, 0, 0, 1, 1,
-1.502662, -0.9428361, -3.278741, 1, 0, 0, 1, 1,
-1.499888, 2.006832, 0.4801384, 0, 0, 0, 1, 1,
-1.497698, -0.2199895, -1.154679, 0, 0, 0, 1, 1,
-1.473155, -0.8984425, -2.787544, 0, 0, 0, 1, 1,
-1.466745, 0.5593294, -1.374073, 0, 0, 0, 1, 1,
-1.462446, 1.241967, -0.6721739, 0, 0, 0, 1, 1,
-1.46012, -0.2108374, -1.347948, 0, 0, 0, 1, 1,
-1.447683, 0.3703304, -1.057273, 0, 0, 0, 1, 1,
-1.446501, -0.2933409, -1.261012, 1, 1, 1, 1, 1,
-1.432124, 0.8840728, 0.1199277, 1, 1, 1, 1, 1,
-1.427697, 0.7138462, -2.20271, 1, 1, 1, 1, 1,
-1.426511, -0.5474654, -3.808314, 1, 1, 1, 1, 1,
-1.414159, -0.007275552, -0.8206279, 1, 1, 1, 1, 1,
-1.404842, -1.231691, -2.594206, 1, 1, 1, 1, 1,
-1.402252, 0.432555, -2.522059, 1, 1, 1, 1, 1,
-1.402034, -0.7266971, -1.373321, 1, 1, 1, 1, 1,
-1.398492, -0.5280495, -2.399695, 1, 1, 1, 1, 1,
-1.351699, 0.4263911, -1.619457, 1, 1, 1, 1, 1,
-1.350236, 0.6677381, -1.620099, 1, 1, 1, 1, 1,
-1.346085, 0.08492645, -1.994021, 1, 1, 1, 1, 1,
-1.341485, 1.785821, -1.554598, 1, 1, 1, 1, 1,
-1.338658, -0.6533977, -1.045161, 1, 1, 1, 1, 1,
-1.33445, 0.736007, -2.471645, 1, 1, 1, 1, 1,
-1.333875, 0.213148, -3.139114, 0, 0, 1, 1, 1,
-1.329137, 0.2271705, -0.3773616, 1, 0, 0, 1, 1,
-1.328176, 0.8988211, 0.08905578, 1, 0, 0, 1, 1,
-1.316911, 0.2648526, -0.5465991, 1, 0, 0, 1, 1,
-1.315459, -0.2160183, 0.0353853, 1, 0, 0, 1, 1,
-1.307207, 0.2243437, -0.7414978, 1, 0, 0, 1, 1,
-1.304214, -0.894721, -1.254205, 0, 0, 0, 1, 1,
-1.282163, 1.512903, -0.03804026, 0, 0, 0, 1, 1,
-1.266679, -0.1227847, -1.599277, 0, 0, 0, 1, 1,
-1.265052, -0.1151381, -2.209892, 0, 0, 0, 1, 1,
-1.263554, 0.9271742, -1.5978, 0, 0, 0, 1, 1,
-1.261972, 0.5356518, -0.8828213, 0, 0, 0, 1, 1,
-1.256665, 0.3470081, -0.7063197, 0, 0, 0, 1, 1,
-1.256116, 0.3899864, -0.6959679, 1, 1, 1, 1, 1,
-1.252623, -0.3247615, -1.268278, 1, 1, 1, 1, 1,
-1.241393, -1.217365, -3.108516, 1, 1, 1, 1, 1,
-1.238897, 1.743651, -1.017395, 1, 1, 1, 1, 1,
-1.228026, -1.400597, -2.705642, 1, 1, 1, 1, 1,
-1.219372, 0.07430119, -2.374383, 1, 1, 1, 1, 1,
-1.21894, -0.7276258, -3.995437, 1, 1, 1, 1, 1,
-1.218282, -0.36918, -3.154431, 1, 1, 1, 1, 1,
-1.216072, -0.6803723, -2.312226, 1, 1, 1, 1, 1,
-1.215331, -2.307739, -3.000283, 1, 1, 1, 1, 1,
-1.214326, -0.006436615, -0.5480756, 1, 1, 1, 1, 1,
-1.20826, 0.9577053, -1.131548, 1, 1, 1, 1, 1,
-1.204113, 1.084199, -2.403694, 1, 1, 1, 1, 1,
-1.202125, -0.9964819, -3.46304, 1, 1, 1, 1, 1,
-1.20154, 1.03825, 0.6963139, 1, 1, 1, 1, 1,
-1.199788, -1.799719, -4.055819, 0, 0, 1, 1, 1,
-1.199251, -0.1956793, -1.391421, 1, 0, 0, 1, 1,
-1.191068, 1.497332, -0.3227708, 1, 0, 0, 1, 1,
-1.189335, -0.1266198, -2.297569, 1, 0, 0, 1, 1,
-1.188455, 0.908709, -1.290472, 1, 0, 0, 1, 1,
-1.172429, -1.620781, -2.111784, 1, 0, 0, 1, 1,
-1.17162, -1.266879, -1.272145, 0, 0, 0, 1, 1,
-1.171046, -0.1303153, -2.666719, 0, 0, 0, 1, 1,
-1.168783, 2.888968, -0.2325901, 0, 0, 0, 1, 1,
-1.165341, -1.816451, -2.370733, 0, 0, 0, 1, 1,
-1.156297, 0.1159341, -0.01576024, 0, 0, 0, 1, 1,
-1.153623, -0.8057395, -2.336683, 0, 0, 0, 1, 1,
-1.151799, -0.3972214, -2.769926, 0, 0, 0, 1, 1,
-1.1461, 0.519932, -3.481586, 1, 1, 1, 1, 1,
-1.143815, 0.3927144, 1.065535, 1, 1, 1, 1, 1,
-1.143071, -0.4391695, -1.216624, 1, 1, 1, 1, 1,
-1.141505, 1.180323, -0.6271627, 1, 1, 1, 1, 1,
-1.098106, -0.3425423, -1.242861, 1, 1, 1, 1, 1,
-1.096325, 0.5553198, 0.3710224, 1, 1, 1, 1, 1,
-1.091833, 0.9236181, -1.844137, 1, 1, 1, 1, 1,
-1.086164, 1.993573, -1.637138, 1, 1, 1, 1, 1,
-1.081807, 0.1209586, -2.61641, 1, 1, 1, 1, 1,
-1.079018, -0.5608015, -3.559756, 1, 1, 1, 1, 1,
-1.074186, 1.360014, -0.09267841, 1, 1, 1, 1, 1,
-1.067694, -0.02520247, -3.103796, 1, 1, 1, 1, 1,
-1.059997, -0.1247441, -1.851959, 1, 1, 1, 1, 1,
-1.0591, -0.1760302, -2.593395, 1, 1, 1, 1, 1,
-1.054172, 0.39248, -0.3050838, 1, 1, 1, 1, 1,
-1.050168, 0.4849381, -1.604329, 0, 0, 1, 1, 1,
-1.047307, -0.2712444, -0.1926554, 1, 0, 0, 1, 1,
-1.044684, -0.1177162, -1.216994, 1, 0, 0, 1, 1,
-1.044376, 2.217651, -0.6095044, 1, 0, 0, 1, 1,
-1.037844, -0.2368925, -3.216673, 1, 0, 0, 1, 1,
-1.037519, 0.1503679, -0.2173171, 1, 0, 0, 1, 1,
-1.029829, 0.6207614, -1.070704, 0, 0, 0, 1, 1,
-1.025135, 0.6012914, -1.706273, 0, 0, 0, 1, 1,
-1.017369, 1.881005, -1.115402, 0, 0, 0, 1, 1,
-1.011576, -0.07142836, -1.025748, 0, 0, 0, 1, 1,
-1.001974, 0.2924046, -1.369714, 0, 0, 0, 1, 1,
-0.9997286, -1.715333, -4.015562, 0, 0, 0, 1, 1,
-0.9926978, 0.1259962, -1.872789, 0, 0, 0, 1, 1,
-0.9913554, 0.8149993, -0.8390267, 1, 1, 1, 1, 1,
-0.9865144, 1.082347, 0.1830895, 1, 1, 1, 1, 1,
-0.9805775, 0.4639978, -0.5693989, 1, 1, 1, 1, 1,
-0.9753489, -0.3726354, -2.053127, 1, 1, 1, 1, 1,
-0.9735768, -0.9777007, -2.307818, 1, 1, 1, 1, 1,
-0.9651214, 0.4995618, -1.334597, 1, 1, 1, 1, 1,
-0.9651011, 0.9639957, 0.6903596, 1, 1, 1, 1, 1,
-0.9627122, -0.3266878, -1.921076, 1, 1, 1, 1, 1,
-0.9605741, -0.3840835, -3.71462, 1, 1, 1, 1, 1,
-0.9602649, 0.298023, -0.8248422, 1, 1, 1, 1, 1,
-0.9570767, -0.8421413, -1.65637, 1, 1, 1, 1, 1,
-0.9538993, -0.6780391, -2.017693, 1, 1, 1, 1, 1,
-0.9534675, -0.01582536, -2.206679, 1, 1, 1, 1, 1,
-0.9529115, 1.459798, -0.5460346, 1, 1, 1, 1, 1,
-0.9488636, -0.693671, -3.635063, 1, 1, 1, 1, 1,
-0.943696, -0.25067, -0.6522882, 0, 0, 1, 1, 1,
-0.9418744, 0.6026171, -2.457781, 1, 0, 0, 1, 1,
-0.9404784, -0.9266441, -0.361386, 1, 0, 0, 1, 1,
-0.9376969, 0.9472818, -0.03116676, 1, 0, 0, 1, 1,
-0.9282586, 2.230618, 1.025836, 1, 0, 0, 1, 1,
-0.9248051, -0.1044251, -1.664629, 1, 0, 0, 1, 1,
-0.9243487, 1.421886, -1.434478, 0, 0, 0, 1, 1,
-0.9242283, 1.052231, -2.283208, 0, 0, 0, 1, 1,
-0.9125963, -1.282975, -2.686453, 0, 0, 0, 1, 1,
-0.9085035, 0.9207843, -1.511968, 0, 0, 0, 1, 1,
-0.9059013, 0.4334795, -0.7469255, 0, 0, 0, 1, 1,
-0.8961618, 0.4994125, -1.420967, 0, 0, 0, 1, 1,
-0.893362, 0.3828223, -2.501032, 0, 0, 0, 1, 1,
-0.8823915, -0.7121438, -1.410271, 1, 1, 1, 1, 1,
-0.8821122, -0.6888663, -2.176692, 1, 1, 1, 1, 1,
-0.8694264, 0.3537008, 0.103057, 1, 1, 1, 1, 1,
-0.8691121, -1.789903, -2.864322, 1, 1, 1, 1, 1,
-0.8600056, 1.072931, -2.113031, 1, 1, 1, 1, 1,
-0.8573724, -0.6140447, -3.93403, 1, 1, 1, 1, 1,
-0.8558076, -0.3406183, -1.536298, 1, 1, 1, 1, 1,
-0.8554286, 0.2883523, -0.7337004, 1, 1, 1, 1, 1,
-0.8516759, -0.8843163, -2.670706, 1, 1, 1, 1, 1,
-0.8482418, -0.7203999, -1.91954, 1, 1, 1, 1, 1,
-0.847674, -1.770749, -5.429608, 1, 1, 1, 1, 1,
-0.8442507, -0.6148911, -1.479278, 1, 1, 1, 1, 1,
-0.8425702, -0.2989705, -1.073409, 1, 1, 1, 1, 1,
-0.8422163, 2.319137, 1.025501, 1, 1, 1, 1, 1,
-0.8408731, -0.2162274, -2.771499, 1, 1, 1, 1, 1,
-0.8356858, 1.467222, 0.6295956, 0, 0, 1, 1, 1,
-0.8320374, -0.9126223, -3.526263, 1, 0, 0, 1, 1,
-0.8284042, 0.8539982, -1.894243, 1, 0, 0, 1, 1,
-0.8240779, -0.3222526, -1.904771, 1, 0, 0, 1, 1,
-0.8211911, 0.9295902, 0.2172679, 1, 0, 0, 1, 1,
-0.8170761, 1.13833, -2.195554, 1, 0, 0, 1, 1,
-0.8095791, -1.151891, -0.8844528, 0, 0, 0, 1, 1,
-0.8084531, 0.773343, -0.07184676, 0, 0, 0, 1, 1,
-0.8054492, -2.627339, -2.814449, 0, 0, 0, 1, 1,
-0.8037979, -0.3901604, -2.436137, 0, 0, 0, 1, 1,
-0.7983642, -0.8947557, -2.349076, 0, 0, 0, 1, 1,
-0.7958302, 1.432004, -0.8115306, 0, 0, 0, 1, 1,
-0.7904395, 0.6678786, 0.5733368, 0, 0, 0, 1, 1,
-0.7862856, -1.799316, -3.211193, 1, 1, 1, 1, 1,
-0.7791719, -0.3473944, -1.387708, 1, 1, 1, 1, 1,
-0.77482, 1.903631, 0.1918765, 1, 1, 1, 1, 1,
-0.7714034, -0.9869666, -2.118081, 1, 1, 1, 1, 1,
-0.769156, 0.4337815, -1.349631, 1, 1, 1, 1, 1,
-0.7640578, 0.6157264, -1.362763, 1, 1, 1, 1, 1,
-0.7618522, 0.4096518, -0.7926668, 1, 1, 1, 1, 1,
-0.7613832, -0.653994, -3.74986, 1, 1, 1, 1, 1,
-0.7573494, 0.410306, 0.03060734, 1, 1, 1, 1, 1,
-0.7553716, 0.09497327, -0.3131306, 1, 1, 1, 1, 1,
-0.7549807, -1.006549, -2.719702, 1, 1, 1, 1, 1,
-0.7546619, -0.6980718, -2.399354, 1, 1, 1, 1, 1,
-0.7507185, 0.1846498, -0.4594058, 1, 1, 1, 1, 1,
-0.7485937, -0.05835306, -1.95524, 1, 1, 1, 1, 1,
-0.7484067, -0.2408417, -1.011453, 1, 1, 1, 1, 1,
-0.7397448, 2.2354, -0.4306709, 0, 0, 1, 1, 1,
-0.7392603, 0.3875295, -0.3805229, 1, 0, 0, 1, 1,
-0.7368562, 0.6990117, -3.144027, 1, 0, 0, 1, 1,
-0.7329685, -0.1475598, -2.457268, 1, 0, 0, 1, 1,
-0.7311962, -2.877315, -3.662094, 1, 0, 0, 1, 1,
-0.7297997, -0.6079228, -3.271918, 1, 0, 0, 1, 1,
-0.7283107, 0.1176254, -1.343794, 0, 0, 0, 1, 1,
-0.7249186, -0.354808, -2.980135, 0, 0, 0, 1, 1,
-0.7231107, -0.2220677, -0.9033008, 0, 0, 0, 1, 1,
-0.7230905, 0.7050611, -1.161524, 0, 0, 0, 1, 1,
-0.7205033, -0.5809329, -1.042647, 0, 0, 0, 1, 1,
-0.7202048, 0.406917, -0.9103132, 0, 0, 0, 1, 1,
-0.714639, -1.782697, -2.925666, 0, 0, 0, 1, 1,
-0.7142892, 0.419746, -1.512984, 1, 1, 1, 1, 1,
-0.7045996, 1.006645, -1.612597, 1, 1, 1, 1, 1,
-0.7027388, -0.4091449, -2.334605, 1, 1, 1, 1, 1,
-0.6997738, -0.07436495, -1.804379, 1, 1, 1, 1, 1,
-0.6922749, -0.9733092, -2.164532, 1, 1, 1, 1, 1,
-0.6818535, 0.05795499, -2.368021, 1, 1, 1, 1, 1,
-0.6807429, -0.1331893, -1.907583, 1, 1, 1, 1, 1,
-0.6800056, 0.7148187, -1.076817, 1, 1, 1, 1, 1,
-0.6785768, 0.3249971, -0.05304004, 1, 1, 1, 1, 1,
-0.6784446, 0.2113299, -2.127203, 1, 1, 1, 1, 1,
-0.6773166, -0.9527929, -1.727498, 1, 1, 1, 1, 1,
-0.6771211, -0.2690933, -1.845702, 1, 1, 1, 1, 1,
-0.6769223, -0.3906172, -1.331536, 1, 1, 1, 1, 1,
-0.6749213, -0.2423356, -1.692054, 1, 1, 1, 1, 1,
-0.673781, -0.9071007, -2.323237, 1, 1, 1, 1, 1,
-0.6737705, -0.3746922, -1.328812, 0, 0, 1, 1, 1,
-0.6713647, -0.4776703, -1.891235, 1, 0, 0, 1, 1,
-0.6703944, 1.212427, -1.236526, 1, 0, 0, 1, 1,
-0.6672496, 1.632797, -1.220757, 1, 0, 0, 1, 1,
-0.6661456, 0.9857336, -0.8433677, 1, 0, 0, 1, 1,
-0.6614786, 1.037452, -0.8974681, 1, 0, 0, 1, 1,
-0.6603501, 0.9287186, -1.734002, 0, 0, 0, 1, 1,
-0.6587591, -0.5155154, -1.063374, 0, 0, 0, 1, 1,
-0.6576841, -0.7955978, -2.026977, 0, 0, 0, 1, 1,
-0.6556743, -1.628241, -0.9584672, 0, 0, 0, 1, 1,
-0.6546341, 0.08566066, -2.043578, 0, 0, 0, 1, 1,
-0.6427206, 0.7837067, -0.3128437, 0, 0, 0, 1, 1,
-0.6426919, -1.092142, -4.325417, 0, 0, 0, 1, 1,
-0.6333268, -0.1783075, -0.8363414, 1, 1, 1, 1, 1,
-0.6268175, -1.144048, -2.623171, 1, 1, 1, 1, 1,
-0.6230699, 0.7203262, -1.883004, 1, 1, 1, 1, 1,
-0.6217093, -0.09770288, -1.406103, 1, 1, 1, 1, 1,
-0.6189109, -0.2732265, -2.871163, 1, 1, 1, 1, 1,
-0.613578, -1.359528, -1.906513, 1, 1, 1, 1, 1,
-0.6127008, 1.180753, -1.751525, 1, 1, 1, 1, 1,
-0.6103735, -0.4416205, -3.285331, 1, 1, 1, 1, 1,
-0.60901, -0.3286918, -2.496343, 1, 1, 1, 1, 1,
-0.6079058, 0.7466096, -0.9214065, 1, 1, 1, 1, 1,
-0.6063614, -1.366417, -1.568975, 1, 1, 1, 1, 1,
-0.6053649, 0.1862988, -2.89133, 1, 1, 1, 1, 1,
-0.6044843, 0.7443666, 1.390365, 1, 1, 1, 1, 1,
-0.6043232, 0.1359157, 0.2108909, 1, 1, 1, 1, 1,
-0.5994221, -1.334659, -1.234294, 1, 1, 1, 1, 1,
-0.5970178, -0.6510112, -2.401663, 0, 0, 1, 1, 1,
-0.5961455, 0.2351152, 0.2654946, 1, 0, 0, 1, 1,
-0.5957264, -0.4627053, -1.224766, 1, 0, 0, 1, 1,
-0.5954909, 0.5978753, -0.199083, 1, 0, 0, 1, 1,
-0.591659, 0.6158988, -1.073042, 1, 0, 0, 1, 1,
-0.5822206, -0.494997, -1.927842, 1, 0, 0, 1, 1,
-0.5811793, 1.115019, -0.4643325, 0, 0, 0, 1, 1,
-0.5751351, 1.273424, -0.7399491, 0, 0, 0, 1, 1,
-0.5726279, -0.4051776, -0.922969, 0, 0, 0, 1, 1,
-0.5707094, -0.03877864, -0.1969479, 0, 0, 0, 1, 1,
-0.5582204, 0.3469084, -0.7038564, 0, 0, 0, 1, 1,
-0.5544419, -1.612655, -2.922907, 0, 0, 0, 1, 1,
-0.5526582, -1.131917, -1.494614, 0, 0, 0, 1, 1,
-0.5504758, -0.105975, -1.031178, 1, 1, 1, 1, 1,
-0.5481251, -0.5452515, -1.894866, 1, 1, 1, 1, 1,
-0.5461354, -1.51603, -2.789207, 1, 1, 1, 1, 1,
-0.5377337, 0.5582104, -0.7441021, 1, 1, 1, 1, 1,
-0.5365313, 0.100237, -0.2208076, 1, 1, 1, 1, 1,
-0.5280336, -0.5484737, -1.191571, 1, 1, 1, 1, 1,
-0.5230663, -1.125194, -2.506172, 1, 1, 1, 1, 1,
-0.5210025, -0.7441512, -1.692123, 1, 1, 1, 1, 1,
-0.5172165, 0.609591, -0.5854713, 1, 1, 1, 1, 1,
-0.5170279, -0.5092229, -2.420893, 1, 1, 1, 1, 1,
-0.5136345, 1.282317, 0.05004646, 1, 1, 1, 1, 1,
-0.5107489, 0.001027907, -3.02008, 1, 1, 1, 1, 1,
-0.5029038, -1.690166, -2.27142, 1, 1, 1, 1, 1,
-0.5013233, 0.2219718, -0.1193335, 1, 1, 1, 1, 1,
-0.4987163, 0.5376731, 0.1756562, 1, 1, 1, 1, 1,
-0.4986396, 0.1449241, -0.8333625, 0, 0, 1, 1, 1,
-0.4983342, -1.177093, -2.302935, 1, 0, 0, 1, 1,
-0.4941994, 0.2772264, -0.92842, 1, 0, 0, 1, 1,
-0.4870075, 0.4902476, -2.512386, 1, 0, 0, 1, 1,
-0.4833135, -0.8024089, -3.897135, 1, 0, 0, 1, 1,
-0.4766117, -2.234581, -2.400558, 1, 0, 0, 1, 1,
-0.4739456, -0.8695817, -4.208889, 0, 0, 0, 1, 1,
-0.4728606, 0.05142249, -1.35633, 0, 0, 0, 1, 1,
-0.4714822, -1.119682, -2.57354, 0, 0, 0, 1, 1,
-0.4687514, 0.08545776, -1.688024, 0, 0, 0, 1, 1,
-0.4657452, 0.2146911, -0.7424887, 0, 0, 0, 1, 1,
-0.4657365, -0.800796, -1.243194, 0, 0, 0, 1, 1,
-0.4638147, 1.148302, 1.427508, 0, 0, 0, 1, 1,
-0.4581764, -0.3149098, -4.168032, 1, 1, 1, 1, 1,
-0.4550263, -0.2229632, -2.11855, 1, 1, 1, 1, 1,
-0.4528558, 2.193269, -0.7365179, 1, 1, 1, 1, 1,
-0.4502305, -0.1947121, -3.014617, 1, 1, 1, 1, 1,
-0.4498475, 0.08110518, -1.565242, 1, 1, 1, 1, 1,
-0.4359608, 0.6820815, -1.306677, 1, 1, 1, 1, 1,
-0.4355768, 0.6604193, 1.203789, 1, 1, 1, 1, 1,
-0.4347058, -0.6109778, -1.962905, 1, 1, 1, 1, 1,
-0.4326655, 0.2912264, -0.597418, 1, 1, 1, 1, 1,
-0.4251463, -1.071833, -2.509362, 1, 1, 1, 1, 1,
-0.4247004, 0.435404, -0.1647542, 1, 1, 1, 1, 1,
-0.4199823, 2.008467, 0.5451434, 1, 1, 1, 1, 1,
-0.4176666, 1.444472, 0.7872936, 1, 1, 1, 1, 1,
-0.4054499, -0.9595619, -2.884671, 1, 1, 1, 1, 1,
-0.3968196, -0.6715657, -2.101619, 1, 1, 1, 1, 1,
-0.3924274, 0.07865996, -1.45571, 0, 0, 1, 1, 1,
-0.3895454, -1.001339, -2.267877, 1, 0, 0, 1, 1,
-0.3873958, -0.424747, -1.250653, 1, 0, 0, 1, 1,
-0.3862348, -1.212969, -2.686905, 1, 0, 0, 1, 1,
-0.3858603, 0.6604089, -1.375706, 1, 0, 0, 1, 1,
-0.3809898, 0.6231093, -2.789686, 1, 0, 0, 1, 1,
-0.3801948, 0.2109135, -1.145075, 0, 0, 0, 1, 1,
-0.3777044, -0.2546958, -2.442561, 0, 0, 0, 1, 1,
-0.3760598, 0.185021, -1.144713, 0, 0, 0, 1, 1,
-0.371923, 0.4347373, -1.074237, 0, 0, 0, 1, 1,
-0.3709272, 0.002832121, -1.933568, 0, 0, 0, 1, 1,
-0.3661027, -1.21925, -3.58475, 0, 0, 0, 1, 1,
-0.3644439, -2.193986, -3.566622, 0, 0, 0, 1, 1,
-0.3620092, 0.07359594, -1.013098, 1, 1, 1, 1, 1,
-0.3594589, -0.7349145, -2.344187, 1, 1, 1, 1, 1,
-0.3577406, -0.1064024, -2.398198, 1, 1, 1, 1, 1,
-0.3565861, 0.6704208, -0.1332319, 1, 1, 1, 1, 1,
-0.3558791, 0.1512627, -0.2881952, 1, 1, 1, 1, 1,
-0.3548582, -1.27566, -2.600698, 1, 1, 1, 1, 1,
-0.352092, 1.469465, -2.488343, 1, 1, 1, 1, 1,
-0.3512493, -0.7737897, -2.80055, 1, 1, 1, 1, 1,
-0.3459145, 0.8111112, -1.635964, 1, 1, 1, 1, 1,
-0.3451861, 1.883658, 0.7707363, 1, 1, 1, 1, 1,
-0.3348183, -1.270916, -3.873208, 1, 1, 1, 1, 1,
-0.3314642, -0.8073817, -1.762182, 1, 1, 1, 1, 1,
-0.330633, 0.5547207, -0.3943255, 1, 1, 1, 1, 1,
-0.3295292, 0.7878609, -1.464531, 1, 1, 1, 1, 1,
-0.3264152, -0.08349811, -1.688162, 1, 1, 1, 1, 1,
-0.3238606, 1.973335, 1.5731, 0, 0, 1, 1, 1,
-0.3233881, -0.3347777, -2.933525, 1, 0, 0, 1, 1,
-0.322858, 2.471579, -1.482038, 1, 0, 0, 1, 1,
-0.3171943, -0.06548487, -1.279102, 1, 0, 0, 1, 1,
-0.3135531, 0.688435, -2.087945, 1, 0, 0, 1, 1,
-0.312655, 0.7238719, 0.3120621, 1, 0, 0, 1, 1,
-0.3109024, 1.915123, 1.660445, 0, 0, 0, 1, 1,
-0.310027, 0.6079677, -1.836248, 0, 0, 0, 1, 1,
-0.3057353, 0.6166286, 0.3124861, 0, 0, 0, 1, 1,
-0.2950859, -0.05408572, -2.341597, 0, 0, 0, 1, 1,
-0.2932088, -0.1698708, -1.657721, 0, 0, 0, 1, 1,
-0.2907919, 1.884198, -1.24081, 0, 0, 0, 1, 1,
-0.2905714, -0.870923, -2.228736, 0, 0, 0, 1, 1,
-0.2887576, 1.083712, -1.178703, 1, 1, 1, 1, 1,
-0.2856848, -0.2790149, -1.974727, 1, 1, 1, 1, 1,
-0.2844421, -0.6917355, -3.415247, 1, 1, 1, 1, 1,
-0.2820372, -1.548502, -3.011677, 1, 1, 1, 1, 1,
-0.2815219, 0.1272661, -2.358488, 1, 1, 1, 1, 1,
-0.2806496, -0.09088791, -0.5653083, 1, 1, 1, 1, 1,
-0.2797105, -1.06329, -4.126954, 1, 1, 1, 1, 1,
-0.2783811, 0.889025, -0.1026182, 1, 1, 1, 1, 1,
-0.2768647, -0.6804977, -4.02516, 1, 1, 1, 1, 1,
-0.2745424, -1.633371, -4.184526, 1, 1, 1, 1, 1,
-0.2738308, 2.22665, 1.853642, 1, 1, 1, 1, 1,
-0.2634353, -1.516232, -2.637462, 1, 1, 1, 1, 1,
-0.260818, 0.7585478, -1.501641, 1, 1, 1, 1, 1,
-0.2602436, -1.24559, -3.536383, 1, 1, 1, 1, 1,
-0.2543753, 0.964676, -0.1867572, 1, 1, 1, 1, 1,
-0.2518802, -0.2771329, -0.2842096, 0, 0, 1, 1, 1,
-0.25029, -0.6192493, -2.70357, 1, 0, 0, 1, 1,
-0.2495946, 1.320822, 0.2193876, 1, 0, 0, 1, 1,
-0.2462968, -1.274584, -4.367843, 1, 0, 0, 1, 1,
-0.2453336, 0.3869252, -0.966152, 1, 0, 0, 1, 1,
-0.229601, -1.60875, -3.865167, 1, 0, 0, 1, 1,
-0.2260407, -0.8679174, -1.685151, 0, 0, 0, 1, 1,
-0.2232638, -0.1343184, -2.959522, 0, 0, 0, 1, 1,
-0.2218888, -0.648858, -4.077563, 0, 0, 0, 1, 1,
-0.2210095, -0.8831514, -5.402644, 0, 0, 0, 1, 1,
-0.2189139, 1.791372, -0.2335453, 0, 0, 0, 1, 1,
-0.2154953, 2.099948, -0.5132216, 0, 0, 0, 1, 1,
-0.2149181, 0.6099758, 0.7261147, 0, 0, 0, 1, 1,
-0.2131454, 1.467686, 0.135272, 1, 1, 1, 1, 1,
-0.2106036, -0.2594979, -1.579639, 1, 1, 1, 1, 1,
-0.2088856, -0.4702906, -3.428494, 1, 1, 1, 1, 1,
-0.2072366, 2.470089, -0.9792014, 1, 1, 1, 1, 1,
-0.1970133, 0.3189233, -3.449315, 1, 1, 1, 1, 1,
-0.1909483, -0.02633914, -1.693427, 1, 1, 1, 1, 1,
-0.1877358, -1.383992, -4.294417, 1, 1, 1, 1, 1,
-0.1851532, -0.0914159, -1.669687, 1, 1, 1, 1, 1,
-0.1791509, -0.7761655, -4.481521, 1, 1, 1, 1, 1,
-0.1774437, 0.4361179, -2.653248, 1, 1, 1, 1, 1,
-0.1769352, -0.4396026, -2.626781, 1, 1, 1, 1, 1,
-0.1768983, 0.7253882, -0.3324406, 1, 1, 1, 1, 1,
-0.175846, -0.9363817, -1.876419, 1, 1, 1, 1, 1,
-0.1735918, 0.8079141, 1.719564, 1, 1, 1, 1, 1,
-0.1723554, -0.2463914, -1.230519, 1, 1, 1, 1, 1,
-0.1673924, 1.148683, 0.8872052, 0, 0, 1, 1, 1,
-0.1665471, -0.001853986, -0.9619754, 1, 0, 0, 1, 1,
-0.1662447, -0.7371643, -4.362321, 1, 0, 0, 1, 1,
-0.1658416, -0.003558553, -2.78016, 1, 0, 0, 1, 1,
-0.1651092, -0.3804288, -1.795495, 1, 0, 0, 1, 1,
-0.1637292, 0.1858502, -0.1614939, 1, 0, 0, 1, 1,
-0.1635074, 1.748869, 0.2827075, 0, 0, 0, 1, 1,
-0.1604631, 1.587357, -0.2593141, 0, 0, 0, 1, 1,
-0.1593072, -0.6289139, -4.460442, 0, 0, 0, 1, 1,
-0.1559849, -0.6087736, -2.628962, 0, 0, 0, 1, 1,
-0.1542553, -0.6422752, -3.87539, 0, 0, 0, 1, 1,
-0.1539793, -0.3184386, -0.3530284, 0, 0, 0, 1, 1,
-0.1496815, 1.51276, -0.1005814, 0, 0, 0, 1, 1,
-0.1428534, -0.1331316, -2.999321, 1, 1, 1, 1, 1,
-0.1413692, 0.8386317, -0.1626882, 1, 1, 1, 1, 1,
-0.1413097, -0.3084212, -1.733994, 1, 1, 1, 1, 1,
-0.1398835, 1.903761, -0.5580056, 1, 1, 1, 1, 1,
-0.1392896, -0.3870496, -3.739306, 1, 1, 1, 1, 1,
-0.1388114, -2.186258, -3.25473, 1, 1, 1, 1, 1,
-0.1386612, -0.1042641, -2.800465, 1, 1, 1, 1, 1,
-0.1348101, 0.9409214, 1.80407, 1, 1, 1, 1, 1,
-0.1309626, -0.8572496, -2.909519, 1, 1, 1, 1, 1,
-0.1279934, 0.7602934, -2.192887, 1, 1, 1, 1, 1,
-0.1273993, -0.5311458, -1.585833, 1, 1, 1, 1, 1,
-0.1198163, -0.5388554, -2.78784, 1, 1, 1, 1, 1,
-0.1195935, -0.7833573, -2.800765, 1, 1, 1, 1, 1,
-0.1179596, -1.50615, -3.045823, 1, 1, 1, 1, 1,
-0.1153174, 1.94302, -0.6042345, 1, 1, 1, 1, 1,
-0.1073304, -0.03041651, -0.4379939, 0, 0, 1, 1, 1,
-0.1058628, -0.5020485, -4.575758, 1, 0, 0, 1, 1,
-0.09890953, -0.1794143, -1.594701, 1, 0, 0, 1, 1,
-0.09750633, 3.286491, -1.466332, 1, 0, 0, 1, 1,
-0.09548113, 1.725833, 0.3219363, 1, 0, 0, 1, 1,
-0.09327748, -0.3897632, -3.871922, 1, 0, 0, 1, 1,
-0.0907331, -0.5045682, -3.528674, 0, 0, 0, 1, 1,
-0.09005468, 1.087497, -0.6400781, 0, 0, 0, 1, 1,
-0.08960099, 0.3276452, -0.2085101, 0, 0, 0, 1, 1,
-0.08667888, -0.3448357, -3.850269, 0, 0, 0, 1, 1,
-0.08636831, -1.42236, -2.344933, 0, 0, 0, 1, 1,
-0.08602675, -0.1849629, -3.231001, 0, 0, 0, 1, 1,
-0.07873318, -0.3681625, -2.802856, 0, 0, 0, 1, 1,
-0.07851271, 0.9332319, 1.23463, 1, 1, 1, 1, 1,
-0.07370824, -2.010574, -1.905193, 1, 1, 1, 1, 1,
-0.07114949, -0.7360449, -1.423298, 1, 1, 1, 1, 1,
-0.06547971, 0.4368622, -0.1818579, 1, 1, 1, 1, 1,
-0.064129, 0.9829456, -1.700628, 1, 1, 1, 1, 1,
-0.0640389, 0.4513474, 2.305676, 1, 1, 1, 1, 1,
-0.06174423, 0.1975007, 0.3850476, 1, 1, 1, 1, 1,
-0.06133515, 1.675629, 1.922501, 1, 1, 1, 1, 1,
-0.05907727, 0.5524897, 0.4594849, 1, 1, 1, 1, 1,
-0.05727695, -0.5090532, -3.565769, 1, 1, 1, 1, 1,
-0.05723364, 0.1332822, 0.4307167, 1, 1, 1, 1, 1,
-0.05630306, -1.153103, -3.956495, 1, 1, 1, 1, 1,
-0.05584114, 0.1100198, -0.2172821, 1, 1, 1, 1, 1,
-0.05105698, 0.550196, -1.292477, 1, 1, 1, 1, 1,
-0.04895698, -0.7521427, -1.771264, 1, 1, 1, 1, 1,
-0.04849182, 0.2802826, 1.020867, 0, 0, 1, 1, 1,
-0.04614308, 1.227805, -0.2093995, 1, 0, 0, 1, 1,
-0.04026971, 0.2833946, -0.0843199, 1, 0, 0, 1, 1,
-0.03801495, -1.672334, -3.072517, 1, 0, 0, 1, 1,
-0.03767668, 0.4407151, -0.1775992, 1, 0, 0, 1, 1,
-0.03572024, 0.9427897, 0.4565352, 1, 0, 0, 1, 1,
-0.03500592, 1.185746, -0.1804975, 0, 0, 0, 1, 1,
-0.03201847, 0.2573958, 0.2889428, 0, 0, 0, 1, 1,
-0.03175662, 0.5267319, -1.078115, 0, 0, 0, 1, 1,
-0.02898431, -0.3963522, -3.26109, 0, 0, 0, 1, 1,
-0.02798697, -0.9039617, -1.992564, 0, 0, 0, 1, 1,
-0.02780133, 0.6556506, 0.8586524, 0, 0, 0, 1, 1,
-0.02705898, -0.2059684, -4.219657, 0, 0, 0, 1, 1,
-0.01907169, -0.4294839, -1.937469, 1, 1, 1, 1, 1,
-0.01642127, 0.5686659, 1.644869, 1, 1, 1, 1, 1,
-0.01555682, 1.227693, 0.4897603, 1, 1, 1, 1, 1,
-0.01284874, 2.802722, -2.840499, 1, 1, 1, 1, 1,
-0.00868804, 0.8444226, 0.9200076, 1, 1, 1, 1, 1,
-0.006853147, 0.9366946, 0.9767027, 1, 1, 1, 1, 1,
-0.005766068, -1.447812, -4.503427, 1, 1, 1, 1, 1,
-0.0001939522, 0.6274282, 1.385402, 1, 1, 1, 1, 1,
0.004282224, -0.4070355, 1.440065, 1, 1, 1, 1, 1,
0.007533322, -0.2080693, 4.232831, 1, 1, 1, 1, 1,
0.00814159, 1.478844, -1.10745, 1, 1, 1, 1, 1,
0.01610393, 1.5312, 0.07372059, 1, 1, 1, 1, 1,
0.02795487, 0.0139946, 2.444697, 1, 1, 1, 1, 1,
0.02817336, 0.3923283, 1.33713, 1, 1, 1, 1, 1,
0.03324733, 0.2683524, 0.3722513, 1, 1, 1, 1, 1,
0.03475024, -1.082902, 4.403436, 0, 0, 1, 1, 1,
0.03813407, -0.9476326, 3.117387, 1, 0, 0, 1, 1,
0.0388787, -0.1774335, 2.734657, 1, 0, 0, 1, 1,
0.03962712, -0.2766335, 4.612882, 1, 0, 0, 1, 1,
0.04835427, -1.194729, 2.166206, 1, 0, 0, 1, 1,
0.05017037, -0.394272, 1.263912, 1, 0, 0, 1, 1,
0.05181614, 0.007882386, -0.009564932, 0, 0, 0, 1, 1,
0.05255286, 0.8163602, 0.5110971, 0, 0, 0, 1, 1,
0.05290864, -2.160327, 2.400928, 0, 0, 0, 1, 1,
0.0543198, -1.613459, 1.869682, 0, 0, 0, 1, 1,
0.05703491, -0.6124395, 5.231874, 0, 0, 0, 1, 1,
0.05798259, 0.3699711, -0.3294125, 0, 0, 0, 1, 1,
0.06170833, -0.8648819, 3.682273, 0, 0, 0, 1, 1,
0.07142429, -0.1828986, 4.500571, 1, 1, 1, 1, 1,
0.07597515, -1.359121, 1.61257, 1, 1, 1, 1, 1,
0.07726232, -0.3318564, 1.383107, 1, 1, 1, 1, 1,
0.09065651, 0.6566451, -1.298759, 1, 1, 1, 1, 1,
0.09406155, -0.5231718, 2.926277, 1, 1, 1, 1, 1,
0.09416055, -0.0007328556, 1.592329, 1, 1, 1, 1, 1,
0.09507745, 0.0559526, 0.88392, 1, 1, 1, 1, 1,
0.09520668, 0.5899675, 0.7584022, 1, 1, 1, 1, 1,
0.09537427, -0.3941595, 2.352511, 1, 1, 1, 1, 1,
0.09663677, 0.2234298, 1.823756, 1, 1, 1, 1, 1,
0.09780868, 0.9798229, 1.251426, 1, 1, 1, 1, 1,
0.09874684, -0.00352588, 2.239364, 1, 1, 1, 1, 1,
0.1007348, -0.3455078, 3.393196, 1, 1, 1, 1, 1,
0.1009, -1.069525, 3.722192, 1, 1, 1, 1, 1,
0.1030382, -1.618843, 3.232062, 1, 1, 1, 1, 1,
0.1063242, 0.6796733, 0.0007745774, 0, 0, 1, 1, 1,
0.109446, 1.550033, 0.8233045, 1, 0, 0, 1, 1,
0.1116587, -1.532471, 3.956297, 1, 0, 0, 1, 1,
0.1125572, 0.9371794, 0.6999233, 1, 0, 0, 1, 1,
0.1139206, 0.3918529, 0.3428743, 1, 0, 0, 1, 1,
0.1164712, -0.1973077, 1.595078, 1, 0, 0, 1, 1,
0.1185792, -0.9682983, 3.911382, 0, 0, 0, 1, 1,
0.1188771, 0.9266957, -0.3001841, 0, 0, 0, 1, 1,
0.1220844, 0.5293699, 0.9231535, 0, 0, 0, 1, 1,
0.126557, 0.7310587, -0.3493249, 0, 0, 0, 1, 1,
0.1281618, -0.3731645, 2.771488, 0, 0, 0, 1, 1,
0.1356843, 0.9435633, -0.0304201, 0, 0, 0, 1, 1,
0.1392764, -0.4014597, 2.689004, 0, 0, 0, 1, 1,
0.1429967, -1.321912, 2.73, 1, 1, 1, 1, 1,
0.1454052, 0.3780878, 0.6146178, 1, 1, 1, 1, 1,
0.1489416, -0.57833, 1.493858, 1, 1, 1, 1, 1,
0.1493448, -0.5085028, 1.016841, 1, 1, 1, 1, 1,
0.1502817, 0.05387536, 2.418221, 1, 1, 1, 1, 1,
0.1520729, -0.6564651, 3.901061, 1, 1, 1, 1, 1,
0.1534262, -0.9910843, 2.821353, 1, 1, 1, 1, 1,
0.1586256, 0.2044933, 0.4978042, 1, 1, 1, 1, 1,
0.1588259, -0.7760073, 3.000084, 1, 1, 1, 1, 1,
0.1599409, 0.7732281, 2.135487, 1, 1, 1, 1, 1,
0.1626059, 0.2784119, 1.314971, 1, 1, 1, 1, 1,
0.1631162, 0.759131, 0.2832789, 1, 1, 1, 1, 1,
0.1649386, -0.06379709, 2.353408, 1, 1, 1, 1, 1,
0.1651487, 0.5130183, 0.8994203, 1, 1, 1, 1, 1,
0.165433, -0.6977379, 3.629765, 1, 1, 1, 1, 1,
0.1658774, -1.408369, 2.737539, 0, 0, 1, 1, 1,
0.1732606, 0.9761242, 0.7928411, 1, 0, 0, 1, 1,
0.1756215, 0.4383464, -1.652553, 1, 0, 0, 1, 1,
0.178043, 0.728938, -0.5134867, 1, 0, 0, 1, 1,
0.1800284, 0.4955814, -0.3143041, 1, 0, 0, 1, 1,
0.185987, -2.140197, 2.925838, 1, 0, 0, 1, 1,
0.186673, 0.5192569, 0.7259349, 0, 0, 0, 1, 1,
0.1885351, 1.534953, 0.11528, 0, 0, 0, 1, 1,
0.1904988, -1.530963, 1.233412, 0, 0, 0, 1, 1,
0.1905437, -0.4404114, 4.588737, 0, 0, 0, 1, 1,
0.1915779, 1.664606, -1.073973, 0, 0, 0, 1, 1,
0.1931037, 0.9064917, 0.9273374, 0, 0, 0, 1, 1,
0.1962816, 2.113976, 2.244375, 0, 0, 0, 1, 1,
0.1983875, -0.4062275, 2.365294, 1, 1, 1, 1, 1,
0.2024021, 0.4234155, -0.4092544, 1, 1, 1, 1, 1,
0.202784, 1.237582, 1.328417, 1, 1, 1, 1, 1,
0.2047441, -0.9528531, 2.159653, 1, 1, 1, 1, 1,
0.2121347, -0.827677, 2.30775, 1, 1, 1, 1, 1,
0.2121833, -0.24788, 1.987934, 1, 1, 1, 1, 1,
0.215734, 0.210815, 1.390221, 1, 1, 1, 1, 1,
0.2178605, -2.72923, 3.490597, 1, 1, 1, 1, 1,
0.2214663, -0.07415605, 2.087999, 1, 1, 1, 1, 1,
0.221878, -0.3693426, 1.545882, 1, 1, 1, 1, 1,
0.2227302, -0.3329674, 2.271353, 1, 1, 1, 1, 1,
0.2246465, 0.5251027, 1.42864, 1, 1, 1, 1, 1,
0.2254032, 0.4941553, -0.123475, 1, 1, 1, 1, 1,
0.226321, -1.296143, 2.184505, 1, 1, 1, 1, 1,
0.2277811, -0.05726874, 0.07598056, 1, 1, 1, 1, 1,
0.2303141, 0.3513573, 0.7634333, 0, 0, 1, 1, 1,
0.232521, 0.5820284, 1.156356, 1, 0, 0, 1, 1,
0.2338277, 0.3761912, 0.9572232, 1, 0, 0, 1, 1,
0.2343512, 1.17769, -1.349533, 1, 0, 0, 1, 1,
0.236189, 0.6323209, -2.025788, 1, 0, 0, 1, 1,
0.2422643, 1.887548, 0.4962922, 1, 0, 0, 1, 1,
0.2443389, 1.238008, -1.26903, 0, 0, 0, 1, 1,
0.2449701, -0.3205898, 3.800589, 0, 0, 0, 1, 1,
0.2460925, -1.803272, 4.29041, 0, 0, 0, 1, 1,
0.2469094, -0.5982447, 1.070271, 0, 0, 0, 1, 1,
0.2494356, -1.18214, 2.258361, 0, 0, 0, 1, 1,
0.2498498, -0.1167237, 1.51006, 0, 0, 0, 1, 1,
0.2532858, -0.2240096, 3.366507, 0, 0, 0, 1, 1,
0.2548499, 1.079133, -0.7530828, 1, 1, 1, 1, 1,
0.2554514, 0.2401946, 1.698804, 1, 1, 1, 1, 1,
0.2576957, -0.9381173, 1.817154, 1, 1, 1, 1, 1,
0.2580388, 0.7353362, -0.8419468, 1, 1, 1, 1, 1,
0.2588224, 0.703031, -0.08690388, 1, 1, 1, 1, 1,
0.2629253, -0.3178915, 1.133199, 1, 1, 1, 1, 1,
0.2635457, -0.5130973, 0.6592827, 1, 1, 1, 1, 1,
0.2648595, -1.473334, 2.808724, 1, 1, 1, 1, 1,
0.2729484, -2.109305, 1.954099, 1, 1, 1, 1, 1,
0.2731106, 0.66092, 0.6816165, 1, 1, 1, 1, 1,
0.27587, -0.122858, 2.118258, 1, 1, 1, 1, 1,
0.2777736, -0.9797719, 3.139627, 1, 1, 1, 1, 1,
0.2778558, 0.8252129, 1.111162, 1, 1, 1, 1, 1,
0.2894473, -0.02987806, 3.431544, 1, 1, 1, 1, 1,
0.2921646, 0.2676758, 0.9863971, 1, 1, 1, 1, 1,
0.2928926, -0.507044, 2.684485, 0, 0, 1, 1, 1,
0.2949429, 0.6982998, -0.9837499, 1, 0, 0, 1, 1,
0.2963208, 0.4193435, 2.32963, 1, 0, 0, 1, 1,
0.2964323, -0.2725771, 2.41647, 1, 0, 0, 1, 1,
0.2971582, -0.7680956, 2.650244, 1, 0, 0, 1, 1,
0.2983623, -1.321259, 2.955693, 1, 0, 0, 1, 1,
0.301756, -0.2566697, 4.374769, 0, 0, 0, 1, 1,
0.3058861, -0.4213908, 3.842649, 0, 0, 0, 1, 1,
0.3120596, -0.3896438, 1.980376, 0, 0, 0, 1, 1,
0.3140464, 0.08610231, 1.369927, 0, 0, 0, 1, 1,
0.3165711, -2.374563, 1.667101, 0, 0, 0, 1, 1,
0.3179799, 2.212565, 2.006839, 0, 0, 0, 1, 1,
0.3198, 0.7561247, 1.060417, 0, 0, 0, 1, 1,
0.321058, 0.4966095, 1.18697, 1, 1, 1, 1, 1,
0.3211154, -0.8788803, 3.511597, 1, 1, 1, 1, 1,
0.321815, -0.2792572, 2.290682, 1, 1, 1, 1, 1,
0.3262336, 2.535839, 0.4733293, 1, 1, 1, 1, 1,
0.3268437, -0.3197219, 2.92413, 1, 1, 1, 1, 1,
0.3314624, -1.45491, 2.38165, 1, 1, 1, 1, 1,
0.3405008, -0.3536531, 1.032458, 1, 1, 1, 1, 1,
0.3411599, 0.1089168, -0.12801, 1, 1, 1, 1, 1,
0.3497294, -0.5580771, 3.769562, 1, 1, 1, 1, 1,
0.3533284, 2.112807, 1.866415, 1, 1, 1, 1, 1,
0.355134, 0.4516256, -0.3777513, 1, 1, 1, 1, 1,
0.3595506, 0.04710836, 1.915772, 1, 1, 1, 1, 1,
0.3596377, -2.597953, 2.321206, 1, 1, 1, 1, 1,
0.3599474, -1.619729, 4.465462, 1, 1, 1, 1, 1,
0.3630247, 0.02225286, 2.491818, 1, 1, 1, 1, 1,
0.3636173, -1.320085, 3.445514, 0, 0, 1, 1, 1,
0.3644316, -0.1023815, 2.507087, 1, 0, 0, 1, 1,
0.3650371, 0.4816408, -0.4463631, 1, 0, 0, 1, 1,
0.3756394, 0.5669654, 1.141304, 1, 0, 0, 1, 1,
0.3771307, 0.9237617, -0.3551525, 1, 0, 0, 1, 1,
0.3781476, 0.1272356, 1.659254, 1, 0, 0, 1, 1,
0.37896, 0.2317097, -0.0822128, 0, 0, 0, 1, 1,
0.3795796, -0.3472089, 2.146917, 0, 0, 0, 1, 1,
0.3802367, 0.5935642, 0.6015321, 0, 0, 0, 1, 1,
0.3827395, -1.826095, 1.707696, 0, 0, 0, 1, 1,
0.3833497, -1.326509, 4.584209, 0, 0, 0, 1, 1,
0.3892586, 1.128951, -0.2360379, 0, 0, 0, 1, 1,
0.3902631, -0.3128834, 1.73134, 0, 0, 0, 1, 1,
0.3941728, 0.05381626, 3.659231, 1, 1, 1, 1, 1,
0.3958046, -0.06525934, 1.638936, 1, 1, 1, 1, 1,
0.3995418, -0.3113759, 3.214699, 1, 1, 1, 1, 1,
0.4027331, -0.925142, 2.996184, 1, 1, 1, 1, 1,
0.403834, 0.3340066, -0.1930254, 1, 1, 1, 1, 1,
0.4051456, 1.957076, 1.474923, 1, 1, 1, 1, 1,
0.407069, -0.6904702, 3.650408, 1, 1, 1, 1, 1,
0.4129917, 1.448372, -0.5484733, 1, 1, 1, 1, 1,
0.4132898, 1.324782, 1.516613, 1, 1, 1, 1, 1,
0.4142736, -0.2383269, 2.1587, 1, 1, 1, 1, 1,
0.4163317, -0.5403045, 3.754733, 1, 1, 1, 1, 1,
0.418041, -0.001987526, 1.920161, 1, 1, 1, 1, 1,
0.421814, 0.3069351, 1.039309, 1, 1, 1, 1, 1,
0.4274166, 0.4503511, -0.4810497, 1, 1, 1, 1, 1,
0.4290325, 0.7358173, 1.224325, 1, 1, 1, 1, 1,
0.4304914, 0.4602275, 1.991594, 0, 0, 1, 1, 1,
0.4346491, -2.748605, 4.829423, 1, 0, 0, 1, 1,
0.4361917, 0.0173422, 2.03077, 1, 0, 0, 1, 1,
0.4386438, 1.091794, 0.6821973, 1, 0, 0, 1, 1,
0.4404753, -2.033614, 2.674719, 1, 0, 0, 1, 1,
0.4446228, 0.1155714, 0.6584287, 1, 0, 0, 1, 1,
0.448108, -1.180463, 2.873055, 0, 0, 0, 1, 1,
0.4541028, -0.2064473, 0.288119, 0, 0, 0, 1, 1,
0.4541944, 1.19618, -0.2394446, 0, 0, 0, 1, 1,
0.4558318, 0.2069536, 0.8207338, 0, 0, 0, 1, 1,
0.4633316, -0.1935417, 3.178782, 0, 0, 0, 1, 1,
0.4674636, -1.380265, 2.632046, 0, 0, 0, 1, 1,
0.4699925, -1.228658, 3.159815, 0, 0, 0, 1, 1,
0.4708343, 0.7425854, -0.3282591, 1, 1, 1, 1, 1,
0.4709548, -1.012473, 4.046488, 1, 1, 1, 1, 1,
0.4729602, -1.142026, 3.118937, 1, 1, 1, 1, 1,
0.4742126, 0.518144, 0.2272402, 1, 1, 1, 1, 1,
0.477085, -0.210703, 3.952908, 1, 1, 1, 1, 1,
0.4807467, 0.5574499, 2.584924, 1, 1, 1, 1, 1,
0.4843184, 0.8657588, 0.3617643, 1, 1, 1, 1, 1,
0.4899434, -1.730253, 1.047805, 1, 1, 1, 1, 1,
0.4943497, -2.389373, 2.068106, 1, 1, 1, 1, 1,
0.4945955, 0.3203256, 0.7751096, 1, 1, 1, 1, 1,
0.4983832, -0.8323675, 2.034484, 1, 1, 1, 1, 1,
0.4984596, 1.75589, -1.165096, 1, 1, 1, 1, 1,
0.5069597, -1.01062, 3.729653, 1, 1, 1, 1, 1,
0.5100434, 0.9252003, 0.3758286, 1, 1, 1, 1, 1,
0.5116041, -0.03653657, 3.683945, 1, 1, 1, 1, 1,
0.5137672, -0.8597764, 3.14419, 0, 0, 1, 1, 1,
0.514475, 0.4153784, 2.353053, 1, 0, 0, 1, 1,
0.5165011, 1.613652, -1.530856, 1, 0, 0, 1, 1,
0.5209706, 1.064913, 0.4280007, 1, 0, 0, 1, 1,
0.5352299, 0.01428205, 1.294517, 1, 0, 0, 1, 1,
0.5377148, -0.1391787, 1.79817, 1, 0, 0, 1, 1,
0.5383962, 0.9173019, 0.2373205, 0, 0, 0, 1, 1,
0.5385026, 0.5099646, 1.094134, 0, 0, 0, 1, 1,
0.5393829, 0.7787564, 0.3052827, 0, 0, 0, 1, 1,
0.5404555, -0.277796, 3.322055, 0, 0, 0, 1, 1,
0.5435027, -0.4644613, 2.966549, 0, 0, 0, 1, 1,
0.5455167, -0.9497647, 1.831775, 0, 0, 0, 1, 1,
0.5460367, 1.399531, 0.1292197, 0, 0, 0, 1, 1,
0.5515159, 1.382915, 1.252466, 1, 1, 1, 1, 1,
0.5517204, -0.3352, 2.064784, 1, 1, 1, 1, 1,
0.5531793, 0.1116484, 0.4651801, 1, 1, 1, 1, 1,
0.5616635, 1.786357, 1.563247, 1, 1, 1, 1, 1,
0.5634691, -1.129799, 1.735016, 1, 1, 1, 1, 1,
0.5679379, -1.161414, 3.218449, 1, 1, 1, 1, 1,
0.577867, -1.078462, 1.242035, 1, 1, 1, 1, 1,
0.5892357, 0.2470909, 1.678544, 1, 1, 1, 1, 1,
0.5938357, 0.183321, 1.15564, 1, 1, 1, 1, 1,
0.6001291, 0.8302142, -0.1304161, 1, 1, 1, 1, 1,
0.6030532, -0.3992112, 2.298442, 1, 1, 1, 1, 1,
0.6069645, -1.391227, 1.128046, 1, 1, 1, 1, 1,
0.6129025, -1.180661, 0.6200143, 1, 1, 1, 1, 1,
0.6137967, 2.012269, 2.500909, 1, 1, 1, 1, 1,
0.6174608, -0.2208612, 0.803322, 1, 1, 1, 1, 1,
0.6216922, -0.4796183, 4.018607, 0, 0, 1, 1, 1,
0.6290038, 0.2410478, 1.637577, 1, 0, 0, 1, 1,
0.6304423, -1.61854, 4.513677, 1, 0, 0, 1, 1,
0.6335556, -0.72723, 1.566684, 1, 0, 0, 1, 1,
0.6421244, -0.3422257, 1.313307, 1, 0, 0, 1, 1,
0.6435702, -0.01695917, 0.7078551, 1, 0, 0, 1, 1,
0.6499609, 1.100069, -1.469552, 0, 0, 0, 1, 1,
0.6585867, 0.9667981, 0.4566139, 0, 0, 0, 1, 1,
0.6597808, -0.2491789, 0.2573138, 0, 0, 0, 1, 1,
0.6604275, -0.1617021, 2.529582, 0, 0, 0, 1, 1,
0.6708292, 0.2368142, 2.948463, 0, 0, 0, 1, 1,
0.6715115, -0.1138374, 1.172666, 0, 0, 0, 1, 1,
0.672288, 1.311347, 0.7877542, 0, 0, 0, 1, 1,
0.6722991, 0.8983579, 1.923434, 1, 1, 1, 1, 1,
0.675253, 0.595916, 1.544605, 1, 1, 1, 1, 1,
0.6760669, -0.2357519, 3.714449, 1, 1, 1, 1, 1,
0.6819339, -0.491404, 2.784815, 1, 1, 1, 1, 1,
0.6875476, 0.2441913, 1.925681, 1, 1, 1, 1, 1,
0.6922503, 0.5747439, -1.069795, 1, 1, 1, 1, 1,
0.6939062, -1.363963, 2.126014, 1, 1, 1, 1, 1,
0.7048253, 1.958865, -1.037258, 1, 1, 1, 1, 1,
0.7189524, -1.028072, 1.654993, 1, 1, 1, 1, 1,
0.7222592, 0.1355303, 0.8802696, 1, 1, 1, 1, 1,
0.7241451, 0.4365838, 1.403871, 1, 1, 1, 1, 1,
0.7247159, -1.737518, 3.01473, 1, 1, 1, 1, 1,
0.7248905, -0.8086064, 2.81045, 1, 1, 1, 1, 1,
0.7284982, 1.526474, 0.3994359, 1, 1, 1, 1, 1,
0.7319856, 0.3524063, 1.136291, 1, 1, 1, 1, 1,
0.7360789, 0.6802344, 0.411204, 0, 0, 1, 1, 1,
0.740381, 0.4143201, 0.3229293, 1, 0, 0, 1, 1,
0.7419525, -0.4869488, 0.01325218, 1, 0, 0, 1, 1,
0.7423248, -0.2960376, 1.074256, 1, 0, 0, 1, 1,
0.7439117, 1.498945, 0.705134, 1, 0, 0, 1, 1,
0.7444245, -0.9852633, 3.284547, 1, 0, 0, 1, 1,
0.7495122, -0.2052001, 3.239203, 0, 0, 0, 1, 1,
0.750145, -0.3405428, 2.684675, 0, 0, 0, 1, 1,
0.7501597, 0.5853321, 2.179949, 0, 0, 0, 1, 1,
0.7518581, -1.574334, 1.360064, 0, 0, 0, 1, 1,
0.7525297, -0.5557145, 2.176146, 0, 0, 0, 1, 1,
0.7531552, -1.379276, 4.009838, 0, 0, 0, 1, 1,
0.7599054, 0.6966942, 1.307829, 0, 0, 0, 1, 1,
0.7609648, 0.1335529, 2.289426, 1, 1, 1, 1, 1,
0.7622574, -2.469475, 2.435931, 1, 1, 1, 1, 1,
0.7665204, -0.8803806, 3.401255, 1, 1, 1, 1, 1,
0.7678734, 0.612541, 0.7286583, 1, 1, 1, 1, 1,
0.7701858, -0.2523703, 1.991189, 1, 1, 1, 1, 1,
0.7733295, -1.513252, 3.261429, 1, 1, 1, 1, 1,
0.7759861, -0.2902213, 2.306839, 1, 1, 1, 1, 1,
0.7785196, -1.441635, 4.81482, 1, 1, 1, 1, 1,
0.7816367, -0.6248608, 2.813673, 1, 1, 1, 1, 1,
0.7818238, -0.5978551, 0.3783597, 1, 1, 1, 1, 1,
0.7886254, -0.338014, 3.53089, 1, 1, 1, 1, 1,
0.7937384, -0.8009417, 2.825846, 1, 1, 1, 1, 1,
0.7944443, 0.4509241, -0.4633183, 1, 1, 1, 1, 1,
0.796055, 1.661911, 0.8919525, 1, 1, 1, 1, 1,
0.8010633, 0.6869343, 0.06988911, 1, 1, 1, 1, 1,
0.8123279, -0.9884077, 2.362697, 0, 0, 1, 1, 1,
0.8157754, -0.5367643, 2.489546, 1, 0, 0, 1, 1,
0.8177041, 1.056563, 0.2906205, 1, 0, 0, 1, 1,
0.8181629, -0.264988, 3.007014, 1, 0, 0, 1, 1,
0.8182419, 0.8209471, -0.3312218, 1, 0, 0, 1, 1,
0.8191435, 0.6387063, 0.9829321, 1, 0, 0, 1, 1,
0.8192737, 0.7010711, 0.1824954, 0, 0, 0, 1, 1,
0.8214081, 0.04437669, 3.420482, 0, 0, 0, 1, 1,
0.8277705, -0.1072574, 0.1375069, 0, 0, 0, 1, 1,
0.8407203, 0.2891442, 1.244494, 0, 0, 0, 1, 1,
0.8445312, -1.65233, 3.857169, 0, 0, 0, 1, 1,
0.8469841, 1.618907, 1.43459, 0, 0, 0, 1, 1,
0.8473504, -1.940795, 2.606953, 0, 0, 0, 1, 1,
0.8482615, 0.16362, -0.01444199, 1, 1, 1, 1, 1,
0.851306, 0.3901703, 0.7614403, 1, 1, 1, 1, 1,
0.8544229, -0.8507956, 3.132238, 1, 1, 1, 1, 1,
0.8549855, -1.786179, 2.870406, 1, 1, 1, 1, 1,
0.8550633, 0.5398214, 1.685449, 1, 1, 1, 1, 1,
0.8568026, -1.643844, 2.501877, 1, 1, 1, 1, 1,
0.8604463, 1.288825, 0.243581, 1, 1, 1, 1, 1,
0.8660582, 0.5353321, 1.116047, 1, 1, 1, 1, 1,
0.8663065, -0.9900807, 3.255115, 1, 1, 1, 1, 1,
0.8737162, 0.1054503, 2.268055, 1, 1, 1, 1, 1,
0.8804975, -0.2641963, -0.1348745, 1, 1, 1, 1, 1,
0.8823356, 0.5459144, 0.2716155, 1, 1, 1, 1, 1,
0.8827603, 1.060165, 2.07343, 1, 1, 1, 1, 1,
0.887012, -0.7405491, 2.653275, 1, 1, 1, 1, 1,
0.8880922, -0.04536021, 0.9975435, 1, 1, 1, 1, 1,
0.8907319, -0.2530195, -0.02887171, 0, 0, 1, 1, 1,
0.8930047, -0.0413212, 0.9623598, 1, 0, 0, 1, 1,
0.8938358, 1.885743, 0.6819508, 1, 0, 0, 1, 1,
0.8942319, -0.1625515, 2.864405, 1, 0, 0, 1, 1,
0.896351, -0.1515003, 3.402084, 1, 0, 0, 1, 1,
0.8963532, 0.1241398, 2.325336, 1, 0, 0, 1, 1,
0.8964528, -0.5484868, 2.608016, 0, 0, 0, 1, 1,
0.9028291, -1.099134, 3.466892, 0, 0, 0, 1, 1,
0.904117, -1.25195, 2.739784, 0, 0, 0, 1, 1,
0.9099628, 0.6558049, 0.03654232, 0, 0, 0, 1, 1,
0.9218147, 0.2768808, 2.088964, 0, 0, 0, 1, 1,
0.9246851, -0.9273995, 0.1916726, 0, 0, 0, 1, 1,
0.9299893, -1.886734, 3.423674, 0, 0, 0, 1, 1,
0.9330426, 1.619192, 0.7864652, 1, 1, 1, 1, 1,
0.9331645, 0.4269053, 3.666689, 1, 1, 1, 1, 1,
0.9331949, -1.85966, 1.220587, 1, 1, 1, 1, 1,
0.9396471, 0.05413656, 0.4672811, 1, 1, 1, 1, 1,
0.941622, -1.40389, -0.01827717, 1, 1, 1, 1, 1,
0.9423306, -0.8124906, 1.979176, 1, 1, 1, 1, 1,
0.9436486, 1.390689, 0.1829172, 1, 1, 1, 1, 1,
0.9462625, 0.7860957, 1.400417, 1, 1, 1, 1, 1,
0.9676246, 0.6502346, 1.079159, 1, 1, 1, 1, 1,
0.9692579, 1.323374, 0.7216049, 1, 1, 1, 1, 1,
0.9707273, -0.9915131, 2.105823, 1, 1, 1, 1, 1,
0.9844006, -0.6183976, 2.963153, 1, 1, 1, 1, 1,
0.9893671, 0.1598118, 2.262439, 1, 1, 1, 1, 1,
1.004125, 0.209683, 1.797577, 1, 1, 1, 1, 1,
1.005395, -0.7134032, 1.184263, 1, 1, 1, 1, 1,
1.009767, 1.441827, 0.5129617, 0, 0, 1, 1, 1,
1.018354, 0.7493312, -0.1403754, 1, 0, 0, 1, 1,
1.02528, 0.4718725, 1.397052, 1, 0, 0, 1, 1,
1.027023, 0.4698139, -0.01947256, 1, 0, 0, 1, 1,
1.029398, -1.598543, 4.069732, 1, 0, 0, 1, 1,
1.029488, 1.168472, 0.3972585, 1, 0, 0, 1, 1,
1.031054, 0.8955932, 1.335, 0, 0, 0, 1, 1,
1.032677, 1.469636, 0.5090109, 0, 0, 0, 1, 1,
1.043827, 0.1161345, 1.910671, 0, 0, 0, 1, 1,
1.046436, 0.4563886, 2.881618, 0, 0, 0, 1, 1,
1.050196, -0.2849969, 3.955742, 0, 0, 0, 1, 1,
1.055881, -1.271219, 0.73778, 0, 0, 0, 1, 1,
1.061813, 0.9291705, 1.198889, 0, 0, 0, 1, 1,
1.062239, -0.1096401, 1.906812, 1, 1, 1, 1, 1,
1.062801, -0.141553, 2.460408, 1, 1, 1, 1, 1,
1.063236, 1.397759, -0.183028, 1, 1, 1, 1, 1,
1.067602, 0.14293, 0.5256059, 1, 1, 1, 1, 1,
1.071289, -1.137162, 0.8893268, 1, 1, 1, 1, 1,
1.073912, 1.057015, 1.980037, 1, 1, 1, 1, 1,
1.075793, -0.09678601, 3.823345, 1, 1, 1, 1, 1,
1.07814, -0.2071189, 2.276858, 1, 1, 1, 1, 1,
1.082036, -1.110154, 2.958245, 1, 1, 1, 1, 1,
1.082565, -0.0421498, 0.2412031, 1, 1, 1, 1, 1,
1.090506, -2.289608, 4.003909, 1, 1, 1, 1, 1,
1.092716, 0.07328628, 1.86076, 1, 1, 1, 1, 1,
1.094517, 1.579398, 1.465871, 1, 1, 1, 1, 1,
1.098951, -1.536538, 2.447113, 1, 1, 1, 1, 1,
1.113881, -1.331919, 1.992252, 1, 1, 1, 1, 1,
1.118009, -0.4649709, 1.404138, 0, 0, 1, 1, 1,
1.122875, 0.4705506, 2.043615, 1, 0, 0, 1, 1,
1.122927, -1.414951, 3.673146, 1, 0, 0, 1, 1,
1.124589, 0.2961177, 0.303161, 1, 0, 0, 1, 1,
1.127457, 1.064338, -0.04124193, 1, 0, 0, 1, 1,
1.130096, 0.6276513, 1.276035, 1, 0, 0, 1, 1,
1.135591, -1.106137, -0.2588845, 0, 0, 0, 1, 1,
1.136421, -0.2255646, 2.191556, 0, 0, 0, 1, 1,
1.144641, -0.4620627, 1.96628, 0, 0, 0, 1, 1,
1.149454, 0.1625398, 1.539113, 0, 0, 0, 1, 1,
1.156508, -1.166984, 3.70595, 0, 0, 0, 1, 1,
1.156654, -0.2286864, 1.908149, 0, 0, 0, 1, 1,
1.159699, -0.7003447, 0.9365286, 0, 0, 0, 1, 1,
1.161603, 0.6273484, 0.4672538, 1, 1, 1, 1, 1,
1.168068, 0.4056002, 0.5723454, 1, 1, 1, 1, 1,
1.174555, -1.058906, 1.493968, 1, 1, 1, 1, 1,
1.19466, 0.8992864, 3.270269, 1, 1, 1, 1, 1,
1.196603, 1.027888, 1.565266, 1, 1, 1, 1, 1,
1.202762, -1.803572, 2.27796, 1, 1, 1, 1, 1,
1.204764, 2.735394, -0.6963063, 1, 1, 1, 1, 1,
1.20669, 0.6288953, -1.012695, 1, 1, 1, 1, 1,
1.212726, -0.1370627, 0.06709848, 1, 1, 1, 1, 1,
1.22237, -1.200073, 2.294761, 1, 1, 1, 1, 1,
1.233431, -0.7449909, 2.781678, 1, 1, 1, 1, 1,
1.237787, 0.2697249, 1.166346, 1, 1, 1, 1, 1,
1.253454, 1.061969, 0.8422166, 1, 1, 1, 1, 1,
1.254789, -0.7428775, 3.93281, 1, 1, 1, 1, 1,
1.264276, 0.0837042, 1.215086, 1, 1, 1, 1, 1,
1.265003, -0.5352251, 2.320042, 0, 0, 1, 1, 1,
1.266178, 2.137697, 0.3669334, 1, 0, 0, 1, 1,
1.270494, -1.647817, 2.683822, 1, 0, 0, 1, 1,
1.272215, 1.0505, 1.077315, 1, 0, 0, 1, 1,
1.278826, -0.868338, 3.068166, 1, 0, 0, 1, 1,
1.279606, -1.049147, 3.407925, 1, 0, 0, 1, 1,
1.286748, -0.6189288, 1.97888, 0, 0, 0, 1, 1,
1.287491, -0.5503264, 0.4379511, 0, 0, 0, 1, 1,
1.287823, -0.7271301, 3.832094, 0, 0, 0, 1, 1,
1.288469, -0.8180923, 0.6927197, 0, 0, 0, 1, 1,
1.301912, -0.5699277, 3.315022, 0, 0, 0, 1, 1,
1.304483, -0.3842146, 2.861083, 0, 0, 0, 1, 1,
1.306939, 1.519677, 0.9805324, 0, 0, 0, 1, 1,
1.315397, 0.6358688, 1.452499, 1, 1, 1, 1, 1,
1.320716, -0.2324241, 2.110908, 1, 1, 1, 1, 1,
1.32119, 1.636263, 1.701437, 1, 1, 1, 1, 1,
1.332712, -0.8938761, 2.525223, 1, 1, 1, 1, 1,
1.334907, 1.445016, 0.920938, 1, 1, 1, 1, 1,
1.33646, -1.200421, 2.813787, 1, 1, 1, 1, 1,
1.353809, -0.6444905, 1.748304, 1, 1, 1, 1, 1,
1.365944, 0.7523208, 2.049926, 1, 1, 1, 1, 1,
1.377285, -0.4344994, 1.108946, 1, 1, 1, 1, 1,
1.383259, 1.060755, 1.441716, 1, 1, 1, 1, 1,
1.384292, -1.446589, 1.337595, 1, 1, 1, 1, 1,
1.38696, 0.07005993, 0.930247, 1, 1, 1, 1, 1,
1.389613, 0.685859, 0.8139813, 1, 1, 1, 1, 1,
1.399788, -0.4393631, 2.78234, 1, 1, 1, 1, 1,
1.409137, -0.9209246, 2.749688, 1, 1, 1, 1, 1,
1.425599, 0.6698369, 1.901835, 0, 0, 1, 1, 1,
1.428575, -0.205643, 1.34552, 1, 0, 0, 1, 1,
1.432839, -1.284831, 2.622436, 1, 0, 0, 1, 1,
1.434528, 0.6842909, 0.4394681, 1, 0, 0, 1, 1,
1.437496, 0.8778613, 0.5715653, 1, 0, 0, 1, 1,
1.446954, 0.2943595, 1.841291, 1, 0, 0, 1, 1,
1.455263, 0.1686833, 0.7212819, 0, 0, 0, 1, 1,
1.459339, 0.5075936, 1.909717, 0, 0, 0, 1, 1,
1.465755, 1.156511, 1.5503, 0, 0, 0, 1, 1,
1.466266, 0.5609801, 0.1600201, 0, 0, 0, 1, 1,
1.468472, 0.4158094, 3.11549, 0, 0, 0, 1, 1,
1.475513, 0.418179, 1.994011, 0, 0, 0, 1, 1,
1.49865, -1.28593, 1.951277, 0, 0, 0, 1, 1,
1.499456, 0.4101671, 2.801525, 1, 1, 1, 1, 1,
1.530768, 0.4159682, 2.280656, 1, 1, 1, 1, 1,
1.536785, -0.549592, 3.012235, 1, 1, 1, 1, 1,
1.574517, -0.2985474, 2.110707, 1, 1, 1, 1, 1,
1.581265, 1.218863, 1.61156, 1, 1, 1, 1, 1,
1.58174, -0.3104022, 1.922385, 1, 1, 1, 1, 1,
1.597818, 0.8513056, 2.246112, 1, 1, 1, 1, 1,
1.634612, -1.558393, 2.646033, 1, 1, 1, 1, 1,
1.641303, 0.8654534, 1.413601, 1, 1, 1, 1, 1,
1.645677, 0.4377425, 0.8618841, 1, 1, 1, 1, 1,
1.650619, -0.04014505, 1.766354, 1, 1, 1, 1, 1,
1.653543, 2.005794, 0.6037797, 1, 1, 1, 1, 1,
1.654557, 1.422852, 0.8110233, 1, 1, 1, 1, 1,
1.681206, 0.2682122, 0.6990362, 1, 1, 1, 1, 1,
1.683956, 1.447532, 0.4016545, 1, 1, 1, 1, 1,
1.684594, 0.2515957, 0.9418911, 0, 0, 1, 1, 1,
1.692634, -0.1082392, 2.772073, 1, 0, 0, 1, 1,
1.698494, 0.882803, 1.239615, 1, 0, 0, 1, 1,
1.708236, -0.09632905, 0.5180467, 1, 0, 0, 1, 1,
1.760774, -0.08055843, 3.067291, 1, 0, 0, 1, 1,
1.761516, 1.284917, 1.345198, 1, 0, 0, 1, 1,
1.776916, 0.548437, -0.1378329, 0, 0, 0, 1, 1,
1.786575, -0.3437875, 2.170392, 0, 0, 0, 1, 1,
1.788414, -1.657439, 2.075679, 0, 0, 0, 1, 1,
1.807362, -0.8818099, 0.4795241, 0, 0, 0, 1, 1,
1.814966, 0.7283115, -1.230528, 0, 0, 0, 1, 1,
1.818087, -0.2168239, 2.09911, 0, 0, 0, 1, 1,
1.832145, -1.822922, 3.663379, 0, 0, 0, 1, 1,
1.855699, 0.4750961, 2.205309, 1, 1, 1, 1, 1,
1.860059, -0.2641437, 3.578646, 1, 1, 1, 1, 1,
1.925371, 2.235838, 1.523754, 1, 1, 1, 1, 1,
1.92884, 0.3981379, 2.907455, 1, 1, 1, 1, 1,
1.94888, 0.8401507, 0.03726193, 1, 1, 1, 1, 1,
1.964047, 0.184348, 1.881989, 1, 1, 1, 1, 1,
1.973964, -0.4374605, 1.147771, 1, 1, 1, 1, 1,
1.988017, 0.7992239, 0.6231948, 1, 1, 1, 1, 1,
1.999949, -0.4856522, 1.308787, 1, 1, 1, 1, 1,
2.006214, 0.11135, 1.379681, 1, 1, 1, 1, 1,
2.042305, 1.603595, -0.1146818, 1, 1, 1, 1, 1,
2.054652, -0.5780553, 2.173608, 1, 1, 1, 1, 1,
2.061592, 0.2956284, 1.846986, 1, 1, 1, 1, 1,
2.082338, -0.7480958, 1.857133, 1, 1, 1, 1, 1,
2.095067, -1.554786, 2.73236, 1, 1, 1, 1, 1,
2.098515, -1.64632, 2.12947, 0, 0, 1, 1, 1,
2.113729, -0.05887634, 2.080111, 1, 0, 0, 1, 1,
2.115683, 0.1637156, 0.1030702, 1, 0, 0, 1, 1,
2.158661, -2.091067, 1.86436, 1, 0, 0, 1, 1,
2.166263, -0.1520147, 1.395442, 1, 0, 0, 1, 1,
2.167912, -0.9411704, 1.414433, 1, 0, 0, 1, 1,
2.246707, 0.9298682, 1.82381, 0, 0, 0, 1, 1,
2.261332, 0.9516606, 0.4528609, 0, 0, 0, 1, 1,
2.307399, -0.6829668, 0.01948773, 0, 0, 0, 1, 1,
2.318718, 0.3740349, 3.461617, 0, 0, 0, 1, 1,
2.356626, 0.9512308, 1.85854, 0, 0, 0, 1, 1,
2.380669, 0.0473609, 2.159931, 0, 0, 0, 1, 1,
2.461061, 0.1517264, 0.6763386, 0, 0, 0, 1, 1,
2.467498, -1.268438, 0.2862821, 1, 1, 1, 1, 1,
2.535462, -0.7325774, 2.185373, 1, 1, 1, 1, 1,
2.668312, 0.08606351, 2.513395, 1, 1, 1, 1, 1,
2.710232, -0.4852489, 2.078097, 1, 1, 1, 1, 1,
2.833168, -1.197895, 1.682216, 1, 1, 1, 1, 1,
3.307015, -0.2682232, 1.257612, 1, 1, 1, 1, 1,
3.78566, 0.5384533, 0.8553154, 1, 1, 1, 1, 1
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
var radius = 9.613571;
var distance = 33.76726;
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
mvMatrix.translate( -0.3538914, -0.2045882, 0.09886694 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.76726);
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