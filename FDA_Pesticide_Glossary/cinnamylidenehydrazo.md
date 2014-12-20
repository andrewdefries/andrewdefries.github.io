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
-3.337939, -0.9451007, -1.210775, 1, 0, 0, 1,
-2.715775, 1.08013, -3.559571, 1, 0.007843138, 0, 1,
-2.56648, 0.6618162, -0.09034619, 1, 0.01176471, 0, 1,
-2.53015, -0.4405588, -1.464649, 1, 0.01960784, 0, 1,
-2.515214, -0.7058344, -3.34902, 1, 0.02352941, 0, 1,
-2.325257, -0.7749865, -1.693981, 1, 0.03137255, 0, 1,
-2.303838, 1.780614, -0.7365544, 1, 0.03529412, 0, 1,
-2.2662, -0.8413974, -2.171078, 1, 0.04313726, 0, 1,
-2.259152, 0.09339058, -1.153863, 1, 0.04705882, 0, 1,
-2.24281, 2.363433, 0.2512072, 1, 0.05490196, 0, 1,
-2.167942, 1.403705, -0.3593069, 1, 0.05882353, 0, 1,
-2.09183, -0.3398254, -2.548206, 1, 0.06666667, 0, 1,
-2.082665, -1.351082, 0.07362062, 1, 0.07058824, 0, 1,
-2.040909, 0.3115934, -1.667142, 1, 0.07843138, 0, 1,
-2.02575, -0.7023553, -0.3960002, 1, 0.08235294, 0, 1,
-1.99915, 2.514823, -1.301131, 1, 0.09019608, 0, 1,
-1.975358, -1.819775, -2.701126, 1, 0.09411765, 0, 1,
-1.966184, 1.05016, 0.5984691, 1, 0.1019608, 0, 1,
-1.963431, -0.2775278, -0.1629947, 1, 0.1098039, 0, 1,
-1.950652, -0.342297, -1.950262, 1, 0.1137255, 0, 1,
-1.948666, -0.9045678, -2.831012, 1, 0.1215686, 0, 1,
-1.947944, 0.1569672, -1.809546, 1, 0.1254902, 0, 1,
-1.913298, -1.20738, -1.473721, 1, 0.1333333, 0, 1,
-1.910903, -1.113049, 0.3959871, 1, 0.1372549, 0, 1,
-1.897857, 0.209471, -1.280699, 1, 0.145098, 0, 1,
-1.895221, 0.5632094, -2.887281, 1, 0.1490196, 0, 1,
-1.886377, -2.080634, -1.880807, 1, 0.1568628, 0, 1,
-1.861787, 0.8908122, -1.87592, 1, 0.1607843, 0, 1,
-1.849446, -0.3325641, -1.213565, 1, 0.1686275, 0, 1,
-1.843147, -0.8721544, -1.387856, 1, 0.172549, 0, 1,
-1.829785, 0.5474022, -0.8060973, 1, 0.1803922, 0, 1,
-1.827195, 0.8313769, -1.410018, 1, 0.1843137, 0, 1,
-1.790835, 0.7457147, -0.962442, 1, 0.1921569, 0, 1,
-1.777827, -0.2545988, -3.412765, 1, 0.1960784, 0, 1,
-1.756414, -0.008833272, -2.279807, 1, 0.2039216, 0, 1,
-1.752468, -0.02360666, -2.138932, 1, 0.2117647, 0, 1,
-1.746558, -0.8907459, -2.524992, 1, 0.2156863, 0, 1,
-1.738437, -1.921019, -4.060901, 1, 0.2235294, 0, 1,
-1.737394, -0.3786078, -2.553148, 1, 0.227451, 0, 1,
-1.73672, 0.2410285, -3.245942, 1, 0.2352941, 0, 1,
-1.7222, -0.7512087, -1.558514, 1, 0.2392157, 0, 1,
-1.676996, 1.74489, -2.415098, 1, 0.2470588, 0, 1,
-1.675152, 0.6070789, -2.535234, 1, 0.2509804, 0, 1,
-1.674275, 2.28354, -0.7045649, 1, 0.2588235, 0, 1,
-1.66914, 1.263449, -1.892727, 1, 0.2627451, 0, 1,
-1.666879, -1.273645, -2.175706, 1, 0.2705882, 0, 1,
-1.666236, -0.1427931, -4.055772, 1, 0.2745098, 0, 1,
-1.655674, -0.9739286, -1.604383, 1, 0.282353, 0, 1,
-1.645911, 0.205914, -1.93028, 1, 0.2862745, 0, 1,
-1.64418, 0.9068284, -1.376013, 1, 0.2941177, 0, 1,
-1.639952, 2.601154, -0.1671282, 1, 0.3019608, 0, 1,
-1.637722, 0.4338415, -1.918276, 1, 0.3058824, 0, 1,
-1.625736, -0.1598754, -1.438894, 1, 0.3137255, 0, 1,
-1.613167, -0.3115946, -1.147103, 1, 0.3176471, 0, 1,
-1.597263, -0.1060641, -1.949283, 1, 0.3254902, 0, 1,
-1.588806, -0.0009773353, -1.541567, 1, 0.3294118, 0, 1,
-1.587769, 0.2374638, 0.2399009, 1, 0.3372549, 0, 1,
-1.584565, -2.123288, -1.61602, 1, 0.3411765, 0, 1,
-1.531057, 1.731001, -1.766581, 1, 0.3490196, 0, 1,
-1.52062, 0.566193, 1.415507, 1, 0.3529412, 0, 1,
-1.515833, -0.6900356, -2.919586, 1, 0.3607843, 0, 1,
-1.497181, 2.054854, 0.000811548, 1, 0.3647059, 0, 1,
-1.478548, -0.2959922, -2.802502, 1, 0.372549, 0, 1,
-1.476655, -0.192566, -0.8097075, 1, 0.3764706, 0, 1,
-1.473862, 0.7077527, -0.3160869, 1, 0.3843137, 0, 1,
-1.470589, 1.465454, -0.7705697, 1, 0.3882353, 0, 1,
-1.463841, -0.6374848, -2.022662, 1, 0.3960784, 0, 1,
-1.453839, -0.579202, -0.4690241, 1, 0.4039216, 0, 1,
-1.451858, -0.7152358, -2.203469, 1, 0.4078431, 0, 1,
-1.431693, -1.115682, -1.147734, 1, 0.4156863, 0, 1,
-1.429991, 0.4533715, -0.3656671, 1, 0.4196078, 0, 1,
-1.429833, -2.152027, -3.248792, 1, 0.427451, 0, 1,
-1.416452, 1.266537, -0.9405248, 1, 0.4313726, 0, 1,
-1.406883, 0.3917581, -0.7581147, 1, 0.4392157, 0, 1,
-1.393762, 0.6071773, -1.565615, 1, 0.4431373, 0, 1,
-1.393655, 0.005815027, -2.379304, 1, 0.4509804, 0, 1,
-1.390102, -1.993061, -2.249823, 1, 0.454902, 0, 1,
-1.387881, -0.757964, 0.3269033, 1, 0.4627451, 0, 1,
-1.387021, 0.09953539, -2.242959, 1, 0.4666667, 0, 1,
-1.385377, -0.9923626, -2.628015, 1, 0.4745098, 0, 1,
-1.383799, 1.177233, 0.5967488, 1, 0.4784314, 0, 1,
-1.374428, -0.9910415, -3.423434, 1, 0.4862745, 0, 1,
-1.368364, -1.383623, -2.885055, 1, 0.4901961, 0, 1,
-1.365749, 0.8935735, 0.5232201, 1, 0.4980392, 0, 1,
-1.347188, -0.04445274, 0.2272569, 1, 0.5058824, 0, 1,
-1.346759, 0.752206, -0.3537259, 1, 0.509804, 0, 1,
-1.336653, -0.9151253, -4.115621, 1, 0.5176471, 0, 1,
-1.335404, -0.7402155, -3.066492, 1, 0.5215687, 0, 1,
-1.332849, 2.395267, -1.002883, 1, 0.5294118, 0, 1,
-1.32096, 1.030555, -1.618462, 1, 0.5333334, 0, 1,
-1.320329, 0.4242356, -2.416633, 1, 0.5411765, 0, 1,
-1.318283, 0.1781589, -0.1670169, 1, 0.5450981, 0, 1,
-1.311946, -0.3915339, -3.928849, 1, 0.5529412, 0, 1,
-1.310137, -0.4518731, -0.975767, 1, 0.5568628, 0, 1,
-1.302473, -2.136792, -2.641564, 1, 0.5647059, 0, 1,
-1.289335, 1.095664, -1.714531, 1, 0.5686275, 0, 1,
-1.288262, -1.513163, -3.85422, 1, 0.5764706, 0, 1,
-1.287833, 0.3900134, -1.990284, 1, 0.5803922, 0, 1,
-1.279672, 0.1428739, -1.838468, 1, 0.5882353, 0, 1,
-1.2775, 0.6981848, -0.3175924, 1, 0.5921569, 0, 1,
-1.275836, 1.933908, -0.7081009, 1, 0.6, 0, 1,
-1.272797, 0.8566894, -1.278932, 1, 0.6078432, 0, 1,
-1.26869, -0.9735479, -2.827783, 1, 0.6117647, 0, 1,
-1.258849, 0.05343946, -2.19606, 1, 0.6196079, 0, 1,
-1.256267, -0.2243737, -0.9052497, 1, 0.6235294, 0, 1,
-1.246912, 0.9095625, -1.557271, 1, 0.6313726, 0, 1,
-1.242767, -2.20533, -3.182146, 1, 0.6352941, 0, 1,
-1.23841, 0.2900234, -1.142351, 1, 0.6431373, 0, 1,
-1.234824, 0.8176832, -2.32036, 1, 0.6470588, 0, 1,
-1.233635, -0.8173115, -0.8838748, 1, 0.654902, 0, 1,
-1.227963, -0.1917055, 0.64545, 1, 0.6588235, 0, 1,
-1.220667, -1.025871, -1.770271, 1, 0.6666667, 0, 1,
-1.215388, 1.198575, -0.420522, 1, 0.6705883, 0, 1,
-1.21515, -0.3324822, -2.394982, 1, 0.6784314, 0, 1,
-1.205998, -1.822514, -1.198363, 1, 0.682353, 0, 1,
-1.205631, 0.4434516, -1.982245, 1, 0.6901961, 0, 1,
-1.204494, -0.2553516, -4.142111, 1, 0.6941177, 0, 1,
-1.197841, 1.581189, -0.6715348, 1, 0.7019608, 0, 1,
-1.196989, -0.4564043, -0.5074927, 1, 0.7098039, 0, 1,
-1.196544, 0.5618191, -0.780023, 1, 0.7137255, 0, 1,
-1.192826, -0.6026042, -2.511291, 1, 0.7215686, 0, 1,
-1.179614, 1.868636, -0.9254262, 1, 0.7254902, 0, 1,
-1.178104, -0.9634077, -2.261082, 1, 0.7333333, 0, 1,
-1.17082, 0.3356375, -0.3626021, 1, 0.7372549, 0, 1,
-1.1688, 0.809863, -1.549089, 1, 0.7450981, 0, 1,
-1.16697, -1.553152, -3.677778, 1, 0.7490196, 0, 1,
-1.161928, 0.5522503, -2.098494, 1, 0.7568628, 0, 1,
-1.159742, 0.03636548, -0.6511319, 1, 0.7607843, 0, 1,
-1.157099, 2.362221, 0.5778219, 1, 0.7686275, 0, 1,
-1.15273, 1.375116, -1.305371, 1, 0.772549, 0, 1,
-1.151395, -0.1569577, 0.3330545, 1, 0.7803922, 0, 1,
-1.149407, 0.2653632, -1.07108, 1, 0.7843137, 0, 1,
-1.148842, 0.148798, -2.394683, 1, 0.7921569, 0, 1,
-1.14711, 0.6585369, -0.7827107, 1, 0.7960784, 0, 1,
-1.144299, -1.453797, -3.084819, 1, 0.8039216, 0, 1,
-1.143418, -0.08529319, -0.2915445, 1, 0.8117647, 0, 1,
-1.122965, -0.4220571, -1.701055, 1, 0.8156863, 0, 1,
-1.122944, -1.413547, -3.010946, 1, 0.8235294, 0, 1,
-1.122353, 0.5178508, -1.572285, 1, 0.827451, 0, 1,
-1.100424, 0.7345471, 0.2085191, 1, 0.8352941, 0, 1,
-1.099946, -1.96139, -1.398531, 1, 0.8392157, 0, 1,
-1.098869, 0.9650053, -0.2394525, 1, 0.8470588, 0, 1,
-1.095705, -0.1875039, -1.465245, 1, 0.8509804, 0, 1,
-1.089403, 0.1110631, -0.8479776, 1, 0.8588235, 0, 1,
-1.087383, -0.9954405, -0.8488707, 1, 0.8627451, 0, 1,
-1.084418, -0.5861636, -2.216707, 1, 0.8705882, 0, 1,
-1.079109, -0.03601135, -2.093891, 1, 0.8745098, 0, 1,
-1.078211, -2.373598, -1.49912, 1, 0.8823529, 0, 1,
-1.074512, 0.9950553, -1.142582, 1, 0.8862745, 0, 1,
-1.072752, 1.176712, -0.2074226, 1, 0.8941177, 0, 1,
-1.068641, 0.6505952, -1.119297, 1, 0.8980392, 0, 1,
-1.065946, -0.1639532, -1.165958, 1, 0.9058824, 0, 1,
-1.064977, -1.83251, -2.173458, 1, 0.9137255, 0, 1,
-1.064623, 0.001018484, -2.082255, 1, 0.9176471, 0, 1,
-1.056925, 2.286253, -0.4249117, 1, 0.9254902, 0, 1,
-1.050199, -1.27112, -3.491855, 1, 0.9294118, 0, 1,
-1.044397, -0.1420687, -1.126371, 1, 0.9372549, 0, 1,
-1.044282, -1.61208, 0.4577231, 1, 0.9411765, 0, 1,
-1.034777, -1.277834, -2.858647, 1, 0.9490196, 0, 1,
-1.033116, -1.581542, -1.525792, 1, 0.9529412, 0, 1,
-1.019954, 0.7558744, -1.088314, 1, 0.9607843, 0, 1,
-1.016691, -0.784758, -1.755989, 1, 0.9647059, 0, 1,
-1.015796, -1.152351, -2.480654, 1, 0.972549, 0, 1,
-1.014213, -0.4612154, -1.035436, 1, 0.9764706, 0, 1,
-1.012452, -0.4134161, -0.9032777, 1, 0.9843137, 0, 1,
-1.010176, -0.7938089, -1.618979, 1, 0.9882353, 0, 1,
-1.009606, 0.627308, -1.066086, 1, 0.9960784, 0, 1,
-1.005152, 1.090083, -0.3359127, 0.9960784, 1, 0, 1,
-1.004967, -2.449909, -2.429115, 0.9921569, 1, 0, 1,
-0.9999306, -0.6582682, -1.146107, 0.9843137, 1, 0, 1,
-0.99928, 1.268088, -2.215826, 0.9803922, 1, 0, 1,
-0.9950723, -0.4424968, -0.239733, 0.972549, 1, 0, 1,
-0.9910146, 0.4288103, -1.900235, 0.9686275, 1, 0, 1,
-0.9817083, 0.1212826, -0.2867947, 0.9607843, 1, 0, 1,
-0.9716125, 0.6129045, -1.138264, 0.9568627, 1, 0, 1,
-0.971165, -0.8958654, -1.964804, 0.9490196, 1, 0, 1,
-0.9703301, -0.9712759, -3.4137, 0.945098, 1, 0, 1,
-0.9668324, -0.2908988, -1.401254, 0.9372549, 1, 0, 1,
-0.9573881, 0.2103314, -1.780703, 0.9333333, 1, 0, 1,
-0.9560513, 0.5348777, -2.398886, 0.9254902, 1, 0, 1,
-0.9480879, -0.1265863, -1.427912, 0.9215686, 1, 0, 1,
-0.9480684, 0.5268491, 0.3608863, 0.9137255, 1, 0, 1,
-0.9444833, -0.2070983, -1.813181, 0.9098039, 1, 0, 1,
-0.9427325, -0.4015736, -2.358445, 0.9019608, 1, 0, 1,
-0.9403069, -0.2831804, -2.887849, 0.8941177, 1, 0, 1,
-0.9396454, 0.3638768, -1.973691, 0.8901961, 1, 0, 1,
-0.9313416, -0.7843087, -2.994427, 0.8823529, 1, 0, 1,
-0.9288116, 0.7054261, 1.020739, 0.8784314, 1, 0, 1,
-0.9273393, -1.112578, -3.287676, 0.8705882, 1, 0, 1,
-0.9247524, -1.154448, -3.424362, 0.8666667, 1, 0, 1,
-0.9244441, 1.431429, 0.2018117, 0.8588235, 1, 0, 1,
-0.9223098, -1.259228, -2.38964, 0.854902, 1, 0, 1,
-0.9208213, -0.1367652, -1.628468, 0.8470588, 1, 0, 1,
-0.9166079, 0.4445904, 0.534928, 0.8431373, 1, 0, 1,
-0.9127666, 1.500966, 0.1274046, 0.8352941, 1, 0, 1,
-0.9081233, 1.489973, -1.231937, 0.8313726, 1, 0, 1,
-0.907783, 0.008797651, -0.7510647, 0.8235294, 1, 0, 1,
-0.9008502, -0.827841, -2.697706, 0.8196079, 1, 0, 1,
-0.900385, -0.6828665, -1.265538, 0.8117647, 1, 0, 1,
-0.8958084, 0.08533297, 0.9196954, 0.8078431, 1, 0, 1,
-0.8942308, 1.679109, 0.5294657, 0.8, 1, 0, 1,
-0.8938468, 0.9318908, -0.3831302, 0.7921569, 1, 0, 1,
-0.8908715, -0.6044085, -1.17199, 0.7882353, 1, 0, 1,
-0.8900434, -1.13654, -2.913164, 0.7803922, 1, 0, 1,
-0.8872303, 0.7022495, -0.2870395, 0.7764706, 1, 0, 1,
-0.8856151, 0.8796664, -2.450929, 0.7686275, 1, 0, 1,
-0.8847558, -0.6753075, -2.918046, 0.7647059, 1, 0, 1,
-0.8842829, -0.1137503, -1.559752, 0.7568628, 1, 0, 1,
-0.8793064, -1.569319, -1.017743, 0.7529412, 1, 0, 1,
-0.8789205, -0.08147506, -0.4712184, 0.7450981, 1, 0, 1,
-0.8663418, 1.216687, 0.2779427, 0.7411765, 1, 0, 1,
-0.865631, 0.4182323, -1.498437, 0.7333333, 1, 0, 1,
-0.8644884, 1.033143, 0.4437389, 0.7294118, 1, 0, 1,
-0.8584218, -0.08667671, -2.479919, 0.7215686, 1, 0, 1,
-0.8557048, -1.065835, -2.174345, 0.7176471, 1, 0, 1,
-0.8476118, 1.655857, 0.3958226, 0.7098039, 1, 0, 1,
-0.8456424, -1.39836, -3.888556, 0.7058824, 1, 0, 1,
-0.8385692, 0.949501, -2.438138, 0.6980392, 1, 0, 1,
-0.8309196, -0.4778719, -2.223764, 0.6901961, 1, 0, 1,
-0.8261562, 1.451649, 0.3232318, 0.6862745, 1, 0, 1,
-0.8229602, -0.3394603, -1.427662, 0.6784314, 1, 0, 1,
-0.8177251, 1.456237, -0.6271936, 0.6745098, 1, 0, 1,
-0.8145269, 1.205655, -0.3388546, 0.6666667, 1, 0, 1,
-0.8109121, 0.3129271, -2.308868, 0.6627451, 1, 0, 1,
-0.8098176, -0.3433824, -0.7193025, 0.654902, 1, 0, 1,
-0.7998754, -0.8811137, -2.192947, 0.6509804, 1, 0, 1,
-0.7980007, -0.5762861, -0.866459, 0.6431373, 1, 0, 1,
-0.7978973, 0.7098583, -2.40196, 0.6392157, 1, 0, 1,
-0.7976573, 1.260611, -1.095568, 0.6313726, 1, 0, 1,
-0.7866251, -1.624823, -1.658186, 0.627451, 1, 0, 1,
-0.781772, -0.8765319, -2.610085, 0.6196079, 1, 0, 1,
-0.776273, -0.3775533, -0.4352346, 0.6156863, 1, 0, 1,
-0.7745701, -2.142389, -4.877134, 0.6078432, 1, 0, 1,
-0.7728008, 0.3737449, -1.167174, 0.6039216, 1, 0, 1,
-0.7707956, 1.00438, -0.8769732, 0.5960785, 1, 0, 1,
-0.7640164, -0.3650636, -1.937197, 0.5882353, 1, 0, 1,
-0.7579438, -0.911954, -2.300272, 0.5843138, 1, 0, 1,
-0.7526298, -1.509315, -1.867395, 0.5764706, 1, 0, 1,
-0.750246, -2.738271, -1.119945, 0.572549, 1, 0, 1,
-0.7500779, 1.167009, -1.013338, 0.5647059, 1, 0, 1,
-0.7440233, -0.6844765, -2.13145, 0.5607843, 1, 0, 1,
-0.7327566, 0.6732833, -1.228404, 0.5529412, 1, 0, 1,
-0.7300986, -2.237876, -3.362629, 0.5490196, 1, 0, 1,
-0.7250811, -0.4934057, -2.568867, 0.5411765, 1, 0, 1,
-0.7241317, 1.257124, -0.08253133, 0.5372549, 1, 0, 1,
-0.7181033, 0.498168, -1.122374, 0.5294118, 1, 0, 1,
-0.7166383, -0.3906483, -1.245312, 0.5254902, 1, 0, 1,
-0.7117983, -0.02308003, -1.61435, 0.5176471, 1, 0, 1,
-0.7027295, -0.1895693, 0.2357064, 0.5137255, 1, 0, 1,
-0.7014919, -0.2374081, -2.357341, 0.5058824, 1, 0, 1,
-0.7002737, -1.770985, -5.265821, 0.5019608, 1, 0, 1,
-0.6773556, 1.477003, 0.3685597, 0.4941176, 1, 0, 1,
-0.6764197, -0.06342998, 0.07828017, 0.4862745, 1, 0, 1,
-0.6732906, 0.5520311, 1.601992, 0.4823529, 1, 0, 1,
-0.672002, 0.6878589, -0.4548882, 0.4745098, 1, 0, 1,
-0.6675044, 0.7785583, -0.07417402, 0.4705882, 1, 0, 1,
-0.6660658, -1.590033, -4.109456, 0.4627451, 1, 0, 1,
-0.6649184, 0.990284, 0.7072408, 0.4588235, 1, 0, 1,
-0.6631536, 0.509862, 0.9266644, 0.4509804, 1, 0, 1,
-0.6621045, 0.8608651, -0.3621374, 0.4470588, 1, 0, 1,
-0.6620303, 1.015848, -0.3708194, 0.4392157, 1, 0, 1,
-0.6604525, -1.655996, -1.858662, 0.4352941, 1, 0, 1,
-0.6597824, -0.3314191, -0.6911345, 0.427451, 1, 0, 1,
-0.6588225, -1.500144, -1.451588, 0.4235294, 1, 0, 1,
-0.6555956, 1.772591, -0.5152214, 0.4156863, 1, 0, 1,
-0.6550867, 1.217955, 0.2750838, 0.4117647, 1, 0, 1,
-0.65456, -0.1036448, -2.662819, 0.4039216, 1, 0, 1,
-0.6520607, -0.6309804, -1.0715, 0.3960784, 1, 0, 1,
-0.6501902, -0.2758444, -2.206596, 0.3921569, 1, 0, 1,
-0.6438748, 1.12466, 0.06751415, 0.3843137, 1, 0, 1,
-0.643356, -0.4701203, -1.746462, 0.3803922, 1, 0, 1,
-0.6431545, 0.2202618, -2.027129, 0.372549, 1, 0, 1,
-0.6429133, 0.8711007, -2.235393, 0.3686275, 1, 0, 1,
-0.6419986, -0.5402222, -0.5858152, 0.3607843, 1, 0, 1,
-0.6389113, 2.809468, -0.8305331, 0.3568628, 1, 0, 1,
-0.6261911, -1.183996, -2.380911, 0.3490196, 1, 0, 1,
-0.6241547, -0.8089116, -2.541124, 0.345098, 1, 0, 1,
-0.6234004, 0.4090277, -0.6007836, 0.3372549, 1, 0, 1,
-0.6230346, -0.08942742, -1.734617, 0.3333333, 1, 0, 1,
-0.6207834, -0.7214032, -0.6834306, 0.3254902, 1, 0, 1,
-0.6205481, 0.7654274, -1.190071, 0.3215686, 1, 0, 1,
-0.6131261, 0.2091398, -2.157204, 0.3137255, 1, 0, 1,
-0.6126564, -1.348645, -1.481441, 0.3098039, 1, 0, 1,
-0.6087921, 0.6080984, -1.702564, 0.3019608, 1, 0, 1,
-0.6067281, -0.9014587, -3.846152, 0.2941177, 1, 0, 1,
-0.6031981, 0.04866213, -1.928297, 0.2901961, 1, 0, 1,
-0.6003699, -1.651368, -2.118765, 0.282353, 1, 0, 1,
-0.5947409, -1.807565, -3.208927, 0.2784314, 1, 0, 1,
-0.5777721, 0.7074652, -1.271656, 0.2705882, 1, 0, 1,
-0.5718399, -0.2678561, -3.205446, 0.2666667, 1, 0, 1,
-0.5670662, -0.9221796, -1.016396, 0.2588235, 1, 0, 1,
-0.5612707, 0.140522, -1.879731, 0.254902, 1, 0, 1,
-0.5583693, 0.7902728, -0.4162639, 0.2470588, 1, 0, 1,
-0.5546448, -0.4210935, -1.987108, 0.2431373, 1, 0, 1,
-0.5475504, 0.4942481, -0.3950911, 0.2352941, 1, 0, 1,
-0.5426885, 0.6424659, -1.910808, 0.2313726, 1, 0, 1,
-0.5417171, -0.176055, -2.053644, 0.2235294, 1, 0, 1,
-0.5410155, -1.985149, -2.339583, 0.2196078, 1, 0, 1,
-0.5293564, 1.873007, 0.5238301, 0.2117647, 1, 0, 1,
-0.5282776, 0.7763009, -2.156024, 0.2078431, 1, 0, 1,
-0.5269892, 0.796211, -0.3102914, 0.2, 1, 0, 1,
-0.5208622, 0.9151, -0.9838939, 0.1921569, 1, 0, 1,
-0.5178801, -0.0617679, -3.269903, 0.1882353, 1, 0, 1,
-0.5167568, -1.781279, -2.925037, 0.1803922, 1, 0, 1,
-0.5152824, -0.9487471, -1.264465, 0.1764706, 1, 0, 1,
-0.5143256, 0.6181951, -0.2285596, 0.1686275, 1, 0, 1,
-0.5076115, 0.3366415, -0.9803308, 0.1647059, 1, 0, 1,
-0.5046771, 0.3332954, 0.5443242, 0.1568628, 1, 0, 1,
-0.5039308, 0.1997359, -0.6582787, 0.1529412, 1, 0, 1,
-0.5020135, -1.894674, -1.87277, 0.145098, 1, 0, 1,
-0.4972198, 0.4772024, 0.5830287, 0.1411765, 1, 0, 1,
-0.496726, -0.4367286, -1.675756, 0.1333333, 1, 0, 1,
-0.4916878, 0.08674801, -1.946995, 0.1294118, 1, 0, 1,
-0.4869776, 0.317511, -1.804673, 0.1215686, 1, 0, 1,
-0.4854984, -0.08891064, -1.378352, 0.1176471, 1, 0, 1,
-0.4820424, 1.129957, -0.8325421, 0.1098039, 1, 0, 1,
-0.4805406, 1.510011, -0.5734691, 0.1058824, 1, 0, 1,
-0.4800622, 0.1573249, -2.644179, 0.09803922, 1, 0, 1,
-0.478268, -0.8077925, -2.852425, 0.09019608, 1, 0, 1,
-0.4780544, -0.2576789, -1.318912, 0.08627451, 1, 0, 1,
-0.4726511, 0.7998874, -1.231349, 0.07843138, 1, 0, 1,
-0.4715538, 1.055286, 0.06613851, 0.07450981, 1, 0, 1,
-0.4710411, -0.9239094, -2.041616, 0.06666667, 1, 0, 1,
-0.4703118, 0.1899814, -1.861455, 0.0627451, 1, 0, 1,
-0.4604996, 2.815873, 0.8868595, 0.05490196, 1, 0, 1,
-0.4536659, -0.5958136, -3.036824, 0.05098039, 1, 0, 1,
-0.4527277, -0.1754598, -0.6337202, 0.04313726, 1, 0, 1,
-0.4498632, -0.7561314, -1.993731, 0.03921569, 1, 0, 1,
-0.4495062, 2.091096, -0.2508317, 0.03137255, 1, 0, 1,
-0.4483816, 0.4368617, 0.001222298, 0.02745098, 1, 0, 1,
-0.4384447, -1.512037, -2.400282, 0.01960784, 1, 0, 1,
-0.4360984, 1.456936, -1.538356, 0.01568628, 1, 0, 1,
-0.4328479, -0.3353446, -0.8911916, 0.007843138, 1, 0, 1,
-0.4308043, 0.3786263, -0.5197313, 0.003921569, 1, 0, 1,
-0.4306986, -0.4924712, -1.613786, 0, 1, 0.003921569, 1,
-0.4301078, -2.237974, -3.129697, 0, 1, 0.01176471, 1,
-0.4216819, 0.598592, -0.6250188, 0, 1, 0.01568628, 1,
-0.4210203, -0.3887025, -2.626438, 0, 1, 0.02352941, 1,
-0.4194321, 1.611135, 0.8376033, 0, 1, 0.02745098, 1,
-0.4190672, -1.050851, -3.416846, 0, 1, 0.03529412, 1,
-0.4166209, 0.1428017, -1.581575, 0, 1, 0.03921569, 1,
-0.4164982, 0.8267815, 1.376475, 0, 1, 0.04705882, 1,
-0.4164013, 0.2664896, -0.7158516, 0, 1, 0.05098039, 1,
-0.416095, 1.468298, 0.2854798, 0, 1, 0.05882353, 1,
-0.4113091, 0.02685556, -1.13932, 0, 1, 0.0627451, 1,
-0.4088037, -1.049335, -1.754147, 0, 1, 0.07058824, 1,
-0.4037354, -0.4682221, -1.353544, 0, 1, 0.07450981, 1,
-0.3961062, 0.8123708, 0.4867715, 0, 1, 0.08235294, 1,
-0.3957813, -0.1523057, -1.867851, 0, 1, 0.08627451, 1,
-0.3933912, -0.9770712, -2.965858, 0, 1, 0.09411765, 1,
-0.3928321, 0.3494378, -0.06147479, 0, 1, 0.1019608, 1,
-0.389211, 0.5966812, -0.7984393, 0, 1, 0.1058824, 1,
-0.386845, 1.159177, -0.5899311, 0, 1, 0.1137255, 1,
-0.3854544, -0.5319949, -2.21954, 0, 1, 0.1176471, 1,
-0.3847598, -2.65934, -1.526011, 0, 1, 0.1254902, 1,
-0.3838505, 0.05255606, -0.3038134, 0, 1, 0.1294118, 1,
-0.382509, 0.8607059, -0.801483, 0, 1, 0.1372549, 1,
-0.3822412, 0.1476324, -2.097165, 0, 1, 0.1411765, 1,
-0.3796214, -1.302145, -1.889966, 0, 1, 0.1490196, 1,
-0.3796046, 0.5434001, -0.9067277, 0, 1, 0.1529412, 1,
-0.3794296, 0.1769981, 0.2288332, 0, 1, 0.1607843, 1,
-0.3782942, 2.615775, -0.5333554, 0, 1, 0.1647059, 1,
-0.3764588, -0.8971797, -3.633885, 0, 1, 0.172549, 1,
-0.3758377, -0.8596601, -2.401906, 0, 1, 0.1764706, 1,
-0.3746579, -1.121495, -2.579646, 0, 1, 0.1843137, 1,
-0.3738203, -1.39959, -4.206156, 0, 1, 0.1882353, 1,
-0.3667746, 0.5464886, -0.4730532, 0, 1, 0.1960784, 1,
-0.3620302, 1.490732, -0.5567243, 0, 1, 0.2039216, 1,
-0.3580244, -0.777514, -2.400518, 0, 1, 0.2078431, 1,
-0.3562472, 2.840622, -0.4486498, 0, 1, 0.2156863, 1,
-0.3438083, -1.73505, -3.400865, 0, 1, 0.2196078, 1,
-0.3436143, 0.487541, -1.902095, 0, 1, 0.227451, 1,
-0.3435947, 0.7928082, 0.04531082, 0, 1, 0.2313726, 1,
-0.3409565, 0.4614727, -1.126312, 0, 1, 0.2392157, 1,
-0.3347102, -0.5447201, -2.438017, 0, 1, 0.2431373, 1,
-0.3271335, 0.3105539, -0.00733337, 0, 1, 0.2509804, 1,
-0.3222057, -0.1309533, -0.2384989, 0, 1, 0.254902, 1,
-0.3202659, -0.3585761, -2.940622, 0, 1, 0.2627451, 1,
-0.3171773, 0.7246736, 0.3958113, 0, 1, 0.2666667, 1,
-0.3171646, 0.3613551, 0.9235951, 0, 1, 0.2745098, 1,
-0.316431, 0.5284361, -1.851062, 0, 1, 0.2784314, 1,
-0.3131976, -0.01308532, -4.463536, 0, 1, 0.2862745, 1,
-0.3096972, -0.3888826, -0.5611479, 0, 1, 0.2901961, 1,
-0.3049183, -0.8780527, -2.915243, 0, 1, 0.2980392, 1,
-0.3041731, -1.153152, -2.1598, 0, 1, 0.3058824, 1,
-0.3041019, -0.9834461, -2.766199, 0, 1, 0.3098039, 1,
-0.3035879, -2.307111, -3.276775, 0, 1, 0.3176471, 1,
-0.3001623, 0.2355623, -0.9716065, 0, 1, 0.3215686, 1,
-0.2973286, 2.171796, -0.8570004, 0, 1, 0.3294118, 1,
-0.295258, -0.0319715, -1.173014, 0, 1, 0.3333333, 1,
-0.2949545, -0.8218435, -3.947444, 0, 1, 0.3411765, 1,
-0.2919202, 0.1552932, -1.79987, 0, 1, 0.345098, 1,
-0.2915952, 0.3607874, -0.7705086, 0, 1, 0.3529412, 1,
-0.290091, -0.5608935, -3.416697, 0, 1, 0.3568628, 1,
-0.2878755, -0.1546063, -2.539301, 0, 1, 0.3647059, 1,
-0.2863785, -0.6002719, -3.76852, 0, 1, 0.3686275, 1,
-0.2826815, 0.07534427, -1.799119, 0, 1, 0.3764706, 1,
-0.2791853, -0.4348027, -1.03499, 0, 1, 0.3803922, 1,
-0.2790367, -0.7292864, -1.629733, 0, 1, 0.3882353, 1,
-0.2780653, 1.431344, 0.2086432, 0, 1, 0.3921569, 1,
-0.2743741, -0.1024714, -2.580698, 0, 1, 0.4, 1,
-0.2716691, -1.565467, -2.939944, 0, 1, 0.4078431, 1,
-0.2699767, 1.275388, -0.244619, 0, 1, 0.4117647, 1,
-0.2614222, -1.627674, -2.690528, 0, 1, 0.4196078, 1,
-0.2601744, 0.8327521, -0.4719612, 0, 1, 0.4235294, 1,
-0.2586929, 0.2452293, 0.4311871, 0, 1, 0.4313726, 1,
-0.2551036, -1.517643, -4.666304, 0, 1, 0.4352941, 1,
-0.2550636, -1.433463, -3.936102, 0, 1, 0.4431373, 1,
-0.254007, 0.5556677, -1.360134, 0, 1, 0.4470588, 1,
-0.251038, 0.5100794, 0.3671536, 0, 1, 0.454902, 1,
-0.246046, 0.2376682, 0.4104482, 0, 1, 0.4588235, 1,
-0.2352906, 0.0356451, -0.5690455, 0, 1, 0.4666667, 1,
-0.2279697, -0.5452573, -3.731357, 0, 1, 0.4705882, 1,
-0.2263007, -1.211673, -3.159433, 0, 1, 0.4784314, 1,
-0.225399, 0.06293037, -0.4134815, 0, 1, 0.4823529, 1,
-0.2240977, 0.4256936, -0.1473153, 0, 1, 0.4901961, 1,
-0.2196911, 1.255198, -1.10001, 0, 1, 0.4941176, 1,
-0.2134036, -0.05185376, -1.555873, 0, 1, 0.5019608, 1,
-0.2111722, -0.8648576, -2.735966, 0, 1, 0.509804, 1,
-0.2106976, 0.7918378, -0.003955378, 0, 1, 0.5137255, 1,
-0.210352, 0.7155178, -0.6816198, 0, 1, 0.5215687, 1,
-0.2052573, -0.8150013, -4.435436, 0, 1, 0.5254902, 1,
-0.2011922, -0.3105719, -0.365201, 0, 1, 0.5333334, 1,
-0.1977743, 0.9008704, 0.4778947, 0, 1, 0.5372549, 1,
-0.1973244, 0.8526583, -0.8566061, 0, 1, 0.5450981, 1,
-0.1928322, 1.574213, -0.5696012, 0, 1, 0.5490196, 1,
-0.1882215, 0.4222573, -0.358921, 0, 1, 0.5568628, 1,
-0.1865268, 0.2789139, -1.83151, 0, 1, 0.5607843, 1,
-0.1857471, -0.8051074, -2.709077, 0, 1, 0.5686275, 1,
-0.1833509, 0.6667848, -1.150268, 0, 1, 0.572549, 1,
-0.1814605, -0.127387, -2.389748, 0, 1, 0.5803922, 1,
-0.181154, -0.6735595, -1.362315, 0, 1, 0.5843138, 1,
-0.1789386, 0.2735699, 0.6766034, 0, 1, 0.5921569, 1,
-0.1744842, 0.04967522, -0.6610335, 0, 1, 0.5960785, 1,
-0.1736613, -0.9640869, -2.49226, 0, 1, 0.6039216, 1,
-0.1729392, 0.04340082, -2.34745, 0, 1, 0.6117647, 1,
-0.1710032, -1.659888, -3.243051, 0, 1, 0.6156863, 1,
-0.1673943, 0.9855297, -0.9319451, 0, 1, 0.6235294, 1,
-0.1655517, 0.6739197, -0.5360813, 0, 1, 0.627451, 1,
-0.1653654, 1.073465, 1.000551, 0, 1, 0.6352941, 1,
-0.1586526, 0.342566, -1.164209, 0, 1, 0.6392157, 1,
-0.1533929, 0.5602637, -0.370709, 0, 1, 0.6470588, 1,
-0.1526844, 0.06008922, -0.955493, 0, 1, 0.6509804, 1,
-0.1494486, -1.372374, -3.280429, 0, 1, 0.6588235, 1,
-0.1481703, -1.355507, -2.405742, 0, 1, 0.6627451, 1,
-0.1444947, 1.190866, 0.9701861, 0, 1, 0.6705883, 1,
-0.1399751, 0.137514, -1.676057, 0, 1, 0.6745098, 1,
-0.1385041, 1.193464, -2.775231, 0, 1, 0.682353, 1,
-0.1324762, 0.6237042, -0.271878, 0, 1, 0.6862745, 1,
-0.1304608, -1.067788, -3.782099, 0, 1, 0.6941177, 1,
-0.1291388, -0.8323213, -5.00888, 0, 1, 0.7019608, 1,
-0.1266502, 1.214312, 1.206087, 0, 1, 0.7058824, 1,
-0.125297, -1.748791, -2.108028, 0, 1, 0.7137255, 1,
-0.1251382, 0.1112507, -0.3747055, 0, 1, 0.7176471, 1,
-0.1207425, -0.8982465, -3.937869, 0, 1, 0.7254902, 1,
-0.1186503, -0.6715038, -3.475006, 0, 1, 0.7294118, 1,
-0.1174854, 0.7952564, -0.8593622, 0, 1, 0.7372549, 1,
-0.113757, -1.772017, -3.002827, 0, 1, 0.7411765, 1,
-0.1130785, 0.3720751, -2.283128, 0, 1, 0.7490196, 1,
-0.1113057, 0.3726092, -1.049079, 0, 1, 0.7529412, 1,
-0.1109313, -0.5888437, -2.027331, 0, 1, 0.7607843, 1,
-0.1079857, 0.9647481, -0.93732, 0, 1, 0.7647059, 1,
-0.1067041, 0.4958093, -0.2617508, 0, 1, 0.772549, 1,
-0.1056119, -0.174522, -3.935049, 0, 1, 0.7764706, 1,
-0.1001711, -2.533812, -2.533358, 0, 1, 0.7843137, 1,
-0.09651035, -0.2857953, -3.480143, 0, 1, 0.7882353, 1,
-0.09452884, 1.961328, -1.460183, 0, 1, 0.7960784, 1,
-0.09291149, -2.145317, -5.176097, 0, 1, 0.8039216, 1,
-0.09177677, 1.041898, 0.6268026, 0, 1, 0.8078431, 1,
-0.09104119, 1.080536, -1.945017, 0, 1, 0.8156863, 1,
-0.0858288, -0.7212244, -4.081953, 0, 1, 0.8196079, 1,
-0.08152842, -0.9321117, -3.536543, 0, 1, 0.827451, 1,
-0.0812894, -1.129037, -4.330779, 0, 1, 0.8313726, 1,
-0.07978979, 0.4754891, -0.6407844, 0, 1, 0.8392157, 1,
-0.07835806, 0.3433128, -1.065129, 0, 1, 0.8431373, 1,
-0.07333201, 1.890454, 2.035063, 0, 1, 0.8509804, 1,
-0.07245629, -0.5528343, -3.568543, 0, 1, 0.854902, 1,
-0.06999194, 0.004052963, -1.863242, 0, 1, 0.8627451, 1,
-0.06985202, 1.908234, 1.145507, 0, 1, 0.8666667, 1,
-0.06871738, -0.3112271, -6.196353, 0, 1, 0.8745098, 1,
-0.06461123, -0.678356, -1.282671, 0, 1, 0.8784314, 1,
-0.06284699, -0.2516741, -3.964116, 0, 1, 0.8862745, 1,
-0.0572921, -0.351615, -3.143054, 0, 1, 0.8901961, 1,
-0.05607373, -1.402337, -2.796505, 0, 1, 0.8980392, 1,
-0.0533212, 0.7053373, 0.7188131, 0, 1, 0.9058824, 1,
-0.05119779, -0.2081447, -3.7648, 0, 1, 0.9098039, 1,
-0.04996765, 0.1366955, -0.09467373, 0, 1, 0.9176471, 1,
-0.03815057, 1.200427, 0.6067364, 0, 1, 0.9215686, 1,
-0.03210221, -1.644506, -3.803375, 0, 1, 0.9294118, 1,
-0.02988647, -0.6983749, -4.747263, 0, 1, 0.9333333, 1,
-0.02667711, -1.196828, -3.409985, 0, 1, 0.9411765, 1,
-0.02527459, 0.04171696, -1.19901, 0, 1, 0.945098, 1,
-0.0235784, 0.7873055, 0.6281298, 0, 1, 0.9529412, 1,
-0.02262711, -0.4801229, -3.268449, 0, 1, 0.9568627, 1,
-0.02003177, 0.6227862, -0.3301604, 0, 1, 0.9647059, 1,
-0.01977925, -0.7998058, -2.481313, 0, 1, 0.9686275, 1,
-0.01895824, 0.08120168, -0.2332279, 0, 1, 0.9764706, 1,
-0.01858237, 0.5214088, -0.9652963, 0, 1, 0.9803922, 1,
-0.006768688, 1.455441, 0.02098589, 0, 1, 0.9882353, 1,
-0.005830175, -0.5249735, -3.154822, 0, 1, 0.9921569, 1,
-0.004315288, 0.7709067, -1.073682, 0, 1, 1, 1,
-0.001819971, -0.5199059, -3.488914, 0, 0.9921569, 1, 1,
-0.000942829, 0.3467788, -0.4070673, 0, 0.9882353, 1, 1,
0.001172845, -0.2561654, 1.840629, 0, 0.9803922, 1, 1,
0.001445257, 0.9610249, 0.4664456, 0, 0.9764706, 1, 1,
0.00217043, 0.899829, 0.946515, 0, 0.9686275, 1, 1,
0.003160517, -0.9903944, 2.864101, 0, 0.9647059, 1, 1,
0.007587226, 0.5644361, 0.1641306, 0, 0.9568627, 1, 1,
0.00800857, -0.007932575, 1.897284, 0, 0.9529412, 1, 1,
0.009945546, -1.532583, 3.087165, 0, 0.945098, 1, 1,
0.01473667, -1.675665, 3.853945, 0, 0.9411765, 1, 1,
0.01520965, 0.1710336, -1.285963, 0, 0.9333333, 1, 1,
0.01557097, 1.251668, 2.138299, 0, 0.9294118, 1, 1,
0.02226236, -1.1148, 2.131942, 0, 0.9215686, 1, 1,
0.02233954, 0.2429974, 0.5199189, 0, 0.9176471, 1, 1,
0.02422128, -1.253029, 3.46137, 0, 0.9098039, 1, 1,
0.02482637, 1.222153, 1.879214, 0, 0.9058824, 1, 1,
0.02545116, -0.4013875, 1.906912, 0, 0.8980392, 1, 1,
0.02547439, 0.001966318, -0.1049872, 0, 0.8901961, 1, 1,
0.02737671, 1.339585, -1.645537, 0, 0.8862745, 1, 1,
0.02745897, -2.222634, 1.939314, 0, 0.8784314, 1, 1,
0.0361084, -0.7440444, 2.718282, 0, 0.8745098, 1, 1,
0.03749857, 0.07256307, 0.2255669, 0, 0.8666667, 1, 1,
0.03754083, 0.9632042, -0.05247066, 0, 0.8627451, 1, 1,
0.041207, -0.4944759, 1.116831, 0, 0.854902, 1, 1,
0.04268792, -0.3567228, 2.670298, 0, 0.8509804, 1, 1,
0.04341463, 1.18605, -1.576134, 0, 0.8431373, 1, 1,
0.04368315, -1.952293, 3.589595, 0, 0.8392157, 1, 1,
0.04823842, -0.2669832, 3.134991, 0, 0.8313726, 1, 1,
0.04983655, 0.241285, -1.594042, 0, 0.827451, 1, 1,
0.0513604, -0.5550667, 3.903876, 0, 0.8196079, 1, 1,
0.05718603, 0.2696706, 0.4542978, 0, 0.8156863, 1, 1,
0.05787062, -0.3129936, 2.045921, 0, 0.8078431, 1, 1,
0.06095212, -0.8430593, 3.251557, 0, 0.8039216, 1, 1,
0.06774933, 1.081835, 2.328421, 0, 0.7960784, 1, 1,
0.07079747, -1.985211, 2.189453, 0, 0.7882353, 1, 1,
0.0721726, -0.334998, 4.864001, 0, 0.7843137, 1, 1,
0.07284158, 0.5932886, 0.219337, 0, 0.7764706, 1, 1,
0.07533035, -0.5738051, 3.204042, 0, 0.772549, 1, 1,
0.07765506, 0.6310934, -0.1485576, 0, 0.7647059, 1, 1,
0.07934813, -1.818111, 3.506408, 0, 0.7607843, 1, 1,
0.08607831, 0.5520599, -0.2217208, 0, 0.7529412, 1, 1,
0.08670426, -1.145809, 1.32407, 0, 0.7490196, 1, 1,
0.08673192, -1.087993, 3.355915, 0, 0.7411765, 1, 1,
0.09067857, -0.9026064, 3.436641, 0, 0.7372549, 1, 1,
0.09197032, -0.3133611, 3.252627, 0, 0.7294118, 1, 1,
0.09237701, -2.397695, 1.794165, 0, 0.7254902, 1, 1,
0.1024838, -0.7614128, 1.563887, 0, 0.7176471, 1, 1,
0.103168, 0.6733088, 0.6218014, 0, 0.7137255, 1, 1,
0.1055106, 1.219437, 0.1480251, 0, 0.7058824, 1, 1,
0.1059725, 0.09342469, 0.8802182, 0, 0.6980392, 1, 1,
0.1064491, 1.155507, -0.4252582, 0, 0.6941177, 1, 1,
0.1077764, -1.180429, 4.53561, 0, 0.6862745, 1, 1,
0.1089044, -2.598946, 1.905569, 0, 0.682353, 1, 1,
0.1132734, -1.486757, 5.336089, 0, 0.6745098, 1, 1,
0.1150643, -0.9872553, 3.511577, 0, 0.6705883, 1, 1,
0.1207379, -1.877803, 4.073152, 0, 0.6627451, 1, 1,
0.123771, 0.6168523, -0.9774602, 0, 0.6588235, 1, 1,
0.1285201, 1.178591, -0.2269912, 0, 0.6509804, 1, 1,
0.1299558, 1.349869, -0.2675561, 0, 0.6470588, 1, 1,
0.1324185, 2.427736, 0.5470043, 0, 0.6392157, 1, 1,
0.1324265, 0.7334413, 0.6225436, 0, 0.6352941, 1, 1,
0.1342319, 0.6526172, 0.310356, 0, 0.627451, 1, 1,
0.1375006, -2.65276, 1.852479, 0, 0.6235294, 1, 1,
0.139312, 1.72642, 0.4994317, 0, 0.6156863, 1, 1,
0.1393335, 1.62333, -1.559864, 0, 0.6117647, 1, 1,
0.1413563, 2.230893, 0.6717693, 0, 0.6039216, 1, 1,
0.1435092, 0.9109752, -1.007162, 0, 0.5960785, 1, 1,
0.1497002, 1.741751, -0.4038289, 0, 0.5921569, 1, 1,
0.1520399, 0.2420605, 1.417996, 0, 0.5843138, 1, 1,
0.1546755, 0.5718952, -1.825434, 0, 0.5803922, 1, 1,
0.1552467, 2.623289, -0.385002, 0, 0.572549, 1, 1,
0.1586056, 1.057174, 2.203065, 0, 0.5686275, 1, 1,
0.1592156, 0.3268847, -0.1557099, 0, 0.5607843, 1, 1,
0.1592599, 1.206956, -0.6854392, 0, 0.5568628, 1, 1,
0.1601687, 0.6332405, 0.8435626, 0, 0.5490196, 1, 1,
0.1607061, 0.7120199, 0.489166, 0, 0.5450981, 1, 1,
0.1610904, -1.19221, 3.88193, 0, 0.5372549, 1, 1,
0.1612055, -2.177922, 4.249855, 0, 0.5333334, 1, 1,
0.1620312, 0.2869387, 0.1527619, 0, 0.5254902, 1, 1,
0.1643721, 0.01672922, 1.409856, 0, 0.5215687, 1, 1,
0.1652587, 0.406161, -0.2828498, 0, 0.5137255, 1, 1,
0.1701763, 0.4196301, -0.9550084, 0, 0.509804, 1, 1,
0.170688, 0.4743409, 0.2560424, 0, 0.5019608, 1, 1,
0.170913, -0.9599727, 2.347632, 0, 0.4941176, 1, 1,
0.1743612, 1.877471, -0.395801, 0, 0.4901961, 1, 1,
0.1782223, 0.4913786, 1.173296, 0, 0.4823529, 1, 1,
0.1802493, -1.440736, 2.173842, 0, 0.4784314, 1, 1,
0.1808922, -0.0287312, 3.269489, 0, 0.4705882, 1, 1,
0.1813781, 0.9784623, 0.4761899, 0, 0.4666667, 1, 1,
0.1819341, 0.9813898, -0.4457533, 0, 0.4588235, 1, 1,
0.1839156, 0.3376172, -0.8074806, 0, 0.454902, 1, 1,
0.1850629, 1.609775, -0.3119197, 0, 0.4470588, 1, 1,
0.1861469, 0.8962821, 0.7292437, 0, 0.4431373, 1, 1,
0.1873213, 1.395064, 0.4767205, 0, 0.4352941, 1, 1,
0.1919823, 1.617109, -1.630606, 0, 0.4313726, 1, 1,
0.1942119, -1.869298, 2.68592, 0, 0.4235294, 1, 1,
0.1942126, -0.5331211, 1.677064, 0, 0.4196078, 1, 1,
0.1968822, -1.045939, 3.81424, 0, 0.4117647, 1, 1,
0.1978273, -0.815737, 2.95704, 0, 0.4078431, 1, 1,
0.2000812, -0.2470481, 2.418621, 0, 0.4, 1, 1,
0.2028706, 1.638498, -1.294132, 0, 0.3921569, 1, 1,
0.2071639, 0.4267468, -0.01043838, 0, 0.3882353, 1, 1,
0.2164824, -0.8809444, 2.445023, 0, 0.3803922, 1, 1,
0.2247869, -0.0294766, 2.420194, 0, 0.3764706, 1, 1,
0.2261128, 0.3879459, 2.029264, 0, 0.3686275, 1, 1,
0.2279086, -1.268569, 4.002174, 0, 0.3647059, 1, 1,
0.2285358, 1.248621, -0.3283233, 0, 0.3568628, 1, 1,
0.2291239, 1.744666, 0.2618524, 0, 0.3529412, 1, 1,
0.2306278, -0.4756434, 3.367909, 0, 0.345098, 1, 1,
0.2314496, 0.2415236, 1.62637, 0, 0.3411765, 1, 1,
0.2320386, 2.490507, 0.4067208, 0, 0.3333333, 1, 1,
0.236557, -0.312619, 2.871064, 0, 0.3294118, 1, 1,
0.2371165, -0.372915, 3.693971, 0, 0.3215686, 1, 1,
0.2420368, 0.6548948, 1.35854, 0, 0.3176471, 1, 1,
0.2431338, 2.618213, -0.1931954, 0, 0.3098039, 1, 1,
0.25045, 0.279231, 0.3663567, 0, 0.3058824, 1, 1,
0.2587544, 0.02851863, -0.3098705, 0, 0.2980392, 1, 1,
0.2590123, 0.8089177, -0.5267118, 0, 0.2901961, 1, 1,
0.262136, -0.04022866, 1.636007, 0, 0.2862745, 1, 1,
0.263871, -0.6624707, 2.516672, 0, 0.2784314, 1, 1,
0.2647042, -0.572965, 0.9949302, 0, 0.2745098, 1, 1,
0.2759872, 0.2362298, 0.8195282, 0, 0.2666667, 1, 1,
0.2770106, -0.2199289, 1.929384, 0, 0.2627451, 1, 1,
0.2770138, -0.7129507, 2.507412, 0, 0.254902, 1, 1,
0.2863888, 0.762331, 2.195995, 0, 0.2509804, 1, 1,
0.290967, -0.2973441, 3.528818, 0, 0.2431373, 1, 1,
0.2914897, 0.7143524, 0.4624231, 0, 0.2392157, 1, 1,
0.2968245, -0.8561439, 4.18959, 0, 0.2313726, 1, 1,
0.3072362, -1.653046, 4.007316, 0, 0.227451, 1, 1,
0.3105103, 1.888698, -0.5246476, 0, 0.2196078, 1, 1,
0.3138423, -0.9314826, 2.943785, 0, 0.2156863, 1, 1,
0.3221622, 0.9037936, -0.2157419, 0, 0.2078431, 1, 1,
0.3223535, 0.1693123, 1.064429, 0, 0.2039216, 1, 1,
0.3233008, -0.0796322, 0.832596, 0, 0.1960784, 1, 1,
0.3238675, 0.4276271, 1.949713, 0, 0.1882353, 1, 1,
0.329233, -0.7654974, 2.531367, 0, 0.1843137, 1, 1,
0.3321262, -1.230108, 2.322933, 0, 0.1764706, 1, 1,
0.3322787, -0.6896707, 2.938333, 0, 0.172549, 1, 1,
0.3332154, 0.0968055, 2.289471, 0, 0.1647059, 1, 1,
0.3334744, -1.261513, 2.592252, 0, 0.1607843, 1, 1,
0.333559, 0.131596, 1.590257, 0, 0.1529412, 1, 1,
0.3399011, 0.6479949, 0.7966677, 0, 0.1490196, 1, 1,
0.3420475, -0.7752969, 2.424016, 0, 0.1411765, 1, 1,
0.3424976, -0.2086174, 2.653358, 0, 0.1372549, 1, 1,
0.3440659, -0.4315606, 4.206962, 0, 0.1294118, 1, 1,
0.3481013, -1.116719, 2.699127, 0, 0.1254902, 1, 1,
0.3521419, -0.9434054, 2.686528, 0, 0.1176471, 1, 1,
0.3569937, 0.4322491, 0.3575357, 0, 0.1137255, 1, 1,
0.35825, -1.628574, 2.860657, 0, 0.1058824, 1, 1,
0.363026, -1.964186, 1.832481, 0, 0.09803922, 1, 1,
0.3656351, 0.7720439, 1.539526, 0, 0.09411765, 1, 1,
0.3681529, 0.2382592, 2.192693, 0, 0.08627451, 1, 1,
0.3687242, 0.1110676, 3.142705, 0, 0.08235294, 1, 1,
0.3720721, 0.5805734, 0.2222117, 0, 0.07450981, 1, 1,
0.3729621, -0.5314619, 2.215851, 0, 0.07058824, 1, 1,
0.3736184, 0.4726191, -0.5553148, 0, 0.0627451, 1, 1,
0.3770338, 0.5569191, 1.846317, 0, 0.05882353, 1, 1,
0.37871, 0.08310258, 2.170723, 0, 0.05098039, 1, 1,
0.3803737, -1.234447, 3.779802, 0, 0.04705882, 1, 1,
0.3834047, 0.8203432, 0.8156598, 0, 0.03921569, 1, 1,
0.3841002, -0.2981946, 0.7933236, 0, 0.03529412, 1, 1,
0.3873901, 0.02694361, 0.008389454, 0, 0.02745098, 1, 1,
0.3887238, 1.162631, -0.4762917, 0, 0.02352941, 1, 1,
0.3891569, -0.8810707, 1.993035, 0, 0.01568628, 1, 1,
0.3894652, -0.2140542, 4.052003, 0, 0.01176471, 1, 1,
0.3901742, 0.3383526, 0.5950817, 0, 0.003921569, 1, 1,
0.390991, -0.6424332, 2.04829, 0.003921569, 0, 1, 1,
0.3914542, 0.1808323, 0.6190662, 0.007843138, 0, 1, 1,
0.3929509, -1.07588, 2.942075, 0.01568628, 0, 1, 1,
0.4009422, -0.3809672, 0.6169276, 0.01960784, 0, 1, 1,
0.415335, 0.3169421, 0.1010232, 0.02745098, 0, 1, 1,
0.4155389, -0.5501168, 1.702341, 0.03137255, 0, 1, 1,
0.4156868, -0.9359837, 3.525999, 0.03921569, 0, 1, 1,
0.4191238, 1.224961, -1.154444, 0.04313726, 0, 1, 1,
0.4202632, 0.1271851, 2.620537, 0.05098039, 0, 1, 1,
0.4213731, 1.378956, 0.229718, 0.05490196, 0, 1, 1,
0.4225451, -0.902493, 0.5090181, 0.0627451, 0, 1, 1,
0.4244527, -1.483972, 5.068412, 0.06666667, 0, 1, 1,
0.428272, -1.354854, 1.545657, 0.07450981, 0, 1, 1,
0.4322939, 0.5253346, -0.6982811, 0.07843138, 0, 1, 1,
0.4395286, 0.1117971, 1.269449, 0.08627451, 0, 1, 1,
0.4424367, 0.3002514, -1.015103, 0.09019608, 0, 1, 1,
0.4437889, -0.8108783, 2.72159, 0.09803922, 0, 1, 1,
0.4458478, 0.519843, 0.5453328, 0.1058824, 0, 1, 1,
0.4468768, 1.027144, 1.939958, 0.1098039, 0, 1, 1,
0.4469151, -1.265151, 2.270911, 0.1176471, 0, 1, 1,
0.4524493, -0.6271085, 3.523501, 0.1215686, 0, 1, 1,
0.4532384, -1.012587, 2.962121, 0.1294118, 0, 1, 1,
0.461607, -1.995269, 5.265635, 0.1333333, 0, 1, 1,
0.463055, -0.1402484, 1.654622, 0.1411765, 0, 1, 1,
0.464178, 0.60088, 0.7490548, 0.145098, 0, 1, 1,
0.4667946, -1.73413, 2.72448, 0.1529412, 0, 1, 1,
0.4680581, -1.777217, 3.005881, 0.1568628, 0, 1, 1,
0.4724402, -0.8382385, 3.190882, 0.1647059, 0, 1, 1,
0.4744239, -0.002949625, 2.10808, 0.1686275, 0, 1, 1,
0.4852015, -1.403022, 2.233471, 0.1764706, 0, 1, 1,
0.4883403, 0.1395984, 0.2297805, 0.1803922, 0, 1, 1,
0.4889185, 0.08179951, 2.101709, 0.1882353, 0, 1, 1,
0.495186, 1.325551, -2.02706, 0.1921569, 0, 1, 1,
0.496229, 0.5929778, 0.8237767, 0.2, 0, 1, 1,
0.4983406, -0.5030589, 2.111037, 0.2078431, 0, 1, 1,
0.5009556, 0.5076394, -0.1592168, 0.2117647, 0, 1, 1,
0.5015449, 2.373191, -0.2758238, 0.2196078, 0, 1, 1,
0.5084527, 0.8067244, -0.007070761, 0.2235294, 0, 1, 1,
0.5100638, -1.009537, 3.99367, 0.2313726, 0, 1, 1,
0.5131412, 1.894397, 1.06825, 0.2352941, 0, 1, 1,
0.5167722, -0.7486783, 4.241889, 0.2431373, 0, 1, 1,
0.5204079, 1.790553, -0.492824, 0.2470588, 0, 1, 1,
0.5230505, -0.114516, 2.374462, 0.254902, 0, 1, 1,
0.5237511, 0.3499719, -0.03812559, 0.2588235, 0, 1, 1,
0.525347, 0.7361298, -0.7490361, 0.2666667, 0, 1, 1,
0.5320989, 0.6624901, -0.8579273, 0.2705882, 0, 1, 1,
0.5343876, -0.1223513, 2.259568, 0.2784314, 0, 1, 1,
0.5404613, 1.435516, 0.8682683, 0.282353, 0, 1, 1,
0.5443609, 0.4726856, 0.9547637, 0.2901961, 0, 1, 1,
0.5463073, 0.1481994, 1.06381, 0.2941177, 0, 1, 1,
0.5467379, -0.6937839, 3.59794, 0.3019608, 0, 1, 1,
0.5487445, 0.833516, 1.090396, 0.3098039, 0, 1, 1,
0.5552815, 1.254021, 0.08683301, 0.3137255, 0, 1, 1,
0.5561528, 0.1451276, 0.3051463, 0.3215686, 0, 1, 1,
0.5561745, 0.7012537, -0.3273852, 0.3254902, 0, 1, 1,
0.5589294, -0.5008528, 1.528745, 0.3333333, 0, 1, 1,
0.5596455, 0.3267975, -0.8292053, 0.3372549, 0, 1, 1,
0.5628001, -0.3238564, 2.315128, 0.345098, 0, 1, 1,
0.562916, -0.2333705, 3.272421, 0.3490196, 0, 1, 1,
0.5737034, 0.05764095, 3.061123, 0.3568628, 0, 1, 1,
0.5749136, -0.06270824, 0.7948839, 0.3607843, 0, 1, 1,
0.5759363, 0.5128597, 1.150363, 0.3686275, 0, 1, 1,
0.5774113, 0.7418137, 0.9704919, 0.372549, 0, 1, 1,
0.5836931, -0.7149153, 2.167027, 0.3803922, 0, 1, 1,
0.5841441, -0.7181651, 1.783611, 0.3843137, 0, 1, 1,
0.5850983, -0.01978606, 0.7361075, 0.3921569, 0, 1, 1,
0.5854051, 1.605415, 2.515883, 0.3960784, 0, 1, 1,
0.5909634, 0.2519021, 0.7842437, 0.4039216, 0, 1, 1,
0.5919414, -1.154533, 3.165678, 0.4117647, 0, 1, 1,
0.5992243, -0.1308706, -0.377659, 0.4156863, 0, 1, 1,
0.6057163, -0.04851867, 1.01921, 0.4235294, 0, 1, 1,
0.6128798, -1.285501, 2.555351, 0.427451, 0, 1, 1,
0.6175948, -0.649193, 2.694454, 0.4352941, 0, 1, 1,
0.6190038, -0.3660426, 0.7758893, 0.4392157, 0, 1, 1,
0.6234963, 0.2443133, 0.6424038, 0.4470588, 0, 1, 1,
0.6251628, -0.3683976, 2.063634, 0.4509804, 0, 1, 1,
0.6252744, 0.134852, 1.331007, 0.4588235, 0, 1, 1,
0.6330681, 1.213975, -1.699829, 0.4627451, 0, 1, 1,
0.639658, 0.06742799, 2.737805, 0.4705882, 0, 1, 1,
0.6466984, 0.1208827, 0.8485433, 0.4745098, 0, 1, 1,
0.6477378, -0.7746338, 2.647505, 0.4823529, 0, 1, 1,
0.6487944, 0.215025, 0.8537766, 0.4862745, 0, 1, 1,
0.6499964, 0.5109137, 1.075989, 0.4941176, 0, 1, 1,
0.6530913, 0.0780677, 1.985574, 0.5019608, 0, 1, 1,
0.6562818, -0.6099738, 1.8709, 0.5058824, 0, 1, 1,
0.6569833, -0.5094064, 3.75737, 0.5137255, 0, 1, 1,
0.658836, 2.880875, 0.3261961, 0.5176471, 0, 1, 1,
0.6601019, 0.0642502, 1.297369, 0.5254902, 0, 1, 1,
0.6798624, 0.8160592, 0.2713715, 0.5294118, 0, 1, 1,
0.6831567, -0.9022453, 0.7258599, 0.5372549, 0, 1, 1,
0.6856914, -0.05306828, 0.4561542, 0.5411765, 0, 1, 1,
0.6887896, 0.3928076, 0.4516407, 0.5490196, 0, 1, 1,
0.6961058, -0.8650041, 1.80326, 0.5529412, 0, 1, 1,
0.7007261, 0.337481, 1.430902, 0.5607843, 0, 1, 1,
0.7035491, -0.5543265, 3.67245, 0.5647059, 0, 1, 1,
0.7042896, 0.1152755, 0.542002, 0.572549, 0, 1, 1,
0.7064499, -0.3086579, 2.035071, 0.5764706, 0, 1, 1,
0.7216477, 1.888402, -1.421974, 0.5843138, 0, 1, 1,
0.7217466, -0.8555194, 2.77737, 0.5882353, 0, 1, 1,
0.7248218, 0.1745418, 1.11265, 0.5960785, 0, 1, 1,
0.7289245, -0.1554188, 3.005301, 0.6039216, 0, 1, 1,
0.729366, -0.1959267, 0.8239583, 0.6078432, 0, 1, 1,
0.7532547, -0.338032, 2.140581, 0.6156863, 0, 1, 1,
0.7562108, -0.2658005, 0.02338601, 0.6196079, 0, 1, 1,
0.7575378, 0.2669814, 2.528601, 0.627451, 0, 1, 1,
0.7579953, 0.5881064, 1.243105, 0.6313726, 0, 1, 1,
0.7601544, -1.217091, 1.718434, 0.6392157, 0, 1, 1,
0.7606269, -0.000372659, 1.95973, 0.6431373, 0, 1, 1,
0.7650923, 0.6938591, 0.3732916, 0.6509804, 0, 1, 1,
0.7662217, -0.7195968, 2.83339, 0.654902, 0, 1, 1,
0.7673709, 0.3142082, 1.577094, 0.6627451, 0, 1, 1,
0.7719021, 2.232509, -0.280275, 0.6666667, 0, 1, 1,
0.7740014, -0.3818379, 1.863976, 0.6745098, 0, 1, 1,
0.7744063, -0.8606732, 2.686895, 0.6784314, 0, 1, 1,
0.7783142, -1.206911, 2.528849, 0.6862745, 0, 1, 1,
0.7839221, -0.6058882, 1.625541, 0.6901961, 0, 1, 1,
0.7841086, 1.009022, 1.177504, 0.6980392, 0, 1, 1,
0.8001548, 0.5982002, 1.062764, 0.7058824, 0, 1, 1,
0.8094347, 0.4041719, -0.2951574, 0.7098039, 0, 1, 1,
0.8111751, 1.520897, 0.7576691, 0.7176471, 0, 1, 1,
0.815132, 0.1009354, 1.184814, 0.7215686, 0, 1, 1,
0.8194508, -0.6934238, 1.503121, 0.7294118, 0, 1, 1,
0.8212983, 0.007067696, 2.576983, 0.7333333, 0, 1, 1,
0.8241717, -0.1460661, 1.431764, 0.7411765, 0, 1, 1,
0.8250687, -1.193581, 2.299944, 0.7450981, 0, 1, 1,
0.8342, -1.504944, 2.702546, 0.7529412, 0, 1, 1,
0.8366665, 0.4439099, 1.166886, 0.7568628, 0, 1, 1,
0.8368101, -0.4674256, 2.213085, 0.7647059, 0, 1, 1,
0.8445634, 0.156403, 0.5257661, 0.7686275, 0, 1, 1,
0.8486234, -1.059937, 2.582878, 0.7764706, 0, 1, 1,
0.8510345, 0.5820042, 1.593734, 0.7803922, 0, 1, 1,
0.8511035, 0.4959809, 1.381457, 0.7882353, 0, 1, 1,
0.8512774, -1.031611, 2.316834, 0.7921569, 0, 1, 1,
0.8520017, -0.5558994, 3.65451, 0.8, 0, 1, 1,
0.8522219, -1.341516, 2.001985, 0.8078431, 0, 1, 1,
0.8547205, -0.1549475, 1.610128, 0.8117647, 0, 1, 1,
0.8547214, 0.4592272, 0.5975481, 0.8196079, 0, 1, 1,
0.8551604, -0.4928977, 0.6700973, 0.8235294, 0, 1, 1,
0.8558304, 0.4668365, 0.738983, 0.8313726, 0, 1, 1,
0.8572587, -0.5714153, 0.8919244, 0.8352941, 0, 1, 1,
0.86072, 0.001776449, 3.465027, 0.8431373, 0, 1, 1,
0.8634028, 0.1595281, 0.9812799, 0.8470588, 0, 1, 1,
0.8694149, 1.160726, 0.9765176, 0.854902, 0, 1, 1,
0.872689, -0.3019986, 1.222076, 0.8588235, 0, 1, 1,
0.8750176, 0.06511717, 1.522746, 0.8666667, 0, 1, 1,
0.8758536, -0.3778774, -0.5230803, 0.8705882, 0, 1, 1,
0.881961, -1.008845, 3.750155, 0.8784314, 0, 1, 1,
0.8855954, -0.5496918, 4.115533, 0.8823529, 0, 1, 1,
0.8919009, 1.022528, 1.189822, 0.8901961, 0, 1, 1,
0.9009678, -0.4523696, 2.424575, 0.8941177, 0, 1, 1,
0.9044764, -2.510011, 2.510298, 0.9019608, 0, 1, 1,
0.914489, 1.140702, 1.11236, 0.9098039, 0, 1, 1,
0.9147526, 0.05753621, 0.3440137, 0.9137255, 0, 1, 1,
0.9197885, 0.7498184, 1.002675, 0.9215686, 0, 1, 1,
0.9222215, 0.6569457, 0.8271096, 0.9254902, 0, 1, 1,
0.9307198, -0.9810033, 3.511331, 0.9333333, 0, 1, 1,
0.9326589, -1.060925, 3.114304, 0.9372549, 0, 1, 1,
0.937589, -1.131813, 3.354379, 0.945098, 0, 1, 1,
0.9470383, -1.125322, 1.039118, 0.9490196, 0, 1, 1,
0.9471876, 1.290576, 2.15562, 0.9568627, 0, 1, 1,
0.9572921, -0.6529098, 1.199474, 0.9607843, 0, 1, 1,
0.9586616, -0.9945962, 2.014411, 0.9686275, 0, 1, 1,
0.974543, 0.7872218, -0.02822088, 0.972549, 0, 1, 1,
0.9772476, 1.344746, 2.486189, 0.9803922, 0, 1, 1,
0.9792174, 0.5125341, 0.6331656, 0.9843137, 0, 1, 1,
0.9843348, -0.7696196, 4.198866, 0.9921569, 0, 1, 1,
0.9852795, 1.364554, -0.007643234, 0.9960784, 0, 1, 1,
0.9877334, 0.1400377, 2.192942, 1, 0, 0.9960784, 1,
0.9890816, 0.6557463, 1.482798, 1, 0, 0.9882353, 1,
0.9899886, 1.048724, 0.3150691, 1, 0, 0.9843137, 1,
0.9941937, 0.9487836, -0.602435, 1, 0, 0.9764706, 1,
0.9944932, 1.163829, -0.06599768, 1, 0, 0.972549, 1,
0.9985842, 1.401402, 1.206776, 1, 0, 0.9647059, 1,
1.000975, 1.795107, 0.1275835, 1, 0, 0.9607843, 1,
1.002161, 1.68028, 1.047247, 1, 0, 0.9529412, 1,
1.009247, 0.06804326, 1.319392, 1, 0, 0.9490196, 1,
1.009359, 0.3237091, 0.9866264, 1, 0, 0.9411765, 1,
1.010481, -1.237032, 1.291877, 1, 0, 0.9372549, 1,
1.018945, 0.7601449, 2.060946, 1, 0, 0.9294118, 1,
1.0192, 0.3648604, 0.8899367, 1, 0, 0.9254902, 1,
1.023342, 0.2435512, 0.1305939, 1, 0, 0.9176471, 1,
1.037304, -1.156189, 3.143427, 1, 0, 0.9137255, 1,
1.039163, 0.03830262, 0.7319384, 1, 0, 0.9058824, 1,
1.040922, 1.04664, 0.9055704, 1, 0, 0.9019608, 1,
1.043283, 0.01961946, 2.808425, 1, 0, 0.8941177, 1,
1.043478, -0.5977666, 1.253603, 1, 0, 0.8862745, 1,
1.046103, -0.5085518, 1.805929, 1, 0, 0.8823529, 1,
1.046737, 1.171775, -0.4571293, 1, 0, 0.8745098, 1,
1.046807, 1.501947, 0.9394313, 1, 0, 0.8705882, 1,
1.05559, -0.1141536, 0.01972643, 1, 0, 0.8627451, 1,
1.056973, 0.2965168, 1.988264, 1, 0, 0.8588235, 1,
1.058891, 0.4862114, 2.525366, 1, 0, 0.8509804, 1,
1.060562, -0.004805466, 1.153257, 1, 0, 0.8470588, 1,
1.060997, 0.9837035, -1.023037, 1, 0, 0.8392157, 1,
1.062858, -1.315178, 1.18574, 1, 0, 0.8352941, 1,
1.064377, 0.159141, 1.883478, 1, 0, 0.827451, 1,
1.074166, -1.100381, 4.058484, 1, 0, 0.8235294, 1,
1.074725, 0.8731283, 0.1333106, 1, 0, 0.8156863, 1,
1.083671, 0.4865553, -0.1185361, 1, 0, 0.8117647, 1,
1.092394, -0.17274, 2.076938, 1, 0, 0.8039216, 1,
1.093286, -0.09289041, 1.529169, 1, 0, 0.7960784, 1,
1.094151, 1.468324, 0.722041, 1, 0, 0.7921569, 1,
1.09506, 0.3523872, -0.9922216, 1, 0, 0.7843137, 1,
1.095857, 0.5484764, -0.591136, 1, 0, 0.7803922, 1,
1.105966, 0.8783953, 1.372413, 1, 0, 0.772549, 1,
1.106186, -0.6386868, 1.531236, 1, 0, 0.7686275, 1,
1.108762, -2.202274, 3.619879, 1, 0, 0.7607843, 1,
1.111477, -1.066769, 0.2333677, 1, 0, 0.7568628, 1,
1.116339, 2.16125, 0.7116657, 1, 0, 0.7490196, 1,
1.116657, -1.767463, 2.492414, 1, 0, 0.7450981, 1,
1.119564, -0.950437, 1.949989, 1, 0, 0.7372549, 1,
1.120271, -1.526041, 2.861809, 1, 0, 0.7333333, 1,
1.1228, 0.6436141, 1.244555, 1, 0, 0.7254902, 1,
1.134344, -1.767579, 3.516562, 1, 0, 0.7215686, 1,
1.134661, -0.4281262, 1.193175, 1, 0, 0.7137255, 1,
1.143516, 1.319083, 1.148912, 1, 0, 0.7098039, 1,
1.144162, 0.09824889, 2.751263, 1, 0, 0.7019608, 1,
1.147975, 0.872727, -0.4537381, 1, 0, 0.6941177, 1,
1.150981, -0.5312489, 2.404924, 1, 0, 0.6901961, 1,
1.159751, -0.6030876, 0.5280674, 1, 0, 0.682353, 1,
1.164331, 1.281092, 3.395892, 1, 0, 0.6784314, 1,
1.168162, -0.9668313, 3.019035, 1, 0, 0.6705883, 1,
1.170235, -1.389633, 1.699449, 1, 0, 0.6666667, 1,
1.172257, 1.580844, 0.2614159, 1, 0, 0.6588235, 1,
1.193106, -0.1808724, 2.143831, 1, 0, 0.654902, 1,
1.196149, 0.01175655, 1.036211, 1, 0, 0.6470588, 1,
1.200945, 2.33299, 0.9978623, 1, 0, 0.6431373, 1,
1.203344, -1.838278, 2.264606, 1, 0, 0.6352941, 1,
1.208572, 0.4994112, 2.399955, 1, 0, 0.6313726, 1,
1.21439, 0.567579, 1.742519, 1, 0, 0.6235294, 1,
1.214982, 0.3328755, 0.02667438, 1, 0, 0.6196079, 1,
1.218765, 2.004724, 1.817358, 1, 0, 0.6117647, 1,
1.245306, -0.2051913, 0.6554973, 1, 0, 0.6078432, 1,
1.249364, 0.7431976, 0.8749228, 1, 0, 0.6, 1,
1.251626, -0.7865819, 3.393025, 1, 0, 0.5921569, 1,
1.251785, 0.3245578, 1.011998, 1, 0, 0.5882353, 1,
1.266806, 1.727677, 1.687385, 1, 0, 0.5803922, 1,
1.283397, -0.7139649, 1.100238, 1, 0, 0.5764706, 1,
1.285181, 0.5914996, -0.3305902, 1, 0, 0.5686275, 1,
1.293651, -0.5533388, 0.9794438, 1, 0, 0.5647059, 1,
1.295372, 0.472419, 0.9309416, 1, 0, 0.5568628, 1,
1.303094, -0.527233, 0.7933606, 1, 0, 0.5529412, 1,
1.313018, -0.6358536, 1.530206, 1, 0, 0.5450981, 1,
1.320041, -0.3790536, 1.01839, 1, 0, 0.5411765, 1,
1.32491, 0.3852707, 0.8243092, 1, 0, 0.5333334, 1,
1.326296, 0.6051816, 1.477437, 1, 0, 0.5294118, 1,
1.335824, -0.1451, 2.36236, 1, 0, 0.5215687, 1,
1.339664, -1.584454, 4.250772, 1, 0, 0.5176471, 1,
1.354978, 0.8699, 0.8546883, 1, 0, 0.509804, 1,
1.358016, -2.349142, 1.133726, 1, 0, 0.5058824, 1,
1.361463, 3.973257, 1.550147, 1, 0, 0.4980392, 1,
1.367443, 0.02298654, 0.2016087, 1, 0, 0.4901961, 1,
1.373872, -0.3810167, 2.447664, 1, 0, 0.4862745, 1,
1.374112, 2.423779, -0.5787719, 1, 0, 0.4784314, 1,
1.374894, 1.835734, -0.8966278, 1, 0, 0.4745098, 1,
1.38568, -0.685728, 1.025656, 1, 0, 0.4666667, 1,
1.385725, 0.2171331, 1.998427, 1, 0, 0.4627451, 1,
1.397181, 1.658601, 0.4180039, 1, 0, 0.454902, 1,
1.412081, -1.507183, 1.494011, 1, 0, 0.4509804, 1,
1.412162, -1.192604, 4.313737, 1, 0, 0.4431373, 1,
1.422772, 0.8134784, 0.7829717, 1, 0, 0.4392157, 1,
1.429791, -0.5758121, 2.558754, 1, 0, 0.4313726, 1,
1.437936, 0.2977558, 0.935082, 1, 0, 0.427451, 1,
1.44021, 0.8749245, 2.388358, 1, 0, 0.4196078, 1,
1.445568, -0.9617986, 1.719074, 1, 0, 0.4156863, 1,
1.449068, -0.02795799, 2.1849, 1, 0, 0.4078431, 1,
1.464021, 1.779811, 0.4060332, 1, 0, 0.4039216, 1,
1.466522, -0.146868, 1.900298, 1, 0, 0.3960784, 1,
1.491368, -1.045961, 2.463042, 1, 0, 0.3882353, 1,
1.500546, 0.7007256, 0.3006734, 1, 0, 0.3843137, 1,
1.507426, -0.3928293, 1.062989, 1, 0, 0.3764706, 1,
1.510367, 0.3345719, 0.4399593, 1, 0, 0.372549, 1,
1.511168, 1.220587, 0.9412014, 1, 0, 0.3647059, 1,
1.526366, -0.8014309, 3.344127, 1, 0, 0.3607843, 1,
1.547371, -0.1570405, 3.37131, 1, 0, 0.3529412, 1,
1.566492, -0.7840621, 3.1616, 1, 0, 0.3490196, 1,
1.579459, -0.352671, 0.4240314, 1, 0, 0.3411765, 1,
1.581716, 0.09880621, 0.07000143, 1, 0, 0.3372549, 1,
1.591211, -0.2356401, 0.7627147, 1, 0, 0.3294118, 1,
1.606966, -0.5591738, 2.609707, 1, 0, 0.3254902, 1,
1.634732, -0.4139712, 2.806398, 1, 0, 0.3176471, 1,
1.635694, 0.2391755, -0.4869013, 1, 0, 0.3137255, 1,
1.642036, -0.7234013, 1.307554, 1, 0, 0.3058824, 1,
1.642532, -0.7799817, 1.835416, 1, 0, 0.2980392, 1,
1.645211, -0.1669165, -0.05610519, 1, 0, 0.2941177, 1,
1.656252, -0.3183147, 0.9300022, 1, 0, 0.2862745, 1,
1.675575, -0.313361, 0.7691919, 1, 0, 0.282353, 1,
1.677999, -0.2081546, 0.3738844, 1, 0, 0.2745098, 1,
1.684004, -0.1984949, 2.217865, 1, 0, 0.2705882, 1,
1.707239, -2.867334, 1.054692, 1, 0, 0.2627451, 1,
1.71642, -0.7510432, 2.000653, 1, 0, 0.2588235, 1,
1.723716, 0.9061158, 0.5326585, 1, 0, 0.2509804, 1,
1.728198, 0.9083014, -0.004215186, 1, 0, 0.2470588, 1,
1.735447, -0.03011137, 2.890701, 1, 0, 0.2392157, 1,
1.769637, 2.284392, 0.6907672, 1, 0, 0.2352941, 1,
1.773171, 1.47994, 0.6757672, 1, 0, 0.227451, 1,
1.776786, -0.6319396, 3.620907, 1, 0, 0.2235294, 1,
1.792213, 0.256254, 1.563107, 1, 0, 0.2156863, 1,
1.803928, 0.7745627, 1.221481, 1, 0, 0.2117647, 1,
1.805387, 0.02458261, 0.9497744, 1, 0, 0.2039216, 1,
1.824849, -1.048326, 0.6938465, 1, 0, 0.1960784, 1,
1.825418, 1.190772, 1.001501, 1, 0, 0.1921569, 1,
1.851056, 0.4324337, 1.600831, 1, 0, 0.1843137, 1,
1.880828, 0.2643742, -0.2499367, 1, 0, 0.1803922, 1,
1.883663, -1.431083, 3.030703, 1, 0, 0.172549, 1,
1.892411, -1.055931, 2.475936, 1, 0, 0.1686275, 1,
1.903912, -0.3164454, 2.62971, 1, 0, 0.1607843, 1,
1.923955, -0.1652008, 0.64412, 1, 0, 0.1568628, 1,
1.963735, 1.0738, 2.142014, 1, 0, 0.1490196, 1,
1.972335, -0.2630824, 2.309664, 1, 0, 0.145098, 1,
1.974972, -0.09829049, 1.964586, 1, 0, 0.1372549, 1,
1.984068, 0.5024294, -0.740697, 1, 0, 0.1333333, 1,
2.003682, 0.03540387, 1.650098, 1, 0, 0.1254902, 1,
2.008157, -0.6284683, 2.73125, 1, 0, 0.1215686, 1,
2.022556, 1.36177, -0.1549129, 1, 0, 0.1137255, 1,
2.056451, -0.8449702, 1.676488, 1, 0, 0.1098039, 1,
2.057741, 0.7775723, 2.02006, 1, 0, 0.1019608, 1,
2.059454, 0.7000827, 1.033216, 1, 0, 0.09411765, 1,
2.077617, 0.2646977, 0.3881267, 1, 0, 0.09019608, 1,
2.108655, 3.109713, -0.469294, 1, 0, 0.08235294, 1,
2.155453, -0.2001312, 1.073983, 1, 0, 0.07843138, 1,
2.20713, 1.018203, 1.180769, 1, 0, 0.07058824, 1,
2.316561, -0.7242923, 1.236192, 1, 0, 0.06666667, 1,
2.368721, 0.3710362, 0.8615911, 1, 0, 0.05882353, 1,
2.387198, 1.018879, 1.216393, 1, 0, 0.05490196, 1,
2.482489, 0.3167597, 1.958846, 1, 0, 0.04705882, 1,
2.854367, 1.605426, 1.683776, 1, 0, 0.04313726, 1,
2.928497, 0.6284691, 1.325223, 1, 0, 0.03529412, 1,
2.957583, 0.5754327, 2.595964, 1, 0, 0.03137255, 1,
2.97854, 1.003824, 1.125284, 1, 0, 0.02352941, 1,
3.166737, 0.2421711, -0.1905205, 1, 0, 0.01960784, 1,
3.169097, -0.1715326, 2.893486, 1, 0, 0.01176471, 1,
3.284899, -0.3449229, 1.815718, 1, 0, 0.007843138, 1
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
-0.02652001, -4.026814, -8.151102, 0, -0.5, 0.5, 0.5,
-0.02652001, -4.026814, -8.151102, 1, -0.5, 0.5, 0.5,
-0.02652001, -4.026814, -8.151102, 1, 1.5, 0.5, 0.5,
-0.02652001, -4.026814, -8.151102, 0, 1.5, 0.5, 0.5
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
-4.46051, 0.5529612, -8.151102, 0, -0.5, 0.5, 0.5,
-4.46051, 0.5529612, -8.151102, 1, -0.5, 0.5, 0.5,
-4.46051, 0.5529612, -8.151102, 1, 1.5, 0.5, 0.5,
-4.46051, 0.5529612, -8.151102, 0, 1.5, 0.5, 0.5
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
-4.46051, -4.026814, -0.4301322, 0, -0.5, 0.5, 0.5,
-4.46051, -4.026814, -0.4301322, 1, -0.5, 0.5, 0.5,
-4.46051, -4.026814, -0.4301322, 1, 1.5, 0.5, 0.5,
-4.46051, -4.026814, -0.4301322, 0, 1.5, 0.5, 0.5
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
-3, -2.969943, -6.369339,
3, -2.969943, -6.369339,
-3, -2.969943, -6.369339,
-3, -3.146088, -6.6663,
-2, -2.969943, -6.369339,
-2, -3.146088, -6.6663,
-1, -2.969943, -6.369339,
-1, -3.146088, -6.6663,
0, -2.969943, -6.369339,
0, -3.146088, -6.6663,
1, -2.969943, -6.369339,
1, -3.146088, -6.6663,
2, -2.969943, -6.369339,
2, -3.146088, -6.6663,
3, -2.969943, -6.369339,
3, -3.146088, -6.6663
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
-3, -3.498379, -7.260221, 0, -0.5, 0.5, 0.5,
-3, -3.498379, -7.260221, 1, -0.5, 0.5, 0.5,
-3, -3.498379, -7.260221, 1, 1.5, 0.5, 0.5,
-3, -3.498379, -7.260221, 0, 1.5, 0.5, 0.5,
-2, -3.498379, -7.260221, 0, -0.5, 0.5, 0.5,
-2, -3.498379, -7.260221, 1, -0.5, 0.5, 0.5,
-2, -3.498379, -7.260221, 1, 1.5, 0.5, 0.5,
-2, -3.498379, -7.260221, 0, 1.5, 0.5, 0.5,
-1, -3.498379, -7.260221, 0, -0.5, 0.5, 0.5,
-1, -3.498379, -7.260221, 1, -0.5, 0.5, 0.5,
-1, -3.498379, -7.260221, 1, 1.5, 0.5, 0.5,
-1, -3.498379, -7.260221, 0, 1.5, 0.5, 0.5,
0, -3.498379, -7.260221, 0, -0.5, 0.5, 0.5,
0, -3.498379, -7.260221, 1, -0.5, 0.5, 0.5,
0, -3.498379, -7.260221, 1, 1.5, 0.5, 0.5,
0, -3.498379, -7.260221, 0, 1.5, 0.5, 0.5,
1, -3.498379, -7.260221, 0, -0.5, 0.5, 0.5,
1, -3.498379, -7.260221, 1, -0.5, 0.5, 0.5,
1, -3.498379, -7.260221, 1, 1.5, 0.5, 0.5,
1, -3.498379, -7.260221, 0, 1.5, 0.5, 0.5,
2, -3.498379, -7.260221, 0, -0.5, 0.5, 0.5,
2, -3.498379, -7.260221, 1, -0.5, 0.5, 0.5,
2, -3.498379, -7.260221, 1, 1.5, 0.5, 0.5,
2, -3.498379, -7.260221, 0, 1.5, 0.5, 0.5,
3, -3.498379, -7.260221, 0, -0.5, 0.5, 0.5,
3, -3.498379, -7.260221, 1, -0.5, 0.5, 0.5,
3, -3.498379, -7.260221, 1, 1.5, 0.5, 0.5,
3, -3.498379, -7.260221, 0, 1.5, 0.5, 0.5
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
-3.437282, -2, -6.369339,
-3.437282, 3, -6.369339,
-3.437282, -2, -6.369339,
-3.60782, -2, -6.6663,
-3.437282, -1, -6.369339,
-3.60782, -1, -6.6663,
-3.437282, 0, -6.369339,
-3.60782, 0, -6.6663,
-3.437282, 1, -6.369339,
-3.60782, 1, -6.6663,
-3.437282, 2, -6.369339,
-3.60782, 2, -6.6663,
-3.437282, 3, -6.369339,
-3.60782, 3, -6.6663
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
-3.948896, -2, -7.260221, 0, -0.5, 0.5, 0.5,
-3.948896, -2, -7.260221, 1, -0.5, 0.5, 0.5,
-3.948896, -2, -7.260221, 1, 1.5, 0.5, 0.5,
-3.948896, -2, -7.260221, 0, 1.5, 0.5, 0.5,
-3.948896, -1, -7.260221, 0, -0.5, 0.5, 0.5,
-3.948896, -1, -7.260221, 1, -0.5, 0.5, 0.5,
-3.948896, -1, -7.260221, 1, 1.5, 0.5, 0.5,
-3.948896, -1, -7.260221, 0, 1.5, 0.5, 0.5,
-3.948896, 0, -7.260221, 0, -0.5, 0.5, 0.5,
-3.948896, 0, -7.260221, 1, -0.5, 0.5, 0.5,
-3.948896, 0, -7.260221, 1, 1.5, 0.5, 0.5,
-3.948896, 0, -7.260221, 0, 1.5, 0.5, 0.5,
-3.948896, 1, -7.260221, 0, -0.5, 0.5, 0.5,
-3.948896, 1, -7.260221, 1, -0.5, 0.5, 0.5,
-3.948896, 1, -7.260221, 1, 1.5, 0.5, 0.5,
-3.948896, 1, -7.260221, 0, 1.5, 0.5, 0.5,
-3.948896, 2, -7.260221, 0, -0.5, 0.5, 0.5,
-3.948896, 2, -7.260221, 1, -0.5, 0.5, 0.5,
-3.948896, 2, -7.260221, 1, 1.5, 0.5, 0.5,
-3.948896, 2, -7.260221, 0, 1.5, 0.5, 0.5,
-3.948896, 3, -7.260221, 0, -0.5, 0.5, 0.5,
-3.948896, 3, -7.260221, 1, -0.5, 0.5, 0.5,
-3.948896, 3, -7.260221, 1, 1.5, 0.5, 0.5,
-3.948896, 3, -7.260221, 0, 1.5, 0.5, 0.5
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
-3.437282, -2.969943, -6,
-3.437282, -2.969943, 4,
-3.437282, -2.969943, -6,
-3.60782, -3.146088, -6,
-3.437282, -2.969943, -4,
-3.60782, -3.146088, -4,
-3.437282, -2.969943, -2,
-3.60782, -3.146088, -2,
-3.437282, -2.969943, 0,
-3.60782, -3.146088, 0,
-3.437282, -2.969943, 2,
-3.60782, -3.146088, 2,
-3.437282, -2.969943, 4,
-3.60782, -3.146088, 4
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
"-6",
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
-3.948896, -3.498379, -6, 0, -0.5, 0.5, 0.5,
-3.948896, -3.498379, -6, 1, -0.5, 0.5, 0.5,
-3.948896, -3.498379, -6, 1, 1.5, 0.5, 0.5,
-3.948896, -3.498379, -6, 0, 1.5, 0.5, 0.5,
-3.948896, -3.498379, -4, 0, -0.5, 0.5, 0.5,
-3.948896, -3.498379, -4, 1, -0.5, 0.5, 0.5,
-3.948896, -3.498379, -4, 1, 1.5, 0.5, 0.5,
-3.948896, -3.498379, -4, 0, 1.5, 0.5, 0.5,
-3.948896, -3.498379, -2, 0, -0.5, 0.5, 0.5,
-3.948896, -3.498379, -2, 1, -0.5, 0.5, 0.5,
-3.948896, -3.498379, -2, 1, 1.5, 0.5, 0.5,
-3.948896, -3.498379, -2, 0, 1.5, 0.5, 0.5,
-3.948896, -3.498379, 0, 0, -0.5, 0.5, 0.5,
-3.948896, -3.498379, 0, 1, -0.5, 0.5, 0.5,
-3.948896, -3.498379, 0, 1, 1.5, 0.5, 0.5,
-3.948896, -3.498379, 0, 0, 1.5, 0.5, 0.5,
-3.948896, -3.498379, 2, 0, -0.5, 0.5, 0.5,
-3.948896, -3.498379, 2, 1, -0.5, 0.5, 0.5,
-3.948896, -3.498379, 2, 1, 1.5, 0.5, 0.5,
-3.948896, -3.498379, 2, 0, 1.5, 0.5, 0.5,
-3.948896, -3.498379, 4, 0, -0.5, 0.5, 0.5,
-3.948896, -3.498379, 4, 1, -0.5, 0.5, 0.5,
-3.948896, -3.498379, 4, 1, 1.5, 0.5, 0.5,
-3.948896, -3.498379, 4, 0, 1.5, 0.5, 0.5
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
-3.437282, -2.969943, -6.369339,
-3.437282, 4.075866, -6.369339,
-3.437282, -2.969943, 5.509075,
-3.437282, 4.075866, 5.509075,
-3.437282, -2.969943, -6.369339,
-3.437282, -2.969943, 5.509075,
-3.437282, 4.075866, -6.369339,
-3.437282, 4.075866, 5.509075,
-3.437282, -2.969943, -6.369339,
3.384242, -2.969943, -6.369339,
-3.437282, -2.969943, 5.509075,
3.384242, -2.969943, 5.509075,
-3.437282, 4.075866, -6.369339,
3.384242, 4.075866, -6.369339,
-3.437282, 4.075866, 5.509075,
3.384242, 4.075866, 5.509075,
3.384242, -2.969943, -6.369339,
3.384242, 4.075866, -6.369339,
3.384242, -2.969943, 5.509075,
3.384242, 4.075866, 5.509075,
3.384242, -2.969943, -6.369339,
3.384242, -2.969943, 5.509075,
3.384242, 4.075866, -6.369339,
3.384242, 4.075866, 5.509075
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
var radius = 8.225266;
var distance = 36.59514;
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
mvMatrix.translate( 0.02652001, -0.5529612, 0.4301322 );
mvMatrix.scale( 1.303715, 1.262214, 0.7486957 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.59514);
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
cinnamylidenehydrazo<-read.table("cinnamylidenehydrazo.xyz")
```

```
## Error in read.table("cinnamylidenehydrazo.xyz"): no lines available in input
```

```r
x<-cinnamylidenehydrazo$V2
```

```
## Error in eval(expr, envir, enclos): object 'cinnamylidenehydrazo' not found
```

```r
y<-cinnamylidenehydrazo$V3
```

```
## Error in eval(expr, envir, enclos): object 'cinnamylidenehydrazo' not found
```

```r
z<-cinnamylidenehydrazo$V4
```

```
## Error in eval(expr, envir, enclos): object 'cinnamylidenehydrazo' not found
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
-3.337939, -0.9451007, -1.210775, 0, 0, 1, 1, 1,
-2.715775, 1.08013, -3.559571, 1, 0, 0, 1, 1,
-2.56648, 0.6618162, -0.09034619, 1, 0, 0, 1, 1,
-2.53015, -0.4405588, -1.464649, 1, 0, 0, 1, 1,
-2.515214, -0.7058344, -3.34902, 1, 0, 0, 1, 1,
-2.325257, -0.7749865, -1.693981, 1, 0, 0, 1, 1,
-2.303838, 1.780614, -0.7365544, 0, 0, 0, 1, 1,
-2.2662, -0.8413974, -2.171078, 0, 0, 0, 1, 1,
-2.259152, 0.09339058, -1.153863, 0, 0, 0, 1, 1,
-2.24281, 2.363433, 0.2512072, 0, 0, 0, 1, 1,
-2.167942, 1.403705, -0.3593069, 0, 0, 0, 1, 1,
-2.09183, -0.3398254, -2.548206, 0, 0, 0, 1, 1,
-2.082665, -1.351082, 0.07362062, 0, 0, 0, 1, 1,
-2.040909, 0.3115934, -1.667142, 1, 1, 1, 1, 1,
-2.02575, -0.7023553, -0.3960002, 1, 1, 1, 1, 1,
-1.99915, 2.514823, -1.301131, 1, 1, 1, 1, 1,
-1.975358, -1.819775, -2.701126, 1, 1, 1, 1, 1,
-1.966184, 1.05016, 0.5984691, 1, 1, 1, 1, 1,
-1.963431, -0.2775278, -0.1629947, 1, 1, 1, 1, 1,
-1.950652, -0.342297, -1.950262, 1, 1, 1, 1, 1,
-1.948666, -0.9045678, -2.831012, 1, 1, 1, 1, 1,
-1.947944, 0.1569672, -1.809546, 1, 1, 1, 1, 1,
-1.913298, -1.20738, -1.473721, 1, 1, 1, 1, 1,
-1.910903, -1.113049, 0.3959871, 1, 1, 1, 1, 1,
-1.897857, 0.209471, -1.280699, 1, 1, 1, 1, 1,
-1.895221, 0.5632094, -2.887281, 1, 1, 1, 1, 1,
-1.886377, -2.080634, -1.880807, 1, 1, 1, 1, 1,
-1.861787, 0.8908122, -1.87592, 1, 1, 1, 1, 1,
-1.849446, -0.3325641, -1.213565, 0, 0, 1, 1, 1,
-1.843147, -0.8721544, -1.387856, 1, 0, 0, 1, 1,
-1.829785, 0.5474022, -0.8060973, 1, 0, 0, 1, 1,
-1.827195, 0.8313769, -1.410018, 1, 0, 0, 1, 1,
-1.790835, 0.7457147, -0.962442, 1, 0, 0, 1, 1,
-1.777827, -0.2545988, -3.412765, 1, 0, 0, 1, 1,
-1.756414, -0.008833272, -2.279807, 0, 0, 0, 1, 1,
-1.752468, -0.02360666, -2.138932, 0, 0, 0, 1, 1,
-1.746558, -0.8907459, -2.524992, 0, 0, 0, 1, 1,
-1.738437, -1.921019, -4.060901, 0, 0, 0, 1, 1,
-1.737394, -0.3786078, -2.553148, 0, 0, 0, 1, 1,
-1.73672, 0.2410285, -3.245942, 0, 0, 0, 1, 1,
-1.7222, -0.7512087, -1.558514, 0, 0, 0, 1, 1,
-1.676996, 1.74489, -2.415098, 1, 1, 1, 1, 1,
-1.675152, 0.6070789, -2.535234, 1, 1, 1, 1, 1,
-1.674275, 2.28354, -0.7045649, 1, 1, 1, 1, 1,
-1.66914, 1.263449, -1.892727, 1, 1, 1, 1, 1,
-1.666879, -1.273645, -2.175706, 1, 1, 1, 1, 1,
-1.666236, -0.1427931, -4.055772, 1, 1, 1, 1, 1,
-1.655674, -0.9739286, -1.604383, 1, 1, 1, 1, 1,
-1.645911, 0.205914, -1.93028, 1, 1, 1, 1, 1,
-1.64418, 0.9068284, -1.376013, 1, 1, 1, 1, 1,
-1.639952, 2.601154, -0.1671282, 1, 1, 1, 1, 1,
-1.637722, 0.4338415, -1.918276, 1, 1, 1, 1, 1,
-1.625736, -0.1598754, -1.438894, 1, 1, 1, 1, 1,
-1.613167, -0.3115946, -1.147103, 1, 1, 1, 1, 1,
-1.597263, -0.1060641, -1.949283, 1, 1, 1, 1, 1,
-1.588806, -0.0009773353, -1.541567, 1, 1, 1, 1, 1,
-1.587769, 0.2374638, 0.2399009, 0, 0, 1, 1, 1,
-1.584565, -2.123288, -1.61602, 1, 0, 0, 1, 1,
-1.531057, 1.731001, -1.766581, 1, 0, 0, 1, 1,
-1.52062, 0.566193, 1.415507, 1, 0, 0, 1, 1,
-1.515833, -0.6900356, -2.919586, 1, 0, 0, 1, 1,
-1.497181, 2.054854, 0.000811548, 1, 0, 0, 1, 1,
-1.478548, -0.2959922, -2.802502, 0, 0, 0, 1, 1,
-1.476655, -0.192566, -0.8097075, 0, 0, 0, 1, 1,
-1.473862, 0.7077527, -0.3160869, 0, 0, 0, 1, 1,
-1.470589, 1.465454, -0.7705697, 0, 0, 0, 1, 1,
-1.463841, -0.6374848, -2.022662, 0, 0, 0, 1, 1,
-1.453839, -0.579202, -0.4690241, 0, 0, 0, 1, 1,
-1.451858, -0.7152358, -2.203469, 0, 0, 0, 1, 1,
-1.431693, -1.115682, -1.147734, 1, 1, 1, 1, 1,
-1.429991, 0.4533715, -0.3656671, 1, 1, 1, 1, 1,
-1.429833, -2.152027, -3.248792, 1, 1, 1, 1, 1,
-1.416452, 1.266537, -0.9405248, 1, 1, 1, 1, 1,
-1.406883, 0.3917581, -0.7581147, 1, 1, 1, 1, 1,
-1.393762, 0.6071773, -1.565615, 1, 1, 1, 1, 1,
-1.393655, 0.005815027, -2.379304, 1, 1, 1, 1, 1,
-1.390102, -1.993061, -2.249823, 1, 1, 1, 1, 1,
-1.387881, -0.757964, 0.3269033, 1, 1, 1, 1, 1,
-1.387021, 0.09953539, -2.242959, 1, 1, 1, 1, 1,
-1.385377, -0.9923626, -2.628015, 1, 1, 1, 1, 1,
-1.383799, 1.177233, 0.5967488, 1, 1, 1, 1, 1,
-1.374428, -0.9910415, -3.423434, 1, 1, 1, 1, 1,
-1.368364, -1.383623, -2.885055, 1, 1, 1, 1, 1,
-1.365749, 0.8935735, 0.5232201, 1, 1, 1, 1, 1,
-1.347188, -0.04445274, 0.2272569, 0, 0, 1, 1, 1,
-1.346759, 0.752206, -0.3537259, 1, 0, 0, 1, 1,
-1.336653, -0.9151253, -4.115621, 1, 0, 0, 1, 1,
-1.335404, -0.7402155, -3.066492, 1, 0, 0, 1, 1,
-1.332849, 2.395267, -1.002883, 1, 0, 0, 1, 1,
-1.32096, 1.030555, -1.618462, 1, 0, 0, 1, 1,
-1.320329, 0.4242356, -2.416633, 0, 0, 0, 1, 1,
-1.318283, 0.1781589, -0.1670169, 0, 0, 0, 1, 1,
-1.311946, -0.3915339, -3.928849, 0, 0, 0, 1, 1,
-1.310137, -0.4518731, -0.975767, 0, 0, 0, 1, 1,
-1.302473, -2.136792, -2.641564, 0, 0, 0, 1, 1,
-1.289335, 1.095664, -1.714531, 0, 0, 0, 1, 1,
-1.288262, -1.513163, -3.85422, 0, 0, 0, 1, 1,
-1.287833, 0.3900134, -1.990284, 1, 1, 1, 1, 1,
-1.279672, 0.1428739, -1.838468, 1, 1, 1, 1, 1,
-1.2775, 0.6981848, -0.3175924, 1, 1, 1, 1, 1,
-1.275836, 1.933908, -0.7081009, 1, 1, 1, 1, 1,
-1.272797, 0.8566894, -1.278932, 1, 1, 1, 1, 1,
-1.26869, -0.9735479, -2.827783, 1, 1, 1, 1, 1,
-1.258849, 0.05343946, -2.19606, 1, 1, 1, 1, 1,
-1.256267, -0.2243737, -0.9052497, 1, 1, 1, 1, 1,
-1.246912, 0.9095625, -1.557271, 1, 1, 1, 1, 1,
-1.242767, -2.20533, -3.182146, 1, 1, 1, 1, 1,
-1.23841, 0.2900234, -1.142351, 1, 1, 1, 1, 1,
-1.234824, 0.8176832, -2.32036, 1, 1, 1, 1, 1,
-1.233635, -0.8173115, -0.8838748, 1, 1, 1, 1, 1,
-1.227963, -0.1917055, 0.64545, 1, 1, 1, 1, 1,
-1.220667, -1.025871, -1.770271, 1, 1, 1, 1, 1,
-1.215388, 1.198575, -0.420522, 0, 0, 1, 1, 1,
-1.21515, -0.3324822, -2.394982, 1, 0, 0, 1, 1,
-1.205998, -1.822514, -1.198363, 1, 0, 0, 1, 1,
-1.205631, 0.4434516, -1.982245, 1, 0, 0, 1, 1,
-1.204494, -0.2553516, -4.142111, 1, 0, 0, 1, 1,
-1.197841, 1.581189, -0.6715348, 1, 0, 0, 1, 1,
-1.196989, -0.4564043, -0.5074927, 0, 0, 0, 1, 1,
-1.196544, 0.5618191, -0.780023, 0, 0, 0, 1, 1,
-1.192826, -0.6026042, -2.511291, 0, 0, 0, 1, 1,
-1.179614, 1.868636, -0.9254262, 0, 0, 0, 1, 1,
-1.178104, -0.9634077, -2.261082, 0, 0, 0, 1, 1,
-1.17082, 0.3356375, -0.3626021, 0, 0, 0, 1, 1,
-1.1688, 0.809863, -1.549089, 0, 0, 0, 1, 1,
-1.16697, -1.553152, -3.677778, 1, 1, 1, 1, 1,
-1.161928, 0.5522503, -2.098494, 1, 1, 1, 1, 1,
-1.159742, 0.03636548, -0.6511319, 1, 1, 1, 1, 1,
-1.157099, 2.362221, 0.5778219, 1, 1, 1, 1, 1,
-1.15273, 1.375116, -1.305371, 1, 1, 1, 1, 1,
-1.151395, -0.1569577, 0.3330545, 1, 1, 1, 1, 1,
-1.149407, 0.2653632, -1.07108, 1, 1, 1, 1, 1,
-1.148842, 0.148798, -2.394683, 1, 1, 1, 1, 1,
-1.14711, 0.6585369, -0.7827107, 1, 1, 1, 1, 1,
-1.144299, -1.453797, -3.084819, 1, 1, 1, 1, 1,
-1.143418, -0.08529319, -0.2915445, 1, 1, 1, 1, 1,
-1.122965, -0.4220571, -1.701055, 1, 1, 1, 1, 1,
-1.122944, -1.413547, -3.010946, 1, 1, 1, 1, 1,
-1.122353, 0.5178508, -1.572285, 1, 1, 1, 1, 1,
-1.100424, 0.7345471, 0.2085191, 1, 1, 1, 1, 1,
-1.099946, -1.96139, -1.398531, 0, 0, 1, 1, 1,
-1.098869, 0.9650053, -0.2394525, 1, 0, 0, 1, 1,
-1.095705, -0.1875039, -1.465245, 1, 0, 0, 1, 1,
-1.089403, 0.1110631, -0.8479776, 1, 0, 0, 1, 1,
-1.087383, -0.9954405, -0.8488707, 1, 0, 0, 1, 1,
-1.084418, -0.5861636, -2.216707, 1, 0, 0, 1, 1,
-1.079109, -0.03601135, -2.093891, 0, 0, 0, 1, 1,
-1.078211, -2.373598, -1.49912, 0, 0, 0, 1, 1,
-1.074512, 0.9950553, -1.142582, 0, 0, 0, 1, 1,
-1.072752, 1.176712, -0.2074226, 0, 0, 0, 1, 1,
-1.068641, 0.6505952, -1.119297, 0, 0, 0, 1, 1,
-1.065946, -0.1639532, -1.165958, 0, 0, 0, 1, 1,
-1.064977, -1.83251, -2.173458, 0, 0, 0, 1, 1,
-1.064623, 0.001018484, -2.082255, 1, 1, 1, 1, 1,
-1.056925, 2.286253, -0.4249117, 1, 1, 1, 1, 1,
-1.050199, -1.27112, -3.491855, 1, 1, 1, 1, 1,
-1.044397, -0.1420687, -1.126371, 1, 1, 1, 1, 1,
-1.044282, -1.61208, 0.4577231, 1, 1, 1, 1, 1,
-1.034777, -1.277834, -2.858647, 1, 1, 1, 1, 1,
-1.033116, -1.581542, -1.525792, 1, 1, 1, 1, 1,
-1.019954, 0.7558744, -1.088314, 1, 1, 1, 1, 1,
-1.016691, -0.784758, -1.755989, 1, 1, 1, 1, 1,
-1.015796, -1.152351, -2.480654, 1, 1, 1, 1, 1,
-1.014213, -0.4612154, -1.035436, 1, 1, 1, 1, 1,
-1.012452, -0.4134161, -0.9032777, 1, 1, 1, 1, 1,
-1.010176, -0.7938089, -1.618979, 1, 1, 1, 1, 1,
-1.009606, 0.627308, -1.066086, 1, 1, 1, 1, 1,
-1.005152, 1.090083, -0.3359127, 1, 1, 1, 1, 1,
-1.004967, -2.449909, -2.429115, 0, 0, 1, 1, 1,
-0.9999306, -0.6582682, -1.146107, 1, 0, 0, 1, 1,
-0.99928, 1.268088, -2.215826, 1, 0, 0, 1, 1,
-0.9950723, -0.4424968, -0.239733, 1, 0, 0, 1, 1,
-0.9910146, 0.4288103, -1.900235, 1, 0, 0, 1, 1,
-0.9817083, 0.1212826, -0.2867947, 1, 0, 0, 1, 1,
-0.9716125, 0.6129045, -1.138264, 0, 0, 0, 1, 1,
-0.971165, -0.8958654, -1.964804, 0, 0, 0, 1, 1,
-0.9703301, -0.9712759, -3.4137, 0, 0, 0, 1, 1,
-0.9668324, -0.2908988, -1.401254, 0, 0, 0, 1, 1,
-0.9573881, 0.2103314, -1.780703, 0, 0, 0, 1, 1,
-0.9560513, 0.5348777, -2.398886, 0, 0, 0, 1, 1,
-0.9480879, -0.1265863, -1.427912, 0, 0, 0, 1, 1,
-0.9480684, 0.5268491, 0.3608863, 1, 1, 1, 1, 1,
-0.9444833, -0.2070983, -1.813181, 1, 1, 1, 1, 1,
-0.9427325, -0.4015736, -2.358445, 1, 1, 1, 1, 1,
-0.9403069, -0.2831804, -2.887849, 1, 1, 1, 1, 1,
-0.9396454, 0.3638768, -1.973691, 1, 1, 1, 1, 1,
-0.9313416, -0.7843087, -2.994427, 1, 1, 1, 1, 1,
-0.9288116, 0.7054261, 1.020739, 1, 1, 1, 1, 1,
-0.9273393, -1.112578, -3.287676, 1, 1, 1, 1, 1,
-0.9247524, -1.154448, -3.424362, 1, 1, 1, 1, 1,
-0.9244441, 1.431429, 0.2018117, 1, 1, 1, 1, 1,
-0.9223098, -1.259228, -2.38964, 1, 1, 1, 1, 1,
-0.9208213, -0.1367652, -1.628468, 1, 1, 1, 1, 1,
-0.9166079, 0.4445904, 0.534928, 1, 1, 1, 1, 1,
-0.9127666, 1.500966, 0.1274046, 1, 1, 1, 1, 1,
-0.9081233, 1.489973, -1.231937, 1, 1, 1, 1, 1,
-0.907783, 0.008797651, -0.7510647, 0, 0, 1, 1, 1,
-0.9008502, -0.827841, -2.697706, 1, 0, 0, 1, 1,
-0.900385, -0.6828665, -1.265538, 1, 0, 0, 1, 1,
-0.8958084, 0.08533297, 0.9196954, 1, 0, 0, 1, 1,
-0.8942308, 1.679109, 0.5294657, 1, 0, 0, 1, 1,
-0.8938468, 0.9318908, -0.3831302, 1, 0, 0, 1, 1,
-0.8908715, -0.6044085, -1.17199, 0, 0, 0, 1, 1,
-0.8900434, -1.13654, -2.913164, 0, 0, 0, 1, 1,
-0.8872303, 0.7022495, -0.2870395, 0, 0, 0, 1, 1,
-0.8856151, 0.8796664, -2.450929, 0, 0, 0, 1, 1,
-0.8847558, -0.6753075, -2.918046, 0, 0, 0, 1, 1,
-0.8842829, -0.1137503, -1.559752, 0, 0, 0, 1, 1,
-0.8793064, -1.569319, -1.017743, 0, 0, 0, 1, 1,
-0.8789205, -0.08147506, -0.4712184, 1, 1, 1, 1, 1,
-0.8663418, 1.216687, 0.2779427, 1, 1, 1, 1, 1,
-0.865631, 0.4182323, -1.498437, 1, 1, 1, 1, 1,
-0.8644884, 1.033143, 0.4437389, 1, 1, 1, 1, 1,
-0.8584218, -0.08667671, -2.479919, 1, 1, 1, 1, 1,
-0.8557048, -1.065835, -2.174345, 1, 1, 1, 1, 1,
-0.8476118, 1.655857, 0.3958226, 1, 1, 1, 1, 1,
-0.8456424, -1.39836, -3.888556, 1, 1, 1, 1, 1,
-0.8385692, 0.949501, -2.438138, 1, 1, 1, 1, 1,
-0.8309196, -0.4778719, -2.223764, 1, 1, 1, 1, 1,
-0.8261562, 1.451649, 0.3232318, 1, 1, 1, 1, 1,
-0.8229602, -0.3394603, -1.427662, 1, 1, 1, 1, 1,
-0.8177251, 1.456237, -0.6271936, 1, 1, 1, 1, 1,
-0.8145269, 1.205655, -0.3388546, 1, 1, 1, 1, 1,
-0.8109121, 0.3129271, -2.308868, 1, 1, 1, 1, 1,
-0.8098176, -0.3433824, -0.7193025, 0, 0, 1, 1, 1,
-0.7998754, -0.8811137, -2.192947, 1, 0, 0, 1, 1,
-0.7980007, -0.5762861, -0.866459, 1, 0, 0, 1, 1,
-0.7978973, 0.7098583, -2.40196, 1, 0, 0, 1, 1,
-0.7976573, 1.260611, -1.095568, 1, 0, 0, 1, 1,
-0.7866251, -1.624823, -1.658186, 1, 0, 0, 1, 1,
-0.781772, -0.8765319, -2.610085, 0, 0, 0, 1, 1,
-0.776273, -0.3775533, -0.4352346, 0, 0, 0, 1, 1,
-0.7745701, -2.142389, -4.877134, 0, 0, 0, 1, 1,
-0.7728008, 0.3737449, -1.167174, 0, 0, 0, 1, 1,
-0.7707956, 1.00438, -0.8769732, 0, 0, 0, 1, 1,
-0.7640164, -0.3650636, -1.937197, 0, 0, 0, 1, 1,
-0.7579438, -0.911954, -2.300272, 0, 0, 0, 1, 1,
-0.7526298, -1.509315, -1.867395, 1, 1, 1, 1, 1,
-0.750246, -2.738271, -1.119945, 1, 1, 1, 1, 1,
-0.7500779, 1.167009, -1.013338, 1, 1, 1, 1, 1,
-0.7440233, -0.6844765, -2.13145, 1, 1, 1, 1, 1,
-0.7327566, 0.6732833, -1.228404, 1, 1, 1, 1, 1,
-0.7300986, -2.237876, -3.362629, 1, 1, 1, 1, 1,
-0.7250811, -0.4934057, -2.568867, 1, 1, 1, 1, 1,
-0.7241317, 1.257124, -0.08253133, 1, 1, 1, 1, 1,
-0.7181033, 0.498168, -1.122374, 1, 1, 1, 1, 1,
-0.7166383, -0.3906483, -1.245312, 1, 1, 1, 1, 1,
-0.7117983, -0.02308003, -1.61435, 1, 1, 1, 1, 1,
-0.7027295, -0.1895693, 0.2357064, 1, 1, 1, 1, 1,
-0.7014919, -0.2374081, -2.357341, 1, 1, 1, 1, 1,
-0.7002737, -1.770985, -5.265821, 1, 1, 1, 1, 1,
-0.6773556, 1.477003, 0.3685597, 1, 1, 1, 1, 1,
-0.6764197, -0.06342998, 0.07828017, 0, 0, 1, 1, 1,
-0.6732906, 0.5520311, 1.601992, 1, 0, 0, 1, 1,
-0.672002, 0.6878589, -0.4548882, 1, 0, 0, 1, 1,
-0.6675044, 0.7785583, -0.07417402, 1, 0, 0, 1, 1,
-0.6660658, -1.590033, -4.109456, 1, 0, 0, 1, 1,
-0.6649184, 0.990284, 0.7072408, 1, 0, 0, 1, 1,
-0.6631536, 0.509862, 0.9266644, 0, 0, 0, 1, 1,
-0.6621045, 0.8608651, -0.3621374, 0, 0, 0, 1, 1,
-0.6620303, 1.015848, -0.3708194, 0, 0, 0, 1, 1,
-0.6604525, -1.655996, -1.858662, 0, 0, 0, 1, 1,
-0.6597824, -0.3314191, -0.6911345, 0, 0, 0, 1, 1,
-0.6588225, -1.500144, -1.451588, 0, 0, 0, 1, 1,
-0.6555956, 1.772591, -0.5152214, 0, 0, 0, 1, 1,
-0.6550867, 1.217955, 0.2750838, 1, 1, 1, 1, 1,
-0.65456, -0.1036448, -2.662819, 1, 1, 1, 1, 1,
-0.6520607, -0.6309804, -1.0715, 1, 1, 1, 1, 1,
-0.6501902, -0.2758444, -2.206596, 1, 1, 1, 1, 1,
-0.6438748, 1.12466, 0.06751415, 1, 1, 1, 1, 1,
-0.643356, -0.4701203, -1.746462, 1, 1, 1, 1, 1,
-0.6431545, 0.2202618, -2.027129, 1, 1, 1, 1, 1,
-0.6429133, 0.8711007, -2.235393, 1, 1, 1, 1, 1,
-0.6419986, -0.5402222, -0.5858152, 1, 1, 1, 1, 1,
-0.6389113, 2.809468, -0.8305331, 1, 1, 1, 1, 1,
-0.6261911, -1.183996, -2.380911, 1, 1, 1, 1, 1,
-0.6241547, -0.8089116, -2.541124, 1, 1, 1, 1, 1,
-0.6234004, 0.4090277, -0.6007836, 1, 1, 1, 1, 1,
-0.6230346, -0.08942742, -1.734617, 1, 1, 1, 1, 1,
-0.6207834, -0.7214032, -0.6834306, 1, 1, 1, 1, 1,
-0.6205481, 0.7654274, -1.190071, 0, 0, 1, 1, 1,
-0.6131261, 0.2091398, -2.157204, 1, 0, 0, 1, 1,
-0.6126564, -1.348645, -1.481441, 1, 0, 0, 1, 1,
-0.6087921, 0.6080984, -1.702564, 1, 0, 0, 1, 1,
-0.6067281, -0.9014587, -3.846152, 1, 0, 0, 1, 1,
-0.6031981, 0.04866213, -1.928297, 1, 0, 0, 1, 1,
-0.6003699, -1.651368, -2.118765, 0, 0, 0, 1, 1,
-0.5947409, -1.807565, -3.208927, 0, 0, 0, 1, 1,
-0.5777721, 0.7074652, -1.271656, 0, 0, 0, 1, 1,
-0.5718399, -0.2678561, -3.205446, 0, 0, 0, 1, 1,
-0.5670662, -0.9221796, -1.016396, 0, 0, 0, 1, 1,
-0.5612707, 0.140522, -1.879731, 0, 0, 0, 1, 1,
-0.5583693, 0.7902728, -0.4162639, 0, 0, 0, 1, 1,
-0.5546448, -0.4210935, -1.987108, 1, 1, 1, 1, 1,
-0.5475504, 0.4942481, -0.3950911, 1, 1, 1, 1, 1,
-0.5426885, 0.6424659, -1.910808, 1, 1, 1, 1, 1,
-0.5417171, -0.176055, -2.053644, 1, 1, 1, 1, 1,
-0.5410155, -1.985149, -2.339583, 1, 1, 1, 1, 1,
-0.5293564, 1.873007, 0.5238301, 1, 1, 1, 1, 1,
-0.5282776, 0.7763009, -2.156024, 1, 1, 1, 1, 1,
-0.5269892, 0.796211, -0.3102914, 1, 1, 1, 1, 1,
-0.5208622, 0.9151, -0.9838939, 1, 1, 1, 1, 1,
-0.5178801, -0.0617679, -3.269903, 1, 1, 1, 1, 1,
-0.5167568, -1.781279, -2.925037, 1, 1, 1, 1, 1,
-0.5152824, -0.9487471, -1.264465, 1, 1, 1, 1, 1,
-0.5143256, 0.6181951, -0.2285596, 1, 1, 1, 1, 1,
-0.5076115, 0.3366415, -0.9803308, 1, 1, 1, 1, 1,
-0.5046771, 0.3332954, 0.5443242, 1, 1, 1, 1, 1,
-0.5039308, 0.1997359, -0.6582787, 0, 0, 1, 1, 1,
-0.5020135, -1.894674, -1.87277, 1, 0, 0, 1, 1,
-0.4972198, 0.4772024, 0.5830287, 1, 0, 0, 1, 1,
-0.496726, -0.4367286, -1.675756, 1, 0, 0, 1, 1,
-0.4916878, 0.08674801, -1.946995, 1, 0, 0, 1, 1,
-0.4869776, 0.317511, -1.804673, 1, 0, 0, 1, 1,
-0.4854984, -0.08891064, -1.378352, 0, 0, 0, 1, 1,
-0.4820424, 1.129957, -0.8325421, 0, 0, 0, 1, 1,
-0.4805406, 1.510011, -0.5734691, 0, 0, 0, 1, 1,
-0.4800622, 0.1573249, -2.644179, 0, 0, 0, 1, 1,
-0.478268, -0.8077925, -2.852425, 0, 0, 0, 1, 1,
-0.4780544, -0.2576789, -1.318912, 0, 0, 0, 1, 1,
-0.4726511, 0.7998874, -1.231349, 0, 0, 0, 1, 1,
-0.4715538, 1.055286, 0.06613851, 1, 1, 1, 1, 1,
-0.4710411, -0.9239094, -2.041616, 1, 1, 1, 1, 1,
-0.4703118, 0.1899814, -1.861455, 1, 1, 1, 1, 1,
-0.4604996, 2.815873, 0.8868595, 1, 1, 1, 1, 1,
-0.4536659, -0.5958136, -3.036824, 1, 1, 1, 1, 1,
-0.4527277, -0.1754598, -0.6337202, 1, 1, 1, 1, 1,
-0.4498632, -0.7561314, -1.993731, 1, 1, 1, 1, 1,
-0.4495062, 2.091096, -0.2508317, 1, 1, 1, 1, 1,
-0.4483816, 0.4368617, 0.001222298, 1, 1, 1, 1, 1,
-0.4384447, -1.512037, -2.400282, 1, 1, 1, 1, 1,
-0.4360984, 1.456936, -1.538356, 1, 1, 1, 1, 1,
-0.4328479, -0.3353446, -0.8911916, 1, 1, 1, 1, 1,
-0.4308043, 0.3786263, -0.5197313, 1, 1, 1, 1, 1,
-0.4306986, -0.4924712, -1.613786, 1, 1, 1, 1, 1,
-0.4301078, -2.237974, -3.129697, 1, 1, 1, 1, 1,
-0.4216819, 0.598592, -0.6250188, 0, 0, 1, 1, 1,
-0.4210203, -0.3887025, -2.626438, 1, 0, 0, 1, 1,
-0.4194321, 1.611135, 0.8376033, 1, 0, 0, 1, 1,
-0.4190672, -1.050851, -3.416846, 1, 0, 0, 1, 1,
-0.4166209, 0.1428017, -1.581575, 1, 0, 0, 1, 1,
-0.4164982, 0.8267815, 1.376475, 1, 0, 0, 1, 1,
-0.4164013, 0.2664896, -0.7158516, 0, 0, 0, 1, 1,
-0.416095, 1.468298, 0.2854798, 0, 0, 0, 1, 1,
-0.4113091, 0.02685556, -1.13932, 0, 0, 0, 1, 1,
-0.4088037, -1.049335, -1.754147, 0, 0, 0, 1, 1,
-0.4037354, -0.4682221, -1.353544, 0, 0, 0, 1, 1,
-0.3961062, 0.8123708, 0.4867715, 0, 0, 0, 1, 1,
-0.3957813, -0.1523057, -1.867851, 0, 0, 0, 1, 1,
-0.3933912, -0.9770712, -2.965858, 1, 1, 1, 1, 1,
-0.3928321, 0.3494378, -0.06147479, 1, 1, 1, 1, 1,
-0.389211, 0.5966812, -0.7984393, 1, 1, 1, 1, 1,
-0.386845, 1.159177, -0.5899311, 1, 1, 1, 1, 1,
-0.3854544, -0.5319949, -2.21954, 1, 1, 1, 1, 1,
-0.3847598, -2.65934, -1.526011, 1, 1, 1, 1, 1,
-0.3838505, 0.05255606, -0.3038134, 1, 1, 1, 1, 1,
-0.382509, 0.8607059, -0.801483, 1, 1, 1, 1, 1,
-0.3822412, 0.1476324, -2.097165, 1, 1, 1, 1, 1,
-0.3796214, -1.302145, -1.889966, 1, 1, 1, 1, 1,
-0.3796046, 0.5434001, -0.9067277, 1, 1, 1, 1, 1,
-0.3794296, 0.1769981, 0.2288332, 1, 1, 1, 1, 1,
-0.3782942, 2.615775, -0.5333554, 1, 1, 1, 1, 1,
-0.3764588, -0.8971797, -3.633885, 1, 1, 1, 1, 1,
-0.3758377, -0.8596601, -2.401906, 1, 1, 1, 1, 1,
-0.3746579, -1.121495, -2.579646, 0, 0, 1, 1, 1,
-0.3738203, -1.39959, -4.206156, 1, 0, 0, 1, 1,
-0.3667746, 0.5464886, -0.4730532, 1, 0, 0, 1, 1,
-0.3620302, 1.490732, -0.5567243, 1, 0, 0, 1, 1,
-0.3580244, -0.777514, -2.400518, 1, 0, 0, 1, 1,
-0.3562472, 2.840622, -0.4486498, 1, 0, 0, 1, 1,
-0.3438083, -1.73505, -3.400865, 0, 0, 0, 1, 1,
-0.3436143, 0.487541, -1.902095, 0, 0, 0, 1, 1,
-0.3435947, 0.7928082, 0.04531082, 0, 0, 0, 1, 1,
-0.3409565, 0.4614727, -1.126312, 0, 0, 0, 1, 1,
-0.3347102, -0.5447201, -2.438017, 0, 0, 0, 1, 1,
-0.3271335, 0.3105539, -0.00733337, 0, 0, 0, 1, 1,
-0.3222057, -0.1309533, -0.2384989, 0, 0, 0, 1, 1,
-0.3202659, -0.3585761, -2.940622, 1, 1, 1, 1, 1,
-0.3171773, 0.7246736, 0.3958113, 1, 1, 1, 1, 1,
-0.3171646, 0.3613551, 0.9235951, 1, 1, 1, 1, 1,
-0.316431, 0.5284361, -1.851062, 1, 1, 1, 1, 1,
-0.3131976, -0.01308532, -4.463536, 1, 1, 1, 1, 1,
-0.3096972, -0.3888826, -0.5611479, 1, 1, 1, 1, 1,
-0.3049183, -0.8780527, -2.915243, 1, 1, 1, 1, 1,
-0.3041731, -1.153152, -2.1598, 1, 1, 1, 1, 1,
-0.3041019, -0.9834461, -2.766199, 1, 1, 1, 1, 1,
-0.3035879, -2.307111, -3.276775, 1, 1, 1, 1, 1,
-0.3001623, 0.2355623, -0.9716065, 1, 1, 1, 1, 1,
-0.2973286, 2.171796, -0.8570004, 1, 1, 1, 1, 1,
-0.295258, -0.0319715, -1.173014, 1, 1, 1, 1, 1,
-0.2949545, -0.8218435, -3.947444, 1, 1, 1, 1, 1,
-0.2919202, 0.1552932, -1.79987, 1, 1, 1, 1, 1,
-0.2915952, 0.3607874, -0.7705086, 0, 0, 1, 1, 1,
-0.290091, -0.5608935, -3.416697, 1, 0, 0, 1, 1,
-0.2878755, -0.1546063, -2.539301, 1, 0, 0, 1, 1,
-0.2863785, -0.6002719, -3.76852, 1, 0, 0, 1, 1,
-0.2826815, 0.07534427, -1.799119, 1, 0, 0, 1, 1,
-0.2791853, -0.4348027, -1.03499, 1, 0, 0, 1, 1,
-0.2790367, -0.7292864, -1.629733, 0, 0, 0, 1, 1,
-0.2780653, 1.431344, 0.2086432, 0, 0, 0, 1, 1,
-0.2743741, -0.1024714, -2.580698, 0, 0, 0, 1, 1,
-0.2716691, -1.565467, -2.939944, 0, 0, 0, 1, 1,
-0.2699767, 1.275388, -0.244619, 0, 0, 0, 1, 1,
-0.2614222, -1.627674, -2.690528, 0, 0, 0, 1, 1,
-0.2601744, 0.8327521, -0.4719612, 0, 0, 0, 1, 1,
-0.2586929, 0.2452293, 0.4311871, 1, 1, 1, 1, 1,
-0.2551036, -1.517643, -4.666304, 1, 1, 1, 1, 1,
-0.2550636, -1.433463, -3.936102, 1, 1, 1, 1, 1,
-0.254007, 0.5556677, -1.360134, 1, 1, 1, 1, 1,
-0.251038, 0.5100794, 0.3671536, 1, 1, 1, 1, 1,
-0.246046, 0.2376682, 0.4104482, 1, 1, 1, 1, 1,
-0.2352906, 0.0356451, -0.5690455, 1, 1, 1, 1, 1,
-0.2279697, -0.5452573, -3.731357, 1, 1, 1, 1, 1,
-0.2263007, -1.211673, -3.159433, 1, 1, 1, 1, 1,
-0.225399, 0.06293037, -0.4134815, 1, 1, 1, 1, 1,
-0.2240977, 0.4256936, -0.1473153, 1, 1, 1, 1, 1,
-0.2196911, 1.255198, -1.10001, 1, 1, 1, 1, 1,
-0.2134036, -0.05185376, -1.555873, 1, 1, 1, 1, 1,
-0.2111722, -0.8648576, -2.735966, 1, 1, 1, 1, 1,
-0.2106976, 0.7918378, -0.003955378, 1, 1, 1, 1, 1,
-0.210352, 0.7155178, -0.6816198, 0, 0, 1, 1, 1,
-0.2052573, -0.8150013, -4.435436, 1, 0, 0, 1, 1,
-0.2011922, -0.3105719, -0.365201, 1, 0, 0, 1, 1,
-0.1977743, 0.9008704, 0.4778947, 1, 0, 0, 1, 1,
-0.1973244, 0.8526583, -0.8566061, 1, 0, 0, 1, 1,
-0.1928322, 1.574213, -0.5696012, 1, 0, 0, 1, 1,
-0.1882215, 0.4222573, -0.358921, 0, 0, 0, 1, 1,
-0.1865268, 0.2789139, -1.83151, 0, 0, 0, 1, 1,
-0.1857471, -0.8051074, -2.709077, 0, 0, 0, 1, 1,
-0.1833509, 0.6667848, -1.150268, 0, 0, 0, 1, 1,
-0.1814605, -0.127387, -2.389748, 0, 0, 0, 1, 1,
-0.181154, -0.6735595, -1.362315, 0, 0, 0, 1, 1,
-0.1789386, 0.2735699, 0.6766034, 0, 0, 0, 1, 1,
-0.1744842, 0.04967522, -0.6610335, 1, 1, 1, 1, 1,
-0.1736613, -0.9640869, -2.49226, 1, 1, 1, 1, 1,
-0.1729392, 0.04340082, -2.34745, 1, 1, 1, 1, 1,
-0.1710032, -1.659888, -3.243051, 1, 1, 1, 1, 1,
-0.1673943, 0.9855297, -0.9319451, 1, 1, 1, 1, 1,
-0.1655517, 0.6739197, -0.5360813, 1, 1, 1, 1, 1,
-0.1653654, 1.073465, 1.000551, 1, 1, 1, 1, 1,
-0.1586526, 0.342566, -1.164209, 1, 1, 1, 1, 1,
-0.1533929, 0.5602637, -0.370709, 1, 1, 1, 1, 1,
-0.1526844, 0.06008922, -0.955493, 1, 1, 1, 1, 1,
-0.1494486, -1.372374, -3.280429, 1, 1, 1, 1, 1,
-0.1481703, -1.355507, -2.405742, 1, 1, 1, 1, 1,
-0.1444947, 1.190866, 0.9701861, 1, 1, 1, 1, 1,
-0.1399751, 0.137514, -1.676057, 1, 1, 1, 1, 1,
-0.1385041, 1.193464, -2.775231, 1, 1, 1, 1, 1,
-0.1324762, 0.6237042, -0.271878, 0, 0, 1, 1, 1,
-0.1304608, -1.067788, -3.782099, 1, 0, 0, 1, 1,
-0.1291388, -0.8323213, -5.00888, 1, 0, 0, 1, 1,
-0.1266502, 1.214312, 1.206087, 1, 0, 0, 1, 1,
-0.125297, -1.748791, -2.108028, 1, 0, 0, 1, 1,
-0.1251382, 0.1112507, -0.3747055, 1, 0, 0, 1, 1,
-0.1207425, -0.8982465, -3.937869, 0, 0, 0, 1, 1,
-0.1186503, -0.6715038, -3.475006, 0, 0, 0, 1, 1,
-0.1174854, 0.7952564, -0.8593622, 0, 0, 0, 1, 1,
-0.113757, -1.772017, -3.002827, 0, 0, 0, 1, 1,
-0.1130785, 0.3720751, -2.283128, 0, 0, 0, 1, 1,
-0.1113057, 0.3726092, -1.049079, 0, 0, 0, 1, 1,
-0.1109313, -0.5888437, -2.027331, 0, 0, 0, 1, 1,
-0.1079857, 0.9647481, -0.93732, 1, 1, 1, 1, 1,
-0.1067041, 0.4958093, -0.2617508, 1, 1, 1, 1, 1,
-0.1056119, -0.174522, -3.935049, 1, 1, 1, 1, 1,
-0.1001711, -2.533812, -2.533358, 1, 1, 1, 1, 1,
-0.09651035, -0.2857953, -3.480143, 1, 1, 1, 1, 1,
-0.09452884, 1.961328, -1.460183, 1, 1, 1, 1, 1,
-0.09291149, -2.145317, -5.176097, 1, 1, 1, 1, 1,
-0.09177677, 1.041898, 0.6268026, 1, 1, 1, 1, 1,
-0.09104119, 1.080536, -1.945017, 1, 1, 1, 1, 1,
-0.0858288, -0.7212244, -4.081953, 1, 1, 1, 1, 1,
-0.08152842, -0.9321117, -3.536543, 1, 1, 1, 1, 1,
-0.0812894, -1.129037, -4.330779, 1, 1, 1, 1, 1,
-0.07978979, 0.4754891, -0.6407844, 1, 1, 1, 1, 1,
-0.07835806, 0.3433128, -1.065129, 1, 1, 1, 1, 1,
-0.07333201, 1.890454, 2.035063, 1, 1, 1, 1, 1,
-0.07245629, -0.5528343, -3.568543, 0, 0, 1, 1, 1,
-0.06999194, 0.004052963, -1.863242, 1, 0, 0, 1, 1,
-0.06985202, 1.908234, 1.145507, 1, 0, 0, 1, 1,
-0.06871738, -0.3112271, -6.196353, 1, 0, 0, 1, 1,
-0.06461123, -0.678356, -1.282671, 1, 0, 0, 1, 1,
-0.06284699, -0.2516741, -3.964116, 1, 0, 0, 1, 1,
-0.0572921, -0.351615, -3.143054, 0, 0, 0, 1, 1,
-0.05607373, -1.402337, -2.796505, 0, 0, 0, 1, 1,
-0.0533212, 0.7053373, 0.7188131, 0, 0, 0, 1, 1,
-0.05119779, -0.2081447, -3.7648, 0, 0, 0, 1, 1,
-0.04996765, 0.1366955, -0.09467373, 0, 0, 0, 1, 1,
-0.03815057, 1.200427, 0.6067364, 0, 0, 0, 1, 1,
-0.03210221, -1.644506, -3.803375, 0, 0, 0, 1, 1,
-0.02988647, -0.6983749, -4.747263, 1, 1, 1, 1, 1,
-0.02667711, -1.196828, -3.409985, 1, 1, 1, 1, 1,
-0.02527459, 0.04171696, -1.19901, 1, 1, 1, 1, 1,
-0.0235784, 0.7873055, 0.6281298, 1, 1, 1, 1, 1,
-0.02262711, -0.4801229, -3.268449, 1, 1, 1, 1, 1,
-0.02003177, 0.6227862, -0.3301604, 1, 1, 1, 1, 1,
-0.01977925, -0.7998058, -2.481313, 1, 1, 1, 1, 1,
-0.01895824, 0.08120168, -0.2332279, 1, 1, 1, 1, 1,
-0.01858237, 0.5214088, -0.9652963, 1, 1, 1, 1, 1,
-0.006768688, 1.455441, 0.02098589, 1, 1, 1, 1, 1,
-0.005830175, -0.5249735, -3.154822, 1, 1, 1, 1, 1,
-0.004315288, 0.7709067, -1.073682, 1, 1, 1, 1, 1,
-0.001819971, -0.5199059, -3.488914, 1, 1, 1, 1, 1,
-0.000942829, 0.3467788, -0.4070673, 1, 1, 1, 1, 1,
0.001172845, -0.2561654, 1.840629, 1, 1, 1, 1, 1,
0.001445257, 0.9610249, 0.4664456, 0, 0, 1, 1, 1,
0.00217043, 0.899829, 0.946515, 1, 0, 0, 1, 1,
0.003160517, -0.9903944, 2.864101, 1, 0, 0, 1, 1,
0.007587226, 0.5644361, 0.1641306, 1, 0, 0, 1, 1,
0.00800857, -0.007932575, 1.897284, 1, 0, 0, 1, 1,
0.009945546, -1.532583, 3.087165, 1, 0, 0, 1, 1,
0.01473667, -1.675665, 3.853945, 0, 0, 0, 1, 1,
0.01520965, 0.1710336, -1.285963, 0, 0, 0, 1, 1,
0.01557097, 1.251668, 2.138299, 0, 0, 0, 1, 1,
0.02226236, -1.1148, 2.131942, 0, 0, 0, 1, 1,
0.02233954, 0.2429974, 0.5199189, 0, 0, 0, 1, 1,
0.02422128, -1.253029, 3.46137, 0, 0, 0, 1, 1,
0.02482637, 1.222153, 1.879214, 0, 0, 0, 1, 1,
0.02545116, -0.4013875, 1.906912, 1, 1, 1, 1, 1,
0.02547439, 0.001966318, -0.1049872, 1, 1, 1, 1, 1,
0.02737671, 1.339585, -1.645537, 1, 1, 1, 1, 1,
0.02745897, -2.222634, 1.939314, 1, 1, 1, 1, 1,
0.0361084, -0.7440444, 2.718282, 1, 1, 1, 1, 1,
0.03749857, 0.07256307, 0.2255669, 1, 1, 1, 1, 1,
0.03754083, 0.9632042, -0.05247066, 1, 1, 1, 1, 1,
0.041207, -0.4944759, 1.116831, 1, 1, 1, 1, 1,
0.04268792, -0.3567228, 2.670298, 1, 1, 1, 1, 1,
0.04341463, 1.18605, -1.576134, 1, 1, 1, 1, 1,
0.04368315, -1.952293, 3.589595, 1, 1, 1, 1, 1,
0.04823842, -0.2669832, 3.134991, 1, 1, 1, 1, 1,
0.04983655, 0.241285, -1.594042, 1, 1, 1, 1, 1,
0.0513604, -0.5550667, 3.903876, 1, 1, 1, 1, 1,
0.05718603, 0.2696706, 0.4542978, 1, 1, 1, 1, 1,
0.05787062, -0.3129936, 2.045921, 0, 0, 1, 1, 1,
0.06095212, -0.8430593, 3.251557, 1, 0, 0, 1, 1,
0.06774933, 1.081835, 2.328421, 1, 0, 0, 1, 1,
0.07079747, -1.985211, 2.189453, 1, 0, 0, 1, 1,
0.0721726, -0.334998, 4.864001, 1, 0, 0, 1, 1,
0.07284158, 0.5932886, 0.219337, 1, 0, 0, 1, 1,
0.07533035, -0.5738051, 3.204042, 0, 0, 0, 1, 1,
0.07765506, 0.6310934, -0.1485576, 0, 0, 0, 1, 1,
0.07934813, -1.818111, 3.506408, 0, 0, 0, 1, 1,
0.08607831, 0.5520599, -0.2217208, 0, 0, 0, 1, 1,
0.08670426, -1.145809, 1.32407, 0, 0, 0, 1, 1,
0.08673192, -1.087993, 3.355915, 0, 0, 0, 1, 1,
0.09067857, -0.9026064, 3.436641, 0, 0, 0, 1, 1,
0.09197032, -0.3133611, 3.252627, 1, 1, 1, 1, 1,
0.09237701, -2.397695, 1.794165, 1, 1, 1, 1, 1,
0.1024838, -0.7614128, 1.563887, 1, 1, 1, 1, 1,
0.103168, 0.6733088, 0.6218014, 1, 1, 1, 1, 1,
0.1055106, 1.219437, 0.1480251, 1, 1, 1, 1, 1,
0.1059725, 0.09342469, 0.8802182, 1, 1, 1, 1, 1,
0.1064491, 1.155507, -0.4252582, 1, 1, 1, 1, 1,
0.1077764, -1.180429, 4.53561, 1, 1, 1, 1, 1,
0.1089044, -2.598946, 1.905569, 1, 1, 1, 1, 1,
0.1132734, -1.486757, 5.336089, 1, 1, 1, 1, 1,
0.1150643, -0.9872553, 3.511577, 1, 1, 1, 1, 1,
0.1207379, -1.877803, 4.073152, 1, 1, 1, 1, 1,
0.123771, 0.6168523, -0.9774602, 1, 1, 1, 1, 1,
0.1285201, 1.178591, -0.2269912, 1, 1, 1, 1, 1,
0.1299558, 1.349869, -0.2675561, 1, 1, 1, 1, 1,
0.1324185, 2.427736, 0.5470043, 0, 0, 1, 1, 1,
0.1324265, 0.7334413, 0.6225436, 1, 0, 0, 1, 1,
0.1342319, 0.6526172, 0.310356, 1, 0, 0, 1, 1,
0.1375006, -2.65276, 1.852479, 1, 0, 0, 1, 1,
0.139312, 1.72642, 0.4994317, 1, 0, 0, 1, 1,
0.1393335, 1.62333, -1.559864, 1, 0, 0, 1, 1,
0.1413563, 2.230893, 0.6717693, 0, 0, 0, 1, 1,
0.1435092, 0.9109752, -1.007162, 0, 0, 0, 1, 1,
0.1497002, 1.741751, -0.4038289, 0, 0, 0, 1, 1,
0.1520399, 0.2420605, 1.417996, 0, 0, 0, 1, 1,
0.1546755, 0.5718952, -1.825434, 0, 0, 0, 1, 1,
0.1552467, 2.623289, -0.385002, 0, 0, 0, 1, 1,
0.1586056, 1.057174, 2.203065, 0, 0, 0, 1, 1,
0.1592156, 0.3268847, -0.1557099, 1, 1, 1, 1, 1,
0.1592599, 1.206956, -0.6854392, 1, 1, 1, 1, 1,
0.1601687, 0.6332405, 0.8435626, 1, 1, 1, 1, 1,
0.1607061, 0.7120199, 0.489166, 1, 1, 1, 1, 1,
0.1610904, -1.19221, 3.88193, 1, 1, 1, 1, 1,
0.1612055, -2.177922, 4.249855, 1, 1, 1, 1, 1,
0.1620312, 0.2869387, 0.1527619, 1, 1, 1, 1, 1,
0.1643721, 0.01672922, 1.409856, 1, 1, 1, 1, 1,
0.1652587, 0.406161, -0.2828498, 1, 1, 1, 1, 1,
0.1701763, 0.4196301, -0.9550084, 1, 1, 1, 1, 1,
0.170688, 0.4743409, 0.2560424, 1, 1, 1, 1, 1,
0.170913, -0.9599727, 2.347632, 1, 1, 1, 1, 1,
0.1743612, 1.877471, -0.395801, 1, 1, 1, 1, 1,
0.1782223, 0.4913786, 1.173296, 1, 1, 1, 1, 1,
0.1802493, -1.440736, 2.173842, 1, 1, 1, 1, 1,
0.1808922, -0.0287312, 3.269489, 0, 0, 1, 1, 1,
0.1813781, 0.9784623, 0.4761899, 1, 0, 0, 1, 1,
0.1819341, 0.9813898, -0.4457533, 1, 0, 0, 1, 1,
0.1839156, 0.3376172, -0.8074806, 1, 0, 0, 1, 1,
0.1850629, 1.609775, -0.3119197, 1, 0, 0, 1, 1,
0.1861469, 0.8962821, 0.7292437, 1, 0, 0, 1, 1,
0.1873213, 1.395064, 0.4767205, 0, 0, 0, 1, 1,
0.1919823, 1.617109, -1.630606, 0, 0, 0, 1, 1,
0.1942119, -1.869298, 2.68592, 0, 0, 0, 1, 1,
0.1942126, -0.5331211, 1.677064, 0, 0, 0, 1, 1,
0.1968822, -1.045939, 3.81424, 0, 0, 0, 1, 1,
0.1978273, -0.815737, 2.95704, 0, 0, 0, 1, 1,
0.2000812, -0.2470481, 2.418621, 0, 0, 0, 1, 1,
0.2028706, 1.638498, -1.294132, 1, 1, 1, 1, 1,
0.2071639, 0.4267468, -0.01043838, 1, 1, 1, 1, 1,
0.2164824, -0.8809444, 2.445023, 1, 1, 1, 1, 1,
0.2247869, -0.0294766, 2.420194, 1, 1, 1, 1, 1,
0.2261128, 0.3879459, 2.029264, 1, 1, 1, 1, 1,
0.2279086, -1.268569, 4.002174, 1, 1, 1, 1, 1,
0.2285358, 1.248621, -0.3283233, 1, 1, 1, 1, 1,
0.2291239, 1.744666, 0.2618524, 1, 1, 1, 1, 1,
0.2306278, -0.4756434, 3.367909, 1, 1, 1, 1, 1,
0.2314496, 0.2415236, 1.62637, 1, 1, 1, 1, 1,
0.2320386, 2.490507, 0.4067208, 1, 1, 1, 1, 1,
0.236557, -0.312619, 2.871064, 1, 1, 1, 1, 1,
0.2371165, -0.372915, 3.693971, 1, 1, 1, 1, 1,
0.2420368, 0.6548948, 1.35854, 1, 1, 1, 1, 1,
0.2431338, 2.618213, -0.1931954, 1, 1, 1, 1, 1,
0.25045, 0.279231, 0.3663567, 0, 0, 1, 1, 1,
0.2587544, 0.02851863, -0.3098705, 1, 0, 0, 1, 1,
0.2590123, 0.8089177, -0.5267118, 1, 0, 0, 1, 1,
0.262136, -0.04022866, 1.636007, 1, 0, 0, 1, 1,
0.263871, -0.6624707, 2.516672, 1, 0, 0, 1, 1,
0.2647042, -0.572965, 0.9949302, 1, 0, 0, 1, 1,
0.2759872, 0.2362298, 0.8195282, 0, 0, 0, 1, 1,
0.2770106, -0.2199289, 1.929384, 0, 0, 0, 1, 1,
0.2770138, -0.7129507, 2.507412, 0, 0, 0, 1, 1,
0.2863888, 0.762331, 2.195995, 0, 0, 0, 1, 1,
0.290967, -0.2973441, 3.528818, 0, 0, 0, 1, 1,
0.2914897, 0.7143524, 0.4624231, 0, 0, 0, 1, 1,
0.2968245, -0.8561439, 4.18959, 0, 0, 0, 1, 1,
0.3072362, -1.653046, 4.007316, 1, 1, 1, 1, 1,
0.3105103, 1.888698, -0.5246476, 1, 1, 1, 1, 1,
0.3138423, -0.9314826, 2.943785, 1, 1, 1, 1, 1,
0.3221622, 0.9037936, -0.2157419, 1, 1, 1, 1, 1,
0.3223535, 0.1693123, 1.064429, 1, 1, 1, 1, 1,
0.3233008, -0.0796322, 0.832596, 1, 1, 1, 1, 1,
0.3238675, 0.4276271, 1.949713, 1, 1, 1, 1, 1,
0.329233, -0.7654974, 2.531367, 1, 1, 1, 1, 1,
0.3321262, -1.230108, 2.322933, 1, 1, 1, 1, 1,
0.3322787, -0.6896707, 2.938333, 1, 1, 1, 1, 1,
0.3332154, 0.0968055, 2.289471, 1, 1, 1, 1, 1,
0.3334744, -1.261513, 2.592252, 1, 1, 1, 1, 1,
0.333559, 0.131596, 1.590257, 1, 1, 1, 1, 1,
0.3399011, 0.6479949, 0.7966677, 1, 1, 1, 1, 1,
0.3420475, -0.7752969, 2.424016, 1, 1, 1, 1, 1,
0.3424976, -0.2086174, 2.653358, 0, 0, 1, 1, 1,
0.3440659, -0.4315606, 4.206962, 1, 0, 0, 1, 1,
0.3481013, -1.116719, 2.699127, 1, 0, 0, 1, 1,
0.3521419, -0.9434054, 2.686528, 1, 0, 0, 1, 1,
0.3569937, 0.4322491, 0.3575357, 1, 0, 0, 1, 1,
0.35825, -1.628574, 2.860657, 1, 0, 0, 1, 1,
0.363026, -1.964186, 1.832481, 0, 0, 0, 1, 1,
0.3656351, 0.7720439, 1.539526, 0, 0, 0, 1, 1,
0.3681529, 0.2382592, 2.192693, 0, 0, 0, 1, 1,
0.3687242, 0.1110676, 3.142705, 0, 0, 0, 1, 1,
0.3720721, 0.5805734, 0.2222117, 0, 0, 0, 1, 1,
0.3729621, -0.5314619, 2.215851, 0, 0, 0, 1, 1,
0.3736184, 0.4726191, -0.5553148, 0, 0, 0, 1, 1,
0.3770338, 0.5569191, 1.846317, 1, 1, 1, 1, 1,
0.37871, 0.08310258, 2.170723, 1, 1, 1, 1, 1,
0.3803737, -1.234447, 3.779802, 1, 1, 1, 1, 1,
0.3834047, 0.8203432, 0.8156598, 1, 1, 1, 1, 1,
0.3841002, -0.2981946, 0.7933236, 1, 1, 1, 1, 1,
0.3873901, 0.02694361, 0.008389454, 1, 1, 1, 1, 1,
0.3887238, 1.162631, -0.4762917, 1, 1, 1, 1, 1,
0.3891569, -0.8810707, 1.993035, 1, 1, 1, 1, 1,
0.3894652, -0.2140542, 4.052003, 1, 1, 1, 1, 1,
0.3901742, 0.3383526, 0.5950817, 1, 1, 1, 1, 1,
0.390991, -0.6424332, 2.04829, 1, 1, 1, 1, 1,
0.3914542, 0.1808323, 0.6190662, 1, 1, 1, 1, 1,
0.3929509, -1.07588, 2.942075, 1, 1, 1, 1, 1,
0.4009422, -0.3809672, 0.6169276, 1, 1, 1, 1, 1,
0.415335, 0.3169421, 0.1010232, 1, 1, 1, 1, 1,
0.4155389, -0.5501168, 1.702341, 0, 0, 1, 1, 1,
0.4156868, -0.9359837, 3.525999, 1, 0, 0, 1, 1,
0.4191238, 1.224961, -1.154444, 1, 0, 0, 1, 1,
0.4202632, 0.1271851, 2.620537, 1, 0, 0, 1, 1,
0.4213731, 1.378956, 0.229718, 1, 0, 0, 1, 1,
0.4225451, -0.902493, 0.5090181, 1, 0, 0, 1, 1,
0.4244527, -1.483972, 5.068412, 0, 0, 0, 1, 1,
0.428272, -1.354854, 1.545657, 0, 0, 0, 1, 1,
0.4322939, 0.5253346, -0.6982811, 0, 0, 0, 1, 1,
0.4395286, 0.1117971, 1.269449, 0, 0, 0, 1, 1,
0.4424367, 0.3002514, -1.015103, 0, 0, 0, 1, 1,
0.4437889, -0.8108783, 2.72159, 0, 0, 0, 1, 1,
0.4458478, 0.519843, 0.5453328, 0, 0, 0, 1, 1,
0.4468768, 1.027144, 1.939958, 1, 1, 1, 1, 1,
0.4469151, -1.265151, 2.270911, 1, 1, 1, 1, 1,
0.4524493, -0.6271085, 3.523501, 1, 1, 1, 1, 1,
0.4532384, -1.012587, 2.962121, 1, 1, 1, 1, 1,
0.461607, -1.995269, 5.265635, 1, 1, 1, 1, 1,
0.463055, -0.1402484, 1.654622, 1, 1, 1, 1, 1,
0.464178, 0.60088, 0.7490548, 1, 1, 1, 1, 1,
0.4667946, -1.73413, 2.72448, 1, 1, 1, 1, 1,
0.4680581, -1.777217, 3.005881, 1, 1, 1, 1, 1,
0.4724402, -0.8382385, 3.190882, 1, 1, 1, 1, 1,
0.4744239, -0.002949625, 2.10808, 1, 1, 1, 1, 1,
0.4852015, -1.403022, 2.233471, 1, 1, 1, 1, 1,
0.4883403, 0.1395984, 0.2297805, 1, 1, 1, 1, 1,
0.4889185, 0.08179951, 2.101709, 1, 1, 1, 1, 1,
0.495186, 1.325551, -2.02706, 1, 1, 1, 1, 1,
0.496229, 0.5929778, 0.8237767, 0, 0, 1, 1, 1,
0.4983406, -0.5030589, 2.111037, 1, 0, 0, 1, 1,
0.5009556, 0.5076394, -0.1592168, 1, 0, 0, 1, 1,
0.5015449, 2.373191, -0.2758238, 1, 0, 0, 1, 1,
0.5084527, 0.8067244, -0.007070761, 1, 0, 0, 1, 1,
0.5100638, -1.009537, 3.99367, 1, 0, 0, 1, 1,
0.5131412, 1.894397, 1.06825, 0, 0, 0, 1, 1,
0.5167722, -0.7486783, 4.241889, 0, 0, 0, 1, 1,
0.5204079, 1.790553, -0.492824, 0, 0, 0, 1, 1,
0.5230505, -0.114516, 2.374462, 0, 0, 0, 1, 1,
0.5237511, 0.3499719, -0.03812559, 0, 0, 0, 1, 1,
0.525347, 0.7361298, -0.7490361, 0, 0, 0, 1, 1,
0.5320989, 0.6624901, -0.8579273, 0, 0, 0, 1, 1,
0.5343876, -0.1223513, 2.259568, 1, 1, 1, 1, 1,
0.5404613, 1.435516, 0.8682683, 1, 1, 1, 1, 1,
0.5443609, 0.4726856, 0.9547637, 1, 1, 1, 1, 1,
0.5463073, 0.1481994, 1.06381, 1, 1, 1, 1, 1,
0.5467379, -0.6937839, 3.59794, 1, 1, 1, 1, 1,
0.5487445, 0.833516, 1.090396, 1, 1, 1, 1, 1,
0.5552815, 1.254021, 0.08683301, 1, 1, 1, 1, 1,
0.5561528, 0.1451276, 0.3051463, 1, 1, 1, 1, 1,
0.5561745, 0.7012537, -0.3273852, 1, 1, 1, 1, 1,
0.5589294, -0.5008528, 1.528745, 1, 1, 1, 1, 1,
0.5596455, 0.3267975, -0.8292053, 1, 1, 1, 1, 1,
0.5628001, -0.3238564, 2.315128, 1, 1, 1, 1, 1,
0.562916, -0.2333705, 3.272421, 1, 1, 1, 1, 1,
0.5737034, 0.05764095, 3.061123, 1, 1, 1, 1, 1,
0.5749136, -0.06270824, 0.7948839, 1, 1, 1, 1, 1,
0.5759363, 0.5128597, 1.150363, 0, 0, 1, 1, 1,
0.5774113, 0.7418137, 0.9704919, 1, 0, 0, 1, 1,
0.5836931, -0.7149153, 2.167027, 1, 0, 0, 1, 1,
0.5841441, -0.7181651, 1.783611, 1, 0, 0, 1, 1,
0.5850983, -0.01978606, 0.7361075, 1, 0, 0, 1, 1,
0.5854051, 1.605415, 2.515883, 1, 0, 0, 1, 1,
0.5909634, 0.2519021, 0.7842437, 0, 0, 0, 1, 1,
0.5919414, -1.154533, 3.165678, 0, 0, 0, 1, 1,
0.5992243, -0.1308706, -0.377659, 0, 0, 0, 1, 1,
0.6057163, -0.04851867, 1.01921, 0, 0, 0, 1, 1,
0.6128798, -1.285501, 2.555351, 0, 0, 0, 1, 1,
0.6175948, -0.649193, 2.694454, 0, 0, 0, 1, 1,
0.6190038, -0.3660426, 0.7758893, 0, 0, 0, 1, 1,
0.6234963, 0.2443133, 0.6424038, 1, 1, 1, 1, 1,
0.6251628, -0.3683976, 2.063634, 1, 1, 1, 1, 1,
0.6252744, 0.134852, 1.331007, 1, 1, 1, 1, 1,
0.6330681, 1.213975, -1.699829, 1, 1, 1, 1, 1,
0.639658, 0.06742799, 2.737805, 1, 1, 1, 1, 1,
0.6466984, 0.1208827, 0.8485433, 1, 1, 1, 1, 1,
0.6477378, -0.7746338, 2.647505, 1, 1, 1, 1, 1,
0.6487944, 0.215025, 0.8537766, 1, 1, 1, 1, 1,
0.6499964, 0.5109137, 1.075989, 1, 1, 1, 1, 1,
0.6530913, 0.0780677, 1.985574, 1, 1, 1, 1, 1,
0.6562818, -0.6099738, 1.8709, 1, 1, 1, 1, 1,
0.6569833, -0.5094064, 3.75737, 1, 1, 1, 1, 1,
0.658836, 2.880875, 0.3261961, 1, 1, 1, 1, 1,
0.6601019, 0.0642502, 1.297369, 1, 1, 1, 1, 1,
0.6798624, 0.8160592, 0.2713715, 1, 1, 1, 1, 1,
0.6831567, -0.9022453, 0.7258599, 0, 0, 1, 1, 1,
0.6856914, -0.05306828, 0.4561542, 1, 0, 0, 1, 1,
0.6887896, 0.3928076, 0.4516407, 1, 0, 0, 1, 1,
0.6961058, -0.8650041, 1.80326, 1, 0, 0, 1, 1,
0.7007261, 0.337481, 1.430902, 1, 0, 0, 1, 1,
0.7035491, -0.5543265, 3.67245, 1, 0, 0, 1, 1,
0.7042896, 0.1152755, 0.542002, 0, 0, 0, 1, 1,
0.7064499, -0.3086579, 2.035071, 0, 0, 0, 1, 1,
0.7216477, 1.888402, -1.421974, 0, 0, 0, 1, 1,
0.7217466, -0.8555194, 2.77737, 0, 0, 0, 1, 1,
0.7248218, 0.1745418, 1.11265, 0, 0, 0, 1, 1,
0.7289245, -0.1554188, 3.005301, 0, 0, 0, 1, 1,
0.729366, -0.1959267, 0.8239583, 0, 0, 0, 1, 1,
0.7532547, -0.338032, 2.140581, 1, 1, 1, 1, 1,
0.7562108, -0.2658005, 0.02338601, 1, 1, 1, 1, 1,
0.7575378, 0.2669814, 2.528601, 1, 1, 1, 1, 1,
0.7579953, 0.5881064, 1.243105, 1, 1, 1, 1, 1,
0.7601544, -1.217091, 1.718434, 1, 1, 1, 1, 1,
0.7606269, -0.000372659, 1.95973, 1, 1, 1, 1, 1,
0.7650923, 0.6938591, 0.3732916, 1, 1, 1, 1, 1,
0.7662217, -0.7195968, 2.83339, 1, 1, 1, 1, 1,
0.7673709, 0.3142082, 1.577094, 1, 1, 1, 1, 1,
0.7719021, 2.232509, -0.280275, 1, 1, 1, 1, 1,
0.7740014, -0.3818379, 1.863976, 1, 1, 1, 1, 1,
0.7744063, -0.8606732, 2.686895, 1, 1, 1, 1, 1,
0.7783142, -1.206911, 2.528849, 1, 1, 1, 1, 1,
0.7839221, -0.6058882, 1.625541, 1, 1, 1, 1, 1,
0.7841086, 1.009022, 1.177504, 1, 1, 1, 1, 1,
0.8001548, 0.5982002, 1.062764, 0, 0, 1, 1, 1,
0.8094347, 0.4041719, -0.2951574, 1, 0, 0, 1, 1,
0.8111751, 1.520897, 0.7576691, 1, 0, 0, 1, 1,
0.815132, 0.1009354, 1.184814, 1, 0, 0, 1, 1,
0.8194508, -0.6934238, 1.503121, 1, 0, 0, 1, 1,
0.8212983, 0.007067696, 2.576983, 1, 0, 0, 1, 1,
0.8241717, -0.1460661, 1.431764, 0, 0, 0, 1, 1,
0.8250687, -1.193581, 2.299944, 0, 0, 0, 1, 1,
0.8342, -1.504944, 2.702546, 0, 0, 0, 1, 1,
0.8366665, 0.4439099, 1.166886, 0, 0, 0, 1, 1,
0.8368101, -0.4674256, 2.213085, 0, 0, 0, 1, 1,
0.8445634, 0.156403, 0.5257661, 0, 0, 0, 1, 1,
0.8486234, -1.059937, 2.582878, 0, 0, 0, 1, 1,
0.8510345, 0.5820042, 1.593734, 1, 1, 1, 1, 1,
0.8511035, 0.4959809, 1.381457, 1, 1, 1, 1, 1,
0.8512774, -1.031611, 2.316834, 1, 1, 1, 1, 1,
0.8520017, -0.5558994, 3.65451, 1, 1, 1, 1, 1,
0.8522219, -1.341516, 2.001985, 1, 1, 1, 1, 1,
0.8547205, -0.1549475, 1.610128, 1, 1, 1, 1, 1,
0.8547214, 0.4592272, 0.5975481, 1, 1, 1, 1, 1,
0.8551604, -0.4928977, 0.6700973, 1, 1, 1, 1, 1,
0.8558304, 0.4668365, 0.738983, 1, 1, 1, 1, 1,
0.8572587, -0.5714153, 0.8919244, 1, 1, 1, 1, 1,
0.86072, 0.001776449, 3.465027, 1, 1, 1, 1, 1,
0.8634028, 0.1595281, 0.9812799, 1, 1, 1, 1, 1,
0.8694149, 1.160726, 0.9765176, 1, 1, 1, 1, 1,
0.872689, -0.3019986, 1.222076, 1, 1, 1, 1, 1,
0.8750176, 0.06511717, 1.522746, 1, 1, 1, 1, 1,
0.8758536, -0.3778774, -0.5230803, 0, 0, 1, 1, 1,
0.881961, -1.008845, 3.750155, 1, 0, 0, 1, 1,
0.8855954, -0.5496918, 4.115533, 1, 0, 0, 1, 1,
0.8919009, 1.022528, 1.189822, 1, 0, 0, 1, 1,
0.9009678, -0.4523696, 2.424575, 1, 0, 0, 1, 1,
0.9044764, -2.510011, 2.510298, 1, 0, 0, 1, 1,
0.914489, 1.140702, 1.11236, 0, 0, 0, 1, 1,
0.9147526, 0.05753621, 0.3440137, 0, 0, 0, 1, 1,
0.9197885, 0.7498184, 1.002675, 0, 0, 0, 1, 1,
0.9222215, 0.6569457, 0.8271096, 0, 0, 0, 1, 1,
0.9307198, -0.9810033, 3.511331, 0, 0, 0, 1, 1,
0.9326589, -1.060925, 3.114304, 0, 0, 0, 1, 1,
0.937589, -1.131813, 3.354379, 0, 0, 0, 1, 1,
0.9470383, -1.125322, 1.039118, 1, 1, 1, 1, 1,
0.9471876, 1.290576, 2.15562, 1, 1, 1, 1, 1,
0.9572921, -0.6529098, 1.199474, 1, 1, 1, 1, 1,
0.9586616, -0.9945962, 2.014411, 1, 1, 1, 1, 1,
0.974543, 0.7872218, -0.02822088, 1, 1, 1, 1, 1,
0.9772476, 1.344746, 2.486189, 1, 1, 1, 1, 1,
0.9792174, 0.5125341, 0.6331656, 1, 1, 1, 1, 1,
0.9843348, -0.7696196, 4.198866, 1, 1, 1, 1, 1,
0.9852795, 1.364554, -0.007643234, 1, 1, 1, 1, 1,
0.9877334, 0.1400377, 2.192942, 1, 1, 1, 1, 1,
0.9890816, 0.6557463, 1.482798, 1, 1, 1, 1, 1,
0.9899886, 1.048724, 0.3150691, 1, 1, 1, 1, 1,
0.9941937, 0.9487836, -0.602435, 1, 1, 1, 1, 1,
0.9944932, 1.163829, -0.06599768, 1, 1, 1, 1, 1,
0.9985842, 1.401402, 1.206776, 1, 1, 1, 1, 1,
1.000975, 1.795107, 0.1275835, 0, 0, 1, 1, 1,
1.002161, 1.68028, 1.047247, 1, 0, 0, 1, 1,
1.009247, 0.06804326, 1.319392, 1, 0, 0, 1, 1,
1.009359, 0.3237091, 0.9866264, 1, 0, 0, 1, 1,
1.010481, -1.237032, 1.291877, 1, 0, 0, 1, 1,
1.018945, 0.7601449, 2.060946, 1, 0, 0, 1, 1,
1.0192, 0.3648604, 0.8899367, 0, 0, 0, 1, 1,
1.023342, 0.2435512, 0.1305939, 0, 0, 0, 1, 1,
1.037304, -1.156189, 3.143427, 0, 0, 0, 1, 1,
1.039163, 0.03830262, 0.7319384, 0, 0, 0, 1, 1,
1.040922, 1.04664, 0.9055704, 0, 0, 0, 1, 1,
1.043283, 0.01961946, 2.808425, 0, 0, 0, 1, 1,
1.043478, -0.5977666, 1.253603, 0, 0, 0, 1, 1,
1.046103, -0.5085518, 1.805929, 1, 1, 1, 1, 1,
1.046737, 1.171775, -0.4571293, 1, 1, 1, 1, 1,
1.046807, 1.501947, 0.9394313, 1, 1, 1, 1, 1,
1.05559, -0.1141536, 0.01972643, 1, 1, 1, 1, 1,
1.056973, 0.2965168, 1.988264, 1, 1, 1, 1, 1,
1.058891, 0.4862114, 2.525366, 1, 1, 1, 1, 1,
1.060562, -0.004805466, 1.153257, 1, 1, 1, 1, 1,
1.060997, 0.9837035, -1.023037, 1, 1, 1, 1, 1,
1.062858, -1.315178, 1.18574, 1, 1, 1, 1, 1,
1.064377, 0.159141, 1.883478, 1, 1, 1, 1, 1,
1.074166, -1.100381, 4.058484, 1, 1, 1, 1, 1,
1.074725, 0.8731283, 0.1333106, 1, 1, 1, 1, 1,
1.083671, 0.4865553, -0.1185361, 1, 1, 1, 1, 1,
1.092394, -0.17274, 2.076938, 1, 1, 1, 1, 1,
1.093286, -0.09289041, 1.529169, 1, 1, 1, 1, 1,
1.094151, 1.468324, 0.722041, 0, 0, 1, 1, 1,
1.09506, 0.3523872, -0.9922216, 1, 0, 0, 1, 1,
1.095857, 0.5484764, -0.591136, 1, 0, 0, 1, 1,
1.105966, 0.8783953, 1.372413, 1, 0, 0, 1, 1,
1.106186, -0.6386868, 1.531236, 1, 0, 0, 1, 1,
1.108762, -2.202274, 3.619879, 1, 0, 0, 1, 1,
1.111477, -1.066769, 0.2333677, 0, 0, 0, 1, 1,
1.116339, 2.16125, 0.7116657, 0, 0, 0, 1, 1,
1.116657, -1.767463, 2.492414, 0, 0, 0, 1, 1,
1.119564, -0.950437, 1.949989, 0, 0, 0, 1, 1,
1.120271, -1.526041, 2.861809, 0, 0, 0, 1, 1,
1.1228, 0.6436141, 1.244555, 0, 0, 0, 1, 1,
1.134344, -1.767579, 3.516562, 0, 0, 0, 1, 1,
1.134661, -0.4281262, 1.193175, 1, 1, 1, 1, 1,
1.143516, 1.319083, 1.148912, 1, 1, 1, 1, 1,
1.144162, 0.09824889, 2.751263, 1, 1, 1, 1, 1,
1.147975, 0.872727, -0.4537381, 1, 1, 1, 1, 1,
1.150981, -0.5312489, 2.404924, 1, 1, 1, 1, 1,
1.159751, -0.6030876, 0.5280674, 1, 1, 1, 1, 1,
1.164331, 1.281092, 3.395892, 1, 1, 1, 1, 1,
1.168162, -0.9668313, 3.019035, 1, 1, 1, 1, 1,
1.170235, -1.389633, 1.699449, 1, 1, 1, 1, 1,
1.172257, 1.580844, 0.2614159, 1, 1, 1, 1, 1,
1.193106, -0.1808724, 2.143831, 1, 1, 1, 1, 1,
1.196149, 0.01175655, 1.036211, 1, 1, 1, 1, 1,
1.200945, 2.33299, 0.9978623, 1, 1, 1, 1, 1,
1.203344, -1.838278, 2.264606, 1, 1, 1, 1, 1,
1.208572, 0.4994112, 2.399955, 1, 1, 1, 1, 1,
1.21439, 0.567579, 1.742519, 0, 0, 1, 1, 1,
1.214982, 0.3328755, 0.02667438, 1, 0, 0, 1, 1,
1.218765, 2.004724, 1.817358, 1, 0, 0, 1, 1,
1.245306, -0.2051913, 0.6554973, 1, 0, 0, 1, 1,
1.249364, 0.7431976, 0.8749228, 1, 0, 0, 1, 1,
1.251626, -0.7865819, 3.393025, 1, 0, 0, 1, 1,
1.251785, 0.3245578, 1.011998, 0, 0, 0, 1, 1,
1.266806, 1.727677, 1.687385, 0, 0, 0, 1, 1,
1.283397, -0.7139649, 1.100238, 0, 0, 0, 1, 1,
1.285181, 0.5914996, -0.3305902, 0, 0, 0, 1, 1,
1.293651, -0.5533388, 0.9794438, 0, 0, 0, 1, 1,
1.295372, 0.472419, 0.9309416, 0, 0, 0, 1, 1,
1.303094, -0.527233, 0.7933606, 0, 0, 0, 1, 1,
1.313018, -0.6358536, 1.530206, 1, 1, 1, 1, 1,
1.320041, -0.3790536, 1.01839, 1, 1, 1, 1, 1,
1.32491, 0.3852707, 0.8243092, 1, 1, 1, 1, 1,
1.326296, 0.6051816, 1.477437, 1, 1, 1, 1, 1,
1.335824, -0.1451, 2.36236, 1, 1, 1, 1, 1,
1.339664, -1.584454, 4.250772, 1, 1, 1, 1, 1,
1.354978, 0.8699, 0.8546883, 1, 1, 1, 1, 1,
1.358016, -2.349142, 1.133726, 1, 1, 1, 1, 1,
1.361463, 3.973257, 1.550147, 1, 1, 1, 1, 1,
1.367443, 0.02298654, 0.2016087, 1, 1, 1, 1, 1,
1.373872, -0.3810167, 2.447664, 1, 1, 1, 1, 1,
1.374112, 2.423779, -0.5787719, 1, 1, 1, 1, 1,
1.374894, 1.835734, -0.8966278, 1, 1, 1, 1, 1,
1.38568, -0.685728, 1.025656, 1, 1, 1, 1, 1,
1.385725, 0.2171331, 1.998427, 1, 1, 1, 1, 1,
1.397181, 1.658601, 0.4180039, 0, 0, 1, 1, 1,
1.412081, -1.507183, 1.494011, 1, 0, 0, 1, 1,
1.412162, -1.192604, 4.313737, 1, 0, 0, 1, 1,
1.422772, 0.8134784, 0.7829717, 1, 0, 0, 1, 1,
1.429791, -0.5758121, 2.558754, 1, 0, 0, 1, 1,
1.437936, 0.2977558, 0.935082, 1, 0, 0, 1, 1,
1.44021, 0.8749245, 2.388358, 0, 0, 0, 1, 1,
1.445568, -0.9617986, 1.719074, 0, 0, 0, 1, 1,
1.449068, -0.02795799, 2.1849, 0, 0, 0, 1, 1,
1.464021, 1.779811, 0.4060332, 0, 0, 0, 1, 1,
1.466522, -0.146868, 1.900298, 0, 0, 0, 1, 1,
1.491368, -1.045961, 2.463042, 0, 0, 0, 1, 1,
1.500546, 0.7007256, 0.3006734, 0, 0, 0, 1, 1,
1.507426, -0.3928293, 1.062989, 1, 1, 1, 1, 1,
1.510367, 0.3345719, 0.4399593, 1, 1, 1, 1, 1,
1.511168, 1.220587, 0.9412014, 1, 1, 1, 1, 1,
1.526366, -0.8014309, 3.344127, 1, 1, 1, 1, 1,
1.547371, -0.1570405, 3.37131, 1, 1, 1, 1, 1,
1.566492, -0.7840621, 3.1616, 1, 1, 1, 1, 1,
1.579459, -0.352671, 0.4240314, 1, 1, 1, 1, 1,
1.581716, 0.09880621, 0.07000143, 1, 1, 1, 1, 1,
1.591211, -0.2356401, 0.7627147, 1, 1, 1, 1, 1,
1.606966, -0.5591738, 2.609707, 1, 1, 1, 1, 1,
1.634732, -0.4139712, 2.806398, 1, 1, 1, 1, 1,
1.635694, 0.2391755, -0.4869013, 1, 1, 1, 1, 1,
1.642036, -0.7234013, 1.307554, 1, 1, 1, 1, 1,
1.642532, -0.7799817, 1.835416, 1, 1, 1, 1, 1,
1.645211, -0.1669165, -0.05610519, 1, 1, 1, 1, 1,
1.656252, -0.3183147, 0.9300022, 0, 0, 1, 1, 1,
1.675575, -0.313361, 0.7691919, 1, 0, 0, 1, 1,
1.677999, -0.2081546, 0.3738844, 1, 0, 0, 1, 1,
1.684004, -0.1984949, 2.217865, 1, 0, 0, 1, 1,
1.707239, -2.867334, 1.054692, 1, 0, 0, 1, 1,
1.71642, -0.7510432, 2.000653, 1, 0, 0, 1, 1,
1.723716, 0.9061158, 0.5326585, 0, 0, 0, 1, 1,
1.728198, 0.9083014, -0.004215186, 0, 0, 0, 1, 1,
1.735447, -0.03011137, 2.890701, 0, 0, 0, 1, 1,
1.769637, 2.284392, 0.6907672, 0, 0, 0, 1, 1,
1.773171, 1.47994, 0.6757672, 0, 0, 0, 1, 1,
1.776786, -0.6319396, 3.620907, 0, 0, 0, 1, 1,
1.792213, 0.256254, 1.563107, 0, 0, 0, 1, 1,
1.803928, 0.7745627, 1.221481, 1, 1, 1, 1, 1,
1.805387, 0.02458261, 0.9497744, 1, 1, 1, 1, 1,
1.824849, -1.048326, 0.6938465, 1, 1, 1, 1, 1,
1.825418, 1.190772, 1.001501, 1, 1, 1, 1, 1,
1.851056, 0.4324337, 1.600831, 1, 1, 1, 1, 1,
1.880828, 0.2643742, -0.2499367, 1, 1, 1, 1, 1,
1.883663, -1.431083, 3.030703, 1, 1, 1, 1, 1,
1.892411, -1.055931, 2.475936, 1, 1, 1, 1, 1,
1.903912, -0.3164454, 2.62971, 1, 1, 1, 1, 1,
1.923955, -0.1652008, 0.64412, 1, 1, 1, 1, 1,
1.963735, 1.0738, 2.142014, 1, 1, 1, 1, 1,
1.972335, -0.2630824, 2.309664, 1, 1, 1, 1, 1,
1.974972, -0.09829049, 1.964586, 1, 1, 1, 1, 1,
1.984068, 0.5024294, -0.740697, 1, 1, 1, 1, 1,
2.003682, 0.03540387, 1.650098, 1, 1, 1, 1, 1,
2.008157, -0.6284683, 2.73125, 0, 0, 1, 1, 1,
2.022556, 1.36177, -0.1549129, 1, 0, 0, 1, 1,
2.056451, -0.8449702, 1.676488, 1, 0, 0, 1, 1,
2.057741, 0.7775723, 2.02006, 1, 0, 0, 1, 1,
2.059454, 0.7000827, 1.033216, 1, 0, 0, 1, 1,
2.077617, 0.2646977, 0.3881267, 1, 0, 0, 1, 1,
2.108655, 3.109713, -0.469294, 0, 0, 0, 1, 1,
2.155453, -0.2001312, 1.073983, 0, 0, 0, 1, 1,
2.20713, 1.018203, 1.180769, 0, 0, 0, 1, 1,
2.316561, -0.7242923, 1.236192, 0, 0, 0, 1, 1,
2.368721, 0.3710362, 0.8615911, 0, 0, 0, 1, 1,
2.387198, 1.018879, 1.216393, 0, 0, 0, 1, 1,
2.482489, 0.3167597, 1.958846, 0, 0, 0, 1, 1,
2.854367, 1.605426, 1.683776, 1, 1, 1, 1, 1,
2.928497, 0.6284691, 1.325223, 1, 1, 1, 1, 1,
2.957583, 0.5754327, 2.595964, 1, 1, 1, 1, 1,
2.97854, 1.003824, 1.125284, 1, 1, 1, 1, 1,
3.166737, 0.2421711, -0.1905205, 1, 1, 1, 1, 1,
3.169097, -0.1715326, 2.893486, 1, 1, 1, 1, 1,
3.284899, -0.3449229, 1.815718, 1, 1, 1, 1, 1
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
var radius = 10.07621;
var distance = 35.39226;
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
mvMatrix.translate( 0.02652025, -0.5529613, 0.4301322 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.39226);
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
