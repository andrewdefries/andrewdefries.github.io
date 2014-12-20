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
-2.745957, -1.011923, -1.253669, 1, 0, 0, 1,
-2.576744, 1.073802, -0.03028463, 1, 0.007843138, 0, 1,
-2.496956, 1.093897, -1.252467, 1, 0.01176471, 0, 1,
-2.457676, 1.016006, -1.412967, 1, 0.01960784, 0, 1,
-2.333199, 0.07894149, -2.411674, 1, 0.02352941, 0, 1,
-2.3304, -1.019333, -2.631466, 1, 0.03137255, 0, 1,
-2.326083, -0.6573154, -2.936022, 1, 0.03529412, 0, 1,
-2.219268, -0.5026628, -2.790696, 1, 0.04313726, 0, 1,
-2.164139, 0.674121, -3.190598, 1, 0.04705882, 0, 1,
-2.161342, -1.342664, -2.784096, 1, 0.05490196, 0, 1,
-2.15995, 2.098182, -1.56943, 1, 0.05882353, 0, 1,
-2.151464, 1.256841, -1.848983, 1, 0.06666667, 0, 1,
-2.097017, -0.09060285, -2.513729, 1, 0.07058824, 0, 1,
-1.996617, 0.6157211, -2.273269, 1, 0.07843138, 0, 1,
-1.969036, 1.37711, -0.03683628, 1, 0.08235294, 0, 1,
-1.958673, -1.76169, -2.548628, 1, 0.09019608, 0, 1,
-1.943668, 0.4612594, -0.1019642, 1, 0.09411765, 0, 1,
-1.939138, 0.399598, 0.7386831, 1, 0.1019608, 0, 1,
-1.912856, -0.9070354, -4.208646, 1, 0.1098039, 0, 1,
-1.90736, -1.146885, -2.463094, 1, 0.1137255, 0, 1,
-1.900225, 0.2929006, -1.366775, 1, 0.1215686, 0, 1,
-1.896009, -0.1545822, -2.081426, 1, 0.1254902, 0, 1,
-1.895645, -0.2188361, -1.91944, 1, 0.1333333, 0, 1,
-1.893737, 1.646187, -2.835973, 1, 0.1372549, 0, 1,
-1.887869, -0.1833026, -2.233716, 1, 0.145098, 0, 1,
-1.88389, -1.205451, -1.292853, 1, 0.1490196, 0, 1,
-1.883335, -1.063604, -2.586756, 1, 0.1568628, 0, 1,
-1.835131, 1.067346, -0.4456123, 1, 0.1607843, 0, 1,
-1.820145, 1.509266, -0.8512017, 1, 0.1686275, 0, 1,
-1.811106, 1.330832, -0.9761387, 1, 0.172549, 0, 1,
-1.793399, -0.215764, -1.70467, 1, 0.1803922, 0, 1,
-1.788047, -1.022668, -3.835518, 1, 0.1843137, 0, 1,
-1.781509, -0.2824553, -2.792938, 1, 0.1921569, 0, 1,
-1.759532, 1.240501, -2.843448, 1, 0.1960784, 0, 1,
-1.747301, -0.3130307, -3.773861, 1, 0.2039216, 0, 1,
-1.746976, -0.2589942, -1.493324, 1, 0.2117647, 0, 1,
-1.721777, -0.6807846, -1.640719, 1, 0.2156863, 0, 1,
-1.711761, 2.400697, -1.26421, 1, 0.2235294, 0, 1,
-1.689949, -0.06578385, -2.308207, 1, 0.227451, 0, 1,
-1.6682, -0.0327627, -2.387655, 1, 0.2352941, 0, 1,
-1.66364, -0.06926449, -0.993351, 1, 0.2392157, 0, 1,
-1.650045, 1.612213, -2.575718, 1, 0.2470588, 0, 1,
-1.646464, -1.07646, -1.943968, 1, 0.2509804, 0, 1,
-1.643771, 2.087228, -0.3389423, 1, 0.2588235, 0, 1,
-1.638286, -0.232329, -1.200561, 1, 0.2627451, 0, 1,
-1.625758, -0.009331377, -1.394153, 1, 0.2705882, 0, 1,
-1.615112, 0.06588368, -2.960923, 1, 0.2745098, 0, 1,
-1.58067, -0.4198555, -2.797506, 1, 0.282353, 0, 1,
-1.565701, -1.140945, -1.656833, 1, 0.2862745, 0, 1,
-1.56351, 0.3768667, -1.219813, 1, 0.2941177, 0, 1,
-1.562453, 0.3369125, -2.921149, 1, 0.3019608, 0, 1,
-1.549284, -0.8510863, -1.382323, 1, 0.3058824, 0, 1,
-1.540987, 0.2538446, -1.204541, 1, 0.3137255, 0, 1,
-1.532871, 0.7776687, -1.074291, 1, 0.3176471, 0, 1,
-1.522162, -1.201748, -2.390146, 1, 0.3254902, 0, 1,
-1.516332, 0.6488056, -2.583389, 1, 0.3294118, 0, 1,
-1.510711, -0.5080345, -0.7314532, 1, 0.3372549, 0, 1,
-1.508236, 0.2343137, -0.4269169, 1, 0.3411765, 0, 1,
-1.507996, 0.2007361, -2.342431, 1, 0.3490196, 0, 1,
-1.507436, -0.4658154, -0.8016608, 1, 0.3529412, 0, 1,
-1.502399, -0.735357, -2.243743, 1, 0.3607843, 0, 1,
-1.501964, -1.172966, -2.630809, 1, 0.3647059, 0, 1,
-1.488456, 0.3317482, -1.142945, 1, 0.372549, 0, 1,
-1.484816, 0.2765563, -1.405769, 1, 0.3764706, 0, 1,
-1.471364, -0.3999629, -1.885464, 1, 0.3843137, 0, 1,
-1.460196, -0.265947, -2.460221, 1, 0.3882353, 0, 1,
-1.459353, 2.344995, -0.783627, 1, 0.3960784, 0, 1,
-1.459167, 0.3207102, -0.6727957, 1, 0.4039216, 0, 1,
-1.455986, 0.2169448, -0.3353776, 1, 0.4078431, 0, 1,
-1.445631, 1.277032, 0.5772299, 1, 0.4156863, 0, 1,
-1.439136, 1.343079, -0.4908836, 1, 0.4196078, 0, 1,
-1.438208, 1.390723, -1.053778, 1, 0.427451, 0, 1,
-1.433105, 1.094886, 0.4257628, 1, 0.4313726, 0, 1,
-1.432556, 2.005731, -1.663219, 1, 0.4392157, 0, 1,
-1.430312, 0.8779688, -1.232087, 1, 0.4431373, 0, 1,
-1.428869, -1.112434, -2.363575, 1, 0.4509804, 0, 1,
-1.422523, -0.8556263, -2.909859, 1, 0.454902, 0, 1,
-1.420959, -1.824783, -2.688956, 1, 0.4627451, 0, 1,
-1.411114, -0.106445, -4.004881, 1, 0.4666667, 0, 1,
-1.41019, 0.006711813, -0.942633, 1, 0.4745098, 0, 1,
-1.396061, 0.3166434, -1.704182, 1, 0.4784314, 0, 1,
-1.368826, -1.047409, -3.185117, 1, 0.4862745, 0, 1,
-1.36525, 0.6074309, -0.4312985, 1, 0.4901961, 0, 1,
-1.343289, 1.604661, -0.9420727, 1, 0.4980392, 0, 1,
-1.321373, -1.625521, -3.397151, 1, 0.5058824, 0, 1,
-1.319769, -0.378251, -3.199381, 1, 0.509804, 0, 1,
-1.318459, 0.768913, -1.806773, 1, 0.5176471, 0, 1,
-1.316056, -2.455937, -4.737833, 1, 0.5215687, 0, 1,
-1.309168, -0.7799041, -2.136165, 1, 0.5294118, 0, 1,
-1.299378, 1.409797, -0.3968084, 1, 0.5333334, 0, 1,
-1.294895, -1.250931, -3.44546, 1, 0.5411765, 0, 1,
-1.287911, -0.9926378, -2.143973, 1, 0.5450981, 0, 1,
-1.286065, 0.6290967, -1.184263, 1, 0.5529412, 0, 1,
-1.283724, 0.5168533, -1.973799, 1, 0.5568628, 0, 1,
-1.270837, -1.027527, -3.980867, 1, 0.5647059, 0, 1,
-1.260731, 0.4042154, -1.222341, 1, 0.5686275, 0, 1,
-1.259028, -0.2115775, -3.423141, 1, 0.5764706, 0, 1,
-1.255475, -0.1302134, -2.098645, 1, 0.5803922, 0, 1,
-1.254991, -0.4680107, -0.1003936, 1, 0.5882353, 0, 1,
-1.252568, -0.465418, -1.539389, 1, 0.5921569, 0, 1,
-1.247622, 0.8402524, -1.189241, 1, 0.6, 0, 1,
-1.242107, 0.1160385, -1.047732, 1, 0.6078432, 0, 1,
-1.231907, 0.2976939, -0.8823088, 1, 0.6117647, 0, 1,
-1.22797, -1.483219, -1.154766, 1, 0.6196079, 0, 1,
-1.227828, -0.08892161, -1.866124, 1, 0.6235294, 0, 1,
-1.226183, 1.210594, -0.9199122, 1, 0.6313726, 0, 1,
-1.224665, 1.512385, -0.3017809, 1, 0.6352941, 0, 1,
-1.21412, 0.01086976, -0.7733961, 1, 0.6431373, 0, 1,
-1.208963, 1.131902, -0.5294293, 1, 0.6470588, 0, 1,
-1.207157, -1.420248, -2.061064, 1, 0.654902, 0, 1,
-1.205722, 0.3341657, -1.591063, 1, 0.6588235, 0, 1,
-1.205421, -1.505409, -3.51362, 1, 0.6666667, 0, 1,
-1.203868, 0.5638735, -1.328177, 1, 0.6705883, 0, 1,
-1.202073, -1.076701, -3.231921, 1, 0.6784314, 0, 1,
-1.200814, -1.606411, -2.119775, 1, 0.682353, 0, 1,
-1.19455, 1.380196, -1.609748, 1, 0.6901961, 0, 1,
-1.18529, 0.3366313, 0.4334202, 1, 0.6941177, 0, 1,
-1.182369, 0.3293833, -3.028843, 1, 0.7019608, 0, 1,
-1.176689, 0.09707284, -1.575302, 1, 0.7098039, 0, 1,
-1.163002, -1.195877, -3.524991, 1, 0.7137255, 0, 1,
-1.157757, -0.1252707, -1.722292, 1, 0.7215686, 0, 1,
-1.156919, 0.4466522, -0.8679103, 1, 0.7254902, 0, 1,
-1.156798, -1.518054, -0.4449528, 1, 0.7333333, 0, 1,
-1.15499, 0.5888786, -2.594828, 1, 0.7372549, 0, 1,
-1.154295, 0.5184245, -0.8063161, 1, 0.7450981, 0, 1,
-1.147545, 1.791756, -0.473652, 1, 0.7490196, 0, 1,
-1.13722, 0.8905057, -1.759888, 1, 0.7568628, 0, 1,
-1.116999, 1.19668, 0.5067809, 1, 0.7607843, 0, 1,
-1.115003, 0.517733, -1.041079, 1, 0.7686275, 0, 1,
-1.095519, 0.1685996, -0.2874881, 1, 0.772549, 0, 1,
-1.094602, -0.4598516, -2.301603, 1, 0.7803922, 0, 1,
-1.094284, -0.2738925, -2.006853, 1, 0.7843137, 0, 1,
-1.093176, -0.0008430333, -0.6729195, 1, 0.7921569, 0, 1,
-1.092647, -0.215671, -2.854702, 1, 0.7960784, 0, 1,
-1.090768, 0.6381808, -1.966731, 1, 0.8039216, 0, 1,
-1.084897, 0.5264695, -2.215194, 1, 0.8117647, 0, 1,
-1.074574, 0.1838246, -0.6580308, 1, 0.8156863, 0, 1,
-1.065622, -1.030842, -2.505683, 1, 0.8235294, 0, 1,
-1.065317, -0.02864753, -0.5547316, 1, 0.827451, 0, 1,
-1.061921, 0.3966861, -0.565595, 1, 0.8352941, 0, 1,
-1.052907, 0.6362498, -0.7176546, 1, 0.8392157, 0, 1,
-1.049617, -0.3064157, -1.70962, 1, 0.8470588, 0, 1,
-1.040073, -0.1796521, -0.8818511, 1, 0.8509804, 0, 1,
-1.038178, 0.3397687, -1.004276, 1, 0.8588235, 0, 1,
-1.037793, -0.2469618, -3.305283, 1, 0.8627451, 0, 1,
-1.037032, -0.8353683, -3.54023, 1, 0.8705882, 0, 1,
-1.036724, 2.129941, 0.5877, 1, 0.8745098, 0, 1,
-1.022654, 1.043828, -2.218009, 1, 0.8823529, 0, 1,
-1.017456, -0.5501931, -2.548562, 1, 0.8862745, 0, 1,
-0.996055, 1.652556, -2.800051, 1, 0.8941177, 0, 1,
-0.9909739, 0.4387004, -3.75895, 1, 0.8980392, 0, 1,
-0.9908439, 0.05680243, -3.483038, 1, 0.9058824, 0, 1,
-0.9890432, -1.56411, -1.513427, 1, 0.9137255, 0, 1,
-0.9852092, -1.28777, -2.466022, 1, 0.9176471, 0, 1,
-0.9834821, 0.4467382, -1.518794, 1, 0.9254902, 0, 1,
-0.969013, -1.233859, -2.698017, 1, 0.9294118, 0, 1,
-0.9686548, -0.04784792, -1.03799, 1, 0.9372549, 0, 1,
-0.9651828, 0.6271064, 0.7115936, 1, 0.9411765, 0, 1,
-0.9611841, -0.5231591, -1.779744, 1, 0.9490196, 0, 1,
-0.9565927, 0.1231194, -1.931322, 1, 0.9529412, 0, 1,
-0.95345, 0.4228236, -0.8490103, 1, 0.9607843, 0, 1,
-0.9447471, -0.08915804, -2.024765, 1, 0.9647059, 0, 1,
-0.9424518, 2.295043, -0.1784423, 1, 0.972549, 0, 1,
-0.9367887, -0.4916019, -3.933177, 1, 0.9764706, 0, 1,
-0.922315, -0.6533545, -1.858541, 1, 0.9843137, 0, 1,
-0.9221196, -0.6787794, -2.838187, 1, 0.9882353, 0, 1,
-0.9200122, -0.07579274, -1.461042, 1, 0.9960784, 0, 1,
-0.9158492, 0.219816, -0.9835861, 0.9960784, 1, 0, 1,
-0.9142318, -0.8207812, -4.686362, 0.9921569, 1, 0, 1,
-0.9117435, 0.5054989, -1.246472, 0.9843137, 1, 0, 1,
-0.9113267, -0.7738784, -3.300942, 0.9803922, 1, 0, 1,
-0.9091682, -0.7544995, -0.6946874, 0.972549, 1, 0, 1,
-0.9078972, -0.9492558, -2.593415, 0.9686275, 1, 0, 1,
-0.8977871, 0.9853354, -0.8924798, 0.9607843, 1, 0, 1,
-0.8922229, -0.5880103, -3.257504, 0.9568627, 1, 0, 1,
-0.8862479, -0.9008738, -2.881222, 0.9490196, 1, 0, 1,
-0.8847482, 0.2815883, 0.2818226, 0.945098, 1, 0, 1,
-0.8815747, 0.5926356, -0.5950155, 0.9372549, 1, 0, 1,
-0.874985, 0.02694024, -1.048387, 0.9333333, 1, 0, 1,
-0.872919, 3.236377, 1.306028, 0.9254902, 1, 0, 1,
-0.8714295, 1.872893, 1.64708, 0.9215686, 1, 0, 1,
-0.8691025, 0.3064983, -1.428984, 0.9137255, 1, 0, 1,
-0.8678716, 0.8925747, 0.4961891, 0.9098039, 1, 0, 1,
-0.8676171, 1.471734, -2.50323, 0.9019608, 1, 0, 1,
-0.8641035, -0.424379, -2.205345, 0.8941177, 1, 0, 1,
-0.8619018, -1.452338, -2.540955, 0.8901961, 1, 0, 1,
-0.8604296, 0.1281223, -1.157311, 0.8823529, 1, 0, 1,
-0.8581521, 0.3781953, -1.732071, 0.8784314, 1, 0, 1,
-0.8581129, 1.016016, -1.552879, 0.8705882, 1, 0, 1,
-0.8550028, -1.307603, -1.973046, 0.8666667, 1, 0, 1,
-0.8500827, 0.1286308, -0.320021, 0.8588235, 1, 0, 1,
-0.8493216, 1.883202, -0.953578, 0.854902, 1, 0, 1,
-0.8452539, 0.6557024, -0.7377305, 0.8470588, 1, 0, 1,
-0.8433292, -0.3126469, -3.7918, 0.8431373, 1, 0, 1,
-0.8372806, -0.1038692, -0.5533804, 0.8352941, 1, 0, 1,
-0.8369361, 0.01990799, -2.091581, 0.8313726, 1, 0, 1,
-0.8275455, -0.8525845, -1.643807, 0.8235294, 1, 0, 1,
-0.8185173, -0.233093, -3.240724, 0.8196079, 1, 0, 1,
-0.8165025, 1.078182, -1.149389, 0.8117647, 1, 0, 1,
-0.8141554, 0.953759, 0.9875646, 0.8078431, 1, 0, 1,
-0.8021842, -0.2471163, -2.008753, 0.8, 1, 0, 1,
-0.7978213, -0.9044822, -1.476936, 0.7921569, 1, 0, 1,
-0.7963319, 0.8181458, -1.654176, 0.7882353, 1, 0, 1,
-0.7902049, -1.739699, -0.3462496, 0.7803922, 1, 0, 1,
-0.7868853, 0.683902, 0.08855602, 0.7764706, 1, 0, 1,
-0.7836539, -0.1145249, -2.255908, 0.7686275, 1, 0, 1,
-0.7820661, 1.174764, -0.5029883, 0.7647059, 1, 0, 1,
-0.7816118, -0.9349167, -2.327502, 0.7568628, 1, 0, 1,
-0.7803112, 2.209566, -0.3524925, 0.7529412, 1, 0, 1,
-0.774294, -0.7527331, -0.6901655, 0.7450981, 1, 0, 1,
-0.7737017, 0.1748729, -2.638643, 0.7411765, 1, 0, 1,
-0.7534848, -0.219527, -2.72716, 0.7333333, 1, 0, 1,
-0.7503045, 0.4544441, 0.9829026, 0.7294118, 1, 0, 1,
-0.7479137, -0.8602275, -2.677538, 0.7215686, 1, 0, 1,
-0.744417, -0.3776033, -1.549116, 0.7176471, 1, 0, 1,
-0.7424038, -0.02751007, -2.007214, 0.7098039, 1, 0, 1,
-0.7395246, -1.873882, -3.706715, 0.7058824, 1, 0, 1,
-0.735541, -1.906447, -1.387203, 0.6980392, 1, 0, 1,
-0.7284807, 1.205595, -1.25902, 0.6901961, 1, 0, 1,
-0.726833, -0.08571929, -1.294648, 0.6862745, 1, 0, 1,
-0.7268068, -1.468791, -1.651408, 0.6784314, 1, 0, 1,
-0.7242546, -0.2151658, -2.617223, 0.6745098, 1, 0, 1,
-0.7145549, 0.9487422, -0.936102, 0.6666667, 1, 0, 1,
-0.7024288, -1.556664, -2.440059, 0.6627451, 1, 0, 1,
-0.6963531, 1.52548, 2.033091, 0.654902, 1, 0, 1,
-0.6927516, -0.1307801, -2.548789, 0.6509804, 1, 0, 1,
-0.6916369, 0.3395642, 2.117814, 0.6431373, 1, 0, 1,
-0.6913291, 0.08927125, -1.03824, 0.6392157, 1, 0, 1,
-0.6861079, -0.3431414, -2.616166, 0.6313726, 1, 0, 1,
-0.6730132, -0.6806324, -3.407547, 0.627451, 1, 0, 1,
-0.6699929, 0.2720731, -0.9145287, 0.6196079, 1, 0, 1,
-0.6664922, 0.457912, -1.398764, 0.6156863, 1, 0, 1,
-0.6578881, 0.5286584, -2.635655, 0.6078432, 1, 0, 1,
-0.6560172, -0.9372195, -4.051823, 0.6039216, 1, 0, 1,
-0.6535316, 0.705357, 0.1012924, 0.5960785, 1, 0, 1,
-0.6484893, 0.2915149, -0.8447898, 0.5882353, 1, 0, 1,
-0.6445515, -0.2742314, -1.699499, 0.5843138, 1, 0, 1,
-0.6439382, -0.691924, 0.04914385, 0.5764706, 1, 0, 1,
-0.6365325, 0.7874832, -2.387085, 0.572549, 1, 0, 1,
-0.6356814, 0.7264098, -0.4563464, 0.5647059, 1, 0, 1,
-0.6306652, 1.094993, -0.1457897, 0.5607843, 1, 0, 1,
-0.6293168, 0.596088, 0.5144106, 0.5529412, 1, 0, 1,
-0.6273892, -0.1114528, -1.457319, 0.5490196, 1, 0, 1,
-0.6233614, -0.9879842, -2.955605, 0.5411765, 1, 0, 1,
-0.6130469, 0.795831, -0.3760962, 0.5372549, 1, 0, 1,
-0.5977973, 0.8898207, -1.710538, 0.5294118, 1, 0, 1,
-0.5974667, -0.08513888, -1.626356, 0.5254902, 1, 0, 1,
-0.595919, -1.760903, -3.994965, 0.5176471, 1, 0, 1,
-0.5930789, 0.07974706, -0.6998342, 0.5137255, 1, 0, 1,
-0.5874634, -0.6271337, -1.975201, 0.5058824, 1, 0, 1,
-0.5856317, 1.336253, 0.3525451, 0.5019608, 1, 0, 1,
-0.5855029, -0.2202646, -1.209434, 0.4941176, 1, 0, 1,
-0.5845657, -1.778764, -1.691671, 0.4862745, 1, 0, 1,
-0.5842692, -0.471751, -3.927376, 0.4823529, 1, 0, 1,
-0.5784933, -0.1363779, -1.062339, 0.4745098, 1, 0, 1,
-0.576349, 0.1794352, -1.709397, 0.4705882, 1, 0, 1,
-0.5759395, -1.049464, -1.977637, 0.4627451, 1, 0, 1,
-0.5719392, 0.9633282, 0.0550847, 0.4588235, 1, 0, 1,
-0.5683475, 0.7612638, -0.7996248, 0.4509804, 1, 0, 1,
-0.563783, -0.6241327, -1.884384, 0.4470588, 1, 0, 1,
-0.5631955, -0.7748056, -3.265199, 0.4392157, 1, 0, 1,
-0.5620886, -0.5775287, -1.823839, 0.4352941, 1, 0, 1,
-0.5593024, -0.1673634, -0.8107216, 0.427451, 1, 0, 1,
-0.5579334, -0.3922521, -3.643836, 0.4235294, 1, 0, 1,
-0.5506809, -0.5151209, -2.30476, 0.4156863, 1, 0, 1,
-0.5503101, -0.3747166, -0.1788464, 0.4117647, 1, 0, 1,
-0.5486141, 1.10145, -2.499358, 0.4039216, 1, 0, 1,
-0.5481715, -0.2728958, -1.685178, 0.3960784, 1, 0, 1,
-0.545965, -0.7882999, -2.405893, 0.3921569, 1, 0, 1,
-0.5409194, 0.1563283, -1.937671, 0.3843137, 1, 0, 1,
-0.5405548, 0.3073628, -1.909941, 0.3803922, 1, 0, 1,
-0.5396757, -0.2509178, -2.223952, 0.372549, 1, 0, 1,
-0.5363592, -0.6484758, -3.577996, 0.3686275, 1, 0, 1,
-0.5334563, -0.6369522, 0.01739158, 0.3607843, 1, 0, 1,
-0.5309004, -0.604786, -2.22856, 0.3568628, 1, 0, 1,
-0.5305246, -1.812769, -1.984889, 0.3490196, 1, 0, 1,
-0.5262762, -0.2465334, -2.250626, 0.345098, 1, 0, 1,
-0.5244598, -1.072613, -2.295532, 0.3372549, 1, 0, 1,
-0.5241998, -1.134022, -4.112643, 0.3333333, 1, 0, 1,
-0.5239048, -0.7446871, -2.643435, 0.3254902, 1, 0, 1,
-0.5236182, -1.009176, -2.93452, 0.3215686, 1, 0, 1,
-0.5189993, 0.4738915, -0.9604015, 0.3137255, 1, 0, 1,
-0.5183687, -0.4614579, -0.646243, 0.3098039, 1, 0, 1,
-0.5171314, 0.113075, -1.122737, 0.3019608, 1, 0, 1,
-0.516798, 1.249475, -2.512052, 0.2941177, 1, 0, 1,
-0.5113322, -0.09412874, -2.695932, 0.2901961, 1, 0, 1,
-0.5016599, 0.8618668, -0.9658749, 0.282353, 1, 0, 1,
-0.5004013, -1.082479, -3.208045, 0.2784314, 1, 0, 1,
-0.4912947, 0.4560956, -1.59606, 0.2705882, 1, 0, 1,
-0.4900907, -1.146072, -1.81214, 0.2666667, 1, 0, 1,
-0.4868576, 1.7514, 0.886312, 0.2588235, 1, 0, 1,
-0.4817023, 0.1586339, -0.127737, 0.254902, 1, 0, 1,
-0.4769061, 1.219458, -0.4251373, 0.2470588, 1, 0, 1,
-0.4656083, 1.852474, -0.01607078, 0.2431373, 1, 0, 1,
-0.4599593, -0.3524816, -2.990654, 0.2352941, 1, 0, 1,
-0.4588543, -1.050844, -2.975856, 0.2313726, 1, 0, 1,
-0.4538956, 2.119947, 0.3191203, 0.2235294, 1, 0, 1,
-0.4486226, 0.2192442, -0.3225757, 0.2196078, 1, 0, 1,
-0.4479434, -0.6596644, -2.619104, 0.2117647, 1, 0, 1,
-0.4463271, 1.433384, -1.805769, 0.2078431, 1, 0, 1,
-0.4381589, 0.07086118, -1.907705, 0.2, 1, 0, 1,
-0.4337964, -1.175901, -2.345523, 0.1921569, 1, 0, 1,
-0.4311816, -0.6555504, -3.254668, 0.1882353, 1, 0, 1,
-0.4257853, -0.4149935, -2.054573, 0.1803922, 1, 0, 1,
-0.4246221, 0.5975677, -0.1927083, 0.1764706, 1, 0, 1,
-0.4216999, 0.6596817, 1.754118, 0.1686275, 1, 0, 1,
-0.4194037, 0.1806739, -0.934873, 0.1647059, 1, 0, 1,
-0.4192272, 1.245667, 0.08621951, 0.1568628, 1, 0, 1,
-0.4158477, -2.890953, -4.12428, 0.1529412, 1, 0, 1,
-0.4130369, 0.5492642, 0.02390798, 0.145098, 1, 0, 1,
-0.4126514, 0.8372988, -2.162849, 0.1411765, 1, 0, 1,
-0.410163, -0.7523441, -2.977198, 0.1333333, 1, 0, 1,
-0.4074407, -1.39137, -3.459541, 0.1294118, 1, 0, 1,
-0.4072278, 0.2781417, -1.559061, 0.1215686, 1, 0, 1,
-0.4059632, -0.09665532, -1.287992, 0.1176471, 1, 0, 1,
-0.4052611, -1.935543, -2.61114, 0.1098039, 1, 0, 1,
-0.4011776, -1.47882, -3.040154, 0.1058824, 1, 0, 1,
-0.3969012, 0.5215038, -0.9111928, 0.09803922, 1, 0, 1,
-0.3908824, 0.1834258, -1.172668, 0.09019608, 1, 0, 1,
-0.387449, -0.5783769, -3.737119, 0.08627451, 1, 0, 1,
-0.3842763, -0.1632121, 0.71964, 0.07843138, 1, 0, 1,
-0.3837119, -0.3600472, -3.880721, 0.07450981, 1, 0, 1,
-0.37852, 0.5674582, -0.9583675, 0.06666667, 1, 0, 1,
-0.3782485, 0.293064, -1.057536, 0.0627451, 1, 0, 1,
-0.3763894, -1.187781, -3.850212, 0.05490196, 1, 0, 1,
-0.3675153, 0.1813658, -0.139046, 0.05098039, 1, 0, 1,
-0.3635629, -0.7394873, -2.570241, 0.04313726, 1, 0, 1,
-0.358687, -0.2627869, -1.504775, 0.03921569, 1, 0, 1,
-0.3564907, -0.3728788, -2.854404, 0.03137255, 1, 0, 1,
-0.3552514, -1.101453, -2.290314, 0.02745098, 1, 0, 1,
-0.3525186, -0.3069754, -2.085244, 0.01960784, 1, 0, 1,
-0.3506595, 2.30642, -0.07433157, 0.01568628, 1, 0, 1,
-0.3494485, 0.2829382, -1.216642, 0.007843138, 1, 0, 1,
-0.3487811, -0.8015985, -2.816974, 0.003921569, 1, 0, 1,
-0.3435265, 2.146968, 0.7345161, 0, 1, 0.003921569, 1,
-0.3432155, -0.5358793, -3.142497, 0, 1, 0.01176471, 1,
-0.3402776, 1.52954, -0.1640807, 0, 1, 0.01568628, 1,
-0.3375756, 0.1050291, -1.164493, 0, 1, 0.02352941, 1,
-0.3366367, -0.3444569, -1.583373, 0, 1, 0.02745098, 1,
-0.3346964, 0.4089375, -0.2922753, 0, 1, 0.03529412, 1,
-0.3307315, 0.982631, -0.7519928, 0, 1, 0.03921569, 1,
-0.3288587, 0.3264079, 0.325223, 0, 1, 0.04705882, 1,
-0.326574, -1.196806, -2.673988, 0, 1, 0.05098039, 1,
-0.3211105, -0.4412183, -2.536609, 0, 1, 0.05882353, 1,
-0.3136972, 0.2861901, -1.478963, 0, 1, 0.0627451, 1,
-0.3081367, -0.6376371, -1.137996, 0, 1, 0.07058824, 1,
-0.3073416, -0.4227499, -1.998018, 0, 1, 0.07450981, 1,
-0.3022867, 0.2750553, -0.272768, 0, 1, 0.08235294, 1,
-0.302037, 0.5560561, -2.073777, 0, 1, 0.08627451, 1,
-0.3015832, -0.09555027, -3.151404, 0, 1, 0.09411765, 1,
-0.3013833, -3.161346, -2.311661, 0, 1, 0.1019608, 1,
-0.2982793, 0.5956305, 0.1534615, 0, 1, 0.1058824, 1,
-0.2961101, -0.4133985, -2.563404, 0, 1, 0.1137255, 1,
-0.2960556, 1.519315, -1.575332, 0, 1, 0.1176471, 1,
-0.2952648, 0.6289006, -1.54653, 0, 1, 0.1254902, 1,
-0.2923503, 1.372033, 1.405636, 0, 1, 0.1294118, 1,
-0.2922223, -0.3775595, -0.03669128, 0, 1, 0.1372549, 1,
-0.287707, 0.7719033, -0.07595532, 0, 1, 0.1411765, 1,
-0.2829611, 1.746306, 0.4297912, 0, 1, 0.1490196, 1,
-0.2803863, 0.6511444, -1.253273, 0, 1, 0.1529412, 1,
-0.2793102, -1.618026, -3.353243, 0, 1, 0.1607843, 1,
-0.2767688, -0.5102364, -4.919524, 0, 1, 0.1647059, 1,
-0.2751087, 0.2686591, -0.249367, 0, 1, 0.172549, 1,
-0.2697525, 1.491512, -0.842387, 0, 1, 0.1764706, 1,
-0.2646104, -0.4245246, -2.090653, 0, 1, 0.1843137, 1,
-0.26435, -0.009333059, 0.1483037, 0, 1, 0.1882353, 1,
-0.2610373, -0.4531447, -1.759464, 0, 1, 0.1960784, 1,
-0.2593122, -0.4830925, -3.458572, 0, 1, 0.2039216, 1,
-0.2576357, 1.007889, 0.4123519, 0, 1, 0.2078431, 1,
-0.2573985, -0.03496347, -1.960369, 0, 1, 0.2156863, 1,
-0.2563007, 0.8496247, 0.002335798, 0, 1, 0.2196078, 1,
-0.2498566, -1.380113, -2.282387, 0, 1, 0.227451, 1,
-0.2477885, 0.1823475, -0.8242372, 0, 1, 0.2313726, 1,
-0.2472426, -1.507506, -3.777469, 0, 1, 0.2392157, 1,
-0.2469175, -0.2969348, -3.199959, 0, 1, 0.2431373, 1,
-0.240094, 0.2895558, -0.6716947, 0, 1, 0.2509804, 1,
-0.2334953, 1.087147, -0.5675713, 0, 1, 0.254902, 1,
-0.2330705, -0.1452432, -1.797276, 0, 1, 0.2627451, 1,
-0.2264143, 0.6042218, -1.681021, 0, 1, 0.2666667, 1,
-0.2263015, -0.4160704, -1.171515, 0, 1, 0.2745098, 1,
-0.2260522, 0.1514209, -1.538826, 0, 1, 0.2784314, 1,
-0.2209094, 2.012659, 0.003180204, 0, 1, 0.2862745, 1,
-0.2174919, -1.037651, -4.33659, 0, 1, 0.2901961, 1,
-0.2140955, -1.158327, -1.726217, 0, 1, 0.2980392, 1,
-0.2140886, 0.5213908, 0.3421157, 0, 1, 0.3058824, 1,
-0.211026, -0.4326617, -1.972913, 0, 1, 0.3098039, 1,
-0.2077439, 0.3705261, 0.749827, 0, 1, 0.3176471, 1,
-0.2047563, 0.3952993, -2.05698, 0, 1, 0.3215686, 1,
-0.2045773, -0.180036, -2.324479, 0, 1, 0.3294118, 1,
-0.2036498, 0.1729383, -0.5712166, 0, 1, 0.3333333, 1,
-0.2028092, 1.210865, -0.8856914, 0, 1, 0.3411765, 1,
-0.201561, 0.7845816, -0.2214951, 0, 1, 0.345098, 1,
-0.2007302, 0.4906972, -0.4199093, 0, 1, 0.3529412, 1,
-0.1988628, -0.8317078, -2.291211, 0, 1, 0.3568628, 1,
-0.1956854, 0.3651142, -1.114387, 0, 1, 0.3647059, 1,
-0.1955353, 0.2755569, -0.8495314, 0, 1, 0.3686275, 1,
-0.1930898, -0.51276, -3.241404, 0, 1, 0.3764706, 1,
-0.1884497, -0.1967233, -1.41617, 0, 1, 0.3803922, 1,
-0.1871814, -0.2423386, -2.593336, 0, 1, 0.3882353, 1,
-0.1838826, 1.828745, -0.5578177, 0, 1, 0.3921569, 1,
-0.1827196, -0.1052438, -1.523581, 0, 1, 0.4, 1,
-0.1807744, -0.3992282, -0.5826412, 0, 1, 0.4078431, 1,
-0.1786214, -1.927719, -3.398879, 0, 1, 0.4117647, 1,
-0.1782708, -1.966432, -2.364458, 0, 1, 0.4196078, 1,
-0.1779663, 1.882455, 0.2854358, 0, 1, 0.4235294, 1,
-0.1736168, -1.724935, -4.071383, 0, 1, 0.4313726, 1,
-0.1726459, -0.1631, -2.148023, 0, 1, 0.4352941, 1,
-0.1696002, -1.409152, -2.066555, 0, 1, 0.4431373, 1,
-0.1683116, -0.3286673, -2.181082, 0, 1, 0.4470588, 1,
-0.1676451, -0.4697832, -4.821254, 0, 1, 0.454902, 1,
-0.163984, 1.635334, -0.1400124, 0, 1, 0.4588235, 1,
-0.1617917, -1.692983, -4.158753, 0, 1, 0.4666667, 1,
-0.1528127, -1.220268, -1.757577, 0, 1, 0.4705882, 1,
-0.152373, -0.2665332, -4.270894, 0, 1, 0.4784314, 1,
-0.1487426, -0.9887822, -2.852261, 0, 1, 0.4823529, 1,
-0.1465081, -1.486672, -2.952322, 0, 1, 0.4901961, 1,
-0.144133, 1.214123, 0.418194, 0, 1, 0.4941176, 1,
-0.1391823, 0.802519, 1.363545, 0, 1, 0.5019608, 1,
-0.1349362, 1.725277, -1.396811, 0, 1, 0.509804, 1,
-0.1326023, 0.1058669, -2.401941, 0, 1, 0.5137255, 1,
-0.1305043, -0.5563587, -1.853582, 0, 1, 0.5215687, 1,
-0.1293009, -0.6350304, -1.913716, 0, 1, 0.5254902, 1,
-0.126873, -1.620358, -1.399813, 0, 1, 0.5333334, 1,
-0.1235475, 0.9426865, 0.3913564, 0, 1, 0.5372549, 1,
-0.122391, 1.194694, -0.2528973, 0, 1, 0.5450981, 1,
-0.1221165, 0.002062259, -1.60153, 0, 1, 0.5490196, 1,
-0.1191433, -0.2285867, -3.833529, 0, 1, 0.5568628, 1,
-0.1147842, 1.286943, 1.253143, 0, 1, 0.5607843, 1,
-0.1143477, -0.1767713, -1.525351, 0, 1, 0.5686275, 1,
-0.1076697, 0.3548771, -1.611677, 0, 1, 0.572549, 1,
-0.1052544, 2.118603, -0.6053647, 0, 1, 0.5803922, 1,
-0.09839845, -0.4194225, -3.048326, 0, 1, 0.5843138, 1,
-0.0941901, 1.710478, 0.115438, 0, 1, 0.5921569, 1,
-0.09244264, -1.749082, -3.586725, 0, 1, 0.5960785, 1,
-0.09059258, -1.408525, -2.612649, 0, 1, 0.6039216, 1,
-0.09040974, 0.9097875, 0.3423871, 0, 1, 0.6117647, 1,
-0.09035008, -0.7862321, -4.136231, 0, 1, 0.6156863, 1,
-0.08700401, 0.4999029, 0.0635285, 0, 1, 0.6235294, 1,
-0.08534628, 0.4516601, 0.6082372, 0, 1, 0.627451, 1,
-0.08154588, -0.2069915, -1.791392, 0, 1, 0.6352941, 1,
-0.07993086, -1.009766, -1.519403, 0, 1, 0.6392157, 1,
-0.07885222, -0.02671854, -3.415574, 0, 1, 0.6470588, 1,
-0.07248111, -0.4356766, -2.737866, 0, 1, 0.6509804, 1,
-0.06996986, -1.320714, -0.8199784, 0, 1, 0.6588235, 1,
-0.06328823, 0.9348552, 1.296144, 0, 1, 0.6627451, 1,
-0.06215172, 0.3079993, 0.8112952, 0, 1, 0.6705883, 1,
-0.05948411, -0.9526425, -3.809006, 0, 1, 0.6745098, 1,
-0.05754454, -1.663176, -3.084682, 0, 1, 0.682353, 1,
-0.05717458, 0.06288634, -0.3104461, 0, 1, 0.6862745, 1,
-0.05700285, 1.011265, -1.733245, 0, 1, 0.6941177, 1,
-0.05650654, -0.4368438, -1.844964, 0, 1, 0.7019608, 1,
-0.05575425, 0.4337276, 0.4958342, 0, 1, 0.7058824, 1,
-0.05361669, 2.264821, 1.077032, 0, 1, 0.7137255, 1,
-0.0534772, 0.03921774, 0.3148537, 0, 1, 0.7176471, 1,
-0.05291076, -1.962015, -3.068112, 0, 1, 0.7254902, 1,
-0.05178194, 1.129079, -0.5813364, 0, 1, 0.7294118, 1,
-0.05088016, 1.840264, -0.2659198, 0, 1, 0.7372549, 1,
-0.05072454, -0.3026648, -2.365044, 0, 1, 0.7411765, 1,
-0.04823483, -0.7180779, -2.778577, 0, 1, 0.7490196, 1,
-0.04146824, -2.319174, -3.471404, 0, 1, 0.7529412, 1,
-0.0409097, 0.06950466, -1.534409, 0, 1, 0.7607843, 1,
-0.03784534, 0.2836375, 0.0638971, 0, 1, 0.7647059, 1,
-0.03584351, 0.4676571, 0.4061511, 0, 1, 0.772549, 1,
-0.03531749, -0.1551431, -3.966995, 0, 1, 0.7764706, 1,
-0.02552785, -1.507788, -3.450864, 0, 1, 0.7843137, 1,
-0.0251233, 1.7818, 0.05322081, 0, 1, 0.7882353, 1,
-0.02486146, 0.4558262, 0.8665717, 0, 1, 0.7960784, 1,
-0.02103521, -0.2341417, -2.526358, 0, 1, 0.8039216, 1,
-0.02017775, -2.003204, -2.653956, 0, 1, 0.8078431, 1,
-0.01819923, -1.759667, -3.526607, 0, 1, 0.8156863, 1,
-0.01783927, -0.5505319, -3.554206, 0, 1, 0.8196079, 1,
-0.01587895, 0.7027904, -0.375615, 0, 1, 0.827451, 1,
-0.01520279, -0.8482208, -4.482073, 0, 1, 0.8313726, 1,
-0.01385504, -0.2975918, -2.208703, 0, 1, 0.8392157, 1,
-0.008456084, -0.7299236, -5.736491, 0, 1, 0.8431373, 1,
-0.004632295, -1.437334, -3.525533, 0, 1, 0.8509804, 1,
0.00210788, -1.208632, 5.438426, 0, 1, 0.854902, 1,
0.005475523, 0.4390275, -0.9245115, 0, 1, 0.8627451, 1,
0.006200227, -0.3530926, 2.556139, 0, 1, 0.8666667, 1,
0.007264224, 0.1686298, -0.9743889, 0, 1, 0.8745098, 1,
0.007389951, -0.7886481, 3.215039, 0, 1, 0.8784314, 1,
0.008457099, -0.07756465, 3.706398, 0, 1, 0.8862745, 1,
0.01203571, 0.8940865, -0.7420394, 0, 1, 0.8901961, 1,
0.01261455, -0.1988259, 4.729848, 0, 1, 0.8980392, 1,
0.01357171, 0.01182256, 1.21268, 0, 1, 0.9058824, 1,
0.01523148, 0.645499, 0.8762592, 0, 1, 0.9098039, 1,
0.01668859, 0.7723413, -1.006627, 0, 1, 0.9176471, 1,
0.01920157, -2.049932, 3.712175, 0, 1, 0.9215686, 1,
0.02026759, 0.2574577, 0.6810157, 0, 1, 0.9294118, 1,
0.02038932, -0.808993, 3.096214, 0, 1, 0.9333333, 1,
0.02399936, 0.4469199, 0.7842781, 0, 1, 0.9411765, 1,
0.02445402, -1.178886, 3.331967, 0, 1, 0.945098, 1,
0.024858, -1.267637, 4.752402, 0, 1, 0.9529412, 1,
0.02874925, 0.700197, -0.341642, 0, 1, 0.9568627, 1,
0.0337498, -0.3594992, 3.676569, 0, 1, 0.9647059, 1,
0.03523546, -0.4951797, 3.663082, 0, 1, 0.9686275, 1,
0.03605938, -1.23987, 2.501691, 0, 1, 0.9764706, 1,
0.03706321, 0.5474495, -0.2737957, 0, 1, 0.9803922, 1,
0.03956886, 0.5143504, -0.5838985, 0, 1, 0.9882353, 1,
0.04031272, -0.1879581, 2.684486, 0, 1, 0.9921569, 1,
0.04217589, 0.3631778, 2.272774, 0, 1, 1, 1,
0.04771734, -2.114872, 2.97367, 0, 0.9921569, 1, 1,
0.048919, 0.4951088, -0.2046093, 0, 0.9882353, 1, 1,
0.04980598, 0.4509805, 0.4291127, 0, 0.9803922, 1, 1,
0.04999822, -0.7174399, 2.467486, 0, 0.9764706, 1, 1,
0.05516111, -1.258163, 2.902173, 0, 0.9686275, 1, 1,
0.05617882, -0.810134, 1.0481, 0, 0.9647059, 1, 1,
0.05752131, -0.7613844, 3.905059, 0, 0.9568627, 1, 1,
0.05994344, -0.5805405, 3.785931, 0, 0.9529412, 1, 1,
0.06204679, 0.6499251, 0.07449926, 0, 0.945098, 1, 1,
0.06379341, 2.315493, 0.5730678, 0, 0.9411765, 1, 1,
0.06395782, -0.3632455, 3.438677, 0, 0.9333333, 1, 1,
0.06439649, 0.4339382, -0.1553954, 0, 0.9294118, 1, 1,
0.06512659, 0.6061891, -0.6385155, 0, 0.9215686, 1, 1,
0.07171353, 0.5734577, -0.2997173, 0, 0.9176471, 1, 1,
0.07310399, 1.990756, -0.8168879, 0, 0.9098039, 1, 1,
0.07322768, 0.9188702, -1.086948, 0, 0.9058824, 1, 1,
0.07640812, -0.3816181, 3.296417, 0, 0.8980392, 1, 1,
0.07889403, -0.4321333, 2.901764, 0, 0.8901961, 1, 1,
0.0806855, -0.3651777, 5.31828, 0, 0.8862745, 1, 1,
0.08134999, -0.1080656, 2.568981, 0, 0.8784314, 1, 1,
0.08540845, -0.2678586, 4.727588, 0, 0.8745098, 1, 1,
0.0915131, -0.9136075, 3.721651, 0, 0.8666667, 1, 1,
0.09546243, 0.07473591, 1.210839, 0, 0.8627451, 1, 1,
0.09901294, -1.408324, 3.300998, 0, 0.854902, 1, 1,
0.09982536, 1.168097, 0.4652594, 0, 0.8509804, 1, 1,
0.1022043, 1.138133, 0.4652696, 0, 0.8431373, 1, 1,
0.1069892, -1.585226, 1.95237, 0, 0.8392157, 1, 1,
0.1118038, -0.511817, 3.874697, 0, 0.8313726, 1, 1,
0.112266, -0.977758, 2.270081, 0, 0.827451, 1, 1,
0.1139598, -2.006711, 2.924597, 0, 0.8196079, 1, 1,
0.1224936, -0.4046334, 1.146417, 0, 0.8156863, 1, 1,
0.123376, -0.6555587, 4.327892, 0, 0.8078431, 1, 1,
0.1257642, -0.9520008, 5.340035, 0, 0.8039216, 1, 1,
0.1262052, -0.02486524, 1.479432, 0, 0.7960784, 1, 1,
0.1303667, -0.564204, 1.101722, 0, 0.7882353, 1, 1,
0.130652, -0.841093, 2.911321, 0, 0.7843137, 1, 1,
0.1325189, -0.2224213, 2.89548, 0, 0.7764706, 1, 1,
0.1360483, -0.02187675, 1.010637, 0, 0.772549, 1, 1,
0.1428544, -1.554615, 2.747378, 0, 0.7647059, 1, 1,
0.1559589, -1.904702, 1.700756, 0, 0.7607843, 1, 1,
0.1606796, -1.819299, 4.049169, 0, 0.7529412, 1, 1,
0.1635996, 0.001286832, 2.147087, 0, 0.7490196, 1, 1,
0.1651021, -0.6467218, 3.144482, 0, 0.7411765, 1, 1,
0.1679322, 0.2041962, 1.196033, 0, 0.7372549, 1, 1,
0.1689214, 0.05760145, 1.180841, 0, 0.7294118, 1, 1,
0.1768054, 0.3571883, -0.6029476, 0, 0.7254902, 1, 1,
0.1770847, -1.000613, 3.875126, 0, 0.7176471, 1, 1,
0.1771914, -0.01788199, 3.317034, 0, 0.7137255, 1, 1,
0.1782941, -0.05611064, 0.5701192, 0, 0.7058824, 1, 1,
0.1802202, 0.6088508, 0.2850137, 0, 0.6980392, 1, 1,
0.1871088, 0.1230634, 0.2042056, 0, 0.6941177, 1, 1,
0.1885792, -1.012328, 3.024956, 0, 0.6862745, 1, 1,
0.1894768, 0.5658464, 0.1958748, 0, 0.682353, 1, 1,
0.1908033, 0.8135768, 0.3123612, 0, 0.6745098, 1, 1,
0.1908258, 2.56655, 0.997843, 0, 0.6705883, 1, 1,
0.1987622, 1.148485, 0.2406019, 0, 0.6627451, 1, 1,
0.1989539, -1.355183, 2.612539, 0, 0.6588235, 1, 1,
0.1997002, 1.105663, -1.959067, 0, 0.6509804, 1, 1,
0.2010033, 0.4167373, 0.6769195, 0, 0.6470588, 1, 1,
0.2025237, 0.7254292, 0.3236214, 0, 0.6392157, 1, 1,
0.2025963, 1.655479, 0.4477545, 0, 0.6352941, 1, 1,
0.2060186, 1.37484, 0.4451818, 0, 0.627451, 1, 1,
0.2061719, 0.9158725, 0.8124116, 0, 0.6235294, 1, 1,
0.2068495, -1.155456, 3.14972, 0, 0.6156863, 1, 1,
0.2081072, 1.042557, 1.328301, 0, 0.6117647, 1, 1,
0.2155665, -0.06482799, 1.236796, 0, 0.6039216, 1, 1,
0.2247873, 0.8587426, 0.413055, 0, 0.5960785, 1, 1,
0.2258506, 0.1051473, 1.517791, 0, 0.5921569, 1, 1,
0.2271867, 0.06782307, 0.8324797, 0, 0.5843138, 1, 1,
0.2284187, -0.5973123, 2.34573, 0, 0.5803922, 1, 1,
0.2311074, 1.424804, -0.408596, 0, 0.572549, 1, 1,
0.2317382, 0.4743484, 1.100112, 0, 0.5686275, 1, 1,
0.2326527, -0.4186663, 2.473897, 0, 0.5607843, 1, 1,
0.2328916, 1.053524, 0.5270818, 0, 0.5568628, 1, 1,
0.2343809, -0.3480819, 1.716426, 0, 0.5490196, 1, 1,
0.2419372, 1.293137, -0.751196, 0, 0.5450981, 1, 1,
0.245313, -0.8383247, 4.36346, 0, 0.5372549, 1, 1,
0.2488359, -0.02448029, 1.38335, 0, 0.5333334, 1, 1,
0.2496135, -0.09081861, 1.060363, 0, 0.5254902, 1, 1,
0.2555452, 1.186463, -0.2134079, 0, 0.5215687, 1, 1,
0.2583067, 0.8013043, 0.1380681, 0, 0.5137255, 1, 1,
0.2598132, -1.171568, 3.152996, 0, 0.509804, 1, 1,
0.2608766, 0.820522, -0.6811213, 0, 0.5019608, 1, 1,
0.2647202, -1.478808, 2.979083, 0, 0.4941176, 1, 1,
0.2654756, -0.8635483, 4.107657, 0, 0.4901961, 1, 1,
0.2690169, -0.1781169, 0.7404641, 0, 0.4823529, 1, 1,
0.2690393, 0.9658358, -0.1625937, 0, 0.4784314, 1, 1,
0.2705662, -0.8346642, 1.442386, 0, 0.4705882, 1, 1,
0.2723043, 0.2588252, 0.3596443, 0, 0.4666667, 1, 1,
0.2813838, 0.2366109, 2.167452, 0, 0.4588235, 1, 1,
0.2817651, 1.819193, -1.615349, 0, 0.454902, 1, 1,
0.2844253, 0.3313543, 1.672687, 0, 0.4470588, 1, 1,
0.2847936, -0.01150889, 2.743345, 0, 0.4431373, 1, 1,
0.288654, -0.2695301, 1.202256, 0, 0.4352941, 1, 1,
0.2895069, 1.58006, 0.1303883, 0, 0.4313726, 1, 1,
0.2933801, 1.205161, -1.731791, 0, 0.4235294, 1, 1,
0.2954998, -1.203594, 1.520209, 0, 0.4196078, 1, 1,
0.2957141, 0.8910884, 2.356534, 0, 0.4117647, 1, 1,
0.295755, -1.785237, 3.613366, 0, 0.4078431, 1, 1,
0.2979895, -1.052803, 2.769457, 0, 0.4, 1, 1,
0.300803, 0.4034103, 0.0707887, 0, 0.3921569, 1, 1,
0.3016934, 0.01736302, 1.143409, 0, 0.3882353, 1, 1,
0.3037607, -0.02962902, 1.495359, 0, 0.3803922, 1, 1,
0.3056959, 0.01307057, 2.790909, 0, 0.3764706, 1, 1,
0.3108214, 0.5603749, -0.2327763, 0, 0.3686275, 1, 1,
0.3157076, 0.6746621, 1.776659, 0, 0.3647059, 1, 1,
0.3161477, 0.9967524, -0.9998264, 0, 0.3568628, 1, 1,
0.3188708, -1.072097, 3.831477, 0, 0.3529412, 1, 1,
0.3192233, 0.8117676, -1.116679, 0, 0.345098, 1, 1,
0.3205279, 0.09858708, 1.36558, 0, 0.3411765, 1, 1,
0.3217891, -0.4509289, 2.979976, 0, 0.3333333, 1, 1,
0.3241778, 0.7192276, 0.5090775, 0, 0.3294118, 1, 1,
0.3243959, 0.04521346, 1.360561, 0, 0.3215686, 1, 1,
0.3286382, 1.073535, 1.301786, 0, 0.3176471, 1, 1,
0.3298552, 0.4599904, 0.5787221, 0, 0.3098039, 1, 1,
0.3322805, 1.107845, 0.7782121, 0, 0.3058824, 1, 1,
0.3336442, 0.8953065, 0.3516325, 0, 0.2980392, 1, 1,
0.3344592, 0.9768752, 0.5144026, 0, 0.2901961, 1, 1,
0.3350186, -1.588767, 3.782458, 0, 0.2862745, 1, 1,
0.3381021, -0.7648475, 2.047373, 0, 0.2784314, 1, 1,
0.3420207, -0.0455374, 1.091069, 0, 0.2745098, 1, 1,
0.3438634, 1.690183, 1.324049, 0, 0.2666667, 1, 1,
0.346495, 0.9177369, 1.181493, 0, 0.2627451, 1, 1,
0.3469993, 1.553342, -1.065831, 0, 0.254902, 1, 1,
0.3477037, 0.05580644, 2.466816, 0, 0.2509804, 1, 1,
0.3477811, 1.032847, 0.1976837, 0, 0.2431373, 1, 1,
0.351083, -1.021313, 1.755206, 0, 0.2392157, 1, 1,
0.3527167, -1.913373, 3.319187, 0, 0.2313726, 1, 1,
0.3625199, 1.18712, 1.945146, 0, 0.227451, 1, 1,
0.363346, -1.184488, 1.400546, 0, 0.2196078, 1, 1,
0.3684616, -1.766575, 2.523744, 0, 0.2156863, 1, 1,
0.3685901, 0.252078, 2.993944, 0, 0.2078431, 1, 1,
0.3745965, 1.473394, -0.4766672, 0, 0.2039216, 1, 1,
0.3832365, -1.97476, 4.389683, 0, 0.1960784, 1, 1,
0.3836881, -0.1972658, 2.633977, 0, 0.1882353, 1, 1,
0.3864699, 0.4691431, 0.5709379, 0, 0.1843137, 1, 1,
0.3961839, 2.645593, -0.2696917, 0, 0.1764706, 1, 1,
0.4012805, -0.5411732, 2.935783, 0, 0.172549, 1, 1,
0.4026403, 0.1365815, 1.167062, 0, 0.1647059, 1, 1,
0.4081719, -0.1802582, 1.520832, 0, 0.1607843, 1, 1,
0.4098288, 0.2654133, 0.7396285, 0, 0.1529412, 1, 1,
0.4156733, 0.1581443, 2.070089, 0, 0.1490196, 1, 1,
0.4174665, 0.703449, -0.809036, 0, 0.1411765, 1, 1,
0.4186862, -0.1276971, 0.9853346, 0, 0.1372549, 1, 1,
0.4196319, -0.03150136, 3.784897, 0, 0.1294118, 1, 1,
0.4198405, -0.6364618, 1.269885, 0, 0.1254902, 1, 1,
0.4221792, 0.1356097, 1.699644, 0, 0.1176471, 1, 1,
0.4245056, -0.7346559, 1.75176, 0, 0.1137255, 1, 1,
0.443359, 0.4186575, 1.685763, 0, 0.1058824, 1, 1,
0.4448754, 0.3088841, 2.877359, 0, 0.09803922, 1, 1,
0.4509211, 0.7805346, -1.357692, 0, 0.09411765, 1, 1,
0.4509794, 0.1559604, -0.5491662, 0, 0.08627451, 1, 1,
0.4539047, 1.188738, 0.5464647, 0, 0.08235294, 1, 1,
0.45984, -0.7483864, 2.657775, 0, 0.07450981, 1, 1,
0.4599679, -0.03817108, 3.148829, 0, 0.07058824, 1, 1,
0.4617048, 0.5379399, 0.3415438, 0, 0.0627451, 1, 1,
0.4662493, 0.4179628, 0.4069193, 0, 0.05882353, 1, 1,
0.4678553, -0.4455007, 3.833345, 0, 0.05098039, 1, 1,
0.469312, -2.408669, 3.216766, 0, 0.04705882, 1, 1,
0.4710308, 1.681513, -0.4561075, 0, 0.03921569, 1, 1,
0.4721027, -0.4692529, 2.14444, 0, 0.03529412, 1, 1,
0.47279, 0.2437228, 2.292135, 0, 0.02745098, 1, 1,
0.4735859, 0.1116289, 1.731103, 0, 0.02352941, 1, 1,
0.4764767, 1.088574, 1.666119, 0, 0.01568628, 1, 1,
0.4769197, 0.2102543, 1.087109, 0, 0.01176471, 1, 1,
0.4798956, 0.5566886, 0.09413218, 0, 0.003921569, 1, 1,
0.4805447, 0.2027118, 0.8104715, 0.003921569, 0, 1, 1,
0.4806216, -0.7873349, 1.981467, 0.007843138, 0, 1, 1,
0.4808334, -1.111632, 4.029812, 0.01568628, 0, 1, 1,
0.4847031, 1.310411, -0.7336937, 0.01960784, 0, 1, 1,
0.4915626, 0.7471315, 0.3321255, 0.02745098, 0, 1, 1,
0.4926363, -0.588435, 0.3370297, 0.03137255, 0, 1, 1,
0.5026168, -0.2895426, 4.244736, 0.03921569, 0, 1, 1,
0.5037459, 0.3248914, 1.886032, 0.04313726, 0, 1, 1,
0.5054015, 1.525219, 1.412009, 0.05098039, 0, 1, 1,
0.5054035, -0.272294, 3.990621, 0.05490196, 0, 1, 1,
0.5117688, 1.067782, 0.6736662, 0.0627451, 0, 1, 1,
0.515158, 0.727263, 2.770896, 0.06666667, 0, 1, 1,
0.5152747, -0.5439857, 4.286852, 0.07450981, 0, 1, 1,
0.520709, 0.2060644, 0.4634637, 0.07843138, 0, 1, 1,
0.5212068, 1.029037, 0.4194688, 0.08627451, 0, 1, 1,
0.5215908, 0.2336225, 1.322249, 0.09019608, 0, 1, 1,
0.5217963, -0.535363, 4.712224, 0.09803922, 0, 1, 1,
0.521935, -0.7557708, 2.282222, 0.1058824, 0, 1, 1,
0.5262797, 1.278591, 0.01915672, 0.1098039, 0, 1, 1,
0.529785, 0.01220269, 1.740812, 0.1176471, 0, 1, 1,
0.5321087, 0.2830263, 1.121883, 0.1215686, 0, 1, 1,
0.5381855, 0.2453581, 0.05495409, 0.1294118, 0, 1, 1,
0.5419226, 0.4092156, 0.5235507, 0.1333333, 0, 1, 1,
0.5419709, 0.6885798, 0.1811597, 0.1411765, 0, 1, 1,
0.5433712, 0.9794259, 0.08128115, 0.145098, 0, 1, 1,
0.546944, -1.051638, 2.455812, 0.1529412, 0, 1, 1,
0.5474353, -0.5924993, 1.022632, 0.1568628, 0, 1, 1,
0.5474743, 0.5764821, 1.606451, 0.1647059, 0, 1, 1,
0.5485575, 0.5015062, 0.8081914, 0.1686275, 0, 1, 1,
0.5525289, -0.5769023, 2.530847, 0.1764706, 0, 1, 1,
0.5530368, 1.086107, 0.07447802, 0.1803922, 0, 1, 1,
0.5552723, -0.09361794, 0.9550535, 0.1882353, 0, 1, 1,
0.5556597, -0.7044652, 2.026054, 0.1921569, 0, 1, 1,
0.5557387, 1.92854, -0.2650166, 0.2, 0, 1, 1,
0.5600764, -0.495376, 1.446011, 0.2078431, 0, 1, 1,
0.5631782, 0.886277, -0.4367057, 0.2117647, 0, 1, 1,
0.5681337, -0.5983408, 2.475056, 0.2196078, 0, 1, 1,
0.5712761, 0.09080631, 1.725149, 0.2235294, 0, 1, 1,
0.5717244, -1.340498, 4.017766, 0.2313726, 0, 1, 1,
0.5718812, -2.01558, 2.213296, 0.2352941, 0, 1, 1,
0.578101, 0.4036982, 2.056738, 0.2431373, 0, 1, 1,
0.579092, -1.03389, 2.345109, 0.2470588, 0, 1, 1,
0.5799246, -0.7196525, 1.453182, 0.254902, 0, 1, 1,
0.5818299, -0.7405736, 0.6516813, 0.2588235, 0, 1, 1,
0.5828531, -0.001823943, 0.4540389, 0.2666667, 0, 1, 1,
0.5854181, -0.5928231, 3.745173, 0.2705882, 0, 1, 1,
0.5891979, 0.4983071, -0.1597367, 0.2784314, 0, 1, 1,
0.5893102, 0.9873004, 0.5945166, 0.282353, 0, 1, 1,
0.5978559, -0.3421219, 3.320734, 0.2901961, 0, 1, 1,
0.6005385, -0.03942878, 1.012596, 0.2941177, 0, 1, 1,
0.6054739, -0.3042444, 2.848183, 0.3019608, 0, 1, 1,
0.6081623, -1.152848, 1.840124, 0.3098039, 0, 1, 1,
0.6149741, 0.8307914, 0.3488367, 0.3137255, 0, 1, 1,
0.6152695, 0.7278124, 1.220015, 0.3215686, 0, 1, 1,
0.620185, 1.331028, 1.290064, 0.3254902, 0, 1, 1,
0.6204736, 1.339959, 1.666568, 0.3333333, 0, 1, 1,
0.6244215, -1.893213, 0.8691929, 0.3372549, 0, 1, 1,
0.6246199, -0.4659168, 2.566835, 0.345098, 0, 1, 1,
0.6309676, -0.4932295, 1.901974, 0.3490196, 0, 1, 1,
0.6371264, -0.8680775, -0.2522866, 0.3568628, 0, 1, 1,
0.6385204, 0.8679765, 0.4869291, 0.3607843, 0, 1, 1,
0.6387087, -0.0696686, 0.6323184, 0.3686275, 0, 1, 1,
0.6437389, 1.265747, 1.099996, 0.372549, 0, 1, 1,
0.6455837, 0.7384186, -0.4271267, 0.3803922, 0, 1, 1,
0.6474732, 0.5149269, 0.8735766, 0.3843137, 0, 1, 1,
0.6534541, -0.4278632, 3.502959, 0.3921569, 0, 1, 1,
0.6538258, -0.02580443, 1.783921, 0.3960784, 0, 1, 1,
0.6548363, 0.3937218, -0.7787573, 0.4039216, 0, 1, 1,
0.6550749, -0.3102647, 3.970306, 0.4117647, 0, 1, 1,
0.6555455, -0.9157767, 4.614995, 0.4156863, 0, 1, 1,
0.664291, -0.7875374, 1.379282, 0.4235294, 0, 1, 1,
0.6680085, 0.5473298, 1.287516, 0.427451, 0, 1, 1,
0.6691754, 0.327092, 2.757303, 0.4352941, 0, 1, 1,
0.6712916, 0.4522364, 0.6891961, 0.4392157, 0, 1, 1,
0.6716556, 0.930438, 2.24935, 0.4470588, 0, 1, 1,
0.6766596, 2.597968, 2.365261, 0.4509804, 0, 1, 1,
0.6768587, -0.1416333, 2.617656, 0.4588235, 0, 1, 1,
0.6788348, 0.03262604, 1.344941, 0.4627451, 0, 1, 1,
0.6825173, -0.5601551, 3.353334, 0.4705882, 0, 1, 1,
0.6855434, -1.365198, 2.455057, 0.4745098, 0, 1, 1,
0.6882518, -0.0710866, 3.099144, 0.4823529, 0, 1, 1,
0.6887474, -0.5365471, 2.070428, 0.4862745, 0, 1, 1,
0.6960589, -2.331661, 3.187446, 0.4941176, 0, 1, 1,
0.6986913, -0.1267438, 0.9091539, 0.5019608, 0, 1, 1,
0.7045493, 1.295902, -0.2200358, 0.5058824, 0, 1, 1,
0.704632, 0.8201457, 1.535995, 0.5137255, 0, 1, 1,
0.7075217, -1.220501, 1.995709, 0.5176471, 0, 1, 1,
0.7157488, 0.04361265, 2.644349, 0.5254902, 0, 1, 1,
0.7200674, -1.443655, 1.90246, 0.5294118, 0, 1, 1,
0.7217524, -0.3294627, 0.007397772, 0.5372549, 0, 1, 1,
0.7227179, -1.812274, 3.95587, 0.5411765, 0, 1, 1,
0.723214, -0.7022887, 0.3109767, 0.5490196, 0, 1, 1,
0.7269642, -1.128257, 4.093829, 0.5529412, 0, 1, 1,
0.7293007, -0.18466, 2.314426, 0.5607843, 0, 1, 1,
0.7425357, -0.4823687, 3.214147, 0.5647059, 0, 1, 1,
0.7438535, -0.3686182, 1.558464, 0.572549, 0, 1, 1,
0.7443736, 0.4220082, 2.070692, 0.5764706, 0, 1, 1,
0.7580925, 1.236928, 0.6731794, 0.5843138, 0, 1, 1,
0.7613908, -0.9132976, 4.146269, 0.5882353, 0, 1, 1,
0.761704, 0.4170414, 2.263974, 0.5960785, 0, 1, 1,
0.7645007, -1.258491, 2.770633, 0.6039216, 0, 1, 1,
0.7670243, -0.7758113, 1.076697, 0.6078432, 0, 1, 1,
0.767926, -0.7051571, 2.363531, 0.6156863, 0, 1, 1,
0.7720833, -0.9705529, 1.283098, 0.6196079, 0, 1, 1,
0.7757174, -0.3849583, 2.600111, 0.627451, 0, 1, 1,
0.7796171, -1.054516, 4.33705, 0.6313726, 0, 1, 1,
0.7811487, 1.792411, 0.4167077, 0.6392157, 0, 1, 1,
0.7827225, -0.2623237, 1.10038, 0.6431373, 0, 1, 1,
0.7961799, -1.435971, 2.495037, 0.6509804, 0, 1, 1,
0.7964136, -0.1278166, 1.682603, 0.654902, 0, 1, 1,
0.8017415, 0.4168042, -0.7336835, 0.6627451, 0, 1, 1,
0.8031701, 0.6010736, 0.5196291, 0.6666667, 0, 1, 1,
0.803186, -1.088182, 2.321551, 0.6745098, 0, 1, 1,
0.8039082, 0.2236741, -0.5345877, 0.6784314, 0, 1, 1,
0.805637, 1.198283, 0.5935227, 0.6862745, 0, 1, 1,
0.8057512, 0.08618694, 2.859478, 0.6901961, 0, 1, 1,
0.8077276, 2.038498, 2.307158, 0.6980392, 0, 1, 1,
0.8107502, 0.8065364, 0.8743579, 0.7058824, 0, 1, 1,
0.8110802, 0.06236434, 0.8354307, 0.7098039, 0, 1, 1,
0.8145128, -1.465451, 3.50158, 0.7176471, 0, 1, 1,
0.8164485, 0.7969299, 1.36857, 0.7215686, 0, 1, 1,
0.8237184, -0.1697247, -0.6992013, 0.7294118, 0, 1, 1,
0.8266868, 0.6894434, 0.6672018, 0.7333333, 0, 1, 1,
0.8267906, -1.435709, 2.002246, 0.7411765, 0, 1, 1,
0.8278945, 0.4467592, 1.174572, 0.7450981, 0, 1, 1,
0.8302084, -1.439844, 1.245094, 0.7529412, 0, 1, 1,
0.8344778, 0.5593849, 0.9953539, 0.7568628, 0, 1, 1,
0.8426255, -0.07354525, 2.935917, 0.7647059, 0, 1, 1,
0.8445405, -1.515486, 0.873148, 0.7686275, 0, 1, 1,
0.8476737, -1.41108, 2.904586, 0.7764706, 0, 1, 1,
0.8484961, -0.8727879, -0.04202868, 0.7803922, 0, 1, 1,
0.8489264, -0.8111314, 3.971108, 0.7882353, 0, 1, 1,
0.8499773, 0.06995951, 0.1165196, 0.7921569, 0, 1, 1,
0.8530715, 0.02611151, 0.1032611, 0.8, 0, 1, 1,
0.8530729, -0.2672678, -0.3062046, 0.8078431, 0, 1, 1,
0.8534734, 1.426414, 2.102831, 0.8117647, 0, 1, 1,
0.8555156, 0.5657718, 1.95828, 0.8196079, 0, 1, 1,
0.8559668, 0.9944593, 0.851279, 0.8235294, 0, 1, 1,
0.8565214, 0.3911409, 2.078325, 0.8313726, 0, 1, 1,
0.8589091, 0.9343558, 1.622982, 0.8352941, 0, 1, 1,
0.8604876, 1.704244, 0.6044819, 0.8431373, 0, 1, 1,
0.8690224, 0.02597692, 1.407587, 0.8470588, 0, 1, 1,
0.874229, -0.3572934, 1.606713, 0.854902, 0, 1, 1,
0.8760628, 1.259384, 0.05796919, 0.8588235, 0, 1, 1,
0.8785427, 1.396105, 0.1844874, 0.8666667, 0, 1, 1,
0.8850943, -1.874354, 3.018629, 0.8705882, 0, 1, 1,
0.8957775, -0.8590185, 2.202177, 0.8784314, 0, 1, 1,
0.9043556, 0.4749748, 2.385525, 0.8823529, 0, 1, 1,
0.9049355, 0.6839489, 0.1477697, 0.8901961, 0, 1, 1,
0.9061415, 2.023241, 1.189207, 0.8941177, 0, 1, 1,
0.9115071, -0.6854417, 2.327081, 0.9019608, 0, 1, 1,
0.9124125, -0.03962242, 0.7910858, 0.9098039, 0, 1, 1,
0.9257535, -0.4285579, 1.927435, 0.9137255, 0, 1, 1,
0.9279255, 0.8903148, 1.93828, 0.9215686, 0, 1, 1,
0.9306412, 0.1622917, 0.2761569, 0.9254902, 0, 1, 1,
0.9363921, -0.6854513, 3.937177, 0.9333333, 0, 1, 1,
0.9379276, -0.5985155, 3.404613, 0.9372549, 0, 1, 1,
0.9442751, 0.384154, 2.563003, 0.945098, 0, 1, 1,
0.9445274, -0.1814748, 1.842623, 0.9490196, 0, 1, 1,
0.9445466, 1.226307, -0.1081796, 0.9568627, 0, 1, 1,
0.9490559, -0.365492, 2.801903, 0.9607843, 0, 1, 1,
0.9535131, -1.080642, 2.656008, 0.9686275, 0, 1, 1,
0.9564132, -1.168901, 2.383554, 0.972549, 0, 1, 1,
0.9572666, 0.5746073, 0.3430335, 0.9803922, 0, 1, 1,
0.960178, 0.208413, 1.444661, 0.9843137, 0, 1, 1,
0.9603813, 0.6858461, -0.1879495, 0.9921569, 0, 1, 1,
0.9641942, -0.07382372, 0.7554893, 0.9960784, 0, 1, 1,
0.968704, -0.322154, 1.73902, 1, 0, 0.9960784, 1,
0.972148, -1.136947, 1.380443, 1, 0, 0.9882353, 1,
0.9736282, -1.301926, 3.859923, 1, 0, 0.9843137, 1,
0.9741695, -0.4507798, 1.633525, 1, 0, 0.9764706, 1,
0.9760357, 0.1135376, 2.888162, 1, 0, 0.972549, 1,
0.9770142, 2.427597, 0.4068401, 1, 0, 0.9647059, 1,
0.9799139, 0.01451495, 1.779539, 1, 0, 0.9607843, 1,
0.9837377, 0.2937602, -1.222819, 1, 0, 0.9529412, 1,
0.9853097, 2.154769, 1.402533, 1, 0, 0.9490196, 1,
0.9868942, -0.9847699, 2.305874, 1, 0, 0.9411765, 1,
0.9936593, 0.4441361, 0.6076379, 1, 0, 0.9372549, 1,
0.9944937, -0.2472788, 0.5441026, 1, 0, 0.9294118, 1,
1.000085, 0.2823889, 2.024742, 1, 0, 0.9254902, 1,
1.003668, -1.092858, 2.016589, 1, 0, 0.9176471, 1,
1.005633, -1.573272, 2.713434, 1, 0, 0.9137255, 1,
1.010127, 0.4985119, 0.6931915, 1, 0, 0.9058824, 1,
1.013927, 1.278038, 0.6212144, 1, 0, 0.9019608, 1,
1.015364, 0.09092905, 2.08575, 1, 0, 0.8941177, 1,
1.016183, -0.5013925, 2.572342, 1, 0, 0.8862745, 1,
1.017508, -1.360442, 1.617759, 1, 0, 0.8823529, 1,
1.02059, 1.979909, -1.893946, 1, 0, 0.8745098, 1,
1.021273, 1.244558, 2.319617, 1, 0, 0.8705882, 1,
1.02795, -0.8311632, 3.309885, 1, 0, 0.8627451, 1,
1.028994, -0.3921641, 0.252064, 1, 0, 0.8588235, 1,
1.029959, 0.2266165, 1.388396, 1, 0, 0.8509804, 1,
1.033404, -1.364403, 2.448885, 1, 0, 0.8470588, 1,
1.042428, 0.0935677, -0.5128528, 1, 0, 0.8392157, 1,
1.04279, -0.51523, 2.826462, 1, 0, 0.8352941, 1,
1.050206, 0.6467432, 1.412552, 1, 0, 0.827451, 1,
1.058722, 0.01393376, -0.4011695, 1, 0, 0.8235294, 1,
1.065212, 0.2676806, 0.7863901, 1, 0, 0.8156863, 1,
1.06549, -0.412928, 3.276584, 1, 0, 0.8117647, 1,
1.07044, 0.1073721, -0.587249, 1, 0, 0.8039216, 1,
1.073482, -2.041945, 3.179575, 1, 0, 0.7960784, 1,
1.075095, 1.174399, 1.616796, 1, 0, 0.7921569, 1,
1.075771, -0.609615, 1.34441, 1, 0, 0.7843137, 1,
1.08028, 1.744061, -0.6885043, 1, 0, 0.7803922, 1,
1.080563, 0.1379946, 3.046745, 1, 0, 0.772549, 1,
1.088973, -1.111603, 3.212702, 1, 0, 0.7686275, 1,
1.089508, -1.398296, 1.724757, 1, 0, 0.7607843, 1,
1.10371, -0.889074, 3.063566, 1, 0, 0.7568628, 1,
1.11008, 0.5298343, 1.254519, 1, 0, 0.7490196, 1,
1.110866, -1.134402, 2.691254, 1, 0, 0.7450981, 1,
1.116721, -0.2533186, 0.9981796, 1, 0, 0.7372549, 1,
1.12122, 2.53439, 2.428561, 1, 0, 0.7333333, 1,
1.12658, 0.28662, 3.187313, 1, 0, 0.7254902, 1,
1.128667, 0.8940001, 0.1872905, 1, 0, 0.7215686, 1,
1.139778, 0.05453896, 4.172848, 1, 0, 0.7137255, 1,
1.140563, 0.4648166, 2.778601, 1, 0, 0.7098039, 1,
1.149344, 1.425864, 2.312594, 1, 0, 0.7019608, 1,
1.15687, -0.1434875, 0.7034709, 1, 0, 0.6941177, 1,
1.1592, -1.618928, 4.625778, 1, 0, 0.6901961, 1,
1.161231, -0.794552, 3.522932, 1, 0, 0.682353, 1,
1.165712, -0.04701279, 2.658546, 1, 0, 0.6784314, 1,
1.179453, 1.131474, 1.204232, 1, 0, 0.6705883, 1,
1.18353, -1.863942, 1.956275, 1, 0, 0.6666667, 1,
1.18384, 0.6737484, 0.8291137, 1, 0, 0.6588235, 1,
1.193543, 0.8091819, 0.9542476, 1, 0, 0.654902, 1,
1.196534, -1.003199, 2.209935, 1, 0, 0.6470588, 1,
1.203194, 0.7200977, 2.428978, 1, 0, 0.6431373, 1,
1.206412, -0.6898952, 2.201308, 1, 0, 0.6352941, 1,
1.211673, -1.038337, 2.914525, 1, 0, 0.6313726, 1,
1.227091, -1.080206, 1.896604, 1, 0, 0.6235294, 1,
1.235044, 0.7056421, 2.256001, 1, 0, 0.6196079, 1,
1.243185, -0.5142514, 1.86382, 1, 0, 0.6117647, 1,
1.246565, 0.4181787, 0.1542103, 1, 0, 0.6078432, 1,
1.260534, 0.4529246, 2.28612, 1, 0, 0.6, 1,
1.261778, 0.03470457, 1.444282, 1, 0, 0.5921569, 1,
1.265206, 0.03376441, 1.702047, 1, 0, 0.5882353, 1,
1.266727, -1.753126, 4.171663, 1, 0, 0.5803922, 1,
1.267756, 0.8022494, -0.5446811, 1, 0, 0.5764706, 1,
1.271621, -1.481246, 2.243614, 1, 0, 0.5686275, 1,
1.276145, -0.3959018, 1.428242, 1, 0, 0.5647059, 1,
1.28939, 0.009593548, 1.421928, 1, 0, 0.5568628, 1,
1.290311, 0.276272, 0.2777019, 1, 0, 0.5529412, 1,
1.292607, 1.1554, -1.591873, 1, 0, 0.5450981, 1,
1.294008, 1.161894, 1.395095, 1, 0, 0.5411765, 1,
1.299677, -1.303317, 0.9406121, 1, 0, 0.5333334, 1,
1.300881, 0.5937677, 0.9988359, 1, 0, 0.5294118, 1,
1.301441, 0.6697144, -1.169738, 1, 0, 0.5215687, 1,
1.302899, 0.4398649, 3.151438, 1, 0, 0.5176471, 1,
1.305036, 1.798971, 0.4567572, 1, 0, 0.509804, 1,
1.313145, -0.6238749, 2.408046, 1, 0, 0.5058824, 1,
1.322571, 0.2176515, 1.749556, 1, 0, 0.4980392, 1,
1.354227, -0.5366282, 0.701628, 1, 0, 0.4901961, 1,
1.35717, 0.6334903, 1.837462, 1, 0, 0.4862745, 1,
1.363585, -0.5234724, 2.328705, 1, 0, 0.4784314, 1,
1.375489, -0.7722563, 2.696564, 1, 0, 0.4745098, 1,
1.377614, -0.5488767, 1.604213, 1, 0, 0.4666667, 1,
1.394303, -1.218041, 0.992924, 1, 0, 0.4627451, 1,
1.399735, -0.09140129, 0.6500197, 1, 0, 0.454902, 1,
1.404187, -1.503485, 2.316954, 1, 0, 0.4509804, 1,
1.413956, -0.6466385, 2.621353, 1, 0, 0.4431373, 1,
1.421411, 0.7983764, 1.799682, 1, 0, 0.4392157, 1,
1.422526, -0.2530505, 1.484103, 1, 0, 0.4313726, 1,
1.430791, 0.6664187, 2.266424, 1, 0, 0.427451, 1,
1.434373, 1.851494, -0.4414432, 1, 0, 0.4196078, 1,
1.435215, -2.14207, 1.199174, 1, 0, 0.4156863, 1,
1.449068, -0.1017665, 3.172869, 1, 0, 0.4078431, 1,
1.460232, -0.07104084, 1.409119, 1, 0, 0.4039216, 1,
1.479626, -0.4475851, 1.692601, 1, 0, 0.3960784, 1,
1.482089, -0.57508, 1.273526, 1, 0, 0.3882353, 1,
1.485372, -1.645348, 2.039896, 1, 0, 0.3843137, 1,
1.492183, -1.398417, 2.995792, 1, 0, 0.3764706, 1,
1.525768, -0.7300547, 0.6255381, 1, 0, 0.372549, 1,
1.529139, 0.8135415, 3.034338, 1, 0, 0.3647059, 1,
1.537962, 0.3117071, 1.702557, 1, 0, 0.3607843, 1,
1.53872, 1.007389, 0.6288073, 1, 0, 0.3529412, 1,
1.540998, 0.843882, 0.8550881, 1, 0, 0.3490196, 1,
1.553371, -0.1331085, -0.02642287, 1, 0, 0.3411765, 1,
1.555984, 0.9113116, 1.11665, 1, 0, 0.3372549, 1,
1.577465, 0.0899155, 1.977769, 1, 0, 0.3294118, 1,
1.583194, 0.40924, 2.219646, 1, 0, 0.3254902, 1,
1.590196, -1.656568, 0.9452335, 1, 0, 0.3176471, 1,
1.607601, -0.817389, 3.030974, 1, 0, 0.3137255, 1,
1.614637, 0.7603738, 3.105461, 1, 0, 0.3058824, 1,
1.627471, 0.8601742, 0.631323, 1, 0, 0.2980392, 1,
1.646366, 2.016501, -0.4951003, 1, 0, 0.2941177, 1,
1.650721, 1.937998, 0.6259549, 1, 0, 0.2862745, 1,
1.659532, -1.632899, 1.455764, 1, 0, 0.282353, 1,
1.661177, 0.9513237, 1.682554, 1, 0, 0.2745098, 1,
1.666442, 0.2883556, 0.5980264, 1, 0, 0.2705882, 1,
1.687328, 0.009319851, 2.096424, 1, 0, 0.2627451, 1,
1.692725, 0.7405674, 0.8947666, 1, 0, 0.2588235, 1,
1.697523, -1.716864, 2.707432, 1, 0, 0.2509804, 1,
1.709678, 1.381719, 0.4596566, 1, 0, 0.2470588, 1,
1.711719, 0.1601573, 2.218081, 1, 0, 0.2392157, 1,
1.712568, -2.266901, 2.403606, 1, 0, 0.2352941, 1,
1.714909, 0.6466259, 1.020381, 1, 0, 0.227451, 1,
1.728958, 0.1429649, 3.26912, 1, 0, 0.2235294, 1,
1.744491, -1.164698, 4.651186, 1, 0, 0.2156863, 1,
1.748357, 0.6478324, 1.717646, 1, 0, 0.2117647, 1,
1.752649, -1.095819, 1.372249, 1, 0, 0.2039216, 1,
1.755529, 1.028679, 1.862483, 1, 0, 0.1960784, 1,
1.768885, 0.8934919, 3.325708, 1, 0, 0.1921569, 1,
1.769131, 0.2741874, 1.97091, 1, 0, 0.1843137, 1,
1.794661, 1.457029, 0.7135416, 1, 0, 0.1803922, 1,
1.800598, 0.2903754, 3.531476, 1, 0, 0.172549, 1,
1.835294, 0.2076722, 2.076018, 1, 0, 0.1686275, 1,
1.845966, 1.328373, 0.8222594, 1, 0, 0.1607843, 1,
1.848052, 0.1808888, 0.1998218, 1, 0, 0.1568628, 1,
1.848777, 0.01502944, 1.608364, 1, 0, 0.1490196, 1,
1.858069, 0.5542646, 1.154953, 1, 0, 0.145098, 1,
1.868458, 1.745241, -0.4787613, 1, 0, 0.1372549, 1,
1.903211, -1.111226, 1.896672, 1, 0, 0.1333333, 1,
1.923993, -0.7492505, 2.130246, 1, 0, 0.1254902, 1,
1.932075, 1.249107, 1.160194, 1, 0, 0.1215686, 1,
2.017811, -1.257675, 2.313251, 1, 0, 0.1137255, 1,
2.058191, -0.4427117, 3.5928, 1, 0, 0.1098039, 1,
2.071522, -0.1210943, 3.593934, 1, 0, 0.1019608, 1,
2.082158, -0.6125543, 2.506165, 1, 0, 0.09411765, 1,
2.123853, 0.6384115, 1.204488, 1, 0, 0.09019608, 1,
2.137907, -0.8122292, 1.615453, 1, 0, 0.08235294, 1,
2.16464, 1.24374, 1.723093, 1, 0, 0.07843138, 1,
2.178698, 0.4594245, 0.2431338, 1, 0, 0.07058824, 1,
2.216309, -0.04175181, 1.269819, 1, 0, 0.06666667, 1,
2.25887, 0.7459712, 1.862284, 1, 0, 0.05882353, 1,
2.371979, 1.486219, 1.315953, 1, 0, 0.05490196, 1,
2.459165, 0.221591, 0.554458, 1, 0, 0.04705882, 1,
2.516537, 2.417573, 1.195482, 1, 0, 0.04313726, 1,
2.651872, 0.5429988, 2.204487, 1, 0, 0.03529412, 1,
2.843166, 0.5995374, 1.762221, 1, 0, 0.03137255, 1,
2.944932, -1.949014, 2.963532, 1, 0, 0.02352941, 1,
2.965499, -1.201322, 0.8959881, 1, 0, 0.01960784, 1,
3.038627, 0.8789099, 0.001187944, 1, 0, 0.01176471, 1,
3.162129, 0.5587755, -0.386325, 1, 0, 0.007843138, 1
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
0.2080857, -4.24576, -7.63064, 0, -0.5, 0.5, 0.5,
0.2080857, -4.24576, -7.63064, 1, -0.5, 0.5, 0.5,
0.2080857, -4.24576, -7.63064, 1, 1.5, 0.5, 0.5,
0.2080857, -4.24576, -7.63064, 0, 1.5, 0.5, 0.5
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
-3.747378, 0.03751552, -7.63064, 0, -0.5, 0.5, 0.5,
-3.747378, 0.03751552, -7.63064, 1, -0.5, 0.5, 0.5,
-3.747378, 0.03751552, -7.63064, 1, 1.5, 0.5, 0.5,
-3.747378, 0.03751552, -7.63064, 0, 1.5, 0.5, 0.5
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
-3.747378, -4.24576, -0.1490328, 0, -0.5, 0.5, 0.5,
-3.747378, -4.24576, -0.1490328, 1, -0.5, 0.5, 0.5,
-3.747378, -4.24576, -0.1490328, 1, 1.5, 0.5, 0.5,
-3.747378, -4.24576, -0.1490328, 0, 1.5, 0.5, 0.5
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
-2, -3.257312, -5.904115,
3, -3.257312, -5.904115,
-2, -3.257312, -5.904115,
-2, -3.422053, -6.191869,
-1, -3.257312, -5.904115,
-1, -3.422053, -6.191869,
0, -3.257312, -5.904115,
0, -3.422053, -6.191869,
1, -3.257312, -5.904115,
1, -3.422053, -6.191869,
2, -3.257312, -5.904115,
2, -3.422053, -6.191869,
3, -3.257312, -5.904115,
3, -3.422053, -6.191869
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
-2, -3.751536, -6.767377, 0, -0.5, 0.5, 0.5,
-2, -3.751536, -6.767377, 1, -0.5, 0.5, 0.5,
-2, -3.751536, -6.767377, 1, 1.5, 0.5, 0.5,
-2, -3.751536, -6.767377, 0, 1.5, 0.5, 0.5,
-1, -3.751536, -6.767377, 0, -0.5, 0.5, 0.5,
-1, -3.751536, -6.767377, 1, -0.5, 0.5, 0.5,
-1, -3.751536, -6.767377, 1, 1.5, 0.5, 0.5,
-1, -3.751536, -6.767377, 0, 1.5, 0.5, 0.5,
0, -3.751536, -6.767377, 0, -0.5, 0.5, 0.5,
0, -3.751536, -6.767377, 1, -0.5, 0.5, 0.5,
0, -3.751536, -6.767377, 1, 1.5, 0.5, 0.5,
0, -3.751536, -6.767377, 0, 1.5, 0.5, 0.5,
1, -3.751536, -6.767377, 0, -0.5, 0.5, 0.5,
1, -3.751536, -6.767377, 1, -0.5, 0.5, 0.5,
1, -3.751536, -6.767377, 1, 1.5, 0.5, 0.5,
1, -3.751536, -6.767377, 0, 1.5, 0.5, 0.5,
2, -3.751536, -6.767377, 0, -0.5, 0.5, 0.5,
2, -3.751536, -6.767377, 1, -0.5, 0.5, 0.5,
2, -3.751536, -6.767377, 1, 1.5, 0.5, 0.5,
2, -3.751536, -6.767377, 0, 1.5, 0.5, 0.5,
3, -3.751536, -6.767377, 0, -0.5, 0.5, 0.5,
3, -3.751536, -6.767377, 1, -0.5, 0.5, 0.5,
3, -3.751536, -6.767377, 1, 1.5, 0.5, 0.5,
3, -3.751536, -6.767377, 0, 1.5, 0.5, 0.5
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
-2.834579, -3, -5.904115,
-2.834579, 3, -5.904115,
-2.834579, -3, -5.904115,
-2.986712, -3, -6.191869,
-2.834579, -2, -5.904115,
-2.986712, -2, -6.191869,
-2.834579, -1, -5.904115,
-2.986712, -1, -6.191869,
-2.834579, 0, -5.904115,
-2.986712, 0, -6.191869,
-2.834579, 1, -5.904115,
-2.986712, 1, -6.191869,
-2.834579, 2, -5.904115,
-2.986712, 2, -6.191869,
-2.834579, 3, -5.904115,
-2.986712, 3, -6.191869
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
-3.290978, -3, -6.767377, 0, -0.5, 0.5, 0.5,
-3.290978, -3, -6.767377, 1, -0.5, 0.5, 0.5,
-3.290978, -3, -6.767377, 1, 1.5, 0.5, 0.5,
-3.290978, -3, -6.767377, 0, 1.5, 0.5, 0.5,
-3.290978, -2, -6.767377, 0, -0.5, 0.5, 0.5,
-3.290978, -2, -6.767377, 1, -0.5, 0.5, 0.5,
-3.290978, -2, -6.767377, 1, 1.5, 0.5, 0.5,
-3.290978, -2, -6.767377, 0, 1.5, 0.5, 0.5,
-3.290978, -1, -6.767377, 0, -0.5, 0.5, 0.5,
-3.290978, -1, -6.767377, 1, -0.5, 0.5, 0.5,
-3.290978, -1, -6.767377, 1, 1.5, 0.5, 0.5,
-3.290978, -1, -6.767377, 0, 1.5, 0.5, 0.5,
-3.290978, 0, -6.767377, 0, -0.5, 0.5, 0.5,
-3.290978, 0, -6.767377, 1, -0.5, 0.5, 0.5,
-3.290978, 0, -6.767377, 1, 1.5, 0.5, 0.5,
-3.290978, 0, -6.767377, 0, 1.5, 0.5, 0.5,
-3.290978, 1, -6.767377, 0, -0.5, 0.5, 0.5,
-3.290978, 1, -6.767377, 1, -0.5, 0.5, 0.5,
-3.290978, 1, -6.767377, 1, 1.5, 0.5, 0.5,
-3.290978, 1, -6.767377, 0, 1.5, 0.5, 0.5,
-3.290978, 2, -6.767377, 0, -0.5, 0.5, 0.5,
-3.290978, 2, -6.767377, 1, -0.5, 0.5, 0.5,
-3.290978, 2, -6.767377, 1, 1.5, 0.5, 0.5,
-3.290978, 2, -6.767377, 0, 1.5, 0.5, 0.5,
-3.290978, 3, -6.767377, 0, -0.5, 0.5, 0.5,
-3.290978, 3, -6.767377, 1, -0.5, 0.5, 0.5,
-3.290978, 3, -6.767377, 1, 1.5, 0.5, 0.5,
-3.290978, 3, -6.767377, 0, 1.5, 0.5, 0.5
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
-2.834579, -3.257312, -4,
-2.834579, -3.257312, 4,
-2.834579, -3.257312, -4,
-2.986712, -3.422053, -4,
-2.834579, -3.257312, -2,
-2.986712, -3.422053, -2,
-2.834579, -3.257312, 0,
-2.986712, -3.422053, 0,
-2.834579, -3.257312, 2,
-2.986712, -3.422053, 2,
-2.834579, -3.257312, 4,
-2.986712, -3.422053, 4
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
-3.290978, -3.751536, -4, 0, -0.5, 0.5, 0.5,
-3.290978, -3.751536, -4, 1, -0.5, 0.5, 0.5,
-3.290978, -3.751536, -4, 1, 1.5, 0.5, 0.5,
-3.290978, -3.751536, -4, 0, 1.5, 0.5, 0.5,
-3.290978, -3.751536, -2, 0, -0.5, 0.5, 0.5,
-3.290978, -3.751536, -2, 1, -0.5, 0.5, 0.5,
-3.290978, -3.751536, -2, 1, 1.5, 0.5, 0.5,
-3.290978, -3.751536, -2, 0, 1.5, 0.5, 0.5,
-3.290978, -3.751536, 0, 0, -0.5, 0.5, 0.5,
-3.290978, -3.751536, 0, 1, -0.5, 0.5, 0.5,
-3.290978, -3.751536, 0, 1, 1.5, 0.5, 0.5,
-3.290978, -3.751536, 0, 0, 1.5, 0.5, 0.5,
-3.290978, -3.751536, 2, 0, -0.5, 0.5, 0.5,
-3.290978, -3.751536, 2, 1, -0.5, 0.5, 0.5,
-3.290978, -3.751536, 2, 1, 1.5, 0.5, 0.5,
-3.290978, -3.751536, 2, 0, 1.5, 0.5, 0.5,
-3.290978, -3.751536, 4, 0, -0.5, 0.5, 0.5,
-3.290978, -3.751536, 4, 1, -0.5, 0.5, 0.5,
-3.290978, -3.751536, 4, 1, 1.5, 0.5, 0.5,
-3.290978, -3.751536, 4, 0, 1.5, 0.5, 0.5
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
-2.834579, -3.257312, -5.904115,
-2.834579, 3.332343, -5.904115,
-2.834579, -3.257312, 5.606049,
-2.834579, 3.332343, 5.606049,
-2.834579, -3.257312, -5.904115,
-2.834579, -3.257312, 5.606049,
-2.834579, 3.332343, -5.904115,
-2.834579, 3.332343, 5.606049,
-2.834579, -3.257312, -5.904115,
3.25075, -3.257312, -5.904115,
-2.834579, -3.257312, 5.606049,
3.25075, -3.257312, 5.606049,
-2.834579, 3.332343, -5.904115,
3.25075, 3.332343, -5.904115,
-2.834579, 3.332343, 5.606049,
3.25075, 3.332343, 5.606049,
3.25075, -3.257312, -5.904115,
3.25075, 3.332343, -5.904115,
3.25075, -3.257312, 5.606049,
3.25075, 3.332343, 5.606049,
3.25075, -3.257312, -5.904115,
3.25075, -3.257312, 5.606049,
3.25075, 3.332343, -5.904115,
3.25075, 3.332343, 5.606049
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
var radius = 7.792068;
var distance = 34.66779;
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
mvMatrix.translate( -0.2080857, -0.03751552, 0.1490328 );
mvMatrix.scale( 1.384467, 1.278509, 0.7319562 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.66779);
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
carbamate<-read.table("carbamate.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-carbamate$V2
```

```
## Error in eval(expr, envir, enclos): object 'carbamate' not found
```

```r
y<-carbamate$V3
```

```
## Error in eval(expr, envir, enclos): object 'carbamate' not found
```

```r
z<-carbamate$V4
```

```
## Error in eval(expr, envir, enclos): object 'carbamate' not found
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
-2.745957, -1.011923, -1.253669, 0, 0, 1, 1, 1,
-2.576744, 1.073802, -0.03028463, 1, 0, 0, 1, 1,
-2.496956, 1.093897, -1.252467, 1, 0, 0, 1, 1,
-2.457676, 1.016006, -1.412967, 1, 0, 0, 1, 1,
-2.333199, 0.07894149, -2.411674, 1, 0, 0, 1, 1,
-2.3304, -1.019333, -2.631466, 1, 0, 0, 1, 1,
-2.326083, -0.6573154, -2.936022, 0, 0, 0, 1, 1,
-2.219268, -0.5026628, -2.790696, 0, 0, 0, 1, 1,
-2.164139, 0.674121, -3.190598, 0, 0, 0, 1, 1,
-2.161342, -1.342664, -2.784096, 0, 0, 0, 1, 1,
-2.15995, 2.098182, -1.56943, 0, 0, 0, 1, 1,
-2.151464, 1.256841, -1.848983, 0, 0, 0, 1, 1,
-2.097017, -0.09060285, -2.513729, 0, 0, 0, 1, 1,
-1.996617, 0.6157211, -2.273269, 1, 1, 1, 1, 1,
-1.969036, 1.37711, -0.03683628, 1, 1, 1, 1, 1,
-1.958673, -1.76169, -2.548628, 1, 1, 1, 1, 1,
-1.943668, 0.4612594, -0.1019642, 1, 1, 1, 1, 1,
-1.939138, 0.399598, 0.7386831, 1, 1, 1, 1, 1,
-1.912856, -0.9070354, -4.208646, 1, 1, 1, 1, 1,
-1.90736, -1.146885, -2.463094, 1, 1, 1, 1, 1,
-1.900225, 0.2929006, -1.366775, 1, 1, 1, 1, 1,
-1.896009, -0.1545822, -2.081426, 1, 1, 1, 1, 1,
-1.895645, -0.2188361, -1.91944, 1, 1, 1, 1, 1,
-1.893737, 1.646187, -2.835973, 1, 1, 1, 1, 1,
-1.887869, -0.1833026, -2.233716, 1, 1, 1, 1, 1,
-1.88389, -1.205451, -1.292853, 1, 1, 1, 1, 1,
-1.883335, -1.063604, -2.586756, 1, 1, 1, 1, 1,
-1.835131, 1.067346, -0.4456123, 1, 1, 1, 1, 1,
-1.820145, 1.509266, -0.8512017, 0, 0, 1, 1, 1,
-1.811106, 1.330832, -0.9761387, 1, 0, 0, 1, 1,
-1.793399, -0.215764, -1.70467, 1, 0, 0, 1, 1,
-1.788047, -1.022668, -3.835518, 1, 0, 0, 1, 1,
-1.781509, -0.2824553, -2.792938, 1, 0, 0, 1, 1,
-1.759532, 1.240501, -2.843448, 1, 0, 0, 1, 1,
-1.747301, -0.3130307, -3.773861, 0, 0, 0, 1, 1,
-1.746976, -0.2589942, -1.493324, 0, 0, 0, 1, 1,
-1.721777, -0.6807846, -1.640719, 0, 0, 0, 1, 1,
-1.711761, 2.400697, -1.26421, 0, 0, 0, 1, 1,
-1.689949, -0.06578385, -2.308207, 0, 0, 0, 1, 1,
-1.6682, -0.0327627, -2.387655, 0, 0, 0, 1, 1,
-1.66364, -0.06926449, -0.993351, 0, 0, 0, 1, 1,
-1.650045, 1.612213, -2.575718, 1, 1, 1, 1, 1,
-1.646464, -1.07646, -1.943968, 1, 1, 1, 1, 1,
-1.643771, 2.087228, -0.3389423, 1, 1, 1, 1, 1,
-1.638286, -0.232329, -1.200561, 1, 1, 1, 1, 1,
-1.625758, -0.009331377, -1.394153, 1, 1, 1, 1, 1,
-1.615112, 0.06588368, -2.960923, 1, 1, 1, 1, 1,
-1.58067, -0.4198555, -2.797506, 1, 1, 1, 1, 1,
-1.565701, -1.140945, -1.656833, 1, 1, 1, 1, 1,
-1.56351, 0.3768667, -1.219813, 1, 1, 1, 1, 1,
-1.562453, 0.3369125, -2.921149, 1, 1, 1, 1, 1,
-1.549284, -0.8510863, -1.382323, 1, 1, 1, 1, 1,
-1.540987, 0.2538446, -1.204541, 1, 1, 1, 1, 1,
-1.532871, 0.7776687, -1.074291, 1, 1, 1, 1, 1,
-1.522162, -1.201748, -2.390146, 1, 1, 1, 1, 1,
-1.516332, 0.6488056, -2.583389, 1, 1, 1, 1, 1,
-1.510711, -0.5080345, -0.7314532, 0, 0, 1, 1, 1,
-1.508236, 0.2343137, -0.4269169, 1, 0, 0, 1, 1,
-1.507996, 0.2007361, -2.342431, 1, 0, 0, 1, 1,
-1.507436, -0.4658154, -0.8016608, 1, 0, 0, 1, 1,
-1.502399, -0.735357, -2.243743, 1, 0, 0, 1, 1,
-1.501964, -1.172966, -2.630809, 1, 0, 0, 1, 1,
-1.488456, 0.3317482, -1.142945, 0, 0, 0, 1, 1,
-1.484816, 0.2765563, -1.405769, 0, 0, 0, 1, 1,
-1.471364, -0.3999629, -1.885464, 0, 0, 0, 1, 1,
-1.460196, -0.265947, -2.460221, 0, 0, 0, 1, 1,
-1.459353, 2.344995, -0.783627, 0, 0, 0, 1, 1,
-1.459167, 0.3207102, -0.6727957, 0, 0, 0, 1, 1,
-1.455986, 0.2169448, -0.3353776, 0, 0, 0, 1, 1,
-1.445631, 1.277032, 0.5772299, 1, 1, 1, 1, 1,
-1.439136, 1.343079, -0.4908836, 1, 1, 1, 1, 1,
-1.438208, 1.390723, -1.053778, 1, 1, 1, 1, 1,
-1.433105, 1.094886, 0.4257628, 1, 1, 1, 1, 1,
-1.432556, 2.005731, -1.663219, 1, 1, 1, 1, 1,
-1.430312, 0.8779688, -1.232087, 1, 1, 1, 1, 1,
-1.428869, -1.112434, -2.363575, 1, 1, 1, 1, 1,
-1.422523, -0.8556263, -2.909859, 1, 1, 1, 1, 1,
-1.420959, -1.824783, -2.688956, 1, 1, 1, 1, 1,
-1.411114, -0.106445, -4.004881, 1, 1, 1, 1, 1,
-1.41019, 0.006711813, -0.942633, 1, 1, 1, 1, 1,
-1.396061, 0.3166434, -1.704182, 1, 1, 1, 1, 1,
-1.368826, -1.047409, -3.185117, 1, 1, 1, 1, 1,
-1.36525, 0.6074309, -0.4312985, 1, 1, 1, 1, 1,
-1.343289, 1.604661, -0.9420727, 1, 1, 1, 1, 1,
-1.321373, -1.625521, -3.397151, 0, 0, 1, 1, 1,
-1.319769, -0.378251, -3.199381, 1, 0, 0, 1, 1,
-1.318459, 0.768913, -1.806773, 1, 0, 0, 1, 1,
-1.316056, -2.455937, -4.737833, 1, 0, 0, 1, 1,
-1.309168, -0.7799041, -2.136165, 1, 0, 0, 1, 1,
-1.299378, 1.409797, -0.3968084, 1, 0, 0, 1, 1,
-1.294895, -1.250931, -3.44546, 0, 0, 0, 1, 1,
-1.287911, -0.9926378, -2.143973, 0, 0, 0, 1, 1,
-1.286065, 0.6290967, -1.184263, 0, 0, 0, 1, 1,
-1.283724, 0.5168533, -1.973799, 0, 0, 0, 1, 1,
-1.270837, -1.027527, -3.980867, 0, 0, 0, 1, 1,
-1.260731, 0.4042154, -1.222341, 0, 0, 0, 1, 1,
-1.259028, -0.2115775, -3.423141, 0, 0, 0, 1, 1,
-1.255475, -0.1302134, -2.098645, 1, 1, 1, 1, 1,
-1.254991, -0.4680107, -0.1003936, 1, 1, 1, 1, 1,
-1.252568, -0.465418, -1.539389, 1, 1, 1, 1, 1,
-1.247622, 0.8402524, -1.189241, 1, 1, 1, 1, 1,
-1.242107, 0.1160385, -1.047732, 1, 1, 1, 1, 1,
-1.231907, 0.2976939, -0.8823088, 1, 1, 1, 1, 1,
-1.22797, -1.483219, -1.154766, 1, 1, 1, 1, 1,
-1.227828, -0.08892161, -1.866124, 1, 1, 1, 1, 1,
-1.226183, 1.210594, -0.9199122, 1, 1, 1, 1, 1,
-1.224665, 1.512385, -0.3017809, 1, 1, 1, 1, 1,
-1.21412, 0.01086976, -0.7733961, 1, 1, 1, 1, 1,
-1.208963, 1.131902, -0.5294293, 1, 1, 1, 1, 1,
-1.207157, -1.420248, -2.061064, 1, 1, 1, 1, 1,
-1.205722, 0.3341657, -1.591063, 1, 1, 1, 1, 1,
-1.205421, -1.505409, -3.51362, 1, 1, 1, 1, 1,
-1.203868, 0.5638735, -1.328177, 0, 0, 1, 1, 1,
-1.202073, -1.076701, -3.231921, 1, 0, 0, 1, 1,
-1.200814, -1.606411, -2.119775, 1, 0, 0, 1, 1,
-1.19455, 1.380196, -1.609748, 1, 0, 0, 1, 1,
-1.18529, 0.3366313, 0.4334202, 1, 0, 0, 1, 1,
-1.182369, 0.3293833, -3.028843, 1, 0, 0, 1, 1,
-1.176689, 0.09707284, -1.575302, 0, 0, 0, 1, 1,
-1.163002, -1.195877, -3.524991, 0, 0, 0, 1, 1,
-1.157757, -0.1252707, -1.722292, 0, 0, 0, 1, 1,
-1.156919, 0.4466522, -0.8679103, 0, 0, 0, 1, 1,
-1.156798, -1.518054, -0.4449528, 0, 0, 0, 1, 1,
-1.15499, 0.5888786, -2.594828, 0, 0, 0, 1, 1,
-1.154295, 0.5184245, -0.8063161, 0, 0, 0, 1, 1,
-1.147545, 1.791756, -0.473652, 1, 1, 1, 1, 1,
-1.13722, 0.8905057, -1.759888, 1, 1, 1, 1, 1,
-1.116999, 1.19668, 0.5067809, 1, 1, 1, 1, 1,
-1.115003, 0.517733, -1.041079, 1, 1, 1, 1, 1,
-1.095519, 0.1685996, -0.2874881, 1, 1, 1, 1, 1,
-1.094602, -0.4598516, -2.301603, 1, 1, 1, 1, 1,
-1.094284, -0.2738925, -2.006853, 1, 1, 1, 1, 1,
-1.093176, -0.0008430333, -0.6729195, 1, 1, 1, 1, 1,
-1.092647, -0.215671, -2.854702, 1, 1, 1, 1, 1,
-1.090768, 0.6381808, -1.966731, 1, 1, 1, 1, 1,
-1.084897, 0.5264695, -2.215194, 1, 1, 1, 1, 1,
-1.074574, 0.1838246, -0.6580308, 1, 1, 1, 1, 1,
-1.065622, -1.030842, -2.505683, 1, 1, 1, 1, 1,
-1.065317, -0.02864753, -0.5547316, 1, 1, 1, 1, 1,
-1.061921, 0.3966861, -0.565595, 1, 1, 1, 1, 1,
-1.052907, 0.6362498, -0.7176546, 0, 0, 1, 1, 1,
-1.049617, -0.3064157, -1.70962, 1, 0, 0, 1, 1,
-1.040073, -0.1796521, -0.8818511, 1, 0, 0, 1, 1,
-1.038178, 0.3397687, -1.004276, 1, 0, 0, 1, 1,
-1.037793, -0.2469618, -3.305283, 1, 0, 0, 1, 1,
-1.037032, -0.8353683, -3.54023, 1, 0, 0, 1, 1,
-1.036724, 2.129941, 0.5877, 0, 0, 0, 1, 1,
-1.022654, 1.043828, -2.218009, 0, 0, 0, 1, 1,
-1.017456, -0.5501931, -2.548562, 0, 0, 0, 1, 1,
-0.996055, 1.652556, -2.800051, 0, 0, 0, 1, 1,
-0.9909739, 0.4387004, -3.75895, 0, 0, 0, 1, 1,
-0.9908439, 0.05680243, -3.483038, 0, 0, 0, 1, 1,
-0.9890432, -1.56411, -1.513427, 0, 0, 0, 1, 1,
-0.9852092, -1.28777, -2.466022, 1, 1, 1, 1, 1,
-0.9834821, 0.4467382, -1.518794, 1, 1, 1, 1, 1,
-0.969013, -1.233859, -2.698017, 1, 1, 1, 1, 1,
-0.9686548, -0.04784792, -1.03799, 1, 1, 1, 1, 1,
-0.9651828, 0.6271064, 0.7115936, 1, 1, 1, 1, 1,
-0.9611841, -0.5231591, -1.779744, 1, 1, 1, 1, 1,
-0.9565927, 0.1231194, -1.931322, 1, 1, 1, 1, 1,
-0.95345, 0.4228236, -0.8490103, 1, 1, 1, 1, 1,
-0.9447471, -0.08915804, -2.024765, 1, 1, 1, 1, 1,
-0.9424518, 2.295043, -0.1784423, 1, 1, 1, 1, 1,
-0.9367887, -0.4916019, -3.933177, 1, 1, 1, 1, 1,
-0.922315, -0.6533545, -1.858541, 1, 1, 1, 1, 1,
-0.9221196, -0.6787794, -2.838187, 1, 1, 1, 1, 1,
-0.9200122, -0.07579274, -1.461042, 1, 1, 1, 1, 1,
-0.9158492, 0.219816, -0.9835861, 1, 1, 1, 1, 1,
-0.9142318, -0.8207812, -4.686362, 0, 0, 1, 1, 1,
-0.9117435, 0.5054989, -1.246472, 1, 0, 0, 1, 1,
-0.9113267, -0.7738784, -3.300942, 1, 0, 0, 1, 1,
-0.9091682, -0.7544995, -0.6946874, 1, 0, 0, 1, 1,
-0.9078972, -0.9492558, -2.593415, 1, 0, 0, 1, 1,
-0.8977871, 0.9853354, -0.8924798, 1, 0, 0, 1, 1,
-0.8922229, -0.5880103, -3.257504, 0, 0, 0, 1, 1,
-0.8862479, -0.9008738, -2.881222, 0, 0, 0, 1, 1,
-0.8847482, 0.2815883, 0.2818226, 0, 0, 0, 1, 1,
-0.8815747, 0.5926356, -0.5950155, 0, 0, 0, 1, 1,
-0.874985, 0.02694024, -1.048387, 0, 0, 0, 1, 1,
-0.872919, 3.236377, 1.306028, 0, 0, 0, 1, 1,
-0.8714295, 1.872893, 1.64708, 0, 0, 0, 1, 1,
-0.8691025, 0.3064983, -1.428984, 1, 1, 1, 1, 1,
-0.8678716, 0.8925747, 0.4961891, 1, 1, 1, 1, 1,
-0.8676171, 1.471734, -2.50323, 1, 1, 1, 1, 1,
-0.8641035, -0.424379, -2.205345, 1, 1, 1, 1, 1,
-0.8619018, -1.452338, -2.540955, 1, 1, 1, 1, 1,
-0.8604296, 0.1281223, -1.157311, 1, 1, 1, 1, 1,
-0.8581521, 0.3781953, -1.732071, 1, 1, 1, 1, 1,
-0.8581129, 1.016016, -1.552879, 1, 1, 1, 1, 1,
-0.8550028, -1.307603, -1.973046, 1, 1, 1, 1, 1,
-0.8500827, 0.1286308, -0.320021, 1, 1, 1, 1, 1,
-0.8493216, 1.883202, -0.953578, 1, 1, 1, 1, 1,
-0.8452539, 0.6557024, -0.7377305, 1, 1, 1, 1, 1,
-0.8433292, -0.3126469, -3.7918, 1, 1, 1, 1, 1,
-0.8372806, -0.1038692, -0.5533804, 1, 1, 1, 1, 1,
-0.8369361, 0.01990799, -2.091581, 1, 1, 1, 1, 1,
-0.8275455, -0.8525845, -1.643807, 0, 0, 1, 1, 1,
-0.8185173, -0.233093, -3.240724, 1, 0, 0, 1, 1,
-0.8165025, 1.078182, -1.149389, 1, 0, 0, 1, 1,
-0.8141554, 0.953759, 0.9875646, 1, 0, 0, 1, 1,
-0.8021842, -0.2471163, -2.008753, 1, 0, 0, 1, 1,
-0.7978213, -0.9044822, -1.476936, 1, 0, 0, 1, 1,
-0.7963319, 0.8181458, -1.654176, 0, 0, 0, 1, 1,
-0.7902049, -1.739699, -0.3462496, 0, 0, 0, 1, 1,
-0.7868853, 0.683902, 0.08855602, 0, 0, 0, 1, 1,
-0.7836539, -0.1145249, -2.255908, 0, 0, 0, 1, 1,
-0.7820661, 1.174764, -0.5029883, 0, 0, 0, 1, 1,
-0.7816118, -0.9349167, -2.327502, 0, 0, 0, 1, 1,
-0.7803112, 2.209566, -0.3524925, 0, 0, 0, 1, 1,
-0.774294, -0.7527331, -0.6901655, 1, 1, 1, 1, 1,
-0.7737017, 0.1748729, -2.638643, 1, 1, 1, 1, 1,
-0.7534848, -0.219527, -2.72716, 1, 1, 1, 1, 1,
-0.7503045, 0.4544441, 0.9829026, 1, 1, 1, 1, 1,
-0.7479137, -0.8602275, -2.677538, 1, 1, 1, 1, 1,
-0.744417, -0.3776033, -1.549116, 1, 1, 1, 1, 1,
-0.7424038, -0.02751007, -2.007214, 1, 1, 1, 1, 1,
-0.7395246, -1.873882, -3.706715, 1, 1, 1, 1, 1,
-0.735541, -1.906447, -1.387203, 1, 1, 1, 1, 1,
-0.7284807, 1.205595, -1.25902, 1, 1, 1, 1, 1,
-0.726833, -0.08571929, -1.294648, 1, 1, 1, 1, 1,
-0.7268068, -1.468791, -1.651408, 1, 1, 1, 1, 1,
-0.7242546, -0.2151658, -2.617223, 1, 1, 1, 1, 1,
-0.7145549, 0.9487422, -0.936102, 1, 1, 1, 1, 1,
-0.7024288, -1.556664, -2.440059, 1, 1, 1, 1, 1,
-0.6963531, 1.52548, 2.033091, 0, 0, 1, 1, 1,
-0.6927516, -0.1307801, -2.548789, 1, 0, 0, 1, 1,
-0.6916369, 0.3395642, 2.117814, 1, 0, 0, 1, 1,
-0.6913291, 0.08927125, -1.03824, 1, 0, 0, 1, 1,
-0.6861079, -0.3431414, -2.616166, 1, 0, 0, 1, 1,
-0.6730132, -0.6806324, -3.407547, 1, 0, 0, 1, 1,
-0.6699929, 0.2720731, -0.9145287, 0, 0, 0, 1, 1,
-0.6664922, 0.457912, -1.398764, 0, 0, 0, 1, 1,
-0.6578881, 0.5286584, -2.635655, 0, 0, 0, 1, 1,
-0.6560172, -0.9372195, -4.051823, 0, 0, 0, 1, 1,
-0.6535316, 0.705357, 0.1012924, 0, 0, 0, 1, 1,
-0.6484893, 0.2915149, -0.8447898, 0, 0, 0, 1, 1,
-0.6445515, -0.2742314, -1.699499, 0, 0, 0, 1, 1,
-0.6439382, -0.691924, 0.04914385, 1, 1, 1, 1, 1,
-0.6365325, 0.7874832, -2.387085, 1, 1, 1, 1, 1,
-0.6356814, 0.7264098, -0.4563464, 1, 1, 1, 1, 1,
-0.6306652, 1.094993, -0.1457897, 1, 1, 1, 1, 1,
-0.6293168, 0.596088, 0.5144106, 1, 1, 1, 1, 1,
-0.6273892, -0.1114528, -1.457319, 1, 1, 1, 1, 1,
-0.6233614, -0.9879842, -2.955605, 1, 1, 1, 1, 1,
-0.6130469, 0.795831, -0.3760962, 1, 1, 1, 1, 1,
-0.5977973, 0.8898207, -1.710538, 1, 1, 1, 1, 1,
-0.5974667, -0.08513888, -1.626356, 1, 1, 1, 1, 1,
-0.595919, -1.760903, -3.994965, 1, 1, 1, 1, 1,
-0.5930789, 0.07974706, -0.6998342, 1, 1, 1, 1, 1,
-0.5874634, -0.6271337, -1.975201, 1, 1, 1, 1, 1,
-0.5856317, 1.336253, 0.3525451, 1, 1, 1, 1, 1,
-0.5855029, -0.2202646, -1.209434, 1, 1, 1, 1, 1,
-0.5845657, -1.778764, -1.691671, 0, 0, 1, 1, 1,
-0.5842692, -0.471751, -3.927376, 1, 0, 0, 1, 1,
-0.5784933, -0.1363779, -1.062339, 1, 0, 0, 1, 1,
-0.576349, 0.1794352, -1.709397, 1, 0, 0, 1, 1,
-0.5759395, -1.049464, -1.977637, 1, 0, 0, 1, 1,
-0.5719392, 0.9633282, 0.0550847, 1, 0, 0, 1, 1,
-0.5683475, 0.7612638, -0.7996248, 0, 0, 0, 1, 1,
-0.563783, -0.6241327, -1.884384, 0, 0, 0, 1, 1,
-0.5631955, -0.7748056, -3.265199, 0, 0, 0, 1, 1,
-0.5620886, -0.5775287, -1.823839, 0, 0, 0, 1, 1,
-0.5593024, -0.1673634, -0.8107216, 0, 0, 0, 1, 1,
-0.5579334, -0.3922521, -3.643836, 0, 0, 0, 1, 1,
-0.5506809, -0.5151209, -2.30476, 0, 0, 0, 1, 1,
-0.5503101, -0.3747166, -0.1788464, 1, 1, 1, 1, 1,
-0.5486141, 1.10145, -2.499358, 1, 1, 1, 1, 1,
-0.5481715, -0.2728958, -1.685178, 1, 1, 1, 1, 1,
-0.545965, -0.7882999, -2.405893, 1, 1, 1, 1, 1,
-0.5409194, 0.1563283, -1.937671, 1, 1, 1, 1, 1,
-0.5405548, 0.3073628, -1.909941, 1, 1, 1, 1, 1,
-0.5396757, -0.2509178, -2.223952, 1, 1, 1, 1, 1,
-0.5363592, -0.6484758, -3.577996, 1, 1, 1, 1, 1,
-0.5334563, -0.6369522, 0.01739158, 1, 1, 1, 1, 1,
-0.5309004, -0.604786, -2.22856, 1, 1, 1, 1, 1,
-0.5305246, -1.812769, -1.984889, 1, 1, 1, 1, 1,
-0.5262762, -0.2465334, -2.250626, 1, 1, 1, 1, 1,
-0.5244598, -1.072613, -2.295532, 1, 1, 1, 1, 1,
-0.5241998, -1.134022, -4.112643, 1, 1, 1, 1, 1,
-0.5239048, -0.7446871, -2.643435, 1, 1, 1, 1, 1,
-0.5236182, -1.009176, -2.93452, 0, 0, 1, 1, 1,
-0.5189993, 0.4738915, -0.9604015, 1, 0, 0, 1, 1,
-0.5183687, -0.4614579, -0.646243, 1, 0, 0, 1, 1,
-0.5171314, 0.113075, -1.122737, 1, 0, 0, 1, 1,
-0.516798, 1.249475, -2.512052, 1, 0, 0, 1, 1,
-0.5113322, -0.09412874, -2.695932, 1, 0, 0, 1, 1,
-0.5016599, 0.8618668, -0.9658749, 0, 0, 0, 1, 1,
-0.5004013, -1.082479, -3.208045, 0, 0, 0, 1, 1,
-0.4912947, 0.4560956, -1.59606, 0, 0, 0, 1, 1,
-0.4900907, -1.146072, -1.81214, 0, 0, 0, 1, 1,
-0.4868576, 1.7514, 0.886312, 0, 0, 0, 1, 1,
-0.4817023, 0.1586339, -0.127737, 0, 0, 0, 1, 1,
-0.4769061, 1.219458, -0.4251373, 0, 0, 0, 1, 1,
-0.4656083, 1.852474, -0.01607078, 1, 1, 1, 1, 1,
-0.4599593, -0.3524816, -2.990654, 1, 1, 1, 1, 1,
-0.4588543, -1.050844, -2.975856, 1, 1, 1, 1, 1,
-0.4538956, 2.119947, 0.3191203, 1, 1, 1, 1, 1,
-0.4486226, 0.2192442, -0.3225757, 1, 1, 1, 1, 1,
-0.4479434, -0.6596644, -2.619104, 1, 1, 1, 1, 1,
-0.4463271, 1.433384, -1.805769, 1, 1, 1, 1, 1,
-0.4381589, 0.07086118, -1.907705, 1, 1, 1, 1, 1,
-0.4337964, -1.175901, -2.345523, 1, 1, 1, 1, 1,
-0.4311816, -0.6555504, -3.254668, 1, 1, 1, 1, 1,
-0.4257853, -0.4149935, -2.054573, 1, 1, 1, 1, 1,
-0.4246221, 0.5975677, -0.1927083, 1, 1, 1, 1, 1,
-0.4216999, 0.6596817, 1.754118, 1, 1, 1, 1, 1,
-0.4194037, 0.1806739, -0.934873, 1, 1, 1, 1, 1,
-0.4192272, 1.245667, 0.08621951, 1, 1, 1, 1, 1,
-0.4158477, -2.890953, -4.12428, 0, 0, 1, 1, 1,
-0.4130369, 0.5492642, 0.02390798, 1, 0, 0, 1, 1,
-0.4126514, 0.8372988, -2.162849, 1, 0, 0, 1, 1,
-0.410163, -0.7523441, -2.977198, 1, 0, 0, 1, 1,
-0.4074407, -1.39137, -3.459541, 1, 0, 0, 1, 1,
-0.4072278, 0.2781417, -1.559061, 1, 0, 0, 1, 1,
-0.4059632, -0.09665532, -1.287992, 0, 0, 0, 1, 1,
-0.4052611, -1.935543, -2.61114, 0, 0, 0, 1, 1,
-0.4011776, -1.47882, -3.040154, 0, 0, 0, 1, 1,
-0.3969012, 0.5215038, -0.9111928, 0, 0, 0, 1, 1,
-0.3908824, 0.1834258, -1.172668, 0, 0, 0, 1, 1,
-0.387449, -0.5783769, -3.737119, 0, 0, 0, 1, 1,
-0.3842763, -0.1632121, 0.71964, 0, 0, 0, 1, 1,
-0.3837119, -0.3600472, -3.880721, 1, 1, 1, 1, 1,
-0.37852, 0.5674582, -0.9583675, 1, 1, 1, 1, 1,
-0.3782485, 0.293064, -1.057536, 1, 1, 1, 1, 1,
-0.3763894, -1.187781, -3.850212, 1, 1, 1, 1, 1,
-0.3675153, 0.1813658, -0.139046, 1, 1, 1, 1, 1,
-0.3635629, -0.7394873, -2.570241, 1, 1, 1, 1, 1,
-0.358687, -0.2627869, -1.504775, 1, 1, 1, 1, 1,
-0.3564907, -0.3728788, -2.854404, 1, 1, 1, 1, 1,
-0.3552514, -1.101453, -2.290314, 1, 1, 1, 1, 1,
-0.3525186, -0.3069754, -2.085244, 1, 1, 1, 1, 1,
-0.3506595, 2.30642, -0.07433157, 1, 1, 1, 1, 1,
-0.3494485, 0.2829382, -1.216642, 1, 1, 1, 1, 1,
-0.3487811, -0.8015985, -2.816974, 1, 1, 1, 1, 1,
-0.3435265, 2.146968, 0.7345161, 1, 1, 1, 1, 1,
-0.3432155, -0.5358793, -3.142497, 1, 1, 1, 1, 1,
-0.3402776, 1.52954, -0.1640807, 0, 0, 1, 1, 1,
-0.3375756, 0.1050291, -1.164493, 1, 0, 0, 1, 1,
-0.3366367, -0.3444569, -1.583373, 1, 0, 0, 1, 1,
-0.3346964, 0.4089375, -0.2922753, 1, 0, 0, 1, 1,
-0.3307315, 0.982631, -0.7519928, 1, 0, 0, 1, 1,
-0.3288587, 0.3264079, 0.325223, 1, 0, 0, 1, 1,
-0.326574, -1.196806, -2.673988, 0, 0, 0, 1, 1,
-0.3211105, -0.4412183, -2.536609, 0, 0, 0, 1, 1,
-0.3136972, 0.2861901, -1.478963, 0, 0, 0, 1, 1,
-0.3081367, -0.6376371, -1.137996, 0, 0, 0, 1, 1,
-0.3073416, -0.4227499, -1.998018, 0, 0, 0, 1, 1,
-0.3022867, 0.2750553, -0.272768, 0, 0, 0, 1, 1,
-0.302037, 0.5560561, -2.073777, 0, 0, 0, 1, 1,
-0.3015832, -0.09555027, -3.151404, 1, 1, 1, 1, 1,
-0.3013833, -3.161346, -2.311661, 1, 1, 1, 1, 1,
-0.2982793, 0.5956305, 0.1534615, 1, 1, 1, 1, 1,
-0.2961101, -0.4133985, -2.563404, 1, 1, 1, 1, 1,
-0.2960556, 1.519315, -1.575332, 1, 1, 1, 1, 1,
-0.2952648, 0.6289006, -1.54653, 1, 1, 1, 1, 1,
-0.2923503, 1.372033, 1.405636, 1, 1, 1, 1, 1,
-0.2922223, -0.3775595, -0.03669128, 1, 1, 1, 1, 1,
-0.287707, 0.7719033, -0.07595532, 1, 1, 1, 1, 1,
-0.2829611, 1.746306, 0.4297912, 1, 1, 1, 1, 1,
-0.2803863, 0.6511444, -1.253273, 1, 1, 1, 1, 1,
-0.2793102, -1.618026, -3.353243, 1, 1, 1, 1, 1,
-0.2767688, -0.5102364, -4.919524, 1, 1, 1, 1, 1,
-0.2751087, 0.2686591, -0.249367, 1, 1, 1, 1, 1,
-0.2697525, 1.491512, -0.842387, 1, 1, 1, 1, 1,
-0.2646104, -0.4245246, -2.090653, 0, 0, 1, 1, 1,
-0.26435, -0.009333059, 0.1483037, 1, 0, 0, 1, 1,
-0.2610373, -0.4531447, -1.759464, 1, 0, 0, 1, 1,
-0.2593122, -0.4830925, -3.458572, 1, 0, 0, 1, 1,
-0.2576357, 1.007889, 0.4123519, 1, 0, 0, 1, 1,
-0.2573985, -0.03496347, -1.960369, 1, 0, 0, 1, 1,
-0.2563007, 0.8496247, 0.002335798, 0, 0, 0, 1, 1,
-0.2498566, -1.380113, -2.282387, 0, 0, 0, 1, 1,
-0.2477885, 0.1823475, -0.8242372, 0, 0, 0, 1, 1,
-0.2472426, -1.507506, -3.777469, 0, 0, 0, 1, 1,
-0.2469175, -0.2969348, -3.199959, 0, 0, 0, 1, 1,
-0.240094, 0.2895558, -0.6716947, 0, 0, 0, 1, 1,
-0.2334953, 1.087147, -0.5675713, 0, 0, 0, 1, 1,
-0.2330705, -0.1452432, -1.797276, 1, 1, 1, 1, 1,
-0.2264143, 0.6042218, -1.681021, 1, 1, 1, 1, 1,
-0.2263015, -0.4160704, -1.171515, 1, 1, 1, 1, 1,
-0.2260522, 0.1514209, -1.538826, 1, 1, 1, 1, 1,
-0.2209094, 2.012659, 0.003180204, 1, 1, 1, 1, 1,
-0.2174919, -1.037651, -4.33659, 1, 1, 1, 1, 1,
-0.2140955, -1.158327, -1.726217, 1, 1, 1, 1, 1,
-0.2140886, 0.5213908, 0.3421157, 1, 1, 1, 1, 1,
-0.211026, -0.4326617, -1.972913, 1, 1, 1, 1, 1,
-0.2077439, 0.3705261, 0.749827, 1, 1, 1, 1, 1,
-0.2047563, 0.3952993, -2.05698, 1, 1, 1, 1, 1,
-0.2045773, -0.180036, -2.324479, 1, 1, 1, 1, 1,
-0.2036498, 0.1729383, -0.5712166, 1, 1, 1, 1, 1,
-0.2028092, 1.210865, -0.8856914, 1, 1, 1, 1, 1,
-0.201561, 0.7845816, -0.2214951, 1, 1, 1, 1, 1,
-0.2007302, 0.4906972, -0.4199093, 0, 0, 1, 1, 1,
-0.1988628, -0.8317078, -2.291211, 1, 0, 0, 1, 1,
-0.1956854, 0.3651142, -1.114387, 1, 0, 0, 1, 1,
-0.1955353, 0.2755569, -0.8495314, 1, 0, 0, 1, 1,
-0.1930898, -0.51276, -3.241404, 1, 0, 0, 1, 1,
-0.1884497, -0.1967233, -1.41617, 1, 0, 0, 1, 1,
-0.1871814, -0.2423386, -2.593336, 0, 0, 0, 1, 1,
-0.1838826, 1.828745, -0.5578177, 0, 0, 0, 1, 1,
-0.1827196, -0.1052438, -1.523581, 0, 0, 0, 1, 1,
-0.1807744, -0.3992282, -0.5826412, 0, 0, 0, 1, 1,
-0.1786214, -1.927719, -3.398879, 0, 0, 0, 1, 1,
-0.1782708, -1.966432, -2.364458, 0, 0, 0, 1, 1,
-0.1779663, 1.882455, 0.2854358, 0, 0, 0, 1, 1,
-0.1736168, -1.724935, -4.071383, 1, 1, 1, 1, 1,
-0.1726459, -0.1631, -2.148023, 1, 1, 1, 1, 1,
-0.1696002, -1.409152, -2.066555, 1, 1, 1, 1, 1,
-0.1683116, -0.3286673, -2.181082, 1, 1, 1, 1, 1,
-0.1676451, -0.4697832, -4.821254, 1, 1, 1, 1, 1,
-0.163984, 1.635334, -0.1400124, 1, 1, 1, 1, 1,
-0.1617917, -1.692983, -4.158753, 1, 1, 1, 1, 1,
-0.1528127, -1.220268, -1.757577, 1, 1, 1, 1, 1,
-0.152373, -0.2665332, -4.270894, 1, 1, 1, 1, 1,
-0.1487426, -0.9887822, -2.852261, 1, 1, 1, 1, 1,
-0.1465081, -1.486672, -2.952322, 1, 1, 1, 1, 1,
-0.144133, 1.214123, 0.418194, 1, 1, 1, 1, 1,
-0.1391823, 0.802519, 1.363545, 1, 1, 1, 1, 1,
-0.1349362, 1.725277, -1.396811, 1, 1, 1, 1, 1,
-0.1326023, 0.1058669, -2.401941, 1, 1, 1, 1, 1,
-0.1305043, -0.5563587, -1.853582, 0, 0, 1, 1, 1,
-0.1293009, -0.6350304, -1.913716, 1, 0, 0, 1, 1,
-0.126873, -1.620358, -1.399813, 1, 0, 0, 1, 1,
-0.1235475, 0.9426865, 0.3913564, 1, 0, 0, 1, 1,
-0.122391, 1.194694, -0.2528973, 1, 0, 0, 1, 1,
-0.1221165, 0.002062259, -1.60153, 1, 0, 0, 1, 1,
-0.1191433, -0.2285867, -3.833529, 0, 0, 0, 1, 1,
-0.1147842, 1.286943, 1.253143, 0, 0, 0, 1, 1,
-0.1143477, -0.1767713, -1.525351, 0, 0, 0, 1, 1,
-0.1076697, 0.3548771, -1.611677, 0, 0, 0, 1, 1,
-0.1052544, 2.118603, -0.6053647, 0, 0, 0, 1, 1,
-0.09839845, -0.4194225, -3.048326, 0, 0, 0, 1, 1,
-0.0941901, 1.710478, 0.115438, 0, 0, 0, 1, 1,
-0.09244264, -1.749082, -3.586725, 1, 1, 1, 1, 1,
-0.09059258, -1.408525, -2.612649, 1, 1, 1, 1, 1,
-0.09040974, 0.9097875, 0.3423871, 1, 1, 1, 1, 1,
-0.09035008, -0.7862321, -4.136231, 1, 1, 1, 1, 1,
-0.08700401, 0.4999029, 0.0635285, 1, 1, 1, 1, 1,
-0.08534628, 0.4516601, 0.6082372, 1, 1, 1, 1, 1,
-0.08154588, -0.2069915, -1.791392, 1, 1, 1, 1, 1,
-0.07993086, -1.009766, -1.519403, 1, 1, 1, 1, 1,
-0.07885222, -0.02671854, -3.415574, 1, 1, 1, 1, 1,
-0.07248111, -0.4356766, -2.737866, 1, 1, 1, 1, 1,
-0.06996986, -1.320714, -0.8199784, 1, 1, 1, 1, 1,
-0.06328823, 0.9348552, 1.296144, 1, 1, 1, 1, 1,
-0.06215172, 0.3079993, 0.8112952, 1, 1, 1, 1, 1,
-0.05948411, -0.9526425, -3.809006, 1, 1, 1, 1, 1,
-0.05754454, -1.663176, -3.084682, 1, 1, 1, 1, 1,
-0.05717458, 0.06288634, -0.3104461, 0, 0, 1, 1, 1,
-0.05700285, 1.011265, -1.733245, 1, 0, 0, 1, 1,
-0.05650654, -0.4368438, -1.844964, 1, 0, 0, 1, 1,
-0.05575425, 0.4337276, 0.4958342, 1, 0, 0, 1, 1,
-0.05361669, 2.264821, 1.077032, 1, 0, 0, 1, 1,
-0.0534772, 0.03921774, 0.3148537, 1, 0, 0, 1, 1,
-0.05291076, -1.962015, -3.068112, 0, 0, 0, 1, 1,
-0.05178194, 1.129079, -0.5813364, 0, 0, 0, 1, 1,
-0.05088016, 1.840264, -0.2659198, 0, 0, 0, 1, 1,
-0.05072454, -0.3026648, -2.365044, 0, 0, 0, 1, 1,
-0.04823483, -0.7180779, -2.778577, 0, 0, 0, 1, 1,
-0.04146824, -2.319174, -3.471404, 0, 0, 0, 1, 1,
-0.0409097, 0.06950466, -1.534409, 0, 0, 0, 1, 1,
-0.03784534, 0.2836375, 0.0638971, 1, 1, 1, 1, 1,
-0.03584351, 0.4676571, 0.4061511, 1, 1, 1, 1, 1,
-0.03531749, -0.1551431, -3.966995, 1, 1, 1, 1, 1,
-0.02552785, -1.507788, -3.450864, 1, 1, 1, 1, 1,
-0.0251233, 1.7818, 0.05322081, 1, 1, 1, 1, 1,
-0.02486146, 0.4558262, 0.8665717, 1, 1, 1, 1, 1,
-0.02103521, -0.2341417, -2.526358, 1, 1, 1, 1, 1,
-0.02017775, -2.003204, -2.653956, 1, 1, 1, 1, 1,
-0.01819923, -1.759667, -3.526607, 1, 1, 1, 1, 1,
-0.01783927, -0.5505319, -3.554206, 1, 1, 1, 1, 1,
-0.01587895, 0.7027904, -0.375615, 1, 1, 1, 1, 1,
-0.01520279, -0.8482208, -4.482073, 1, 1, 1, 1, 1,
-0.01385504, -0.2975918, -2.208703, 1, 1, 1, 1, 1,
-0.008456084, -0.7299236, -5.736491, 1, 1, 1, 1, 1,
-0.004632295, -1.437334, -3.525533, 1, 1, 1, 1, 1,
0.00210788, -1.208632, 5.438426, 0, 0, 1, 1, 1,
0.005475523, 0.4390275, -0.9245115, 1, 0, 0, 1, 1,
0.006200227, -0.3530926, 2.556139, 1, 0, 0, 1, 1,
0.007264224, 0.1686298, -0.9743889, 1, 0, 0, 1, 1,
0.007389951, -0.7886481, 3.215039, 1, 0, 0, 1, 1,
0.008457099, -0.07756465, 3.706398, 1, 0, 0, 1, 1,
0.01203571, 0.8940865, -0.7420394, 0, 0, 0, 1, 1,
0.01261455, -0.1988259, 4.729848, 0, 0, 0, 1, 1,
0.01357171, 0.01182256, 1.21268, 0, 0, 0, 1, 1,
0.01523148, 0.645499, 0.8762592, 0, 0, 0, 1, 1,
0.01668859, 0.7723413, -1.006627, 0, 0, 0, 1, 1,
0.01920157, -2.049932, 3.712175, 0, 0, 0, 1, 1,
0.02026759, 0.2574577, 0.6810157, 0, 0, 0, 1, 1,
0.02038932, -0.808993, 3.096214, 1, 1, 1, 1, 1,
0.02399936, 0.4469199, 0.7842781, 1, 1, 1, 1, 1,
0.02445402, -1.178886, 3.331967, 1, 1, 1, 1, 1,
0.024858, -1.267637, 4.752402, 1, 1, 1, 1, 1,
0.02874925, 0.700197, -0.341642, 1, 1, 1, 1, 1,
0.0337498, -0.3594992, 3.676569, 1, 1, 1, 1, 1,
0.03523546, -0.4951797, 3.663082, 1, 1, 1, 1, 1,
0.03605938, -1.23987, 2.501691, 1, 1, 1, 1, 1,
0.03706321, 0.5474495, -0.2737957, 1, 1, 1, 1, 1,
0.03956886, 0.5143504, -0.5838985, 1, 1, 1, 1, 1,
0.04031272, -0.1879581, 2.684486, 1, 1, 1, 1, 1,
0.04217589, 0.3631778, 2.272774, 1, 1, 1, 1, 1,
0.04771734, -2.114872, 2.97367, 1, 1, 1, 1, 1,
0.048919, 0.4951088, -0.2046093, 1, 1, 1, 1, 1,
0.04980598, 0.4509805, 0.4291127, 1, 1, 1, 1, 1,
0.04999822, -0.7174399, 2.467486, 0, 0, 1, 1, 1,
0.05516111, -1.258163, 2.902173, 1, 0, 0, 1, 1,
0.05617882, -0.810134, 1.0481, 1, 0, 0, 1, 1,
0.05752131, -0.7613844, 3.905059, 1, 0, 0, 1, 1,
0.05994344, -0.5805405, 3.785931, 1, 0, 0, 1, 1,
0.06204679, 0.6499251, 0.07449926, 1, 0, 0, 1, 1,
0.06379341, 2.315493, 0.5730678, 0, 0, 0, 1, 1,
0.06395782, -0.3632455, 3.438677, 0, 0, 0, 1, 1,
0.06439649, 0.4339382, -0.1553954, 0, 0, 0, 1, 1,
0.06512659, 0.6061891, -0.6385155, 0, 0, 0, 1, 1,
0.07171353, 0.5734577, -0.2997173, 0, 0, 0, 1, 1,
0.07310399, 1.990756, -0.8168879, 0, 0, 0, 1, 1,
0.07322768, 0.9188702, -1.086948, 0, 0, 0, 1, 1,
0.07640812, -0.3816181, 3.296417, 1, 1, 1, 1, 1,
0.07889403, -0.4321333, 2.901764, 1, 1, 1, 1, 1,
0.0806855, -0.3651777, 5.31828, 1, 1, 1, 1, 1,
0.08134999, -0.1080656, 2.568981, 1, 1, 1, 1, 1,
0.08540845, -0.2678586, 4.727588, 1, 1, 1, 1, 1,
0.0915131, -0.9136075, 3.721651, 1, 1, 1, 1, 1,
0.09546243, 0.07473591, 1.210839, 1, 1, 1, 1, 1,
0.09901294, -1.408324, 3.300998, 1, 1, 1, 1, 1,
0.09982536, 1.168097, 0.4652594, 1, 1, 1, 1, 1,
0.1022043, 1.138133, 0.4652696, 1, 1, 1, 1, 1,
0.1069892, -1.585226, 1.95237, 1, 1, 1, 1, 1,
0.1118038, -0.511817, 3.874697, 1, 1, 1, 1, 1,
0.112266, -0.977758, 2.270081, 1, 1, 1, 1, 1,
0.1139598, -2.006711, 2.924597, 1, 1, 1, 1, 1,
0.1224936, -0.4046334, 1.146417, 1, 1, 1, 1, 1,
0.123376, -0.6555587, 4.327892, 0, 0, 1, 1, 1,
0.1257642, -0.9520008, 5.340035, 1, 0, 0, 1, 1,
0.1262052, -0.02486524, 1.479432, 1, 0, 0, 1, 1,
0.1303667, -0.564204, 1.101722, 1, 0, 0, 1, 1,
0.130652, -0.841093, 2.911321, 1, 0, 0, 1, 1,
0.1325189, -0.2224213, 2.89548, 1, 0, 0, 1, 1,
0.1360483, -0.02187675, 1.010637, 0, 0, 0, 1, 1,
0.1428544, -1.554615, 2.747378, 0, 0, 0, 1, 1,
0.1559589, -1.904702, 1.700756, 0, 0, 0, 1, 1,
0.1606796, -1.819299, 4.049169, 0, 0, 0, 1, 1,
0.1635996, 0.001286832, 2.147087, 0, 0, 0, 1, 1,
0.1651021, -0.6467218, 3.144482, 0, 0, 0, 1, 1,
0.1679322, 0.2041962, 1.196033, 0, 0, 0, 1, 1,
0.1689214, 0.05760145, 1.180841, 1, 1, 1, 1, 1,
0.1768054, 0.3571883, -0.6029476, 1, 1, 1, 1, 1,
0.1770847, -1.000613, 3.875126, 1, 1, 1, 1, 1,
0.1771914, -0.01788199, 3.317034, 1, 1, 1, 1, 1,
0.1782941, -0.05611064, 0.5701192, 1, 1, 1, 1, 1,
0.1802202, 0.6088508, 0.2850137, 1, 1, 1, 1, 1,
0.1871088, 0.1230634, 0.2042056, 1, 1, 1, 1, 1,
0.1885792, -1.012328, 3.024956, 1, 1, 1, 1, 1,
0.1894768, 0.5658464, 0.1958748, 1, 1, 1, 1, 1,
0.1908033, 0.8135768, 0.3123612, 1, 1, 1, 1, 1,
0.1908258, 2.56655, 0.997843, 1, 1, 1, 1, 1,
0.1987622, 1.148485, 0.2406019, 1, 1, 1, 1, 1,
0.1989539, -1.355183, 2.612539, 1, 1, 1, 1, 1,
0.1997002, 1.105663, -1.959067, 1, 1, 1, 1, 1,
0.2010033, 0.4167373, 0.6769195, 1, 1, 1, 1, 1,
0.2025237, 0.7254292, 0.3236214, 0, 0, 1, 1, 1,
0.2025963, 1.655479, 0.4477545, 1, 0, 0, 1, 1,
0.2060186, 1.37484, 0.4451818, 1, 0, 0, 1, 1,
0.2061719, 0.9158725, 0.8124116, 1, 0, 0, 1, 1,
0.2068495, -1.155456, 3.14972, 1, 0, 0, 1, 1,
0.2081072, 1.042557, 1.328301, 1, 0, 0, 1, 1,
0.2155665, -0.06482799, 1.236796, 0, 0, 0, 1, 1,
0.2247873, 0.8587426, 0.413055, 0, 0, 0, 1, 1,
0.2258506, 0.1051473, 1.517791, 0, 0, 0, 1, 1,
0.2271867, 0.06782307, 0.8324797, 0, 0, 0, 1, 1,
0.2284187, -0.5973123, 2.34573, 0, 0, 0, 1, 1,
0.2311074, 1.424804, -0.408596, 0, 0, 0, 1, 1,
0.2317382, 0.4743484, 1.100112, 0, 0, 0, 1, 1,
0.2326527, -0.4186663, 2.473897, 1, 1, 1, 1, 1,
0.2328916, 1.053524, 0.5270818, 1, 1, 1, 1, 1,
0.2343809, -0.3480819, 1.716426, 1, 1, 1, 1, 1,
0.2419372, 1.293137, -0.751196, 1, 1, 1, 1, 1,
0.245313, -0.8383247, 4.36346, 1, 1, 1, 1, 1,
0.2488359, -0.02448029, 1.38335, 1, 1, 1, 1, 1,
0.2496135, -0.09081861, 1.060363, 1, 1, 1, 1, 1,
0.2555452, 1.186463, -0.2134079, 1, 1, 1, 1, 1,
0.2583067, 0.8013043, 0.1380681, 1, 1, 1, 1, 1,
0.2598132, -1.171568, 3.152996, 1, 1, 1, 1, 1,
0.2608766, 0.820522, -0.6811213, 1, 1, 1, 1, 1,
0.2647202, -1.478808, 2.979083, 1, 1, 1, 1, 1,
0.2654756, -0.8635483, 4.107657, 1, 1, 1, 1, 1,
0.2690169, -0.1781169, 0.7404641, 1, 1, 1, 1, 1,
0.2690393, 0.9658358, -0.1625937, 1, 1, 1, 1, 1,
0.2705662, -0.8346642, 1.442386, 0, 0, 1, 1, 1,
0.2723043, 0.2588252, 0.3596443, 1, 0, 0, 1, 1,
0.2813838, 0.2366109, 2.167452, 1, 0, 0, 1, 1,
0.2817651, 1.819193, -1.615349, 1, 0, 0, 1, 1,
0.2844253, 0.3313543, 1.672687, 1, 0, 0, 1, 1,
0.2847936, -0.01150889, 2.743345, 1, 0, 0, 1, 1,
0.288654, -0.2695301, 1.202256, 0, 0, 0, 1, 1,
0.2895069, 1.58006, 0.1303883, 0, 0, 0, 1, 1,
0.2933801, 1.205161, -1.731791, 0, 0, 0, 1, 1,
0.2954998, -1.203594, 1.520209, 0, 0, 0, 1, 1,
0.2957141, 0.8910884, 2.356534, 0, 0, 0, 1, 1,
0.295755, -1.785237, 3.613366, 0, 0, 0, 1, 1,
0.2979895, -1.052803, 2.769457, 0, 0, 0, 1, 1,
0.300803, 0.4034103, 0.0707887, 1, 1, 1, 1, 1,
0.3016934, 0.01736302, 1.143409, 1, 1, 1, 1, 1,
0.3037607, -0.02962902, 1.495359, 1, 1, 1, 1, 1,
0.3056959, 0.01307057, 2.790909, 1, 1, 1, 1, 1,
0.3108214, 0.5603749, -0.2327763, 1, 1, 1, 1, 1,
0.3157076, 0.6746621, 1.776659, 1, 1, 1, 1, 1,
0.3161477, 0.9967524, -0.9998264, 1, 1, 1, 1, 1,
0.3188708, -1.072097, 3.831477, 1, 1, 1, 1, 1,
0.3192233, 0.8117676, -1.116679, 1, 1, 1, 1, 1,
0.3205279, 0.09858708, 1.36558, 1, 1, 1, 1, 1,
0.3217891, -0.4509289, 2.979976, 1, 1, 1, 1, 1,
0.3241778, 0.7192276, 0.5090775, 1, 1, 1, 1, 1,
0.3243959, 0.04521346, 1.360561, 1, 1, 1, 1, 1,
0.3286382, 1.073535, 1.301786, 1, 1, 1, 1, 1,
0.3298552, 0.4599904, 0.5787221, 1, 1, 1, 1, 1,
0.3322805, 1.107845, 0.7782121, 0, 0, 1, 1, 1,
0.3336442, 0.8953065, 0.3516325, 1, 0, 0, 1, 1,
0.3344592, 0.9768752, 0.5144026, 1, 0, 0, 1, 1,
0.3350186, -1.588767, 3.782458, 1, 0, 0, 1, 1,
0.3381021, -0.7648475, 2.047373, 1, 0, 0, 1, 1,
0.3420207, -0.0455374, 1.091069, 1, 0, 0, 1, 1,
0.3438634, 1.690183, 1.324049, 0, 0, 0, 1, 1,
0.346495, 0.9177369, 1.181493, 0, 0, 0, 1, 1,
0.3469993, 1.553342, -1.065831, 0, 0, 0, 1, 1,
0.3477037, 0.05580644, 2.466816, 0, 0, 0, 1, 1,
0.3477811, 1.032847, 0.1976837, 0, 0, 0, 1, 1,
0.351083, -1.021313, 1.755206, 0, 0, 0, 1, 1,
0.3527167, -1.913373, 3.319187, 0, 0, 0, 1, 1,
0.3625199, 1.18712, 1.945146, 1, 1, 1, 1, 1,
0.363346, -1.184488, 1.400546, 1, 1, 1, 1, 1,
0.3684616, -1.766575, 2.523744, 1, 1, 1, 1, 1,
0.3685901, 0.252078, 2.993944, 1, 1, 1, 1, 1,
0.3745965, 1.473394, -0.4766672, 1, 1, 1, 1, 1,
0.3832365, -1.97476, 4.389683, 1, 1, 1, 1, 1,
0.3836881, -0.1972658, 2.633977, 1, 1, 1, 1, 1,
0.3864699, 0.4691431, 0.5709379, 1, 1, 1, 1, 1,
0.3961839, 2.645593, -0.2696917, 1, 1, 1, 1, 1,
0.4012805, -0.5411732, 2.935783, 1, 1, 1, 1, 1,
0.4026403, 0.1365815, 1.167062, 1, 1, 1, 1, 1,
0.4081719, -0.1802582, 1.520832, 1, 1, 1, 1, 1,
0.4098288, 0.2654133, 0.7396285, 1, 1, 1, 1, 1,
0.4156733, 0.1581443, 2.070089, 1, 1, 1, 1, 1,
0.4174665, 0.703449, -0.809036, 1, 1, 1, 1, 1,
0.4186862, -0.1276971, 0.9853346, 0, 0, 1, 1, 1,
0.4196319, -0.03150136, 3.784897, 1, 0, 0, 1, 1,
0.4198405, -0.6364618, 1.269885, 1, 0, 0, 1, 1,
0.4221792, 0.1356097, 1.699644, 1, 0, 0, 1, 1,
0.4245056, -0.7346559, 1.75176, 1, 0, 0, 1, 1,
0.443359, 0.4186575, 1.685763, 1, 0, 0, 1, 1,
0.4448754, 0.3088841, 2.877359, 0, 0, 0, 1, 1,
0.4509211, 0.7805346, -1.357692, 0, 0, 0, 1, 1,
0.4509794, 0.1559604, -0.5491662, 0, 0, 0, 1, 1,
0.4539047, 1.188738, 0.5464647, 0, 0, 0, 1, 1,
0.45984, -0.7483864, 2.657775, 0, 0, 0, 1, 1,
0.4599679, -0.03817108, 3.148829, 0, 0, 0, 1, 1,
0.4617048, 0.5379399, 0.3415438, 0, 0, 0, 1, 1,
0.4662493, 0.4179628, 0.4069193, 1, 1, 1, 1, 1,
0.4678553, -0.4455007, 3.833345, 1, 1, 1, 1, 1,
0.469312, -2.408669, 3.216766, 1, 1, 1, 1, 1,
0.4710308, 1.681513, -0.4561075, 1, 1, 1, 1, 1,
0.4721027, -0.4692529, 2.14444, 1, 1, 1, 1, 1,
0.47279, 0.2437228, 2.292135, 1, 1, 1, 1, 1,
0.4735859, 0.1116289, 1.731103, 1, 1, 1, 1, 1,
0.4764767, 1.088574, 1.666119, 1, 1, 1, 1, 1,
0.4769197, 0.2102543, 1.087109, 1, 1, 1, 1, 1,
0.4798956, 0.5566886, 0.09413218, 1, 1, 1, 1, 1,
0.4805447, 0.2027118, 0.8104715, 1, 1, 1, 1, 1,
0.4806216, -0.7873349, 1.981467, 1, 1, 1, 1, 1,
0.4808334, -1.111632, 4.029812, 1, 1, 1, 1, 1,
0.4847031, 1.310411, -0.7336937, 1, 1, 1, 1, 1,
0.4915626, 0.7471315, 0.3321255, 1, 1, 1, 1, 1,
0.4926363, -0.588435, 0.3370297, 0, 0, 1, 1, 1,
0.5026168, -0.2895426, 4.244736, 1, 0, 0, 1, 1,
0.5037459, 0.3248914, 1.886032, 1, 0, 0, 1, 1,
0.5054015, 1.525219, 1.412009, 1, 0, 0, 1, 1,
0.5054035, -0.272294, 3.990621, 1, 0, 0, 1, 1,
0.5117688, 1.067782, 0.6736662, 1, 0, 0, 1, 1,
0.515158, 0.727263, 2.770896, 0, 0, 0, 1, 1,
0.5152747, -0.5439857, 4.286852, 0, 0, 0, 1, 1,
0.520709, 0.2060644, 0.4634637, 0, 0, 0, 1, 1,
0.5212068, 1.029037, 0.4194688, 0, 0, 0, 1, 1,
0.5215908, 0.2336225, 1.322249, 0, 0, 0, 1, 1,
0.5217963, -0.535363, 4.712224, 0, 0, 0, 1, 1,
0.521935, -0.7557708, 2.282222, 0, 0, 0, 1, 1,
0.5262797, 1.278591, 0.01915672, 1, 1, 1, 1, 1,
0.529785, 0.01220269, 1.740812, 1, 1, 1, 1, 1,
0.5321087, 0.2830263, 1.121883, 1, 1, 1, 1, 1,
0.5381855, 0.2453581, 0.05495409, 1, 1, 1, 1, 1,
0.5419226, 0.4092156, 0.5235507, 1, 1, 1, 1, 1,
0.5419709, 0.6885798, 0.1811597, 1, 1, 1, 1, 1,
0.5433712, 0.9794259, 0.08128115, 1, 1, 1, 1, 1,
0.546944, -1.051638, 2.455812, 1, 1, 1, 1, 1,
0.5474353, -0.5924993, 1.022632, 1, 1, 1, 1, 1,
0.5474743, 0.5764821, 1.606451, 1, 1, 1, 1, 1,
0.5485575, 0.5015062, 0.8081914, 1, 1, 1, 1, 1,
0.5525289, -0.5769023, 2.530847, 1, 1, 1, 1, 1,
0.5530368, 1.086107, 0.07447802, 1, 1, 1, 1, 1,
0.5552723, -0.09361794, 0.9550535, 1, 1, 1, 1, 1,
0.5556597, -0.7044652, 2.026054, 1, 1, 1, 1, 1,
0.5557387, 1.92854, -0.2650166, 0, 0, 1, 1, 1,
0.5600764, -0.495376, 1.446011, 1, 0, 0, 1, 1,
0.5631782, 0.886277, -0.4367057, 1, 0, 0, 1, 1,
0.5681337, -0.5983408, 2.475056, 1, 0, 0, 1, 1,
0.5712761, 0.09080631, 1.725149, 1, 0, 0, 1, 1,
0.5717244, -1.340498, 4.017766, 1, 0, 0, 1, 1,
0.5718812, -2.01558, 2.213296, 0, 0, 0, 1, 1,
0.578101, 0.4036982, 2.056738, 0, 0, 0, 1, 1,
0.579092, -1.03389, 2.345109, 0, 0, 0, 1, 1,
0.5799246, -0.7196525, 1.453182, 0, 0, 0, 1, 1,
0.5818299, -0.7405736, 0.6516813, 0, 0, 0, 1, 1,
0.5828531, -0.001823943, 0.4540389, 0, 0, 0, 1, 1,
0.5854181, -0.5928231, 3.745173, 0, 0, 0, 1, 1,
0.5891979, 0.4983071, -0.1597367, 1, 1, 1, 1, 1,
0.5893102, 0.9873004, 0.5945166, 1, 1, 1, 1, 1,
0.5978559, -0.3421219, 3.320734, 1, 1, 1, 1, 1,
0.6005385, -0.03942878, 1.012596, 1, 1, 1, 1, 1,
0.6054739, -0.3042444, 2.848183, 1, 1, 1, 1, 1,
0.6081623, -1.152848, 1.840124, 1, 1, 1, 1, 1,
0.6149741, 0.8307914, 0.3488367, 1, 1, 1, 1, 1,
0.6152695, 0.7278124, 1.220015, 1, 1, 1, 1, 1,
0.620185, 1.331028, 1.290064, 1, 1, 1, 1, 1,
0.6204736, 1.339959, 1.666568, 1, 1, 1, 1, 1,
0.6244215, -1.893213, 0.8691929, 1, 1, 1, 1, 1,
0.6246199, -0.4659168, 2.566835, 1, 1, 1, 1, 1,
0.6309676, -0.4932295, 1.901974, 1, 1, 1, 1, 1,
0.6371264, -0.8680775, -0.2522866, 1, 1, 1, 1, 1,
0.6385204, 0.8679765, 0.4869291, 1, 1, 1, 1, 1,
0.6387087, -0.0696686, 0.6323184, 0, 0, 1, 1, 1,
0.6437389, 1.265747, 1.099996, 1, 0, 0, 1, 1,
0.6455837, 0.7384186, -0.4271267, 1, 0, 0, 1, 1,
0.6474732, 0.5149269, 0.8735766, 1, 0, 0, 1, 1,
0.6534541, -0.4278632, 3.502959, 1, 0, 0, 1, 1,
0.6538258, -0.02580443, 1.783921, 1, 0, 0, 1, 1,
0.6548363, 0.3937218, -0.7787573, 0, 0, 0, 1, 1,
0.6550749, -0.3102647, 3.970306, 0, 0, 0, 1, 1,
0.6555455, -0.9157767, 4.614995, 0, 0, 0, 1, 1,
0.664291, -0.7875374, 1.379282, 0, 0, 0, 1, 1,
0.6680085, 0.5473298, 1.287516, 0, 0, 0, 1, 1,
0.6691754, 0.327092, 2.757303, 0, 0, 0, 1, 1,
0.6712916, 0.4522364, 0.6891961, 0, 0, 0, 1, 1,
0.6716556, 0.930438, 2.24935, 1, 1, 1, 1, 1,
0.6766596, 2.597968, 2.365261, 1, 1, 1, 1, 1,
0.6768587, -0.1416333, 2.617656, 1, 1, 1, 1, 1,
0.6788348, 0.03262604, 1.344941, 1, 1, 1, 1, 1,
0.6825173, -0.5601551, 3.353334, 1, 1, 1, 1, 1,
0.6855434, -1.365198, 2.455057, 1, 1, 1, 1, 1,
0.6882518, -0.0710866, 3.099144, 1, 1, 1, 1, 1,
0.6887474, -0.5365471, 2.070428, 1, 1, 1, 1, 1,
0.6960589, -2.331661, 3.187446, 1, 1, 1, 1, 1,
0.6986913, -0.1267438, 0.9091539, 1, 1, 1, 1, 1,
0.7045493, 1.295902, -0.2200358, 1, 1, 1, 1, 1,
0.704632, 0.8201457, 1.535995, 1, 1, 1, 1, 1,
0.7075217, -1.220501, 1.995709, 1, 1, 1, 1, 1,
0.7157488, 0.04361265, 2.644349, 1, 1, 1, 1, 1,
0.7200674, -1.443655, 1.90246, 1, 1, 1, 1, 1,
0.7217524, -0.3294627, 0.007397772, 0, 0, 1, 1, 1,
0.7227179, -1.812274, 3.95587, 1, 0, 0, 1, 1,
0.723214, -0.7022887, 0.3109767, 1, 0, 0, 1, 1,
0.7269642, -1.128257, 4.093829, 1, 0, 0, 1, 1,
0.7293007, -0.18466, 2.314426, 1, 0, 0, 1, 1,
0.7425357, -0.4823687, 3.214147, 1, 0, 0, 1, 1,
0.7438535, -0.3686182, 1.558464, 0, 0, 0, 1, 1,
0.7443736, 0.4220082, 2.070692, 0, 0, 0, 1, 1,
0.7580925, 1.236928, 0.6731794, 0, 0, 0, 1, 1,
0.7613908, -0.9132976, 4.146269, 0, 0, 0, 1, 1,
0.761704, 0.4170414, 2.263974, 0, 0, 0, 1, 1,
0.7645007, -1.258491, 2.770633, 0, 0, 0, 1, 1,
0.7670243, -0.7758113, 1.076697, 0, 0, 0, 1, 1,
0.767926, -0.7051571, 2.363531, 1, 1, 1, 1, 1,
0.7720833, -0.9705529, 1.283098, 1, 1, 1, 1, 1,
0.7757174, -0.3849583, 2.600111, 1, 1, 1, 1, 1,
0.7796171, -1.054516, 4.33705, 1, 1, 1, 1, 1,
0.7811487, 1.792411, 0.4167077, 1, 1, 1, 1, 1,
0.7827225, -0.2623237, 1.10038, 1, 1, 1, 1, 1,
0.7961799, -1.435971, 2.495037, 1, 1, 1, 1, 1,
0.7964136, -0.1278166, 1.682603, 1, 1, 1, 1, 1,
0.8017415, 0.4168042, -0.7336835, 1, 1, 1, 1, 1,
0.8031701, 0.6010736, 0.5196291, 1, 1, 1, 1, 1,
0.803186, -1.088182, 2.321551, 1, 1, 1, 1, 1,
0.8039082, 0.2236741, -0.5345877, 1, 1, 1, 1, 1,
0.805637, 1.198283, 0.5935227, 1, 1, 1, 1, 1,
0.8057512, 0.08618694, 2.859478, 1, 1, 1, 1, 1,
0.8077276, 2.038498, 2.307158, 1, 1, 1, 1, 1,
0.8107502, 0.8065364, 0.8743579, 0, 0, 1, 1, 1,
0.8110802, 0.06236434, 0.8354307, 1, 0, 0, 1, 1,
0.8145128, -1.465451, 3.50158, 1, 0, 0, 1, 1,
0.8164485, 0.7969299, 1.36857, 1, 0, 0, 1, 1,
0.8237184, -0.1697247, -0.6992013, 1, 0, 0, 1, 1,
0.8266868, 0.6894434, 0.6672018, 1, 0, 0, 1, 1,
0.8267906, -1.435709, 2.002246, 0, 0, 0, 1, 1,
0.8278945, 0.4467592, 1.174572, 0, 0, 0, 1, 1,
0.8302084, -1.439844, 1.245094, 0, 0, 0, 1, 1,
0.8344778, 0.5593849, 0.9953539, 0, 0, 0, 1, 1,
0.8426255, -0.07354525, 2.935917, 0, 0, 0, 1, 1,
0.8445405, -1.515486, 0.873148, 0, 0, 0, 1, 1,
0.8476737, -1.41108, 2.904586, 0, 0, 0, 1, 1,
0.8484961, -0.8727879, -0.04202868, 1, 1, 1, 1, 1,
0.8489264, -0.8111314, 3.971108, 1, 1, 1, 1, 1,
0.8499773, 0.06995951, 0.1165196, 1, 1, 1, 1, 1,
0.8530715, 0.02611151, 0.1032611, 1, 1, 1, 1, 1,
0.8530729, -0.2672678, -0.3062046, 1, 1, 1, 1, 1,
0.8534734, 1.426414, 2.102831, 1, 1, 1, 1, 1,
0.8555156, 0.5657718, 1.95828, 1, 1, 1, 1, 1,
0.8559668, 0.9944593, 0.851279, 1, 1, 1, 1, 1,
0.8565214, 0.3911409, 2.078325, 1, 1, 1, 1, 1,
0.8589091, 0.9343558, 1.622982, 1, 1, 1, 1, 1,
0.8604876, 1.704244, 0.6044819, 1, 1, 1, 1, 1,
0.8690224, 0.02597692, 1.407587, 1, 1, 1, 1, 1,
0.874229, -0.3572934, 1.606713, 1, 1, 1, 1, 1,
0.8760628, 1.259384, 0.05796919, 1, 1, 1, 1, 1,
0.8785427, 1.396105, 0.1844874, 1, 1, 1, 1, 1,
0.8850943, -1.874354, 3.018629, 0, 0, 1, 1, 1,
0.8957775, -0.8590185, 2.202177, 1, 0, 0, 1, 1,
0.9043556, 0.4749748, 2.385525, 1, 0, 0, 1, 1,
0.9049355, 0.6839489, 0.1477697, 1, 0, 0, 1, 1,
0.9061415, 2.023241, 1.189207, 1, 0, 0, 1, 1,
0.9115071, -0.6854417, 2.327081, 1, 0, 0, 1, 1,
0.9124125, -0.03962242, 0.7910858, 0, 0, 0, 1, 1,
0.9257535, -0.4285579, 1.927435, 0, 0, 0, 1, 1,
0.9279255, 0.8903148, 1.93828, 0, 0, 0, 1, 1,
0.9306412, 0.1622917, 0.2761569, 0, 0, 0, 1, 1,
0.9363921, -0.6854513, 3.937177, 0, 0, 0, 1, 1,
0.9379276, -0.5985155, 3.404613, 0, 0, 0, 1, 1,
0.9442751, 0.384154, 2.563003, 0, 0, 0, 1, 1,
0.9445274, -0.1814748, 1.842623, 1, 1, 1, 1, 1,
0.9445466, 1.226307, -0.1081796, 1, 1, 1, 1, 1,
0.9490559, -0.365492, 2.801903, 1, 1, 1, 1, 1,
0.9535131, -1.080642, 2.656008, 1, 1, 1, 1, 1,
0.9564132, -1.168901, 2.383554, 1, 1, 1, 1, 1,
0.9572666, 0.5746073, 0.3430335, 1, 1, 1, 1, 1,
0.960178, 0.208413, 1.444661, 1, 1, 1, 1, 1,
0.9603813, 0.6858461, -0.1879495, 1, 1, 1, 1, 1,
0.9641942, -0.07382372, 0.7554893, 1, 1, 1, 1, 1,
0.968704, -0.322154, 1.73902, 1, 1, 1, 1, 1,
0.972148, -1.136947, 1.380443, 1, 1, 1, 1, 1,
0.9736282, -1.301926, 3.859923, 1, 1, 1, 1, 1,
0.9741695, -0.4507798, 1.633525, 1, 1, 1, 1, 1,
0.9760357, 0.1135376, 2.888162, 1, 1, 1, 1, 1,
0.9770142, 2.427597, 0.4068401, 1, 1, 1, 1, 1,
0.9799139, 0.01451495, 1.779539, 0, 0, 1, 1, 1,
0.9837377, 0.2937602, -1.222819, 1, 0, 0, 1, 1,
0.9853097, 2.154769, 1.402533, 1, 0, 0, 1, 1,
0.9868942, -0.9847699, 2.305874, 1, 0, 0, 1, 1,
0.9936593, 0.4441361, 0.6076379, 1, 0, 0, 1, 1,
0.9944937, -0.2472788, 0.5441026, 1, 0, 0, 1, 1,
1.000085, 0.2823889, 2.024742, 0, 0, 0, 1, 1,
1.003668, -1.092858, 2.016589, 0, 0, 0, 1, 1,
1.005633, -1.573272, 2.713434, 0, 0, 0, 1, 1,
1.010127, 0.4985119, 0.6931915, 0, 0, 0, 1, 1,
1.013927, 1.278038, 0.6212144, 0, 0, 0, 1, 1,
1.015364, 0.09092905, 2.08575, 0, 0, 0, 1, 1,
1.016183, -0.5013925, 2.572342, 0, 0, 0, 1, 1,
1.017508, -1.360442, 1.617759, 1, 1, 1, 1, 1,
1.02059, 1.979909, -1.893946, 1, 1, 1, 1, 1,
1.021273, 1.244558, 2.319617, 1, 1, 1, 1, 1,
1.02795, -0.8311632, 3.309885, 1, 1, 1, 1, 1,
1.028994, -0.3921641, 0.252064, 1, 1, 1, 1, 1,
1.029959, 0.2266165, 1.388396, 1, 1, 1, 1, 1,
1.033404, -1.364403, 2.448885, 1, 1, 1, 1, 1,
1.042428, 0.0935677, -0.5128528, 1, 1, 1, 1, 1,
1.04279, -0.51523, 2.826462, 1, 1, 1, 1, 1,
1.050206, 0.6467432, 1.412552, 1, 1, 1, 1, 1,
1.058722, 0.01393376, -0.4011695, 1, 1, 1, 1, 1,
1.065212, 0.2676806, 0.7863901, 1, 1, 1, 1, 1,
1.06549, -0.412928, 3.276584, 1, 1, 1, 1, 1,
1.07044, 0.1073721, -0.587249, 1, 1, 1, 1, 1,
1.073482, -2.041945, 3.179575, 1, 1, 1, 1, 1,
1.075095, 1.174399, 1.616796, 0, 0, 1, 1, 1,
1.075771, -0.609615, 1.34441, 1, 0, 0, 1, 1,
1.08028, 1.744061, -0.6885043, 1, 0, 0, 1, 1,
1.080563, 0.1379946, 3.046745, 1, 0, 0, 1, 1,
1.088973, -1.111603, 3.212702, 1, 0, 0, 1, 1,
1.089508, -1.398296, 1.724757, 1, 0, 0, 1, 1,
1.10371, -0.889074, 3.063566, 0, 0, 0, 1, 1,
1.11008, 0.5298343, 1.254519, 0, 0, 0, 1, 1,
1.110866, -1.134402, 2.691254, 0, 0, 0, 1, 1,
1.116721, -0.2533186, 0.9981796, 0, 0, 0, 1, 1,
1.12122, 2.53439, 2.428561, 0, 0, 0, 1, 1,
1.12658, 0.28662, 3.187313, 0, 0, 0, 1, 1,
1.128667, 0.8940001, 0.1872905, 0, 0, 0, 1, 1,
1.139778, 0.05453896, 4.172848, 1, 1, 1, 1, 1,
1.140563, 0.4648166, 2.778601, 1, 1, 1, 1, 1,
1.149344, 1.425864, 2.312594, 1, 1, 1, 1, 1,
1.15687, -0.1434875, 0.7034709, 1, 1, 1, 1, 1,
1.1592, -1.618928, 4.625778, 1, 1, 1, 1, 1,
1.161231, -0.794552, 3.522932, 1, 1, 1, 1, 1,
1.165712, -0.04701279, 2.658546, 1, 1, 1, 1, 1,
1.179453, 1.131474, 1.204232, 1, 1, 1, 1, 1,
1.18353, -1.863942, 1.956275, 1, 1, 1, 1, 1,
1.18384, 0.6737484, 0.8291137, 1, 1, 1, 1, 1,
1.193543, 0.8091819, 0.9542476, 1, 1, 1, 1, 1,
1.196534, -1.003199, 2.209935, 1, 1, 1, 1, 1,
1.203194, 0.7200977, 2.428978, 1, 1, 1, 1, 1,
1.206412, -0.6898952, 2.201308, 1, 1, 1, 1, 1,
1.211673, -1.038337, 2.914525, 1, 1, 1, 1, 1,
1.227091, -1.080206, 1.896604, 0, 0, 1, 1, 1,
1.235044, 0.7056421, 2.256001, 1, 0, 0, 1, 1,
1.243185, -0.5142514, 1.86382, 1, 0, 0, 1, 1,
1.246565, 0.4181787, 0.1542103, 1, 0, 0, 1, 1,
1.260534, 0.4529246, 2.28612, 1, 0, 0, 1, 1,
1.261778, 0.03470457, 1.444282, 1, 0, 0, 1, 1,
1.265206, 0.03376441, 1.702047, 0, 0, 0, 1, 1,
1.266727, -1.753126, 4.171663, 0, 0, 0, 1, 1,
1.267756, 0.8022494, -0.5446811, 0, 0, 0, 1, 1,
1.271621, -1.481246, 2.243614, 0, 0, 0, 1, 1,
1.276145, -0.3959018, 1.428242, 0, 0, 0, 1, 1,
1.28939, 0.009593548, 1.421928, 0, 0, 0, 1, 1,
1.290311, 0.276272, 0.2777019, 0, 0, 0, 1, 1,
1.292607, 1.1554, -1.591873, 1, 1, 1, 1, 1,
1.294008, 1.161894, 1.395095, 1, 1, 1, 1, 1,
1.299677, -1.303317, 0.9406121, 1, 1, 1, 1, 1,
1.300881, 0.5937677, 0.9988359, 1, 1, 1, 1, 1,
1.301441, 0.6697144, -1.169738, 1, 1, 1, 1, 1,
1.302899, 0.4398649, 3.151438, 1, 1, 1, 1, 1,
1.305036, 1.798971, 0.4567572, 1, 1, 1, 1, 1,
1.313145, -0.6238749, 2.408046, 1, 1, 1, 1, 1,
1.322571, 0.2176515, 1.749556, 1, 1, 1, 1, 1,
1.354227, -0.5366282, 0.701628, 1, 1, 1, 1, 1,
1.35717, 0.6334903, 1.837462, 1, 1, 1, 1, 1,
1.363585, -0.5234724, 2.328705, 1, 1, 1, 1, 1,
1.375489, -0.7722563, 2.696564, 1, 1, 1, 1, 1,
1.377614, -0.5488767, 1.604213, 1, 1, 1, 1, 1,
1.394303, -1.218041, 0.992924, 1, 1, 1, 1, 1,
1.399735, -0.09140129, 0.6500197, 0, 0, 1, 1, 1,
1.404187, -1.503485, 2.316954, 1, 0, 0, 1, 1,
1.413956, -0.6466385, 2.621353, 1, 0, 0, 1, 1,
1.421411, 0.7983764, 1.799682, 1, 0, 0, 1, 1,
1.422526, -0.2530505, 1.484103, 1, 0, 0, 1, 1,
1.430791, 0.6664187, 2.266424, 1, 0, 0, 1, 1,
1.434373, 1.851494, -0.4414432, 0, 0, 0, 1, 1,
1.435215, -2.14207, 1.199174, 0, 0, 0, 1, 1,
1.449068, -0.1017665, 3.172869, 0, 0, 0, 1, 1,
1.460232, -0.07104084, 1.409119, 0, 0, 0, 1, 1,
1.479626, -0.4475851, 1.692601, 0, 0, 0, 1, 1,
1.482089, -0.57508, 1.273526, 0, 0, 0, 1, 1,
1.485372, -1.645348, 2.039896, 0, 0, 0, 1, 1,
1.492183, -1.398417, 2.995792, 1, 1, 1, 1, 1,
1.525768, -0.7300547, 0.6255381, 1, 1, 1, 1, 1,
1.529139, 0.8135415, 3.034338, 1, 1, 1, 1, 1,
1.537962, 0.3117071, 1.702557, 1, 1, 1, 1, 1,
1.53872, 1.007389, 0.6288073, 1, 1, 1, 1, 1,
1.540998, 0.843882, 0.8550881, 1, 1, 1, 1, 1,
1.553371, -0.1331085, -0.02642287, 1, 1, 1, 1, 1,
1.555984, 0.9113116, 1.11665, 1, 1, 1, 1, 1,
1.577465, 0.0899155, 1.977769, 1, 1, 1, 1, 1,
1.583194, 0.40924, 2.219646, 1, 1, 1, 1, 1,
1.590196, -1.656568, 0.9452335, 1, 1, 1, 1, 1,
1.607601, -0.817389, 3.030974, 1, 1, 1, 1, 1,
1.614637, 0.7603738, 3.105461, 1, 1, 1, 1, 1,
1.627471, 0.8601742, 0.631323, 1, 1, 1, 1, 1,
1.646366, 2.016501, -0.4951003, 1, 1, 1, 1, 1,
1.650721, 1.937998, 0.6259549, 0, 0, 1, 1, 1,
1.659532, -1.632899, 1.455764, 1, 0, 0, 1, 1,
1.661177, 0.9513237, 1.682554, 1, 0, 0, 1, 1,
1.666442, 0.2883556, 0.5980264, 1, 0, 0, 1, 1,
1.687328, 0.009319851, 2.096424, 1, 0, 0, 1, 1,
1.692725, 0.7405674, 0.8947666, 1, 0, 0, 1, 1,
1.697523, -1.716864, 2.707432, 0, 0, 0, 1, 1,
1.709678, 1.381719, 0.4596566, 0, 0, 0, 1, 1,
1.711719, 0.1601573, 2.218081, 0, 0, 0, 1, 1,
1.712568, -2.266901, 2.403606, 0, 0, 0, 1, 1,
1.714909, 0.6466259, 1.020381, 0, 0, 0, 1, 1,
1.728958, 0.1429649, 3.26912, 0, 0, 0, 1, 1,
1.744491, -1.164698, 4.651186, 0, 0, 0, 1, 1,
1.748357, 0.6478324, 1.717646, 1, 1, 1, 1, 1,
1.752649, -1.095819, 1.372249, 1, 1, 1, 1, 1,
1.755529, 1.028679, 1.862483, 1, 1, 1, 1, 1,
1.768885, 0.8934919, 3.325708, 1, 1, 1, 1, 1,
1.769131, 0.2741874, 1.97091, 1, 1, 1, 1, 1,
1.794661, 1.457029, 0.7135416, 1, 1, 1, 1, 1,
1.800598, 0.2903754, 3.531476, 1, 1, 1, 1, 1,
1.835294, 0.2076722, 2.076018, 1, 1, 1, 1, 1,
1.845966, 1.328373, 0.8222594, 1, 1, 1, 1, 1,
1.848052, 0.1808888, 0.1998218, 1, 1, 1, 1, 1,
1.848777, 0.01502944, 1.608364, 1, 1, 1, 1, 1,
1.858069, 0.5542646, 1.154953, 1, 1, 1, 1, 1,
1.868458, 1.745241, -0.4787613, 1, 1, 1, 1, 1,
1.903211, -1.111226, 1.896672, 1, 1, 1, 1, 1,
1.923993, -0.7492505, 2.130246, 1, 1, 1, 1, 1,
1.932075, 1.249107, 1.160194, 0, 0, 1, 1, 1,
2.017811, -1.257675, 2.313251, 1, 0, 0, 1, 1,
2.058191, -0.4427117, 3.5928, 1, 0, 0, 1, 1,
2.071522, -0.1210943, 3.593934, 1, 0, 0, 1, 1,
2.082158, -0.6125543, 2.506165, 1, 0, 0, 1, 1,
2.123853, 0.6384115, 1.204488, 1, 0, 0, 1, 1,
2.137907, -0.8122292, 1.615453, 0, 0, 0, 1, 1,
2.16464, 1.24374, 1.723093, 0, 0, 0, 1, 1,
2.178698, 0.4594245, 0.2431338, 0, 0, 0, 1, 1,
2.216309, -0.04175181, 1.269819, 0, 0, 0, 1, 1,
2.25887, 0.7459712, 1.862284, 0, 0, 0, 1, 1,
2.371979, 1.486219, 1.315953, 0, 0, 0, 1, 1,
2.459165, 0.221591, 0.554458, 0, 0, 0, 1, 1,
2.516537, 2.417573, 1.195482, 1, 1, 1, 1, 1,
2.651872, 0.5429988, 2.204487, 1, 1, 1, 1, 1,
2.843166, 0.5995374, 1.762221, 1, 1, 1, 1, 1,
2.944932, -1.949014, 2.963532, 1, 1, 1, 1, 1,
2.965499, -1.201322, 0.8959881, 1, 1, 1, 1, 1,
3.038627, 0.8789099, 0.001187944, 1, 1, 1, 1, 1,
3.162129, 0.5587755, -0.386325, 1, 1, 1, 1, 1
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
var radius = 9.631095;
var distance = 33.82882;
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
mvMatrix.translate( -0.2080855, -0.0375154, 0.1490328 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.82882);
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
