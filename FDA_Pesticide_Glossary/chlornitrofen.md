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
-2.925924, 0.08323029, 0.04141944, 1, 0, 0, 1,
-2.802074, 1.256616, -1.539862, 1, 0.007843138, 0, 1,
-2.6228, 0.09320007, -4.63616, 1, 0.01176471, 0, 1,
-2.61832, 0.05481837, -0.7440288, 1, 0.01960784, 0, 1,
-2.610974, -0.5025663, -0.5333292, 1, 0.02352941, 0, 1,
-2.558113, 1.662118, 0.1475693, 1, 0.03137255, 0, 1,
-2.547923, 2.531244, -1.423457, 1, 0.03529412, 0, 1,
-2.51642, 2.19967, -0.7181528, 1, 0.04313726, 0, 1,
-2.512999, 2.165066, -0.7073967, 1, 0.04705882, 0, 1,
-2.450063, -0.8898163, -2.812918, 1, 0.05490196, 0, 1,
-2.341926, -0.3238785, -1.12794, 1, 0.05882353, 0, 1,
-2.224954, 2.010221, -0.04550939, 1, 0.06666667, 0, 1,
-2.185507, 1.392961, -1.120194, 1, 0.07058824, 0, 1,
-2.184108, 0.3129037, -0.625482, 1, 0.07843138, 0, 1,
-2.047048, -1.365586, -0.3149728, 1, 0.08235294, 0, 1,
-2.032164, -1.36068, -2.182206, 1, 0.09019608, 0, 1,
-2.023799, -0.8906354, -1.158671, 1, 0.09411765, 0, 1,
-2.018661, 0.1734537, -2.099646, 1, 0.1019608, 0, 1,
-2.005859, -1.113243, -0.8647053, 1, 0.1098039, 0, 1,
-1.994362, -0.7906532, -2.41611, 1, 0.1137255, 0, 1,
-1.987092, -1.077336, -2.622216, 1, 0.1215686, 0, 1,
-1.969813, -0.1487028, -1.286896, 1, 0.1254902, 0, 1,
-1.954418, 0.8776922, -2.562727, 1, 0.1333333, 0, 1,
-1.937846, -0.4976932, -2.473583, 1, 0.1372549, 0, 1,
-1.907521, 0.5582504, -2.140891, 1, 0.145098, 0, 1,
-1.902769, -0.3471351, 1.099078, 1, 0.1490196, 0, 1,
-1.874055, -0.7261536, -1.873404, 1, 0.1568628, 0, 1,
-1.846827, -1.014734, -2.221457, 1, 0.1607843, 0, 1,
-1.839405, -2.223, -2.127168, 1, 0.1686275, 0, 1,
-1.815058, -1.009479, -4.529235, 1, 0.172549, 0, 1,
-1.814306, -0.03810665, -1.201354, 1, 0.1803922, 0, 1,
-1.79111, 0.03406295, -1.047687, 1, 0.1843137, 0, 1,
-1.761883, -0.396753, -3.154036, 1, 0.1921569, 0, 1,
-1.761155, -0.8342089, -1.566716, 1, 0.1960784, 0, 1,
-1.755117, -0.1796221, -1.78945, 1, 0.2039216, 0, 1,
-1.748585, -0.7744806, -3.502996, 1, 0.2117647, 0, 1,
-1.743294, 0.7894487, -1.603217, 1, 0.2156863, 0, 1,
-1.735188, -1.917563, -2.130915, 1, 0.2235294, 0, 1,
-1.720161, 2.31483, 0.008226303, 1, 0.227451, 0, 1,
-1.716311, -1.404699, -5.577966, 1, 0.2352941, 0, 1,
-1.704915, 0.1345418, -0.4821744, 1, 0.2392157, 0, 1,
-1.697518, 0.4392266, -0.1294994, 1, 0.2470588, 0, 1,
-1.692945, -1.116145, -2.883296, 1, 0.2509804, 0, 1,
-1.684984, 0.08804427, -2.070362, 1, 0.2588235, 0, 1,
-1.681688, 0.767067, -0.2782483, 1, 0.2627451, 0, 1,
-1.673412, 1.455235, -0.3667106, 1, 0.2705882, 0, 1,
-1.666846, 0.1949425, -2.343368, 1, 0.2745098, 0, 1,
-1.663971, 1.244407, -1.478103, 1, 0.282353, 0, 1,
-1.657275, -0.5272995, -1.041653, 1, 0.2862745, 0, 1,
-1.628623, -1.311503, -0.6965533, 1, 0.2941177, 0, 1,
-1.625259, -1.034203, -3.117969, 1, 0.3019608, 0, 1,
-1.618828, -0.9569877, -2.028873, 1, 0.3058824, 0, 1,
-1.617414, -1.032492, -1.555809, 1, 0.3137255, 0, 1,
-1.616468, -1.505679, -2.360291, 1, 0.3176471, 0, 1,
-1.613967, 1.040736, -0.9479074, 1, 0.3254902, 0, 1,
-1.605991, 0.8097148, -1.272834, 1, 0.3294118, 0, 1,
-1.597745, 0.6829147, -1.147466, 1, 0.3372549, 0, 1,
-1.590759, -1.057033, -0.7625365, 1, 0.3411765, 0, 1,
-1.569711, -0.3252826, -1.40195, 1, 0.3490196, 0, 1,
-1.559526, 2.217109, 0.3909199, 1, 0.3529412, 0, 1,
-1.542177, 1.070298, -1.029239, 1, 0.3607843, 0, 1,
-1.540425, -1.101921, -0.1158516, 1, 0.3647059, 0, 1,
-1.518447, -0.4525632, 0.1801312, 1, 0.372549, 0, 1,
-1.517708, 1.794734, 0.2810421, 1, 0.3764706, 0, 1,
-1.514197, -0.9586483, -2.586986, 1, 0.3843137, 0, 1,
-1.504969, -0.2421902, -1.491822, 1, 0.3882353, 0, 1,
-1.498177, -0.2969894, -2.222112, 1, 0.3960784, 0, 1,
-1.484014, 0.02231835, -3.034945, 1, 0.4039216, 0, 1,
-1.481814, 0.5379719, -1.794023, 1, 0.4078431, 0, 1,
-1.470445, 0.5459522, -1.941955, 1, 0.4156863, 0, 1,
-1.469441, -0.6387634, -1.38799, 1, 0.4196078, 0, 1,
-1.459605, 0.7896726, 0.6497813, 1, 0.427451, 0, 1,
-1.456886, 0.07455, -2.031985, 1, 0.4313726, 0, 1,
-1.450178, 0.5849848, -1.727626, 1, 0.4392157, 0, 1,
-1.443354, 0.6725963, -1.833947, 1, 0.4431373, 0, 1,
-1.431421, 0.3958977, -1.38318, 1, 0.4509804, 0, 1,
-1.421812, -0.2303536, -3.161646, 1, 0.454902, 0, 1,
-1.419498, -0.7225029, 0.06953779, 1, 0.4627451, 0, 1,
-1.410644, -0.08218711, -1.703837, 1, 0.4666667, 0, 1,
-1.407178, 0.5399129, 0.5905606, 1, 0.4745098, 0, 1,
-1.402031, -1.083686, -2.963245, 1, 0.4784314, 0, 1,
-1.396806, 0.3021767, -1.710703, 1, 0.4862745, 0, 1,
-1.392489, 0.7320912, -1.7539, 1, 0.4901961, 0, 1,
-1.391245, -0.05834191, -0.3660706, 1, 0.4980392, 0, 1,
-1.390976, 0.6449842, -0.5102474, 1, 0.5058824, 0, 1,
-1.388898, -0.11457, -2.287107, 1, 0.509804, 0, 1,
-1.374081, -0.04114047, -4.111048, 1, 0.5176471, 0, 1,
-1.371255, -0.4991988, -1.941118, 1, 0.5215687, 0, 1,
-1.371001, 1.483545, -2.481945, 1, 0.5294118, 0, 1,
-1.368151, -0.5352361, -1.090585, 1, 0.5333334, 0, 1,
-1.365368, -0.905751, -2.037169, 1, 0.5411765, 0, 1,
-1.350822, 0.3292063, 0.6472077, 1, 0.5450981, 0, 1,
-1.346256, -0.9281526, -1.92698, 1, 0.5529412, 0, 1,
-1.342561, -0.1140328, -3.284918, 1, 0.5568628, 0, 1,
-1.341795, 0.02150953, -1.417536, 1, 0.5647059, 0, 1,
-1.338133, -1.061835, -2.480711, 1, 0.5686275, 0, 1,
-1.334064, 1.461655, 0.7208337, 1, 0.5764706, 0, 1,
-1.333842, 1.309055, -0.921806, 1, 0.5803922, 0, 1,
-1.332089, 0.3227222, -0.05741005, 1, 0.5882353, 0, 1,
-1.325051, 0.3515759, -0.6937417, 1, 0.5921569, 0, 1,
-1.313402, -1.669584, -2.913208, 1, 0.6, 0, 1,
-1.30376, -0.002916428, -1.050057, 1, 0.6078432, 0, 1,
-1.303549, -0.7570307, 0.5884127, 1, 0.6117647, 0, 1,
-1.300486, -1.580298, -1.762457, 1, 0.6196079, 0, 1,
-1.293172, 0.8683646, -2.15433, 1, 0.6235294, 0, 1,
-1.288901, -2.872366, -2.835367, 1, 0.6313726, 0, 1,
-1.288279, -2.137159, -4.764753, 1, 0.6352941, 0, 1,
-1.278346, 1.059394, -2.303793, 1, 0.6431373, 0, 1,
-1.276588, -0.3365593, -0.8335466, 1, 0.6470588, 0, 1,
-1.269736, 0.1179798, -2.099134, 1, 0.654902, 0, 1,
-1.265864, 1.085868, -1.697841, 1, 0.6588235, 0, 1,
-1.261454, 0.8875847, 0.5589644, 1, 0.6666667, 0, 1,
-1.257398, 1.054999, -0.8448927, 1, 0.6705883, 0, 1,
-1.248023, 0.8390043, -0.4600535, 1, 0.6784314, 0, 1,
-1.237939, 0.869184, -0.3740535, 1, 0.682353, 0, 1,
-1.235696, -1.460337, -3.092238, 1, 0.6901961, 0, 1,
-1.233348, -1.221535, -1.953713, 1, 0.6941177, 0, 1,
-1.224128, -0.9724194, -0.9188671, 1, 0.7019608, 0, 1,
-1.224078, 0.4838941, -0.6616692, 1, 0.7098039, 0, 1,
-1.214236, -1.086399, -2.485109, 1, 0.7137255, 0, 1,
-1.213494, 0.1531684, -1.553629, 1, 0.7215686, 0, 1,
-1.210193, 1.593133, 0.3219557, 1, 0.7254902, 0, 1,
-1.201828, 0.8885486, -1.060156, 1, 0.7333333, 0, 1,
-1.192546, 0.2830318, -1.413692, 1, 0.7372549, 0, 1,
-1.192196, 1.331916, -0.4927925, 1, 0.7450981, 0, 1,
-1.18633, -1.465955, -3.380543, 1, 0.7490196, 0, 1,
-1.185848, 0.4766918, -0.6619592, 1, 0.7568628, 0, 1,
-1.176202, 1.133002, -0.4352501, 1, 0.7607843, 0, 1,
-1.168369, 1.079518, -0.9620588, 1, 0.7686275, 0, 1,
-1.165571, 0.2360032, -0.7504542, 1, 0.772549, 0, 1,
-1.151063, -1.993902, -3.771841, 1, 0.7803922, 0, 1,
-1.149409, 0.5381222, -2.363654, 1, 0.7843137, 0, 1,
-1.144857, 0.6844908, -1.111867, 1, 0.7921569, 0, 1,
-1.144685, 0.0184796, -1.49515, 1, 0.7960784, 0, 1,
-1.131203, -0.6539117, -3.5344, 1, 0.8039216, 0, 1,
-1.130826, 0.2932225, -0.9690824, 1, 0.8117647, 0, 1,
-1.128376, -0.194602, -3.333595, 1, 0.8156863, 0, 1,
-1.119348, -0.01328414, -0.1062557, 1, 0.8235294, 0, 1,
-1.118757, -0.5361616, -2.776554, 1, 0.827451, 0, 1,
-1.109581, -1.452323, -1.17306, 1, 0.8352941, 0, 1,
-1.10692, -1.167284, -2.358406, 1, 0.8392157, 0, 1,
-1.10612, -1.028929, -1.409641, 1, 0.8470588, 0, 1,
-1.104149, 1.160388, -2.159175, 1, 0.8509804, 0, 1,
-1.100317, 1.211869, 0.07384857, 1, 0.8588235, 0, 1,
-1.093855, -0.4987385, -1.806148, 1, 0.8627451, 0, 1,
-1.093603, 0.8936037, 0.8045112, 1, 0.8705882, 0, 1,
-1.090884, 0.5140625, -1.390579, 1, 0.8745098, 0, 1,
-1.090427, 0.2006877, -1.506433, 1, 0.8823529, 0, 1,
-1.088761, 1.085074, 0.3066375, 1, 0.8862745, 0, 1,
-1.08812, 0.4725538, -1.938705, 1, 0.8941177, 0, 1,
-1.08394, -0.8926701, -2.341187, 1, 0.8980392, 0, 1,
-1.077658, 1.471312, -0.8913887, 1, 0.9058824, 0, 1,
-1.077388, 0.2640966, -0.7959239, 1, 0.9137255, 0, 1,
-1.064863, -2.448728, -3.697931, 1, 0.9176471, 0, 1,
-1.062829, -1.031292, -1.323144, 1, 0.9254902, 0, 1,
-1.054231, 1.279593, 0.9045461, 1, 0.9294118, 0, 1,
-1.052767, -1.559306, -0.4871373, 1, 0.9372549, 0, 1,
-1.050992, -1.848758, -0.4682657, 1, 0.9411765, 0, 1,
-1.050605, 0.9013877, -0.9730989, 1, 0.9490196, 0, 1,
-1.045504, 0.741087, -1.195605, 1, 0.9529412, 0, 1,
-1.043274, 0.06475825, -0.1978385, 1, 0.9607843, 0, 1,
-1.041047, 0.5293814, -0.7148946, 1, 0.9647059, 0, 1,
-1.039928, -0.1922413, -1.276083, 1, 0.972549, 0, 1,
-1.033616, -0.56167, -2.765028, 1, 0.9764706, 0, 1,
-1.015359, -0.8577918, -3.526705, 1, 0.9843137, 0, 1,
-1.013271, 0.2042588, -0.1664098, 1, 0.9882353, 0, 1,
-1.009158, 0.6960827, 0.8927612, 1, 0.9960784, 0, 1,
-1.007663, 1.221818, -1.845024, 0.9960784, 1, 0, 1,
-1.001683, -0.5167857, -1.357537, 0.9921569, 1, 0, 1,
-0.9994034, -0.3067201, -2.480395, 0.9843137, 1, 0, 1,
-0.9946155, -0.5646114, -2.515659, 0.9803922, 1, 0, 1,
-0.9942524, -1.558445, -5.634032, 0.972549, 1, 0, 1,
-0.9936478, 1.67041, -1.136755, 0.9686275, 1, 0, 1,
-0.9902056, 1.780337, -0.9093772, 0.9607843, 1, 0, 1,
-0.9892111, -0.6712222, -2.200062, 0.9568627, 1, 0, 1,
-0.9871457, -0.3026515, -0.615063, 0.9490196, 1, 0, 1,
-0.985128, -0.6291182, -1.727806, 0.945098, 1, 0, 1,
-0.9821498, -0.5639345, -2.124219, 0.9372549, 1, 0, 1,
-0.9754531, 0.7487468, -0.6438378, 0.9333333, 1, 0, 1,
-0.9743885, 1.299134, -1.306619, 0.9254902, 1, 0, 1,
-0.9719412, 1.118887, 0.6405618, 0.9215686, 1, 0, 1,
-0.9712951, -0.9182263, -2.468444, 0.9137255, 1, 0, 1,
-0.9669438, -0.3388692, -1.242513, 0.9098039, 1, 0, 1,
-0.9594339, 0.1531996, -2.228737, 0.9019608, 1, 0, 1,
-0.9396765, -1.365107, -3.12661, 0.8941177, 1, 0, 1,
-0.939635, -0.5243641, -0.9341246, 0.8901961, 1, 0, 1,
-0.9340553, -0.1226612, -1.764668, 0.8823529, 1, 0, 1,
-0.912973, -0.5842301, -2.544106, 0.8784314, 1, 0, 1,
-0.9120542, -0.183293, -1.133813, 0.8705882, 1, 0, 1,
-0.9035195, 1.926243, -0.8362374, 0.8666667, 1, 0, 1,
-0.8990591, -0.5349432, -1.602485, 0.8588235, 1, 0, 1,
-0.8959833, -0.9820176, -2.689654, 0.854902, 1, 0, 1,
-0.8882975, -0.1400906, -2.055172, 0.8470588, 1, 0, 1,
-0.8872031, -1.420541, -2.739317, 0.8431373, 1, 0, 1,
-0.8867023, 0.9849788, 0.7316287, 0.8352941, 1, 0, 1,
-0.881248, -2.432368, -4.059007, 0.8313726, 1, 0, 1,
-0.8652355, 0.8305609, -1.128701, 0.8235294, 1, 0, 1,
-0.8615398, -0.9733057, -4.246292, 0.8196079, 1, 0, 1,
-0.8594998, -0.3175044, -3.385747, 0.8117647, 1, 0, 1,
-0.8542837, 0.1380419, -1.658365, 0.8078431, 1, 0, 1,
-0.8533713, -0.9943172, -1.907837, 0.8, 1, 0, 1,
-0.8372366, 0.8926507, 0.7639713, 0.7921569, 1, 0, 1,
-0.832287, -2.000362, -1.604011, 0.7882353, 1, 0, 1,
-0.8316364, 0.1812191, -2.387075, 0.7803922, 1, 0, 1,
-0.8298051, 0.2861906, -0.8521972, 0.7764706, 1, 0, 1,
-0.826547, -0.5554606, -4.273066, 0.7686275, 1, 0, 1,
-0.8190356, -0.2289567, -1.8446, 0.7647059, 1, 0, 1,
-0.814674, -0.05860128, -2.151463, 0.7568628, 1, 0, 1,
-0.808886, 1.872792, 0.5194731, 0.7529412, 1, 0, 1,
-0.8061205, -1.184439, -1.716829, 0.7450981, 1, 0, 1,
-0.8060358, -0.5694954, -2.404552, 0.7411765, 1, 0, 1,
-0.8050971, 0.1036447, -1.790561, 0.7333333, 1, 0, 1,
-0.7962969, -0.8148595, -3.759968, 0.7294118, 1, 0, 1,
-0.7949556, -1.220572, -3.290959, 0.7215686, 1, 0, 1,
-0.7899466, -0.6745262, -1.447874, 0.7176471, 1, 0, 1,
-0.7884936, 0.2353367, -0.3427974, 0.7098039, 1, 0, 1,
-0.7880685, -0.7801002, -0.06275494, 0.7058824, 1, 0, 1,
-0.7870949, -0.5864809, -2.282779, 0.6980392, 1, 0, 1,
-0.7869877, 0.5561842, -3.02036, 0.6901961, 1, 0, 1,
-0.7824635, -0.9138159, -4.120854, 0.6862745, 1, 0, 1,
-0.7757068, 0.588195, -2.301404, 0.6784314, 1, 0, 1,
-0.77012, 0.1365684, -0.5309286, 0.6745098, 1, 0, 1,
-0.7685412, 1.4584, -0.6999336, 0.6666667, 1, 0, 1,
-0.7652728, 1.716688, -1.443891, 0.6627451, 1, 0, 1,
-0.7629899, 0.2085441, 0.5622907, 0.654902, 1, 0, 1,
-0.7582586, -0.2130951, -1.5405, 0.6509804, 1, 0, 1,
-0.7562012, 1.245584, -1.289849, 0.6431373, 1, 0, 1,
-0.7532367, -0.7141593, -3.068537, 0.6392157, 1, 0, 1,
-0.7517713, -0.3039484, -2.35063, 0.6313726, 1, 0, 1,
-0.7500113, -0.2660786, -2.570805, 0.627451, 1, 0, 1,
-0.7471309, -0.160428, -2.27709, 0.6196079, 1, 0, 1,
-0.7470397, 1.124028, -0.8252924, 0.6156863, 1, 0, 1,
-0.7461164, 1.056178, 0.1931536, 0.6078432, 1, 0, 1,
-0.7424526, -0.8976992, -2.001599, 0.6039216, 1, 0, 1,
-0.7410625, -2.40087, -4.256518, 0.5960785, 1, 0, 1,
-0.7294311, 1.238894, -0.04683167, 0.5882353, 1, 0, 1,
-0.7292386, 1.258506, -0.4561515, 0.5843138, 1, 0, 1,
-0.7289523, 0.09311979, -1.090602, 0.5764706, 1, 0, 1,
-0.7264466, -0.6159655, -2.168834, 0.572549, 1, 0, 1,
-0.7193753, -0.4895812, -3.216983, 0.5647059, 1, 0, 1,
-0.7188699, -0.314935, -3.633198, 0.5607843, 1, 0, 1,
-0.7167892, -0.1891408, -1.889595, 0.5529412, 1, 0, 1,
-0.71327, 0.2075769, -0.8143384, 0.5490196, 1, 0, 1,
-0.712409, 0.1602358, -0.6827711, 0.5411765, 1, 0, 1,
-0.7095839, 0.5249146, -0.1876521, 0.5372549, 1, 0, 1,
-0.7060341, 0.9886902, -0.7540754, 0.5294118, 1, 0, 1,
-0.6961085, 0.9304477, -0.8823878, 0.5254902, 1, 0, 1,
-0.6957173, -0.6452835, -1.870027, 0.5176471, 1, 0, 1,
-0.6935924, 0.7892702, -1.825924, 0.5137255, 1, 0, 1,
-0.6925203, -0.4718742, -2.749239, 0.5058824, 1, 0, 1,
-0.6918089, -0.4913991, -1.553888, 0.5019608, 1, 0, 1,
-0.6880933, 0.7061234, -0.9897547, 0.4941176, 1, 0, 1,
-0.6728035, -0.3385138, -2.193369, 0.4862745, 1, 0, 1,
-0.6709272, -1.615597, -3.136335, 0.4823529, 1, 0, 1,
-0.6703966, -0.4721379, -2.234282, 0.4745098, 1, 0, 1,
-0.668191, 1.559512, -1.768869, 0.4705882, 1, 0, 1,
-0.6672192, -1.058063, -1.10814, 0.4627451, 1, 0, 1,
-0.6645897, -1.228917, -1.521832, 0.4588235, 1, 0, 1,
-0.6628357, -0.05632179, -2.054839, 0.4509804, 1, 0, 1,
-0.6611155, 1.410354, -0.6861944, 0.4470588, 1, 0, 1,
-0.6598276, -0.7478951, -3.492835, 0.4392157, 1, 0, 1,
-0.6522675, 0.0440091, -2.675465, 0.4352941, 1, 0, 1,
-0.6505, -2.251969, -3.555581, 0.427451, 1, 0, 1,
-0.648712, 0.2634907, -0.7032993, 0.4235294, 1, 0, 1,
-0.6448647, 1.062107, -1.04243, 0.4156863, 1, 0, 1,
-0.6414906, 0.2863057, -1.798753, 0.4117647, 1, 0, 1,
-0.6319474, 0.1267068, 0.05350863, 0.4039216, 1, 0, 1,
-0.6230959, -0.4785417, -1.179361, 0.3960784, 1, 0, 1,
-0.6200996, -0.21644, -1.366581, 0.3921569, 1, 0, 1,
-0.6182888, -0.0698954, -0.5556985, 0.3843137, 1, 0, 1,
-0.6167585, -1.232194, -1.355549, 0.3803922, 1, 0, 1,
-0.6141918, -3.043303, -3.179917, 0.372549, 1, 0, 1,
-0.612149, 1.457496, 0.1302755, 0.3686275, 1, 0, 1,
-0.6096628, -0.7209691, -3.179133, 0.3607843, 1, 0, 1,
-0.6057071, -1.972652, -2.20061, 0.3568628, 1, 0, 1,
-0.6026942, 0.4801104, 1.616161, 0.3490196, 1, 0, 1,
-0.6017278, -0.2481107, -0.9007266, 0.345098, 1, 0, 1,
-0.6011667, 0.786475, -1.412504, 0.3372549, 1, 0, 1,
-0.6002582, -0.5791201, -0.7255322, 0.3333333, 1, 0, 1,
-0.5974467, 1.556462, -1.15895, 0.3254902, 1, 0, 1,
-0.5958749, -1.367668, -3.116869, 0.3215686, 1, 0, 1,
-0.5940863, -0.6724261, -3.356066, 0.3137255, 1, 0, 1,
-0.593919, -1.54838, -2.4437, 0.3098039, 1, 0, 1,
-0.5935594, 0.9385189, -1.960893, 0.3019608, 1, 0, 1,
-0.5879047, 1.653515, 1.2054, 0.2941177, 1, 0, 1,
-0.5872046, -0.9397866, -2.619679, 0.2901961, 1, 0, 1,
-0.5843024, -0.6932891, -3.148134, 0.282353, 1, 0, 1,
-0.5797481, 0.6508027, -2.252007, 0.2784314, 1, 0, 1,
-0.57695, -1.1313, -3.385044, 0.2705882, 1, 0, 1,
-0.5744939, 0.5229433, -1.681911, 0.2666667, 1, 0, 1,
-0.5744179, -0.1514004, -1.947272, 0.2588235, 1, 0, 1,
-0.5743929, -0.7938303, -3.033717, 0.254902, 1, 0, 1,
-0.569793, 1.381075, -0.4142037, 0.2470588, 1, 0, 1,
-0.5657746, 1.695273, -0.347185, 0.2431373, 1, 0, 1,
-0.5575927, 1.145852, -0.2558121, 0.2352941, 1, 0, 1,
-0.5536307, -0.7986439, -3.851277, 0.2313726, 1, 0, 1,
-0.5520601, -0.2385429, -3.298755, 0.2235294, 1, 0, 1,
-0.5499499, -0.08047603, -3.529716, 0.2196078, 1, 0, 1,
-0.5498567, 0.9662096, -1.614656, 0.2117647, 1, 0, 1,
-0.5495897, -0.881789, -3.962579, 0.2078431, 1, 0, 1,
-0.5478535, 1.107946, -1.997249, 0.2, 1, 0, 1,
-0.5450252, 0.7135747, -0.3433899, 0.1921569, 1, 0, 1,
-0.5431818, 0.5719875, -1.435268, 0.1882353, 1, 0, 1,
-0.542625, -1.110084, -3.193121, 0.1803922, 1, 0, 1,
-0.5407062, -0.3471028, -2.529307, 0.1764706, 1, 0, 1,
-0.5348324, 1.579104, 0.7250717, 0.1686275, 1, 0, 1,
-0.5264827, -1.970225, -3.615624, 0.1647059, 1, 0, 1,
-0.5234215, -0.6294461, -2.371842, 0.1568628, 1, 0, 1,
-0.5187535, -0.2958414, -0.04275706, 0.1529412, 1, 0, 1,
-0.5103769, -2.126087, -3.027132, 0.145098, 1, 0, 1,
-0.5085285, -1.281239, -5.149068, 0.1411765, 1, 0, 1,
-0.5083979, 0.661375, 0.770663, 0.1333333, 1, 0, 1,
-0.5054828, 0.7981715, 0.2744512, 0.1294118, 1, 0, 1,
-0.4976205, -0.7089248, -3.091976, 0.1215686, 1, 0, 1,
-0.4913992, -0.8588917, -3.429956, 0.1176471, 1, 0, 1,
-0.490566, 1.745204, -0.4135121, 0.1098039, 1, 0, 1,
-0.4894073, 0.1691172, -1.88899, 0.1058824, 1, 0, 1,
-0.4864405, -1.730611, -2.503667, 0.09803922, 1, 0, 1,
-0.4826014, -0.5981087, -2.618017, 0.09019608, 1, 0, 1,
-0.4729158, 0.5508392, -0.02790256, 0.08627451, 1, 0, 1,
-0.4724917, 3.230279, -0.840388, 0.07843138, 1, 0, 1,
-0.469335, -0.8404488, -2.302172, 0.07450981, 1, 0, 1,
-0.4653002, -2.051234, -3.094575, 0.06666667, 1, 0, 1,
-0.4630195, -0.5630112, -1.700925, 0.0627451, 1, 0, 1,
-0.4608796, -0.2077681, -0.7302592, 0.05490196, 1, 0, 1,
-0.4583819, 1.458549, -0.8522702, 0.05098039, 1, 0, 1,
-0.4565071, -0.09548288, -1.448878, 0.04313726, 1, 0, 1,
-0.4544758, -0.3131698, -1.685761, 0.03921569, 1, 0, 1,
-0.4533077, 0.07788736, -1.335196, 0.03137255, 1, 0, 1,
-0.4450228, -1.327478, -2.893034, 0.02745098, 1, 0, 1,
-0.4437374, -0.04631142, -1.423943, 0.01960784, 1, 0, 1,
-0.4370002, -0.168031, -0.3512024, 0.01568628, 1, 0, 1,
-0.4359937, 0.5931528, -0.8363456, 0.007843138, 1, 0, 1,
-0.4339212, 0.4726132, -1.403789, 0.003921569, 1, 0, 1,
-0.4280299, 1.795691, -0.7581487, 0, 1, 0.003921569, 1,
-0.426615, -0.06489683, -2.975182, 0, 1, 0.01176471, 1,
-0.4226113, 0.5759075, 0.00524575, 0, 1, 0.01568628, 1,
-0.4178753, -1.155677, -2.895626, 0, 1, 0.02352941, 1,
-0.4159355, -0.7096535, -1.26688, 0, 1, 0.02745098, 1,
-0.4136564, -0.3434524, -0.9149228, 0, 1, 0.03529412, 1,
-0.4119688, -0.2952261, -2.422083, 0, 1, 0.03921569, 1,
-0.4115599, -0.5783453, -2.150573, 0, 1, 0.04705882, 1,
-0.4108864, -2.064238, -4.311567, 0, 1, 0.05098039, 1,
-0.4082055, 1.784438, 0.4457729, 0, 1, 0.05882353, 1,
-0.4038138, 0.9469518, -0.7351213, 0, 1, 0.0627451, 1,
-0.4007576, 0.516271, 0.6769792, 0, 1, 0.07058824, 1,
-0.3982069, -0.03978476, -0.9835006, 0, 1, 0.07450981, 1,
-0.3967487, -0.6168696, -1.948796, 0, 1, 0.08235294, 1,
-0.3913646, 0.319183, -2.170015, 0, 1, 0.08627451, 1,
-0.3846989, 1.328984, 0.5266258, 0, 1, 0.09411765, 1,
-0.3840107, 1.786515, -0.04564276, 0, 1, 0.1019608, 1,
-0.3822098, -0.2123997, -2.614271, 0, 1, 0.1058824, 1,
-0.3815922, -0.03921148, -1.78895, 0, 1, 0.1137255, 1,
-0.3793415, -1.896599, -3.053254, 0, 1, 0.1176471, 1,
-0.3771178, 0.6391742, -0.478525, 0, 1, 0.1254902, 1,
-0.3765657, -0.2615764, -4.03284, 0, 1, 0.1294118, 1,
-0.3738491, 0.8210819, -0.4329605, 0, 1, 0.1372549, 1,
-0.3710502, 0.3347898, 0.04310413, 0, 1, 0.1411765, 1,
-0.3705262, 0.06829124, -1.793947, 0, 1, 0.1490196, 1,
-0.3701377, -0.6735484, -2.880675, 0, 1, 0.1529412, 1,
-0.3641846, -0.4135631, -2.936338, 0, 1, 0.1607843, 1,
-0.3634892, -0.3524643, -1.565197, 0, 1, 0.1647059, 1,
-0.3613305, -0.3592028, -2.56015, 0, 1, 0.172549, 1,
-0.3583026, 0.8260214, -0.4223026, 0, 1, 0.1764706, 1,
-0.3562387, -0.5677227, -1.578122, 0, 1, 0.1843137, 1,
-0.3547105, 0.5594569, 0.6033304, 0, 1, 0.1882353, 1,
-0.3539874, -0.8935391, -3.593709, 0, 1, 0.1960784, 1,
-0.3529273, -1.989037, -2.829838, 0, 1, 0.2039216, 1,
-0.3528433, 1.07456, -0.09689212, 0, 1, 0.2078431, 1,
-0.3528214, 0.3454472, -1.829057, 0, 1, 0.2156863, 1,
-0.3482035, -0.4501858, -3.428416, 0, 1, 0.2196078, 1,
-0.3434007, 0.3041157, -1.543005, 0, 1, 0.227451, 1,
-0.3424397, -0.186699, -2.783871, 0, 1, 0.2313726, 1,
-0.335889, -1.509, -4.946104, 0, 1, 0.2392157, 1,
-0.3336632, -0.1772712, -1.712736, 0, 1, 0.2431373, 1,
-0.3318529, -0.48161, -2.483153, 0, 1, 0.2509804, 1,
-0.3313344, -2.578386, -2.51152, 0, 1, 0.254902, 1,
-0.3292423, 1.521022, 0.1610881, 0, 1, 0.2627451, 1,
-0.3277505, -0.1697441, -2.578698, 0, 1, 0.2666667, 1,
-0.3273674, -1.006805, -2.850736, 0, 1, 0.2745098, 1,
-0.3229046, -0.5461199, -2.378457, 0, 1, 0.2784314, 1,
-0.3108644, 2.031314, -0.8869531, 0, 1, 0.2862745, 1,
-0.3093543, -0.298566, -1.686586, 0, 1, 0.2901961, 1,
-0.3066473, -0.3105624, -1.256398, 0, 1, 0.2980392, 1,
-0.3064972, -1.189291, -1.599557, 0, 1, 0.3058824, 1,
-0.3047348, 0.5058482, -2.41851, 0, 1, 0.3098039, 1,
-0.3037457, 0.2423989, -0.4149136, 0, 1, 0.3176471, 1,
-0.2999289, -0.1337285, -3.191601, 0, 1, 0.3215686, 1,
-0.2993653, 0.6178789, -0.7008423, 0, 1, 0.3294118, 1,
-0.2956827, -1.23232, -3.446397, 0, 1, 0.3333333, 1,
-0.2955898, 0.3099481, 0.2151902, 0, 1, 0.3411765, 1,
-0.2946137, 0.006057807, -1.925592, 0, 1, 0.345098, 1,
-0.2871095, -1.441285, -2.603207, 0, 1, 0.3529412, 1,
-0.2857243, -0.5686633, -2.480643, 0, 1, 0.3568628, 1,
-0.2855999, -0.5386646, -1.605907, 0, 1, 0.3647059, 1,
-0.282537, 0.7073049, -2.064233, 0, 1, 0.3686275, 1,
-0.2812295, 0.8597056, -1.161947, 0, 1, 0.3764706, 1,
-0.2809847, 0.9184052, 0.9604648, 0, 1, 0.3803922, 1,
-0.280709, 1.601147, -2.463715, 0, 1, 0.3882353, 1,
-0.279939, 0.4229532, -1.543395, 0, 1, 0.3921569, 1,
-0.27805, 1.23526, 1.13914, 0, 1, 0.4, 1,
-0.2668714, -1.184602, -2.725301, 0, 1, 0.4078431, 1,
-0.2654973, -0.8843573, -3.955426, 0, 1, 0.4117647, 1,
-0.2644777, 0.6831952, -1.03252, 0, 1, 0.4196078, 1,
-0.2638724, 0.5077553, -1.127515, 0, 1, 0.4235294, 1,
-0.263577, -0.2169562, -1.541182, 0, 1, 0.4313726, 1,
-0.2617785, 0.1701078, -0.7082946, 0, 1, 0.4352941, 1,
-0.2549759, 0.3165661, -1.978911, 0, 1, 0.4431373, 1,
-0.2534162, 0.6841462, 1.124629, 0, 1, 0.4470588, 1,
-0.2510027, 1.92666, -0.5601017, 0, 1, 0.454902, 1,
-0.2386729, 0.3947016, -0.7329091, 0, 1, 0.4588235, 1,
-0.2386441, -0.1823986, -2.053412, 0, 1, 0.4666667, 1,
-0.2378996, 1.51704, -1.149406, 0, 1, 0.4705882, 1,
-0.2360264, -0.8544101, -2.983533, 0, 1, 0.4784314, 1,
-0.2282884, 0.2859536, 0.3308183, 0, 1, 0.4823529, 1,
-0.2275813, 0.3596373, -0.5091957, 0, 1, 0.4901961, 1,
-0.2245153, 0.9505527, -0.4473785, 0, 1, 0.4941176, 1,
-0.2218004, 2.084199, -1.344434, 0, 1, 0.5019608, 1,
-0.2204553, -0.09494884, -0.5771022, 0, 1, 0.509804, 1,
-0.2167314, -0.3488229, -1.90026, 0, 1, 0.5137255, 1,
-0.2142403, -0.2136245, -1.817936, 0, 1, 0.5215687, 1,
-0.2138477, 0.736388, 0.8209044, 0, 1, 0.5254902, 1,
-0.2038826, -0.6337351, -2.55401, 0, 1, 0.5333334, 1,
-0.2029045, 1.753428, -1.264154, 0, 1, 0.5372549, 1,
-0.2004217, 0.4692793, -0.6747958, 0, 1, 0.5450981, 1,
-0.2003991, 0.6152242, -1.034745, 0, 1, 0.5490196, 1,
-0.1999289, 0.7664126, -0.2917661, 0, 1, 0.5568628, 1,
-0.1971138, -0.4224501, -4.411214, 0, 1, 0.5607843, 1,
-0.1942334, 0.6644799, 0.3885207, 0, 1, 0.5686275, 1,
-0.1941279, -0.1071215, -2.822248, 0, 1, 0.572549, 1,
-0.1933865, 0.3058414, 2.141045, 0, 1, 0.5803922, 1,
-0.1910751, -0.7024097, -0.7068173, 0, 1, 0.5843138, 1,
-0.1842858, 0.1317297, -1.522661, 0, 1, 0.5921569, 1,
-0.1839327, 0.099354, -1.57717, 0, 1, 0.5960785, 1,
-0.1833495, 0.5936619, 0.988261, 0, 1, 0.6039216, 1,
-0.1831019, -0.2834644, -2.673256, 0, 1, 0.6117647, 1,
-0.1823159, 0.03665871, -0.8684529, 0, 1, 0.6156863, 1,
-0.1734028, -0.3716905, -2.581555, 0, 1, 0.6235294, 1,
-0.1665401, 0.06970878, -1.907529, 0, 1, 0.627451, 1,
-0.1644672, 1.310152, -1.22567, 0, 1, 0.6352941, 1,
-0.1346333, -0.7265146, -2.968285, 0, 1, 0.6392157, 1,
-0.1341392, 0.8189292, 0.5668246, 0, 1, 0.6470588, 1,
-0.1294595, 1.072027, 0.7520939, 0, 1, 0.6509804, 1,
-0.1287001, 0.633196, 0.1236385, 0, 1, 0.6588235, 1,
-0.1280919, -0.9120936, -1.928965, 0, 1, 0.6627451, 1,
-0.1210478, 1.300206, -0.08018246, 0, 1, 0.6705883, 1,
-0.1156649, -2.347159, -3.42886, 0, 1, 0.6745098, 1,
-0.1115521, 3.470783, 0.6073362, 0, 1, 0.682353, 1,
-0.1088645, -0.6046495, -1.12513, 0, 1, 0.6862745, 1,
-0.1083223, -1.228582, -5.88984, 0, 1, 0.6941177, 1,
-0.1008777, -0.5342444, -5.551634, 0, 1, 0.7019608, 1,
-0.09729514, -0.8128731, -2.911551, 0, 1, 0.7058824, 1,
-0.09684272, -0.8123987, -2.765381, 0, 1, 0.7137255, 1,
-0.09305408, 0.6321309, 1.221825, 0, 1, 0.7176471, 1,
-0.08427309, -0.4971404, -1.892274, 0, 1, 0.7254902, 1,
-0.08206728, -0.7690738, -2.073099, 0, 1, 0.7294118, 1,
-0.08073201, -0.5886641, -2.949602, 0, 1, 0.7372549, 1,
-0.08011185, -0.1870012, -2.009444, 0, 1, 0.7411765, 1,
-0.08007417, -0.09242665, -3.17845, 0, 1, 0.7490196, 1,
-0.07953055, 0.7438309, 1.162066, 0, 1, 0.7529412, 1,
-0.07602046, -1.146301, -3.315565, 0, 1, 0.7607843, 1,
-0.07313986, 0.397475, 0.6660793, 0, 1, 0.7647059, 1,
-0.07192947, 0.9208904, -0.5696369, 0, 1, 0.772549, 1,
-0.07086986, -0.07224097, -3.725793, 0, 1, 0.7764706, 1,
-0.06323423, -0.4090339, -3.257017, 0, 1, 0.7843137, 1,
-0.0623449, -1.833174, -3.382658, 0, 1, 0.7882353, 1,
-0.05242906, 0.3741307, -0.5815904, 0, 1, 0.7960784, 1,
-0.04848832, 0.1916333, -1.462749, 0, 1, 0.8039216, 1,
-0.04236681, -0.4646631, -2.200499, 0, 1, 0.8078431, 1,
-0.04040805, 1.589976, 0.4492198, 0, 1, 0.8156863, 1,
-0.03941064, -0.1784003, -3.957063, 0, 1, 0.8196079, 1,
-0.03103693, 1.308367, -0.2839074, 0, 1, 0.827451, 1,
-0.02663964, -1.279145, -3.709312, 0, 1, 0.8313726, 1,
-0.02289852, 1.754299, 1.075952, 0, 1, 0.8392157, 1,
-0.01875711, 1.034685, -0.9727916, 0, 1, 0.8431373, 1,
-0.01838978, 0.345178, -0.8982176, 0, 1, 0.8509804, 1,
-0.01741131, 0.00259797, -1.978881, 0, 1, 0.854902, 1,
-0.01632237, 0.1849545, 0.3111112, 0, 1, 0.8627451, 1,
-0.0159128, -1.83928, -3.389264, 0, 1, 0.8666667, 1,
-0.01461767, 0.8133656, -2.385512, 0, 1, 0.8745098, 1,
-0.01164192, 0.1615005, 0.4721535, 0, 1, 0.8784314, 1,
-0.003904156, -0.3859285, -5.675628, 0, 1, 0.8862745, 1,
-0.003482336, 0.6839212, -2.109717, 0, 1, 0.8901961, 1,
-0.002999771, 1.04501, -0.8444715, 0, 1, 0.8980392, 1,
0.000607254, 0.3530067, -1.738213, 0, 1, 0.9058824, 1,
0.008162056, 1.61501, 1.582186, 0, 1, 0.9098039, 1,
0.008624636, 0.2134709, -1.272686, 0, 1, 0.9176471, 1,
0.01482615, 0.3136745, 0.6406269, 0, 1, 0.9215686, 1,
0.01743373, 0.8020159, 0.3028302, 0, 1, 0.9294118, 1,
0.02129631, 0.6645026, -0.8154253, 0, 1, 0.9333333, 1,
0.02307981, 0.7936571, 0.439377, 0, 1, 0.9411765, 1,
0.02776498, 0.3820556, -1.120886, 0, 1, 0.945098, 1,
0.02905405, -0.1195062, 2.824192, 0, 1, 0.9529412, 1,
0.03205953, -0.7802521, 2.864182, 0, 1, 0.9568627, 1,
0.03286021, -1.123201, 2.611033, 0, 1, 0.9647059, 1,
0.03317625, -1.096178, 4.488001, 0, 1, 0.9686275, 1,
0.03441458, 0.2081453, 0.3246331, 0, 1, 0.9764706, 1,
0.03884734, -1.005492, 4.998381, 0, 1, 0.9803922, 1,
0.03919728, -0.9593219, 3.968439, 0, 1, 0.9882353, 1,
0.04630341, -0.3009255, 2.694908, 0, 1, 0.9921569, 1,
0.04730451, -0.7121074, 2.160361, 0, 1, 1, 1,
0.04874472, 0.8453903, 0.07360059, 0, 0.9921569, 1, 1,
0.04928541, -1.328557, 3.244636, 0, 0.9882353, 1, 1,
0.05198117, -1.311534, 1.917225, 0, 0.9803922, 1, 1,
0.0537109, -0.3202917, 4.858369, 0, 0.9764706, 1, 1,
0.05586923, 0.9970948, 0.8145068, 0, 0.9686275, 1, 1,
0.05604655, -1.8941, 2.408875, 0, 0.9647059, 1, 1,
0.05886827, 0.3825167, 0.5087336, 0, 0.9568627, 1, 1,
0.06172623, -0.1827365, 5.051113, 0, 0.9529412, 1, 1,
0.0673888, 1.324355, 0.08091141, 0, 0.945098, 1, 1,
0.06947622, 0.2960585, 0.3874889, 0, 0.9411765, 1, 1,
0.07438718, -3.227818, 3.166623, 0, 0.9333333, 1, 1,
0.07528335, 0.2184012, 1.511883, 0, 0.9294118, 1, 1,
0.07815187, 1.007439, -0.2422962, 0, 0.9215686, 1, 1,
0.0785097, 0.470386, -2.947877, 0, 0.9176471, 1, 1,
0.08227, 1.43495, -0.3379423, 0, 0.9098039, 1, 1,
0.0825305, 0.1510328, -0.8047397, 0, 0.9058824, 1, 1,
0.08256965, 1.600214, -0.4587392, 0, 0.8980392, 1, 1,
0.08557712, 1.086832, 0.6201774, 0, 0.8901961, 1, 1,
0.08576252, 0.4465607, -0.8392398, 0, 0.8862745, 1, 1,
0.08710282, -0.5634025, 1.732103, 0, 0.8784314, 1, 1,
0.09001619, 0.3547983, 0.3717298, 0, 0.8745098, 1, 1,
0.09167682, 0.119721, 2.241671, 0, 0.8666667, 1, 1,
0.09310946, -1.419066, 1.48907, 0, 0.8627451, 1, 1,
0.09357999, -1.183858, 2.574197, 0, 0.854902, 1, 1,
0.09671844, -1.48785, 1.651614, 0, 0.8509804, 1, 1,
0.09794857, 0.7417729, -1.835743, 0, 0.8431373, 1, 1,
0.1015619, -1.448124, 1.709495, 0, 0.8392157, 1, 1,
0.1049437, 2.140888, 1.983055, 0, 0.8313726, 1, 1,
0.1062699, 0.001605528, 0.975322, 0, 0.827451, 1, 1,
0.1065912, -0.348259, 3.596126, 0, 0.8196079, 1, 1,
0.108351, -0.3620069, 1.327327, 0, 0.8156863, 1, 1,
0.1086288, -0.33238, 2.125037, 0, 0.8078431, 1, 1,
0.110299, -1.415719, 2.50692, 0, 0.8039216, 1, 1,
0.1123975, 0.9908288, -0.5653982, 0, 0.7960784, 1, 1,
0.1142592, 1.535757, -0.182897, 0, 0.7882353, 1, 1,
0.1196227, -0.4648383, 1.949135, 0, 0.7843137, 1, 1,
0.1198532, 1.976383, -0.5713488, 0, 0.7764706, 1, 1,
0.1205781, -0.4375849, 3.162613, 0, 0.772549, 1, 1,
0.1220698, 0.1899077, -0.1787721, 0, 0.7647059, 1, 1,
0.1243548, -0.5833906, 3.643676, 0, 0.7607843, 1, 1,
0.1300091, -0.7930133, 3.516573, 0, 0.7529412, 1, 1,
0.1301714, 1.074476, 1.118582, 0, 0.7490196, 1, 1,
0.1369238, -1.13636, 3.976364, 0, 0.7411765, 1, 1,
0.1428689, 1.376928, 2.188073, 0, 0.7372549, 1, 1,
0.1454507, 1.232578, -1.134982, 0, 0.7294118, 1, 1,
0.1461934, 0.2681852, -0.1479948, 0, 0.7254902, 1, 1,
0.1465096, 1.279597, 1.003766, 0, 0.7176471, 1, 1,
0.1480811, 0.760639, 0.09742158, 0, 0.7137255, 1, 1,
0.1494735, -1.034049, 4.187236, 0, 0.7058824, 1, 1,
0.1495704, -0.2467769, 1.827042, 0, 0.6980392, 1, 1,
0.150843, 1.430775, -0.6631916, 0, 0.6941177, 1, 1,
0.1595268, -2.559948, 2.729986, 0, 0.6862745, 1, 1,
0.163738, -0.2729899, 2.740009, 0, 0.682353, 1, 1,
0.1653707, 0.770729, 0.7780998, 0, 0.6745098, 1, 1,
0.1668046, -1.351115, 2.803587, 0, 0.6705883, 1, 1,
0.1691825, 0.7212025, 1.157576, 0, 0.6627451, 1, 1,
0.1699899, 0.9082577, 0.4311898, 0, 0.6588235, 1, 1,
0.1715901, 0.09503973, -0.06489657, 0, 0.6509804, 1, 1,
0.175702, -1.576112, 3.942053, 0, 0.6470588, 1, 1,
0.1771033, 1.395485, 0.3455089, 0, 0.6392157, 1, 1,
0.1809382, 0.3321844, 1.41278, 0, 0.6352941, 1, 1,
0.1812866, -0.3684814, 2.208993, 0, 0.627451, 1, 1,
0.1818302, -0.01629312, 1.005234, 0, 0.6235294, 1, 1,
0.1823658, -0.5695579, 2.41848, 0, 0.6156863, 1, 1,
0.1860548, -0.4672092, 3.717984, 0, 0.6117647, 1, 1,
0.1865063, 0.3991932, 0.4463603, 0, 0.6039216, 1, 1,
0.1925427, -0.9621491, 3.222485, 0, 0.5960785, 1, 1,
0.197676, 0.6319283, 0.9354239, 0, 0.5921569, 1, 1,
0.1997067, -0.3266182, 1.196488, 0, 0.5843138, 1, 1,
0.2002833, -0.9643017, 1.864724, 0, 0.5803922, 1, 1,
0.2006271, -1.217765, 0.7855673, 0, 0.572549, 1, 1,
0.2069556, -1.286491, 2.862734, 0, 0.5686275, 1, 1,
0.2093401, -0.08002345, 1.452477, 0, 0.5607843, 1, 1,
0.2130312, -1.83653, 3.790958, 0, 0.5568628, 1, 1,
0.2141932, 0.5582522, 1.922489, 0, 0.5490196, 1, 1,
0.2178452, 0.5238966, 0.6104374, 0, 0.5450981, 1, 1,
0.220901, 1.548557, -0.4816206, 0, 0.5372549, 1, 1,
0.2216756, 0.7579323, 0.6671036, 0, 0.5333334, 1, 1,
0.2223624, 1.562424, 0.9036301, 0, 0.5254902, 1, 1,
0.2223951, -0.6679071, 1.136515, 0, 0.5215687, 1, 1,
0.2248674, 0.03210218, 2.45341, 0, 0.5137255, 1, 1,
0.2258725, -1.098357, 3.273125, 0, 0.509804, 1, 1,
0.2259354, -0.065874, 1.963958, 0, 0.5019608, 1, 1,
0.2288866, 0.05629814, 3.003717, 0, 0.4941176, 1, 1,
0.2331841, 0.8894336, 0.4340997, 0, 0.4901961, 1, 1,
0.2341627, -0.7574996, 1.204146, 0, 0.4823529, 1, 1,
0.2358886, -2.3219, 3.523355, 0, 0.4784314, 1, 1,
0.2385082, -0.5357202, 3.36835, 0, 0.4705882, 1, 1,
0.2410947, -1.032282, 2.819879, 0, 0.4666667, 1, 1,
0.2440817, -0.5149388, 0.06642997, 0, 0.4588235, 1, 1,
0.2472217, -0.5964331, 2.502552, 0, 0.454902, 1, 1,
0.2480162, 1.118393, -0.4043531, 0, 0.4470588, 1, 1,
0.2495422, 0.110369, 1.814561, 0, 0.4431373, 1, 1,
0.2513627, 0.09045764, 2.501709, 0, 0.4352941, 1, 1,
0.2525152, -0.526543, 3.227102, 0, 0.4313726, 1, 1,
0.2561493, -0.9481412, 1.075052, 0, 0.4235294, 1, 1,
0.2613395, -0.6388643, 3.48782, 0, 0.4196078, 1, 1,
0.2620068, 1.750035, -0.1764314, 0, 0.4117647, 1, 1,
0.2623667, 1.60294, 0.6352224, 0, 0.4078431, 1, 1,
0.264419, -1.329392, 3.382145, 0, 0.4, 1, 1,
0.2647453, 0.008784073, 0.1962389, 0, 0.3921569, 1, 1,
0.2686598, -0.8060308, 1.251541, 0, 0.3882353, 1, 1,
0.2692703, 1.295269, -0.9802204, 0, 0.3803922, 1, 1,
0.2707821, -1.668581, 3.788324, 0, 0.3764706, 1, 1,
0.2719207, -1.122113, 1.729296, 0, 0.3686275, 1, 1,
0.273446, -0.2184785, 3.033502, 0, 0.3647059, 1, 1,
0.2737028, -1.680137, 3.837276, 0, 0.3568628, 1, 1,
0.2751077, 0.3461984, 1.130208, 0, 0.3529412, 1, 1,
0.2768248, 0.2383473, 0.5507482, 0, 0.345098, 1, 1,
0.2781586, 0.05363466, 0.0750837, 0, 0.3411765, 1, 1,
0.2874349, -1.06694, 3.648167, 0, 0.3333333, 1, 1,
0.2906401, 0.3581266, 0.697842, 0, 0.3294118, 1, 1,
0.2907597, 2.62357, -0.2729724, 0, 0.3215686, 1, 1,
0.292052, 0.4657778, 2.314645, 0, 0.3176471, 1, 1,
0.2939934, -0.1928989, 1.763893, 0, 0.3098039, 1, 1,
0.2960549, -0.1009207, 2.148224, 0, 0.3058824, 1, 1,
0.2968566, 1.246621, 0.9194595, 0, 0.2980392, 1, 1,
0.2985153, -1.019676, 2.704134, 0, 0.2901961, 1, 1,
0.3051728, 0.2621222, 0.6877832, 0, 0.2862745, 1, 1,
0.3121345, -0.475901, 2.951925, 0, 0.2784314, 1, 1,
0.3125641, -0.6132377, 2.459347, 0, 0.2745098, 1, 1,
0.3137316, 1.268361, -0.3522265, 0, 0.2666667, 1, 1,
0.3164637, 0.5467148, -0.2415096, 0, 0.2627451, 1, 1,
0.3190745, -0.2648215, 0.6395761, 0, 0.254902, 1, 1,
0.3287013, -0.885124, 3.27211, 0, 0.2509804, 1, 1,
0.3321351, -1.390074, 2.925439, 0, 0.2431373, 1, 1,
0.3326326, 0.9968175, 0.3580151, 0, 0.2392157, 1, 1,
0.3335769, -0.4537094, 2.952603, 0, 0.2313726, 1, 1,
0.3340348, 1.365652, 1.907474, 0, 0.227451, 1, 1,
0.3369191, -0.6918712, 2.598126, 0, 0.2196078, 1, 1,
0.3377463, -0.01119992, 0.5700309, 0, 0.2156863, 1, 1,
0.340591, -0.4662635, 3.159751, 0, 0.2078431, 1, 1,
0.3440661, 0.1999673, 1.290433, 0, 0.2039216, 1, 1,
0.3442969, -0.3776431, 1.734157, 0, 0.1960784, 1, 1,
0.344487, 0.5797501, 1.13861, 0, 0.1882353, 1, 1,
0.3472416, -0.2801765, 3.411173, 0, 0.1843137, 1, 1,
0.3510741, -0.7262127, 2.367111, 0, 0.1764706, 1, 1,
0.3521828, -0.9188946, 3.193112, 0, 0.172549, 1, 1,
0.353523, -0.2717911, 2.579847, 0, 0.1647059, 1, 1,
0.3551936, 0.5493405, 0.998363, 0, 0.1607843, 1, 1,
0.3565611, 0.8648175, 0.6309348, 0, 0.1529412, 1, 1,
0.3578719, -2.50743, 3.611829, 0, 0.1490196, 1, 1,
0.359839, -0.9303939, 4.368407, 0, 0.1411765, 1, 1,
0.3631471, -0.146329, 3.01674, 0, 0.1372549, 1, 1,
0.3719053, -0.3207475, 1.343078, 0, 0.1294118, 1, 1,
0.3725564, 2.862671, -0.08696546, 0, 0.1254902, 1, 1,
0.3762123, -1.214357, 5.05153, 0, 0.1176471, 1, 1,
0.378338, 0.02465181, 1.288931, 0, 0.1137255, 1, 1,
0.3801532, -0.6693118, 1.898413, 0, 0.1058824, 1, 1,
0.381253, -0.5817641, 1.482706, 0, 0.09803922, 1, 1,
0.3836576, 1.746414, -0.8595885, 0, 0.09411765, 1, 1,
0.3891521, 0.7800967, -0.6850967, 0, 0.08627451, 1, 1,
0.3985741, -0.2183715, 3.459065, 0, 0.08235294, 1, 1,
0.4047832, 0.4838502, -0.3399041, 0, 0.07450981, 1, 1,
0.4116643, -1.255626, 1.325484, 0, 0.07058824, 1, 1,
0.4163878, 0.7699471, 2.132045, 0, 0.0627451, 1, 1,
0.4174456, -1.052712, 3.657398, 0, 0.05882353, 1, 1,
0.4213585, 0.5353229, -1.05474, 0, 0.05098039, 1, 1,
0.4252894, -0.5836433, 2.072696, 0, 0.04705882, 1, 1,
0.4284084, -1.120882, 2.629302, 0, 0.03921569, 1, 1,
0.4299992, 0.312288, 0.8443395, 0, 0.03529412, 1, 1,
0.4322132, 0.2619552, -0.04220605, 0, 0.02745098, 1, 1,
0.4389864, 0.6670894, 0.6730247, 0, 0.02352941, 1, 1,
0.4398613, -0.4743822, 3.585252, 0, 0.01568628, 1, 1,
0.4409725, -0.08328574, 3.087352, 0, 0.01176471, 1, 1,
0.4412186, 0.8999854, -1.086633, 0, 0.003921569, 1, 1,
0.4426236, -0.9900443, 2.457465, 0.003921569, 0, 1, 1,
0.4434682, -0.4501852, 2.092405, 0.007843138, 0, 1, 1,
0.4461129, 1.120978, 0.539577, 0.01568628, 0, 1, 1,
0.448147, -1.215832, 3.469164, 0.01960784, 0, 1, 1,
0.4488709, 0.3309418, 2.143202, 0.02745098, 0, 1, 1,
0.4524278, 0.5968807, 3.359103, 0.03137255, 0, 1, 1,
0.4529651, 0.2833773, 0.7955171, 0.03921569, 0, 1, 1,
0.4563322, -0.5668606, 1.672474, 0.04313726, 0, 1, 1,
0.4595611, -0.36054, 1.698857, 0.05098039, 0, 1, 1,
0.4596635, 0.6311817, 0.1319696, 0.05490196, 0, 1, 1,
0.4606245, 0.6787285, 2.729645, 0.0627451, 0, 1, 1,
0.4627159, 0.8891091, 2.027275, 0.06666667, 0, 1, 1,
0.4667349, -0.5526317, 2.272394, 0.07450981, 0, 1, 1,
0.4702697, -1.034076, 1.741623, 0.07843138, 0, 1, 1,
0.4732757, -0.09792435, 1.749482, 0.08627451, 0, 1, 1,
0.4757732, -0.997968, 2.693614, 0.09019608, 0, 1, 1,
0.4759209, -1.601364, 2.645787, 0.09803922, 0, 1, 1,
0.4763965, -0.6253753, 2.835226, 0.1058824, 0, 1, 1,
0.477739, 0.81742, 0.642055, 0.1098039, 0, 1, 1,
0.4803161, 1.536645, -0.2408715, 0.1176471, 0, 1, 1,
0.480534, 0.7217549, -0.7396966, 0.1215686, 0, 1, 1,
0.4816251, 0.2164869, 0.3206874, 0.1294118, 0, 1, 1,
0.4857531, 1.166752, -0.1984572, 0.1333333, 0, 1, 1,
0.4893067, -0.5119033, 3.623636, 0.1411765, 0, 1, 1,
0.4896881, -0.6092318, 2.631283, 0.145098, 0, 1, 1,
0.4916586, -1.397707, 4.121829, 0.1529412, 0, 1, 1,
0.4922704, -1.698929, 3.076306, 0.1568628, 0, 1, 1,
0.4948679, 0.2227961, -0.1302823, 0.1647059, 0, 1, 1,
0.4965529, 0.2764599, -0.2590709, 0.1686275, 0, 1, 1,
0.4974484, 0.8219538, 1.931796, 0.1764706, 0, 1, 1,
0.4992542, -0.5960426, 2.758481, 0.1803922, 0, 1, 1,
0.5017393, -0.6793902, 1.592524, 0.1882353, 0, 1, 1,
0.5031683, 0.180511, 0.8729789, 0.1921569, 0, 1, 1,
0.5099563, -1.066609, 1.144403, 0.2, 0, 1, 1,
0.5103767, -0.1362925, 2.640356, 0.2078431, 0, 1, 1,
0.5136694, -1.225808, 4.171231, 0.2117647, 0, 1, 1,
0.5201486, -0.7764452, 3.865017, 0.2196078, 0, 1, 1,
0.5217737, 0.2850367, 0.3988914, 0.2235294, 0, 1, 1,
0.5240645, 0.595282, 0.6807118, 0.2313726, 0, 1, 1,
0.5280839, 0.7408857, 1.280712, 0.2352941, 0, 1, 1,
0.5327662, -0.3313, 2.576181, 0.2431373, 0, 1, 1,
0.5344952, 0.5476468, 0.3539119, 0.2470588, 0, 1, 1,
0.5350203, -0.9465235, 2.37539, 0.254902, 0, 1, 1,
0.5396991, 0.3629525, 2.027797, 0.2588235, 0, 1, 1,
0.5449132, 0.4882648, 2.102431, 0.2666667, 0, 1, 1,
0.5523171, -0.6169021, 2.596092, 0.2705882, 0, 1, 1,
0.5576728, -0.1694785, 2.697785, 0.2784314, 0, 1, 1,
0.5592212, -0.3973044, 2.234426, 0.282353, 0, 1, 1,
0.5627066, -0.3857151, 1.767046, 0.2901961, 0, 1, 1,
0.5635715, 0.9136516, 2.44917, 0.2941177, 0, 1, 1,
0.566579, -1.630907, 2.420135, 0.3019608, 0, 1, 1,
0.5678992, -1.461903, 3.739752, 0.3098039, 0, 1, 1,
0.56984, -0.05925164, 1.611488, 0.3137255, 0, 1, 1,
0.5744231, 1.338171, 0.9175544, 0.3215686, 0, 1, 1,
0.5809767, 0.8110582, 0.7197381, 0.3254902, 0, 1, 1,
0.5824731, 0.6255414, 0.8103087, 0.3333333, 0, 1, 1,
0.5872805, -0.0009432501, 1.796493, 0.3372549, 0, 1, 1,
0.5908583, 1.740209, -0.338674, 0.345098, 0, 1, 1,
0.5911418, 0.8827341, 0.6917207, 0.3490196, 0, 1, 1,
0.5923167, 1.404824, 1.134828, 0.3568628, 0, 1, 1,
0.5955668, 0.4720358, 2.64099, 0.3607843, 0, 1, 1,
0.6059607, 0.4594351, -0.0987682, 0.3686275, 0, 1, 1,
0.6076664, 0.6359048, 1.921878, 0.372549, 0, 1, 1,
0.6154608, -1.245006, 3.552581, 0.3803922, 0, 1, 1,
0.6171132, -1.184632, 3.135992, 0.3843137, 0, 1, 1,
0.6218015, 1.678657, 2.795556, 0.3921569, 0, 1, 1,
0.6236044, 0.8485128, 0.01751548, 0.3960784, 0, 1, 1,
0.6260727, -1.172433, 3.889016, 0.4039216, 0, 1, 1,
0.6293533, -0.1739675, 2.780207, 0.4117647, 0, 1, 1,
0.6298891, -0.437065, 2.673531, 0.4156863, 0, 1, 1,
0.6305125, 2.676717, 0.5510169, 0.4235294, 0, 1, 1,
0.6336723, -0.3511009, 2.168374, 0.427451, 0, 1, 1,
0.6357598, 0.08163513, 1.41406, 0.4352941, 0, 1, 1,
0.6384957, -0.5477029, 2.289879, 0.4392157, 0, 1, 1,
0.6461883, -0.8862326, 2.819902, 0.4470588, 0, 1, 1,
0.6472324, 0.5479525, 1.643588, 0.4509804, 0, 1, 1,
0.6474131, -0.2492043, 1.119541, 0.4588235, 0, 1, 1,
0.6506759, -0.2420099, 3.171855, 0.4627451, 0, 1, 1,
0.6526824, 0.798716, 0.7792197, 0.4705882, 0, 1, 1,
0.6527823, -0.5929351, 3.598365, 0.4745098, 0, 1, 1,
0.652909, -0.4669922, 1.215969, 0.4823529, 0, 1, 1,
0.6552778, -0.9145394, 1.381307, 0.4862745, 0, 1, 1,
0.6570596, 1.814009, 0.5683194, 0.4941176, 0, 1, 1,
0.6606889, -0.1732313, 2.442545, 0.5019608, 0, 1, 1,
0.6613991, 0.922031, 0.2779332, 0.5058824, 0, 1, 1,
0.661656, 0.9242274, 1.241025, 0.5137255, 0, 1, 1,
0.6676618, 0.4578791, 0.2355056, 0.5176471, 0, 1, 1,
0.6738262, 0.08501178, 2.082997, 0.5254902, 0, 1, 1,
0.6773823, -0.4189616, 0.8843735, 0.5294118, 0, 1, 1,
0.6820588, -0.01240123, 0.29855, 0.5372549, 0, 1, 1,
0.6821143, -1.023181, 2.770601, 0.5411765, 0, 1, 1,
0.691388, 2.206484, 0.6917633, 0.5490196, 0, 1, 1,
0.6935019, 0.6540886, 1.535364, 0.5529412, 0, 1, 1,
0.6945334, -1.378259, 1.414763, 0.5607843, 0, 1, 1,
0.6946378, 0.535889, -0.8658192, 0.5647059, 0, 1, 1,
0.6950085, -1.262797, 2.924287, 0.572549, 0, 1, 1,
0.6964256, -1.634019, 2.73057, 0.5764706, 0, 1, 1,
0.7011121, -1.536183, 3.462129, 0.5843138, 0, 1, 1,
0.7028231, 0.6920581, 0.4038572, 0.5882353, 0, 1, 1,
0.7094406, -0.8449079, 2.924276, 0.5960785, 0, 1, 1,
0.7146777, 1.01807, 1.600561, 0.6039216, 0, 1, 1,
0.7147688, -0.8367323, 3.268093, 0.6078432, 0, 1, 1,
0.7260534, -1.188783, 0.68708, 0.6156863, 0, 1, 1,
0.7299328, 1.037762, 0.6057936, 0.6196079, 0, 1, 1,
0.7301208, -0.1794601, 1.341613, 0.627451, 0, 1, 1,
0.7324547, 0.109533, 2.488132, 0.6313726, 0, 1, 1,
0.7379692, 1.710446, 0.2021366, 0.6392157, 0, 1, 1,
0.7410832, 1.033331, 0.3853983, 0.6431373, 0, 1, 1,
0.7497419, 1.525192, 0.2533161, 0.6509804, 0, 1, 1,
0.7501483, -0.1960751, 2.626962, 0.654902, 0, 1, 1,
0.75945, 0.8053951, 0.4996234, 0.6627451, 0, 1, 1,
0.763295, -0.4375563, 1.834695, 0.6666667, 0, 1, 1,
0.7634082, 0.5049834, 0.5427287, 0.6745098, 0, 1, 1,
0.7664212, -0.4823065, 0.4911837, 0.6784314, 0, 1, 1,
0.770788, 0.8656024, 0.1489848, 0.6862745, 0, 1, 1,
0.7711371, -0.4480512, 1.636679, 0.6901961, 0, 1, 1,
0.7730563, -0.4090593, 2.49692, 0.6980392, 0, 1, 1,
0.7747254, -1.597412, 2.640744, 0.7058824, 0, 1, 1,
0.7761753, 1.189081, 2.260106, 0.7098039, 0, 1, 1,
0.7762479, 0.05676043, 0.383481, 0.7176471, 0, 1, 1,
0.7786093, -0.2900517, 1.911698, 0.7215686, 0, 1, 1,
0.7817675, -0.002853134, 1.960085, 0.7294118, 0, 1, 1,
0.7829859, -0.7906047, 3.60703, 0.7333333, 0, 1, 1,
0.7869786, -0.9087434, 1.895122, 0.7411765, 0, 1, 1,
0.796379, -1.103019, 0.6607983, 0.7450981, 0, 1, 1,
0.7972801, -0.4890519, 3.540641, 0.7529412, 0, 1, 1,
0.7992208, -1.170917, 2.363292, 0.7568628, 0, 1, 1,
0.8030079, -0.7661988, 3.078535, 0.7647059, 0, 1, 1,
0.8064077, -2.705588, 3.087312, 0.7686275, 0, 1, 1,
0.8108323, 0.7349926, 1.798389, 0.7764706, 0, 1, 1,
0.8135322, 0.889231, 1.271236, 0.7803922, 0, 1, 1,
0.8201211, -2.02645, 3.635312, 0.7882353, 0, 1, 1,
0.8204315, -0.5670778, 1.595182, 0.7921569, 0, 1, 1,
0.8226771, 0.5746339, 1.490648, 0.8, 0, 1, 1,
0.823658, -0.5720648, 3.242403, 0.8078431, 0, 1, 1,
0.8277222, -1.419372, 4.220985, 0.8117647, 0, 1, 1,
0.8304772, -2.657481, 2.628396, 0.8196079, 0, 1, 1,
0.84164, 0.0602429, 1.358233, 0.8235294, 0, 1, 1,
0.8449075, 0.05205939, 0.9885718, 0.8313726, 0, 1, 1,
0.8488244, -0.876966, 0.937614, 0.8352941, 0, 1, 1,
0.8672407, -0.504629, 1.680479, 0.8431373, 0, 1, 1,
0.8675182, -0.7062137, 1.777411, 0.8470588, 0, 1, 1,
0.8717469, 1.644094, -0.2096587, 0.854902, 0, 1, 1,
0.8719939, 0.4914729, 0.2145218, 0.8588235, 0, 1, 1,
0.8755233, 0.1024698, 1.799255, 0.8666667, 0, 1, 1,
0.8829219, 1.549606, 1.957919, 0.8705882, 0, 1, 1,
0.895199, -1.719452, 3.581515, 0.8784314, 0, 1, 1,
0.9000607, 0.9398907, 0.394749, 0.8823529, 0, 1, 1,
0.9000806, -1.104063, 1.432335, 0.8901961, 0, 1, 1,
0.9022669, 0.3866304, 0.6379992, 0.8941177, 0, 1, 1,
0.9057467, -0.538367, 3.327217, 0.9019608, 0, 1, 1,
0.9070302, -0.07721011, 2.20543, 0.9098039, 0, 1, 1,
0.9124424, 0.2897584, 1.609472, 0.9137255, 0, 1, 1,
0.9133565, 0.5300678, 0.3040948, 0.9215686, 0, 1, 1,
0.9226705, 0.1670985, 1.797545, 0.9254902, 0, 1, 1,
0.9227916, -0.7000424, 2.318092, 0.9333333, 0, 1, 1,
0.9279954, -0.1576161, 1.737506, 0.9372549, 0, 1, 1,
0.9328284, -0.2556366, 2.426116, 0.945098, 0, 1, 1,
0.938291, 0.4078785, 0.2069835, 0.9490196, 0, 1, 1,
0.9470639, -0.05041809, 1.48766, 0.9568627, 0, 1, 1,
0.9524022, 0.9415892, 1.947883, 0.9607843, 0, 1, 1,
0.9533404, -0.1849116, 1.127416, 0.9686275, 0, 1, 1,
0.9536448, 0.5179483, -0.08394718, 0.972549, 0, 1, 1,
0.9614414, 1.095387, 1.049599, 0.9803922, 0, 1, 1,
0.9716669, 0.8619656, 1.451879, 0.9843137, 0, 1, 1,
0.9736473, -2.550058, 1.708157, 0.9921569, 0, 1, 1,
0.9760888, -2.020665, 3.161969, 0.9960784, 0, 1, 1,
0.9778239, 1.408346, 0.4964374, 1, 0, 0.9960784, 1,
0.9801667, 0.5762161, 1.473697, 1, 0, 0.9882353, 1,
0.981676, 0.04922518, 0.2842286, 1, 0, 0.9843137, 1,
0.9962383, 0.4920233, 2.889253, 1, 0, 0.9764706, 1,
1.004527, 1.360977, 1.846375, 1, 0, 0.972549, 1,
1.009927, 1.488135, -1.073379, 1, 0, 0.9647059, 1,
1.011942, -0.2307349, 0.1468484, 1, 0, 0.9607843, 1,
1.015089, -2.315217, 3.829027, 1, 0, 0.9529412, 1,
1.01512, 1.043098, 0.8379139, 1, 0, 0.9490196, 1,
1.017355, -0.6242387, 2.777699, 1, 0, 0.9411765, 1,
1.018384, -0.2927152, 2.918912, 1, 0, 0.9372549, 1,
1.023927, -0.4769817, 0.9951919, 1, 0, 0.9294118, 1,
1.027236, -1.15923, 2.43025, 1, 0, 0.9254902, 1,
1.030086, -0.2966267, 0.7818197, 1, 0, 0.9176471, 1,
1.036581, -1.945, 1.182437, 1, 0, 0.9137255, 1,
1.04434, 0.04132507, 0.9447148, 1, 0, 0.9058824, 1,
1.044876, 1.033269, 1.602468, 1, 0, 0.9019608, 1,
1.048667, -1.491844, 1.852448, 1, 0, 0.8941177, 1,
1.057537, -1.209001, 1.349566, 1, 0, 0.8862745, 1,
1.058659, -1.250035, 1.493784, 1, 0, 0.8823529, 1,
1.071573, -0.1029888, 2.020944, 1, 0, 0.8745098, 1,
1.074965, 0.3740235, 1.220779, 1, 0, 0.8705882, 1,
1.075451, -0.2549718, -0.2444028, 1, 0, 0.8627451, 1,
1.076513, 0.4311483, -0.0509688, 1, 0, 0.8588235, 1,
1.095413, -0.9677219, 2.049577, 1, 0, 0.8509804, 1,
1.100455, -0.165623, 1.576302, 1, 0, 0.8470588, 1,
1.102582, 0.75704, -0.3344884, 1, 0, 0.8392157, 1,
1.109226, 0.8059919, -0.1278193, 1, 0, 0.8352941, 1,
1.111949, -1.033191, 3.349524, 1, 0, 0.827451, 1,
1.120329, 0.4242194, 1.73642, 1, 0, 0.8235294, 1,
1.135393, 1.402647, 0.1955013, 1, 0, 0.8156863, 1,
1.13677, 0.2585519, 1.989695, 1, 0, 0.8117647, 1,
1.141327, 0.8067573, 1.154983, 1, 0, 0.8039216, 1,
1.151424, 1.813813, -1.303343, 1, 0, 0.7960784, 1,
1.156589, 0.817658, 1.672632, 1, 0, 0.7921569, 1,
1.157654, 0.9055745, -1.155045, 1, 0, 0.7843137, 1,
1.158633, -1.9575, 1.863135, 1, 0, 0.7803922, 1,
1.162938, 0.9443697, 0.5010054, 1, 0, 0.772549, 1,
1.166011, 0.8175501, -0.1094496, 1, 0, 0.7686275, 1,
1.167819, -0.4153824, 0.7064561, 1, 0, 0.7607843, 1,
1.183499, -0.1980361, 1.788355, 1, 0, 0.7568628, 1,
1.186365, -0.5959746, 2.078071, 1, 0, 0.7490196, 1,
1.197664, -0.6738142, 3.510448, 1, 0, 0.7450981, 1,
1.202286, -1.509062, 2.102197, 1, 0, 0.7372549, 1,
1.204682, 2.065746, 0.3173665, 1, 0, 0.7333333, 1,
1.20555, -0.1263264, 1.827734, 1, 0, 0.7254902, 1,
1.212268, 1.248685, 1.858087, 1, 0, 0.7215686, 1,
1.215234, -0.1885869, 3.0372, 1, 0, 0.7137255, 1,
1.217423, -1.00622, 1.736543, 1, 0, 0.7098039, 1,
1.22716, -0.3403696, 4.716003, 1, 0, 0.7019608, 1,
1.232558, 1.046343, 0.8794636, 1, 0, 0.6941177, 1,
1.235798, -2.084004, 2.833937, 1, 0, 0.6901961, 1,
1.236577, 0.5231658, 0.1501042, 1, 0, 0.682353, 1,
1.244982, -0.5835153, 2.870904, 1, 0, 0.6784314, 1,
1.245904, 1.130056, 0.5472548, 1, 0, 0.6705883, 1,
1.248368, 0.5321305, 0.7289719, 1, 0, 0.6666667, 1,
1.252308, -0.6098112, 1.903392, 1, 0, 0.6588235, 1,
1.257692, 0.3196259, 0.8583838, 1, 0, 0.654902, 1,
1.261111, -0.005632036, 0.537535, 1, 0, 0.6470588, 1,
1.272148, 0.2076363, 2.166881, 1, 0, 0.6431373, 1,
1.275187, -0.3069845, 0.8222039, 1, 0, 0.6352941, 1,
1.27716, 1.184185, 2.123104, 1, 0, 0.6313726, 1,
1.27901, -2.58027, 2.622222, 1, 0, 0.6235294, 1,
1.291202, 1.398244, 1.606313, 1, 0, 0.6196079, 1,
1.292698, 0.914894, 0.5700846, 1, 0, 0.6117647, 1,
1.297662, 0.7526401, 0.3177672, 1, 0, 0.6078432, 1,
1.297664, 0.4981743, 0.1562378, 1, 0, 0.6, 1,
1.298451, -0.001229117, 1.43859, 1, 0, 0.5921569, 1,
1.300795, -0.3135768, 3.626739, 1, 0, 0.5882353, 1,
1.315007, 0.9255689, 1.883684, 1, 0, 0.5803922, 1,
1.322495, -0.09606389, 0.2055006, 1, 0, 0.5764706, 1,
1.325247, -0.8564833, 2.224437, 1, 0, 0.5686275, 1,
1.331524, 1.415239, -1.029821, 1, 0, 0.5647059, 1,
1.337348, 0.2743432, 2.871449, 1, 0, 0.5568628, 1,
1.347916, 1.510895, 0.4814298, 1, 0, 0.5529412, 1,
1.355658, -2.238558, 3.401385, 1, 0, 0.5450981, 1,
1.35571, 0.7033136, 0.7978495, 1, 0, 0.5411765, 1,
1.364018, -0.9144216, 2.061534, 1, 0, 0.5333334, 1,
1.373534, -0.04177583, 2.750876, 1, 0, 0.5294118, 1,
1.374664, 1.535569, -0.4908838, 1, 0, 0.5215687, 1,
1.383388, 0.9401132, 1.086898, 1, 0, 0.5176471, 1,
1.387836, 0.4531624, 1.195149, 1, 0, 0.509804, 1,
1.392254, -0.2505253, 1.617146, 1, 0, 0.5058824, 1,
1.394139, 0.8361985, 2.059669, 1, 0, 0.4980392, 1,
1.403774, 1.809772, 0.3114704, 1, 0, 0.4901961, 1,
1.406767, -0.3718134, 0.4201507, 1, 0, 0.4862745, 1,
1.410016, 0.2379798, 3.007973, 1, 0, 0.4784314, 1,
1.416918, -1.285392, 4.124963, 1, 0, 0.4745098, 1,
1.428922, -3.091041, 4.139879, 1, 0, 0.4666667, 1,
1.435647, -0.5641953, 0.316658, 1, 0, 0.4627451, 1,
1.438222, -1.338581, 3.40645, 1, 0, 0.454902, 1,
1.47137, -1.235075, 4.834859, 1, 0, 0.4509804, 1,
1.47807, -0.3255785, 2.448867, 1, 0, 0.4431373, 1,
1.488134, 1.252021, 1.600716, 1, 0, 0.4392157, 1,
1.488338, -0.2146185, 1.812494, 1, 0, 0.4313726, 1,
1.488944, -0.01757412, 2.105563, 1, 0, 0.427451, 1,
1.488964, -1.925054, 1.88899, 1, 0, 0.4196078, 1,
1.491019, 1.063115, 0.5723816, 1, 0, 0.4156863, 1,
1.502026, -2.268345, 1.929847, 1, 0, 0.4078431, 1,
1.508801, -0.3091613, 3.076448, 1, 0, 0.4039216, 1,
1.509448, -0.2416705, 1.411865, 1, 0, 0.3960784, 1,
1.510824, -0.5153722, 3.480738, 1, 0, 0.3882353, 1,
1.521145, -1.35001, 1.121325, 1, 0, 0.3843137, 1,
1.53151, -1.522784, 1.476181, 1, 0, 0.3764706, 1,
1.536674, 1.795806, 0.553618, 1, 0, 0.372549, 1,
1.53784, 0.04803596, -0.1678502, 1, 0, 0.3647059, 1,
1.538849, 0.8771179, 2.338948, 1, 0, 0.3607843, 1,
1.546376, 0.7391828, 1.077883, 1, 0, 0.3529412, 1,
1.547862, 0.2041589, -0.1034195, 1, 0, 0.3490196, 1,
1.559244, -1.587491, 2.507, 1, 0, 0.3411765, 1,
1.568844, 1.881131, 2.08933, 1, 0, 0.3372549, 1,
1.587239, -0.2685678, 1.552823, 1, 0, 0.3294118, 1,
1.594177, -1.390197, 2.211818, 1, 0, 0.3254902, 1,
1.596904, 0.1376883, 0.912708, 1, 0, 0.3176471, 1,
1.618222, 0.7612905, 1.488545, 1, 0, 0.3137255, 1,
1.633636, -0.5864239, 2.707033, 1, 0, 0.3058824, 1,
1.641662, 1.260138, 1.12576, 1, 0, 0.2980392, 1,
1.65746, -0.7929841, 3.458944, 1, 0, 0.2941177, 1,
1.66955, 0.4613388, 2.386061, 1, 0, 0.2862745, 1,
1.699789, 0.6284788, 0.03157751, 1, 0, 0.282353, 1,
1.709615, 0.6462123, 0.6974611, 1, 0, 0.2745098, 1,
1.713567, 0.1595615, 2.368777, 1, 0, 0.2705882, 1,
1.726702, -0.882137, 0.434714, 1, 0, 0.2627451, 1,
1.727041, 2.063217, 1.560194, 1, 0, 0.2588235, 1,
1.748613, 0.2439132, 1.576651, 1, 0, 0.2509804, 1,
1.751334, 2.220004, 1.534283, 1, 0, 0.2470588, 1,
1.774243, 0.2845996, 1.03309, 1, 0, 0.2392157, 1,
1.780656, -0.8223408, 2.91958, 1, 0, 0.2352941, 1,
1.791614, 1.439927, 0.4791756, 1, 0, 0.227451, 1,
1.803444, 0.485904, 1.193166, 1, 0, 0.2235294, 1,
1.808848, -0.400809, 2.111473, 1, 0, 0.2156863, 1,
1.814131, -1.614425, 0.9654838, 1, 0, 0.2117647, 1,
1.818289, 1.109457, 1.653231, 1, 0, 0.2039216, 1,
1.853333, 0.9191425, 1.229341, 1, 0, 0.1960784, 1,
1.866893, 0.1470811, 1.928466, 1, 0, 0.1921569, 1,
1.889825, 1.655965, 0.2519365, 1, 0, 0.1843137, 1,
1.90041, 0.6230226, 1.980291, 1, 0, 0.1803922, 1,
1.904251, -0.3757787, 2.790992, 1, 0, 0.172549, 1,
1.906609, -0.07165894, 3.088514, 1, 0, 0.1686275, 1,
1.944343, 0.8385894, 2.830001, 1, 0, 0.1607843, 1,
1.979037, 0.2360478, 1.766888, 1, 0, 0.1568628, 1,
1.989207, -0.4648142, 1.458523, 1, 0, 0.1490196, 1,
1.990837, 0.2020599, -0.00978205, 1, 0, 0.145098, 1,
2.010497, -1.270465, 2.543052, 1, 0, 0.1372549, 1,
2.019018, -0.5225757, 0.5186911, 1, 0, 0.1333333, 1,
2.05203, 0.4963062, 2.123286, 1, 0, 0.1254902, 1,
2.182652, -0.230089, 0.4166867, 1, 0, 0.1215686, 1,
2.185299, -0.7803155, 0.1691073, 1, 0, 0.1137255, 1,
2.19951, 1.567692, -0.5591536, 1, 0, 0.1098039, 1,
2.210858, -0.9002198, 1.463931, 1, 0, 0.1019608, 1,
2.21729, 0.2473518, 2.799464, 1, 0, 0.09411765, 1,
2.226386, 0.2712237, 2.494986, 1, 0, 0.09019608, 1,
2.245866, -0.6841884, 1.866273, 1, 0, 0.08235294, 1,
2.287492, 1.334457, 1.004305, 1, 0, 0.07843138, 1,
2.33377, 0.3527645, 1.772742, 1, 0, 0.07058824, 1,
2.338815, -0.5941226, 3.326322, 1, 0, 0.06666667, 1,
2.383534, 0.03850663, 1.760398, 1, 0, 0.05882353, 1,
2.443713, -1.392032, 1.809764, 1, 0, 0.05490196, 1,
2.463628, -0.05372145, 2.821615, 1, 0, 0.04705882, 1,
2.494213, 0.8084198, 0.7841488, 1, 0, 0.04313726, 1,
2.568002, -0.4540044, 3.822457, 1, 0, 0.03529412, 1,
2.622505, -0.6234164, 1.467675, 1, 0, 0.03137255, 1,
2.729223, -2.28642, 3.361846, 1, 0, 0.02352941, 1,
2.886535, -0.8217259, 2.834029, 1, 0, 0.01960784, 1,
3.078737, -0.7767487, -0.1367877, 1, 0, 0.01176471, 1,
3.480642, 0.3233819, 1.124999, 1, 0, 0.007843138, 1
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
0.2773592, -4.36323, -7.744402, 0, -0.5, 0.5, 0.5,
0.2773592, -4.36323, -7.744402, 1, -0.5, 0.5, 0.5,
0.2773592, -4.36323, -7.744402, 1, 1.5, 0.5, 0.5,
0.2773592, -4.36323, -7.744402, 0, 1.5, 0.5, 0.5
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
-4.011837, 0.1214825, -7.744402, 0, -0.5, 0.5, 0.5,
-4.011837, 0.1214825, -7.744402, 1, -0.5, 0.5, 0.5,
-4.011837, 0.1214825, -7.744402, 1, 1.5, 0.5, 0.5,
-4.011837, 0.1214825, -7.744402, 0, 1.5, 0.5, 0.5
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
-4.011837, -4.36323, -0.4191546, 0, -0.5, 0.5, 0.5,
-4.011837, -4.36323, -0.4191546, 1, -0.5, 0.5, 0.5,
-4.011837, -4.36323, -0.4191546, 1, 1.5, 0.5, 0.5,
-4.011837, -4.36323, -0.4191546, 0, 1.5, 0.5, 0.5
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
-2, -3.328296, -6.05396,
3, -3.328296, -6.05396,
-2, -3.328296, -6.05396,
-2, -3.500786, -6.335701,
-1, -3.328296, -6.05396,
-1, -3.500786, -6.335701,
0, -3.328296, -6.05396,
0, -3.500786, -6.335701,
1, -3.328296, -6.05396,
1, -3.500786, -6.335701,
2, -3.328296, -6.05396,
2, -3.500786, -6.335701,
3, -3.328296, -6.05396,
3, -3.500786, -6.335701
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
-2, -3.845763, -6.899181, 0, -0.5, 0.5, 0.5,
-2, -3.845763, -6.899181, 1, -0.5, 0.5, 0.5,
-2, -3.845763, -6.899181, 1, 1.5, 0.5, 0.5,
-2, -3.845763, -6.899181, 0, 1.5, 0.5, 0.5,
-1, -3.845763, -6.899181, 0, -0.5, 0.5, 0.5,
-1, -3.845763, -6.899181, 1, -0.5, 0.5, 0.5,
-1, -3.845763, -6.899181, 1, 1.5, 0.5, 0.5,
-1, -3.845763, -6.899181, 0, 1.5, 0.5, 0.5,
0, -3.845763, -6.899181, 0, -0.5, 0.5, 0.5,
0, -3.845763, -6.899181, 1, -0.5, 0.5, 0.5,
0, -3.845763, -6.899181, 1, 1.5, 0.5, 0.5,
0, -3.845763, -6.899181, 0, 1.5, 0.5, 0.5,
1, -3.845763, -6.899181, 0, -0.5, 0.5, 0.5,
1, -3.845763, -6.899181, 1, -0.5, 0.5, 0.5,
1, -3.845763, -6.899181, 1, 1.5, 0.5, 0.5,
1, -3.845763, -6.899181, 0, 1.5, 0.5, 0.5,
2, -3.845763, -6.899181, 0, -0.5, 0.5, 0.5,
2, -3.845763, -6.899181, 1, -0.5, 0.5, 0.5,
2, -3.845763, -6.899181, 1, 1.5, 0.5, 0.5,
2, -3.845763, -6.899181, 0, 1.5, 0.5, 0.5,
3, -3.845763, -6.899181, 0, -0.5, 0.5, 0.5,
3, -3.845763, -6.899181, 1, -0.5, 0.5, 0.5,
3, -3.845763, -6.899181, 1, 1.5, 0.5, 0.5,
3, -3.845763, -6.899181, 0, 1.5, 0.5, 0.5
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
-3.022022, -3, -6.05396,
-3.022022, 3, -6.05396,
-3.022022, -3, -6.05396,
-3.186991, -3, -6.335701,
-3.022022, -2, -6.05396,
-3.186991, -2, -6.335701,
-3.022022, -1, -6.05396,
-3.186991, -1, -6.335701,
-3.022022, 0, -6.05396,
-3.186991, 0, -6.335701,
-3.022022, 1, -6.05396,
-3.186991, 1, -6.335701,
-3.022022, 2, -6.05396,
-3.186991, 2, -6.335701,
-3.022022, 3, -6.05396,
-3.186991, 3, -6.335701
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
-3.51693, -3, -6.899181, 0, -0.5, 0.5, 0.5,
-3.51693, -3, -6.899181, 1, -0.5, 0.5, 0.5,
-3.51693, -3, -6.899181, 1, 1.5, 0.5, 0.5,
-3.51693, -3, -6.899181, 0, 1.5, 0.5, 0.5,
-3.51693, -2, -6.899181, 0, -0.5, 0.5, 0.5,
-3.51693, -2, -6.899181, 1, -0.5, 0.5, 0.5,
-3.51693, -2, -6.899181, 1, 1.5, 0.5, 0.5,
-3.51693, -2, -6.899181, 0, 1.5, 0.5, 0.5,
-3.51693, -1, -6.899181, 0, -0.5, 0.5, 0.5,
-3.51693, -1, -6.899181, 1, -0.5, 0.5, 0.5,
-3.51693, -1, -6.899181, 1, 1.5, 0.5, 0.5,
-3.51693, -1, -6.899181, 0, 1.5, 0.5, 0.5,
-3.51693, 0, -6.899181, 0, -0.5, 0.5, 0.5,
-3.51693, 0, -6.899181, 1, -0.5, 0.5, 0.5,
-3.51693, 0, -6.899181, 1, 1.5, 0.5, 0.5,
-3.51693, 0, -6.899181, 0, 1.5, 0.5, 0.5,
-3.51693, 1, -6.899181, 0, -0.5, 0.5, 0.5,
-3.51693, 1, -6.899181, 1, -0.5, 0.5, 0.5,
-3.51693, 1, -6.899181, 1, 1.5, 0.5, 0.5,
-3.51693, 1, -6.899181, 0, 1.5, 0.5, 0.5,
-3.51693, 2, -6.899181, 0, -0.5, 0.5, 0.5,
-3.51693, 2, -6.899181, 1, -0.5, 0.5, 0.5,
-3.51693, 2, -6.899181, 1, 1.5, 0.5, 0.5,
-3.51693, 2, -6.899181, 0, 1.5, 0.5, 0.5,
-3.51693, 3, -6.899181, 0, -0.5, 0.5, 0.5,
-3.51693, 3, -6.899181, 1, -0.5, 0.5, 0.5,
-3.51693, 3, -6.899181, 1, 1.5, 0.5, 0.5,
-3.51693, 3, -6.899181, 0, 1.5, 0.5, 0.5
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
-3.022022, -3.328296, -4,
-3.022022, -3.328296, 4,
-3.022022, -3.328296, -4,
-3.186991, -3.500786, -4,
-3.022022, -3.328296, -2,
-3.186991, -3.500786, -2,
-3.022022, -3.328296, 0,
-3.186991, -3.500786, 0,
-3.022022, -3.328296, 2,
-3.186991, -3.500786, 2,
-3.022022, -3.328296, 4,
-3.186991, -3.500786, 4
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
-3.51693, -3.845763, -4, 0, -0.5, 0.5, 0.5,
-3.51693, -3.845763, -4, 1, -0.5, 0.5, 0.5,
-3.51693, -3.845763, -4, 1, 1.5, 0.5, 0.5,
-3.51693, -3.845763, -4, 0, 1.5, 0.5, 0.5,
-3.51693, -3.845763, -2, 0, -0.5, 0.5, 0.5,
-3.51693, -3.845763, -2, 1, -0.5, 0.5, 0.5,
-3.51693, -3.845763, -2, 1, 1.5, 0.5, 0.5,
-3.51693, -3.845763, -2, 0, 1.5, 0.5, 0.5,
-3.51693, -3.845763, 0, 0, -0.5, 0.5, 0.5,
-3.51693, -3.845763, 0, 1, -0.5, 0.5, 0.5,
-3.51693, -3.845763, 0, 1, 1.5, 0.5, 0.5,
-3.51693, -3.845763, 0, 0, 1.5, 0.5, 0.5,
-3.51693, -3.845763, 2, 0, -0.5, 0.5, 0.5,
-3.51693, -3.845763, 2, 1, -0.5, 0.5, 0.5,
-3.51693, -3.845763, 2, 1, 1.5, 0.5, 0.5,
-3.51693, -3.845763, 2, 0, 1.5, 0.5, 0.5,
-3.51693, -3.845763, 4, 0, -0.5, 0.5, 0.5,
-3.51693, -3.845763, 4, 1, -0.5, 0.5, 0.5,
-3.51693, -3.845763, 4, 1, 1.5, 0.5, 0.5,
-3.51693, -3.845763, 4, 0, 1.5, 0.5, 0.5
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
-3.022022, -3.328296, -6.05396,
-3.022022, 3.571261, -6.05396,
-3.022022, -3.328296, 5.215651,
-3.022022, 3.571261, 5.215651,
-3.022022, -3.328296, -6.05396,
-3.022022, -3.328296, 5.215651,
-3.022022, 3.571261, -6.05396,
-3.022022, 3.571261, 5.215651,
-3.022022, -3.328296, -6.05396,
3.576741, -3.328296, -6.05396,
-3.022022, -3.328296, 5.215651,
3.576741, -3.328296, 5.215651,
-3.022022, 3.571261, -6.05396,
3.576741, 3.571261, -6.05396,
-3.022022, 3.571261, 5.215651,
3.576741, 3.571261, 5.215651,
3.576741, -3.328296, -6.05396,
3.576741, 3.571261, -6.05396,
3.576741, -3.328296, 5.215651,
3.576741, 3.571261, 5.215651,
3.576741, -3.328296, -6.05396,
3.576741, -3.328296, 5.215651,
3.576741, 3.571261, -6.05396,
3.576741, 3.571261, 5.215651
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
var radius = 7.886872;
var distance = 35.08958;
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
mvMatrix.translate( -0.2773592, -0.1214825, 0.4191546 );
mvMatrix.scale( 1.292279, 1.23594, 0.7566757 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.08958);
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
chlornitrofen<-read.table("chlornitrofen.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-chlornitrofen$V2
```

```
## Error in eval(expr, envir, enclos): object 'chlornitrofen' not found
```

```r
y<-chlornitrofen$V3
```

```
## Error in eval(expr, envir, enclos): object 'chlornitrofen' not found
```

```r
z<-chlornitrofen$V4
```

```
## Error in eval(expr, envir, enclos): object 'chlornitrofen' not found
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
-2.925924, 0.08323029, 0.04141944, 0, 0, 1, 1, 1,
-2.802074, 1.256616, -1.539862, 1, 0, 0, 1, 1,
-2.6228, 0.09320007, -4.63616, 1, 0, 0, 1, 1,
-2.61832, 0.05481837, -0.7440288, 1, 0, 0, 1, 1,
-2.610974, -0.5025663, -0.5333292, 1, 0, 0, 1, 1,
-2.558113, 1.662118, 0.1475693, 1, 0, 0, 1, 1,
-2.547923, 2.531244, -1.423457, 0, 0, 0, 1, 1,
-2.51642, 2.19967, -0.7181528, 0, 0, 0, 1, 1,
-2.512999, 2.165066, -0.7073967, 0, 0, 0, 1, 1,
-2.450063, -0.8898163, -2.812918, 0, 0, 0, 1, 1,
-2.341926, -0.3238785, -1.12794, 0, 0, 0, 1, 1,
-2.224954, 2.010221, -0.04550939, 0, 0, 0, 1, 1,
-2.185507, 1.392961, -1.120194, 0, 0, 0, 1, 1,
-2.184108, 0.3129037, -0.625482, 1, 1, 1, 1, 1,
-2.047048, -1.365586, -0.3149728, 1, 1, 1, 1, 1,
-2.032164, -1.36068, -2.182206, 1, 1, 1, 1, 1,
-2.023799, -0.8906354, -1.158671, 1, 1, 1, 1, 1,
-2.018661, 0.1734537, -2.099646, 1, 1, 1, 1, 1,
-2.005859, -1.113243, -0.8647053, 1, 1, 1, 1, 1,
-1.994362, -0.7906532, -2.41611, 1, 1, 1, 1, 1,
-1.987092, -1.077336, -2.622216, 1, 1, 1, 1, 1,
-1.969813, -0.1487028, -1.286896, 1, 1, 1, 1, 1,
-1.954418, 0.8776922, -2.562727, 1, 1, 1, 1, 1,
-1.937846, -0.4976932, -2.473583, 1, 1, 1, 1, 1,
-1.907521, 0.5582504, -2.140891, 1, 1, 1, 1, 1,
-1.902769, -0.3471351, 1.099078, 1, 1, 1, 1, 1,
-1.874055, -0.7261536, -1.873404, 1, 1, 1, 1, 1,
-1.846827, -1.014734, -2.221457, 1, 1, 1, 1, 1,
-1.839405, -2.223, -2.127168, 0, 0, 1, 1, 1,
-1.815058, -1.009479, -4.529235, 1, 0, 0, 1, 1,
-1.814306, -0.03810665, -1.201354, 1, 0, 0, 1, 1,
-1.79111, 0.03406295, -1.047687, 1, 0, 0, 1, 1,
-1.761883, -0.396753, -3.154036, 1, 0, 0, 1, 1,
-1.761155, -0.8342089, -1.566716, 1, 0, 0, 1, 1,
-1.755117, -0.1796221, -1.78945, 0, 0, 0, 1, 1,
-1.748585, -0.7744806, -3.502996, 0, 0, 0, 1, 1,
-1.743294, 0.7894487, -1.603217, 0, 0, 0, 1, 1,
-1.735188, -1.917563, -2.130915, 0, 0, 0, 1, 1,
-1.720161, 2.31483, 0.008226303, 0, 0, 0, 1, 1,
-1.716311, -1.404699, -5.577966, 0, 0, 0, 1, 1,
-1.704915, 0.1345418, -0.4821744, 0, 0, 0, 1, 1,
-1.697518, 0.4392266, -0.1294994, 1, 1, 1, 1, 1,
-1.692945, -1.116145, -2.883296, 1, 1, 1, 1, 1,
-1.684984, 0.08804427, -2.070362, 1, 1, 1, 1, 1,
-1.681688, 0.767067, -0.2782483, 1, 1, 1, 1, 1,
-1.673412, 1.455235, -0.3667106, 1, 1, 1, 1, 1,
-1.666846, 0.1949425, -2.343368, 1, 1, 1, 1, 1,
-1.663971, 1.244407, -1.478103, 1, 1, 1, 1, 1,
-1.657275, -0.5272995, -1.041653, 1, 1, 1, 1, 1,
-1.628623, -1.311503, -0.6965533, 1, 1, 1, 1, 1,
-1.625259, -1.034203, -3.117969, 1, 1, 1, 1, 1,
-1.618828, -0.9569877, -2.028873, 1, 1, 1, 1, 1,
-1.617414, -1.032492, -1.555809, 1, 1, 1, 1, 1,
-1.616468, -1.505679, -2.360291, 1, 1, 1, 1, 1,
-1.613967, 1.040736, -0.9479074, 1, 1, 1, 1, 1,
-1.605991, 0.8097148, -1.272834, 1, 1, 1, 1, 1,
-1.597745, 0.6829147, -1.147466, 0, 0, 1, 1, 1,
-1.590759, -1.057033, -0.7625365, 1, 0, 0, 1, 1,
-1.569711, -0.3252826, -1.40195, 1, 0, 0, 1, 1,
-1.559526, 2.217109, 0.3909199, 1, 0, 0, 1, 1,
-1.542177, 1.070298, -1.029239, 1, 0, 0, 1, 1,
-1.540425, -1.101921, -0.1158516, 1, 0, 0, 1, 1,
-1.518447, -0.4525632, 0.1801312, 0, 0, 0, 1, 1,
-1.517708, 1.794734, 0.2810421, 0, 0, 0, 1, 1,
-1.514197, -0.9586483, -2.586986, 0, 0, 0, 1, 1,
-1.504969, -0.2421902, -1.491822, 0, 0, 0, 1, 1,
-1.498177, -0.2969894, -2.222112, 0, 0, 0, 1, 1,
-1.484014, 0.02231835, -3.034945, 0, 0, 0, 1, 1,
-1.481814, 0.5379719, -1.794023, 0, 0, 0, 1, 1,
-1.470445, 0.5459522, -1.941955, 1, 1, 1, 1, 1,
-1.469441, -0.6387634, -1.38799, 1, 1, 1, 1, 1,
-1.459605, 0.7896726, 0.6497813, 1, 1, 1, 1, 1,
-1.456886, 0.07455, -2.031985, 1, 1, 1, 1, 1,
-1.450178, 0.5849848, -1.727626, 1, 1, 1, 1, 1,
-1.443354, 0.6725963, -1.833947, 1, 1, 1, 1, 1,
-1.431421, 0.3958977, -1.38318, 1, 1, 1, 1, 1,
-1.421812, -0.2303536, -3.161646, 1, 1, 1, 1, 1,
-1.419498, -0.7225029, 0.06953779, 1, 1, 1, 1, 1,
-1.410644, -0.08218711, -1.703837, 1, 1, 1, 1, 1,
-1.407178, 0.5399129, 0.5905606, 1, 1, 1, 1, 1,
-1.402031, -1.083686, -2.963245, 1, 1, 1, 1, 1,
-1.396806, 0.3021767, -1.710703, 1, 1, 1, 1, 1,
-1.392489, 0.7320912, -1.7539, 1, 1, 1, 1, 1,
-1.391245, -0.05834191, -0.3660706, 1, 1, 1, 1, 1,
-1.390976, 0.6449842, -0.5102474, 0, 0, 1, 1, 1,
-1.388898, -0.11457, -2.287107, 1, 0, 0, 1, 1,
-1.374081, -0.04114047, -4.111048, 1, 0, 0, 1, 1,
-1.371255, -0.4991988, -1.941118, 1, 0, 0, 1, 1,
-1.371001, 1.483545, -2.481945, 1, 0, 0, 1, 1,
-1.368151, -0.5352361, -1.090585, 1, 0, 0, 1, 1,
-1.365368, -0.905751, -2.037169, 0, 0, 0, 1, 1,
-1.350822, 0.3292063, 0.6472077, 0, 0, 0, 1, 1,
-1.346256, -0.9281526, -1.92698, 0, 0, 0, 1, 1,
-1.342561, -0.1140328, -3.284918, 0, 0, 0, 1, 1,
-1.341795, 0.02150953, -1.417536, 0, 0, 0, 1, 1,
-1.338133, -1.061835, -2.480711, 0, 0, 0, 1, 1,
-1.334064, 1.461655, 0.7208337, 0, 0, 0, 1, 1,
-1.333842, 1.309055, -0.921806, 1, 1, 1, 1, 1,
-1.332089, 0.3227222, -0.05741005, 1, 1, 1, 1, 1,
-1.325051, 0.3515759, -0.6937417, 1, 1, 1, 1, 1,
-1.313402, -1.669584, -2.913208, 1, 1, 1, 1, 1,
-1.30376, -0.002916428, -1.050057, 1, 1, 1, 1, 1,
-1.303549, -0.7570307, 0.5884127, 1, 1, 1, 1, 1,
-1.300486, -1.580298, -1.762457, 1, 1, 1, 1, 1,
-1.293172, 0.8683646, -2.15433, 1, 1, 1, 1, 1,
-1.288901, -2.872366, -2.835367, 1, 1, 1, 1, 1,
-1.288279, -2.137159, -4.764753, 1, 1, 1, 1, 1,
-1.278346, 1.059394, -2.303793, 1, 1, 1, 1, 1,
-1.276588, -0.3365593, -0.8335466, 1, 1, 1, 1, 1,
-1.269736, 0.1179798, -2.099134, 1, 1, 1, 1, 1,
-1.265864, 1.085868, -1.697841, 1, 1, 1, 1, 1,
-1.261454, 0.8875847, 0.5589644, 1, 1, 1, 1, 1,
-1.257398, 1.054999, -0.8448927, 0, 0, 1, 1, 1,
-1.248023, 0.8390043, -0.4600535, 1, 0, 0, 1, 1,
-1.237939, 0.869184, -0.3740535, 1, 0, 0, 1, 1,
-1.235696, -1.460337, -3.092238, 1, 0, 0, 1, 1,
-1.233348, -1.221535, -1.953713, 1, 0, 0, 1, 1,
-1.224128, -0.9724194, -0.9188671, 1, 0, 0, 1, 1,
-1.224078, 0.4838941, -0.6616692, 0, 0, 0, 1, 1,
-1.214236, -1.086399, -2.485109, 0, 0, 0, 1, 1,
-1.213494, 0.1531684, -1.553629, 0, 0, 0, 1, 1,
-1.210193, 1.593133, 0.3219557, 0, 0, 0, 1, 1,
-1.201828, 0.8885486, -1.060156, 0, 0, 0, 1, 1,
-1.192546, 0.2830318, -1.413692, 0, 0, 0, 1, 1,
-1.192196, 1.331916, -0.4927925, 0, 0, 0, 1, 1,
-1.18633, -1.465955, -3.380543, 1, 1, 1, 1, 1,
-1.185848, 0.4766918, -0.6619592, 1, 1, 1, 1, 1,
-1.176202, 1.133002, -0.4352501, 1, 1, 1, 1, 1,
-1.168369, 1.079518, -0.9620588, 1, 1, 1, 1, 1,
-1.165571, 0.2360032, -0.7504542, 1, 1, 1, 1, 1,
-1.151063, -1.993902, -3.771841, 1, 1, 1, 1, 1,
-1.149409, 0.5381222, -2.363654, 1, 1, 1, 1, 1,
-1.144857, 0.6844908, -1.111867, 1, 1, 1, 1, 1,
-1.144685, 0.0184796, -1.49515, 1, 1, 1, 1, 1,
-1.131203, -0.6539117, -3.5344, 1, 1, 1, 1, 1,
-1.130826, 0.2932225, -0.9690824, 1, 1, 1, 1, 1,
-1.128376, -0.194602, -3.333595, 1, 1, 1, 1, 1,
-1.119348, -0.01328414, -0.1062557, 1, 1, 1, 1, 1,
-1.118757, -0.5361616, -2.776554, 1, 1, 1, 1, 1,
-1.109581, -1.452323, -1.17306, 1, 1, 1, 1, 1,
-1.10692, -1.167284, -2.358406, 0, 0, 1, 1, 1,
-1.10612, -1.028929, -1.409641, 1, 0, 0, 1, 1,
-1.104149, 1.160388, -2.159175, 1, 0, 0, 1, 1,
-1.100317, 1.211869, 0.07384857, 1, 0, 0, 1, 1,
-1.093855, -0.4987385, -1.806148, 1, 0, 0, 1, 1,
-1.093603, 0.8936037, 0.8045112, 1, 0, 0, 1, 1,
-1.090884, 0.5140625, -1.390579, 0, 0, 0, 1, 1,
-1.090427, 0.2006877, -1.506433, 0, 0, 0, 1, 1,
-1.088761, 1.085074, 0.3066375, 0, 0, 0, 1, 1,
-1.08812, 0.4725538, -1.938705, 0, 0, 0, 1, 1,
-1.08394, -0.8926701, -2.341187, 0, 0, 0, 1, 1,
-1.077658, 1.471312, -0.8913887, 0, 0, 0, 1, 1,
-1.077388, 0.2640966, -0.7959239, 0, 0, 0, 1, 1,
-1.064863, -2.448728, -3.697931, 1, 1, 1, 1, 1,
-1.062829, -1.031292, -1.323144, 1, 1, 1, 1, 1,
-1.054231, 1.279593, 0.9045461, 1, 1, 1, 1, 1,
-1.052767, -1.559306, -0.4871373, 1, 1, 1, 1, 1,
-1.050992, -1.848758, -0.4682657, 1, 1, 1, 1, 1,
-1.050605, 0.9013877, -0.9730989, 1, 1, 1, 1, 1,
-1.045504, 0.741087, -1.195605, 1, 1, 1, 1, 1,
-1.043274, 0.06475825, -0.1978385, 1, 1, 1, 1, 1,
-1.041047, 0.5293814, -0.7148946, 1, 1, 1, 1, 1,
-1.039928, -0.1922413, -1.276083, 1, 1, 1, 1, 1,
-1.033616, -0.56167, -2.765028, 1, 1, 1, 1, 1,
-1.015359, -0.8577918, -3.526705, 1, 1, 1, 1, 1,
-1.013271, 0.2042588, -0.1664098, 1, 1, 1, 1, 1,
-1.009158, 0.6960827, 0.8927612, 1, 1, 1, 1, 1,
-1.007663, 1.221818, -1.845024, 1, 1, 1, 1, 1,
-1.001683, -0.5167857, -1.357537, 0, 0, 1, 1, 1,
-0.9994034, -0.3067201, -2.480395, 1, 0, 0, 1, 1,
-0.9946155, -0.5646114, -2.515659, 1, 0, 0, 1, 1,
-0.9942524, -1.558445, -5.634032, 1, 0, 0, 1, 1,
-0.9936478, 1.67041, -1.136755, 1, 0, 0, 1, 1,
-0.9902056, 1.780337, -0.9093772, 1, 0, 0, 1, 1,
-0.9892111, -0.6712222, -2.200062, 0, 0, 0, 1, 1,
-0.9871457, -0.3026515, -0.615063, 0, 0, 0, 1, 1,
-0.985128, -0.6291182, -1.727806, 0, 0, 0, 1, 1,
-0.9821498, -0.5639345, -2.124219, 0, 0, 0, 1, 1,
-0.9754531, 0.7487468, -0.6438378, 0, 0, 0, 1, 1,
-0.9743885, 1.299134, -1.306619, 0, 0, 0, 1, 1,
-0.9719412, 1.118887, 0.6405618, 0, 0, 0, 1, 1,
-0.9712951, -0.9182263, -2.468444, 1, 1, 1, 1, 1,
-0.9669438, -0.3388692, -1.242513, 1, 1, 1, 1, 1,
-0.9594339, 0.1531996, -2.228737, 1, 1, 1, 1, 1,
-0.9396765, -1.365107, -3.12661, 1, 1, 1, 1, 1,
-0.939635, -0.5243641, -0.9341246, 1, 1, 1, 1, 1,
-0.9340553, -0.1226612, -1.764668, 1, 1, 1, 1, 1,
-0.912973, -0.5842301, -2.544106, 1, 1, 1, 1, 1,
-0.9120542, -0.183293, -1.133813, 1, 1, 1, 1, 1,
-0.9035195, 1.926243, -0.8362374, 1, 1, 1, 1, 1,
-0.8990591, -0.5349432, -1.602485, 1, 1, 1, 1, 1,
-0.8959833, -0.9820176, -2.689654, 1, 1, 1, 1, 1,
-0.8882975, -0.1400906, -2.055172, 1, 1, 1, 1, 1,
-0.8872031, -1.420541, -2.739317, 1, 1, 1, 1, 1,
-0.8867023, 0.9849788, 0.7316287, 1, 1, 1, 1, 1,
-0.881248, -2.432368, -4.059007, 1, 1, 1, 1, 1,
-0.8652355, 0.8305609, -1.128701, 0, 0, 1, 1, 1,
-0.8615398, -0.9733057, -4.246292, 1, 0, 0, 1, 1,
-0.8594998, -0.3175044, -3.385747, 1, 0, 0, 1, 1,
-0.8542837, 0.1380419, -1.658365, 1, 0, 0, 1, 1,
-0.8533713, -0.9943172, -1.907837, 1, 0, 0, 1, 1,
-0.8372366, 0.8926507, 0.7639713, 1, 0, 0, 1, 1,
-0.832287, -2.000362, -1.604011, 0, 0, 0, 1, 1,
-0.8316364, 0.1812191, -2.387075, 0, 0, 0, 1, 1,
-0.8298051, 0.2861906, -0.8521972, 0, 0, 0, 1, 1,
-0.826547, -0.5554606, -4.273066, 0, 0, 0, 1, 1,
-0.8190356, -0.2289567, -1.8446, 0, 0, 0, 1, 1,
-0.814674, -0.05860128, -2.151463, 0, 0, 0, 1, 1,
-0.808886, 1.872792, 0.5194731, 0, 0, 0, 1, 1,
-0.8061205, -1.184439, -1.716829, 1, 1, 1, 1, 1,
-0.8060358, -0.5694954, -2.404552, 1, 1, 1, 1, 1,
-0.8050971, 0.1036447, -1.790561, 1, 1, 1, 1, 1,
-0.7962969, -0.8148595, -3.759968, 1, 1, 1, 1, 1,
-0.7949556, -1.220572, -3.290959, 1, 1, 1, 1, 1,
-0.7899466, -0.6745262, -1.447874, 1, 1, 1, 1, 1,
-0.7884936, 0.2353367, -0.3427974, 1, 1, 1, 1, 1,
-0.7880685, -0.7801002, -0.06275494, 1, 1, 1, 1, 1,
-0.7870949, -0.5864809, -2.282779, 1, 1, 1, 1, 1,
-0.7869877, 0.5561842, -3.02036, 1, 1, 1, 1, 1,
-0.7824635, -0.9138159, -4.120854, 1, 1, 1, 1, 1,
-0.7757068, 0.588195, -2.301404, 1, 1, 1, 1, 1,
-0.77012, 0.1365684, -0.5309286, 1, 1, 1, 1, 1,
-0.7685412, 1.4584, -0.6999336, 1, 1, 1, 1, 1,
-0.7652728, 1.716688, -1.443891, 1, 1, 1, 1, 1,
-0.7629899, 0.2085441, 0.5622907, 0, 0, 1, 1, 1,
-0.7582586, -0.2130951, -1.5405, 1, 0, 0, 1, 1,
-0.7562012, 1.245584, -1.289849, 1, 0, 0, 1, 1,
-0.7532367, -0.7141593, -3.068537, 1, 0, 0, 1, 1,
-0.7517713, -0.3039484, -2.35063, 1, 0, 0, 1, 1,
-0.7500113, -0.2660786, -2.570805, 1, 0, 0, 1, 1,
-0.7471309, -0.160428, -2.27709, 0, 0, 0, 1, 1,
-0.7470397, 1.124028, -0.8252924, 0, 0, 0, 1, 1,
-0.7461164, 1.056178, 0.1931536, 0, 0, 0, 1, 1,
-0.7424526, -0.8976992, -2.001599, 0, 0, 0, 1, 1,
-0.7410625, -2.40087, -4.256518, 0, 0, 0, 1, 1,
-0.7294311, 1.238894, -0.04683167, 0, 0, 0, 1, 1,
-0.7292386, 1.258506, -0.4561515, 0, 0, 0, 1, 1,
-0.7289523, 0.09311979, -1.090602, 1, 1, 1, 1, 1,
-0.7264466, -0.6159655, -2.168834, 1, 1, 1, 1, 1,
-0.7193753, -0.4895812, -3.216983, 1, 1, 1, 1, 1,
-0.7188699, -0.314935, -3.633198, 1, 1, 1, 1, 1,
-0.7167892, -0.1891408, -1.889595, 1, 1, 1, 1, 1,
-0.71327, 0.2075769, -0.8143384, 1, 1, 1, 1, 1,
-0.712409, 0.1602358, -0.6827711, 1, 1, 1, 1, 1,
-0.7095839, 0.5249146, -0.1876521, 1, 1, 1, 1, 1,
-0.7060341, 0.9886902, -0.7540754, 1, 1, 1, 1, 1,
-0.6961085, 0.9304477, -0.8823878, 1, 1, 1, 1, 1,
-0.6957173, -0.6452835, -1.870027, 1, 1, 1, 1, 1,
-0.6935924, 0.7892702, -1.825924, 1, 1, 1, 1, 1,
-0.6925203, -0.4718742, -2.749239, 1, 1, 1, 1, 1,
-0.6918089, -0.4913991, -1.553888, 1, 1, 1, 1, 1,
-0.6880933, 0.7061234, -0.9897547, 1, 1, 1, 1, 1,
-0.6728035, -0.3385138, -2.193369, 0, 0, 1, 1, 1,
-0.6709272, -1.615597, -3.136335, 1, 0, 0, 1, 1,
-0.6703966, -0.4721379, -2.234282, 1, 0, 0, 1, 1,
-0.668191, 1.559512, -1.768869, 1, 0, 0, 1, 1,
-0.6672192, -1.058063, -1.10814, 1, 0, 0, 1, 1,
-0.6645897, -1.228917, -1.521832, 1, 0, 0, 1, 1,
-0.6628357, -0.05632179, -2.054839, 0, 0, 0, 1, 1,
-0.6611155, 1.410354, -0.6861944, 0, 0, 0, 1, 1,
-0.6598276, -0.7478951, -3.492835, 0, 0, 0, 1, 1,
-0.6522675, 0.0440091, -2.675465, 0, 0, 0, 1, 1,
-0.6505, -2.251969, -3.555581, 0, 0, 0, 1, 1,
-0.648712, 0.2634907, -0.7032993, 0, 0, 0, 1, 1,
-0.6448647, 1.062107, -1.04243, 0, 0, 0, 1, 1,
-0.6414906, 0.2863057, -1.798753, 1, 1, 1, 1, 1,
-0.6319474, 0.1267068, 0.05350863, 1, 1, 1, 1, 1,
-0.6230959, -0.4785417, -1.179361, 1, 1, 1, 1, 1,
-0.6200996, -0.21644, -1.366581, 1, 1, 1, 1, 1,
-0.6182888, -0.0698954, -0.5556985, 1, 1, 1, 1, 1,
-0.6167585, -1.232194, -1.355549, 1, 1, 1, 1, 1,
-0.6141918, -3.043303, -3.179917, 1, 1, 1, 1, 1,
-0.612149, 1.457496, 0.1302755, 1, 1, 1, 1, 1,
-0.6096628, -0.7209691, -3.179133, 1, 1, 1, 1, 1,
-0.6057071, -1.972652, -2.20061, 1, 1, 1, 1, 1,
-0.6026942, 0.4801104, 1.616161, 1, 1, 1, 1, 1,
-0.6017278, -0.2481107, -0.9007266, 1, 1, 1, 1, 1,
-0.6011667, 0.786475, -1.412504, 1, 1, 1, 1, 1,
-0.6002582, -0.5791201, -0.7255322, 1, 1, 1, 1, 1,
-0.5974467, 1.556462, -1.15895, 1, 1, 1, 1, 1,
-0.5958749, -1.367668, -3.116869, 0, 0, 1, 1, 1,
-0.5940863, -0.6724261, -3.356066, 1, 0, 0, 1, 1,
-0.593919, -1.54838, -2.4437, 1, 0, 0, 1, 1,
-0.5935594, 0.9385189, -1.960893, 1, 0, 0, 1, 1,
-0.5879047, 1.653515, 1.2054, 1, 0, 0, 1, 1,
-0.5872046, -0.9397866, -2.619679, 1, 0, 0, 1, 1,
-0.5843024, -0.6932891, -3.148134, 0, 0, 0, 1, 1,
-0.5797481, 0.6508027, -2.252007, 0, 0, 0, 1, 1,
-0.57695, -1.1313, -3.385044, 0, 0, 0, 1, 1,
-0.5744939, 0.5229433, -1.681911, 0, 0, 0, 1, 1,
-0.5744179, -0.1514004, -1.947272, 0, 0, 0, 1, 1,
-0.5743929, -0.7938303, -3.033717, 0, 0, 0, 1, 1,
-0.569793, 1.381075, -0.4142037, 0, 0, 0, 1, 1,
-0.5657746, 1.695273, -0.347185, 1, 1, 1, 1, 1,
-0.5575927, 1.145852, -0.2558121, 1, 1, 1, 1, 1,
-0.5536307, -0.7986439, -3.851277, 1, 1, 1, 1, 1,
-0.5520601, -0.2385429, -3.298755, 1, 1, 1, 1, 1,
-0.5499499, -0.08047603, -3.529716, 1, 1, 1, 1, 1,
-0.5498567, 0.9662096, -1.614656, 1, 1, 1, 1, 1,
-0.5495897, -0.881789, -3.962579, 1, 1, 1, 1, 1,
-0.5478535, 1.107946, -1.997249, 1, 1, 1, 1, 1,
-0.5450252, 0.7135747, -0.3433899, 1, 1, 1, 1, 1,
-0.5431818, 0.5719875, -1.435268, 1, 1, 1, 1, 1,
-0.542625, -1.110084, -3.193121, 1, 1, 1, 1, 1,
-0.5407062, -0.3471028, -2.529307, 1, 1, 1, 1, 1,
-0.5348324, 1.579104, 0.7250717, 1, 1, 1, 1, 1,
-0.5264827, -1.970225, -3.615624, 1, 1, 1, 1, 1,
-0.5234215, -0.6294461, -2.371842, 1, 1, 1, 1, 1,
-0.5187535, -0.2958414, -0.04275706, 0, 0, 1, 1, 1,
-0.5103769, -2.126087, -3.027132, 1, 0, 0, 1, 1,
-0.5085285, -1.281239, -5.149068, 1, 0, 0, 1, 1,
-0.5083979, 0.661375, 0.770663, 1, 0, 0, 1, 1,
-0.5054828, 0.7981715, 0.2744512, 1, 0, 0, 1, 1,
-0.4976205, -0.7089248, -3.091976, 1, 0, 0, 1, 1,
-0.4913992, -0.8588917, -3.429956, 0, 0, 0, 1, 1,
-0.490566, 1.745204, -0.4135121, 0, 0, 0, 1, 1,
-0.4894073, 0.1691172, -1.88899, 0, 0, 0, 1, 1,
-0.4864405, -1.730611, -2.503667, 0, 0, 0, 1, 1,
-0.4826014, -0.5981087, -2.618017, 0, 0, 0, 1, 1,
-0.4729158, 0.5508392, -0.02790256, 0, 0, 0, 1, 1,
-0.4724917, 3.230279, -0.840388, 0, 0, 0, 1, 1,
-0.469335, -0.8404488, -2.302172, 1, 1, 1, 1, 1,
-0.4653002, -2.051234, -3.094575, 1, 1, 1, 1, 1,
-0.4630195, -0.5630112, -1.700925, 1, 1, 1, 1, 1,
-0.4608796, -0.2077681, -0.7302592, 1, 1, 1, 1, 1,
-0.4583819, 1.458549, -0.8522702, 1, 1, 1, 1, 1,
-0.4565071, -0.09548288, -1.448878, 1, 1, 1, 1, 1,
-0.4544758, -0.3131698, -1.685761, 1, 1, 1, 1, 1,
-0.4533077, 0.07788736, -1.335196, 1, 1, 1, 1, 1,
-0.4450228, -1.327478, -2.893034, 1, 1, 1, 1, 1,
-0.4437374, -0.04631142, -1.423943, 1, 1, 1, 1, 1,
-0.4370002, -0.168031, -0.3512024, 1, 1, 1, 1, 1,
-0.4359937, 0.5931528, -0.8363456, 1, 1, 1, 1, 1,
-0.4339212, 0.4726132, -1.403789, 1, 1, 1, 1, 1,
-0.4280299, 1.795691, -0.7581487, 1, 1, 1, 1, 1,
-0.426615, -0.06489683, -2.975182, 1, 1, 1, 1, 1,
-0.4226113, 0.5759075, 0.00524575, 0, 0, 1, 1, 1,
-0.4178753, -1.155677, -2.895626, 1, 0, 0, 1, 1,
-0.4159355, -0.7096535, -1.26688, 1, 0, 0, 1, 1,
-0.4136564, -0.3434524, -0.9149228, 1, 0, 0, 1, 1,
-0.4119688, -0.2952261, -2.422083, 1, 0, 0, 1, 1,
-0.4115599, -0.5783453, -2.150573, 1, 0, 0, 1, 1,
-0.4108864, -2.064238, -4.311567, 0, 0, 0, 1, 1,
-0.4082055, 1.784438, 0.4457729, 0, 0, 0, 1, 1,
-0.4038138, 0.9469518, -0.7351213, 0, 0, 0, 1, 1,
-0.4007576, 0.516271, 0.6769792, 0, 0, 0, 1, 1,
-0.3982069, -0.03978476, -0.9835006, 0, 0, 0, 1, 1,
-0.3967487, -0.6168696, -1.948796, 0, 0, 0, 1, 1,
-0.3913646, 0.319183, -2.170015, 0, 0, 0, 1, 1,
-0.3846989, 1.328984, 0.5266258, 1, 1, 1, 1, 1,
-0.3840107, 1.786515, -0.04564276, 1, 1, 1, 1, 1,
-0.3822098, -0.2123997, -2.614271, 1, 1, 1, 1, 1,
-0.3815922, -0.03921148, -1.78895, 1, 1, 1, 1, 1,
-0.3793415, -1.896599, -3.053254, 1, 1, 1, 1, 1,
-0.3771178, 0.6391742, -0.478525, 1, 1, 1, 1, 1,
-0.3765657, -0.2615764, -4.03284, 1, 1, 1, 1, 1,
-0.3738491, 0.8210819, -0.4329605, 1, 1, 1, 1, 1,
-0.3710502, 0.3347898, 0.04310413, 1, 1, 1, 1, 1,
-0.3705262, 0.06829124, -1.793947, 1, 1, 1, 1, 1,
-0.3701377, -0.6735484, -2.880675, 1, 1, 1, 1, 1,
-0.3641846, -0.4135631, -2.936338, 1, 1, 1, 1, 1,
-0.3634892, -0.3524643, -1.565197, 1, 1, 1, 1, 1,
-0.3613305, -0.3592028, -2.56015, 1, 1, 1, 1, 1,
-0.3583026, 0.8260214, -0.4223026, 1, 1, 1, 1, 1,
-0.3562387, -0.5677227, -1.578122, 0, 0, 1, 1, 1,
-0.3547105, 0.5594569, 0.6033304, 1, 0, 0, 1, 1,
-0.3539874, -0.8935391, -3.593709, 1, 0, 0, 1, 1,
-0.3529273, -1.989037, -2.829838, 1, 0, 0, 1, 1,
-0.3528433, 1.07456, -0.09689212, 1, 0, 0, 1, 1,
-0.3528214, 0.3454472, -1.829057, 1, 0, 0, 1, 1,
-0.3482035, -0.4501858, -3.428416, 0, 0, 0, 1, 1,
-0.3434007, 0.3041157, -1.543005, 0, 0, 0, 1, 1,
-0.3424397, -0.186699, -2.783871, 0, 0, 0, 1, 1,
-0.335889, -1.509, -4.946104, 0, 0, 0, 1, 1,
-0.3336632, -0.1772712, -1.712736, 0, 0, 0, 1, 1,
-0.3318529, -0.48161, -2.483153, 0, 0, 0, 1, 1,
-0.3313344, -2.578386, -2.51152, 0, 0, 0, 1, 1,
-0.3292423, 1.521022, 0.1610881, 1, 1, 1, 1, 1,
-0.3277505, -0.1697441, -2.578698, 1, 1, 1, 1, 1,
-0.3273674, -1.006805, -2.850736, 1, 1, 1, 1, 1,
-0.3229046, -0.5461199, -2.378457, 1, 1, 1, 1, 1,
-0.3108644, 2.031314, -0.8869531, 1, 1, 1, 1, 1,
-0.3093543, -0.298566, -1.686586, 1, 1, 1, 1, 1,
-0.3066473, -0.3105624, -1.256398, 1, 1, 1, 1, 1,
-0.3064972, -1.189291, -1.599557, 1, 1, 1, 1, 1,
-0.3047348, 0.5058482, -2.41851, 1, 1, 1, 1, 1,
-0.3037457, 0.2423989, -0.4149136, 1, 1, 1, 1, 1,
-0.2999289, -0.1337285, -3.191601, 1, 1, 1, 1, 1,
-0.2993653, 0.6178789, -0.7008423, 1, 1, 1, 1, 1,
-0.2956827, -1.23232, -3.446397, 1, 1, 1, 1, 1,
-0.2955898, 0.3099481, 0.2151902, 1, 1, 1, 1, 1,
-0.2946137, 0.006057807, -1.925592, 1, 1, 1, 1, 1,
-0.2871095, -1.441285, -2.603207, 0, 0, 1, 1, 1,
-0.2857243, -0.5686633, -2.480643, 1, 0, 0, 1, 1,
-0.2855999, -0.5386646, -1.605907, 1, 0, 0, 1, 1,
-0.282537, 0.7073049, -2.064233, 1, 0, 0, 1, 1,
-0.2812295, 0.8597056, -1.161947, 1, 0, 0, 1, 1,
-0.2809847, 0.9184052, 0.9604648, 1, 0, 0, 1, 1,
-0.280709, 1.601147, -2.463715, 0, 0, 0, 1, 1,
-0.279939, 0.4229532, -1.543395, 0, 0, 0, 1, 1,
-0.27805, 1.23526, 1.13914, 0, 0, 0, 1, 1,
-0.2668714, -1.184602, -2.725301, 0, 0, 0, 1, 1,
-0.2654973, -0.8843573, -3.955426, 0, 0, 0, 1, 1,
-0.2644777, 0.6831952, -1.03252, 0, 0, 0, 1, 1,
-0.2638724, 0.5077553, -1.127515, 0, 0, 0, 1, 1,
-0.263577, -0.2169562, -1.541182, 1, 1, 1, 1, 1,
-0.2617785, 0.1701078, -0.7082946, 1, 1, 1, 1, 1,
-0.2549759, 0.3165661, -1.978911, 1, 1, 1, 1, 1,
-0.2534162, 0.6841462, 1.124629, 1, 1, 1, 1, 1,
-0.2510027, 1.92666, -0.5601017, 1, 1, 1, 1, 1,
-0.2386729, 0.3947016, -0.7329091, 1, 1, 1, 1, 1,
-0.2386441, -0.1823986, -2.053412, 1, 1, 1, 1, 1,
-0.2378996, 1.51704, -1.149406, 1, 1, 1, 1, 1,
-0.2360264, -0.8544101, -2.983533, 1, 1, 1, 1, 1,
-0.2282884, 0.2859536, 0.3308183, 1, 1, 1, 1, 1,
-0.2275813, 0.3596373, -0.5091957, 1, 1, 1, 1, 1,
-0.2245153, 0.9505527, -0.4473785, 1, 1, 1, 1, 1,
-0.2218004, 2.084199, -1.344434, 1, 1, 1, 1, 1,
-0.2204553, -0.09494884, -0.5771022, 1, 1, 1, 1, 1,
-0.2167314, -0.3488229, -1.90026, 1, 1, 1, 1, 1,
-0.2142403, -0.2136245, -1.817936, 0, 0, 1, 1, 1,
-0.2138477, 0.736388, 0.8209044, 1, 0, 0, 1, 1,
-0.2038826, -0.6337351, -2.55401, 1, 0, 0, 1, 1,
-0.2029045, 1.753428, -1.264154, 1, 0, 0, 1, 1,
-0.2004217, 0.4692793, -0.6747958, 1, 0, 0, 1, 1,
-0.2003991, 0.6152242, -1.034745, 1, 0, 0, 1, 1,
-0.1999289, 0.7664126, -0.2917661, 0, 0, 0, 1, 1,
-0.1971138, -0.4224501, -4.411214, 0, 0, 0, 1, 1,
-0.1942334, 0.6644799, 0.3885207, 0, 0, 0, 1, 1,
-0.1941279, -0.1071215, -2.822248, 0, 0, 0, 1, 1,
-0.1933865, 0.3058414, 2.141045, 0, 0, 0, 1, 1,
-0.1910751, -0.7024097, -0.7068173, 0, 0, 0, 1, 1,
-0.1842858, 0.1317297, -1.522661, 0, 0, 0, 1, 1,
-0.1839327, 0.099354, -1.57717, 1, 1, 1, 1, 1,
-0.1833495, 0.5936619, 0.988261, 1, 1, 1, 1, 1,
-0.1831019, -0.2834644, -2.673256, 1, 1, 1, 1, 1,
-0.1823159, 0.03665871, -0.8684529, 1, 1, 1, 1, 1,
-0.1734028, -0.3716905, -2.581555, 1, 1, 1, 1, 1,
-0.1665401, 0.06970878, -1.907529, 1, 1, 1, 1, 1,
-0.1644672, 1.310152, -1.22567, 1, 1, 1, 1, 1,
-0.1346333, -0.7265146, -2.968285, 1, 1, 1, 1, 1,
-0.1341392, 0.8189292, 0.5668246, 1, 1, 1, 1, 1,
-0.1294595, 1.072027, 0.7520939, 1, 1, 1, 1, 1,
-0.1287001, 0.633196, 0.1236385, 1, 1, 1, 1, 1,
-0.1280919, -0.9120936, -1.928965, 1, 1, 1, 1, 1,
-0.1210478, 1.300206, -0.08018246, 1, 1, 1, 1, 1,
-0.1156649, -2.347159, -3.42886, 1, 1, 1, 1, 1,
-0.1115521, 3.470783, 0.6073362, 1, 1, 1, 1, 1,
-0.1088645, -0.6046495, -1.12513, 0, 0, 1, 1, 1,
-0.1083223, -1.228582, -5.88984, 1, 0, 0, 1, 1,
-0.1008777, -0.5342444, -5.551634, 1, 0, 0, 1, 1,
-0.09729514, -0.8128731, -2.911551, 1, 0, 0, 1, 1,
-0.09684272, -0.8123987, -2.765381, 1, 0, 0, 1, 1,
-0.09305408, 0.6321309, 1.221825, 1, 0, 0, 1, 1,
-0.08427309, -0.4971404, -1.892274, 0, 0, 0, 1, 1,
-0.08206728, -0.7690738, -2.073099, 0, 0, 0, 1, 1,
-0.08073201, -0.5886641, -2.949602, 0, 0, 0, 1, 1,
-0.08011185, -0.1870012, -2.009444, 0, 0, 0, 1, 1,
-0.08007417, -0.09242665, -3.17845, 0, 0, 0, 1, 1,
-0.07953055, 0.7438309, 1.162066, 0, 0, 0, 1, 1,
-0.07602046, -1.146301, -3.315565, 0, 0, 0, 1, 1,
-0.07313986, 0.397475, 0.6660793, 1, 1, 1, 1, 1,
-0.07192947, 0.9208904, -0.5696369, 1, 1, 1, 1, 1,
-0.07086986, -0.07224097, -3.725793, 1, 1, 1, 1, 1,
-0.06323423, -0.4090339, -3.257017, 1, 1, 1, 1, 1,
-0.0623449, -1.833174, -3.382658, 1, 1, 1, 1, 1,
-0.05242906, 0.3741307, -0.5815904, 1, 1, 1, 1, 1,
-0.04848832, 0.1916333, -1.462749, 1, 1, 1, 1, 1,
-0.04236681, -0.4646631, -2.200499, 1, 1, 1, 1, 1,
-0.04040805, 1.589976, 0.4492198, 1, 1, 1, 1, 1,
-0.03941064, -0.1784003, -3.957063, 1, 1, 1, 1, 1,
-0.03103693, 1.308367, -0.2839074, 1, 1, 1, 1, 1,
-0.02663964, -1.279145, -3.709312, 1, 1, 1, 1, 1,
-0.02289852, 1.754299, 1.075952, 1, 1, 1, 1, 1,
-0.01875711, 1.034685, -0.9727916, 1, 1, 1, 1, 1,
-0.01838978, 0.345178, -0.8982176, 1, 1, 1, 1, 1,
-0.01741131, 0.00259797, -1.978881, 0, 0, 1, 1, 1,
-0.01632237, 0.1849545, 0.3111112, 1, 0, 0, 1, 1,
-0.0159128, -1.83928, -3.389264, 1, 0, 0, 1, 1,
-0.01461767, 0.8133656, -2.385512, 1, 0, 0, 1, 1,
-0.01164192, 0.1615005, 0.4721535, 1, 0, 0, 1, 1,
-0.003904156, -0.3859285, -5.675628, 1, 0, 0, 1, 1,
-0.003482336, 0.6839212, -2.109717, 0, 0, 0, 1, 1,
-0.002999771, 1.04501, -0.8444715, 0, 0, 0, 1, 1,
0.000607254, 0.3530067, -1.738213, 0, 0, 0, 1, 1,
0.008162056, 1.61501, 1.582186, 0, 0, 0, 1, 1,
0.008624636, 0.2134709, -1.272686, 0, 0, 0, 1, 1,
0.01482615, 0.3136745, 0.6406269, 0, 0, 0, 1, 1,
0.01743373, 0.8020159, 0.3028302, 0, 0, 0, 1, 1,
0.02129631, 0.6645026, -0.8154253, 1, 1, 1, 1, 1,
0.02307981, 0.7936571, 0.439377, 1, 1, 1, 1, 1,
0.02776498, 0.3820556, -1.120886, 1, 1, 1, 1, 1,
0.02905405, -0.1195062, 2.824192, 1, 1, 1, 1, 1,
0.03205953, -0.7802521, 2.864182, 1, 1, 1, 1, 1,
0.03286021, -1.123201, 2.611033, 1, 1, 1, 1, 1,
0.03317625, -1.096178, 4.488001, 1, 1, 1, 1, 1,
0.03441458, 0.2081453, 0.3246331, 1, 1, 1, 1, 1,
0.03884734, -1.005492, 4.998381, 1, 1, 1, 1, 1,
0.03919728, -0.9593219, 3.968439, 1, 1, 1, 1, 1,
0.04630341, -0.3009255, 2.694908, 1, 1, 1, 1, 1,
0.04730451, -0.7121074, 2.160361, 1, 1, 1, 1, 1,
0.04874472, 0.8453903, 0.07360059, 1, 1, 1, 1, 1,
0.04928541, -1.328557, 3.244636, 1, 1, 1, 1, 1,
0.05198117, -1.311534, 1.917225, 1, 1, 1, 1, 1,
0.0537109, -0.3202917, 4.858369, 0, 0, 1, 1, 1,
0.05586923, 0.9970948, 0.8145068, 1, 0, 0, 1, 1,
0.05604655, -1.8941, 2.408875, 1, 0, 0, 1, 1,
0.05886827, 0.3825167, 0.5087336, 1, 0, 0, 1, 1,
0.06172623, -0.1827365, 5.051113, 1, 0, 0, 1, 1,
0.0673888, 1.324355, 0.08091141, 1, 0, 0, 1, 1,
0.06947622, 0.2960585, 0.3874889, 0, 0, 0, 1, 1,
0.07438718, -3.227818, 3.166623, 0, 0, 0, 1, 1,
0.07528335, 0.2184012, 1.511883, 0, 0, 0, 1, 1,
0.07815187, 1.007439, -0.2422962, 0, 0, 0, 1, 1,
0.0785097, 0.470386, -2.947877, 0, 0, 0, 1, 1,
0.08227, 1.43495, -0.3379423, 0, 0, 0, 1, 1,
0.0825305, 0.1510328, -0.8047397, 0, 0, 0, 1, 1,
0.08256965, 1.600214, -0.4587392, 1, 1, 1, 1, 1,
0.08557712, 1.086832, 0.6201774, 1, 1, 1, 1, 1,
0.08576252, 0.4465607, -0.8392398, 1, 1, 1, 1, 1,
0.08710282, -0.5634025, 1.732103, 1, 1, 1, 1, 1,
0.09001619, 0.3547983, 0.3717298, 1, 1, 1, 1, 1,
0.09167682, 0.119721, 2.241671, 1, 1, 1, 1, 1,
0.09310946, -1.419066, 1.48907, 1, 1, 1, 1, 1,
0.09357999, -1.183858, 2.574197, 1, 1, 1, 1, 1,
0.09671844, -1.48785, 1.651614, 1, 1, 1, 1, 1,
0.09794857, 0.7417729, -1.835743, 1, 1, 1, 1, 1,
0.1015619, -1.448124, 1.709495, 1, 1, 1, 1, 1,
0.1049437, 2.140888, 1.983055, 1, 1, 1, 1, 1,
0.1062699, 0.001605528, 0.975322, 1, 1, 1, 1, 1,
0.1065912, -0.348259, 3.596126, 1, 1, 1, 1, 1,
0.108351, -0.3620069, 1.327327, 1, 1, 1, 1, 1,
0.1086288, -0.33238, 2.125037, 0, 0, 1, 1, 1,
0.110299, -1.415719, 2.50692, 1, 0, 0, 1, 1,
0.1123975, 0.9908288, -0.5653982, 1, 0, 0, 1, 1,
0.1142592, 1.535757, -0.182897, 1, 0, 0, 1, 1,
0.1196227, -0.4648383, 1.949135, 1, 0, 0, 1, 1,
0.1198532, 1.976383, -0.5713488, 1, 0, 0, 1, 1,
0.1205781, -0.4375849, 3.162613, 0, 0, 0, 1, 1,
0.1220698, 0.1899077, -0.1787721, 0, 0, 0, 1, 1,
0.1243548, -0.5833906, 3.643676, 0, 0, 0, 1, 1,
0.1300091, -0.7930133, 3.516573, 0, 0, 0, 1, 1,
0.1301714, 1.074476, 1.118582, 0, 0, 0, 1, 1,
0.1369238, -1.13636, 3.976364, 0, 0, 0, 1, 1,
0.1428689, 1.376928, 2.188073, 0, 0, 0, 1, 1,
0.1454507, 1.232578, -1.134982, 1, 1, 1, 1, 1,
0.1461934, 0.2681852, -0.1479948, 1, 1, 1, 1, 1,
0.1465096, 1.279597, 1.003766, 1, 1, 1, 1, 1,
0.1480811, 0.760639, 0.09742158, 1, 1, 1, 1, 1,
0.1494735, -1.034049, 4.187236, 1, 1, 1, 1, 1,
0.1495704, -0.2467769, 1.827042, 1, 1, 1, 1, 1,
0.150843, 1.430775, -0.6631916, 1, 1, 1, 1, 1,
0.1595268, -2.559948, 2.729986, 1, 1, 1, 1, 1,
0.163738, -0.2729899, 2.740009, 1, 1, 1, 1, 1,
0.1653707, 0.770729, 0.7780998, 1, 1, 1, 1, 1,
0.1668046, -1.351115, 2.803587, 1, 1, 1, 1, 1,
0.1691825, 0.7212025, 1.157576, 1, 1, 1, 1, 1,
0.1699899, 0.9082577, 0.4311898, 1, 1, 1, 1, 1,
0.1715901, 0.09503973, -0.06489657, 1, 1, 1, 1, 1,
0.175702, -1.576112, 3.942053, 1, 1, 1, 1, 1,
0.1771033, 1.395485, 0.3455089, 0, 0, 1, 1, 1,
0.1809382, 0.3321844, 1.41278, 1, 0, 0, 1, 1,
0.1812866, -0.3684814, 2.208993, 1, 0, 0, 1, 1,
0.1818302, -0.01629312, 1.005234, 1, 0, 0, 1, 1,
0.1823658, -0.5695579, 2.41848, 1, 0, 0, 1, 1,
0.1860548, -0.4672092, 3.717984, 1, 0, 0, 1, 1,
0.1865063, 0.3991932, 0.4463603, 0, 0, 0, 1, 1,
0.1925427, -0.9621491, 3.222485, 0, 0, 0, 1, 1,
0.197676, 0.6319283, 0.9354239, 0, 0, 0, 1, 1,
0.1997067, -0.3266182, 1.196488, 0, 0, 0, 1, 1,
0.2002833, -0.9643017, 1.864724, 0, 0, 0, 1, 1,
0.2006271, -1.217765, 0.7855673, 0, 0, 0, 1, 1,
0.2069556, -1.286491, 2.862734, 0, 0, 0, 1, 1,
0.2093401, -0.08002345, 1.452477, 1, 1, 1, 1, 1,
0.2130312, -1.83653, 3.790958, 1, 1, 1, 1, 1,
0.2141932, 0.5582522, 1.922489, 1, 1, 1, 1, 1,
0.2178452, 0.5238966, 0.6104374, 1, 1, 1, 1, 1,
0.220901, 1.548557, -0.4816206, 1, 1, 1, 1, 1,
0.2216756, 0.7579323, 0.6671036, 1, 1, 1, 1, 1,
0.2223624, 1.562424, 0.9036301, 1, 1, 1, 1, 1,
0.2223951, -0.6679071, 1.136515, 1, 1, 1, 1, 1,
0.2248674, 0.03210218, 2.45341, 1, 1, 1, 1, 1,
0.2258725, -1.098357, 3.273125, 1, 1, 1, 1, 1,
0.2259354, -0.065874, 1.963958, 1, 1, 1, 1, 1,
0.2288866, 0.05629814, 3.003717, 1, 1, 1, 1, 1,
0.2331841, 0.8894336, 0.4340997, 1, 1, 1, 1, 1,
0.2341627, -0.7574996, 1.204146, 1, 1, 1, 1, 1,
0.2358886, -2.3219, 3.523355, 1, 1, 1, 1, 1,
0.2385082, -0.5357202, 3.36835, 0, 0, 1, 1, 1,
0.2410947, -1.032282, 2.819879, 1, 0, 0, 1, 1,
0.2440817, -0.5149388, 0.06642997, 1, 0, 0, 1, 1,
0.2472217, -0.5964331, 2.502552, 1, 0, 0, 1, 1,
0.2480162, 1.118393, -0.4043531, 1, 0, 0, 1, 1,
0.2495422, 0.110369, 1.814561, 1, 0, 0, 1, 1,
0.2513627, 0.09045764, 2.501709, 0, 0, 0, 1, 1,
0.2525152, -0.526543, 3.227102, 0, 0, 0, 1, 1,
0.2561493, -0.9481412, 1.075052, 0, 0, 0, 1, 1,
0.2613395, -0.6388643, 3.48782, 0, 0, 0, 1, 1,
0.2620068, 1.750035, -0.1764314, 0, 0, 0, 1, 1,
0.2623667, 1.60294, 0.6352224, 0, 0, 0, 1, 1,
0.264419, -1.329392, 3.382145, 0, 0, 0, 1, 1,
0.2647453, 0.008784073, 0.1962389, 1, 1, 1, 1, 1,
0.2686598, -0.8060308, 1.251541, 1, 1, 1, 1, 1,
0.2692703, 1.295269, -0.9802204, 1, 1, 1, 1, 1,
0.2707821, -1.668581, 3.788324, 1, 1, 1, 1, 1,
0.2719207, -1.122113, 1.729296, 1, 1, 1, 1, 1,
0.273446, -0.2184785, 3.033502, 1, 1, 1, 1, 1,
0.2737028, -1.680137, 3.837276, 1, 1, 1, 1, 1,
0.2751077, 0.3461984, 1.130208, 1, 1, 1, 1, 1,
0.2768248, 0.2383473, 0.5507482, 1, 1, 1, 1, 1,
0.2781586, 0.05363466, 0.0750837, 1, 1, 1, 1, 1,
0.2874349, -1.06694, 3.648167, 1, 1, 1, 1, 1,
0.2906401, 0.3581266, 0.697842, 1, 1, 1, 1, 1,
0.2907597, 2.62357, -0.2729724, 1, 1, 1, 1, 1,
0.292052, 0.4657778, 2.314645, 1, 1, 1, 1, 1,
0.2939934, -0.1928989, 1.763893, 1, 1, 1, 1, 1,
0.2960549, -0.1009207, 2.148224, 0, 0, 1, 1, 1,
0.2968566, 1.246621, 0.9194595, 1, 0, 0, 1, 1,
0.2985153, -1.019676, 2.704134, 1, 0, 0, 1, 1,
0.3051728, 0.2621222, 0.6877832, 1, 0, 0, 1, 1,
0.3121345, -0.475901, 2.951925, 1, 0, 0, 1, 1,
0.3125641, -0.6132377, 2.459347, 1, 0, 0, 1, 1,
0.3137316, 1.268361, -0.3522265, 0, 0, 0, 1, 1,
0.3164637, 0.5467148, -0.2415096, 0, 0, 0, 1, 1,
0.3190745, -0.2648215, 0.6395761, 0, 0, 0, 1, 1,
0.3287013, -0.885124, 3.27211, 0, 0, 0, 1, 1,
0.3321351, -1.390074, 2.925439, 0, 0, 0, 1, 1,
0.3326326, 0.9968175, 0.3580151, 0, 0, 0, 1, 1,
0.3335769, -0.4537094, 2.952603, 0, 0, 0, 1, 1,
0.3340348, 1.365652, 1.907474, 1, 1, 1, 1, 1,
0.3369191, -0.6918712, 2.598126, 1, 1, 1, 1, 1,
0.3377463, -0.01119992, 0.5700309, 1, 1, 1, 1, 1,
0.340591, -0.4662635, 3.159751, 1, 1, 1, 1, 1,
0.3440661, 0.1999673, 1.290433, 1, 1, 1, 1, 1,
0.3442969, -0.3776431, 1.734157, 1, 1, 1, 1, 1,
0.344487, 0.5797501, 1.13861, 1, 1, 1, 1, 1,
0.3472416, -0.2801765, 3.411173, 1, 1, 1, 1, 1,
0.3510741, -0.7262127, 2.367111, 1, 1, 1, 1, 1,
0.3521828, -0.9188946, 3.193112, 1, 1, 1, 1, 1,
0.353523, -0.2717911, 2.579847, 1, 1, 1, 1, 1,
0.3551936, 0.5493405, 0.998363, 1, 1, 1, 1, 1,
0.3565611, 0.8648175, 0.6309348, 1, 1, 1, 1, 1,
0.3578719, -2.50743, 3.611829, 1, 1, 1, 1, 1,
0.359839, -0.9303939, 4.368407, 1, 1, 1, 1, 1,
0.3631471, -0.146329, 3.01674, 0, 0, 1, 1, 1,
0.3719053, -0.3207475, 1.343078, 1, 0, 0, 1, 1,
0.3725564, 2.862671, -0.08696546, 1, 0, 0, 1, 1,
0.3762123, -1.214357, 5.05153, 1, 0, 0, 1, 1,
0.378338, 0.02465181, 1.288931, 1, 0, 0, 1, 1,
0.3801532, -0.6693118, 1.898413, 1, 0, 0, 1, 1,
0.381253, -0.5817641, 1.482706, 0, 0, 0, 1, 1,
0.3836576, 1.746414, -0.8595885, 0, 0, 0, 1, 1,
0.3891521, 0.7800967, -0.6850967, 0, 0, 0, 1, 1,
0.3985741, -0.2183715, 3.459065, 0, 0, 0, 1, 1,
0.4047832, 0.4838502, -0.3399041, 0, 0, 0, 1, 1,
0.4116643, -1.255626, 1.325484, 0, 0, 0, 1, 1,
0.4163878, 0.7699471, 2.132045, 0, 0, 0, 1, 1,
0.4174456, -1.052712, 3.657398, 1, 1, 1, 1, 1,
0.4213585, 0.5353229, -1.05474, 1, 1, 1, 1, 1,
0.4252894, -0.5836433, 2.072696, 1, 1, 1, 1, 1,
0.4284084, -1.120882, 2.629302, 1, 1, 1, 1, 1,
0.4299992, 0.312288, 0.8443395, 1, 1, 1, 1, 1,
0.4322132, 0.2619552, -0.04220605, 1, 1, 1, 1, 1,
0.4389864, 0.6670894, 0.6730247, 1, 1, 1, 1, 1,
0.4398613, -0.4743822, 3.585252, 1, 1, 1, 1, 1,
0.4409725, -0.08328574, 3.087352, 1, 1, 1, 1, 1,
0.4412186, 0.8999854, -1.086633, 1, 1, 1, 1, 1,
0.4426236, -0.9900443, 2.457465, 1, 1, 1, 1, 1,
0.4434682, -0.4501852, 2.092405, 1, 1, 1, 1, 1,
0.4461129, 1.120978, 0.539577, 1, 1, 1, 1, 1,
0.448147, -1.215832, 3.469164, 1, 1, 1, 1, 1,
0.4488709, 0.3309418, 2.143202, 1, 1, 1, 1, 1,
0.4524278, 0.5968807, 3.359103, 0, 0, 1, 1, 1,
0.4529651, 0.2833773, 0.7955171, 1, 0, 0, 1, 1,
0.4563322, -0.5668606, 1.672474, 1, 0, 0, 1, 1,
0.4595611, -0.36054, 1.698857, 1, 0, 0, 1, 1,
0.4596635, 0.6311817, 0.1319696, 1, 0, 0, 1, 1,
0.4606245, 0.6787285, 2.729645, 1, 0, 0, 1, 1,
0.4627159, 0.8891091, 2.027275, 0, 0, 0, 1, 1,
0.4667349, -0.5526317, 2.272394, 0, 0, 0, 1, 1,
0.4702697, -1.034076, 1.741623, 0, 0, 0, 1, 1,
0.4732757, -0.09792435, 1.749482, 0, 0, 0, 1, 1,
0.4757732, -0.997968, 2.693614, 0, 0, 0, 1, 1,
0.4759209, -1.601364, 2.645787, 0, 0, 0, 1, 1,
0.4763965, -0.6253753, 2.835226, 0, 0, 0, 1, 1,
0.477739, 0.81742, 0.642055, 1, 1, 1, 1, 1,
0.4803161, 1.536645, -0.2408715, 1, 1, 1, 1, 1,
0.480534, 0.7217549, -0.7396966, 1, 1, 1, 1, 1,
0.4816251, 0.2164869, 0.3206874, 1, 1, 1, 1, 1,
0.4857531, 1.166752, -0.1984572, 1, 1, 1, 1, 1,
0.4893067, -0.5119033, 3.623636, 1, 1, 1, 1, 1,
0.4896881, -0.6092318, 2.631283, 1, 1, 1, 1, 1,
0.4916586, -1.397707, 4.121829, 1, 1, 1, 1, 1,
0.4922704, -1.698929, 3.076306, 1, 1, 1, 1, 1,
0.4948679, 0.2227961, -0.1302823, 1, 1, 1, 1, 1,
0.4965529, 0.2764599, -0.2590709, 1, 1, 1, 1, 1,
0.4974484, 0.8219538, 1.931796, 1, 1, 1, 1, 1,
0.4992542, -0.5960426, 2.758481, 1, 1, 1, 1, 1,
0.5017393, -0.6793902, 1.592524, 1, 1, 1, 1, 1,
0.5031683, 0.180511, 0.8729789, 1, 1, 1, 1, 1,
0.5099563, -1.066609, 1.144403, 0, 0, 1, 1, 1,
0.5103767, -0.1362925, 2.640356, 1, 0, 0, 1, 1,
0.5136694, -1.225808, 4.171231, 1, 0, 0, 1, 1,
0.5201486, -0.7764452, 3.865017, 1, 0, 0, 1, 1,
0.5217737, 0.2850367, 0.3988914, 1, 0, 0, 1, 1,
0.5240645, 0.595282, 0.6807118, 1, 0, 0, 1, 1,
0.5280839, 0.7408857, 1.280712, 0, 0, 0, 1, 1,
0.5327662, -0.3313, 2.576181, 0, 0, 0, 1, 1,
0.5344952, 0.5476468, 0.3539119, 0, 0, 0, 1, 1,
0.5350203, -0.9465235, 2.37539, 0, 0, 0, 1, 1,
0.5396991, 0.3629525, 2.027797, 0, 0, 0, 1, 1,
0.5449132, 0.4882648, 2.102431, 0, 0, 0, 1, 1,
0.5523171, -0.6169021, 2.596092, 0, 0, 0, 1, 1,
0.5576728, -0.1694785, 2.697785, 1, 1, 1, 1, 1,
0.5592212, -0.3973044, 2.234426, 1, 1, 1, 1, 1,
0.5627066, -0.3857151, 1.767046, 1, 1, 1, 1, 1,
0.5635715, 0.9136516, 2.44917, 1, 1, 1, 1, 1,
0.566579, -1.630907, 2.420135, 1, 1, 1, 1, 1,
0.5678992, -1.461903, 3.739752, 1, 1, 1, 1, 1,
0.56984, -0.05925164, 1.611488, 1, 1, 1, 1, 1,
0.5744231, 1.338171, 0.9175544, 1, 1, 1, 1, 1,
0.5809767, 0.8110582, 0.7197381, 1, 1, 1, 1, 1,
0.5824731, 0.6255414, 0.8103087, 1, 1, 1, 1, 1,
0.5872805, -0.0009432501, 1.796493, 1, 1, 1, 1, 1,
0.5908583, 1.740209, -0.338674, 1, 1, 1, 1, 1,
0.5911418, 0.8827341, 0.6917207, 1, 1, 1, 1, 1,
0.5923167, 1.404824, 1.134828, 1, 1, 1, 1, 1,
0.5955668, 0.4720358, 2.64099, 1, 1, 1, 1, 1,
0.6059607, 0.4594351, -0.0987682, 0, 0, 1, 1, 1,
0.6076664, 0.6359048, 1.921878, 1, 0, 0, 1, 1,
0.6154608, -1.245006, 3.552581, 1, 0, 0, 1, 1,
0.6171132, -1.184632, 3.135992, 1, 0, 0, 1, 1,
0.6218015, 1.678657, 2.795556, 1, 0, 0, 1, 1,
0.6236044, 0.8485128, 0.01751548, 1, 0, 0, 1, 1,
0.6260727, -1.172433, 3.889016, 0, 0, 0, 1, 1,
0.6293533, -0.1739675, 2.780207, 0, 0, 0, 1, 1,
0.6298891, -0.437065, 2.673531, 0, 0, 0, 1, 1,
0.6305125, 2.676717, 0.5510169, 0, 0, 0, 1, 1,
0.6336723, -0.3511009, 2.168374, 0, 0, 0, 1, 1,
0.6357598, 0.08163513, 1.41406, 0, 0, 0, 1, 1,
0.6384957, -0.5477029, 2.289879, 0, 0, 0, 1, 1,
0.6461883, -0.8862326, 2.819902, 1, 1, 1, 1, 1,
0.6472324, 0.5479525, 1.643588, 1, 1, 1, 1, 1,
0.6474131, -0.2492043, 1.119541, 1, 1, 1, 1, 1,
0.6506759, -0.2420099, 3.171855, 1, 1, 1, 1, 1,
0.6526824, 0.798716, 0.7792197, 1, 1, 1, 1, 1,
0.6527823, -0.5929351, 3.598365, 1, 1, 1, 1, 1,
0.652909, -0.4669922, 1.215969, 1, 1, 1, 1, 1,
0.6552778, -0.9145394, 1.381307, 1, 1, 1, 1, 1,
0.6570596, 1.814009, 0.5683194, 1, 1, 1, 1, 1,
0.6606889, -0.1732313, 2.442545, 1, 1, 1, 1, 1,
0.6613991, 0.922031, 0.2779332, 1, 1, 1, 1, 1,
0.661656, 0.9242274, 1.241025, 1, 1, 1, 1, 1,
0.6676618, 0.4578791, 0.2355056, 1, 1, 1, 1, 1,
0.6738262, 0.08501178, 2.082997, 1, 1, 1, 1, 1,
0.6773823, -0.4189616, 0.8843735, 1, 1, 1, 1, 1,
0.6820588, -0.01240123, 0.29855, 0, 0, 1, 1, 1,
0.6821143, -1.023181, 2.770601, 1, 0, 0, 1, 1,
0.691388, 2.206484, 0.6917633, 1, 0, 0, 1, 1,
0.6935019, 0.6540886, 1.535364, 1, 0, 0, 1, 1,
0.6945334, -1.378259, 1.414763, 1, 0, 0, 1, 1,
0.6946378, 0.535889, -0.8658192, 1, 0, 0, 1, 1,
0.6950085, -1.262797, 2.924287, 0, 0, 0, 1, 1,
0.6964256, -1.634019, 2.73057, 0, 0, 0, 1, 1,
0.7011121, -1.536183, 3.462129, 0, 0, 0, 1, 1,
0.7028231, 0.6920581, 0.4038572, 0, 0, 0, 1, 1,
0.7094406, -0.8449079, 2.924276, 0, 0, 0, 1, 1,
0.7146777, 1.01807, 1.600561, 0, 0, 0, 1, 1,
0.7147688, -0.8367323, 3.268093, 0, 0, 0, 1, 1,
0.7260534, -1.188783, 0.68708, 1, 1, 1, 1, 1,
0.7299328, 1.037762, 0.6057936, 1, 1, 1, 1, 1,
0.7301208, -0.1794601, 1.341613, 1, 1, 1, 1, 1,
0.7324547, 0.109533, 2.488132, 1, 1, 1, 1, 1,
0.7379692, 1.710446, 0.2021366, 1, 1, 1, 1, 1,
0.7410832, 1.033331, 0.3853983, 1, 1, 1, 1, 1,
0.7497419, 1.525192, 0.2533161, 1, 1, 1, 1, 1,
0.7501483, -0.1960751, 2.626962, 1, 1, 1, 1, 1,
0.75945, 0.8053951, 0.4996234, 1, 1, 1, 1, 1,
0.763295, -0.4375563, 1.834695, 1, 1, 1, 1, 1,
0.7634082, 0.5049834, 0.5427287, 1, 1, 1, 1, 1,
0.7664212, -0.4823065, 0.4911837, 1, 1, 1, 1, 1,
0.770788, 0.8656024, 0.1489848, 1, 1, 1, 1, 1,
0.7711371, -0.4480512, 1.636679, 1, 1, 1, 1, 1,
0.7730563, -0.4090593, 2.49692, 1, 1, 1, 1, 1,
0.7747254, -1.597412, 2.640744, 0, 0, 1, 1, 1,
0.7761753, 1.189081, 2.260106, 1, 0, 0, 1, 1,
0.7762479, 0.05676043, 0.383481, 1, 0, 0, 1, 1,
0.7786093, -0.2900517, 1.911698, 1, 0, 0, 1, 1,
0.7817675, -0.002853134, 1.960085, 1, 0, 0, 1, 1,
0.7829859, -0.7906047, 3.60703, 1, 0, 0, 1, 1,
0.7869786, -0.9087434, 1.895122, 0, 0, 0, 1, 1,
0.796379, -1.103019, 0.6607983, 0, 0, 0, 1, 1,
0.7972801, -0.4890519, 3.540641, 0, 0, 0, 1, 1,
0.7992208, -1.170917, 2.363292, 0, 0, 0, 1, 1,
0.8030079, -0.7661988, 3.078535, 0, 0, 0, 1, 1,
0.8064077, -2.705588, 3.087312, 0, 0, 0, 1, 1,
0.8108323, 0.7349926, 1.798389, 0, 0, 0, 1, 1,
0.8135322, 0.889231, 1.271236, 1, 1, 1, 1, 1,
0.8201211, -2.02645, 3.635312, 1, 1, 1, 1, 1,
0.8204315, -0.5670778, 1.595182, 1, 1, 1, 1, 1,
0.8226771, 0.5746339, 1.490648, 1, 1, 1, 1, 1,
0.823658, -0.5720648, 3.242403, 1, 1, 1, 1, 1,
0.8277222, -1.419372, 4.220985, 1, 1, 1, 1, 1,
0.8304772, -2.657481, 2.628396, 1, 1, 1, 1, 1,
0.84164, 0.0602429, 1.358233, 1, 1, 1, 1, 1,
0.8449075, 0.05205939, 0.9885718, 1, 1, 1, 1, 1,
0.8488244, -0.876966, 0.937614, 1, 1, 1, 1, 1,
0.8672407, -0.504629, 1.680479, 1, 1, 1, 1, 1,
0.8675182, -0.7062137, 1.777411, 1, 1, 1, 1, 1,
0.8717469, 1.644094, -0.2096587, 1, 1, 1, 1, 1,
0.8719939, 0.4914729, 0.2145218, 1, 1, 1, 1, 1,
0.8755233, 0.1024698, 1.799255, 1, 1, 1, 1, 1,
0.8829219, 1.549606, 1.957919, 0, 0, 1, 1, 1,
0.895199, -1.719452, 3.581515, 1, 0, 0, 1, 1,
0.9000607, 0.9398907, 0.394749, 1, 0, 0, 1, 1,
0.9000806, -1.104063, 1.432335, 1, 0, 0, 1, 1,
0.9022669, 0.3866304, 0.6379992, 1, 0, 0, 1, 1,
0.9057467, -0.538367, 3.327217, 1, 0, 0, 1, 1,
0.9070302, -0.07721011, 2.20543, 0, 0, 0, 1, 1,
0.9124424, 0.2897584, 1.609472, 0, 0, 0, 1, 1,
0.9133565, 0.5300678, 0.3040948, 0, 0, 0, 1, 1,
0.9226705, 0.1670985, 1.797545, 0, 0, 0, 1, 1,
0.9227916, -0.7000424, 2.318092, 0, 0, 0, 1, 1,
0.9279954, -0.1576161, 1.737506, 0, 0, 0, 1, 1,
0.9328284, -0.2556366, 2.426116, 0, 0, 0, 1, 1,
0.938291, 0.4078785, 0.2069835, 1, 1, 1, 1, 1,
0.9470639, -0.05041809, 1.48766, 1, 1, 1, 1, 1,
0.9524022, 0.9415892, 1.947883, 1, 1, 1, 1, 1,
0.9533404, -0.1849116, 1.127416, 1, 1, 1, 1, 1,
0.9536448, 0.5179483, -0.08394718, 1, 1, 1, 1, 1,
0.9614414, 1.095387, 1.049599, 1, 1, 1, 1, 1,
0.9716669, 0.8619656, 1.451879, 1, 1, 1, 1, 1,
0.9736473, -2.550058, 1.708157, 1, 1, 1, 1, 1,
0.9760888, -2.020665, 3.161969, 1, 1, 1, 1, 1,
0.9778239, 1.408346, 0.4964374, 1, 1, 1, 1, 1,
0.9801667, 0.5762161, 1.473697, 1, 1, 1, 1, 1,
0.981676, 0.04922518, 0.2842286, 1, 1, 1, 1, 1,
0.9962383, 0.4920233, 2.889253, 1, 1, 1, 1, 1,
1.004527, 1.360977, 1.846375, 1, 1, 1, 1, 1,
1.009927, 1.488135, -1.073379, 1, 1, 1, 1, 1,
1.011942, -0.2307349, 0.1468484, 0, 0, 1, 1, 1,
1.015089, -2.315217, 3.829027, 1, 0, 0, 1, 1,
1.01512, 1.043098, 0.8379139, 1, 0, 0, 1, 1,
1.017355, -0.6242387, 2.777699, 1, 0, 0, 1, 1,
1.018384, -0.2927152, 2.918912, 1, 0, 0, 1, 1,
1.023927, -0.4769817, 0.9951919, 1, 0, 0, 1, 1,
1.027236, -1.15923, 2.43025, 0, 0, 0, 1, 1,
1.030086, -0.2966267, 0.7818197, 0, 0, 0, 1, 1,
1.036581, -1.945, 1.182437, 0, 0, 0, 1, 1,
1.04434, 0.04132507, 0.9447148, 0, 0, 0, 1, 1,
1.044876, 1.033269, 1.602468, 0, 0, 0, 1, 1,
1.048667, -1.491844, 1.852448, 0, 0, 0, 1, 1,
1.057537, -1.209001, 1.349566, 0, 0, 0, 1, 1,
1.058659, -1.250035, 1.493784, 1, 1, 1, 1, 1,
1.071573, -0.1029888, 2.020944, 1, 1, 1, 1, 1,
1.074965, 0.3740235, 1.220779, 1, 1, 1, 1, 1,
1.075451, -0.2549718, -0.2444028, 1, 1, 1, 1, 1,
1.076513, 0.4311483, -0.0509688, 1, 1, 1, 1, 1,
1.095413, -0.9677219, 2.049577, 1, 1, 1, 1, 1,
1.100455, -0.165623, 1.576302, 1, 1, 1, 1, 1,
1.102582, 0.75704, -0.3344884, 1, 1, 1, 1, 1,
1.109226, 0.8059919, -0.1278193, 1, 1, 1, 1, 1,
1.111949, -1.033191, 3.349524, 1, 1, 1, 1, 1,
1.120329, 0.4242194, 1.73642, 1, 1, 1, 1, 1,
1.135393, 1.402647, 0.1955013, 1, 1, 1, 1, 1,
1.13677, 0.2585519, 1.989695, 1, 1, 1, 1, 1,
1.141327, 0.8067573, 1.154983, 1, 1, 1, 1, 1,
1.151424, 1.813813, -1.303343, 1, 1, 1, 1, 1,
1.156589, 0.817658, 1.672632, 0, 0, 1, 1, 1,
1.157654, 0.9055745, -1.155045, 1, 0, 0, 1, 1,
1.158633, -1.9575, 1.863135, 1, 0, 0, 1, 1,
1.162938, 0.9443697, 0.5010054, 1, 0, 0, 1, 1,
1.166011, 0.8175501, -0.1094496, 1, 0, 0, 1, 1,
1.167819, -0.4153824, 0.7064561, 1, 0, 0, 1, 1,
1.183499, -0.1980361, 1.788355, 0, 0, 0, 1, 1,
1.186365, -0.5959746, 2.078071, 0, 0, 0, 1, 1,
1.197664, -0.6738142, 3.510448, 0, 0, 0, 1, 1,
1.202286, -1.509062, 2.102197, 0, 0, 0, 1, 1,
1.204682, 2.065746, 0.3173665, 0, 0, 0, 1, 1,
1.20555, -0.1263264, 1.827734, 0, 0, 0, 1, 1,
1.212268, 1.248685, 1.858087, 0, 0, 0, 1, 1,
1.215234, -0.1885869, 3.0372, 1, 1, 1, 1, 1,
1.217423, -1.00622, 1.736543, 1, 1, 1, 1, 1,
1.22716, -0.3403696, 4.716003, 1, 1, 1, 1, 1,
1.232558, 1.046343, 0.8794636, 1, 1, 1, 1, 1,
1.235798, -2.084004, 2.833937, 1, 1, 1, 1, 1,
1.236577, 0.5231658, 0.1501042, 1, 1, 1, 1, 1,
1.244982, -0.5835153, 2.870904, 1, 1, 1, 1, 1,
1.245904, 1.130056, 0.5472548, 1, 1, 1, 1, 1,
1.248368, 0.5321305, 0.7289719, 1, 1, 1, 1, 1,
1.252308, -0.6098112, 1.903392, 1, 1, 1, 1, 1,
1.257692, 0.3196259, 0.8583838, 1, 1, 1, 1, 1,
1.261111, -0.005632036, 0.537535, 1, 1, 1, 1, 1,
1.272148, 0.2076363, 2.166881, 1, 1, 1, 1, 1,
1.275187, -0.3069845, 0.8222039, 1, 1, 1, 1, 1,
1.27716, 1.184185, 2.123104, 1, 1, 1, 1, 1,
1.27901, -2.58027, 2.622222, 0, 0, 1, 1, 1,
1.291202, 1.398244, 1.606313, 1, 0, 0, 1, 1,
1.292698, 0.914894, 0.5700846, 1, 0, 0, 1, 1,
1.297662, 0.7526401, 0.3177672, 1, 0, 0, 1, 1,
1.297664, 0.4981743, 0.1562378, 1, 0, 0, 1, 1,
1.298451, -0.001229117, 1.43859, 1, 0, 0, 1, 1,
1.300795, -0.3135768, 3.626739, 0, 0, 0, 1, 1,
1.315007, 0.9255689, 1.883684, 0, 0, 0, 1, 1,
1.322495, -0.09606389, 0.2055006, 0, 0, 0, 1, 1,
1.325247, -0.8564833, 2.224437, 0, 0, 0, 1, 1,
1.331524, 1.415239, -1.029821, 0, 0, 0, 1, 1,
1.337348, 0.2743432, 2.871449, 0, 0, 0, 1, 1,
1.347916, 1.510895, 0.4814298, 0, 0, 0, 1, 1,
1.355658, -2.238558, 3.401385, 1, 1, 1, 1, 1,
1.35571, 0.7033136, 0.7978495, 1, 1, 1, 1, 1,
1.364018, -0.9144216, 2.061534, 1, 1, 1, 1, 1,
1.373534, -0.04177583, 2.750876, 1, 1, 1, 1, 1,
1.374664, 1.535569, -0.4908838, 1, 1, 1, 1, 1,
1.383388, 0.9401132, 1.086898, 1, 1, 1, 1, 1,
1.387836, 0.4531624, 1.195149, 1, 1, 1, 1, 1,
1.392254, -0.2505253, 1.617146, 1, 1, 1, 1, 1,
1.394139, 0.8361985, 2.059669, 1, 1, 1, 1, 1,
1.403774, 1.809772, 0.3114704, 1, 1, 1, 1, 1,
1.406767, -0.3718134, 0.4201507, 1, 1, 1, 1, 1,
1.410016, 0.2379798, 3.007973, 1, 1, 1, 1, 1,
1.416918, -1.285392, 4.124963, 1, 1, 1, 1, 1,
1.428922, -3.091041, 4.139879, 1, 1, 1, 1, 1,
1.435647, -0.5641953, 0.316658, 1, 1, 1, 1, 1,
1.438222, -1.338581, 3.40645, 0, 0, 1, 1, 1,
1.47137, -1.235075, 4.834859, 1, 0, 0, 1, 1,
1.47807, -0.3255785, 2.448867, 1, 0, 0, 1, 1,
1.488134, 1.252021, 1.600716, 1, 0, 0, 1, 1,
1.488338, -0.2146185, 1.812494, 1, 0, 0, 1, 1,
1.488944, -0.01757412, 2.105563, 1, 0, 0, 1, 1,
1.488964, -1.925054, 1.88899, 0, 0, 0, 1, 1,
1.491019, 1.063115, 0.5723816, 0, 0, 0, 1, 1,
1.502026, -2.268345, 1.929847, 0, 0, 0, 1, 1,
1.508801, -0.3091613, 3.076448, 0, 0, 0, 1, 1,
1.509448, -0.2416705, 1.411865, 0, 0, 0, 1, 1,
1.510824, -0.5153722, 3.480738, 0, 0, 0, 1, 1,
1.521145, -1.35001, 1.121325, 0, 0, 0, 1, 1,
1.53151, -1.522784, 1.476181, 1, 1, 1, 1, 1,
1.536674, 1.795806, 0.553618, 1, 1, 1, 1, 1,
1.53784, 0.04803596, -0.1678502, 1, 1, 1, 1, 1,
1.538849, 0.8771179, 2.338948, 1, 1, 1, 1, 1,
1.546376, 0.7391828, 1.077883, 1, 1, 1, 1, 1,
1.547862, 0.2041589, -0.1034195, 1, 1, 1, 1, 1,
1.559244, -1.587491, 2.507, 1, 1, 1, 1, 1,
1.568844, 1.881131, 2.08933, 1, 1, 1, 1, 1,
1.587239, -0.2685678, 1.552823, 1, 1, 1, 1, 1,
1.594177, -1.390197, 2.211818, 1, 1, 1, 1, 1,
1.596904, 0.1376883, 0.912708, 1, 1, 1, 1, 1,
1.618222, 0.7612905, 1.488545, 1, 1, 1, 1, 1,
1.633636, -0.5864239, 2.707033, 1, 1, 1, 1, 1,
1.641662, 1.260138, 1.12576, 1, 1, 1, 1, 1,
1.65746, -0.7929841, 3.458944, 1, 1, 1, 1, 1,
1.66955, 0.4613388, 2.386061, 0, 0, 1, 1, 1,
1.699789, 0.6284788, 0.03157751, 1, 0, 0, 1, 1,
1.709615, 0.6462123, 0.6974611, 1, 0, 0, 1, 1,
1.713567, 0.1595615, 2.368777, 1, 0, 0, 1, 1,
1.726702, -0.882137, 0.434714, 1, 0, 0, 1, 1,
1.727041, 2.063217, 1.560194, 1, 0, 0, 1, 1,
1.748613, 0.2439132, 1.576651, 0, 0, 0, 1, 1,
1.751334, 2.220004, 1.534283, 0, 0, 0, 1, 1,
1.774243, 0.2845996, 1.03309, 0, 0, 0, 1, 1,
1.780656, -0.8223408, 2.91958, 0, 0, 0, 1, 1,
1.791614, 1.439927, 0.4791756, 0, 0, 0, 1, 1,
1.803444, 0.485904, 1.193166, 0, 0, 0, 1, 1,
1.808848, -0.400809, 2.111473, 0, 0, 0, 1, 1,
1.814131, -1.614425, 0.9654838, 1, 1, 1, 1, 1,
1.818289, 1.109457, 1.653231, 1, 1, 1, 1, 1,
1.853333, 0.9191425, 1.229341, 1, 1, 1, 1, 1,
1.866893, 0.1470811, 1.928466, 1, 1, 1, 1, 1,
1.889825, 1.655965, 0.2519365, 1, 1, 1, 1, 1,
1.90041, 0.6230226, 1.980291, 1, 1, 1, 1, 1,
1.904251, -0.3757787, 2.790992, 1, 1, 1, 1, 1,
1.906609, -0.07165894, 3.088514, 1, 1, 1, 1, 1,
1.944343, 0.8385894, 2.830001, 1, 1, 1, 1, 1,
1.979037, 0.2360478, 1.766888, 1, 1, 1, 1, 1,
1.989207, -0.4648142, 1.458523, 1, 1, 1, 1, 1,
1.990837, 0.2020599, -0.00978205, 1, 1, 1, 1, 1,
2.010497, -1.270465, 2.543052, 1, 1, 1, 1, 1,
2.019018, -0.5225757, 0.5186911, 1, 1, 1, 1, 1,
2.05203, 0.4963062, 2.123286, 1, 1, 1, 1, 1,
2.182652, -0.230089, 0.4166867, 0, 0, 1, 1, 1,
2.185299, -0.7803155, 0.1691073, 1, 0, 0, 1, 1,
2.19951, 1.567692, -0.5591536, 1, 0, 0, 1, 1,
2.210858, -0.9002198, 1.463931, 1, 0, 0, 1, 1,
2.21729, 0.2473518, 2.799464, 1, 0, 0, 1, 1,
2.226386, 0.2712237, 2.494986, 1, 0, 0, 1, 1,
2.245866, -0.6841884, 1.866273, 0, 0, 0, 1, 1,
2.287492, 1.334457, 1.004305, 0, 0, 0, 1, 1,
2.33377, 0.3527645, 1.772742, 0, 0, 0, 1, 1,
2.338815, -0.5941226, 3.326322, 0, 0, 0, 1, 1,
2.383534, 0.03850663, 1.760398, 0, 0, 0, 1, 1,
2.443713, -1.392032, 1.809764, 0, 0, 0, 1, 1,
2.463628, -0.05372145, 2.821615, 0, 0, 0, 1, 1,
2.494213, 0.8084198, 0.7841488, 1, 1, 1, 1, 1,
2.568002, -0.4540044, 3.822457, 1, 1, 1, 1, 1,
2.622505, -0.6234164, 1.467675, 1, 1, 1, 1, 1,
2.729223, -2.28642, 3.361846, 1, 1, 1, 1, 1,
2.886535, -0.8217259, 2.834029, 1, 1, 1, 1, 1,
3.078737, -0.7767487, -0.1367877, 1, 1, 1, 1, 1,
3.480642, 0.3233819, 1.124999, 1, 1, 1, 1, 1
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
var radius = 9.743154;
var distance = 34.22242;
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
mvMatrix.translate( -0.2773592, -0.1214824, 0.4191546 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.22242);
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
