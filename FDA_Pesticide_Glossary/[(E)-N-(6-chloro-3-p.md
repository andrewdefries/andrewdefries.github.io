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
-2.906806, -1.486994, -0.8044795, 1, 0, 0, 1,
-2.862906, 0.4239978, -2.562083, 1, 0.007843138, 0, 1,
-2.832663, 0.5337751, -1.618849, 1, 0.01176471, 0, 1,
-2.494337, -0.9590987, -2.073948, 1, 0.01960784, 0, 1,
-2.408563, -0.7064946, -3.162966, 1, 0.02352941, 0, 1,
-2.302, -1.938794, -2.465498, 1, 0.03137255, 0, 1,
-2.273529, 2.216231, -1.105139, 1, 0.03529412, 0, 1,
-2.258062, 1.779437, -0.4357778, 1, 0.04313726, 0, 1,
-2.14175, 0.4913167, -1.042293, 1, 0.04705882, 0, 1,
-2.117722, 0.5777727, 0.1455864, 1, 0.05490196, 0, 1,
-2.114079, -0.08794652, -1.071298, 1, 0.05882353, 0, 1,
-2.108677, 0.6488224, -3.788758, 1, 0.06666667, 0, 1,
-2.076056, -0.6168612, -1.223266, 1, 0.07058824, 0, 1,
-2.059691, 0.4897232, -1.349824, 1, 0.07843138, 0, 1,
-2.007285, -0.0879641, -0.5803142, 1, 0.08235294, 0, 1,
-2.000916, -1.427731, -3.816277, 1, 0.09019608, 0, 1,
-1.979529, -0.9194568, -1.304943, 1, 0.09411765, 0, 1,
-1.888604, 0.1889469, -1.282534, 1, 0.1019608, 0, 1,
-1.879506, 0.04054466, -1.345705, 1, 0.1098039, 0, 1,
-1.870766, 1.440535, -1.464769, 1, 0.1137255, 0, 1,
-1.868953, 0.2394716, -0.226601, 1, 0.1215686, 0, 1,
-1.861974, 1.362082, -0.9251497, 1, 0.1254902, 0, 1,
-1.845867, -0.3746696, 0.3323286, 1, 0.1333333, 0, 1,
-1.836313, -0.5244665, -1.918025, 1, 0.1372549, 0, 1,
-1.815727, -1.643683, -2.910758, 1, 0.145098, 0, 1,
-1.812961, 0.5400486, -2.082494, 1, 0.1490196, 0, 1,
-1.809919, -0.372743, -1.434396, 1, 0.1568628, 0, 1,
-1.807406, -0.6338338, -1.997491, 1, 0.1607843, 0, 1,
-1.806628, -1.229708, -1.703408, 1, 0.1686275, 0, 1,
-1.805061, -0.8781973, -1.258056, 1, 0.172549, 0, 1,
-1.801059, -0.1029503, -0.7066723, 1, 0.1803922, 0, 1,
-1.789095, 0.07829466, -1.438768, 1, 0.1843137, 0, 1,
-1.771293, -0.7485495, -3.176163, 1, 0.1921569, 0, 1,
-1.770308, -0.1047674, -1.732341, 1, 0.1960784, 0, 1,
-1.762975, 2.261843, -1.839957, 1, 0.2039216, 0, 1,
-1.75522, 0.8279829, 0.04802744, 1, 0.2117647, 0, 1,
-1.7434, 0.7649151, -0.9085429, 1, 0.2156863, 0, 1,
-1.716039, 0.1733362, -1.679373, 1, 0.2235294, 0, 1,
-1.71379, 0.3734381, -0.2844583, 1, 0.227451, 0, 1,
-1.710625, 0.5057448, -0.6255962, 1, 0.2352941, 0, 1,
-1.702844, 0.922701, 0.05739364, 1, 0.2392157, 0, 1,
-1.694741, -1.95752, -1.721402, 1, 0.2470588, 0, 1,
-1.652686, -1.5772, -2.43271, 1, 0.2509804, 0, 1,
-1.649819, 0.506852, -0.5321921, 1, 0.2588235, 0, 1,
-1.641922, -0.9802902, -2.593733, 1, 0.2627451, 0, 1,
-1.637646, -1.436516, -3.444382, 1, 0.2705882, 0, 1,
-1.632775, -0.3938871, -0.2425641, 1, 0.2745098, 0, 1,
-1.621954, 1.625274, -1.038491, 1, 0.282353, 0, 1,
-1.61915, 0.96955, -1.86602, 1, 0.2862745, 0, 1,
-1.617439, 0.04881271, -1.104391, 1, 0.2941177, 0, 1,
-1.587029, 2.081854, -1.067559, 1, 0.3019608, 0, 1,
-1.584055, 0.4309646, -2.299348, 1, 0.3058824, 0, 1,
-1.569624, 0.0564567, -2.456968, 1, 0.3137255, 0, 1,
-1.5696, 0.3624707, -0.8643763, 1, 0.3176471, 0, 1,
-1.569584, 0.6045994, -0.9279092, 1, 0.3254902, 0, 1,
-1.549327, -0.07540008, -1.461801, 1, 0.3294118, 0, 1,
-1.549073, 0.357892, -0.05835369, 1, 0.3372549, 0, 1,
-1.524369, -0.5843964, -2.624548, 1, 0.3411765, 0, 1,
-1.516347, -0.3579641, -1.740066, 1, 0.3490196, 0, 1,
-1.510948, 1.165859, -0.2294638, 1, 0.3529412, 0, 1,
-1.498433, 0.2863973, -1.682081, 1, 0.3607843, 0, 1,
-1.474755, 0.1920321, -0.1935433, 1, 0.3647059, 0, 1,
-1.473963, 0.7029359, -2.901856, 1, 0.372549, 0, 1,
-1.467882, 0.5418562, -1.086977, 1, 0.3764706, 0, 1,
-1.467297, -0.357326, -1.802972, 1, 0.3843137, 0, 1,
-1.457555, 0.9674326, -1.775522, 1, 0.3882353, 0, 1,
-1.440944, 0.6178145, -2.892939, 1, 0.3960784, 0, 1,
-1.439966, 0.1982801, -1.306629, 1, 0.4039216, 0, 1,
-1.439779, 1.060878, -1.553227, 1, 0.4078431, 0, 1,
-1.43865, -0.6423482, -3.356909, 1, 0.4156863, 0, 1,
-1.432222, 1.180329, -2.001609, 1, 0.4196078, 0, 1,
-1.423731, -1.557622, -1.842115, 1, 0.427451, 0, 1,
-1.421542, 0.1765935, -2.225417, 1, 0.4313726, 0, 1,
-1.420508, -1.56782, -3.520482, 1, 0.4392157, 0, 1,
-1.402297, 0.3992884, -1.530237, 1, 0.4431373, 0, 1,
-1.387573, -1.565781, -2.921519, 1, 0.4509804, 0, 1,
-1.38127, 0.4184117, -1.395097, 1, 0.454902, 0, 1,
-1.377689, -0.3405064, -1.553585, 1, 0.4627451, 0, 1,
-1.377663, 1.542048, -2.090811, 1, 0.4666667, 0, 1,
-1.374198, 1.957234, -0.1806921, 1, 0.4745098, 0, 1,
-1.366647, 0.6461885, -1.889633, 1, 0.4784314, 0, 1,
-1.343936, -0.6529418, -1.225349, 1, 0.4862745, 0, 1,
-1.331162, -0.436952, -0.234211, 1, 0.4901961, 0, 1,
-1.329855, -1.051657, -3.326256, 1, 0.4980392, 0, 1,
-1.325666, -0.8650892, -2.733579, 1, 0.5058824, 0, 1,
-1.325449, -0.2630547, -1.889066, 1, 0.509804, 0, 1,
-1.32052, 1.491431, 1.077337, 1, 0.5176471, 0, 1,
-1.307608, 0.6556075, 2.123619, 1, 0.5215687, 0, 1,
-1.305376, -0.04237549, -0.8232846, 1, 0.5294118, 0, 1,
-1.29406, -1.865428, -2.703079, 1, 0.5333334, 0, 1,
-1.2931, 2.098431, -1.529091, 1, 0.5411765, 0, 1,
-1.289821, 0.6117713, -1.311268, 1, 0.5450981, 0, 1,
-1.284566, -0.6708477, -0.8757961, 1, 0.5529412, 0, 1,
-1.28157, 0.04053605, -0.4167545, 1, 0.5568628, 0, 1,
-1.277298, 0.6839507, -1.057709, 1, 0.5647059, 0, 1,
-1.273643, 1.184668, -1.457784, 1, 0.5686275, 0, 1,
-1.259307, 1.348731, 0.5352106, 1, 0.5764706, 0, 1,
-1.258354, -0.5785014, -3.024837, 1, 0.5803922, 0, 1,
-1.25615, -0.003555998, -0.7861707, 1, 0.5882353, 0, 1,
-1.252737, 1.092075, -0.09264523, 1, 0.5921569, 0, 1,
-1.242156, -0.9022668, -2.519914, 1, 0.6, 0, 1,
-1.242007, 1.367174, -1.569315, 1, 0.6078432, 0, 1,
-1.237792, 1.315467, -0.5296307, 1, 0.6117647, 0, 1,
-1.237049, -1.307904, -0.4591539, 1, 0.6196079, 0, 1,
-1.229452, -0.4377026, -1.376806, 1, 0.6235294, 0, 1,
-1.22736, 0.4864003, -1.802629, 1, 0.6313726, 0, 1,
-1.225134, -0.644066, -1.425094, 1, 0.6352941, 0, 1,
-1.21702, 0.7435635, 0.1370019, 1, 0.6431373, 0, 1,
-1.216694, 2.009956, -1.699183, 1, 0.6470588, 0, 1,
-1.212441, -1.354359, -2.260391, 1, 0.654902, 0, 1,
-1.208784, -1.484892, -2.043144, 1, 0.6588235, 0, 1,
-1.202468, -0.1776406, -1.551681, 1, 0.6666667, 0, 1,
-1.195432, -0.05800747, -0.4694107, 1, 0.6705883, 0, 1,
-1.178419, 0.9708459, -1.261638, 1, 0.6784314, 0, 1,
-1.175377, 0.4071007, -1.997254, 1, 0.682353, 0, 1,
-1.173734, 0.2267143, -1.312038, 1, 0.6901961, 0, 1,
-1.16161, -0.7206986, -3.671491, 1, 0.6941177, 0, 1,
-1.145814, -0.4235658, -0.9322659, 1, 0.7019608, 0, 1,
-1.131312, -0.5083145, -2.468819, 1, 0.7098039, 0, 1,
-1.118775, 0.5830598, -0.4178144, 1, 0.7137255, 0, 1,
-1.117926, 0.2807789, -1.761466, 1, 0.7215686, 0, 1,
-1.117129, 0.6522264, -0.877872, 1, 0.7254902, 0, 1,
-1.11195, -0.2155814, -1.473628, 1, 0.7333333, 0, 1,
-1.110181, 0.4623066, -0.9649564, 1, 0.7372549, 0, 1,
-1.096515, -0.0462794, -1.059471, 1, 0.7450981, 0, 1,
-1.09404, -1.115383, -3.687808, 1, 0.7490196, 0, 1,
-1.092129, -1.500983, -1.943601, 1, 0.7568628, 0, 1,
-1.085719, -1.67302, -1.489702, 1, 0.7607843, 0, 1,
-1.084388, -0.2090219, -1.616281, 1, 0.7686275, 0, 1,
-1.078565, 0.265796, -1.866958, 1, 0.772549, 0, 1,
-1.074884, 1.235416, -0.1452487, 1, 0.7803922, 0, 1,
-1.0744, -0.366419, -1.789015, 1, 0.7843137, 0, 1,
-1.074054, -1.331505, -0.2794101, 1, 0.7921569, 0, 1,
-1.069062, 0.03190839, -1.107327, 1, 0.7960784, 0, 1,
-1.063557, 1.40847, -0.8078801, 1, 0.8039216, 0, 1,
-1.058467, 1.148541, 0.2116093, 1, 0.8117647, 0, 1,
-1.058359, -2.159308, -4.588749, 1, 0.8156863, 0, 1,
-1.050759, 0.09991245, -2.928746, 1, 0.8235294, 0, 1,
-1.047788, -0.4310406, -0.3075297, 1, 0.827451, 0, 1,
-1.041342, 0.4141446, -1.740686, 1, 0.8352941, 0, 1,
-1.037601, 1.370565, -0.2604401, 1, 0.8392157, 0, 1,
-1.029714, -0.7479393, -2.710857, 1, 0.8470588, 0, 1,
-1.027081, 0.5773462, -2.197803, 1, 0.8509804, 0, 1,
-1.025227, 0.03493798, -2.104394, 1, 0.8588235, 0, 1,
-1.012784, -0.7651002, -2.250708, 1, 0.8627451, 0, 1,
-1.001171, 1.677417, -0.8901243, 1, 0.8705882, 0, 1,
-0.9987297, -0.6015797, -1.377256, 1, 0.8745098, 0, 1,
-0.9973572, 0.6547179, -2.68832, 1, 0.8823529, 0, 1,
-0.9895057, -0.7266736, -2.056043, 1, 0.8862745, 0, 1,
-0.9792019, -0.8111658, -1.74713, 1, 0.8941177, 0, 1,
-0.9743184, 1.168806, -2.105484, 1, 0.8980392, 0, 1,
-0.9710376, -0.4225082, -2.279676, 1, 0.9058824, 0, 1,
-0.9702865, -0.466734, -2.158469, 1, 0.9137255, 0, 1,
-0.9553398, -1.069843, -1.796905, 1, 0.9176471, 0, 1,
-0.9516777, -0.3073706, -2.162778, 1, 0.9254902, 0, 1,
-0.949299, -0.6666697, -3.497253, 1, 0.9294118, 0, 1,
-0.94781, -2.072803, -4.077666, 1, 0.9372549, 0, 1,
-0.9450599, -0.1785901, -3.710675, 1, 0.9411765, 0, 1,
-0.9403828, -1.099478, -2.316527, 1, 0.9490196, 0, 1,
-0.93911, -2.461137, -2.170602, 1, 0.9529412, 0, 1,
-0.9385602, -0.4660053, -0.3538157, 1, 0.9607843, 0, 1,
-0.9353778, -0.3033261, -1.008368, 1, 0.9647059, 0, 1,
-0.9351963, 0.2919443, -1.875605, 1, 0.972549, 0, 1,
-0.9317341, 0.3671351, -1.456851, 1, 0.9764706, 0, 1,
-0.9283514, 0.4347539, -0.2584707, 1, 0.9843137, 0, 1,
-0.9274963, 0.2073019, -0.1068079, 1, 0.9882353, 0, 1,
-0.9215999, 0.243042, -2.061898, 1, 0.9960784, 0, 1,
-0.9160377, -0.07081687, -2.55102, 0.9960784, 1, 0, 1,
-0.8967278, 0.2586774, -1.939739, 0.9921569, 1, 0, 1,
-0.8953274, -1.647719, -4.202378, 0.9843137, 1, 0, 1,
-0.8941303, -0.4882117, -3.228257, 0.9803922, 1, 0, 1,
-0.8924342, -1.224398, -1.281411, 0.972549, 1, 0, 1,
-0.8911023, -0.6880687, -3.40337, 0.9686275, 1, 0, 1,
-0.8853451, -0.3226471, -3.200197, 0.9607843, 1, 0, 1,
-0.8825365, 2.285426, -1.384329, 0.9568627, 1, 0, 1,
-0.8772543, -0.3779787, -1.080816, 0.9490196, 1, 0, 1,
-0.8759336, -1.741079, -4.475542, 0.945098, 1, 0, 1,
-0.8690416, -1.28928, -2.273435, 0.9372549, 1, 0, 1,
-0.8663788, -1.206326, -3.646115, 0.9333333, 1, 0, 1,
-0.8611398, 1.061965, 0.7354808, 0.9254902, 1, 0, 1,
-0.8595259, -0.7250937, -1.980415, 0.9215686, 1, 0, 1,
-0.8551664, -1.298777, -2.383933, 0.9137255, 1, 0, 1,
-0.8456431, -3.684642, -2.733396, 0.9098039, 1, 0, 1,
-0.8448124, -1.080093, -4.999169, 0.9019608, 1, 0, 1,
-0.8441074, -1.320755, -4.06808, 0.8941177, 1, 0, 1,
-0.84215, -0.527366, -2.648473, 0.8901961, 1, 0, 1,
-0.8348053, -0.3029908, -1.340775, 0.8823529, 1, 0, 1,
-0.8344409, 0.6506962, -0.1026873, 0.8784314, 1, 0, 1,
-0.8288806, -0.342245, -2.279965, 0.8705882, 1, 0, 1,
-0.8280221, 0.7342842, -0.774916, 0.8666667, 1, 0, 1,
-0.8241549, 1.002303, 0.380878, 0.8588235, 1, 0, 1,
-0.816335, 0.1405461, -2.548233, 0.854902, 1, 0, 1,
-0.8157823, 1.689921, -0.007017714, 0.8470588, 1, 0, 1,
-0.8153203, 1.774554, -1.848955, 0.8431373, 1, 0, 1,
-0.8056715, -1.480631, -3.661898, 0.8352941, 1, 0, 1,
-0.8055777, -0.8034719, -1.826211, 0.8313726, 1, 0, 1,
-0.8050881, 0.8591405, -1.383755, 0.8235294, 1, 0, 1,
-0.8030181, -1.961049, -3.559594, 0.8196079, 1, 0, 1,
-0.7997084, 0.1665685, -0.2517626, 0.8117647, 1, 0, 1,
-0.7984128, 0.2791544, -0.7118781, 0.8078431, 1, 0, 1,
-0.7886899, 1.291319, 0.07501513, 0.8, 1, 0, 1,
-0.7855432, -0.7258295, -1.704399, 0.7921569, 1, 0, 1,
-0.7828642, 0.02342262, -2.678026, 0.7882353, 1, 0, 1,
-0.7779458, -0.7839522, -0.9454658, 0.7803922, 1, 0, 1,
-0.7737329, 0.09101594, -2.029702, 0.7764706, 1, 0, 1,
-0.7721184, 1.603853, -1.304139, 0.7686275, 1, 0, 1,
-0.756105, -0.4905646, -3.384393, 0.7647059, 1, 0, 1,
-0.753768, 1.374416, 0.1840946, 0.7568628, 1, 0, 1,
-0.75275, -0.1618903, -2.453139, 0.7529412, 1, 0, 1,
-0.7513176, -0.1624254, -0.1257231, 0.7450981, 1, 0, 1,
-0.7366345, -1.018311, -1.701162, 0.7411765, 1, 0, 1,
-0.7355866, 1.273822, -0.5740544, 0.7333333, 1, 0, 1,
-0.7330889, -1.828483, -2.805282, 0.7294118, 1, 0, 1,
-0.7330168, 0.8148022, -1.175085, 0.7215686, 1, 0, 1,
-0.7327384, -1.279429, -3.522485, 0.7176471, 1, 0, 1,
-0.7257558, 0.07599813, -1.755125, 0.7098039, 1, 0, 1,
-0.7238169, 1.155295, 0.2455885, 0.7058824, 1, 0, 1,
-0.7213343, 0.2571553, -1.716066, 0.6980392, 1, 0, 1,
-0.7196749, 1.013145, -0.7958496, 0.6901961, 1, 0, 1,
-0.7102791, 0.3761857, -0.1458198, 0.6862745, 1, 0, 1,
-0.7085385, -0.3040202, -1.170292, 0.6784314, 1, 0, 1,
-0.7082561, -0.7755839, -1.805978, 0.6745098, 1, 0, 1,
-0.7058986, -0.664695, -1.73248, 0.6666667, 1, 0, 1,
-0.6943064, 0.8952726, -1.343005, 0.6627451, 1, 0, 1,
-0.6936861, 1.052031, -0.6400121, 0.654902, 1, 0, 1,
-0.6932524, 0.7295256, -0.08498658, 0.6509804, 1, 0, 1,
-0.6931316, -1.248464, -3.486537, 0.6431373, 1, 0, 1,
-0.6927925, 2.038922, -1.183109, 0.6392157, 1, 0, 1,
-0.6926959, 0.717719, 0.8488065, 0.6313726, 1, 0, 1,
-0.6874442, 0.7419836, -0.1302691, 0.627451, 1, 0, 1,
-0.6851945, -2.208747, -1.446781, 0.6196079, 1, 0, 1,
-0.6839922, -0.1929047, -0.5279389, 0.6156863, 1, 0, 1,
-0.6838807, -0.7212282, -3.671194, 0.6078432, 1, 0, 1,
-0.6832464, 0.02451959, -1.51342, 0.6039216, 1, 0, 1,
-0.6821291, -0.8627715, -1.338375, 0.5960785, 1, 0, 1,
-0.6820642, 1.312104, -1.051881, 0.5882353, 1, 0, 1,
-0.6783633, 0.4393536, -0.5632496, 0.5843138, 1, 0, 1,
-0.6752205, -0.2741497, -1.251587, 0.5764706, 1, 0, 1,
-0.6741512, 0.1945362, -1.202825, 0.572549, 1, 0, 1,
-0.6720859, -0.4540567, -2.107027, 0.5647059, 1, 0, 1,
-0.6688071, 0.8557788, 1.457548, 0.5607843, 1, 0, 1,
-0.6677248, -2.768295, -3.215867, 0.5529412, 1, 0, 1,
-0.6624395, 1.548048, 0.04267958, 0.5490196, 1, 0, 1,
-0.6613091, -0.5166916, -1.412976, 0.5411765, 1, 0, 1,
-0.6613032, -2.331343, -3.345101, 0.5372549, 1, 0, 1,
-0.6610412, 1.027735, 1.343745, 0.5294118, 1, 0, 1,
-0.6600281, -0.9905458, -2.782753, 0.5254902, 1, 0, 1,
-0.6477134, 0.4457643, -1.109228, 0.5176471, 1, 0, 1,
-0.6431757, 0.1935467, -2.321805, 0.5137255, 1, 0, 1,
-0.6408614, 1.353009, -0.4356393, 0.5058824, 1, 0, 1,
-0.6391783, -1.910453, -3.491418, 0.5019608, 1, 0, 1,
-0.6388955, 1.756912, -2.485833, 0.4941176, 1, 0, 1,
-0.6334206, 0.5873708, -0.968609, 0.4862745, 1, 0, 1,
-0.6325462, 1.087559, 1.054886, 0.4823529, 1, 0, 1,
-0.6233863, -1.43907, -2.475235, 0.4745098, 1, 0, 1,
-0.6224046, 2.362842, -0.2608861, 0.4705882, 1, 0, 1,
-0.6169434, 1.141204, 0.3714123, 0.4627451, 1, 0, 1,
-0.6153721, 0.5552062, -1.034298, 0.4588235, 1, 0, 1,
-0.6062974, 0.357886, -2.005212, 0.4509804, 1, 0, 1,
-0.6062738, 0.5506424, -1.821265, 0.4470588, 1, 0, 1,
-0.600508, 1.779132, -1.090928, 0.4392157, 1, 0, 1,
-0.6002015, 0.5484534, -0.8236648, 0.4352941, 1, 0, 1,
-0.5993236, 1.498346, -0.7776496, 0.427451, 1, 0, 1,
-0.5920356, 1.3716, -0.07105795, 0.4235294, 1, 0, 1,
-0.5901159, 0.4682728, -2.170182, 0.4156863, 1, 0, 1,
-0.5868762, -0.03728305, -1.998664, 0.4117647, 1, 0, 1,
-0.586163, 0.8631262, 1.072757, 0.4039216, 1, 0, 1,
-0.5853351, 2.060844, 0.7576583, 0.3960784, 1, 0, 1,
-0.5826128, 0.2568914, -0.2355281, 0.3921569, 1, 0, 1,
-0.5778872, -1.773199, -4.590242, 0.3843137, 1, 0, 1,
-0.5758374, 1.431936, -0.6172297, 0.3803922, 1, 0, 1,
-0.5744539, -0.5398899, -2.026587, 0.372549, 1, 0, 1,
-0.5695882, 0.7088127, -0.004931082, 0.3686275, 1, 0, 1,
-0.5678009, -0.1315736, -0.1427891, 0.3607843, 1, 0, 1,
-0.5632529, -0.1669028, -3.419441, 0.3568628, 1, 0, 1,
-0.5611528, 0.6770453, 0.499575, 0.3490196, 1, 0, 1,
-0.5610471, 1.643956, -2.128322, 0.345098, 1, 0, 1,
-0.559409, -0.7485393, -2.693666, 0.3372549, 1, 0, 1,
-0.5587265, 0.5257713, 1.770389, 0.3333333, 1, 0, 1,
-0.5582882, -0.2766187, -1.533701, 0.3254902, 1, 0, 1,
-0.5538951, -0.991556, -3.890035, 0.3215686, 1, 0, 1,
-0.5517038, -2.386852, -4.853475, 0.3137255, 1, 0, 1,
-0.5465646, 0.2043114, -0.6027651, 0.3098039, 1, 0, 1,
-0.5416803, -2.203952, -3.812901, 0.3019608, 1, 0, 1,
-0.5405456, -1.026475, -2.581331, 0.2941177, 1, 0, 1,
-0.5389305, -0.4995188, -2.856454, 0.2901961, 1, 0, 1,
-0.5371626, 0.9143924, 0.1669428, 0.282353, 1, 0, 1,
-0.5359994, 0.09399919, -2.796562, 0.2784314, 1, 0, 1,
-0.5268012, 2.03269, 0.6250856, 0.2705882, 1, 0, 1,
-0.5190839, -0.2687247, -3.222235, 0.2666667, 1, 0, 1,
-0.517005, 0.2554546, -2.08256, 0.2588235, 1, 0, 1,
-0.513751, 0.7789633, 0.4714878, 0.254902, 1, 0, 1,
-0.5124658, -0.6503115, -3.535257, 0.2470588, 1, 0, 1,
-0.5090128, 0.4951791, -0.2842302, 0.2431373, 1, 0, 1,
-0.5045282, 1.997222, -0.6078747, 0.2352941, 1, 0, 1,
-0.5027018, 1.22167, -2.309139, 0.2313726, 1, 0, 1,
-0.4911114, 0.565904, -0.1507059, 0.2235294, 1, 0, 1,
-0.4909399, 0.04347115, -2.345371, 0.2196078, 1, 0, 1,
-0.4812697, 0.2524912, -0.7552238, 0.2117647, 1, 0, 1,
-0.4808064, 0.1690294, -0.4772605, 0.2078431, 1, 0, 1,
-0.4799415, 0.671258, -0.6082193, 0.2, 1, 0, 1,
-0.4697473, -0.118026, -1.515849, 0.1921569, 1, 0, 1,
-0.4642581, -1.086959, -0.7192992, 0.1882353, 1, 0, 1,
-0.4638714, 0.4402594, -0.6277803, 0.1803922, 1, 0, 1,
-0.4633274, -0.8566865, -1.403369, 0.1764706, 1, 0, 1,
-0.4628483, 1.209268, -0.2875516, 0.1686275, 1, 0, 1,
-0.4625458, -0.25092, -2.269299, 0.1647059, 1, 0, 1,
-0.460913, -1.145972, -2.815816, 0.1568628, 1, 0, 1,
-0.4552667, -0.3157616, -2.433576, 0.1529412, 1, 0, 1,
-0.4472172, -2.331718, -4.093143, 0.145098, 1, 0, 1,
-0.4453478, -0.4971722, -2.677285, 0.1411765, 1, 0, 1,
-0.444131, 1.209179, -0.4038719, 0.1333333, 1, 0, 1,
-0.4429452, -1.360905, -2.342218, 0.1294118, 1, 0, 1,
-0.4428164, -0.6742495, -2.47714, 0.1215686, 1, 0, 1,
-0.4399288, 0.06243065, -1.577472, 0.1176471, 1, 0, 1,
-0.4392661, 1.786075, -1.057474, 0.1098039, 1, 0, 1,
-0.4351725, 0.06742192, -0.1873644, 0.1058824, 1, 0, 1,
-0.4314741, 0.4554195, -1.451412, 0.09803922, 1, 0, 1,
-0.4287818, 1.183985, -1.296674, 0.09019608, 1, 0, 1,
-0.4277181, -1.234861, 0.4478078, 0.08627451, 1, 0, 1,
-0.4258079, 0.5095832, 0.4685725, 0.07843138, 1, 0, 1,
-0.4250664, 1.447823, -0.4832047, 0.07450981, 1, 0, 1,
-0.423684, 0.6593368, -1.292774, 0.06666667, 1, 0, 1,
-0.4178774, -0.8532011, -2.03236, 0.0627451, 1, 0, 1,
-0.4086969, -0.4180284, -0.8082054, 0.05490196, 1, 0, 1,
-0.4072298, 2.741329, 0.05190006, 0.05098039, 1, 0, 1,
-0.4058746, 1.827379, 0.6797915, 0.04313726, 1, 0, 1,
-0.405762, 1.829078, -0.6834191, 0.03921569, 1, 0, 1,
-0.4045384, -1.713111, -3.968715, 0.03137255, 1, 0, 1,
-0.4020391, 1.305197, 0.4105401, 0.02745098, 1, 0, 1,
-0.4005907, -0.044647, -3.974364, 0.01960784, 1, 0, 1,
-0.3960137, 0.4189584, -0.5987399, 0.01568628, 1, 0, 1,
-0.3954101, -0.9623286, -1.730196, 0.007843138, 1, 0, 1,
-0.3929645, 0.8764743, -0.07203674, 0.003921569, 1, 0, 1,
-0.3902747, 0.4998857, -1.987612, 0, 1, 0.003921569, 1,
-0.3873957, 0.7523186, 0.5771589, 0, 1, 0.01176471, 1,
-0.3799227, -0.4843188, 1.054095, 0, 1, 0.01568628, 1,
-0.3793447, 0.08321473, -0.5749438, 0, 1, 0.02352941, 1,
-0.3775246, 1.247679, -1.641446, 0, 1, 0.02745098, 1,
-0.3767981, -0.6502476, -4.311913, 0, 1, 0.03529412, 1,
-0.3756643, 0.4352056, -0.1731583, 0, 1, 0.03921569, 1,
-0.3747117, 0.1776867, -0.008376602, 0, 1, 0.04705882, 1,
-0.3729239, -0.6622269, -1.628272, 0, 1, 0.05098039, 1,
-0.3720509, -1.295503, -2.174032, 0, 1, 0.05882353, 1,
-0.3718047, -1.178001, -4.873944, 0, 1, 0.0627451, 1,
-0.3702225, 0.5397691, 1.144491, 0, 1, 0.07058824, 1,
-0.3644168, -0.7235934, -2.301641, 0, 1, 0.07450981, 1,
-0.3603788, -0.8011528, -2.658961, 0, 1, 0.08235294, 1,
-0.3591855, 0.03364798, -0.8098038, 0, 1, 0.08627451, 1,
-0.3565442, -0.46888, -2.160595, 0, 1, 0.09411765, 1,
-0.3530853, 0.5296442, -1.686583, 0, 1, 0.1019608, 1,
-0.3528426, 1.780898, -1.03009, 0, 1, 0.1058824, 1,
-0.3466001, 1.621951, -0.498998, 0, 1, 0.1137255, 1,
-0.3440776, -0.2794558, -0.5408689, 0, 1, 0.1176471, 1,
-0.337521, -1.313903, -3.345174, 0, 1, 0.1254902, 1,
-0.3343228, -1.092096, -1.699036, 0, 1, 0.1294118, 1,
-0.334182, 1.065444, -0.7438486, 0, 1, 0.1372549, 1,
-0.3338647, -1.886968, -4.804994, 0, 1, 0.1411765, 1,
-0.3332096, -1.297156, -1.472366, 0, 1, 0.1490196, 1,
-0.3326612, 0.6395598, -0.6825346, 0, 1, 0.1529412, 1,
-0.3272516, -0.5855078, -0.1494579, 0, 1, 0.1607843, 1,
-0.3187018, -0.3356889, -2.835636, 0, 1, 0.1647059, 1,
-0.316397, -0.2289024, -1.766046, 0, 1, 0.172549, 1,
-0.313486, -1.273854, -2.967965, 0, 1, 0.1764706, 1,
-0.3094718, 0.466728, -1.215391, 0, 1, 0.1843137, 1,
-0.3076728, 0.6612619, -2.034568, 0, 1, 0.1882353, 1,
-0.3040119, -1.722426, -2.441827, 0, 1, 0.1960784, 1,
-0.2959089, 0.5108716, 0.1086872, 0, 1, 0.2039216, 1,
-0.2919461, 0.2376739, -0.3924009, 0, 1, 0.2078431, 1,
-0.2919136, -0.9530466, -3.608527, 0, 1, 0.2156863, 1,
-0.2899955, -0.4821543, -1.993112, 0, 1, 0.2196078, 1,
-0.2866484, 0.7062771, -0.209156, 0, 1, 0.227451, 1,
-0.2813346, 0.5660589, -1.36939, 0, 1, 0.2313726, 1,
-0.2810578, 1.627209, -2.077174, 0, 1, 0.2392157, 1,
-0.2788637, 1.056683, -0.4870764, 0, 1, 0.2431373, 1,
-0.2774385, -1.25366, -1.82127, 0, 1, 0.2509804, 1,
-0.2738122, -0.3430015, -1.973371, 0, 1, 0.254902, 1,
-0.2716591, 0.4130381, -0.8171283, 0, 1, 0.2627451, 1,
-0.2685244, 1.892085, 0.1399754, 0, 1, 0.2666667, 1,
-0.2666492, 1.248356, 2.046417, 0, 1, 0.2745098, 1,
-0.2664049, -1.087272, -4.36238, 0, 1, 0.2784314, 1,
-0.2636989, 0.2351218, -0.6178966, 0, 1, 0.2862745, 1,
-0.2628688, 0.7108376, 0.1640305, 0, 1, 0.2901961, 1,
-0.2622886, -0.7909421, -1.272474, 0, 1, 0.2980392, 1,
-0.2607697, 2.267141, -0.2633216, 0, 1, 0.3058824, 1,
-0.2590673, -0.3129335, -2.807139, 0, 1, 0.3098039, 1,
-0.2577855, 1.526041, 1.247655, 0, 1, 0.3176471, 1,
-0.2567052, 1.716941, -1.213467, 0, 1, 0.3215686, 1,
-0.2561714, 0.1848221, -0.7953601, 0, 1, 0.3294118, 1,
-0.2561075, -0.1394731, -1.769538, 0, 1, 0.3333333, 1,
-0.2557687, -0.1784681, -2.394813, 0, 1, 0.3411765, 1,
-0.2545529, -0.1722033, -2.824182, 0, 1, 0.345098, 1,
-0.2531355, -1.208768, -2.23047, 0, 1, 0.3529412, 1,
-0.2501709, 1.277155, -0.4114564, 0, 1, 0.3568628, 1,
-0.2463638, 1.735248, -0.2704428, 0, 1, 0.3647059, 1,
-0.2428452, 0.8913159, -0.1655456, 0, 1, 0.3686275, 1,
-0.2396128, -0.4723952, -3.958401, 0, 1, 0.3764706, 1,
-0.2382826, 0.08727572, -3.123579, 0, 1, 0.3803922, 1,
-0.2352539, 1.121345, -0.9384343, 0, 1, 0.3882353, 1,
-0.2342097, -0.5035551, -2.6446, 0, 1, 0.3921569, 1,
-0.2301689, -0.3769031, -0.5930892, 0, 1, 0.4, 1,
-0.2243576, -0.09853206, -3.768299, 0, 1, 0.4078431, 1,
-0.2162359, -0.6366612, -2.416531, 0, 1, 0.4117647, 1,
-0.2144251, 1.084066, -1.576293, 0, 1, 0.4196078, 1,
-0.212053, 0.1205809, -0.8612941, 0, 1, 0.4235294, 1,
-0.2092289, -0.913903, -3.696167, 0, 1, 0.4313726, 1,
-0.2091688, -0.1315133, -1.68258, 0, 1, 0.4352941, 1,
-0.208282, -0.2729681, -4.433335, 0, 1, 0.4431373, 1,
-0.204569, 0.9149312, -0.5990131, 0, 1, 0.4470588, 1,
-0.2032122, 0.9098706, 0.06431891, 0, 1, 0.454902, 1,
-0.2020795, 0.3650708, -0.806996, 0, 1, 0.4588235, 1,
-0.1999682, -2.17907, -1.621351, 0, 1, 0.4666667, 1,
-0.193574, 0.4916175, -0.04183907, 0, 1, 0.4705882, 1,
-0.1918794, 0.9652603, -0.7585163, 0, 1, 0.4784314, 1,
-0.1871369, -0.1011427, -1.622199, 0, 1, 0.4823529, 1,
-0.1867571, 0.9163858, -0.5752027, 0, 1, 0.4901961, 1,
-0.1795148, 1.187888, -1.12846, 0, 1, 0.4941176, 1,
-0.1788445, 0.6653287, -1.54239, 0, 1, 0.5019608, 1,
-0.1697252, 0.3100177, -0.7221361, 0, 1, 0.509804, 1,
-0.162912, 1.29459, -0.3149013, 0, 1, 0.5137255, 1,
-0.1613541, -1.730368, -2.969476, 0, 1, 0.5215687, 1,
-0.15337, -0.2271115, -2.21168, 0, 1, 0.5254902, 1,
-0.1521786, 0.2092928, 0.258446, 0, 1, 0.5333334, 1,
-0.1507659, -0.7883608, -4.198662, 0, 1, 0.5372549, 1,
-0.1486714, 0.8334346, 0.9337269, 0, 1, 0.5450981, 1,
-0.1462327, -0.5094496, -3.989003, 0, 1, 0.5490196, 1,
-0.1423632, 1.224797, -1.032869, 0, 1, 0.5568628, 1,
-0.1379989, 0.5888905, -0.06910874, 0, 1, 0.5607843, 1,
-0.1332309, -0.6000214, -0.4037599, 0, 1, 0.5686275, 1,
-0.126336, 0.307007, -0.2301264, 0, 1, 0.572549, 1,
-0.124918, -1.178444, -3.739213, 0, 1, 0.5803922, 1,
-0.1212037, 0.1572332, -1.252213, 0, 1, 0.5843138, 1,
-0.1201891, 1.584747, -1.214965, 0, 1, 0.5921569, 1,
-0.112414, -0.8725944, -3.096164, 0, 1, 0.5960785, 1,
-0.1086177, 0.2755198, -1.896036, 0, 1, 0.6039216, 1,
-0.1066104, 0.8611251, -1.767313, 0, 1, 0.6117647, 1,
-0.1050318, -0.779671, -4.18952, 0, 1, 0.6156863, 1,
-0.104428, -1.122555, -1.276178, 0, 1, 0.6235294, 1,
-0.1023002, 0.8000556, 0.2582159, 0, 1, 0.627451, 1,
-0.1005045, -0.590266, -3.629225, 0, 1, 0.6352941, 1,
-0.0950914, -1.906327, -3.275056, 0, 1, 0.6392157, 1,
-0.09501551, -0.3184581, -3.684401, 0, 1, 0.6470588, 1,
-0.0948865, -0.5832876, -2.023833, 0, 1, 0.6509804, 1,
-0.09098039, 1.568253, -2.671132, 0, 1, 0.6588235, 1,
-0.08579011, -0.5629836, -1.898121, 0, 1, 0.6627451, 1,
-0.08307178, -0.1294058, -1.650187, 0, 1, 0.6705883, 1,
-0.082467, -0.4614756, -2.252834, 0, 1, 0.6745098, 1,
-0.07917513, -0.490509, -5.008044, 0, 1, 0.682353, 1,
-0.06852261, 0.3690766, -1.619543, 0, 1, 0.6862745, 1,
-0.06810903, -0.5291129, -4.747219, 0, 1, 0.6941177, 1,
-0.0670276, 1.115418, -1.449751, 0, 1, 0.7019608, 1,
-0.06640299, -0.2181314, -2.347369, 0, 1, 0.7058824, 1,
-0.06623683, -0.1542265, -2.69874, 0, 1, 0.7137255, 1,
-0.06608552, -1.741637, -2.38696, 0, 1, 0.7176471, 1,
-0.06472898, -0.4647392, -4.230211, 0, 1, 0.7254902, 1,
-0.06002228, -0.4553539, -3.337065, 0, 1, 0.7294118, 1,
-0.05886508, -0.715083, -2.930927, 0, 1, 0.7372549, 1,
-0.05298718, 0.236369, -0.1838476, 0, 1, 0.7411765, 1,
-0.05220545, 0.3625982, -0.1468153, 0, 1, 0.7490196, 1,
-0.04901905, -0.5599024, -2.712494, 0, 1, 0.7529412, 1,
-0.04589786, 1.393006, -0.3669962, 0, 1, 0.7607843, 1,
-0.04373025, -1.449055, -4.042339, 0, 1, 0.7647059, 1,
-0.03708506, 1.226724, 1.32989, 0, 1, 0.772549, 1,
-0.03702604, 0.7064019, 1.686361, 0, 1, 0.7764706, 1,
-0.03535625, 1.643383, 0.1273922, 0, 1, 0.7843137, 1,
-0.03501493, 3.722587, 1.367685, 0, 1, 0.7882353, 1,
-0.03290148, -0.0003190368, -1.7635, 0, 1, 0.7960784, 1,
-0.03069209, 1.533998, 0.1883803, 0, 1, 0.8039216, 1,
-0.02849634, 1.223807, -2.004627, 0, 1, 0.8078431, 1,
-0.02685194, 0.8209873, -0.9800711, 0, 1, 0.8156863, 1,
-0.0251054, -1.267627, -2.488437, 0, 1, 0.8196079, 1,
-0.02401447, 0.7625201, -0.2461178, 0, 1, 0.827451, 1,
-0.02096019, -0.1233087, -1.669967, 0, 1, 0.8313726, 1,
-0.02070048, 0.2820965, -1.541469, 0, 1, 0.8392157, 1,
-0.01867989, 0.9825447, -1.268461, 0, 1, 0.8431373, 1,
-0.0181885, -0.4145167, -3.088929, 0, 1, 0.8509804, 1,
-0.01669991, -0.7833272, -2.938089, 0, 1, 0.854902, 1,
-0.01090609, 0.06583169, -0.4052009, 0, 1, 0.8627451, 1,
-0.00900239, -0.2761648, -2.978624, 0, 1, 0.8666667, 1,
-0.007572217, -1.603394, -0.9185174, 0, 1, 0.8745098, 1,
-0.004767724, 0.9378452, 0.4842184, 0, 1, 0.8784314, 1,
-0.001213845, -1.164501, -4.569631, 0, 1, 0.8862745, 1,
-0.0003006952, -0.7493188, -4.749092, 0, 1, 0.8901961, 1,
0.005016129, 0.3599915, 0.2238828, 0, 1, 0.8980392, 1,
0.005565991, -0.9843348, 4.060709, 0, 1, 0.9058824, 1,
0.009034977, 0.9656634, 0.2761122, 0, 1, 0.9098039, 1,
0.01154698, -0.9241581, 1.814573, 0, 1, 0.9176471, 1,
0.0126801, 0.05533573, 0.4092316, 0, 1, 0.9215686, 1,
0.01270476, 0.2452986, 1.321187, 0, 1, 0.9294118, 1,
0.01414052, 0.466371, -0.8654802, 0, 1, 0.9333333, 1,
0.01485663, -1.137012, 2.779236, 0, 1, 0.9411765, 1,
0.01552769, 0.01741483, 1.044093, 0, 1, 0.945098, 1,
0.01814306, 1.936155, 0.856103, 0, 1, 0.9529412, 1,
0.01899654, -1.03338, 3.47148, 0, 1, 0.9568627, 1,
0.02074354, -0.9784056, 3.68915, 0, 1, 0.9647059, 1,
0.02105424, 0.498189, 0.6781139, 0, 1, 0.9686275, 1,
0.02184701, 1.836778, -0.6898037, 0, 1, 0.9764706, 1,
0.03002519, 0.2110894, 0.7402136, 0, 1, 0.9803922, 1,
0.03387117, -0.12566, 2.225361, 0, 1, 0.9882353, 1,
0.03510237, -1.33126, 4.289204, 0, 1, 0.9921569, 1,
0.0364923, 0.5594673, 1.939769, 0, 1, 1, 1,
0.03717728, -1.436434, 3.438695, 0, 0.9921569, 1, 1,
0.04112652, -0.6666902, 4.426516, 0, 0.9882353, 1, 1,
0.04118465, 0.6140549, -0.5533901, 0, 0.9803922, 1, 1,
0.04138371, -0.6411653, 3.697349, 0, 0.9764706, 1, 1,
0.04588487, -1.141663, 3.213536, 0, 0.9686275, 1, 1,
0.04625784, -0.5656183, 1.863507, 0, 0.9647059, 1, 1,
0.05176983, 1.919174, -0.8301911, 0, 0.9568627, 1, 1,
0.05666388, 0.6882097, 2.705652, 0, 0.9529412, 1, 1,
0.05712091, -0.9643037, 2.18864, 0, 0.945098, 1, 1,
0.05771765, -0.6627147, 2.980266, 0, 0.9411765, 1, 1,
0.05851883, 0.5866268, 1.979276, 0, 0.9333333, 1, 1,
0.06107516, 1.0025, 1.780036, 0, 0.9294118, 1, 1,
0.06239907, -0.8799686, 4.011534, 0, 0.9215686, 1, 1,
0.06297162, 0.3725294, -0.4596499, 0, 0.9176471, 1, 1,
0.06436843, -0.2385016, 1.098232, 0, 0.9098039, 1, 1,
0.06466138, 0.6562113, 1.380328, 0, 0.9058824, 1, 1,
0.06702379, 1.227708, -1.278775, 0, 0.8980392, 1, 1,
0.06830315, 0.290895, -0.06162731, 0, 0.8901961, 1, 1,
0.07167815, 0.7912758, -0.3610754, 0, 0.8862745, 1, 1,
0.07180995, -0.8055768, 3.551955, 0, 0.8784314, 1, 1,
0.07490332, 0.6337016, 0.1859553, 0, 0.8745098, 1, 1,
0.07682758, 0.2966681, 0.317556, 0, 0.8666667, 1, 1,
0.07911771, 0.9351122, -0.8102681, 0, 0.8627451, 1, 1,
0.08319414, -0.9781222, 3.362983, 0, 0.854902, 1, 1,
0.08412906, 0.2349402, 0.03913355, 0, 0.8509804, 1, 1,
0.08564869, -0.3000706, 5.625089, 0, 0.8431373, 1, 1,
0.08664655, 1.112314, 0.5042425, 0, 0.8392157, 1, 1,
0.08684133, 1.485117, 0.2696472, 0, 0.8313726, 1, 1,
0.08914188, -0.9813291, 3.569869, 0, 0.827451, 1, 1,
0.09455491, -1.641265, 3.249367, 0, 0.8196079, 1, 1,
0.0958199, 0.5248905, 0.4187821, 0, 0.8156863, 1, 1,
0.09622785, 1.588405, -0.4939714, 0, 0.8078431, 1, 1,
0.1019835, 0.5085625, -0.7751346, 0, 0.8039216, 1, 1,
0.107495, 0.3754851, 0.147943, 0, 0.7960784, 1, 1,
0.1075665, 0.9058776, -2.410127, 0, 0.7882353, 1, 1,
0.1101463, 1.12768, 1.018217, 0, 0.7843137, 1, 1,
0.1106836, -1.152735, 1.875867, 0, 0.7764706, 1, 1,
0.1115697, -0.4742939, 2.796212, 0, 0.772549, 1, 1,
0.1115803, -0.08737259, 3.1456, 0, 0.7647059, 1, 1,
0.1185082, -0.6350551, 2.800781, 0, 0.7607843, 1, 1,
0.1194184, -0.403405, 2.126472, 0, 0.7529412, 1, 1,
0.1245221, 0.8626853, -0.3092722, 0, 0.7490196, 1, 1,
0.1264353, 1.229947, 2.36129, 0, 0.7411765, 1, 1,
0.1308863, 0.3335151, 0.1424414, 0, 0.7372549, 1, 1,
0.131922, -0.6715781, 2.881395, 0, 0.7294118, 1, 1,
0.1375799, -1.093137, 2.431077, 0, 0.7254902, 1, 1,
0.1382344, -0.8642802, 3.257018, 0, 0.7176471, 1, 1,
0.1426244, 1.088379, 1.26836, 0, 0.7137255, 1, 1,
0.1427066, 1.064466, 0.8030095, 0, 0.7058824, 1, 1,
0.1428084, 0.4280621, 1.999501, 0, 0.6980392, 1, 1,
0.1477023, 0.4336452, -0.1088598, 0, 0.6941177, 1, 1,
0.1483051, -0.6340106, 5.227878, 0, 0.6862745, 1, 1,
0.1528142, -0.3933346, 4.160287, 0, 0.682353, 1, 1,
0.1574019, 0.07142175, -1.068638, 0, 0.6745098, 1, 1,
0.1582986, -0.4056836, 3.286245, 0, 0.6705883, 1, 1,
0.1681435, -0.8800919, 1.993237, 0, 0.6627451, 1, 1,
0.1689277, 1.56625, -0.7341788, 0, 0.6588235, 1, 1,
0.1708841, 0.04961261, -1.269839, 0, 0.6509804, 1, 1,
0.1756813, -0.2146128, 3.066615, 0, 0.6470588, 1, 1,
0.1790859, 2.039536, 1.050178, 0, 0.6392157, 1, 1,
0.1827768, -0.719863, 0.1584078, 0, 0.6352941, 1, 1,
0.1840144, 0.8703002, -0.3276097, 0, 0.627451, 1, 1,
0.1853658, -0.7520587, 2.226033, 0, 0.6235294, 1, 1,
0.1856457, -0.7822947, 3.165671, 0, 0.6156863, 1, 1,
0.1905997, -0.8102245, 3.482501, 0, 0.6117647, 1, 1,
0.1949279, 0.9914448, 0.3141508, 0, 0.6039216, 1, 1,
0.1988893, -0.5210658, 3.146268, 0, 0.5960785, 1, 1,
0.2056378, 0.1970541, 2.242088, 0, 0.5921569, 1, 1,
0.2057222, -0.4069446, 2.50361, 0, 0.5843138, 1, 1,
0.2078539, -0.3741719, 2.398353, 0, 0.5803922, 1, 1,
0.2084691, -0.5481737, 3.478901, 0, 0.572549, 1, 1,
0.2091713, -1.702849, 2.429291, 0, 0.5686275, 1, 1,
0.213238, 0.6902199, -0.8648419, 0, 0.5607843, 1, 1,
0.2140243, -0.9889105, 3.514245, 0, 0.5568628, 1, 1,
0.21764, -1.508031, 3.0193, 0, 0.5490196, 1, 1,
0.218951, 0.9438867, 0.4280486, 0, 0.5450981, 1, 1,
0.2196312, 0.5201758, 0.05015124, 0, 0.5372549, 1, 1,
0.2251121, 0.3509291, 1.295345, 0, 0.5333334, 1, 1,
0.2272675, 0.1485987, 0.9225106, 0, 0.5254902, 1, 1,
0.2305552, 0.6962222, 0.1237798, 0, 0.5215687, 1, 1,
0.2313745, 0.1833291, -0.4463696, 0, 0.5137255, 1, 1,
0.2316689, 0.6254842, 1.005132, 0, 0.509804, 1, 1,
0.2325856, 0.2526299, -1.690469, 0, 0.5019608, 1, 1,
0.2399839, -0.7932194, 3.171901, 0, 0.4941176, 1, 1,
0.240335, -0.6870261, 2.291623, 0, 0.4901961, 1, 1,
0.244286, -0.6211191, 2.475031, 0, 0.4823529, 1, 1,
0.2454314, 0.8605555, -0.1836469, 0, 0.4784314, 1, 1,
0.2475759, 0.7131212, 0.649114, 0, 0.4705882, 1, 1,
0.2477056, 1.459629, 0.3932565, 0, 0.4666667, 1, 1,
0.2502966, -1.042477, 3.989594, 0, 0.4588235, 1, 1,
0.2550702, 0.2999817, 1.317065, 0, 0.454902, 1, 1,
0.2609404, -0.5621517, 4.008915, 0, 0.4470588, 1, 1,
0.2670049, 0.2293053, 0.01449951, 0, 0.4431373, 1, 1,
0.2671753, 0.8034778, 1.601541, 0, 0.4352941, 1, 1,
0.267401, -1.912465, 2.881621, 0, 0.4313726, 1, 1,
0.2690593, -0.1181545, 1.886784, 0, 0.4235294, 1, 1,
0.2699098, -0.9521534, 1.687708, 0, 0.4196078, 1, 1,
0.2713633, -1.821417, 3.593751, 0, 0.4117647, 1, 1,
0.2785359, -1.393276, 4.153143, 0, 0.4078431, 1, 1,
0.282493, 2.290623, -1.677489, 0, 0.4, 1, 1,
0.2826198, 0.1638352, -0.2553262, 0, 0.3921569, 1, 1,
0.2835303, 0.2022707, 1.28971, 0, 0.3882353, 1, 1,
0.284466, 1.723411, -0.04692122, 0, 0.3803922, 1, 1,
0.2873873, -0.6532937, 2.099395, 0, 0.3764706, 1, 1,
0.2877947, 0.7197635, 0.7882753, 0, 0.3686275, 1, 1,
0.289533, 1.42304, 0.09379795, 0, 0.3647059, 1, 1,
0.2936174, 0.8963022, -0.3064298, 0, 0.3568628, 1, 1,
0.2980691, -0.303869, 2.815264, 0, 0.3529412, 1, 1,
0.2994621, 1.296473, -0.168678, 0, 0.345098, 1, 1,
0.3086317, 0.3648413, -1.607851, 0, 0.3411765, 1, 1,
0.312578, -0.1246095, 3.192082, 0, 0.3333333, 1, 1,
0.3153352, -1.154028, 1.468084, 0, 0.3294118, 1, 1,
0.3196117, 0.5709311, 0.7246378, 0, 0.3215686, 1, 1,
0.3205075, 1.217785, 2.925305, 0, 0.3176471, 1, 1,
0.3260236, 1.727639, 2.331191, 0, 0.3098039, 1, 1,
0.329368, -1.254558, 1.401347, 0, 0.3058824, 1, 1,
0.3309848, 0.5065734, 0.8132939, 0, 0.2980392, 1, 1,
0.3317223, -0.8998014, 2.772175, 0, 0.2901961, 1, 1,
0.3405351, -0.7961689, 1.525274, 0, 0.2862745, 1, 1,
0.340981, 0.5169186, -0.7742848, 0, 0.2784314, 1, 1,
0.341376, -1.156168, 3.199064, 0, 0.2745098, 1, 1,
0.3416834, -0.8593749, 3.408995, 0, 0.2666667, 1, 1,
0.3424166, 2.133649, -1.460956, 0, 0.2627451, 1, 1,
0.3461113, 0.4868249, 0.7573171, 0, 0.254902, 1, 1,
0.3461497, -0.9897814, 3.072907, 0, 0.2509804, 1, 1,
0.3462121, -1.289548, 2.36322, 0, 0.2431373, 1, 1,
0.3463287, -1.493731, 1.630101, 0, 0.2392157, 1, 1,
0.347981, 1.59534, 2.089798, 0, 0.2313726, 1, 1,
0.3485451, 1.52609, 1.926681, 0, 0.227451, 1, 1,
0.3523419, 2.098676, -1.11925, 0, 0.2196078, 1, 1,
0.3545614, 0.6197655, 2.264401, 0, 0.2156863, 1, 1,
0.3546517, -0.6839283, 3.020222, 0, 0.2078431, 1, 1,
0.3547796, -0.5242343, 1.247564, 0, 0.2039216, 1, 1,
0.3613341, -1.312633, 2.599157, 0, 0.1960784, 1, 1,
0.3634945, 0.2827571, 2.034843, 0, 0.1882353, 1, 1,
0.3666745, 1.583599, -0.7322385, 0, 0.1843137, 1, 1,
0.3692551, -2.020822, 2.92885, 0, 0.1764706, 1, 1,
0.3701144, 1.780974, -0.5467125, 0, 0.172549, 1, 1,
0.3737075, -1.308707, 2.867189, 0, 0.1647059, 1, 1,
0.374451, -1.300003, 2.383989, 0, 0.1607843, 1, 1,
0.3746484, 1.314763, 1.398727, 0, 0.1529412, 1, 1,
0.3748517, -0.8741556, 2.291276, 0, 0.1490196, 1, 1,
0.3772866, 0.7136139, -0.281303, 0, 0.1411765, 1, 1,
0.3795824, 1.522026, 0.5226271, 0, 0.1372549, 1, 1,
0.3832781, 0.01948133, 0.4423071, 0, 0.1294118, 1, 1,
0.3849742, 1.316804, 1.451388, 0, 0.1254902, 1, 1,
0.3883533, -0.4541829, 3.349174, 0, 0.1176471, 1, 1,
0.389039, 0.06897499, 1.890406, 0, 0.1137255, 1, 1,
0.389207, 0.4672281, -0.005551971, 0, 0.1058824, 1, 1,
0.3908862, -0.3561256, 2.657856, 0, 0.09803922, 1, 1,
0.3970731, -0.6485329, 3.72476, 0, 0.09411765, 1, 1,
0.3997956, 0.7169759, -0.09065107, 0, 0.08627451, 1, 1,
0.4014456, -1.136865, 4.600822, 0, 0.08235294, 1, 1,
0.4026891, -0.8635275, 4.334241, 0, 0.07450981, 1, 1,
0.40793, -0.9744308, 0.9320788, 0, 0.07058824, 1, 1,
0.4080632, -0.1983379, 3.114566, 0, 0.0627451, 1, 1,
0.4095129, 0.1509508, 1.251696, 0, 0.05882353, 1, 1,
0.4098804, -1.284344, 2.126838, 0, 0.05098039, 1, 1,
0.410688, -1.110188, 4.05996, 0, 0.04705882, 1, 1,
0.4173663, -0.390415, 1.612236, 0, 0.03921569, 1, 1,
0.4182962, -0.5801802, 1.727616, 0, 0.03529412, 1, 1,
0.4208201, 0.9903735, 1.355802, 0, 0.02745098, 1, 1,
0.4229761, 0.2675008, -0.6035007, 0, 0.02352941, 1, 1,
0.4249699, 1.457348, 1.169877, 0, 0.01568628, 1, 1,
0.4256662, -1.161307, 1.683398, 0, 0.01176471, 1, 1,
0.4270546, -0.2319912, 1.52547, 0, 0.003921569, 1, 1,
0.4290339, 1.717828, -0.04722264, 0.003921569, 0, 1, 1,
0.4321094, 0.5170314, 0.9744479, 0.007843138, 0, 1, 1,
0.4323258, -0.1759747, 1.020607, 0.01568628, 0, 1, 1,
0.432401, -1.530825, 3.338806, 0.01960784, 0, 1, 1,
0.432714, -1.302718, 4.310269, 0.02745098, 0, 1, 1,
0.4328482, 0.6720196, 1.342956, 0.03137255, 0, 1, 1,
0.4341845, -0.7995224, 1.895157, 0.03921569, 0, 1, 1,
0.4368976, 1.076417, -0.02579473, 0.04313726, 0, 1, 1,
0.4421783, -0.4923919, 1.801886, 0.05098039, 0, 1, 1,
0.4436166, -0.8949643, 0.9210472, 0.05490196, 0, 1, 1,
0.4444076, -0.5741861, 3.071413, 0.0627451, 0, 1, 1,
0.4472052, -1.577027, 2.744125, 0.06666667, 0, 1, 1,
0.4475923, -0.4130278, 3.04492, 0.07450981, 0, 1, 1,
0.4550845, -1.482927, 2.873116, 0.07843138, 0, 1, 1,
0.4584721, 1.311553, -1.294173, 0.08627451, 0, 1, 1,
0.4589401, -0.7084637, 2.38056, 0.09019608, 0, 1, 1,
0.4599528, -1.284509, 2.318396, 0.09803922, 0, 1, 1,
0.4652676, 0.1026002, 2.773528, 0.1058824, 0, 1, 1,
0.4685435, 2.121139, -0.6659665, 0.1098039, 0, 1, 1,
0.475517, -1.068476, 2.547014, 0.1176471, 0, 1, 1,
0.4762446, -0.05731459, 3.169001, 0.1215686, 0, 1, 1,
0.4816085, 0.1552278, 0.1837794, 0.1294118, 0, 1, 1,
0.4882867, 0.5297051, 0.7626231, 0.1333333, 0, 1, 1,
0.4900073, -0.6597251, 2.92239, 0.1411765, 0, 1, 1,
0.5046721, 1.687289, -0.1806531, 0.145098, 0, 1, 1,
0.5059364, -0.2008715, 2.360705, 0.1529412, 0, 1, 1,
0.506443, 0.7814734, 0.8132142, 0.1568628, 0, 1, 1,
0.5067471, 0.4391132, 2.10232, 0.1647059, 0, 1, 1,
0.5083703, -0.02658433, 1.528838, 0.1686275, 0, 1, 1,
0.50897, -0.03414227, 2.190409, 0.1764706, 0, 1, 1,
0.5090926, 1.088927, 0.535737, 0.1803922, 0, 1, 1,
0.5115901, -0.8005148, 3.39784, 0.1882353, 0, 1, 1,
0.5142793, 0.03240601, 1.098226, 0.1921569, 0, 1, 1,
0.5156439, 0.8679183, 1.553975, 0.2, 0, 1, 1,
0.5212985, -0.1943249, 1.226473, 0.2078431, 0, 1, 1,
0.521687, 1.167216, -0.3731595, 0.2117647, 0, 1, 1,
0.5286285, 2.002574, 1.219929, 0.2196078, 0, 1, 1,
0.5306639, 0.4837984, 2.418901, 0.2235294, 0, 1, 1,
0.5311261, 0.5422438, -0.7752242, 0.2313726, 0, 1, 1,
0.5328198, -0.2161334, 2.245857, 0.2352941, 0, 1, 1,
0.5330018, -1.106432, 2.806668, 0.2431373, 0, 1, 1,
0.533452, -0.5143777, 0.9663399, 0.2470588, 0, 1, 1,
0.5401717, -1.720735, 3.029588, 0.254902, 0, 1, 1,
0.5494975, 0.02344005, 1.420951, 0.2588235, 0, 1, 1,
0.5529983, -1.435048, 3.608833, 0.2666667, 0, 1, 1,
0.5531169, -0.5371562, 2.679841, 0.2705882, 0, 1, 1,
0.5583019, 0.949985, 0.4761536, 0.2784314, 0, 1, 1,
0.5586309, -0.3085831, 2.625529, 0.282353, 0, 1, 1,
0.5610433, -0.2464638, 2.344144, 0.2901961, 0, 1, 1,
0.5624971, -0.03464549, 1.706931, 0.2941177, 0, 1, 1,
0.5633011, 2.526943, 0.6526206, 0.3019608, 0, 1, 1,
0.5657508, 2.118928, -0.3204626, 0.3098039, 0, 1, 1,
0.5672957, 0.2486778, 1.559004, 0.3137255, 0, 1, 1,
0.5703904, 0.9443989, 1.076831, 0.3215686, 0, 1, 1,
0.5712126, 1.515552, -2.795531, 0.3254902, 0, 1, 1,
0.582629, -0.5432892, 3.155055, 0.3333333, 0, 1, 1,
0.5835932, 0.9554716, 0.4242837, 0.3372549, 0, 1, 1,
0.5862141, 1.884979, 2.68047, 0.345098, 0, 1, 1,
0.5867125, -1.524803, 2.257394, 0.3490196, 0, 1, 1,
0.5915221, -1.563627, 3.645257, 0.3568628, 0, 1, 1,
0.5927345, 0.9741412, 0.1242325, 0.3607843, 0, 1, 1,
0.5946823, -0.0309193, 1.46129, 0.3686275, 0, 1, 1,
0.602496, 0.9094134, 0.915028, 0.372549, 0, 1, 1,
0.6135713, 0.3684225, 2.070765, 0.3803922, 0, 1, 1,
0.614224, -2.187324, 1.742493, 0.3843137, 0, 1, 1,
0.6158004, 2.156837, 0.4613902, 0.3921569, 0, 1, 1,
0.616947, 2.660385, -0.1968169, 0.3960784, 0, 1, 1,
0.6193745, 1.041138, 0.7768711, 0.4039216, 0, 1, 1,
0.6249849, -1.123571, 2.941527, 0.4117647, 0, 1, 1,
0.6275948, -1.313438, 3.14534, 0.4156863, 0, 1, 1,
0.6305096, -0.8314905, 3.633715, 0.4235294, 0, 1, 1,
0.636956, 0.5061706, 1.319095, 0.427451, 0, 1, 1,
0.6384056, -1.122453, 5.321909, 0.4352941, 0, 1, 1,
0.6439919, -0.4658404, 0.9412137, 0.4392157, 0, 1, 1,
0.6454827, -0.293741, 0.9208197, 0.4470588, 0, 1, 1,
0.648165, -0.6889765, 4.319252, 0.4509804, 0, 1, 1,
0.6487401, -1.111432, 2.951637, 0.4588235, 0, 1, 1,
0.6546955, 0.06076332, 2.982403, 0.4627451, 0, 1, 1,
0.6559824, 0.2239819, -0.1158276, 0.4705882, 0, 1, 1,
0.6584369, -0.3483523, 1.222194, 0.4745098, 0, 1, 1,
0.659382, -0.09430488, 1.278991, 0.4823529, 0, 1, 1,
0.6596073, 1.42961, 0.6340242, 0.4862745, 0, 1, 1,
0.660345, 1.750624, 1.660184, 0.4941176, 0, 1, 1,
0.6613556, -1.23177, 1.634945, 0.5019608, 0, 1, 1,
0.6627539, 0.4238496, 1.144869, 0.5058824, 0, 1, 1,
0.6651884, 0.4085408, 2.347479, 0.5137255, 0, 1, 1,
0.6725729, 0.8086429, -0.5632262, 0.5176471, 0, 1, 1,
0.6725823, 1.822694, -0.3520035, 0.5254902, 0, 1, 1,
0.6746944, -0.9384866, 1.505872, 0.5294118, 0, 1, 1,
0.6762815, 1.102985, 0.4821554, 0.5372549, 0, 1, 1,
0.6804929, 0.5695378, -0.6669399, 0.5411765, 0, 1, 1,
0.6842101, -0.06231346, 2.519551, 0.5490196, 0, 1, 1,
0.6877556, 1.254412, 0.5638089, 0.5529412, 0, 1, 1,
0.7029383, -0.7457879, 1.159483, 0.5607843, 0, 1, 1,
0.7070324, 0.5909951, -0.4553187, 0.5647059, 0, 1, 1,
0.7070875, -0.6831304, 2.749447, 0.572549, 0, 1, 1,
0.7101886, -0.7268038, 1.056262, 0.5764706, 0, 1, 1,
0.7119237, -0.2882732, 1.965439, 0.5843138, 0, 1, 1,
0.7163541, 1.611927, 0.506253, 0.5882353, 0, 1, 1,
0.7175134, 0.7658103, 1.470637, 0.5960785, 0, 1, 1,
0.7226456, -0.8415275, 1.574277, 0.6039216, 0, 1, 1,
0.7235575, -2.623557, 3.871524, 0.6078432, 0, 1, 1,
0.7258389, 0.1731359, 1.594905, 0.6156863, 0, 1, 1,
0.7339056, -0.2562426, 3.774912, 0.6196079, 0, 1, 1,
0.7347618, -0.6229223, 1.89489, 0.627451, 0, 1, 1,
0.7387937, -1.596763, 1.887927, 0.6313726, 0, 1, 1,
0.7484223, -0.1223983, 1.418018, 0.6392157, 0, 1, 1,
0.749402, 0.8191398, 1.091029, 0.6431373, 0, 1, 1,
0.7495805, 0.9939955, 2.899457, 0.6509804, 0, 1, 1,
0.7694083, -0.5998152, 1.278661, 0.654902, 0, 1, 1,
0.7695999, 0.1625874, -0.5025762, 0.6627451, 0, 1, 1,
0.7716592, 0.5197548, 1.492502, 0.6666667, 0, 1, 1,
0.7752488, -0.1143921, 2.280773, 0.6745098, 0, 1, 1,
0.7886627, -0.5938134, 2.418266, 0.6784314, 0, 1, 1,
0.7898966, -1.579327, 2.536445, 0.6862745, 0, 1, 1,
0.7905181, 0.3320898, 1.744986, 0.6901961, 0, 1, 1,
0.790744, -0.7804033, 3.433162, 0.6980392, 0, 1, 1,
0.7955235, 0.8756363, 1.87224, 0.7058824, 0, 1, 1,
0.8015407, -0.9697212, 2.613996, 0.7098039, 0, 1, 1,
0.8024065, -0.5787075, 1.357372, 0.7176471, 0, 1, 1,
0.807422, 0.623133, 2.705108, 0.7215686, 0, 1, 1,
0.8080498, -0.2595101, 2.84949, 0.7294118, 0, 1, 1,
0.8124752, 0.7908533, 1.473514, 0.7333333, 0, 1, 1,
0.816792, 0.1829258, 0.3555314, 0.7411765, 0, 1, 1,
0.8237848, -0.747056, 3.955044, 0.7450981, 0, 1, 1,
0.8270749, -1.583004, 4.252589, 0.7529412, 0, 1, 1,
0.8299406, -0.443938, 3.867945, 0.7568628, 0, 1, 1,
0.8342678, 0.03430532, 1.566047, 0.7647059, 0, 1, 1,
0.8408971, -0.4841022, 2.274961, 0.7686275, 0, 1, 1,
0.8426529, -0.07906535, 1.332278, 0.7764706, 0, 1, 1,
0.8467938, -0.685443, 2.245621, 0.7803922, 0, 1, 1,
0.8486795, 0.5724373, 1.575745, 0.7882353, 0, 1, 1,
0.8510739, -0.0173738, 0.847138, 0.7921569, 0, 1, 1,
0.851574, 0.3669139, 0.9100962, 0.8, 0, 1, 1,
0.8519036, -0.2257335, 0.7065725, 0.8078431, 0, 1, 1,
0.8526611, -1.037838, 1.862677, 0.8117647, 0, 1, 1,
0.8546096, -0.3994761, 1.501975, 0.8196079, 0, 1, 1,
0.8562147, -0.9391128, 3.212484, 0.8235294, 0, 1, 1,
0.8583075, -1.303502, 3.039801, 0.8313726, 0, 1, 1,
0.8615077, -0.1020148, 1.149727, 0.8352941, 0, 1, 1,
0.8628805, 1.04434, 1.841476, 0.8431373, 0, 1, 1,
0.8683004, 0.7051319, 1.86073, 0.8470588, 0, 1, 1,
0.8698939, -1.379575, 4.212807, 0.854902, 0, 1, 1,
0.8751218, -0.8946591, 4.069013, 0.8588235, 0, 1, 1,
0.8764689, -1.531757, 3.74755, 0.8666667, 0, 1, 1,
0.8774114, -1.026068, 2.083177, 0.8705882, 0, 1, 1,
0.882247, 0.1101073, 1.881237, 0.8784314, 0, 1, 1,
0.8905851, -2.044164, 2.66291, 0.8823529, 0, 1, 1,
0.8911969, 0.02976339, 1.43465, 0.8901961, 0, 1, 1,
0.8961346, -0.5040373, 0.6318731, 0.8941177, 0, 1, 1,
0.8980985, 0.7139583, 1.625075, 0.9019608, 0, 1, 1,
0.8986531, -0.4033251, 0.961329, 0.9098039, 0, 1, 1,
0.9051462, 0.2709059, 0.3920173, 0.9137255, 0, 1, 1,
0.9088038, -1.137043, 1.401395, 0.9215686, 0, 1, 1,
0.9129186, 1.742713, 0.8225422, 0.9254902, 0, 1, 1,
0.9150836, -0.01038201, 0.4772809, 0.9333333, 0, 1, 1,
0.9234719, -1.254798, 2.127519, 0.9372549, 0, 1, 1,
0.9264629, 0.5282921, 0.4234358, 0.945098, 0, 1, 1,
0.9318424, 0.686274, 0.9060199, 0.9490196, 0, 1, 1,
0.9330221, 0.7949627, -2.331572, 0.9568627, 0, 1, 1,
0.9341977, 1.002888, -0.1363198, 0.9607843, 0, 1, 1,
0.9369422, 0.491042, 0.5068356, 0.9686275, 0, 1, 1,
0.9480412, -0.5253968, 0.6002482, 0.972549, 0, 1, 1,
0.9516579, -0.3048165, 2.168857, 0.9803922, 0, 1, 1,
0.9524233, 0.02628139, -0.1025003, 0.9843137, 0, 1, 1,
0.9526382, 0.2346807, 2.307534, 0.9921569, 0, 1, 1,
0.9563076, -1.370083, 3.200801, 0.9960784, 0, 1, 1,
0.9644134, -1.062991, 2.730688, 1, 0, 0.9960784, 1,
0.9669322, -0.0285372, 2.489955, 1, 0, 0.9882353, 1,
0.9695666, -1.541784, 2.186738, 1, 0, 0.9843137, 1,
0.971164, -0.3547829, 1.471399, 1, 0, 0.9764706, 1,
0.9713868, -0.6630977, 2.787767, 1, 0, 0.972549, 1,
0.9738993, 1.554823, -0.719895, 1, 0, 0.9647059, 1,
1.000878, 0.6494609, 1.171065, 1, 0, 0.9607843, 1,
1.002747, -1.697414, 1.796391, 1, 0, 0.9529412, 1,
1.007241, -0.6630251, 2.99795, 1, 0, 0.9490196, 1,
1.01118, 2.320474, -0.0003219627, 1, 0, 0.9411765, 1,
1.011909, 0.3732937, 0.8265792, 1, 0, 0.9372549, 1,
1.012658, -1.408953, 3.210737, 1, 0, 0.9294118, 1,
1.017637, -1.081306, 1.654126, 1, 0, 0.9254902, 1,
1.020048, -2.247867, 3.244905, 1, 0, 0.9176471, 1,
1.02136, 0.7807634, 1.244643, 1, 0, 0.9137255, 1,
1.030663, 0.903755, 0.3951095, 1, 0, 0.9058824, 1,
1.038184, -1.735508, 3.9193, 1, 0, 0.9019608, 1,
1.046634, -0.4917926, 0.1911744, 1, 0, 0.8941177, 1,
1.05249, 1.622977, 0.8562876, 1, 0, 0.8862745, 1,
1.054758, 0.9338493, 1.780444, 1, 0, 0.8823529, 1,
1.060861, -0.7933844, 3.500268, 1, 0, 0.8745098, 1,
1.06536, 1.353781, 0.8028547, 1, 0, 0.8705882, 1,
1.067767, -0.001561728, 0.9463657, 1, 0, 0.8627451, 1,
1.075262, -0.7412924, 1.642501, 1, 0, 0.8588235, 1,
1.086111, 0.2103076, 1.174719, 1, 0, 0.8509804, 1,
1.087538, -2.21299, 3.176376, 1, 0, 0.8470588, 1,
1.094188, -2.144041, 3.440021, 1, 0, 0.8392157, 1,
1.095982, 1.112259, 1.287993, 1, 0, 0.8352941, 1,
1.09949, 0.2112299, 2.111225, 1, 0, 0.827451, 1,
1.102672, -0.9277429, 2.023333, 1, 0, 0.8235294, 1,
1.106402, 0.02580151, 3.409692, 1, 0, 0.8156863, 1,
1.108543, -0.5855621, 2.038365, 1, 0, 0.8117647, 1,
1.109497, -0.2499159, -0.1998732, 1, 0, 0.8039216, 1,
1.112142, -0.5333608, 1.41726, 1, 0, 0.7960784, 1,
1.11247, 1.03124, -0.883608, 1, 0, 0.7921569, 1,
1.115019, 0.5010138, 2.325935, 1, 0, 0.7843137, 1,
1.115094, -0.5515455, 0.9310819, 1, 0, 0.7803922, 1,
1.120812, -0.2468094, 1.095838, 1, 0, 0.772549, 1,
1.123393, -0.9378251, 3.350964, 1, 0, 0.7686275, 1,
1.132698, -0.8374881, 2.608016, 1, 0, 0.7607843, 1,
1.137762, -0.4063214, 0.6931103, 1, 0, 0.7568628, 1,
1.140773, -0.2499416, 1.289274, 1, 0, 0.7490196, 1,
1.142813, -0.3340781, 1.709291, 1, 0, 0.7450981, 1,
1.145857, 1.205681, -0.2432782, 1, 0, 0.7372549, 1,
1.147649, -0.7223917, 1.457409, 1, 0, 0.7333333, 1,
1.150553, 0.494681, 2.98778, 1, 0, 0.7254902, 1,
1.151349, -0.8968523, 2.69277, 1, 0, 0.7215686, 1,
1.158353, -0.03146046, 2.074706, 1, 0, 0.7137255, 1,
1.169228, 1.125413, 0.5187079, 1, 0, 0.7098039, 1,
1.177742, 0.3737247, 2.5533, 1, 0, 0.7019608, 1,
1.180213, -0.3364886, 2.371569, 1, 0, 0.6941177, 1,
1.187391, 0.6959831, 2.943152, 1, 0, 0.6901961, 1,
1.189333, -0.464341, 1.519506, 1, 0, 0.682353, 1,
1.226498, -0.3362448, 2.03358, 1, 0, 0.6784314, 1,
1.231053, -0.6614454, -0.03132608, 1, 0, 0.6705883, 1,
1.233063, 0.2310531, 2.466628, 1, 0, 0.6666667, 1,
1.233369, 1.613984, -0.1806984, 1, 0, 0.6588235, 1,
1.23511, -0.07418264, 1.206843, 1, 0, 0.654902, 1,
1.236393, -0.2166123, 1.529928, 1, 0, 0.6470588, 1,
1.237688, 1.323256, 0.4173989, 1, 0, 0.6431373, 1,
1.238571, 2.112577, -0.5786619, 1, 0, 0.6352941, 1,
1.243936, -0.3669117, 2.2443, 1, 0, 0.6313726, 1,
1.254369, -0.0144887, 1.140118, 1, 0, 0.6235294, 1,
1.255083, 0.3069312, 3.566663, 1, 0, 0.6196079, 1,
1.271469, -0.2449813, 2.078166, 1, 0, 0.6117647, 1,
1.272952, 0.1100238, 0.9993894, 1, 0, 0.6078432, 1,
1.278744, -0.8330699, 2.302208, 1, 0, 0.6, 1,
1.287835, 0.02140084, 2.647707, 1, 0, 0.5921569, 1,
1.298898, -1.298225, 1.223533, 1, 0, 0.5882353, 1,
1.302844, 0.4282551, 1.396936, 1, 0, 0.5803922, 1,
1.308785, -0.8861579, 2.9675, 1, 0, 0.5764706, 1,
1.312847, -0.8094046, 3.403068, 1, 0, 0.5686275, 1,
1.315106, -0.3336062, 1.009765, 1, 0, 0.5647059, 1,
1.317132, -0.5641636, 3.114881, 1, 0, 0.5568628, 1,
1.318151, -0.1488789, 1.068347, 1, 0, 0.5529412, 1,
1.322573, 0.09076814, 1.995234, 1, 0, 0.5450981, 1,
1.326023, 0.6588716, 1.862846, 1, 0, 0.5411765, 1,
1.334633, -1.732103, 2.855705, 1, 0, 0.5333334, 1,
1.3355, -1.187083, 0.158466, 1, 0, 0.5294118, 1,
1.342523, -0.1101841, 1.892099, 1, 0, 0.5215687, 1,
1.345515, 0.2307446, 0.8171366, 1, 0, 0.5176471, 1,
1.359207, 0.4983611, 2.043405, 1, 0, 0.509804, 1,
1.359209, -1.282426, -0.05825517, 1, 0, 0.5058824, 1,
1.363253, 0.2202298, 0.8673484, 1, 0, 0.4980392, 1,
1.366601, -2.122492, 2.376379, 1, 0, 0.4901961, 1,
1.380362, 0.01676265, 1.938907, 1, 0, 0.4862745, 1,
1.383308, -0.31408, 2.315652, 1, 0, 0.4784314, 1,
1.384724, 0.5833703, 1.565558, 1, 0, 0.4745098, 1,
1.394667, -1.854066, 1.316268, 1, 0, 0.4666667, 1,
1.404821, 1.902626, -1.744394, 1, 0, 0.4627451, 1,
1.406341, -0.3525163, 1.864776, 1, 0, 0.454902, 1,
1.409043, -0.4222246, 1.646215, 1, 0, 0.4509804, 1,
1.414964, 0.1538962, 2.486408, 1, 0, 0.4431373, 1,
1.416383, -0.8926759, 2.129662, 1, 0, 0.4392157, 1,
1.417748, -0.9207272, 1.184157, 1, 0, 0.4313726, 1,
1.424256, 1.421332, -0.4081751, 1, 0, 0.427451, 1,
1.43233, -0.842787, 2.159355, 1, 0, 0.4196078, 1,
1.434234, 0.5032322, 0.9243059, 1, 0, 0.4156863, 1,
1.442813, -0.1394181, 3.073251, 1, 0, 0.4078431, 1,
1.462768, 0.4947665, 1.668904, 1, 0, 0.4039216, 1,
1.46294, -1.004483, 2.967835, 1, 0, 0.3960784, 1,
1.468898, 0.08571459, 2.433847, 1, 0, 0.3882353, 1,
1.47861, -0.5604151, 1.41045, 1, 0, 0.3843137, 1,
1.481963, 0.5751362, 1.375336, 1, 0, 0.3764706, 1,
1.489127, -0.7214499, 1.821454, 1, 0, 0.372549, 1,
1.492293, -0.4004874, 0.4596871, 1, 0, 0.3647059, 1,
1.49685, -1.180491, 2.022075, 1, 0, 0.3607843, 1,
1.505553, 1.46212, 1.271933, 1, 0, 0.3529412, 1,
1.506874, -0.4782891, 0.1926848, 1, 0, 0.3490196, 1,
1.523039, 2.225354, 0.3812147, 1, 0, 0.3411765, 1,
1.530072, 0.3908176, 1.31575, 1, 0, 0.3372549, 1,
1.539756, -1.143028, 2.536422, 1, 0, 0.3294118, 1,
1.540011, 0.2850799, 1.296696, 1, 0, 0.3254902, 1,
1.574335, -0.853676, 1.671369, 1, 0, 0.3176471, 1,
1.575196, -1.177198, 2.524869, 1, 0, 0.3137255, 1,
1.578519, -1.672472, 1.333842, 1, 0, 0.3058824, 1,
1.584559, -0.06278674, 2.120866, 1, 0, 0.2980392, 1,
1.586841, 2.450452, -0.3936997, 1, 0, 0.2941177, 1,
1.592216, -0.9012978, 2.047437, 1, 0, 0.2862745, 1,
1.595642, -2.719405, 4.890523, 1, 0, 0.282353, 1,
1.616571, 0.4225287, 1.435759, 1, 0, 0.2745098, 1,
1.617745, 1.863395, 1.449504, 1, 0, 0.2705882, 1,
1.61812, -0.4366576, 2.285703, 1, 0, 0.2627451, 1,
1.627933, -0.5442442, 2.831189, 1, 0, 0.2588235, 1,
1.658555, 1.610154, -0.5865003, 1, 0, 0.2509804, 1,
1.66437, -0.7387704, 2.740674, 1, 0, 0.2470588, 1,
1.681871, -0.1011252, 1.555961, 1, 0, 0.2392157, 1,
1.686703, 0.6761716, 1.931074, 1, 0, 0.2352941, 1,
1.692157, -0.04166891, 2.125517, 1, 0, 0.227451, 1,
1.703479, 0.1093541, 3.482333, 1, 0, 0.2235294, 1,
1.735998, 1.51287, 2.958057, 1, 0, 0.2156863, 1,
1.747087, -1.899723, 0.8066642, 1, 0, 0.2117647, 1,
1.751269, -0.6385334, 2.35568, 1, 0, 0.2039216, 1,
1.795464, -1.174199, 2.96033, 1, 0, 0.1960784, 1,
1.801644, 0.9751675, 1.150558, 1, 0, 0.1921569, 1,
1.863886, 0.5897499, 0.6367882, 1, 0, 0.1843137, 1,
1.870552, -0.1461154, 1.268781, 1, 0, 0.1803922, 1,
1.918529, 0.7966693, 0.6019563, 1, 0, 0.172549, 1,
1.922637, 1.657951, 0.6963287, 1, 0, 0.1686275, 1,
1.950698, 0.5621259, 0.715729, 1, 0, 0.1607843, 1,
1.954405, 1.18799, 1.98799, 1, 0, 0.1568628, 1,
1.957422, 1.504473, 1.38455, 1, 0, 0.1490196, 1,
1.962447, 1.727485, 0.6861219, 1, 0, 0.145098, 1,
1.976693, 1.782859, 0.3633007, 1, 0, 0.1372549, 1,
1.992076, 0.4176857, 2.047711, 1, 0, 0.1333333, 1,
2.011847, -0.7796132, 0.4132411, 1, 0, 0.1254902, 1,
2.016233, 0.402053, 2.043153, 1, 0, 0.1215686, 1,
2.032181, -1.299163, 2.72696, 1, 0, 0.1137255, 1,
2.063451, -0.1063383, 4.193557, 1, 0, 0.1098039, 1,
2.071468, -0.3223034, 2.988833, 1, 0, 0.1019608, 1,
2.072402, -1.174822, 1.609968, 1, 0, 0.09411765, 1,
2.12542, -1.036014, 3.978539, 1, 0, 0.09019608, 1,
2.141029, 0.7443054, 2.687766, 1, 0, 0.08235294, 1,
2.189791, 2.446102, 0.4122495, 1, 0, 0.07843138, 1,
2.271753, -1.40985, 2.883955, 1, 0, 0.07058824, 1,
2.312455, -0.8782083, 1.832497, 1, 0, 0.06666667, 1,
2.408837, -0.5893829, 1.770009, 1, 0, 0.05882353, 1,
2.428027, -0.4348448, 2.599558, 1, 0, 0.05490196, 1,
2.434999, -1.426019, 2.464385, 1, 0, 0.04705882, 1,
2.448414, 0.5787942, 0.4289504, 1, 0, 0.04313726, 1,
2.537033, 0.6639127, 0.5527151, 1, 0, 0.03529412, 1,
2.745748, 0.8851995, 0.896847, 1, 0, 0.03137255, 1,
2.781455, 0.04463768, 2.423354, 1, 0, 0.02352941, 1,
2.811432, 0.2019575, 2.149536, 1, 0, 0.01960784, 1,
3.015, 0.3421248, 1.802565, 1, 0, 0.01176471, 1,
3.127461, 0.6604944, 3.092123, 1, 0, 0.007843138, 1
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
0.1103275, -4.940167, -6.81036, 0, -0.5, 0.5, 0.5,
0.1103275, -4.940167, -6.81036, 1, -0.5, 0.5, 0.5,
0.1103275, -4.940167, -6.81036, 1, 1.5, 0.5, 0.5,
0.1103275, -4.940167, -6.81036, 0, 1.5, 0.5, 0.5
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
-3.929615, 0.01897275, -6.81036, 0, -0.5, 0.5, 0.5,
-3.929615, 0.01897275, -6.81036, 1, -0.5, 0.5, 0.5,
-3.929615, 0.01897275, -6.81036, 1, 1.5, 0.5, 0.5,
-3.929615, 0.01897275, -6.81036, 0, 1.5, 0.5, 0.5
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
-3.929615, -4.940167, 0.3085225, 0, -0.5, 0.5, 0.5,
-3.929615, -4.940167, 0.3085225, 1, -0.5, 0.5, 0.5,
-3.929615, -4.940167, 0.3085225, 1, 1.5, 0.5, 0.5,
-3.929615, -4.940167, 0.3085225, 0, 1.5, 0.5, 0.5
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
-2, -3.79575, -5.167541,
3, -3.79575, -5.167541,
-2, -3.79575, -5.167541,
-2, -3.986486, -5.441344,
-1, -3.79575, -5.167541,
-1, -3.986486, -5.441344,
0, -3.79575, -5.167541,
0, -3.986486, -5.441344,
1, -3.79575, -5.167541,
1, -3.986486, -5.441344,
2, -3.79575, -5.167541,
2, -3.986486, -5.441344,
3, -3.79575, -5.167541,
3, -3.986486, -5.441344
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
-2, -4.367959, -5.98895, 0, -0.5, 0.5, 0.5,
-2, -4.367959, -5.98895, 1, -0.5, 0.5, 0.5,
-2, -4.367959, -5.98895, 1, 1.5, 0.5, 0.5,
-2, -4.367959, -5.98895, 0, 1.5, 0.5, 0.5,
-1, -4.367959, -5.98895, 0, -0.5, 0.5, 0.5,
-1, -4.367959, -5.98895, 1, -0.5, 0.5, 0.5,
-1, -4.367959, -5.98895, 1, 1.5, 0.5, 0.5,
-1, -4.367959, -5.98895, 0, 1.5, 0.5, 0.5,
0, -4.367959, -5.98895, 0, -0.5, 0.5, 0.5,
0, -4.367959, -5.98895, 1, -0.5, 0.5, 0.5,
0, -4.367959, -5.98895, 1, 1.5, 0.5, 0.5,
0, -4.367959, -5.98895, 0, 1.5, 0.5, 0.5,
1, -4.367959, -5.98895, 0, -0.5, 0.5, 0.5,
1, -4.367959, -5.98895, 1, -0.5, 0.5, 0.5,
1, -4.367959, -5.98895, 1, 1.5, 0.5, 0.5,
1, -4.367959, -5.98895, 0, 1.5, 0.5, 0.5,
2, -4.367959, -5.98895, 0, -0.5, 0.5, 0.5,
2, -4.367959, -5.98895, 1, -0.5, 0.5, 0.5,
2, -4.367959, -5.98895, 1, 1.5, 0.5, 0.5,
2, -4.367959, -5.98895, 0, 1.5, 0.5, 0.5,
3, -4.367959, -5.98895, 0, -0.5, 0.5, 0.5,
3, -4.367959, -5.98895, 1, -0.5, 0.5, 0.5,
3, -4.367959, -5.98895, 1, 1.5, 0.5, 0.5,
3, -4.367959, -5.98895, 0, 1.5, 0.5, 0.5
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
-2.99732, -2, -5.167541,
-2.99732, 2, -5.167541,
-2.99732, -2, -5.167541,
-3.152703, -2, -5.441344,
-2.99732, 0, -5.167541,
-3.152703, 0, -5.441344,
-2.99732, 2, -5.167541,
-3.152703, 2, -5.441344
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
-3.463468, -2, -5.98895, 0, -0.5, 0.5, 0.5,
-3.463468, -2, -5.98895, 1, -0.5, 0.5, 0.5,
-3.463468, -2, -5.98895, 1, 1.5, 0.5, 0.5,
-3.463468, -2, -5.98895, 0, 1.5, 0.5, 0.5,
-3.463468, 0, -5.98895, 0, -0.5, 0.5, 0.5,
-3.463468, 0, -5.98895, 1, -0.5, 0.5, 0.5,
-3.463468, 0, -5.98895, 1, 1.5, 0.5, 0.5,
-3.463468, 0, -5.98895, 0, 1.5, 0.5, 0.5,
-3.463468, 2, -5.98895, 0, -0.5, 0.5, 0.5,
-3.463468, 2, -5.98895, 1, -0.5, 0.5, 0.5,
-3.463468, 2, -5.98895, 1, 1.5, 0.5, 0.5,
-3.463468, 2, -5.98895, 0, 1.5, 0.5, 0.5
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
-2.99732, -3.79575, -4,
-2.99732, -3.79575, 4,
-2.99732, -3.79575, -4,
-3.152703, -3.986486, -4,
-2.99732, -3.79575, -2,
-3.152703, -3.986486, -2,
-2.99732, -3.79575, 0,
-3.152703, -3.986486, 0,
-2.99732, -3.79575, 2,
-3.152703, -3.986486, 2,
-2.99732, -3.79575, 4,
-3.152703, -3.986486, 4
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
-3.463468, -4.367959, -4, 0, -0.5, 0.5, 0.5,
-3.463468, -4.367959, -4, 1, -0.5, 0.5, 0.5,
-3.463468, -4.367959, -4, 1, 1.5, 0.5, 0.5,
-3.463468, -4.367959, -4, 0, 1.5, 0.5, 0.5,
-3.463468, -4.367959, -2, 0, -0.5, 0.5, 0.5,
-3.463468, -4.367959, -2, 1, -0.5, 0.5, 0.5,
-3.463468, -4.367959, -2, 1, 1.5, 0.5, 0.5,
-3.463468, -4.367959, -2, 0, 1.5, 0.5, 0.5,
-3.463468, -4.367959, 0, 0, -0.5, 0.5, 0.5,
-3.463468, -4.367959, 0, 1, -0.5, 0.5, 0.5,
-3.463468, -4.367959, 0, 1, 1.5, 0.5, 0.5,
-3.463468, -4.367959, 0, 0, 1.5, 0.5, 0.5,
-3.463468, -4.367959, 2, 0, -0.5, 0.5, 0.5,
-3.463468, -4.367959, 2, 1, -0.5, 0.5, 0.5,
-3.463468, -4.367959, 2, 1, 1.5, 0.5, 0.5,
-3.463468, -4.367959, 2, 0, 1.5, 0.5, 0.5,
-3.463468, -4.367959, 4, 0, -0.5, 0.5, 0.5,
-3.463468, -4.367959, 4, 1, -0.5, 0.5, 0.5,
-3.463468, -4.367959, 4, 1, 1.5, 0.5, 0.5,
-3.463468, -4.367959, 4, 0, 1.5, 0.5, 0.5
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
-2.99732, -3.79575, -5.167541,
-2.99732, 3.833696, -5.167541,
-2.99732, -3.79575, 5.784585,
-2.99732, 3.833696, 5.784585,
-2.99732, -3.79575, -5.167541,
-2.99732, -3.79575, 5.784585,
-2.99732, 3.833696, -5.167541,
-2.99732, 3.833696, 5.784585,
-2.99732, -3.79575, -5.167541,
3.217975, -3.79575, -5.167541,
-2.99732, -3.79575, 5.784585,
3.217975, -3.79575, 5.784585,
-2.99732, 3.833696, -5.167541,
3.217975, 3.833696, -5.167541,
-2.99732, 3.833696, 5.784585,
3.217975, 3.833696, 5.784585,
3.217975, -3.79575, -5.167541,
3.217975, 3.833696, -5.167541,
3.217975, -3.79575, 5.784585,
3.217975, 3.833696, 5.784585,
3.217975, -3.79575, -5.167541,
3.217975, -3.79575, 5.784585,
3.217975, 3.833696, -5.167541,
3.217975, 3.833696, 5.784585
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
var radius = 7.862171;
var distance = 34.97969;
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
mvMatrix.translate( -0.1103275, -0.01897275, -0.3085225 );
mvMatrix.scale( 1.367712, 1.114201, 0.776172 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.97969);
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


