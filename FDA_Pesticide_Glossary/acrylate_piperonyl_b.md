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
-3.032624, -0.1817932, -2.074823, 1, 0, 0, 1,
-2.748577, 1.322851, -1.869113, 1, 0.007843138, 0, 1,
-2.670414, -0.8090938, -1.836705, 1, 0.01176471, 0, 1,
-2.640018, -0.05262939, -2.025316, 1, 0.01960784, 0, 1,
-2.520296, 0.4988188, -1.725556, 1, 0.02352941, 0, 1,
-2.473018, -0.7545774, -0.9775396, 1, 0.03137255, 0, 1,
-2.447482, 1.196376, -2.812351, 1, 0.03529412, 0, 1,
-2.428616, 0.04553514, -1.046737, 1, 0.04313726, 0, 1,
-2.395342, 0.9705964, -3.176976, 1, 0.04705882, 0, 1,
-2.37119, 1.773836, 0.7450157, 1, 0.05490196, 0, 1,
-2.262049, 0.7524906, -2.006744, 1, 0.05882353, 0, 1,
-2.242478, 2.369077, -2.127928, 1, 0.06666667, 0, 1,
-2.207007, -0.7415108, -0.899845, 1, 0.07058824, 0, 1,
-2.185039, 0.298978, -0.5520464, 1, 0.07843138, 0, 1,
-2.146072, 0.4449461, -1.764322, 1, 0.08235294, 0, 1,
-2.0601, -0.7745517, -1.147864, 1, 0.09019608, 0, 1,
-2.016227, 1.646957, -1.503807, 1, 0.09411765, 0, 1,
-2.011924, -0.9389256, -3.412625, 1, 0.1019608, 0, 1,
-1.983183, -0.5306982, -2.12582, 1, 0.1098039, 0, 1,
-1.982434, -0.4110281, -2.258971, 1, 0.1137255, 0, 1,
-1.98054, 1.232213, 1.498318, 1, 0.1215686, 0, 1,
-1.980051, -0.1360354, -1.495633, 1, 0.1254902, 0, 1,
-1.97862, 0.4839757, -1.798976, 1, 0.1333333, 0, 1,
-1.964672, -0.3035839, -1.139735, 1, 0.1372549, 0, 1,
-1.935313, -1.542826, -2.948117, 1, 0.145098, 0, 1,
-1.918511, 0.2827368, -0.9457794, 1, 0.1490196, 0, 1,
-1.91263, -0.3381081, -1.635157, 1, 0.1568628, 0, 1,
-1.910525, 0.4880189, -3.02331, 1, 0.1607843, 0, 1,
-1.910241, -0.1738599, -1.450466, 1, 0.1686275, 0, 1,
-1.887318, -0.2789099, -2.357098, 1, 0.172549, 0, 1,
-1.864118, 0.2669317, -0.193485, 1, 0.1803922, 0, 1,
-1.836261, 0.1993046, -1.976813, 1, 0.1843137, 0, 1,
-1.830536, 0.367049, -0.5164354, 1, 0.1921569, 0, 1,
-1.816249, -0.2754532, -1.346596, 1, 0.1960784, 0, 1,
-1.785022, 0.2729841, -1.391943, 1, 0.2039216, 0, 1,
-1.780596, -0.358062, -1.897587, 1, 0.2117647, 0, 1,
-1.775271, 0.1233829, -1.516192, 1, 0.2156863, 0, 1,
-1.763431, 0.5560734, -0.6183879, 1, 0.2235294, 0, 1,
-1.751201, -0.784535, -1.375959, 1, 0.227451, 0, 1,
-1.745927, -0.804313, -1.58445, 1, 0.2352941, 0, 1,
-1.736052, -0.6994752, -0.1220843, 1, 0.2392157, 0, 1,
-1.724147, 1.382961, -3.092279, 1, 0.2470588, 0, 1,
-1.717902, 0.8641195, -1.861798, 1, 0.2509804, 0, 1,
-1.710329, -0.1127391, -2.157217, 1, 0.2588235, 0, 1,
-1.697953, 0.03548884, -1.282672, 1, 0.2627451, 0, 1,
-1.695379, -0.5079681, -2.451395, 1, 0.2705882, 0, 1,
-1.690899, -1.262951, -1.340113, 1, 0.2745098, 0, 1,
-1.660522, -0.8248212, -1.75279, 1, 0.282353, 0, 1,
-1.645768, -0.368383, -0.7914777, 1, 0.2862745, 0, 1,
-1.609216, 0.3609024, -2.499964, 1, 0.2941177, 0, 1,
-1.605995, 1.920784, -0.4576162, 1, 0.3019608, 0, 1,
-1.600737, 0.2961547, -1.637376, 1, 0.3058824, 0, 1,
-1.598693, -0.5855119, -1.213383, 1, 0.3137255, 0, 1,
-1.589668, 1.296992, 0.4599993, 1, 0.3176471, 0, 1,
-1.583665, 0.06995985, -3.358345, 1, 0.3254902, 0, 1,
-1.575543, 0.4247801, -1.726454, 1, 0.3294118, 0, 1,
-1.563152, 1.996003, -2.092349, 1, 0.3372549, 0, 1,
-1.562125, 1.053304, -0.7704172, 1, 0.3411765, 0, 1,
-1.556683, -0.5664635, -1.92487, 1, 0.3490196, 0, 1,
-1.532221, -0.2174365, -0.5142108, 1, 0.3529412, 0, 1,
-1.531833, -0.8171545, -4.574937, 1, 0.3607843, 0, 1,
-1.531168, -0.006687166, -1.121202, 1, 0.3647059, 0, 1,
-1.509429, 0.493784, -0.3530943, 1, 0.372549, 0, 1,
-1.489714, -1.217915, -1.357175, 1, 0.3764706, 0, 1,
-1.476639, 0.2478515, -3.566624, 1, 0.3843137, 0, 1,
-1.472128, -0.07441521, -1.043304, 1, 0.3882353, 0, 1,
-1.469921, -0.6602044, -1.26017, 1, 0.3960784, 0, 1,
-1.460208, 0.8070402, -1.824119, 1, 0.4039216, 0, 1,
-1.452382, 0.6733063, -1.999064, 1, 0.4078431, 0, 1,
-1.444175, 1.09625, -0.8982058, 1, 0.4156863, 0, 1,
-1.439344, 0.665995, -1.490358, 1, 0.4196078, 0, 1,
-1.436538, -0.43989, -2.706964, 1, 0.427451, 0, 1,
-1.435537, -2.399737, -0.7700372, 1, 0.4313726, 0, 1,
-1.434173, -0.4929291, -2.420107, 1, 0.4392157, 0, 1,
-1.416207, -1.05626, -3.07876, 1, 0.4431373, 0, 1,
-1.380722, 1.231134, -0.8279334, 1, 0.4509804, 0, 1,
-1.37598, -0.03417182, -1.549963, 1, 0.454902, 0, 1,
-1.3707, -0.5793263, -2.284404, 1, 0.4627451, 0, 1,
-1.362791, 0.6968087, -1.567395, 1, 0.4666667, 0, 1,
-1.345932, 1.00086, -0.7056523, 1, 0.4745098, 0, 1,
-1.33942, -0.1516579, -1.580528, 1, 0.4784314, 0, 1,
-1.338617, 0.6254926, -0.3695915, 1, 0.4862745, 0, 1,
-1.337301, -0.01333903, -0.4940213, 1, 0.4901961, 0, 1,
-1.320891, -0.1605807, -1.293319, 1, 0.4980392, 0, 1,
-1.319495, -0.632419, -2.643162, 1, 0.5058824, 0, 1,
-1.314311, -1.162613, -3.428655, 1, 0.509804, 0, 1,
-1.312044, 0.1860876, -1.464126, 1, 0.5176471, 0, 1,
-1.305014, -0.3636506, -2.798028, 1, 0.5215687, 0, 1,
-1.30043, -0.5042486, -2.55635, 1, 0.5294118, 0, 1,
-1.291462, -1.906321, -2.967934, 1, 0.5333334, 0, 1,
-1.274978, 0.7952313, -1.409595, 1, 0.5411765, 0, 1,
-1.27205, 0.4575396, 1.274738, 1, 0.5450981, 0, 1,
-1.262922, 0.3571087, -0.8356383, 1, 0.5529412, 0, 1,
-1.257566, 0.6697857, -0.4578579, 1, 0.5568628, 0, 1,
-1.254759, -1.1367, -2.661084, 1, 0.5647059, 0, 1,
-1.243883, -1.50991, -3.471283, 1, 0.5686275, 0, 1,
-1.240703, -0.003738032, -1.018835, 1, 0.5764706, 0, 1,
-1.239787, -1.177529, -1.770671, 1, 0.5803922, 0, 1,
-1.236723, 0.6240864, -1.691516, 1, 0.5882353, 0, 1,
-1.235934, -0.3475833, -2.464631, 1, 0.5921569, 0, 1,
-1.228659, 2.693157, -2.259488, 1, 0.6, 0, 1,
-1.226978, 0.5785379, -0.561849, 1, 0.6078432, 0, 1,
-1.219743, 1.104182, 0.7959195, 1, 0.6117647, 0, 1,
-1.219269, -0.1226131, -2.2162, 1, 0.6196079, 0, 1,
-1.210334, 0.2607378, -0.9629665, 1, 0.6235294, 0, 1,
-1.204335, 1.143162, -2.409508, 1, 0.6313726, 0, 1,
-1.197036, 0.6683972, -0.3793961, 1, 0.6352941, 0, 1,
-1.196659, 1.516046, 0.4065268, 1, 0.6431373, 0, 1,
-1.196291, 0.2546574, 0.6818908, 1, 0.6470588, 0, 1,
-1.196002, -0.6195993, -2.271875, 1, 0.654902, 0, 1,
-1.193979, 0.4202095, -3.853558, 1, 0.6588235, 0, 1,
-1.192336, -0.7130153, -0.9546463, 1, 0.6666667, 0, 1,
-1.181548, 1.232196, -1.460449, 1, 0.6705883, 0, 1,
-1.173559, -1.064771, -3.873619, 1, 0.6784314, 0, 1,
-1.173141, -1.959764, -2.368222, 1, 0.682353, 0, 1,
-1.170451, 0.5950684, -1.683592, 1, 0.6901961, 0, 1,
-1.169928, 1.256329, -2.985093, 1, 0.6941177, 0, 1,
-1.166787, 0.2348203, -0.9688239, 1, 0.7019608, 0, 1,
-1.164433, 0.3806906, -0.6121234, 1, 0.7098039, 0, 1,
-1.162674, 0.8393485, -0.9951227, 1, 0.7137255, 0, 1,
-1.159598, 1.22189, -0.5675822, 1, 0.7215686, 0, 1,
-1.153071, 1.17147, 0.8045723, 1, 0.7254902, 0, 1,
-1.149844, -0.5975093, -1.026264, 1, 0.7333333, 0, 1,
-1.142392, -0.646244, -2.203763, 1, 0.7372549, 0, 1,
-1.137393, -0.6753456, -2.376373, 1, 0.7450981, 0, 1,
-1.128472, -0.4586705, -1.307277, 1, 0.7490196, 0, 1,
-1.127615, -0.2093469, -0.4320282, 1, 0.7568628, 0, 1,
-1.12625, 0.2557848, -0.8887286, 1, 0.7607843, 0, 1,
-1.120438, 0.09731369, -2.187023, 1, 0.7686275, 0, 1,
-1.120149, 0.04123601, -1.827606, 1, 0.772549, 0, 1,
-1.114871, 1.186479, 0.005597274, 1, 0.7803922, 0, 1,
-1.105102, 1.596956, -1.371304, 1, 0.7843137, 0, 1,
-1.10198, -1.31998, -4.633375, 1, 0.7921569, 0, 1,
-1.095473, 1.567084, -0.1921816, 1, 0.7960784, 0, 1,
-1.084384, 0.546268, -0.8816068, 1, 0.8039216, 0, 1,
-1.082906, 0.1203889, 0.009093489, 1, 0.8117647, 0, 1,
-1.076366, 0.6934269, -0.2202293, 1, 0.8156863, 0, 1,
-1.076028, -2.076267, -1.788816, 1, 0.8235294, 0, 1,
-1.06152, 0.4052416, -1.852061, 1, 0.827451, 0, 1,
-1.060353, -1.847165, -3.855484, 1, 0.8352941, 0, 1,
-1.050057, 1.465944, -1.857334, 1, 0.8392157, 0, 1,
-1.047818, 1.50538, -0.7039344, 1, 0.8470588, 0, 1,
-1.045609, -0.3332665, -0.888235, 1, 0.8509804, 0, 1,
-1.041971, -0.2924474, -1.522961, 1, 0.8588235, 0, 1,
-1.036676, -0.4871593, -1.001545, 1, 0.8627451, 0, 1,
-1.026394, 0.8505093, -0.3479284, 1, 0.8705882, 0, 1,
-1.021663, 1.233762, -0.2552488, 1, 0.8745098, 0, 1,
-1.018214, -1.355938, -0.4894968, 1, 0.8823529, 0, 1,
-1.017441, 0.4982237, -0.9641824, 1, 0.8862745, 0, 1,
-1.012677, 0.09052914, -0.8490778, 1, 0.8941177, 0, 1,
-0.9982516, -0.7014601, -1.867238, 1, 0.8980392, 0, 1,
-0.995143, -0.1020268, -1.153313, 1, 0.9058824, 0, 1,
-0.9891086, -0.4915005, -2.494154, 1, 0.9137255, 0, 1,
-0.9808686, 0.3109038, 0.4926113, 1, 0.9176471, 0, 1,
-0.975624, 1.149973, -0.04836812, 1, 0.9254902, 0, 1,
-0.9687976, 0.6654658, -0.7246141, 1, 0.9294118, 0, 1,
-0.963829, -1.545098, -2.117726, 1, 0.9372549, 0, 1,
-0.9633735, -0.1422998, -1.161049, 1, 0.9411765, 0, 1,
-0.9560977, -0.5837329, -1.523228, 1, 0.9490196, 0, 1,
-0.9548984, -0.1184011, -1.071688, 1, 0.9529412, 0, 1,
-0.9538674, 1.552282, -0.455743, 1, 0.9607843, 0, 1,
-0.9534323, -0.2205064, -1.721822, 1, 0.9647059, 0, 1,
-0.9523232, -0.3724854, -1.734871, 1, 0.972549, 0, 1,
-0.9491094, -1.221541, -1.559568, 1, 0.9764706, 0, 1,
-0.9485545, -1.55068, -2.531401, 1, 0.9843137, 0, 1,
-0.9431537, -1.194355, -2.68068, 1, 0.9882353, 0, 1,
-0.9429524, 0.4438485, -1.907398, 1, 0.9960784, 0, 1,
-0.9418067, 0.6427253, -1.247484, 0.9960784, 1, 0, 1,
-0.937518, -1.467952, -1.982293, 0.9921569, 1, 0, 1,
-0.9357576, 1.703737, -1.142787, 0.9843137, 1, 0, 1,
-0.9278148, 0.2668058, -0.3883824, 0.9803922, 1, 0, 1,
-0.9262943, -0.8983532, -0.8391369, 0.972549, 1, 0, 1,
-0.9261496, 1.062153, -1.137366, 0.9686275, 1, 0, 1,
-0.9238806, 1.377605, -0.1515958, 0.9607843, 1, 0, 1,
-0.9230959, 0.5341802, -1.787531, 0.9568627, 1, 0, 1,
-0.9152371, -0.1031204, -2.729613, 0.9490196, 1, 0, 1,
-0.9127547, -0.1828048, -3.939172, 0.945098, 1, 0, 1,
-0.9119126, 0.4750892, -1.388796, 0.9372549, 1, 0, 1,
-0.9095994, -0.5455605, -1.891144, 0.9333333, 1, 0, 1,
-0.9051018, 0.6432905, 0.7073333, 0.9254902, 1, 0, 1,
-0.9024128, 0.6026785, -1.188295, 0.9215686, 1, 0, 1,
-0.8940127, -0.4761831, -2.02178, 0.9137255, 1, 0, 1,
-0.8939355, 0.1673874, -0.3152156, 0.9098039, 1, 0, 1,
-0.8926979, -0.1141731, -2.022535, 0.9019608, 1, 0, 1,
-0.8925458, 1.711403, -1.668269, 0.8941177, 1, 0, 1,
-0.888473, 0.2652622, -2.331568, 0.8901961, 1, 0, 1,
-0.8874297, -3.193038, -2.504194, 0.8823529, 1, 0, 1,
-0.8794466, 1.401458, -2.212066, 0.8784314, 1, 0, 1,
-0.8784168, 0.06101836, 0.1968841, 0.8705882, 1, 0, 1,
-0.8778276, 0.7435741, -1.077902, 0.8666667, 1, 0, 1,
-0.8741406, -2.388339, -3.032735, 0.8588235, 1, 0, 1,
-0.8659613, -0.5896906, -1.517506, 0.854902, 1, 0, 1,
-0.8614478, -0.7101477, -2.119996, 0.8470588, 1, 0, 1,
-0.8482656, 0.870631, -0.2853979, 0.8431373, 1, 0, 1,
-0.8435993, -0.8937289, -3.028016, 0.8352941, 1, 0, 1,
-0.8430736, 0.7026943, -0.04308985, 0.8313726, 1, 0, 1,
-0.8362301, -1.023242, -1.967345, 0.8235294, 1, 0, 1,
-0.8240267, 0.4444126, -0.9189746, 0.8196079, 1, 0, 1,
-0.8237215, -0.02429511, -0.6704299, 0.8117647, 1, 0, 1,
-0.8196121, -0.4095007, -1.733861, 0.8078431, 1, 0, 1,
-0.8173172, -0.6393638, -2.379317, 0.8, 1, 0, 1,
-0.8125983, -0.06838918, -1.598133, 0.7921569, 1, 0, 1,
-0.8081881, 0.2011142, -1.038616, 0.7882353, 1, 0, 1,
-0.8064598, 0.6880992, -1.464501, 0.7803922, 1, 0, 1,
-0.8026566, 0.6611245, 0.4993971, 0.7764706, 1, 0, 1,
-0.7982123, -0.1030515, 0.007438256, 0.7686275, 1, 0, 1,
-0.7948838, -0.444262, -1.698534, 0.7647059, 1, 0, 1,
-0.7944943, -1.947895, -3.211488, 0.7568628, 1, 0, 1,
-0.7863586, -0.2960917, -2.271769, 0.7529412, 1, 0, 1,
-0.7845865, 1.059649, -0.3937324, 0.7450981, 1, 0, 1,
-0.7795792, -2.140045, -3.352594, 0.7411765, 1, 0, 1,
-0.7769015, 2.623095, -0.6933293, 0.7333333, 1, 0, 1,
-0.7764552, -0.6405675, -1.098579, 0.7294118, 1, 0, 1,
-0.7732315, -1.396189, -2.645173, 0.7215686, 1, 0, 1,
-0.7664454, 0.8719363, -0.127539, 0.7176471, 1, 0, 1,
-0.7633462, -0.5530728, -3.242743, 0.7098039, 1, 0, 1,
-0.7610221, 0.2042271, 1.497113, 0.7058824, 1, 0, 1,
-0.751249, 0.03942483, -0.4549585, 0.6980392, 1, 0, 1,
-0.7428671, 0.6993414, -0.7429941, 0.6901961, 1, 0, 1,
-0.7424772, -0.6716493, -2.837052, 0.6862745, 1, 0, 1,
-0.7373747, -0.005717926, -0.6925887, 0.6784314, 1, 0, 1,
-0.733, 1.348839, -0.4980905, 0.6745098, 1, 0, 1,
-0.7316241, -0.2213975, -1.203201, 0.6666667, 1, 0, 1,
-0.7269461, -1.42033, -1.688005, 0.6627451, 1, 0, 1,
-0.719353, -0.6464223, -3.489702, 0.654902, 1, 0, 1,
-0.7146543, -0.7770543, -1.353927, 0.6509804, 1, 0, 1,
-0.7143606, 1.668692, -2.056645, 0.6431373, 1, 0, 1,
-0.707374, -0.5225596, -2.983075, 0.6392157, 1, 0, 1,
-0.7046124, 0.9947397, -2.083224, 0.6313726, 1, 0, 1,
-0.7041774, -0.1346542, -0.7630261, 0.627451, 1, 0, 1,
-0.6953515, 0.5924666, 0.2899351, 0.6196079, 1, 0, 1,
-0.694765, 0.5649773, 0.04918003, 0.6156863, 1, 0, 1,
-0.6914642, 0.3351722, -2.305261, 0.6078432, 1, 0, 1,
-0.6905068, 1.098362, 0.3288268, 0.6039216, 1, 0, 1,
-0.6903392, 0.3135161, -1.920853, 0.5960785, 1, 0, 1,
-0.6864668, 0.1182348, -0.6315765, 0.5882353, 1, 0, 1,
-0.6855221, -0.3584047, 0.1347757, 0.5843138, 1, 0, 1,
-0.685095, 0.1431806, -2.105305, 0.5764706, 1, 0, 1,
-0.6834121, 0.6478847, -0.273679, 0.572549, 1, 0, 1,
-0.6773701, 0.8235279, -2.324269, 0.5647059, 1, 0, 1,
-0.6773698, 1.868566, -0.1120107, 0.5607843, 1, 0, 1,
-0.6707491, -1.050998, -4.169971, 0.5529412, 1, 0, 1,
-0.668234, 0.802018, 0.3280797, 0.5490196, 1, 0, 1,
-0.6660294, -0.3103704, -2.81352, 0.5411765, 1, 0, 1,
-0.6627555, -0.5209993, -2.672737, 0.5372549, 1, 0, 1,
-0.6612608, 0.840737, -0.6337901, 0.5294118, 1, 0, 1,
-0.6557054, 0.5374607, -1.423218, 0.5254902, 1, 0, 1,
-0.6497336, -1.107056, -1.753351, 0.5176471, 1, 0, 1,
-0.6475767, 1.012171, -1.488573, 0.5137255, 1, 0, 1,
-0.6466377, -0.5049071, -2.101129, 0.5058824, 1, 0, 1,
-0.6465445, -1.362787, -3.150789, 0.5019608, 1, 0, 1,
-0.6457285, 1.77111, -0.6618851, 0.4941176, 1, 0, 1,
-0.6371984, 1.476487, -1.22467, 0.4862745, 1, 0, 1,
-0.6341399, 1.202705, -0.2902209, 0.4823529, 1, 0, 1,
-0.6304638, -1.258174, -3.641497, 0.4745098, 1, 0, 1,
-0.6287628, 0.0594556, -2.484055, 0.4705882, 1, 0, 1,
-0.621882, 0.5482101, 0.001107144, 0.4627451, 1, 0, 1,
-0.6201164, -0.1634225, 0.3545645, 0.4588235, 1, 0, 1,
-0.6192507, 0.6146115, -2.793109, 0.4509804, 1, 0, 1,
-0.6166521, 0.2828342, -0.3000481, 0.4470588, 1, 0, 1,
-0.6081987, -1.28191, -3.945194, 0.4392157, 1, 0, 1,
-0.6035542, 0.3630444, -0.784807, 0.4352941, 1, 0, 1,
-0.6024517, 0.4288116, 0.1960933, 0.427451, 1, 0, 1,
-0.5997168, 0.6119318, -1.002509, 0.4235294, 1, 0, 1,
-0.5934263, -0.1401785, -0.7521833, 0.4156863, 1, 0, 1,
-0.5924126, 1.218573, -0.5747008, 0.4117647, 1, 0, 1,
-0.5923859, -0.9696661, -1.710312, 0.4039216, 1, 0, 1,
-0.5920895, 1.94507, -0.6342291, 0.3960784, 1, 0, 1,
-0.5911268, -1.354964, -1.090932, 0.3921569, 1, 0, 1,
-0.5902485, 0.8308608, 1.576716, 0.3843137, 1, 0, 1,
-0.5889652, 0.4402101, -3.012296, 0.3803922, 1, 0, 1,
-0.5884787, -0.4911529, -0.8934284, 0.372549, 1, 0, 1,
-0.5870625, -2.052133, -3.13716, 0.3686275, 1, 0, 1,
-0.5867074, 0.06877307, -2.617955, 0.3607843, 1, 0, 1,
-0.5855289, 0.8758873, 0.06001344, 0.3568628, 1, 0, 1,
-0.5742761, -1.607988, -3.644836, 0.3490196, 1, 0, 1,
-0.5696834, 1.046893, -1.37105, 0.345098, 1, 0, 1,
-0.5683707, -0.6051261, -3.293848, 0.3372549, 1, 0, 1,
-0.566628, 0.380642, -2.431398, 0.3333333, 1, 0, 1,
-0.5663739, -0.4417397, -2.983178, 0.3254902, 1, 0, 1,
-0.5652676, 1.54836, -0.2198945, 0.3215686, 1, 0, 1,
-0.5643876, -2.371484, -4.858218, 0.3137255, 1, 0, 1,
-0.5623311, 0.02791605, -2.625182, 0.3098039, 1, 0, 1,
-0.5548262, -0.7772987, -2.518585, 0.3019608, 1, 0, 1,
-0.5514324, -1.207949, -2.492202, 0.2941177, 1, 0, 1,
-0.5461158, 0.132273, -0.9257833, 0.2901961, 1, 0, 1,
-0.542533, -0.5027049, -4.011927, 0.282353, 1, 0, 1,
-0.5399927, 0.8568238, 0.6812629, 0.2784314, 1, 0, 1,
-0.5360582, 1.041651, -0.5893228, 0.2705882, 1, 0, 1,
-0.5349182, 0.6076007, 0.6665069, 0.2666667, 1, 0, 1,
-0.5282589, -0.9882281, -3.660735, 0.2588235, 1, 0, 1,
-0.5235769, 0.9624733, -0.4037355, 0.254902, 1, 0, 1,
-0.5199912, -0.4487723, -1.59901, 0.2470588, 1, 0, 1,
-0.515786, -1.669556, -3.289179, 0.2431373, 1, 0, 1,
-0.5150799, -0.3086668, -1.473997, 0.2352941, 1, 0, 1,
-0.5106106, -1.642113, -1.476466, 0.2313726, 1, 0, 1,
-0.5076733, -0.1012334, -0.9555966, 0.2235294, 1, 0, 1,
-0.5071486, -1.193887, -0.7612858, 0.2196078, 1, 0, 1,
-0.5011197, -0.8157915, -4.950649, 0.2117647, 1, 0, 1,
-0.5006658, 0.9745628, -0.9057686, 0.2078431, 1, 0, 1,
-0.4986408, -0.7914084, -2.475145, 0.2, 1, 0, 1,
-0.4961118, -0.6488349, -3.421803, 0.1921569, 1, 0, 1,
-0.4951017, -1.137108, -3.780671, 0.1882353, 1, 0, 1,
-0.4949198, 1.846933, 1.638217, 0.1803922, 1, 0, 1,
-0.4934471, -0.008077201, -0.7953949, 0.1764706, 1, 0, 1,
-0.4920016, 2.130266, -1.977365, 0.1686275, 1, 0, 1,
-0.4893306, -0.5277672, -4.525192, 0.1647059, 1, 0, 1,
-0.4847801, -1.297118, -2.398667, 0.1568628, 1, 0, 1,
-0.4843613, -0.2698016, -1.41698, 0.1529412, 1, 0, 1,
-0.4804972, -0.5744742, -3.101085, 0.145098, 1, 0, 1,
-0.4786746, -0.6042907, -2.006617, 0.1411765, 1, 0, 1,
-0.4778703, 1.103964, 1.407149, 0.1333333, 1, 0, 1,
-0.4762328, 1.023473, -0.7997707, 0.1294118, 1, 0, 1,
-0.4720542, -1.382452, -3.037074, 0.1215686, 1, 0, 1,
-0.4702278, -0.660096, -2.139381, 0.1176471, 1, 0, 1,
-0.4698895, -1.007489, -1.723171, 0.1098039, 1, 0, 1,
-0.4625235, -2.414528, -3.625225, 0.1058824, 1, 0, 1,
-0.4618445, 0.4129995, -2.304125, 0.09803922, 1, 0, 1,
-0.4603712, -0.7444613, -3.022165, 0.09019608, 1, 0, 1,
-0.4589321, -0.2140244, -2.92864, 0.08627451, 1, 0, 1,
-0.4588459, -1.212385, -1.430879, 0.07843138, 1, 0, 1,
-0.4570538, -0.3083417, -2.569682, 0.07450981, 1, 0, 1,
-0.45654, 0.2171917, -1.318444, 0.06666667, 1, 0, 1,
-0.4553101, 0.6571481, -0.3134057, 0.0627451, 1, 0, 1,
-0.4533536, -0.1497329, -2.414233, 0.05490196, 1, 0, 1,
-0.4523071, 0.8353477, -1.622478, 0.05098039, 1, 0, 1,
-0.4522639, 1.251713, 0.5334935, 0.04313726, 1, 0, 1,
-0.4441072, -0.7000396, -3.099982, 0.03921569, 1, 0, 1,
-0.4440264, 1.026307, -1.047111, 0.03137255, 1, 0, 1,
-0.4391021, 0.2268557, -2.067063, 0.02745098, 1, 0, 1,
-0.4386195, 0.6269435, -0.5402087, 0.01960784, 1, 0, 1,
-0.4370472, -1.031314, -3.924329, 0.01568628, 1, 0, 1,
-0.4365032, 0.9304619, -1.607293, 0.007843138, 1, 0, 1,
-0.4273192, 0.6975214, -1.185925, 0.003921569, 1, 0, 1,
-0.4248963, -1.068452, -1.823251, 0, 1, 0.003921569, 1,
-0.4214749, 0.5202549, -2.458543, 0, 1, 0.01176471, 1,
-0.4161574, 0.1484145, -1.670397, 0, 1, 0.01568628, 1,
-0.413773, -0.002375454, -1.115059, 0, 1, 0.02352941, 1,
-0.4099725, -1.808102, -2.483001, 0, 1, 0.02745098, 1,
-0.4091062, -1.788992, -2.357112, 0, 1, 0.03529412, 1,
-0.4083671, -0.2628553, -2.978147, 0, 1, 0.03921569, 1,
-0.407372, -0.6358457, -0.9071317, 0, 1, 0.04705882, 1,
-0.4071758, -0.5854876, -1.874034, 0, 1, 0.05098039, 1,
-0.4045524, -1.214563, -3.781643, 0, 1, 0.05882353, 1,
-0.4024958, -0.3457302, -0.9481224, 0, 1, 0.0627451, 1,
-0.4012453, 0.6321958, 0.6094828, 0, 1, 0.07058824, 1,
-0.4010485, -0.3484209, -1.369233, 0, 1, 0.07450981, 1,
-0.4009661, 1.290564, 0.427791, 0, 1, 0.08235294, 1,
-0.4000344, -0.5555639, -2.829432, 0, 1, 0.08627451, 1,
-0.3986549, 1.494129, -0.3627129, 0, 1, 0.09411765, 1,
-0.3971426, 1.476569, 1.86447, 0, 1, 0.1019608, 1,
-0.3966922, -0.8948686, -1.495922, 0, 1, 0.1058824, 1,
-0.3955711, 1.325573, -0.7317295, 0, 1, 0.1137255, 1,
-0.3888434, 1.0729, -1.130713, 0, 1, 0.1176471, 1,
-0.3875819, -1.10333, -3.649421, 0, 1, 0.1254902, 1,
-0.3867839, 1.115145, 1.176533, 0, 1, 0.1294118, 1,
-0.3817304, -0.3819836, -0.8966967, 0, 1, 0.1372549, 1,
-0.3814479, 0.2347557, -0.6736162, 0, 1, 0.1411765, 1,
-0.3777699, -0.5596845, -2.025705, 0, 1, 0.1490196, 1,
-0.3775506, 0.03380387, -1.974818, 0, 1, 0.1529412, 1,
-0.3770466, -0.9467539, -2.834531, 0, 1, 0.1607843, 1,
-0.3732029, -1.171741, -2.013345, 0, 1, 0.1647059, 1,
-0.3586397, -1.855345, -2.09124, 0, 1, 0.172549, 1,
-0.3582254, 1.156722, -1.22504, 0, 1, 0.1764706, 1,
-0.3569307, 1.519526, -1.641776, 0, 1, 0.1843137, 1,
-0.3560799, -1.054455, -3.154361, 0, 1, 0.1882353, 1,
-0.3527246, 0.3297423, -0.2678098, 0, 1, 0.1960784, 1,
-0.3495947, -0.3368409, -4.043459, 0, 1, 0.2039216, 1,
-0.3472458, -1.303713, -3.219234, 0, 1, 0.2078431, 1,
-0.3448191, 0.6255128, 1.401795, 0, 1, 0.2156863, 1,
-0.3399954, 2.159767, -1.184069, 0, 1, 0.2196078, 1,
-0.3315476, 0.467923, 0.3293478, 0, 1, 0.227451, 1,
-0.3300216, 0.1792194, -0.3767603, 0, 1, 0.2313726, 1,
-0.3296622, 0.0429085, -1.377076, 0, 1, 0.2392157, 1,
-0.3228315, -0.536779, -2.090616, 0, 1, 0.2431373, 1,
-0.3157797, -1.604902, -3.497187, 0, 1, 0.2509804, 1,
-0.3121436, -2.357163, -2.431333, 0, 1, 0.254902, 1,
-0.3114157, 0.2806928, -1.305995, 0, 1, 0.2627451, 1,
-0.3067977, -1.673253, -2.471442, 0, 1, 0.2666667, 1,
-0.3065082, 1.322972, 1.620115, 0, 1, 0.2745098, 1,
-0.305433, -0.2798298, -4.196056, 0, 1, 0.2784314, 1,
-0.2979001, 1.187606, -1.773461, 0, 1, 0.2862745, 1,
-0.2929674, -0.7916904, -3.326617, 0, 1, 0.2901961, 1,
-0.2906364, -0.5686123, -4.015305, 0, 1, 0.2980392, 1,
-0.286316, 0.06970441, -1.293357, 0, 1, 0.3058824, 1,
-0.2848769, 1.24095, 0.3709844, 0, 1, 0.3098039, 1,
-0.2840942, 0.6836812, -0.2789644, 0, 1, 0.3176471, 1,
-0.2725899, -0.7622263, -2.84112, 0, 1, 0.3215686, 1,
-0.2720816, 0.5240912, 0.02351138, 0, 1, 0.3294118, 1,
-0.2719564, 0.3900308, -1.029495, 0, 1, 0.3333333, 1,
-0.2672623, -2.225524, -1.974575, 0, 1, 0.3411765, 1,
-0.2669671, -2.303439, -1.929666, 0, 1, 0.345098, 1,
-0.2665312, -0.7946301, -3.654952, 0, 1, 0.3529412, 1,
-0.2637708, 1.325647, -0.3865583, 0, 1, 0.3568628, 1,
-0.2633651, 1.816203, 0.7752154, 0, 1, 0.3647059, 1,
-0.257451, 0.9738913, -0.5491534, 0, 1, 0.3686275, 1,
-0.253449, -2.557592, -4.251933, 0, 1, 0.3764706, 1,
-0.2502054, 0.4282543, -1.115451, 0, 1, 0.3803922, 1,
-0.2476079, -0.2680396, -4.218005, 0, 1, 0.3882353, 1,
-0.2457663, -0.1415556, -1.572801, 0, 1, 0.3921569, 1,
-0.2415743, 0.1957032, -0.2646981, 0, 1, 0.4, 1,
-0.2408169, 1.109566, -1.6287, 0, 1, 0.4078431, 1,
-0.2400197, 0.1055896, -2.892372, 0, 1, 0.4117647, 1,
-0.2392151, 2.112279, -1.753469, 0, 1, 0.4196078, 1,
-0.2383491, -2.601989, -5.335468, 0, 1, 0.4235294, 1,
-0.2321233, 0.4416586, -0.7542273, 0, 1, 0.4313726, 1,
-0.2319448, 0.06465257, -1.652906, 0, 1, 0.4352941, 1,
-0.2282343, 1.015237, 0.1018688, 0, 1, 0.4431373, 1,
-0.227674, -1.272465, -1.239451, 0, 1, 0.4470588, 1,
-0.2238413, 1.864577, 0.4688473, 0, 1, 0.454902, 1,
-0.2197659, 0.6961458, -0.6924958, 0, 1, 0.4588235, 1,
-0.217169, 0.34045, 1.029735, 0, 1, 0.4666667, 1,
-0.2128794, -0.6986905, -0.9453433, 0, 1, 0.4705882, 1,
-0.2067042, -1.428221, -1.914441, 0, 1, 0.4784314, 1,
-0.2065176, 0.1146438, -1.974063, 0, 1, 0.4823529, 1,
-0.206391, -0.0449366, -0.2328815, 0, 1, 0.4901961, 1,
-0.2061457, 0.1905496, -0.349749, 0, 1, 0.4941176, 1,
-0.2057125, 0.9773372, 1.077298, 0, 1, 0.5019608, 1,
-0.2046367, -0.3043006, -1.933521, 0, 1, 0.509804, 1,
-0.1984553, 0.01956595, -1.122725, 0, 1, 0.5137255, 1,
-0.1950729, 1.791785, 1.01003, 0, 1, 0.5215687, 1,
-0.1918766, -0.1307745, -2.395934, 0, 1, 0.5254902, 1,
-0.1918713, 0.2763576, -1.422334, 0, 1, 0.5333334, 1,
-0.1905867, -0.8294761, -1.940195, 0, 1, 0.5372549, 1,
-0.1893085, 0.1197506, -1.943416, 0, 1, 0.5450981, 1,
-0.1812083, -1.035228, -3.714069, 0, 1, 0.5490196, 1,
-0.1788515, -1.452566, -2.509376, 0, 1, 0.5568628, 1,
-0.1785519, -0.5768372, -3.9174, 0, 1, 0.5607843, 1,
-0.1777689, -1.183722, -2.327611, 0, 1, 0.5686275, 1,
-0.176897, -0.005476043, -2.226563, 0, 1, 0.572549, 1,
-0.1741978, 0.7746952, -1.522811, 0, 1, 0.5803922, 1,
-0.1729457, 0.157135, -0.1234033, 0, 1, 0.5843138, 1,
-0.1719158, 1.534308, 0.4284295, 0, 1, 0.5921569, 1,
-0.17031, 0.9006958, 0.5924118, 0, 1, 0.5960785, 1,
-0.1682772, 1.222338, 0.4896744, 0, 1, 0.6039216, 1,
-0.1636755, -0.1479254, -2.500561, 0, 1, 0.6117647, 1,
-0.1594665, -0.2899045, -2.621684, 0, 1, 0.6156863, 1,
-0.1582314, -0.01995584, -0.3433774, 0, 1, 0.6235294, 1,
-0.1580282, -0.1304518, -1.773769, 0, 1, 0.627451, 1,
-0.1578073, 1.835648, 0.4818401, 0, 1, 0.6352941, 1,
-0.1577742, 0.8354879, 0.3341043, 0, 1, 0.6392157, 1,
-0.156872, -1.769617, -3.072757, 0, 1, 0.6470588, 1,
-0.1562625, -1.487576, -0.8387336, 0, 1, 0.6509804, 1,
-0.1551366, -0.9804918, -0.8406957, 0, 1, 0.6588235, 1,
-0.155027, 1.357275, -0.3886878, 0, 1, 0.6627451, 1,
-0.1548659, -0.3311121, -2.11184, 0, 1, 0.6705883, 1,
-0.1532373, 2.273363, -0.7598512, 0, 1, 0.6745098, 1,
-0.1515543, -0.4998011, -1.031191, 0, 1, 0.682353, 1,
-0.1512532, 0.4680227, 0.2920255, 0, 1, 0.6862745, 1,
-0.1480863, -1.125453, -4.143798, 0, 1, 0.6941177, 1,
-0.1458582, 2.242999, 0.4066731, 0, 1, 0.7019608, 1,
-0.1434685, 0.4978656, 0.006395753, 0, 1, 0.7058824, 1,
-0.1346889, -0.8182225, -1.898502, 0, 1, 0.7137255, 1,
-0.1333395, -0.4360242, -1.83302, 0, 1, 0.7176471, 1,
-0.1296985, 0.5039161, 0.2248754, 0, 1, 0.7254902, 1,
-0.1295135, -0.5637161, -2.800949, 0, 1, 0.7294118, 1,
-0.1291821, -0.3730126, -1.448749, 0, 1, 0.7372549, 1,
-0.1277301, 0.2256091, -0.580256, 0, 1, 0.7411765, 1,
-0.1274451, -0.51696, -4.088863, 0, 1, 0.7490196, 1,
-0.1221719, -1.179964, -2.611912, 0, 1, 0.7529412, 1,
-0.1190822, 1.142226, -0.02707254, 0, 1, 0.7607843, 1,
-0.1162062, -0.510869, -4.443978, 0, 1, 0.7647059, 1,
-0.1127088, 0.1242216, -1.433178, 0, 1, 0.772549, 1,
-0.1121157, -0.2340612, -2.253838, 0, 1, 0.7764706, 1,
-0.1108509, -1.154124, -2.70575, 0, 1, 0.7843137, 1,
-0.1079228, 1.059589, 1.351801, 0, 1, 0.7882353, 1,
-0.1044714, -0.5070804, -3.523191, 0, 1, 0.7960784, 1,
-0.1034994, 1.697392, 1.395468, 0, 1, 0.8039216, 1,
-0.1032677, -1.192793, -5.663351, 0, 1, 0.8078431, 1,
-0.09918025, -1.88231, -4.84224, 0, 1, 0.8156863, 1,
-0.09601926, -0.5384339, -2.96914, 0, 1, 0.8196079, 1,
-0.09276443, 0.8616489, -2.855057, 0, 1, 0.827451, 1,
-0.09157866, 0.8505885, 1.068972, 0, 1, 0.8313726, 1,
-0.08887891, -0.4234364, -1.706467, 0, 1, 0.8392157, 1,
-0.08802459, -1.310362, -3.869968, 0, 1, 0.8431373, 1,
-0.08596117, 0.4059066, 0.3310086, 0, 1, 0.8509804, 1,
-0.08517446, -0.9673789, -2.419399, 0, 1, 0.854902, 1,
-0.08349855, 0.7540948, -1.599993, 0, 1, 0.8627451, 1,
-0.08114793, -0.5348559, -4.501592, 0, 1, 0.8666667, 1,
-0.08057363, -1.614988, -3.285297, 0, 1, 0.8745098, 1,
-0.0785847, 0.5150427, -1.352766, 0, 1, 0.8784314, 1,
-0.07661743, -1.482164, -4.923029, 0, 1, 0.8862745, 1,
-0.07644199, -0.2724323, -4.328754, 0, 1, 0.8901961, 1,
-0.07189596, 0.2285902, -1.711613, 0, 1, 0.8980392, 1,
-0.07165451, 0.1633233, -1.107271, 0, 1, 0.9058824, 1,
-0.06890242, 1.922863, -0.9950317, 0, 1, 0.9098039, 1,
-0.06857252, -0.7167355, -2.420478, 0, 1, 0.9176471, 1,
-0.06558766, -1.243035, -3.889371, 0, 1, 0.9215686, 1,
-0.06516358, -0.1571718, -1.747933, 0, 1, 0.9294118, 1,
-0.063663, 0.05990558, -0.7456024, 0, 1, 0.9333333, 1,
-0.06302224, 0.7910932, -0.829643, 0, 1, 0.9411765, 1,
-0.05885215, -1.206553, -4.580847, 0, 1, 0.945098, 1,
-0.05747876, -0.3756512, -3.119563, 0, 1, 0.9529412, 1,
-0.05510266, -0.05438361, -1.884993, 0, 1, 0.9568627, 1,
-0.05292935, -1.239695, -2.271966, 0, 1, 0.9647059, 1,
-0.04843829, -0.390672, -1.370822, 0, 1, 0.9686275, 1,
-0.04746652, -1.736571, -2.937018, 0, 1, 0.9764706, 1,
-0.03747008, 0.2353637, -0.3565207, 0, 1, 0.9803922, 1,
-0.03709809, 1.529376, -0.6232493, 0, 1, 0.9882353, 1,
-0.03449574, -0.4299102, -3.399683, 0, 1, 0.9921569, 1,
-0.03352948, -0.01273156, -3.354009, 0, 1, 1, 1,
-0.02993532, 0.3627903, 0.6098756, 0, 0.9921569, 1, 1,
-0.02929002, -1.103482, -3.082953, 0, 0.9882353, 1, 1,
-0.02701809, -0.2522129, -4.17027, 0, 0.9803922, 1, 1,
-0.021842, 0.6373588, -0.3945859, 0, 0.9764706, 1, 1,
-0.0198308, -1.714545, -3.168715, 0, 0.9686275, 1, 1,
-0.0191796, -0.7391059, -4.396689, 0, 0.9647059, 1, 1,
-0.01772816, 0.7347578, -0.4818926, 0, 0.9568627, 1, 1,
-0.01348696, 2.627461, -0.03496172, 0, 0.9529412, 1, 1,
-0.01144269, 0.7707717, 1.980573, 0, 0.945098, 1, 1,
-0.01136919, -0.4350885, -4.181278, 0, 0.9411765, 1, 1,
0.01055743, 1.495074, -0.05287756, 0, 0.9333333, 1, 1,
0.01121161, -0.2790238, 0.6615937, 0, 0.9294118, 1, 1,
0.01197877, 1.008051, -1.53639, 0, 0.9215686, 1, 1,
0.0123611, -0.07520821, 2.332825, 0, 0.9176471, 1, 1,
0.01503193, 1.292722, 1.007545, 0, 0.9098039, 1, 1,
0.01772498, 0.5058524, 0.2862815, 0, 0.9058824, 1, 1,
0.02794101, 0.4065008, -0.1957267, 0, 0.8980392, 1, 1,
0.02872957, 1.230161, 0.05389869, 0, 0.8901961, 1, 1,
0.02913014, 0.3256128, -2.599689, 0, 0.8862745, 1, 1,
0.02993173, -0.9733614, 1.183239, 0, 0.8784314, 1, 1,
0.03094845, -0.4607252, 3.828699, 0, 0.8745098, 1, 1,
0.03199478, -0.412075, 2.318745, 0, 0.8666667, 1, 1,
0.03300866, 0.6126729, -0.9396942, 0, 0.8627451, 1, 1,
0.03890014, -0.5097759, 1.915441, 0, 0.854902, 1, 1,
0.03917195, 0.911997, 1.754755, 0, 0.8509804, 1, 1,
0.03974149, 1.994594, -1.025899, 0, 0.8431373, 1, 1,
0.04263956, 0.7108508, -1.507301, 0, 0.8392157, 1, 1,
0.04291602, -2.509622, 4.12745, 0, 0.8313726, 1, 1,
0.04319686, 0.1979962, -2.179517, 0, 0.827451, 1, 1,
0.04758449, 0.1735502, 0.4932676, 0, 0.8196079, 1, 1,
0.0489044, -0.4985205, 2.845689, 0, 0.8156863, 1, 1,
0.05082979, -1.149451, 4.064989, 0, 0.8078431, 1, 1,
0.05548325, -0.1544649, 3.499748, 0, 0.8039216, 1, 1,
0.05973418, -1.294518, 5.668929, 0, 0.7960784, 1, 1,
0.06134331, -0.08678282, 1.392798, 0, 0.7882353, 1, 1,
0.06324458, 1.266417, 0.09608427, 0, 0.7843137, 1, 1,
0.06457362, 0.3561617, 0.117634, 0, 0.7764706, 1, 1,
0.0730297, -0.737295, 3.732854, 0, 0.772549, 1, 1,
0.07741143, -0.1210863, 2.438204, 0, 0.7647059, 1, 1,
0.0781294, -1.087294, 1.253253, 0, 0.7607843, 1, 1,
0.08312605, -0.002178759, 2.421446, 0, 0.7529412, 1, 1,
0.08351693, -0.4828799, 1.057959, 0, 0.7490196, 1, 1,
0.08573475, -0.380457, 4.029003, 0, 0.7411765, 1, 1,
0.08701323, 0.9628659, 1.603135, 0, 0.7372549, 1, 1,
0.09181485, -0.2671525, 1.490724, 0, 0.7294118, 1, 1,
0.09283303, 0.9224041, -1.542144, 0, 0.7254902, 1, 1,
0.09362902, -1.306788, 3.14939, 0, 0.7176471, 1, 1,
0.09555152, -2.767354, 3.795019, 0, 0.7137255, 1, 1,
0.09689587, 0.4083105, 0.1077842, 0, 0.7058824, 1, 1,
0.09811008, 0.6593533, 0.7769986, 0, 0.6980392, 1, 1,
0.1031324, -1.888562, 4.565436, 0, 0.6941177, 1, 1,
0.1061388, -0.3454821, 3.356976, 0, 0.6862745, 1, 1,
0.109267, -0.4516051, 3.652398, 0, 0.682353, 1, 1,
0.1097749, 1.087721, 1.044168, 0, 0.6745098, 1, 1,
0.1204606, 1.000266, -0.2748398, 0, 0.6705883, 1, 1,
0.1220803, 1.781204, -0.7662506, 0, 0.6627451, 1, 1,
0.1224547, -0.3926117, 2.639889, 0, 0.6588235, 1, 1,
0.124563, -0.1986853, 1.868224, 0, 0.6509804, 1, 1,
0.1261932, -0.3513645, 3.474185, 0, 0.6470588, 1, 1,
0.1288332, -0.6610419, 1.657413, 0, 0.6392157, 1, 1,
0.1291652, 1.120079, -1.783293, 0, 0.6352941, 1, 1,
0.1346766, 1.377658, 1.739677, 0, 0.627451, 1, 1,
0.1482536, 2.339039, -2.204843, 0, 0.6235294, 1, 1,
0.1491959, 0.09453909, -1.085592, 0, 0.6156863, 1, 1,
0.1492628, 1.486842, -2.288712, 0, 0.6117647, 1, 1,
0.1508683, 0.09095301, 3.058273, 0, 0.6039216, 1, 1,
0.1518597, -0.798481, 3.383377, 0, 0.5960785, 1, 1,
0.1534834, 0.1654933, 0.5001824, 0, 0.5921569, 1, 1,
0.1573789, 0.2628349, 0.6996854, 0, 0.5843138, 1, 1,
0.1602558, -1.971732, 3.962274, 0, 0.5803922, 1, 1,
0.1625555, 1.318174, -0.3417842, 0, 0.572549, 1, 1,
0.1645588, -0.8980111, 3.729164, 0, 0.5686275, 1, 1,
0.1648361, 0.1190791, -0.1175757, 0, 0.5607843, 1, 1,
0.1654295, 0.7643613, -0.8105999, 0, 0.5568628, 1, 1,
0.1673355, 0.7441747, -1.58401, 0, 0.5490196, 1, 1,
0.1706503, 0.4418278, 0.6697624, 0, 0.5450981, 1, 1,
0.1709361, -0.07515875, 1.612199, 0, 0.5372549, 1, 1,
0.1720622, 0.5757357, -0.03774552, 0, 0.5333334, 1, 1,
0.1759579, -0.6041959, 3.812252, 0, 0.5254902, 1, 1,
0.1772186, -0.9438422, 1.679029, 0, 0.5215687, 1, 1,
0.1776845, 0.5019879, 0.7929909, 0, 0.5137255, 1, 1,
0.1783676, -0.738993, 0.6454486, 0, 0.509804, 1, 1,
0.1786051, -2.532657, 2.603694, 0, 0.5019608, 1, 1,
0.182661, -0.3169574, 0.9009743, 0, 0.4941176, 1, 1,
0.1828235, -0.7857455, 1.198567, 0, 0.4901961, 1, 1,
0.1859286, -0.05788402, 1.781796, 0, 0.4823529, 1, 1,
0.1866301, -1.547985, 2.05484, 0, 0.4784314, 1, 1,
0.1880638, 0.8730719, 0.4033154, 0, 0.4705882, 1, 1,
0.1899019, 1.653258, -0.5931466, 0, 0.4666667, 1, 1,
0.1922851, 1.057905, -0.7547053, 0, 0.4588235, 1, 1,
0.1926425, -0.2255041, 2.003781, 0, 0.454902, 1, 1,
0.2044604, -0.2286913, 2.69758, 0, 0.4470588, 1, 1,
0.2069159, 0.3974988, -1.33616, 0, 0.4431373, 1, 1,
0.2073353, 0.08749192, 1.780735, 0, 0.4352941, 1, 1,
0.2175497, 0.0881853, 1.451836, 0, 0.4313726, 1, 1,
0.2193286, 0.2806399, -0.4555452, 0, 0.4235294, 1, 1,
0.2254639, 0.4520613, 1.445407, 0, 0.4196078, 1, 1,
0.2276966, 0.9435428, -1.049819, 0, 0.4117647, 1, 1,
0.2303167, 0.2556911, -1.691143, 0, 0.4078431, 1, 1,
0.2307368, -1.010686, 4.653951, 0, 0.4, 1, 1,
0.2308916, -0.1381743, 1.164684, 0, 0.3921569, 1, 1,
0.2340374, -0.5177938, 2.336797, 0, 0.3882353, 1, 1,
0.2379649, -0.5459352, 0.2379928, 0, 0.3803922, 1, 1,
0.2462061, 0.7443136, 0.7099485, 0, 0.3764706, 1, 1,
0.2520181, 0.2102603, 0.1281721, 0, 0.3686275, 1, 1,
0.25677, 0.8998698, 0.8788175, 0, 0.3647059, 1, 1,
0.2599406, -0.3854557, 1.781222, 0, 0.3568628, 1, 1,
0.2601427, 1.212083, 0.8627549, 0, 0.3529412, 1, 1,
0.2612459, 1.424033, -0.6195384, 0, 0.345098, 1, 1,
0.2727395, 0.8031713, 1.082539, 0, 0.3411765, 1, 1,
0.2738475, -1.320852, 1.240706, 0, 0.3333333, 1, 1,
0.2778163, 1.979929, 0.4236068, 0, 0.3294118, 1, 1,
0.2829561, 1.718872, 1.140674, 0, 0.3215686, 1, 1,
0.2852033, -1.784116, 2.05774, 0, 0.3176471, 1, 1,
0.2856964, -2.076477, 3.93103, 0, 0.3098039, 1, 1,
0.2863592, -0.4384409, 1.973656, 0, 0.3058824, 1, 1,
0.2874226, -1.109806, 1.120614, 0, 0.2980392, 1, 1,
0.2889846, -0.401634, 0.3446167, 0, 0.2901961, 1, 1,
0.298678, 1.549278, 0.4326157, 0, 0.2862745, 1, 1,
0.3015646, 0.3457809, 0.5598615, 0, 0.2784314, 1, 1,
0.3032603, 0.2984587, 0.8860972, 0, 0.2745098, 1, 1,
0.3040038, -0.4226089, 2.945911, 0, 0.2666667, 1, 1,
0.3043742, -0.4390823, 2.709821, 0, 0.2627451, 1, 1,
0.3066007, -0.955401, 1.934636, 0, 0.254902, 1, 1,
0.3086223, -2.201338, 3.078084, 0, 0.2509804, 1, 1,
0.3089736, 0.5466241, 0.7937543, 0, 0.2431373, 1, 1,
0.3118089, -0.2419834, 3.497422, 0, 0.2392157, 1, 1,
0.3142824, -1.060033, 3.476677, 0, 0.2313726, 1, 1,
0.3164532, -0.01367347, 4.005529, 0, 0.227451, 1, 1,
0.3235357, -0.02870729, 1.482071, 0, 0.2196078, 1, 1,
0.3246052, 1.114372, 1.316214, 0, 0.2156863, 1, 1,
0.326387, 0.3280568, 0.07376755, 0, 0.2078431, 1, 1,
0.3268304, 1.600458, -0.8236544, 0, 0.2039216, 1, 1,
0.330583, 0.1402688, 0.2547243, 0, 0.1960784, 1, 1,
0.3311675, -1.696921, 4.602607, 0, 0.1882353, 1, 1,
0.3343014, 0.2691344, 2.817679, 0, 0.1843137, 1, 1,
0.3349895, 1.144859, 0.769146, 0, 0.1764706, 1, 1,
0.3351373, -1.751178, 3.038094, 0, 0.172549, 1, 1,
0.3401732, 2.117146, -0.7589505, 0, 0.1647059, 1, 1,
0.3421648, -1.295816, 2.262148, 0, 0.1607843, 1, 1,
0.3422484, -0.4936626, 2.96331, 0, 0.1529412, 1, 1,
0.3448317, 0.3673343, 1.291025, 0, 0.1490196, 1, 1,
0.3503607, 0.9449304, -0.5782956, 0, 0.1411765, 1, 1,
0.3516264, -0.6932725, 2.5374, 0, 0.1372549, 1, 1,
0.3532854, 1.443074, 1.699921, 0, 0.1294118, 1, 1,
0.3558434, -0.3039169, 1.915391, 0, 0.1254902, 1, 1,
0.3564735, -0.0001524805, 0.2152383, 0, 0.1176471, 1, 1,
0.3588324, 0.4323915, 1.01437, 0, 0.1137255, 1, 1,
0.3593732, -0.6479467, 0.5977963, 0, 0.1058824, 1, 1,
0.3655846, -0.03969406, 1.91222, 0, 0.09803922, 1, 1,
0.3665535, -1.452302, 3.376836, 0, 0.09411765, 1, 1,
0.3683138, 0.9095472, -0.05979856, 0, 0.08627451, 1, 1,
0.3729453, -1.492876, 2.599957, 0, 0.08235294, 1, 1,
0.3735963, -1.032349, 3.20494, 0, 0.07450981, 1, 1,
0.376389, 0.6693391, 1.414444, 0, 0.07058824, 1, 1,
0.377085, -0.3955691, 3.166178, 0, 0.0627451, 1, 1,
0.3772737, 1.884004, 0.4338408, 0, 0.05882353, 1, 1,
0.3775134, -0.6650258, 3.237617, 0, 0.05098039, 1, 1,
0.3801098, 0.7973214, 0.108915, 0, 0.04705882, 1, 1,
0.3802013, 1.01878, -1.216489, 0, 0.03921569, 1, 1,
0.3828318, -0.6309656, 2.410284, 0, 0.03529412, 1, 1,
0.3831958, -0.5296605, 1.1641, 0, 0.02745098, 1, 1,
0.3888379, 0.3418311, 0.5466604, 0, 0.02352941, 1, 1,
0.3904881, 0.9086493, -1.344937, 0, 0.01568628, 1, 1,
0.3909733, 0.7206033, -0.7916597, 0, 0.01176471, 1, 1,
0.3980584, -0.4613622, 2.069578, 0, 0.003921569, 1, 1,
0.3988132, 0.3359542, 0.7180486, 0.003921569, 0, 1, 1,
0.4073296, 0.3434996, 0.7425706, 0.007843138, 0, 1, 1,
0.4078158, 0.2660049, 2.240358, 0.01568628, 0, 1, 1,
0.4102798, -0.3596453, 2.314888, 0.01960784, 0, 1, 1,
0.4161974, -0.4400006, 2.824893, 0.02745098, 0, 1, 1,
0.4164245, -0.3204889, 2.073411, 0.03137255, 0, 1, 1,
0.4171874, -1.023977, 2.55405, 0.03921569, 0, 1, 1,
0.4190685, 0.9936936, -0.4450087, 0.04313726, 0, 1, 1,
0.421416, -0.2434327, 2.275155, 0.05098039, 0, 1, 1,
0.4287792, 0.4884776, 2.504311, 0.05490196, 0, 1, 1,
0.4313082, 1.147558, -0.6521248, 0.0627451, 0, 1, 1,
0.4315578, 1.581208, -0.4998977, 0.06666667, 0, 1, 1,
0.4345093, 0.02049766, 0.9341634, 0.07450981, 0, 1, 1,
0.4360042, 2.667217, 1.212861, 0.07843138, 0, 1, 1,
0.4371792, -1.302154, 3.335951, 0.08627451, 0, 1, 1,
0.445979, 0.7414542, 1.33871, 0.09019608, 0, 1, 1,
0.4477637, -1.331265, 3.787207, 0.09803922, 0, 1, 1,
0.4514681, 1.163285, -0.6271788, 0.1058824, 0, 1, 1,
0.4520027, 0.3545791, -0.05993964, 0.1098039, 0, 1, 1,
0.4525679, 0.5069183, -0.2136246, 0.1176471, 0, 1, 1,
0.4539652, -1.265338, 2.312027, 0.1215686, 0, 1, 1,
0.4540972, -1.046677, 1.99239, 0.1294118, 0, 1, 1,
0.4581324, -2.44231, 2.96968, 0.1333333, 0, 1, 1,
0.459328, -1.318943, 3.313469, 0.1411765, 0, 1, 1,
0.4739982, -1.542157, 2.917411, 0.145098, 0, 1, 1,
0.4784165, -0.5920252, 3.079253, 0.1529412, 0, 1, 1,
0.4787646, -1.872559, 2.347799, 0.1568628, 0, 1, 1,
0.4845332, 1.032502, 1.63844, 0.1647059, 0, 1, 1,
0.4850274, -0.4432204, 3.625962, 0.1686275, 0, 1, 1,
0.4854121, 1.388232, 0.006347943, 0.1764706, 0, 1, 1,
0.487747, 0.8476954, 0.1363987, 0.1803922, 0, 1, 1,
0.4956439, -0.7147813, 1.664665, 0.1882353, 0, 1, 1,
0.4991401, -2.055564, 3.306189, 0.1921569, 0, 1, 1,
0.5006632, -1.181848, 3.207016, 0.2, 0, 1, 1,
0.5025595, 0.8248911, 0.05970031, 0.2078431, 0, 1, 1,
0.5062457, 1.158489, 0.1931913, 0.2117647, 0, 1, 1,
0.5088553, 2.862196, -0.8161314, 0.2196078, 0, 1, 1,
0.5132416, 0.7612903, 0.978106, 0.2235294, 0, 1, 1,
0.5138835, -0.4308468, 1.410747, 0.2313726, 0, 1, 1,
0.514173, 0.2019466, 1.068399, 0.2352941, 0, 1, 1,
0.5210827, -0.5432906, 2.647491, 0.2431373, 0, 1, 1,
0.5269223, -1.134495, 2.780835, 0.2470588, 0, 1, 1,
0.5276515, -0.6826221, 4.085912, 0.254902, 0, 1, 1,
0.5291018, 2.327506, -1.411923, 0.2588235, 0, 1, 1,
0.5292773, 0.6941262, 0.8077142, 0.2666667, 0, 1, 1,
0.5316785, 1.16448, -0.3579111, 0.2705882, 0, 1, 1,
0.5323778, 0.5115532, 1.093196, 0.2784314, 0, 1, 1,
0.5342314, 0.2944501, 2.796481, 0.282353, 0, 1, 1,
0.5346389, 1.650848, -0.6906028, 0.2901961, 0, 1, 1,
0.5395318, -0.0480257, 1.103708, 0.2941177, 0, 1, 1,
0.5410329, 1.32202, -0.2259038, 0.3019608, 0, 1, 1,
0.5427049, -0.08736442, 0.3317275, 0.3098039, 0, 1, 1,
0.5429544, 1.29287, -0.3788768, 0.3137255, 0, 1, 1,
0.5433155, 1.773704, 0.735328, 0.3215686, 0, 1, 1,
0.5433247, -0.4341375, 0.9744121, 0.3254902, 0, 1, 1,
0.5457972, -0.8385696, 3.570731, 0.3333333, 0, 1, 1,
0.5472256, 0.4327298, -0.2036345, 0.3372549, 0, 1, 1,
0.5475346, -1.437181, 2.420191, 0.345098, 0, 1, 1,
0.5569144, -0.7471257, 3.063831, 0.3490196, 0, 1, 1,
0.5597042, -0.3161621, 1.996116, 0.3568628, 0, 1, 1,
0.5644255, -1.053156, 2.31342, 0.3607843, 0, 1, 1,
0.5684909, -0.6710502, 2.717599, 0.3686275, 0, 1, 1,
0.570391, -1.618222, 2.405434, 0.372549, 0, 1, 1,
0.5713999, 2.282862, 0.4427518, 0.3803922, 0, 1, 1,
0.5732812, 0.5042011, -0.4925644, 0.3843137, 0, 1, 1,
0.573487, 0.6822205, 0.8471243, 0.3921569, 0, 1, 1,
0.5803627, -1.210873, 2.900602, 0.3960784, 0, 1, 1,
0.5838798, 0.315055, 0.758807, 0.4039216, 0, 1, 1,
0.5895637, -0.01007528, 0.1387851, 0.4117647, 0, 1, 1,
0.5905908, -0.3513833, 1.969183, 0.4156863, 0, 1, 1,
0.5933775, 0.3633021, 1.377718, 0.4235294, 0, 1, 1,
0.597218, -1.366269, 1.110867, 0.427451, 0, 1, 1,
0.5980256, -0.358007, 1.484827, 0.4352941, 0, 1, 1,
0.5999433, 1.440581, 0.7250571, 0.4392157, 0, 1, 1,
0.6010294, -0.1314939, 1.192561, 0.4470588, 0, 1, 1,
0.6024105, -0.9419089, 3.349824, 0.4509804, 0, 1, 1,
0.6036029, -2.681562, 4.1289, 0.4588235, 0, 1, 1,
0.6050884, 1.261919, 2.723259, 0.4627451, 0, 1, 1,
0.6090575, 0.7671914, 3.031036, 0.4705882, 0, 1, 1,
0.6099232, -0.8128012, 3.033896, 0.4745098, 0, 1, 1,
0.6284248, -4.016951, 3.87692, 0.4823529, 0, 1, 1,
0.6284464, -1.358911, 3.982884, 0.4862745, 0, 1, 1,
0.6297934, -1.172433, 3.663729, 0.4941176, 0, 1, 1,
0.6328879, 0.8461629, 0.0310102, 0.5019608, 0, 1, 1,
0.6401654, 0.2249341, 2.652065, 0.5058824, 0, 1, 1,
0.6404648, -1.604481, 2.307864, 0.5137255, 0, 1, 1,
0.6407074, -0.5927354, 1.832344, 0.5176471, 0, 1, 1,
0.6412227, 0.201882, -0.5811967, 0.5254902, 0, 1, 1,
0.6421438, -1.366106, 2.91515, 0.5294118, 0, 1, 1,
0.6426684, -0.8494413, 2.81167, 0.5372549, 0, 1, 1,
0.6428626, -1.285539, 2.238143, 0.5411765, 0, 1, 1,
0.6443406, 0.7044314, 1.025665, 0.5490196, 0, 1, 1,
0.6446739, 0.1788062, 1.536159, 0.5529412, 0, 1, 1,
0.6473247, 0.1848234, 1.869455, 0.5607843, 0, 1, 1,
0.6474061, 0.628999, -0.7600311, 0.5647059, 0, 1, 1,
0.6558341, -0.4799444, 1.78708, 0.572549, 0, 1, 1,
0.6575341, -0.6433809, 2.709048, 0.5764706, 0, 1, 1,
0.6627097, -2.230844, 2.982305, 0.5843138, 0, 1, 1,
0.6637717, 0.6268236, 1.082367, 0.5882353, 0, 1, 1,
0.6649051, -1.841765, 2.6761, 0.5960785, 0, 1, 1,
0.6669088, -2.306812, 3.207482, 0.6039216, 0, 1, 1,
0.6669696, -0.1782256, 2.719594, 0.6078432, 0, 1, 1,
0.6700783, 0.8754053, 1.361852, 0.6156863, 0, 1, 1,
0.6728138, 0.3258265, 1.523243, 0.6196079, 0, 1, 1,
0.6822979, -0.227062, 0.2806451, 0.627451, 0, 1, 1,
0.684078, -0.5186481, 0.9275492, 0.6313726, 0, 1, 1,
0.6871853, -0.7707921, 3.02553, 0.6392157, 0, 1, 1,
0.6913945, 0.5512204, 1.282204, 0.6431373, 0, 1, 1,
0.6942, 1.732753, 0.7876359, 0.6509804, 0, 1, 1,
0.6981938, -0.2062867, 1.702279, 0.654902, 0, 1, 1,
0.7021025, -0.9596456, 2.69511, 0.6627451, 0, 1, 1,
0.7085006, -0.3195088, 3.282648, 0.6666667, 0, 1, 1,
0.7102962, -0.5276414, 1.3797, 0.6745098, 0, 1, 1,
0.7133881, 0.7641819, 2.755871, 0.6784314, 0, 1, 1,
0.7143949, 1.124565, -0.5664835, 0.6862745, 0, 1, 1,
0.7146817, 0.4738171, 2.500553, 0.6901961, 0, 1, 1,
0.7184831, -1.064503, 2.364958, 0.6980392, 0, 1, 1,
0.7187793, 1.108267, -0.5471383, 0.7058824, 0, 1, 1,
0.72025, -0.594597, 0.5917768, 0.7098039, 0, 1, 1,
0.7212809, -0.8491292, 2.303112, 0.7176471, 0, 1, 1,
0.7248235, -0.8800259, 2.876577, 0.7215686, 0, 1, 1,
0.7272742, 0.03416125, 1.486189, 0.7294118, 0, 1, 1,
0.7283998, -0.8225462, 3.01814, 0.7333333, 0, 1, 1,
0.7508547, 0.6440071, 0.6254594, 0.7411765, 0, 1, 1,
0.7518127, 0.05852924, 0.1318085, 0.7450981, 0, 1, 1,
0.7608919, -0.2424452, 1.149709, 0.7529412, 0, 1, 1,
0.7621078, -0.4824109, 1.290923, 0.7568628, 0, 1, 1,
0.7645187, 0.7298191, 0.3901522, 0.7647059, 0, 1, 1,
0.7715541, -0.876988, 1.304144, 0.7686275, 0, 1, 1,
0.7722603, -0.9804494, 2.73453, 0.7764706, 0, 1, 1,
0.7777809, -1.045182, 2.27895, 0.7803922, 0, 1, 1,
0.7835846, 1.040345, 0.6701111, 0.7882353, 0, 1, 1,
0.8011538, -1.447576, 3.034898, 0.7921569, 0, 1, 1,
0.8152814, -0.7213825, 2.946255, 0.8, 0, 1, 1,
0.8166392, -0.1477875, 1.177851, 0.8078431, 0, 1, 1,
0.8189795, 0.02651094, 1.285937, 0.8117647, 0, 1, 1,
0.819544, 0.7082223, 0.001962553, 0.8196079, 0, 1, 1,
0.8201248, -1.12884, 1.67927, 0.8235294, 0, 1, 1,
0.8210183, -1.931144, 4.346339, 0.8313726, 0, 1, 1,
0.8221498, -0.597325, 3.006373, 0.8352941, 0, 1, 1,
0.8238491, -0.2705907, 2.904302, 0.8431373, 0, 1, 1,
0.8259995, -0.2043158, 3.767399, 0.8470588, 0, 1, 1,
0.8260499, 0.07236087, 2.220378, 0.854902, 0, 1, 1,
0.8307693, 0.3419212, 2.762652, 0.8588235, 0, 1, 1,
0.8330323, 1.509638, 1.795519, 0.8666667, 0, 1, 1,
0.8335763, 0.7794909, -0.9305897, 0.8705882, 0, 1, 1,
0.8363642, 0.1396069, 2.19162, 0.8784314, 0, 1, 1,
0.8367221, -0.1249485, 2.728057, 0.8823529, 0, 1, 1,
0.837333, 1.192441, 2.363928, 0.8901961, 0, 1, 1,
0.8428118, 0.525038, 0.7200834, 0.8941177, 0, 1, 1,
0.8432359, 0.1415054, 3.274345, 0.9019608, 0, 1, 1,
0.8486838, 0.3756441, 1.890701, 0.9098039, 0, 1, 1,
0.8492848, -0.2019077, 1.237359, 0.9137255, 0, 1, 1,
0.8504758, 0.4388965, 2.427728, 0.9215686, 0, 1, 1,
0.8534092, -0.408549, 3.039382, 0.9254902, 0, 1, 1,
0.8589453, 2.738867, -0.1974052, 0.9333333, 0, 1, 1,
0.8602785, 1.361016, 0.5197539, 0.9372549, 0, 1, 1,
0.8604239, 0.926116, -0.1554006, 0.945098, 0, 1, 1,
0.8613216, 0.6571785, 0.2962741, 0.9490196, 0, 1, 1,
0.8682842, -0.05150963, 2.902481, 0.9568627, 0, 1, 1,
0.8684936, -2.138736, 2.132797, 0.9607843, 0, 1, 1,
0.8759906, -0.7337741, -1.179123, 0.9686275, 0, 1, 1,
0.8832639, -1.193662, 2.474521, 0.972549, 0, 1, 1,
0.886174, 0.277691, -0.2336438, 0.9803922, 0, 1, 1,
0.8911263, -1.305834, 1.315196, 0.9843137, 0, 1, 1,
0.8956541, -0.2451501, 1.839457, 0.9921569, 0, 1, 1,
0.9004847, -1.470381, 3.705153, 0.9960784, 0, 1, 1,
0.9057754, -0.6893657, 2.909829, 1, 0, 0.9960784, 1,
0.9103744, -1.529808, 2.386887, 1, 0, 0.9882353, 1,
0.9106125, 0.1322256, 1.613149, 1, 0, 0.9843137, 1,
0.9141859, -1.751356, 4.156572, 1, 0, 0.9764706, 1,
0.9216052, -0.6857694, 2.09012, 1, 0, 0.972549, 1,
0.9300021, -0.5289024, 1.693033, 1, 0, 0.9647059, 1,
0.9329413, 2.34996, 0.8549532, 1, 0, 0.9607843, 1,
0.9340915, -0.1721287, 3.459635, 1, 0, 0.9529412, 1,
0.9365895, 0.1671112, 3.544861, 1, 0, 0.9490196, 1,
0.9368638, 2.090252, -0.3575074, 1, 0, 0.9411765, 1,
0.9371803, -1.223462, 2.63589, 1, 0, 0.9372549, 1,
0.9381689, -1.024182, 2.002145, 1, 0, 0.9294118, 1,
0.9448365, -0.3625467, 0.8156834, 1, 0, 0.9254902, 1,
0.9467407, -0.7768624, 1.814602, 1, 0, 0.9176471, 1,
0.9519753, -0.9278968, 3.377239, 1, 0, 0.9137255, 1,
0.9563985, -0.3722027, 1.602794, 1, 0, 0.9058824, 1,
0.956847, 0.4708605, 0.5639268, 1, 0, 0.9019608, 1,
0.9661434, 1.029899, 1.89343, 1, 0, 0.8941177, 1,
0.9812948, 1.621519, 1.463973, 1, 0, 0.8862745, 1,
0.9874907, 0.3837036, 0.3108027, 1, 0, 0.8823529, 1,
0.9880652, 0.2922216, 0.6389571, 1, 0, 0.8745098, 1,
0.9962986, 1.424723, 0.9646154, 1, 0, 0.8705882, 1,
1.002543, -1.003959, 3.348991, 1, 0, 0.8627451, 1,
1.008676, -0.2977766, 0.8743122, 1, 0, 0.8588235, 1,
1.013397, -1.004834, 2.968307, 1, 0, 0.8509804, 1,
1.024816, 0.928556, 0.1946122, 1, 0, 0.8470588, 1,
1.03179, -0.4849739, 2.397213, 1, 0, 0.8392157, 1,
1.036021, -1.620462, 3.445755, 1, 0, 0.8352941, 1,
1.03694, -0.4947119, 4.108877, 1, 0, 0.827451, 1,
1.041933, 0.8926948, 0.08069086, 1, 0, 0.8235294, 1,
1.060917, -0.7271549, 2.770772, 1, 0, 0.8156863, 1,
1.063649, -0.672659, 2.022357, 1, 0, 0.8117647, 1,
1.069159, 0.6010593, 0.4121402, 1, 0, 0.8039216, 1,
1.070923, 0.5295616, -0.6872815, 1, 0, 0.7960784, 1,
1.073005, 0.1291123, 1.760016, 1, 0, 0.7921569, 1,
1.074976, 0.8871971, 0.8114188, 1, 0, 0.7843137, 1,
1.081603, -0.9446973, 2.372304, 1, 0, 0.7803922, 1,
1.085459, 0.5618599, 0.9466111, 1, 0, 0.772549, 1,
1.090789, 0.09961995, 0.3945563, 1, 0, 0.7686275, 1,
1.095745, 1.836246, -0.3246294, 1, 0, 0.7607843, 1,
1.106571, 0.07592043, 0.5536149, 1, 0, 0.7568628, 1,
1.106646, -1.010939, 3.40047, 1, 0, 0.7490196, 1,
1.107159, -1.004909, 2.162624, 1, 0, 0.7450981, 1,
1.110997, -0.2212679, 1.150211, 1, 0, 0.7372549, 1,
1.132629, 1.305607, 0.25065, 1, 0, 0.7333333, 1,
1.132896, 2.288598, 1.721682, 1, 0, 0.7254902, 1,
1.137022, -1.403772, 1.785632, 1, 0, 0.7215686, 1,
1.139731, -0.5080853, 1.442897, 1, 0, 0.7137255, 1,
1.139997, -0.3750466, 2.165702, 1, 0, 0.7098039, 1,
1.140204, 0.3704821, 1.158694, 1, 0, 0.7019608, 1,
1.140572, -1.859162, 2.168122, 1, 0, 0.6941177, 1,
1.142831, 0.99283, 0.7427447, 1, 0, 0.6901961, 1,
1.145868, 0.9503486, 0.5017413, 1, 0, 0.682353, 1,
1.14666, -0.7922824, 0.7632018, 1, 0, 0.6784314, 1,
1.146844, -1.087794, 3.882082, 1, 0, 0.6705883, 1,
1.149027, -0.4846883, 2.667046, 1, 0, 0.6666667, 1,
1.150502, 0.1687946, 1.50704, 1, 0, 0.6588235, 1,
1.153856, 1.196154, 1.020244, 1, 0, 0.654902, 1,
1.154513, 0.7966117, 1.071662, 1, 0, 0.6470588, 1,
1.159559, 0.08465942, 3.266166, 1, 0, 0.6431373, 1,
1.178874, 0.155848, 2.802445, 1, 0, 0.6352941, 1,
1.19886, 1.004367, 1.304427, 1, 0, 0.6313726, 1,
1.235418, -0.6328548, 2.449517, 1, 0, 0.6235294, 1,
1.240868, -1.518805, 1.355254, 1, 0, 0.6196079, 1,
1.244428, 0.5330622, 0.713702, 1, 0, 0.6117647, 1,
1.252701, -0.8338907, 2.739321, 1, 0, 0.6078432, 1,
1.254682, 0.2175445, 1.596817, 1, 0, 0.6, 1,
1.255692, -1.334594, 1.223954, 1, 0, 0.5921569, 1,
1.256524, -1.249394, 2.817247, 1, 0, 0.5882353, 1,
1.25812, -0.07429684, -0.1590277, 1, 0, 0.5803922, 1,
1.269372, 0.939368, 0.9334545, 1, 0, 0.5764706, 1,
1.278656, -0.4315588, -1.712477, 1, 0, 0.5686275, 1,
1.293372, -1.053427, 2.773452, 1, 0, 0.5647059, 1,
1.296739, 0.2307952, 1.136295, 1, 0, 0.5568628, 1,
1.299716, -1.398213, 0.558358, 1, 0, 0.5529412, 1,
1.306155, 1.255542, 0.6796399, 1, 0, 0.5450981, 1,
1.306536, 2.65875, 0.6849222, 1, 0, 0.5411765, 1,
1.308771, 0.2545561, 2.749998, 1, 0, 0.5333334, 1,
1.323614, -1.331655, 2.714346, 1, 0, 0.5294118, 1,
1.324003, 1.630755, 1.34518, 1, 0, 0.5215687, 1,
1.324961, -0.5888274, 2.883256, 1, 0, 0.5176471, 1,
1.339359, 1.703604, 0.5694169, 1, 0, 0.509804, 1,
1.391549, 0.9157917, 2.938379, 1, 0, 0.5058824, 1,
1.406476, 0.4635173, 0.7540297, 1, 0, 0.4980392, 1,
1.416379, -1.542402, 3.425502, 1, 0, 0.4901961, 1,
1.422819, 0.1280904, 1.806999, 1, 0, 0.4862745, 1,
1.434958, -0.02287384, 3.144376, 1, 0, 0.4784314, 1,
1.447206, -0.9367189, 2.632638, 1, 0, 0.4745098, 1,
1.449987, -0.8230383, 1.174899, 1, 0, 0.4666667, 1,
1.451911, 0.4579674, 1.398385, 1, 0, 0.4627451, 1,
1.466153, 0.5126886, 1.992833, 1, 0, 0.454902, 1,
1.474895, 0.1221533, 0.6166305, 1, 0, 0.4509804, 1,
1.479923, 1.066272, 0.9599991, 1, 0, 0.4431373, 1,
1.503026, -0.6833611, 2.288148, 1, 0, 0.4392157, 1,
1.503159, 0.02198695, 0.2376979, 1, 0, 0.4313726, 1,
1.504134, -0.7031845, 0.4872158, 1, 0, 0.427451, 1,
1.510868, 0.980566, 0.7881939, 1, 0, 0.4196078, 1,
1.532236, 0.3079797, -0.6985087, 1, 0, 0.4156863, 1,
1.533608, -1.031002, 2.040486, 1, 0, 0.4078431, 1,
1.536568, 0.1707242, 1.118926, 1, 0, 0.4039216, 1,
1.537451, -0.2579437, 1.707478, 1, 0, 0.3960784, 1,
1.547666, 1.073161, 1.894316, 1, 0, 0.3882353, 1,
1.560156, -1.212129, 1.388194, 1, 0, 0.3843137, 1,
1.581894, 1.800278, -2.145176, 1, 0, 0.3764706, 1,
1.58254, 0.2675142, -0.1739781, 1, 0, 0.372549, 1,
1.582936, 1.736398, 0.04074147, 1, 0, 0.3647059, 1,
1.585587, 0.6324165, 1.367358, 1, 0, 0.3607843, 1,
1.586099, -0.2075018, 1.090329, 1, 0, 0.3529412, 1,
1.599178, -1.284691, 2.609243, 1, 0, 0.3490196, 1,
1.610185, -1.2027, 3.571675, 1, 0, 0.3411765, 1,
1.611259, 0.1627745, 1.04604, 1, 0, 0.3372549, 1,
1.620139, 0.9751644, 1.593997, 1, 0, 0.3294118, 1,
1.628946, 0.4027003, -0.6534911, 1, 0, 0.3254902, 1,
1.639327, 1.725568, 0.8403083, 1, 0, 0.3176471, 1,
1.650201, 1.216952, 1.79957, 1, 0, 0.3137255, 1,
1.66156, 0.05997185, 2.079824, 1, 0, 0.3058824, 1,
1.666705, 0.5643317, 1.952043, 1, 0, 0.2980392, 1,
1.67076, -0.2914509, 2.623813, 1, 0, 0.2941177, 1,
1.68393, 0.7622482, 0.8508061, 1, 0, 0.2862745, 1,
1.689581, -1.585392, 2.06372, 1, 0, 0.282353, 1,
1.697123, -1.102341, 2.720103, 1, 0, 0.2745098, 1,
1.716164, 0.8987039, -0.2672705, 1, 0, 0.2705882, 1,
1.719094, -0.1622602, 1.382741, 1, 0, 0.2627451, 1,
1.731786, -1.062256, 2.400826, 1, 0, 0.2588235, 1,
1.743138, -0.6246204, 2.911995, 1, 0, 0.2509804, 1,
1.74983, -2.179273, 2.303882, 1, 0, 0.2470588, 1,
1.766259, -1.157531, 2.407364, 1, 0, 0.2392157, 1,
1.796435, -0.2983485, 1.998394, 1, 0, 0.2352941, 1,
1.812909, -0.3474742, 0.7387896, 1, 0, 0.227451, 1,
1.830699, -0.8067544, 1.337154, 1, 0, 0.2235294, 1,
1.832282, -0.8490521, 2.026471, 1, 0, 0.2156863, 1,
1.880466, -0.6501327, 0.6731848, 1, 0, 0.2117647, 1,
1.931016, -0.3472507, 2.493702, 1, 0, 0.2039216, 1,
1.959585, 1.232996, -0.513594, 1, 0, 0.1960784, 1,
1.970664, -0.02990294, 1.730272, 1, 0, 0.1921569, 1,
1.991803, -0.2798497, 1.850595, 1, 0, 0.1843137, 1,
2.013706, -0.3406346, 2.075875, 1, 0, 0.1803922, 1,
2.062696, -0.314581, 3.188737, 1, 0, 0.172549, 1,
2.063893, 0.4792799, 1.129083, 1, 0, 0.1686275, 1,
2.074833, -0.381092, 3.307305, 1, 0, 0.1607843, 1,
2.128397, -1.474066, 2.3554, 1, 0, 0.1568628, 1,
2.12963, -0.4716006, 2.231228, 1, 0, 0.1490196, 1,
2.130254, 1.52822, 1.436879, 1, 0, 0.145098, 1,
2.137881, 0.6044694, 1.815891, 1, 0, 0.1372549, 1,
2.14247, 0.3815252, 0.3938091, 1, 0, 0.1333333, 1,
2.151088, 0.5827463, 3.708076, 1, 0, 0.1254902, 1,
2.171568, -0.552667, 1.583916, 1, 0, 0.1215686, 1,
2.191498, 0.5896733, 2.425277, 1, 0, 0.1137255, 1,
2.207682, 0.9286078, 1.554418, 1, 0, 0.1098039, 1,
2.222901, 0.601615, 2.779467, 1, 0, 0.1019608, 1,
2.250053, -0.592486, -0.1251778, 1, 0, 0.09411765, 1,
2.252996, -0.887951, 2.404411, 1, 0, 0.09019608, 1,
2.263686, -0.520575, 3.913841, 1, 0, 0.08235294, 1,
2.300551, 0.3276362, 1.297202, 1, 0, 0.07843138, 1,
2.307766, 0.6426417, 0.7596741, 1, 0, 0.07058824, 1,
2.349433, -0.4643404, -0.05530391, 1, 0, 0.06666667, 1,
2.367211, 0.5591294, 2.365904, 1, 0, 0.05882353, 1,
2.376559, 0.5876423, 0.9512808, 1, 0, 0.05490196, 1,
2.412129, 0.6245331, 0.6402199, 1, 0, 0.04705882, 1,
2.41462, 1.53349, 2.241197, 1, 0, 0.04313726, 1,
2.45211, 0.6209453, 2.351028, 1, 0, 0.03529412, 1,
2.565773, -0.5746864, 0.06730286, 1, 0, 0.03137255, 1,
2.588079, 0.1528561, 2.407557, 1, 0, 0.02352941, 1,
2.624732, -1.378844, 1.583013, 1, 0, 0.01960784, 1,
3.105208, 0.7452077, 2.214593, 1, 0, 0.01176471, 1,
3.331225, -0.5734187, 2.118824, 1, 0, 0.007843138, 1
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
0.1493003, -5.182966, -7.584173, 0, -0.5, 0.5, 0.5,
0.1493003, -5.182966, -7.584173, 1, -0.5, 0.5, 0.5,
0.1493003, -5.182966, -7.584173, 1, 1.5, 0.5, 0.5,
0.1493003, -5.182966, -7.584173, 0, 1.5, 0.5, 0.5
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
-4.111297, -0.5773773, -7.584173, 0, -0.5, 0.5, 0.5,
-4.111297, -0.5773773, -7.584173, 1, -0.5, 0.5, 0.5,
-4.111297, -0.5773773, -7.584173, 1, 1.5, 0.5, 0.5,
-4.111297, -0.5773773, -7.584173, 0, 1.5, 0.5, 0.5
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
-4.111297, -5.182966, 0.002789021, 0, -0.5, 0.5, 0.5,
-4.111297, -5.182966, 0.002789021, 1, -0.5, 0.5, 0.5,
-4.111297, -5.182966, 0.002789021, 1, 1.5, 0.5, 0.5,
-4.111297, -5.182966, 0.002789021, 0, 1.5, 0.5, 0.5
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
-3, -4.120138, -5.833335,
3, -4.120138, -5.833335,
-3, -4.120138, -5.833335,
-3, -4.297276, -6.125142,
-2, -4.120138, -5.833335,
-2, -4.297276, -6.125142,
-1, -4.120138, -5.833335,
-1, -4.297276, -6.125142,
0, -4.120138, -5.833335,
0, -4.297276, -6.125142,
1, -4.120138, -5.833335,
1, -4.297276, -6.125142,
2, -4.120138, -5.833335,
2, -4.297276, -6.125142,
3, -4.120138, -5.833335,
3, -4.297276, -6.125142
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
-3, -4.651552, -6.708754, 0, -0.5, 0.5, 0.5,
-3, -4.651552, -6.708754, 1, -0.5, 0.5, 0.5,
-3, -4.651552, -6.708754, 1, 1.5, 0.5, 0.5,
-3, -4.651552, -6.708754, 0, 1.5, 0.5, 0.5,
-2, -4.651552, -6.708754, 0, -0.5, 0.5, 0.5,
-2, -4.651552, -6.708754, 1, -0.5, 0.5, 0.5,
-2, -4.651552, -6.708754, 1, 1.5, 0.5, 0.5,
-2, -4.651552, -6.708754, 0, 1.5, 0.5, 0.5,
-1, -4.651552, -6.708754, 0, -0.5, 0.5, 0.5,
-1, -4.651552, -6.708754, 1, -0.5, 0.5, 0.5,
-1, -4.651552, -6.708754, 1, 1.5, 0.5, 0.5,
-1, -4.651552, -6.708754, 0, 1.5, 0.5, 0.5,
0, -4.651552, -6.708754, 0, -0.5, 0.5, 0.5,
0, -4.651552, -6.708754, 1, -0.5, 0.5, 0.5,
0, -4.651552, -6.708754, 1, 1.5, 0.5, 0.5,
0, -4.651552, -6.708754, 0, 1.5, 0.5, 0.5,
1, -4.651552, -6.708754, 0, -0.5, 0.5, 0.5,
1, -4.651552, -6.708754, 1, -0.5, 0.5, 0.5,
1, -4.651552, -6.708754, 1, 1.5, 0.5, 0.5,
1, -4.651552, -6.708754, 0, 1.5, 0.5, 0.5,
2, -4.651552, -6.708754, 0, -0.5, 0.5, 0.5,
2, -4.651552, -6.708754, 1, -0.5, 0.5, 0.5,
2, -4.651552, -6.708754, 1, 1.5, 0.5, 0.5,
2, -4.651552, -6.708754, 0, 1.5, 0.5, 0.5,
3, -4.651552, -6.708754, 0, -0.5, 0.5, 0.5,
3, -4.651552, -6.708754, 1, -0.5, 0.5, 0.5,
3, -4.651552, -6.708754, 1, 1.5, 0.5, 0.5,
3, -4.651552, -6.708754, 0, 1.5, 0.5, 0.5
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
-3.128082, -4, -5.833335,
-3.128082, 2, -5.833335,
-3.128082, -4, -5.833335,
-3.291951, -4, -6.125142,
-3.128082, -3, -5.833335,
-3.291951, -3, -6.125142,
-3.128082, -2, -5.833335,
-3.291951, -2, -6.125142,
-3.128082, -1, -5.833335,
-3.291951, -1, -6.125142,
-3.128082, 0, -5.833335,
-3.291951, 0, -6.125142,
-3.128082, 1, -5.833335,
-3.291951, 1, -6.125142,
-3.128082, 2, -5.833335,
-3.291951, 2, -6.125142
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
-3.619689, -4, -6.708754, 0, -0.5, 0.5, 0.5,
-3.619689, -4, -6.708754, 1, -0.5, 0.5, 0.5,
-3.619689, -4, -6.708754, 1, 1.5, 0.5, 0.5,
-3.619689, -4, -6.708754, 0, 1.5, 0.5, 0.5,
-3.619689, -3, -6.708754, 0, -0.5, 0.5, 0.5,
-3.619689, -3, -6.708754, 1, -0.5, 0.5, 0.5,
-3.619689, -3, -6.708754, 1, 1.5, 0.5, 0.5,
-3.619689, -3, -6.708754, 0, 1.5, 0.5, 0.5,
-3.619689, -2, -6.708754, 0, -0.5, 0.5, 0.5,
-3.619689, -2, -6.708754, 1, -0.5, 0.5, 0.5,
-3.619689, -2, -6.708754, 1, 1.5, 0.5, 0.5,
-3.619689, -2, -6.708754, 0, 1.5, 0.5, 0.5,
-3.619689, -1, -6.708754, 0, -0.5, 0.5, 0.5,
-3.619689, -1, -6.708754, 1, -0.5, 0.5, 0.5,
-3.619689, -1, -6.708754, 1, 1.5, 0.5, 0.5,
-3.619689, -1, -6.708754, 0, 1.5, 0.5, 0.5,
-3.619689, 0, -6.708754, 0, -0.5, 0.5, 0.5,
-3.619689, 0, -6.708754, 1, -0.5, 0.5, 0.5,
-3.619689, 0, -6.708754, 1, 1.5, 0.5, 0.5,
-3.619689, 0, -6.708754, 0, 1.5, 0.5, 0.5,
-3.619689, 1, -6.708754, 0, -0.5, 0.5, 0.5,
-3.619689, 1, -6.708754, 1, -0.5, 0.5, 0.5,
-3.619689, 1, -6.708754, 1, 1.5, 0.5, 0.5,
-3.619689, 1, -6.708754, 0, 1.5, 0.5, 0.5,
-3.619689, 2, -6.708754, 0, -0.5, 0.5, 0.5,
-3.619689, 2, -6.708754, 1, -0.5, 0.5, 0.5,
-3.619689, 2, -6.708754, 1, 1.5, 0.5, 0.5,
-3.619689, 2, -6.708754, 0, 1.5, 0.5, 0.5
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
-3.128082, -4.120138, -4,
-3.128082, -4.120138, 4,
-3.128082, -4.120138, -4,
-3.291951, -4.297276, -4,
-3.128082, -4.120138, -2,
-3.291951, -4.297276, -2,
-3.128082, -4.120138, 0,
-3.291951, -4.297276, 0,
-3.128082, -4.120138, 2,
-3.291951, -4.297276, 2,
-3.128082, -4.120138, 4,
-3.291951, -4.297276, 4
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
-3.619689, -4.651552, -4, 0, -0.5, 0.5, 0.5,
-3.619689, -4.651552, -4, 1, -0.5, 0.5, 0.5,
-3.619689, -4.651552, -4, 1, 1.5, 0.5, 0.5,
-3.619689, -4.651552, -4, 0, 1.5, 0.5, 0.5,
-3.619689, -4.651552, -2, 0, -0.5, 0.5, 0.5,
-3.619689, -4.651552, -2, 1, -0.5, 0.5, 0.5,
-3.619689, -4.651552, -2, 1, 1.5, 0.5, 0.5,
-3.619689, -4.651552, -2, 0, 1.5, 0.5, 0.5,
-3.619689, -4.651552, 0, 0, -0.5, 0.5, 0.5,
-3.619689, -4.651552, 0, 1, -0.5, 0.5, 0.5,
-3.619689, -4.651552, 0, 1, 1.5, 0.5, 0.5,
-3.619689, -4.651552, 0, 0, 1.5, 0.5, 0.5,
-3.619689, -4.651552, 2, 0, -0.5, 0.5, 0.5,
-3.619689, -4.651552, 2, 1, -0.5, 0.5, 0.5,
-3.619689, -4.651552, 2, 1, 1.5, 0.5, 0.5,
-3.619689, -4.651552, 2, 0, 1.5, 0.5, 0.5,
-3.619689, -4.651552, 4, 0, -0.5, 0.5, 0.5,
-3.619689, -4.651552, 4, 1, -0.5, 0.5, 0.5,
-3.619689, -4.651552, 4, 1, 1.5, 0.5, 0.5,
-3.619689, -4.651552, 4, 0, 1.5, 0.5, 0.5
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
-3.128082, -4.120138, -5.833335,
-3.128082, 2.965383, -5.833335,
-3.128082, -4.120138, 5.838913,
-3.128082, 2.965383, 5.838913,
-3.128082, -4.120138, -5.833335,
-3.128082, -4.120138, 5.838913,
-3.128082, 2.965383, -5.833335,
-3.128082, 2.965383, 5.838913,
-3.128082, -4.120138, -5.833335,
3.426683, -4.120138, -5.833335,
-3.128082, -4.120138, 5.838913,
3.426683, -4.120138, 5.838913,
-3.128082, 2.965383, -5.833335,
3.426683, 2.965383, -5.833335,
-3.128082, 2.965383, 5.838913,
3.426683, 2.965383, 5.838913,
3.426683, -4.120138, -5.833335,
3.426683, 2.965383, -5.833335,
3.426683, -4.120138, 5.838913,
3.426683, 2.965383, 5.838913,
3.426683, -4.120138, -5.833335,
3.426683, -4.120138, 5.838913,
3.426683, 2.965383, -5.833335,
3.426683, 2.965383, 5.838913
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
var radius = 8.087839;
var distance = 35.98371;
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
mvMatrix.translate( -0.1493003, 0.5773773, -0.002789021 );
mvMatrix.scale( 1.334103, 1.234169, 0.7491899 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.98371);
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
acrylate_piperonyl_b<-read.table("acrylate_piperonyl_b.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-acrylate_piperonyl_b$V2
```

```
## Error in eval(expr, envir, enclos): object 'acrylate_piperonyl_b' not found
```

```r
y<-acrylate_piperonyl_b$V3
```

```
## Error in eval(expr, envir, enclos): object 'acrylate_piperonyl_b' not found
```

```r
z<-acrylate_piperonyl_b$V4
```

```
## Error in eval(expr, envir, enclos): object 'acrylate_piperonyl_b' not found
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
-3.032624, -0.1817932, -2.074823, 0, 0, 1, 1, 1,
-2.748577, 1.322851, -1.869113, 1, 0, 0, 1, 1,
-2.670414, -0.8090938, -1.836705, 1, 0, 0, 1, 1,
-2.640018, -0.05262939, -2.025316, 1, 0, 0, 1, 1,
-2.520296, 0.4988188, -1.725556, 1, 0, 0, 1, 1,
-2.473018, -0.7545774, -0.9775396, 1, 0, 0, 1, 1,
-2.447482, 1.196376, -2.812351, 0, 0, 0, 1, 1,
-2.428616, 0.04553514, -1.046737, 0, 0, 0, 1, 1,
-2.395342, 0.9705964, -3.176976, 0, 0, 0, 1, 1,
-2.37119, 1.773836, 0.7450157, 0, 0, 0, 1, 1,
-2.262049, 0.7524906, -2.006744, 0, 0, 0, 1, 1,
-2.242478, 2.369077, -2.127928, 0, 0, 0, 1, 1,
-2.207007, -0.7415108, -0.899845, 0, 0, 0, 1, 1,
-2.185039, 0.298978, -0.5520464, 1, 1, 1, 1, 1,
-2.146072, 0.4449461, -1.764322, 1, 1, 1, 1, 1,
-2.0601, -0.7745517, -1.147864, 1, 1, 1, 1, 1,
-2.016227, 1.646957, -1.503807, 1, 1, 1, 1, 1,
-2.011924, -0.9389256, -3.412625, 1, 1, 1, 1, 1,
-1.983183, -0.5306982, -2.12582, 1, 1, 1, 1, 1,
-1.982434, -0.4110281, -2.258971, 1, 1, 1, 1, 1,
-1.98054, 1.232213, 1.498318, 1, 1, 1, 1, 1,
-1.980051, -0.1360354, -1.495633, 1, 1, 1, 1, 1,
-1.97862, 0.4839757, -1.798976, 1, 1, 1, 1, 1,
-1.964672, -0.3035839, -1.139735, 1, 1, 1, 1, 1,
-1.935313, -1.542826, -2.948117, 1, 1, 1, 1, 1,
-1.918511, 0.2827368, -0.9457794, 1, 1, 1, 1, 1,
-1.91263, -0.3381081, -1.635157, 1, 1, 1, 1, 1,
-1.910525, 0.4880189, -3.02331, 1, 1, 1, 1, 1,
-1.910241, -0.1738599, -1.450466, 0, 0, 1, 1, 1,
-1.887318, -0.2789099, -2.357098, 1, 0, 0, 1, 1,
-1.864118, 0.2669317, -0.193485, 1, 0, 0, 1, 1,
-1.836261, 0.1993046, -1.976813, 1, 0, 0, 1, 1,
-1.830536, 0.367049, -0.5164354, 1, 0, 0, 1, 1,
-1.816249, -0.2754532, -1.346596, 1, 0, 0, 1, 1,
-1.785022, 0.2729841, -1.391943, 0, 0, 0, 1, 1,
-1.780596, -0.358062, -1.897587, 0, 0, 0, 1, 1,
-1.775271, 0.1233829, -1.516192, 0, 0, 0, 1, 1,
-1.763431, 0.5560734, -0.6183879, 0, 0, 0, 1, 1,
-1.751201, -0.784535, -1.375959, 0, 0, 0, 1, 1,
-1.745927, -0.804313, -1.58445, 0, 0, 0, 1, 1,
-1.736052, -0.6994752, -0.1220843, 0, 0, 0, 1, 1,
-1.724147, 1.382961, -3.092279, 1, 1, 1, 1, 1,
-1.717902, 0.8641195, -1.861798, 1, 1, 1, 1, 1,
-1.710329, -0.1127391, -2.157217, 1, 1, 1, 1, 1,
-1.697953, 0.03548884, -1.282672, 1, 1, 1, 1, 1,
-1.695379, -0.5079681, -2.451395, 1, 1, 1, 1, 1,
-1.690899, -1.262951, -1.340113, 1, 1, 1, 1, 1,
-1.660522, -0.8248212, -1.75279, 1, 1, 1, 1, 1,
-1.645768, -0.368383, -0.7914777, 1, 1, 1, 1, 1,
-1.609216, 0.3609024, -2.499964, 1, 1, 1, 1, 1,
-1.605995, 1.920784, -0.4576162, 1, 1, 1, 1, 1,
-1.600737, 0.2961547, -1.637376, 1, 1, 1, 1, 1,
-1.598693, -0.5855119, -1.213383, 1, 1, 1, 1, 1,
-1.589668, 1.296992, 0.4599993, 1, 1, 1, 1, 1,
-1.583665, 0.06995985, -3.358345, 1, 1, 1, 1, 1,
-1.575543, 0.4247801, -1.726454, 1, 1, 1, 1, 1,
-1.563152, 1.996003, -2.092349, 0, 0, 1, 1, 1,
-1.562125, 1.053304, -0.7704172, 1, 0, 0, 1, 1,
-1.556683, -0.5664635, -1.92487, 1, 0, 0, 1, 1,
-1.532221, -0.2174365, -0.5142108, 1, 0, 0, 1, 1,
-1.531833, -0.8171545, -4.574937, 1, 0, 0, 1, 1,
-1.531168, -0.006687166, -1.121202, 1, 0, 0, 1, 1,
-1.509429, 0.493784, -0.3530943, 0, 0, 0, 1, 1,
-1.489714, -1.217915, -1.357175, 0, 0, 0, 1, 1,
-1.476639, 0.2478515, -3.566624, 0, 0, 0, 1, 1,
-1.472128, -0.07441521, -1.043304, 0, 0, 0, 1, 1,
-1.469921, -0.6602044, -1.26017, 0, 0, 0, 1, 1,
-1.460208, 0.8070402, -1.824119, 0, 0, 0, 1, 1,
-1.452382, 0.6733063, -1.999064, 0, 0, 0, 1, 1,
-1.444175, 1.09625, -0.8982058, 1, 1, 1, 1, 1,
-1.439344, 0.665995, -1.490358, 1, 1, 1, 1, 1,
-1.436538, -0.43989, -2.706964, 1, 1, 1, 1, 1,
-1.435537, -2.399737, -0.7700372, 1, 1, 1, 1, 1,
-1.434173, -0.4929291, -2.420107, 1, 1, 1, 1, 1,
-1.416207, -1.05626, -3.07876, 1, 1, 1, 1, 1,
-1.380722, 1.231134, -0.8279334, 1, 1, 1, 1, 1,
-1.37598, -0.03417182, -1.549963, 1, 1, 1, 1, 1,
-1.3707, -0.5793263, -2.284404, 1, 1, 1, 1, 1,
-1.362791, 0.6968087, -1.567395, 1, 1, 1, 1, 1,
-1.345932, 1.00086, -0.7056523, 1, 1, 1, 1, 1,
-1.33942, -0.1516579, -1.580528, 1, 1, 1, 1, 1,
-1.338617, 0.6254926, -0.3695915, 1, 1, 1, 1, 1,
-1.337301, -0.01333903, -0.4940213, 1, 1, 1, 1, 1,
-1.320891, -0.1605807, -1.293319, 1, 1, 1, 1, 1,
-1.319495, -0.632419, -2.643162, 0, 0, 1, 1, 1,
-1.314311, -1.162613, -3.428655, 1, 0, 0, 1, 1,
-1.312044, 0.1860876, -1.464126, 1, 0, 0, 1, 1,
-1.305014, -0.3636506, -2.798028, 1, 0, 0, 1, 1,
-1.30043, -0.5042486, -2.55635, 1, 0, 0, 1, 1,
-1.291462, -1.906321, -2.967934, 1, 0, 0, 1, 1,
-1.274978, 0.7952313, -1.409595, 0, 0, 0, 1, 1,
-1.27205, 0.4575396, 1.274738, 0, 0, 0, 1, 1,
-1.262922, 0.3571087, -0.8356383, 0, 0, 0, 1, 1,
-1.257566, 0.6697857, -0.4578579, 0, 0, 0, 1, 1,
-1.254759, -1.1367, -2.661084, 0, 0, 0, 1, 1,
-1.243883, -1.50991, -3.471283, 0, 0, 0, 1, 1,
-1.240703, -0.003738032, -1.018835, 0, 0, 0, 1, 1,
-1.239787, -1.177529, -1.770671, 1, 1, 1, 1, 1,
-1.236723, 0.6240864, -1.691516, 1, 1, 1, 1, 1,
-1.235934, -0.3475833, -2.464631, 1, 1, 1, 1, 1,
-1.228659, 2.693157, -2.259488, 1, 1, 1, 1, 1,
-1.226978, 0.5785379, -0.561849, 1, 1, 1, 1, 1,
-1.219743, 1.104182, 0.7959195, 1, 1, 1, 1, 1,
-1.219269, -0.1226131, -2.2162, 1, 1, 1, 1, 1,
-1.210334, 0.2607378, -0.9629665, 1, 1, 1, 1, 1,
-1.204335, 1.143162, -2.409508, 1, 1, 1, 1, 1,
-1.197036, 0.6683972, -0.3793961, 1, 1, 1, 1, 1,
-1.196659, 1.516046, 0.4065268, 1, 1, 1, 1, 1,
-1.196291, 0.2546574, 0.6818908, 1, 1, 1, 1, 1,
-1.196002, -0.6195993, -2.271875, 1, 1, 1, 1, 1,
-1.193979, 0.4202095, -3.853558, 1, 1, 1, 1, 1,
-1.192336, -0.7130153, -0.9546463, 1, 1, 1, 1, 1,
-1.181548, 1.232196, -1.460449, 0, 0, 1, 1, 1,
-1.173559, -1.064771, -3.873619, 1, 0, 0, 1, 1,
-1.173141, -1.959764, -2.368222, 1, 0, 0, 1, 1,
-1.170451, 0.5950684, -1.683592, 1, 0, 0, 1, 1,
-1.169928, 1.256329, -2.985093, 1, 0, 0, 1, 1,
-1.166787, 0.2348203, -0.9688239, 1, 0, 0, 1, 1,
-1.164433, 0.3806906, -0.6121234, 0, 0, 0, 1, 1,
-1.162674, 0.8393485, -0.9951227, 0, 0, 0, 1, 1,
-1.159598, 1.22189, -0.5675822, 0, 0, 0, 1, 1,
-1.153071, 1.17147, 0.8045723, 0, 0, 0, 1, 1,
-1.149844, -0.5975093, -1.026264, 0, 0, 0, 1, 1,
-1.142392, -0.646244, -2.203763, 0, 0, 0, 1, 1,
-1.137393, -0.6753456, -2.376373, 0, 0, 0, 1, 1,
-1.128472, -0.4586705, -1.307277, 1, 1, 1, 1, 1,
-1.127615, -0.2093469, -0.4320282, 1, 1, 1, 1, 1,
-1.12625, 0.2557848, -0.8887286, 1, 1, 1, 1, 1,
-1.120438, 0.09731369, -2.187023, 1, 1, 1, 1, 1,
-1.120149, 0.04123601, -1.827606, 1, 1, 1, 1, 1,
-1.114871, 1.186479, 0.005597274, 1, 1, 1, 1, 1,
-1.105102, 1.596956, -1.371304, 1, 1, 1, 1, 1,
-1.10198, -1.31998, -4.633375, 1, 1, 1, 1, 1,
-1.095473, 1.567084, -0.1921816, 1, 1, 1, 1, 1,
-1.084384, 0.546268, -0.8816068, 1, 1, 1, 1, 1,
-1.082906, 0.1203889, 0.009093489, 1, 1, 1, 1, 1,
-1.076366, 0.6934269, -0.2202293, 1, 1, 1, 1, 1,
-1.076028, -2.076267, -1.788816, 1, 1, 1, 1, 1,
-1.06152, 0.4052416, -1.852061, 1, 1, 1, 1, 1,
-1.060353, -1.847165, -3.855484, 1, 1, 1, 1, 1,
-1.050057, 1.465944, -1.857334, 0, 0, 1, 1, 1,
-1.047818, 1.50538, -0.7039344, 1, 0, 0, 1, 1,
-1.045609, -0.3332665, -0.888235, 1, 0, 0, 1, 1,
-1.041971, -0.2924474, -1.522961, 1, 0, 0, 1, 1,
-1.036676, -0.4871593, -1.001545, 1, 0, 0, 1, 1,
-1.026394, 0.8505093, -0.3479284, 1, 0, 0, 1, 1,
-1.021663, 1.233762, -0.2552488, 0, 0, 0, 1, 1,
-1.018214, -1.355938, -0.4894968, 0, 0, 0, 1, 1,
-1.017441, 0.4982237, -0.9641824, 0, 0, 0, 1, 1,
-1.012677, 0.09052914, -0.8490778, 0, 0, 0, 1, 1,
-0.9982516, -0.7014601, -1.867238, 0, 0, 0, 1, 1,
-0.995143, -0.1020268, -1.153313, 0, 0, 0, 1, 1,
-0.9891086, -0.4915005, -2.494154, 0, 0, 0, 1, 1,
-0.9808686, 0.3109038, 0.4926113, 1, 1, 1, 1, 1,
-0.975624, 1.149973, -0.04836812, 1, 1, 1, 1, 1,
-0.9687976, 0.6654658, -0.7246141, 1, 1, 1, 1, 1,
-0.963829, -1.545098, -2.117726, 1, 1, 1, 1, 1,
-0.9633735, -0.1422998, -1.161049, 1, 1, 1, 1, 1,
-0.9560977, -0.5837329, -1.523228, 1, 1, 1, 1, 1,
-0.9548984, -0.1184011, -1.071688, 1, 1, 1, 1, 1,
-0.9538674, 1.552282, -0.455743, 1, 1, 1, 1, 1,
-0.9534323, -0.2205064, -1.721822, 1, 1, 1, 1, 1,
-0.9523232, -0.3724854, -1.734871, 1, 1, 1, 1, 1,
-0.9491094, -1.221541, -1.559568, 1, 1, 1, 1, 1,
-0.9485545, -1.55068, -2.531401, 1, 1, 1, 1, 1,
-0.9431537, -1.194355, -2.68068, 1, 1, 1, 1, 1,
-0.9429524, 0.4438485, -1.907398, 1, 1, 1, 1, 1,
-0.9418067, 0.6427253, -1.247484, 1, 1, 1, 1, 1,
-0.937518, -1.467952, -1.982293, 0, 0, 1, 1, 1,
-0.9357576, 1.703737, -1.142787, 1, 0, 0, 1, 1,
-0.9278148, 0.2668058, -0.3883824, 1, 0, 0, 1, 1,
-0.9262943, -0.8983532, -0.8391369, 1, 0, 0, 1, 1,
-0.9261496, 1.062153, -1.137366, 1, 0, 0, 1, 1,
-0.9238806, 1.377605, -0.1515958, 1, 0, 0, 1, 1,
-0.9230959, 0.5341802, -1.787531, 0, 0, 0, 1, 1,
-0.9152371, -0.1031204, -2.729613, 0, 0, 0, 1, 1,
-0.9127547, -0.1828048, -3.939172, 0, 0, 0, 1, 1,
-0.9119126, 0.4750892, -1.388796, 0, 0, 0, 1, 1,
-0.9095994, -0.5455605, -1.891144, 0, 0, 0, 1, 1,
-0.9051018, 0.6432905, 0.7073333, 0, 0, 0, 1, 1,
-0.9024128, 0.6026785, -1.188295, 0, 0, 0, 1, 1,
-0.8940127, -0.4761831, -2.02178, 1, 1, 1, 1, 1,
-0.8939355, 0.1673874, -0.3152156, 1, 1, 1, 1, 1,
-0.8926979, -0.1141731, -2.022535, 1, 1, 1, 1, 1,
-0.8925458, 1.711403, -1.668269, 1, 1, 1, 1, 1,
-0.888473, 0.2652622, -2.331568, 1, 1, 1, 1, 1,
-0.8874297, -3.193038, -2.504194, 1, 1, 1, 1, 1,
-0.8794466, 1.401458, -2.212066, 1, 1, 1, 1, 1,
-0.8784168, 0.06101836, 0.1968841, 1, 1, 1, 1, 1,
-0.8778276, 0.7435741, -1.077902, 1, 1, 1, 1, 1,
-0.8741406, -2.388339, -3.032735, 1, 1, 1, 1, 1,
-0.8659613, -0.5896906, -1.517506, 1, 1, 1, 1, 1,
-0.8614478, -0.7101477, -2.119996, 1, 1, 1, 1, 1,
-0.8482656, 0.870631, -0.2853979, 1, 1, 1, 1, 1,
-0.8435993, -0.8937289, -3.028016, 1, 1, 1, 1, 1,
-0.8430736, 0.7026943, -0.04308985, 1, 1, 1, 1, 1,
-0.8362301, -1.023242, -1.967345, 0, 0, 1, 1, 1,
-0.8240267, 0.4444126, -0.9189746, 1, 0, 0, 1, 1,
-0.8237215, -0.02429511, -0.6704299, 1, 0, 0, 1, 1,
-0.8196121, -0.4095007, -1.733861, 1, 0, 0, 1, 1,
-0.8173172, -0.6393638, -2.379317, 1, 0, 0, 1, 1,
-0.8125983, -0.06838918, -1.598133, 1, 0, 0, 1, 1,
-0.8081881, 0.2011142, -1.038616, 0, 0, 0, 1, 1,
-0.8064598, 0.6880992, -1.464501, 0, 0, 0, 1, 1,
-0.8026566, 0.6611245, 0.4993971, 0, 0, 0, 1, 1,
-0.7982123, -0.1030515, 0.007438256, 0, 0, 0, 1, 1,
-0.7948838, -0.444262, -1.698534, 0, 0, 0, 1, 1,
-0.7944943, -1.947895, -3.211488, 0, 0, 0, 1, 1,
-0.7863586, -0.2960917, -2.271769, 0, 0, 0, 1, 1,
-0.7845865, 1.059649, -0.3937324, 1, 1, 1, 1, 1,
-0.7795792, -2.140045, -3.352594, 1, 1, 1, 1, 1,
-0.7769015, 2.623095, -0.6933293, 1, 1, 1, 1, 1,
-0.7764552, -0.6405675, -1.098579, 1, 1, 1, 1, 1,
-0.7732315, -1.396189, -2.645173, 1, 1, 1, 1, 1,
-0.7664454, 0.8719363, -0.127539, 1, 1, 1, 1, 1,
-0.7633462, -0.5530728, -3.242743, 1, 1, 1, 1, 1,
-0.7610221, 0.2042271, 1.497113, 1, 1, 1, 1, 1,
-0.751249, 0.03942483, -0.4549585, 1, 1, 1, 1, 1,
-0.7428671, 0.6993414, -0.7429941, 1, 1, 1, 1, 1,
-0.7424772, -0.6716493, -2.837052, 1, 1, 1, 1, 1,
-0.7373747, -0.005717926, -0.6925887, 1, 1, 1, 1, 1,
-0.733, 1.348839, -0.4980905, 1, 1, 1, 1, 1,
-0.7316241, -0.2213975, -1.203201, 1, 1, 1, 1, 1,
-0.7269461, -1.42033, -1.688005, 1, 1, 1, 1, 1,
-0.719353, -0.6464223, -3.489702, 0, 0, 1, 1, 1,
-0.7146543, -0.7770543, -1.353927, 1, 0, 0, 1, 1,
-0.7143606, 1.668692, -2.056645, 1, 0, 0, 1, 1,
-0.707374, -0.5225596, -2.983075, 1, 0, 0, 1, 1,
-0.7046124, 0.9947397, -2.083224, 1, 0, 0, 1, 1,
-0.7041774, -0.1346542, -0.7630261, 1, 0, 0, 1, 1,
-0.6953515, 0.5924666, 0.2899351, 0, 0, 0, 1, 1,
-0.694765, 0.5649773, 0.04918003, 0, 0, 0, 1, 1,
-0.6914642, 0.3351722, -2.305261, 0, 0, 0, 1, 1,
-0.6905068, 1.098362, 0.3288268, 0, 0, 0, 1, 1,
-0.6903392, 0.3135161, -1.920853, 0, 0, 0, 1, 1,
-0.6864668, 0.1182348, -0.6315765, 0, 0, 0, 1, 1,
-0.6855221, -0.3584047, 0.1347757, 0, 0, 0, 1, 1,
-0.685095, 0.1431806, -2.105305, 1, 1, 1, 1, 1,
-0.6834121, 0.6478847, -0.273679, 1, 1, 1, 1, 1,
-0.6773701, 0.8235279, -2.324269, 1, 1, 1, 1, 1,
-0.6773698, 1.868566, -0.1120107, 1, 1, 1, 1, 1,
-0.6707491, -1.050998, -4.169971, 1, 1, 1, 1, 1,
-0.668234, 0.802018, 0.3280797, 1, 1, 1, 1, 1,
-0.6660294, -0.3103704, -2.81352, 1, 1, 1, 1, 1,
-0.6627555, -0.5209993, -2.672737, 1, 1, 1, 1, 1,
-0.6612608, 0.840737, -0.6337901, 1, 1, 1, 1, 1,
-0.6557054, 0.5374607, -1.423218, 1, 1, 1, 1, 1,
-0.6497336, -1.107056, -1.753351, 1, 1, 1, 1, 1,
-0.6475767, 1.012171, -1.488573, 1, 1, 1, 1, 1,
-0.6466377, -0.5049071, -2.101129, 1, 1, 1, 1, 1,
-0.6465445, -1.362787, -3.150789, 1, 1, 1, 1, 1,
-0.6457285, 1.77111, -0.6618851, 1, 1, 1, 1, 1,
-0.6371984, 1.476487, -1.22467, 0, 0, 1, 1, 1,
-0.6341399, 1.202705, -0.2902209, 1, 0, 0, 1, 1,
-0.6304638, -1.258174, -3.641497, 1, 0, 0, 1, 1,
-0.6287628, 0.0594556, -2.484055, 1, 0, 0, 1, 1,
-0.621882, 0.5482101, 0.001107144, 1, 0, 0, 1, 1,
-0.6201164, -0.1634225, 0.3545645, 1, 0, 0, 1, 1,
-0.6192507, 0.6146115, -2.793109, 0, 0, 0, 1, 1,
-0.6166521, 0.2828342, -0.3000481, 0, 0, 0, 1, 1,
-0.6081987, -1.28191, -3.945194, 0, 0, 0, 1, 1,
-0.6035542, 0.3630444, -0.784807, 0, 0, 0, 1, 1,
-0.6024517, 0.4288116, 0.1960933, 0, 0, 0, 1, 1,
-0.5997168, 0.6119318, -1.002509, 0, 0, 0, 1, 1,
-0.5934263, -0.1401785, -0.7521833, 0, 0, 0, 1, 1,
-0.5924126, 1.218573, -0.5747008, 1, 1, 1, 1, 1,
-0.5923859, -0.9696661, -1.710312, 1, 1, 1, 1, 1,
-0.5920895, 1.94507, -0.6342291, 1, 1, 1, 1, 1,
-0.5911268, -1.354964, -1.090932, 1, 1, 1, 1, 1,
-0.5902485, 0.8308608, 1.576716, 1, 1, 1, 1, 1,
-0.5889652, 0.4402101, -3.012296, 1, 1, 1, 1, 1,
-0.5884787, -0.4911529, -0.8934284, 1, 1, 1, 1, 1,
-0.5870625, -2.052133, -3.13716, 1, 1, 1, 1, 1,
-0.5867074, 0.06877307, -2.617955, 1, 1, 1, 1, 1,
-0.5855289, 0.8758873, 0.06001344, 1, 1, 1, 1, 1,
-0.5742761, -1.607988, -3.644836, 1, 1, 1, 1, 1,
-0.5696834, 1.046893, -1.37105, 1, 1, 1, 1, 1,
-0.5683707, -0.6051261, -3.293848, 1, 1, 1, 1, 1,
-0.566628, 0.380642, -2.431398, 1, 1, 1, 1, 1,
-0.5663739, -0.4417397, -2.983178, 1, 1, 1, 1, 1,
-0.5652676, 1.54836, -0.2198945, 0, 0, 1, 1, 1,
-0.5643876, -2.371484, -4.858218, 1, 0, 0, 1, 1,
-0.5623311, 0.02791605, -2.625182, 1, 0, 0, 1, 1,
-0.5548262, -0.7772987, -2.518585, 1, 0, 0, 1, 1,
-0.5514324, -1.207949, -2.492202, 1, 0, 0, 1, 1,
-0.5461158, 0.132273, -0.9257833, 1, 0, 0, 1, 1,
-0.542533, -0.5027049, -4.011927, 0, 0, 0, 1, 1,
-0.5399927, 0.8568238, 0.6812629, 0, 0, 0, 1, 1,
-0.5360582, 1.041651, -0.5893228, 0, 0, 0, 1, 1,
-0.5349182, 0.6076007, 0.6665069, 0, 0, 0, 1, 1,
-0.5282589, -0.9882281, -3.660735, 0, 0, 0, 1, 1,
-0.5235769, 0.9624733, -0.4037355, 0, 0, 0, 1, 1,
-0.5199912, -0.4487723, -1.59901, 0, 0, 0, 1, 1,
-0.515786, -1.669556, -3.289179, 1, 1, 1, 1, 1,
-0.5150799, -0.3086668, -1.473997, 1, 1, 1, 1, 1,
-0.5106106, -1.642113, -1.476466, 1, 1, 1, 1, 1,
-0.5076733, -0.1012334, -0.9555966, 1, 1, 1, 1, 1,
-0.5071486, -1.193887, -0.7612858, 1, 1, 1, 1, 1,
-0.5011197, -0.8157915, -4.950649, 1, 1, 1, 1, 1,
-0.5006658, 0.9745628, -0.9057686, 1, 1, 1, 1, 1,
-0.4986408, -0.7914084, -2.475145, 1, 1, 1, 1, 1,
-0.4961118, -0.6488349, -3.421803, 1, 1, 1, 1, 1,
-0.4951017, -1.137108, -3.780671, 1, 1, 1, 1, 1,
-0.4949198, 1.846933, 1.638217, 1, 1, 1, 1, 1,
-0.4934471, -0.008077201, -0.7953949, 1, 1, 1, 1, 1,
-0.4920016, 2.130266, -1.977365, 1, 1, 1, 1, 1,
-0.4893306, -0.5277672, -4.525192, 1, 1, 1, 1, 1,
-0.4847801, -1.297118, -2.398667, 1, 1, 1, 1, 1,
-0.4843613, -0.2698016, -1.41698, 0, 0, 1, 1, 1,
-0.4804972, -0.5744742, -3.101085, 1, 0, 0, 1, 1,
-0.4786746, -0.6042907, -2.006617, 1, 0, 0, 1, 1,
-0.4778703, 1.103964, 1.407149, 1, 0, 0, 1, 1,
-0.4762328, 1.023473, -0.7997707, 1, 0, 0, 1, 1,
-0.4720542, -1.382452, -3.037074, 1, 0, 0, 1, 1,
-0.4702278, -0.660096, -2.139381, 0, 0, 0, 1, 1,
-0.4698895, -1.007489, -1.723171, 0, 0, 0, 1, 1,
-0.4625235, -2.414528, -3.625225, 0, 0, 0, 1, 1,
-0.4618445, 0.4129995, -2.304125, 0, 0, 0, 1, 1,
-0.4603712, -0.7444613, -3.022165, 0, 0, 0, 1, 1,
-0.4589321, -0.2140244, -2.92864, 0, 0, 0, 1, 1,
-0.4588459, -1.212385, -1.430879, 0, 0, 0, 1, 1,
-0.4570538, -0.3083417, -2.569682, 1, 1, 1, 1, 1,
-0.45654, 0.2171917, -1.318444, 1, 1, 1, 1, 1,
-0.4553101, 0.6571481, -0.3134057, 1, 1, 1, 1, 1,
-0.4533536, -0.1497329, -2.414233, 1, 1, 1, 1, 1,
-0.4523071, 0.8353477, -1.622478, 1, 1, 1, 1, 1,
-0.4522639, 1.251713, 0.5334935, 1, 1, 1, 1, 1,
-0.4441072, -0.7000396, -3.099982, 1, 1, 1, 1, 1,
-0.4440264, 1.026307, -1.047111, 1, 1, 1, 1, 1,
-0.4391021, 0.2268557, -2.067063, 1, 1, 1, 1, 1,
-0.4386195, 0.6269435, -0.5402087, 1, 1, 1, 1, 1,
-0.4370472, -1.031314, -3.924329, 1, 1, 1, 1, 1,
-0.4365032, 0.9304619, -1.607293, 1, 1, 1, 1, 1,
-0.4273192, 0.6975214, -1.185925, 1, 1, 1, 1, 1,
-0.4248963, -1.068452, -1.823251, 1, 1, 1, 1, 1,
-0.4214749, 0.5202549, -2.458543, 1, 1, 1, 1, 1,
-0.4161574, 0.1484145, -1.670397, 0, 0, 1, 1, 1,
-0.413773, -0.002375454, -1.115059, 1, 0, 0, 1, 1,
-0.4099725, -1.808102, -2.483001, 1, 0, 0, 1, 1,
-0.4091062, -1.788992, -2.357112, 1, 0, 0, 1, 1,
-0.4083671, -0.2628553, -2.978147, 1, 0, 0, 1, 1,
-0.407372, -0.6358457, -0.9071317, 1, 0, 0, 1, 1,
-0.4071758, -0.5854876, -1.874034, 0, 0, 0, 1, 1,
-0.4045524, -1.214563, -3.781643, 0, 0, 0, 1, 1,
-0.4024958, -0.3457302, -0.9481224, 0, 0, 0, 1, 1,
-0.4012453, 0.6321958, 0.6094828, 0, 0, 0, 1, 1,
-0.4010485, -0.3484209, -1.369233, 0, 0, 0, 1, 1,
-0.4009661, 1.290564, 0.427791, 0, 0, 0, 1, 1,
-0.4000344, -0.5555639, -2.829432, 0, 0, 0, 1, 1,
-0.3986549, 1.494129, -0.3627129, 1, 1, 1, 1, 1,
-0.3971426, 1.476569, 1.86447, 1, 1, 1, 1, 1,
-0.3966922, -0.8948686, -1.495922, 1, 1, 1, 1, 1,
-0.3955711, 1.325573, -0.7317295, 1, 1, 1, 1, 1,
-0.3888434, 1.0729, -1.130713, 1, 1, 1, 1, 1,
-0.3875819, -1.10333, -3.649421, 1, 1, 1, 1, 1,
-0.3867839, 1.115145, 1.176533, 1, 1, 1, 1, 1,
-0.3817304, -0.3819836, -0.8966967, 1, 1, 1, 1, 1,
-0.3814479, 0.2347557, -0.6736162, 1, 1, 1, 1, 1,
-0.3777699, -0.5596845, -2.025705, 1, 1, 1, 1, 1,
-0.3775506, 0.03380387, -1.974818, 1, 1, 1, 1, 1,
-0.3770466, -0.9467539, -2.834531, 1, 1, 1, 1, 1,
-0.3732029, -1.171741, -2.013345, 1, 1, 1, 1, 1,
-0.3586397, -1.855345, -2.09124, 1, 1, 1, 1, 1,
-0.3582254, 1.156722, -1.22504, 1, 1, 1, 1, 1,
-0.3569307, 1.519526, -1.641776, 0, 0, 1, 1, 1,
-0.3560799, -1.054455, -3.154361, 1, 0, 0, 1, 1,
-0.3527246, 0.3297423, -0.2678098, 1, 0, 0, 1, 1,
-0.3495947, -0.3368409, -4.043459, 1, 0, 0, 1, 1,
-0.3472458, -1.303713, -3.219234, 1, 0, 0, 1, 1,
-0.3448191, 0.6255128, 1.401795, 1, 0, 0, 1, 1,
-0.3399954, 2.159767, -1.184069, 0, 0, 0, 1, 1,
-0.3315476, 0.467923, 0.3293478, 0, 0, 0, 1, 1,
-0.3300216, 0.1792194, -0.3767603, 0, 0, 0, 1, 1,
-0.3296622, 0.0429085, -1.377076, 0, 0, 0, 1, 1,
-0.3228315, -0.536779, -2.090616, 0, 0, 0, 1, 1,
-0.3157797, -1.604902, -3.497187, 0, 0, 0, 1, 1,
-0.3121436, -2.357163, -2.431333, 0, 0, 0, 1, 1,
-0.3114157, 0.2806928, -1.305995, 1, 1, 1, 1, 1,
-0.3067977, -1.673253, -2.471442, 1, 1, 1, 1, 1,
-0.3065082, 1.322972, 1.620115, 1, 1, 1, 1, 1,
-0.305433, -0.2798298, -4.196056, 1, 1, 1, 1, 1,
-0.2979001, 1.187606, -1.773461, 1, 1, 1, 1, 1,
-0.2929674, -0.7916904, -3.326617, 1, 1, 1, 1, 1,
-0.2906364, -0.5686123, -4.015305, 1, 1, 1, 1, 1,
-0.286316, 0.06970441, -1.293357, 1, 1, 1, 1, 1,
-0.2848769, 1.24095, 0.3709844, 1, 1, 1, 1, 1,
-0.2840942, 0.6836812, -0.2789644, 1, 1, 1, 1, 1,
-0.2725899, -0.7622263, -2.84112, 1, 1, 1, 1, 1,
-0.2720816, 0.5240912, 0.02351138, 1, 1, 1, 1, 1,
-0.2719564, 0.3900308, -1.029495, 1, 1, 1, 1, 1,
-0.2672623, -2.225524, -1.974575, 1, 1, 1, 1, 1,
-0.2669671, -2.303439, -1.929666, 1, 1, 1, 1, 1,
-0.2665312, -0.7946301, -3.654952, 0, 0, 1, 1, 1,
-0.2637708, 1.325647, -0.3865583, 1, 0, 0, 1, 1,
-0.2633651, 1.816203, 0.7752154, 1, 0, 0, 1, 1,
-0.257451, 0.9738913, -0.5491534, 1, 0, 0, 1, 1,
-0.253449, -2.557592, -4.251933, 1, 0, 0, 1, 1,
-0.2502054, 0.4282543, -1.115451, 1, 0, 0, 1, 1,
-0.2476079, -0.2680396, -4.218005, 0, 0, 0, 1, 1,
-0.2457663, -0.1415556, -1.572801, 0, 0, 0, 1, 1,
-0.2415743, 0.1957032, -0.2646981, 0, 0, 0, 1, 1,
-0.2408169, 1.109566, -1.6287, 0, 0, 0, 1, 1,
-0.2400197, 0.1055896, -2.892372, 0, 0, 0, 1, 1,
-0.2392151, 2.112279, -1.753469, 0, 0, 0, 1, 1,
-0.2383491, -2.601989, -5.335468, 0, 0, 0, 1, 1,
-0.2321233, 0.4416586, -0.7542273, 1, 1, 1, 1, 1,
-0.2319448, 0.06465257, -1.652906, 1, 1, 1, 1, 1,
-0.2282343, 1.015237, 0.1018688, 1, 1, 1, 1, 1,
-0.227674, -1.272465, -1.239451, 1, 1, 1, 1, 1,
-0.2238413, 1.864577, 0.4688473, 1, 1, 1, 1, 1,
-0.2197659, 0.6961458, -0.6924958, 1, 1, 1, 1, 1,
-0.217169, 0.34045, 1.029735, 1, 1, 1, 1, 1,
-0.2128794, -0.6986905, -0.9453433, 1, 1, 1, 1, 1,
-0.2067042, -1.428221, -1.914441, 1, 1, 1, 1, 1,
-0.2065176, 0.1146438, -1.974063, 1, 1, 1, 1, 1,
-0.206391, -0.0449366, -0.2328815, 1, 1, 1, 1, 1,
-0.2061457, 0.1905496, -0.349749, 1, 1, 1, 1, 1,
-0.2057125, 0.9773372, 1.077298, 1, 1, 1, 1, 1,
-0.2046367, -0.3043006, -1.933521, 1, 1, 1, 1, 1,
-0.1984553, 0.01956595, -1.122725, 1, 1, 1, 1, 1,
-0.1950729, 1.791785, 1.01003, 0, 0, 1, 1, 1,
-0.1918766, -0.1307745, -2.395934, 1, 0, 0, 1, 1,
-0.1918713, 0.2763576, -1.422334, 1, 0, 0, 1, 1,
-0.1905867, -0.8294761, -1.940195, 1, 0, 0, 1, 1,
-0.1893085, 0.1197506, -1.943416, 1, 0, 0, 1, 1,
-0.1812083, -1.035228, -3.714069, 1, 0, 0, 1, 1,
-0.1788515, -1.452566, -2.509376, 0, 0, 0, 1, 1,
-0.1785519, -0.5768372, -3.9174, 0, 0, 0, 1, 1,
-0.1777689, -1.183722, -2.327611, 0, 0, 0, 1, 1,
-0.176897, -0.005476043, -2.226563, 0, 0, 0, 1, 1,
-0.1741978, 0.7746952, -1.522811, 0, 0, 0, 1, 1,
-0.1729457, 0.157135, -0.1234033, 0, 0, 0, 1, 1,
-0.1719158, 1.534308, 0.4284295, 0, 0, 0, 1, 1,
-0.17031, 0.9006958, 0.5924118, 1, 1, 1, 1, 1,
-0.1682772, 1.222338, 0.4896744, 1, 1, 1, 1, 1,
-0.1636755, -0.1479254, -2.500561, 1, 1, 1, 1, 1,
-0.1594665, -0.2899045, -2.621684, 1, 1, 1, 1, 1,
-0.1582314, -0.01995584, -0.3433774, 1, 1, 1, 1, 1,
-0.1580282, -0.1304518, -1.773769, 1, 1, 1, 1, 1,
-0.1578073, 1.835648, 0.4818401, 1, 1, 1, 1, 1,
-0.1577742, 0.8354879, 0.3341043, 1, 1, 1, 1, 1,
-0.156872, -1.769617, -3.072757, 1, 1, 1, 1, 1,
-0.1562625, -1.487576, -0.8387336, 1, 1, 1, 1, 1,
-0.1551366, -0.9804918, -0.8406957, 1, 1, 1, 1, 1,
-0.155027, 1.357275, -0.3886878, 1, 1, 1, 1, 1,
-0.1548659, -0.3311121, -2.11184, 1, 1, 1, 1, 1,
-0.1532373, 2.273363, -0.7598512, 1, 1, 1, 1, 1,
-0.1515543, -0.4998011, -1.031191, 1, 1, 1, 1, 1,
-0.1512532, 0.4680227, 0.2920255, 0, 0, 1, 1, 1,
-0.1480863, -1.125453, -4.143798, 1, 0, 0, 1, 1,
-0.1458582, 2.242999, 0.4066731, 1, 0, 0, 1, 1,
-0.1434685, 0.4978656, 0.006395753, 1, 0, 0, 1, 1,
-0.1346889, -0.8182225, -1.898502, 1, 0, 0, 1, 1,
-0.1333395, -0.4360242, -1.83302, 1, 0, 0, 1, 1,
-0.1296985, 0.5039161, 0.2248754, 0, 0, 0, 1, 1,
-0.1295135, -0.5637161, -2.800949, 0, 0, 0, 1, 1,
-0.1291821, -0.3730126, -1.448749, 0, 0, 0, 1, 1,
-0.1277301, 0.2256091, -0.580256, 0, 0, 0, 1, 1,
-0.1274451, -0.51696, -4.088863, 0, 0, 0, 1, 1,
-0.1221719, -1.179964, -2.611912, 0, 0, 0, 1, 1,
-0.1190822, 1.142226, -0.02707254, 0, 0, 0, 1, 1,
-0.1162062, -0.510869, -4.443978, 1, 1, 1, 1, 1,
-0.1127088, 0.1242216, -1.433178, 1, 1, 1, 1, 1,
-0.1121157, -0.2340612, -2.253838, 1, 1, 1, 1, 1,
-0.1108509, -1.154124, -2.70575, 1, 1, 1, 1, 1,
-0.1079228, 1.059589, 1.351801, 1, 1, 1, 1, 1,
-0.1044714, -0.5070804, -3.523191, 1, 1, 1, 1, 1,
-0.1034994, 1.697392, 1.395468, 1, 1, 1, 1, 1,
-0.1032677, -1.192793, -5.663351, 1, 1, 1, 1, 1,
-0.09918025, -1.88231, -4.84224, 1, 1, 1, 1, 1,
-0.09601926, -0.5384339, -2.96914, 1, 1, 1, 1, 1,
-0.09276443, 0.8616489, -2.855057, 1, 1, 1, 1, 1,
-0.09157866, 0.8505885, 1.068972, 1, 1, 1, 1, 1,
-0.08887891, -0.4234364, -1.706467, 1, 1, 1, 1, 1,
-0.08802459, -1.310362, -3.869968, 1, 1, 1, 1, 1,
-0.08596117, 0.4059066, 0.3310086, 1, 1, 1, 1, 1,
-0.08517446, -0.9673789, -2.419399, 0, 0, 1, 1, 1,
-0.08349855, 0.7540948, -1.599993, 1, 0, 0, 1, 1,
-0.08114793, -0.5348559, -4.501592, 1, 0, 0, 1, 1,
-0.08057363, -1.614988, -3.285297, 1, 0, 0, 1, 1,
-0.0785847, 0.5150427, -1.352766, 1, 0, 0, 1, 1,
-0.07661743, -1.482164, -4.923029, 1, 0, 0, 1, 1,
-0.07644199, -0.2724323, -4.328754, 0, 0, 0, 1, 1,
-0.07189596, 0.2285902, -1.711613, 0, 0, 0, 1, 1,
-0.07165451, 0.1633233, -1.107271, 0, 0, 0, 1, 1,
-0.06890242, 1.922863, -0.9950317, 0, 0, 0, 1, 1,
-0.06857252, -0.7167355, -2.420478, 0, 0, 0, 1, 1,
-0.06558766, -1.243035, -3.889371, 0, 0, 0, 1, 1,
-0.06516358, -0.1571718, -1.747933, 0, 0, 0, 1, 1,
-0.063663, 0.05990558, -0.7456024, 1, 1, 1, 1, 1,
-0.06302224, 0.7910932, -0.829643, 1, 1, 1, 1, 1,
-0.05885215, -1.206553, -4.580847, 1, 1, 1, 1, 1,
-0.05747876, -0.3756512, -3.119563, 1, 1, 1, 1, 1,
-0.05510266, -0.05438361, -1.884993, 1, 1, 1, 1, 1,
-0.05292935, -1.239695, -2.271966, 1, 1, 1, 1, 1,
-0.04843829, -0.390672, -1.370822, 1, 1, 1, 1, 1,
-0.04746652, -1.736571, -2.937018, 1, 1, 1, 1, 1,
-0.03747008, 0.2353637, -0.3565207, 1, 1, 1, 1, 1,
-0.03709809, 1.529376, -0.6232493, 1, 1, 1, 1, 1,
-0.03449574, -0.4299102, -3.399683, 1, 1, 1, 1, 1,
-0.03352948, -0.01273156, -3.354009, 1, 1, 1, 1, 1,
-0.02993532, 0.3627903, 0.6098756, 1, 1, 1, 1, 1,
-0.02929002, -1.103482, -3.082953, 1, 1, 1, 1, 1,
-0.02701809, -0.2522129, -4.17027, 1, 1, 1, 1, 1,
-0.021842, 0.6373588, -0.3945859, 0, 0, 1, 1, 1,
-0.0198308, -1.714545, -3.168715, 1, 0, 0, 1, 1,
-0.0191796, -0.7391059, -4.396689, 1, 0, 0, 1, 1,
-0.01772816, 0.7347578, -0.4818926, 1, 0, 0, 1, 1,
-0.01348696, 2.627461, -0.03496172, 1, 0, 0, 1, 1,
-0.01144269, 0.7707717, 1.980573, 1, 0, 0, 1, 1,
-0.01136919, -0.4350885, -4.181278, 0, 0, 0, 1, 1,
0.01055743, 1.495074, -0.05287756, 0, 0, 0, 1, 1,
0.01121161, -0.2790238, 0.6615937, 0, 0, 0, 1, 1,
0.01197877, 1.008051, -1.53639, 0, 0, 0, 1, 1,
0.0123611, -0.07520821, 2.332825, 0, 0, 0, 1, 1,
0.01503193, 1.292722, 1.007545, 0, 0, 0, 1, 1,
0.01772498, 0.5058524, 0.2862815, 0, 0, 0, 1, 1,
0.02794101, 0.4065008, -0.1957267, 1, 1, 1, 1, 1,
0.02872957, 1.230161, 0.05389869, 1, 1, 1, 1, 1,
0.02913014, 0.3256128, -2.599689, 1, 1, 1, 1, 1,
0.02993173, -0.9733614, 1.183239, 1, 1, 1, 1, 1,
0.03094845, -0.4607252, 3.828699, 1, 1, 1, 1, 1,
0.03199478, -0.412075, 2.318745, 1, 1, 1, 1, 1,
0.03300866, 0.6126729, -0.9396942, 1, 1, 1, 1, 1,
0.03890014, -0.5097759, 1.915441, 1, 1, 1, 1, 1,
0.03917195, 0.911997, 1.754755, 1, 1, 1, 1, 1,
0.03974149, 1.994594, -1.025899, 1, 1, 1, 1, 1,
0.04263956, 0.7108508, -1.507301, 1, 1, 1, 1, 1,
0.04291602, -2.509622, 4.12745, 1, 1, 1, 1, 1,
0.04319686, 0.1979962, -2.179517, 1, 1, 1, 1, 1,
0.04758449, 0.1735502, 0.4932676, 1, 1, 1, 1, 1,
0.0489044, -0.4985205, 2.845689, 1, 1, 1, 1, 1,
0.05082979, -1.149451, 4.064989, 0, 0, 1, 1, 1,
0.05548325, -0.1544649, 3.499748, 1, 0, 0, 1, 1,
0.05973418, -1.294518, 5.668929, 1, 0, 0, 1, 1,
0.06134331, -0.08678282, 1.392798, 1, 0, 0, 1, 1,
0.06324458, 1.266417, 0.09608427, 1, 0, 0, 1, 1,
0.06457362, 0.3561617, 0.117634, 1, 0, 0, 1, 1,
0.0730297, -0.737295, 3.732854, 0, 0, 0, 1, 1,
0.07741143, -0.1210863, 2.438204, 0, 0, 0, 1, 1,
0.0781294, -1.087294, 1.253253, 0, 0, 0, 1, 1,
0.08312605, -0.002178759, 2.421446, 0, 0, 0, 1, 1,
0.08351693, -0.4828799, 1.057959, 0, 0, 0, 1, 1,
0.08573475, -0.380457, 4.029003, 0, 0, 0, 1, 1,
0.08701323, 0.9628659, 1.603135, 0, 0, 0, 1, 1,
0.09181485, -0.2671525, 1.490724, 1, 1, 1, 1, 1,
0.09283303, 0.9224041, -1.542144, 1, 1, 1, 1, 1,
0.09362902, -1.306788, 3.14939, 1, 1, 1, 1, 1,
0.09555152, -2.767354, 3.795019, 1, 1, 1, 1, 1,
0.09689587, 0.4083105, 0.1077842, 1, 1, 1, 1, 1,
0.09811008, 0.6593533, 0.7769986, 1, 1, 1, 1, 1,
0.1031324, -1.888562, 4.565436, 1, 1, 1, 1, 1,
0.1061388, -0.3454821, 3.356976, 1, 1, 1, 1, 1,
0.109267, -0.4516051, 3.652398, 1, 1, 1, 1, 1,
0.1097749, 1.087721, 1.044168, 1, 1, 1, 1, 1,
0.1204606, 1.000266, -0.2748398, 1, 1, 1, 1, 1,
0.1220803, 1.781204, -0.7662506, 1, 1, 1, 1, 1,
0.1224547, -0.3926117, 2.639889, 1, 1, 1, 1, 1,
0.124563, -0.1986853, 1.868224, 1, 1, 1, 1, 1,
0.1261932, -0.3513645, 3.474185, 1, 1, 1, 1, 1,
0.1288332, -0.6610419, 1.657413, 0, 0, 1, 1, 1,
0.1291652, 1.120079, -1.783293, 1, 0, 0, 1, 1,
0.1346766, 1.377658, 1.739677, 1, 0, 0, 1, 1,
0.1482536, 2.339039, -2.204843, 1, 0, 0, 1, 1,
0.1491959, 0.09453909, -1.085592, 1, 0, 0, 1, 1,
0.1492628, 1.486842, -2.288712, 1, 0, 0, 1, 1,
0.1508683, 0.09095301, 3.058273, 0, 0, 0, 1, 1,
0.1518597, -0.798481, 3.383377, 0, 0, 0, 1, 1,
0.1534834, 0.1654933, 0.5001824, 0, 0, 0, 1, 1,
0.1573789, 0.2628349, 0.6996854, 0, 0, 0, 1, 1,
0.1602558, -1.971732, 3.962274, 0, 0, 0, 1, 1,
0.1625555, 1.318174, -0.3417842, 0, 0, 0, 1, 1,
0.1645588, -0.8980111, 3.729164, 0, 0, 0, 1, 1,
0.1648361, 0.1190791, -0.1175757, 1, 1, 1, 1, 1,
0.1654295, 0.7643613, -0.8105999, 1, 1, 1, 1, 1,
0.1673355, 0.7441747, -1.58401, 1, 1, 1, 1, 1,
0.1706503, 0.4418278, 0.6697624, 1, 1, 1, 1, 1,
0.1709361, -0.07515875, 1.612199, 1, 1, 1, 1, 1,
0.1720622, 0.5757357, -0.03774552, 1, 1, 1, 1, 1,
0.1759579, -0.6041959, 3.812252, 1, 1, 1, 1, 1,
0.1772186, -0.9438422, 1.679029, 1, 1, 1, 1, 1,
0.1776845, 0.5019879, 0.7929909, 1, 1, 1, 1, 1,
0.1783676, -0.738993, 0.6454486, 1, 1, 1, 1, 1,
0.1786051, -2.532657, 2.603694, 1, 1, 1, 1, 1,
0.182661, -0.3169574, 0.9009743, 1, 1, 1, 1, 1,
0.1828235, -0.7857455, 1.198567, 1, 1, 1, 1, 1,
0.1859286, -0.05788402, 1.781796, 1, 1, 1, 1, 1,
0.1866301, -1.547985, 2.05484, 1, 1, 1, 1, 1,
0.1880638, 0.8730719, 0.4033154, 0, 0, 1, 1, 1,
0.1899019, 1.653258, -0.5931466, 1, 0, 0, 1, 1,
0.1922851, 1.057905, -0.7547053, 1, 0, 0, 1, 1,
0.1926425, -0.2255041, 2.003781, 1, 0, 0, 1, 1,
0.2044604, -0.2286913, 2.69758, 1, 0, 0, 1, 1,
0.2069159, 0.3974988, -1.33616, 1, 0, 0, 1, 1,
0.2073353, 0.08749192, 1.780735, 0, 0, 0, 1, 1,
0.2175497, 0.0881853, 1.451836, 0, 0, 0, 1, 1,
0.2193286, 0.2806399, -0.4555452, 0, 0, 0, 1, 1,
0.2254639, 0.4520613, 1.445407, 0, 0, 0, 1, 1,
0.2276966, 0.9435428, -1.049819, 0, 0, 0, 1, 1,
0.2303167, 0.2556911, -1.691143, 0, 0, 0, 1, 1,
0.2307368, -1.010686, 4.653951, 0, 0, 0, 1, 1,
0.2308916, -0.1381743, 1.164684, 1, 1, 1, 1, 1,
0.2340374, -0.5177938, 2.336797, 1, 1, 1, 1, 1,
0.2379649, -0.5459352, 0.2379928, 1, 1, 1, 1, 1,
0.2462061, 0.7443136, 0.7099485, 1, 1, 1, 1, 1,
0.2520181, 0.2102603, 0.1281721, 1, 1, 1, 1, 1,
0.25677, 0.8998698, 0.8788175, 1, 1, 1, 1, 1,
0.2599406, -0.3854557, 1.781222, 1, 1, 1, 1, 1,
0.2601427, 1.212083, 0.8627549, 1, 1, 1, 1, 1,
0.2612459, 1.424033, -0.6195384, 1, 1, 1, 1, 1,
0.2727395, 0.8031713, 1.082539, 1, 1, 1, 1, 1,
0.2738475, -1.320852, 1.240706, 1, 1, 1, 1, 1,
0.2778163, 1.979929, 0.4236068, 1, 1, 1, 1, 1,
0.2829561, 1.718872, 1.140674, 1, 1, 1, 1, 1,
0.2852033, -1.784116, 2.05774, 1, 1, 1, 1, 1,
0.2856964, -2.076477, 3.93103, 1, 1, 1, 1, 1,
0.2863592, -0.4384409, 1.973656, 0, 0, 1, 1, 1,
0.2874226, -1.109806, 1.120614, 1, 0, 0, 1, 1,
0.2889846, -0.401634, 0.3446167, 1, 0, 0, 1, 1,
0.298678, 1.549278, 0.4326157, 1, 0, 0, 1, 1,
0.3015646, 0.3457809, 0.5598615, 1, 0, 0, 1, 1,
0.3032603, 0.2984587, 0.8860972, 1, 0, 0, 1, 1,
0.3040038, -0.4226089, 2.945911, 0, 0, 0, 1, 1,
0.3043742, -0.4390823, 2.709821, 0, 0, 0, 1, 1,
0.3066007, -0.955401, 1.934636, 0, 0, 0, 1, 1,
0.3086223, -2.201338, 3.078084, 0, 0, 0, 1, 1,
0.3089736, 0.5466241, 0.7937543, 0, 0, 0, 1, 1,
0.3118089, -0.2419834, 3.497422, 0, 0, 0, 1, 1,
0.3142824, -1.060033, 3.476677, 0, 0, 0, 1, 1,
0.3164532, -0.01367347, 4.005529, 1, 1, 1, 1, 1,
0.3235357, -0.02870729, 1.482071, 1, 1, 1, 1, 1,
0.3246052, 1.114372, 1.316214, 1, 1, 1, 1, 1,
0.326387, 0.3280568, 0.07376755, 1, 1, 1, 1, 1,
0.3268304, 1.600458, -0.8236544, 1, 1, 1, 1, 1,
0.330583, 0.1402688, 0.2547243, 1, 1, 1, 1, 1,
0.3311675, -1.696921, 4.602607, 1, 1, 1, 1, 1,
0.3343014, 0.2691344, 2.817679, 1, 1, 1, 1, 1,
0.3349895, 1.144859, 0.769146, 1, 1, 1, 1, 1,
0.3351373, -1.751178, 3.038094, 1, 1, 1, 1, 1,
0.3401732, 2.117146, -0.7589505, 1, 1, 1, 1, 1,
0.3421648, -1.295816, 2.262148, 1, 1, 1, 1, 1,
0.3422484, -0.4936626, 2.96331, 1, 1, 1, 1, 1,
0.3448317, 0.3673343, 1.291025, 1, 1, 1, 1, 1,
0.3503607, 0.9449304, -0.5782956, 1, 1, 1, 1, 1,
0.3516264, -0.6932725, 2.5374, 0, 0, 1, 1, 1,
0.3532854, 1.443074, 1.699921, 1, 0, 0, 1, 1,
0.3558434, -0.3039169, 1.915391, 1, 0, 0, 1, 1,
0.3564735, -0.0001524805, 0.2152383, 1, 0, 0, 1, 1,
0.3588324, 0.4323915, 1.01437, 1, 0, 0, 1, 1,
0.3593732, -0.6479467, 0.5977963, 1, 0, 0, 1, 1,
0.3655846, -0.03969406, 1.91222, 0, 0, 0, 1, 1,
0.3665535, -1.452302, 3.376836, 0, 0, 0, 1, 1,
0.3683138, 0.9095472, -0.05979856, 0, 0, 0, 1, 1,
0.3729453, -1.492876, 2.599957, 0, 0, 0, 1, 1,
0.3735963, -1.032349, 3.20494, 0, 0, 0, 1, 1,
0.376389, 0.6693391, 1.414444, 0, 0, 0, 1, 1,
0.377085, -0.3955691, 3.166178, 0, 0, 0, 1, 1,
0.3772737, 1.884004, 0.4338408, 1, 1, 1, 1, 1,
0.3775134, -0.6650258, 3.237617, 1, 1, 1, 1, 1,
0.3801098, 0.7973214, 0.108915, 1, 1, 1, 1, 1,
0.3802013, 1.01878, -1.216489, 1, 1, 1, 1, 1,
0.3828318, -0.6309656, 2.410284, 1, 1, 1, 1, 1,
0.3831958, -0.5296605, 1.1641, 1, 1, 1, 1, 1,
0.3888379, 0.3418311, 0.5466604, 1, 1, 1, 1, 1,
0.3904881, 0.9086493, -1.344937, 1, 1, 1, 1, 1,
0.3909733, 0.7206033, -0.7916597, 1, 1, 1, 1, 1,
0.3980584, -0.4613622, 2.069578, 1, 1, 1, 1, 1,
0.3988132, 0.3359542, 0.7180486, 1, 1, 1, 1, 1,
0.4073296, 0.3434996, 0.7425706, 1, 1, 1, 1, 1,
0.4078158, 0.2660049, 2.240358, 1, 1, 1, 1, 1,
0.4102798, -0.3596453, 2.314888, 1, 1, 1, 1, 1,
0.4161974, -0.4400006, 2.824893, 1, 1, 1, 1, 1,
0.4164245, -0.3204889, 2.073411, 0, 0, 1, 1, 1,
0.4171874, -1.023977, 2.55405, 1, 0, 0, 1, 1,
0.4190685, 0.9936936, -0.4450087, 1, 0, 0, 1, 1,
0.421416, -0.2434327, 2.275155, 1, 0, 0, 1, 1,
0.4287792, 0.4884776, 2.504311, 1, 0, 0, 1, 1,
0.4313082, 1.147558, -0.6521248, 1, 0, 0, 1, 1,
0.4315578, 1.581208, -0.4998977, 0, 0, 0, 1, 1,
0.4345093, 0.02049766, 0.9341634, 0, 0, 0, 1, 1,
0.4360042, 2.667217, 1.212861, 0, 0, 0, 1, 1,
0.4371792, -1.302154, 3.335951, 0, 0, 0, 1, 1,
0.445979, 0.7414542, 1.33871, 0, 0, 0, 1, 1,
0.4477637, -1.331265, 3.787207, 0, 0, 0, 1, 1,
0.4514681, 1.163285, -0.6271788, 0, 0, 0, 1, 1,
0.4520027, 0.3545791, -0.05993964, 1, 1, 1, 1, 1,
0.4525679, 0.5069183, -0.2136246, 1, 1, 1, 1, 1,
0.4539652, -1.265338, 2.312027, 1, 1, 1, 1, 1,
0.4540972, -1.046677, 1.99239, 1, 1, 1, 1, 1,
0.4581324, -2.44231, 2.96968, 1, 1, 1, 1, 1,
0.459328, -1.318943, 3.313469, 1, 1, 1, 1, 1,
0.4739982, -1.542157, 2.917411, 1, 1, 1, 1, 1,
0.4784165, -0.5920252, 3.079253, 1, 1, 1, 1, 1,
0.4787646, -1.872559, 2.347799, 1, 1, 1, 1, 1,
0.4845332, 1.032502, 1.63844, 1, 1, 1, 1, 1,
0.4850274, -0.4432204, 3.625962, 1, 1, 1, 1, 1,
0.4854121, 1.388232, 0.006347943, 1, 1, 1, 1, 1,
0.487747, 0.8476954, 0.1363987, 1, 1, 1, 1, 1,
0.4956439, -0.7147813, 1.664665, 1, 1, 1, 1, 1,
0.4991401, -2.055564, 3.306189, 1, 1, 1, 1, 1,
0.5006632, -1.181848, 3.207016, 0, 0, 1, 1, 1,
0.5025595, 0.8248911, 0.05970031, 1, 0, 0, 1, 1,
0.5062457, 1.158489, 0.1931913, 1, 0, 0, 1, 1,
0.5088553, 2.862196, -0.8161314, 1, 0, 0, 1, 1,
0.5132416, 0.7612903, 0.978106, 1, 0, 0, 1, 1,
0.5138835, -0.4308468, 1.410747, 1, 0, 0, 1, 1,
0.514173, 0.2019466, 1.068399, 0, 0, 0, 1, 1,
0.5210827, -0.5432906, 2.647491, 0, 0, 0, 1, 1,
0.5269223, -1.134495, 2.780835, 0, 0, 0, 1, 1,
0.5276515, -0.6826221, 4.085912, 0, 0, 0, 1, 1,
0.5291018, 2.327506, -1.411923, 0, 0, 0, 1, 1,
0.5292773, 0.6941262, 0.8077142, 0, 0, 0, 1, 1,
0.5316785, 1.16448, -0.3579111, 0, 0, 0, 1, 1,
0.5323778, 0.5115532, 1.093196, 1, 1, 1, 1, 1,
0.5342314, 0.2944501, 2.796481, 1, 1, 1, 1, 1,
0.5346389, 1.650848, -0.6906028, 1, 1, 1, 1, 1,
0.5395318, -0.0480257, 1.103708, 1, 1, 1, 1, 1,
0.5410329, 1.32202, -0.2259038, 1, 1, 1, 1, 1,
0.5427049, -0.08736442, 0.3317275, 1, 1, 1, 1, 1,
0.5429544, 1.29287, -0.3788768, 1, 1, 1, 1, 1,
0.5433155, 1.773704, 0.735328, 1, 1, 1, 1, 1,
0.5433247, -0.4341375, 0.9744121, 1, 1, 1, 1, 1,
0.5457972, -0.8385696, 3.570731, 1, 1, 1, 1, 1,
0.5472256, 0.4327298, -0.2036345, 1, 1, 1, 1, 1,
0.5475346, -1.437181, 2.420191, 1, 1, 1, 1, 1,
0.5569144, -0.7471257, 3.063831, 1, 1, 1, 1, 1,
0.5597042, -0.3161621, 1.996116, 1, 1, 1, 1, 1,
0.5644255, -1.053156, 2.31342, 1, 1, 1, 1, 1,
0.5684909, -0.6710502, 2.717599, 0, 0, 1, 1, 1,
0.570391, -1.618222, 2.405434, 1, 0, 0, 1, 1,
0.5713999, 2.282862, 0.4427518, 1, 0, 0, 1, 1,
0.5732812, 0.5042011, -0.4925644, 1, 0, 0, 1, 1,
0.573487, 0.6822205, 0.8471243, 1, 0, 0, 1, 1,
0.5803627, -1.210873, 2.900602, 1, 0, 0, 1, 1,
0.5838798, 0.315055, 0.758807, 0, 0, 0, 1, 1,
0.5895637, -0.01007528, 0.1387851, 0, 0, 0, 1, 1,
0.5905908, -0.3513833, 1.969183, 0, 0, 0, 1, 1,
0.5933775, 0.3633021, 1.377718, 0, 0, 0, 1, 1,
0.597218, -1.366269, 1.110867, 0, 0, 0, 1, 1,
0.5980256, -0.358007, 1.484827, 0, 0, 0, 1, 1,
0.5999433, 1.440581, 0.7250571, 0, 0, 0, 1, 1,
0.6010294, -0.1314939, 1.192561, 1, 1, 1, 1, 1,
0.6024105, -0.9419089, 3.349824, 1, 1, 1, 1, 1,
0.6036029, -2.681562, 4.1289, 1, 1, 1, 1, 1,
0.6050884, 1.261919, 2.723259, 1, 1, 1, 1, 1,
0.6090575, 0.7671914, 3.031036, 1, 1, 1, 1, 1,
0.6099232, -0.8128012, 3.033896, 1, 1, 1, 1, 1,
0.6284248, -4.016951, 3.87692, 1, 1, 1, 1, 1,
0.6284464, -1.358911, 3.982884, 1, 1, 1, 1, 1,
0.6297934, -1.172433, 3.663729, 1, 1, 1, 1, 1,
0.6328879, 0.8461629, 0.0310102, 1, 1, 1, 1, 1,
0.6401654, 0.2249341, 2.652065, 1, 1, 1, 1, 1,
0.6404648, -1.604481, 2.307864, 1, 1, 1, 1, 1,
0.6407074, -0.5927354, 1.832344, 1, 1, 1, 1, 1,
0.6412227, 0.201882, -0.5811967, 1, 1, 1, 1, 1,
0.6421438, -1.366106, 2.91515, 1, 1, 1, 1, 1,
0.6426684, -0.8494413, 2.81167, 0, 0, 1, 1, 1,
0.6428626, -1.285539, 2.238143, 1, 0, 0, 1, 1,
0.6443406, 0.7044314, 1.025665, 1, 0, 0, 1, 1,
0.6446739, 0.1788062, 1.536159, 1, 0, 0, 1, 1,
0.6473247, 0.1848234, 1.869455, 1, 0, 0, 1, 1,
0.6474061, 0.628999, -0.7600311, 1, 0, 0, 1, 1,
0.6558341, -0.4799444, 1.78708, 0, 0, 0, 1, 1,
0.6575341, -0.6433809, 2.709048, 0, 0, 0, 1, 1,
0.6627097, -2.230844, 2.982305, 0, 0, 0, 1, 1,
0.6637717, 0.6268236, 1.082367, 0, 0, 0, 1, 1,
0.6649051, -1.841765, 2.6761, 0, 0, 0, 1, 1,
0.6669088, -2.306812, 3.207482, 0, 0, 0, 1, 1,
0.6669696, -0.1782256, 2.719594, 0, 0, 0, 1, 1,
0.6700783, 0.8754053, 1.361852, 1, 1, 1, 1, 1,
0.6728138, 0.3258265, 1.523243, 1, 1, 1, 1, 1,
0.6822979, -0.227062, 0.2806451, 1, 1, 1, 1, 1,
0.684078, -0.5186481, 0.9275492, 1, 1, 1, 1, 1,
0.6871853, -0.7707921, 3.02553, 1, 1, 1, 1, 1,
0.6913945, 0.5512204, 1.282204, 1, 1, 1, 1, 1,
0.6942, 1.732753, 0.7876359, 1, 1, 1, 1, 1,
0.6981938, -0.2062867, 1.702279, 1, 1, 1, 1, 1,
0.7021025, -0.9596456, 2.69511, 1, 1, 1, 1, 1,
0.7085006, -0.3195088, 3.282648, 1, 1, 1, 1, 1,
0.7102962, -0.5276414, 1.3797, 1, 1, 1, 1, 1,
0.7133881, 0.7641819, 2.755871, 1, 1, 1, 1, 1,
0.7143949, 1.124565, -0.5664835, 1, 1, 1, 1, 1,
0.7146817, 0.4738171, 2.500553, 1, 1, 1, 1, 1,
0.7184831, -1.064503, 2.364958, 1, 1, 1, 1, 1,
0.7187793, 1.108267, -0.5471383, 0, 0, 1, 1, 1,
0.72025, -0.594597, 0.5917768, 1, 0, 0, 1, 1,
0.7212809, -0.8491292, 2.303112, 1, 0, 0, 1, 1,
0.7248235, -0.8800259, 2.876577, 1, 0, 0, 1, 1,
0.7272742, 0.03416125, 1.486189, 1, 0, 0, 1, 1,
0.7283998, -0.8225462, 3.01814, 1, 0, 0, 1, 1,
0.7508547, 0.6440071, 0.6254594, 0, 0, 0, 1, 1,
0.7518127, 0.05852924, 0.1318085, 0, 0, 0, 1, 1,
0.7608919, -0.2424452, 1.149709, 0, 0, 0, 1, 1,
0.7621078, -0.4824109, 1.290923, 0, 0, 0, 1, 1,
0.7645187, 0.7298191, 0.3901522, 0, 0, 0, 1, 1,
0.7715541, -0.876988, 1.304144, 0, 0, 0, 1, 1,
0.7722603, -0.9804494, 2.73453, 0, 0, 0, 1, 1,
0.7777809, -1.045182, 2.27895, 1, 1, 1, 1, 1,
0.7835846, 1.040345, 0.6701111, 1, 1, 1, 1, 1,
0.8011538, -1.447576, 3.034898, 1, 1, 1, 1, 1,
0.8152814, -0.7213825, 2.946255, 1, 1, 1, 1, 1,
0.8166392, -0.1477875, 1.177851, 1, 1, 1, 1, 1,
0.8189795, 0.02651094, 1.285937, 1, 1, 1, 1, 1,
0.819544, 0.7082223, 0.001962553, 1, 1, 1, 1, 1,
0.8201248, -1.12884, 1.67927, 1, 1, 1, 1, 1,
0.8210183, -1.931144, 4.346339, 1, 1, 1, 1, 1,
0.8221498, -0.597325, 3.006373, 1, 1, 1, 1, 1,
0.8238491, -0.2705907, 2.904302, 1, 1, 1, 1, 1,
0.8259995, -0.2043158, 3.767399, 1, 1, 1, 1, 1,
0.8260499, 0.07236087, 2.220378, 1, 1, 1, 1, 1,
0.8307693, 0.3419212, 2.762652, 1, 1, 1, 1, 1,
0.8330323, 1.509638, 1.795519, 1, 1, 1, 1, 1,
0.8335763, 0.7794909, -0.9305897, 0, 0, 1, 1, 1,
0.8363642, 0.1396069, 2.19162, 1, 0, 0, 1, 1,
0.8367221, -0.1249485, 2.728057, 1, 0, 0, 1, 1,
0.837333, 1.192441, 2.363928, 1, 0, 0, 1, 1,
0.8428118, 0.525038, 0.7200834, 1, 0, 0, 1, 1,
0.8432359, 0.1415054, 3.274345, 1, 0, 0, 1, 1,
0.8486838, 0.3756441, 1.890701, 0, 0, 0, 1, 1,
0.8492848, -0.2019077, 1.237359, 0, 0, 0, 1, 1,
0.8504758, 0.4388965, 2.427728, 0, 0, 0, 1, 1,
0.8534092, -0.408549, 3.039382, 0, 0, 0, 1, 1,
0.8589453, 2.738867, -0.1974052, 0, 0, 0, 1, 1,
0.8602785, 1.361016, 0.5197539, 0, 0, 0, 1, 1,
0.8604239, 0.926116, -0.1554006, 0, 0, 0, 1, 1,
0.8613216, 0.6571785, 0.2962741, 1, 1, 1, 1, 1,
0.8682842, -0.05150963, 2.902481, 1, 1, 1, 1, 1,
0.8684936, -2.138736, 2.132797, 1, 1, 1, 1, 1,
0.8759906, -0.7337741, -1.179123, 1, 1, 1, 1, 1,
0.8832639, -1.193662, 2.474521, 1, 1, 1, 1, 1,
0.886174, 0.277691, -0.2336438, 1, 1, 1, 1, 1,
0.8911263, -1.305834, 1.315196, 1, 1, 1, 1, 1,
0.8956541, -0.2451501, 1.839457, 1, 1, 1, 1, 1,
0.9004847, -1.470381, 3.705153, 1, 1, 1, 1, 1,
0.9057754, -0.6893657, 2.909829, 1, 1, 1, 1, 1,
0.9103744, -1.529808, 2.386887, 1, 1, 1, 1, 1,
0.9106125, 0.1322256, 1.613149, 1, 1, 1, 1, 1,
0.9141859, -1.751356, 4.156572, 1, 1, 1, 1, 1,
0.9216052, -0.6857694, 2.09012, 1, 1, 1, 1, 1,
0.9300021, -0.5289024, 1.693033, 1, 1, 1, 1, 1,
0.9329413, 2.34996, 0.8549532, 0, 0, 1, 1, 1,
0.9340915, -0.1721287, 3.459635, 1, 0, 0, 1, 1,
0.9365895, 0.1671112, 3.544861, 1, 0, 0, 1, 1,
0.9368638, 2.090252, -0.3575074, 1, 0, 0, 1, 1,
0.9371803, -1.223462, 2.63589, 1, 0, 0, 1, 1,
0.9381689, -1.024182, 2.002145, 1, 0, 0, 1, 1,
0.9448365, -0.3625467, 0.8156834, 0, 0, 0, 1, 1,
0.9467407, -0.7768624, 1.814602, 0, 0, 0, 1, 1,
0.9519753, -0.9278968, 3.377239, 0, 0, 0, 1, 1,
0.9563985, -0.3722027, 1.602794, 0, 0, 0, 1, 1,
0.956847, 0.4708605, 0.5639268, 0, 0, 0, 1, 1,
0.9661434, 1.029899, 1.89343, 0, 0, 0, 1, 1,
0.9812948, 1.621519, 1.463973, 0, 0, 0, 1, 1,
0.9874907, 0.3837036, 0.3108027, 1, 1, 1, 1, 1,
0.9880652, 0.2922216, 0.6389571, 1, 1, 1, 1, 1,
0.9962986, 1.424723, 0.9646154, 1, 1, 1, 1, 1,
1.002543, -1.003959, 3.348991, 1, 1, 1, 1, 1,
1.008676, -0.2977766, 0.8743122, 1, 1, 1, 1, 1,
1.013397, -1.004834, 2.968307, 1, 1, 1, 1, 1,
1.024816, 0.928556, 0.1946122, 1, 1, 1, 1, 1,
1.03179, -0.4849739, 2.397213, 1, 1, 1, 1, 1,
1.036021, -1.620462, 3.445755, 1, 1, 1, 1, 1,
1.03694, -0.4947119, 4.108877, 1, 1, 1, 1, 1,
1.041933, 0.8926948, 0.08069086, 1, 1, 1, 1, 1,
1.060917, -0.7271549, 2.770772, 1, 1, 1, 1, 1,
1.063649, -0.672659, 2.022357, 1, 1, 1, 1, 1,
1.069159, 0.6010593, 0.4121402, 1, 1, 1, 1, 1,
1.070923, 0.5295616, -0.6872815, 1, 1, 1, 1, 1,
1.073005, 0.1291123, 1.760016, 0, 0, 1, 1, 1,
1.074976, 0.8871971, 0.8114188, 1, 0, 0, 1, 1,
1.081603, -0.9446973, 2.372304, 1, 0, 0, 1, 1,
1.085459, 0.5618599, 0.9466111, 1, 0, 0, 1, 1,
1.090789, 0.09961995, 0.3945563, 1, 0, 0, 1, 1,
1.095745, 1.836246, -0.3246294, 1, 0, 0, 1, 1,
1.106571, 0.07592043, 0.5536149, 0, 0, 0, 1, 1,
1.106646, -1.010939, 3.40047, 0, 0, 0, 1, 1,
1.107159, -1.004909, 2.162624, 0, 0, 0, 1, 1,
1.110997, -0.2212679, 1.150211, 0, 0, 0, 1, 1,
1.132629, 1.305607, 0.25065, 0, 0, 0, 1, 1,
1.132896, 2.288598, 1.721682, 0, 0, 0, 1, 1,
1.137022, -1.403772, 1.785632, 0, 0, 0, 1, 1,
1.139731, -0.5080853, 1.442897, 1, 1, 1, 1, 1,
1.139997, -0.3750466, 2.165702, 1, 1, 1, 1, 1,
1.140204, 0.3704821, 1.158694, 1, 1, 1, 1, 1,
1.140572, -1.859162, 2.168122, 1, 1, 1, 1, 1,
1.142831, 0.99283, 0.7427447, 1, 1, 1, 1, 1,
1.145868, 0.9503486, 0.5017413, 1, 1, 1, 1, 1,
1.14666, -0.7922824, 0.7632018, 1, 1, 1, 1, 1,
1.146844, -1.087794, 3.882082, 1, 1, 1, 1, 1,
1.149027, -0.4846883, 2.667046, 1, 1, 1, 1, 1,
1.150502, 0.1687946, 1.50704, 1, 1, 1, 1, 1,
1.153856, 1.196154, 1.020244, 1, 1, 1, 1, 1,
1.154513, 0.7966117, 1.071662, 1, 1, 1, 1, 1,
1.159559, 0.08465942, 3.266166, 1, 1, 1, 1, 1,
1.178874, 0.155848, 2.802445, 1, 1, 1, 1, 1,
1.19886, 1.004367, 1.304427, 1, 1, 1, 1, 1,
1.235418, -0.6328548, 2.449517, 0, 0, 1, 1, 1,
1.240868, -1.518805, 1.355254, 1, 0, 0, 1, 1,
1.244428, 0.5330622, 0.713702, 1, 0, 0, 1, 1,
1.252701, -0.8338907, 2.739321, 1, 0, 0, 1, 1,
1.254682, 0.2175445, 1.596817, 1, 0, 0, 1, 1,
1.255692, -1.334594, 1.223954, 1, 0, 0, 1, 1,
1.256524, -1.249394, 2.817247, 0, 0, 0, 1, 1,
1.25812, -0.07429684, -0.1590277, 0, 0, 0, 1, 1,
1.269372, 0.939368, 0.9334545, 0, 0, 0, 1, 1,
1.278656, -0.4315588, -1.712477, 0, 0, 0, 1, 1,
1.293372, -1.053427, 2.773452, 0, 0, 0, 1, 1,
1.296739, 0.2307952, 1.136295, 0, 0, 0, 1, 1,
1.299716, -1.398213, 0.558358, 0, 0, 0, 1, 1,
1.306155, 1.255542, 0.6796399, 1, 1, 1, 1, 1,
1.306536, 2.65875, 0.6849222, 1, 1, 1, 1, 1,
1.308771, 0.2545561, 2.749998, 1, 1, 1, 1, 1,
1.323614, -1.331655, 2.714346, 1, 1, 1, 1, 1,
1.324003, 1.630755, 1.34518, 1, 1, 1, 1, 1,
1.324961, -0.5888274, 2.883256, 1, 1, 1, 1, 1,
1.339359, 1.703604, 0.5694169, 1, 1, 1, 1, 1,
1.391549, 0.9157917, 2.938379, 1, 1, 1, 1, 1,
1.406476, 0.4635173, 0.7540297, 1, 1, 1, 1, 1,
1.416379, -1.542402, 3.425502, 1, 1, 1, 1, 1,
1.422819, 0.1280904, 1.806999, 1, 1, 1, 1, 1,
1.434958, -0.02287384, 3.144376, 1, 1, 1, 1, 1,
1.447206, -0.9367189, 2.632638, 1, 1, 1, 1, 1,
1.449987, -0.8230383, 1.174899, 1, 1, 1, 1, 1,
1.451911, 0.4579674, 1.398385, 1, 1, 1, 1, 1,
1.466153, 0.5126886, 1.992833, 0, 0, 1, 1, 1,
1.474895, 0.1221533, 0.6166305, 1, 0, 0, 1, 1,
1.479923, 1.066272, 0.9599991, 1, 0, 0, 1, 1,
1.503026, -0.6833611, 2.288148, 1, 0, 0, 1, 1,
1.503159, 0.02198695, 0.2376979, 1, 0, 0, 1, 1,
1.504134, -0.7031845, 0.4872158, 1, 0, 0, 1, 1,
1.510868, 0.980566, 0.7881939, 0, 0, 0, 1, 1,
1.532236, 0.3079797, -0.6985087, 0, 0, 0, 1, 1,
1.533608, -1.031002, 2.040486, 0, 0, 0, 1, 1,
1.536568, 0.1707242, 1.118926, 0, 0, 0, 1, 1,
1.537451, -0.2579437, 1.707478, 0, 0, 0, 1, 1,
1.547666, 1.073161, 1.894316, 0, 0, 0, 1, 1,
1.560156, -1.212129, 1.388194, 0, 0, 0, 1, 1,
1.581894, 1.800278, -2.145176, 1, 1, 1, 1, 1,
1.58254, 0.2675142, -0.1739781, 1, 1, 1, 1, 1,
1.582936, 1.736398, 0.04074147, 1, 1, 1, 1, 1,
1.585587, 0.6324165, 1.367358, 1, 1, 1, 1, 1,
1.586099, -0.2075018, 1.090329, 1, 1, 1, 1, 1,
1.599178, -1.284691, 2.609243, 1, 1, 1, 1, 1,
1.610185, -1.2027, 3.571675, 1, 1, 1, 1, 1,
1.611259, 0.1627745, 1.04604, 1, 1, 1, 1, 1,
1.620139, 0.9751644, 1.593997, 1, 1, 1, 1, 1,
1.628946, 0.4027003, -0.6534911, 1, 1, 1, 1, 1,
1.639327, 1.725568, 0.8403083, 1, 1, 1, 1, 1,
1.650201, 1.216952, 1.79957, 1, 1, 1, 1, 1,
1.66156, 0.05997185, 2.079824, 1, 1, 1, 1, 1,
1.666705, 0.5643317, 1.952043, 1, 1, 1, 1, 1,
1.67076, -0.2914509, 2.623813, 1, 1, 1, 1, 1,
1.68393, 0.7622482, 0.8508061, 0, 0, 1, 1, 1,
1.689581, -1.585392, 2.06372, 1, 0, 0, 1, 1,
1.697123, -1.102341, 2.720103, 1, 0, 0, 1, 1,
1.716164, 0.8987039, -0.2672705, 1, 0, 0, 1, 1,
1.719094, -0.1622602, 1.382741, 1, 0, 0, 1, 1,
1.731786, -1.062256, 2.400826, 1, 0, 0, 1, 1,
1.743138, -0.6246204, 2.911995, 0, 0, 0, 1, 1,
1.74983, -2.179273, 2.303882, 0, 0, 0, 1, 1,
1.766259, -1.157531, 2.407364, 0, 0, 0, 1, 1,
1.796435, -0.2983485, 1.998394, 0, 0, 0, 1, 1,
1.812909, -0.3474742, 0.7387896, 0, 0, 0, 1, 1,
1.830699, -0.8067544, 1.337154, 0, 0, 0, 1, 1,
1.832282, -0.8490521, 2.026471, 0, 0, 0, 1, 1,
1.880466, -0.6501327, 0.6731848, 1, 1, 1, 1, 1,
1.931016, -0.3472507, 2.493702, 1, 1, 1, 1, 1,
1.959585, 1.232996, -0.513594, 1, 1, 1, 1, 1,
1.970664, -0.02990294, 1.730272, 1, 1, 1, 1, 1,
1.991803, -0.2798497, 1.850595, 1, 1, 1, 1, 1,
2.013706, -0.3406346, 2.075875, 1, 1, 1, 1, 1,
2.062696, -0.314581, 3.188737, 1, 1, 1, 1, 1,
2.063893, 0.4792799, 1.129083, 1, 1, 1, 1, 1,
2.074833, -0.381092, 3.307305, 1, 1, 1, 1, 1,
2.128397, -1.474066, 2.3554, 1, 1, 1, 1, 1,
2.12963, -0.4716006, 2.231228, 1, 1, 1, 1, 1,
2.130254, 1.52822, 1.436879, 1, 1, 1, 1, 1,
2.137881, 0.6044694, 1.815891, 1, 1, 1, 1, 1,
2.14247, 0.3815252, 0.3938091, 1, 1, 1, 1, 1,
2.151088, 0.5827463, 3.708076, 1, 1, 1, 1, 1,
2.171568, -0.552667, 1.583916, 0, 0, 1, 1, 1,
2.191498, 0.5896733, 2.425277, 1, 0, 0, 1, 1,
2.207682, 0.9286078, 1.554418, 1, 0, 0, 1, 1,
2.222901, 0.601615, 2.779467, 1, 0, 0, 1, 1,
2.250053, -0.592486, -0.1251778, 1, 0, 0, 1, 1,
2.252996, -0.887951, 2.404411, 1, 0, 0, 1, 1,
2.263686, -0.520575, 3.913841, 0, 0, 0, 1, 1,
2.300551, 0.3276362, 1.297202, 0, 0, 0, 1, 1,
2.307766, 0.6426417, 0.7596741, 0, 0, 0, 1, 1,
2.349433, -0.4643404, -0.05530391, 0, 0, 0, 1, 1,
2.367211, 0.5591294, 2.365904, 0, 0, 0, 1, 1,
2.376559, 0.5876423, 0.9512808, 0, 0, 0, 1, 1,
2.412129, 0.6245331, 0.6402199, 0, 0, 0, 1, 1,
2.41462, 1.53349, 2.241197, 1, 1, 1, 1, 1,
2.45211, 0.6209453, 2.351028, 1, 1, 1, 1, 1,
2.565773, -0.5746864, 0.06730286, 1, 1, 1, 1, 1,
2.588079, 0.1528561, 2.407557, 1, 1, 1, 1, 1,
2.624732, -1.378844, 1.583013, 1, 1, 1, 1, 1,
3.105208, 0.7452077, 2.214593, 1, 1, 1, 1, 1,
3.331225, -0.5734187, 2.118824, 1, 1, 1, 1, 1
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
var radius = 9.938774;
var distance = 34.90952;
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
mvMatrix.translate( -0.1493003, 0.5773773, -0.002789021 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.90952);
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
