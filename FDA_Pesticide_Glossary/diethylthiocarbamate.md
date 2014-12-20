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
-3.268368, -0.4596156, -0.8749455, 1, 0, 0, 1,
-3.138766, -1.279773, -1.569921, 1, 0.007843138, 0, 1,
-2.552822, 0.1435378, -2.152741, 1, 0.01176471, 0, 1,
-2.552515, -0.8672786, -1.744968, 1, 0.01960784, 0, 1,
-2.434672, 0.490009, -1.539413, 1, 0.02352941, 0, 1,
-2.415116, -0.7109793, -1.552049, 1, 0.03137255, 0, 1,
-2.409493, 0.0964625, -0.5188062, 1, 0.03529412, 0, 1,
-2.401932, 0.2194125, -1.263853, 1, 0.04313726, 0, 1,
-2.375257, -0.643102, -2.151248, 1, 0.04705882, 0, 1,
-2.357159, 0.8061786, -3.10308, 1, 0.05490196, 0, 1,
-2.352484, -0.1770831, -1.500634, 1, 0.05882353, 0, 1,
-2.318347, 0.7122044, -0.3550584, 1, 0.06666667, 0, 1,
-2.257042, -0.7835379, -2.574339, 1, 0.07058824, 0, 1,
-2.232187, 0.7700047, -2.654456, 1, 0.07843138, 0, 1,
-2.228928, 0.6779404, -0.8691471, 1, 0.08235294, 0, 1,
-2.203608, 0.4524096, -1.021287, 1, 0.09019608, 0, 1,
-2.131796, 0.174522, -1.011359, 1, 0.09411765, 0, 1,
-2.130671, 0.2505774, -1.923822, 1, 0.1019608, 0, 1,
-2.102042, -0.5750714, -2.107331, 1, 0.1098039, 0, 1,
-2.068701, -0.4149873, -2.343109, 1, 0.1137255, 0, 1,
-2.057703, 1.442521, 0.1309254, 1, 0.1215686, 0, 1,
-2.013871, 0.2870641, -1.573533, 1, 0.1254902, 0, 1,
-2.011039, 0.9015406, -1.79443, 1, 0.1333333, 0, 1,
-1.981654, 0.3346729, -1.555848, 1, 0.1372549, 0, 1,
-1.963537, 1.454957, -2.278547, 1, 0.145098, 0, 1,
-1.932021, 1.42315, -1.191053, 1, 0.1490196, 0, 1,
-1.915945, 2.18046, 1.343957, 1, 0.1568628, 0, 1,
-1.906269, 0.188983, -0.8466402, 1, 0.1607843, 0, 1,
-1.891598, -1.193416, -3.129621, 1, 0.1686275, 0, 1,
-1.826124, -1.291991, -2.076047, 1, 0.172549, 0, 1,
-1.803831, -0.3984137, -2.21315, 1, 0.1803922, 0, 1,
-1.790891, 0.5791933, -1.130089, 1, 0.1843137, 0, 1,
-1.789742, -0.7753581, -2.566507, 1, 0.1921569, 0, 1,
-1.772939, -0.6132781, -1.743479, 1, 0.1960784, 0, 1,
-1.756062, -0.1699813, -1.910028, 1, 0.2039216, 0, 1,
-1.755223, -0.3546542, -3.500345, 1, 0.2117647, 0, 1,
-1.739678, -0.05560023, -0.7828272, 1, 0.2156863, 0, 1,
-1.732933, -0.4457861, -2.910301, 1, 0.2235294, 0, 1,
-1.730704, -0.2415984, -2.172462, 1, 0.227451, 0, 1,
-1.728728, 0.4594361, -1.721582, 1, 0.2352941, 0, 1,
-1.727029, -0.7132592, -4.259398, 1, 0.2392157, 0, 1,
-1.720208, -0.3119085, -2.602673, 1, 0.2470588, 0, 1,
-1.705075, -0.9562771, 0.3636741, 1, 0.2509804, 0, 1,
-1.697327, 0.7227228, -0.6202835, 1, 0.2588235, 0, 1,
-1.690722, -0.7157067, -1.061273, 1, 0.2627451, 0, 1,
-1.687299, -0.4588403, -1.352539, 1, 0.2705882, 0, 1,
-1.683727, -0.8357611, -1.268142, 1, 0.2745098, 0, 1,
-1.682181, 0.621106, -1.360906, 1, 0.282353, 0, 1,
-1.677801, -0.3182044, -2.426991, 1, 0.2862745, 0, 1,
-1.675888, 1.936672, 0.09453069, 1, 0.2941177, 0, 1,
-1.667908, -1.017176, -2.368218, 1, 0.3019608, 0, 1,
-1.651504, -1.962081, -2.669584, 1, 0.3058824, 0, 1,
-1.650372, -0.3846884, -2.547857, 1, 0.3137255, 0, 1,
-1.645943, 0.4082137, -2.224524, 1, 0.3176471, 0, 1,
-1.642887, 0.5899081, -0.9173462, 1, 0.3254902, 0, 1,
-1.638889, 1.710912, -3.510518, 1, 0.3294118, 0, 1,
-1.624172, 0.2105756, -1.63286, 1, 0.3372549, 0, 1,
-1.61458, -0.7641737, -0.1305688, 1, 0.3411765, 0, 1,
-1.605075, -0.416514, -0.5513288, 1, 0.3490196, 0, 1,
-1.596756, 0.2802914, -2.302984, 1, 0.3529412, 0, 1,
-1.594207, -0.7002969, -0.9100669, 1, 0.3607843, 0, 1,
-1.572952, 0.4972558, 0.04834312, 1, 0.3647059, 0, 1,
-1.563486, 0.8021044, -1.725093, 1, 0.372549, 0, 1,
-1.562203, -1.020395, -2.263959, 1, 0.3764706, 0, 1,
-1.561875, 0.9873518, -2.096926, 1, 0.3843137, 0, 1,
-1.560577, -2.553498, -1.835148, 1, 0.3882353, 0, 1,
-1.550805, 0.2348952, -1.918144, 1, 0.3960784, 0, 1,
-1.54293, 0.170651, -3.37697, 1, 0.4039216, 0, 1,
-1.541169, 0.206251, -2.752754, 1, 0.4078431, 0, 1,
-1.515714, 0.8478118, -1.326208, 1, 0.4156863, 0, 1,
-1.510562, -1.222399, -1.847594, 1, 0.4196078, 0, 1,
-1.509127, 0.3869432, -0.5214821, 1, 0.427451, 0, 1,
-1.507946, 0.9793367, -2.157183, 1, 0.4313726, 0, 1,
-1.507125, 0.6874672, -1.357238, 1, 0.4392157, 0, 1,
-1.493566, -0.881547, -2.908677, 1, 0.4431373, 0, 1,
-1.485671, -2.340075, -3.289451, 1, 0.4509804, 0, 1,
-1.477435, 1.458067, -2.245264, 1, 0.454902, 0, 1,
-1.461386, 0.05464674, -1.591082, 1, 0.4627451, 0, 1,
-1.439281, 0.07248997, -0.736347, 1, 0.4666667, 0, 1,
-1.435877, 0.6364587, -2.199537, 1, 0.4745098, 0, 1,
-1.418257, 0.7131897, -0.4687856, 1, 0.4784314, 0, 1,
-1.412336, 0.2261517, -0.03102214, 1, 0.4862745, 0, 1,
-1.404048, 0.5500356, -0.6529577, 1, 0.4901961, 0, 1,
-1.389224, 0.9020219, -1.841085, 1, 0.4980392, 0, 1,
-1.387802, 1.333305, -0.4793192, 1, 0.5058824, 0, 1,
-1.380207, -2.637881, -2.937504, 1, 0.509804, 0, 1,
-1.379684, 1.103916, -2.29353, 1, 0.5176471, 0, 1,
-1.373963, -0.8191928, -1.468869, 1, 0.5215687, 0, 1,
-1.365646, 1.115471, -2.593854, 1, 0.5294118, 0, 1,
-1.361734, -0.0769112, 0.5303861, 1, 0.5333334, 0, 1,
-1.359432, -0.1714991, -1.4657, 1, 0.5411765, 0, 1,
-1.356251, -2.027964, -1.657356, 1, 0.5450981, 0, 1,
-1.348196, -0.6365473, -1.177407, 1, 0.5529412, 0, 1,
-1.343814, -0.9796966, -2.105052, 1, 0.5568628, 0, 1,
-1.333037, 1.194735, -0.9899822, 1, 0.5647059, 0, 1,
-1.329715, 0.1170324, 0.9681004, 1, 0.5686275, 0, 1,
-1.329519, 0.5033462, -2.511517, 1, 0.5764706, 0, 1,
-1.327622, -0.5541645, -2.718606, 1, 0.5803922, 0, 1,
-1.317091, 0.9058369, -1.984376, 1, 0.5882353, 0, 1,
-1.294576, 0.1245173, -1.030459, 1, 0.5921569, 0, 1,
-1.293514, 1.347857, 1.006741, 1, 0.6, 0, 1,
-1.291359, -2.466546, -4.145854, 1, 0.6078432, 0, 1,
-1.281488, -0.3883472, -2.327973, 1, 0.6117647, 0, 1,
-1.264283, 1.2425, -1.191841, 1, 0.6196079, 0, 1,
-1.258796, -0.05804277, -3.549625, 1, 0.6235294, 0, 1,
-1.251259, -0.0610279, -1.523497, 1, 0.6313726, 0, 1,
-1.247615, -0.9295524, -1.763664, 1, 0.6352941, 0, 1,
-1.24347, -0.2222122, -1.109067, 1, 0.6431373, 0, 1,
-1.242289, -0.4588815, -2.3047, 1, 0.6470588, 0, 1,
-1.236864, -1.520191, -3.664598, 1, 0.654902, 0, 1,
-1.236697, 0.1378967, -2.953787, 1, 0.6588235, 0, 1,
-1.218962, -0.6076655, -1.082582, 1, 0.6666667, 0, 1,
-1.191718, 0.06798225, -2.967957, 1, 0.6705883, 0, 1,
-1.178843, -0.5837019, -2.300353, 1, 0.6784314, 0, 1,
-1.173219, 0.4493668, -1.918708, 1, 0.682353, 0, 1,
-1.170404, -0.7258375, -0.7771966, 1, 0.6901961, 0, 1,
-1.167548, -0.3976498, -0.5034574, 1, 0.6941177, 0, 1,
-1.154263, -0.9752045, -1.404737, 1, 0.7019608, 0, 1,
-1.147474, -0.7962202, -4.461949, 1, 0.7098039, 0, 1,
-1.141183, 0.3594323, -1.621737, 1, 0.7137255, 0, 1,
-1.139549, -0.0690624, -2.351039, 1, 0.7215686, 0, 1,
-1.132872, 1.203707, -0.9691103, 1, 0.7254902, 0, 1,
-1.130449, -0.5161986, -2.401159, 1, 0.7333333, 0, 1,
-1.128533, 0.6815161, -2.351179, 1, 0.7372549, 0, 1,
-1.125173, -0.6165646, -2.188606, 1, 0.7450981, 0, 1,
-1.122907, 0.8721129, -2.615613, 1, 0.7490196, 0, 1,
-1.118936, 0.5667517, -1.495577, 1, 0.7568628, 0, 1,
-1.112412, 1.352912, -1.702299, 1, 0.7607843, 0, 1,
-1.104808, -0.8473178, -0.3295604, 1, 0.7686275, 0, 1,
-1.09627, 0.1911375, -0.6042551, 1, 0.772549, 0, 1,
-1.093349, -1.508419, -1.287374, 1, 0.7803922, 0, 1,
-1.092453, -0.7583502, -2.13552, 1, 0.7843137, 0, 1,
-1.092082, -1.145967, -3.601627, 1, 0.7921569, 0, 1,
-1.088871, -0.5842183, -1.37626, 1, 0.7960784, 0, 1,
-1.083434, 1.527119, -1.075492, 1, 0.8039216, 0, 1,
-1.07253, -0.2014303, -2.881327, 1, 0.8117647, 0, 1,
-1.072283, -0.3423866, -1.896048, 1, 0.8156863, 0, 1,
-1.070846, -1.075927, -2.323878, 1, 0.8235294, 0, 1,
-1.066391, -1.150985, -2.948909, 1, 0.827451, 0, 1,
-1.062832, -2.743111, -3.333055, 1, 0.8352941, 0, 1,
-1.061634, -0.3449641, -1.64064, 1, 0.8392157, 0, 1,
-1.04576, -0.8551067, -2.71341, 1, 0.8470588, 0, 1,
-1.043738, 1.288794, -1.581234, 1, 0.8509804, 0, 1,
-1.040903, 1.25795, 0.229653, 1, 0.8588235, 0, 1,
-1.032001, -0.6499003, -1.057224, 1, 0.8627451, 0, 1,
-1.030084, -0.1135412, -1.46361, 1, 0.8705882, 0, 1,
-1.029784, 0.09085223, -0.7603624, 1, 0.8745098, 0, 1,
-1.027855, -0.04017538, -1.636171, 1, 0.8823529, 0, 1,
-1.012121, -0.7939336, -1.455407, 1, 0.8862745, 0, 1,
-1.011814, 2.872242, -0.1932102, 1, 0.8941177, 0, 1,
-1.010908, -0.5470644, -3.936679, 1, 0.8980392, 0, 1,
-0.9988784, 1.180763, -0.6084893, 1, 0.9058824, 0, 1,
-0.9982416, 0.2682497, -1.978445, 1, 0.9137255, 0, 1,
-0.9798706, 1.884422, -2.113265, 1, 0.9176471, 0, 1,
-0.9768187, 1.344371, -1.664212, 1, 0.9254902, 0, 1,
-0.9711905, 0.5148706, -0.7944844, 1, 0.9294118, 0, 1,
-0.9711631, 1.126506, 0.1683303, 1, 0.9372549, 0, 1,
-0.9711089, 0.8280478, -1.911539, 1, 0.9411765, 0, 1,
-0.9700397, -0.3202555, -1.640269, 1, 0.9490196, 0, 1,
-0.9669396, -0.9785921, -4.059838, 1, 0.9529412, 0, 1,
-0.9663986, 0.1611212, -2.602449, 1, 0.9607843, 0, 1,
-0.9610925, 1.215769, 0.6233608, 1, 0.9647059, 0, 1,
-0.9583663, 0.6505273, -1.74509, 1, 0.972549, 0, 1,
-0.9491598, -0.5438212, -2.102845, 1, 0.9764706, 0, 1,
-0.948107, -0.3110248, -2.727513, 1, 0.9843137, 0, 1,
-0.9365924, 1.388195, 0.194354, 1, 0.9882353, 0, 1,
-0.9170046, -0.9439999, -3.04606, 1, 0.9960784, 0, 1,
-0.9147484, 0.4840259, -0.03453586, 0.9960784, 1, 0, 1,
-0.9132939, -0.02711442, -0.2843572, 0.9921569, 1, 0, 1,
-0.9132203, -0.7365693, -2.752071, 0.9843137, 1, 0, 1,
-0.9009873, 0.1179199, 0.5814303, 0.9803922, 1, 0, 1,
-0.9008677, 0.2095768, -1.00169, 0.972549, 1, 0, 1,
-0.8926635, -0.3965923, -4.198206, 0.9686275, 1, 0, 1,
-0.8912758, 0.3444063, 0.2522169, 0.9607843, 1, 0, 1,
-0.8912274, -0.8868545, -3.425165, 0.9568627, 1, 0, 1,
-0.8898789, -0.3385377, -2.596026, 0.9490196, 1, 0, 1,
-0.8823555, 0.411145, -2.842551, 0.945098, 1, 0, 1,
-0.8751408, -0.4320855, -0.4768357, 0.9372549, 1, 0, 1,
-0.8708935, -1.652446, -2.632512, 0.9333333, 1, 0, 1,
-0.8690611, -1.572755, -3.57645, 0.9254902, 1, 0, 1,
-0.8681634, -0.5823964, -0.2554458, 0.9215686, 1, 0, 1,
-0.8646922, 1.471353, -2.098305, 0.9137255, 1, 0, 1,
-0.8631985, 0.2461293, -1.429757, 0.9098039, 1, 0, 1,
-0.8585697, -0.5085945, -0.7720464, 0.9019608, 1, 0, 1,
-0.8584708, 0.3119721, 0.9418094, 0.8941177, 1, 0, 1,
-0.8582562, 0.6104791, -0.9319992, 0.8901961, 1, 0, 1,
-0.8532326, -0.8653309, -1.50541, 0.8823529, 1, 0, 1,
-0.8500713, 0.3553531, -1.321384, 0.8784314, 1, 0, 1,
-0.8349535, 1.254769, 0.3898972, 0.8705882, 1, 0, 1,
-0.8339542, -1.119277, -2.471333, 0.8666667, 1, 0, 1,
-0.8331202, -0.9039935, -2.295356, 0.8588235, 1, 0, 1,
-0.8326446, -0.2112052, -1.98494, 0.854902, 1, 0, 1,
-0.8290953, -1.205573, -1.067494, 0.8470588, 1, 0, 1,
-0.8286716, -0.301012, -2.999423, 0.8431373, 1, 0, 1,
-0.8283407, 0.3867852, -0.5766434, 0.8352941, 1, 0, 1,
-0.8260998, -1.681418, -2.768241, 0.8313726, 1, 0, 1,
-0.8249972, -1.219746, -2.445193, 0.8235294, 1, 0, 1,
-0.8175732, 1.145783, 0.2266649, 0.8196079, 1, 0, 1,
-0.8119199, 0.3797356, -0.761592, 0.8117647, 1, 0, 1,
-0.8097834, 0.06403822, -2.302529, 0.8078431, 1, 0, 1,
-0.7951453, 1.061425, 0.5502731, 0.8, 1, 0, 1,
-0.78769, -0.2140365, 0.02204637, 0.7921569, 1, 0, 1,
-0.7864558, 0.02855713, -1.677611, 0.7882353, 1, 0, 1,
-0.7849582, -0.3674215, -1.234355, 0.7803922, 1, 0, 1,
-0.7834263, -0.2083258, -1.30921, 0.7764706, 1, 0, 1,
-0.7819901, -1.058735, -5.369052, 0.7686275, 1, 0, 1,
-0.7772424, -0.347791, -2.148106, 0.7647059, 1, 0, 1,
-0.775142, 0.5331804, -1.427294, 0.7568628, 1, 0, 1,
-0.7738711, 0.02520159, -1.612647, 0.7529412, 1, 0, 1,
-0.766355, -0.3436399, -4.397358, 0.7450981, 1, 0, 1,
-0.7631456, 0.8702259, 0.789627, 0.7411765, 1, 0, 1,
-0.7619942, 0.7015076, -2.316855, 0.7333333, 1, 0, 1,
-0.7592385, -0.5138894, -2.524632, 0.7294118, 1, 0, 1,
-0.7565299, 1.607648, -0.0507485, 0.7215686, 1, 0, 1,
-0.7565073, 0.4849286, -0.7820899, 0.7176471, 1, 0, 1,
-0.7563109, -0.5448566, -1.06445, 0.7098039, 1, 0, 1,
-0.7552806, -2.171178, -4.35972, 0.7058824, 1, 0, 1,
-0.7530901, -0.9808648, -1.374742, 0.6980392, 1, 0, 1,
-0.7525936, -0.06851723, 0.0781585, 0.6901961, 1, 0, 1,
-0.7514081, -0.6484528, -0.360256, 0.6862745, 1, 0, 1,
-0.7495931, -2.502568, -0.8621916, 0.6784314, 1, 0, 1,
-0.7406641, -0.6224642, -2.801142, 0.6745098, 1, 0, 1,
-0.7334356, -0.4333927, -1.985744, 0.6666667, 1, 0, 1,
-0.7307268, 0.2469146, -0.4702733, 0.6627451, 1, 0, 1,
-0.7304384, 0.625423, -0.08723433, 0.654902, 1, 0, 1,
-0.7240013, 1.03374, -0.3922226, 0.6509804, 1, 0, 1,
-0.7222755, -0.5333939, -3.830121, 0.6431373, 1, 0, 1,
-0.7210692, -0.3895872, -0.876735, 0.6392157, 1, 0, 1,
-0.7184908, -0.07293598, -1.623541, 0.6313726, 1, 0, 1,
-0.7178804, 0.4721187, -1.89913, 0.627451, 1, 0, 1,
-0.7167001, 0.1547116, -0.7439913, 0.6196079, 1, 0, 1,
-0.7114204, 0.5743873, -1.530762, 0.6156863, 1, 0, 1,
-0.703487, 1.666715, -2.284406, 0.6078432, 1, 0, 1,
-0.699971, 0.1041796, -2.532696, 0.6039216, 1, 0, 1,
-0.6961511, -0.8747061, -1.980327, 0.5960785, 1, 0, 1,
-0.6915135, 0.3753548, -1.762972, 0.5882353, 1, 0, 1,
-0.6901183, 0.0677846, -1.916661, 0.5843138, 1, 0, 1,
-0.6867073, -1.21609, -1.738642, 0.5764706, 1, 0, 1,
-0.6836459, -1.033808, -2.405654, 0.572549, 1, 0, 1,
-0.6821116, -0.9154556, -2.887856, 0.5647059, 1, 0, 1,
-0.6815236, 0.7691498, 0.02909675, 0.5607843, 1, 0, 1,
-0.6765172, -1.25521, -2.420189, 0.5529412, 1, 0, 1,
-0.671918, 0.08276676, -3.468929, 0.5490196, 1, 0, 1,
-0.6705406, 0.1993831, -0.4672701, 0.5411765, 1, 0, 1,
-0.6700758, -0.1398658, -1.974065, 0.5372549, 1, 0, 1,
-0.6668671, -0.03505986, -1.116115, 0.5294118, 1, 0, 1,
-0.6665625, -1.633654, -2.33454, 0.5254902, 1, 0, 1,
-0.6649594, 2.48475, 0.8116575, 0.5176471, 1, 0, 1,
-0.6583515, 0.6922299, 0.1088521, 0.5137255, 1, 0, 1,
-0.6563138, 0.4453434, -0.05660968, 0.5058824, 1, 0, 1,
-0.653132, 0.6894062, 0.1514496, 0.5019608, 1, 0, 1,
-0.6522541, 0.2482724, -1.941243, 0.4941176, 1, 0, 1,
-0.6452922, 0.980245, 2.111739, 0.4862745, 1, 0, 1,
-0.6437367, -1.100791, -3.372126, 0.4823529, 1, 0, 1,
-0.6431227, 0.365655, -1.364233, 0.4745098, 1, 0, 1,
-0.6412767, -0.8115965, -2.729192, 0.4705882, 1, 0, 1,
-0.6375578, 0.5963082, -1.236767, 0.4627451, 1, 0, 1,
-0.6322587, 0.5759847, 0.1306756, 0.4588235, 1, 0, 1,
-0.6303426, 1.047415, -0.09286618, 0.4509804, 1, 0, 1,
-0.6272501, -0.09584148, 0.4077532, 0.4470588, 1, 0, 1,
-0.6240686, 0.5699722, -0.9093815, 0.4392157, 1, 0, 1,
-0.6228051, -1.679081, -1.57153, 0.4352941, 1, 0, 1,
-0.6207994, -0.7041929, -1.878414, 0.427451, 1, 0, 1,
-0.6204771, 0.1939183, -1.498063, 0.4235294, 1, 0, 1,
-0.6038612, 0.9089155, 2.321538, 0.4156863, 1, 0, 1,
-0.5996752, 2.127013, -1.710094, 0.4117647, 1, 0, 1,
-0.5984676, -0.04613489, -0.3431644, 0.4039216, 1, 0, 1,
-0.5983353, -1.07561, -3.487585, 0.3960784, 1, 0, 1,
-0.5966269, 0.9833693, -0.9616941, 0.3921569, 1, 0, 1,
-0.5957761, 1.041969, 0.06507991, 0.3843137, 1, 0, 1,
-0.5880682, 0.04211989, -1.594513, 0.3803922, 1, 0, 1,
-0.5842102, 0.6467581, -1.69573, 0.372549, 1, 0, 1,
-0.5817514, 0.2004327, -1.773844, 0.3686275, 1, 0, 1,
-0.5803418, 0.95797, -1.013668, 0.3607843, 1, 0, 1,
-0.5794269, 0.1026478, -1.4086, 0.3568628, 1, 0, 1,
-0.5782547, 0.4963294, -0.4023497, 0.3490196, 1, 0, 1,
-0.5782526, -0.971794, -2.947232, 0.345098, 1, 0, 1,
-0.5769451, -0.3028473, -1.061131, 0.3372549, 1, 0, 1,
-0.572612, -0.6721818, -1.482928, 0.3333333, 1, 0, 1,
-0.5719545, -0.3248753, -1.919755, 0.3254902, 1, 0, 1,
-0.5709649, 0.8072556, -0.09235461, 0.3215686, 1, 0, 1,
-0.5665894, 1.159828, -1.441841, 0.3137255, 1, 0, 1,
-0.5637949, 0.8464509, -0.1497379, 0.3098039, 1, 0, 1,
-0.5625864, 0.1689718, -0.575806, 0.3019608, 1, 0, 1,
-0.5581419, 0.1280439, -2.326695, 0.2941177, 1, 0, 1,
-0.556187, 0.6429055, -0.8005263, 0.2901961, 1, 0, 1,
-0.5551761, 0.6374888, -1.120197, 0.282353, 1, 0, 1,
-0.5533922, 0.2001425, -1.628184, 0.2784314, 1, 0, 1,
-0.5515148, -0.4823349, -0.3152652, 0.2705882, 1, 0, 1,
-0.5504873, -0.7516031, -2.656937, 0.2666667, 1, 0, 1,
-0.5358735, 0.01805768, 0.01377298, 0.2588235, 1, 0, 1,
-0.5333024, 0.7224442, -1.547565, 0.254902, 1, 0, 1,
-0.5313247, -1.269318, -2.527046, 0.2470588, 1, 0, 1,
-0.5250705, -0.5261192, -1.873076, 0.2431373, 1, 0, 1,
-0.5222266, 1.428114, -1.337002, 0.2352941, 1, 0, 1,
-0.5214, -0.201211, -1.819514, 0.2313726, 1, 0, 1,
-0.5206408, 0.2085094, 0.001709304, 0.2235294, 1, 0, 1,
-0.5204217, 0.2576411, -3.259906, 0.2196078, 1, 0, 1,
-0.5203127, -0.3040641, -3.111187, 0.2117647, 1, 0, 1,
-0.5172905, -0.9159896, -3.185058, 0.2078431, 1, 0, 1,
-0.5172511, 0.521238, -3.062021, 0.2, 1, 0, 1,
-0.5118957, -0.8514788, -0.4181734, 0.1921569, 1, 0, 1,
-0.5054724, -0.4000196, -1.716166, 0.1882353, 1, 0, 1,
-0.505073, -0.6280438, -1.464885, 0.1803922, 1, 0, 1,
-0.498532, 1.042284, 0.1391144, 0.1764706, 1, 0, 1,
-0.4985033, -1.001939, -3.957834, 0.1686275, 1, 0, 1,
-0.4935771, -0.6644205, -2.00144, 0.1647059, 1, 0, 1,
-0.492463, -0.5371763, -0.4624562, 0.1568628, 1, 0, 1,
-0.4911891, 0.3418908, -0.4996259, 0.1529412, 1, 0, 1,
-0.4910375, 0.781884, -1.346614, 0.145098, 1, 0, 1,
-0.4868289, -0.4011946, -2.784605, 0.1411765, 1, 0, 1,
-0.4860291, 1.25804, -0.7137741, 0.1333333, 1, 0, 1,
-0.4833267, -0.8432465, -0.6850382, 0.1294118, 1, 0, 1,
-0.4786036, 1.045044, -0.1029068, 0.1215686, 1, 0, 1,
-0.4731849, -1.620219, -2.477688, 0.1176471, 1, 0, 1,
-0.4719946, -0.9937256, -2.842693, 0.1098039, 1, 0, 1,
-0.4708496, -0.7754398, -1.323221, 0.1058824, 1, 0, 1,
-0.469862, -0.3347062, -2.242742, 0.09803922, 1, 0, 1,
-0.4695547, 0.1985062, -1.223095, 0.09019608, 1, 0, 1,
-0.4691091, -0.8542703, 0.1624952, 0.08627451, 1, 0, 1,
-0.4624753, -0.4260785, -3.597976, 0.07843138, 1, 0, 1,
-0.4612387, 0.5526326, -2.299854, 0.07450981, 1, 0, 1,
-0.4607756, 0.8420329, 0.7755648, 0.06666667, 1, 0, 1,
-0.4605402, -0.9909731, -2.372536, 0.0627451, 1, 0, 1,
-0.4604819, 0.1789491, -1.661262, 0.05490196, 1, 0, 1,
-0.4579524, -1.479393, -2.935953, 0.05098039, 1, 0, 1,
-0.4476982, 0.06168507, -3.358984, 0.04313726, 1, 0, 1,
-0.4439063, -1.209897, -2.484917, 0.03921569, 1, 0, 1,
-0.4415693, -0.972451, -2.539044, 0.03137255, 1, 0, 1,
-0.4383188, 0.3426355, -0.4804412, 0.02745098, 1, 0, 1,
-0.4371144, 1.32156, 0.871985, 0.01960784, 1, 0, 1,
-0.4352279, 0.5251268, -1.379236, 0.01568628, 1, 0, 1,
-0.4320079, 0.727153, 0.5336751, 0.007843138, 1, 0, 1,
-0.4265952, 2.053672, -0.5906902, 0.003921569, 1, 0, 1,
-0.4234651, -1.384624, -1.295175, 0, 1, 0.003921569, 1,
-0.4197723, -0.1266689, -2.451767, 0, 1, 0.01176471, 1,
-0.4153626, 1.221403, -0.5304285, 0, 1, 0.01568628, 1,
-0.4150489, -0.5055224, -1.671559, 0, 1, 0.02352941, 1,
-0.4134856, -0.883585, -2.970375, 0, 1, 0.02745098, 1,
-0.4119756, 0.4684718, -1.16925, 0, 1, 0.03529412, 1,
-0.4107223, -0.6116937, -4.885976, 0, 1, 0.03921569, 1,
-0.4107109, -1.046955, -4.368134, 0, 1, 0.04705882, 1,
-0.4103458, 0.5586303, -2.232976, 0, 1, 0.05098039, 1,
-0.4082621, 0.5536653, -0.2229909, 0, 1, 0.05882353, 1,
-0.4061595, 0.1730531, -1.927444, 0, 1, 0.0627451, 1,
-0.3995879, -0.4570561, -2.275032, 0, 1, 0.07058824, 1,
-0.3986228, -1.517377, -2.443201, 0, 1, 0.07450981, 1,
-0.3985896, 0.07837061, -1.590616, 0, 1, 0.08235294, 1,
-0.395622, 0.5679198, -0.9647619, 0, 1, 0.08627451, 1,
-0.3902044, 0.5691449, 1.038934, 0, 1, 0.09411765, 1,
-0.3894742, 0.9961208, -2.084641, 0, 1, 0.1019608, 1,
-0.3894137, 1.720919, -1.161889, 0, 1, 0.1058824, 1,
-0.3873743, -0.7606488, -3.079437, 0, 1, 0.1137255, 1,
-0.3833381, -0.6460881, -1.975609, 0, 1, 0.1176471, 1,
-0.3832192, 0.9842541, 1.342193, 0, 1, 0.1254902, 1,
-0.3755244, -0.6847112, -3.55189, 0, 1, 0.1294118, 1,
-0.374341, 0.4743205, -0.8691587, 0, 1, 0.1372549, 1,
-0.3733238, 1.453615, 0.310912, 0, 1, 0.1411765, 1,
-0.371657, 0.01400868, 0.1686818, 0, 1, 0.1490196, 1,
-0.3705829, -0.8282231, -2.004116, 0, 1, 0.1529412, 1,
-0.3666846, -0.7028183, -2.423105, 0, 1, 0.1607843, 1,
-0.3658152, -1.798694, -2.445234, 0, 1, 0.1647059, 1,
-0.3654508, -1.02876, -3.630586, 0, 1, 0.172549, 1,
-0.3636605, 1.737364, -0.1284183, 0, 1, 0.1764706, 1,
-0.3625823, 1.356338, -1.190333, 0, 1, 0.1843137, 1,
-0.3605537, -0.5005252, -2.786237, 0, 1, 0.1882353, 1,
-0.3493212, 0.3823637, -0.3099817, 0, 1, 0.1960784, 1,
-0.3445435, -0.9016289, -4.202141, 0, 1, 0.2039216, 1,
-0.3414422, 1.390791, -0.2232826, 0, 1, 0.2078431, 1,
-0.3356382, 1.154389, 2.027728, 0, 1, 0.2156863, 1,
-0.3297533, -1.474539, -1.598653, 0, 1, 0.2196078, 1,
-0.3291632, 0.4673212, -0.05173077, 0, 1, 0.227451, 1,
-0.3290136, 1.126102, -0.6320193, 0, 1, 0.2313726, 1,
-0.3263602, 0.3381327, 0.5226713, 0, 1, 0.2392157, 1,
-0.32358, -0.1750105, -2.582454, 0, 1, 0.2431373, 1,
-0.3220723, -0.2926201, -2.350179, 0, 1, 0.2509804, 1,
-0.3162092, 0.4269372, 0.2964987, 0, 1, 0.254902, 1,
-0.3130411, 0.1454876, -0.1677883, 0, 1, 0.2627451, 1,
-0.3117768, 0.9289942, -0.7500442, 0, 1, 0.2666667, 1,
-0.310464, 2.446671, -1.001918, 0, 1, 0.2745098, 1,
-0.3077326, -0.7637441, -0.999069, 0, 1, 0.2784314, 1,
-0.3041545, -0.1790619, -3.393647, 0, 1, 0.2862745, 1,
-0.3006949, -2.051754, -2.174863, 0, 1, 0.2901961, 1,
-0.3000045, -1.645831, -3.612871, 0, 1, 0.2980392, 1,
-0.2855631, 0.6211043, -0.7842939, 0, 1, 0.3058824, 1,
-0.2821435, 0.4068892, 0.07340253, 0, 1, 0.3098039, 1,
-0.2808627, 1.012203, -1.479211, 0, 1, 0.3176471, 1,
-0.2808005, 1.406766, 0.2090575, 0, 1, 0.3215686, 1,
-0.2797664, -1.002699, -3.234228, 0, 1, 0.3294118, 1,
-0.2770424, 0.3072607, 0.4545969, 0, 1, 0.3333333, 1,
-0.2694567, 0.743048, 0.4220841, 0, 1, 0.3411765, 1,
-0.2674998, -0.258113, -2.120467, 0, 1, 0.345098, 1,
-0.2674825, -1.095902, -2.832273, 0, 1, 0.3529412, 1,
-0.26226, 0.1854367, -1.757247, 0, 1, 0.3568628, 1,
-0.2584024, 1.513078, 0.02910054, 0, 1, 0.3647059, 1,
-0.2583783, -0.9547578, -4.683828, 0, 1, 0.3686275, 1,
-0.256982, 0.3084616, -0.90453, 0, 1, 0.3764706, 1,
-0.2555141, -0.3247512, -0.4752924, 0, 1, 0.3803922, 1,
-0.2527201, 1.674239, 0.8892184, 0, 1, 0.3882353, 1,
-0.2522314, 0.9199655, 0.003499769, 0, 1, 0.3921569, 1,
-0.2512192, -0.5238336, -1.634335, 0, 1, 0.4, 1,
-0.247544, 0.992739, 0.8865112, 0, 1, 0.4078431, 1,
-0.2471117, 1.845845, 1.00728, 0, 1, 0.4117647, 1,
-0.2398537, -1.188946, -3.463129, 0, 1, 0.4196078, 1,
-0.2397427, 1.369557, 1.046895, 0, 1, 0.4235294, 1,
-0.2345688, -0.4102375, -0.9585013, 0, 1, 0.4313726, 1,
-0.2345207, 0.7949602, -0.528056, 0, 1, 0.4352941, 1,
-0.2303471, -0.3721815, -3.258486, 0, 1, 0.4431373, 1,
-0.2302895, 1.99941, 0.4763019, 0, 1, 0.4470588, 1,
-0.2280172, -0.3105185, -1.830675, 0, 1, 0.454902, 1,
-0.2204978, 0.09524667, -1.367366, 0, 1, 0.4588235, 1,
-0.2168182, 0.3245893, -1.112579, 0, 1, 0.4666667, 1,
-0.2167233, -0.3817216, -1.540927, 0, 1, 0.4705882, 1,
-0.2164682, -1.125817, -1.38055, 0, 1, 0.4784314, 1,
-0.2153573, -0.28615, -2.27869, 0, 1, 0.4823529, 1,
-0.2138929, -0.3429115, -2.745708, 0, 1, 0.4901961, 1,
-0.2110066, -0.0335238, -3.712402, 0, 1, 0.4941176, 1,
-0.2098953, -0.3881448, -2.00144, 0, 1, 0.5019608, 1,
-0.2096605, -0.4157381, -2.986629, 0, 1, 0.509804, 1,
-0.2028111, -0.6306266, -3.511378, 0, 1, 0.5137255, 1,
-0.2016662, -1.848223, -4.388386, 0, 1, 0.5215687, 1,
-0.1978965, 0.1318306, -2.678008, 0, 1, 0.5254902, 1,
-0.18956, 0.1136397, -2.963213, 0, 1, 0.5333334, 1,
-0.1895307, 1.253252, 1.295886, 0, 1, 0.5372549, 1,
-0.1894934, -0.4695321, -2.915434, 0, 1, 0.5450981, 1,
-0.1892019, -0.2146724, -1.873618, 0, 1, 0.5490196, 1,
-0.1887417, 2.066257, -0.6693255, 0, 1, 0.5568628, 1,
-0.1873015, 0.5257647, -0.4306655, 0, 1, 0.5607843, 1,
-0.1867671, -0.2802731, -3.216345, 0, 1, 0.5686275, 1,
-0.1858911, -0.2997283, -2.072604, 0, 1, 0.572549, 1,
-0.1850698, -1.210329, -2.894768, 0, 1, 0.5803922, 1,
-0.1835295, 0.6217693, 0.1092152, 0, 1, 0.5843138, 1,
-0.1796663, 1.337732, -1.379879, 0, 1, 0.5921569, 1,
-0.1775002, 0.4131184, -0.4921754, 0, 1, 0.5960785, 1,
-0.1747978, -1.76686, -1.403645, 0, 1, 0.6039216, 1,
-0.1713838, 2.239937, -0.003576109, 0, 1, 0.6117647, 1,
-0.1683359, 0.2373661, -1.439137, 0, 1, 0.6156863, 1,
-0.1665648, 0.6593026, -1.225944, 0, 1, 0.6235294, 1,
-0.1588127, -0.532265, -3.309102, 0, 1, 0.627451, 1,
-0.1563555, -0.3457131, -0.974825, 0, 1, 0.6352941, 1,
-0.1539339, 0.2846445, 0.2494347, 0, 1, 0.6392157, 1,
-0.1466689, 0.3270309, 0.104986, 0, 1, 0.6470588, 1,
-0.1435298, 0.1809977, -1.613267, 0, 1, 0.6509804, 1,
-0.1434512, -1.520679, -1.686721, 0, 1, 0.6588235, 1,
-0.1405312, 0.887412, -0.6362297, 0, 1, 0.6627451, 1,
-0.1375624, 0.3342584, -1.502286, 0, 1, 0.6705883, 1,
-0.1330984, -0.4151336, -2.820553, 0, 1, 0.6745098, 1,
-0.1298904, -1.525913, -2.68225, 0, 1, 0.682353, 1,
-0.1237519, 1.71762, 1.132196, 0, 1, 0.6862745, 1,
-0.1179302, 0.8843149, 2.006344, 0, 1, 0.6941177, 1,
-0.1144356, -0.2032949, -3.592962, 0, 1, 0.7019608, 1,
-0.1088646, -1.158106, -2.488923, 0, 1, 0.7058824, 1,
-0.09914716, 0.3561157, 0.1048612, 0, 1, 0.7137255, 1,
-0.0985622, 1.834083, 0.05203465, 0, 1, 0.7176471, 1,
-0.09735411, 1.645867, -1.428087, 0, 1, 0.7254902, 1,
-0.09692903, -1.730043, -2.529732, 0, 1, 0.7294118, 1,
-0.07555496, 2.945849, -1.436247, 0, 1, 0.7372549, 1,
-0.07234414, 0.8547928, 0.6596955, 0, 1, 0.7411765, 1,
-0.0697797, -0.3770171, -1.892675, 0, 1, 0.7490196, 1,
-0.06768912, 1.5171, -1.584059, 0, 1, 0.7529412, 1,
-0.06636303, 0.08434904, 0.04067864, 0, 1, 0.7607843, 1,
-0.0654403, -0.7871756, -3.311769, 0, 1, 0.7647059, 1,
-0.06423488, 1.74225, -0.7669852, 0, 1, 0.772549, 1,
-0.06302269, 0.6602937, -0.5370157, 0, 1, 0.7764706, 1,
-0.06073739, 1.260953, 0.7617745, 0, 1, 0.7843137, 1,
-0.05871095, -0.0616552, -4.695238, 0, 1, 0.7882353, 1,
-0.05836594, -0.3395663, -3.519097, 0, 1, 0.7960784, 1,
-0.05231884, -0.1637897, -2.545945, 0, 1, 0.8039216, 1,
-0.04928693, 0.2497859, -1.535219, 0, 1, 0.8078431, 1,
-0.0432931, -1.093818, -5.944344, 0, 1, 0.8156863, 1,
-0.04214209, 0.5611468, -0.562139, 0, 1, 0.8196079, 1,
-0.03804108, 0.9414052, 0.7164446, 0, 1, 0.827451, 1,
-0.03390679, -0.4029493, -1.353429, 0, 1, 0.8313726, 1,
-0.03272882, -0.4931133, -2.948362, 0, 1, 0.8392157, 1,
-0.03051264, 0.3128565, -0.03974043, 0, 1, 0.8431373, 1,
-0.02708415, -0.4320253, -3.533767, 0, 1, 0.8509804, 1,
-0.0238851, 0.1023161, -1.270057, 0, 1, 0.854902, 1,
-0.02189836, 0.637755, 0.1952443, 0, 1, 0.8627451, 1,
-0.02114379, 0.05701434, -1.720908, 0, 1, 0.8666667, 1,
-0.02020966, -0.2086875, -5.252509, 0, 1, 0.8745098, 1,
-0.01939883, 1.254227, -1.339515, 0, 1, 0.8784314, 1,
-0.01548036, 1.924865, -0.3285437, 0, 1, 0.8862745, 1,
-0.01346395, -0.6331255, -4.057679, 0, 1, 0.8901961, 1,
-0.01279235, 1.607366, 0.6030893, 0, 1, 0.8980392, 1,
-0.01265028, -0.8659249, -2.514033, 0, 1, 0.9058824, 1,
-0.01087402, -1.64587, -4.081529, 0, 1, 0.9098039, 1,
-0.004391982, -1.370288, -5.429261, 0, 1, 0.9176471, 1,
-0.003981487, 0.07309913, 1.061081, 0, 1, 0.9215686, 1,
-0.002612686, 0.4284959, -0.976997, 0, 1, 0.9294118, 1,
0.002819455, 0.1749649, -0.6546849, 0, 1, 0.9333333, 1,
0.003366805, -0.7779819, 2.891269, 0, 1, 0.9411765, 1,
0.003642533, -0.9289458, 2.683198, 0, 1, 0.945098, 1,
0.007410929, 1.007141, -0.9509639, 0, 1, 0.9529412, 1,
0.009269829, -1.632602, 3.693291, 0, 1, 0.9568627, 1,
0.009429285, -0.5676893, 2.871283, 0, 1, 0.9647059, 1,
0.009804783, -0.7914081, 3.034418, 0, 1, 0.9686275, 1,
0.00988657, -1.913175, 1.926063, 0, 1, 0.9764706, 1,
0.01098917, 0.6875498, -1.246592, 0, 1, 0.9803922, 1,
0.01187193, 0.8085034, -1.050776, 0, 1, 0.9882353, 1,
0.0119884, -1.356326, 2.897665, 0, 1, 0.9921569, 1,
0.01833811, 1.548372, -0.9793786, 0, 1, 1, 1,
0.02067285, -0.0941798, 4.384949, 0, 0.9921569, 1, 1,
0.0289074, 1.463202, 1.552313, 0, 0.9882353, 1, 1,
0.03608797, 0.9375789, -0.8691232, 0, 0.9803922, 1, 1,
0.03765124, 1.460453, 0.006801672, 0, 0.9764706, 1, 1,
0.03983854, 0.1287002, -0.1720692, 0, 0.9686275, 1, 1,
0.04258135, 0.08095189, -0.5219297, 0, 0.9647059, 1, 1,
0.04748056, 2.080219, 0.676388, 0, 0.9568627, 1, 1,
0.04753698, 0.4529377, -0.2468033, 0, 0.9529412, 1, 1,
0.04912405, -0.5123774, 2.227406, 0, 0.945098, 1, 1,
0.05241423, -0.7795429, 2.891933, 0, 0.9411765, 1, 1,
0.05247568, 0.3123565, 1.134366, 0, 0.9333333, 1, 1,
0.05430396, -0.7893705, 2.454806, 0, 0.9294118, 1, 1,
0.05588574, -0.07399895, 2.896992, 0, 0.9215686, 1, 1,
0.05807305, 0.6729378, 0.5538704, 0, 0.9176471, 1, 1,
0.05897544, 0.7772291, -0.718599, 0, 0.9098039, 1, 1,
0.05925937, -1.426758, 1.597227, 0, 0.9058824, 1, 1,
0.05966181, -0.8885149, 2.31323, 0, 0.8980392, 1, 1,
0.06365484, 0.2347429, 0.4070273, 0, 0.8901961, 1, 1,
0.06585529, -0.3163762, 1.714095, 0, 0.8862745, 1, 1,
0.07259836, -0.249809, 1.819044, 0, 0.8784314, 1, 1,
0.08103756, -0.3729568, 5.304891, 0, 0.8745098, 1, 1,
0.0857368, -0.3041045, 1.927386, 0, 0.8666667, 1, 1,
0.08725628, 0.3326075, 0.4495654, 0, 0.8627451, 1, 1,
0.09080407, -0.5931062, 2.947365, 0, 0.854902, 1, 1,
0.0942782, -0.1676305, 3.878342, 0, 0.8509804, 1, 1,
0.09612489, -1.254365, 2.926951, 0, 0.8431373, 1, 1,
0.09828638, -0.8916363, 3.000934, 0, 0.8392157, 1, 1,
0.09837833, -1.668955, 2.853585, 0, 0.8313726, 1, 1,
0.100625, 0.3837889, 1.082865, 0, 0.827451, 1, 1,
0.1030399, -0.2801051, 4.276164, 0, 0.8196079, 1, 1,
0.105029, 0.7778642, 0.654372, 0, 0.8156863, 1, 1,
0.1060529, 0.6259908, -0.7361647, 0, 0.8078431, 1, 1,
0.1061021, 0.2817267, -0.7413434, 0, 0.8039216, 1, 1,
0.1068004, 0.3815615, 0.933134, 0, 0.7960784, 1, 1,
0.1076018, 1.508623, 0.2364418, 0, 0.7882353, 1, 1,
0.1117956, 0.2694465, 1.152945, 0, 0.7843137, 1, 1,
0.1125156, 0.009923891, 2.231329, 0, 0.7764706, 1, 1,
0.1154553, 0.05702931, 3.057477, 0, 0.772549, 1, 1,
0.1158954, 1.110793, -1.146793, 0, 0.7647059, 1, 1,
0.1175853, 1.676972, 1.041058, 0, 0.7607843, 1, 1,
0.1189277, -0.3556525, 2.08214, 0, 0.7529412, 1, 1,
0.1261642, -0.5855112, 1.675699, 0, 0.7490196, 1, 1,
0.1272203, -0.3329227, 3.823693, 0, 0.7411765, 1, 1,
0.1284063, 1.373634, 0.8602384, 0, 0.7372549, 1, 1,
0.1308523, -0.1885795, 2.713341, 0, 0.7294118, 1, 1,
0.1350424, 0.679799, 1.50695, 0, 0.7254902, 1, 1,
0.1351069, 0.6700093, 0.8582073, 0, 0.7176471, 1, 1,
0.1371108, 0.3642161, -0.5556752, 0, 0.7137255, 1, 1,
0.138082, 0.1699715, 0.0910533, 0, 0.7058824, 1, 1,
0.1422689, -0.2705344, 2.273886, 0, 0.6980392, 1, 1,
0.1476124, 0.8688536, -1.309418, 0, 0.6941177, 1, 1,
0.1476865, -0.4814627, 1.447253, 0, 0.6862745, 1, 1,
0.1477835, 0.3412489, 0.4480494, 0, 0.682353, 1, 1,
0.1509375, 0.01907208, 2.692767, 0, 0.6745098, 1, 1,
0.1573519, 0.7011316, 0.1041207, 0, 0.6705883, 1, 1,
0.1626015, -1.967463, 2.330832, 0, 0.6627451, 1, 1,
0.1627473, 0.3364638, -0.3268411, 0, 0.6588235, 1, 1,
0.1651963, -0.9857878, 2.844785, 0, 0.6509804, 1, 1,
0.1655728, 0.0145933, 1.902581, 0, 0.6470588, 1, 1,
0.1664254, 0.1245289, 2.744332, 0, 0.6392157, 1, 1,
0.1709668, 0.4371661, -0.02374865, 0, 0.6352941, 1, 1,
0.1741285, 2.661766, 0.08346537, 0, 0.627451, 1, 1,
0.1755617, 0.3871014, -1.537016, 0, 0.6235294, 1, 1,
0.1761942, -1.18758, 2.963897, 0, 0.6156863, 1, 1,
0.1767074, 1.021575, 0.1429774, 0, 0.6117647, 1, 1,
0.1863762, -0.7673513, 4.013381, 0, 0.6039216, 1, 1,
0.1895589, -1.690195, 2.114051, 0, 0.5960785, 1, 1,
0.1913035, -0.2036643, 2.413058, 0, 0.5921569, 1, 1,
0.1973137, -1.059383, 3.474756, 0, 0.5843138, 1, 1,
0.2011146, -0.5904449, 5.004682, 0, 0.5803922, 1, 1,
0.204197, -0.603914, 2.490696, 0, 0.572549, 1, 1,
0.2069794, -0.7722543, 3.27366, 0, 0.5686275, 1, 1,
0.2099758, 0.9131596, 0.8140329, 0, 0.5607843, 1, 1,
0.212582, 0.9625863, -0.3265435, 0, 0.5568628, 1, 1,
0.2131251, 0.3137168, 0.3083026, 0, 0.5490196, 1, 1,
0.2136883, -1.223471, 0.7380492, 0, 0.5450981, 1, 1,
0.2180225, 0.2257998, 1.652411, 0, 0.5372549, 1, 1,
0.2182657, 0.5977337, -1.378029, 0, 0.5333334, 1, 1,
0.2192003, -1.214571, 2.969418, 0, 0.5254902, 1, 1,
0.2205229, 0.1850006, 1.171573, 0, 0.5215687, 1, 1,
0.2220525, 1.161222, -0.3557571, 0, 0.5137255, 1, 1,
0.2229048, 0.2173415, 2.130635, 0, 0.509804, 1, 1,
0.223477, 1.030234, 0.728887, 0, 0.5019608, 1, 1,
0.2273286, -0.3854157, 2.177881, 0, 0.4941176, 1, 1,
0.2402786, 0.2853563, 1.522817, 0, 0.4901961, 1, 1,
0.2423256, -1.179253, 3.068726, 0, 0.4823529, 1, 1,
0.2440369, -0.2539963, 3.044519, 0, 0.4784314, 1, 1,
0.2471555, 0.4577136, 0.9879829, 0, 0.4705882, 1, 1,
0.2479664, -0.1095571, 2.895538, 0, 0.4666667, 1, 1,
0.2497482, -1.141607, 2.482395, 0, 0.4588235, 1, 1,
0.2542443, -0.9836211, 2.371005, 0, 0.454902, 1, 1,
0.2553687, 0.7899887, -0.813324, 0, 0.4470588, 1, 1,
0.2623636, -0.7145735, 4.902584, 0, 0.4431373, 1, 1,
0.2663273, -0.07555929, 0.9003835, 0, 0.4352941, 1, 1,
0.2699796, 0.3020929, -0.2920457, 0, 0.4313726, 1, 1,
0.2726533, -0.3653205, 0.8239086, 0, 0.4235294, 1, 1,
0.2735671, 1.123946, 1.23288, 0, 0.4196078, 1, 1,
0.2757671, 0.07273644, -0.4958145, 0, 0.4117647, 1, 1,
0.2764879, -2.05036, 2.985277, 0, 0.4078431, 1, 1,
0.2800851, 1.622406, 0.1985352, 0, 0.4, 1, 1,
0.2800882, -1.811658, 2.152821, 0, 0.3921569, 1, 1,
0.2817376, -0.01707827, 0.8072948, 0, 0.3882353, 1, 1,
0.2820565, -1.132531, 4.037024, 0, 0.3803922, 1, 1,
0.2838306, -0.5343286, 1.549741, 0, 0.3764706, 1, 1,
0.2844685, 2.506691, 0.1765373, 0, 0.3686275, 1, 1,
0.2881297, 1.06273, 1.780877, 0, 0.3647059, 1, 1,
0.2923106, -1.632783, 4.137228, 0, 0.3568628, 1, 1,
0.2936309, 0.3995372, 1.517383, 0, 0.3529412, 1, 1,
0.2987018, 0.87591, 0.638441, 0, 0.345098, 1, 1,
0.302792, -0.268165, 1.741419, 0, 0.3411765, 1, 1,
0.3048018, -0.8907719, 1.700003, 0, 0.3333333, 1, 1,
0.3049935, 0.3277966, -0.4601042, 0, 0.3294118, 1, 1,
0.3093633, -0.5098517, 2.298014, 0, 0.3215686, 1, 1,
0.3115644, -1.947392, 1.122425, 0, 0.3176471, 1, 1,
0.3118384, 0.8101777, -0.8057108, 0, 0.3098039, 1, 1,
0.313627, -1.235778, 4.007744, 0, 0.3058824, 1, 1,
0.319345, -0.2748475, 1.596835, 0, 0.2980392, 1, 1,
0.3295462, 0.7774438, 1.089498, 0, 0.2901961, 1, 1,
0.3357709, 1.480395, 1.687525, 0, 0.2862745, 1, 1,
0.3413095, -1.693654, 3.651271, 0, 0.2784314, 1, 1,
0.3448983, -0.8552124, 2.967071, 0, 0.2745098, 1, 1,
0.3460514, 1.044915, 0.5853076, 0, 0.2666667, 1, 1,
0.3469301, -0.6644948, 3.356777, 0, 0.2627451, 1, 1,
0.3483034, 1.052609, -0.1440996, 0, 0.254902, 1, 1,
0.3483045, 1.360867, -0.001069956, 0, 0.2509804, 1, 1,
0.3504251, -0.7042135, 2.941794, 0, 0.2431373, 1, 1,
0.3510261, -0.3006797, 1.912825, 0, 0.2392157, 1, 1,
0.3522775, -0.6850509, 3.10488, 0, 0.2313726, 1, 1,
0.3523328, 1.169403, -0.7000014, 0, 0.227451, 1, 1,
0.3525591, -0.4356921, 1.900867, 0, 0.2196078, 1, 1,
0.3530669, -1.095722, 4.130475, 0, 0.2156863, 1, 1,
0.3536372, 0.4927297, -1.998516, 0, 0.2078431, 1, 1,
0.3540492, 0.6124752, -0.7677315, 0, 0.2039216, 1, 1,
0.3577917, -0.01360643, 2.221404, 0, 0.1960784, 1, 1,
0.361154, -0.2571203, 1.196665, 0, 0.1882353, 1, 1,
0.365195, 0.09924777, 0.5634136, 0, 0.1843137, 1, 1,
0.3676757, 0.4802107, 2.061065, 0, 0.1764706, 1, 1,
0.3684083, -0.9335866, 0.817943, 0, 0.172549, 1, 1,
0.3690075, 0.1029386, 1.300558, 0, 0.1647059, 1, 1,
0.3737809, -2.012074, 1.775064, 0, 0.1607843, 1, 1,
0.3762944, -0.2025778, 1.180202, 0, 0.1529412, 1, 1,
0.3783123, 0.1093739, 1.815405, 0, 0.1490196, 1, 1,
0.3813158, 0.3900578, 0.8854367, 0, 0.1411765, 1, 1,
0.3831581, -0.2543088, 0.5132061, 0, 0.1372549, 1, 1,
0.3862469, -1.193877, 0.715046, 0, 0.1294118, 1, 1,
0.3883374, -0.04914703, 2.070764, 0, 0.1254902, 1, 1,
0.3895342, -1.265466, 1.545038, 0, 0.1176471, 1, 1,
0.3926459, 0.3142069, 0.4144278, 0, 0.1137255, 1, 1,
0.3962231, -0.9892443, 2.152877, 0, 0.1058824, 1, 1,
0.3980339, -0.4437701, 3.625273, 0, 0.09803922, 1, 1,
0.4050347, 0.04710063, 1.120237, 0, 0.09411765, 1, 1,
0.4054312, 0.7422355, 0.787977, 0, 0.08627451, 1, 1,
0.4142072, 0.7952419, 1.070503, 0, 0.08235294, 1, 1,
0.4175219, 2.248303, -1.283397, 0, 0.07450981, 1, 1,
0.4225243, 0.08073475, 1.462969, 0, 0.07058824, 1, 1,
0.4230222, -0.01953967, 1.217209, 0, 0.0627451, 1, 1,
0.4273383, 0.4279059, 0.1909194, 0, 0.05882353, 1, 1,
0.4348178, 0.7920068, -1.348921, 0, 0.05098039, 1, 1,
0.4422709, 0.9834884, -0.3670455, 0, 0.04705882, 1, 1,
0.4474263, -0.7179799, 4.086652, 0, 0.03921569, 1, 1,
0.45229, -0.7345349, 4.50867, 0, 0.03529412, 1, 1,
0.453627, 0.3839748, 0.9475455, 0, 0.02745098, 1, 1,
0.4538276, 0.3615945, 2.13779, 0, 0.02352941, 1, 1,
0.460036, 0.7856614, 1.456823, 0, 0.01568628, 1, 1,
0.462851, 1.166839, -0.01141, 0, 0.01176471, 1, 1,
0.4650355, 0.04404303, 1.136656, 0, 0.003921569, 1, 1,
0.4655264, 0.5506426, 1.425781, 0.003921569, 0, 1, 1,
0.4661098, -1.409328, 3.274217, 0.007843138, 0, 1, 1,
0.4668893, -0.4466492, 3.970511, 0.01568628, 0, 1, 1,
0.4710428, -1.224287, 3.105034, 0.01960784, 0, 1, 1,
0.4733764, -0.1353358, 0.2366172, 0.02745098, 0, 1, 1,
0.4792188, -1.267146, 4.225913, 0.03137255, 0, 1, 1,
0.4800905, 0.07698055, 1.403208, 0.03921569, 0, 1, 1,
0.4804188, -1.451568, 1.878875, 0.04313726, 0, 1, 1,
0.4943518, -0.737842, 2.047146, 0.05098039, 0, 1, 1,
0.4951265, -0.8013293, 2.629526, 0.05490196, 0, 1, 1,
0.5005205, -0.1472909, 2.937436, 0.0627451, 0, 1, 1,
0.5055931, 0.3637357, 0.3547955, 0.06666667, 0, 1, 1,
0.5083278, 0.9616523, 2.262758, 0.07450981, 0, 1, 1,
0.5101469, 0.935856, -0.1447895, 0.07843138, 0, 1, 1,
0.5102286, 0.4240093, 0.9597273, 0.08627451, 0, 1, 1,
0.5106021, 0.5139012, 0.9969186, 0.09019608, 0, 1, 1,
0.5122964, -0.2342131, 4.353011, 0.09803922, 0, 1, 1,
0.5157169, -0.9127031, 2.567559, 0.1058824, 0, 1, 1,
0.5195919, 0.345666, -0.07338174, 0.1098039, 0, 1, 1,
0.5255308, -0.8694676, 0.8814255, 0.1176471, 0, 1, 1,
0.5262277, -0.4233794, 3.523531, 0.1215686, 0, 1, 1,
0.5321078, 0.3270512, -0.2272767, 0.1294118, 0, 1, 1,
0.5330909, -0.1267974, 0.5157964, 0.1333333, 0, 1, 1,
0.533351, -0.4205327, 2.477885, 0.1411765, 0, 1, 1,
0.5371965, 0.1042752, 2.219829, 0.145098, 0, 1, 1,
0.5429364, 1.112924, -0.1267215, 0.1529412, 0, 1, 1,
0.5451147, -1.547841, 2.684644, 0.1568628, 0, 1, 1,
0.547382, -0.9033229, 2.810687, 0.1647059, 0, 1, 1,
0.5506791, 0.5012599, 0.1690499, 0.1686275, 0, 1, 1,
0.5510767, 1.432758, -0.3737456, 0.1764706, 0, 1, 1,
0.5534526, -1.165462, 1.423154, 0.1803922, 0, 1, 1,
0.5544121, 0.175189, -0.004500648, 0.1882353, 0, 1, 1,
0.5548651, 1.216405, 1.041356, 0.1921569, 0, 1, 1,
0.5551186, 1.002709, 0.2241678, 0.2, 0, 1, 1,
0.5586747, -1.356768, 2.158572, 0.2078431, 0, 1, 1,
0.5615615, 0.6004661, 1.157718, 0.2117647, 0, 1, 1,
0.5690325, 1.313869, -0.2490502, 0.2196078, 0, 1, 1,
0.5731627, -1.264545, 1.624096, 0.2235294, 0, 1, 1,
0.5797274, 0.8722976, 0.1435581, 0.2313726, 0, 1, 1,
0.5877381, 0.0940618, 2.226969, 0.2352941, 0, 1, 1,
0.5892943, 0.213236, 1.459643, 0.2431373, 0, 1, 1,
0.5953216, 1.432599, -0.2457771, 0.2470588, 0, 1, 1,
0.5967925, -1.521047, 0.3540397, 0.254902, 0, 1, 1,
0.6023812, 0.4196293, 2.158274, 0.2588235, 0, 1, 1,
0.6044882, 0.3110852, -0.3971038, 0.2666667, 0, 1, 1,
0.605792, 1.580683, -0.03422321, 0.2705882, 0, 1, 1,
0.6093107, -0.6885524, 2.900224, 0.2784314, 0, 1, 1,
0.6121909, 0.9366567, 1.178791, 0.282353, 0, 1, 1,
0.6146531, -0.2247656, 1.618322, 0.2901961, 0, 1, 1,
0.6152439, -0.2140942, 2.254575, 0.2941177, 0, 1, 1,
0.6154429, 1.174365, -0.7053404, 0.3019608, 0, 1, 1,
0.6245763, -0.7949355, 3.429603, 0.3098039, 0, 1, 1,
0.6317518, -0.3827116, 1.687807, 0.3137255, 0, 1, 1,
0.6329167, -0.9401364, 3.575332, 0.3215686, 0, 1, 1,
0.6329554, 0.06145658, 0.9949992, 0.3254902, 0, 1, 1,
0.637791, -1.073269, 2.902987, 0.3333333, 0, 1, 1,
0.6481779, -1.333392, 1.308961, 0.3372549, 0, 1, 1,
0.6515319, 0.5165997, 0.891623, 0.345098, 0, 1, 1,
0.6581491, 0.5399683, 1.037457, 0.3490196, 0, 1, 1,
0.6619635, 0.07879394, 1.248357, 0.3568628, 0, 1, 1,
0.6625751, -1.228115, 3.14664, 0.3607843, 0, 1, 1,
0.6632192, -2.077376, 2.453146, 0.3686275, 0, 1, 1,
0.6664767, 1.935338, 0.5149531, 0.372549, 0, 1, 1,
0.6702188, -0.6519611, 0.3234505, 0.3803922, 0, 1, 1,
0.6721248, -1.048164, 2.048453, 0.3843137, 0, 1, 1,
0.6739405, 1.829574, 1.64841, 0.3921569, 0, 1, 1,
0.6739798, 1.001494, 0.9373987, 0.3960784, 0, 1, 1,
0.6769549, 1.644013, 0.989367, 0.4039216, 0, 1, 1,
0.6818751, 0.2396628, 1.782007, 0.4117647, 0, 1, 1,
0.6845815, 0.3202574, 1.419744, 0.4156863, 0, 1, 1,
0.6894811, -0.09984195, 1.296326, 0.4235294, 0, 1, 1,
0.6916196, -0.6480107, 4.8674, 0.427451, 0, 1, 1,
0.6971809, 1.204584, 2.524014, 0.4352941, 0, 1, 1,
0.698686, -0.002133001, 2.395754, 0.4392157, 0, 1, 1,
0.7026919, 1.261724, 0.2537572, 0.4470588, 0, 1, 1,
0.7029007, -1.371122, 2.346465, 0.4509804, 0, 1, 1,
0.7037999, -0.8086516, 1.702678, 0.4588235, 0, 1, 1,
0.7046039, 0.5447836, 1.959788, 0.4627451, 0, 1, 1,
0.7050405, -0.3502908, -0.2021765, 0.4705882, 0, 1, 1,
0.7073682, 0.7146543, 0.4732668, 0.4745098, 0, 1, 1,
0.7110556, -0.6418262, 2.110264, 0.4823529, 0, 1, 1,
0.7124312, 1.428379, 0.3258222, 0.4862745, 0, 1, 1,
0.7133078, 0.3163048, 1.317048, 0.4941176, 0, 1, 1,
0.7147824, 0.4127901, 0.7710449, 0.5019608, 0, 1, 1,
0.7192875, 1.956708, 0.946718, 0.5058824, 0, 1, 1,
0.719529, -1.139855, 3.452519, 0.5137255, 0, 1, 1,
0.7198751, 1.366176, 0.9562598, 0.5176471, 0, 1, 1,
0.7216648, 0.8936495, 0.1467951, 0.5254902, 0, 1, 1,
0.7268397, -1.126652, 2.38936, 0.5294118, 0, 1, 1,
0.7275966, -0.1251035, 2.019864, 0.5372549, 0, 1, 1,
0.7296068, 1.583045, 0.1725473, 0.5411765, 0, 1, 1,
0.731683, -2.207234, 2.715407, 0.5490196, 0, 1, 1,
0.7334995, 0.2202182, 2.113621, 0.5529412, 0, 1, 1,
0.7344531, 0.2199041, 1.970152, 0.5607843, 0, 1, 1,
0.7361106, -0.03693976, 2.557113, 0.5647059, 0, 1, 1,
0.7367224, -0.3903021, 2.93421, 0.572549, 0, 1, 1,
0.742884, 0.6048724, 0.480664, 0.5764706, 0, 1, 1,
0.7442264, 0.02069945, 1.831025, 0.5843138, 0, 1, 1,
0.747865, 0.6020314, -0.9576331, 0.5882353, 0, 1, 1,
0.7481265, 0.5103281, 0.7977634, 0.5960785, 0, 1, 1,
0.7496721, 1.671246, -1.120206, 0.6039216, 0, 1, 1,
0.751128, 0.9878665, 0.3781965, 0.6078432, 0, 1, 1,
0.7528186, 0.2550912, -0.5150669, 0.6156863, 0, 1, 1,
0.7539406, 0.8357939, 0.1963575, 0.6196079, 0, 1, 1,
0.7580253, -0.4418631, 0.7601867, 0.627451, 0, 1, 1,
0.7592388, 1.136347, 1.794995, 0.6313726, 0, 1, 1,
0.7648765, 1.513882, 1.867122, 0.6392157, 0, 1, 1,
0.7652193, 1.341508, 1.468858, 0.6431373, 0, 1, 1,
0.7654832, -0.3935266, 1.072265, 0.6509804, 0, 1, 1,
0.7660288, 1.998586, 1.848018, 0.654902, 0, 1, 1,
0.7773678, -0.5241615, 2.983935, 0.6627451, 0, 1, 1,
0.7839581, 1.488384, 0.7000245, 0.6666667, 0, 1, 1,
0.7870068, -0.3864445, 2.337893, 0.6745098, 0, 1, 1,
0.7923423, -0.1286525, 0.2569006, 0.6784314, 0, 1, 1,
0.8059647, 1.428158, -0.1547702, 0.6862745, 0, 1, 1,
0.8125346, 0.1902673, 2.863618, 0.6901961, 0, 1, 1,
0.8160083, 1.187078, 2.194651, 0.6980392, 0, 1, 1,
0.8179129, 2.010783, -0.1962933, 0.7058824, 0, 1, 1,
0.8180407, -0.7705415, 2.650989, 0.7098039, 0, 1, 1,
0.8253282, 0.1044991, 0.9138965, 0.7176471, 0, 1, 1,
0.8271512, -0.4434572, 1.930782, 0.7215686, 0, 1, 1,
0.8280528, -1.837065, 3.415354, 0.7294118, 0, 1, 1,
0.8301625, 1.049471, 1.688632, 0.7333333, 0, 1, 1,
0.8304521, -0.6008742, 0.6068478, 0.7411765, 0, 1, 1,
0.8310117, 0.1596361, 1.610785, 0.7450981, 0, 1, 1,
0.8330076, -0.4441431, 1.673939, 0.7529412, 0, 1, 1,
0.8404933, 0.2108889, 1.283344, 0.7568628, 0, 1, 1,
0.8414663, -0.1561345, 1.29874, 0.7647059, 0, 1, 1,
0.8415843, 1.323785, 1.792431, 0.7686275, 0, 1, 1,
0.8416789, -0.5796184, 4.60644, 0.7764706, 0, 1, 1,
0.8435751, 0.3257718, 1.047192, 0.7803922, 0, 1, 1,
0.8446901, 0.2635829, 0.352467, 0.7882353, 0, 1, 1,
0.8498191, -1.020532, 3.429051, 0.7921569, 0, 1, 1,
0.8518592, 1.394023, 0.3398952, 0.8, 0, 1, 1,
0.8551489, 1.287565, 1.129979, 0.8078431, 0, 1, 1,
0.8556284, 1.075567, 1.196198, 0.8117647, 0, 1, 1,
0.8597404, 2.015836, -0.261048, 0.8196079, 0, 1, 1,
0.8620018, 0.9282933, 1.557948, 0.8235294, 0, 1, 1,
0.8633593, 1.301391, 1.683257, 0.8313726, 0, 1, 1,
0.8636218, -1.443883, 1.065325, 0.8352941, 0, 1, 1,
0.8696803, -0.7941052, 3.438003, 0.8431373, 0, 1, 1,
0.8705768, -0.128749, 1.15479, 0.8470588, 0, 1, 1,
0.8721766, -0.3507842, 1.991322, 0.854902, 0, 1, 1,
0.8732702, -2.044884, 3.000771, 0.8588235, 0, 1, 1,
0.8750333, -0.9163646, 2.55733, 0.8666667, 0, 1, 1,
0.8816877, 0.4608667, -0.2894968, 0.8705882, 0, 1, 1,
0.8870874, 0.3041053, 1.457684, 0.8784314, 0, 1, 1,
0.8874164, 0.9611533, 0.8066033, 0.8823529, 0, 1, 1,
0.8894266, -0.1463641, 2.004709, 0.8901961, 0, 1, 1,
0.8906056, 0.0417948, -0.6126935, 0.8941177, 0, 1, 1,
0.896761, -0.1996004, 1.575868, 0.9019608, 0, 1, 1,
0.8979694, -1.19398, 2.214346, 0.9098039, 0, 1, 1,
0.9018881, 1.557769, 1.309315, 0.9137255, 0, 1, 1,
0.9044747, 0.01545302, 0.09259367, 0.9215686, 0, 1, 1,
0.9058339, -0.317043, 0.27681, 0.9254902, 0, 1, 1,
0.9063682, -0.119011, 1.769583, 0.9333333, 0, 1, 1,
0.9083183, 0.793779, -0.1463201, 0.9372549, 0, 1, 1,
0.9127191, -1.339472, 1.810999, 0.945098, 0, 1, 1,
0.918091, 0.1614805, 1.407717, 0.9490196, 0, 1, 1,
0.9201004, -1.593989, 3.600915, 0.9568627, 0, 1, 1,
0.9245649, -0.4730895, 2.300877, 0.9607843, 0, 1, 1,
0.9265436, -0.8839363, 2.164907, 0.9686275, 0, 1, 1,
0.9323553, -2.288966, 2.162903, 0.972549, 0, 1, 1,
0.9445117, 1.106347, -0.3032749, 0.9803922, 0, 1, 1,
0.9467991, 0.03412158, 1.638106, 0.9843137, 0, 1, 1,
0.9473148, -0.3829214, 1.850223, 0.9921569, 0, 1, 1,
0.9474214, -0.1019137, 2.565789, 0.9960784, 0, 1, 1,
0.9474382, 0.8303021, 1.196339, 1, 0, 0.9960784, 1,
0.9517909, 0.6775119, -0.6980454, 1, 0, 0.9882353, 1,
0.9550183, 0.6337091, 2.212487, 1, 0, 0.9843137, 1,
0.9560865, 0.4658425, 1.182065, 1, 0, 0.9764706, 1,
0.9584525, -1.376171, 3.076339, 1, 0, 0.972549, 1,
0.9621359, 0.9947688, 1.950626, 1, 0, 0.9647059, 1,
0.9672039, -0.8622949, 2.068119, 1, 0, 0.9607843, 1,
0.977604, 0.5748113, 3.410353, 1, 0, 0.9529412, 1,
0.9815929, 1.435327, 2.170395, 1, 0, 0.9490196, 1,
0.9864758, -1.353808, 2.711414, 1, 0, 0.9411765, 1,
0.9889969, 1.124037, 2.524221, 1, 0, 0.9372549, 1,
0.9891393, 0.5408756, 1.274157, 1, 0, 0.9294118, 1,
0.9911627, 0.3738216, 2.038284, 1, 0, 0.9254902, 1,
0.9946844, -0.4734724, 0.6698298, 1, 0, 0.9176471, 1,
0.9966819, 0.9083199, -0.3127258, 1, 0, 0.9137255, 1,
0.9967001, -0.6778536, 2.108033, 1, 0, 0.9058824, 1,
1.006586, 0.06332947, 1.207222, 1, 0, 0.9019608, 1,
1.009529, 2.281217, -0.7441624, 1, 0, 0.8941177, 1,
1.021368, 0.07255672, 2.621841, 1, 0, 0.8862745, 1,
1.021639, 0.5324691, 2.982169, 1, 0, 0.8823529, 1,
1.026836, -0.09020706, 0.1273718, 1, 0, 0.8745098, 1,
1.027241, -1.782103, 2.151116, 1, 0, 0.8705882, 1,
1.028837, -0.2956955, 3.403972, 1, 0, 0.8627451, 1,
1.032042, -1.197483, 3.032197, 1, 0, 0.8588235, 1,
1.032352, -0.3631212, 0.1959964, 1, 0, 0.8509804, 1,
1.039084, -0.8395007, 1.7857, 1, 0, 0.8470588, 1,
1.044499, -1.326577, 2.12811, 1, 0, 0.8392157, 1,
1.046355, 0.5927839, 0.3082998, 1, 0, 0.8352941, 1,
1.048959, -0.07181497, 1.461085, 1, 0, 0.827451, 1,
1.050518, 0.6334885, 1.507472, 1, 0, 0.8235294, 1,
1.05599, -0.5804213, 1.267197, 1, 0, 0.8156863, 1,
1.062346, -0.3435903, 4.136185, 1, 0, 0.8117647, 1,
1.06669, -1.614891, 2.296833, 1, 0, 0.8039216, 1,
1.06861, 0.6820641, 2.584671, 1, 0, 0.7960784, 1,
1.071746, -0.2371451, 1.219911, 1, 0, 0.7921569, 1,
1.077919, 0.005618388, 0.02583376, 1, 0, 0.7843137, 1,
1.088541, 1.773713, 0.1138353, 1, 0, 0.7803922, 1,
1.089297, -0.3472306, -0.3218015, 1, 0, 0.772549, 1,
1.091788, -0.2634961, 3.118205, 1, 0, 0.7686275, 1,
1.092894, -1.398002, 2.769088, 1, 0, 0.7607843, 1,
1.095265, -0.4329533, 1.090286, 1, 0, 0.7568628, 1,
1.098171, 0.3829516, 1.053141, 1, 0, 0.7490196, 1,
1.098432, 1.002762, 1.534576, 1, 0, 0.7450981, 1,
1.099234, 1.265796, 0.4432538, 1, 0, 0.7372549, 1,
1.099387, 0.9140803, 0.3261881, 1, 0, 0.7333333, 1,
1.108299, -0.1658439, 2.975607, 1, 0, 0.7254902, 1,
1.111906, 0.2276974, 1.888294, 1, 0, 0.7215686, 1,
1.112179, 1.004324, -0.1365602, 1, 0, 0.7137255, 1,
1.117044, 0.1667101, -0.2205702, 1, 0, 0.7098039, 1,
1.119392, 0.2314986, 0.4305201, 1, 0, 0.7019608, 1,
1.122097, 0.7692055, 3.359537, 1, 0, 0.6941177, 1,
1.123787, -0.7298074, 2.08112, 1, 0, 0.6901961, 1,
1.136374, 0.6688386, 0.5537484, 1, 0, 0.682353, 1,
1.139374, -0.2717053, 1.360969, 1, 0, 0.6784314, 1,
1.144922, 0.7049682, -0.2469144, 1, 0, 0.6705883, 1,
1.146379, 2.37899, 0.7091998, 1, 0, 0.6666667, 1,
1.152204, 0.9163714, 0.2161795, 1, 0, 0.6588235, 1,
1.153142, -2.653552, 4.492811, 1, 0, 0.654902, 1,
1.170092, 1.54845, 0.34088, 1, 0, 0.6470588, 1,
1.172374, -0.2451366, 0.4337465, 1, 0, 0.6431373, 1,
1.175379, 0.5123457, 0.09832951, 1, 0, 0.6352941, 1,
1.181676, 0.1771501, 1.253597, 1, 0, 0.6313726, 1,
1.189044, 1.216436, 1.202221, 1, 0, 0.6235294, 1,
1.196529, 0.3623401, -1.848242, 1, 0, 0.6196079, 1,
1.197709, -1.061385, 3.10071, 1, 0, 0.6117647, 1,
1.206465, 1.215097, 1.435479, 1, 0, 0.6078432, 1,
1.207723, -0.4580516, 2.602606, 1, 0, 0.6, 1,
1.208163, 0.602159, 1.502996, 1, 0, 0.5921569, 1,
1.209581, -0.4216703, 0.3767931, 1, 0, 0.5882353, 1,
1.21522, -0.02979058, 1.58877, 1, 0, 0.5803922, 1,
1.218357, 0.7147825, 2.683739, 1, 0, 0.5764706, 1,
1.221358, 0.271842, 1.730424, 1, 0, 0.5686275, 1,
1.229994, -1.392137, 2.648534, 1, 0, 0.5647059, 1,
1.237981, 1.668184, -0.02078405, 1, 0, 0.5568628, 1,
1.240394, 0.8355572, 0.9807148, 1, 0, 0.5529412, 1,
1.246103, 1.683659, 0.7572737, 1, 0, 0.5450981, 1,
1.250978, 0.8660386, 0.6386668, 1, 0, 0.5411765, 1,
1.252055, -0.7898479, 2.236246, 1, 0, 0.5333334, 1,
1.253495, -1.026178, 1.055469, 1, 0, 0.5294118, 1,
1.253824, 1.579292, -0.1383164, 1, 0, 0.5215687, 1,
1.264913, 0.2001715, 1.019006, 1, 0, 0.5176471, 1,
1.269564, -0.002230785, 0.03335396, 1, 0, 0.509804, 1,
1.270929, 0.4142534, 0.5531396, 1, 0, 0.5058824, 1,
1.273509, 0.6369655, -0.0597806, 1, 0, 0.4980392, 1,
1.273729, -1.724753, 1.678953, 1, 0, 0.4901961, 1,
1.278563, -0.1814832, 2.552239, 1, 0, 0.4862745, 1,
1.283973, -0.9649886, 3.340781, 1, 0, 0.4784314, 1,
1.284335, 0.7754028, 1.323362, 1, 0, 0.4745098, 1,
1.289535, 0.1231758, 1.600268, 1, 0, 0.4666667, 1,
1.300077, 1.560382, -0.8475012, 1, 0, 0.4627451, 1,
1.301267, 1.014609, 2.116409, 1, 0, 0.454902, 1,
1.302821, 0.7702926, 0.3731532, 1, 0, 0.4509804, 1,
1.316482, 0.4495932, 1.430912, 1, 0, 0.4431373, 1,
1.324459, -0.3380249, 0.1246051, 1, 0, 0.4392157, 1,
1.339078, -0.2528689, 0.517934, 1, 0, 0.4313726, 1,
1.341523, -0.7753461, 1.127252, 1, 0, 0.427451, 1,
1.349451, -0.8158344, 2.426527, 1, 0, 0.4196078, 1,
1.356063, 0.826148, 0.6935401, 1, 0, 0.4156863, 1,
1.358195, 0.4061641, 1.644595, 1, 0, 0.4078431, 1,
1.359639, -0.8878543, 1.51162, 1, 0, 0.4039216, 1,
1.364628, 1.450872, 1.621259, 1, 0, 0.3960784, 1,
1.37024, -1.678275, 2.525934, 1, 0, 0.3882353, 1,
1.376906, 1.094307, 1.016146, 1, 0, 0.3843137, 1,
1.392416, -1.183982, 3.644601, 1, 0, 0.3764706, 1,
1.392472, -0.6391719, 2.643309, 1, 0, 0.372549, 1,
1.394722, -0.6426376, 1.879601, 1, 0, 0.3647059, 1,
1.39651, 0.3987399, 1.637083, 1, 0, 0.3607843, 1,
1.397358, -0.004716061, 2.644237, 1, 0, 0.3529412, 1,
1.397769, -1.108914, 3.942161, 1, 0, 0.3490196, 1,
1.416268, -0.2208112, 3.422697, 1, 0, 0.3411765, 1,
1.417903, 0.2126827, 1.95916, 1, 0, 0.3372549, 1,
1.427203, 0.8469961, 1.481352, 1, 0, 0.3294118, 1,
1.436216, -1.330861, 2.822293, 1, 0, 0.3254902, 1,
1.454607, 0.09367692, 3.194768, 1, 0, 0.3176471, 1,
1.473316, 0.08297552, 1.236337, 1, 0, 0.3137255, 1,
1.478963, -0.2016389, 0.9781004, 1, 0, 0.3058824, 1,
1.495361, -1.232152, 3.678078, 1, 0, 0.2980392, 1,
1.50875, 0.05342638, 1.901396, 1, 0, 0.2941177, 1,
1.515633, 0.3811083, 2.037977, 1, 0, 0.2862745, 1,
1.530576, -0.6903899, 0.6520327, 1, 0, 0.282353, 1,
1.53462, 0.959991, 4.197213, 1, 0, 0.2745098, 1,
1.536833, 0.2130641, 2.208712, 1, 0, 0.2705882, 1,
1.540683, 1.090796, -0.2564003, 1, 0, 0.2627451, 1,
1.54498, -2.418922, 1.884218, 1, 0, 0.2588235, 1,
1.549797, -0.07620658, 0.9691519, 1, 0, 0.2509804, 1,
1.561966, 1.300408, 0.06249961, 1, 0, 0.2470588, 1,
1.564717, 0.07069424, 1.264482, 1, 0, 0.2392157, 1,
1.574704, 1.826007, 0.1682559, 1, 0, 0.2352941, 1,
1.581697, -0.5970891, 1.063366, 1, 0, 0.227451, 1,
1.583093, 0.140848, 0.5763463, 1, 0, 0.2235294, 1,
1.616629, 1.620643, 2.035132, 1, 0, 0.2156863, 1,
1.655829, 0.6342738, 0.4242757, 1, 0, 0.2117647, 1,
1.659774, -0.1254776, 1.547205, 1, 0, 0.2039216, 1,
1.665282, 0.1132883, 1.107996, 1, 0, 0.1960784, 1,
1.67931, -2.235758, 3.860239, 1, 0, 0.1921569, 1,
1.707556, -0.791128, 3.622537, 1, 0, 0.1843137, 1,
1.72428, 1.78935, 1.788764, 1, 0, 0.1803922, 1,
1.738817, -0.166882, 2.815796, 1, 0, 0.172549, 1,
1.786994, -0.5327947, 1.973826, 1, 0, 0.1686275, 1,
1.815887, 1.138898, 2.616596, 1, 0, 0.1607843, 1,
1.81711, 0.1204213, 1.091103, 1, 0, 0.1568628, 1,
1.82405, -1.08539, 3.390766, 1, 0, 0.1490196, 1,
1.849905, -0.871097, 2.787846, 1, 0, 0.145098, 1,
1.857651, -0.2723147, 2.781277, 1, 0, 0.1372549, 1,
1.89918, 0.5945799, 3.629233, 1, 0, 0.1333333, 1,
1.91976, 0.3687152, 0.5725086, 1, 0, 0.1254902, 1,
1.926289, -0.8590631, 2.58046, 1, 0, 0.1215686, 1,
1.941083, -0.2255705, 0.4009767, 1, 0, 0.1137255, 1,
1.991729, -0.7723933, 4.164532, 1, 0, 0.1098039, 1,
2.006656, -0.2956439, 2.415025, 1, 0, 0.1019608, 1,
2.020985, 1.376257, 1.798632, 1, 0, 0.09411765, 1,
2.063899, 1.238213, 1.051139, 1, 0, 0.09019608, 1,
2.088085, -0.2663781, 0.8134331, 1, 0, 0.08235294, 1,
2.172242, 1.379676, 1.518214, 1, 0, 0.07843138, 1,
2.236785, -0.654627, 3.20045, 1, 0, 0.07058824, 1,
2.244304, 0.2826033, 0.9998938, 1, 0, 0.06666667, 1,
2.245539, -1.428884, 2.987801, 1, 0, 0.05882353, 1,
2.307603, -0.7262698, 3.54535, 1, 0, 0.05490196, 1,
2.451719, 0.3569177, 2.043643, 1, 0, 0.04705882, 1,
2.484249, 0.6441593, 0.6034994, 1, 0, 0.04313726, 1,
2.484769, -1.093173, 2.340556, 1, 0, 0.03529412, 1,
2.51795, -0.6947278, 2.167638, 1, 0, 0.03137255, 1,
2.565144, 0.986352, 1.286868, 1, 0, 0.02352941, 1,
2.602777, -2.101985, 2.774811, 1, 0, 0.01960784, 1,
2.880372, 1.669617, 0.8084907, 1, 0, 0.01176471, 1,
3.567168, 1.977077, 0.006412944, 1, 0, 0.007843138, 1
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
0.1494001, -3.70739, -7.851089, 0, -0.5, 0.5, 0.5,
0.1494001, -3.70739, -7.851089, 1, -0.5, 0.5, 0.5,
0.1494001, -3.70739, -7.851089, 1, 1.5, 0.5, 0.5,
0.1494001, -3.70739, -7.851089, 0, 1.5, 0.5, 0.5
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
-4.426991, 0.101369, -7.851089, 0, -0.5, 0.5, 0.5,
-4.426991, 0.101369, -7.851089, 1, -0.5, 0.5, 0.5,
-4.426991, 0.101369, -7.851089, 1, 1.5, 0.5, 0.5,
-4.426991, 0.101369, -7.851089, 0, 1.5, 0.5, 0.5
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
-4.426991, -3.70739, -0.3197262, 0, -0.5, 0.5, 0.5,
-4.426991, -3.70739, -0.3197262, 1, -0.5, 0.5, 0.5,
-4.426991, -3.70739, -0.3197262, 1, 1.5, 0.5, 0.5,
-4.426991, -3.70739, -0.3197262, 0, 1.5, 0.5, 0.5
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
-3, -2.828445, -6.113082,
3, -2.828445, -6.113082,
-3, -2.828445, -6.113082,
-3, -2.974936, -6.40275,
-2, -2.828445, -6.113082,
-2, -2.974936, -6.40275,
-1, -2.828445, -6.113082,
-1, -2.974936, -6.40275,
0, -2.828445, -6.113082,
0, -2.974936, -6.40275,
1, -2.828445, -6.113082,
1, -2.974936, -6.40275,
2, -2.828445, -6.113082,
2, -2.974936, -6.40275,
3, -2.828445, -6.113082,
3, -2.974936, -6.40275
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
-3, -3.267918, -6.982085, 0, -0.5, 0.5, 0.5,
-3, -3.267918, -6.982085, 1, -0.5, 0.5, 0.5,
-3, -3.267918, -6.982085, 1, 1.5, 0.5, 0.5,
-3, -3.267918, -6.982085, 0, 1.5, 0.5, 0.5,
-2, -3.267918, -6.982085, 0, -0.5, 0.5, 0.5,
-2, -3.267918, -6.982085, 1, -0.5, 0.5, 0.5,
-2, -3.267918, -6.982085, 1, 1.5, 0.5, 0.5,
-2, -3.267918, -6.982085, 0, 1.5, 0.5, 0.5,
-1, -3.267918, -6.982085, 0, -0.5, 0.5, 0.5,
-1, -3.267918, -6.982085, 1, -0.5, 0.5, 0.5,
-1, -3.267918, -6.982085, 1, 1.5, 0.5, 0.5,
-1, -3.267918, -6.982085, 0, 1.5, 0.5, 0.5,
0, -3.267918, -6.982085, 0, -0.5, 0.5, 0.5,
0, -3.267918, -6.982085, 1, -0.5, 0.5, 0.5,
0, -3.267918, -6.982085, 1, 1.5, 0.5, 0.5,
0, -3.267918, -6.982085, 0, 1.5, 0.5, 0.5,
1, -3.267918, -6.982085, 0, -0.5, 0.5, 0.5,
1, -3.267918, -6.982085, 1, -0.5, 0.5, 0.5,
1, -3.267918, -6.982085, 1, 1.5, 0.5, 0.5,
1, -3.267918, -6.982085, 0, 1.5, 0.5, 0.5,
2, -3.267918, -6.982085, 0, -0.5, 0.5, 0.5,
2, -3.267918, -6.982085, 1, -0.5, 0.5, 0.5,
2, -3.267918, -6.982085, 1, 1.5, 0.5, 0.5,
2, -3.267918, -6.982085, 0, 1.5, 0.5, 0.5,
3, -3.267918, -6.982085, 0, -0.5, 0.5, 0.5,
3, -3.267918, -6.982085, 1, -0.5, 0.5, 0.5,
3, -3.267918, -6.982085, 1, 1.5, 0.5, 0.5,
3, -3.267918, -6.982085, 0, 1.5, 0.5, 0.5
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
-3.370901, -2, -6.113082,
-3.370901, 2, -6.113082,
-3.370901, -2, -6.113082,
-3.546916, -2, -6.40275,
-3.370901, -1, -6.113082,
-3.546916, -1, -6.40275,
-3.370901, 0, -6.113082,
-3.546916, 0, -6.40275,
-3.370901, 1, -6.113082,
-3.546916, 1, -6.40275,
-3.370901, 2, -6.113082,
-3.546916, 2, -6.40275
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
-3.898946, -2, -6.982085, 0, -0.5, 0.5, 0.5,
-3.898946, -2, -6.982085, 1, -0.5, 0.5, 0.5,
-3.898946, -2, -6.982085, 1, 1.5, 0.5, 0.5,
-3.898946, -2, -6.982085, 0, 1.5, 0.5, 0.5,
-3.898946, -1, -6.982085, 0, -0.5, 0.5, 0.5,
-3.898946, -1, -6.982085, 1, -0.5, 0.5, 0.5,
-3.898946, -1, -6.982085, 1, 1.5, 0.5, 0.5,
-3.898946, -1, -6.982085, 0, 1.5, 0.5, 0.5,
-3.898946, 0, -6.982085, 0, -0.5, 0.5, 0.5,
-3.898946, 0, -6.982085, 1, -0.5, 0.5, 0.5,
-3.898946, 0, -6.982085, 1, 1.5, 0.5, 0.5,
-3.898946, 0, -6.982085, 0, 1.5, 0.5, 0.5,
-3.898946, 1, -6.982085, 0, -0.5, 0.5, 0.5,
-3.898946, 1, -6.982085, 1, -0.5, 0.5, 0.5,
-3.898946, 1, -6.982085, 1, 1.5, 0.5, 0.5,
-3.898946, 1, -6.982085, 0, 1.5, 0.5, 0.5,
-3.898946, 2, -6.982085, 0, -0.5, 0.5, 0.5,
-3.898946, 2, -6.982085, 1, -0.5, 0.5, 0.5,
-3.898946, 2, -6.982085, 1, 1.5, 0.5, 0.5,
-3.898946, 2, -6.982085, 0, 1.5, 0.5, 0.5
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
-3.370901, -2.828445, -4,
-3.370901, -2.828445, 4,
-3.370901, -2.828445, -4,
-3.546916, -2.974936, -4,
-3.370901, -2.828445, -2,
-3.546916, -2.974936, -2,
-3.370901, -2.828445, 0,
-3.546916, -2.974936, 0,
-3.370901, -2.828445, 2,
-3.546916, -2.974936, 2,
-3.370901, -2.828445, 4,
-3.546916, -2.974936, 4
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
-3.898946, -3.267918, -4, 0, -0.5, 0.5, 0.5,
-3.898946, -3.267918, -4, 1, -0.5, 0.5, 0.5,
-3.898946, -3.267918, -4, 1, 1.5, 0.5, 0.5,
-3.898946, -3.267918, -4, 0, 1.5, 0.5, 0.5,
-3.898946, -3.267918, -2, 0, -0.5, 0.5, 0.5,
-3.898946, -3.267918, -2, 1, -0.5, 0.5, 0.5,
-3.898946, -3.267918, -2, 1, 1.5, 0.5, 0.5,
-3.898946, -3.267918, -2, 0, 1.5, 0.5, 0.5,
-3.898946, -3.267918, 0, 0, -0.5, 0.5, 0.5,
-3.898946, -3.267918, 0, 1, -0.5, 0.5, 0.5,
-3.898946, -3.267918, 0, 1, 1.5, 0.5, 0.5,
-3.898946, -3.267918, 0, 0, 1.5, 0.5, 0.5,
-3.898946, -3.267918, 2, 0, -0.5, 0.5, 0.5,
-3.898946, -3.267918, 2, 1, -0.5, 0.5, 0.5,
-3.898946, -3.267918, 2, 1, 1.5, 0.5, 0.5,
-3.898946, -3.267918, 2, 0, 1.5, 0.5, 0.5,
-3.898946, -3.267918, 4, 0, -0.5, 0.5, 0.5,
-3.898946, -3.267918, 4, 1, -0.5, 0.5, 0.5,
-3.898946, -3.267918, 4, 1, 1.5, 0.5, 0.5,
-3.898946, -3.267918, 4, 0, 1.5, 0.5, 0.5
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
-3.370901, -2.828445, -6.113082,
-3.370901, 3.031183, -6.113082,
-3.370901, -2.828445, 5.473629,
-3.370901, 3.031183, 5.473629,
-3.370901, -2.828445, -6.113082,
-3.370901, -2.828445, 5.473629,
-3.370901, 3.031183, -6.113082,
-3.370901, 3.031183, 5.473629,
-3.370901, -2.828445, -6.113082,
3.669701, -2.828445, -6.113082,
-3.370901, -2.828445, 5.473629,
3.669701, -2.828445, 5.473629,
-3.370901, 3.031183, -6.113082,
3.669701, 3.031183, -6.113082,
-3.370901, 3.031183, 5.473629,
3.669701, 3.031183, 5.473629,
3.669701, -2.828445, -6.113082,
3.669701, 3.031183, -6.113082,
3.669701, -2.828445, 5.473629,
3.669701, 3.031183, 5.473629,
3.669701, -2.828445, -6.113082,
3.669701, -2.828445, 5.473629,
3.669701, 3.031183, -6.113082,
3.669701, 3.031183, 5.473629
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
var radius = 7.886971;
var distance = 35.09003;
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
mvMatrix.translate( -0.1494001, -0.101369, 0.3197262 );
mvMatrix.scale( 1.211196, 1.455305, 0.7359765 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.09003);
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
diethylthiocarbamate<-read.table("diethylthiocarbamate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-diethylthiocarbamate$V2
```

```
## Error in eval(expr, envir, enclos): object 'diethylthiocarbamate' not found
```

```r
y<-diethylthiocarbamate$V3
```

```
## Error in eval(expr, envir, enclos): object 'diethylthiocarbamate' not found
```

```r
z<-diethylthiocarbamate$V4
```

```
## Error in eval(expr, envir, enclos): object 'diethylthiocarbamate' not found
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
-3.268368, -0.4596156, -0.8749455, 0, 0, 1, 1, 1,
-3.138766, -1.279773, -1.569921, 1, 0, 0, 1, 1,
-2.552822, 0.1435378, -2.152741, 1, 0, 0, 1, 1,
-2.552515, -0.8672786, -1.744968, 1, 0, 0, 1, 1,
-2.434672, 0.490009, -1.539413, 1, 0, 0, 1, 1,
-2.415116, -0.7109793, -1.552049, 1, 0, 0, 1, 1,
-2.409493, 0.0964625, -0.5188062, 0, 0, 0, 1, 1,
-2.401932, 0.2194125, -1.263853, 0, 0, 0, 1, 1,
-2.375257, -0.643102, -2.151248, 0, 0, 0, 1, 1,
-2.357159, 0.8061786, -3.10308, 0, 0, 0, 1, 1,
-2.352484, -0.1770831, -1.500634, 0, 0, 0, 1, 1,
-2.318347, 0.7122044, -0.3550584, 0, 0, 0, 1, 1,
-2.257042, -0.7835379, -2.574339, 0, 0, 0, 1, 1,
-2.232187, 0.7700047, -2.654456, 1, 1, 1, 1, 1,
-2.228928, 0.6779404, -0.8691471, 1, 1, 1, 1, 1,
-2.203608, 0.4524096, -1.021287, 1, 1, 1, 1, 1,
-2.131796, 0.174522, -1.011359, 1, 1, 1, 1, 1,
-2.130671, 0.2505774, -1.923822, 1, 1, 1, 1, 1,
-2.102042, -0.5750714, -2.107331, 1, 1, 1, 1, 1,
-2.068701, -0.4149873, -2.343109, 1, 1, 1, 1, 1,
-2.057703, 1.442521, 0.1309254, 1, 1, 1, 1, 1,
-2.013871, 0.2870641, -1.573533, 1, 1, 1, 1, 1,
-2.011039, 0.9015406, -1.79443, 1, 1, 1, 1, 1,
-1.981654, 0.3346729, -1.555848, 1, 1, 1, 1, 1,
-1.963537, 1.454957, -2.278547, 1, 1, 1, 1, 1,
-1.932021, 1.42315, -1.191053, 1, 1, 1, 1, 1,
-1.915945, 2.18046, 1.343957, 1, 1, 1, 1, 1,
-1.906269, 0.188983, -0.8466402, 1, 1, 1, 1, 1,
-1.891598, -1.193416, -3.129621, 0, 0, 1, 1, 1,
-1.826124, -1.291991, -2.076047, 1, 0, 0, 1, 1,
-1.803831, -0.3984137, -2.21315, 1, 0, 0, 1, 1,
-1.790891, 0.5791933, -1.130089, 1, 0, 0, 1, 1,
-1.789742, -0.7753581, -2.566507, 1, 0, 0, 1, 1,
-1.772939, -0.6132781, -1.743479, 1, 0, 0, 1, 1,
-1.756062, -0.1699813, -1.910028, 0, 0, 0, 1, 1,
-1.755223, -0.3546542, -3.500345, 0, 0, 0, 1, 1,
-1.739678, -0.05560023, -0.7828272, 0, 0, 0, 1, 1,
-1.732933, -0.4457861, -2.910301, 0, 0, 0, 1, 1,
-1.730704, -0.2415984, -2.172462, 0, 0, 0, 1, 1,
-1.728728, 0.4594361, -1.721582, 0, 0, 0, 1, 1,
-1.727029, -0.7132592, -4.259398, 0, 0, 0, 1, 1,
-1.720208, -0.3119085, -2.602673, 1, 1, 1, 1, 1,
-1.705075, -0.9562771, 0.3636741, 1, 1, 1, 1, 1,
-1.697327, 0.7227228, -0.6202835, 1, 1, 1, 1, 1,
-1.690722, -0.7157067, -1.061273, 1, 1, 1, 1, 1,
-1.687299, -0.4588403, -1.352539, 1, 1, 1, 1, 1,
-1.683727, -0.8357611, -1.268142, 1, 1, 1, 1, 1,
-1.682181, 0.621106, -1.360906, 1, 1, 1, 1, 1,
-1.677801, -0.3182044, -2.426991, 1, 1, 1, 1, 1,
-1.675888, 1.936672, 0.09453069, 1, 1, 1, 1, 1,
-1.667908, -1.017176, -2.368218, 1, 1, 1, 1, 1,
-1.651504, -1.962081, -2.669584, 1, 1, 1, 1, 1,
-1.650372, -0.3846884, -2.547857, 1, 1, 1, 1, 1,
-1.645943, 0.4082137, -2.224524, 1, 1, 1, 1, 1,
-1.642887, 0.5899081, -0.9173462, 1, 1, 1, 1, 1,
-1.638889, 1.710912, -3.510518, 1, 1, 1, 1, 1,
-1.624172, 0.2105756, -1.63286, 0, 0, 1, 1, 1,
-1.61458, -0.7641737, -0.1305688, 1, 0, 0, 1, 1,
-1.605075, -0.416514, -0.5513288, 1, 0, 0, 1, 1,
-1.596756, 0.2802914, -2.302984, 1, 0, 0, 1, 1,
-1.594207, -0.7002969, -0.9100669, 1, 0, 0, 1, 1,
-1.572952, 0.4972558, 0.04834312, 1, 0, 0, 1, 1,
-1.563486, 0.8021044, -1.725093, 0, 0, 0, 1, 1,
-1.562203, -1.020395, -2.263959, 0, 0, 0, 1, 1,
-1.561875, 0.9873518, -2.096926, 0, 0, 0, 1, 1,
-1.560577, -2.553498, -1.835148, 0, 0, 0, 1, 1,
-1.550805, 0.2348952, -1.918144, 0, 0, 0, 1, 1,
-1.54293, 0.170651, -3.37697, 0, 0, 0, 1, 1,
-1.541169, 0.206251, -2.752754, 0, 0, 0, 1, 1,
-1.515714, 0.8478118, -1.326208, 1, 1, 1, 1, 1,
-1.510562, -1.222399, -1.847594, 1, 1, 1, 1, 1,
-1.509127, 0.3869432, -0.5214821, 1, 1, 1, 1, 1,
-1.507946, 0.9793367, -2.157183, 1, 1, 1, 1, 1,
-1.507125, 0.6874672, -1.357238, 1, 1, 1, 1, 1,
-1.493566, -0.881547, -2.908677, 1, 1, 1, 1, 1,
-1.485671, -2.340075, -3.289451, 1, 1, 1, 1, 1,
-1.477435, 1.458067, -2.245264, 1, 1, 1, 1, 1,
-1.461386, 0.05464674, -1.591082, 1, 1, 1, 1, 1,
-1.439281, 0.07248997, -0.736347, 1, 1, 1, 1, 1,
-1.435877, 0.6364587, -2.199537, 1, 1, 1, 1, 1,
-1.418257, 0.7131897, -0.4687856, 1, 1, 1, 1, 1,
-1.412336, 0.2261517, -0.03102214, 1, 1, 1, 1, 1,
-1.404048, 0.5500356, -0.6529577, 1, 1, 1, 1, 1,
-1.389224, 0.9020219, -1.841085, 1, 1, 1, 1, 1,
-1.387802, 1.333305, -0.4793192, 0, 0, 1, 1, 1,
-1.380207, -2.637881, -2.937504, 1, 0, 0, 1, 1,
-1.379684, 1.103916, -2.29353, 1, 0, 0, 1, 1,
-1.373963, -0.8191928, -1.468869, 1, 0, 0, 1, 1,
-1.365646, 1.115471, -2.593854, 1, 0, 0, 1, 1,
-1.361734, -0.0769112, 0.5303861, 1, 0, 0, 1, 1,
-1.359432, -0.1714991, -1.4657, 0, 0, 0, 1, 1,
-1.356251, -2.027964, -1.657356, 0, 0, 0, 1, 1,
-1.348196, -0.6365473, -1.177407, 0, 0, 0, 1, 1,
-1.343814, -0.9796966, -2.105052, 0, 0, 0, 1, 1,
-1.333037, 1.194735, -0.9899822, 0, 0, 0, 1, 1,
-1.329715, 0.1170324, 0.9681004, 0, 0, 0, 1, 1,
-1.329519, 0.5033462, -2.511517, 0, 0, 0, 1, 1,
-1.327622, -0.5541645, -2.718606, 1, 1, 1, 1, 1,
-1.317091, 0.9058369, -1.984376, 1, 1, 1, 1, 1,
-1.294576, 0.1245173, -1.030459, 1, 1, 1, 1, 1,
-1.293514, 1.347857, 1.006741, 1, 1, 1, 1, 1,
-1.291359, -2.466546, -4.145854, 1, 1, 1, 1, 1,
-1.281488, -0.3883472, -2.327973, 1, 1, 1, 1, 1,
-1.264283, 1.2425, -1.191841, 1, 1, 1, 1, 1,
-1.258796, -0.05804277, -3.549625, 1, 1, 1, 1, 1,
-1.251259, -0.0610279, -1.523497, 1, 1, 1, 1, 1,
-1.247615, -0.9295524, -1.763664, 1, 1, 1, 1, 1,
-1.24347, -0.2222122, -1.109067, 1, 1, 1, 1, 1,
-1.242289, -0.4588815, -2.3047, 1, 1, 1, 1, 1,
-1.236864, -1.520191, -3.664598, 1, 1, 1, 1, 1,
-1.236697, 0.1378967, -2.953787, 1, 1, 1, 1, 1,
-1.218962, -0.6076655, -1.082582, 1, 1, 1, 1, 1,
-1.191718, 0.06798225, -2.967957, 0, 0, 1, 1, 1,
-1.178843, -0.5837019, -2.300353, 1, 0, 0, 1, 1,
-1.173219, 0.4493668, -1.918708, 1, 0, 0, 1, 1,
-1.170404, -0.7258375, -0.7771966, 1, 0, 0, 1, 1,
-1.167548, -0.3976498, -0.5034574, 1, 0, 0, 1, 1,
-1.154263, -0.9752045, -1.404737, 1, 0, 0, 1, 1,
-1.147474, -0.7962202, -4.461949, 0, 0, 0, 1, 1,
-1.141183, 0.3594323, -1.621737, 0, 0, 0, 1, 1,
-1.139549, -0.0690624, -2.351039, 0, 0, 0, 1, 1,
-1.132872, 1.203707, -0.9691103, 0, 0, 0, 1, 1,
-1.130449, -0.5161986, -2.401159, 0, 0, 0, 1, 1,
-1.128533, 0.6815161, -2.351179, 0, 0, 0, 1, 1,
-1.125173, -0.6165646, -2.188606, 0, 0, 0, 1, 1,
-1.122907, 0.8721129, -2.615613, 1, 1, 1, 1, 1,
-1.118936, 0.5667517, -1.495577, 1, 1, 1, 1, 1,
-1.112412, 1.352912, -1.702299, 1, 1, 1, 1, 1,
-1.104808, -0.8473178, -0.3295604, 1, 1, 1, 1, 1,
-1.09627, 0.1911375, -0.6042551, 1, 1, 1, 1, 1,
-1.093349, -1.508419, -1.287374, 1, 1, 1, 1, 1,
-1.092453, -0.7583502, -2.13552, 1, 1, 1, 1, 1,
-1.092082, -1.145967, -3.601627, 1, 1, 1, 1, 1,
-1.088871, -0.5842183, -1.37626, 1, 1, 1, 1, 1,
-1.083434, 1.527119, -1.075492, 1, 1, 1, 1, 1,
-1.07253, -0.2014303, -2.881327, 1, 1, 1, 1, 1,
-1.072283, -0.3423866, -1.896048, 1, 1, 1, 1, 1,
-1.070846, -1.075927, -2.323878, 1, 1, 1, 1, 1,
-1.066391, -1.150985, -2.948909, 1, 1, 1, 1, 1,
-1.062832, -2.743111, -3.333055, 1, 1, 1, 1, 1,
-1.061634, -0.3449641, -1.64064, 0, 0, 1, 1, 1,
-1.04576, -0.8551067, -2.71341, 1, 0, 0, 1, 1,
-1.043738, 1.288794, -1.581234, 1, 0, 0, 1, 1,
-1.040903, 1.25795, 0.229653, 1, 0, 0, 1, 1,
-1.032001, -0.6499003, -1.057224, 1, 0, 0, 1, 1,
-1.030084, -0.1135412, -1.46361, 1, 0, 0, 1, 1,
-1.029784, 0.09085223, -0.7603624, 0, 0, 0, 1, 1,
-1.027855, -0.04017538, -1.636171, 0, 0, 0, 1, 1,
-1.012121, -0.7939336, -1.455407, 0, 0, 0, 1, 1,
-1.011814, 2.872242, -0.1932102, 0, 0, 0, 1, 1,
-1.010908, -0.5470644, -3.936679, 0, 0, 0, 1, 1,
-0.9988784, 1.180763, -0.6084893, 0, 0, 0, 1, 1,
-0.9982416, 0.2682497, -1.978445, 0, 0, 0, 1, 1,
-0.9798706, 1.884422, -2.113265, 1, 1, 1, 1, 1,
-0.9768187, 1.344371, -1.664212, 1, 1, 1, 1, 1,
-0.9711905, 0.5148706, -0.7944844, 1, 1, 1, 1, 1,
-0.9711631, 1.126506, 0.1683303, 1, 1, 1, 1, 1,
-0.9711089, 0.8280478, -1.911539, 1, 1, 1, 1, 1,
-0.9700397, -0.3202555, -1.640269, 1, 1, 1, 1, 1,
-0.9669396, -0.9785921, -4.059838, 1, 1, 1, 1, 1,
-0.9663986, 0.1611212, -2.602449, 1, 1, 1, 1, 1,
-0.9610925, 1.215769, 0.6233608, 1, 1, 1, 1, 1,
-0.9583663, 0.6505273, -1.74509, 1, 1, 1, 1, 1,
-0.9491598, -0.5438212, -2.102845, 1, 1, 1, 1, 1,
-0.948107, -0.3110248, -2.727513, 1, 1, 1, 1, 1,
-0.9365924, 1.388195, 0.194354, 1, 1, 1, 1, 1,
-0.9170046, -0.9439999, -3.04606, 1, 1, 1, 1, 1,
-0.9147484, 0.4840259, -0.03453586, 1, 1, 1, 1, 1,
-0.9132939, -0.02711442, -0.2843572, 0, 0, 1, 1, 1,
-0.9132203, -0.7365693, -2.752071, 1, 0, 0, 1, 1,
-0.9009873, 0.1179199, 0.5814303, 1, 0, 0, 1, 1,
-0.9008677, 0.2095768, -1.00169, 1, 0, 0, 1, 1,
-0.8926635, -0.3965923, -4.198206, 1, 0, 0, 1, 1,
-0.8912758, 0.3444063, 0.2522169, 1, 0, 0, 1, 1,
-0.8912274, -0.8868545, -3.425165, 0, 0, 0, 1, 1,
-0.8898789, -0.3385377, -2.596026, 0, 0, 0, 1, 1,
-0.8823555, 0.411145, -2.842551, 0, 0, 0, 1, 1,
-0.8751408, -0.4320855, -0.4768357, 0, 0, 0, 1, 1,
-0.8708935, -1.652446, -2.632512, 0, 0, 0, 1, 1,
-0.8690611, -1.572755, -3.57645, 0, 0, 0, 1, 1,
-0.8681634, -0.5823964, -0.2554458, 0, 0, 0, 1, 1,
-0.8646922, 1.471353, -2.098305, 1, 1, 1, 1, 1,
-0.8631985, 0.2461293, -1.429757, 1, 1, 1, 1, 1,
-0.8585697, -0.5085945, -0.7720464, 1, 1, 1, 1, 1,
-0.8584708, 0.3119721, 0.9418094, 1, 1, 1, 1, 1,
-0.8582562, 0.6104791, -0.9319992, 1, 1, 1, 1, 1,
-0.8532326, -0.8653309, -1.50541, 1, 1, 1, 1, 1,
-0.8500713, 0.3553531, -1.321384, 1, 1, 1, 1, 1,
-0.8349535, 1.254769, 0.3898972, 1, 1, 1, 1, 1,
-0.8339542, -1.119277, -2.471333, 1, 1, 1, 1, 1,
-0.8331202, -0.9039935, -2.295356, 1, 1, 1, 1, 1,
-0.8326446, -0.2112052, -1.98494, 1, 1, 1, 1, 1,
-0.8290953, -1.205573, -1.067494, 1, 1, 1, 1, 1,
-0.8286716, -0.301012, -2.999423, 1, 1, 1, 1, 1,
-0.8283407, 0.3867852, -0.5766434, 1, 1, 1, 1, 1,
-0.8260998, -1.681418, -2.768241, 1, 1, 1, 1, 1,
-0.8249972, -1.219746, -2.445193, 0, 0, 1, 1, 1,
-0.8175732, 1.145783, 0.2266649, 1, 0, 0, 1, 1,
-0.8119199, 0.3797356, -0.761592, 1, 0, 0, 1, 1,
-0.8097834, 0.06403822, -2.302529, 1, 0, 0, 1, 1,
-0.7951453, 1.061425, 0.5502731, 1, 0, 0, 1, 1,
-0.78769, -0.2140365, 0.02204637, 1, 0, 0, 1, 1,
-0.7864558, 0.02855713, -1.677611, 0, 0, 0, 1, 1,
-0.7849582, -0.3674215, -1.234355, 0, 0, 0, 1, 1,
-0.7834263, -0.2083258, -1.30921, 0, 0, 0, 1, 1,
-0.7819901, -1.058735, -5.369052, 0, 0, 0, 1, 1,
-0.7772424, -0.347791, -2.148106, 0, 0, 0, 1, 1,
-0.775142, 0.5331804, -1.427294, 0, 0, 0, 1, 1,
-0.7738711, 0.02520159, -1.612647, 0, 0, 0, 1, 1,
-0.766355, -0.3436399, -4.397358, 1, 1, 1, 1, 1,
-0.7631456, 0.8702259, 0.789627, 1, 1, 1, 1, 1,
-0.7619942, 0.7015076, -2.316855, 1, 1, 1, 1, 1,
-0.7592385, -0.5138894, -2.524632, 1, 1, 1, 1, 1,
-0.7565299, 1.607648, -0.0507485, 1, 1, 1, 1, 1,
-0.7565073, 0.4849286, -0.7820899, 1, 1, 1, 1, 1,
-0.7563109, -0.5448566, -1.06445, 1, 1, 1, 1, 1,
-0.7552806, -2.171178, -4.35972, 1, 1, 1, 1, 1,
-0.7530901, -0.9808648, -1.374742, 1, 1, 1, 1, 1,
-0.7525936, -0.06851723, 0.0781585, 1, 1, 1, 1, 1,
-0.7514081, -0.6484528, -0.360256, 1, 1, 1, 1, 1,
-0.7495931, -2.502568, -0.8621916, 1, 1, 1, 1, 1,
-0.7406641, -0.6224642, -2.801142, 1, 1, 1, 1, 1,
-0.7334356, -0.4333927, -1.985744, 1, 1, 1, 1, 1,
-0.7307268, 0.2469146, -0.4702733, 1, 1, 1, 1, 1,
-0.7304384, 0.625423, -0.08723433, 0, 0, 1, 1, 1,
-0.7240013, 1.03374, -0.3922226, 1, 0, 0, 1, 1,
-0.7222755, -0.5333939, -3.830121, 1, 0, 0, 1, 1,
-0.7210692, -0.3895872, -0.876735, 1, 0, 0, 1, 1,
-0.7184908, -0.07293598, -1.623541, 1, 0, 0, 1, 1,
-0.7178804, 0.4721187, -1.89913, 1, 0, 0, 1, 1,
-0.7167001, 0.1547116, -0.7439913, 0, 0, 0, 1, 1,
-0.7114204, 0.5743873, -1.530762, 0, 0, 0, 1, 1,
-0.703487, 1.666715, -2.284406, 0, 0, 0, 1, 1,
-0.699971, 0.1041796, -2.532696, 0, 0, 0, 1, 1,
-0.6961511, -0.8747061, -1.980327, 0, 0, 0, 1, 1,
-0.6915135, 0.3753548, -1.762972, 0, 0, 0, 1, 1,
-0.6901183, 0.0677846, -1.916661, 0, 0, 0, 1, 1,
-0.6867073, -1.21609, -1.738642, 1, 1, 1, 1, 1,
-0.6836459, -1.033808, -2.405654, 1, 1, 1, 1, 1,
-0.6821116, -0.9154556, -2.887856, 1, 1, 1, 1, 1,
-0.6815236, 0.7691498, 0.02909675, 1, 1, 1, 1, 1,
-0.6765172, -1.25521, -2.420189, 1, 1, 1, 1, 1,
-0.671918, 0.08276676, -3.468929, 1, 1, 1, 1, 1,
-0.6705406, 0.1993831, -0.4672701, 1, 1, 1, 1, 1,
-0.6700758, -0.1398658, -1.974065, 1, 1, 1, 1, 1,
-0.6668671, -0.03505986, -1.116115, 1, 1, 1, 1, 1,
-0.6665625, -1.633654, -2.33454, 1, 1, 1, 1, 1,
-0.6649594, 2.48475, 0.8116575, 1, 1, 1, 1, 1,
-0.6583515, 0.6922299, 0.1088521, 1, 1, 1, 1, 1,
-0.6563138, 0.4453434, -0.05660968, 1, 1, 1, 1, 1,
-0.653132, 0.6894062, 0.1514496, 1, 1, 1, 1, 1,
-0.6522541, 0.2482724, -1.941243, 1, 1, 1, 1, 1,
-0.6452922, 0.980245, 2.111739, 0, 0, 1, 1, 1,
-0.6437367, -1.100791, -3.372126, 1, 0, 0, 1, 1,
-0.6431227, 0.365655, -1.364233, 1, 0, 0, 1, 1,
-0.6412767, -0.8115965, -2.729192, 1, 0, 0, 1, 1,
-0.6375578, 0.5963082, -1.236767, 1, 0, 0, 1, 1,
-0.6322587, 0.5759847, 0.1306756, 1, 0, 0, 1, 1,
-0.6303426, 1.047415, -0.09286618, 0, 0, 0, 1, 1,
-0.6272501, -0.09584148, 0.4077532, 0, 0, 0, 1, 1,
-0.6240686, 0.5699722, -0.9093815, 0, 0, 0, 1, 1,
-0.6228051, -1.679081, -1.57153, 0, 0, 0, 1, 1,
-0.6207994, -0.7041929, -1.878414, 0, 0, 0, 1, 1,
-0.6204771, 0.1939183, -1.498063, 0, 0, 0, 1, 1,
-0.6038612, 0.9089155, 2.321538, 0, 0, 0, 1, 1,
-0.5996752, 2.127013, -1.710094, 1, 1, 1, 1, 1,
-0.5984676, -0.04613489, -0.3431644, 1, 1, 1, 1, 1,
-0.5983353, -1.07561, -3.487585, 1, 1, 1, 1, 1,
-0.5966269, 0.9833693, -0.9616941, 1, 1, 1, 1, 1,
-0.5957761, 1.041969, 0.06507991, 1, 1, 1, 1, 1,
-0.5880682, 0.04211989, -1.594513, 1, 1, 1, 1, 1,
-0.5842102, 0.6467581, -1.69573, 1, 1, 1, 1, 1,
-0.5817514, 0.2004327, -1.773844, 1, 1, 1, 1, 1,
-0.5803418, 0.95797, -1.013668, 1, 1, 1, 1, 1,
-0.5794269, 0.1026478, -1.4086, 1, 1, 1, 1, 1,
-0.5782547, 0.4963294, -0.4023497, 1, 1, 1, 1, 1,
-0.5782526, -0.971794, -2.947232, 1, 1, 1, 1, 1,
-0.5769451, -0.3028473, -1.061131, 1, 1, 1, 1, 1,
-0.572612, -0.6721818, -1.482928, 1, 1, 1, 1, 1,
-0.5719545, -0.3248753, -1.919755, 1, 1, 1, 1, 1,
-0.5709649, 0.8072556, -0.09235461, 0, 0, 1, 1, 1,
-0.5665894, 1.159828, -1.441841, 1, 0, 0, 1, 1,
-0.5637949, 0.8464509, -0.1497379, 1, 0, 0, 1, 1,
-0.5625864, 0.1689718, -0.575806, 1, 0, 0, 1, 1,
-0.5581419, 0.1280439, -2.326695, 1, 0, 0, 1, 1,
-0.556187, 0.6429055, -0.8005263, 1, 0, 0, 1, 1,
-0.5551761, 0.6374888, -1.120197, 0, 0, 0, 1, 1,
-0.5533922, 0.2001425, -1.628184, 0, 0, 0, 1, 1,
-0.5515148, -0.4823349, -0.3152652, 0, 0, 0, 1, 1,
-0.5504873, -0.7516031, -2.656937, 0, 0, 0, 1, 1,
-0.5358735, 0.01805768, 0.01377298, 0, 0, 0, 1, 1,
-0.5333024, 0.7224442, -1.547565, 0, 0, 0, 1, 1,
-0.5313247, -1.269318, -2.527046, 0, 0, 0, 1, 1,
-0.5250705, -0.5261192, -1.873076, 1, 1, 1, 1, 1,
-0.5222266, 1.428114, -1.337002, 1, 1, 1, 1, 1,
-0.5214, -0.201211, -1.819514, 1, 1, 1, 1, 1,
-0.5206408, 0.2085094, 0.001709304, 1, 1, 1, 1, 1,
-0.5204217, 0.2576411, -3.259906, 1, 1, 1, 1, 1,
-0.5203127, -0.3040641, -3.111187, 1, 1, 1, 1, 1,
-0.5172905, -0.9159896, -3.185058, 1, 1, 1, 1, 1,
-0.5172511, 0.521238, -3.062021, 1, 1, 1, 1, 1,
-0.5118957, -0.8514788, -0.4181734, 1, 1, 1, 1, 1,
-0.5054724, -0.4000196, -1.716166, 1, 1, 1, 1, 1,
-0.505073, -0.6280438, -1.464885, 1, 1, 1, 1, 1,
-0.498532, 1.042284, 0.1391144, 1, 1, 1, 1, 1,
-0.4985033, -1.001939, -3.957834, 1, 1, 1, 1, 1,
-0.4935771, -0.6644205, -2.00144, 1, 1, 1, 1, 1,
-0.492463, -0.5371763, -0.4624562, 1, 1, 1, 1, 1,
-0.4911891, 0.3418908, -0.4996259, 0, 0, 1, 1, 1,
-0.4910375, 0.781884, -1.346614, 1, 0, 0, 1, 1,
-0.4868289, -0.4011946, -2.784605, 1, 0, 0, 1, 1,
-0.4860291, 1.25804, -0.7137741, 1, 0, 0, 1, 1,
-0.4833267, -0.8432465, -0.6850382, 1, 0, 0, 1, 1,
-0.4786036, 1.045044, -0.1029068, 1, 0, 0, 1, 1,
-0.4731849, -1.620219, -2.477688, 0, 0, 0, 1, 1,
-0.4719946, -0.9937256, -2.842693, 0, 0, 0, 1, 1,
-0.4708496, -0.7754398, -1.323221, 0, 0, 0, 1, 1,
-0.469862, -0.3347062, -2.242742, 0, 0, 0, 1, 1,
-0.4695547, 0.1985062, -1.223095, 0, 0, 0, 1, 1,
-0.4691091, -0.8542703, 0.1624952, 0, 0, 0, 1, 1,
-0.4624753, -0.4260785, -3.597976, 0, 0, 0, 1, 1,
-0.4612387, 0.5526326, -2.299854, 1, 1, 1, 1, 1,
-0.4607756, 0.8420329, 0.7755648, 1, 1, 1, 1, 1,
-0.4605402, -0.9909731, -2.372536, 1, 1, 1, 1, 1,
-0.4604819, 0.1789491, -1.661262, 1, 1, 1, 1, 1,
-0.4579524, -1.479393, -2.935953, 1, 1, 1, 1, 1,
-0.4476982, 0.06168507, -3.358984, 1, 1, 1, 1, 1,
-0.4439063, -1.209897, -2.484917, 1, 1, 1, 1, 1,
-0.4415693, -0.972451, -2.539044, 1, 1, 1, 1, 1,
-0.4383188, 0.3426355, -0.4804412, 1, 1, 1, 1, 1,
-0.4371144, 1.32156, 0.871985, 1, 1, 1, 1, 1,
-0.4352279, 0.5251268, -1.379236, 1, 1, 1, 1, 1,
-0.4320079, 0.727153, 0.5336751, 1, 1, 1, 1, 1,
-0.4265952, 2.053672, -0.5906902, 1, 1, 1, 1, 1,
-0.4234651, -1.384624, -1.295175, 1, 1, 1, 1, 1,
-0.4197723, -0.1266689, -2.451767, 1, 1, 1, 1, 1,
-0.4153626, 1.221403, -0.5304285, 0, 0, 1, 1, 1,
-0.4150489, -0.5055224, -1.671559, 1, 0, 0, 1, 1,
-0.4134856, -0.883585, -2.970375, 1, 0, 0, 1, 1,
-0.4119756, 0.4684718, -1.16925, 1, 0, 0, 1, 1,
-0.4107223, -0.6116937, -4.885976, 1, 0, 0, 1, 1,
-0.4107109, -1.046955, -4.368134, 1, 0, 0, 1, 1,
-0.4103458, 0.5586303, -2.232976, 0, 0, 0, 1, 1,
-0.4082621, 0.5536653, -0.2229909, 0, 0, 0, 1, 1,
-0.4061595, 0.1730531, -1.927444, 0, 0, 0, 1, 1,
-0.3995879, -0.4570561, -2.275032, 0, 0, 0, 1, 1,
-0.3986228, -1.517377, -2.443201, 0, 0, 0, 1, 1,
-0.3985896, 0.07837061, -1.590616, 0, 0, 0, 1, 1,
-0.395622, 0.5679198, -0.9647619, 0, 0, 0, 1, 1,
-0.3902044, 0.5691449, 1.038934, 1, 1, 1, 1, 1,
-0.3894742, 0.9961208, -2.084641, 1, 1, 1, 1, 1,
-0.3894137, 1.720919, -1.161889, 1, 1, 1, 1, 1,
-0.3873743, -0.7606488, -3.079437, 1, 1, 1, 1, 1,
-0.3833381, -0.6460881, -1.975609, 1, 1, 1, 1, 1,
-0.3832192, 0.9842541, 1.342193, 1, 1, 1, 1, 1,
-0.3755244, -0.6847112, -3.55189, 1, 1, 1, 1, 1,
-0.374341, 0.4743205, -0.8691587, 1, 1, 1, 1, 1,
-0.3733238, 1.453615, 0.310912, 1, 1, 1, 1, 1,
-0.371657, 0.01400868, 0.1686818, 1, 1, 1, 1, 1,
-0.3705829, -0.8282231, -2.004116, 1, 1, 1, 1, 1,
-0.3666846, -0.7028183, -2.423105, 1, 1, 1, 1, 1,
-0.3658152, -1.798694, -2.445234, 1, 1, 1, 1, 1,
-0.3654508, -1.02876, -3.630586, 1, 1, 1, 1, 1,
-0.3636605, 1.737364, -0.1284183, 1, 1, 1, 1, 1,
-0.3625823, 1.356338, -1.190333, 0, 0, 1, 1, 1,
-0.3605537, -0.5005252, -2.786237, 1, 0, 0, 1, 1,
-0.3493212, 0.3823637, -0.3099817, 1, 0, 0, 1, 1,
-0.3445435, -0.9016289, -4.202141, 1, 0, 0, 1, 1,
-0.3414422, 1.390791, -0.2232826, 1, 0, 0, 1, 1,
-0.3356382, 1.154389, 2.027728, 1, 0, 0, 1, 1,
-0.3297533, -1.474539, -1.598653, 0, 0, 0, 1, 1,
-0.3291632, 0.4673212, -0.05173077, 0, 0, 0, 1, 1,
-0.3290136, 1.126102, -0.6320193, 0, 0, 0, 1, 1,
-0.3263602, 0.3381327, 0.5226713, 0, 0, 0, 1, 1,
-0.32358, -0.1750105, -2.582454, 0, 0, 0, 1, 1,
-0.3220723, -0.2926201, -2.350179, 0, 0, 0, 1, 1,
-0.3162092, 0.4269372, 0.2964987, 0, 0, 0, 1, 1,
-0.3130411, 0.1454876, -0.1677883, 1, 1, 1, 1, 1,
-0.3117768, 0.9289942, -0.7500442, 1, 1, 1, 1, 1,
-0.310464, 2.446671, -1.001918, 1, 1, 1, 1, 1,
-0.3077326, -0.7637441, -0.999069, 1, 1, 1, 1, 1,
-0.3041545, -0.1790619, -3.393647, 1, 1, 1, 1, 1,
-0.3006949, -2.051754, -2.174863, 1, 1, 1, 1, 1,
-0.3000045, -1.645831, -3.612871, 1, 1, 1, 1, 1,
-0.2855631, 0.6211043, -0.7842939, 1, 1, 1, 1, 1,
-0.2821435, 0.4068892, 0.07340253, 1, 1, 1, 1, 1,
-0.2808627, 1.012203, -1.479211, 1, 1, 1, 1, 1,
-0.2808005, 1.406766, 0.2090575, 1, 1, 1, 1, 1,
-0.2797664, -1.002699, -3.234228, 1, 1, 1, 1, 1,
-0.2770424, 0.3072607, 0.4545969, 1, 1, 1, 1, 1,
-0.2694567, 0.743048, 0.4220841, 1, 1, 1, 1, 1,
-0.2674998, -0.258113, -2.120467, 1, 1, 1, 1, 1,
-0.2674825, -1.095902, -2.832273, 0, 0, 1, 1, 1,
-0.26226, 0.1854367, -1.757247, 1, 0, 0, 1, 1,
-0.2584024, 1.513078, 0.02910054, 1, 0, 0, 1, 1,
-0.2583783, -0.9547578, -4.683828, 1, 0, 0, 1, 1,
-0.256982, 0.3084616, -0.90453, 1, 0, 0, 1, 1,
-0.2555141, -0.3247512, -0.4752924, 1, 0, 0, 1, 1,
-0.2527201, 1.674239, 0.8892184, 0, 0, 0, 1, 1,
-0.2522314, 0.9199655, 0.003499769, 0, 0, 0, 1, 1,
-0.2512192, -0.5238336, -1.634335, 0, 0, 0, 1, 1,
-0.247544, 0.992739, 0.8865112, 0, 0, 0, 1, 1,
-0.2471117, 1.845845, 1.00728, 0, 0, 0, 1, 1,
-0.2398537, -1.188946, -3.463129, 0, 0, 0, 1, 1,
-0.2397427, 1.369557, 1.046895, 0, 0, 0, 1, 1,
-0.2345688, -0.4102375, -0.9585013, 1, 1, 1, 1, 1,
-0.2345207, 0.7949602, -0.528056, 1, 1, 1, 1, 1,
-0.2303471, -0.3721815, -3.258486, 1, 1, 1, 1, 1,
-0.2302895, 1.99941, 0.4763019, 1, 1, 1, 1, 1,
-0.2280172, -0.3105185, -1.830675, 1, 1, 1, 1, 1,
-0.2204978, 0.09524667, -1.367366, 1, 1, 1, 1, 1,
-0.2168182, 0.3245893, -1.112579, 1, 1, 1, 1, 1,
-0.2167233, -0.3817216, -1.540927, 1, 1, 1, 1, 1,
-0.2164682, -1.125817, -1.38055, 1, 1, 1, 1, 1,
-0.2153573, -0.28615, -2.27869, 1, 1, 1, 1, 1,
-0.2138929, -0.3429115, -2.745708, 1, 1, 1, 1, 1,
-0.2110066, -0.0335238, -3.712402, 1, 1, 1, 1, 1,
-0.2098953, -0.3881448, -2.00144, 1, 1, 1, 1, 1,
-0.2096605, -0.4157381, -2.986629, 1, 1, 1, 1, 1,
-0.2028111, -0.6306266, -3.511378, 1, 1, 1, 1, 1,
-0.2016662, -1.848223, -4.388386, 0, 0, 1, 1, 1,
-0.1978965, 0.1318306, -2.678008, 1, 0, 0, 1, 1,
-0.18956, 0.1136397, -2.963213, 1, 0, 0, 1, 1,
-0.1895307, 1.253252, 1.295886, 1, 0, 0, 1, 1,
-0.1894934, -0.4695321, -2.915434, 1, 0, 0, 1, 1,
-0.1892019, -0.2146724, -1.873618, 1, 0, 0, 1, 1,
-0.1887417, 2.066257, -0.6693255, 0, 0, 0, 1, 1,
-0.1873015, 0.5257647, -0.4306655, 0, 0, 0, 1, 1,
-0.1867671, -0.2802731, -3.216345, 0, 0, 0, 1, 1,
-0.1858911, -0.2997283, -2.072604, 0, 0, 0, 1, 1,
-0.1850698, -1.210329, -2.894768, 0, 0, 0, 1, 1,
-0.1835295, 0.6217693, 0.1092152, 0, 0, 0, 1, 1,
-0.1796663, 1.337732, -1.379879, 0, 0, 0, 1, 1,
-0.1775002, 0.4131184, -0.4921754, 1, 1, 1, 1, 1,
-0.1747978, -1.76686, -1.403645, 1, 1, 1, 1, 1,
-0.1713838, 2.239937, -0.003576109, 1, 1, 1, 1, 1,
-0.1683359, 0.2373661, -1.439137, 1, 1, 1, 1, 1,
-0.1665648, 0.6593026, -1.225944, 1, 1, 1, 1, 1,
-0.1588127, -0.532265, -3.309102, 1, 1, 1, 1, 1,
-0.1563555, -0.3457131, -0.974825, 1, 1, 1, 1, 1,
-0.1539339, 0.2846445, 0.2494347, 1, 1, 1, 1, 1,
-0.1466689, 0.3270309, 0.104986, 1, 1, 1, 1, 1,
-0.1435298, 0.1809977, -1.613267, 1, 1, 1, 1, 1,
-0.1434512, -1.520679, -1.686721, 1, 1, 1, 1, 1,
-0.1405312, 0.887412, -0.6362297, 1, 1, 1, 1, 1,
-0.1375624, 0.3342584, -1.502286, 1, 1, 1, 1, 1,
-0.1330984, -0.4151336, -2.820553, 1, 1, 1, 1, 1,
-0.1298904, -1.525913, -2.68225, 1, 1, 1, 1, 1,
-0.1237519, 1.71762, 1.132196, 0, 0, 1, 1, 1,
-0.1179302, 0.8843149, 2.006344, 1, 0, 0, 1, 1,
-0.1144356, -0.2032949, -3.592962, 1, 0, 0, 1, 1,
-0.1088646, -1.158106, -2.488923, 1, 0, 0, 1, 1,
-0.09914716, 0.3561157, 0.1048612, 1, 0, 0, 1, 1,
-0.0985622, 1.834083, 0.05203465, 1, 0, 0, 1, 1,
-0.09735411, 1.645867, -1.428087, 0, 0, 0, 1, 1,
-0.09692903, -1.730043, -2.529732, 0, 0, 0, 1, 1,
-0.07555496, 2.945849, -1.436247, 0, 0, 0, 1, 1,
-0.07234414, 0.8547928, 0.6596955, 0, 0, 0, 1, 1,
-0.0697797, -0.3770171, -1.892675, 0, 0, 0, 1, 1,
-0.06768912, 1.5171, -1.584059, 0, 0, 0, 1, 1,
-0.06636303, 0.08434904, 0.04067864, 0, 0, 0, 1, 1,
-0.0654403, -0.7871756, -3.311769, 1, 1, 1, 1, 1,
-0.06423488, 1.74225, -0.7669852, 1, 1, 1, 1, 1,
-0.06302269, 0.6602937, -0.5370157, 1, 1, 1, 1, 1,
-0.06073739, 1.260953, 0.7617745, 1, 1, 1, 1, 1,
-0.05871095, -0.0616552, -4.695238, 1, 1, 1, 1, 1,
-0.05836594, -0.3395663, -3.519097, 1, 1, 1, 1, 1,
-0.05231884, -0.1637897, -2.545945, 1, 1, 1, 1, 1,
-0.04928693, 0.2497859, -1.535219, 1, 1, 1, 1, 1,
-0.0432931, -1.093818, -5.944344, 1, 1, 1, 1, 1,
-0.04214209, 0.5611468, -0.562139, 1, 1, 1, 1, 1,
-0.03804108, 0.9414052, 0.7164446, 1, 1, 1, 1, 1,
-0.03390679, -0.4029493, -1.353429, 1, 1, 1, 1, 1,
-0.03272882, -0.4931133, -2.948362, 1, 1, 1, 1, 1,
-0.03051264, 0.3128565, -0.03974043, 1, 1, 1, 1, 1,
-0.02708415, -0.4320253, -3.533767, 1, 1, 1, 1, 1,
-0.0238851, 0.1023161, -1.270057, 0, 0, 1, 1, 1,
-0.02189836, 0.637755, 0.1952443, 1, 0, 0, 1, 1,
-0.02114379, 0.05701434, -1.720908, 1, 0, 0, 1, 1,
-0.02020966, -0.2086875, -5.252509, 1, 0, 0, 1, 1,
-0.01939883, 1.254227, -1.339515, 1, 0, 0, 1, 1,
-0.01548036, 1.924865, -0.3285437, 1, 0, 0, 1, 1,
-0.01346395, -0.6331255, -4.057679, 0, 0, 0, 1, 1,
-0.01279235, 1.607366, 0.6030893, 0, 0, 0, 1, 1,
-0.01265028, -0.8659249, -2.514033, 0, 0, 0, 1, 1,
-0.01087402, -1.64587, -4.081529, 0, 0, 0, 1, 1,
-0.004391982, -1.370288, -5.429261, 0, 0, 0, 1, 1,
-0.003981487, 0.07309913, 1.061081, 0, 0, 0, 1, 1,
-0.002612686, 0.4284959, -0.976997, 0, 0, 0, 1, 1,
0.002819455, 0.1749649, -0.6546849, 1, 1, 1, 1, 1,
0.003366805, -0.7779819, 2.891269, 1, 1, 1, 1, 1,
0.003642533, -0.9289458, 2.683198, 1, 1, 1, 1, 1,
0.007410929, 1.007141, -0.9509639, 1, 1, 1, 1, 1,
0.009269829, -1.632602, 3.693291, 1, 1, 1, 1, 1,
0.009429285, -0.5676893, 2.871283, 1, 1, 1, 1, 1,
0.009804783, -0.7914081, 3.034418, 1, 1, 1, 1, 1,
0.00988657, -1.913175, 1.926063, 1, 1, 1, 1, 1,
0.01098917, 0.6875498, -1.246592, 1, 1, 1, 1, 1,
0.01187193, 0.8085034, -1.050776, 1, 1, 1, 1, 1,
0.0119884, -1.356326, 2.897665, 1, 1, 1, 1, 1,
0.01833811, 1.548372, -0.9793786, 1, 1, 1, 1, 1,
0.02067285, -0.0941798, 4.384949, 1, 1, 1, 1, 1,
0.0289074, 1.463202, 1.552313, 1, 1, 1, 1, 1,
0.03608797, 0.9375789, -0.8691232, 1, 1, 1, 1, 1,
0.03765124, 1.460453, 0.006801672, 0, 0, 1, 1, 1,
0.03983854, 0.1287002, -0.1720692, 1, 0, 0, 1, 1,
0.04258135, 0.08095189, -0.5219297, 1, 0, 0, 1, 1,
0.04748056, 2.080219, 0.676388, 1, 0, 0, 1, 1,
0.04753698, 0.4529377, -0.2468033, 1, 0, 0, 1, 1,
0.04912405, -0.5123774, 2.227406, 1, 0, 0, 1, 1,
0.05241423, -0.7795429, 2.891933, 0, 0, 0, 1, 1,
0.05247568, 0.3123565, 1.134366, 0, 0, 0, 1, 1,
0.05430396, -0.7893705, 2.454806, 0, 0, 0, 1, 1,
0.05588574, -0.07399895, 2.896992, 0, 0, 0, 1, 1,
0.05807305, 0.6729378, 0.5538704, 0, 0, 0, 1, 1,
0.05897544, 0.7772291, -0.718599, 0, 0, 0, 1, 1,
0.05925937, -1.426758, 1.597227, 0, 0, 0, 1, 1,
0.05966181, -0.8885149, 2.31323, 1, 1, 1, 1, 1,
0.06365484, 0.2347429, 0.4070273, 1, 1, 1, 1, 1,
0.06585529, -0.3163762, 1.714095, 1, 1, 1, 1, 1,
0.07259836, -0.249809, 1.819044, 1, 1, 1, 1, 1,
0.08103756, -0.3729568, 5.304891, 1, 1, 1, 1, 1,
0.0857368, -0.3041045, 1.927386, 1, 1, 1, 1, 1,
0.08725628, 0.3326075, 0.4495654, 1, 1, 1, 1, 1,
0.09080407, -0.5931062, 2.947365, 1, 1, 1, 1, 1,
0.0942782, -0.1676305, 3.878342, 1, 1, 1, 1, 1,
0.09612489, -1.254365, 2.926951, 1, 1, 1, 1, 1,
0.09828638, -0.8916363, 3.000934, 1, 1, 1, 1, 1,
0.09837833, -1.668955, 2.853585, 1, 1, 1, 1, 1,
0.100625, 0.3837889, 1.082865, 1, 1, 1, 1, 1,
0.1030399, -0.2801051, 4.276164, 1, 1, 1, 1, 1,
0.105029, 0.7778642, 0.654372, 1, 1, 1, 1, 1,
0.1060529, 0.6259908, -0.7361647, 0, 0, 1, 1, 1,
0.1061021, 0.2817267, -0.7413434, 1, 0, 0, 1, 1,
0.1068004, 0.3815615, 0.933134, 1, 0, 0, 1, 1,
0.1076018, 1.508623, 0.2364418, 1, 0, 0, 1, 1,
0.1117956, 0.2694465, 1.152945, 1, 0, 0, 1, 1,
0.1125156, 0.009923891, 2.231329, 1, 0, 0, 1, 1,
0.1154553, 0.05702931, 3.057477, 0, 0, 0, 1, 1,
0.1158954, 1.110793, -1.146793, 0, 0, 0, 1, 1,
0.1175853, 1.676972, 1.041058, 0, 0, 0, 1, 1,
0.1189277, -0.3556525, 2.08214, 0, 0, 0, 1, 1,
0.1261642, -0.5855112, 1.675699, 0, 0, 0, 1, 1,
0.1272203, -0.3329227, 3.823693, 0, 0, 0, 1, 1,
0.1284063, 1.373634, 0.8602384, 0, 0, 0, 1, 1,
0.1308523, -0.1885795, 2.713341, 1, 1, 1, 1, 1,
0.1350424, 0.679799, 1.50695, 1, 1, 1, 1, 1,
0.1351069, 0.6700093, 0.8582073, 1, 1, 1, 1, 1,
0.1371108, 0.3642161, -0.5556752, 1, 1, 1, 1, 1,
0.138082, 0.1699715, 0.0910533, 1, 1, 1, 1, 1,
0.1422689, -0.2705344, 2.273886, 1, 1, 1, 1, 1,
0.1476124, 0.8688536, -1.309418, 1, 1, 1, 1, 1,
0.1476865, -0.4814627, 1.447253, 1, 1, 1, 1, 1,
0.1477835, 0.3412489, 0.4480494, 1, 1, 1, 1, 1,
0.1509375, 0.01907208, 2.692767, 1, 1, 1, 1, 1,
0.1573519, 0.7011316, 0.1041207, 1, 1, 1, 1, 1,
0.1626015, -1.967463, 2.330832, 1, 1, 1, 1, 1,
0.1627473, 0.3364638, -0.3268411, 1, 1, 1, 1, 1,
0.1651963, -0.9857878, 2.844785, 1, 1, 1, 1, 1,
0.1655728, 0.0145933, 1.902581, 1, 1, 1, 1, 1,
0.1664254, 0.1245289, 2.744332, 0, 0, 1, 1, 1,
0.1709668, 0.4371661, -0.02374865, 1, 0, 0, 1, 1,
0.1741285, 2.661766, 0.08346537, 1, 0, 0, 1, 1,
0.1755617, 0.3871014, -1.537016, 1, 0, 0, 1, 1,
0.1761942, -1.18758, 2.963897, 1, 0, 0, 1, 1,
0.1767074, 1.021575, 0.1429774, 1, 0, 0, 1, 1,
0.1863762, -0.7673513, 4.013381, 0, 0, 0, 1, 1,
0.1895589, -1.690195, 2.114051, 0, 0, 0, 1, 1,
0.1913035, -0.2036643, 2.413058, 0, 0, 0, 1, 1,
0.1973137, -1.059383, 3.474756, 0, 0, 0, 1, 1,
0.2011146, -0.5904449, 5.004682, 0, 0, 0, 1, 1,
0.204197, -0.603914, 2.490696, 0, 0, 0, 1, 1,
0.2069794, -0.7722543, 3.27366, 0, 0, 0, 1, 1,
0.2099758, 0.9131596, 0.8140329, 1, 1, 1, 1, 1,
0.212582, 0.9625863, -0.3265435, 1, 1, 1, 1, 1,
0.2131251, 0.3137168, 0.3083026, 1, 1, 1, 1, 1,
0.2136883, -1.223471, 0.7380492, 1, 1, 1, 1, 1,
0.2180225, 0.2257998, 1.652411, 1, 1, 1, 1, 1,
0.2182657, 0.5977337, -1.378029, 1, 1, 1, 1, 1,
0.2192003, -1.214571, 2.969418, 1, 1, 1, 1, 1,
0.2205229, 0.1850006, 1.171573, 1, 1, 1, 1, 1,
0.2220525, 1.161222, -0.3557571, 1, 1, 1, 1, 1,
0.2229048, 0.2173415, 2.130635, 1, 1, 1, 1, 1,
0.223477, 1.030234, 0.728887, 1, 1, 1, 1, 1,
0.2273286, -0.3854157, 2.177881, 1, 1, 1, 1, 1,
0.2402786, 0.2853563, 1.522817, 1, 1, 1, 1, 1,
0.2423256, -1.179253, 3.068726, 1, 1, 1, 1, 1,
0.2440369, -0.2539963, 3.044519, 1, 1, 1, 1, 1,
0.2471555, 0.4577136, 0.9879829, 0, 0, 1, 1, 1,
0.2479664, -0.1095571, 2.895538, 1, 0, 0, 1, 1,
0.2497482, -1.141607, 2.482395, 1, 0, 0, 1, 1,
0.2542443, -0.9836211, 2.371005, 1, 0, 0, 1, 1,
0.2553687, 0.7899887, -0.813324, 1, 0, 0, 1, 1,
0.2623636, -0.7145735, 4.902584, 1, 0, 0, 1, 1,
0.2663273, -0.07555929, 0.9003835, 0, 0, 0, 1, 1,
0.2699796, 0.3020929, -0.2920457, 0, 0, 0, 1, 1,
0.2726533, -0.3653205, 0.8239086, 0, 0, 0, 1, 1,
0.2735671, 1.123946, 1.23288, 0, 0, 0, 1, 1,
0.2757671, 0.07273644, -0.4958145, 0, 0, 0, 1, 1,
0.2764879, -2.05036, 2.985277, 0, 0, 0, 1, 1,
0.2800851, 1.622406, 0.1985352, 0, 0, 0, 1, 1,
0.2800882, -1.811658, 2.152821, 1, 1, 1, 1, 1,
0.2817376, -0.01707827, 0.8072948, 1, 1, 1, 1, 1,
0.2820565, -1.132531, 4.037024, 1, 1, 1, 1, 1,
0.2838306, -0.5343286, 1.549741, 1, 1, 1, 1, 1,
0.2844685, 2.506691, 0.1765373, 1, 1, 1, 1, 1,
0.2881297, 1.06273, 1.780877, 1, 1, 1, 1, 1,
0.2923106, -1.632783, 4.137228, 1, 1, 1, 1, 1,
0.2936309, 0.3995372, 1.517383, 1, 1, 1, 1, 1,
0.2987018, 0.87591, 0.638441, 1, 1, 1, 1, 1,
0.302792, -0.268165, 1.741419, 1, 1, 1, 1, 1,
0.3048018, -0.8907719, 1.700003, 1, 1, 1, 1, 1,
0.3049935, 0.3277966, -0.4601042, 1, 1, 1, 1, 1,
0.3093633, -0.5098517, 2.298014, 1, 1, 1, 1, 1,
0.3115644, -1.947392, 1.122425, 1, 1, 1, 1, 1,
0.3118384, 0.8101777, -0.8057108, 1, 1, 1, 1, 1,
0.313627, -1.235778, 4.007744, 0, 0, 1, 1, 1,
0.319345, -0.2748475, 1.596835, 1, 0, 0, 1, 1,
0.3295462, 0.7774438, 1.089498, 1, 0, 0, 1, 1,
0.3357709, 1.480395, 1.687525, 1, 0, 0, 1, 1,
0.3413095, -1.693654, 3.651271, 1, 0, 0, 1, 1,
0.3448983, -0.8552124, 2.967071, 1, 0, 0, 1, 1,
0.3460514, 1.044915, 0.5853076, 0, 0, 0, 1, 1,
0.3469301, -0.6644948, 3.356777, 0, 0, 0, 1, 1,
0.3483034, 1.052609, -0.1440996, 0, 0, 0, 1, 1,
0.3483045, 1.360867, -0.001069956, 0, 0, 0, 1, 1,
0.3504251, -0.7042135, 2.941794, 0, 0, 0, 1, 1,
0.3510261, -0.3006797, 1.912825, 0, 0, 0, 1, 1,
0.3522775, -0.6850509, 3.10488, 0, 0, 0, 1, 1,
0.3523328, 1.169403, -0.7000014, 1, 1, 1, 1, 1,
0.3525591, -0.4356921, 1.900867, 1, 1, 1, 1, 1,
0.3530669, -1.095722, 4.130475, 1, 1, 1, 1, 1,
0.3536372, 0.4927297, -1.998516, 1, 1, 1, 1, 1,
0.3540492, 0.6124752, -0.7677315, 1, 1, 1, 1, 1,
0.3577917, -0.01360643, 2.221404, 1, 1, 1, 1, 1,
0.361154, -0.2571203, 1.196665, 1, 1, 1, 1, 1,
0.365195, 0.09924777, 0.5634136, 1, 1, 1, 1, 1,
0.3676757, 0.4802107, 2.061065, 1, 1, 1, 1, 1,
0.3684083, -0.9335866, 0.817943, 1, 1, 1, 1, 1,
0.3690075, 0.1029386, 1.300558, 1, 1, 1, 1, 1,
0.3737809, -2.012074, 1.775064, 1, 1, 1, 1, 1,
0.3762944, -0.2025778, 1.180202, 1, 1, 1, 1, 1,
0.3783123, 0.1093739, 1.815405, 1, 1, 1, 1, 1,
0.3813158, 0.3900578, 0.8854367, 1, 1, 1, 1, 1,
0.3831581, -0.2543088, 0.5132061, 0, 0, 1, 1, 1,
0.3862469, -1.193877, 0.715046, 1, 0, 0, 1, 1,
0.3883374, -0.04914703, 2.070764, 1, 0, 0, 1, 1,
0.3895342, -1.265466, 1.545038, 1, 0, 0, 1, 1,
0.3926459, 0.3142069, 0.4144278, 1, 0, 0, 1, 1,
0.3962231, -0.9892443, 2.152877, 1, 0, 0, 1, 1,
0.3980339, -0.4437701, 3.625273, 0, 0, 0, 1, 1,
0.4050347, 0.04710063, 1.120237, 0, 0, 0, 1, 1,
0.4054312, 0.7422355, 0.787977, 0, 0, 0, 1, 1,
0.4142072, 0.7952419, 1.070503, 0, 0, 0, 1, 1,
0.4175219, 2.248303, -1.283397, 0, 0, 0, 1, 1,
0.4225243, 0.08073475, 1.462969, 0, 0, 0, 1, 1,
0.4230222, -0.01953967, 1.217209, 0, 0, 0, 1, 1,
0.4273383, 0.4279059, 0.1909194, 1, 1, 1, 1, 1,
0.4348178, 0.7920068, -1.348921, 1, 1, 1, 1, 1,
0.4422709, 0.9834884, -0.3670455, 1, 1, 1, 1, 1,
0.4474263, -0.7179799, 4.086652, 1, 1, 1, 1, 1,
0.45229, -0.7345349, 4.50867, 1, 1, 1, 1, 1,
0.453627, 0.3839748, 0.9475455, 1, 1, 1, 1, 1,
0.4538276, 0.3615945, 2.13779, 1, 1, 1, 1, 1,
0.460036, 0.7856614, 1.456823, 1, 1, 1, 1, 1,
0.462851, 1.166839, -0.01141, 1, 1, 1, 1, 1,
0.4650355, 0.04404303, 1.136656, 1, 1, 1, 1, 1,
0.4655264, 0.5506426, 1.425781, 1, 1, 1, 1, 1,
0.4661098, -1.409328, 3.274217, 1, 1, 1, 1, 1,
0.4668893, -0.4466492, 3.970511, 1, 1, 1, 1, 1,
0.4710428, -1.224287, 3.105034, 1, 1, 1, 1, 1,
0.4733764, -0.1353358, 0.2366172, 1, 1, 1, 1, 1,
0.4792188, -1.267146, 4.225913, 0, 0, 1, 1, 1,
0.4800905, 0.07698055, 1.403208, 1, 0, 0, 1, 1,
0.4804188, -1.451568, 1.878875, 1, 0, 0, 1, 1,
0.4943518, -0.737842, 2.047146, 1, 0, 0, 1, 1,
0.4951265, -0.8013293, 2.629526, 1, 0, 0, 1, 1,
0.5005205, -0.1472909, 2.937436, 1, 0, 0, 1, 1,
0.5055931, 0.3637357, 0.3547955, 0, 0, 0, 1, 1,
0.5083278, 0.9616523, 2.262758, 0, 0, 0, 1, 1,
0.5101469, 0.935856, -0.1447895, 0, 0, 0, 1, 1,
0.5102286, 0.4240093, 0.9597273, 0, 0, 0, 1, 1,
0.5106021, 0.5139012, 0.9969186, 0, 0, 0, 1, 1,
0.5122964, -0.2342131, 4.353011, 0, 0, 0, 1, 1,
0.5157169, -0.9127031, 2.567559, 0, 0, 0, 1, 1,
0.5195919, 0.345666, -0.07338174, 1, 1, 1, 1, 1,
0.5255308, -0.8694676, 0.8814255, 1, 1, 1, 1, 1,
0.5262277, -0.4233794, 3.523531, 1, 1, 1, 1, 1,
0.5321078, 0.3270512, -0.2272767, 1, 1, 1, 1, 1,
0.5330909, -0.1267974, 0.5157964, 1, 1, 1, 1, 1,
0.533351, -0.4205327, 2.477885, 1, 1, 1, 1, 1,
0.5371965, 0.1042752, 2.219829, 1, 1, 1, 1, 1,
0.5429364, 1.112924, -0.1267215, 1, 1, 1, 1, 1,
0.5451147, -1.547841, 2.684644, 1, 1, 1, 1, 1,
0.547382, -0.9033229, 2.810687, 1, 1, 1, 1, 1,
0.5506791, 0.5012599, 0.1690499, 1, 1, 1, 1, 1,
0.5510767, 1.432758, -0.3737456, 1, 1, 1, 1, 1,
0.5534526, -1.165462, 1.423154, 1, 1, 1, 1, 1,
0.5544121, 0.175189, -0.004500648, 1, 1, 1, 1, 1,
0.5548651, 1.216405, 1.041356, 1, 1, 1, 1, 1,
0.5551186, 1.002709, 0.2241678, 0, 0, 1, 1, 1,
0.5586747, -1.356768, 2.158572, 1, 0, 0, 1, 1,
0.5615615, 0.6004661, 1.157718, 1, 0, 0, 1, 1,
0.5690325, 1.313869, -0.2490502, 1, 0, 0, 1, 1,
0.5731627, -1.264545, 1.624096, 1, 0, 0, 1, 1,
0.5797274, 0.8722976, 0.1435581, 1, 0, 0, 1, 1,
0.5877381, 0.0940618, 2.226969, 0, 0, 0, 1, 1,
0.5892943, 0.213236, 1.459643, 0, 0, 0, 1, 1,
0.5953216, 1.432599, -0.2457771, 0, 0, 0, 1, 1,
0.5967925, -1.521047, 0.3540397, 0, 0, 0, 1, 1,
0.6023812, 0.4196293, 2.158274, 0, 0, 0, 1, 1,
0.6044882, 0.3110852, -0.3971038, 0, 0, 0, 1, 1,
0.605792, 1.580683, -0.03422321, 0, 0, 0, 1, 1,
0.6093107, -0.6885524, 2.900224, 1, 1, 1, 1, 1,
0.6121909, 0.9366567, 1.178791, 1, 1, 1, 1, 1,
0.6146531, -0.2247656, 1.618322, 1, 1, 1, 1, 1,
0.6152439, -0.2140942, 2.254575, 1, 1, 1, 1, 1,
0.6154429, 1.174365, -0.7053404, 1, 1, 1, 1, 1,
0.6245763, -0.7949355, 3.429603, 1, 1, 1, 1, 1,
0.6317518, -0.3827116, 1.687807, 1, 1, 1, 1, 1,
0.6329167, -0.9401364, 3.575332, 1, 1, 1, 1, 1,
0.6329554, 0.06145658, 0.9949992, 1, 1, 1, 1, 1,
0.637791, -1.073269, 2.902987, 1, 1, 1, 1, 1,
0.6481779, -1.333392, 1.308961, 1, 1, 1, 1, 1,
0.6515319, 0.5165997, 0.891623, 1, 1, 1, 1, 1,
0.6581491, 0.5399683, 1.037457, 1, 1, 1, 1, 1,
0.6619635, 0.07879394, 1.248357, 1, 1, 1, 1, 1,
0.6625751, -1.228115, 3.14664, 1, 1, 1, 1, 1,
0.6632192, -2.077376, 2.453146, 0, 0, 1, 1, 1,
0.6664767, 1.935338, 0.5149531, 1, 0, 0, 1, 1,
0.6702188, -0.6519611, 0.3234505, 1, 0, 0, 1, 1,
0.6721248, -1.048164, 2.048453, 1, 0, 0, 1, 1,
0.6739405, 1.829574, 1.64841, 1, 0, 0, 1, 1,
0.6739798, 1.001494, 0.9373987, 1, 0, 0, 1, 1,
0.6769549, 1.644013, 0.989367, 0, 0, 0, 1, 1,
0.6818751, 0.2396628, 1.782007, 0, 0, 0, 1, 1,
0.6845815, 0.3202574, 1.419744, 0, 0, 0, 1, 1,
0.6894811, -0.09984195, 1.296326, 0, 0, 0, 1, 1,
0.6916196, -0.6480107, 4.8674, 0, 0, 0, 1, 1,
0.6971809, 1.204584, 2.524014, 0, 0, 0, 1, 1,
0.698686, -0.002133001, 2.395754, 0, 0, 0, 1, 1,
0.7026919, 1.261724, 0.2537572, 1, 1, 1, 1, 1,
0.7029007, -1.371122, 2.346465, 1, 1, 1, 1, 1,
0.7037999, -0.8086516, 1.702678, 1, 1, 1, 1, 1,
0.7046039, 0.5447836, 1.959788, 1, 1, 1, 1, 1,
0.7050405, -0.3502908, -0.2021765, 1, 1, 1, 1, 1,
0.7073682, 0.7146543, 0.4732668, 1, 1, 1, 1, 1,
0.7110556, -0.6418262, 2.110264, 1, 1, 1, 1, 1,
0.7124312, 1.428379, 0.3258222, 1, 1, 1, 1, 1,
0.7133078, 0.3163048, 1.317048, 1, 1, 1, 1, 1,
0.7147824, 0.4127901, 0.7710449, 1, 1, 1, 1, 1,
0.7192875, 1.956708, 0.946718, 1, 1, 1, 1, 1,
0.719529, -1.139855, 3.452519, 1, 1, 1, 1, 1,
0.7198751, 1.366176, 0.9562598, 1, 1, 1, 1, 1,
0.7216648, 0.8936495, 0.1467951, 1, 1, 1, 1, 1,
0.7268397, -1.126652, 2.38936, 1, 1, 1, 1, 1,
0.7275966, -0.1251035, 2.019864, 0, 0, 1, 1, 1,
0.7296068, 1.583045, 0.1725473, 1, 0, 0, 1, 1,
0.731683, -2.207234, 2.715407, 1, 0, 0, 1, 1,
0.7334995, 0.2202182, 2.113621, 1, 0, 0, 1, 1,
0.7344531, 0.2199041, 1.970152, 1, 0, 0, 1, 1,
0.7361106, -0.03693976, 2.557113, 1, 0, 0, 1, 1,
0.7367224, -0.3903021, 2.93421, 0, 0, 0, 1, 1,
0.742884, 0.6048724, 0.480664, 0, 0, 0, 1, 1,
0.7442264, 0.02069945, 1.831025, 0, 0, 0, 1, 1,
0.747865, 0.6020314, -0.9576331, 0, 0, 0, 1, 1,
0.7481265, 0.5103281, 0.7977634, 0, 0, 0, 1, 1,
0.7496721, 1.671246, -1.120206, 0, 0, 0, 1, 1,
0.751128, 0.9878665, 0.3781965, 0, 0, 0, 1, 1,
0.7528186, 0.2550912, -0.5150669, 1, 1, 1, 1, 1,
0.7539406, 0.8357939, 0.1963575, 1, 1, 1, 1, 1,
0.7580253, -0.4418631, 0.7601867, 1, 1, 1, 1, 1,
0.7592388, 1.136347, 1.794995, 1, 1, 1, 1, 1,
0.7648765, 1.513882, 1.867122, 1, 1, 1, 1, 1,
0.7652193, 1.341508, 1.468858, 1, 1, 1, 1, 1,
0.7654832, -0.3935266, 1.072265, 1, 1, 1, 1, 1,
0.7660288, 1.998586, 1.848018, 1, 1, 1, 1, 1,
0.7773678, -0.5241615, 2.983935, 1, 1, 1, 1, 1,
0.7839581, 1.488384, 0.7000245, 1, 1, 1, 1, 1,
0.7870068, -0.3864445, 2.337893, 1, 1, 1, 1, 1,
0.7923423, -0.1286525, 0.2569006, 1, 1, 1, 1, 1,
0.8059647, 1.428158, -0.1547702, 1, 1, 1, 1, 1,
0.8125346, 0.1902673, 2.863618, 1, 1, 1, 1, 1,
0.8160083, 1.187078, 2.194651, 1, 1, 1, 1, 1,
0.8179129, 2.010783, -0.1962933, 0, 0, 1, 1, 1,
0.8180407, -0.7705415, 2.650989, 1, 0, 0, 1, 1,
0.8253282, 0.1044991, 0.9138965, 1, 0, 0, 1, 1,
0.8271512, -0.4434572, 1.930782, 1, 0, 0, 1, 1,
0.8280528, -1.837065, 3.415354, 1, 0, 0, 1, 1,
0.8301625, 1.049471, 1.688632, 1, 0, 0, 1, 1,
0.8304521, -0.6008742, 0.6068478, 0, 0, 0, 1, 1,
0.8310117, 0.1596361, 1.610785, 0, 0, 0, 1, 1,
0.8330076, -0.4441431, 1.673939, 0, 0, 0, 1, 1,
0.8404933, 0.2108889, 1.283344, 0, 0, 0, 1, 1,
0.8414663, -0.1561345, 1.29874, 0, 0, 0, 1, 1,
0.8415843, 1.323785, 1.792431, 0, 0, 0, 1, 1,
0.8416789, -0.5796184, 4.60644, 0, 0, 0, 1, 1,
0.8435751, 0.3257718, 1.047192, 1, 1, 1, 1, 1,
0.8446901, 0.2635829, 0.352467, 1, 1, 1, 1, 1,
0.8498191, -1.020532, 3.429051, 1, 1, 1, 1, 1,
0.8518592, 1.394023, 0.3398952, 1, 1, 1, 1, 1,
0.8551489, 1.287565, 1.129979, 1, 1, 1, 1, 1,
0.8556284, 1.075567, 1.196198, 1, 1, 1, 1, 1,
0.8597404, 2.015836, -0.261048, 1, 1, 1, 1, 1,
0.8620018, 0.9282933, 1.557948, 1, 1, 1, 1, 1,
0.8633593, 1.301391, 1.683257, 1, 1, 1, 1, 1,
0.8636218, -1.443883, 1.065325, 1, 1, 1, 1, 1,
0.8696803, -0.7941052, 3.438003, 1, 1, 1, 1, 1,
0.8705768, -0.128749, 1.15479, 1, 1, 1, 1, 1,
0.8721766, -0.3507842, 1.991322, 1, 1, 1, 1, 1,
0.8732702, -2.044884, 3.000771, 1, 1, 1, 1, 1,
0.8750333, -0.9163646, 2.55733, 1, 1, 1, 1, 1,
0.8816877, 0.4608667, -0.2894968, 0, 0, 1, 1, 1,
0.8870874, 0.3041053, 1.457684, 1, 0, 0, 1, 1,
0.8874164, 0.9611533, 0.8066033, 1, 0, 0, 1, 1,
0.8894266, -0.1463641, 2.004709, 1, 0, 0, 1, 1,
0.8906056, 0.0417948, -0.6126935, 1, 0, 0, 1, 1,
0.896761, -0.1996004, 1.575868, 1, 0, 0, 1, 1,
0.8979694, -1.19398, 2.214346, 0, 0, 0, 1, 1,
0.9018881, 1.557769, 1.309315, 0, 0, 0, 1, 1,
0.9044747, 0.01545302, 0.09259367, 0, 0, 0, 1, 1,
0.9058339, -0.317043, 0.27681, 0, 0, 0, 1, 1,
0.9063682, -0.119011, 1.769583, 0, 0, 0, 1, 1,
0.9083183, 0.793779, -0.1463201, 0, 0, 0, 1, 1,
0.9127191, -1.339472, 1.810999, 0, 0, 0, 1, 1,
0.918091, 0.1614805, 1.407717, 1, 1, 1, 1, 1,
0.9201004, -1.593989, 3.600915, 1, 1, 1, 1, 1,
0.9245649, -0.4730895, 2.300877, 1, 1, 1, 1, 1,
0.9265436, -0.8839363, 2.164907, 1, 1, 1, 1, 1,
0.9323553, -2.288966, 2.162903, 1, 1, 1, 1, 1,
0.9445117, 1.106347, -0.3032749, 1, 1, 1, 1, 1,
0.9467991, 0.03412158, 1.638106, 1, 1, 1, 1, 1,
0.9473148, -0.3829214, 1.850223, 1, 1, 1, 1, 1,
0.9474214, -0.1019137, 2.565789, 1, 1, 1, 1, 1,
0.9474382, 0.8303021, 1.196339, 1, 1, 1, 1, 1,
0.9517909, 0.6775119, -0.6980454, 1, 1, 1, 1, 1,
0.9550183, 0.6337091, 2.212487, 1, 1, 1, 1, 1,
0.9560865, 0.4658425, 1.182065, 1, 1, 1, 1, 1,
0.9584525, -1.376171, 3.076339, 1, 1, 1, 1, 1,
0.9621359, 0.9947688, 1.950626, 1, 1, 1, 1, 1,
0.9672039, -0.8622949, 2.068119, 0, 0, 1, 1, 1,
0.977604, 0.5748113, 3.410353, 1, 0, 0, 1, 1,
0.9815929, 1.435327, 2.170395, 1, 0, 0, 1, 1,
0.9864758, -1.353808, 2.711414, 1, 0, 0, 1, 1,
0.9889969, 1.124037, 2.524221, 1, 0, 0, 1, 1,
0.9891393, 0.5408756, 1.274157, 1, 0, 0, 1, 1,
0.9911627, 0.3738216, 2.038284, 0, 0, 0, 1, 1,
0.9946844, -0.4734724, 0.6698298, 0, 0, 0, 1, 1,
0.9966819, 0.9083199, -0.3127258, 0, 0, 0, 1, 1,
0.9967001, -0.6778536, 2.108033, 0, 0, 0, 1, 1,
1.006586, 0.06332947, 1.207222, 0, 0, 0, 1, 1,
1.009529, 2.281217, -0.7441624, 0, 0, 0, 1, 1,
1.021368, 0.07255672, 2.621841, 0, 0, 0, 1, 1,
1.021639, 0.5324691, 2.982169, 1, 1, 1, 1, 1,
1.026836, -0.09020706, 0.1273718, 1, 1, 1, 1, 1,
1.027241, -1.782103, 2.151116, 1, 1, 1, 1, 1,
1.028837, -0.2956955, 3.403972, 1, 1, 1, 1, 1,
1.032042, -1.197483, 3.032197, 1, 1, 1, 1, 1,
1.032352, -0.3631212, 0.1959964, 1, 1, 1, 1, 1,
1.039084, -0.8395007, 1.7857, 1, 1, 1, 1, 1,
1.044499, -1.326577, 2.12811, 1, 1, 1, 1, 1,
1.046355, 0.5927839, 0.3082998, 1, 1, 1, 1, 1,
1.048959, -0.07181497, 1.461085, 1, 1, 1, 1, 1,
1.050518, 0.6334885, 1.507472, 1, 1, 1, 1, 1,
1.05599, -0.5804213, 1.267197, 1, 1, 1, 1, 1,
1.062346, -0.3435903, 4.136185, 1, 1, 1, 1, 1,
1.06669, -1.614891, 2.296833, 1, 1, 1, 1, 1,
1.06861, 0.6820641, 2.584671, 1, 1, 1, 1, 1,
1.071746, -0.2371451, 1.219911, 0, 0, 1, 1, 1,
1.077919, 0.005618388, 0.02583376, 1, 0, 0, 1, 1,
1.088541, 1.773713, 0.1138353, 1, 0, 0, 1, 1,
1.089297, -0.3472306, -0.3218015, 1, 0, 0, 1, 1,
1.091788, -0.2634961, 3.118205, 1, 0, 0, 1, 1,
1.092894, -1.398002, 2.769088, 1, 0, 0, 1, 1,
1.095265, -0.4329533, 1.090286, 0, 0, 0, 1, 1,
1.098171, 0.3829516, 1.053141, 0, 0, 0, 1, 1,
1.098432, 1.002762, 1.534576, 0, 0, 0, 1, 1,
1.099234, 1.265796, 0.4432538, 0, 0, 0, 1, 1,
1.099387, 0.9140803, 0.3261881, 0, 0, 0, 1, 1,
1.108299, -0.1658439, 2.975607, 0, 0, 0, 1, 1,
1.111906, 0.2276974, 1.888294, 0, 0, 0, 1, 1,
1.112179, 1.004324, -0.1365602, 1, 1, 1, 1, 1,
1.117044, 0.1667101, -0.2205702, 1, 1, 1, 1, 1,
1.119392, 0.2314986, 0.4305201, 1, 1, 1, 1, 1,
1.122097, 0.7692055, 3.359537, 1, 1, 1, 1, 1,
1.123787, -0.7298074, 2.08112, 1, 1, 1, 1, 1,
1.136374, 0.6688386, 0.5537484, 1, 1, 1, 1, 1,
1.139374, -0.2717053, 1.360969, 1, 1, 1, 1, 1,
1.144922, 0.7049682, -0.2469144, 1, 1, 1, 1, 1,
1.146379, 2.37899, 0.7091998, 1, 1, 1, 1, 1,
1.152204, 0.9163714, 0.2161795, 1, 1, 1, 1, 1,
1.153142, -2.653552, 4.492811, 1, 1, 1, 1, 1,
1.170092, 1.54845, 0.34088, 1, 1, 1, 1, 1,
1.172374, -0.2451366, 0.4337465, 1, 1, 1, 1, 1,
1.175379, 0.5123457, 0.09832951, 1, 1, 1, 1, 1,
1.181676, 0.1771501, 1.253597, 1, 1, 1, 1, 1,
1.189044, 1.216436, 1.202221, 0, 0, 1, 1, 1,
1.196529, 0.3623401, -1.848242, 1, 0, 0, 1, 1,
1.197709, -1.061385, 3.10071, 1, 0, 0, 1, 1,
1.206465, 1.215097, 1.435479, 1, 0, 0, 1, 1,
1.207723, -0.4580516, 2.602606, 1, 0, 0, 1, 1,
1.208163, 0.602159, 1.502996, 1, 0, 0, 1, 1,
1.209581, -0.4216703, 0.3767931, 0, 0, 0, 1, 1,
1.21522, -0.02979058, 1.58877, 0, 0, 0, 1, 1,
1.218357, 0.7147825, 2.683739, 0, 0, 0, 1, 1,
1.221358, 0.271842, 1.730424, 0, 0, 0, 1, 1,
1.229994, -1.392137, 2.648534, 0, 0, 0, 1, 1,
1.237981, 1.668184, -0.02078405, 0, 0, 0, 1, 1,
1.240394, 0.8355572, 0.9807148, 0, 0, 0, 1, 1,
1.246103, 1.683659, 0.7572737, 1, 1, 1, 1, 1,
1.250978, 0.8660386, 0.6386668, 1, 1, 1, 1, 1,
1.252055, -0.7898479, 2.236246, 1, 1, 1, 1, 1,
1.253495, -1.026178, 1.055469, 1, 1, 1, 1, 1,
1.253824, 1.579292, -0.1383164, 1, 1, 1, 1, 1,
1.264913, 0.2001715, 1.019006, 1, 1, 1, 1, 1,
1.269564, -0.002230785, 0.03335396, 1, 1, 1, 1, 1,
1.270929, 0.4142534, 0.5531396, 1, 1, 1, 1, 1,
1.273509, 0.6369655, -0.0597806, 1, 1, 1, 1, 1,
1.273729, -1.724753, 1.678953, 1, 1, 1, 1, 1,
1.278563, -0.1814832, 2.552239, 1, 1, 1, 1, 1,
1.283973, -0.9649886, 3.340781, 1, 1, 1, 1, 1,
1.284335, 0.7754028, 1.323362, 1, 1, 1, 1, 1,
1.289535, 0.1231758, 1.600268, 1, 1, 1, 1, 1,
1.300077, 1.560382, -0.8475012, 1, 1, 1, 1, 1,
1.301267, 1.014609, 2.116409, 0, 0, 1, 1, 1,
1.302821, 0.7702926, 0.3731532, 1, 0, 0, 1, 1,
1.316482, 0.4495932, 1.430912, 1, 0, 0, 1, 1,
1.324459, -0.3380249, 0.1246051, 1, 0, 0, 1, 1,
1.339078, -0.2528689, 0.517934, 1, 0, 0, 1, 1,
1.341523, -0.7753461, 1.127252, 1, 0, 0, 1, 1,
1.349451, -0.8158344, 2.426527, 0, 0, 0, 1, 1,
1.356063, 0.826148, 0.6935401, 0, 0, 0, 1, 1,
1.358195, 0.4061641, 1.644595, 0, 0, 0, 1, 1,
1.359639, -0.8878543, 1.51162, 0, 0, 0, 1, 1,
1.364628, 1.450872, 1.621259, 0, 0, 0, 1, 1,
1.37024, -1.678275, 2.525934, 0, 0, 0, 1, 1,
1.376906, 1.094307, 1.016146, 0, 0, 0, 1, 1,
1.392416, -1.183982, 3.644601, 1, 1, 1, 1, 1,
1.392472, -0.6391719, 2.643309, 1, 1, 1, 1, 1,
1.394722, -0.6426376, 1.879601, 1, 1, 1, 1, 1,
1.39651, 0.3987399, 1.637083, 1, 1, 1, 1, 1,
1.397358, -0.004716061, 2.644237, 1, 1, 1, 1, 1,
1.397769, -1.108914, 3.942161, 1, 1, 1, 1, 1,
1.416268, -0.2208112, 3.422697, 1, 1, 1, 1, 1,
1.417903, 0.2126827, 1.95916, 1, 1, 1, 1, 1,
1.427203, 0.8469961, 1.481352, 1, 1, 1, 1, 1,
1.436216, -1.330861, 2.822293, 1, 1, 1, 1, 1,
1.454607, 0.09367692, 3.194768, 1, 1, 1, 1, 1,
1.473316, 0.08297552, 1.236337, 1, 1, 1, 1, 1,
1.478963, -0.2016389, 0.9781004, 1, 1, 1, 1, 1,
1.495361, -1.232152, 3.678078, 1, 1, 1, 1, 1,
1.50875, 0.05342638, 1.901396, 1, 1, 1, 1, 1,
1.515633, 0.3811083, 2.037977, 0, 0, 1, 1, 1,
1.530576, -0.6903899, 0.6520327, 1, 0, 0, 1, 1,
1.53462, 0.959991, 4.197213, 1, 0, 0, 1, 1,
1.536833, 0.2130641, 2.208712, 1, 0, 0, 1, 1,
1.540683, 1.090796, -0.2564003, 1, 0, 0, 1, 1,
1.54498, -2.418922, 1.884218, 1, 0, 0, 1, 1,
1.549797, -0.07620658, 0.9691519, 0, 0, 0, 1, 1,
1.561966, 1.300408, 0.06249961, 0, 0, 0, 1, 1,
1.564717, 0.07069424, 1.264482, 0, 0, 0, 1, 1,
1.574704, 1.826007, 0.1682559, 0, 0, 0, 1, 1,
1.581697, -0.5970891, 1.063366, 0, 0, 0, 1, 1,
1.583093, 0.140848, 0.5763463, 0, 0, 0, 1, 1,
1.616629, 1.620643, 2.035132, 0, 0, 0, 1, 1,
1.655829, 0.6342738, 0.4242757, 1, 1, 1, 1, 1,
1.659774, -0.1254776, 1.547205, 1, 1, 1, 1, 1,
1.665282, 0.1132883, 1.107996, 1, 1, 1, 1, 1,
1.67931, -2.235758, 3.860239, 1, 1, 1, 1, 1,
1.707556, -0.791128, 3.622537, 1, 1, 1, 1, 1,
1.72428, 1.78935, 1.788764, 1, 1, 1, 1, 1,
1.738817, -0.166882, 2.815796, 1, 1, 1, 1, 1,
1.786994, -0.5327947, 1.973826, 1, 1, 1, 1, 1,
1.815887, 1.138898, 2.616596, 1, 1, 1, 1, 1,
1.81711, 0.1204213, 1.091103, 1, 1, 1, 1, 1,
1.82405, -1.08539, 3.390766, 1, 1, 1, 1, 1,
1.849905, -0.871097, 2.787846, 1, 1, 1, 1, 1,
1.857651, -0.2723147, 2.781277, 1, 1, 1, 1, 1,
1.89918, 0.5945799, 3.629233, 1, 1, 1, 1, 1,
1.91976, 0.3687152, 0.5725086, 1, 1, 1, 1, 1,
1.926289, -0.8590631, 2.58046, 0, 0, 1, 1, 1,
1.941083, -0.2255705, 0.4009767, 1, 0, 0, 1, 1,
1.991729, -0.7723933, 4.164532, 1, 0, 0, 1, 1,
2.006656, -0.2956439, 2.415025, 1, 0, 0, 1, 1,
2.020985, 1.376257, 1.798632, 1, 0, 0, 1, 1,
2.063899, 1.238213, 1.051139, 1, 0, 0, 1, 1,
2.088085, -0.2663781, 0.8134331, 0, 0, 0, 1, 1,
2.172242, 1.379676, 1.518214, 0, 0, 0, 1, 1,
2.236785, -0.654627, 3.20045, 0, 0, 0, 1, 1,
2.244304, 0.2826033, 0.9998938, 0, 0, 0, 1, 1,
2.245539, -1.428884, 2.987801, 0, 0, 0, 1, 1,
2.307603, -0.7262698, 3.54535, 0, 0, 0, 1, 1,
2.451719, 0.3569177, 2.043643, 0, 0, 0, 1, 1,
2.484249, 0.6441593, 0.6034994, 1, 1, 1, 1, 1,
2.484769, -1.093173, 2.340556, 1, 1, 1, 1, 1,
2.51795, -0.6947278, 2.167638, 1, 1, 1, 1, 1,
2.565144, 0.986352, 1.286868, 1, 1, 1, 1, 1,
2.602777, -2.101985, 2.774811, 1, 1, 1, 1, 1,
2.880372, 1.669617, 0.8084907, 1, 1, 1, 1, 1,
3.567168, 1.977077, 0.006412944, 1, 1, 1, 1, 1
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
var radius = 9.72628;
var distance = 34.16315;
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
mvMatrix.translate( -0.1494002, -0.101369, 0.3197262 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.16315);
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
