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
-3.233374, 1.265023, -2.111647, 1, 0, 0, 1,
-2.841735, -0.1393823, -1.366668, 1, 0.007843138, 0, 1,
-2.671541, 0.7748418, -1.139881, 1, 0.01176471, 0, 1,
-2.549238, 0.9656132, -0.3146303, 1, 0.01960784, 0, 1,
-2.485114, -0.5877594, -1.123069, 1, 0.02352941, 0, 1,
-2.354689, -0.1703697, -1.093463, 1, 0.03137255, 0, 1,
-2.163018, 0.2602854, -1.200228, 1, 0.03529412, 0, 1,
-2.153085, 0.2303018, -1.195759, 1, 0.04313726, 0, 1,
-2.138956, -0.0388407, -1.978329, 1, 0.04705882, 0, 1,
-2.119289, 1.798107, -1.300373, 1, 0.05490196, 0, 1,
-2.117047, 0.262338, -2.067668, 1, 0.05882353, 0, 1,
-2.098303, 0.5720324, -1.66595, 1, 0.06666667, 0, 1,
-2.093902, -0.3186413, -2.010232, 1, 0.07058824, 0, 1,
-2.04454, -1.518042, -0.9367407, 1, 0.07843138, 0, 1,
-2.038762, -0.9756496, -1.599773, 1, 0.08235294, 0, 1,
-2.035943, 0.3245972, -3.164688, 1, 0.09019608, 0, 1,
-2.019296, 0.4551015, -0.01010105, 1, 0.09411765, 0, 1,
-2.002905, -0.5456547, -2.042233, 1, 0.1019608, 0, 1,
-2.001059, 0.2659773, -1.464939, 1, 0.1098039, 0, 1,
-1.988538, -0.8041484, -1.535868, 1, 0.1137255, 0, 1,
-1.987735, 0.9563054, -1.291839, 1, 0.1215686, 0, 1,
-1.962457, 0.3095943, -2.219926, 1, 0.1254902, 0, 1,
-1.961162, 1.062745, -0.6224202, 1, 0.1333333, 0, 1,
-1.952209, -1.174443, -2.706365, 1, 0.1372549, 0, 1,
-1.934922, -0.1578101, -0.7317939, 1, 0.145098, 0, 1,
-1.907155, -2.452921, -3.155751, 1, 0.1490196, 0, 1,
-1.900172, 0.2113577, -0.8041497, 1, 0.1568628, 0, 1,
-1.899899, 1.840658, -1.77265, 1, 0.1607843, 0, 1,
-1.897398, 0.5289331, -1.935861, 1, 0.1686275, 0, 1,
-1.894381, -1.062413, -0.459506, 1, 0.172549, 0, 1,
-1.88287, 0.007795435, -1.253186, 1, 0.1803922, 0, 1,
-1.87743, -0.2444515, -0.5156732, 1, 0.1843137, 0, 1,
-1.865117, 1.119258, -1.787074, 1, 0.1921569, 0, 1,
-1.861494, -1.238178, -1.916891, 1, 0.1960784, 0, 1,
-1.835183, 1.444859, -1.722552, 1, 0.2039216, 0, 1,
-1.82688, 0.9114535, 0.4598165, 1, 0.2117647, 0, 1,
-1.818588, 0.2308535, -2.233334, 1, 0.2156863, 0, 1,
-1.805762, -2.931708, -2.734988, 1, 0.2235294, 0, 1,
-1.802198, 1.71693, -1.060704, 1, 0.227451, 0, 1,
-1.792632, -0.4044735, -2.822325, 1, 0.2352941, 0, 1,
-1.780459, -0.8113373, -0.7897707, 1, 0.2392157, 0, 1,
-1.758504, -0.2392805, -2.658511, 1, 0.2470588, 0, 1,
-1.748058, -0.8648673, -0.9198676, 1, 0.2509804, 0, 1,
-1.73826, -1.750731, -2.459003, 1, 0.2588235, 0, 1,
-1.730229, -1.078382, -2.080975, 1, 0.2627451, 0, 1,
-1.729633, 0.4017449, -1.902548, 1, 0.2705882, 0, 1,
-1.726739, 1.299214, -0.2209143, 1, 0.2745098, 0, 1,
-1.700758, 0.8790811, -1.506795, 1, 0.282353, 0, 1,
-1.646448, 1.155694, 0.6403016, 1, 0.2862745, 0, 1,
-1.638968, 0.8328636, -1.96349, 1, 0.2941177, 0, 1,
-1.623065, 0.4917966, -1.058598, 1, 0.3019608, 0, 1,
-1.618914, -0.4939345, -1.426917, 1, 0.3058824, 0, 1,
-1.607358, -1.330271, -2.499407, 1, 0.3137255, 0, 1,
-1.60724, 1.568782, -2.110928, 1, 0.3176471, 0, 1,
-1.603845, -1.294232, -1.766864, 1, 0.3254902, 0, 1,
-1.594269, -1.730399, -3.172071, 1, 0.3294118, 0, 1,
-1.591357, -0.3538807, -1.912598, 1, 0.3372549, 0, 1,
-1.583635, 0.373055, -0.375398, 1, 0.3411765, 0, 1,
-1.582434, 2.367141, -0.1690995, 1, 0.3490196, 0, 1,
-1.576043, 0.2192936, -1.358629, 1, 0.3529412, 0, 1,
-1.574371, -0.3009278, -2.20391, 1, 0.3607843, 0, 1,
-1.571512, -0.6358895, -3.03317, 1, 0.3647059, 0, 1,
-1.547439, -0.9328682, -3.510431, 1, 0.372549, 0, 1,
-1.528077, 1.122877, -1.692975, 1, 0.3764706, 0, 1,
-1.524323, -0.9027874, -4.353714, 1, 0.3843137, 0, 1,
-1.518858, 1.22876, -2.553671, 1, 0.3882353, 0, 1,
-1.514402, -0.1381399, -0.9968432, 1, 0.3960784, 0, 1,
-1.49696, 0.4839349, -1.733239, 1, 0.4039216, 0, 1,
-1.49537, -0.3177318, -1.256043, 1, 0.4078431, 0, 1,
-1.495215, -0.1185965, -2.752263, 1, 0.4156863, 0, 1,
-1.489747, -0.06191903, -1.085002, 1, 0.4196078, 0, 1,
-1.487285, 0.3417103, -0.8871387, 1, 0.427451, 0, 1,
-1.484462, 3.063199, -1.039312, 1, 0.4313726, 0, 1,
-1.482518, -1.515862, -2.203956, 1, 0.4392157, 0, 1,
-1.481982, 0.9320347, 0.3025246, 1, 0.4431373, 0, 1,
-1.476995, -0.6223606, -3.611167, 1, 0.4509804, 0, 1,
-1.462352, -0.4397725, -3.563798, 1, 0.454902, 0, 1,
-1.456311, -0.3454264, -3.234375, 1, 0.4627451, 0, 1,
-1.451163, -0.9124681, -1.692214, 1, 0.4666667, 0, 1,
-1.434738, 0.06914521, -1.384127, 1, 0.4745098, 0, 1,
-1.434124, 0.2329697, -2.047861, 1, 0.4784314, 0, 1,
-1.417608, -0.1986995, -1.360043, 1, 0.4862745, 0, 1,
-1.399429, 0.5898056, -0.5569992, 1, 0.4901961, 0, 1,
-1.396311, 2.920892, -1.709433, 1, 0.4980392, 0, 1,
-1.389414, -1.351345, -2.628401, 1, 0.5058824, 0, 1,
-1.388695, -0.03410441, -2.89623, 1, 0.509804, 0, 1,
-1.381951, -2.162023, -2.904423, 1, 0.5176471, 0, 1,
-1.381212, -0.2057917, -2.561487, 1, 0.5215687, 0, 1,
-1.380694, -0.5585795, -1.597623, 1, 0.5294118, 0, 1,
-1.367957, -0.6968773, -1.526163, 1, 0.5333334, 0, 1,
-1.360295, 1.028031, -0.9131123, 1, 0.5411765, 0, 1,
-1.359453, -0.3822349, -2.786722, 1, 0.5450981, 0, 1,
-1.356171, -0.9208261, -2.120548, 1, 0.5529412, 0, 1,
-1.347515, 0.005501478, -2.457001, 1, 0.5568628, 0, 1,
-1.343524, 1.4528, -1.783531, 1, 0.5647059, 0, 1,
-1.342501, 0.3906989, -2.300093, 1, 0.5686275, 0, 1,
-1.33315, 0.2953947, -1.799698, 1, 0.5764706, 0, 1,
-1.332174, -0.2768766, 0.1440696, 1, 0.5803922, 0, 1,
-1.32024, 0.5731808, -1.156539, 1, 0.5882353, 0, 1,
-1.303998, -2.456764, -2.340665, 1, 0.5921569, 0, 1,
-1.294318, -0.2511654, -3.543523, 1, 0.6, 0, 1,
-1.275683, -0.6492683, -0.7961305, 1, 0.6078432, 0, 1,
-1.269269, -1.258272, -2.866879, 1, 0.6117647, 0, 1,
-1.264708, -1.784734, -0.345411, 1, 0.6196079, 0, 1,
-1.241805, -1.505177, -3.710992, 1, 0.6235294, 0, 1,
-1.23516, -0.02567835, -3.166845, 1, 0.6313726, 0, 1,
-1.233559, 2.86758, 0.5684142, 1, 0.6352941, 0, 1,
-1.231813, -1.04387, -2.594467, 1, 0.6431373, 0, 1,
-1.224952, 0.6157074, -0.3624183, 1, 0.6470588, 0, 1,
-1.218606, 0.2066313, 0.3456498, 1, 0.654902, 0, 1,
-1.217691, 0.2248544, 0.1168361, 1, 0.6588235, 0, 1,
-1.216188, 0.3888585, -2.915163, 1, 0.6666667, 0, 1,
-1.206822, 0.09707327, -0.2845589, 1, 0.6705883, 0, 1,
-1.203457, -0.1468922, -0.7813836, 1, 0.6784314, 0, 1,
-1.201153, 0.5103398, -2.031694, 1, 0.682353, 0, 1,
-1.199524, -0.6518881, -1.185167, 1, 0.6901961, 0, 1,
-1.191112, -1.500738, -3.755471, 1, 0.6941177, 0, 1,
-1.190437, -0.04085508, -2.379994, 1, 0.7019608, 0, 1,
-1.190335, 0.8917409, 0.3019749, 1, 0.7098039, 0, 1,
-1.190042, -0.1204243, -3.254393, 1, 0.7137255, 0, 1,
-1.188133, -1.356674, -3.01376, 1, 0.7215686, 0, 1,
-1.186997, -0.6009331, -2.670085, 1, 0.7254902, 0, 1,
-1.182387, -1.712844, -2.116235, 1, 0.7333333, 0, 1,
-1.181499, -0.9995423, -1.072955, 1, 0.7372549, 0, 1,
-1.175967, 0.09257771, -0.4999494, 1, 0.7450981, 0, 1,
-1.169922, 0.7037854, -2.454594, 1, 0.7490196, 0, 1,
-1.16937, -0.698302, -2.111289, 1, 0.7568628, 0, 1,
-1.156937, -0.4775794, -1.254682, 1, 0.7607843, 0, 1,
-1.156699, -0.07241857, -1.08492, 1, 0.7686275, 0, 1,
-1.155035, -0.185336, -2.220177, 1, 0.772549, 0, 1,
-1.152444, -0.5689325, -2.004298, 1, 0.7803922, 0, 1,
-1.145276, -0.7230281, -2.307991, 1, 0.7843137, 0, 1,
-1.139743, -1.146176, -3.080568, 1, 0.7921569, 0, 1,
-1.126095, -1.887399, -2.866482, 1, 0.7960784, 0, 1,
-1.112807, 0.4137319, -0.9137018, 1, 0.8039216, 0, 1,
-1.110133, -0.6644694, -1.331418, 1, 0.8117647, 0, 1,
-1.109976, 0.0801469, -2.503634, 1, 0.8156863, 0, 1,
-1.103548, 0.8445857, -2.022952, 1, 0.8235294, 0, 1,
-1.0988, 0.6868624, -1.835589, 1, 0.827451, 0, 1,
-1.094365, 0.1091076, 0.02804616, 1, 0.8352941, 0, 1,
-1.084478, 0.4137529, -1.759331, 1, 0.8392157, 0, 1,
-1.0785, -0.1388407, -2.678384, 1, 0.8470588, 0, 1,
-1.076478, -0.9939853, -4.244841, 1, 0.8509804, 0, 1,
-1.074201, -0.09062701, -1.009275, 1, 0.8588235, 0, 1,
-1.072503, 0.6545966, -2.033737, 1, 0.8627451, 0, 1,
-1.066189, -0.1020704, -2.068288, 1, 0.8705882, 0, 1,
-1.062332, 0.1562929, -0.5982639, 1, 0.8745098, 0, 1,
-1.058446, 0.2925015, -1.449308, 1, 0.8823529, 0, 1,
-1.056762, -0.9209674, -2.807176, 1, 0.8862745, 0, 1,
-1.043546, 0.5567783, -1.517074, 1, 0.8941177, 0, 1,
-1.029466, 0.3392038, -0.4342453, 1, 0.8980392, 0, 1,
-1.024106, 1.726863, -0.6340239, 1, 0.9058824, 0, 1,
-1.017111, 0.9157853, -2.256324, 1, 0.9137255, 0, 1,
-1.015954, -0.1932847, -4.204049, 1, 0.9176471, 0, 1,
-1.014487, 0.1464105, -2.696828, 1, 0.9254902, 0, 1,
-1.00945, 1.942369, -0.06314927, 1, 0.9294118, 0, 1,
-1.003439, -0.7161087, -1.369731, 1, 0.9372549, 0, 1,
-0.9989226, -1.239284, -3.537257, 1, 0.9411765, 0, 1,
-0.9907222, -0.3043481, -2.78594, 1, 0.9490196, 0, 1,
-0.9803873, 0.2110902, -0.4793212, 1, 0.9529412, 0, 1,
-0.9789107, -0.005959862, -1.286634, 1, 0.9607843, 0, 1,
-0.9712188, 2.106252, 0.8737305, 1, 0.9647059, 0, 1,
-0.9685979, -0.3380915, -2.261374, 1, 0.972549, 0, 1,
-0.9683192, 2.464041, 0.005564844, 1, 0.9764706, 0, 1,
-0.9569941, 0.2426164, -2.556175, 1, 0.9843137, 0, 1,
-0.9550917, 0.1695856, -0.6903336, 1, 0.9882353, 0, 1,
-0.9512026, -0.2439838, -2.109863, 1, 0.9960784, 0, 1,
-0.9480928, -0.1858672, -1.660939, 0.9960784, 1, 0, 1,
-0.9450426, -0.2608983, 0.6660454, 0.9921569, 1, 0, 1,
-0.9403346, 0.3946624, -2.583192, 0.9843137, 1, 0, 1,
-0.9349161, 0.6738678, -0.6601669, 0.9803922, 1, 0, 1,
-0.9337962, -0.2175059, -3.344344, 0.972549, 1, 0, 1,
-0.9329326, -1.396678, -4.064507, 0.9686275, 1, 0, 1,
-0.9321741, 1.022916, -0.303079, 0.9607843, 1, 0, 1,
-0.9311789, -1.119203, -1.697738, 0.9568627, 1, 0, 1,
-0.9282192, -2.039164, -2.404179, 0.9490196, 1, 0, 1,
-0.9280904, 0.3804638, -0.5930319, 0.945098, 1, 0, 1,
-0.9257979, -0.04561822, -0.5818545, 0.9372549, 1, 0, 1,
-0.9257154, 0.06340972, -0.6509208, 0.9333333, 1, 0, 1,
-0.9254082, -0.5557177, -3.287827, 0.9254902, 1, 0, 1,
-0.9178401, 0.1847775, -1.39639, 0.9215686, 1, 0, 1,
-0.912784, 0.6601635, 1.227074, 0.9137255, 1, 0, 1,
-0.9016892, 0.1205462, -1.393974, 0.9098039, 1, 0, 1,
-0.9014534, -1.067533, -3.012352, 0.9019608, 1, 0, 1,
-0.8998382, 0.9668352, -1.447128, 0.8941177, 1, 0, 1,
-0.8987342, -0.9406837, -2.030225, 0.8901961, 1, 0, 1,
-0.8932064, -0.279119, -0.02398992, 0.8823529, 1, 0, 1,
-0.8911659, -0.8284277, -2.542083, 0.8784314, 1, 0, 1,
-0.8904845, -1.787462, -2.521196, 0.8705882, 1, 0, 1,
-0.8828068, -0.6066282, -1.359598, 0.8666667, 1, 0, 1,
-0.8805177, -0.4232591, -2.435769, 0.8588235, 1, 0, 1,
-0.873053, 0.649112, -0.9257231, 0.854902, 1, 0, 1,
-0.8711467, -0.8459025, -2.411721, 0.8470588, 1, 0, 1,
-0.8710033, -1.624158, -3.975734, 0.8431373, 1, 0, 1,
-0.8703603, -0.02747309, -1.567258, 0.8352941, 1, 0, 1,
-0.8659276, 0.9701985, -2.371463, 0.8313726, 1, 0, 1,
-0.8629957, 0.2610928, -0.5286031, 0.8235294, 1, 0, 1,
-0.86223, -0.1120243, -0.7995678, 0.8196079, 1, 0, 1,
-0.8601333, 0.09967288, -1.556118, 0.8117647, 1, 0, 1,
-0.8513497, -0.386899, -1.761893, 0.8078431, 1, 0, 1,
-0.8502753, -1.635809, -2.021884, 0.8, 1, 0, 1,
-0.8502628, 0.3605, -1.661968, 0.7921569, 1, 0, 1,
-0.8470243, -0.8422818, -2.17525, 0.7882353, 1, 0, 1,
-0.8412226, -0.4581254, -2.673395, 0.7803922, 1, 0, 1,
-0.8372759, 0.2181346, -0.8578082, 0.7764706, 1, 0, 1,
-0.8363151, -2.101538, -2.874513, 0.7686275, 1, 0, 1,
-0.8347205, 0.578723, -0.09409701, 0.7647059, 1, 0, 1,
-0.8335325, -1.277005, -3.974065, 0.7568628, 1, 0, 1,
-0.8247174, 0.3009207, -2.008075, 0.7529412, 1, 0, 1,
-0.8204724, 1.349275, 0.8551323, 0.7450981, 1, 0, 1,
-0.8191915, -0.4469551, -1.859767, 0.7411765, 1, 0, 1,
-0.8119041, -0.1688881, -1.867532, 0.7333333, 1, 0, 1,
-0.8090538, 1.220274, -1.252785, 0.7294118, 1, 0, 1,
-0.8083242, -0.1366052, -1.140506, 0.7215686, 1, 0, 1,
-0.8080001, 0.5725898, -2.516487, 0.7176471, 1, 0, 1,
-0.8032208, -0.5934721, -4.522356, 0.7098039, 1, 0, 1,
-0.7933121, 1.766165, -0.9993947, 0.7058824, 1, 0, 1,
-0.7891622, -1.001169, -1.643013, 0.6980392, 1, 0, 1,
-0.7883404, -0.5604764, -2.697054, 0.6901961, 1, 0, 1,
-0.7875379, 0.856401, -0.8632004, 0.6862745, 1, 0, 1,
-0.7866223, -1.061938, -0.2210555, 0.6784314, 1, 0, 1,
-0.7855315, -1.654485, -3.34767, 0.6745098, 1, 0, 1,
-0.7795606, -1.523214, -4.816297, 0.6666667, 1, 0, 1,
-0.7792311, 0.4251091, -1.871919, 0.6627451, 1, 0, 1,
-0.7771634, 0.8364986, 0.6821465, 0.654902, 1, 0, 1,
-0.7757018, 0.02303046, -2.323837, 0.6509804, 1, 0, 1,
-0.7659016, 1.082443, -0.9419296, 0.6431373, 1, 0, 1,
-0.765232, 0.4007383, -0.624166, 0.6392157, 1, 0, 1,
-0.7650706, -1.59872, -2.09483, 0.6313726, 1, 0, 1,
-0.7624768, 0.2325555, -2.397605, 0.627451, 1, 0, 1,
-0.7548264, 0.3667751, -2.807105, 0.6196079, 1, 0, 1,
-0.7533812, 1.623955, 1.048088, 0.6156863, 1, 0, 1,
-0.7499106, -1.611952, -2.267551, 0.6078432, 1, 0, 1,
-0.7480695, 1.892925, -0.3319979, 0.6039216, 1, 0, 1,
-0.7480549, 0.2821719, -1.918668, 0.5960785, 1, 0, 1,
-0.7461702, 1.798573, -0.6468161, 0.5882353, 1, 0, 1,
-0.7420758, 0.431886, -1.3829, 0.5843138, 1, 0, 1,
-0.7412264, -0.07356662, -3.601727, 0.5764706, 1, 0, 1,
-0.7393745, 0.1386872, -0.05202568, 0.572549, 1, 0, 1,
-0.7392067, -0.6345426, -1.201384, 0.5647059, 1, 0, 1,
-0.7349637, -0.5591484, -2.483949, 0.5607843, 1, 0, 1,
-0.7343068, 0.1000769, -1.637444, 0.5529412, 1, 0, 1,
-0.7314906, 0.4109048, -1.436413, 0.5490196, 1, 0, 1,
-0.7290348, -0.9154148, -2.640836, 0.5411765, 1, 0, 1,
-0.7273352, 2.012863, 2.049678, 0.5372549, 1, 0, 1,
-0.7270767, 0.4892329, -2.004636, 0.5294118, 1, 0, 1,
-0.7240984, 0.6220156, -1.795541, 0.5254902, 1, 0, 1,
-0.7231516, 1.042216, 0.4940052, 0.5176471, 1, 0, 1,
-0.704173, -0.5825974, -0.7598045, 0.5137255, 1, 0, 1,
-0.6989634, -0.1933792, -3.048038, 0.5058824, 1, 0, 1,
-0.6986225, 0.8003948, 0.6368971, 0.5019608, 1, 0, 1,
-0.6933204, 1.4428, -1.112596, 0.4941176, 1, 0, 1,
-0.6916221, -0.4521062, -0.3060764, 0.4862745, 1, 0, 1,
-0.6890835, 1.66241, -1.158159, 0.4823529, 1, 0, 1,
-0.6876673, -1.752733, -3.720577, 0.4745098, 1, 0, 1,
-0.6867066, -0.5540227, -4.434015, 0.4705882, 1, 0, 1,
-0.6848253, 0.5155061, -0.2840178, 0.4627451, 1, 0, 1,
-0.682721, -1.197873, -2.897193, 0.4588235, 1, 0, 1,
-0.6825475, -0.02621833, -0.5071936, 0.4509804, 1, 0, 1,
-0.6821103, 1.038531, -0.6665677, 0.4470588, 1, 0, 1,
-0.6782048, -0.3847317, -2.689106, 0.4392157, 1, 0, 1,
-0.6780198, -1.139316, -3.730523, 0.4352941, 1, 0, 1,
-0.6736668, -0.08352165, -3.775344, 0.427451, 1, 0, 1,
-0.6688672, -2.283819, -4.109017, 0.4235294, 1, 0, 1,
-0.6683076, -0.5000626, -2.355055, 0.4156863, 1, 0, 1,
-0.6650614, -0.4845908, -3.155903, 0.4117647, 1, 0, 1,
-0.6648638, -1.135777, -3.246187, 0.4039216, 1, 0, 1,
-0.6572537, -0.3378018, -1.810647, 0.3960784, 1, 0, 1,
-0.6566957, 0.0104143, -2.353486, 0.3921569, 1, 0, 1,
-0.6560591, -0.3102874, -2.891654, 0.3843137, 1, 0, 1,
-0.6530446, -1.529692, -1.883375, 0.3803922, 1, 0, 1,
-0.6485412, -0.0009604013, -2.003192, 0.372549, 1, 0, 1,
-0.6462932, -0.5135849, -2.092459, 0.3686275, 1, 0, 1,
-0.6401944, 1.381506, 0.2126722, 0.3607843, 1, 0, 1,
-0.6401761, 0.5141006, -1.434767, 0.3568628, 1, 0, 1,
-0.6388139, 0.8577098, -1.190678, 0.3490196, 1, 0, 1,
-0.6384159, -2.243944, -2.815893, 0.345098, 1, 0, 1,
-0.6360077, -0.8081155, -3.211636, 0.3372549, 1, 0, 1,
-0.6300504, -1.041014, -1.258302, 0.3333333, 1, 0, 1,
-0.6251535, -0.08321903, -0.1477891, 0.3254902, 1, 0, 1,
-0.6161168, 1.670338, -0.8807105, 0.3215686, 1, 0, 1,
-0.6146793, 2.265479, 0.2943591, 0.3137255, 1, 0, 1,
-0.6139898, -0.9102773, -4.112411, 0.3098039, 1, 0, 1,
-0.6116152, -1.279921, -4.08924, 0.3019608, 1, 0, 1,
-0.6083865, -0.329011, -1.999448, 0.2941177, 1, 0, 1,
-0.598703, 1.776422, -0.93292, 0.2901961, 1, 0, 1,
-0.5971112, -0.5959595, -2.469005, 0.282353, 1, 0, 1,
-0.584115, -1.017315, -2.973584, 0.2784314, 1, 0, 1,
-0.5836088, 0.6527473, 0.1932094, 0.2705882, 1, 0, 1,
-0.5785868, -1.4267, -2.089212, 0.2666667, 1, 0, 1,
-0.5785178, -0.2853751, 1.024848, 0.2588235, 1, 0, 1,
-0.5781184, 0.0554603, 0.5739356, 0.254902, 1, 0, 1,
-0.5740004, 0.1779415, -2.268171, 0.2470588, 1, 0, 1,
-0.573878, 0.4510763, -0.08989941, 0.2431373, 1, 0, 1,
-0.5722613, -0.407642, -2.627307, 0.2352941, 1, 0, 1,
-0.5658608, -0.926156, -2.288252, 0.2313726, 1, 0, 1,
-0.5636589, -0.8875549, -2.257421, 0.2235294, 1, 0, 1,
-0.5612206, 0.3922012, -2.647693, 0.2196078, 1, 0, 1,
-0.5605593, -0.4237468, -2.730866, 0.2117647, 1, 0, 1,
-0.5598192, 1.310771, -1.60049, 0.2078431, 1, 0, 1,
-0.5584262, -0.834971, -2.53805, 0.2, 1, 0, 1,
-0.5544806, -0.8130404, -1.935579, 0.1921569, 1, 0, 1,
-0.553394, -0.3792058, -2.395614, 0.1882353, 1, 0, 1,
-0.553122, 1.339979, -0.9962319, 0.1803922, 1, 0, 1,
-0.5385177, 0.1301928, -0.8640047, 0.1764706, 1, 0, 1,
-0.5312555, -0.8891902, -2.026865, 0.1686275, 1, 0, 1,
-0.52757, -0.05340772, -1.251877, 0.1647059, 1, 0, 1,
-0.5241774, -0.05410436, -2.455943, 0.1568628, 1, 0, 1,
-0.5238014, -1.03981, -3.701374, 0.1529412, 1, 0, 1,
-0.5234624, -2.071465, -2.829942, 0.145098, 1, 0, 1,
-0.5201659, 0.5522072, -1.010713, 0.1411765, 1, 0, 1,
-0.5169466, -0.8406425, -1.752472, 0.1333333, 1, 0, 1,
-0.51446, -0.5405011, -1.333311, 0.1294118, 1, 0, 1,
-0.5132343, -0.3248474, -3.94533, 0.1215686, 1, 0, 1,
-0.5076662, 0.7006344, 0.6669363, 0.1176471, 1, 0, 1,
-0.5067223, -0.4006934, -4.453172, 0.1098039, 1, 0, 1,
-0.5007643, -0.2485993, -1.946132, 0.1058824, 1, 0, 1,
-0.5007532, -0.7507213, -3.771211, 0.09803922, 1, 0, 1,
-0.5000263, 0.1295874, -2.57021, 0.09019608, 1, 0, 1,
-0.4996569, -0.3034176, -3.03555, 0.08627451, 1, 0, 1,
-0.498877, 1.508568, -1.374214, 0.07843138, 1, 0, 1,
-0.4987194, 0.1846185, -1.902946, 0.07450981, 1, 0, 1,
-0.4899472, -2.022921, -3.433562, 0.06666667, 1, 0, 1,
-0.4847874, 0.5766429, -2.36636, 0.0627451, 1, 0, 1,
-0.4842155, 1.304684, 0.5316229, 0.05490196, 1, 0, 1,
-0.4733734, 0.1102117, -0.2082209, 0.05098039, 1, 0, 1,
-0.4726163, -0.503124, -2.351526, 0.04313726, 1, 0, 1,
-0.4661497, -0.7023326, -3.569876, 0.03921569, 1, 0, 1,
-0.4659558, -0.5894852, -2.220153, 0.03137255, 1, 0, 1,
-0.4632015, 0.4233894, 0.4550233, 0.02745098, 1, 0, 1,
-0.4614745, 1.418418, -0.2251171, 0.01960784, 1, 0, 1,
-0.4590777, 0.01697873, -1.387103, 0.01568628, 1, 0, 1,
-0.4588617, -2.152768, -3.688934, 0.007843138, 1, 0, 1,
-0.4586157, -0.2605541, -1.525458, 0.003921569, 1, 0, 1,
-0.4581335, 1.027904, -0.4935067, 0, 1, 0.003921569, 1,
-0.4505289, -0.4093344, -2.275016, 0, 1, 0.01176471, 1,
-0.4497493, -0.31822, -1.091896, 0, 1, 0.01568628, 1,
-0.445764, 0.06800759, -1.068151, 0, 1, 0.02352941, 1,
-0.4393634, -1.417907, -4.878461, 0, 1, 0.02745098, 1,
-0.439094, -0.2414055, -3.106187, 0, 1, 0.03529412, 1,
-0.4389697, -0.4146668, -1.691335, 0, 1, 0.03921569, 1,
-0.4352383, -1.151061, -4.210209, 0, 1, 0.04705882, 1,
-0.4336315, -0.2658579, -1.963921, 0, 1, 0.05098039, 1,
-0.4317762, 1.168832, 0.3427059, 0, 1, 0.05882353, 1,
-0.4226241, -1.57306, -1.8234, 0, 1, 0.0627451, 1,
-0.4178729, 0.6886508, 0.5673957, 0, 1, 0.07058824, 1,
-0.4113916, 0.4260387, -1.332113, 0, 1, 0.07450981, 1,
-0.4100773, -1.744988, -4.450305, 0, 1, 0.08235294, 1,
-0.4089739, -0.3951484, -2.037781, 0, 1, 0.08627451, 1,
-0.4044521, -0.2846233, -2.078783, 0, 1, 0.09411765, 1,
-0.3942919, 0.02864716, -1.376199, 0, 1, 0.1019608, 1,
-0.3893264, -0.2417171, -3.731387, 0, 1, 0.1058824, 1,
-0.382736, 1.04648, -0.1958114, 0, 1, 0.1137255, 1,
-0.3805241, -1.67954, -4.249238, 0, 1, 0.1176471, 1,
-0.3776988, -0.4676431, -0.5882334, 0, 1, 0.1254902, 1,
-0.3750521, -0.307841, -1.490714, 0, 1, 0.1294118, 1,
-0.371545, -2.055731, -1.402743, 0, 1, 0.1372549, 1,
-0.3657991, -0.7551326, -1.625329, 0, 1, 0.1411765, 1,
-0.3637079, -0.5427275, -1.979115, 0, 1, 0.1490196, 1,
-0.3611161, -1.293745, -3.487216, 0, 1, 0.1529412, 1,
-0.3600886, -1.62236, -3.709939, 0, 1, 0.1607843, 1,
-0.35507, -0.5245439, -2.179307, 0, 1, 0.1647059, 1,
-0.349696, 0.9155511, 0.7912957, 0, 1, 0.172549, 1,
-0.3495016, 1.0912, -0.1460373, 0, 1, 0.1764706, 1,
-0.3479825, 0.9509652, 0.325115, 0, 1, 0.1843137, 1,
-0.3450834, 0.2587283, -0.6822036, 0, 1, 0.1882353, 1,
-0.3446859, 1.588277, -0.07073201, 0, 1, 0.1960784, 1,
-0.343675, -0.8357614, -2.485151, 0, 1, 0.2039216, 1,
-0.3416153, 1.444635, 0.6191067, 0, 1, 0.2078431, 1,
-0.3352939, 1.202167, -1.862445, 0, 1, 0.2156863, 1,
-0.3352472, -0.6809765, -2.205368, 0, 1, 0.2196078, 1,
-0.3321087, -1.32005, -3.354031, 0, 1, 0.227451, 1,
-0.3269083, -1.558007, -3.746133, 0, 1, 0.2313726, 1,
-0.3252992, -1.035952, -2.709656, 0, 1, 0.2392157, 1,
-0.3237891, 0.4543608, -0.02174491, 0, 1, 0.2431373, 1,
-0.3235555, -0.6841842, -1.826702, 0, 1, 0.2509804, 1,
-0.3218283, 1.795304, -0.6955047, 0, 1, 0.254902, 1,
-0.3147576, 0.6459703, -0.8916703, 0, 1, 0.2627451, 1,
-0.3114666, -2.163925, -1.254238, 0, 1, 0.2666667, 1,
-0.3090664, -0.1414357, -1.712998, 0, 1, 0.2745098, 1,
-0.3072167, 1.93376, 0.8878651, 0, 1, 0.2784314, 1,
-0.3050787, 1.314283, 0.4128324, 0, 1, 0.2862745, 1,
-0.3048467, 0.3391926, -0.8508866, 0, 1, 0.2901961, 1,
-0.3043116, -0.04400832, -0.9335819, 0, 1, 0.2980392, 1,
-0.3023914, 0.7365915, 0.5239511, 0, 1, 0.3058824, 1,
-0.2989735, 0.9597049, -1.876424, 0, 1, 0.3098039, 1,
-0.2984436, 1.110348, -0.2676361, 0, 1, 0.3176471, 1,
-0.2950396, -0.03679537, -1.258115, 0, 1, 0.3215686, 1,
-0.2941925, 0.4907682, -0.5229272, 0, 1, 0.3294118, 1,
-0.2937937, 0.7517318, 0.06862941, 0, 1, 0.3333333, 1,
-0.2920134, -0.6473479, -3.174035, 0, 1, 0.3411765, 1,
-0.290915, 1.285758, -0.05088222, 0, 1, 0.345098, 1,
-0.2851093, 0.6417621, -0.5313798, 0, 1, 0.3529412, 1,
-0.2807713, -0.6297565, 0.6618625, 0, 1, 0.3568628, 1,
-0.2778617, 0.6848034, 0.6008153, 0, 1, 0.3647059, 1,
-0.2736933, -0.9409324, -2.04359, 0, 1, 0.3686275, 1,
-0.2685202, 3.28672, 0.9504962, 0, 1, 0.3764706, 1,
-0.2648988, -0.3733422, -1.328984, 0, 1, 0.3803922, 1,
-0.2605421, 0.1305743, -1.534549, 0, 1, 0.3882353, 1,
-0.2454455, -0.4060813, -0.3900414, 0, 1, 0.3921569, 1,
-0.2434143, 0.5866104, -0.7787477, 0, 1, 0.4, 1,
-0.2384445, -0.2383223, -1.996144, 0, 1, 0.4078431, 1,
-0.226918, -0.1636938, -1.797018, 0, 1, 0.4117647, 1,
-0.2243043, 0.7638587, -0.0710749, 0, 1, 0.4196078, 1,
-0.2235371, -0.0915578, -2.704409, 0, 1, 0.4235294, 1,
-0.2228031, -1.837681, -3.640499, 0, 1, 0.4313726, 1,
-0.219369, 1.410103, 1.643876, 0, 1, 0.4352941, 1,
-0.2158479, 1.545907, -0.587812, 0, 1, 0.4431373, 1,
-0.2109635, -0.3425153, -0.07578882, 0, 1, 0.4470588, 1,
-0.2062352, -0.3376618, -0.4663676, 0, 1, 0.454902, 1,
-0.2053207, -0.649581, -1.828188, 0, 1, 0.4588235, 1,
-0.1991643, 1.453295, -1.047714, 0, 1, 0.4666667, 1,
-0.1981837, -0.9504979, -3.098647, 0, 1, 0.4705882, 1,
-0.197889, 0.8905182, -1.202674, 0, 1, 0.4784314, 1,
-0.1964072, 1.198581, -1.914564, 0, 1, 0.4823529, 1,
-0.1961967, 2.042789, -0.1331661, 0, 1, 0.4901961, 1,
-0.1961128, 0.01779423, -1.448638, 0, 1, 0.4941176, 1,
-0.18905, 1.712675, -0.691365, 0, 1, 0.5019608, 1,
-0.1847164, -0.6126823, -2.560063, 0, 1, 0.509804, 1,
-0.1830368, -0.7989308, -1.932555, 0, 1, 0.5137255, 1,
-0.1805966, -0.3524266, -1.755929, 0, 1, 0.5215687, 1,
-0.1799968, 0.9432682, 0.2942949, 0, 1, 0.5254902, 1,
-0.179061, -0.6453797, -3.489341, 0, 1, 0.5333334, 1,
-0.177818, 1.020036, 0.7087306, 0, 1, 0.5372549, 1,
-0.1745738, 0.4018677, -1.182646, 0, 1, 0.5450981, 1,
-0.1731698, -0.8862046, -3.741013, 0, 1, 0.5490196, 1,
-0.1719278, 1.1919, -1.5894, 0, 1, 0.5568628, 1,
-0.1696879, -1.758399, -3.246121, 0, 1, 0.5607843, 1,
-0.1644857, 0.4924736, 0.6602795, 0, 1, 0.5686275, 1,
-0.1630255, -0.1888643, -2.136626, 0, 1, 0.572549, 1,
-0.1612969, -1.757307, -2.529247, 0, 1, 0.5803922, 1,
-0.1609216, -2.167965, -3.302977, 0, 1, 0.5843138, 1,
-0.1599231, 0.08789598, -1.748995, 0, 1, 0.5921569, 1,
-0.159283, 1.527695, -0.03543357, 0, 1, 0.5960785, 1,
-0.1590631, -0.9398946, -4.40584, 0, 1, 0.6039216, 1,
-0.1584339, 0.8863584, -0.7833571, 0, 1, 0.6117647, 1,
-0.1505215, -0.1796078, -1.558126, 0, 1, 0.6156863, 1,
-0.1454006, 0.460248, -1.861048, 0, 1, 0.6235294, 1,
-0.1398966, -0.1570765, -1.480067, 0, 1, 0.627451, 1,
-0.136069, -0.01795648, -3.247004, 0, 1, 0.6352941, 1,
-0.135549, -0.3337911, -3.463334, 0, 1, 0.6392157, 1,
-0.1341439, 0.2805771, -0.1898032, 0, 1, 0.6470588, 1,
-0.1330199, -0.8355669, -1.874607, 0, 1, 0.6509804, 1,
-0.1209293, -0.1664336, -0.4459373, 0, 1, 0.6588235, 1,
-0.1200947, -1.079267, -2.886741, 0, 1, 0.6627451, 1,
-0.1184435, 0.3014473, -1.000924, 0, 1, 0.6705883, 1,
-0.1169842, 0.7712362, 0.4744825, 0, 1, 0.6745098, 1,
-0.1139947, -0.04956915, -2.066968, 0, 1, 0.682353, 1,
-0.1126478, 0.01079515, -0.9826714, 0, 1, 0.6862745, 1,
-0.1119636, -0.9597676, -2.586608, 0, 1, 0.6941177, 1,
-0.111043, -2.347477, -2.485973, 0, 1, 0.7019608, 1,
-0.1092905, 0.1307941, -0.5727745, 0, 1, 0.7058824, 1,
-0.1087888, -1.169938, -3.504975, 0, 1, 0.7137255, 1,
-0.1086784, -0.1132064, -1.745773, 0, 1, 0.7176471, 1,
-0.1065218, 0.7617233, -0.6950371, 0, 1, 0.7254902, 1,
-0.1054894, -0.508664, -3.268996, 0, 1, 0.7294118, 1,
-0.1047323, -0.05343645, -1.967874, 0, 1, 0.7372549, 1,
-0.1025238, -2.011073, -2.801216, 0, 1, 0.7411765, 1,
-0.1012306, -0.5573274, -2.719288, 0, 1, 0.7490196, 1,
-0.09928425, -1.751001, -1.830062, 0, 1, 0.7529412, 1,
-0.09489223, 0.205301, 0.4265791, 0, 1, 0.7607843, 1,
-0.09413277, 1.021913, 1.196512, 0, 1, 0.7647059, 1,
-0.09195307, -0.3335136, -2.90472, 0, 1, 0.772549, 1,
-0.09193393, -0.4019562, -1.556909, 0, 1, 0.7764706, 1,
-0.09093557, -0.3836203, -3.90641, 0, 1, 0.7843137, 1,
-0.08901977, -1.426131, -2.361799, 0, 1, 0.7882353, 1,
-0.07992075, -1.275073, -2.207974, 0, 1, 0.7960784, 1,
-0.0794572, -0.3458254, -2.786938, 0, 1, 0.8039216, 1,
-0.07764311, 1.946277, 1.275754, 0, 1, 0.8078431, 1,
-0.07280636, 2.27628, -0.7486436, 0, 1, 0.8156863, 1,
-0.06765982, -0.5885081, -2.890461, 0, 1, 0.8196079, 1,
-0.06496621, -0.262988, -1.938083, 0, 1, 0.827451, 1,
-0.06481542, -0.8036206, -4.351523, 0, 1, 0.8313726, 1,
-0.0613117, 0.5531826, -1.458808, 0, 1, 0.8392157, 1,
-0.0606138, 1.730076, 1.393291, 0, 1, 0.8431373, 1,
-0.05863406, 1.333008, 0.8457862, 0, 1, 0.8509804, 1,
-0.05801927, 2.04854, 0.02510191, 0, 1, 0.854902, 1,
-0.05330637, 2.041559, -1.001782, 0, 1, 0.8627451, 1,
-0.05289157, 0.5898213, -1.128617, 0, 1, 0.8666667, 1,
-0.05075784, 1.43553, 0.989839, 0, 1, 0.8745098, 1,
-0.04911698, 0.9660255, 1.881714, 0, 1, 0.8784314, 1,
-0.04457019, -0.1535036, -3.082392, 0, 1, 0.8862745, 1,
-0.04413614, 0.09597669, -2.13277, 0, 1, 0.8901961, 1,
-0.04325932, -1.094929, -1.117679, 0, 1, 0.8980392, 1,
-0.04271528, -0.8247328, -3.405463, 0, 1, 0.9058824, 1,
-0.04247143, -1.411285, -2.733869, 0, 1, 0.9098039, 1,
-0.0414333, -0.5515733, -3.509474, 0, 1, 0.9176471, 1,
-0.03669971, -0.4759536, -3.763142, 0, 1, 0.9215686, 1,
-0.02832005, -0.3951689, -3.196587, 0, 1, 0.9294118, 1,
-0.02499472, -0.01028427, -0.8869936, 0, 1, 0.9333333, 1,
-0.02408847, 0.4920647, -1.0757, 0, 1, 0.9411765, 1,
-0.02069911, -1.80952, -4.518626, 0, 1, 0.945098, 1,
-0.01997416, -0.2036606, -2.435544, 0, 1, 0.9529412, 1,
-0.0144054, 0.6357049, -0.1772942, 0, 1, 0.9568627, 1,
-0.01166862, 0.006448885, -1.54761, 0, 1, 0.9647059, 1,
-0.01087762, 1.369804, -1.296107, 0, 1, 0.9686275, 1,
-0.01051481, 2.004473, -1.002229, 0, 1, 0.9764706, 1,
-0.01004571, -0.5640551, -3.799821, 0, 1, 0.9803922, 1,
-0.008430335, -0.4766149, -2.061093, 0, 1, 0.9882353, 1,
-0.005761196, -0.1433475, -3.693203, 0, 1, 0.9921569, 1,
-0.005563019, 0.9574634, 0.09540866, 0, 1, 1, 1,
-0.005439739, -0.9216085, -3.393351, 0, 0.9921569, 1, 1,
-0.00473796, -1.508553, -4.561947, 0, 0.9882353, 1, 1,
-0.004459683, -0.03128118, -3.521923, 0, 0.9803922, 1, 1,
-0.004114468, 0.3415719, 3.171028, 0, 0.9764706, 1, 1,
-0.003226828, -1.902811, -4.940095, 0, 0.9686275, 1, 1,
-5.322016e-05, 0.2484247, -0.4358999, 0, 0.9647059, 1, 1,
0.01183157, -0.8509101, 3.420867, 0, 0.9568627, 1, 1,
0.01338002, 0.2134931, -1.5007, 0, 0.9529412, 1, 1,
0.01415699, 0.6296287, 0.01053163, 0, 0.945098, 1, 1,
0.01589156, 1.353068, 0.5037913, 0, 0.9411765, 1, 1,
0.01671231, 1.191349, 1.070335, 0, 0.9333333, 1, 1,
0.03571135, -0.8272664, 3.343492, 0, 0.9294118, 1, 1,
0.04800881, 0.6134219, 1.375045, 0, 0.9215686, 1, 1,
0.04805896, -0.3112583, 4.013701, 0, 0.9176471, 1, 1,
0.04818558, -0.1869596, 3.235317, 0, 0.9098039, 1, 1,
0.05104798, 1.301558, -2.134773, 0, 0.9058824, 1, 1,
0.06180336, -0.5278801, 3.106613, 0, 0.8980392, 1, 1,
0.06200774, -0.945286, 3.884631, 0, 0.8901961, 1, 1,
0.06365398, -0.7651551, 4.380413, 0, 0.8862745, 1, 1,
0.0644995, -1.957352, 1.262755, 0, 0.8784314, 1, 1,
0.06770579, 1.420419, 1.619417, 0, 0.8745098, 1, 1,
0.06855807, -1.157976, 3.08229, 0, 0.8666667, 1, 1,
0.07018792, -0.8069115, 3.613024, 0, 0.8627451, 1, 1,
0.07314077, 0.4881381, 1.728762, 0, 0.854902, 1, 1,
0.07364096, -0.06647548, 2.688323, 0, 0.8509804, 1, 1,
0.07868597, 0.5324016, 0.1370963, 0, 0.8431373, 1, 1,
0.07873601, 0.3430664, -1.895564, 0, 0.8392157, 1, 1,
0.08116323, 1.1185, 0.3792279, 0, 0.8313726, 1, 1,
0.08779672, -1.490041, 5.219373, 0, 0.827451, 1, 1,
0.09075774, -0.2341294, 3.162716, 0, 0.8196079, 1, 1,
0.09091552, -0.3555553, 2.461445, 0, 0.8156863, 1, 1,
0.09546953, -0.3097653, 4.62991, 0, 0.8078431, 1, 1,
0.100824, -0.1859008, 3.078034, 0, 0.8039216, 1, 1,
0.1053429, 0.2587401, 0.1481092, 0, 0.7960784, 1, 1,
0.1060389, -1.805732, 2.447159, 0, 0.7882353, 1, 1,
0.1083229, 0.8321863, -0.5879413, 0, 0.7843137, 1, 1,
0.1084101, 1.386756, 0.3346473, 0, 0.7764706, 1, 1,
0.1084789, -0.1931642, 2.234818, 0, 0.772549, 1, 1,
0.1108042, 0.7978474, -0.2669314, 0, 0.7647059, 1, 1,
0.1197351, 1.723273, -0.4782456, 0, 0.7607843, 1, 1,
0.1198547, 0.4219766, 0.6201732, 0, 0.7529412, 1, 1,
0.123614, -0.5675517, 2.139961, 0, 0.7490196, 1, 1,
0.1257653, 0.6845526, 0.8292304, 0, 0.7411765, 1, 1,
0.1278501, -0.1546697, 2.060071, 0, 0.7372549, 1, 1,
0.1299527, 0.8758147, 1.216597, 0, 0.7294118, 1, 1,
0.1301498, 0.6566164, 0.7742304, 0, 0.7254902, 1, 1,
0.1307887, -0.3149194, 1.768416, 0, 0.7176471, 1, 1,
0.1392345, 1.0252, -1.281513, 0, 0.7137255, 1, 1,
0.1400086, 2.199525, 0.4737373, 0, 0.7058824, 1, 1,
0.140572, -0.587312, 0.7014138, 0, 0.6980392, 1, 1,
0.1421861, 0.02695488, 1.785822, 0, 0.6941177, 1, 1,
0.1431042, -0.5196499, 4.305918, 0, 0.6862745, 1, 1,
0.1469104, 0.3205708, -0.7011809, 0, 0.682353, 1, 1,
0.1508912, 1.052067, -1.033083, 0, 0.6745098, 1, 1,
0.1525968, -1.599927, 2.573139, 0, 0.6705883, 1, 1,
0.1603216, -0.1537546, 2.743519, 0, 0.6627451, 1, 1,
0.1636624, 0.1539876, 1.688734, 0, 0.6588235, 1, 1,
0.1649428, 0.2652813, 0.5440056, 0, 0.6509804, 1, 1,
0.1672467, 0.5090476, 1.561717, 0, 0.6470588, 1, 1,
0.1686399, 1.969247, 0.3816774, 0, 0.6392157, 1, 1,
0.1700283, 0.3258, -0.4601414, 0, 0.6352941, 1, 1,
0.1701007, 1.065675, -0.6007978, 0, 0.627451, 1, 1,
0.1727724, 0.5829533, 0.1519902, 0, 0.6235294, 1, 1,
0.1732789, -0.4459252, 2.701973, 0, 0.6156863, 1, 1,
0.1732831, 1.022016, -1.101953, 0, 0.6117647, 1, 1,
0.1755472, -0.1736626, 1.9231, 0, 0.6039216, 1, 1,
0.1825, -1.369159, 3.792082, 0, 0.5960785, 1, 1,
0.1855543, 0.3170331, -0.3064803, 0, 0.5921569, 1, 1,
0.1875942, -0.3251406, 1.839214, 0, 0.5843138, 1, 1,
0.1917734, -1.787292, 2.557979, 0, 0.5803922, 1, 1,
0.1921152, -0.09327626, 0.290915, 0, 0.572549, 1, 1,
0.1946658, -0.9144869, 2.88485, 0, 0.5686275, 1, 1,
0.199324, -1.360948, 4.260876, 0, 0.5607843, 1, 1,
0.2019168, -0.4400382, 2.899688, 0, 0.5568628, 1, 1,
0.2021396, -0.2748696, 2.718572, 0, 0.5490196, 1, 1,
0.2035177, -0.6383045, 3.090712, 0, 0.5450981, 1, 1,
0.2049004, 0.3247446, 0.4845257, 0, 0.5372549, 1, 1,
0.2058318, -1.162439, 4.912803, 0, 0.5333334, 1, 1,
0.206773, -0.1681736, 2.957301, 0, 0.5254902, 1, 1,
0.2073453, 1.584227, 1.804139, 0, 0.5215687, 1, 1,
0.2115109, -0.8080189, 4.79156, 0, 0.5137255, 1, 1,
0.2132768, -0.6904587, 0.4521164, 0, 0.509804, 1, 1,
0.2282501, 0.4951457, 1.699332, 0, 0.5019608, 1, 1,
0.2402195, 0.5406871, 0.7719216, 0, 0.4941176, 1, 1,
0.2406323, 0.4692104, 1.371338, 0, 0.4901961, 1, 1,
0.2416957, 1.767878, 1.055467, 0, 0.4823529, 1, 1,
0.2461208, -0.1776, 1.488189, 0, 0.4784314, 1, 1,
0.246737, -0.3529554, 1.205428, 0, 0.4705882, 1, 1,
0.2471274, -0.09523607, 1.245425, 0, 0.4666667, 1, 1,
0.2550169, 0.538129, 1.152809, 0, 0.4588235, 1, 1,
0.2665916, -0.1854454, 2.208292, 0, 0.454902, 1, 1,
0.2665932, 0.354648, -0.1077763, 0, 0.4470588, 1, 1,
0.2667639, 0.1166445, 1.388625, 0, 0.4431373, 1, 1,
0.269269, -1.032619, 1.029703, 0, 0.4352941, 1, 1,
0.2713208, -1.43126, 4.381484, 0, 0.4313726, 1, 1,
0.2795595, -0.2756808, 2.376928, 0, 0.4235294, 1, 1,
0.2822208, -0.9345993, 2.326542, 0, 0.4196078, 1, 1,
0.2850842, -0.1794703, 1.770677, 0, 0.4117647, 1, 1,
0.2859457, 1.718739, 0.1518306, 0, 0.4078431, 1, 1,
0.2906672, 1.465021, 1.248189, 0, 0.4, 1, 1,
0.2937329, 1.085376, 2.059696, 0, 0.3921569, 1, 1,
0.2946606, -1.195787, 1.26368, 0, 0.3882353, 1, 1,
0.2970681, 1.17988, 0.6329874, 0, 0.3803922, 1, 1,
0.3004963, 0.1771334, 1.04903, 0, 0.3764706, 1, 1,
0.3028391, 0.06038601, 1.083639, 0, 0.3686275, 1, 1,
0.3092646, 0.6599778, -0.2767248, 0, 0.3647059, 1, 1,
0.3116832, -1.530781, 1.456843, 0, 0.3568628, 1, 1,
0.3122632, -1.24649, 3.014629, 0, 0.3529412, 1, 1,
0.3123687, -0.1220574, 2.862661, 0, 0.345098, 1, 1,
0.3241934, 1.130135, -0.8049442, 0, 0.3411765, 1, 1,
0.3243693, 0.4094528, 1.596869, 0, 0.3333333, 1, 1,
0.3270682, 0.2246925, 1.727926, 0, 0.3294118, 1, 1,
0.3289931, -1.349171, 3.050606, 0, 0.3215686, 1, 1,
0.3300979, -1.312302, 2.204265, 0, 0.3176471, 1, 1,
0.3316403, -0.5089626, 3.89961, 0, 0.3098039, 1, 1,
0.335645, 1.199065, 1.40767, 0, 0.3058824, 1, 1,
0.337232, 2.25417, -0.240491, 0, 0.2980392, 1, 1,
0.3384359, 0.3447801, 0.9313033, 0, 0.2901961, 1, 1,
0.3391102, 0.8684493, 0.9177578, 0, 0.2862745, 1, 1,
0.3415526, 0.9293373, 0.8958951, 0, 0.2784314, 1, 1,
0.3424753, 0.06446365, 0.793844, 0, 0.2745098, 1, 1,
0.345348, -0.4650354, 2.834043, 0, 0.2666667, 1, 1,
0.3459165, -0.9583179, 1.913197, 0, 0.2627451, 1, 1,
0.3465691, 0.9614074, 0.02973123, 0, 0.254902, 1, 1,
0.3504606, -0.03160752, 2.335027, 0, 0.2509804, 1, 1,
0.3533285, 0.9374356, -1.412027, 0, 0.2431373, 1, 1,
0.3573373, 0.1928336, 1.177578, 0, 0.2392157, 1, 1,
0.3576866, -0.5089813, 4.837423, 0, 0.2313726, 1, 1,
0.3603392, 0.2286012, 1.627939, 0, 0.227451, 1, 1,
0.3613802, -0.4070779, 1.172619, 0, 0.2196078, 1, 1,
0.3616947, -0.7101845, 2.001877, 0, 0.2156863, 1, 1,
0.3655262, 0.01074537, 1.340225, 0, 0.2078431, 1, 1,
0.3667742, 0.8160377, 0.8970821, 0, 0.2039216, 1, 1,
0.3673634, -0.4341243, 2.667758, 0, 0.1960784, 1, 1,
0.3772603, -1.048705, 3.380288, 0, 0.1882353, 1, 1,
0.3788295, 0.05716769, 2.145111, 0, 0.1843137, 1, 1,
0.3818906, 0.2439138, 1.345894, 0, 0.1764706, 1, 1,
0.3852962, -0.5001772, 1.832671, 0, 0.172549, 1, 1,
0.3887276, -0.4883509, 2.395067, 0, 0.1647059, 1, 1,
0.3891408, 1.674833, -0.9402937, 0, 0.1607843, 1, 1,
0.389456, 1.229847, 1.311818, 0, 0.1529412, 1, 1,
0.393079, -1.114129, 3.557624, 0, 0.1490196, 1, 1,
0.3931437, 0.4466771, -0.1896067, 0, 0.1411765, 1, 1,
0.3963793, -0.151014, -0.5107971, 0, 0.1372549, 1, 1,
0.3991397, -1.585392, 4.088426, 0, 0.1294118, 1, 1,
0.4016454, -0.3832494, 2.325808, 0, 0.1254902, 1, 1,
0.4018121, 0.2193583, 0.3262242, 0, 0.1176471, 1, 1,
0.4024146, 0.9533265, 1.520373, 0, 0.1137255, 1, 1,
0.4057932, 0.6127451, -1.521651, 0, 0.1058824, 1, 1,
0.4062414, -0.8500966, 1.708191, 0, 0.09803922, 1, 1,
0.4064154, -0.7873168, 4.188525, 0, 0.09411765, 1, 1,
0.4119975, -0.8946432, 3.581547, 0, 0.08627451, 1, 1,
0.4122216, -1.180451, 2.783713, 0, 0.08235294, 1, 1,
0.4153721, -0.4385901, 3.259268, 0, 0.07450981, 1, 1,
0.4237989, -0.3847949, 4.364252, 0, 0.07058824, 1, 1,
0.426201, -0.8046591, 2.676759, 0, 0.0627451, 1, 1,
0.427154, 1.370247, 0.3604387, 0, 0.05882353, 1, 1,
0.4389976, 1.061079, 0.6746286, 0, 0.05098039, 1, 1,
0.4392053, 0.06377776, 1.813659, 0, 0.04705882, 1, 1,
0.4423761, 2.267225, -0.898025, 0, 0.03921569, 1, 1,
0.4482017, -2.206921, 3.080921, 0, 0.03529412, 1, 1,
0.4500009, 1.520402, -2.615627, 0, 0.02745098, 1, 1,
0.4505101, -1.457357, 4.02441, 0, 0.02352941, 1, 1,
0.4525941, 0.1556018, 2.0195, 0, 0.01568628, 1, 1,
0.4589865, 2.839254, 1.758293, 0, 0.01176471, 1, 1,
0.4611731, 0.343901, 2.042142, 0, 0.003921569, 1, 1,
0.4618096, -0.356819, 2.181813, 0.003921569, 0, 1, 1,
0.4642377, 0.8313979, 0.8666597, 0.007843138, 0, 1, 1,
0.4712444, 0.9146594, -0.1624923, 0.01568628, 0, 1, 1,
0.4762433, -0.5368955, 0.2180714, 0.01960784, 0, 1, 1,
0.4771302, 0.03880775, 2.045974, 0.02745098, 0, 1, 1,
0.4774236, -0.691658, 1.877356, 0.03137255, 0, 1, 1,
0.4861917, 0.4195363, 1.473484, 0.03921569, 0, 1, 1,
0.4885298, 0.3308015, 0.8962025, 0.04313726, 0, 1, 1,
0.4963523, -0.7495716, 2.523289, 0.05098039, 0, 1, 1,
0.4979242, -0.7091963, 2.285823, 0.05490196, 0, 1, 1,
0.4988484, 1.341579, 0.5092361, 0.0627451, 0, 1, 1,
0.501786, -1.551462, 3.882526, 0.06666667, 0, 1, 1,
0.5026786, 0.8866807, -0.1069208, 0.07450981, 0, 1, 1,
0.5073179, -0.8181185, 1.000448, 0.07843138, 0, 1, 1,
0.5106999, -1.037058, 3.017111, 0.08627451, 0, 1, 1,
0.5121453, 0.1418723, 2.462881, 0.09019608, 0, 1, 1,
0.5136047, 0.4009741, 1.071423, 0.09803922, 0, 1, 1,
0.5160812, 2.417027, -0.119159, 0.1058824, 0, 1, 1,
0.5191808, 0.2899176, 0.7119701, 0.1098039, 0, 1, 1,
0.5191942, 0.4661628, 1.740585, 0.1176471, 0, 1, 1,
0.5199103, -1.607403, 2.691274, 0.1215686, 0, 1, 1,
0.5210825, 1.467254, 1.707686, 0.1294118, 0, 1, 1,
0.5244344, 1.723304, 1.810192, 0.1333333, 0, 1, 1,
0.5301068, 0.8442419, 0.9299967, 0.1411765, 0, 1, 1,
0.5323492, -0.4571387, 2.086806, 0.145098, 0, 1, 1,
0.53354, 1.651955, 0.3704535, 0.1529412, 0, 1, 1,
0.5342473, 0.861423, -0.4327875, 0.1568628, 0, 1, 1,
0.5370741, 1.826334, 0.824768, 0.1647059, 0, 1, 1,
0.541241, -0.1346915, 2.830251, 0.1686275, 0, 1, 1,
0.5445712, 0.2542402, 0.6726944, 0.1764706, 0, 1, 1,
0.5510725, -0.1538677, 1.591139, 0.1803922, 0, 1, 1,
0.558331, -1.526863, 3.065336, 0.1882353, 0, 1, 1,
0.5619242, -0.01927393, 1.39253, 0.1921569, 0, 1, 1,
0.5621717, -0.9420676, 2.282646, 0.2, 0, 1, 1,
0.5628721, 0.3152448, 2.161223, 0.2078431, 0, 1, 1,
0.5666814, 1.688689, 0.4348636, 0.2117647, 0, 1, 1,
0.5728213, 0.13815, 1.343478, 0.2196078, 0, 1, 1,
0.5735034, 1.873111, 0.6486379, 0.2235294, 0, 1, 1,
0.5783749, -0.5336005, 2.8824, 0.2313726, 0, 1, 1,
0.5784473, 0.6796563, 2.246049, 0.2352941, 0, 1, 1,
0.5828996, -0.08997317, 0.9616109, 0.2431373, 0, 1, 1,
0.5860428, 0.5628285, 0.4204638, 0.2470588, 0, 1, 1,
0.5891885, -1.41871, 3.3294, 0.254902, 0, 1, 1,
0.5982046, 0.9675186, 0.435825, 0.2588235, 0, 1, 1,
0.5995148, -0.3292466, 2.735813, 0.2666667, 0, 1, 1,
0.5996748, 0.9129813, 0.7657196, 0.2705882, 0, 1, 1,
0.6019528, -0.7787179, 2.402388, 0.2784314, 0, 1, 1,
0.603469, -0.672745, 2.89498, 0.282353, 0, 1, 1,
0.6071324, -1.085631, 2.416158, 0.2901961, 0, 1, 1,
0.6160174, -2.392965, 3.072142, 0.2941177, 0, 1, 1,
0.6160795, -0.1441036, 1.761096, 0.3019608, 0, 1, 1,
0.6166512, 0.4732497, 1.35966, 0.3098039, 0, 1, 1,
0.6169854, -0.5279223, 1.630521, 0.3137255, 0, 1, 1,
0.6183406, -0.4762403, 0.3936819, 0.3215686, 0, 1, 1,
0.6196861, -0.4066847, 1.51414, 0.3254902, 0, 1, 1,
0.6227696, -0.882601, 1.991585, 0.3333333, 0, 1, 1,
0.6235678, -0.6583786, 4.411961, 0.3372549, 0, 1, 1,
0.6240801, 1.236677, 2.02386, 0.345098, 0, 1, 1,
0.624787, 0.9142228, -0.07959443, 0.3490196, 0, 1, 1,
0.6306612, -0.6904797, 2.625647, 0.3568628, 0, 1, 1,
0.6349536, 1.664027, -0.03669185, 0.3607843, 0, 1, 1,
0.6402164, 0.6094643, 0.6378167, 0.3686275, 0, 1, 1,
0.6503233, 1.730681, 0.4573873, 0.372549, 0, 1, 1,
0.655474, -0.6363187, 3.049983, 0.3803922, 0, 1, 1,
0.6586825, -0.5045667, 0.7833411, 0.3843137, 0, 1, 1,
0.6596718, 0.7536824, 1.631165, 0.3921569, 0, 1, 1,
0.664857, -1.811785, 2.617418, 0.3960784, 0, 1, 1,
0.6649953, 2.552527, 0.2196299, 0.4039216, 0, 1, 1,
0.671595, 0.5394592, 3.320692, 0.4117647, 0, 1, 1,
0.6727033, 1.273673, 0.4728523, 0.4156863, 0, 1, 1,
0.6748187, 0.1551854, 2.465175, 0.4235294, 0, 1, 1,
0.6781858, 0.4009211, 2.043892, 0.427451, 0, 1, 1,
0.6789858, 0.4724004, 1.351616, 0.4352941, 0, 1, 1,
0.6818317, -1.021987, 0.602423, 0.4392157, 0, 1, 1,
0.6839061, -0.1379955, 2.327846, 0.4470588, 0, 1, 1,
0.6986886, 0.3684576, 0.9167759, 0.4509804, 0, 1, 1,
0.7012795, -0.3618232, 2.494647, 0.4588235, 0, 1, 1,
0.7098264, 0.04907265, 2.021689, 0.4627451, 0, 1, 1,
0.7309079, -1.053099, 1.866804, 0.4705882, 0, 1, 1,
0.7366953, -0.1540151, 1.928724, 0.4745098, 0, 1, 1,
0.7370279, -0.7099779, 1.604161, 0.4823529, 0, 1, 1,
0.7410901, 0.7013019, 1.307528, 0.4862745, 0, 1, 1,
0.7445214, 0.4005661, -1.105079, 0.4941176, 0, 1, 1,
0.7449549, -0.06095677, 0.6393802, 0.5019608, 0, 1, 1,
0.7461484, -1.232385, 1.336693, 0.5058824, 0, 1, 1,
0.747861, 1.626287, 0.05660493, 0.5137255, 0, 1, 1,
0.7560227, 0.3134103, 1.788313, 0.5176471, 0, 1, 1,
0.7562126, -0.3745636, 1.270271, 0.5254902, 0, 1, 1,
0.7579831, 0.3344417, -0.3862789, 0.5294118, 0, 1, 1,
0.7604751, -1.21973, 1.387649, 0.5372549, 0, 1, 1,
0.7641206, 1.053137, 0.6880459, 0.5411765, 0, 1, 1,
0.7641833, 0.3242479, 1.855234, 0.5490196, 0, 1, 1,
0.7646271, 0.4879095, 1.545805, 0.5529412, 0, 1, 1,
0.7667193, 0.3354795, 2.345619, 0.5607843, 0, 1, 1,
0.7670012, -0.7697513, 2.771595, 0.5647059, 0, 1, 1,
0.7672225, -0.1727871, 1.716116, 0.572549, 0, 1, 1,
0.7689119, 1.102612, 0.1999873, 0.5764706, 0, 1, 1,
0.7707955, 1.082587, 0.5458438, 0.5843138, 0, 1, 1,
0.7745962, -2.27724, 2.98553, 0.5882353, 0, 1, 1,
0.7778979, -0.5841402, 1.767665, 0.5960785, 0, 1, 1,
0.7794804, -1.047651, 1.153998, 0.6039216, 0, 1, 1,
0.7803531, -0.969143, 1.90599, 0.6078432, 0, 1, 1,
0.789061, 1.360694, -0.609033, 0.6156863, 0, 1, 1,
0.789106, 0.797201, -0.4400162, 0.6196079, 0, 1, 1,
0.7922602, -0.8168907, 3.558919, 0.627451, 0, 1, 1,
0.7944602, 0.8990087, 1.053572, 0.6313726, 0, 1, 1,
0.7953078, 0.7490914, 2.272346, 0.6392157, 0, 1, 1,
0.798808, 1.678095, 0.7656911, 0.6431373, 0, 1, 1,
0.8006768, 1.377007, 0.6451946, 0.6509804, 0, 1, 1,
0.8009558, 0.1612343, 0.7569024, 0.654902, 0, 1, 1,
0.8013061, -0.01401497, 1.15949, 0.6627451, 0, 1, 1,
0.8051382, 0.06719182, 0.4868813, 0.6666667, 0, 1, 1,
0.8057675, 1.154783, 0.3346547, 0.6745098, 0, 1, 1,
0.8118315, 2.031573, -0.2138176, 0.6784314, 0, 1, 1,
0.8133857, 0.5322607, 1.190838, 0.6862745, 0, 1, 1,
0.8164855, 1.385292, 1.417788, 0.6901961, 0, 1, 1,
0.8189131, -0.047069, 0.2312611, 0.6980392, 0, 1, 1,
0.8189777, 1.356675, -0.2185829, 0.7058824, 0, 1, 1,
0.8193106, -0.004640267, 1.626945, 0.7098039, 0, 1, 1,
0.8204782, -0.9705667, 3.357358, 0.7176471, 0, 1, 1,
0.8220541, 1.657818, 2.22788, 0.7215686, 0, 1, 1,
0.8222226, 0.5987656, -0.1988294, 0.7294118, 0, 1, 1,
0.8237892, -0.6282571, 3.436337, 0.7333333, 0, 1, 1,
0.8259078, -1.608763, 2.991653, 0.7411765, 0, 1, 1,
0.8261408, 0.07195058, 2.625477, 0.7450981, 0, 1, 1,
0.8342223, 0.1995313, 1.956256, 0.7529412, 0, 1, 1,
0.8401723, -0.7432237, 0.007115324, 0.7568628, 0, 1, 1,
0.8414579, 1.046226, 0.5158313, 0.7647059, 0, 1, 1,
0.8456491, 1.986822, 2.264297, 0.7686275, 0, 1, 1,
0.8459316, 1.498188, 0.1828311, 0.7764706, 0, 1, 1,
0.8481455, 1.203927, 0.6328424, 0.7803922, 0, 1, 1,
0.8497978, 1.776537, 1.603151, 0.7882353, 0, 1, 1,
0.8576444, 0.8166158, -0.2952958, 0.7921569, 0, 1, 1,
0.8701906, 1.352797, -1.501669, 0.8, 0, 1, 1,
0.8733476, 0.5357871, -0.638464, 0.8078431, 0, 1, 1,
0.8782563, 1.564357, 0.8359637, 0.8117647, 0, 1, 1,
0.8785081, -0.350749, 1.642919, 0.8196079, 0, 1, 1,
0.8837122, -0.1103597, -0.2629226, 0.8235294, 0, 1, 1,
0.8955552, 0.1847774, -0.133278, 0.8313726, 0, 1, 1,
0.8963516, -0.9457572, 0.5280974, 0.8352941, 0, 1, 1,
0.8977485, 1.14036, 1.466085, 0.8431373, 0, 1, 1,
0.9009016, -0.2194391, 2.323016, 0.8470588, 0, 1, 1,
0.9014758, -0.7982337, 2.0464, 0.854902, 0, 1, 1,
0.9032556, -0.2434299, 1.657184, 0.8588235, 0, 1, 1,
0.9039032, -0.134569, 1.811401, 0.8666667, 0, 1, 1,
0.9063802, 0.5256582, 1.868968, 0.8705882, 0, 1, 1,
0.9088005, -1.668065, 2.597543, 0.8784314, 0, 1, 1,
0.9109594, 0.4685295, 2.181053, 0.8823529, 0, 1, 1,
0.9143279, -0.5544301, 1.358108, 0.8901961, 0, 1, 1,
0.9154804, 0.7827291, 0.07926375, 0.8941177, 0, 1, 1,
0.9282278, 0.1144324, 1.496926, 0.9019608, 0, 1, 1,
0.9323406, -0.5460726, 0.8304014, 0.9098039, 0, 1, 1,
0.936639, 1.409326, 0.847508, 0.9137255, 0, 1, 1,
0.9663781, -1.214566, 2.073796, 0.9215686, 0, 1, 1,
0.967087, -0.3242424, 2.123783, 0.9254902, 0, 1, 1,
0.9707153, 2.439864, -0.515872, 0.9333333, 0, 1, 1,
0.9715982, -1.12703, 2.871157, 0.9372549, 0, 1, 1,
0.9725819, -0.3357287, 2.566159, 0.945098, 0, 1, 1,
0.9737473, -0.8683618, 2.867291, 0.9490196, 0, 1, 1,
0.9753515, 2.537837, -0.07278734, 0.9568627, 0, 1, 1,
0.9772397, 0.05032346, 2.148384, 0.9607843, 0, 1, 1,
0.9786309, 1.304394, -0.5059413, 0.9686275, 0, 1, 1,
0.9841253, 0.37601, 1.359915, 0.972549, 0, 1, 1,
0.9849957, 0.2405939, 1.414994, 0.9803922, 0, 1, 1,
0.9913195, 0.3179695, 1.342459, 0.9843137, 0, 1, 1,
0.9971602, 0.1833878, 1.7177, 0.9921569, 0, 1, 1,
1.002964, -1.172843, 2.168555, 0.9960784, 0, 1, 1,
1.009327, -0.3865344, 1.211203, 1, 0, 0.9960784, 1,
1.01209, -1.789782, 2.951223, 1, 0, 0.9882353, 1,
1.019352, 0.5652432, 0.7002709, 1, 0, 0.9843137, 1,
1.020324, 0.2699217, 0.7836758, 1, 0, 0.9764706, 1,
1.022006, -0.3611893, 1.18491, 1, 0, 0.972549, 1,
1.025352, 0.7937019, -0.1739104, 1, 0, 0.9647059, 1,
1.027237, 0.5044767, 1.611745, 1, 0, 0.9607843, 1,
1.031528, -0.4693119, 1.006709, 1, 0, 0.9529412, 1,
1.033982, -0.4467128, 1.343257, 1, 0, 0.9490196, 1,
1.034603, -0.7060165, 1.518288, 1, 0, 0.9411765, 1,
1.034742, 1.373187, 0.8859847, 1, 0, 0.9372549, 1,
1.035719, -1.529235, 1.114885, 1, 0, 0.9294118, 1,
1.050509, -1.64543, 2.041073, 1, 0, 0.9254902, 1,
1.05337, 0.8409352, 0.4445471, 1, 0, 0.9176471, 1,
1.055093, -0.4066675, 1.469548, 1, 0, 0.9137255, 1,
1.05513, -1.344494, 2.044396, 1, 0, 0.9058824, 1,
1.056414, 0.2658815, 1.07105, 1, 0, 0.9019608, 1,
1.059255, -0.3276436, 4.38038, 1, 0, 0.8941177, 1,
1.059413, -0.3923917, 3.474483, 1, 0, 0.8862745, 1,
1.061011, 2.344315, 0.8675404, 1, 0, 0.8823529, 1,
1.068269, -3.042184, 2.872039, 1, 0, 0.8745098, 1,
1.070233, 1.892752, -0.07802922, 1, 0, 0.8705882, 1,
1.078705, -0.0599022, 1.078405, 1, 0, 0.8627451, 1,
1.079142, -0.1213676, 1.961286, 1, 0, 0.8588235, 1,
1.079301, -0.6697914, 3.911819, 1, 0, 0.8509804, 1,
1.083161, 1.775456, 2.003017, 1, 0, 0.8470588, 1,
1.084834, -0.6970528, 2.166749, 1, 0, 0.8392157, 1,
1.085824, 0.8619612, 1.448447, 1, 0, 0.8352941, 1,
1.086049, -0.2277208, 1.943354, 1, 0, 0.827451, 1,
1.087948, -0.7515743, 3.080931, 1, 0, 0.8235294, 1,
1.105328, -0.1527138, 1.441732, 1, 0, 0.8156863, 1,
1.107069, 0.2819373, 1.43419, 1, 0, 0.8117647, 1,
1.110638, -0.1846179, 2.799182, 1, 0, 0.8039216, 1,
1.114059, 0.5738601, 0.305753, 1, 0, 0.7960784, 1,
1.131512, -0.1397529, -0.7228846, 1, 0, 0.7921569, 1,
1.131623, -0.5976292, 1.16454, 1, 0, 0.7843137, 1,
1.15675, 1.864802, 2.887224, 1, 0, 0.7803922, 1,
1.160203, -0.3699258, 1.680532, 1, 0, 0.772549, 1,
1.161089, -0.4645519, 2.534894, 1, 0, 0.7686275, 1,
1.166469, 0.319689, 1.317181, 1, 0, 0.7607843, 1,
1.191388, -1.960257, 2.431995, 1, 0, 0.7568628, 1,
1.191524, -0.384147, 1.940788, 1, 0, 0.7490196, 1,
1.192815, -1.226003, 1.868658, 1, 0, 0.7450981, 1,
1.195998, -0.4588545, 3.357871, 1, 0, 0.7372549, 1,
1.200543, 0.3464339, 0.8268723, 1, 0, 0.7333333, 1,
1.206008, 0.2120777, 1.981546, 1, 0, 0.7254902, 1,
1.217215, 0.8299889, 1.417345, 1, 0, 0.7215686, 1,
1.218541, 1.377751, 0.648973, 1, 0, 0.7137255, 1,
1.234288, 1.226245, 1.349484, 1, 0, 0.7098039, 1,
1.237672, -0.9882097, 1.273771, 1, 0, 0.7019608, 1,
1.246309, 0.022197, 1.265555, 1, 0, 0.6941177, 1,
1.25252, 0.9759887, 0.9190761, 1, 0, 0.6901961, 1,
1.252564, 1.186809, 1.552468, 1, 0, 0.682353, 1,
1.255697, 0.8157408, 2.949425, 1, 0, 0.6784314, 1,
1.258776, 0.2614778, -0.05670691, 1, 0, 0.6705883, 1,
1.261496, 0.4726918, 2.122977, 1, 0, 0.6666667, 1,
1.261499, 1.499274, 1.893987, 1, 0, 0.6588235, 1,
1.267074, -0.5846033, 0.7492549, 1, 0, 0.654902, 1,
1.271515, 0.8653569, 0.6553764, 1, 0, 0.6470588, 1,
1.276333, 0.3847836, 3.064085, 1, 0, 0.6431373, 1,
1.27781, 0.205498, 0.6959741, 1, 0, 0.6352941, 1,
1.29434, 2.011164, 2.336573, 1, 0, 0.6313726, 1,
1.294671, 1.232539, -0.2960699, 1, 0, 0.6235294, 1,
1.30098, 2.064923, 1.298906, 1, 0, 0.6196079, 1,
1.305557, -0.7786136, 3.664503, 1, 0, 0.6117647, 1,
1.307632, 1.187151, 0.9522725, 1, 0, 0.6078432, 1,
1.313781, 1.086368, 3.830085, 1, 0, 0.6, 1,
1.317169, 0.9504924, 0.9191182, 1, 0, 0.5921569, 1,
1.321271, -0.2483584, 0.8795877, 1, 0, 0.5882353, 1,
1.322778, 1.631793, -0.03351899, 1, 0, 0.5803922, 1,
1.328902, 0.3662185, 0.4251901, 1, 0, 0.5764706, 1,
1.34886, -1.050449, 2.503227, 1, 0, 0.5686275, 1,
1.354874, -0.7687573, 2.361874, 1, 0, 0.5647059, 1,
1.363603, -1.18251, 3.019042, 1, 0, 0.5568628, 1,
1.373291, -0.9437097, 0.6820026, 1, 0, 0.5529412, 1,
1.390299, -0.01284885, -0.8639407, 1, 0, 0.5450981, 1,
1.392477, -0.3938335, 4.202246, 1, 0, 0.5411765, 1,
1.3925, -0.7787588, -0.04525639, 1, 0, 0.5333334, 1,
1.393404, -1.051586, 1.832054, 1, 0, 0.5294118, 1,
1.399978, 0.4897464, 0.8285693, 1, 0, 0.5215687, 1,
1.402668, 0.2384084, 1.861499, 1, 0, 0.5176471, 1,
1.408546, 0.9344636, -0.3278177, 1, 0, 0.509804, 1,
1.408556, -1.333691, 2.025615, 1, 0, 0.5058824, 1,
1.409125, -0.4654202, 0.8425732, 1, 0, 0.4980392, 1,
1.409515, -0.8466892, 3.443623, 1, 0, 0.4901961, 1,
1.421118, 0.1656344, 1.502993, 1, 0, 0.4862745, 1,
1.429114, 1.871104, 2.458498, 1, 0, 0.4784314, 1,
1.432421, -1.319437, 3.472547, 1, 0, 0.4745098, 1,
1.433895, 0.754656, 2.555935, 1, 0, 0.4666667, 1,
1.454554, -0.9593603, 1.361158, 1, 0, 0.4627451, 1,
1.461954, -0.2239544, 2.043791, 1, 0, 0.454902, 1,
1.470595, 1.742402, -1.452057, 1, 0, 0.4509804, 1,
1.477746, 0.05636596, 2.15982, 1, 0, 0.4431373, 1,
1.485785, 1.032788, 1.184251, 1, 0, 0.4392157, 1,
1.491235, 0.6127058, 0.5781632, 1, 0, 0.4313726, 1,
1.494172, 0.2364427, 1.606639, 1, 0, 0.427451, 1,
1.506772, 0.04498137, 1.639976, 1, 0, 0.4196078, 1,
1.508625, -0.07390928, 1.031783, 1, 0, 0.4156863, 1,
1.508639, 1.240909, 1.392437, 1, 0, 0.4078431, 1,
1.51174, 1.244422, 1.809905, 1, 0, 0.4039216, 1,
1.511942, 0.5705345, 1.890646, 1, 0, 0.3960784, 1,
1.51322, -0.03537154, 0.9415677, 1, 0, 0.3882353, 1,
1.513647, -1.425606, 2.755001, 1, 0, 0.3843137, 1,
1.519395, 0.02446236, 2.951279, 1, 0, 0.3764706, 1,
1.521942, 1.3065, 0.04119574, 1, 0, 0.372549, 1,
1.536232, -0.4412156, 1.002067, 1, 0, 0.3647059, 1,
1.549493, 0.9802912, 2.056235, 1, 0, 0.3607843, 1,
1.557899, -2.230819, 3.557655, 1, 0, 0.3529412, 1,
1.566827, 0.914459, 0.451965, 1, 0, 0.3490196, 1,
1.578416, -0.5671859, 1.361539, 1, 0, 0.3411765, 1,
1.581159, -1.190677, 0.2699693, 1, 0, 0.3372549, 1,
1.591601, -0.05307906, 1.707901, 1, 0, 0.3294118, 1,
1.594378, -0.65949, 0.8795782, 1, 0, 0.3254902, 1,
1.610258, -0.8465824, 2.63703, 1, 0, 0.3176471, 1,
1.613696, 0.4172555, 0.4452128, 1, 0, 0.3137255, 1,
1.615031, -0.6431237, 0.9958699, 1, 0, 0.3058824, 1,
1.616093, -0.05305906, -0.7676708, 1, 0, 0.2980392, 1,
1.643717, -0.04107035, 1.517382, 1, 0, 0.2941177, 1,
1.645465, -0.7776841, 0.8103905, 1, 0, 0.2862745, 1,
1.64745, -0.8727745, 0.6527787, 1, 0, 0.282353, 1,
1.663414, 0.9874853, -0.5402064, 1, 0, 0.2745098, 1,
1.664907, 0.9494364, 1.491641, 1, 0, 0.2705882, 1,
1.669889, -1.069014, 2.875153, 1, 0, 0.2627451, 1,
1.685763, 0.8873793, 2.293138, 1, 0, 0.2588235, 1,
1.718675, -0.3851979, 3.412275, 1, 0, 0.2509804, 1,
1.727797, 1.242097, 1.972328, 1, 0, 0.2470588, 1,
1.745908, 0.03723866, 1.731145, 1, 0, 0.2392157, 1,
1.746308, 0.3375144, 0.1160627, 1, 0, 0.2352941, 1,
1.762635, 0.6267039, 1.816599, 1, 0, 0.227451, 1,
1.786465, 0.2709406, 2.35578, 1, 0, 0.2235294, 1,
1.791224, -0.7801921, 2.935165, 1, 0, 0.2156863, 1,
1.792712, 0.02573252, 0.2813963, 1, 0, 0.2117647, 1,
1.80267, -1.240538, 1.849, 1, 0, 0.2039216, 1,
1.806858, -0.2098069, 2.095168, 1, 0, 0.1960784, 1,
1.816952, -0.8050622, 1.396297, 1, 0, 0.1921569, 1,
1.821897, -0.237704, 2.407692, 1, 0, 0.1843137, 1,
1.824938, -0.1901342, 0.8327335, 1, 0, 0.1803922, 1,
1.87075, -0.1507081, 0.4418965, 1, 0, 0.172549, 1,
1.876943, -1.435649, 2.094237, 1, 0, 0.1686275, 1,
1.878877, 0.2625464, 0.5422092, 1, 0, 0.1607843, 1,
1.905432, -0.0495008, 0.08488682, 1, 0, 0.1568628, 1,
1.915276, 0.6404375, 1.350521, 1, 0, 0.1490196, 1,
1.91733, 1.226127, -0.1672194, 1, 0, 0.145098, 1,
1.932383, 0.2008367, 0.6703727, 1, 0, 0.1372549, 1,
1.987126, -0.8511989, 1.723049, 1, 0, 0.1333333, 1,
1.990715, -2.27266, 4.326492, 1, 0, 0.1254902, 1,
2.021098, -0.1642319, 0.7697706, 1, 0, 0.1215686, 1,
2.047399, 1.279342, 1.288824, 1, 0, 0.1137255, 1,
2.061541, -0.122614, 2.326287, 1, 0, 0.1098039, 1,
2.063195, -1.469459, 4.019719, 1, 0, 0.1019608, 1,
2.106546, -0.8831796, 2.733986, 1, 0, 0.09411765, 1,
2.109251, -0.3618228, 2.375861, 1, 0, 0.09019608, 1,
2.129689, 1.236777, 0.8779405, 1, 0, 0.08235294, 1,
2.155241, -0.9725996, 1.342194, 1, 0, 0.07843138, 1,
2.178588, 1.432422, -0.6500354, 1, 0, 0.07058824, 1,
2.217719, -0.7465123, 2.900127, 1, 0, 0.06666667, 1,
2.230333, 0.9887752, 1.77432, 1, 0, 0.05882353, 1,
2.315746, -0.313126, 2.383249, 1, 0, 0.05490196, 1,
2.35403, 1.74972, 3.568368, 1, 0, 0.04705882, 1,
2.356736, -0.6540216, 2.799315, 1, 0, 0.04313726, 1,
2.398132, -2.380471, 1.013688, 1, 0, 0.03529412, 1,
2.475739, 0.1269733, 2.937419, 1, 0, 0.03137255, 1,
3.002318, -1.18206, 0.7691929, 1, 0, 0.02352941, 1,
3.301749, 0.5322136, 0.609403, 1, 0, 0.01960784, 1,
3.480636, 0.4944183, 2.445706, 1, 0, 0.01176471, 1,
3.880151, -0.85773, 0.518992, 1, 0, 0.007843138, 1
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
0.3233887, -4.114933, -6.662125, 0, -0.5, 0.5, 0.5,
0.3233887, -4.114933, -6.662125, 1, -0.5, 0.5, 0.5,
0.3233887, -4.114933, -6.662125, 1, 1.5, 0.5, 0.5,
0.3233887, -4.114933, -6.662125, 0, 1.5, 0.5, 0.5
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
-4.439116, 0.1222678, -6.662125, 0, -0.5, 0.5, 0.5,
-4.439116, 0.1222678, -6.662125, 1, -0.5, 0.5, 0.5,
-4.439116, 0.1222678, -6.662125, 1, 1.5, 0.5, 0.5,
-4.439116, 0.1222678, -6.662125, 0, 1.5, 0.5, 0.5
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
-4.439116, -4.114933, 0.1396387, 0, -0.5, 0.5, 0.5,
-4.439116, -4.114933, 0.1396387, 1, -0.5, 0.5, 0.5,
-4.439116, -4.114933, 0.1396387, 1, 1.5, 0.5, 0.5,
-4.439116, -4.114933, 0.1396387, 0, 1.5, 0.5, 0.5
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
-2, -3.137118, -5.092487,
2, -3.137118, -5.092487,
-2, -3.137118, -5.092487,
-2, -3.300087, -5.354094,
0, -3.137118, -5.092487,
0, -3.300087, -5.354094,
2, -3.137118, -5.092487,
2, -3.300087, -5.354094
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
"0",
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
-2, -3.626026, -5.877306, 0, -0.5, 0.5, 0.5,
-2, -3.626026, -5.877306, 1, -0.5, 0.5, 0.5,
-2, -3.626026, -5.877306, 1, 1.5, 0.5, 0.5,
-2, -3.626026, -5.877306, 0, 1.5, 0.5, 0.5,
0, -3.626026, -5.877306, 0, -0.5, 0.5, 0.5,
0, -3.626026, -5.877306, 1, -0.5, 0.5, 0.5,
0, -3.626026, -5.877306, 1, 1.5, 0.5, 0.5,
0, -3.626026, -5.877306, 0, 1.5, 0.5, 0.5,
2, -3.626026, -5.877306, 0, -0.5, 0.5, 0.5,
2, -3.626026, -5.877306, 1, -0.5, 0.5, 0.5,
2, -3.626026, -5.877306, 1, 1.5, 0.5, 0.5,
2, -3.626026, -5.877306, 0, 1.5, 0.5, 0.5
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
-3.340076, -3, -5.092487,
-3.340076, 3, -5.092487,
-3.340076, -3, -5.092487,
-3.52325, -3, -5.354094,
-3.340076, -2, -5.092487,
-3.52325, -2, -5.354094,
-3.340076, -1, -5.092487,
-3.52325, -1, -5.354094,
-3.340076, 0, -5.092487,
-3.52325, 0, -5.354094,
-3.340076, 1, -5.092487,
-3.52325, 1, -5.354094,
-3.340076, 2, -5.092487,
-3.52325, 2, -5.354094,
-3.340076, 3, -5.092487,
-3.52325, 3, -5.354094
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
-3.889596, -3, -5.877306, 0, -0.5, 0.5, 0.5,
-3.889596, -3, -5.877306, 1, -0.5, 0.5, 0.5,
-3.889596, -3, -5.877306, 1, 1.5, 0.5, 0.5,
-3.889596, -3, -5.877306, 0, 1.5, 0.5, 0.5,
-3.889596, -2, -5.877306, 0, -0.5, 0.5, 0.5,
-3.889596, -2, -5.877306, 1, -0.5, 0.5, 0.5,
-3.889596, -2, -5.877306, 1, 1.5, 0.5, 0.5,
-3.889596, -2, -5.877306, 0, 1.5, 0.5, 0.5,
-3.889596, -1, -5.877306, 0, -0.5, 0.5, 0.5,
-3.889596, -1, -5.877306, 1, -0.5, 0.5, 0.5,
-3.889596, -1, -5.877306, 1, 1.5, 0.5, 0.5,
-3.889596, -1, -5.877306, 0, 1.5, 0.5, 0.5,
-3.889596, 0, -5.877306, 0, -0.5, 0.5, 0.5,
-3.889596, 0, -5.877306, 1, -0.5, 0.5, 0.5,
-3.889596, 0, -5.877306, 1, 1.5, 0.5, 0.5,
-3.889596, 0, -5.877306, 0, 1.5, 0.5, 0.5,
-3.889596, 1, -5.877306, 0, -0.5, 0.5, 0.5,
-3.889596, 1, -5.877306, 1, -0.5, 0.5, 0.5,
-3.889596, 1, -5.877306, 1, 1.5, 0.5, 0.5,
-3.889596, 1, -5.877306, 0, 1.5, 0.5, 0.5,
-3.889596, 2, -5.877306, 0, -0.5, 0.5, 0.5,
-3.889596, 2, -5.877306, 1, -0.5, 0.5, 0.5,
-3.889596, 2, -5.877306, 1, 1.5, 0.5, 0.5,
-3.889596, 2, -5.877306, 0, 1.5, 0.5, 0.5,
-3.889596, 3, -5.877306, 0, -0.5, 0.5, 0.5,
-3.889596, 3, -5.877306, 1, -0.5, 0.5, 0.5,
-3.889596, 3, -5.877306, 1, 1.5, 0.5, 0.5,
-3.889596, 3, -5.877306, 0, 1.5, 0.5, 0.5
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
-3.340076, -3.137118, -4,
-3.340076, -3.137118, 4,
-3.340076, -3.137118, -4,
-3.52325, -3.300087, -4,
-3.340076, -3.137118, -2,
-3.52325, -3.300087, -2,
-3.340076, -3.137118, 0,
-3.52325, -3.300087, 0,
-3.340076, -3.137118, 2,
-3.52325, -3.300087, 2,
-3.340076, -3.137118, 4,
-3.52325, -3.300087, 4
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
-3.889596, -3.626026, -4, 0, -0.5, 0.5, 0.5,
-3.889596, -3.626026, -4, 1, -0.5, 0.5, 0.5,
-3.889596, -3.626026, -4, 1, 1.5, 0.5, 0.5,
-3.889596, -3.626026, -4, 0, 1.5, 0.5, 0.5,
-3.889596, -3.626026, -2, 0, -0.5, 0.5, 0.5,
-3.889596, -3.626026, -2, 1, -0.5, 0.5, 0.5,
-3.889596, -3.626026, -2, 1, 1.5, 0.5, 0.5,
-3.889596, -3.626026, -2, 0, 1.5, 0.5, 0.5,
-3.889596, -3.626026, 0, 0, -0.5, 0.5, 0.5,
-3.889596, -3.626026, 0, 1, -0.5, 0.5, 0.5,
-3.889596, -3.626026, 0, 1, 1.5, 0.5, 0.5,
-3.889596, -3.626026, 0, 0, 1.5, 0.5, 0.5,
-3.889596, -3.626026, 2, 0, -0.5, 0.5, 0.5,
-3.889596, -3.626026, 2, 1, -0.5, 0.5, 0.5,
-3.889596, -3.626026, 2, 1, 1.5, 0.5, 0.5,
-3.889596, -3.626026, 2, 0, 1.5, 0.5, 0.5,
-3.889596, -3.626026, 4, 0, -0.5, 0.5, 0.5,
-3.889596, -3.626026, 4, 1, -0.5, 0.5, 0.5,
-3.889596, -3.626026, 4, 1, 1.5, 0.5, 0.5,
-3.889596, -3.626026, 4, 0, 1.5, 0.5, 0.5
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
-3.340076, -3.137118, -5.092487,
-3.340076, 3.381654, -5.092487,
-3.340076, -3.137118, 5.371765,
-3.340076, 3.381654, 5.371765,
-3.340076, -3.137118, -5.092487,
-3.340076, -3.137118, 5.371765,
-3.340076, 3.381654, -5.092487,
-3.340076, 3.381654, 5.371765,
-3.340076, -3.137118, -5.092487,
3.986854, -3.137118, -5.092487,
-3.340076, -3.137118, 5.371765,
3.986854, -3.137118, 5.371765,
-3.340076, 3.381654, -5.092487,
3.986854, 3.381654, -5.092487,
-3.340076, 3.381654, 5.371765,
3.986854, 3.381654, 5.371765,
3.986854, -3.137118, -5.092487,
3.986854, 3.381654, -5.092487,
3.986854, -3.137118, 5.371765,
3.986854, 3.381654, 5.371765,
3.986854, -3.137118, -5.092487,
3.986854, -3.137118, 5.371765,
3.986854, 3.381654, -5.092487,
3.986854, 3.381654, 5.371765
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
var radius = 7.658087;
var distance = 34.0717;
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
mvMatrix.translate( -0.3233887, -0.1222678, -0.1396387 );
mvMatrix.scale( 1.130088, 1.270189, 0.7912724 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.0717);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
bromoxynil<-read.table("bromoxynil.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-bromoxynil$V2
```

```
## Error in eval(expr, envir, enclos): object 'bromoxynil' not found
```

```r
y<-bromoxynil$V3
```

```
## Error in eval(expr, envir, enclos): object 'bromoxynil' not found
```

```r
z<-bromoxynil$V4
```

```
## Error in eval(expr, envir, enclos): object 'bromoxynil' not found
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
-3.233374, 1.265023, -2.111647, 0, 0, 1, 1, 1,
-2.841735, -0.1393823, -1.366668, 1, 0, 0, 1, 1,
-2.671541, 0.7748418, -1.139881, 1, 0, 0, 1, 1,
-2.549238, 0.9656132, -0.3146303, 1, 0, 0, 1, 1,
-2.485114, -0.5877594, -1.123069, 1, 0, 0, 1, 1,
-2.354689, -0.1703697, -1.093463, 1, 0, 0, 1, 1,
-2.163018, 0.2602854, -1.200228, 0, 0, 0, 1, 1,
-2.153085, 0.2303018, -1.195759, 0, 0, 0, 1, 1,
-2.138956, -0.0388407, -1.978329, 0, 0, 0, 1, 1,
-2.119289, 1.798107, -1.300373, 0, 0, 0, 1, 1,
-2.117047, 0.262338, -2.067668, 0, 0, 0, 1, 1,
-2.098303, 0.5720324, -1.66595, 0, 0, 0, 1, 1,
-2.093902, -0.3186413, -2.010232, 0, 0, 0, 1, 1,
-2.04454, -1.518042, -0.9367407, 1, 1, 1, 1, 1,
-2.038762, -0.9756496, -1.599773, 1, 1, 1, 1, 1,
-2.035943, 0.3245972, -3.164688, 1, 1, 1, 1, 1,
-2.019296, 0.4551015, -0.01010105, 1, 1, 1, 1, 1,
-2.002905, -0.5456547, -2.042233, 1, 1, 1, 1, 1,
-2.001059, 0.2659773, -1.464939, 1, 1, 1, 1, 1,
-1.988538, -0.8041484, -1.535868, 1, 1, 1, 1, 1,
-1.987735, 0.9563054, -1.291839, 1, 1, 1, 1, 1,
-1.962457, 0.3095943, -2.219926, 1, 1, 1, 1, 1,
-1.961162, 1.062745, -0.6224202, 1, 1, 1, 1, 1,
-1.952209, -1.174443, -2.706365, 1, 1, 1, 1, 1,
-1.934922, -0.1578101, -0.7317939, 1, 1, 1, 1, 1,
-1.907155, -2.452921, -3.155751, 1, 1, 1, 1, 1,
-1.900172, 0.2113577, -0.8041497, 1, 1, 1, 1, 1,
-1.899899, 1.840658, -1.77265, 1, 1, 1, 1, 1,
-1.897398, 0.5289331, -1.935861, 0, 0, 1, 1, 1,
-1.894381, -1.062413, -0.459506, 1, 0, 0, 1, 1,
-1.88287, 0.007795435, -1.253186, 1, 0, 0, 1, 1,
-1.87743, -0.2444515, -0.5156732, 1, 0, 0, 1, 1,
-1.865117, 1.119258, -1.787074, 1, 0, 0, 1, 1,
-1.861494, -1.238178, -1.916891, 1, 0, 0, 1, 1,
-1.835183, 1.444859, -1.722552, 0, 0, 0, 1, 1,
-1.82688, 0.9114535, 0.4598165, 0, 0, 0, 1, 1,
-1.818588, 0.2308535, -2.233334, 0, 0, 0, 1, 1,
-1.805762, -2.931708, -2.734988, 0, 0, 0, 1, 1,
-1.802198, 1.71693, -1.060704, 0, 0, 0, 1, 1,
-1.792632, -0.4044735, -2.822325, 0, 0, 0, 1, 1,
-1.780459, -0.8113373, -0.7897707, 0, 0, 0, 1, 1,
-1.758504, -0.2392805, -2.658511, 1, 1, 1, 1, 1,
-1.748058, -0.8648673, -0.9198676, 1, 1, 1, 1, 1,
-1.73826, -1.750731, -2.459003, 1, 1, 1, 1, 1,
-1.730229, -1.078382, -2.080975, 1, 1, 1, 1, 1,
-1.729633, 0.4017449, -1.902548, 1, 1, 1, 1, 1,
-1.726739, 1.299214, -0.2209143, 1, 1, 1, 1, 1,
-1.700758, 0.8790811, -1.506795, 1, 1, 1, 1, 1,
-1.646448, 1.155694, 0.6403016, 1, 1, 1, 1, 1,
-1.638968, 0.8328636, -1.96349, 1, 1, 1, 1, 1,
-1.623065, 0.4917966, -1.058598, 1, 1, 1, 1, 1,
-1.618914, -0.4939345, -1.426917, 1, 1, 1, 1, 1,
-1.607358, -1.330271, -2.499407, 1, 1, 1, 1, 1,
-1.60724, 1.568782, -2.110928, 1, 1, 1, 1, 1,
-1.603845, -1.294232, -1.766864, 1, 1, 1, 1, 1,
-1.594269, -1.730399, -3.172071, 1, 1, 1, 1, 1,
-1.591357, -0.3538807, -1.912598, 0, 0, 1, 1, 1,
-1.583635, 0.373055, -0.375398, 1, 0, 0, 1, 1,
-1.582434, 2.367141, -0.1690995, 1, 0, 0, 1, 1,
-1.576043, 0.2192936, -1.358629, 1, 0, 0, 1, 1,
-1.574371, -0.3009278, -2.20391, 1, 0, 0, 1, 1,
-1.571512, -0.6358895, -3.03317, 1, 0, 0, 1, 1,
-1.547439, -0.9328682, -3.510431, 0, 0, 0, 1, 1,
-1.528077, 1.122877, -1.692975, 0, 0, 0, 1, 1,
-1.524323, -0.9027874, -4.353714, 0, 0, 0, 1, 1,
-1.518858, 1.22876, -2.553671, 0, 0, 0, 1, 1,
-1.514402, -0.1381399, -0.9968432, 0, 0, 0, 1, 1,
-1.49696, 0.4839349, -1.733239, 0, 0, 0, 1, 1,
-1.49537, -0.3177318, -1.256043, 0, 0, 0, 1, 1,
-1.495215, -0.1185965, -2.752263, 1, 1, 1, 1, 1,
-1.489747, -0.06191903, -1.085002, 1, 1, 1, 1, 1,
-1.487285, 0.3417103, -0.8871387, 1, 1, 1, 1, 1,
-1.484462, 3.063199, -1.039312, 1, 1, 1, 1, 1,
-1.482518, -1.515862, -2.203956, 1, 1, 1, 1, 1,
-1.481982, 0.9320347, 0.3025246, 1, 1, 1, 1, 1,
-1.476995, -0.6223606, -3.611167, 1, 1, 1, 1, 1,
-1.462352, -0.4397725, -3.563798, 1, 1, 1, 1, 1,
-1.456311, -0.3454264, -3.234375, 1, 1, 1, 1, 1,
-1.451163, -0.9124681, -1.692214, 1, 1, 1, 1, 1,
-1.434738, 0.06914521, -1.384127, 1, 1, 1, 1, 1,
-1.434124, 0.2329697, -2.047861, 1, 1, 1, 1, 1,
-1.417608, -0.1986995, -1.360043, 1, 1, 1, 1, 1,
-1.399429, 0.5898056, -0.5569992, 1, 1, 1, 1, 1,
-1.396311, 2.920892, -1.709433, 1, 1, 1, 1, 1,
-1.389414, -1.351345, -2.628401, 0, 0, 1, 1, 1,
-1.388695, -0.03410441, -2.89623, 1, 0, 0, 1, 1,
-1.381951, -2.162023, -2.904423, 1, 0, 0, 1, 1,
-1.381212, -0.2057917, -2.561487, 1, 0, 0, 1, 1,
-1.380694, -0.5585795, -1.597623, 1, 0, 0, 1, 1,
-1.367957, -0.6968773, -1.526163, 1, 0, 0, 1, 1,
-1.360295, 1.028031, -0.9131123, 0, 0, 0, 1, 1,
-1.359453, -0.3822349, -2.786722, 0, 0, 0, 1, 1,
-1.356171, -0.9208261, -2.120548, 0, 0, 0, 1, 1,
-1.347515, 0.005501478, -2.457001, 0, 0, 0, 1, 1,
-1.343524, 1.4528, -1.783531, 0, 0, 0, 1, 1,
-1.342501, 0.3906989, -2.300093, 0, 0, 0, 1, 1,
-1.33315, 0.2953947, -1.799698, 0, 0, 0, 1, 1,
-1.332174, -0.2768766, 0.1440696, 1, 1, 1, 1, 1,
-1.32024, 0.5731808, -1.156539, 1, 1, 1, 1, 1,
-1.303998, -2.456764, -2.340665, 1, 1, 1, 1, 1,
-1.294318, -0.2511654, -3.543523, 1, 1, 1, 1, 1,
-1.275683, -0.6492683, -0.7961305, 1, 1, 1, 1, 1,
-1.269269, -1.258272, -2.866879, 1, 1, 1, 1, 1,
-1.264708, -1.784734, -0.345411, 1, 1, 1, 1, 1,
-1.241805, -1.505177, -3.710992, 1, 1, 1, 1, 1,
-1.23516, -0.02567835, -3.166845, 1, 1, 1, 1, 1,
-1.233559, 2.86758, 0.5684142, 1, 1, 1, 1, 1,
-1.231813, -1.04387, -2.594467, 1, 1, 1, 1, 1,
-1.224952, 0.6157074, -0.3624183, 1, 1, 1, 1, 1,
-1.218606, 0.2066313, 0.3456498, 1, 1, 1, 1, 1,
-1.217691, 0.2248544, 0.1168361, 1, 1, 1, 1, 1,
-1.216188, 0.3888585, -2.915163, 1, 1, 1, 1, 1,
-1.206822, 0.09707327, -0.2845589, 0, 0, 1, 1, 1,
-1.203457, -0.1468922, -0.7813836, 1, 0, 0, 1, 1,
-1.201153, 0.5103398, -2.031694, 1, 0, 0, 1, 1,
-1.199524, -0.6518881, -1.185167, 1, 0, 0, 1, 1,
-1.191112, -1.500738, -3.755471, 1, 0, 0, 1, 1,
-1.190437, -0.04085508, -2.379994, 1, 0, 0, 1, 1,
-1.190335, 0.8917409, 0.3019749, 0, 0, 0, 1, 1,
-1.190042, -0.1204243, -3.254393, 0, 0, 0, 1, 1,
-1.188133, -1.356674, -3.01376, 0, 0, 0, 1, 1,
-1.186997, -0.6009331, -2.670085, 0, 0, 0, 1, 1,
-1.182387, -1.712844, -2.116235, 0, 0, 0, 1, 1,
-1.181499, -0.9995423, -1.072955, 0, 0, 0, 1, 1,
-1.175967, 0.09257771, -0.4999494, 0, 0, 0, 1, 1,
-1.169922, 0.7037854, -2.454594, 1, 1, 1, 1, 1,
-1.16937, -0.698302, -2.111289, 1, 1, 1, 1, 1,
-1.156937, -0.4775794, -1.254682, 1, 1, 1, 1, 1,
-1.156699, -0.07241857, -1.08492, 1, 1, 1, 1, 1,
-1.155035, -0.185336, -2.220177, 1, 1, 1, 1, 1,
-1.152444, -0.5689325, -2.004298, 1, 1, 1, 1, 1,
-1.145276, -0.7230281, -2.307991, 1, 1, 1, 1, 1,
-1.139743, -1.146176, -3.080568, 1, 1, 1, 1, 1,
-1.126095, -1.887399, -2.866482, 1, 1, 1, 1, 1,
-1.112807, 0.4137319, -0.9137018, 1, 1, 1, 1, 1,
-1.110133, -0.6644694, -1.331418, 1, 1, 1, 1, 1,
-1.109976, 0.0801469, -2.503634, 1, 1, 1, 1, 1,
-1.103548, 0.8445857, -2.022952, 1, 1, 1, 1, 1,
-1.0988, 0.6868624, -1.835589, 1, 1, 1, 1, 1,
-1.094365, 0.1091076, 0.02804616, 1, 1, 1, 1, 1,
-1.084478, 0.4137529, -1.759331, 0, 0, 1, 1, 1,
-1.0785, -0.1388407, -2.678384, 1, 0, 0, 1, 1,
-1.076478, -0.9939853, -4.244841, 1, 0, 0, 1, 1,
-1.074201, -0.09062701, -1.009275, 1, 0, 0, 1, 1,
-1.072503, 0.6545966, -2.033737, 1, 0, 0, 1, 1,
-1.066189, -0.1020704, -2.068288, 1, 0, 0, 1, 1,
-1.062332, 0.1562929, -0.5982639, 0, 0, 0, 1, 1,
-1.058446, 0.2925015, -1.449308, 0, 0, 0, 1, 1,
-1.056762, -0.9209674, -2.807176, 0, 0, 0, 1, 1,
-1.043546, 0.5567783, -1.517074, 0, 0, 0, 1, 1,
-1.029466, 0.3392038, -0.4342453, 0, 0, 0, 1, 1,
-1.024106, 1.726863, -0.6340239, 0, 0, 0, 1, 1,
-1.017111, 0.9157853, -2.256324, 0, 0, 0, 1, 1,
-1.015954, -0.1932847, -4.204049, 1, 1, 1, 1, 1,
-1.014487, 0.1464105, -2.696828, 1, 1, 1, 1, 1,
-1.00945, 1.942369, -0.06314927, 1, 1, 1, 1, 1,
-1.003439, -0.7161087, -1.369731, 1, 1, 1, 1, 1,
-0.9989226, -1.239284, -3.537257, 1, 1, 1, 1, 1,
-0.9907222, -0.3043481, -2.78594, 1, 1, 1, 1, 1,
-0.9803873, 0.2110902, -0.4793212, 1, 1, 1, 1, 1,
-0.9789107, -0.005959862, -1.286634, 1, 1, 1, 1, 1,
-0.9712188, 2.106252, 0.8737305, 1, 1, 1, 1, 1,
-0.9685979, -0.3380915, -2.261374, 1, 1, 1, 1, 1,
-0.9683192, 2.464041, 0.005564844, 1, 1, 1, 1, 1,
-0.9569941, 0.2426164, -2.556175, 1, 1, 1, 1, 1,
-0.9550917, 0.1695856, -0.6903336, 1, 1, 1, 1, 1,
-0.9512026, -0.2439838, -2.109863, 1, 1, 1, 1, 1,
-0.9480928, -0.1858672, -1.660939, 1, 1, 1, 1, 1,
-0.9450426, -0.2608983, 0.6660454, 0, 0, 1, 1, 1,
-0.9403346, 0.3946624, -2.583192, 1, 0, 0, 1, 1,
-0.9349161, 0.6738678, -0.6601669, 1, 0, 0, 1, 1,
-0.9337962, -0.2175059, -3.344344, 1, 0, 0, 1, 1,
-0.9329326, -1.396678, -4.064507, 1, 0, 0, 1, 1,
-0.9321741, 1.022916, -0.303079, 1, 0, 0, 1, 1,
-0.9311789, -1.119203, -1.697738, 0, 0, 0, 1, 1,
-0.9282192, -2.039164, -2.404179, 0, 0, 0, 1, 1,
-0.9280904, 0.3804638, -0.5930319, 0, 0, 0, 1, 1,
-0.9257979, -0.04561822, -0.5818545, 0, 0, 0, 1, 1,
-0.9257154, 0.06340972, -0.6509208, 0, 0, 0, 1, 1,
-0.9254082, -0.5557177, -3.287827, 0, 0, 0, 1, 1,
-0.9178401, 0.1847775, -1.39639, 0, 0, 0, 1, 1,
-0.912784, 0.6601635, 1.227074, 1, 1, 1, 1, 1,
-0.9016892, 0.1205462, -1.393974, 1, 1, 1, 1, 1,
-0.9014534, -1.067533, -3.012352, 1, 1, 1, 1, 1,
-0.8998382, 0.9668352, -1.447128, 1, 1, 1, 1, 1,
-0.8987342, -0.9406837, -2.030225, 1, 1, 1, 1, 1,
-0.8932064, -0.279119, -0.02398992, 1, 1, 1, 1, 1,
-0.8911659, -0.8284277, -2.542083, 1, 1, 1, 1, 1,
-0.8904845, -1.787462, -2.521196, 1, 1, 1, 1, 1,
-0.8828068, -0.6066282, -1.359598, 1, 1, 1, 1, 1,
-0.8805177, -0.4232591, -2.435769, 1, 1, 1, 1, 1,
-0.873053, 0.649112, -0.9257231, 1, 1, 1, 1, 1,
-0.8711467, -0.8459025, -2.411721, 1, 1, 1, 1, 1,
-0.8710033, -1.624158, -3.975734, 1, 1, 1, 1, 1,
-0.8703603, -0.02747309, -1.567258, 1, 1, 1, 1, 1,
-0.8659276, 0.9701985, -2.371463, 1, 1, 1, 1, 1,
-0.8629957, 0.2610928, -0.5286031, 0, 0, 1, 1, 1,
-0.86223, -0.1120243, -0.7995678, 1, 0, 0, 1, 1,
-0.8601333, 0.09967288, -1.556118, 1, 0, 0, 1, 1,
-0.8513497, -0.386899, -1.761893, 1, 0, 0, 1, 1,
-0.8502753, -1.635809, -2.021884, 1, 0, 0, 1, 1,
-0.8502628, 0.3605, -1.661968, 1, 0, 0, 1, 1,
-0.8470243, -0.8422818, -2.17525, 0, 0, 0, 1, 1,
-0.8412226, -0.4581254, -2.673395, 0, 0, 0, 1, 1,
-0.8372759, 0.2181346, -0.8578082, 0, 0, 0, 1, 1,
-0.8363151, -2.101538, -2.874513, 0, 0, 0, 1, 1,
-0.8347205, 0.578723, -0.09409701, 0, 0, 0, 1, 1,
-0.8335325, -1.277005, -3.974065, 0, 0, 0, 1, 1,
-0.8247174, 0.3009207, -2.008075, 0, 0, 0, 1, 1,
-0.8204724, 1.349275, 0.8551323, 1, 1, 1, 1, 1,
-0.8191915, -0.4469551, -1.859767, 1, 1, 1, 1, 1,
-0.8119041, -0.1688881, -1.867532, 1, 1, 1, 1, 1,
-0.8090538, 1.220274, -1.252785, 1, 1, 1, 1, 1,
-0.8083242, -0.1366052, -1.140506, 1, 1, 1, 1, 1,
-0.8080001, 0.5725898, -2.516487, 1, 1, 1, 1, 1,
-0.8032208, -0.5934721, -4.522356, 1, 1, 1, 1, 1,
-0.7933121, 1.766165, -0.9993947, 1, 1, 1, 1, 1,
-0.7891622, -1.001169, -1.643013, 1, 1, 1, 1, 1,
-0.7883404, -0.5604764, -2.697054, 1, 1, 1, 1, 1,
-0.7875379, 0.856401, -0.8632004, 1, 1, 1, 1, 1,
-0.7866223, -1.061938, -0.2210555, 1, 1, 1, 1, 1,
-0.7855315, -1.654485, -3.34767, 1, 1, 1, 1, 1,
-0.7795606, -1.523214, -4.816297, 1, 1, 1, 1, 1,
-0.7792311, 0.4251091, -1.871919, 1, 1, 1, 1, 1,
-0.7771634, 0.8364986, 0.6821465, 0, 0, 1, 1, 1,
-0.7757018, 0.02303046, -2.323837, 1, 0, 0, 1, 1,
-0.7659016, 1.082443, -0.9419296, 1, 0, 0, 1, 1,
-0.765232, 0.4007383, -0.624166, 1, 0, 0, 1, 1,
-0.7650706, -1.59872, -2.09483, 1, 0, 0, 1, 1,
-0.7624768, 0.2325555, -2.397605, 1, 0, 0, 1, 1,
-0.7548264, 0.3667751, -2.807105, 0, 0, 0, 1, 1,
-0.7533812, 1.623955, 1.048088, 0, 0, 0, 1, 1,
-0.7499106, -1.611952, -2.267551, 0, 0, 0, 1, 1,
-0.7480695, 1.892925, -0.3319979, 0, 0, 0, 1, 1,
-0.7480549, 0.2821719, -1.918668, 0, 0, 0, 1, 1,
-0.7461702, 1.798573, -0.6468161, 0, 0, 0, 1, 1,
-0.7420758, 0.431886, -1.3829, 0, 0, 0, 1, 1,
-0.7412264, -0.07356662, -3.601727, 1, 1, 1, 1, 1,
-0.7393745, 0.1386872, -0.05202568, 1, 1, 1, 1, 1,
-0.7392067, -0.6345426, -1.201384, 1, 1, 1, 1, 1,
-0.7349637, -0.5591484, -2.483949, 1, 1, 1, 1, 1,
-0.7343068, 0.1000769, -1.637444, 1, 1, 1, 1, 1,
-0.7314906, 0.4109048, -1.436413, 1, 1, 1, 1, 1,
-0.7290348, -0.9154148, -2.640836, 1, 1, 1, 1, 1,
-0.7273352, 2.012863, 2.049678, 1, 1, 1, 1, 1,
-0.7270767, 0.4892329, -2.004636, 1, 1, 1, 1, 1,
-0.7240984, 0.6220156, -1.795541, 1, 1, 1, 1, 1,
-0.7231516, 1.042216, 0.4940052, 1, 1, 1, 1, 1,
-0.704173, -0.5825974, -0.7598045, 1, 1, 1, 1, 1,
-0.6989634, -0.1933792, -3.048038, 1, 1, 1, 1, 1,
-0.6986225, 0.8003948, 0.6368971, 1, 1, 1, 1, 1,
-0.6933204, 1.4428, -1.112596, 1, 1, 1, 1, 1,
-0.6916221, -0.4521062, -0.3060764, 0, 0, 1, 1, 1,
-0.6890835, 1.66241, -1.158159, 1, 0, 0, 1, 1,
-0.6876673, -1.752733, -3.720577, 1, 0, 0, 1, 1,
-0.6867066, -0.5540227, -4.434015, 1, 0, 0, 1, 1,
-0.6848253, 0.5155061, -0.2840178, 1, 0, 0, 1, 1,
-0.682721, -1.197873, -2.897193, 1, 0, 0, 1, 1,
-0.6825475, -0.02621833, -0.5071936, 0, 0, 0, 1, 1,
-0.6821103, 1.038531, -0.6665677, 0, 0, 0, 1, 1,
-0.6782048, -0.3847317, -2.689106, 0, 0, 0, 1, 1,
-0.6780198, -1.139316, -3.730523, 0, 0, 0, 1, 1,
-0.6736668, -0.08352165, -3.775344, 0, 0, 0, 1, 1,
-0.6688672, -2.283819, -4.109017, 0, 0, 0, 1, 1,
-0.6683076, -0.5000626, -2.355055, 0, 0, 0, 1, 1,
-0.6650614, -0.4845908, -3.155903, 1, 1, 1, 1, 1,
-0.6648638, -1.135777, -3.246187, 1, 1, 1, 1, 1,
-0.6572537, -0.3378018, -1.810647, 1, 1, 1, 1, 1,
-0.6566957, 0.0104143, -2.353486, 1, 1, 1, 1, 1,
-0.6560591, -0.3102874, -2.891654, 1, 1, 1, 1, 1,
-0.6530446, -1.529692, -1.883375, 1, 1, 1, 1, 1,
-0.6485412, -0.0009604013, -2.003192, 1, 1, 1, 1, 1,
-0.6462932, -0.5135849, -2.092459, 1, 1, 1, 1, 1,
-0.6401944, 1.381506, 0.2126722, 1, 1, 1, 1, 1,
-0.6401761, 0.5141006, -1.434767, 1, 1, 1, 1, 1,
-0.6388139, 0.8577098, -1.190678, 1, 1, 1, 1, 1,
-0.6384159, -2.243944, -2.815893, 1, 1, 1, 1, 1,
-0.6360077, -0.8081155, -3.211636, 1, 1, 1, 1, 1,
-0.6300504, -1.041014, -1.258302, 1, 1, 1, 1, 1,
-0.6251535, -0.08321903, -0.1477891, 1, 1, 1, 1, 1,
-0.6161168, 1.670338, -0.8807105, 0, 0, 1, 1, 1,
-0.6146793, 2.265479, 0.2943591, 1, 0, 0, 1, 1,
-0.6139898, -0.9102773, -4.112411, 1, 0, 0, 1, 1,
-0.6116152, -1.279921, -4.08924, 1, 0, 0, 1, 1,
-0.6083865, -0.329011, -1.999448, 1, 0, 0, 1, 1,
-0.598703, 1.776422, -0.93292, 1, 0, 0, 1, 1,
-0.5971112, -0.5959595, -2.469005, 0, 0, 0, 1, 1,
-0.584115, -1.017315, -2.973584, 0, 0, 0, 1, 1,
-0.5836088, 0.6527473, 0.1932094, 0, 0, 0, 1, 1,
-0.5785868, -1.4267, -2.089212, 0, 0, 0, 1, 1,
-0.5785178, -0.2853751, 1.024848, 0, 0, 0, 1, 1,
-0.5781184, 0.0554603, 0.5739356, 0, 0, 0, 1, 1,
-0.5740004, 0.1779415, -2.268171, 0, 0, 0, 1, 1,
-0.573878, 0.4510763, -0.08989941, 1, 1, 1, 1, 1,
-0.5722613, -0.407642, -2.627307, 1, 1, 1, 1, 1,
-0.5658608, -0.926156, -2.288252, 1, 1, 1, 1, 1,
-0.5636589, -0.8875549, -2.257421, 1, 1, 1, 1, 1,
-0.5612206, 0.3922012, -2.647693, 1, 1, 1, 1, 1,
-0.5605593, -0.4237468, -2.730866, 1, 1, 1, 1, 1,
-0.5598192, 1.310771, -1.60049, 1, 1, 1, 1, 1,
-0.5584262, -0.834971, -2.53805, 1, 1, 1, 1, 1,
-0.5544806, -0.8130404, -1.935579, 1, 1, 1, 1, 1,
-0.553394, -0.3792058, -2.395614, 1, 1, 1, 1, 1,
-0.553122, 1.339979, -0.9962319, 1, 1, 1, 1, 1,
-0.5385177, 0.1301928, -0.8640047, 1, 1, 1, 1, 1,
-0.5312555, -0.8891902, -2.026865, 1, 1, 1, 1, 1,
-0.52757, -0.05340772, -1.251877, 1, 1, 1, 1, 1,
-0.5241774, -0.05410436, -2.455943, 1, 1, 1, 1, 1,
-0.5238014, -1.03981, -3.701374, 0, 0, 1, 1, 1,
-0.5234624, -2.071465, -2.829942, 1, 0, 0, 1, 1,
-0.5201659, 0.5522072, -1.010713, 1, 0, 0, 1, 1,
-0.5169466, -0.8406425, -1.752472, 1, 0, 0, 1, 1,
-0.51446, -0.5405011, -1.333311, 1, 0, 0, 1, 1,
-0.5132343, -0.3248474, -3.94533, 1, 0, 0, 1, 1,
-0.5076662, 0.7006344, 0.6669363, 0, 0, 0, 1, 1,
-0.5067223, -0.4006934, -4.453172, 0, 0, 0, 1, 1,
-0.5007643, -0.2485993, -1.946132, 0, 0, 0, 1, 1,
-0.5007532, -0.7507213, -3.771211, 0, 0, 0, 1, 1,
-0.5000263, 0.1295874, -2.57021, 0, 0, 0, 1, 1,
-0.4996569, -0.3034176, -3.03555, 0, 0, 0, 1, 1,
-0.498877, 1.508568, -1.374214, 0, 0, 0, 1, 1,
-0.4987194, 0.1846185, -1.902946, 1, 1, 1, 1, 1,
-0.4899472, -2.022921, -3.433562, 1, 1, 1, 1, 1,
-0.4847874, 0.5766429, -2.36636, 1, 1, 1, 1, 1,
-0.4842155, 1.304684, 0.5316229, 1, 1, 1, 1, 1,
-0.4733734, 0.1102117, -0.2082209, 1, 1, 1, 1, 1,
-0.4726163, -0.503124, -2.351526, 1, 1, 1, 1, 1,
-0.4661497, -0.7023326, -3.569876, 1, 1, 1, 1, 1,
-0.4659558, -0.5894852, -2.220153, 1, 1, 1, 1, 1,
-0.4632015, 0.4233894, 0.4550233, 1, 1, 1, 1, 1,
-0.4614745, 1.418418, -0.2251171, 1, 1, 1, 1, 1,
-0.4590777, 0.01697873, -1.387103, 1, 1, 1, 1, 1,
-0.4588617, -2.152768, -3.688934, 1, 1, 1, 1, 1,
-0.4586157, -0.2605541, -1.525458, 1, 1, 1, 1, 1,
-0.4581335, 1.027904, -0.4935067, 1, 1, 1, 1, 1,
-0.4505289, -0.4093344, -2.275016, 1, 1, 1, 1, 1,
-0.4497493, -0.31822, -1.091896, 0, 0, 1, 1, 1,
-0.445764, 0.06800759, -1.068151, 1, 0, 0, 1, 1,
-0.4393634, -1.417907, -4.878461, 1, 0, 0, 1, 1,
-0.439094, -0.2414055, -3.106187, 1, 0, 0, 1, 1,
-0.4389697, -0.4146668, -1.691335, 1, 0, 0, 1, 1,
-0.4352383, -1.151061, -4.210209, 1, 0, 0, 1, 1,
-0.4336315, -0.2658579, -1.963921, 0, 0, 0, 1, 1,
-0.4317762, 1.168832, 0.3427059, 0, 0, 0, 1, 1,
-0.4226241, -1.57306, -1.8234, 0, 0, 0, 1, 1,
-0.4178729, 0.6886508, 0.5673957, 0, 0, 0, 1, 1,
-0.4113916, 0.4260387, -1.332113, 0, 0, 0, 1, 1,
-0.4100773, -1.744988, -4.450305, 0, 0, 0, 1, 1,
-0.4089739, -0.3951484, -2.037781, 0, 0, 0, 1, 1,
-0.4044521, -0.2846233, -2.078783, 1, 1, 1, 1, 1,
-0.3942919, 0.02864716, -1.376199, 1, 1, 1, 1, 1,
-0.3893264, -0.2417171, -3.731387, 1, 1, 1, 1, 1,
-0.382736, 1.04648, -0.1958114, 1, 1, 1, 1, 1,
-0.3805241, -1.67954, -4.249238, 1, 1, 1, 1, 1,
-0.3776988, -0.4676431, -0.5882334, 1, 1, 1, 1, 1,
-0.3750521, -0.307841, -1.490714, 1, 1, 1, 1, 1,
-0.371545, -2.055731, -1.402743, 1, 1, 1, 1, 1,
-0.3657991, -0.7551326, -1.625329, 1, 1, 1, 1, 1,
-0.3637079, -0.5427275, -1.979115, 1, 1, 1, 1, 1,
-0.3611161, -1.293745, -3.487216, 1, 1, 1, 1, 1,
-0.3600886, -1.62236, -3.709939, 1, 1, 1, 1, 1,
-0.35507, -0.5245439, -2.179307, 1, 1, 1, 1, 1,
-0.349696, 0.9155511, 0.7912957, 1, 1, 1, 1, 1,
-0.3495016, 1.0912, -0.1460373, 1, 1, 1, 1, 1,
-0.3479825, 0.9509652, 0.325115, 0, 0, 1, 1, 1,
-0.3450834, 0.2587283, -0.6822036, 1, 0, 0, 1, 1,
-0.3446859, 1.588277, -0.07073201, 1, 0, 0, 1, 1,
-0.343675, -0.8357614, -2.485151, 1, 0, 0, 1, 1,
-0.3416153, 1.444635, 0.6191067, 1, 0, 0, 1, 1,
-0.3352939, 1.202167, -1.862445, 1, 0, 0, 1, 1,
-0.3352472, -0.6809765, -2.205368, 0, 0, 0, 1, 1,
-0.3321087, -1.32005, -3.354031, 0, 0, 0, 1, 1,
-0.3269083, -1.558007, -3.746133, 0, 0, 0, 1, 1,
-0.3252992, -1.035952, -2.709656, 0, 0, 0, 1, 1,
-0.3237891, 0.4543608, -0.02174491, 0, 0, 0, 1, 1,
-0.3235555, -0.6841842, -1.826702, 0, 0, 0, 1, 1,
-0.3218283, 1.795304, -0.6955047, 0, 0, 0, 1, 1,
-0.3147576, 0.6459703, -0.8916703, 1, 1, 1, 1, 1,
-0.3114666, -2.163925, -1.254238, 1, 1, 1, 1, 1,
-0.3090664, -0.1414357, -1.712998, 1, 1, 1, 1, 1,
-0.3072167, 1.93376, 0.8878651, 1, 1, 1, 1, 1,
-0.3050787, 1.314283, 0.4128324, 1, 1, 1, 1, 1,
-0.3048467, 0.3391926, -0.8508866, 1, 1, 1, 1, 1,
-0.3043116, -0.04400832, -0.9335819, 1, 1, 1, 1, 1,
-0.3023914, 0.7365915, 0.5239511, 1, 1, 1, 1, 1,
-0.2989735, 0.9597049, -1.876424, 1, 1, 1, 1, 1,
-0.2984436, 1.110348, -0.2676361, 1, 1, 1, 1, 1,
-0.2950396, -0.03679537, -1.258115, 1, 1, 1, 1, 1,
-0.2941925, 0.4907682, -0.5229272, 1, 1, 1, 1, 1,
-0.2937937, 0.7517318, 0.06862941, 1, 1, 1, 1, 1,
-0.2920134, -0.6473479, -3.174035, 1, 1, 1, 1, 1,
-0.290915, 1.285758, -0.05088222, 1, 1, 1, 1, 1,
-0.2851093, 0.6417621, -0.5313798, 0, 0, 1, 1, 1,
-0.2807713, -0.6297565, 0.6618625, 1, 0, 0, 1, 1,
-0.2778617, 0.6848034, 0.6008153, 1, 0, 0, 1, 1,
-0.2736933, -0.9409324, -2.04359, 1, 0, 0, 1, 1,
-0.2685202, 3.28672, 0.9504962, 1, 0, 0, 1, 1,
-0.2648988, -0.3733422, -1.328984, 1, 0, 0, 1, 1,
-0.2605421, 0.1305743, -1.534549, 0, 0, 0, 1, 1,
-0.2454455, -0.4060813, -0.3900414, 0, 0, 0, 1, 1,
-0.2434143, 0.5866104, -0.7787477, 0, 0, 0, 1, 1,
-0.2384445, -0.2383223, -1.996144, 0, 0, 0, 1, 1,
-0.226918, -0.1636938, -1.797018, 0, 0, 0, 1, 1,
-0.2243043, 0.7638587, -0.0710749, 0, 0, 0, 1, 1,
-0.2235371, -0.0915578, -2.704409, 0, 0, 0, 1, 1,
-0.2228031, -1.837681, -3.640499, 1, 1, 1, 1, 1,
-0.219369, 1.410103, 1.643876, 1, 1, 1, 1, 1,
-0.2158479, 1.545907, -0.587812, 1, 1, 1, 1, 1,
-0.2109635, -0.3425153, -0.07578882, 1, 1, 1, 1, 1,
-0.2062352, -0.3376618, -0.4663676, 1, 1, 1, 1, 1,
-0.2053207, -0.649581, -1.828188, 1, 1, 1, 1, 1,
-0.1991643, 1.453295, -1.047714, 1, 1, 1, 1, 1,
-0.1981837, -0.9504979, -3.098647, 1, 1, 1, 1, 1,
-0.197889, 0.8905182, -1.202674, 1, 1, 1, 1, 1,
-0.1964072, 1.198581, -1.914564, 1, 1, 1, 1, 1,
-0.1961967, 2.042789, -0.1331661, 1, 1, 1, 1, 1,
-0.1961128, 0.01779423, -1.448638, 1, 1, 1, 1, 1,
-0.18905, 1.712675, -0.691365, 1, 1, 1, 1, 1,
-0.1847164, -0.6126823, -2.560063, 1, 1, 1, 1, 1,
-0.1830368, -0.7989308, -1.932555, 1, 1, 1, 1, 1,
-0.1805966, -0.3524266, -1.755929, 0, 0, 1, 1, 1,
-0.1799968, 0.9432682, 0.2942949, 1, 0, 0, 1, 1,
-0.179061, -0.6453797, -3.489341, 1, 0, 0, 1, 1,
-0.177818, 1.020036, 0.7087306, 1, 0, 0, 1, 1,
-0.1745738, 0.4018677, -1.182646, 1, 0, 0, 1, 1,
-0.1731698, -0.8862046, -3.741013, 1, 0, 0, 1, 1,
-0.1719278, 1.1919, -1.5894, 0, 0, 0, 1, 1,
-0.1696879, -1.758399, -3.246121, 0, 0, 0, 1, 1,
-0.1644857, 0.4924736, 0.6602795, 0, 0, 0, 1, 1,
-0.1630255, -0.1888643, -2.136626, 0, 0, 0, 1, 1,
-0.1612969, -1.757307, -2.529247, 0, 0, 0, 1, 1,
-0.1609216, -2.167965, -3.302977, 0, 0, 0, 1, 1,
-0.1599231, 0.08789598, -1.748995, 0, 0, 0, 1, 1,
-0.159283, 1.527695, -0.03543357, 1, 1, 1, 1, 1,
-0.1590631, -0.9398946, -4.40584, 1, 1, 1, 1, 1,
-0.1584339, 0.8863584, -0.7833571, 1, 1, 1, 1, 1,
-0.1505215, -0.1796078, -1.558126, 1, 1, 1, 1, 1,
-0.1454006, 0.460248, -1.861048, 1, 1, 1, 1, 1,
-0.1398966, -0.1570765, -1.480067, 1, 1, 1, 1, 1,
-0.136069, -0.01795648, -3.247004, 1, 1, 1, 1, 1,
-0.135549, -0.3337911, -3.463334, 1, 1, 1, 1, 1,
-0.1341439, 0.2805771, -0.1898032, 1, 1, 1, 1, 1,
-0.1330199, -0.8355669, -1.874607, 1, 1, 1, 1, 1,
-0.1209293, -0.1664336, -0.4459373, 1, 1, 1, 1, 1,
-0.1200947, -1.079267, -2.886741, 1, 1, 1, 1, 1,
-0.1184435, 0.3014473, -1.000924, 1, 1, 1, 1, 1,
-0.1169842, 0.7712362, 0.4744825, 1, 1, 1, 1, 1,
-0.1139947, -0.04956915, -2.066968, 1, 1, 1, 1, 1,
-0.1126478, 0.01079515, -0.9826714, 0, 0, 1, 1, 1,
-0.1119636, -0.9597676, -2.586608, 1, 0, 0, 1, 1,
-0.111043, -2.347477, -2.485973, 1, 0, 0, 1, 1,
-0.1092905, 0.1307941, -0.5727745, 1, 0, 0, 1, 1,
-0.1087888, -1.169938, -3.504975, 1, 0, 0, 1, 1,
-0.1086784, -0.1132064, -1.745773, 1, 0, 0, 1, 1,
-0.1065218, 0.7617233, -0.6950371, 0, 0, 0, 1, 1,
-0.1054894, -0.508664, -3.268996, 0, 0, 0, 1, 1,
-0.1047323, -0.05343645, -1.967874, 0, 0, 0, 1, 1,
-0.1025238, -2.011073, -2.801216, 0, 0, 0, 1, 1,
-0.1012306, -0.5573274, -2.719288, 0, 0, 0, 1, 1,
-0.09928425, -1.751001, -1.830062, 0, 0, 0, 1, 1,
-0.09489223, 0.205301, 0.4265791, 0, 0, 0, 1, 1,
-0.09413277, 1.021913, 1.196512, 1, 1, 1, 1, 1,
-0.09195307, -0.3335136, -2.90472, 1, 1, 1, 1, 1,
-0.09193393, -0.4019562, -1.556909, 1, 1, 1, 1, 1,
-0.09093557, -0.3836203, -3.90641, 1, 1, 1, 1, 1,
-0.08901977, -1.426131, -2.361799, 1, 1, 1, 1, 1,
-0.07992075, -1.275073, -2.207974, 1, 1, 1, 1, 1,
-0.0794572, -0.3458254, -2.786938, 1, 1, 1, 1, 1,
-0.07764311, 1.946277, 1.275754, 1, 1, 1, 1, 1,
-0.07280636, 2.27628, -0.7486436, 1, 1, 1, 1, 1,
-0.06765982, -0.5885081, -2.890461, 1, 1, 1, 1, 1,
-0.06496621, -0.262988, -1.938083, 1, 1, 1, 1, 1,
-0.06481542, -0.8036206, -4.351523, 1, 1, 1, 1, 1,
-0.0613117, 0.5531826, -1.458808, 1, 1, 1, 1, 1,
-0.0606138, 1.730076, 1.393291, 1, 1, 1, 1, 1,
-0.05863406, 1.333008, 0.8457862, 1, 1, 1, 1, 1,
-0.05801927, 2.04854, 0.02510191, 0, 0, 1, 1, 1,
-0.05330637, 2.041559, -1.001782, 1, 0, 0, 1, 1,
-0.05289157, 0.5898213, -1.128617, 1, 0, 0, 1, 1,
-0.05075784, 1.43553, 0.989839, 1, 0, 0, 1, 1,
-0.04911698, 0.9660255, 1.881714, 1, 0, 0, 1, 1,
-0.04457019, -0.1535036, -3.082392, 1, 0, 0, 1, 1,
-0.04413614, 0.09597669, -2.13277, 0, 0, 0, 1, 1,
-0.04325932, -1.094929, -1.117679, 0, 0, 0, 1, 1,
-0.04271528, -0.8247328, -3.405463, 0, 0, 0, 1, 1,
-0.04247143, -1.411285, -2.733869, 0, 0, 0, 1, 1,
-0.0414333, -0.5515733, -3.509474, 0, 0, 0, 1, 1,
-0.03669971, -0.4759536, -3.763142, 0, 0, 0, 1, 1,
-0.02832005, -0.3951689, -3.196587, 0, 0, 0, 1, 1,
-0.02499472, -0.01028427, -0.8869936, 1, 1, 1, 1, 1,
-0.02408847, 0.4920647, -1.0757, 1, 1, 1, 1, 1,
-0.02069911, -1.80952, -4.518626, 1, 1, 1, 1, 1,
-0.01997416, -0.2036606, -2.435544, 1, 1, 1, 1, 1,
-0.0144054, 0.6357049, -0.1772942, 1, 1, 1, 1, 1,
-0.01166862, 0.006448885, -1.54761, 1, 1, 1, 1, 1,
-0.01087762, 1.369804, -1.296107, 1, 1, 1, 1, 1,
-0.01051481, 2.004473, -1.002229, 1, 1, 1, 1, 1,
-0.01004571, -0.5640551, -3.799821, 1, 1, 1, 1, 1,
-0.008430335, -0.4766149, -2.061093, 1, 1, 1, 1, 1,
-0.005761196, -0.1433475, -3.693203, 1, 1, 1, 1, 1,
-0.005563019, 0.9574634, 0.09540866, 1, 1, 1, 1, 1,
-0.005439739, -0.9216085, -3.393351, 1, 1, 1, 1, 1,
-0.00473796, -1.508553, -4.561947, 1, 1, 1, 1, 1,
-0.004459683, -0.03128118, -3.521923, 1, 1, 1, 1, 1,
-0.004114468, 0.3415719, 3.171028, 0, 0, 1, 1, 1,
-0.003226828, -1.902811, -4.940095, 1, 0, 0, 1, 1,
-5.322016e-05, 0.2484247, -0.4358999, 1, 0, 0, 1, 1,
0.01183157, -0.8509101, 3.420867, 1, 0, 0, 1, 1,
0.01338002, 0.2134931, -1.5007, 1, 0, 0, 1, 1,
0.01415699, 0.6296287, 0.01053163, 1, 0, 0, 1, 1,
0.01589156, 1.353068, 0.5037913, 0, 0, 0, 1, 1,
0.01671231, 1.191349, 1.070335, 0, 0, 0, 1, 1,
0.03571135, -0.8272664, 3.343492, 0, 0, 0, 1, 1,
0.04800881, 0.6134219, 1.375045, 0, 0, 0, 1, 1,
0.04805896, -0.3112583, 4.013701, 0, 0, 0, 1, 1,
0.04818558, -0.1869596, 3.235317, 0, 0, 0, 1, 1,
0.05104798, 1.301558, -2.134773, 0, 0, 0, 1, 1,
0.06180336, -0.5278801, 3.106613, 1, 1, 1, 1, 1,
0.06200774, -0.945286, 3.884631, 1, 1, 1, 1, 1,
0.06365398, -0.7651551, 4.380413, 1, 1, 1, 1, 1,
0.0644995, -1.957352, 1.262755, 1, 1, 1, 1, 1,
0.06770579, 1.420419, 1.619417, 1, 1, 1, 1, 1,
0.06855807, -1.157976, 3.08229, 1, 1, 1, 1, 1,
0.07018792, -0.8069115, 3.613024, 1, 1, 1, 1, 1,
0.07314077, 0.4881381, 1.728762, 1, 1, 1, 1, 1,
0.07364096, -0.06647548, 2.688323, 1, 1, 1, 1, 1,
0.07868597, 0.5324016, 0.1370963, 1, 1, 1, 1, 1,
0.07873601, 0.3430664, -1.895564, 1, 1, 1, 1, 1,
0.08116323, 1.1185, 0.3792279, 1, 1, 1, 1, 1,
0.08779672, -1.490041, 5.219373, 1, 1, 1, 1, 1,
0.09075774, -0.2341294, 3.162716, 1, 1, 1, 1, 1,
0.09091552, -0.3555553, 2.461445, 1, 1, 1, 1, 1,
0.09546953, -0.3097653, 4.62991, 0, 0, 1, 1, 1,
0.100824, -0.1859008, 3.078034, 1, 0, 0, 1, 1,
0.1053429, 0.2587401, 0.1481092, 1, 0, 0, 1, 1,
0.1060389, -1.805732, 2.447159, 1, 0, 0, 1, 1,
0.1083229, 0.8321863, -0.5879413, 1, 0, 0, 1, 1,
0.1084101, 1.386756, 0.3346473, 1, 0, 0, 1, 1,
0.1084789, -0.1931642, 2.234818, 0, 0, 0, 1, 1,
0.1108042, 0.7978474, -0.2669314, 0, 0, 0, 1, 1,
0.1197351, 1.723273, -0.4782456, 0, 0, 0, 1, 1,
0.1198547, 0.4219766, 0.6201732, 0, 0, 0, 1, 1,
0.123614, -0.5675517, 2.139961, 0, 0, 0, 1, 1,
0.1257653, 0.6845526, 0.8292304, 0, 0, 0, 1, 1,
0.1278501, -0.1546697, 2.060071, 0, 0, 0, 1, 1,
0.1299527, 0.8758147, 1.216597, 1, 1, 1, 1, 1,
0.1301498, 0.6566164, 0.7742304, 1, 1, 1, 1, 1,
0.1307887, -0.3149194, 1.768416, 1, 1, 1, 1, 1,
0.1392345, 1.0252, -1.281513, 1, 1, 1, 1, 1,
0.1400086, 2.199525, 0.4737373, 1, 1, 1, 1, 1,
0.140572, -0.587312, 0.7014138, 1, 1, 1, 1, 1,
0.1421861, 0.02695488, 1.785822, 1, 1, 1, 1, 1,
0.1431042, -0.5196499, 4.305918, 1, 1, 1, 1, 1,
0.1469104, 0.3205708, -0.7011809, 1, 1, 1, 1, 1,
0.1508912, 1.052067, -1.033083, 1, 1, 1, 1, 1,
0.1525968, -1.599927, 2.573139, 1, 1, 1, 1, 1,
0.1603216, -0.1537546, 2.743519, 1, 1, 1, 1, 1,
0.1636624, 0.1539876, 1.688734, 1, 1, 1, 1, 1,
0.1649428, 0.2652813, 0.5440056, 1, 1, 1, 1, 1,
0.1672467, 0.5090476, 1.561717, 1, 1, 1, 1, 1,
0.1686399, 1.969247, 0.3816774, 0, 0, 1, 1, 1,
0.1700283, 0.3258, -0.4601414, 1, 0, 0, 1, 1,
0.1701007, 1.065675, -0.6007978, 1, 0, 0, 1, 1,
0.1727724, 0.5829533, 0.1519902, 1, 0, 0, 1, 1,
0.1732789, -0.4459252, 2.701973, 1, 0, 0, 1, 1,
0.1732831, 1.022016, -1.101953, 1, 0, 0, 1, 1,
0.1755472, -0.1736626, 1.9231, 0, 0, 0, 1, 1,
0.1825, -1.369159, 3.792082, 0, 0, 0, 1, 1,
0.1855543, 0.3170331, -0.3064803, 0, 0, 0, 1, 1,
0.1875942, -0.3251406, 1.839214, 0, 0, 0, 1, 1,
0.1917734, -1.787292, 2.557979, 0, 0, 0, 1, 1,
0.1921152, -0.09327626, 0.290915, 0, 0, 0, 1, 1,
0.1946658, -0.9144869, 2.88485, 0, 0, 0, 1, 1,
0.199324, -1.360948, 4.260876, 1, 1, 1, 1, 1,
0.2019168, -0.4400382, 2.899688, 1, 1, 1, 1, 1,
0.2021396, -0.2748696, 2.718572, 1, 1, 1, 1, 1,
0.2035177, -0.6383045, 3.090712, 1, 1, 1, 1, 1,
0.2049004, 0.3247446, 0.4845257, 1, 1, 1, 1, 1,
0.2058318, -1.162439, 4.912803, 1, 1, 1, 1, 1,
0.206773, -0.1681736, 2.957301, 1, 1, 1, 1, 1,
0.2073453, 1.584227, 1.804139, 1, 1, 1, 1, 1,
0.2115109, -0.8080189, 4.79156, 1, 1, 1, 1, 1,
0.2132768, -0.6904587, 0.4521164, 1, 1, 1, 1, 1,
0.2282501, 0.4951457, 1.699332, 1, 1, 1, 1, 1,
0.2402195, 0.5406871, 0.7719216, 1, 1, 1, 1, 1,
0.2406323, 0.4692104, 1.371338, 1, 1, 1, 1, 1,
0.2416957, 1.767878, 1.055467, 1, 1, 1, 1, 1,
0.2461208, -0.1776, 1.488189, 1, 1, 1, 1, 1,
0.246737, -0.3529554, 1.205428, 0, 0, 1, 1, 1,
0.2471274, -0.09523607, 1.245425, 1, 0, 0, 1, 1,
0.2550169, 0.538129, 1.152809, 1, 0, 0, 1, 1,
0.2665916, -0.1854454, 2.208292, 1, 0, 0, 1, 1,
0.2665932, 0.354648, -0.1077763, 1, 0, 0, 1, 1,
0.2667639, 0.1166445, 1.388625, 1, 0, 0, 1, 1,
0.269269, -1.032619, 1.029703, 0, 0, 0, 1, 1,
0.2713208, -1.43126, 4.381484, 0, 0, 0, 1, 1,
0.2795595, -0.2756808, 2.376928, 0, 0, 0, 1, 1,
0.2822208, -0.9345993, 2.326542, 0, 0, 0, 1, 1,
0.2850842, -0.1794703, 1.770677, 0, 0, 0, 1, 1,
0.2859457, 1.718739, 0.1518306, 0, 0, 0, 1, 1,
0.2906672, 1.465021, 1.248189, 0, 0, 0, 1, 1,
0.2937329, 1.085376, 2.059696, 1, 1, 1, 1, 1,
0.2946606, -1.195787, 1.26368, 1, 1, 1, 1, 1,
0.2970681, 1.17988, 0.6329874, 1, 1, 1, 1, 1,
0.3004963, 0.1771334, 1.04903, 1, 1, 1, 1, 1,
0.3028391, 0.06038601, 1.083639, 1, 1, 1, 1, 1,
0.3092646, 0.6599778, -0.2767248, 1, 1, 1, 1, 1,
0.3116832, -1.530781, 1.456843, 1, 1, 1, 1, 1,
0.3122632, -1.24649, 3.014629, 1, 1, 1, 1, 1,
0.3123687, -0.1220574, 2.862661, 1, 1, 1, 1, 1,
0.3241934, 1.130135, -0.8049442, 1, 1, 1, 1, 1,
0.3243693, 0.4094528, 1.596869, 1, 1, 1, 1, 1,
0.3270682, 0.2246925, 1.727926, 1, 1, 1, 1, 1,
0.3289931, -1.349171, 3.050606, 1, 1, 1, 1, 1,
0.3300979, -1.312302, 2.204265, 1, 1, 1, 1, 1,
0.3316403, -0.5089626, 3.89961, 1, 1, 1, 1, 1,
0.335645, 1.199065, 1.40767, 0, 0, 1, 1, 1,
0.337232, 2.25417, -0.240491, 1, 0, 0, 1, 1,
0.3384359, 0.3447801, 0.9313033, 1, 0, 0, 1, 1,
0.3391102, 0.8684493, 0.9177578, 1, 0, 0, 1, 1,
0.3415526, 0.9293373, 0.8958951, 1, 0, 0, 1, 1,
0.3424753, 0.06446365, 0.793844, 1, 0, 0, 1, 1,
0.345348, -0.4650354, 2.834043, 0, 0, 0, 1, 1,
0.3459165, -0.9583179, 1.913197, 0, 0, 0, 1, 1,
0.3465691, 0.9614074, 0.02973123, 0, 0, 0, 1, 1,
0.3504606, -0.03160752, 2.335027, 0, 0, 0, 1, 1,
0.3533285, 0.9374356, -1.412027, 0, 0, 0, 1, 1,
0.3573373, 0.1928336, 1.177578, 0, 0, 0, 1, 1,
0.3576866, -0.5089813, 4.837423, 0, 0, 0, 1, 1,
0.3603392, 0.2286012, 1.627939, 1, 1, 1, 1, 1,
0.3613802, -0.4070779, 1.172619, 1, 1, 1, 1, 1,
0.3616947, -0.7101845, 2.001877, 1, 1, 1, 1, 1,
0.3655262, 0.01074537, 1.340225, 1, 1, 1, 1, 1,
0.3667742, 0.8160377, 0.8970821, 1, 1, 1, 1, 1,
0.3673634, -0.4341243, 2.667758, 1, 1, 1, 1, 1,
0.3772603, -1.048705, 3.380288, 1, 1, 1, 1, 1,
0.3788295, 0.05716769, 2.145111, 1, 1, 1, 1, 1,
0.3818906, 0.2439138, 1.345894, 1, 1, 1, 1, 1,
0.3852962, -0.5001772, 1.832671, 1, 1, 1, 1, 1,
0.3887276, -0.4883509, 2.395067, 1, 1, 1, 1, 1,
0.3891408, 1.674833, -0.9402937, 1, 1, 1, 1, 1,
0.389456, 1.229847, 1.311818, 1, 1, 1, 1, 1,
0.393079, -1.114129, 3.557624, 1, 1, 1, 1, 1,
0.3931437, 0.4466771, -0.1896067, 1, 1, 1, 1, 1,
0.3963793, -0.151014, -0.5107971, 0, 0, 1, 1, 1,
0.3991397, -1.585392, 4.088426, 1, 0, 0, 1, 1,
0.4016454, -0.3832494, 2.325808, 1, 0, 0, 1, 1,
0.4018121, 0.2193583, 0.3262242, 1, 0, 0, 1, 1,
0.4024146, 0.9533265, 1.520373, 1, 0, 0, 1, 1,
0.4057932, 0.6127451, -1.521651, 1, 0, 0, 1, 1,
0.4062414, -0.8500966, 1.708191, 0, 0, 0, 1, 1,
0.4064154, -0.7873168, 4.188525, 0, 0, 0, 1, 1,
0.4119975, -0.8946432, 3.581547, 0, 0, 0, 1, 1,
0.4122216, -1.180451, 2.783713, 0, 0, 0, 1, 1,
0.4153721, -0.4385901, 3.259268, 0, 0, 0, 1, 1,
0.4237989, -0.3847949, 4.364252, 0, 0, 0, 1, 1,
0.426201, -0.8046591, 2.676759, 0, 0, 0, 1, 1,
0.427154, 1.370247, 0.3604387, 1, 1, 1, 1, 1,
0.4389976, 1.061079, 0.6746286, 1, 1, 1, 1, 1,
0.4392053, 0.06377776, 1.813659, 1, 1, 1, 1, 1,
0.4423761, 2.267225, -0.898025, 1, 1, 1, 1, 1,
0.4482017, -2.206921, 3.080921, 1, 1, 1, 1, 1,
0.4500009, 1.520402, -2.615627, 1, 1, 1, 1, 1,
0.4505101, -1.457357, 4.02441, 1, 1, 1, 1, 1,
0.4525941, 0.1556018, 2.0195, 1, 1, 1, 1, 1,
0.4589865, 2.839254, 1.758293, 1, 1, 1, 1, 1,
0.4611731, 0.343901, 2.042142, 1, 1, 1, 1, 1,
0.4618096, -0.356819, 2.181813, 1, 1, 1, 1, 1,
0.4642377, 0.8313979, 0.8666597, 1, 1, 1, 1, 1,
0.4712444, 0.9146594, -0.1624923, 1, 1, 1, 1, 1,
0.4762433, -0.5368955, 0.2180714, 1, 1, 1, 1, 1,
0.4771302, 0.03880775, 2.045974, 1, 1, 1, 1, 1,
0.4774236, -0.691658, 1.877356, 0, 0, 1, 1, 1,
0.4861917, 0.4195363, 1.473484, 1, 0, 0, 1, 1,
0.4885298, 0.3308015, 0.8962025, 1, 0, 0, 1, 1,
0.4963523, -0.7495716, 2.523289, 1, 0, 0, 1, 1,
0.4979242, -0.7091963, 2.285823, 1, 0, 0, 1, 1,
0.4988484, 1.341579, 0.5092361, 1, 0, 0, 1, 1,
0.501786, -1.551462, 3.882526, 0, 0, 0, 1, 1,
0.5026786, 0.8866807, -0.1069208, 0, 0, 0, 1, 1,
0.5073179, -0.8181185, 1.000448, 0, 0, 0, 1, 1,
0.5106999, -1.037058, 3.017111, 0, 0, 0, 1, 1,
0.5121453, 0.1418723, 2.462881, 0, 0, 0, 1, 1,
0.5136047, 0.4009741, 1.071423, 0, 0, 0, 1, 1,
0.5160812, 2.417027, -0.119159, 0, 0, 0, 1, 1,
0.5191808, 0.2899176, 0.7119701, 1, 1, 1, 1, 1,
0.5191942, 0.4661628, 1.740585, 1, 1, 1, 1, 1,
0.5199103, -1.607403, 2.691274, 1, 1, 1, 1, 1,
0.5210825, 1.467254, 1.707686, 1, 1, 1, 1, 1,
0.5244344, 1.723304, 1.810192, 1, 1, 1, 1, 1,
0.5301068, 0.8442419, 0.9299967, 1, 1, 1, 1, 1,
0.5323492, -0.4571387, 2.086806, 1, 1, 1, 1, 1,
0.53354, 1.651955, 0.3704535, 1, 1, 1, 1, 1,
0.5342473, 0.861423, -0.4327875, 1, 1, 1, 1, 1,
0.5370741, 1.826334, 0.824768, 1, 1, 1, 1, 1,
0.541241, -0.1346915, 2.830251, 1, 1, 1, 1, 1,
0.5445712, 0.2542402, 0.6726944, 1, 1, 1, 1, 1,
0.5510725, -0.1538677, 1.591139, 1, 1, 1, 1, 1,
0.558331, -1.526863, 3.065336, 1, 1, 1, 1, 1,
0.5619242, -0.01927393, 1.39253, 1, 1, 1, 1, 1,
0.5621717, -0.9420676, 2.282646, 0, 0, 1, 1, 1,
0.5628721, 0.3152448, 2.161223, 1, 0, 0, 1, 1,
0.5666814, 1.688689, 0.4348636, 1, 0, 0, 1, 1,
0.5728213, 0.13815, 1.343478, 1, 0, 0, 1, 1,
0.5735034, 1.873111, 0.6486379, 1, 0, 0, 1, 1,
0.5783749, -0.5336005, 2.8824, 1, 0, 0, 1, 1,
0.5784473, 0.6796563, 2.246049, 0, 0, 0, 1, 1,
0.5828996, -0.08997317, 0.9616109, 0, 0, 0, 1, 1,
0.5860428, 0.5628285, 0.4204638, 0, 0, 0, 1, 1,
0.5891885, -1.41871, 3.3294, 0, 0, 0, 1, 1,
0.5982046, 0.9675186, 0.435825, 0, 0, 0, 1, 1,
0.5995148, -0.3292466, 2.735813, 0, 0, 0, 1, 1,
0.5996748, 0.9129813, 0.7657196, 0, 0, 0, 1, 1,
0.6019528, -0.7787179, 2.402388, 1, 1, 1, 1, 1,
0.603469, -0.672745, 2.89498, 1, 1, 1, 1, 1,
0.6071324, -1.085631, 2.416158, 1, 1, 1, 1, 1,
0.6160174, -2.392965, 3.072142, 1, 1, 1, 1, 1,
0.6160795, -0.1441036, 1.761096, 1, 1, 1, 1, 1,
0.6166512, 0.4732497, 1.35966, 1, 1, 1, 1, 1,
0.6169854, -0.5279223, 1.630521, 1, 1, 1, 1, 1,
0.6183406, -0.4762403, 0.3936819, 1, 1, 1, 1, 1,
0.6196861, -0.4066847, 1.51414, 1, 1, 1, 1, 1,
0.6227696, -0.882601, 1.991585, 1, 1, 1, 1, 1,
0.6235678, -0.6583786, 4.411961, 1, 1, 1, 1, 1,
0.6240801, 1.236677, 2.02386, 1, 1, 1, 1, 1,
0.624787, 0.9142228, -0.07959443, 1, 1, 1, 1, 1,
0.6306612, -0.6904797, 2.625647, 1, 1, 1, 1, 1,
0.6349536, 1.664027, -0.03669185, 1, 1, 1, 1, 1,
0.6402164, 0.6094643, 0.6378167, 0, 0, 1, 1, 1,
0.6503233, 1.730681, 0.4573873, 1, 0, 0, 1, 1,
0.655474, -0.6363187, 3.049983, 1, 0, 0, 1, 1,
0.6586825, -0.5045667, 0.7833411, 1, 0, 0, 1, 1,
0.6596718, 0.7536824, 1.631165, 1, 0, 0, 1, 1,
0.664857, -1.811785, 2.617418, 1, 0, 0, 1, 1,
0.6649953, 2.552527, 0.2196299, 0, 0, 0, 1, 1,
0.671595, 0.5394592, 3.320692, 0, 0, 0, 1, 1,
0.6727033, 1.273673, 0.4728523, 0, 0, 0, 1, 1,
0.6748187, 0.1551854, 2.465175, 0, 0, 0, 1, 1,
0.6781858, 0.4009211, 2.043892, 0, 0, 0, 1, 1,
0.6789858, 0.4724004, 1.351616, 0, 0, 0, 1, 1,
0.6818317, -1.021987, 0.602423, 0, 0, 0, 1, 1,
0.6839061, -0.1379955, 2.327846, 1, 1, 1, 1, 1,
0.6986886, 0.3684576, 0.9167759, 1, 1, 1, 1, 1,
0.7012795, -0.3618232, 2.494647, 1, 1, 1, 1, 1,
0.7098264, 0.04907265, 2.021689, 1, 1, 1, 1, 1,
0.7309079, -1.053099, 1.866804, 1, 1, 1, 1, 1,
0.7366953, -0.1540151, 1.928724, 1, 1, 1, 1, 1,
0.7370279, -0.7099779, 1.604161, 1, 1, 1, 1, 1,
0.7410901, 0.7013019, 1.307528, 1, 1, 1, 1, 1,
0.7445214, 0.4005661, -1.105079, 1, 1, 1, 1, 1,
0.7449549, -0.06095677, 0.6393802, 1, 1, 1, 1, 1,
0.7461484, -1.232385, 1.336693, 1, 1, 1, 1, 1,
0.747861, 1.626287, 0.05660493, 1, 1, 1, 1, 1,
0.7560227, 0.3134103, 1.788313, 1, 1, 1, 1, 1,
0.7562126, -0.3745636, 1.270271, 1, 1, 1, 1, 1,
0.7579831, 0.3344417, -0.3862789, 1, 1, 1, 1, 1,
0.7604751, -1.21973, 1.387649, 0, 0, 1, 1, 1,
0.7641206, 1.053137, 0.6880459, 1, 0, 0, 1, 1,
0.7641833, 0.3242479, 1.855234, 1, 0, 0, 1, 1,
0.7646271, 0.4879095, 1.545805, 1, 0, 0, 1, 1,
0.7667193, 0.3354795, 2.345619, 1, 0, 0, 1, 1,
0.7670012, -0.7697513, 2.771595, 1, 0, 0, 1, 1,
0.7672225, -0.1727871, 1.716116, 0, 0, 0, 1, 1,
0.7689119, 1.102612, 0.1999873, 0, 0, 0, 1, 1,
0.7707955, 1.082587, 0.5458438, 0, 0, 0, 1, 1,
0.7745962, -2.27724, 2.98553, 0, 0, 0, 1, 1,
0.7778979, -0.5841402, 1.767665, 0, 0, 0, 1, 1,
0.7794804, -1.047651, 1.153998, 0, 0, 0, 1, 1,
0.7803531, -0.969143, 1.90599, 0, 0, 0, 1, 1,
0.789061, 1.360694, -0.609033, 1, 1, 1, 1, 1,
0.789106, 0.797201, -0.4400162, 1, 1, 1, 1, 1,
0.7922602, -0.8168907, 3.558919, 1, 1, 1, 1, 1,
0.7944602, 0.8990087, 1.053572, 1, 1, 1, 1, 1,
0.7953078, 0.7490914, 2.272346, 1, 1, 1, 1, 1,
0.798808, 1.678095, 0.7656911, 1, 1, 1, 1, 1,
0.8006768, 1.377007, 0.6451946, 1, 1, 1, 1, 1,
0.8009558, 0.1612343, 0.7569024, 1, 1, 1, 1, 1,
0.8013061, -0.01401497, 1.15949, 1, 1, 1, 1, 1,
0.8051382, 0.06719182, 0.4868813, 1, 1, 1, 1, 1,
0.8057675, 1.154783, 0.3346547, 1, 1, 1, 1, 1,
0.8118315, 2.031573, -0.2138176, 1, 1, 1, 1, 1,
0.8133857, 0.5322607, 1.190838, 1, 1, 1, 1, 1,
0.8164855, 1.385292, 1.417788, 1, 1, 1, 1, 1,
0.8189131, -0.047069, 0.2312611, 1, 1, 1, 1, 1,
0.8189777, 1.356675, -0.2185829, 0, 0, 1, 1, 1,
0.8193106, -0.004640267, 1.626945, 1, 0, 0, 1, 1,
0.8204782, -0.9705667, 3.357358, 1, 0, 0, 1, 1,
0.8220541, 1.657818, 2.22788, 1, 0, 0, 1, 1,
0.8222226, 0.5987656, -0.1988294, 1, 0, 0, 1, 1,
0.8237892, -0.6282571, 3.436337, 1, 0, 0, 1, 1,
0.8259078, -1.608763, 2.991653, 0, 0, 0, 1, 1,
0.8261408, 0.07195058, 2.625477, 0, 0, 0, 1, 1,
0.8342223, 0.1995313, 1.956256, 0, 0, 0, 1, 1,
0.8401723, -0.7432237, 0.007115324, 0, 0, 0, 1, 1,
0.8414579, 1.046226, 0.5158313, 0, 0, 0, 1, 1,
0.8456491, 1.986822, 2.264297, 0, 0, 0, 1, 1,
0.8459316, 1.498188, 0.1828311, 0, 0, 0, 1, 1,
0.8481455, 1.203927, 0.6328424, 1, 1, 1, 1, 1,
0.8497978, 1.776537, 1.603151, 1, 1, 1, 1, 1,
0.8576444, 0.8166158, -0.2952958, 1, 1, 1, 1, 1,
0.8701906, 1.352797, -1.501669, 1, 1, 1, 1, 1,
0.8733476, 0.5357871, -0.638464, 1, 1, 1, 1, 1,
0.8782563, 1.564357, 0.8359637, 1, 1, 1, 1, 1,
0.8785081, -0.350749, 1.642919, 1, 1, 1, 1, 1,
0.8837122, -0.1103597, -0.2629226, 1, 1, 1, 1, 1,
0.8955552, 0.1847774, -0.133278, 1, 1, 1, 1, 1,
0.8963516, -0.9457572, 0.5280974, 1, 1, 1, 1, 1,
0.8977485, 1.14036, 1.466085, 1, 1, 1, 1, 1,
0.9009016, -0.2194391, 2.323016, 1, 1, 1, 1, 1,
0.9014758, -0.7982337, 2.0464, 1, 1, 1, 1, 1,
0.9032556, -0.2434299, 1.657184, 1, 1, 1, 1, 1,
0.9039032, -0.134569, 1.811401, 1, 1, 1, 1, 1,
0.9063802, 0.5256582, 1.868968, 0, 0, 1, 1, 1,
0.9088005, -1.668065, 2.597543, 1, 0, 0, 1, 1,
0.9109594, 0.4685295, 2.181053, 1, 0, 0, 1, 1,
0.9143279, -0.5544301, 1.358108, 1, 0, 0, 1, 1,
0.9154804, 0.7827291, 0.07926375, 1, 0, 0, 1, 1,
0.9282278, 0.1144324, 1.496926, 1, 0, 0, 1, 1,
0.9323406, -0.5460726, 0.8304014, 0, 0, 0, 1, 1,
0.936639, 1.409326, 0.847508, 0, 0, 0, 1, 1,
0.9663781, -1.214566, 2.073796, 0, 0, 0, 1, 1,
0.967087, -0.3242424, 2.123783, 0, 0, 0, 1, 1,
0.9707153, 2.439864, -0.515872, 0, 0, 0, 1, 1,
0.9715982, -1.12703, 2.871157, 0, 0, 0, 1, 1,
0.9725819, -0.3357287, 2.566159, 0, 0, 0, 1, 1,
0.9737473, -0.8683618, 2.867291, 1, 1, 1, 1, 1,
0.9753515, 2.537837, -0.07278734, 1, 1, 1, 1, 1,
0.9772397, 0.05032346, 2.148384, 1, 1, 1, 1, 1,
0.9786309, 1.304394, -0.5059413, 1, 1, 1, 1, 1,
0.9841253, 0.37601, 1.359915, 1, 1, 1, 1, 1,
0.9849957, 0.2405939, 1.414994, 1, 1, 1, 1, 1,
0.9913195, 0.3179695, 1.342459, 1, 1, 1, 1, 1,
0.9971602, 0.1833878, 1.7177, 1, 1, 1, 1, 1,
1.002964, -1.172843, 2.168555, 1, 1, 1, 1, 1,
1.009327, -0.3865344, 1.211203, 1, 1, 1, 1, 1,
1.01209, -1.789782, 2.951223, 1, 1, 1, 1, 1,
1.019352, 0.5652432, 0.7002709, 1, 1, 1, 1, 1,
1.020324, 0.2699217, 0.7836758, 1, 1, 1, 1, 1,
1.022006, -0.3611893, 1.18491, 1, 1, 1, 1, 1,
1.025352, 0.7937019, -0.1739104, 1, 1, 1, 1, 1,
1.027237, 0.5044767, 1.611745, 0, 0, 1, 1, 1,
1.031528, -0.4693119, 1.006709, 1, 0, 0, 1, 1,
1.033982, -0.4467128, 1.343257, 1, 0, 0, 1, 1,
1.034603, -0.7060165, 1.518288, 1, 0, 0, 1, 1,
1.034742, 1.373187, 0.8859847, 1, 0, 0, 1, 1,
1.035719, -1.529235, 1.114885, 1, 0, 0, 1, 1,
1.050509, -1.64543, 2.041073, 0, 0, 0, 1, 1,
1.05337, 0.8409352, 0.4445471, 0, 0, 0, 1, 1,
1.055093, -0.4066675, 1.469548, 0, 0, 0, 1, 1,
1.05513, -1.344494, 2.044396, 0, 0, 0, 1, 1,
1.056414, 0.2658815, 1.07105, 0, 0, 0, 1, 1,
1.059255, -0.3276436, 4.38038, 0, 0, 0, 1, 1,
1.059413, -0.3923917, 3.474483, 0, 0, 0, 1, 1,
1.061011, 2.344315, 0.8675404, 1, 1, 1, 1, 1,
1.068269, -3.042184, 2.872039, 1, 1, 1, 1, 1,
1.070233, 1.892752, -0.07802922, 1, 1, 1, 1, 1,
1.078705, -0.0599022, 1.078405, 1, 1, 1, 1, 1,
1.079142, -0.1213676, 1.961286, 1, 1, 1, 1, 1,
1.079301, -0.6697914, 3.911819, 1, 1, 1, 1, 1,
1.083161, 1.775456, 2.003017, 1, 1, 1, 1, 1,
1.084834, -0.6970528, 2.166749, 1, 1, 1, 1, 1,
1.085824, 0.8619612, 1.448447, 1, 1, 1, 1, 1,
1.086049, -0.2277208, 1.943354, 1, 1, 1, 1, 1,
1.087948, -0.7515743, 3.080931, 1, 1, 1, 1, 1,
1.105328, -0.1527138, 1.441732, 1, 1, 1, 1, 1,
1.107069, 0.2819373, 1.43419, 1, 1, 1, 1, 1,
1.110638, -0.1846179, 2.799182, 1, 1, 1, 1, 1,
1.114059, 0.5738601, 0.305753, 1, 1, 1, 1, 1,
1.131512, -0.1397529, -0.7228846, 0, 0, 1, 1, 1,
1.131623, -0.5976292, 1.16454, 1, 0, 0, 1, 1,
1.15675, 1.864802, 2.887224, 1, 0, 0, 1, 1,
1.160203, -0.3699258, 1.680532, 1, 0, 0, 1, 1,
1.161089, -0.4645519, 2.534894, 1, 0, 0, 1, 1,
1.166469, 0.319689, 1.317181, 1, 0, 0, 1, 1,
1.191388, -1.960257, 2.431995, 0, 0, 0, 1, 1,
1.191524, -0.384147, 1.940788, 0, 0, 0, 1, 1,
1.192815, -1.226003, 1.868658, 0, 0, 0, 1, 1,
1.195998, -0.4588545, 3.357871, 0, 0, 0, 1, 1,
1.200543, 0.3464339, 0.8268723, 0, 0, 0, 1, 1,
1.206008, 0.2120777, 1.981546, 0, 0, 0, 1, 1,
1.217215, 0.8299889, 1.417345, 0, 0, 0, 1, 1,
1.218541, 1.377751, 0.648973, 1, 1, 1, 1, 1,
1.234288, 1.226245, 1.349484, 1, 1, 1, 1, 1,
1.237672, -0.9882097, 1.273771, 1, 1, 1, 1, 1,
1.246309, 0.022197, 1.265555, 1, 1, 1, 1, 1,
1.25252, 0.9759887, 0.9190761, 1, 1, 1, 1, 1,
1.252564, 1.186809, 1.552468, 1, 1, 1, 1, 1,
1.255697, 0.8157408, 2.949425, 1, 1, 1, 1, 1,
1.258776, 0.2614778, -0.05670691, 1, 1, 1, 1, 1,
1.261496, 0.4726918, 2.122977, 1, 1, 1, 1, 1,
1.261499, 1.499274, 1.893987, 1, 1, 1, 1, 1,
1.267074, -0.5846033, 0.7492549, 1, 1, 1, 1, 1,
1.271515, 0.8653569, 0.6553764, 1, 1, 1, 1, 1,
1.276333, 0.3847836, 3.064085, 1, 1, 1, 1, 1,
1.27781, 0.205498, 0.6959741, 1, 1, 1, 1, 1,
1.29434, 2.011164, 2.336573, 1, 1, 1, 1, 1,
1.294671, 1.232539, -0.2960699, 0, 0, 1, 1, 1,
1.30098, 2.064923, 1.298906, 1, 0, 0, 1, 1,
1.305557, -0.7786136, 3.664503, 1, 0, 0, 1, 1,
1.307632, 1.187151, 0.9522725, 1, 0, 0, 1, 1,
1.313781, 1.086368, 3.830085, 1, 0, 0, 1, 1,
1.317169, 0.9504924, 0.9191182, 1, 0, 0, 1, 1,
1.321271, -0.2483584, 0.8795877, 0, 0, 0, 1, 1,
1.322778, 1.631793, -0.03351899, 0, 0, 0, 1, 1,
1.328902, 0.3662185, 0.4251901, 0, 0, 0, 1, 1,
1.34886, -1.050449, 2.503227, 0, 0, 0, 1, 1,
1.354874, -0.7687573, 2.361874, 0, 0, 0, 1, 1,
1.363603, -1.18251, 3.019042, 0, 0, 0, 1, 1,
1.373291, -0.9437097, 0.6820026, 0, 0, 0, 1, 1,
1.390299, -0.01284885, -0.8639407, 1, 1, 1, 1, 1,
1.392477, -0.3938335, 4.202246, 1, 1, 1, 1, 1,
1.3925, -0.7787588, -0.04525639, 1, 1, 1, 1, 1,
1.393404, -1.051586, 1.832054, 1, 1, 1, 1, 1,
1.399978, 0.4897464, 0.8285693, 1, 1, 1, 1, 1,
1.402668, 0.2384084, 1.861499, 1, 1, 1, 1, 1,
1.408546, 0.9344636, -0.3278177, 1, 1, 1, 1, 1,
1.408556, -1.333691, 2.025615, 1, 1, 1, 1, 1,
1.409125, -0.4654202, 0.8425732, 1, 1, 1, 1, 1,
1.409515, -0.8466892, 3.443623, 1, 1, 1, 1, 1,
1.421118, 0.1656344, 1.502993, 1, 1, 1, 1, 1,
1.429114, 1.871104, 2.458498, 1, 1, 1, 1, 1,
1.432421, -1.319437, 3.472547, 1, 1, 1, 1, 1,
1.433895, 0.754656, 2.555935, 1, 1, 1, 1, 1,
1.454554, -0.9593603, 1.361158, 1, 1, 1, 1, 1,
1.461954, -0.2239544, 2.043791, 0, 0, 1, 1, 1,
1.470595, 1.742402, -1.452057, 1, 0, 0, 1, 1,
1.477746, 0.05636596, 2.15982, 1, 0, 0, 1, 1,
1.485785, 1.032788, 1.184251, 1, 0, 0, 1, 1,
1.491235, 0.6127058, 0.5781632, 1, 0, 0, 1, 1,
1.494172, 0.2364427, 1.606639, 1, 0, 0, 1, 1,
1.506772, 0.04498137, 1.639976, 0, 0, 0, 1, 1,
1.508625, -0.07390928, 1.031783, 0, 0, 0, 1, 1,
1.508639, 1.240909, 1.392437, 0, 0, 0, 1, 1,
1.51174, 1.244422, 1.809905, 0, 0, 0, 1, 1,
1.511942, 0.5705345, 1.890646, 0, 0, 0, 1, 1,
1.51322, -0.03537154, 0.9415677, 0, 0, 0, 1, 1,
1.513647, -1.425606, 2.755001, 0, 0, 0, 1, 1,
1.519395, 0.02446236, 2.951279, 1, 1, 1, 1, 1,
1.521942, 1.3065, 0.04119574, 1, 1, 1, 1, 1,
1.536232, -0.4412156, 1.002067, 1, 1, 1, 1, 1,
1.549493, 0.9802912, 2.056235, 1, 1, 1, 1, 1,
1.557899, -2.230819, 3.557655, 1, 1, 1, 1, 1,
1.566827, 0.914459, 0.451965, 1, 1, 1, 1, 1,
1.578416, -0.5671859, 1.361539, 1, 1, 1, 1, 1,
1.581159, -1.190677, 0.2699693, 1, 1, 1, 1, 1,
1.591601, -0.05307906, 1.707901, 1, 1, 1, 1, 1,
1.594378, -0.65949, 0.8795782, 1, 1, 1, 1, 1,
1.610258, -0.8465824, 2.63703, 1, 1, 1, 1, 1,
1.613696, 0.4172555, 0.4452128, 1, 1, 1, 1, 1,
1.615031, -0.6431237, 0.9958699, 1, 1, 1, 1, 1,
1.616093, -0.05305906, -0.7676708, 1, 1, 1, 1, 1,
1.643717, -0.04107035, 1.517382, 1, 1, 1, 1, 1,
1.645465, -0.7776841, 0.8103905, 0, 0, 1, 1, 1,
1.64745, -0.8727745, 0.6527787, 1, 0, 0, 1, 1,
1.663414, 0.9874853, -0.5402064, 1, 0, 0, 1, 1,
1.664907, 0.9494364, 1.491641, 1, 0, 0, 1, 1,
1.669889, -1.069014, 2.875153, 1, 0, 0, 1, 1,
1.685763, 0.8873793, 2.293138, 1, 0, 0, 1, 1,
1.718675, -0.3851979, 3.412275, 0, 0, 0, 1, 1,
1.727797, 1.242097, 1.972328, 0, 0, 0, 1, 1,
1.745908, 0.03723866, 1.731145, 0, 0, 0, 1, 1,
1.746308, 0.3375144, 0.1160627, 0, 0, 0, 1, 1,
1.762635, 0.6267039, 1.816599, 0, 0, 0, 1, 1,
1.786465, 0.2709406, 2.35578, 0, 0, 0, 1, 1,
1.791224, -0.7801921, 2.935165, 0, 0, 0, 1, 1,
1.792712, 0.02573252, 0.2813963, 1, 1, 1, 1, 1,
1.80267, -1.240538, 1.849, 1, 1, 1, 1, 1,
1.806858, -0.2098069, 2.095168, 1, 1, 1, 1, 1,
1.816952, -0.8050622, 1.396297, 1, 1, 1, 1, 1,
1.821897, -0.237704, 2.407692, 1, 1, 1, 1, 1,
1.824938, -0.1901342, 0.8327335, 1, 1, 1, 1, 1,
1.87075, -0.1507081, 0.4418965, 1, 1, 1, 1, 1,
1.876943, -1.435649, 2.094237, 1, 1, 1, 1, 1,
1.878877, 0.2625464, 0.5422092, 1, 1, 1, 1, 1,
1.905432, -0.0495008, 0.08488682, 1, 1, 1, 1, 1,
1.915276, 0.6404375, 1.350521, 1, 1, 1, 1, 1,
1.91733, 1.226127, -0.1672194, 1, 1, 1, 1, 1,
1.932383, 0.2008367, 0.6703727, 1, 1, 1, 1, 1,
1.987126, -0.8511989, 1.723049, 1, 1, 1, 1, 1,
1.990715, -2.27266, 4.326492, 1, 1, 1, 1, 1,
2.021098, -0.1642319, 0.7697706, 0, 0, 1, 1, 1,
2.047399, 1.279342, 1.288824, 1, 0, 0, 1, 1,
2.061541, -0.122614, 2.326287, 1, 0, 0, 1, 1,
2.063195, -1.469459, 4.019719, 1, 0, 0, 1, 1,
2.106546, -0.8831796, 2.733986, 1, 0, 0, 1, 1,
2.109251, -0.3618228, 2.375861, 1, 0, 0, 1, 1,
2.129689, 1.236777, 0.8779405, 0, 0, 0, 1, 1,
2.155241, -0.9725996, 1.342194, 0, 0, 0, 1, 1,
2.178588, 1.432422, -0.6500354, 0, 0, 0, 1, 1,
2.217719, -0.7465123, 2.900127, 0, 0, 0, 1, 1,
2.230333, 0.9887752, 1.77432, 0, 0, 0, 1, 1,
2.315746, -0.313126, 2.383249, 0, 0, 0, 1, 1,
2.35403, 1.74972, 3.568368, 0, 0, 0, 1, 1,
2.356736, -0.6540216, 2.799315, 1, 1, 1, 1, 1,
2.398132, -2.380471, 1.013688, 1, 1, 1, 1, 1,
2.475739, 0.1269733, 2.937419, 1, 1, 1, 1, 1,
3.002318, -1.18206, 0.7691929, 1, 1, 1, 1, 1,
3.301749, 0.5322136, 0.609403, 1, 1, 1, 1, 1,
3.480636, 0.4944183, 2.445706, 1, 1, 1, 1, 1,
3.880151, -0.85773, 0.518992, 1, 1, 1, 1, 1
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
var radius = 9.530718;
var distance = 33.47625;
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
mvMatrix.translate( -0.3233886, -0.122268, -0.1396387 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.47625);
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
