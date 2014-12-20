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
-3.4695, 1.460156, -0.6373129, 1, 0, 0, 1,
-3.010148, 0.7596173, -2.06496, 1, 0.007843138, 0, 1,
-2.807158, 0.2052374, -2.473136, 1, 0.01176471, 0, 1,
-2.715232, -0.1544501, -1.340528, 1, 0.01960784, 0, 1,
-2.601632, 0.4044606, -2.321852, 1, 0.02352941, 0, 1,
-2.368658, 0.8300637, -0.07837733, 1, 0.03137255, 0, 1,
-2.337498, 0.5529151, -0.03978347, 1, 0.03529412, 0, 1,
-2.301645, 0.591213, -0.4723774, 1, 0.04313726, 0, 1,
-2.226701, -0.5104807, -0.3993747, 1, 0.04705882, 0, 1,
-2.143111, -1.667512, -3.073128, 1, 0.05490196, 0, 1,
-2.099918, -0.2955315, -2.120126, 1, 0.05882353, 0, 1,
-2.032376, -0.4825518, -1.057217, 1, 0.06666667, 0, 1,
-2.001502, 1.805803, -1.568224, 1, 0.07058824, 0, 1,
-1.963913, -1.083773, -2.705371, 1, 0.07843138, 0, 1,
-1.926025, 1.346167, -0.5571323, 1, 0.08235294, 0, 1,
-1.908894, 0.4337716, 0.4081132, 1, 0.09019608, 0, 1,
-1.875637, -1.30751, -2.482726, 1, 0.09411765, 0, 1,
-1.848039, -0.9073831, -0.6923241, 1, 0.1019608, 0, 1,
-1.838708, -0.506997, -2.354697, 1, 0.1098039, 0, 1,
-1.814812, 0.4343209, -0.3079166, 1, 0.1137255, 0, 1,
-1.811788, 0.4337525, -0.03288733, 1, 0.1215686, 0, 1,
-1.77624, 0.3090653, -3.150991, 1, 0.1254902, 0, 1,
-1.770452, -0.7499903, -2.868178, 1, 0.1333333, 0, 1,
-1.767907, -1.452177, -1.437879, 1, 0.1372549, 0, 1,
-1.729626, -0.3500573, -2.24561, 1, 0.145098, 0, 1,
-1.706947, -0.5007851, -2.44593, 1, 0.1490196, 0, 1,
-1.686162, -2.033252, -2.990351, 1, 0.1568628, 0, 1,
-1.673629, -1.449622, -2.987444, 1, 0.1607843, 0, 1,
-1.662755, 1.130624, -2.717436, 1, 0.1686275, 0, 1,
-1.643959, 0.2500971, 0.003367434, 1, 0.172549, 0, 1,
-1.635354, 0.9468387, -0.9022636, 1, 0.1803922, 0, 1,
-1.630567, -1.361166, -2.207231, 1, 0.1843137, 0, 1,
-1.597292, -0.1121867, -0.6903368, 1, 0.1921569, 0, 1,
-1.592079, -2.047682, -1.177904, 1, 0.1960784, 0, 1,
-1.589258, 0.1015331, -1.932959, 1, 0.2039216, 0, 1,
-1.587465, -1.331311, -1.846438, 1, 0.2117647, 0, 1,
-1.575809, 0.4147051, 0.4086891, 1, 0.2156863, 0, 1,
-1.56968, 0.4035296, -0.8584291, 1, 0.2235294, 0, 1,
-1.561859, -0.2318077, -3.081513, 1, 0.227451, 0, 1,
-1.558339, -0.6811644, -1.857579, 1, 0.2352941, 0, 1,
-1.538301, 0.1086348, -1.175813, 1, 0.2392157, 0, 1,
-1.518147, 0.5622862, -1.838856, 1, 0.2470588, 0, 1,
-1.509068, 0.534586, -1.997102, 1, 0.2509804, 0, 1,
-1.503434, -1.155228, 0.04827427, 1, 0.2588235, 0, 1,
-1.495847, 0.791413, -0.3913382, 1, 0.2627451, 0, 1,
-1.482672, -0.515047, -1.854324, 1, 0.2705882, 0, 1,
-1.452702, -0.9350871, -2.150109, 1, 0.2745098, 0, 1,
-1.415533, 0.9135351, -3.369643, 1, 0.282353, 0, 1,
-1.413332, 1.236355, 0.4765806, 1, 0.2862745, 0, 1,
-1.40231, 0.8701684, -2.487476, 1, 0.2941177, 0, 1,
-1.401067, 1.650342, -1.543279, 1, 0.3019608, 0, 1,
-1.396345, -1.200609, -2.273106, 1, 0.3058824, 0, 1,
-1.39374, 0.9510503, -1.157969, 1, 0.3137255, 0, 1,
-1.383973, -0.2704313, 0.0664231, 1, 0.3176471, 0, 1,
-1.379593, 0.2394564, -1.783538, 1, 0.3254902, 0, 1,
-1.372745, -2.166732, -5.285455, 1, 0.3294118, 0, 1,
-1.363566, 0.171188, -0.8130315, 1, 0.3372549, 0, 1,
-1.360759, 0.6061817, -1.310451, 1, 0.3411765, 0, 1,
-1.353776, -1.156997, -2.845865, 1, 0.3490196, 0, 1,
-1.352673, -1.955658, -2.408005, 1, 0.3529412, 0, 1,
-1.351101, 0.3780272, -2.621724, 1, 0.3607843, 0, 1,
-1.345991, 0.3935677, -1.160511, 1, 0.3647059, 0, 1,
-1.342996, 0.5003639, -1.903054, 1, 0.372549, 0, 1,
-1.326611, 1.526032, -0.5247081, 1, 0.3764706, 0, 1,
-1.321281, 0.2193309, -1.865054, 1, 0.3843137, 0, 1,
-1.318329, -0.02203687, 0.1849927, 1, 0.3882353, 0, 1,
-1.311561, 0.5120668, -1.391226, 1, 0.3960784, 0, 1,
-1.308641, 1.418046, -1.137336, 1, 0.4039216, 0, 1,
-1.304159, -0.6932377, -2.122407, 1, 0.4078431, 0, 1,
-1.304095, -0.7090712, -2.153788, 1, 0.4156863, 0, 1,
-1.296259, -0.002696207, -0.4901156, 1, 0.4196078, 0, 1,
-1.280165, -1.708114, -2.143339, 1, 0.427451, 0, 1,
-1.267042, -0.02170654, -1.451895, 1, 0.4313726, 0, 1,
-1.263862, 0.1769834, -2.47822, 1, 0.4392157, 0, 1,
-1.258181, -1.605438, -2.217573, 1, 0.4431373, 0, 1,
-1.252728, -0.207744, -0.02479846, 1, 0.4509804, 0, 1,
-1.247951, 1.149425, -0.5639939, 1, 0.454902, 0, 1,
-1.24169, 1.485401, -0.573801, 1, 0.4627451, 0, 1,
-1.241198, -1.06083, -3.375538, 1, 0.4666667, 0, 1,
-1.236781, 0.001763491, -0.3518803, 1, 0.4745098, 0, 1,
-1.233133, -0.6797386, -2.399817, 1, 0.4784314, 0, 1,
-1.225148, 0.7565865, 0.9578421, 1, 0.4862745, 0, 1,
-1.218346, -0.7191789, -4.01972, 1, 0.4901961, 0, 1,
-1.212513, 0.3004756, -1.968413, 1, 0.4980392, 0, 1,
-1.21087, 0.3318088, -2.363699, 1, 0.5058824, 0, 1,
-1.207634, 0.9677345, -0.2716998, 1, 0.509804, 0, 1,
-1.197387, -1.258283, -2.406474, 1, 0.5176471, 0, 1,
-1.193253, 1.321505, -1.456915, 1, 0.5215687, 0, 1,
-1.192195, 1.597509, 0.3550595, 1, 0.5294118, 0, 1,
-1.183443, 1.172018, -1.40014, 1, 0.5333334, 0, 1,
-1.180946, -0.94708, -1.019465, 1, 0.5411765, 0, 1,
-1.173959, -1.091253, -2.807089, 1, 0.5450981, 0, 1,
-1.168423, 0.1297395, -2.280266, 1, 0.5529412, 0, 1,
-1.165106, 1.259318, -1.06374, 1, 0.5568628, 0, 1,
-1.164797, 0.3786369, 0.3053593, 1, 0.5647059, 0, 1,
-1.159388, 1.586051, -0.7429145, 1, 0.5686275, 0, 1,
-1.154858, 0.8491918, -1.616417, 1, 0.5764706, 0, 1,
-1.14597, 0.5599818, 0.4503485, 1, 0.5803922, 0, 1,
-1.145493, 0.1400444, -0.6773137, 1, 0.5882353, 0, 1,
-1.142156, -1.648808, -1.484118, 1, 0.5921569, 0, 1,
-1.140541, -0.5874442, -2.628652, 1, 0.6, 0, 1,
-1.134088, 0.6445503, -0.6815977, 1, 0.6078432, 0, 1,
-1.126112, 1.20555, -0.8676066, 1, 0.6117647, 0, 1,
-1.124959, 1.032214, -0.03274158, 1, 0.6196079, 0, 1,
-1.118114, 0.7641078, 0.9857106, 1, 0.6235294, 0, 1,
-1.118003, -0.8685142, -3.899111, 1, 0.6313726, 0, 1,
-1.117593, 1.094662, -0.9535277, 1, 0.6352941, 0, 1,
-1.115337, 0.2920479, -0.9749404, 1, 0.6431373, 0, 1,
-1.112015, -0.4601269, -2.508652, 1, 0.6470588, 0, 1,
-1.110495, -0.02305269, -1.99403, 1, 0.654902, 0, 1,
-1.104937, 0.22332, -1.920918, 1, 0.6588235, 0, 1,
-1.102652, -1.684893, -3.275129, 1, 0.6666667, 0, 1,
-1.102076, -0.6321214, -0.7537078, 1, 0.6705883, 0, 1,
-1.100853, 0.5799294, -0.3706366, 1, 0.6784314, 0, 1,
-1.099467, -0.4647901, -2.815271, 1, 0.682353, 0, 1,
-1.090946, 0.1836135, -0.5126414, 1, 0.6901961, 0, 1,
-1.087561, -0.2198864, 0.102672, 1, 0.6941177, 0, 1,
-1.087159, 0.5510819, -1.615378, 1, 0.7019608, 0, 1,
-1.086391, -0.9955072, -2.168303, 1, 0.7098039, 0, 1,
-1.084777, 0.6950201, -1.982804, 1, 0.7137255, 0, 1,
-1.067545, 0.9826584, -1.040051, 1, 0.7215686, 0, 1,
-1.06621, -0.3234461, -3.392951, 1, 0.7254902, 0, 1,
-1.063554, -0.7295503, -2.937692, 1, 0.7333333, 0, 1,
-1.046322, -1.026456, -2.916048, 1, 0.7372549, 0, 1,
-1.044643, 0.1915773, -0.1782254, 1, 0.7450981, 0, 1,
-1.04394, 0.4852803, -2.524205, 1, 0.7490196, 0, 1,
-1.041663, -1.344836, -2.735242, 1, 0.7568628, 0, 1,
-1.032037, -0.1434614, -2.071899, 1, 0.7607843, 0, 1,
-1.025798, 1.550179, -0.7583413, 1, 0.7686275, 0, 1,
-1.017391, 0.2110935, -0.7427875, 1, 0.772549, 0, 1,
-1.002655, 0.9712429, 0.08294579, 1, 0.7803922, 0, 1,
-0.9939181, 0.6225688, -0.9926171, 1, 0.7843137, 0, 1,
-0.9898129, 2.681869, -0.707641, 1, 0.7921569, 0, 1,
-0.9897032, -0.5344102, -1.555183, 1, 0.7960784, 0, 1,
-0.9797102, -0.4460236, -2.636292, 1, 0.8039216, 0, 1,
-0.9764803, 0.16506, -1.433607, 1, 0.8117647, 0, 1,
-0.9738023, 0.384812, -0.7429415, 1, 0.8156863, 0, 1,
-0.9709689, -0.4881761, -1.906073, 1, 0.8235294, 0, 1,
-0.9704375, -1.458405, -1.185942, 1, 0.827451, 0, 1,
-0.9668679, -0.6698957, -3.093347, 1, 0.8352941, 0, 1,
-0.9661169, 0.04586734, 0.6381716, 1, 0.8392157, 0, 1,
-0.9644204, 0.2471417, -2.189032, 1, 0.8470588, 0, 1,
-0.964297, 0.0459724, -1.838273, 1, 0.8509804, 0, 1,
-0.9626298, -0.3693717, -2.387377, 1, 0.8588235, 0, 1,
-0.9624771, 0.5642589, -1.623778, 1, 0.8627451, 0, 1,
-0.9598608, -0.6819791, -2.048928, 1, 0.8705882, 0, 1,
-0.9581476, -0.6095825, -2.524535, 1, 0.8745098, 0, 1,
-0.9578651, 1.910006, -0.3197637, 1, 0.8823529, 0, 1,
-0.9521017, 0.02347846, -0.186895, 1, 0.8862745, 0, 1,
-0.94919, -0.871251, -2.673645, 1, 0.8941177, 0, 1,
-0.9483031, -0.7373661, -1.531493, 1, 0.8980392, 0, 1,
-0.9385996, -2.33002, -3.240617, 1, 0.9058824, 0, 1,
-0.9316878, 0.4176518, -2.59404, 1, 0.9137255, 0, 1,
-0.928131, 1.190749, 0.07566583, 1, 0.9176471, 0, 1,
-0.9279247, 0.3603665, 0.1619281, 1, 0.9254902, 0, 1,
-0.9232076, 1.57562, 1.023299, 1, 0.9294118, 0, 1,
-0.9213918, -0.2427725, -1.628276, 1, 0.9372549, 0, 1,
-0.9181982, 1.003197, -1.747975, 1, 0.9411765, 0, 1,
-0.9090543, 0.08403642, -2.003752, 1, 0.9490196, 0, 1,
-0.906202, 1.420881, 1.737907, 1, 0.9529412, 0, 1,
-0.905888, -0.2039919, -3.829234, 1, 0.9607843, 0, 1,
-0.9016765, 0.5864334, -1.519968, 1, 0.9647059, 0, 1,
-0.8964579, 0.3801259, -1.906389, 1, 0.972549, 0, 1,
-0.8928541, 0.1603748, -3.039047, 1, 0.9764706, 0, 1,
-0.8818396, -0.9479302, -3.098546, 1, 0.9843137, 0, 1,
-0.8784438, -0.5089375, -2.510842, 1, 0.9882353, 0, 1,
-0.8761348, 0.3765317, -0.763549, 1, 0.9960784, 0, 1,
-0.8756837, 1.07019, -0.0308573, 0.9960784, 1, 0, 1,
-0.8754954, 0.06302165, -2.439163, 0.9921569, 1, 0, 1,
-0.8713093, 0.3644473, -0.4266478, 0.9843137, 1, 0, 1,
-0.8710968, 0.8379582, -1.599784, 0.9803922, 1, 0, 1,
-0.8702798, -1.217082, -4.334564, 0.972549, 1, 0, 1,
-0.85818, 0.09654409, -1.106192, 0.9686275, 1, 0, 1,
-0.8568279, 0.2789835, -0.1731464, 0.9607843, 1, 0, 1,
-0.8539662, -1.18564, -1.167892, 0.9568627, 1, 0, 1,
-0.8449839, -0.1976241, -1.18928, 0.9490196, 1, 0, 1,
-0.8371092, 0.6415188, 0.8207901, 0.945098, 1, 0, 1,
-0.8333164, -0.2363729, -1.399608, 0.9372549, 1, 0, 1,
-0.8298742, -0.9578761, -2.964119, 0.9333333, 1, 0, 1,
-0.8289168, 0.6034194, 0.04415002, 0.9254902, 1, 0, 1,
-0.8275874, 0.09680437, -1.44075, 0.9215686, 1, 0, 1,
-0.8251264, 0.04388537, -1.670034, 0.9137255, 1, 0, 1,
-0.8228991, 0.3892594, -0.7595945, 0.9098039, 1, 0, 1,
-0.8184168, 0.4063464, -1.429761, 0.9019608, 1, 0, 1,
-0.8134596, 2.130415, -0.1874912, 0.8941177, 1, 0, 1,
-0.8079174, 0.190559, -1.713409, 0.8901961, 1, 0, 1,
-0.8047772, 0.9424438, -0.9137463, 0.8823529, 1, 0, 1,
-0.8013095, -1.103799, -2.000164, 0.8784314, 1, 0, 1,
-0.7997534, -0.7038009, -1.825095, 0.8705882, 1, 0, 1,
-0.7952535, 0.0542447, -1.26923, 0.8666667, 1, 0, 1,
-0.7862515, 0.3568351, -0.2783748, 0.8588235, 1, 0, 1,
-0.7856441, 0.6663901, 0.5735335, 0.854902, 1, 0, 1,
-0.7826064, 0.06253158, -0.7515976, 0.8470588, 1, 0, 1,
-0.7811914, -1.577238, -2.047596, 0.8431373, 1, 0, 1,
-0.7795824, -0.9984652, -2.304796, 0.8352941, 1, 0, 1,
-0.778177, 0.3685084, -1.360069, 0.8313726, 1, 0, 1,
-0.7774441, 0.1631193, -1.127756, 0.8235294, 1, 0, 1,
-0.7750555, -0.3601152, -1.495222, 0.8196079, 1, 0, 1,
-0.7722856, -0.5091993, -1.693252, 0.8117647, 1, 0, 1,
-0.7584679, -0.7691031, -1.398753, 0.8078431, 1, 0, 1,
-0.7565291, -0.6231547, -1.122453, 0.8, 1, 0, 1,
-0.7481068, 0.454406, -1.041439, 0.7921569, 1, 0, 1,
-0.7477966, 0.05668673, -0.8676298, 0.7882353, 1, 0, 1,
-0.7423963, 0.06815369, -0.6883544, 0.7803922, 1, 0, 1,
-0.7372019, -0.356667, -2.022738, 0.7764706, 1, 0, 1,
-0.7366424, -1.206028, -1.93997, 0.7686275, 1, 0, 1,
-0.7364025, 1.362923, 1.113471, 0.7647059, 1, 0, 1,
-0.7361614, -1.522485, -3.862167, 0.7568628, 1, 0, 1,
-0.7312958, 1.069714, -0.2964467, 0.7529412, 1, 0, 1,
-0.7245548, -0.4294338, -2.901139, 0.7450981, 1, 0, 1,
-0.7238374, 0.9734443, -0.06577013, 0.7411765, 1, 0, 1,
-0.7137759, 0.186721, -3.016755, 0.7333333, 1, 0, 1,
-0.7130584, 0.6566275, -0.441159, 0.7294118, 1, 0, 1,
-0.7107319, -0.0008868577, -1.261445, 0.7215686, 1, 0, 1,
-0.709762, 0.4927908, -1.359504, 0.7176471, 1, 0, 1,
-0.7053924, 0.4678416, -1.200434, 0.7098039, 1, 0, 1,
-0.70186, -0.7236201, -3.074758, 0.7058824, 1, 0, 1,
-0.7003308, -0.9672634, -2.241997, 0.6980392, 1, 0, 1,
-0.6946543, 1.256575, -0.8066043, 0.6901961, 1, 0, 1,
-0.6919087, 0.7446043, -0.5959395, 0.6862745, 1, 0, 1,
-0.6828375, -0.2946982, -2.544279, 0.6784314, 1, 0, 1,
-0.6820567, 0.04419564, -2.715123, 0.6745098, 1, 0, 1,
-0.6803578, -0.5440301, 0.2610724, 0.6666667, 1, 0, 1,
-0.6796087, 0.7682747, -0.1390523, 0.6627451, 1, 0, 1,
-0.6771924, -1.858238, -2.725038, 0.654902, 1, 0, 1,
-0.6764576, -0.1292109, -0.3221416, 0.6509804, 1, 0, 1,
-0.6763061, 0.3562607, -0.7029098, 0.6431373, 1, 0, 1,
-0.6722212, 0.06146039, -2.212314, 0.6392157, 1, 0, 1,
-0.6709743, 0.394702, 0.2057885, 0.6313726, 1, 0, 1,
-0.6642728, 0.4053327, -0.3674292, 0.627451, 1, 0, 1,
-0.6594163, -1.273514, -1.837572, 0.6196079, 1, 0, 1,
-0.6591184, -0.6170396, -0.3224604, 0.6156863, 1, 0, 1,
-0.6584181, -1.458437, -3.534396, 0.6078432, 1, 0, 1,
-0.6513317, -0.7545559, -4.593716, 0.6039216, 1, 0, 1,
-0.6490122, -0.7650419, -1.830169, 0.5960785, 1, 0, 1,
-0.6488031, 0.6578407, -1.060964, 0.5882353, 1, 0, 1,
-0.6486519, 0.3708786, 1.02275, 0.5843138, 1, 0, 1,
-0.6392055, -0.08175284, -2.335007, 0.5764706, 1, 0, 1,
-0.6327781, 0.911683, -3.298773, 0.572549, 1, 0, 1,
-0.6243216, -0.3823845, -1.917711, 0.5647059, 1, 0, 1,
-0.6181504, -0.02314962, -0.6563702, 0.5607843, 1, 0, 1,
-0.6176736, 2.168691, -0.5529987, 0.5529412, 1, 0, 1,
-0.6159648, -1.639966, -3.45431, 0.5490196, 1, 0, 1,
-0.6148694, 0.2383279, -0.8846143, 0.5411765, 1, 0, 1,
-0.61425, 1.759573, -0.1790124, 0.5372549, 1, 0, 1,
-0.6137114, -0.006830384, -0.7328452, 0.5294118, 1, 0, 1,
-0.6081172, 1.347532, -0.1646418, 0.5254902, 1, 0, 1,
-0.6044328, -1.013355, -2.867023, 0.5176471, 1, 0, 1,
-0.6006932, -0.7234178, -1.069247, 0.5137255, 1, 0, 1,
-0.5997684, -2.342909, -2.832653, 0.5058824, 1, 0, 1,
-0.594777, -0.1221234, -0.6318516, 0.5019608, 1, 0, 1,
-0.594141, -0.6505008, -2.315861, 0.4941176, 1, 0, 1,
-0.5858716, 0.3536648, -1.105101, 0.4862745, 1, 0, 1,
-0.5841799, -0.7957331, -1.94692, 0.4823529, 1, 0, 1,
-0.583003, 0.09471745, -0.3523597, 0.4745098, 1, 0, 1,
-0.5821015, -0.4616071, -1.768409, 0.4705882, 1, 0, 1,
-0.580487, -0.5669615, -2.144779, 0.4627451, 1, 0, 1,
-0.5789405, 1.030414, -0.390797, 0.4588235, 1, 0, 1,
-0.5741399, 0.9513263, -1.940345, 0.4509804, 1, 0, 1,
-0.5676382, 0.9086968, -0.2924372, 0.4470588, 1, 0, 1,
-0.5648294, 0.7609577, -1.93636, 0.4392157, 1, 0, 1,
-0.5647073, 0.6909567, 0.003096737, 0.4352941, 1, 0, 1,
-0.5646453, 0.599079, -0.9406184, 0.427451, 1, 0, 1,
-0.5597966, 1.543159, -1.382236, 0.4235294, 1, 0, 1,
-0.5572648, -0.7342595, -3.468447, 0.4156863, 1, 0, 1,
-0.5521038, -1.664503, -1.690182, 0.4117647, 1, 0, 1,
-0.5483727, 0.6089163, 0.05098992, 0.4039216, 1, 0, 1,
-0.5483697, -1.982332, -2.31616, 0.3960784, 1, 0, 1,
-0.544006, 2.400475, -1.623307, 0.3921569, 1, 0, 1,
-0.5432437, 0.3040848, -2.512491, 0.3843137, 1, 0, 1,
-0.5358109, -0.2231563, -0.9630561, 0.3803922, 1, 0, 1,
-0.5324728, 0.8203819, -1.210128, 0.372549, 1, 0, 1,
-0.5235711, 0.1345404, 0.3578527, 0.3686275, 1, 0, 1,
-0.514667, 0.679804, -0.9742126, 0.3607843, 1, 0, 1,
-0.514, 1.936133, 0.7525917, 0.3568628, 1, 0, 1,
-0.5120105, -1.824661, -1.456169, 0.3490196, 1, 0, 1,
-0.5070081, -0.2791349, -1.699182, 0.345098, 1, 0, 1,
-0.5008824, 1.00444, -0.9088623, 0.3372549, 1, 0, 1,
-0.5008515, 0.9643335, -0.9087777, 0.3333333, 1, 0, 1,
-0.4966502, -0.2960458, -1.072754, 0.3254902, 1, 0, 1,
-0.4930061, 0.6354402, -0.1960628, 0.3215686, 1, 0, 1,
-0.4921986, -0.1793485, -1.393793, 0.3137255, 1, 0, 1,
-0.4876378, 1.029357, -0.2269372, 0.3098039, 1, 0, 1,
-0.4864163, -0.7132387, -2.403456, 0.3019608, 1, 0, 1,
-0.480378, 0.3903103, -2.970473, 0.2941177, 1, 0, 1,
-0.4799221, 0.04024169, -4.060272, 0.2901961, 1, 0, 1,
-0.4788261, 0.17176, -0.7286037, 0.282353, 1, 0, 1,
-0.476885, 0.7024662, -0.729526, 0.2784314, 1, 0, 1,
-0.4759931, 0.9567584, -0.5226191, 0.2705882, 1, 0, 1,
-0.4744037, -1.395421, -1.478467, 0.2666667, 1, 0, 1,
-0.4714169, 0.4634503, -1.099535, 0.2588235, 1, 0, 1,
-0.4704019, -0.1543592, -3.616379, 0.254902, 1, 0, 1,
-0.4678376, -0.5160977, -1.713549, 0.2470588, 1, 0, 1,
-0.4625079, 0.2371014, 0.1279262, 0.2431373, 1, 0, 1,
-0.4606189, -1.166973, -1.788147, 0.2352941, 1, 0, 1,
-0.4605871, 0.1017141, -1.351063, 0.2313726, 1, 0, 1,
-0.4556094, -0.4921345, -2.307088, 0.2235294, 1, 0, 1,
-0.4534668, -0.1871309, -1.316178, 0.2196078, 1, 0, 1,
-0.4511436, -0.4487014, -2.257009, 0.2117647, 1, 0, 1,
-0.4506177, -0.02511973, -1.352228, 0.2078431, 1, 0, 1,
-0.4467208, 1.825688, 1.641279, 0.2, 1, 0, 1,
-0.4462699, -1.701044, -2.595345, 0.1921569, 1, 0, 1,
-0.4446268, -1.23896, -4.067659, 0.1882353, 1, 0, 1,
-0.4441174, -0.3906199, -1.991647, 0.1803922, 1, 0, 1,
-0.4429035, 0.2018842, -2.25811, 0.1764706, 1, 0, 1,
-0.4396828, 0.1790158, -0.1758602, 0.1686275, 1, 0, 1,
-0.4381606, 0.2066045, -0.7727276, 0.1647059, 1, 0, 1,
-0.4379396, 0.5703782, -2.054469, 0.1568628, 1, 0, 1,
-0.4374874, 1.194232, 0.1014823, 0.1529412, 1, 0, 1,
-0.4313842, 1.475278, -0.696951, 0.145098, 1, 0, 1,
-0.4292709, -0.9586667, -1.230097, 0.1411765, 1, 0, 1,
-0.4270974, 0.115952, -2.896474, 0.1333333, 1, 0, 1,
-0.4262363, -0.1560082, -2.419373, 0.1294118, 1, 0, 1,
-0.425302, -1.920979, -2.122229, 0.1215686, 1, 0, 1,
-0.4246392, 2.479573, -1.66986, 0.1176471, 1, 0, 1,
-0.4237973, -0.05725387, -2.159803, 0.1098039, 1, 0, 1,
-0.423571, 0.9417596, -0.564975, 0.1058824, 1, 0, 1,
-0.4230184, 0.9465971, 1.914116, 0.09803922, 1, 0, 1,
-0.4211462, -0.020633, -1.509691, 0.09019608, 1, 0, 1,
-0.42038, 1.399717, 0.4061735, 0.08627451, 1, 0, 1,
-0.4197245, -0.8675149, -3.151032, 0.07843138, 1, 0, 1,
-0.4188933, 0.3617546, -0.7505068, 0.07450981, 1, 0, 1,
-0.4186241, -1.093272, -3.414917, 0.06666667, 1, 0, 1,
-0.4160693, -1.473758, -2.917456, 0.0627451, 1, 0, 1,
-0.4132109, 1.75779, 0.702395, 0.05490196, 1, 0, 1,
-0.4107538, -1.392464, -4.955174, 0.05098039, 1, 0, 1,
-0.4086494, 0.1026849, -0.4756993, 0.04313726, 1, 0, 1,
-0.4084459, 1.39678, -0.3989838, 0.03921569, 1, 0, 1,
-0.4056967, -0.6191742, -0.9763722, 0.03137255, 1, 0, 1,
-0.4048685, 0.65753, -1.125531, 0.02745098, 1, 0, 1,
-0.404589, -0.2949558, -1.660835, 0.01960784, 1, 0, 1,
-0.3966172, 0.3192335, -0.6657276, 0.01568628, 1, 0, 1,
-0.3910334, -0.7527608, -2.424759, 0.007843138, 1, 0, 1,
-0.3889543, -0.5693215, -0.8470004, 0.003921569, 1, 0, 1,
-0.3839431, 0.1004713, -2.997908, 0, 1, 0.003921569, 1,
-0.3815388, -0.4070625, -3.82291, 0, 1, 0.01176471, 1,
-0.3807216, -0.9026219, -3.10661, 0, 1, 0.01568628, 1,
-0.3769277, 0.4846091, 0.9777356, 0, 1, 0.02352941, 1,
-0.3765459, 0.248237, -0.7365965, 0, 1, 0.02745098, 1,
-0.3687845, -0.02672327, -2.412472, 0, 1, 0.03529412, 1,
-0.3667754, 0.1093444, -1.556281, 0, 1, 0.03921569, 1,
-0.3636527, 0.4090444, 1.676549, 0, 1, 0.04705882, 1,
-0.356035, -0.9516885, -3.120129, 0, 1, 0.05098039, 1,
-0.3530272, -1.220199, -2.43562, 0, 1, 0.05882353, 1,
-0.3509373, -1.525353, -3.604341, 0, 1, 0.0627451, 1,
-0.3474542, -0.4297152, -2.297297, 0, 1, 0.07058824, 1,
-0.3461775, -1.082751, -3.522892, 0, 1, 0.07450981, 1,
-0.3457925, -1.104323, -2.175469, 0, 1, 0.08235294, 1,
-0.3444733, 2.668085, 0.1257011, 0, 1, 0.08627451, 1,
-0.3410295, 0.7589772, -0.8053017, 0, 1, 0.09411765, 1,
-0.3375713, 1.480791, -0.9253269, 0, 1, 0.1019608, 1,
-0.336339, 0.2091054, -1.112184, 0, 1, 0.1058824, 1,
-0.3327379, -1.456057, -1.78901, 0, 1, 0.1137255, 1,
-0.3323244, 0.2537775, -0.423847, 0, 1, 0.1176471, 1,
-0.3322748, -0.8059418, -4.958979, 0, 1, 0.1254902, 1,
-0.3306375, 0.7604575, 0.5698438, 0, 1, 0.1294118, 1,
-0.3288681, -0.180351, -1.570514, 0, 1, 0.1372549, 1,
-0.327448, 0.03319928, -1.456077, 0, 1, 0.1411765, 1,
-0.3273191, 1.643566, -1.894029, 0, 1, 0.1490196, 1,
-0.3254659, 0.6539188, -0.4974739, 0, 1, 0.1529412, 1,
-0.3238702, -1.28219, -3.860402, 0, 1, 0.1607843, 1,
-0.3200162, 0.4380524, -2.218795, 0, 1, 0.1647059, 1,
-0.3129597, 0.9744436, 0.5645167, 0, 1, 0.172549, 1,
-0.3103064, -0.4278943, -1.471097, 0, 1, 0.1764706, 1,
-0.2998846, -0.2040965, -0.7150872, 0, 1, 0.1843137, 1,
-0.2987875, 0.8251838, -2.231873, 0, 1, 0.1882353, 1,
-0.296515, 0.2591365, -0.6556803, 0, 1, 0.1960784, 1,
-0.2957245, -0.3548372, -1.715873, 0, 1, 0.2039216, 1,
-0.2938877, -1.115232, -2.526138, 0, 1, 0.2078431, 1,
-0.2864661, 0.4624585, 0.4371279, 0, 1, 0.2156863, 1,
-0.2848194, -0.2654251, -3.815208, 0, 1, 0.2196078, 1,
-0.2800707, 1.245382, 0.5233784, 0, 1, 0.227451, 1,
-0.2794527, -0.2792425, -1.859126, 0, 1, 0.2313726, 1,
-0.2775148, -0.1156197, -2.650084, 0, 1, 0.2392157, 1,
-0.2770087, 0.4304899, 0.2708713, 0, 1, 0.2431373, 1,
-0.2743421, -2.465414, -3.102045, 0, 1, 0.2509804, 1,
-0.2673205, 1.632387, 0.5814634, 0, 1, 0.254902, 1,
-0.2662629, -0.9088156, -1.871762, 0, 1, 0.2627451, 1,
-0.2620286, -0.2464798, -2.234402, 0, 1, 0.2666667, 1,
-0.2534224, 0.9728819, -0.8288048, 0, 1, 0.2745098, 1,
-0.2525533, -0.7126065, -1.873075, 0, 1, 0.2784314, 1,
-0.2482017, 1.006576, -0.08768957, 0, 1, 0.2862745, 1,
-0.2468749, 2.162862, -0.1455674, 0, 1, 0.2901961, 1,
-0.2461174, -0.1931151, -3.456378, 0, 1, 0.2980392, 1,
-0.2436524, 0.9515205, -1.098935, 0, 1, 0.3058824, 1,
-0.2431471, -0.06947951, -2.474087, 0, 1, 0.3098039, 1,
-0.2407976, 1.211177, -2.276845, 0, 1, 0.3176471, 1,
-0.2354828, -0.08426027, -3.416854, 0, 1, 0.3215686, 1,
-0.2343368, 0.04600088, 0.4256579, 0, 1, 0.3294118, 1,
-0.2342688, 0.4982208, 1.210165, 0, 1, 0.3333333, 1,
-0.231684, -0.5153966, -2.42134, 0, 1, 0.3411765, 1,
-0.2306948, 1.097821, 0.1230539, 0, 1, 0.345098, 1,
-0.2299968, 0.06748962, -0.8424311, 0, 1, 0.3529412, 1,
-0.229308, -1.243896, -2.891291, 0, 1, 0.3568628, 1,
-0.2285864, 0.967304, 0.4783278, 0, 1, 0.3647059, 1,
-0.2278416, -0.4876173, -3.502663, 0, 1, 0.3686275, 1,
-0.2242654, -0.9876571, -3.713911, 0, 1, 0.3764706, 1,
-0.2210215, 1.094312, -0.1496333, 0, 1, 0.3803922, 1,
-0.219234, 0.6318607, 0.2455168, 0, 1, 0.3882353, 1,
-0.213831, 0.2859047, 0.04853106, 0, 1, 0.3921569, 1,
-0.2130327, -0.3892443, -2.164949, 0, 1, 0.4, 1,
-0.2120806, -0.5328954, -3.761326, 0, 1, 0.4078431, 1,
-0.2066078, -0.6421021, -2.650695, 0, 1, 0.4117647, 1,
-0.1967986, 1.657657, 0.164338, 0, 1, 0.4196078, 1,
-0.1908645, -1.213218, -2.734219, 0, 1, 0.4235294, 1,
-0.1905667, -0.1664255, -2.348813, 0, 1, 0.4313726, 1,
-0.1862344, 2.168337, -1.041962, 0, 1, 0.4352941, 1,
-0.185133, 0.5523782, -0.2052684, 0, 1, 0.4431373, 1,
-0.1802946, 0.09922365, -0.6165068, 0, 1, 0.4470588, 1,
-0.1790243, -0.8114569, -2.489052, 0, 1, 0.454902, 1,
-0.1774202, -0.6537555, -3.083965, 0, 1, 0.4588235, 1,
-0.1761261, -0.1118898, -2.974576, 0, 1, 0.4666667, 1,
-0.1760059, 1.869966, -0.3740963, 0, 1, 0.4705882, 1,
-0.1741052, -1.37261, -1.956983, 0, 1, 0.4784314, 1,
-0.1693439, -0.3677063, -1.84899, 0, 1, 0.4823529, 1,
-0.1687794, -0.6705214, -2.959207, 0, 1, 0.4901961, 1,
-0.1674308, -0.03571487, -1.313062, 0, 1, 0.4941176, 1,
-0.1668187, -1.823234, -3.670389, 0, 1, 0.5019608, 1,
-0.1645233, 0.8011, -0.6624956, 0, 1, 0.509804, 1,
-0.1622401, -0.9544545, -3.770114, 0, 1, 0.5137255, 1,
-0.1530131, 2.083638, -0.1714904, 0, 1, 0.5215687, 1,
-0.1518043, 1.407491, 2.193612, 0, 1, 0.5254902, 1,
-0.1516185, 0.6195694, -0.09140952, 0, 1, 0.5333334, 1,
-0.1515328, -1.615488, -3.897937, 0, 1, 0.5372549, 1,
-0.1504333, -0.4345204, -3.417816, 0, 1, 0.5450981, 1,
-0.1492581, 0.5172591, -0.3019013, 0, 1, 0.5490196, 1,
-0.1484967, -0.8753345, -2.781275, 0, 1, 0.5568628, 1,
-0.1478673, -0.3550622, -1.957052, 0, 1, 0.5607843, 1,
-0.1436414, -1.067147, -1.379346, 0, 1, 0.5686275, 1,
-0.139818, 0.2250833, 0.9833543, 0, 1, 0.572549, 1,
-0.1388243, 1.117608, -0.7826225, 0, 1, 0.5803922, 1,
-0.1364518, -0.630275, -2.699751, 0, 1, 0.5843138, 1,
-0.1308531, 1.003038, -0.2419687, 0, 1, 0.5921569, 1,
-0.130722, 0.08454176, -0.2208299, 0, 1, 0.5960785, 1,
-0.1249214, 1.079816, 2.085408, 0, 1, 0.6039216, 1,
-0.1228964, 1.05447, -0.4366575, 0, 1, 0.6117647, 1,
-0.1180488, -0.3502883, -2.445127, 0, 1, 0.6156863, 1,
-0.1145261, -0.605827, -2.290701, 0, 1, 0.6235294, 1,
-0.1143526, -0.6975683, -0.8114854, 0, 1, 0.627451, 1,
-0.1143444, 0.105827, -1.078833, 0, 1, 0.6352941, 1,
-0.1125314, 0.2980201, -0.853748, 0, 1, 0.6392157, 1,
-0.110399, 0.8820001, 2.428916, 0, 1, 0.6470588, 1,
-0.1063427, -2.097858, -3.432945, 0, 1, 0.6509804, 1,
-0.1048302, 1.695014, 0.4295278, 0, 1, 0.6588235, 1,
-0.1028863, -0.5948918, -2.301102, 0, 1, 0.6627451, 1,
-0.09769407, 0.7934679, -0.9010691, 0, 1, 0.6705883, 1,
-0.09560759, 1.648531, -0.4001751, 0, 1, 0.6745098, 1,
-0.09451532, 0.4989919, 0.9987683, 0, 1, 0.682353, 1,
-0.09392446, 0.5092186, -1.010955, 0, 1, 0.6862745, 1,
-0.08979667, 0.7026908, -0.2947203, 0, 1, 0.6941177, 1,
-0.08818436, 1.993165, 0.4266135, 0, 1, 0.7019608, 1,
-0.0880218, -0.002925242, -1.292847, 0, 1, 0.7058824, 1,
-0.08768176, -0.4560523, -2.577784, 0, 1, 0.7137255, 1,
-0.08714449, -0.5344961, -4.026983, 0, 1, 0.7176471, 1,
-0.08510023, -1.630855, -3.490155, 0, 1, 0.7254902, 1,
-0.08092876, -0.3496496, -2.460042, 0, 1, 0.7294118, 1,
-0.08032369, 0.5408619, -0.6967493, 0, 1, 0.7372549, 1,
-0.07862108, -1.227901, -3.239159, 0, 1, 0.7411765, 1,
-0.07707811, 0.474472, -0.04726022, 0, 1, 0.7490196, 1,
-0.07400458, 0.7147687, -0.1467976, 0, 1, 0.7529412, 1,
-0.07331716, 0.9843737, -0.4191491, 0, 1, 0.7607843, 1,
-0.06807416, -0.1275289, -2.294821, 0, 1, 0.7647059, 1,
-0.06787945, -1.033795, -3.101853, 0, 1, 0.772549, 1,
-0.06635897, 0.7926059, 0.356511, 0, 1, 0.7764706, 1,
-0.06592689, 0.1234779, -0.8825181, 0, 1, 0.7843137, 1,
-0.06114811, -1.445214, -3.158677, 0, 1, 0.7882353, 1,
-0.06012336, -0.6111943, -3.743918, 0, 1, 0.7960784, 1,
-0.05903055, 1.082585, -0.5881308, 0, 1, 0.8039216, 1,
-0.05835482, -0.2346914, -3.157825, 0, 1, 0.8078431, 1,
-0.05376427, -1.320394, -4.516581, 0, 1, 0.8156863, 1,
-0.05191818, 0.4606427, -2.302958, 0, 1, 0.8196079, 1,
-0.04661334, 0.2671678, -0.002607499, 0, 1, 0.827451, 1,
-0.04608567, 1.554766, 0.2881913, 0, 1, 0.8313726, 1,
-0.04260779, 1.448806, 0.3772453, 0, 1, 0.8392157, 1,
-0.04166297, 0.3211028, -0.684841, 0, 1, 0.8431373, 1,
-0.03817359, 1.150445, 1.157251, 0, 1, 0.8509804, 1,
-0.03601665, 0.7424477, 0.8947497, 0, 1, 0.854902, 1,
-0.03511218, -0.16089, -2.244345, 0, 1, 0.8627451, 1,
-0.03120274, -1.571558, -5.469362, 0, 1, 0.8666667, 1,
-0.02868418, 0.644694, 1.86102, 0, 1, 0.8745098, 1,
-0.02811563, 0.515888, -0.269746, 0, 1, 0.8784314, 1,
-0.0256864, 0.5201731, 0.0942766, 0, 1, 0.8862745, 1,
-0.02407309, -1.04615, -1.536443, 0, 1, 0.8901961, 1,
-0.02230462, 1.182455, 0.2334456, 0, 1, 0.8980392, 1,
-0.02140271, -0.2798475, -2.500508, 0, 1, 0.9058824, 1,
-0.01519333, -0.1677739, -1.863603, 0, 1, 0.9098039, 1,
-0.0149385, 0.6508213, -1.047748, 0, 1, 0.9176471, 1,
-0.01369455, -0.4436151, -3.377953, 0, 1, 0.9215686, 1,
-0.01251971, -0.1341048, -2.675844, 0, 1, 0.9294118, 1,
-0.01101481, 1.746303, -0.6529676, 0, 1, 0.9333333, 1,
-0.008323663, -0.1306935, -2.818156, 0, 1, 0.9411765, 1,
-0.004320838, 0.4758447, -1.537278, 0, 1, 0.945098, 1,
-0.002095378, -0.4767344, -2.918998, 0, 1, 0.9529412, 1,
-0.000642916, -0.3864598, -5.087178, 0, 1, 0.9568627, 1,
0.0008726035, -0.2045413, 2.578787, 0, 1, 0.9647059, 1,
0.001283905, -1.477104, 1.715317, 0, 1, 0.9686275, 1,
0.008684393, -0.2229767, 2.230138, 0, 1, 0.9764706, 1,
0.009960035, -0.1771525, 1.142098, 0, 1, 0.9803922, 1,
0.01216844, -1.148855, 1.819434, 0, 1, 0.9882353, 1,
0.01896584, -0.2607371, 2.772886, 0, 1, 0.9921569, 1,
0.02115796, 0.7109284, 0.7858077, 0, 1, 1, 1,
0.02716246, 1.574808, -0.6105909, 0, 0.9921569, 1, 1,
0.03100809, 1.099749, 1.220845, 0, 0.9882353, 1, 1,
0.03139611, 1.167283, 1.731373, 0, 0.9803922, 1, 1,
0.03180555, 0.355044, 0.6213577, 0, 0.9764706, 1, 1,
0.03646747, -1.199531, 2.52488, 0, 0.9686275, 1, 1,
0.03651809, -0.9662085, 3.259219, 0, 0.9647059, 1, 1,
0.03869182, 2.010729, -0.0953898, 0, 0.9568627, 1, 1,
0.04385181, -0.9541168, 2.517347, 0, 0.9529412, 1, 1,
0.05218337, 1.064439, 0.3498701, 0, 0.945098, 1, 1,
0.05313548, 0.6612464, -0.2826149, 0, 0.9411765, 1, 1,
0.05660186, 0.1439354, -1.149115, 0, 0.9333333, 1, 1,
0.057394, -1.794567, 3.524142, 0, 0.9294118, 1, 1,
0.0610049, 0.3472406, 0.04367316, 0, 0.9215686, 1, 1,
0.06305388, 0.9277231, -1.847071, 0, 0.9176471, 1, 1,
0.07031424, -0.9211975, 2.448357, 0, 0.9098039, 1, 1,
0.07171941, 1.3119, 0.7451846, 0, 0.9058824, 1, 1,
0.07357215, -0.1018866, 1.634584, 0, 0.8980392, 1, 1,
0.07832984, 0.6317533, -0.2316856, 0, 0.8901961, 1, 1,
0.08071951, -1.526511, 2.847263, 0, 0.8862745, 1, 1,
0.08632711, -0.0950795, 2.575733, 0, 0.8784314, 1, 1,
0.09199348, -0.8310515, 4.935558, 0, 0.8745098, 1, 1,
0.09484591, -0.8146505, 3.980613, 0, 0.8666667, 1, 1,
0.09584044, 0.3467357, 0.4817272, 0, 0.8627451, 1, 1,
0.09773624, -0.3013011, 5.070997, 0, 0.854902, 1, 1,
0.09850466, 0.5023172, -0.279227, 0, 0.8509804, 1, 1,
0.1009068, -0.3334914, 1.477909, 0, 0.8431373, 1, 1,
0.1011371, -1.939542, 3.834646, 0, 0.8392157, 1, 1,
0.1032094, 0.8299403, -0.4696109, 0, 0.8313726, 1, 1,
0.1064691, -0.958645, 3.015095, 0, 0.827451, 1, 1,
0.1070968, 0.1352075, 0.5706438, 0, 0.8196079, 1, 1,
0.1109095, -2.96729, 2.986059, 0, 0.8156863, 1, 1,
0.1116379, 1.844145, -1.314984, 0, 0.8078431, 1, 1,
0.1162657, -2.019153, 4.041646, 0, 0.8039216, 1, 1,
0.117882, 1.10954, 1.664027, 0, 0.7960784, 1, 1,
0.1207814, 0.6953007, -1.26964, 0, 0.7882353, 1, 1,
0.1283849, -0.8538688, 4.116271, 0, 0.7843137, 1, 1,
0.1294163, -0.1939903, 1.427878, 0, 0.7764706, 1, 1,
0.1367599, 0.5540521, 0.09329626, 0, 0.772549, 1, 1,
0.1389403, -0.1896587, 1.477399, 0, 0.7647059, 1, 1,
0.141744, -0.3600543, 3.263658, 0, 0.7607843, 1, 1,
0.1418199, 0.02038736, 1.077331, 0, 0.7529412, 1, 1,
0.1430213, -0.5611683, 0.8171477, 0, 0.7490196, 1, 1,
0.158305, 0.5744074, 0.5385392, 0, 0.7411765, 1, 1,
0.1592872, 0.4217615, -0.2032544, 0, 0.7372549, 1, 1,
0.1644502, 1.862074, 0.1437845, 0, 0.7294118, 1, 1,
0.1654116, -0.1054176, 2.701406, 0, 0.7254902, 1, 1,
0.1663576, 1.410253, -0.128178, 0, 0.7176471, 1, 1,
0.1685187, -1.619627, 3.774615, 0, 0.7137255, 1, 1,
0.1717371, 0.9813353, 0.7240749, 0, 0.7058824, 1, 1,
0.1722702, -1.658325, 1.246748, 0, 0.6980392, 1, 1,
0.1728683, -0.5805137, 0.5832616, 0, 0.6941177, 1, 1,
0.1751479, -1.042362, 2.92894, 0, 0.6862745, 1, 1,
0.1776004, -0.5076058, 3.859276, 0, 0.682353, 1, 1,
0.1777029, 0.6987656, 0.4965577, 0, 0.6745098, 1, 1,
0.1822636, 0.007016301, 0.5654706, 0, 0.6705883, 1, 1,
0.184013, 1.102896, 0.6372914, 0, 0.6627451, 1, 1,
0.18511, -0.02013771, 1.314983, 0, 0.6588235, 1, 1,
0.1859092, -0.5511193, 2.964792, 0, 0.6509804, 1, 1,
0.1871843, -0.03075904, 2.009143, 0, 0.6470588, 1, 1,
0.1881241, 1.04936, 0.1240912, 0, 0.6392157, 1, 1,
0.1884467, 0.8861988, -0.1566706, 0, 0.6352941, 1, 1,
0.1902132, 0.3942104, 0.4244264, 0, 0.627451, 1, 1,
0.1938448, -0.1623605, 3.595277, 0, 0.6235294, 1, 1,
0.2005324, 0.3084669, 0.1807278, 0, 0.6156863, 1, 1,
0.2034978, 0.4244668, 0.2370245, 0, 0.6117647, 1, 1,
0.2052985, 0.3101131, -0.7304625, 0, 0.6039216, 1, 1,
0.2083001, 0.3101678, -0.2273483, 0, 0.5960785, 1, 1,
0.20942, 0.7638088, 1.166541, 0, 0.5921569, 1, 1,
0.2109562, 1.11791, -2.041811, 0, 0.5843138, 1, 1,
0.2136858, -0.2677918, 1.362776, 0, 0.5803922, 1, 1,
0.2144338, 1.358805, -0.6252272, 0, 0.572549, 1, 1,
0.2154928, 0.2585755, 0.9700017, 0, 0.5686275, 1, 1,
0.2184107, -1.001188, 3.365967, 0, 0.5607843, 1, 1,
0.2189882, -0.8172672, 3.384693, 0, 0.5568628, 1, 1,
0.2213017, 1.25983, 0.4074576, 0, 0.5490196, 1, 1,
0.2242994, -0.2209464, 0.8427778, 0, 0.5450981, 1, 1,
0.2285682, -0.4444293, 2.051543, 0, 0.5372549, 1, 1,
0.2292438, -1.196567, 3.244416, 0, 0.5333334, 1, 1,
0.2362754, 0.8614568, -0.7759434, 0, 0.5254902, 1, 1,
0.2368648, 0.8132679, -0.7661817, 0, 0.5215687, 1, 1,
0.2377424, 1.277038, 2.01982, 0, 0.5137255, 1, 1,
0.2379143, -1.087177, 1.951281, 0, 0.509804, 1, 1,
0.2380241, -0.1142587, 0.1901727, 0, 0.5019608, 1, 1,
0.2383818, -0.3419265, 3.245771, 0, 0.4941176, 1, 1,
0.2408042, 1.78541, -0.3674216, 0, 0.4901961, 1, 1,
0.2425364, -1.032267, 4.024475, 0, 0.4823529, 1, 1,
0.2438785, 0.1228237, 0.4566388, 0, 0.4784314, 1, 1,
0.2457978, 1.087053, -0.07748579, 0, 0.4705882, 1, 1,
0.2470389, -0.5661995, 1.811331, 0, 0.4666667, 1, 1,
0.2496398, -0.8784311, 3.155994, 0, 0.4588235, 1, 1,
0.2509839, -0.1049712, 2.344589, 0, 0.454902, 1, 1,
0.2561695, -0.3406104, 2.694175, 0, 0.4470588, 1, 1,
0.2589357, -0.7087654, 2.458084, 0, 0.4431373, 1, 1,
0.263375, -2.045303, 3.278041, 0, 0.4352941, 1, 1,
0.2646102, -0.4581063, 2.450122, 0, 0.4313726, 1, 1,
0.265554, 0.610368, 0.935376, 0, 0.4235294, 1, 1,
0.2665968, 0.9842337, 1.703641, 0, 0.4196078, 1, 1,
0.2743152, 1.08993, -0.1076018, 0, 0.4117647, 1, 1,
0.2753143, -0.1089083, 2.139441, 0, 0.4078431, 1, 1,
0.2770854, 1.47714, 1.224262, 0, 0.4, 1, 1,
0.2808768, -1.215999, 3.717113, 0, 0.3921569, 1, 1,
0.2860247, 1.144253, -0.1254176, 0, 0.3882353, 1, 1,
0.2871566, -0.1613038, 0.9173205, 0, 0.3803922, 1, 1,
0.293905, -0.3203195, 2.508114, 0, 0.3764706, 1, 1,
0.2953921, 0.0966157, 1.212659, 0, 0.3686275, 1, 1,
0.2964476, -0.2174315, 2.693131, 0, 0.3647059, 1, 1,
0.2982135, -0.7419508, 2.727391, 0, 0.3568628, 1, 1,
0.2992651, -1.271707, 1.812835, 0, 0.3529412, 1, 1,
0.3017611, -0.1840265, 1.895729, 0, 0.345098, 1, 1,
0.3022134, 0.05421179, 1.138986, 0, 0.3411765, 1, 1,
0.3050412, -0.9906856, 3.817708, 0, 0.3333333, 1, 1,
0.3051766, 0.3067125, 2.064848, 0, 0.3294118, 1, 1,
0.3066732, 0.3085556, -1.223092, 0, 0.3215686, 1, 1,
0.3078133, 0.0228256, 0.6920835, 0, 0.3176471, 1, 1,
0.3080816, -0.1374062, 2.281803, 0, 0.3098039, 1, 1,
0.3085944, -1.189054, 1.858604, 0, 0.3058824, 1, 1,
0.3123235, -0.9636049, 3.943633, 0, 0.2980392, 1, 1,
0.3150336, 0.1534611, 1.828726, 0, 0.2901961, 1, 1,
0.3153338, -1.164511, 2.683734, 0, 0.2862745, 1, 1,
0.3173101, 1.616802, -0.1378448, 0, 0.2784314, 1, 1,
0.3179542, -1.944202, 4.479283, 0, 0.2745098, 1, 1,
0.3219303, -0.2707922, 2.72164, 0, 0.2666667, 1, 1,
0.3248499, 0.4216516, 1.444946, 0, 0.2627451, 1, 1,
0.3274678, 0.4315064, -1.118555, 0, 0.254902, 1, 1,
0.3412243, -0.7974014, 2.640506, 0, 0.2509804, 1, 1,
0.3504631, -0.9905039, 2.006929, 0, 0.2431373, 1, 1,
0.3517627, -0.4169028, 2.99485, 0, 0.2392157, 1, 1,
0.3548191, -1.122512, 3.565788, 0, 0.2313726, 1, 1,
0.3580022, 1.460033, 0.9355705, 0, 0.227451, 1, 1,
0.3613287, 1.345332, -0.5799301, 0, 0.2196078, 1, 1,
0.3654785, -1.678577, 3.849659, 0, 0.2156863, 1, 1,
0.3681184, 0.1913464, 1.531793, 0, 0.2078431, 1, 1,
0.3701253, 1.079055, 0.7978855, 0, 0.2039216, 1, 1,
0.3703608, 0.3656498, 0.7006649, 0, 0.1960784, 1, 1,
0.3797294, 0.1537071, 1.785517, 0, 0.1882353, 1, 1,
0.385295, 1.716767, 0.9379843, 0, 0.1843137, 1, 1,
0.3858978, 0.7875596, 1.880603, 0, 0.1764706, 1, 1,
0.3890814, -0.8200029, 3.385451, 0, 0.172549, 1, 1,
0.3894772, -1.744564, 1.885604, 0, 0.1647059, 1, 1,
0.3911965, 1.37748, 0.8889673, 0, 0.1607843, 1, 1,
0.3925764, -0.6736845, 4.049673, 0, 0.1529412, 1, 1,
0.3932988, -0.99629, 2.834244, 0, 0.1490196, 1, 1,
0.3985763, 2.035764, 0.07429267, 0, 0.1411765, 1, 1,
0.4116405, -0.5348819, 3.798874, 0, 0.1372549, 1, 1,
0.4198753, 0.2922095, -0.09323311, 0, 0.1294118, 1, 1,
0.420017, 0.2319765, 0.9003097, 0, 0.1254902, 1, 1,
0.4266953, 1.176845, 0.3408235, 0, 0.1176471, 1, 1,
0.4283437, 0.3908275, -0.07557572, 0, 0.1137255, 1, 1,
0.4289404, 0.1652322, 2.51368, 0, 0.1058824, 1, 1,
0.4304967, -0.272094, 1.887302, 0, 0.09803922, 1, 1,
0.4355904, -0.9483572, 3.794357, 0, 0.09411765, 1, 1,
0.436097, -0.8308559, 1.825424, 0, 0.08627451, 1, 1,
0.4377517, -0.5033397, 3.620247, 0, 0.08235294, 1, 1,
0.444086, -0.7245548, 4.677229, 0, 0.07450981, 1, 1,
0.4539826, 0.1875529, 1.18549, 0, 0.07058824, 1, 1,
0.4618325, -0.2926913, 2.011614, 0, 0.0627451, 1, 1,
0.4618803, -1.204722, 3.268649, 0, 0.05882353, 1, 1,
0.464966, -0.2773221, 2.541787, 0, 0.05098039, 1, 1,
0.4656857, -0.5676163, 3.191084, 0, 0.04705882, 1, 1,
0.4658706, 0.8953724, -0.136922, 0, 0.03921569, 1, 1,
0.4669071, 0.7794253, 0.6585785, 0, 0.03529412, 1, 1,
0.4671355, -0.4596593, 1.983147, 0, 0.02745098, 1, 1,
0.467452, -0.01237677, 0.6877952, 0, 0.02352941, 1, 1,
0.4728343, 2.092507, -0.1639576, 0, 0.01568628, 1, 1,
0.4734899, 1.24418, 0.4374548, 0, 0.01176471, 1, 1,
0.4736898, -1.459899, 2.426972, 0, 0.003921569, 1, 1,
0.4759428, 0.199698, -0.5256982, 0.003921569, 0, 1, 1,
0.4806968, -1.138743, 4.161214, 0.007843138, 0, 1, 1,
0.481245, 2.176637, -0.1265312, 0.01568628, 0, 1, 1,
0.4815515, 0.285686, 2.45057, 0.01960784, 0, 1, 1,
0.4825999, 1.727299, 0.1813361, 0.02745098, 0, 1, 1,
0.4861503, -0.7052969, 1.790213, 0.03137255, 0, 1, 1,
0.4877931, -0.08263205, 1.336008, 0.03921569, 0, 1, 1,
0.4933145, -0.4328465, 2.27764, 0.04313726, 0, 1, 1,
0.4943211, 0.9232825, 2.269329, 0.05098039, 0, 1, 1,
0.4962387, -1.012082, 3.210036, 0.05490196, 0, 1, 1,
0.4982829, -2.364666, 3.91416, 0.0627451, 0, 1, 1,
0.4993588, -0.160193, 1.802995, 0.06666667, 0, 1, 1,
0.5019192, -0.7416095, 2.407508, 0.07450981, 0, 1, 1,
0.5032618, -1.130611, 1.819666, 0.07843138, 0, 1, 1,
0.5048785, -1.319204, 3.425405, 0.08627451, 0, 1, 1,
0.516821, -0.3075544, 4.978753, 0.09019608, 0, 1, 1,
0.5178929, -0.7865769, 2.734481, 0.09803922, 0, 1, 1,
0.5181606, -2.095929, 2.730447, 0.1058824, 0, 1, 1,
0.5194035, 0.1133965, 2.281184, 0.1098039, 0, 1, 1,
0.5221109, -0.02259148, 1.247641, 0.1176471, 0, 1, 1,
0.5232673, 0.850652, -0.4935008, 0.1215686, 0, 1, 1,
0.5234008, 0.6922807, 0.9758865, 0.1294118, 0, 1, 1,
0.5333608, 0.4791956, 2.370748, 0.1333333, 0, 1, 1,
0.5340849, 0.6248788, -1.009448, 0.1411765, 0, 1, 1,
0.5376941, 0.1082107, -0.1842251, 0.145098, 0, 1, 1,
0.542277, -0.9430023, 3.530494, 0.1529412, 0, 1, 1,
0.543433, 0.3583693, 3.143053, 0.1568628, 0, 1, 1,
0.5490606, 0.213097, 0.4315577, 0.1647059, 0, 1, 1,
0.5499769, 0.2078944, -0.4319582, 0.1686275, 0, 1, 1,
0.5510945, 0.2396754, -0.6127852, 0.1764706, 0, 1, 1,
0.5566604, 1.650278, -0.8396046, 0.1803922, 0, 1, 1,
0.5648334, 0.7017629, 0.716731, 0.1882353, 0, 1, 1,
0.5663857, 0.3680041, 0.4685927, 0.1921569, 0, 1, 1,
0.5663898, -0.9746794, 3.162504, 0.2, 0, 1, 1,
0.5719396, 0.9207547, -1.249089, 0.2078431, 0, 1, 1,
0.5740418, 0.4302315, 1.511048, 0.2117647, 0, 1, 1,
0.5742597, 1.596569, 1.570964, 0.2196078, 0, 1, 1,
0.5757772, -0.5201607, 3.964641, 0.2235294, 0, 1, 1,
0.5768462, 0.01911721, 2.135359, 0.2313726, 0, 1, 1,
0.5863222, -1.185782, 2.259053, 0.2352941, 0, 1, 1,
0.5886258, -0.01151055, 1.707824, 0.2431373, 0, 1, 1,
0.5984453, -0.1145652, 1.46678, 0.2470588, 0, 1, 1,
0.5993695, 1.231309, -0.9945421, 0.254902, 0, 1, 1,
0.6004145, 0.6626836, 0.7617931, 0.2588235, 0, 1, 1,
0.6037543, -0.4308268, 1.912093, 0.2666667, 0, 1, 1,
0.6062914, 1.814635, 0.2966167, 0.2705882, 0, 1, 1,
0.6063165, -1.006597, 1.085388, 0.2784314, 0, 1, 1,
0.6064079, -0.6248893, 2.883916, 0.282353, 0, 1, 1,
0.6064525, 1.075999, 0.2547354, 0.2901961, 0, 1, 1,
0.6085218, 0.643311, 0.5320396, 0.2941177, 0, 1, 1,
0.6087564, 1.233038, -1.389078, 0.3019608, 0, 1, 1,
0.6167294, -1.694132, 2.612114, 0.3098039, 0, 1, 1,
0.621194, 0.6385157, -0.02574006, 0.3137255, 0, 1, 1,
0.6212227, 0.5020028, 0.4515258, 0.3215686, 0, 1, 1,
0.6218124, -0.9368484, 1.971941, 0.3254902, 0, 1, 1,
0.6257593, -1.64118, 2.722667, 0.3333333, 0, 1, 1,
0.6281389, -1.835393, 1.032171, 0.3372549, 0, 1, 1,
0.6296266, -0.3281433, 2.364887, 0.345098, 0, 1, 1,
0.6385338, -1.343825, 1.055942, 0.3490196, 0, 1, 1,
0.6387318, 0.8813921, 0.7650014, 0.3568628, 0, 1, 1,
0.6446639, -1.2283, 3.389345, 0.3607843, 0, 1, 1,
0.6456309, 3.070066, -0.1062792, 0.3686275, 0, 1, 1,
0.6470224, 0.2177371, 0.1636135, 0.372549, 0, 1, 1,
0.6531157, -1.053274, 2.586026, 0.3803922, 0, 1, 1,
0.6556371, -0.01130429, 1.742679, 0.3843137, 0, 1, 1,
0.6582757, -0.5475441, 1.649086, 0.3921569, 0, 1, 1,
0.6589692, 2.346818, 1.275037, 0.3960784, 0, 1, 1,
0.6626163, -0.02380722, 0.3245513, 0.4039216, 0, 1, 1,
0.6652982, 0.9404368, -0.03046704, 0.4117647, 0, 1, 1,
0.6700726, 0.9930013, 1.30701, 0.4156863, 0, 1, 1,
0.6716537, 1.84003, 0.3656231, 0.4235294, 0, 1, 1,
0.6743532, -1.685521, 4.838192, 0.427451, 0, 1, 1,
0.6866661, -0.6021681, 1.72586, 0.4352941, 0, 1, 1,
0.6885931, -1.962229, 2.881053, 0.4392157, 0, 1, 1,
0.6941299, 0.902032, -0.555031, 0.4470588, 0, 1, 1,
0.6948061, 1.235353, 0.1526636, 0.4509804, 0, 1, 1,
0.6984405, -0.9973539, 2.617706, 0.4588235, 0, 1, 1,
0.7020733, 0.7127479, -0.6838826, 0.4627451, 0, 1, 1,
0.7025241, -0.615718, -1.081555, 0.4705882, 0, 1, 1,
0.7058488, 0.8513586, 1.93945, 0.4745098, 0, 1, 1,
0.7091995, -1.181987, 2.113661, 0.4823529, 0, 1, 1,
0.710117, -0.2301729, 1.544519, 0.4862745, 0, 1, 1,
0.7110336, 0.3367977, 1.53245, 0.4941176, 0, 1, 1,
0.7115813, 0.1001703, -1.093989, 0.5019608, 0, 1, 1,
0.713484, 1.959481, 1.4361, 0.5058824, 0, 1, 1,
0.7158606, -2.221377, 4.041744, 0.5137255, 0, 1, 1,
0.7158757, -0.3754812, 0.8345857, 0.5176471, 0, 1, 1,
0.719624, -0.8201483, 4.024992, 0.5254902, 0, 1, 1,
0.7199256, -0.3208697, -0.0813356, 0.5294118, 0, 1, 1,
0.719991, 0.05419994, 1.772902, 0.5372549, 0, 1, 1,
0.7208729, 1.078, -0.9568501, 0.5411765, 0, 1, 1,
0.7235103, -1.092675, 5.621276, 0.5490196, 0, 1, 1,
0.7289295, 0.4465545, 1.782607, 0.5529412, 0, 1, 1,
0.7413052, -0.3244688, 1.711407, 0.5607843, 0, 1, 1,
0.7422233, -0.06354234, 0.6030095, 0.5647059, 0, 1, 1,
0.7499077, 0.5041993, 1.365833, 0.572549, 0, 1, 1,
0.750948, -0.1981689, 1.625908, 0.5764706, 0, 1, 1,
0.7565027, 1.894066, 0.96006, 0.5843138, 0, 1, 1,
0.7584267, 0.1279716, 1.33837, 0.5882353, 0, 1, 1,
0.7667912, 0.0456627, 1.014054, 0.5960785, 0, 1, 1,
0.774784, 1.633439, -0.6165764, 0.6039216, 0, 1, 1,
0.7781221, 1.27945, 0.2557274, 0.6078432, 0, 1, 1,
0.7795401, -0.05995928, -0.3582087, 0.6156863, 0, 1, 1,
0.7819853, 0.4818003, 2.020681, 0.6196079, 0, 1, 1,
0.7830964, 0.5915811, 3.003828, 0.627451, 0, 1, 1,
0.7868028, 1.147887, -0.2288823, 0.6313726, 0, 1, 1,
0.789822, 1.340119, 0.7694994, 0.6392157, 0, 1, 1,
0.796024, -0.4636338, 4.177902, 0.6431373, 0, 1, 1,
0.7972202, 0.04111945, 2.810383, 0.6509804, 0, 1, 1,
0.7989395, 0.07149755, -0.3431996, 0.654902, 0, 1, 1,
0.8014321, -0.2804418, 0.05408533, 0.6627451, 0, 1, 1,
0.8090801, 0.1953313, 0.2141591, 0.6666667, 0, 1, 1,
0.8209652, 1.154063, -0.09800008, 0.6745098, 0, 1, 1,
0.8221623, 0.3942469, 0.6908594, 0.6784314, 0, 1, 1,
0.8249427, 0.652344, 1.808623, 0.6862745, 0, 1, 1,
0.8319679, 0.7652505, -0.6513863, 0.6901961, 0, 1, 1,
0.8430133, 0.7139754, 3.017437, 0.6980392, 0, 1, 1,
0.8469302, -0.686297, 0.771396, 0.7058824, 0, 1, 1,
0.8499582, 0.9273927, 1.332867, 0.7098039, 0, 1, 1,
0.8514681, -1.262431, 2.40542, 0.7176471, 0, 1, 1,
0.8528323, 1.316884, -0.6791205, 0.7215686, 0, 1, 1,
0.8561812, -0.03048567, 0.5562618, 0.7294118, 0, 1, 1,
0.8581506, -1.444144, 1.728036, 0.7333333, 0, 1, 1,
0.8768945, 0.7617185, 2.542681, 0.7411765, 0, 1, 1,
0.8785064, 1.041512, -2.198147, 0.7450981, 0, 1, 1,
0.882722, -0.9195143, 2.23448, 0.7529412, 0, 1, 1,
0.8845241, 1.082746, -0.5034277, 0.7568628, 0, 1, 1,
0.8850631, 1.389397, 1.708455, 0.7647059, 0, 1, 1,
0.88625, 0.09661238, 1.823071, 0.7686275, 0, 1, 1,
0.8917495, 0.332204, 2.046268, 0.7764706, 0, 1, 1,
0.8920227, -1.211175, 1.742639, 0.7803922, 0, 1, 1,
0.8945218, -0.7982665, 2.463511, 0.7882353, 0, 1, 1,
0.8977889, -0.6534072, 2.352986, 0.7921569, 0, 1, 1,
0.9001587, -0.06379909, 2.950316, 0.8, 0, 1, 1,
0.9051728, 0.4871853, 2.060297, 0.8078431, 0, 1, 1,
0.9059976, -0.8692111, 1.39378, 0.8117647, 0, 1, 1,
0.9142606, 0.2405781, 0.2413003, 0.8196079, 0, 1, 1,
0.9182208, -0.6425344, 2.760207, 0.8235294, 0, 1, 1,
0.9188581, -1.403745, 2.00118, 0.8313726, 0, 1, 1,
0.9311159, -0.3779547, 1.232497, 0.8352941, 0, 1, 1,
0.9324086, 0.8953822, 1.04969, 0.8431373, 0, 1, 1,
0.9328493, 0.922149, -0.137545, 0.8470588, 0, 1, 1,
0.9332085, -0.9014165, 1.398018, 0.854902, 0, 1, 1,
0.9365128, 1.135955, -0.9888082, 0.8588235, 0, 1, 1,
0.9381028, -0.09008037, 1.030491, 0.8666667, 0, 1, 1,
0.9398413, -0.1863246, 1.353837, 0.8705882, 0, 1, 1,
0.9424555, -1.623181, 4.078947, 0.8784314, 0, 1, 1,
0.9440378, -0.03344757, 2.165517, 0.8823529, 0, 1, 1,
0.945051, 0.5837596, 1.412517, 0.8901961, 0, 1, 1,
0.9466783, 0.7201301, 0.1350223, 0.8941177, 0, 1, 1,
0.9485226, -0.2100656, 2.72618, 0.9019608, 0, 1, 1,
0.9592264, 0.9045908, 2.097394, 0.9098039, 0, 1, 1,
0.9655743, 0.6053128, 0.7612841, 0.9137255, 0, 1, 1,
0.9698927, -0.6514983, 1.929276, 0.9215686, 0, 1, 1,
0.9788242, -0.2104256, 1.080675, 0.9254902, 0, 1, 1,
0.9832842, -0.1070259, 1.938741, 0.9333333, 0, 1, 1,
0.9855056, 2.289794, -0.7931775, 0.9372549, 0, 1, 1,
1.002179, 1.148227, 1.712207, 0.945098, 0, 1, 1,
1.015218, -0.04419868, 2.036787, 0.9490196, 0, 1, 1,
1.016971, 0.126361, 2.228949, 0.9568627, 0, 1, 1,
1.019405, 1.582473, -1.102281, 0.9607843, 0, 1, 1,
1.020603, 0.2986772, 1.553757, 0.9686275, 0, 1, 1,
1.023273, -1.387884, 4.282185, 0.972549, 0, 1, 1,
1.029534, -0.6320625, 3.51255, 0.9803922, 0, 1, 1,
1.030841, -0.2697185, 1.458598, 0.9843137, 0, 1, 1,
1.035832, 0.6359982, -0.2579933, 0.9921569, 0, 1, 1,
1.039489, -0.5636038, 1.081175, 0.9960784, 0, 1, 1,
1.040552, -1.443211, 1.775685, 1, 0, 0.9960784, 1,
1.040646, 1.666132, -0.6699331, 1, 0, 0.9882353, 1,
1.045085, 0.06920478, 0.245154, 1, 0, 0.9843137, 1,
1.050161, -1.946255, 2.900043, 1, 0, 0.9764706, 1,
1.055043, 0.1430282, 2.431585, 1, 0, 0.972549, 1,
1.056764, -0.3428352, 3.126365, 1, 0, 0.9647059, 1,
1.061748, -1.491028, 2.099102, 1, 0, 0.9607843, 1,
1.06733, -0.9151754, 2.980243, 1, 0, 0.9529412, 1,
1.067718, -0.4151374, 2.383938, 1, 0, 0.9490196, 1,
1.073106, 1.975139, 1.53265, 1, 0, 0.9411765, 1,
1.077005, 0.3351981, 0.384838, 1, 0, 0.9372549, 1,
1.079532, 1.133167, -0.8114147, 1, 0, 0.9294118, 1,
1.079978, 1.052138, 0.2861893, 1, 0, 0.9254902, 1,
1.081439, -0.2242921, 2.680814, 1, 0, 0.9176471, 1,
1.083358, 0.9032232, 1.345057, 1, 0, 0.9137255, 1,
1.088274, -0.8073431, 2.753183, 1, 0, 0.9058824, 1,
1.091463, -0.5725658, 1.211707, 1, 0, 0.9019608, 1,
1.093955, 0.3729057, 0.614342, 1, 0, 0.8941177, 1,
1.094771, 1.027288, 0.1772202, 1, 0, 0.8862745, 1,
1.095251, -0.1186046, 0.278936, 1, 0, 0.8823529, 1,
1.098154, 0.549998, -0.3918192, 1, 0, 0.8745098, 1,
1.099096, 1.045711, -0.0249077, 1, 0, 0.8705882, 1,
1.11033, 0.08178903, -0.2014319, 1, 0, 0.8627451, 1,
1.112873, 0.1051404, 1.36964, 1, 0, 0.8588235, 1,
1.121671, -0.6621247, 0.9626215, 1, 0, 0.8509804, 1,
1.12959, 1.099741, 1.265127, 1, 0, 0.8470588, 1,
1.129803, -1.179004, 2.58043, 1, 0, 0.8392157, 1,
1.13293, -0.3576031, 2.489958, 1, 0, 0.8352941, 1,
1.137986, -2.252172, 3.437518, 1, 0, 0.827451, 1,
1.141048, -0.05800936, 1.492956, 1, 0, 0.8235294, 1,
1.142781, 0.4160039, 1.089394, 1, 0, 0.8156863, 1,
1.157697, 0.1188178, 2.3616, 1, 0, 0.8117647, 1,
1.172653, 0.9107209, 0.9253073, 1, 0, 0.8039216, 1,
1.175872, -1.285796, 2.123711, 1, 0, 0.7960784, 1,
1.186134, -1.334337, 3.449816, 1, 0, 0.7921569, 1,
1.190888, -0.05747098, 1.073757, 1, 0, 0.7843137, 1,
1.191887, 1.284624, 0.8964936, 1, 0, 0.7803922, 1,
1.192986, 0.8905839, 1.035389, 1, 0, 0.772549, 1,
1.194394, -0.1463815, 1.861937, 1, 0, 0.7686275, 1,
1.203911, 1.053105, 0.02837398, 1, 0, 0.7607843, 1,
1.210363, 0.7974759, 1.796553, 1, 0, 0.7568628, 1,
1.210789, -0.1516976, 2.319515, 1, 0, 0.7490196, 1,
1.21109, 0.3757401, 1.619629, 1, 0, 0.7450981, 1,
1.227158, 0.2139328, 0.9477656, 1, 0, 0.7372549, 1,
1.238875, -0.3193841, 2.078054, 1, 0, 0.7333333, 1,
1.242044, -0.8243164, 2.067189, 1, 0, 0.7254902, 1,
1.24206, -0.1892046, 0.5219946, 1, 0, 0.7215686, 1,
1.242748, -0.6348106, 1.141709, 1, 0, 0.7137255, 1,
1.247317, -0.5467705, 1.683774, 1, 0, 0.7098039, 1,
1.252582, -2.073304, 1.539041, 1, 0, 0.7019608, 1,
1.256901, 1.752653, 0.4811974, 1, 0, 0.6941177, 1,
1.25784, -1.247485, 1.194355, 1, 0, 0.6901961, 1,
1.262659, 0.8750999, 1.338302, 1, 0, 0.682353, 1,
1.265862, 0.1885121, 2.172907, 1, 0, 0.6784314, 1,
1.26991, 0.4057905, 2.050637, 1, 0, 0.6705883, 1,
1.271876, -1.060654, 2.961407, 1, 0, 0.6666667, 1,
1.274148, -0.3601676, 0.308805, 1, 0, 0.6588235, 1,
1.278018, 1.122545, 2.26207, 1, 0, 0.654902, 1,
1.281566, -0.09026095, 1.077117, 1, 0, 0.6470588, 1,
1.282851, 0.806111, 1.710047, 1, 0, 0.6431373, 1,
1.286328, 0.6822057, 0.9611699, 1, 0, 0.6352941, 1,
1.286939, -0.4019478, 1.66014, 1, 0, 0.6313726, 1,
1.288586, -0.2788777, 0.7530741, 1, 0, 0.6235294, 1,
1.291176, -0.3318938, -0.42035, 1, 0, 0.6196079, 1,
1.29518, -0.0009625008, 0.8321555, 1, 0, 0.6117647, 1,
1.296211, -0.2360582, 1.970593, 1, 0, 0.6078432, 1,
1.297987, -0.231838, 2.851775, 1, 0, 0.6, 1,
1.29933, 0.5435578, 0.7193489, 1, 0, 0.5921569, 1,
1.301461, 0.5578737, -0.5670639, 1, 0, 0.5882353, 1,
1.315142, 0.8263609, 0.3211926, 1, 0, 0.5803922, 1,
1.329628, -0.07199986, 1.207539, 1, 0, 0.5764706, 1,
1.331688, -1.03459, 0.7007136, 1, 0, 0.5686275, 1,
1.345764, 0.4556179, 1.745511, 1, 0, 0.5647059, 1,
1.348205, -1.382031, 3.006907, 1, 0, 0.5568628, 1,
1.352099, 2.257668, 0.2124685, 1, 0, 0.5529412, 1,
1.354898, 0.7288191, 1.378467, 1, 0, 0.5450981, 1,
1.375538, 0.2973605, 1.49454, 1, 0, 0.5411765, 1,
1.384513, 1.621922, 1.546229, 1, 0, 0.5333334, 1,
1.405726, -0.04363062, 1.864108, 1, 0, 0.5294118, 1,
1.413565, -2.077105, 2.306173, 1, 0, 0.5215687, 1,
1.416634, -0.2487271, 1.470931, 1, 0, 0.5176471, 1,
1.433755, -0.5215976, 1.158826, 1, 0, 0.509804, 1,
1.44194, -2.057281, 0.3820162, 1, 0, 0.5058824, 1,
1.445792, 0.7194087, 1.879743, 1, 0, 0.4980392, 1,
1.460685, -1.3301, 0.8803732, 1, 0, 0.4901961, 1,
1.46461, 0.3090891, 1.845054, 1, 0, 0.4862745, 1,
1.468211, -0.4946978, 2.891627, 1, 0, 0.4784314, 1,
1.469123, 1.30068, 0.7032477, 1, 0, 0.4745098, 1,
1.478765, -1.580919, 2.015146, 1, 0, 0.4666667, 1,
1.482676, 2.270923, 1.428691, 1, 0, 0.4627451, 1,
1.496628, -0.162151, 3.44794, 1, 0, 0.454902, 1,
1.499276, -0.5474905, 2.44306, 1, 0, 0.4509804, 1,
1.503564, -2.655156, 3.472669, 1, 0, 0.4431373, 1,
1.513845, -0.2200415, 2.224992, 1, 0, 0.4392157, 1,
1.515649, 0.25862, 0.7132016, 1, 0, 0.4313726, 1,
1.521373, 0.1373735, 1.520889, 1, 0, 0.427451, 1,
1.540558, -0.07508688, 0.8220661, 1, 0, 0.4196078, 1,
1.542922, 0.05315904, 2.581344, 1, 0, 0.4156863, 1,
1.54468, -0.4597545, 1.68996, 1, 0, 0.4078431, 1,
1.546272, 0.2901022, 1.725932, 1, 0, 0.4039216, 1,
1.546491, -0.114058, 3.195717, 1, 0, 0.3960784, 1,
1.557009, 0.6760579, 1.602833, 1, 0, 0.3882353, 1,
1.557138, -1.263887, 1.069671, 1, 0, 0.3843137, 1,
1.558087, -0.6268592, 1.645958, 1, 0, 0.3764706, 1,
1.565159, -0.7650315, 1.593065, 1, 0, 0.372549, 1,
1.568617, 0.6735845, 3.252692, 1, 0, 0.3647059, 1,
1.57353, -0.6761627, 2.610241, 1, 0, 0.3607843, 1,
1.574572, -1.220242, 2.487477, 1, 0, 0.3529412, 1,
1.575994, -0.2322273, 0.004104178, 1, 0, 0.3490196, 1,
1.596543, 2.370235, 0.1768766, 1, 0, 0.3411765, 1,
1.614039, -0.3296464, 2.620797, 1, 0, 0.3372549, 1,
1.61716, -0.1714357, 1.99743, 1, 0, 0.3294118, 1,
1.624416, 1.794775, 0.3877626, 1, 0, 0.3254902, 1,
1.661711, -1.160998, 3.350521, 1, 0, 0.3176471, 1,
1.673204, -0.2790302, 0.9121275, 1, 0, 0.3137255, 1,
1.689869, -0.4426042, 2.990767, 1, 0, 0.3058824, 1,
1.696565, -0.2606771, 2.700392, 1, 0, 0.2980392, 1,
1.699236, -1.506078, 3.324159, 1, 0, 0.2941177, 1,
1.711223, -0.742066, 0.6925753, 1, 0, 0.2862745, 1,
1.713625, -1.339511, 1.673476, 1, 0, 0.282353, 1,
1.719053, -0.5343748, 2.856665, 1, 0, 0.2745098, 1,
1.726714, -1.102609, 1.198905, 1, 0, 0.2705882, 1,
1.733154, -1.797036, 4.36908, 1, 0, 0.2627451, 1,
1.757732, 0.660328, -0.1568393, 1, 0, 0.2588235, 1,
1.773845, 0.3620725, 0.6663171, 1, 0, 0.2509804, 1,
1.784596, 0.9098672, 2.445612, 1, 0, 0.2470588, 1,
1.80284, 1.710056, 0.5697959, 1, 0, 0.2392157, 1,
1.807213, 1.233307, 1.011658, 1, 0, 0.2352941, 1,
1.808769, 0.02615284, 1.605604, 1, 0, 0.227451, 1,
1.842696, -0.689813, 1.395047, 1, 0, 0.2235294, 1,
1.857268, -1.049302, 1.333038, 1, 0, 0.2156863, 1,
1.859282, -2.215545, 1.695534, 1, 0, 0.2117647, 1,
1.860132, -0.8014071, 0.9484168, 1, 0, 0.2039216, 1,
1.873512, 0.9308314, 0.6702093, 1, 0, 0.1960784, 1,
1.878712, -0.19756, 1.094739, 1, 0, 0.1921569, 1,
1.88798, 1.255417, -1.553093, 1, 0, 0.1843137, 1,
1.89286, -0.9018126, 0.7365083, 1, 0, 0.1803922, 1,
1.935752, 0.1569448, 0.8413867, 1, 0, 0.172549, 1,
1.943106, 1.041312, 2.305503, 1, 0, 0.1686275, 1,
1.954153, 2.089267, 0.00265935, 1, 0, 0.1607843, 1,
1.964887, -1.085323, 1.50739, 1, 0, 0.1568628, 1,
1.992471, 1.472516, 1.494045, 1, 0, 0.1490196, 1,
1.995608, -1.262781, 0.07615581, 1, 0, 0.145098, 1,
1.999319, -0.04109726, 1.295616, 1, 0, 0.1372549, 1,
2.042217, 0.1422944, 1.270388, 1, 0, 0.1333333, 1,
2.06644, 0.6575426, 3.380905, 1, 0, 0.1254902, 1,
2.102953, -0.5853576, 2.065517, 1, 0, 0.1215686, 1,
2.107484, -2.067565, 1.850165, 1, 0, 0.1137255, 1,
2.16125, -0.2459768, 1.60972, 1, 0, 0.1098039, 1,
2.167183, -0.1151739, 1.592484, 1, 0, 0.1019608, 1,
2.211781, -0.3200649, 3.067319, 1, 0, 0.09411765, 1,
2.263857, 0.1636389, 0.9419577, 1, 0, 0.09019608, 1,
2.323772, -0.4121295, 0.9295331, 1, 0, 0.08235294, 1,
2.330927, -0.5915935, 2.73052, 1, 0, 0.07843138, 1,
2.38766, 0.4196149, 1.995719, 1, 0, 0.07058824, 1,
2.441865, 1.410725, 3.260862, 1, 0, 0.06666667, 1,
2.489618, 0.4264377, 3.779211, 1, 0, 0.05882353, 1,
2.50012, 0.98821, 2.995774, 1, 0, 0.05490196, 1,
2.509082, 0.4734397, 1.2244, 1, 0, 0.04705882, 1,
2.55898, 0.7038072, 2.489423, 1, 0, 0.04313726, 1,
2.571876, 0.6144255, 1.004686, 1, 0, 0.03529412, 1,
2.574967, 0.1326238, -0.695187, 1, 0, 0.03137255, 1,
2.635448, -1.079489, 2.126057, 1, 0, 0.02352941, 1,
2.754986, 1.710831, -0.4610704, 1, 0, 0.01960784, 1,
2.787814, 1.187416, 0.442754, 1, 0, 0.01176471, 1,
3.182439, 0.48489, 0.7295077, 1, 0, 0.007843138, 1
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
-0.1435302, -3.990622, -7.349225, 0, -0.5, 0.5, 0.5,
-0.1435302, -3.990622, -7.349225, 1, -0.5, 0.5, 0.5,
-0.1435302, -3.990622, -7.349225, 1, 1.5, 0.5, 0.5,
-0.1435302, -3.990622, -7.349225, 0, 1.5, 0.5, 0.5
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
-4.597003, 0.05138826, -7.349225, 0, -0.5, 0.5, 0.5,
-4.597003, 0.05138826, -7.349225, 1, -0.5, 0.5, 0.5,
-4.597003, 0.05138826, -7.349225, 1, 1.5, 0.5, 0.5,
-4.597003, 0.05138826, -7.349225, 0, 1.5, 0.5, 0.5
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
-4.597003, -3.990622, 0.07595706, 0, -0.5, 0.5, 0.5,
-4.597003, -3.990622, 0.07595706, 1, -0.5, 0.5, 0.5,
-4.597003, -3.990622, 0.07595706, 1, 1.5, 0.5, 0.5,
-4.597003, -3.990622, 0.07595706, 0, 1.5, 0.5, 0.5
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
-3, -3.05785, -5.635721,
3, -3.05785, -5.635721,
-3, -3.05785, -5.635721,
-3, -3.213312, -5.921305,
-2, -3.05785, -5.635721,
-2, -3.213312, -5.921305,
-1, -3.05785, -5.635721,
-1, -3.213312, -5.921305,
0, -3.05785, -5.635721,
0, -3.213312, -5.921305,
1, -3.05785, -5.635721,
1, -3.213312, -5.921305,
2, -3.05785, -5.635721,
2, -3.213312, -5.921305,
3, -3.05785, -5.635721,
3, -3.213312, -5.921305
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
-3, -3.524236, -6.492473, 0, -0.5, 0.5, 0.5,
-3, -3.524236, -6.492473, 1, -0.5, 0.5, 0.5,
-3, -3.524236, -6.492473, 1, 1.5, 0.5, 0.5,
-3, -3.524236, -6.492473, 0, 1.5, 0.5, 0.5,
-2, -3.524236, -6.492473, 0, -0.5, 0.5, 0.5,
-2, -3.524236, -6.492473, 1, -0.5, 0.5, 0.5,
-2, -3.524236, -6.492473, 1, 1.5, 0.5, 0.5,
-2, -3.524236, -6.492473, 0, 1.5, 0.5, 0.5,
-1, -3.524236, -6.492473, 0, -0.5, 0.5, 0.5,
-1, -3.524236, -6.492473, 1, -0.5, 0.5, 0.5,
-1, -3.524236, -6.492473, 1, 1.5, 0.5, 0.5,
-1, -3.524236, -6.492473, 0, 1.5, 0.5, 0.5,
0, -3.524236, -6.492473, 0, -0.5, 0.5, 0.5,
0, -3.524236, -6.492473, 1, -0.5, 0.5, 0.5,
0, -3.524236, -6.492473, 1, 1.5, 0.5, 0.5,
0, -3.524236, -6.492473, 0, 1.5, 0.5, 0.5,
1, -3.524236, -6.492473, 0, -0.5, 0.5, 0.5,
1, -3.524236, -6.492473, 1, -0.5, 0.5, 0.5,
1, -3.524236, -6.492473, 1, 1.5, 0.5, 0.5,
1, -3.524236, -6.492473, 0, 1.5, 0.5, 0.5,
2, -3.524236, -6.492473, 0, -0.5, 0.5, 0.5,
2, -3.524236, -6.492473, 1, -0.5, 0.5, 0.5,
2, -3.524236, -6.492473, 1, 1.5, 0.5, 0.5,
2, -3.524236, -6.492473, 0, 1.5, 0.5, 0.5,
3, -3.524236, -6.492473, 0, -0.5, 0.5, 0.5,
3, -3.524236, -6.492473, 1, -0.5, 0.5, 0.5,
3, -3.524236, -6.492473, 1, 1.5, 0.5, 0.5,
3, -3.524236, -6.492473, 0, 1.5, 0.5, 0.5
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
-3.569279, -2, -5.635721,
-3.569279, 3, -5.635721,
-3.569279, -2, -5.635721,
-3.740566, -2, -5.921305,
-3.569279, -1, -5.635721,
-3.740566, -1, -5.921305,
-3.569279, 0, -5.635721,
-3.740566, 0, -5.921305,
-3.569279, 1, -5.635721,
-3.740566, 1, -5.921305,
-3.569279, 2, -5.635721,
-3.740566, 2, -5.921305,
-3.569279, 3, -5.635721,
-3.740566, 3, -5.921305
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
-4.083141, -2, -6.492473, 0, -0.5, 0.5, 0.5,
-4.083141, -2, -6.492473, 1, -0.5, 0.5, 0.5,
-4.083141, -2, -6.492473, 1, 1.5, 0.5, 0.5,
-4.083141, -2, -6.492473, 0, 1.5, 0.5, 0.5,
-4.083141, -1, -6.492473, 0, -0.5, 0.5, 0.5,
-4.083141, -1, -6.492473, 1, -0.5, 0.5, 0.5,
-4.083141, -1, -6.492473, 1, 1.5, 0.5, 0.5,
-4.083141, -1, -6.492473, 0, 1.5, 0.5, 0.5,
-4.083141, 0, -6.492473, 0, -0.5, 0.5, 0.5,
-4.083141, 0, -6.492473, 1, -0.5, 0.5, 0.5,
-4.083141, 0, -6.492473, 1, 1.5, 0.5, 0.5,
-4.083141, 0, -6.492473, 0, 1.5, 0.5, 0.5,
-4.083141, 1, -6.492473, 0, -0.5, 0.5, 0.5,
-4.083141, 1, -6.492473, 1, -0.5, 0.5, 0.5,
-4.083141, 1, -6.492473, 1, 1.5, 0.5, 0.5,
-4.083141, 1, -6.492473, 0, 1.5, 0.5, 0.5,
-4.083141, 2, -6.492473, 0, -0.5, 0.5, 0.5,
-4.083141, 2, -6.492473, 1, -0.5, 0.5, 0.5,
-4.083141, 2, -6.492473, 1, 1.5, 0.5, 0.5,
-4.083141, 2, -6.492473, 0, 1.5, 0.5, 0.5,
-4.083141, 3, -6.492473, 0, -0.5, 0.5, 0.5,
-4.083141, 3, -6.492473, 1, -0.5, 0.5, 0.5,
-4.083141, 3, -6.492473, 1, 1.5, 0.5, 0.5,
-4.083141, 3, -6.492473, 0, 1.5, 0.5, 0.5
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
-3.569279, -3.05785, -4,
-3.569279, -3.05785, 4,
-3.569279, -3.05785, -4,
-3.740566, -3.213312, -4,
-3.569279, -3.05785, -2,
-3.740566, -3.213312, -2,
-3.569279, -3.05785, 0,
-3.740566, -3.213312, 0,
-3.569279, -3.05785, 2,
-3.740566, -3.213312, 2,
-3.569279, -3.05785, 4,
-3.740566, -3.213312, 4
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
-4.083141, -3.524236, -4, 0, -0.5, 0.5, 0.5,
-4.083141, -3.524236, -4, 1, -0.5, 0.5, 0.5,
-4.083141, -3.524236, -4, 1, 1.5, 0.5, 0.5,
-4.083141, -3.524236, -4, 0, 1.5, 0.5, 0.5,
-4.083141, -3.524236, -2, 0, -0.5, 0.5, 0.5,
-4.083141, -3.524236, -2, 1, -0.5, 0.5, 0.5,
-4.083141, -3.524236, -2, 1, 1.5, 0.5, 0.5,
-4.083141, -3.524236, -2, 0, 1.5, 0.5, 0.5,
-4.083141, -3.524236, 0, 0, -0.5, 0.5, 0.5,
-4.083141, -3.524236, 0, 1, -0.5, 0.5, 0.5,
-4.083141, -3.524236, 0, 1, 1.5, 0.5, 0.5,
-4.083141, -3.524236, 0, 0, 1.5, 0.5, 0.5,
-4.083141, -3.524236, 2, 0, -0.5, 0.5, 0.5,
-4.083141, -3.524236, 2, 1, -0.5, 0.5, 0.5,
-4.083141, -3.524236, 2, 1, 1.5, 0.5, 0.5,
-4.083141, -3.524236, 2, 0, 1.5, 0.5, 0.5,
-4.083141, -3.524236, 4, 0, -0.5, 0.5, 0.5,
-4.083141, -3.524236, 4, 1, -0.5, 0.5, 0.5,
-4.083141, -3.524236, 4, 1, 1.5, 0.5, 0.5,
-4.083141, -3.524236, 4, 0, 1.5, 0.5, 0.5
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
-3.569279, -3.05785, -5.635721,
-3.569279, 3.160627, -5.635721,
-3.569279, -3.05785, 5.787635,
-3.569279, 3.160627, 5.787635,
-3.569279, -3.05785, -5.635721,
-3.569279, -3.05785, 5.787635,
-3.569279, 3.160627, -5.635721,
-3.569279, 3.160627, 5.787635,
-3.569279, -3.05785, -5.635721,
3.282218, -3.05785, -5.635721,
-3.569279, -3.05785, 5.787635,
3.282218, -3.05785, 5.787635,
-3.569279, 3.160627, -5.635721,
3.282218, 3.160627, -5.635721,
-3.569279, 3.160627, 5.787635,
3.282218, 3.160627, 5.787635,
3.282218, -3.05785, -5.635721,
3.282218, 3.160627, -5.635721,
3.282218, -3.05785, 5.787635,
3.282218, 3.160627, 5.787635,
3.282218, -3.05785, -5.635721,
3.282218, -3.05785, 5.787635,
3.282218, 3.160627, -5.635721,
3.282218, 3.160627, 5.787635
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
var radius = 7.849797;
var distance = 34.92464;
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
mvMatrix.translate( 0.1435302, -0.05138826, -0.07595706 );
mvMatrix.scale( 1.238759, 1.364861, 0.7429825 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.92464);
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
benazolin-ethyl<-read.table("benazolin-ethyl.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-benazolin-ethyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'benazolin' not found
```

```r
y<-benazolin-ethyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'benazolin' not found
```

```r
z<-benazolin-ethyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'benazolin' not found
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
-3.4695, 1.460156, -0.6373129, 0, 0, 1, 1, 1,
-3.010148, 0.7596173, -2.06496, 1, 0, 0, 1, 1,
-2.807158, 0.2052374, -2.473136, 1, 0, 0, 1, 1,
-2.715232, -0.1544501, -1.340528, 1, 0, 0, 1, 1,
-2.601632, 0.4044606, -2.321852, 1, 0, 0, 1, 1,
-2.368658, 0.8300637, -0.07837733, 1, 0, 0, 1, 1,
-2.337498, 0.5529151, -0.03978347, 0, 0, 0, 1, 1,
-2.301645, 0.591213, -0.4723774, 0, 0, 0, 1, 1,
-2.226701, -0.5104807, -0.3993747, 0, 0, 0, 1, 1,
-2.143111, -1.667512, -3.073128, 0, 0, 0, 1, 1,
-2.099918, -0.2955315, -2.120126, 0, 0, 0, 1, 1,
-2.032376, -0.4825518, -1.057217, 0, 0, 0, 1, 1,
-2.001502, 1.805803, -1.568224, 0, 0, 0, 1, 1,
-1.963913, -1.083773, -2.705371, 1, 1, 1, 1, 1,
-1.926025, 1.346167, -0.5571323, 1, 1, 1, 1, 1,
-1.908894, 0.4337716, 0.4081132, 1, 1, 1, 1, 1,
-1.875637, -1.30751, -2.482726, 1, 1, 1, 1, 1,
-1.848039, -0.9073831, -0.6923241, 1, 1, 1, 1, 1,
-1.838708, -0.506997, -2.354697, 1, 1, 1, 1, 1,
-1.814812, 0.4343209, -0.3079166, 1, 1, 1, 1, 1,
-1.811788, 0.4337525, -0.03288733, 1, 1, 1, 1, 1,
-1.77624, 0.3090653, -3.150991, 1, 1, 1, 1, 1,
-1.770452, -0.7499903, -2.868178, 1, 1, 1, 1, 1,
-1.767907, -1.452177, -1.437879, 1, 1, 1, 1, 1,
-1.729626, -0.3500573, -2.24561, 1, 1, 1, 1, 1,
-1.706947, -0.5007851, -2.44593, 1, 1, 1, 1, 1,
-1.686162, -2.033252, -2.990351, 1, 1, 1, 1, 1,
-1.673629, -1.449622, -2.987444, 1, 1, 1, 1, 1,
-1.662755, 1.130624, -2.717436, 0, 0, 1, 1, 1,
-1.643959, 0.2500971, 0.003367434, 1, 0, 0, 1, 1,
-1.635354, 0.9468387, -0.9022636, 1, 0, 0, 1, 1,
-1.630567, -1.361166, -2.207231, 1, 0, 0, 1, 1,
-1.597292, -0.1121867, -0.6903368, 1, 0, 0, 1, 1,
-1.592079, -2.047682, -1.177904, 1, 0, 0, 1, 1,
-1.589258, 0.1015331, -1.932959, 0, 0, 0, 1, 1,
-1.587465, -1.331311, -1.846438, 0, 0, 0, 1, 1,
-1.575809, 0.4147051, 0.4086891, 0, 0, 0, 1, 1,
-1.56968, 0.4035296, -0.8584291, 0, 0, 0, 1, 1,
-1.561859, -0.2318077, -3.081513, 0, 0, 0, 1, 1,
-1.558339, -0.6811644, -1.857579, 0, 0, 0, 1, 1,
-1.538301, 0.1086348, -1.175813, 0, 0, 0, 1, 1,
-1.518147, 0.5622862, -1.838856, 1, 1, 1, 1, 1,
-1.509068, 0.534586, -1.997102, 1, 1, 1, 1, 1,
-1.503434, -1.155228, 0.04827427, 1, 1, 1, 1, 1,
-1.495847, 0.791413, -0.3913382, 1, 1, 1, 1, 1,
-1.482672, -0.515047, -1.854324, 1, 1, 1, 1, 1,
-1.452702, -0.9350871, -2.150109, 1, 1, 1, 1, 1,
-1.415533, 0.9135351, -3.369643, 1, 1, 1, 1, 1,
-1.413332, 1.236355, 0.4765806, 1, 1, 1, 1, 1,
-1.40231, 0.8701684, -2.487476, 1, 1, 1, 1, 1,
-1.401067, 1.650342, -1.543279, 1, 1, 1, 1, 1,
-1.396345, -1.200609, -2.273106, 1, 1, 1, 1, 1,
-1.39374, 0.9510503, -1.157969, 1, 1, 1, 1, 1,
-1.383973, -0.2704313, 0.0664231, 1, 1, 1, 1, 1,
-1.379593, 0.2394564, -1.783538, 1, 1, 1, 1, 1,
-1.372745, -2.166732, -5.285455, 1, 1, 1, 1, 1,
-1.363566, 0.171188, -0.8130315, 0, 0, 1, 1, 1,
-1.360759, 0.6061817, -1.310451, 1, 0, 0, 1, 1,
-1.353776, -1.156997, -2.845865, 1, 0, 0, 1, 1,
-1.352673, -1.955658, -2.408005, 1, 0, 0, 1, 1,
-1.351101, 0.3780272, -2.621724, 1, 0, 0, 1, 1,
-1.345991, 0.3935677, -1.160511, 1, 0, 0, 1, 1,
-1.342996, 0.5003639, -1.903054, 0, 0, 0, 1, 1,
-1.326611, 1.526032, -0.5247081, 0, 0, 0, 1, 1,
-1.321281, 0.2193309, -1.865054, 0, 0, 0, 1, 1,
-1.318329, -0.02203687, 0.1849927, 0, 0, 0, 1, 1,
-1.311561, 0.5120668, -1.391226, 0, 0, 0, 1, 1,
-1.308641, 1.418046, -1.137336, 0, 0, 0, 1, 1,
-1.304159, -0.6932377, -2.122407, 0, 0, 0, 1, 1,
-1.304095, -0.7090712, -2.153788, 1, 1, 1, 1, 1,
-1.296259, -0.002696207, -0.4901156, 1, 1, 1, 1, 1,
-1.280165, -1.708114, -2.143339, 1, 1, 1, 1, 1,
-1.267042, -0.02170654, -1.451895, 1, 1, 1, 1, 1,
-1.263862, 0.1769834, -2.47822, 1, 1, 1, 1, 1,
-1.258181, -1.605438, -2.217573, 1, 1, 1, 1, 1,
-1.252728, -0.207744, -0.02479846, 1, 1, 1, 1, 1,
-1.247951, 1.149425, -0.5639939, 1, 1, 1, 1, 1,
-1.24169, 1.485401, -0.573801, 1, 1, 1, 1, 1,
-1.241198, -1.06083, -3.375538, 1, 1, 1, 1, 1,
-1.236781, 0.001763491, -0.3518803, 1, 1, 1, 1, 1,
-1.233133, -0.6797386, -2.399817, 1, 1, 1, 1, 1,
-1.225148, 0.7565865, 0.9578421, 1, 1, 1, 1, 1,
-1.218346, -0.7191789, -4.01972, 1, 1, 1, 1, 1,
-1.212513, 0.3004756, -1.968413, 1, 1, 1, 1, 1,
-1.21087, 0.3318088, -2.363699, 0, 0, 1, 1, 1,
-1.207634, 0.9677345, -0.2716998, 1, 0, 0, 1, 1,
-1.197387, -1.258283, -2.406474, 1, 0, 0, 1, 1,
-1.193253, 1.321505, -1.456915, 1, 0, 0, 1, 1,
-1.192195, 1.597509, 0.3550595, 1, 0, 0, 1, 1,
-1.183443, 1.172018, -1.40014, 1, 0, 0, 1, 1,
-1.180946, -0.94708, -1.019465, 0, 0, 0, 1, 1,
-1.173959, -1.091253, -2.807089, 0, 0, 0, 1, 1,
-1.168423, 0.1297395, -2.280266, 0, 0, 0, 1, 1,
-1.165106, 1.259318, -1.06374, 0, 0, 0, 1, 1,
-1.164797, 0.3786369, 0.3053593, 0, 0, 0, 1, 1,
-1.159388, 1.586051, -0.7429145, 0, 0, 0, 1, 1,
-1.154858, 0.8491918, -1.616417, 0, 0, 0, 1, 1,
-1.14597, 0.5599818, 0.4503485, 1, 1, 1, 1, 1,
-1.145493, 0.1400444, -0.6773137, 1, 1, 1, 1, 1,
-1.142156, -1.648808, -1.484118, 1, 1, 1, 1, 1,
-1.140541, -0.5874442, -2.628652, 1, 1, 1, 1, 1,
-1.134088, 0.6445503, -0.6815977, 1, 1, 1, 1, 1,
-1.126112, 1.20555, -0.8676066, 1, 1, 1, 1, 1,
-1.124959, 1.032214, -0.03274158, 1, 1, 1, 1, 1,
-1.118114, 0.7641078, 0.9857106, 1, 1, 1, 1, 1,
-1.118003, -0.8685142, -3.899111, 1, 1, 1, 1, 1,
-1.117593, 1.094662, -0.9535277, 1, 1, 1, 1, 1,
-1.115337, 0.2920479, -0.9749404, 1, 1, 1, 1, 1,
-1.112015, -0.4601269, -2.508652, 1, 1, 1, 1, 1,
-1.110495, -0.02305269, -1.99403, 1, 1, 1, 1, 1,
-1.104937, 0.22332, -1.920918, 1, 1, 1, 1, 1,
-1.102652, -1.684893, -3.275129, 1, 1, 1, 1, 1,
-1.102076, -0.6321214, -0.7537078, 0, 0, 1, 1, 1,
-1.100853, 0.5799294, -0.3706366, 1, 0, 0, 1, 1,
-1.099467, -0.4647901, -2.815271, 1, 0, 0, 1, 1,
-1.090946, 0.1836135, -0.5126414, 1, 0, 0, 1, 1,
-1.087561, -0.2198864, 0.102672, 1, 0, 0, 1, 1,
-1.087159, 0.5510819, -1.615378, 1, 0, 0, 1, 1,
-1.086391, -0.9955072, -2.168303, 0, 0, 0, 1, 1,
-1.084777, 0.6950201, -1.982804, 0, 0, 0, 1, 1,
-1.067545, 0.9826584, -1.040051, 0, 0, 0, 1, 1,
-1.06621, -0.3234461, -3.392951, 0, 0, 0, 1, 1,
-1.063554, -0.7295503, -2.937692, 0, 0, 0, 1, 1,
-1.046322, -1.026456, -2.916048, 0, 0, 0, 1, 1,
-1.044643, 0.1915773, -0.1782254, 0, 0, 0, 1, 1,
-1.04394, 0.4852803, -2.524205, 1, 1, 1, 1, 1,
-1.041663, -1.344836, -2.735242, 1, 1, 1, 1, 1,
-1.032037, -0.1434614, -2.071899, 1, 1, 1, 1, 1,
-1.025798, 1.550179, -0.7583413, 1, 1, 1, 1, 1,
-1.017391, 0.2110935, -0.7427875, 1, 1, 1, 1, 1,
-1.002655, 0.9712429, 0.08294579, 1, 1, 1, 1, 1,
-0.9939181, 0.6225688, -0.9926171, 1, 1, 1, 1, 1,
-0.9898129, 2.681869, -0.707641, 1, 1, 1, 1, 1,
-0.9897032, -0.5344102, -1.555183, 1, 1, 1, 1, 1,
-0.9797102, -0.4460236, -2.636292, 1, 1, 1, 1, 1,
-0.9764803, 0.16506, -1.433607, 1, 1, 1, 1, 1,
-0.9738023, 0.384812, -0.7429415, 1, 1, 1, 1, 1,
-0.9709689, -0.4881761, -1.906073, 1, 1, 1, 1, 1,
-0.9704375, -1.458405, -1.185942, 1, 1, 1, 1, 1,
-0.9668679, -0.6698957, -3.093347, 1, 1, 1, 1, 1,
-0.9661169, 0.04586734, 0.6381716, 0, 0, 1, 1, 1,
-0.9644204, 0.2471417, -2.189032, 1, 0, 0, 1, 1,
-0.964297, 0.0459724, -1.838273, 1, 0, 0, 1, 1,
-0.9626298, -0.3693717, -2.387377, 1, 0, 0, 1, 1,
-0.9624771, 0.5642589, -1.623778, 1, 0, 0, 1, 1,
-0.9598608, -0.6819791, -2.048928, 1, 0, 0, 1, 1,
-0.9581476, -0.6095825, -2.524535, 0, 0, 0, 1, 1,
-0.9578651, 1.910006, -0.3197637, 0, 0, 0, 1, 1,
-0.9521017, 0.02347846, -0.186895, 0, 0, 0, 1, 1,
-0.94919, -0.871251, -2.673645, 0, 0, 0, 1, 1,
-0.9483031, -0.7373661, -1.531493, 0, 0, 0, 1, 1,
-0.9385996, -2.33002, -3.240617, 0, 0, 0, 1, 1,
-0.9316878, 0.4176518, -2.59404, 0, 0, 0, 1, 1,
-0.928131, 1.190749, 0.07566583, 1, 1, 1, 1, 1,
-0.9279247, 0.3603665, 0.1619281, 1, 1, 1, 1, 1,
-0.9232076, 1.57562, 1.023299, 1, 1, 1, 1, 1,
-0.9213918, -0.2427725, -1.628276, 1, 1, 1, 1, 1,
-0.9181982, 1.003197, -1.747975, 1, 1, 1, 1, 1,
-0.9090543, 0.08403642, -2.003752, 1, 1, 1, 1, 1,
-0.906202, 1.420881, 1.737907, 1, 1, 1, 1, 1,
-0.905888, -0.2039919, -3.829234, 1, 1, 1, 1, 1,
-0.9016765, 0.5864334, -1.519968, 1, 1, 1, 1, 1,
-0.8964579, 0.3801259, -1.906389, 1, 1, 1, 1, 1,
-0.8928541, 0.1603748, -3.039047, 1, 1, 1, 1, 1,
-0.8818396, -0.9479302, -3.098546, 1, 1, 1, 1, 1,
-0.8784438, -0.5089375, -2.510842, 1, 1, 1, 1, 1,
-0.8761348, 0.3765317, -0.763549, 1, 1, 1, 1, 1,
-0.8756837, 1.07019, -0.0308573, 1, 1, 1, 1, 1,
-0.8754954, 0.06302165, -2.439163, 0, 0, 1, 1, 1,
-0.8713093, 0.3644473, -0.4266478, 1, 0, 0, 1, 1,
-0.8710968, 0.8379582, -1.599784, 1, 0, 0, 1, 1,
-0.8702798, -1.217082, -4.334564, 1, 0, 0, 1, 1,
-0.85818, 0.09654409, -1.106192, 1, 0, 0, 1, 1,
-0.8568279, 0.2789835, -0.1731464, 1, 0, 0, 1, 1,
-0.8539662, -1.18564, -1.167892, 0, 0, 0, 1, 1,
-0.8449839, -0.1976241, -1.18928, 0, 0, 0, 1, 1,
-0.8371092, 0.6415188, 0.8207901, 0, 0, 0, 1, 1,
-0.8333164, -0.2363729, -1.399608, 0, 0, 0, 1, 1,
-0.8298742, -0.9578761, -2.964119, 0, 0, 0, 1, 1,
-0.8289168, 0.6034194, 0.04415002, 0, 0, 0, 1, 1,
-0.8275874, 0.09680437, -1.44075, 0, 0, 0, 1, 1,
-0.8251264, 0.04388537, -1.670034, 1, 1, 1, 1, 1,
-0.8228991, 0.3892594, -0.7595945, 1, 1, 1, 1, 1,
-0.8184168, 0.4063464, -1.429761, 1, 1, 1, 1, 1,
-0.8134596, 2.130415, -0.1874912, 1, 1, 1, 1, 1,
-0.8079174, 0.190559, -1.713409, 1, 1, 1, 1, 1,
-0.8047772, 0.9424438, -0.9137463, 1, 1, 1, 1, 1,
-0.8013095, -1.103799, -2.000164, 1, 1, 1, 1, 1,
-0.7997534, -0.7038009, -1.825095, 1, 1, 1, 1, 1,
-0.7952535, 0.0542447, -1.26923, 1, 1, 1, 1, 1,
-0.7862515, 0.3568351, -0.2783748, 1, 1, 1, 1, 1,
-0.7856441, 0.6663901, 0.5735335, 1, 1, 1, 1, 1,
-0.7826064, 0.06253158, -0.7515976, 1, 1, 1, 1, 1,
-0.7811914, -1.577238, -2.047596, 1, 1, 1, 1, 1,
-0.7795824, -0.9984652, -2.304796, 1, 1, 1, 1, 1,
-0.778177, 0.3685084, -1.360069, 1, 1, 1, 1, 1,
-0.7774441, 0.1631193, -1.127756, 0, 0, 1, 1, 1,
-0.7750555, -0.3601152, -1.495222, 1, 0, 0, 1, 1,
-0.7722856, -0.5091993, -1.693252, 1, 0, 0, 1, 1,
-0.7584679, -0.7691031, -1.398753, 1, 0, 0, 1, 1,
-0.7565291, -0.6231547, -1.122453, 1, 0, 0, 1, 1,
-0.7481068, 0.454406, -1.041439, 1, 0, 0, 1, 1,
-0.7477966, 0.05668673, -0.8676298, 0, 0, 0, 1, 1,
-0.7423963, 0.06815369, -0.6883544, 0, 0, 0, 1, 1,
-0.7372019, -0.356667, -2.022738, 0, 0, 0, 1, 1,
-0.7366424, -1.206028, -1.93997, 0, 0, 0, 1, 1,
-0.7364025, 1.362923, 1.113471, 0, 0, 0, 1, 1,
-0.7361614, -1.522485, -3.862167, 0, 0, 0, 1, 1,
-0.7312958, 1.069714, -0.2964467, 0, 0, 0, 1, 1,
-0.7245548, -0.4294338, -2.901139, 1, 1, 1, 1, 1,
-0.7238374, 0.9734443, -0.06577013, 1, 1, 1, 1, 1,
-0.7137759, 0.186721, -3.016755, 1, 1, 1, 1, 1,
-0.7130584, 0.6566275, -0.441159, 1, 1, 1, 1, 1,
-0.7107319, -0.0008868577, -1.261445, 1, 1, 1, 1, 1,
-0.709762, 0.4927908, -1.359504, 1, 1, 1, 1, 1,
-0.7053924, 0.4678416, -1.200434, 1, 1, 1, 1, 1,
-0.70186, -0.7236201, -3.074758, 1, 1, 1, 1, 1,
-0.7003308, -0.9672634, -2.241997, 1, 1, 1, 1, 1,
-0.6946543, 1.256575, -0.8066043, 1, 1, 1, 1, 1,
-0.6919087, 0.7446043, -0.5959395, 1, 1, 1, 1, 1,
-0.6828375, -0.2946982, -2.544279, 1, 1, 1, 1, 1,
-0.6820567, 0.04419564, -2.715123, 1, 1, 1, 1, 1,
-0.6803578, -0.5440301, 0.2610724, 1, 1, 1, 1, 1,
-0.6796087, 0.7682747, -0.1390523, 1, 1, 1, 1, 1,
-0.6771924, -1.858238, -2.725038, 0, 0, 1, 1, 1,
-0.6764576, -0.1292109, -0.3221416, 1, 0, 0, 1, 1,
-0.6763061, 0.3562607, -0.7029098, 1, 0, 0, 1, 1,
-0.6722212, 0.06146039, -2.212314, 1, 0, 0, 1, 1,
-0.6709743, 0.394702, 0.2057885, 1, 0, 0, 1, 1,
-0.6642728, 0.4053327, -0.3674292, 1, 0, 0, 1, 1,
-0.6594163, -1.273514, -1.837572, 0, 0, 0, 1, 1,
-0.6591184, -0.6170396, -0.3224604, 0, 0, 0, 1, 1,
-0.6584181, -1.458437, -3.534396, 0, 0, 0, 1, 1,
-0.6513317, -0.7545559, -4.593716, 0, 0, 0, 1, 1,
-0.6490122, -0.7650419, -1.830169, 0, 0, 0, 1, 1,
-0.6488031, 0.6578407, -1.060964, 0, 0, 0, 1, 1,
-0.6486519, 0.3708786, 1.02275, 0, 0, 0, 1, 1,
-0.6392055, -0.08175284, -2.335007, 1, 1, 1, 1, 1,
-0.6327781, 0.911683, -3.298773, 1, 1, 1, 1, 1,
-0.6243216, -0.3823845, -1.917711, 1, 1, 1, 1, 1,
-0.6181504, -0.02314962, -0.6563702, 1, 1, 1, 1, 1,
-0.6176736, 2.168691, -0.5529987, 1, 1, 1, 1, 1,
-0.6159648, -1.639966, -3.45431, 1, 1, 1, 1, 1,
-0.6148694, 0.2383279, -0.8846143, 1, 1, 1, 1, 1,
-0.61425, 1.759573, -0.1790124, 1, 1, 1, 1, 1,
-0.6137114, -0.006830384, -0.7328452, 1, 1, 1, 1, 1,
-0.6081172, 1.347532, -0.1646418, 1, 1, 1, 1, 1,
-0.6044328, -1.013355, -2.867023, 1, 1, 1, 1, 1,
-0.6006932, -0.7234178, -1.069247, 1, 1, 1, 1, 1,
-0.5997684, -2.342909, -2.832653, 1, 1, 1, 1, 1,
-0.594777, -0.1221234, -0.6318516, 1, 1, 1, 1, 1,
-0.594141, -0.6505008, -2.315861, 1, 1, 1, 1, 1,
-0.5858716, 0.3536648, -1.105101, 0, 0, 1, 1, 1,
-0.5841799, -0.7957331, -1.94692, 1, 0, 0, 1, 1,
-0.583003, 0.09471745, -0.3523597, 1, 0, 0, 1, 1,
-0.5821015, -0.4616071, -1.768409, 1, 0, 0, 1, 1,
-0.580487, -0.5669615, -2.144779, 1, 0, 0, 1, 1,
-0.5789405, 1.030414, -0.390797, 1, 0, 0, 1, 1,
-0.5741399, 0.9513263, -1.940345, 0, 0, 0, 1, 1,
-0.5676382, 0.9086968, -0.2924372, 0, 0, 0, 1, 1,
-0.5648294, 0.7609577, -1.93636, 0, 0, 0, 1, 1,
-0.5647073, 0.6909567, 0.003096737, 0, 0, 0, 1, 1,
-0.5646453, 0.599079, -0.9406184, 0, 0, 0, 1, 1,
-0.5597966, 1.543159, -1.382236, 0, 0, 0, 1, 1,
-0.5572648, -0.7342595, -3.468447, 0, 0, 0, 1, 1,
-0.5521038, -1.664503, -1.690182, 1, 1, 1, 1, 1,
-0.5483727, 0.6089163, 0.05098992, 1, 1, 1, 1, 1,
-0.5483697, -1.982332, -2.31616, 1, 1, 1, 1, 1,
-0.544006, 2.400475, -1.623307, 1, 1, 1, 1, 1,
-0.5432437, 0.3040848, -2.512491, 1, 1, 1, 1, 1,
-0.5358109, -0.2231563, -0.9630561, 1, 1, 1, 1, 1,
-0.5324728, 0.8203819, -1.210128, 1, 1, 1, 1, 1,
-0.5235711, 0.1345404, 0.3578527, 1, 1, 1, 1, 1,
-0.514667, 0.679804, -0.9742126, 1, 1, 1, 1, 1,
-0.514, 1.936133, 0.7525917, 1, 1, 1, 1, 1,
-0.5120105, -1.824661, -1.456169, 1, 1, 1, 1, 1,
-0.5070081, -0.2791349, -1.699182, 1, 1, 1, 1, 1,
-0.5008824, 1.00444, -0.9088623, 1, 1, 1, 1, 1,
-0.5008515, 0.9643335, -0.9087777, 1, 1, 1, 1, 1,
-0.4966502, -0.2960458, -1.072754, 1, 1, 1, 1, 1,
-0.4930061, 0.6354402, -0.1960628, 0, 0, 1, 1, 1,
-0.4921986, -0.1793485, -1.393793, 1, 0, 0, 1, 1,
-0.4876378, 1.029357, -0.2269372, 1, 0, 0, 1, 1,
-0.4864163, -0.7132387, -2.403456, 1, 0, 0, 1, 1,
-0.480378, 0.3903103, -2.970473, 1, 0, 0, 1, 1,
-0.4799221, 0.04024169, -4.060272, 1, 0, 0, 1, 1,
-0.4788261, 0.17176, -0.7286037, 0, 0, 0, 1, 1,
-0.476885, 0.7024662, -0.729526, 0, 0, 0, 1, 1,
-0.4759931, 0.9567584, -0.5226191, 0, 0, 0, 1, 1,
-0.4744037, -1.395421, -1.478467, 0, 0, 0, 1, 1,
-0.4714169, 0.4634503, -1.099535, 0, 0, 0, 1, 1,
-0.4704019, -0.1543592, -3.616379, 0, 0, 0, 1, 1,
-0.4678376, -0.5160977, -1.713549, 0, 0, 0, 1, 1,
-0.4625079, 0.2371014, 0.1279262, 1, 1, 1, 1, 1,
-0.4606189, -1.166973, -1.788147, 1, 1, 1, 1, 1,
-0.4605871, 0.1017141, -1.351063, 1, 1, 1, 1, 1,
-0.4556094, -0.4921345, -2.307088, 1, 1, 1, 1, 1,
-0.4534668, -0.1871309, -1.316178, 1, 1, 1, 1, 1,
-0.4511436, -0.4487014, -2.257009, 1, 1, 1, 1, 1,
-0.4506177, -0.02511973, -1.352228, 1, 1, 1, 1, 1,
-0.4467208, 1.825688, 1.641279, 1, 1, 1, 1, 1,
-0.4462699, -1.701044, -2.595345, 1, 1, 1, 1, 1,
-0.4446268, -1.23896, -4.067659, 1, 1, 1, 1, 1,
-0.4441174, -0.3906199, -1.991647, 1, 1, 1, 1, 1,
-0.4429035, 0.2018842, -2.25811, 1, 1, 1, 1, 1,
-0.4396828, 0.1790158, -0.1758602, 1, 1, 1, 1, 1,
-0.4381606, 0.2066045, -0.7727276, 1, 1, 1, 1, 1,
-0.4379396, 0.5703782, -2.054469, 1, 1, 1, 1, 1,
-0.4374874, 1.194232, 0.1014823, 0, 0, 1, 1, 1,
-0.4313842, 1.475278, -0.696951, 1, 0, 0, 1, 1,
-0.4292709, -0.9586667, -1.230097, 1, 0, 0, 1, 1,
-0.4270974, 0.115952, -2.896474, 1, 0, 0, 1, 1,
-0.4262363, -0.1560082, -2.419373, 1, 0, 0, 1, 1,
-0.425302, -1.920979, -2.122229, 1, 0, 0, 1, 1,
-0.4246392, 2.479573, -1.66986, 0, 0, 0, 1, 1,
-0.4237973, -0.05725387, -2.159803, 0, 0, 0, 1, 1,
-0.423571, 0.9417596, -0.564975, 0, 0, 0, 1, 1,
-0.4230184, 0.9465971, 1.914116, 0, 0, 0, 1, 1,
-0.4211462, -0.020633, -1.509691, 0, 0, 0, 1, 1,
-0.42038, 1.399717, 0.4061735, 0, 0, 0, 1, 1,
-0.4197245, -0.8675149, -3.151032, 0, 0, 0, 1, 1,
-0.4188933, 0.3617546, -0.7505068, 1, 1, 1, 1, 1,
-0.4186241, -1.093272, -3.414917, 1, 1, 1, 1, 1,
-0.4160693, -1.473758, -2.917456, 1, 1, 1, 1, 1,
-0.4132109, 1.75779, 0.702395, 1, 1, 1, 1, 1,
-0.4107538, -1.392464, -4.955174, 1, 1, 1, 1, 1,
-0.4086494, 0.1026849, -0.4756993, 1, 1, 1, 1, 1,
-0.4084459, 1.39678, -0.3989838, 1, 1, 1, 1, 1,
-0.4056967, -0.6191742, -0.9763722, 1, 1, 1, 1, 1,
-0.4048685, 0.65753, -1.125531, 1, 1, 1, 1, 1,
-0.404589, -0.2949558, -1.660835, 1, 1, 1, 1, 1,
-0.3966172, 0.3192335, -0.6657276, 1, 1, 1, 1, 1,
-0.3910334, -0.7527608, -2.424759, 1, 1, 1, 1, 1,
-0.3889543, -0.5693215, -0.8470004, 1, 1, 1, 1, 1,
-0.3839431, 0.1004713, -2.997908, 1, 1, 1, 1, 1,
-0.3815388, -0.4070625, -3.82291, 1, 1, 1, 1, 1,
-0.3807216, -0.9026219, -3.10661, 0, 0, 1, 1, 1,
-0.3769277, 0.4846091, 0.9777356, 1, 0, 0, 1, 1,
-0.3765459, 0.248237, -0.7365965, 1, 0, 0, 1, 1,
-0.3687845, -0.02672327, -2.412472, 1, 0, 0, 1, 1,
-0.3667754, 0.1093444, -1.556281, 1, 0, 0, 1, 1,
-0.3636527, 0.4090444, 1.676549, 1, 0, 0, 1, 1,
-0.356035, -0.9516885, -3.120129, 0, 0, 0, 1, 1,
-0.3530272, -1.220199, -2.43562, 0, 0, 0, 1, 1,
-0.3509373, -1.525353, -3.604341, 0, 0, 0, 1, 1,
-0.3474542, -0.4297152, -2.297297, 0, 0, 0, 1, 1,
-0.3461775, -1.082751, -3.522892, 0, 0, 0, 1, 1,
-0.3457925, -1.104323, -2.175469, 0, 0, 0, 1, 1,
-0.3444733, 2.668085, 0.1257011, 0, 0, 0, 1, 1,
-0.3410295, 0.7589772, -0.8053017, 1, 1, 1, 1, 1,
-0.3375713, 1.480791, -0.9253269, 1, 1, 1, 1, 1,
-0.336339, 0.2091054, -1.112184, 1, 1, 1, 1, 1,
-0.3327379, -1.456057, -1.78901, 1, 1, 1, 1, 1,
-0.3323244, 0.2537775, -0.423847, 1, 1, 1, 1, 1,
-0.3322748, -0.8059418, -4.958979, 1, 1, 1, 1, 1,
-0.3306375, 0.7604575, 0.5698438, 1, 1, 1, 1, 1,
-0.3288681, -0.180351, -1.570514, 1, 1, 1, 1, 1,
-0.327448, 0.03319928, -1.456077, 1, 1, 1, 1, 1,
-0.3273191, 1.643566, -1.894029, 1, 1, 1, 1, 1,
-0.3254659, 0.6539188, -0.4974739, 1, 1, 1, 1, 1,
-0.3238702, -1.28219, -3.860402, 1, 1, 1, 1, 1,
-0.3200162, 0.4380524, -2.218795, 1, 1, 1, 1, 1,
-0.3129597, 0.9744436, 0.5645167, 1, 1, 1, 1, 1,
-0.3103064, -0.4278943, -1.471097, 1, 1, 1, 1, 1,
-0.2998846, -0.2040965, -0.7150872, 0, 0, 1, 1, 1,
-0.2987875, 0.8251838, -2.231873, 1, 0, 0, 1, 1,
-0.296515, 0.2591365, -0.6556803, 1, 0, 0, 1, 1,
-0.2957245, -0.3548372, -1.715873, 1, 0, 0, 1, 1,
-0.2938877, -1.115232, -2.526138, 1, 0, 0, 1, 1,
-0.2864661, 0.4624585, 0.4371279, 1, 0, 0, 1, 1,
-0.2848194, -0.2654251, -3.815208, 0, 0, 0, 1, 1,
-0.2800707, 1.245382, 0.5233784, 0, 0, 0, 1, 1,
-0.2794527, -0.2792425, -1.859126, 0, 0, 0, 1, 1,
-0.2775148, -0.1156197, -2.650084, 0, 0, 0, 1, 1,
-0.2770087, 0.4304899, 0.2708713, 0, 0, 0, 1, 1,
-0.2743421, -2.465414, -3.102045, 0, 0, 0, 1, 1,
-0.2673205, 1.632387, 0.5814634, 0, 0, 0, 1, 1,
-0.2662629, -0.9088156, -1.871762, 1, 1, 1, 1, 1,
-0.2620286, -0.2464798, -2.234402, 1, 1, 1, 1, 1,
-0.2534224, 0.9728819, -0.8288048, 1, 1, 1, 1, 1,
-0.2525533, -0.7126065, -1.873075, 1, 1, 1, 1, 1,
-0.2482017, 1.006576, -0.08768957, 1, 1, 1, 1, 1,
-0.2468749, 2.162862, -0.1455674, 1, 1, 1, 1, 1,
-0.2461174, -0.1931151, -3.456378, 1, 1, 1, 1, 1,
-0.2436524, 0.9515205, -1.098935, 1, 1, 1, 1, 1,
-0.2431471, -0.06947951, -2.474087, 1, 1, 1, 1, 1,
-0.2407976, 1.211177, -2.276845, 1, 1, 1, 1, 1,
-0.2354828, -0.08426027, -3.416854, 1, 1, 1, 1, 1,
-0.2343368, 0.04600088, 0.4256579, 1, 1, 1, 1, 1,
-0.2342688, 0.4982208, 1.210165, 1, 1, 1, 1, 1,
-0.231684, -0.5153966, -2.42134, 1, 1, 1, 1, 1,
-0.2306948, 1.097821, 0.1230539, 1, 1, 1, 1, 1,
-0.2299968, 0.06748962, -0.8424311, 0, 0, 1, 1, 1,
-0.229308, -1.243896, -2.891291, 1, 0, 0, 1, 1,
-0.2285864, 0.967304, 0.4783278, 1, 0, 0, 1, 1,
-0.2278416, -0.4876173, -3.502663, 1, 0, 0, 1, 1,
-0.2242654, -0.9876571, -3.713911, 1, 0, 0, 1, 1,
-0.2210215, 1.094312, -0.1496333, 1, 0, 0, 1, 1,
-0.219234, 0.6318607, 0.2455168, 0, 0, 0, 1, 1,
-0.213831, 0.2859047, 0.04853106, 0, 0, 0, 1, 1,
-0.2130327, -0.3892443, -2.164949, 0, 0, 0, 1, 1,
-0.2120806, -0.5328954, -3.761326, 0, 0, 0, 1, 1,
-0.2066078, -0.6421021, -2.650695, 0, 0, 0, 1, 1,
-0.1967986, 1.657657, 0.164338, 0, 0, 0, 1, 1,
-0.1908645, -1.213218, -2.734219, 0, 0, 0, 1, 1,
-0.1905667, -0.1664255, -2.348813, 1, 1, 1, 1, 1,
-0.1862344, 2.168337, -1.041962, 1, 1, 1, 1, 1,
-0.185133, 0.5523782, -0.2052684, 1, 1, 1, 1, 1,
-0.1802946, 0.09922365, -0.6165068, 1, 1, 1, 1, 1,
-0.1790243, -0.8114569, -2.489052, 1, 1, 1, 1, 1,
-0.1774202, -0.6537555, -3.083965, 1, 1, 1, 1, 1,
-0.1761261, -0.1118898, -2.974576, 1, 1, 1, 1, 1,
-0.1760059, 1.869966, -0.3740963, 1, 1, 1, 1, 1,
-0.1741052, -1.37261, -1.956983, 1, 1, 1, 1, 1,
-0.1693439, -0.3677063, -1.84899, 1, 1, 1, 1, 1,
-0.1687794, -0.6705214, -2.959207, 1, 1, 1, 1, 1,
-0.1674308, -0.03571487, -1.313062, 1, 1, 1, 1, 1,
-0.1668187, -1.823234, -3.670389, 1, 1, 1, 1, 1,
-0.1645233, 0.8011, -0.6624956, 1, 1, 1, 1, 1,
-0.1622401, -0.9544545, -3.770114, 1, 1, 1, 1, 1,
-0.1530131, 2.083638, -0.1714904, 0, 0, 1, 1, 1,
-0.1518043, 1.407491, 2.193612, 1, 0, 0, 1, 1,
-0.1516185, 0.6195694, -0.09140952, 1, 0, 0, 1, 1,
-0.1515328, -1.615488, -3.897937, 1, 0, 0, 1, 1,
-0.1504333, -0.4345204, -3.417816, 1, 0, 0, 1, 1,
-0.1492581, 0.5172591, -0.3019013, 1, 0, 0, 1, 1,
-0.1484967, -0.8753345, -2.781275, 0, 0, 0, 1, 1,
-0.1478673, -0.3550622, -1.957052, 0, 0, 0, 1, 1,
-0.1436414, -1.067147, -1.379346, 0, 0, 0, 1, 1,
-0.139818, 0.2250833, 0.9833543, 0, 0, 0, 1, 1,
-0.1388243, 1.117608, -0.7826225, 0, 0, 0, 1, 1,
-0.1364518, -0.630275, -2.699751, 0, 0, 0, 1, 1,
-0.1308531, 1.003038, -0.2419687, 0, 0, 0, 1, 1,
-0.130722, 0.08454176, -0.2208299, 1, 1, 1, 1, 1,
-0.1249214, 1.079816, 2.085408, 1, 1, 1, 1, 1,
-0.1228964, 1.05447, -0.4366575, 1, 1, 1, 1, 1,
-0.1180488, -0.3502883, -2.445127, 1, 1, 1, 1, 1,
-0.1145261, -0.605827, -2.290701, 1, 1, 1, 1, 1,
-0.1143526, -0.6975683, -0.8114854, 1, 1, 1, 1, 1,
-0.1143444, 0.105827, -1.078833, 1, 1, 1, 1, 1,
-0.1125314, 0.2980201, -0.853748, 1, 1, 1, 1, 1,
-0.110399, 0.8820001, 2.428916, 1, 1, 1, 1, 1,
-0.1063427, -2.097858, -3.432945, 1, 1, 1, 1, 1,
-0.1048302, 1.695014, 0.4295278, 1, 1, 1, 1, 1,
-0.1028863, -0.5948918, -2.301102, 1, 1, 1, 1, 1,
-0.09769407, 0.7934679, -0.9010691, 1, 1, 1, 1, 1,
-0.09560759, 1.648531, -0.4001751, 1, 1, 1, 1, 1,
-0.09451532, 0.4989919, 0.9987683, 1, 1, 1, 1, 1,
-0.09392446, 0.5092186, -1.010955, 0, 0, 1, 1, 1,
-0.08979667, 0.7026908, -0.2947203, 1, 0, 0, 1, 1,
-0.08818436, 1.993165, 0.4266135, 1, 0, 0, 1, 1,
-0.0880218, -0.002925242, -1.292847, 1, 0, 0, 1, 1,
-0.08768176, -0.4560523, -2.577784, 1, 0, 0, 1, 1,
-0.08714449, -0.5344961, -4.026983, 1, 0, 0, 1, 1,
-0.08510023, -1.630855, -3.490155, 0, 0, 0, 1, 1,
-0.08092876, -0.3496496, -2.460042, 0, 0, 0, 1, 1,
-0.08032369, 0.5408619, -0.6967493, 0, 0, 0, 1, 1,
-0.07862108, -1.227901, -3.239159, 0, 0, 0, 1, 1,
-0.07707811, 0.474472, -0.04726022, 0, 0, 0, 1, 1,
-0.07400458, 0.7147687, -0.1467976, 0, 0, 0, 1, 1,
-0.07331716, 0.9843737, -0.4191491, 0, 0, 0, 1, 1,
-0.06807416, -0.1275289, -2.294821, 1, 1, 1, 1, 1,
-0.06787945, -1.033795, -3.101853, 1, 1, 1, 1, 1,
-0.06635897, 0.7926059, 0.356511, 1, 1, 1, 1, 1,
-0.06592689, 0.1234779, -0.8825181, 1, 1, 1, 1, 1,
-0.06114811, -1.445214, -3.158677, 1, 1, 1, 1, 1,
-0.06012336, -0.6111943, -3.743918, 1, 1, 1, 1, 1,
-0.05903055, 1.082585, -0.5881308, 1, 1, 1, 1, 1,
-0.05835482, -0.2346914, -3.157825, 1, 1, 1, 1, 1,
-0.05376427, -1.320394, -4.516581, 1, 1, 1, 1, 1,
-0.05191818, 0.4606427, -2.302958, 1, 1, 1, 1, 1,
-0.04661334, 0.2671678, -0.002607499, 1, 1, 1, 1, 1,
-0.04608567, 1.554766, 0.2881913, 1, 1, 1, 1, 1,
-0.04260779, 1.448806, 0.3772453, 1, 1, 1, 1, 1,
-0.04166297, 0.3211028, -0.684841, 1, 1, 1, 1, 1,
-0.03817359, 1.150445, 1.157251, 1, 1, 1, 1, 1,
-0.03601665, 0.7424477, 0.8947497, 0, 0, 1, 1, 1,
-0.03511218, -0.16089, -2.244345, 1, 0, 0, 1, 1,
-0.03120274, -1.571558, -5.469362, 1, 0, 0, 1, 1,
-0.02868418, 0.644694, 1.86102, 1, 0, 0, 1, 1,
-0.02811563, 0.515888, -0.269746, 1, 0, 0, 1, 1,
-0.0256864, 0.5201731, 0.0942766, 1, 0, 0, 1, 1,
-0.02407309, -1.04615, -1.536443, 0, 0, 0, 1, 1,
-0.02230462, 1.182455, 0.2334456, 0, 0, 0, 1, 1,
-0.02140271, -0.2798475, -2.500508, 0, 0, 0, 1, 1,
-0.01519333, -0.1677739, -1.863603, 0, 0, 0, 1, 1,
-0.0149385, 0.6508213, -1.047748, 0, 0, 0, 1, 1,
-0.01369455, -0.4436151, -3.377953, 0, 0, 0, 1, 1,
-0.01251971, -0.1341048, -2.675844, 0, 0, 0, 1, 1,
-0.01101481, 1.746303, -0.6529676, 1, 1, 1, 1, 1,
-0.008323663, -0.1306935, -2.818156, 1, 1, 1, 1, 1,
-0.004320838, 0.4758447, -1.537278, 1, 1, 1, 1, 1,
-0.002095378, -0.4767344, -2.918998, 1, 1, 1, 1, 1,
-0.000642916, -0.3864598, -5.087178, 1, 1, 1, 1, 1,
0.0008726035, -0.2045413, 2.578787, 1, 1, 1, 1, 1,
0.001283905, -1.477104, 1.715317, 1, 1, 1, 1, 1,
0.008684393, -0.2229767, 2.230138, 1, 1, 1, 1, 1,
0.009960035, -0.1771525, 1.142098, 1, 1, 1, 1, 1,
0.01216844, -1.148855, 1.819434, 1, 1, 1, 1, 1,
0.01896584, -0.2607371, 2.772886, 1, 1, 1, 1, 1,
0.02115796, 0.7109284, 0.7858077, 1, 1, 1, 1, 1,
0.02716246, 1.574808, -0.6105909, 1, 1, 1, 1, 1,
0.03100809, 1.099749, 1.220845, 1, 1, 1, 1, 1,
0.03139611, 1.167283, 1.731373, 1, 1, 1, 1, 1,
0.03180555, 0.355044, 0.6213577, 0, 0, 1, 1, 1,
0.03646747, -1.199531, 2.52488, 1, 0, 0, 1, 1,
0.03651809, -0.9662085, 3.259219, 1, 0, 0, 1, 1,
0.03869182, 2.010729, -0.0953898, 1, 0, 0, 1, 1,
0.04385181, -0.9541168, 2.517347, 1, 0, 0, 1, 1,
0.05218337, 1.064439, 0.3498701, 1, 0, 0, 1, 1,
0.05313548, 0.6612464, -0.2826149, 0, 0, 0, 1, 1,
0.05660186, 0.1439354, -1.149115, 0, 0, 0, 1, 1,
0.057394, -1.794567, 3.524142, 0, 0, 0, 1, 1,
0.0610049, 0.3472406, 0.04367316, 0, 0, 0, 1, 1,
0.06305388, 0.9277231, -1.847071, 0, 0, 0, 1, 1,
0.07031424, -0.9211975, 2.448357, 0, 0, 0, 1, 1,
0.07171941, 1.3119, 0.7451846, 0, 0, 0, 1, 1,
0.07357215, -0.1018866, 1.634584, 1, 1, 1, 1, 1,
0.07832984, 0.6317533, -0.2316856, 1, 1, 1, 1, 1,
0.08071951, -1.526511, 2.847263, 1, 1, 1, 1, 1,
0.08632711, -0.0950795, 2.575733, 1, 1, 1, 1, 1,
0.09199348, -0.8310515, 4.935558, 1, 1, 1, 1, 1,
0.09484591, -0.8146505, 3.980613, 1, 1, 1, 1, 1,
0.09584044, 0.3467357, 0.4817272, 1, 1, 1, 1, 1,
0.09773624, -0.3013011, 5.070997, 1, 1, 1, 1, 1,
0.09850466, 0.5023172, -0.279227, 1, 1, 1, 1, 1,
0.1009068, -0.3334914, 1.477909, 1, 1, 1, 1, 1,
0.1011371, -1.939542, 3.834646, 1, 1, 1, 1, 1,
0.1032094, 0.8299403, -0.4696109, 1, 1, 1, 1, 1,
0.1064691, -0.958645, 3.015095, 1, 1, 1, 1, 1,
0.1070968, 0.1352075, 0.5706438, 1, 1, 1, 1, 1,
0.1109095, -2.96729, 2.986059, 1, 1, 1, 1, 1,
0.1116379, 1.844145, -1.314984, 0, 0, 1, 1, 1,
0.1162657, -2.019153, 4.041646, 1, 0, 0, 1, 1,
0.117882, 1.10954, 1.664027, 1, 0, 0, 1, 1,
0.1207814, 0.6953007, -1.26964, 1, 0, 0, 1, 1,
0.1283849, -0.8538688, 4.116271, 1, 0, 0, 1, 1,
0.1294163, -0.1939903, 1.427878, 1, 0, 0, 1, 1,
0.1367599, 0.5540521, 0.09329626, 0, 0, 0, 1, 1,
0.1389403, -0.1896587, 1.477399, 0, 0, 0, 1, 1,
0.141744, -0.3600543, 3.263658, 0, 0, 0, 1, 1,
0.1418199, 0.02038736, 1.077331, 0, 0, 0, 1, 1,
0.1430213, -0.5611683, 0.8171477, 0, 0, 0, 1, 1,
0.158305, 0.5744074, 0.5385392, 0, 0, 0, 1, 1,
0.1592872, 0.4217615, -0.2032544, 0, 0, 0, 1, 1,
0.1644502, 1.862074, 0.1437845, 1, 1, 1, 1, 1,
0.1654116, -0.1054176, 2.701406, 1, 1, 1, 1, 1,
0.1663576, 1.410253, -0.128178, 1, 1, 1, 1, 1,
0.1685187, -1.619627, 3.774615, 1, 1, 1, 1, 1,
0.1717371, 0.9813353, 0.7240749, 1, 1, 1, 1, 1,
0.1722702, -1.658325, 1.246748, 1, 1, 1, 1, 1,
0.1728683, -0.5805137, 0.5832616, 1, 1, 1, 1, 1,
0.1751479, -1.042362, 2.92894, 1, 1, 1, 1, 1,
0.1776004, -0.5076058, 3.859276, 1, 1, 1, 1, 1,
0.1777029, 0.6987656, 0.4965577, 1, 1, 1, 1, 1,
0.1822636, 0.007016301, 0.5654706, 1, 1, 1, 1, 1,
0.184013, 1.102896, 0.6372914, 1, 1, 1, 1, 1,
0.18511, -0.02013771, 1.314983, 1, 1, 1, 1, 1,
0.1859092, -0.5511193, 2.964792, 1, 1, 1, 1, 1,
0.1871843, -0.03075904, 2.009143, 1, 1, 1, 1, 1,
0.1881241, 1.04936, 0.1240912, 0, 0, 1, 1, 1,
0.1884467, 0.8861988, -0.1566706, 1, 0, 0, 1, 1,
0.1902132, 0.3942104, 0.4244264, 1, 0, 0, 1, 1,
0.1938448, -0.1623605, 3.595277, 1, 0, 0, 1, 1,
0.2005324, 0.3084669, 0.1807278, 1, 0, 0, 1, 1,
0.2034978, 0.4244668, 0.2370245, 1, 0, 0, 1, 1,
0.2052985, 0.3101131, -0.7304625, 0, 0, 0, 1, 1,
0.2083001, 0.3101678, -0.2273483, 0, 0, 0, 1, 1,
0.20942, 0.7638088, 1.166541, 0, 0, 0, 1, 1,
0.2109562, 1.11791, -2.041811, 0, 0, 0, 1, 1,
0.2136858, -0.2677918, 1.362776, 0, 0, 0, 1, 1,
0.2144338, 1.358805, -0.6252272, 0, 0, 0, 1, 1,
0.2154928, 0.2585755, 0.9700017, 0, 0, 0, 1, 1,
0.2184107, -1.001188, 3.365967, 1, 1, 1, 1, 1,
0.2189882, -0.8172672, 3.384693, 1, 1, 1, 1, 1,
0.2213017, 1.25983, 0.4074576, 1, 1, 1, 1, 1,
0.2242994, -0.2209464, 0.8427778, 1, 1, 1, 1, 1,
0.2285682, -0.4444293, 2.051543, 1, 1, 1, 1, 1,
0.2292438, -1.196567, 3.244416, 1, 1, 1, 1, 1,
0.2362754, 0.8614568, -0.7759434, 1, 1, 1, 1, 1,
0.2368648, 0.8132679, -0.7661817, 1, 1, 1, 1, 1,
0.2377424, 1.277038, 2.01982, 1, 1, 1, 1, 1,
0.2379143, -1.087177, 1.951281, 1, 1, 1, 1, 1,
0.2380241, -0.1142587, 0.1901727, 1, 1, 1, 1, 1,
0.2383818, -0.3419265, 3.245771, 1, 1, 1, 1, 1,
0.2408042, 1.78541, -0.3674216, 1, 1, 1, 1, 1,
0.2425364, -1.032267, 4.024475, 1, 1, 1, 1, 1,
0.2438785, 0.1228237, 0.4566388, 1, 1, 1, 1, 1,
0.2457978, 1.087053, -0.07748579, 0, 0, 1, 1, 1,
0.2470389, -0.5661995, 1.811331, 1, 0, 0, 1, 1,
0.2496398, -0.8784311, 3.155994, 1, 0, 0, 1, 1,
0.2509839, -0.1049712, 2.344589, 1, 0, 0, 1, 1,
0.2561695, -0.3406104, 2.694175, 1, 0, 0, 1, 1,
0.2589357, -0.7087654, 2.458084, 1, 0, 0, 1, 1,
0.263375, -2.045303, 3.278041, 0, 0, 0, 1, 1,
0.2646102, -0.4581063, 2.450122, 0, 0, 0, 1, 1,
0.265554, 0.610368, 0.935376, 0, 0, 0, 1, 1,
0.2665968, 0.9842337, 1.703641, 0, 0, 0, 1, 1,
0.2743152, 1.08993, -0.1076018, 0, 0, 0, 1, 1,
0.2753143, -0.1089083, 2.139441, 0, 0, 0, 1, 1,
0.2770854, 1.47714, 1.224262, 0, 0, 0, 1, 1,
0.2808768, -1.215999, 3.717113, 1, 1, 1, 1, 1,
0.2860247, 1.144253, -0.1254176, 1, 1, 1, 1, 1,
0.2871566, -0.1613038, 0.9173205, 1, 1, 1, 1, 1,
0.293905, -0.3203195, 2.508114, 1, 1, 1, 1, 1,
0.2953921, 0.0966157, 1.212659, 1, 1, 1, 1, 1,
0.2964476, -0.2174315, 2.693131, 1, 1, 1, 1, 1,
0.2982135, -0.7419508, 2.727391, 1, 1, 1, 1, 1,
0.2992651, -1.271707, 1.812835, 1, 1, 1, 1, 1,
0.3017611, -0.1840265, 1.895729, 1, 1, 1, 1, 1,
0.3022134, 0.05421179, 1.138986, 1, 1, 1, 1, 1,
0.3050412, -0.9906856, 3.817708, 1, 1, 1, 1, 1,
0.3051766, 0.3067125, 2.064848, 1, 1, 1, 1, 1,
0.3066732, 0.3085556, -1.223092, 1, 1, 1, 1, 1,
0.3078133, 0.0228256, 0.6920835, 1, 1, 1, 1, 1,
0.3080816, -0.1374062, 2.281803, 1, 1, 1, 1, 1,
0.3085944, -1.189054, 1.858604, 0, 0, 1, 1, 1,
0.3123235, -0.9636049, 3.943633, 1, 0, 0, 1, 1,
0.3150336, 0.1534611, 1.828726, 1, 0, 0, 1, 1,
0.3153338, -1.164511, 2.683734, 1, 0, 0, 1, 1,
0.3173101, 1.616802, -0.1378448, 1, 0, 0, 1, 1,
0.3179542, -1.944202, 4.479283, 1, 0, 0, 1, 1,
0.3219303, -0.2707922, 2.72164, 0, 0, 0, 1, 1,
0.3248499, 0.4216516, 1.444946, 0, 0, 0, 1, 1,
0.3274678, 0.4315064, -1.118555, 0, 0, 0, 1, 1,
0.3412243, -0.7974014, 2.640506, 0, 0, 0, 1, 1,
0.3504631, -0.9905039, 2.006929, 0, 0, 0, 1, 1,
0.3517627, -0.4169028, 2.99485, 0, 0, 0, 1, 1,
0.3548191, -1.122512, 3.565788, 0, 0, 0, 1, 1,
0.3580022, 1.460033, 0.9355705, 1, 1, 1, 1, 1,
0.3613287, 1.345332, -0.5799301, 1, 1, 1, 1, 1,
0.3654785, -1.678577, 3.849659, 1, 1, 1, 1, 1,
0.3681184, 0.1913464, 1.531793, 1, 1, 1, 1, 1,
0.3701253, 1.079055, 0.7978855, 1, 1, 1, 1, 1,
0.3703608, 0.3656498, 0.7006649, 1, 1, 1, 1, 1,
0.3797294, 0.1537071, 1.785517, 1, 1, 1, 1, 1,
0.385295, 1.716767, 0.9379843, 1, 1, 1, 1, 1,
0.3858978, 0.7875596, 1.880603, 1, 1, 1, 1, 1,
0.3890814, -0.8200029, 3.385451, 1, 1, 1, 1, 1,
0.3894772, -1.744564, 1.885604, 1, 1, 1, 1, 1,
0.3911965, 1.37748, 0.8889673, 1, 1, 1, 1, 1,
0.3925764, -0.6736845, 4.049673, 1, 1, 1, 1, 1,
0.3932988, -0.99629, 2.834244, 1, 1, 1, 1, 1,
0.3985763, 2.035764, 0.07429267, 1, 1, 1, 1, 1,
0.4116405, -0.5348819, 3.798874, 0, 0, 1, 1, 1,
0.4198753, 0.2922095, -0.09323311, 1, 0, 0, 1, 1,
0.420017, 0.2319765, 0.9003097, 1, 0, 0, 1, 1,
0.4266953, 1.176845, 0.3408235, 1, 0, 0, 1, 1,
0.4283437, 0.3908275, -0.07557572, 1, 0, 0, 1, 1,
0.4289404, 0.1652322, 2.51368, 1, 0, 0, 1, 1,
0.4304967, -0.272094, 1.887302, 0, 0, 0, 1, 1,
0.4355904, -0.9483572, 3.794357, 0, 0, 0, 1, 1,
0.436097, -0.8308559, 1.825424, 0, 0, 0, 1, 1,
0.4377517, -0.5033397, 3.620247, 0, 0, 0, 1, 1,
0.444086, -0.7245548, 4.677229, 0, 0, 0, 1, 1,
0.4539826, 0.1875529, 1.18549, 0, 0, 0, 1, 1,
0.4618325, -0.2926913, 2.011614, 0, 0, 0, 1, 1,
0.4618803, -1.204722, 3.268649, 1, 1, 1, 1, 1,
0.464966, -0.2773221, 2.541787, 1, 1, 1, 1, 1,
0.4656857, -0.5676163, 3.191084, 1, 1, 1, 1, 1,
0.4658706, 0.8953724, -0.136922, 1, 1, 1, 1, 1,
0.4669071, 0.7794253, 0.6585785, 1, 1, 1, 1, 1,
0.4671355, -0.4596593, 1.983147, 1, 1, 1, 1, 1,
0.467452, -0.01237677, 0.6877952, 1, 1, 1, 1, 1,
0.4728343, 2.092507, -0.1639576, 1, 1, 1, 1, 1,
0.4734899, 1.24418, 0.4374548, 1, 1, 1, 1, 1,
0.4736898, -1.459899, 2.426972, 1, 1, 1, 1, 1,
0.4759428, 0.199698, -0.5256982, 1, 1, 1, 1, 1,
0.4806968, -1.138743, 4.161214, 1, 1, 1, 1, 1,
0.481245, 2.176637, -0.1265312, 1, 1, 1, 1, 1,
0.4815515, 0.285686, 2.45057, 1, 1, 1, 1, 1,
0.4825999, 1.727299, 0.1813361, 1, 1, 1, 1, 1,
0.4861503, -0.7052969, 1.790213, 0, 0, 1, 1, 1,
0.4877931, -0.08263205, 1.336008, 1, 0, 0, 1, 1,
0.4933145, -0.4328465, 2.27764, 1, 0, 0, 1, 1,
0.4943211, 0.9232825, 2.269329, 1, 0, 0, 1, 1,
0.4962387, -1.012082, 3.210036, 1, 0, 0, 1, 1,
0.4982829, -2.364666, 3.91416, 1, 0, 0, 1, 1,
0.4993588, -0.160193, 1.802995, 0, 0, 0, 1, 1,
0.5019192, -0.7416095, 2.407508, 0, 0, 0, 1, 1,
0.5032618, -1.130611, 1.819666, 0, 0, 0, 1, 1,
0.5048785, -1.319204, 3.425405, 0, 0, 0, 1, 1,
0.516821, -0.3075544, 4.978753, 0, 0, 0, 1, 1,
0.5178929, -0.7865769, 2.734481, 0, 0, 0, 1, 1,
0.5181606, -2.095929, 2.730447, 0, 0, 0, 1, 1,
0.5194035, 0.1133965, 2.281184, 1, 1, 1, 1, 1,
0.5221109, -0.02259148, 1.247641, 1, 1, 1, 1, 1,
0.5232673, 0.850652, -0.4935008, 1, 1, 1, 1, 1,
0.5234008, 0.6922807, 0.9758865, 1, 1, 1, 1, 1,
0.5333608, 0.4791956, 2.370748, 1, 1, 1, 1, 1,
0.5340849, 0.6248788, -1.009448, 1, 1, 1, 1, 1,
0.5376941, 0.1082107, -0.1842251, 1, 1, 1, 1, 1,
0.542277, -0.9430023, 3.530494, 1, 1, 1, 1, 1,
0.543433, 0.3583693, 3.143053, 1, 1, 1, 1, 1,
0.5490606, 0.213097, 0.4315577, 1, 1, 1, 1, 1,
0.5499769, 0.2078944, -0.4319582, 1, 1, 1, 1, 1,
0.5510945, 0.2396754, -0.6127852, 1, 1, 1, 1, 1,
0.5566604, 1.650278, -0.8396046, 1, 1, 1, 1, 1,
0.5648334, 0.7017629, 0.716731, 1, 1, 1, 1, 1,
0.5663857, 0.3680041, 0.4685927, 1, 1, 1, 1, 1,
0.5663898, -0.9746794, 3.162504, 0, 0, 1, 1, 1,
0.5719396, 0.9207547, -1.249089, 1, 0, 0, 1, 1,
0.5740418, 0.4302315, 1.511048, 1, 0, 0, 1, 1,
0.5742597, 1.596569, 1.570964, 1, 0, 0, 1, 1,
0.5757772, -0.5201607, 3.964641, 1, 0, 0, 1, 1,
0.5768462, 0.01911721, 2.135359, 1, 0, 0, 1, 1,
0.5863222, -1.185782, 2.259053, 0, 0, 0, 1, 1,
0.5886258, -0.01151055, 1.707824, 0, 0, 0, 1, 1,
0.5984453, -0.1145652, 1.46678, 0, 0, 0, 1, 1,
0.5993695, 1.231309, -0.9945421, 0, 0, 0, 1, 1,
0.6004145, 0.6626836, 0.7617931, 0, 0, 0, 1, 1,
0.6037543, -0.4308268, 1.912093, 0, 0, 0, 1, 1,
0.6062914, 1.814635, 0.2966167, 0, 0, 0, 1, 1,
0.6063165, -1.006597, 1.085388, 1, 1, 1, 1, 1,
0.6064079, -0.6248893, 2.883916, 1, 1, 1, 1, 1,
0.6064525, 1.075999, 0.2547354, 1, 1, 1, 1, 1,
0.6085218, 0.643311, 0.5320396, 1, 1, 1, 1, 1,
0.6087564, 1.233038, -1.389078, 1, 1, 1, 1, 1,
0.6167294, -1.694132, 2.612114, 1, 1, 1, 1, 1,
0.621194, 0.6385157, -0.02574006, 1, 1, 1, 1, 1,
0.6212227, 0.5020028, 0.4515258, 1, 1, 1, 1, 1,
0.6218124, -0.9368484, 1.971941, 1, 1, 1, 1, 1,
0.6257593, -1.64118, 2.722667, 1, 1, 1, 1, 1,
0.6281389, -1.835393, 1.032171, 1, 1, 1, 1, 1,
0.6296266, -0.3281433, 2.364887, 1, 1, 1, 1, 1,
0.6385338, -1.343825, 1.055942, 1, 1, 1, 1, 1,
0.6387318, 0.8813921, 0.7650014, 1, 1, 1, 1, 1,
0.6446639, -1.2283, 3.389345, 1, 1, 1, 1, 1,
0.6456309, 3.070066, -0.1062792, 0, 0, 1, 1, 1,
0.6470224, 0.2177371, 0.1636135, 1, 0, 0, 1, 1,
0.6531157, -1.053274, 2.586026, 1, 0, 0, 1, 1,
0.6556371, -0.01130429, 1.742679, 1, 0, 0, 1, 1,
0.6582757, -0.5475441, 1.649086, 1, 0, 0, 1, 1,
0.6589692, 2.346818, 1.275037, 1, 0, 0, 1, 1,
0.6626163, -0.02380722, 0.3245513, 0, 0, 0, 1, 1,
0.6652982, 0.9404368, -0.03046704, 0, 0, 0, 1, 1,
0.6700726, 0.9930013, 1.30701, 0, 0, 0, 1, 1,
0.6716537, 1.84003, 0.3656231, 0, 0, 0, 1, 1,
0.6743532, -1.685521, 4.838192, 0, 0, 0, 1, 1,
0.6866661, -0.6021681, 1.72586, 0, 0, 0, 1, 1,
0.6885931, -1.962229, 2.881053, 0, 0, 0, 1, 1,
0.6941299, 0.902032, -0.555031, 1, 1, 1, 1, 1,
0.6948061, 1.235353, 0.1526636, 1, 1, 1, 1, 1,
0.6984405, -0.9973539, 2.617706, 1, 1, 1, 1, 1,
0.7020733, 0.7127479, -0.6838826, 1, 1, 1, 1, 1,
0.7025241, -0.615718, -1.081555, 1, 1, 1, 1, 1,
0.7058488, 0.8513586, 1.93945, 1, 1, 1, 1, 1,
0.7091995, -1.181987, 2.113661, 1, 1, 1, 1, 1,
0.710117, -0.2301729, 1.544519, 1, 1, 1, 1, 1,
0.7110336, 0.3367977, 1.53245, 1, 1, 1, 1, 1,
0.7115813, 0.1001703, -1.093989, 1, 1, 1, 1, 1,
0.713484, 1.959481, 1.4361, 1, 1, 1, 1, 1,
0.7158606, -2.221377, 4.041744, 1, 1, 1, 1, 1,
0.7158757, -0.3754812, 0.8345857, 1, 1, 1, 1, 1,
0.719624, -0.8201483, 4.024992, 1, 1, 1, 1, 1,
0.7199256, -0.3208697, -0.0813356, 1, 1, 1, 1, 1,
0.719991, 0.05419994, 1.772902, 0, 0, 1, 1, 1,
0.7208729, 1.078, -0.9568501, 1, 0, 0, 1, 1,
0.7235103, -1.092675, 5.621276, 1, 0, 0, 1, 1,
0.7289295, 0.4465545, 1.782607, 1, 0, 0, 1, 1,
0.7413052, -0.3244688, 1.711407, 1, 0, 0, 1, 1,
0.7422233, -0.06354234, 0.6030095, 1, 0, 0, 1, 1,
0.7499077, 0.5041993, 1.365833, 0, 0, 0, 1, 1,
0.750948, -0.1981689, 1.625908, 0, 0, 0, 1, 1,
0.7565027, 1.894066, 0.96006, 0, 0, 0, 1, 1,
0.7584267, 0.1279716, 1.33837, 0, 0, 0, 1, 1,
0.7667912, 0.0456627, 1.014054, 0, 0, 0, 1, 1,
0.774784, 1.633439, -0.6165764, 0, 0, 0, 1, 1,
0.7781221, 1.27945, 0.2557274, 0, 0, 0, 1, 1,
0.7795401, -0.05995928, -0.3582087, 1, 1, 1, 1, 1,
0.7819853, 0.4818003, 2.020681, 1, 1, 1, 1, 1,
0.7830964, 0.5915811, 3.003828, 1, 1, 1, 1, 1,
0.7868028, 1.147887, -0.2288823, 1, 1, 1, 1, 1,
0.789822, 1.340119, 0.7694994, 1, 1, 1, 1, 1,
0.796024, -0.4636338, 4.177902, 1, 1, 1, 1, 1,
0.7972202, 0.04111945, 2.810383, 1, 1, 1, 1, 1,
0.7989395, 0.07149755, -0.3431996, 1, 1, 1, 1, 1,
0.8014321, -0.2804418, 0.05408533, 1, 1, 1, 1, 1,
0.8090801, 0.1953313, 0.2141591, 1, 1, 1, 1, 1,
0.8209652, 1.154063, -0.09800008, 1, 1, 1, 1, 1,
0.8221623, 0.3942469, 0.6908594, 1, 1, 1, 1, 1,
0.8249427, 0.652344, 1.808623, 1, 1, 1, 1, 1,
0.8319679, 0.7652505, -0.6513863, 1, 1, 1, 1, 1,
0.8430133, 0.7139754, 3.017437, 1, 1, 1, 1, 1,
0.8469302, -0.686297, 0.771396, 0, 0, 1, 1, 1,
0.8499582, 0.9273927, 1.332867, 1, 0, 0, 1, 1,
0.8514681, -1.262431, 2.40542, 1, 0, 0, 1, 1,
0.8528323, 1.316884, -0.6791205, 1, 0, 0, 1, 1,
0.8561812, -0.03048567, 0.5562618, 1, 0, 0, 1, 1,
0.8581506, -1.444144, 1.728036, 1, 0, 0, 1, 1,
0.8768945, 0.7617185, 2.542681, 0, 0, 0, 1, 1,
0.8785064, 1.041512, -2.198147, 0, 0, 0, 1, 1,
0.882722, -0.9195143, 2.23448, 0, 0, 0, 1, 1,
0.8845241, 1.082746, -0.5034277, 0, 0, 0, 1, 1,
0.8850631, 1.389397, 1.708455, 0, 0, 0, 1, 1,
0.88625, 0.09661238, 1.823071, 0, 0, 0, 1, 1,
0.8917495, 0.332204, 2.046268, 0, 0, 0, 1, 1,
0.8920227, -1.211175, 1.742639, 1, 1, 1, 1, 1,
0.8945218, -0.7982665, 2.463511, 1, 1, 1, 1, 1,
0.8977889, -0.6534072, 2.352986, 1, 1, 1, 1, 1,
0.9001587, -0.06379909, 2.950316, 1, 1, 1, 1, 1,
0.9051728, 0.4871853, 2.060297, 1, 1, 1, 1, 1,
0.9059976, -0.8692111, 1.39378, 1, 1, 1, 1, 1,
0.9142606, 0.2405781, 0.2413003, 1, 1, 1, 1, 1,
0.9182208, -0.6425344, 2.760207, 1, 1, 1, 1, 1,
0.9188581, -1.403745, 2.00118, 1, 1, 1, 1, 1,
0.9311159, -0.3779547, 1.232497, 1, 1, 1, 1, 1,
0.9324086, 0.8953822, 1.04969, 1, 1, 1, 1, 1,
0.9328493, 0.922149, -0.137545, 1, 1, 1, 1, 1,
0.9332085, -0.9014165, 1.398018, 1, 1, 1, 1, 1,
0.9365128, 1.135955, -0.9888082, 1, 1, 1, 1, 1,
0.9381028, -0.09008037, 1.030491, 1, 1, 1, 1, 1,
0.9398413, -0.1863246, 1.353837, 0, 0, 1, 1, 1,
0.9424555, -1.623181, 4.078947, 1, 0, 0, 1, 1,
0.9440378, -0.03344757, 2.165517, 1, 0, 0, 1, 1,
0.945051, 0.5837596, 1.412517, 1, 0, 0, 1, 1,
0.9466783, 0.7201301, 0.1350223, 1, 0, 0, 1, 1,
0.9485226, -0.2100656, 2.72618, 1, 0, 0, 1, 1,
0.9592264, 0.9045908, 2.097394, 0, 0, 0, 1, 1,
0.9655743, 0.6053128, 0.7612841, 0, 0, 0, 1, 1,
0.9698927, -0.6514983, 1.929276, 0, 0, 0, 1, 1,
0.9788242, -0.2104256, 1.080675, 0, 0, 0, 1, 1,
0.9832842, -0.1070259, 1.938741, 0, 0, 0, 1, 1,
0.9855056, 2.289794, -0.7931775, 0, 0, 0, 1, 1,
1.002179, 1.148227, 1.712207, 0, 0, 0, 1, 1,
1.015218, -0.04419868, 2.036787, 1, 1, 1, 1, 1,
1.016971, 0.126361, 2.228949, 1, 1, 1, 1, 1,
1.019405, 1.582473, -1.102281, 1, 1, 1, 1, 1,
1.020603, 0.2986772, 1.553757, 1, 1, 1, 1, 1,
1.023273, -1.387884, 4.282185, 1, 1, 1, 1, 1,
1.029534, -0.6320625, 3.51255, 1, 1, 1, 1, 1,
1.030841, -0.2697185, 1.458598, 1, 1, 1, 1, 1,
1.035832, 0.6359982, -0.2579933, 1, 1, 1, 1, 1,
1.039489, -0.5636038, 1.081175, 1, 1, 1, 1, 1,
1.040552, -1.443211, 1.775685, 1, 1, 1, 1, 1,
1.040646, 1.666132, -0.6699331, 1, 1, 1, 1, 1,
1.045085, 0.06920478, 0.245154, 1, 1, 1, 1, 1,
1.050161, -1.946255, 2.900043, 1, 1, 1, 1, 1,
1.055043, 0.1430282, 2.431585, 1, 1, 1, 1, 1,
1.056764, -0.3428352, 3.126365, 1, 1, 1, 1, 1,
1.061748, -1.491028, 2.099102, 0, 0, 1, 1, 1,
1.06733, -0.9151754, 2.980243, 1, 0, 0, 1, 1,
1.067718, -0.4151374, 2.383938, 1, 0, 0, 1, 1,
1.073106, 1.975139, 1.53265, 1, 0, 0, 1, 1,
1.077005, 0.3351981, 0.384838, 1, 0, 0, 1, 1,
1.079532, 1.133167, -0.8114147, 1, 0, 0, 1, 1,
1.079978, 1.052138, 0.2861893, 0, 0, 0, 1, 1,
1.081439, -0.2242921, 2.680814, 0, 0, 0, 1, 1,
1.083358, 0.9032232, 1.345057, 0, 0, 0, 1, 1,
1.088274, -0.8073431, 2.753183, 0, 0, 0, 1, 1,
1.091463, -0.5725658, 1.211707, 0, 0, 0, 1, 1,
1.093955, 0.3729057, 0.614342, 0, 0, 0, 1, 1,
1.094771, 1.027288, 0.1772202, 0, 0, 0, 1, 1,
1.095251, -0.1186046, 0.278936, 1, 1, 1, 1, 1,
1.098154, 0.549998, -0.3918192, 1, 1, 1, 1, 1,
1.099096, 1.045711, -0.0249077, 1, 1, 1, 1, 1,
1.11033, 0.08178903, -0.2014319, 1, 1, 1, 1, 1,
1.112873, 0.1051404, 1.36964, 1, 1, 1, 1, 1,
1.121671, -0.6621247, 0.9626215, 1, 1, 1, 1, 1,
1.12959, 1.099741, 1.265127, 1, 1, 1, 1, 1,
1.129803, -1.179004, 2.58043, 1, 1, 1, 1, 1,
1.13293, -0.3576031, 2.489958, 1, 1, 1, 1, 1,
1.137986, -2.252172, 3.437518, 1, 1, 1, 1, 1,
1.141048, -0.05800936, 1.492956, 1, 1, 1, 1, 1,
1.142781, 0.4160039, 1.089394, 1, 1, 1, 1, 1,
1.157697, 0.1188178, 2.3616, 1, 1, 1, 1, 1,
1.172653, 0.9107209, 0.9253073, 1, 1, 1, 1, 1,
1.175872, -1.285796, 2.123711, 1, 1, 1, 1, 1,
1.186134, -1.334337, 3.449816, 0, 0, 1, 1, 1,
1.190888, -0.05747098, 1.073757, 1, 0, 0, 1, 1,
1.191887, 1.284624, 0.8964936, 1, 0, 0, 1, 1,
1.192986, 0.8905839, 1.035389, 1, 0, 0, 1, 1,
1.194394, -0.1463815, 1.861937, 1, 0, 0, 1, 1,
1.203911, 1.053105, 0.02837398, 1, 0, 0, 1, 1,
1.210363, 0.7974759, 1.796553, 0, 0, 0, 1, 1,
1.210789, -0.1516976, 2.319515, 0, 0, 0, 1, 1,
1.21109, 0.3757401, 1.619629, 0, 0, 0, 1, 1,
1.227158, 0.2139328, 0.9477656, 0, 0, 0, 1, 1,
1.238875, -0.3193841, 2.078054, 0, 0, 0, 1, 1,
1.242044, -0.8243164, 2.067189, 0, 0, 0, 1, 1,
1.24206, -0.1892046, 0.5219946, 0, 0, 0, 1, 1,
1.242748, -0.6348106, 1.141709, 1, 1, 1, 1, 1,
1.247317, -0.5467705, 1.683774, 1, 1, 1, 1, 1,
1.252582, -2.073304, 1.539041, 1, 1, 1, 1, 1,
1.256901, 1.752653, 0.4811974, 1, 1, 1, 1, 1,
1.25784, -1.247485, 1.194355, 1, 1, 1, 1, 1,
1.262659, 0.8750999, 1.338302, 1, 1, 1, 1, 1,
1.265862, 0.1885121, 2.172907, 1, 1, 1, 1, 1,
1.26991, 0.4057905, 2.050637, 1, 1, 1, 1, 1,
1.271876, -1.060654, 2.961407, 1, 1, 1, 1, 1,
1.274148, -0.3601676, 0.308805, 1, 1, 1, 1, 1,
1.278018, 1.122545, 2.26207, 1, 1, 1, 1, 1,
1.281566, -0.09026095, 1.077117, 1, 1, 1, 1, 1,
1.282851, 0.806111, 1.710047, 1, 1, 1, 1, 1,
1.286328, 0.6822057, 0.9611699, 1, 1, 1, 1, 1,
1.286939, -0.4019478, 1.66014, 1, 1, 1, 1, 1,
1.288586, -0.2788777, 0.7530741, 0, 0, 1, 1, 1,
1.291176, -0.3318938, -0.42035, 1, 0, 0, 1, 1,
1.29518, -0.0009625008, 0.8321555, 1, 0, 0, 1, 1,
1.296211, -0.2360582, 1.970593, 1, 0, 0, 1, 1,
1.297987, -0.231838, 2.851775, 1, 0, 0, 1, 1,
1.29933, 0.5435578, 0.7193489, 1, 0, 0, 1, 1,
1.301461, 0.5578737, -0.5670639, 0, 0, 0, 1, 1,
1.315142, 0.8263609, 0.3211926, 0, 0, 0, 1, 1,
1.329628, -0.07199986, 1.207539, 0, 0, 0, 1, 1,
1.331688, -1.03459, 0.7007136, 0, 0, 0, 1, 1,
1.345764, 0.4556179, 1.745511, 0, 0, 0, 1, 1,
1.348205, -1.382031, 3.006907, 0, 0, 0, 1, 1,
1.352099, 2.257668, 0.2124685, 0, 0, 0, 1, 1,
1.354898, 0.7288191, 1.378467, 1, 1, 1, 1, 1,
1.375538, 0.2973605, 1.49454, 1, 1, 1, 1, 1,
1.384513, 1.621922, 1.546229, 1, 1, 1, 1, 1,
1.405726, -0.04363062, 1.864108, 1, 1, 1, 1, 1,
1.413565, -2.077105, 2.306173, 1, 1, 1, 1, 1,
1.416634, -0.2487271, 1.470931, 1, 1, 1, 1, 1,
1.433755, -0.5215976, 1.158826, 1, 1, 1, 1, 1,
1.44194, -2.057281, 0.3820162, 1, 1, 1, 1, 1,
1.445792, 0.7194087, 1.879743, 1, 1, 1, 1, 1,
1.460685, -1.3301, 0.8803732, 1, 1, 1, 1, 1,
1.46461, 0.3090891, 1.845054, 1, 1, 1, 1, 1,
1.468211, -0.4946978, 2.891627, 1, 1, 1, 1, 1,
1.469123, 1.30068, 0.7032477, 1, 1, 1, 1, 1,
1.478765, -1.580919, 2.015146, 1, 1, 1, 1, 1,
1.482676, 2.270923, 1.428691, 1, 1, 1, 1, 1,
1.496628, -0.162151, 3.44794, 0, 0, 1, 1, 1,
1.499276, -0.5474905, 2.44306, 1, 0, 0, 1, 1,
1.503564, -2.655156, 3.472669, 1, 0, 0, 1, 1,
1.513845, -0.2200415, 2.224992, 1, 0, 0, 1, 1,
1.515649, 0.25862, 0.7132016, 1, 0, 0, 1, 1,
1.521373, 0.1373735, 1.520889, 1, 0, 0, 1, 1,
1.540558, -0.07508688, 0.8220661, 0, 0, 0, 1, 1,
1.542922, 0.05315904, 2.581344, 0, 0, 0, 1, 1,
1.54468, -0.4597545, 1.68996, 0, 0, 0, 1, 1,
1.546272, 0.2901022, 1.725932, 0, 0, 0, 1, 1,
1.546491, -0.114058, 3.195717, 0, 0, 0, 1, 1,
1.557009, 0.6760579, 1.602833, 0, 0, 0, 1, 1,
1.557138, -1.263887, 1.069671, 0, 0, 0, 1, 1,
1.558087, -0.6268592, 1.645958, 1, 1, 1, 1, 1,
1.565159, -0.7650315, 1.593065, 1, 1, 1, 1, 1,
1.568617, 0.6735845, 3.252692, 1, 1, 1, 1, 1,
1.57353, -0.6761627, 2.610241, 1, 1, 1, 1, 1,
1.574572, -1.220242, 2.487477, 1, 1, 1, 1, 1,
1.575994, -0.2322273, 0.004104178, 1, 1, 1, 1, 1,
1.596543, 2.370235, 0.1768766, 1, 1, 1, 1, 1,
1.614039, -0.3296464, 2.620797, 1, 1, 1, 1, 1,
1.61716, -0.1714357, 1.99743, 1, 1, 1, 1, 1,
1.624416, 1.794775, 0.3877626, 1, 1, 1, 1, 1,
1.661711, -1.160998, 3.350521, 1, 1, 1, 1, 1,
1.673204, -0.2790302, 0.9121275, 1, 1, 1, 1, 1,
1.689869, -0.4426042, 2.990767, 1, 1, 1, 1, 1,
1.696565, -0.2606771, 2.700392, 1, 1, 1, 1, 1,
1.699236, -1.506078, 3.324159, 1, 1, 1, 1, 1,
1.711223, -0.742066, 0.6925753, 0, 0, 1, 1, 1,
1.713625, -1.339511, 1.673476, 1, 0, 0, 1, 1,
1.719053, -0.5343748, 2.856665, 1, 0, 0, 1, 1,
1.726714, -1.102609, 1.198905, 1, 0, 0, 1, 1,
1.733154, -1.797036, 4.36908, 1, 0, 0, 1, 1,
1.757732, 0.660328, -0.1568393, 1, 0, 0, 1, 1,
1.773845, 0.3620725, 0.6663171, 0, 0, 0, 1, 1,
1.784596, 0.9098672, 2.445612, 0, 0, 0, 1, 1,
1.80284, 1.710056, 0.5697959, 0, 0, 0, 1, 1,
1.807213, 1.233307, 1.011658, 0, 0, 0, 1, 1,
1.808769, 0.02615284, 1.605604, 0, 0, 0, 1, 1,
1.842696, -0.689813, 1.395047, 0, 0, 0, 1, 1,
1.857268, -1.049302, 1.333038, 0, 0, 0, 1, 1,
1.859282, -2.215545, 1.695534, 1, 1, 1, 1, 1,
1.860132, -0.8014071, 0.9484168, 1, 1, 1, 1, 1,
1.873512, 0.9308314, 0.6702093, 1, 1, 1, 1, 1,
1.878712, -0.19756, 1.094739, 1, 1, 1, 1, 1,
1.88798, 1.255417, -1.553093, 1, 1, 1, 1, 1,
1.89286, -0.9018126, 0.7365083, 1, 1, 1, 1, 1,
1.935752, 0.1569448, 0.8413867, 1, 1, 1, 1, 1,
1.943106, 1.041312, 2.305503, 1, 1, 1, 1, 1,
1.954153, 2.089267, 0.00265935, 1, 1, 1, 1, 1,
1.964887, -1.085323, 1.50739, 1, 1, 1, 1, 1,
1.992471, 1.472516, 1.494045, 1, 1, 1, 1, 1,
1.995608, -1.262781, 0.07615581, 1, 1, 1, 1, 1,
1.999319, -0.04109726, 1.295616, 1, 1, 1, 1, 1,
2.042217, 0.1422944, 1.270388, 1, 1, 1, 1, 1,
2.06644, 0.6575426, 3.380905, 1, 1, 1, 1, 1,
2.102953, -0.5853576, 2.065517, 0, 0, 1, 1, 1,
2.107484, -2.067565, 1.850165, 1, 0, 0, 1, 1,
2.16125, -0.2459768, 1.60972, 1, 0, 0, 1, 1,
2.167183, -0.1151739, 1.592484, 1, 0, 0, 1, 1,
2.211781, -0.3200649, 3.067319, 1, 0, 0, 1, 1,
2.263857, 0.1636389, 0.9419577, 1, 0, 0, 1, 1,
2.323772, -0.4121295, 0.9295331, 0, 0, 0, 1, 1,
2.330927, -0.5915935, 2.73052, 0, 0, 0, 1, 1,
2.38766, 0.4196149, 1.995719, 0, 0, 0, 1, 1,
2.441865, 1.410725, 3.260862, 0, 0, 0, 1, 1,
2.489618, 0.4264377, 3.779211, 0, 0, 0, 1, 1,
2.50012, 0.98821, 2.995774, 0, 0, 0, 1, 1,
2.509082, 0.4734397, 1.2244, 0, 0, 0, 1, 1,
2.55898, 0.7038072, 2.489423, 1, 1, 1, 1, 1,
2.571876, 0.6144255, 1.004686, 1, 1, 1, 1, 1,
2.574967, 0.1326238, -0.695187, 1, 1, 1, 1, 1,
2.635448, -1.079489, 2.126057, 1, 1, 1, 1, 1,
2.754986, 1.710831, -0.4610704, 1, 1, 1, 1, 1,
2.787814, 1.187416, 0.442754, 1, 1, 1, 1, 1,
3.182439, 0.48489, 0.7295077, 1, 1, 1, 1, 1
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
var radius = 9.696547;
var distance = 34.05871;
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
mvMatrix.translate( 0.1435301, -0.05138826, -0.07595706 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.05871);
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
