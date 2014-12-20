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
-2.953732, -0.7073351, -1.537765, 1, 0, 0, 1,
-2.922406, 1.280757, -1.905951, 1, 0.007843138, 0, 1,
-2.726752, 0.7736135, 0.337406, 1, 0.01176471, 0, 1,
-2.63216, 0.3074743, -3.264953, 1, 0.01960784, 0, 1,
-2.577797, 0.5161146, 0.002045114, 1, 0.02352941, 0, 1,
-2.547868, -0.5291743, -1.385567, 1, 0.03137255, 0, 1,
-2.52549, -0.9928254, -0.1056662, 1, 0.03529412, 0, 1,
-2.508551, -0.4946069, -2.360008, 1, 0.04313726, 0, 1,
-2.375912, 1.440404, -0.1260975, 1, 0.04705882, 0, 1,
-2.301191, -0.5643847, -1.140212, 1, 0.05490196, 0, 1,
-2.263222, 0.2966385, -0.6245636, 1, 0.05882353, 0, 1,
-2.247438, -1.415113, -1.976578, 1, 0.06666667, 0, 1,
-2.216497, 1.089776, -3.430409, 1, 0.07058824, 0, 1,
-2.213046, -0.8496234, -1.241696, 1, 0.07843138, 0, 1,
-2.209806, -0.1330221, -1.732329, 1, 0.08235294, 0, 1,
-2.202711, -0.8000895, 0.3664838, 1, 0.09019608, 0, 1,
-2.180627, -1.379115, -1.329533, 1, 0.09411765, 0, 1,
-2.172096, -0.6600655, -1.874222, 1, 0.1019608, 0, 1,
-2.164001, -0.4532876, -1.08694, 1, 0.1098039, 0, 1,
-2.156936, 0.6083108, -2.47434, 1, 0.1137255, 0, 1,
-2.119164, -1.474764, -2.389072, 1, 0.1215686, 0, 1,
-2.112106, 0.0535741, -1.118505, 1, 0.1254902, 0, 1,
-2.086604, -1.623154, -1.995919, 1, 0.1333333, 0, 1,
-1.976691, -0.3087233, -1.951101, 1, 0.1372549, 0, 1,
-1.927337, 0.7814839, -2.048143, 1, 0.145098, 0, 1,
-1.91967, -0.9296359, -2.290649, 1, 0.1490196, 0, 1,
-1.911727, -0.7047857, -0.3124416, 1, 0.1568628, 0, 1,
-1.909676, -1.527692, -1.475707, 1, 0.1607843, 0, 1,
-1.903513, 0.6160073, -0.982197, 1, 0.1686275, 0, 1,
-1.894853, 0.2363766, -0.2869025, 1, 0.172549, 0, 1,
-1.876263, -1.06857, -1.403359, 1, 0.1803922, 0, 1,
-1.852844, -0.2586796, -3.394125, 1, 0.1843137, 0, 1,
-1.846056, -0.8621976, -1.252186, 1, 0.1921569, 0, 1,
-1.842567, -1.833894, -2.309523, 1, 0.1960784, 0, 1,
-1.835724, -1.65884, -2.485312, 1, 0.2039216, 0, 1,
-1.832193, -1.480512, -3.733075, 1, 0.2117647, 0, 1,
-1.828754, 0.6757861, -3.116842, 1, 0.2156863, 0, 1,
-1.806591, -0.3952197, -1.183732, 1, 0.2235294, 0, 1,
-1.782402, 1.04505, -1.437831, 1, 0.227451, 0, 1,
-1.78068, 0.5573418, -1.233841, 1, 0.2352941, 0, 1,
-1.752757, -0.4050696, -1.293303, 1, 0.2392157, 0, 1,
-1.750737, 0.5469915, -1.087143, 1, 0.2470588, 0, 1,
-1.744555, 0.2467886, -0.6852518, 1, 0.2509804, 0, 1,
-1.721544, 0.06611071, -0.8656756, 1, 0.2588235, 0, 1,
-1.717384, -0.188829, -1.365147, 1, 0.2627451, 0, 1,
-1.715719, 1.121318, -0.3216831, 1, 0.2705882, 0, 1,
-1.712467, 0.3354524, -1.654911, 1, 0.2745098, 0, 1,
-1.705605, 0.7581075, -0.1592654, 1, 0.282353, 0, 1,
-1.693393, -1.159171, -3.264747, 1, 0.2862745, 0, 1,
-1.690074, -0.2236034, -4.038349, 1, 0.2941177, 0, 1,
-1.679651, -0.6240021, -1.694387, 1, 0.3019608, 0, 1,
-1.678373, -0.2365927, 0.1938358, 1, 0.3058824, 0, 1,
-1.660493, 1.125277, -1.428137, 1, 0.3137255, 0, 1,
-1.656172, -0.9054262, -1.683841, 1, 0.3176471, 0, 1,
-1.625878, 1.105859, -0.7041658, 1, 0.3254902, 0, 1,
-1.613666, -1.669199, -3.666181, 1, 0.3294118, 0, 1,
-1.603395, -0.1611133, -3.855581, 1, 0.3372549, 0, 1,
-1.59911, -1.749624, -2.474748, 1, 0.3411765, 0, 1,
-1.576959, 0.6610915, -1.579682, 1, 0.3490196, 0, 1,
-1.545384, 0.5198168, -2.266258, 1, 0.3529412, 0, 1,
-1.542942, -0.4014406, -1.282524, 1, 0.3607843, 0, 1,
-1.53567, 0.2094065, -2.616462, 1, 0.3647059, 0, 1,
-1.527378, 0.6685525, -0.3074203, 1, 0.372549, 0, 1,
-1.525766, -1.974762, -2.773207, 1, 0.3764706, 0, 1,
-1.51483, 0.08821109, 0.06804708, 1, 0.3843137, 0, 1,
-1.512403, 1.24131, -0.5036671, 1, 0.3882353, 0, 1,
-1.501181, 0.8134514, -1.21675, 1, 0.3960784, 0, 1,
-1.499285, 0.4163043, -1.369628, 1, 0.4039216, 0, 1,
-1.492697, -0.4429794, -3.02349, 1, 0.4078431, 0, 1,
-1.486875, 0.4839197, 0.785793, 1, 0.4156863, 0, 1,
-1.486229, 1.218585, -0.3300382, 1, 0.4196078, 0, 1,
-1.482299, 0.9284397, -1.610593, 1, 0.427451, 0, 1,
-1.472465, 0.2459408, -2.116909, 1, 0.4313726, 0, 1,
-1.445178, 0.92619, -0.3355103, 1, 0.4392157, 0, 1,
-1.436073, -0.6462285, -1.832222, 1, 0.4431373, 0, 1,
-1.430752, -0.6931846, -1.694489, 1, 0.4509804, 0, 1,
-1.426615, 0.1631748, -2.046131, 1, 0.454902, 0, 1,
-1.414552, -2.504268, -3.095415, 1, 0.4627451, 0, 1,
-1.409956, -0.6612891, -2.870936, 1, 0.4666667, 0, 1,
-1.406143, -1.557856, -4.383877, 1, 0.4745098, 0, 1,
-1.394886, -1.051179, -2.401474, 1, 0.4784314, 0, 1,
-1.384631, 0.3879995, -1.520491, 1, 0.4862745, 0, 1,
-1.383836, 0.2322164, -1.591489, 1, 0.4901961, 0, 1,
-1.380104, -0.4335072, -1.502632, 1, 0.4980392, 0, 1,
-1.374941, -0.6135823, -1.747611, 1, 0.5058824, 0, 1,
-1.370254, 0.4257956, -1.011563, 1, 0.509804, 0, 1,
-1.367756, 0.3583716, -0.8549427, 1, 0.5176471, 0, 1,
-1.364049, -0.2252801, -0.8453459, 1, 0.5215687, 0, 1,
-1.360624, -0.310845, -2.283251, 1, 0.5294118, 0, 1,
-1.359273, 0.2108604, -0.265027, 1, 0.5333334, 0, 1,
-1.354855, -0.3536224, -2.230448, 1, 0.5411765, 0, 1,
-1.344277, -0.281124, -2.038903, 1, 0.5450981, 0, 1,
-1.341463, 1.424123, -2.843335, 1, 0.5529412, 0, 1,
-1.336759, -1.058281, -3.717531, 1, 0.5568628, 0, 1,
-1.330666, -0.6682957, -4.087345, 1, 0.5647059, 0, 1,
-1.329351, -0.01242415, -1.62956, 1, 0.5686275, 0, 1,
-1.327297, -0.7615895, -1.299507, 1, 0.5764706, 0, 1,
-1.326311, 0.03852531, -1.53766, 1, 0.5803922, 0, 1,
-1.32565, -0.1169321, -0.914188, 1, 0.5882353, 0, 1,
-1.317587, -1.091625, -3.109552, 1, 0.5921569, 0, 1,
-1.30728, 1.628668, -1.989702, 1, 0.6, 0, 1,
-1.293885, 1.406059, 0.3717067, 1, 0.6078432, 0, 1,
-1.288187, 0.3076504, -0.2853482, 1, 0.6117647, 0, 1,
-1.286686, 0.3864847, 0.2499836, 1, 0.6196079, 0, 1,
-1.265684, -1.625398, -3.30784, 1, 0.6235294, 0, 1,
-1.264471, 1.448598, 0.4444233, 1, 0.6313726, 0, 1,
-1.261012, 0.7784709, -1.648484, 1, 0.6352941, 0, 1,
-1.25967, -0.8070698, -2.646073, 1, 0.6431373, 0, 1,
-1.2535, -0.8224738, -2.63287, 1, 0.6470588, 0, 1,
-1.251184, -0.2949601, -1.079902, 1, 0.654902, 0, 1,
-1.251117, 0.9974992, -1.313213, 1, 0.6588235, 0, 1,
-1.244377, 1.004166, -2.970018, 1, 0.6666667, 0, 1,
-1.241772, 0.4342115, 0.6853097, 1, 0.6705883, 0, 1,
-1.230261, 0.8826326, -2.320888, 1, 0.6784314, 0, 1,
-1.222623, 1.303697, 0.6117846, 1, 0.682353, 0, 1,
-1.218022, -2.731868, -2.615601, 1, 0.6901961, 0, 1,
-1.214162, -0.2299383, -2.454124, 1, 0.6941177, 0, 1,
-1.212909, -0.8074576, -0.7072766, 1, 0.7019608, 0, 1,
-1.209058, 0.6951559, -1.87403, 1, 0.7098039, 0, 1,
-1.204797, -0.7709011, -2.352088, 1, 0.7137255, 0, 1,
-1.200575, -0.6950116, -1.868992, 1, 0.7215686, 0, 1,
-1.186632, -0.5996135, -0.7464316, 1, 0.7254902, 0, 1,
-1.177538, -0.4056945, -1.519627, 1, 0.7333333, 0, 1,
-1.175338, 0.841413, -2.414009, 1, 0.7372549, 0, 1,
-1.173603, 1.263184, -0.6973367, 1, 0.7450981, 0, 1,
-1.162529, 0.8331146, -1.54939, 1, 0.7490196, 0, 1,
-1.16142, 0.3122516, -1.511574, 1, 0.7568628, 0, 1,
-1.151107, -1.431896, -3.793818, 1, 0.7607843, 0, 1,
-1.143899, 0.5660615, -1.830011, 1, 0.7686275, 0, 1,
-1.128468, -0.5368042, -4.45272, 1, 0.772549, 0, 1,
-1.110959, 0.891446, -0.7072585, 1, 0.7803922, 0, 1,
-1.110625, -0.1445028, -0.3125491, 1, 0.7843137, 0, 1,
-1.106995, -0.4660842, -2.541809, 1, 0.7921569, 0, 1,
-1.103811, 1.400243, 0.03943172, 1, 0.7960784, 0, 1,
-1.102867, 1.058915, -0.3216801, 1, 0.8039216, 0, 1,
-1.102711, -1.472421, -4.064281, 1, 0.8117647, 0, 1,
-1.092003, 1.056262, -1.204965, 1, 0.8156863, 0, 1,
-1.091652, -1.894424, -2.885418, 1, 0.8235294, 0, 1,
-1.084992, -1.521307, -3.397068, 1, 0.827451, 0, 1,
-1.081113, -1.497526, -4.179247, 1, 0.8352941, 0, 1,
-1.079326, -0.5035195, -2.904921, 1, 0.8392157, 0, 1,
-1.076714, -0.2137592, -1.403374, 1, 0.8470588, 0, 1,
-1.075099, 0.740495, -1.822464, 1, 0.8509804, 0, 1,
-1.066741, -0.2070313, -1.20594, 1, 0.8588235, 0, 1,
-1.064508, 0.0926466, -1.777942, 1, 0.8627451, 0, 1,
-1.062628, -2.175502, -3.510633, 1, 0.8705882, 0, 1,
-1.056785, 1.398927, 0.3034238, 1, 0.8745098, 0, 1,
-1.046471, 1.415414, 0.09418105, 1, 0.8823529, 0, 1,
-1.045425, -0.3632048, -1.446167, 1, 0.8862745, 0, 1,
-1.04542, -0.5384693, -2.001407, 1, 0.8941177, 0, 1,
-1.044879, -0.1551406, -0.5453399, 1, 0.8980392, 0, 1,
-1.043231, -2.000632, -2.933525, 1, 0.9058824, 0, 1,
-1.037773, -1.381162, -3.592104, 1, 0.9137255, 0, 1,
-1.034184, 0.1332698, -0.8190516, 1, 0.9176471, 0, 1,
-1.018496, -0.5782618, -2.675982, 1, 0.9254902, 0, 1,
-1.015257, -1.938768, -2.869716, 1, 0.9294118, 0, 1,
-1.010236, -1.022493, -1.417715, 1, 0.9372549, 0, 1,
-1.010144, 1.19848, -1.257922, 1, 0.9411765, 0, 1,
-1.005486, 1.07595, -2.08321, 1, 0.9490196, 0, 1,
-1.00491, -0.381658, -1.926497, 1, 0.9529412, 0, 1,
-1.004724, -1.733233, -0.4067728, 1, 0.9607843, 0, 1,
-1.002386, 0.5920628, -1.381168, 1, 0.9647059, 0, 1,
-1.001376, 1.693877, -0.1451332, 1, 0.972549, 0, 1,
-1.001089, 0.05453373, -1.635148, 1, 0.9764706, 0, 1,
-1.000522, -1.086496, -2.621351, 1, 0.9843137, 0, 1,
-0.9992756, -0.424864, -2.319022, 1, 0.9882353, 0, 1,
-0.9971023, -0.2567137, -3.441274, 1, 0.9960784, 0, 1,
-0.9866338, 0.8402153, 1.395409, 0.9960784, 1, 0, 1,
-0.9846495, 1.477906, 0.1987763, 0.9921569, 1, 0, 1,
-0.983855, 1.157789, -2.021998, 0.9843137, 1, 0, 1,
-0.9825919, -1.358156, -3.1863, 0.9803922, 1, 0, 1,
-0.9787053, 0.2746619, 0.1097073, 0.972549, 1, 0, 1,
-0.966863, 0.800294, -0.4463715, 0.9686275, 1, 0, 1,
-0.956488, -0.9281625, -4.027062, 0.9607843, 1, 0, 1,
-0.9561296, 0.5644265, 1.020949, 0.9568627, 1, 0, 1,
-0.9517701, -0.4300489, -1.091429, 0.9490196, 1, 0, 1,
-0.9515851, 1.483207, -0.6813968, 0.945098, 1, 0, 1,
-0.9507009, 0.2298832, -1.04815, 0.9372549, 1, 0, 1,
-0.9492285, -1.499471, -1.919412, 0.9333333, 1, 0, 1,
-0.9439198, 0.2495518, -0.7729585, 0.9254902, 1, 0, 1,
-0.9422628, -1.242961, -1.742187, 0.9215686, 1, 0, 1,
-0.9407356, 0.1721288, -0.552247, 0.9137255, 1, 0, 1,
-0.9395196, -0.1116221, -1.87146, 0.9098039, 1, 0, 1,
-0.9334573, -0.350581, -2.247631, 0.9019608, 1, 0, 1,
-0.932012, -1.897029, -3.059688, 0.8941177, 1, 0, 1,
-0.9308572, 1.80912, 1.426964, 0.8901961, 1, 0, 1,
-0.9301365, -0.3077712, -0.7035394, 0.8823529, 1, 0, 1,
-0.9291819, -2.131608, -3.673774, 0.8784314, 1, 0, 1,
-0.9273649, 0.09140494, -1.093903, 0.8705882, 1, 0, 1,
-0.9267004, -0.5186622, -1.480932, 0.8666667, 1, 0, 1,
-0.9247436, -1.713967, -2.250935, 0.8588235, 1, 0, 1,
-0.9199986, -0.2287485, -1.553806, 0.854902, 1, 0, 1,
-0.9186925, -0.7498603, 0.255599, 0.8470588, 1, 0, 1,
-0.9164457, -0.3808537, -3.549594, 0.8431373, 1, 0, 1,
-0.90232, 0.827114, -0.3179625, 0.8352941, 1, 0, 1,
-0.9003484, -0.2191788, -1.945863, 0.8313726, 1, 0, 1,
-0.8979257, 1.631617, -0.9146343, 0.8235294, 1, 0, 1,
-0.8974808, 1.748282, 0.4641997, 0.8196079, 1, 0, 1,
-0.8911346, -1.955198, -2.200659, 0.8117647, 1, 0, 1,
-0.8897679, -0.3372785, -2.757388, 0.8078431, 1, 0, 1,
-0.8888221, 1.048203, -0.6840585, 0.8, 1, 0, 1,
-0.8846867, 0.953304, 0.3598215, 0.7921569, 1, 0, 1,
-0.8823561, 0.04805284, -1.785355, 0.7882353, 1, 0, 1,
-0.8784814, -0.004999599, -1.946502, 0.7803922, 1, 0, 1,
-0.8782281, 0.3974127, -2.407871, 0.7764706, 1, 0, 1,
-0.8780181, 1.124677, 0.02438553, 0.7686275, 1, 0, 1,
-0.8745104, -0.2149604, -2.337464, 0.7647059, 1, 0, 1,
-0.8743891, 0.1925284, -3.352654, 0.7568628, 1, 0, 1,
-0.865456, 0.4159745, -1.07559, 0.7529412, 1, 0, 1,
-0.8648822, 1.526978, 0.8931912, 0.7450981, 1, 0, 1,
-0.8612653, -0.3897316, -3.289616, 0.7411765, 1, 0, 1,
-0.8595009, 0.08339855, -1.518067, 0.7333333, 1, 0, 1,
-0.8560534, -0.4829059, -1.496017, 0.7294118, 1, 0, 1,
-0.8556871, -0.04441296, -0.8073107, 0.7215686, 1, 0, 1,
-0.8545691, -0.1387731, -1.2764, 0.7176471, 1, 0, 1,
-0.8535129, 0.4633465, -1.457676, 0.7098039, 1, 0, 1,
-0.8483665, -1.26466, -1.447491, 0.7058824, 1, 0, 1,
-0.8472214, 0.4746733, -0.08635815, 0.6980392, 1, 0, 1,
-0.8464806, 0.2922079, -3.532804, 0.6901961, 1, 0, 1,
-0.8417978, 0.4655121, -1.527529, 0.6862745, 1, 0, 1,
-0.8400424, -0.2223661, -3.283629, 0.6784314, 1, 0, 1,
-0.8377063, 0.7619905, -0.01455934, 0.6745098, 1, 0, 1,
-0.8320327, -0.08541557, -1.184019, 0.6666667, 1, 0, 1,
-0.8226907, -0.8076419, -1.850307, 0.6627451, 1, 0, 1,
-0.8193267, -1.403879, -2.296962, 0.654902, 1, 0, 1,
-0.8187808, 0.5184755, -1.953688, 0.6509804, 1, 0, 1,
-0.8115398, 0.5573819, -0.3828664, 0.6431373, 1, 0, 1,
-0.8059015, 1.397788, -1.724873, 0.6392157, 1, 0, 1,
-0.7999581, 0.9128423, -1.560169, 0.6313726, 1, 0, 1,
-0.7987835, -0.1055171, -2.761566, 0.627451, 1, 0, 1,
-0.7973908, -0.3114032, -1.28385, 0.6196079, 1, 0, 1,
-0.7971734, -0.07042561, -1.027418, 0.6156863, 1, 0, 1,
-0.7970621, -0.7999226, -3.707268, 0.6078432, 1, 0, 1,
-0.7942986, -0.5001774, -1.216044, 0.6039216, 1, 0, 1,
-0.7925585, 0.3757475, -1.319678, 0.5960785, 1, 0, 1,
-0.7923563, 1.02585, -1.818554, 0.5882353, 1, 0, 1,
-0.7864582, -0.03406674, -1.59511, 0.5843138, 1, 0, 1,
-0.7849802, -1.012565, -1.018279, 0.5764706, 1, 0, 1,
-0.7787002, 0.3531849, -0.5761261, 0.572549, 1, 0, 1,
-0.7785032, 0.9645395, -1.604766, 0.5647059, 1, 0, 1,
-0.7758545, 1.596644, -0.5954447, 0.5607843, 1, 0, 1,
-0.7733072, -0.2040487, -1.133997, 0.5529412, 1, 0, 1,
-0.7689615, 0.1569077, -1.392743, 0.5490196, 1, 0, 1,
-0.7657468, -0.7961926, -2.355206, 0.5411765, 1, 0, 1,
-0.762478, -1.296868, -2.060276, 0.5372549, 1, 0, 1,
-0.7561632, -0.6062627, -3.885896, 0.5294118, 1, 0, 1,
-0.7538269, 2.229045, -0.08452875, 0.5254902, 1, 0, 1,
-0.7533382, 1.147971, 0.7930075, 0.5176471, 1, 0, 1,
-0.7521859, -1.389229, -0.1639083, 0.5137255, 1, 0, 1,
-0.7432856, -1.04995, -1.966099, 0.5058824, 1, 0, 1,
-0.741458, -0.1861756, -1.307916, 0.5019608, 1, 0, 1,
-0.7383835, 1.884594, -0.6179131, 0.4941176, 1, 0, 1,
-0.7374653, 0.7840353, -1.38584, 0.4862745, 1, 0, 1,
-0.7341996, 0.02266406, -1.423631, 0.4823529, 1, 0, 1,
-0.7306716, -0.05204521, -1.399211, 0.4745098, 1, 0, 1,
-0.729722, 0.6306453, -1.160925, 0.4705882, 1, 0, 1,
-0.7295903, 1.50218, -0.7812795, 0.4627451, 1, 0, 1,
-0.7242529, -0.3494827, -3.349294, 0.4588235, 1, 0, 1,
-0.7201661, -1.818301, -2.535675, 0.4509804, 1, 0, 1,
-0.7174661, -0.6489431, -1.85907, 0.4470588, 1, 0, 1,
-0.7172486, -1.409852, -2.130211, 0.4392157, 1, 0, 1,
-0.7128521, -1.453154, -2.155817, 0.4352941, 1, 0, 1,
-0.7078735, 0.878992, -2.300194, 0.427451, 1, 0, 1,
-0.7072602, 1.5222, -1.324923, 0.4235294, 1, 0, 1,
-0.705575, -0.0933176, -1.742634, 0.4156863, 1, 0, 1,
-0.6973203, 0.2987566, 0.008782472, 0.4117647, 1, 0, 1,
-0.6946165, -0.2510532, -2.539438, 0.4039216, 1, 0, 1,
-0.6937641, 0.2260622, -1.404913, 0.3960784, 1, 0, 1,
-0.688634, -0.1024291, -1.357029, 0.3921569, 1, 0, 1,
-0.6877435, -0.3225608, -2.333804, 0.3843137, 1, 0, 1,
-0.6853627, -0.2220543, -3.226633, 0.3803922, 1, 0, 1,
-0.685158, -1.194322, -1.607437, 0.372549, 1, 0, 1,
-0.6816582, -0.5992218, -2.959574, 0.3686275, 1, 0, 1,
-0.6811231, 0.8818132, -3.129711, 0.3607843, 1, 0, 1,
-0.672425, -0.4649169, -3.839613, 0.3568628, 1, 0, 1,
-0.6717234, -0.4763185, -2.951174, 0.3490196, 1, 0, 1,
-0.6711407, 0.02274781, -1.798213, 0.345098, 1, 0, 1,
-0.6684076, -1.316308, -3.323794, 0.3372549, 1, 0, 1,
-0.666315, -1.61939, -2.35107, 0.3333333, 1, 0, 1,
-0.6660571, 0.4151678, -0.9864993, 0.3254902, 1, 0, 1,
-0.6633953, 0.7477506, -0.9984294, 0.3215686, 1, 0, 1,
-0.6617489, -1.303493, -3.414143, 0.3137255, 1, 0, 1,
-0.6550105, 1.228765, -1.627078, 0.3098039, 1, 0, 1,
-0.6518207, 0.2878506, -2.145254, 0.3019608, 1, 0, 1,
-0.6423055, 0.6455491, -0.7514737, 0.2941177, 1, 0, 1,
-0.6392412, 1.441377, 0.2074146, 0.2901961, 1, 0, 1,
-0.6377541, -0.4155027, -3.455026, 0.282353, 1, 0, 1,
-0.6314234, 0.7280949, 1.178971, 0.2784314, 1, 0, 1,
-0.6269616, -0.4453393, -2.364341, 0.2705882, 1, 0, 1,
-0.6237336, 0.2699536, -1.554471, 0.2666667, 1, 0, 1,
-0.6166403, 0.6553279, -0.6568217, 0.2588235, 1, 0, 1,
-0.6165471, 0.7483731, -2.432423, 0.254902, 1, 0, 1,
-0.6164333, -0.2831691, -0.9052489, 0.2470588, 1, 0, 1,
-0.6153302, 2.057797, 1.778984, 0.2431373, 1, 0, 1,
-0.6119554, -0.6112337, -2.573279, 0.2352941, 1, 0, 1,
-0.6087385, 1.459938, -0.4910716, 0.2313726, 1, 0, 1,
-0.6065953, -1.611086, -2.773607, 0.2235294, 1, 0, 1,
-0.6054823, -0.1270298, -0.5412388, 0.2196078, 1, 0, 1,
-0.5938307, 0.8418596, -1.221784, 0.2117647, 1, 0, 1,
-0.5923601, -1.699852, -1.777924, 0.2078431, 1, 0, 1,
-0.5901732, -0.5657393, -2.69034, 0.2, 1, 0, 1,
-0.5868616, -1.104773, -2.311619, 0.1921569, 1, 0, 1,
-0.586293, -0.6370447, -2.25245, 0.1882353, 1, 0, 1,
-0.582786, -0.04490947, -1.990581, 0.1803922, 1, 0, 1,
-0.5794545, 0.9881765, -1.851992, 0.1764706, 1, 0, 1,
-0.5793833, 3.206198, 2.044446, 0.1686275, 1, 0, 1,
-0.5780699, -1.389962, -5.228021, 0.1647059, 1, 0, 1,
-0.5758875, 0.6920029, -1.598013, 0.1568628, 1, 0, 1,
-0.5736452, -0.1581672, -3.570012, 0.1529412, 1, 0, 1,
-0.5734919, -1.004854, -3.512371, 0.145098, 1, 0, 1,
-0.5729285, -0.2119568, -2.351414, 0.1411765, 1, 0, 1,
-0.5710232, 0.01196556, -1.44185, 0.1333333, 1, 0, 1,
-0.564326, -1.399462, -1.53286, 0.1294118, 1, 0, 1,
-0.5634114, -0.235712, -2.555701, 0.1215686, 1, 0, 1,
-0.5631799, 0.2497584, -1.955822, 0.1176471, 1, 0, 1,
-0.5585024, -1.073908, -3.670813, 0.1098039, 1, 0, 1,
-0.5572818, 0.5485966, -1.237225, 0.1058824, 1, 0, 1,
-0.5563334, -1.066855, -2.738265, 0.09803922, 1, 0, 1,
-0.5528699, 0.2321029, -2.254655, 0.09019608, 1, 0, 1,
-0.5458614, -1.002241, -1.86765, 0.08627451, 1, 0, 1,
-0.5411285, 1.635093, 0.6219783, 0.07843138, 1, 0, 1,
-0.5392803, -1.430567, -4.104139, 0.07450981, 1, 0, 1,
-0.5377553, -0.5624901, -3.057789, 0.06666667, 1, 0, 1,
-0.5363765, -0.46659, -2.666292, 0.0627451, 1, 0, 1,
-0.5313198, 1.153462, 0.2659481, 0.05490196, 1, 0, 1,
-0.5284977, 1.790362, 0.4801027, 0.05098039, 1, 0, 1,
-0.5252085, -1.085513, -2.719897, 0.04313726, 1, 0, 1,
-0.5239343, 1.155913, 0.4556103, 0.03921569, 1, 0, 1,
-0.5236228, -0.5461919, -3.514524, 0.03137255, 1, 0, 1,
-0.5214104, -1.2002, -2.031803, 0.02745098, 1, 0, 1,
-0.5198184, -1.481929, -3.136288, 0.01960784, 1, 0, 1,
-0.5189276, -0.1764197, -2.639548, 0.01568628, 1, 0, 1,
-0.5178013, 0.9263353, -2.722206, 0.007843138, 1, 0, 1,
-0.5108038, 1.161276, 0.3485827, 0.003921569, 1, 0, 1,
-0.5091774, -0.3963105, -2.263519, 0, 1, 0.003921569, 1,
-0.5069652, -0.3880109, -3.250011, 0, 1, 0.01176471, 1,
-0.5029402, -0.03063354, 0.3211288, 0, 1, 0.01568628, 1,
-0.4962906, 0.7257836, 0.11991, 0, 1, 0.02352941, 1,
-0.4931322, -3.321388, -3.90076, 0, 1, 0.02745098, 1,
-0.4874649, 0.4694973, -1.252227, 0, 1, 0.03529412, 1,
-0.4833589, 0.06742515, -0.8471293, 0, 1, 0.03921569, 1,
-0.4812638, 0.7933486, -1.586478, 0, 1, 0.04705882, 1,
-0.4774472, -0.2591864, -1.888052, 0, 1, 0.05098039, 1,
-0.4743345, -0.5039667, -2.464982, 0, 1, 0.05882353, 1,
-0.4741481, 2.151962, -0.2345112, 0, 1, 0.0627451, 1,
-0.4738703, -1.769182, -2.74071, 0, 1, 0.07058824, 1,
-0.4723541, -0.8102697, -2.649998, 0, 1, 0.07450981, 1,
-0.4648079, 1.179678, -0.374029, 0, 1, 0.08235294, 1,
-0.4638634, 0.5111605, -0.3668864, 0, 1, 0.08627451, 1,
-0.4626301, -0.8799982, -1.726896, 0, 1, 0.09411765, 1,
-0.4598821, 0.06289582, -1.880781, 0, 1, 0.1019608, 1,
-0.4565165, -1.38244, -2.998677, 0, 1, 0.1058824, 1,
-0.4463944, 0.1479338, -3.635132, 0, 1, 0.1137255, 1,
-0.4456862, 0.148066, -0.1429703, 0, 1, 0.1176471, 1,
-0.4420778, -1.498754, -3.383016, 0, 1, 0.1254902, 1,
-0.4415587, -0.7222117, -3.525246, 0, 1, 0.1294118, 1,
-0.4414787, 1.020692, -0.9853339, 0, 1, 0.1372549, 1,
-0.4414133, 0.4540009, -0.857134, 0, 1, 0.1411765, 1,
-0.4402538, -0.1322039, -1.710398, 0, 1, 0.1490196, 1,
-0.4400812, -0.04397151, -2.191146, 0, 1, 0.1529412, 1,
-0.439125, 0.3523133, -1.8361, 0, 1, 0.1607843, 1,
-0.4374858, -0.3854569, -3.986776, 0, 1, 0.1647059, 1,
-0.4368125, -0.0224768, -1.85112, 0, 1, 0.172549, 1,
-0.4357302, -0.2100381, -2.515038, 0, 1, 0.1764706, 1,
-0.4300525, 0.4116863, -0.2960523, 0, 1, 0.1843137, 1,
-0.4233206, 1.771784, 0.8733252, 0, 1, 0.1882353, 1,
-0.4172799, -0.3782929, -2.286595, 0, 1, 0.1960784, 1,
-0.413748, -0.1769081, -1.644517, 0, 1, 0.2039216, 1,
-0.4104004, 1.147936, -0.9820682, 0, 1, 0.2078431, 1,
-0.4047631, 1.463361, -0.4976901, 0, 1, 0.2156863, 1,
-0.4031171, -0.2096298, -3.325543, 0, 1, 0.2196078, 1,
-0.402807, -0.8306887, -4.802872, 0, 1, 0.227451, 1,
-0.3998245, 2.40537, -1.602525, 0, 1, 0.2313726, 1,
-0.3981217, -0.4625418, -2.460579, 0, 1, 0.2392157, 1,
-0.3974894, -1.259708, -3.033759, 0, 1, 0.2431373, 1,
-0.3966847, 0.3138914, -0.7149788, 0, 1, 0.2509804, 1,
-0.3962975, 0.4438925, -0.3557763, 0, 1, 0.254902, 1,
-0.3927291, 1.140335, -0.3921832, 0, 1, 0.2627451, 1,
-0.3846312, 0.06223885, 0.06834746, 0, 1, 0.2666667, 1,
-0.3824679, -0.0992684, -0.8827419, 0, 1, 0.2745098, 1,
-0.3793431, -0.3997225, -2.627903, 0, 1, 0.2784314, 1,
-0.3790584, 0.3756464, -0.2303896, 0, 1, 0.2862745, 1,
-0.3746802, 0.5123031, -3.541743, 0, 1, 0.2901961, 1,
-0.3736144, -0.9148369, -2.011422, 0, 1, 0.2980392, 1,
-0.3721183, -2.422539, -3.813948, 0, 1, 0.3058824, 1,
-0.3693852, 1.337713, 0.5965697, 0, 1, 0.3098039, 1,
-0.3688267, -0.8010297, -2.57291, 0, 1, 0.3176471, 1,
-0.3636707, -1.64209, -1.991723, 0, 1, 0.3215686, 1,
-0.3611728, -0.06429808, -2.030885, 0, 1, 0.3294118, 1,
-0.3590803, 1.416763, 0.1771172, 0, 1, 0.3333333, 1,
-0.3576089, 0.2515785, 0.2344226, 0, 1, 0.3411765, 1,
-0.3537124, 0.4815443, 0.03166301, 0, 1, 0.345098, 1,
-0.3533323, 0.4929543, -0.4494508, 0, 1, 0.3529412, 1,
-0.3521947, -0.7302033, -2.580245, 0, 1, 0.3568628, 1,
-0.349878, -0.3667886, -3.054024, 0, 1, 0.3647059, 1,
-0.3489432, 0.4731688, -1.491396, 0, 1, 0.3686275, 1,
-0.3477717, -0.05435346, -1.530363, 0, 1, 0.3764706, 1,
-0.3453313, 0.2398441, -1.783036, 0, 1, 0.3803922, 1,
-0.3439667, 1.387045, -0.1632905, 0, 1, 0.3882353, 1,
-0.339548, 1.310561, 0.07257716, 0, 1, 0.3921569, 1,
-0.3366948, 0.7540511, -1.491822, 0, 1, 0.4, 1,
-0.3331849, 1.01276, -0.6311337, 0, 1, 0.4078431, 1,
-0.3316986, -0.3031743, -2.803966, 0, 1, 0.4117647, 1,
-0.3295724, -0.2590488, -2.195693, 0, 1, 0.4196078, 1,
-0.3223001, 1.105146, 0.9242339, 0, 1, 0.4235294, 1,
-0.3161573, 0.4328515, -0.07083845, 0, 1, 0.4313726, 1,
-0.3128276, 0.1996273, 0.2570828, 0, 1, 0.4352941, 1,
-0.311226, -0.6358623, -2.710696, 0, 1, 0.4431373, 1,
-0.3096414, -1.858832, -3.076873, 0, 1, 0.4470588, 1,
-0.305889, 1.702865, -2.305562, 0, 1, 0.454902, 1,
-0.3017552, -0.3706899, -2.972728, 0, 1, 0.4588235, 1,
-0.2996143, 0.3548593, -2.222126, 0, 1, 0.4666667, 1,
-0.2935024, 0.8384527, -0.6814175, 0, 1, 0.4705882, 1,
-0.286963, 0.1332586, 0.155669, 0, 1, 0.4784314, 1,
-0.2867385, 0.9687265, -0.09810343, 0, 1, 0.4823529, 1,
-0.2855858, 1.491802, -0.004782548, 0, 1, 0.4901961, 1,
-0.2848012, -0.3280493, -3.095758, 0, 1, 0.4941176, 1,
-0.2845695, -0.6200293, -2.781855, 0, 1, 0.5019608, 1,
-0.281762, -1.472874, -3.150209, 0, 1, 0.509804, 1,
-0.278247, -0.4670606, -2.57671, 0, 1, 0.5137255, 1,
-0.2760414, -1.116981, -4.426536, 0, 1, 0.5215687, 1,
-0.2725669, 0.1415583, -1.777457, 0, 1, 0.5254902, 1,
-0.2706319, -0.8642623, -4.012926, 0, 1, 0.5333334, 1,
-0.2698739, -0.7748268, -5.275057, 0, 1, 0.5372549, 1,
-0.2612384, -1.041362, -3.633712, 0, 1, 0.5450981, 1,
-0.2605808, 1.679187, 1.004548, 0, 1, 0.5490196, 1,
-0.2576939, -2.544876, -4.847591, 0, 1, 0.5568628, 1,
-0.2567287, -0.03720666, -2.645516, 0, 1, 0.5607843, 1,
-0.2565335, -1.756144, -3.035702, 0, 1, 0.5686275, 1,
-0.252553, 1.048385, 0.02289505, 0, 1, 0.572549, 1,
-0.2487192, 0.016031, -1.589033, 0, 1, 0.5803922, 1,
-0.2416365, -0.5532489, -2.536619, 0, 1, 0.5843138, 1,
-0.2402366, -0.9143867, -2.487338, 0, 1, 0.5921569, 1,
-0.2365142, 0.2992161, -1.494369, 0, 1, 0.5960785, 1,
-0.2320039, 0.5596138, -1.114874, 0, 1, 0.6039216, 1,
-0.2307749, -0.5891941, -2.806746, 0, 1, 0.6117647, 1,
-0.2291527, 0.2720571, 0.465846, 0, 1, 0.6156863, 1,
-0.2283858, -1.467931, -4.632301, 0, 1, 0.6235294, 1,
-0.2267413, -0.3537843, -2.43245, 0, 1, 0.627451, 1,
-0.2265317, -1.624887, -2.552397, 0, 1, 0.6352941, 1,
-0.220082, 1.996507, -0.5088484, 0, 1, 0.6392157, 1,
-0.2079713, -2.235204, -1.028379, 0, 1, 0.6470588, 1,
-0.1976732, 0.4888578, 1.418535, 0, 1, 0.6509804, 1,
-0.1908805, 0.2809877, -0.3220316, 0, 1, 0.6588235, 1,
-0.186609, 1.021616, -1.164938, 0, 1, 0.6627451, 1,
-0.1860404, -0.8052918, -3.723615, 0, 1, 0.6705883, 1,
-0.1855532, 1.147402, 0.4413635, 0, 1, 0.6745098, 1,
-0.1848745, -0.6378771, -1.949411, 0, 1, 0.682353, 1,
-0.1750686, 0.8880929, 0.7990004, 0, 1, 0.6862745, 1,
-0.1739826, 0.7048077, -2.177946, 0, 1, 0.6941177, 1,
-0.173862, 2.194979, -0.9996439, 0, 1, 0.7019608, 1,
-0.1734555, 0.123283, -0.6977671, 0, 1, 0.7058824, 1,
-0.1726099, -2.030574, -2.219416, 0, 1, 0.7137255, 1,
-0.1684103, -0.1509833, -0.4617748, 0, 1, 0.7176471, 1,
-0.1662126, -0.4396704, -4.956851, 0, 1, 0.7254902, 1,
-0.1555021, -0.37939, -3.899921, 0, 1, 0.7294118, 1,
-0.1491091, 1.359152, -0.04332147, 0, 1, 0.7372549, 1,
-0.1435975, 1.307376, -0.9587516, 0, 1, 0.7411765, 1,
-0.1432279, -0.7665225, -2.86061, 0, 1, 0.7490196, 1,
-0.1426996, 1.647306, -0.4826176, 0, 1, 0.7529412, 1,
-0.1402794, -0.1638438, -1.238965, 0, 1, 0.7607843, 1,
-0.1400514, -1.356302, -3.932294, 0, 1, 0.7647059, 1,
-0.1396966, 0.6291679, -0.7500864, 0, 1, 0.772549, 1,
-0.1360755, -0.005996042, -1.467872, 0, 1, 0.7764706, 1,
-0.1359452, 0.6700368, -0.9103281, 0, 1, 0.7843137, 1,
-0.1330203, 0.05202542, -0.2044605, 0, 1, 0.7882353, 1,
-0.1311522, 0.4390335, -0.3755913, 0, 1, 0.7960784, 1,
-0.1298534, -1.329164, -3.177495, 0, 1, 0.8039216, 1,
-0.124122, 0.1816154, 0.2248051, 0, 1, 0.8078431, 1,
-0.1236766, -0.2822393, -3.111409, 0, 1, 0.8156863, 1,
-0.1218993, -0.2401096, -2.146279, 0, 1, 0.8196079, 1,
-0.1100326, 0.06986816, -1.615891, 0, 1, 0.827451, 1,
-0.1093887, 0.8741466, 0.152971, 0, 1, 0.8313726, 1,
-0.104987, 1.929024, -0.6152415, 0, 1, 0.8392157, 1,
-0.1049057, -1.704427, -2.844265, 0, 1, 0.8431373, 1,
-0.09740423, 2.002856, 0.7889165, 0, 1, 0.8509804, 1,
-0.09327669, -1.36041, -1.97132, 0, 1, 0.854902, 1,
-0.09161328, 2.168702, 0.7193071, 0, 1, 0.8627451, 1,
-0.0890187, 1.095862, -0.3167831, 0, 1, 0.8666667, 1,
-0.0869661, -0.6186151, -2.44954, 0, 1, 0.8745098, 1,
-0.08516836, 0.7162849, -0.0003571482, 0, 1, 0.8784314, 1,
-0.08135863, -0.3200435, -3.652875, 0, 1, 0.8862745, 1,
-0.08014072, 0.7673465, -0.8248795, 0, 1, 0.8901961, 1,
-0.07785346, -0.8721356, -3.008142, 0, 1, 0.8980392, 1,
-0.07664587, -0.2919323, -3.932944, 0, 1, 0.9058824, 1,
-0.07416008, -0.8858364, -4.33606, 0, 1, 0.9098039, 1,
-0.07347526, -0.4845516, -2.776123, 0, 1, 0.9176471, 1,
-0.07182527, -0.0907563, -1.817274, 0, 1, 0.9215686, 1,
-0.07130003, -1.001195, -2.507367, 0, 1, 0.9294118, 1,
-0.06877167, 0.4113731, -0.9390618, 0, 1, 0.9333333, 1,
-0.06385276, 0.7968328, 0.4333894, 0, 1, 0.9411765, 1,
-0.06110143, -0.7492027, -1.364063, 0, 1, 0.945098, 1,
-0.05854685, 0.7385151, 0.03947942, 0, 1, 0.9529412, 1,
-0.05405739, -2.034782, -3.93942, 0, 1, 0.9568627, 1,
-0.05337326, -0.3404959, -2.68787, 0, 1, 0.9647059, 1,
-0.05176328, -0.8195411, -1.032275, 0, 1, 0.9686275, 1,
-0.05108662, 0.4250371, -1.580021, 0, 1, 0.9764706, 1,
-0.04998338, 0.7733389, -0.9773851, 0, 1, 0.9803922, 1,
-0.04153169, 0.3153908, 1.668923, 0, 1, 0.9882353, 1,
-0.04102039, -1.888816, -1.436908, 0, 1, 0.9921569, 1,
-0.03867792, 1.528156, 0.3368849, 0, 1, 1, 1,
-0.03220437, 0.3772927, -1.966857, 0, 0.9921569, 1, 1,
-0.0282709, 0.06085128, 0.4421759, 0, 0.9882353, 1, 1,
-0.02729418, 1.076043, -0.03804632, 0, 0.9803922, 1, 1,
-0.02588031, 0.2675353, 0.3623753, 0, 0.9764706, 1, 1,
-0.02568859, 3.570951, -0.3777291, 0, 0.9686275, 1, 1,
-0.02517772, -1.310024, -1.301314, 0, 0.9647059, 1, 1,
-0.02489493, 0.1016221, 0.7231986, 0, 0.9568627, 1, 1,
-0.02200989, 1.25676, 1.775634, 0, 0.9529412, 1, 1,
-0.0191107, 0.9487966, 1.154854, 0, 0.945098, 1, 1,
-0.01776191, -0.3789144, -0.9148331, 0, 0.9411765, 1, 1,
-0.01739047, -0.03275306, -1.557999, 0, 0.9333333, 1, 1,
-0.01737499, 1.362915, 0.64935, 0, 0.9294118, 1, 1,
-0.01043745, 0.2398013, -0.821974, 0, 0.9215686, 1, 1,
-0.001897594, 0.6500213, -0.2053098, 0, 0.9176471, 1, 1,
-0.001541971, 1.38311, 0.6855474, 0, 0.9098039, 1, 1,
0.002286683, 0.266334, 1.005602, 0, 0.9058824, 1, 1,
0.004795203, 0.2295262, 1.181062, 0, 0.8980392, 1, 1,
0.01006877, 1.330438, -0.6140957, 0, 0.8901961, 1, 1,
0.01113315, -1.281936, 3.530772, 0, 0.8862745, 1, 1,
0.012294, -2.083519, 1.685174, 0, 0.8784314, 1, 1,
0.01433457, -1.754974, 4.875228, 0, 0.8745098, 1, 1,
0.01962052, -1.904849, 2.469859, 0, 0.8666667, 1, 1,
0.01977651, 0.004840654, 1.818424, 0, 0.8627451, 1, 1,
0.01992361, -0.1246348, 1.490193, 0, 0.854902, 1, 1,
0.02154034, -1.138888, 0.7066087, 0, 0.8509804, 1, 1,
0.02290177, -1.392394, 3.774664, 0, 0.8431373, 1, 1,
0.02513887, 1.056326, -0.7889683, 0, 0.8392157, 1, 1,
0.02859179, 0.2666247, 0.05336479, 0, 0.8313726, 1, 1,
0.02891373, -0.1557169, 1.730651, 0, 0.827451, 1, 1,
0.03002087, -1.175721, 3.5746, 0, 0.8196079, 1, 1,
0.03028988, 0.1973433, -0.6554241, 0, 0.8156863, 1, 1,
0.03300751, 0.3596548, -1.581128, 0, 0.8078431, 1, 1,
0.03591315, 0.54303, 0.05449802, 0, 0.8039216, 1, 1,
0.04088535, 0.02891484, 1.748051, 0, 0.7960784, 1, 1,
0.04674457, -0.9538917, 2.266713, 0, 0.7882353, 1, 1,
0.04967468, -1.099718, 3.007694, 0, 0.7843137, 1, 1,
0.05106797, 1.037428, 1.003909, 0, 0.7764706, 1, 1,
0.06228518, -0.4972724, 4.957618, 0, 0.772549, 1, 1,
0.06317282, 0.07321006, 1.495558, 0, 0.7647059, 1, 1,
0.06362139, -2.362864, 2.748332, 0, 0.7607843, 1, 1,
0.06561982, -0.6745692, 4.26797, 0, 0.7529412, 1, 1,
0.06828531, -0.7704811, 2.584882, 0, 0.7490196, 1, 1,
0.06840315, -0.272266, 3.596985, 0, 0.7411765, 1, 1,
0.07024887, -0.268849, 3.468619, 0, 0.7372549, 1, 1,
0.0712904, 0.4590532, 0.005803036, 0, 0.7294118, 1, 1,
0.08270414, -0.4989859, 1.450421, 0, 0.7254902, 1, 1,
0.08728012, 1.067578, -0.1445231, 0, 0.7176471, 1, 1,
0.09231634, -0.01611765, 2.157455, 0, 0.7137255, 1, 1,
0.09845933, 0.9907803, 2.008033, 0, 0.7058824, 1, 1,
0.09915084, 2.425318, 1.778157, 0, 0.6980392, 1, 1,
0.1002891, -0.6678715, 3.454124, 0, 0.6941177, 1, 1,
0.1032362, -0.1767669, 2.943834, 0, 0.6862745, 1, 1,
0.1064019, -0.09438713, 2.404101, 0, 0.682353, 1, 1,
0.1067282, -0.6195182, 3.866148, 0, 0.6745098, 1, 1,
0.1068307, 0.7160605, -0.06383546, 0, 0.6705883, 1, 1,
0.1095616, -1.146646, 3.819931, 0, 0.6627451, 1, 1,
0.1124063, -0.9306617, 1.659008, 0, 0.6588235, 1, 1,
0.1251204, -0.04189659, 1.062438, 0, 0.6509804, 1, 1,
0.1298271, 2.212602, -0.03200381, 0, 0.6470588, 1, 1,
0.1302908, -1.049269, 3.643284, 0, 0.6392157, 1, 1,
0.1309495, 0.0283756, 2.369466, 0, 0.6352941, 1, 1,
0.1311487, -0.9349577, 2.839681, 0, 0.627451, 1, 1,
0.131609, 0.114447, 0.6418094, 0, 0.6235294, 1, 1,
0.132084, 0.9565561, 0.9662937, 0, 0.6156863, 1, 1,
0.1340254, 0.8379704, -0.5727872, 0, 0.6117647, 1, 1,
0.1345537, 0.5617127, -0.1740856, 0, 0.6039216, 1, 1,
0.1346887, 0.8520219, -0.3358722, 0, 0.5960785, 1, 1,
0.1347809, -0.1990506, 2.112546, 0, 0.5921569, 1, 1,
0.1372091, 0.8236007, -0.4970014, 0, 0.5843138, 1, 1,
0.1383227, 2.489001, 2.011545, 0, 0.5803922, 1, 1,
0.1384939, 0.7266029, -1.325841, 0, 0.572549, 1, 1,
0.1394797, -0.462189, 2.713639, 0, 0.5686275, 1, 1,
0.1411025, 0.6474542, -1.824793, 0, 0.5607843, 1, 1,
0.1418138, -2.192229, 3.805979, 0, 0.5568628, 1, 1,
0.1428154, 0.5987738, 0.4884825, 0, 0.5490196, 1, 1,
0.1463907, -1.084409, 2.697041, 0, 0.5450981, 1, 1,
0.1515705, -0.1582133, 1.324461, 0, 0.5372549, 1, 1,
0.1525549, -0.2606477, 2.805807, 0, 0.5333334, 1, 1,
0.1532028, -1.701896, 3.60518, 0, 0.5254902, 1, 1,
0.1546803, 0.380747, 0.2636594, 0, 0.5215687, 1, 1,
0.1553118, -1.095709, 2.619018, 0, 0.5137255, 1, 1,
0.1659627, 1.070661, -0.9851108, 0, 0.509804, 1, 1,
0.1690377, 2.030259, 1.797843, 0, 0.5019608, 1, 1,
0.1813015, -0.07703633, 3.23823, 0, 0.4941176, 1, 1,
0.1821391, -0.3230314, 3.075251, 0, 0.4901961, 1, 1,
0.1846658, 0.3931617, -0.585499, 0, 0.4823529, 1, 1,
0.1857429, -0.7826605, 3.627233, 0, 0.4784314, 1, 1,
0.1905171, 1.117076, 1.10081, 0, 0.4705882, 1, 1,
0.1909548, -1.33328, 4.552433, 0, 0.4666667, 1, 1,
0.1912914, 0.6322961, 0.5495403, 0, 0.4588235, 1, 1,
0.1916278, -1.313943, 2.759794, 0, 0.454902, 1, 1,
0.1925171, 0.778, -0.4440971, 0, 0.4470588, 1, 1,
0.1939074, -0.006044643, 0.1975426, 0, 0.4431373, 1, 1,
0.1940901, 1.71274, -0.3728685, 0, 0.4352941, 1, 1,
0.1945482, -2.018957, 1.889164, 0, 0.4313726, 1, 1,
0.19695, -1.246414, 2.723968, 0, 0.4235294, 1, 1,
0.1973498, -1.067759, 3.017628, 0, 0.4196078, 1, 1,
0.1982353, 0.8270048, -0.1993588, 0, 0.4117647, 1, 1,
0.1995499, 1.17965, -0.5983388, 0, 0.4078431, 1, 1,
0.2001686, 0.2750519, 1.631621, 0, 0.4, 1, 1,
0.2004798, 0.07304671, 1.124568, 0, 0.3921569, 1, 1,
0.2047833, 1.493734, 0.8666384, 0, 0.3882353, 1, 1,
0.2051634, 0.0354912, 1.624861, 0, 0.3803922, 1, 1,
0.2060333, -0.2936267, 2.514413, 0, 0.3764706, 1, 1,
0.2081141, 1.449482, 1.054194, 0, 0.3686275, 1, 1,
0.2122326, -0.8296185, 3.180616, 0, 0.3647059, 1, 1,
0.2163371, 2.015766, 1.706376, 0, 0.3568628, 1, 1,
0.2166078, 0.8370578, -1.006649, 0, 0.3529412, 1, 1,
0.2218165, 0.02690377, 3.53113, 0, 0.345098, 1, 1,
0.2235175, 2.106772, 1.450984, 0, 0.3411765, 1, 1,
0.2255504, 0.652873, 0.8337524, 0, 0.3333333, 1, 1,
0.2298422, 1.456884, -1.445407, 0, 0.3294118, 1, 1,
0.2319665, 1.623578, 1.899929, 0, 0.3215686, 1, 1,
0.2372162, -1.464728, 3.348485, 0, 0.3176471, 1, 1,
0.239087, -1.9545, 2.67092, 0, 0.3098039, 1, 1,
0.2400208, -0.2340441, 3.739031, 0, 0.3058824, 1, 1,
0.2414239, -0.750664, 4.265631, 0, 0.2980392, 1, 1,
0.242724, -0.4722514, 3.981445, 0, 0.2901961, 1, 1,
0.244372, -0.6380861, 2.976592, 0, 0.2862745, 1, 1,
0.2488939, 0.813172, -1.0552, 0, 0.2784314, 1, 1,
0.2521493, -0.4816157, 3.361251, 0, 0.2745098, 1, 1,
0.2532443, -2.164131, 3.360708, 0, 0.2666667, 1, 1,
0.2540608, 0.08828753, 2.15835, 0, 0.2627451, 1, 1,
0.2595513, -2.654444, 1.579175, 0, 0.254902, 1, 1,
0.2626546, 0.1788143, 1.924406, 0, 0.2509804, 1, 1,
0.2698116, 0.9430562, 0.9930857, 0, 0.2431373, 1, 1,
0.2724468, -2.39838, 4.09937, 0, 0.2392157, 1, 1,
0.2732896, 2.008519, -0.2671704, 0, 0.2313726, 1, 1,
0.2776574, -0.3600725, 1.844135, 0, 0.227451, 1, 1,
0.2820821, -0.3520387, 2.901838, 0, 0.2196078, 1, 1,
0.2823507, -2.388762, 1.359636, 0, 0.2156863, 1, 1,
0.2860609, -0.8014464, 2.533097, 0, 0.2078431, 1, 1,
0.2891059, -0.2275692, 1.924233, 0, 0.2039216, 1, 1,
0.2938732, -0.2347754, 1.576014, 0, 0.1960784, 1, 1,
0.2971025, 0.3825315, 1.024597, 0, 0.1882353, 1, 1,
0.2975195, 1.357074, 0.05048895, 0, 0.1843137, 1, 1,
0.2981441, -1.685807, 3.785646, 0, 0.1764706, 1, 1,
0.3067754, 1.029832, -0.3777935, 0, 0.172549, 1, 1,
0.3088976, 0.3707451, -0.08927173, 0, 0.1647059, 1, 1,
0.3095737, 1.004272, 0.3606562, 0, 0.1607843, 1, 1,
0.3133618, -0.2619398, 1.023562, 0, 0.1529412, 1, 1,
0.3152808, -0.4426708, 2.402192, 0, 0.1490196, 1, 1,
0.3155055, -0.097573, 1.193939, 0, 0.1411765, 1, 1,
0.3155107, -0.2898374, 2.936424, 0, 0.1372549, 1, 1,
0.3303643, -0.6304263, 2.260604, 0, 0.1294118, 1, 1,
0.3324663, 0.09048152, 1.795775, 0, 0.1254902, 1, 1,
0.332986, 1.256813, 1.741991, 0, 0.1176471, 1, 1,
0.3364067, -0.7407497, 3.581477, 0, 0.1137255, 1, 1,
0.3397492, -0.7407983, 2.507484, 0, 0.1058824, 1, 1,
0.3412972, 1.4975, 0.2750311, 0, 0.09803922, 1, 1,
0.342824, 0.7732682, -0.578752, 0, 0.09411765, 1, 1,
0.343618, 1.425734, -0.5120077, 0, 0.08627451, 1, 1,
0.3457298, -0.4148665, 3.309584, 0, 0.08235294, 1, 1,
0.3477749, 0.9798029, 1.144797, 0, 0.07450981, 1, 1,
0.3495263, -0.5554683, 3.436705, 0, 0.07058824, 1, 1,
0.3497372, -0.8593673, 3.859969, 0, 0.0627451, 1, 1,
0.3517044, -1.799225, 3.04906, 0, 0.05882353, 1, 1,
0.3528937, 2.225676, -1.430191, 0, 0.05098039, 1, 1,
0.3570137, 1.626858, 2.152534, 0, 0.04705882, 1, 1,
0.3601688, 2.298134, -0.2381021, 0, 0.03921569, 1, 1,
0.3604272, 0.5749285, 1.274074, 0, 0.03529412, 1, 1,
0.3642248, -0.2740453, 3.331008, 0, 0.02745098, 1, 1,
0.3642597, 0.1543154, 2.433732, 0, 0.02352941, 1, 1,
0.3651497, 0.1470785, 0.4203534, 0, 0.01568628, 1, 1,
0.3659074, 0.6141645, -0.06411715, 0, 0.01176471, 1, 1,
0.3687587, -2.335154, 4.721173, 0, 0.003921569, 1, 1,
0.3724948, -1.443814, 2.454268, 0.003921569, 0, 1, 1,
0.3734231, 1.300743, 1.786883, 0.007843138, 0, 1, 1,
0.3746931, 1.39492, -0.05919946, 0.01568628, 0, 1, 1,
0.3763934, -0.7633534, 3.036186, 0.01960784, 0, 1, 1,
0.3770452, -0.07275774, 1.913023, 0.02745098, 0, 1, 1,
0.3788513, 0.2430134, 1.502477, 0.03137255, 0, 1, 1,
0.3794188, 0.7364453, 1.00593, 0.03921569, 0, 1, 1,
0.3799455, -0.2995674, 1.875245, 0.04313726, 0, 1, 1,
0.3840698, -0.2956651, 2.508389, 0.05098039, 0, 1, 1,
0.3906048, 0.4513625, 0.9823872, 0.05490196, 0, 1, 1,
0.3921595, 0.5913938, 2.819878, 0.0627451, 0, 1, 1,
0.393087, -1.049929, 0.5709789, 0.06666667, 0, 1, 1,
0.3957459, -1.720556, 1.394281, 0.07450981, 0, 1, 1,
0.3960455, 2.164717, -0.4660918, 0.07843138, 0, 1, 1,
0.3962543, -1.1444, 3.555521, 0.08627451, 0, 1, 1,
0.3972701, 2.436431, -0.9162927, 0.09019608, 0, 1, 1,
0.3989292, 0.2108689, -1.07564, 0.09803922, 0, 1, 1,
0.400979, 0.2393774, 2.367194, 0.1058824, 0, 1, 1,
0.4017208, 1.764033, 0.7155375, 0.1098039, 0, 1, 1,
0.4084295, 1.218089, -1.403247, 0.1176471, 0, 1, 1,
0.4108516, -0.7861177, 2.35369, 0.1215686, 0, 1, 1,
0.4124985, 1.802775, 0.8673676, 0.1294118, 0, 1, 1,
0.414097, 0.3928581, 0.08859329, 0.1333333, 0, 1, 1,
0.4155041, -0.3655319, 3.58411, 0.1411765, 0, 1, 1,
0.4178716, 0.2831145, 0.3442786, 0.145098, 0, 1, 1,
0.4182392, -1.00531, 3.811687, 0.1529412, 0, 1, 1,
0.4218119, -0.6190663, 2.370566, 0.1568628, 0, 1, 1,
0.4221984, 0.8632733, 1.545129, 0.1647059, 0, 1, 1,
0.4250246, 0.145166, 2.839701, 0.1686275, 0, 1, 1,
0.426476, -0.05929826, 3.104325, 0.1764706, 0, 1, 1,
0.4300077, -0.5972162, 2.638745, 0.1803922, 0, 1, 1,
0.4303364, 0.2777254, 1.22728, 0.1882353, 0, 1, 1,
0.4304981, -1.750589, 0.9150075, 0.1921569, 0, 1, 1,
0.4314035, 0.814972, 0.8418689, 0.2, 0, 1, 1,
0.4382881, -1.106528, 3.531631, 0.2078431, 0, 1, 1,
0.4434902, 0.5151962, 2.35153, 0.2117647, 0, 1, 1,
0.444094, -1.246808, 3.160769, 0.2196078, 0, 1, 1,
0.4463919, -0.6269507, 4.685842, 0.2235294, 0, 1, 1,
0.4472659, 0.07699709, -0.803394, 0.2313726, 0, 1, 1,
0.4526167, -1.419947, 3.445026, 0.2352941, 0, 1, 1,
0.4528531, 0.008233205, 0.4919201, 0.2431373, 0, 1, 1,
0.4586824, 0.4148685, 0.152862, 0.2470588, 0, 1, 1,
0.4611018, 1.030746, 0.1315059, 0.254902, 0, 1, 1,
0.4690034, -0.4451564, 1.851119, 0.2588235, 0, 1, 1,
0.4736746, -0.2076182, 1.103367, 0.2666667, 0, 1, 1,
0.4762257, -0.3427756, 3.014236, 0.2705882, 0, 1, 1,
0.4775507, 1.404527, -1.401941, 0.2784314, 0, 1, 1,
0.4830309, -0.9689407, 0.3110065, 0.282353, 0, 1, 1,
0.4830486, -1.740772, 2.553344, 0.2901961, 0, 1, 1,
0.4837464, 1.198999, 1.981245, 0.2941177, 0, 1, 1,
0.4881023, -0.1744191, 2.306444, 0.3019608, 0, 1, 1,
0.4903996, -0.08264734, 2.548908, 0.3098039, 0, 1, 1,
0.4964263, 0.6842655, -0.3156102, 0.3137255, 0, 1, 1,
0.4999947, -0.7644457, 3.383373, 0.3215686, 0, 1, 1,
0.5000773, -1.469265, 3.232257, 0.3254902, 0, 1, 1,
0.5141845, -0.03424362, 2.927187, 0.3333333, 0, 1, 1,
0.5183176, 0.9356713, 1.74306, 0.3372549, 0, 1, 1,
0.5213528, -0.1072579, 1.627985, 0.345098, 0, 1, 1,
0.5221776, 1.360772, -0.2906925, 0.3490196, 0, 1, 1,
0.5283558, 0.4674974, 0.2319097, 0.3568628, 0, 1, 1,
0.5292898, -1.508717, 3.874519, 0.3607843, 0, 1, 1,
0.5374312, 1.899346, 0.3353258, 0.3686275, 0, 1, 1,
0.5394043, 1.297417, -0.7582267, 0.372549, 0, 1, 1,
0.539659, -0.8632424, 2.217108, 0.3803922, 0, 1, 1,
0.5407392, -1.157977, 1.780865, 0.3843137, 0, 1, 1,
0.5420737, -0.6204553, 3.482157, 0.3921569, 0, 1, 1,
0.5432484, 2.649469, -0.3637435, 0.3960784, 0, 1, 1,
0.5502243, -0.1974505, 1.707463, 0.4039216, 0, 1, 1,
0.550718, -1.300086, 2.742935, 0.4117647, 0, 1, 1,
0.5557164, -2.275731, 2.974894, 0.4156863, 0, 1, 1,
0.5570408, -0.8257366, 2.074748, 0.4235294, 0, 1, 1,
0.5573239, -0.7433785, 0.9619285, 0.427451, 0, 1, 1,
0.5590776, 0.5190983, 1.191509, 0.4352941, 0, 1, 1,
0.5593566, 0.6680432, 2.173288, 0.4392157, 0, 1, 1,
0.5622622, -1.008955, 2.707411, 0.4470588, 0, 1, 1,
0.5645392, -0.2954647, 3.114403, 0.4509804, 0, 1, 1,
0.5661955, 0.3410716, 1.907559, 0.4588235, 0, 1, 1,
0.5850458, 0.6088504, 1.647489, 0.4627451, 0, 1, 1,
0.5880778, -1.389043, 2.403794, 0.4705882, 0, 1, 1,
0.5881554, -0.2674552, 4.063745, 0.4745098, 0, 1, 1,
0.5900764, -0.2425558, 1.642734, 0.4823529, 0, 1, 1,
0.5967854, 0.9083316, -0.7696244, 0.4862745, 0, 1, 1,
0.5976515, -0.5804715, 0.8539276, 0.4941176, 0, 1, 1,
0.6011176, 0.4081165, 0.2629992, 0.5019608, 0, 1, 1,
0.6027305, -1.82225, 4.138628, 0.5058824, 0, 1, 1,
0.605218, 2.123331, 1.516536, 0.5137255, 0, 1, 1,
0.605399, -1.97267, 1.671094, 0.5176471, 0, 1, 1,
0.6069663, -1.79998, 3.851767, 0.5254902, 0, 1, 1,
0.6076961, -1.140977, 2.542768, 0.5294118, 0, 1, 1,
0.6123915, -0.4617342, 2.110713, 0.5372549, 0, 1, 1,
0.6209298, 1.33872, 0.263575, 0.5411765, 0, 1, 1,
0.6223625, -1.365356, 3.608361, 0.5490196, 0, 1, 1,
0.6263035, -0.5584748, 1.952841, 0.5529412, 0, 1, 1,
0.6318091, -0.7818754, 3.299559, 0.5607843, 0, 1, 1,
0.6342189, 0.06222833, -0.9973163, 0.5647059, 0, 1, 1,
0.6347121, -0.3037397, 1.655733, 0.572549, 0, 1, 1,
0.6373619, -0.7052051, 2.491056, 0.5764706, 0, 1, 1,
0.6394493, -0.769908, 1.852929, 0.5843138, 0, 1, 1,
0.6450168, -0.06760378, 0.6912516, 0.5882353, 0, 1, 1,
0.6477034, -0.3562631, 2.011084, 0.5960785, 0, 1, 1,
0.6498774, -0.5654417, 0.6521078, 0.6039216, 0, 1, 1,
0.6517944, 1.135361, 0.8443736, 0.6078432, 0, 1, 1,
0.6520602, 0.1554407, 2.279319, 0.6156863, 0, 1, 1,
0.6550161, -1.157395, 1.699788, 0.6196079, 0, 1, 1,
0.6590914, 0.04251151, 1.242774, 0.627451, 0, 1, 1,
0.6631992, -0.009561947, 0.6109771, 0.6313726, 0, 1, 1,
0.6661826, -0.425565, 1.822231, 0.6392157, 0, 1, 1,
0.6682281, 0.3258053, 1.979925, 0.6431373, 0, 1, 1,
0.6706876, 1.858, 2.44374, 0.6509804, 0, 1, 1,
0.6727378, -0.4650327, 1.025983, 0.654902, 0, 1, 1,
0.6759155, 0.0452272, 1.648099, 0.6627451, 0, 1, 1,
0.6767924, -0.4249098, 0.4966263, 0.6666667, 0, 1, 1,
0.6786134, -0.6765691, 1.813603, 0.6745098, 0, 1, 1,
0.6796353, 0.9315969, 2.163578, 0.6784314, 0, 1, 1,
0.6821661, -1.22728, 2.542494, 0.6862745, 0, 1, 1,
0.6865625, 0.1454151, 1.491111, 0.6901961, 0, 1, 1,
0.690114, -1.689096, 1.535075, 0.6980392, 0, 1, 1,
0.6934229, -0.01394557, 2.225867, 0.7058824, 0, 1, 1,
0.6947737, 0.3635213, 1.120049, 0.7098039, 0, 1, 1,
0.6983497, -0.4426224, 3.215821, 0.7176471, 0, 1, 1,
0.7053465, -0.1829961, 1.724319, 0.7215686, 0, 1, 1,
0.7174269, -1.406632, 2.393442, 0.7294118, 0, 1, 1,
0.7210531, 0.5031981, 0.2838027, 0.7333333, 0, 1, 1,
0.7261283, -1.13666, 1.572519, 0.7411765, 0, 1, 1,
0.7339098, -0.6734405, 0.3887214, 0.7450981, 0, 1, 1,
0.7534118, 0.4906635, 1.172188, 0.7529412, 0, 1, 1,
0.7578379, -1.557712, 3.962895, 0.7568628, 0, 1, 1,
0.7602841, -0.3125148, 0.7536319, 0.7647059, 0, 1, 1,
0.7604048, 1.009768, 1.854286, 0.7686275, 0, 1, 1,
0.762076, -0.7144214, 1.870937, 0.7764706, 0, 1, 1,
0.764139, -0.05244668, 1.796411, 0.7803922, 0, 1, 1,
0.7696161, -0.7200974, 2.278798, 0.7882353, 0, 1, 1,
0.7829788, 0.04890621, 1.391428, 0.7921569, 0, 1, 1,
0.7867262, -1.143457, 2.380021, 0.8, 0, 1, 1,
0.7867637, 2.173711, -0.2728429, 0.8078431, 0, 1, 1,
0.7892382, -0.1870285, 1.976477, 0.8117647, 0, 1, 1,
0.7919364, 0.2706368, 2.495595, 0.8196079, 0, 1, 1,
0.797215, -2.450691, 3.318725, 0.8235294, 0, 1, 1,
0.8011015, 0.5775147, 1.7668, 0.8313726, 0, 1, 1,
0.8042488, -2.090933, 2.804773, 0.8352941, 0, 1, 1,
0.8078716, -0.351822, 1.918466, 0.8431373, 0, 1, 1,
0.8083272, -0.9622265, 2.388482, 0.8470588, 0, 1, 1,
0.8214138, 0.8398607, -1.641341, 0.854902, 0, 1, 1,
0.8237063, -0.696431, 0.1699387, 0.8588235, 0, 1, 1,
0.8250966, 1.178371, 0.4967077, 0.8666667, 0, 1, 1,
0.8326361, -0.7316912, 3.092947, 0.8705882, 0, 1, 1,
0.8327646, -0.7861035, 1.57066, 0.8784314, 0, 1, 1,
0.8334194, -0.5661001, 1.372859, 0.8823529, 0, 1, 1,
0.8344162, -1.940904, 0.625527, 0.8901961, 0, 1, 1,
0.8400296, 0.0375246, 1.671152, 0.8941177, 0, 1, 1,
0.8488584, 0.1069897, 1.462219, 0.9019608, 0, 1, 1,
0.8561233, 0.8199767, -0.0726207, 0.9098039, 0, 1, 1,
0.8622262, 0.3665511, 0.8101631, 0.9137255, 0, 1, 1,
0.8623293, -0.5439662, 3.336145, 0.9215686, 0, 1, 1,
0.8713241, -0.7071882, 3.583572, 0.9254902, 0, 1, 1,
0.8726049, 0.6058941, -0.1113029, 0.9333333, 0, 1, 1,
0.8757522, -1.281976, 3.632615, 0.9372549, 0, 1, 1,
0.8779301, 0.5153066, 0.7983158, 0.945098, 0, 1, 1,
0.8779603, 2.457511, -0.1753765, 0.9490196, 0, 1, 1,
0.8797602, -2.269045, 2.261021, 0.9568627, 0, 1, 1,
0.8863249, -0.3176752, 1.241206, 0.9607843, 0, 1, 1,
0.8915006, -0.4798301, 0.9609258, 0.9686275, 0, 1, 1,
0.8930033, -2.078855, 1.287104, 0.972549, 0, 1, 1,
0.8933013, 1.25542, 1.85344, 0.9803922, 0, 1, 1,
0.8981355, 0.2631987, 1.594084, 0.9843137, 0, 1, 1,
0.9020252, -1.623948, 2.158876, 0.9921569, 0, 1, 1,
0.9030853, -0.2428432, 2.664745, 0.9960784, 0, 1, 1,
0.9050756, -1.127944, 2.468163, 1, 0, 0.9960784, 1,
0.9058676, -0.4364328, 1.938513, 1, 0, 0.9882353, 1,
0.9113322, 1.68723, 0.3927098, 1, 0, 0.9843137, 1,
0.9114689, -0.4284169, 3.450613, 1, 0, 0.9764706, 1,
0.9133331, -0.4040652, 1.027181, 1, 0, 0.972549, 1,
0.9186929, -1.039703, 2.813643, 1, 0, 0.9647059, 1,
0.9190817, 1.622406, 0.9185912, 1, 0, 0.9607843, 1,
0.9219909, -1.241107, 2.027594, 1, 0, 0.9529412, 1,
0.9252441, 0.8509269, 1.091623, 1, 0, 0.9490196, 1,
0.9285203, 1.379037, 1.201082, 1, 0, 0.9411765, 1,
0.9299296, -0.4843788, 2.709339, 1, 0, 0.9372549, 1,
0.9328542, -0.8156269, 0.7954397, 1, 0, 0.9294118, 1,
0.937224, -1.054997, 1.34005, 1, 0, 0.9254902, 1,
0.9486951, 1.227696, 1.085995, 1, 0, 0.9176471, 1,
0.9557961, -0.7481614, 2.49091, 1, 0, 0.9137255, 1,
0.9586806, 0.9367301, -1.103837, 1, 0, 0.9058824, 1,
0.9600844, 1.47954, 1.729659, 1, 0, 0.9019608, 1,
0.9631355, -0.4046721, 1.555564, 1, 0, 0.8941177, 1,
0.9650734, 1.65, -0.3382168, 1, 0, 0.8862745, 1,
0.983619, 0.2439936, 1.183212, 1, 0, 0.8823529, 1,
0.987262, 0.9057636, 0.3357078, 1, 0, 0.8745098, 1,
0.9932215, -1.083344, 1.925408, 1, 0, 0.8705882, 1,
0.9935757, 0.3993812, -0.6115052, 1, 0, 0.8627451, 1,
0.9982787, -1.117617, 1.166313, 1, 0, 0.8588235, 1,
1.005142, -0.7571461, 3.182293, 1, 0, 0.8509804, 1,
1.006911, 2.108681, -0.2494763, 1, 0, 0.8470588, 1,
1.013524, -1.73689, 3.11288, 1, 0, 0.8392157, 1,
1.017414, -1.095822, 1.863696, 1, 0, 0.8352941, 1,
1.02895, 0.6666356, 1.63293, 1, 0, 0.827451, 1,
1.029253, 0.3670871, 1.996071, 1, 0, 0.8235294, 1,
1.034642, -0.03092655, 0.8314692, 1, 0, 0.8156863, 1,
1.036437, 1.758613, 0.6291643, 1, 0, 0.8117647, 1,
1.037822, -0.7001615, 2.693847, 1, 0, 0.8039216, 1,
1.049069, 0.7808436, 2.170143, 1, 0, 0.7960784, 1,
1.049736, 0.2494868, 1.840585, 1, 0, 0.7921569, 1,
1.056053, -1.433731, 1.888837, 1, 0, 0.7843137, 1,
1.056657, 0.05035327, 1.654715, 1, 0, 0.7803922, 1,
1.059442, 0.8246631, 1.871553, 1, 0, 0.772549, 1,
1.059675, 0.02560217, 1.218065, 1, 0, 0.7686275, 1,
1.061032, -0.638298, 2.050142, 1, 0, 0.7607843, 1,
1.066044, -0.1133224, 0.08882815, 1, 0, 0.7568628, 1,
1.07645, -0.4502953, 2.055624, 1, 0, 0.7490196, 1,
1.077305, 0.3039437, 4.305535, 1, 0, 0.7450981, 1,
1.081879, 1.001022, 2.018108, 1, 0, 0.7372549, 1,
1.084087, -0.0216614, 0.5949984, 1, 0, 0.7333333, 1,
1.088074, -1.057955, 2.98022, 1, 0, 0.7254902, 1,
1.091346, 0.370154, 0.6648126, 1, 0, 0.7215686, 1,
1.099247, 0.2971021, 0.9263725, 1, 0, 0.7137255, 1,
1.102452, -0.8818799, 1.944176, 1, 0, 0.7098039, 1,
1.104677, 0.2770421, 3.122753, 1, 0, 0.7019608, 1,
1.121411, -0.5069075, 2.596911, 1, 0, 0.6941177, 1,
1.123274, -0.5984398, 2.633555, 1, 0, 0.6901961, 1,
1.1335, -0.1774225, 2.026834, 1, 0, 0.682353, 1,
1.143271, 1.324471, 1.14262, 1, 0, 0.6784314, 1,
1.14739, -1.671391, 2.121755, 1, 0, 0.6705883, 1,
1.157607, 0.6661756, 0.9326401, 1, 0, 0.6666667, 1,
1.171574, -0.7183841, 2.959965, 1, 0, 0.6588235, 1,
1.173933, -0.2017612, 2.596902, 1, 0, 0.654902, 1,
1.179998, 1.643013, 0.8007051, 1, 0, 0.6470588, 1,
1.206546, 0.4093362, 0.7976061, 1, 0, 0.6431373, 1,
1.206706, 1.642918, 1.161125, 1, 0, 0.6352941, 1,
1.22164, -0.4477436, -0.5772948, 1, 0, 0.6313726, 1,
1.23364, 0.2004012, -1.100242, 1, 0, 0.6235294, 1,
1.245392, 0.2446277, 2.607836, 1, 0, 0.6196079, 1,
1.248109, 0.3205605, 0.1449878, 1, 0, 0.6117647, 1,
1.250162, -2.00465, 1.755598, 1, 0, 0.6078432, 1,
1.250341, -0.000451973, 2.188763, 1, 0, 0.6, 1,
1.266308, 2.037183, 0.280484, 1, 0, 0.5921569, 1,
1.267421, 0.3894542, -0.2891343, 1, 0, 0.5882353, 1,
1.272835, 0.09139583, 1.783009, 1, 0, 0.5803922, 1,
1.27388, -0.4810499, -0.01395153, 1, 0, 0.5764706, 1,
1.281005, 1.036582, -0.3087016, 1, 0, 0.5686275, 1,
1.28641, -1.029146, 2.961922, 1, 0, 0.5647059, 1,
1.290824, 2.719592, 1.100755, 1, 0, 0.5568628, 1,
1.297017, -0.7879027, 3.580085, 1, 0, 0.5529412, 1,
1.298757, -0.1136281, 2.069978, 1, 0, 0.5450981, 1,
1.301804, 0.7230831, 0.5950204, 1, 0, 0.5411765, 1,
1.310412, 0.1223392, -0.01822314, 1, 0, 0.5333334, 1,
1.311703, -0.7682183, 1.964533, 1, 0, 0.5294118, 1,
1.320461, 2.133823, 1.509812, 1, 0, 0.5215687, 1,
1.323313, -0.9316899, 1.023036, 1, 0, 0.5176471, 1,
1.32496, -0.3724009, 1.563383, 1, 0, 0.509804, 1,
1.332275, -0.1886834, 1.255507, 1, 0, 0.5058824, 1,
1.333713, -1.044811, 2.931626, 1, 0, 0.4980392, 1,
1.344136, 0.9191524, 1.628646, 1, 0, 0.4901961, 1,
1.345015, 1.260609, -0.8104051, 1, 0, 0.4862745, 1,
1.360258, -0.09378616, 1.254283, 1, 0, 0.4784314, 1,
1.364348, 3.62135, 1.957022, 1, 0, 0.4745098, 1,
1.378741, 0.7899956, -0.4398619, 1, 0, 0.4666667, 1,
1.380367, -1.046997, 2.4229, 1, 0, 0.4627451, 1,
1.382756, -1.232671, 3.177544, 1, 0, 0.454902, 1,
1.383197, -1.408201, 1.16687, 1, 0, 0.4509804, 1,
1.385799, 0.410542, 0.1155278, 1, 0, 0.4431373, 1,
1.397272, 0.3070026, 1.689182, 1, 0, 0.4392157, 1,
1.403851, -2.457616, 2.6943, 1, 0, 0.4313726, 1,
1.406052, 0.1677753, 1.167775, 1, 0, 0.427451, 1,
1.414649, -0.1162538, 1.36382, 1, 0, 0.4196078, 1,
1.422703, -1.540377, 1.027626, 1, 0, 0.4156863, 1,
1.42631, -0.520049, 0.5505534, 1, 0, 0.4078431, 1,
1.453272, 1.139352, 1.714827, 1, 0, 0.4039216, 1,
1.456889, 0.07586132, 0.1639154, 1, 0, 0.3960784, 1,
1.469343, -1.328093, 1.261662, 1, 0, 0.3882353, 1,
1.493541, 0.416662, 0.6366141, 1, 0, 0.3843137, 1,
1.503662, -1.174144, 2.26649, 1, 0, 0.3764706, 1,
1.509198, -0.6367579, 3.208961, 1, 0, 0.372549, 1,
1.511026, 0.7620574, 1.091163, 1, 0, 0.3647059, 1,
1.5112, 0.6657833, 0.9862393, 1, 0, 0.3607843, 1,
1.522176, 0.9587616, -0.4437365, 1, 0, 0.3529412, 1,
1.524178, 1.772979, 1.650291, 1, 0, 0.3490196, 1,
1.533998, -1.167542, 0.8623306, 1, 0, 0.3411765, 1,
1.538121, -0.3377426, 2.227268, 1, 0, 0.3372549, 1,
1.558314, -0.2414015, 1.629789, 1, 0, 0.3294118, 1,
1.566108, -0.4012896, 2.72557, 1, 0, 0.3254902, 1,
1.573694, 0.2138261, 1.521861, 1, 0, 0.3176471, 1,
1.581055, 1.136902, -0.660292, 1, 0, 0.3137255, 1,
1.591932, 0.4902506, -0.1492146, 1, 0, 0.3058824, 1,
1.595541, 1.380107, 0.8078774, 1, 0, 0.2980392, 1,
1.59671, -0.1654262, -1.467481, 1, 0, 0.2941177, 1,
1.597201, 0.4628532, 2.34602, 1, 0, 0.2862745, 1,
1.600671, -0.0023976, 1.02674, 1, 0, 0.282353, 1,
1.601235, -0.389577, 3.078729, 1, 0, 0.2745098, 1,
1.612291, 0.3122648, 1.261498, 1, 0, 0.2705882, 1,
1.621883, -1.020031, 2.485419, 1, 0, 0.2627451, 1,
1.639215, -0.01257164, 1.789067, 1, 0, 0.2588235, 1,
1.645462, 1.355959, 1.402876, 1, 0, 0.2509804, 1,
1.645501, -0.724912, 1.890591, 1, 0, 0.2470588, 1,
1.651801, 0.7031043, 2.721603, 1, 0, 0.2392157, 1,
1.664816, -0.1984193, 2.301729, 1, 0, 0.2352941, 1,
1.671534, -0.8795583, 1.007666, 1, 0, 0.227451, 1,
1.71569, -0.097858, 1.001462, 1, 0, 0.2235294, 1,
1.725787, 1.082356, 0.508314, 1, 0, 0.2156863, 1,
1.7357, 0.6224319, 1.029612, 1, 0, 0.2117647, 1,
1.757582, 0.3274058, 2.181168, 1, 0, 0.2039216, 1,
1.791105, 2.402301, 0.1191089, 1, 0, 0.1960784, 1,
1.802736, -1.140202, 1.405666, 1, 0, 0.1921569, 1,
1.820062, 1.171786, -1.098478, 1, 0, 0.1843137, 1,
1.845163, -0.1330625, 0.07614279, 1, 0, 0.1803922, 1,
1.846712, 0.2022737, 1.004879, 1, 0, 0.172549, 1,
1.863794, -0.4139613, 2.136623, 1, 0, 0.1686275, 1,
1.874972, -0.0001586644, 2.194715, 1, 0, 0.1607843, 1,
1.892218, 1.493489, 0.06826639, 1, 0, 0.1568628, 1,
1.9096, -0.3122503, 3.071879, 1, 0, 0.1490196, 1,
1.95611, 0.4447075, 2.428509, 1, 0, 0.145098, 1,
1.962522, 0.1352427, 0.2722677, 1, 0, 0.1372549, 1,
1.986471, 1.353392, -0.06931935, 1, 0, 0.1333333, 1,
2.012029, -0.8822113, 1.864003, 1, 0, 0.1254902, 1,
2.012788, 0.03223915, 1.79578, 1, 0, 0.1215686, 1,
2.03045, 0.5259194, 0.7701507, 1, 0, 0.1137255, 1,
2.034047, -0.06536724, 2.373834, 1, 0, 0.1098039, 1,
2.055221, 2.809616, 0.08038608, 1, 0, 0.1019608, 1,
2.065206, -0.9524923, 1.68364, 1, 0, 0.09411765, 1,
2.097784, 0.9579539, 1.284184, 1, 0, 0.09019608, 1,
2.120798, 0.3228832, 0.7908442, 1, 0, 0.08235294, 1,
2.122703, 2.575556, 0.4346114, 1, 0, 0.07843138, 1,
2.126124, -0.6934103, 2.473913, 1, 0, 0.07058824, 1,
2.294328, -0.8764597, 4.491381, 1, 0, 0.06666667, 1,
2.302666, 0.2159747, 1.511321, 1, 0, 0.05882353, 1,
2.424605, -0.7879207, 2.014113, 1, 0, 0.05490196, 1,
2.442433, 0.1439057, 1.632286, 1, 0, 0.04705882, 1,
2.48164, -0.4129722, 1.093797, 1, 0, 0.04313726, 1,
2.509706, 1.437273, 1.491092, 1, 0, 0.03529412, 1,
2.617316, 0.4470243, 0.2624445, 1, 0, 0.03137255, 1,
2.731219, 0.6583058, -0.001432744, 1, 0, 0.02352941, 1,
2.742675, 1.031118, 0.3800038, 1, 0, 0.01960784, 1,
2.792223, -0.8881174, 1.190187, 1, 0, 0.01176471, 1,
3.177021, -1.598084, 3.210229, 1, 0, 0.007843138, 1
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
0.1116443, -4.498183, -7.009496, 0, -0.5, 0.5, 0.5,
0.1116443, -4.498183, -7.009496, 1, -0.5, 0.5, 0.5,
0.1116443, -4.498183, -7.009496, 1, 1.5, 0.5, 0.5,
0.1116443, -4.498183, -7.009496, 0, 1.5, 0.5, 0.5
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
-3.992895, 0.1499807, -7.009496, 0, -0.5, 0.5, 0.5,
-3.992895, 0.1499807, -7.009496, 1, -0.5, 0.5, 0.5,
-3.992895, 0.1499807, -7.009496, 1, 1.5, 0.5, 0.5,
-3.992895, 0.1499807, -7.009496, 0, 1.5, 0.5, 0.5
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
-3.992895, -4.498183, -0.1587198, 0, -0.5, 0.5, 0.5,
-3.992895, -4.498183, -0.1587198, 1, -0.5, 0.5, 0.5,
-3.992895, -4.498183, -0.1587198, 1, 1.5, 0.5, 0.5,
-3.992895, -4.498183, -0.1587198, 0, 1.5, 0.5, 0.5
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
-2, -3.425529, -5.428547,
3, -3.425529, -5.428547,
-2, -3.425529, -5.428547,
-2, -3.604305, -5.692039,
-1, -3.425529, -5.428547,
-1, -3.604305, -5.692039,
0, -3.425529, -5.428547,
0, -3.604305, -5.692039,
1, -3.425529, -5.428547,
1, -3.604305, -5.692039,
2, -3.425529, -5.428547,
2, -3.604305, -5.692039,
3, -3.425529, -5.428547,
3, -3.604305, -5.692039
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
-2, -3.961856, -6.219022, 0, -0.5, 0.5, 0.5,
-2, -3.961856, -6.219022, 1, -0.5, 0.5, 0.5,
-2, -3.961856, -6.219022, 1, 1.5, 0.5, 0.5,
-2, -3.961856, -6.219022, 0, 1.5, 0.5, 0.5,
-1, -3.961856, -6.219022, 0, -0.5, 0.5, 0.5,
-1, -3.961856, -6.219022, 1, -0.5, 0.5, 0.5,
-1, -3.961856, -6.219022, 1, 1.5, 0.5, 0.5,
-1, -3.961856, -6.219022, 0, 1.5, 0.5, 0.5,
0, -3.961856, -6.219022, 0, -0.5, 0.5, 0.5,
0, -3.961856, -6.219022, 1, -0.5, 0.5, 0.5,
0, -3.961856, -6.219022, 1, 1.5, 0.5, 0.5,
0, -3.961856, -6.219022, 0, 1.5, 0.5, 0.5,
1, -3.961856, -6.219022, 0, -0.5, 0.5, 0.5,
1, -3.961856, -6.219022, 1, -0.5, 0.5, 0.5,
1, -3.961856, -6.219022, 1, 1.5, 0.5, 0.5,
1, -3.961856, -6.219022, 0, 1.5, 0.5, 0.5,
2, -3.961856, -6.219022, 0, -0.5, 0.5, 0.5,
2, -3.961856, -6.219022, 1, -0.5, 0.5, 0.5,
2, -3.961856, -6.219022, 1, 1.5, 0.5, 0.5,
2, -3.961856, -6.219022, 0, 1.5, 0.5, 0.5,
3, -3.961856, -6.219022, 0, -0.5, 0.5, 0.5,
3, -3.961856, -6.219022, 1, -0.5, 0.5, 0.5,
3, -3.961856, -6.219022, 1, 1.5, 0.5, 0.5,
3, -3.961856, -6.219022, 0, 1.5, 0.5, 0.5
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
-3.045694, -3, -5.428547,
-3.045694, 3, -5.428547,
-3.045694, -3, -5.428547,
-3.203561, -3, -5.692039,
-3.045694, -2, -5.428547,
-3.203561, -2, -5.692039,
-3.045694, -1, -5.428547,
-3.203561, -1, -5.692039,
-3.045694, 0, -5.428547,
-3.203561, 0, -5.692039,
-3.045694, 1, -5.428547,
-3.203561, 1, -5.692039,
-3.045694, 2, -5.428547,
-3.203561, 2, -5.692039,
-3.045694, 3, -5.428547,
-3.203561, 3, -5.692039
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
-3.519295, -3, -6.219022, 0, -0.5, 0.5, 0.5,
-3.519295, -3, -6.219022, 1, -0.5, 0.5, 0.5,
-3.519295, -3, -6.219022, 1, 1.5, 0.5, 0.5,
-3.519295, -3, -6.219022, 0, 1.5, 0.5, 0.5,
-3.519295, -2, -6.219022, 0, -0.5, 0.5, 0.5,
-3.519295, -2, -6.219022, 1, -0.5, 0.5, 0.5,
-3.519295, -2, -6.219022, 1, 1.5, 0.5, 0.5,
-3.519295, -2, -6.219022, 0, 1.5, 0.5, 0.5,
-3.519295, -1, -6.219022, 0, -0.5, 0.5, 0.5,
-3.519295, -1, -6.219022, 1, -0.5, 0.5, 0.5,
-3.519295, -1, -6.219022, 1, 1.5, 0.5, 0.5,
-3.519295, -1, -6.219022, 0, 1.5, 0.5, 0.5,
-3.519295, 0, -6.219022, 0, -0.5, 0.5, 0.5,
-3.519295, 0, -6.219022, 1, -0.5, 0.5, 0.5,
-3.519295, 0, -6.219022, 1, 1.5, 0.5, 0.5,
-3.519295, 0, -6.219022, 0, 1.5, 0.5, 0.5,
-3.519295, 1, -6.219022, 0, -0.5, 0.5, 0.5,
-3.519295, 1, -6.219022, 1, -0.5, 0.5, 0.5,
-3.519295, 1, -6.219022, 1, 1.5, 0.5, 0.5,
-3.519295, 1, -6.219022, 0, 1.5, 0.5, 0.5,
-3.519295, 2, -6.219022, 0, -0.5, 0.5, 0.5,
-3.519295, 2, -6.219022, 1, -0.5, 0.5, 0.5,
-3.519295, 2, -6.219022, 1, 1.5, 0.5, 0.5,
-3.519295, 2, -6.219022, 0, 1.5, 0.5, 0.5,
-3.519295, 3, -6.219022, 0, -0.5, 0.5, 0.5,
-3.519295, 3, -6.219022, 1, -0.5, 0.5, 0.5,
-3.519295, 3, -6.219022, 1, 1.5, 0.5, 0.5,
-3.519295, 3, -6.219022, 0, 1.5, 0.5, 0.5
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
-3.045694, -3.425529, -4,
-3.045694, -3.425529, 4,
-3.045694, -3.425529, -4,
-3.203561, -3.604305, -4,
-3.045694, -3.425529, -2,
-3.203561, -3.604305, -2,
-3.045694, -3.425529, 0,
-3.203561, -3.604305, 0,
-3.045694, -3.425529, 2,
-3.203561, -3.604305, 2,
-3.045694, -3.425529, 4,
-3.203561, -3.604305, 4
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
-3.519295, -3.961856, -4, 0, -0.5, 0.5, 0.5,
-3.519295, -3.961856, -4, 1, -0.5, 0.5, 0.5,
-3.519295, -3.961856, -4, 1, 1.5, 0.5, 0.5,
-3.519295, -3.961856, -4, 0, 1.5, 0.5, 0.5,
-3.519295, -3.961856, -2, 0, -0.5, 0.5, 0.5,
-3.519295, -3.961856, -2, 1, -0.5, 0.5, 0.5,
-3.519295, -3.961856, -2, 1, 1.5, 0.5, 0.5,
-3.519295, -3.961856, -2, 0, 1.5, 0.5, 0.5,
-3.519295, -3.961856, 0, 0, -0.5, 0.5, 0.5,
-3.519295, -3.961856, 0, 1, -0.5, 0.5, 0.5,
-3.519295, -3.961856, 0, 1, 1.5, 0.5, 0.5,
-3.519295, -3.961856, 0, 0, 1.5, 0.5, 0.5,
-3.519295, -3.961856, 2, 0, -0.5, 0.5, 0.5,
-3.519295, -3.961856, 2, 1, -0.5, 0.5, 0.5,
-3.519295, -3.961856, 2, 1, 1.5, 0.5, 0.5,
-3.519295, -3.961856, 2, 0, 1.5, 0.5, 0.5,
-3.519295, -3.961856, 4, 0, -0.5, 0.5, 0.5,
-3.519295, -3.961856, 4, 1, -0.5, 0.5, 0.5,
-3.519295, -3.961856, 4, 1, 1.5, 0.5, 0.5,
-3.519295, -3.961856, 4, 0, 1.5, 0.5, 0.5
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
-3.045694, -3.425529, -5.428547,
-3.045694, 3.725491, -5.428547,
-3.045694, -3.425529, 5.111108,
-3.045694, 3.725491, 5.111108,
-3.045694, -3.425529, -5.428547,
-3.045694, -3.425529, 5.111108,
-3.045694, 3.725491, -5.428547,
-3.045694, 3.725491, 5.111108,
-3.045694, -3.425529, -5.428547,
3.268982, -3.425529, -5.428547,
-3.045694, -3.425529, 5.111108,
3.268982, -3.425529, 5.111108,
-3.045694, 3.725491, -5.428547,
3.268982, 3.725491, -5.428547,
-3.045694, 3.725491, 5.111108,
3.268982, 3.725491, 5.111108,
3.268982, -3.425529, -5.428547,
3.268982, 3.725491, -5.428547,
3.268982, -3.425529, 5.111108,
3.268982, 3.725491, 5.111108,
3.268982, -3.425529, -5.428547,
3.268982, -3.425529, 5.111108,
3.268982, 3.725491, -5.428547,
3.268982, 3.725491, 5.111108
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
var radius = 7.591104;
var distance = 33.77368;
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
mvMatrix.translate( -0.1116443, -0.1499807, 0.1587198 );
mvMatrix.scale( 1.299774, 1.147759, 0.7787399 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.77368);
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
benzylalkohol<-read.table("benzylalkohol.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-benzylalkohol$V2
```

```
## Error in eval(expr, envir, enclos): object 'benzylalkohol' not found
```

```r
y<-benzylalkohol$V3
```

```
## Error in eval(expr, envir, enclos): object 'benzylalkohol' not found
```

```r
z<-benzylalkohol$V4
```

```
## Error in eval(expr, envir, enclos): object 'benzylalkohol' not found
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
-2.953732, -0.7073351, -1.537765, 0, 0, 1, 1, 1,
-2.922406, 1.280757, -1.905951, 1, 0, 0, 1, 1,
-2.726752, 0.7736135, 0.337406, 1, 0, 0, 1, 1,
-2.63216, 0.3074743, -3.264953, 1, 0, 0, 1, 1,
-2.577797, 0.5161146, 0.002045114, 1, 0, 0, 1, 1,
-2.547868, -0.5291743, -1.385567, 1, 0, 0, 1, 1,
-2.52549, -0.9928254, -0.1056662, 0, 0, 0, 1, 1,
-2.508551, -0.4946069, -2.360008, 0, 0, 0, 1, 1,
-2.375912, 1.440404, -0.1260975, 0, 0, 0, 1, 1,
-2.301191, -0.5643847, -1.140212, 0, 0, 0, 1, 1,
-2.263222, 0.2966385, -0.6245636, 0, 0, 0, 1, 1,
-2.247438, -1.415113, -1.976578, 0, 0, 0, 1, 1,
-2.216497, 1.089776, -3.430409, 0, 0, 0, 1, 1,
-2.213046, -0.8496234, -1.241696, 1, 1, 1, 1, 1,
-2.209806, -0.1330221, -1.732329, 1, 1, 1, 1, 1,
-2.202711, -0.8000895, 0.3664838, 1, 1, 1, 1, 1,
-2.180627, -1.379115, -1.329533, 1, 1, 1, 1, 1,
-2.172096, -0.6600655, -1.874222, 1, 1, 1, 1, 1,
-2.164001, -0.4532876, -1.08694, 1, 1, 1, 1, 1,
-2.156936, 0.6083108, -2.47434, 1, 1, 1, 1, 1,
-2.119164, -1.474764, -2.389072, 1, 1, 1, 1, 1,
-2.112106, 0.0535741, -1.118505, 1, 1, 1, 1, 1,
-2.086604, -1.623154, -1.995919, 1, 1, 1, 1, 1,
-1.976691, -0.3087233, -1.951101, 1, 1, 1, 1, 1,
-1.927337, 0.7814839, -2.048143, 1, 1, 1, 1, 1,
-1.91967, -0.9296359, -2.290649, 1, 1, 1, 1, 1,
-1.911727, -0.7047857, -0.3124416, 1, 1, 1, 1, 1,
-1.909676, -1.527692, -1.475707, 1, 1, 1, 1, 1,
-1.903513, 0.6160073, -0.982197, 0, 0, 1, 1, 1,
-1.894853, 0.2363766, -0.2869025, 1, 0, 0, 1, 1,
-1.876263, -1.06857, -1.403359, 1, 0, 0, 1, 1,
-1.852844, -0.2586796, -3.394125, 1, 0, 0, 1, 1,
-1.846056, -0.8621976, -1.252186, 1, 0, 0, 1, 1,
-1.842567, -1.833894, -2.309523, 1, 0, 0, 1, 1,
-1.835724, -1.65884, -2.485312, 0, 0, 0, 1, 1,
-1.832193, -1.480512, -3.733075, 0, 0, 0, 1, 1,
-1.828754, 0.6757861, -3.116842, 0, 0, 0, 1, 1,
-1.806591, -0.3952197, -1.183732, 0, 0, 0, 1, 1,
-1.782402, 1.04505, -1.437831, 0, 0, 0, 1, 1,
-1.78068, 0.5573418, -1.233841, 0, 0, 0, 1, 1,
-1.752757, -0.4050696, -1.293303, 0, 0, 0, 1, 1,
-1.750737, 0.5469915, -1.087143, 1, 1, 1, 1, 1,
-1.744555, 0.2467886, -0.6852518, 1, 1, 1, 1, 1,
-1.721544, 0.06611071, -0.8656756, 1, 1, 1, 1, 1,
-1.717384, -0.188829, -1.365147, 1, 1, 1, 1, 1,
-1.715719, 1.121318, -0.3216831, 1, 1, 1, 1, 1,
-1.712467, 0.3354524, -1.654911, 1, 1, 1, 1, 1,
-1.705605, 0.7581075, -0.1592654, 1, 1, 1, 1, 1,
-1.693393, -1.159171, -3.264747, 1, 1, 1, 1, 1,
-1.690074, -0.2236034, -4.038349, 1, 1, 1, 1, 1,
-1.679651, -0.6240021, -1.694387, 1, 1, 1, 1, 1,
-1.678373, -0.2365927, 0.1938358, 1, 1, 1, 1, 1,
-1.660493, 1.125277, -1.428137, 1, 1, 1, 1, 1,
-1.656172, -0.9054262, -1.683841, 1, 1, 1, 1, 1,
-1.625878, 1.105859, -0.7041658, 1, 1, 1, 1, 1,
-1.613666, -1.669199, -3.666181, 1, 1, 1, 1, 1,
-1.603395, -0.1611133, -3.855581, 0, 0, 1, 1, 1,
-1.59911, -1.749624, -2.474748, 1, 0, 0, 1, 1,
-1.576959, 0.6610915, -1.579682, 1, 0, 0, 1, 1,
-1.545384, 0.5198168, -2.266258, 1, 0, 0, 1, 1,
-1.542942, -0.4014406, -1.282524, 1, 0, 0, 1, 1,
-1.53567, 0.2094065, -2.616462, 1, 0, 0, 1, 1,
-1.527378, 0.6685525, -0.3074203, 0, 0, 0, 1, 1,
-1.525766, -1.974762, -2.773207, 0, 0, 0, 1, 1,
-1.51483, 0.08821109, 0.06804708, 0, 0, 0, 1, 1,
-1.512403, 1.24131, -0.5036671, 0, 0, 0, 1, 1,
-1.501181, 0.8134514, -1.21675, 0, 0, 0, 1, 1,
-1.499285, 0.4163043, -1.369628, 0, 0, 0, 1, 1,
-1.492697, -0.4429794, -3.02349, 0, 0, 0, 1, 1,
-1.486875, 0.4839197, 0.785793, 1, 1, 1, 1, 1,
-1.486229, 1.218585, -0.3300382, 1, 1, 1, 1, 1,
-1.482299, 0.9284397, -1.610593, 1, 1, 1, 1, 1,
-1.472465, 0.2459408, -2.116909, 1, 1, 1, 1, 1,
-1.445178, 0.92619, -0.3355103, 1, 1, 1, 1, 1,
-1.436073, -0.6462285, -1.832222, 1, 1, 1, 1, 1,
-1.430752, -0.6931846, -1.694489, 1, 1, 1, 1, 1,
-1.426615, 0.1631748, -2.046131, 1, 1, 1, 1, 1,
-1.414552, -2.504268, -3.095415, 1, 1, 1, 1, 1,
-1.409956, -0.6612891, -2.870936, 1, 1, 1, 1, 1,
-1.406143, -1.557856, -4.383877, 1, 1, 1, 1, 1,
-1.394886, -1.051179, -2.401474, 1, 1, 1, 1, 1,
-1.384631, 0.3879995, -1.520491, 1, 1, 1, 1, 1,
-1.383836, 0.2322164, -1.591489, 1, 1, 1, 1, 1,
-1.380104, -0.4335072, -1.502632, 1, 1, 1, 1, 1,
-1.374941, -0.6135823, -1.747611, 0, 0, 1, 1, 1,
-1.370254, 0.4257956, -1.011563, 1, 0, 0, 1, 1,
-1.367756, 0.3583716, -0.8549427, 1, 0, 0, 1, 1,
-1.364049, -0.2252801, -0.8453459, 1, 0, 0, 1, 1,
-1.360624, -0.310845, -2.283251, 1, 0, 0, 1, 1,
-1.359273, 0.2108604, -0.265027, 1, 0, 0, 1, 1,
-1.354855, -0.3536224, -2.230448, 0, 0, 0, 1, 1,
-1.344277, -0.281124, -2.038903, 0, 0, 0, 1, 1,
-1.341463, 1.424123, -2.843335, 0, 0, 0, 1, 1,
-1.336759, -1.058281, -3.717531, 0, 0, 0, 1, 1,
-1.330666, -0.6682957, -4.087345, 0, 0, 0, 1, 1,
-1.329351, -0.01242415, -1.62956, 0, 0, 0, 1, 1,
-1.327297, -0.7615895, -1.299507, 0, 0, 0, 1, 1,
-1.326311, 0.03852531, -1.53766, 1, 1, 1, 1, 1,
-1.32565, -0.1169321, -0.914188, 1, 1, 1, 1, 1,
-1.317587, -1.091625, -3.109552, 1, 1, 1, 1, 1,
-1.30728, 1.628668, -1.989702, 1, 1, 1, 1, 1,
-1.293885, 1.406059, 0.3717067, 1, 1, 1, 1, 1,
-1.288187, 0.3076504, -0.2853482, 1, 1, 1, 1, 1,
-1.286686, 0.3864847, 0.2499836, 1, 1, 1, 1, 1,
-1.265684, -1.625398, -3.30784, 1, 1, 1, 1, 1,
-1.264471, 1.448598, 0.4444233, 1, 1, 1, 1, 1,
-1.261012, 0.7784709, -1.648484, 1, 1, 1, 1, 1,
-1.25967, -0.8070698, -2.646073, 1, 1, 1, 1, 1,
-1.2535, -0.8224738, -2.63287, 1, 1, 1, 1, 1,
-1.251184, -0.2949601, -1.079902, 1, 1, 1, 1, 1,
-1.251117, 0.9974992, -1.313213, 1, 1, 1, 1, 1,
-1.244377, 1.004166, -2.970018, 1, 1, 1, 1, 1,
-1.241772, 0.4342115, 0.6853097, 0, 0, 1, 1, 1,
-1.230261, 0.8826326, -2.320888, 1, 0, 0, 1, 1,
-1.222623, 1.303697, 0.6117846, 1, 0, 0, 1, 1,
-1.218022, -2.731868, -2.615601, 1, 0, 0, 1, 1,
-1.214162, -0.2299383, -2.454124, 1, 0, 0, 1, 1,
-1.212909, -0.8074576, -0.7072766, 1, 0, 0, 1, 1,
-1.209058, 0.6951559, -1.87403, 0, 0, 0, 1, 1,
-1.204797, -0.7709011, -2.352088, 0, 0, 0, 1, 1,
-1.200575, -0.6950116, -1.868992, 0, 0, 0, 1, 1,
-1.186632, -0.5996135, -0.7464316, 0, 0, 0, 1, 1,
-1.177538, -0.4056945, -1.519627, 0, 0, 0, 1, 1,
-1.175338, 0.841413, -2.414009, 0, 0, 0, 1, 1,
-1.173603, 1.263184, -0.6973367, 0, 0, 0, 1, 1,
-1.162529, 0.8331146, -1.54939, 1, 1, 1, 1, 1,
-1.16142, 0.3122516, -1.511574, 1, 1, 1, 1, 1,
-1.151107, -1.431896, -3.793818, 1, 1, 1, 1, 1,
-1.143899, 0.5660615, -1.830011, 1, 1, 1, 1, 1,
-1.128468, -0.5368042, -4.45272, 1, 1, 1, 1, 1,
-1.110959, 0.891446, -0.7072585, 1, 1, 1, 1, 1,
-1.110625, -0.1445028, -0.3125491, 1, 1, 1, 1, 1,
-1.106995, -0.4660842, -2.541809, 1, 1, 1, 1, 1,
-1.103811, 1.400243, 0.03943172, 1, 1, 1, 1, 1,
-1.102867, 1.058915, -0.3216801, 1, 1, 1, 1, 1,
-1.102711, -1.472421, -4.064281, 1, 1, 1, 1, 1,
-1.092003, 1.056262, -1.204965, 1, 1, 1, 1, 1,
-1.091652, -1.894424, -2.885418, 1, 1, 1, 1, 1,
-1.084992, -1.521307, -3.397068, 1, 1, 1, 1, 1,
-1.081113, -1.497526, -4.179247, 1, 1, 1, 1, 1,
-1.079326, -0.5035195, -2.904921, 0, 0, 1, 1, 1,
-1.076714, -0.2137592, -1.403374, 1, 0, 0, 1, 1,
-1.075099, 0.740495, -1.822464, 1, 0, 0, 1, 1,
-1.066741, -0.2070313, -1.20594, 1, 0, 0, 1, 1,
-1.064508, 0.0926466, -1.777942, 1, 0, 0, 1, 1,
-1.062628, -2.175502, -3.510633, 1, 0, 0, 1, 1,
-1.056785, 1.398927, 0.3034238, 0, 0, 0, 1, 1,
-1.046471, 1.415414, 0.09418105, 0, 0, 0, 1, 1,
-1.045425, -0.3632048, -1.446167, 0, 0, 0, 1, 1,
-1.04542, -0.5384693, -2.001407, 0, 0, 0, 1, 1,
-1.044879, -0.1551406, -0.5453399, 0, 0, 0, 1, 1,
-1.043231, -2.000632, -2.933525, 0, 0, 0, 1, 1,
-1.037773, -1.381162, -3.592104, 0, 0, 0, 1, 1,
-1.034184, 0.1332698, -0.8190516, 1, 1, 1, 1, 1,
-1.018496, -0.5782618, -2.675982, 1, 1, 1, 1, 1,
-1.015257, -1.938768, -2.869716, 1, 1, 1, 1, 1,
-1.010236, -1.022493, -1.417715, 1, 1, 1, 1, 1,
-1.010144, 1.19848, -1.257922, 1, 1, 1, 1, 1,
-1.005486, 1.07595, -2.08321, 1, 1, 1, 1, 1,
-1.00491, -0.381658, -1.926497, 1, 1, 1, 1, 1,
-1.004724, -1.733233, -0.4067728, 1, 1, 1, 1, 1,
-1.002386, 0.5920628, -1.381168, 1, 1, 1, 1, 1,
-1.001376, 1.693877, -0.1451332, 1, 1, 1, 1, 1,
-1.001089, 0.05453373, -1.635148, 1, 1, 1, 1, 1,
-1.000522, -1.086496, -2.621351, 1, 1, 1, 1, 1,
-0.9992756, -0.424864, -2.319022, 1, 1, 1, 1, 1,
-0.9971023, -0.2567137, -3.441274, 1, 1, 1, 1, 1,
-0.9866338, 0.8402153, 1.395409, 1, 1, 1, 1, 1,
-0.9846495, 1.477906, 0.1987763, 0, 0, 1, 1, 1,
-0.983855, 1.157789, -2.021998, 1, 0, 0, 1, 1,
-0.9825919, -1.358156, -3.1863, 1, 0, 0, 1, 1,
-0.9787053, 0.2746619, 0.1097073, 1, 0, 0, 1, 1,
-0.966863, 0.800294, -0.4463715, 1, 0, 0, 1, 1,
-0.956488, -0.9281625, -4.027062, 1, 0, 0, 1, 1,
-0.9561296, 0.5644265, 1.020949, 0, 0, 0, 1, 1,
-0.9517701, -0.4300489, -1.091429, 0, 0, 0, 1, 1,
-0.9515851, 1.483207, -0.6813968, 0, 0, 0, 1, 1,
-0.9507009, 0.2298832, -1.04815, 0, 0, 0, 1, 1,
-0.9492285, -1.499471, -1.919412, 0, 0, 0, 1, 1,
-0.9439198, 0.2495518, -0.7729585, 0, 0, 0, 1, 1,
-0.9422628, -1.242961, -1.742187, 0, 0, 0, 1, 1,
-0.9407356, 0.1721288, -0.552247, 1, 1, 1, 1, 1,
-0.9395196, -0.1116221, -1.87146, 1, 1, 1, 1, 1,
-0.9334573, -0.350581, -2.247631, 1, 1, 1, 1, 1,
-0.932012, -1.897029, -3.059688, 1, 1, 1, 1, 1,
-0.9308572, 1.80912, 1.426964, 1, 1, 1, 1, 1,
-0.9301365, -0.3077712, -0.7035394, 1, 1, 1, 1, 1,
-0.9291819, -2.131608, -3.673774, 1, 1, 1, 1, 1,
-0.9273649, 0.09140494, -1.093903, 1, 1, 1, 1, 1,
-0.9267004, -0.5186622, -1.480932, 1, 1, 1, 1, 1,
-0.9247436, -1.713967, -2.250935, 1, 1, 1, 1, 1,
-0.9199986, -0.2287485, -1.553806, 1, 1, 1, 1, 1,
-0.9186925, -0.7498603, 0.255599, 1, 1, 1, 1, 1,
-0.9164457, -0.3808537, -3.549594, 1, 1, 1, 1, 1,
-0.90232, 0.827114, -0.3179625, 1, 1, 1, 1, 1,
-0.9003484, -0.2191788, -1.945863, 1, 1, 1, 1, 1,
-0.8979257, 1.631617, -0.9146343, 0, 0, 1, 1, 1,
-0.8974808, 1.748282, 0.4641997, 1, 0, 0, 1, 1,
-0.8911346, -1.955198, -2.200659, 1, 0, 0, 1, 1,
-0.8897679, -0.3372785, -2.757388, 1, 0, 0, 1, 1,
-0.8888221, 1.048203, -0.6840585, 1, 0, 0, 1, 1,
-0.8846867, 0.953304, 0.3598215, 1, 0, 0, 1, 1,
-0.8823561, 0.04805284, -1.785355, 0, 0, 0, 1, 1,
-0.8784814, -0.004999599, -1.946502, 0, 0, 0, 1, 1,
-0.8782281, 0.3974127, -2.407871, 0, 0, 0, 1, 1,
-0.8780181, 1.124677, 0.02438553, 0, 0, 0, 1, 1,
-0.8745104, -0.2149604, -2.337464, 0, 0, 0, 1, 1,
-0.8743891, 0.1925284, -3.352654, 0, 0, 0, 1, 1,
-0.865456, 0.4159745, -1.07559, 0, 0, 0, 1, 1,
-0.8648822, 1.526978, 0.8931912, 1, 1, 1, 1, 1,
-0.8612653, -0.3897316, -3.289616, 1, 1, 1, 1, 1,
-0.8595009, 0.08339855, -1.518067, 1, 1, 1, 1, 1,
-0.8560534, -0.4829059, -1.496017, 1, 1, 1, 1, 1,
-0.8556871, -0.04441296, -0.8073107, 1, 1, 1, 1, 1,
-0.8545691, -0.1387731, -1.2764, 1, 1, 1, 1, 1,
-0.8535129, 0.4633465, -1.457676, 1, 1, 1, 1, 1,
-0.8483665, -1.26466, -1.447491, 1, 1, 1, 1, 1,
-0.8472214, 0.4746733, -0.08635815, 1, 1, 1, 1, 1,
-0.8464806, 0.2922079, -3.532804, 1, 1, 1, 1, 1,
-0.8417978, 0.4655121, -1.527529, 1, 1, 1, 1, 1,
-0.8400424, -0.2223661, -3.283629, 1, 1, 1, 1, 1,
-0.8377063, 0.7619905, -0.01455934, 1, 1, 1, 1, 1,
-0.8320327, -0.08541557, -1.184019, 1, 1, 1, 1, 1,
-0.8226907, -0.8076419, -1.850307, 1, 1, 1, 1, 1,
-0.8193267, -1.403879, -2.296962, 0, 0, 1, 1, 1,
-0.8187808, 0.5184755, -1.953688, 1, 0, 0, 1, 1,
-0.8115398, 0.5573819, -0.3828664, 1, 0, 0, 1, 1,
-0.8059015, 1.397788, -1.724873, 1, 0, 0, 1, 1,
-0.7999581, 0.9128423, -1.560169, 1, 0, 0, 1, 1,
-0.7987835, -0.1055171, -2.761566, 1, 0, 0, 1, 1,
-0.7973908, -0.3114032, -1.28385, 0, 0, 0, 1, 1,
-0.7971734, -0.07042561, -1.027418, 0, 0, 0, 1, 1,
-0.7970621, -0.7999226, -3.707268, 0, 0, 0, 1, 1,
-0.7942986, -0.5001774, -1.216044, 0, 0, 0, 1, 1,
-0.7925585, 0.3757475, -1.319678, 0, 0, 0, 1, 1,
-0.7923563, 1.02585, -1.818554, 0, 0, 0, 1, 1,
-0.7864582, -0.03406674, -1.59511, 0, 0, 0, 1, 1,
-0.7849802, -1.012565, -1.018279, 1, 1, 1, 1, 1,
-0.7787002, 0.3531849, -0.5761261, 1, 1, 1, 1, 1,
-0.7785032, 0.9645395, -1.604766, 1, 1, 1, 1, 1,
-0.7758545, 1.596644, -0.5954447, 1, 1, 1, 1, 1,
-0.7733072, -0.2040487, -1.133997, 1, 1, 1, 1, 1,
-0.7689615, 0.1569077, -1.392743, 1, 1, 1, 1, 1,
-0.7657468, -0.7961926, -2.355206, 1, 1, 1, 1, 1,
-0.762478, -1.296868, -2.060276, 1, 1, 1, 1, 1,
-0.7561632, -0.6062627, -3.885896, 1, 1, 1, 1, 1,
-0.7538269, 2.229045, -0.08452875, 1, 1, 1, 1, 1,
-0.7533382, 1.147971, 0.7930075, 1, 1, 1, 1, 1,
-0.7521859, -1.389229, -0.1639083, 1, 1, 1, 1, 1,
-0.7432856, -1.04995, -1.966099, 1, 1, 1, 1, 1,
-0.741458, -0.1861756, -1.307916, 1, 1, 1, 1, 1,
-0.7383835, 1.884594, -0.6179131, 1, 1, 1, 1, 1,
-0.7374653, 0.7840353, -1.38584, 0, 0, 1, 1, 1,
-0.7341996, 0.02266406, -1.423631, 1, 0, 0, 1, 1,
-0.7306716, -0.05204521, -1.399211, 1, 0, 0, 1, 1,
-0.729722, 0.6306453, -1.160925, 1, 0, 0, 1, 1,
-0.7295903, 1.50218, -0.7812795, 1, 0, 0, 1, 1,
-0.7242529, -0.3494827, -3.349294, 1, 0, 0, 1, 1,
-0.7201661, -1.818301, -2.535675, 0, 0, 0, 1, 1,
-0.7174661, -0.6489431, -1.85907, 0, 0, 0, 1, 1,
-0.7172486, -1.409852, -2.130211, 0, 0, 0, 1, 1,
-0.7128521, -1.453154, -2.155817, 0, 0, 0, 1, 1,
-0.7078735, 0.878992, -2.300194, 0, 0, 0, 1, 1,
-0.7072602, 1.5222, -1.324923, 0, 0, 0, 1, 1,
-0.705575, -0.0933176, -1.742634, 0, 0, 0, 1, 1,
-0.6973203, 0.2987566, 0.008782472, 1, 1, 1, 1, 1,
-0.6946165, -0.2510532, -2.539438, 1, 1, 1, 1, 1,
-0.6937641, 0.2260622, -1.404913, 1, 1, 1, 1, 1,
-0.688634, -0.1024291, -1.357029, 1, 1, 1, 1, 1,
-0.6877435, -0.3225608, -2.333804, 1, 1, 1, 1, 1,
-0.6853627, -0.2220543, -3.226633, 1, 1, 1, 1, 1,
-0.685158, -1.194322, -1.607437, 1, 1, 1, 1, 1,
-0.6816582, -0.5992218, -2.959574, 1, 1, 1, 1, 1,
-0.6811231, 0.8818132, -3.129711, 1, 1, 1, 1, 1,
-0.672425, -0.4649169, -3.839613, 1, 1, 1, 1, 1,
-0.6717234, -0.4763185, -2.951174, 1, 1, 1, 1, 1,
-0.6711407, 0.02274781, -1.798213, 1, 1, 1, 1, 1,
-0.6684076, -1.316308, -3.323794, 1, 1, 1, 1, 1,
-0.666315, -1.61939, -2.35107, 1, 1, 1, 1, 1,
-0.6660571, 0.4151678, -0.9864993, 1, 1, 1, 1, 1,
-0.6633953, 0.7477506, -0.9984294, 0, 0, 1, 1, 1,
-0.6617489, -1.303493, -3.414143, 1, 0, 0, 1, 1,
-0.6550105, 1.228765, -1.627078, 1, 0, 0, 1, 1,
-0.6518207, 0.2878506, -2.145254, 1, 0, 0, 1, 1,
-0.6423055, 0.6455491, -0.7514737, 1, 0, 0, 1, 1,
-0.6392412, 1.441377, 0.2074146, 1, 0, 0, 1, 1,
-0.6377541, -0.4155027, -3.455026, 0, 0, 0, 1, 1,
-0.6314234, 0.7280949, 1.178971, 0, 0, 0, 1, 1,
-0.6269616, -0.4453393, -2.364341, 0, 0, 0, 1, 1,
-0.6237336, 0.2699536, -1.554471, 0, 0, 0, 1, 1,
-0.6166403, 0.6553279, -0.6568217, 0, 0, 0, 1, 1,
-0.6165471, 0.7483731, -2.432423, 0, 0, 0, 1, 1,
-0.6164333, -0.2831691, -0.9052489, 0, 0, 0, 1, 1,
-0.6153302, 2.057797, 1.778984, 1, 1, 1, 1, 1,
-0.6119554, -0.6112337, -2.573279, 1, 1, 1, 1, 1,
-0.6087385, 1.459938, -0.4910716, 1, 1, 1, 1, 1,
-0.6065953, -1.611086, -2.773607, 1, 1, 1, 1, 1,
-0.6054823, -0.1270298, -0.5412388, 1, 1, 1, 1, 1,
-0.5938307, 0.8418596, -1.221784, 1, 1, 1, 1, 1,
-0.5923601, -1.699852, -1.777924, 1, 1, 1, 1, 1,
-0.5901732, -0.5657393, -2.69034, 1, 1, 1, 1, 1,
-0.5868616, -1.104773, -2.311619, 1, 1, 1, 1, 1,
-0.586293, -0.6370447, -2.25245, 1, 1, 1, 1, 1,
-0.582786, -0.04490947, -1.990581, 1, 1, 1, 1, 1,
-0.5794545, 0.9881765, -1.851992, 1, 1, 1, 1, 1,
-0.5793833, 3.206198, 2.044446, 1, 1, 1, 1, 1,
-0.5780699, -1.389962, -5.228021, 1, 1, 1, 1, 1,
-0.5758875, 0.6920029, -1.598013, 1, 1, 1, 1, 1,
-0.5736452, -0.1581672, -3.570012, 0, 0, 1, 1, 1,
-0.5734919, -1.004854, -3.512371, 1, 0, 0, 1, 1,
-0.5729285, -0.2119568, -2.351414, 1, 0, 0, 1, 1,
-0.5710232, 0.01196556, -1.44185, 1, 0, 0, 1, 1,
-0.564326, -1.399462, -1.53286, 1, 0, 0, 1, 1,
-0.5634114, -0.235712, -2.555701, 1, 0, 0, 1, 1,
-0.5631799, 0.2497584, -1.955822, 0, 0, 0, 1, 1,
-0.5585024, -1.073908, -3.670813, 0, 0, 0, 1, 1,
-0.5572818, 0.5485966, -1.237225, 0, 0, 0, 1, 1,
-0.5563334, -1.066855, -2.738265, 0, 0, 0, 1, 1,
-0.5528699, 0.2321029, -2.254655, 0, 0, 0, 1, 1,
-0.5458614, -1.002241, -1.86765, 0, 0, 0, 1, 1,
-0.5411285, 1.635093, 0.6219783, 0, 0, 0, 1, 1,
-0.5392803, -1.430567, -4.104139, 1, 1, 1, 1, 1,
-0.5377553, -0.5624901, -3.057789, 1, 1, 1, 1, 1,
-0.5363765, -0.46659, -2.666292, 1, 1, 1, 1, 1,
-0.5313198, 1.153462, 0.2659481, 1, 1, 1, 1, 1,
-0.5284977, 1.790362, 0.4801027, 1, 1, 1, 1, 1,
-0.5252085, -1.085513, -2.719897, 1, 1, 1, 1, 1,
-0.5239343, 1.155913, 0.4556103, 1, 1, 1, 1, 1,
-0.5236228, -0.5461919, -3.514524, 1, 1, 1, 1, 1,
-0.5214104, -1.2002, -2.031803, 1, 1, 1, 1, 1,
-0.5198184, -1.481929, -3.136288, 1, 1, 1, 1, 1,
-0.5189276, -0.1764197, -2.639548, 1, 1, 1, 1, 1,
-0.5178013, 0.9263353, -2.722206, 1, 1, 1, 1, 1,
-0.5108038, 1.161276, 0.3485827, 1, 1, 1, 1, 1,
-0.5091774, -0.3963105, -2.263519, 1, 1, 1, 1, 1,
-0.5069652, -0.3880109, -3.250011, 1, 1, 1, 1, 1,
-0.5029402, -0.03063354, 0.3211288, 0, 0, 1, 1, 1,
-0.4962906, 0.7257836, 0.11991, 1, 0, 0, 1, 1,
-0.4931322, -3.321388, -3.90076, 1, 0, 0, 1, 1,
-0.4874649, 0.4694973, -1.252227, 1, 0, 0, 1, 1,
-0.4833589, 0.06742515, -0.8471293, 1, 0, 0, 1, 1,
-0.4812638, 0.7933486, -1.586478, 1, 0, 0, 1, 1,
-0.4774472, -0.2591864, -1.888052, 0, 0, 0, 1, 1,
-0.4743345, -0.5039667, -2.464982, 0, 0, 0, 1, 1,
-0.4741481, 2.151962, -0.2345112, 0, 0, 0, 1, 1,
-0.4738703, -1.769182, -2.74071, 0, 0, 0, 1, 1,
-0.4723541, -0.8102697, -2.649998, 0, 0, 0, 1, 1,
-0.4648079, 1.179678, -0.374029, 0, 0, 0, 1, 1,
-0.4638634, 0.5111605, -0.3668864, 0, 0, 0, 1, 1,
-0.4626301, -0.8799982, -1.726896, 1, 1, 1, 1, 1,
-0.4598821, 0.06289582, -1.880781, 1, 1, 1, 1, 1,
-0.4565165, -1.38244, -2.998677, 1, 1, 1, 1, 1,
-0.4463944, 0.1479338, -3.635132, 1, 1, 1, 1, 1,
-0.4456862, 0.148066, -0.1429703, 1, 1, 1, 1, 1,
-0.4420778, -1.498754, -3.383016, 1, 1, 1, 1, 1,
-0.4415587, -0.7222117, -3.525246, 1, 1, 1, 1, 1,
-0.4414787, 1.020692, -0.9853339, 1, 1, 1, 1, 1,
-0.4414133, 0.4540009, -0.857134, 1, 1, 1, 1, 1,
-0.4402538, -0.1322039, -1.710398, 1, 1, 1, 1, 1,
-0.4400812, -0.04397151, -2.191146, 1, 1, 1, 1, 1,
-0.439125, 0.3523133, -1.8361, 1, 1, 1, 1, 1,
-0.4374858, -0.3854569, -3.986776, 1, 1, 1, 1, 1,
-0.4368125, -0.0224768, -1.85112, 1, 1, 1, 1, 1,
-0.4357302, -0.2100381, -2.515038, 1, 1, 1, 1, 1,
-0.4300525, 0.4116863, -0.2960523, 0, 0, 1, 1, 1,
-0.4233206, 1.771784, 0.8733252, 1, 0, 0, 1, 1,
-0.4172799, -0.3782929, -2.286595, 1, 0, 0, 1, 1,
-0.413748, -0.1769081, -1.644517, 1, 0, 0, 1, 1,
-0.4104004, 1.147936, -0.9820682, 1, 0, 0, 1, 1,
-0.4047631, 1.463361, -0.4976901, 1, 0, 0, 1, 1,
-0.4031171, -0.2096298, -3.325543, 0, 0, 0, 1, 1,
-0.402807, -0.8306887, -4.802872, 0, 0, 0, 1, 1,
-0.3998245, 2.40537, -1.602525, 0, 0, 0, 1, 1,
-0.3981217, -0.4625418, -2.460579, 0, 0, 0, 1, 1,
-0.3974894, -1.259708, -3.033759, 0, 0, 0, 1, 1,
-0.3966847, 0.3138914, -0.7149788, 0, 0, 0, 1, 1,
-0.3962975, 0.4438925, -0.3557763, 0, 0, 0, 1, 1,
-0.3927291, 1.140335, -0.3921832, 1, 1, 1, 1, 1,
-0.3846312, 0.06223885, 0.06834746, 1, 1, 1, 1, 1,
-0.3824679, -0.0992684, -0.8827419, 1, 1, 1, 1, 1,
-0.3793431, -0.3997225, -2.627903, 1, 1, 1, 1, 1,
-0.3790584, 0.3756464, -0.2303896, 1, 1, 1, 1, 1,
-0.3746802, 0.5123031, -3.541743, 1, 1, 1, 1, 1,
-0.3736144, -0.9148369, -2.011422, 1, 1, 1, 1, 1,
-0.3721183, -2.422539, -3.813948, 1, 1, 1, 1, 1,
-0.3693852, 1.337713, 0.5965697, 1, 1, 1, 1, 1,
-0.3688267, -0.8010297, -2.57291, 1, 1, 1, 1, 1,
-0.3636707, -1.64209, -1.991723, 1, 1, 1, 1, 1,
-0.3611728, -0.06429808, -2.030885, 1, 1, 1, 1, 1,
-0.3590803, 1.416763, 0.1771172, 1, 1, 1, 1, 1,
-0.3576089, 0.2515785, 0.2344226, 1, 1, 1, 1, 1,
-0.3537124, 0.4815443, 0.03166301, 1, 1, 1, 1, 1,
-0.3533323, 0.4929543, -0.4494508, 0, 0, 1, 1, 1,
-0.3521947, -0.7302033, -2.580245, 1, 0, 0, 1, 1,
-0.349878, -0.3667886, -3.054024, 1, 0, 0, 1, 1,
-0.3489432, 0.4731688, -1.491396, 1, 0, 0, 1, 1,
-0.3477717, -0.05435346, -1.530363, 1, 0, 0, 1, 1,
-0.3453313, 0.2398441, -1.783036, 1, 0, 0, 1, 1,
-0.3439667, 1.387045, -0.1632905, 0, 0, 0, 1, 1,
-0.339548, 1.310561, 0.07257716, 0, 0, 0, 1, 1,
-0.3366948, 0.7540511, -1.491822, 0, 0, 0, 1, 1,
-0.3331849, 1.01276, -0.6311337, 0, 0, 0, 1, 1,
-0.3316986, -0.3031743, -2.803966, 0, 0, 0, 1, 1,
-0.3295724, -0.2590488, -2.195693, 0, 0, 0, 1, 1,
-0.3223001, 1.105146, 0.9242339, 0, 0, 0, 1, 1,
-0.3161573, 0.4328515, -0.07083845, 1, 1, 1, 1, 1,
-0.3128276, 0.1996273, 0.2570828, 1, 1, 1, 1, 1,
-0.311226, -0.6358623, -2.710696, 1, 1, 1, 1, 1,
-0.3096414, -1.858832, -3.076873, 1, 1, 1, 1, 1,
-0.305889, 1.702865, -2.305562, 1, 1, 1, 1, 1,
-0.3017552, -0.3706899, -2.972728, 1, 1, 1, 1, 1,
-0.2996143, 0.3548593, -2.222126, 1, 1, 1, 1, 1,
-0.2935024, 0.8384527, -0.6814175, 1, 1, 1, 1, 1,
-0.286963, 0.1332586, 0.155669, 1, 1, 1, 1, 1,
-0.2867385, 0.9687265, -0.09810343, 1, 1, 1, 1, 1,
-0.2855858, 1.491802, -0.004782548, 1, 1, 1, 1, 1,
-0.2848012, -0.3280493, -3.095758, 1, 1, 1, 1, 1,
-0.2845695, -0.6200293, -2.781855, 1, 1, 1, 1, 1,
-0.281762, -1.472874, -3.150209, 1, 1, 1, 1, 1,
-0.278247, -0.4670606, -2.57671, 1, 1, 1, 1, 1,
-0.2760414, -1.116981, -4.426536, 0, 0, 1, 1, 1,
-0.2725669, 0.1415583, -1.777457, 1, 0, 0, 1, 1,
-0.2706319, -0.8642623, -4.012926, 1, 0, 0, 1, 1,
-0.2698739, -0.7748268, -5.275057, 1, 0, 0, 1, 1,
-0.2612384, -1.041362, -3.633712, 1, 0, 0, 1, 1,
-0.2605808, 1.679187, 1.004548, 1, 0, 0, 1, 1,
-0.2576939, -2.544876, -4.847591, 0, 0, 0, 1, 1,
-0.2567287, -0.03720666, -2.645516, 0, 0, 0, 1, 1,
-0.2565335, -1.756144, -3.035702, 0, 0, 0, 1, 1,
-0.252553, 1.048385, 0.02289505, 0, 0, 0, 1, 1,
-0.2487192, 0.016031, -1.589033, 0, 0, 0, 1, 1,
-0.2416365, -0.5532489, -2.536619, 0, 0, 0, 1, 1,
-0.2402366, -0.9143867, -2.487338, 0, 0, 0, 1, 1,
-0.2365142, 0.2992161, -1.494369, 1, 1, 1, 1, 1,
-0.2320039, 0.5596138, -1.114874, 1, 1, 1, 1, 1,
-0.2307749, -0.5891941, -2.806746, 1, 1, 1, 1, 1,
-0.2291527, 0.2720571, 0.465846, 1, 1, 1, 1, 1,
-0.2283858, -1.467931, -4.632301, 1, 1, 1, 1, 1,
-0.2267413, -0.3537843, -2.43245, 1, 1, 1, 1, 1,
-0.2265317, -1.624887, -2.552397, 1, 1, 1, 1, 1,
-0.220082, 1.996507, -0.5088484, 1, 1, 1, 1, 1,
-0.2079713, -2.235204, -1.028379, 1, 1, 1, 1, 1,
-0.1976732, 0.4888578, 1.418535, 1, 1, 1, 1, 1,
-0.1908805, 0.2809877, -0.3220316, 1, 1, 1, 1, 1,
-0.186609, 1.021616, -1.164938, 1, 1, 1, 1, 1,
-0.1860404, -0.8052918, -3.723615, 1, 1, 1, 1, 1,
-0.1855532, 1.147402, 0.4413635, 1, 1, 1, 1, 1,
-0.1848745, -0.6378771, -1.949411, 1, 1, 1, 1, 1,
-0.1750686, 0.8880929, 0.7990004, 0, 0, 1, 1, 1,
-0.1739826, 0.7048077, -2.177946, 1, 0, 0, 1, 1,
-0.173862, 2.194979, -0.9996439, 1, 0, 0, 1, 1,
-0.1734555, 0.123283, -0.6977671, 1, 0, 0, 1, 1,
-0.1726099, -2.030574, -2.219416, 1, 0, 0, 1, 1,
-0.1684103, -0.1509833, -0.4617748, 1, 0, 0, 1, 1,
-0.1662126, -0.4396704, -4.956851, 0, 0, 0, 1, 1,
-0.1555021, -0.37939, -3.899921, 0, 0, 0, 1, 1,
-0.1491091, 1.359152, -0.04332147, 0, 0, 0, 1, 1,
-0.1435975, 1.307376, -0.9587516, 0, 0, 0, 1, 1,
-0.1432279, -0.7665225, -2.86061, 0, 0, 0, 1, 1,
-0.1426996, 1.647306, -0.4826176, 0, 0, 0, 1, 1,
-0.1402794, -0.1638438, -1.238965, 0, 0, 0, 1, 1,
-0.1400514, -1.356302, -3.932294, 1, 1, 1, 1, 1,
-0.1396966, 0.6291679, -0.7500864, 1, 1, 1, 1, 1,
-0.1360755, -0.005996042, -1.467872, 1, 1, 1, 1, 1,
-0.1359452, 0.6700368, -0.9103281, 1, 1, 1, 1, 1,
-0.1330203, 0.05202542, -0.2044605, 1, 1, 1, 1, 1,
-0.1311522, 0.4390335, -0.3755913, 1, 1, 1, 1, 1,
-0.1298534, -1.329164, -3.177495, 1, 1, 1, 1, 1,
-0.124122, 0.1816154, 0.2248051, 1, 1, 1, 1, 1,
-0.1236766, -0.2822393, -3.111409, 1, 1, 1, 1, 1,
-0.1218993, -0.2401096, -2.146279, 1, 1, 1, 1, 1,
-0.1100326, 0.06986816, -1.615891, 1, 1, 1, 1, 1,
-0.1093887, 0.8741466, 0.152971, 1, 1, 1, 1, 1,
-0.104987, 1.929024, -0.6152415, 1, 1, 1, 1, 1,
-0.1049057, -1.704427, -2.844265, 1, 1, 1, 1, 1,
-0.09740423, 2.002856, 0.7889165, 1, 1, 1, 1, 1,
-0.09327669, -1.36041, -1.97132, 0, 0, 1, 1, 1,
-0.09161328, 2.168702, 0.7193071, 1, 0, 0, 1, 1,
-0.0890187, 1.095862, -0.3167831, 1, 0, 0, 1, 1,
-0.0869661, -0.6186151, -2.44954, 1, 0, 0, 1, 1,
-0.08516836, 0.7162849, -0.0003571482, 1, 0, 0, 1, 1,
-0.08135863, -0.3200435, -3.652875, 1, 0, 0, 1, 1,
-0.08014072, 0.7673465, -0.8248795, 0, 0, 0, 1, 1,
-0.07785346, -0.8721356, -3.008142, 0, 0, 0, 1, 1,
-0.07664587, -0.2919323, -3.932944, 0, 0, 0, 1, 1,
-0.07416008, -0.8858364, -4.33606, 0, 0, 0, 1, 1,
-0.07347526, -0.4845516, -2.776123, 0, 0, 0, 1, 1,
-0.07182527, -0.0907563, -1.817274, 0, 0, 0, 1, 1,
-0.07130003, -1.001195, -2.507367, 0, 0, 0, 1, 1,
-0.06877167, 0.4113731, -0.9390618, 1, 1, 1, 1, 1,
-0.06385276, 0.7968328, 0.4333894, 1, 1, 1, 1, 1,
-0.06110143, -0.7492027, -1.364063, 1, 1, 1, 1, 1,
-0.05854685, 0.7385151, 0.03947942, 1, 1, 1, 1, 1,
-0.05405739, -2.034782, -3.93942, 1, 1, 1, 1, 1,
-0.05337326, -0.3404959, -2.68787, 1, 1, 1, 1, 1,
-0.05176328, -0.8195411, -1.032275, 1, 1, 1, 1, 1,
-0.05108662, 0.4250371, -1.580021, 1, 1, 1, 1, 1,
-0.04998338, 0.7733389, -0.9773851, 1, 1, 1, 1, 1,
-0.04153169, 0.3153908, 1.668923, 1, 1, 1, 1, 1,
-0.04102039, -1.888816, -1.436908, 1, 1, 1, 1, 1,
-0.03867792, 1.528156, 0.3368849, 1, 1, 1, 1, 1,
-0.03220437, 0.3772927, -1.966857, 1, 1, 1, 1, 1,
-0.0282709, 0.06085128, 0.4421759, 1, 1, 1, 1, 1,
-0.02729418, 1.076043, -0.03804632, 1, 1, 1, 1, 1,
-0.02588031, 0.2675353, 0.3623753, 0, 0, 1, 1, 1,
-0.02568859, 3.570951, -0.3777291, 1, 0, 0, 1, 1,
-0.02517772, -1.310024, -1.301314, 1, 0, 0, 1, 1,
-0.02489493, 0.1016221, 0.7231986, 1, 0, 0, 1, 1,
-0.02200989, 1.25676, 1.775634, 1, 0, 0, 1, 1,
-0.0191107, 0.9487966, 1.154854, 1, 0, 0, 1, 1,
-0.01776191, -0.3789144, -0.9148331, 0, 0, 0, 1, 1,
-0.01739047, -0.03275306, -1.557999, 0, 0, 0, 1, 1,
-0.01737499, 1.362915, 0.64935, 0, 0, 0, 1, 1,
-0.01043745, 0.2398013, -0.821974, 0, 0, 0, 1, 1,
-0.001897594, 0.6500213, -0.2053098, 0, 0, 0, 1, 1,
-0.001541971, 1.38311, 0.6855474, 0, 0, 0, 1, 1,
0.002286683, 0.266334, 1.005602, 0, 0, 0, 1, 1,
0.004795203, 0.2295262, 1.181062, 1, 1, 1, 1, 1,
0.01006877, 1.330438, -0.6140957, 1, 1, 1, 1, 1,
0.01113315, -1.281936, 3.530772, 1, 1, 1, 1, 1,
0.012294, -2.083519, 1.685174, 1, 1, 1, 1, 1,
0.01433457, -1.754974, 4.875228, 1, 1, 1, 1, 1,
0.01962052, -1.904849, 2.469859, 1, 1, 1, 1, 1,
0.01977651, 0.004840654, 1.818424, 1, 1, 1, 1, 1,
0.01992361, -0.1246348, 1.490193, 1, 1, 1, 1, 1,
0.02154034, -1.138888, 0.7066087, 1, 1, 1, 1, 1,
0.02290177, -1.392394, 3.774664, 1, 1, 1, 1, 1,
0.02513887, 1.056326, -0.7889683, 1, 1, 1, 1, 1,
0.02859179, 0.2666247, 0.05336479, 1, 1, 1, 1, 1,
0.02891373, -0.1557169, 1.730651, 1, 1, 1, 1, 1,
0.03002087, -1.175721, 3.5746, 1, 1, 1, 1, 1,
0.03028988, 0.1973433, -0.6554241, 1, 1, 1, 1, 1,
0.03300751, 0.3596548, -1.581128, 0, 0, 1, 1, 1,
0.03591315, 0.54303, 0.05449802, 1, 0, 0, 1, 1,
0.04088535, 0.02891484, 1.748051, 1, 0, 0, 1, 1,
0.04674457, -0.9538917, 2.266713, 1, 0, 0, 1, 1,
0.04967468, -1.099718, 3.007694, 1, 0, 0, 1, 1,
0.05106797, 1.037428, 1.003909, 1, 0, 0, 1, 1,
0.06228518, -0.4972724, 4.957618, 0, 0, 0, 1, 1,
0.06317282, 0.07321006, 1.495558, 0, 0, 0, 1, 1,
0.06362139, -2.362864, 2.748332, 0, 0, 0, 1, 1,
0.06561982, -0.6745692, 4.26797, 0, 0, 0, 1, 1,
0.06828531, -0.7704811, 2.584882, 0, 0, 0, 1, 1,
0.06840315, -0.272266, 3.596985, 0, 0, 0, 1, 1,
0.07024887, -0.268849, 3.468619, 0, 0, 0, 1, 1,
0.0712904, 0.4590532, 0.005803036, 1, 1, 1, 1, 1,
0.08270414, -0.4989859, 1.450421, 1, 1, 1, 1, 1,
0.08728012, 1.067578, -0.1445231, 1, 1, 1, 1, 1,
0.09231634, -0.01611765, 2.157455, 1, 1, 1, 1, 1,
0.09845933, 0.9907803, 2.008033, 1, 1, 1, 1, 1,
0.09915084, 2.425318, 1.778157, 1, 1, 1, 1, 1,
0.1002891, -0.6678715, 3.454124, 1, 1, 1, 1, 1,
0.1032362, -0.1767669, 2.943834, 1, 1, 1, 1, 1,
0.1064019, -0.09438713, 2.404101, 1, 1, 1, 1, 1,
0.1067282, -0.6195182, 3.866148, 1, 1, 1, 1, 1,
0.1068307, 0.7160605, -0.06383546, 1, 1, 1, 1, 1,
0.1095616, -1.146646, 3.819931, 1, 1, 1, 1, 1,
0.1124063, -0.9306617, 1.659008, 1, 1, 1, 1, 1,
0.1251204, -0.04189659, 1.062438, 1, 1, 1, 1, 1,
0.1298271, 2.212602, -0.03200381, 1, 1, 1, 1, 1,
0.1302908, -1.049269, 3.643284, 0, 0, 1, 1, 1,
0.1309495, 0.0283756, 2.369466, 1, 0, 0, 1, 1,
0.1311487, -0.9349577, 2.839681, 1, 0, 0, 1, 1,
0.131609, 0.114447, 0.6418094, 1, 0, 0, 1, 1,
0.132084, 0.9565561, 0.9662937, 1, 0, 0, 1, 1,
0.1340254, 0.8379704, -0.5727872, 1, 0, 0, 1, 1,
0.1345537, 0.5617127, -0.1740856, 0, 0, 0, 1, 1,
0.1346887, 0.8520219, -0.3358722, 0, 0, 0, 1, 1,
0.1347809, -0.1990506, 2.112546, 0, 0, 0, 1, 1,
0.1372091, 0.8236007, -0.4970014, 0, 0, 0, 1, 1,
0.1383227, 2.489001, 2.011545, 0, 0, 0, 1, 1,
0.1384939, 0.7266029, -1.325841, 0, 0, 0, 1, 1,
0.1394797, -0.462189, 2.713639, 0, 0, 0, 1, 1,
0.1411025, 0.6474542, -1.824793, 1, 1, 1, 1, 1,
0.1418138, -2.192229, 3.805979, 1, 1, 1, 1, 1,
0.1428154, 0.5987738, 0.4884825, 1, 1, 1, 1, 1,
0.1463907, -1.084409, 2.697041, 1, 1, 1, 1, 1,
0.1515705, -0.1582133, 1.324461, 1, 1, 1, 1, 1,
0.1525549, -0.2606477, 2.805807, 1, 1, 1, 1, 1,
0.1532028, -1.701896, 3.60518, 1, 1, 1, 1, 1,
0.1546803, 0.380747, 0.2636594, 1, 1, 1, 1, 1,
0.1553118, -1.095709, 2.619018, 1, 1, 1, 1, 1,
0.1659627, 1.070661, -0.9851108, 1, 1, 1, 1, 1,
0.1690377, 2.030259, 1.797843, 1, 1, 1, 1, 1,
0.1813015, -0.07703633, 3.23823, 1, 1, 1, 1, 1,
0.1821391, -0.3230314, 3.075251, 1, 1, 1, 1, 1,
0.1846658, 0.3931617, -0.585499, 1, 1, 1, 1, 1,
0.1857429, -0.7826605, 3.627233, 1, 1, 1, 1, 1,
0.1905171, 1.117076, 1.10081, 0, 0, 1, 1, 1,
0.1909548, -1.33328, 4.552433, 1, 0, 0, 1, 1,
0.1912914, 0.6322961, 0.5495403, 1, 0, 0, 1, 1,
0.1916278, -1.313943, 2.759794, 1, 0, 0, 1, 1,
0.1925171, 0.778, -0.4440971, 1, 0, 0, 1, 1,
0.1939074, -0.006044643, 0.1975426, 1, 0, 0, 1, 1,
0.1940901, 1.71274, -0.3728685, 0, 0, 0, 1, 1,
0.1945482, -2.018957, 1.889164, 0, 0, 0, 1, 1,
0.19695, -1.246414, 2.723968, 0, 0, 0, 1, 1,
0.1973498, -1.067759, 3.017628, 0, 0, 0, 1, 1,
0.1982353, 0.8270048, -0.1993588, 0, 0, 0, 1, 1,
0.1995499, 1.17965, -0.5983388, 0, 0, 0, 1, 1,
0.2001686, 0.2750519, 1.631621, 0, 0, 0, 1, 1,
0.2004798, 0.07304671, 1.124568, 1, 1, 1, 1, 1,
0.2047833, 1.493734, 0.8666384, 1, 1, 1, 1, 1,
0.2051634, 0.0354912, 1.624861, 1, 1, 1, 1, 1,
0.2060333, -0.2936267, 2.514413, 1, 1, 1, 1, 1,
0.2081141, 1.449482, 1.054194, 1, 1, 1, 1, 1,
0.2122326, -0.8296185, 3.180616, 1, 1, 1, 1, 1,
0.2163371, 2.015766, 1.706376, 1, 1, 1, 1, 1,
0.2166078, 0.8370578, -1.006649, 1, 1, 1, 1, 1,
0.2218165, 0.02690377, 3.53113, 1, 1, 1, 1, 1,
0.2235175, 2.106772, 1.450984, 1, 1, 1, 1, 1,
0.2255504, 0.652873, 0.8337524, 1, 1, 1, 1, 1,
0.2298422, 1.456884, -1.445407, 1, 1, 1, 1, 1,
0.2319665, 1.623578, 1.899929, 1, 1, 1, 1, 1,
0.2372162, -1.464728, 3.348485, 1, 1, 1, 1, 1,
0.239087, -1.9545, 2.67092, 1, 1, 1, 1, 1,
0.2400208, -0.2340441, 3.739031, 0, 0, 1, 1, 1,
0.2414239, -0.750664, 4.265631, 1, 0, 0, 1, 1,
0.242724, -0.4722514, 3.981445, 1, 0, 0, 1, 1,
0.244372, -0.6380861, 2.976592, 1, 0, 0, 1, 1,
0.2488939, 0.813172, -1.0552, 1, 0, 0, 1, 1,
0.2521493, -0.4816157, 3.361251, 1, 0, 0, 1, 1,
0.2532443, -2.164131, 3.360708, 0, 0, 0, 1, 1,
0.2540608, 0.08828753, 2.15835, 0, 0, 0, 1, 1,
0.2595513, -2.654444, 1.579175, 0, 0, 0, 1, 1,
0.2626546, 0.1788143, 1.924406, 0, 0, 0, 1, 1,
0.2698116, 0.9430562, 0.9930857, 0, 0, 0, 1, 1,
0.2724468, -2.39838, 4.09937, 0, 0, 0, 1, 1,
0.2732896, 2.008519, -0.2671704, 0, 0, 0, 1, 1,
0.2776574, -0.3600725, 1.844135, 1, 1, 1, 1, 1,
0.2820821, -0.3520387, 2.901838, 1, 1, 1, 1, 1,
0.2823507, -2.388762, 1.359636, 1, 1, 1, 1, 1,
0.2860609, -0.8014464, 2.533097, 1, 1, 1, 1, 1,
0.2891059, -0.2275692, 1.924233, 1, 1, 1, 1, 1,
0.2938732, -0.2347754, 1.576014, 1, 1, 1, 1, 1,
0.2971025, 0.3825315, 1.024597, 1, 1, 1, 1, 1,
0.2975195, 1.357074, 0.05048895, 1, 1, 1, 1, 1,
0.2981441, -1.685807, 3.785646, 1, 1, 1, 1, 1,
0.3067754, 1.029832, -0.3777935, 1, 1, 1, 1, 1,
0.3088976, 0.3707451, -0.08927173, 1, 1, 1, 1, 1,
0.3095737, 1.004272, 0.3606562, 1, 1, 1, 1, 1,
0.3133618, -0.2619398, 1.023562, 1, 1, 1, 1, 1,
0.3152808, -0.4426708, 2.402192, 1, 1, 1, 1, 1,
0.3155055, -0.097573, 1.193939, 1, 1, 1, 1, 1,
0.3155107, -0.2898374, 2.936424, 0, 0, 1, 1, 1,
0.3303643, -0.6304263, 2.260604, 1, 0, 0, 1, 1,
0.3324663, 0.09048152, 1.795775, 1, 0, 0, 1, 1,
0.332986, 1.256813, 1.741991, 1, 0, 0, 1, 1,
0.3364067, -0.7407497, 3.581477, 1, 0, 0, 1, 1,
0.3397492, -0.7407983, 2.507484, 1, 0, 0, 1, 1,
0.3412972, 1.4975, 0.2750311, 0, 0, 0, 1, 1,
0.342824, 0.7732682, -0.578752, 0, 0, 0, 1, 1,
0.343618, 1.425734, -0.5120077, 0, 0, 0, 1, 1,
0.3457298, -0.4148665, 3.309584, 0, 0, 0, 1, 1,
0.3477749, 0.9798029, 1.144797, 0, 0, 0, 1, 1,
0.3495263, -0.5554683, 3.436705, 0, 0, 0, 1, 1,
0.3497372, -0.8593673, 3.859969, 0, 0, 0, 1, 1,
0.3517044, -1.799225, 3.04906, 1, 1, 1, 1, 1,
0.3528937, 2.225676, -1.430191, 1, 1, 1, 1, 1,
0.3570137, 1.626858, 2.152534, 1, 1, 1, 1, 1,
0.3601688, 2.298134, -0.2381021, 1, 1, 1, 1, 1,
0.3604272, 0.5749285, 1.274074, 1, 1, 1, 1, 1,
0.3642248, -0.2740453, 3.331008, 1, 1, 1, 1, 1,
0.3642597, 0.1543154, 2.433732, 1, 1, 1, 1, 1,
0.3651497, 0.1470785, 0.4203534, 1, 1, 1, 1, 1,
0.3659074, 0.6141645, -0.06411715, 1, 1, 1, 1, 1,
0.3687587, -2.335154, 4.721173, 1, 1, 1, 1, 1,
0.3724948, -1.443814, 2.454268, 1, 1, 1, 1, 1,
0.3734231, 1.300743, 1.786883, 1, 1, 1, 1, 1,
0.3746931, 1.39492, -0.05919946, 1, 1, 1, 1, 1,
0.3763934, -0.7633534, 3.036186, 1, 1, 1, 1, 1,
0.3770452, -0.07275774, 1.913023, 1, 1, 1, 1, 1,
0.3788513, 0.2430134, 1.502477, 0, 0, 1, 1, 1,
0.3794188, 0.7364453, 1.00593, 1, 0, 0, 1, 1,
0.3799455, -0.2995674, 1.875245, 1, 0, 0, 1, 1,
0.3840698, -0.2956651, 2.508389, 1, 0, 0, 1, 1,
0.3906048, 0.4513625, 0.9823872, 1, 0, 0, 1, 1,
0.3921595, 0.5913938, 2.819878, 1, 0, 0, 1, 1,
0.393087, -1.049929, 0.5709789, 0, 0, 0, 1, 1,
0.3957459, -1.720556, 1.394281, 0, 0, 0, 1, 1,
0.3960455, 2.164717, -0.4660918, 0, 0, 0, 1, 1,
0.3962543, -1.1444, 3.555521, 0, 0, 0, 1, 1,
0.3972701, 2.436431, -0.9162927, 0, 0, 0, 1, 1,
0.3989292, 0.2108689, -1.07564, 0, 0, 0, 1, 1,
0.400979, 0.2393774, 2.367194, 0, 0, 0, 1, 1,
0.4017208, 1.764033, 0.7155375, 1, 1, 1, 1, 1,
0.4084295, 1.218089, -1.403247, 1, 1, 1, 1, 1,
0.4108516, -0.7861177, 2.35369, 1, 1, 1, 1, 1,
0.4124985, 1.802775, 0.8673676, 1, 1, 1, 1, 1,
0.414097, 0.3928581, 0.08859329, 1, 1, 1, 1, 1,
0.4155041, -0.3655319, 3.58411, 1, 1, 1, 1, 1,
0.4178716, 0.2831145, 0.3442786, 1, 1, 1, 1, 1,
0.4182392, -1.00531, 3.811687, 1, 1, 1, 1, 1,
0.4218119, -0.6190663, 2.370566, 1, 1, 1, 1, 1,
0.4221984, 0.8632733, 1.545129, 1, 1, 1, 1, 1,
0.4250246, 0.145166, 2.839701, 1, 1, 1, 1, 1,
0.426476, -0.05929826, 3.104325, 1, 1, 1, 1, 1,
0.4300077, -0.5972162, 2.638745, 1, 1, 1, 1, 1,
0.4303364, 0.2777254, 1.22728, 1, 1, 1, 1, 1,
0.4304981, -1.750589, 0.9150075, 1, 1, 1, 1, 1,
0.4314035, 0.814972, 0.8418689, 0, 0, 1, 1, 1,
0.4382881, -1.106528, 3.531631, 1, 0, 0, 1, 1,
0.4434902, 0.5151962, 2.35153, 1, 0, 0, 1, 1,
0.444094, -1.246808, 3.160769, 1, 0, 0, 1, 1,
0.4463919, -0.6269507, 4.685842, 1, 0, 0, 1, 1,
0.4472659, 0.07699709, -0.803394, 1, 0, 0, 1, 1,
0.4526167, -1.419947, 3.445026, 0, 0, 0, 1, 1,
0.4528531, 0.008233205, 0.4919201, 0, 0, 0, 1, 1,
0.4586824, 0.4148685, 0.152862, 0, 0, 0, 1, 1,
0.4611018, 1.030746, 0.1315059, 0, 0, 0, 1, 1,
0.4690034, -0.4451564, 1.851119, 0, 0, 0, 1, 1,
0.4736746, -0.2076182, 1.103367, 0, 0, 0, 1, 1,
0.4762257, -0.3427756, 3.014236, 0, 0, 0, 1, 1,
0.4775507, 1.404527, -1.401941, 1, 1, 1, 1, 1,
0.4830309, -0.9689407, 0.3110065, 1, 1, 1, 1, 1,
0.4830486, -1.740772, 2.553344, 1, 1, 1, 1, 1,
0.4837464, 1.198999, 1.981245, 1, 1, 1, 1, 1,
0.4881023, -0.1744191, 2.306444, 1, 1, 1, 1, 1,
0.4903996, -0.08264734, 2.548908, 1, 1, 1, 1, 1,
0.4964263, 0.6842655, -0.3156102, 1, 1, 1, 1, 1,
0.4999947, -0.7644457, 3.383373, 1, 1, 1, 1, 1,
0.5000773, -1.469265, 3.232257, 1, 1, 1, 1, 1,
0.5141845, -0.03424362, 2.927187, 1, 1, 1, 1, 1,
0.5183176, 0.9356713, 1.74306, 1, 1, 1, 1, 1,
0.5213528, -0.1072579, 1.627985, 1, 1, 1, 1, 1,
0.5221776, 1.360772, -0.2906925, 1, 1, 1, 1, 1,
0.5283558, 0.4674974, 0.2319097, 1, 1, 1, 1, 1,
0.5292898, -1.508717, 3.874519, 1, 1, 1, 1, 1,
0.5374312, 1.899346, 0.3353258, 0, 0, 1, 1, 1,
0.5394043, 1.297417, -0.7582267, 1, 0, 0, 1, 1,
0.539659, -0.8632424, 2.217108, 1, 0, 0, 1, 1,
0.5407392, -1.157977, 1.780865, 1, 0, 0, 1, 1,
0.5420737, -0.6204553, 3.482157, 1, 0, 0, 1, 1,
0.5432484, 2.649469, -0.3637435, 1, 0, 0, 1, 1,
0.5502243, -0.1974505, 1.707463, 0, 0, 0, 1, 1,
0.550718, -1.300086, 2.742935, 0, 0, 0, 1, 1,
0.5557164, -2.275731, 2.974894, 0, 0, 0, 1, 1,
0.5570408, -0.8257366, 2.074748, 0, 0, 0, 1, 1,
0.5573239, -0.7433785, 0.9619285, 0, 0, 0, 1, 1,
0.5590776, 0.5190983, 1.191509, 0, 0, 0, 1, 1,
0.5593566, 0.6680432, 2.173288, 0, 0, 0, 1, 1,
0.5622622, -1.008955, 2.707411, 1, 1, 1, 1, 1,
0.5645392, -0.2954647, 3.114403, 1, 1, 1, 1, 1,
0.5661955, 0.3410716, 1.907559, 1, 1, 1, 1, 1,
0.5850458, 0.6088504, 1.647489, 1, 1, 1, 1, 1,
0.5880778, -1.389043, 2.403794, 1, 1, 1, 1, 1,
0.5881554, -0.2674552, 4.063745, 1, 1, 1, 1, 1,
0.5900764, -0.2425558, 1.642734, 1, 1, 1, 1, 1,
0.5967854, 0.9083316, -0.7696244, 1, 1, 1, 1, 1,
0.5976515, -0.5804715, 0.8539276, 1, 1, 1, 1, 1,
0.6011176, 0.4081165, 0.2629992, 1, 1, 1, 1, 1,
0.6027305, -1.82225, 4.138628, 1, 1, 1, 1, 1,
0.605218, 2.123331, 1.516536, 1, 1, 1, 1, 1,
0.605399, -1.97267, 1.671094, 1, 1, 1, 1, 1,
0.6069663, -1.79998, 3.851767, 1, 1, 1, 1, 1,
0.6076961, -1.140977, 2.542768, 1, 1, 1, 1, 1,
0.6123915, -0.4617342, 2.110713, 0, 0, 1, 1, 1,
0.6209298, 1.33872, 0.263575, 1, 0, 0, 1, 1,
0.6223625, -1.365356, 3.608361, 1, 0, 0, 1, 1,
0.6263035, -0.5584748, 1.952841, 1, 0, 0, 1, 1,
0.6318091, -0.7818754, 3.299559, 1, 0, 0, 1, 1,
0.6342189, 0.06222833, -0.9973163, 1, 0, 0, 1, 1,
0.6347121, -0.3037397, 1.655733, 0, 0, 0, 1, 1,
0.6373619, -0.7052051, 2.491056, 0, 0, 0, 1, 1,
0.6394493, -0.769908, 1.852929, 0, 0, 0, 1, 1,
0.6450168, -0.06760378, 0.6912516, 0, 0, 0, 1, 1,
0.6477034, -0.3562631, 2.011084, 0, 0, 0, 1, 1,
0.6498774, -0.5654417, 0.6521078, 0, 0, 0, 1, 1,
0.6517944, 1.135361, 0.8443736, 0, 0, 0, 1, 1,
0.6520602, 0.1554407, 2.279319, 1, 1, 1, 1, 1,
0.6550161, -1.157395, 1.699788, 1, 1, 1, 1, 1,
0.6590914, 0.04251151, 1.242774, 1, 1, 1, 1, 1,
0.6631992, -0.009561947, 0.6109771, 1, 1, 1, 1, 1,
0.6661826, -0.425565, 1.822231, 1, 1, 1, 1, 1,
0.6682281, 0.3258053, 1.979925, 1, 1, 1, 1, 1,
0.6706876, 1.858, 2.44374, 1, 1, 1, 1, 1,
0.6727378, -0.4650327, 1.025983, 1, 1, 1, 1, 1,
0.6759155, 0.0452272, 1.648099, 1, 1, 1, 1, 1,
0.6767924, -0.4249098, 0.4966263, 1, 1, 1, 1, 1,
0.6786134, -0.6765691, 1.813603, 1, 1, 1, 1, 1,
0.6796353, 0.9315969, 2.163578, 1, 1, 1, 1, 1,
0.6821661, -1.22728, 2.542494, 1, 1, 1, 1, 1,
0.6865625, 0.1454151, 1.491111, 1, 1, 1, 1, 1,
0.690114, -1.689096, 1.535075, 1, 1, 1, 1, 1,
0.6934229, -0.01394557, 2.225867, 0, 0, 1, 1, 1,
0.6947737, 0.3635213, 1.120049, 1, 0, 0, 1, 1,
0.6983497, -0.4426224, 3.215821, 1, 0, 0, 1, 1,
0.7053465, -0.1829961, 1.724319, 1, 0, 0, 1, 1,
0.7174269, -1.406632, 2.393442, 1, 0, 0, 1, 1,
0.7210531, 0.5031981, 0.2838027, 1, 0, 0, 1, 1,
0.7261283, -1.13666, 1.572519, 0, 0, 0, 1, 1,
0.7339098, -0.6734405, 0.3887214, 0, 0, 0, 1, 1,
0.7534118, 0.4906635, 1.172188, 0, 0, 0, 1, 1,
0.7578379, -1.557712, 3.962895, 0, 0, 0, 1, 1,
0.7602841, -0.3125148, 0.7536319, 0, 0, 0, 1, 1,
0.7604048, 1.009768, 1.854286, 0, 0, 0, 1, 1,
0.762076, -0.7144214, 1.870937, 0, 0, 0, 1, 1,
0.764139, -0.05244668, 1.796411, 1, 1, 1, 1, 1,
0.7696161, -0.7200974, 2.278798, 1, 1, 1, 1, 1,
0.7829788, 0.04890621, 1.391428, 1, 1, 1, 1, 1,
0.7867262, -1.143457, 2.380021, 1, 1, 1, 1, 1,
0.7867637, 2.173711, -0.2728429, 1, 1, 1, 1, 1,
0.7892382, -0.1870285, 1.976477, 1, 1, 1, 1, 1,
0.7919364, 0.2706368, 2.495595, 1, 1, 1, 1, 1,
0.797215, -2.450691, 3.318725, 1, 1, 1, 1, 1,
0.8011015, 0.5775147, 1.7668, 1, 1, 1, 1, 1,
0.8042488, -2.090933, 2.804773, 1, 1, 1, 1, 1,
0.8078716, -0.351822, 1.918466, 1, 1, 1, 1, 1,
0.8083272, -0.9622265, 2.388482, 1, 1, 1, 1, 1,
0.8214138, 0.8398607, -1.641341, 1, 1, 1, 1, 1,
0.8237063, -0.696431, 0.1699387, 1, 1, 1, 1, 1,
0.8250966, 1.178371, 0.4967077, 1, 1, 1, 1, 1,
0.8326361, -0.7316912, 3.092947, 0, 0, 1, 1, 1,
0.8327646, -0.7861035, 1.57066, 1, 0, 0, 1, 1,
0.8334194, -0.5661001, 1.372859, 1, 0, 0, 1, 1,
0.8344162, -1.940904, 0.625527, 1, 0, 0, 1, 1,
0.8400296, 0.0375246, 1.671152, 1, 0, 0, 1, 1,
0.8488584, 0.1069897, 1.462219, 1, 0, 0, 1, 1,
0.8561233, 0.8199767, -0.0726207, 0, 0, 0, 1, 1,
0.8622262, 0.3665511, 0.8101631, 0, 0, 0, 1, 1,
0.8623293, -0.5439662, 3.336145, 0, 0, 0, 1, 1,
0.8713241, -0.7071882, 3.583572, 0, 0, 0, 1, 1,
0.8726049, 0.6058941, -0.1113029, 0, 0, 0, 1, 1,
0.8757522, -1.281976, 3.632615, 0, 0, 0, 1, 1,
0.8779301, 0.5153066, 0.7983158, 0, 0, 0, 1, 1,
0.8779603, 2.457511, -0.1753765, 1, 1, 1, 1, 1,
0.8797602, -2.269045, 2.261021, 1, 1, 1, 1, 1,
0.8863249, -0.3176752, 1.241206, 1, 1, 1, 1, 1,
0.8915006, -0.4798301, 0.9609258, 1, 1, 1, 1, 1,
0.8930033, -2.078855, 1.287104, 1, 1, 1, 1, 1,
0.8933013, 1.25542, 1.85344, 1, 1, 1, 1, 1,
0.8981355, 0.2631987, 1.594084, 1, 1, 1, 1, 1,
0.9020252, -1.623948, 2.158876, 1, 1, 1, 1, 1,
0.9030853, -0.2428432, 2.664745, 1, 1, 1, 1, 1,
0.9050756, -1.127944, 2.468163, 1, 1, 1, 1, 1,
0.9058676, -0.4364328, 1.938513, 1, 1, 1, 1, 1,
0.9113322, 1.68723, 0.3927098, 1, 1, 1, 1, 1,
0.9114689, -0.4284169, 3.450613, 1, 1, 1, 1, 1,
0.9133331, -0.4040652, 1.027181, 1, 1, 1, 1, 1,
0.9186929, -1.039703, 2.813643, 1, 1, 1, 1, 1,
0.9190817, 1.622406, 0.9185912, 0, 0, 1, 1, 1,
0.9219909, -1.241107, 2.027594, 1, 0, 0, 1, 1,
0.9252441, 0.8509269, 1.091623, 1, 0, 0, 1, 1,
0.9285203, 1.379037, 1.201082, 1, 0, 0, 1, 1,
0.9299296, -0.4843788, 2.709339, 1, 0, 0, 1, 1,
0.9328542, -0.8156269, 0.7954397, 1, 0, 0, 1, 1,
0.937224, -1.054997, 1.34005, 0, 0, 0, 1, 1,
0.9486951, 1.227696, 1.085995, 0, 0, 0, 1, 1,
0.9557961, -0.7481614, 2.49091, 0, 0, 0, 1, 1,
0.9586806, 0.9367301, -1.103837, 0, 0, 0, 1, 1,
0.9600844, 1.47954, 1.729659, 0, 0, 0, 1, 1,
0.9631355, -0.4046721, 1.555564, 0, 0, 0, 1, 1,
0.9650734, 1.65, -0.3382168, 0, 0, 0, 1, 1,
0.983619, 0.2439936, 1.183212, 1, 1, 1, 1, 1,
0.987262, 0.9057636, 0.3357078, 1, 1, 1, 1, 1,
0.9932215, -1.083344, 1.925408, 1, 1, 1, 1, 1,
0.9935757, 0.3993812, -0.6115052, 1, 1, 1, 1, 1,
0.9982787, -1.117617, 1.166313, 1, 1, 1, 1, 1,
1.005142, -0.7571461, 3.182293, 1, 1, 1, 1, 1,
1.006911, 2.108681, -0.2494763, 1, 1, 1, 1, 1,
1.013524, -1.73689, 3.11288, 1, 1, 1, 1, 1,
1.017414, -1.095822, 1.863696, 1, 1, 1, 1, 1,
1.02895, 0.6666356, 1.63293, 1, 1, 1, 1, 1,
1.029253, 0.3670871, 1.996071, 1, 1, 1, 1, 1,
1.034642, -0.03092655, 0.8314692, 1, 1, 1, 1, 1,
1.036437, 1.758613, 0.6291643, 1, 1, 1, 1, 1,
1.037822, -0.7001615, 2.693847, 1, 1, 1, 1, 1,
1.049069, 0.7808436, 2.170143, 1, 1, 1, 1, 1,
1.049736, 0.2494868, 1.840585, 0, 0, 1, 1, 1,
1.056053, -1.433731, 1.888837, 1, 0, 0, 1, 1,
1.056657, 0.05035327, 1.654715, 1, 0, 0, 1, 1,
1.059442, 0.8246631, 1.871553, 1, 0, 0, 1, 1,
1.059675, 0.02560217, 1.218065, 1, 0, 0, 1, 1,
1.061032, -0.638298, 2.050142, 1, 0, 0, 1, 1,
1.066044, -0.1133224, 0.08882815, 0, 0, 0, 1, 1,
1.07645, -0.4502953, 2.055624, 0, 0, 0, 1, 1,
1.077305, 0.3039437, 4.305535, 0, 0, 0, 1, 1,
1.081879, 1.001022, 2.018108, 0, 0, 0, 1, 1,
1.084087, -0.0216614, 0.5949984, 0, 0, 0, 1, 1,
1.088074, -1.057955, 2.98022, 0, 0, 0, 1, 1,
1.091346, 0.370154, 0.6648126, 0, 0, 0, 1, 1,
1.099247, 0.2971021, 0.9263725, 1, 1, 1, 1, 1,
1.102452, -0.8818799, 1.944176, 1, 1, 1, 1, 1,
1.104677, 0.2770421, 3.122753, 1, 1, 1, 1, 1,
1.121411, -0.5069075, 2.596911, 1, 1, 1, 1, 1,
1.123274, -0.5984398, 2.633555, 1, 1, 1, 1, 1,
1.1335, -0.1774225, 2.026834, 1, 1, 1, 1, 1,
1.143271, 1.324471, 1.14262, 1, 1, 1, 1, 1,
1.14739, -1.671391, 2.121755, 1, 1, 1, 1, 1,
1.157607, 0.6661756, 0.9326401, 1, 1, 1, 1, 1,
1.171574, -0.7183841, 2.959965, 1, 1, 1, 1, 1,
1.173933, -0.2017612, 2.596902, 1, 1, 1, 1, 1,
1.179998, 1.643013, 0.8007051, 1, 1, 1, 1, 1,
1.206546, 0.4093362, 0.7976061, 1, 1, 1, 1, 1,
1.206706, 1.642918, 1.161125, 1, 1, 1, 1, 1,
1.22164, -0.4477436, -0.5772948, 1, 1, 1, 1, 1,
1.23364, 0.2004012, -1.100242, 0, 0, 1, 1, 1,
1.245392, 0.2446277, 2.607836, 1, 0, 0, 1, 1,
1.248109, 0.3205605, 0.1449878, 1, 0, 0, 1, 1,
1.250162, -2.00465, 1.755598, 1, 0, 0, 1, 1,
1.250341, -0.000451973, 2.188763, 1, 0, 0, 1, 1,
1.266308, 2.037183, 0.280484, 1, 0, 0, 1, 1,
1.267421, 0.3894542, -0.2891343, 0, 0, 0, 1, 1,
1.272835, 0.09139583, 1.783009, 0, 0, 0, 1, 1,
1.27388, -0.4810499, -0.01395153, 0, 0, 0, 1, 1,
1.281005, 1.036582, -0.3087016, 0, 0, 0, 1, 1,
1.28641, -1.029146, 2.961922, 0, 0, 0, 1, 1,
1.290824, 2.719592, 1.100755, 0, 0, 0, 1, 1,
1.297017, -0.7879027, 3.580085, 0, 0, 0, 1, 1,
1.298757, -0.1136281, 2.069978, 1, 1, 1, 1, 1,
1.301804, 0.7230831, 0.5950204, 1, 1, 1, 1, 1,
1.310412, 0.1223392, -0.01822314, 1, 1, 1, 1, 1,
1.311703, -0.7682183, 1.964533, 1, 1, 1, 1, 1,
1.320461, 2.133823, 1.509812, 1, 1, 1, 1, 1,
1.323313, -0.9316899, 1.023036, 1, 1, 1, 1, 1,
1.32496, -0.3724009, 1.563383, 1, 1, 1, 1, 1,
1.332275, -0.1886834, 1.255507, 1, 1, 1, 1, 1,
1.333713, -1.044811, 2.931626, 1, 1, 1, 1, 1,
1.344136, 0.9191524, 1.628646, 1, 1, 1, 1, 1,
1.345015, 1.260609, -0.8104051, 1, 1, 1, 1, 1,
1.360258, -0.09378616, 1.254283, 1, 1, 1, 1, 1,
1.364348, 3.62135, 1.957022, 1, 1, 1, 1, 1,
1.378741, 0.7899956, -0.4398619, 1, 1, 1, 1, 1,
1.380367, -1.046997, 2.4229, 1, 1, 1, 1, 1,
1.382756, -1.232671, 3.177544, 0, 0, 1, 1, 1,
1.383197, -1.408201, 1.16687, 1, 0, 0, 1, 1,
1.385799, 0.410542, 0.1155278, 1, 0, 0, 1, 1,
1.397272, 0.3070026, 1.689182, 1, 0, 0, 1, 1,
1.403851, -2.457616, 2.6943, 1, 0, 0, 1, 1,
1.406052, 0.1677753, 1.167775, 1, 0, 0, 1, 1,
1.414649, -0.1162538, 1.36382, 0, 0, 0, 1, 1,
1.422703, -1.540377, 1.027626, 0, 0, 0, 1, 1,
1.42631, -0.520049, 0.5505534, 0, 0, 0, 1, 1,
1.453272, 1.139352, 1.714827, 0, 0, 0, 1, 1,
1.456889, 0.07586132, 0.1639154, 0, 0, 0, 1, 1,
1.469343, -1.328093, 1.261662, 0, 0, 0, 1, 1,
1.493541, 0.416662, 0.6366141, 0, 0, 0, 1, 1,
1.503662, -1.174144, 2.26649, 1, 1, 1, 1, 1,
1.509198, -0.6367579, 3.208961, 1, 1, 1, 1, 1,
1.511026, 0.7620574, 1.091163, 1, 1, 1, 1, 1,
1.5112, 0.6657833, 0.9862393, 1, 1, 1, 1, 1,
1.522176, 0.9587616, -0.4437365, 1, 1, 1, 1, 1,
1.524178, 1.772979, 1.650291, 1, 1, 1, 1, 1,
1.533998, -1.167542, 0.8623306, 1, 1, 1, 1, 1,
1.538121, -0.3377426, 2.227268, 1, 1, 1, 1, 1,
1.558314, -0.2414015, 1.629789, 1, 1, 1, 1, 1,
1.566108, -0.4012896, 2.72557, 1, 1, 1, 1, 1,
1.573694, 0.2138261, 1.521861, 1, 1, 1, 1, 1,
1.581055, 1.136902, -0.660292, 1, 1, 1, 1, 1,
1.591932, 0.4902506, -0.1492146, 1, 1, 1, 1, 1,
1.595541, 1.380107, 0.8078774, 1, 1, 1, 1, 1,
1.59671, -0.1654262, -1.467481, 1, 1, 1, 1, 1,
1.597201, 0.4628532, 2.34602, 0, 0, 1, 1, 1,
1.600671, -0.0023976, 1.02674, 1, 0, 0, 1, 1,
1.601235, -0.389577, 3.078729, 1, 0, 0, 1, 1,
1.612291, 0.3122648, 1.261498, 1, 0, 0, 1, 1,
1.621883, -1.020031, 2.485419, 1, 0, 0, 1, 1,
1.639215, -0.01257164, 1.789067, 1, 0, 0, 1, 1,
1.645462, 1.355959, 1.402876, 0, 0, 0, 1, 1,
1.645501, -0.724912, 1.890591, 0, 0, 0, 1, 1,
1.651801, 0.7031043, 2.721603, 0, 0, 0, 1, 1,
1.664816, -0.1984193, 2.301729, 0, 0, 0, 1, 1,
1.671534, -0.8795583, 1.007666, 0, 0, 0, 1, 1,
1.71569, -0.097858, 1.001462, 0, 0, 0, 1, 1,
1.725787, 1.082356, 0.508314, 0, 0, 0, 1, 1,
1.7357, 0.6224319, 1.029612, 1, 1, 1, 1, 1,
1.757582, 0.3274058, 2.181168, 1, 1, 1, 1, 1,
1.791105, 2.402301, 0.1191089, 1, 1, 1, 1, 1,
1.802736, -1.140202, 1.405666, 1, 1, 1, 1, 1,
1.820062, 1.171786, -1.098478, 1, 1, 1, 1, 1,
1.845163, -0.1330625, 0.07614279, 1, 1, 1, 1, 1,
1.846712, 0.2022737, 1.004879, 1, 1, 1, 1, 1,
1.863794, -0.4139613, 2.136623, 1, 1, 1, 1, 1,
1.874972, -0.0001586644, 2.194715, 1, 1, 1, 1, 1,
1.892218, 1.493489, 0.06826639, 1, 1, 1, 1, 1,
1.9096, -0.3122503, 3.071879, 1, 1, 1, 1, 1,
1.95611, 0.4447075, 2.428509, 1, 1, 1, 1, 1,
1.962522, 0.1352427, 0.2722677, 1, 1, 1, 1, 1,
1.986471, 1.353392, -0.06931935, 1, 1, 1, 1, 1,
2.012029, -0.8822113, 1.864003, 1, 1, 1, 1, 1,
2.012788, 0.03223915, 1.79578, 0, 0, 1, 1, 1,
2.03045, 0.5259194, 0.7701507, 1, 0, 0, 1, 1,
2.034047, -0.06536724, 2.373834, 1, 0, 0, 1, 1,
2.055221, 2.809616, 0.08038608, 1, 0, 0, 1, 1,
2.065206, -0.9524923, 1.68364, 1, 0, 0, 1, 1,
2.097784, 0.9579539, 1.284184, 1, 0, 0, 1, 1,
2.120798, 0.3228832, 0.7908442, 0, 0, 0, 1, 1,
2.122703, 2.575556, 0.4346114, 0, 0, 0, 1, 1,
2.126124, -0.6934103, 2.473913, 0, 0, 0, 1, 1,
2.294328, -0.8764597, 4.491381, 0, 0, 0, 1, 1,
2.302666, 0.2159747, 1.511321, 0, 0, 0, 1, 1,
2.424605, -0.7879207, 2.014113, 0, 0, 0, 1, 1,
2.442433, 0.1439057, 1.632286, 0, 0, 0, 1, 1,
2.48164, -0.4129722, 1.093797, 1, 1, 1, 1, 1,
2.509706, 1.437273, 1.491092, 1, 1, 1, 1, 1,
2.617316, 0.4470243, 0.2624445, 1, 1, 1, 1, 1,
2.731219, 0.6583058, -0.001432744, 1, 1, 1, 1, 1,
2.742675, 1.031118, 0.3800038, 1, 1, 1, 1, 1,
2.792223, -0.8881174, 1.190187, 1, 1, 1, 1, 1,
3.177021, -1.598084, 3.210229, 1, 1, 1, 1, 1
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
var radius = 9.458082;
var distance = 33.22111;
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
mvMatrix.translate( -0.1116443, -0.1499808, 0.1587198 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.22111);
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
