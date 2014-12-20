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
-3.177565, 0.9258949, -2.75398, 1, 0, 0, 1,
-3.119799, 0.6047531, -1.756517, 1, 0.007843138, 0, 1,
-2.991209, 0.04563919, -3.167647, 1, 0.01176471, 0, 1,
-2.836029, -0.7712984, -2.638662, 1, 0.01960784, 0, 1,
-2.722425, 0.3551926, -2.738282, 1, 0.02352941, 0, 1,
-2.694878, 0.3923216, -2.276968, 1, 0.03137255, 0, 1,
-2.639632, 0.7996041, -1.057302, 1, 0.03529412, 0, 1,
-2.588507, 0.8652873, -0.8595554, 1, 0.04313726, 0, 1,
-2.570426, 0.6598369, -0.9343714, 1, 0.04705882, 0, 1,
-2.545272, 0.4805542, -1.861476, 1, 0.05490196, 0, 1,
-2.439437, -1.787801, -3.173887, 1, 0.05882353, 0, 1,
-2.394222, 0.1351392, -2.066059, 1, 0.06666667, 0, 1,
-2.381652, 2.348537, -0.325316, 1, 0.07058824, 0, 1,
-2.337065, 0.1651476, 0.1019459, 1, 0.07843138, 0, 1,
-2.321935, 0.1534803, -0.4079539, 1, 0.08235294, 0, 1,
-2.290299, -1.5519, -2.740927, 1, 0.09019608, 0, 1,
-2.272589, -1.051648, -0.8655607, 1, 0.09411765, 0, 1,
-2.250425, -2.052592, -0.9033067, 1, 0.1019608, 0, 1,
-2.181416, -0.3336447, -0.7197279, 1, 0.1098039, 0, 1,
-2.165849, -0.9021632, -1.926047, 1, 0.1137255, 0, 1,
-2.155996, -1.443308, -0.8169996, 1, 0.1215686, 0, 1,
-2.143113, 1.019681, -1.346535, 1, 0.1254902, 0, 1,
-2.073137, -0.0937056, 0.9832597, 1, 0.1333333, 0, 1,
-2.03126, -0.5779854, -2.996132, 1, 0.1372549, 0, 1,
-2.010238, 1.706364, 1.120216, 1, 0.145098, 0, 1,
-2.008804, 2.038637, -1.469357, 1, 0.1490196, 0, 1,
-1.982698, 0.602592, -1.006733, 1, 0.1568628, 0, 1,
-1.981991, 1.321834, 0.1962954, 1, 0.1607843, 0, 1,
-1.956902, -1.206016, -2.88678, 1, 0.1686275, 0, 1,
-1.950312, 1.263882, 0.01010765, 1, 0.172549, 0, 1,
-1.941181, 1.081518, -0.8937647, 1, 0.1803922, 0, 1,
-1.930351, -2.052924, -3.86429, 1, 0.1843137, 0, 1,
-1.924201, 0.890829, -1.302883, 1, 0.1921569, 0, 1,
-1.897716, -1.738199, -2.705888, 1, 0.1960784, 0, 1,
-1.89667, -0.1105453, -1.141575, 1, 0.2039216, 0, 1,
-1.891913, 0.2626421, -1.941512, 1, 0.2117647, 0, 1,
-1.87315, -0.3641989, -0.799181, 1, 0.2156863, 0, 1,
-1.8589, 2.339746, -1.06958, 1, 0.2235294, 0, 1,
-1.831689, 0.7621309, -2.547976, 1, 0.227451, 0, 1,
-1.830478, -0.1119112, -2.331521, 1, 0.2352941, 0, 1,
-1.810156, 0.09431871, -2.86507, 1, 0.2392157, 0, 1,
-1.803273, 0.08649082, -2.975141, 1, 0.2470588, 0, 1,
-1.8032, -0.9128811, -1.733868, 1, 0.2509804, 0, 1,
-1.800409, 1.092376, -1.400397, 1, 0.2588235, 0, 1,
-1.781986, 1.122933, -2.51643, 1, 0.2627451, 0, 1,
-1.774624, -1.588683, -3.351474, 1, 0.2705882, 0, 1,
-1.740601, -0.9887064, -0.02179118, 1, 0.2745098, 0, 1,
-1.739771, 0.5344207, -2.472035, 1, 0.282353, 0, 1,
-1.733365, -0.2899544, -1.753011, 1, 0.2862745, 0, 1,
-1.708981, -1.169594, -1.956591, 1, 0.2941177, 0, 1,
-1.702699, 1.034778, -1.137767, 1, 0.3019608, 0, 1,
-1.684077, -2.513768, -1.882742, 1, 0.3058824, 0, 1,
-1.668659, -0.4753729, -1.549499, 1, 0.3137255, 0, 1,
-1.662533, -0.7037246, -1.86387, 1, 0.3176471, 0, 1,
-1.660513, -0.8739894, -3.479289, 1, 0.3254902, 0, 1,
-1.645459, -0.1159031, -2.087621, 1, 0.3294118, 0, 1,
-1.641933, 1.232754, -2.727071, 1, 0.3372549, 0, 1,
-1.641677, -1.44359, -1.427902, 1, 0.3411765, 0, 1,
-1.625986, 1.747502, -1.699567, 1, 0.3490196, 0, 1,
-1.60807, -0.4144076, -1.741644, 1, 0.3529412, 0, 1,
-1.594941, -2.145932, -1.904467, 1, 0.3607843, 0, 1,
-1.576807, 0.7235592, 0.3368681, 1, 0.3647059, 0, 1,
-1.575225, -0.7217325, 0.1751832, 1, 0.372549, 0, 1,
-1.555219, -1.024065, -1.928067, 1, 0.3764706, 0, 1,
-1.554438, 0.1281841, -1.190256, 1, 0.3843137, 0, 1,
-1.537572, -0.8690097, -1.830129, 1, 0.3882353, 0, 1,
-1.534093, 0.7290667, -1.867512, 1, 0.3960784, 0, 1,
-1.482994, -1.673267, -2.714821, 1, 0.4039216, 0, 1,
-1.475883, 0.02201121, -1.440093, 1, 0.4078431, 0, 1,
-1.471831, -0.4325383, -0.6499613, 1, 0.4156863, 0, 1,
-1.461904, 1.13473, -0.02641105, 1, 0.4196078, 0, 1,
-1.437846, 0.9076182, -1.611459, 1, 0.427451, 0, 1,
-1.431855, -0.594502, -1.126067, 1, 0.4313726, 0, 1,
-1.419365, 0.8470083, -2.521074, 1, 0.4392157, 0, 1,
-1.401368, -1.214178, -3.287604, 1, 0.4431373, 0, 1,
-1.398094, -0.5453996, -2.317503, 1, 0.4509804, 0, 1,
-1.387376, 0.5978471, -1.101421, 1, 0.454902, 0, 1,
-1.383019, 0.7014421, -1.114751, 1, 0.4627451, 0, 1,
-1.360451, -0.3485322, -1.054818, 1, 0.4666667, 0, 1,
-1.358583, -0.07660449, -2.233327, 1, 0.4745098, 0, 1,
-1.358188, 0.7283038, -0.8255647, 1, 0.4784314, 0, 1,
-1.348566, 0.44541, -3.12788, 1, 0.4862745, 0, 1,
-1.344574, 0.09111638, -0.5878434, 1, 0.4901961, 0, 1,
-1.341234, 1.139531, -1.394194, 1, 0.4980392, 0, 1,
-1.332857, 0.4738572, -1.289455, 1, 0.5058824, 0, 1,
-1.30546, 1.636195, -1.248693, 1, 0.509804, 0, 1,
-1.298123, -0.2557771, -2.288409, 1, 0.5176471, 0, 1,
-1.291364, -0.06545445, -0.4074388, 1, 0.5215687, 0, 1,
-1.289648, -0.1604713, -1.955156, 1, 0.5294118, 0, 1,
-1.275292, 0.1025286, -0.7999825, 1, 0.5333334, 0, 1,
-1.261454, -1.877198, -2.234498, 1, 0.5411765, 0, 1,
-1.255856, -0.9048488, -1.665293, 1, 0.5450981, 0, 1,
-1.250917, -0.1282123, -1.087005, 1, 0.5529412, 0, 1,
-1.249939, -1.223464, -0.7853405, 1, 0.5568628, 0, 1,
-1.24946, -0.2512192, -2.016887, 1, 0.5647059, 0, 1,
-1.248692, -0.1158931, -1.430042, 1, 0.5686275, 0, 1,
-1.234575, -0.09465515, -2.345727, 1, 0.5764706, 0, 1,
-1.223162, -0.3462185, -3.349813, 1, 0.5803922, 0, 1,
-1.222853, 0.02381283, -0.8499988, 1, 0.5882353, 0, 1,
-1.215801, -0.2449908, -2.856417, 1, 0.5921569, 0, 1,
-1.215587, 0.9975331, 0.2058119, 1, 0.6, 0, 1,
-1.214998, -0.3927989, -2.21079, 1, 0.6078432, 0, 1,
-1.211159, 1.283898, -0.9234281, 1, 0.6117647, 0, 1,
-1.20071, -0.3330023, 0.8035929, 1, 0.6196079, 0, 1,
-1.198803, -0.006814321, -1.718977, 1, 0.6235294, 0, 1,
-1.195065, 0.6232991, -1.388642, 1, 0.6313726, 0, 1,
-1.193932, -0.7718933, -2.928896, 1, 0.6352941, 0, 1,
-1.17263, 0.9052812, -1.767455, 1, 0.6431373, 0, 1,
-1.171573, 0.1317902, -2.058056, 1, 0.6470588, 0, 1,
-1.169259, 0.6550692, -2.12056, 1, 0.654902, 0, 1,
-1.167093, -2.246224, -2.050754, 1, 0.6588235, 0, 1,
-1.165842, 0.8243769, -0.3950622, 1, 0.6666667, 0, 1,
-1.154157, -1.522304, -1.979958, 1, 0.6705883, 0, 1,
-1.152584, 0.6041092, -1.296595, 1, 0.6784314, 0, 1,
-1.142796, -0.1298669, -0.4307823, 1, 0.682353, 0, 1,
-1.134893, -0.32744, -0.3525513, 1, 0.6901961, 0, 1,
-1.131104, 0.2943813, -2.155367, 1, 0.6941177, 0, 1,
-1.130917, 1.099346, -0.6264205, 1, 0.7019608, 0, 1,
-1.130792, -1.479945, -1.156228, 1, 0.7098039, 0, 1,
-1.129209, 1.835734, -0.4098928, 1, 0.7137255, 0, 1,
-1.129138, -0.199443, -1.381117, 1, 0.7215686, 0, 1,
-1.126999, 0.3926532, -1.380486, 1, 0.7254902, 0, 1,
-1.119586, 1.245236, -1.162601, 1, 0.7333333, 0, 1,
-1.119245, 0.3434789, -2.228043, 1, 0.7372549, 0, 1,
-1.112994, 0.3605443, -0.7629444, 1, 0.7450981, 0, 1,
-1.106758, -1.08674, -2.47521, 1, 0.7490196, 0, 1,
-1.100201, 1.28207, -2.223127, 1, 0.7568628, 0, 1,
-1.100162, -0.8211324, -2.479135, 1, 0.7607843, 0, 1,
-1.094842, 1.286175, -0.3189046, 1, 0.7686275, 0, 1,
-1.083126, -0.6171403, -0.9069046, 1, 0.772549, 0, 1,
-1.077089, -0.0380384, -0.875308, 1, 0.7803922, 0, 1,
-1.070949, -1.381793, -0.5865418, 1, 0.7843137, 0, 1,
-1.069005, 0.3588201, -1.647323, 1, 0.7921569, 0, 1,
-1.068211, -1.215059, -2.169616, 1, 0.7960784, 0, 1,
-1.057332, -0.5806231, -1.4434, 1, 0.8039216, 0, 1,
-1.0561, -1.100029, -1.614581, 1, 0.8117647, 0, 1,
-1.052258, -0.445216, -1.351935, 1, 0.8156863, 0, 1,
-1.049416, 2.633054, 1.926356, 1, 0.8235294, 0, 1,
-1.044943, 1.278861, -1.035395, 1, 0.827451, 0, 1,
-1.039779, 0.3272432, 0.8168388, 1, 0.8352941, 0, 1,
-1.039365, 1.018517, -0.02917279, 1, 0.8392157, 0, 1,
-1.037875, -0.04887607, -1.78703, 1, 0.8470588, 0, 1,
-1.027663, -0.03899677, -2.360747, 1, 0.8509804, 0, 1,
-1.025578, -0.7990043, -1.07898, 1, 0.8588235, 0, 1,
-1.015709, -1.198184, -4.037663, 1, 0.8627451, 0, 1,
-1.012473, -1.194372, -2.846819, 1, 0.8705882, 0, 1,
-1.007405, 1.066604, -0.7484872, 1, 0.8745098, 0, 1,
-1.006446, -2.136499, -3.555863, 1, 0.8823529, 0, 1,
-1.006401, 2.029244, -0.1288898, 1, 0.8862745, 0, 1,
-1.002365, -0.6460577, -2.248763, 1, 0.8941177, 0, 1,
-1.001192, 0.1198521, -2.049718, 1, 0.8980392, 0, 1,
-0.9991063, -0.5534583, -0.5776451, 1, 0.9058824, 0, 1,
-0.9947246, 0.7001739, 1.435523, 1, 0.9137255, 0, 1,
-0.9931557, -0.7987734, -1.644866, 1, 0.9176471, 0, 1,
-0.9923807, -0.8112654, -2.13268, 1, 0.9254902, 0, 1,
-0.9919933, 0.0006893331, 1.007805, 1, 0.9294118, 0, 1,
-0.9898335, -0.4172096, -2.708774, 1, 0.9372549, 0, 1,
-0.9804154, 0.9692401, -1.556099, 1, 0.9411765, 0, 1,
-0.9757732, 0.3341378, -1.88029, 1, 0.9490196, 0, 1,
-0.9717951, 0.4864479, 0.1689849, 1, 0.9529412, 0, 1,
-0.9587876, -2.094459, -2.14972, 1, 0.9607843, 0, 1,
-0.9584951, 1.751854, -1.208102, 1, 0.9647059, 0, 1,
-0.9578224, 0.9226668, -1.630842, 1, 0.972549, 0, 1,
-0.9549926, -0.8543332, -4.103437, 1, 0.9764706, 0, 1,
-0.9539554, -0.6354752, -2.892633, 1, 0.9843137, 0, 1,
-0.952468, 0.07567131, -1.049443, 1, 0.9882353, 0, 1,
-0.9514627, 0.0329672, -1.819498, 1, 0.9960784, 0, 1,
-0.9418519, -0.6503338, -1.73124, 0.9960784, 1, 0, 1,
-0.9387797, 1.567842, 0.1705664, 0.9921569, 1, 0, 1,
-0.9387267, 0.7804592, -0.9265283, 0.9843137, 1, 0, 1,
-0.9338487, -0.963585, -2.726458, 0.9803922, 1, 0, 1,
-0.9308364, 0.744102, 0.07442261, 0.972549, 1, 0, 1,
-0.9249347, 0.6276675, -1.524212, 0.9686275, 1, 0, 1,
-0.9242861, 1.564668, -1.30926, 0.9607843, 1, 0, 1,
-0.9118019, 1.573792, 0.6086448, 0.9568627, 1, 0, 1,
-0.9021396, -0.6015263, -4.155713, 0.9490196, 1, 0, 1,
-0.8985987, 0.5871869, -0.9190682, 0.945098, 1, 0, 1,
-0.894936, -0.6109964, -2.365112, 0.9372549, 1, 0, 1,
-0.8934978, -0.0433019, -2.061604, 0.9333333, 1, 0, 1,
-0.8916782, -0.1519851, -0.9147459, 0.9254902, 1, 0, 1,
-0.8910985, -0.3340316, -1.769618, 0.9215686, 1, 0, 1,
-0.888834, -1.091796, -1.7032, 0.9137255, 1, 0, 1,
-0.8871694, -0.3511405, -2.555912, 0.9098039, 1, 0, 1,
-0.8841452, 0.1738222, -0.2342906, 0.9019608, 1, 0, 1,
-0.8808171, 1.517725, -1.454758, 0.8941177, 1, 0, 1,
-0.8806579, -1.752204, -3.659739, 0.8901961, 1, 0, 1,
-0.8706028, 0.7235335, -0.6598994, 0.8823529, 1, 0, 1,
-0.865944, 0.437448, -0.3620257, 0.8784314, 1, 0, 1,
-0.8622051, 1.462686, 0.4099612, 0.8705882, 1, 0, 1,
-0.8603709, -0.1087332, -1.08788, 0.8666667, 1, 0, 1,
-0.8535152, -0.4475404, -4.15015, 0.8588235, 1, 0, 1,
-0.8498183, 0.057533, -1.269804, 0.854902, 1, 0, 1,
-0.8450242, -1.269656, -3.496239, 0.8470588, 1, 0, 1,
-0.8443376, 1.260091, -0.2456486, 0.8431373, 1, 0, 1,
-0.843541, -0.6912386, -3.164944, 0.8352941, 1, 0, 1,
-0.8430665, -1.680841, -2.296657, 0.8313726, 1, 0, 1,
-0.8422377, 1.345257, -1.888135, 0.8235294, 1, 0, 1,
-0.8411193, 0.6105917, -1.410238, 0.8196079, 1, 0, 1,
-0.8343571, 0.5635247, -0.9799957, 0.8117647, 1, 0, 1,
-0.8316661, -1.150105, -5.376478, 0.8078431, 1, 0, 1,
-0.8312091, 1.056337, -0.42287, 0.8, 1, 0, 1,
-0.8290133, -0.1629022, -4.331777, 0.7921569, 1, 0, 1,
-0.8264561, 1.553808, -0.3411767, 0.7882353, 1, 0, 1,
-0.8251914, -2.214788, -3.888921, 0.7803922, 1, 0, 1,
-0.8230633, 2.07908, 0.02576754, 0.7764706, 1, 0, 1,
-0.8207864, -0.077773, -3.106218, 0.7686275, 1, 0, 1,
-0.8192711, -0.7334256, -3.267592, 0.7647059, 1, 0, 1,
-0.8174877, -1.310624, -2.44124, 0.7568628, 1, 0, 1,
-0.8118256, -0.8171299, -2.458149, 0.7529412, 1, 0, 1,
-0.8040976, 1.163109, -0.533251, 0.7450981, 1, 0, 1,
-0.7987396, 1.909021, 1.069797, 0.7411765, 1, 0, 1,
-0.7891122, 0.6347312, -1.502642, 0.7333333, 1, 0, 1,
-0.7852603, 0.1082788, -0.9033324, 0.7294118, 1, 0, 1,
-0.7816377, 1.118479, -0.9842958, 0.7215686, 1, 0, 1,
-0.7804929, 0.261665, 0.4979064, 0.7176471, 1, 0, 1,
-0.7773267, -0.3546891, 0.2496488, 0.7098039, 1, 0, 1,
-0.775865, -0.7590906, -1.37965, 0.7058824, 1, 0, 1,
-0.7724585, -1.014641, -2.339756, 0.6980392, 1, 0, 1,
-0.7696221, 2.196342, -1.264037, 0.6901961, 1, 0, 1,
-0.7672639, 1.193488, -1.290877, 0.6862745, 1, 0, 1,
-0.766968, -0.31538, -2.942478, 0.6784314, 1, 0, 1,
-0.7657307, 1.853035, -0.4227538, 0.6745098, 1, 0, 1,
-0.7638921, 1.227783, -1.117967, 0.6666667, 1, 0, 1,
-0.7632934, -0.5060496, -1.06893, 0.6627451, 1, 0, 1,
-0.7632475, 0.3506906, -1.713752, 0.654902, 1, 0, 1,
-0.7596535, 0.6884032, -2.298451, 0.6509804, 1, 0, 1,
-0.759504, -0.5525627, -0.6915063, 0.6431373, 1, 0, 1,
-0.7574666, -0.30861, -1.107396, 0.6392157, 1, 0, 1,
-0.7554418, 0.2172475, 2.473512, 0.6313726, 1, 0, 1,
-0.7507927, -0.3911813, -2.227699, 0.627451, 1, 0, 1,
-0.7499224, 0.7347951, -0.2433505, 0.6196079, 1, 0, 1,
-0.7362183, 0.6940721, -2.514024, 0.6156863, 1, 0, 1,
-0.733259, -0.7239528, -1.830611, 0.6078432, 1, 0, 1,
-0.7288185, -0.2286168, -3.084978, 0.6039216, 1, 0, 1,
-0.7282584, 1.015015, -1.956888, 0.5960785, 1, 0, 1,
-0.725095, -0.05961474, -4.166971, 0.5882353, 1, 0, 1,
-0.7241415, 0.2236073, -1.613588, 0.5843138, 1, 0, 1,
-0.7239265, -1.308021, -3.130073, 0.5764706, 1, 0, 1,
-0.7237005, -0.752738, -4.383873, 0.572549, 1, 0, 1,
-0.7103149, -0.08839978, -0.08287064, 0.5647059, 1, 0, 1,
-0.7084025, 0.7784905, -1.482487, 0.5607843, 1, 0, 1,
-0.706184, 0.7520797, -0.3189759, 0.5529412, 1, 0, 1,
-0.7055649, -1.96249, -3.562066, 0.5490196, 1, 0, 1,
-0.7047542, 0.4851062, -1.139494, 0.5411765, 1, 0, 1,
-0.7000589, -1.551362, -2.231504, 0.5372549, 1, 0, 1,
-0.6990082, -2.635058, -2.940587, 0.5294118, 1, 0, 1,
-0.6956672, -0.6705657, -2.565872, 0.5254902, 1, 0, 1,
-0.6950589, -0.7571406, -1.473622, 0.5176471, 1, 0, 1,
-0.6945465, 1.326811, -0.722111, 0.5137255, 1, 0, 1,
-0.6916217, 0.7845817, -1.468453, 0.5058824, 1, 0, 1,
-0.6890523, -0.7896584, -1.963947, 0.5019608, 1, 0, 1,
-0.6874507, 0.7546513, 0.01215232, 0.4941176, 1, 0, 1,
-0.6812899, -1.045528, -2.105879, 0.4862745, 1, 0, 1,
-0.6760528, 0.8484431, -0.432658, 0.4823529, 1, 0, 1,
-0.670845, 1.523478, -2.266851, 0.4745098, 1, 0, 1,
-0.6705338, -0.8383489, -3.532421, 0.4705882, 1, 0, 1,
-0.6691511, 0.280371, -0.9751548, 0.4627451, 1, 0, 1,
-0.6653096, 0.8334643, -0.8211244, 0.4588235, 1, 0, 1,
-0.6647214, 1.223389, 0.9281614, 0.4509804, 1, 0, 1,
-0.6645739, -2.21247, -3.580426, 0.4470588, 1, 0, 1,
-0.6637123, 0.6797885, -0.961621, 0.4392157, 1, 0, 1,
-0.6615601, -0.7915868, -1.904779, 0.4352941, 1, 0, 1,
-0.6560912, -1.05069, -2.25532, 0.427451, 1, 0, 1,
-0.6538385, 0.7577649, -0.2471801, 0.4235294, 1, 0, 1,
-0.6528439, -0.8506324, -1.632905, 0.4156863, 1, 0, 1,
-0.6500456, 1.361818, -1.427217, 0.4117647, 1, 0, 1,
-0.6475585, 0.847645, -0.2206035, 0.4039216, 1, 0, 1,
-0.6364608, 0.7240089, -0.2441262, 0.3960784, 1, 0, 1,
-0.636339, -1.259639, -2.286539, 0.3921569, 1, 0, 1,
-0.6343383, 0.5856963, -1.318603, 0.3843137, 1, 0, 1,
-0.6332028, 0.951466, -1.646233, 0.3803922, 1, 0, 1,
-0.6306415, 0.2936099, -0.537503, 0.372549, 1, 0, 1,
-0.6292595, -1.065362, -1.102001, 0.3686275, 1, 0, 1,
-0.6244804, -0.09178457, -3.058759, 0.3607843, 1, 0, 1,
-0.6241985, -1.435048, -2.829259, 0.3568628, 1, 0, 1,
-0.6221976, -1.174313, -2.751139, 0.3490196, 1, 0, 1,
-0.6221308, -1.171689, -3.902138, 0.345098, 1, 0, 1,
-0.612702, 1.666812, 0.6455041, 0.3372549, 1, 0, 1,
-0.6109464, -0.5746428, -1.742934, 0.3333333, 1, 0, 1,
-0.6108103, 0.04251774, -0.811219, 0.3254902, 1, 0, 1,
-0.6052069, 0.1584471, -0.3991542, 0.3215686, 1, 0, 1,
-0.59848, 0.5770746, -0.1047082, 0.3137255, 1, 0, 1,
-0.5982611, 0.5087335, -0.8256702, 0.3098039, 1, 0, 1,
-0.5963583, 0.4489625, -1.306961, 0.3019608, 1, 0, 1,
-0.5941924, -0.3892559, -0.715362, 0.2941177, 1, 0, 1,
-0.5932406, 0.3615262, -0.5156655, 0.2901961, 1, 0, 1,
-0.5923678, 0.7903351, -1.207668, 0.282353, 1, 0, 1,
-0.5870512, -1.701769, -1.808295, 0.2784314, 1, 0, 1,
-0.5864041, 1.367383, -0.676548, 0.2705882, 1, 0, 1,
-0.5830797, -0.034583, -1.064705, 0.2666667, 1, 0, 1,
-0.5827836, -0.136613, -2.893729, 0.2588235, 1, 0, 1,
-0.5825229, 0.1219655, -1.729532, 0.254902, 1, 0, 1,
-0.5807158, -0.6227765, -2.054473, 0.2470588, 1, 0, 1,
-0.5782641, -0.2132415, -2.399702, 0.2431373, 1, 0, 1,
-0.5766348, 2.120958, 0.6271758, 0.2352941, 1, 0, 1,
-0.5759678, 0.6646407, -0.486729, 0.2313726, 1, 0, 1,
-0.5758542, -1.087491, -2.818664, 0.2235294, 1, 0, 1,
-0.5747961, -0.1009473, -2.282562, 0.2196078, 1, 0, 1,
-0.5734131, -1.549054, -2.544701, 0.2117647, 1, 0, 1,
-0.5705892, -1.536343, -4.134771, 0.2078431, 1, 0, 1,
-0.5625576, 0.3953047, -2.484576, 0.2, 1, 0, 1,
-0.5603721, -1.147918, -4.077855, 0.1921569, 1, 0, 1,
-0.5603456, -0.7771477, -1.461793, 0.1882353, 1, 0, 1,
-0.5557176, -1.081172, -1.559664, 0.1803922, 1, 0, 1,
-0.5547947, 1.707369, 0.8919977, 0.1764706, 1, 0, 1,
-0.5526883, 0.8774421, -0.5841444, 0.1686275, 1, 0, 1,
-0.5526615, 0.3063869, 0.5007157, 0.1647059, 1, 0, 1,
-0.5514445, 1.028505, -0.7124476, 0.1568628, 1, 0, 1,
-0.5509775, -1.648134, -1.382733, 0.1529412, 1, 0, 1,
-0.5504301, -0.9734533, -2.275931, 0.145098, 1, 0, 1,
-0.548819, -1.389558, -3.341368, 0.1411765, 1, 0, 1,
-0.5475837, 0.807587, -1.747487, 0.1333333, 1, 0, 1,
-0.5456415, -0.948303, -2.855364, 0.1294118, 1, 0, 1,
-0.5417634, 1.030865, -1.363194, 0.1215686, 1, 0, 1,
-0.5331237, -0.4603602, -3.535677, 0.1176471, 1, 0, 1,
-0.5303468, -1.142144, -1.370218, 0.1098039, 1, 0, 1,
-0.5277739, 0.8887444, 0.4462838, 0.1058824, 1, 0, 1,
-0.5249603, -1.129149, -5.269797, 0.09803922, 1, 0, 1,
-0.5217534, 0.0920353, 0.8813723, 0.09019608, 1, 0, 1,
-0.5208396, -0.4910261, -2.705007, 0.08627451, 1, 0, 1,
-0.5199559, -0.9858084, -3.773355, 0.07843138, 1, 0, 1,
-0.5199546, 0.3271705, -0.9431686, 0.07450981, 1, 0, 1,
-0.5196687, -0.915151, -2.868433, 0.06666667, 1, 0, 1,
-0.5124183, 0.04558202, -0.9655756, 0.0627451, 1, 0, 1,
-0.5086634, -0.0005467456, -2.421059, 0.05490196, 1, 0, 1,
-0.5071175, 0.2801441, -3.164584, 0.05098039, 1, 0, 1,
-0.5066301, 0.367814, -1.072045, 0.04313726, 1, 0, 1,
-0.5039927, -0.9744123, -3.201126, 0.03921569, 1, 0, 1,
-0.4985981, 0.6719455, 0.5646527, 0.03137255, 1, 0, 1,
-0.490854, -1.691417, -4.000266, 0.02745098, 1, 0, 1,
-0.4753902, -0.3455748, -1.791476, 0.01960784, 1, 0, 1,
-0.4708671, 0.9476854, 0.03445989, 0.01568628, 1, 0, 1,
-0.4686576, 2.150497, -1.261397, 0.007843138, 1, 0, 1,
-0.4669921, -0.8643203, -3.119146, 0.003921569, 1, 0, 1,
-0.4649089, 0.4705238, -2.541694, 0, 1, 0.003921569, 1,
-0.4645075, -0.831247, -0.9020325, 0, 1, 0.01176471, 1,
-0.4644447, 0.7725745, -1.174572, 0, 1, 0.01568628, 1,
-0.4627022, 0.3020939, -0.7396216, 0, 1, 0.02352941, 1,
-0.4594797, -1.562576, -0.2871833, 0, 1, 0.02745098, 1,
-0.4592545, 0.3034033, -1.927924, 0, 1, 0.03529412, 1,
-0.4555399, -0.4436035, -2.45863, 0, 1, 0.03921569, 1,
-0.4553088, -0.1134675, -2.376312, 0, 1, 0.04705882, 1,
-0.454718, -0.487897, -2.821096, 0, 1, 0.05098039, 1,
-0.452022, 0.3114932, 0.2545911, 0, 1, 0.05882353, 1,
-0.4428347, -0.2494701, -2.258307, 0, 1, 0.0627451, 1,
-0.4383058, 0.1806003, -2.542415, 0, 1, 0.07058824, 1,
-0.4362337, 0.2054009, -1.480995, 0, 1, 0.07450981, 1,
-0.4360791, 0.2465667, 0.3926336, 0, 1, 0.08235294, 1,
-0.4351103, -0.411401, -2.960312, 0, 1, 0.08627451, 1,
-0.4303293, 1.141573, -1.024678, 0, 1, 0.09411765, 1,
-0.4273179, 0.06434891, 0.01773076, 0, 1, 0.1019608, 1,
-0.4234902, -0.5118944, -4.562469, 0, 1, 0.1058824, 1,
-0.4168249, -0.6059029, -3.925546, 0, 1, 0.1137255, 1,
-0.4157654, -0.3887598, -3.690605, 0, 1, 0.1176471, 1,
-0.4150458, 1.931726, -1.058059, 0, 1, 0.1254902, 1,
-0.4143701, -0.08290464, -0.8393593, 0, 1, 0.1294118, 1,
-0.4098762, -0.02308075, -2.031503, 0, 1, 0.1372549, 1,
-0.4073437, -0.6630116, -1.445264, 0, 1, 0.1411765, 1,
-0.4051661, -0.5358269, -3.10448, 0, 1, 0.1490196, 1,
-0.4018846, 0.7685668, 1.23305, 0, 1, 0.1529412, 1,
-0.398229, -0.9377902, -2.953806, 0, 1, 0.1607843, 1,
-0.3962715, 0.03512715, -3.933329, 0, 1, 0.1647059, 1,
-0.3960519, -1.095994, -2.446079, 0, 1, 0.172549, 1,
-0.3928907, -0.1094639, -0.1387554, 0, 1, 0.1764706, 1,
-0.3921266, 0.7551904, 0.05483144, 0, 1, 0.1843137, 1,
-0.3917427, -0.4142031, -1.478578, 0, 1, 0.1882353, 1,
-0.3909383, -1.044077, -5.367107, 0, 1, 0.1960784, 1,
-0.389185, -0.9034036, -4.498452, 0, 1, 0.2039216, 1,
-0.389166, -0.4522721, -2.658604, 0, 1, 0.2078431, 1,
-0.3873621, -0.4388587, -2.930561, 0, 1, 0.2156863, 1,
-0.3837626, 0.2384509, -0.7332126, 0, 1, 0.2196078, 1,
-0.3816977, 0.2981696, -1.807283, 0, 1, 0.227451, 1,
-0.3801979, -0.6132851, -3.643642, 0, 1, 0.2313726, 1,
-0.3783354, -1.336689, -4.855603, 0, 1, 0.2392157, 1,
-0.3774911, -1.516253, -2.136937, 0, 1, 0.2431373, 1,
-0.3742059, 3.274436, -0.8083466, 0, 1, 0.2509804, 1,
-0.372947, 0.5757446, 0.8093616, 0, 1, 0.254902, 1,
-0.3717817, 0.6615207, 0.8938403, 0, 1, 0.2627451, 1,
-0.3685863, 0.9013408, -1.911477, 0, 1, 0.2666667, 1,
-0.3674872, 0.853438, -0.08071186, 0, 1, 0.2745098, 1,
-0.3671782, -0.5642984, -2.725541, 0, 1, 0.2784314, 1,
-0.3655723, 2.220987, 0.5932593, 0, 1, 0.2862745, 1,
-0.3636568, 1.529351, -0.6541425, 0, 1, 0.2901961, 1,
-0.3627454, 2.016489, -0.2183522, 0, 1, 0.2980392, 1,
-0.3622715, -0.4021325, -0.2728872, 0, 1, 0.3058824, 1,
-0.3619751, -0.1350084, -1.432549, 0, 1, 0.3098039, 1,
-0.3615025, 1.379849, 1.159424, 0, 1, 0.3176471, 1,
-0.3607305, 0.2455236, -0.6004248, 0, 1, 0.3215686, 1,
-0.3596751, -0.5940609, -2.613052, 0, 1, 0.3294118, 1,
-0.3579107, -0.2197661, -3.397148, 0, 1, 0.3333333, 1,
-0.3573641, -0.3687793, -2.235317, 0, 1, 0.3411765, 1,
-0.3568617, 1.02677, -0.4441339, 0, 1, 0.345098, 1,
-0.3532215, 0.4889609, -1.779461, 0, 1, 0.3529412, 1,
-0.34786, 0.1091716, -1.710163, 0, 1, 0.3568628, 1,
-0.3444364, -2.374074, -2.269969, 0, 1, 0.3647059, 1,
-0.3444287, 0.7668861, -1.271083, 0, 1, 0.3686275, 1,
-0.3442191, -0.3236704, -2.157748, 0, 1, 0.3764706, 1,
-0.3424159, -0.03276831, -2.633089, 0, 1, 0.3803922, 1,
-0.3360004, 0.2215078, -1.362228, 0, 1, 0.3882353, 1,
-0.3355989, 1.312775, -0.8672124, 0, 1, 0.3921569, 1,
-0.3344561, -0.1158181, -1.763611, 0, 1, 0.4, 1,
-0.3330297, 1.456862, -0.9175281, 0, 1, 0.4078431, 1,
-0.3260766, 1.557515, -1.465175, 0, 1, 0.4117647, 1,
-0.3237679, 1.792238, 0.5534216, 0, 1, 0.4196078, 1,
-0.3204935, 0.9338471, 1.469405, 0, 1, 0.4235294, 1,
-0.319995, 0.3453439, -1.592038, 0, 1, 0.4313726, 1,
-0.3199625, -1.692662, -2.357948, 0, 1, 0.4352941, 1,
-0.3166511, -0.3001127, -2.500034, 0, 1, 0.4431373, 1,
-0.3133738, 0.526053, 1.28663, 0, 1, 0.4470588, 1,
-0.3115555, 0.3942389, -1.058574, 0, 1, 0.454902, 1,
-0.3075529, 0.1205, -1.295659, 0, 1, 0.4588235, 1,
-0.2986185, 0.5021119, -0.7686958, 0, 1, 0.4666667, 1,
-0.2919611, -0.02754179, -1.906921, 0, 1, 0.4705882, 1,
-0.2860896, 0.21452, -0.8097937, 0, 1, 0.4784314, 1,
-0.2858298, -1.269279, -1.702261, 0, 1, 0.4823529, 1,
-0.2855328, -0.7113598, -3.77264, 0, 1, 0.4901961, 1,
-0.2826704, 0.438986, 0.1740368, 0, 1, 0.4941176, 1,
-0.2817558, 1.203727, -0.2575812, 0, 1, 0.5019608, 1,
-0.2768201, -0.7291605, -2.827583, 0, 1, 0.509804, 1,
-0.2764796, 1.754884, 0.163484, 0, 1, 0.5137255, 1,
-0.2738837, 0.1463322, -2.22497, 0, 1, 0.5215687, 1,
-0.2697678, -0.8964002, -3.434728, 0, 1, 0.5254902, 1,
-0.2679468, 0.766277, -0.02400576, 0, 1, 0.5333334, 1,
-0.265984, -0.4011827, -2.197742, 0, 1, 0.5372549, 1,
-0.2651963, 0.8935449, -0.9010252, 0, 1, 0.5450981, 1,
-0.2651161, 0.6698913, -0.3349188, 0, 1, 0.5490196, 1,
-0.2628284, 1.196518, -0.1922764, 0, 1, 0.5568628, 1,
-0.2614986, -0.5468457, -2.140093, 0, 1, 0.5607843, 1,
-0.2417278, -0.3875268, -2.759392, 0, 1, 0.5686275, 1,
-0.2394688, 0.4625482, -0.9051682, 0, 1, 0.572549, 1,
-0.2394127, -0.03854086, -1.262287, 0, 1, 0.5803922, 1,
-0.2359283, 1.889897, -0.6442125, 0, 1, 0.5843138, 1,
-0.2295273, 0.6924456, -2.565403, 0, 1, 0.5921569, 1,
-0.2253065, 0.7196579, 0.1404872, 0, 1, 0.5960785, 1,
-0.2238576, 1.443082, -1.560549, 0, 1, 0.6039216, 1,
-0.2234365, 0.5766942, -2.151622, 0, 1, 0.6117647, 1,
-0.2218292, -1.154705, -2.664948, 0, 1, 0.6156863, 1,
-0.2204665, -1.516, -3.581876, 0, 1, 0.6235294, 1,
-0.2175244, -1.292374, -2.47026, 0, 1, 0.627451, 1,
-0.217179, 1.262871, -0.6893209, 0, 1, 0.6352941, 1,
-0.2143432, 0.762186, -1.188402, 0, 1, 0.6392157, 1,
-0.210799, -0.002836998, -1.410474, 0, 1, 0.6470588, 1,
-0.2105724, -0.7389306, -1.950784, 0, 1, 0.6509804, 1,
-0.2079013, 0.5257469, -0.3373762, 0, 1, 0.6588235, 1,
-0.204014, 0.148309, -0.1111613, 0, 1, 0.6627451, 1,
-0.202593, 0.9634449, 0.4931352, 0, 1, 0.6705883, 1,
-0.2009834, -0.1020219, -2.144373, 0, 1, 0.6745098, 1,
-0.2003797, -1.231761, -3.31481, 0, 1, 0.682353, 1,
-0.2000106, 1.086383, -2.224843, 0, 1, 0.6862745, 1,
-0.1955575, 0.4481379, -0.6797997, 0, 1, 0.6941177, 1,
-0.1952075, -2.099427, -3.103501, 0, 1, 0.7019608, 1,
-0.1887196, 2.317048, 0.05149108, 0, 1, 0.7058824, 1,
-0.1879919, -0.2304103, -1.928724, 0, 1, 0.7137255, 1,
-0.1846087, 0.1585226, 0.115037, 0, 1, 0.7176471, 1,
-0.1798904, 1.261334, -0.3892359, 0, 1, 0.7254902, 1,
-0.1750396, 0.7702881, -2.273606, 0, 1, 0.7294118, 1,
-0.1708639, 0.6431596, -0.5166727, 0, 1, 0.7372549, 1,
-0.1708498, -0.9344224, -4.042955, 0, 1, 0.7411765, 1,
-0.1698089, -0.6440216, -2.060808, 0, 1, 0.7490196, 1,
-0.1690333, 0.5049568, 0.1901838, 0, 1, 0.7529412, 1,
-0.1687129, -0.1715963, -2.87836, 0, 1, 0.7607843, 1,
-0.1608832, 0.02300155, 0.725403, 0, 1, 0.7647059, 1,
-0.1600461, -0.358323, -2.374065, 0, 1, 0.772549, 1,
-0.159944, -0.2894843, -1.294602, 0, 1, 0.7764706, 1,
-0.1546407, -0.2517262, -2.178418, 0, 1, 0.7843137, 1,
-0.1541138, -0.9262491, -3.875345, 0, 1, 0.7882353, 1,
-0.1538729, 0.3754098, 0.0747437, 0, 1, 0.7960784, 1,
-0.1524993, 0.1818078, -0.02395127, 0, 1, 0.8039216, 1,
-0.1459908, -1.027747, -4.068537, 0, 1, 0.8078431, 1,
-0.1454412, -1.111246, -4.418288, 0, 1, 0.8156863, 1,
-0.1430653, 0.6813941, 0.1449919, 0, 1, 0.8196079, 1,
-0.1410379, 1.063815, 0.5432464, 0, 1, 0.827451, 1,
-0.1375449, -2.187608, -3.438574, 0, 1, 0.8313726, 1,
-0.1364677, 0.2992873, -1.119085, 0, 1, 0.8392157, 1,
-0.1357918, -0.1530425, -1.902155, 0, 1, 0.8431373, 1,
-0.1336401, -0.617712, -4.538183, 0, 1, 0.8509804, 1,
-0.1319095, -0.8629789, -3.063059, 0, 1, 0.854902, 1,
-0.1260562, 0.4544321, -0.434445, 0, 1, 0.8627451, 1,
-0.1246087, -0.6867206, -2.072112, 0, 1, 0.8666667, 1,
-0.1220429, -0.1189663, -2.576612, 0, 1, 0.8745098, 1,
-0.1214338, 0.2674451, -0.73124, 0, 1, 0.8784314, 1,
-0.1172865, 1.392858, 0.943979, 0, 1, 0.8862745, 1,
-0.113231, 0.5345119, 0.8075871, 0, 1, 0.8901961, 1,
-0.1081305, 0.2537435, -0.5642847, 0, 1, 0.8980392, 1,
-0.1063378, -1.117809, -3.436432, 0, 1, 0.9058824, 1,
-0.1032848, 0.3686791, 0.1145023, 0, 1, 0.9098039, 1,
-0.09893081, -1.201198, -2.550437, 0, 1, 0.9176471, 1,
-0.09730854, 1.434375, 0.2214154, 0, 1, 0.9215686, 1,
-0.09526268, -1.047175, -4.018216, 0, 1, 0.9294118, 1,
-0.09321754, 0.6638376, -1.971354, 0, 1, 0.9333333, 1,
-0.09049969, -0.9153991, -1.171649, 0, 1, 0.9411765, 1,
-0.08406663, 1.026279, -1.33161, 0, 1, 0.945098, 1,
-0.08148763, 0.1858008, -0.05343261, 0, 1, 0.9529412, 1,
-0.07724496, -0.05270685, -3.314709, 0, 1, 0.9568627, 1,
-0.06663028, 0.3095562, -0.02625553, 0, 1, 0.9647059, 1,
-0.06211411, 0.7441671, -0.03075448, 0, 1, 0.9686275, 1,
-0.0565967, -0.2188203, -4.278506, 0, 1, 0.9764706, 1,
-0.05582605, 0.8356979, 0.5083789, 0, 1, 0.9803922, 1,
-0.05415892, -0.7373508, -2.225557, 0, 1, 0.9882353, 1,
-0.05245461, -0.5903549, -4.060891, 0, 1, 0.9921569, 1,
-0.04780057, -0.6056659, -4.548684, 0, 1, 1, 1,
-0.04654951, 0.1787993, 0.9611747, 0, 0.9921569, 1, 1,
-0.03930008, -2.059035, -2.491002, 0, 0.9882353, 1, 1,
-0.03791841, -1.015968, -4.368203, 0, 0.9803922, 1, 1,
-0.03771219, 0.7215674, -0.6045516, 0, 0.9764706, 1, 1,
-0.03391179, 0.2181352, -0.3622796, 0, 0.9686275, 1, 1,
-0.03300831, -0.1389174, -3.046441, 0, 0.9647059, 1, 1,
-0.03177481, -0.2810657, -4.560286, 0, 0.9568627, 1, 1,
-0.03118123, -0.7132021, -3.180497, 0, 0.9529412, 1, 1,
-0.02965215, -1.317448, -1.984273, 0, 0.945098, 1, 1,
-0.02455523, -0.9320879, -2.736441, 0, 0.9411765, 1, 1,
-0.02153601, 0.8077468, 0.371177, 0, 0.9333333, 1, 1,
-0.02000951, 0.3216234, -0.9282053, 0, 0.9294118, 1, 1,
-0.01604788, 3.22243, 0.05872632, 0, 0.9215686, 1, 1,
-0.01366948, -1.185396, -2.776338, 0, 0.9176471, 1, 1,
-0.01319728, -1.7113, -3.401239, 0, 0.9098039, 1, 1,
-0.01117562, -0.3553362, -3.3141, 0, 0.9058824, 1, 1,
-0.008315833, -2.473798, -2.841825, 0, 0.8980392, 1, 1,
-0.006270543, -0.4623417, -1.382308, 0, 0.8901961, 1, 1,
-0.005913758, 0.3016448, -0.6829379, 0, 0.8862745, 1, 1,
-0.005320953, -0.5381005, -2.848671, 0, 0.8784314, 1, 1,
-0.002934389, 1.609323, -1.204725, 0, 0.8745098, 1, 1,
-0.000473124, -0.04589656, -2.498411, 0, 0.8666667, 1, 1,
0.004141731, -0.5062039, 2.836055, 0, 0.8627451, 1, 1,
0.007325217, -0.5892612, 2.805634, 0, 0.854902, 1, 1,
0.00830393, 0.2052719, 0.119706, 0, 0.8509804, 1, 1,
0.01422273, -1.431391, 2.697996, 0, 0.8431373, 1, 1,
0.01577754, 1.328535, 0.5600801, 0, 0.8392157, 1, 1,
0.01781148, 0.4939866, -0.7762283, 0, 0.8313726, 1, 1,
0.02894266, -1.122358, 1.826893, 0, 0.827451, 1, 1,
0.02954955, -0.4874526, 2.905854, 0, 0.8196079, 1, 1,
0.03088446, 1.850167, 0.03376702, 0, 0.8156863, 1, 1,
0.03130737, 0.1708588, 0.4681742, 0, 0.8078431, 1, 1,
0.03406536, -1.251856, 3.471549, 0, 0.8039216, 1, 1,
0.03512256, -1.252647, 2.210895, 0, 0.7960784, 1, 1,
0.03808376, -0.2594785, 2.135929, 0, 0.7882353, 1, 1,
0.0382005, -1.254253, 3.354536, 0, 0.7843137, 1, 1,
0.04321667, 1.664139, -1.827625, 0, 0.7764706, 1, 1,
0.04630031, 1.191993, -0.9991569, 0, 0.772549, 1, 1,
0.0491187, -0.03699541, 2.470103, 0, 0.7647059, 1, 1,
0.0508396, -0.7130215, 2.962466, 0, 0.7607843, 1, 1,
0.05084862, -1.321476, 2.457072, 0, 0.7529412, 1, 1,
0.05427384, -0.07552499, 3.197899, 0, 0.7490196, 1, 1,
0.05676333, -1.966403, 3.709708, 0, 0.7411765, 1, 1,
0.05797915, 0.5454528, -1.010651, 0, 0.7372549, 1, 1,
0.06359081, -0.4038862, 3.36465, 0, 0.7294118, 1, 1,
0.0673763, -0.8708056, 2.460772, 0, 0.7254902, 1, 1,
0.06976419, -0.2416476, 4.628786, 0, 0.7176471, 1, 1,
0.06980505, 0.1809277, 0.2701348, 0, 0.7137255, 1, 1,
0.07018805, -0.412645, 0.9052993, 0, 0.7058824, 1, 1,
0.0710673, -0.805641, 2.603118, 0, 0.6980392, 1, 1,
0.07265734, 0.4819833, 0.2713738, 0, 0.6941177, 1, 1,
0.07986086, 1.5326, 0.2262744, 0, 0.6862745, 1, 1,
0.08083709, -0.2166585, 4.139936, 0, 0.682353, 1, 1,
0.08226441, 0.2223972, -0.236847, 0, 0.6745098, 1, 1,
0.08255117, -0.712465, 1.823056, 0, 0.6705883, 1, 1,
0.09013827, -0.2925924, 2.870008, 0, 0.6627451, 1, 1,
0.09403738, -0.5973609, 3.115565, 0, 0.6588235, 1, 1,
0.09551448, 0.04909923, 1.330388, 0, 0.6509804, 1, 1,
0.09648968, -0.3941504, 2.823133, 0, 0.6470588, 1, 1,
0.09659251, 0.6874563, 1.027428, 0, 0.6392157, 1, 1,
0.1001664, 0.006714669, 0.2735043, 0, 0.6352941, 1, 1,
0.102665, 0.4765294, -2.023555, 0, 0.627451, 1, 1,
0.1104849, 1.126749, 0.6461906, 0, 0.6235294, 1, 1,
0.1116425, 1.566465, 0.08044577, 0, 0.6156863, 1, 1,
0.1119481, 1.639459, 0.4021027, 0, 0.6117647, 1, 1,
0.1133855, 0.1975392, 0.5842084, 0, 0.6039216, 1, 1,
0.1134111, -0.1578419, 2.125659, 0, 0.5960785, 1, 1,
0.114379, 1.215934, 0.4249733, 0, 0.5921569, 1, 1,
0.1160611, -1.277908, 2.738863, 0, 0.5843138, 1, 1,
0.1165581, -1.368693, 3.476176, 0, 0.5803922, 1, 1,
0.1206685, -1.142452, 1.873587, 0, 0.572549, 1, 1,
0.1217226, -1.478531, 2.485326, 0, 0.5686275, 1, 1,
0.1232651, -1.701314, 1.896603, 0, 0.5607843, 1, 1,
0.1240024, 0.9723025, -0.4239897, 0, 0.5568628, 1, 1,
0.1287934, -0.2061803, 2.104996, 0, 0.5490196, 1, 1,
0.1290852, 0.6357111, -0.5795622, 0, 0.5450981, 1, 1,
0.129776, 0.2154823, -0.5283044, 0, 0.5372549, 1, 1,
0.1320498, -0.6513712, 3.852235, 0, 0.5333334, 1, 1,
0.1321653, 1.374175, -0.04355973, 0, 0.5254902, 1, 1,
0.1336519, 0.4103872, 0.02948585, 0, 0.5215687, 1, 1,
0.1391854, 0.1538868, 0.4806156, 0, 0.5137255, 1, 1,
0.140072, 0.6848073, 0.585245, 0, 0.509804, 1, 1,
0.1406146, 0.9315902, -0.6180651, 0, 0.5019608, 1, 1,
0.1426648, 1.647618, 0.03209827, 0, 0.4941176, 1, 1,
0.144728, -1.244096, 2.177537, 0, 0.4901961, 1, 1,
0.1512997, 0.1207319, 1.581533, 0, 0.4823529, 1, 1,
0.1518002, -1.312592, 3.08251, 0, 0.4784314, 1, 1,
0.1518784, 1.408157, -0.5894904, 0, 0.4705882, 1, 1,
0.1525547, 0.4798149, 0.6017531, 0, 0.4666667, 1, 1,
0.1561771, 0.406624, 0.4031531, 0, 0.4588235, 1, 1,
0.1562706, -0.2156143, 3.07497, 0, 0.454902, 1, 1,
0.1567985, -0.553314, 3.008138, 0, 0.4470588, 1, 1,
0.1583949, -1.109352, 1.709482, 0, 0.4431373, 1, 1,
0.16142, -2.148313, 2.745623, 0, 0.4352941, 1, 1,
0.1620284, 1.321729, 0.3981216, 0, 0.4313726, 1, 1,
0.1632361, -2.180875, 2.870949, 0, 0.4235294, 1, 1,
0.1676532, -1.702361, 3.326486, 0, 0.4196078, 1, 1,
0.1700357, 1.212851, -1.019699, 0, 0.4117647, 1, 1,
0.1702478, -0.4950137, 3.837969, 0, 0.4078431, 1, 1,
0.1772006, -0.5439774, 2.507276, 0, 0.4, 1, 1,
0.1782737, -2.435356, 3.928109, 0, 0.3921569, 1, 1,
0.1790335, 0.1631405, 2.647462, 0, 0.3882353, 1, 1,
0.1792731, -0.3029645, 4.373392, 0, 0.3803922, 1, 1,
0.1861056, 0.8068218, -0.511907, 0, 0.3764706, 1, 1,
0.1883079, 0.09560983, 0.3301916, 0, 0.3686275, 1, 1,
0.1886377, 1.166857, 0.8627803, 0, 0.3647059, 1, 1,
0.1925668, 0.3816382, 0.3258758, 0, 0.3568628, 1, 1,
0.1991073, -1.192915, 2.519672, 0, 0.3529412, 1, 1,
0.1999335, 1.270982, 0.7203313, 0, 0.345098, 1, 1,
0.1999387, -0.1029588, 2.126422, 0, 0.3411765, 1, 1,
0.2051444, -1.044587, 2.714053, 0, 0.3333333, 1, 1,
0.205521, -0.5716615, 3.285033, 0, 0.3294118, 1, 1,
0.2116514, 0.7299733, 1.963439, 0, 0.3215686, 1, 1,
0.2128865, -0.3105224, -0.485174, 0, 0.3176471, 1, 1,
0.2191961, 0.2203175, 0.271058, 0, 0.3098039, 1, 1,
0.2248709, 1.667402, 0.8767233, 0, 0.3058824, 1, 1,
0.2445154, 0.8465659, 0.3763077, 0, 0.2980392, 1, 1,
0.2591833, 1.272058, 0.7373018, 0, 0.2901961, 1, 1,
0.2604084, 1.53145, 0.1953795, 0, 0.2862745, 1, 1,
0.2673734, -0.2685813, 1.820074, 0, 0.2784314, 1, 1,
0.2684332, -0.8243667, 3.298469, 0, 0.2745098, 1, 1,
0.2691803, 1.270038, 0.6514162, 0, 0.2666667, 1, 1,
0.269546, 1.36772, 0.02470476, 0, 0.2627451, 1, 1,
0.2701153, 1.713196, 0.0720951, 0, 0.254902, 1, 1,
0.2706087, 0.6057615, 0.3761171, 0, 0.2509804, 1, 1,
0.2723412, -0.06926715, 0.9226171, 0, 0.2431373, 1, 1,
0.2737854, -1.84344, 4.091711, 0, 0.2392157, 1, 1,
0.2782638, 0.2609538, -0.5024791, 0, 0.2313726, 1, 1,
0.2837307, 1.330764, -0.5561863, 0, 0.227451, 1, 1,
0.2842472, 0.01523812, 0.3787073, 0, 0.2196078, 1, 1,
0.2860858, -0.7803521, 2.336839, 0, 0.2156863, 1, 1,
0.2872422, 1.769397, -0.4003804, 0, 0.2078431, 1, 1,
0.2888724, -0.7233202, 3.842726, 0, 0.2039216, 1, 1,
0.2941312, -0.2761763, 2.804308, 0, 0.1960784, 1, 1,
0.2951049, -0.3738369, 1.437599, 0, 0.1882353, 1, 1,
0.2964667, -2.018959, 3.035047, 0, 0.1843137, 1, 1,
0.2986622, -1.06055, 2.326999, 0, 0.1764706, 1, 1,
0.3000385, -0.2129601, 1.692703, 0, 0.172549, 1, 1,
0.3055308, 0.9368365, 1.128455, 0, 0.1647059, 1, 1,
0.3057033, -0.4237643, 4.837282, 0, 0.1607843, 1, 1,
0.3095199, 0.5956378, 0.6552843, 0, 0.1529412, 1, 1,
0.3103985, -0.484582, 2.150409, 0, 0.1490196, 1, 1,
0.3159776, -1.141744, 2.514663, 0, 0.1411765, 1, 1,
0.3164905, -1.09364, 3.493026, 0, 0.1372549, 1, 1,
0.3195886, 0.07644366, 1.354656, 0, 0.1294118, 1, 1,
0.3223804, -1.61754, 3.830038, 0, 0.1254902, 1, 1,
0.3256501, 0.6365118, 0.5188629, 0, 0.1176471, 1, 1,
0.3402692, -0.07102542, 3.65946, 0, 0.1137255, 1, 1,
0.3420197, 1.197276, -0.7996382, 0, 0.1058824, 1, 1,
0.3455115, -0.6567054, 3.499859, 0, 0.09803922, 1, 1,
0.3484545, 0.06069487, 2.743877, 0, 0.09411765, 1, 1,
0.3539778, 0.2416554, 0.6163759, 0, 0.08627451, 1, 1,
0.3590619, -1.123359, 3.143266, 0, 0.08235294, 1, 1,
0.3602647, -0.454187, 1.704775, 0, 0.07450981, 1, 1,
0.3706888, -0.5146863, 3.31848, 0, 0.07058824, 1, 1,
0.3715682, 0.07620211, 1.139974, 0, 0.0627451, 1, 1,
0.3732947, -2.828714, -0.3382978, 0, 0.05882353, 1, 1,
0.374409, -0.167293, 3.442945, 0, 0.05098039, 1, 1,
0.3756127, -0.9851097, 4.302513, 0, 0.04705882, 1, 1,
0.3770768, 0.1851634, 1.235144, 0, 0.03921569, 1, 1,
0.3822811, -1.303199, 1.993037, 0, 0.03529412, 1, 1,
0.3827086, 0.7592818, 0.7547771, 0, 0.02745098, 1, 1,
0.3834541, -1.333323, 3.139598, 0, 0.02352941, 1, 1,
0.3870073, 1.446175, -0.1808306, 0, 0.01568628, 1, 1,
0.3897064, -0.5191261, 0.5768054, 0, 0.01176471, 1, 1,
0.3901793, -1.217653, 3.062071, 0, 0.003921569, 1, 1,
0.3982136, -0.476235, 3.06139, 0.003921569, 0, 1, 1,
0.3982716, 0.9133, 1.444672, 0.007843138, 0, 1, 1,
0.4004348, -1.338809, 4.080473, 0.01568628, 0, 1, 1,
0.4075775, -2.11557, 3.884918, 0.01960784, 0, 1, 1,
0.4085615, -0.916202, 2.330073, 0.02745098, 0, 1, 1,
0.4097219, 0.459056, 0.5233288, 0.03137255, 0, 1, 1,
0.4151212, -0.1943053, 3.87915, 0.03921569, 0, 1, 1,
0.416153, 1.22341, 0.06633841, 0.04313726, 0, 1, 1,
0.4163237, -0.03548238, 3.430088, 0.05098039, 0, 1, 1,
0.4228797, -2.455675, 4.079514, 0.05490196, 0, 1, 1,
0.4273249, 0.2557261, -0.6886805, 0.0627451, 0, 1, 1,
0.4273994, -1.475759, 3.194792, 0.06666667, 0, 1, 1,
0.4297008, -0.5279905, 2.951016, 0.07450981, 0, 1, 1,
0.4298586, 0.4331194, 0.626131, 0.07843138, 0, 1, 1,
0.4339268, -1.151085, 3.123319, 0.08627451, 0, 1, 1,
0.4379269, 0.9926975, 0.08716192, 0.09019608, 0, 1, 1,
0.4427745, -0.03787692, 0.9383051, 0.09803922, 0, 1, 1,
0.4431329, -0.9402617, 1.610484, 0.1058824, 0, 1, 1,
0.4441629, -0.7819388, 2.157762, 0.1098039, 0, 1, 1,
0.4466125, 0.7962906, 0.3016133, 0.1176471, 0, 1, 1,
0.4507799, -1.206079, 3.672211, 0.1215686, 0, 1, 1,
0.4511626, 1.465643, 2.19166, 0.1294118, 0, 1, 1,
0.4582508, -1.117784, 2.615849, 0.1333333, 0, 1, 1,
0.4600752, -1.088894, 2.492616, 0.1411765, 0, 1, 1,
0.460082, -1.458462, 4.093354, 0.145098, 0, 1, 1,
0.4623646, -0.1360094, 1.400852, 0.1529412, 0, 1, 1,
0.4624233, -1.250289, 2.658892, 0.1568628, 0, 1, 1,
0.4635007, -0.3479719, 1.030072, 0.1647059, 0, 1, 1,
0.4635415, 1.006935, 1.355656, 0.1686275, 0, 1, 1,
0.4722823, 2.028266, 2.542081, 0.1764706, 0, 1, 1,
0.4761478, 0.8932531, 1.947577, 0.1803922, 0, 1, 1,
0.4780971, 0.3172971, -0.7126971, 0.1882353, 0, 1, 1,
0.4874184, 1.590777, -1.517866, 0.1921569, 0, 1, 1,
0.4911015, 1.966755, 1.178793, 0.2, 0, 1, 1,
0.4962132, 0.5929849, -1.390185, 0.2078431, 0, 1, 1,
0.4977985, 2.465374, 0.4567618, 0.2117647, 0, 1, 1,
0.5001695, -1.464963, 2.056657, 0.2196078, 0, 1, 1,
0.5024448, 1.84171, 0.8497847, 0.2235294, 0, 1, 1,
0.5070086, 0.02035938, 1.140496, 0.2313726, 0, 1, 1,
0.5153212, 0.1041474, 0.3983599, 0.2352941, 0, 1, 1,
0.5178788, 0.4480806, 0.2016069, 0.2431373, 0, 1, 1,
0.5180968, 0.07498206, 1.57039, 0.2470588, 0, 1, 1,
0.5196707, 2.05197, -1.402686, 0.254902, 0, 1, 1,
0.5230551, 0.4841924, 0.3338487, 0.2588235, 0, 1, 1,
0.525217, 0.2826132, -0.3806591, 0.2666667, 0, 1, 1,
0.525777, 0.9237286, -1.787316, 0.2705882, 0, 1, 1,
0.5343288, 0.3965455, 2.094553, 0.2784314, 0, 1, 1,
0.5349888, -1.939868, 2.631238, 0.282353, 0, 1, 1,
0.5373063, 0.5879681, 0.264491, 0.2901961, 0, 1, 1,
0.5407845, 1.432836, 1.07358, 0.2941177, 0, 1, 1,
0.5512841, 0.4385965, 2.445992, 0.3019608, 0, 1, 1,
0.552191, 1.095641, 0.9609615, 0.3098039, 0, 1, 1,
0.5554076, -2.5695, 2.218101, 0.3137255, 0, 1, 1,
0.5655056, 1.505394, -0.4329254, 0.3215686, 0, 1, 1,
0.5659055, 0.1258838, 2.217618, 0.3254902, 0, 1, 1,
0.5726634, 0.3913438, 0.5836194, 0.3333333, 0, 1, 1,
0.582074, -0.2186224, 2.824619, 0.3372549, 0, 1, 1,
0.5825141, 0.3549536, -0.06842514, 0.345098, 0, 1, 1,
0.5853316, 0.7935321, -0.08010115, 0.3490196, 0, 1, 1,
0.5863103, -2.511405, 4.289584, 0.3568628, 0, 1, 1,
0.5909659, -0.1073955, 1.301762, 0.3607843, 0, 1, 1,
0.5921322, 2.180949, 1.665665, 0.3686275, 0, 1, 1,
0.5926468, -0.4080946, 3.928825, 0.372549, 0, 1, 1,
0.5927731, 0.2196843, -1.017208, 0.3803922, 0, 1, 1,
0.5940614, -0.167282, 0.5185226, 0.3843137, 0, 1, 1,
0.5953354, -1.380586, 2.905699, 0.3921569, 0, 1, 1,
0.5980535, 0.05118893, 1.914907, 0.3960784, 0, 1, 1,
0.5982324, -0.1409531, 0.8774144, 0.4039216, 0, 1, 1,
0.6019588, -0.1144525, 1.932722, 0.4117647, 0, 1, 1,
0.6075109, 0.1798343, 1.687823, 0.4156863, 0, 1, 1,
0.6132199, -0.6265251, 3.062836, 0.4235294, 0, 1, 1,
0.6151493, -2.069061, 3.665664, 0.427451, 0, 1, 1,
0.6195983, 1.10403, 0.9086323, 0.4352941, 0, 1, 1,
0.6215457, 1.513358, 1.405457, 0.4392157, 0, 1, 1,
0.6240398, 1.267729, 0.2881043, 0.4470588, 0, 1, 1,
0.6246524, 0.1435134, 0.4504745, 0.4509804, 0, 1, 1,
0.629244, -1.446225, 0.7746776, 0.4588235, 0, 1, 1,
0.6311498, -0.2381428, 1.610865, 0.4627451, 0, 1, 1,
0.6337922, 0.5613564, -0.8682965, 0.4705882, 0, 1, 1,
0.6366114, 1.44217, 0.8343079, 0.4745098, 0, 1, 1,
0.6390465, 0.6261535, -0.1141132, 0.4823529, 0, 1, 1,
0.6503654, 0.1858912, 0.3444371, 0.4862745, 0, 1, 1,
0.6572717, 0.05599627, 1.806258, 0.4941176, 0, 1, 1,
0.6573481, -1.501901, 4.36846, 0.5019608, 0, 1, 1,
0.6594467, 0.05840434, 1.788105, 0.5058824, 0, 1, 1,
0.6599257, 0.7032282, 0.5557625, 0.5137255, 0, 1, 1,
0.6632565, -0.6680211, 2.09912, 0.5176471, 0, 1, 1,
0.6672903, -0.3251739, -1.135991, 0.5254902, 0, 1, 1,
0.6675491, 0.6377171, 2.725474, 0.5294118, 0, 1, 1,
0.6677385, 1.654085, -0.6575317, 0.5372549, 0, 1, 1,
0.6692321, 1.507773, 0.7947578, 0.5411765, 0, 1, 1,
0.6741969, -0.1215432, 2.036112, 0.5490196, 0, 1, 1,
0.6809683, -1.716219, 3.388169, 0.5529412, 0, 1, 1,
0.6819175, 1.216803, 1.240619, 0.5607843, 0, 1, 1,
0.6910074, -0.2364059, 1.174235, 0.5647059, 0, 1, 1,
0.6933135, 0.5373299, 0.4846745, 0.572549, 0, 1, 1,
0.693534, -0.2492654, 3.222879, 0.5764706, 0, 1, 1,
0.6946967, 0.1837507, 2.202045, 0.5843138, 0, 1, 1,
0.6988813, 0.4457307, 2.044421, 0.5882353, 0, 1, 1,
0.7040832, 0.8625702, 1.492257, 0.5960785, 0, 1, 1,
0.7062749, 0.1413251, 2.182375, 0.6039216, 0, 1, 1,
0.7095729, 0.3505242, 0.2981966, 0.6078432, 0, 1, 1,
0.7104259, -0.4519445, 1.168698, 0.6156863, 0, 1, 1,
0.71158, 0.6230044, -1.377674, 0.6196079, 0, 1, 1,
0.7138537, 0.77773, -0.4077334, 0.627451, 0, 1, 1,
0.7146674, 2.254817, -0.2510865, 0.6313726, 0, 1, 1,
0.7164373, 0.002484141, 1.151802, 0.6392157, 0, 1, 1,
0.7183654, 1.698738, 1.789481, 0.6431373, 0, 1, 1,
0.7190502, -0.2251687, 1.610792, 0.6509804, 0, 1, 1,
0.7213253, 1.003655, 1.264141, 0.654902, 0, 1, 1,
0.7249122, 0.2725023, 1.633357, 0.6627451, 0, 1, 1,
0.7293805, 0.535923, 1.082743, 0.6666667, 0, 1, 1,
0.7301083, -0.5682384, 3.824693, 0.6745098, 0, 1, 1,
0.7358786, -0.633562, 3.158099, 0.6784314, 0, 1, 1,
0.7363835, -1.136879, 2.554917, 0.6862745, 0, 1, 1,
0.7372677, -0.7462206, 2.327863, 0.6901961, 0, 1, 1,
0.7386981, -0.1999126, -0.06673313, 0.6980392, 0, 1, 1,
0.7414293, -0.7803888, 3.501268, 0.7058824, 0, 1, 1,
0.75223, -1.358523, 1.372937, 0.7098039, 0, 1, 1,
0.7583725, 0.3199388, 1.560562, 0.7176471, 0, 1, 1,
0.7592397, -0.7550923, 2.011844, 0.7215686, 0, 1, 1,
0.7746473, -1.199757, 2.282816, 0.7294118, 0, 1, 1,
0.7794548, 0.02547215, 2.073565, 0.7333333, 0, 1, 1,
0.7797743, -2.651045, 2.091897, 0.7411765, 0, 1, 1,
0.7821627, 0.8178845, -2.393123, 0.7450981, 0, 1, 1,
0.7821949, -0.45983, 2.015662, 0.7529412, 0, 1, 1,
0.7827374, 0.5275428, 1.052059, 0.7568628, 0, 1, 1,
0.7830092, 0.2470943, 2.468751, 0.7647059, 0, 1, 1,
0.7844385, -0.6358664, 2.488558, 0.7686275, 0, 1, 1,
0.7944792, 0.403522, 1.069016, 0.7764706, 0, 1, 1,
0.7968918, -2.837695, 1.755421, 0.7803922, 0, 1, 1,
0.800221, 2.704615, -0.1246717, 0.7882353, 0, 1, 1,
0.8022406, -0.3146865, 1.707964, 0.7921569, 0, 1, 1,
0.8114574, 1.814817, 1.003074, 0.8, 0, 1, 1,
0.8174515, -1.078479, 2.073773, 0.8078431, 0, 1, 1,
0.8266519, -1.04532, 3.465553, 0.8117647, 0, 1, 1,
0.8271635, 0.4021133, 0.4885603, 0.8196079, 0, 1, 1,
0.8307518, 0.7028286, 1.720937, 0.8235294, 0, 1, 1,
0.8314385, 0.09037589, 3.910403, 0.8313726, 0, 1, 1,
0.8356897, -0.2048456, 1.151088, 0.8352941, 0, 1, 1,
0.8371506, 0.9300697, -0.5652508, 0.8431373, 0, 1, 1,
0.8393078, 0.3859797, 1.757305, 0.8470588, 0, 1, 1,
0.8446748, 0.2627977, 0.3514173, 0.854902, 0, 1, 1,
0.84719, -0.194352, 1.309855, 0.8588235, 0, 1, 1,
0.8555144, 0.4537412, 1.482055, 0.8666667, 0, 1, 1,
0.8575916, 0.1891889, -1.438832, 0.8705882, 0, 1, 1,
0.8623418, -0.2153404, 3.421853, 0.8784314, 0, 1, 1,
0.8643171, 0.09765188, -0.6739264, 0.8823529, 0, 1, 1,
0.8667417, 0.1167805, 0.6903941, 0.8901961, 0, 1, 1,
0.8766991, -1.270268, 0.7878603, 0.8941177, 0, 1, 1,
0.8794389, -0.6725215, 3.423183, 0.9019608, 0, 1, 1,
0.8870896, 0.1279752, 0.5239925, 0.9098039, 0, 1, 1,
0.8996322, -0.6732577, 4.260205, 0.9137255, 0, 1, 1,
0.9003522, 0.5973597, 2.749064, 0.9215686, 0, 1, 1,
0.9110232, -0.3714907, 2.189187, 0.9254902, 0, 1, 1,
0.9112932, -0.4828572, 1.64022, 0.9333333, 0, 1, 1,
0.9133145, 0.326086, -0.391937, 0.9372549, 0, 1, 1,
0.9199303, 0.4616817, 0.7893326, 0.945098, 0, 1, 1,
0.9241517, 0.04619329, 1.400241, 0.9490196, 0, 1, 1,
0.9264842, 1.432949, 2.356444, 0.9568627, 0, 1, 1,
0.9272729, 0.8516941, 1.279565, 0.9607843, 0, 1, 1,
0.9375072, -0.2627625, 0.3452722, 0.9686275, 0, 1, 1,
0.9440588, 0.1616081, 1.245755, 0.972549, 0, 1, 1,
0.9453109, 0.3437758, 3.562294, 0.9803922, 0, 1, 1,
0.9471977, -0.3369836, 3.003093, 0.9843137, 0, 1, 1,
0.9621173, 0.2006635, 0.1390133, 0.9921569, 0, 1, 1,
0.9702507, 0.3986587, 1.501852, 0.9960784, 0, 1, 1,
0.9741879, -0.109358, 2.518486, 1, 0, 0.9960784, 1,
0.9758177, -0.8209857, -0.1874909, 1, 0, 0.9882353, 1,
0.9777734, 0.9570872, 0.8511008, 1, 0, 0.9843137, 1,
0.9927684, -0.2394729, 1.570968, 1, 0, 0.9764706, 1,
0.9928764, 1.284623, 1.596476, 1, 0, 0.972549, 1,
0.9937918, -1.170294, 1.075806, 1, 0, 0.9647059, 1,
1.003108, 1.956001, -0.6229966, 1, 0, 0.9607843, 1,
1.005851, -0.8621591, 4.192434, 1, 0, 0.9529412, 1,
1.009659, -1.060151, 2.374045, 1, 0, 0.9490196, 1,
1.010273, 0.6867741, 0.1372971, 1, 0, 0.9411765, 1,
1.011773, 0.8866611, 1.138319, 1, 0, 0.9372549, 1,
1.013179, -0.8649885, 1.556989, 1, 0, 0.9294118, 1,
1.015375, 0.04735342, 2.108473, 1, 0, 0.9254902, 1,
1.016638, 0.5401171, -0.8114659, 1, 0, 0.9176471, 1,
1.024768, -0.8446842, 0.3565353, 1, 0, 0.9137255, 1,
1.028964, 0.9704506, 1.176496, 1, 0, 0.9058824, 1,
1.037529, -2.191537, 2.410795, 1, 0, 0.9019608, 1,
1.054119, 0.2020992, 0.859484, 1, 0, 0.8941177, 1,
1.055792, -1.732317, 4.417627, 1, 0, 0.8862745, 1,
1.058056, -0.1021176, 1.759652, 1, 0, 0.8823529, 1,
1.076748, -0.1569198, -1.269828, 1, 0, 0.8745098, 1,
1.088449, -0.1440634, 2.107541, 1, 0, 0.8705882, 1,
1.089121, 0.3751275, 2.884303, 1, 0, 0.8627451, 1,
1.094352, -0.4301333, 4.083606, 1, 0, 0.8588235, 1,
1.100073, 0.8969932, 1.562608, 1, 0, 0.8509804, 1,
1.104963, -1.559089, 0.8154317, 1, 0, 0.8470588, 1,
1.105446, -0.6587219, 3.173979, 1, 0, 0.8392157, 1,
1.118813, 0.2804234, 0.7977241, 1, 0, 0.8352941, 1,
1.123017, -0.4107204, 0.5840222, 1, 0, 0.827451, 1,
1.129039, -1.684802, 1.697962, 1, 0, 0.8235294, 1,
1.131415, -0.2117835, 0.9011437, 1, 0, 0.8156863, 1,
1.141012, -0.1645922, 1.15773, 1, 0, 0.8117647, 1,
1.141335, -0.4799762, 2.397948, 1, 0, 0.8039216, 1,
1.14346, 0.0789438, 2.005083, 1, 0, 0.7960784, 1,
1.146878, -0.05850842, 2.320306, 1, 0, 0.7921569, 1,
1.1495, -0.6949428, 2.82643, 1, 0, 0.7843137, 1,
1.149642, 0.5979571, 1.927094, 1, 0, 0.7803922, 1,
1.162521, -1.53479, 0.9531104, 1, 0, 0.772549, 1,
1.167307, -1.506264, 2.299311, 1, 0, 0.7686275, 1,
1.168329, 0.2421602, 1.540996, 1, 0, 0.7607843, 1,
1.173954, -0.9266942, 0.9421157, 1, 0, 0.7568628, 1,
1.179924, -0.7958642, 1.156953, 1, 0, 0.7490196, 1,
1.183923, 0.4313183, 1.434382, 1, 0, 0.7450981, 1,
1.185652, 1.081081, -0.2542092, 1, 0, 0.7372549, 1,
1.193192, -0.2911892, 1.97257, 1, 0, 0.7333333, 1,
1.195418, -0.3486431, 2.187487, 1, 0, 0.7254902, 1,
1.203182, 1.283459, 1.001242, 1, 0, 0.7215686, 1,
1.208953, 0.4560119, 1.843231, 1, 0, 0.7137255, 1,
1.209437, 0.0513882, 1.148743, 1, 0, 0.7098039, 1,
1.211952, 0.8618462, -0.06241119, 1, 0, 0.7019608, 1,
1.212657, -0.2619069, 0.3429136, 1, 0, 0.6941177, 1,
1.235163, -0.4358608, 1.285043, 1, 0, 0.6901961, 1,
1.235341, -1.134, 3.699391, 1, 0, 0.682353, 1,
1.242296, 0.2846782, 1.499598, 1, 0, 0.6784314, 1,
1.243466, 1.145273, 0.06173031, 1, 0, 0.6705883, 1,
1.252119, -0.4263618, 2.489236, 1, 0, 0.6666667, 1,
1.252439, -0.2231701, 0.6811971, 1, 0, 0.6588235, 1,
1.252679, 0.38997, 0.79642, 1, 0, 0.654902, 1,
1.259674, -0.8337128, 2.710547, 1, 0, 0.6470588, 1,
1.267214, 0.2459585, 2.542161, 1, 0, 0.6431373, 1,
1.269332, 0.07755388, 0.9374108, 1, 0, 0.6352941, 1,
1.284215, 2.318189, 1.605489, 1, 0, 0.6313726, 1,
1.284252, -0.121023, 0.4175957, 1, 0, 0.6235294, 1,
1.286361, 0.3000833, 1.167317, 1, 0, 0.6196079, 1,
1.286574, -2.982097, 3.020985, 1, 0, 0.6117647, 1,
1.296136, -1.574366, 2.860701, 1, 0, 0.6078432, 1,
1.309384, 0.5452079, 3.843007, 1, 0, 0.6, 1,
1.31126, 0.5787179, 1.738343, 1, 0, 0.5921569, 1,
1.3131, 1.650169, 0.2344511, 1, 0, 0.5882353, 1,
1.316522, 0.3971194, -1.262227, 1, 0, 0.5803922, 1,
1.323113, 1.776924, 2.047963, 1, 0, 0.5764706, 1,
1.332385, -0.1879638, 1.25317, 1, 0, 0.5686275, 1,
1.345374, 0.5274538, -0.06427424, 1, 0, 0.5647059, 1,
1.347057, 0.3653064, -0.6313453, 1, 0, 0.5568628, 1,
1.367474, 0.2166361, 0.8077213, 1, 0, 0.5529412, 1,
1.378613, -0.2225271, 3.810729, 1, 0, 0.5450981, 1,
1.384711, -0.4023323, 0.9257758, 1, 0, 0.5411765, 1,
1.38529, 0.5749118, 2.344066, 1, 0, 0.5333334, 1,
1.388163, 0.5815504, 1.016531, 1, 0, 0.5294118, 1,
1.389691, 0.05453146, 2.435252, 1, 0, 0.5215687, 1,
1.392269, -0.3366899, 0.6194878, 1, 0, 0.5176471, 1,
1.413107, -0.1323238, 0.8150478, 1, 0, 0.509804, 1,
1.413867, 0.1471455, 0.4503883, 1, 0, 0.5058824, 1,
1.42194, 2.163666, -0.4229983, 1, 0, 0.4980392, 1,
1.433076, -0.4116351, 1.312168, 1, 0, 0.4901961, 1,
1.435599, 1.156557, 1.796579, 1, 0, 0.4862745, 1,
1.436714, 0.5041838, -0.2361228, 1, 0, 0.4784314, 1,
1.437214, -0.4552102, 2.192998, 1, 0, 0.4745098, 1,
1.44671, -0.835591, 1.92587, 1, 0, 0.4666667, 1,
1.46082, 0.4122664, 2.557833, 1, 0, 0.4627451, 1,
1.461302, 0.146303, 1.114543, 1, 0, 0.454902, 1,
1.471758, 0.9835745, 0.5975531, 1, 0, 0.4509804, 1,
1.478204, 1.337226, 0.8346497, 1, 0, 0.4431373, 1,
1.494114, 2.357105, 0.469016, 1, 0, 0.4392157, 1,
1.497967, 1.506818, 0.1523882, 1, 0, 0.4313726, 1,
1.500391, 0.07523346, 1.94955, 1, 0, 0.427451, 1,
1.505482, 1.935677, 1.315039, 1, 0, 0.4196078, 1,
1.509979, -1.098337, 2.049751, 1, 0, 0.4156863, 1,
1.513643, -0.3630817, 0.7868672, 1, 0, 0.4078431, 1,
1.531778, 0.3828413, 1.447906, 1, 0, 0.4039216, 1,
1.53422, 0.1566264, 1.473222, 1, 0, 0.3960784, 1,
1.538515, 0.01182588, -0.4750634, 1, 0, 0.3882353, 1,
1.55005, 0.5308001, 1.07456, 1, 0, 0.3843137, 1,
1.559363, 1.364686, 1.67619, 1, 0, 0.3764706, 1,
1.570721, -0.441257, 3.329185, 1, 0, 0.372549, 1,
1.57157, 2.815306, 1.251183, 1, 0, 0.3647059, 1,
1.572738, -0.725182, 1.92974, 1, 0, 0.3607843, 1,
1.574136, -0.4995134, 3.664515, 1, 0, 0.3529412, 1,
1.5834, 0.4970315, 1.933365, 1, 0, 0.3490196, 1,
1.592278, -0.4097253, 1.208474, 1, 0, 0.3411765, 1,
1.600606, -1.276699, 1.418973, 1, 0, 0.3372549, 1,
1.6099, 1.113074, 1.250695, 1, 0, 0.3294118, 1,
1.614321, -0.4971997, 1.642675, 1, 0, 0.3254902, 1,
1.619712, -0.155015, 1.851717, 1, 0, 0.3176471, 1,
1.634743, 1.359929, 2.009348, 1, 0, 0.3137255, 1,
1.663594, 1.620089, 1.298231, 1, 0, 0.3058824, 1,
1.665219, -0.3889978, 1.034817, 1, 0, 0.2980392, 1,
1.665947, 1.159472, -0.8831335, 1, 0, 0.2941177, 1,
1.676095, 0.8729109, -0.3954108, 1, 0, 0.2862745, 1,
1.682211, 0.1938176, 2.04102, 1, 0, 0.282353, 1,
1.695604, -0.9188288, 2.926069, 1, 0, 0.2745098, 1,
1.710787, -0.3614903, 3.889408, 1, 0, 0.2705882, 1,
1.725678, -0.1336126, 2.887582, 1, 0, 0.2627451, 1,
1.728191, -0.8257649, 3.29268, 1, 0, 0.2588235, 1,
1.734332, -1.125491, 2.592952, 1, 0, 0.2509804, 1,
1.753345, -0.6374657, 3.628061, 1, 0, 0.2470588, 1,
1.779965, 0.4562796, 0.8773725, 1, 0, 0.2392157, 1,
1.785733, 0.08422489, 1.359336, 1, 0, 0.2352941, 1,
1.797306, 0.6867158, 0.7471102, 1, 0, 0.227451, 1,
1.825986, -0.7616173, 1.383664, 1, 0, 0.2235294, 1,
1.83667, -0.3159664, 0.7080546, 1, 0, 0.2156863, 1,
1.843355, -0.217412, 2.259092, 1, 0, 0.2117647, 1,
1.843959, -1.48018, 2.509751, 1, 0, 0.2039216, 1,
1.917497, 1.526945, 1.664305, 1, 0, 0.1960784, 1,
1.952608, -1.95284, 0.8299643, 1, 0, 0.1921569, 1,
1.963009, -0.766621, 2.285332, 1, 0, 0.1843137, 1,
1.99166, -1.765244, 0.5556971, 1, 0, 0.1803922, 1,
2.005763, -0.3066322, 1.02704, 1, 0, 0.172549, 1,
2.014022, -1.632157, 2.075548, 1, 0, 0.1686275, 1,
2.01464, -0.1352415, 1.573808, 1, 0, 0.1607843, 1,
2.018269, -0.6674755, 3.030926, 1, 0, 0.1568628, 1,
2.043355, 0.2148225, 1.76045, 1, 0, 0.1490196, 1,
2.05448, 0.8731108, 1.366656, 1, 0, 0.145098, 1,
2.07072, -1.200669, 1.470118, 1, 0, 0.1372549, 1,
2.093342, 0.1799064, -0.8456673, 1, 0, 0.1333333, 1,
2.110015, -0.3320205, 1.309793, 1, 0, 0.1254902, 1,
2.144603, 0.5480862, 1.290692, 1, 0, 0.1215686, 1,
2.155732, -2.139847, 2.59119, 1, 0, 0.1137255, 1,
2.157373, 0.2736147, 1.076561, 1, 0, 0.1098039, 1,
2.163995, -1.101781, 2.805011, 1, 0, 0.1019608, 1,
2.181903, -2.343568, 3.398894, 1, 0, 0.09411765, 1,
2.276085, -1.214914, 1.472526, 1, 0, 0.09019608, 1,
2.282674, 1.304281, 0.9772465, 1, 0, 0.08235294, 1,
2.30145, -1.627914, 1.965674, 1, 0, 0.07843138, 1,
2.303094, 1.606382, 0.9838182, 1, 0, 0.07058824, 1,
2.329804, 0.4839909, -0.01655991, 1, 0, 0.06666667, 1,
2.35541, -1.033153, 1.358518, 1, 0, 0.05882353, 1,
2.361535, -0.392224, 1.514603, 1, 0, 0.05490196, 1,
2.377326, -0.4036703, 1.597392, 1, 0, 0.04705882, 1,
2.426953, 0.8658275, 0.2122796, 1, 0, 0.04313726, 1,
2.431138, 1.869732, 2.351766, 1, 0, 0.03529412, 1,
2.468431, 2.154246, -0.2708599, 1, 0, 0.03137255, 1,
2.629423, 1.035241, 2.107209, 1, 0, 0.02352941, 1,
2.932308, -0.7535414, 1.541405, 1, 0, 0.01960784, 1,
2.968927, -0.2843874, 3.479831, 1, 0, 0.01176471, 1,
3.11095, 1.194945, -0.09815133, 1, 0, 0.007843138, 1
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
-0.03330755, -4.04258, -7.10771, 0, -0.5, 0.5, 0.5,
-0.03330755, -4.04258, -7.10771, 1, -0.5, 0.5, 0.5,
-0.03330755, -4.04258, -7.10771, 1, 1.5, 0.5, 0.5,
-0.03330755, -4.04258, -7.10771, 0, 1.5, 0.5, 0.5
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
-4.243468, 0.1461694, -7.10771, 0, -0.5, 0.5, 0.5,
-4.243468, 0.1461694, -7.10771, 1, -0.5, 0.5, 0.5,
-4.243468, 0.1461694, -7.10771, 1, 1.5, 0.5, 0.5,
-4.243468, 0.1461694, -7.10771, 0, 1.5, 0.5, 0.5
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
-4.243468, -4.04258, -0.2695982, 0, -0.5, 0.5, 0.5,
-4.243468, -4.04258, -0.2695982, 1, -0.5, 0.5, 0.5,
-4.243468, -4.04258, -0.2695982, 1, 1.5, 0.5, 0.5,
-4.243468, -4.04258, -0.2695982, 0, 1.5, 0.5, 0.5
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
-3, -3.075945, -5.529685,
3, -3.075945, -5.529685,
-3, -3.075945, -5.529685,
-3, -3.237051, -5.792689,
-2, -3.075945, -5.529685,
-2, -3.237051, -5.792689,
-1, -3.075945, -5.529685,
-1, -3.237051, -5.792689,
0, -3.075945, -5.529685,
0, -3.237051, -5.792689,
1, -3.075945, -5.529685,
1, -3.237051, -5.792689,
2, -3.075945, -5.529685,
2, -3.237051, -5.792689,
3, -3.075945, -5.529685,
3, -3.237051, -5.792689
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
-3, -3.559263, -6.318697, 0, -0.5, 0.5, 0.5,
-3, -3.559263, -6.318697, 1, -0.5, 0.5, 0.5,
-3, -3.559263, -6.318697, 1, 1.5, 0.5, 0.5,
-3, -3.559263, -6.318697, 0, 1.5, 0.5, 0.5,
-2, -3.559263, -6.318697, 0, -0.5, 0.5, 0.5,
-2, -3.559263, -6.318697, 1, -0.5, 0.5, 0.5,
-2, -3.559263, -6.318697, 1, 1.5, 0.5, 0.5,
-2, -3.559263, -6.318697, 0, 1.5, 0.5, 0.5,
-1, -3.559263, -6.318697, 0, -0.5, 0.5, 0.5,
-1, -3.559263, -6.318697, 1, -0.5, 0.5, 0.5,
-1, -3.559263, -6.318697, 1, 1.5, 0.5, 0.5,
-1, -3.559263, -6.318697, 0, 1.5, 0.5, 0.5,
0, -3.559263, -6.318697, 0, -0.5, 0.5, 0.5,
0, -3.559263, -6.318697, 1, -0.5, 0.5, 0.5,
0, -3.559263, -6.318697, 1, 1.5, 0.5, 0.5,
0, -3.559263, -6.318697, 0, 1.5, 0.5, 0.5,
1, -3.559263, -6.318697, 0, -0.5, 0.5, 0.5,
1, -3.559263, -6.318697, 1, -0.5, 0.5, 0.5,
1, -3.559263, -6.318697, 1, 1.5, 0.5, 0.5,
1, -3.559263, -6.318697, 0, 1.5, 0.5, 0.5,
2, -3.559263, -6.318697, 0, -0.5, 0.5, 0.5,
2, -3.559263, -6.318697, 1, -0.5, 0.5, 0.5,
2, -3.559263, -6.318697, 1, 1.5, 0.5, 0.5,
2, -3.559263, -6.318697, 0, 1.5, 0.5, 0.5,
3, -3.559263, -6.318697, 0, -0.5, 0.5, 0.5,
3, -3.559263, -6.318697, 1, -0.5, 0.5, 0.5,
3, -3.559263, -6.318697, 1, 1.5, 0.5, 0.5,
3, -3.559263, -6.318697, 0, 1.5, 0.5, 0.5
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
-3.271893, -2, -5.529685,
-3.271893, 3, -5.529685,
-3.271893, -2, -5.529685,
-3.433822, -2, -5.792689,
-3.271893, -1, -5.529685,
-3.433822, -1, -5.792689,
-3.271893, 0, -5.529685,
-3.433822, 0, -5.792689,
-3.271893, 1, -5.529685,
-3.433822, 1, -5.792689,
-3.271893, 2, -5.529685,
-3.433822, 2, -5.792689,
-3.271893, 3, -5.529685,
-3.433822, 3, -5.792689
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
-3.75768, -2, -6.318697, 0, -0.5, 0.5, 0.5,
-3.75768, -2, -6.318697, 1, -0.5, 0.5, 0.5,
-3.75768, -2, -6.318697, 1, 1.5, 0.5, 0.5,
-3.75768, -2, -6.318697, 0, 1.5, 0.5, 0.5,
-3.75768, -1, -6.318697, 0, -0.5, 0.5, 0.5,
-3.75768, -1, -6.318697, 1, -0.5, 0.5, 0.5,
-3.75768, -1, -6.318697, 1, 1.5, 0.5, 0.5,
-3.75768, -1, -6.318697, 0, 1.5, 0.5, 0.5,
-3.75768, 0, -6.318697, 0, -0.5, 0.5, 0.5,
-3.75768, 0, -6.318697, 1, -0.5, 0.5, 0.5,
-3.75768, 0, -6.318697, 1, 1.5, 0.5, 0.5,
-3.75768, 0, -6.318697, 0, 1.5, 0.5, 0.5,
-3.75768, 1, -6.318697, 0, -0.5, 0.5, 0.5,
-3.75768, 1, -6.318697, 1, -0.5, 0.5, 0.5,
-3.75768, 1, -6.318697, 1, 1.5, 0.5, 0.5,
-3.75768, 1, -6.318697, 0, 1.5, 0.5, 0.5,
-3.75768, 2, -6.318697, 0, -0.5, 0.5, 0.5,
-3.75768, 2, -6.318697, 1, -0.5, 0.5, 0.5,
-3.75768, 2, -6.318697, 1, 1.5, 0.5, 0.5,
-3.75768, 2, -6.318697, 0, 1.5, 0.5, 0.5,
-3.75768, 3, -6.318697, 0, -0.5, 0.5, 0.5,
-3.75768, 3, -6.318697, 1, -0.5, 0.5, 0.5,
-3.75768, 3, -6.318697, 1, 1.5, 0.5, 0.5,
-3.75768, 3, -6.318697, 0, 1.5, 0.5, 0.5
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
-3.271893, -3.075945, -4,
-3.271893, -3.075945, 4,
-3.271893, -3.075945, -4,
-3.433822, -3.237051, -4,
-3.271893, -3.075945, -2,
-3.433822, -3.237051, -2,
-3.271893, -3.075945, 0,
-3.433822, -3.237051, 0,
-3.271893, -3.075945, 2,
-3.433822, -3.237051, 2,
-3.271893, -3.075945, 4,
-3.433822, -3.237051, 4
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
-3.75768, -3.559263, -4, 0, -0.5, 0.5, 0.5,
-3.75768, -3.559263, -4, 1, -0.5, 0.5, 0.5,
-3.75768, -3.559263, -4, 1, 1.5, 0.5, 0.5,
-3.75768, -3.559263, -4, 0, 1.5, 0.5, 0.5,
-3.75768, -3.559263, -2, 0, -0.5, 0.5, 0.5,
-3.75768, -3.559263, -2, 1, -0.5, 0.5, 0.5,
-3.75768, -3.559263, -2, 1, 1.5, 0.5, 0.5,
-3.75768, -3.559263, -2, 0, 1.5, 0.5, 0.5,
-3.75768, -3.559263, 0, 0, -0.5, 0.5, 0.5,
-3.75768, -3.559263, 0, 1, -0.5, 0.5, 0.5,
-3.75768, -3.559263, 0, 1, 1.5, 0.5, 0.5,
-3.75768, -3.559263, 0, 0, 1.5, 0.5, 0.5,
-3.75768, -3.559263, 2, 0, -0.5, 0.5, 0.5,
-3.75768, -3.559263, 2, 1, -0.5, 0.5, 0.5,
-3.75768, -3.559263, 2, 1, 1.5, 0.5, 0.5,
-3.75768, -3.559263, 2, 0, 1.5, 0.5, 0.5,
-3.75768, -3.559263, 4, 0, -0.5, 0.5, 0.5,
-3.75768, -3.559263, 4, 1, -0.5, 0.5, 0.5,
-3.75768, -3.559263, 4, 1, 1.5, 0.5, 0.5,
-3.75768, -3.559263, 4, 0, 1.5, 0.5, 0.5
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
-3.271893, -3.075945, -5.529685,
-3.271893, 3.368284, -5.529685,
-3.271893, -3.075945, 4.990488,
-3.271893, 3.368284, 4.990488,
-3.271893, -3.075945, -5.529685,
-3.271893, -3.075945, 4.990488,
-3.271893, 3.368284, -5.529685,
-3.271893, 3.368284, 4.990488,
-3.271893, -3.075945, -5.529685,
3.205277, -3.075945, -5.529685,
-3.271893, -3.075945, 4.990488,
3.205277, -3.075945, 4.990488,
-3.271893, 3.368284, -5.529685,
3.205277, 3.368284, -5.529685,
-3.271893, 3.368284, 4.990488,
3.205277, 3.368284, 4.990488,
3.205277, -3.075945, -5.529685,
3.205277, 3.368284, -5.529685,
3.205277, -3.075945, 4.990488,
3.205277, 3.368284, 4.990488,
3.205277, -3.075945, -5.529685,
3.205277, -3.075945, 4.990488,
3.205277, 3.368284, -5.529685,
3.205277, 3.368284, 4.990488
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
var radius = 7.440476;
var distance = 33.10352;
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
mvMatrix.translate( 0.03330755, -0.1461694, 0.2695982 );
mvMatrix.scale( 1.242022, 1.248371, 0.7647012 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.10352);
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
ammonium_sulphamate_<-read.table("ammonium_sulphamate_.xyz")
```

```
## Error in read.table("ammonium_sulphamate_.xyz"): no lines available in input
```

```r
x<-ammonium_sulphamate_$V2
```

```
## Error in eval(expr, envir, enclos): object 'ammonium_sulphamate_' not found
```

```r
y<-ammonium_sulphamate_$V3
```

```
## Error in eval(expr, envir, enclos): object 'ammonium_sulphamate_' not found
```

```r
z<-ammonium_sulphamate_$V4
```

```
## Error in eval(expr, envir, enclos): object 'ammonium_sulphamate_' not found
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
-3.177565, 0.9258949, -2.75398, 0, 0, 1, 1, 1,
-3.119799, 0.6047531, -1.756517, 1, 0, 0, 1, 1,
-2.991209, 0.04563919, -3.167647, 1, 0, 0, 1, 1,
-2.836029, -0.7712984, -2.638662, 1, 0, 0, 1, 1,
-2.722425, 0.3551926, -2.738282, 1, 0, 0, 1, 1,
-2.694878, 0.3923216, -2.276968, 1, 0, 0, 1, 1,
-2.639632, 0.7996041, -1.057302, 0, 0, 0, 1, 1,
-2.588507, 0.8652873, -0.8595554, 0, 0, 0, 1, 1,
-2.570426, 0.6598369, -0.9343714, 0, 0, 0, 1, 1,
-2.545272, 0.4805542, -1.861476, 0, 0, 0, 1, 1,
-2.439437, -1.787801, -3.173887, 0, 0, 0, 1, 1,
-2.394222, 0.1351392, -2.066059, 0, 0, 0, 1, 1,
-2.381652, 2.348537, -0.325316, 0, 0, 0, 1, 1,
-2.337065, 0.1651476, 0.1019459, 1, 1, 1, 1, 1,
-2.321935, 0.1534803, -0.4079539, 1, 1, 1, 1, 1,
-2.290299, -1.5519, -2.740927, 1, 1, 1, 1, 1,
-2.272589, -1.051648, -0.8655607, 1, 1, 1, 1, 1,
-2.250425, -2.052592, -0.9033067, 1, 1, 1, 1, 1,
-2.181416, -0.3336447, -0.7197279, 1, 1, 1, 1, 1,
-2.165849, -0.9021632, -1.926047, 1, 1, 1, 1, 1,
-2.155996, -1.443308, -0.8169996, 1, 1, 1, 1, 1,
-2.143113, 1.019681, -1.346535, 1, 1, 1, 1, 1,
-2.073137, -0.0937056, 0.9832597, 1, 1, 1, 1, 1,
-2.03126, -0.5779854, -2.996132, 1, 1, 1, 1, 1,
-2.010238, 1.706364, 1.120216, 1, 1, 1, 1, 1,
-2.008804, 2.038637, -1.469357, 1, 1, 1, 1, 1,
-1.982698, 0.602592, -1.006733, 1, 1, 1, 1, 1,
-1.981991, 1.321834, 0.1962954, 1, 1, 1, 1, 1,
-1.956902, -1.206016, -2.88678, 0, 0, 1, 1, 1,
-1.950312, 1.263882, 0.01010765, 1, 0, 0, 1, 1,
-1.941181, 1.081518, -0.8937647, 1, 0, 0, 1, 1,
-1.930351, -2.052924, -3.86429, 1, 0, 0, 1, 1,
-1.924201, 0.890829, -1.302883, 1, 0, 0, 1, 1,
-1.897716, -1.738199, -2.705888, 1, 0, 0, 1, 1,
-1.89667, -0.1105453, -1.141575, 0, 0, 0, 1, 1,
-1.891913, 0.2626421, -1.941512, 0, 0, 0, 1, 1,
-1.87315, -0.3641989, -0.799181, 0, 0, 0, 1, 1,
-1.8589, 2.339746, -1.06958, 0, 0, 0, 1, 1,
-1.831689, 0.7621309, -2.547976, 0, 0, 0, 1, 1,
-1.830478, -0.1119112, -2.331521, 0, 0, 0, 1, 1,
-1.810156, 0.09431871, -2.86507, 0, 0, 0, 1, 1,
-1.803273, 0.08649082, -2.975141, 1, 1, 1, 1, 1,
-1.8032, -0.9128811, -1.733868, 1, 1, 1, 1, 1,
-1.800409, 1.092376, -1.400397, 1, 1, 1, 1, 1,
-1.781986, 1.122933, -2.51643, 1, 1, 1, 1, 1,
-1.774624, -1.588683, -3.351474, 1, 1, 1, 1, 1,
-1.740601, -0.9887064, -0.02179118, 1, 1, 1, 1, 1,
-1.739771, 0.5344207, -2.472035, 1, 1, 1, 1, 1,
-1.733365, -0.2899544, -1.753011, 1, 1, 1, 1, 1,
-1.708981, -1.169594, -1.956591, 1, 1, 1, 1, 1,
-1.702699, 1.034778, -1.137767, 1, 1, 1, 1, 1,
-1.684077, -2.513768, -1.882742, 1, 1, 1, 1, 1,
-1.668659, -0.4753729, -1.549499, 1, 1, 1, 1, 1,
-1.662533, -0.7037246, -1.86387, 1, 1, 1, 1, 1,
-1.660513, -0.8739894, -3.479289, 1, 1, 1, 1, 1,
-1.645459, -0.1159031, -2.087621, 1, 1, 1, 1, 1,
-1.641933, 1.232754, -2.727071, 0, 0, 1, 1, 1,
-1.641677, -1.44359, -1.427902, 1, 0, 0, 1, 1,
-1.625986, 1.747502, -1.699567, 1, 0, 0, 1, 1,
-1.60807, -0.4144076, -1.741644, 1, 0, 0, 1, 1,
-1.594941, -2.145932, -1.904467, 1, 0, 0, 1, 1,
-1.576807, 0.7235592, 0.3368681, 1, 0, 0, 1, 1,
-1.575225, -0.7217325, 0.1751832, 0, 0, 0, 1, 1,
-1.555219, -1.024065, -1.928067, 0, 0, 0, 1, 1,
-1.554438, 0.1281841, -1.190256, 0, 0, 0, 1, 1,
-1.537572, -0.8690097, -1.830129, 0, 0, 0, 1, 1,
-1.534093, 0.7290667, -1.867512, 0, 0, 0, 1, 1,
-1.482994, -1.673267, -2.714821, 0, 0, 0, 1, 1,
-1.475883, 0.02201121, -1.440093, 0, 0, 0, 1, 1,
-1.471831, -0.4325383, -0.6499613, 1, 1, 1, 1, 1,
-1.461904, 1.13473, -0.02641105, 1, 1, 1, 1, 1,
-1.437846, 0.9076182, -1.611459, 1, 1, 1, 1, 1,
-1.431855, -0.594502, -1.126067, 1, 1, 1, 1, 1,
-1.419365, 0.8470083, -2.521074, 1, 1, 1, 1, 1,
-1.401368, -1.214178, -3.287604, 1, 1, 1, 1, 1,
-1.398094, -0.5453996, -2.317503, 1, 1, 1, 1, 1,
-1.387376, 0.5978471, -1.101421, 1, 1, 1, 1, 1,
-1.383019, 0.7014421, -1.114751, 1, 1, 1, 1, 1,
-1.360451, -0.3485322, -1.054818, 1, 1, 1, 1, 1,
-1.358583, -0.07660449, -2.233327, 1, 1, 1, 1, 1,
-1.358188, 0.7283038, -0.8255647, 1, 1, 1, 1, 1,
-1.348566, 0.44541, -3.12788, 1, 1, 1, 1, 1,
-1.344574, 0.09111638, -0.5878434, 1, 1, 1, 1, 1,
-1.341234, 1.139531, -1.394194, 1, 1, 1, 1, 1,
-1.332857, 0.4738572, -1.289455, 0, 0, 1, 1, 1,
-1.30546, 1.636195, -1.248693, 1, 0, 0, 1, 1,
-1.298123, -0.2557771, -2.288409, 1, 0, 0, 1, 1,
-1.291364, -0.06545445, -0.4074388, 1, 0, 0, 1, 1,
-1.289648, -0.1604713, -1.955156, 1, 0, 0, 1, 1,
-1.275292, 0.1025286, -0.7999825, 1, 0, 0, 1, 1,
-1.261454, -1.877198, -2.234498, 0, 0, 0, 1, 1,
-1.255856, -0.9048488, -1.665293, 0, 0, 0, 1, 1,
-1.250917, -0.1282123, -1.087005, 0, 0, 0, 1, 1,
-1.249939, -1.223464, -0.7853405, 0, 0, 0, 1, 1,
-1.24946, -0.2512192, -2.016887, 0, 0, 0, 1, 1,
-1.248692, -0.1158931, -1.430042, 0, 0, 0, 1, 1,
-1.234575, -0.09465515, -2.345727, 0, 0, 0, 1, 1,
-1.223162, -0.3462185, -3.349813, 1, 1, 1, 1, 1,
-1.222853, 0.02381283, -0.8499988, 1, 1, 1, 1, 1,
-1.215801, -0.2449908, -2.856417, 1, 1, 1, 1, 1,
-1.215587, 0.9975331, 0.2058119, 1, 1, 1, 1, 1,
-1.214998, -0.3927989, -2.21079, 1, 1, 1, 1, 1,
-1.211159, 1.283898, -0.9234281, 1, 1, 1, 1, 1,
-1.20071, -0.3330023, 0.8035929, 1, 1, 1, 1, 1,
-1.198803, -0.006814321, -1.718977, 1, 1, 1, 1, 1,
-1.195065, 0.6232991, -1.388642, 1, 1, 1, 1, 1,
-1.193932, -0.7718933, -2.928896, 1, 1, 1, 1, 1,
-1.17263, 0.9052812, -1.767455, 1, 1, 1, 1, 1,
-1.171573, 0.1317902, -2.058056, 1, 1, 1, 1, 1,
-1.169259, 0.6550692, -2.12056, 1, 1, 1, 1, 1,
-1.167093, -2.246224, -2.050754, 1, 1, 1, 1, 1,
-1.165842, 0.8243769, -0.3950622, 1, 1, 1, 1, 1,
-1.154157, -1.522304, -1.979958, 0, 0, 1, 1, 1,
-1.152584, 0.6041092, -1.296595, 1, 0, 0, 1, 1,
-1.142796, -0.1298669, -0.4307823, 1, 0, 0, 1, 1,
-1.134893, -0.32744, -0.3525513, 1, 0, 0, 1, 1,
-1.131104, 0.2943813, -2.155367, 1, 0, 0, 1, 1,
-1.130917, 1.099346, -0.6264205, 1, 0, 0, 1, 1,
-1.130792, -1.479945, -1.156228, 0, 0, 0, 1, 1,
-1.129209, 1.835734, -0.4098928, 0, 0, 0, 1, 1,
-1.129138, -0.199443, -1.381117, 0, 0, 0, 1, 1,
-1.126999, 0.3926532, -1.380486, 0, 0, 0, 1, 1,
-1.119586, 1.245236, -1.162601, 0, 0, 0, 1, 1,
-1.119245, 0.3434789, -2.228043, 0, 0, 0, 1, 1,
-1.112994, 0.3605443, -0.7629444, 0, 0, 0, 1, 1,
-1.106758, -1.08674, -2.47521, 1, 1, 1, 1, 1,
-1.100201, 1.28207, -2.223127, 1, 1, 1, 1, 1,
-1.100162, -0.8211324, -2.479135, 1, 1, 1, 1, 1,
-1.094842, 1.286175, -0.3189046, 1, 1, 1, 1, 1,
-1.083126, -0.6171403, -0.9069046, 1, 1, 1, 1, 1,
-1.077089, -0.0380384, -0.875308, 1, 1, 1, 1, 1,
-1.070949, -1.381793, -0.5865418, 1, 1, 1, 1, 1,
-1.069005, 0.3588201, -1.647323, 1, 1, 1, 1, 1,
-1.068211, -1.215059, -2.169616, 1, 1, 1, 1, 1,
-1.057332, -0.5806231, -1.4434, 1, 1, 1, 1, 1,
-1.0561, -1.100029, -1.614581, 1, 1, 1, 1, 1,
-1.052258, -0.445216, -1.351935, 1, 1, 1, 1, 1,
-1.049416, 2.633054, 1.926356, 1, 1, 1, 1, 1,
-1.044943, 1.278861, -1.035395, 1, 1, 1, 1, 1,
-1.039779, 0.3272432, 0.8168388, 1, 1, 1, 1, 1,
-1.039365, 1.018517, -0.02917279, 0, 0, 1, 1, 1,
-1.037875, -0.04887607, -1.78703, 1, 0, 0, 1, 1,
-1.027663, -0.03899677, -2.360747, 1, 0, 0, 1, 1,
-1.025578, -0.7990043, -1.07898, 1, 0, 0, 1, 1,
-1.015709, -1.198184, -4.037663, 1, 0, 0, 1, 1,
-1.012473, -1.194372, -2.846819, 1, 0, 0, 1, 1,
-1.007405, 1.066604, -0.7484872, 0, 0, 0, 1, 1,
-1.006446, -2.136499, -3.555863, 0, 0, 0, 1, 1,
-1.006401, 2.029244, -0.1288898, 0, 0, 0, 1, 1,
-1.002365, -0.6460577, -2.248763, 0, 0, 0, 1, 1,
-1.001192, 0.1198521, -2.049718, 0, 0, 0, 1, 1,
-0.9991063, -0.5534583, -0.5776451, 0, 0, 0, 1, 1,
-0.9947246, 0.7001739, 1.435523, 0, 0, 0, 1, 1,
-0.9931557, -0.7987734, -1.644866, 1, 1, 1, 1, 1,
-0.9923807, -0.8112654, -2.13268, 1, 1, 1, 1, 1,
-0.9919933, 0.0006893331, 1.007805, 1, 1, 1, 1, 1,
-0.9898335, -0.4172096, -2.708774, 1, 1, 1, 1, 1,
-0.9804154, 0.9692401, -1.556099, 1, 1, 1, 1, 1,
-0.9757732, 0.3341378, -1.88029, 1, 1, 1, 1, 1,
-0.9717951, 0.4864479, 0.1689849, 1, 1, 1, 1, 1,
-0.9587876, -2.094459, -2.14972, 1, 1, 1, 1, 1,
-0.9584951, 1.751854, -1.208102, 1, 1, 1, 1, 1,
-0.9578224, 0.9226668, -1.630842, 1, 1, 1, 1, 1,
-0.9549926, -0.8543332, -4.103437, 1, 1, 1, 1, 1,
-0.9539554, -0.6354752, -2.892633, 1, 1, 1, 1, 1,
-0.952468, 0.07567131, -1.049443, 1, 1, 1, 1, 1,
-0.9514627, 0.0329672, -1.819498, 1, 1, 1, 1, 1,
-0.9418519, -0.6503338, -1.73124, 1, 1, 1, 1, 1,
-0.9387797, 1.567842, 0.1705664, 0, 0, 1, 1, 1,
-0.9387267, 0.7804592, -0.9265283, 1, 0, 0, 1, 1,
-0.9338487, -0.963585, -2.726458, 1, 0, 0, 1, 1,
-0.9308364, 0.744102, 0.07442261, 1, 0, 0, 1, 1,
-0.9249347, 0.6276675, -1.524212, 1, 0, 0, 1, 1,
-0.9242861, 1.564668, -1.30926, 1, 0, 0, 1, 1,
-0.9118019, 1.573792, 0.6086448, 0, 0, 0, 1, 1,
-0.9021396, -0.6015263, -4.155713, 0, 0, 0, 1, 1,
-0.8985987, 0.5871869, -0.9190682, 0, 0, 0, 1, 1,
-0.894936, -0.6109964, -2.365112, 0, 0, 0, 1, 1,
-0.8934978, -0.0433019, -2.061604, 0, 0, 0, 1, 1,
-0.8916782, -0.1519851, -0.9147459, 0, 0, 0, 1, 1,
-0.8910985, -0.3340316, -1.769618, 0, 0, 0, 1, 1,
-0.888834, -1.091796, -1.7032, 1, 1, 1, 1, 1,
-0.8871694, -0.3511405, -2.555912, 1, 1, 1, 1, 1,
-0.8841452, 0.1738222, -0.2342906, 1, 1, 1, 1, 1,
-0.8808171, 1.517725, -1.454758, 1, 1, 1, 1, 1,
-0.8806579, -1.752204, -3.659739, 1, 1, 1, 1, 1,
-0.8706028, 0.7235335, -0.6598994, 1, 1, 1, 1, 1,
-0.865944, 0.437448, -0.3620257, 1, 1, 1, 1, 1,
-0.8622051, 1.462686, 0.4099612, 1, 1, 1, 1, 1,
-0.8603709, -0.1087332, -1.08788, 1, 1, 1, 1, 1,
-0.8535152, -0.4475404, -4.15015, 1, 1, 1, 1, 1,
-0.8498183, 0.057533, -1.269804, 1, 1, 1, 1, 1,
-0.8450242, -1.269656, -3.496239, 1, 1, 1, 1, 1,
-0.8443376, 1.260091, -0.2456486, 1, 1, 1, 1, 1,
-0.843541, -0.6912386, -3.164944, 1, 1, 1, 1, 1,
-0.8430665, -1.680841, -2.296657, 1, 1, 1, 1, 1,
-0.8422377, 1.345257, -1.888135, 0, 0, 1, 1, 1,
-0.8411193, 0.6105917, -1.410238, 1, 0, 0, 1, 1,
-0.8343571, 0.5635247, -0.9799957, 1, 0, 0, 1, 1,
-0.8316661, -1.150105, -5.376478, 1, 0, 0, 1, 1,
-0.8312091, 1.056337, -0.42287, 1, 0, 0, 1, 1,
-0.8290133, -0.1629022, -4.331777, 1, 0, 0, 1, 1,
-0.8264561, 1.553808, -0.3411767, 0, 0, 0, 1, 1,
-0.8251914, -2.214788, -3.888921, 0, 0, 0, 1, 1,
-0.8230633, 2.07908, 0.02576754, 0, 0, 0, 1, 1,
-0.8207864, -0.077773, -3.106218, 0, 0, 0, 1, 1,
-0.8192711, -0.7334256, -3.267592, 0, 0, 0, 1, 1,
-0.8174877, -1.310624, -2.44124, 0, 0, 0, 1, 1,
-0.8118256, -0.8171299, -2.458149, 0, 0, 0, 1, 1,
-0.8040976, 1.163109, -0.533251, 1, 1, 1, 1, 1,
-0.7987396, 1.909021, 1.069797, 1, 1, 1, 1, 1,
-0.7891122, 0.6347312, -1.502642, 1, 1, 1, 1, 1,
-0.7852603, 0.1082788, -0.9033324, 1, 1, 1, 1, 1,
-0.7816377, 1.118479, -0.9842958, 1, 1, 1, 1, 1,
-0.7804929, 0.261665, 0.4979064, 1, 1, 1, 1, 1,
-0.7773267, -0.3546891, 0.2496488, 1, 1, 1, 1, 1,
-0.775865, -0.7590906, -1.37965, 1, 1, 1, 1, 1,
-0.7724585, -1.014641, -2.339756, 1, 1, 1, 1, 1,
-0.7696221, 2.196342, -1.264037, 1, 1, 1, 1, 1,
-0.7672639, 1.193488, -1.290877, 1, 1, 1, 1, 1,
-0.766968, -0.31538, -2.942478, 1, 1, 1, 1, 1,
-0.7657307, 1.853035, -0.4227538, 1, 1, 1, 1, 1,
-0.7638921, 1.227783, -1.117967, 1, 1, 1, 1, 1,
-0.7632934, -0.5060496, -1.06893, 1, 1, 1, 1, 1,
-0.7632475, 0.3506906, -1.713752, 0, 0, 1, 1, 1,
-0.7596535, 0.6884032, -2.298451, 1, 0, 0, 1, 1,
-0.759504, -0.5525627, -0.6915063, 1, 0, 0, 1, 1,
-0.7574666, -0.30861, -1.107396, 1, 0, 0, 1, 1,
-0.7554418, 0.2172475, 2.473512, 1, 0, 0, 1, 1,
-0.7507927, -0.3911813, -2.227699, 1, 0, 0, 1, 1,
-0.7499224, 0.7347951, -0.2433505, 0, 0, 0, 1, 1,
-0.7362183, 0.6940721, -2.514024, 0, 0, 0, 1, 1,
-0.733259, -0.7239528, -1.830611, 0, 0, 0, 1, 1,
-0.7288185, -0.2286168, -3.084978, 0, 0, 0, 1, 1,
-0.7282584, 1.015015, -1.956888, 0, 0, 0, 1, 1,
-0.725095, -0.05961474, -4.166971, 0, 0, 0, 1, 1,
-0.7241415, 0.2236073, -1.613588, 0, 0, 0, 1, 1,
-0.7239265, -1.308021, -3.130073, 1, 1, 1, 1, 1,
-0.7237005, -0.752738, -4.383873, 1, 1, 1, 1, 1,
-0.7103149, -0.08839978, -0.08287064, 1, 1, 1, 1, 1,
-0.7084025, 0.7784905, -1.482487, 1, 1, 1, 1, 1,
-0.706184, 0.7520797, -0.3189759, 1, 1, 1, 1, 1,
-0.7055649, -1.96249, -3.562066, 1, 1, 1, 1, 1,
-0.7047542, 0.4851062, -1.139494, 1, 1, 1, 1, 1,
-0.7000589, -1.551362, -2.231504, 1, 1, 1, 1, 1,
-0.6990082, -2.635058, -2.940587, 1, 1, 1, 1, 1,
-0.6956672, -0.6705657, -2.565872, 1, 1, 1, 1, 1,
-0.6950589, -0.7571406, -1.473622, 1, 1, 1, 1, 1,
-0.6945465, 1.326811, -0.722111, 1, 1, 1, 1, 1,
-0.6916217, 0.7845817, -1.468453, 1, 1, 1, 1, 1,
-0.6890523, -0.7896584, -1.963947, 1, 1, 1, 1, 1,
-0.6874507, 0.7546513, 0.01215232, 1, 1, 1, 1, 1,
-0.6812899, -1.045528, -2.105879, 0, 0, 1, 1, 1,
-0.6760528, 0.8484431, -0.432658, 1, 0, 0, 1, 1,
-0.670845, 1.523478, -2.266851, 1, 0, 0, 1, 1,
-0.6705338, -0.8383489, -3.532421, 1, 0, 0, 1, 1,
-0.6691511, 0.280371, -0.9751548, 1, 0, 0, 1, 1,
-0.6653096, 0.8334643, -0.8211244, 1, 0, 0, 1, 1,
-0.6647214, 1.223389, 0.9281614, 0, 0, 0, 1, 1,
-0.6645739, -2.21247, -3.580426, 0, 0, 0, 1, 1,
-0.6637123, 0.6797885, -0.961621, 0, 0, 0, 1, 1,
-0.6615601, -0.7915868, -1.904779, 0, 0, 0, 1, 1,
-0.6560912, -1.05069, -2.25532, 0, 0, 0, 1, 1,
-0.6538385, 0.7577649, -0.2471801, 0, 0, 0, 1, 1,
-0.6528439, -0.8506324, -1.632905, 0, 0, 0, 1, 1,
-0.6500456, 1.361818, -1.427217, 1, 1, 1, 1, 1,
-0.6475585, 0.847645, -0.2206035, 1, 1, 1, 1, 1,
-0.6364608, 0.7240089, -0.2441262, 1, 1, 1, 1, 1,
-0.636339, -1.259639, -2.286539, 1, 1, 1, 1, 1,
-0.6343383, 0.5856963, -1.318603, 1, 1, 1, 1, 1,
-0.6332028, 0.951466, -1.646233, 1, 1, 1, 1, 1,
-0.6306415, 0.2936099, -0.537503, 1, 1, 1, 1, 1,
-0.6292595, -1.065362, -1.102001, 1, 1, 1, 1, 1,
-0.6244804, -0.09178457, -3.058759, 1, 1, 1, 1, 1,
-0.6241985, -1.435048, -2.829259, 1, 1, 1, 1, 1,
-0.6221976, -1.174313, -2.751139, 1, 1, 1, 1, 1,
-0.6221308, -1.171689, -3.902138, 1, 1, 1, 1, 1,
-0.612702, 1.666812, 0.6455041, 1, 1, 1, 1, 1,
-0.6109464, -0.5746428, -1.742934, 1, 1, 1, 1, 1,
-0.6108103, 0.04251774, -0.811219, 1, 1, 1, 1, 1,
-0.6052069, 0.1584471, -0.3991542, 0, 0, 1, 1, 1,
-0.59848, 0.5770746, -0.1047082, 1, 0, 0, 1, 1,
-0.5982611, 0.5087335, -0.8256702, 1, 0, 0, 1, 1,
-0.5963583, 0.4489625, -1.306961, 1, 0, 0, 1, 1,
-0.5941924, -0.3892559, -0.715362, 1, 0, 0, 1, 1,
-0.5932406, 0.3615262, -0.5156655, 1, 0, 0, 1, 1,
-0.5923678, 0.7903351, -1.207668, 0, 0, 0, 1, 1,
-0.5870512, -1.701769, -1.808295, 0, 0, 0, 1, 1,
-0.5864041, 1.367383, -0.676548, 0, 0, 0, 1, 1,
-0.5830797, -0.034583, -1.064705, 0, 0, 0, 1, 1,
-0.5827836, -0.136613, -2.893729, 0, 0, 0, 1, 1,
-0.5825229, 0.1219655, -1.729532, 0, 0, 0, 1, 1,
-0.5807158, -0.6227765, -2.054473, 0, 0, 0, 1, 1,
-0.5782641, -0.2132415, -2.399702, 1, 1, 1, 1, 1,
-0.5766348, 2.120958, 0.6271758, 1, 1, 1, 1, 1,
-0.5759678, 0.6646407, -0.486729, 1, 1, 1, 1, 1,
-0.5758542, -1.087491, -2.818664, 1, 1, 1, 1, 1,
-0.5747961, -0.1009473, -2.282562, 1, 1, 1, 1, 1,
-0.5734131, -1.549054, -2.544701, 1, 1, 1, 1, 1,
-0.5705892, -1.536343, -4.134771, 1, 1, 1, 1, 1,
-0.5625576, 0.3953047, -2.484576, 1, 1, 1, 1, 1,
-0.5603721, -1.147918, -4.077855, 1, 1, 1, 1, 1,
-0.5603456, -0.7771477, -1.461793, 1, 1, 1, 1, 1,
-0.5557176, -1.081172, -1.559664, 1, 1, 1, 1, 1,
-0.5547947, 1.707369, 0.8919977, 1, 1, 1, 1, 1,
-0.5526883, 0.8774421, -0.5841444, 1, 1, 1, 1, 1,
-0.5526615, 0.3063869, 0.5007157, 1, 1, 1, 1, 1,
-0.5514445, 1.028505, -0.7124476, 1, 1, 1, 1, 1,
-0.5509775, -1.648134, -1.382733, 0, 0, 1, 1, 1,
-0.5504301, -0.9734533, -2.275931, 1, 0, 0, 1, 1,
-0.548819, -1.389558, -3.341368, 1, 0, 0, 1, 1,
-0.5475837, 0.807587, -1.747487, 1, 0, 0, 1, 1,
-0.5456415, -0.948303, -2.855364, 1, 0, 0, 1, 1,
-0.5417634, 1.030865, -1.363194, 1, 0, 0, 1, 1,
-0.5331237, -0.4603602, -3.535677, 0, 0, 0, 1, 1,
-0.5303468, -1.142144, -1.370218, 0, 0, 0, 1, 1,
-0.5277739, 0.8887444, 0.4462838, 0, 0, 0, 1, 1,
-0.5249603, -1.129149, -5.269797, 0, 0, 0, 1, 1,
-0.5217534, 0.0920353, 0.8813723, 0, 0, 0, 1, 1,
-0.5208396, -0.4910261, -2.705007, 0, 0, 0, 1, 1,
-0.5199559, -0.9858084, -3.773355, 0, 0, 0, 1, 1,
-0.5199546, 0.3271705, -0.9431686, 1, 1, 1, 1, 1,
-0.5196687, -0.915151, -2.868433, 1, 1, 1, 1, 1,
-0.5124183, 0.04558202, -0.9655756, 1, 1, 1, 1, 1,
-0.5086634, -0.0005467456, -2.421059, 1, 1, 1, 1, 1,
-0.5071175, 0.2801441, -3.164584, 1, 1, 1, 1, 1,
-0.5066301, 0.367814, -1.072045, 1, 1, 1, 1, 1,
-0.5039927, -0.9744123, -3.201126, 1, 1, 1, 1, 1,
-0.4985981, 0.6719455, 0.5646527, 1, 1, 1, 1, 1,
-0.490854, -1.691417, -4.000266, 1, 1, 1, 1, 1,
-0.4753902, -0.3455748, -1.791476, 1, 1, 1, 1, 1,
-0.4708671, 0.9476854, 0.03445989, 1, 1, 1, 1, 1,
-0.4686576, 2.150497, -1.261397, 1, 1, 1, 1, 1,
-0.4669921, -0.8643203, -3.119146, 1, 1, 1, 1, 1,
-0.4649089, 0.4705238, -2.541694, 1, 1, 1, 1, 1,
-0.4645075, -0.831247, -0.9020325, 1, 1, 1, 1, 1,
-0.4644447, 0.7725745, -1.174572, 0, 0, 1, 1, 1,
-0.4627022, 0.3020939, -0.7396216, 1, 0, 0, 1, 1,
-0.4594797, -1.562576, -0.2871833, 1, 0, 0, 1, 1,
-0.4592545, 0.3034033, -1.927924, 1, 0, 0, 1, 1,
-0.4555399, -0.4436035, -2.45863, 1, 0, 0, 1, 1,
-0.4553088, -0.1134675, -2.376312, 1, 0, 0, 1, 1,
-0.454718, -0.487897, -2.821096, 0, 0, 0, 1, 1,
-0.452022, 0.3114932, 0.2545911, 0, 0, 0, 1, 1,
-0.4428347, -0.2494701, -2.258307, 0, 0, 0, 1, 1,
-0.4383058, 0.1806003, -2.542415, 0, 0, 0, 1, 1,
-0.4362337, 0.2054009, -1.480995, 0, 0, 0, 1, 1,
-0.4360791, 0.2465667, 0.3926336, 0, 0, 0, 1, 1,
-0.4351103, -0.411401, -2.960312, 0, 0, 0, 1, 1,
-0.4303293, 1.141573, -1.024678, 1, 1, 1, 1, 1,
-0.4273179, 0.06434891, 0.01773076, 1, 1, 1, 1, 1,
-0.4234902, -0.5118944, -4.562469, 1, 1, 1, 1, 1,
-0.4168249, -0.6059029, -3.925546, 1, 1, 1, 1, 1,
-0.4157654, -0.3887598, -3.690605, 1, 1, 1, 1, 1,
-0.4150458, 1.931726, -1.058059, 1, 1, 1, 1, 1,
-0.4143701, -0.08290464, -0.8393593, 1, 1, 1, 1, 1,
-0.4098762, -0.02308075, -2.031503, 1, 1, 1, 1, 1,
-0.4073437, -0.6630116, -1.445264, 1, 1, 1, 1, 1,
-0.4051661, -0.5358269, -3.10448, 1, 1, 1, 1, 1,
-0.4018846, 0.7685668, 1.23305, 1, 1, 1, 1, 1,
-0.398229, -0.9377902, -2.953806, 1, 1, 1, 1, 1,
-0.3962715, 0.03512715, -3.933329, 1, 1, 1, 1, 1,
-0.3960519, -1.095994, -2.446079, 1, 1, 1, 1, 1,
-0.3928907, -0.1094639, -0.1387554, 1, 1, 1, 1, 1,
-0.3921266, 0.7551904, 0.05483144, 0, 0, 1, 1, 1,
-0.3917427, -0.4142031, -1.478578, 1, 0, 0, 1, 1,
-0.3909383, -1.044077, -5.367107, 1, 0, 0, 1, 1,
-0.389185, -0.9034036, -4.498452, 1, 0, 0, 1, 1,
-0.389166, -0.4522721, -2.658604, 1, 0, 0, 1, 1,
-0.3873621, -0.4388587, -2.930561, 1, 0, 0, 1, 1,
-0.3837626, 0.2384509, -0.7332126, 0, 0, 0, 1, 1,
-0.3816977, 0.2981696, -1.807283, 0, 0, 0, 1, 1,
-0.3801979, -0.6132851, -3.643642, 0, 0, 0, 1, 1,
-0.3783354, -1.336689, -4.855603, 0, 0, 0, 1, 1,
-0.3774911, -1.516253, -2.136937, 0, 0, 0, 1, 1,
-0.3742059, 3.274436, -0.8083466, 0, 0, 0, 1, 1,
-0.372947, 0.5757446, 0.8093616, 0, 0, 0, 1, 1,
-0.3717817, 0.6615207, 0.8938403, 1, 1, 1, 1, 1,
-0.3685863, 0.9013408, -1.911477, 1, 1, 1, 1, 1,
-0.3674872, 0.853438, -0.08071186, 1, 1, 1, 1, 1,
-0.3671782, -0.5642984, -2.725541, 1, 1, 1, 1, 1,
-0.3655723, 2.220987, 0.5932593, 1, 1, 1, 1, 1,
-0.3636568, 1.529351, -0.6541425, 1, 1, 1, 1, 1,
-0.3627454, 2.016489, -0.2183522, 1, 1, 1, 1, 1,
-0.3622715, -0.4021325, -0.2728872, 1, 1, 1, 1, 1,
-0.3619751, -0.1350084, -1.432549, 1, 1, 1, 1, 1,
-0.3615025, 1.379849, 1.159424, 1, 1, 1, 1, 1,
-0.3607305, 0.2455236, -0.6004248, 1, 1, 1, 1, 1,
-0.3596751, -0.5940609, -2.613052, 1, 1, 1, 1, 1,
-0.3579107, -0.2197661, -3.397148, 1, 1, 1, 1, 1,
-0.3573641, -0.3687793, -2.235317, 1, 1, 1, 1, 1,
-0.3568617, 1.02677, -0.4441339, 1, 1, 1, 1, 1,
-0.3532215, 0.4889609, -1.779461, 0, 0, 1, 1, 1,
-0.34786, 0.1091716, -1.710163, 1, 0, 0, 1, 1,
-0.3444364, -2.374074, -2.269969, 1, 0, 0, 1, 1,
-0.3444287, 0.7668861, -1.271083, 1, 0, 0, 1, 1,
-0.3442191, -0.3236704, -2.157748, 1, 0, 0, 1, 1,
-0.3424159, -0.03276831, -2.633089, 1, 0, 0, 1, 1,
-0.3360004, 0.2215078, -1.362228, 0, 0, 0, 1, 1,
-0.3355989, 1.312775, -0.8672124, 0, 0, 0, 1, 1,
-0.3344561, -0.1158181, -1.763611, 0, 0, 0, 1, 1,
-0.3330297, 1.456862, -0.9175281, 0, 0, 0, 1, 1,
-0.3260766, 1.557515, -1.465175, 0, 0, 0, 1, 1,
-0.3237679, 1.792238, 0.5534216, 0, 0, 0, 1, 1,
-0.3204935, 0.9338471, 1.469405, 0, 0, 0, 1, 1,
-0.319995, 0.3453439, -1.592038, 1, 1, 1, 1, 1,
-0.3199625, -1.692662, -2.357948, 1, 1, 1, 1, 1,
-0.3166511, -0.3001127, -2.500034, 1, 1, 1, 1, 1,
-0.3133738, 0.526053, 1.28663, 1, 1, 1, 1, 1,
-0.3115555, 0.3942389, -1.058574, 1, 1, 1, 1, 1,
-0.3075529, 0.1205, -1.295659, 1, 1, 1, 1, 1,
-0.2986185, 0.5021119, -0.7686958, 1, 1, 1, 1, 1,
-0.2919611, -0.02754179, -1.906921, 1, 1, 1, 1, 1,
-0.2860896, 0.21452, -0.8097937, 1, 1, 1, 1, 1,
-0.2858298, -1.269279, -1.702261, 1, 1, 1, 1, 1,
-0.2855328, -0.7113598, -3.77264, 1, 1, 1, 1, 1,
-0.2826704, 0.438986, 0.1740368, 1, 1, 1, 1, 1,
-0.2817558, 1.203727, -0.2575812, 1, 1, 1, 1, 1,
-0.2768201, -0.7291605, -2.827583, 1, 1, 1, 1, 1,
-0.2764796, 1.754884, 0.163484, 1, 1, 1, 1, 1,
-0.2738837, 0.1463322, -2.22497, 0, 0, 1, 1, 1,
-0.2697678, -0.8964002, -3.434728, 1, 0, 0, 1, 1,
-0.2679468, 0.766277, -0.02400576, 1, 0, 0, 1, 1,
-0.265984, -0.4011827, -2.197742, 1, 0, 0, 1, 1,
-0.2651963, 0.8935449, -0.9010252, 1, 0, 0, 1, 1,
-0.2651161, 0.6698913, -0.3349188, 1, 0, 0, 1, 1,
-0.2628284, 1.196518, -0.1922764, 0, 0, 0, 1, 1,
-0.2614986, -0.5468457, -2.140093, 0, 0, 0, 1, 1,
-0.2417278, -0.3875268, -2.759392, 0, 0, 0, 1, 1,
-0.2394688, 0.4625482, -0.9051682, 0, 0, 0, 1, 1,
-0.2394127, -0.03854086, -1.262287, 0, 0, 0, 1, 1,
-0.2359283, 1.889897, -0.6442125, 0, 0, 0, 1, 1,
-0.2295273, 0.6924456, -2.565403, 0, 0, 0, 1, 1,
-0.2253065, 0.7196579, 0.1404872, 1, 1, 1, 1, 1,
-0.2238576, 1.443082, -1.560549, 1, 1, 1, 1, 1,
-0.2234365, 0.5766942, -2.151622, 1, 1, 1, 1, 1,
-0.2218292, -1.154705, -2.664948, 1, 1, 1, 1, 1,
-0.2204665, -1.516, -3.581876, 1, 1, 1, 1, 1,
-0.2175244, -1.292374, -2.47026, 1, 1, 1, 1, 1,
-0.217179, 1.262871, -0.6893209, 1, 1, 1, 1, 1,
-0.2143432, 0.762186, -1.188402, 1, 1, 1, 1, 1,
-0.210799, -0.002836998, -1.410474, 1, 1, 1, 1, 1,
-0.2105724, -0.7389306, -1.950784, 1, 1, 1, 1, 1,
-0.2079013, 0.5257469, -0.3373762, 1, 1, 1, 1, 1,
-0.204014, 0.148309, -0.1111613, 1, 1, 1, 1, 1,
-0.202593, 0.9634449, 0.4931352, 1, 1, 1, 1, 1,
-0.2009834, -0.1020219, -2.144373, 1, 1, 1, 1, 1,
-0.2003797, -1.231761, -3.31481, 1, 1, 1, 1, 1,
-0.2000106, 1.086383, -2.224843, 0, 0, 1, 1, 1,
-0.1955575, 0.4481379, -0.6797997, 1, 0, 0, 1, 1,
-0.1952075, -2.099427, -3.103501, 1, 0, 0, 1, 1,
-0.1887196, 2.317048, 0.05149108, 1, 0, 0, 1, 1,
-0.1879919, -0.2304103, -1.928724, 1, 0, 0, 1, 1,
-0.1846087, 0.1585226, 0.115037, 1, 0, 0, 1, 1,
-0.1798904, 1.261334, -0.3892359, 0, 0, 0, 1, 1,
-0.1750396, 0.7702881, -2.273606, 0, 0, 0, 1, 1,
-0.1708639, 0.6431596, -0.5166727, 0, 0, 0, 1, 1,
-0.1708498, -0.9344224, -4.042955, 0, 0, 0, 1, 1,
-0.1698089, -0.6440216, -2.060808, 0, 0, 0, 1, 1,
-0.1690333, 0.5049568, 0.1901838, 0, 0, 0, 1, 1,
-0.1687129, -0.1715963, -2.87836, 0, 0, 0, 1, 1,
-0.1608832, 0.02300155, 0.725403, 1, 1, 1, 1, 1,
-0.1600461, -0.358323, -2.374065, 1, 1, 1, 1, 1,
-0.159944, -0.2894843, -1.294602, 1, 1, 1, 1, 1,
-0.1546407, -0.2517262, -2.178418, 1, 1, 1, 1, 1,
-0.1541138, -0.9262491, -3.875345, 1, 1, 1, 1, 1,
-0.1538729, 0.3754098, 0.0747437, 1, 1, 1, 1, 1,
-0.1524993, 0.1818078, -0.02395127, 1, 1, 1, 1, 1,
-0.1459908, -1.027747, -4.068537, 1, 1, 1, 1, 1,
-0.1454412, -1.111246, -4.418288, 1, 1, 1, 1, 1,
-0.1430653, 0.6813941, 0.1449919, 1, 1, 1, 1, 1,
-0.1410379, 1.063815, 0.5432464, 1, 1, 1, 1, 1,
-0.1375449, -2.187608, -3.438574, 1, 1, 1, 1, 1,
-0.1364677, 0.2992873, -1.119085, 1, 1, 1, 1, 1,
-0.1357918, -0.1530425, -1.902155, 1, 1, 1, 1, 1,
-0.1336401, -0.617712, -4.538183, 1, 1, 1, 1, 1,
-0.1319095, -0.8629789, -3.063059, 0, 0, 1, 1, 1,
-0.1260562, 0.4544321, -0.434445, 1, 0, 0, 1, 1,
-0.1246087, -0.6867206, -2.072112, 1, 0, 0, 1, 1,
-0.1220429, -0.1189663, -2.576612, 1, 0, 0, 1, 1,
-0.1214338, 0.2674451, -0.73124, 1, 0, 0, 1, 1,
-0.1172865, 1.392858, 0.943979, 1, 0, 0, 1, 1,
-0.113231, 0.5345119, 0.8075871, 0, 0, 0, 1, 1,
-0.1081305, 0.2537435, -0.5642847, 0, 0, 0, 1, 1,
-0.1063378, -1.117809, -3.436432, 0, 0, 0, 1, 1,
-0.1032848, 0.3686791, 0.1145023, 0, 0, 0, 1, 1,
-0.09893081, -1.201198, -2.550437, 0, 0, 0, 1, 1,
-0.09730854, 1.434375, 0.2214154, 0, 0, 0, 1, 1,
-0.09526268, -1.047175, -4.018216, 0, 0, 0, 1, 1,
-0.09321754, 0.6638376, -1.971354, 1, 1, 1, 1, 1,
-0.09049969, -0.9153991, -1.171649, 1, 1, 1, 1, 1,
-0.08406663, 1.026279, -1.33161, 1, 1, 1, 1, 1,
-0.08148763, 0.1858008, -0.05343261, 1, 1, 1, 1, 1,
-0.07724496, -0.05270685, -3.314709, 1, 1, 1, 1, 1,
-0.06663028, 0.3095562, -0.02625553, 1, 1, 1, 1, 1,
-0.06211411, 0.7441671, -0.03075448, 1, 1, 1, 1, 1,
-0.0565967, -0.2188203, -4.278506, 1, 1, 1, 1, 1,
-0.05582605, 0.8356979, 0.5083789, 1, 1, 1, 1, 1,
-0.05415892, -0.7373508, -2.225557, 1, 1, 1, 1, 1,
-0.05245461, -0.5903549, -4.060891, 1, 1, 1, 1, 1,
-0.04780057, -0.6056659, -4.548684, 1, 1, 1, 1, 1,
-0.04654951, 0.1787993, 0.9611747, 1, 1, 1, 1, 1,
-0.03930008, -2.059035, -2.491002, 1, 1, 1, 1, 1,
-0.03791841, -1.015968, -4.368203, 1, 1, 1, 1, 1,
-0.03771219, 0.7215674, -0.6045516, 0, 0, 1, 1, 1,
-0.03391179, 0.2181352, -0.3622796, 1, 0, 0, 1, 1,
-0.03300831, -0.1389174, -3.046441, 1, 0, 0, 1, 1,
-0.03177481, -0.2810657, -4.560286, 1, 0, 0, 1, 1,
-0.03118123, -0.7132021, -3.180497, 1, 0, 0, 1, 1,
-0.02965215, -1.317448, -1.984273, 1, 0, 0, 1, 1,
-0.02455523, -0.9320879, -2.736441, 0, 0, 0, 1, 1,
-0.02153601, 0.8077468, 0.371177, 0, 0, 0, 1, 1,
-0.02000951, 0.3216234, -0.9282053, 0, 0, 0, 1, 1,
-0.01604788, 3.22243, 0.05872632, 0, 0, 0, 1, 1,
-0.01366948, -1.185396, -2.776338, 0, 0, 0, 1, 1,
-0.01319728, -1.7113, -3.401239, 0, 0, 0, 1, 1,
-0.01117562, -0.3553362, -3.3141, 0, 0, 0, 1, 1,
-0.008315833, -2.473798, -2.841825, 1, 1, 1, 1, 1,
-0.006270543, -0.4623417, -1.382308, 1, 1, 1, 1, 1,
-0.005913758, 0.3016448, -0.6829379, 1, 1, 1, 1, 1,
-0.005320953, -0.5381005, -2.848671, 1, 1, 1, 1, 1,
-0.002934389, 1.609323, -1.204725, 1, 1, 1, 1, 1,
-0.000473124, -0.04589656, -2.498411, 1, 1, 1, 1, 1,
0.004141731, -0.5062039, 2.836055, 1, 1, 1, 1, 1,
0.007325217, -0.5892612, 2.805634, 1, 1, 1, 1, 1,
0.00830393, 0.2052719, 0.119706, 1, 1, 1, 1, 1,
0.01422273, -1.431391, 2.697996, 1, 1, 1, 1, 1,
0.01577754, 1.328535, 0.5600801, 1, 1, 1, 1, 1,
0.01781148, 0.4939866, -0.7762283, 1, 1, 1, 1, 1,
0.02894266, -1.122358, 1.826893, 1, 1, 1, 1, 1,
0.02954955, -0.4874526, 2.905854, 1, 1, 1, 1, 1,
0.03088446, 1.850167, 0.03376702, 1, 1, 1, 1, 1,
0.03130737, 0.1708588, 0.4681742, 0, 0, 1, 1, 1,
0.03406536, -1.251856, 3.471549, 1, 0, 0, 1, 1,
0.03512256, -1.252647, 2.210895, 1, 0, 0, 1, 1,
0.03808376, -0.2594785, 2.135929, 1, 0, 0, 1, 1,
0.0382005, -1.254253, 3.354536, 1, 0, 0, 1, 1,
0.04321667, 1.664139, -1.827625, 1, 0, 0, 1, 1,
0.04630031, 1.191993, -0.9991569, 0, 0, 0, 1, 1,
0.0491187, -0.03699541, 2.470103, 0, 0, 0, 1, 1,
0.0508396, -0.7130215, 2.962466, 0, 0, 0, 1, 1,
0.05084862, -1.321476, 2.457072, 0, 0, 0, 1, 1,
0.05427384, -0.07552499, 3.197899, 0, 0, 0, 1, 1,
0.05676333, -1.966403, 3.709708, 0, 0, 0, 1, 1,
0.05797915, 0.5454528, -1.010651, 0, 0, 0, 1, 1,
0.06359081, -0.4038862, 3.36465, 1, 1, 1, 1, 1,
0.0673763, -0.8708056, 2.460772, 1, 1, 1, 1, 1,
0.06976419, -0.2416476, 4.628786, 1, 1, 1, 1, 1,
0.06980505, 0.1809277, 0.2701348, 1, 1, 1, 1, 1,
0.07018805, -0.412645, 0.9052993, 1, 1, 1, 1, 1,
0.0710673, -0.805641, 2.603118, 1, 1, 1, 1, 1,
0.07265734, 0.4819833, 0.2713738, 1, 1, 1, 1, 1,
0.07986086, 1.5326, 0.2262744, 1, 1, 1, 1, 1,
0.08083709, -0.2166585, 4.139936, 1, 1, 1, 1, 1,
0.08226441, 0.2223972, -0.236847, 1, 1, 1, 1, 1,
0.08255117, -0.712465, 1.823056, 1, 1, 1, 1, 1,
0.09013827, -0.2925924, 2.870008, 1, 1, 1, 1, 1,
0.09403738, -0.5973609, 3.115565, 1, 1, 1, 1, 1,
0.09551448, 0.04909923, 1.330388, 1, 1, 1, 1, 1,
0.09648968, -0.3941504, 2.823133, 1, 1, 1, 1, 1,
0.09659251, 0.6874563, 1.027428, 0, 0, 1, 1, 1,
0.1001664, 0.006714669, 0.2735043, 1, 0, 0, 1, 1,
0.102665, 0.4765294, -2.023555, 1, 0, 0, 1, 1,
0.1104849, 1.126749, 0.6461906, 1, 0, 0, 1, 1,
0.1116425, 1.566465, 0.08044577, 1, 0, 0, 1, 1,
0.1119481, 1.639459, 0.4021027, 1, 0, 0, 1, 1,
0.1133855, 0.1975392, 0.5842084, 0, 0, 0, 1, 1,
0.1134111, -0.1578419, 2.125659, 0, 0, 0, 1, 1,
0.114379, 1.215934, 0.4249733, 0, 0, 0, 1, 1,
0.1160611, -1.277908, 2.738863, 0, 0, 0, 1, 1,
0.1165581, -1.368693, 3.476176, 0, 0, 0, 1, 1,
0.1206685, -1.142452, 1.873587, 0, 0, 0, 1, 1,
0.1217226, -1.478531, 2.485326, 0, 0, 0, 1, 1,
0.1232651, -1.701314, 1.896603, 1, 1, 1, 1, 1,
0.1240024, 0.9723025, -0.4239897, 1, 1, 1, 1, 1,
0.1287934, -0.2061803, 2.104996, 1, 1, 1, 1, 1,
0.1290852, 0.6357111, -0.5795622, 1, 1, 1, 1, 1,
0.129776, 0.2154823, -0.5283044, 1, 1, 1, 1, 1,
0.1320498, -0.6513712, 3.852235, 1, 1, 1, 1, 1,
0.1321653, 1.374175, -0.04355973, 1, 1, 1, 1, 1,
0.1336519, 0.4103872, 0.02948585, 1, 1, 1, 1, 1,
0.1391854, 0.1538868, 0.4806156, 1, 1, 1, 1, 1,
0.140072, 0.6848073, 0.585245, 1, 1, 1, 1, 1,
0.1406146, 0.9315902, -0.6180651, 1, 1, 1, 1, 1,
0.1426648, 1.647618, 0.03209827, 1, 1, 1, 1, 1,
0.144728, -1.244096, 2.177537, 1, 1, 1, 1, 1,
0.1512997, 0.1207319, 1.581533, 1, 1, 1, 1, 1,
0.1518002, -1.312592, 3.08251, 1, 1, 1, 1, 1,
0.1518784, 1.408157, -0.5894904, 0, 0, 1, 1, 1,
0.1525547, 0.4798149, 0.6017531, 1, 0, 0, 1, 1,
0.1561771, 0.406624, 0.4031531, 1, 0, 0, 1, 1,
0.1562706, -0.2156143, 3.07497, 1, 0, 0, 1, 1,
0.1567985, -0.553314, 3.008138, 1, 0, 0, 1, 1,
0.1583949, -1.109352, 1.709482, 1, 0, 0, 1, 1,
0.16142, -2.148313, 2.745623, 0, 0, 0, 1, 1,
0.1620284, 1.321729, 0.3981216, 0, 0, 0, 1, 1,
0.1632361, -2.180875, 2.870949, 0, 0, 0, 1, 1,
0.1676532, -1.702361, 3.326486, 0, 0, 0, 1, 1,
0.1700357, 1.212851, -1.019699, 0, 0, 0, 1, 1,
0.1702478, -0.4950137, 3.837969, 0, 0, 0, 1, 1,
0.1772006, -0.5439774, 2.507276, 0, 0, 0, 1, 1,
0.1782737, -2.435356, 3.928109, 1, 1, 1, 1, 1,
0.1790335, 0.1631405, 2.647462, 1, 1, 1, 1, 1,
0.1792731, -0.3029645, 4.373392, 1, 1, 1, 1, 1,
0.1861056, 0.8068218, -0.511907, 1, 1, 1, 1, 1,
0.1883079, 0.09560983, 0.3301916, 1, 1, 1, 1, 1,
0.1886377, 1.166857, 0.8627803, 1, 1, 1, 1, 1,
0.1925668, 0.3816382, 0.3258758, 1, 1, 1, 1, 1,
0.1991073, -1.192915, 2.519672, 1, 1, 1, 1, 1,
0.1999335, 1.270982, 0.7203313, 1, 1, 1, 1, 1,
0.1999387, -0.1029588, 2.126422, 1, 1, 1, 1, 1,
0.2051444, -1.044587, 2.714053, 1, 1, 1, 1, 1,
0.205521, -0.5716615, 3.285033, 1, 1, 1, 1, 1,
0.2116514, 0.7299733, 1.963439, 1, 1, 1, 1, 1,
0.2128865, -0.3105224, -0.485174, 1, 1, 1, 1, 1,
0.2191961, 0.2203175, 0.271058, 1, 1, 1, 1, 1,
0.2248709, 1.667402, 0.8767233, 0, 0, 1, 1, 1,
0.2445154, 0.8465659, 0.3763077, 1, 0, 0, 1, 1,
0.2591833, 1.272058, 0.7373018, 1, 0, 0, 1, 1,
0.2604084, 1.53145, 0.1953795, 1, 0, 0, 1, 1,
0.2673734, -0.2685813, 1.820074, 1, 0, 0, 1, 1,
0.2684332, -0.8243667, 3.298469, 1, 0, 0, 1, 1,
0.2691803, 1.270038, 0.6514162, 0, 0, 0, 1, 1,
0.269546, 1.36772, 0.02470476, 0, 0, 0, 1, 1,
0.2701153, 1.713196, 0.0720951, 0, 0, 0, 1, 1,
0.2706087, 0.6057615, 0.3761171, 0, 0, 0, 1, 1,
0.2723412, -0.06926715, 0.9226171, 0, 0, 0, 1, 1,
0.2737854, -1.84344, 4.091711, 0, 0, 0, 1, 1,
0.2782638, 0.2609538, -0.5024791, 0, 0, 0, 1, 1,
0.2837307, 1.330764, -0.5561863, 1, 1, 1, 1, 1,
0.2842472, 0.01523812, 0.3787073, 1, 1, 1, 1, 1,
0.2860858, -0.7803521, 2.336839, 1, 1, 1, 1, 1,
0.2872422, 1.769397, -0.4003804, 1, 1, 1, 1, 1,
0.2888724, -0.7233202, 3.842726, 1, 1, 1, 1, 1,
0.2941312, -0.2761763, 2.804308, 1, 1, 1, 1, 1,
0.2951049, -0.3738369, 1.437599, 1, 1, 1, 1, 1,
0.2964667, -2.018959, 3.035047, 1, 1, 1, 1, 1,
0.2986622, -1.06055, 2.326999, 1, 1, 1, 1, 1,
0.3000385, -0.2129601, 1.692703, 1, 1, 1, 1, 1,
0.3055308, 0.9368365, 1.128455, 1, 1, 1, 1, 1,
0.3057033, -0.4237643, 4.837282, 1, 1, 1, 1, 1,
0.3095199, 0.5956378, 0.6552843, 1, 1, 1, 1, 1,
0.3103985, -0.484582, 2.150409, 1, 1, 1, 1, 1,
0.3159776, -1.141744, 2.514663, 1, 1, 1, 1, 1,
0.3164905, -1.09364, 3.493026, 0, 0, 1, 1, 1,
0.3195886, 0.07644366, 1.354656, 1, 0, 0, 1, 1,
0.3223804, -1.61754, 3.830038, 1, 0, 0, 1, 1,
0.3256501, 0.6365118, 0.5188629, 1, 0, 0, 1, 1,
0.3402692, -0.07102542, 3.65946, 1, 0, 0, 1, 1,
0.3420197, 1.197276, -0.7996382, 1, 0, 0, 1, 1,
0.3455115, -0.6567054, 3.499859, 0, 0, 0, 1, 1,
0.3484545, 0.06069487, 2.743877, 0, 0, 0, 1, 1,
0.3539778, 0.2416554, 0.6163759, 0, 0, 0, 1, 1,
0.3590619, -1.123359, 3.143266, 0, 0, 0, 1, 1,
0.3602647, -0.454187, 1.704775, 0, 0, 0, 1, 1,
0.3706888, -0.5146863, 3.31848, 0, 0, 0, 1, 1,
0.3715682, 0.07620211, 1.139974, 0, 0, 0, 1, 1,
0.3732947, -2.828714, -0.3382978, 1, 1, 1, 1, 1,
0.374409, -0.167293, 3.442945, 1, 1, 1, 1, 1,
0.3756127, -0.9851097, 4.302513, 1, 1, 1, 1, 1,
0.3770768, 0.1851634, 1.235144, 1, 1, 1, 1, 1,
0.3822811, -1.303199, 1.993037, 1, 1, 1, 1, 1,
0.3827086, 0.7592818, 0.7547771, 1, 1, 1, 1, 1,
0.3834541, -1.333323, 3.139598, 1, 1, 1, 1, 1,
0.3870073, 1.446175, -0.1808306, 1, 1, 1, 1, 1,
0.3897064, -0.5191261, 0.5768054, 1, 1, 1, 1, 1,
0.3901793, -1.217653, 3.062071, 1, 1, 1, 1, 1,
0.3982136, -0.476235, 3.06139, 1, 1, 1, 1, 1,
0.3982716, 0.9133, 1.444672, 1, 1, 1, 1, 1,
0.4004348, -1.338809, 4.080473, 1, 1, 1, 1, 1,
0.4075775, -2.11557, 3.884918, 1, 1, 1, 1, 1,
0.4085615, -0.916202, 2.330073, 1, 1, 1, 1, 1,
0.4097219, 0.459056, 0.5233288, 0, 0, 1, 1, 1,
0.4151212, -0.1943053, 3.87915, 1, 0, 0, 1, 1,
0.416153, 1.22341, 0.06633841, 1, 0, 0, 1, 1,
0.4163237, -0.03548238, 3.430088, 1, 0, 0, 1, 1,
0.4228797, -2.455675, 4.079514, 1, 0, 0, 1, 1,
0.4273249, 0.2557261, -0.6886805, 1, 0, 0, 1, 1,
0.4273994, -1.475759, 3.194792, 0, 0, 0, 1, 1,
0.4297008, -0.5279905, 2.951016, 0, 0, 0, 1, 1,
0.4298586, 0.4331194, 0.626131, 0, 0, 0, 1, 1,
0.4339268, -1.151085, 3.123319, 0, 0, 0, 1, 1,
0.4379269, 0.9926975, 0.08716192, 0, 0, 0, 1, 1,
0.4427745, -0.03787692, 0.9383051, 0, 0, 0, 1, 1,
0.4431329, -0.9402617, 1.610484, 0, 0, 0, 1, 1,
0.4441629, -0.7819388, 2.157762, 1, 1, 1, 1, 1,
0.4466125, 0.7962906, 0.3016133, 1, 1, 1, 1, 1,
0.4507799, -1.206079, 3.672211, 1, 1, 1, 1, 1,
0.4511626, 1.465643, 2.19166, 1, 1, 1, 1, 1,
0.4582508, -1.117784, 2.615849, 1, 1, 1, 1, 1,
0.4600752, -1.088894, 2.492616, 1, 1, 1, 1, 1,
0.460082, -1.458462, 4.093354, 1, 1, 1, 1, 1,
0.4623646, -0.1360094, 1.400852, 1, 1, 1, 1, 1,
0.4624233, -1.250289, 2.658892, 1, 1, 1, 1, 1,
0.4635007, -0.3479719, 1.030072, 1, 1, 1, 1, 1,
0.4635415, 1.006935, 1.355656, 1, 1, 1, 1, 1,
0.4722823, 2.028266, 2.542081, 1, 1, 1, 1, 1,
0.4761478, 0.8932531, 1.947577, 1, 1, 1, 1, 1,
0.4780971, 0.3172971, -0.7126971, 1, 1, 1, 1, 1,
0.4874184, 1.590777, -1.517866, 1, 1, 1, 1, 1,
0.4911015, 1.966755, 1.178793, 0, 0, 1, 1, 1,
0.4962132, 0.5929849, -1.390185, 1, 0, 0, 1, 1,
0.4977985, 2.465374, 0.4567618, 1, 0, 0, 1, 1,
0.5001695, -1.464963, 2.056657, 1, 0, 0, 1, 1,
0.5024448, 1.84171, 0.8497847, 1, 0, 0, 1, 1,
0.5070086, 0.02035938, 1.140496, 1, 0, 0, 1, 1,
0.5153212, 0.1041474, 0.3983599, 0, 0, 0, 1, 1,
0.5178788, 0.4480806, 0.2016069, 0, 0, 0, 1, 1,
0.5180968, 0.07498206, 1.57039, 0, 0, 0, 1, 1,
0.5196707, 2.05197, -1.402686, 0, 0, 0, 1, 1,
0.5230551, 0.4841924, 0.3338487, 0, 0, 0, 1, 1,
0.525217, 0.2826132, -0.3806591, 0, 0, 0, 1, 1,
0.525777, 0.9237286, -1.787316, 0, 0, 0, 1, 1,
0.5343288, 0.3965455, 2.094553, 1, 1, 1, 1, 1,
0.5349888, -1.939868, 2.631238, 1, 1, 1, 1, 1,
0.5373063, 0.5879681, 0.264491, 1, 1, 1, 1, 1,
0.5407845, 1.432836, 1.07358, 1, 1, 1, 1, 1,
0.5512841, 0.4385965, 2.445992, 1, 1, 1, 1, 1,
0.552191, 1.095641, 0.9609615, 1, 1, 1, 1, 1,
0.5554076, -2.5695, 2.218101, 1, 1, 1, 1, 1,
0.5655056, 1.505394, -0.4329254, 1, 1, 1, 1, 1,
0.5659055, 0.1258838, 2.217618, 1, 1, 1, 1, 1,
0.5726634, 0.3913438, 0.5836194, 1, 1, 1, 1, 1,
0.582074, -0.2186224, 2.824619, 1, 1, 1, 1, 1,
0.5825141, 0.3549536, -0.06842514, 1, 1, 1, 1, 1,
0.5853316, 0.7935321, -0.08010115, 1, 1, 1, 1, 1,
0.5863103, -2.511405, 4.289584, 1, 1, 1, 1, 1,
0.5909659, -0.1073955, 1.301762, 1, 1, 1, 1, 1,
0.5921322, 2.180949, 1.665665, 0, 0, 1, 1, 1,
0.5926468, -0.4080946, 3.928825, 1, 0, 0, 1, 1,
0.5927731, 0.2196843, -1.017208, 1, 0, 0, 1, 1,
0.5940614, -0.167282, 0.5185226, 1, 0, 0, 1, 1,
0.5953354, -1.380586, 2.905699, 1, 0, 0, 1, 1,
0.5980535, 0.05118893, 1.914907, 1, 0, 0, 1, 1,
0.5982324, -0.1409531, 0.8774144, 0, 0, 0, 1, 1,
0.6019588, -0.1144525, 1.932722, 0, 0, 0, 1, 1,
0.6075109, 0.1798343, 1.687823, 0, 0, 0, 1, 1,
0.6132199, -0.6265251, 3.062836, 0, 0, 0, 1, 1,
0.6151493, -2.069061, 3.665664, 0, 0, 0, 1, 1,
0.6195983, 1.10403, 0.9086323, 0, 0, 0, 1, 1,
0.6215457, 1.513358, 1.405457, 0, 0, 0, 1, 1,
0.6240398, 1.267729, 0.2881043, 1, 1, 1, 1, 1,
0.6246524, 0.1435134, 0.4504745, 1, 1, 1, 1, 1,
0.629244, -1.446225, 0.7746776, 1, 1, 1, 1, 1,
0.6311498, -0.2381428, 1.610865, 1, 1, 1, 1, 1,
0.6337922, 0.5613564, -0.8682965, 1, 1, 1, 1, 1,
0.6366114, 1.44217, 0.8343079, 1, 1, 1, 1, 1,
0.6390465, 0.6261535, -0.1141132, 1, 1, 1, 1, 1,
0.6503654, 0.1858912, 0.3444371, 1, 1, 1, 1, 1,
0.6572717, 0.05599627, 1.806258, 1, 1, 1, 1, 1,
0.6573481, -1.501901, 4.36846, 1, 1, 1, 1, 1,
0.6594467, 0.05840434, 1.788105, 1, 1, 1, 1, 1,
0.6599257, 0.7032282, 0.5557625, 1, 1, 1, 1, 1,
0.6632565, -0.6680211, 2.09912, 1, 1, 1, 1, 1,
0.6672903, -0.3251739, -1.135991, 1, 1, 1, 1, 1,
0.6675491, 0.6377171, 2.725474, 1, 1, 1, 1, 1,
0.6677385, 1.654085, -0.6575317, 0, 0, 1, 1, 1,
0.6692321, 1.507773, 0.7947578, 1, 0, 0, 1, 1,
0.6741969, -0.1215432, 2.036112, 1, 0, 0, 1, 1,
0.6809683, -1.716219, 3.388169, 1, 0, 0, 1, 1,
0.6819175, 1.216803, 1.240619, 1, 0, 0, 1, 1,
0.6910074, -0.2364059, 1.174235, 1, 0, 0, 1, 1,
0.6933135, 0.5373299, 0.4846745, 0, 0, 0, 1, 1,
0.693534, -0.2492654, 3.222879, 0, 0, 0, 1, 1,
0.6946967, 0.1837507, 2.202045, 0, 0, 0, 1, 1,
0.6988813, 0.4457307, 2.044421, 0, 0, 0, 1, 1,
0.7040832, 0.8625702, 1.492257, 0, 0, 0, 1, 1,
0.7062749, 0.1413251, 2.182375, 0, 0, 0, 1, 1,
0.7095729, 0.3505242, 0.2981966, 0, 0, 0, 1, 1,
0.7104259, -0.4519445, 1.168698, 1, 1, 1, 1, 1,
0.71158, 0.6230044, -1.377674, 1, 1, 1, 1, 1,
0.7138537, 0.77773, -0.4077334, 1, 1, 1, 1, 1,
0.7146674, 2.254817, -0.2510865, 1, 1, 1, 1, 1,
0.7164373, 0.002484141, 1.151802, 1, 1, 1, 1, 1,
0.7183654, 1.698738, 1.789481, 1, 1, 1, 1, 1,
0.7190502, -0.2251687, 1.610792, 1, 1, 1, 1, 1,
0.7213253, 1.003655, 1.264141, 1, 1, 1, 1, 1,
0.7249122, 0.2725023, 1.633357, 1, 1, 1, 1, 1,
0.7293805, 0.535923, 1.082743, 1, 1, 1, 1, 1,
0.7301083, -0.5682384, 3.824693, 1, 1, 1, 1, 1,
0.7358786, -0.633562, 3.158099, 1, 1, 1, 1, 1,
0.7363835, -1.136879, 2.554917, 1, 1, 1, 1, 1,
0.7372677, -0.7462206, 2.327863, 1, 1, 1, 1, 1,
0.7386981, -0.1999126, -0.06673313, 1, 1, 1, 1, 1,
0.7414293, -0.7803888, 3.501268, 0, 0, 1, 1, 1,
0.75223, -1.358523, 1.372937, 1, 0, 0, 1, 1,
0.7583725, 0.3199388, 1.560562, 1, 0, 0, 1, 1,
0.7592397, -0.7550923, 2.011844, 1, 0, 0, 1, 1,
0.7746473, -1.199757, 2.282816, 1, 0, 0, 1, 1,
0.7794548, 0.02547215, 2.073565, 1, 0, 0, 1, 1,
0.7797743, -2.651045, 2.091897, 0, 0, 0, 1, 1,
0.7821627, 0.8178845, -2.393123, 0, 0, 0, 1, 1,
0.7821949, -0.45983, 2.015662, 0, 0, 0, 1, 1,
0.7827374, 0.5275428, 1.052059, 0, 0, 0, 1, 1,
0.7830092, 0.2470943, 2.468751, 0, 0, 0, 1, 1,
0.7844385, -0.6358664, 2.488558, 0, 0, 0, 1, 1,
0.7944792, 0.403522, 1.069016, 0, 0, 0, 1, 1,
0.7968918, -2.837695, 1.755421, 1, 1, 1, 1, 1,
0.800221, 2.704615, -0.1246717, 1, 1, 1, 1, 1,
0.8022406, -0.3146865, 1.707964, 1, 1, 1, 1, 1,
0.8114574, 1.814817, 1.003074, 1, 1, 1, 1, 1,
0.8174515, -1.078479, 2.073773, 1, 1, 1, 1, 1,
0.8266519, -1.04532, 3.465553, 1, 1, 1, 1, 1,
0.8271635, 0.4021133, 0.4885603, 1, 1, 1, 1, 1,
0.8307518, 0.7028286, 1.720937, 1, 1, 1, 1, 1,
0.8314385, 0.09037589, 3.910403, 1, 1, 1, 1, 1,
0.8356897, -0.2048456, 1.151088, 1, 1, 1, 1, 1,
0.8371506, 0.9300697, -0.5652508, 1, 1, 1, 1, 1,
0.8393078, 0.3859797, 1.757305, 1, 1, 1, 1, 1,
0.8446748, 0.2627977, 0.3514173, 1, 1, 1, 1, 1,
0.84719, -0.194352, 1.309855, 1, 1, 1, 1, 1,
0.8555144, 0.4537412, 1.482055, 1, 1, 1, 1, 1,
0.8575916, 0.1891889, -1.438832, 0, 0, 1, 1, 1,
0.8623418, -0.2153404, 3.421853, 1, 0, 0, 1, 1,
0.8643171, 0.09765188, -0.6739264, 1, 0, 0, 1, 1,
0.8667417, 0.1167805, 0.6903941, 1, 0, 0, 1, 1,
0.8766991, -1.270268, 0.7878603, 1, 0, 0, 1, 1,
0.8794389, -0.6725215, 3.423183, 1, 0, 0, 1, 1,
0.8870896, 0.1279752, 0.5239925, 0, 0, 0, 1, 1,
0.8996322, -0.6732577, 4.260205, 0, 0, 0, 1, 1,
0.9003522, 0.5973597, 2.749064, 0, 0, 0, 1, 1,
0.9110232, -0.3714907, 2.189187, 0, 0, 0, 1, 1,
0.9112932, -0.4828572, 1.64022, 0, 0, 0, 1, 1,
0.9133145, 0.326086, -0.391937, 0, 0, 0, 1, 1,
0.9199303, 0.4616817, 0.7893326, 0, 0, 0, 1, 1,
0.9241517, 0.04619329, 1.400241, 1, 1, 1, 1, 1,
0.9264842, 1.432949, 2.356444, 1, 1, 1, 1, 1,
0.9272729, 0.8516941, 1.279565, 1, 1, 1, 1, 1,
0.9375072, -0.2627625, 0.3452722, 1, 1, 1, 1, 1,
0.9440588, 0.1616081, 1.245755, 1, 1, 1, 1, 1,
0.9453109, 0.3437758, 3.562294, 1, 1, 1, 1, 1,
0.9471977, -0.3369836, 3.003093, 1, 1, 1, 1, 1,
0.9621173, 0.2006635, 0.1390133, 1, 1, 1, 1, 1,
0.9702507, 0.3986587, 1.501852, 1, 1, 1, 1, 1,
0.9741879, -0.109358, 2.518486, 1, 1, 1, 1, 1,
0.9758177, -0.8209857, -0.1874909, 1, 1, 1, 1, 1,
0.9777734, 0.9570872, 0.8511008, 1, 1, 1, 1, 1,
0.9927684, -0.2394729, 1.570968, 1, 1, 1, 1, 1,
0.9928764, 1.284623, 1.596476, 1, 1, 1, 1, 1,
0.9937918, -1.170294, 1.075806, 1, 1, 1, 1, 1,
1.003108, 1.956001, -0.6229966, 0, 0, 1, 1, 1,
1.005851, -0.8621591, 4.192434, 1, 0, 0, 1, 1,
1.009659, -1.060151, 2.374045, 1, 0, 0, 1, 1,
1.010273, 0.6867741, 0.1372971, 1, 0, 0, 1, 1,
1.011773, 0.8866611, 1.138319, 1, 0, 0, 1, 1,
1.013179, -0.8649885, 1.556989, 1, 0, 0, 1, 1,
1.015375, 0.04735342, 2.108473, 0, 0, 0, 1, 1,
1.016638, 0.5401171, -0.8114659, 0, 0, 0, 1, 1,
1.024768, -0.8446842, 0.3565353, 0, 0, 0, 1, 1,
1.028964, 0.9704506, 1.176496, 0, 0, 0, 1, 1,
1.037529, -2.191537, 2.410795, 0, 0, 0, 1, 1,
1.054119, 0.2020992, 0.859484, 0, 0, 0, 1, 1,
1.055792, -1.732317, 4.417627, 0, 0, 0, 1, 1,
1.058056, -0.1021176, 1.759652, 1, 1, 1, 1, 1,
1.076748, -0.1569198, -1.269828, 1, 1, 1, 1, 1,
1.088449, -0.1440634, 2.107541, 1, 1, 1, 1, 1,
1.089121, 0.3751275, 2.884303, 1, 1, 1, 1, 1,
1.094352, -0.4301333, 4.083606, 1, 1, 1, 1, 1,
1.100073, 0.8969932, 1.562608, 1, 1, 1, 1, 1,
1.104963, -1.559089, 0.8154317, 1, 1, 1, 1, 1,
1.105446, -0.6587219, 3.173979, 1, 1, 1, 1, 1,
1.118813, 0.2804234, 0.7977241, 1, 1, 1, 1, 1,
1.123017, -0.4107204, 0.5840222, 1, 1, 1, 1, 1,
1.129039, -1.684802, 1.697962, 1, 1, 1, 1, 1,
1.131415, -0.2117835, 0.9011437, 1, 1, 1, 1, 1,
1.141012, -0.1645922, 1.15773, 1, 1, 1, 1, 1,
1.141335, -0.4799762, 2.397948, 1, 1, 1, 1, 1,
1.14346, 0.0789438, 2.005083, 1, 1, 1, 1, 1,
1.146878, -0.05850842, 2.320306, 0, 0, 1, 1, 1,
1.1495, -0.6949428, 2.82643, 1, 0, 0, 1, 1,
1.149642, 0.5979571, 1.927094, 1, 0, 0, 1, 1,
1.162521, -1.53479, 0.9531104, 1, 0, 0, 1, 1,
1.167307, -1.506264, 2.299311, 1, 0, 0, 1, 1,
1.168329, 0.2421602, 1.540996, 1, 0, 0, 1, 1,
1.173954, -0.9266942, 0.9421157, 0, 0, 0, 1, 1,
1.179924, -0.7958642, 1.156953, 0, 0, 0, 1, 1,
1.183923, 0.4313183, 1.434382, 0, 0, 0, 1, 1,
1.185652, 1.081081, -0.2542092, 0, 0, 0, 1, 1,
1.193192, -0.2911892, 1.97257, 0, 0, 0, 1, 1,
1.195418, -0.3486431, 2.187487, 0, 0, 0, 1, 1,
1.203182, 1.283459, 1.001242, 0, 0, 0, 1, 1,
1.208953, 0.4560119, 1.843231, 1, 1, 1, 1, 1,
1.209437, 0.0513882, 1.148743, 1, 1, 1, 1, 1,
1.211952, 0.8618462, -0.06241119, 1, 1, 1, 1, 1,
1.212657, -0.2619069, 0.3429136, 1, 1, 1, 1, 1,
1.235163, -0.4358608, 1.285043, 1, 1, 1, 1, 1,
1.235341, -1.134, 3.699391, 1, 1, 1, 1, 1,
1.242296, 0.2846782, 1.499598, 1, 1, 1, 1, 1,
1.243466, 1.145273, 0.06173031, 1, 1, 1, 1, 1,
1.252119, -0.4263618, 2.489236, 1, 1, 1, 1, 1,
1.252439, -0.2231701, 0.6811971, 1, 1, 1, 1, 1,
1.252679, 0.38997, 0.79642, 1, 1, 1, 1, 1,
1.259674, -0.8337128, 2.710547, 1, 1, 1, 1, 1,
1.267214, 0.2459585, 2.542161, 1, 1, 1, 1, 1,
1.269332, 0.07755388, 0.9374108, 1, 1, 1, 1, 1,
1.284215, 2.318189, 1.605489, 1, 1, 1, 1, 1,
1.284252, -0.121023, 0.4175957, 0, 0, 1, 1, 1,
1.286361, 0.3000833, 1.167317, 1, 0, 0, 1, 1,
1.286574, -2.982097, 3.020985, 1, 0, 0, 1, 1,
1.296136, -1.574366, 2.860701, 1, 0, 0, 1, 1,
1.309384, 0.5452079, 3.843007, 1, 0, 0, 1, 1,
1.31126, 0.5787179, 1.738343, 1, 0, 0, 1, 1,
1.3131, 1.650169, 0.2344511, 0, 0, 0, 1, 1,
1.316522, 0.3971194, -1.262227, 0, 0, 0, 1, 1,
1.323113, 1.776924, 2.047963, 0, 0, 0, 1, 1,
1.332385, -0.1879638, 1.25317, 0, 0, 0, 1, 1,
1.345374, 0.5274538, -0.06427424, 0, 0, 0, 1, 1,
1.347057, 0.3653064, -0.6313453, 0, 0, 0, 1, 1,
1.367474, 0.2166361, 0.8077213, 0, 0, 0, 1, 1,
1.378613, -0.2225271, 3.810729, 1, 1, 1, 1, 1,
1.384711, -0.4023323, 0.9257758, 1, 1, 1, 1, 1,
1.38529, 0.5749118, 2.344066, 1, 1, 1, 1, 1,
1.388163, 0.5815504, 1.016531, 1, 1, 1, 1, 1,
1.389691, 0.05453146, 2.435252, 1, 1, 1, 1, 1,
1.392269, -0.3366899, 0.6194878, 1, 1, 1, 1, 1,
1.413107, -0.1323238, 0.8150478, 1, 1, 1, 1, 1,
1.413867, 0.1471455, 0.4503883, 1, 1, 1, 1, 1,
1.42194, 2.163666, -0.4229983, 1, 1, 1, 1, 1,
1.433076, -0.4116351, 1.312168, 1, 1, 1, 1, 1,
1.435599, 1.156557, 1.796579, 1, 1, 1, 1, 1,
1.436714, 0.5041838, -0.2361228, 1, 1, 1, 1, 1,
1.437214, -0.4552102, 2.192998, 1, 1, 1, 1, 1,
1.44671, -0.835591, 1.92587, 1, 1, 1, 1, 1,
1.46082, 0.4122664, 2.557833, 1, 1, 1, 1, 1,
1.461302, 0.146303, 1.114543, 0, 0, 1, 1, 1,
1.471758, 0.9835745, 0.5975531, 1, 0, 0, 1, 1,
1.478204, 1.337226, 0.8346497, 1, 0, 0, 1, 1,
1.494114, 2.357105, 0.469016, 1, 0, 0, 1, 1,
1.497967, 1.506818, 0.1523882, 1, 0, 0, 1, 1,
1.500391, 0.07523346, 1.94955, 1, 0, 0, 1, 1,
1.505482, 1.935677, 1.315039, 0, 0, 0, 1, 1,
1.509979, -1.098337, 2.049751, 0, 0, 0, 1, 1,
1.513643, -0.3630817, 0.7868672, 0, 0, 0, 1, 1,
1.531778, 0.3828413, 1.447906, 0, 0, 0, 1, 1,
1.53422, 0.1566264, 1.473222, 0, 0, 0, 1, 1,
1.538515, 0.01182588, -0.4750634, 0, 0, 0, 1, 1,
1.55005, 0.5308001, 1.07456, 0, 0, 0, 1, 1,
1.559363, 1.364686, 1.67619, 1, 1, 1, 1, 1,
1.570721, -0.441257, 3.329185, 1, 1, 1, 1, 1,
1.57157, 2.815306, 1.251183, 1, 1, 1, 1, 1,
1.572738, -0.725182, 1.92974, 1, 1, 1, 1, 1,
1.574136, -0.4995134, 3.664515, 1, 1, 1, 1, 1,
1.5834, 0.4970315, 1.933365, 1, 1, 1, 1, 1,
1.592278, -0.4097253, 1.208474, 1, 1, 1, 1, 1,
1.600606, -1.276699, 1.418973, 1, 1, 1, 1, 1,
1.6099, 1.113074, 1.250695, 1, 1, 1, 1, 1,
1.614321, -0.4971997, 1.642675, 1, 1, 1, 1, 1,
1.619712, -0.155015, 1.851717, 1, 1, 1, 1, 1,
1.634743, 1.359929, 2.009348, 1, 1, 1, 1, 1,
1.663594, 1.620089, 1.298231, 1, 1, 1, 1, 1,
1.665219, -0.3889978, 1.034817, 1, 1, 1, 1, 1,
1.665947, 1.159472, -0.8831335, 1, 1, 1, 1, 1,
1.676095, 0.8729109, -0.3954108, 0, 0, 1, 1, 1,
1.682211, 0.1938176, 2.04102, 1, 0, 0, 1, 1,
1.695604, -0.9188288, 2.926069, 1, 0, 0, 1, 1,
1.710787, -0.3614903, 3.889408, 1, 0, 0, 1, 1,
1.725678, -0.1336126, 2.887582, 1, 0, 0, 1, 1,
1.728191, -0.8257649, 3.29268, 1, 0, 0, 1, 1,
1.734332, -1.125491, 2.592952, 0, 0, 0, 1, 1,
1.753345, -0.6374657, 3.628061, 0, 0, 0, 1, 1,
1.779965, 0.4562796, 0.8773725, 0, 0, 0, 1, 1,
1.785733, 0.08422489, 1.359336, 0, 0, 0, 1, 1,
1.797306, 0.6867158, 0.7471102, 0, 0, 0, 1, 1,
1.825986, -0.7616173, 1.383664, 0, 0, 0, 1, 1,
1.83667, -0.3159664, 0.7080546, 0, 0, 0, 1, 1,
1.843355, -0.217412, 2.259092, 1, 1, 1, 1, 1,
1.843959, -1.48018, 2.509751, 1, 1, 1, 1, 1,
1.917497, 1.526945, 1.664305, 1, 1, 1, 1, 1,
1.952608, -1.95284, 0.8299643, 1, 1, 1, 1, 1,
1.963009, -0.766621, 2.285332, 1, 1, 1, 1, 1,
1.99166, -1.765244, 0.5556971, 1, 1, 1, 1, 1,
2.005763, -0.3066322, 1.02704, 1, 1, 1, 1, 1,
2.014022, -1.632157, 2.075548, 1, 1, 1, 1, 1,
2.01464, -0.1352415, 1.573808, 1, 1, 1, 1, 1,
2.018269, -0.6674755, 3.030926, 1, 1, 1, 1, 1,
2.043355, 0.2148225, 1.76045, 1, 1, 1, 1, 1,
2.05448, 0.8731108, 1.366656, 1, 1, 1, 1, 1,
2.07072, -1.200669, 1.470118, 1, 1, 1, 1, 1,
2.093342, 0.1799064, -0.8456673, 1, 1, 1, 1, 1,
2.110015, -0.3320205, 1.309793, 1, 1, 1, 1, 1,
2.144603, 0.5480862, 1.290692, 0, 0, 1, 1, 1,
2.155732, -2.139847, 2.59119, 1, 0, 0, 1, 1,
2.157373, 0.2736147, 1.076561, 1, 0, 0, 1, 1,
2.163995, -1.101781, 2.805011, 1, 0, 0, 1, 1,
2.181903, -2.343568, 3.398894, 1, 0, 0, 1, 1,
2.276085, -1.214914, 1.472526, 1, 0, 0, 1, 1,
2.282674, 1.304281, 0.9772465, 0, 0, 0, 1, 1,
2.30145, -1.627914, 1.965674, 0, 0, 0, 1, 1,
2.303094, 1.606382, 0.9838182, 0, 0, 0, 1, 1,
2.329804, 0.4839909, -0.01655991, 0, 0, 0, 1, 1,
2.35541, -1.033153, 1.358518, 0, 0, 0, 1, 1,
2.361535, -0.392224, 1.514603, 0, 0, 0, 1, 1,
2.377326, -0.4036703, 1.597392, 0, 0, 0, 1, 1,
2.426953, 0.8658275, 0.2122796, 1, 1, 1, 1, 1,
2.431138, 1.869732, 2.351766, 1, 1, 1, 1, 1,
2.468431, 2.154246, -0.2708599, 1, 1, 1, 1, 1,
2.629423, 1.035241, 2.107209, 1, 1, 1, 1, 1,
2.932308, -0.7535414, 1.541405, 1, 1, 1, 1, 1,
2.968927, -0.2843874, 3.479831, 1, 1, 1, 1, 1,
3.11095, 1.194945, -0.09815133, 1, 1, 1, 1, 1
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
var radius = 9.302088;
var distance = 32.67319;
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
mvMatrix.translate( 0.03330755, -0.1461693, 0.2695982 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.67319);
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
