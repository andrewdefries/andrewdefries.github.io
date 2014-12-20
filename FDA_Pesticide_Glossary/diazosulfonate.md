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
-3.361687, 0.2061666, 0.437002, 1, 0, 0, 1,
-3.087788, -1.897091, -2.243428, 1, 0.007843138, 0, 1,
-2.804695, -1.813314, -2.782299, 1, 0.01176471, 0, 1,
-2.662637, 1.074903, -0.08150192, 1, 0.01960784, 0, 1,
-2.627833, -1.266832, -1.195072, 1, 0.02352941, 0, 1,
-2.581239, -0.8139601, -2.243126, 1, 0.03137255, 0, 1,
-2.551694, 1.399022, -1.985443, 1, 0.03529412, 0, 1,
-2.544314, -0.1188722, -1.498134, 1, 0.04313726, 0, 1,
-2.46463, -1.030429, -0.800784, 1, 0.04705882, 0, 1,
-2.435753, 0.8484434, 0.05002854, 1, 0.05490196, 0, 1,
-2.423173, -1.044532, -2.039024, 1, 0.05882353, 0, 1,
-2.19173, -1.496906, -1.385895, 1, 0.06666667, 0, 1,
-2.168768, 0.0340217, -1.97585, 1, 0.07058824, 0, 1,
-2.165578, -0.1377807, -2.800086, 1, 0.07843138, 0, 1,
-2.142548, -0.1062507, -3.177432, 1, 0.08235294, 0, 1,
-2.138805, -1.384193, -2.105438, 1, 0.09019608, 0, 1,
-2.119121, 0.03540009, -2.184023, 1, 0.09411765, 0, 1,
-2.103307, 0.02185838, -0.7587639, 1, 0.1019608, 0, 1,
-2.082077, 1.526457, 0.3244773, 1, 0.1098039, 0, 1,
-2.002771, -0.4734708, -2.26336, 1, 0.1137255, 0, 1,
-1.99543, 1.329813, -1.624431, 1, 0.1215686, 0, 1,
-1.977998, 0.3463631, -1.260936, 1, 0.1254902, 0, 1,
-1.97745, -0.8317854, -1.20518, 1, 0.1333333, 0, 1,
-1.960303, 1.942768, -1.058278, 1, 0.1372549, 0, 1,
-1.933532, 1.178117, -2.182385, 1, 0.145098, 0, 1,
-1.930863, -1.614524, -2.926546, 1, 0.1490196, 0, 1,
-1.858835, -1.047767, -3.761315, 1, 0.1568628, 0, 1,
-1.857651, -0.1875983, -0.1353503, 1, 0.1607843, 0, 1,
-1.855618, 1.865313, -0.2309229, 1, 0.1686275, 0, 1,
-1.845962, -0.941099, -2.535906, 1, 0.172549, 0, 1,
-1.828063, 1.279609, 0.1177423, 1, 0.1803922, 0, 1,
-1.808868, -0.8218225, -2.393471, 1, 0.1843137, 0, 1,
-1.800984, -0.4453131, -2.408226, 1, 0.1921569, 0, 1,
-1.796762, -2.308725, -3.299211, 1, 0.1960784, 0, 1,
-1.792552, -0.485185, -3.227981, 1, 0.2039216, 0, 1,
-1.781445, -0.9234906, -3.720774, 1, 0.2117647, 0, 1,
-1.780917, -0.5312021, -0.9973298, 1, 0.2156863, 0, 1,
-1.778701, -2.074098, -2.73352, 1, 0.2235294, 0, 1,
-1.757929, -0.4369422, -1.478811, 1, 0.227451, 0, 1,
-1.744767, -2.021293, -1.5907, 1, 0.2352941, 0, 1,
-1.734917, -0.9024984, -2.684735, 1, 0.2392157, 0, 1,
-1.722496, 0.8538233, -1.245366, 1, 0.2470588, 0, 1,
-1.720683, 0.6496699, -2.332663, 1, 0.2509804, 0, 1,
-1.670776, 0.3986478, -2.694144, 1, 0.2588235, 0, 1,
-1.663303, -0.5076105, -2.51673, 1, 0.2627451, 0, 1,
-1.616664, 0.6348265, 0.3366204, 1, 0.2705882, 0, 1,
-1.604222, -0.3571566, -3.50356, 1, 0.2745098, 0, 1,
-1.59175, 0.6900943, -2.150864, 1, 0.282353, 0, 1,
-1.585277, 0.6790309, -0.8119333, 1, 0.2862745, 0, 1,
-1.567437, 1.834515, -1.665231, 1, 0.2941177, 0, 1,
-1.551232, 0.3349835, -0.8921676, 1, 0.3019608, 0, 1,
-1.545911, 0.3907613, -0.9445283, 1, 0.3058824, 0, 1,
-1.537527, -1.185157, -2.90386, 1, 0.3137255, 0, 1,
-1.535845, -1.321455, -2.095324, 1, 0.3176471, 0, 1,
-1.523692, 0.5530647, -2.046115, 1, 0.3254902, 0, 1,
-1.518178, 0.05849779, -3.273024, 1, 0.3294118, 0, 1,
-1.499586, -0.4449356, -2.156612, 1, 0.3372549, 0, 1,
-1.496456, 0.08510907, -0.8814479, 1, 0.3411765, 0, 1,
-1.485114, 1.396026, -1.1129, 1, 0.3490196, 0, 1,
-1.468614, -1.710573, -1.507797, 1, 0.3529412, 0, 1,
-1.466666, -0.7670411, -3.035295, 1, 0.3607843, 0, 1,
-1.445221, 0.2037747, -0.8871124, 1, 0.3647059, 0, 1,
-1.436788, -0.5549194, -2.263334, 1, 0.372549, 0, 1,
-1.435334, -0.6941035, -2.251347, 1, 0.3764706, 0, 1,
-1.435021, -0.8926245, -2.713076, 1, 0.3843137, 0, 1,
-1.413342, 1.497958, -1.2428, 1, 0.3882353, 0, 1,
-1.407153, 0.6359406, -1.541449, 1, 0.3960784, 0, 1,
-1.404703, 0.5411709, -0.9272333, 1, 0.4039216, 0, 1,
-1.400539, -0.9912868, -2.764644, 1, 0.4078431, 0, 1,
-1.388004, 0.8005534, -0.8912274, 1, 0.4156863, 0, 1,
-1.387115, 0.03705639, -3.177721, 1, 0.4196078, 0, 1,
-1.377331, 0.6855617, -1.962113, 1, 0.427451, 0, 1,
-1.349728, 0.580785, -1.861536, 1, 0.4313726, 0, 1,
-1.33974, 0.9856866, -1.38478, 1, 0.4392157, 0, 1,
-1.334075, -1.477125, -2.752821, 1, 0.4431373, 0, 1,
-1.325011, -0.7853109, -1.693823, 1, 0.4509804, 0, 1,
-1.324923, -1.043246, -1.220531, 1, 0.454902, 0, 1,
-1.318743, -1.023348, -2.211748, 1, 0.4627451, 0, 1,
-1.317044, -0.5134506, -2.315152, 1, 0.4666667, 0, 1,
-1.315768, 1.109145, -0.9149861, 1, 0.4745098, 0, 1,
-1.309529, -1.499589, -2.86256, 1, 0.4784314, 0, 1,
-1.300091, 0.648975, -0.3537491, 1, 0.4862745, 0, 1,
-1.296151, 1.560761, -1.145023, 1, 0.4901961, 0, 1,
-1.278818, -0.3877974, -1.240652, 1, 0.4980392, 0, 1,
-1.271963, 0.7631436, -2.197031, 1, 0.5058824, 0, 1,
-1.247319, -0.6614754, -1.290902, 1, 0.509804, 0, 1,
-1.234553, 0.2469381, -1.363568, 1, 0.5176471, 0, 1,
-1.226224, 1.280913, -1.320045, 1, 0.5215687, 0, 1,
-1.21226, -1.221916, -1.528821, 1, 0.5294118, 0, 1,
-1.203225, 1.165447, -0.4927211, 1, 0.5333334, 0, 1,
-1.196914, 1.125704, 0.5437519, 1, 0.5411765, 0, 1,
-1.195648, 0.5134136, -1.187441, 1, 0.5450981, 0, 1,
-1.193967, -0.2931588, -1.537105, 1, 0.5529412, 0, 1,
-1.190633, -0.3728203, -2.879176, 1, 0.5568628, 0, 1,
-1.182579, -0.4254382, -1.815803, 1, 0.5647059, 0, 1,
-1.18169, 0.7790186, -1.445863, 1, 0.5686275, 0, 1,
-1.169331, 0.7344689, -0.696268, 1, 0.5764706, 0, 1,
-1.162357, 2.376583, -1.399189, 1, 0.5803922, 0, 1,
-1.157412, -0.1741113, -0.4417041, 1, 0.5882353, 0, 1,
-1.152985, -0.4109397, -2.042626, 1, 0.5921569, 0, 1,
-1.142797, -1.80299, -2.408929, 1, 0.6, 0, 1,
-1.131007, -0.7121262, -1.227005, 1, 0.6078432, 0, 1,
-1.13095, -1.045743, -3.29912, 1, 0.6117647, 0, 1,
-1.127235, -0.05137414, -0.9253544, 1, 0.6196079, 0, 1,
-1.115296, 0.0511843, -1.166359, 1, 0.6235294, 0, 1,
-1.112924, -1.771062, -0.5908184, 1, 0.6313726, 0, 1,
-1.10958, 0.1522191, -0.9050957, 1, 0.6352941, 0, 1,
-1.106506, -1.550184, -1.820671, 1, 0.6431373, 0, 1,
-1.105536, -0.1660728, -0.8128216, 1, 0.6470588, 0, 1,
-1.099168, 0.4549763, -0.8807895, 1, 0.654902, 0, 1,
-1.089361, 1.099128, -2.402018, 1, 0.6588235, 0, 1,
-1.078362, -1.13481, -1.986266, 1, 0.6666667, 0, 1,
-1.073715, 0.7257442, -2.614188, 1, 0.6705883, 0, 1,
-1.071564, 1.090896, -0.6686851, 1, 0.6784314, 0, 1,
-1.068648, 0.3693869, -0.2972631, 1, 0.682353, 0, 1,
-1.067291, 0.5723099, -0.4478687, 1, 0.6901961, 0, 1,
-1.056781, -1.116571, -2.681418, 1, 0.6941177, 0, 1,
-1.055738, -1.235181, -2.437109, 1, 0.7019608, 0, 1,
-1.05104, 1.441492, -1.105599, 1, 0.7098039, 0, 1,
-1.050561, -0.9773695, -1.438745, 1, 0.7137255, 0, 1,
-1.050252, -0.8207884, -2.293041, 1, 0.7215686, 0, 1,
-1.045746, 0.9162727, -1.914698, 1, 0.7254902, 0, 1,
-1.036512, 0.03766439, -2.302604, 1, 0.7333333, 0, 1,
-1.035557, -0.2578844, -3.832263, 1, 0.7372549, 0, 1,
-1.028573, 0.9176247, -0.3791319, 1, 0.7450981, 0, 1,
-1.027558, -0.2909638, 0.4921098, 1, 0.7490196, 0, 1,
-1.020227, -1.926409, -2.531814, 1, 0.7568628, 0, 1,
-1.003697, -1.74161, -2.987159, 1, 0.7607843, 0, 1,
-1.002545, -1.148267, -1.698827, 1, 0.7686275, 0, 1,
-0.9996597, -0.009594735, -2.031982, 1, 0.772549, 0, 1,
-0.9858365, -0.04984981, -2.082276, 1, 0.7803922, 0, 1,
-0.9854652, -2.198649, -1.896379, 1, 0.7843137, 0, 1,
-0.9838924, -0.1984322, -0.421113, 1, 0.7921569, 0, 1,
-0.9750988, 0.09006099, -2.54358, 1, 0.7960784, 0, 1,
-0.9733504, 0.7091712, -0.02456592, 1, 0.8039216, 0, 1,
-0.9709074, 1.020619, -0.9188749, 1, 0.8117647, 0, 1,
-0.9541678, 0.2437308, 0.8160732, 1, 0.8156863, 0, 1,
-0.9532572, 0.3838224, -2.551326, 1, 0.8235294, 0, 1,
-0.9529733, -0.9890996, -2.503268, 1, 0.827451, 0, 1,
-0.9507181, 0.1208961, -3.050288, 1, 0.8352941, 0, 1,
-0.949752, -0.2450477, -1.085136, 1, 0.8392157, 0, 1,
-0.9497351, 1.007914, -0.679781, 1, 0.8470588, 0, 1,
-0.9412299, -0.9373475, -1.50154, 1, 0.8509804, 0, 1,
-0.9406408, 0.5302929, -1.285544, 1, 0.8588235, 0, 1,
-0.9385476, 1.773011, -1.150976, 1, 0.8627451, 0, 1,
-0.9239796, 0.6590961, -1.232947, 1, 0.8705882, 0, 1,
-0.9230465, -1.080234, -2.347757, 1, 0.8745098, 0, 1,
-0.9143503, 0.3193697, -0.05610277, 1, 0.8823529, 0, 1,
-0.9107698, 2.431446, 0.1042072, 1, 0.8862745, 0, 1,
-0.9097816, -0.3781099, -2.447605, 1, 0.8941177, 0, 1,
-0.9061659, 0.5049421, -0.7632869, 1, 0.8980392, 0, 1,
-0.8990016, -0.4885197, -2.418818, 1, 0.9058824, 0, 1,
-0.8987707, -0.875855, -1.514008, 1, 0.9137255, 0, 1,
-0.8941875, -0.1512736, 1.103566, 1, 0.9176471, 0, 1,
-0.8847536, -0.2446213, -1.218222, 1, 0.9254902, 0, 1,
-0.8842287, -0.4397293, -2.606829, 1, 0.9294118, 0, 1,
-0.8832497, -1.271835, -2.839417, 1, 0.9372549, 0, 1,
-0.8782511, -1.674688, -3.538676, 1, 0.9411765, 0, 1,
-0.8751363, -0.1623206, -1.465196, 1, 0.9490196, 0, 1,
-0.8730636, 0.1799871, -2.0339, 1, 0.9529412, 0, 1,
-0.868018, 0.2289342, -0.3763326, 1, 0.9607843, 0, 1,
-0.862725, 1.207242, -1.67562, 1, 0.9647059, 0, 1,
-0.8562224, 1.972956, 0.8560163, 1, 0.972549, 0, 1,
-0.8537494, 0.6839565, -0.6238303, 1, 0.9764706, 0, 1,
-0.8515218, -1.027195, -2.348336, 1, 0.9843137, 0, 1,
-0.8435, -0.6070793, -3.248068, 1, 0.9882353, 0, 1,
-0.8411921, -0.5422969, -2.21555, 1, 0.9960784, 0, 1,
-0.8403433, -0.9904665, -2.93833, 0.9960784, 1, 0, 1,
-0.8394328, 0.5741412, 0.3132888, 0.9921569, 1, 0, 1,
-0.8322825, -1.114398, -2.904366, 0.9843137, 1, 0, 1,
-0.8312719, 0.09465408, -3.487984, 0.9803922, 1, 0, 1,
-0.8243906, 0.1525539, -1.302629, 0.972549, 1, 0, 1,
-0.8178512, -0.00686704, -0.09987636, 0.9686275, 1, 0, 1,
-0.8112103, 0.150324, -1.991699, 0.9607843, 1, 0, 1,
-0.801305, -0.7069138, -4.377679, 0.9568627, 1, 0, 1,
-0.8006043, -0.876897, -3.434906, 0.9490196, 1, 0, 1,
-0.7909537, 0.9517599, 0.461394, 0.945098, 1, 0, 1,
-0.7881691, -0.533885, -2.342248, 0.9372549, 1, 0, 1,
-0.784085, -0.8142023, -2.007812, 0.9333333, 1, 0, 1,
-0.7809094, 0.1123038, -2.488432, 0.9254902, 1, 0, 1,
-0.7793759, -0.2685583, -2.252129, 0.9215686, 1, 0, 1,
-0.7743996, -0.6805519, -3.074625, 0.9137255, 1, 0, 1,
-0.7725039, -1.539749, -3.266637, 0.9098039, 1, 0, 1,
-0.7714542, -1.357415, -3.70849, 0.9019608, 1, 0, 1,
-0.7712428, -0.2452929, -0.4947542, 0.8941177, 1, 0, 1,
-0.7709415, 2.516308, 1.020784, 0.8901961, 1, 0, 1,
-0.76595, -0.8318554, -3.125465, 0.8823529, 1, 0, 1,
-0.7620863, -1.182181, -2.57356, 0.8784314, 1, 0, 1,
-0.7619957, -1.929032, -3.62424, 0.8705882, 1, 0, 1,
-0.7531673, -1.134092, -2.759722, 0.8666667, 1, 0, 1,
-0.7529782, -1.841893, -4.255722, 0.8588235, 1, 0, 1,
-0.752229, 0.02016192, -1.836859, 0.854902, 1, 0, 1,
-0.7521931, -1.4255, -2.564234, 0.8470588, 1, 0, 1,
-0.7517022, 0.9102896, -0.5562827, 0.8431373, 1, 0, 1,
-0.7449415, 1.149252, -2.446076, 0.8352941, 1, 0, 1,
-0.7425486, -0.5389059, -0.6725677, 0.8313726, 1, 0, 1,
-0.7401215, 1.611789, -0.4051401, 0.8235294, 1, 0, 1,
-0.7381708, 0.8785202, 1.053689, 0.8196079, 1, 0, 1,
-0.7273145, -1.367408, -2.691099, 0.8117647, 1, 0, 1,
-0.7238929, 1.302768, 1.429678, 0.8078431, 1, 0, 1,
-0.7228396, -0.1389719, -1.296748, 0.8, 1, 0, 1,
-0.7214743, 0.5409529, -1.055576, 0.7921569, 1, 0, 1,
-0.7167237, -0.8089116, -2.849436, 0.7882353, 1, 0, 1,
-0.7108251, -1.332618, -2.801883, 0.7803922, 1, 0, 1,
-0.7071497, -0.6330924, -2.062466, 0.7764706, 1, 0, 1,
-0.7062141, 0.8886656, -0.1780662, 0.7686275, 1, 0, 1,
-0.6984504, 0.0718493, -0.4136564, 0.7647059, 1, 0, 1,
-0.6886479, 0.1868863, -1.576489, 0.7568628, 1, 0, 1,
-0.6865273, -0.5283912, -3.048425, 0.7529412, 1, 0, 1,
-0.6822007, 0.9568105, -0.9620857, 0.7450981, 1, 0, 1,
-0.6814836, -0.2027793, -0.5436741, 0.7411765, 1, 0, 1,
-0.6809239, -0.5598814, -3.057039, 0.7333333, 1, 0, 1,
-0.680528, 0.1442426, -1.826981, 0.7294118, 1, 0, 1,
-0.678551, 0.4106548, -0.09486752, 0.7215686, 1, 0, 1,
-0.6773555, -0.4634535, -3.697371, 0.7176471, 1, 0, 1,
-0.6766612, 0.007835883, -2.194205, 0.7098039, 1, 0, 1,
-0.6721773, -0.01142387, -2.237125, 0.7058824, 1, 0, 1,
-0.6703858, 0.6910944, 1.533251, 0.6980392, 1, 0, 1,
-0.6591599, -0.5818346, -2.737485, 0.6901961, 1, 0, 1,
-0.65882, 1.891098, -1.273331, 0.6862745, 1, 0, 1,
-0.6566586, 0.4359417, -2.592798, 0.6784314, 1, 0, 1,
-0.6542136, 0.6900218, -1.521131, 0.6745098, 1, 0, 1,
-0.6537114, 0.4427995, -1.209166, 0.6666667, 1, 0, 1,
-0.6521178, -0.9954103, -3.306699, 0.6627451, 1, 0, 1,
-0.6519894, 0.6501469, -0.5988262, 0.654902, 1, 0, 1,
-0.6500734, -0.9690312, -3.392064, 0.6509804, 1, 0, 1,
-0.6469299, -0.735213, -5.016631, 0.6431373, 1, 0, 1,
-0.6421733, 1.274547, -1.675776, 0.6392157, 1, 0, 1,
-0.6409338, 0.4388312, -1.065898, 0.6313726, 1, 0, 1,
-0.6354429, -1.681868, -2.031312, 0.627451, 1, 0, 1,
-0.6351862, -0.197381, -3.218686, 0.6196079, 1, 0, 1,
-0.634802, -0.134954, -2.227222, 0.6156863, 1, 0, 1,
-0.6346483, -0.5364454, -2.185818, 0.6078432, 1, 0, 1,
-0.6344219, 0.8953254, -0.3059649, 0.6039216, 1, 0, 1,
-0.6327831, -0.1514609, -1.979239, 0.5960785, 1, 0, 1,
-0.6306052, 0.4090907, -1.035162, 0.5882353, 1, 0, 1,
-0.6242641, -1.891237, -2.851503, 0.5843138, 1, 0, 1,
-0.6215965, -1.219679, -2.095329, 0.5764706, 1, 0, 1,
-0.6212758, -0.03971345, -1.876039, 0.572549, 1, 0, 1,
-0.6163821, 0.6312386, -1.636788, 0.5647059, 1, 0, 1,
-0.6138746, -0.8373308, -1.215647, 0.5607843, 1, 0, 1,
-0.6106983, -0.0757138, -2.030562, 0.5529412, 1, 0, 1,
-0.6085768, -0.4714037, -4.097976, 0.5490196, 1, 0, 1,
-0.6052567, 2.368224, -1.548985, 0.5411765, 1, 0, 1,
-0.6009024, 1.240025, 1.13831, 0.5372549, 1, 0, 1,
-0.5912072, 0.1658147, -0.1407498, 0.5294118, 1, 0, 1,
-0.5896624, 0.0487669, -1.132477, 0.5254902, 1, 0, 1,
-0.5875135, -1.134685, -2.017621, 0.5176471, 1, 0, 1,
-0.5864264, 0.1075934, -2.245233, 0.5137255, 1, 0, 1,
-0.5796728, -1.844316, -1.537381, 0.5058824, 1, 0, 1,
-0.576221, -0.5785266, -2.276016, 0.5019608, 1, 0, 1,
-0.57074, 0.5843279, -0.8185543, 0.4941176, 1, 0, 1,
-0.5685771, -0.7533655, -1.827084, 0.4862745, 1, 0, 1,
-0.5667118, -0.3885385, -1.066037, 0.4823529, 1, 0, 1,
-0.5621248, 0.1393697, -1.409517, 0.4745098, 1, 0, 1,
-0.5598376, -0.5680773, -2.401014, 0.4705882, 1, 0, 1,
-0.5579769, 0.523513, -1.396944, 0.4627451, 1, 0, 1,
-0.5571764, -0.9285833, -2.781211, 0.4588235, 1, 0, 1,
-0.5562944, -1.357346, -1.971481, 0.4509804, 1, 0, 1,
-0.5550374, -0.4309483, -3.597894, 0.4470588, 1, 0, 1,
-0.5525724, 0.5535046, -1.22385, 0.4392157, 1, 0, 1,
-0.5524616, -0.1086235, -1.785011, 0.4352941, 1, 0, 1,
-0.5471382, -0.6830236, -3.450706, 0.427451, 1, 0, 1,
-0.5449039, -0.1868133, -0.4621606, 0.4235294, 1, 0, 1,
-0.5430973, -0.1197482, -3.680091, 0.4156863, 1, 0, 1,
-0.5403964, 1.076437, -0.6842448, 0.4117647, 1, 0, 1,
-0.5387137, 0.4484214, -3.858692, 0.4039216, 1, 0, 1,
-0.537047, 0.08978187, 0.800881, 0.3960784, 1, 0, 1,
-0.5276406, -0.7104794, -1.742995, 0.3921569, 1, 0, 1,
-0.5242923, -0.6399596, -2.102526, 0.3843137, 1, 0, 1,
-0.5184169, -1.336984, -2.882864, 0.3803922, 1, 0, 1,
-0.5147035, 1.019162, -0.4018994, 0.372549, 1, 0, 1,
-0.5140995, 0.7939733, 1.186945, 0.3686275, 1, 0, 1,
-0.5123373, 0.7000191, -0.976094, 0.3607843, 1, 0, 1,
-0.5119158, -1.122076, -3.609601, 0.3568628, 1, 0, 1,
-0.5116203, -0.5544833, -2.60219, 0.3490196, 1, 0, 1,
-0.5112894, 0.4065281, -1.746746, 0.345098, 1, 0, 1,
-0.5099305, 0.677429, -0.05380786, 0.3372549, 1, 0, 1,
-0.5097509, -1.16129, -2.452284, 0.3333333, 1, 0, 1,
-0.5095725, -0.1221669, -2.086431, 0.3254902, 1, 0, 1,
-0.507935, 0.09169316, 0.2704182, 0.3215686, 1, 0, 1,
-0.5074747, -0.1364823, -1.692966, 0.3137255, 1, 0, 1,
-0.5023149, -0.5695049, -1.330023, 0.3098039, 1, 0, 1,
-0.4966686, 1.383294, 1.21048, 0.3019608, 1, 0, 1,
-0.4902462, -0.8457704, -1.160152, 0.2941177, 1, 0, 1,
-0.4870934, 0.2456831, 0.8857651, 0.2901961, 1, 0, 1,
-0.4864011, 1.665377, 0.2494382, 0.282353, 1, 0, 1,
-0.4851683, 0.699959, -1.414289, 0.2784314, 1, 0, 1,
-0.4824827, 0.2255972, 0.1620819, 0.2705882, 1, 0, 1,
-0.4741918, 0.5177257, -0.865153, 0.2666667, 1, 0, 1,
-0.4715854, 1.057409, -0.3922999, 0.2588235, 1, 0, 1,
-0.4690398, -1.20863, -3.61854, 0.254902, 1, 0, 1,
-0.4653917, -0.07995914, -0.7751883, 0.2470588, 1, 0, 1,
-0.4609199, -0.7255913, -2.307236, 0.2431373, 1, 0, 1,
-0.4562925, 0.9650355, 0.920159, 0.2352941, 1, 0, 1,
-0.4562424, -0.3897545, -3.305922, 0.2313726, 1, 0, 1,
-0.4555587, 0.7145694, -0.3751979, 0.2235294, 1, 0, 1,
-0.4532191, -0.7000232, -3.11523, 0.2196078, 1, 0, 1,
-0.4524794, -2.065351, -3.56914, 0.2117647, 1, 0, 1,
-0.4512018, -1.051602, -1.891695, 0.2078431, 1, 0, 1,
-0.4505574, 2.091162, -1.336508, 0.2, 1, 0, 1,
-0.4502142, 0.3493653, -1.548919, 0.1921569, 1, 0, 1,
-0.4467065, 0.962871, -0.5802479, 0.1882353, 1, 0, 1,
-0.4404554, 0.3008199, -1.465103, 0.1803922, 1, 0, 1,
-0.4377044, 1.053357, 0.2770621, 0.1764706, 1, 0, 1,
-0.4375187, -0.06493814, -2.149858, 0.1686275, 1, 0, 1,
-0.4366907, -1.277685, -3.363256, 0.1647059, 1, 0, 1,
-0.4348012, 0.04339753, -1.254366, 0.1568628, 1, 0, 1,
-0.4338835, 0.5529365, 1.240272, 0.1529412, 1, 0, 1,
-0.4321944, 1.51423, 0.1684804, 0.145098, 1, 0, 1,
-0.4286888, 0.9347937, 0.9553955, 0.1411765, 1, 0, 1,
-0.4273512, -0.5187012, -2.725021, 0.1333333, 1, 0, 1,
-0.4226995, 0.5025836, -2.208052, 0.1294118, 1, 0, 1,
-0.4193379, 0.2456785, -2.275371, 0.1215686, 1, 0, 1,
-0.4161272, -0.4201208, 0.3008952, 0.1176471, 1, 0, 1,
-0.4107512, 0.898965, -1.668866, 0.1098039, 1, 0, 1,
-0.3972798, -0.6702924, -3.24414, 0.1058824, 1, 0, 1,
-0.3966484, -1.015766, -4.337445, 0.09803922, 1, 0, 1,
-0.3934449, 0.851345, 0.08510514, 0.09019608, 1, 0, 1,
-0.3920705, 0.2552342, -0.9173042, 0.08627451, 1, 0, 1,
-0.3909248, 0.3829449, -1.083383, 0.07843138, 1, 0, 1,
-0.3902918, 0.8671604, 0.2860002, 0.07450981, 1, 0, 1,
-0.388085, 0.4258047, -1.53666, 0.06666667, 1, 0, 1,
-0.387142, -0.08822945, -2.864555, 0.0627451, 1, 0, 1,
-0.3807859, -0.8995947, -3.120707, 0.05490196, 1, 0, 1,
-0.3786718, 0.8976415, -0.1738701, 0.05098039, 1, 0, 1,
-0.378441, -0.1102251, -3.125451, 0.04313726, 1, 0, 1,
-0.3774373, -0.869041, -1.967838, 0.03921569, 1, 0, 1,
-0.3760008, -1.154574, -3.746627, 0.03137255, 1, 0, 1,
-0.3692244, -1.523517, -3.142718, 0.02745098, 1, 0, 1,
-0.369029, 0.4174418, -0.9012136, 0.01960784, 1, 0, 1,
-0.3642203, -1.542147, -2.712304, 0.01568628, 1, 0, 1,
-0.3624811, -0.8065241, -1.069016, 0.007843138, 1, 0, 1,
-0.3622098, 1.529625, -0.1862553, 0.003921569, 1, 0, 1,
-0.3591405, 0.6188534, -0.2507547, 0, 1, 0.003921569, 1,
-0.3532318, 0.5855947, 0.3493736, 0, 1, 0.01176471, 1,
-0.3530761, -0.3964779, -2.931612, 0, 1, 0.01568628, 1,
-0.3522035, -1.035489, -2.607073, 0, 1, 0.02352941, 1,
-0.351675, 1.408289, 0.6473567, 0, 1, 0.02745098, 1,
-0.3490161, -1.645385, -3.928101, 0, 1, 0.03529412, 1,
-0.3489033, -0.1086643, -1.284277, 0, 1, 0.03921569, 1,
-0.3463803, -1.873108, -3.566708, 0, 1, 0.04705882, 1,
-0.3437895, -0.2051727, -3.419489, 0, 1, 0.05098039, 1,
-0.3413453, 0.01952234, -1.547196, 0, 1, 0.05882353, 1,
-0.341265, -0.5425813, -1.750586, 0, 1, 0.0627451, 1,
-0.341209, -1.103139, -3.498134, 0, 1, 0.07058824, 1,
-0.33615, -0.4434749, -1.465526, 0, 1, 0.07450981, 1,
-0.3326465, -2.296662, -3.368233, 0, 1, 0.08235294, 1,
-0.332037, 0.424971, 0.3287262, 0, 1, 0.08627451, 1,
-0.3271761, -0.6122162, -2.064193, 0, 1, 0.09411765, 1,
-0.325884, 0.3290185, -1.59902, 0, 1, 0.1019608, 1,
-0.3227734, -2.207614, -5.093836, 0, 1, 0.1058824, 1,
-0.3225616, 0.3862454, -0.4123122, 0, 1, 0.1137255, 1,
-0.3202708, -0.3944895, -3.809077, 0, 1, 0.1176471, 1,
-0.3199006, -0.6617952, -3.112422, 0, 1, 0.1254902, 1,
-0.317524, -0.05110415, -3.816084, 0, 1, 0.1294118, 1,
-0.312008, -0.7711961, -3.677608, 0, 1, 0.1372549, 1,
-0.3065154, 1.41602, 1.259255, 0, 1, 0.1411765, 1,
-0.3062994, -0.2411488, -0.9477863, 0, 1, 0.1490196, 1,
-0.3060462, -0.7988747, -1.765155, 0, 1, 0.1529412, 1,
-0.3040427, -1.794484, -4.008454, 0, 1, 0.1607843, 1,
-0.3037612, 0.05027466, -1.708187, 0, 1, 0.1647059, 1,
-0.3028024, 0.4582897, 0.1192156, 0, 1, 0.172549, 1,
-0.3008143, -1.660057, -3.671899, 0, 1, 0.1764706, 1,
-0.2996274, 1.343379, -2.164625, 0, 1, 0.1843137, 1,
-0.2979248, 1.213373, -1.586729, 0, 1, 0.1882353, 1,
-0.2939254, 1.241588, -0.9634786, 0, 1, 0.1960784, 1,
-0.2930976, 0.6384581, -1.162337, 0, 1, 0.2039216, 1,
-0.2918794, 0.6931593, -0.9310028, 0, 1, 0.2078431, 1,
-0.2904402, 0.3966484, -0.3168745, 0, 1, 0.2156863, 1,
-0.2903748, 1.056141, -0.5132307, 0, 1, 0.2196078, 1,
-0.2881088, 0.7302318, 0.3110665, 0, 1, 0.227451, 1,
-0.2849122, 0.2810196, 0.2976264, 0, 1, 0.2313726, 1,
-0.2807057, 0.5415633, 1.193886, 0, 1, 0.2392157, 1,
-0.2762856, 0.572184, -2.633336, 0, 1, 0.2431373, 1,
-0.270419, -0.9452003, -3.014786, 0, 1, 0.2509804, 1,
-0.2701906, -0.06903125, -3.911203, 0, 1, 0.254902, 1,
-0.2693599, -0.2575492, -2.405084, 0, 1, 0.2627451, 1,
-0.264149, -0.7440927, -2.670995, 0, 1, 0.2666667, 1,
-0.2638985, -1.14294, -4.887492, 0, 1, 0.2745098, 1,
-0.2632557, 2.316345, 0.2518734, 0, 1, 0.2784314, 1,
-0.2602317, -0.2332201, -2.765404, 0, 1, 0.2862745, 1,
-0.2533598, 0.6817373, -0.2528627, 0, 1, 0.2901961, 1,
-0.2526108, 1.459012, -0.90635, 0, 1, 0.2980392, 1,
-0.2523984, -1.136905, -1.382651, 0, 1, 0.3058824, 1,
-0.2504438, 0.5426952, -1.896654, 0, 1, 0.3098039, 1,
-0.2497333, 2.148641, 0.160291, 0, 1, 0.3176471, 1,
-0.2465193, 1.031373, 0.97845, 0, 1, 0.3215686, 1,
-0.2459303, 0.9264069, -0.5318434, 0, 1, 0.3294118, 1,
-0.2452579, -0.188648, 0.2025181, 0, 1, 0.3333333, 1,
-0.2379089, -0.5058997, -3.980472, 0, 1, 0.3411765, 1,
-0.2351482, -1.588794, -2.37121, 0, 1, 0.345098, 1,
-0.2322651, 0.6049833, -0.5175081, 0, 1, 0.3529412, 1,
-0.2322448, -0.6244773, -3.791308, 0, 1, 0.3568628, 1,
-0.2293989, -0.9682444, -4.572121, 0, 1, 0.3647059, 1,
-0.2291165, -1.391511, -4.164985, 0, 1, 0.3686275, 1,
-0.2279066, -0.04528891, -1.15964, 0, 1, 0.3764706, 1,
-0.2278086, 2.480245, 1.491034, 0, 1, 0.3803922, 1,
-0.2220131, 1.713463, 0.5360164, 0, 1, 0.3882353, 1,
-0.2216438, 0.7551143, -2.205476, 0, 1, 0.3921569, 1,
-0.2203179, -1.182298, -1.141705, 0, 1, 0.4, 1,
-0.2202259, -0.2300972, -3.8497, 0, 1, 0.4078431, 1,
-0.2174579, 1.984526, -0.253732, 0, 1, 0.4117647, 1,
-0.2152281, -1.919421, -2.348016, 0, 1, 0.4196078, 1,
-0.2151873, -0.7483127, -3.511316, 0, 1, 0.4235294, 1,
-0.2148691, -1.108715, -3.888681, 0, 1, 0.4313726, 1,
-0.2130772, -0.4014861, -2.477154, 0, 1, 0.4352941, 1,
-0.2073327, 1.171172, -0.8456357, 0, 1, 0.4431373, 1,
-0.207029, -0.2128961, -1.008299, 0, 1, 0.4470588, 1,
-0.20536, -1.610458, -3.233643, 0, 1, 0.454902, 1,
-0.2020352, -2.095735, -3.056545, 0, 1, 0.4588235, 1,
-0.2013873, -0.820532, -2.200626, 0, 1, 0.4666667, 1,
-0.1935984, 0.0006102623, -2.536102, 0, 1, 0.4705882, 1,
-0.1922161, 1.232297, -1.982335, 0, 1, 0.4784314, 1,
-0.1887983, 0.2101112, -0.3741866, 0, 1, 0.4823529, 1,
-0.188667, 0.08330476, 0.4593891, 0, 1, 0.4901961, 1,
-0.1884858, 0.4252963, 0.6469513, 0, 1, 0.4941176, 1,
-0.1870048, 0.5418767, -0.01026102, 0, 1, 0.5019608, 1,
-0.1839422, 0.7717123, -0.5048491, 0, 1, 0.509804, 1,
-0.1801589, -0.8660765, -3.140519, 0, 1, 0.5137255, 1,
-0.17708, -0.05749589, -3.174737, 0, 1, 0.5215687, 1,
-0.1764588, 0.4213271, -0.1048492, 0, 1, 0.5254902, 1,
-0.1759364, 1.17137, 1.548875, 0, 1, 0.5333334, 1,
-0.174012, -0.628695, -2.472994, 0, 1, 0.5372549, 1,
-0.1733885, -0.274384, -3.264907, 0, 1, 0.5450981, 1,
-0.1704456, 0.1082911, 0.07997826, 0, 1, 0.5490196, 1,
-0.1678499, -0.8074911, -3.487209, 0, 1, 0.5568628, 1,
-0.1669343, -2.163028, -2.954384, 0, 1, 0.5607843, 1,
-0.1660723, 1.065271, 1.174936, 0, 1, 0.5686275, 1,
-0.1653568, 0.328965, 0.2853722, 0, 1, 0.572549, 1,
-0.1562663, 0.1488518, -0.5610211, 0, 1, 0.5803922, 1,
-0.1533423, -0.1922626, -3.390096, 0, 1, 0.5843138, 1,
-0.1530602, -2.14854, -2.802003, 0, 1, 0.5921569, 1,
-0.1510002, 0.3541386, -1.001511, 0, 1, 0.5960785, 1,
-0.1499121, -1.181823, -2.502574, 0, 1, 0.6039216, 1,
-0.1492763, -0.1864069, -1.973294, 0, 1, 0.6117647, 1,
-0.1443004, 0.4734256, 1.99742, 0, 1, 0.6156863, 1,
-0.1418109, 0.4961024, -0.5006773, 0, 1, 0.6235294, 1,
-0.138346, 0.01313954, -0.8612534, 0, 1, 0.627451, 1,
-0.1320778, 0.7408987, -1.49279, 0, 1, 0.6352941, 1,
-0.1314461, -0.1193054, -3.271442, 0, 1, 0.6392157, 1,
-0.1261252, 0.6939709, 0.3097031, 0, 1, 0.6470588, 1,
-0.1249488, -1.145876, -2.323498, 0, 1, 0.6509804, 1,
-0.1209253, -1.189386, -4.067747, 0, 1, 0.6588235, 1,
-0.1123769, 0.8628532, 0.6794952, 0, 1, 0.6627451, 1,
-0.1085382, -0.4639785, -2.617158, 0, 1, 0.6705883, 1,
-0.10391, -1.093497, -5.396013, 0, 1, 0.6745098, 1,
-0.09771591, -0.66806, -2.169157, 0, 1, 0.682353, 1,
-0.0976677, 0.1421577, -2.068492, 0, 1, 0.6862745, 1,
-0.09586756, -1.397538, -4.296036, 0, 1, 0.6941177, 1,
-0.09184497, -0.4446634, -4.456895, 0, 1, 0.7019608, 1,
-0.08488461, -0.09283382, -2.194055, 0, 1, 0.7058824, 1,
-0.08119667, -0.1294948, -2.664953, 0, 1, 0.7137255, 1,
-0.08102615, -1.759693, -2.769901, 0, 1, 0.7176471, 1,
-0.08082343, 1.189673, -0.5048741, 0, 1, 0.7254902, 1,
-0.0791767, 0.958637, 1.403202, 0, 1, 0.7294118, 1,
-0.07906265, -0.4928156, -4.837653, 0, 1, 0.7372549, 1,
-0.07669047, 0.03670022, -1.626307, 0, 1, 0.7411765, 1,
-0.07618896, 1.558108, -0.589121, 0, 1, 0.7490196, 1,
-0.07519064, -0.3288581, -2.713663, 0, 1, 0.7529412, 1,
-0.07488137, 0.3369188, -0.8473423, 0, 1, 0.7607843, 1,
-0.07135841, 1.72919, -0.7427849, 0, 1, 0.7647059, 1,
-0.0707169, -1.328267, -3.293275, 0, 1, 0.772549, 1,
-0.06838565, -1.047571, -3.398061, 0, 1, 0.7764706, 1,
-0.06707277, 1.251027, -2.214449, 0, 1, 0.7843137, 1,
-0.06537919, -0.2066052, -2.916784, 0, 1, 0.7882353, 1,
-0.06375053, 0.6094108, 1.793438, 0, 1, 0.7960784, 1,
-0.05035964, 0.03455765, -1.065451, 0, 1, 0.8039216, 1,
-0.04906804, -0.03048878, 0.6796849, 0, 1, 0.8078431, 1,
-0.04692434, 0.9635357, -0.06837823, 0, 1, 0.8156863, 1,
-0.04594602, -1.57579, -5.116291, 0, 1, 0.8196079, 1,
-0.04513638, 0.9501592, 0.8293146, 0, 1, 0.827451, 1,
-0.04081688, 0.03536598, -1.801533, 0, 1, 0.8313726, 1,
-0.0366063, -0.7373307, -2.958934, 0, 1, 0.8392157, 1,
-0.03631449, 0.2942159, -0.1896102, 0, 1, 0.8431373, 1,
-0.03536026, 0.199149, -1.243391, 0, 1, 0.8509804, 1,
-0.03525805, -0.3316569, -4.419024, 0, 1, 0.854902, 1,
-0.03124452, -0.6364693, -3.089011, 0, 1, 0.8627451, 1,
-0.02958484, -0.2337341, -2.380908, 0, 1, 0.8666667, 1,
-0.02718052, 1.020558, 0.04192841, 0, 1, 0.8745098, 1,
-0.02545581, -0.04490088, -3.098058, 0, 1, 0.8784314, 1,
-0.01900802, 0.7373798, -0.7785449, 0, 1, 0.8862745, 1,
-0.01849429, -0.6823888, -3.946589, 0, 1, 0.8901961, 1,
-0.01647143, 0.3763561, 0.8712499, 0, 1, 0.8980392, 1,
-0.01565062, 0.7689506, -0.1660437, 0, 1, 0.9058824, 1,
-0.0150302, 0.7959768, -0.5673151, 0, 1, 0.9098039, 1,
-0.0150185, 1.799515, 1.165952, 0, 1, 0.9176471, 1,
-0.01411356, 2.242063, -0.1722798, 0, 1, 0.9215686, 1,
-0.01227397, 1.348721, -0.2605489, 0, 1, 0.9294118, 1,
-0.009249624, -0.4963119, -4.508773, 0, 1, 0.9333333, 1,
-0.009085811, 1.184963, -2.390052, 0, 1, 0.9411765, 1,
-0.007448093, -1.21289, -2.998693, 0, 1, 0.945098, 1,
-0.005600331, -0.889919, -3.479175, 0, 1, 0.9529412, 1,
0.0009295185, -0.7720204, 3.246499, 0, 1, 0.9568627, 1,
0.002350643, 0.5657172, -0.893638, 0, 1, 0.9647059, 1,
0.004941029, -0.5553628, 3.699714, 0, 1, 0.9686275, 1,
0.005859225, 0.9839858, -0.7457242, 0, 1, 0.9764706, 1,
0.007969843, -1.031512, 2.691129, 0, 1, 0.9803922, 1,
0.009163115, 0.776468, 0.3551588, 0, 1, 0.9882353, 1,
0.01000394, 1.846597, -1.485938, 0, 1, 0.9921569, 1,
0.01072143, 0.1735826, -0.02615574, 0, 1, 1, 1,
0.01141665, -1.738812, 2.183268, 0, 0.9921569, 1, 1,
0.01216658, 0.2794592, -0.8493159, 0, 0.9882353, 1, 1,
0.01518347, 0.5219627, -0.8064184, 0, 0.9803922, 1, 1,
0.02026985, -0.5742904, 1.930791, 0, 0.9764706, 1, 1,
0.02187999, -0.1310501, 2.15469, 0, 0.9686275, 1, 1,
0.02538332, 0.3358288, -1.481027, 0, 0.9647059, 1, 1,
0.03345518, 1.065578, 0.1863681, 0, 0.9568627, 1, 1,
0.0351043, -0.2069942, 2.602723, 0, 0.9529412, 1, 1,
0.04335282, -0.676597, 2.291493, 0, 0.945098, 1, 1,
0.04366181, -0.438204, 1.805597, 0, 0.9411765, 1, 1,
0.04817788, -1.57539, 4.149814, 0, 0.9333333, 1, 1,
0.04870716, 0.8484458, -0.7040291, 0, 0.9294118, 1, 1,
0.04980673, -0.291282, 4.154961, 0, 0.9215686, 1, 1,
0.05033018, 0.369167, -0.464734, 0, 0.9176471, 1, 1,
0.05409969, 0.3950909, -0.06464617, 0, 0.9098039, 1, 1,
0.05712563, -1.322933, 2.865062, 0, 0.9058824, 1, 1,
0.05740372, 0.6640288, -0.4815184, 0, 0.8980392, 1, 1,
0.05757234, -1.650761, 3.41108, 0, 0.8901961, 1, 1,
0.06109641, -0.3498398, 2.973897, 0, 0.8862745, 1, 1,
0.06169718, -1.226458, 3.508146, 0, 0.8784314, 1, 1,
0.06429135, -0.9734931, 4.096011, 0, 0.8745098, 1, 1,
0.07262247, -1.478102, 1.202941, 0, 0.8666667, 1, 1,
0.07439178, 0.5685413, 0.5025532, 0, 0.8627451, 1, 1,
0.07730004, 0.2412299, 1.755016, 0, 0.854902, 1, 1,
0.08172923, -1.379683, 2.612038, 0, 0.8509804, 1, 1,
0.08868931, 2.00399, 0.9668739, 0, 0.8431373, 1, 1,
0.08894631, 0.8974745, 1.876173, 0, 0.8392157, 1, 1,
0.08907122, 0.3449982, -0.2484948, 0, 0.8313726, 1, 1,
0.09035476, 0.4055393, -1.22533, 0, 0.827451, 1, 1,
0.0925777, 0.5966786, -0.7848051, 0, 0.8196079, 1, 1,
0.0958118, -0.3387157, 2.496962, 0, 0.8156863, 1, 1,
0.09583766, 0.7418413, 0.958155, 0, 0.8078431, 1, 1,
0.102522, -0.5516291, 1.177065, 0, 0.8039216, 1, 1,
0.1054616, -0.9113857, 3.75724, 0, 0.7960784, 1, 1,
0.1055461, 1.065832, -0.1985257, 0, 0.7882353, 1, 1,
0.1092356, 1.021477, 0.3527035, 0, 0.7843137, 1, 1,
0.1095754, -1.829085, 2.920516, 0, 0.7764706, 1, 1,
0.1116858, -0.7995119, 2.325341, 0, 0.772549, 1, 1,
0.112614, -0.9313645, 3.869526, 0, 0.7647059, 1, 1,
0.1148267, 1.492285, 0.2725836, 0, 0.7607843, 1, 1,
0.1187149, 0.2519033, 0.7593779, 0, 0.7529412, 1, 1,
0.1214994, -0.3432806, 1.418054, 0, 0.7490196, 1, 1,
0.1245033, -0.3893569, 4.194266, 0, 0.7411765, 1, 1,
0.1307749, -0.1505272, 1.346442, 0, 0.7372549, 1, 1,
0.1325913, -0.3881513, 2.197937, 0, 0.7294118, 1, 1,
0.1345831, -0.4575771, 2.367213, 0, 0.7254902, 1, 1,
0.1362529, -0.2558985, 0.7051421, 0, 0.7176471, 1, 1,
0.1369549, -0.5846086, 2.743807, 0, 0.7137255, 1, 1,
0.1387627, 1.437177, -1.17405, 0, 0.7058824, 1, 1,
0.1408226, 0.3410802, 0.810818, 0, 0.6980392, 1, 1,
0.1416526, 0.1337012, -0.006268962, 0, 0.6941177, 1, 1,
0.143947, 2.246159, 0.3394337, 0, 0.6862745, 1, 1,
0.1478653, 0.3158127, 0.6035228, 0, 0.682353, 1, 1,
0.148064, -0.8362818, 3.429713, 0, 0.6745098, 1, 1,
0.1501006, 0.9742368, 1.938374, 0, 0.6705883, 1, 1,
0.1507271, 1.230623, -0.4971556, 0, 0.6627451, 1, 1,
0.1516913, 0.8191555, 1.240612, 0, 0.6588235, 1, 1,
0.1535006, 1.00486, 0.6059648, 0, 0.6509804, 1, 1,
0.1584562, 0.6874928, 1.204018, 0, 0.6470588, 1, 1,
0.1593141, -0.4816938, 2.348591, 0, 0.6392157, 1, 1,
0.1630358, -1.181385, 3.110942, 0, 0.6352941, 1, 1,
0.164774, -1.186969, 2.458357, 0, 0.627451, 1, 1,
0.1653881, 0.4145498, -0.3187985, 0, 0.6235294, 1, 1,
0.1723508, -2.380751, 2.050517, 0, 0.6156863, 1, 1,
0.1811243, -0.2654909, 3.464316, 0, 0.6117647, 1, 1,
0.1815187, -1.423372, 2.680628, 0, 0.6039216, 1, 1,
0.1815628, 1.36808, 0.5974023, 0, 0.5960785, 1, 1,
0.1828089, -0.0153011, 1.013273, 0, 0.5921569, 1, 1,
0.186006, 0.2975061, 1.697685, 0, 0.5843138, 1, 1,
0.1894716, 0.455176, -0.1435993, 0, 0.5803922, 1, 1,
0.195074, -0.7302953, 4.120017, 0, 0.572549, 1, 1,
0.1973601, 1.562793, 0.05979358, 0, 0.5686275, 1, 1,
0.1977062, 0.5557893, 1.279301, 0, 0.5607843, 1, 1,
0.1981132, 1.217034, 1.764052, 0, 0.5568628, 1, 1,
0.2025798, 0.9287607, -0.9207743, 0, 0.5490196, 1, 1,
0.2058911, 0.4090893, 0.7093092, 0, 0.5450981, 1, 1,
0.2076583, 0.0927843, 1.597739, 0, 0.5372549, 1, 1,
0.212103, 0.8864998, -1.604057, 0, 0.5333334, 1, 1,
0.2131543, -0.08607081, 0.8059978, 0, 0.5254902, 1, 1,
0.2180137, -1.587123, 4.099735, 0, 0.5215687, 1, 1,
0.2181589, 0.7513672, 1.458986, 0, 0.5137255, 1, 1,
0.21961, 1.750281, -0.6018745, 0, 0.509804, 1, 1,
0.2269927, -0.3649416, 3.456312, 0, 0.5019608, 1, 1,
0.230302, 0.638033, -1.147967, 0, 0.4941176, 1, 1,
0.2329911, 0.7040049, -1.35196, 0, 0.4901961, 1, 1,
0.2386194, -0.310386, 0.9971198, 0, 0.4823529, 1, 1,
0.2401804, 0.5182308, 0.258314, 0, 0.4784314, 1, 1,
0.2460917, -0.8302001, 5.005976, 0, 0.4705882, 1, 1,
0.2480181, 0.724602, 1.028261, 0, 0.4666667, 1, 1,
0.2515988, 0.3573714, 0.3230514, 0, 0.4588235, 1, 1,
0.2523081, 0.9913619, 1.026911, 0, 0.454902, 1, 1,
0.2526656, -0.4077607, 3.42799, 0, 0.4470588, 1, 1,
0.2541166, 0.158692, -0.3186307, 0, 0.4431373, 1, 1,
0.2616857, -0.03097804, 2.277669, 0, 0.4352941, 1, 1,
0.2619303, 0.5643981, 1.20665, 0, 0.4313726, 1, 1,
0.2662755, 0.2708206, -0.4138044, 0, 0.4235294, 1, 1,
0.2666623, -0.08470631, 1.890283, 0, 0.4196078, 1, 1,
0.2685603, 0.7538864, -0.003833879, 0, 0.4117647, 1, 1,
0.2699315, 2.464056, -0.1440365, 0, 0.4078431, 1, 1,
0.2836235, -0.676815, 3.123308, 0, 0.4, 1, 1,
0.2841057, 0.4531345, 0.6599248, 0, 0.3921569, 1, 1,
0.2870487, -0.6873741, 4.474394, 0, 0.3882353, 1, 1,
0.2901336, 0.1214837, 2.265597, 0, 0.3803922, 1, 1,
0.2908387, 0.8329346, -0.7359803, 0, 0.3764706, 1, 1,
0.291573, -0.8735681, 3.292856, 0, 0.3686275, 1, 1,
0.2963952, 0.968129, 1.753412, 0, 0.3647059, 1, 1,
0.297239, 1.144567, 1.95968, 0, 0.3568628, 1, 1,
0.2978303, 1.482885, 0.5822206, 0, 0.3529412, 1, 1,
0.2982751, 0.01392964, 3.582332, 0, 0.345098, 1, 1,
0.3010937, -0.070246, 3.186848, 0, 0.3411765, 1, 1,
0.3064702, -0.8741828, 1.965469, 0, 0.3333333, 1, 1,
0.308255, 0.8042943, 0.04299191, 0, 0.3294118, 1, 1,
0.3100984, 1.167889, 0.1518647, 0, 0.3215686, 1, 1,
0.3109597, -0.6728902, 4.058909, 0, 0.3176471, 1, 1,
0.3130223, 1.709667, 0.688337, 0, 0.3098039, 1, 1,
0.3143144, -0.5744509, 3.669334, 0, 0.3058824, 1, 1,
0.314599, -1.361653, 2.344065, 0, 0.2980392, 1, 1,
0.317739, -0.4299987, 3.763134, 0, 0.2901961, 1, 1,
0.3183402, 0.7378632, 0.2181558, 0, 0.2862745, 1, 1,
0.3193812, -0.4095026, 2.724533, 0, 0.2784314, 1, 1,
0.3254072, 1.504018, 0.5474725, 0, 0.2745098, 1, 1,
0.3307118, -0.2333082, 1.83037, 0, 0.2666667, 1, 1,
0.3320961, -1.271343, 1.280077, 0, 0.2627451, 1, 1,
0.3360114, -1.487193, 4.742698, 0, 0.254902, 1, 1,
0.3384192, -0.2799494, 1.345088, 0, 0.2509804, 1, 1,
0.339595, 1.209288, 0.1425213, 0, 0.2431373, 1, 1,
0.3408118, 1.88121, -0.4728814, 0, 0.2392157, 1, 1,
0.3418202, -1.276886, 2.485048, 0, 0.2313726, 1, 1,
0.3449823, 0.6703686, -0.8467861, 0, 0.227451, 1, 1,
0.3476243, -1.161548, 3.146762, 0, 0.2196078, 1, 1,
0.3496381, 0.04944279, 0.03196117, 0, 0.2156863, 1, 1,
0.3499088, 1.884908, 1.074424, 0, 0.2078431, 1, 1,
0.350338, -1.208235, 1.332099, 0, 0.2039216, 1, 1,
0.3556761, -0.6799681, 3.191277, 0, 0.1960784, 1, 1,
0.3573142, -1.45323, -0.1490803, 0, 0.1882353, 1, 1,
0.3600932, -0.7998254, 1.483017, 0, 0.1843137, 1, 1,
0.3629124, -0.2964223, 2.867779, 0, 0.1764706, 1, 1,
0.3629909, 0.6321776, 0.6491463, 0, 0.172549, 1, 1,
0.3630587, -1.268576, 2.748786, 0, 0.1647059, 1, 1,
0.3641022, -0.8412176, 2.840305, 0, 0.1607843, 1, 1,
0.3648563, -0.327487, 3.023395, 0, 0.1529412, 1, 1,
0.3649997, 0.2749452, 0.3860826, 0, 0.1490196, 1, 1,
0.3671407, 1.985742, 0.6139917, 0, 0.1411765, 1, 1,
0.3677299, 0.3568047, 0.1348079, 0, 0.1372549, 1, 1,
0.3677398, -0.8328025, 3.950814, 0, 0.1294118, 1, 1,
0.369992, 0.4042608, 1.425593, 0, 0.1254902, 1, 1,
0.3727883, 0.5666506, 1.201836, 0, 0.1176471, 1, 1,
0.3734094, 1.536647, 0.5085406, 0, 0.1137255, 1, 1,
0.3734278, -1.074632, 1.183369, 0, 0.1058824, 1, 1,
0.3743434, -0.7193533, 1.364092, 0, 0.09803922, 1, 1,
0.3746081, -0.4206069, 3.084017, 0, 0.09411765, 1, 1,
0.3826872, 1.406374, 0.669715, 0, 0.08627451, 1, 1,
0.3852728, 0.5289258, -1.169354, 0, 0.08235294, 1, 1,
0.3867351, -1.229554, 2.424043, 0, 0.07450981, 1, 1,
0.3876703, -0.2933083, 1.110267, 0, 0.07058824, 1, 1,
0.3895688, -0.1017071, 0.05630021, 0, 0.0627451, 1, 1,
0.39966, 0.8697178, 0.4173028, 0, 0.05882353, 1, 1,
0.4019023, 1.699284, -1.504162, 0, 0.05098039, 1, 1,
0.4025339, 1.301745, 1.003938, 0, 0.04705882, 1, 1,
0.4026369, 0.5380599, 1.593403, 0, 0.03921569, 1, 1,
0.4045434, -2.316602, 2.021951, 0, 0.03529412, 1, 1,
0.404812, 0.3748729, 1.017139, 0, 0.02745098, 1, 1,
0.4060014, 0.05500406, -0.5952607, 0, 0.02352941, 1, 1,
0.4067228, 0.0001763748, 2.372351, 0, 0.01568628, 1, 1,
0.4096105, -0.3278166, 2.041793, 0, 0.01176471, 1, 1,
0.4119746, 0.0825317, 1.780141, 0, 0.003921569, 1, 1,
0.4138543, -1.777417, 4.240677, 0.003921569, 0, 1, 1,
0.4178267, -0.4353221, 1.904835, 0.007843138, 0, 1, 1,
0.4207763, 0.9221006, -0.3265858, 0.01568628, 0, 1, 1,
0.4240791, -1.061798, 2.13077, 0.01960784, 0, 1, 1,
0.4277062, -0.4094708, 1.66487, 0.02745098, 0, 1, 1,
0.4367713, 0.1795161, 4.032268, 0.03137255, 0, 1, 1,
0.440423, 1.88201, 1.0627, 0.03921569, 0, 1, 1,
0.4456856, 0.1563149, 2.227759, 0.04313726, 0, 1, 1,
0.446527, 0.6064102, 1.555033, 0.05098039, 0, 1, 1,
0.4518132, -0.5944469, 2.685603, 0.05490196, 0, 1, 1,
0.452527, 1.474572, 0.08412848, 0.0627451, 0, 1, 1,
0.454423, -2.125891, 3.677478, 0.06666667, 0, 1, 1,
0.4546794, -0.9879949, 1.461127, 0.07450981, 0, 1, 1,
0.4633206, 0.7786924, 1.145568, 0.07843138, 0, 1, 1,
0.4642998, 0.5132706, 0.5753495, 0.08627451, 0, 1, 1,
0.4648006, -0.473154, 3.601965, 0.09019608, 0, 1, 1,
0.4706573, 0.1649972, 0.8401991, 0.09803922, 0, 1, 1,
0.4778191, -2.240012, 2.759511, 0.1058824, 0, 1, 1,
0.4836125, 1.120871, 0.09382986, 0.1098039, 0, 1, 1,
0.4837248, -2.080301, 2.476406, 0.1176471, 0, 1, 1,
0.487117, -0.3089803, 2.10272, 0.1215686, 0, 1, 1,
0.4872334, 1.938805, 1.095731, 0.1294118, 0, 1, 1,
0.4882975, -1.450894, 2.490456, 0.1333333, 0, 1, 1,
0.4941022, -0.1124939, 2.111851, 0.1411765, 0, 1, 1,
0.4954359, -0.2345332, 1.619899, 0.145098, 0, 1, 1,
0.5015385, -0.536978, 0.9726981, 0.1529412, 0, 1, 1,
0.5041273, -0.2225548, 1.816645, 0.1568628, 0, 1, 1,
0.5046991, -0.3334424, 1.40901, 0.1647059, 0, 1, 1,
0.5063722, 0.8726689, 1.546746, 0.1686275, 0, 1, 1,
0.5125118, -0.05960473, 1.134431, 0.1764706, 0, 1, 1,
0.5178252, -0.2381404, 0.9247793, 0.1803922, 0, 1, 1,
0.5249525, 0.9395002, 0.5054901, 0.1882353, 0, 1, 1,
0.5274653, 1.629132, -2.089589, 0.1921569, 0, 1, 1,
0.528667, 0.7899309, 0.559291, 0.2, 0, 1, 1,
0.5322458, -1.238452, 3.695654, 0.2078431, 0, 1, 1,
0.5339991, -0.1560876, 2.954348, 0.2117647, 0, 1, 1,
0.5345887, -1.072794, 4.604264, 0.2196078, 0, 1, 1,
0.5363223, -1.193539, 4.383095, 0.2235294, 0, 1, 1,
0.541983, 2.009488, 0.5457283, 0.2313726, 0, 1, 1,
0.5486342, 0.5839052, 1.720438, 0.2352941, 0, 1, 1,
0.5494359, 0.4385057, 1.776772, 0.2431373, 0, 1, 1,
0.550965, -0.8564856, 2.4666, 0.2470588, 0, 1, 1,
0.5518041, 0.1763657, -0.4050586, 0.254902, 0, 1, 1,
0.5529602, -0.767839, 3.436353, 0.2588235, 0, 1, 1,
0.5530305, 0.184827, 1.061945, 0.2666667, 0, 1, 1,
0.5555618, 0.125715, 0.5595023, 0.2705882, 0, 1, 1,
0.5591108, -0.3013288, 1.236404, 0.2784314, 0, 1, 1,
0.5620376, -0.76013, 2.084473, 0.282353, 0, 1, 1,
0.5649805, -0.6153127, 3.370065, 0.2901961, 0, 1, 1,
0.5673845, -0.07410187, 0.6392231, 0.2941177, 0, 1, 1,
0.5677468, -1.013341, 2.713489, 0.3019608, 0, 1, 1,
0.5732616, -0.7058241, 1.165172, 0.3098039, 0, 1, 1,
0.577082, 2.269773, 0.2433563, 0.3137255, 0, 1, 1,
0.5785533, 0.2410366, 0.5168387, 0.3215686, 0, 1, 1,
0.5809995, 0.5452508, -0.0706799, 0.3254902, 0, 1, 1,
0.5825821, 0.7604041, 1.531186, 0.3333333, 0, 1, 1,
0.5831113, 0.2813448, 2.035403, 0.3372549, 0, 1, 1,
0.5962186, -0.8809937, 0.29491, 0.345098, 0, 1, 1,
0.596406, 0.3841434, 1.635544, 0.3490196, 0, 1, 1,
0.5988888, 0.1409216, 2.146159, 0.3568628, 0, 1, 1,
0.5989344, -0.8332156, 3.163004, 0.3607843, 0, 1, 1,
0.6006721, 0.7159674, 0.2546173, 0.3686275, 0, 1, 1,
0.608285, -0.03891589, 1.127084, 0.372549, 0, 1, 1,
0.6094752, 0.5868209, 1.597325, 0.3803922, 0, 1, 1,
0.614737, -0.7407284, 0.8020586, 0.3843137, 0, 1, 1,
0.6185895, 1.379536, 0.1251837, 0.3921569, 0, 1, 1,
0.6198821, 0.06375703, 3.25846, 0.3960784, 0, 1, 1,
0.6259124, 0.07303295, 1.564914, 0.4039216, 0, 1, 1,
0.6287909, 0.4441046, 0.1730455, 0.4117647, 0, 1, 1,
0.6327753, -0.6243798, 2.716734, 0.4156863, 0, 1, 1,
0.6332997, -0.2465798, 1.588829, 0.4235294, 0, 1, 1,
0.6375946, -0.4561597, 3.023079, 0.427451, 0, 1, 1,
0.639006, -0.7014489, 0.9304196, 0.4352941, 0, 1, 1,
0.6406736, 1.676868, 2.040288, 0.4392157, 0, 1, 1,
0.6417015, -0.671307, 2.938838, 0.4470588, 0, 1, 1,
0.6442372, -0.2285823, 2.765255, 0.4509804, 0, 1, 1,
0.6443267, -0.4200813, 1.679125, 0.4588235, 0, 1, 1,
0.6472049, -0.3377577, 0.7460045, 0.4627451, 0, 1, 1,
0.6477139, -0.2694044, 2.275237, 0.4705882, 0, 1, 1,
0.6577455, -0.2564873, 0.6938815, 0.4745098, 0, 1, 1,
0.6636593, 0.2514277, 0.5080648, 0.4823529, 0, 1, 1,
0.6709821, 1.653181, -0.430501, 0.4862745, 0, 1, 1,
0.6727669, 0.5771664, 0.2025624, 0.4941176, 0, 1, 1,
0.6740068, 0.2601603, 2.996472, 0.5019608, 0, 1, 1,
0.678759, 0.8284227, 0.5332893, 0.5058824, 0, 1, 1,
0.6789911, 0.1863472, 2.508041, 0.5137255, 0, 1, 1,
0.6915645, -1.698892, 2.399601, 0.5176471, 0, 1, 1,
0.7006323, 0.1504736, 2.425942, 0.5254902, 0, 1, 1,
0.7033582, 0.3938366, 0.6502461, 0.5294118, 0, 1, 1,
0.7083126, -1.280219, 4.515081, 0.5372549, 0, 1, 1,
0.7154747, 0.002085559, 0.9365855, 0.5411765, 0, 1, 1,
0.7191318, -0.9973881, 3.993517, 0.5490196, 0, 1, 1,
0.7215472, 0.6640403, 0.8184114, 0.5529412, 0, 1, 1,
0.7218148, 0.7284065, 2.294363, 0.5607843, 0, 1, 1,
0.7245345, 0.8590229, 1.187668, 0.5647059, 0, 1, 1,
0.7261251, 1.287927, -1.379567, 0.572549, 0, 1, 1,
0.7297122, 0.6862374, 0.9206204, 0.5764706, 0, 1, 1,
0.7307012, 0.6716161, 1.839095, 0.5843138, 0, 1, 1,
0.7371868, 1.087154, 0.9530384, 0.5882353, 0, 1, 1,
0.7373267, -0.7552771, 0.7570719, 0.5960785, 0, 1, 1,
0.7384444, -1.097205, 1.85478, 0.6039216, 0, 1, 1,
0.7386927, -1.386037, 1.742961, 0.6078432, 0, 1, 1,
0.7460631, -0.335088, 1.042822, 0.6156863, 0, 1, 1,
0.7468817, 0.8170237, -0.01908368, 0.6196079, 0, 1, 1,
0.7490454, 0.1642652, 1.116858, 0.627451, 0, 1, 1,
0.7522042, 0.3528229, 3.301752, 0.6313726, 0, 1, 1,
0.7523261, -0.1784933, 1.118343, 0.6392157, 0, 1, 1,
0.7600721, 1.521044, -0.3044852, 0.6431373, 0, 1, 1,
0.7627966, -0.3542687, 2.890567, 0.6509804, 0, 1, 1,
0.7669097, 0.04746502, 0.791483, 0.654902, 0, 1, 1,
0.7684197, -1.340077, 3.420917, 0.6627451, 0, 1, 1,
0.7690768, -0.2495118, 2.474145, 0.6666667, 0, 1, 1,
0.7747316, 0.4086796, -0.5302467, 0.6745098, 0, 1, 1,
0.7748298, -0.4706439, 1.475907, 0.6784314, 0, 1, 1,
0.7764443, -0.6079952, 2.718757, 0.6862745, 0, 1, 1,
0.7764906, 1.558497, -0.7707422, 0.6901961, 0, 1, 1,
0.7776468, 0.6740386, 0.8893644, 0.6980392, 0, 1, 1,
0.7801476, 0.2013451, -0.3424559, 0.7058824, 0, 1, 1,
0.7819504, 0.2488846, 2.042693, 0.7098039, 0, 1, 1,
0.7844291, -0.4073448, 1.120231, 0.7176471, 0, 1, 1,
0.7881478, 0.2005307, 1.883655, 0.7215686, 0, 1, 1,
0.7913998, 2.896565, 0.3883677, 0.7294118, 0, 1, 1,
0.795643, 1.960674, 0.2300746, 0.7333333, 0, 1, 1,
0.7969024, -0.8665555, 2.555011, 0.7411765, 0, 1, 1,
0.7976583, 0.6479455, 1.350697, 0.7450981, 0, 1, 1,
0.8015715, 0.6694232, -0.5636855, 0.7529412, 0, 1, 1,
0.8056524, 0.3332058, 2.260713, 0.7568628, 0, 1, 1,
0.8072914, -0.7519664, 3.009114, 0.7647059, 0, 1, 1,
0.8077316, 0.1735018, 1.76298, 0.7686275, 0, 1, 1,
0.814307, 1.236078, -0.1848545, 0.7764706, 0, 1, 1,
0.8159131, 0.3762045, 0.5482012, 0.7803922, 0, 1, 1,
0.8181866, -0.506794, 0.8214387, 0.7882353, 0, 1, 1,
0.8240455, -1.647591, 1.32449, 0.7921569, 0, 1, 1,
0.8290389, -0.2463874, 1.478917, 0.8, 0, 1, 1,
0.8333945, 1.039397, 1.183358, 0.8078431, 0, 1, 1,
0.835654, -0.7964387, 2.57444, 0.8117647, 0, 1, 1,
0.8439547, -0.5339011, 2.615151, 0.8196079, 0, 1, 1,
0.8440894, 0.148802, 1.881081, 0.8235294, 0, 1, 1,
0.853464, 1.49017, 0.5291829, 0.8313726, 0, 1, 1,
0.8547421, -0.008534788, 1.555759, 0.8352941, 0, 1, 1,
0.8563069, 0.9530383, 2.144529, 0.8431373, 0, 1, 1,
0.8568166, 0.197504, 0.6959603, 0.8470588, 0, 1, 1,
0.8593837, 0.2092561, 0.4005629, 0.854902, 0, 1, 1,
0.8604572, 0.07435659, 3.173028, 0.8588235, 0, 1, 1,
0.8665113, 1.666738, -1.215973, 0.8666667, 0, 1, 1,
0.8668707, -0.4361656, 1.747299, 0.8705882, 0, 1, 1,
0.8686303, 1.287968, 0.008352939, 0.8784314, 0, 1, 1,
0.8734044, -0.537867, 0.07131269, 0.8823529, 0, 1, 1,
0.8762665, -0.2837919, 2.846667, 0.8901961, 0, 1, 1,
0.881721, 0.2271864, 1.818465, 0.8941177, 0, 1, 1,
0.8848659, -0.1980289, 0.9628559, 0.9019608, 0, 1, 1,
0.8854912, 0.7865003, 0.3300098, 0.9098039, 0, 1, 1,
0.8858366, -0.01621215, 3.58805, 0.9137255, 0, 1, 1,
0.8869769, -0.6868883, 2.272651, 0.9215686, 0, 1, 1,
0.8890384, -0.3305896, 1.481526, 0.9254902, 0, 1, 1,
0.8945714, 0.3868231, 0.03701571, 0.9333333, 0, 1, 1,
0.895164, -0.5399836, 2.790322, 0.9372549, 0, 1, 1,
0.9041308, -1.82307, 1.429512, 0.945098, 0, 1, 1,
0.9078665, -0.7592878, 2.683621, 0.9490196, 0, 1, 1,
0.9157327, -1.212986, 3.15602, 0.9568627, 0, 1, 1,
0.9162356, 0.9407503, -0.4710892, 0.9607843, 0, 1, 1,
0.9180142, 0.0690762, 0.8488076, 0.9686275, 0, 1, 1,
0.919659, 0.2938191, 1.030424, 0.972549, 0, 1, 1,
0.931081, -0.7501658, 2.115263, 0.9803922, 0, 1, 1,
0.9384702, -0.4397692, 1.0994, 0.9843137, 0, 1, 1,
0.9464881, -0.2715237, 2.468837, 0.9921569, 0, 1, 1,
0.9475335, -0.9875358, 2.244415, 0.9960784, 0, 1, 1,
0.9508365, -0.473287, 0.4253154, 1, 0, 0.9960784, 1,
0.9552217, 0.8584571, 1.486644, 1, 0, 0.9882353, 1,
0.9559186, 1.373186, 0.3724546, 1, 0, 0.9843137, 1,
0.9678439, 0.707392, 1.5655, 1, 0, 0.9764706, 1,
0.9715169, 0.2444939, 0.5346746, 1, 0, 0.972549, 1,
0.9748549, 1.764655, -0.3394625, 1, 0, 0.9647059, 1,
0.9823385, -0.4383225, 0.8461776, 1, 0, 0.9607843, 1,
0.9826514, -1.290209, 2.375682, 1, 0, 0.9529412, 1,
0.987376, -0.9320903, 3.300605, 1, 0, 0.9490196, 1,
0.9891523, 0.8742372, 0.4355973, 1, 0, 0.9411765, 1,
0.9974015, -0.0777785, 2.566625, 1, 0, 0.9372549, 1,
1.001522, 2.118563, 0.9501882, 1, 0, 0.9294118, 1,
1.01024, -1.366384, 2.813213, 1, 0, 0.9254902, 1,
1.012073, 0.1737466, 0.697037, 1, 0, 0.9176471, 1,
1.014547, -0.2722777, -1.186376, 1, 0, 0.9137255, 1,
1.01715, 0.08647264, 0.7023596, 1, 0, 0.9058824, 1,
1.024449, -1.271231, 2.424085, 1, 0, 0.9019608, 1,
1.025423, 0.8627019, 0.5391365, 1, 0, 0.8941177, 1,
1.026131, 0.5296347, 0.4068109, 1, 0, 0.8862745, 1,
1.029076, 0.2974503, 2.174522, 1, 0, 0.8823529, 1,
1.029421, 0.6896462, 1.629782, 1, 0, 0.8745098, 1,
1.029471, 1.497248, -0.5443282, 1, 0, 0.8705882, 1,
1.031607, -1.06928, 2.608679, 1, 0, 0.8627451, 1,
1.035013, 0.8319754, 1.114784, 1, 0, 0.8588235, 1,
1.038283, 0.6460739, 1.628034, 1, 0, 0.8509804, 1,
1.046174, -0.9332509, 1.601706, 1, 0, 0.8470588, 1,
1.050367, 1.470134, -0.4591299, 1, 0, 0.8392157, 1,
1.052934, -0.3881207, 0.9511184, 1, 0, 0.8352941, 1,
1.05671, 1.227677, 0.8040572, 1, 0, 0.827451, 1,
1.056992, -1.156174, 2.599324, 1, 0, 0.8235294, 1,
1.058342, 1.9708, 2.502848, 1, 0, 0.8156863, 1,
1.065975, -0.1412531, 1.479203, 1, 0, 0.8117647, 1,
1.066961, 0.3939231, 1.760876, 1, 0, 0.8039216, 1,
1.06912, -0.382856, 2.226836, 1, 0, 0.7960784, 1,
1.075392, -0.465763, 1.669928, 1, 0, 0.7921569, 1,
1.08603, 0.3385847, 0.8501292, 1, 0, 0.7843137, 1,
1.086462, 1.354698, 1.210333, 1, 0, 0.7803922, 1,
1.08929, 1.281562, 0.3649919, 1, 0, 0.772549, 1,
1.089306, 0.9082304, -0.1849041, 1, 0, 0.7686275, 1,
1.089718, -1.042808, 1.389123, 1, 0, 0.7607843, 1,
1.099998, -0.2119103, 0.4183972, 1, 0, 0.7568628, 1,
1.108286, -0.9978778, 2.406497, 1, 0, 0.7490196, 1,
1.115875, 0.4918752, 1.391906, 1, 0, 0.7450981, 1,
1.123154, -0.7450324, 3.452643, 1, 0, 0.7372549, 1,
1.12648, -0.3472086, 1.036423, 1, 0, 0.7333333, 1,
1.127411, -1.095807, 1.874707, 1, 0, 0.7254902, 1,
1.134413, 1.110116, -0.1966144, 1, 0, 0.7215686, 1,
1.143224, 1.886211, 0.03945324, 1, 0, 0.7137255, 1,
1.150092, 1.504683, -1.305228, 1, 0, 0.7098039, 1,
1.155021, -1.721972, 3.513366, 1, 0, 0.7019608, 1,
1.158031, 2.277499, 1.146918, 1, 0, 0.6941177, 1,
1.160424, 0.3549143, 1.518486, 1, 0, 0.6901961, 1,
1.165661, -0.2944026, 2.623322, 1, 0, 0.682353, 1,
1.178456, 1.395677, -1.592986, 1, 0, 0.6784314, 1,
1.181748, 0.5018756, -0.2176613, 1, 0, 0.6705883, 1,
1.1823, 0.7646716, 1.090598, 1, 0, 0.6666667, 1,
1.184808, -0.3980805, 4.040565, 1, 0, 0.6588235, 1,
1.190164, 0.6279832, 1.521079, 1, 0, 0.654902, 1,
1.19066, 1.259715, -0.4534758, 1, 0, 0.6470588, 1,
1.194539, -0.7194893, 2.942422, 1, 0, 0.6431373, 1,
1.198637, -0.5470225, 1.589504, 1, 0, 0.6352941, 1,
1.211142, -0.6141069, 0.06743795, 1, 0, 0.6313726, 1,
1.21944, 1.154953, 0.4197861, 1, 0, 0.6235294, 1,
1.219557, -1.174039, -0.5447437, 1, 0, 0.6196079, 1,
1.225904, 1.357188, -1.144847, 1, 0, 0.6117647, 1,
1.228671, -2.458193, 6.026505, 1, 0, 0.6078432, 1,
1.23178, 0.2928528, 1.018533, 1, 0, 0.6, 1,
1.24188, -2.240243, 2.655452, 1, 0, 0.5921569, 1,
1.246962, 0.6624576, 0.8300401, 1, 0, 0.5882353, 1,
1.249974, -1.066268, 1.469859, 1, 0, 0.5803922, 1,
1.251738, 0.3304769, 2.209239, 1, 0, 0.5764706, 1,
1.252052, 0.8126795, 1.802034, 1, 0, 0.5686275, 1,
1.252563, -0.4592987, 0.6304526, 1, 0, 0.5647059, 1,
1.253744, -0.7655432, 2.970275, 1, 0, 0.5568628, 1,
1.253857, -0.9913011, 2.941559, 1, 0, 0.5529412, 1,
1.257179, 1.470176, 0.8148394, 1, 0, 0.5450981, 1,
1.259138, -0.5677581, 1.394197, 1, 0, 0.5411765, 1,
1.263377, -1.305973, 4.223129, 1, 0, 0.5333334, 1,
1.277821, 1.381601, 1.99753, 1, 0, 0.5294118, 1,
1.282614, -1.851937, 0.9802329, 1, 0, 0.5215687, 1,
1.300082, 1.164696, 0.5812584, 1, 0, 0.5176471, 1,
1.3007, -0.1003204, 1.959521, 1, 0, 0.509804, 1,
1.312628, 0.1291331, 0.3176078, 1, 0, 0.5058824, 1,
1.316422, -1.335553, 2.319463, 1, 0, 0.4980392, 1,
1.327221, -1.009012, 2.553358, 1, 0, 0.4901961, 1,
1.342917, -0.5445805, 0.5084806, 1, 0, 0.4862745, 1,
1.357016, -1.689004, 1.710695, 1, 0, 0.4784314, 1,
1.358835, 0.51284, 2.728223, 1, 0, 0.4745098, 1,
1.358846, -1.016651, 1.66036, 1, 0, 0.4666667, 1,
1.362761, -1.943068, 2.482371, 1, 0, 0.4627451, 1,
1.372209, -1.041116, 3.079553, 1, 0, 0.454902, 1,
1.373601, 0.007539293, 2.484812, 1, 0, 0.4509804, 1,
1.37577, 0.7010909, 0.822773, 1, 0, 0.4431373, 1,
1.38263, -1.012354, 2.765339, 1, 0, 0.4392157, 1,
1.38502, -2.71437, 2.644101, 1, 0, 0.4313726, 1,
1.403008, -1.269171, 1.111559, 1, 0, 0.427451, 1,
1.40666, -0.1623229, 0.8263389, 1, 0, 0.4196078, 1,
1.407696, -0.1261722, 1.692501, 1, 0, 0.4156863, 1,
1.413129, 1.538178, 1.857244, 1, 0, 0.4078431, 1,
1.423438, -1.285951, 3.37042, 1, 0, 0.4039216, 1,
1.441161, 0.1691647, 3.176473, 1, 0, 0.3960784, 1,
1.442514, 1.146762, 0.5014864, 1, 0, 0.3882353, 1,
1.442897, 0.9728364, 1.885541, 1, 0, 0.3843137, 1,
1.443074, -0.118109, 1.689184, 1, 0, 0.3764706, 1,
1.447192, 0.2260339, 1.942614, 1, 0, 0.372549, 1,
1.452196, -1.052583, -0.3547187, 1, 0, 0.3647059, 1,
1.470999, 0.395028, 0.38387, 1, 0, 0.3607843, 1,
1.481134, -0.430978, 3.771431, 1, 0, 0.3529412, 1,
1.503936, -2.071386, 3.508834, 1, 0, 0.3490196, 1,
1.504356, 0.1032359, -0.3251581, 1, 0, 0.3411765, 1,
1.508093, 1.644165, 0.7870644, 1, 0, 0.3372549, 1,
1.508766, -0.6279647, 1.68383, 1, 0, 0.3294118, 1,
1.509316, -0.1374297, 2.074241, 1, 0, 0.3254902, 1,
1.519986, 0.008915399, 0.5378658, 1, 0, 0.3176471, 1,
1.521203, 0.1975351, 1.270685, 1, 0, 0.3137255, 1,
1.541426, 0.1392099, 1.606748, 1, 0, 0.3058824, 1,
1.569257, 0.8713, 0.3042888, 1, 0, 0.2980392, 1,
1.570347, 1.975953, 0.00518387, 1, 0, 0.2941177, 1,
1.572371, -2.516443, 3.976334, 1, 0, 0.2862745, 1,
1.574827, 1.164484, 0.4763384, 1, 0, 0.282353, 1,
1.59465, 0.6931153, 1.24087, 1, 0, 0.2745098, 1,
1.614164, -0.7844434, 4.844337, 1, 0, 0.2705882, 1,
1.630305, 1.332466, 0.7050286, 1, 0, 0.2627451, 1,
1.637555, -0.3230574, 0.7479138, 1, 0, 0.2588235, 1,
1.670938, -0.5360141, 2.998218, 1, 0, 0.2509804, 1,
1.692683, 0.5602165, 1.08597, 1, 0, 0.2470588, 1,
1.730472, 1.240284, 1.294251, 1, 0, 0.2392157, 1,
1.738833, -0.6606888, 1.903214, 1, 0, 0.2352941, 1,
1.776342, -0.3581945, 0.7788225, 1, 0, 0.227451, 1,
1.777826, 0.9051988, 1.82041, 1, 0, 0.2235294, 1,
1.781931, -0.01192196, 3.033981, 1, 0, 0.2156863, 1,
1.805811, -0.386873, 2.90055, 1, 0, 0.2117647, 1,
1.816038, 0.05388356, -0.02435213, 1, 0, 0.2039216, 1,
1.822128, 2.414572, -0.585345, 1, 0, 0.1960784, 1,
1.834981, -0.2079195, 0.7447735, 1, 0, 0.1921569, 1,
1.853229, -0.439286, 3.289138, 1, 0, 0.1843137, 1,
1.854694, -0.0900219, 1.743972, 1, 0, 0.1803922, 1,
1.857488, -0.9628876, 3.267263, 1, 0, 0.172549, 1,
1.867268, 0.233209, 0.8412147, 1, 0, 0.1686275, 1,
1.887138, 0.7456987, 1.147124, 1, 0, 0.1607843, 1,
1.892772, -2.027016, 1.432212, 1, 0, 0.1568628, 1,
1.906796, -0.5771526, 1.929664, 1, 0, 0.1490196, 1,
1.917502, 0.1890832, 1.325305, 1, 0, 0.145098, 1,
1.949528, -0.6576865, 1.946676, 1, 0, 0.1372549, 1,
1.960503, 0.2803161, -0.3505832, 1, 0, 0.1333333, 1,
1.967751, -1.302408, 3.327109, 1, 0, 0.1254902, 1,
2.022567, -1.030305, 3.966655, 1, 0, 0.1215686, 1,
2.068403, 0.3948966, 0.9980633, 1, 0, 0.1137255, 1,
2.106416, 0.4260206, 0.07816587, 1, 0, 0.1098039, 1,
2.14941, 0.03612648, 0.9547898, 1, 0, 0.1019608, 1,
2.151956, -1.199069, 1.692399, 1, 0, 0.09411765, 1,
2.18385, 0.08555599, 2.279304, 1, 0, 0.09019608, 1,
2.218031, 0.6010431, 2.64106, 1, 0, 0.08235294, 1,
2.232117, 0.482036, -1.217173, 1, 0, 0.07843138, 1,
2.233296, 0.4652727, 2.820864, 1, 0, 0.07058824, 1,
2.24712, -0.2706625, 1.511964, 1, 0, 0.06666667, 1,
2.26904, 0.735741, 1.501414, 1, 0, 0.05882353, 1,
2.382179, 0.963473, 1.889273, 1, 0, 0.05490196, 1,
2.433522, -1.427184, 2.932414, 1, 0, 0.04705882, 1,
2.494988, -0.9056541, 0.5169238, 1, 0, 0.04313726, 1,
2.528202, -2.17649, 1.520486, 1, 0, 0.03529412, 1,
2.6125, 0.05251256, 0.762476, 1, 0, 0.03137255, 1,
2.644992, 1.533234, 1.472876, 1, 0, 0.02352941, 1,
2.649023, 0.9230742, 1.8963, 1, 0, 0.01960784, 1,
2.763947, 0.9983465, 0.1829137, 1, 0, 0.01176471, 1,
3.142896, -0.6628925, 1.765286, 1, 0, 0.007843138, 1
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
-0.1093954, -3.665423, -7.332129, 0, -0.5, 0.5, 0.5,
-0.1093954, -3.665423, -7.332129, 1, -0.5, 0.5, 0.5,
-0.1093954, -3.665423, -7.332129, 1, 1.5, 0.5, 0.5,
-0.1093954, -3.665423, -7.332129, 0, 1.5, 0.5, 0.5
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
-4.464213, 0.09109759, -7.332129, 0, -0.5, 0.5, 0.5,
-4.464213, 0.09109759, -7.332129, 1, -0.5, 0.5, 0.5,
-4.464213, 0.09109759, -7.332129, 1, 1.5, 0.5, 0.5,
-4.464213, 0.09109759, -7.332129, 0, 1.5, 0.5, 0.5
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
-4.464213, -3.665423, 0.3152459, 0, -0.5, 0.5, 0.5,
-4.464213, -3.665423, 0.3152459, 1, -0.5, 0.5, 0.5,
-4.464213, -3.665423, 0.3152459, 1, 1.5, 0.5, 0.5,
-4.464213, -3.665423, 0.3152459, 0, 1.5, 0.5, 0.5
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
-3, -2.798534, -5.56735,
3, -2.798534, -5.56735,
-3, -2.798534, -5.56735,
-3, -2.943015, -5.86148,
-2, -2.798534, -5.56735,
-2, -2.943015, -5.86148,
-1, -2.798534, -5.56735,
-1, -2.943015, -5.86148,
0, -2.798534, -5.56735,
0, -2.943015, -5.86148,
1, -2.798534, -5.56735,
1, -2.943015, -5.86148,
2, -2.798534, -5.56735,
2, -2.943015, -5.86148,
3, -2.798534, -5.56735,
3, -2.943015, -5.86148
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
-3, -3.231978, -6.44974, 0, -0.5, 0.5, 0.5,
-3, -3.231978, -6.44974, 1, -0.5, 0.5, 0.5,
-3, -3.231978, -6.44974, 1, 1.5, 0.5, 0.5,
-3, -3.231978, -6.44974, 0, 1.5, 0.5, 0.5,
-2, -3.231978, -6.44974, 0, -0.5, 0.5, 0.5,
-2, -3.231978, -6.44974, 1, -0.5, 0.5, 0.5,
-2, -3.231978, -6.44974, 1, 1.5, 0.5, 0.5,
-2, -3.231978, -6.44974, 0, 1.5, 0.5, 0.5,
-1, -3.231978, -6.44974, 0, -0.5, 0.5, 0.5,
-1, -3.231978, -6.44974, 1, -0.5, 0.5, 0.5,
-1, -3.231978, -6.44974, 1, 1.5, 0.5, 0.5,
-1, -3.231978, -6.44974, 0, 1.5, 0.5, 0.5,
0, -3.231978, -6.44974, 0, -0.5, 0.5, 0.5,
0, -3.231978, -6.44974, 1, -0.5, 0.5, 0.5,
0, -3.231978, -6.44974, 1, 1.5, 0.5, 0.5,
0, -3.231978, -6.44974, 0, 1.5, 0.5, 0.5,
1, -3.231978, -6.44974, 0, -0.5, 0.5, 0.5,
1, -3.231978, -6.44974, 1, -0.5, 0.5, 0.5,
1, -3.231978, -6.44974, 1, 1.5, 0.5, 0.5,
1, -3.231978, -6.44974, 0, 1.5, 0.5, 0.5,
2, -3.231978, -6.44974, 0, -0.5, 0.5, 0.5,
2, -3.231978, -6.44974, 1, -0.5, 0.5, 0.5,
2, -3.231978, -6.44974, 1, 1.5, 0.5, 0.5,
2, -3.231978, -6.44974, 0, 1.5, 0.5, 0.5,
3, -3.231978, -6.44974, 0, -0.5, 0.5, 0.5,
3, -3.231978, -6.44974, 1, -0.5, 0.5, 0.5,
3, -3.231978, -6.44974, 1, 1.5, 0.5, 0.5,
3, -3.231978, -6.44974, 0, 1.5, 0.5, 0.5
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
-3.459255, -2, -5.56735,
-3.459255, 2, -5.56735,
-3.459255, -2, -5.56735,
-3.626749, -2, -5.86148,
-3.459255, -1, -5.56735,
-3.626749, -1, -5.86148,
-3.459255, 0, -5.56735,
-3.626749, 0, -5.86148,
-3.459255, 1, -5.56735,
-3.626749, 1, -5.86148,
-3.459255, 2, -5.56735,
-3.626749, 2, -5.86148
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
-3.961735, -2, -6.44974, 0, -0.5, 0.5, 0.5,
-3.961735, -2, -6.44974, 1, -0.5, 0.5, 0.5,
-3.961735, -2, -6.44974, 1, 1.5, 0.5, 0.5,
-3.961735, -2, -6.44974, 0, 1.5, 0.5, 0.5,
-3.961735, -1, -6.44974, 0, -0.5, 0.5, 0.5,
-3.961735, -1, -6.44974, 1, -0.5, 0.5, 0.5,
-3.961735, -1, -6.44974, 1, 1.5, 0.5, 0.5,
-3.961735, -1, -6.44974, 0, 1.5, 0.5, 0.5,
-3.961735, 0, -6.44974, 0, -0.5, 0.5, 0.5,
-3.961735, 0, -6.44974, 1, -0.5, 0.5, 0.5,
-3.961735, 0, -6.44974, 1, 1.5, 0.5, 0.5,
-3.961735, 0, -6.44974, 0, 1.5, 0.5, 0.5,
-3.961735, 1, -6.44974, 0, -0.5, 0.5, 0.5,
-3.961735, 1, -6.44974, 1, -0.5, 0.5, 0.5,
-3.961735, 1, -6.44974, 1, 1.5, 0.5, 0.5,
-3.961735, 1, -6.44974, 0, 1.5, 0.5, 0.5,
-3.961735, 2, -6.44974, 0, -0.5, 0.5, 0.5,
-3.961735, 2, -6.44974, 1, -0.5, 0.5, 0.5,
-3.961735, 2, -6.44974, 1, 1.5, 0.5, 0.5,
-3.961735, 2, -6.44974, 0, 1.5, 0.5, 0.5
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
-3.459255, -2.798534, -4,
-3.459255, -2.798534, 6,
-3.459255, -2.798534, -4,
-3.626749, -2.943015, -4,
-3.459255, -2.798534, -2,
-3.626749, -2.943015, -2,
-3.459255, -2.798534, 0,
-3.626749, -2.943015, 0,
-3.459255, -2.798534, 2,
-3.626749, -2.943015, 2,
-3.459255, -2.798534, 4,
-3.626749, -2.943015, 4,
-3.459255, -2.798534, 6,
-3.626749, -2.943015, 6
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
"4",
"6"
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
-3.961735, -3.231978, -4, 0, -0.5, 0.5, 0.5,
-3.961735, -3.231978, -4, 1, -0.5, 0.5, 0.5,
-3.961735, -3.231978, -4, 1, 1.5, 0.5, 0.5,
-3.961735, -3.231978, -4, 0, 1.5, 0.5, 0.5,
-3.961735, -3.231978, -2, 0, -0.5, 0.5, 0.5,
-3.961735, -3.231978, -2, 1, -0.5, 0.5, 0.5,
-3.961735, -3.231978, -2, 1, 1.5, 0.5, 0.5,
-3.961735, -3.231978, -2, 0, 1.5, 0.5, 0.5,
-3.961735, -3.231978, 0, 0, -0.5, 0.5, 0.5,
-3.961735, -3.231978, 0, 1, -0.5, 0.5, 0.5,
-3.961735, -3.231978, 0, 1, 1.5, 0.5, 0.5,
-3.961735, -3.231978, 0, 0, 1.5, 0.5, 0.5,
-3.961735, -3.231978, 2, 0, -0.5, 0.5, 0.5,
-3.961735, -3.231978, 2, 1, -0.5, 0.5, 0.5,
-3.961735, -3.231978, 2, 1, 1.5, 0.5, 0.5,
-3.961735, -3.231978, 2, 0, 1.5, 0.5, 0.5,
-3.961735, -3.231978, 4, 0, -0.5, 0.5, 0.5,
-3.961735, -3.231978, 4, 1, -0.5, 0.5, 0.5,
-3.961735, -3.231978, 4, 1, 1.5, 0.5, 0.5,
-3.961735, -3.231978, 4, 0, 1.5, 0.5, 0.5,
-3.961735, -3.231978, 6, 0, -0.5, 0.5, 0.5,
-3.961735, -3.231978, 6, 1, -0.5, 0.5, 0.5,
-3.961735, -3.231978, 6, 1, 1.5, 0.5, 0.5,
-3.961735, -3.231978, 6, 0, 1.5, 0.5, 0.5
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
-3.459255, -2.798534, -5.56735,
-3.459255, 2.980729, -5.56735,
-3.459255, -2.798534, 6.197842,
-3.459255, 2.980729, 6.197842,
-3.459255, -2.798534, -5.56735,
-3.459255, -2.798534, 6.197842,
-3.459255, 2.980729, -5.56735,
-3.459255, 2.980729, 6.197842,
-3.459255, -2.798534, -5.56735,
3.240465, -2.798534, -5.56735,
-3.459255, -2.798534, 6.197842,
3.240465, -2.798534, 6.197842,
-3.459255, 2.980729, -5.56735,
3.240465, 2.980729, -5.56735,
-3.459255, 2.980729, 6.197842,
3.240465, 2.980729, 6.197842,
3.240465, -2.798534, -5.56735,
3.240465, 2.980729, -5.56735,
3.240465, -2.798534, 6.197842,
3.240465, 2.980729, 6.197842,
3.240465, -2.798534, -5.56735,
3.240465, -2.798534, 6.197842,
3.240465, 2.980729, -5.56735,
3.240465, 2.980729, 6.197842
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
var radius = 7.860692;
var distance = 34.97311;
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
mvMatrix.translate( 0.1093954, -0.09109759, -0.3152459 );
mvMatrix.scale( 1.268581, 1.470626, 0.7223966 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.97311);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
diazosulfonate<-read.table("diazosulfonate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-diazosulfonate$V2
```

```
## Error in eval(expr, envir, enclos): object 'diazosulfonate' not found
```

```r
y<-diazosulfonate$V3
```

```
## Error in eval(expr, envir, enclos): object 'diazosulfonate' not found
```

```r
z<-diazosulfonate$V4
```

```
## Error in eval(expr, envir, enclos): object 'diazosulfonate' not found
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
-3.361687, 0.2061666, 0.437002, 0, 0, 1, 1, 1,
-3.087788, -1.897091, -2.243428, 1, 0, 0, 1, 1,
-2.804695, -1.813314, -2.782299, 1, 0, 0, 1, 1,
-2.662637, 1.074903, -0.08150192, 1, 0, 0, 1, 1,
-2.627833, -1.266832, -1.195072, 1, 0, 0, 1, 1,
-2.581239, -0.8139601, -2.243126, 1, 0, 0, 1, 1,
-2.551694, 1.399022, -1.985443, 0, 0, 0, 1, 1,
-2.544314, -0.1188722, -1.498134, 0, 0, 0, 1, 1,
-2.46463, -1.030429, -0.800784, 0, 0, 0, 1, 1,
-2.435753, 0.8484434, 0.05002854, 0, 0, 0, 1, 1,
-2.423173, -1.044532, -2.039024, 0, 0, 0, 1, 1,
-2.19173, -1.496906, -1.385895, 0, 0, 0, 1, 1,
-2.168768, 0.0340217, -1.97585, 0, 0, 0, 1, 1,
-2.165578, -0.1377807, -2.800086, 1, 1, 1, 1, 1,
-2.142548, -0.1062507, -3.177432, 1, 1, 1, 1, 1,
-2.138805, -1.384193, -2.105438, 1, 1, 1, 1, 1,
-2.119121, 0.03540009, -2.184023, 1, 1, 1, 1, 1,
-2.103307, 0.02185838, -0.7587639, 1, 1, 1, 1, 1,
-2.082077, 1.526457, 0.3244773, 1, 1, 1, 1, 1,
-2.002771, -0.4734708, -2.26336, 1, 1, 1, 1, 1,
-1.99543, 1.329813, -1.624431, 1, 1, 1, 1, 1,
-1.977998, 0.3463631, -1.260936, 1, 1, 1, 1, 1,
-1.97745, -0.8317854, -1.20518, 1, 1, 1, 1, 1,
-1.960303, 1.942768, -1.058278, 1, 1, 1, 1, 1,
-1.933532, 1.178117, -2.182385, 1, 1, 1, 1, 1,
-1.930863, -1.614524, -2.926546, 1, 1, 1, 1, 1,
-1.858835, -1.047767, -3.761315, 1, 1, 1, 1, 1,
-1.857651, -0.1875983, -0.1353503, 1, 1, 1, 1, 1,
-1.855618, 1.865313, -0.2309229, 0, 0, 1, 1, 1,
-1.845962, -0.941099, -2.535906, 1, 0, 0, 1, 1,
-1.828063, 1.279609, 0.1177423, 1, 0, 0, 1, 1,
-1.808868, -0.8218225, -2.393471, 1, 0, 0, 1, 1,
-1.800984, -0.4453131, -2.408226, 1, 0, 0, 1, 1,
-1.796762, -2.308725, -3.299211, 1, 0, 0, 1, 1,
-1.792552, -0.485185, -3.227981, 0, 0, 0, 1, 1,
-1.781445, -0.9234906, -3.720774, 0, 0, 0, 1, 1,
-1.780917, -0.5312021, -0.9973298, 0, 0, 0, 1, 1,
-1.778701, -2.074098, -2.73352, 0, 0, 0, 1, 1,
-1.757929, -0.4369422, -1.478811, 0, 0, 0, 1, 1,
-1.744767, -2.021293, -1.5907, 0, 0, 0, 1, 1,
-1.734917, -0.9024984, -2.684735, 0, 0, 0, 1, 1,
-1.722496, 0.8538233, -1.245366, 1, 1, 1, 1, 1,
-1.720683, 0.6496699, -2.332663, 1, 1, 1, 1, 1,
-1.670776, 0.3986478, -2.694144, 1, 1, 1, 1, 1,
-1.663303, -0.5076105, -2.51673, 1, 1, 1, 1, 1,
-1.616664, 0.6348265, 0.3366204, 1, 1, 1, 1, 1,
-1.604222, -0.3571566, -3.50356, 1, 1, 1, 1, 1,
-1.59175, 0.6900943, -2.150864, 1, 1, 1, 1, 1,
-1.585277, 0.6790309, -0.8119333, 1, 1, 1, 1, 1,
-1.567437, 1.834515, -1.665231, 1, 1, 1, 1, 1,
-1.551232, 0.3349835, -0.8921676, 1, 1, 1, 1, 1,
-1.545911, 0.3907613, -0.9445283, 1, 1, 1, 1, 1,
-1.537527, -1.185157, -2.90386, 1, 1, 1, 1, 1,
-1.535845, -1.321455, -2.095324, 1, 1, 1, 1, 1,
-1.523692, 0.5530647, -2.046115, 1, 1, 1, 1, 1,
-1.518178, 0.05849779, -3.273024, 1, 1, 1, 1, 1,
-1.499586, -0.4449356, -2.156612, 0, 0, 1, 1, 1,
-1.496456, 0.08510907, -0.8814479, 1, 0, 0, 1, 1,
-1.485114, 1.396026, -1.1129, 1, 0, 0, 1, 1,
-1.468614, -1.710573, -1.507797, 1, 0, 0, 1, 1,
-1.466666, -0.7670411, -3.035295, 1, 0, 0, 1, 1,
-1.445221, 0.2037747, -0.8871124, 1, 0, 0, 1, 1,
-1.436788, -0.5549194, -2.263334, 0, 0, 0, 1, 1,
-1.435334, -0.6941035, -2.251347, 0, 0, 0, 1, 1,
-1.435021, -0.8926245, -2.713076, 0, 0, 0, 1, 1,
-1.413342, 1.497958, -1.2428, 0, 0, 0, 1, 1,
-1.407153, 0.6359406, -1.541449, 0, 0, 0, 1, 1,
-1.404703, 0.5411709, -0.9272333, 0, 0, 0, 1, 1,
-1.400539, -0.9912868, -2.764644, 0, 0, 0, 1, 1,
-1.388004, 0.8005534, -0.8912274, 1, 1, 1, 1, 1,
-1.387115, 0.03705639, -3.177721, 1, 1, 1, 1, 1,
-1.377331, 0.6855617, -1.962113, 1, 1, 1, 1, 1,
-1.349728, 0.580785, -1.861536, 1, 1, 1, 1, 1,
-1.33974, 0.9856866, -1.38478, 1, 1, 1, 1, 1,
-1.334075, -1.477125, -2.752821, 1, 1, 1, 1, 1,
-1.325011, -0.7853109, -1.693823, 1, 1, 1, 1, 1,
-1.324923, -1.043246, -1.220531, 1, 1, 1, 1, 1,
-1.318743, -1.023348, -2.211748, 1, 1, 1, 1, 1,
-1.317044, -0.5134506, -2.315152, 1, 1, 1, 1, 1,
-1.315768, 1.109145, -0.9149861, 1, 1, 1, 1, 1,
-1.309529, -1.499589, -2.86256, 1, 1, 1, 1, 1,
-1.300091, 0.648975, -0.3537491, 1, 1, 1, 1, 1,
-1.296151, 1.560761, -1.145023, 1, 1, 1, 1, 1,
-1.278818, -0.3877974, -1.240652, 1, 1, 1, 1, 1,
-1.271963, 0.7631436, -2.197031, 0, 0, 1, 1, 1,
-1.247319, -0.6614754, -1.290902, 1, 0, 0, 1, 1,
-1.234553, 0.2469381, -1.363568, 1, 0, 0, 1, 1,
-1.226224, 1.280913, -1.320045, 1, 0, 0, 1, 1,
-1.21226, -1.221916, -1.528821, 1, 0, 0, 1, 1,
-1.203225, 1.165447, -0.4927211, 1, 0, 0, 1, 1,
-1.196914, 1.125704, 0.5437519, 0, 0, 0, 1, 1,
-1.195648, 0.5134136, -1.187441, 0, 0, 0, 1, 1,
-1.193967, -0.2931588, -1.537105, 0, 0, 0, 1, 1,
-1.190633, -0.3728203, -2.879176, 0, 0, 0, 1, 1,
-1.182579, -0.4254382, -1.815803, 0, 0, 0, 1, 1,
-1.18169, 0.7790186, -1.445863, 0, 0, 0, 1, 1,
-1.169331, 0.7344689, -0.696268, 0, 0, 0, 1, 1,
-1.162357, 2.376583, -1.399189, 1, 1, 1, 1, 1,
-1.157412, -0.1741113, -0.4417041, 1, 1, 1, 1, 1,
-1.152985, -0.4109397, -2.042626, 1, 1, 1, 1, 1,
-1.142797, -1.80299, -2.408929, 1, 1, 1, 1, 1,
-1.131007, -0.7121262, -1.227005, 1, 1, 1, 1, 1,
-1.13095, -1.045743, -3.29912, 1, 1, 1, 1, 1,
-1.127235, -0.05137414, -0.9253544, 1, 1, 1, 1, 1,
-1.115296, 0.0511843, -1.166359, 1, 1, 1, 1, 1,
-1.112924, -1.771062, -0.5908184, 1, 1, 1, 1, 1,
-1.10958, 0.1522191, -0.9050957, 1, 1, 1, 1, 1,
-1.106506, -1.550184, -1.820671, 1, 1, 1, 1, 1,
-1.105536, -0.1660728, -0.8128216, 1, 1, 1, 1, 1,
-1.099168, 0.4549763, -0.8807895, 1, 1, 1, 1, 1,
-1.089361, 1.099128, -2.402018, 1, 1, 1, 1, 1,
-1.078362, -1.13481, -1.986266, 1, 1, 1, 1, 1,
-1.073715, 0.7257442, -2.614188, 0, 0, 1, 1, 1,
-1.071564, 1.090896, -0.6686851, 1, 0, 0, 1, 1,
-1.068648, 0.3693869, -0.2972631, 1, 0, 0, 1, 1,
-1.067291, 0.5723099, -0.4478687, 1, 0, 0, 1, 1,
-1.056781, -1.116571, -2.681418, 1, 0, 0, 1, 1,
-1.055738, -1.235181, -2.437109, 1, 0, 0, 1, 1,
-1.05104, 1.441492, -1.105599, 0, 0, 0, 1, 1,
-1.050561, -0.9773695, -1.438745, 0, 0, 0, 1, 1,
-1.050252, -0.8207884, -2.293041, 0, 0, 0, 1, 1,
-1.045746, 0.9162727, -1.914698, 0, 0, 0, 1, 1,
-1.036512, 0.03766439, -2.302604, 0, 0, 0, 1, 1,
-1.035557, -0.2578844, -3.832263, 0, 0, 0, 1, 1,
-1.028573, 0.9176247, -0.3791319, 0, 0, 0, 1, 1,
-1.027558, -0.2909638, 0.4921098, 1, 1, 1, 1, 1,
-1.020227, -1.926409, -2.531814, 1, 1, 1, 1, 1,
-1.003697, -1.74161, -2.987159, 1, 1, 1, 1, 1,
-1.002545, -1.148267, -1.698827, 1, 1, 1, 1, 1,
-0.9996597, -0.009594735, -2.031982, 1, 1, 1, 1, 1,
-0.9858365, -0.04984981, -2.082276, 1, 1, 1, 1, 1,
-0.9854652, -2.198649, -1.896379, 1, 1, 1, 1, 1,
-0.9838924, -0.1984322, -0.421113, 1, 1, 1, 1, 1,
-0.9750988, 0.09006099, -2.54358, 1, 1, 1, 1, 1,
-0.9733504, 0.7091712, -0.02456592, 1, 1, 1, 1, 1,
-0.9709074, 1.020619, -0.9188749, 1, 1, 1, 1, 1,
-0.9541678, 0.2437308, 0.8160732, 1, 1, 1, 1, 1,
-0.9532572, 0.3838224, -2.551326, 1, 1, 1, 1, 1,
-0.9529733, -0.9890996, -2.503268, 1, 1, 1, 1, 1,
-0.9507181, 0.1208961, -3.050288, 1, 1, 1, 1, 1,
-0.949752, -0.2450477, -1.085136, 0, 0, 1, 1, 1,
-0.9497351, 1.007914, -0.679781, 1, 0, 0, 1, 1,
-0.9412299, -0.9373475, -1.50154, 1, 0, 0, 1, 1,
-0.9406408, 0.5302929, -1.285544, 1, 0, 0, 1, 1,
-0.9385476, 1.773011, -1.150976, 1, 0, 0, 1, 1,
-0.9239796, 0.6590961, -1.232947, 1, 0, 0, 1, 1,
-0.9230465, -1.080234, -2.347757, 0, 0, 0, 1, 1,
-0.9143503, 0.3193697, -0.05610277, 0, 0, 0, 1, 1,
-0.9107698, 2.431446, 0.1042072, 0, 0, 0, 1, 1,
-0.9097816, -0.3781099, -2.447605, 0, 0, 0, 1, 1,
-0.9061659, 0.5049421, -0.7632869, 0, 0, 0, 1, 1,
-0.8990016, -0.4885197, -2.418818, 0, 0, 0, 1, 1,
-0.8987707, -0.875855, -1.514008, 0, 0, 0, 1, 1,
-0.8941875, -0.1512736, 1.103566, 1, 1, 1, 1, 1,
-0.8847536, -0.2446213, -1.218222, 1, 1, 1, 1, 1,
-0.8842287, -0.4397293, -2.606829, 1, 1, 1, 1, 1,
-0.8832497, -1.271835, -2.839417, 1, 1, 1, 1, 1,
-0.8782511, -1.674688, -3.538676, 1, 1, 1, 1, 1,
-0.8751363, -0.1623206, -1.465196, 1, 1, 1, 1, 1,
-0.8730636, 0.1799871, -2.0339, 1, 1, 1, 1, 1,
-0.868018, 0.2289342, -0.3763326, 1, 1, 1, 1, 1,
-0.862725, 1.207242, -1.67562, 1, 1, 1, 1, 1,
-0.8562224, 1.972956, 0.8560163, 1, 1, 1, 1, 1,
-0.8537494, 0.6839565, -0.6238303, 1, 1, 1, 1, 1,
-0.8515218, -1.027195, -2.348336, 1, 1, 1, 1, 1,
-0.8435, -0.6070793, -3.248068, 1, 1, 1, 1, 1,
-0.8411921, -0.5422969, -2.21555, 1, 1, 1, 1, 1,
-0.8403433, -0.9904665, -2.93833, 1, 1, 1, 1, 1,
-0.8394328, 0.5741412, 0.3132888, 0, 0, 1, 1, 1,
-0.8322825, -1.114398, -2.904366, 1, 0, 0, 1, 1,
-0.8312719, 0.09465408, -3.487984, 1, 0, 0, 1, 1,
-0.8243906, 0.1525539, -1.302629, 1, 0, 0, 1, 1,
-0.8178512, -0.00686704, -0.09987636, 1, 0, 0, 1, 1,
-0.8112103, 0.150324, -1.991699, 1, 0, 0, 1, 1,
-0.801305, -0.7069138, -4.377679, 0, 0, 0, 1, 1,
-0.8006043, -0.876897, -3.434906, 0, 0, 0, 1, 1,
-0.7909537, 0.9517599, 0.461394, 0, 0, 0, 1, 1,
-0.7881691, -0.533885, -2.342248, 0, 0, 0, 1, 1,
-0.784085, -0.8142023, -2.007812, 0, 0, 0, 1, 1,
-0.7809094, 0.1123038, -2.488432, 0, 0, 0, 1, 1,
-0.7793759, -0.2685583, -2.252129, 0, 0, 0, 1, 1,
-0.7743996, -0.6805519, -3.074625, 1, 1, 1, 1, 1,
-0.7725039, -1.539749, -3.266637, 1, 1, 1, 1, 1,
-0.7714542, -1.357415, -3.70849, 1, 1, 1, 1, 1,
-0.7712428, -0.2452929, -0.4947542, 1, 1, 1, 1, 1,
-0.7709415, 2.516308, 1.020784, 1, 1, 1, 1, 1,
-0.76595, -0.8318554, -3.125465, 1, 1, 1, 1, 1,
-0.7620863, -1.182181, -2.57356, 1, 1, 1, 1, 1,
-0.7619957, -1.929032, -3.62424, 1, 1, 1, 1, 1,
-0.7531673, -1.134092, -2.759722, 1, 1, 1, 1, 1,
-0.7529782, -1.841893, -4.255722, 1, 1, 1, 1, 1,
-0.752229, 0.02016192, -1.836859, 1, 1, 1, 1, 1,
-0.7521931, -1.4255, -2.564234, 1, 1, 1, 1, 1,
-0.7517022, 0.9102896, -0.5562827, 1, 1, 1, 1, 1,
-0.7449415, 1.149252, -2.446076, 1, 1, 1, 1, 1,
-0.7425486, -0.5389059, -0.6725677, 1, 1, 1, 1, 1,
-0.7401215, 1.611789, -0.4051401, 0, 0, 1, 1, 1,
-0.7381708, 0.8785202, 1.053689, 1, 0, 0, 1, 1,
-0.7273145, -1.367408, -2.691099, 1, 0, 0, 1, 1,
-0.7238929, 1.302768, 1.429678, 1, 0, 0, 1, 1,
-0.7228396, -0.1389719, -1.296748, 1, 0, 0, 1, 1,
-0.7214743, 0.5409529, -1.055576, 1, 0, 0, 1, 1,
-0.7167237, -0.8089116, -2.849436, 0, 0, 0, 1, 1,
-0.7108251, -1.332618, -2.801883, 0, 0, 0, 1, 1,
-0.7071497, -0.6330924, -2.062466, 0, 0, 0, 1, 1,
-0.7062141, 0.8886656, -0.1780662, 0, 0, 0, 1, 1,
-0.6984504, 0.0718493, -0.4136564, 0, 0, 0, 1, 1,
-0.6886479, 0.1868863, -1.576489, 0, 0, 0, 1, 1,
-0.6865273, -0.5283912, -3.048425, 0, 0, 0, 1, 1,
-0.6822007, 0.9568105, -0.9620857, 1, 1, 1, 1, 1,
-0.6814836, -0.2027793, -0.5436741, 1, 1, 1, 1, 1,
-0.6809239, -0.5598814, -3.057039, 1, 1, 1, 1, 1,
-0.680528, 0.1442426, -1.826981, 1, 1, 1, 1, 1,
-0.678551, 0.4106548, -0.09486752, 1, 1, 1, 1, 1,
-0.6773555, -0.4634535, -3.697371, 1, 1, 1, 1, 1,
-0.6766612, 0.007835883, -2.194205, 1, 1, 1, 1, 1,
-0.6721773, -0.01142387, -2.237125, 1, 1, 1, 1, 1,
-0.6703858, 0.6910944, 1.533251, 1, 1, 1, 1, 1,
-0.6591599, -0.5818346, -2.737485, 1, 1, 1, 1, 1,
-0.65882, 1.891098, -1.273331, 1, 1, 1, 1, 1,
-0.6566586, 0.4359417, -2.592798, 1, 1, 1, 1, 1,
-0.6542136, 0.6900218, -1.521131, 1, 1, 1, 1, 1,
-0.6537114, 0.4427995, -1.209166, 1, 1, 1, 1, 1,
-0.6521178, -0.9954103, -3.306699, 1, 1, 1, 1, 1,
-0.6519894, 0.6501469, -0.5988262, 0, 0, 1, 1, 1,
-0.6500734, -0.9690312, -3.392064, 1, 0, 0, 1, 1,
-0.6469299, -0.735213, -5.016631, 1, 0, 0, 1, 1,
-0.6421733, 1.274547, -1.675776, 1, 0, 0, 1, 1,
-0.6409338, 0.4388312, -1.065898, 1, 0, 0, 1, 1,
-0.6354429, -1.681868, -2.031312, 1, 0, 0, 1, 1,
-0.6351862, -0.197381, -3.218686, 0, 0, 0, 1, 1,
-0.634802, -0.134954, -2.227222, 0, 0, 0, 1, 1,
-0.6346483, -0.5364454, -2.185818, 0, 0, 0, 1, 1,
-0.6344219, 0.8953254, -0.3059649, 0, 0, 0, 1, 1,
-0.6327831, -0.1514609, -1.979239, 0, 0, 0, 1, 1,
-0.6306052, 0.4090907, -1.035162, 0, 0, 0, 1, 1,
-0.6242641, -1.891237, -2.851503, 0, 0, 0, 1, 1,
-0.6215965, -1.219679, -2.095329, 1, 1, 1, 1, 1,
-0.6212758, -0.03971345, -1.876039, 1, 1, 1, 1, 1,
-0.6163821, 0.6312386, -1.636788, 1, 1, 1, 1, 1,
-0.6138746, -0.8373308, -1.215647, 1, 1, 1, 1, 1,
-0.6106983, -0.0757138, -2.030562, 1, 1, 1, 1, 1,
-0.6085768, -0.4714037, -4.097976, 1, 1, 1, 1, 1,
-0.6052567, 2.368224, -1.548985, 1, 1, 1, 1, 1,
-0.6009024, 1.240025, 1.13831, 1, 1, 1, 1, 1,
-0.5912072, 0.1658147, -0.1407498, 1, 1, 1, 1, 1,
-0.5896624, 0.0487669, -1.132477, 1, 1, 1, 1, 1,
-0.5875135, -1.134685, -2.017621, 1, 1, 1, 1, 1,
-0.5864264, 0.1075934, -2.245233, 1, 1, 1, 1, 1,
-0.5796728, -1.844316, -1.537381, 1, 1, 1, 1, 1,
-0.576221, -0.5785266, -2.276016, 1, 1, 1, 1, 1,
-0.57074, 0.5843279, -0.8185543, 1, 1, 1, 1, 1,
-0.5685771, -0.7533655, -1.827084, 0, 0, 1, 1, 1,
-0.5667118, -0.3885385, -1.066037, 1, 0, 0, 1, 1,
-0.5621248, 0.1393697, -1.409517, 1, 0, 0, 1, 1,
-0.5598376, -0.5680773, -2.401014, 1, 0, 0, 1, 1,
-0.5579769, 0.523513, -1.396944, 1, 0, 0, 1, 1,
-0.5571764, -0.9285833, -2.781211, 1, 0, 0, 1, 1,
-0.5562944, -1.357346, -1.971481, 0, 0, 0, 1, 1,
-0.5550374, -0.4309483, -3.597894, 0, 0, 0, 1, 1,
-0.5525724, 0.5535046, -1.22385, 0, 0, 0, 1, 1,
-0.5524616, -0.1086235, -1.785011, 0, 0, 0, 1, 1,
-0.5471382, -0.6830236, -3.450706, 0, 0, 0, 1, 1,
-0.5449039, -0.1868133, -0.4621606, 0, 0, 0, 1, 1,
-0.5430973, -0.1197482, -3.680091, 0, 0, 0, 1, 1,
-0.5403964, 1.076437, -0.6842448, 1, 1, 1, 1, 1,
-0.5387137, 0.4484214, -3.858692, 1, 1, 1, 1, 1,
-0.537047, 0.08978187, 0.800881, 1, 1, 1, 1, 1,
-0.5276406, -0.7104794, -1.742995, 1, 1, 1, 1, 1,
-0.5242923, -0.6399596, -2.102526, 1, 1, 1, 1, 1,
-0.5184169, -1.336984, -2.882864, 1, 1, 1, 1, 1,
-0.5147035, 1.019162, -0.4018994, 1, 1, 1, 1, 1,
-0.5140995, 0.7939733, 1.186945, 1, 1, 1, 1, 1,
-0.5123373, 0.7000191, -0.976094, 1, 1, 1, 1, 1,
-0.5119158, -1.122076, -3.609601, 1, 1, 1, 1, 1,
-0.5116203, -0.5544833, -2.60219, 1, 1, 1, 1, 1,
-0.5112894, 0.4065281, -1.746746, 1, 1, 1, 1, 1,
-0.5099305, 0.677429, -0.05380786, 1, 1, 1, 1, 1,
-0.5097509, -1.16129, -2.452284, 1, 1, 1, 1, 1,
-0.5095725, -0.1221669, -2.086431, 1, 1, 1, 1, 1,
-0.507935, 0.09169316, 0.2704182, 0, 0, 1, 1, 1,
-0.5074747, -0.1364823, -1.692966, 1, 0, 0, 1, 1,
-0.5023149, -0.5695049, -1.330023, 1, 0, 0, 1, 1,
-0.4966686, 1.383294, 1.21048, 1, 0, 0, 1, 1,
-0.4902462, -0.8457704, -1.160152, 1, 0, 0, 1, 1,
-0.4870934, 0.2456831, 0.8857651, 1, 0, 0, 1, 1,
-0.4864011, 1.665377, 0.2494382, 0, 0, 0, 1, 1,
-0.4851683, 0.699959, -1.414289, 0, 0, 0, 1, 1,
-0.4824827, 0.2255972, 0.1620819, 0, 0, 0, 1, 1,
-0.4741918, 0.5177257, -0.865153, 0, 0, 0, 1, 1,
-0.4715854, 1.057409, -0.3922999, 0, 0, 0, 1, 1,
-0.4690398, -1.20863, -3.61854, 0, 0, 0, 1, 1,
-0.4653917, -0.07995914, -0.7751883, 0, 0, 0, 1, 1,
-0.4609199, -0.7255913, -2.307236, 1, 1, 1, 1, 1,
-0.4562925, 0.9650355, 0.920159, 1, 1, 1, 1, 1,
-0.4562424, -0.3897545, -3.305922, 1, 1, 1, 1, 1,
-0.4555587, 0.7145694, -0.3751979, 1, 1, 1, 1, 1,
-0.4532191, -0.7000232, -3.11523, 1, 1, 1, 1, 1,
-0.4524794, -2.065351, -3.56914, 1, 1, 1, 1, 1,
-0.4512018, -1.051602, -1.891695, 1, 1, 1, 1, 1,
-0.4505574, 2.091162, -1.336508, 1, 1, 1, 1, 1,
-0.4502142, 0.3493653, -1.548919, 1, 1, 1, 1, 1,
-0.4467065, 0.962871, -0.5802479, 1, 1, 1, 1, 1,
-0.4404554, 0.3008199, -1.465103, 1, 1, 1, 1, 1,
-0.4377044, 1.053357, 0.2770621, 1, 1, 1, 1, 1,
-0.4375187, -0.06493814, -2.149858, 1, 1, 1, 1, 1,
-0.4366907, -1.277685, -3.363256, 1, 1, 1, 1, 1,
-0.4348012, 0.04339753, -1.254366, 1, 1, 1, 1, 1,
-0.4338835, 0.5529365, 1.240272, 0, 0, 1, 1, 1,
-0.4321944, 1.51423, 0.1684804, 1, 0, 0, 1, 1,
-0.4286888, 0.9347937, 0.9553955, 1, 0, 0, 1, 1,
-0.4273512, -0.5187012, -2.725021, 1, 0, 0, 1, 1,
-0.4226995, 0.5025836, -2.208052, 1, 0, 0, 1, 1,
-0.4193379, 0.2456785, -2.275371, 1, 0, 0, 1, 1,
-0.4161272, -0.4201208, 0.3008952, 0, 0, 0, 1, 1,
-0.4107512, 0.898965, -1.668866, 0, 0, 0, 1, 1,
-0.3972798, -0.6702924, -3.24414, 0, 0, 0, 1, 1,
-0.3966484, -1.015766, -4.337445, 0, 0, 0, 1, 1,
-0.3934449, 0.851345, 0.08510514, 0, 0, 0, 1, 1,
-0.3920705, 0.2552342, -0.9173042, 0, 0, 0, 1, 1,
-0.3909248, 0.3829449, -1.083383, 0, 0, 0, 1, 1,
-0.3902918, 0.8671604, 0.2860002, 1, 1, 1, 1, 1,
-0.388085, 0.4258047, -1.53666, 1, 1, 1, 1, 1,
-0.387142, -0.08822945, -2.864555, 1, 1, 1, 1, 1,
-0.3807859, -0.8995947, -3.120707, 1, 1, 1, 1, 1,
-0.3786718, 0.8976415, -0.1738701, 1, 1, 1, 1, 1,
-0.378441, -0.1102251, -3.125451, 1, 1, 1, 1, 1,
-0.3774373, -0.869041, -1.967838, 1, 1, 1, 1, 1,
-0.3760008, -1.154574, -3.746627, 1, 1, 1, 1, 1,
-0.3692244, -1.523517, -3.142718, 1, 1, 1, 1, 1,
-0.369029, 0.4174418, -0.9012136, 1, 1, 1, 1, 1,
-0.3642203, -1.542147, -2.712304, 1, 1, 1, 1, 1,
-0.3624811, -0.8065241, -1.069016, 1, 1, 1, 1, 1,
-0.3622098, 1.529625, -0.1862553, 1, 1, 1, 1, 1,
-0.3591405, 0.6188534, -0.2507547, 1, 1, 1, 1, 1,
-0.3532318, 0.5855947, 0.3493736, 1, 1, 1, 1, 1,
-0.3530761, -0.3964779, -2.931612, 0, 0, 1, 1, 1,
-0.3522035, -1.035489, -2.607073, 1, 0, 0, 1, 1,
-0.351675, 1.408289, 0.6473567, 1, 0, 0, 1, 1,
-0.3490161, -1.645385, -3.928101, 1, 0, 0, 1, 1,
-0.3489033, -0.1086643, -1.284277, 1, 0, 0, 1, 1,
-0.3463803, -1.873108, -3.566708, 1, 0, 0, 1, 1,
-0.3437895, -0.2051727, -3.419489, 0, 0, 0, 1, 1,
-0.3413453, 0.01952234, -1.547196, 0, 0, 0, 1, 1,
-0.341265, -0.5425813, -1.750586, 0, 0, 0, 1, 1,
-0.341209, -1.103139, -3.498134, 0, 0, 0, 1, 1,
-0.33615, -0.4434749, -1.465526, 0, 0, 0, 1, 1,
-0.3326465, -2.296662, -3.368233, 0, 0, 0, 1, 1,
-0.332037, 0.424971, 0.3287262, 0, 0, 0, 1, 1,
-0.3271761, -0.6122162, -2.064193, 1, 1, 1, 1, 1,
-0.325884, 0.3290185, -1.59902, 1, 1, 1, 1, 1,
-0.3227734, -2.207614, -5.093836, 1, 1, 1, 1, 1,
-0.3225616, 0.3862454, -0.4123122, 1, 1, 1, 1, 1,
-0.3202708, -0.3944895, -3.809077, 1, 1, 1, 1, 1,
-0.3199006, -0.6617952, -3.112422, 1, 1, 1, 1, 1,
-0.317524, -0.05110415, -3.816084, 1, 1, 1, 1, 1,
-0.312008, -0.7711961, -3.677608, 1, 1, 1, 1, 1,
-0.3065154, 1.41602, 1.259255, 1, 1, 1, 1, 1,
-0.3062994, -0.2411488, -0.9477863, 1, 1, 1, 1, 1,
-0.3060462, -0.7988747, -1.765155, 1, 1, 1, 1, 1,
-0.3040427, -1.794484, -4.008454, 1, 1, 1, 1, 1,
-0.3037612, 0.05027466, -1.708187, 1, 1, 1, 1, 1,
-0.3028024, 0.4582897, 0.1192156, 1, 1, 1, 1, 1,
-0.3008143, -1.660057, -3.671899, 1, 1, 1, 1, 1,
-0.2996274, 1.343379, -2.164625, 0, 0, 1, 1, 1,
-0.2979248, 1.213373, -1.586729, 1, 0, 0, 1, 1,
-0.2939254, 1.241588, -0.9634786, 1, 0, 0, 1, 1,
-0.2930976, 0.6384581, -1.162337, 1, 0, 0, 1, 1,
-0.2918794, 0.6931593, -0.9310028, 1, 0, 0, 1, 1,
-0.2904402, 0.3966484, -0.3168745, 1, 0, 0, 1, 1,
-0.2903748, 1.056141, -0.5132307, 0, 0, 0, 1, 1,
-0.2881088, 0.7302318, 0.3110665, 0, 0, 0, 1, 1,
-0.2849122, 0.2810196, 0.2976264, 0, 0, 0, 1, 1,
-0.2807057, 0.5415633, 1.193886, 0, 0, 0, 1, 1,
-0.2762856, 0.572184, -2.633336, 0, 0, 0, 1, 1,
-0.270419, -0.9452003, -3.014786, 0, 0, 0, 1, 1,
-0.2701906, -0.06903125, -3.911203, 0, 0, 0, 1, 1,
-0.2693599, -0.2575492, -2.405084, 1, 1, 1, 1, 1,
-0.264149, -0.7440927, -2.670995, 1, 1, 1, 1, 1,
-0.2638985, -1.14294, -4.887492, 1, 1, 1, 1, 1,
-0.2632557, 2.316345, 0.2518734, 1, 1, 1, 1, 1,
-0.2602317, -0.2332201, -2.765404, 1, 1, 1, 1, 1,
-0.2533598, 0.6817373, -0.2528627, 1, 1, 1, 1, 1,
-0.2526108, 1.459012, -0.90635, 1, 1, 1, 1, 1,
-0.2523984, -1.136905, -1.382651, 1, 1, 1, 1, 1,
-0.2504438, 0.5426952, -1.896654, 1, 1, 1, 1, 1,
-0.2497333, 2.148641, 0.160291, 1, 1, 1, 1, 1,
-0.2465193, 1.031373, 0.97845, 1, 1, 1, 1, 1,
-0.2459303, 0.9264069, -0.5318434, 1, 1, 1, 1, 1,
-0.2452579, -0.188648, 0.2025181, 1, 1, 1, 1, 1,
-0.2379089, -0.5058997, -3.980472, 1, 1, 1, 1, 1,
-0.2351482, -1.588794, -2.37121, 1, 1, 1, 1, 1,
-0.2322651, 0.6049833, -0.5175081, 0, 0, 1, 1, 1,
-0.2322448, -0.6244773, -3.791308, 1, 0, 0, 1, 1,
-0.2293989, -0.9682444, -4.572121, 1, 0, 0, 1, 1,
-0.2291165, -1.391511, -4.164985, 1, 0, 0, 1, 1,
-0.2279066, -0.04528891, -1.15964, 1, 0, 0, 1, 1,
-0.2278086, 2.480245, 1.491034, 1, 0, 0, 1, 1,
-0.2220131, 1.713463, 0.5360164, 0, 0, 0, 1, 1,
-0.2216438, 0.7551143, -2.205476, 0, 0, 0, 1, 1,
-0.2203179, -1.182298, -1.141705, 0, 0, 0, 1, 1,
-0.2202259, -0.2300972, -3.8497, 0, 0, 0, 1, 1,
-0.2174579, 1.984526, -0.253732, 0, 0, 0, 1, 1,
-0.2152281, -1.919421, -2.348016, 0, 0, 0, 1, 1,
-0.2151873, -0.7483127, -3.511316, 0, 0, 0, 1, 1,
-0.2148691, -1.108715, -3.888681, 1, 1, 1, 1, 1,
-0.2130772, -0.4014861, -2.477154, 1, 1, 1, 1, 1,
-0.2073327, 1.171172, -0.8456357, 1, 1, 1, 1, 1,
-0.207029, -0.2128961, -1.008299, 1, 1, 1, 1, 1,
-0.20536, -1.610458, -3.233643, 1, 1, 1, 1, 1,
-0.2020352, -2.095735, -3.056545, 1, 1, 1, 1, 1,
-0.2013873, -0.820532, -2.200626, 1, 1, 1, 1, 1,
-0.1935984, 0.0006102623, -2.536102, 1, 1, 1, 1, 1,
-0.1922161, 1.232297, -1.982335, 1, 1, 1, 1, 1,
-0.1887983, 0.2101112, -0.3741866, 1, 1, 1, 1, 1,
-0.188667, 0.08330476, 0.4593891, 1, 1, 1, 1, 1,
-0.1884858, 0.4252963, 0.6469513, 1, 1, 1, 1, 1,
-0.1870048, 0.5418767, -0.01026102, 1, 1, 1, 1, 1,
-0.1839422, 0.7717123, -0.5048491, 1, 1, 1, 1, 1,
-0.1801589, -0.8660765, -3.140519, 1, 1, 1, 1, 1,
-0.17708, -0.05749589, -3.174737, 0, 0, 1, 1, 1,
-0.1764588, 0.4213271, -0.1048492, 1, 0, 0, 1, 1,
-0.1759364, 1.17137, 1.548875, 1, 0, 0, 1, 1,
-0.174012, -0.628695, -2.472994, 1, 0, 0, 1, 1,
-0.1733885, -0.274384, -3.264907, 1, 0, 0, 1, 1,
-0.1704456, 0.1082911, 0.07997826, 1, 0, 0, 1, 1,
-0.1678499, -0.8074911, -3.487209, 0, 0, 0, 1, 1,
-0.1669343, -2.163028, -2.954384, 0, 0, 0, 1, 1,
-0.1660723, 1.065271, 1.174936, 0, 0, 0, 1, 1,
-0.1653568, 0.328965, 0.2853722, 0, 0, 0, 1, 1,
-0.1562663, 0.1488518, -0.5610211, 0, 0, 0, 1, 1,
-0.1533423, -0.1922626, -3.390096, 0, 0, 0, 1, 1,
-0.1530602, -2.14854, -2.802003, 0, 0, 0, 1, 1,
-0.1510002, 0.3541386, -1.001511, 1, 1, 1, 1, 1,
-0.1499121, -1.181823, -2.502574, 1, 1, 1, 1, 1,
-0.1492763, -0.1864069, -1.973294, 1, 1, 1, 1, 1,
-0.1443004, 0.4734256, 1.99742, 1, 1, 1, 1, 1,
-0.1418109, 0.4961024, -0.5006773, 1, 1, 1, 1, 1,
-0.138346, 0.01313954, -0.8612534, 1, 1, 1, 1, 1,
-0.1320778, 0.7408987, -1.49279, 1, 1, 1, 1, 1,
-0.1314461, -0.1193054, -3.271442, 1, 1, 1, 1, 1,
-0.1261252, 0.6939709, 0.3097031, 1, 1, 1, 1, 1,
-0.1249488, -1.145876, -2.323498, 1, 1, 1, 1, 1,
-0.1209253, -1.189386, -4.067747, 1, 1, 1, 1, 1,
-0.1123769, 0.8628532, 0.6794952, 1, 1, 1, 1, 1,
-0.1085382, -0.4639785, -2.617158, 1, 1, 1, 1, 1,
-0.10391, -1.093497, -5.396013, 1, 1, 1, 1, 1,
-0.09771591, -0.66806, -2.169157, 1, 1, 1, 1, 1,
-0.0976677, 0.1421577, -2.068492, 0, 0, 1, 1, 1,
-0.09586756, -1.397538, -4.296036, 1, 0, 0, 1, 1,
-0.09184497, -0.4446634, -4.456895, 1, 0, 0, 1, 1,
-0.08488461, -0.09283382, -2.194055, 1, 0, 0, 1, 1,
-0.08119667, -0.1294948, -2.664953, 1, 0, 0, 1, 1,
-0.08102615, -1.759693, -2.769901, 1, 0, 0, 1, 1,
-0.08082343, 1.189673, -0.5048741, 0, 0, 0, 1, 1,
-0.0791767, 0.958637, 1.403202, 0, 0, 0, 1, 1,
-0.07906265, -0.4928156, -4.837653, 0, 0, 0, 1, 1,
-0.07669047, 0.03670022, -1.626307, 0, 0, 0, 1, 1,
-0.07618896, 1.558108, -0.589121, 0, 0, 0, 1, 1,
-0.07519064, -0.3288581, -2.713663, 0, 0, 0, 1, 1,
-0.07488137, 0.3369188, -0.8473423, 0, 0, 0, 1, 1,
-0.07135841, 1.72919, -0.7427849, 1, 1, 1, 1, 1,
-0.0707169, -1.328267, -3.293275, 1, 1, 1, 1, 1,
-0.06838565, -1.047571, -3.398061, 1, 1, 1, 1, 1,
-0.06707277, 1.251027, -2.214449, 1, 1, 1, 1, 1,
-0.06537919, -0.2066052, -2.916784, 1, 1, 1, 1, 1,
-0.06375053, 0.6094108, 1.793438, 1, 1, 1, 1, 1,
-0.05035964, 0.03455765, -1.065451, 1, 1, 1, 1, 1,
-0.04906804, -0.03048878, 0.6796849, 1, 1, 1, 1, 1,
-0.04692434, 0.9635357, -0.06837823, 1, 1, 1, 1, 1,
-0.04594602, -1.57579, -5.116291, 1, 1, 1, 1, 1,
-0.04513638, 0.9501592, 0.8293146, 1, 1, 1, 1, 1,
-0.04081688, 0.03536598, -1.801533, 1, 1, 1, 1, 1,
-0.0366063, -0.7373307, -2.958934, 1, 1, 1, 1, 1,
-0.03631449, 0.2942159, -0.1896102, 1, 1, 1, 1, 1,
-0.03536026, 0.199149, -1.243391, 1, 1, 1, 1, 1,
-0.03525805, -0.3316569, -4.419024, 0, 0, 1, 1, 1,
-0.03124452, -0.6364693, -3.089011, 1, 0, 0, 1, 1,
-0.02958484, -0.2337341, -2.380908, 1, 0, 0, 1, 1,
-0.02718052, 1.020558, 0.04192841, 1, 0, 0, 1, 1,
-0.02545581, -0.04490088, -3.098058, 1, 0, 0, 1, 1,
-0.01900802, 0.7373798, -0.7785449, 1, 0, 0, 1, 1,
-0.01849429, -0.6823888, -3.946589, 0, 0, 0, 1, 1,
-0.01647143, 0.3763561, 0.8712499, 0, 0, 0, 1, 1,
-0.01565062, 0.7689506, -0.1660437, 0, 0, 0, 1, 1,
-0.0150302, 0.7959768, -0.5673151, 0, 0, 0, 1, 1,
-0.0150185, 1.799515, 1.165952, 0, 0, 0, 1, 1,
-0.01411356, 2.242063, -0.1722798, 0, 0, 0, 1, 1,
-0.01227397, 1.348721, -0.2605489, 0, 0, 0, 1, 1,
-0.009249624, -0.4963119, -4.508773, 1, 1, 1, 1, 1,
-0.009085811, 1.184963, -2.390052, 1, 1, 1, 1, 1,
-0.007448093, -1.21289, -2.998693, 1, 1, 1, 1, 1,
-0.005600331, -0.889919, -3.479175, 1, 1, 1, 1, 1,
0.0009295185, -0.7720204, 3.246499, 1, 1, 1, 1, 1,
0.002350643, 0.5657172, -0.893638, 1, 1, 1, 1, 1,
0.004941029, -0.5553628, 3.699714, 1, 1, 1, 1, 1,
0.005859225, 0.9839858, -0.7457242, 1, 1, 1, 1, 1,
0.007969843, -1.031512, 2.691129, 1, 1, 1, 1, 1,
0.009163115, 0.776468, 0.3551588, 1, 1, 1, 1, 1,
0.01000394, 1.846597, -1.485938, 1, 1, 1, 1, 1,
0.01072143, 0.1735826, -0.02615574, 1, 1, 1, 1, 1,
0.01141665, -1.738812, 2.183268, 1, 1, 1, 1, 1,
0.01216658, 0.2794592, -0.8493159, 1, 1, 1, 1, 1,
0.01518347, 0.5219627, -0.8064184, 1, 1, 1, 1, 1,
0.02026985, -0.5742904, 1.930791, 0, 0, 1, 1, 1,
0.02187999, -0.1310501, 2.15469, 1, 0, 0, 1, 1,
0.02538332, 0.3358288, -1.481027, 1, 0, 0, 1, 1,
0.03345518, 1.065578, 0.1863681, 1, 0, 0, 1, 1,
0.0351043, -0.2069942, 2.602723, 1, 0, 0, 1, 1,
0.04335282, -0.676597, 2.291493, 1, 0, 0, 1, 1,
0.04366181, -0.438204, 1.805597, 0, 0, 0, 1, 1,
0.04817788, -1.57539, 4.149814, 0, 0, 0, 1, 1,
0.04870716, 0.8484458, -0.7040291, 0, 0, 0, 1, 1,
0.04980673, -0.291282, 4.154961, 0, 0, 0, 1, 1,
0.05033018, 0.369167, -0.464734, 0, 0, 0, 1, 1,
0.05409969, 0.3950909, -0.06464617, 0, 0, 0, 1, 1,
0.05712563, -1.322933, 2.865062, 0, 0, 0, 1, 1,
0.05740372, 0.6640288, -0.4815184, 1, 1, 1, 1, 1,
0.05757234, -1.650761, 3.41108, 1, 1, 1, 1, 1,
0.06109641, -0.3498398, 2.973897, 1, 1, 1, 1, 1,
0.06169718, -1.226458, 3.508146, 1, 1, 1, 1, 1,
0.06429135, -0.9734931, 4.096011, 1, 1, 1, 1, 1,
0.07262247, -1.478102, 1.202941, 1, 1, 1, 1, 1,
0.07439178, 0.5685413, 0.5025532, 1, 1, 1, 1, 1,
0.07730004, 0.2412299, 1.755016, 1, 1, 1, 1, 1,
0.08172923, -1.379683, 2.612038, 1, 1, 1, 1, 1,
0.08868931, 2.00399, 0.9668739, 1, 1, 1, 1, 1,
0.08894631, 0.8974745, 1.876173, 1, 1, 1, 1, 1,
0.08907122, 0.3449982, -0.2484948, 1, 1, 1, 1, 1,
0.09035476, 0.4055393, -1.22533, 1, 1, 1, 1, 1,
0.0925777, 0.5966786, -0.7848051, 1, 1, 1, 1, 1,
0.0958118, -0.3387157, 2.496962, 1, 1, 1, 1, 1,
0.09583766, 0.7418413, 0.958155, 0, 0, 1, 1, 1,
0.102522, -0.5516291, 1.177065, 1, 0, 0, 1, 1,
0.1054616, -0.9113857, 3.75724, 1, 0, 0, 1, 1,
0.1055461, 1.065832, -0.1985257, 1, 0, 0, 1, 1,
0.1092356, 1.021477, 0.3527035, 1, 0, 0, 1, 1,
0.1095754, -1.829085, 2.920516, 1, 0, 0, 1, 1,
0.1116858, -0.7995119, 2.325341, 0, 0, 0, 1, 1,
0.112614, -0.9313645, 3.869526, 0, 0, 0, 1, 1,
0.1148267, 1.492285, 0.2725836, 0, 0, 0, 1, 1,
0.1187149, 0.2519033, 0.7593779, 0, 0, 0, 1, 1,
0.1214994, -0.3432806, 1.418054, 0, 0, 0, 1, 1,
0.1245033, -0.3893569, 4.194266, 0, 0, 0, 1, 1,
0.1307749, -0.1505272, 1.346442, 0, 0, 0, 1, 1,
0.1325913, -0.3881513, 2.197937, 1, 1, 1, 1, 1,
0.1345831, -0.4575771, 2.367213, 1, 1, 1, 1, 1,
0.1362529, -0.2558985, 0.7051421, 1, 1, 1, 1, 1,
0.1369549, -0.5846086, 2.743807, 1, 1, 1, 1, 1,
0.1387627, 1.437177, -1.17405, 1, 1, 1, 1, 1,
0.1408226, 0.3410802, 0.810818, 1, 1, 1, 1, 1,
0.1416526, 0.1337012, -0.006268962, 1, 1, 1, 1, 1,
0.143947, 2.246159, 0.3394337, 1, 1, 1, 1, 1,
0.1478653, 0.3158127, 0.6035228, 1, 1, 1, 1, 1,
0.148064, -0.8362818, 3.429713, 1, 1, 1, 1, 1,
0.1501006, 0.9742368, 1.938374, 1, 1, 1, 1, 1,
0.1507271, 1.230623, -0.4971556, 1, 1, 1, 1, 1,
0.1516913, 0.8191555, 1.240612, 1, 1, 1, 1, 1,
0.1535006, 1.00486, 0.6059648, 1, 1, 1, 1, 1,
0.1584562, 0.6874928, 1.204018, 1, 1, 1, 1, 1,
0.1593141, -0.4816938, 2.348591, 0, 0, 1, 1, 1,
0.1630358, -1.181385, 3.110942, 1, 0, 0, 1, 1,
0.164774, -1.186969, 2.458357, 1, 0, 0, 1, 1,
0.1653881, 0.4145498, -0.3187985, 1, 0, 0, 1, 1,
0.1723508, -2.380751, 2.050517, 1, 0, 0, 1, 1,
0.1811243, -0.2654909, 3.464316, 1, 0, 0, 1, 1,
0.1815187, -1.423372, 2.680628, 0, 0, 0, 1, 1,
0.1815628, 1.36808, 0.5974023, 0, 0, 0, 1, 1,
0.1828089, -0.0153011, 1.013273, 0, 0, 0, 1, 1,
0.186006, 0.2975061, 1.697685, 0, 0, 0, 1, 1,
0.1894716, 0.455176, -0.1435993, 0, 0, 0, 1, 1,
0.195074, -0.7302953, 4.120017, 0, 0, 0, 1, 1,
0.1973601, 1.562793, 0.05979358, 0, 0, 0, 1, 1,
0.1977062, 0.5557893, 1.279301, 1, 1, 1, 1, 1,
0.1981132, 1.217034, 1.764052, 1, 1, 1, 1, 1,
0.2025798, 0.9287607, -0.9207743, 1, 1, 1, 1, 1,
0.2058911, 0.4090893, 0.7093092, 1, 1, 1, 1, 1,
0.2076583, 0.0927843, 1.597739, 1, 1, 1, 1, 1,
0.212103, 0.8864998, -1.604057, 1, 1, 1, 1, 1,
0.2131543, -0.08607081, 0.8059978, 1, 1, 1, 1, 1,
0.2180137, -1.587123, 4.099735, 1, 1, 1, 1, 1,
0.2181589, 0.7513672, 1.458986, 1, 1, 1, 1, 1,
0.21961, 1.750281, -0.6018745, 1, 1, 1, 1, 1,
0.2269927, -0.3649416, 3.456312, 1, 1, 1, 1, 1,
0.230302, 0.638033, -1.147967, 1, 1, 1, 1, 1,
0.2329911, 0.7040049, -1.35196, 1, 1, 1, 1, 1,
0.2386194, -0.310386, 0.9971198, 1, 1, 1, 1, 1,
0.2401804, 0.5182308, 0.258314, 1, 1, 1, 1, 1,
0.2460917, -0.8302001, 5.005976, 0, 0, 1, 1, 1,
0.2480181, 0.724602, 1.028261, 1, 0, 0, 1, 1,
0.2515988, 0.3573714, 0.3230514, 1, 0, 0, 1, 1,
0.2523081, 0.9913619, 1.026911, 1, 0, 0, 1, 1,
0.2526656, -0.4077607, 3.42799, 1, 0, 0, 1, 1,
0.2541166, 0.158692, -0.3186307, 1, 0, 0, 1, 1,
0.2616857, -0.03097804, 2.277669, 0, 0, 0, 1, 1,
0.2619303, 0.5643981, 1.20665, 0, 0, 0, 1, 1,
0.2662755, 0.2708206, -0.4138044, 0, 0, 0, 1, 1,
0.2666623, -0.08470631, 1.890283, 0, 0, 0, 1, 1,
0.2685603, 0.7538864, -0.003833879, 0, 0, 0, 1, 1,
0.2699315, 2.464056, -0.1440365, 0, 0, 0, 1, 1,
0.2836235, -0.676815, 3.123308, 0, 0, 0, 1, 1,
0.2841057, 0.4531345, 0.6599248, 1, 1, 1, 1, 1,
0.2870487, -0.6873741, 4.474394, 1, 1, 1, 1, 1,
0.2901336, 0.1214837, 2.265597, 1, 1, 1, 1, 1,
0.2908387, 0.8329346, -0.7359803, 1, 1, 1, 1, 1,
0.291573, -0.8735681, 3.292856, 1, 1, 1, 1, 1,
0.2963952, 0.968129, 1.753412, 1, 1, 1, 1, 1,
0.297239, 1.144567, 1.95968, 1, 1, 1, 1, 1,
0.2978303, 1.482885, 0.5822206, 1, 1, 1, 1, 1,
0.2982751, 0.01392964, 3.582332, 1, 1, 1, 1, 1,
0.3010937, -0.070246, 3.186848, 1, 1, 1, 1, 1,
0.3064702, -0.8741828, 1.965469, 1, 1, 1, 1, 1,
0.308255, 0.8042943, 0.04299191, 1, 1, 1, 1, 1,
0.3100984, 1.167889, 0.1518647, 1, 1, 1, 1, 1,
0.3109597, -0.6728902, 4.058909, 1, 1, 1, 1, 1,
0.3130223, 1.709667, 0.688337, 1, 1, 1, 1, 1,
0.3143144, -0.5744509, 3.669334, 0, 0, 1, 1, 1,
0.314599, -1.361653, 2.344065, 1, 0, 0, 1, 1,
0.317739, -0.4299987, 3.763134, 1, 0, 0, 1, 1,
0.3183402, 0.7378632, 0.2181558, 1, 0, 0, 1, 1,
0.3193812, -0.4095026, 2.724533, 1, 0, 0, 1, 1,
0.3254072, 1.504018, 0.5474725, 1, 0, 0, 1, 1,
0.3307118, -0.2333082, 1.83037, 0, 0, 0, 1, 1,
0.3320961, -1.271343, 1.280077, 0, 0, 0, 1, 1,
0.3360114, -1.487193, 4.742698, 0, 0, 0, 1, 1,
0.3384192, -0.2799494, 1.345088, 0, 0, 0, 1, 1,
0.339595, 1.209288, 0.1425213, 0, 0, 0, 1, 1,
0.3408118, 1.88121, -0.4728814, 0, 0, 0, 1, 1,
0.3418202, -1.276886, 2.485048, 0, 0, 0, 1, 1,
0.3449823, 0.6703686, -0.8467861, 1, 1, 1, 1, 1,
0.3476243, -1.161548, 3.146762, 1, 1, 1, 1, 1,
0.3496381, 0.04944279, 0.03196117, 1, 1, 1, 1, 1,
0.3499088, 1.884908, 1.074424, 1, 1, 1, 1, 1,
0.350338, -1.208235, 1.332099, 1, 1, 1, 1, 1,
0.3556761, -0.6799681, 3.191277, 1, 1, 1, 1, 1,
0.3573142, -1.45323, -0.1490803, 1, 1, 1, 1, 1,
0.3600932, -0.7998254, 1.483017, 1, 1, 1, 1, 1,
0.3629124, -0.2964223, 2.867779, 1, 1, 1, 1, 1,
0.3629909, 0.6321776, 0.6491463, 1, 1, 1, 1, 1,
0.3630587, -1.268576, 2.748786, 1, 1, 1, 1, 1,
0.3641022, -0.8412176, 2.840305, 1, 1, 1, 1, 1,
0.3648563, -0.327487, 3.023395, 1, 1, 1, 1, 1,
0.3649997, 0.2749452, 0.3860826, 1, 1, 1, 1, 1,
0.3671407, 1.985742, 0.6139917, 1, 1, 1, 1, 1,
0.3677299, 0.3568047, 0.1348079, 0, 0, 1, 1, 1,
0.3677398, -0.8328025, 3.950814, 1, 0, 0, 1, 1,
0.369992, 0.4042608, 1.425593, 1, 0, 0, 1, 1,
0.3727883, 0.5666506, 1.201836, 1, 0, 0, 1, 1,
0.3734094, 1.536647, 0.5085406, 1, 0, 0, 1, 1,
0.3734278, -1.074632, 1.183369, 1, 0, 0, 1, 1,
0.3743434, -0.7193533, 1.364092, 0, 0, 0, 1, 1,
0.3746081, -0.4206069, 3.084017, 0, 0, 0, 1, 1,
0.3826872, 1.406374, 0.669715, 0, 0, 0, 1, 1,
0.3852728, 0.5289258, -1.169354, 0, 0, 0, 1, 1,
0.3867351, -1.229554, 2.424043, 0, 0, 0, 1, 1,
0.3876703, -0.2933083, 1.110267, 0, 0, 0, 1, 1,
0.3895688, -0.1017071, 0.05630021, 0, 0, 0, 1, 1,
0.39966, 0.8697178, 0.4173028, 1, 1, 1, 1, 1,
0.4019023, 1.699284, -1.504162, 1, 1, 1, 1, 1,
0.4025339, 1.301745, 1.003938, 1, 1, 1, 1, 1,
0.4026369, 0.5380599, 1.593403, 1, 1, 1, 1, 1,
0.4045434, -2.316602, 2.021951, 1, 1, 1, 1, 1,
0.404812, 0.3748729, 1.017139, 1, 1, 1, 1, 1,
0.4060014, 0.05500406, -0.5952607, 1, 1, 1, 1, 1,
0.4067228, 0.0001763748, 2.372351, 1, 1, 1, 1, 1,
0.4096105, -0.3278166, 2.041793, 1, 1, 1, 1, 1,
0.4119746, 0.0825317, 1.780141, 1, 1, 1, 1, 1,
0.4138543, -1.777417, 4.240677, 1, 1, 1, 1, 1,
0.4178267, -0.4353221, 1.904835, 1, 1, 1, 1, 1,
0.4207763, 0.9221006, -0.3265858, 1, 1, 1, 1, 1,
0.4240791, -1.061798, 2.13077, 1, 1, 1, 1, 1,
0.4277062, -0.4094708, 1.66487, 1, 1, 1, 1, 1,
0.4367713, 0.1795161, 4.032268, 0, 0, 1, 1, 1,
0.440423, 1.88201, 1.0627, 1, 0, 0, 1, 1,
0.4456856, 0.1563149, 2.227759, 1, 0, 0, 1, 1,
0.446527, 0.6064102, 1.555033, 1, 0, 0, 1, 1,
0.4518132, -0.5944469, 2.685603, 1, 0, 0, 1, 1,
0.452527, 1.474572, 0.08412848, 1, 0, 0, 1, 1,
0.454423, -2.125891, 3.677478, 0, 0, 0, 1, 1,
0.4546794, -0.9879949, 1.461127, 0, 0, 0, 1, 1,
0.4633206, 0.7786924, 1.145568, 0, 0, 0, 1, 1,
0.4642998, 0.5132706, 0.5753495, 0, 0, 0, 1, 1,
0.4648006, -0.473154, 3.601965, 0, 0, 0, 1, 1,
0.4706573, 0.1649972, 0.8401991, 0, 0, 0, 1, 1,
0.4778191, -2.240012, 2.759511, 0, 0, 0, 1, 1,
0.4836125, 1.120871, 0.09382986, 1, 1, 1, 1, 1,
0.4837248, -2.080301, 2.476406, 1, 1, 1, 1, 1,
0.487117, -0.3089803, 2.10272, 1, 1, 1, 1, 1,
0.4872334, 1.938805, 1.095731, 1, 1, 1, 1, 1,
0.4882975, -1.450894, 2.490456, 1, 1, 1, 1, 1,
0.4941022, -0.1124939, 2.111851, 1, 1, 1, 1, 1,
0.4954359, -0.2345332, 1.619899, 1, 1, 1, 1, 1,
0.5015385, -0.536978, 0.9726981, 1, 1, 1, 1, 1,
0.5041273, -0.2225548, 1.816645, 1, 1, 1, 1, 1,
0.5046991, -0.3334424, 1.40901, 1, 1, 1, 1, 1,
0.5063722, 0.8726689, 1.546746, 1, 1, 1, 1, 1,
0.5125118, -0.05960473, 1.134431, 1, 1, 1, 1, 1,
0.5178252, -0.2381404, 0.9247793, 1, 1, 1, 1, 1,
0.5249525, 0.9395002, 0.5054901, 1, 1, 1, 1, 1,
0.5274653, 1.629132, -2.089589, 1, 1, 1, 1, 1,
0.528667, 0.7899309, 0.559291, 0, 0, 1, 1, 1,
0.5322458, -1.238452, 3.695654, 1, 0, 0, 1, 1,
0.5339991, -0.1560876, 2.954348, 1, 0, 0, 1, 1,
0.5345887, -1.072794, 4.604264, 1, 0, 0, 1, 1,
0.5363223, -1.193539, 4.383095, 1, 0, 0, 1, 1,
0.541983, 2.009488, 0.5457283, 1, 0, 0, 1, 1,
0.5486342, 0.5839052, 1.720438, 0, 0, 0, 1, 1,
0.5494359, 0.4385057, 1.776772, 0, 0, 0, 1, 1,
0.550965, -0.8564856, 2.4666, 0, 0, 0, 1, 1,
0.5518041, 0.1763657, -0.4050586, 0, 0, 0, 1, 1,
0.5529602, -0.767839, 3.436353, 0, 0, 0, 1, 1,
0.5530305, 0.184827, 1.061945, 0, 0, 0, 1, 1,
0.5555618, 0.125715, 0.5595023, 0, 0, 0, 1, 1,
0.5591108, -0.3013288, 1.236404, 1, 1, 1, 1, 1,
0.5620376, -0.76013, 2.084473, 1, 1, 1, 1, 1,
0.5649805, -0.6153127, 3.370065, 1, 1, 1, 1, 1,
0.5673845, -0.07410187, 0.6392231, 1, 1, 1, 1, 1,
0.5677468, -1.013341, 2.713489, 1, 1, 1, 1, 1,
0.5732616, -0.7058241, 1.165172, 1, 1, 1, 1, 1,
0.577082, 2.269773, 0.2433563, 1, 1, 1, 1, 1,
0.5785533, 0.2410366, 0.5168387, 1, 1, 1, 1, 1,
0.5809995, 0.5452508, -0.0706799, 1, 1, 1, 1, 1,
0.5825821, 0.7604041, 1.531186, 1, 1, 1, 1, 1,
0.5831113, 0.2813448, 2.035403, 1, 1, 1, 1, 1,
0.5962186, -0.8809937, 0.29491, 1, 1, 1, 1, 1,
0.596406, 0.3841434, 1.635544, 1, 1, 1, 1, 1,
0.5988888, 0.1409216, 2.146159, 1, 1, 1, 1, 1,
0.5989344, -0.8332156, 3.163004, 1, 1, 1, 1, 1,
0.6006721, 0.7159674, 0.2546173, 0, 0, 1, 1, 1,
0.608285, -0.03891589, 1.127084, 1, 0, 0, 1, 1,
0.6094752, 0.5868209, 1.597325, 1, 0, 0, 1, 1,
0.614737, -0.7407284, 0.8020586, 1, 0, 0, 1, 1,
0.6185895, 1.379536, 0.1251837, 1, 0, 0, 1, 1,
0.6198821, 0.06375703, 3.25846, 1, 0, 0, 1, 1,
0.6259124, 0.07303295, 1.564914, 0, 0, 0, 1, 1,
0.6287909, 0.4441046, 0.1730455, 0, 0, 0, 1, 1,
0.6327753, -0.6243798, 2.716734, 0, 0, 0, 1, 1,
0.6332997, -0.2465798, 1.588829, 0, 0, 0, 1, 1,
0.6375946, -0.4561597, 3.023079, 0, 0, 0, 1, 1,
0.639006, -0.7014489, 0.9304196, 0, 0, 0, 1, 1,
0.6406736, 1.676868, 2.040288, 0, 0, 0, 1, 1,
0.6417015, -0.671307, 2.938838, 1, 1, 1, 1, 1,
0.6442372, -0.2285823, 2.765255, 1, 1, 1, 1, 1,
0.6443267, -0.4200813, 1.679125, 1, 1, 1, 1, 1,
0.6472049, -0.3377577, 0.7460045, 1, 1, 1, 1, 1,
0.6477139, -0.2694044, 2.275237, 1, 1, 1, 1, 1,
0.6577455, -0.2564873, 0.6938815, 1, 1, 1, 1, 1,
0.6636593, 0.2514277, 0.5080648, 1, 1, 1, 1, 1,
0.6709821, 1.653181, -0.430501, 1, 1, 1, 1, 1,
0.6727669, 0.5771664, 0.2025624, 1, 1, 1, 1, 1,
0.6740068, 0.2601603, 2.996472, 1, 1, 1, 1, 1,
0.678759, 0.8284227, 0.5332893, 1, 1, 1, 1, 1,
0.6789911, 0.1863472, 2.508041, 1, 1, 1, 1, 1,
0.6915645, -1.698892, 2.399601, 1, 1, 1, 1, 1,
0.7006323, 0.1504736, 2.425942, 1, 1, 1, 1, 1,
0.7033582, 0.3938366, 0.6502461, 1, 1, 1, 1, 1,
0.7083126, -1.280219, 4.515081, 0, 0, 1, 1, 1,
0.7154747, 0.002085559, 0.9365855, 1, 0, 0, 1, 1,
0.7191318, -0.9973881, 3.993517, 1, 0, 0, 1, 1,
0.7215472, 0.6640403, 0.8184114, 1, 0, 0, 1, 1,
0.7218148, 0.7284065, 2.294363, 1, 0, 0, 1, 1,
0.7245345, 0.8590229, 1.187668, 1, 0, 0, 1, 1,
0.7261251, 1.287927, -1.379567, 0, 0, 0, 1, 1,
0.7297122, 0.6862374, 0.9206204, 0, 0, 0, 1, 1,
0.7307012, 0.6716161, 1.839095, 0, 0, 0, 1, 1,
0.7371868, 1.087154, 0.9530384, 0, 0, 0, 1, 1,
0.7373267, -0.7552771, 0.7570719, 0, 0, 0, 1, 1,
0.7384444, -1.097205, 1.85478, 0, 0, 0, 1, 1,
0.7386927, -1.386037, 1.742961, 0, 0, 0, 1, 1,
0.7460631, -0.335088, 1.042822, 1, 1, 1, 1, 1,
0.7468817, 0.8170237, -0.01908368, 1, 1, 1, 1, 1,
0.7490454, 0.1642652, 1.116858, 1, 1, 1, 1, 1,
0.7522042, 0.3528229, 3.301752, 1, 1, 1, 1, 1,
0.7523261, -0.1784933, 1.118343, 1, 1, 1, 1, 1,
0.7600721, 1.521044, -0.3044852, 1, 1, 1, 1, 1,
0.7627966, -0.3542687, 2.890567, 1, 1, 1, 1, 1,
0.7669097, 0.04746502, 0.791483, 1, 1, 1, 1, 1,
0.7684197, -1.340077, 3.420917, 1, 1, 1, 1, 1,
0.7690768, -0.2495118, 2.474145, 1, 1, 1, 1, 1,
0.7747316, 0.4086796, -0.5302467, 1, 1, 1, 1, 1,
0.7748298, -0.4706439, 1.475907, 1, 1, 1, 1, 1,
0.7764443, -0.6079952, 2.718757, 1, 1, 1, 1, 1,
0.7764906, 1.558497, -0.7707422, 1, 1, 1, 1, 1,
0.7776468, 0.6740386, 0.8893644, 1, 1, 1, 1, 1,
0.7801476, 0.2013451, -0.3424559, 0, 0, 1, 1, 1,
0.7819504, 0.2488846, 2.042693, 1, 0, 0, 1, 1,
0.7844291, -0.4073448, 1.120231, 1, 0, 0, 1, 1,
0.7881478, 0.2005307, 1.883655, 1, 0, 0, 1, 1,
0.7913998, 2.896565, 0.3883677, 1, 0, 0, 1, 1,
0.795643, 1.960674, 0.2300746, 1, 0, 0, 1, 1,
0.7969024, -0.8665555, 2.555011, 0, 0, 0, 1, 1,
0.7976583, 0.6479455, 1.350697, 0, 0, 0, 1, 1,
0.8015715, 0.6694232, -0.5636855, 0, 0, 0, 1, 1,
0.8056524, 0.3332058, 2.260713, 0, 0, 0, 1, 1,
0.8072914, -0.7519664, 3.009114, 0, 0, 0, 1, 1,
0.8077316, 0.1735018, 1.76298, 0, 0, 0, 1, 1,
0.814307, 1.236078, -0.1848545, 0, 0, 0, 1, 1,
0.8159131, 0.3762045, 0.5482012, 1, 1, 1, 1, 1,
0.8181866, -0.506794, 0.8214387, 1, 1, 1, 1, 1,
0.8240455, -1.647591, 1.32449, 1, 1, 1, 1, 1,
0.8290389, -0.2463874, 1.478917, 1, 1, 1, 1, 1,
0.8333945, 1.039397, 1.183358, 1, 1, 1, 1, 1,
0.835654, -0.7964387, 2.57444, 1, 1, 1, 1, 1,
0.8439547, -0.5339011, 2.615151, 1, 1, 1, 1, 1,
0.8440894, 0.148802, 1.881081, 1, 1, 1, 1, 1,
0.853464, 1.49017, 0.5291829, 1, 1, 1, 1, 1,
0.8547421, -0.008534788, 1.555759, 1, 1, 1, 1, 1,
0.8563069, 0.9530383, 2.144529, 1, 1, 1, 1, 1,
0.8568166, 0.197504, 0.6959603, 1, 1, 1, 1, 1,
0.8593837, 0.2092561, 0.4005629, 1, 1, 1, 1, 1,
0.8604572, 0.07435659, 3.173028, 1, 1, 1, 1, 1,
0.8665113, 1.666738, -1.215973, 1, 1, 1, 1, 1,
0.8668707, -0.4361656, 1.747299, 0, 0, 1, 1, 1,
0.8686303, 1.287968, 0.008352939, 1, 0, 0, 1, 1,
0.8734044, -0.537867, 0.07131269, 1, 0, 0, 1, 1,
0.8762665, -0.2837919, 2.846667, 1, 0, 0, 1, 1,
0.881721, 0.2271864, 1.818465, 1, 0, 0, 1, 1,
0.8848659, -0.1980289, 0.9628559, 1, 0, 0, 1, 1,
0.8854912, 0.7865003, 0.3300098, 0, 0, 0, 1, 1,
0.8858366, -0.01621215, 3.58805, 0, 0, 0, 1, 1,
0.8869769, -0.6868883, 2.272651, 0, 0, 0, 1, 1,
0.8890384, -0.3305896, 1.481526, 0, 0, 0, 1, 1,
0.8945714, 0.3868231, 0.03701571, 0, 0, 0, 1, 1,
0.895164, -0.5399836, 2.790322, 0, 0, 0, 1, 1,
0.9041308, -1.82307, 1.429512, 0, 0, 0, 1, 1,
0.9078665, -0.7592878, 2.683621, 1, 1, 1, 1, 1,
0.9157327, -1.212986, 3.15602, 1, 1, 1, 1, 1,
0.9162356, 0.9407503, -0.4710892, 1, 1, 1, 1, 1,
0.9180142, 0.0690762, 0.8488076, 1, 1, 1, 1, 1,
0.919659, 0.2938191, 1.030424, 1, 1, 1, 1, 1,
0.931081, -0.7501658, 2.115263, 1, 1, 1, 1, 1,
0.9384702, -0.4397692, 1.0994, 1, 1, 1, 1, 1,
0.9464881, -0.2715237, 2.468837, 1, 1, 1, 1, 1,
0.9475335, -0.9875358, 2.244415, 1, 1, 1, 1, 1,
0.9508365, -0.473287, 0.4253154, 1, 1, 1, 1, 1,
0.9552217, 0.8584571, 1.486644, 1, 1, 1, 1, 1,
0.9559186, 1.373186, 0.3724546, 1, 1, 1, 1, 1,
0.9678439, 0.707392, 1.5655, 1, 1, 1, 1, 1,
0.9715169, 0.2444939, 0.5346746, 1, 1, 1, 1, 1,
0.9748549, 1.764655, -0.3394625, 1, 1, 1, 1, 1,
0.9823385, -0.4383225, 0.8461776, 0, 0, 1, 1, 1,
0.9826514, -1.290209, 2.375682, 1, 0, 0, 1, 1,
0.987376, -0.9320903, 3.300605, 1, 0, 0, 1, 1,
0.9891523, 0.8742372, 0.4355973, 1, 0, 0, 1, 1,
0.9974015, -0.0777785, 2.566625, 1, 0, 0, 1, 1,
1.001522, 2.118563, 0.9501882, 1, 0, 0, 1, 1,
1.01024, -1.366384, 2.813213, 0, 0, 0, 1, 1,
1.012073, 0.1737466, 0.697037, 0, 0, 0, 1, 1,
1.014547, -0.2722777, -1.186376, 0, 0, 0, 1, 1,
1.01715, 0.08647264, 0.7023596, 0, 0, 0, 1, 1,
1.024449, -1.271231, 2.424085, 0, 0, 0, 1, 1,
1.025423, 0.8627019, 0.5391365, 0, 0, 0, 1, 1,
1.026131, 0.5296347, 0.4068109, 0, 0, 0, 1, 1,
1.029076, 0.2974503, 2.174522, 1, 1, 1, 1, 1,
1.029421, 0.6896462, 1.629782, 1, 1, 1, 1, 1,
1.029471, 1.497248, -0.5443282, 1, 1, 1, 1, 1,
1.031607, -1.06928, 2.608679, 1, 1, 1, 1, 1,
1.035013, 0.8319754, 1.114784, 1, 1, 1, 1, 1,
1.038283, 0.6460739, 1.628034, 1, 1, 1, 1, 1,
1.046174, -0.9332509, 1.601706, 1, 1, 1, 1, 1,
1.050367, 1.470134, -0.4591299, 1, 1, 1, 1, 1,
1.052934, -0.3881207, 0.9511184, 1, 1, 1, 1, 1,
1.05671, 1.227677, 0.8040572, 1, 1, 1, 1, 1,
1.056992, -1.156174, 2.599324, 1, 1, 1, 1, 1,
1.058342, 1.9708, 2.502848, 1, 1, 1, 1, 1,
1.065975, -0.1412531, 1.479203, 1, 1, 1, 1, 1,
1.066961, 0.3939231, 1.760876, 1, 1, 1, 1, 1,
1.06912, -0.382856, 2.226836, 1, 1, 1, 1, 1,
1.075392, -0.465763, 1.669928, 0, 0, 1, 1, 1,
1.08603, 0.3385847, 0.8501292, 1, 0, 0, 1, 1,
1.086462, 1.354698, 1.210333, 1, 0, 0, 1, 1,
1.08929, 1.281562, 0.3649919, 1, 0, 0, 1, 1,
1.089306, 0.9082304, -0.1849041, 1, 0, 0, 1, 1,
1.089718, -1.042808, 1.389123, 1, 0, 0, 1, 1,
1.099998, -0.2119103, 0.4183972, 0, 0, 0, 1, 1,
1.108286, -0.9978778, 2.406497, 0, 0, 0, 1, 1,
1.115875, 0.4918752, 1.391906, 0, 0, 0, 1, 1,
1.123154, -0.7450324, 3.452643, 0, 0, 0, 1, 1,
1.12648, -0.3472086, 1.036423, 0, 0, 0, 1, 1,
1.127411, -1.095807, 1.874707, 0, 0, 0, 1, 1,
1.134413, 1.110116, -0.1966144, 0, 0, 0, 1, 1,
1.143224, 1.886211, 0.03945324, 1, 1, 1, 1, 1,
1.150092, 1.504683, -1.305228, 1, 1, 1, 1, 1,
1.155021, -1.721972, 3.513366, 1, 1, 1, 1, 1,
1.158031, 2.277499, 1.146918, 1, 1, 1, 1, 1,
1.160424, 0.3549143, 1.518486, 1, 1, 1, 1, 1,
1.165661, -0.2944026, 2.623322, 1, 1, 1, 1, 1,
1.178456, 1.395677, -1.592986, 1, 1, 1, 1, 1,
1.181748, 0.5018756, -0.2176613, 1, 1, 1, 1, 1,
1.1823, 0.7646716, 1.090598, 1, 1, 1, 1, 1,
1.184808, -0.3980805, 4.040565, 1, 1, 1, 1, 1,
1.190164, 0.6279832, 1.521079, 1, 1, 1, 1, 1,
1.19066, 1.259715, -0.4534758, 1, 1, 1, 1, 1,
1.194539, -0.7194893, 2.942422, 1, 1, 1, 1, 1,
1.198637, -0.5470225, 1.589504, 1, 1, 1, 1, 1,
1.211142, -0.6141069, 0.06743795, 1, 1, 1, 1, 1,
1.21944, 1.154953, 0.4197861, 0, 0, 1, 1, 1,
1.219557, -1.174039, -0.5447437, 1, 0, 0, 1, 1,
1.225904, 1.357188, -1.144847, 1, 0, 0, 1, 1,
1.228671, -2.458193, 6.026505, 1, 0, 0, 1, 1,
1.23178, 0.2928528, 1.018533, 1, 0, 0, 1, 1,
1.24188, -2.240243, 2.655452, 1, 0, 0, 1, 1,
1.246962, 0.6624576, 0.8300401, 0, 0, 0, 1, 1,
1.249974, -1.066268, 1.469859, 0, 0, 0, 1, 1,
1.251738, 0.3304769, 2.209239, 0, 0, 0, 1, 1,
1.252052, 0.8126795, 1.802034, 0, 0, 0, 1, 1,
1.252563, -0.4592987, 0.6304526, 0, 0, 0, 1, 1,
1.253744, -0.7655432, 2.970275, 0, 0, 0, 1, 1,
1.253857, -0.9913011, 2.941559, 0, 0, 0, 1, 1,
1.257179, 1.470176, 0.8148394, 1, 1, 1, 1, 1,
1.259138, -0.5677581, 1.394197, 1, 1, 1, 1, 1,
1.263377, -1.305973, 4.223129, 1, 1, 1, 1, 1,
1.277821, 1.381601, 1.99753, 1, 1, 1, 1, 1,
1.282614, -1.851937, 0.9802329, 1, 1, 1, 1, 1,
1.300082, 1.164696, 0.5812584, 1, 1, 1, 1, 1,
1.3007, -0.1003204, 1.959521, 1, 1, 1, 1, 1,
1.312628, 0.1291331, 0.3176078, 1, 1, 1, 1, 1,
1.316422, -1.335553, 2.319463, 1, 1, 1, 1, 1,
1.327221, -1.009012, 2.553358, 1, 1, 1, 1, 1,
1.342917, -0.5445805, 0.5084806, 1, 1, 1, 1, 1,
1.357016, -1.689004, 1.710695, 1, 1, 1, 1, 1,
1.358835, 0.51284, 2.728223, 1, 1, 1, 1, 1,
1.358846, -1.016651, 1.66036, 1, 1, 1, 1, 1,
1.362761, -1.943068, 2.482371, 1, 1, 1, 1, 1,
1.372209, -1.041116, 3.079553, 0, 0, 1, 1, 1,
1.373601, 0.007539293, 2.484812, 1, 0, 0, 1, 1,
1.37577, 0.7010909, 0.822773, 1, 0, 0, 1, 1,
1.38263, -1.012354, 2.765339, 1, 0, 0, 1, 1,
1.38502, -2.71437, 2.644101, 1, 0, 0, 1, 1,
1.403008, -1.269171, 1.111559, 1, 0, 0, 1, 1,
1.40666, -0.1623229, 0.8263389, 0, 0, 0, 1, 1,
1.407696, -0.1261722, 1.692501, 0, 0, 0, 1, 1,
1.413129, 1.538178, 1.857244, 0, 0, 0, 1, 1,
1.423438, -1.285951, 3.37042, 0, 0, 0, 1, 1,
1.441161, 0.1691647, 3.176473, 0, 0, 0, 1, 1,
1.442514, 1.146762, 0.5014864, 0, 0, 0, 1, 1,
1.442897, 0.9728364, 1.885541, 0, 0, 0, 1, 1,
1.443074, -0.118109, 1.689184, 1, 1, 1, 1, 1,
1.447192, 0.2260339, 1.942614, 1, 1, 1, 1, 1,
1.452196, -1.052583, -0.3547187, 1, 1, 1, 1, 1,
1.470999, 0.395028, 0.38387, 1, 1, 1, 1, 1,
1.481134, -0.430978, 3.771431, 1, 1, 1, 1, 1,
1.503936, -2.071386, 3.508834, 1, 1, 1, 1, 1,
1.504356, 0.1032359, -0.3251581, 1, 1, 1, 1, 1,
1.508093, 1.644165, 0.7870644, 1, 1, 1, 1, 1,
1.508766, -0.6279647, 1.68383, 1, 1, 1, 1, 1,
1.509316, -0.1374297, 2.074241, 1, 1, 1, 1, 1,
1.519986, 0.008915399, 0.5378658, 1, 1, 1, 1, 1,
1.521203, 0.1975351, 1.270685, 1, 1, 1, 1, 1,
1.541426, 0.1392099, 1.606748, 1, 1, 1, 1, 1,
1.569257, 0.8713, 0.3042888, 1, 1, 1, 1, 1,
1.570347, 1.975953, 0.00518387, 1, 1, 1, 1, 1,
1.572371, -2.516443, 3.976334, 0, 0, 1, 1, 1,
1.574827, 1.164484, 0.4763384, 1, 0, 0, 1, 1,
1.59465, 0.6931153, 1.24087, 1, 0, 0, 1, 1,
1.614164, -0.7844434, 4.844337, 1, 0, 0, 1, 1,
1.630305, 1.332466, 0.7050286, 1, 0, 0, 1, 1,
1.637555, -0.3230574, 0.7479138, 1, 0, 0, 1, 1,
1.670938, -0.5360141, 2.998218, 0, 0, 0, 1, 1,
1.692683, 0.5602165, 1.08597, 0, 0, 0, 1, 1,
1.730472, 1.240284, 1.294251, 0, 0, 0, 1, 1,
1.738833, -0.6606888, 1.903214, 0, 0, 0, 1, 1,
1.776342, -0.3581945, 0.7788225, 0, 0, 0, 1, 1,
1.777826, 0.9051988, 1.82041, 0, 0, 0, 1, 1,
1.781931, -0.01192196, 3.033981, 0, 0, 0, 1, 1,
1.805811, -0.386873, 2.90055, 1, 1, 1, 1, 1,
1.816038, 0.05388356, -0.02435213, 1, 1, 1, 1, 1,
1.822128, 2.414572, -0.585345, 1, 1, 1, 1, 1,
1.834981, -0.2079195, 0.7447735, 1, 1, 1, 1, 1,
1.853229, -0.439286, 3.289138, 1, 1, 1, 1, 1,
1.854694, -0.0900219, 1.743972, 1, 1, 1, 1, 1,
1.857488, -0.9628876, 3.267263, 1, 1, 1, 1, 1,
1.867268, 0.233209, 0.8412147, 1, 1, 1, 1, 1,
1.887138, 0.7456987, 1.147124, 1, 1, 1, 1, 1,
1.892772, -2.027016, 1.432212, 1, 1, 1, 1, 1,
1.906796, -0.5771526, 1.929664, 1, 1, 1, 1, 1,
1.917502, 0.1890832, 1.325305, 1, 1, 1, 1, 1,
1.949528, -0.6576865, 1.946676, 1, 1, 1, 1, 1,
1.960503, 0.2803161, -0.3505832, 1, 1, 1, 1, 1,
1.967751, -1.302408, 3.327109, 1, 1, 1, 1, 1,
2.022567, -1.030305, 3.966655, 0, 0, 1, 1, 1,
2.068403, 0.3948966, 0.9980633, 1, 0, 0, 1, 1,
2.106416, 0.4260206, 0.07816587, 1, 0, 0, 1, 1,
2.14941, 0.03612648, 0.9547898, 1, 0, 0, 1, 1,
2.151956, -1.199069, 1.692399, 1, 0, 0, 1, 1,
2.18385, 0.08555599, 2.279304, 1, 0, 0, 1, 1,
2.218031, 0.6010431, 2.64106, 0, 0, 0, 1, 1,
2.232117, 0.482036, -1.217173, 0, 0, 0, 1, 1,
2.233296, 0.4652727, 2.820864, 0, 0, 0, 1, 1,
2.24712, -0.2706625, 1.511964, 0, 0, 0, 1, 1,
2.26904, 0.735741, 1.501414, 0, 0, 0, 1, 1,
2.382179, 0.963473, 1.889273, 0, 0, 0, 1, 1,
2.433522, -1.427184, 2.932414, 0, 0, 0, 1, 1,
2.494988, -0.9056541, 0.5169238, 1, 1, 1, 1, 1,
2.528202, -2.17649, 1.520486, 1, 1, 1, 1, 1,
2.6125, 0.05251256, 0.762476, 1, 1, 1, 1, 1,
2.644992, 1.533234, 1.472876, 1, 1, 1, 1, 1,
2.649023, 0.9230742, 1.8963, 1, 1, 1, 1, 1,
2.763947, 0.9983465, 0.1829137, 1, 1, 1, 1, 1,
3.142896, -0.6628925, 1.765286, 1, 1, 1, 1, 1
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
var radius = 9.690279;
var distance = 34.03669;
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
mvMatrix.translate( 0.1093955, -0.09109759, -0.3152459 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.03669);
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
