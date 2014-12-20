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
-2.523278, -1.485623, -3.327747, 1, 0, 0, 1,
-2.518096, 0.3414571, 0.118407, 1, 0.007843138, 0, 1,
-2.515339, -1.060611, -2.121206, 1, 0.01176471, 0, 1,
-2.504059, -0.4527002, -2.50777, 1, 0.01960784, 0, 1,
-2.459079, -1.076933, -2.83118, 1, 0.02352941, 0, 1,
-2.397855, 0.670788, 0.5492173, 1, 0.03137255, 0, 1,
-2.361435, 0.1947822, -0.8260122, 1, 0.03529412, 0, 1,
-2.323119, -0.6761823, -1.965066, 1, 0.04313726, 0, 1,
-2.226866, -0.08930828, -1.094952, 1, 0.04705882, 0, 1,
-2.214979, -0.05656267, -0.3006805, 1, 0.05490196, 0, 1,
-2.200538, -2.215687, -3.602297, 1, 0.05882353, 0, 1,
-2.160153, -1.151963, -1.654754, 1, 0.06666667, 0, 1,
-2.10854, -0.03811728, -0.4793162, 1, 0.07058824, 0, 1,
-2.057847, -0.8518591, -2.792862, 1, 0.07843138, 0, 1,
-2.046143, -0.6777536, -2.079135, 1, 0.08235294, 0, 1,
-2.042645, -0.3759582, -1.775288, 1, 0.09019608, 0, 1,
-2.035724, -1.407578, -4.119635, 1, 0.09411765, 0, 1,
-2.022874, -0.9186311, -2.776193, 1, 0.1019608, 0, 1,
-2.005872, 0.4320295, -0.3727506, 1, 0.1098039, 0, 1,
-2.004453, 1.308649, -0.4351936, 1, 0.1137255, 0, 1,
-1.996349, -0.09315754, -1.408951, 1, 0.1215686, 0, 1,
-1.961163, 0.2699776, -1.426945, 1, 0.1254902, 0, 1,
-1.946088, 0.1884803, -1.548284, 1, 0.1333333, 0, 1,
-1.945021, -0.4673913, -2.432526, 1, 0.1372549, 0, 1,
-1.908607, 1.316077, 0.6121624, 1, 0.145098, 0, 1,
-1.887354, 0.3682859, -1.129582, 1, 0.1490196, 0, 1,
-1.885073, -0.3609886, -1.292725, 1, 0.1568628, 0, 1,
-1.879406, 0.03139057, -1.861189, 1, 0.1607843, 0, 1,
-1.866013, 0.02791847, -2.015673, 1, 0.1686275, 0, 1,
-1.844892, 1.050331, -0.9763381, 1, 0.172549, 0, 1,
-1.835044, -0.3591591, -2.916255, 1, 0.1803922, 0, 1,
-1.823417, 1.137425, -2.044989, 1, 0.1843137, 0, 1,
-1.804527, 2.173246, -2.042946, 1, 0.1921569, 0, 1,
-1.801434, -1.122474, -3.816768, 1, 0.1960784, 0, 1,
-1.781223, 0.723933, -1.651509, 1, 0.2039216, 0, 1,
-1.776434, 0.4282636, -0.9767944, 1, 0.2117647, 0, 1,
-1.774926, -1.133246, -2.841543, 1, 0.2156863, 0, 1,
-1.750993, -0.26869, -0.9218072, 1, 0.2235294, 0, 1,
-1.736261, -1.48804, -2.297504, 1, 0.227451, 0, 1,
-1.735563, 0.7253074, 0.1043094, 1, 0.2352941, 0, 1,
-1.735259, 0.6684924, -0.248176, 1, 0.2392157, 0, 1,
-1.707231, 0.8235448, -1.212558, 1, 0.2470588, 0, 1,
-1.702204, 1.39369, -1.350576, 1, 0.2509804, 0, 1,
-1.691152, -1.121854, -1.307011, 1, 0.2588235, 0, 1,
-1.686553, -0.5448771, -1.124746, 1, 0.2627451, 0, 1,
-1.68454, -1.265202, -1.412406, 1, 0.2705882, 0, 1,
-1.681203, -0.3743092, -1.695709, 1, 0.2745098, 0, 1,
-1.673329, 0.1747084, -0.002136391, 1, 0.282353, 0, 1,
-1.664064, -0.5174543, -2.752479, 1, 0.2862745, 0, 1,
-1.621503, 0.5593746, -1.766663, 1, 0.2941177, 0, 1,
-1.616728, -0.1462156, -2.47997, 1, 0.3019608, 0, 1,
-1.6151, 0.5464632, -2.461476, 1, 0.3058824, 0, 1,
-1.608907, -1.194932, -0.937417, 1, 0.3137255, 0, 1,
-1.603106, 1.326662, 0.02386408, 1, 0.3176471, 0, 1,
-1.595247, -1.855072, -1.32152, 1, 0.3254902, 0, 1,
-1.591874, 0.5589006, -2.465783, 1, 0.3294118, 0, 1,
-1.591015, 1.641706, -0.9114377, 1, 0.3372549, 0, 1,
-1.589223, 0.6184537, -1.154792, 1, 0.3411765, 0, 1,
-1.565929, -0.1618086, -0.1473807, 1, 0.3490196, 0, 1,
-1.553679, 0.445443, -2.968853, 1, 0.3529412, 0, 1,
-1.552042, 0.700292, -2.344321, 1, 0.3607843, 0, 1,
-1.549147, 2.168438, -1.214252, 1, 0.3647059, 0, 1,
-1.547746, -0.5409368, 0.5965924, 1, 0.372549, 0, 1,
-1.531039, 0.1273937, -1.51312, 1, 0.3764706, 0, 1,
-1.529619, 0.6343288, -2.476865, 1, 0.3843137, 0, 1,
-1.528507, -0.294348, -1.747981, 1, 0.3882353, 0, 1,
-1.527576, 0.1618754, -0.0532187, 1, 0.3960784, 0, 1,
-1.514489, -0.1260614, -1.506069, 1, 0.4039216, 0, 1,
-1.5135, 1.03791, -0.7693166, 1, 0.4078431, 0, 1,
-1.505243, 0.7777534, -0.8134463, 1, 0.4156863, 0, 1,
-1.500897, 1.938585, 0.5508932, 1, 0.4196078, 0, 1,
-1.499754, 0.7607183, -0.6942136, 1, 0.427451, 0, 1,
-1.49157, 1.230469, -1.328228, 1, 0.4313726, 0, 1,
-1.47709, -0.6877795, -3.599077, 1, 0.4392157, 0, 1,
-1.475627, 2.95515, -1.111662, 1, 0.4431373, 0, 1,
-1.472769, -0.9832382, -3.274514, 1, 0.4509804, 0, 1,
-1.460509, 0.4522739, -0.3717666, 1, 0.454902, 0, 1,
-1.458419, -0.4819857, -0.3922585, 1, 0.4627451, 0, 1,
-1.444974, -0.6688151, -1.135839, 1, 0.4666667, 0, 1,
-1.44322, -1.937804, -0.9458038, 1, 0.4745098, 0, 1,
-1.431869, -0.3613927, -2.951724, 1, 0.4784314, 0, 1,
-1.405877, 0.7462788, -1.280596, 1, 0.4862745, 0, 1,
-1.3881, -0.0537434, -3.834547, 1, 0.4901961, 0, 1,
-1.383179, 1.273916, 1.611626, 1, 0.4980392, 0, 1,
-1.380908, -0.7114503, -1.244711, 1, 0.5058824, 0, 1,
-1.378896, -0.3440652, -2.243388, 1, 0.509804, 0, 1,
-1.354838, -1.069096, -2.525075, 1, 0.5176471, 0, 1,
-1.352689, 1.891539, -2.162135, 1, 0.5215687, 0, 1,
-1.328203, 1.096894, -2.465024, 1, 0.5294118, 0, 1,
-1.328126, -0.09414409, -1.707957, 1, 0.5333334, 0, 1,
-1.322111, 0.09795795, -2.046937, 1, 0.5411765, 0, 1,
-1.319699, 0.8466175, -2.151205, 1, 0.5450981, 0, 1,
-1.319094, -1.592092, -0.6107033, 1, 0.5529412, 0, 1,
-1.303299, -0.7533097, -3.23252, 1, 0.5568628, 0, 1,
-1.300612, 1.879453, 0.858298, 1, 0.5647059, 0, 1,
-1.300396, -0.2195688, -1.996968, 1, 0.5686275, 0, 1,
-1.300206, -0.1342778, -2.229495, 1, 0.5764706, 0, 1,
-1.299034, 0.7168575, -0.3432588, 1, 0.5803922, 0, 1,
-1.298231, -1.07356, -3.008814, 1, 0.5882353, 0, 1,
-1.294471, 1.232883, 0.1540257, 1, 0.5921569, 0, 1,
-1.275793, 0.7933647, -0.7184495, 1, 0.6, 0, 1,
-1.270157, -0.05584195, -1.876385, 1, 0.6078432, 0, 1,
-1.268285, -0.3744971, -2.49715, 1, 0.6117647, 0, 1,
-1.26201, -1.205821, -3.432653, 1, 0.6196079, 0, 1,
-1.260936, 0.1483244, -1.885039, 1, 0.6235294, 0, 1,
-1.25973, 1.681034, -0.2895729, 1, 0.6313726, 0, 1,
-1.252421, -1.683885, -4.508772, 1, 0.6352941, 0, 1,
-1.248914, 0.5166042, -0.713276, 1, 0.6431373, 0, 1,
-1.247995, 1.218666, -0.8978664, 1, 0.6470588, 0, 1,
-1.247368, -0.2821074, -2.121223, 1, 0.654902, 0, 1,
-1.244491, -0.7952951, -2.293289, 1, 0.6588235, 0, 1,
-1.240522, 1.399166, -0.2962399, 1, 0.6666667, 0, 1,
-1.235759, 0.1587533, -3.597698, 1, 0.6705883, 0, 1,
-1.234251, -0.1147138, -2.599188, 1, 0.6784314, 0, 1,
-1.223488, 0.03456376, -2.185431, 1, 0.682353, 0, 1,
-1.220869, 0.8192858, -0.6745387, 1, 0.6901961, 0, 1,
-1.215455, 0.831969, -1.528202, 1, 0.6941177, 0, 1,
-1.21367, 0.06626938, -1.793915, 1, 0.7019608, 0, 1,
-1.206282, -0.1167215, -0.6325488, 1, 0.7098039, 0, 1,
-1.206165, -0.1237322, 0.9956456, 1, 0.7137255, 0, 1,
-1.188899, -0.8945266, -1.484884, 1, 0.7215686, 0, 1,
-1.187333, -0.7707155, -1.670244, 1, 0.7254902, 0, 1,
-1.184778, -0.4776814, -3.108364, 1, 0.7333333, 0, 1,
-1.18074, -1.143344, -1.881127, 1, 0.7372549, 0, 1,
-1.177035, 0.7471426, -1.137283, 1, 0.7450981, 0, 1,
-1.165155, -3.148255, -2.734344, 1, 0.7490196, 0, 1,
-1.154058, -0.103318, -2.116878, 1, 0.7568628, 0, 1,
-1.133976, 0.05222336, -2.521677, 1, 0.7607843, 0, 1,
-1.13362, -0.04622604, -2.223655, 1, 0.7686275, 0, 1,
-1.123648, 0.326223, -0.5374573, 1, 0.772549, 0, 1,
-1.121156, -2.511395, -2.03046, 1, 0.7803922, 0, 1,
-1.113832, 0.3700409, -1.349537, 1, 0.7843137, 0, 1,
-1.110459, -1.314738, -1.874456, 1, 0.7921569, 0, 1,
-1.097644, -1.184463, -1.722199, 1, 0.7960784, 0, 1,
-1.091048, -0.1828719, -1.563048, 1, 0.8039216, 0, 1,
-1.082877, 2.435813, 1.674044, 1, 0.8117647, 0, 1,
-1.080955, -1.322386, -3.258538, 1, 0.8156863, 0, 1,
-1.075978, 1.901026, -1.050735, 1, 0.8235294, 0, 1,
-1.062736, 0.07410161, -2.266417, 1, 0.827451, 0, 1,
-1.056524, 1.399204, 0.7418769, 1, 0.8352941, 0, 1,
-1.053424, 0.1021214, -2.372529, 1, 0.8392157, 0, 1,
-1.052246, -0.4444333, -2.065015, 1, 0.8470588, 0, 1,
-1.05084, -1.124071, -2.024133, 1, 0.8509804, 0, 1,
-1.0482, -0.9072688, -1.243186, 1, 0.8588235, 0, 1,
-1.042813, -0.2821142, -0.9131282, 1, 0.8627451, 0, 1,
-1.041598, 0.447913, -1.777774, 1, 0.8705882, 0, 1,
-1.037822, 2.043942, -0.1920123, 1, 0.8745098, 0, 1,
-1.030244, 0.3018853, -1.095918, 1, 0.8823529, 0, 1,
-1.030032, -0.404303, -1.802605, 1, 0.8862745, 0, 1,
-1.026576, -0.3436705, -0.3594883, 1, 0.8941177, 0, 1,
-1.013761, 0.7197971, -3.073577, 1, 0.8980392, 0, 1,
-1.012703, 1.466741, -0.1932905, 1, 0.9058824, 0, 1,
-1.000971, 0.142053, -1.190511, 1, 0.9137255, 0, 1,
-0.9985443, -0.2756482, -0.5674958, 1, 0.9176471, 0, 1,
-0.9960767, -0.7394899, -3.707841, 1, 0.9254902, 0, 1,
-0.996041, -0.5640512, -2.13082, 1, 0.9294118, 0, 1,
-0.9956289, -1.784126, -2.579769, 1, 0.9372549, 0, 1,
-0.9943333, -2.498473, -3.10763, 1, 0.9411765, 0, 1,
-0.9934928, -0.3731573, -2.278833, 1, 0.9490196, 0, 1,
-0.9764149, -0.462623, -1.87573, 1, 0.9529412, 0, 1,
-0.9718688, -0.4164067, -3.218603, 1, 0.9607843, 0, 1,
-0.966549, 0.1240888, -1.812677, 1, 0.9647059, 0, 1,
-0.9661399, -0.5410785, -3.626755, 1, 0.972549, 0, 1,
-0.958209, -1.045727, -2.721287, 1, 0.9764706, 0, 1,
-0.9558184, 1.153731, -1.220256, 1, 0.9843137, 0, 1,
-0.940417, 1.325086, -3.279744, 1, 0.9882353, 0, 1,
-0.9358145, 2.301217, 0.6766487, 1, 0.9960784, 0, 1,
-0.9328499, -0.2441281, -0.6365383, 0.9960784, 1, 0, 1,
-0.9280465, 0.8455635, -1.740074, 0.9921569, 1, 0, 1,
-0.9242498, 0.2960377, -1.34824, 0.9843137, 1, 0, 1,
-0.9234991, 2.897217, -1.07145, 0.9803922, 1, 0, 1,
-0.9229343, -0.7706844, -2.707013, 0.972549, 1, 0, 1,
-0.9226175, 0.1020385, -0.7485, 0.9686275, 1, 0, 1,
-0.9181812, 1.37451, -1.038252, 0.9607843, 1, 0, 1,
-0.9169928, 0.04935205, -1.606803, 0.9568627, 1, 0, 1,
-0.9149006, -1.50956, -3.397079, 0.9490196, 1, 0, 1,
-0.9123329, -0.2118891, -0.8409608, 0.945098, 1, 0, 1,
-0.9087846, 0.9188098, -1.32914, 0.9372549, 1, 0, 1,
-0.9061063, -1.216008, -2.001754, 0.9333333, 1, 0, 1,
-0.905724, -0.01984195, -3.218817, 0.9254902, 1, 0, 1,
-0.9044793, 0.3880784, 1.435027, 0.9215686, 1, 0, 1,
-0.8965635, -0.03235164, -0.727422, 0.9137255, 1, 0, 1,
-0.8952197, 2.041081, -0.9977059, 0.9098039, 1, 0, 1,
-0.895018, 0.7943503, -1.498752, 0.9019608, 1, 0, 1,
-0.889127, -0.1326462, -1.398575, 0.8941177, 1, 0, 1,
-0.887711, -0.03861193, -1.363785, 0.8901961, 1, 0, 1,
-0.88623, -0.1760908, 0.7628013, 0.8823529, 1, 0, 1,
-0.8823684, 0.7578825, 1.205519, 0.8784314, 1, 0, 1,
-0.8796489, -0.8392352, -2.330829, 0.8705882, 1, 0, 1,
-0.8789268, 0.5488917, -0.4070069, 0.8666667, 1, 0, 1,
-0.8775079, -1.077157, -3.441407, 0.8588235, 1, 0, 1,
-0.8719614, -0.311429, -3.022663, 0.854902, 1, 0, 1,
-0.8689562, -0.2542535, -2.948223, 0.8470588, 1, 0, 1,
-0.865418, 0.4782849, -1.776008, 0.8431373, 1, 0, 1,
-0.8649586, -0.7265728, -4.263928, 0.8352941, 1, 0, 1,
-0.8588448, 0.1649699, -0.3211974, 0.8313726, 1, 0, 1,
-0.8580561, 0.3241906, -1.189648, 0.8235294, 1, 0, 1,
-0.8569641, 1.109296, 0.5339684, 0.8196079, 1, 0, 1,
-0.8512408, -2.261648, -1.990606, 0.8117647, 1, 0, 1,
-0.8475906, 0.6029106, 0.3889745, 0.8078431, 1, 0, 1,
-0.8441386, -0.00685459, -3.044883, 0.8, 1, 0, 1,
-0.8432855, -1.916145, -2.905478, 0.7921569, 1, 0, 1,
-0.8427091, -0.9709979, -1.434314, 0.7882353, 1, 0, 1,
-0.8402429, 0.6751104, -0.8422861, 0.7803922, 1, 0, 1,
-0.8392296, 1.217577, 1.418701, 0.7764706, 1, 0, 1,
-0.8381923, -0.5346001, -2.06214, 0.7686275, 1, 0, 1,
-0.8314233, -0.2756266, -2.24548, 0.7647059, 1, 0, 1,
-0.8303662, -0.206267, -2.517212, 0.7568628, 1, 0, 1,
-0.8255208, 0.2217721, -0.4904703, 0.7529412, 1, 0, 1,
-0.8241364, 0.1605384, -2.388372, 0.7450981, 1, 0, 1,
-0.8222783, 0.4408204, -1.167744, 0.7411765, 1, 0, 1,
-0.8201493, 0.1474277, -1.484097, 0.7333333, 1, 0, 1,
-0.8165515, -1.757329, -3.998089, 0.7294118, 1, 0, 1,
-0.8159899, -0.3268986, -1.727401, 0.7215686, 1, 0, 1,
-0.8159731, 2.126569, -1.398176, 0.7176471, 1, 0, 1,
-0.8143291, 0.6371954, -0.3099481, 0.7098039, 1, 0, 1,
-0.8112038, 0.1291896, -1.089897, 0.7058824, 1, 0, 1,
-0.8111578, 1.283677, 0.03909644, 0.6980392, 1, 0, 1,
-0.8107678, -0.6260816, -2.187691, 0.6901961, 1, 0, 1,
-0.8107674, -1.800635, -2.820644, 0.6862745, 1, 0, 1,
-0.8079292, -0.1740429, -3.373137, 0.6784314, 1, 0, 1,
-0.8061758, -0.1558846, 0.01375108, 0.6745098, 1, 0, 1,
-0.8057376, 0.1962223, -0.9790189, 0.6666667, 1, 0, 1,
-0.8033442, -0.01342076, -0.745219, 0.6627451, 1, 0, 1,
-0.8001306, -0.197582, 0.306418, 0.654902, 1, 0, 1,
-0.7982426, -1.153614, -4.254072, 0.6509804, 1, 0, 1,
-0.7955739, 0.3710442, 0.7583472, 0.6431373, 1, 0, 1,
-0.7936708, 0.6624507, -0.5910013, 0.6392157, 1, 0, 1,
-0.7929886, 0.810908, -0.5043007, 0.6313726, 1, 0, 1,
-0.788955, 0.742555, 0.02827208, 0.627451, 1, 0, 1,
-0.7882526, -1.428078, -2.891702, 0.6196079, 1, 0, 1,
-0.7825171, -0.4910201, -2.689907, 0.6156863, 1, 0, 1,
-0.7824162, -1.143716, -1.015367, 0.6078432, 1, 0, 1,
-0.7821046, -0.01776101, -2.128623, 0.6039216, 1, 0, 1,
-0.776388, -1.262211, -2.311193, 0.5960785, 1, 0, 1,
-0.7763034, -1.441257, -2.962878, 0.5882353, 1, 0, 1,
-0.7683381, 1.234567, -1.018917, 0.5843138, 1, 0, 1,
-0.7625967, -0.7760894, -1.896912, 0.5764706, 1, 0, 1,
-0.7605861, -3.032848, -1.351227, 0.572549, 1, 0, 1,
-0.7578625, -0.3194888, -1.911797, 0.5647059, 1, 0, 1,
-0.7562493, 0.8668981, -1.033907, 0.5607843, 1, 0, 1,
-0.7430003, 1.00904, -0.9476006, 0.5529412, 1, 0, 1,
-0.7338567, -0.7186403, -1.49755, 0.5490196, 1, 0, 1,
-0.7267333, -0.3188873, -3.343124, 0.5411765, 1, 0, 1,
-0.7243214, -0.0004447194, -0.1065573, 0.5372549, 1, 0, 1,
-0.7174218, 0.02976685, -0.9697827, 0.5294118, 1, 0, 1,
-0.7105449, -0.3744461, -1.484803, 0.5254902, 1, 0, 1,
-0.7096864, -1.30131, -1.735304, 0.5176471, 1, 0, 1,
-0.7095545, 0.4975859, -0.008286657, 0.5137255, 1, 0, 1,
-0.7075565, 0.1381924, -2.138402, 0.5058824, 1, 0, 1,
-0.7069194, -0.3768866, -1.586236, 0.5019608, 1, 0, 1,
-0.7065554, 0.3596092, -0.2092912, 0.4941176, 1, 0, 1,
-0.7057176, 1.005651, -1.519183, 0.4862745, 1, 0, 1,
-0.7039104, -0.02434492, -2.85426, 0.4823529, 1, 0, 1,
-0.7028609, -0.6884313, -1.538421, 0.4745098, 1, 0, 1,
-0.7002137, -1.715391, -1.425115, 0.4705882, 1, 0, 1,
-0.6977522, -1.195912, -1.927297, 0.4627451, 1, 0, 1,
-0.6958287, 0.8600307, -1.280293, 0.4588235, 1, 0, 1,
-0.695485, -0.7805951, -2.272836, 0.4509804, 1, 0, 1,
-0.6830035, 0.1960638, 0.3577638, 0.4470588, 1, 0, 1,
-0.6768006, -0.2251747, -2.892043, 0.4392157, 1, 0, 1,
-0.6735944, -0.5765527, -1.598324, 0.4352941, 1, 0, 1,
-0.6625549, 0.3568239, -2.243382, 0.427451, 1, 0, 1,
-0.6614296, 0.1161898, -2.240587, 0.4235294, 1, 0, 1,
-0.6612588, 1.821912, 0.3666675, 0.4156863, 1, 0, 1,
-0.6568373, -0.01734282, -2.088677, 0.4117647, 1, 0, 1,
-0.6568052, 1.2289, -0.0587511, 0.4039216, 1, 0, 1,
-0.6554333, -0.6051023, -2.17866, 0.3960784, 1, 0, 1,
-0.6535776, -1.235226, -0.9427986, 0.3921569, 1, 0, 1,
-0.6500754, -1.529318, -2.901905, 0.3843137, 1, 0, 1,
-0.6497343, -0.9061038, -2.526471, 0.3803922, 1, 0, 1,
-0.6458367, 0.8195022, -0.04601773, 0.372549, 1, 0, 1,
-0.6360359, -0.6397046, -0.5119287, 0.3686275, 1, 0, 1,
-0.6337873, -0.5256374, -0.4716596, 0.3607843, 1, 0, 1,
-0.6322095, -2.390226, -3.029282, 0.3568628, 1, 0, 1,
-0.6308399, 0.375075, -0.1253662, 0.3490196, 1, 0, 1,
-0.6302935, 1.448901, -1.400018, 0.345098, 1, 0, 1,
-0.6283887, 0.2987124, -0.7326304, 0.3372549, 1, 0, 1,
-0.6260661, -0.2304654, -3.994531, 0.3333333, 1, 0, 1,
-0.6253341, 1.603646, -0.05952521, 0.3254902, 1, 0, 1,
-0.6122144, -0.8117539, -3.69374, 0.3215686, 1, 0, 1,
-0.5986354, -0.6088911, -3.403501, 0.3137255, 1, 0, 1,
-0.5985492, 1.308809, 0.4558983, 0.3098039, 1, 0, 1,
-0.5966597, 0.07565725, -1.329197, 0.3019608, 1, 0, 1,
-0.5956171, -0.06256693, -2.535206, 0.2941177, 1, 0, 1,
-0.5955649, 0.4628868, -1.780713, 0.2901961, 1, 0, 1,
-0.5897259, -0.3368896, -4.439364, 0.282353, 1, 0, 1,
-0.5831581, -0.009429856, -1.637385, 0.2784314, 1, 0, 1,
-0.5773215, 0.1831401, -2.129895, 0.2705882, 1, 0, 1,
-0.5749907, 1.127012, -0.9184078, 0.2666667, 1, 0, 1,
-0.5735319, 2.032119, -1.638424, 0.2588235, 1, 0, 1,
-0.5697253, 0.2912173, -0.955478, 0.254902, 1, 0, 1,
-0.5651435, -0.3557911, -1.172601, 0.2470588, 1, 0, 1,
-0.5639331, 0.2246971, -1.625596, 0.2431373, 1, 0, 1,
-0.5634317, -0.1290451, -0.5423218, 0.2352941, 1, 0, 1,
-0.5620241, 0.9310842, -0.2585893, 0.2313726, 1, 0, 1,
-0.5615454, 0.3927059, -0.1379414, 0.2235294, 1, 0, 1,
-0.560015, -0.4131036, -3.669423, 0.2196078, 1, 0, 1,
-0.5591325, 0.1934353, -0.6291837, 0.2117647, 1, 0, 1,
-0.5556929, -0.1832526, -2.452463, 0.2078431, 1, 0, 1,
-0.5443661, 0.07205555, -3.285916, 0.2, 1, 0, 1,
-0.5441261, 1.448751, -0.6723875, 0.1921569, 1, 0, 1,
-0.5416753, 1.132429, 1.316448, 0.1882353, 1, 0, 1,
-0.5395526, 0.09147138, -0.9053993, 0.1803922, 1, 0, 1,
-0.530142, 1.092278, -0.7393624, 0.1764706, 1, 0, 1,
-0.5277185, 1.098891, 0.02509424, 0.1686275, 1, 0, 1,
-0.527229, -0.305882, -1.725252, 0.1647059, 1, 0, 1,
-0.5255339, 0.01866403, -2.312967, 0.1568628, 1, 0, 1,
-0.5247492, 1.315057, 0.008171377, 0.1529412, 1, 0, 1,
-0.5238252, 1.365905, 0.2938112, 0.145098, 1, 0, 1,
-0.5224217, -1.150975, -3.787995, 0.1411765, 1, 0, 1,
-0.5206069, 0.298042, -2.400457, 0.1333333, 1, 0, 1,
-0.5146427, -0.3086465, -3.022247, 0.1294118, 1, 0, 1,
-0.5139545, -0.7044774, -3.810926, 0.1215686, 1, 0, 1,
-0.5048198, -0.2328093, -2.321184, 0.1176471, 1, 0, 1,
-0.5042192, 1.221995, -0.977394, 0.1098039, 1, 0, 1,
-0.5022043, -0.1109905, -0.5922253, 0.1058824, 1, 0, 1,
-0.500011, -1.562654, -2.138868, 0.09803922, 1, 0, 1,
-0.498016, -0.201823, -1.912046, 0.09019608, 1, 0, 1,
-0.4951822, -0.6627796, -1.198287, 0.08627451, 1, 0, 1,
-0.4938416, 0.2180223, -1.302306, 0.07843138, 1, 0, 1,
-0.4916837, 0.3816748, -1.109529, 0.07450981, 1, 0, 1,
-0.4881104, 0.6851538, -0.863313, 0.06666667, 1, 0, 1,
-0.4866171, 1.129538, -1.015216, 0.0627451, 1, 0, 1,
-0.4840534, 0.02313037, -1.985038, 0.05490196, 1, 0, 1,
-0.4828387, -0.3759951, -2.906345, 0.05098039, 1, 0, 1,
-0.4805246, 0.5640641, -1.507089, 0.04313726, 1, 0, 1,
-0.479657, -0.4973528, -2.442565, 0.03921569, 1, 0, 1,
-0.4778214, 0.5357738, -0.6437403, 0.03137255, 1, 0, 1,
-0.4769487, -0.7305502, -1.720013, 0.02745098, 1, 0, 1,
-0.4716428, -0.6283542, -2.96579, 0.01960784, 1, 0, 1,
-0.4715543, -0.6333228, -3.074895, 0.01568628, 1, 0, 1,
-0.4644542, -0.1620409, -2.123746, 0.007843138, 1, 0, 1,
-0.4633518, 0.1622932, -1.688482, 0.003921569, 1, 0, 1,
-0.4626325, -1.045476, -3.380804, 0, 1, 0.003921569, 1,
-0.4620002, 0.5193183, -1.635475, 0, 1, 0.01176471, 1,
-0.4612309, 0.1380667, -1.573481, 0, 1, 0.01568628, 1,
-0.4606568, 0.1335077, -0.8977002, 0, 1, 0.02352941, 1,
-0.4593258, -0.105947, -1.332927, 0, 1, 0.02745098, 1,
-0.4528404, -0.945346, -2.527151, 0, 1, 0.03529412, 1,
-0.4480821, 2.043365, 0.3243567, 0, 1, 0.03921569, 1,
-0.447892, -0.7876606, -2.255923, 0, 1, 0.04705882, 1,
-0.4464645, 0.2745632, -0.6462107, 0, 1, 0.05098039, 1,
-0.4460587, -0.2888863, -1.638565, 0, 1, 0.05882353, 1,
-0.4402457, 0.1044975, -1.797822, 0, 1, 0.0627451, 1,
-0.4342422, 0.8265264, -2.747417, 0, 1, 0.07058824, 1,
-0.4308268, -0.03520651, -1.463534, 0, 1, 0.07450981, 1,
-0.4258877, -0.1544498, -1.74789, 0, 1, 0.08235294, 1,
-0.4245099, 0.933376, -0.4945884, 0, 1, 0.08627451, 1,
-0.4222268, 2.075641, 0.2612722, 0, 1, 0.09411765, 1,
-0.4221447, 0.3684079, 0.256606, 0, 1, 0.1019608, 1,
-0.4183475, -1.169406, -1.153141, 0, 1, 0.1058824, 1,
-0.4163369, 1.38306, -0.177071, 0, 1, 0.1137255, 1,
-0.4145649, 0.2969187, -1.904214, 0, 1, 0.1176471, 1,
-0.4121186, 0.01327362, -1.693915, 0, 1, 0.1254902, 1,
-0.4028809, 0.2541762, -0.2543569, 0, 1, 0.1294118, 1,
-0.4003365, 1.62597, -0.7583903, 0, 1, 0.1372549, 1,
-0.398057, -1.431219, -1.852395, 0, 1, 0.1411765, 1,
-0.3957603, 0.6190411, -0.9221335, 0, 1, 0.1490196, 1,
-0.3908421, -0.6943999, -2.746439, 0, 1, 0.1529412, 1,
-0.3900725, 0.6055221, 0.717207, 0, 1, 0.1607843, 1,
-0.3896261, -0.8144515, -2.924137, 0, 1, 0.1647059, 1,
-0.3878921, -0.3605408, -3.929773, 0, 1, 0.172549, 1,
-0.380775, 0.5563732, 0.006264231, 0, 1, 0.1764706, 1,
-0.3798878, -1.015937, -3.336328, 0, 1, 0.1843137, 1,
-0.378286, -0.4493639, -2.138541, 0, 1, 0.1882353, 1,
-0.3767221, 0.1732035, -0.7885754, 0, 1, 0.1960784, 1,
-0.3740917, -1.106808, -1.833633, 0, 1, 0.2039216, 1,
-0.3720174, 0.06431142, -2.386488, 0, 1, 0.2078431, 1,
-0.3714017, 0.7022677, -1.088476, 0, 1, 0.2156863, 1,
-0.3691672, -0.4551719, -2.590528, 0, 1, 0.2196078, 1,
-0.3688518, -1.6034, -4.154287, 0, 1, 0.227451, 1,
-0.3682266, 1.103233, -0.3831559, 0, 1, 0.2313726, 1,
-0.3677535, -0.5383044, -2.877662, 0, 1, 0.2392157, 1,
-0.3652615, 0.4178181, -1.153837, 0, 1, 0.2431373, 1,
-0.3635276, 1.77352, 0.2642704, 0, 1, 0.2509804, 1,
-0.3617074, 1.455598, 0.2029866, 0, 1, 0.254902, 1,
-0.3558797, -0.9676964, -3.003469, 0, 1, 0.2627451, 1,
-0.3539512, -0.131938, -0.5544861, 0, 1, 0.2666667, 1,
-0.3488964, -0.4425284, -0.7550187, 0, 1, 0.2745098, 1,
-0.3394882, -0.3894846, -2.591615, 0, 1, 0.2784314, 1,
-0.3382924, -0.127089, -3.909103, 0, 1, 0.2862745, 1,
-0.338062, -0.8837481, -2.692084, 0, 1, 0.2901961, 1,
-0.3358586, 1.205405, -1.416852, 0, 1, 0.2980392, 1,
-0.3356696, 1.792979, -1.454814, 0, 1, 0.3058824, 1,
-0.3329274, -0.2168139, -2.7966, 0, 1, 0.3098039, 1,
-0.3302212, 0.1054169, -2.232075, 0, 1, 0.3176471, 1,
-0.3300327, 0.4097265, -0.5428586, 0, 1, 0.3215686, 1,
-0.3233646, 0.4495804, -1.569209, 0, 1, 0.3294118, 1,
-0.3227333, -1.439059, -4.415241, 0, 1, 0.3333333, 1,
-0.3204532, 0.05230515, -1.389871, 0, 1, 0.3411765, 1,
-0.3193583, -1.859443, -2.076651, 0, 1, 0.345098, 1,
-0.3153381, -2.837222, -2.398198, 0, 1, 0.3529412, 1,
-0.3144655, 0.2271108, 0.0989531, 0, 1, 0.3568628, 1,
-0.306045, -0.9331118, -3.237004, 0, 1, 0.3647059, 1,
-0.3059523, 0.9416203, 0.4375226, 0, 1, 0.3686275, 1,
-0.305952, -0.201205, -3.176898, 0, 1, 0.3764706, 1,
-0.3041879, 0.1740452, -1.326003, 0, 1, 0.3803922, 1,
-0.299537, -2.306415, -2.967206, 0, 1, 0.3882353, 1,
-0.2928683, 0.1530758, -0.7109591, 0, 1, 0.3921569, 1,
-0.2928034, -0.8608384, -5.596466, 0, 1, 0.4, 1,
-0.2889296, 0.7472349, -1.042577, 0, 1, 0.4078431, 1,
-0.2872153, 0.9036484, -0.2719205, 0, 1, 0.4117647, 1,
-0.2866947, 2.243576, -1.504313, 0, 1, 0.4196078, 1,
-0.2834313, -0.2596088, -0.4460944, 0, 1, 0.4235294, 1,
-0.2834227, -2.76281, -2.677545, 0, 1, 0.4313726, 1,
-0.2805229, -0.1325399, -0.4507441, 0, 1, 0.4352941, 1,
-0.2796289, 0.5597177, -1.1218, 0, 1, 0.4431373, 1,
-0.2795233, -0.6720363, -3.837999, 0, 1, 0.4470588, 1,
-0.2757727, -1.017305, -2.560818, 0, 1, 0.454902, 1,
-0.2673331, 0.4415615, -0.1285295, 0, 1, 0.4588235, 1,
-0.2665638, -0.01549746, -0.8423228, 0, 1, 0.4666667, 1,
-0.2659565, -0.6716762, -2.271333, 0, 1, 0.4705882, 1,
-0.2585859, -1.293376, -4.226723, 0, 1, 0.4784314, 1,
-0.2562511, 0.5560466, 1.566178, 0, 1, 0.4823529, 1,
-0.2529873, -0.1482995, -1.223963, 0, 1, 0.4901961, 1,
-0.2505725, -1.379867, -2.35104, 0, 1, 0.4941176, 1,
-0.2502018, -0.7806313, -0.07146366, 0, 1, 0.5019608, 1,
-0.2488133, -0.2084391, -2.92222, 0, 1, 0.509804, 1,
-0.2378445, 1.092375, 0.01132692, 0, 1, 0.5137255, 1,
-0.2329209, -0.1237511, -1.811553, 0, 1, 0.5215687, 1,
-0.2302592, -0.2208466, -1.079964, 0, 1, 0.5254902, 1,
-0.2299942, 0.7257581, -0.7912825, 0, 1, 0.5333334, 1,
-0.2257406, 1.657658, -0.06477091, 0, 1, 0.5372549, 1,
-0.2239857, 0.6702411, 1.290629, 0, 1, 0.5450981, 1,
-0.2231458, -0.2046015, -0.8306192, 0, 1, 0.5490196, 1,
-0.2223088, 0.3763135, 0.7456741, 0, 1, 0.5568628, 1,
-0.2222825, -1.099804, -2.948028, 0, 1, 0.5607843, 1,
-0.2216781, 0.3284988, -0.6193155, 0, 1, 0.5686275, 1,
-0.2189751, 0.5978158, -1.353088, 0, 1, 0.572549, 1,
-0.2178136, 1.557635, 1.479317, 0, 1, 0.5803922, 1,
-0.2140047, 0.7435034, -1.286194, 0, 1, 0.5843138, 1,
-0.2131006, 0.1505038, -2.911726, 0, 1, 0.5921569, 1,
-0.2114163, -0.5232649, -4.216194, 0, 1, 0.5960785, 1,
-0.2112823, -0.4861409, -3.80033, 0, 1, 0.6039216, 1,
-0.2049983, 0.4208033, -1.928004, 0, 1, 0.6117647, 1,
-0.2044027, -1.448115, -2.578457, 0, 1, 0.6156863, 1,
-0.2005384, -0.4205921, -2.376783, 0, 1, 0.6235294, 1,
-0.1997584, 1.817844, 1.400497, 0, 1, 0.627451, 1,
-0.1977607, 0.002548013, -1.069441, 0, 1, 0.6352941, 1,
-0.1947052, -1.212153, -3.254799, 0, 1, 0.6392157, 1,
-0.1880664, 0.2768896, -1.209156, 0, 1, 0.6470588, 1,
-0.1808672, -0.6350119, -3.207112, 0, 1, 0.6509804, 1,
-0.1802184, -0.9370542, -3.210004, 0, 1, 0.6588235, 1,
-0.1759931, 1.298945, -0.1859986, 0, 1, 0.6627451, 1,
-0.1690971, 1.088406, -0.814842, 0, 1, 0.6705883, 1,
-0.1626554, -1.277434, -3.289801, 0, 1, 0.6745098, 1,
-0.1606813, 0.9498529, -1.522269, 0, 1, 0.682353, 1,
-0.1565609, -0.7891533, -3.878783, 0, 1, 0.6862745, 1,
-0.1543446, -0.2664537, -1.513825, 0, 1, 0.6941177, 1,
-0.149556, -1.458221, -2.215048, 0, 1, 0.7019608, 1,
-0.1463692, -0.5524429, -4.797095, 0, 1, 0.7058824, 1,
-0.1449746, 1.7689, 0.1669305, 0, 1, 0.7137255, 1,
-0.1441385, 0.6297789, -2.012673, 0, 1, 0.7176471, 1,
-0.1334176, -0.9316023, -2.452138, 0, 1, 0.7254902, 1,
-0.1333649, -0.3079097, -3.285171, 0, 1, 0.7294118, 1,
-0.133144, 0.7830936, 0.1407281, 0, 1, 0.7372549, 1,
-0.1327369, -1.188395, -3.191666, 0, 1, 0.7411765, 1,
-0.126267, -0.1007555, -1.237049, 0, 1, 0.7490196, 1,
-0.1229481, 1.760139, 0.08197119, 0, 1, 0.7529412, 1,
-0.1207301, 1.682098, 1.139004, 0, 1, 0.7607843, 1,
-0.1102683, -0.5038195, -3.230821, 0, 1, 0.7647059, 1,
-0.1092114, -2.08126, -3.78437, 0, 1, 0.772549, 1,
-0.1089305, 0.5577791, 0.3266551, 0, 1, 0.7764706, 1,
-0.1074014, -1.165923, -2.606971, 0, 1, 0.7843137, 1,
-0.1064769, 0.3534255, 1.394302, 0, 1, 0.7882353, 1,
-0.1056203, 0.0590526, -0.7366319, 0, 1, 0.7960784, 1,
-0.099278, 0.272947, -1.62248, 0, 1, 0.8039216, 1,
-0.09761424, 0.2138793, 0.7869633, 0, 1, 0.8078431, 1,
-0.09327903, -0.03830856, -2.799228, 0, 1, 0.8156863, 1,
-0.08730832, 0.4937305, 0.009041237, 0, 1, 0.8196079, 1,
-0.0860287, 1.562603, 0.3155777, 0, 1, 0.827451, 1,
-0.07991182, 0.419553, -0.4920054, 0, 1, 0.8313726, 1,
-0.07988372, 0.8309759, 0.3009329, 0, 1, 0.8392157, 1,
-0.07786798, 0.0401982, -1.444329, 0, 1, 0.8431373, 1,
-0.07758185, -0.8797659, -2.923916, 0, 1, 0.8509804, 1,
-0.0751134, -0.8237145, -3.853568, 0, 1, 0.854902, 1,
-0.07486524, 1.29219, -0.2847111, 0, 1, 0.8627451, 1,
-0.07456484, 1.582762, -0.3100451, 0, 1, 0.8666667, 1,
-0.07429271, -0.6728437, -0.1682411, 0, 1, 0.8745098, 1,
-0.07306498, -1.833396, -4.65963, 0, 1, 0.8784314, 1,
-0.07167736, 0.4563651, 0.5174544, 0, 1, 0.8862745, 1,
-0.0713552, 1.076295, 0.7409338, 0, 1, 0.8901961, 1,
-0.07060967, -0.8785847, -2.052529, 0, 1, 0.8980392, 1,
-0.06681548, 0.1924765, -1.925051, 0, 1, 0.9058824, 1,
-0.06478995, -0.1197342, -5.031841, 0, 1, 0.9098039, 1,
-0.0630773, 0.2270155, -1.64999, 0, 1, 0.9176471, 1,
-0.06207257, 0.5708078, -0.2778386, 0, 1, 0.9215686, 1,
-0.06186269, 0.2115813, -0.4795664, 0, 1, 0.9294118, 1,
-0.05394258, 0.2865129, -0.6308139, 0, 1, 0.9333333, 1,
-0.05321569, 0.4878608, 0.2171011, 0, 1, 0.9411765, 1,
-0.04878039, 0.1405282, -0.3421978, 0, 1, 0.945098, 1,
-0.04621181, -0.331464, -1.983612, 0, 1, 0.9529412, 1,
-0.04275943, -0.1537779, -2.680549, 0, 1, 0.9568627, 1,
-0.03890197, 0.3838623, 1.500751, 0, 1, 0.9647059, 1,
-0.03777483, -1.368567, -4.824862, 0, 1, 0.9686275, 1,
-0.03776991, -0.4630407, -2.007133, 0, 1, 0.9764706, 1,
-0.03764588, 0.126775, 2.584003, 0, 1, 0.9803922, 1,
-0.03674452, 0.0617988, -0.8550985, 0, 1, 0.9882353, 1,
-0.03672558, -1.539517, -3.865131, 0, 1, 0.9921569, 1,
-0.03413628, -0.8740608, -2.716051, 0, 1, 1, 1,
-0.03384148, 0.6664235, 1.052377, 0, 0.9921569, 1, 1,
-0.03186699, 3.290506, 1.004605, 0, 0.9882353, 1, 1,
-0.03167525, 0.7255205, 1.777249, 0, 0.9803922, 1, 1,
-0.02925352, -0.7550132, -1.836952, 0, 0.9764706, 1, 1,
-0.02535146, -0.1164387, -3.035905, 0, 0.9686275, 1, 1,
-0.0245635, -0.2224687, -3.549997, 0, 0.9647059, 1, 1,
-0.02401984, -0.667006, -2.398251, 0, 0.9568627, 1, 1,
-0.01261558, -0.2865412, -2.629441, 0, 0.9529412, 1, 1,
-0.0123264, -0.7354262, -4.580148, 0, 0.945098, 1, 1,
-0.009785356, -1.586465, -2.498502, 0, 0.9411765, 1, 1,
-0.008359891, 0.51193, 0.6550962, 0, 0.9333333, 1, 1,
-0.007327288, 0.04387099, -0.380924, 0, 0.9294118, 1, 1,
-0.003463837, -0.4876945, -3.647012, 0, 0.9215686, 1, 1,
-0.002791056, -1.02103, -4.386099, 0, 0.9176471, 1, 1,
-0.0006934531, 0.7152739, -0.9891549, 0, 0.9098039, 1, 1,
0.007235392, -0.3687452, 1.906373, 0, 0.9058824, 1, 1,
0.009661605, -1.242683, 2.252778, 0, 0.8980392, 1, 1,
0.01492727, 1.037189, 0.5909808, 0, 0.8901961, 1, 1,
0.01533119, 0.1475239, -0.4550362, 0, 0.8862745, 1, 1,
0.01610761, 1.216783, 0.3400389, 0, 0.8784314, 1, 1,
0.0170032, -0.03923658, 2.12506, 0, 0.8745098, 1, 1,
0.0228949, -1.308951, 2.230072, 0, 0.8666667, 1, 1,
0.02868475, -0.9304096, 3.940193, 0, 0.8627451, 1, 1,
0.02892341, 1.248157, 1.161643, 0, 0.854902, 1, 1,
0.02977667, -0.1486794, 1.935138, 0, 0.8509804, 1, 1,
0.03030621, 0.8500662, 0.04395317, 0, 0.8431373, 1, 1,
0.03075531, 0.6926245, -0.9649352, 0, 0.8392157, 1, 1,
0.03123047, 2.902183, 1.06882, 0, 0.8313726, 1, 1,
0.03267023, 0.5451869, -0.2495776, 0, 0.827451, 1, 1,
0.03412678, 0.8060141, 1.074757, 0, 0.8196079, 1, 1,
0.03415797, -0.2239054, 5.625225, 0, 0.8156863, 1, 1,
0.03525204, -2.263303, 3.294873, 0, 0.8078431, 1, 1,
0.03591389, 1.209012, -0.6559309, 0, 0.8039216, 1, 1,
0.03734113, -0.7366589, 2.971777, 0, 0.7960784, 1, 1,
0.03908815, 0.04409192, 1.308018, 0, 0.7882353, 1, 1,
0.0420262, -0.4537099, 2.324864, 0, 0.7843137, 1, 1,
0.05173991, -0.2817797, 3.362867, 0, 0.7764706, 1, 1,
0.05319757, -1.745825, 3.170484, 0, 0.772549, 1, 1,
0.05350383, -0.734575, 2.65337, 0, 0.7647059, 1, 1,
0.05357762, 1.579879, -0.2695022, 0, 0.7607843, 1, 1,
0.05838721, -1.001677, 3.929202, 0, 0.7529412, 1, 1,
0.06664676, -1.494015, 4.152463, 0, 0.7490196, 1, 1,
0.0743427, -0.1843076, 2.454285, 0, 0.7411765, 1, 1,
0.08254932, 0.4534703, 1.430948, 0, 0.7372549, 1, 1,
0.08460508, -0.6950262, 3.057006, 0, 0.7294118, 1, 1,
0.08560701, 1.09352, 0.3218833, 0, 0.7254902, 1, 1,
0.09632932, 0.8179994, -0.5034232, 0, 0.7176471, 1, 1,
0.09759712, 1.962833, 0.5456489, 0, 0.7137255, 1, 1,
0.09797917, 0.9788771, -1.112128, 0, 0.7058824, 1, 1,
0.1016691, -0.06860603, 1.096563, 0, 0.6980392, 1, 1,
0.1020669, -0.5567378, 3.928941, 0, 0.6941177, 1, 1,
0.1028932, -0.6032014, 4.108589, 0, 0.6862745, 1, 1,
0.1066581, 1.1541, 1.902186, 0, 0.682353, 1, 1,
0.1096064, 0.4284263, 1.391872, 0, 0.6745098, 1, 1,
0.1132264, -2.32654, 3.247432, 0, 0.6705883, 1, 1,
0.1135961, 1.028503, 0.3434678, 0, 0.6627451, 1, 1,
0.1190693, -0.9068123, 3.337917, 0, 0.6588235, 1, 1,
0.1304414, 0.2549051, 0.2220169, 0, 0.6509804, 1, 1,
0.1319626, 0.8044267, 1.096065, 0, 0.6470588, 1, 1,
0.1343275, 0.5953951, -0.5531077, 0, 0.6392157, 1, 1,
0.1347298, 1.339635, 1.027666, 0, 0.6352941, 1, 1,
0.1400027, 0.671845, 0.633383, 0, 0.627451, 1, 1,
0.1423951, -1.594058, 2.91042, 0, 0.6235294, 1, 1,
0.145703, -0.4312836, 2.022935, 0, 0.6156863, 1, 1,
0.1469032, -0.3906958, 1.616668, 0, 0.6117647, 1, 1,
0.1483878, -1.964647, 4.032447, 0, 0.6039216, 1, 1,
0.1498316, 0.1383497, -1.5136, 0, 0.5960785, 1, 1,
0.1520457, 0.593662, -0.8665818, 0, 0.5921569, 1, 1,
0.1531228, -0.03450838, 0.8739407, 0, 0.5843138, 1, 1,
0.153538, 0.4411262, 1.248238, 0, 0.5803922, 1, 1,
0.1614047, 1.350689, -2.23815, 0, 0.572549, 1, 1,
0.1622766, -0.3429756, 2.884763, 0, 0.5686275, 1, 1,
0.1628907, 0.7824985, 1.62446, 0, 0.5607843, 1, 1,
0.1640525, -0.2442245, 4.086815, 0, 0.5568628, 1, 1,
0.1722153, 0.2755462, 0.7403608, 0, 0.5490196, 1, 1,
0.1764147, -0.371474, 2.931271, 0, 0.5450981, 1, 1,
0.1796599, -1.095631, 2.528196, 0, 0.5372549, 1, 1,
0.1821979, 1.785267, 1.763444, 0, 0.5333334, 1, 1,
0.1857035, -0.2813338, 3.207868, 0, 0.5254902, 1, 1,
0.1870494, -1.746095, 3.55078, 0, 0.5215687, 1, 1,
0.1884822, 0.8874529, 0.0600375, 0, 0.5137255, 1, 1,
0.1892951, -1.893489, 3.939837, 0, 0.509804, 1, 1,
0.1900247, -0.5732839, 1.791022, 0, 0.5019608, 1, 1,
0.1994281, 0.5219566, 0.4448018, 0, 0.4941176, 1, 1,
0.2043281, 1.173711, 0.2101576, 0, 0.4901961, 1, 1,
0.2049683, 0.3895089, 0.4562336, 0, 0.4823529, 1, 1,
0.2089769, -1.087376, 2.887988, 0, 0.4784314, 1, 1,
0.210926, -0.1274856, 1.779357, 0, 0.4705882, 1, 1,
0.2128635, 0.3172142, 1.21202, 0, 0.4666667, 1, 1,
0.2177798, 0.8615382, 0.9257203, 0, 0.4588235, 1, 1,
0.2178002, -0.2548425, 1.383406, 0, 0.454902, 1, 1,
0.2198001, 0.234998, 0.3293847, 0, 0.4470588, 1, 1,
0.2201743, -0.1846033, 2.155416, 0, 0.4431373, 1, 1,
0.2218708, 0.3395463, 2.390777, 0, 0.4352941, 1, 1,
0.222727, 1.882994, 0.7048745, 0, 0.4313726, 1, 1,
0.2229803, 0.7048452, 1.427407, 0, 0.4235294, 1, 1,
0.2242827, -1.442518, 2.330853, 0, 0.4196078, 1, 1,
0.2246056, -0.7868633, 2.998051, 0, 0.4117647, 1, 1,
0.2280144, 0.3181256, 1.34575, 0, 0.4078431, 1, 1,
0.2292424, 0.3481454, -1.481298, 0, 0.4, 1, 1,
0.2301218, -0.1872448, 3.133055, 0, 0.3921569, 1, 1,
0.230731, 0.06506351, 1.194826, 0, 0.3882353, 1, 1,
0.2316524, 0.8719568, 1.149166, 0, 0.3803922, 1, 1,
0.238467, 0.4001085, 0.6613451, 0, 0.3764706, 1, 1,
0.2448573, 1.097329, 0.09003997, 0, 0.3686275, 1, 1,
0.2466408, 0.3924307, -1.31696, 0, 0.3647059, 1, 1,
0.2481152, -0.2557032, 2.514636, 0, 0.3568628, 1, 1,
0.2483212, 0.4067981, -1.285359, 0, 0.3529412, 1, 1,
0.252121, -0.4755474, 2.775514, 0, 0.345098, 1, 1,
0.2564327, 2.707384, -0.121757, 0, 0.3411765, 1, 1,
0.259255, 0.7940931, 0.7364494, 0, 0.3333333, 1, 1,
0.2701349, 0.2286742, 0.03594622, 0, 0.3294118, 1, 1,
0.270522, -2.665877, 4.08559, 0, 0.3215686, 1, 1,
0.2724455, 2.256281, -0.1115002, 0, 0.3176471, 1, 1,
0.2744603, -0.04618477, 3.597803, 0, 0.3098039, 1, 1,
0.2765756, 0.4536558, 0.06628224, 0, 0.3058824, 1, 1,
0.2778797, 0.8062386, 1.831326, 0, 0.2980392, 1, 1,
0.2782121, -0.387607, 1.300654, 0, 0.2901961, 1, 1,
0.2782617, -0.8698061, 1.794889, 0, 0.2862745, 1, 1,
0.2788382, 0.8450283, 0.7709131, 0, 0.2784314, 1, 1,
0.278895, 1.045883, 0.3081899, 0, 0.2745098, 1, 1,
0.28348, 0.1272656, 0.5894659, 0, 0.2666667, 1, 1,
0.2852872, 0.3696864, 1.089346, 0, 0.2627451, 1, 1,
0.2860395, -0.01924857, 3.105748, 0, 0.254902, 1, 1,
0.2863666, 0.4871242, 0.1270436, 0, 0.2509804, 1, 1,
0.286564, 0.1496212, 1.999546, 0, 0.2431373, 1, 1,
0.2896032, -1.451099, 4.780793, 0, 0.2392157, 1, 1,
0.2902351, -1.345857, 4.578236, 0, 0.2313726, 1, 1,
0.2912076, 1.325965, 0.6180515, 0, 0.227451, 1, 1,
0.2933882, -0.2905573, 3.15126, 0, 0.2196078, 1, 1,
0.3006263, 0.1390393, 0.1272179, 0, 0.2156863, 1, 1,
0.3010363, -1.189516, 3.912588, 0, 0.2078431, 1, 1,
0.3039909, 0.2349869, 0.4876294, 0, 0.2039216, 1, 1,
0.3055831, 0.004394025, 2.008868, 0, 0.1960784, 1, 1,
0.3089266, -0.4650444, 2.215546, 0, 0.1882353, 1, 1,
0.310721, 0.8768565, -0.7551456, 0, 0.1843137, 1, 1,
0.3135249, -0.1025207, 1.128071, 0, 0.1764706, 1, 1,
0.3183474, -1.044147, 1.077081, 0, 0.172549, 1, 1,
0.3187199, -0.4923539, 2.438602, 0, 0.1647059, 1, 1,
0.3211409, -1.279682, 2.677983, 0, 0.1607843, 1, 1,
0.3236977, -0.2774756, 1.586825, 0, 0.1529412, 1, 1,
0.3238225, -1.418515, 3.227473, 0, 0.1490196, 1, 1,
0.324982, -0.89667, 2.467178, 0, 0.1411765, 1, 1,
0.327896, 0.580025, 1.044709, 0, 0.1372549, 1, 1,
0.3279755, -0.2113175, 1.461679, 0, 0.1294118, 1, 1,
0.3325559, -0.6258569, 2.89033, 0, 0.1254902, 1, 1,
0.3331044, 1.699949, 0.5904685, 0, 0.1176471, 1, 1,
0.3340021, -2.032245, 4.024104, 0, 0.1137255, 1, 1,
0.3382789, 1.782922, -0.1513442, 0, 0.1058824, 1, 1,
0.339947, -1.167449, 3.683398, 0, 0.09803922, 1, 1,
0.3436058, 1.979915, 0.8055538, 0, 0.09411765, 1, 1,
0.3470984, 0.8282432, -0.816254, 0, 0.08627451, 1, 1,
0.3526221, -0.8266998, 2.856161, 0, 0.08235294, 1, 1,
0.3575728, 1.425801, -2.050584, 0, 0.07450981, 1, 1,
0.3688939, -0.3461716, 2.022066, 0, 0.07058824, 1, 1,
0.3712217, 1.009837, -1.344494, 0, 0.0627451, 1, 1,
0.3723632, 0.2341343, -0.7394721, 0, 0.05882353, 1, 1,
0.3800625, 0.7600875, 0.2957329, 0, 0.05098039, 1, 1,
0.3818583, 0.8325369, 0.07974694, 0, 0.04705882, 1, 1,
0.3824282, 0.127239, 2.10922, 0, 0.03921569, 1, 1,
0.3830907, 0.4249756, 1.503168, 0, 0.03529412, 1, 1,
0.3866472, -0.8443369, 1.974855, 0, 0.02745098, 1, 1,
0.3906834, 0.9581764, -0.3034879, 0, 0.02352941, 1, 1,
0.3918457, 0.9685625, 1.707467, 0, 0.01568628, 1, 1,
0.3942978, 0.7163931, -1.194934, 0, 0.01176471, 1, 1,
0.394382, 0.8841299, -0.2755367, 0, 0.003921569, 1, 1,
0.3972619, -1.495131, 4.428258, 0.003921569, 0, 1, 1,
0.4008394, -0.9350883, 3.606804, 0.007843138, 0, 1, 1,
0.4017044, -0.4639188, 2.614753, 0.01568628, 0, 1, 1,
0.4029719, -0.788668, 3.456014, 0.01960784, 0, 1, 1,
0.4031263, 0.887807, 1.065464, 0.02745098, 0, 1, 1,
0.4040641, 0.08734561, -0.2718461, 0.03137255, 0, 1, 1,
0.4055274, 0.2239789, 1.526512, 0.03921569, 0, 1, 1,
0.4057548, 0.3785168, 1.354466, 0.04313726, 0, 1, 1,
0.4069971, 1.365253, -1.20942, 0.05098039, 0, 1, 1,
0.4111283, -1.144823, 2.158333, 0.05490196, 0, 1, 1,
0.4143061, -0.7539676, 4.094888, 0.0627451, 0, 1, 1,
0.4147224, -0.3884982, 2.663543, 0.06666667, 0, 1, 1,
0.4218125, 0.1853408, 1.394635, 0.07450981, 0, 1, 1,
0.4286125, 1.013419, -2.410185, 0.07843138, 0, 1, 1,
0.4289068, 0.08842257, 0.7992385, 0.08627451, 0, 1, 1,
0.4320568, 2.036469, -0.2882605, 0.09019608, 0, 1, 1,
0.4329036, 0.5412757, -0.126448, 0.09803922, 0, 1, 1,
0.4417024, 0.01749658, 2.539585, 0.1058824, 0, 1, 1,
0.4423225, 1.878849, -0.4750288, 0.1098039, 0, 1, 1,
0.4443929, 0.5838407, 1.2675, 0.1176471, 0, 1, 1,
0.4488016, -1.29938, 2.116501, 0.1215686, 0, 1, 1,
0.4497822, 2.857565, -0.2518702, 0.1294118, 0, 1, 1,
0.454641, -0.03333273, 0.6066034, 0.1333333, 0, 1, 1,
0.4555091, 1.23722, 0.09962722, 0.1411765, 0, 1, 1,
0.4564028, 1.694481, 0.2192135, 0.145098, 0, 1, 1,
0.462712, -0.6098818, 2.243046, 0.1529412, 0, 1, 1,
0.4628773, -0.7935326, 1.976382, 0.1568628, 0, 1, 1,
0.4666246, 0.00570943, -0.2302122, 0.1647059, 0, 1, 1,
0.4674031, 1.316607, -1.257009, 0.1686275, 0, 1, 1,
0.4685028, -0.7625154, 4.085231, 0.1764706, 0, 1, 1,
0.4693576, -1.409584, 3.398614, 0.1803922, 0, 1, 1,
0.4701569, -0.7545801, 2.314449, 0.1882353, 0, 1, 1,
0.4741181, 0.3849902, 1.069331, 0.1921569, 0, 1, 1,
0.4744255, 0.2292483, 2.391769, 0.2, 0, 1, 1,
0.4763325, 1.9741, 2.500452, 0.2078431, 0, 1, 1,
0.4763519, -1.265743, 0.6379153, 0.2117647, 0, 1, 1,
0.4806347, -1.641405, 3.407876, 0.2196078, 0, 1, 1,
0.4813367, 1.125607, 0.3048684, 0.2235294, 0, 1, 1,
0.4817935, -0.1406876, 1.652174, 0.2313726, 0, 1, 1,
0.4826878, 0.5416496, 1.461478, 0.2352941, 0, 1, 1,
0.4835664, -0.5992252, 1.782143, 0.2431373, 0, 1, 1,
0.4837774, 1.604993, 0.1871908, 0.2470588, 0, 1, 1,
0.4882977, -0.3129049, 3.378711, 0.254902, 0, 1, 1,
0.4915, -0.6201062, 3.485351, 0.2588235, 0, 1, 1,
0.4971509, 0.2125297, 0.6178349, 0.2666667, 0, 1, 1,
0.5007387, 0.07213973, 0.2086884, 0.2705882, 0, 1, 1,
0.5008156, -0.7289211, 2.601821, 0.2784314, 0, 1, 1,
0.5027301, -0.5845608, 1.807803, 0.282353, 0, 1, 1,
0.5036324, -0.5792364, 2.872754, 0.2901961, 0, 1, 1,
0.5071773, 1.460036, 1.769899, 0.2941177, 0, 1, 1,
0.508597, 0.5100487, 2.043919, 0.3019608, 0, 1, 1,
0.5117051, -0.1251115, 3.3487, 0.3098039, 0, 1, 1,
0.5130934, -0.6062437, 2.882509, 0.3137255, 0, 1, 1,
0.5169802, -1.21391, 1.685814, 0.3215686, 0, 1, 1,
0.5207434, 1.485843, 0.1617233, 0.3254902, 0, 1, 1,
0.5219834, 0.09106361, -1.418766, 0.3333333, 0, 1, 1,
0.5288298, -1.120617, 3.403736, 0.3372549, 0, 1, 1,
0.5300983, 1.926107, 0.5073369, 0.345098, 0, 1, 1,
0.5344836, 0.3103128, 1.842385, 0.3490196, 0, 1, 1,
0.5374004, -1.953227, 3.844265, 0.3568628, 0, 1, 1,
0.5438997, -1.05096, 3.412899, 0.3607843, 0, 1, 1,
0.5445102, 0.4481053, 0.5575578, 0.3686275, 0, 1, 1,
0.5453445, -0.01764285, 1.41744, 0.372549, 0, 1, 1,
0.5558507, -0.4907042, 2.792633, 0.3803922, 0, 1, 1,
0.558692, -0.6106712, 3.346178, 0.3843137, 0, 1, 1,
0.5609483, 0.02529779, 1.739229, 0.3921569, 0, 1, 1,
0.5649031, -1.891605, 4.137341, 0.3960784, 0, 1, 1,
0.5656219, -0.8546547, 2.058894, 0.4039216, 0, 1, 1,
0.5677901, -1.160229, 1.758667, 0.4117647, 0, 1, 1,
0.5740886, 0.4626421, 0.7167273, 0.4156863, 0, 1, 1,
0.5748484, -0.1353707, 0.4352993, 0.4235294, 0, 1, 1,
0.5760849, -0.414351, 1.06194, 0.427451, 0, 1, 1,
0.576826, -0.4331603, 1.383828, 0.4352941, 0, 1, 1,
0.5869348, 1.432812, 0.3931585, 0.4392157, 0, 1, 1,
0.5923772, -2.481881, 2.009367, 0.4470588, 0, 1, 1,
0.5929815, -0.9554913, 1.705985, 0.4509804, 0, 1, 1,
0.5930311, 0.4916925, 0.00585897, 0.4588235, 0, 1, 1,
0.5948771, 0.8007228, 1.318986, 0.4627451, 0, 1, 1,
0.5952221, 1.035586, 0.9368208, 0.4705882, 0, 1, 1,
0.5961282, -1.775548, 1.766845, 0.4745098, 0, 1, 1,
0.6013232, 1.056345, 0.5760433, 0.4823529, 0, 1, 1,
0.6016271, 1.340696, -0.4857774, 0.4862745, 0, 1, 1,
0.6030346, 0.2085941, 2.157353, 0.4941176, 0, 1, 1,
0.6031166, 0.1809208, 2.394826, 0.5019608, 0, 1, 1,
0.6087098, -1.20454, 3.397317, 0.5058824, 0, 1, 1,
0.6088227, -0.3659671, 3.790261, 0.5137255, 0, 1, 1,
0.6126359, 1.33683, -0.8880435, 0.5176471, 0, 1, 1,
0.6128603, 0.2002128, 0.1598882, 0.5254902, 0, 1, 1,
0.6136426, 1.51861, 0.7457759, 0.5294118, 0, 1, 1,
0.6139554, 0.7957244, 1.534371, 0.5372549, 0, 1, 1,
0.6265756, 0.7462904, -0.1368714, 0.5411765, 0, 1, 1,
0.6293515, -1.093262, 4.563908, 0.5490196, 0, 1, 1,
0.6319949, -0.1578082, 0.7637817, 0.5529412, 0, 1, 1,
0.6355921, -0.3188231, 1.348295, 0.5607843, 0, 1, 1,
0.6375456, 1.339468, -0.07969276, 0.5647059, 0, 1, 1,
0.6431066, 0.0007410485, 0.97896, 0.572549, 0, 1, 1,
0.6446854, -0.741678, 3.095549, 0.5764706, 0, 1, 1,
0.6481445, -0.744774, 1.848908, 0.5843138, 0, 1, 1,
0.6482553, -0.3571432, 3.493518, 0.5882353, 0, 1, 1,
0.6503557, 2.027815, 0.06220562, 0.5960785, 0, 1, 1,
0.6528687, 0.3532783, 2.034425, 0.6039216, 0, 1, 1,
0.655136, 1.090075, -0.7214946, 0.6078432, 0, 1, 1,
0.657985, 0.01432527, 1.738882, 0.6156863, 0, 1, 1,
0.6597161, 0.3820688, 2.707841, 0.6196079, 0, 1, 1,
0.6620859, -0.6689216, 2.217279, 0.627451, 0, 1, 1,
0.6623976, -0.1824149, 1.693887, 0.6313726, 0, 1, 1,
0.6629747, 0.7112519, -0.299626, 0.6392157, 0, 1, 1,
0.6645529, 1.382654, 0.4605862, 0.6431373, 0, 1, 1,
0.6667148, 1.721755, 0.4421846, 0.6509804, 0, 1, 1,
0.6724361, 0.4632294, 2.789095, 0.654902, 0, 1, 1,
0.6735506, 1.143964, 1.131328, 0.6627451, 0, 1, 1,
0.6756995, 0.2619762, 0.9242817, 0.6666667, 0, 1, 1,
0.6760147, 1.547773, 0.8280954, 0.6745098, 0, 1, 1,
0.6817347, 0.4723668, 1.468083, 0.6784314, 0, 1, 1,
0.6920244, -1.933591, 2.548753, 0.6862745, 0, 1, 1,
0.7059542, -0.03078768, 4.182993, 0.6901961, 0, 1, 1,
0.7138722, -2.190115, 2.357003, 0.6980392, 0, 1, 1,
0.7156742, -0.06464969, 1.306707, 0.7058824, 0, 1, 1,
0.7172283, 0.1978514, 0.07675653, 0.7098039, 0, 1, 1,
0.7191693, 0.3006777, 1.393687, 0.7176471, 0, 1, 1,
0.7195802, -1.642534, 3.393637, 0.7215686, 0, 1, 1,
0.7232199, -0.03203287, 0.5778077, 0.7294118, 0, 1, 1,
0.7246633, -0.4971447, 1.349495, 0.7333333, 0, 1, 1,
0.7295661, -0.5583628, 1.879894, 0.7411765, 0, 1, 1,
0.7339813, -0.3412319, 1.046579, 0.7450981, 0, 1, 1,
0.7350703, 0.2859937, -0.451668, 0.7529412, 0, 1, 1,
0.7412153, 0.3839672, 0.9235947, 0.7568628, 0, 1, 1,
0.7468247, -0.6351935, 1.71666, 0.7647059, 0, 1, 1,
0.7507735, -0.835291, 2.163708, 0.7686275, 0, 1, 1,
0.7531106, -0.9956633, 1.931775, 0.7764706, 0, 1, 1,
0.7549909, -0.4263825, 3.676007, 0.7803922, 0, 1, 1,
0.7602273, 0.3683034, 0.5886809, 0.7882353, 0, 1, 1,
0.7722457, -0.347385, 2.380152, 0.7921569, 0, 1, 1,
0.7726334, 0.3367665, 1.085225, 0.8, 0, 1, 1,
0.7737901, 1.656712, 2.001372, 0.8078431, 0, 1, 1,
0.7755284, -0.09040176, 1.582063, 0.8117647, 0, 1, 1,
0.7827072, 0.1660453, 1.965563, 0.8196079, 0, 1, 1,
0.7956858, -0.2510198, 1.701761, 0.8235294, 0, 1, 1,
0.7964215, -0.1376249, 1.369673, 0.8313726, 0, 1, 1,
0.7964292, -1.217209, 2.356027, 0.8352941, 0, 1, 1,
0.7966439, -1.090768, 3.309913, 0.8431373, 0, 1, 1,
0.7994218, -2.008836, 1.987189, 0.8470588, 0, 1, 1,
0.8022041, -0.8439502, 2.246626, 0.854902, 0, 1, 1,
0.8098954, -1.090872, 0.8948278, 0.8588235, 0, 1, 1,
0.8125737, 0.7348461, 0.6001823, 0.8666667, 0, 1, 1,
0.8145053, 1.312546, 0.8782539, 0.8705882, 0, 1, 1,
0.8148685, -0.1314141, 3.194105, 0.8784314, 0, 1, 1,
0.8250777, -0.06038434, 1.917981, 0.8823529, 0, 1, 1,
0.8317136, -0.2830012, -0.3013039, 0.8901961, 0, 1, 1,
0.8338947, -1.039539, 2.608542, 0.8941177, 0, 1, 1,
0.8383937, -0.8308622, 2.306034, 0.9019608, 0, 1, 1,
0.8463838, -0.3487794, 2.16688, 0.9098039, 0, 1, 1,
0.8465898, -1.788826, 2.995642, 0.9137255, 0, 1, 1,
0.851259, 0.1464143, 1.172755, 0.9215686, 0, 1, 1,
0.8545721, 0.8910841, -0.02983264, 0.9254902, 0, 1, 1,
0.8603982, 1.076264, 1.737292, 0.9333333, 0, 1, 1,
0.8612405, -1.070763, 2.657505, 0.9372549, 0, 1, 1,
0.8668209, -0.5172955, 2.637041, 0.945098, 0, 1, 1,
0.8746746, -0.7737303, 4.140452, 0.9490196, 0, 1, 1,
0.8764443, -0.05516503, 3.412528, 0.9568627, 0, 1, 1,
0.8772388, 0.501591, 0.1791272, 0.9607843, 0, 1, 1,
0.8788803, 0.01614572, 3.521734, 0.9686275, 0, 1, 1,
0.8919626, 1.48917, 0.5376732, 0.972549, 0, 1, 1,
0.894651, -0.9580433, 1.807791, 0.9803922, 0, 1, 1,
0.8946897, -1.994523, 2.378763, 0.9843137, 0, 1, 1,
0.9050332, 0.1307416, 1.322943, 0.9921569, 0, 1, 1,
0.9070629, 0.7267398, 0.9761091, 0.9960784, 0, 1, 1,
0.9076397, -0.502922, 2.45524, 1, 0, 0.9960784, 1,
0.9091279, 0.7510563, 1.746151, 1, 0, 0.9882353, 1,
0.9119433, -0.3701577, 0.4350446, 1, 0, 0.9843137, 1,
0.9119739, -0.01881816, 1.192378, 1, 0, 0.9764706, 1,
0.9177466, -0.06313358, 0.09933342, 1, 0, 0.972549, 1,
0.9195149, -0.2249067, 0.5910692, 1, 0, 0.9647059, 1,
0.92417, -1.151482, 3.373901, 1, 0, 0.9607843, 1,
0.9274824, 2.468205, 0.6333687, 1, 0, 0.9529412, 1,
0.9285097, -0.2704261, 1.571828, 1, 0, 0.9490196, 1,
0.9287983, 1.106302, 1.188902, 1, 0, 0.9411765, 1,
0.9332205, 0.5387868, 1.614072, 1, 0, 0.9372549, 1,
0.9365621, 1.069266, 0.8907384, 1, 0, 0.9294118, 1,
0.9477357, -0.7442625, 3.303261, 1, 0, 0.9254902, 1,
0.9481453, 1.518262, 0.9684404, 1, 0, 0.9176471, 1,
0.9538746, -0.2857792, 1.487995, 1, 0, 0.9137255, 1,
0.9592518, 0.6567692, 0.2870019, 1, 0, 0.9058824, 1,
0.9618205, 0.3582636, 0.008357792, 1, 0, 0.9019608, 1,
0.9653304, -0.1143193, 0.07133853, 1, 0, 0.8941177, 1,
0.9670746, -1.491425, 4.318058, 1, 0, 0.8862745, 1,
0.9801549, 0.6767865, 0.1917917, 1, 0, 0.8823529, 1,
0.9847118, 0.3982833, 2.051742, 1, 0, 0.8745098, 1,
0.9912788, 0.1576411, 2.597245, 1, 0, 0.8705882, 1,
0.995097, 1.595136, 0.3287264, 1, 0, 0.8627451, 1,
0.9953408, -0.175866, 1.847735, 1, 0, 0.8588235, 1,
0.9966754, -0.3718269, 1.135077, 1, 0, 0.8509804, 1,
0.998001, 1.294973, 0.6990086, 1, 0, 0.8470588, 1,
1.000356, 1.176534, 1.037591, 1, 0, 0.8392157, 1,
1.005253, 0.9382617, 0.9606636, 1, 0, 0.8352941, 1,
1.006281, -1.219583, 2.836934, 1, 0, 0.827451, 1,
1.011121, 1.347988, 0.9095217, 1, 0, 0.8235294, 1,
1.0135, -0.2862557, 1.343554, 1, 0, 0.8156863, 1,
1.014159, 0.5015158, 1.782859, 1, 0, 0.8117647, 1,
1.015552, -0.2512044, 0.6239085, 1, 0, 0.8039216, 1,
1.020448, 1.559815, -0.8948355, 1, 0, 0.7960784, 1,
1.021839, -1.672369, 3.599591, 1, 0, 0.7921569, 1,
1.023396, 0.5811607, 1.093072, 1, 0, 0.7843137, 1,
1.025132, 1.306553, 0.8050274, 1, 0, 0.7803922, 1,
1.030385, 1.622216, 0.2397241, 1, 0, 0.772549, 1,
1.030912, 0.5127956, 1.368569, 1, 0, 0.7686275, 1,
1.032613, -0.07008858, 2.016013, 1, 0, 0.7607843, 1,
1.044253, 2.615836, 0.7062541, 1, 0, 0.7568628, 1,
1.052149, -2.485804, 3.093663, 1, 0, 0.7490196, 1,
1.053183, -0.06285266, 2.924835, 1, 0, 0.7450981, 1,
1.056152, -0.656895, 1.429355, 1, 0, 0.7372549, 1,
1.062197, 2.193082, -0.1423802, 1, 0, 0.7333333, 1,
1.067263, 0.1275656, 1.01691, 1, 0, 0.7254902, 1,
1.102368, -1.779959, 2.879637, 1, 0, 0.7215686, 1,
1.106816, -0.9020235, 1.512442, 1, 0, 0.7137255, 1,
1.114427, -0.505617, 2.242664, 1, 0, 0.7098039, 1,
1.114577, -0.9650529, 2.055288, 1, 0, 0.7019608, 1,
1.117409, 0.3821216, 1.23577, 1, 0, 0.6941177, 1,
1.118421, 0.2640084, 1.9328, 1, 0, 0.6901961, 1,
1.127648, -0.5289086, 1.467581, 1, 0, 0.682353, 1,
1.142541, 0.1563613, 3.58387, 1, 0, 0.6784314, 1,
1.142659, 0.6020831, -0.4330064, 1, 0, 0.6705883, 1,
1.142906, -0.2169028, 1.852924, 1, 0, 0.6666667, 1,
1.146667, -0.6058158, 2.046916, 1, 0, 0.6588235, 1,
1.163157, 1.602358, 0.840726, 1, 0, 0.654902, 1,
1.165913, 0.4847117, 1.303557, 1, 0, 0.6470588, 1,
1.172532, 1.227499, 1.133883, 1, 0, 0.6431373, 1,
1.208881, 1.204343, 0.80436, 1, 0, 0.6352941, 1,
1.214989, 1.159181, 1.184708, 1, 0, 0.6313726, 1,
1.215254, -0.4974223, 1.350071, 1, 0, 0.6235294, 1,
1.232341, 0.9950118, 1.530465, 1, 0, 0.6196079, 1,
1.23735, 0.430654, 1.707519, 1, 0, 0.6117647, 1,
1.237728, 0.05776899, 1.409535, 1, 0, 0.6078432, 1,
1.238474, 0.2838576, 0.4717559, 1, 0, 0.6, 1,
1.239008, -0.9290022, 3.231186, 1, 0, 0.5921569, 1,
1.239998, 1.205726, 0.823934, 1, 0, 0.5882353, 1,
1.242994, 0.1816457, 1.059264, 1, 0, 0.5803922, 1,
1.270709, -0.4776777, 1.687474, 1, 0, 0.5764706, 1,
1.285912, -1.0509, 1.137482, 1, 0, 0.5686275, 1,
1.286414, -1.239816, 3.053245, 1, 0, 0.5647059, 1,
1.297259, 0.8018878, 0.6079555, 1, 0, 0.5568628, 1,
1.300483, -0.2890573, 2.14548, 1, 0, 0.5529412, 1,
1.303183, 0.3898311, 1.139318, 1, 0, 0.5450981, 1,
1.305567, -0.112524, 0.1407311, 1, 0, 0.5411765, 1,
1.309707, 0.4916168, 1.160644, 1, 0, 0.5333334, 1,
1.311629, -0.3059038, 1.753205, 1, 0, 0.5294118, 1,
1.31309, 0.4972269, 1.4835, 1, 0, 0.5215687, 1,
1.329957, 1.291045, -0.1539829, 1, 0, 0.5176471, 1,
1.329961, 0.9246952, 1.463786, 1, 0, 0.509804, 1,
1.332045, -0.5857691, 3.554042, 1, 0, 0.5058824, 1,
1.33717, -0.4904746, 1.5987, 1, 0, 0.4980392, 1,
1.345992, 1.131836, 1.091932, 1, 0, 0.4901961, 1,
1.350471, -1.369289, 2.756721, 1, 0, 0.4862745, 1,
1.362708, 0.6536058, 1.548512, 1, 0, 0.4784314, 1,
1.366305, -1.339159, 2.777394, 1, 0, 0.4745098, 1,
1.369434, -0.6464781, 0.4436079, 1, 0, 0.4666667, 1,
1.381651, 0.3467285, 1.816472, 1, 0, 0.4627451, 1,
1.39486, -0.8883007, 1.50133, 1, 0, 0.454902, 1,
1.394875, 0.7664229, 0.9290045, 1, 0, 0.4509804, 1,
1.398272, 0.8976811, 1.277259, 1, 0, 0.4431373, 1,
1.404502, -0.1466977, 0.8629465, 1, 0, 0.4392157, 1,
1.425456, 1.2266, 1.487901, 1, 0, 0.4313726, 1,
1.42566, 1.07178, 1.091127, 1, 0, 0.427451, 1,
1.432456, -0.2388122, 0.4923261, 1, 0, 0.4196078, 1,
1.434783, -1.246614, 4.625347, 1, 0, 0.4156863, 1,
1.443424, -0.6383193, 2.45379, 1, 0, 0.4078431, 1,
1.461431, -1.01712, 0.9047529, 1, 0, 0.4039216, 1,
1.464811, -2.14811, 2.524903, 1, 0, 0.3960784, 1,
1.466065, 1.522215, 0.4495984, 1, 0, 0.3882353, 1,
1.474601, 0.9909011, -0.3590796, 1, 0, 0.3843137, 1,
1.476242, -0.8607978, 2.439204, 1, 0, 0.3764706, 1,
1.477647, 1.221652, 0.3608963, 1, 0, 0.372549, 1,
1.481222, -1.158215, 3.422103, 1, 0, 0.3647059, 1,
1.484846, 1.60328, -0.4495095, 1, 0, 0.3607843, 1,
1.485961, 2.680584, 0.08915115, 1, 0, 0.3529412, 1,
1.491121, -0.1306208, 0.8930022, 1, 0, 0.3490196, 1,
1.493474, -1.316842, 2.765294, 1, 0, 0.3411765, 1,
1.506773, 0.3072034, 0.7754867, 1, 0, 0.3372549, 1,
1.521073, -0.4557036, 0.5068245, 1, 0, 0.3294118, 1,
1.534515, -1.306659, 2.72928, 1, 0, 0.3254902, 1,
1.537779, -2.770109, 2.846215, 1, 0, 0.3176471, 1,
1.539427, -1.511422, 2.563587, 1, 0, 0.3137255, 1,
1.541814, -1.426713, 3.227061, 1, 0, 0.3058824, 1,
1.543422, -0.2464574, 0.3904138, 1, 0, 0.2980392, 1,
1.572942, -0.402734, 2.427006, 1, 0, 0.2941177, 1,
1.611611, -0.1231113, 2.040196, 1, 0, 0.2862745, 1,
1.614956, 0.7505151, 1.384648, 1, 0, 0.282353, 1,
1.629499, -0.1532069, 1.924, 1, 0, 0.2745098, 1,
1.630029, 0.401413, -0.01771975, 1, 0, 0.2705882, 1,
1.631604, -0.7558811, 2.668522, 1, 0, 0.2627451, 1,
1.641426, -0.1778798, 0.7451846, 1, 0, 0.2588235, 1,
1.644683, 0.07899899, 3.344383, 1, 0, 0.2509804, 1,
1.646177, -0.8917078, 1.514429, 1, 0, 0.2470588, 1,
1.665073, 0.167171, 1.789733, 1, 0, 0.2392157, 1,
1.66867, 2.208374, 0.0936844, 1, 0, 0.2352941, 1,
1.669793, 0.2616816, 1.03238, 1, 0, 0.227451, 1,
1.68242, 0.3123978, 0.2344097, 1, 0, 0.2235294, 1,
1.692841, 0.06411321, 2.697749, 1, 0, 0.2156863, 1,
1.706766, -0.7786878, 0.7392618, 1, 0, 0.2117647, 1,
1.714516, 0.8029055, -0.05157518, 1, 0, 0.2039216, 1,
1.723927, 0.242279, 2.190628, 1, 0, 0.1960784, 1,
1.739737, -0.02861576, 2.32706, 1, 0, 0.1921569, 1,
1.783599, -1.521951, 1.839997, 1, 0, 0.1843137, 1,
1.789748, 0.3717501, 2.153542, 1, 0, 0.1803922, 1,
1.794111, 0.1518325, 3.063004, 1, 0, 0.172549, 1,
1.806126, 0.5563147, 2.362887, 1, 0, 0.1686275, 1,
1.820528, -0.2368285, 2.473927, 1, 0, 0.1607843, 1,
1.822951, 0.7561871, 2.879384, 1, 0, 0.1568628, 1,
1.826461, -2.046372, 3.680558, 1, 0, 0.1490196, 1,
1.834103, -0.570859, 2.299505, 1, 0, 0.145098, 1,
1.845752, -0.6213486, 3.249712, 1, 0, 0.1372549, 1,
1.845824, -1.623717, 2.093692, 1, 0, 0.1333333, 1,
1.866247, 1.398373, 0.3239568, 1, 0, 0.1254902, 1,
1.86708, 0.3952856, 1.733977, 1, 0, 0.1215686, 1,
1.913735, 1.300169, 1.702475, 1, 0, 0.1137255, 1,
1.972764, -1.14775, 2.259703, 1, 0, 0.1098039, 1,
1.98414, 2.000393, 0.4010386, 1, 0, 0.1019608, 1,
2.02333, -0.2212749, 2.348403, 1, 0, 0.09411765, 1,
2.043319, -0.3195382, 1.194869, 1, 0, 0.09019608, 1,
2.052984, 0.7850031, 0.9729722, 1, 0, 0.08235294, 1,
2.067276, 0.7550723, -0.2349419, 1, 0, 0.07843138, 1,
2.098874, -1.09397, 4.07211, 1, 0, 0.07058824, 1,
2.248497, -0.7837323, 0.3620021, 1, 0, 0.06666667, 1,
2.285324, 0.05052863, 0.24661, 1, 0, 0.05882353, 1,
2.596552, 0.2374477, 1.059639, 1, 0, 0.05490196, 1,
2.611054, -0.7212046, 0.06945035, 1, 0, 0.04705882, 1,
2.613663, -0.3678841, 1.101815, 1, 0, 0.04313726, 1,
2.683139, -0.5386012, 0.7538428, 1, 0, 0.03529412, 1,
2.727106, 0.4583992, 1.585927, 1, 0, 0.03137255, 1,
2.749062, -0.3703844, 0.7806553, 1, 0, 0.02352941, 1,
2.944009, -0.1016051, 1.625159, 1, 0, 0.01960784, 1,
2.94817, 0.5249924, 0.6665358, 1, 0, 0.01176471, 1,
3.312083, -0.03762124, 1.056284, 1, 0, 0.007843138, 1
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
0.3944024, -4.239625, -7.498543, 0, -0.5, 0.5, 0.5,
0.3944024, -4.239625, -7.498543, 1, -0.5, 0.5, 0.5,
0.3944024, -4.239625, -7.498543, 1, 1.5, 0.5, 0.5,
0.3944024, -4.239625, -7.498543, 0, 1.5, 0.5, 0.5
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
-3.512371, 0.07112515, -7.498543, 0, -0.5, 0.5, 0.5,
-3.512371, 0.07112515, -7.498543, 1, -0.5, 0.5, 0.5,
-3.512371, 0.07112515, -7.498543, 1, 1.5, 0.5, 0.5,
-3.512371, 0.07112515, -7.498543, 0, 1.5, 0.5, 0.5
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
-3.512371, -4.239625, 0.01437926, 0, -0.5, 0.5, 0.5,
-3.512371, -4.239625, 0.01437926, 1, -0.5, 0.5, 0.5,
-3.512371, -4.239625, 0.01437926, 1, 1.5, 0.5, 0.5,
-3.512371, -4.239625, 0.01437926, 0, 1.5, 0.5, 0.5
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
-2, -3.244837, -5.764791,
3, -3.244837, -5.764791,
-2, -3.244837, -5.764791,
-2, -3.410635, -6.05375,
-1, -3.244837, -5.764791,
-1, -3.410635, -6.05375,
0, -3.244837, -5.764791,
0, -3.410635, -6.05375,
1, -3.244837, -5.764791,
1, -3.410635, -6.05375,
2, -3.244837, -5.764791,
2, -3.410635, -6.05375,
3, -3.244837, -5.764791,
3, -3.410635, -6.05375
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
-2, -3.742231, -6.631667, 0, -0.5, 0.5, 0.5,
-2, -3.742231, -6.631667, 1, -0.5, 0.5, 0.5,
-2, -3.742231, -6.631667, 1, 1.5, 0.5, 0.5,
-2, -3.742231, -6.631667, 0, 1.5, 0.5, 0.5,
-1, -3.742231, -6.631667, 0, -0.5, 0.5, 0.5,
-1, -3.742231, -6.631667, 1, -0.5, 0.5, 0.5,
-1, -3.742231, -6.631667, 1, 1.5, 0.5, 0.5,
-1, -3.742231, -6.631667, 0, 1.5, 0.5, 0.5,
0, -3.742231, -6.631667, 0, -0.5, 0.5, 0.5,
0, -3.742231, -6.631667, 1, -0.5, 0.5, 0.5,
0, -3.742231, -6.631667, 1, 1.5, 0.5, 0.5,
0, -3.742231, -6.631667, 0, 1.5, 0.5, 0.5,
1, -3.742231, -6.631667, 0, -0.5, 0.5, 0.5,
1, -3.742231, -6.631667, 1, -0.5, 0.5, 0.5,
1, -3.742231, -6.631667, 1, 1.5, 0.5, 0.5,
1, -3.742231, -6.631667, 0, 1.5, 0.5, 0.5,
2, -3.742231, -6.631667, 0, -0.5, 0.5, 0.5,
2, -3.742231, -6.631667, 1, -0.5, 0.5, 0.5,
2, -3.742231, -6.631667, 1, 1.5, 0.5, 0.5,
2, -3.742231, -6.631667, 0, 1.5, 0.5, 0.5,
3, -3.742231, -6.631667, 0, -0.5, 0.5, 0.5,
3, -3.742231, -6.631667, 1, -0.5, 0.5, 0.5,
3, -3.742231, -6.631667, 1, 1.5, 0.5, 0.5,
3, -3.742231, -6.631667, 0, 1.5, 0.5, 0.5
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
-2.610808, -3, -5.764791,
-2.610808, 3, -5.764791,
-2.610808, -3, -5.764791,
-2.761069, -3, -6.05375,
-2.610808, -2, -5.764791,
-2.761069, -2, -6.05375,
-2.610808, -1, -5.764791,
-2.761069, -1, -6.05375,
-2.610808, 0, -5.764791,
-2.761069, 0, -6.05375,
-2.610808, 1, -5.764791,
-2.761069, 1, -6.05375,
-2.610808, 2, -5.764791,
-2.761069, 2, -6.05375,
-2.610808, 3, -5.764791,
-2.761069, 3, -6.05375
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
-3.06159, -3, -6.631667, 0, -0.5, 0.5, 0.5,
-3.06159, -3, -6.631667, 1, -0.5, 0.5, 0.5,
-3.06159, -3, -6.631667, 1, 1.5, 0.5, 0.5,
-3.06159, -3, -6.631667, 0, 1.5, 0.5, 0.5,
-3.06159, -2, -6.631667, 0, -0.5, 0.5, 0.5,
-3.06159, -2, -6.631667, 1, -0.5, 0.5, 0.5,
-3.06159, -2, -6.631667, 1, 1.5, 0.5, 0.5,
-3.06159, -2, -6.631667, 0, 1.5, 0.5, 0.5,
-3.06159, -1, -6.631667, 0, -0.5, 0.5, 0.5,
-3.06159, -1, -6.631667, 1, -0.5, 0.5, 0.5,
-3.06159, -1, -6.631667, 1, 1.5, 0.5, 0.5,
-3.06159, -1, -6.631667, 0, 1.5, 0.5, 0.5,
-3.06159, 0, -6.631667, 0, -0.5, 0.5, 0.5,
-3.06159, 0, -6.631667, 1, -0.5, 0.5, 0.5,
-3.06159, 0, -6.631667, 1, 1.5, 0.5, 0.5,
-3.06159, 0, -6.631667, 0, 1.5, 0.5, 0.5,
-3.06159, 1, -6.631667, 0, -0.5, 0.5, 0.5,
-3.06159, 1, -6.631667, 1, -0.5, 0.5, 0.5,
-3.06159, 1, -6.631667, 1, 1.5, 0.5, 0.5,
-3.06159, 1, -6.631667, 0, 1.5, 0.5, 0.5,
-3.06159, 2, -6.631667, 0, -0.5, 0.5, 0.5,
-3.06159, 2, -6.631667, 1, -0.5, 0.5, 0.5,
-3.06159, 2, -6.631667, 1, 1.5, 0.5, 0.5,
-3.06159, 2, -6.631667, 0, 1.5, 0.5, 0.5,
-3.06159, 3, -6.631667, 0, -0.5, 0.5, 0.5,
-3.06159, 3, -6.631667, 1, -0.5, 0.5, 0.5,
-3.06159, 3, -6.631667, 1, 1.5, 0.5, 0.5,
-3.06159, 3, -6.631667, 0, 1.5, 0.5, 0.5
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
-2.610808, -3.244837, -4,
-2.610808, -3.244837, 4,
-2.610808, -3.244837, -4,
-2.761069, -3.410635, -4,
-2.610808, -3.244837, -2,
-2.761069, -3.410635, -2,
-2.610808, -3.244837, 0,
-2.761069, -3.410635, 0,
-2.610808, -3.244837, 2,
-2.761069, -3.410635, 2,
-2.610808, -3.244837, 4,
-2.761069, -3.410635, 4
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
-3.06159, -3.742231, -4, 0, -0.5, 0.5, 0.5,
-3.06159, -3.742231, -4, 1, -0.5, 0.5, 0.5,
-3.06159, -3.742231, -4, 1, 1.5, 0.5, 0.5,
-3.06159, -3.742231, -4, 0, 1.5, 0.5, 0.5,
-3.06159, -3.742231, -2, 0, -0.5, 0.5, 0.5,
-3.06159, -3.742231, -2, 1, -0.5, 0.5, 0.5,
-3.06159, -3.742231, -2, 1, 1.5, 0.5, 0.5,
-3.06159, -3.742231, -2, 0, 1.5, 0.5, 0.5,
-3.06159, -3.742231, 0, 0, -0.5, 0.5, 0.5,
-3.06159, -3.742231, 0, 1, -0.5, 0.5, 0.5,
-3.06159, -3.742231, 0, 1, 1.5, 0.5, 0.5,
-3.06159, -3.742231, 0, 0, 1.5, 0.5, 0.5,
-3.06159, -3.742231, 2, 0, -0.5, 0.5, 0.5,
-3.06159, -3.742231, 2, 1, -0.5, 0.5, 0.5,
-3.06159, -3.742231, 2, 1, 1.5, 0.5, 0.5,
-3.06159, -3.742231, 2, 0, 1.5, 0.5, 0.5,
-3.06159, -3.742231, 4, 0, -0.5, 0.5, 0.5,
-3.06159, -3.742231, 4, 1, -0.5, 0.5, 0.5,
-3.06159, -3.742231, 4, 1, 1.5, 0.5, 0.5,
-3.06159, -3.742231, 4, 0, 1.5, 0.5, 0.5
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
-2.610808, -3.244837, -5.764791,
-2.610808, 3.387087, -5.764791,
-2.610808, -3.244837, 5.79355,
-2.610808, 3.387087, 5.79355,
-2.610808, -3.244837, -5.764791,
-2.610808, -3.244837, 5.79355,
-2.610808, 3.387087, -5.764791,
-2.610808, 3.387087, 5.79355,
-2.610808, -3.244837, -5.764791,
3.399613, -3.244837, -5.764791,
-2.610808, -3.244837, 5.79355,
3.399613, -3.244837, 5.79355,
-2.610808, 3.387087, -5.764791,
3.399613, 3.387087, -5.764791,
-2.610808, 3.387087, 5.79355,
3.399613, 3.387087, 5.79355,
3.399613, -3.244837, -5.764791,
3.399613, 3.387087, -5.764791,
3.399613, -3.244837, 5.79355,
3.399613, 3.387087, 5.79355,
3.399613, -3.244837, -5.764791,
3.399613, -3.244837, 5.79355,
3.399613, 3.387087, -5.764791,
3.399613, 3.387087, 5.79355
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
var radius = 7.806037;
var distance = 34.72994;
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
mvMatrix.translate( -0.3944024, -0.07112515, -0.01437926 );
mvMatrix.scale( 1.404234, 1.272638, 0.730212 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.72994);
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
cyfluthrin<-read.table("cyfluthrin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-cyfluthrin$V2
```

```
## Error in eval(expr, envir, enclos): object 'cyfluthrin' not found
```

```r
y<-cyfluthrin$V3
```

```
## Error in eval(expr, envir, enclos): object 'cyfluthrin' not found
```

```r
z<-cyfluthrin$V4
```

```
## Error in eval(expr, envir, enclos): object 'cyfluthrin' not found
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
-2.523278, -1.485623, -3.327747, 0, 0, 1, 1, 1,
-2.518096, 0.3414571, 0.118407, 1, 0, 0, 1, 1,
-2.515339, -1.060611, -2.121206, 1, 0, 0, 1, 1,
-2.504059, -0.4527002, -2.50777, 1, 0, 0, 1, 1,
-2.459079, -1.076933, -2.83118, 1, 0, 0, 1, 1,
-2.397855, 0.670788, 0.5492173, 1, 0, 0, 1, 1,
-2.361435, 0.1947822, -0.8260122, 0, 0, 0, 1, 1,
-2.323119, -0.6761823, -1.965066, 0, 0, 0, 1, 1,
-2.226866, -0.08930828, -1.094952, 0, 0, 0, 1, 1,
-2.214979, -0.05656267, -0.3006805, 0, 0, 0, 1, 1,
-2.200538, -2.215687, -3.602297, 0, 0, 0, 1, 1,
-2.160153, -1.151963, -1.654754, 0, 0, 0, 1, 1,
-2.10854, -0.03811728, -0.4793162, 0, 0, 0, 1, 1,
-2.057847, -0.8518591, -2.792862, 1, 1, 1, 1, 1,
-2.046143, -0.6777536, -2.079135, 1, 1, 1, 1, 1,
-2.042645, -0.3759582, -1.775288, 1, 1, 1, 1, 1,
-2.035724, -1.407578, -4.119635, 1, 1, 1, 1, 1,
-2.022874, -0.9186311, -2.776193, 1, 1, 1, 1, 1,
-2.005872, 0.4320295, -0.3727506, 1, 1, 1, 1, 1,
-2.004453, 1.308649, -0.4351936, 1, 1, 1, 1, 1,
-1.996349, -0.09315754, -1.408951, 1, 1, 1, 1, 1,
-1.961163, 0.2699776, -1.426945, 1, 1, 1, 1, 1,
-1.946088, 0.1884803, -1.548284, 1, 1, 1, 1, 1,
-1.945021, -0.4673913, -2.432526, 1, 1, 1, 1, 1,
-1.908607, 1.316077, 0.6121624, 1, 1, 1, 1, 1,
-1.887354, 0.3682859, -1.129582, 1, 1, 1, 1, 1,
-1.885073, -0.3609886, -1.292725, 1, 1, 1, 1, 1,
-1.879406, 0.03139057, -1.861189, 1, 1, 1, 1, 1,
-1.866013, 0.02791847, -2.015673, 0, 0, 1, 1, 1,
-1.844892, 1.050331, -0.9763381, 1, 0, 0, 1, 1,
-1.835044, -0.3591591, -2.916255, 1, 0, 0, 1, 1,
-1.823417, 1.137425, -2.044989, 1, 0, 0, 1, 1,
-1.804527, 2.173246, -2.042946, 1, 0, 0, 1, 1,
-1.801434, -1.122474, -3.816768, 1, 0, 0, 1, 1,
-1.781223, 0.723933, -1.651509, 0, 0, 0, 1, 1,
-1.776434, 0.4282636, -0.9767944, 0, 0, 0, 1, 1,
-1.774926, -1.133246, -2.841543, 0, 0, 0, 1, 1,
-1.750993, -0.26869, -0.9218072, 0, 0, 0, 1, 1,
-1.736261, -1.48804, -2.297504, 0, 0, 0, 1, 1,
-1.735563, 0.7253074, 0.1043094, 0, 0, 0, 1, 1,
-1.735259, 0.6684924, -0.248176, 0, 0, 0, 1, 1,
-1.707231, 0.8235448, -1.212558, 1, 1, 1, 1, 1,
-1.702204, 1.39369, -1.350576, 1, 1, 1, 1, 1,
-1.691152, -1.121854, -1.307011, 1, 1, 1, 1, 1,
-1.686553, -0.5448771, -1.124746, 1, 1, 1, 1, 1,
-1.68454, -1.265202, -1.412406, 1, 1, 1, 1, 1,
-1.681203, -0.3743092, -1.695709, 1, 1, 1, 1, 1,
-1.673329, 0.1747084, -0.002136391, 1, 1, 1, 1, 1,
-1.664064, -0.5174543, -2.752479, 1, 1, 1, 1, 1,
-1.621503, 0.5593746, -1.766663, 1, 1, 1, 1, 1,
-1.616728, -0.1462156, -2.47997, 1, 1, 1, 1, 1,
-1.6151, 0.5464632, -2.461476, 1, 1, 1, 1, 1,
-1.608907, -1.194932, -0.937417, 1, 1, 1, 1, 1,
-1.603106, 1.326662, 0.02386408, 1, 1, 1, 1, 1,
-1.595247, -1.855072, -1.32152, 1, 1, 1, 1, 1,
-1.591874, 0.5589006, -2.465783, 1, 1, 1, 1, 1,
-1.591015, 1.641706, -0.9114377, 0, 0, 1, 1, 1,
-1.589223, 0.6184537, -1.154792, 1, 0, 0, 1, 1,
-1.565929, -0.1618086, -0.1473807, 1, 0, 0, 1, 1,
-1.553679, 0.445443, -2.968853, 1, 0, 0, 1, 1,
-1.552042, 0.700292, -2.344321, 1, 0, 0, 1, 1,
-1.549147, 2.168438, -1.214252, 1, 0, 0, 1, 1,
-1.547746, -0.5409368, 0.5965924, 0, 0, 0, 1, 1,
-1.531039, 0.1273937, -1.51312, 0, 0, 0, 1, 1,
-1.529619, 0.6343288, -2.476865, 0, 0, 0, 1, 1,
-1.528507, -0.294348, -1.747981, 0, 0, 0, 1, 1,
-1.527576, 0.1618754, -0.0532187, 0, 0, 0, 1, 1,
-1.514489, -0.1260614, -1.506069, 0, 0, 0, 1, 1,
-1.5135, 1.03791, -0.7693166, 0, 0, 0, 1, 1,
-1.505243, 0.7777534, -0.8134463, 1, 1, 1, 1, 1,
-1.500897, 1.938585, 0.5508932, 1, 1, 1, 1, 1,
-1.499754, 0.7607183, -0.6942136, 1, 1, 1, 1, 1,
-1.49157, 1.230469, -1.328228, 1, 1, 1, 1, 1,
-1.47709, -0.6877795, -3.599077, 1, 1, 1, 1, 1,
-1.475627, 2.95515, -1.111662, 1, 1, 1, 1, 1,
-1.472769, -0.9832382, -3.274514, 1, 1, 1, 1, 1,
-1.460509, 0.4522739, -0.3717666, 1, 1, 1, 1, 1,
-1.458419, -0.4819857, -0.3922585, 1, 1, 1, 1, 1,
-1.444974, -0.6688151, -1.135839, 1, 1, 1, 1, 1,
-1.44322, -1.937804, -0.9458038, 1, 1, 1, 1, 1,
-1.431869, -0.3613927, -2.951724, 1, 1, 1, 1, 1,
-1.405877, 0.7462788, -1.280596, 1, 1, 1, 1, 1,
-1.3881, -0.0537434, -3.834547, 1, 1, 1, 1, 1,
-1.383179, 1.273916, 1.611626, 1, 1, 1, 1, 1,
-1.380908, -0.7114503, -1.244711, 0, 0, 1, 1, 1,
-1.378896, -0.3440652, -2.243388, 1, 0, 0, 1, 1,
-1.354838, -1.069096, -2.525075, 1, 0, 0, 1, 1,
-1.352689, 1.891539, -2.162135, 1, 0, 0, 1, 1,
-1.328203, 1.096894, -2.465024, 1, 0, 0, 1, 1,
-1.328126, -0.09414409, -1.707957, 1, 0, 0, 1, 1,
-1.322111, 0.09795795, -2.046937, 0, 0, 0, 1, 1,
-1.319699, 0.8466175, -2.151205, 0, 0, 0, 1, 1,
-1.319094, -1.592092, -0.6107033, 0, 0, 0, 1, 1,
-1.303299, -0.7533097, -3.23252, 0, 0, 0, 1, 1,
-1.300612, 1.879453, 0.858298, 0, 0, 0, 1, 1,
-1.300396, -0.2195688, -1.996968, 0, 0, 0, 1, 1,
-1.300206, -0.1342778, -2.229495, 0, 0, 0, 1, 1,
-1.299034, 0.7168575, -0.3432588, 1, 1, 1, 1, 1,
-1.298231, -1.07356, -3.008814, 1, 1, 1, 1, 1,
-1.294471, 1.232883, 0.1540257, 1, 1, 1, 1, 1,
-1.275793, 0.7933647, -0.7184495, 1, 1, 1, 1, 1,
-1.270157, -0.05584195, -1.876385, 1, 1, 1, 1, 1,
-1.268285, -0.3744971, -2.49715, 1, 1, 1, 1, 1,
-1.26201, -1.205821, -3.432653, 1, 1, 1, 1, 1,
-1.260936, 0.1483244, -1.885039, 1, 1, 1, 1, 1,
-1.25973, 1.681034, -0.2895729, 1, 1, 1, 1, 1,
-1.252421, -1.683885, -4.508772, 1, 1, 1, 1, 1,
-1.248914, 0.5166042, -0.713276, 1, 1, 1, 1, 1,
-1.247995, 1.218666, -0.8978664, 1, 1, 1, 1, 1,
-1.247368, -0.2821074, -2.121223, 1, 1, 1, 1, 1,
-1.244491, -0.7952951, -2.293289, 1, 1, 1, 1, 1,
-1.240522, 1.399166, -0.2962399, 1, 1, 1, 1, 1,
-1.235759, 0.1587533, -3.597698, 0, 0, 1, 1, 1,
-1.234251, -0.1147138, -2.599188, 1, 0, 0, 1, 1,
-1.223488, 0.03456376, -2.185431, 1, 0, 0, 1, 1,
-1.220869, 0.8192858, -0.6745387, 1, 0, 0, 1, 1,
-1.215455, 0.831969, -1.528202, 1, 0, 0, 1, 1,
-1.21367, 0.06626938, -1.793915, 1, 0, 0, 1, 1,
-1.206282, -0.1167215, -0.6325488, 0, 0, 0, 1, 1,
-1.206165, -0.1237322, 0.9956456, 0, 0, 0, 1, 1,
-1.188899, -0.8945266, -1.484884, 0, 0, 0, 1, 1,
-1.187333, -0.7707155, -1.670244, 0, 0, 0, 1, 1,
-1.184778, -0.4776814, -3.108364, 0, 0, 0, 1, 1,
-1.18074, -1.143344, -1.881127, 0, 0, 0, 1, 1,
-1.177035, 0.7471426, -1.137283, 0, 0, 0, 1, 1,
-1.165155, -3.148255, -2.734344, 1, 1, 1, 1, 1,
-1.154058, -0.103318, -2.116878, 1, 1, 1, 1, 1,
-1.133976, 0.05222336, -2.521677, 1, 1, 1, 1, 1,
-1.13362, -0.04622604, -2.223655, 1, 1, 1, 1, 1,
-1.123648, 0.326223, -0.5374573, 1, 1, 1, 1, 1,
-1.121156, -2.511395, -2.03046, 1, 1, 1, 1, 1,
-1.113832, 0.3700409, -1.349537, 1, 1, 1, 1, 1,
-1.110459, -1.314738, -1.874456, 1, 1, 1, 1, 1,
-1.097644, -1.184463, -1.722199, 1, 1, 1, 1, 1,
-1.091048, -0.1828719, -1.563048, 1, 1, 1, 1, 1,
-1.082877, 2.435813, 1.674044, 1, 1, 1, 1, 1,
-1.080955, -1.322386, -3.258538, 1, 1, 1, 1, 1,
-1.075978, 1.901026, -1.050735, 1, 1, 1, 1, 1,
-1.062736, 0.07410161, -2.266417, 1, 1, 1, 1, 1,
-1.056524, 1.399204, 0.7418769, 1, 1, 1, 1, 1,
-1.053424, 0.1021214, -2.372529, 0, 0, 1, 1, 1,
-1.052246, -0.4444333, -2.065015, 1, 0, 0, 1, 1,
-1.05084, -1.124071, -2.024133, 1, 0, 0, 1, 1,
-1.0482, -0.9072688, -1.243186, 1, 0, 0, 1, 1,
-1.042813, -0.2821142, -0.9131282, 1, 0, 0, 1, 1,
-1.041598, 0.447913, -1.777774, 1, 0, 0, 1, 1,
-1.037822, 2.043942, -0.1920123, 0, 0, 0, 1, 1,
-1.030244, 0.3018853, -1.095918, 0, 0, 0, 1, 1,
-1.030032, -0.404303, -1.802605, 0, 0, 0, 1, 1,
-1.026576, -0.3436705, -0.3594883, 0, 0, 0, 1, 1,
-1.013761, 0.7197971, -3.073577, 0, 0, 0, 1, 1,
-1.012703, 1.466741, -0.1932905, 0, 0, 0, 1, 1,
-1.000971, 0.142053, -1.190511, 0, 0, 0, 1, 1,
-0.9985443, -0.2756482, -0.5674958, 1, 1, 1, 1, 1,
-0.9960767, -0.7394899, -3.707841, 1, 1, 1, 1, 1,
-0.996041, -0.5640512, -2.13082, 1, 1, 1, 1, 1,
-0.9956289, -1.784126, -2.579769, 1, 1, 1, 1, 1,
-0.9943333, -2.498473, -3.10763, 1, 1, 1, 1, 1,
-0.9934928, -0.3731573, -2.278833, 1, 1, 1, 1, 1,
-0.9764149, -0.462623, -1.87573, 1, 1, 1, 1, 1,
-0.9718688, -0.4164067, -3.218603, 1, 1, 1, 1, 1,
-0.966549, 0.1240888, -1.812677, 1, 1, 1, 1, 1,
-0.9661399, -0.5410785, -3.626755, 1, 1, 1, 1, 1,
-0.958209, -1.045727, -2.721287, 1, 1, 1, 1, 1,
-0.9558184, 1.153731, -1.220256, 1, 1, 1, 1, 1,
-0.940417, 1.325086, -3.279744, 1, 1, 1, 1, 1,
-0.9358145, 2.301217, 0.6766487, 1, 1, 1, 1, 1,
-0.9328499, -0.2441281, -0.6365383, 1, 1, 1, 1, 1,
-0.9280465, 0.8455635, -1.740074, 0, 0, 1, 1, 1,
-0.9242498, 0.2960377, -1.34824, 1, 0, 0, 1, 1,
-0.9234991, 2.897217, -1.07145, 1, 0, 0, 1, 1,
-0.9229343, -0.7706844, -2.707013, 1, 0, 0, 1, 1,
-0.9226175, 0.1020385, -0.7485, 1, 0, 0, 1, 1,
-0.9181812, 1.37451, -1.038252, 1, 0, 0, 1, 1,
-0.9169928, 0.04935205, -1.606803, 0, 0, 0, 1, 1,
-0.9149006, -1.50956, -3.397079, 0, 0, 0, 1, 1,
-0.9123329, -0.2118891, -0.8409608, 0, 0, 0, 1, 1,
-0.9087846, 0.9188098, -1.32914, 0, 0, 0, 1, 1,
-0.9061063, -1.216008, -2.001754, 0, 0, 0, 1, 1,
-0.905724, -0.01984195, -3.218817, 0, 0, 0, 1, 1,
-0.9044793, 0.3880784, 1.435027, 0, 0, 0, 1, 1,
-0.8965635, -0.03235164, -0.727422, 1, 1, 1, 1, 1,
-0.8952197, 2.041081, -0.9977059, 1, 1, 1, 1, 1,
-0.895018, 0.7943503, -1.498752, 1, 1, 1, 1, 1,
-0.889127, -0.1326462, -1.398575, 1, 1, 1, 1, 1,
-0.887711, -0.03861193, -1.363785, 1, 1, 1, 1, 1,
-0.88623, -0.1760908, 0.7628013, 1, 1, 1, 1, 1,
-0.8823684, 0.7578825, 1.205519, 1, 1, 1, 1, 1,
-0.8796489, -0.8392352, -2.330829, 1, 1, 1, 1, 1,
-0.8789268, 0.5488917, -0.4070069, 1, 1, 1, 1, 1,
-0.8775079, -1.077157, -3.441407, 1, 1, 1, 1, 1,
-0.8719614, -0.311429, -3.022663, 1, 1, 1, 1, 1,
-0.8689562, -0.2542535, -2.948223, 1, 1, 1, 1, 1,
-0.865418, 0.4782849, -1.776008, 1, 1, 1, 1, 1,
-0.8649586, -0.7265728, -4.263928, 1, 1, 1, 1, 1,
-0.8588448, 0.1649699, -0.3211974, 1, 1, 1, 1, 1,
-0.8580561, 0.3241906, -1.189648, 0, 0, 1, 1, 1,
-0.8569641, 1.109296, 0.5339684, 1, 0, 0, 1, 1,
-0.8512408, -2.261648, -1.990606, 1, 0, 0, 1, 1,
-0.8475906, 0.6029106, 0.3889745, 1, 0, 0, 1, 1,
-0.8441386, -0.00685459, -3.044883, 1, 0, 0, 1, 1,
-0.8432855, -1.916145, -2.905478, 1, 0, 0, 1, 1,
-0.8427091, -0.9709979, -1.434314, 0, 0, 0, 1, 1,
-0.8402429, 0.6751104, -0.8422861, 0, 0, 0, 1, 1,
-0.8392296, 1.217577, 1.418701, 0, 0, 0, 1, 1,
-0.8381923, -0.5346001, -2.06214, 0, 0, 0, 1, 1,
-0.8314233, -0.2756266, -2.24548, 0, 0, 0, 1, 1,
-0.8303662, -0.206267, -2.517212, 0, 0, 0, 1, 1,
-0.8255208, 0.2217721, -0.4904703, 0, 0, 0, 1, 1,
-0.8241364, 0.1605384, -2.388372, 1, 1, 1, 1, 1,
-0.8222783, 0.4408204, -1.167744, 1, 1, 1, 1, 1,
-0.8201493, 0.1474277, -1.484097, 1, 1, 1, 1, 1,
-0.8165515, -1.757329, -3.998089, 1, 1, 1, 1, 1,
-0.8159899, -0.3268986, -1.727401, 1, 1, 1, 1, 1,
-0.8159731, 2.126569, -1.398176, 1, 1, 1, 1, 1,
-0.8143291, 0.6371954, -0.3099481, 1, 1, 1, 1, 1,
-0.8112038, 0.1291896, -1.089897, 1, 1, 1, 1, 1,
-0.8111578, 1.283677, 0.03909644, 1, 1, 1, 1, 1,
-0.8107678, -0.6260816, -2.187691, 1, 1, 1, 1, 1,
-0.8107674, -1.800635, -2.820644, 1, 1, 1, 1, 1,
-0.8079292, -0.1740429, -3.373137, 1, 1, 1, 1, 1,
-0.8061758, -0.1558846, 0.01375108, 1, 1, 1, 1, 1,
-0.8057376, 0.1962223, -0.9790189, 1, 1, 1, 1, 1,
-0.8033442, -0.01342076, -0.745219, 1, 1, 1, 1, 1,
-0.8001306, -0.197582, 0.306418, 0, 0, 1, 1, 1,
-0.7982426, -1.153614, -4.254072, 1, 0, 0, 1, 1,
-0.7955739, 0.3710442, 0.7583472, 1, 0, 0, 1, 1,
-0.7936708, 0.6624507, -0.5910013, 1, 0, 0, 1, 1,
-0.7929886, 0.810908, -0.5043007, 1, 0, 0, 1, 1,
-0.788955, 0.742555, 0.02827208, 1, 0, 0, 1, 1,
-0.7882526, -1.428078, -2.891702, 0, 0, 0, 1, 1,
-0.7825171, -0.4910201, -2.689907, 0, 0, 0, 1, 1,
-0.7824162, -1.143716, -1.015367, 0, 0, 0, 1, 1,
-0.7821046, -0.01776101, -2.128623, 0, 0, 0, 1, 1,
-0.776388, -1.262211, -2.311193, 0, 0, 0, 1, 1,
-0.7763034, -1.441257, -2.962878, 0, 0, 0, 1, 1,
-0.7683381, 1.234567, -1.018917, 0, 0, 0, 1, 1,
-0.7625967, -0.7760894, -1.896912, 1, 1, 1, 1, 1,
-0.7605861, -3.032848, -1.351227, 1, 1, 1, 1, 1,
-0.7578625, -0.3194888, -1.911797, 1, 1, 1, 1, 1,
-0.7562493, 0.8668981, -1.033907, 1, 1, 1, 1, 1,
-0.7430003, 1.00904, -0.9476006, 1, 1, 1, 1, 1,
-0.7338567, -0.7186403, -1.49755, 1, 1, 1, 1, 1,
-0.7267333, -0.3188873, -3.343124, 1, 1, 1, 1, 1,
-0.7243214, -0.0004447194, -0.1065573, 1, 1, 1, 1, 1,
-0.7174218, 0.02976685, -0.9697827, 1, 1, 1, 1, 1,
-0.7105449, -0.3744461, -1.484803, 1, 1, 1, 1, 1,
-0.7096864, -1.30131, -1.735304, 1, 1, 1, 1, 1,
-0.7095545, 0.4975859, -0.008286657, 1, 1, 1, 1, 1,
-0.7075565, 0.1381924, -2.138402, 1, 1, 1, 1, 1,
-0.7069194, -0.3768866, -1.586236, 1, 1, 1, 1, 1,
-0.7065554, 0.3596092, -0.2092912, 1, 1, 1, 1, 1,
-0.7057176, 1.005651, -1.519183, 0, 0, 1, 1, 1,
-0.7039104, -0.02434492, -2.85426, 1, 0, 0, 1, 1,
-0.7028609, -0.6884313, -1.538421, 1, 0, 0, 1, 1,
-0.7002137, -1.715391, -1.425115, 1, 0, 0, 1, 1,
-0.6977522, -1.195912, -1.927297, 1, 0, 0, 1, 1,
-0.6958287, 0.8600307, -1.280293, 1, 0, 0, 1, 1,
-0.695485, -0.7805951, -2.272836, 0, 0, 0, 1, 1,
-0.6830035, 0.1960638, 0.3577638, 0, 0, 0, 1, 1,
-0.6768006, -0.2251747, -2.892043, 0, 0, 0, 1, 1,
-0.6735944, -0.5765527, -1.598324, 0, 0, 0, 1, 1,
-0.6625549, 0.3568239, -2.243382, 0, 0, 0, 1, 1,
-0.6614296, 0.1161898, -2.240587, 0, 0, 0, 1, 1,
-0.6612588, 1.821912, 0.3666675, 0, 0, 0, 1, 1,
-0.6568373, -0.01734282, -2.088677, 1, 1, 1, 1, 1,
-0.6568052, 1.2289, -0.0587511, 1, 1, 1, 1, 1,
-0.6554333, -0.6051023, -2.17866, 1, 1, 1, 1, 1,
-0.6535776, -1.235226, -0.9427986, 1, 1, 1, 1, 1,
-0.6500754, -1.529318, -2.901905, 1, 1, 1, 1, 1,
-0.6497343, -0.9061038, -2.526471, 1, 1, 1, 1, 1,
-0.6458367, 0.8195022, -0.04601773, 1, 1, 1, 1, 1,
-0.6360359, -0.6397046, -0.5119287, 1, 1, 1, 1, 1,
-0.6337873, -0.5256374, -0.4716596, 1, 1, 1, 1, 1,
-0.6322095, -2.390226, -3.029282, 1, 1, 1, 1, 1,
-0.6308399, 0.375075, -0.1253662, 1, 1, 1, 1, 1,
-0.6302935, 1.448901, -1.400018, 1, 1, 1, 1, 1,
-0.6283887, 0.2987124, -0.7326304, 1, 1, 1, 1, 1,
-0.6260661, -0.2304654, -3.994531, 1, 1, 1, 1, 1,
-0.6253341, 1.603646, -0.05952521, 1, 1, 1, 1, 1,
-0.6122144, -0.8117539, -3.69374, 0, 0, 1, 1, 1,
-0.5986354, -0.6088911, -3.403501, 1, 0, 0, 1, 1,
-0.5985492, 1.308809, 0.4558983, 1, 0, 0, 1, 1,
-0.5966597, 0.07565725, -1.329197, 1, 0, 0, 1, 1,
-0.5956171, -0.06256693, -2.535206, 1, 0, 0, 1, 1,
-0.5955649, 0.4628868, -1.780713, 1, 0, 0, 1, 1,
-0.5897259, -0.3368896, -4.439364, 0, 0, 0, 1, 1,
-0.5831581, -0.009429856, -1.637385, 0, 0, 0, 1, 1,
-0.5773215, 0.1831401, -2.129895, 0, 0, 0, 1, 1,
-0.5749907, 1.127012, -0.9184078, 0, 0, 0, 1, 1,
-0.5735319, 2.032119, -1.638424, 0, 0, 0, 1, 1,
-0.5697253, 0.2912173, -0.955478, 0, 0, 0, 1, 1,
-0.5651435, -0.3557911, -1.172601, 0, 0, 0, 1, 1,
-0.5639331, 0.2246971, -1.625596, 1, 1, 1, 1, 1,
-0.5634317, -0.1290451, -0.5423218, 1, 1, 1, 1, 1,
-0.5620241, 0.9310842, -0.2585893, 1, 1, 1, 1, 1,
-0.5615454, 0.3927059, -0.1379414, 1, 1, 1, 1, 1,
-0.560015, -0.4131036, -3.669423, 1, 1, 1, 1, 1,
-0.5591325, 0.1934353, -0.6291837, 1, 1, 1, 1, 1,
-0.5556929, -0.1832526, -2.452463, 1, 1, 1, 1, 1,
-0.5443661, 0.07205555, -3.285916, 1, 1, 1, 1, 1,
-0.5441261, 1.448751, -0.6723875, 1, 1, 1, 1, 1,
-0.5416753, 1.132429, 1.316448, 1, 1, 1, 1, 1,
-0.5395526, 0.09147138, -0.9053993, 1, 1, 1, 1, 1,
-0.530142, 1.092278, -0.7393624, 1, 1, 1, 1, 1,
-0.5277185, 1.098891, 0.02509424, 1, 1, 1, 1, 1,
-0.527229, -0.305882, -1.725252, 1, 1, 1, 1, 1,
-0.5255339, 0.01866403, -2.312967, 1, 1, 1, 1, 1,
-0.5247492, 1.315057, 0.008171377, 0, 0, 1, 1, 1,
-0.5238252, 1.365905, 0.2938112, 1, 0, 0, 1, 1,
-0.5224217, -1.150975, -3.787995, 1, 0, 0, 1, 1,
-0.5206069, 0.298042, -2.400457, 1, 0, 0, 1, 1,
-0.5146427, -0.3086465, -3.022247, 1, 0, 0, 1, 1,
-0.5139545, -0.7044774, -3.810926, 1, 0, 0, 1, 1,
-0.5048198, -0.2328093, -2.321184, 0, 0, 0, 1, 1,
-0.5042192, 1.221995, -0.977394, 0, 0, 0, 1, 1,
-0.5022043, -0.1109905, -0.5922253, 0, 0, 0, 1, 1,
-0.500011, -1.562654, -2.138868, 0, 0, 0, 1, 1,
-0.498016, -0.201823, -1.912046, 0, 0, 0, 1, 1,
-0.4951822, -0.6627796, -1.198287, 0, 0, 0, 1, 1,
-0.4938416, 0.2180223, -1.302306, 0, 0, 0, 1, 1,
-0.4916837, 0.3816748, -1.109529, 1, 1, 1, 1, 1,
-0.4881104, 0.6851538, -0.863313, 1, 1, 1, 1, 1,
-0.4866171, 1.129538, -1.015216, 1, 1, 1, 1, 1,
-0.4840534, 0.02313037, -1.985038, 1, 1, 1, 1, 1,
-0.4828387, -0.3759951, -2.906345, 1, 1, 1, 1, 1,
-0.4805246, 0.5640641, -1.507089, 1, 1, 1, 1, 1,
-0.479657, -0.4973528, -2.442565, 1, 1, 1, 1, 1,
-0.4778214, 0.5357738, -0.6437403, 1, 1, 1, 1, 1,
-0.4769487, -0.7305502, -1.720013, 1, 1, 1, 1, 1,
-0.4716428, -0.6283542, -2.96579, 1, 1, 1, 1, 1,
-0.4715543, -0.6333228, -3.074895, 1, 1, 1, 1, 1,
-0.4644542, -0.1620409, -2.123746, 1, 1, 1, 1, 1,
-0.4633518, 0.1622932, -1.688482, 1, 1, 1, 1, 1,
-0.4626325, -1.045476, -3.380804, 1, 1, 1, 1, 1,
-0.4620002, 0.5193183, -1.635475, 1, 1, 1, 1, 1,
-0.4612309, 0.1380667, -1.573481, 0, 0, 1, 1, 1,
-0.4606568, 0.1335077, -0.8977002, 1, 0, 0, 1, 1,
-0.4593258, -0.105947, -1.332927, 1, 0, 0, 1, 1,
-0.4528404, -0.945346, -2.527151, 1, 0, 0, 1, 1,
-0.4480821, 2.043365, 0.3243567, 1, 0, 0, 1, 1,
-0.447892, -0.7876606, -2.255923, 1, 0, 0, 1, 1,
-0.4464645, 0.2745632, -0.6462107, 0, 0, 0, 1, 1,
-0.4460587, -0.2888863, -1.638565, 0, 0, 0, 1, 1,
-0.4402457, 0.1044975, -1.797822, 0, 0, 0, 1, 1,
-0.4342422, 0.8265264, -2.747417, 0, 0, 0, 1, 1,
-0.4308268, -0.03520651, -1.463534, 0, 0, 0, 1, 1,
-0.4258877, -0.1544498, -1.74789, 0, 0, 0, 1, 1,
-0.4245099, 0.933376, -0.4945884, 0, 0, 0, 1, 1,
-0.4222268, 2.075641, 0.2612722, 1, 1, 1, 1, 1,
-0.4221447, 0.3684079, 0.256606, 1, 1, 1, 1, 1,
-0.4183475, -1.169406, -1.153141, 1, 1, 1, 1, 1,
-0.4163369, 1.38306, -0.177071, 1, 1, 1, 1, 1,
-0.4145649, 0.2969187, -1.904214, 1, 1, 1, 1, 1,
-0.4121186, 0.01327362, -1.693915, 1, 1, 1, 1, 1,
-0.4028809, 0.2541762, -0.2543569, 1, 1, 1, 1, 1,
-0.4003365, 1.62597, -0.7583903, 1, 1, 1, 1, 1,
-0.398057, -1.431219, -1.852395, 1, 1, 1, 1, 1,
-0.3957603, 0.6190411, -0.9221335, 1, 1, 1, 1, 1,
-0.3908421, -0.6943999, -2.746439, 1, 1, 1, 1, 1,
-0.3900725, 0.6055221, 0.717207, 1, 1, 1, 1, 1,
-0.3896261, -0.8144515, -2.924137, 1, 1, 1, 1, 1,
-0.3878921, -0.3605408, -3.929773, 1, 1, 1, 1, 1,
-0.380775, 0.5563732, 0.006264231, 1, 1, 1, 1, 1,
-0.3798878, -1.015937, -3.336328, 0, 0, 1, 1, 1,
-0.378286, -0.4493639, -2.138541, 1, 0, 0, 1, 1,
-0.3767221, 0.1732035, -0.7885754, 1, 0, 0, 1, 1,
-0.3740917, -1.106808, -1.833633, 1, 0, 0, 1, 1,
-0.3720174, 0.06431142, -2.386488, 1, 0, 0, 1, 1,
-0.3714017, 0.7022677, -1.088476, 1, 0, 0, 1, 1,
-0.3691672, -0.4551719, -2.590528, 0, 0, 0, 1, 1,
-0.3688518, -1.6034, -4.154287, 0, 0, 0, 1, 1,
-0.3682266, 1.103233, -0.3831559, 0, 0, 0, 1, 1,
-0.3677535, -0.5383044, -2.877662, 0, 0, 0, 1, 1,
-0.3652615, 0.4178181, -1.153837, 0, 0, 0, 1, 1,
-0.3635276, 1.77352, 0.2642704, 0, 0, 0, 1, 1,
-0.3617074, 1.455598, 0.2029866, 0, 0, 0, 1, 1,
-0.3558797, -0.9676964, -3.003469, 1, 1, 1, 1, 1,
-0.3539512, -0.131938, -0.5544861, 1, 1, 1, 1, 1,
-0.3488964, -0.4425284, -0.7550187, 1, 1, 1, 1, 1,
-0.3394882, -0.3894846, -2.591615, 1, 1, 1, 1, 1,
-0.3382924, -0.127089, -3.909103, 1, 1, 1, 1, 1,
-0.338062, -0.8837481, -2.692084, 1, 1, 1, 1, 1,
-0.3358586, 1.205405, -1.416852, 1, 1, 1, 1, 1,
-0.3356696, 1.792979, -1.454814, 1, 1, 1, 1, 1,
-0.3329274, -0.2168139, -2.7966, 1, 1, 1, 1, 1,
-0.3302212, 0.1054169, -2.232075, 1, 1, 1, 1, 1,
-0.3300327, 0.4097265, -0.5428586, 1, 1, 1, 1, 1,
-0.3233646, 0.4495804, -1.569209, 1, 1, 1, 1, 1,
-0.3227333, -1.439059, -4.415241, 1, 1, 1, 1, 1,
-0.3204532, 0.05230515, -1.389871, 1, 1, 1, 1, 1,
-0.3193583, -1.859443, -2.076651, 1, 1, 1, 1, 1,
-0.3153381, -2.837222, -2.398198, 0, 0, 1, 1, 1,
-0.3144655, 0.2271108, 0.0989531, 1, 0, 0, 1, 1,
-0.306045, -0.9331118, -3.237004, 1, 0, 0, 1, 1,
-0.3059523, 0.9416203, 0.4375226, 1, 0, 0, 1, 1,
-0.305952, -0.201205, -3.176898, 1, 0, 0, 1, 1,
-0.3041879, 0.1740452, -1.326003, 1, 0, 0, 1, 1,
-0.299537, -2.306415, -2.967206, 0, 0, 0, 1, 1,
-0.2928683, 0.1530758, -0.7109591, 0, 0, 0, 1, 1,
-0.2928034, -0.8608384, -5.596466, 0, 0, 0, 1, 1,
-0.2889296, 0.7472349, -1.042577, 0, 0, 0, 1, 1,
-0.2872153, 0.9036484, -0.2719205, 0, 0, 0, 1, 1,
-0.2866947, 2.243576, -1.504313, 0, 0, 0, 1, 1,
-0.2834313, -0.2596088, -0.4460944, 0, 0, 0, 1, 1,
-0.2834227, -2.76281, -2.677545, 1, 1, 1, 1, 1,
-0.2805229, -0.1325399, -0.4507441, 1, 1, 1, 1, 1,
-0.2796289, 0.5597177, -1.1218, 1, 1, 1, 1, 1,
-0.2795233, -0.6720363, -3.837999, 1, 1, 1, 1, 1,
-0.2757727, -1.017305, -2.560818, 1, 1, 1, 1, 1,
-0.2673331, 0.4415615, -0.1285295, 1, 1, 1, 1, 1,
-0.2665638, -0.01549746, -0.8423228, 1, 1, 1, 1, 1,
-0.2659565, -0.6716762, -2.271333, 1, 1, 1, 1, 1,
-0.2585859, -1.293376, -4.226723, 1, 1, 1, 1, 1,
-0.2562511, 0.5560466, 1.566178, 1, 1, 1, 1, 1,
-0.2529873, -0.1482995, -1.223963, 1, 1, 1, 1, 1,
-0.2505725, -1.379867, -2.35104, 1, 1, 1, 1, 1,
-0.2502018, -0.7806313, -0.07146366, 1, 1, 1, 1, 1,
-0.2488133, -0.2084391, -2.92222, 1, 1, 1, 1, 1,
-0.2378445, 1.092375, 0.01132692, 1, 1, 1, 1, 1,
-0.2329209, -0.1237511, -1.811553, 0, 0, 1, 1, 1,
-0.2302592, -0.2208466, -1.079964, 1, 0, 0, 1, 1,
-0.2299942, 0.7257581, -0.7912825, 1, 0, 0, 1, 1,
-0.2257406, 1.657658, -0.06477091, 1, 0, 0, 1, 1,
-0.2239857, 0.6702411, 1.290629, 1, 0, 0, 1, 1,
-0.2231458, -0.2046015, -0.8306192, 1, 0, 0, 1, 1,
-0.2223088, 0.3763135, 0.7456741, 0, 0, 0, 1, 1,
-0.2222825, -1.099804, -2.948028, 0, 0, 0, 1, 1,
-0.2216781, 0.3284988, -0.6193155, 0, 0, 0, 1, 1,
-0.2189751, 0.5978158, -1.353088, 0, 0, 0, 1, 1,
-0.2178136, 1.557635, 1.479317, 0, 0, 0, 1, 1,
-0.2140047, 0.7435034, -1.286194, 0, 0, 0, 1, 1,
-0.2131006, 0.1505038, -2.911726, 0, 0, 0, 1, 1,
-0.2114163, -0.5232649, -4.216194, 1, 1, 1, 1, 1,
-0.2112823, -0.4861409, -3.80033, 1, 1, 1, 1, 1,
-0.2049983, 0.4208033, -1.928004, 1, 1, 1, 1, 1,
-0.2044027, -1.448115, -2.578457, 1, 1, 1, 1, 1,
-0.2005384, -0.4205921, -2.376783, 1, 1, 1, 1, 1,
-0.1997584, 1.817844, 1.400497, 1, 1, 1, 1, 1,
-0.1977607, 0.002548013, -1.069441, 1, 1, 1, 1, 1,
-0.1947052, -1.212153, -3.254799, 1, 1, 1, 1, 1,
-0.1880664, 0.2768896, -1.209156, 1, 1, 1, 1, 1,
-0.1808672, -0.6350119, -3.207112, 1, 1, 1, 1, 1,
-0.1802184, -0.9370542, -3.210004, 1, 1, 1, 1, 1,
-0.1759931, 1.298945, -0.1859986, 1, 1, 1, 1, 1,
-0.1690971, 1.088406, -0.814842, 1, 1, 1, 1, 1,
-0.1626554, -1.277434, -3.289801, 1, 1, 1, 1, 1,
-0.1606813, 0.9498529, -1.522269, 1, 1, 1, 1, 1,
-0.1565609, -0.7891533, -3.878783, 0, 0, 1, 1, 1,
-0.1543446, -0.2664537, -1.513825, 1, 0, 0, 1, 1,
-0.149556, -1.458221, -2.215048, 1, 0, 0, 1, 1,
-0.1463692, -0.5524429, -4.797095, 1, 0, 0, 1, 1,
-0.1449746, 1.7689, 0.1669305, 1, 0, 0, 1, 1,
-0.1441385, 0.6297789, -2.012673, 1, 0, 0, 1, 1,
-0.1334176, -0.9316023, -2.452138, 0, 0, 0, 1, 1,
-0.1333649, -0.3079097, -3.285171, 0, 0, 0, 1, 1,
-0.133144, 0.7830936, 0.1407281, 0, 0, 0, 1, 1,
-0.1327369, -1.188395, -3.191666, 0, 0, 0, 1, 1,
-0.126267, -0.1007555, -1.237049, 0, 0, 0, 1, 1,
-0.1229481, 1.760139, 0.08197119, 0, 0, 0, 1, 1,
-0.1207301, 1.682098, 1.139004, 0, 0, 0, 1, 1,
-0.1102683, -0.5038195, -3.230821, 1, 1, 1, 1, 1,
-0.1092114, -2.08126, -3.78437, 1, 1, 1, 1, 1,
-0.1089305, 0.5577791, 0.3266551, 1, 1, 1, 1, 1,
-0.1074014, -1.165923, -2.606971, 1, 1, 1, 1, 1,
-0.1064769, 0.3534255, 1.394302, 1, 1, 1, 1, 1,
-0.1056203, 0.0590526, -0.7366319, 1, 1, 1, 1, 1,
-0.099278, 0.272947, -1.62248, 1, 1, 1, 1, 1,
-0.09761424, 0.2138793, 0.7869633, 1, 1, 1, 1, 1,
-0.09327903, -0.03830856, -2.799228, 1, 1, 1, 1, 1,
-0.08730832, 0.4937305, 0.009041237, 1, 1, 1, 1, 1,
-0.0860287, 1.562603, 0.3155777, 1, 1, 1, 1, 1,
-0.07991182, 0.419553, -0.4920054, 1, 1, 1, 1, 1,
-0.07988372, 0.8309759, 0.3009329, 1, 1, 1, 1, 1,
-0.07786798, 0.0401982, -1.444329, 1, 1, 1, 1, 1,
-0.07758185, -0.8797659, -2.923916, 1, 1, 1, 1, 1,
-0.0751134, -0.8237145, -3.853568, 0, 0, 1, 1, 1,
-0.07486524, 1.29219, -0.2847111, 1, 0, 0, 1, 1,
-0.07456484, 1.582762, -0.3100451, 1, 0, 0, 1, 1,
-0.07429271, -0.6728437, -0.1682411, 1, 0, 0, 1, 1,
-0.07306498, -1.833396, -4.65963, 1, 0, 0, 1, 1,
-0.07167736, 0.4563651, 0.5174544, 1, 0, 0, 1, 1,
-0.0713552, 1.076295, 0.7409338, 0, 0, 0, 1, 1,
-0.07060967, -0.8785847, -2.052529, 0, 0, 0, 1, 1,
-0.06681548, 0.1924765, -1.925051, 0, 0, 0, 1, 1,
-0.06478995, -0.1197342, -5.031841, 0, 0, 0, 1, 1,
-0.0630773, 0.2270155, -1.64999, 0, 0, 0, 1, 1,
-0.06207257, 0.5708078, -0.2778386, 0, 0, 0, 1, 1,
-0.06186269, 0.2115813, -0.4795664, 0, 0, 0, 1, 1,
-0.05394258, 0.2865129, -0.6308139, 1, 1, 1, 1, 1,
-0.05321569, 0.4878608, 0.2171011, 1, 1, 1, 1, 1,
-0.04878039, 0.1405282, -0.3421978, 1, 1, 1, 1, 1,
-0.04621181, -0.331464, -1.983612, 1, 1, 1, 1, 1,
-0.04275943, -0.1537779, -2.680549, 1, 1, 1, 1, 1,
-0.03890197, 0.3838623, 1.500751, 1, 1, 1, 1, 1,
-0.03777483, -1.368567, -4.824862, 1, 1, 1, 1, 1,
-0.03776991, -0.4630407, -2.007133, 1, 1, 1, 1, 1,
-0.03764588, 0.126775, 2.584003, 1, 1, 1, 1, 1,
-0.03674452, 0.0617988, -0.8550985, 1, 1, 1, 1, 1,
-0.03672558, -1.539517, -3.865131, 1, 1, 1, 1, 1,
-0.03413628, -0.8740608, -2.716051, 1, 1, 1, 1, 1,
-0.03384148, 0.6664235, 1.052377, 1, 1, 1, 1, 1,
-0.03186699, 3.290506, 1.004605, 1, 1, 1, 1, 1,
-0.03167525, 0.7255205, 1.777249, 1, 1, 1, 1, 1,
-0.02925352, -0.7550132, -1.836952, 0, 0, 1, 1, 1,
-0.02535146, -0.1164387, -3.035905, 1, 0, 0, 1, 1,
-0.0245635, -0.2224687, -3.549997, 1, 0, 0, 1, 1,
-0.02401984, -0.667006, -2.398251, 1, 0, 0, 1, 1,
-0.01261558, -0.2865412, -2.629441, 1, 0, 0, 1, 1,
-0.0123264, -0.7354262, -4.580148, 1, 0, 0, 1, 1,
-0.009785356, -1.586465, -2.498502, 0, 0, 0, 1, 1,
-0.008359891, 0.51193, 0.6550962, 0, 0, 0, 1, 1,
-0.007327288, 0.04387099, -0.380924, 0, 0, 0, 1, 1,
-0.003463837, -0.4876945, -3.647012, 0, 0, 0, 1, 1,
-0.002791056, -1.02103, -4.386099, 0, 0, 0, 1, 1,
-0.0006934531, 0.7152739, -0.9891549, 0, 0, 0, 1, 1,
0.007235392, -0.3687452, 1.906373, 0, 0, 0, 1, 1,
0.009661605, -1.242683, 2.252778, 1, 1, 1, 1, 1,
0.01492727, 1.037189, 0.5909808, 1, 1, 1, 1, 1,
0.01533119, 0.1475239, -0.4550362, 1, 1, 1, 1, 1,
0.01610761, 1.216783, 0.3400389, 1, 1, 1, 1, 1,
0.0170032, -0.03923658, 2.12506, 1, 1, 1, 1, 1,
0.0228949, -1.308951, 2.230072, 1, 1, 1, 1, 1,
0.02868475, -0.9304096, 3.940193, 1, 1, 1, 1, 1,
0.02892341, 1.248157, 1.161643, 1, 1, 1, 1, 1,
0.02977667, -0.1486794, 1.935138, 1, 1, 1, 1, 1,
0.03030621, 0.8500662, 0.04395317, 1, 1, 1, 1, 1,
0.03075531, 0.6926245, -0.9649352, 1, 1, 1, 1, 1,
0.03123047, 2.902183, 1.06882, 1, 1, 1, 1, 1,
0.03267023, 0.5451869, -0.2495776, 1, 1, 1, 1, 1,
0.03412678, 0.8060141, 1.074757, 1, 1, 1, 1, 1,
0.03415797, -0.2239054, 5.625225, 1, 1, 1, 1, 1,
0.03525204, -2.263303, 3.294873, 0, 0, 1, 1, 1,
0.03591389, 1.209012, -0.6559309, 1, 0, 0, 1, 1,
0.03734113, -0.7366589, 2.971777, 1, 0, 0, 1, 1,
0.03908815, 0.04409192, 1.308018, 1, 0, 0, 1, 1,
0.0420262, -0.4537099, 2.324864, 1, 0, 0, 1, 1,
0.05173991, -0.2817797, 3.362867, 1, 0, 0, 1, 1,
0.05319757, -1.745825, 3.170484, 0, 0, 0, 1, 1,
0.05350383, -0.734575, 2.65337, 0, 0, 0, 1, 1,
0.05357762, 1.579879, -0.2695022, 0, 0, 0, 1, 1,
0.05838721, -1.001677, 3.929202, 0, 0, 0, 1, 1,
0.06664676, -1.494015, 4.152463, 0, 0, 0, 1, 1,
0.0743427, -0.1843076, 2.454285, 0, 0, 0, 1, 1,
0.08254932, 0.4534703, 1.430948, 0, 0, 0, 1, 1,
0.08460508, -0.6950262, 3.057006, 1, 1, 1, 1, 1,
0.08560701, 1.09352, 0.3218833, 1, 1, 1, 1, 1,
0.09632932, 0.8179994, -0.5034232, 1, 1, 1, 1, 1,
0.09759712, 1.962833, 0.5456489, 1, 1, 1, 1, 1,
0.09797917, 0.9788771, -1.112128, 1, 1, 1, 1, 1,
0.1016691, -0.06860603, 1.096563, 1, 1, 1, 1, 1,
0.1020669, -0.5567378, 3.928941, 1, 1, 1, 1, 1,
0.1028932, -0.6032014, 4.108589, 1, 1, 1, 1, 1,
0.1066581, 1.1541, 1.902186, 1, 1, 1, 1, 1,
0.1096064, 0.4284263, 1.391872, 1, 1, 1, 1, 1,
0.1132264, -2.32654, 3.247432, 1, 1, 1, 1, 1,
0.1135961, 1.028503, 0.3434678, 1, 1, 1, 1, 1,
0.1190693, -0.9068123, 3.337917, 1, 1, 1, 1, 1,
0.1304414, 0.2549051, 0.2220169, 1, 1, 1, 1, 1,
0.1319626, 0.8044267, 1.096065, 1, 1, 1, 1, 1,
0.1343275, 0.5953951, -0.5531077, 0, 0, 1, 1, 1,
0.1347298, 1.339635, 1.027666, 1, 0, 0, 1, 1,
0.1400027, 0.671845, 0.633383, 1, 0, 0, 1, 1,
0.1423951, -1.594058, 2.91042, 1, 0, 0, 1, 1,
0.145703, -0.4312836, 2.022935, 1, 0, 0, 1, 1,
0.1469032, -0.3906958, 1.616668, 1, 0, 0, 1, 1,
0.1483878, -1.964647, 4.032447, 0, 0, 0, 1, 1,
0.1498316, 0.1383497, -1.5136, 0, 0, 0, 1, 1,
0.1520457, 0.593662, -0.8665818, 0, 0, 0, 1, 1,
0.1531228, -0.03450838, 0.8739407, 0, 0, 0, 1, 1,
0.153538, 0.4411262, 1.248238, 0, 0, 0, 1, 1,
0.1614047, 1.350689, -2.23815, 0, 0, 0, 1, 1,
0.1622766, -0.3429756, 2.884763, 0, 0, 0, 1, 1,
0.1628907, 0.7824985, 1.62446, 1, 1, 1, 1, 1,
0.1640525, -0.2442245, 4.086815, 1, 1, 1, 1, 1,
0.1722153, 0.2755462, 0.7403608, 1, 1, 1, 1, 1,
0.1764147, -0.371474, 2.931271, 1, 1, 1, 1, 1,
0.1796599, -1.095631, 2.528196, 1, 1, 1, 1, 1,
0.1821979, 1.785267, 1.763444, 1, 1, 1, 1, 1,
0.1857035, -0.2813338, 3.207868, 1, 1, 1, 1, 1,
0.1870494, -1.746095, 3.55078, 1, 1, 1, 1, 1,
0.1884822, 0.8874529, 0.0600375, 1, 1, 1, 1, 1,
0.1892951, -1.893489, 3.939837, 1, 1, 1, 1, 1,
0.1900247, -0.5732839, 1.791022, 1, 1, 1, 1, 1,
0.1994281, 0.5219566, 0.4448018, 1, 1, 1, 1, 1,
0.2043281, 1.173711, 0.2101576, 1, 1, 1, 1, 1,
0.2049683, 0.3895089, 0.4562336, 1, 1, 1, 1, 1,
0.2089769, -1.087376, 2.887988, 1, 1, 1, 1, 1,
0.210926, -0.1274856, 1.779357, 0, 0, 1, 1, 1,
0.2128635, 0.3172142, 1.21202, 1, 0, 0, 1, 1,
0.2177798, 0.8615382, 0.9257203, 1, 0, 0, 1, 1,
0.2178002, -0.2548425, 1.383406, 1, 0, 0, 1, 1,
0.2198001, 0.234998, 0.3293847, 1, 0, 0, 1, 1,
0.2201743, -0.1846033, 2.155416, 1, 0, 0, 1, 1,
0.2218708, 0.3395463, 2.390777, 0, 0, 0, 1, 1,
0.222727, 1.882994, 0.7048745, 0, 0, 0, 1, 1,
0.2229803, 0.7048452, 1.427407, 0, 0, 0, 1, 1,
0.2242827, -1.442518, 2.330853, 0, 0, 0, 1, 1,
0.2246056, -0.7868633, 2.998051, 0, 0, 0, 1, 1,
0.2280144, 0.3181256, 1.34575, 0, 0, 0, 1, 1,
0.2292424, 0.3481454, -1.481298, 0, 0, 0, 1, 1,
0.2301218, -0.1872448, 3.133055, 1, 1, 1, 1, 1,
0.230731, 0.06506351, 1.194826, 1, 1, 1, 1, 1,
0.2316524, 0.8719568, 1.149166, 1, 1, 1, 1, 1,
0.238467, 0.4001085, 0.6613451, 1, 1, 1, 1, 1,
0.2448573, 1.097329, 0.09003997, 1, 1, 1, 1, 1,
0.2466408, 0.3924307, -1.31696, 1, 1, 1, 1, 1,
0.2481152, -0.2557032, 2.514636, 1, 1, 1, 1, 1,
0.2483212, 0.4067981, -1.285359, 1, 1, 1, 1, 1,
0.252121, -0.4755474, 2.775514, 1, 1, 1, 1, 1,
0.2564327, 2.707384, -0.121757, 1, 1, 1, 1, 1,
0.259255, 0.7940931, 0.7364494, 1, 1, 1, 1, 1,
0.2701349, 0.2286742, 0.03594622, 1, 1, 1, 1, 1,
0.270522, -2.665877, 4.08559, 1, 1, 1, 1, 1,
0.2724455, 2.256281, -0.1115002, 1, 1, 1, 1, 1,
0.2744603, -0.04618477, 3.597803, 1, 1, 1, 1, 1,
0.2765756, 0.4536558, 0.06628224, 0, 0, 1, 1, 1,
0.2778797, 0.8062386, 1.831326, 1, 0, 0, 1, 1,
0.2782121, -0.387607, 1.300654, 1, 0, 0, 1, 1,
0.2782617, -0.8698061, 1.794889, 1, 0, 0, 1, 1,
0.2788382, 0.8450283, 0.7709131, 1, 0, 0, 1, 1,
0.278895, 1.045883, 0.3081899, 1, 0, 0, 1, 1,
0.28348, 0.1272656, 0.5894659, 0, 0, 0, 1, 1,
0.2852872, 0.3696864, 1.089346, 0, 0, 0, 1, 1,
0.2860395, -0.01924857, 3.105748, 0, 0, 0, 1, 1,
0.2863666, 0.4871242, 0.1270436, 0, 0, 0, 1, 1,
0.286564, 0.1496212, 1.999546, 0, 0, 0, 1, 1,
0.2896032, -1.451099, 4.780793, 0, 0, 0, 1, 1,
0.2902351, -1.345857, 4.578236, 0, 0, 0, 1, 1,
0.2912076, 1.325965, 0.6180515, 1, 1, 1, 1, 1,
0.2933882, -0.2905573, 3.15126, 1, 1, 1, 1, 1,
0.3006263, 0.1390393, 0.1272179, 1, 1, 1, 1, 1,
0.3010363, -1.189516, 3.912588, 1, 1, 1, 1, 1,
0.3039909, 0.2349869, 0.4876294, 1, 1, 1, 1, 1,
0.3055831, 0.004394025, 2.008868, 1, 1, 1, 1, 1,
0.3089266, -0.4650444, 2.215546, 1, 1, 1, 1, 1,
0.310721, 0.8768565, -0.7551456, 1, 1, 1, 1, 1,
0.3135249, -0.1025207, 1.128071, 1, 1, 1, 1, 1,
0.3183474, -1.044147, 1.077081, 1, 1, 1, 1, 1,
0.3187199, -0.4923539, 2.438602, 1, 1, 1, 1, 1,
0.3211409, -1.279682, 2.677983, 1, 1, 1, 1, 1,
0.3236977, -0.2774756, 1.586825, 1, 1, 1, 1, 1,
0.3238225, -1.418515, 3.227473, 1, 1, 1, 1, 1,
0.324982, -0.89667, 2.467178, 1, 1, 1, 1, 1,
0.327896, 0.580025, 1.044709, 0, 0, 1, 1, 1,
0.3279755, -0.2113175, 1.461679, 1, 0, 0, 1, 1,
0.3325559, -0.6258569, 2.89033, 1, 0, 0, 1, 1,
0.3331044, 1.699949, 0.5904685, 1, 0, 0, 1, 1,
0.3340021, -2.032245, 4.024104, 1, 0, 0, 1, 1,
0.3382789, 1.782922, -0.1513442, 1, 0, 0, 1, 1,
0.339947, -1.167449, 3.683398, 0, 0, 0, 1, 1,
0.3436058, 1.979915, 0.8055538, 0, 0, 0, 1, 1,
0.3470984, 0.8282432, -0.816254, 0, 0, 0, 1, 1,
0.3526221, -0.8266998, 2.856161, 0, 0, 0, 1, 1,
0.3575728, 1.425801, -2.050584, 0, 0, 0, 1, 1,
0.3688939, -0.3461716, 2.022066, 0, 0, 0, 1, 1,
0.3712217, 1.009837, -1.344494, 0, 0, 0, 1, 1,
0.3723632, 0.2341343, -0.7394721, 1, 1, 1, 1, 1,
0.3800625, 0.7600875, 0.2957329, 1, 1, 1, 1, 1,
0.3818583, 0.8325369, 0.07974694, 1, 1, 1, 1, 1,
0.3824282, 0.127239, 2.10922, 1, 1, 1, 1, 1,
0.3830907, 0.4249756, 1.503168, 1, 1, 1, 1, 1,
0.3866472, -0.8443369, 1.974855, 1, 1, 1, 1, 1,
0.3906834, 0.9581764, -0.3034879, 1, 1, 1, 1, 1,
0.3918457, 0.9685625, 1.707467, 1, 1, 1, 1, 1,
0.3942978, 0.7163931, -1.194934, 1, 1, 1, 1, 1,
0.394382, 0.8841299, -0.2755367, 1, 1, 1, 1, 1,
0.3972619, -1.495131, 4.428258, 1, 1, 1, 1, 1,
0.4008394, -0.9350883, 3.606804, 1, 1, 1, 1, 1,
0.4017044, -0.4639188, 2.614753, 1, 1, 1, 1, 1,
0.4029719, -0.788668, 3.456014, 1, 1, 1, 1, 1,
0.4031263, 0.887807, 1.065464, 1, 1, 1, 1, 1,
0.4040641, 0.08734561, -0.2718461, 0, 0, 1, 1, 1,
0.4055274, 0.2239789, 1.526512, 1, 0, 0, 1, 1,
0.4057548, 0.3785168, 1.354466, 1, 0, 0, 1, 1,
0.4069971, 1.365253, -1.20942, 1, 0, 0, 1, 1,
0.4111283, -1.144823, 2.158333, 1, 0, 0, 1, 1,
0.4143061, -0.7539676, 4.094888, 1, 0, 0, 1, 1,
0.4147224, -0.3884982, 2.663543, 0, 0, 0, 1, 1,
0.4218125, 0.1853408, 1.394635, 0, 0, 0, 1, 1,
0.4286125, 1.013419, -2.410185, 0, 0, 0, 1, 1,
0.4289068, 0.08842257, 0.7992385, 0, 0, 0, 1, 1,
0.4320568, 2.036469, -0.2882605, 0, 0, 0, 1, 1,
0.4329036, 0.5412757, -0.126448, 0, 0, 0, 1, 1,
0.4417024, 0.01749658, 2.539585, 0, 0, 0, 1, 1,
0.4423225, 1.878849, -0.4750288, 1, 1, 1, 1, 1,
0.4443929, 0.5838407, 1.2675, 1, 1, 1, 1, 1,
0.4488016, -1.29938, 2.116501, 1, 1, 1, 1, 1,
0.4497822, 2.857565, -0.2518702, 1, 1, 1, 1, 1,
0.454641, -0.03333273, 0.6066034, 1, 1, 1, 1, 1,
0.4555091, 1.23722, 0.09962722, 1, 1, 1, 1, 1,
0.4564028, 1.694481, 0.2192135, 1, 1, 1, 1, 1,
0.462712, -0.6098818, 2.243046, 1, 1, 1, 1, 1,
0.4628773, -0.7935326, 1.976382, 1, 1, 1, 1, 1,
0.4666246, 0.00570943, -0.2302122, 1, 1, 1, 1, 1,
0.4674031, 1.316607, -1.257009, 1, 1, 1, 1, 1,
0.4685028, -0.7625154, 4.085231, 1, 1, 1, 1, 1,
0.4693576, -1.409584, 3.398614, 1, 1, 1, 1, 1,
0.4701569, -0.7545801, 2.314449, 1, 1, 1, 1, 1,
0.4741181, 0.3849902, 1.069331, 1, 1, 1, 1, 1,
0.4744255, 0.2292483, 2.391769, 0, 0, 1, 1, 1,
0.4763325, 1.9741, 2.500452, 1, 0, 0, 1, 1,
0.4763519, -1.265743, 0.6379153, 1, 0, 0, 1, 1,
0.4806347, -1.641405, 3.407876, 1, 0, 0, 1, 1,
0.4813367, 1.125607, 0.3048684, 1, 0, 0, 1, 1,
0.4817935, -0.1406876, 1.652174, 1, 0, 0, 1, 1,
0.4826878, 0.5416496, 1.461478, 0, 0, 0, 1, 1,
0.4835664, -0.5992252, 1.782143, 0, 0, 0, 1, 1,
0.4837774, 1.604993, 0.1871908, 0, 0, 0, 1, 1,
0.4882977, -0.3129049, 3.378711, 0, 0, 0, 1, 1,
0.4915, -0.6201062, 3.485351, 0, 0, 0, 1, 1,
0.4971509, 0.2125297, 0.6178349, 0, 0, 0, 1, 1,
0.5007387, 0.07213973, 0.2086884, 0, 0, 0, 1, 1,
0.5008156, -0.7289211, 2.601821, 1, 1, 1, 1, 1,
0.5027301, -0.5845608, 1.807803, 1, 1, 1, 1, 1,
0.5036324, -0.5792364, 2.872754, 1, 1, 1, 1, 1,
0.5071773, 1.460036, 1.769899, 1, 1, 1, 1, 1,
0.508597, 0.5100487, 2.043919, 1, 1, 1, 1, 1,
0.5117051, -0.1251115, 3.3487, 1, 1, 1, 1, 1,
0.5130934, -0.6062437, 2.882509, 1, 1, 1, 1, 1,
0.5169802, -1.21391, 1.685814, 1, 1, 1, 1, 1,
0.5207434, 1.485843, 0.1617233, 1, 1, 1, 1, 1,
0.5219834, 0.09106361, -1.418766, 1, 1, 1, 1, 1,
0.5288298, -1.120617, 3.403736, 1, 1, 1, 1, 1,
0.5300983, 1.926107, 0.5073369, 1, 1, 1, 1, 1,
0.5344836, 0.3103128, 1.842385, 1, 1, 1, 1, 1,
0.5374004, -1.953227, 3.844265, 1, 1, 1, 1, 1,
0.5438997, -1.05096, 3.412899, 1, 1, 1, 1, 1,
0.5445102, 0.4481053, 0.5575578, 0, 0, 1, 1, 1,
0.5453445, -0.01764285, 1.41744, 1, 0, 0, 1, 1,
0.5558507, -0.4907042, 2.792633, 1, 0, 0, 1, 1,
0.558692, -0.6106712, 3.346178, 1, 0, 0, 1, 1,
0.5609483, 0.02529779, 1.739229, 1, 0, 0, 1, 1,
0.5649031, -1.891605, 4.137341, 1, 0, 0, 1, 1,
0.5656219, -0.8546547, 2.058894, 0, 0, 0, 1, 1,
0.5677901, -1.160229, 1.758667, 0, 0, 0, 1, 1,
0.5740886, 0.4626421, 0.7167273, 0, 0, 0, 1, 1,
0.5748484, -0.1353707, 0.4352993, 0, 0, 0, 1, 1,
0.5760849, -0.414351, 1.06194, 0, 0, 0, 1, 1,
0.576826, -0.4331603, 1.383828, 0, 0, 0, 1, 1,
0.5869348, 1.432812, 0.3931585, 0, 0, 0, 1, 1,
0.5923772, -2.481881, 2.009367, 1, 1, 1, 1, 1,
0.5929815, -0.9554913, 1.705985, 1, 1, 1, 1, 1,
0.5930311, 0.4916925, 0.00585897, 1, 1, 1, 1, 1,
0.5948771, 0.8007228, 1.318986, 1, 1, 1, 1, 1,
0.5952221, 1.035586, 0.9368208, 1, 1, 1, 1, 1,
0.5961282, -1.775548, 1.766845, 1, 1, 1, 1, 1,
0.6013232, 1.056345, 0.5760433, 1, 1, 1, 1, 1,
0.6016271, 1.340696, -0.4857774, 1, 1, 1, 1, 1,
0.6030346, 0.2085941, 2.157353, 1, 1, 1, 1, 1,
0.6031166, 0.1809208, 2.394826, 1, 1, 1, 1, 1,
0.6087098, -1.20454, 3.397317, 1, 1, 1, 1, 1,
0.6088227, -0.3659671, 3.790261, 1, 1, 1, 1, 1,
0.6126359, 1.33683, -0.8880435, 1, 1, 1, 1, 1,
0.6128603, 0.2002128, 0.1598882, 1, 1, 1, 1, 1,
0.6136426, 1.51861, 0.7457759, 1, 1, 1, 1, 1,
0.6139554, 0.7957244, 1.534371, 0, 0, 1, 1, 1,
0.6265756, 0.7462904, -0.1368714, 1, 0, 0, 1, 1,
0.6293515, -1.093262, 4.563908, 1, 0, 0, 1, 1,
0.6319949, -0.1578082, 0.7637817, 1, 0, 0, 1, 1,
0.6355921, -0.3188231, 1.348295, 1, 0, 0, 1, 1,
0.6375456, 1.339468, -0.07969276, 1, 0, 0, 1, 1,
0.6431066, 0.0007410485, 0.97896, 0, 0, 0, 1, 1,
0.6446854, -0.741678, 3.095549, 0, 0, 0, 1, 1,
0.6481445, -0.744774, 1.848908, 0, 0, 0, 1, 1,
0.6482553, -0.3571432, 3.493518, 0, 0, 0, 1, 1,
0.6503557, 2.027815, 0.06220562, 0, 0, 0, 1, 1,
0.6528687, 0.3532783, 2.034425, 0, 0, 0, 1, 1,
0.655136, 1.090075, -0.7214946, 0, 0, 0, 1, 1,
0.657985, 0.01432527, 1.738882, 1, 1, 1, 1, 1,
0.6597161, 0.3820688, 2.707841, 1, 1, 1, 1, 1,
0.6620859, -0.6689216, 2.217279, 1, 1, 1, 1, 1,
0.6623976, -0.1824149, 1.693887, 1, 1, 1, 1, 1,
0.6629747, 0.7112519, -0.299626, 1, 1, 1, 1, 1,
0.6645529, 1.382654, 0.4605862, 1, 1, 1, 1, 1,
0.6667148, 1.721755, 0.4421846, 1, 1, 1, 1, 1,
0.6724361, 0.4632294, 2.789095, 1, 1, 1, 1, 1,
0.6735506, 1.143964, 1.131328, 1, 1, 1, 1, 1,
0.6756995, 0.2619762, 0.9242817, 1, 1, 1, 1, 1,
0.6760147, 1.547773, 0.8280954, 1, 1, 1, 1, 1,
0.6817347, 0.4723668, 1.468083, 1, 1, 1, 1, 1,
0.6920244, -1.933591, 2.548753, 1, 1, 1, 1, 1,
0.7059542, -0.03078768, 4.182993, 1, 1, 1, 1, 1,
0.7138722, -2.190115, 2.357003, 1, 1, 1, 1, 1,
0.7156742, -0.06464969, 1.306707, 0, 0, 1, 1, 1,
0.7172283, 0.1978514, 0.07675653, 1, 0, 0, 1, 1,
0.7191693, 0.3006777, 1.393687, 1, 0, 0, 1, 1,
0.7195802, -1.642534, 3.393637, 1, 0, 0, 1, 1,
0.7232199, -0.03203287, 0.5778077, 1, 0, 0, 1, 1,
0.7246633, -0.4971447, 1.349495, 1, 0, 0, 1, 1,
0.7295661, -0.5583628, 1.879894, 0, 0, 0, 1, 1,
0.7339813, -0.3412319, 1.046579, 0, 0, 0, 1, 1,
0.7350703, 0.2859937, -0.451668, 0, 0, 0, 1, 1,
0.7412153, 0.3839672, 0.9235947, 0, 0, 0, 1, 1,
0.7468247, -0.6351935, 1.71666, 0, 0, 0, 1, 1,
0.7507735, -0.835291, 2.163708, 0, 0, 0, 1, 1,
0.7531106, -0.9956633, 1.931775, 0, 0, 0, 1, 1,
0.7549909, -0.4263825, 3.676007, 1, 1, 1, 1, 1,
0.7602273, 0.3683034, 0.5886809, 1, 1, 1, 1, 1,
0.7722457, -0.347385, 2.380152, 1, 1, 1, 1, 1,
0.7726334, 0.3367665, 1.085225, 1, 1, 1, 1, 1,
0.7737901, 1.656712, 2.001372, 1, 1, 1, 1, 1,
0.7755284, -0.09040176, 1.582063, 1, 1, 1, 1, 1,
0.7827072, 0.1660453, 1.965563, 1, 1, 1, 1, 1,
0.7956858, -0.2510198, 1.701761, 1, 1, 1, 1, 1,
0.7964215, -0.1376249, 1.369673, 1, 1, 1, 1, 1,
0.7964292, -1.217209, 2.356027, 1, 1, 1, 1, 1,
0.7966439, -1.090768, 3.309913, 1, 1, 1, 1, 1,
0.7994218, -2.008836, 1.987189, 1, 1, 1, 1, 1,
0.8022041, -0.8439502, 2.246626, 1, 1, 1, 1, 1,
0.8098954, -1.090872, 0.8948278, 1, 1, 1, 1, 1,
0.8125737, 0.7348461, 0.6001823, 1, 1, 1, 1, 1,
0.8145053, 1.312546, 0.8782539, 0, 0, 1, 1, 1,
0.8148685, -0.1314141, 3.194105, 1, 0, 0, 1, 1,
0.8250777, -0.06038434, 1.917981, 1, 0, 0, 1, 1,
0.8317136, -0.2830012, -0.3013039, 1, 0, 0, 1, 1,
0.8338947, -1.039539, 2.608542, 1, 0, 0, 1, 1,
0.8383937, -0.8308622, 2.306034, 1, 0, 0, 1, 1,
0.8463838, -0.3487794, 2.16688, 0, 0, 0, 1, 1,
0.8465898, -1.788826, 2.995642, 0, 0, 0, 1, 1,
0.851259, 0.1464143, 1.172755, 0, 0, 0, 1, 1,
0.8545721, 0.8910841, -0.02983264, 0, 0, 0, 1, 1,
0.8603982, 1.076264, 1.737292, 0, 0, 0, 1, 1,
0.8612405, -1.070763, 2.657505, 0, 0, 0, 1, 1,
0.8668209, -0.5172955, 2.637041, 0, 0, 0, 1, 1,
0.8746746, -0.7737303, 4.140452, 1, 1, 1, 1, 1,
0.8764443, -0.05516503, 3.412528, 1, 1, 1, 1, 1,
0.8772388, 0.501591, 0.1791272, 1, 1, 1, 1, 1,
0.8788803, 0.01614572, 3.521734, 1, 1, 1, 1, 1,
0.8919626, 1.48917, 0.5376732, 1, 1, 1, 1, 1,
0.894651, -0.9580433, 1.807791, 1, 1, 1, 1, 1,
0.8946897, -1.994523, 2.378763, 1, 1, 1, 1, 1,
0.9050332, 0.1307416, 1.322943, 1, 1, 1, 1, 1,
0.9070629, 0.7267398, 0.9761091, 1, 1, 1, 1, 1,
0.9076397, -0.502922, 2.45524, 1, 1, 1, 1, 1,
0.9091279, 0.7510563, 1.746151, 1, 1, 1, 1, 1,
0.9119433, -0.3701577, 0.4350446, 1, 1, 1, 1, 1,
0.9119739, -0.01881816, 1.192378, 1, 1, 1, 1, 1,
0.9177466, -0.06313358, 0.09933342, 1, 1, 1, 1, 1,
0.9195149, -0.2249067, 0.5910692, 1, 1, 1, 1, 1,
0.92417, -1.151482, 3.373901, 0, 0, 1, 1, 1,
0.9274824, 2.468205, 0.6333687, 1, 0, 0, 1, 1,
0.9285097, -0.2704261, 1.571828, 1, 0, 0, 1, 1,
0.9287983, 1.106302, 1.188902, 1, 0, 0, 1, 1,
0.9332205, 0.5387868, 1.614072, 1, 0, 0, 1, 1,
0.9365621, 1.069266, 0.8907384, 1, 0, 0, 1, 1,
0.9477357, -0.7442625, 3.303261, 0, 0, 0, 1, 1,
0.9481453, 1.518262, 0.9684404, 0, 0, 0, 1, 1,
0.9538746, -0.2857792, 1.487995, 0, 0, 0, 1, 1,
0.9592518, 0.6567692, 0.2870019, 0, 0, 0, 1, 1,
0.9618205, 0.3582636, 0.008357792, 0, 0, 0, 1, 1,
0.9653304, -0.1143193, 0.07133853, 0, 0, 0, 1, 1,
0.9670746, -1.491425, 4.318058, 0, 0, 0, 1, 1,
0.9801549, 0.6767865, 0.1917917, 1, 1, 1, 1, 1,
0.9847118, 0.3982833, 2.051742, 1, 1, 1, 1, 1,
0.9912788, 0.1576411, 2.597245, 1, 1, 1, 1, 1,
0.995097, 1.595136, 0.3287264, 1, 1, 1, 1, 1,
0.9953408, -0.175866, 1.847735, 1, 1, 1, 1, 1,
0.9966754, -0.3718269, 1.135077, 1, 1, 1, 1, 1,
0.998001, 1.294973, 0.6990086, 1, 1, 1, 1, 1,
1.000356, 1.176534, 1.037591, 1, 1, 1, 1, 1,
1.005253, 0.9382617, 0.9606636, 1, 1, 1, 1, 1,
1.006281, -1.219583, 2.836934, 1, 1, 1, 1, 1,
1.011121, 1.347988, 0.9095217, 1, 1, 1, 1, 1,
1.0135, -0.2862557, 1.343554, 1, 1, 1, 1, 1,
1.014159, 0.5015158, 1.782859, 1, 1, 1, 1, 1,
1.015552, -0.2512044, 0.6239085, 1, 1, 1, 1, 1,
1.020448, 1.559815, -0.8948355, 1, 1, 1, 1, 1,
1.021839, -1.672369, 3.599591, 0, 0, 1, 1, 1,
1.023396, 0.5811607, 1.093072, 1, 0, 0, 1, 1,
1.025132, 1.306553, 0.8050274, 1, 0, 0, 1, 1,
1.030385, 1.622216, 0.2397241, 1, 0, 0, 1, 1,
1.030912, 0.5127956, 1.368569, 1, 0, 0, 1, 1,
1.032613, -0.07008858, 2.016013, 1, 0, 0, 1, 1,
1.044253, 2.615836, 0.7062541, 0, 0, 0, 1, 1,
1.052149, -2.485804, 3.093663, 0, 0, 0, 1, 1,
1.053183, -0.06285266, 2.924835, 0, 0, 0, 1, 1,
1.056152, -0.656895, 1.429355, 0, 0, 0, 1, 1,
1.062197, 2.193082, -0.1423802, 0, 0, 0, 1, 1,
1.067263, 0.1275656, 1.01691, 0, 0, 0, 1, 1,
1.102368, -1.779959, 2.879637, 0, 0, 0, 1, 1,
1.106816, -0.9020235, 1.512442, 1, 1, 1, 1, 1,
1.114427, -0.505617, 2.242664, 1, 1, 1, 1, 1,
1.114577, -0.9650529, 2.055288, 1, 1, 1, 1, 1,
1.117409, 0.3821216, 1.23577, 1, 1, 1, 1, 1,
1.118421, 0.2640084, 1.9328, 1, 1, 1, 1, 1,
1.127648, -0.5289086, 1.467581, 1, 1, 1, 1, 1,
1.142541, 0.1563613, 3.58387, 1, 1, 1, 1, 1,
1.142659, 0.6020831, -0.4330064, 1, 1, 1, 1, 1,
1.142906, -0.2169028, 1.852924, 1, 1, 1, 1, 1,
1.146667, -0.6058158, 2.046916, 1, 1, 1, 1, 1,
1.163157, 1.602358, 0.840726, 1, 1, 1, 1, 1,
1.165913, 0.4847117, 1.303557, 1, 1, 1, 1, 1,
1.172532, 1.227499, 1.133883, 1, 1, 1, 1, 1,
1.208881, 1.204343, 0.80436, 1, 1, 1, 1, 1,
1.214989, 1.159181, 1.184708, 1, 1, 1, 1, 1,
1.215254, -0.4974223, 1.350071, 0, 0, 1, 1, 1,
1.232341, 0.9950118, 1.530465, 1, 0, 0, 1, 1,
1.23735, 0.430654, 1.707519, 1, 0, 0, 1, 1,
1.237728, 0.05776899, 1.409535, 1, 0, 0, 1, 1,
1.238474, 0.2838576, 0.4717559, 1, 0, 0, 1, 1,
1.239008, -0.9290022, 3.231186, 1, 0, 0, 1, 1,
1.239998, 1.205726, 0.823934, 0, 0, 0, 1, 1,
1.242994, 0.1816457, 1.059264, 0, 0, 0, 1, 1,
1.270709, -0.4776777, 1.687474, 0, 0, 0, 1, 1,
1.285912, -1.0509, 1.137482, 0, 0, 0, 1, 1,
1.286414, -1.239816, 3.053245, 0, 0, 0, 1, 1,
1.297259, 0.8018878, 0.6079555, 0, 0, 0, 1, 1,
1.300483, -0.2890573, 2.14548, 0, 0, 0, 1, 1,
1.303183, 0.3898311, 1.139318, 1, 1, 1, 1, 1,
1.305567, -0.112524, 0.1407311, 1, 1, 1, 1, 1,
1.309707, 0.4916168, 1.160644, 1, 1, 1, 1, 1,
1.311629, -0.3059038, 1.753205, 1, 1, 1, 1, 1,
1.31309, 0.4972269, 1.4835, 1, 1, 1, 1, 1,
1.329957, 1.291045, -0.1539829, 1, 1, 1, 1, 1,
1.329961, 0.9246952, 1.463786, 1, 1, 1, 1, 1,
1.332045, -0.5857691, 3.554042, 1, 1, 1, 1, 1,
1.33717, -0.4904746, 1.5987, 1, 1, 1, 1, 1,
1.345992, 1.131836, 1.091932, 1, 1, 1, 1, 1,
1.350471, -1.369289, 2.756721, 1, 1, 1, 1, 1,
1.362708, 0.6536058, 1.548512, 1, 1, 1, 1, 1,
1.366305, -1.339159, 2.777394, 1, 1, 1, 1, 1,
1.369434, -0.6464781, 0.4436079, 1, 1, 1, 1, 1,
1.381651, 0.3467285, 1.816472, 1, 1, 1, 1, 1,
1.39486, -0.8883007, 1.50133, 0, 0, 1, 1, 1,
1.394875, 0.7664229, 0.9290045, 1, 0, 0, 1, 1,
1.398272, 0.8976811, 1.277259, 1, 0, 0, 1, 1,
1.404502, -0.1466977, 0.8629465, 1, 0, 0, 1, 1,
1.425456, 1.2266, 1.487901, 1, 0, 0, 1, 1,
1.42566, 1.07178, 1.091127, 1, 0, 0, 1, 1,
1.432456, -0.2388122, 0.4923261, 0, 0, 0, 1, 1,
1.434783, -1.246614, 4.625347, 0, 0, 0, 1, 1,
1.443424, -0.6383193, 2.45379, 0, 0, 0, 1, 1,
1.461431, -1.01712, 0.9047529, 0, 0, 0, 1, 1,
1.464811, -2.14811, 2.524903, 0, 0, 0, 1, 1,
1.466065, 1.522215, 0.4495984, 0, 0, 0, 1, 1,
1.474601, 0.9909011, -0.3590796, 0, 0, 0, 1, 1,
1.476242, -0.8607978, 2.439204, 1, 1, 1, 1, 1,
1.477647, 1.221652, 0.3608963, 1, 1, 1, 1, 1,
1.481222, -1.158215, 3.422103, 1, 1, 1, 1, 1,
1.484846, 1.60328, -0.4495095, 1, 1, 1, 1, 1,
1.485961, 2.680584, 0.08915115, 1, 1, 1, 1, 1,
1.491121, -0.1306208, 0.8930022, 1, 1, 1, 1, 1,
1.493474, -1.316842, 2.765294, 1, 1, 1, 1, 1,
1.506773, 0.3072034, 0.7754867, 1, 1, 1, 1, 1,
1.521073, -0.4557036, 0.5068245, 1, 1, 1, 1, 1,
1.534515, -1.306659, 2.72928, 1, 1, 1, 1, 1,
1.537779, -2.770109, 2.846215, 1, 1, 1, 1, 1,
1.539427, -1.511422, 2.563587, 1, 1, 1, 1, 1,
1.541814, -1.426713, 3.227061, 1, 1, 1, 1, 1,
1.543422, -0.2464574, 0.3904138, 1, 1, 1, 1, 1,
1.572942, -0.402734, 2.427006, 1, 1, 1, 1, 1,
1.611611, -0.1231113, 2.040196, 0, 0, 1, 1, 1,
1.614956, 0.7505151, 1.384648, 1, 0, 0, 1, 1,
1.629499, -0.1532069, 1.924, 1, 0, 0, 1, 1,
1.630029, 0.401413, -0.01771975, 1, 0, 0, 1, 1,
1.631604, -0.7558811, 2.668522, 1, 0, 0, 1, 1,
1.641426, -0.1778798, 0.7451846, 1, 0, 0, 1, 1,
1.644683, 0.07899899, 3.344383, 0, 0, 0, 1, 1,
1.646177, -0.8917078, 1.514429, 0, 0, 0, 1, 1,
1.665073, 0.167171, 1.789733, 0, 0, 0, 1, 1,
1.66867, 2.208374, 0.0936844, 0, 0, 0, 1, 1,
1.669793, 0.2616816, 1.03238, 0, 0, 0, 1, 1,
1.68242, 0.3123978, 0.2344097, 0, 0, 0, 1, 1,
1.692841, 0.06411321, 2.697749, 0, 0, 0, 1, 1,
1.706766, -0.7786878, 0.7392618, 1, 1, 1, 1, 1,
1.714516, 0.8029055, -0.05157518, 1, 1, 1, 1, 1,
1.723927, 0.242279, 2.190628, 1, 1, 1, 1, 1,
1.739737, -0.02861576, 2.32706, 1, 1, 1, 1, 1,
1.783599, -1.521951, 1.839997, 1, 1, 1, 1, 1,
1.789748, 0.3717501, 2.153542, 1, 1, 1, 1, 1,
1.794111, 0.1518325, 3.063004, 1, 1, 1, 1, 1,
1.806126, 0.5563147, 2.362887, 1, 1, 1, 1, 1,
1.820528, -0.2368285, 2.473927, 1, 1, 1, 1, 1,
1.822951, 0.7561871, 2.879384, 1, 1, 1, 1, 1,
1.826461, -2.046372, 3.680558, 1, 1, 1, 1, 1,
1.834103, -0.570859, 2.299505, 1, 1, 1, 1, 1,
1.845752, -0.6213486, 3.249712, 1, 1, 1, 1, 1,
1.845824, -1.623717, 2.093692, 1, 1, 1, 1, 1,
1.866247, 1.398373, 0.3239568, 1, 1, 1, 1, 1,
1.86708, 0.3952856, 1.733977, 0, 0, 1, 1, 1,
1.913735, 1.300169, 1.702475, 1, 0, 0, 1, 1,
1.972764, -1.14775, 2.259703, 1, 0, 0, 1, 1,
1.98414, 2.000393, 0.4010386, 1, 0, 0, 1, 1,
2.02333, -0.2212749, 2.348403, 1, 0, 0, 1, 1,
2.043319, -0.3195382, 1.194869, 1, 0, 0, 1, 1,
2.052984, 0.7850031, 0.9729722, 0, 0, 0, 1, 1,
2.067276, 0.7550723, -0.2349419, 0, 0, 0, 1, 1,
2.098874, -1.09397, 4.07211, 0, 0, 0, 1, 1,
2.248497, -0.7837323, 0.3620021, 0, 0, 0, 1, 1,
2.285324, 0.05052863, 0.24661, 0, 0, 0, 1, 1,
2.596552, 0.2374477, 1.059639, 0, 0, 0, 1, 1,
2.611054, -0.7212046, 0.06945035, 0, 0, 0, 1, 1,
2.613663, -0.3678841, 1.101815, 1, 1, 1, 1, 1,
2.683139, -0.5386012, 0.7538428, 1, 1, 1, 1, 1,
2.727106, 0.4583992, 1.585927, 1, 1, 1, 1, 1,
2.749062, -0.3703844, 0.7806553, 1, 1, 1, 1, 1,
2.944009, -0.1016051, 1.625159, 1, 1, 1, 1, 1,
2.94817, 0.5249924, 0.6665358, 1, 1, 1, 1, 1,
3.312083, -0.03762124, 1.056284, 1, 1, 1, 1, 1
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
var radius = 9.643347;
var distance = 33.87185;
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
mvMatrix.translate( -0.3944023, -0.07112503, -0.01437926 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.87185);
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
