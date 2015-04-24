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
-3.120006, -0.5117586, -1.489933, 1, 0, 0, 1,
-2.768319, -0.2901939, -1.650423, 1, 0.007843138, 0, 1,
-2.623158, 0.2904666, -0.4902279, 1, 0.01176471, 0, 1,
-2.552455, -0.7002921, -2.017179, 1, 0.01960784, 0, 1,
-2.420629, 0.7127256, 0.7866533, 1, 0.02352941, 0, 1,
-2.414845, 0.5862889, -1.625044, 1, 0.03137255, 0, 1,
-2.378116, 0.4802937, -1.928602, 1, 0.03529412, 0, 1,
-2.366279, -0.0008818537, -1.865548, 1, 0.04313726, 0, 1,
-2.364459, 0.39435, -1.075945, 1, 0.04705882, 0, 1,
-2.349357, 0.7840993, -1.586205, 1, 0.05490196, 0, 1,
-2.336853, -0.04699399, -3.233846, 1, 0.05882353, 0, 1,
-2.309404, 0.9485165, 1.194891, 1, 0.06666667, 0, 1,
-2.257981, 0.8283992, -0.7539295, 1, 0.07058824, 0, 1,
-2.243159, -1.269879, -2.847111, 1, 0.07843138, 0, 1,
-2.18193, 0.6901436, -1.302565, 1, 0.08235294, 0, 1,
-2.163611, 0.4010675, -2.524381, 1, 0.09019608, 0, 1,
-2.114306, 1.090214, -0.3070913, 1, 0.09411765, 0, 1,
-2.090677, 3.530754, -0.7740878, 1, 0.1019608, 0, 1,
-2.08733, 0.06532455, -3.070061, 1, 0.1098039, 0, 1,
-2.066713, -0.1351358, -1.310884, 1, 0.1137255, 0, 1,
-2.053926, 1.184578, -1.945902, 1, 0.1215686, 0, 1,
-2.030731, 0.4260933, -1.068423, 1, 0.1254902, 0, 1,
-2.022785, -1.060489, -1.130819, 1, 0.1333333, 0, 1,
-2.016388, 0.3603397, -1.036476, 1, 0.1372549, 0, 1,
-2.008268, -1.029813, -2.214624, 1, 0.145098, 0, 1,
-1.994232, -0.2103801, -0.7960494, 1, 0.1490196, 0, 1,
-1.988575, 1.806674, -0.7154836, 1, 0.1568628, 0, 1,
-1.976624, -0.4855234, -3.064392, 1, 0.1607843, 0, 1,
-1.947354, -0.1165763, -2.186512, 1, 0.1686275, 0, 1,
-1.927919, -0.8483707, -4.105883, 1, 0.172549, 0, 1,
-1.922077, -1.134817, -1.391935, 1, 0.1803922, 0, 1,
-1.91391, -0.1116021, -1.787636, 1, 0.1843137, 0, 1,
-1.904953, -0.7230072, -2.67514, 1, 0.1921569, 0, 1,
-1.903512, -0.6723071, -2.049162, 1, 0.1960784, 0, 1,
-1.895606, -0.4904884, -1.598782, 1, 0.2039216, 0, 1,
-1.890125, 0.8351775, 1.431631, 1, 0.2117647, 0, 1,
-1.877527, -0.1574308, -1.576729, 1, 0.2156863, 0, 1,
-1.871478, -0.08709252, -0.6200817, 1, 0.2235294, 0, 1,
-1.866331, 0.9354054, -2.043505, 1, 0.227451, 0, 1,
-1.830872, 0.2461578, -0.6793477, 1, 0.2352941, 0, 1,
-1.82695, -0.1533804, -0.6885844, 1, 0.2392157, 0, 1,
-1.812495, -0.8982136, -1.72634, 1, 0.2470588, 0, 1,
-1.807828, -0.4529618, -1.666766, 1, 0.2509804, 0, 1,
-1.804176, 0.9362711, -3.512698, 1, 0.2588235, 0, 1,
-1.79652, -0.1793766, -3.518026, 1, 0.2627451, 0, 1,
-1.783412, 1.114515, -0.9569157, 1, 0.2705882, 0, 1,
-1.767812, -0.1818042, -2.253287, 1, 0.2745098, 0, 1,
-1.743259, 0.2030412, -1.851129, 1, 0.282353, 0, 1,
-1.737702, 0.6488302, 0.6200994, 1, 0.2862745, 0, 1,
-1.728866, 0.7429222, -2.204573, 1, 0.2941177, 0, 1,
-1.726727, -0.3215699, 0.9608927, 1, 0.3019608, 0, 1,
-1.718438, 1.167494, -2.57511, 1, 0.3058824, 0, 1,
-1.707859, -0.135164, -2.315818, 1, 0.3137255, 0, 1,
-1.699112, 0.4399331, -1.223546, 1, 0.3176471, 0, 1,
-1.692891, -0.4814206, -2.169667, 1, 0.3254902, 0, 1,
-1.690321, 0.167136, -0.6451272, 1, 0.3294118, 0, 1,
-1.680357, -0.7094914, -0.6828821, 1, 0.3372549, 0, 1,
-1.676488, 1.553514, -1.070659, 1, 0.3411765, 0, 1,
-1.672945, -1.049426, -2.200384, 1, 0.3490196, 0, 1,
-1.6705, 0.3822275, -2.587707, 1, 0.3529412, 0, 1,
-1.668829, 0.7283329, -2.718797, 1, 0.3607843, 0, 1,
-1.655282, 0.07878228, -1.73808, 1, 0.3647059, 0, 1,
-1.64663, 0.1086832, 0.3603231, 1, 0.372549, 0, 1,
-1.625783, 0.608238, -0.3447639, 1, 0.3764706, 0, 1,
-1.617727, 0.9914044, -0.5739675, 1, 0.3843137, 0, 1,
-1.617667, -0.4496694, -1.569298, 1, 0.3882353, 0, 1,
-1.612735, -1.369022, -2.013831, 1, 0.3960784, 0, 1,
-1.601436, -0.8880315, -2.420204, 1, 0.4039216, 0, 1,
-1.601278, 0.07975793, -0.5633106, 1, 0.4078431, 0, 1,
-1.593841, -0.1676178, -3.015041, 1, 0.4156863, 0, 1,
-1.593486, 1.666617, -0.1877131, 1, 0.4196078, 0, 1,
-1.569659, -0.1950471, -1.217865, 1, 0.427451, 0, 1,
-1.557253, -0.1255399, -0.4877341, 1, 0.4313726, 0, 1,
-1.542566, 0.9783369, -3.027355, 1, 0.4392157, 0, 1,
-1.540804, -0.2738625, -1.317195, 1, 0.4431373, 0, 1,
-1.525144, -0.06448331, -2.920883, 1, 0.4509804, 0, 1,
-1.517564, -1.307432, -3.815681, 1, 0.454902, 0, 1,
-1.51743, -1.816787, -2.105406, 1, 0.4627451, 0, 1,
-1.512936, -0.1101463, -1.59261, 1, 0.4666667, 0, 1,
-1.509385, -0.8774101, -2.614897, 1, 0.4745098, 0, 1,
-1.503411, 0.4964226, -1.715627, 1, 0.4784314, 0, 1,
-1.497946, -1.230236, -4.200879, 1, 0.4862745, 0, 1,
-1.497005, -0.817802, -1.049726, 1, 0.4901961, 0, 1,
-1.491188, 0.6878461, -2.298974, 1, 0.4980392, 0, 1,
-1.489194, -1.814641, -0.6244007, 1, 0.5058824, 0, 1,
-1.482179, -0.6313148, -1.94733, 1, 0.509804, 0, 1,
-1.463914, -0.9177808, -2.083293, 1, 0.5176471, 0, 1,
-1.463133, -0.3601797, -0.5619659, 1, 0.5215687, 0, 1,
-1.462995, 1.706645, -0.7926508, 1, 0.5294118, 0, 1,
-1.457102, -1.38368, -3.944671, 1, 0.5333334, 0, 1,
-1.45514, -0.0595884, -1.167223, 1, 0.5411765, 0, 1,
-1.452888, 0.5491654, -2.695543, 1, 0.5450981, 0, 1,
-1.435906, -1.412472, -3.918076, 1, 0.5529412, 0, 1,
-1.428906, -0.7825574, -2.921979, 1, 0.5568628, 0, 1,
-1.424856, -0.8671175, -2.933733, 1, 0.5647059, 0, 1,
-1.420726, -0.2722854, -2.882608, 1, 0.5686275, 0, 1,
-1.419416, 0.08777072, -2.692148, 1, 0.5764706, 0, 1,
-1.417059, -0.427844, 0.8714056, 1, 0.5803922, 0, 1,
-1.413003, 1.614562, -0.7403309, 1, 0.5882353, 0, 1,
-1.412243, -0.4257201, -1.577811, 1, 0.5921569, 0, 1,
-1.409161, -1.073603, -1.118181, 1, 0.6, 0, 1,
-1.401849, -0.02633082, -0.4234406, 1, 0.6078432, 0, 1,
-1.396509, 0.03249695, -0.8799297, 1, 0.6117647, 0, 1,
-1.380802, 0.5320657, -1.952862, 1, 0.6196079, 0, 1,
-1.354973, 1.724168, -0.02065477, 1, 0.6235294, 0, 1,
-1.353352, 0.3047554, -2.715315, 1, 0.6313726, 0, 1,
-1.33368, -1.272632, -3.002331, 1, 0.6352941, 0, 1,
-1.333, -1.063133, -0.9007168, 1, 0.6431373, 0, 1,
-1.33212, -0.2256155, -0.2564148, 1, 0.6470588, 0, 1,
-1.330473, 0.1197875, -2.685925, 1, 0.654902, 0, 1,
-1.322508, 1.658566, -0.3041418, 1, 0.6588235, 0, 1,
-1.314978, 0.1502124, -1.888815, 1, 0.6666667, 0, 1,
-1.307468, 0.5225897, -1.20602, 1, 0.6705883, 0, 1,
-1.29739, 0.2933533, -1.88575, 1, 0.6784314, 0, 1,
-1.284834, -0.2828617, -2.218864, 1, 0.682353, 0, 1,
-1.281081, -0.4863248, -0.8189603, 1, 0.6901961, 0, 1,
-1.28008, -1.574419, -2.044586, 1, 0.6941177, 0, 1,
-1.279181, -0.6421546, -0.07295582, 1, 0.7019608, 0, 1,
-1.277726, -2.1569, -3.666551, 1, 0.7098039, 0, 1,
-1.272818, -0.2852075, -0.7553213, 1, 0.7137255, 0, 1,
-1.267881, -0.4685146, -2.043717, 1, 0.7215686, 0, 1,
-1.266941, 0.2655932, -1.048017, 1, 0.7254902, 0, 1,
-1.24831, 1.118875, 1.454751, 1, 0.7333333, 0, 1,
-1.241797, 0.1016813, -2.654148, 1, 0.7372549, 0, 1,
-1.230334, 1.028172, -0.7077433, 1, 0.7450981, 0, 1,
-1.230276, 0.07802194, -0.857153, 1, 0.7490196, 0, 1,
-1.228993, -1.458194, -1.957574, 1, 0.7568628, 0, 1,
-1.223927, 0.8877923, 0.5498328, 1, 0.7607843, 0, 1,
-1.220767, -0.07403152, -1.597711, 1, 0.7686275, 0, 1,
-1.216918, -0.1426109, -2.493246, 1, 0.772549, 0, 1,
-1.21238, 2.399977, -0.789836, 1, 0.7803922, 0, 1,
-1.209235, -0.003567918, -1.41916, 1, 0.7843137, 0, 1,
-1.207486, -1.518734, -2.509638, 1, 0.7921569, 0, 1,
-1.206147, -1.122046, -4.499046, 1, 0.7960784, 0, 1,
-1.205274, -1.290716, -3.374448, 1, 0.8039216, 0, 1,
-1.199875, 0.8287628, -1.398182, 1, 0.8117647, 0, 1,
-1.195869, -0.859741, -1.90749, 1, 0.8156863, 0, 1,
-1.184258, 0.1732919, -2.648125, 1, 0.8235294, 0, 1,
-1.181144, 0.583361, -0.6679668, 1, 0.827451, 0, 1,
-1.178185, 0.9504308, -0.01619296, 1, 0.8352941, 0, 1,
-1.175967, -1.77936, -0.03603082, 1, 0.8392157, 0, 1,
-1.17564, -0.1737649, -1.246018, 1, 0.8470588, 0, 1,
-1.168899, -1.072809, -2.986814, 1, 0.8509804, 0, 1,
-1.165516, 2.048318, -1.581328, 1, 0.8588235, 0, 1,
-1.155056, -0.05538321, -1.333582, 1, 0.8627451, 0, 1,
-1.148956, 0.5598269, -0.7305172, 1, 0.8705882, 0, 1,
-1.147014, 1.009301, -1.031885, 1, 0.8745098, 0, 1,
-1.141429, -0.6381748, -3.086918, 1, 0.8823529, 0, 1,
-1.135073, -0.8447931, -1.227185, 1, 0.8862745, 0, 1,
-1.135036, 0.6576157, -0.977199, 1, 0.8941177, 0, 1,
-1.134748, -1.066829, -2.381991, 1, 0.8980392, 0, 1,
-1.116241, -0.9381029, -1.468127, 1, 0.9058824, 0, 1,
-1.114154, -0.6739528, -4.003137, 1, 0.9137255, 0, 1,
-1.113373, -0.2767187, -3.073339, 1, 0.9176471, 0, 1,
-1.112921, 0.3145278, -3.161033, 1, 0.9254902, 0, 1,
-1.107035, -1.530447, -4.141685, 1, 0.9294118, 0, 1,
-1.1057, 1.524232, -0.2265991, 1, 0.9372549, 0, 1,
-1.098762, 1.321753, -0.6620432, 1, 0.9411765, 0, 1,
-1.097889, 1.130341, -1.116393, 1, 0.9490196, 0, 1,
-1.092543, -0.2574102, -0.9508473, 1, 0.9529412, 0, 1,
-1.07747, -1.026495, -2.665792, 1, 0.9607843, 0, 1,
-1.077205, -1.44685, -2.99346, 1, 0.9647059, 0, 1,
-1.072157, -1.747986, -3.785168, 1, 0.972549, 0, 1,
-1.071766, -0.6032804, -3.385458, 1, 0.9764706, 0, 1,
-1.06863, 0.9642452, -0.397348, 1, 0.9843137, 0, 1,
-1.059153, -2.068578, -1.039863, 1, 0.9882353, 0, 1,
-1.055325, 0.7887487, -0.1245592, 1, 0.9960784, 0, 1,
-1.051791, -1.397872, -2.28809, 0.9960784, 1, 0, 1,
-1.03809, 0.1280741, -3.916324, 0.9921569, 1, 0, 1,
-1.034226, -2.262671, -4.086787, 0.9843137, 1, 0, 1,
-1.03135, 1.294958, -1.144697, 0.9803922, 1, 0, 1,
-1.025051, -0.5155447, -2.360138, 0.972549, 1, 0, 1,
-1.019594, 1.434672, -0.9905444, 0.9686275, 1, 0, 1,
-1.005261, 2.331925, -0.7223242, 0.9607843, 1, 0, 1,
-0.9995112, 1.396133, -0.5407521, 0.9568627, 1, 0, 1,
-0.9979388, -0.1963995, -0.7739465, 0.9490196, 1, 0, 1,
-0.9908435, 0.4656751, -0.8785166, 0.945098, 1, 0, 1,
-0.9878325, 0.1384862, -1.453027, 0.9372549, 1, 0, 1,
-0.9876393, 2.000556, 0.1920426, 0.9333333, 1, 0, 1,
-0.9771453, -1.075148, -2.516625, 0.9254902, 1, 0, 1,
-0.9727386, 1.368929, -0.7168074, 0.9215686, 1, 0, 1,
-0.9712475, 1.45145, 0.5070519, 0.9137255, 1, 0, 1,
-0.9699559, 1.229329, -1.177006, 0.9098039, 1, 0, 1,
-0.9601122, 0.4394792, -1.601447, 0.9019608, 1, 0, 1,
-0.9579619, -1.176008, -2.704252, 0.8941177, 1, 0, 1,
-0.9552715, -0.8565521, -2.63933, 0.8901961, 1, 0, 1,
-0.9538858, -0.08626279, -0.3475406, 0.8823529, 1, 0, 1,
-0.951665, -0.4427029, -1.313641, 0.8784314, 1, 0, 1,
-0.9509761, -0.6219456, -0.9779101, 0.8705882, 1, 0, 1,
-0.9505065, 1.673549, -0.5284293, 0.8666667, 1, 0, 1,
-0.9471149, -1.669839, -4.599324, 0.8588235, 1, 0, 1,
-0.9445971, 2.161745, 0.5470591, 0.854902, 1, 0, 1,
-0.9441984, -1.735816, -2.87805, 0.8470588, 1, 0, 1,
-0.9438785, 0.5061656, -1.037605, 0.8431373, 1, 0, 1,
-0.9436674, -0.5158305, -1.913766, 0.8352941, 1, 0, 1,
-0.943037, -1.569171, -2.924605, 0.8313726, 1, 0, 1,
-0.9330195, 0.9453697, -3.364682, 0.8235294, 1, 0, 1,
-0.9311591, 0.3312175, -0.7929951, 0.8196079, 1, 0, 1,
-0.9265002, -2.250327, -3.265409, 0.8117647, 1, 0, 1,
-0.9238282, -0.3378484, -1.10139, 0.8078431, 1, 0, 1,
-0.917629, -1.093402, -2.620023, 0.8, 1, 0, 1,
-0.917506, -2.451367, -3.072006, 0.7921569, 1, 0, 1,
-0.9158471, 0.02251923, -1.646728, 0.7882353, 1, 0, 1,
-0.9071429, -1.006558, -1.483929, 0.7803922, 1, 0, 1,
-0.9063817, -0.6238935, -4.452106, 0.7764706, 1, 0, 1,
-0.9011782, 0.1680372, -2.360394, 0.7686275, 1, 0, 1,
-0.8946966, -0.1930155, -2.134885, 0.7647059, 1, 0, 1,
-0.8835072, -0.4111494, -3.77663, 0.7568628, 1, 0, 1,
-0.8797423, 0.2959685, -0.5915738, 0.7529412, 1, 0, 1,
-0.8661664, 0.8600212, -2.089467, 0.7450981, 1, 0, 1,
-0.8653109, 1.059059, -1.617115, 0.7411765, 1, 0, 1,
-0.8548459, 0.8536198, -1.103112, 0.7333333, 1, 0, 1,
-0.8547291, -1.146107, -1.31631, 0.7294118, 1, 0, 1,
-0.8496946, -0.7235427, -1.989314, 0.7215686, 1, 0, 1,
-0.8492231, -1.699606, -4.849009, 0.7176471, 1, 0, 1,
-0.8371897, 0.876536, -0.8860242, 0.7098039, 1, 0, 1,
-0.8285631, 0.9144091, -0.4759555, 0.7058824, 1, 0, 1,
-0.825878, -1.398736, -1.200569, 0.6980392, 1, 0, 1,
-0.8228306, 0.4731804, -2.408284, 0.6901961, 1, 0, 1,
-0.8217964, 1.269763, -0.9537786, 0.6862745, 1, 0, 1,
-0.8203225, -1.91953, -2.678052, 0.6784314, 1, 0, 1,
-0.8149932, 0.6147043, -1.543241, 0.6745098, 1, 0, 1,
-0.8146019, -0.2865154, 0.118094, 0.6666667, 1, 0, 1,
-0.8131165, -0.2387809, -1.078173, 0.6627451, 1, 0, 1,
-0.8118564, -1.140981, -2.461377, 0.654902, 1, 0, 1,
-0.8097323, 0.4911169, -1.408198, 0.6509804, 1, 0, 1,
-0.8091742, -2.243682, -1.478791, 0.6431373, 1, 0, 1,
-0.8061857, 0.8810462, -2.031827, 0.6392157, 1, 0, 1,
-0.7914099, -1.905955, -1.902829, 0.6313726, 1, 0, 1,
-0.7880765, 0.726175, 0.1257067, 0.627451, 1, 0, 1,
-0.7849864, 0.5262015, -0.4436241, 0.6196079, 1, 0, 1,
-0.7822161, 0.7320429, -1.125756, 0.6156863, 1, 0, 1,
-0.7769822, 0.8171248, -1.046253, 0.6078432, 1, 0, 1,
-0.7751789, 2.045756, 0.5831391, 0.6039216, 1, 0, 1,
-0.7750497, 0.4848573, -1.242452, 0.5960785, 1, 0, 1,
-0.7734682, -2.705943, -2.063052, 0.5882353, 1, 0, 1,
-0.7722039, -0.9475439, -2.63054, 0.5843138, 1, 0, 1,
-0.771365, -1.66283, -2.985629, 0.5764706, 1, 0, 1,
-0.7696429, -1.650426, -3.660435, 0.572549, 1, 0, 1,
-0.7673509, -0.1340966, -1.808047, 0.5647059, 1, 0, 1,
-0.7634665, -0.7266471, -3.655907, 0.5607843, 1, 0, 1,
-0.7559507, -0.1674848, -0.7895811, 0.5529412, 1, 0, 1,
-0.7549241, -0.1441571, -1.538707, 0.5490196, 1, 0, 1,
-0.7497666, 0.7073643, -0.9582654, 0.5411765, 1, 0, 1,
-0.7488573, -0.3923517, -1.498148, 0.5372549, 1, 0, 1,
-0.7477148, -1.994713, -2.003585, 0.5294118, 1, 0, 1,
-0.7424383, 0.4236645, -1.909768, 0.5254902, 1, 0, 1,
-0.738348, 0.3682963, -2.527101, 0.5176471, 1, 0, 1,
-0.7355497, -0.7321278, -3.406172, 0.5137255, 1, 0, 1,
-0.7340448, -0.3696486, -2.000086, 0.5058824, 1, 0, 1,
-0.7329524, -1.274117, -2.26899, 0.5019608, 1, 0, 1,
-0.7283586, 1.093311, -0.8368381, 0.4941176, 1, 0, 1,
-0.7280916, -1.758407, -4.192982, 0.4862745, 1, 0, 1,
-0.7204216, -0.7325398, -2.003092, 0.4823529, 1, 0, 1,
-0.7194088, 1.752812, -0.9032009, 0.4745098, 1, 0, 1,
-0.7108773, 0.2091188, -1.510406, 0.4705882, 1, 0, 1,
-0.7101952, -0.6768672, -1.953032, 0.4627451, 1, 0, 1,
-0.7094011, 0.02529872, -2.457238, 0.4588235, 1, 0, 1,
-0.7044958, 0.8863978, 0.05899017, 0.4509804, 1, 0, 1,
-0.6948923, 1.119301, 0.4896144, 0.4470588, 1, 0, 1,
-0.692682, 0.3241448, -0.1316888, 0.4392157, 1, 0, 1,
-0.6871399, -1.196376, -2.931052, 0.4352941, 1, 0, 1,
-0.6857427, 0.8046407, 0.1824654, 0.427451, 1, 0, 1,
-0.6852793, -1.787778, -3.97236, 0.4235294, 1, 0, 1,
-0.6797273, -0.5570439, -1.722808, 0.4156863, 1, 0, 1,
-0.6786132, 0.298458, -2.106189, 0.4117647, 1, 0, 1,
-0.6745904, 0.2888827, -0.4013906, 0.4039216, 1, 0, 1,
-0.671196, -2.140324, -3.114944, 0.3960784, 1, 0, 1,
-0.6686944, -0.2510299, -0.4039406, 0.3921569, 1, 0, 1,
-0.6683585, -2.401806, -2.805927, 0.3843137, 1, 0, 1,
-0.661009, 0.4500824, -1.839538, 0.3803922, 1, 0, 1,
-0.6607596, -0.17243, -2.736769, 0.372549, 1, 0, 1,
-0.660526, -0.8050542, -3.197094, 0.3686275, 1, 0, 1,
-0.658348, 0.1666532, -1.784239, 0.3607843, 1, 0, 1,
-0.6582802, -0.8019434, -4.184681, 0.3568628, 1, 0, 1,
-0.6524123, -0.2705803, -0.9834852, 0.3490196, 1, 0, 1,
-0.6512704, 0.2085761, -1.776022, 0.345098, 1, 0, 1,
-0.6500019, 0.8223839, 0.6110164, 0.3372549, 1, 0, 1,
-0.6484932, -1.330879, -2.169462, 0.3333333, 1, 0, 1,
-0.6438602, 0.2110265, -1.670713, 0.3254902, 1, 0, 1,
-0.6433093, 0.7473249, -1.732048, 0.3215686, 1, 0, 1,
-0.6400986, -0.4180365, -1.096458, 0.3137255, 1, 0, 1,
-0.6375982, -0.4029655, -2.096761, 0.3098039, 1, 0, 1,
-0.6364458, -0.925797, -1.916765, 0.3019608, 1, 0, 1,
-0.6357265, 0.4808288, -1.208274, 0.2941177, 1, 0, 1,
-0.6343433, -0.8046099, -2.536305, 0.2901961, 1, 0, 1,
-0.6335195, 0.9904526, -0.8160928, 0.282353, 1, 0, 1,
-0.6328905, 0.1074233, -2.236758, 0.2784314, 1, 0, 1,
-0.6328796, 0.4881467, -2.477521, 0.2705882, 1, 0, 1,
-0.6314105, -0.3254742, -2.486115, 0.2666667, 1, 0, 1,
-0.627754, 1.781298, 0.1822861, 0.2588235, 1, 0, 1,
-0.6267232, -0.1259924, -0.7113731, 0.254902, 1, 0, 1,
-0.6234869, 0.4222296, -1.430187, 0.2470588, 1, 0, 1,
-0.6215821, -0.7411271, -3.418885, 0.2431373, 1, 0, 1,
-0.6183788, -0.5021187, -2.721553, 0.2352941, 1, 0, 1,
-0.6113085, -0.7005175, -2.123916, 0.2313726, 1, 0, 1,
-0.6107225, 3.130421, 0.2396886, 0.2235294, 1, 0, 1,
-0.6079941, 0.9003842, 0.9117892, 0.2196078, 1, 0, 1,
-0.6055844, 1.607296, -2.40329, 0.2117647, 1, 0, 1,
-0.6044949, -0.2171437, -2.396191, 0.2078431, 1, 0, 1,
-0.602609, 1.547603, -0.223684, 0.2, 1, 0, 1,
-0.6016162, 0.5279586, -0.5025212, 0.1921569, 1, 0, 1,
-0.5969148, -1.883403, -2.251646, 0.1882353, 1, 0, 1,
-0.5920193, -0.3261785, -0.792416, 0.1803922, 1, 0, 1,
-0.5918028, -1.936879, -1.509977, 0.1764706, 1, 0, 1,
-0.5906301, -0.3814915, -1.567299, 0.1686275, 1, 0, 1,
-0.5905576, -1.675758, -4.519896, 0.1647059, 1, 0, 1,
-0.5844777, 0.8511843, 0.5394531, 0.1568628, 1, 0, 1,
-0.5816169, 0.2705869, -0.824313, 0.1529412, 1, 0, 1,
-0.579441, 2.122011, -0.2083774, 0.145098, 1, 0, 1,
-0.5766824, 2.656775, -0.1373453, 0.1411765, 1, 0, 1,
-0.5766805, 0.3482651, -0.7265809, 0.1333333, 1, 0, 1,
-0.5697405, -0.614959, -2.877989, 0.1294118, 1, 0, 1,
-0.5696594, 0.02096253, -1.470275, 0.1215686, 1, 0, 1,
-0.5611034, -0.4983428, -3.983141, 0.1176471, 1, 0, 1,
-0.5590898, -0.004156718, -1.351639, 0.1098039, 1, 0, 1,
-0.5566102, 0.8335116, -0.5315287, 0.1058824, 1, 0, 1,
-0.5535567, -1.577157, -0.4895962, 0.09803922, 1, 0, 1,
-0.5509129, 0.6360043, -0.7277789, 0.09019608, 1, 0, 1,
-0.5474702, -0.1606848, -1.652371, 0.08627451, 1, 0, 1,
-0.5461286, 0.8694294, 0.03982948, 0.07843138, 1, 0, 1,
-0.5442603, 1.707371, 0.06258873, 0.07450981, 1, 0, 1,
-0.5392909, -0.1480202, -1.082842, 0.06666667, 1, 0, 1,
-0.5324951, 0.1387607, -1.68506, 0.0627451, 1, 0, 1,
-0.5309721, 1.860497, 0.7749581, 0.05490196, 1, 0, 1,
-0.5291947, 0.9105684, -0.5640845, 0.05098039, 1, 0, 1,
-0.5198248, 0.768607, -0.3860023, 0.04313726, 1, 0, 1,
-0.5159782, -0.2571326, -2.118633, 0.03921569, 1, 0, 1,
-0.5107995, 1.321113, -0.5833666, 0.03137255, 1, 0, 1,
-0.5081505, -0.509624, -2.48608, 0.02745098, 1, 0, 1,
-0.4980536, -1.547349, -1.400766, 0.01960784, 1, 0, 1,
-0.4892944, 1.208279, 1.268325, 0.01568628, 1, 0, 1,
-0.4878266, -0.1518303, -2.211134, 0.007843138, 1, 0, 1,
-0.4815861, 0.3471238, -2.226619, 0.003921569, 1, 0, 1,
-0.4796444, -1.045226, -4.939876, 0, 1, 0.003921569, 1,
-0.4781113, 0.07314036, -3.215114, 0, 1, 0.01176471, 1,
-0.4751502, 1.046113, -1.316818, 0, 1, 0.01568628, 1,
-0.4703853, -0.4247573, -1.338039, 0, 1, 0.02352941, 1,
-0.4700019, -1.395095, -3.366786, 0, 1, 0.02745098, 1,
-0.4698365, 0.04263072, -1.483588, 0, 1, 0.03529412, 1,
-0.469708, -0.2826813, -2.849046, 0, 1, 0.03921569, 1,
-0.4686691, -0.6894925, -2.467776, 0, 1, 0.04705882, 1,
-0.4640236, -1.050731, -3.488018, 0, 1, 0.05098039, 1,
-0.4600553, -0.2508884, -2.287268, 0, 1, 0.05882353, 1,
-0.4598126, 0.4697223, -1.433417, 0, 1, 0.0627451, 1,
-0.4554113, -0.13028, 0.37372, 0, 1, 0.07058824, 1,
-0.4506524, 0.03009062, -0.5326355, 0, 1, 0.07450981, 1,
-0.4490417, 0.814978, -0.918263, 0, 1, 0.08235294, 1,
-0.4416448, 2.039335, -0.9714904, 0, 1, 0.08627451, 1,
-0.4375956, 0.982581, 0.8881318, 0, 1, 0.09411765, 1,
-0.4317284, 1.307766, 0.6575978, 0, 1, 0.1019608, 1,
-0.430721, 1.072935, -1.208406, 0, 1, 0.1058824, 1,
-0.4289257, 0.4313142, 0.9262987, 0, 1, 0.1137255, 1,
-0.4287342, 0.05480942, 0.4763095, 0, 1, 0.1176471, 1,
-0.428485, -0.2327406, -1.721504, 0, 1, 0.1254902, 1,
-0.4261468, 0.03991826, -3.292271, 0, 1, 0.1294118, 1,
-0.4223979, 1.383328, -0.4969759, 0, 1, 0.1372549, 1,
-0.4200614, 0.7355981, -1.024117, 0, 1, 0.1411765, 1,
-0.4142544, 1.515381, -1.257783, 0, 1, 0.1490196, 1,
-0.4122999, 1.140337, 0.06905942, 0, 1, 0.1529412, 1,
-0.4114569, -0.4710079, -3.696902, 0, 1, 0.1607843, 1,
-0.4095301, 1.993145, 1.610702, 0, 1, 0.1647059, 1,
-0.408598, -1.357154, -3.093595, 0, 1, 0.172549, 1,
-0.4072281, -0.4386941, -1.674026, 0, 1, 0.1764706, 1,
-0.4058552, -0.811064, -3.468404, 0, 1, 0.1843137, 1,
-0.4027179, -0.827455, -1.307668, 0, 1, 0.1882353, 1,
-0.3998253, 0.8066715, -2.11931, 0, 1, 0.1960784, 1,
-0.3926004, 0.07964233, -2.753696, 0, 1, 0.2039216, 1,
-0.3919839, -2.333878, -1.296261, 0, 1, 0.2078431, 1,
-0.3895762, 0.4442204, -0.1961216, 0, 1, 0.2156863, 1,
-0.3851238, -0.4914191, -2.170235, 0, 1, 0.2196078, 1,
-0.3841766, 0.4365741, -0.4894979, 0, 1, 0.227451, 1,
-0.3780045, -0.09638985, -2.80883, 0, 1, 0.2313726, 1,
-0.3713661, -0.3423953, -1.94674, 0, 1, 0.2392157, 1,
-0.3660381, 2.06677, 1.465564, 0, 1, 0.2431373, 1,
-0.3653851, 0.8054341, -2.112285, 0, 1, 0.2509804, 1,
-0.3629953, 0.01367436, -2.781713, 0, 1, 0.254902, 1,
-0.3558423, 0.9658042, 1.393193, 0, 1, 0.2627451, 1,
-0.3556765, 2.445475, 1.480645, 0, 1, 0.2666667, 1,
-0.3548956, 0.9544792, -1.302343, 0, 1, 0.2745098, 1,
-0.3507823, -1.13015, -3.082354, 0, 1, 0.2784314, 1,
-0.3471749, -0.04855851, -3.498344, 0, 1, 0.2862745, 1,
-0.3448506, -0.3844651, -1.936674, 0, 1, 0.2901961, 1,
-0.3438058, -0.341518, -2.232742, 0, 1, 0.2980392, 1,
-0.3403469, -0.7337475, -2.855738, 0, 1, 0.3058824, 1,
-0.3403451, 2.338941, -0.7682442, 0, 1, 0.3098039, 1,
-0.3394504, 1.05115, -1.195961, 0, 1, 0.3176471, 1,
-0.3383928, 1.339887, -1.283927, 0, 1, 0.3215686, 1,
-0.3379777, -1.541602, -1.481254, 0, 1, 0.3294118, 1,
-0.3345191, -0.6892824, -2.590649, 0, 1, 0.3333333, 1,
-0.3311604, 1.463071, -1.466641, 0, 1, 0.3411765, 1,
-0.3304216, 1.592644, -1.117583, 0, 1, 0.345098, 1,
-0.3296171, -0.6504822, -2.986007, 0, 1, 0.3529412, 1,
-0.3204555, -1.164324, -5.126015, 0, 1, 0.3568628, 1,
-0.319658, 0.8789898, -2.173756, 0, 1, 0.3647059, 1,
-0.3173625, -0.8097858, -2.416211, 0, 1, 0.3686275, 1,
-0.314716, 2.18236, 0.1319596, 0, 1, 0.3764706, 1,
-0.3146369, 0.7775719, 1.004388, 0, 1, 0.3803922, 1,
-0.3071035, 1.062395, 0.1870453, 0, 1, 0.3882353, 1,
-0.305303, -0.09209663, -1.918997, 0, 1, 0.3921569, 1,
-0.3046501, 1.246208, -0.9189564, 0, 1, 0.4, 1,
-0.3000156, -1.063212, -2.041513, 0, 1, 0.4078431, 1,
-0.2950453, -0.6279656, -1.493137, 0, 1, 0.4117647, 1,
-0.2947789, 0.2624471, -0.7927616, 0, 1, 0.4196078, 1,
-0.2943107, -1.316515, -2.039178, 0, 1, 0.4235294, 1,
-0.2933811, 0.5690085, -0.1792697, 0, 1, 0.4313726, 1,
-0.2888189, -0.04380944, -1.048774, 0, 1, 0.4352941, 1,
-0.2820412, -0.2077862, -2.829539, 0, 1, 0.4431373, 1,
-0.2722557, -1.078909, -2.717937, 0, 1, 0.4470588, 1,
-0.267749, 0.2710619, -1.25778, 0, 1, 0.454902, 1,
-0.2673891, 0.7586295, -0.9037089, 0, 1, 0.4588235, 1,
-0.2649373, 0.3040437, -1.669794, 0, 1, 0.4666667, 1,
-0.2638571, 0.3873625, 0.4978712, 0, 1, 0.4705882, 1,
-0.2590597, 0.07254769, -1.694783, 0, 1, 0.4784314, 1,
-0.2587105, -1.037595, -5.553008, 0, 1, 0.4823529, 1,
-0.2548858, 0.5173479, -0.00384513, 0, 1, 0.4901961, 1,
-0.2535543, -1.493302, -3.014755, 0, 1, 0.4941176, 1,
-0.253064, -0.8851504, -1.270137, 0, 1, 0.5019608, 1,
-0.2501148, 0.001921192, -1.022264, 0, 1, 0.509804, 1,
-0.2493854, -0.3440177, -2.939673, 0, 1, 0.5137255, 1,
-0.2452913, -1.669943, -3.382906, 0, 1, 0.5215687, 1,
-0.2434125, -1.284823, -2.994359, 0, 1, 0.5254902, 1,
-0.2422606, 1.162221, -1.169708, 0, 1, 0.5333334, 1,
-0.2366347, -0.3111491, -3.411536, 0, 1, 0.5372549, 1,
-0.2354424, 0.1519244, -0.5786744, 0, 1, 0.5450981, 1,
-0.2353527, 1.037385, 1.312731, 0, 1, 0.5490196, 1,
-0.2350594, 0.7466798, 0.210325, 0, 1, 0.5568628, 1,
-0.227517, 0.8820119, 1.548938, 0, 1, 0.5607843, 1,
-0.2197552, 0.7622602, -0.2145161, 0, 1, 0.5686275, 1,
-0.2188198, 0.2580472, -0.8498545, 0, 1, 0.572549, 1,
-0.2187361, -0.112554, -3.054693, 0, 1, 0.5803922, 1,
-0.2166193, 0.7992165, 0.4728568, 0, 1, 0.5843138, 1,
-0.2163133, -0.5131441, -1.64882, 0, 1, 0.5921569, 1,
-0.2156092, 0.9472558, -2.338089, 0, 1, 0.5960785, 1,
-0.2141114, 0.4056257, -0.7663786, 0, 1, 0.6039216, 1,
-0.2124045, 0.4566394, -0.3450456, 0, 1, 0.6117647, 1,
-0.2101893, 0.3263176, -0.8595894, 0, 1, 0.6156863, 1,
-0.207972, 1.166001, 0.1256814, 0, 1, 0.6235294, 1,
-0.2044428, -0.4240304, -0.3550889, 0, 1, 0.627451, 1,
-0.2016605, 1.139877, -1.161969, 0, 1, 0.6352941, 1,
-0.201623, -1.056776, -2.089848, 0, 1, 0.6392157, 1,
-0.2002752, 2.159823, 0.6835699, 0, 1, 0.6470588, 1,
-0.1999753, 1.070986, -0.1176903, 0, 1, 0.6509804, 1,
-0.19744, 1.497935, -1.534867, 0, 1, 0.6588235, 1,
-0.1970992, -0.1987043, -2.562853, 0, 1, 0.6627451, 1,
-0.1950904, 0.02590883, -1.362478, 0, 1, 0.6705883, 1,
-0.1878329, 0.5515564, 0.7437559, 0, 1, 0.6745098, 1,
-0.1864175, 0.5020744, -1.00137, 0, 1, 0.682353, 1,
-0.1857901, -0.3220926, -3.936704, 0, 1, 0.6862745, 1,
-0.1767367, 2.051695, -0.6609765, 0, 1, 0.6941177, 1,
-0.174414, -0.06519877, -1.960497, 0, 1, 0.7019608, 1,
-0.1711144, 1.556372, 0.2521169, 0, 1, 0.7058824, 1,
-0.1700831, -0.03808409, -1.786577, 0, 1, 0.7137255, 1,
-0.1695402, -1.40422, -2.252882, 0, 1, 0.7176471, 1,
-0.1671302, 1.099245, 0.1893796, 0, 1, 0.7254902, 1,
-0.1651008, -0.371709, -2.529791, 0, 1, 0.7294118, 1,
-0.1630162, 0.6866345, 0.4397059, 0, 1, 0.7372549, 1,
-0.1595363, -0.883441, -2.563869, 0, 1, 0.7411765, 1,
-0.1583636, -1.680808, -2.189171, 0, 1, 0.7490196, 1,
-0.149051, 1.274078, -0.3265296, 0, 1, 0.7529412, 1,
-0.1479266, 2.815242, -0.3893611, 0, 1, 0.7607843, 1,
-0.145482, 0.2285541, -0.4837502, 0, 1, 0.7647059, 1,
-0.139025, -0.05888509, -3.188308, 0, 1, 0.772549, 1,
-0.1378434, -0.6832231, -2.084031, 0, 1, 0.7764706, 1,
-0.1371495, -0.1954669, -3.487815, 0, 1, 0.7843137, 1,
-0.1338933, 0.3963704, -0.9057472, 0, 1, 0.7882353, 1,
-0.1331832, -0.4655309, -1.720113, 0, 1, 0.7960784, 1,
-0.131038, -0.8770902, -2.154738, 0, 1, 0.8039216, 1,
-0.1300893, -1.337739, -3.149694, 0, 1, 0.8078431, 1,
-0.126803, -0.02864066, -3.333621, 0, 1, 0.8156863, 1,
-0.125339, -2.147997, -2.798838, 0, 1, 0.8196079, 1,
-0.1223759, -0.2969953, -2.947906, 0, 1, 0.827451, 1,
-0.1213355, 0.1947206, -1.498757, 0, 1, 0.8313726, 1,
-0.1206455, -0.401794, -4.168902, 0, 1, 0.8392157, 1,
-0.1201211, -0.3130756, -2.534111, 0, 1, 0.8431373, 1,
-0.1128256, 0.8087595, 2.296308, 0, 1, 0.8509804, 1,
-0.1116424, 0.62637, -1.098052, 0, 1, 0.854902, 1,
-0.108797, 0.1774397, -0.9952577, 0, 1, 0.8627451, 1,
-0.1015213, 0.3284679, 1.211707, 0, 1, 0.8666667, 1,
-0.09562146, -0.6968171, -1.011823, 0, 1, 0.8745098, 1,
-0.09415124, 0.8415669, -1.132807, 0, 1, 0.8784314, 1,
-0.09257942, 0.2834919, -0.7318939, 0, 1, 0.8862745, 1,
-0.09089591, -0.8034209, -4.052258, 0, 1, 0.8901961, 1,
-0.08986203, 0.3494396, -0.3871636, 0, 1, 0.8980392, 1,
-0.08634558, 0.8165943, 0.7312506, 0, 1, 0.9058824, 1,
-0.08495863, 1.822384, -0.4993236, 0, 1, 0.9098039, 1,
-0.08189679, -0.8607512, -2.623741, 0, 1, 0.9176471, 1,
-0.07991487, -1.473094, -3.360539, 0, 1, 0.9215686, 1,
-0.07801653, 2.201607, -0.9732533, 0, 1, 0.9294118, 1,
-0.0773637, -0.2652739, -4.272279, 0, 1, 0.9333333, 1,
-0.07652495, -0.1728184, -3.164109, 0, 1, 0.9411765, 1,
-0.07297041, 0.4705743, -0.7412975, 0, 1, 0.945098, 1,
-0.06949303, -1.393687, -3.630272, 0, 1, 0.9529412, 1,
-0.06889849, 0.5256234, -0.2437696, 0, 1, 0.9568627, 1,
-0.06851887, 0.53195, 0.5253249, 0, 1, 0.9647059, 1,
-0.06563193, 1.599055, 1.874397, 0, 1, 0.9686275, 1,
-0.06545421, -0.7374592, -4.024343, 0, 1, 0.9764706, 1,
-0.06238801, -0.2414432, -2.530995, 0, 1, 0.9803922, 1,
-0.05743644, 0.03668801, -0.4271607, 0, 1, 0.9882353, 1,
-0.05684927, -1.414195, -2.774857, 0, 1, 0.9921569, 1,
-0.05639969, 0.009604556, -1.476445, 0, 1, 1, 1,
-0.0545436, 0.8455729, 0.1709268, 0, 0.9921569, 1, 1,
-0.0523136, -0.2969523, -3.162937, 0, 0.9882353, 1, 1,
-0.05225753, 0.3967554, -1.586329, 0, 0.9803922, 1, 1,
-0.04907753, -1.801633, -2.246239, 0, 0.9764706, 1, 1,
-0.04672128, -0.5878986, -3.855179, 0, 0.9686275, 1, 1,
-0.04485293, -0.582194, -3.854472, 0, 0.9647059, 1, 1,
-0.04459371, 0.1355831, 0.01521322, 0, 0.9568627, 1, 1,
-0.03892098, 0.724722, -0.5634046, 0, 0.9529412, 1, 1,
-0.03761518, 0.3330255, -0.4149696, 0, 0.945098, 1, 1,
-0.03505706, -0.5260256, -4.20008, 0, 0.9411765, 1, 1,
-0.03264526, 0.8799954, -1.682629, 0, 0.9333333, 1, 1,
-0.02744452, 1.642964, 1.285712, 0, 0.9294118, 1, 1,
-0.02695949, 1.513604, -0.8835263, 0, 0.9215686, 1, 1,
-0.025157, 0.4231585, -0.1076105, 0, 0.9176471, 1, 1,
-0.01966799, 0.0001937667, -1.956435, 0, 0.9098039, 1, 1,
-0.01445292, -0.1852501, -2.063467, 0, 0.9058824, 1, 1,
-0.01323091, 0.8319365, 1.050861, 0, 0.8980392, 1, 1,
-0.01216776, -0.3054207, -4.289656, 0, 0.8901961, 1, 1,
-0.009215408, -1.736324, -2.096983, 0, 0.8862745, 1, 1,
-0.004665786, -0.2296241, -2.149642, 0, 0.8784314, 1, 1,
-0.004417163, 0.2343463, 0.9087372, 0, 0.8745098, 1, 1,
-0.002078949, -0.6642878, -2.168795, 0, 0.8666667, 1, 1,
0.001309338, 0.4850864, 0.5048052, 0, 0.8627451, 1, 1,
0.003650907, -1.252591, 3.185976, 0, 0.854902, 1, 1,
0.0086273, 0.7604932, -0.6106746, 0, 0.8509804, 1, 1,
0.01064489, 0.595899, 0.5846877, 0, 0.8431373, 1, 1,
0.01326439, -0.2564967, 3.9666, 0, 0.8392157, 1, 1,
0.01417613, -0.2395317, 1.340754, 0, 0.8313726, 1, 1,
0.01636007, 1.149394, -0.1834881, 0, 0.827451, 1, 1,
0.01679291, -0.7627649, 2.865272, 0, 0.8196079, 1, 1,
0.01792331, -1.199342, 3.869877, 0, 0.8156863, 1, 1,
0.02227297, -1.159582, 6.126535, 0, 0.8078431, 1, 1,
0.02444939, 0.08188941, 0.08786933, 0, 0.8039216, 1, 1,
0.02937916, 2.142377, -0.04901803, 0, 0.7960784, 1, 1,
0.03079623, -0.1026191, 0.9343801, 0, 0.7882353, 1, 1,
0.03101693, 0.5840218, 0.2349167, 0, 0.7843137, 1, 1,
0.03151506, 0.7165406, -1.089722, 0, 0.7764706, 1, 1,
0.03276724, 0.1447047, 0.8138268, 0, 0.772549, 1, 1,
0.04361599, -0.9434501, 3.508765, 0, 0.7647059, 1, 1,
0.04504374, 0.7342985, 1.451924, 0, 0.7607843, 1, 1,
0.04678727, 0.3889359, 1.60016, 0, 0.7529412, 1, 1,
0.05411484, 0.3084118, -0.5276141, 0, 0.7490196, 1, 1,
0.05481512, -0.9598202, 3.071357, 0, 0.7411765, 1, 1,
0.05758511, 0.1074974, 1.177251, 0, 0.7372549, 1, 1,
0.06394425, -0.7572497, 2.880883, 0, 0.7294118, 1, 1,
0.06419628, 0.2228392, 0.7195612, 0, 0.7254902, 1, 1,
0.06464513, 1.021833, -0.7324516, 0, 0.7176471, 1, 1,
0.06510212, 0.4112222, -0.2953498, 0, 0.7137255, 1, 1,
0.06605046, -0.05522671, 0.610962, 0, 0.7058824, 1, 1,
0.06613936, 0.3482445, 1.768198, 0, 0.6980392, 1, 1,
0.06645408, 1.445023, 1.081468, 0, 0.6941177, 1, 1,
0.06676518, 1.201988, -1.116037, 0, 0.6862745, 1, 1,
0.06996351, -0.4309035, 1.234963, 0, 0.682353, 1, 1,
0.07000502, -0.199346, 3.846973, 0, 0.6745098, 1, 1,
0.07064278, -1.366142, 4.360145, 0, 0.6705883, 1, 1,
0.07596154, 1.712894, 1.755335, 0, 0.6627451, 1, 1,
0.07980856, 1.385575, -1.019614, 0, 0.6588235, 1, 1,
0.07982858, -0.06682019, 4.025001, 0, 0.6509804, 1, 1,
0.08297875, -0.3720834, 3.698134, 0, 0.6470588, 1, 1,
0.0845843, -0.6134142, 2.995131, 0, 0.6392157, 1, 1,
0.08484114, 0.2770525, -0.01834727, 0, 0.6352941, 1, 1,
0.08807696, -0.7279358, 3.434546, 0, 0.627451, 1, 1,
0.09055766, -1.068441, 3.976999, 0, 0.6235294, 1, 1,
0.09201721, 0.5195882, 0.6104069, 0, 0.6156863, 1, 1,
0.1007073, -0.1106675, 1.693208, 0, 0.6117647, 1, 1,
0.1070174, -2.075336, 4.544025, 0, 0.6039216, 1, 1,
0.1074088, 0.7005457, 0.3398534, 0, 0.5960785, 1, 1,
0.1114669, 1.217429, -0.05739973, 0, 0.5921569, 1, 1,
0.1123935, -0.225297, 2.87281, 0, 0.5843138, 1, 1,
0.1165713, 1.576689, 0.7514769, 0, 0.5803922, 1, 1,
0.1215576, 0.4022784, -0.008828783, 0, 0.572549, 1, 1,
0.122488, 0.6109233, -0.1203855, 0, 0.5686275, 1, 1,
0.1231453, 0.1244374, 0.4477535, 0, 0.5607843, 1, 1,
0.1252038, 0.4077141, -0.9011543, 0, 0.5568628, 1, 1,
0.1305011, 0.4200809, 1.813506, 0, 0.5490196, 1, 1,
0.1344396, 1.122152, 0.1699361, 0, 0.5450981, 1, 1,
0.1474696, -0.05024557, 1.318602, 0, 0.5372549, 1, 1,
0.1479254, -0.8739462, 3.001477, 0, 0.5333334, 1, 1,
0.1482603, -1.520528, 2.988415, 0, 0.5254902, 1, 1,
0.1482996, -0.7456584, 2.205333, 0, 0.5215687, 1, 1,
0.148465, 1.148047, 1.314159, 0, 0.5137255, 1, 1,
0.151742, -0.807191, 1.785593, 0, 0.509804, 1, 1,
0.1551118, -1.214696, 4.303022, 0, 0.5019608, 1, 1,
0.1610629, 1.49941, 2.008967, 0, 0.4941176, 1, 1,
0.1616643, 0.07755465, 3.328769, 0, 0.4901961, 1, 1,
0.1621941, 2.439277, -1.240927, 0, 0.4823529, 1, 1,
0.1774586, -0.8618201, 1.366379, 0, 0.4784314, 1, 1,
0.1790762, -0.3227314, 3.014685, 0, 0.4705882, 1, 1,
0.1802956, -1.270091, 2.86368, 0, 0.4666667, 1, 1,
0.1833541, -0.09249387, 3.570766, 0, 0.4588235, 1, 1,
0.1960255, 0.1595903, 1.06661, 0, 0.454902, 1, 1,
0.1984422, -0.7467332, 1.428683, 0, 0.4470588, 1, 1,
0.1993724, -1.082098, 4.339672, 0, 0.4431373, 1, 1,
0.2119416, 0.4520085, 0.3185024, 0, 0.4352941, 1, 1,
0.2146437, 0.2041216, 2.624061, 0, 0.4313726, 1, 1,
0.2164723, -0.1174691, 0.05582375, 0, 0.4235294, 1, 1,
0.2210814, 0.236259, 1.560661, 0, 0.4196078, 1, 1,
0.2283806, -0.4237031, 3.890067, 0, 0.4117647, 1, 1,
0.2329656, 0.1530111, 1.05065, 0, 0.4078431, 1, 1,
0.2396762, -0.5082814, 4.891149, 0, 0.4, 1, 1,
0.2445286, -1.302495, 3.135041, 0, 0.3921569, 1, 1,
0.2464034, 0.575622, 1.33401, 0, 0.3882353, 1, 1,
0.2506282, 0.2244194, 0.2169527, 0, 0.3803922, 1, 1,
0.2552431, -2.141384, 3.608122, 0, 0.3764706, 1, 1,
0.2596302, 0.6272311, 1.746366, 0, 0.3686275, 1, 1,
0.2612722, -0.1118471, 3.177585, 0, 0.3647059, 1, 1,
0.264107, -0.3670168, 2.193401, 0, 0.3568628, 1, 1,
0.2649357, -0.1547684, 2.415446, 0, 0.3529412, 1, 1,
0.2678785, -0.3834679, 1.970884, 0, 0.345098, 1, 1,
0.2697909, 2.248423, 0.2873672, 0, 0.3411765, 1, 1,
0.2736202, 0.03663858, 3.635235, 0, 0.3333333, 1, 1,
0.2755515, -1.018938, 3.390017, 0, 0.3294118, 1, 1,
0.2818518, 0.6123224, -0.7213448, 0, 0.3215686, 1, 1,
0.2828346, 0.7715335, -0.259704, 0, 0.3176471, 1, 1,
0.2851617, -0.8764024, 2.451009, 0, 0.3098039, 1, 1,
0.2852618, 0.04109596, 2.015056, 0, 0.3058824, 1, 1,
0.2857871, -1.632735, 3.443273, 0, 0.2980392, 1, 1,
0.2884519, -0.2689866, 3.917872, 0, 0.2901961, 1, 1,
0.2889183, -1.33448, 4.776832, 0, 0.2862745, 1, 1,
0.2899475, 0.3310696, -0.2359461, 0, 0.2784314, 1, 1,
0.2904628, -1.394201, 4.019432, 0, 0.2745098, 1, 1,
0.2953601, 1.546675, 0.7298452, 0, 0.2666667, 1, 1,
0.2958318, 1.325199, 0.3341332, 0, 0.2627451, 1, 1,
0.3033384, -0.9710531, 4.3799, 0, 0.254902, 1, 1,
0.3035026, 1.08069, 0.9637214, 0, 0.2509804, 1, 1,
0.304911, 0.1637193, 0.9392727, 0, 0.2431373, 1, 1,
0.3063829, 0.158593, 1.210043, 0, 0.2392157, 1, 1,
0.3119553, 0.5828309, 1.618417, 0, 0.2313726, 1, 1,
0.3132106, -0.479977, 1.773484, 0, 0.227451, 1, 1,
0.3147281, 1.794433, 1.533967, 0, 0.2196078, 1, 1,
0.3154789, -0.5853556, 1.66906, 0, 0.2156863, 1, 1,
0.3173496, 0.3058024, 2.205051, 0, 0.2078431, 1, 1,
0.3177784, 1.070126, 0.3576188, 0, 0.2039216, 1, 1,
0.31844, 1.717112, -0.2032955, 0, 0.1960784, 1, 1,
0.3213803, 1.824281, -1.50031, 0, 0.1882353, 1, 1,
0.3229411, 1.214821, 0.2430534, 0, 0.1843137, 1, 1,
0.3250458, -0.525361, 3.854149, 0, 0.1764706, 1, 1,
0.3251585, 0.08383942, 2.303982, 0, 0.172549, 1, 1,
0.3254865, 1.084552, 0.3143145, 0, 0.1647059, 1, 1,
0.326896, 1.105097, 0.9333028, 0, 0.1607843, 1, 1,
0.3378079, 1.086374, 1.673243, 0, 0.1529412, 1, 1,
0.3383203, -0.8833739, 3.44012, 0, 0.1490196, 1, 1,
0.3391379, 0.04832373, 2.305467, 0, 0.1411765, 1, 1,
0.340889, 1.683472, 0.01999865, 0, 0.1372549, 1, 1,
0.3417787, -0.2002194, 0.2640163, 0, 0.1294118, 1, 1,
0.3420722, -0.6283504, 0.8559129, 0, 0.1254902, 1, 1,
0.3441348, -0.3158606, 2.492147, 0, 0.1176471, 1, 1,
0.3445521, 0.2740166, 0.2841096, 0, 0.1137255, 1, 1,
0.3461566, -0.5609854, 2.285889, 0, 0.1058824, 1, 1,
0.3472354, -0.004602563, 1.554732, 0, 0.09803922, 1, 1,
0.3520794, 0.8002673, 1.173605, 0, 0.09411765, 1, 1,
0.3524548, -0.2114174, 2.110734, 0, 0.08627451, 1, 1,
0.3528554, 1.394485, 1.311816, 0, 0.08235294, 1, 1,
0.3539102, 0.6968554, 1.008145, 0, 0.07450981, 1, 1,
0.3550334, -0.2029563, 1.686388, 0, 0.07058824, 1, 1,
0.3573515, -0.006190237, 2.038042, 0, 0.0627451, 1, 1,
0.3586489, 0.2619262, 1.364777, 0, 0.05882353, 1, 1,
0.3606289, 0.1321245, -1.301239, 0, 0.05098039, 1, 1,
0.3629599, 0.2568207, 1.236764, 0, 0.04705882, 1, 1,
0.3684147, 0.2589074, 1.114198, 0, 0.03921569, 1, 1,
0.3700199, 0.7623408, 0.3379707, 0, 0.03529412, 1, 1,
0.3729344, -0.5043558, 2.696157, 0, 0.02745098, 1, 1,
0.3759144, -0.01006671, 3.408144, 0, 0.02352941, 1, 1,
0.3784548, -0.2419351, 1.368707, 0, 0.01568628, 1, 1,
0.3835243, -1.705254, 2.917279, 0, 0.01176471, 1, 1,
0.3835727, 0.4869754, -0.07914948, 0, 0.003921569, 1, 1,
0.3842104, -0.6918249, 3.37699, 0.003921569, 0, 1, 1,
0.3923975, 1.946795, -0.2307039, 0.007843138, 0, 1, 1,
0.3981465, -1.992131, 4.978785, 0.01568628, 0, 1, 1,
0.3995102, 1.687134, 0.09910204, 0.01960784, 0, 1, 1,
0.4114389, -0.5982565, 2.948236, 0.02745098, 0, 1, 1,
0.4114499, -0.2581501, 2.417856, 0.03137255, 0, 1, 1,
0.4177165, -0.03893734, 1.965255, 0.03921569, 0, 1, 1,
0.4216554, -1.651682, 2.604697, 0.04313726, 0, 1, 1,
0.4234572, 1.32288, -0.584236, 0.05098039, 0, 1, 1,
0.4323827, 1.11336, 0.08678, 0.05490196, 0, 1, 1,
0.4345802, -0.1811168, 2.452463, 0.0627451, 0, 1, 1,
0.4345973, -1.263586, 2.587784, 0.06666667, 0, 1, 1,
0.4349976, 0.06932468, 2.010399, 0.07450981, 0, 1, 1,
0.4363227, 0.07703017, 2.485583, 0.07843138, 0, 1, 1,
0.4366474, -0.8169726, 3.177554, 0.08627451, 0, 1, 1,
0.4383873, -1.763014, 1.646638, 0.09019608, 0, 1, 1,
0.4395197, 0.815433, -0.4546896, 0.09803922, 0, 1, 1,
0.4396763, -0.2749943, 1.306293, 0.1058824, 0, 1, 1,
0.4402974, 2.08661, 0.967405, 0.1098039, 0, 1, 1,
0.4431253, -3.194293, 2.251883, 0.1176471, 0, 1, 1,
0.4465673, -0.4995599, 2.524107, 0.1215686, 0, 1, 1,
0.4472093, -0.1473089, 1.820078, 0.1294118, 0, 1, 1,
0.4495001, -0.9998907, 1.35527, 0.1333333, 0, 1, 1,
0.4495741, -0.1699514, 2.694297, 0.1411765, 0, 1, 1,
0.4503943, -0.08830173, 2.898856, 0.145098, 0, 1, 1,
0.4557399, -0.6999853, 2.70527, 0.1529412, 0, 1, 1,
0.4557902, -0.323986, 2.619184, 0.1568628, 0, 1, 1,
0.4560553, 1.110702, 1.566171, 0.1647059, 0, 1, 1,
0.4600925, -0.07715715, 3.699861, 0.1686275, 0, 1, 1,
0.4607731, 0.6316297, 3.104806, 0.1764706, 0, 1, 1,
0.4616217, -0.1033914, 2.621524, 0.1803922, 0, 1, 1,
0.462889, -0.6063904, 0.7536516, 0.1882353, 0, 1, 1,
0.4724239, -0.7682292, 3.684629, 0.1921569, 0, 1, 1,
0.4735487, 0.915805, -0.4474407, 0.2, 0, 1, 1,
0.4741862, -1.249992, 3.129886, 0.2078431, 0, 1, 1,
0.4751263, -1.103637, 2.097408, 0.2117647, 0, 1, 1,
0.4758996, 1.245804, -0.506476, 0.2196078, 0, 1, 1,
0.4770295, 0.7088857, 0.1914324, 0.2235294, 0, 1, 1,
0.4811425, 0.9437593, -0.0825934, 0.2313726, 0, 1, 1,
0.4815268, -1.260024, 1.666232, 0.2352941, 0, 1, 1,
0.4826516, 1.016908, 0.1182367, 0.2431373, 0, 1, 1,
0.4837031, -2.11315, 3.292666, 0.2470588, 0, 1, 1,
0.4847006, 0.00648559, 2.104424, 0.254902, 0, 1, 1,
0.48502, 1.586488, -2.585418, 0.2588235, 0, 1, 1,
0.4911128, -0.3981718, 3.132352, 0.2666667, 0, 1, 1,
0.4916281, -2.211957, 4.503522, 0.2705882, 0, 1, 1,
0.4919818, -0.7539891, 3.455713, 0.2784314, 0, 1, 1,
0.4939362, 0.1194306, 0.3563477, 0.282353, 0, 1, 1,
0.495089, -0.667783, 2.388402, 0.2901961, 0, 1, 1,
0.4980354, 1.089637, 2.5138, 0.2941177, 0, 1, 1,
0.49877, 1.414666, -0.2624489, 0.3019608, 0, 1, 1,
0.500235, 0.5713965, -0.05761869, 0.3098039, 0, 1, 1,
0.5009432, -2.292813, 3.163959, 0.3137255, 0, 1, 1,
0.5016754, 1.46947, 2.165945, 0.3215686, 0, 1, 1,
0.5036861, -0.8478282, 3.101729, 0.3254902, 0, 1, 1,
0.5056035, 0.4657252, -0.2853454, 0.3333333, 0, 1, 1,
0.5063462, 1.585772, 0.4687883, 0.3372549, 0, 1, 1,
0.5073915, 0.4977354, 0.6131619, 0.345098, 0, 1, 1,
0.5085081, 0.303574, 0.8873712, 0.3490196, 0, 1, 1,
0.5096886, -1.710466, 3.032383, 0.3568628, 0, 1, 1,
0.5101148, -1.875578, 2.707321, 0.3607843, 0, 1, 1,
0.5139285, 0.6081328, -0.1220096, 0.3686275, 0, 1, 1,
0.5172594, 0.6607645, -0.2275755, 0.372549, 0, 1, 1,
0.5193188, 1.437487, -1.044942, 0.3803922, 0, 1, 1,
0.5220579, -2.520153, 1.632952, 0.3843137, 0, 1, 1,
0.5272085, -0.03251106, 3.244184, 0.3921569, 0, 1, 1,
0.5292768, -0.1212873, 2.307396, 0.3960784, 0, 1, 1,
0.5301105, 1.087068, 0.004746871, 0.4039216, 0, 1, 1,
0.5336502, -0.06463866, 1.215743, 0.4117647, 0, 1, 1,
0.5345728, -0.1836691, 2.212759, 0.4156863, 0, 1, 1,
0.5374551, -0.6227986, 4.506644, 0.4235294, 0, 1, 1,
0.5375034, 0.5373741, 0.6392186, 0.427451, 0, 1, 1,
0.5403284, -0.9281825, 1.51723, 0.4352941, 0, 1, 1,
0.5405057, -1.904121, 4.329593, 0.4392157, 0, 1, 1,
0.5424312, -1.29516, 1.310021, 0.4470588, 0, 1, 1,
0.5429261, 1.392976, -0.4523947, 0.4509804, 0, 1, 1,
0.5445566, -0.2582773, 1.603272, 0.4588235, 0, 1, 1,
0.5485415, 0.9323389, -1.18833, 0.4627451, 0, 1, 1,
0.5485629, 0.2950402, 1.766574, 0.4705882, 0, 1, 1,
0.5499526, -1.136999, 4.366445, 0.4745098, 0, 1, 1,
0.5555405, 1.091444, 0.6940871, 0.4823529, 0, 1, 1,
0.5590006, 0.367395, 1.893487, 0.4862745, 0, 1, 1,
0.5629669, 0.0116856, 3.121286, 0.4941176, 0, 1, 1,
0.5805203, -0.9127427, 3.355996, 0.5019608, 0, 1, 1,
0.5815351, 0.3472472, 1.851747, 0.5058824, 0, 1, 1,
0.5820071, 1.19397, 0.1810692, 0.5137255, 0, 1, 1,
0.5833159, 2.235648, 0.309403, 0.5176471, 0, 1, 1,
0.6002256, -0.496192, 2.3299, 0.5254902, 0, 1, 1,
0.6031586, -0.8934664, 3.352939, 0.5294118, 0, 1, 1,
0.6082225, 1.226734, -1.726639, 0.5372549, 0, 1, 1,
0.6096214, -0.2617385, -0.4929026, 0.5411765, 0, 1, 1,
0.6130207, -1.246453, 2.186747, 0.5490196, 0, 1, 1,
0.6136512, 0.0495568, 1.08097, 0.5529412, 0, 1, 1,
0.6164864, -0.3410543, 1.149827, 0.5607843, 0, 1, 1,
0.6168539, 0.4571662, 0.6987212, 0.5647059, 0, 1, 1,
0.6168776, -2.200276, 0.7716736, 0.572549, 0, 1, 1,
0.6176841, 0.5286217, 1.352018, 0.5764706, 0, 1, 1,
0.6190441, 1.518344, -2.529589, 0.5843138, 0, 1, 1,
0.6209149, -1.770531, 3.45651, 0.5882353, 0, 1, 1,
0.6233491, -0.2511673, 2.005412, 0.5960785, 0, 1, 1,
0.6281847, -0.4401079, 1.843569, 0.6039216, 0, 1, 1,
0.6282296, 1.000068, 2.251242, 0.6078432, 0, 1, 1,
0.6283014, -1.412714, 3.571653, 0.6156863, 0, 1, 1,
0.6294408, -0.6975694, 1.385956, 0.6196079, 0, 1, 1,
0.6307084, 0.2872191, 1.202489, 0.627451, 0, 1, 1,
0.6307102, 0.1526566, 1.396057, 0.6313726, 0, 1, 1,
0.6314847, 0.819751, 0.8491519, 0.6392157, 0, 1, 1,
0.6317565, 0.3767777, 4.117338, 0.6431373, 0, 1, 1,
0.6385417, -2.609591, 2.103065, 0.6509804, 0, 1, 1,
0.6387084, 0.349637, 0.5789326, 0.654902, 0, 1, 1,
0.6411992, -0.1707446, 1.103341, 0.6627451, 0, 1, 1,
0.6424538, 1.129035, 1.28968, 0.6666667, 0, 1, 1,
0.642793, -0.5571526, 3.992879, 0.6745098, 0, 1, 1,
0.6481006, -0.156833, 2.440056, 0.6784314, 0, 1, 1,
0.6634013, 0.1668603, 2.733993, 0.6862745, 0, 1, 1,
0.6642393, -0.2040426, 1.190973, 0.6901961, 0, 1, 1,
0.6651921, 0.7550198, 0.131196, 0.6980392, 0, 1, 1,
0.6663765, 1.56087, 2.603701, 0.7058824, 0, 1, 1,
0.6669624, 0.9462191, 0.7265013, 0.7098039, 0, 1, 1,
0.6706929, -1.140468, 1.451102, 0.7176471, 0, 1, 1,
0.6731808, 1.116245, 1.515105, 0.7215686, 0, 1, 1,
0.6768318, -0.9049006, 3.084801, 0.7294118, 0, 1, 1,
0.6869167, 0.7294806, 0.968604, 0.7333333, 0, 1, 1,
0.6891669, 1.100968, 2.34996, 0.7411765, 0, 1, 1,
0.7005777, -0.1236147, 0.4049939, 0.7450981, 0, 1, 1,
0.7006003, 1.039826, 0.4724127, 0.7529412, 0, 1, 1,
0.7008196, 0.270923, 0.1721191, 0.7568628, 0, 1, 1,
0.7032179, -1.102023, 4.586181, 0.7647059, 0, 1, 1,
0.7049379, 0.02923208, 0.2549267, 0.7686275, 0, 1, 1,
0.7062519, -1.897472, 3.827089, 0.7764706, 0, 1, 1,
0.7084301, -0.1413771, 2.300323, 0.7803922, 0, 1, 1,
0.7148268, -0.1506159, 0.3762994, 0.7882353, 0, 1, 1,
0.7153841, -1.608991, 3.049996, 0.7921569, 0, 1, 1,
0.719605, 0.05001269, 3.173457, 0.8, 0, 1, 1,
0.7287815, 1.309748, 0.4198679, 0.8078431, 0, 1, 1,
0.7311761, -0.6424273, -0.03687907, 0.8117647, 0, 1, 1,
0.7318934, -0.4144225, 3.601073, 0.8196079, 0, 1, 1,
0.7323643, -0.5233417, 3.056651, 0.8235294, 0, 1, 1,
0.7381331, -1.579297, 3.400325, 0.8313726, 0, 1, 1,
0.7396832, 0.5470842, 1.241655, 0.8352941, 0, 1, 1,
0.7589357, 0.02748688, 2.289814, 0.8431373, 0, 1, 1,
0.759709, -0.6485818, 0.2191673, 0.8470588, 0, 1, 1,
0.7633426, 0.789555, -0.7395818, 0.854902, 0, 1, 1,
0.7667312, 0.7281252, -1.203397, 0.8588235, 0, 1, 1,
0.7683589, -0.2140099, 1.88565, 0.8666667, 0, 1, 1,
0.7684918, 0.4614842, 0.1027158, 0.8705882, 0, 1, 1,
0.7728992, 0.6358123, 0.9233087, 0.8784314, 0, 1, 1,
0.7729003, 1.573148, -0.1589983, 0.8823529, 0, 1, 1,
0.7733812, 1.307817, 1.863682, 0.8901961, 0, 1, 1,
0.7805131, -0.7481844, 0.5539321, 0.8941177, 0, 1, 1,
0.7847477, -0.9817587, 1.866759, 0.9019608, 0, 1, 1,
0.7902605, -1.783166, 2.682113, 0.9098039, 0, 1, 1,
0.7909847, -0.9949111, 2.897668, 0.9137255, 0, 1, 1,
0.7987827, -1.048451, 3.158442, 0.9215686, 0, 1, 1,
0.8014337, -0.6102021, 3.024422, 0.9254902, 0, 1, 1,
0.8055777, -1.200427, 2.351355, 0.9333333, 0, 1, 1,
0.8099461, 0.1820989, 3.320899, 0.9372549, 0, 1, 1,
0.8160474, 0.2322789, 2.174752, 0.945098, 0, 1, 1,
0.8201113, 1.203792, 0.2788418, 0.9490196, 0, 1, 1,
0.8207718, -0.08735666, 3.511094, 0.9568627, 0, 1, 1,
0.824205, 0.348483, 2.580965, 0.9607843, 0, 1, 1,
0.8248203, 0.2228342, 0.6036861, 0.9686275, 0, 1, 1,
0.8289022, -0.1369433, 0.4787519, 0.972549, 0, 1, 1,
0.8310577, 0.5314119, -0.2481336, 0.9803922, 0, 1, 1,
0.832283, -0.7184042, 3.3465, 0.9843137, 0, 1, 1,
0.8342882, 1.419835, 0.1413752, 0.9921569, 0, 1, 1,
0.8396485, 0.4016486, 1.41899, 0.9960784, 0, 1, 1,
0.8400787, 0.543844, 2.315564, 1, 0, 0.9960784, 1,
0.8453515, -0.03857672, 1.178822, 1, 0, 0.9882353, 1,
0.8504945, 0.1535491, 1.128854, 1, 0, 0.9843137, 1,
0.8551503, -0.4179392, 1.078689, 1, 0, 0.9764706, 1,
0.8575687, -0.08975776, 1.379597, 1, 0, 0.972549, 1,
0.8638104, -0.3206842, 1.606224, 1, 0, 0.9647059, 1,
0.8826201, 0.2608452, 1.589522, 1, 0, 0.9607843, 1,
0.8860029, 1.467096, 1.009951, 1, 0, 0.9529412, 1,
0.8874915, 0.1260029, 2.779257, 1, 0, 0.9490196, 1,
0.8876629, -1.553143, 3.236259, 1, 0, 0.9411765, 1,
0.891087, -0.05839908, 1.205263, 1, 0, 0.9372549, 1,
0.8944348, -0.7491526, 3.067818, 1, 0, 0.9294118, 1,
0.9114913, -1.176637, 4.911397, 1, 0, 0.9254902, 1,
0.9142049, 0.09915886, -0.05545868, 1, 0, 0.9176471, 1,
0.9163898, -1.370585, 2.155162, 1, 0, 0.9137255, 1,
0.9198316, -1.53337, 2.543883, 1, 0, 0.9058824, 1,
0.9211645, -1.644593, 3.423166, 1, 0, 0.9019608, 1,
0.9261082, 0.7948706, 0.9018618, 1, 0, 0.8941177, 1,
0.930592, 0.3730975, 1.925129, 1, 0, 0.8862745, 1,
0.9427306, 1.245606, 1.021204, 1, 0, 0.8823529, 1,
0.9455147, 0.02109326, 2.116162, 1, 0, 0.8745098, 1,
0.9485927, 0.2809727, 0.4155349, 1, 0, 0.8705882, 1,
0.9547735, 0.7365534, 2.009041, 1, 0, 0.8627451, 1,
0.9551809, 0.6933709, 1.773254, 1, 0, 0.8588235, 1,
0.9693305, 0.5787398, 2.090134, 1, 0, 0.8509804, 1,
0.9736344, -0.4367324, 1.534772, 1, 0, 0.8470588, 1,
0.9787433, -1.174685, 2.558739, 1, 0, 0.8392157, 1,
0.9824815, 0.499303, 1.633804, 1, 0, 0.8352941, 1,
0.9888368, 1.821095, 0.2835689, 1, 0, 0.827451, 1,
0.996352, -0.4767396, 2.44534, 1, 0, 0.8235294, 1,
0.9979275, 0.797156, -0.1876034, 1, 0, 0.8156863, 1,
0.9981799, -1.212804, 2.596944, 1, 0, 0.8117647, 1,
1.023055, 0.3871453, 1.014226, 1, 0, 0.8039216, 1,
1.02462, 1.096231, -0.07285868, 1, 0, 0.7960784, 1,
1.024777, 1.357023, 1.685678, 1, 0, 0.7921569, 1,
1.028708, 0.2592557, 1.049142, 1, 0, 0.7843137, 1,
1.038892, -0.6160803, 1.056756, 1, 0, 0.7803922, 1,
1.040296, -0.07526852, 1.585855, 1, 0, 0.772549, 1,
1.044024, -0.7012464, 1.219293, 1, 0, 0.7686275, 1,
1.050578, -0.0456892, 0.6661857, 1, 0, 0.7607843, 1,
1.061692, -1.843873, 2.670448, 1, 0, 0.7568628, 1,
1.061901, 0.5458586, -0.1182387, 1, 0, 0.7490196, 1,
1.065449, 0.0959352, 2.158113, 1, 0, 0.7450981, 1,
1.067528, -1.206895, 2.131962, 1, 0, 0.7372549, 1,
1.06908, 0.4929016, 1.336768, 1, 0, 0.7333333, 1,
1.070885, -1.039122, 4.108591, 1, 0, 0.7254902, 1,
1.074528, -1.43004, 2.296623, 1, 0, 0.7215686, 1,
1.097052, 0.06661479, 1.894061, 1, 0, 0.7137255, 1,
1.117734, -0.6848455, 1.553296, 1, 0, 0.7098039, 1,
1.130323, 0.431632, 1.019971, 1, 0, 0.7019608, 1,
1.136858, 1.098638, 1.657622, 1, 0, 0.6941177, 1,
1.147235, -0.5224417, 2.110227, 1, 0, 0.6901961, 1,
1.154016, 0.06370603, 1.42722, 1, 0, 0.682353, 1,
1.154594, 1.419423, 1.261565, 1, 0, 0.6784314, 1,
1.155806, -0.8493884, 1.957221, 1, 0, 0.6705883, 1,
1.157412, 0.9820879, 0.7335626, 1, 0, 0.6666667, 1,
1.160093, 1.472811, 0.2759995, 1, 0, 0.6588235, 1,
1.160756, 0.4589383, 1.927293, 1, 0, 0.654902, 1,
1.162173, -0.06826374, 2.41648, 1, 0, 0.6470588, 1,
1.16347, -1.370326, 2.734103, 1, 0, 0.6431373, 1,
1.175213, 1.900199, -0.4751929, 1, 0, 0.6352941, 1,
1.183122, 0.1948808, 0.4638431, 1, 0, 0.6313726, 1,
1.186061, 1.090278, 1.116715, 1, 0, 0.6235294, 1,
1.220573, 1.141696, -0.04288901, 1, 0, 0.6196079, 1,
1.230592, -1.88836, -0.4589887, 1, 0, 0.6117647, 1,
1.235473, -0.2046649, 1.437585, 1, 0, 0.6078432, 1,
1.246081, 0.627608, 2.046951, 1, 0, 0.6, 1,
1.24613, -0.07615028, 0.7859939, 1, 0, 0.5921569, 1,
1.246153, -0.1221162, 1.666583, 1, 0, 0.5882353, 1,
1.25035, 0.3598238, 1.177726, 1, 0, 0.5803922, 1,
1.257267, 0.02698304, 0.784301, 1, 0, 0.5764706, 1,
1.272532, 0.5641689, 1.311022, 1, 0, 0.5686275, 1,
1.278333, -1.67816, 2.681004, 1, 0, 0.5647059, 1,
1.31206, 0.04459855, 1.202261, 1, 0, 0.5568628, 1,
1.315424, 0.6097807, 0.9597869, 1, 0, 0.5529412, 1,
1.316168, -0.4073741, 1.877916, 1, 0, 0.5450981, 1,
1.318799, -0.9177865, 3.567945, 1, 0, 0.5411765, 1,
1.320476, 0.6310927, 2.27013, 1, 0, 0.5333334, 1,
1.32381, 0.7102557, 3.003071, 1, 0, 0.5294118, 1,
1.33156, 0.08835024, 0.4522587, 1, 0, 0.5215687, 1,
1.332317, 0.2864855, -0.167423, 1, 0, 0.5176471, 1,
1.340629, -0.3457579, 0.64601, 1, 0, 0.509804, 1,
1.36552, -1.894384, 1.294867, 1, 0, 0.5058824, 1,
1.370031, -1.490067, 2.793903, 1, 0, 0.4980392, 1,
1.389706, 1.017714, 1.10338, 1, 0, 0.4901961, 1,
1.408489, -1.097737, 2.372035, 1, 0, 0.4862745, 1,
1.410143, -1.358713, 3.427934, 1, 0, 0.4784314, 1,
1.421263, 0.1319122, 0.9829297, 1, 0, 0.4745098, 1,
1.424027, -1.303788, 4.078841, 1, 0, 0.4666667, 1,
1.433374, 0.8920679, 2.627481, 1, 0, 0.4627451, 1,
1.438783, -1.763953, 3.699559, 1, 0, 0.454902, 1,
1.443733, -1.063527, 4.654658, 1, 0, 0.4509804, 1,
1.452942, -1.07301, 3.212726, 1, 0, 0.4431373, 1,
1.453614, 0.3361526, 0.3664016, 1, 0, 0.4392157, 1,
1.462345, 0.3259195, 2.022911, 1, 0, 0.4313726, 1,
1.463702, 0.8877856, -0.7490096, 1, 0, 0.427451, 1,
1.46376, -1.648747, 0.8533621, 1, 0, 0.4196078, 1,
1.464994, 0.2200317, 0.4094163, 1, 0, 0.4156863, 1,
1.480912, -0.1121448, 2.238931, 1, 0, 0.4078431, 1,
1.484859, 1.759979, 1.925907, 1, 0, 0.4039216, 1,
1.489721, -0.9262082, 2.336125, 1, 0, 0.3960784, 1,
1.492241, -1.205426, 3.597435, 1, 0, 0.3882353, 1,
1.493033, 1.153524, -0.4062019, 1, 0, 0.3843137, 1,
1.502679, -0.4172809, 1.951775, 1, 0, 0.3764706, 1,
1.503703, -1.236084, 1.958, 1, 0, 0.372549, 1,
1.524783, -1.783455, 2.853638, 1, 0, 0.3647059, 1,
1.539841, 1.147358, 0.7885412, 1, 0, 0.3607843, 1,
1.549609, -0.2076232, 1.626754, 1, 0, 0.3529412, 1,
1.549712, -0.341528, 3.691116, 1, 0, 0.3490196, 1,
1.558002, 0.4933139, 1.350996, 1, 0, 0.3411765, 1,
1.567738, 1.051003, 1.538058, 1, 0, 0.3372549, 1,
1.574137, 0.1986251, 2.174112, 1, 0, 0.3294118, 1,
1.577605, 0.1211308, 2.079502, 1, 0, 0.3254902, 1,
1.57787, 0.9346319, 0.5231518, 1, 0, 0.3176471, 1,
1.600713, -0.272103, 2.709074, 1, 0, 0.3137255, 1,
1.600731, 1.183398, -0.1858734, 1, 0, 0.3058824, 1,
1.627891, -1.723567, 2.013885, 1, 0, 0.2980392, 1,
1.635884, -1.450292, 2.747495, 1, 0, 0.2941177, 1,
1.638655, -2.210779, 4.106513, 1, 0, 0.2862745, 1,
1.640517, 0.06233971, 1.807909, 1, 0, 0.282353, 1,
1.641359, 0.2678552, 2.686462, 1, 0, 0.2745098, 1,
1.657367, -1.071714, 3.165678, 1, 0, 0.2705882, 1,
1.668707, 0.6287035, 1.262737, 1, 0, 0.2627451, 1,
1.69263, -0.1991648, 2.297908, 1, 0, 0.2588235, 1,
1.700067, -0.5041894, 2.198757, 1, 0, 0.2509804, 1,
1.704013, -0.8497635, 2.927216, 1, 0, 0.2470588, 1,
1.73051, 0.05034485, 1.870778, 1, 0, 0.2392157, 1,
1.749502, -1.215921, 2.834206, 1, 0, 0.2352941, 1,
1.755304, -0.2280103, 1.188547, 1, 0, 0.227451, 1,
1.763865, 0.5655518, 1.588482, 1, 0, 0.2235294, 1,
1.770268, 0.03788934, 2.667208, 1, 0, 0.2156863, 1,
1.770308, 0.2138088, 2.085618, 1, 0, 0.2117647, 1,
1.774686, 0.1561613, 1.778982, 1, 0, 0.2039216, 1,
1.806624, -0.2829046, 1.943631, 1, 0, 0.1960784, 1,
1.831142, 0.6584314, 2.666969, 1, 0, 0.1921569, 1,
1.855001, 0.5403787, 2.297163, 1, 0, 0.1843137, 1,
1.873919, -0.6419561, 3.290228, 1, 0, 0.1803922, 1,
1.891315, -0.1591826, 1.598066, 1, 0, 0.172549, 1,
1.897525, 0.8458397, 0.4912949, 1, 0, 0.1686275, 1,
1.903484, 0.6919994, 0.7593235, 1, 0, 0.1607843, 1,
1.914705, -0.1009056, 0.1888902, 1, 0, 0.1568628, 1,
1.916814, -0.5766672, 2.690685, 1, 0, 0.1490196, 1,
1.919329, 0.608702, 1.24912, 1, 0, 0.145098, 1,
1.929849, -0.8315514, 0.2888807, 1, 0, 0.1372549, 1,
1.943557, 0.5255007, 2.637054, 1, 0, 0.1333333, 1,
2.022794, 2.548119, 2.00219, 1, 0, 0.1254902, 1,
2.039956, 0.4456002, 0.3198987, 1, 0, 0.1215686, 1,
2.041064, 0.4372256, 1.123824, 1, 0, 0.1137255, 1,
2.069566, -0.216085, 1.27034, 1, 0, 0.1098039, 1,
2.081915, 1.680878, -0.3950219, 1, 0, 0.1019608, 1,
2.083027, 0.03067682, 0.3050386, 1, 0, 0.09411765, 1,
2.133745, 1.433996, -0.6401095, 1, 0, 0.09019608, 1,
2.142569, 0.660242, 1.93922, 1, 0, 0.08235294, 1,
2.211714, 1.162052, -0.6298882, 1, 0, 0.07843138, 1,
2.286277, 2.472202, 1.085958, 1, 0, 0.07058824, 1,
2.287125, 0.3841482, 1.053741, 1, 0, 0.06666667, 1,
2.288321, 1.511597, 1.307081, 1, 0, 0.05882353, 1,
2.30516, 0.7342713, 1.016419, 1, 0, 0.05490196, 1,
2.328763, 0.9565681, 1.38736, 1, 0, 0.04705882, 1,
2.443415, 1.088611, 0.8058316, 1, 0, 0.04313726, 1,
2.46124, -2.166007, 2.775635, 1, 0, 0.03529412, 1,
2.558466, -0.1007537, -0.09650237, 1, 0, 0.03137255, 1,
2.645195, 0.6716133, 0.7271464, 1, 0, 0.02352941, 1,
2.709539, -0.261121, 2.021688, 1, 0, 0.01960784, 1,
2.964369, -0.5544773, 2.532963, 1, 0, 0.01176471, 1,
2.969517, -0.8202515, 0.3335492, 1, 0, 0.007843138, 1
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
-0.07524455, -4.334189, -7.532691, 0, -0.5, 0.5, 0.5,
-0.07524455, -4.334189, -7.532691, 1, -0.5, 0.5, 0.5,
-0.07524455, -4.334189, -7.532691, 1, 1.5, 0.5, 0.5,
-0.07524455, -4.334189, -7.532691, 0, 1.5, 0.5, 0.5
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
-4.15218, 0.1682304, -7.532691, 0, -0.5, 0.5, 0.5,
-4.15218, 0.1682304, -7.532691, 1, -0.5, 0.5, 0.5,
-4.15218, 0.1682304, -7.532691, 1, 1.5, 0.5, 0.5,
-4.15218, 0.1682304, -7.532691, 0, 1.5, 0.5, 0.5
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
-4.15218, -4.334189, 0.2867634, 0, -0.5, 0.5, 0.5,
-4.15218, -4.334189, 0.2867634, 1, -0.5, 0.5, 0.5,
-4.15218, -4.334189, 0.2867634, 1, 1.5, 0.5, 0.5,
-4.15218, -4.334189, 0.2867634, 0, 1.5, 0.5, 0.5
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
-3, -3.295169, -5.728201,
2, -3.295169, -5.728201,
-3, -3.295169, -5.728201,
-3, -3.468339, -6.028949,
-2, -3.295169, -5.728201,
-2, -3.468339, -6.028949,
-1, -3.295169, -5.728201,
-1, -3.468339, -6.028949,
0, -3.295169, -5.728201,
0, -3.468339, -6.028949,
1, -3.295169, -5.728201,
1, -3.468339, -6.028949,
2, -3.295169, -5.728201,
2, -3.468339, -6.028949
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
-3, -3.814679, -6.630446, 0, -0.5, 0.5, 0.5,
-3, -3.814679, -6.630446, 1, -0.5, 0.5, 0.5,
-3, -3.814679, -6.630446, 1, 1.5, 0.5, 0.5,
-3, -3.814679, -6.630446, 0, 1.5, 0.5, 0.5,
-2, -3.814679, -6.630446, 0, -0.5, 0.5, 0.5,
-2, -3.814679, -6.630446, 1, -0.5, 0.5, 0.5,
-2, -3.814679, -6.630446, 1, 1.5, 0.5, 0.5,
-2, -3.814679, -6.630446, 0, 1.5, 0.5, 0.5,
-1, -3.814679, -6.630446, 0, -0.5, 0.5, 0.5,
-1, -3.814679, -6.630446, 1, -0.5, 0.5, 0.5,
-1, -3.814679, -6.630446, 1, 1.5, 0.5, 0.5,
-1, -3.814679, -6.630446, 0, 1.5, 0.5, 0.5,
0, -3.814679, -6.630446, 0, -0.5, 0.5, 0.5,
0, -3.814679, -6.630446, 1, -0.5, 0.5, 0.5,
0, -3.814679, -6.630446, 1, 1.5, 0.5, 0.5,
0, -3.814679, -6.630446, 0, 1.5, 0.5, 0.5,
1, -3.814679, -6.630446, 0, -0.5, 0.5, 0.5,
1, -3.814679, -6.630446, 1, -0.5, 0.5, 0.5,
1, -3.814679, -6.630446, 1, 1.5, 0.5, 0.5,
1, -3.814679, -6.630446, 0, 1.5, 0.5, 0.5,
2, -3.814679, -6.630446, 0, -0.5, 0.5, 0.5,
2, -3.814679, -6.630446, 1, -0.5, 0.5, 0.5,
2, -3.814679, -6.630446, 1, 1.5, 0.5, 0.5,
2, -3.814679, -6.630446, 0, 1.5, 0.5, 0.5
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
-3.211349, -3, -5.728201,
-3.211349, 3, -5.728201,
-3.211349, -3, -5.728201,
-3.368154, -3, -6.028949,
-3.211349, -2, -5.728201,
-3.368154, -2, -6.028949,
-3.211349, -1, -5.728201,
-3.368154, -1, -6.028949,
-3.211349, 0, -5.728201,
-3.368154, 0, -6.028949,
-3.211349, 1, -5.728201,
-3.368154, 1, -6.028949,
-3.211349, 2, -5.728201,
-3.368154, 2, -6.028949,
-3.211349, 3, -5.728201,
-3.368154, 3, -6.028949
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
-3.681764, -3, -6.630446, 0, -0.5, 0.5, 0.5,
-3.681764, -3, -6.630446, 1, -0.5, 0.5, 0.5,
-3.681764, -3, -6.630446, 1, 1.5, 0.5, 0.5,
-3.681764, -3, -6.630446, 0, 1.5, 0.5, 0.5,
-3.681764, -2, -6.630446, 0, -0.5, 0.5, 0.5,
-3.681764, -2, -6.630446, 1, -0.5, 0.5, 0.5,
-3.681764, -2, -6.630446, 1, 1.5, 0.5, 0.5,
-3.681764, -2, -6.630446, 0, 1.5, 0.5, 0.5,
-3.681764, -1, -6.630446, 0, -0.5, 0.5, 0.5,
-3.681764, -1, -6.630446, 1, -0.5, 0.5, 0.5,
-3.681764, -1, -6.630446, 1, 1.5, 0.5, 0.5,
-3.681764, -1, -6.630446, 0, 1.5, 0.5, 0.5,
-3.681764, 0, -6.630446, 0, -0.5, 0.5, 0.5,
-3.681764, 0, -6.630446, 1, -0.5, 0.5, 0.5,
-3.681764, 0, -6.630446, 1, 1.5, 0.5, 0.5,
-3.681764, 0, -6.630446, 0, 1.5, 0.5, 0.5,
-3.681764, 1, -6.630446, 0, -0.5, 0.5, 0.5,
-3.681764, 1, -6.630446, 1, -0.5, 0.5, 0.5,
-3.681764, 1, -6.630446, 1, 1.5, 0.5, 0.5,
-3.681764, 1, -6.630446, 0, 1.5, 0.5, 0.5,
-3.681764, 2, -6.630446, 0, -0.5, 0.5, 0.5,
-3.681764, 2, -6.630446, 1, -0.5, 0.5, 0.5,
-3.681764, 2, -6.630446, 1, 1.5, 0.5, 0.5,
-3.681764, 2, -6.630446, 0, 1.5, 0.5, 0.5,
-3.681764, 3, -6.630446, 0, -0.5, 0.5, 0.5,
-3.681764, 3, -6.630446, 1, -0.5, 0.5, 0.5,
-3.681764, 3, -6.630446, 1, 1.5, 0.5, 0.5,
-3.681764, 3, -6.630446, 0, 1.5, 0.5, 0.5
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
-3.211349, -3.295169, -4,
-3.211349, -3.295169, 6,
-3.211349, -3.295169, -4,
-3.368154, -3.468339, -4,
-3.211349, -3.295169, -2,
-3.368154, -3.468339, -2,
-3.211349, -3.295169, 0,
-3.368154, -3.468339, 0,
-3.211349, -3.295169, 2,
-3.368154, -3.468339, 2,
-3.211349, -3.295169, 4,
-3.368154, -3.468339, 4,
-3.211349, -3.295169, 6,
-3.368154, -3.468339, 6
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
-3.681764, -3.814679, -4, 0, -0.5, 0.5, 0.5,
-3.681764, -3.814679, -4, 1, -0.5, 0.5, 0.5,
-3.681764, -3.814679, -4, 1, 1.5, 0.5, 0.5,
-3.681764, -3.814679, -4, 0, 1.5, 0.5, 0.5,
-3.681764, -3.814679, -2, 0, -0.5, 0.5, 0.5,
-3.681764, -3.814679, -2, 1, -0.5, 0.5, 0.5,
-3.681764, -3.814679, -2, 1, 1.5, 0.5, 0.5,
-3.681764, -3.814679, -2, 0, 1.5, 0.5, 0.5,
-3.681764, -3.814679, 0, 0, -0.5, 0.5, 0.5,
-3.681764, -3.814679, 0, 1, -0.5, 0.5, 0.5,
-3.681764, -3.814679, 0, 1, 1.5, 0.5, 0.5,
-3.681764, -3.814679, 0, 0, 1.5, 0.5, 0.5,
-3.681764, -3.814679, 2, 0, -0.5, 0.5, 0.5,
-3.681764, -3.814679, 2, 1, -0.5, 0.5, 0.5,
-3.681764, -3.814679, 2, 1, 1.5, 0.5, 0.5,
-3.681764, -3.814679, 2, 0, 1.5, 0.5, 0.5,
-3.681764, -3.814679, 4, 0, -0.5, 0.5, 0.5,
-3.681764, -3.814679, 4, 1, -0.5, 0.5, 0.5,
-3.681764, -3.814679, 4, 1, 1.5, 0.5, 0.5,
-3.681764, -3.814679, 4, 0, 1.5, 0.5, 0.5,
-3.681764, -3.814679, 6, 0, -0.5, 0.5, 0.5,
-3.681764, -3.814679, 6, 1, -0.5, 0.5, 0.5,
-3.681764, -3.814679, 6, 1, 1.5, 0.5, 0.5,
-3.681764, -3.814679, 6, 0, 1.5, 0.5, 0.5
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
-3.211349, -3.295169, -5.728201,
-3.211349, 3.63163, -5.728201,
-3.211349, -3.295169, 6.301728,
-3.211349, 3.63163, 6.301728,
-3.211349, -3.295169, -5.728201,
-3.211349, -3.295169, 6.301728,
-3.211349, 3.63163, -5.728201,
-3.211349, 3.63163, 6.301728,
-3.211349, -3.295169, -5.728201,
3.06086, -3.295169, -5.728201,
-3.211349, -3.295169, 6.301728,
3.06086, -3.295169, 6.301728,
-3.211349, 3.63163, -5.728201,
3.06086, 3.63163, -5.728201,
-3.211349, 3.63163, 6.301728,
3.06086, 3.63163, 6.301728,
3.06086, -3.295169, -5.728201,
3.06086, 3.63163, -5.728201,
3.06086, -3.295169, 6.301728,
3.06086, 3.63163, 6.301728,
3.06086, -3.295169, -5.728201,
3.06086, -3.295169, 6.301728,
3.06086, 3.63163, -5.728201,
3.06086, 3.63163, 6.301728
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
var radius = 8.134057;
var distance = 36.18933;
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
mvMatrix.translate( 0.07524455, -0.1682304, -0.2867634 );
mvMatrix.scale( 1.40217, 1.269663, 0.7310684 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.18933);
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
Trimethylsulfonium<-read.table("Trimethylsulfonium.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Trimethylsulfonium$V2
```

```
## Error in eval(expr, envir, enclos): object 'Trimethylsulfonium' not found
```

```r
y<-Trimethylsulfonium$V3
```

```
## Error in eval(expr, envir, enclos): object 'Trimethylsulfonium' not found
```

```r
z<-Trimethylsulfonium$V4
```

```
## Error in eval(expr, envir, enclos): object 'Trimethylsulfonium' not found
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
-3.120006, -0.5117586, -1.489933, 0, 0, 1, 1, 1,
-2.768319, -0.2901939, -1.650423, 1, 0, 0, 1, 1,
-2.623158, 0.2904666, -0.4902279, 1, 0, 0, 1, 1,
-2.552455, -0.7002921, -2.017179, 1, 0, 0, 1, 1,
-2.420629, 0.7127256, 0.7866533, 1, 0, 0, 1, 1,
-2.414845, 0.5862889, -1.625044, 1, 0, 0, 1, 1,
-2.378116, 0.4802937, -1.928602, 0, 0, 0, 1, 1,
-2.366279, -0.0008818537, -1.865548, 0, 0, 0, 1, 1,
-2.364459, 0.39435, -1.075945, 0, 0, 0, 1, 1,
-2.349357, 0.7840993, -1.586205, 0, 0, 0, 1, 1,
-2.336853, -0.04699399, -3.233846, 0, 0, 0, 1, 1,
-2.309404, 0.9485165, 1.194891, 0, 0, 0, 1, 1,
-2.257981, 0.8283992, -0.7539295, 0, 0, 0, 1, 1,
-2.243159, -1.269879, -2.847111, 1, 1, 1, 1, 1,
-2.18193, 0.6901436, -1.302565, 1, 1, 1, 1, 1,
-2.163611, 0.4010675, -2.524381, 1, 1, 1, 1, 1,
-2.114306, 1.090214, -0.3070913, 1, 1, 1, 1, 1,
-2.090677, 3.530754, -0.7740878, 1, 1, 1, 1, 1,
-2.08733, 0.06532455, -3.070061, 1, 1, 1, 1, 1,
-2.066713, -0.1351358, -1.310884, 1, 1, 1, 1, 1,
-2.053926, 1.184578, -1.945902, 1, 1, 1, 1, 1,
-2.030731, 0.4260933, -1.068423, 1, 1, 1, 1, 1,
-2.022785, -1.060489, -1.130819, 1, 1, 1, 1, 1,
-2.016388, 0.3603397, -1.036476, 1, 1, 1, 1, 1,
-2.008268, -1.029813, -2.214624, 1, 1, 1, 1, 1,
-1.994232, -0.2103801, -0.7960494, 1, 1, 1, 1, 1,
-1.988575, 1.806674, -0.7154836, 1, 1, 1, 1, 1,
-1.976624, -0.4855234, -3.064392, 1, 1, 1, 1, 1,
-1.947354, -0.1165763, -2.186512, 0, 0, 1, 1, 1,
-1.927919, -0.8483707, -4.105883, 1, 0, 0, 1, 1,
-1.922077, -1.134817, -1.391935, 1, 0, 0, 1, 1,
-1.91391, -0.1116021, -1.787636, 1, 0, 0, 1, 1,
-1.904953, -0.7230072, -2.67514, 1, 0, 0, 1, 1,
-1.903512, -0.6723071, -2.049162, 1, 0, 0, 1, 1,
-1.895606, -0.4904884, -1.598782, 0, 0, 0, 1, 1,
-1.890125, 0.8351775, 1.431631, 0, 0, 0, 1, 1,
-1.877527, -0.1574308, -1.576729, 0, 0, 0, 1, 1,
-1.871478, -0.08709252, -0.6200817, 0, 0, 0, 1, 1,
-1.866331, 0.9354054, -2.043505, 0, 0, 0, 1, 1,
-1.830872, 0.2461578, -0.6793477, 0, 0, 0, 1, 1,
-1.82695, -0.1533804, -0.6885844, 0, 0, 0, 1, 1,
-1.812495, -0.8982136, -1.72634, 1, 1, 1, 1, 1,
-1.807828, -0.4529618, -1.666766, 1, 1, 1, 1, 1,
-1.804176, 0.9362711, -3.512698, 1, 1, 1, 1, 1,
-1.79652, -0.1793766, -3.518026, 1, 1, 1, 1, 1,
-1.783412, 1.114515, -0.9569157, 1, 1, 1, 1, 1,
-1.767812, -0.1818042, -2.253287, 1, 1, 1, 1, 1,
-1.743259, 0.2030412, -1.851129, 1, 1, 1, 1, 1,
-1.737702, 0.6488302, 0.6200994, 1, 1, 1, 1, 1,
-1.728866, 0.7429222, -2.204573, 1, 1, 1, 1, 1,
-1.726727, -0.3215699, 0.9608927, 1, 1, 1, 1, 1,
-1.718438, 1.167494, -2.57511, 1, 1, 1, 1, 1,
-1.707859, -0.135164, -2.315818, 1, 1, 1, 1, 1,
-1.699112, 0.4399331, -1.223546, 1, 1, 1, 1, 1,
-1.692891, -0.4814206, -2.169667, 1, 1, 1, 1, 1,
-1.690321, 0.167136, -0.6451272, 1, 1, 1, 1, 1,
-1.680357, -0.7094914, -0.6828821, 0, 0, 1, 1, 1,
-1.676488, 1.553514, -1.070659, 1, 0, 0, 1, 1,
-1.672945, -1.049426, -2.200384, 1, 0, 0, 1, 1,
-1.6705, 0.3822275, -2.587707, 1, 0, 0, 1, 1,
-1.668829, 0.7283329, -2.718797, 1, 0, 0, 1, 1,
-1.655282, 0.07878228, -1.73808, 1, 0, 0, 1, 1,
-1.64663, 0.1086832, 0.3603231, 0, 0, 0, 1, 1,
-1.625783, 0.608238, -0.3447639, 0, 0, 0, 1, 1,
-1.617727, 0.9914044, -0.5739675, 0, 0, 0, 1, 1,
-1.617667, -0.4496694, -1.569298, 0, 0, 0, 1, 1,
-1.612735, -1.369022, -2.013831, 0, 0, 0, 1, 1,
-1.601436, -0.8880315, -2.420204, 0, 0, 0, 1, 1,
-1.601278, 0.07975793, -0.5633106, 0, 0, 0, 1, 1,
-1.593841, -0.1676178, -3.015041, 1, 1, 1, 1, 1,
-1.593486, 1.666617, -0.1877131, 1, 1, 1, 1, 1,
-1.569659, -0.1950471, -1.217865, 1, 1, 1, 1, 1,
-1.557253, -0.1255399, -0.4877341, 1, 1, 1, 1, 1,
-1.542566, 0.9783369, -3.027355, 1, 1, 1, 1, 1,
-1.540804, -0.2738625, -1.317195, 1, 1, 1, 1, 1,
-1.525144, -0.06448331, -2.920883, 1, 1, 1, 1, 1,
-1.517564, -1.307432, -3.815681, 1, 1, 1, 1, 1,
-1.51743, -1.816787, -2.105406, 1, 1, 1, 1, 1,
-1.512936, -0.1101463, -1.59261, 1, 1, 1, 1, 1,
-1.509385, -0.8774101, -2.614897, 1, 1, 1, 1, 1,
-1.503411, 0.4964226, -1.715627, 1, 1, 1, 1, 1,
-1.497946, -1.230236, -4.200879, 1, 1, 1, 1, 1,
-1.497005, -0.817802, -1.049726, 1, 1, 1, 1, 1,
-1.491188, 0.6878461, -2.298974, 1, 1, 1, 1, 1,
-1.489194, -1.814641, -0.6244007, 0, 0, 1, 1, 1,
-1.482179, -0.6313148, -1.94733, 1, 0, 0, 1, 1,
-1.463914, -0.9177808, -2.083293, 1, 0, 0, 1, 1,
-1.463133, -0.3601797, -0.5619659, 1, 0, 0, 1, 1,
-1.462995, 1.706645, -0.7926508, 1, 0, 0, 1, 1,
-1.457102, -1.38368, -3.944671, 1, 0, 0, 1, 1,
-1.45514, -0.0595884, -1.167223, 0, 0, 0, 1, 1,
-1.452888, 0.5491654, -2.695543, 0, 0, 0, 1, 1,
-1.435906, -1.412472, -3.918076, 0, 0, 0, 1, 1,
-1.428906, -0.7825574, -2.921979, 0, 0, 0, 1, 1,
-1.424856, -0.8671175, -2.933733, 0, 0, 0, 1, 1,
-1.420726, -0.2722854, -2.882608, 0, 0, 0, 1, 1,
-1.419416, 0.08777072, -2.692148, 0, 0, 0, 1, 1,
-1.417059, -0.427844, 0.8714056, 1, 1, 1, 1, 1,
-1.413003, 1.614562, -0.7403309, 1, 1, 1, 1, 1,
-1.412243, -0.4257201, -1.577811, 1, 1, 1, 1, 1,
-1.409161, -1.073603, -1.118181, 1, 1, 1, 1, 1,
-1.401849, -0.02633082, -0.4234406, 1, 1, 1, 1, 1,
-1.396509, 0.03249695, -0.8799297, 1, 1, 1, 1, 1,
-1.380802, 0.5320657, -1.952862, 1, 1, 1, 1, 1,
-1.354973, 1.724168, -0.02065477, 1, 1, 1, 1, 1,
-1.353352, 0.3047554, -2.715315, 1, 1, 1, 1, 1,
-1.33368, -1.272632, -3.002331, 1, 1, 1, 1, 1,
-1.333, -1.063133, -0.9007168, 1, 1, 1, 1, 1,
-1.33212, -0.2256155, -0.2564148, 1, 1, 1, 1, 1,
-1.330473, 0.1197875, -2.685925, 1, 1, 1, 1, 1,
-1.322508, 1.658566, -0.3041418, 1, 1, 1, 1, 1,
-1.314978, 0.1502124, -1.888815, 1, 1, 1, 1, 1,
-1.307468, 0.5225897, -1.20602, 0, 0, 1, 1, 1,
-1.29739, 0.2933533, -1.88575, 1, 0, 0, 1, 1,
-1.284834, -0.2828617, -2.218864, 1, 0, 0, 1, 1,
-1.281081, -0.4863248, -0.8189603, 1, 0, 0, 1, 1,
-1.28008, -1.574419, -2.044586, 1, 0, 0, 1, 1,
-1.279181, -0.6421546, -0.07295582, 1, 0, 0, 1, 1,
-1.277726, -2.1569, -3.666551, 0, 0, 0, 1, 1,
-1.272818, -0.2852075, -0.7553213, 0, 0, 0, 1, 1,
-1.267881, -0.4685146, -2.043717, 0, 0, 0, 1, 1,
-1.266941, 0.2655932, -1.048017, 0, 0, 0, 1, 1,
-1.24831, 1.118875, 1.454751, 0, 0, 0, 1, 1,
-1.241797, 0.1016813, -2.654148, 0, 0, 0, 1, 1,
-1.230334, 1.028172, -0.7077433, 0, 0, 0, 1, 1,
-1.230276, 0.07802194, -0.857153, 1, 1, 1, 1, 1,
-1.228993, -1.458194, -1.957574, 1, 1, 1, 1, 1,
-1.223927, 0.8877923, 0.5498328, 1, 1, 1, 1, 1,
-1.220767, -0.07403152, -1.597711, 1, 1, 1, 1, 1,
-1.216918, -0.1426109, -2.493246, 1, 1, 1, 1, 1,
-1.21238, 2.399977, -0.789836, 1, 1, 1, 1, 1,
-1.209235, -0.003567918, -1.41916, 1, 1, 1, 1, 1,
-1.207486, -1.518734, -2.509638, 1, 1, 1, 1, 1,
-1.206147, -1.122046, -4.499046, 1, 1, 1, 1, 1,
-1.205274, -1.290716, -3.374448, 1, 1, 1, 1, 1,
-1.199875, 0.8287628, -1.398182, 1, 1, 1, 1, 1,
-1.195869, -0.859741, -1.90749, 1, 1, 1, 1, 1,
-1.184258, 0.1732919, -2.648125, 1, 1, 1, 1, 1,
-1.181144, 0.583361, -0.6679668, 1, 1, 1, 1, 1,
-1.178185, 0.9504308, -0.01619296, 1, 1, 1, 1, 1,
-1.175967, -1.77936, -0.03603082, 0, 0, 1, 1, 1,
-1.17564, -0.1737649, -1.246018, 1, 0, 0, 1, 1,
-1.168899, -1.072809, -2.986814, 1, 0, 0, 1, 1,
-1.165516, 2.048318, -1.581328, 1, 0, 0, 1, 1,
-1.155056, -0.05538321, -1.333582, 1, 0, 0, 1, 1,
-1.148956, 0.5598269, -0.7305172, 1, 0, 0, 1, 1,
-1.147014, 1.009301, -1.031885, 0, 0, 0, 1, 1,
-1.141429, -0.6381748, -3.086918, 0, 0, 0, 1, 1,
-1.135073, -0.8447931, -1.227185, 0, 0, 0, 1, 1,
-1.135036, 0.6576157, -0.977199, 0, 0, 0, 1, 1,
-1.134748, -1.066829, -2.381991, 0, 0, 0, 1, 1,
-1.116241, -0.9381029, -1.468127, 0, 0, 0, 1, 1,
-1.114154, -0.6739528, -4.003137, 0, 0, 0, 1, 1,
-1.113373, -0.2767187, -3.073339, 1, 1, 1, 1, 1,
-1.112921, 0.3145278, -3.161033, 1, 1, 1, 1, 1,
-1.107035, -1.530447, -4.141685, 1, 1, 1, 1, 1,
-1.1057, 1.524232, -0.2265991, 1, 1, 1, 1, 1,
-1.098762, 1.321753, -0.6620432, 1, 1, 1, 1, 1,
-1.097889, 1.130341, -1.116393, 1, 1, 1, 1, 1,
-1.092543, -0.2574102, -0.9508473, 1, 1, 1, 1, 1,
-1.07747, -1.026495, -2.665792, 1, 1, 1, 1, 1,
-1.077205, -1.44685, -2.99346, 1, 1, 1, 1, 1,
-1.072157, -1.747986, -3.785168, 1, 1, 1, 1, 1,
-1.071766, -0.6032804, -3.385458, 1, 1, 1, 1, 1,
-1.06863, 0.9642452, -0.397348, 1, 1, 1, 1, 1,
-1.059153, -2.068578, -1.039863, 1, 1, 1, 1, 1,
-1.055325, 0.7887487, -0.1245592, 1, 1, 1, 1, 1,
-1.051791, -1.397872, -2.28809, 1, 1, 1, 1, 1,
-1.03809, 0.1280741, -3.916324, 0, 0, 1, 1, 1,
-1.034226, -2.262671, -4.086787, 1, 0, 0, 1, 1,
-1.03135, 1.294958, -1.144697, 1, 0, 0, 1, 1,
-1.025051, -0.5155447, -2.360138, 1, 0, 0, 1, 1,
-1.019594, 1.434672, -0.9905444, 1, 0, 0, 1, 1,
-1.005261, 2.331925, -0.7223242, 1, 0, 0, 1, 1,
-0.9995112, 1.396133, -0.5407521, 0, 0, 0, 1, 1,
-0.9979388, -0.1963995, -0.7739465, 0, 0, 0, 1, 1,
-0.9908435, 0.4656751, -0.8785166, 0, 0, 0, 1, 1,
-0.9878325, 0.1384862, -1.453027, 0, 0, 0, 1, 1,
-0.9876393, 2.000556, 0.1920426, 0, 0, 0, 1, 1,
-0.9771453, -1.075148, -2.516625, 0, 0, 0, 1, 1,
-0.9727386, 1.368929, -0.7168074, 0, 0, 0, 1, 1,
-0.9712475, 1.45145, 0.5070519, 1, 1, 1, 1, 1,
-0.9699559, 1.229329, -1.177006, 1, 1, 1, 1, 1,
-0.9601122, 0.4394792, -1.601447, 1, 1, 1, 1, 1,
-0.9579619, -1.176008, -2.704252, 1, 1, 1, 1, 1,
-0.9552715, -0.8565521, -2.63933, 1, 1, 1, 1, 1,
-0.9538858, -0.08626279, -0.3475406, 1, 1, 1, 1, 1,
-0.951665, -0.4427029, -1.313641, 1, 1, 1, 1, 1,
-0.9509761, -0.6219456, -0.9779101, 1, 1, 1, 1, 1,
-0.9505065, 1.673549, -0.5284293, 1, 1, 1, 1, 1,
-0.9471149, -1.669839, -4.599324, 1, 1, 1, 1, 1,
-0.9445971, 2.161745, 0.5470591, 1, 1, 1, 1, 1,
-0.9441984, -1.735816, -2.87805, 1, 1, 1, 1, 1,
-0.9438785, 0.5061656, -1.037605, 1, 1, 1, 1, 1,
-0.9436674, -0.5158305, -1.913766, 1, 1, 1, 1, 1,
-0.943037, -1.569171, -2.924605, 1, 1, 1, 1, 1,
-0.9330195, 0.9453697, -3.364682, 0, 0, 1, 1, 1,
-0.9311591, 0.3312175, -0.7929951, 1, 0, 0, 1, 1,
-0.9265002, -2.250327, -3.265409, 1, 0, 0, 1, 1,
-0.9238282, -0.3378484, -1.10139, 1, 0, 0, 1, 1,
-0.917629, -1.093402, -2.620023, 1, 0, 0, 1, 1,
-0.917506, -2.451367, -3.072006, 1, 0, 0, 1, 1,
-0.9158471, 0.02251923, -1.646728, 0, 0, 0, 1, 1,
-0.9071429, -1.006558, -1.483929, 0, 0, 0, 1, 1,
-0.9063817, -0.6238935, -4.452106, 0, 0, 0, 1, 1,
-0.9011782, 0.1680372, -2.360394, 0, 0, 0, 1, 1,
-0.8946966, -0.1930155, -2.134885, 0, 0, 0, 1, 1,
-0.8835072, -0.4111494, -3.77663, 0, 0, 0, 1, 1,
-0.8797423, 0.2959685, -0.5915738, 0, 0, 0, 1, 1,
-0.8661664, 0.8600212, -2.089467, 1, 1, 1, 1, 1,
-0.8653109, 1.059059, -1.617115, 1, 1, 1, 1, 1,
-0.8548459, 0.8536198, -1.103112, 1, 1, 1, 1, 1,
-0.8547291, -1.146107, -1.31631, 1, 1, 1, 1, 1,
-0.8496946, -0.7235427, -1.989314, 1, 1, 1, 1, 1,
-0.8492231, -1.699606, -4.849009, 1, 1, 1, 1, 1,
-0.8371897, 0.876536, -0.8860242, 1, 1, 1, 1, 1,
-0.8285631, 0.9144091, -0.4759555, 1, 1, 1, 1, 1,
-0.825878, -1.398736, -1.200569, 1, 1, 1, 1, 1,
-0.8228306, 0.4731804, -2.408284, 1, 1, 1, 1, 1,
-0.8217964, 1.269763, -0.9537786, 1, 1, 1, 1, 1,
-0.8203225, -1.91953, -2.678052, 1, 1, 1, 1, 1,
-0.8149932, 0.6147043, -1.543241, 1, 1, 1, 1, 1,
-0.8146019, -0.2865154, 0.118094, 1, 1, 1, 1, 1,
-0.8131165, -0.2387809, -1.078173, 1, 1, 1, 1, 1,
-0.8118564, -1.140981, -2.461377, 0, 0, 1, 1, 1,
-0.8097323, 0.4911169, -1.408198, 1, 0, 0, 1, 1,
-0.8091742, -2.243682, -1.478791, 1, 0, 0, 1, 1,
-0.8061857, 0.8810462, -2.031827, 1, 0, 0, 1, 1,
-0.7914099, -1.905955, -1.902829, 1, 0, 0, 1, 1,
-0.7880765, 0.726175, 0.1257067, 1, 0, 0, 1, 1,
-0.7849864, 0.5262015, -0.4436241, 0, 0, 0, 1, 1,
-0.7822161, 0.7320429, -1.125756, 0, 0, 0, 1, 1,
-0.7769822, 0.8171248, -1.046253, 0, 0, 0, 1, 1,
-0.7751789, 2.045756, 0.5831391, 0, 0, 0, 1, 1,
-0.7750497, 0.4848573, -1.242452, 0, 0, 0, 1, 1,
-0.7734682, -2.705943, -2.063052, 0, 0, 0, 1, 1,
-0.7722039, -0.9475439, -2.63054, 0, 0, 0, 1, 1,
-0.771365, -1.66283, -2.985629, 1, 1, 1, 1, 1,
-0.7696429, -1.650426, -3.660435, 1, 1, 1, 1, 1,
-0.7673509, -0.1340966, -1.808047, 1, 1, 1, 1, 1,
-0.7634665, -0.7266471, -3.655907, 1, 1, 1, 1, 1,
-0.7559507, -0.1674848, -0.7895811, 1, 1, 1, 1, 1,
-0.7549241, -0.1441571, -1.538707, 1, 1, 1, 1, 1,
-0.7497666, 0.7073643, -0.9582654, 1, 1, 1, 1, 1,
-0.7488573, -0.3923517, -1.498148, 1, 1, 1, 1, 1,
-0.7477148, -1.994713, -2.003585, 1, 1, 1, 1, 1,
-0.7424383, 0.4236645, -1.909768, 1, 1, 1, 1, 1,
-0.738348, 0.3682963, -2.527101, 1, 1, 1, 1, 1,
-0.7355497, -0.7321278, -3.406172, 1, 1, 1, 1, 1,
-0.7340448, -0.3696486, -2.000086, 1, 1, 1, 1, 1,
-0.7329524, -1.274117, -2.26899, 1, 1, 1, 1, 1,
-0.7283586, 1.093311, -0.8368381, 1, 1, 1, 1, 1,
-0.7280916, -1.758407, -4.192982, 0, 0, 1, 1, 1,
-0.7204216, -0.7325398, -2.003092, 1, 0, 0, 1, 1,
-0.7194088, 1.752812, -0.9032009, 1, 0, 0, 1, 1,
-0.7108773, 0.2091188, -1.510406, 1, 0, 0, 1, 1,
-0.7101952, -0.6768672, -1.953032, 1, 0, 0, 1, 1,
-0.7094011, 0.02529872, -2.457238, 1, 0, 0, 1, 1,
-0.7044958, 0.8863978, 0.05899017, 0, 0, 0, 1, 1,
-0.6948923, 1.119301, 0.4896144, 0, 0, 0, 1, 1,
-0.692682, 0.3241448, -0.1316888, 0, 0, 0, 1, 1,
-0.6871399, -1.196376, -2.931052, 0, 0, 0, 1, 1,
-0.6857427, 0.8046407, 0.1824654, 0, 0, 0, 1, 1,
-0.6852793, -1.787778, -3.97236, 0, 0, 0, 1, 1,
-0.6797273, -0.5570439, -1.722808, 0, 0, 0, 1, 1,
-0.6786132, 0.298458, -2.106189, 1, 1, 1, 1, 1,
-0.6745904, 0.2888827, -0.4013906, 1, 1, 1, 1, 1,
-0.671196, -2.140324, -3.114944, 1, 1, 1, 1, 1,
-0.6686944, -0.2510299, -0.4039406, 1, 1, 1, 1, 1,
-0.6683585, -2.401806, -2.805927, 1, 1, 1, 1, 1,
-0.661009, 0.4500824, -1.839538, 1, 1, 1, 1, 1,
-0.6607596, -0.17243, -2.736769, 1, 1, 1, 1, 1,
-0.660526, -0.8050542, -3.197094, 1, 1, 1, 1, 1,
-0.658348, 0.1666532, -1.784239, 1, 1, 1, 1, 1,
-0.6582802, -0.8019434, -4.184681, 1, 1, 1, 1, 1,
-0.6524123, -0.2705803, -0.9834852, 1, 1, 1, 1, 1,
-0.6512704, 0.2085761, -1.776022, 1, 1, 1, 1, 1,
-0.6500019, 0.8223839, 0.6110164, 1, 1, 1, 1, 1,
-0.6484932, -1.330879, -2.169462, 1, 1, 1, 1, 1,
-0.6438602, 0.2110265, -1.670713, 1, 1, 1, 1, 1,
-0.6433093, 0.7473249, -1.732048, 0, 0, 1, 1, 1,
-0.6400986, -0.4180365, -1.096458, 1, 0, 0, 1, 1,
-0.6375982, -0.4029655, -2.096761, 1, 0, 0, 1, 1,
-0.6364458, -0.925797, -1.916765, 1, 0, 0, 1, 1,
-0.6357265, 0.4808288, -1.208274, 1, 0, 0, 1, 1,
-0.6343433, -0.8046099, -2.536305, 1, 0, 0, 1, 1,
-0.6335195, 0.9904526, -0.8160928, 0, 0, 0, 1, 1,
-0.6328905, 0.1074233, -2.236758, 0, 0, 0, 1, 1,
-0.6328796, 0.4881467, -2.477521, 0, 0, 0, 1, 1,
-0.6314105, -0.3254742, -2.486115, 0, 0, 0, 1, 1,
-0.627754, 1.781298, 0.1822861, 0, 0, 0, 1, 1,
-0.6267232, -0.1259924, -0.7113731, 0, 0, 0, 1, 1,
-0.6234869, 0.4222296, -1.430187, 0, 0, 0, 1, 1,
-0.6215821, -0.7411271, -3.418885, 1, 1, 1, 1, 1,
-0.6183788, -0.5021187, -2.721553, 1, 1, 1, 1, 1,
-0.6113085, -0.7005175, -2.123916, 1, 1, 1, 1, 1,
-0.6107225, 3.130421, 0.2396886, 1, 1, 1, 1, 1,
-0.6079941, 0.9003842, 0.9117892, 1, 1, 1, 1, 1,
-0.6055844, 1.607296, -2.40329, 1, 1, 1, 1, 1,
-0.6044949, -0.2171437, -2.396191, 1, 1, 1, 1, 1,
-0.602609, 1.547603, -0.223684, 1, 1, 1, 1, 1,
-0.6016162, 0.5279586, -0.5025212, 1, 1, 1, 1, 1,
-0.5969148, -1.883403, -2.251646, 1, 1, 1, 1, 1,
-0.5920193, -0.3261785, -0.792416, 1, 1, 1, 1, 1,
-0.5918028, -1.936879, -1.509977, 1, 1, 1, 1, 1,
-0.5906301, -0.3814915, -1.567299, 1, 1, 1, 1, 1,
-0.5905576, -1.675758, -4.519896, 1, 1, 1, 1, 1,
-0.5844777, 0.8511843, 0.5394531, 1, 1, 1, 1, 1,
-0.5816169, 0.2705869, -0.824313, 0, 0, 1, 1, 1,
-0.579441, 2.122011, -0.2083774, 1, 0, 0, 1, 1,
-0.5766824, 2.656775, -0.1373453, 1, 0, 0, 1, 1,
-0.5766805, 0.3482651, -0.7265809, 1, 0, 0, 1, 1,
-0.5697405, -0.614959, -2.877989, 1, 0, 0, 1, 1,
-0.5696594, 0.02096253, -1.470275, 1, 0, 0, 1, 1,
-0.5611034, -0.4983428, -3.983141, 0, 0, 0, 1, 1,
-0.5590898, -0.004156718, -1.351639, 0, 0, 0, 1, 1,
-0.5566102, 0.8335116, -0.5315287, 0, 0, 0, 1, 1,
-0.5535567, -1.577157, -0.4895962, 0, 0, 0, 1, 1,
-0.5509129, 0.6360043, -0.7277789, 0, 0, 0, 1, 1,
-0.5474702, -0.1606848, -1.652371, 0, 0, 0, 1, 1,
-0.5461286, 0.8694294, 0.03982948, 0, 0, 0, 1, 1,
-0.5442603, 1.707371, 0.06258873, 1, 1, 1, 1, 1,
-0.5392909, -0.1480202, -1.082842, 1, 1, 1, 1, 1,
-0.5324951, 0.1387607, -1.68506, 1, 1, 1, 1, 1,
-0.5309721, 1.860497, 0.7749581, 1, 1, 1, 1, 1,
-0.5291947, 0.9105684, -0.5640845, 1, 1, 1, 1, 1,
-0.5198248, 0.768607, -0.3860023, 1, 1, 1, 1, 1,
-0.5159782, -0.2571326, -2.118633, 1, 1, 1, 1, 1,
-0.5107995, 1.321113, -0.5833666, 1, 1, 1, 1, 1,
-0.5081505, -0.509624, -2.48608, 1, 1, 1, 1, 1,
-0.4980536, -1.547349, -1.400766, 1, 1, 1, 1, 1,
-0.4892944, 1.208279, 1.268325, 1, 1, 1, 1, 1,
-0.4878266, -0.1518303, -2.211134, 1, 1, 1, 1, 1,
-0.4815861, 0.3471238, -2.226619, 1, 1, 1, 1, 1,
-0.4796444, -1.045226, -4.939876, 1, 1, 1, 1, 1,
-0.4781113, 0.07314036, -3.215114, 1, 1, 1, 1, 1,
-0.4751502, 1.046113, -1.316818, 0, 0, 1, 1, 1,
-0.4703853, -0.4247573, -1.338039, 1, 0, 0, 1, 1,
-0.4700019, -1.395095, -3.366786, 1, 0, 0, 1, 1,
-0.4698365, 0.04263072, -1.483588, 1, 0, 0, 1, 1,
-0.469708, -0.2826813, -2.849046, 1, 0, 0, 1, 1,
-0.4686691, -0.6894925, -2.467776, 1, 0, 0, 1, 1,
-0.4640236, -1.050731, -3.488018, 0, 0, 0, 1, 1,
-0.4600553, -0.2508884, -2.287268, 0, 0, 0, 1, 1,
-0.4598126, 0.4697223, -1.433417, 0, 0, 0, 1, 1,
-0.4554113, -0.13028, 0.37372, 0, 0, 0, 1, 1,
-0.4506524, 0.03009062, -0.5326355, 0, 0, 0, 1, 1,
-0.4490417, 0.814978, -0.918263, 0, 0, 0, 1, 1,
-0.4416448, 2.039335, -0.9714904, 0, 0, 0, 1, 1,
-0.4375956, 0.982581, 0.8881318, 1, 1, 1, 1, 1,
-0.4317284, 1.307766, 0.6575978, 1, 1, 1, 1, 1,
-0.430721, 1.072935, -1.208406, 1, 1, 1, 1, 1,
-0.4289257, 0.4313142, 0.9262987, 1, 1, 1, 1, 1,
-0.4287342, 0.05480942, 0.4763095, 1, 1, 1, 1, 1,
-0.428485, -0.2327406, -1.721504, 1, 1, 1, 1, 1,
-0.4261468, 0.03991826, -3.292271, 1, 1, 1, 1, 1,
-0.4223979, 1.383328, -0.4969759, 1, 1, 1, 1, 1,
-0.4200614, 0.7355981, -1.024117, 1, 1, 1, 1, 1,
-0.4142544, 1.515381, -1.257783, 1, 1, 1, 1, 1,
-0.4122999, 1.140337, 0.06905942, 1, 1, 1, 1, 1,
-0.4114569, -0.4710079, -3.696902, 1, 1, 1, 1, 1,
-0.4095301, 1.993145, 1.610702, 1, 1, 1, 1, 1,
-0.408598, -1.357154, -3.093595, 1, 1, 1, 1, 1,
-0.4072281, -0.4386941, -1.674026, 1, 1, 1, 1, 1,
-0.4058552, -0.811064, -3.468404, 0, 0, 1, 1, 1,
-0.4027179, -0.827455, -1.307668, 1, 0, 0, 1, 1,
-0.3998253, 0.8066715, -2.11931, 1, 0, 0, 1, 1,
-0.3926004, 0.07964233, -2.753696, 1, 0, 0, 1, 1,
-0.3919839, -2.333878, -1.296261, 1, 0, 0, 1, 1,
-0.3895762, 0.4442204, -0.1961216, 1, 0, 0, 1, 1,
-0.3851238, -0.4914191, -2.170235, 0, 0, 0, 1, 1,
-0.3841766, 0.4365741, -0.4894979, 0, 0, 0, 1, 1,
-0.3780045, -0.09638985, -2.80883, 0, 0, 0, 1, 1,
-0.3713661, -0.3423953, -1.94674, 0, 0, 0, 1, 1,
-0.3660381, 2.06677, 1.465564, 0, 0, 0, 1, 1,
-0.3653851, 0.8054341, -2.112285, 0, 0, 0, 1, 1,
-0.3629953, 0.01367436, -2.781713, 0, 0, 0, 1, 1,
-0.3558423, 0.9658042, 1.393193, 1, 1, 1, 1, 1,
-0.3556765, 2.445475, 1.480645, 1, 1, 1, 1, 1,
-0.3548956, 0.9544792, -1.302343, 1, 1, 1, 1, 1,
-0.3507823, -1.13015, -3.082354, 1, 1, 1, 1, 1,
-0.3471749, -0.04855851, -3.498344, 1, 1, 1, 1, 1,
-0.3448506, -0.3844651, -1.936674, 1, 1, 1, 1, 1,
-0.3438058, -0.341518, -2.232742, 1, 1, 1, 1, 1,
-0.3403469, -0.7337475, -2.855738, 1, 1, 1, 1, 1,
-0.3403451, 2.338941, -0.7682442, 1, 1, 1, 1, 1,
-0.3394504, 1.05115, -1.195961, 1, 1, 1, 1, 1,
-0.3383928, 1.339887, -1.283927, 1, 1, 1, 1, 1,
-0.3379777, -1.541602, -1.481254, 1, 1, 1, 1, 1,
-0.3345191, -0.6892824, -2.590649, 1, 1, 1, 1, 1,
-0.3311604, 1.463071, -1.466641, 1, 1, 1, 1, 1,
-0.3304216, 1.592644, -1.117583, 1, 1, 1, 1, 1,
-0.3296171, -0.6504822, -2.986007, 0, 0, 1, 1, 1,
-0.3204555, -1.164324, -5.126015, 1, 0, 0, 1, 1,
-0.319658, 0.8789898, -2.173756, 1, 0, 0, 1, 1,
-0.3173625, -0.8097858, -2.416211, 1, 0, 0, 1, 1,
-0.314716, 2.18236, 0.1319596, 1, 0, 0, 1, 1,
-0.3146369, 0.7775719, 1.004388, 1, 0, 0, 1, 1,
-0.3071035, 1.062395, 0.1870453, 0, 0, 0, 1, 1,
-0.305303, -0.09209663, -1.918997, 0, 0, 0, 1, 1,
-0.3046501, 1.246208, -0.9189564, 0, 0, 0, 1, 1,
-0.3000156, -1.063212, -2.041513, 0, 0, 0, 1, 1,
-0.2950453, -0.6279656, -1.493137, 0, 0, 0, 1, 1,
-0.2947789, 0.2624471, -0.7927616, 0, 0, 0, 1, 1,
-0.2943107, -1.316515, -2.039178, 0, 0, 0, 1, 1,
-0.2933811, 0.5690085, -0.1792697, 1, 1, 1, 1, 1,
-0.2888189, -0.04380944, -1.048774, 1, 1, 1, 1, 1,
-0.2820412, -0.2077862, -2.829539, 1, 1, 1, 1, 1,
-0.2722557, -1.078909, -2.717937, 1, 1, 1, 1, 1,
-0.267749, 0.2710619, -1.25778, 1, 1, 1, 1, 1,
-0.2673891, 0.7586295, -0.9037089, 1, 1, 1, 1, 1,
-0.2649373, 0.3040437, -1.669794, 1, 1, 1, 1, 1,
-0.2638571, 0.3873625, 0.4978712, 1, 1, 1, 1, 1,
-0.2590597, 0.07254769, -1.694783, 1, 1, 1, 1, 1,
-0.2587105, -1.037595, -5.553008, 1, 1, 1, 1, 1,
-0.2548858, 0.5173479, -0.00384513, 1, 1, 1, 1, 1,
-0.2535543, -1.493302, -3.014755, 1, 1, 1, 1, 1,
-0.253064, -0.8851504, -1.270137, 1, 1, 1, 1, 1,
-0.2501148, 0.001921192, -1.022264, 1, 1, 1, 1, 1,
-0.2493854, -0.3440177, -2.939673, 1, 1, 1, 1, 1,
-0.2452913, -1.669943, -3.382906, 0, 0, 1, 1, 1,
-0.2434125, -1.284823, -2.994359, 1, 0, 0, 1, 1,
-0.2422606, 1.162221, -1.169708, 1, 0, 0, 1, 1,
-0.2366347, -0.3111491, -3.411536, 1, 0, 0, 1, 1,
-0.2354424, 0.1519244, -0.5786744, 1, 0, 0, 1, 1,
-0.2353527, 1.037385, 1.312731, 1, 0, 0, 1, 1,
-0.2350594, 0.7466798, 0.210325, 0, 0, 0, 1, 1,
-0.227517, 0.8820119, 1.548938, 0, 0, 0, 1, 1,
-0.2197552, 0.7622602, -0.2145161, 0, 0, 0, 1, 1,
-0.2188198, 0.2580472, -0.8498545, 0, 0, 0, 1, 1,
-0.2187361, -0.112554, -3.054693, 0, 0, 0, 1, 1,
-0.2166193, 0.7992165, 0.4728568, 0, 0, 0, 1, 1,
-0.2163133, -0.5131441, -1.64882, 0, 0, 0, 1, 1,
-0.2156092, 0.9472558, -2.338089, 1, 1, 1, 1, 1,
-0.2141114, 0.4056257, -0.7663786, 1, 1, 1, 1, 1,
-0.2124045, 0.4566394, -0.3450456, 1, 1, 1, 1, 1,
-0.2101893, 0.3263176, -0.8595894, 1, 1, 1, 1, 1,
-0.207972, 1.166001, 0.1256814, 1, 1, 1, 1, 1,
-0.2044428, -0.4240304, -0.3550889, 1, 1, 1, 1, 1,
-0.2016605, 1.139877, -1.161969, 1, 1, 1, 1, 1,
-0.201623, -1.056776, -2.089848, 1, 1, 1, 1, 1,
-0.2002752, 2.159823, 0.6835699, 1, 1, 1, 1, 1,
-0.1999753, 1.070986, -0.1176903, 1, 1, 1, 1, 1,
-0.19744, 1.497935, -1.534867, 1, 1, 1, 1, 1,
-0.1970992, -0.1987043, -2.562853, 1, 1, 1, 1, 1,
-0.1950904, 0.02590883, -1.362478, 1, 1, 1, 1, 1,
-0.1878329, 0.5515564, 0.7437559, 1, 1, 1, 1, 1,
-0.1864175, 0.5020744, -1.00137, 1, 1, 1, 1, 1,
-0.1857901, -0.3220926, -3.936704, 0, 0, 1, 1, 1,
-0.1767367, 2.051695, -0.6609765, 1, 0, 0, 1, 1,
-0.174414, -0.06519877, -1.960497, 1, 0, 0, 1, 1,
-0.1711144, 1.556372, 0.2521169, 1, 0, 0, 1, 1,
-0.1700831, -0.03808409, -1.786577, 1, 0, 0, 1, 1,
-0.1695402, -1.40422, -2.252882, 1, 0, 0, 1, 1,
-0.1671302, 1.099245, 0.1893796, 0, 0, 0, 1, 1,
-0.1651008, -0.371709, -2.529791, 0, 0, 0, 1, 1,
-0.1630162, 0.6866345, 0.4397059, 0, 0, 0, 1, 1,
-0.1595363, -0.883441, -2.563869, 0, 0, 0, 1, 1,
-0.1583636, -1.680808, -2.189171, 0, 0, 0, 1, 1,
-0.149051, 1.274078, -0.3265296, 0, 0, 0, 1, 1,
-0.1479266, 2.815242, -0.3893611, 0, 0, 0, 1, 1,
-0.145482, 0.2285541, -0.4837502, 1, 1, 1, 1, 1,
-0.139025, -0.05888509, -3.188308, 1, 1, 1, 1, 1,
-0.1378434, -0.6832231, -2.084031, 1, 1, 1, 1, 1,
-0.1371495, -0.1954669, -3.487815, 1, 1, 1, 1, 1,
-0.1338933, 0.3963704, -0.9057472, 1, 1, 1, 1, 1,
-0.1331832, -0.4655309, -1.720113, 1, 1, 1, 1, 1,
-0.131038, -0.8770902, -2.154738, 1, 1, 1, 1, 1,
-0.1300893, -1.337739, -3.149694, 1, 1, 1, 1, 1,
-0.126803, -0.02864066, -3.333621, 1, 1, 1, 1, 1,
-0.125339, -2.147997, -2.798838, 1, 1, 1, 1, 1,
-0.1223759, -0.2969953, -2.947906, 1, 1, 1, 1, 1,
-0.1213355, 0.1947206, -1.498757, 1, 1, 1, 1, 1,
-0.1206455, -0.401794, -4.168902, 1, 1, 1, 1, 1,
-0.1201211, -0.3130756, -2.534111, 1, 1, 1, 1, 1,
-0.1128256, 0.8087595, 2.296308, 1, 1, 1, 1, 1,
-0.1116424, 0.62637, -1.098052, 0, 0, 1, 1, 1,
-0.108797, 0.1774397, -0.9952577, 1, 0, 0, 1, 1,
-0.1015213, 0.3284679, 1.211707, 1, 0, 0, 1, 1,
-0.09562146, -0.6968171, -1.011823, 1, 0, 0, 1, 1,
-0.09415124, 0.8415669, -1.132807, 1, 0, 0, 1, 1,
-0.09257942, 0.2834919, -0.7318939, 1, 0, 0, 1, 1,
-0.09089591, -0.8034209, -4.052258, 0, 0, 0, 1, 1,
-0.08986203, 0.3494396, -0.3871636, 0, 0, 0, 1, 1,
-0.08634558, 0.8165943, 0.7312506, 0, 0, 0, 1, 1,
-0.08495863, 1.822384, -0.4993236, 0, 0, 0, 1, 1,
-0.08189679, -0.8607512, -2.623741, 0, 0, 0, 1, 1,
-0.07991487, -1.473094, -3.360539, 0, 0, 0, 1, 1,
-0.07801653, 2.201607, -0.9732533, 0, 0, 0, 1, 1,
-0.0773637, -0.2652739, -4.272279, 1, 1, 1, 1, 1,
-0.07652495, -0.1728184, -3.164109, 1, 1, 1, 1, 1,
-0.07297041, 0.4705743, -0.7412975, 1, 1, 1, 1, 1,
-0.06949303, -1.393687, -3.630272, 1, 1, 1, 1, 1,
-0.06889849, 0.5256234, -0.2437696, 1, 1, 1, 1, 1,
-0.06851887, 0.53195, 0.5253249, 1, 1, 1, 1, 1,
-0.06563193, 1.599055, 1.874397, 1, 1, 1, 1, 1,
-0.06545421, -0.7374592, -4.024343, 1, 1, 1, 1, 1,
-0.06238801, -0.2414432, -2.530995, 1, 1, 1, 1, 1,
-0.05743644, 0.03668801, -0.4271607, 1, 1, 1, 1, 1,
-0.05684927, -1.414195, -2.774857, 1, 1, 1, 1, 1,
-0.05639969, 0.009604556, -1.476445, 1, 1, 1, 1, 1,
-0.0545436, 0.8455729, 0.1709268, 1, 1, 1, 1, 1,
-0.0523136, -0.2969523, -3.162937, 1, 1, 1, 1, 1,
-0.05225753, 0.3967554, -1.586329, 1, 1, 1, 1, 1,
-0.04907753, -1.801633, -2.246239, 0, 0, 1, 1, 1,
-0.04672128, -0.5878986, -3.855179, 1, 0, 0, 1, 1,
-0.04485293, -0.582194, -3.854472, 1, 0, 0, 1, 1,
-0.04459371, 0.1355831, 0.01521322, 1, 0, 0, 1, 1,
-0.03892098, 0.724722, -0.5634046, 1, 0, 0, 1, 1,
-0.03761518, 0.3330255, -0.4149696, 1, 0, 0, 1, 1,
-0.03505706, -0.5260256, -4.20008, 0, 0, 0, 1, 1,
-0.03264526, 0.8799954, -1.682629, 0, 0, 0, 1, 1,
-0.02744452, 1.642964, 1.285712, 0, 0, 0, 1, 1,
-0.02695949, 1.513604, -0.8835263, 0, 0, 0, 1, 1,
-0.025157, 0.4231585, -0.1076105, 0, 0, 0, 1, 1,
-0.01966799, 0.0001937667, -1.956435, 0, 0, 0, 1, 1,
-0.01445292, -0.1852501, -2.063467, 0, 0, 0, 1, 1,
-0.01323091, 0.8319365, 1.050861, 1, 1, 1, 1, 1,
-0.01216776, -0.3054207, -4.289656, 1, 1, 1, 1, 1,
-0.009215408, -1.736324, -2.096983, 1, 1, 1, 1, 1,
-0.004665786, -0.2296241, -2.149642, 1, 1, 1, 1, 1,
-0.004417163, 0.2343463, 0.9087372, 1, 1, 1, 1, 1,
-0.002078949, -0.6642878, -2.168795, 1, 1, 1, 1, 1,
0.001309338, 0.4850864, 0.5048052, 1, 1, 1, 1, 1,
0.003650907, -1.252591, 3.185976, 1, 1, 1, 1, 1,
0.0086273, 0.7604932, -0.6106746, 1, 1, 1, 1, 1,
0.01064489, 0.595899, 0.5846877, 1, 1, 1, 1, 1,
0.01326439, -0.2564967, 3.9666, 1, 1, 1, 1, 1,
0.01417613, -0.2395317, 1.340754, 1, 1, 1, 1, 1,
0.01636007, 1.149394, -0.1834881, 1, 1, 1, 1, 1,
0.01679291, -0.7627649, 2.865272, 1, 1, 1, 1, 1,
0.01792331, -1.199342, 3.869877, 1, 1, 1, 1, 1,
0.02227297, -1.159582, 6.126535, 0, 0, 1, 1, 1,
0.02444939, 0.08188941, 0.08786933, 1, 0, 0, 1, 1,
0.02937916, 2.142377, -0.04901803, 1, 0, 0, 1, 1,
0.03079623, -0.1026191, 0.9343801, 1, 0, 0, 1, 1,
0.03101693, 0.5840218, 0.2349167, 1, 0, 0, 1, 1,
0.03151506, 0.7165406, -1.089722, 1, 0, 0, 1, 1,
0.03276724, 0.1447047, 0.8138268, 0, 0, 0, 1, 1,
0.04361599, -0.9434501, 3.508765, 0, 0, 0, 1, 1,
0.04504374, 0.7342985, 1.451924, 0, 0, 0, 1, 1,
0.04678727, 0.3889359, 1.60016, 0, 0, 0, 1, 1,
0.05411484, 0.3084118, -0.5276141, 0, 0, 0, 1, 1,
0.05481512, -0.9598202, 3.071357, 0, 0, 0, 1, 1,
0.05758511, 0.1074974, 1.177251, 0, 0, 0, 1, 1,
0.06394425, -0.7572497, 2.880883, 1, 1, 1, 1, 1,
0.06419628, 0.2228392, 0.7195612, 1, 1, 1, 1, 1,
0.06464513, 1.021833, -0.7324516, 1, 1, 1, 1, 1,
0.06510212, 0.4112222, -0.2953498, 1, 1, 1, 1, 1,
0.06605046, -0.05522671, 0.610962, 1, 1, 1, 1, 1,
0.06613936, 0.3482445, 1.768198, 1, 1, 1, 1, 1,
0.06645408, 1.445023, 1.081468, 1, 1, 1, 1, 1,
0.06676518, 1.201988, -1.116037, 1, 1, 1, 1, 1,
0.06996351, -0.4309035, 1.234963, 1, 1, 1, 1, 1,
0.07000502, -0.199346, 3.846973, 1, 1, 1, 1, 1,
0.07064278, -1.366142, 4.360145, 1, 1, 1, 1, 1,
0.07596154, 1.712894, 1.755335, 1, 1, 1, 1, 1,
0.07980856, 1.385575, -1.019614, 1, 1, 1, 1, 1,
0.07982858, -0.06682019, 4.025001, 1, 1, 1, 1, 1,
0.08297875, -0.3720834, 3.698134, 1, 1, 1, 1, 1,
0.0845843, -0.6134142, 2.995131, 0, 0, 1, 1, 1,
0.08484114, 0.2770525, -0.01834727, 1, 0, 0, 1, 1,
0.08807696, -0.7279358, 3.434546, 1, 0, 0, 1, 1,
0.09055766, -1.068441, 3.976999, 1, 0, 0, 1, 1,
0.09201721, 0.5195882, 0.6104069, 1, 0, 0, 1, 1,
0.1007073, -0.1106675, 1.693208, 1, 0, 0, 1, 1,
0.1070174, -2.075336, 4.544025, 0, 0, 0, 1, 1,
0.1074088, 0.7005457, 0.3398534, 0, 0, 0, 1, 1,
0.1114669, 1.217429, -0.05739973, 0, 0, 0, 1, 1,
0.1123935, -0.225297, 2.87281, 0, 0, 0, 1, 1,
0.1165713, 1.576689, 0.7514769, 0, 0, 0, 1, 1,
0.1215576, 0.4022784, -0.008828783, 0, 0, 0, 1, 1,
0.122488, 0.6109233, -0.1203855, 0, 0, 0, 1, 1,
0.1231453, 0.1244374, 0.4477535, 1, 1, 1, 1, 1,
0.1252038, 0.4077141, -0.9011543, 1, 1, 1, 1, 1,
0.1305011, 0.4200809, 1.813506, 1, 1, 1, 1, 1,
0.1344396, 1.122152, 0.1699361, 1, 1, 1, 1, 1,
0.1474696, -0.05024557, 1.318602, 1, 1, 1, 1, 1,
0.1479254, -0.8739462, 3.001477, 1, 1, 1, 1, 1,
0.1482603, -1.520528, 2.988415, 1, 1, 1, 1, 1,
0.1482996, -0.7456584, 2.205333, 1, 1, 1, 1, 1,
0.148465, 1.148047, 1.314159, 1, 1, 1, 1, 1,
0.151742, -0.807191, 1.785593, 1, 1, 1, 1, 1,
0.1551118, -1.214696, 4.303022, 1, 1, 1, 1, 1,
0.1610629, 1.49941, 2.008967, 1, 1, 1, 1, 1,
0.1616643, 0.07755465, 3.328769, 1, 1, 1, 1, 1,
0.1621941, 2.439277, -1.240927, 1, 1, 1, 1, 1,
0.1774586, -0.8618201, 1.366379, 1, 1, 1, 1, 1,
0.1790762, -0.3227314, 3.014685, 0, 0, 1, 1, 1,
0.1802956, -1.270091, 2.86368, 1, 0, 0, 1, 1,
0.1833541, -0.09249387, 3.570766, 1, 0, 0, 1, 1,
0.1960255, 0.1595903, 1.06661, 1, 0, 0, 1, 1,
0.1984422, -0.7467332, 1.428683, 1, 0, 0, 1, 1,
0.1993724, -1.082098, 4.339672, 1, 0, 0, 1, 1,
0.2119416, 0.4520085, 0.3185024, 0, 0, 0, 1, 1,
0.2146437, 0.2041216, 2.624061, 0, 0, 0, 1, 1,
0.2164723, -0.1174691, 0.05582375, 0, 0, 0, 1, 1,
0.2210814, 0.236259, 1.560661, 0, 0, 0, 1, 1,
0.2283806, -0.4237031, 3.890067, 0, 0, 0, 1, 1,
0.2329656, 0.1530111, 1.05065, 0, 0, 0, 1, 1,
0.2396762, -0.5082814, 4.891149, 0, 0, 0, 1, 1,
0.2445286, -1.302495, 3.135041, 1, 1, 1, 1, 1,
0.2464034, 0.575622, 1.33401, 1, 1, 1, 1, 1,
0.2506282, 0.2244194, 0.2169527, 1, 1, 1, 1, 1,
0.2552431, -2.141384, 3.608122, 1, 1, 1, 1, 1,
0.2596302, 0.6272311, 1.746366, 1, 1, 1, 1, 1,
0.2612722, -0.1118471, 3.177585, 1, 1, 1, 1, 1,
0.264107, -0.3670168, 2.193401, 1, 1, 1, 1, 1,
0.2649357, -0.1547684, 2.415446, 1, 1, 1, 1, 1,
0.2678785, -0.3834679, 1.970884, 1, 1, 1, 1, 1,
0.2697909, 2.248423, 0.2873672, 1, 1, 1, 1, 1,
0.2736202, 0.03663858, 3.635235, 1, 1, 1, 1, 1,
0.2755515, -1.018938, 3.390017, 1, 1, 1, 1, 1,
0.2818518, 0.6123224, -0.7213448, 1, 1, 1, 1, 1,
0.2828346, 0.7715335, -0.259704, 1, 1, 1, 1, 1,
0.2851617, -0.8764024, 2.451009, 1, 1, 1, 1, 1,
0.2852618, 0.04109596, 2.015056, 0, 0, 1, 1, 1,
0.2857871, -1.632735, 3.443273, 1, 0, 0, 1, 1,
0.2884519, -0.2689866, 3.917872, 1, 0, 0, 1, 1,
0.2889183, -1.33448, 4.776832, 1, 0, 0, 1, 1,
0.2899475, 0.3310696, -0.2359461, 1, 0, 0, 1, 1,
0.2904628, -1.394201, 4.019432, 1, 0, 0, 1, 1,
0.2953601, 1.546675, 0.7298452, 0, 0, 0, 1, 1,
0.2958318, 1.325199, 0.3341332, 0, 0, 0, 1, 1,
0.3033384, -0.9710531, 4.3799, 0, 0, 0, 1, 1,
0.3035026, 1.08069, 0.9637214, 0, 0, 0, 1, 1,
0.304911, 0.1637193, 0.9392727, 0, 0, 0, 1, 1,
0.3063829, 0.158593, 1.210043, 0, 0, 0, 1, 1,
0.3119553, 0.5828309, 1.618417, 0, 0, 0, 1, 1,
0.3132106, -0.479977, 1.773484, 1, 1, 1, 1, 1,
0.3147281, 1.794433, 1.533967, 1, 1, 1, 1, 1,
0.3154789, -0.5853556, 1.66906, 1, 1, 1, 1, 1,
0.3173496, 0.3058024, 2.205051, 1, 1, 1, 1, 1,
0.3177784, 1.070126, 0.3576188, 1, 1, 1, 1, 1,
0.31844, 1.717112, -0.2032955, 1, 1, 1, 1, 1,
0.3213803, 1.824281, -1.50031, 1, 1, 1, 1, 1,
0.3229411, 1.214821, 0.2430534, 1, 1, 1, 1, 1,
0.3250458, -0.525361, 3.854149, 1, 1, 1, 1, 1,
0.3251585, 0.08383942, 2.303982, 1, 1, 1, 1, 1,
0.3254865, 1.084552, 0.3143145, 1, 1, 1, 1, 1,
0.326896, 1.105097, 0.9333028, 1, 1, 1, 1, 1,
0.3378079, 1.086374, 1.673243, 1, 1, 1, 1, 1,
0.3383203, -0.8833739, 3.44012, 1, 1, 1, 1, 1,
0.3391379, 0.04832373, 2.305467, 1, 1, 1, 1, 1,
0.340889, 1.683472, 0.01999865, 0, 0, 1, 1, 1,
0.3417787, -0.2002194, 0.2640163, 1, 0, 0, 1, 1,
0.3420722, -0.6283504, 0.8559129, 1, 0, 0, 1, 1,
0.3441348, -0.3158606, 2.492147, 1, 0, 0, 1, 1,
0.3445521, 0.2740166, 0.2841096, 1, 0, 0, 1, 1,
0.3461566, -0.5609854, 2.285889, 1, 0, 0, 1, 1,
0.3472354, -0.004602563, 1.554732, 0, 0, 0, 1, 1,
0.3520794, 0.8002673, 1.173605, 0, 0, 0, 1, 1,
0.3524548, -0.2114174, 2.110734, 0, 0, 0, 1, 1,
0.3528554, 1.394485, 1.311816, 0, 0, 0, 1, 1,
0.3539102, 0.6968554, 1.008145, 0, 0, 0, 1, 1,
0.3550334, -0.2029563, 1.686388, 0, 0, 0, 1, 1,
0.3573515, -0.006190237, 2.038042, 0, 0, 0, 1, 1,
0.3586489, 0.2619262, 1.364777, 1, 1, 1, 1, 1,
0.3606289, 0.1321245, -1.301239, 1, 1, 1, 1, 1,
0.3629599, 0.2568207, 1.236764, 1, 1, 1, 1, 1,
0.3684147, 0.2589074, 1.114198, 1, 1, 1, 1, 1,
0.3700199, 0.7623408, 0.3379707, 1, 1, 1, 1, 1,
0.3729344, -0.5043558, 2.696157, 1, 1, 1, 1, 1,
0.3759144, -0.01006671, 3.408144, 1, 1, 1, 1, 1,
0.3784548, -0.2419351, 1.368707, 1, 1, 1, 1, 1,
0.3835243, -1.705254, 2.917279, 1, 1, 1, 1, 1,
0.3835727, 0.4869754, -0.07914948, 1, 1, 1, 1, 1,
0.3842104, -0.6918249, 3.37699, 1, 1, 1, 1, 1,
0.3923975, 1.946795, -0.2307039, 1, 1, 1, 1, 1,
0.3981465, -1.992131, 4.978785, 1, 1, 1, 1, 1,
0.3995102, 1.687134, 0.09910204, 1, 1, 1, 1, 1,
0.4114389, -0.5982565, 2.948236, 1, 1, 1, 1, 1,
0.4114499, -0.2581501, 2.417856, 0, 0, 1, 1, 1,
0.4177165, -0.03893734, 1.965255, 1, 0, 0, 1, 1,
0.4216554, -1.651682, 2.604697, 1, 0, 0, 1, 1,
0.4234572, 1.32288, -0.584236, 1, 0, 0, 1, 1,
0.4323827, 1.11336, 0.08678, 1, 0, 0, 1, 1,
0.4345802, -0.1811168, 2.452463, 1, 0, 0, 1, 1,
0.4345973, -1.263586, 2.587784, 0, 0, 0, 1, 1,
0.4349976, 0.06932468, 2.010399, 0, 0, 0, 1, 1,
0.4363227, 0.07703017, 2.485583, 0, 0, 0, 1, 1,
0.4366474, -0.8169726, 3.177554, 0, 0, 0, 1, 1,
0.4383873, -1.763014, 1.646638, 0, 0, 0, 1, 1,
0.4395197, 0.815433, -0.4546896, 0, 0, 0, 1, 1,
0.4396763, -0.2749943, 1.306293, 0, 0, 0, 1, 1,
0.4402974, 2.08661, 0.967405, 1, 1, 1, 1, 1,
0.4431253, -3.194293, 2.251883, 1, 1, 1, 1, 1,
0.4465673, -0.4995599, 2.524107, 1, 1, 1, 1, 1,
0.4472093, -0.1473089, 1.820078, 1, 1, 1, 1, 1,
0.4495001, -0.9998907, 1.35527, 1, 1, 1, 1, 1,
0.4495741, -0.1699514, 2.694297, 1, 1, 1, 1, 1,
0.4503943, -0.08830173, 2.898856, 1, 1, 1, 1, 1,
0.4557399, -0.6999853, 2.70527, 1, 1, 1, 1, 1,
0.4557902, -0.323986, 2.619184, 1, 1, 1, 1, 1,
0.4560553, 1.110702, 1.566171, 1, 1, 1, 1, 1,
0.4600925, -0.07715715, 3.699861, 1, 1, 1, 1, 1,
0.4607731, 0.6316297, 3.104806, 1, 1, 1, 1, 1,
0.4616217, -0.1033914, 2.621524, 1, 1, 1, 1, 1,
0.462889, -0.6063904, 0.7536516, 1, 1, 1, 1, 1,
0.4724239, -0.7682292, 3.684629, 1, 1, 1, 1, 1,
0.4735487, 0.915805, -0.4474407, 0, 0, 1, 1, 1,
0.4741862, -1.249992, 3.129886, 1, 0, 0, 1, 1,
0.4751263, -1.103637, 2.097408, 1, 0, 0, 1, 1,
0.4758996, 1.245804, -0.506476, 1, 0, 0, 1, 1,
0.4770295, 0.7088857, 0.1914324, 1, 0, 0, 1, 1,
0.4811425, 0.9437593, -0.0825934, 1, 0, 0, 1, 1,
0.4815268, -1.260024, 1.666232, 0, 0, 0, 1, 1,
0.4826516, 1.016908, 0.1182367, 0, 0, 0, 1, 1,
0.4837031, -2.11315, 3.292666, 0, 0, 0, 1, 1,
0.4847006, 0.00648559, 2.104424, 0, 0, 0, 1, 1,
0.48502, 1.586488, -2.585418, 0, 0, 0, 1, 1,
0.4911128, -0.3981718, 3.132352, 0, 0, 0, 1, 1,
0.4916281, -2.211957, 4.503522, 0, 0, 0, 1, 1,
0.4919818, -0.7539891, 3.455713, 1, 1, 1, 1, 1,
0.4939362, 0.1194306, 0.3563477, 1, 1, 1, 1, 1,
0.495089, -0.667783, 2.388402, 1, 1, 1, 1, 1,
0.4980354, 1.089637, 2.5138, 1, 1, 1, 1, 1,
0.49877, 1.414666, -0.2624489, 1, 1, 1, 1, 1,
0.500235, 0.5713965, -0.05761869, 1, 1, 1, 1, 1,
0.5009432, -2.292813, 3.163959, 1, 1, 1, 1, 1,
0.5016754, 1.46947, 2.165945, 1, 1, 1, 1, 1,
0.5036861, -0.8478282, 3.101729, 1, 1, 1, 1, 1,
0.5056035, 0.4657252, -0.2853454, 1, 1, 1, 1, 1,
0.5063462, 1.585772, 0.4687883, 1, 1, 1, 1, 1,
0.5073915, 0.4977354, 0.6131619, 1, 1, 1, 1, 1,
0.5085081, 0.303574, 0.8873712, 1, 1, 1, 1, 1,
0.5096886, -1.710466, 3.032383, 1, 1, 1, 1, 1,
0.5101148, -1.875578, 2.707321, 1, 1, 1, 1, 1,
0.5139285, 0.6081328, -0.1220096, 0, 0, 1, 1, 1,
0.5172594, 0.6607645, -0.2275755, 1, 0, 0, 1, 1,
0.5193188, 1.437487, -1.044942, 1, 0, 0, 1, 1,
0.5220579, -2.520153, 1.632952, 1, 0, 0, 1, 1,
0.5272085, -0.03251106, 3.244184, 1, 0, 0, 1, 1,
0.5292768, -0.1212873, 2.307396, 1, 0, 0, 1, 1,
0.5301105, 1.087068, 0.004746871, 0, 0, 0, 1, 1,
0.5336502, -0.06463866, 1.215743, 0, 0, 0, 1, 1,
0.5345728, -0.1836691, 2.212759, 0, 0, 0, 1, 1,
0.5374551, -0.6227986, 4.506644, 0, 0, 0, 1, 1,
0.5375034, 0.5373741, 0.6392186, 0, 0, 0, 1, 1,
0.5403284, -0.9281825, 1.51723, 0, 0, 0, 1, 1,
0.5405057, -1.904121, 4.329593, 0, 0, 0, 1, 1,
0.5424312, -1.29516, 1.310021, 1, 1, 1, 1, 1,
0.5429261, 1.392976, -0.4523947, 1, 1, 1, 1, 1,
0.5445566, -0.2582773, 1.603272, 1, 1, 1, 1, 1,
0.5485415, 0.9323389, -1.18833, 1, 1, 1, 1, 1,
0.5485629, 0.2950402, 1.766574, 1, 1, 1, 1, 1,
0.5499526, -1.136999, 4.366445, 1, 1, 1, 1, 1,
0.5555405, 1.091444, 0.6940871, 1, 1, 1, 1, 1,
0.5590006, 0.367395, 1.893487, 1, 1, 1, 1, 1,
0.5629669, 0.0116856, 3.121286, 1, 1, 1, 1, 1,
0.5805203, -0.9127427, 3.355996, 1, 1, 1, 1, 1,
0.5815351, 0.3472472, 1.851747, 1, 1, 1, 1, 1,
0.5820071, 1.19397, 0.1810692, 1, 1, 1, 1, 1,
0.5833159, 2.235648, 0.309403, 1, 1, 1, 1, 1,
0.6002256, -0.496192, 2.3299, 1, 1, 1, 1, 1,
0.6031586, -0.8934664, 3.352939, 1, 1, 1, 1, 1,
0.6082225, 1.226734, -1.726639, 0, 0, 1, 1, 1,
0.6096214, -0.2617385, -0.4929026, 1, 0, 0, 1, 1,
0.6130207, -1.246453, 2.186747, 1, 0, 0, 1, 1,
0.6136512, 0.0495568, 1.08097, 1, 0, 0, 1, 1,
0.6164864, -0.3410543, 1.149827, 1, 0, 0, 1, 1,
0.6168539, 0.4571662, 0.6987212, 1, 0, 0, 1, 1,
0.6168776, -2.200276, 0.7716736, 0, 0, 0, 1, 1,
0.6176841, 0.5286217, 1.352018, 0, 0, 0, 1, 1,
0.6190441, 1.518344, -2.529589, 0, 0, 0, 1, 1,
0.6209149, -1.770531, 3.45651, 0, 0, 0, 1, 1,
0.6233491, -0.2511673, 2.005412, 0, 0, 0, 1, 1,
0.6281847, -0.4401079, 1.843569, 0, 0, 0, 1, 1,
0.6282296, 1.000068, 2.251242, 0, 0, 0, 1, 1,
0.6283014, -1.412714, 3.571653, 1, 1, 1, 1, 1,
0.6294408, -0.6975694, 1.385956, 1, 1, 1, 1, 1,
0.6307084, 0.2872191, 1.202489, 1, 1, 1, 1, 1,
0.6307102, 0.1526566, 1.396057, 1, 1, 1, 1, 1,
0.6314847, 0.819751, 0.8491519, 1, 1, 1, 1, 1,
0.6317565, 0.3767777, 4.117338, 1, 1, 1, 1, 1,
0.6385417, -2.609591, 2.103065, 1, 1, 1, 1, 1,
0.6387084, 0.349637, 0.5789326, 1, 1, 1, 1, 1,
0.6411992, -0.1707446, 1.103341, 1, 1, 1, 1, 1,
0.6424538, 1.129035, 1.28968, 1, 1, 1, 1, 1,
0.642793, -0.5571526, 3.992879, 1, 1, 1, 1, 1,
0.6481006, -0.156833, 2.440056, 1, 1, 1, 1, 1,
0.6634013, 0.1668603, 2.733993, 1, 1, 1, 1, 1,
0.6642393, -0.2040426, 1.190973, 1, 1, 1, 1, 1,
0.6651921, 0.7550198, 0.131196, 1, 1, 1, 1, 1,
0.6663765, 1.56087, 2.603701, 0, 0, 1, 1, 1,
0.6669624, 0.9462191, 0.7265013, 1, 0, 0, 1, 1,
0.6706929, -1.140468, 1.451102, 1, 0, 0, 1, 1,
0.6731808, 1.116245, 1.515105, 1, 0, 0, 1, 1,
0.6768318, -0.9049006, 3.084801, 1, 0, 0, 1, 1,
0.6869167, 0.7294806, 0.968604, 1, 0, 0, 1, 1,
0.6891669, 1.100968, 2.34996, 0, 0, 0, 1, 1,
0.7005777, -0.1236147, 0.4049939, 0, 0, 0, 1, 1,
0.7006003, 1.039826, 0.4724127, 0, 0, 0, 1, 1,
0.7008196, 0.270923, 0.1721191, 0, 0, 0, 1, 1,
0.7032179, -1.102023, 4.586181, 0, 0, 0, 1, 1,
0.7049379, 0.02923208, 0.2549267, 0, 0, 0, 1, 1,
0.7062519, -1.897472, 3.827089, 0, 0, 0, 1, 1,
0.7084301, -0.1413771, 2.300323, 1, 1, 1, 1, 1,
0.7148268, -0.1506159, 0.3762994, 1, 1, 1, 1, 1,
0.7153841, -1.608991, 3.049996, 1, 1, 1, 1, 1,
0.719605, 0.05001269, 3.173457, 1, 1, 1, 1, 1,
0.7287815, 1.309748, 0.4198679, 1, 1, 1, 1, 1,
0.7311761, -0.6424273, -0.03687907, 1, 1, 1, 1, 1,
0.7318934, -0.4144225, 3.601073, 1, 1, 1, 1, 1,
0.7323643, -0.5233417, 3.056651, 1, 1, 1, 1, 1,
0.7381331, -1.579297, 3.400325, 1, 1, 1, 1, 1,
0.7396832, 0.5470842, 1.241655, 1, 1, 1, 1, 1,
0.7589357, 0.02748688, 2.289814, 1, 1, 1, 1, 1,
0.759709, -0.6485818, 0.2191673, 1, 1, 1, 1, 1,
0.7633426, 0.789555, -0.7395818, 1, 1, 1, 1, 1,
0.7667312, 0.7281252, -1.203397, 1, 1, 1, 1, 1,
0.7683589, -0.2140099, 1.88565, 1, 1, 1, 1, 1,
0.7684918, 0.4614842, 0.1027158, 0, 0, 1, 1, 1,
0.7728992, 0.6358123, 0.9233087, 1, 0, 0, 1, 1,
0.7729003, 1.573148, -0.1589983, 1, 0, 0, 1, 1,
0.7733812, 1.307817, 1.863682, 1, 0, 0, 1, 1,
0.7805131, -0.7481844, 0.5539321, 1, 0, 0, 1, 1,
0.7847477, -0.9817587, 1.866759, 1, 0, 0, 1, 1,
0.7902605, -1.783166, 2.682113, 0, 0, 0, 1, 1,
0.7909847, -0.9949111, 2.897668, 0, 0, 0, 1, 1,
0.7987827, -1.048451, 3.158442, 0, 0, 0, 1, 1,
0.8014337, -0.6102021, 3.024422, 0, 0, 0, 1, 1,
0.8055777, -1.200427, 2.351355, 0, 0, 0, 1, 1,
0.8099461, 0.1820989, 3.320899, 0, 0, 0, 1, 1,
0.8160474, 0.2322789, 2.174752, 0, 0, 0, 1, 1,
0.8201113, 1.203792, 0.2788418, 1, 1, 1, 1, 1,
0.8207718, -0.08735666, 3.511094, 1, 1, 1, 1, 1,
0.824205, 0.348483, 2.580965, 1, 1, 1, 1, 1,
0.8248203, 0.2228342, 0.6036861, 1, 1, 1, 1, 1,
0.8289022, -0.1369433, 0.4787519, 1, 1, 1, 1, 1,
0.8310577, 0.5314119, -0.2481336, 1, 1, 1, 1, 1,
0.832283, -0.7184042, 3.3465, 1, 1, 1, 1, 1,
0.8342882, 1.419835, 0.1413752, 1, 1, 1, 1, 1,
0.8396485, 0.4016486, 1.41899, 1, 1, 1, 1, 1,
0.8400787, 0.543844, 2.315564, 1, 1, 1, 1, 1,
0.8453515, -0.03857672, 1.178822, 1, 1, 1, 1, 1,
0.8504945, 0.1535491, 1.128854, 1, 1, 1, 1, 1,
0.8551503, -0.4179392, 1.078689, 1, 1, 1, 1, 1,
0.8575687, -0.08975776, 1.379597, 1, 1, 1, 1, 1,
0.8638104, -0.3206842, 1.606224, 1, 1, 1, 1, 1,
0.8826201, 0.2608452, 1.589522, 0, 0, 1, 1, 1,
0.8860029, 1.467096, 1.009951, 1, 0, 0, 1, 1,
0.8874915, 0.1260029, 2.779257, 1, 0, 0, 1, 1,
0.8876629, -1.553143, 3.236259, 1, 0, 0, 1, 1,
0.891087, -0.05839908, 1.205263, 1, 0, 0, 1, 1,
0.8944348, -0.7491526, 3.067818, 1, 0, 0, 1, 1,
0.9114913, -1.176637, 4.911397, 0, 0, 0, 1, 1,
0.9142049, 0.09915886, -0.05545868, 0, 0, 0, 1, 1,
0.9163898, -1.370585, 2.155162, 0, 0, 0, 1, 1,
0.9198316, -1.53337, 2.543883, 0, 0, 0, 1, 1,
0.9211645, -1.644593, 3.423166, 0, 0, 0, 1, 1,
0.9261082, 0.7948706, 0.9018618, 0, 0, 0, 1, 1,
0.930592, 0.3730975, 1.925129, 0, 0, 0, 1, 1,
0.9427306, 1.245606, 1.021204, 1, 1, 1, 1, 1,
0.9455147, 0.02109326, 2.116162, 1, 1, 1, 1, 1,
0.9485927, 0.2809727, 0.4155349, 1, 1, 1, 1, 1,
0.9547735, 0.7365534, 2.009041, 1, 1, 1, 1, 1,
0.9551809, 0.6933709, 1.773254, 1, 1, 1, 1, 1,
0.9693305, 0.5787398, 2.090134, 1, 1, 1, 1, 1,
0.9736344, -0.4367324, 1.534772, 1, 1, 1, 1, 1,
0.9787433, -1.174685, 2.558739, 1, 1, 1, 1, 1,
0.9824815, 0.499303, 1.633804, 1, 1, 1, 1, 1,
0.9888368, 1.821095, 0.2835689, 1, 1, 1, 1, 1,
0.996352, -0.4767396, 2.44534, 1, 1, 1, 1, 1,
0.9979275, 0.797156, -0.1876034, 1, 1, 1, 1, 1,
0.9981799, -1.212804, 2.596944, 1, 1, 1, 1, 1,
1.023055, 0.3871453, 1.014226, 1, 1, 1, 1, 1,
1.02462, 1.096231, -0.07285868, 1, 1, 1, 1, 1,
1.024777, 1.357023, 1.685678, 0, 0, 1, 1, 1,
1.028708, 0.2592557, 1.049142, 1, 0, 0, 1, 1,
1.038892, -0.6160803, 1.056756, 1, 0, 0, 1, 1,
1.040296, -0.07526852, 1.585855, 1, 0, 0, 1, 1,
1.044024, -0.7012464, 1.219293, 1, 0, 0, 1, 1,
1.050578, -0.0456892, 0.6661857, 1, 0, 0, 1, 1,
1.061692, -1.843873, 2.670448, 0, 0, 0, 1, 1,
1.061901, 0.5458586, -0.1182387, 0, 0, 0, 1, 1,
1.065449, 0.0959352, 2.158113, 0, 0, 0, 1, 1,
1.067528, -1.206895, 2.131962, 0, 0, 0, 1, 1,
1.06908, 0.4929016, 1.336768, 0, 0, 0, 1, 1,
1.070885, -1.039122, 4.108591, 0, 0, 0, 1, 1,
1.074528, -1.43004, 2.296623, 0, 0, 0, 1, 1,
1.097052, 0.06661479, 1.894061, 1, 1, 1, 1, 1,
1.117734, -0.6848455, 1.553296, 1, 1, 1, 1, 1,
1.130323, 0.431632, 1.019971, 1, 1, 1, 1, 1,
1.136858, 1.098638, 1.657622, 1, 1, 1, 1, 1,
1.147235, -0.5224417, 2.110227, 1, 1, 1, 1, 1,
1.154016, 0.06370603, 1.42722, 1, 1, 1, 1, 1,
1.154594, 1.419423, 1.261565, 1, 1, 1, 1, 1,
1.155806, -0.8493884, 1.957221, 1, 1, 1, 1, 1,
1.157412, 0.9820879, 0.7335626, 1, 1, 1, 1, 1,
1.160093, 1.472811, 0.2759995, 1, 1, 1, 1, 1,
1.160756, 0.4589383, 1.927293, 1, 1, 1, 1, 1,
1.162173, -0.06826374, 2.41648, 1, 1, 1, 1, 1,
1.16347, -1.370326, 2.734103, 1, 1, 1, 1, 1,
1.175213, 1.900199, -0.4751929, 1, 1, 1, 1, 1,
1.183122, 0.1948808, 0.4638431, 1, 1, 1, 1, 1,
1.186061, 1.090278, 1.116715, 0, 0, 1, 1, 1,
1.220573, 1.141696, -0.04288901, 1, 0, 0, 1, 1,
1.230592, -1.88836, -0.4589887, 1, 0, 0, 1, 1,
1.235473, -0.2046649, 1.437585, 1, 0, 0, 1, 1,
1.246081, 0.627608, 2.046951, 1, 0, 0, 1, 1,
1.24613, -0.07615028, 0.7859939, 1, 0, 0, 1, 1,
1.246153, -0.1221162, 1.666583, 0, 0, 0, 1, 1,
1.25035, 0.3598238, 1.177726, 0, 0, 0, 1, 1,
1.257267, 0.02698304, 0.784301, 0, 0, 0, 1, 1,
1.272532, 0.5641689, 1.311022, 0, 0, 0, 1, 1,
1.278333, -1.67816, 2.681004, 0, 0, 0, 1, 1,
1.31206, 0.04459855, 1.202261, 0, 0, 0, 1, 1,
1.315424, 0.6097807, 0.9597869, 0, 0, 0, 1, 1,
1.316168, -0.4073741, 1.877916, 1, 1, 1, 1, 1,
1.318799, -0.9177865, 3.567945, 1, 1, 1, 1, 1,
1.320476, 0.6310927, 2.27013, 1, 1, 1, 1, 1,
1.32381, 0.7102557, 3.003071, 1, 1, 1, 1, 1,
1.33156, 0.08835024, 0.4522587, 1, 1, 1, 1, 1,
1.332317, 0.2864855, -0.167423, 1, 1, 1, 1, 1,
1.340629, -0.3457579, 0.64601, 1, 1, 1, 1, 1,
1.36552, -1.894384, 1.294867, 1, 1, 1, 1, 1,
1.370031, -1.490067, 2.793903, 1, 1, 1, 1, 1,
1.389706, 1.017714, 1.10338, 1, 1, 1, 1, 1,
1.408489, -1.097737, 2.372035, 1, 1, 1, 1, 1,
1.410143, -1.358713, 3.427934, 1, 1, 1, 1, 1,
1.421263, 0.1319122, 0.9829297, 1, 1, 1, 1, 1,
1.424027, -1.303788, 4.078841, 1, 1, 1, 1, 1,
1.433374, 0.8920679, 2.627481, 1, 1, 1, 1, 1,
1.438783, -1.763953, 3.699559, 0, 0, 1, 1, 1,
1.443733, -1.063527, 4.654658, 1, 0, 0, 1, 1,
1.452942, -1.07301, 3.212726, 1, 0, 0, 1, 1,
1.453614, 0.3361526, 0.3664016, 1, 0, 0, 1, 1,
1.462345, 0.3259195, 2.022911, 1, 0, 0, 1, 1,
1.463702, 0.8877856, -0.7490096, 1, 0, 0, 1, 1,
1.46376, -1.648747, 0.8533621, 0, 0, 0, 1, 1,
1.464994, 0.2200317, 0.4094163, 0, 0, 0, 1, 1,
1.480912, -0.1121448, 2.238931, 0, 0, 0, 1, 1,
1.484859, 1.759979, 1.925907, 0, 0, 0, 1, 1,
1.489721, -0.9262082, 2.336125, 0, 0, 0, 1, 1,
1.492241, -1.205426, 3.597435, 0, 0, 0, 1, 1,
1.493033, 1.153524, -0.4062019, 0, 0, 0, 1, 1,
1.502679, -0.4172809, 1.951775, 1, 1, 1, 1, 1,
1.503703, -1.236084, 1.958, 1, 1, 1, 1, 1,
1.524783, -1.783455, 2.853638, 1, 1, 1, 1, 1,
1.539841, 1.147358, 0.7885412, 1, 1, 1, 1, 1,
1.549609, -0.2076232, 1.626754, 1, 1, 1, 1, 1,
1.549712, -0.341528, 3.691116, 1, 1, 1, 1, 1,
1.558002, 0.4933139, 1.350996, 1, 1, 1, 1, 1,
1.567738, 1.051003, 1.538058, 1, 1, 1, 1, 1,
1.574137, 0.1986251, 2.174112, 1, 1, 1, 1, 1,
1.577605, 0.1211308, 2.079502, 1, 1, 1, 1, 1,
1.57787, 0.9346319, 0.5231518, 1, 1, 1, 1, 1,
1.600713, -0.272103, 2.709074, 1, 1, 1, 1, 1,
1.600731, 1.183398, -0.1858734, 1, 1, 1, 1, 1,
1.627891, -1.723567, 2.013885, 1, 1, 1, 1, 1,
1.635884, -1.450292, 2.747495, 1, 1, 1, 1, 1,
1.638655, -2.210779, 4.106513, 0, 0, 1, 1, 1,
1.640517, 0.06233971, 1.807909, 1, 0, 0, 1, 1,
1.641359, 0.2678552, 2.686462, 1, 0, 0, 1, 1,
1.657367, -1.071714, 3.165678, 1, 0, 0, 1, 1,
1.668707, 0.6287035, 1.262737, 1, 0, 0, 1, 1,
1.69263, -0.1991648, 2.297908, 1, 0, 0, 1, 1,
1.700067, -0.5041894, 2.198757, 0, 0, 0, 1, 1,
1.704013, -0.8497635, 2.927216, 0, 0, 0, 1, 1,
1.73051, 0.05034485, 1.870778, 0, 0, 0, 1, 1,
1.749502, -1.215921, 2.834206, 0, 0, 0, 1, 1,
1.755304, -0.2280103, 1.188547, 0, 0, 0, 1, 1,
1.763865, 0.5655518, 1.588482, 0, 0, 0, 1, 1,
1.770268, 0.03788934, 2.667208, 0, 0, 0, 1, 1,
1.770308, 0.2138088, 2.085618, 1, 1, 1, 1, 1,
1.774686, 0.1561613, 1.778982, 1, 1, 1, 1, 1,
1.806624, -0.2829046, 1.943631, 1, 1, 1, 1, 1,
1.831142, 0.6584314, 2.666969, 1, 1, 1, 1, 1,
1.855001, 0.5403787, 2.297163, 1, 1, 1, 1, 1,
1.873919, -0.6419561, 3.290228, 1, 1, 1, 1, 1,
1.891315, -0.1591826, 1.598066, 1, 1, 1, 1, 1,
1.897525, 0.8458397, 0.4912949, 1, 1, 1, 1, 1,
1.903484, 0.6919994, 0.7593235, 1, 1, 1, 1, 1,
1.914705, -0.1009056, 0.1888902, 1, 1, 1, 1, 1,
1.916814, -0.5766672, 2.690685, 1, 1, 1, 1, 1,
1.919329, 0.608702, 1.24912, 1, 1, 1, 1, 1,
1.929849, -0.8315514, 0.2888807, 1, 1, 1, 1, 1,
1.943557, 0.5255007, 2.637054, 1, 1, 1, 1, 1,
2.022794, 2.548119, 2.00219, 1, 1, 1, 1, 1,
2.039956, 0.4456002, 0.3198987, 0, 0, 1, 1, 1,
2.041064, 0.4372256, 1.123824, 1, 0, 0, 1, 1,
2.069566, -0.216085, 1.27034, 1, 0, 0, 1, 1,
2.081915, 1.680878, -0.3950219, 1, 0, 0, 1, 1,
2.083027, 0.03067682, 0.3050386, 1, 0, 0, 1, 1,
2.133745, 1.433996, -0.6401095, 1, 0, 0, 1, 1,
2.142569, 0.660242, 1.93922, 0, 0, 0, 1, 1,
2.211714, 1.162052, -0.6298882, 0, 0, 0, 1, 1,
2.286277, 2.472202, 1.085958, 0, 0, 0, 1, 1,
2.287125, 0.3841482, 1.053741, 0, 0, 0, 1, 1,
2.288321, 1.511597, 1.307081, 0, 0, 0, 1, 1,
2.30516, 0.7342713, 1.016419, 0, 0, 0, 1, 1,
2.328763, 0.9565681, 1.38736, 0, 0, 0, 1, 1,
2.443415, 1.088611, 0.8058316, 1, 1, 1, 1, 1,
2.46124, -2.166007, 2.775635, 1, 1, 1, 1, 1,
2.558466, -0.1007537, -0.09650237, 1, 1, 1, 1, 1,
2.645195, 0.6716133, 0.7271464, 1, 1, 1, 1, 1,
2.709539, -0.261121, 2.021688, 1, 1, 1, 1, 1,
2.964369, -0.5544773, 2.532963, 1, 1, 1, 1, 1,
2.969517, -0.8202515, 0.3335492, 1, 1, 1, 1, 1
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
var radius = 9.971497;
var distance = 35.02446;
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
mvMatrix.translate( 0.07524443, -0.1682305, -0.2867634 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.02446);
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