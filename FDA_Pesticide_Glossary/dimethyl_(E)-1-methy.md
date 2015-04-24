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
-3.879748, -0.3215244, -1.025461, 1, 0, 0, 1,
-3.018099, -2.219455, -3.056752, 1, 0.007843138, 0, 1,
-2.679174, 1.189419, -1.822984, 1, 0.01176471, 0, 1,
-2.654806, -0.2099241, -1.800209, 1, 0.01960784, 0, 1,
-2.499513, -0.3087642, -0.7918467, 1, 0.02352941, 0, 1,
-2.371504, 0.05255465, 1.013245, 1, 0.03137255, 0, 1,
-2.306209, 0.4021653, -0.9823147, 1, 0.03529412, 0, 1,
-2.295971, 0.5595044, -2.562428, 1, 0.04313726, 0, 1,
-2.268533, -1.255631, -1.98909, 1, 0.04705882, 0, 1,
-2.214942, -1.321522, -1.040628, 1, 0.05490196, 0, 1,
-2.1706, 0.3261822, -1.376124, 1, 0.05882353, 0, 1,
-2.138554, -0.9776516, -3.383831, 1, 0.06666667, 0, 1,
-2.07128, -0.3814186, -2.437814, 1, 0.07058824, 0, 1,
-2.068412, 0.2144567, -1.649371, 1, 0.07843138, 0, 1,
-2.029447, 1.109103, -0.9236992, 1, 0.08235294, 0, 1,
-2.019181, 2.361639, -2.505786, 1, 0.09019608, 0, 1,
-2.013864, -0.6838399, -3.041503, 1, 0.09411765, 0, 1,
-1.990178, -0.01880447, -0.5473899, 1, 0.1019608, 0, 1,
-1.96545, 0.04368936, -2.374687, 1, 0.1098039, 0, 1,
-1.963418, -1.093861, -3.474231, 1, 0.1137255, 0, 1,
-1.96104, -0.25639, -2.841341, 1, 0.1215686, 0, 1,
-1.936799, 1.456017, -1.043548, 1, 0.1254902, 0, 1,
-1.932518, 0.8515753, -1.42201, 1, 0.1333333, 0, 1,
-1.931108, 0.4092683, -3.877068, 1, 0.1372549, 0, 1,
-1.926231, -0.1930094, -3.093035, 1, 0.145098, 0, 1,
-1.907907, -1.523174, -2.798014, 1, 0.1490196, 0, 1,
-1.900017, 0.9635988, -0.317771, 1, 0.1568628, 0, 1,
-1.888732, -1.388504, -3.691176, 1, 0.1607843, 0, 1,
-1.885214, 0.1037796, -1.15139, 1, 0.1686275, 0, 1,
-1.880969, -0.5418341, -2.743598, 1, 0.172549, 0, 1,
-1.872413, 0.05637838, -1.264676, 1, 0.1803922, 0, 1,
-1.843936, -0.4807132, -1.511734, 1, 0.1843137, 0, 1,
-1.840793, -0.2886631, -1.604941, 1, 0.1921569, 0, 1,
-1.830745, 0.8231186, -0.7507175, 1, 0.1960784, 0, 1,
-1.829171, -0.5530729, -2.085566, 1, 0.2039216, 0, 1,
-1.828411, 0.4032887, -1.142603, 1, 0.2117647, 0, 1,
-1.826017, 1.472582, -2.393823, 1, 0.2156863, 0, 1,
-1.804557, -0.1881779, -2.437054, 1, 0.2235294, 0, 1,
-1.796685, -1.453878, -4.137096, 1, 0.227451, 0, 1,
-1.786895, -0.5089827, -0.8087748, 1, 0.2352941, 0, 1,
-1.784691, -1.388562, -3.685911, 1, 0.2392157, 0, 1,
-1.777825, -0.878983, -1.420798, 1, 0.2470588, 0, 1,
-1.777087, -0.4304108, -0.6969442, 1, 0.2509804, 0, 1,
-1.775434, -2.012515, -1.98964, 1, 0.2588235, 0, 1,
-1.762121, 0.9631892, -0.6072823, 1, 0.2627451, 0, 1,
-1.743423, -0.01192101, -1.314809, 1, 0.2705882, 0, 1,
-1.729915, -1.394074, -3.023619, 1, 0.2745098, 0, 1,
-1.714707, 1.21875, -0.268525, 1, 0.282353, 0, 1,
-1.674002, 0.4254107, -1.2146, 1, 0.2862745, 0, 1,
-1.671613, -1.359073, -3.974728, 1, 0.2941177, 0, 1,
-1.66664, 0.2371974, -2.401607, 1, 0.3019608, 0, 1,
-1.644758, 0.4972843, -1.849573, 1, 0.3058824, 0, 1,
-1.638543, 0.1831587, -3.862176, 1, 0.3137255, 0, 1,
-1.614522, -1.755212, -3.753803, 1, 0.3176471, 0, 1,
-1.611302, -0.02501572, -0.5883481, 1, 0.3254902, 0, 1,
-1.607964, 0.838312, -1.785211, 1, 0.3294118, 0, 1,
-1.605181, 0.5903106, -0.5424483, 1, 0.3372549, 0, 1,
-1.590534, 2.15814, -0.7774365, 1, 0.3411765, 0, 1,
-1.572539, 0.3716877, -0.1296926, 1, 0.3490196, 0, 1,
-1.52839, 0.0999012, -1.612174, 1, 0.3529412, 0, 1,
-1.514015, -0.18642, -1.44448, 1, 0.3607843, 0, 1,
-1.512329, -0.3461366, -0.4654309, 1, 0.3647059, 0, 1,
-1.512302, 0.1235312, -1.939862, 1, 0.372549, 0, 1,
-1.500469, -0.8103654, -2.981794, 1, 0.3764706, 0, 1,
-1.49626, 0.6864462, -1.821679, 1, 0.3843137, 0, 1,
-1.478042, 1.589383, -1.347985, 1, 0.3882353, 0, 1,
-1.440553, 0.8772263, -1.469741, 1, 0.3960784, 0, 1,
-1.430606, 1.710251, -0.8886759, 1, 0.4039216, 0, 1,
-1.425623, 1.1076, 0.8487068, 1, 0.4078431, 0, 1,
-1.423692, 0.2327849, -1.756451, 1, 0.4156863, 0, 1,
-1.404902, -3.130487, -4.093324, 1, 0.4196078, 0, 1,
-1.400011, -0.9997474, -3.289189, 1, 0.427451, 0, 1,
-1.399054, 0.6818737, -0.462223, 1, 0.4313726, 0, 1,
-1.391118, 0.4946509, -0.694648, 1, 0.4392157, 0, 1,
-1.390216, -1.664088, -3.555829, 1, 0.4431373, 0, 1,
-1.386181, 0.6391824, -1.169161, 1, 0.4509804, 0, 1,
-1.376903, 0.2591334, -0.3846061, 1, 0.454902, 0, 1,
-1.374064, -0.0002725039, -0.1145152, 1, 0.4627451, 0, 1,
-1.365317, 1.695758, -1.269233, 1, 0.4666667, 0, 1,
-1.36055, 1.145465, -1.537719, 1, 0.4745098, 0, 1,
-1.347381, 0.3561628, -2.662544, 1, 0.4784314, 0, 1,
-1.340204, 1.798449, 0.2647381, 1, 0.4862745, 0, 1,
-1.3253, 0.4491389, -0.8502461, 1, 0.4901961, 0, 1,
-1.324303, 0.03396605, -0.810111, 1, 0.4980392, 0, 1,
-1.309058, -0.7764552, -4.742391, 1, 0.5058824, 0, 1,
-1.306623, 1.909553, -1.143589, 1, 0.509804, 0, 1,
-1.302616, -0.6234018, -3.264769, 1, 0.5176471, 0, 1,
-1.287639, 0.1381661, -0.3037559, 1, 0.5215687, 0, 1,
-1.280646, -0.1975626, -1.582953, 1, 0.5294118, 0, 1,
-1.280278, 0.05909748, -1.926771, 1, 0.5333334, 0, 1,
-1.274553, -0.4495641, -0.9182467, 1, 0.5411765, 0, 1,
-1.273776, -0.6601067, -1.586176, 1, 0.5450981, 0, 1,
-1.273597, 0.1375037, -3.190395, 1, 0.5529412, 0, 1,
-1.27164, -1.334788, -2.396754, 1, 0.5568628, 0, 1,
-1.270145, -0.5638921, -1.380471, 1, 0.5647059, 0, 1,
-1.269638, -2.091835, -3.517183, 1, 0.5686275, 0, 1,
-1.251175, 1.184072, 0.7402375, 1, 0.5764706, 0, 1,
-1.245531, -0.1138549, -3.684879, 1, 0.5803922, 0, 1,
-1.234665, 2.076865, 1.178792, 1, 0.5882353, 0, 1,
-1.231355, 1.081735, -0.8504251, 1, 0.5921569, 0, 1,
-1.225359, 0.1480401, -0.9015231, 1, 0.6, 0, 1,
-1.221209, 0.1730668, 0.2851671, 1, 0.6078432, 0, 1,
-1.220091, -0.4256158, -1.750648, 1, 0.6117647, 0, 1,
-1.215207, -0.8054632, 0.124237, 1, 0.6196079, 0, 1,
-1.214572, -0.9522296, -0.8644747, 1, 0.6235294, 0, 1,
-1.211215, -0.7562926, -1.684869, 1, 0.6313726, 0, 1,
-1.198565, 1.084625, -1.515293, 1, 0.6352941, 0, 1,
-1.188459, 0.8867298, -1.050011, 1, 0.6431373, 0, 1,
-1.187824, 0.3131847, -1.948548, 1, 0.6470588, 0, 1,
-1.182947, -0.7844853, -3.265445, 1, 0.654902, 0, 1,
-1.181061, -0.1850313, -1.947686, 1, 0.6588235, 0, 1,
-1.180859, 1.647289, 1.090701, 1, 0.6666667, 0, 1,
-1.1779, 1.801901, -0.4481393, 1, 0.6705883, 0, 1,
-1.171405, -0.8642499, -1.838954, 1, 0.6784314, 0, 1,
-1.168255, 0.5269329, -0.8304465, 1, 0.682353, 0, 1,
-1.164292, -0.3153431, 0.3047748, 1, 0.6901961, 0, 1,
-1.164001, 0.06961204, -1.365599, 1, 0.6941177, 0, 1,
-1.158191, -0.04600134, -2.636585, 1, 0.7019608, 0, 1,
-1.15697, 0.2048718, -0.2339979, 1, 0.7098039, 0, 1,
-1.154524, -0.3169131, -3.21135, 1, 0.7137255, 0, 1,
-1.149293, -1.768549, -1.132614, 1, 0.7215686, 0, 1,
-1.148367, 0.2211162, -1.585968, 1, 0.7254902, 0, 1,
-1.143713, 0.1661339, -1.937006, 1, 0.7333333, 0, 1,
-1.139965, 0.9553642, -0.6472231, 1, 0.7372549, 0, 1,
-1.138736, -0.2857632, -2.498398, 1, 0.7450981, 0, 1,
-1.136449, -0.5711845, -0.7510709, 1, 0.7490196, 0, 1,
-1.132839, -0.1372837, -0.8431321, 1, 0.7568628, 0, 1,
-1.131861, -0.5988012, -3.182029, 1, 0.7607843, 0, 1,
-1.12789, 0.6984753, -0.6105888, 1, 0.7686275, 0, 1,
-1.127689, 0.05397631, -2.560086, 1, 0.772549, 0, 1,
-1.126924, 0.5867834, -0.2509141, 1, 0.7803922, 0, 1,
-1.126892, -1.039976, -2.522989, 1, 0.7843137, 0, 1,
-1.125297, 0.4700609, -3.173858, 1, 0.7921569, 0, 1,
-1.122978, -0.4912625, -1.336884, 1, 0.7960784, 0, 1,
-1.120409, 0.4379516, -0.4914306, 1, 0.8039216, 0, 1,
-1.110143, -0.9544726, -2.189528, 1, 0.8117647, 0, 1,
-1.10527, 0.3358163, -1.153035, 1, 0.8156863, 0, 1,
-1.099631, -0.5276273, -1.888941, 1, 0.8235294, 0, 1,
-1.08882, -0.7225582, -3.668283, 1, 0.827451, 0, 1,
-1.08249, 0.4391388, -2.377127, 1, 0.8352941, 0, 1,
-1.082429, -0.9372928, -2.411546, 1, 0.8392157, 0, 1,
-1.078418, -1.512049, -2.476238, 1, 0.8470588, 0, 1,
-1.073679, 0.5160545, -0.9655308, 1, 0.8509804, 0, 1,
-1.069524, 0.1899382, -0.381698, 1, 0.8588235, 0, 1,
-1.06935, -2.396848, -1.216933, 1, 0.8627451, 0, 1,
-1.063544, -1.091419, -2.480591, 1, 0.8705882, 0, 1,
-1.0605, -0.02374984, -1.906238, 1, 0.8745098, 0, 1,
-1.049377, 2.243827, 0.1223291, 1, 0.8823529, 0, 1,
-1.04901, -0.4679969, -2.600358, 1, 0.8862745, 0, 1,
-1.048097, -0.9294285, -2.159309, 1, 0.8941177, 0, 1,
-1.046359, 1.055548, -2.101342, 1, 0.8980392, 0, 1,
-1.044535, 1.517346, 1.22142, 1, 0.9058824, 0, 1,
-1.044185, -0.5299987, -1.151308, 1, 0.9137255, 0, 1,
-1.043003, -2.321959, -2.832468, 1, 0.9176471, 0, 1,
-1.036935, -0.7314799, -2.858219, 1, 0.9254902, 0, 1,
-1.030657, -0.4513721, -2.446593, 1, 0.9294118, 0, 1,
-1.027688, 0.2861717, -0.6983376, 1, 0.9372549, 0, 1,
-1.024472, -0.7576639, -2.214796, 1, 0.9411765, 0, 1,
-1.01304, 0.5135374, -1.357053, 1, 0.9490196, 0, 1,
-1.010344, 2.12962, 1.515287, 1, 0.9529412, 0, 1,
-1.00708, -1.69106, -3.089591, 1, 0.9607843, 0, 1,
-1.00636, -0.6556739, -2.89545, 1, 0.9647059, 0, 1,
-1.005349, 0.5110109, -2.306652, 1, 0.972549, 0, 1,
-1.002808, 0.2524302, -2.082481, 1, 0.9764706, 0, 1,
-1.000053, 0.3558701, -0.316729, 1, 0.9843137, 0, 1,
-0.9998659, 1.589673, 0.2480463, 1, 0.9882353, 0, 1,
-0.9995558, 0.4262482, -1.167894, 1, 0.9960784, 0, 1,
-0.9986278, -0.126597, -1.861532, 0.9960784, 1, 0, 1,
-0.9954663, -0.2903229, -1.270011, 0.9921569, 1, 0, 1,
-0.993649, 0.4070036, -2.30744, 0.9843137, 1, 0, 1,
-0.9914039, 0.2853439, -2.025883, 0.9803922, 1, 0, 1,
-0.9908525, 1.159634, -1.746564, 0.972549, 1, 0, 1,
-0.9871883, -1.073504, -2.951314, 0.9686275, 1, 0, 1,
-0.9861498, 1.590253, -0.03685509, 0.9607843, 1, 0, 1,
-0.9858562, 0.957536, -1.463788, 0.9568627, 1, 0, 1,
-0.9808265, -1.436918, -0.234489, 0.9490196, 1, 0, 1,
-0.9745059, -0.7348477, -3.44689, 0.945098, 1, 0, 1,
-0.9723284, 1.810594, 0.1843715, 0.9372549, 1, 0, 1,
-0.9299701, 1.668174, -2.320114, 0.9333333, 1, 0, 1,
-0.9299601, 1.938257, -0.1341927, 0.9254902, 1, 0, 1,
-0.9279705, -0.824671, -1.956707, 0.9215686, 1, 0, 1,
-0.9265202, 0.7072901, -0.5481168, 0.9137255, 1, 0, 1,
-0.9241317, -2.170296, -1.994391, 0.9098039, 1, 0, 1,
-0.9237643, 0.508654, -2.64137, 0.9019608, 1, 0, 1,
-0.9234305, 0.5546863, -0.8444037, 0.8941177, 1, 0, 1,
-0.9198713, 1.987138, 0.8425799, 0.8901961, 1, 0, 1,
-0.9165581, -0.09292279, -2.12779, 0.8823529, 1, 0, 1,
-0.9145022, -0.6147836, -2.726315, 0.8784314, 1, 0, 1,
-0.9102526, 0.3087452, 0.09271989, 0.8705882, 1, 0, 1,
-0.9078864, -0.4066691, -2.669493, 0.8666667, 1, 0, 1,
-0.9056394, -0.4482084, -1.722632, 0.8588235, 1, 0, 1,
-0.9053293, 0.4669596, -0.4427077, 0.854902, 1, 0, 1,
-0.9035401, 1.184712, 0.1273071, 0.8470588, 1, 0, 1,
-0.9009575, 1.426348, -0.08448298, 0.8431373, 1, 0, 1,
-0.8954874, -1.097679, -3.200128, 0.8352941, 1, 0, 1,
-0.8871783, 1.405445, -0.4861155, 0.8313726, 1, 0, 1,
-0.8828097, 1.059145, -1.703402, 0.8235294, 1, 0, 1,
-0.8765292, -0.9782332, -3.304657, 0.8196079, 1, 0, 1,
-0.8758569, -0.4021037, -0.07121953, 0.8117647, 1, 0, 1,
-0.8719698, 0.1084433, -0.6504644, 0.8078431, 1, 0, 1,
-0.8717106, 1.070371, -0.6237008, 0.8, 1, 0, 1,
-0.8682398, 0.1654133, -0.5625159, 0.7921569, 1, 0, 1,
-0.8609484, 1.879446, -0.03309732, 0.7882353, 1, 0, 1,
-0.8567345, 1.391476, -0.9621137, 0.7803922, 1, 0, 1,
-0.8538221, -1.154039, -4.269245, 0.7764706, 1, 0, 1,
-0.8517755, -0.01669383, -2.32016, 0.7686275, 1, 0, 1,
-0.8452595, -1.818803, -1.922404, 0.7647059, 1, 0, 1,
-0.8414772, 0.5366219, -1.786075, 0.7568628, 1, 0, 1,
-0.8332495, 0.6327171, -0.9069919, 0.7529412, 1, 0, 1,
-0.8298945, 0.923113, -2.726863, 0.7450981, 1, 0, 1,
-0.8276382, 1.437218, 0.7240915, 0.7411765, 1, 0, 1,
-0.8258013, -0.7904537, -3.215685, 0.7333333, 1, 0, 1,
-0.8245248, 1.167709, 0.1713512, 0.7294118, 1, 0, 1,
-0.8237313, -0.7199819, -1.292249, 0.7215686, 1, 0, 1,
-0.8235093, 0.5152491, -0.7614438, 0.7176471, 1, 0, 1,
-0.8211637, -0.8895341, -2.810048, 0.7098039, 1, 0, 1,
-0.8189446, -1.065321, -0.5218648, 0.7058824, 1, 0, 1,
-0.8178996, 0.5446804, -1.109734, 0.6980392, 1, 0, 1,
-0.8174029, 1.277365, -2.042926, 0.6901961, 1, 0, 1,
-0.8071844, -1.460186, -2.677643, 0.6862745, 1, 0, 1,
-0.8047327, 0.8854816, -2.075835, 0.6784314, 1, 0, 1,
-0.8045714, 2.725874, 0.1279418, 0.6745098, 1, 0, 1,
-0.8032433, -0.4274342, -2.399663, 0.6666667, 1, 0, 1,
-0.8024293, 1.780912, 0.02041832, 0.6627451, 1, 0, 1,
-0.8020257, 0.3032116, -1.469432, 0.654902, 1, 0, 1,
-0.7998904, 0.552425, -0.7691188, 0.6509804, 1, 0, 1,
-0.7996834, -1.298163, -1.313958, 0.6431373, 1, 0, 1,
-0.7981558, -1.635467, -3.480233, 0.6392157, 1, 0, 1,
-0.7813947, -0.1467131, -0.05060432, 0.6313726, 1, 0, 1,
-0.7777665, -0.3302516, -0.07703246, 0.627451, 1, 0, 1,
-0.7775266, 0.6402072, -1.504005, 0.6196079, 1, 0, 1,
-0.7773726, -0.1551157, -2.386696, 0.6156863, 1, 0, 1,
-0.7770181, 0.416881, -2.74049, 0.6078432, 1, 0, 1,
-0.7716019, -1.203591, -2.004, 0.6039216, 1, 0, 1,
-0.7687151, 0.59611, -0.9981516, 0.5960785, 1, 0, 1,
-0.7471019, -1.413326, -3.546484, 0.5882353, 1, 0, 1,
-0.7467303, 0.6561943, 0.7152516, 0.5843138, 1, 0, 1,
-0.7467039, 0.5296369, -0.6548638, 0.5764706, 1, 0, 1,
-0.7466628, 0.6914911, -0.1289539, 0.572549, 1, 0, 1,
-0.7460178, 0.07410483, -0.6427389, 0.5647059, 1, 0, 1,
-0.7384074, 1.621346, -0.8255122, 0.5607843, 1, 0, 1,
-0.7339025, -0.354105, -1.39658, 0.5529412, 1, 0, 1,
-0.7271475, 0.7785273, -1.292083, 0.5490196, 1, 0, 1,
-0.7247726, -0.7824859, -1.801639, 0.5411765, 1, 0, 1,
-0.7204658, -1.884714, -2.379467, 0.5372549, 1, 0, 1,
-0.7131109, 0.4162105, -2.330736, 0.5294118, 1, 0, 1,
-0.7121474, 0.567026, -2.122999, 0.5254902, 1, 0, 1,
-0.7086692, -0.6736918, -2.569454, 0.5176471, 1, 0, 1,
-0.7082944, -1.925034, -2.991037, 0.5137255, 1, 0, 1,
-0.7067733, 1.118133, 1.91859, 0.5058824, 1, 0, 1,
-0.6999923, -1.668692, -3.543128, 0.5019608, 1, 0, 1,
-0.6987695, 1.15242, -1.187027, 0.4941176, 1, 0, 1,
-0.6970803, 1.494828, -1.537179, 0.4862745, 1, 0, 1,
-0.6886339, 1.80138, 1.365186, 0.4823529, 1, 0, 1,
-0.6712343, 0.8227664, -0.7604727, 0.4745098, 1, 0, 1,
-0.6623662, 1.640477, 0.2831199, 0.4705882, 1, 0, 1,
-0.6601778, -1.126819, -3.552343, 0.4627451, 1, 0, 1,
-0.6554697, -0.5094351, -3.060801, 0.4588235, 1, 0, 1,
-0.6302719, 1.486427, -1.72886, 0.4509804, 1, 0, 1,
-0.628563, -0.009532161, -1.130065, 0.4470588, 1, 0, 1,
-0.627317, -0.8699391, -2.159987, 0.4392157, 1, 0, 1,
-0.6263854, -0.6999887, -2.58625, 0.4352941, 1, 0, 1,
-0.6227986, -0.3260567, -0.8947573, 0.427451, 1, 0, 1,
-0.6205563, -2.393562, -2.811206, 0.4235294, 1, 0, 1,
-0.6169944, -0.7210039, -0.4481472, 0.4156863, 1, 0, 1,
-0.6102488, -0.4655232, -3.951674, 0.4117647, 1, 0, 1,
-0.6072994, -1.908042, -3.879955, 0.4039216, 1, 0, 1,
-0.6034541, 0.3926854, -2.267687, 0.3960784, 1, 0, 1,
-0.5961431, 0.6883792, -1.043396, 0.3921569, 1, 0, 1,
-0.594567, 0.9481192, -0.4457348, 0.3843137, 1, 0, 1,
-0.5933948, 1.275794, -1.538543, 0.3803922, 1, 0, 1,
-0.5922601, 1.118605, -1.169895, 0.372549, 1, 0, 1,
-0.5918478, 1.712631, 1.772332, 0.3686275, 1, 0, 1,
-0.589947, -1.533332, -1.372092, 0.3607843, 1, 0, 1,
-0.5889856, -1.832112, -2.311739, 0.3568628, 1, 0, 1,
-0.5880969, 0.6207969, -0.9841017, 0.3490196, 1, 0, 1,
-0.5861099, -0.3449939, -0.7324268, 0.345098, 1, 0, 1,
-0.5826067, -1.016423, -3.172858, 0.3372549, 1, 0, 1,
-0.5820963, -1.093307, -2.947858, 0.3333333, 1, 0, 1,
-0.5809139, 0.5363341, -0.5832112, 0.3254902, 1, 0, 1,
-0.5803291, -0.3308154, -2.16411, 0.3215686, 1, 0, 1,
-0.5798594, -0.2312111, -1.367412, 0.3137255, 1, 0, 1,
-0.5756367, -0.04638211, -0.8335447, 0.3098039, 1, 0, 1,
-0.5735981, 1.615419, 0.4225828, 0.3019608, 1, 0, 1,
-0.5714049, 0.07902519, -0.377282, 0.2941177, 1, 0, 1,
-0.568032, -1.045239, -2.363264, 0.2901961, 1, 0, 1,
-0.5650361, 0.09947041, 1.048093, 0.282353, 1, 0, 1,
-0.5605236, 1.521288, 0.08363362, 0.2784314, 1, 0, 1,
-0.559428, 0.02723618, -0.938546, 0.2705882, 1, 0, 1,
-0.556655, 1.522863, -2.151695, 0.2666667, 1, 0, 1,
-0.5469677, 0.8912564, 0.6451395, 0.2588235, 1, 0, 1,
-0.5409999, 1.713085, 0.5433048, 0.254902, 1, 0, 1,
-0.5399539, 1.911103, 1.022806, 0.2470588, 1, 0, 1,
-0.5369394, -0.02066044, -1.65791, 0.2431373, 1, 0, 1,
-0.5359747, -0.06597584, -1.489788, 0.2352941, 1, 0, 1,
-0.5346899, -0.8803069, -3.080739, 0.2313726, 1, 0, 1,
-0.5273096, 0.4299564, 0.2973563, 0.2235294, 1, 0, 1,
-0.5247227, 0.4357494, -2.452648, 0.2196078, 1, 0, 1,
-0.5205138, 1.187833, -0.7113559, 0.2117647, 1, 0, 1,
-0.5184543, 0.7830254, -0.3601561, 0.2078431, 1, 0, 1,
-0.5156177, 0.03814702, -2.261044, 0.2, 1, 0, 1,
-0.5148197, -0.367072, -2.495208, 0.1921569, 1, 0, 1,
-0.5143927, 1.029079, -0.5851091, 0.1882353, 1, 0, 1,
-0.510542, -0.1913169, -1.476556, 0.1803922, 1, 0, 1,
-0.5102767, 0.7610071, 2.97269, 0.1764706, 1, 0, 1,
-0.5087145, -0.3662243, -1.872069, 0.1686275, 1, 0, 1,
-0.4972742, -0.2228086, -1.359105, 0.1647059, 1, 0, 1,
-0.4947604, -0.8658094, -1.869071, 0.1568628, 1, 0, 1,
-0.4921188, -1.810989, -0.4466172, 0.1529412, 1, 0, 1,
-0.4878094, 0.01292149, -1.227768, 0.145098, 1, 0, 1,
-0.4810861, -0.3247609, -2.955463, 0.1411765, 1, 0, 1,
-0.4799867, -0.991824, -3.051286, 0.1333333, 1, 0, 1,
-0.4789529, -0.05040327, -2.1384, 0.1294118, 1, 0, 1,
-0.4761893, -1.001181, -2.209846, 0.1215686, 1, 0, 1,
-0.4730918, -0.2715551, -0.1044955, 0.1176471, 1, 0, 1,
-0.4726598, 0.4706247, -1.084567, 0.1098039, 1, 0, 1,
-0.4680656, -1.599245, -3.102431, 0.1058824, 1, 0, 1,
-0.4674026, 0.254518, -2.724123, 0.09803922, 1, 0, 1,
-0.4653817, 0.4569375, -1.119552, 0.09019608, 1, 0, 1,
-0.4651102, 0.3352846, 0.3361441, 0.08627451, 1, 0, 1,
-0.4572252, 0.9544063, -2.075493, 0.07843138, 1, 0, 1,
-0.4508853, 0.08810804, -0.3866481, 0.07450981, 1, 0, 1,
-0.4505428, 0.7447254, -1.467999, 0.06666667, 1, 0, 1,
-0.4498034, -0.6609415, -1.575994, 0.0627451, 1, 0, 1,
-0.449216, -0.3876369, -1.844637, 0.05490196, 1, 0, 1,
-0.4431798, -2.302408, -4.148229, 0.05098039, 1, 0, 1,
-0.4373132, 0.3520649, 0.3191575, 0.04313726, 1, 0, 1,
-0.4366579, -0.2901391, -3.627377, 0.03921569, 1, 0, 1,
-0.4322443, 0.1098599, -1.549443, 0.03137255, 1, 0, 1,
-0.4321564, -1.566169, -3.380561, 0.02745098, 1, 0, 1,
-0.429345, -1.16419, -4.52045, 0.01960784, 1, 0, 1,
-0.4127958, -0.2530545, -1.703273, 0.01568628, 1, 0, 1,
-0.4079338, -0.2773469, 0.06727387, 0.007843138, 1, 0, 1,
-0.4047176, -0.09917739, -2.445658, 0.003921569, 1, 0, 1,
-0.4003564, 1.269317, 0.3553968, 0, 1, 0.003921569, 1,
-0.3981484, -0.2061404, -2.257325, 0, 1, 0.01176471, 1,
-0.3969914, 0.2824838, -0.8072473, 0, 1, 0.01568628, 1,
-0.3933705, 0.3178642, -0.2667571, 0, 1, 0.02352941, 1,
-0.3931837, -0.7768874, -2.311061, 0, 1, 0.02745098, 1,
-0.3924681, -0.112786, -2.439965, 0, 1, 0.03529412, 1,
-0.3879628, 1.312987, 0.08835573, 0, 1, 0.03921569, 1,
-0.3859563, -0.3627771, -2.250558, 0, 1, 0.04705882, 1,
-0.3844232, 1.858596, -0.1635756, 0, 1, 0.05098039, 1,
-0.3831542, -0.3343436, -2.524396, 0, 1, 0.05882353, 1,
-0.3830506, 0.3005309, -0.5993476, 0, 1, 0.0627451, 1,
-0.3829114, 2.238045, 0.0884947, 0, 1, 0.07058824, 1,
-0.3823575, -0.2333813, -1.33353, 0, 1, 0.07450981, 1,
-0.3759364, -0.8724178, -2.641806, 0, 1, 0.08235294, 1,
-0.3729538, 0.982384, -1.921304, 0, 1, 0.08627451, 1,
-0.3725331, -0.6086327, -2.659931, 0, 1, 0.09411765, 1,
-0.3693744, -0.6232662, -3.184873, 0, 1, 0.1019608, 1,
-0.3663369, 1.721627, 0.1423032, 0, 1, 0.1058824, 1,
-0.3663299, 1.821725, 0.4598351, 0, 1, 0.1137255, 1,
-0.3660465, -0.406844, -1.442762, 0, 1, 0.1176471, 1,
-0.3642034, 1.193242, 0.06973176, 0, 1, 0.1254902, 1,
-0.3629983, -0.2696713, -2.028355, 0, 1, 0.1294118, 1,
-0.3623597, 1.863884, -0.964189, 0, 1, 0.1372549, 1,
-0.3603659, -1.474749, -2.068286, 0, 1, 0.1411765, 1,
-0.3589112, -0.6413076, -3.312708, 0, 1, 0.1490196, 1,
-0.3569685, 1.727248, -0.7493503, 0, 1, 0.1529412, 1,
-0.3509331, 0.206162, -0.4854467, 0, 1, 0.1607843, 1,
-0.350529, -0.5448655, -3.192256, 0, 1, 0.1647059, 1,
-0.3383289, 0.1821831, -0.2121663, 0, 1, 0.172549, 1,
-0.3320456, 1.412539, -0.32304, 0, 1, 0.1764706, 1,
-0.3319081, 0.3107216, -1.200475, 0, 1, 0.1843137, 1,
-0.3316072, 0.7899235, 0.4209845, 0, 1, 0.1882353, 1,
-0.3304098, -0.5558453, -3.488635, 0, 1, 0.1960784, 1,
-0.3299242, 0.4247746, 0.5723068, 0, 1, 0.2039216, 1,
-0.3283089, 1.159923, -1.944327, 0, 1, 0.2078431, 1,
-0.3253882, 0.3237062, -0.5629019, 0, 1, 0.2156863, 1,
-0.3252393, 0.06971921, -0.376895, 0, 1, 0.2196078, 1,
-0.324966, 1.485433, -0.2717972, 0, 1, 0.227451, 1,
-0.3194302, -0.5377833, -1.387279, 0, 1, 0.2313726, 1,
-0.3193935, 1.965392, -1.73828, 0, 1, 0.2392157, 1,
-0.3180271, -0.5776761, -2.807173, 0, 1, 0.2431373, 1,
-0.3159845, -0.6014861, -1.974477, 0, 1, 0.2509804, 1,
-0.3152996, -0.5710543, -2.319739, 0, 1, 0.254902, 1,
-0.3143584, -0.1865688, -2.466347, 0, 1, 0.2627451, 1,
-0.3057349, -0.02559742, -2.477823, 0, 1, 0.2666667, 1,
-0.3046985, 0.2402381, -0.2178104, 0, 1, 0.2745098, 1,
-0.3020642, 1.203393, -1.054145, 0, 1, 0.2784314, 1,
-0.2968363, 0.6307194, -0.4181864, 0, 1, 0.2862745, 1,
-0.2948297, -0.9416136, -0.8272322, 0, 1, 0.2901961, 1,
-0.2943854, -1.364418, -2.924739, 0, 1, 0.2980392, 1,
-0.2929804, 0.2351982, -1.262259, 0, 1, 0.3058824, 1,
-0.2927554, -1.221542, -1.297441, 0, 1, 0.3098039, 1,
-0.2909004, -0.2975219, -0.8797228, 0, 1, 0.3176471, 1,
-0.2883459, 0.5276917, -1.79083, 0, 1, 0.3215686, 1,
-0.2854655, 0.1763981, -0.2299927, 0, 1, 0.3294118, 1,
-0.2853227, -1.25915, -3.253347, 0, 1, 0.3333333, 1,
-0.2851484, 0.6593487, 0.5758396, 0, 1, 0.3411765, 1,
-0.2846648, 0.3919015, 0.8507924, 0, 1, 0.345098, 1,
-0.2808113, -2.853966, -2.237244, 0, 1, 0.3529412, 1,
-0.2727604, -1.605011, -2.193024, 0, 1, 0.3568628, 1,
-0.2721776, -0.3806381, -2.750929, 0, 1, 0.3647059, 1,
-0.2687527, -0.2517416, -0.6665272, 0, 1, 0.3686275, 1,
-0.2678201, -0.6514745, -2.107872, 0, 1, 0.3764706, 1,
-0.2639732, -0.3279114, -2.482537, 0, 1, 0.3803922, 1,
-0.2625376, 0.8897047, -1.013753, 0, 1, 0.3882353, 1,
-0.2620378, -0.1776885, -1.984121, 0, 1, 0.3921569, 1,
-0.2596199, 1.131984, 1.445073, 0, 1, 0.4, 1,
-0.2582411, -0.5125111, -2.932128, 0, 1, 0.4078431, 1,
-0.2579644, 0.5137, 0.797385, 0, 1, 0.4117647, 1,
-0.2547194, 0.08978458, -0.3588426, 0, 1, 0.4196078, 1,
-0.254589, -0.9281886, -1.786651, 0, 1, 0.4235294, 1,
-0.254335, 2.041193, 1.644031, 0, 1, 0.4313726, 1,
-0.2542754, -0.1417059, -1.313237, 0, 1, 0.4352941, 1,
-0.2540912, 0.7016571, 0.7377996, 0, 1, 0.4431373, 1,
-0.2516192, 1.612141, 0.6872304, 0, 1, 0.4470588, 1,
-0.2515282, -0.4492565, -3.200361, 0, 1, 0.454902, 1,
-0.2474358, -0.05529008, -2.022937, 0, 1, 0.4588235, 1,
-0.2411397, -0.1196148, -2.321659, 0, 1, 0.4666667, 1,
-0.2367256, -0.4906858, -2.241079, 0, 1, 0.4705882, 1,
-0.2354251, -1.5584, -4.714543, 0, 1, 0.4784314, 1,
-0.2336234, -0.1649415, -1.549518, 0, 1, 0.4823529, 1,
-0.2327884, -0.382875, -2.293692, 0, 1, 0.4901961, 1,
-0.2261194, -1.265273, -3.941195, 0, 1, 0.4941176, 1,
-0.2234501, -0.5911877, -3.128433, 0, 1, 0.5019608, 1,
-0.2226123, -0.6936079, -3.118846, 0, 1, 0.509804, 1,
-0.2199901, 0.7454031, -0.08729246, 0, 1, 0.5137255, 1,
-0.2192361, -0.2252676, -2.20931, 0, 1, 0.5215687, 1,
-0.2187736, 1.924293, 0.3026514, 0, 1, 0.5254902, 1,
-0.2168254, -0.7692855, -1.590925, 0, 1, 0.5333334, 1,
-0.2154822, -0.9661719, -4.062498, 0, 1, 0.5372549, 1,
-0.2139462, 1.424148, -0.001602201, 0, 1, 0.5450981, 1,
-0.2134954, -1.013391, -2.849975, 0, 1, 0.5490196, 1,
-0.2116996, -1.157753, -2.938624, 0, 1, 0.5568628, 1,
-0.2029277, -0.5379011, -1.567274, 0, 1, 0.5607843, 1,
-0.2028939, 1.283241, 0.1172953, 0, 1, 0.5686275, 1,
-0.199646, 1.384625, 0.1214148, 0, 1, 0.572549, 1,
-0.198378, -1.665532, -2.272399, 0, 1, 0.5803922, 1,
-0.197945, 0.3941653, -1.553229, 0, 1, 0.5843138, 1,
-0.1973287, 2.189449, 0.4482334, 0, 1, 0.5921569, 1,
-0.1951948, 1.297016, 0.2242777, 0, 1, 0.5960785, 1,
-0.1944148, 1.144568, -1.042256, 0, 1, 0.6039216, 1,
-0.1899289, 1.63236, 1.243171, 0, 1, 0.6117647, 1,
-0.18971, -1.156484, -1.481897, 0, 1, 0.6156863, 1,
-0.1877183, -0.6567489, -2.837658, 0, 1, 0.6235294, 1,
-0.1863827, -0.2282747, -2.109483, 0, 1, 0.627451, 1,
-0.1860758, -0.2123974, -1.782372, 0, 1, 0.6352941, 1,
-0.1843573, -0.7250145, -3.520202, 0, 1, 0.6392157, 1,
-0.1827549, -1.453165, -2.133105, 0, 1, 0.6470588, 1,
-0.1799065, 0.1208482, -1.130544, 0, 1, 0.6509804, 1,
-0.1784807, -0.9419284, -2.053646, 0, 1, 0.6588235, 1,
-0.1762454, -1.29903, -4.100492, 0, 1, 0.6627451, 1,
-0.1743556, -1.202659, -2.631254, 0, 1, 0.6705883, 1,
-0.1715018, -0.2506716, -2.641219, 0, 1, 0.6745098, 1,
-0.1714684, 1.051526, -0.8937928, 0, 1, 0.682353, 1,
-0.1664271, -0.1073723, -1.53172, 0, 1, 0.6862745, 1,
-0.1653298, 0.04560819, -3.116659, 0, 1, 0.6941177, 1,
-0.1630344, 0.4995553, -1.113018, 0, 1, 0.7019608, 1,
-0.1613121, 0.04141751, -0.1135111, 0, 1, 0.7058824, 1,
-0.1547666, -0.6115935, -3.13684, 0, 1, 0.7137255, 1,
-0.1526819, -0.4725613, -2.543921, 0, 1, 0.7176471, 1,
-0.1469103, -0.2567125, -3.437989, 0, 1, 0.7254902, 1,
-0.1458601, -0.4517214, -3.274682, 0, 1, 0.7294118, 1,
-0.1410645, -0.2466924, -2.503113, 0, 1, 0.7372549, 1,
-0.1394897, -1.19117, -3.323844, 0, 1, 0.7411765, 1,
-0.1387517, -1.540383, -2.944661, 0, 1, 0.7490196, 1,
-0.1357235, -1.444016, -2.146143, 0, 1, 0.7529412, 1,
-0.1354141, 1.683361, 2.310667, 0, 1, 0.7607843, 1,
-0.1265739, -1.987727, -2.753345, 0, 1, 0.7647059, 1,
-0.1261431, 0.1347364, -0.4832886, 0, 1, 0.772549, 1,
-0.1248435, -0.3838891, -4.314914, 0, 1, 0.7764706, 1,
-0.1248226, -0.9815689, -2.277867, 0, 1, 0.7843137, 1,
-0.1231779, -1.546816, -4.747587, 0, 1, 0.7882353, 1,
-0.1208768, 0.8530309, -1.526071, 0, 1, 0.7960784, 1,
-0.1153979, -0.1469851, -3.26208, 0, 1, 0.8039216, 1,
-0.1142538, 0.5263386, 0.5507598, 0, 1, 0.8078431, 1,
-0.1131814, 1.987336, 0.7184201, 0, 1, 0.8156863, 1,
-0.09533294, 0.2260836, -0.8469982, 0, 1, 0.8196079, 1,
-0.09523156, -0.7519234, -1.550532, 0, 1, 0.827451, 1,
-0.09220631, -0.7187997, -1.938218, 0, 1, 0.8313726, 1,
-0.09139603, -0.2317749, -2.731447, 0, 1, 0.8392157, 1,
-0.08725912, -0.1992696, -3.638074, 0, 1, 0.8431373, 1,
-0.08657163, 0.4684067, 0.1235472, 0, 1, 0.8509804, 1,
-0.08408991, 0.9712957, -0.6930889, 0, 1, 0.854902, 1,
-0.08209726, 0.5770734, -0.467571, 0, 1, 0.8627451, 1,
-0.0816168, 0.1925111, -0.4600072, 0, 1, 0.8666667, 1,
-0.07671661, 0.1786832, -0.4455492, 0, 1, 0.8745098, 1,
-0.07303386, -1.672052, -2.966687, 0, 1, 0.8784314, 1,
-0.06809337, 0.01959245, -0.5875522, 0, 1, 0.8862745, 1,
-0.06751045, -2.264036, -2.91348, 0, 1, 0.8901961, 1,
-0.06724947, 1.052705, 0.2151093, 0, 1, 0.8980392, 1,
-0.05255366, -1.422419, -2.273195, 0, 1, 0.9058824, 1,
-0.05140216, 0.2432306, -1.512242, 0, 1, 0.9098039, 1,
-0.04907617, 0.8617779, 0.3329019, 0, 1, 0.9176471, 1,
-0.04853024, 1.363138, 0.1117888, 0, 1, 0.9215686, 1,
-0.04215449, -1.735336, -2.302126, 0, 1, 0.9294118, 1,
-0.0384153, 1.095123, -1.138411, 0, 1, 0.9333333, 1,
-0.03818472, 0.8427942, 1.770484, 0, 1, 0.9411765, 1,
-0.027983, -0.5719451, -3.729517, 0, 1, 0.945098, 1,
-0.02760968, -1.334165, -3.461931, 0, 1, 0.9529412, 1,
-0.02622176, 0.1685011, -1.30514, 0, 1, 0.9568627, 1,
-0.02560047, 0.2535256, 1.162847, 0, 1, 0.9647059, 1,
-0.02243328, 1.399399, -0.8424886, 0, 1, 0.9686275, 1,
-0.0220471, -0.3187799, -1.76357, 0, 1, 0.9764706, 1,
-0.02055723, 0.1921466, -1.595918, 0, 1, 0.9803922, 1,
-0.01922103, 1.324131, 1.805876, 0, 1, 0.9882353, 1,
-0.01780044, -2.05187, -1.803154, 0, 1, 0.9921569, 1,
-0.01668186, -1.036818, -2.372804, 0, 1, 1, 1,
-0.0159636, 0.211513, -1.293251, 0, 0.9921569, 1, 1,
-0.01254122, -0.2372776, -2.678016, 0, 0.9882353, 1, 1,
-0.01175381, -0.7791088, -5.282356, 0, 0.9803922, 1, 1,
-0.007765851, -0.8695628, -2.954184, 0, 0.9764706, 1, 1,
-0.005235254, 1.106761, -0.7682388, 0, 0.9686275, 1, 1,
-0.004029348, 0.01343634, -1.240489, 0, 0.9647059, 1, 1,
0.0007374599, -0.03698084, 4.004309, 0, 0.9568627, 1, 1,
0.001125983, 0.7137251, -0.8895258, 0, 0.9529412, 1, 1,
0.004450837, 0.6565069, 1.181677, 0, 0.945098, 1, 1,
0.005003647, 1.071634, 0.4594323, 0, 0.9411765, 1, 1,
0.007947206, -1.064817, 2.394707, 0, 0.9333333, 1, 1,
0.01003328, -0.02043623, 3.250895, 0, 0.9294118, 1, 1,
0.0113977, -0.2939842, 2.747522, 0, 0.9215686, 1, 1,
0.02826903, -1.12827, 2.465587, 0, 0.9176471, 1, 1,
0.02878514, -1.692697, 3.01482, 0, 0.9098039, 1, 1,
0.03068193, 0.06643622, -1.584059, 0, 0.9058824, 1, 1,
0.03353244, -0.2404984, 4.060513, 0, 0.8980392, 1, 1,
0.03453578, -0.1238043, 3.27456, 0, 0.8901961, 1, 1,
0.03772553, -0.1507092, 4.060469, 0, 0.8862745, 1, 1,
0.04083316, -1.003567, 3.577111, 0, 0.8784314, 1, 1,
0.04981251, -1.58576, 2.891931, 0, 0.8745098, 1, 1,
0.05186086, -0.4545576, 0.3504019, 0, 0.8666667, 1, 1,
0.05221144, -0.310152, 3.714626, 0, 0.8627451, 1, 1,
0.05229908, -0.3478073, 3.381633, 0, 0.854902, 1, 1,
0.05294487, 1.390867, -1.213495, 0, 0.8509804, 1, 1,
0.05847883, -0.1047144, 2.014498, 0, 0.8431373, 1, 1,
0.05903694, 0.3543416, 0.9451104, 0, 0.8392157, 1, 1,
0.06260788, -1.169254, 2.792894, 0, 0.8313726, 1, 1,
0.06331751, 1.495768, -0.8209933, 0, 0.827451, 1, 1,
0.0638478, -1.543756, 2.92956, 0, 0.8196079, 1, 1,
0.06445516, 0.6025534, 0.3325319, 0, 0.8156863, 1, 1,
0.06492292, -1.055214, 2.245465, 0, 0.8078431, 1, 1,
0.06643295, 1.132677, 1.247229, 0, 0.8039216, 1, 1,
0.06653994, -0.3388738, 1.778856, 0, 0.7960784, 1, 1,
0.07079747, 0.5436904, -2.614587, 0, 0.7882353, 1, 1,
0.07413819, -1.107163, 2.987964, 0, 0.7843137, 1, 1,
0.0749685, -0.8282459, 3.202414, 0, 0.7764706, 1, 1,
0.07537279, -1.267438, 1.062914, 0, 0.772549, 1, 1,
0.07540591, 0.388635, 0.4253381, 0, 0.7647059, 1, 1,
0.07943961, -1.448515, 4.177964, 0, 0.7607843, 1, 1,
0.08019157, -1.611845, 2.905458, 0, 0.7529412, 1, 1,
0.08242879, 1.718902, 1.189898, 0, 0.7490196, 1, 1,
0.08495852, 0.8506821, 1.371557, 0, 0.7411765, 1, 1,
0.08512896, -1.023942, 1.813669, 0, 0.7372549, 1, 1,
0.08787684, -0.6303979, 3.23209, 0, 0.7294118, 1, 1,
0.09269732, -0.5567673, 1.272651, 0, 0.7254902, 1, 1,
0.09530468, 0.5333787, 0.8961173, 0, 0.7176471, 1, 1,
0.09716239, -1.151873, 1.621876, 0, 0.7137255, 1, 1,
0.09921879, -0.04862199, 0.5716633, 0, 0.7058824, 1, 1,
0.09994527, -0.5098657, 1.342549, 0, 0.6980392, 1, 1,
0.1100645, -1.583652, 2.737557, 0, 0.6941177, 1, 1,
0.1108972, 1.466954, -2.683712, 0, 0.6862745, 1, 1,
0.1146267, -2.145408, 3.905463, 0, 0.682353, 1, 1,
0.1163786, 1.046963, -0.2226655, 0, 0.6745098, 1, 1,
0.1170465, 0.8864593, -1.196554, 0, 0.6705883, 1, 1,
0.1183588, -1.014317, 4.805738, 0, 0.6627451, 1, 1,
0.1206869, 0.3276921, 0.5175266, 0, 0.6588235, 1, 1,
0.1220642, -1.526152, 4.567445, 0, 0.6509804, 1, 1,
0.1224128, 1.11475, -1.645403, 0, 0.6470588, 1, 1,
0.1235221, -0.09412558, 1.263959, 0, 0.6392157, 1, 1,
0.1252241, 0.7916488, 1.435228, 0, 0.6352941, 1, 1,
0.1316857, 1.150159, 1.059539, 0, 0.627451, 1, 1,
0.1331385, -0.1066238, 3.593128, 0, 0.6235294, 1, 1,
0.1460462, 0.8531901, -0.2468915, 0, 0.6156863, 1, 1,
0.1492922, -1.027504, 1.425888, 0, 0.6117647, 1, 1,
0.1548799, 1.293344, -0.7646881, 0, 0.6039216, 1, 1,
0.1579133, -0.680533, 2.968772, 0, 0.5960785, 1, 1,
0.1588956, -0.2193713, 2.448855, 0, 0.5921569, 1, 1,
0.1619383, -1.442867, 2.224477, 0, 0.5843138, 1, 1,
0.1654579, 0.5683887, -0.7819763, 0, 0.5803922, 1, 1,
0.1667161, -0.814056, 1.522277, 0, 0.572549, 1, 1,
0.1674706, 0.1422691, 2.656429, 0, 0.5686275, 1, 1,
0.1714585, -1.96946, 4.466679, 0, 0.5607843, 1, 1,
0.1737562, 0.06644051, 2.738792, 0, 0.5568628, 1, 1,
0.1813004, -0.153841, 1.557916, 0, 0.5490196, 1, 1,
0.1813589, 0.4809196, -1.065922, 0, 0.5450981, 1, 1,
0.1866232, 1.642469, -0.9837948, 0, 0.5372549, 1, 1,
0.1879328, -0.2259376, 2.848337, 0, 0.5333334, 1, 1,
0.1895348, -3.095797, 4.071303, 0, 0.5254902, 1, 1,
0.191951, 0.7980448, -0.529794, 0, 0.5215687, 1, 1,
0.2033381, -1.084536, 3.3146, 0, 0.5137255, 1, 1,
0.2035739, 0.9427624, -0.5476411, 0, 0.509804, 1, 1,
0.2070866, 1.183807, 1.935305, 0, 0.5019608, 1, 1,
0.2076513, -1.783891, 2.736104, 0, 0.4941176, 1, 1,
0.2089135, -1.134782, 2.834852, 0, 0.4901961, 1, 1,
0.2099099, -0.7718977, 2.742642, 0, 0.4823529, 1, 1,
0.2116856, 0.3694796, 0.4288696, 0, 0.4784314, 1, 1,
0.2216417, -1.113084, 4.064952, 0, 0.4705882, 1, 1,
0.2233056, -0.445173, 2.318958, 0, 0.4666667, 1, 1,
0.2238916, 2.632282, 0.7701374, 0, 0.4588235, 1, 1,
0.2242681, -0.3534742, 3.697331, 0, 0.454902, 1, 1,
0.2254667, -0.3355191, 2.083381, 0, 0.4470588, 1, 1,
0.2259744, 0.3028983, 0.2470372, 0, 0.4431373, 1, 1,
0.2263513, 0.01176996, -0.376225, 0, 0.4352941, 1, 1,
0.2288982, -1.261375, 1.773579, 0, 0.4313726, 1, 1,
0.2376371, 1.857032, 1.752773, 0, 0.4235294, 1, 1,
0.2454377, -0.2293622, 2.485141, 0, 0.4196078, 1, 1,
0.2482374, 1.631074, 0.1185544, 0, 0.4117647, 1, 1,
0.2482618, -0.9367472, 5.18317, 0, 0.4078431, 1, 1,
0.2488146, 0.6610585, -0.6019463, 0, 0.4, 1, 1,
0.2520844, 0.1126658, 1.580791, 0, 0.3921569, 1, 1,
0.2539584, 0.08681314, 2.142849, 0, 0.3882353, 1, 1,
0.2554562, 1.171083, 0.7248836, 0, 0.3803922, 1, 1,
0.259178, 1.907114, -1.554226, 0, 0.3764706, 1, 1,
0.264468, 1.11445, -0.8050618, 0, 0.3686275, 1, 1,
0.2680726, -0.004916193, 2.051609, 0, 0.3647059, 1, 1,
0.269922, -0.007149163, 2.040173, 0, 0.3568628, 1, 1,
0.2758459, 1.482082, 1.920112, 0, 0.3529412, 1, 1,
0.2785697, 1.644586, 2.220556, 0, 0.345098, 1, 1,
0.279054, 0.9032118, 1.713873, 0, 0.3411765, 1, 1,
0.2846417, -0.665324, 4.273856, 0, 0.3333333, 1, 1,
0.284924, -0.9494716, 2.476209, 0, 0.3294118, 1, 1,
0.2880698, 2.073158, -0.8328372, 0, 0.3215686, 1, 1,
0.2881743, 0.7363086, -0.4719785, 0, 0.3176471, 1, 1,
0.2892976, 0.2400711, 1.50797, 0, 0.3098039, 1, 1,
0.2901083, 1.059089, 1.130365, 0, 0.3058824, 1, 1,
0.2902225, -1.219061, 3.556491, 0, 0.2980392, 1, 1,
0.2933284, -0.2921545, 3.00538, 0, 0.2901961, 1, 1,
0.2960123, -2.319731, 3.589438, 0, 0.2862745, 1, 1,
0.2972928, -0.5410976, 3.820939, 0, 0.2784314, 1, 1,
0.2985294, 0.4000388, 1.293629, 0, 0.2745098, 1, 1,
0.2997704, 0.04056422, 1.03235, 0, 0.2666667, 1, 1,
0.3012186, -1.960828, 1.484453, 0, 0.2627451, 1, 1,
0.3016519, -1.045063, 3.064842, 0, 0.254902, 1, 1,
0.3039552, 0.4254816, 0.3479111, 0, 0.2509804, 1, 1,
0.3064409, -0.8822515, 3.271387, 0, 0.2431373, 1, 1,
0.3112966, -0.1011562, 1.23767, 0, 0.2392157, 1, 1,
0.3153995, -0.8718696, 1.479915, 0, 0.2313726, 1, 1,
0.316949, -2.136523, 4.688979, 0, 0.227451, 1, 1,
0.3174382, 1.646932, -0.4390466, 0, 0.2196078, 1, 1,
0.3255749, 1.006924, -0.4448676, 0, 0.2156863, 1, 1,
0.3257758, 1.30393, 0.5564623, 0, 0.2078431, 1, 1,
0.3284585, 0.1014756, 0.1290694, 0, 0.2039216, 1, 1,
0.3310022, -0.05892556, 2.494423, 0, 0.1960784, 1, 1,
0.3341219, -0.4878736, 1.246799, 0, 0.1882353, 1, 1,
0.3346353, 0.9448159, 0.7070149, 0, 0.1843137, 1, 1,
0.3349679, -0.6230426, 2.730344, 0, 0.1764706, 1, 1,
0.3358101, -0.8215685, 1.838315, 0, 0.172549, 1, 1,
0.3367614, -1.569298, 1.962115, 0, 0.1647059, 1, 1,
0.3391749, -0.8918261, 0.9535603, 0, 0.1607843, 1, 1,
0.3392644, -1.179588, 2.276419, 0, 0.1529412, 1, 1,
0.3407573, -0.2779157, 1.66728, 0, 0.1490196, 1, 1,
0.3488623, 1.474936, 2.56998, 0, 0.1411765, 1, 1,
0.3516482, -0.4379148, 2.448716, 0, 0.1372549, 1, 1,
0.3530016, -0.9572975, 2.688467, 0, 0.1294118, 1, 1,
0.3671434, 0.1565509, 1.87845, 0, 0.1254902, 1, 1,
0.369983, -0.1112867, 2.260798, 0, 0.1176471, 1, 1,
0.3775273, 0.4978543, 1.358865, 0, 0.1137255, 1, 1,
0.3814428, 0.6179023, 0.6396834, 0, 0.1058824, 1, 1,
0.3835592, -0.5113487, 2.189718, 0, 0.09803922, 1, 1,
0.3858038, -0.0703795, 3.091972, 0, 0.09411765, 1, 1,
0.386839, 1.768952, -1.389054, 0, 0.08627451, 1, 1,
0.3896795, 1.13364, 1.217763, 0, 0.08235294, 1, 1,
0.3944863, -0.2047681, 1.939115, 0, 0.07450981, 1, 1,
0.3949759, -0.6647521, 1.482339, 0, 0.07058824, 1, 1,
0.3971851, -0.3051642, 2.611649, 0, 0.0627451, 1, 1,
0.3997887, 0.1118541, 2.52755, 0, 0.05882353, 1, 1,
0.3999325, -1.380684, 2.895415, 0, 0.05098039, 1, 1,
0.4012053, 0.8085768, 0.5856271, 0, 0.04705882, 1, 1,
0.4026311, -0.2211089, 1.342304, 0, 0.03921569, 1, 1,
0.4067681, 2.436212, -0.6404151, 0, 0.03529412, 1, 1,
0.4071026, 0.01162793, 2.265201, 0, 0.02745098, 1, 1,
0.4130228, 0.6261047, 1.535484, 0, 0.02352941, 1, 1,
0.4143263, 0.4070817, 1.501599, 0, 0.01568628, 1, 1,
0.4146034, -0.4550387, 1.468722, 0, 0.01176471, 1, 1,
0.4161716, -0.469502, 2.059982, 0, 0.003921569, 1, 1,
0.4211821, -1.447239, 1.736645, 0.003921569, 0, 1, 1,
0.4227291, -0.672345, 2.329419, 0.007843138, 0, 1, 1,
0.4268963, -0.6473715, 3.339228, 0.01568628, 0, 1, 1,
0.4279776, -0.1580526, 3.681984, 0.01960784, 0, 1, 1,
0.4289379, 1.847357, 0.5932429, 0.02745098, 0, 1, 1,
0.4314758, -0.4786167, 2.826716, 0.03137255, 0, 1, 1,
0.4315344, -0.6875675, 3.075729, 0.03921569, 0, 1, 1,
0.4321212, 0.9108859, -1.208186, 0.04313726, 0, 1, 1,
0.4331969, -0.3436224, 3.277411, 0.05098039, 0, 1, 1,
0.4355101, -0.08293953, 2.942707, 0.05490196, 0, 1, 1,
0.438995, 0.08332047, 1.545787, 0.0627451, 0, 1, 1,
0.4408205, 0.6627676, 3.137879, 0.06666667, 0, 1, 1,
0.4452279, 0.1088245, 3.003256, 0.07450981, 0, 1, 1,
0.4475304, -0.4313258, 3.013457, 0.07843138, 0, 1, 1,
0.4494316, -0.08185538, 1.581368, 0.08627451, 0, 1, 1,
0.4536229, 1.358731, -0.6232014, 0.09019608, 0, 1, 1,
0.4556738, 0.9769539, -0.03904591, 0.09803922, 0, 1, 1,
0.4561292, 1.784023, -1.611182, 0.1058824, 0, 1, 1,
0.4651396, -0.8153268, 3.606974, 0.1098039, 0, 1, 1,
0.4681474, 0.8711769, 1.521451, 0.1176471, 0, 1, 1,
0.471783, 1.225368, 0.4746468, 0.1215686, 0, 1, 1,
0.4731942, 1.572814, 1.614576, 0.1294118, 0, 1, 1,
0.4876231, -0.8059134, 1.708537, 0.1333333, 0, 1, 1,
0.488367, -0.6327699, 3.540372, 0.1411765, 0, 1, 1,
0.4936499, -1.899337, 2.243507, 0.145098, 0, 1, 1,
0.4995418, 1.779405, 1.26744, 0.1529412, 0, 1, 1,
0.5013844, 0.4179549, -0.05692961, 0.1568628, 0, 1, 1,
0.5051969, 1.507091, -1.668268, 0.1647059, 0, 1, 1,
0.50814, 0.07078981, -1.264763, 0.1686275, 0, 1, 1,
0.5103399, -0.2131014, 3.127576, 0.1764706, 0, 1, 1,
0.5118564, -0.405889, 2.305358, 0.1803922, 0, 1, 1,
0.5158639, 1.720986, 1.762013, 0.1882353, 0, 1, 1,
0.5161582, -0.8318008, 2.59549, 0.1921569, 0, 1, 1,
0.5181628, -1.182541, 2.144711, 0.2, 0, 1, 1,
0.5297575, 1.075035, 0.7379254, 0.2078431, 0, 1, 1,
0.5318245, 0.5953419, 1.030071, 0.2117647, 0, 1, 1,
0.5368572, -0.3499283, 2.074601, 0.2196078, 0, 1, 1,
0.5368757, 1.851235, -0.1941773, 0.2235294, 0, 1, 1,
0.5375192, 1.264373, 1.554574, 0.2313726, 0, 1, 1,
0.5400566, -1.222561, 1.589223, 0.2352941, 0, 1, 1,
0.5401677, 1.190716, 0.975588, 0.2431373, 0, 1, 1,
0.5419089, -0.9313711, 2.528982, 0.2470588, 0, 1, 1,
0.5488464, 0.3256911, 0.9875237, 0.254902, 0, 1, 1,
0.5510497, 0.6403324, 0.462718, 0.2588235, 0, 1, 1,
0.5594022, -0.7739331, 1.370342, 0.2666667, 0, 1, 1,
0.560349, -1.08597, 2.523234, 0.2705882, 0, 1, 1,
0.5630785, -1.588514, 5.72793, 0.2784314, 0, 1, 1,
0.5673674, 0.3073259, 2.145873, 0.282353, 0, 1, 1,
0.5771316, 0.1114671, 2.347289, 0.2901961, 0, 1, 1,
0.5786863, -0.2658482, 3.437717, 0.2941177, 0, 1, 1,
0.59103, -0.5484678, 2.628329, 0.3019608, 0, 1, 1,
0.5956203, 1.085954, -0.1982399, 0.3098039, 0, 1, 1,
0.5972844, -0.9353477, 4.062603, 0.3137255, 0, 1, 1,
0.6001449, -0.2717824, 2.903317, 0.3215686, 0, 1, 1,
0.6011079, -0.181785, 1.046161, 0.3254902, 0, 1, 1,
0.6013186, -2.12178, 5.263975, 0.3333333, 0, 1, 1,
0.601399, 0.04794122, 1.091006, 0.3372549, 0, 1, 1,
0.6037623, -0.03573775, 1.517345, 0.345098, 0, 1, 1,
0.6101999, -0.03888088, 2.955976, 0.3490196, 0, 1, 1,
0.6105851, -0.1610257, 2.809782, 0.3568628, 0, 1, 1,
0.6115425, 0.1315109, 0.9503383, 0.3607843, 0, 1, 1,
0.6131692, -2.608541, 3.245942, 0.3686275, 0, 1, 1,
0.6139521, -1.670669, 2.905642, 0.372549, 0, 1, 1,
0.6196386, -0.891494, 1.487584, 0.3803922, 0, 1, 1,
0.6210189, -2.130594, 0.5791769, 0.3843137, 0, 1, 1,
0.6225362, 1.124353, 0.1757854, 0.3921569, 0, 1, 1,
0.6227952, 2.539204, 0.04621781, 0.3960784, 0, 1, 1,
0.6247958, -1.085169, 2.070724, 0.4039216, 0, 1, 1,
0.630421, -0.9814346, 2.476329, 0.4117647, 0, 1, 1,
0.63382, 0.3081381, 0.9562863, 0.4156863, 0, 1, 1,
0.6353011, -2.127981, 1.675111, 0.4235294, 0, 1, 1,
0.636082, 0.05200536, 2.245276, 0.427451, 0, 1, 1,
0.6367518, 1.1911, 2.059875, 0.4352941, 0, 1, 1,
0.6384859, -1.275133, 2.172373, 0.4392157, 0, 1, 1,
0.6405184, -0.3407143, 1.209777, 0.4470588, 0, 1, 1,
0.64177, -0.164196, 2.16098, 0.4509804, 0, 1, 1,
0.6454292, 0.3030837, 2.388613, 0.4588235, 0, 1, 1,
0.6482064, 0.78083, 3.192129, 0.4627451, 0, 1, 1,
0.6492808, 0.7623045, 2.483347, 0.4705882, 0, 1, 1,
0.6502666, -0.4369448, 2.508992, 0.4745098, 0, 1, 1,
0.6502947, 0.2189216, -0.2915487, 0.4823529, 0, 1, 1,
0.6519669, -0.5157616, 3.643053, 0.4862745, 0, 1, 1,
0.6542951, 2.783206, -0.3351073, 0.4941176, 0, 1, 1,
0.6600696, 0.13783, 1.236078, 0.5019608, 0, 1, 1,
0.6609023, -0.1783124, 1.480051, 0.5058824, 0, 1, 1,
0.6612481, 0.2484967, 2.734282, 0.5137255, 0, 1, 1,
0.6639098, 0.6634821, 0.6431623, 0.5176471, 0, 1, 1,
0.665037, -0.05665865, 3.110073, 0.5254902, 0, 1, 1,
0.6659307, 0.06620573, 0.4711481, 0.5294118, 0, 1, 1,
0.6662431, -0.4792278, 4.284041, 0.5372549, 0, 1, 1,
0.6701182, 0.5955452, -0.1454766, 0.5411765, 0, 1, 1,
0.6710058, -1.811977, 1.685042, 0.5490196, 0, 1, 1,
0.6717535, -0.7259536, 2.147665, 0.5529412, 0, 1, 1,
0.6722642, 1.599483, 0.1070165, 0.5607843, 0, 1, 1,
0.6744044, 0.7201656, -5.79301e-05, 0.5647059, 0, 1, 1,
0.6784351, 1.051977, 1.504423, 0.572549, 0, 1, 1,
0.6817433, 0.8529143, 1.82012, 0.5764706, 0, 1, 1,
0.6872746, 1.588746, 0.4331279, 0.5843138, 0, 1, 1,
0.6875573, -1.925179, 2.863414, 0.5882353, 0, 1, 1,
0.6916956, -0.1978048, 1.896204, 0.5960785, 0, 1, 1,
0.6919997, 1.32618, 0.6471574, 0.6039216, 0, 1, 1,
0.6920607, 0.6537529, 0.2036779, 0.6078432, 0, 1, 1,
0.6948832, -0.5092173, 3.197807, 0.6156863, 0, 1, 1,
0.7031431, 0.5981221, 1.0744, 0.6196079, 0, 1, 1,
0.7078742, -0.09047711, 2.236403, 0.627451, 0, 1, 1,
0.7085727, 1.052403, 1.976887, 0.6313726, 0, 1, 1,
0.7094195, -0.8945241, 1.580266, 0.6392157, 0, 1, 1,
0.7099132, 1.874263, 1.71556, 0.6431373, 0, 1, 1,
0.7142105, 2.026174, 1.120684, 0.6509804, 0, 1, 1,
0.717697, 1.152235, 0.8633097, 0.654902, 0, 1, 1,
0.721212, 2.006056, 0.1979471, 0.6627451, 0, 1, 1,
0.725968, 0.6152331, 1.881835, 0.6666667, 0, 1, 1,
0.7282184, 0.01343397, 2.080736, 0.6745098, 0, 1, 1,
0.7342597, -0.04071876, 1.287871, 0.6784314, 0, 1, 1,
0.7347841, 0.8941528, 0.07315072, 0.6862745, 0, 1, 1,
0.739576, 0.9653019, -1.033266, 0.6901961, 0, 1, 1,
0.7406992, -0.3024644, 1.925202, 0.6980392, 0, 1, 1,
0.75022, -0.6077406, 2.212329, 0.7058824, 0, 1, 1,
0.7535723, -0.6201726, 1.1627, 0.7098039, 0, 1, 1,
0.7541497, -0.1713144, 2.628008, 0.7176471, 0, 1, 1,
0.7554561, 1.922962, 3.284048, 0.7215686, 0, 1, 1,
0.7610709, -1.126524, 2.902707, 0.7294118, 0, 1, 1,
0.7626147, -1.037168, 3.257137, 0.7333333, 0, 1, 1,
0.7812423, -0.83085, 1.830987, 0.7411765, 0, 1, 1,
0.7847878, -0.5255739, 2.877475, 0.7450981, 0, 1, 1,
0.787318, -0.7101995, 3.319349, 0.7529412, 0, 1, 1,
0.7886077, 1.714105, -0.4323947, 0.7568628, 0, 1, 1,
0.7903429, 0.5224895, 0.4577519, 0.7647059, 0, 1, 1,
0.7911368, 0.4043444, 1.615883, 0.7686275, 0, 1, 1,
0.7990224, -0.2876019, 0.7648625, 0.7764706, 0, 1, 1,
0.8099496, -0.6895142, 3.21125, 0.7803922, 0, 1, 1,
0.817228, -0.01285779, 2.06601, 0.7882353, 0, 1, 1,
0.8218642, -0.2053542, 1.165541, 0.7921569, 0, 1, 1,
0.8298728, -0.6101509, 1.422902, 0.8, 0, 1, 1,
0.8314028, 0.1060093, 2.361175, 0.8078431, 0, 1, 1,
0.8326988, -0.2126258, 3.216079, 0.8117647, 0, 1, 1,
0.8447077, -0.0918595, 1.996962, 0.8196079, 0, 1, 1,
0.8457559, 0.9900968, 0.7968297, 0.8235294, 0, 1, 1,
0.8483092, 1.629441, -0.4716961, 0.8313726, 0, 1, 1,
0.8493678, -0.7466531, 0.9057109, 0.8352941, 0, 1, 1,
0.8510301, 1.557565, -1.709152, 0.8431373, 0, 1, 1,
0.8582391, 1.976315, -0.4833887, 0.8470588, 0, 1, 1,
0.8674746, -1.567072, 1.695957, 0.854902, 0, 1, 1,
0.8691395, 0.1167088, 1.066123, 0.8588235, 0, 1, 1,
0.8702524, -0.4384577, 2.965781, 0.8666667, 0, 1, 1,
0.8736059, 1.586366, 1.490653, 0.8705882, 0, 1, 1,
0.8842006, 1.96035, 1.574643, 0.8784314, 0, 1, 1,
0.890495, -0.2451913, 1.916453, 0.8823529, 0, 1, 1,
0.8910555, -1.82057, 3.20743, 0.8901961, 0, 1, 1,
0.891552, 0.5891926, 0.4264522, 0.8941177, 0, 1, 1,
0.892064, 0.8543755, 0.03254745, 0.9019608, 0, 1, 1,
0.895719, 0.6209821, -1.217715, 0.9098039, 0, 1, 1,
0.8977648, -0.2301852, 1.471009, 0.9137255, 0, 1, 1,
0.8989538, 0.5400464, 1.220017, 0.9215686, 0, 1, 1,
0.903378, 0.3136842, 3.636742, 0.9254902, 0, 1, 1,
0.9095863, 0.2561663, 1.246548, 0.9333333, 0, 1, 1,
0.9132308, -2.409375, 2.779068, 0.9372549, 0, 1, 1,
0.914361, 2.007482, -0.7772085, 0.945098, 0, 1, 1,
0.9262745, 1.052839, 0.7660153, 0.9490196, 0, 1, 1,
0.9269489, 0.3974237, 1.132972, 0.9568627, 0, 1, 1,
0.9294873, 0.3455411, 2.193868, 0.9607843, 0, 1, 1,
0.9340333, 0.2578821, 2.542951, 0.9686275, 0, 1, 1,
0.9365548, -0.6498324, 3.471265, 0.972549, 0, 1, 1,
0.9491245, 0.1900085, 1.637199, 0.9803922, 0, 1, 1,
0.94915, 0.00392198, 2.105285, 0.9843137, 0, 1, 1,
0.9525574, 1.108283, -0.8924437, 0.9921569, 0, 1, 1,
0.9529082, 1.266116, -0.5488035, 0.9960784, 0, 1, 1,
0.9561062, 1.350537, -0.2969148, 1, 0, 0.9960784, 1,
0.9701142, -2.042678, 1.422667, 1, 0, 0.9882353, 1,
0.9721397, 0.3253637, 2.543881, 1, 0, 0.9843137, 1,
0.9758478, 0.6496136, 2.535527, 1, 0, 0.9764706, 1,
0.991299, 2.330851, 0.8315472, 1, 0, 0.972549, 1,
0.9918034, 0.6070383, 0.6291599, 1, 0, 0.9647059, 1,
0.9933825, -0.2439764, 2.219226, 1, 0, 0.9607843, 1,
1.003596, -0.2328134, 2.55187, 1, 0, 0.9529412, 1,
1.010481, 1.438606, 0.2006284, 1, 0, 0.9490196, 1,
1.019913, 0.007250736, 0.9051868, 1, 0, 0.9411765, 1,
1.02578, 1.952466, -0.6786345, 1, 0, 0.9372549, 1,
1.038187, -1.175844, 4.477267, 1, 0, 0.9294118, 1,
1.043478, 1.043028, -0.288646, 1, 0, 0.9254902, 1,
1.054009, -0.673761, 3.195002, 1, 0, 0.9176471, 1,
1.05612, -0.4811072, 3.202743, 1, 0, 0.9137255, 1,
1.058022, -1.691319, 1.680091, 1, 0, 0.9058824, 1,
1.058196, -0.2224367, 1.960379, 1, 0, 0.9019608, 1,
1.058276, 1.318341, -0.2048327, 1, 0, 0.8941177, 1,
1.070896, -2.02535, 2.763206, 1, 0, 0.8862745, 1,
1.071387, -0.4461017, 1.839671, 1, 0, 0.8823529, 1,
1.079935, -1.644566, 1.174228, 1, 0, 0.8745098, 1,
1.08426, 0.04890434, 2.215552, 1, 0, 0.8705882, 1,
1.090553, -0.1036225, 0.7128487, 1, 0, 0.8627451, 1,
1.092475, 0.7662367, 1.662125, 1, 0, 0.8588235, 1,
1.095526, 1.092826, 0.7445602, 1, 0, 0.8509804, 1,
1.096004, 0.1096261, 1.251556, 1, 0, 0.8470588, 1,
1.099893, 1.16943, 1.739906, 1, 0, 0.8392157, 1,
1.106367, 1.461174, 0.9863276, 1, 0, 0.8352941, 1,
1.107954, -0.8480346, 1.782562, 1, 0, 0.827451, 1,
1.109762, 0.4675997, 0.9900725, 1, 0, 0.8235294, 1,
1.109997, 0.8338856, 1.241742, 1, 0, 0.8156863, 1,
1.113141, -0.6095563, 1.018946, 1, 0, 0.8117647, 1,
1.114838, -0.4137378, 1.124136, 1, 0, 0.8039216, 1,
1.115416, -0.5727066, 3.295741, 1, 0, 0.7960784, 1,
1.119453, 0.6342337, 0.4196874, 1, 0, 0.7921569, 1,
1.125229, 0.7421545, 2.530245, 1, 0, 0.7843137, 1,
1.12541, 0.2374315, 3.567083, 1, 0, 0.7803922, 1,
1.13245, -0.6749279, 1.091393, 1, 0, 0.772549, 1,
1.143457, -0.9469141, 1.427585, 1, 0, 0.7686275, 1,
1.146608, 0.184259, 0.251824, 1, 0, 0.7607843, 1,
1.146692, 1.300546, -0.90967, 1, 0, 0.7568628, 1,
1.14932, -0.1373819, 0.3514565, 1, 0, 0.7490196, 1,
1.156024, 0.1673347, 1.536803, 1, 0, 0.7450981, 1,
1.157468, 0.2023008, 2.446097, 1, 0, 0.7372549, 1,
1.15777, 2.595949, 1.362047, 1, 0, 0.7333333, 1,
1.171416, -0.4054108, 3.426216, 1, 0, 0.7254902, 1,
1.171692, -0.3894652, 1.454534, 1, 0, 0.7215686, 1,
1.181073, -0.7787864, 2.602144, 1, 0, 0.7137255, 1,
1.186298, 0.6927754, 0.4165309, 1, 0, 0.7098039, 1,
1.188299, -0.4628426, 0.6467547, 1, 0, 0.7019608, 1,
1.192999, -1.283952, 1.178438, 1, 0, 0.6941177, 1,
1.196299, -1.295023, 3.13088, 1, 0, 0.6901961, 1,
1.204625, 0.07658968, 0.8948985, 1, 0, 0.682353, 1,
1.211143, -1.080101, 1.905832, 1, 0, 0.6784314, 1,
1.215562, 1.293389, -0.762387, 1, 0, 0.6705883, 1,
1.236792, -1.380285, 2.189249, 1, 0, 0.6666667, 1,
1.237145, -0.7995165, 4.414186, 1, 0, 0.6588235, 1,
1.239498, -0.4449285, 1.493358, 1, 0, 0.654902, 1,
1.24478, -0.8083975, 1.471581, 1, 0, 0.6470588, 1,
1.25441, 0.6865583, 1.354555, 1, 0, 0.6431373, 1,
1.274219, 0.6035973, 1.234091, 1, 0, 0.6352941, 1,
1.274903, -1.127458, 2.798858, 1, 0, 0.6313726, 1,
1.286704, -0.1388662, -0.1182035, 1, 0, 0.6235294, 1,
1.299051, 1.343195, 0.04468387, 1, 0, 0.6196079, 1,
1.303123, 1.410947, 3.058546, 1, 0, 0.6117647, 1,
1.310956, -0.4298744, 1.926017, 1, 0, 0.6078432, 1,
1.311114, 0.7696018, 1.439921, 1, 0, 0.6, 1,
1.311988, 0.4680492, 2.696776, 1, 0, 0.5921569, 1,
1.315783, 2.675264, 2.164528, 1, 0, 0.5882353, 1,
1.32336, -0.2682787, 2.442195, 1, 0, 0.5803922, 1,
1.3266, -1.315066, 2.895082, 1, 0, 0.5764706, 1,
1.330551, 0.6512643, 3.098924, 1, 0, 0.5686275, 1,
1.332226, 0.468739, 4.114006, 1, 0, 0.5647059, 1,
1.335678, 0.5524812, 1.264615, 1, 0, 0.5568628, 1,
1.33861, -1.865533, 2.241247, 1, 0, 0.5529412, 1,
1.350236, -0.7813442, 0.3675362, 1, 0, 0.5450981, 1,
1.352014, 0.4123171, 2.141971, 1, 0, 0.5411765, 1,
1.357847, 0.8015749, 0.500833, 1, 0, 0.5333334, 1,
1.373311, -0.5308131, 1.127151, 1, 0, 0.5294118, 1,
1.378205, -0.2377866, 2.1222, 1, 0, 0.5215687, 1,
1.380453, -0.5092232, 1.231891, 1, 0, 0.5176471, 1,
1.389642, -0.9010466, 2.872831, 1, 0, 0.509804, 1,
1.399294, -0.01907294, 2.593369, 1, 0, 0.5058824, 1,
1.407404, 0.2535439, 1.955761, 1, 0, 0.4980392, 1,
1.410596, -1.985837, 2.645022, 1, 0, 0.4901961, 1,
1.413914, 0.3075809, 0.7339122, 1, 0, 0.4862745, 1,
1.415519, -0.6940293, 2.7099, 1, 0, 0.4784314, 1,
1.416599, -0.2900915, 1.591862, 1, 0, 0.4745098, 1,
1.418751, 0.4978188, 1.014704, 1, 0, 0.4666667, 1,
1.423976, -0.5459512, 2.770395, 1, 0, 0.4627451, 1,
1.427405, 0.3699266, 2.158305, 1, 0, 0.454902, 1,
1.431766, -0.4130499, 2.352057, 1, 0, 0.4509804, 1,
1.437911, 0.4794413, 0.4803242, 1, 0, 0.4431373, 1,
1.442474, 1.162297, 2.31898, 1, 0, 0.4392157, 1,
1.450084, 0.1626777, 3.638554, 1, 0, 0.4313726, 1,
1.462061, 1.409991, 1.056719, 1, 0, 0.427451, 1,
1.471525, 2.706574, 1.526296, 1, 0, 0.4196078, 1,
1.475063, 0.3681403, 2.784279, 1, 0, 0.4156863, 1,
1.48031, 1.846158, 0.3901198, 1, 0, 0.4078431, 1,
1.495493, 0.70905, -1.52735, 1, 0, 0.4039216, 1,
1.501667, -0.4639271, 0.5378612, 1, 0, 0.3960784, 1,
1.50271, -0.7752285, 3.345483, 1, 0, 0.3882353, 1,
1.515451, -0.3176411, 1.641558, 1, 0, 0.3843137, 1,
1.540779, 0.5064961, 0.6513835, 1, 0, 0.3764706, 1,
1.55446, 1.759069, 1.185314, 1, 0, 0.372549, 1,
1.562354, -0.5906867, 2.753052, 1, 0, 0.3647059, 1,
1.570731, 2.437715, 2.780736, 1, 0, 0.3607843, 1,
1.573676, -0.3798999, 2.828383, 1, 0, 0.3529412, 1,
1.586977, -1.348658, 3.237575, 1, 0, 0.3490196, 1,
1.588385, -2.104148, 1.385795, 1, 0, 0.3411765, 1,
1.59249, 1.360384, 0.7350793, 1, 0, 0.3372549, 1,
1.595468, 0.2810586, 2.776187, 1, 0, 0.3294118, 1,
1.595935, -1.204371, 2.578534, 1, 0, 0.3254902, 1,
1.606541, -0.8452503, 2.809731, 1, 0, 0.3176471, 1,
1.607668, 0.4821919, 1.971062, 1, 0, 0.3137255, 1,
1.609033, -0.6285216, 3.299538, 1, 0, 0.3058824, 1,
1.611759, -0.6353938, 2.096056, 1, 0, 0.2980392, 1,
1.626668, -1.69643, 1.170825, 1, 0, 0.2941177, 1,
1.641641, 0.3861998, 1.099475, 1, 0, 0.2862745, 1,
1.664755, 1.03066, 1.12684, 1, 0, 0.282353, 1,
1.66693, -0.5905593, 1.771111, 1, 0, 0.2745098, 1,
1.704851, -1.947415, 1.621465, 1, 0, 0.2705882, 1,
1.725971, -2.200234, 1.243894, 1, 0, 0.2627451, 1,
1.729497, -0.1417313, 2.597044, 1, 0, 0.2588235, 1,
1.730169, -1.138141, 2.359547, 1, 0, 0.2509804, 1,
1.752938, 0.7959821, 1.69876, 1, 0, 0.2470588, 1,
1.756471, 0.9946679, 1.836845, 1, 0, 0.2392157, 1,
1.763566, 0.452738, 1.983078, 1, 0, 0.2352941, 1,
1.772783, 0.7602452, 0.3843672, 1, 0, 0.227451, 1,
1.777348, -0.8158432, 1.623389, 1, 0, 0.2235294, 1,
1.781683, 1.458887, 0.4676739, 1, 0, 0.2156863, 1,
1.791467, -0.8677207, 2.126395, 1, 0, 0.2117647, 1,
1.798637, 0.5094746, 1.387376, 1, 0, 0.2039216, 1,
1.805937, -0.9420892, 1.244502, 1, 0, 0.1960784, 1,
1.806109, 0.8450944, 0.0660603, 1, 0, 0.1921569, 1,
1.830175, -0.4072686, 0.3593417, 1, 0, 0.1843137, 1,
1.831999, 1.813118, 0.3148178, 1, 0, 0.1803922, 1,
1.83209, 0.1686923, 1.65596, 1, 0, 0.172549, 1,
1.84002, 1.289597, -0.6214286, 1, 0, 0.1686275, 1,
1.847123, -0.3773193, 2.174406, 1, 0, 0.1607843, 1,
1.864023, -1.156364, 0.5593353, 1, 0, 0.1568628, 1,
1.869489, 0.5656685, 1.724885, 1, 0, 0.1490196, 1,
1.899696, -2.158663, 2.468606, 1, 0, 0.145098, 1,
1.905301, -1.079413, 2.02798, 1, 0, 0.1372549, 1,
1.915514, 1.37541, 1.404377, 1, 0, 0.1333333, 1,
1.926875, -0.5342866, 2.113528, 1, 0, 0.1254902, 1,
1.98191, -0.02235957, 3.629779, 1, 0, 0.1215686, 1,
2.027897, -0.5085806, 3.914742, 1, 0, 0.1137255, 1,
2.072941, -0.4170477, 3.874258, 1, 0, 0.1098039, 1,
2.096985, 0.1608162, 0.543616, 1, 0, 0.1019608, 1,
2.130187, 0.6460881, 1.281841, 1, 0, 0.09411765, 1,
2.158491, -0.8270569, 1.385757, 1, 0, 0.09019608, 1,
2.161397, -2.310473, 1.603666, 1, 0, 0.08235294, 1,
2.204051, -0.1916957, 1.501092, 1, 0, 0.07843138, 1,
2.264861, 0.9687499, 1.267553, 1, 0, 0.07058824, 1,
2.268154, 1.495939, 2.800888, 1, 0, 0.06666667, 1,
2.273147, 0.316245, 0.8433916, 1, 0, 0.05882353, 1,
2.282439, -0.238805, 2.536768, 1, 0, 0.05490196, 1,
2.315618, 0.877879, -0.3145004, 1, 0, 0.04705882, 1,
2.323293, 0.07191322, -0.1376343, 1, 0, 0.04313726, 1,
2.34288, -0.2499688, 1.604129, 1, 0, 0.03529412, 1,
2.35463, 0.1742082, -0.02518318, 1, 0, 0.03137255, 1,
2.396397, -0.8927632, 2.742378, 1, 0, 0.02352941, 1,
2.465088, -0.5923257, 1.804523, 1, 0, 0.01960784, 1,
2.593298, -1.176853, 0.200422, 1, 0, 0.01176471, 1,
2.63694, -0.03153219, 1.981106, 1, 0, 0.007843138, 1
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
-0.6214044, -4.132858, -7.148599, 0, -0.5, 0.5, 0.5,
-0.6214044, -4.132858, -7.148599, 1, -0.5, 0.5, 0.5,
-0.6214044, -4.132858, -7.148599, 1, 1.5, 0.5, 0.5,
-0.6214044, -4.132858, -7.148599, 0, 1.5, 0.5, 0.5
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
-4.984327, -0.1736405, -7.148599, 0, -0.5, 0.5, 0.5,
-4.984327, -0.1736405, -7.148599, 1, -0.5, 0.5, 0.5,
-4.984327, -0.1736405, -7.148599, 1, 1.5, 0.5, 0.5,
-4.984327, -0.1736405, -7.148599, 0, 1.5, 0.5, 0.5
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
-4.984327, -4.132858, 0.2227871, 0, -0.5, 0.5, 0.5,
-4.984327, -4.132858, 0.2227871, 1, -0.5, 0.5, 0.5,
-4.984327, -4.132858, 0.2227871, 1, 1.5, 0.5, 0.5,
-4.984327, -4.132858, 0.2227871, 0, 1.5, 0.5, 0.5
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
-3, -3.219192, -5.44751,
2, -3.219192, -5.44751,
-3, -3.219192, -5.44751,
-3, -3.37147, -5.731025,
-2, -3.219192, -5.44751,
-2, -3.37147, -5.731025,
-1, -3.219192, -5.44751,
-1, -3.37147, -5.731025,
0, -3.219192, -5.44751,
0, -3.37147, -5.731025,
1, -3.219192, -5.44751,
1, -3.37147, -5.731025,
2, -3.219192, -5.44751,
2, -3.37147, -5.731025
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
-3, -3.676025, -6.298055, 0, -0.5, 0.5, 0.5,
-3, -3.676025, -6.298055, 1, -0.5, 0.5, 0.5,
-3, -3.676025, -6.298055, 1, 1.5, 0.5, 0.5,
-3, -3.676025, -6.298055, 0, 1.5, 0.5, 0.5,
-2, -3.676025, -6.298055, 0, -0.5, 0.5, 0.5,
-2, -3.676025, -6.298055, 1, -0.5, 0.5, 0.5,
-2, -3.676025, -6.298055, 1, 1.5, 0.5, 0.5,
-2, -3.676025, -6.298055, 0, 1.5, 0.5, 0.5,
-1, -3.676025, -6.298055, 0, -0.5, 0.5, 0.5,
-1, -3.676025, -6.298055, 1, -0.5, 0.5, 0.5,
-1, -3.676025, -6.298055, 1, 1.5, 0.5, 0.5,
-1, -3.676025, -6.298055, 0, 1.5, 0.5, 0.5,
0, -3.676025, -6.298055, 0, -0.5, 0.5, 0.5,
0, -3.676025, -6.298055, 1, -0.5, 0.5, 0.5,
0, -3.676025, -6.298055, 1, 1.5, 0.5, 0.5,
0, -3.676025, -6.298055, 0, 1.5, 0.5, 0.5,
1, -3.676025, -6.298055, 0, -0.5, 0.5, 0.5,
1, -3.676025, -6.298055, 1, -0.5, 0.5, 0.5,
1, -3.676025, -6.298055, 1, 1.5, 0.5, 0.5,
1, -3.676025, -6.298055, 0, 1.5, 0.5, 0.5,
2, -3.676025, -6.298055, 0, -0.5, 0.5, 0.5,
2, -3.676025, -6.298055, 1, -0.5, 0.5, 0.5,
2, -3.676025, -6.298055, 1, 1.5, 0.5, 0.5,
2, -3.676025, -6.298055, 0, 1.5, 0.5, 0.5
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
-3.977499, -3, -5.44751,
-3.977499, 2, -5.44751,
-3.977499, -3, -5.44751,
-4.145303, -3, -5.731025,
-3.977499, -2, -5.44751,
-4.145303, -2, -5.731025,
-3.977499, -1, -5.44751,
-4.145303, -1, -5.731025,
-3.977499, 0, -5.44751,
-4.145303, 0, -5.731025,
-3.977499, 1, -5.44751,
-4.145303, 1, -5.731025,
-3.977499, 2, -5.44751,
-4.145303, 2, -5.731025
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
-4.480913, -3, -6.298055, 0, -0.5, 0.5, 0.5,
-4.480913, -3, -6.298055, 1, -0.5, 0.5, 0.5,
-4.480913, -3, -6.298055, 1, 1.5, 0.5, 0.5,
-4.480913, -3, -6.298055, 0, 1.5, 0.5, 0.5,
-4.480913, -2, -6.298055, 0, -0.5, 0.5, 0.5,
-4.480913, -2, -6.298055, 1, -0.5, 0.5, 0.5,
-4.480913, -2, -6.298055, 1, 1.5, 0.5, 0.5,
-4.480913, -2, -6.298055, 0, 1.5, 0.5, 0.5,
-4.480913, -1, -6.298055, 0, -0.5, 0.5, 0.5,
-4.480913, -1, -6.298055, 1, -0.5, 0.5, 0.5,
-4.480913, -1, -6.298055, 1, 1.5, 0.5, 0.5,
-4.480913, -1, -6.298055, 0, 1.5, 0.5, 0.5,
-4.480913, 0, -6.298055, 0, -0.5, 0.5, 0.5,
-4.480913, 0, -6.298055, 1, -0.5, 0.5, 0.5,
-4.480913, 0, -6.298055, 1, 1.5, 0.5, 0.5,
-4.480913, 0, -6.298055, 0, 1.5, 0.5, 0.5,
-4.480913, 1, -6.298055, 0, -0.5, 0.5, 0.5,
-4.480913, 1, -6.298055, 1, -0.5, 0.5, 0.5,
-4.480913, 1, -6.298055, 1, 1.5, 0.5, 0.5,
-4.480913, 1, -6.298055, 0, 1.5, 0.5, 0.5,
-4.480913, 2, -6.298055, 0, -0.5, 0.5, 0.5,
-4.480913, 2, -6.298055, 1, -0.5, 0.5, 0.5,
-4.480913, 2, -6.298055, 1, 1.5, 0.5, 0.5,
-4.480913, 2, -6.298055, 0, 1.5, 0.5, 0.5
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
-3.977499, -3.219192, -4,
-3.977499, -3.219192, 4,
-3.977499, -3.219192, -4,
-4.145303, -3.37147, -4,
-3.977499, -3.219192, -2,
-4.145303, -3.37147, -2,
-3.977499, -3.219192, 0,
-4.145303, -3.37147, 0,
-3.977499, -3.219192, 2,
-4.145303, -3.37147, 2,
-3.977499, -3.219192, 4,
-4.145303, -3.37147, 4
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
-4.480913, -3.676025, -4, 0, -0.5, 0.5, 0.5,
-4.480913, -3.676025, -4, 1, -0.5, 0.5, 0.5,
-4.480913, -3.676025, -4, 1, 1.5, 0.5, 0.5,
-4.480913, -3.676025, -4, 0, 1.5, 0.5, 0.5,
-4.480913, -3.676025, -2, 0, -0.5, 0.5, 0.5,
-4.480913, -3.676025, -2, 1, -0.5, 0.5, 0.5,
-4.480913, -3.676025, -2, 1, 1.5, 0.5, 0.5,
-4.480913, -3.676025, -2, 0, 1.5, 0.5, 0.5,
-4.480913, -3.676025, 0, 0, -0.5, 0.5, 0.5,
-4.480913, -3.676025, 0, 1, -0.5, 0.5, 0.5,
-4.480913, -3.676025, 0, 1, 1.5, 0.5, 0.5,
-4.480913, -3.676025, 0, 0, 1.5, 0.5, 0.5,
-4.480913, -3.676025, 2, 0, -0.5, 0.5, 0.5,
-4.480913, -3.676025, 2, 1, -0.5, 0.5, 0.5,
-4.480913, -3.676025, 2, 1, 1.5, 0.5, 0.5,
-4.480913, -3.676025, 2, 0, 1.5, 0.5, 0.5,
-4.480913, -3.676025, 4, 0, -0.5, 0.5, 0.5,
-4.480913, -3.676025, 4, 1, -0.5, 0.5, 0.5,
-4.480913, -3.676025, 4, 1, 1.5, 0.5, 0.5,
-4.480913, -3.676025, 4, 0, 1.5, 0.5, 0.5
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
-3.977499, -3.219192, -5.44751,
-3.977499, 2.871911, -5.44751,
-3.977499, -3.219192, 5.893085,
-3.977499, 2.871911, 5.893085,
-3.977499, -3.219192, -5.44751,
-3.977499, -3.219192, 5.893085,
-3.977499, 2.871911, -5.44751,
-3.977499, 2.871911, 5.893085,
-3.977499, -3.219192, -5.44751,
2.73469, -3.219192, -5.44751,
-3.977499, -3.219192, 5.893085,
2.73469, -3.219192, 5.893085,
-3.977499, 2.871911, -5.44751,
2.73469, 2.871911, -5.44751,
-3.977499, 2.871911, 5.893085,
2.73469, 2.871911, 5.893085,
2.73469, -3.219192, -5.44751,
2.73469, 2.871911, -5.44751,
2.73469, -3.219192, 5.893085,
2.73469, 2.871911, 5.893085,
2.73469, -3.219192, -5.44751,
2.73469, -3.219192, 5.893085,
2.73469, 2.871911, -5.44751,
2.73469, 2.871911, 5.893085
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
var radius = 7.752179;
var distance = 34.49032;
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
mvMatrix.translate( 0.6214044, 0.1736405, -0.2227871 );
mvMatrix.scale( 1.248744, 1.376074, 0.7390977 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.49032);
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
dimethyl_(E)-1-methy<-read.table("dimethyl_(E)-1-methy.xyz", skip=1)
```

```
## Error in read.table("dimethyl_(E)-1-methy.xyz", skip = 1): duplicate 'row.names' are not allowed
```

```r
x<-dimethyl_(E)-1-methy$V2
```

```
## Error in eval(expr, envir, enclos): could not find function "dimethyl_"
```

```r
y<-dimethyl_(E)-1-methy$V3
```

```
## Error in eval(expr, envir, enclos): could not find function "dimethyl_"
```

```r
z<-dimethyl_(E)-1-methy$V4
```

```
## Error in eval(expr, envir, enclos): could not find function "dimethyl_"
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
-3.879748, -0.3215244, -1.025461, 0, 0, 1, 1, 1,
-3.018099, -2.219455, -3.056752, 1, 0, 0, 1, 1,
-2.679174, 1.189419, -1.822984, 1, 0, 0, 1, 1,
-2.654806, -0.2099241, -1.800209, 1, 0, 0, 1, 1,
-2.499513, -0.3087642, -0.7918467, 1, 0, 0, 1, 1,
-2.371504, 0.05255465, 1.013245, 1, 0, 0, 1, 1,
-2.306209, 0.4021653, -0.9823147, 0, 0, 0, 1, 1,
-2.295971, 0.5595044, -2.562428, 0, 0, 0, 1, 1,
-2.268533, -1.255631, -1.98909, 0, 0, 0, 1, 1,
-2.214942, -1.321522, -1.040628, 0, 0, 0, 1, 1,
-2.1706, 0.3261822, -1.376124, 0, 0, 0, 1, 1,
-2.138554, -0.9776516, -3.383831, 0, 0, 0, 1, 1,
-2.07128, -0.3814186, -2.437814, 0, 0, 0, 1, 1,
-2.068412, 0.2144567, -1.649371, 1, 1, 1, 1, 1,
-2.029447, 1.109103, -0.9236992, 1, 1, 1, 1, 1,
-2.019181, 2.361639, -2.505786, 1, 1, 1, 1, 1,
-2.013864, -0.6838399, -3.041503, 1, 1, 1, 1, 1,
-1.990178, -0.01880447, -0.5473899, 1, 1, 1, 1, 1,
-1.96545, 0.04368936, -2.374687, 1, 1, 1, 1, 1,
-1.963418, -1.093861, -3.474231, 1, 1, 1, 1, 1,
-1.96104, -0.25639, -2.841341, 1, 1, 1, 1, 1,
-1.936799, 1.456017, -1.043548, 1, 1, 1, 1, 1,
-1.932518, 0.8515753, -1.42201, 1, 1, 1, 1, 1,
-1.931108, 0.4092683, -3.877068, 1, 1, 1, 1, 1,
-1.926231, -0.1930094, -3.093035, 1, 1, 1, 1, 1,
-1.907907, -1.523174, -2.798014, 1, 1, 1, 1, 1,
-1.900017, 0.9635988, -0.317771, 1, 1, 1, 1, 1,
-1.888732, -1.388504, -3.691176, 1, 1, 1, 1, 1,
-1.885214, 0.1037796, -1.15139, 0, 0, 1, 1, 1,
-1.880969, -0.5418341, -2.743598, 1, 0, 0, 1, 1,
-1.872413, 0.05637838, -1.264676, 1, 0, 0, 1, 1,
-1.843936, -0.4807132, -1.511734, 1, 0, 0, 1, 1,
-1.840793, -0.2886631, -1.604941, 1, 0, 0, 1, 1,
-1.830745, 0.8231186, -0.7507175, 1, 0, 0, 1, 1,
-1.829171, -0.5530729, -2.085566, 0, 0, 0, 1, 1,
-1.828411, 0.4032887, -1.142603, 0, 0, 0, 1, 1,
-1.826017, 1.472582, -2.393823, 0, 0, 0, 1, 1,
-1.804557, -0.1881779, -2.437054, 0, 0, 0, 1, 1,
-1.796685, -1.453878, -4.137096, 0, 0, 0, 1, 1,
-1.786895, -0.5089827, -0.8087748, 0, 0, 0, 1, 1,
-1.784691, -1.388562, -3.685911, 0, 0, 0, 1, 1,
-1.777825, -0.878983, -1.420798, 1, 1, 1, 1, 1,
-1.777087, -0.4304108, -0.6969442, 1, 1, 1, 1, 1,
-1.775434, -2.012515, -1.98964, 1, 1, 1, 1, 1,
-1.762121, 0.9631892, -0.6072823, 1, 1, 1, 1, 1,
-1.743423, -0.01192101, -1.314809, 1, 1, 1, 1, 1,
-1.729915, -1.394074, -3.023619, 1, 1, 1, 1, 1,
-1.714707, 1.21875, -0.268525, 1, 1, 1, 1, 1,
-1.674002, 0.4254107, -1.2146, 1, 1, 1, 1, 1,
-1.671613, -1.359073, -3.974728, 1, 1, 1, 1, 1,
-1.66664, 0.2371974, -2.401607, 1, 1, 1, 1, 1,
-1.644758, 0.4972843, -1.849573, 1, 1, 1, 1, 1,
-1.638543, 0.1831587, -3.862176, 1, 1, 1, 1, 1,
-1.614522, -1.755212, -3.753803, 1, 1, 1, 1, 1,
-1.611302, -0.02501572, -0.5883481, 1, 1, 1, 1, 1,
-1.607964, 0.838312, -1.785211, 1, 1, 1, 1, 1,
-1.605181, 0.5903106, -0.5424483, 0, 0, 1, 1, 1,
-1.590534, 2.15814, -0.7774365, 1, 0, 0, 1, 1,
-1.572539, 0.3716877, -0.1296926, 1, 0, 0, 1, 1,
-1.52839, 0.0999012, -1.612174, 1, 0, 0, 1, 1,
-1.514015, -0.18642, -1.44448, 1, 0, 0, 1, 1,
-1.512329, -0.3461366, -0.4654309, 1, 0, 0, 1, 1,
-1.512302, 0.1235312, -1.939862, 0, 0, 0, 1, 1,
-1.500469, -0.8103654, -2.981794, 0, 0, 0, 1, 1,
-1.49626, 0.6864462, -1.821679, 0, 0, 0, 1, 1,
-1.478042, 1.589383, -1.347985, 0, 0, 0, 1, 1,
-1.440553, 0.8772263, -1.469741, 0, 0, 0, 1, 1,
-1.430606, 1.710251, -0.8886759, 0, 0, 0, 1, 1,
-1.425623, 1.1076, 0.8487068, 0, 0, 0, 1, 1,
-1.423692, 0.2327849, -1.756451, 1, 1, 1, 1, 1,
-1.404902, -3.130487, -4.093324, 1, 1, 1, 1, 1,
-1.400011, -0.9997474, -3.289189, 1, 1, 1, 1, 1,
-1.399054, 0.6818737, -0.462223, 1, 1, 1, 1, 1,
-1.391118, 0.4946509, -0.694648, 1, 1, 1, 1, 1,
-1.390216, -1.664088, -3.555829, 1, 1, 1, 1, 1,
-1.386181, 0.6391824, -1.169161, 1, 1, 1, 1, 1,
-1.376903, 0.2591334, -0.3846061, 1, 1, 1, 1, 1,
-1.374064, -0.0002725039, -0.1145152, 1, 1, 1, 1, 1,
-1.365317, 1.695758, -1.269233, 1, 1, 1, 1, 1,
-1.36055, 1.145465, -1.537719, 1, 1, 1, 1, 1,
-1.347381, 0.3561628, -2.662544, 1, 1, 1, 1, 1,
-1.340204, 1.798449, 0.2647381, 1, 1, 1, 1, 1,
-1.3253, 0.4491389, -0.8502461, 1, 1, 1, 1, 1,
-1.324303, 0.03396605, -0.810111, 1, 1, 1, 1, 1,
-1.309058, -0.7764552, -4.742391, 0, 0, 1, 1, 1,
-1.306623, 1.909553, -1.143589, 1, 0, 0, 1, 1,
-1.302616, -0.6234018, -3.264769, 1, 0, 0, 1, 1,
-1.287639, 0.1381661, -0.3037559, 1, 0, 0, 1, 1,
-1.280646, -0.1975626, -1.582953, 1, 0, 0, 1, 1,
-1.280278, 0.05909748, -1.926771, 1, 0, 0, 1, 1,
-1.274553, -0.4495641, -0.9182467, 0, 0, 0, 1, 1,
-1.273776, -0.6601067, -1.586176, 0, 0, 0, 1, 1,
-1.273597, 0.1375037, -3.190395, 0, 0, 0, 1, 1,
-1.27164, -1.334788, -2.396754, 0, 0, 0, 1, 1,
-1.270145, -0.5638921, -1.380471, 0, 0, 0, 1, 1,
-1.269638, -2.091835, -3.517183, 0, 0, 0, 1, 1,
-1.251175, 1.184072, 0.7402375, 0, 0, 0, 1, 1,
-1.245531, -0.1138549, -3.684879, 1, 1, 1, 1, 1,
-1.234665, 2.076865, 1.178792, 1, 1, 1, 1, 1,
-1.231355, 1.081735, -0.8504251, 1, 1, 1, 1, 1,
-1.225359, 0.1480401, -0.9015231, 1, 1, 1, 1, 1,
-1.221209, 0.1730668, 0.2851671, 1, 1, 1, 1, 1,
-1.220091, -0.4256158, -1.750648, 1, 1, 1, 1, 1,
-1.215207, -0.8054632, 0.124237, 1, 1, 1, 1, 1,
-1.214572, -0.9522296, -0.8644747, 1, 1, 1, 1, 1,
-1.211215, -0.7562926, -1.684869, 1, 1, 1, 1, 1,
-1.198565, 1.084625, -1.515293, 1, 1, 1, 1, 1,
-1.188459, 0.8867298, -1.050011, 1, 1, 1, 1, 1,
-1.187824, 0.3131847, -1.948548, 1, 1, 1, 1, 1,
-1.182947, -0.7844853, -3.265445, 1, 1, 1, 1, 1,
-1.181061, -0.1850313, -1.947686, 1, 1, 1, 1, 1,
-1.180859, 1.647289, 1.090701, 1, 1, 1, 1, 1,
-1.1779, 1.801901, -0.4481393, 0, 0, 1, 1, 1,
-1.171405, -0.8642499, -1.838954, 1, 0, 0, 1, 1,
-1.168255, 0.5269329, -0.8304465, 1, 0, 0, 1, 1,
-1.164292, -0.3153431, 0.3047748, 1, 0, 0, 1, 1,
-1.164001, 0.06961204, -1.365599, 1, 0, 0, 1, 1,
-1.158191, -0.04600134, -2.636585, 1, 0, 0, 1, 1,
-1.15697, 0.2048718, -0.2339979, 0, 0, 0, 1, 1,
-1.154524, -0.3169131, -3.21135, 0, 0, 0, 1, 1,
-1.149293, -1.768549, -1.132614, 0, 0, 0, 1, 1,
-1.148367, 0.2211162, -1.585968, 0, 0, 0, 1, 1,
-1.143713, 0.1661339, -1.937006, 0, 0, 0, 1, 1,
-1.139965, 0.9553642, -0.6472231, 0, 0, 0, 1, 1,
-1.138736, -0.2857632, -2.498398, 0, 0, 0, 1, 1,
-1.136449, -0.5711845, -0.7510709, 1, 1, 1, 1, 1,
-1.132839, -0.1372837, -0.8431321, 1, 1, 1, 1, 1,
-1.131861, -0.5988012, -3.182029, 1, 1, 1, 1, 1,
-1.12789, 0.6984753, -0.6105888, 1, 1, 1, 1, 1,
-1.127689, 0.05397631, -2.560086, 1, 1, 1, 1, 1,
-1.126924, 0.5867834, -0.2509141, 1, 1, 1, 1, 1,
-1.126892, -1.039976, -2.522989, 1, 1, 1, 1, 1,
-1.125297, 0.4700609, -3.173858, 1, 1, 1, 1, 1,
-1.122978, -0.4912625, -1.336884, 1, 1, 1, 1, 1,
-1.120409, 0.4379516, -0.4914306, 1, 1, 1, 1, 1,
-1.110143, -0.9544726, -2.189528, 1, 1, 1, 1, 1,
-1.10527, 0.3358163, -1.153035, 1, 1, 1, 1, 1,
-1.099631, -0.5276273, -1.888941, 1, 1, 1, 1, 1,
-1.08882, -0.7225582, -3.668283, 1, 1, 1, 1, 1,
-1.08249, 0.4391388, -2.377127, 1, 1, 1, 1, 1,
-1.082429, -0.9372928, -2.411546, 0, 0, 1, 1, 1,
-1.078418, -1.512049, -2.476238, 1, 0, 0, 1, 1,
-1.073679, 0.5160545, -0.9655308, 1, 0, 0, 1, 1,
-1.069524, 0.1899382, -0.381698, 1, 0, 0, 1, 1,
-1.06935, -2.396848, -1.216933, 1, 0, 0, 1, 1,
-1.063544, -1.091419, -2.480591, 1, 0, 0, 1, 1,
-1.0605, -0.02374984, -1.906238, 0, 0, 0, 1, 1,
-1.049377, 2.243827, 0.1223291, 0, 0, 0, 1, 1,
-1.04901, -0.4679969, -2.600358, 0, 0, 0, 1, 1,
-1.048097, -0.9294285, -2.159309, 0, 0, 0, 1, 1,
-1.046359, 1.055548, -2.101342, 0, 0, 0, 1, 1,
-1.044535, 1.517346, 1.22142, 0, 0, 0, 1, 1,
-1.044185, -0.5299987, -1.151308, 0, 0, 0, 1, 1,
-1.043003, -2.321959, -2.832468, 1, 1, 1, 1, 1,
-1.036935, -0.7314799, -2.858219, 1, 1, 1, 1, 1,
-1.030657, -0.4513721, -2.446593, 1, 1, 1, 1, 1,
-1.027688, 0.2861717, -0.6983376, 1, 1, 1, 1, 1,
-1.024472, -0.7576639, -2.214796, 1, 1, 1, 1, 1,
-1.01304, 0.5135374, -1.357053, 1, 1, 1, 1, 1,
-1.010344, 2.12962, 1.515287, 1, 1, 1, 1, 1,
-1.00708, -1.69106, -3.089591, 1, 1, 1, 1, 1,
-1.00636, -0.6556739, -2.89545, 1, 1, 1, 1, 1,
-1.005349, 0.5110109, -2.306652, 1, 1, 1, 1, 1,
-1.002808, 0.2524302, -2.082481, 1, 1, 1, 1, 1,
-1.000053, 0.3558701, -0.316729, 1, 1, 1, 1, 1,
-0.9998659, 1.589673, 0.2480463, 1, 1, 1, 1, 1,
-0.9995558, 0.4262482, -1.167894, 1, 1, 1, 1, 1,
-0.9986278, -0.126597, -1.861532, 1, 1, 1, 1, 1,
-0.9954663, -0.2903229, -1.270011, 0, 0, 1, 1, 1,
-0.993649, 0.4070036, -2.30744, 1, 0, 0, 1, 1,
-0.9914039, 0.2853439, -2.025883, 1, 0, 0, 1, 1,
-0.9908525, 1.159634, -1.746564, 1, 0, 0, 1, 1,
-0.9871883, -1.073504, -2.951314, 1, 0, 0, 1, 1,
-0.9861498, 1.590253, -0.03685509, 1, 0, 0, 1, 1,
-0.9858562, 0.957536, -1.463788, 0, 0, 0, 1, 1,
-0.9808265, -1.436918, -0.234489, 0, 0, 0, 1, 1,
-0.9745059, -0.7348477, -3.44689, 0, 0, 0, 1, 1,
-0.9723284, 1.810594, 0.1843715, 0, 0, 0, 1, 1,
-0.9299701, 1.668174, -2.320114, 0, 0, 0, 1, 1,
-0.9299601, 1.938257, -0.1341927, 0, 0, 0, 1, 1,
-0.9279705, -0.824671, -1.956707, 0, 0, 0, 1, 1,
-0.9265202, 0.7072901, -0.5481168, 1, 1, 1, 1, 1,
-0.9241317, -2.170296, -1.994391, 1, 1, 1, 1, 1,
-0.9237643, 0.508654, -2.64137, 1, 1, 1, 1, 1,
-0.9234305, 0.5546863, -0.8444037, 1, 1, 1, 1, 1,
-0.9198713, 1.987138, 0.8425799, 1, 1, 1, 1, 1,
-0.9165581, -0.09292279, -2.12779, 1, 1, 1, 1, 1,
-0.9145022, -0.6147836, -2.726315, 1, 1, 1, 1, 1,
-0.9102526, 0.3087452, 0.09271989, 1, 1, 1, 1, 1,
-0.9078864, -0.4066691, -2.669493, 1, 1, 1, 1, 1,
-0.9056394, -0.4482084, -1.722632, 1, 1, 1, 1, 1,
-0.9053293, 0.4669596, -0.4427077, 1, 1, 1, 1, 1,
-0.9035401, 1.184712, 0.1273071, 1, 1, 1, 1, 1,
-0.9009575, 1.426348, -0.08448298, 1, 1, 1, 1, 1,
-0.8954874, -1.097679, -3.200128, 1, 1, 1, 1, 1,
-0.8871783, 1.405445, -0.4861155, 1, 1, 1, 1, 1,
-0.8828097, 1.059145, -1.703402, 0, 0, 1, 1, 1,
-0.8765292, -0.9782332, -3.304657, 1, 0, 0, 1, 1,
-0.8758569, -0.4021037, -0.07121953, 1, 0, 0, 1, 1,
-0.8719698, 0.1084433, -0.6504644, 1, 0, 0, 1, 1,
-0.8717106, 1.070371, -0.6237008, 1, 0, 0, 1, 1,
-0.8682398, 0.1654133, -0.5625159, 1, 0, 0, 1, 1,
-0.8609484, 1.879446, -0.03309732, 0, 0, 0, 1, 1,
-0.8567345, 1.391476, -0.9621137, 0, 0, 0, 1, 1,
-0.8538221, -1.154039, -4.269245, 0, 0, 0, 1, 1,
-0.8517755, -0.01669383, -2.32016, 0, 0, 0, 1, 1,
-0.8452595, -1.818803, -1.922404, 0, 0, 0, 1, 1,
-0.8414772, 0.5366219, -1.786075, 0, 0, 0, 1, 1,
-0.8332495, 0.6327171, -0.9069919, 0, 0, 0, 1, 1,
-0.8298945, 0.923113, -2.726863, 1, 1, 1, 1, 1,
-0.8276382, 1.437218, 0.7240915, 1, 1, 1, 1, 1,
-0.8258013, -0.7904537, -3.215685, 1, 1, 1, 1, 1,
-0.8245248, 1.167709, 0.1713512, 1, 1, 1, 1, 1,
-0.8237313, -0.7199819, -1.292249, 1, 1, 1, 1, 1,
-0.8235093, 0.5152491, -0.7614438, 1, 1, 1, 1, 1,
-0.8211637, -0.8895341, -2.810048, 1, 1, 1, 1, 1,
-0.8189446, -1.065321, -0.5218648, 1, 1, 1, 1, 1,
-0.8178996, 0.5446804, -1.109734, 1, 1, 1, 1, 1,
-0.8174029, 1.277365, -2.042926, 1, 1, 1, 1, 1,
-0.8071844, -1.460186, -2.677643, 1, 1, 1, 1, 1,
-0.8047327, 0.8854816, -2.075835, 1, 1, 1, 1, 1,
-0.8045714, 2.725874, 0.1279418, 1, 1, 1, 1, 1,
-0.8032433, -0.4274342, -2.399663, 1, 1, 1, 1, 1,
-0.8024293, 1.780912, 0.02041832, 1, 1, 1, 1, 1,
-0.8020257, 0.3032116, -1.469432, 0, 0, 1, 1, 1,
-0.7998904, 0.552425, -0.7691188, 1, 0, 0, 1, 1,
-0.7996834, -1.298163, -1.313958, 1, 0, 0, 1, 1,
-0.7981558, -1.635467, -3.480233, 1, 0, 0, 1, 1,
-0.7813947, -0.1467131, -0.05060432, 1, 0, 0, 1, 1,
-0.7777665, -0.3302516, -0.07703246, 1, 0, 0, 1, 1,
-0.7775266, 0.6402072, -1.504005, 0, 0, 0, 1, 1,
-0.7773726, -0.1551157, -2.386696, 0, 0, 0, 1, 1,
-0.7770181, 0.416881, -2.74049, 0, 0, 0, 1, 1,
-0.7716019, -1.203591, -2.004, 0, 0, 0, 1, 1,
-0.7687151, 0.59611, -0.9981516, 0, 0, 0, 1, 1,
-0.7471019, -1.413326, -3.546484, 0, 0, 0, 1, 1,
-0.7467303, 0.6561943, 0.7152516, 0, 0, 0, 1, 1,
-0.7467039, 0.5296369, -0.6548638, 1, 1, 1, 1, 1,
-0.7466628, 0.6914911, -0.1289539, 1, 1, 1, 1, 1,
-0.7460178, 0.07410483, -0.6427389, 1, 1, 1, 1, 1,
-0.7384074, 1.621346, -0.8255122, 1, 1, 1, 1, 1,
-0.7339025, -0.354105, -1.39658, 1, 1, 1, 1, 1,
-0.7271475, 0.7785273, -1.292083, 1, 1, 1, 1, 1,
-0.7247726, -0.7824859, -1.801639, 1, 1, 1, 1, 1,
-0.7204658, -1.884714, -2.379467, 1, 1, 1, 1, 1,
-0.7131109, 0.4162105, -2.330736, 1, 1, 1, 1, 1,
-0.7121474, 0.567026, -2.122999, 1, 1, 1, 1, 1,
-0.7086692, -0.6736918, -2.569454, 1, 1, 1, 1, 1,
-0.7082944, -1.925034, -2.991037, 1, 1, 1, 1, 1,
-0.7067733, 1.118133, 1.91859, 1, 1, 1, 1, 1,
-0.6999923, -1.668692, -3.543128, 1, 1, 1, 1, 1,
-0.6987695, 1.15242, -1.187027, 1, 1, 1, 1, 1,
-0.6970803, 1.494828, -1.537179, 0, 0, 1, 1, 1,
-0.6886339, 1.80138, 1.365186, 1, 0, 0, 1, 1,
-0.6712343, 0.8227664, -0.7604727, 1, 0, 0, 1, 1,
-0.6623662, 1.640477, 0.2831199, 1, 0, 0, 1, 1,
-0.6601778, -1.126819, -3.552343, 1, 0, 0, 1, 1,
-0.6554697, -0.5094351, -3.060801, 1, 0, 0, 1, 1,
-0.6302719, 1.486427, -1.72886, 0, 0, 0, 1, 1,
-0.628563, -0.009532161, -1.130065, 0, 0, 0, 1, 1,
-0.627317, -0.8699391, -2.159987, 0, 0, 0, 1, 1,
-0.6263854, -0.6999887, -2.58625, 0, 0, 0, 1, 1,
-0.6227986, -0.3260567, -0.8947573, 0, 0, 0, 1, 1,
-0.6205563, -2.393562, -2.811206, 0, 0, 0, 1, 1,
-0.6169944, -0.7210039, -0.4481472, 0, 0, 0, 1, 1,
-0.6102488, -0.4655232, -3.951674, 1, 1, 1, 1, 1,
-0.6072994, -1.908042, -3.879955, 1, 1, 1, 1, 1,
-0.6034541, 0.3926854, -2.267687, 1, 1, 1, 1, 1,
-0.5961431, 0.6883792, -1.043396, 1, 1, 1, 1, 1,
-0.594567, 0.9481192, -0.4457348, 1, 1, 1, 1, 1,
-0.5933948, 1.275794, -1.538543, 1, 1, 1, 1, 1,
-0.5922601, 1.118605, -1.169895, 1, 1, 1, 1, 1,
-0.5918478, 1.712631, 1.772332, 1, 1, 1, 1, 1,
-0.589947, -1.533332, -1.372092, 1, 1, 1, 1, 1,
-0.5889856, -1.832112, -2.311739, 1, 1, 1, 1, 1,
-0.5880969, 0.6207969, -0.9841017, 1, 1, 1, 1, 1,
-0.5861099, -0.3449939, -0.7324268, 1, 1, 1, 1, 1,
-0.5826067, -1.016423, -3.172858, 1, 1, 1, 1, 1,
-0.5820963, -1.093307, -2.947858, 1, 1, 1, 1, 1,
-0.5809139, 0.5363341, -0.5832112, 1, 1, 1, 1, 1,
-0.5803291, -0.3308154, -2.16411, 0, 0, 1, 1, 1,
-0.5798594, -0.2312111, -1.367412, 1, 0, 0, 1, 1,
-0.5756367, -0.04638211, -0.8335447, 1, 0, 0, 1, 1,
-0.5735981, 1.615419, 0.4225828, 1, 0, 0, 1, 1,
-0.5714049, 0.07902519, -0.377282, 1, 0, 0, 1, 1,
-0.568032, -1.045239, -2.363264, 1, 0, 0, 1, 1,
-0.5650361, 0.09947041, 1.048093, 0, 0, 0, 1, 1,
-0.5605236, 1.521288, 0.08363362, 0, 0, 0, 1, 1,
-0.559428, 0.02723618, -0.938546, 0, 0, 0, 1, 1,
-0.556655, 1.522863, -2.151695, 0, 0, 0, 1, 1,
-0.5469677, 0.8912564, 0.6451395, 0, 0, 0, 1, 1,
-0.5409999, 1.713085, 0.5433048, 0, 0, 0, 1, 1,
-0.5399539, 1.911103, 1.022806, 0, 0, 0, 1, 1,
-0.5369394, -0.02066044, -1.65791, 1, 1, 1, 1, 1,
-0.5359747, -0.06597584, -1.489788, 1, 1, 1, 1, 1,
-0.5346899, -0.8803069, -3.080739, 1, 1, 1, 1, 1,
-0.5273096, 0.4299564, 0.2973563, 1, 1, 1, 1, 1,
-0.5247227, 0.4357494, -2.452648, 1, 1, 1, 1, 1,
-0.5205138, 1.187833, -0.7113559, 1, 1, 1, 1, 1,
-0.5184543, 0.7830254, -0.3601561, 1, 1, 1, 1, 1,
-0.5156177, 0.03814702, -2.261044, 1, 1, 1, 1, 1,
-0.5148197, -0.367072, -2.495208, 1, 1, 1, 1, 1,
-0.5143927, 1.029079, -0.5851091, 1, 1, 1, 1, 1,
-0.510542, -0.1913169, -1.476556, 1, 1, 1, 1, 1,
-0.5102767, 0.7610071, 2.97269, 1, 1, 1, 1, 1,
-0.5087145, -0.3662243, -1.872069, 1, 1, 1, 1, 1,
-0.4972742, -0.2228086, -1.359105, 1, 1, 1, 1, 1,
-0.4947604, -0.8658094, -1.869071, 1, 1, 1, 1, 1,
-0.4921188, -1.810989, -0.4466172, 0, 0, 1, 1, 1,
-0.4878094, 0.01292149, -1.227768, 1, 0, 0, 1, 1,
-0.4810861, -0.3247609, -2.955463, 1, 0, 0, 1, 1,
-0.4799867, -0.991824, -3.051286, 1, 0, 0, 1, 1,
-0.4789529, -0.05040327, -2.1384, 1, 0, 0, 1, 1,
-0.4761893, -1.001181, -2.209846, 1, 0, 0, 1, 1,
-0.4730918, -0.2715551, -0.1044955, 0, 0, 0, 1, 1,
-0.4726598, 0.4706247, -1.084567, 0, 0, 0, 1, 1,
-0.4680656, -1.599245, -3.102431, 0, 0, 0, 1, 1,
-0.4674026, 0.254518, -2.724123, 0, 0, 0, 1, 1,
-0.4653817, 0.4569375, -1.119552, 0, 0, 0, 1, 1,
-0.4651102, 0.3352846, 0.3361441, 0, 0, 0, 1, 1,
-0.4572252, 0.9544063, -2.075493, 0, 0, 0, 1, 1,
-0.4508853, 0.08810804, -0.3866481, 1, 1, 1, 1, 1,
-0.4505428, 0.7447254, -1.467999, 1, 1, 1, 1, 1,
-0.4498034, -0.6609415, -1.575994, 1, 1, 1, 1, 1,
-0.449216, -0.3876369, -1.844637, 1, 1, 1, 1, 1,
-0.4431798, -2.302408, -4.148229, 1, 1, 1, 1, 1,
-0.4373132, 0.3520649, 0.3191575, 1, 1, 1, 1, 1,
-0.4366579, -0.2901391, -3.627377, 1, 1, 1, 1, 1,
-0.4322443, 0.1098599, -1.549443, 1, 1, 1, 1, 1,
-0.4321564, -1.566169, -3.380561, 1, 1, 1, 1, 1,
-0.429345, -1.16419, -4.52045, 1, 1, 1, 1, 1,
-0.4127958, -0.2530545, -1.703273, 1, 1, 1, 1, 1,
-0.4079338, -0.2773469, 0.06727387, 1, 1, 1, 1, 1,
-0.4047176, -0.09917739, -2.445658, 1, 1, 1, 1, 1,
-0.4003564, 1.269317, 0.3553968, 1, 1, 1, 1, 1,
-0.3981484, -0.2061404, -2.257325, 1, 1, 1, 1, 1,
-0.3969914, 0.2824838, -0.8072473, 0, 0, 1, 1, 1,
-0.3933705, 0.3178642, -0.2667571, 1, 0, 0, 1, 1,
-0.3931837, -0.7768874, -2.311061, 1, 0, 0, 1, 1,
-0.3924681, -0.112786, -2.439965, 1, 0, 0, 1, 1,
-0.3879628, 1.312987, 0.08835573, 1, 0, 0, 1, 1,
-0.3859563, -0.3627771, -2.250558, 1, 0, 0, 1, 1,
-0.3844232, 1.858596, -0.1635756, 0, 0, 0, 1, 1,
-0.3831542, -0.3343436, -2.524396, 0, 0, 0, 1, 1,
-0.3830506, 0.3005309, -0.5993476, 0, 0, 0, 1, 1,
-0.3829114, 2.238045, 0.0884947, 0, 0, 0, 1, 1,
-0.3823575, -0.2333813, -1.33353, 0, 0, 0, 1, 1,
-0.3759364, -0.8724178, -2.641806, 0, 0, 0, 1, 1,
-0.3729538, 0.982384, -1.921304, 0, 0, 0, 1, 1,
-0.3725331, -0.6086327, -2.659931, 1, 1, 1, 1, 1,
-0.3693744, -0.6232662, -3.184873, 1, 1, 1, 1, 1,
-0.3663369, 1.721627, 0.1423032, 1, 1, 1, 1, 1,
-0.3663299, 1.821725, 0.4598351, 1, 1, 1, 1, 1,
-0.3660465, -0.406844, -1.442762, 1, 1, 1, 1, 1,
-0.3642034, 1.193242, 0.06973176, 1, 1, 1, 1, 1,
-0.3629983, -0.2696713, -2.028355, 1, 1, 1, 1, 1,
-0.3623597, 1.863884, -0.964189, 1, 1, 1, 1, 1,
-0.3603659, -1.474749, -2.068286, 1, 1, 1, 1, 1,
-0.3589112, -0.6413076, -3.312708, 1, 1, 1, 1, 1,
-0.3569685, 1.727248, -0.7493503, 1, 1, 1, 1, 1,
-0.3509331, 0.206162, -0.4854467, 1, 1, 1, 1, 1,
-0.350529, -0.5448655, -3.192256, 1, 1, 1, 1, 1,
-0.3383289, 0.1821831, -0.2121663, 1, 1, 1, 1, 1,
-0.3320456, 1.412539, -0.32304, 1, 1, 1, 1, 1,
-0.3319081, 0.3107216, -1.200475, 0, 0, 1, 1, 1,
-0.3316072, 0.7899235, 0.4209845, 1, 0, 0, 1, 1,
-0.3304098, -0.5558453, -3.488635, 1, 0, 0, 1, 1,
-0.3299242, 0.4247746, 0.5723068, 1, 0, 0, 1, 1,
-0.3283089, 1.159923, -1.944327, 1, 0, 0, 1, 1,
-0.3253882, 0.3237062, -0.5629019, 1, 0, 0, 1, 1,
-0.3252393, 0.06971921, -0.376895, 0, 0, 0, 1, 1,
-0.324966, 1.485433, -0.2717972, 0, 0, 0, 1, 1,
-0.3194302, -0.5377833, -1.387279, 0, 0, 0, 1, 1,
-0.3193935, 1.965392, -1.73828, 0, 0, 0, 1, 1,
-0.3180271, -0.5776761, -2.807173, 0, 0, 0, 1, 1,
-0.3159845, -0.6014861, -1.974477, 0, 0, 0, 1, 1,
-0.3152996, -0.5710543, -2.319739, 0, 0, 0, 1, 1,
-0.3143584, -0.1865688, -2.466347, 1, 1, 1, 1, 1,
-0.3057349, -0.02559742, -2.477823, 1, 1, 1, 1, 1,
-0.3046985, 0.2402381, -0.2178104, 1, 1, 1, 1, 1,
-0.3020642, 1.203393, -1.054145, 1, 1, 1, 1, 1,
-0.2968363, 0.6307194, -0.4181864, 1, 1, 1, 1, 1,
-0.2948297, -0.9416136, -0.8272322, 1, 1, 1, 1, 1,
-0.2943854, -1.364418, -2.924739, 1, 1, 1, 1, 1,
-0.2929804, 0.2351982, -1.262259, 1, 1, 1, 1, 1,
-0.2927554, -1.221542, -1.297441, 1, 1, 1, 1, 1,
-0.2909004, -0.2975219, -0.8797228, 1, 1, 1, 1, 1,
-0.2883459, 0.5276917, -1.79083, 1, 1, 1, 1, 1,
-0.2854655, 0.1763981, -0.2299927, 1, 1, 1, 1, 1,
-0.2853227, -1.25915, -3.253347, 1, 1, 1, 1, 1,
-0.2851484, 0.6593487, 0.5758396, 1, 1, 1, 1, 1,
-0.2846648, 0.3919015, 0.8507924, 1, 1, 1, 1, 1,
-0.2808113, -2.853966, -2.237244, 0, 0, 1, 1, 1,
-0.2727604, -1.605011, -2.193024, 1, 0, 0, 1, 1,
-0.2721776, -0.3806381, -2.750929, 1, 0, 0, 1, 1,
-0.2687527, -0.2517416, -0.6665272, 1, 0, 0, 1, 1,
-0.2678201, -0.6514745, -2.107872, 1, 0, 0, 1, 1,
-0.2639732, -0.3279114, -2.482537, 1, 0, 0, 1, 1,
-0.2625376, 0.8897047, -1.013753, 0, 0, 0, 1, 1,
-0.2620378, -0.1776885, -1.984121, 0, 0, 0, 1, 1,
-0.2596199, 1.131984, 1.445073, 0, 0, 0, 1, 1,
-0.2582411, -0.5125111, -2.932128, 0, 0, 0, 1, 1,
-0.2579644, 0.5137, 0.797385, 0, 0, 0, 1, 1,
-0.2547194, 0.08978458, -0.3588426, 0, 0, 0, 1, 1,
-0.254589, -0.9281886, -1.786651, 0, 0, 0, 1, 1,
-0.254335, 2.041193, 1.644031, 1, 1, 1, 1, 1,
-0.2542754, -0.1417059, -1.313237, 1, 1, 1, 1, 1,
-0.2540912, 0.7016571, 0.7377996, 1, 1, 1, 1, 1,
-0.2516192, 1.612141, 0.6872304, 1, 1, 1, 1, 1,
-0.2515282, -0.4492565, -3.200361, 1, 1, 1, 1, 1,
-0.2474358, -0.05529008, -2.022937, 1, 1, 1, 1, 1,
-0.2411397, -0.1196148, -2.321659, 1, 1, 1, 1, 1,
-0.2367256, -0.4906858, -2.241079, 1, 1, 1, 1, 1,
-0.2354251, -1.5584, -4.714543, 1, 1, 1, 1, 1,
-0.2336234, -0.1649415, -1.549518, 1, 1, 1, 1, 1,
-0.2327884, -0.382875, -2.293692, 1, 1, 1, 1, 1,
-0.2261194, -1.265273, -3.941195, 1, 1, 1, 1, 1,
-0.2234501, -0.5911877, -3.128433, 1, 1, 1, 1, 1,
-0.2226123, -0.6936079, -3.118846, 1, 1, 1, 1, 1,
-0.2199901, 0.7454031, -0.08729246, 1, 1, 1, 1, 1,
-0.2192361, -0.2252676, -2.20931, 0, 0, 1, 1, 1,
-0.2187736, 1.924293, 0.3026514, 1, 0, 0, 1, 1,
-0.2168254, -0.7692855, -1.590925, 1, 0, 0, 1, 1,
-0.2154822, -0.9661719, -4.062498, 1, 0, 0, 1, 1,
-0.2139462, 1.424148, -0.001602201, 1, 0, 0, 1, 1,
-0.2134954, -1.013391, -2.849975, 1, 0, 0, 1, 1,
-0.2116996, -1.157753, -2.938624, 0, 0, 0, 1, 1,
-0.2029277, -0.5379011, -1.567274, 0, 0, 0, 1, 1,
-0.2028939, 1.283241, 0.1172953, 0, 0, 0, 1, 1,
-0.199646, 1.384625, 0.1214148, 0, 0, 0, 1, 1,
-0.198378, -1.665532, -2.272399, 0, 0, 0, 1, 1,
-0.197945, 0.3941653, -1.553229, 0, 0, 0, 1, 1,
-0.1973287, 2.189449, 0.4482334, 0, 0, 0, 1, 1,
-0.1951948, 1.297016, 0.2242777, 1, 1, 1, 1, 1,
-0.1944148, 1.144568, -1.042256, 1, 1, 1, 1, 1,
-0.1899289, 1.63236, 1.243171, 1, 1, 1, 1, 1,
-0.18971, -1.156484, -1.481897, 1, 1, 1, 1, 1,
-0.1877183, -0.6567489, -2.837658, 1, 1, 1, 1, 1,
-0.1863827, -0.2282747, -2.109483, 1, 1, 1, 1, 1,
-0.1860758, -0.2123974, -1.782372, 1, 1, 1, 1, 1,
-0.1843573, -0.7250145, -3.520202, 1, 1, 1, 1, 1,
-0.1827549, -1.453165, -2.133105, 1, 1, 1, 1, 1,
-0.1799065, 0.1208482, -1.130544, 1, 1, 1, 1, 1,
-0.1784807, -0.9419284, -2.053646, 1, 1, 1, 1, 1,
-0.1762454, -1.29903, -4.100492, 1, 1, 1, 1, 1,
-0.1743556, -1.202659, -2.631254, 1, 1, 1, 1, 1,
-0.1715018, -0.2506716, -2.641219, 1, 1, 1, 1, 1,
-0.1714684, 1.051526, -0.8937928, 1, 1, 1, 1, 1,
-0.1664271, -0.1073723, -1.53172, 0, 0, 1, 1, 1,
-0.1653298, 0.04560819, -3.116659, 1, 0, 0, 1, 1,
-0.1630344, 0.4995553, -1.113018, 1, 0, 0, 1, 1,
-0.1613121, 0.04141751, -0.1135111, 1, 0, 0, 1, 1,
-0.1547666, -0.6115935, -3.13684, 1, 0, 0, 1, 1,
-0.1526819, -0.4725613, -2.543921, 1, 0, 0, 1, 1,
-0.1469103, -0.2567125, -3.437989, 0, 0, 0, 1, 1,
-0.1458601, -0.4517214, -3.274682, 0, 0, 0, 1, 1,
-0.1410645, -0.2466924, -2.503113, 0, 0, 0, 1, 1,
-0.1394897, -1.19117, -3.323844, 0, 0, 0, 1, 1,
-0.1387517, -1.540383, -2.944661, 0, 0, 0, 1, 1,
-0.1357235, -1.444016, -2.146143, 0, 0, 0, 1, 1,
-0.1354141, 1.683361, 2.310667, 0, 0, 0, 1, 1,
-0.1265739, -1.987727, -2.753345, 1, 1, 1, 1, 1,
-0.1261431, 0.1347364, -0.4832886, 1, 1, 1, 1, 1,
-0.1248435, -0.3838891, -4.314914, 1, 1, 1, 1, 1,
-0.1248226, -0.9815689, -2.277867, 1, 1, 1, 1, 1,
-0.1231779, -1.546816, -4.747587, 1, 1, 1, 1, 1,
-0.1208768, 0.8530309, -1.526071, 1, 1, 1, 1, 1,
-0.1153979, -0.1469851, -3.26208, 1, 1, 1, 1, 1,
-0.1142538, 0.5263386, 0.5507598, 1, 1, 1, 1, 1,
-0.1131814, 1.987336, 0.7184201, 1, 1, 1, 1, 1,
-0.09533294, 0.2260836, -0.8469982, 1, 1, 1, 1, 1,
-0.09523156, -0.7519234, -1.550532, 1, 1, 1, 1, 1,
-0.09220631, -0.7187997, -1.938218, 1, 1, 1, 1, 1,
-0.09139603, -0.2317749, -2.731447, 1, 1, 1, 1, 1,
-0.08725912, -0.1992696, -3.638074, 1, 1, 1, 1, 1,
-0.08657163, 0.4684067, 0.1235472, 1, 1, 1, 1, 1,
-0.08408991, 0.9712957, -0.6930889, 0, 0, 1, 1, 1,
-0.08209726, 0.5770734, -0.467571, 1, 0, 0, 1, 1,
-0.0816168, 0.1925111, -0.4600072, 1, 0, 0, 1, 1,
-0.07671661, 0.1786832, -0.4455492, 1, 0, 0, 1, 1,
-0.07303386, -1.672052, -2.966687, 1, 0, 0, 1, 1,
-0.06809337, 0.01959245, -0.5875522, 1, 0, 0, 1, 1,
-0.06751045, -2.264036, -2.91348, 0, 0, 0, 1, 1,
-0.06724947, 1.052705, 0.2151093, 0, 0, 0, 1, 1,
-0.05255366, -1.422419, -2.273195, 0, 0, 0, 1, 1,
-0.05140216, 0.2432306, -1.512242, 0, 0, 0, 1, 1,
-0.04907617, 0.8617779, 0.3329019, 0, 0, 0, 1, 1,
-0.04853024, 1.363138, 0.1117888, 0, 0, 0, 1, 1,
-0.04215449, -1.735336, -2.302126, 0, 0, 0, 1, 1,
-0.0384153, 1.095123, -1.138411, 1, 1, 1, 1, 1,
-0.03818472, 0.8427942, 1.770484, 1, 1, 1, 1, 1,
-0.027983, -0.5719451, -3.729517, 1, 1, 1, 1, 1,
-0.02760968, -1.334165, -3.461931, 1, 1, 1, 1, 1,
-0.02622176, 0.1685011, -1.30514, 1, 1, 1, 1, 1,
-0.02560047, 0.2535256, 1.162847, 1, 1, 1, 1, 1,
-0.02243328, 1.399399, -0.8424886, 1, 1, 1, 1, 1,
-0.0220471, -0.3187799, -1.76357, 1, 1, 1, 1, 1,
-0.02055723, 0.1921466, -1.595918, 1, 1, 1, 1, 1,
-0.01922103, 1.324131, 1.805876, 1, 1, 1, 1, 1,
-0.01780044, -2.05187, -1.803154, 1, 1, 1, 1, 1,
-0.01668186, -1.036818, -2.372804, 1, 1, 1, 1, 1,
-0.0159636, 0.211513, -1.293251, 1, 1, 1, 1, 1,
-0.01254122, -0.2372776, -2.678016, 1, 1, 1, 1, 1,
-0.01175381, -0.7791088, -5.282356, 1, 1, 1, 1, 1,
-0.007765851, -0.8695628, -2.954184, 0, 0, 1, 1, 1,
-0.005235254, 1.106761, -0.7682388, 1, 0, 0, 1, 1,
-0.004029348, 0.01343634, -1.240489, 1, 0, 0, 1, 1,
0.0007374599, -0.03698084, 4.004309, 1, 0, 0, 1, 1,
0.001125983, 0.7137251, -0.8895258, 1, 0, 0, 1, 1,
0.004450837, 0.6565069, 1.181677, 1, 0, 0, 1, 1,
0.005003647, 1.071634, 0.4594323, 0, 0, 0, 1, 1,
0.007947206, -1.064817, 2.394707, 0, 0, 0, 1, 1,
0.01003328, -0.02043623, 3.250895, 0, 0, 0, 1, 1,
0.0113977, -0.2939842, 2.747522, 0, 0, 0, 1, 1,
0.02826903, -1.12827, 2.465587, 0, 0, 0, 1, 1,
0.02878514, -1.692697, 3.01482, 0, 0, 0, 1, 1,
0.03068193, 0.06643622, -1.584059, 0, 0, 0, 1, 1,
0.03353244, -0.2404984, 4.060513, 1, 1, 1, 1, 1,
0.03453578, -0.1238043, 3.27456, 1, 1, 1, 1, 1,
0.03772553, -0.1507092, 4.060469, 1, 1, 1, 1, 1,
0.04083316, -1.003567, 3.577111, 1, 1, 1, 1, 1,
0.04981251, -1.58576, 2.891931, 1, 1, 1, 1, 1,
0.05186086, -0.4545576, 0.3504019, 1, 1, 1, 1, 1,
0.05221144, -0.310152, 3.714626, 1, 1, 1, 1, 1,
0.05229908, -0.3478073, 3.381633, 1, 1, 1, 1, 1,
0.05294487, 1.390867, -1.213495, 1, 1, 1, 1, 1,
0.05847883, -0.1047144, 2.014498, 1, 1, 1, 1, 1,
0.05903694, 0.3543416, 0.9451104, 1, 1, 1, 1, 1,
0.06260788, -1.169254, 2.792894, 1, 1, 1, 1, 1,
0.06331751, 1.495768, -0.8209933, 1, 1, 1, 1, 1,
0.0638478, -1.543756, 2.92956, 1, 1, 1, 1, 1,
0.06445516, 0.6025534, 0.3325319, 1, 1, 1, 1, 1,
0.06492292, -1.055214, 2.245465, 0, 0, 1, 1, 1,
0.06643295, 1.132677, 1.247229, 1, 0, 0, 1, 1,
0.06653994, -0.3388738, 1.778856, 1, 0, 0, 1, 1,
0.07079747, 0.5436904, -2.614587, 1, 0, 0, 1, 1,
0.07413819, -1.107163, 2.987964, 1, 0, 0, 1, 1,
0.0749685, -0.8282459, 3.202414, 1, 0, 0, 1, 1,
0.07537279, -1.267438, 1.062914, 0, 0, 0, 1, 1,
0.07540591, 0.388635, 0.4253381, 0, 0, 0, 1, 1,
0.07943961, -1.448515, 4.177964, 0, 0, 0, 1, 1,
0.08019157, -1.611845, 2.905458, 0, 0, 0, 1, 1,
0.08242879, 1.718902, 1.189898, 0, 0, 0, 1, 1,
0.08495852, 0.8506821, 1.371557, 0, 0, 0, 1, 1,
0.08512896, -1.023942, 1.813669, 0, 0, 0, 1, 1,
0.08787684, -0.6303979, 3.23209, 1, 1, 1, 1, 1,
0.09269732, -0.5567673, 1.272651, 1, 1, 1, 1, 1,
0.09530468, 0.5333787, 0.8961173, 1, 1, 1, 1, 1,
0.09716239, -1.151873, 1.621876, 1, 1, 1, 1, 1,
0.09921879, -0.04862199, 0.5716633, 1, 1, 1, 1, 1,
0.09994527, -0.5098657, 1.342549, 1, 1, 1, 1, 1,
0.1100645, -1.583652, 2.737557, 1, 1, 1, 1, 1,
0.1108972, 1.466954, -2.683712, 1, 1, 1, 1, 1,
0.1146267, -2.145408, 3.905463, 1, 1, 1, 1, 1,
0.1163786, 1.046963, -0.2226655, 1, 1, 1, 1, 1,
0.1170465, 0.8864593, -1.196554, 1, 1, 1, 1, 1,
0.1183588, -1.014317, 4.805738, 1, 1, 1, 1, 1,
0.1206869, 0.3276921, 0.5175266, 1, 1, 1, 1, 1,
0.1220642, -1.526152, 4.567445, 1, 1, 1, 1, 1,
0.1224128, 1.11475, -1.645403, 1, 1, 1, 1, 1,
0.1235221, -0.09412558, 1.263959, 0, 0, 1, 1, 1,
0.1252241, 0.7916488, 1.435228, 1, 0, 0, 1, 1,
0.1316857, 1.150159, 1.059539, 1, 0, 0, 1, 1,
0.1331385, -0.1066238, 3.593128, 1, 0, 0, 1, 1,
0.1460462, 0.8531901, -0.2468915, 1, 0, 0, 1, 1,
0.1492922, -1.027504, 1.425888, 1, 0, 0, 1, 1,
0.1548799, 1.293344, -0.7646881, 0, 0, 0, 1, 1,
0.1579133, -0.680533, 2.968772, 0, 0, 0, 1, 1,
0.1588956, -0.2193713, 2.448855, 0, 0, 0, 1, 1,
0.1619383, -1.442867, 2.224477, 0, 0, 0, 1, 1,
0.1654579, 0.5683887, -0.7819763, 0, 0, 0, 1, 1,
0.1667161, -0.814056, 1.522277, 0, 0, 0, 1, 1,
0.1674706, 0.1422691, 2.656429, 0, 0, 0, 1, 1,
0.1714585, -1.96946, 4.466679, 1, 1, 1, 1, 1,
0.1737562, 0.06644051, 2.738792, 1, 1, 1, 1, 1,
0.1813004, -0.153841, 1.557916, 1, 1, 1, 1, 1,
0.1813589, 0.4809196, -1.065922, 1, 1, 1, 1, 1,
0.1866232, 1.642469, -0.9837948, 1, 1, 1, 1, 1,
0.1879328, -0.2259376, 2.848337, 1, 1, 1, 1, 1,
0.1895348, -3.095797, 4.071303, 1, 1, 1, 1, 1,
0.191951, 0.7980448, -0.529794, 1, 1, 1, 1, 1,
0.2033381, -1.084536, 3.3146, 1, 1, 1, 1, 1,
0.2035739, 0.9427624, -0.5476411, 1, 1, 1, 1, 1,
0.2070866, 1.183807, 1.935305, 1, 1, 1, 1, 1,
0.2076513, -1.783891, 2.736104, 1, 1, 1, 1, 1,
0.2089135, -1.134782, 2.834852, 1, 1, 1, 1, 1,
0.2099099, -0.7718977, 2.742642, 1, 1, 1, 1, 1,
0.2116856, 0.3694796, 0.4288696, 1, 1, 1, 1, 1,
0.2216417, -1.113084, 4.064952, 0, 0, 1, 1, 1,
0.2233056, -0.445173, 2.318958, 1, 0, 0, 1, 1,
0.2238916, 2.632282, 0.7701374, 1, 0, 0, 1, 1,
0.2242681, -0.3534742, 3.697331, 1, 0, 0, 1, 1,
0.2254667, -0.3355191, 2.083381, 1, 0, 0, 1, 1,
0.2259744, 0.3028983, 0.2470372, 1, 0, 0, 1, 1,
0.2263513, 0.01176996, -0.376225, 0, 0, 0, 1, 1,
0.2288982, -1.261375, 1.773579, 0, 0, 0, 1, 1,
0.2376371, 1.857032, 1.752773, 0, 0, 0, 1, 1,
0.2454377, -0.2293622, 2.485141, 0, 0, 0, 1, 1,
0.2482374, 1.631074, 0.1185544, 0, 0, 0, 1, 1,
0.2482618, -0.9367472, 5.18317, 0, 0, 0, 1, 1,
0.2488146, 0.6610585, -0.6019463, 0, 0, 0, 1, 1,
0.2520844, 0.1126658, 1.580791, 1, 1, 1, 1, 1,
0.2539584, 0.08681314, 2.142849, 1, 1, 1, 1, 1,
0.2554562, 1.171083, 0.7248836, 1, 1, 1, 1, 1,
0.259178, 1.907114, -1.554226, 1, 1, 1, 1, 1,
0.264468, 1.11445, -0.8050618, 1, 1, 1, 1, 1,
0.2680726, -0.004916193, 2.051609, 1, 1, 1, 1, 1,
0.269922, -0.007149163, 2.040173, 1, 1, 1, 1, 1,
0.2758459, 1.482082, 1.920112, 1, 1, 1, 1, 1,
0.2785697, 1.644586, 2.220556, 1, 1, 1, 1, 1,
0.279054, 0.9032118, 1.713873, 1, 1, 1, 1, 1,
0.2846417, -0.665324, 4.273856, 1, 1, 1, 1, 1,
0.284924, -0.9494716, 2.476209, 1, 1, 1, 1, 1,
0.2880698, 2.073158, -0.8328372, 1, 1, 1, 1, 1,
0.2881743, 0.7363086, -0.4719785, 1, 1, 1, 1, 1,
0.2892976, 0.2400711, 1.50797, 1, 1, 1, 1, 1,
0.2901083, 1.059089, 1.130365, 0, 0, 1, 1, 1,
0.2902225, -1.219061, 3.556491, 1, 0, 0, 1, 1,
0.2933284, -0.2921545, 3.00538, 1, 0, 0, 1, 1,
0.2960123, -2.319731, 3.589438, 1, 0, 0, 1, 1,
0.2972928, -0.5410976, 3.820939, 1, 0, 0, 1, 1,
0.2985294, 0.4000388, 1.293629, 1, 0, 0, 1, 1,
0.2997704, 0.04056422, 1.03235, 0, 0, 0, 1, 1,
0.3012186, -1.960828, 1.484453, 0, 0, 0, 1, 1,
0.3016519, -1.045063, 3.064842, 0, 0, 0, 1, 1,
0.3039552, 0.4254816, 0.3479111, 0, 0, 0, 1, 1,
0.3064409, -0.8822515, 3.271387, 0, 0, 0, 1, 1,
0.3112966, -0.1011562, 1.23767, 0, 0, 0, 1, 1,
0.3153995, -0.8718696, 1.479915, 0, 0, 0, 1, 1,
0.316949, -2.136523, 4.688979, 1, 1, 1, 1, 1,
0.3174382, 1.646932, -0.4390466, 1, 1, 1, 1, 1,
0.3255749, 1.006924, -0.4448676, 1, 1, 1, 1, 1,
0.3257758, 1.30393, 0.5564623, 1, 1, 1, 1, 1,
0.3284585, 0.1014756, 0.1290694, 1, 1, 1, 1, 1,
0.3310022, -0.05892556, 2.494423, 1, 1, 1, 1, 1,
0.3341219, -0.4878736, 1.246799, 1, 1, 1, 1, 1,
0.3346353, 0.9448159, 0.7070149, 1, 1, 1, 1, 1,
0.3349679, -0.6230426, 2.730344, 1, 1, 1, 1, 1,
0.3358101, -0.8215685, 1.838315, 1, 1, 1, 1, 1,
0.3367614, -1.569298, 1.962115, 1, 1, 1, 1, 1,
0.3391749, -0.8918261, 0.9535603, 1, 1, 1, 1, 1,
0.3392644, -1.179588, 2.276419, 1, 1, 1, 1, 1,
0.3407573, -0.2779157, 1.66728, 1, 1, 1, 1, 1,
0.3488623, 1.474936, 2.56998, 1, 1, 1, 1, 1,
0.3516482, -0.4379148, 2.448716, 0, 0, 1, 1, 1,
0.3530016, -0.9572975, 2.688467, 1, 0, 0, 1, 1,
0.3671434, 0.1565509, 1.87845, 1, 0, 0, 1, 1,
0.369983, -0.1112867, 2.260798, 1, 0, 0, 1, 1,
0.3775273, 0.4978543, 1.358865, 1, 0, 0, 1, 1,
0.3814428, 0.6179023, 0.6396834, 1, 0, 0, 1, 1,
0.3835592, -0.5113487, 2.189718, 0, 0, 0, 1, 1,
0.3858038, -0.0703795, 3.091972, 0, 0, 0, 1, 1,
0.386839, 1.768952, -1.389054, 0, 0, 0, 1, 1,
0.3896795, 1.13364, 1.217763, 0, 0, 0, 1, 1,
0.3944863, -0.2047681, 1.939115, 0, 0, 0, 1, 1,
0.3949759, -0.6647521, 1.482339, 0, 0, 0, 1, 1,
0.3971851, -0.3051642, 2.611649, 0, 0, 0, 1, 1,
0.3997887, 0.1118541, 2.52755, 1, 1, 1, 1, 1,
0.3999325, -1.380684, 2.895415, 1, 1, 1, 1, 1,
0.4012053, 0.8085768, 0.5856271, 1, 1, 1, 1, 1,
0.4026311, -0.2211089, 1.342304, 1, 1, 1, 1, 1,
0.4067681, 2.436212, -0.6404151, 1, 1, 1, 1, 1,
0.4071026, 0.01162793, 2.265201, 1, 1, 1, 1, 1,
0.4130228, 0.6261047, 1.535484, 1, 1, 1, 1, 1,
0.4143263, 0.4070817, 1.501599, 1, 1, 1, 1, 1,
0.4146034, -0.4550387, 1.468722, 1, 1, 1, 1, 1,
0.4161716, -0.469502, 2.059982, 1, 1, 1, 1, 1,
0.4211821, -1.447239, 1.736645, 1, 1, 1, 1, 1,
0.4227291, -0.672345, 2.329419, 1, 1, 1, 1, 1,
0.4268963, -0.6473715, 3.339228, 1, 1, 1, 1, 1,
0.4279776, -0.1580526, 3.681984, 1, 1, 1, 1, 1,
0.4289379, 1.847357, 0.5932429, 1, 1, 1, 1, 1,
0.4314758, -0.4786167, 2.826716, 0, 0, 1, 1, 1,
0.4315344, -0.6875675, 3.075729, 1, 0, 0, 1, 1,
0.4321212, 0.9108859, -1.208186, 1, 0, 0, 1, 1,
0.4331969, -0.3436224, 3.277411, 1, 0, 0, 1, 1,
0.4355101, -0.08293953, 2.942707, 1, 0, 0, 1, 1,
0.438995, 0.08332047, 1.545787, 1, 0, 0, 1, 1,
0.4408205, 0.6627676, 3.137879, 0, 0, 0, 1, 1,
0.4452279, 0.1088245, 3.003256, 0, 0, 0, 1, 1,
0.4475304, -0.4313258, 3.013457, 0, 0, 0, 1, 1,
0.4494316, -0.08185538, 1.581368, 0, 0, 0, 1, 1,
0.4536229, 1.358731, -0.6232014, 0, 0, 0, 1, 1,
0.4556738, 0.9769539, -0.03904591, 0, 0, 0, 1, 1,
0.4561292, 1.784023, -1.611182, 0, 0, 0, 1, 1,
0.4651396, -0.8153268, 3.606974, 1, 1, 1, 1, 1,
0.4681474, 0.8711769, 1.521451, 1, 1, 1, 1, 1,
0.471783, 1.225368, 0.4746468, 1, 1, 1, 1, 1,
0.4731942, 1.572814, 1.614576, 1, 1, 1, 1, 1,
0.4876231, -0.8059134, 1.708537, 1, 1, 1, 1, 1,
0.488367, -0.6327699, 3.540372, 1, 1, 1, 1, 1,
0.4936499, -1.899337, 2.243507, 1, 1, 1, 1, 1,
0.4995418, 1.779405, 1.26744, 1, 1, 1, 1, 1,
0.5013844, 0.4179549, -0.05692961, 1, 1, 1, 1, 1,
0.5051969, 1.507091, -1.668268, 1, 1, 1, 1, 1,
0.50814, 0.07078981, -1.264763, 1, 1, 1, 1, 1,
0.5103399, -0.2131014, 3.127576, 1, 1, 1, 1, 1,
0.5118564, -0.405889, 2.305358, 1, 1, 1, 1, 1,
0.5158639, 1.720986, 1.762013, 1, 1, 1, 1, 1,
0.5161582, -0.8318008, 2.59549, 1, 1, 1, 1, 1,
0.5181628, -1.182541, 2.144711, 0, 0, 1, 1, 1,
0.5297575, 1.075035, 0.7379254, 1, 0, 0, 1, 1,
0.5318245, 0.5953419, 1.030071, 1, 0, 0, 1, 1,
0.5368572, -0.3499283, 2.074601, 1, 0, 0, 1, 1,
0.5368757, 1.851235, -0.1941773, 1, 0, 0, 1, 1,
0.5375192, 1.264373, 1.554574, 1, 0, 0, 1, 1,
0.5400566, -1.222561, 1.589223, 0, 0, 0, 1, 1,
0.5401677, 1.190716, 0.975588, 0, 0, 0, 1, 1,
0.5419089, -0.9313711, 2.528982, 0, 0, 0, 1, 1,
0.5488464, 0.3256911, 0.9875237, 0, 0, 0, 1, 1,
0.5510497, 0.6403324, 0.462718, 0, 0, 0, 1, 1,
0.5594022, -0.7739331, 1.370342, 0, 0, 0, 1, 1,
0.560349, -1.08597, 2.523234, 0, 0, 0, 1, 1,
0.5630785, -1.588514, 5.72793, 1, 1, 1, 1, 1,
0.5673674, 0.3073259, 2.145873, 1, 1, 1, 1, 1,
0.5771316, 0.1114671, 2.347289, 1, 1, 1, 1, 1,
0.5786863, -0.2658482, 3.437717, 1, 1, 1, 1, 1,
0.59103, -0.5484678, 2.628329, 1, 1, 1, 1, 1,
0.5956203, 1.085954, -0.1982399, 1, 1, 1, 1, 1,
0.5972844, -0.9353477, 4.062603, 1, 1, 1, 1, 1,
0.6001449, -0.2717824, 2.903317, 1, 1, 1, 1, 1,
0.6011079, -0.181785, 1.046161, 1, 1, 1, 1, 1,
0.6013186, -2.12178, 5.263975, 1, 1, 1, 1, 1,
0.601399, 0.04794122, 1.091006, 1, 1, 1, 1, 1,
0.6037623, -0.03573775, 1.517345, 1, 1, 1, 1, 1,
0.6101999, -0.03888088, 2.955976, 1, 1, 1, 1, 1,
0.6105851, -0.1610257, 2.809782, 1, 1, 1, 1, 1,
0.6115425, 0.1315109, 0.9503383, 1, 1, 1, 1, 1,
0.6131692, -2.608541, 3.245942, 0, 0, 1, 1, 1,
0.6139521, -1.670669, 2.905642, 1, 0, 0, 1, 1,
0.6196386, -0.891494, 1.487584, 1, 0, 0, 1, 1,
0.6210189, -2.130594, 0.5791769, 1, 0, 0, 1, 1,
0.6225362, 1.124353, 0.1757854, 1, 0, 0, 1, 1,
0.6227952, 2.539204, 0.04621781, 1, 0, 0, 1, 1,
0.6247958, -1.085169, 2.070724, 0, 0, 0, 1, 1,
0.630421, -0.9814346, 2.476329, 0, 0, 0, 1, 1,
0.63382, 0.3081381, 0.9562863, 0, 0, 0, 1, 1,
0.6353011, -2.127981, 1.675111, 0, 0, 0, 1, 1,
0.636082, 0.05200536, 2.245276, 0, 0, 0, 1, 1,
0.6367518, 1.1911, 2.059875, 0, 0, 0, 1, 1,
0.6384859, -1.275133, 2.172373, 0, 0, 0, 1, 1,
0.6405184, -0.3407143, 1.209777, 1, 1, 1, 1, 1,
0.64177, -0.164196, 2.16098, 1, 1, 1, 1, 1,
0.6454292, 0.3030837, 2.388613, 1, 1, 1, 1, 1,
0.6482064, 0.78083, 3.192129, 1, 1, 1, 1, 1,
0.6492808, 0.7623045, 2.483347, 1, 1, 1, 1, 1,
0.6502666, -0.4369448, 2.508992, 1, 1, 1, 1, 1,
0.6502947, 0.2189216, -0.2915487, 1, 1, 1, 1, 1,
0.6519669, -0.5157616, 3.643053, 1, 1, 1, 1, 1,
0.6542951, 2.783206, -0.3351073, 1, 1, 1, 1, 1,
0.6600696, 0.13783, 1.236078, 1, 1, 1, 1, 1,
0.6609023, -0.1783124, 1.480051, 1, 1, 1, 1, 1,
0.6612481, 0.2484967, 2.734282, 1, 1, 1, 1, 1,
0.6639098, 0.6634821, 0.6431623, 1, 1, 1, 1, 1,
0.665037, -0.05665865, 3.110073, 1, 1, 1, 1, 1,
0.6659307, 0.06620573, 0.4711481, 1, 1, 1, 1, 1,
0.6662431, -0.4792278, 4.284041, 0, 0, 1, 1, 1,
0.6701182, 0.5955452, -0.1454766, 1, 0, 0, 1, 1,
0.6710058, -1.811977, 1.685042, 1, 0, 0, 1, 1,
0.6717535, -0.7259536, 2.147665, 1, 0, 0, 1, 1,
0.6722642, 1.599483, 0.1070165, 1, 0, 0, 1, 1,
0.6744044, 0.7201656, -5.79301e-05, 1, 0, 0, 1, 1,
0.6784351, 1.051977, 1.504423, 0, 0, 0, 1, 1,
0.6817433, 0.8529143, 1.82012, 0, 0, 0, 1, 1,
0.6872746, 1.588746, 0.4331279, 0, 0, 0, 1, 1,
0.6875573, -1.925179, 2.863414, 0, 0, 0, 1, 1,
0.6916956, -0.1978048, 1.896204, 0, 0, 0, 1, 1,
0.6919997, 1.32618, 0.6471574, 0, 0, 0, 1, 1,
0.6920607, 0.6537529, 0.2036779, 0, 0, 0, 1, 1,
0.6948832, -0.5092173, 3.197807, 1, 1, 1, 1, 1,
0.7031431, 0.5981221, 1.0744, 1, 1, 1, 1, 1,
0.7078742, -0.09047711, 2.236403, 1, 1, 1, 1, 1,
0.7085727, 1.052403, 1.976887, 1, 1, 1, 1, 1,
0.7094195, -0.8945241, 1.580266, 1, 1, 1, 1, 1,
0.7099132, 1.874263, 1.71556, 1, 1, 1, 1, 1,
0.7142105, 2.026174, 1.120684, 1, 1, 1, 1, 1,
0.717697, 1.152235, 0.8633097, 1, 1, 1, 1, 1,
0.721212, 2.006056, 0.1979471, 1, 1, 1, 1, 1,
0.725968, 0.6152331, 1.881835, 1, 1, 1, 1, 1,
0.7282184, 0.01343397, 2.080736, 1, 1, 1, 1, 1,
0.7342597, -0.04071876, 1.287871, 1, 1, 1, 1, 1,
0.7347841, 0.8941528, 0.07315072, 1, 1, 1, 1, 1,
0.739576, 0.9653019, -1.033266, 1, 1, 1, 1, 1,
0.7406992, -0.3024644, 1.925202, 1, 1, 1, 1, 1,
0.75022, -0.6077406, 2.212329, 0, 0, 1, 1, 1,
0.7535723, -0.6201726, 1.1627, 1, 0, 0, 1, 1,
0.7541497, -0.1713144, 2.628008, 1, 0, 0, 1, 1,
0.7554561, 1.922962, 3.284048, 1, 0, 0, 1, 1,
0.7610709, -1.126524, 2.902707, 1, 0, 0, 1, 1,
0.7626147, -1.037168, 3.257137, 1, 0, 0, 1, 1,
0.7812423, -0.83085, 1.830987, 0, 0, 0, 1, 1,
0.7847878, -0.5255739, 2.877475, 0, 0, 0, 1, 1,
0.787318, -0.7101995, 3.319349, 0, 0, 0, 1, 1,
0.7886077, 1.714105, -0.4323947, 0, 0, 0, 1, 1,
0.7903429, 0.5224895, 0.4577519, 0, 0, 0, 1, 1,
0.7911368, 0.4043444, 1.615883, 0, 0, 0, 1, 1,
0.7990224, -0.2876019, 0.7648625, 0, 0, 0, 1, 1,
0.8099496, -0.6895142, 3.21125, 1, 1, 1, 1, 1,
0.817228, -0.01285779, 2.06601, 1, 1, 1, 1, 1,
0.8218642, -0.2053542, 1.165541, 1, 1, 1, 1, 1,
0.8298728, -0.6101509, 1.422902, 1, 1, 1, 1, 1,
0.8314028, 0.1060093, 2.361175, 1, 1, 1, 1, 1,
0.8326988, -0.2126258, 3.216079, 1, 1, 1, 1, 1,
0.8447077, -0.0918595, 1.996962, 1, 1, 1, 1, 1,
0.8457559, 0.9900968, 0.7968297, 1, 1, 1, 1, 1,
0.8483092, 1.629441, -0.4716961, 1, 1, 1, 1, 1,
0.8493678, -0.7466531, 0.9057109, 1, 1, 1, 1, 1,
0.8510301, 1.557565, -1.709152, 1, 1, 1, 1, 1,
0.8582391, 1.976315, -0.4833887, 1, 1, 1, 1, 1,
0.8674746, -1.567072, 1.695957, 1, 1, 1, 1, 1,
0.8691395, 0.1167088, 1.066123, 1, 1, 1, 1, 1,
0.8702524, -0.4384577, 2.965781, 1, 1, 1, 1, 1,
0.8736059, 1.586366, 1.490653, 0, 0, 1, 1, 1,
0.8842006, 1.96035, 1.574643, 1, 0, 0, 1, 1,
0.890495, -0.2451913, 1.916453, 1, 0, 0, 1, 1,
0.8910555, -1.82057, 3.20743, 1, 0, 0, 1, 1,
0.891552, 0.5891926, 0.4264522, 1, 0, 0, 1, 1,
0.892064, 0.8543755, 0.03254745, 1, 0, 0, 1, 1,
0.895719, 0.6209821, -1.217715, 0, 0, 0, 1, 1,
0.8977648, -0.2301852, 1.471009, 0, 0, 0, 1, 1,
0.8989538, 0.5400464, 1.220017, 0, 0, 0, 1, 1,
0.903378, 0.3136842, 3.636742, 0, 0, 0, 1, 1,
0.9095863, 0.2561663, 1.246548, 0, 0, 0, 1, 1,
0.9132308, -2.409375, 2.779068, 0, 0, 0, 1, 1,
0.914361, 2.007482, -0.7772085, 0, 0, 0, 1, 1,
0.9262745, 1.052839, 0.7660153, 1, 1, 1, 1, 1,
0.9269489, 0.3974237, 1.132972, 1, 1, 1, 1, 1,
0.9294873, 0.3455411, 2.193868, 1, 1, 1, 1, 1,
0.9340333, 0.2578821, 2.542951, 1, 1, 1, 1, 1,
0.9365548, -0.6498324, 3.471265, 1, 1, 1, 1, 1,
0.9491245, 0.1900085, 1.637199, 1, 1, 1, 1, 1,
0.94915, 0.00392198, 2.105285, 1, 1, 1, 1, 1,
0.9525574, 1.108283, -0.8924437, 1, 1, 1, 1, 1,
0.9529082, 1.266116, -0.5488035, 1, 1, 1, 1, 1,
0.9561062, 1.350537, -0.2969148, 1, 1, 1, 1, 1,
0.9701142, -2.042678, 1.422667, 1, 1, 1, 1, 1,
0.9721397, 0.3253637, 2.543881, 1, 1, 1, 1, 1,
0.9758478, 0.6496136, 2.535527, 1, 1, 1, 1, 1,
0.991299, 2.330851, 0.8315472, 1, 1, 1, 1, 1,
0.9918034, 0.6070383, 0.6291599, 1, 1, 1, 1, 1,
0.9933825, -0.2439764, 2.219226, 0, 0, 1, 1, 1,
1.003596, -0.2328134, 2.55187, 1, 0, 0, 1, 1,
1.010481, 1.438606, 0.2006284, 1, 0, 0, 1, 1,
1.019913, 0.007250736, 0.9051868, 1, 0, 0, 1, 1,
1.02578, 1.952466, -0.6786345, 1, 0, 0, 1, 1,
1.038187, -1.175844, 4.477267, 1, 0, 0, 1, 1,
1.043478, 1.043028, -0.288646, 0, 0, 0, 1, 1,
1.054009, -0.673761, 3.195002, 0, 0, 0, 1, 1,
1.05612, -0.4811072, 3.202743, 0, 0, 0, 1, 1,
1.058022, -1.691319, 1.680091, 0, 0, 0, 1, 1,
1.058196, -0.2224367, 1.960379, 0, 0, 0, 1, 1,
1.058276, 1.318341, -0.2048327, 0, 0, 0, 1, 1,
1.070896, -2.02535, 2.763206, 0, 0, 0, 1, 1,
1.071387, -0.4461017, 1.839671, 1, 1, 1, 1, 1,
1.079935, -1.644566, 1.174228, 1, 1, 1, 1, 1,
1.08426, 0.04890434, 2.215552, 1, 1, 1, 1, 1,
1.090553, -0.1036225, 0.7128487, 1, 1, 1, 1, 1,
1.092475, 0.7662367, 1.662125, 1, 1, 1, 1, 1,
1.095526, 1.092826, 0.7445602, 1, 1, 1, 1, 1,
1.096004, 0.1096261, 1.251556, 1, 1, 1, 1, 1,
1.099893, 1.16943, 1.739906, 1, 1, 1, 1, 1,
1.106367, 1.461174, 0.9863276, 1, 1, 1, 1, 1,
1.107954, -0.8480346, 1.782562, 1, 1, 1, 1, 1,
1.109762, 0.4675997, 0.9900725, 1, 1, 1, 1, 1,
1.109997, 0.8338856, 1.241742, 1, 1, 1, 1, 1,
1.113141, -0.6095563, 1.018946, 1, 1, 1, 1, 1,
1.114838, -0.4137378, 1.124136, 1, 1, 1, 1, 1,
1.115416, -0.5727066, 3.295741, 1, 1, 1, 1, 1,
1.119453, 0.6342337, 0.4196874, 0, 0, 1, 1, 1,
1.125229, 0.7421545, 2.530245, 1, 0, 0, 1, 1,
1.12541, 0.2374315, 3.567083, 1, 0, 0, 1, 1,
1.13245, -0.6749279, 1.091393, 1, 0, 0, 1, 1,
1.143457, -0.9469141, 1.427585, 1, 0, 0, 1, 1,
1.146608, 0.184259, 0.251824, 1, 0, 0, 1, 1,
1.146692, 1.300546, -0.90967, 0, 0, 0, 1, 1,
1.14932, -0.1373819, 0.3514565, 0, 0, 0, 1, 1,
1.156024, 0.1673347, 1.536803, 0, 0, 0, 1, 1,
1.157468, 0.2023008, 2.446097, 0, 0, 0, 1, 1,
1.15777, 2.595949, 1.362047, 0, 0, 0, 1, 1,
1.171416, -0.4054108, 3.426216, 0, 0, 0, 1, 1,
1.171692, -0.3894652, 1.454534, 0, 0, 0, 1, 1,
1.181073, -0.7787864, 2.602144, 1, 1, 1, 1, 1,
1.186298, 0.6927754, 0.4165309, 1, 1, 1, 1, 1,
1.188299, -0.4628426, 0.6467547, 1, 1, 1, 1, 1,
1.192999, -1.283952, 1.178438, 1, 1, 1, 1, 1,
1.196299, -1.295023, 3.13088, 1, 1, 1, 1, 1,
1.204625, 0.07658968, 0.8948985, 1, 1, 1, 1, 1,
1.211143, -1.080101, 1.905832, 1, 1, 1, 1, 1,
1.215562, 1.293389, -0.762387, 1, 1, 1, 1, 1,
1.236792, -1.380285, 2.189249, 1, 1, 1, 1, 1,
1.237145, -0.7995165, 4.414186, 1, 1, 1, 1, 1,
1.239498, -0.4449285, 1.493358, 1, 1, 1, 1, 1,
1.24478, -0.8083975, 1.471581, 1, 1, 1, 1, 1,
1.25441, 0.6865583, 1.354555, 1, 1, 1, 1, 1,
1.274219, 0.6035973, 1.234091, 1, 1, 1, 1, 1,
1.274903, -1.127458, 2.798858, 1, 1, 1, 1, 1,
1.286704, -0.1388662, -0.1182035, 0, 0, 1, 1, 1,
1.299051, 1.343195, 0.04468387, 1, 0, 0, 1, 1,
1.303123, 1.410947, 3.058546, 1, 0, 0, 1, 1,
1.310956, -0.4298744, 1.926017, 1, 0, 0, 1, 1,
1.311114, 0.7696018, 1.439921, 1, 0, 0, 1, 1,
1.311988, 0.4680492, 2.696776, 1, 0, 0, 1, 1,
1.315783, 2.675264, 2.164528, 0, 0, 0, 1, 1,
1.32336, -0.2682787, 2.442195, 0, 0, 0, 1, 1,
1.3266, -1.315066, 2.895082, 0, 0, 0, 1, 1,
1.330551, 0.6512643, 3.098924, 0, 0, 0, 1, 1,
1.332226, 0.468739, 4.114006, 0, 0, 0, 1, 1,
1.335678, 0.5524812, 1.264615, 0, 0, 0, 1, 1,
1.33861, -1.865533, 2.241247, 0, 0, 0, 1, 1,
1.350236, -0.7813442, 0.3675362, 1, 1, 1, 1, 1,
1.352014, 0.4123171, 2.141971, 1, 1, 1, 1, 1,
1.357847, 0.8015749, 0.500833, 1, 1, 1, 1, 1,
1.373311, -0.5308131, 1.127151, 1, 1, 1, 1, 1,
1.378205, -0.2377866, 2.1222, 1, 1, 1, 1, 1,
1.380453, -0.5092232, 1.231891, 1, 1, 1, 1, 1,
1.389642, -0.9010466, 2.872831, 1, 1, 1, 1, 1,
1.399294, -0.01907294, 2.593369, 1, 1, 1, 1, 1,
1.407404, 0.2535439, 1.955761, 1, 1, 1, 1, 1,
1.410596, -1.985837, 2.645022, 1, 1, 1, 1, 1,
1.413914, 0.3075809, 0.7339122, 1, 1, 1, 1, 1,
1.415519, -0.6940293, 2.7099, 1, 1, 1, 1, 1,
1.416599, -0.2900915, 1.591862, 1, 1, 1, 1, 1,
1.418751, 0.4978188, 1.014704, 1, 1, 1, 1, 1,
1.423976, -0.5459512, 2.770395, 1, 1, 1, 1, 1,
1.427405, 0.3699266, 2.158305, 0, 0, 1, 1, 1,
1.431766, -0.4130499, 2.352057, 1, 0, 0, 1, 1,
1.437911, 0.4794413, 0.4803242, 1, 0, 0, 1, 1,
1.442474, 1.162297, 2.31898, 1, 0, 0, 1, 1,
1.450084, 0.1626777, 3.638554, 1, 0, 0, 1, 1,
1.462061, 1.409991, 1.056719, 1, 0, 0, 1, 1,
1.471525, 2.706574, 1.526296, 0, 0, 0, 1, 1,
1.475063, 0.3681403, 2.784279, 0, 0, 0, 1, 1,
1.48031, 1.846158, 0.3901198, 0, 0, 0, 1, 1,
1.495493, 0.70905, -1.52735, 0, 0, 0, 1, 1,
1.501667, -0.4639271, 0.5378612, 0, 0, 0, 1, 1,
1.50271, -0.7752285, 3.345483, 0, 0, 0, 1, 1,
1.515451, -0.3176411, 1.641558, 0, 0, 0, 1, 1,
1.540779, 0.5064961, 0.6513835, 1, 1, 1, 1, 1,
1.55446, 1.759069, 1.185314, 1, 1, 1, 1, 1,
1.562354, -0.5906867, 2.753052, 1, 1, 1, 1, 1,
1.570731, 2.437715, 2.780736, 1, 1, 1, 1, 1,
1.573676, -0.3798999, 2.828383, 1, 1, 1, 1, 1,
1.586977, -1.348658, 3.237575, 1, 1, 1, 1, 1,
1.588385, -2.104148, 1.385795, 1, 1, 1, 1, 1,
1.59249, 1.360384, 0.7350793, 1, 1, 1, 1, 1,
1.595468, 0.2810586, 2.776187, 1, 1, 1, 1, 1,
1.595935, -1.204371, 2.578534, 1, 1, 1, 1, 1,
1.606541, -0.8452503, 2.809731, 1, 1, 1, 1, 1,
1.607668, 0.4821919, 1.971062, 1, 1, 1, 1, 1,
1.609033, -0.6285216, 3.299538, 1, 1, 1, 1, 1,
1.611759, -0.6353938, 2.096056, 1, 1, 1, 1, 1,
1.626668, -1.69643, 1.170825, 1, 1, 1, 1, 1,
1.641641, 0.3861998, 1.099475, 0, 0, 1, 1, 1,
1.664755, 1.03066, 1.12684, 1, 0, 0, 1, 1,
1.66693, -0.5905593, 1.771111, 1, 0, 0, 1, 1,
1.704851, -1.947415, 1.621465, 1, 0, 0, 1, 1,
1.725971, -2.200234, 1.243894, 1, 0, 0, 1, 1,
1.729497, -0.1417313, 2.597044, 1, 0, 0, 1, 1,
1.730169, -1.138141, 2.359547, 0, 0, 0, 1, 1,
1.752938, 0.7959821, 1.69876, 0, 0, 0, 1, 1,
1.756471, 0.9946679, 1.836845, 0, 0, 0, 1, 1,
1.763566, 0.452738, 1.983078, 0, 0, 0, 1, 1,
1.772783, 0.7602452, 0.3843672, 0, 0, 0, 1, 1,
1.777348, -0.8158432, 1.623389, 0, 0, 0, 1, 1,
1.781683, 1.458887, 0.4676739, 0, 0, 0, 1, 1,
1.791467, -0.8677207, 2.126395, 1, 1, 1, 1, 1,
1.798637, 0.5094746, 1.387376, 1, 1, 1, 1, 1,
1.805937, -0.9420892, 1.244502, 1, 1, 1, 1, 1,
1.806109, 0.8450944, 0.0660603, 1, 1, 1, 1, 1,
1.830175, -0.4072686, 0.3593417, 1, 1, 1, 1, 1,
1.831999, 1.813118, 0.3148178, 1, 1, 1, 1, 1,
1.83209, 0.1686923, 1.65596, 1, 1, 1, 1, 1,
1.84002, 1.289597, -0.6214286, 1, 1, 1, 1, 1,
1.847123, -0.3773193, 2.174406, 1, 1, 1, 1, 1,
1.864023, -1.156364, 0.5593353, 1, 1, 1, 1, 1,
1.869489, 0.5656685, 1.724885, 1, 1, 1, 1, 1,
1.899696, -2.158663, 2.468606, 1, 1, 1, 1, 1,
1.905301, -1.079413, 2.02798, 1, 1, 1, 1, 1,
1.915514, 1.37541, 1.404377, 1, 1, 1, 1, 1,
1.926875, -0.5342866, 2.113528, 1, 1, 1, 1, 1,
1.98191, -0.02235957, 3.629779, 0, 0, 1, 1, 1,
2.027897, -0.5085806, 3.914742, 1, 0, 0, 1, 1,
2.072941, -0.4170477, 3.874258, 1, 0, 0, 1, 1,
2.096985, 0.1608162, 0.543616, 1, 0, 0, 1, 1,
2.130187, 0.6460881, 1.281841, 1, 0, 0, 1, 1,
2.158491, -0.8270569, 1.385757, 1, 0, 0, 1, 1,
2.161397, -2.310473, 1.603666, 0, 0, 0, 1, 1,
2.204051, -0.1916957, 1.501092, 0, 0, 0, 1, 1,
2.264861, 0.9687499, 1.267553, 0, 0, 0, 1, 1,
2.268154, 1.495939, 2.800888, 0, 0, 0, 1, 1,
2.273147, 0.316245, 0.8433916, 0, 0, 0, 1, 1,
2.282439, -0.238805, 2.536768, 0, 0, 0, 1, 1,
2.315618, 0.877879, -0.3145004, 0, 0, 0, 1, 1,
2.323293, 0.07191322, -0.1376343, 1, 1, 1, 1, 1,
2.34288, -0.2499688, 1.604129, 1, 1, 1, 1, 1,
2.35463, 0.1742082, -0.02518318, 1, 1, 1, 1, 1,
2.396397, -0.8927632, 2.742378, 1, 1, 1, 1, 1,
2.465088, -0.5923257, 1.804523, 1, 1, 1, 1, 1,
2.593298, -1.176853, 0.200422, 1, 1, 1, 1, 1,
2.63694, -0.03153219, 1.981106, 1, 1, 1, 1, 1
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
var radius = 9.596327;
var distance = 33.70669;
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
mvMatrix.translate( 0.6214044, 0.1736405, -0.2227871 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.70669);
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