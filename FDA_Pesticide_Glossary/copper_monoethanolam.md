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
-3.493332, 1.005412, -1.982267, 1, 0, 0, 1,
-3.337109, -1.180313, -1.46888, 1, 0.007843138, 0, 1,
-3.041828, 1.882517, 0.4514844, 1, 0.01176471, 0, 1,
-2.982953, 0.7183182, -1.830498, 1, 0.01960784, 0, 1,
-2.778687, -1.412915, -2.308217, 1, 0.02352941, 0, 1,
-2.687839, 1.145559, -3.681643, 1, 0.03137255, 0, 1,
-2.489737, 0.6794218, -1.09498, 1, 0.03529412, 0, 1,
-2.455793, 0.923268, -0.726023, 1, 0.04313726, 0, 1,
-2.409715, -0.0826956, -1.436023, 1, 0.04705882, 0, 1,
-2.333667, 0.5884063, -0.05608916, 1, 0.05490196, 0, 1,
-2.31627, -0.2548699, -1.857419, 1, 0.05882353, 0, 1,
-2.296877, 0.994559, -0.4712115, 1, 0.06666667, 0, 1,
-2.263087, 0.2137615, -1.497961, 1, 0.07058824, 0, 1,
-2.251211, -1.644313, -2.040715, 1, 0.07843138, 0, 1,
-2.191684, -2.969228, -1.807248, 1, 0.08235294, 0, 1,
-2.157267, -1.416415, -1.988704, 1, 0.09019608, 0, 1,
-2.148354, -0.7603209, -0.8619279, 1, 0.09411765, 0, 1,
-2.117265, 0.2251649, -2.496094, 1, 0.1019608, 0, 1,
-2.104722, -2.17728, -0.05534578, 1, 0.1098039, 0, 1,
-2.083357, -1.309553, -2.489611, 1, 0.1137255, 0, 1,
-2.068095, -0.309694, -1.648205, 1, 0.1215686, 0, 1,
-2.041135, 1.937451, -0.5654904, 1, 0.1254902, 0, 1,
-2.026223, -0.2477907, -1.870041, 1, 0.1333333, 0, 1,
-2.020578, 0.2515298, -1.115551, 1, 0.1372549, 0, 1,
-2.016208, -0.68572, -2.155939, 1, 0.145098, 0, 1,
-2.005231, 0.4062623, -0.8858001, 1, 0.1490196, 0, 1,
-2.002091, -0.3222743, -3.08209, 1, 0.1568628, 0, 1,
-1.991603, -2.001118, -2.858885, 1, 0.1607843, 0, 1,
-1.977342, 0.4173261, -1.763329, 1, 0.1686275, 0, 1,
-1.957096, -0.0168778, -1.874944, 1, 0.172549, 0, 1,
-1.940253, -0.293012, -1.961058, 1, 0.1803922, 0, 1,
-1.929791, -0.3265062, -2.547517, 1, 0.1843137, 0, 1,
-1.913039, 0.4113153, -1.61417, 1, 0.1921569, 0, 1,
-1.89392, -0.8211063, -3.038441, 1, 0.1960784, 0, 1,
-1.832987, 1.840963, 0.3257168, 1, 0.2039216, 0, 1,
-1.829343, 0.09929293, -1.767501, 1, 0.2117647, 0, 1,
-1.817731, 0.1617164, -3.679415, 1, 0.2156863, 0, 1,
-1.807853, -0.9737749, -1.065719, 1, 0.2235294, 0, 1,
-1.795532, -0.260868, 0.006117806, 1, 0.227451, 0, 1,
-1.774579, 1.449859, -3.99723, 1, 0.2352941, 0, 1,
-1.767405, -1.876789, -2.56576, 1, 0.2392157, 0, 1,
-1.760702, 1.20763, -0.7700343, 1, 0.2470588, 0, 1,
-1.760013, -0.1989433, -1.773609, 1, 0.2509804, 0, 1,
-1.756736, 0.8506759, 0.4964503, 1, 0.2588235, 0, 1,
-1.755536, -1.241019, -2.644963, 1, 0.2627451, 0, 1,
-1.753568, 0.580785, -0.9906464, 1, 0.2705882, 0, 1,
-1.712361, -0.4927596, -1.773505, 1, 0.2745098, 0, 1,
-1.700809, -0.564704, -2.481656, 1, 0.282353, 0, 1,
-1.696509, -2.932356, -4.193105, 1, 0.2862745, 0, 1,
-1.695408, 0.9041685, -1.477845, 1, 0.2941177, 0, 1,
-1.681037, 0.3910144, 0.02722118, 1, 0.3019608, 0, 1,
-1.677754, 0.6157528, -1.778327, 1, 0.3058824, 0, 1,
-1.664118, -0.0833172, -2.097035, 1, 0.3137255, 0, 1,
-1.651434, -0.7630352, -0.8197499, 1, 0.3176471, 0, 1,
-1.64248, 0.7384387, -2.005484, 1, 0.3254902, 0, 1,
-1.616294, -1.13396, -1.733169, 1, 0.3294118, 0, 1,
-1.614305, -1.498114, -1.632521, 1, 0.3372549, 0, 1,
-1.611202, 0.6766211, 0.05166767, 1, 0.3411765, 0, 1,
-1.608487, -1.767709, -1.69078, 1, 0.3490196, 0, 1,
-1.602387, 0.3313613, -0.352661, 1, 0.3529412, 0, 1,
-1.594383, -1.213217, -2.080588, 1, 0.3607843, 0, 1,
-1.582767, 0.300806, -1.866585, 1, 0.3647059, 0, 1,
-1.57978, -1.117064, -1.779814, 1, 0.372549, 0, 1,
-1.578681, -0.7932385, -3.888053, 1, 0.3764706, 0, 1,
-1.577461, 0.7443087, -0.9226599, 1, 0.3843137, 0, 1,
-1.577107, 0.4873136, -3.020547, 1, 0.3882353, 0, 1,
-1.567915, 1.032186, -3.409567, 1, 0.3960784, 0, 1,
-1.556756, -1.638593, -1.907126, 1, 0.4039216, 0, 1,
-1.556702, 0.3386011, -1.694552, 1, 0.4078431, 0, 1,
-1.54681, 0.4925397, -0.886047, 1, 0.4156863, 0, 1,
-1.544481, 0.4380124, -1.4479, 1, 0.4196078, 0, 1,
-1.539132, 0.2594543, -1.122339, 1, 0.427451, 0, 1,
-1.535384, 0.6331312, -1.595556, 1, 0.4313726, 0, 1,
-1.532408, 0.05451993, -0.3372101, 1, 0.4392157, 0, 1,
-1.523298, -0.6323355, -0.07867026, 1, 0.4431373, 0, 1,
-1.507539, -1.728869, -0.6023631, 1, 0.4509804, 0, 1,
-1.499915, -1.22927, -2.269383, 1, 0.454902, 0, 1,
-1.495131, 0.4841489, -0.5282687, 1, 0.4627451, 0, 1,
-1.469847, 1.774197, 0.2643721, 1, 0.4666667, 0, 1,
-1.460797, -0.2959487, -4.481845, 1, 0.4745098, 0, 1,
-1.457917, -1.207842, -2.998315, 1, 0.4784314, 0, 1,
-1.453059, 1.348634, -1.019757, 1, 0.4862745, 0, 1,
-1.443414, -0.2655412, -2.236043, 1, 0.4901961, 0, 1,
-1.440213, -2.51564, -3.033003, 1, 0.4980392, 0, 1,
-1.438921, 1.964109, -1.061667, 1, 0.5058824, 0, 1,
-1.435502, 1.392532, -2.109441, 1, 0.509804, 0, 1,
-1.434599, 0.5091245, -1.373177, 1, 0.5176471, 0, 1,
-1.432014, -0.9933738, -0.7524236, 1, 0.5215687, 0, 1,
-1.429474, -0.185503, -0.7301965, 1, 0.5294118, 0, 1,
-1.427034, 0.6534953, -0.7612841, 1, 0.5333334, 0, 1,
-1.425168, -1.657358, -3.784651, 1, 0.5411765, 0, 1,
-1.420575, -0.8879157, -1.753004, 1, 0.5450981, 0, 1,
-1.372552, -0.7023492, -3.507082, 1, 0.5529412, 0, 1,
-1.368398, -0.07366823, -1.957678, 1, 0.5568628, 0, 1,
-1.36175, -1.118235, -2.380121, 1, 0.5647059, 0, 1,
-1.361139, -0.6254479, -2.06615, 1, 0.5686275, 0, 1,
-1.359066, 0.6418703, -2.465059, 1, 0.5764706, 0, 1,
-1.356352, 0.6357832, -2.770924, 1, 0.5803922, 0, 1,
-1.356152, 0.3710471, -2.445078, 1, 0.5882353, 0, 1,
-1.353456, -1.499438, -0.8907143, 1, 0.5921569, 0, 1,
-1.351977, 0.2554878, -1.312284, 1, 0.6, 0, 1,
-1.34362, -0.3183815, -1.257528, 1, 0.6078432, 0, 1,
-1.338525, -0.7023508, -0.6197389, 1, 0.6117647, 0, 1,
-1.325095, 0.5256265, -1.344129, 1, 0.6196079, 0, 1,
-1.311312, 1.067266, -0.426497, 1, 0.6235294, 0, 1,
-1.297181, -0.5940044, -2.808281, 1, 0.6313726, 0, 1,
-1.291378, 0.04308103, -1.091854, 1, 0.6352941, 0, 1,
-1.28881, -0.8745834, -2.566604, 1, 0.6431373, 0, 1,
-1.28598, 0.5448624, -1.399076, 1, 0.6470588, 0, 1,
-1.284087, -0.2088216, -0.9496678, 1, 0.654902, 0, 1,
-1.273457, -0.3874633, -1.619843, 1, 0.6588235, 0, 1,
-1.26231, 0.4845193, -0.7355053, 1, 0.6666667, 0, 1,
-1.259771, 0.113569, -3.816381, 1, 0.6705883, 0, 1,
-1.255961, -1.015479, -1.123802, 1, 0.6784314, 0, 1,
-1.253674, -0.02371424, -1.215141, 1, 0.682353, 0, 1,
-1.246482, -1.237275, -1.670774, 1, 0.6901961, 0, 1,
-1.239574, 1.617084, 0.1706697, 1, 0.6941177, 0, 1,
-1.236597, 1.286548, 0.5635864, 1, 0.7019608, 0, 1,
-1.229783, 1.552626, -0.6149479, 1, 0.7098039, 0, 1,
-1.214485, 1.048229, -1.803482, 1, 0.7137255, 0, 1,
-1.21151, 0.5364816, -2.500869, 1, 0.7215686, 0, 1,
-1.205431, -0.7156738, -2.221608, 1, 0.7254902, 0, 1,
-1.199897, 0.7541098, -2.74843, 1, 0.7333333, 0, 1,
-1.196999, 0.410552, -0.7931631, 1, 0.7372549, 0, 1,
-1.188758, -1.22427, -2.089391, 1, 0.7450981, 0, 1,
-1.179389, -0.6510831, -4.818819, 1, 0.7490196, 0, 1,
-1.177909, 3.1145, -0.3785378, 1, 0.7568628, 0, 1,
-1.17148, -0.3985806, -1.256956, 1, 0.7607843, 0, 1,
-1.167013, 0.03462026, -3.482664, 1, 0.7686275, 0, 1,
-1.166388, -0.9910428, -2.642235, 1, 0.772549, 0, 1,
-1.16607, -2.036712, -3.632883, 1, 0.7803922, 0, 1,
-1.160325, 0.7075846, -2.38111, 1, 0.7843137, 0, 1,
-1.158116, -3.193195, -4.930772, 1, 0.7921569, 0, 1,
-1.15804, 1.375478, 0.2400983, 1, 0.7960784, 0, 1,
-1.152835, -0.9352055, -2.582691, 1, 0.8039216, 0, 1,
-1.143939, 0.9112659, -2.149652, 1, 0.8117647, 0, 1,
-1.140139, -0.6091082, -1.698408, 1, 0.8156863, 0, 1,
-1.137361, -0.8780885, -1.890759, 1, 0.8235294, 0, 1,
-1.12431, -0.315318, -1.257448, 1, 0.827451, 0, 1,
-1.115872, -1.07222, -2.086441, 1, 0.8352941, 0, 1,
-1.114588, -0.3861876, -2.312557, 1, 0.8392157, 0, 1,
-1.104445, -0.5514639, -1.852345, 1, 0.8470588, 0, 1,
-1.103858, 0.6430427, 0.4775776, 1, 0.8509804, 0, 1,
-1.103526, -0.0980778, -2.329433, 1, 0.8588235, 0, 1,
-1.100918, -2.153138, -3.125629, 1, 0.8627451, 0, 1,
-1.09362, 1.907303, -0.4351904, 1, 0.8705882, 0, 1,
-1.082906, -1.026851, -1.964956, 1, 0.8745098, 0, 1,
-1.077469, -0.2713576, -1.687698, 1, 0.8823529, 0, 1,
-1.074802, -0.5508281, -1.522725, 1, 0.8862745, 0, 1,
-1.062641, -1.302833, -3.587179, 1, 0.8941177, 0, 1,
-1.059309, -1.016602, -1.368965, 1, 0.8980392, 0, 1,
-1.055348, -0.3584254, -2.506916, 1, 0.9058824, 0, 1,
-1.053075, 0.4520582, -0.8661552, 1, 0.9137255, 0, 1,
-1.047016, 1.434983, -1.346431, 1, 0.9176471, 0, 1,
-1.044252, 0.2559026, -1.691155, 1, 0.9254902, 0, 1,
-1.0406, 0.2156415, -1.698542, 1, 0.9294118, 0, 1,
-1.033661, -1.00267, -1.465845, 1, 0.9372549, 0, 1,
-1.016602, -0.1070305, -3.739555, 1, 0.9411765, 0, 1,
-1.01428, 0.5410599, -0.268433, 1, 0.9490196, 0, 1,
-1.012221, 0.4340001, -2.068355, 1, 0.9529412, 0, 1,
-1.009259, -1.362089, -3.442983, 1, 0.9607843, 0, 1,
-1.002432, -0.08680163, -2.78064, 1, 0.9647059, 0, 1,
-0.9968269, -1.034955, -1.56716, 1, 0.972549, 0, 1,
-0.9775159, 0.153873, -1.008919, 1, 0.9764706, 0, 1,
-0.9703763, 1.776956, 0.6764237, 1, 0.9843137, 0, 1,
-0.9662006, -0.5245142, -2.533268, 1, 0.9882353, 0, 1,
-0.9652475, -0.280414, -1.885218, 1, 0.9960784, 0, 1,
-0.963762, 0.3010578, -0.9693866, 0.9960784, 1, 0, 1,
-0.9637257, -2.061581, -0.4394849, 0.9921569, 1, 0, 1,
-0.9593414, 0.1553264, -2.104743, 0.9843137, 1, 0, 1,
-0.9574739, 0.09097938, -1.652681, 0.9803922, 1, 0, 1,
-0.9564644, 0.9295251, -1.857213, 0.972549, 1, 0, 1,
-0.9479815, 0.7647307, 0.7576981, 0.9686275, 1, 0, 1,
-0.9475943, -0.5712436, -3.185023, 0.9607843, 1, 0, 1,
-0.9442134, -0.9052044, -4.54589, 0.9568627, 1, 0, 1,
-0.9415581, -0.4377865, -0.9017128, 0.9490196, 1, 0, 1,
-0.9395211, -2.276871, -2.578339, 0.945098, 1, 0, 1,
-0.9391708, -0.8272384, -3.047826, 0.9372549, 1, 0, 1,
-0.9381685, -1.333505, -2.216736, 0.9333333, 1, 0, 1,
-0.937604, 0.6366483, -0.3813398, 0.9254902, 1, 0, 1,
-0.9341908, -0.8209139, -2.061148, 0.9215686, 1, 0, 1,
-0.9249741, 0.8671416, -1.863409, 0.9137255, 1, 0, 1,
-0.9117334, 2.305217, -2.708228, 0.9098039, 1, 0, 1,
-0.9102997, -0.08936045, -2.118624, 0.9019608, 1, 0, 1,
-0.9058664, 0.8022102, 0.935973, 0.8941177, 1, 0, 1,
-0.9029964, -0.9231846, -3.52602, 0.8901961, 1, 0, 1,
-0.9026821, -0.7945353, -1.679645, 0.8823529, 1, 0, 1,
-0.9003498, 0.3548978, -0.5617656, 0.8784314, 1, 0, 1,
-0.8953477, 0.5327362, 1.265402, 0.8705882, 1, 0, 1,
-0.8927264, -0.6612639, -2.14256, 0.8666667, 1, 0, 1,
-0.8896021, -1.45061, -3.110043, 0.8588235, 1, 0, 1,
-0.8822528, 0.02489868, -0.7805411, 0.854902, 1, 0, 1,
-0.8701468, -0.06413911, 0.7106388, 0.8470588, 1, 0, 1,
-0.8678944, -1.44986, -3.717824, 0.8431373, 1, 0, 1,
-0.8649092, 1.074796, -0.954101, 0.8352941, 1, 0, 1,
-0.8647981, 2.084291, -1.157034, 0.8313726, 1, 0, 1,
-0.8645706, -0.1574043, -1.391951, 0.8235294, 1, 0, 1,
-0.8625718, -1.389107, -2.232081, 0.8196079, 1, 0, 1,
-0.8595497, -2.439981, -3.571615, 0.8117647, 1, 0, 1,
-0.859301, -1.939351, -2.579991, 0.8078431, 1, 0, 1,
-0.8584848, 0.3439537, -1.999207, 0.8, 1, 0, 1,
-0.8535348, 0.1784503, -1.586987, 0.7921569, 1, 0, 1,
-0.851229, -1.110362, -0.2971229, 0.7882353, 1, 0, 1,
-0.8476879, -0.2188397, -1.582258, 0.7803922, 1, 0, 1,
-0.8410971, 0.4333559, -3.93815, 0.7764706, 1, 0, 1,
-0.8338864, 0.4140538, -0.6410232, 0.7686275, 1, 0, 1,
-0.8308467, 0.9497238, 0.6216301, 0.7647059, 1, 0, 1,
-0.8293887, 1.36762, -1.092353, 0.7568628, 1, 0, 1,
-0.8244362, -1.522949, -3.031873, 0.7529412, 1, 0, 1,
-0.8170292, -0.2944182, -1.060654, 0.7450981, 1, 0, 1,
-0.81204, 0.7412346, -1.445278, 0.7411765, 1, 0, 1,
-0.8102475, -1.438024, -3.291655, 0.7333333, 1, 0, 1,
-0.8081571, -1.590787, -3.569592, 0.7294118, 1, 0, 1,
-0.8053791, 0.2505071, -1.60912, 0.7215686, 1, 0, 1,
-0.7930638, 0.7110966, -0.4007687, 0.7176471, 1, 0, 1,
-0.7857908, 1.125631, -0.8899561, 0.7098039, 1, 0, 1,
-0.7804202, 0.376427, -2.226104, 0.7058824, 1, 0, 1,
-0.7786705, 1.412632, 0.1743549, 0.6980392, 1, 0, 1,
-0.7781136, -0.7448716, -0.4722774, 0.6901961, 1, 0, 1,
-0.7764587, -0.5531973, -2.822536, 0.6862745, 1, 0, 1,
-0.7705852, 0.6792864, -0.5060902, 0.6784314, 1, 0, 1,
-0.7671555, 2.190535, -0.3973078, 0.6745098, 1, 0, 1,
-0.7587466, 0.2159207, -1.501899, 0.6666667, 1, 0, 1,
-0.7519659, -0.2089713, -0.9700379, 0.6627451, 1, 0, 1,
-0.744991, -0.7523484, -2.086836, 0.654902, 1, 0, 1,
-0.7411246, -0.326301, 0.5412427, 0.6509804, 1, 0, 1,
-0.7400362, 0.7945108, -1.397681, 0.6431373, 1, 0, 1,
-0.7380964, -1.26279, -1.89442, 0.6392157, 1, 0, 1,
-0.7350553, -1.380486, -1.846935, 0.6313726, 1, 0, 1,
-0.73212, -0.04634839, -0.4604335, 0.627451, 1, 0, 1,
-0.7300518, 2.420665, 1.171764, 0.6196079, 1, 0, 1,
-0.7298599, 0.7071682, 1.433139, 0.6156863, 1, 0, 1,
-0.7291313, 0.2882396, -2.784504, 0.6078432, 1, 0, 1,
-0.7290086, -0.04673467, -1.432221, 0.6039216, 1, 0, 1,
-0.7279004, -0.4280605, -3.10103, 0.5960785, 1, 0, 1,
-0.7249619, 0.8589956, -2.339456, 0.5882353, 1, 0, 1,
-0.7207519, 0.1986163, -1.074574, 0.5843138, 1, 0, 1,
-0.7180533, -0.2156636, -2.611336, 0.5764706, 1, 0, 1,
-0.7156342, -2.544054, -3.496703, 0.572549, 1, 0, 1,
-0.7152764, -0.3249849, -1.944703, 0.5647059, 1, 0, 1,
-0.7101291, -1.100926, -3.0367, 0.5607843, 1, 0, 1,
-0.7081953, -0.8506238, -2.133666, 0.5529412, 1, 0, 1,
-0.699546, 0.7488198, -2.96602, 0.5490196, 1, 0, 1,
-0.6991848, -0.5376973, -3.690968, 0.5411765, 1, 0, 1,
-0.6976832, -0.1019199, -0.4399301, 0.5372549, 1, 0, 1,
-0.6951523, 0.927649, -1.14947, 0.5294118, 1, 0, 1,
-0.6947896, 0.6316683, -0.6101488, 0.5254902, 1, 0, 1,
-0.6899748, 0.1367219, -1.229261, 0.5176471, 1, 0, 1,
-0.6890502, -0.2667518, -1.463396, 0.5137255, 1, 0, 1,
-0.6832293, -2.291834, -1.350513, 0.5058824, 1, 0, 1,
-0.6826845, -0.7358541, -1.442249, 0.5019608, 1, 0, 1,
-0.6810607, -1.257985, -2.872118, 0.4941176, 1, 0, 1,
-0.6644273, -0.08636208, -1.520568, 0.4862745, 1, 0, 1,
-0.6618183, 0.1006997, -2.163262, 0.4823529, 1, 0, 1,
-0.6616278, -0.9027285, -1.921183, 0.4745098, 1, 0, 1,
-0.6601889, -0.5877928, -1.69999, 0.4705882, 1, 0, 1,
-0.6585022, 1.180948, 0.3780055, 0.4627451, 1, 0, 1,
-0.657037, 0.1782233, -2.038308, 0.4588235, 1, 0, 1,
-0.6531314, -0.4265594, -0.2654415, 0.4509804, 1, 0, 1,
-0.6486673, 0.02676111, -0.7744455, 0.4470588, 1, 0, 1,
-0.6478648, 0.8065795, -3.413692, 0.4392157, 1, 0, 1,
-0.6404772, -1.081416, -2.154451, 0.4352941, 1, 0, 1,
-0.6397992, -0.7810526, -4.510056, 0.427451, 1, 0, 1,
-0.6394776, 1.12313, 1.556089, 0.4235294, 1, 0, 1,
-0.6315752, 0.5309616, -0.2220881, 0.4156863, 1, 0, 1,
-0.6305579, -1.10191, -4.127779, 0.4117647, 1, 0, 1,
-0.6287174, -0.4946561, -2.361549, 0.4039216, 1, 0, 1,
-0.623257, -0.6163728, -0.9863818, 0.3960784, 1, 0, 1,
-0.6185783, -0.3906481, -0.3926612, 0.3921569, 1, 0, 1,
-0.6130585, 0.1177275, -2.375083, 0.3843137, 1, 0, 1,
-0.6124389, -0.3528348, -1.528733, 0.3803922, 1, 0, 1,
-0.6099882, 2.35174, -0.4749999, 0.372549, 1, 0, 1,
-0.6099561, 0.1874132, -2.33405, 0.3686275, 1, 0, 1,
-0.607405, -0.366645, -0.5095603, 0.3607843, 1, 0, 1,
-0.6055877, 1.390161, -0.4640711, 0.3568628, 1, 0, 1,
-0.6041941, -0.7885275, -2.594783, 0.3490196, 1, 0, 1,
-0.6008725, -1.275521, -2.738433, 0.345098, 1, 0, 1,
-0.5965731, -0.02296602, 0.315142, 0.3372549, 1, 0, 1,
-0.5962262, 0.2152712, -2.267936, 0.3333333, 1, 0, 1,
-0.592438, 0.3788722, -0.927682, 0.3254902, 1, 0, 1,
-0.5841855, 1.28309, -0.3026342, 0.3215686, 1, 0, 1,
-0.5808762, -0.671904, -3.017464, 0.3137255, 1, 0, 1,
-0.5806741, 0.2948805, -0.7992849, 0.3098039, 1, 0, 1,
-0.5782745, -1.097405, -1.658732, 0.3019608, 1, 0, 1,
-0.5743253, -0.8399603, -4.45087, 0.2941177, 1, 0, 1,
-0.5740513, -0.1338992, -0.6523293, 0.2901961, 1, 0, 1,
-0.567561, 2.04796, -2.118802, 0.282353, 1, 0, 1,
-0.5672258, 1.076572, -1.20004, 0.2784314, 1, 0, 1,
-0.5633457, -1.346348, -4.547931, 0.2705882, 1, 0, 1,
-0.5617724, -0.5823532, -1.002685, 0.2666667, 1, 0, 1,
-0.5569068, 0.2808463, -0.6962473, 0.2588235, 1, 0, 1,
-0.5533345, -0.5942741, -3.066841, 0.254902, 1, 0, 1,
-0.5497842, -1.008571, -2.87718, 0.2470588, 1, 0, 1,
-0.5473245, -1.812322, -1.873784, 0.2431373, 1, 0, 1,
-0.5450655, -0.754051, -3.111434, 0.2352941, 1, 0, 1,
-0.5420329, -0.7655545, -2.988393, 0.2313726, 1, 0, 1,
-0.5373335, 0.6323348, -0.5558982, 0.2235294, 1, 0, 1,
-0.5328224, 0.7200046, 2.364541, 0.2196078, 1, 0, 1,
-0.5298443, -2.307963, -0.2041545, 0.2117647, 1, 0, 1,
-0.5296732, -1.17566, -0.9592171, 0.2078431, 1, 0, 1,
-0.5262601, 0.1552413, -2.786301, 0.2, 1, 0, 1,
-0.5245238, -1.096757, -3.503622, 0.1921569, 1, 0, 1,
-0.523149, 1.161551, 0.1570588, 0.1882353, 1, 0, 1,
-0.5151551, 0.7874264, 2.160793, 0.1803922, 1, 0, 1,
-0.5081172, -0.5727594, -2.263026, 0.1764706, 1, 0, 1,
-0.5037099, 1.36768, -1.118923, 0.1686275, 1, 0, 1,
-0.5007179, 0.05953761, 0.6810392, 0.1647059, 1, 0, 1,
-0.4971086, 0.7885863, 0.194087, 0.1568628, 1, 0, 1,
-0.4957161, 1.410677, -0.833195, 0.1529412, 1, 0, 1,
-0.4954622, 1.671482, 0.4473278, 0.145098, 1, 0, 1,
-0.4880963, 0.003263856, -2.603697, 0.1411765, 1, 0, 1,
-0.4878471, 0.1274201, -0.9291072, 0.1333333, 1, 0, 1,
-0.4863671, -0.77618, -3.975097, 0.1294118, 1, 0, 1,
-0.4819574, -0.5579975, -2.242766, 0.1215686, 1, 0, 1,
-0.4814329, 0.2715866, 1.121869, 0.1176471, 1, 0, 1,
-0.4788103, 0.4995203, -2.332177, 0.1098039, 1, 0, 1,
-0.4781346, 0.3075063, 0.1937307, 0.1058824, 1, 0, 1,
-0.4768827, -0.7654583, -2.802243, 0.09803922, 1, 0, 1,
-0.4745382, -0.9052059, -5.096488, 0.09019608, 1, 0, 1,
-0.4715958, -0.352552, -2.456903, 0.08627451, 1, 0, 1,
-0.4705198, 0.6240347, -0.2417024, 0.07843138, 1, 0, 1,
-0.468543, 0.6134142, -1.264898, 0.07450981, 1, 0, 1,
-0.4684481, -0.3175458, -1.237584, 0.06666667, 1, 0, 1,
-0.4679747, 0.6242871, -2.828244, 0.0627451, 1, 0, 1,
-0.4664831, -0.1619841, -0.3807366, 0.05490196, 1, 0, 1,
-0.4655128, 0.3675905, -0.2248815, 0.05098039, 1, 0, 1,
-0.4631151, -0.5136981, -2.934991, 0.04313726, 1, 0, 1,
-0.4621465, -0.8434377, -3.660191, 0.03921569, 1, 0, 1,
-0.4555472, 2.494076, -1.014981, 0.03137255, 1, 0, 1,
-0.4542559, -0.8209751, -2.503996, 0.02745098, 1, 0, 1,
-0.4504031, -0.4549878, -3.357728, 0.01960784, 1, 0, 1,
-0.4501299, 1.653312, -1.898585, 0.01568628, 1, 0, 1,
-0.4498955, -0.3397814, -2.405568, 0.007843138, 1, 0, 1,
-0.4441246, -1.111416, -4.887418, 0.003921569, 1, 0, 1,
-0.4368985, 1.604503, -0.6939985, 0, 1, 0.003921569, 1,
-0.4351409, 0.3339302, -1.038929, 0, 1, 0.01176471, 1,
-0.4339419, -0.2912874, -2.812283, 0, 1, 0.01568628, 1,
-0.4318658, 1.280895, 0.2899898, 0, 1, 0.02352941, 1,
-0.4307537, 1.027136, -0.05513066, 0, 1, 0.02745098, 1,
-0.4303685, -1.339014, -4.215059, 0, 1, 0.03529412, 1,
-0.4222742, -0.4748583, -3.544524, 0, 1, 0.03921569, 1,
-0.4217279, -0.6358731, -2.541205, 0, 1, 0.04705882, 1,
-0.4217209, -1.070717, -3.933107, 0, 1, 0.05098039, 1,
-0.418258, -0.6717922, -2.90286, 0, 1, 0.05882353, 1,
-0.4139455, 0.3591535, -3.125759, 0, 1, 0.0627451, 1,
-0.4135053, 0.1522256, -1.906869, 0, 1, 0.07058824, 1,
-0.4127675, 0.4286419, -1.010487, 0, 1, 0.07450981, 1,
-0.4109559, -1.410671, -2.837547, 0, 1, 0.08235294, 1,
-0.4007896, 0.1641605, -1.131708, 0, 1, 0.08627451, 1,
-0.3972339, 0.6459947, 0.2094039, 0, 1, 0.09411765, 1,
-0.3956407, 0.4370449, 0.1783277, 0, 1, 0.1019608, 1,
-0.3933142, -0.09221503, -2.363432, 0, 1, 0.1058824, 1,
-0.3896432, 0.9766428, -0.5918977, 0, 1, 0.1137255, 1,
-0.3893076, 0.4937052, 0.9883382, 0, 1, 0.1176471, 1,
-0.3857487, -0.8315178, -0.7277651, 0, 1, 0.1254902, 1,
-0.3825797, -0.1542857, -2.0607, 0, 1, 0.1294118, 1,
-0.3810684, 1.352907, 0.5436382, 0, 1, 0.1372549, 1,
-0.3756736, -1.684982, -2.118791, 0, 1, 0.1411765, 1,
-0.3745043, -0.03194194, -0.2429153, 0, 1, 0.1490196, 1,
-0.3734137, -2.14983, -4.650466, 0, 1, 0.1529412, 1,
-0.3716702, 0.008359776, -0.6228544, 0, 1, 0.1607843, 1,
-0.3701108, 0.8438702, 0.4058433, 0, 1, 0.1647059, 1,
-0.3649087, -0.6834631, -3.279399, 0, 1, 0.172549, 1,
-0.3642146, 1.200683, -1.205691, 0, 1, 0.1764706, 1,
-0.3623093, 2.613869, 0.8555121, 0, 1, 0.1843137, 1,
-0.3593536, -0.8747136, -4.336751, 0, 1, 0.1882353, 1,
-0.3583983, 0.3343506, -0.9434995, 0, 1, 0.1960784, 1,
-0.3577532, -0.2474383, -3.177228, 0, 1, 0.2039216, 1,
-0.3566194, 0.1016954, -1.791551, 0, 1, 0.2078431, 1,
-0.3541441, -0.424225, -2.814267, 0, 1, 0.2156863, 1,
-0.3492003, -0.8925643, -1.738667, 0, 1, 0.2196078, 1,
-0.3482582, -0.2450985, -1.214206, 0, 1, 0.227451, 1,
-0.3439629, 1.122419, 0.9226053, 0, 1, 0.2313726, 1,
-0.3428111, 0.2953573, -0.3630535, 0, 1, 0.2392157, 1,
-0.3414058, 0.4566278, -0.4345092, 0, 1, 0.2431373, 1,
-0.335728, 0.7313529, -0.8640375, 0, 1, 0.2509804, 1,
-0.33014, -0.8428943, -3.427332, 0, 1, 0.254902, 1,
-0.3201253, -0.2056898, -1.713119, 0, 1, 0.2627451, 1,
-0.318367, -0.8285389, -4.964102, 0, 1, 0.2666667, 1,
-0.3176402, -0.9648499, -2.635018, 0, 1, 0.2745098, 1,
-0.3152968, 1.031334, 2.113892, 0, 1, 0.2784314, 1,
-0.3114251, 0.3328623, -0.8456635, 0, 1, 0.2862745, 1,
-0.3109091, -1.606207, -3.475129, 0, 1, 0.2901961, 1,
-0.3063921, -1.033146, -3.005079, 0, 1, 0.2980392, 1,
-0.2981189, 0.6281499, -2.236042, 0, 1, 0.3058824, 1,
-0.295903, 0.5433482, 0.6884704, 0, 1, 0.3098039, 1,
-0.2945828, 0.7312873, -0.4041086, 0, 1, 0.3176471, 1,
-0.2927387, 0.1403132, -1.292004, 0, 1, 0.3215686, 1,
-0.2916169, -1.024318, -3.961932, 0, 1, 0.3294118, 1,
-0.287151, 1.304577, -1.987761, 0, 1, 0.3333333, 1,
-0.2871272, -0.02044956, -2.33119, 0, 1, 0.3411765, 1,
-0.2856355, -0.1777369, -1.688734, 0, 1, 0.345098, 1,
-0.2826261, -0.5151371, -0.8928111, 0, 1, 0.3529412, 1,
-0.2791411, -1.931832, -3.452433, 0, 1, 0.3568628, 1,
-0.2760172, 0.0878419, -2.683389, 0, 1, 0.3647059, 1,
-0.2752917, 1.816311, 0.1572095, 0, 1, 0.3686275, 1,
-0.2732668, 0.7230255, -0.5050274, 0, 1, 0.3764706, 1,
-0.2688316, -0.7886264, -2.495949, 0, 1, 0.3803922, 1,
-0.2673047, 0.04271199, -4.258044, 0, 1, 0.3882353, 1,
-0.2615229, -0.05799288, -2.565913, 0, 1, 0.3921569, 1,
-0.2609312, 1.372062, 0.621847, 0, 1, 0.4, 1,
-0.2576152, 0.7674801, 0.9530379, 0, 1, 0.4078431, 1,
-0.2572695, -2.622208, -4.256279, 0, 1, 0.4117647, 1,
-0.2571223, -0.5035897, -3.152973, 0, 1, 0.4196078, 1,
-0.2563654, -0.3589344, -3.273237, 0, 1, 0.4235294, 1,
-0.2560486, 0.5092127, -0.389623, 0, 1, 0.4313726, 1,
-0.2557244, 0.2906682, -1.810323, 0, 1, 0.4352941, 1,
-0.2492819, 0.5790745, -0.341119, 0, 1, 0.4431373, 1,
-0.2479781, -1.031543, -2.424436, 0, 1, 0.4470588, 1,
-0.2424405, 0.1351178, -1.300585, 0, 1, 0.454902, 1,
-0.2405096, 0.8900843, 1.245992, 0, 1, 0.4588235, 1,
-0.2383791, -0.8572991, -3.347406, 0, 1, 0.4666667, 1,
-0.2379042, -1.940778, -3.530787, 0, 1, 0.4705882, 1,
-0.2305332, -0.6094866, -4.109641, 0, 1, 0.4784314, 1,
-0.2303526, 0.631983, 0.5924903, 0, 1, 0.4823529, 1,
-0.2286876, -0.6290581, -3.384668, 0, 1, 0.4901961, 1,
-0.2239145, -0.0909398, -2.044585, 0, 1, 0.4941176, 1,
-0.2223929, -0.02365098, -3.224845, 0, 1, 0.5019608, 1,
-0.222138, 0.205985, -0.6703998, 0, 1, 0.509804, 1,
-0.2215264, 1.075856, -0.2991944, 0, 1, 0.5137255, 1,
-0.2204935, 0.191664, -1.838776, 0, 1, 0.5215687, 1,
-0.2193945, 0.4147572, 0.534326, 0, 1, 0.5254902, 1,
-0.2170036, -0.7051224, -2.664411, 0, 1, 0.5333334, 1,
-0.2163683, -1.925004, -2.836821, 0, 1, 0.5372549, 1,
-0.2117059, -1.939924, -4.105634, 0, 1, 0.5450981, 1,
-0.2116989, -1.336092, -0.9458376, 0, 1, 0.5490196, 1,
-0.2106624, 0.4198335, -0.6828894, 0, 1, 0.5568628, 1,
-0.2099413, 0.776075, 0.8403012, 0, 1, 0.5607843, 1,
-0.2074261, 0.5548421, -0.6450214, 0, 1, 0.5686275, 1,
-0.2039132, -0.7755284, -3.560388, 0, 1, 0.572549, 1,
-0.203465, -1.721048, -2.505568, 0, 1, 0.5803922, 1,
-0.2032129, 0.8634519, 0.01268683, 0, 1, 0.5843138, 1,
-0.1991558, -0.8724107, -2.228567, 0, 1, 0.5921569, 1,
-0.1974897, -0.2848217, -4.639081, 0, 1, 0.5960785, 1,
-0.1970963, -0.937426, -2.236312, 0, 1, 0.6039216, 1,
-0.1963554, -0.3628899, -3.981559, 0, 1, 0.6117647, 1,
-0.1943674, 0.02283325, -3.240222, 0, 1, 0.6156863, 1,
-0.1855954, 0.1398467, -0.8637152, 0, 1, 0.6235294, 1,
-0.1800895, -0.2314951, -1.129166, 0, 1, 0.627451, 1,
-0.1755491, 0.7544879, 0.1144702, 0, 1, 0.6352941, 1,
-0.1749751, -0.03075024, -1.860045, 0, 1, 0.6392157, 1,
-0.1723779, -0.5909018, -2.362677, 0, 1, 0.6470588, 1,
-0.1706092, -0.2347345, -2.277323, 0, 1, 0.6509804, 1,
-0.1667762, -0.2702257, -2.910763, 0, 1, 0.6588235, 1,
-0.1659381, -1.984617, -3.135223, 0, 1, 0.6627451, 1,
-0.1639351, 0.6132872, 0.2537096, 0, 1, 0.6705883, 1,
-0.1579167, 1.435586, 0.2957163, 0, 1, 0.6745098, 1,
-0.1554379, 0.1132729, 0.1712596, 0, 1, 0.682353, 1,
-0.1541358, 0.04404892, -2.115611, 0, 1, 0.6862745, 1,
-0.1533867, -0.4409071, -2.502573, 0, 1, 0.6941177, 1,
-0.14689, -0.08606313, -2.827793, 0, 1, 0.7019608, 1,
-0.1467696, -1.412246, -0.8843345, 0, 1, 0.7058824, 1,
-0.1454389, -1.490682, -2.444351, 0, 1, 0.7137255, 1,
-0.1390795, -2.090056, -3.965087, 0, 1, 0.7176471, 1,
-0.1369916, -0.4438807, -2.096323, 0, 1, 0.7254902, 1,
-0.1363586, 0.1802376, 0.1264279, 0, 1, 0.7294118, 1,
-0.1320518, 0.7854191, -1.177834, 0, 1, 0.7372549, 1,
-0.1316717, -1.285576, -2.130085, 0, 1, 0.7411765, 1,
-0.1307997, -2.206442, -3.397695, 0, 1, 0.7490196, 1,
-0.1287257, -0.4489779, -4.025799, 0, 1, 0.7529412, 1,
-0.1262582, 0.8644215, 0.7137312, 0, 1, 0.7607843, 1,
-0.1257302, 0.7107992, -1.700557, 0, 1, 0.7647059, 1,
-0.1187174, -1.74512, -3.205008, 0, 1, 0.772549, 1,
-0.1170211, -1.170028, -1.805974, 0, 1, 0.7764706, 1,
-0.1158373, -0.6590204, -3.147442, 0, 1, 0.7843137, 1,
-0.1141564, -0.4958881, -4.757562, 0, 1, 0.7882353, 1,
-0.1117472, -0.1452402, -1.544813, 0, 1, 0.7960784, 1,
-0.1072635, 0.1634038, -0.2209735, 0, 1, 0.8039216, 1,
-0.1035605, 0.1720009, -0.03347735, 0, 1, 0.8078431, 1,
-0.1018948, -0.6045164, -3.15841, 0, 1, 0.8156863, 1,
-0.09747373, -1.904297, -1.732327, 0, 1, 0.8196079, 1,
-0.09683751, 0.7135291, -1.357417, 0, 1, 0.827451, 1,
-0.09582912, -1.01793, -4.167178, 0, 1, 0.8313726, 1,
-0.09347978, -0.0357249, -1.664785, 0, 1, 0.8392157, 1,
-0.0895004, -0.5375224, -4.210665, 0, 1, 0.8431373, 1,
-0.08843893, 0.4876606, 1.233534, 0, 1, 0.8509804, 1,
-0.08834212, 1.569626, 0.1511608, 0, 1, 0.854902, 1,
-0.08485216, -1.002766, -1.625449, 0, 1, 0.8627451, 1,
-0.07866595, -0.0523619, -3.781627, 0, 1, 0.8666667, 1,
-0.07751466, 0.6342906, -0.4304861, 0, 1, 0.8745098, 1,
-0.07627974, -1.087967, -2.909771, 0, 1, 0.8784314, 1,
-0.07438294, -0.462752, -3.413077, 0, 1, 0.8862745, 1,
-0.07325508, -0.6322204, -0.6000711, 0, 1, 0.8901961, 1,
-0.07198229, -0.3584619, -3.019289, 0, 1, 0.8980392, 1,
-0.07065392, -0.1538317, -2.091166, 0, 1, 0.9058824, 1,
-0.06962556, -1.992192, -2.806774, 0, 1, 0.9098039, 1,
-0.0694226, 1.825581, -1.032416, 0, 1, 0.9176471, 1,
-0.06242545, -0.6694656, -3.341906, 0, 1, 0.9215686, 1,
-0.05801578, -0.4331751, -2.868317, 0, 1, 0.9294118, 1,
-0.05018879, 0.8696569, 0.3183623, 0, 1, 0.9333333, 1,
-0.04680971, -0.5566685, -5.579606, 0, 1, 0.9411765, 1,
-0.0454655, 0.9749164, -0.7779269, 0, 1, 0.945098, 1,
-0.03955816, -1.071889, -3.253936, 0, 1, 0.9529412, 1,
-0.03869658, 1.176299, 1.305851, 0, 1, 0.9568627, 1,
-0.03532414, -0.8683169, -0.8353778, 0, 1, 0.9647059, 1,
-0.03483742, -0.4477291, -1.537058, 0, 1, 0.9686275, 1,
-0.03313113, 0.9509318, 1.335227, 0, 1, 0.9764706, 1,
-0.03254605, 1.591759, -0.3168885, 0, 1, 0.9803922, 1,
-0.03091124, -1.089583, -4.264677, 0, 1, 0.9882353, 1,
-0.02899461, 0.3723451, 0.1700503, 0, 1, 0.9921569, 1,
-0.02797445, 0.756521, 1.435367, 0, 1, 1, 1,
-0.0260058, 1.602569, -1.088979, 0, 0.9921569, 1, 1,
-0.02014884, -0.1647139, -3.113519, 0, 0.9882353, 1, 1,
-0.01364344, 0.7237883, 1.379433, 0, 0.9803922, 1, 1,
-0.01170267, 1.081959, 0.2342777, 0, 0.9764706, 1, 1,
-0.01022963, 0.743066, -2.908878, 0, 0.9686275, 1, 1,
-0.009714866, -0.8375857, -3.580114, 0, 0.9647059, 1, 1,
-0.00813453, 0.9425091, -0.8306801, 0, 0.9568627, 1, 1,
-0.00723902, -0.6484752, -4.574048, 0, 0.9529412, 1, 1,
-0.0050624, -0.4649988, -2.424324, 0, 0.945098, 1, 1,
-0.003779988, 0.6063913, -0.1737129, 0, 0.9411765, 1, 1,
-0.003494562, -0.8031117, -2.878488, 0, 0.9333333, 1, 1,
-0.003132319, -0.4696152, -4.181364, 0, 0.9294118, 1, 1,
0.0004093469, -0.5691771, 1.995099, 0, 0.9215686, 1, 1,
0.001142945, -1.399303, 1.893093, 0, 0.9176471, 1, 1,
0.00147556, -1.867994, 3.767567, 0, 0.9098039, 1, 1,
0.005738137, 1.422549, -0.9935119, 0, 0.9058824, 1, 1,
0.007521048, 0.1390876, 0.4996628, 0, 0.8980392, 1, 1,
0.008427161, 0.706602, 0.6010404, 0, 0.8901961, 1, 1,
0.009190448, -0.5633631, 3.316376, 0, 0.8862745, 1, 1,
0.01045337, 2.745483, 0.9184029, 0, 0.8784314, 1, 1,
0.01075374, 1.602523, 0.3126002, 0, 0.8745098, 1, 1,
0.01112385, 0.215527, -0.05769398, 0, 0.8666667, 1, 1,
0.01113362, 0.937746, -1.23606, 0, 0.8627451, 1, 1,
0.0158994, 0.08558703, 0.4557995, 0, 0.854902, 1, 1,
0.01644585, 0.8321003, -1.172595, 0, 0.8509804, 1, 1,
0.02058082, 1.64586, 1.20591, 0, 0.8431373, 1, 1,
0.02073006, 0.4574792, 0.1599348, 0, 0.8392157, 1, 1,
0.02182228, 0.2663729, 0.1480653, 0, 0.8313726, 1, 1,
0.02183318, 1.617146, 1.154247, 0, 0.827451, 1, 1,
0.02513874, 1.860386, 0.3231434, 0, 0.8196079, 1, 1,
0.02906214, -0.09908628, 2.214274, 0, 0.8156863, 1, 1,
0.0299081, 2.141, 1.564698, 0, 0.8078431, 1, 1,
0.03245097, -1.077262, 2.003384, 0, 0.8039216, 1, 1,
0.03294612, 0.7675283, 0.07766441, 0, 0.7960784, 1, 1,
0.03798359, -0.1929993, 0.4099681, 0, 0.7882353, 1, 1,
0.03871094, 1.505123, -2.189596, 0, 0.7843137, 1, 1,
0.04127839, 0.1829941, -0.6508074, 0, 0.7764706, 1, 1,
0.05226371, 0.7829, 0.3435961, 0, 0.772549, 1, 1,
0.05249894, -0.1122972, 0.6682984, 0, 0.7647059, 1, 1,
0.05790544, 0.1815368, 0.34044, 0, 0.7607843, 1, 1,
0.05866246, -0.9114285, 2.880212, 0, 0.7529412, 1, 1,
0.0612727, -0.0468329, 2.460454, 0, 0.7490196, 1, 1,
0.06183581, 0.04570127, 1.778894, 0, 0.7411765, 1, 1,
0.06730519, 0.9696504, -0.1773147, 0, 0.7372549, 1, 1,
0.06802606, -0.3804601, 3.801013, 0, 0.7294118, 1, 1,
0.073222, 1.811792, 0.4371572, 0, 0.7254902, 1, 1,
0.07892914, 0.2742819, 0.4104916, 0, 0.7176471, 1, 1,
0.08155845, 0.7107294, -1.297065, 0, 0.7137255, 1, 1,
0.08217924, 0.9773439, 0.6314407, 0, 0.7058824, 1, 1,
0.08355096, 0.7938926, -1.088037, 0, 0.6980392, 1, 1,
0.08378683, -2.547738, 2.55851, 0, 0.6941177, 1, 1,
0.08476117, -0.004581352, 2.171732, 0, 0.6862745, 1, 1,
0.08800261, -0.1400992, 3.974488, 0, 0.682353, 1, 1,
0.0937886, -0.4947529, 3.281519, 0, 0.6745098, 1, 1,
0.09430975, 0.6625112, -0.470463, 0, 0.6705883, 1, 1,
0.09846129, 2.274246, -1.320985, 0, 0.6627451, 1, 1,
0.09897329, 0.04120762, 1.287684, 0, 0.6588235, 1, 1,
0.09904781, -1.017592, 2.553923, 0, 0.6509804, 1, 1,
0.1001579, 0.8705809, 1.019609, 0, 0.6470588, 1, 1,
0.1059279, -0.3383859, 3.701898, 0, 0.6392157, 1, 1,
0.1068194, -0.07805945, 0.8770043, 0, 0.6352941, 1, 1,
0.1069205, 1.124677, -0.2758937, 0, 0.627451, 1, 1,
0.1076381, -0.5757406, 3.151851, 0, 0.6235294, 1, 1,
0.1095003, -1.663301, 3.434824, 0, 0.6156863, 1, 1,
0.1130659, 0.3514431, -0.09334809, 0, 0.6117647, 1, 1,
0.1146769, -0.01065089, 2.81495, 0, 0.6039216, 1, 1,
0.1151688, 1.212381, -0.1244961, 0, 0.5960785, 1, 1,
0.1159076, -0.1291161, 2.050233, 0, 0.5921569, 1, 1,
0.1192633, -1.483646, 2.664587, 0, 0.5843138, 1, 1,
0.1204909, -1.003476, 3.182432, 0, 0.5803922, 1, 1,
0.1258593, 1.940534, 0.3660454, 0, 0.572549, 1, 1,
0.1274028, 0.94472, -0.1252616, 0, 0.5686275, 1, 1,
0.127999, 0.3466304, 1.115058, 0, 0.5607843, 1, 1,
0.1294205, 0.2586511, -1.757416, 0, 0.5568628, 1, 1,
0.1322839, 0.7096339, 0.2994311, 0, 0.5490196, 1, 1,
0.1323982, 1.079574, 0.5464917, 0, 0.5450981, 1, 1,
0.1390612, -1.981999, 3.204905, 0, 0.5372549, 1, 1,
0.1418231, 0.4153131, 2.283472, 0, 0.5333334, 1, 1,
0.1476153, 0.1937864, 0.4815369, 0, 0.5254902, 1, 1,
0.1521927, -0.3567935, 2.486341, 0, 0.5215687, 1, 1,
0.1540757, 0.04874754, -0.598711, 0, 0.5137255, 1, 1,
0.1556467, -0.1313096, 2.60276, 0, 0.509804, 1, 1,
0.1569291, -0.5986982, 2.332703, 0, 0.5019608, 1, 1,
0.1596463, -0.6002514, 0.551968, 0, 0.4941176, 1, 1,
0.159697, -1.5017, 2.069946, 0, 0.4901961, 1, 1,
0.1600223, 0.4101229, -1.071323, 0, 0.4823529, 1, 1,
0.1605536, 1.219273, -0.3021736, 0, 0.4784314, 1, 1,
0.163094, -1.354063, 3.144588, 0, 0.4705882, 1, 1,
0.1631095, -2.406673, 2.929203, 0, 0.4666667, 1, 1,
0.165064, 1.202768, 0.3018637, 0, 0.4588235, 1, 1,
0.1676029, 0.1031779, 1.473518, 0, 0.454902, 1, 1,
0.1698556, -0.33797, 1.286873, 0, 0.4470588, 1, 1,
0.1713944, -1.621045, 3.259586, 0, 0.4431373, 1, 1,
0.1732198, -0.9324723, 1.931657, 0, 0.4352941, 1, 1,
0.1733264, -1.645044, 2.795958, 0, 0.4313726, 1, 1,
0.1783156, -0.5724558, 3.302877, 0, 0.4235294, 1, 1,
0.1800777, 0.01086129, 1.823295, 0, 0.4196078, 1, 1,
0.1809196, 0.1615174, 1.165729, 0, 0.4117647, 1, 1,
0.1825684, -0.04288569, 1.291741, 0, 0.4078431, 1, 1,
0.1833298, 0.9689666, 0.5393715, 0, 0.4, 1, 1,
0.1840892, -0.2179605, 2.148947, 0, 0.3921569, 1, 1,
0.2006999, 0.7839198, -0.6538975, 0, 0.3882353, 1, 1,
0.204695, 1.287006, 1.231273, 0, 0.3803922, 1, 1,
0.2062436, 0.0330728, -0.4477751, 0, 0.3764706, 1, 1,
0.2064817, -0.2494161, 2.265853, 0, 0.3686275, 1, 1,
0.2217442, 1.65677, 0.9783062, 0, 0.3647059, 1, 1,
0.2256236, 0.6963912, 1.584009, 0, 0.3568628, 1, 1,
0.2290888, -0.4641721, 0.2566461, 0, 0.3529412, 1, 1,
0.2303611, 1.981577, 0.8563857, 0, 0.345098, 1, 1,
0.2305125, -0.9552161, 2.870698, 0, 0.3411765, 1, 1,
0.2340458, -1.083768, 1.350278, 0, 0.3333333, 1, 1,
0.2367629, -0.3399964, 3.187809, 0, 0.3294118, 1, 1,
0.2394992, 0.1768192, 3.289412, 0, 0.3215686, 1, 1,
0.2400762, 0.5290146, 0.07369338, 0, 0.3176471, 1, 1,
0.2458, -1.232438, 1.915777, 0, 0.3098039, 1, 1,
0.2478775, 0.3474258, 1.842317, 0, 0.3058824, 1, 1,
0.2518977, 0.3673443, 0.5345871, 0, 0.2980392, 1, 1,
0.2601846, -0.8398257, 4.3561, 0, 0.2901961, 1, 1,
0.2603196, -0.7543675, 3.374095, 0, 0.2862745, 1, 1,
0.26426, 0.861921, 2.164959, 0, 0.2784314, 1, 1,
0.2680025, 2.584458, -0.2171967, 0, 0.2745098, 1, 1,
0.2700305, 0.04134441, 1.231689, 0, 0.2666667, 1, 1,
0.2783536, 0.5383506, 1.053291, 0, 0.2627451, 1, 1,
0.2792668, -1.188511, 3.567311, 0, 0.254902, 1, 1,
0.2822814, -0.1663362, 1.182693, 0, 0.2509804, 1, 1,
0.2837224, -0.4554201, 1.606575, 0, 0.2431373, 1, 1,
0.2856004, 1.936106, 0.3863701, 0, 0.2392157, 1, 1,
0.2871912, -0.07198421, 2.090503, 0, 0.2313726, 1, 1,
0.2885487, 1.069047, 1.213075, 0, 0.227451, 1, 1,
0.2893488, 0.190819, 0.06664098, 0, 0.2196078, 1, 1,
0.2933701, 1.283533, -0.6016458, 0, 0.2156863, 1, 1,
0.2972183, -1.189442, 4.319157, 0, 0.2078431, 1, 1,
0.3051657, -0.4583745, 1.862545, 0, 0.2039216, 1, 1,
0.3081415, -0.9658456, 1.945035, 0, 0.1960784, 1, 1,
0.310679, 0.8391974, 1.550192, 0, 0.1882353, 1, 1,
0.3126621, -0.8003873, 2.403799, 0, 0.1843137, 1, 1,
0.3162559, -0.9971876, 3.89379, 0, 0.1764706, 1, 1,
0.3169138, 1.056338, 0.4344079, 0, 0.172549, 1, 1,
0.3236885, -0.07138145, 3.238795, 0, 0.1647059, 1, 1,
0.3290142, 1.36784, 1.01279, 0, 0.1607843, 1, 1,
0.3303272, -0.8227969, 3.013283, 0, 0.1529412, 1, 1,
0.3318178, 0.434232, 1.480826, 0, 0.1490196, 1, 1,
0.3323091, 1.097253, 0.7403671, 0, 0.1411765, 1, 1,
0.3355273, 1.033396, -0.01914972, 0, 0.1372549, 1, 1,
0.3361728, 0.6265628, 1.188689, 0, 0.1294118, 1, 1,
0.3388255, -0.6311688, 1.549859, 0, 0.1254902, 1, 1,
0.3432035, -0.4948424, 2.989708, 0, 0.1176471, 1, 1,
0.3444404, 1.745548, 0.2414602, 0, 0.1137255, 1, 1,
0.348178, 0.5176512, 1.151185, 0, 0.1058824, 1, 1,
0.3498283, 1.282591, -0.6157315, 0, 0.09803922, 1, 1,
0.3596613, -1.335398, 3.589141, 0, 0.09411765, 1, 1,
0.3600276, 1.501835, -1.20061, 0, 0.08627451, 1, 1,
0.3625652, 0.6749179, 1.105466, 0, 0.08235294, 1, 1,
0.3650129, 0.02178192, 1.708603, 0, 0.07450981, 1, 1,
0.3654391, -0.1868216, 0.5390323, 0, 0.07058824, 1, 1,
0.3675404, -0.2064712, 1.635341, 0, 0.0627451, 1, 1,
0.3681624, 0.4244964, -0.9636799, 0, 0.05882353, 1, 1,
0.3785416, 1.881097, -0.345093, 0, 0.05098039, 1, 1,
0.3825874, 1.832009, 0.5313694, 0, 0.04705882, 1, 1,
0.3836419, -0.103044, 2.313392, 0, 0.03921569, 1, 1,
0.3838199, 1.28267, -0.08196548, 0, 0.03529412, 1, 1,
0.386604, 0.7512362, -0.4732037, 0, 0.02745098, 1, 1,
0.3993113, 0.9876075, 0.3805653, 0, 0.02352941, 1, 1,
0.4015518, 0.1488058, -0.8475702, 0, 0.01568628, 1, 1,
0.4063056, 0.783572, 0.7278111, 0, 0.01176471, 1, 1,
0.4078571, -0.8591422, 3.988803, 0, 0.003921569, 1, 1,
0.4122663, -0.5829095, 1.802618, 0.003921569, 0, 1, 1,
0.4161968, -1.228146, 3.014275, 0.007843138, 0, 1, 1,
0.4164697, -1.403127, 2.81058, 0.01568628, 0, 1, 1,
0.4173014, 1.213191, 1.249023, 0.01960784, 0, 1, 1,
0.4177557, -1.061983, 2.895901, 0.02745098, 0, 1, 1,
0.4273599, -2.26819, 4.277306, 0.03137255, 0, 1, 1,
0.4302572, -0.4933396, 1.415587, 0.03921569, 0, 1, 1,
0.4306006, 0.4142158, 2.16426, 0.04313726, 0, 1, 1,
0.4308164, 0.6274174, -0.2898652, 0.05098039, 0, 1, 1,
0.4330463, 0.2829016, 0.5021129, 0.05490196, 0, 1, 1,
0.4434084, -0.9426674, 5.630918, 0.0627451, 0, 1, 1,
0.4476975, 1.416193, 0.1547771, 0.06666667, 0, 1, 1,
0.4672866, -0.2000167, 1.816039, 0.07450981, 0, 1, 1,
0.4709266, 0.3463337, 1.467378, 0.07843138, 0, 1, 1,
0.4723814, 0.3952954, 2.609627, 0.08627451, 0, 1, 1,
0.4727885, 1.035467, 0.005557866, 0.09019608, 0, 1, 1,
0.4783118, 0.01571043, 1.324267, 0.09803922, 0, 1, 1,
0.4803792, 0.2399927, 1.99061, 0.1058824, 0, 1, 1,
0.4822701, -0.8715376, 4.869643, 0.1098039, 0, 1, 1,
0.4869113, 0.113178, 0.8594713, 0.1176471, 0, 1, 1,
0.4934585, -0.9425265, 2.049321, 0.1215686, 0, 1, 1,
0.4959496, 0.2970968, 1.550563, 0.1294118, 0, 1, 1,
0.4967441, -0.7294213, 2.734086, 0.1333333, 0, 1, 1,
0.5024029, -1.393553, 3.594321, 0.1411765, 0, 1, 1,
0.5026973, 0.4214214, 0.2859949, 0.145098, 0, 1, 1,
0.5028154, 1.508381, -0.1715947, 0.1529412, 0, 1, 1,
0.5035487, 0.3342308, 0.09802421, 0.1568628, 0, 1, 1,
0.5051753, 1.24502, 1.237309, 0.1647059, 0, 1, 1,
0.5059804, -0.330558, 2.485507, 0.1686275, 0, 1, 1,
0.5066433, 0.6222748, 3.588152, 0.1764706, 0, 1, 1,
0.5073869, 1.143125, 0.8067804, 0.1803922, 0, 1, 1,
0.5094747, 0.4624208, 0.3303417, 0.1882353, 0, 1, 1,
0.510187, -1.648591, 3.261065, 0.1921569, 0, 1, 1,
0.5119063, 1.931905, -0.4805083, 0.2, 0, 1, 1,
0.5130095, 0.1575542, 0.9378856, 0.2078431, 0, 1, 1,
0.5150847, 1.140543, 0.1163455, 0.2117647, 0, 1, 1,
0.5252199, -1.938478, 5.117929, 0.2196078, 0, 1, 1,
0.5300202, 0.321104, 0.9682595, 0.2235294, 0, 1, 1,
0.5311775, -0.3784926, 1.53258, 0.2313726, 0, 1, 1,
0.5364642, 0.2202817, 2.222374, 0.2352941, 0, 1, 1,
0.5373052, -1.520195, 2.071606, 0.2431373, 0, 1, 1,
0.540076, -0.6634174, 1.710487, 0.2470588, 0, 1, 1,
0.5427914, -0.8368987, 2.850026, 0.254902, 0, 1, 1,
0.5439846, -0.08029571, -0.139291, 0.2588235, 0, 1, 1,
0.5529978, 0.2013819, 2.261955, 0.2666667, 0, 1, 1,
0.553867, 0.5047041, -0.3407947, 0.2705882, 0, 1, 1,
0.560859, -0.9612436, 2.204566, 0.2784314, 0, 1, 1,
0.5608941, 1.705136, 0.4927265, 0.282353, 0, 1, 1,
0.5621155, 1.746749, 0.02467697, 0.2901961, 0, 1, 1,
0.5622315, -0.9282617, 2.0216, 0.2941177, 0, 1, 1,
0.5634515, -0.2677324, 1.51869, 0.3019608, 0, 1, 1,
0.5654664, -1.824035, 3.252864, 0.3098039, 0, 1, 1,
0.5744424, 0.9685122, 1.289703, 0.3137255, 0, 1, 1,
0.5800765, 0.1973958, 1.439659, 0.3215686, 0, 1, 1,
0.5827011, -1.020455, 3.607689, 0.3254902, 0, 1, 1,
0.5838071, -0.1444618, 1.475086, 0.3333333, 0, 1, 1,
0.5840874, -0.540659, 3.052857, 0.3372549, 0, 1, 1,
0.5862462, 1.447725, -0.002307196, 0.345098, 0, 1, 1,
0.5930898, 0.8707625, 1.684951, 0.3490196, 0, 1, 1,
0.5958207, 0.3391896, 0.1561159, 0.3568628, 0, 1, 1,
0.5979595, -0.2221197, 2.025124, 0.3607843, 0, 1, 1,
0.5990887, 0.4745464, 0.03867298, 0.3686275, 0, 1, 1,
0.6023658, -0.5702721, 2.451427, 0.372549, 0, 1, 1,
0.6060232, -1.28673, 3.412887, 0.3803922, 0, 1, 1,
0.6069436, 0.6810193, 0.1403587, 0.3843137, 0, 1, 1,
0.6080184, -0.4138449, 2.813213, 0.3921569, 0, 1, 1,
0.608831, -1.743989, 4.434374, 0.3960784, 0, 1, 1,
0.629091, 0.5662993, 1.715519, 0.4039216, 0, 1, 1,
0.6305124, -0.2126696, 2.824459, 0.4117647, 0, 1, 1,
0.6420308, -0.8621111, 3.102548, 0.4156863, 0, 1, 1,
0.6470724, 1.314308, -0.2973831, 0.4235294, 0, 1, 1,
0.6486842, -0.166557, 0.1212131, 0.427451, 0, 1, 1,
0.6498169, 1.164984, 1.299643, 0.4352941, 0, 1, 1,
0.6564475, 0.02192454, 0.9044937, 0.4392157, 0, 1, 1,
0.6597871, -0.5294411, 0.9285808, 0.4470588, 0, 1, 1,
0.6624345, -0.1309256, 2.54883, 0.4509804, 0, 1, 1,
0.6642761, -1.585489, 1.771766, 0.4588235, 0, 1, 1,
0.6660932, -1.856663, 3.4578, 0.4627451, 0, 1, 1,
0.6684817, 1.366507, 3.004662, 0.4705882, 0, 1, 1,
0.6697552, -1.188252, 1.565195, 0.4745098, 0, 1, 1,
0.6712714, 1.315848, 1.410222, 0.4823529, 0, 1, 1,
0.6714815, 0.4350419, 2.031555, 0.4862745, 0, 1, 1,
0.6781597, 0.2138974, 2.432416, 0.4941176, 0, 1, 1,
0.6833247, -0.2585431, 2.375978, 0.5019608, 0, 1, 1,
0.6864226, -0.6599907, 3.066426, 0.5058824, 0, 1, 1,
0.691373, 0.4375237, 0.8616951, 0.5137255, 0, 1, 1,
0.6916009, 0.3992069, 1.126532, 0.5176471, 0, 1, 1,
0.6946719, -1.198026, 3.265044, 0.5254902, 0, 1, 1,
0.6947005, -0.914381, 2.609608, 0.5294118, 0, 1, 1,
0.6966162, 0.9609572, 0.5642686, 0.5372549, 0, 1, 1,
0.6966732, 0.3461357, 1.39743, 0.5411765, 0, 1, 1,
0.6970642, 1.4844, 1.120257, 0.5490196, 0, 1, 1,
0.697868, -0.9472743, 2.548918, 0.5529412, 0, 1, 1,
0.7093364, -1.075335, 4.405409, 0.5607843, 0, 1, 1,
0.7191084, -0.9627146, 2.345034, 0.5647059, 0, 1, 1,
0.7194398, -0.1613369, 1.711009, 0.572549, 0, 1, 1,
0.7218086, 0.3014489, 1.812938, 0.5764706, 0, 1, 1,
0.727065, 0.7803693, 1.443516, 0.5843138, 0, 1, 1,
0.7437447, 0.1930806, 1.377125, 0.5882353, 0, 1, 1,
0.7532193, -0.8502288, 0.9017092, 0.5960785, 0, 1, 1,
0.7540473, 0.6548441, 1.368821, 0.6039216, 0, 1, 1,
0.7583453, -1.680661, 3.447437, 0.6078432, 0, 1, 1,
0.762326, -1.175695, 2.197982, 0.6156863, 0, 1, 1,
0.7638496, -0.1441054, 1.719389, 0.6196079, 0, 1, 1,
0.7662497, 0.3673423, 0.9103275, 0.627451, 0, 1, 1,
0.7674484, 1.641486, 0.1978298, 0.6313726, 0, 1, 1,
0.7680428, -0.01074117, 0.4186356, 0.6392157, 0, 1, 1,
0.7790058, 0.6335646, 0.441313, 0.6431373, 0, 1, 1,
0.7794, 1.164385, -1.060151, 0.6509804, 0, 1, 1,
0.7853014, -0.3997884, 2.054156, 0.654902, 0, 1, 1,
0.7859402, 1.55426, 0.4016206, 0.6627451, 0, 1, 1,
0.790901, 0.121046, 0.4477574, 0.6666667, 0, 1, 1,
0.8043482, 1.611932, -0.7176811, 0.6745098, 0, 1, 1,
0.807833, -0.5382, 3.652811, 0.6784314, 0, 1, 1,
0.809662, -0.8978796, 2.429255, 0.6862745, 0, 1, 1,
0.810939, 0.7518699, 1.744295, 0.6901961, 0, 1, 1,
0.8115732, 1.266443, -0.7826389, 0.6980392, 0, 1, 1,
0.8156616, 1.375159, 2.514046, 0.7058824, 0, 1, 1,
0.8179162, 0.4278134, 0.4970226, 0.7098039, 0, 1, 1,
0.8199419, -0.3380846, 2.359292, 0.7176471, 0, 1, 1,
0.8273299, 0.1217417, 2.035998, 0.7215686, 0, 1, 1,
0.8334016, -0.2602844, 3.513824, 0.7294118, 0, 1, 1,
0.8372722, 2.393342, -0.3875562, 0.7333333, 0, 1, 1,
0.8374287, 0.3597774, 1.378441, 0.7411765, 0, 1, 1,
0.8406448, 1.805539, -0.003153786, 0.7450981, 0, 1, 1,
0.8467269, 1.37542, 1.15579, 0.7529412, 0, 1, 1,
0.8490683, -1.09094, 2.351848, 0.7568628, 0, 1, 1,
0.854978, -1.281147, 4.055211, 0.7647059, 0, 1, 1,
0.8569899, -0.05457042, 1.438168, 0.7686275, 0, 1, 1,
0.8593972, -1.356809, 2.569245, 0.7764706, 0, 1, 1,
0.8663485, -1.612044, 1.818743, 0.7803922, 0, 1, 1,
0.8679012, -0.6068881, 1.883994, 0.7882353, 0, 1, 1,
0.8714125, 1.094032, 0.1474423, 0.7921569, 0, 1, 1,
0.8716066, -0.06519508, 1.875594, 0.8, 0, 1, 1,
0.8812847, 0.8218742, 0.6609849, 0.8078431, 0, 1, 1,
0.8815375, 0.8703564, 1.091606, 0.8117647, 0, 1, 1,
0.8815716, 1.234481, -0.9466907, 0.8196079, 0, 1, 1,
0.8826078, 1.293963, 0.6212568, 0.8235294, 0, 1, 1,
0.890462, -0.3863279, 0.799316, 0.8313726, 0, 1, 1,
0.8926104, -0.1142134, -1.283056, 0.8352941, 0, 1, 1,
0.8943332, -0.9133765, 3.480683, 0.8431373, 0, 1, 1,
0.8964422, 0.9881487, 0.6004072, 0.8470588, 0, 1, 1,
0.8983506, 0.03769466, 1.712791, 0.854902, 0, 1, 1,
0.9028239, -0.497542, 0.8235598, 0.8588235, 0, 1, 1,
0.9050345, -0.7629288, 2.080858, 0.8666667, 0, 1, 1,
0.9096396, 0.5533749, -0.646503, 0.8705882, 0, 1, 1,
0.911956, -0.4395763, 1.836462, 0.8784314, 0, 1, 1,
0.9134464, -1.139287, 4.00671, 0.8823529, 0, 1, 1,
0.9173546, 1.926313, 2.16272, 0.8901961, 0, 1, 1,
0.92017, -1.506749, 1.604046, 0.8941177, 0, 1, 1,
0.9255148, -1.673217, 3.877988, 0.9019608, 0, 1, 1,
0.926533, -0.7284241, 2.461338, 0.9098039, 0, 1, 1,
0.9281731, 0.02227439, 1.385586, 0.9137255, 0, 1, 1,
0.9284999, -0.3458129, 3.719291, 0.9215686, 0, 1, 1,
0.930717, 0.4586067, 2.092641, 0.9254902, 0, 1, 1,
0.9363587, 0.0193198, 3.524894, 0.9333333, 0, 1, 1,
0.9387544, -1.474722, 2.101078, 0.9372549, 0, 1, 1,
0.9474266, -0.3561971, 2.685905, 0.945098, 0, 1, 1,
0.9493941, 0.8752408, 2.583279, 0.9490196, 0, 1, 1,
0.9497606, 1.0394, 1.224565, 0.9568627, 0, 1, 1,
0.953015, 0.1093129, 0.8563292, 0.9607843, 0, 1, 1,
0.9554602, -0.7809016, 2.924938, 0.9686275, 0, 1, 1,
0.9561801, 1.064338, 1.357644, 0.972549, 0, 1, 1,
0.9577431, -0.4701995, 3.999073, 0.9803922, 0, 1, 1,
0.961679, -0.6067966, 2.90141, 0.9843137, 0, 1, 1,
0.9698888, -0.5892971, 2.925689, 0.9921569, 0, 1, 1,
0.9702337, 0.5805212, 1.606322, 0.9960784, 0, 1, 1,
0.9711537, -0.55963, 2.170964, 1, 0, 0.9960784, 1,
0.9714966, -0.9064814, 1.881001, 1, 0, 0.9882353, 1,
0.9742547, -0.1166627, 3.578703, 1, 0, 0.9843137, 1,
0.9825891, -0.1283186, 0.873679, 1, 0, 0.9764706, 1,
0.9866377, 0.2484627, 0.1633805, 1, 0, 0.972549, 1,
0.9898468, -0.9847521, 1.613819, 1, 0, 0.9647059, 1,
0.9942569, 0.908143, 0.07088552, 1, 0, 0.9607843, 1,
0.9993053, 0.2000474, 1.419717, 1, 0, 0.9529412, 1,
1.002803, -0.5092202, 0.6706308, 1, 0, 0.9490196, 1,
1.007458, 0.01766145, 1.24207, 1, 0, 0.9411765, 1,
1.01526, -1.02591, 4.110239, 1, 0, 0.9372549, 1,
1.020193, -0.06331135, -0.645436, 1, 0, 0.9294118, 1,
1.021161, -1.667655, 1.414764, 1, 0, 0.9254902, 1,
1.023256, -0.2368846, 1.2124, 1, 0, 0.9176471, 1,
1.024024, -1.549448, 1.764172, 1, 0, 0.9137255, 1,
1.027085, 1.70066, 1.577889, 1, 0, 0.9058824, 1,
1.029388, -0.1348308, 0.06515382, 1, 0, 0.9019608, 1,
1.036595, -0.0766817, 1.918704, 1, 0, 0.8941177, 1,
1.039784, -0.9313915, 3.392221, 1, 0, 0.8862745, 1,
1.040128, 0.9053296, 1.667572, 1, 0, 0.8823529, 1,
1.043182, 0.5395693, 2.043061, 1, 0, 0.8745098, 1,
1.045429, 1.163986, 1.429064, 1, 0, 0.8705882, 1,
1.048364, 0.6813112, 2.270095, 1, 0, 0.8627451, 1,
1.048803, 0.07222537, 2.39441, 1, 0, 0.8588235, 1,
1.050467, -0.4533314, 4.372333, 1, 0, 0.8509804, 1,
1.05435, -0.3203492, 0.6416295, 1, 0, 0.8470588, 1,
1.058605, -0.06431466, 2.234359, 1, 0, 0.8392157, 1,
1.059731, 0.5121581, 1.238176, 1, 0, 0.8352941, 1,
1.064072, 1.861243, 0.4520371, 1, 0, 0.827451, 1,
1.068627, -1.558563, 2.358039, 1, 0, 0.8235294, 1,
1.074345, -0.126387, 2.045966, 1, 0, 0.8156863, 1,
1.075492, -1.748074, 0.9091859, 1, 0, 0.8117647, 1,
1.098803, 0.3759911, -0.9196118, 1, 0, 0.8039216, 1,
1.108104, 1.727881, 1.171026, 1, 0, 0.7960784, 1,
1.108475, 0.2557077, 1.199487, 1, 0, 0.7921569, 1,
1.111238, 1.198701, 0.2961203, 1, 0, 0.7843137, 1,
1.12161, -1.745898, 4.1208, 1, 0, 0.7803922, 1,
1.127271, -0.03063764, 2.284469, 1, 0, 0.772549, 1,
1.136146, -0.7952045, 0.05802757, 1, 0, 0.7686275, 1,
1.139178, 0.6168045, -0.1482581, 1, 0, 0.7607843, 1,
1.143569, 0.8814998, 2.753147, 1, 0, 0.7568628, 1,
1.149928, -1.280459, 3.674727, 1, 0, 0.7490196, 1,
1.15103, -0.8308325, 1.909262, 1, 0, 0.7450981, 1,
1.160276, -0.03580215, 0.9851181, 1, 0, 0.7372549, 1,
1.164406, -1.576524, 2.575055, 1, 0, 0.7333333, 1,
1.166594, 0.2240426, 1.389474, 1, 0, 0.7254902, 1,
1.169498, 0.3423271, 1.327305, 1, 0, 0.7215686, 1,
1.171707, 0.1282045, 1.586012, 1, 0, 0.7137255, 1,
1.178373, 0.06065108, 2.008996, 1, 0, 0.7098039, 1,
1.179752, -0.05240915, 0.8690441, 1, 0, 0.7019608, 1,
1.18265, 0.3660403, 1.023162, 1, 0, 0.6941177, 1,
1.183416, 0.1943194, 0.6206561, 1, 0, 0.6901961, 1,
1.191462, -0.845625, 0.8013886, 1, 0, 0.682353, 1,
1.191705, -1.448158, 3.608005, 1, 0, 0.6784314, 1,
1.192347, 0.7421425, 0.5660795, 1, 0, 0.6705883, 1,
1.227475, 0.1017635, 0.4436113, 1, 0, 0.6666667, 1,
1.236356, -0.5544082, 1.301645, 1, 0, 0.6588235, 1,
1.251082, -0.01829864, 1.399639, 1, 0, 0.654902, 1,
1.253577, 0.236783, 2.453542, 1, 0, 0.6470588, 1,
1.258507, 2.182062, 0.2694607, 1, 0, 0.6431373, 1,
1.262122, 1.561369, 1.248249, 1, 0, 0.6352941, 1,
1.264802, 0.1600658, 2.308456, 1, 0, 0.6313726, 1,
1.26589, 0.3471634, -1.082078, 1, 0, 0.6235294, 1,
1.268905, 0.3445981, 1.877782, 1, 0, 0.6196079, 1,
1.270821, -0.5969742, 2.176414, 1, 0, 0.6117647, 1,
1.271145, 0.2057711, 1.899441, 1, 0, 0.6078432, 1,
1.287122, -0.1294243, 0.9723822, 1, 0, 0.6, 1,
1.294058, -0.9060428, -0.1222516, 1, 0, 0.5921569, 1,
1.294152, 0.5022107, -0.1737032, 1, 0, 0.5882353, 1,
1.301484, 0.7031535, 2.01023, 1, 0, 0.5803922, 1,
1.307155, 0.5221047, 1.849711, 1, 0, 0.5764706, 1,
1.309487, 0.05296751, 0.1083161, 1, 0, 0.5686275, 1,
1.313391, 0.7005175, 0.847954, 1, 0, 0.5647059, 1,
1.316996, 0.01825017, 3.190361, 1, 0, 0.5568628, 1,
1.317917, 1.836529, 2.284168, 1, 0, 0.5529412, 1,
1.327693, 1.322897, -0.5888369, 1, 0, 0.5450981, 1,
1.329123, 1.549402, 0.8013957, 1, 0, 0.5411765, 1,
1.331386, -1.104535, 4.24728, 1, 0, 0.5333334, 1,
1.348223, 0.6236086, 1.895518, 1, 0, 0.5294118, 1,
1.351192, -0.02924011, 0.4264884, 1, 0, 0.5215687, 1,
1.356712, 0.6060368, 1.85485, 1, 0, 0.5176471, 1,
1.3648, -1.246767, 0.8114579, 1, 0, 0.509804, 1,
1.365827, -0.7248847, 1.339183, 1, 0, 0.5058824, 1,
1.373742, -0.0944481, 2.086324, 1, 0, 0.4980392, 1,
1.377433, -0.5100807, 2.325561, 1, 0, 0.4901961, 1,
1.382937, -0.6938016, 2.341039, 1, 0, 0.4862745, 1,
1.384674, -1.215015, 2.212196, 1, 0, 0.4784314, 1,
1.400024, -1.765218, 4.484402, 1, 0, 0.4745098, 1,
1.403242, 3.054953, 1.143274, 1, 0, 0.4666667, 1,
1.424572, -0.9051235, 2.827934, 1, 0, 0.4627451, 1,
1.424858, -1.033191, 0.7860075, 1, 0, 0.454902, 1,
1.434512, 1.452462, 2.060683, 1, 0, 0.4509804, 1,
1.456403, -0.3633067, 0.7659817, 1, 0, 0.4431373, 1,
1.462935, -0.2081939, 2.706108, 1, 0, 0.4392157, 1,
1.465442, -0.9029245, 1.571992, 1, 0, 0.4313726, 1,
1.471444, 0.826872, 0.8419296, 1, 0, 0.427451, 1,
1.479604, -0.4024394, 2.950511, 1, 0, 0.4196078, 1,
1.484566, 1.206926, 0.9192875, 1, 0, 0.4156863, 1,
1.491496, -1.367537, 2.539132, 1, 0, 0.4078431, 1,
1.5014, 0.4117654, 1.200684, 1, 0, 0.4039216, 1,
1.505468, -1.50368, 1.291676, 1, 0, 0.3960784, 1,
1.522936, -1.569263, 0.6231233, 1, 0, 0.3882353, 1,
1.524428, -1.287924, 1.457439, 1, 0, 0.3843137, 1,
1.526647, -0.4328868, 2.688445, 1, 0, 0.3764706, 1,
1.526883, 0.7163653, 2.392286, 1, 0, 0.372549, 1,
1.543033, 0.8764502, 2.068434, 1, 0, 0.3647059, 1,
1.5463, -0.2410856, 2.616148, 1, 0, 0.3607843, 1,
1.55301, -0.3852571, 1.188203, 1, 0, 0.3529412, 1,
1.562312, 0.9886659, 3.497719, 1, 0, 0.3490196, 1,
1.576958, -0.1020326, 1.529399, 1, 0, 0.3411765, 1,
1.58577, -0.6743163, 1.951745, 1, 0, 0.3372549, 1,
1.59438, -0.938931, 2.88684, 1, 0, 0.3294118, 1,
1.596948, 0.9634483, 0.2071158, 1, 0, 0.3254902, 1,
1.606347, -0.3581742, 2.300012, 1, 0, 0.3176471, 1,
1.618483, 0.8044846, 0.2045893, 1, 0, 0.3137255, 1,
1.620655, -0.5768862, 1.29264, 1, 0, 0.3058824, 1,
1.621156, 0.04000412, 0.1121967, 1, 0, 0.2980392, 1,
1.632941, 0.05986001, 0.2962802, 1, 0, 0.2941177, 1,
1.643011, -1.171959, 2.231706, 1, 0, 0.2862745, 1,
1.65348, 1.127753, 0.471484, 1, 0, 0.282353, 1,
1.654069, 0.4516748, -0.1554001, 1, 0, 0.2745098, 1,
1.656993, 1.522009, 1.243326, 1, 0, 0.2705882, 1,
1.661476, -0.2127164, 2.905636, 1, 0, 0.2627451, 1,
1.680231, -1.016719, 2.812039, 1, 0, 0.2588235, 1,
1.705699, 0.9345313, 0.6783146, 1, 0, 0.2509804, 1,
1.712659, 1.261414, 1.892074, 1, 0, 0.2470588, 1,
1.806031, -0.4640286, 1.028971, 1, 0, 0.2392157, 1,
1.821306, 0.4324752, 1.212319, 1, 0, 0.2352941, 1,
1.836566, 1.287591, -0.510148, 1, 0, 0.227451, 1,
1.857004, -0.09124295, 0.9058067, 1, 0, 0.2235294, 1,
1.857591, -1.622879, 2.099676, 1, 0, 0.2156863, 1,
1.9016, -1.318052, 1.512913, 1, 0, 0.2117647, 1,
1.941439, -0.01006149, 2.34054, 1, 0, 0.2039216, 1,
1.947823, -1.119898, 3.561422, 1, 0, 0.1960784, 1,
1.951138, -0.2127133, 2.418573, 1, 0, 0.1921569, 1,
1.954042, 1.621551, 1.599131, 1, 0, 0.1843137, 1,
1.972687, 1.572208, 1.965276, 1, 0, 0.1803922, 1,
1.986506, -0.1348202, 2.903581, 1, 0, 0.172549, 1,
2.002442, -1.194393, 2.351847, 1, 0, 0.1686275, 1,
2.007404, 1.279042, 1.026558, 1, 0, 0.1607843, 1,
2.012814, 0.6073061, 2.229952, 1, 0, 0.1568628, 1,
2.017015, -0.3971159, 2.5306, 1, 0, 0.1490196, 1,
2.019048, -0.6401223, 0.4943793, 1, 0, 0.145098, 1,
2.028927, -1.095825, 0.3961795, 1, 0, 0.1372549, 1,
2.066856, 0.2791749, 1.632091, 1, 0, 0.1333333, 1,
2.092159, 1.249337, -2.043683, 1, 0, 0.1254902, 1,
2.098931, -0.9795856, 2.876606, 1, 0, 0.1215686, 1,
2.131714, 0.33047, -0.1846768, 1, 0, 0.1137255, 1,
2.206928, -0.8107387, 0.1478456, 1, 0, 0.1098039, 1,
2.2213, 0.4596932, 0.8807984, 1, 0, 0.1019608, 1,
2.234988, -1.276401, 3.847381, 1, 0, 0.09411765, 1,
2.260462, 1.141295, 1.258905, 1, 0, 0.09019608, 1,
2.290133, 0.3627109, 2.199392, 1, 0, 0.08235294, 1,
2.301694, -0.1336602, 1.602009, 1, 0, 0.07843138, 1,
2.303198, 0.3413785, 0.765797, 1, 0, 0.07058824, 1,
2.3449, -0.4538314, 3.686947, 1, 0, 0.06666667, 1,
2.346299, 1.267077, 2.11979, 1, 0, 0.05882353, 1,
2.420086, -0.1313633, 1.207455, 1, 0, 0.05490196, 1,
2.437394, 0.9619729, 0.805724, 1, 0, 0.04705882, 1,
2.447774, -0.2836804, 1.683053, 1, 0, 0.04313726, 1,
2.530395, 1.450663, 0.3385196, 1, 0, 0.03529412, 1,
2.532875, -1.664896, 1.602215, 1, 0, 0.03137255, 1,
2.653455, 0.2475308, 0.5724989, 1, 0, 0.02352941, 1,
2.828896, -1.281159, 2.441211, 1, 0, 0.01960784, 1,
2.886582, 1.001503, 0.7661369, 1, 0, 0.01176471, 1,
3.013999, 0.4586509, -0.02415686, 1, 0, 0.007843138, 1
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
-0.2396666, -4.262349, -7.47979, 0, -0.5, 0.5, 0.5,
-0.2396666, -4.262349, -7.47979, 1, -0.5, 0.5, 0.5,
-0.2396666, -4.262349, -7.47979, 1, 1.5, 0.5, 0.5,
-0.2396666, -4.262349, -7.47979, 0, 1.5, 0.5, 0.5
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
-4.596324, -0.03934729, -7.47979, 0, -0.5, 0.5, 0.5,
-4.596324, -0.03934729, -7.47979, 1, -0.5, 0.5, 0.5,
-4.596324, -0.03934729, -7.47979, 1, 1.5, 0.5, 0.5,
-4.596324, -0.03934729, -7.47979, 0, 1.5, 0.5, 0.5
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
-4.596324, -4.262349, 0.02565575, 0, -0.5, 0.5, 0.5,
-4.596324, -4.262349, 0.02565575, 1, -0.5, 0.5, 0.5,
-4.596324, -4.262349, 0.02565575, 1, 1.5, 0.5, 0.5,
-4.596324, -4.262349, 0.02565575, 0, 1.5, 0.5, 0.5
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
-3, -3.28781, -5.747764,
3, -3.28781, -5.747764,
-3, -3.28781, -5.747764,
-3, -3.450233, -6.036435,
-2, -3.28781, -5.747764,
-2, -3.450233, -6.036435,
-1, -3.28781, -5.747764,
-1, -3.450233, -6.036435,
0, -3.28781, -5.747764,
0, -3.450233, -6.036435,
1, -3.28781, -5.747764,
1, -3.450233, -6.036435,
2, -3.28781, -5.747764,
2, -3.450233, -6.036435,
3, -3.28781, -5.747764,
3, -3.450233, -6.036435
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
-3, -3.77508, -6.613777, 0, -0.5, 0.5, 0.5,
-3, -3.77508, -6.613777, 1, -0.5, 0.5, 0.5,
-3, -3.77508, -6.613777, 1, 1.5, 0.5, 0.5,
-3, -3.77508, -6.613777, 0, 1.5, 0.5, 0.5,
-2, -3.77508, -6.613777, 0, -0.5, 0.5, 0.5,
-2, -3.77508, -6.613777, 1, -0.5, 0.5, 0.5,
-2, -3.77508, -6.613777, 1, 1.5, 0.5, 0.5,
-2, -3.77508, -6.613777, 0, 1.5, 0.5, 0.5,
-1, -3.77508, -6.613777, 0, -0.5, 0.5, 0.5,
-1, -3.77508, -6.613777, 1, -0.5, 0.5, 0.5,
-1, -3.77508, -6.613777, 1, 1.5, 0.5, 0.5,
-1, -3.77508, -6.613777, 0, 1.5, 0.5, 0.5,
0, -3.77508, -6.613777, 0, -0.5, 0.5, 0.5,
0, -3.77508, -6.613777, 1, -0.5, 0.5, 0.5,
0, -3.77508, -6.613777, 1, 1.5, 0.5, 0.5,
0, -3.77508, -6.613777, 0, 1.5, 0.5, 0.5,
1, -3.77508, -6.613777, 0, -0.5, 0.5, 0.5,
1, -3.77508, -6.613777, 1, -0.5, 0.5, 0.5,
1, -3.77508, -6.613777, 1, 1.5, 0.5, 0.5,
1, -3.77508, -6.613777, 0, 1.5, 0.5, 0.5,
2, -3.77508, -6.613777, 0, -0.5, 0.5, 0.5,
2, -3.77508, -6.613777, 1, -0.5, 0.5, 0.5,
2, -3.77508, -6.613777, 1, 1.5, 0.5, 0.5,
2, -3.77508, -6.613777, 0, 1.5, 0.5, 0.5,
3, -3.77508, -6.613777, 0, -0.5, 0.5, 0.5,
3, -3.77508, -6.613777, 1, -0.5, 0.5, 0.5,
3, -3.77508, -6.613777, 1, 1.5, 0.5, 0.5,
3, -3.77508, -6.613777, 0, 1.5, 0.5, 0.5
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
-3.590942, -3, -5.747764,
-3.590942, 3, -5.747764,
-3.590942, -3, -5.747764,
-3.758505, -3, -6.036435,
-3.590942, -2, -5.747764,
-3.758505, -2, -6.036435,
-3.590942, -1, -5.747764,
-3.758505, -1, -6.036435,
-3.590942, 0, -5.747764,
-3.758505, 0, -6.036435,
-3.590942, 1, -5.747764,
-3.758505, 1, -6.036435,
-3.590942, 2, -5.747764,
-3.758505, 2, -6.036435,
-3.590942, 3, -5.747764,
-3.758505, 3, -6.036435
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
-4.093633, -3, -6.613777, 0, -0.5, 0.5, 0.5,
-4.093633, -3, -6.613777, 1, -0.5, 0.5, 0.5,
-4.093633, -3, -6.613777, 1, 1.5, 0.5, 0.5,
-4.093633, -3, -6.613777, 0, 1.5, 0.5, 0.5,
-4.093633, -2, -6.613777, 0, -0.5, 0.5, 0.5,
-4.093633, -2, -6.613777, 1, -0.5, 0.5, 0.5,
-4.093633, -2, -6.613777, 1, 1.5, 0.5, 0.5,
-4.093633, -2, -6.613777, 0, 1.5, 0.5, 0.5,
-4.093633, -1, -6.613777, 0, -0.5, 0.5, 0.5,
-4.093633, -1, -6.613777, 1, -0.5, 0.5, 0.5,
-4.093633, -1, -6.613777, 1, 1.5, 0.5, 0.5,
-4.093633, -1, -6.613777, 0, 1.5, 0.5, 0.5,
-4.093633, 0, -6.613777, 0, -0.5, 0.5, 0.5,
-4.093633, 0, -6.613777, 1, -0.5, 0.5, 0.5,
-4.093633, 0, -6.613777, 1, 1.5, 0.5, 0.5,
-4.093633, 0, -6.613777, 0, 1.5, 0.5, 0.5,
-4.093633, 1, -6.613777, 0, -0.5, 0.5, 0.5,
-4.093633, 1, -6.613777, 1, -0.5, 0.5, 0.5,
-4.093633, 1, -6.613777, 1, 1.5, 0.5, 0.5,
-4.093633, 1, -6.613777, 0, 1.5, 0.5, 0.5,
-4.093633, 2, -6.613777, 0, -0.5, 0.5, 0.5,
-4.093633, 2, -6.613777, 1, -0.5, 0.5, 0.5,
-4.093633, 2, -6.613777, 1, 1.5, 0.5, 0.5,
-4.093633, 2, -6.613777, 0, 1.5, 0.5, 0.5,
-4.093633, 3, -6.613777, 0, -0.5, 0.5, 0.5,
-4.093633, 3, -6.613777, 1, -0.5, 0.5, 0.5,
-4.093633, 3, -6.613777, 1, 1.5, 0.5, 0.5,
-4.093633, 3, -6.613777, 0, 1.5, 0.5, 0.5
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
-3.590942, -3.28781, -4,
-3.590942, -3.28781, 4,
-3.590942, -3.28781, -4,
-3.758505, -3.450233, -4,
-3.590942, -3.28781, -2,
-3.758505, -3.450233, -2,
-3.590942, -3.28781, 0,
-3.758505, -3.450233, 0,
-3.590942, -3.28781, 2,
-3.758505, -3.450233, 2,
-3.590942, -3.28781, 4,
-3.758505, -3.450233, 4
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
-4.093633, -3.77508, -4, 0, -0.5, 0.5, 0.5,
-4.093633, -3.77508, -4, 1, -0.5, 0.5, 0.5,
-4.093633, -3.77508, -4, 1, 1.5, 0.5, 0.5,
-4.093633, -3.77508, -4, 0, 1.5, 0.5, 0.5,
-4.093633, -3.77508, -2, 0, -0.5, 0.5, 0.5,
-4.093633, -3.77508, -2, 1, -0.5, 0.5, 0.5,
-4.093633, -3.77508, -2, 1, 1.5, 0.5, 0.5,
-4.093633, -3.77508, -2, 0, 1.5, 0.5, 0.5,
-4.093633, -3.77508, 0, 0, -0.5, 0.5, 0.5,
-4.093633, -3.77508, 0, 1, -0.5, 0.5, 0.5,
-4.093633, -3.77508, 0, 1, 1.5, 0.5, 0.5,
-4.093633, -3.77508, 0, 0, 1.5, 0.5, 0.5,
-4.093633, -3.77508, 2, 0, -0.5, 0.5, 0.5,
-4.093633, -3.77508, 2, 1, -0.5, 0.5, 0.5,
-4.093633, -3.77508, 2, 1, 1.5, 0.5, 0.5,
-4.093633, -3.77508, 2, 0, 1.5, 0.5, 0.5,
-4.093633, -3.77508, 4, 0, -0.5, 0.5, 0.5,
-4.093633, -3.77508, 4, 1, -0.5, 0.5, 0.5,
-4.093633, -3.77508, 4, 1, 1.5, 0.5, 0.5,
-4.093633, -3.77508, 4, 0, 1.5, 0.5, 0.5
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
-3.590942, -3.28781, -5.747764,
-3.590942, 3.209116, -5.747764,
-3.590942, -3.28781, 5.799076,
-3.590942, 3.209116, 5.799076,
-3.590942, -3.28781, -5.747764,
-3.590942, -3.28781, 5.799076,
-3.590942, 3.209116, -5.747764,
-3.590942, 3.209116, 5.799076,
-3.590942, -3.28781, -5.747764,
3.111609, -3.28781, -5.747764,
-3.590942, -3.28781, 5.799076,
3.111609, -3.28781, 5.799076,
-3.590942, 3.209116, -5.747764,
3.111609, 3.209116, -5.747764,
-3.590942, 3.209116, 5.799076,
3.111609, 3.209116, 5.799076,
3.111609, -3.28781, -5.747764,
3.111609, 3.209116, -5.747764,
3.111609, -3.28781, 5.799076,
3.111609, 3.209116, 5.799076,
3.111609, -3.28781, -5.747764,
3.111609, -3.28781, 5.799076,
3.111609, 3.209116, -5.747764,
3.111609, 3.209116, 5.799076
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
var radius = 7.928555;
var distance = 35.27504;
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
mvMatrix.translate( 0.2396666, 0.03934729, -0.02565575 );
mvMatrix.scale( 1.278992, 1.319471, 0.7424117 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.27504);
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
copper_monoethanolam<-read.table("copper_monoethanolam.xyz")
```

```
## Error in read.table("copper_monoethanolam.xyz"): no lines available in input
```

```r
x<-copper_monoethanolam$V2
```

```
## Error in eval(expr, envir, enclos): object 'copper_monoethanolam' not found
```

```r
y<-copper_monoethanolam$V3
```

```
## Error in eval(expr, envir, enclos): object 'copper_monoethanolam' not found
```

```r
z<-copper_monoethanolam$V4
```

```
## Error in eval(expr, envir, enclos): object 'copper_monoethanolam' not found
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
-3.493332, 1.005412, -1.982267, 0, 0, 1, 1, 1,
-3.337109, -1.180313, -1.46888, 1, 0, 0, 1, 1,
-3.041828, 1.882517, 0.4514844, 1, 0, 0, 1, 1,
-2.982953, 0.7183182, -1.830498, 1, 0, 0, 1, 1,
-2.778687, -1.412915, -2.308217, 1, 0, 0, 1, 1,
-2.687839, 1.145559, -3.681643, 1, 0, 0, 1, 1,
-2.489737, 0.6794218, -1.09498, 0, 0, 0, 1, 1,
-2.455793, 0.923268, -0.726023, 0, 0, 0, 1, 1,
-2.409715, -0.0826956, -1.436023, 0, 0, 0, 1, 1,
-2.333667, 0.5884063, -0.05608916, 0, 0, 0, 1, 1,
-2.31627, -0.2548699, -1.857419, 0, 0, 0, 1, 1,
-2.296877, 0.994559, -0.4712115, 0, 0, 0, 1, 1,
-2.263087, 0.2137615, -1.497961, 0, 0, 0, 1, 1,
-2.251211, -1.644313, -2.040715, 1, 1, 1, 1, 1,
-2.191684, -2.969228, -1.807248, 1, 1, 1, 1, 1,
-2.157267, -1.416415, -1.988704, 1, 1, 1, 1, 1,
-2.148354, -0.7603209, -0.8619279, 1, 1, 1, 1, 1,
-2.117265, 0.2251649, -2.496094, 1, 1, 1, 1, 1,
-2.104722, -2.17728, -0.05534578, 1, 1, 1, 1, 1,
-2.083357, -1.309553, -2.489611, 1, 1, 1, 1, 1,
-2.068095, -0.309694, -1.648205, 1, 1, 1, 1, 1,
-2.041135, 1.937451, -0.5654904, 1, 1, 1, 1, 1,
-2.026223, -0.2477907, -1.870041, 1, 1, 1, 1, 1,
-2.020578, 0.2515298, -1.115551, 1, 1, 1, 1, 1,
-2.016208, -0.68572, -2.155939, 1, 1, 1, 1, 1,
-2.005231, 0.4062623, -0.8858001, 1, 1, 1, 1, 1,
-2.002091, -0.3222743, -3.08209, 1, 1, 1, 1, 1,
-1.991603, -2.001118, -2.858885, 1, 1, 1, 1, 1,
-1.977342, 0.4173261, -1.763329, 0, 0, 1, 1, 1,
-1.957096, -0.0168778, -1.874944, 1, 0, 0, 1, 1,
-1.940253, -0.293012, -1.961058, 1, 0, 0, 1, 1,
-1.929791, -0.3265062, -2.547517, 1, 0, 0, 1, 1,
-1.913039, 0.4113153, -1.61417, 1, 0, 0, 1, 1,
-1.89392, -0.8211063, -3.038441, 1, 0, 0, 1, 1,
-1.832987, 1.840963, 0.3257168, 0, 0, 0, 1, 1,
-1.829343, 0.09929293, -1.767501, 0, 0, 0, 1, 1,
-1.817731, 0.1617164, -3.679415, 0, 0, 0, 1, 1,
-1.807853, -0.9737749, -1.065719, 0, 0, 0, 1, 1,
-1.795532, -0.260868, 0.006117806, 0, 0, 0, 1, 1,
-1.774579, 1.449859, -3.99723, 0, 0, 0, 1, 1,
-1.767405, -1.876789, -2.56576, 0, 0, 0, 1, 1,
-1.760702, 1.20763, -0.7700343, 1, 1, 1, 1, 1,
-1.760013, -0.1989433, -1.773609, 1, 1, 1, 1, 1,
-1.756736, 0.8506759, 0.4964503, 1, 1, 1, 1, 1,
-1.755536, -1.241019, -2.644963, 1, 1, 1, 1, 1,
-1.753568, 0.580785, -0.9906464, 1, 1, 1, 1, 1,
-1.712361, -0.4927596, -1.773505, 1, 1, 1, 1, 1,
-1.700809, -0.564704, -2.481656, 1, 1, 1, 1, 1,
-1.696509, -2.932356, -4.193105, 1, 1, 1, 1, 1,
-1.695408, 0.9041685, -1.477845, 1, 1, 1, 1, 1,
-1.681037, 0.3910144, 0.02722118, 1, 1, 1, 1, 1,
-1.677754, 0.6157528, -1.778327, 1, 1, 1, 1, 1,
-1.664118, -0.0833172, -2.097035, 1, 1, 1, 1, 1,
-1.651434, -0.7630352, -0.8197499, 1, 1, 1, 1, 1,
-1.64248, 0.7384387, -2.005484, 1, 1, 1, 1, 1,
-1.616294, -1.13396, -1.733169, 1, 1, 1, 1, 1,
-1.614305, -1.498114, -1.632521, 0, 0, 1, 1, 1,
-1.611202, 0.6766211, 0.05166767, 1, 0, 0, 1, 1,
-1.608487, -1.767709, -1.69078, 1, 0, 0, 1, 1,
-1.602387, 0.3313613, -0.352661, 1, 0, 0, 1, 1,
-1.594383, -1.213217, -2.080588, 1, 0, 0, 1, 1,
-1.582767, 0.300806, -1.866585, 1, 0, 0, 1, 1,
-1.57978, -1.117064, -1.779814, 0, 0, 0, 1, 1,
-1.578681, -0.7932385, -3.888053, 0, 0, 0, 1, 1,
-1.577461, 0.7443087, -0.9226599, 0, 0, 0, 1, 1,
-1.577107, 0.4873136, -3.020547, 0, 0, 0, 1, 1,
-1.567915, 1.032186, -3.409567, 0, 0, 0, 1, 1,
-1.556756, -1.638593, -1.907126, 0, 0, 0, 1, 1,
-1.556702, 0.3386011, -1.694552, 0, 0, 0, 1, 1,
-1.54681, 0.4925397, -0.886047, 1, 1, 1, 1, 1,
-1.544481, 0.4380124, -1.4479, 1, 1, 1, 1, 1,
-1.539132, 0.2594543, -1.122339, 1, 1, 1, 1, 1,
-1.535384, 0.6331312, -1.595556, 1, 1, 1, 1, 1,
-1.532408, 0.05451993, -0.3372101, 1, 1, 1, 1, 1,
-1.523298, -0.6323355, -0.07867026, 1, 1, 1, 1, 1,
-1.507539, -1.728869, -0.6023631, 1, 1, 1, 1, 1,
-1.499915, -1.22927, -2.269383, 1, 1, 1, 1, 1,
-1.495131, 0.4841489, -0.5282687, 1, 1, 1, 1, 1,
-1.469847, 1.774197, 0.2643721, 1, 1, 1, 1, 1,
-1.460797, -0.2959487, -4.481845, 1, 1, 1, 1, 1,
-1.457917, -1.207842, -2.998315, 1, 1, 1, 1, 1,
-1.453059, 1.348634, -1.019757, 1, 1, 1, 1, 1,
-1.443414, -0.2655412, -2.236043, 1, 1, 1, 1, 1,
-1.440213, -2.51564, -3.033003, 1, 1, 1, 1, 1,
-1.438921, 1.964109, -1.061667, 0, 0, 1, 1, 1,
-1.435502, 1.392532, -2.109441, 1, 0, 0, 1, 1,
-1.434599, 0.5091245, -1.373177, 1, 0, 0, 1, 1,
-1.432014, -0.9933738, -0.7524236, 1, 0, 0, 1, 1,
-1.429474, -0.185503, -0.7301965, 1, 0, 0, 1, 1,
-1.427034, 0.6534953, -0.7612841, 1, 0, 0, 1, 1,
-1.425168, -1.657358, -3.784651, 0, 0, 0, 1, 1,
-1.420575, -0.8879157, -1.753004, 0, 0, 0, 1, 1,
-1.372552, -0.7023492, -3.507082, 0, 0, 0, 1, 1,
-1.368398, -0.07366823, -1.957678, 0, 0, 0, 1, 1,
-1.36175, -1.118235, -2.380121, 0, 0, 0, 1, 1,
-1.361139, -0.6254479, -2.06615, 0, 0, 0, 1, 1,
-1.359066, 0.6418703, -2.465059, 0, 0, 0, 1, 1,
-1.356352, 0.6357832, -2.770924, 1, 1, 1, 1, 1,
-1.356152, 0.3710471, -2.445078, 1, 1, 1, 1, 1,
-1.353456, -1.499438, -0.8907143, 1, 1, 1, 1, 1,
-1.351977, 0.2554878, -1.312284, 1, 1, 1, 1, 1,
-1.34362, -0.3183815, -1.257528, 1, 1, 1, 1, 1,
-1.338525, -0.7023508, -0.6197389, 1, 1, 1, 1, 1,
-1.325095, 0.5256265, -1.344129, 1, 1, 1, 1, 1,
-1.311312, 1.067266, -0.426497, 1, 1, 1, 1, 1,
-1.297181, -0.5940044, -2.808281, 1, 1, 1, 1, 1,
-1.291378, 0.04308103, -1.091854, 1, 1, 1, 1, 1,
-1.28881, -0.8745834, -2.566604, 1, 1, 1, 1, 1,
-1.28598, 0.5448624, -1.399076, 1, 1, 1, 1, 1,
-1.284087, -0.2088216, -0.9496678, 1, 1, 1, 1, 1,
-1.273457, -0.3874633, -1.619843, 1, 1, 1, 1, 1,
-1.26231, 0.4845193, -0.7355053, 1, 1, 1, 1, 1,
-1.259771, 0.113569, -3.816381, 0, 0, 1, 1, 1,
-1.255961, -1.015479, -1.123802, 1, 0, 0, 1, 1,
-1.253674, -0.02371424, -1.215141, 1, 0, 0, 1, 1,
-1.246482, -1.237275, -1.670774, 1, 0, 0, 1, 1,
-1.239574, 1.617084, 0.1706697, 1, 0, 0, 1, 1,
-1.236597, 1.286548, 0.5635864, 1, 0, 0, 1, 1,
-1.229783, 1.552626, -0.6149479, 0, 0, 0, 1, 1,
-1.214485, 1.048229, -1.803482, 0, 0, 0, 1, 1,
-1.21151, 0.5364816, -2.500869, 0, 0, 0, 1, 1,
-1.205431, -0.7156738, -2.221608, 0, 0, 0, 1, 1,
-1.199897, 0.7541098, -2.74843, 0, 0, 0, 1, 1,
-1.196999, 0.410552, -0.7931631, 0, 0, 0, 1, 1,
-1.188758, -1.22427, -2.089391, 0, 0, 0, 1, 1,
-1.179389, -0.6510831, -4.818819, 1, 1, 1, 1, 1,
-1.177909, 3.1145, -0.3785378, 1, 1, 1, 1, 1,
-1.17148, -0.3985806, -1.256956, 1, 1, 1, 1, 1,
-1.167013, 0.03462026, -3.482664, 1, 1, 1, 1, 1,
-1.166388, -0.9910428, -2.642235, 1, 1, 1, 1, 1,
-1.16607, -2.036712, -3.632883, 1, 1, 1, 1, 1,
-1.160325, 0.7075846, -2.38111, 1, 1, 1, 1, 1,
-1.158116, -3.193195, -4.930772, 1, 1, 1, 1, 1,
-1.15804, 1.375478, 0.2400983, 1, 1, 1, 1, 1,
-1.152835, -0.9352055, -2.582691, 1, 1, 1, 1, 1,
-1.143939, 0.9112659, -2.149652, 1, 1, 1, 1, 1,
-1.140139, -0.6091082, -1.698408, 1, 1, 1, 1, 1,
-1.137361, -0.8780885, -1.890759, 1, 1, 1, 1, 1,
-1.12431, -0.315318, -1.257448, 1, 1, 1, 1, 1,
-1.115872, -1.07222, -2.086441, 1, 1, 1, 1, 1,
-1.114588, -0.3861876, -2.312557, 0, 0, 1, 1, 1,
-1.104445, -0.5514639, -1.852345, 1, 0, 0, 1, 1,
-1.103858, 0.6430427, 0.4775776, 1, 0, 0, 1, 1,
-1.103526, -0.0980778, -2.329433, 1, 0, 0, 1, 1,
-1.100918, -2.153138, -3.125629, 1, 0, 0, 1, 1,
-1.09362, 1.907303, -0.4351904, 1, 0, 0, 1, 1,
-1.082906, -1.026851, -1.964956, 0, 0, 0, 1, 1,
-1.077469, -0.2713576, -1.687698, 0, 0, 0, 1, 1,
-1.074802, -0.5508281, -1.522725, 0, 0, 0, 1, 1,
-1.062641, -1.302833, -3.587179, 0, 0, 0, 1, 1,
-1.059309, -1.016602, -1.368965, 0, 0, 0, 1, 1,
-1.055348, -0.3584254, -2.506916, 0, 0, 0, 1, 1,
-1.053075, 0.4520582, -0.8661552, 0, 0, 0, 1, 1,
-1.047016, 1.434983, -1.346431, 1, 1, 1, 1, 1,
-1.044252, 0.2559026, -1.691155, 1, 1, 1, 1, 1,
-1.0406, 0.2156415, -1.698542, 1, 1, 1, 1, 1,
-1.033661, -1.00267, -1.465845, 1, 1, 1, 1, 1,
-1.016602, -0.1070305, -3.739555, 1, 1, 1, 1, 1,
-1.01428, 0.5410599, -0.268433, 1, 1, 1, 1, 1,
-1.012221, 0.4340001, -2.068355, 1, 1, 1, 1, 1,
-1.009259, -1.362089, -3.442983, 1, 1, 1, 1, 1,
-1.002432, -0.08680163, -2.78064, 1, 1, 1, 1, 1,
-0.9968269, -1.034955, -1.56716, 1, 1, 1, 1, 1,
-0.9775159, 0.153873, -1.008919, 1, 1, 1, 1, 1,
-0.9703763, 1.776956, 0.6764237, 1, 1, 1, 1, 1,
-0.9662006, -0.5245142, -2.533268, 1, 1, 1, 1, 1,
-0.9652475, -0.280414, -1.885218, 1, 1, 1, 1, 1,
-0.963762, 0.3010578, -0.9693866, 1, 1, 1, 1, 1,
-0.9637257, -2.061581, -0.4394849, 0, 0, 1, 1, 1,
-0.9593414, 0.1553264, -2.104743, 1, 0, 0, 1, 1,
-0.9574739, 0.09097938, -1.652681, 1, 0, 0, 1, 1,
-0.9564644, 0.9295251, -1.857213, 1, 0, 0, 1, 1,
-0.9479815, 0.7647307, 0.7576981, 1, 0, 0, 1, 1,
-0.9475943, -0.5712436, -3.185023, 1, 0, 0, 1, 1,
-0.9442134, -0.9052044, -4.54589, 0, 0, 0, 1, 1,
-0.9415581, -0.4377865, -0.9017128, 0, 0, 0, 1, 1,
-0.9395211, -2.276871, -2.578339, 0, 0, 0, 1, 1,
-0.9391708, -0.8272384, -3.047826, 0, 0, 0, 1, 1,
-0.9381685, -1.333505, -2.216736, 0, 0, 0, 1, 1,
-0.937604, 0.6366483, -0.3813398, 0, 0, 0, 1, 1,
-0.9341908, -0.8209139, -2.061148, 0, 0, 0, 1, 1,
-0.9249741, 0.8671416, -1.863409, 1, 1, 1, 1, 1,
-0.9117334, 2.305217, -2.708228, 1, 1, 1, 1, 1,
-0.9102997, -0.08936045, -2.118624, 1, 1, 1, 1, 1,
-0.9058664, 0.8022102, 0.935973, 1, 1, 1, 1, 1,
-0.9029964, -0.9231846, -3.52602, 1, 1, 1, 1, 1,
-0.9026821, -0.7945353, -1.679645, 1, 1, 1, 1, 1,
-0.9003498, 0.3548978, -0.5617656, 1, 1, 1, 1, 1,
-0.8953477, 0.5327362, 1.265402, 1, 1, 1, 1, 1,
-0.8927264, -0.6612639, -2.14256, 1, 1, 1, 1, 1,
-0.8896021, -1.45061, -3.110043, 1, 1, 1, 1, 1,
-0.8822528, 0.02489868, -0.7805411, 1, 1, 1, 1, 1,
-0.8701468, -0.06413911, 0.7106388, 1, 1, 1, 1, 1,
-0.8678944, -1.44986, -3.717824, 1, 1, 1, 1, 1,
-0.8649092, 1.074796, -0.954101, 1, 1, 1, 1, 1,
-0.8647981, 2.084291, -1.157034, 1, 1, 1, 1, 1,
-0.8645706, -0.1574043, -1.391951, 0, 0, 1, 1, 1,
-0.8625718, -1.389107, -2.232081, 1, 0, 0, 1, 1,
-0.8595497, -2.439981, -3.571615, 1, 0, 0, 1, 1,
-0.859301, -1.939351, -2.579991, 1, 0, 0, 1, 1,
-0.8584848, 0.3439537, -1.999207, 1, 0, 0, 1, 1,
-0.8535348, 0.1784503, -1.586987, 1, 0, 0, 1, 1,
-0.851229, -1.110362, -0.2971229, 0, 0, 0, 1, 1,
-0.8476879, -0.2188397, -1.582258, 0, 0, 0, 1, 1,
-0.8410971, 0.4333559, -3.93815, 0, 0, 0, 1, 1,
-0.8338864, 0.4140538, -0.6410232, 0, 0, 0, 1, 1,
-0.8308467, 0.9497238, 0.6216301, 0, 0, 0, 1, 1,
-0.8293887, 1.36762, -1.092353, 0, 0, 0, 1, 1,
-0.8244362, -1.522949, -3.031873, 0, 0, 0, 1, 1,
-0.8170292, -0.2944182, -1.060654, 1, 1, 1, 1, 1,
-0.81204, 0.7412346, -1.445278, 1, 1, 1, 1, 1,
-0.8102475, -1.438024, -3.291655, 1, 1, 1, 1, 1,
-0.8081571, -1.590787, -3.569592, 1, 1, 1, 1, 1,
-0.8053791, 0.2505071, -1.60912, 1, 1, 1, 1, 1,
-0.7930638, 0.7110966, -0.4007687, 1, 1, 1, 1, 1,
-0.7857908, 1.125631, -0.8899561, 1, 1, 1, 1, 1,
-0.7804202, 0.376427, -2.226104, 1, 1, 1, 1, 1,
-0.7786705, 1.412632, 0.1743549, 1, 1, 1, 1, 1,
-0.7781136, -0.7448716, -0.4722774, 1, 1, 1, 1, 1,
-0.7764587, -0.5531973, -2.822536, 1, 1, 1, 1, 1,
-0.7705852, 0.6792864, -0.5060902, 1, 1, 1, 1, 1,
-0.7671555, 2.190535, -0.3973078, 1, 1, 1, 1, 1,
-0.7587466, 0.2159207, -1.501899, 1, 1, 1, 1, 1,
-0.7519659, -0.2089713, -0.9700379, 1, 1, 1, 1, 1,
-0.744991, -0.7523484, -2.086836, 0, 0, 1, 1, 1,
-0.7411246, -0.326301, 0.5412427, 1, 0, 0, 1, 1,
-0.7400362, 0.7945108, -1.397681, 1, 0, 0, 1, 1,
-0.7380964, -1.26279, -1.89442, 1, 0, 0, 1, 1,
-0.7350553, -1.380486, -1.846935, 1, 0, 0, 1, 1,
-0.73212, -0.04634839, -0.4604335, 1, 0, 0, 1, 1,
-0.7300518, 2.420665, 1.171764, 0, 0, 0, 1, 1,
-0.7298599, 0.7071682, 1.433139, 0, 0, 0, 1, 1,
-0.7291313, 0.2882396, -2.784504, 0, 0, 0, 1, 1,
-0.7290086, -0.04673467, -1.432221, 0, 0, 0, 1, 1,
-0.7279004, -0.4280605, -3.10103, 0, 0, 0, 1, 1,
-0.7249619, 0.8589956, -2.339456, 0, 0, 0, 1, 1,
-0.7207519, 0.1986163, -1.074574, 0, 0, 0, 1, 1,
-0.7180533, -0.2156636, -2.611336, 1, 1, 1, 1, 1,
-0.7156342, -2.544054, -3.496703, 1, 1, 1, 1, 1,
-0.7152764, -0.3249849, -1.944703, 1, 1, 1, 1, 1,
-0.7101291, -1.100926, -3.0367, 1, 1, 1, 1, 1,
-0.7081953, -0.8506238, -2.133666, 1, 1, 1, 1, 1,
-0.699546, 0.7488198, -2.96602, 1, 1, 1, 1, 1,
-0.6991848, -0.5376973, -3.690968, 1, 1, 1, 1, 1,
-0.6976832, -0.1019199, -0.4399301, 1, 1, 1, 1, 1,
-0.6951523, 0.927649, -1.14947, 1, 1, 1, 1, 1,
-0.6947896, 0.6316683, -0.6101488, 1, 1, 1, 1, 1,
-0.6899748, 0.1367219, -1.229261, 1, 1, 1, 1, 1,
-0.6890502, -0.2667518, -1.463396, 1, 1, 1, 1, 1,
-0.6832293, -2.291834, -1.350513, 1, 1, 1, 1, 1,
-0.6826845, -0.7358541, -1.442249, 1, 1, 1, 1, 1,
-0.6810607, -1.257985, -2.872118, 1, 1, 1, 1, 1,
-0.6644273, -0.08636208, -1.520568, 0, 0, 1, 1, 1,
-0.6618183, 0.1006997, -2.163262, 1, 0, 0, 1, 1,
-0.6616278, -0.9027285, -1.921183, 1, 0, 0, 1, 1,
-0.6601889, -0.5877928, -1.69999, 1, 0, 0, 1, 1,
-0.6585022, 1.180948, 0.3780055, 1, 0, 0, 1, 1,
-0.657037, 0.1782233, -2.038308, 1, 0, 0, 1, 1,
-0.6531314, -0.4265594, -0.2654415, 0, 0, 0, 1, 1,
-0.6486673, 0.02676111, -0.7744455, 0, 0, 0, 1, 1,
-0.6478648, 0.8065795, -3.413692, 0, 0, 0, 1, 1,
-0.6404772, -1.081416, -2.154451, 0, 0, 0, 1, 1,
-0.6397992, -0.7810526, -4.510056, 0, 0, 0, 1, 1,
-0.6394776, 1.12313, 1.556089, 0, 0, 0, 1, 1,
-0.6315752, 0.5309616, -0.2220881, 0, 0, 0, 1, 1,
-0.6305579, -1.10191, -4.127779, 1, 1, 1, 1, 1,
-0.6287174, -0.4946561, -2.361549, 1, 1, 1, 1, 1,
-0.623257, -0.6163728, -0.9863818, 1, 1, 1, 1, 1,
-0.6185783, -0.3906481, -0.3926612, 1, 1, 1, 1, 1,
-0.6130585, 0.1177275, -2.375083, 1, 1, 1, 1, 1,
-0.6124389, -0.3528348, -1.528733, 1, 1, 1, 1, 1,
-0.6099882, 2.35174, -0.4749999, 1, 1, 1, 1, 1,
-0.6099561, 0.1874132, -2.33405, 1, 1, 1, 1, 1,
-0.607405, -0.366645, -0.5095603, 1, 1, 1, 1, 1,
-0.6055877, 1.390161, -0.4640711, 1, 1, 1, 1, 1,
-0.6041941, -0.7885275, -2.594783, 1, 1, 1, 1, 1,
-0.6008725, -1.275521, -2.738433, 1, 1, 1, 1, 1,
-0.5965731, -0.02296602, 0.315142, 1, 1, 1, 1, 1,
-0.5962262, 0.2152712, -2.267936, 1, 1, 1, 1, 1,
-0.592438, 0.3788722, -0.927682, 1, 1, 1, 1, 1,
-0.5841855, 1.28309, -0.3026342, 0, 0, 1, 1, 1,
-0.5808762, -0.671904, -3.017464, 1, 0, 0, 1, 1,
-0.5806741, 0.2948805, -0.7992849, 1, 0, 0, 1, 1,
-0.5782745, -1.097405, -1.658732, 1, 0, 0, 1, 1,
-0.5743253, -0.8399603, -4.45087, 1, 0, 0, 1, 1,
-0.5740513, -0.1338992, -0.6523293, 1, 0, 0, 1, 1,
-0.567561, 2.04796, -2.118802, 0, 0, 0, 1, 1,
-0.5672258, 1.076572, -1.20004, 0, 0, 0, 1, 1,
-0.5633457, -1.346348, -4.547931, 0, 0, 0, 1, 1,
-0.5617724, -0.5823532, -1.002685, 0, 0, 0, 1, 1,
-0.5569068, 0.2808463, -0.6962473, 0, 0, 0, 1, 1,
-0.5533345, -0.5942741, -3.066841, 0, 0, 0, 1, 1,
-0.5497842, -1.008571, -2.87718, 0, 0, 0, 1, 1,
-0.5473245, -1.812322, -1.873784, 1, 1, 1, 1, 1,
-0.5450655, -0.754051, -3.111434, 1, 1, 1, 1, 1,
-0.5420329, -0.7655545, -2.988393, 1, 1, 1, 1, 1,
-0.5373335, 0.6323348, -0.5558982, 1, 1, 1, 1, 1,
-0.5328224, 0.7200046, 2.364541, 1, 1, 1, 1, 1,
-0.5298443, -2.307963, -0.2041545, 1, 1, 1, 1, 1,
-0.5296732, -1.17566, -0.9592171, 1, 1, 1, 1, 1,
-0.5262601, 0.1552413, -2.786301, 1, 1, 1, 1, 1,
-0.5245238, -1.096757, -3.503622, 1, 1, 1, 1, 1,
-0.523149, 1.161551, 0.1570588, 1, 1, 1, 1, 1,
-0.5151551, 0.7874264, 2.160793, 1, 1, 1, 1, 1,
-0.5081172, -0.5727594, -2.263026, 1, 1, 1, 1, 1,
-0.5037099, 1.36768, -1.118923, 1, 1, 1, 1, 1,
-0.5007179, 0.05953761, 0.6810392, 1, 1, 1, 1, 1,
-0.4971086, 0.7885863, 0.194087, 1, 1, 1, 1, 1,
-0.4957161, 1.410677, -0.833195, 0, 0, 1, 1, 1,
-0.4954622, 1.671482, 0.4473278, 1, 0, 0, 1, 1,
-0.4880963, 0.003263856, -2.603697, 1, 0, 0, 1, 1,
-0.4878471, 0.1274201, -0.9291072, 1, 0, 0, 1, 1,
-0.4863671, -0.77618, -3.975097, 1, 0, 0, 1, 1,
-0.4819574, -0.5579975, -2.242766, 1, 0, 0, 1, 1,
-0.4814329, 0.2715866, 1.121869, 0, 0, 0, 1, 1,
-0.4788103, 0.4995203, -2.332177, 0, 0, 0, 1, 1,
-0.4781346, 0.3075063, 0.1937307, 0, 0, 0, 1, 1,
-0.4768827, -0.7654583, -2.802243, 0, 0, 0, 1, 1,
-0.4745382, -0.9052059, -5.096488, 0, 0, 0, 1, 1,
-0.4715958, -0.352552, -2.456903, 0, 0, 0, 1, 1,
-0.4705198, 0.6240347, -0.2417024, 0, 0, 0, 1, 1,
-0.468543, 0.6134142, -1.264898, 1, 1, 1, 1, 1,
-0.4684481, -0.3175458, -1.237584, 1, 1, 1, 1, 1,
-0.4679747, 0.6242871, -2.828244, 1, 1, 1, 1, 1,
-0.4664831, -0.1619841, -0.3807366, 1, 1, 1, 1, 1,
-0.4655128, 0.3675905, -0.2248815, 1, 1, 1, 1, 1,
-0.4631151, -0.5136981, -2.934991, 1, 1, 1, 1, 1,
-0.4621465, -0.8434377, -3.660191, 1, 1, 1, 1, 1,
-0.4555472, 2.494076, -1.014981, 1, 1, 1, 1, 1,
-0.4542559, -0.8209751, -2.503996, 1, 1, 1, 1, 1,
-0.4504031, -0.4549878, -3.357728, 1, 1, 1, 1, 1,
-0.4501299, 1.653312, -1.898585, 1, 1, 1, 1, 1,
-0.4498955, -0.3397814, -2.405568, 1, 1, 1, 1, 1,
-0.4441246, -1.111416, -4.887418, 1, 1, 1, 1, 1,
-0.4368985, 1.604503, -0.6939985, 1, 1, 1, 1, 1,
-0.4351409, 0.3339302, -1.038929, 1, 1, 1, 1, 1,
-0.4339419, -0.2912874, -2.812283, 0, 0, 1, 1, 1,
-0.4318658, 1.280895, 0.2899898, 1, 0, 0, 1, 1,
-0.4307537, 1.027136, -0.05513066, 1, 0, 0, 1, 1,
-0.4303685, -1.339014, -4.215059, 1, 0, 0, 1, 1,
-0.4222742, -0.4748583, -3.544524, 1, 0, 0, 1, 1,
-0.4217279, -0.6358731, -2.541205, 1, 0, 0, 1, 1,
-0.4217209, -1.070717, -3.933107, 0, 0, 0, 1, 1,
-0.418258, -0.6717922, -2.90286, 0, 0, 0, 1, 1,
-0.4139455, 0.3591535, -3.125759, 0, 0, 0, 1, 1,
-0.4135053, 0.1522256, -1.906869, 0, 0, 0, 1, 1,
-0.4127675, 0.4286419, -1.010487, 0, 0, 0, 1, 1,
-0.4109559, -1.410671, -2.837547, 0, 0, 0, 1, 1,
-0.4007896, 0.1641605, -1.131708, 0, 0, 0, 1, 1,
-0.3972339, 0.6459947, 0.2094039, 1, 1, 1, 1, 1,
-0.3956407, 0.4370449, 0.1783277, 1, 1, 1, 1, 1,
-0.3933142, -0.09221503, -2.363432, 1, 1, 1, 1, 1,
-0.3896432, 0.9766428, -0.5918977, 1, 1, 1, 1, 1,
-0.3893076, 0.4937052, 0.9883382, 1, 1, 1, 1, 1,
-0.3857487, -0.8315178, -0.7277651, 1, 1, 1, 1, 1,
-0.3825797, -0.1542857, -2.0607, 1, 1, 1, 1, 1,
-0.3810684, 1.352907, 0.5436382, 1, 1, 1, 1, 1,
-0.3756736, -1.684982, -2.118791, 1, 1, 1, 1, 1,
-0.3745043, -0.03194194, -0.2429153, 1, 1, 1, 1, 1,
-0.3734137, -2.14983, -4.650466, 1, 1, 1, 1, 1,
-0.3716702, 0.008359776, -0.6228544, 1, 1, 1, 1, 1,
-0.3701108, 0.8438702, 0.4058433, 1, 1, 1, 1, 1,
-0.3649087, -0.6834631, -3.279399, 1, 1, 1, 1, 1,
-0.3642146, 1.200683, -1.205691, 1, 1, 1, 1, 1,
-0.3623093, 2.613869, 0.8555121, 0, 0, 1, 1, 1,
-0.3593536, -0.8747136, -4.336751, 1, 0, 0, 1, 1,
-0.3583983, 0.3343506, -0.9434995, 1, 0, 0, 1, 1,
-0.3577532, -0.2474383, -3.177228, 1, 0, 0, 1, 1,
-0.3566194, 0.1016954, -1.791551, 1, 0, 0, 1, 1,
-0.3541441, -0.424225, -2.814267, 1, 0, 0, 1, 1,
-0.3492003, -0.8925643, -1.738667, 0, 0, 0, 1, 1,
-0.3482582, -0.2450985, -1.214206, 0, 0, 0, 1, 1,
-0.3439629, 1.122419, 0.9226053, 0, 0, 0, 1, 1,
-0.3428111, 0.2953573, -0.3630535, 0, 0, 0, 1, 1,
-0.3414058, 0.4566278, -0.4345092, 0, 0, 0, 1, 1,
-0.335728, 0.7313529, -0.8640375, 0, 0, 0, 1, 1,
-0.33014, -0.8428943, -3.427332, 0, 0, 0, 1, 1,
-0.3201253, -0.2056898, -1.713119, 1, 1, 1, 1, 1,
-0.318367, -0.8285389, -4.964102, 1, 1, 1, 1, 1,
-0.3176402, -0.9648499, -2.635018, 1, 1, 1, 1, 1,
-0.3152968, 1.031334, 2.113892, 1, 1, 1, 1, 1,
-0.3114251, 0.3328623, -0.8456635, 1, 1, 1, 1, 1,
-0.3109091, -1.606207, -3.475129, 1, 1, 1, 1, 1,
-0.3063921, -1.033146, -3.005079, 1, 1, 1, 1, 1,
-0.2981189, 0.6281499, -2.236042, 1, 1, 1, 1, 1,
-0.295903, 0.5433482, 0.6884704, 1, 1, 1, 1, 1,
-0.2945828, 0.7312873, -0.4041086, 1, 1, 1, 1, 1,
-0.2927387, 0.1403132, -1.292004, 1, 1, 1, 1, 1,
-0.2916169, -1.024318, -3.961932, 1, 1, 1, 1, 1,
-0.287151, 1.304577, -1.987761, 1, 1, 1, 1, 1,
-0.2871272, -0.02044956, -2.33119, 1, 1, 1, 1, 1,
-0.2856355, -0.1777369, -1.688734, 1, 1, 1, 1, 1,
-0.2826261, -0.5151371, -0.8928111, 0, 0, 1, 1, 1,
-0.2791411, -1.931832, -3.452433, 1, 0, 0, 1, 1,
-0.2760172, 0.0878419, -2.683389, 1, 0, 0, 1, 1,
-0.2752917, 1.816311, 0.1572095, 1, 0, 0, 1, 1,
-0.2732668, 0.7230255, -0.5050274, 1, 0, 0, 1, 1,
-0.2688316, -0.7886264, -2.495949, 1, 0, 0, 1, 1,
-0.2673047, 0.04271199, -4.258044, 0, 0, 0, 1, 1,
-0.2615229, -0.05799288, -2.565913, 0, 0, 0, 1, 1,
-0.2609312, 1.372062, 0.621847, 0, 0, 0, 1, 1,
-0.2576152, 0.7674801, 0.9530379, 0, 0, 0, 1, 1,
-0.2572695, -2.622208, -4.256279, 0, 0, 0, 1, 1,
-0.2571223, -0.5035897, -3.152973, 0, 0, 0, 1, 1,
-0.2563654, -0.3589344, -3.273237, 0, 0, 0, 1, 1,
-0.2560486, 0.5092127, -0.389623, 1, 1, 1, 1, 1,
-0.2557244, 0.2906682, -1.810323, 1, 1, 1, 1, 1,
-0.2492819, 0.5790745, -0.341119, 1, 1, 1, 1, 1,
-0.2479781, -1.031543, -2.424436, 1, 1, 1, 1, 1,
-0.2424405, 0.1351178, -1.300585, 1, 1, 1, 1, 1,
-0.2405096, 0.8900843, 1.245992, 1, 1, 1, 1, 1,
-0.2383791, -0.8572991, -3.347406, 1, 1, 1, 1, 1,
-0.2379042, -1.940778, -3.530787, 1, 1, 1, 1, 1,
-0.2305332, -0.6094866, -4.109641, 1, 1, 1, 1, 1,
-0.2303526, 0.631983, 0.5924903, 1, 1, 1, 1, 1,
-0.2286876, -0.6290581, -3.384668, 1, 1, 1, 1, 1,
-0.2239145, -0.0909398, -2.044585, 1, 1, 1, 1, 1,
-0.2223929, -0.02365098, -3.224845, 1, 1, 1, 1, 1,
-0.222138, 0.205985, -0.6703998, 1, 1, 1, 1, 1,
-0.2215264, 1.075856, -0.2991944, 1, 1, 1, 1, 1,
-0.2204935, 0.191664, -1.838776, 0, 0, 1, 1, 1,
-0.2193945, 0.4147572, 0.534326, 1, 0, 0, 1, 1,
-0.2170036, -0.7051224, -2.664411, 1, 0, 0, 1, 1,
-0.2163683, -1.925004, -2.836821, 1, 0, 0, 1, 1,
-0.2117059, -1.939924, -4.105634, 1, 0, 0, 1, 1,
-0.2116989, -1.336092, -0.9458376, 1, 0, 0, 1, 1,
-0.2106624, 0.4198335, -0.6828894, 0, 0, 0, 1, 1,
-0.2099413, 0.776075, 0.8403012, 0, 0, 0, 1, 1,
-0.2074261, 0.5548421, -0.6450214, 0, 0, 0, 1, 1,
-0.2039132, -0.7755284, -3.560388, 0, 0, 0, 1, 1,
-0.203465, -1.721048, -2.505568, 0, 0, 0, 1, 1,
-0.2032129, 0.8634519, 0.01268683, 0, 0, 0, 1, 1,
-0.1991558, -0.8724107, -2.228567, 0, 0, 0, 1, 1,
-0.1974897, -0.2848217, -4.639081, 1, 1, 1, 1, 1,
-0.1970963, -0.937426, -2.236312, 1, 1, 1, 1, 1,
-0.1963554, -0.3628899, -3.981559, 1, 1, 1, 1, 1,
-0.1943674, 0.02283325, -3.240222, 1, 1, 1, 1, 1,
-0.1855954, 0.1398467, -0.8637152, 1, 1, 1, 1, 1,
-0.1800895, -0.2314951, -1.129166, 1, 1, 1, 1, 1,
-0.1755491, 0.7544879, 0.1144702, 1, 1, 1, 1, 1,
-0.1749751, -0.03075024, -1.860045, 1, 1, 1, 1, 1,
-0.1723779, -0.5909018, -2.362677, 1, 1, 1, 1, 1,
-0.1706092, -0.2347345, -2.277323, 1, 1, 1, 1, 1,
-0.1667762, -0.2702257, -2.910763, 1, 1, 1, 1, 1,
-0.1659381, -1.984617, -3.135223, 1, 1, 1, 1, 1,
-0.1639351, 0.6132872, 0.2537096, 1, 1, 1, 1, 1,
-0.1579167, 1.435586, 0.2957163, 1, 1, 1, 1, 1,
-0.1554379, 0.1132729, 0.1712596, 1, 1, 1, 1, 1,
-0.1541358, 0.04404892, -2.115611, 0, 0, 1, 1, 1,
-0.1533867, -0.4409071, -2.502573, 1, 0, 0, 1, 1,
-0.14689, -0.08606313, -2.827793, 1, 0, 0, 1, 1,
-0.1467696, -1.412246, -0.8843345, 1, 0, 0, 1, 1,
-0.1454389, -1.490682, -2.444351, 1, 0, 0, 1, 1,
-0.1390795, -2.090056, -3.965087, 1, 0, 0, 1, 1,
-0.1369916, -0.4438807, -2.096323, 0, 0, 0, 1, 1,
-0.1363586, 0.1802376, 0.1264279, 0, 0, 0, 1, 1,
-0.1320518, 0.7854191, -1.177834, 0, 0, 0, 1, 1,
-0.1316717, -1.285576, -2.130085, 0, 0, 0, 1, 1,
-0.1307997, -2.206442, -3.397695, 0, 0, 0, 1, 1,
-0.1287257, -0.4489779, -4.025799, 0, 0, 0, 1, 1,
-0.1262582, 0.8644215, 0.7137312, 0, 0, 0, 1, 1,
-0.1257302, 0.7107992, -1.700557, 1, 1, 1, 1, 1,
-0.1187174, -1.74512, -3.205008, 1, 1, 1, 1, 1,
-0.1170211, -1.170028, -1.805974, 1, 1, 1, 1, 1,
-0.1158373, -0.6590204, -3.147442, 1, 1, 1, 1, 1,
-0.1141564, -0.4958881, -4.757562, 1, 1, 1, 1, 1,
-0.1117472, -0.1452402, -1.544813, 1, 1, 1, 1, 1,
-0.1072635, 0.1634038, -0.2209735, 1, 1, 1, 1, 1,
-0.1035605, 0.1720009, -0.03347735, 1, 1, 1, 1, 1,
-0.1018948, -0.6045164, -3.15841, 1, 1, 1, 1, 1,
-0.09747373, -1.904297, -1.732327, 1, 1, 1, 1, 1,
-0.09683751, 0.7135291, -1.357417, 1, 1, 1, 1, 1,
-0.09582912, -1.01793, -4.167178, 1, 1, 1, 1, 1,
-0.09347978, -0.0357249, -1.664785, 1, 1, 1, 1, 1,
-0.0895004, -0.5375224, -4.210665, 1, 1, 1, 1, 1,
-0.08843893, 0.4876606, 1.233534, 1, 1, 1, 1, 1,
-0.08834212, 1.569626, 0.1511608, 0, 0, 1, 1, 1,
-0.08485216, -1.002766, -1.625449, 1, 0, 0, 1, 1,
-0.07866595, -0.0523619, -3.781627, 1, 0, 0, 1, 1,
-0.07751466, 0.6342906, -0.4304861, 1, 0, 0, 1, 1,
-0.07627974, -1.087967, -2.909771, 1, 0, 0, 1, 1,
-0.07438294, -0.462752, -3.413077, 1, 0, 0, 1, 1,
-0.07325508, -0.6322204, -0.6000711, 0, 0, 0, 1, 1,
-0.07198229, -0.3584619, -3.019289, 0, 0, 0, 1, 1,
-0.07065392, -0.1538317, -2.091166, 0, 0, 0, 1, 1,
-0.06962556, -1.992192, -2.806774, 0, 0, 0, 1, 1,
-0.0694226, 1.825581, -1.032416, 0, 0, 0, 1, 1,
-0.06242545, -0.6694656, -3.341906, 0, 0, 0, 1, 1,
-0.05801578, -0.4331751, -2.868317, 0, 0, 0, 1, 1,
-0.05018879, 0.8696569, 0.3183623, 1, 1, 1, 1, 1,
-0.04680971, -0.5566685, -5.579606, 1, 1, 1, 1, 1,
-0.0454655, 0.9749164, -0.7779269, 1, 1, 1, 1, 1,
-0.03955816, -1.071889, -3.253936, 1, 1, 1, 1, 1,
-0.03869658, 1.176299, 1.305851, 1, 1, 1, 1, 1,
-0.03532414, -0.8683169, -0.8353778, 1, 1, 1, 1, 1,
-0.03483742, -0.4477291, -1.537058, 1, 1, 1, 1, 1,
-0.03313113, 0.9509318, 1.335227, 1, 1, 1, 1, 1,
-0.03254605, 1.591759, -0.3168885, 1, 1, 1, 1, 1,
-0.03091124, -1.089583, -4.264677, 1, 1, 1, 1, 1,
-0.02899461, 0.3723451, 0.1700503, 1, 1, 1, 1, 1,
-0.02797445, 0.756521, 1.435367, 1, 1, 1, 1, 1,
-0.0260058, 1.602569, -1.088979, 1, 1, 1, 1, 1,
-0.02014884, -0.1647139, -3.113519, 1, 1, 1, 1, 1,
-0.01364344, 0.7237883, 1.379433, 1, 1, 1, 1, 1,
-0.01170267, 1.081959, 0.2342777, 0, 0, 1, 1, 1,
-0.01022963, 0.743066, -2.908878, 1, 0, 0, 1, 1,
-0.009714866, -0.8375857, -3.580114, 1, 0, 0, 1, 1,
-0.00813453, 0.9425091, -0.8306801, 1, 0, 0, 1, 1,
-0.00723902, -0.6484752, -4.574048, 1, 0, 0, 1, 1,
-0.0050624, -0.4649988, -2.424324, 1, 0, 0, 1, 1,
-0.003779988, 0.6063913, -0.1737129, 0, 0, 0, 1, 1,
-0.003494562, -0.8031117, -2.878488, 0, 0, 0, 1, 1,
-0.003132319, -0.4696152, -4.181364, 0, 0, 0, 1, 1,
0.0004093469, -0.5691771, 1.995099, 0, 0, 0, 1, 1,
0.001142945, -1.399303, 1.893093, 0, 0, 0, 1, 1,
0.00147556, -1.867994, 3.767567, 0, 0, 0, 1, 1,
0.005738137, 1.422549, -0.9935119, 0, 0, 0, 1, 1,
0.007521048, 0.1390876, 0.4996628, 1, 1, 1, 1, 1,
0.008427161, 0.706602, 0.6010404, 1, 1, 1, 1, 1,
0.009190448, -0.5633631, 3.316376, 1, 1, 1, 1, 1,
0.01045337, 2.745483, 0.9184029, 1, 1, 1, 1, 1,
0.01075374, 1.602523, 0.3126002, 1, 1, 1, 1, 1,
0.01112385, 0.215527, -0.05769398, 1, 1, 1, 1, 1,
0.01113362, 0.937746, -1.23606, 1, 1, 1, 1, 1,
0.0158994, 0.08558703, 0.4557995, 1, 1, 1, 1, 1,
0.01644585, 0.8321003, -1.172595, 1, 1, 1, 1, 1,
0.02058082, 1.64586, 1.20591, 1, 1, 1, 1, 1,
0.02073006, 0.4574792, 0.1599348, 1, 1, 1, 1, 1,
0.02182228, 0.2663729, 0.1480653, 1, 1, 1, 1, 1,
0.02183318, 1.617146, 1.154247, 1, 1, 1, 1, 1,
0.02513874, 1.860386, 0.3231434, 1, 1, 1, 1, 1,
0.02906214, -0.09908628, 2.214274, 1, 1, 1, 1, 1,
0.0299081, 2.141, 1.564698, 0, 0, 1, 1, 1,
0.03245097, -1.077262, 2.003384, 1, 0, 0, 1, 1,
0.03294612, 0.7675283, 0.07766441, 1, 0, 0, 1, 1,
0.03798359, -0.1929993, 0.4099681, 1, 0, 0, 1, 1,
0.03871094, 1.505123, -2.189596, 1, 0, 0, 1, 1,
0.04127839, 0.1829941, -0.6508074, 1, 0, 0, 1, 1,
0.05226371, 0.7829, 0.3435961, 0, 0, 0, 1, 1,
0.05249894, -0.1122972, 0.6682984, 0, 0, 0, 1, 1,
0.05790544, 0.1815368, 0.34044, 0, 0, 0, 1, 1,
0.05866246, -0.9114285, 2.880212, 0, 0, 0, 1, 1,
0.0612727, -0.0468329, 2.460454, 0, 0, 0, 1, 1,
0.06183581, 0.04570127, 1.778894, 0, 0, 0, 1, 1,
0.06730519, 0.9696504, -0.1773147, 0, 0, 0, 1, 1,
0.06802606, -0.3804601, 3.801013, 1, 1, 1, 1, 1,
0.073222, 1.811792, 0.4371572, 1, 1, 1, 1, 1,
0.07892914, 0.2742819, 0.4104916, 1, 1, 1, 1, 1,
0.08155845, 0.7107294, -1.297065, 1, 1, 1, 1, 1,
0.08217924, 0.9773439, 0.6314407, 1, 1, 1, 1, 1,
0.08355096, 0.7938926, -1.088037, 1, 1, 1, 1, 1,
0.08378683, -2.547738, 2.55851, 1, 1, 1, 1, 1,
0.08476117, -0.004581352, 2.171732, 1, 1, 1, 1, 1,
0.08800261, -0.1400992, 3.974488, 1, 1, 1, 1, 1,
0.0937886, -0.4947529, 3.281519, 1, 1, 1, 1, 1,
0.09430975, 0.6625112, -0.470463, 1, 1, 1, 1, 1,
0.09846129, 2.274246, -1.320985, 1, 1, 1, 1, 1,
0.09897329, 0.04120762, 1.287684, 1, 1, 1, 1, 1,
0.09904781, -1.017592, 2.553923, 1, 1, 1, 1, 1,
0.1001579, 0.8705809, 1.019609, 1, 1, 1, 1, 1,
0.1059279, -0.3383859, 3.701898, 0, 0, 1, 1, 1,
0.1068194, -0.07805945, 0.8770043, 1, 0, 0, 1, 1,
0.1069205, 1.124677, -0.2758937, 1, 0, 0, 1, 1,
0.1076381, -0.5757406, 3.151851, 1, 0, 0, 1, 1,
0.1095003, -1.663301, 3.434824, 1, 0, 0, 1, 1,
0.1130659, 0.3514431, -0.09334809, 1, 0, 0, 1, 1,
0.1146769, -0.01065089, 2.81495, 0, 0, 0, 1, 1,
0.1151688, 1.212381, -0.1244961, 0, 0, 0, 1, 1,
0.1159076, -0.1291161, 2.050233, 0, 0, 0, 1, 1,
0.1192633, -1.483646, 2.664587, 0, 0, 0, 1, 1,
0.1204909, -1.003476, 3.182432, 0, 0, 0, 1, 1,
0.1258593, 1.940534, 0.3660454, 0, 0, 0, 1, 1,
0.1274028, 0.94472, -0.1252616, 0, 0, 0, 1, 1,
0.127999, 0.3466304, 1.115058, 1, 1, 1, 1, 1,
0.1294205, 0.2586511, -1.757416, 1, 1, 1, 1, 1,
0.1322839, 0.7096339, 0.2994311, 1, 1, 1, 1, 1,
0.1323982, 1.079574, 0.5464917, 1, 1, 1, 1, 1,
0.1390612, -1.981999, 3.204905, 1, 1, 1, 1, 1,
0.1418231, 0.4153131, 2.283472, 1, 1, 1, 1, 1,
0.1476153, 0.1937864, 0.4815369, 1, 1, 1, 1, 1,
0.1521927, -0.3567935, 2.486341, 1, 1, 1, 1, 1,
0.1540757, 0.04874754, -0.598711, 1, 1, 1, 1, 1,
0.1556467, -0.1313096, 2.60276, 1, 1, 1, 1, 1,
0.1569291, -0.5986982, 2.332703, 1, 1, 1, 1, 1,
0.1596463, -0.6002514, 0.551968, 1, 1, 1, 1, 1,
0.159697, -1.5017, 2.069946, 1, 1, 1, 1, 1,
0.1600223, 0.4101229, -1.071323, 1, 1, 1, 1, 1,
0.1605536, 1.219273, -0.3021736, 1, 1, 1, 1, 1,
0.163094, -1.354063, 3.144588, 0, 0, 1, 1, 1,
0.1631095, -2.406673, 2.929203, 1, 0, 0, 1, 1,
0.165064, 1.202768, 0.3018637, 1, 0, 0, 1, 1,
0.1676029, 0.1031779, 1.473518, 1, 0, 0, 1, 1,
0.1698556, -0.33797, 1.286873, 1, 0, 0, 1, 1,
0.1713944, -1.621045, 3.259586, 1, 0, 0, 1, 1,
0.1732198, -0.9324723, 1.931657, 0, 0, 0, 1, 1,
0.1733264, -1.645044, 2.795958, 0, 0, 0, 1, 1,
0.1783156, -0.5724558, 3.302877, 0, 0, 0, 1, 1,
0.1800777, 0.01086129, 1.823295, 0, 0, 0, 1, 1,
0.1809196, 0.1615174, 1.165729, 0, 0, 0, 1, 1,
0.1825684, -0.04288569, 1.291741, 0, 0, 0, 1, 1,
0.1833298, 0.9689666, 0.5393715, 0, 0, 0, 1, 1,
0.1840892, -0.2179605, 2.148947, 1, 1, 1, 1, 1,
0.2006999, 0.7839198, -0.6538975, 1, 1, 1, 1, 1,
0.204695, 1.287006, 1.231273, 1, 1, 1, 1, 1,
0.2062436, 0.0330728, -0.4477751, 1, 1, 1, 1, 1,
0.2064817, -0.2494161, 2.265853, 1, 1, 1, 1, 1,
0.2217442, 1.65677, 0.9783062, 1, 1, 1, 1, 1,
0.2256236, 0.6963912, 1.584009, 1, 1, 1, 1, 1,
0.2290888, -0.4641721, 0.2566461, 1, 1, 1, 1, 1,
0.2303611, 1.981577, 0.8563857, 1, 1, 1, 1, 1,
0.2305125, -0.9552161, 2.870698, 1, 1, 1, 1, 1,
0.2340458, -1.083768, 1.350278, 1, 1, 1, 1, 1,
0.2367629, -0.3399964, 3.187809, 1, 1, 1, 1, 1,
0.2394992, 0.1768192, 3.289412, 1, 1, 1, 1, 1,
0.2400762, 0.5290146, 0.07369338, 1, 1, 1, 1, 1,
0.2458, -1.232438, 1.915777, 1, 1, 1, 1, 1,
0.2478775, 0.3474258, 1.842317, 0, 0, 1, 1, 1,
0.2518977, 0.3673443, 0.5345871, 1, 0, 0, 1, 1,
0.2601846, -0.8398257, 4.3561, 1, 0, 0, 1, 1,
0.2603196, -0.7543675, 3.374095, 1, 0, 0, 1, 1,
0.26426, 0.861921, 2.164959, 1, 0, 0, 1, 1,
0.2680025, 2.584458, -0.2171967, 1, 0, 0, 1, 1,
0.2700305, 0.04134441, 1.231689, 0, 0, 0, 1, 1,
0.2783536, 0.5383506, 1.053291, 0, 0, 0, 1, 1,
0.2792668, -1.188511, 3.567311, 0, 0, 0, 1, 1,
0.2822814, -0.1663362, 1.182693, 0, 0, 0, 1, 1,
0.2837224, -0.4554201, 1.606575, 0, 0, 0, 1, 1,
0.2856004, 1.936106, 0.3863701, 0, 0, 0, 1, 1,
0.2871912, -0.07198421, 2.090503, 0, 0, 0, 1, 1,
0.2885487, 1.069047, 1.213075, 1, 1, 1, 1, 1,
0.2893488, 0.190819, 0.06664098, 1, 1, 1, 1, 1,
0.2933701, 1.283533, -0.6016458, 1, 1, 1, 1, 1,
0.2972183, -1.189442, 4.319157, 1, 1, 1, 1, 1,
0.3051657, -0.4583745, 1.862545, 1, 1, 1, 1, 1,
0.3081415, -0.9658456, 1.945035, 1, 1, 1, 1, 1,
0.310679, 0.8391974, 1.550192, 1, 1, 1, 1, 1,
0.3126621, -0.8003873, 2.403799, 1, 1, 1, 1, 1,
0.3162559, -0.9971876, 3.89379, 1, 1, 1, 1, 1,
0.3169138, 1.056338, 0.4344079, 1, 1, 1, 1, 1,
0.3236885, -0.07138145, 3.238795, 1, 1, 1, 1, 1,
0.3290142, 1.36784, 1.01279, 1, 1, 1, 1, 1,
0.3303272, -0.8227969, 3.013283, 1, 1, 1, 1, 1,
0.3318178, 0.434232, 1.480826, 1, 1, 1, 1, 1,
0.3323091, 1.097253, 0.7403671, 1, 1, 1, 1, 1,
0.3355273, 1.033396, -0.01914972, 0, 0, 1, 1, 1,
0.3361728, 0.6265628, 1.188689, 1, 0, 0, 1, 1,
0.3388255, -0.6311688, 1.549859, 1, 0, 0, 1, 1,
0.3432035, -0.4948424, 2.989708, 1, 0, 0, 1, 1,
0.3444404, 1.745548, 0.2414602, 1, 0, 0, 1, 1,
0.348178, 0.5176512, 1.151185, 1, 0, 0, 1, 1,
0.3498283, 1.282591, -0.6157315, 0, 0, 0, 1, 1,
0.3596613, -1.335398, 3.589141, 0, 0, 0, 1, 1,
0.3600276, 1.501835, -1.20061, 0, 0, 0, 1, 1,
0.3625652, 0.6749179, 1.105466, 0, 0, 0, 1, 1,
0.3650129, 0.02178192, 1.708603, 0, 0, 0, 1, 1,
0.3654391, -0.1868216, 0.5390323, 0, 0, 0, 1, 1,
0.3675404, -0.2064712, 1.635341, 0, 0, 0, 1, 1,
0.3681624, 0.4244964, -0.9636799, 1, 1, 1, 1, 1,
0.3785416, 1.881097, -0.345093, 1, 1, 1, 1, 1,
0.3825874, 1.832009, 0.5313694, 1, 1, 1, 1, 1,
0.3836419, -0.103044, 2.313392, 1, 1, 1, 1, 1,
0.3838199, 1.28267, -0.08196548, 1, 1, 1, 1, 1,
0.386604, 0.7512362, -0.4732037, 1, 1, 1, 1, 1,
0.3993113, 0.9876075, 0.3805653, 1, 1, 1, 1, 1,
0.4015518, 0.1488058, -0.8475702, 1, 1, 1, 1, 1,
0.4063056, 0.783572, 0.7278111, 1, 1, 1, 1, 1,
0.4078571, -0.8591422, 3.988803, 1, 1, 1, 1, 1,
0.4122663, -0.5829095, 1.802618, 1, 1, 1, 1, 1,
0.4161968, -1.228146, 3.014275, 1, 1, 1, 1, 1,
0.4164697, -1.403127, 2.81058, 1, 1, 1, 1, 1,
0.4173014, 1.213191, 1.249023, 1, 1, 1, 1, 1,
0.4177557, -1.061983, 2.895901, 1, 1, 1, 1, 1,
0.4273599, -2.26819, 4.277306, 0, 0, 1, 1, 1,
0.4302572, -0.4933396, 1.415587, 1, 0, 0, 1, 1,
0.4306006, 0.4142158, 2.16426, 1, 0, 0, 1, 1,
0.4308164, 0.6274174, -0.2898652, 1, 0, 0, 1, 1,
0.4330463, 0.2829016, 0.5021129, 1, 0, 0, 1, 1,
0.4434084, -0.9426674, 5.630918, 1, 0, 0, 1, 1,
0.4476975, 1.416193, 0.1547771, 0, 0, 0, 1, 1,
0.4672866, -0.2000167, 1.816039, 0, 0, 0, 1, 1,
0.4709266, 0.3463337, 1.467378, 0, 0, 0, 1, 1,
0.4723814, 0.3952954, 2.609627, 0, 0, 0, 1, 1,
0.4727885, 1.035467, 0.005557866, 0, 0, 0, 1, 1,
0.4783118, 0.01571043, 1.324267, 0, 0, 0, 1, 1,
0.4803792, 0.2399927, 1.99061, 0, 0, 0, 1, 1,
0.4822701, -0.8715376, 4.869643, 1, 1, 1, 1, 1,
0.4869113, 0.113178, 0.8594713, 1, 1, 1, 1, 1,
0.4934585, -0.9425265, 2.049321, 1, 1, 1, 1, 1,
0.4959496, 0.2970968, 1.550563, 1, 1, 1, 1, 1,
0.4967441, -0.7294213, 2.734086, 1, 1, 1, 1, 1,
0.5024029, -1.393553, 3.594321, 1, 1, 1, 1, 1,
0.5026973, 0.4214214, 0.2859949, 1, 1, 1, 1, 1,
0.5028154, 1.508381, -0.1715947, 1, 1, 1, 1, 1,
0.5035487, 0.3342308, 0.09802421, 1, 1, 1, 1, 1,
0.5051753, 1.24502, 1.237309, 1, 1, 1, 1, 1,
0.5059804, -0.330558, 2.485507, 1, 1, 1, 1, 1,
0.5066433, 0.6222748, 3.588152, 1, 1, 1, 1, 1,
0.5073869, 1.143125, 0.8067804, 1, 1, 1, 1, 1,
0.5094747, 0.4624208, 0.3303417, 1, 1, 1, 1, 1,
0.510187, -1.648591, 3.261065, 1, 1, 1, 1, 1,
0.5119063, 1.931905, -0.4805083, 0, 0, 1, 1, 1,
0.5130095, 0.1575542, 0.9378856, 1, 0, 0, 1, 1,
0.5150847, 1.140543, 0.1163455, 1, 0, 0, 1, 1,
0.5252199, -1.938478, 5.117929, 1, 0, 0, 1, 1,
0.5300202, 0.321104, 0.9682595, 1, 0, 0, 1, 1,
0.5311775, -0.3784926, 1.53258, 1, 0, 0, 1, 1,
0.5364642, 0.2202817, 2.222374, 0, 0, 0, 1, 1,
0.5373052, -1.520195, 2.071606, 0, 0, 0, 1, 1,
0.540076, -0.6634174, 1.710487, 0, 0, 0, 1, 1,
0.5427914, -0.8368987, 2.850026, 0, 0, 0, 1, 1,
0.5439846, -0.08029571, -0.139291, 0, 0, 0, 1, 1,
0.5529978, 0.2013819, 2.261955, 0, 0, 0, 1, 1,
0.553867, 0.5047041, -0.3407947, 0, 0, 0, 1, 1,
0.560859, -0.9612436, 2.204566, 1, 1, 1, 1, 1,
0.5608941, 1.705136, 0.4927265, 1, 1, 1, 1, 1,
0.5621155, 1.746749, 0.02467697, 1, 1, 1, 1, 1,
0.5622315, -0.9282617, 2.0216, 1, 1, 1, 1, 1,
0.5634515, -0.2677324, 1.51869, 1, 1, 1, 1, 1,
0.5654664, -1.824035, 3.252864, 1, 1, 1, 1, 1,
0.5744424, 0.9685122, 1.289703, 1, 1, 1, 1, 1,
0.5800765, 0.1973958, 1.439659, 1, 1, 1, 1, 1,
0.5827011, -1.020455, 3.607689, 1, 1, 1, 1, 1,
0.5838071, -0.1444618, 1.475086, 1, 1, 1, 1, 1,
0.5840874, -0.540659, 3.052857, 1, 1, 1, 1, 1,
0.5862462, 1.447725, -0.002307196, 1, 1, 1, 1, 1,
0.5930898, 0.8707625, 1.684951, 1, 1, 1, 1, 1,
0.5958207, 0.3391896, 0.1561159, 1, 1, 1, 1, 1,
0.5979595, -0.2221197, 2.025124, 1, 1, 1, 1, 1,
0.5990887, 0.4745464, 0.03867298, 0, 0, 1, 1, 1,
0.6023658, -0.5702721, 2.451427, 1, 0, 0, 1, 1,
0.6060232, -1.28673, 3.412887, 1, 0, 0, 1, 1,
0.6069436, 0.6810193, 0.1403587, 1, 0, 0, 1, 1,
0.6080184, -0.4138449, 2.813213, 1, 0, 0, 1, 1,
0.608831, -1.743989, 4.434374, 1, 0, 0, 1, 1,
0.629091, 0.5662993, 1.715519, 0, 0, 0, 1, 1,
0.6305124, -0.2126696, 2.824459, 0, 0, 0, 1, 1,
0.6420308, -0.8621111, 3.102548, 0, 0, 0, 1, 1,
0.6470724, 1.314308, -0.2973831, 0, 0, 0, 1, 1,
0.6486842, -0.166557, 0.1212131, 0, 0, 0, 1, 1,
0.6498169, 1.164984, 1.299643, 0, 0, 0, 1, 1,
0.6564475, 0.02192454, 0.9044937, 0, 0, 0, 1, 1,
0.6597871, -0.5294411, 0.9285808, 1, 1, 1, 1, 1,
0.6624345, -0.1309256, 2.54883, 1, 1, 1, 1, 1,
0.6642761, -1.585489, 1.771766, 1, 1, 1, 1, 1,
0.6660932, -1.856663, 3.4578, 1, 1, 1, 1, 1,
0.6684817, 1.366507, 3.004662, 1, 1, 1, 1, 1,
0.6697552, -1.188252, 1.565195, 1, 1, 1, 1, 1,
0.6712714, 1.315848, 1.410222, 1, 1, 1, 1, 1,
0.6714815, 0.4350419, 2.031555, 1, 1, 1, 1, 1,
0.6781597, 0.2138974, 2.432416, 1, 1, 1, 1, 1,
0.6833247, -0.2585431, 2.375978, 1, 1, 1, 1, 1,
0.6864226, -0.6599907, 3.066426, 1, 1, 1, 1, 1,
0.691373, 0.4375237, 0.8616951, 1, 1, 1, 1, 1,
0.6916009, 0.3992069, 1.126532, 1, 1, 1, 1, 1,
0.6946719, -1.198026, 3.265044, 1, 1, 1, 1, 1,
0.6947005, -0.914381, 2.609608, 1, 1, 1, 1, 1,
0.6966162, 0.9609572, 0.5642686, 0, 0, 1, 1, 1,
0.6966732, 0.3461357, 1.39743, 1, 0, 0, 1, 1,
0.6970642, 1.4844, 1.120257, 1, 0, 0, 1, 1,
0.697868, -0.9472743, 2.548918, 1, 0, 0, 1, 1,
0.7093364, -1.075335, 4.405409, 1, 0, 0, 1, 1,
0.7191084, -0.9627146, 2.345034, 1, 0, 0, 1, 1,
0.7194398, -0.1613369, 1.711009, 0, 0, 0, 1, 1,
0.7218086, 0.3014489, 1.812938, 0, 0, 0, 1, 1,
0.727065, 0.7803693, 1.443516, 0, 0, 0, 1, 1,
0.7437447, 0.1930806, 1.377125, 0, 0, 0, 1, 1,
0.7532193, -0.8502288, 0.9017092, 0, 0, 0, 1, 1,
0.7540473, 0.6548441, 1.368821, 0, 0, 0, 1, 1,
0.7583453, -1.680661, 3.447437, 0, 0, 0, 1, 1,
0.762326, -1.175695, 2.197982, 1, 1, 1, 1, 1,
0.7638496, -0.1441054, 1.719389, 1, 1, 1, 1, 1,
0.7662497, 0.3673423, 0.9103275, 1, 1, 1, 1, 1,
0.7674484, 1.641486, 0.1978298, 1, 1, 1, 1, 1,
0.7680428, -0.01074117, 0.4186356, 1, 1, 1, 1, 1,
0.7790058, 0.6335646, 0.441313, 1, 1, 1, 1, 1,
0.7794, 1.164385, -1.060151, 1, 1, 1, 1, 1,
0.7853014, -0.3997884, 2.054156, 1, 1, 1, 1, 1,
0.7859402, 1.55426, 0.4016206, 1, 1, 1, 1, 1,
0.790901, 0.121046, 0.4477574, 1, 1, 1, 1, 1,
0.8043482, 1.611932, -0.7176811, 1, 1, 1, 1, 1,
0.807833, -0.5382, 3.652811, 1, 1, 1, 1, 1,
0.809662, -0.8978796, 2.429255, 1, 1, 1, 1, 1,
0.810939, 0.7518699, 1.744295, 1, 1, 1, 1, 1,
0.8115732, 1.266443, -0.7826389, 1, 1, 1, 1, 1,
0.8156616, 1.375159, 2.514046, 0, 0, 1, 1, 1,
0.8179162, 0.4278134, 0.4970226, 1, 0, 0, 1, 1,
0.8199419, -0.3380846, 2.359292, 1, 0, 0, 1, 1,
0.8273299, 0.1217417, 2.035998, 1, 0, 0, 1, 1,
0.8334016, -0.2602844, 3.513824, 1, 0, 0, 1, 1,
0.8372722, 2.393342, -0.3875562, 1, 0, 0, 1, 1,
0.8374287, 0.3597774, 1.378441, 0, 0, 0, 1, 1,
0.8406448, 1.805539, -0.003153786, 0, 0, 0, 1, 1,
0.8467269, 1.37542, 1.15579, 0, 0, 0, 1, 1,
0.8490683, -1.09094, 2.351848, 0, 0, 0, 1, 1,
0.854978, -1.281147, 4.055211, 0, 0, 0, 1, 1,
0.8569899, -0.05457042, 1.438168, 0, 0, 0, 1, 1,
0.8593972, -1.356809, 2.569245, 0, 0, 0, 1, 1,
0.8663485, -1.612044, 1.818743, 1, 1, 1, 1, 1,
0.8679012, -0.6068881, 1.883994, 1, 1, 1, 1, 1,
0.8714125, 1.094032, 0.1474423, 1, 1, 1, 1, 1,
0.8716066, -0.06519508, 1.875594, 1, 1, 1, 1, 1,
0.8812847, 0.8218742, 0.6609849, 1, 1, 1, 1, 1,
0.8815375, 0.8703564, 1.091606, 1, 1, 1, 1, 1,
0.8815716, 1.234481, -0.9466907, 1, 1, 1, 1, 1,
0.8826078, 1.293963, 0.6212568, 1, 1, 1, 1, 1,
0.890462, -0.3863279, 0.799316, 1, 1, 1, 1, 1,
0.8926104, -0.1142134, -1.283056, 1, 1, 1, 1, 1,
0.8943332, -0.9133765, 3.480683, 1, 1, 1, 1, 1,
0.8964422, 0.9881487, 0.6004072, 1, 1, 1, 1, 1,
0.8983506, 0.03769466, 1.712791, 1, 1, 1, 1, 1,
0.9028239, -0.497542, 0.8235598, 1, 1, 1, 1, 1,
0.9050345, -0.7629288, 2.080858, 1, 1, 1, 1, 1,
0.9096396, 0.5533749, -0.646503, 0, 0, 1, 1, 1,
0.911956, -0.4395763, 1.836462, 1, 0, 0, 1, 1,
0.9134464, -1.139287, 4.00671, 1, 0, 0, 1, 1,
0.9173546, 1.926313, 2.16272, 1, 0, 0, 1, 1,
0.92017, -1.506749, 1.604046, 1, 0, 0, 1, 1,
0.9255148, -1.673217, 3.877988, 1, 0, 0, 1, 1,
0.926533, -0.7284241, 2.461338, 0, 0, 0, 1, 1,
0.9281731, 0.02227439, 1.385586, 0, 0, 0, 1, 1,
0.9284999, -0.3458129, 3.719291, 0, 0, 0, 1, 1,
0.930717, 0.4586067, 2.092641, 0, 0, 0, 1, 1,
0.9363587, 0.0193198, 3.524894, 0, 0, 0, 1, 1,
0.9387544, -1.474722, 2.101078, 0, 0, 0, 1, 1,
0.9474266, -0.3561971, 2.685905, 0, 0, 0, 1, 1,
0.9493941, 0.8752408, 2.583279, 1, 1, 1, 1, 1,
0.9497606, 1.0394, 1.224565, 1, 1, 1, 1, 1,
0.953015, 0.1093129, 0.8563292, 1, 1, 1, 1, 1,
0.9554602, -0.7809016, 2.924938, 1, 1, 1, 1, 1,
0.9561801, 1.064338, 1.357644, 1, 1, 1, 1, 1,
0.9577431, -0.4701995, 3.999073, 1, 1, 1, 1, 1,
0.961679, -0.6067966, 2.90141, 1, 1, 1, 1, 1,
0.9698888, -0.5892971, 2.925689, 1, 1, 1, 1, 1,
0.9702337, 0.5805212, 1.606322, 1, 1, 1, 1, 1,
0.9711537, -0.55963, 2.170964, 1, 1, 1, 1, 1,
0.9714966, -0.9064814, 1.881001, 1, 1, 1, 1, 1,
0.9742547, -0.1166627, 3.578703, 1, 1, 1, 1, 1,
0.9825891, -0.1283186, 0.873679, 1, 1, 1, 1, 1,
0.9866377, 0.2484627, 0.1633805, 1, 1, 1, 1, 1,
0.9898468, -0.9847521, 1.613819, 1, 1, 1, 1, 1,
0.9942569, 0.908143, 0.07088552, 0, 0, 1, 1, 1,
0.9993053, 0.2000474, 1.419717, 1, 0, 0, 1, 1,
1.002803, -0.5092202, 0.6706308, 1, 0, 0, 1, 1,
1.007458, 0.01766145, 1.24207, 1, 0, 0, 1, 1,
1.01526, -1.02591, 4.110239, 1, 0, 0, 1, 1,
1.020193, -0.06331135, -0.645436, 1, 0, 0, 1, 1,
1.021161, -1.667655, 1.414764, 0, 0, 0, 1, 1,
1.023256, -0.2368846, 1.2124, 0, 0, 0, 1, 1,
1.024024, -1.549448, 1.764172, 0, 0, 0, 1, 1,
1.027085, 1.70066, 1.577889, 0, 0, 0, 1, 1,
1.029388, -0.1348308, 0.06515382, 0, 0, 0, 1, 1,
1.036595, -0.0766817, 1.918704, 0, 0, 0, 1, 1,
1.039784, -0.9313915, 3.392221, 0, 0, 0, 1, 1,
1.040128, 0.9053296, 1.667572, 1, 1, 1, 1, 1,
1.043182, 0.5395693, 2.043061, 1, 1, 1, 1, 1,
1.045429, 1.163986, 1.429064, 1, 1, 1, 1, 1,
1.048364, 0.6813112, 2.270095, 1, 1, 1, 1, 1,
1.048803, 0.07222537, 2.39441, 1, 1, 1, 1, 1,
1.050467, -0.4533314, 4.372333, 1, 1, 1, 1, 1,
1.05435, -0.3203492, 0.6416295, 1, 1, 1, 1, 1,
1.058605, -0.06431466, 2.234359, 1, 1, 1, 1, 1,
1.059731, 0.5121581, 1.238176, 1, 1, 1, 1, 1,
1.064072, 1.861243, 0.4520371, 1, 1, 1, 1, 1,
1.068627, -1.558563, 2.358039, 1, 1, 1, 1, 1,
1.074345, -0.126387, 2.045966, 1, 1, 1, 1, 1,
1.075492, -1.748074, 0.9091859, 1, 1, 1, 1, 1,
1.098803, 0.3759911, -0.9196118, 1, 1, 1, 1, 1,
1.108104, 1.727881, 1.171026, 1, 1, 1, 1, 1,
1.108475, 0.2557077, 1.199487, 0, 0, 1, 1, 1,
1.111238, 1.198701, 0.2961203, 1, 0, 0, 1, 1,
1.12161, -1.745898, 4.1208, 1, 0, 0, 1, 1,
1.127271, -0.03063764, 2.284469, 1, 0, 0, 1, 1,
1.136146, -0.7952045, 0.05802757, 1, 0, 0, 1, 1,
1.139178, 0.6168045, -0.1482581, 1, 0, 0, 1, 1,
1.143569, 0.8814998, 2.753147, 0, 0, 0, 1, 1,
1.149928, -1.280459, 3.674727, 0, 0, 0, 1, 1,
1.15103, -0.8308325, 1.909262, 0, 0, 0, 1, 1,
1.160276, -0.03580215, 0.9851181, 0, 0, 0, 1, 1,
1.164406, -1.576524, 2.575055, 0, 0, 0, 1, 1,
1.166594, 0.2240426, 1.389474, 0, 0, 0, 1, 1,
1.169498, 0.3423271, 1.327305, 0, 0, 0, 1, 1,
1.171707, 0.1282045, 1.586012, 1, 1, 1, 1, 1,
1.178373, 0.06065108, 2.008996, 1, 1, 1, 1, 1,
1.179752, -0.05240915, 0.8690441, 1, 1, 1, 1, 1,
1.18265, 0.3660403, 1.023162, 1, 1, 1, 1, 1,
1.183416, 0.1943194, 0.6206561, 1, 1, 1, 1, 1,
1.191462, -0.845625, 0.8013886, 1, 1, 1, 1, 1,
1.191705, -1.448158, 3.608005, 1, 1, 1, 1, 1,
1.192347, 0.7421425, 0.5660795, 1, 1, 1, 1, 1,
1.227475, 0.1017635, 0.4436113, 1, 1, 1, 1, 1,
1.236356, -0.5544082, 1.301645, 1, 1, 1, 1, 1,
1.251082, -0.01829864, 1.399639, 1, 1, 1, 1, 1,
1.253577, 0.236783, 2.453542, 1, 1, 1, 1, 1,
1.258507, 2.182062, 0.2694607, 1, 1, 1, 1, 1,
1.262122, 1.561369, 1.248249, 1, 1, 1, 1, 1,
1.264802, 0.1600658, 2.308456, 1, 1, 1, 1, 1,
1.26589, 0.3471634, -1.082078, 0, 0, 1, 1, 1,
1.268905, 0.3445981, 1.877782, 1, 0, 0, 1, 1,
1.270821, -0.5969742, 2.176414, 1, 0, 0, 1, 1,
1.271145, 0.2057711, 1.899441, 1, 0, 0, 1, 1,
1.287122, -0.1294243, 0.9723822, 1, 0, 0, 1, 1,
1.294058, -0.9060428, -0.1222516, 1, 0, 0, 1, 1,
1.294152, 0.5022107, -0.1737032, 0, 0, 0, 1, 1,
1.301484, 0.7031535, 2.01023, 0, 0, 0, 1, 1,
1.307155, 0.5221047, 1.849711, 0, 0, 0, 1, 1,
1.309487, 0.05296751, 0.1083161, 0, 0, 0, 1, 1,
1.313391, 0.7005175, 0.847954, 0, 0, 0, 1, 1,
1.316996, 0.01825017, 3.190361, 0, 0, 0, 1, 1,
1.317917, 1.836529, 2.284168, 0, 0, 0, 1, 1,
1.327693, 1.322897, -0.5888369, 1, 1, 1, 1, 1,
1.329123, 1.549402, 0.8013957, 1, 1, 1, 1, 1,
1.331386, -1.104535, 4.24728, 1, 1, 1, 1, 1,
1.348223, 0.6236086, 1.895518, 1, 1, 1, 1, 1,
1.351192, -0.02924011, 0.4264884, 1, 1, 1, 1, 1,
1.356712, 0.6060368, 1.85485, 1, 1, 1, 1, 1,
1.3648, -1.246767, 0.8114579, 1, 1, 1, 1, 1,
1.365827, -0.7248847, 1.339183, 1, 1, 1, 1, 1,
1.373742, -0.0944481, 2.086324, 1, 1, 1, 1, 1,
1.377433, -0.5100807, 2.325561, 1, 1, 1, 1, 1,
1.382937, -0.6938016, 2.341039, 1, 1, 1, 1, 1,
1.384674, -1.215015, 2.212196, 1, 1, 1, 1, 1,
1.400024, -1.765218, 4.484402, 1, 1, 1, 1, 1,
1.403242, 3.054953, 1.143274, 1, 1, 1, 1, 1,
1.424572, -0.9051235, 2.827934, 1, 1, 1, 1, 1,
1.424858, -1.033191, 0.7860075, 0, 0, 1, 1, 1,
1.434512, 1.452462, 2.060683, 1, 0, 0, 1, 1,
1.456403, -0.3633067, 0.7659817, 1, 0, 0, 1, 1,
1.462935, -0.2081939, 2.706108, 1, 0, 0, 1, 1,
1.465442, -0.9029245, 1.571992, 1, 0, 0, 1, 1,
1.471444, 0.826872, 0.8419296, 1, 0, 0, 1, 1,
1.479604, -0.4024394, 2.950511, 0, 0, 0, 1, 1,
1.484566, 1.206926, 0.9192875, 0, 0, 0, 1, 1,
1.491496, -1.367537, 2.539132, 0, 0, 0, 1, 1,
1.5014, 0.4117654, 1.200684, 0, 0, 0, 1, 1,
1.505468, -1.50368, 1.291676, 0, 0, 0, 1, 1,
1.522936, -1.569263, 0.6231233, 0, 0, 0, 1, 1,
1.524428, -1.287924, 1.457439, 0, 0, 0, 1, 1,
1.526647, -0.4328868, 2.688445, 1, 1, 1, 1, 1,
1.526883, 0.7163653, 2.392286, 1, 1, 1, 1, 1,
1.543033, 0.8764502, 2.068434, 1, 1, 1, 1, 1,
1.5463, -0.2410856, 2.616148, 1, 1, 1, 1, 1,
1.55301, -0.3852571, 1.188203, 1, 1, 1, 1, 1,
1.562312, 0.9886659, 3.497719, 1, 1, 1, 1, 1,
1.576958, -0.1020326, 1.529399, 1, 1, 1, 1, 1,
1.58577, -0.6743163, 1.951745, 1, 1, 1, 1, 1,
1.59438, -0.938931, 2.88684, 1, 1, 1, 1, 1,
1.596948, 0.9634483, 0.2071158, 1, 1, 1, 1, 1,
1.606347, -0.3581742, 2.300012, 1, 1, 1, 1, 1,
1.618483, 0.8044846, 0.2045893, 1, 1, 1, 1, 1,
1.620655, -0.5768862, 1.29264, 1, 1, 1, 1, 1,
1.621156, 0.04000412, 0.1121967, 1, 1, 1, 1, 1,
1.632941, 0.05986001, 0.2962802, 1, 1, 1, 1, 1,
1.643011, -1.171959, 2.231706, 0, 0, 1, 1, 1,
1.65348, 1.127753, 0.471484, 1, 0, 0, 1, 1,
1.654069, 0.4516748, -0.1554001, 1, 0, 0, 1, 1,
1.656993, 1.522009, 1.243326, 1, 0, 0, 1, 1,
1.661476, -0.2127164, 2.905636, 1, 0, 0, 1, 1,
1.680231, -1.016719, 2.812039, 1, 0, 0, 1, 1,
1.705699, 0.9345313, 0.6783146, 0, 0, 0, 1, 1,
1.712659, 1.261414, 1.892074, 0, 0, 0, 1, 1,
1.806031, -0.4640286, 1.028971, 0, 0, 0, 1, 1,
1.821306, 0.4324752, 1.212319, 0, 0, 0, 1, 1,
1.836566, 1.287591, -0.510148, 0, 0, 0, 1, 1,
1.857004, -0.09124295, 0.9058067, 0, 0, 0, 1, 1,
1.857591, -1.622879, 2.099676, 0, 0, 0, 1, 1,
1.9016, -1.318052, 1.512913, 1, 1, 1, 1, 1,
1.941439, -0.01006149, 2.34054, 1, 1, 1, 1, 1,
1.947823, -1.119898, 3.561422, 1, 1, 1, 1, 1,
1.951138, -0.2127133, 2.418573, 1, 1, 1, 1, 1,
1.954042, 1.621551, 1.599131, 1, 1, 1, 1, 1,
1.972687, 1.572208, 1.965276, 1, 1, 1, 1, 1,
1.986506, -0.1348202, 2.903581, 1, 1, 1, 1, 1,
2.002442, -1.194393, 2.351847, 1, 1, 1, 1, 1,
2.007404, 1.279042, 1.026558, 1, 1, 1, 1, 1,
2.012814, 0.6073061, 2.229952, 1, 1, 1, 1, 1,
2.017015, -0.3971159, 2.5306, 1, 1, 1, 1, 1,
2.019048, -0.6401223, 0.4943793, 1, 1, 1, 1, 1,
2.028927, -1.095825, 0.3961795, 1, 1, 1, 1, 1,
2.066856, 0.2791749, 1.632091, 1, 1, 1, 1, 1,
2.092159, 1.249337, -2.043683, 1, 1, 1, 1, 1,
2.098931, -0.9795856, 2.876606, 0, 0, 1, 1, 1,
2.131714, 0.33047, -0.1846768, 1, 0, 0, 1, 1,
2.206928, -0.8107387, 0.1478456, 1, 0, 0, 1, 1,
2.2213, 0.4596932, 0.8807984, 1, 0, 0, 1, 1,
2.234988, -1.276401, 3.847381, 1, 0, 0, 1, 1,
2.260462, 1.141295, 1.258905, 1, 0, 0, 1, 1,
2.290133, 0.3627109, 2.199392, 0, 0, 0, 1, 1,
2.301694, -0.1336602, 1.602009, 0, 0, 0, 1, 1,
2.303198, 0.3413785, 0.765797, 0, 0, 0, 1, 1,
2.3449, -0.4538314, 3.686947, 0, 0, 0, 1, 1,
2.346299, 1.267077, 2.11979, 0, 0, 0, 1, 1,
2.420086, -0.1313633, 1.207455, 0, 0, 0, 1, 1,
2.437394, 0.9619729, 0.805724, 0, 0, 0, 1, 1,
2.447774, -0.2836804, 1.683053, 1, 1, 1, 1, 1,
2.530395, 1.450663, 0.3385196, 1, 1, 1, 1, 1,
2.532875, -1.664896, 1.602215, 1, 1, 1, 1, 1,
2.653455, 0.2475308, 0.5724989, 1, 1, 1, 1, 1,
2.828896, -1.281159, 2.441211, 1, 1, 1, 1, 1,
2.886582, 1.001503, 0.7661369, 1, 1, 1, 1, 1,
3.013999, 0.4586509, -0.02415686, 1, 1, 1, 1, 1
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
var radius = 9.775628;
var distance = 34.33648;
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
mvMatrix.translate( 0.2396667, 0.03934741, -0.02565575 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.33648);
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
