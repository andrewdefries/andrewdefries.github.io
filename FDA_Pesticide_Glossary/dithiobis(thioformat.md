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
-3.309878, 0.0309237, -0.783815, 1, 0, 0, 1,
-3.113137, -2.306508, -3.045716, 1, 0.007843138, 0, 1,
-2.95106, 0.043864, -1.463582, 1, 0.01176471, 0, 1,
-2.719145, 1.651508, -0.7912231, 1, 0.01960784, 0, 1,
-2.553064, -0.5330169, 0.05955796, 1, 0.02352941, 0, 1,
-2.404147, 1.272233, -1.513574, 1, 0.03137255, 0, 1,
-2.395281, 1.319028, 0.00731437, 1, 0.03529412, 0, 1,
-2.38632, -0.07347661, -1.09818, 1, 0.04313726, 0, 1,
-2.383585, 0.5737242, -0.1976589, 1, 0.04705882, 0, 1,
-2.292226, 0.5592397, -0.07777215, 1, 0.05490196, 0, 1,
-2.28731, 1.30573, -1.834886, 1, 0.05882353, 0, 1,
-2.254706, 0.2546392, -0.7465958, 1, 0.06666667, 0, 1,
-2.221423, -1.954807, -2.12948, 1, 0.07058824, 0, 1,
-2.21159, 1.455189, -0.7063273, 1, 0.07843138, 0, 1,
-2.20437, 0.3722551, -1.437314, 1, 0.08235294, 0, 1,
-2.20272, 0.1345336, -1.728017, 1, 0.09019608, 0, 1,
-2.189657, -0.1630406, -1.09487, 1, 0.09411765, 0, 1,
-2.146248, -1.015127, -2.582613, 1, 0.1019608, 0, 1,
-2.127435, -0.665722, 0.1897576, 1, 0.1098039, 0, 1,
-2.098942, -0.7480589, -1.389621, 1, 0.1137255, 0, 1,
-2.098748, 0.3328925, -1.199977, 1, 0.1215686, 0, 1,
-2.095415, -0.04386102, -1.212605, 1, 0.1254902, 0, 1,
-2.043634, 0.1615805, -3.24451, 1, 0.1333333, 0, 1,
-2.017658, 2.401854, -1.630936, 1, 0.1372549, 0, 1,
-1.993013, -0.6986874, -1.723572, 1, 0.145098, 0, 1,
-1.942086, 0.3598311, -3.475641, 1, 0.1490196, 0, 1,
-1.933282, 0.7927496, -1.824462, 1, 0.1568628, 0, 1,
-1.925492, 0.2428661, -2.42275, 1, 0.1607843, 0, 1,
-1.914674, -1.103316, -3.259738, 1, 0.1686275, 0, 1,
-1.905422, 0.8708552, -0.3465815, 1, 0.172549, 0, 1,
-1.895065, 0.8081689, -2.025263, 1, 0.1803922, 0, 1,
-1.895017, 1.202702, -0.8811611, 1, 0.1843137, 0, 1,
-1.893861, 0.3796501, -0.5411776, 1, 0.1921569, 0, 1,
-1.888171, -0.895977, -2.456272, 1, 0.1960784, 0, 1,
-1.885201, 0.2475663, -1.856822, 1, 0.2039216, 0, 1,
-1.871016, 1.426585, -1.265151, 1, 0.2117647, 0, 1,
-1.851169, -1.091831, -0.6180878, 1, 0.2156863, 0, 1,
-1.83558, -0.6229795, -3.274505, 1, 0.2235294, 0, 1,
-1.818836, 0.3030971, 0.0798033, 1, 0.227451, 0, 1,
-1.794148, 1.291468, -0.8258232, 1, 0.2352941, 0, 1,
-1.793802, 0.4033171, 0.5888355, 1, 0.2392157, 0, 1,
-1.790372, -0.07050439, -2.725709, 1, 0.2470588, 0, 1,
-1.784435, 0.08967548, -1.191108, 1, 0.2509804, 0, 1,
-1.780689, -0.7576699, -2.561599, 1, 0.2588235, 0, 1,
-1.758149, 1.005264, -1.733546, 1, 0.2627451, 0, 1,
-1.751904, -1.003148, -0.8100779, 1, 0.2705882, 0, 1,
-1.72585, 0.2896653, -1.529641, 1, 0.2745098, 0, 1,
-1.721274, -1.084364, -1.596545, 1, 0.282353, 0, 1,
-1.717607, 1.221337, -0.898465, 1, 0.2862745, 0, 1,
-1.717415, -0.9601363, -1.770761, 1, 0.2941177, 0, 1,
-1.714739, -0.08842435, -0.9529327, 1, 0.3019608, 0, 1,
-1.711448, -1.10773, -2.431872, 1, 0.3058824, 0, 1,
-1.684252, -0.98172, -3.857435, 1, 0.3137255, 0, 1,
-1.682201, -0.6729579, -2.970155, 1, 0.3176471, 0, 1,
-1.677293, -0.6082203, -2.662017, 1, 0.3254902, 0, 1,
-1.67224, -0.131694, -2.690847, 1, 0.3294118, 0, 1,
-1.657933, -1.051097, -4.310617, 1, 0.3372549, 0, 1,
-1.652065, 0.1830624, -2.138436, 1, 0.3411765, 0, 1,
-1.647346, 0.1095653, -1.815116, 1, 0.3490196, 0, 1,
-1.618981, 0.7504621, -0.9364622, 1, 0.3529412, 0, 1,
-1.610158, 0.01807874, -1.693228, 1, 0.3607843, 0, 1,
-1.588798, 1.106041, -2.148191, 1, 0.3647059, 0, 1,
-1.579911, -1.011964, -0.451847, 1, 0.372549, 0, 1,
-1.578956, -0.1449396, -2.522139, 1, 0.3764706, 0, 1,
-1.572331, -1.296078, -1.924696, 1, 0.3843137, 0, 1,
-1.553608, 0.9580441, -1.435321, 1, 0.3882353, 0, 1,
-1.538541, -1.27845, -0.7439959, 1, 0.3960784, 0, 1,
-1.53444, 0.02632395, -1.749395, 1, 0.4039216, 0, 1,
-1.532963, 0.4696745, -1.831752, 1, 0.4078431, 0, 1,
-1.524828, 0.1554544, -0.4391469, 1, 0.4156863, 0, 1,
-1.523618, 0.6834341, -0.2580696, 1, 0.4196078, 0, 1,
-1.518136, -0.3781854, -0.7525024, 1, 0.427451, 0, 1,
-1.49936, -0.8249152, -2.697037, 1, 0.4313726, 0, 1,
-1.496981, 0.1938158, -2.097506, 1, 0.4392157, 0, 1,
-1.491912, 0.1120754, -2.194609, 1, 0.4431373, 0, 1,
-1.484745, 0.2925058, 0.9230759, 1, 0.4509804, 0, 1,
-1.473144, 0.3203942, -1.118934, 1, 0.454902, 0, 1,
-1.467672, 1.140218, 0.4011855, 1, 0.4627451, 0, 1,
-1.465411, -0.8588408, -1.268303, 1, 0.4666667, 0, 1,
-1.465357, 0.9004611, -1.103317, 1, 0.4745098, 0, 1,
-1.460236, 0.1044608, -1.733791, 1, 0.4784314, 0, 1,
-1.453215, -2.257361, -0.9405907, 1, 0.4862745, 0, 1,
-1.447723, -0.06044568, -2.53531, 1, 0.4901961, 0, 1,
-1.444652, 0.3724695, -1.070681, 1, 0.4980392, 0, 1,
-1.44366, 0.1828959, -3.084979, 1, 0.5058824, 0, 1,
-1.436768, -0.5318446, -1.126319, 1, 0.509804, 0, 1,
-1.435377, 0.6806417, -0.8593684, 1, 0.5176471, 0, 1,
-1.434295, -0.330927, -1.856218, 1, 0.5215687, 0, 1,
-1.430354, 2.365301, -1.718656, 1, 0.5294118, 0, 1,
-1.42262, -0.1125849, -2.198351, 1, 0.5333334, 0, 1,
-1.418468, 0.003219617, -1.092606, 1, 0.5411765, 0, 1,
-1.412616, -0.6714739, -2.644822, 1, 0.5450981, 0, 1,
-1.39042, -0.5629343, -2.55083, 1, 0.5529412, 0, 1,
-1.384696, 0.3441138, -0.1717447, 1, 0.5568628, 0, 1,
-1.383268, -0.9348168, -1.595742, 1, 0.5647059, 0, 1,
-1.37234, -0.9708651, -0.623135, 1, 0.5686275, 0, 1,
-1.371108, 0.7089882, -0.0582223, 1, 0.5764706, 0, 1,
-1.363298, 0.776407, -2.213763, 1, 0.5803922, 0, 1,
-1.355747, -1.505576, -1.603536, 1, 0.5882353, 0, 1,
-1.353694, -0.3217111, -1.165875, 1, 0.5921569, 0, 1,
-1.349681, -0.07015885, -3.209182, 1, 0.6, 0, 1,
-1.347395, -0.6830055, -0.8699961, 1, 0.6078432, 0, 1,
-1.345728, -1.15587, -0.07946892, 1, 0.6117647, 0, 1,
-1.331499, 0.1659409, -1.135561, 1, 0.6196079, 0, 1,
-1.324692, -0.3487723, -1.610869, 1, 0.6235294, 0, 1,
-1.31896, -0.1699739, -2.529496, 1, 0.6313726, 0, 1,
-1.316555, 0.4061463, -1.434781, 1, 0.6352941, 0, 1,
-1.314039, -0.5752528, -1.574787, 1, 0.6431373, 0, 1,
-1.313475, 1.543189, -3.303698, 1, 0.6470588, 0, 1,
-1.311109, -0.3477497, -1.514137, 1, 0.654902, 0, 1,
-1.308545, -0.178187, -2.450632, 1, 0.6588235, 0, 1,
-1.300334, -0.1387941, -2.835596, 1, 0.6666667, 0, 1,
-1.300117, 0.9283077, -1.771794, 1, 0.6705883, 0, 1,
-1.296137, -2.182408, -2.952823, 1, 0.6784314, 0, 1,
-1.286458, -0.4306526, -2.098734, 1, 0.682353, 0, 1,
-1.286427, 0.6756462, -1.169614, 1, 0.6901961, 0, 1,
-1.279288, 0.2085581, -1.395796, 1, 0.6941177, 0, 1,
-1.265868, -1.294288, -2.314092, 1, 0.7019608, 0, 1,
-1.261239, -0.3859836, -4.075435, 1, 0.7098039, 0, 1,
-1.259874, -0.6167973, -1.875368, 1, 0.7137255, 0, 1,
-1.255515, -0.361845, -1.219913, 1, 0.7215686, 0, 1,
-1.252517, 1.221933, -1.193586, 1, 0.7254902, 0, 1,
-1.23649, 1.342077, -1.072974, 1, 0.7333333, 0, 1,
-1.235287, 0.05394483, 1.11979, 1, 0.7372549, 0, 1,
-1.235255, -0.3835123, -1.526966, 1, 0.7450981, 0, 1,
-1.223202, 0.7583848, -1.160396, 1, 0.7490196, 0, 1,
-1.217829, -0.4226649, -1.09846, 1, 0.7568628, 0, 1,
-1.215009, -0.7601537, -1.610367, 1, 0.7607843, 0, 1,
-1.214868, 2.039685, -1.259805, 1, 0.7686275, 0, 1,
-1.208693, 1.445475, -0.9963911, 1, 0.772549, 0, 1,
-1.197529, 0.5128149, -0.5843391, 1, 0.7803922, 0, 1,
-1.197332, 1.749682, -0.09274737, 1, 0.7843137, 0, 1,
-1.194298, 0.2442906, -1.422404, 1, 0.7921569, 0, 1,
-1.192155, -0.7928857, -3.534991, 1, 0.7960784, 0, 1,
-1.191826, -1.360031, -1.713837, 1, 0.8039216, 0, 1,
-1.183443, 0.1852085, -1.527554, 1, 0.8117647, 0, 1,
-1.17871, -0.2259966, -0.9335187, 1, 0.8156863, 0, 1,
-1.17274, 0.6506262, -1.114154, 1, 0.8235294, 0, 1,
-1.168646, -0.8332433, -0.5098487, 1, 0.827451, 0, 1,
-1.162891, -0.1632882, -1.726501, 1, 0.8352941, 0, 1,
-1.15808, 1.230479, -2.767037, 1, 0.8392157, 0, 1,
-1.152938, 0.5059809, -1.494438, 1, 0.8470588, 0, 1,
-1.152756, 0.5007246, -1.484298, 1, 0.8509804, 0, 1,
-1.145345, 0.3151477, -3.669717, 1, 0.8588235, 0, 1,
-1.142077, -1.268544, -3.26738, 1, 0.8627451, 0, 1,
-1.13611, -0.6466813, -2.412139, 1, 0.8705882, 0, 1,
-1.124788, -0.8075761, -1.97054, 1, 0.8745098, 0, 1,
-1.123695, 0.0911895, -0.685872, 1, 0.8823529, 0, 1,
-1.118084, -0.5641436, -1.580105, 1, 0.8862745, 0, 1,
-1.115325, 0.4215854, 0.803602, 1, 0.8941177, 0, 1,
-1.112681, 0.4459008, -1.794686, 1, 0.8980392, 0, 1,
-1.107874, 0.2449256, -1.006959, 1, 0.9058824, 0, 1,
-1.10564, 0.03626536, -0.6960104, 1, 0.9137255, 0, 1,
-1.101286, -0.8545738, -1.812359, 1, 0.9176471, 0, 1,
-1.096511, -0.07657839, -1.568411, 1, 0.9254902, 0, 1,
-1.088653, -1.489933, -3.136215, 1, 0.9294118, 0, 1,
-1.085357, -1.627655, -3.0869, 1, 0.9372549, 0, 1,
-1.083625, 0.4372156, -1.572629, 1, 0.9411765, 0, 1,
-1.077306, -0.561932, 0.1445544, 1, 0.9490196, 0, 1,
-1.072791, 1.199498, 0.831045, 1, 0.9529412, 0, 1,
-1.07264, 0.427013, -0.03469192, 1, 0.9607843, 0, 1,
-1.071644, 1.897316, -0.4730829, 1, 0.9647059, 0, 1,
-1.067623, -0.6163099, -1.330565, 1, 0.972549, 0, 1,
-1.061933, 1.613323, -2.098418, 1, 0.9764706, 0, 1,
-1.051699, 0.3481719, -1.102371, 1, 0.9843137, 0, 1,
-1.047952, 1.937317, 0.863257, 1, 0.9882353, 0, 1,
-1.046322, -0.5274141, -1.846544, 1, 0.9960784, 0, 1,
-1.044454, 0.1754369, -0.6493997, 0.9960784, 1, 0, 1,
-1.032541, -1.731127, -3.040757, 0.9921569, 1, 0, 1,
-1.031906, -0.2388456, -1.041465, 0.9843137, 1, 0, 1,
-1.027646, -0.06248447, -0.5407611, 0.9803922, 1, 0, 1,
-1.025488, -0.449896, -1.304372, 0.972549, 1, 0, 1,
-1.01569, 0.08269697, -2.410777, 0.9686275, 1, 0, 1,
-1.013316, 0.4841363, -1.340446, 0.9607843, 1, 0, 1,
-1.001436, -0.7312027, -0.3697025, 0.9568627, 1, 0, 1,
-0.9973685, 0.2445158, -0.01943469, 0.9490196, 1, 0, 1,
-0.9857231, 1.225528, -0.2129647, 0.945098, 1, 0, 1,
-0.983529, 0.1359, -0.8251035, 0.9372549, 1, 0, 1,
-0.9820461, 0.4887018, -2.2872, 0.9333333, 1, 0, 1,
-0.9781703, 1.597823, -2.059034, 0.9254902, 1, 0, 1,
-0.9750931, 0.881343, -1.265178, 0.9215686, 1, 0, 1,
-0.9693081, -1.939342, -2.355211, 0.9137255, 1, 0, 1,
-0.9680523, -1.397201, -2.566715, 0.9098039, 1, 0, 1,
-0.9662193, -0.8662701, -1.306693, 0.9019608, 1, 0, 1,
-0.9646595, 0.0002067553, -1.221643, 0.8941177, 1, 0, 1,
-0.9640161, 1.508196, -0.3448618, 0.8901961, 1, 0, 1,
-0.9637637, -1.611511, -1.068992, 0.8823529, 1, 0, 1,
-0.9637178, 0.302926, -2.710716, 0.8784314, 1, 0, 1,
-0.9613414, -0.5934933, -0.6423073, 0.8705882, 1, 0, 1,
-0.960461, -0.6042264, -3.43887, 0.8666667, 1, 0, 1,
-0.9574091, 0.5209046, -1.474013, 0.8588235, 1, 0, 1,
-0.9560887, 1.577602, -0.9168426, 0.854902, 1, 0, 1,
-0.9507157, 0.5788054, -1.595794, 0.8470588, 1, 0, 1,
-0.9486183, 0.8249668, -1.083419, 0.8431373, 1, 0, 1,
-0.9420222, 1.856199, -1.270384, 0.8352941, 1, 0, 1,
-0.9397091, 0.7918661, 0.7701132, 0.8313726, 1, 0, 1,
-0.9355834, -0.172532, -1.763647, 0.8235294, 1, 0, 1,
-0.9318215, 1.415467, -1.848173, 0.8196079, 1, 0, 1,
-0.9287642, -0.4357742, -1.633998, 0.8117647, 1, 0, 1,
-0.9222673, 0.3281559, -1.758058, 0.8078431, 1, 0, 1,
-0.9222558, -0.212359, -2.912359, 0.8, 1, 0, 1,
-0.911854, 0.8099654, 0.3881083, 0.7921569, 1, 0, 1,
-0.9054693, 0.599595, 0.4628699, 0.7882353, 1, 0, 1,
-0.9010111, -1.007697, -2.641224, 0.7803922, 1, 0, 1,
-0.9006239, -1.931774, -0.4148613, 0.7764706, 1, 0, 1,
-0.8995188, 0.2605807, -0.8827455, 0.7686275, 1, 0, 1,
-0.8990448, 0.2299277, -2.511307, 0.7647059, 1, 0, 1,
-0.8970622, -0.3674284, -2.794879, 0.7568628, 1, 0, 1,
-0.8900011, 0.8538591, -1.433642, 0.7529412, 1, 0, 1,
-0.8878424, -0.2327347, -1.873234, 0.7450981, 1, 0, 1,
-0.8861963, 0.08056466, -0.7783083, 0.7411765, 1, 0, 1,
-0.8854709, 0.1148091, -1.812934, 0.7333333, 1, 0, 1,
-0.8769622, -0.8406461, -3.127514, 0.7294118, 1, 0, 1,
-0.8693986, -0.8989213, -1.677271, 0.7215686, 1, 0, 1,
-0.8647696, -0.1838921, -0.4223752, 0.7176471, 1, 0, 1,
-0.8647006, -0.2662257, -2.647101, 0.7098039, 1, 0, 1,
-0.8607541, 0.2646713, -1.337296, 0.7058824, 1, 0, 1,
-0.8519498, -0.02162684, -0.4442424, 0.6980392, 1, 0, 1,
-0.8518926, -0.02773822, -0.5348871, 0.6901961, 1, 0, 1,
-0.8509935, 0.4947919, -3.717345, 0.6862745, 1, 0, 1,
-0.850323, 0.1909262, -0.1246215, 0.6784314, 1, 0, 1,
-0.8374674, -0.8102086, -3.628101, 0.6745098, 1, 0, 1,
-0.8367801, 0.3318226, -1.624255, 0.6666667, 1, 0, 1,
-0.834447, 1.218776, -0.4653528, 0.6627451, 1, 0, 1,
-0.8317522, 0.2428626, -0.8818585, 0.654902, 1, 0, 1,
-0.8312328, 0.6545595, -0.3823255, 0.6509804, 1, 0, 1,
-0.8306239, -1.244353, -3.708438, 0.6431373, 1, 0, 1,
-0.8269956, 1.867832, -1.699993, 0.6392157, 1, 0, 1,
-0.8247166, 0.1108985, -2.778677, 0.6313726, 1, 0, 1,
-0.8192743, 0.9900901, -0.8750836, 0.627451, 1, 0, 1,
-0.8177723, -0.7205303, -1.527571, 0.6196079, 1, 0, 1,
-0.8091524, -1.090391, -3.062328, 0.6156863, 1, 0, 1,
-0.8034166, 0.4620622, -0.7754446, 0.6078432, 1, 0, 1,
-0.7996609, 0.1879911, -0.5991745, 0.6039216, 1, 0, 1,
-0.7940802, 1.537815, -0.1232304, 0.5960785, 1, 0, 1,
-0.793656, 0.3412607, -2.609366, 0.5882353, 1, 0, 1,
-0.7922863, -1.856633, -4.039207, 0.5843138, 1, 0, 1,
-0.7871309, -0.1520436, -2.478133, 0.5764706, 1, 0, 1,
-0.7870739, 0.8979828, -0.8201666, 0.572549, 1, 0, 1,
-0.7848755, 0.5961366, 0.7887217, 0.5647059, 1, 0, 1,
-0.7820734, 0.02556564, -0.8910998, 0.5607843, 1, 0, 1,
-0.7815202, -1.323757, -1.615303, 0.5529412, 1, 0, 1,
-0.7778262, 0.2213794, -1.428181, 0.5490196, 1, 0, 1,
-0.7757317, 0.9545688, -1.227957, 0.5411765, 1, 0, 1,
-0.7726787, 0.04308419, -1.336632, 0.5372549, 1, 0, 1,
-0.7713677, 0.8580017, -0.8961536, 0.5294118, 1, 0, 1,
-0.7626488, -0.1138871, -1.578103, 0.5254902, 1, 0, 1,
-0.7606837, 1.412307, -0.9920155, 0.5176471, 1, 0, 1,
-0.7571847, 0.5573472, -2.316949, 0.5137255, 1, 0, 1,
-0.7560122, 0.2577371, -0.2737376, 0.5058824, 1, 0, 1,
-0.7512022, 1.267276, -0.7048533, 0.5019608, 1, 0, 1,
-0.7475945, 1.012674, -2.49063, 0.4941176, 1, 0, 1,
-0.7415774, -0.9210568, -2.160746, 0.4862745, 1, 0, 1,
-0.7401682, 0.7657803, -0.3175902, 0.4823529, 1, 0, 1,
-0.7351568, -1.221818, -3.721802, 0.4745098, 1, 0, 1,
-0.7350931, -0.1562089, -1.090189, 0.4705882, 1, 0, 1,
-0.7219965, -1.638533, -3.157917, 0.4627451, 1, 0, 1,
-0.7203063, 2.246842, -1.080405, 0.4588235, 1, 0, 1,
-0.7157502, -0.328002, -2.201498, 0.4509804, 1, 0, 1,
-0.7126462, -1.19009, -3.521465, 0.4470588, 1, 0, 1,
-0.7088261, -1.051652, -2.489301, 0.4392157, 1, 0, 1,
-0.7051862, -0.07573964, -0.8981082, 0.4352941, 1, 0, 1,
-0.7017499, 1.971433, -0.522087, 0.427451, 1, 0, 1,
-0.6992795, -0.8089833, -3.308585, 0.4235294, 1, 0, 1,
-0.6978428, 0.2780626, -0.6332766, 0.4156863, 1, 0, 1,
-0.6959279, -1.869648, -3.064102, 0.4117647, 1, 0, 1,
-0.6952976, 1.284153, 0.5960291, 0.4039216, 1, 0, 1,
-0.6941168, 1.205117, -1.402493, 0.3960784, 1, 0, 1,
-0.68264, 1.232341, -0.6726305, 0.3921569, 1, 0, 1,
-0.6808474, 0.3812734, -1.410726, 0.3843137, 1, 0, 1,
-0.6789742, 0.02902524, -0.9348888, 0.3803922, 1, 0, 1,
-0.676459, -0.7278638, -3.018215, 0.372549, 1, 0, 1,
-0.6752361, 0.7081001, -0.487187, 0.3686275, 1, 0, 1,
-0.6630819, 1.256029, -1.854361, 0.3607843, 1, 0, 1,
-0.6614727, -0.9744037, -2.517227, 0.3568628, 1, 0, 1,
-0.646839, 0.9645547, -3.320508, 0.3490196, 1, 0, 1,
-0.6468045, 0.05649519, -0.4654033, 0.345098, 1, 0, 1,
-0.645257, 0.8538133, -0.05614014, 0.3372549, 1, 0, 1,
-0.6449174, 0.7030568, 0.1398719, 0.3333333, 1, 0, 1,
-0.6429409, -2.136062, -3.517097, 0.3254902, 1, 0, 1,
-0.6326936, 0.5868905, -0.9019984, 0.3215686, 1, 0, 1,
-0.6288366, 0.5770935, 0.5157393, 0.3137255, 1, 0, 1,
-0.6152832, -0.4301628, -1.374868, 0.3098039, 1, 0, 1,
-0.6108994, 1.469448, 0.3858629, 0.3019608, 1, 0, 1,
-0.6106527, 0.294619, 0.502866, 0.2941177, 1, 0, 1,
-0.6090986, -0.7805715, -1.185849, 0.2901961, 1, 0, 1,
-0.6060328, -0.6602123, -1.739722, 0.282353, 1, 0, 1,
-0.6029275, -1.91998, -2.51811, 0.2784314, 1, 0, 1,
-0.6023357, -0.2789023, -3.698049, 0.2705882, 1, 0, 1,
-0.5933149, -0.3085279, -1.702911, 0.2666667, 1, 0, 1,
-0.5931716, -0.8578188, -4.798149, 0.2588235, 1, 0, 1,
-0.5909826, 1.761635, 0.1762083, 0.254902, 1, 0, 1,
-0.5895572, 0.3732128, -1.256036, 0.2470588, 1, 0, 1,
-0.5827533, -1.483921, -4.983339, 0.2431373, 1, 0, 1,
-0.5810807, -0.3423009, -1.611085, 0.2352941, 1, 0, 1,
-0.5798028, -1.178944, -2.548664, 0.2313726, 1, 0, 1,
-0.5793869, -2.175424, -3.052618, 0.2235294, 1, 0, 1,
-0.5776019, -1.145838, -2.801374, 0.2196078, 1, 0, 1,
-0.5764123, -0.1166532, -2.154343, 0.2117647, 1, 0, 1,
-0.5559161, -0.1109444, -0.4940845, 0.2078431, 1, 0, 1,
-0.5468961, 0.4517589, -1.541044, 0.2, 1, 0, 1,
-0.5433372, -0.2665582, -2.180049, 0.1921569, 1, 0, 1,
-0.5414405, 0.2604877, -2.376152, 0.1882353, 1, 0, 1,
-0.5330606, 0.423645, -1.793796, 0.1803922, 1, 0, 1,
-0.5285051, 2.313796, -0.3131862, 0.1764706, 1, 0, 1,
-0.5224558, 0.2589454, -0.608865, 0.1686275, 1, 0, 1,
-0.5209143, 0.04307389, -0.6646441, 0.1647059, 1, 0, 1,
-0.5109233, -0.6158159, -2.957685, 0.1568628, 1, 0, 1,
-0.5041748, -0.2486224, -3.586697, 0.1529412, 1, 0, 1,
-0.5033549, -0.3176802, -2.811589, 0.145098, 1, 0, 1,
-0.5019568, -0.4575234, -1.070568, 0.1411765, 1, 0, 1,
-0.5015247, -1.994495, -2.690134, 0.1333333, 1, 0, 1,
-0.5002888, 1.30889, 1.409936, 0.1294118, 1, 0, 1,
-0.498774, -2.140926, -2.726317, 0.1215686, 1, 0, 1,
-0.494813, -0.3551464, -1.84739, 0.1176471, 1, 0, 1,
-0.4930514, 0.6152424, -0.6523801, 0.1098039, 1, 0, 1,
-0.487517, -0.9436706, -3.231827, 0.1058824, 1, 0, 1,
-0.4821219, 0.5145694, -0.4143291, 0.09803922, 1, 0, 1,
-0.4820597, 0.4971073, 0.5950928, 0.09019608, 1, 0, 1,
-0.4811652, 0.1951004, -1.513224, 0.08627451, 1, 0, 1,
-0.4794135, -0.8803714, -2.96884, 0.07843138, 1, 0, 1,
-0.4710651, -1.549284, -3.745359, 0.07450981, 1, 0, 1,
-0.4693868, -2.922191, -2.610247, 0.06666667, 1, 0, 1,
-0.4666441, -0.7879708, -2.72738, 0.0627451, 1, 0, 1,
-0.4658596, -0.02312723, -2.333771, 0.05490196, 1, 0, 1,
-0.4637318, 0.09356648, -2.573745, 0.05098039, 1, 0, 1,
-0.4634183, 0.4579018, -1.162984, 0.04313726, 1, 0, 1,
-0.4621024, 3.112261, -0.9829506, 0.03921569, 1, 0, 1,
-0.4603812, -0.07652928, -1.253531, 0.03137255, 1, 0, 1,
-0.4601271, -0.20853, -1.554381, 0.02745098, 1, 0, 1,
-0.4578856, -0.0449916, -1.360077, 0.01960784, 1, 0, 1,
-0.4503904, 0.7090517, -0.7342039, 0.01568628, 1, 0, 1,
-0.4490411, 0.2538327, -1.386176, 0.007843138, 1, 0, 1,
-0.4474497, -0.5523819, -4.401907, 0.003921569, 1, 0, 1,
-0.4471164, 1.07896, -1.345142, 0, 1, 0.003921569, 1,
-0.4467761, 0.845212, -0.5872062, 0, 1, 0.01176471, 1,
-0.4454017, 1.399806, 0.3144127, 0, 1, 0.01568628, 1,
-0.44339, -0.5157727, -2.531995, 0, 1, 0.02352941, 1,
-0.4417908, -1.691392, -2.373052, 0, 1, 0.02745098, 1,
-0.4403207, 0.807706, -2.590365, 0, 1, 0.03529412, 1,
-0.4331515, -0.5729915, -3.502101, 0, 1, 0.03921569, 1,
-0.4327624, 0.5475096, -0.4906356, 0, 1, 0.04705882, 1,
-0.4318804, -1.889642, -4.163409, 0, 1, 0.05098039, 1,
-0.4296865, -2.015524, -3.439719, 0, 1, 0.05882353, 1,
-0.429438, -0.6441699, -2.531673, 0, 1, 0.0627451, 1,
-0.4266695, 1.200473, 0.3276267, 0, 1, 0.07058824, 1,
-0.4264855, -0.1150774, -0.656751, 0, 1, 0.07450981, 1,
-0.4233436, -1.324386, -2.674911, 0, 1, 0.08235294, 1,
-0.4189911, 0.1270101, -1.769908, 0, 1, 0.08627451, 1,
-0.4177711, -0.7535876, -2.873243, 0, 1, 0.09411765, 1,
-0.4166873, 1.215328, -0.7138927, 0, 1, 0.1019608, 1,
-0.4143422, -0.4296468, -1.692973, 0, 1, 0.1058824, 1,
-0.4135027, -0.474606, -5.321306, 0, 1, 0.1137255, 1,
-0.4072967, 1.927539, -0.225759, 0, 1, 0.1176471, 1,
-0.4062641, -1.678783, -3.062828, 0, 1, 0.1254902, 1,
-0.4039433, 0.2110042, 0.07846433, 0, 1, 0.1294118, 1,
-0.4008081, 1.334406, 0.8601732, 0, 1, 0.1372549, 1,
-0.3941715, 1.862088, 0.6359997, 0, 1, 0.1411765, 1,
-0.3902451, 1.309235, -1.118549, 0, 1, 0.1490196, 1,
-0.387159, -1.076163, -0.931311, 0, 1, 0.1529412, 1,
-0.3859805, -0.007292926, -1.553231, 0, 1, 0.1607843, 1,
-0.3830479, 1.640076, -0.2481721, 0, 1, 0.1647059, 1,
-0.38157, -0.3704507, -3.697014, 0, 1, 0.172549, 1,
-0.3745002, -0.3956453, -1.035333, 0, 1, 0.1764706, 1,
-0.3733829, -0.7714274, -4.364466, 0, 1, 0.1843137, 1,
-0.3699895, -1.316782, -3.376549, 0, 1, 0.1882353, 1,
-0.3696727, -1.724724, -1.920715, 0, 1, 0.1960784, 1,
-0.3684304, 1.116763, 1.218373, 0, 1, 0.2039216, 1,
-0.3676307, 0.6968607, -2.133514, 0, 1, 0.2078431, 1,
-0.3669471, 0.2034624, -0.08323783, 0, 1, 0.2156863, 1,
-0.3646773, -1.269957, -2.834976, 0, 1, 0.2196078, 1,
-0.3628402, 0.8807061, -1.186029, 0, 1, 0.227451, 1,
-0.3549128, -0.264819, -0.6387324, 0, 1, 0.2313726, 1,
-0.3526932, -0.3816594, -5.042421, 0, 1, 0.2392157, 1,
-0.349572, -0.3016788, -2.596495, 0, 1, 0.2431373, 1,
-0.3489114, -0.3250638, -2.101389, 0, 1, 0.2509804, 1,
-0.3482953, -1.379268, -3.634329, 0, 1, 0.254902, 1,
-0.3435433, 0.3763769, 0.02970464, 0, 1, 0.2627451, 1,
-0.339121, -1.155982, -2.872375, 0, 1, 0.2666667, 1,
-0.3383606, 1.79418, -1.191025, 0, 1, 0.2745098, 1,
-0.3381459, -0.8400882, -4.234292, 0, 1, 0.2784314, 1,
-0.3347591, -1.205317, -2.639056, 0, 1, 0.2862745, 1,
-0.3339988, 1.514436, 0.7414304, 0, 1, 0.2901961, 1,
-0.3307431, 1.242484, -0.1959962, 0, 1, 0.2980392, 1,
-0.330245, -0.5287691, -2.052516, 0, 1, 0.3058824, 1,
-0.3284795, -0.253643, -2.198764, 0, 1, 0.3098039, 1,
-0.3281927, 1.031538, -0.1903749, 0, 1, 0.3176471, 1,
-0.3271733, 0.1667615, -2.31632, 0, 1, 0.3215686, 1,
-0.3240234, -0.3865421, -2.705606, 0, 1, 0.3294118, 1,
-0.3237852, 0.2377311, -0.6857706, 0, 1, 0.3333333, 1,
-0.3212716, 1.043005, -0.1945155, 0, 1, 0.3411765, 1,
-0.3200856, -0.3974554, -3.120878, 0, 1, 0.345098, 1,
-0.3193613, -0.3985158, -3.624334, 0, 1, 0.3529412, 1,
-0.318941, -0.4439441, -2.313471, 0, 1, 0.3568628, 1,
-0.3183762, 0.03574463, -3.076212, 0, 1, 0.3647059, 1,
-0.3169159, 0.2492762, -1.474609, 0, 1, 0.3686275, 1,
-0.315704, -0.4130056, -1.063002, 0, 1, 0.3764706, 1,
-0.3144274, 0.428371, -1.223602, 0, 1, 0.3803922, 1,
-0.3095687, -1.230607, -3.44012, 0, 1, 0.3882353, 1,
-0.3050976, 0.3343682, -1.901176, 0, 1, 0.3921569, 1,
-0.3040915, 0.07538471, -0.4007217, 0, 1, 0.4, 1,
-0.3034843, -1.568735, -2.314945, 0, 1, 0.4078431, 1,
-0.3029709, -0.08619364, -2.543484, 0, 1, 0.4117647, 1,
-0.297517, -0.4084282, -3.266978, 0, 1, 0.4196078, 1,
-0.2965233, -0.5386556, -3.727345, 0, 1, 0.4235294, 1,
-0.296083, 1.165685, -1.381347, 0, 1, 0.4313726, 1,
-0.2952124, -1.593624, -2.871493, 0, 1, 0.4352941, 1,
-0.2941516, 0.5869834, 1.508801, 0, 1, 0.4431373, 1,
-0.291259, -1.22583, -2.867457, 0, 1, 0.4470588, 1,
-0.2865129, 0.2192228, -3.942908, 0, 1, 0.454902, 1,
-0.2841926, 0.4695473, -0.3765699, 0, 1, 0.4588235, 1,
-0.282173, -1.152897, -3.266151, 0, 1, 0.4666667, 1,
-0.2809317, 0.08224616, -1.524906, 0, 1, 0.4705882, 1,
-0.2801254, -1.114102, -2.837427, 0, 1, 0.4784314, 1,
-0.2784265, 1.228071, 0.4636792, 0, 1, 0.4823529, 1,
-0.2781881, -0.8493813, -2.671362, 0, 1, 0.4901961, 1,
-0.2778789, -0.2792721, -3.501128, 0, 1, 0.4941176, 1,
-0.2697381, 2.542258, 0.7846792, 0, 1, 0.5019608, 1,
-0.2659128, -1.042009, -5.064668, 0, 1, 0.509804, 1,
-0.2645263, 0.1217844, -1.309572, 0, 1, 0.5137255, 1,
-0.2629363, -0.9079777, -2.277444, 0, 1, 0.5215687, 1,
-0.2590536, 1.005243, -3.609346, 0, 1, 0.5254902, 1,
-0.2586342, -1.183739, -3.078796, 0, 1, 0.5333334, 1,
-0.2575008, -0.3159074, -1.160721, 0, 1, 0.5372549, 1,
-0.2560243, -0.42938, -1.242647, 0, 1, 0.5450981, 1,
-0.2505911, 0.1939166, -1.731038, 0, 1, 0.5490196, 1,
-0.2503057, -0.2768162, -3.218608, 0, 1, 0.5568628, 1,
-0.2491822, 1.539517, 1.485078, 0, 1, 0.5607843, 1,
-0.2489851, 0.4776534, -0.7949051, 0, 1, 0.5686275, 1,
-0.245002, -0.09715071, -2.172335, 0, 1, 0.572549, 1,
-0.244667, 2.097682, -0.7235754, 0, 1, 0.5803922, 1,
-0.2428633, 0.9013727, -0.6776424, 0, 1, 0.5843138, 1,
-0.2418997, -0.5633598, -3.54964, 0, 1, 0.5921569, 1,
-0.2413965, 0.9393972, -1.356934, 0, 1, 0.5960785, 1,
-0.2368309, -1.452814, -5.650873, 0, 1, 0.6039216, 1,
-0.2297845, -0.1846696, -3.433486, 0, 1, 0.6117647, 1,
-0.2280145, -0.3331188, -2.948203, 0, 1, 0.6156863, 1,
-0.2276631, 1.346624, 0.3991072, 0, 1, 0.6235294, 1,
-0.220534, 0.8441484, 0.8261396, 0, 1, 0.627451, 1,
-0.2140203, -0.4202096, -0.9514213, 0, 1, 0.6352941, 1,
-0.2093243, -2.987566, -2.464378, 0, 1, 0.6392157, 1,
-0.2071434, -1.557119, -2.197075, 0, 1, 0.6470588, 1,
-0.2010997, 1.456581, -1.133621, 0, 1, 0.6509804, 1,
-0.1984183, 0.4365416, 0.04531119, 0, 1, 0.6588235, 1,
-0.1975038, -1.279274, -1.918963, 0, 1, 0.6627451, 1,
-0.1949922, 0.5939669, 0.9940392, 0, 1, 0.6705883, 1,
-0.1948917, -0.6403778, -1.345288, 0, 1, 0.6745098, 1,
-0.1897132, 1.12008, -1.265144, 0, 1, 0.682353, 1,
-0.1896691, -0.4827528, -3.104606, 0, 1, 0.6862745, 1,
-0.1877761, -0.8314174, -2.449528, 0, 1, 0.6941177, 1,
-0.1869691, -0.06368201, -2.370307, 0, 1, 0.7019608, 1,
-0.1858215, 0.05349595, 0.1155194, 0, 1, 0.7058824, 1,
-0.1856073, 0.4637336, -0.174904, 0, 1, 0.7137255, 1,
-0.185567, -0.1407074, -2.59694, 0, 1, 0.7176471, 1,
-0.1850332, 1.189128, -2.163706, 0, 1, 0.7254902, 1,
-0.1829603, -0.9829356, -2.241066, 0, 1, 0.7294118, 1,
-0.1829168, 0.449674, 1.329306, 0, 1, 0.7372549, 1,
-0.1786986, 0.5316421, -1.100809, 0, 1, 0.7411765, 1,
-0.1753053, 0.1213327, -2.630343, 0, 1, 0.7490196, 1,
-0.1682601, -1.297771, -2.782055, 0, 1, 0.7529412, 1,
-0.1676889, -0.09893402, -2.921505, 0, 1, 0.7607843, 1,
-0.1658544, 0.3622494, -1.80585, 0, 1, 0.7647059, 1,
-0.1637576, 0.4444132, -0.07398707, 0, 1, 0.772549, 1,
-0.1624272, 0.4224455, -0.997677, 0, 1, 0.7764706, 1,
-0.1610382, 0.383272, 0.923849, 0, 1, 0.7843137, 1,
-0.147187, -0.6990468, -3.595707, 0, 1, 0.7882353, 1,
-0.1459148, -0.5878685, -4.580427, 0, 1, 0.7960784, 1,
-0.145354, -1.418302, -2.931065, 0, 1, 0.8039216, 1,
-0.1405745, -0.2076962, -1.546379, 0, 1, 0.8078431, 1,
-0.1369695, 1.432756, 0.1928122, 0, 1, 0.8156863, 1,
-0.1368907, -0.3207423, -3.954298, 0, 1, 0.8196079, 1,
-0.1346976, 0.8248711, -0.8779704, 0, 1, 0.827451, 1,
-0.1298172, -2.170483, -2.580076, 0, 1, 0.8313726, 1,
-0.1278191, 0.5040165, 0.08859776, 0, 1, 0.8392157, 1,
-0.123525, -0.1493264, -2.979304, 0, 1, 0.8431373, 1,
-0.1232338, 1.274144, -1.13067, 0, 1, 0.8509804, 1,
-0.1208303, 0.107825, -1.196303, 0, 1, 0.854902, 1,
-0.1156859, -1.192786, -1.974217, 0, 1, 0.8627451, 1,
-0.1146033, 0.5849369, -0.1978853, 0, 1, 0.8666667, 1,
-0.1100349, 1.64858, 0.5862102, 0, 1, 0.8745098, 1,
-0.1090775, -1.814319, -2.53238, 0, 1, 0.8784314, 1,
-0.1072124, 0.7247204, 1.518023, 0, 1, 0.8862745, 1,
-0.1006976, 0.1020855, 0.09617388, 0, 1, 0.8901961, 1,
-0.09204081, 1.342038, -0.9505421, 0, 1, 0.8980392, 1,
-0.08949459, -0.6624734, -3.381205, 0, 1, 0.9058824, 1,
-0.08720906, -0.5808922, -2.146622, 0, 1, 0.9098039, 1,
-0.08337806, 0.5353024, -0.5289929, 0, 1, 0.9176471, 1,
-0.0753128, 1.854695, -0.8704592, 0, 1, 0.9215686, 1,
-0.07467144, -0.5532184, -2.778062, 0, 1, 0.9294118, 1,
-0.06742465, -1.112117, -4.239035, 0, 1, 0.9333333, 1,
-0.06094847, 0.7316352, 0.8647833, 0, 1, 0.9411765, 1,
-0.05599075, 0.05074916, -1.900167, 0, 1, 0.945098, 1,
-0.04378409, -0.5634044, -6.15494, 0, 1, 0.9529412, 1,
-0.04100481, 0.3516774, -0.8489812, 0, 1, 0.9568627, 1,
-0.03103305, 0.946048, -0.9004825, 0, 1, 0.9647059, 1,
-0.01796205, -0.8645656, -2.724853, 0, 1, 0.9686275, 1,
-0.007803291, -0.1755208, -4.245945, 0, 1, 0.9764706, 1,
-0.002278645, 0.7266654, -1.702632, 0, 1, 0.9803922, 1,
0.003413106, -1.286436, 2.626233, 0, 1, 0.9882353, 1,
0.006757348, -0.7883755, 3.418402, 0, 1, 0.9921569, 1,
0.007625922, 0.9586208, -0.1073416, 0, 1, 1, 1,
0.009990576, -0.5774979, 3.323161, 0, 0.9921569, 1, 1,
0.01630982, 2.45816, -0.664749, 0, 0.9882353, 1, 1,
0.02003579, -2.218114, 3.460424, 0, 0.9803922, 1, 1,
0.02071495, -0.9746369, 2.426253, 0, 0.9764706, 1, 1,
0.02194539, 1.399768, 0.652791, 0, 0.9686275, 1, 1,
0.0234952, -1.689772, 2.448699, 0, 0.9647059, 1, 1,
0.0276854, 1.378595, 0.4045515, 0, 0.9568627, 1, 1,
0.03176596, -0.4390219, 4.722126, 0, 0.9529412, 1, 1,
0.03362539, -0.8896765, 3.422265, 0, 0.945098, 1, 1,
0.03376133, 0.776817, -0.2047165, 0, 0.9411765, 1, 1,
0.04011345, 0.3415249, 0.3890787, 0, 0.9333333, 1, 1,
0.04078217, -0.9521586, 4.378343, 0, 0.9294118, 1, 1,
0.04162759, -0.05538219, 3.840825, 0, 0.9215686, 1, 1,
0.04508063, 0.8993585, 0.5939751, 0, 0.9176471, 1, 1,
0.04656559, -0.9228349, 3.609317, 0, 0.9098039, 1, 1,
0.04869053, 0.05798461, -0.4291279, 0, 0.9058824, 1, 1,
0.04985476, 0.3386889, 1.294113, 0, 0.8980392, 1, 1,
0.0537092, -0.1486898, 5.180962, 0, 0.8901961, 1, 1,
0.05575414, -0.9268938, 3.14369, 0, 0.8862745, 1, 1,
0.0572985, -1.115808, 3.061832, 0, 0.8784314, 1, 1,
0.0592723, 0.9529123, -0.2781845, 0, 0.8745098, 1, 1,
0.06600244, 0.6858395, 1.094942, 0, 0.8666667, 1, 1,
0.07177088, -1.467925, 2.440528, 0, 0.8627451, 1, 1,
0.07604384, 2.225157, 0.1343205, 0, 0.854902, 1, 1,
0.0791451, 0.1251332, 1.259599, 0, 0.8509804, 1, 1,
0.08232199, -1.525493, 3.949337, 0, 0.8431373, 1, 1,
0.08648152, -0.5898283, 1.609136, 0, 0.8392157, 1, 1,
0.09039945, -2.114361, 3.61957, 0, 0.8313726, 1, 1,
0.09205772, -0.3779395, 1.846308, 0, 0.827451, 1, 1,
0.09281631, 1.068092, 0.3199274, 0, 0.8196079, 1, 1,
0.0933678, -0.4025771, 4.163453, 0, 0.8156863, 1, 1,
0.1013879, -0.9440214, 1.827401, 0, 0.8078431, 1, 1,
0.1018639, 1.473272, -0.05823812, 0, 0.8039216, 1, 1,
0.1079112, 0.8029058, -0.8127757, 0, 0.7960784, 1, 1,
0.1089144, 0.1081057, 1.24661, 0, 0.7882353, 1, 1,
0.1135071, 0.05310531, 2.253627, 0, 0.7843137, 1, 1,
0.1163279, 0.03754126, -0.1823909, 0, 0.7764706, 1, 1,
0.1191897, 0.1094425, -0.07916412, 0, 0.772549, 1, 1,
0.1202046, -0.788702, 3.222841, 0, 0.7647059, 1, 1,
0.1203358, 0.807483, 0.1828942, 0, 0.7607843, 1, 1,
0.1220413, -1.843491, 2.399974, 0, 0.7529412, 1, 1,
0.1277353, 0.6734468, 0.2007829, 0, 0.7490196, 1, 1,
0.1331119, 0.4903848, 0.707289, 0, 0.7411765, 1, 1,
0.1331903, -1.489239, 3.302706, 0, 0.7372549, 1, 1,
0.1341017, -1.270078, 2.796527, 0, 0.7294118, 1, 1,
0.1435877, -0.7157274, 3.673564, 0, 0.7254902, 1, 1,
0.1455593, -0.1101412, 1.543529, 0, 0.7176471, 1, 1,
0.1471398, 0.4323705, -0.4654198, 0, 0.7137255, 1, 1,
0.1502597, 0.4208215, -1.40966, 0, 0.7058824, 1, 1,
0.1519179, -0.6310837, 1.793428, 0, 0.6980392, 1, 1,
0.1545623, 0.8969188, 1.362104, 0, 0.6941177, 1, 1,
0.1550792, -0.6311315, 3.6042, 0, 0.6862745, 1, 1,
0.1570995, 1.995243, 0.7661761, 0, 0.682353, 1, 1,
0.1571932, 0.7310783, 0.7747392, 0, 0.6745098, 1, 1,
0.16584, 0.5698975, -0.06177609, 0, 0.6705883, 1, 1,
0.1671265, -1.572986, 3.481379, 0, 0.6627451, 1, 1,
0.1731434, 0.6438706, -1.473455, 0, 0.6588235, 1, 1,
0.1734403, -1.336148, 1.613333, 0, 0.6509804, 1, 1,
0.1786977, -1.879749, 1.796298, 0, 0.6470588, 1, 1,
0.1814657, -1.227922, 3.648677, 0, 0.6392157, 1, 1,
0.1815881, -1.703825, 2.973143, 0, 0.6352941, 1, 1,
0.1876999, 1.464429, -0.1626635, 0, 0.627451, 1, 1,
0.1881699, 2.565367, -0.890725, 0, 0.6235294, 1, 1,
0.1905601, 0.8569102, -0.4248222, 0, 0.6156863, 1, 1,
0.1942838, 0.05795096, 1.88013, 0, 0.6117647, 1, 1,
0.1958994, -0.1334794, 3.140948, 0, 0.6039216, 1, 1,
0.1960693, -1.232619, 3.96495, 0, 0.5960785, 1, 1,
0.197908, 0.2700729, 1.462207, 0, 0.5921569, 1, 1,
0.19964, -1.595991, 2.17811, 0, 0.5843138, 1, 1,
0.2031591, -0.05558956, 1.714458, 0, 0.5803922, 1, 1,
0.2053666, -1.417639, 3.169754, 0, 0.572549, 1, 1,
0.2061993, -0.7157294, 1.786116, 0, 0.5686275, 1, 1,
0.2158719, -0.6149481, 2.345611, 0, 0.5607843, 1, 1,
0.2196396, -0.8253386, 3.369951, 0, 0.5568628, 1, 1,
0.2233984, -0.1384742, 1.23106, 0, 0.5490196, 1, 1,
0.225899, 0.9023014, -0.5817734, 0, 0.5450981, 1, 1,
0.2267022, 0.2093647, -0.3696266, 0, 0.5372549, 1, 1,
0.230059, -0.02846096, 3.827042, 0, 0.5333334, 1, 1,
0.2323331, 0.5429942, 0.5671897, 0, 0.5254902, 1, 1,
0.2364857, -1.338274, 3.720366, 0, 0.5215687, 1, 1,
0.237631, -0.8471966, 1.627319, 0, 0.5137255, 1, 1,
0.2401058, 0.2124874, 2.084379, 0, 0.509804, 1, 1,
0.2409114, 1.190385, 1.298614, 0, 0.5019608, 1, 1,
0.2410354, -1.397859, 1.830505, 0, 0.4941176, 1, 1,
0.2526503, 1.163876, -1.03008, 0, 0.4901961, 1, 1,
0.2557568, 0.01776832, 1.315753, 0, 0.4823529, 1, 1,
0.2584731, 0.1790754, 0.02743168, 0, 0.4784314, 1, 1,
0.2596336, -0.01058374, 2.954087, 0, 0.4705882, 1, 1,
0.2649637, 0.5026551, -1.007769, 0, 0.4666667, 1, 1,
0.2816898, 1.322601, -0.08506209, 0, 0.4588235, 1, 1,
0.2823243, 0.5486886, 1.316512, 0, 0.454902, 1, 1,
0.2882992, -0.9588223, 1.878286, 0, 0.4470588, 1, 1,
0.2886392, 1.297517, -0.2346364, 0, 0.4431373, 1, 1,
0.2904639, 0.2248108, 0.3287986, 0, 0.4352941, 1, 1,
0.2932517, -1.923255, 3.60902, 0, 0.4313726, 1, 1,
0.2940354, 0.5737044, 0.3891591, 0, 0.4235294, 1, 1,
0.2965173, -0.8132654, 2.002552, 0, 0.4196078, 1, 1,
0.3015326, -0.0415059, 1.5199, 0, 0.4117647, 1, 1,
0.3030917, 1.383353, 1.046749, 0, 0.4078431, 1, 1,
0.3033305, 0.9268886, 0.7927561, 0, 0.4, 1, 1,
0.3054077, -0.8347597, 2.957553, 0, 0.3921569, 1, 1,
0.3184665, 1.210446, 0.5397757, 0, 0.3882353, 1, 1,
0.322392, 0.5492923, 0.6569191, 0, 0.3803922, 1, 1,
0.3247896, -0.2229735, 3.146516, 0, 0.3764706, 1, 1,
0.3276214, 1.030102, -0.01369988, 0, 0.3686275, 1, 1,
0.3293023, -1.053785, 0.5178064, 0, 0.3647059, 1, 1,
0.3294227, 0.7804239, -0.4729024, 0, 0.3568628, 1, 1,
0.3296856, -2.24499, 3.649577, 0, 0.3529412, 1, 1,
0.3308694, 2.143059, -0.5407003, 0, 0.345098, 1, 1,
0.3323926, -1.178712, 4.034656, 0, 0.3411765, 1, 1,
0.3332145, -0.6715258, 3.278178, 0, 0.3333333, 1, 1,
0.3334391, 0.4219336, 0.7324754, 0, 0.3294118, 1, 1,
0.3337691, -0.4057544, 1.745137, 0, 0.3215686, 1, 1,
0.3367559, -0.09632556, 1.172529, 0, 0.3176471, 1, 1,
0.3376122, 1.258655, 0.5282071, 0, 0.3098039, 1, 1,
0.339162, 0.04413759, 1.694998, 0, 0.3058824, 1, 1,
0.3405005, -1.779818, 3.213225, 0, 0.2980392, 1, 1,
0.3461028, 0.0623884, 1.964381, 0, 0.2901961, 1, 1,
0.3480399, 1.597877, 1.748915, 0, 0.2862745, 1, 1,
0.3496965, -1.485692, 3.841923, 0, 0.2784314, 1, 1,
0.3562338, 0.5776933, 1.260196, 0, 0.2745098, 1, 1,
0.3566102, 0.6185404, 0.09191755, 0, 0.2666667, 1, 1,
0.3577459, -1.078478, 5.271644, 0, 0.2627451, 1, 1,
0.3588326, 1.852113, -0.4557787, 0, 0.254902, 1, 1,
0.3592599, -0.5990996, 1.810739, 0, 0.2509804, 1, 1,
0.3606761, -0.3222149, 2.636437, 0, 0.2431373, 1, 1,
0.3654157, -0.66279, 0.8920302, 0, 0.2392157, 1, 1,
0.3673038, 0.2016468, 1.720613, 0, 0.2313726, 1, 1,
0.3696946, -0.9668536, 3.773225, 0, 0.227451, 1, 1,
0.3715591, -0.6157856, 2.379713, 0, 0.2196078, 1, 1,
0.3716467, 0.4407857, 1.780428, 0, 0.2156863, 1, 1,
0.3728688, 1.526347, -0.08826227, 0, 0.2078431, 1, 1,
0.3732465, -0.1719373, 3.011484, 0, 0.2039216, 1, 1,
0.3782328, 0.3991166, 0.9137245, 0, 0.1960784, 1, 1,
0.3786161, 0.3485414, 1.087421, 0, 0.1882353, 1, 1,
0.3808672, 1.63413, 0.5197947, 0, 0.1843137, 1, 1,
0.381559, -0.195281, 3.744842, 0, 0.1764706, 1, 1,
0.3815913, -1.182265, 3.316024, 0, 0.172549, 1, 1,
0.3897857, 1.1846, -0.5894905, 0, 0.1647059, 1, 1,
0.3958269, 0.4893464, -1.294895, 0, 0.1607843, 1, 1,
0.4002209, -1.76763, 2.343945, 0, 0.1529412, 1, 1,
0.4003652, 1.152001, 0.6218936, 0, 0.1490196, 1, 1,
0.4024919, -1.328548, 1.385119, 0, 0.1411765, 1, 1,
0.4061892, 0.8450004, 3.41433, 0, 0.1372549, 1, 1,
0.4076566, 0.3173862, 2.555793, 0, 0.1294118, 1, 1,
0.4082642, -0.8270585, 2.741335, 0, 0.1254902, 1, 1,
0.4136118, -0.01068472, 2.84483, 0, 0.1176471, 1, 1,
0.4212409, 2.856637, 1.285418, 0, 0.1137255, 1, 1,
0.4213472, -0.5897821, 5.041466, 0, 0.1058824, 1, 1,
0.4251473, -0.5780982, 1.045808, 0, 0.09803922, 1, 1,
0.4260994, -0.1824917, 2.73868, 0, 0.09411765, 1, 1,
0.439512, 1.101224, -0.3008561, 0, 0.08627451, 1, 1,
0.4419938, -0.3374405, 2.477181, 0, 0.08235294, 1, 1,
0.4460154, 1.325304, -0.1250565, 0, 0.07450981, 1, 1,
0.4481826, -1.76132, 2.928061, 0, 0.07058824, 1, 1,
0.4484747, -0.2810068, 1.815623, 0, 0.0627451, 1, 1,
0.449369, 0.5540778, 1.546099, 0, 0.05882353, 1, 1,
0.4501611, 2.206304, 0.9283398, 0, 0.05098039, 1, 1,
0.4648176, -0.864427, 2.433461, 0, 0.04705882, 1, 1,
0.4672121, 1.302035, -0.8458122, 0, 0.03921569, 1, 1,
0.4686472, 0.06736436, 2.059646, 0, 0.03529412, 1, 1,
0.4690095, -1.204096, 2.550732, 0, 0.02745098, 1, 1,
0.4721332, -1.622529, 2.665935, 0, 0.02352941, 1, 1,
0.4724577, -1.938132, 2.978067, 0, 0.01568628, 1, 1,
0.4744549, -0.009094291, 0.7466693, 0, 0.01176471, 1, 1,
0.4753696, 0.6649245, 1.615297, 0, 0.003921569, 1, 1,
0.4789354, 0.7938689, -0.9288924, 0.003921569, 0, 1, 1,
0.4790755, 1.099031, -0.2744908, 0.007843138, 0, 1, 1,
0.483967, 1.342624, 0.8963833, 0.01568628, 0, 1, 1,
0.4849303, 2.906155, 0.7563302, 0.01960784, 0, 1, 1,
0.4889067, -0.7770606, 2.475246, 0.02745098, 0, 1, 1,
0.4926719, 0.1809793, -0.2776592, 0.03137255, 0, 1, 1,
0.4948532, -1.174225, 1.13981, 0.03921569, 0, 1, 1,
0.4957696, -1.040904, 4.816237, 0.04313726, 0, 1, 1,
0.4959155, -0.1354894, 2.867039, 0.05098039, 0, 1, 1,
0.4966993, 1.233672, -0.1668262, 0.05490196, 0, 1, 1,
0.5009567, -0.4016728, 1.369217, 0.0627451, 0, 1, 1,
0.5039644, 1.238078, -0.4961101, 0.06666667, 0, 1, 1,
0.5042282, 0.6992434, 0.2375066, 0.07450981, 0, 1, 1,
0.5046044, 0.4450883, 0.8488677, 0.07843138, 0, 1, 1,
0.5064278, -1.69433, 3.063497, 0.08627451, 0, 1, 1,
0.5108534, 0.4777732, 1.53212, 0.09019608, 0, 1, 1,
0.5139818, 0.1069914, 0.7457691, 0.09803922, 0, 1, 1,
0.5158288, 0.6073203, -0.766673, 0.1058824, 0, 1, 1,
0.5234399, -0.7512023, 3.88285, 0.1098039, 0, 1, 1,
0.5252907, 1.072514, 2.329091, 0.1176471, 0, 1, 1,
0.5260937, -2.002383, 2.314531, 0.1215686, 0, 1, 1,
0.5311756, 0.6690567, 1.798071, 0.1294118, 0, 1, 1,
0.5332443, -1.188548, 1.653249, 0.1333333, 0, 1, 1,
0.5370638, 0.1656218, 0.8703416, 0.1411765, 0, 1, 1,
0.5393012, -0.3094993, 2.095407, 0.145098, 0, 1, 1,
0.5408314, 1.644745, -1.108636, 0.1529412, 0, 1, 1,
0.5478923, -1.471211, 3.127381, 0.1568628, 0, 1, 1,
0.551314, -0.5942878, 0.7973242, 0.1647059, 0, 1, 1,
0.5534319, 0.9402948, 1.464106, 0.1686275, 0, 1, 1,
0.5659018, -1.178091, 1.931126, 0.1764706, 0, 1, 1,
0.5709092, -0.1551475, 2.061036, 0.1803922, 0, 1, 1,
0.5724777, 0.7844189, -0.3561283, 0.1882353, 0, 1, 1,
0.5929343, -1.662737, 1.542488, 0.1921569, 0, 1, 1,
0.5949726, -1.658007, 3.012666, 0.2, 0, 1, 1,
0.5955297, -0.7495322, 0.5780782, 0.2078431, 0, 1, 1,
0.5983521, 3.116436, -0.8840584, 0.2117647, 0, 1, 1,
0.6021754, 0.7477299, 1.326975, 0.2196078, 0, 1, 1,
0.6044999, 0.529375, -0.007614386, 0.2235294, 0, 1, 1,
0.6060666, -0.3002096, 1.630986, 0.2313726, 0, 1, 1,
0.6061299, 0.1980344, 1.451, 0.2352941, 0, 1, 1,
0.6065331, 0.8765804, 0.03028604, 0.2431373, 0, 1, 1,
0.6181899, 1.628592, 1.958795, 0.2470588, 0, 1, 1,
0.6216012, -1.261671, 3.453161, 0.254902, 0, 1, 1,
0.6229166, -0.9660209, 3.179745, 0.2588235, 0, 1, 1,
0.6253256, 1.525964, -0.1484353, 0.2666667, 0, 1, 1,
0.6371821, 0.8780612, 1.313098, 0.2705882, 0, 1, 1,
0.6400949, -1.703353, 3.515326, 0.2784314, 0, 1, 1,
0.6421263, 0.3050111, 1.198906, 0.282353, 0, 1, 1,
0.647343, -0.3574025, 1.435276, 0.2901961, 0, 1, 1,
0.6474264, -1.268776, 2.964126, 0.2941177, 0, 1, 1,
0.6506297, -1.142024, 2.212543, 0.3019608, 0, 1, 1,
0.6516522, -0.1228373, 1.497873, 0.3098039, 0, 1, 1,
0.6516562, 0.5255752, 0.8206406, 0.3137255, 0, 1, 1,
0.6581644, -0.5246207, 2.767923, 0.3215686, 0, 1, 1,
0.6673055, -0.8717883, 2.761426, 0.3254902, 0, 1, 1,
0.6703234, 0.2985966, 1.156198, 0.3333333, 0, 1, 1,
0.6729443, -1.455198, 0.95936, 0.3372549, 0, 1, 1,
0.6748306, -0.5908399, 1.579236, 0.345098, 0, 1, 1,
0.6760279, 0.2704576, 0.8044127, 0.3490196, 0, 1, 1,
0.6816961, 2.72613, -1.140112, 0.3568628, 0, 1, 1,
0.691676, -0.922465, 2.490297, 0.3607843, 0, 1, 1,
0.6919501, -1.337336, 1.91276, 0.3686275, 0, 1, 1,
0.6934019, -0.7002038, 1.994712, 0.372549, 0, 1, 1,
0.6951952, 0.7184685, -0.006797446, 0.3803922, 0, 1, 1,
0.6960806, 0.7112629, 0.4876256, 0.3843137, 0, 1, 1,
0.7088136, -0.04562143, -0.2310261, 0.3921569, 0, 1, 1,
0.7099671, 0.9918716, -0.005895712, 0.3960784, 0, 1, 1,
0.713241, 0.571211, 1.768731, 0.4039216, 0, 1, 1,
0.714969, -0.9030528, 2.036253, 0.4117647, 0, 1, 1,
0.7295863, -0.3671165, 0.556273, 0.4156863, 0, 1, 1,
0.7357041, 0.5401545, 1.491934, 0.4235294, 0, 1, 1,
0.737596, -1.074195, 2.242505, 0.427451, 0, 1, 1,
0.7393025, -0.1619338, 3.332653, 0.4352941, 0, 1, 1,
0.7397785, -0.01269833, 1.948585, 0.4392157, 0, 1, 1,
0.740204, 1.134419, 1.211444, 0.4470588, 0, 1, 1,
0.7436977, 1.254375, 1.138852, 0.4509804, 0, 1, 1,
0.7453558, 1.213074, 1.088943, 0.4588235, 0, 1, 1,
0.7465426, -0.2696098, 1.762653, 0.4627451, 0, 1, 1,
0.7470263, -1.200023, 2.153359, 0.4705882, 0, 1, 1,
0.7511532, -0.5602202, 1.063692, 0.4745098, 0, 1, 1,
0.7519339, -0.3965771, 1.644137, 0.4823529, 0, 1, 1,
0.7523295, -1.593736, 1.849334, 0.4862745, 0, 1, 1,
0.7568073, 1.454428, 0.8672488, 0.4941176, 0, 1, 1,
0.7595553, -1.024265, 2.396164, 0.5019608, 0, 1, 1,
0.7602134, 0.1997179, 0.5721592, 0.5058824, 0, 1, 1,
0.7656946, -0.1957993, 1.403275, 0.5137255, 0, 1, 1,
0.7670446, -0.2089924, 1.742138, 0.5176471, 0, 1, 1,
0.7693369, 1.697151, -0.960118, 0.5254902, 0, 1, 1,
0.7741657, 0.2696506, 0.7553561, 0.5294118, 0, 1, 1,
0.7823102, 0.8177729, 1.992592, 0.5372549, 0, 1, 1,
0.7832876, -0.1188619, 0.3786768, 0.5411765, 0, 1, 1,
0.7846814, -0.4438107, 3.248152, 0.5490196, 0, 1, 1,
0.7941771, -1.155444, 0.4367535, 0.5529412, 0, 1, 1,
0.7972325, 0.999747, 0.3618636, 0.5607843, 0, 1, 1,
0.7976098, 0.730405, 1.963089, 0.5647059, 0, 1, 1,
0.7990944, 0.5000718, 2.004241, 0.572549, 0, 1, 1,
0.8026204, -0.1096268, 2.016321, 0.5764706, 0, 1, 1,
0.8051001, 0.8651271, 2.263539, 0.5843138, 0, 1, 1,
0.809059, 0.3081212, 0.709146, 0.5882353, 0, 1, 1,
0.8136372, -0.03180512, -0.2221288, 0.5960785, 0, 1, 1,
0.8145056, -0.3434034, -1.731186, 0.6039216, 0, 1, 1,
0.8166113, -0.8080033, 3.796, 0.6078432, 0, 1, 1,
0.8178185, 1.108019, 1.827363, 0.6156863, 0, 1, 1,
0.8194414, -0.3384393, 2.829712, 0.6196079, 0, 1, 1,
0.8205531, -0.6060452, 2.696015, 0.627451, 0, 1, 1,
0.8214301, 0.4563532, 1.965728, 0.6313726, 0, 1, 1,
0.8215475, 0.3757918, 0.6441086, 0.6392157, 0, 1, 1,
0.8227392, 1.387053, -0.02479763, 0.6431373, 0, 1, 1,
0.8254527, 1.105621, -0.9029033, 0.6509804, 0, 1, 1,
0.8259683, 0.3729413, -1.581676, 0.654902, 0, 1, 1,
0.831763, 1.059647, -0.7458209, 0.6627451, 0, 1, 1,
0.8329765, -0.01357697, 1.742421, 0.6666667, 0, 1, 1,
0.8330845, 0.2452489, 1.459815, 0.6745098, 0, 1, 1,
0.845154, 0.2718513, 0.8056335, 0.6784314, 0, 1, 1,
0.8462031, -1.620061, 2.800001, 0.6862745, 0, 1, 1,
0.8485013, 0.3001945, -0.7237358, 0.6901961, 0, 1, 1,
0.8526593, 0.1600328, 1.043284, 0.6980392, 0, 1, 1,
0.863597, 0.04481474, 1.374488, 0.7058824, 0, 1, 1,
0.8666736, 0.1342065, 1.821332, 0.7098039, 0, 1, 1,
0.8667585, 1.349672, 0.6888725, 0.7176471, 0, 1, 1,
0.8678107, -0.1968507, -0.3529562, 0.7215686, 0, 1, 1,
0.8750524, -0.3244784, 3.846911, 0.7294118, 0, 1, 1,
0.8788742, -0.965489, 2.814145, 0.7333333, 0, 1, 1,
0.8887334, -1.291341, 1.337736, 0.7411765, 0, 1, 1,
0.8931418, -0.1464159, 2.357746, 0.7450981, 0, 1, 1,
0.8943226, -0.4561586, 2.51697, 0.7529412, 0, 1, 1,
0.8981272, 0.08235357, 1.907677, 0.7568628, 0, 1, 1,
0.9050087, 0.5814322, -0.8482508, 0.7647059, 0, 1, 1,
0.9053379, 0.3674661, 0.6411915, 0.7686275, 0, 1, 1,
0.9060622, -0.8967909, 3.288258, 0.7764706, 0, 1, 1,
0.9123414, 1.327669, -0.7065036, 0.7803922, 0, 1, 1,
0.9185413, -0.08288471, 2.571844, 0.7882353, 0, 1, 1,
0.9212118, 2.356756, 0.5496278, 0.7921569, 0, 1, 1,
0.9228231, 0.2103978, 1.335006, 0.8, 0, 1, 1,
0.925997, 0.09907603, 1.437937, 0.8078431, 0, 1, 1,
0.9277444, 1.019098, -0.7090753, 0.8117647, 0, 1, 1,
0.9279464, 0.2555181, 0.6528244, 0.8196079, 0, 1, 1,
0.9290022, 1.790943, -0.1245978, 0.8235294, 0, 1, 1,
0.9346324, -1.150883, 3.565677, 0.8313726, 0, 1, 1,
0.9359283, -0.6494662, 1.813233, 0.8352941, 0, 1, 1,
0.9368176, -1.677124, 3.33229, 0.8431373, 0, 1, 1,
0.9416395, 0.7904311, 1.465728, 0.8470588, 0, 1, 1,
0.9440367, -0.9136204, 2.950005, 0.854902, 0, 1, 1,
0.9501265, 1.162902, 1.115131, 0.8588235, 0, 1, 1,
0.954999, -1.112648, 1.832633, 0.8666667, 0, 1, 1,
0.9566772, 1.948854, 1.070472, 0.8705882, 0, 1, 1,
0.9613376, -0.333295, 2.872581, 0.8784314, 0, 1, 1,
0.966544, 1.564363, 1.91202, 0.8823529, 0, 1, 1,
0.9672915, 0.056545, 3.359684, 0.8901961, 0, 1, 1,
0.9755185, -1.233387, 3.682729, 0.8941177, 0, 1, 1,
0.9780567, -1.772941, 4.206903, 0.9019608, 0, 1, 1,
0.9805758, 0.02791313, 0.5771978, 0.9098039, 0, 1, 1,
0.9811782, -0.4912101, 2.713055, 0.9137255, 0, 1, 1,
0.9815333, 1.992775, 0.09801075, 0.9215686, 0, 1, 1,
0.9825885, -1.516808, 1.955114, 0.9254902, 0, 1, 1,
0.9834647, 1.786129, 2.387966, 0.9333333, 0, 1, 1,
0.9882929, -1.415998, 1.953265, 0.9372549, 0, 1, 1,
0.9974774, 0.1248118, 1.496103, 0.945098, 0, 1, 1,
1.004059, -0.3762832, 0.2837515, 0.9490196, 0, 1, 1,
1.005445, -0.8145026, 2.414344, 0.9568627, 0, 1, 1,
1.007791, -0.08604956, 1.711573, 0.9607843, 0, 1, 1,
1.015523, 0.4811897, 1.959823, 0.9686275, 0, 1, 1,
1.015842, -0.7892366, 4.000465, 0.972549, 0, 1, 1,
1.016584, -0.6034783, 1.801397, 0.9803922, 0, 1, 1,
1.017178, 0.9615811, -0.8213366, 0.9843137, 0, 1, 1,
1.017503, 1.514886, 1.691594, 0.9921569, 0, 1, 1,
1.022159, 0.3584988, 1.784631, 0.9960784, 0, 1, 1,
1.025114, -0.7742839, 2.341317, 1, 0, 0.9960784, 1,
1.025567, 0.6598055, 1.023853, 1, 0, 0.9882353, 1,
1.028311, -0.8864536, 1.490302, 1, 0, 0.9843137, 1,
1.028315, 0.01595001, 2.827278, 1, 0, 0.9764706, 1,
1.029771, -1.344713, 3.08591, 1, 0, 0.972549, 1,
1.03226, -0.9669287, 2.558879, 1, 0, 0.9647059, 1,
1.044385, 0.4093635, 1.129463, 1, 0, 0.9607843, 1,
1.045251, 0.2295859, 1.338841, 1, 0, 0.9529412, 1,
1.051135, 0.6998296, -0.339276, 1, 0, 0.9490196, 1,
1.052498, -0.8057224, 1.532256, 1, 0, 0.9411765, 1,
1.053791, -0.1366825, 1.211591, 1, 0, 0.9372549, 1,
1.064418, -1.099609, 3.313995, 1, 0, 0.9294118, 1,
1.067266, -0.6944784, 2.893093, 1, 0, 0.9254902, 1,
1.069619, 0.6851433, 2.608067, 1, 0, 0.9176471, 1,
1.075164, -0.3022501, 2.030357, 1, 0, 0.9137255, 1,
1.076343, -0.5524049, 1.163576, 1, 0, 0.9058824, 1,
1.077494, -2.33049, 2.558323, 1, 0, 0.9019608, 1,
1.087719, 0.9904938, 0.7189395, 1, 0, 0.8941177, 1,
1.105941, 1.051595, 0.8085943, 1, 0, 0.8862745, 1,
1.109183, 0.0852384, 1.591119, 1, 0, 0.8823529, 1,
1.111065, -2.331612, 3.176887, 1, 0, 0.8745098, 1,
1.113157, 0.2849639, 2.303805, 1, 0, 0.8705882, 1,
1.122312, -1.849622, 4.250618, 1, 0, 0.8627451, 1,
1.12614, 1.941509, 0.1327568, 1, 0, 0.8588235, 1,
1.127126, 1.736302, 0.9119248, 1, 0, 0.8509804, 1,
1.128047, -1.031482, 1.776453, 1, 0, 0.8470588, 1,
1.13098, -0.2585029, 2.731164, 1, 0, 0.8392157, 1,
1.1345, 1.241716, 1.253239, 1, 0, 0.8352941, 1,
1.136335, 0.285778, 1.902037, 1, 0, 0.827451, 1,
1.137032, 0.2089524, 1.175594, 1, 0, 0.8235294, 1,
1.137139, 0.05626627, 1.355395, 1, 0, 0.8156863, 1,
1.139152, -0.06412622, 0.6484241, 1, 0, 0.8117647, 1,
1.144978, 1.066194, 0.1247878, 1, 0, 0.8039216, 1,
1.145715, -0.7586119, 3.45657, 1, 0, 0.7960784, 1,
1.162383, -0.9475953, 1.829256, 1, 0, 0.7921569, 1,
1.16571, 0.1573288, 1.918402, 1, 0, 0.7843137, 1,
1.182813, 0.1477184, 2.296057, 1, 0, 0.7803922, 1,
1.190576, 0.9964339, 0.3398388, 1, 0, 0.772549, 1,
1.191832, -0.002331838, 2.78657, 1, 0, 0.7686275, 1,
1.195845, -1.749661, 2.948052, 1, 0, 0.7607843, 1,
1.205409, 0.3875624, 1.096461, 1, 0, 0.7568628, 1,
1.212916, 0.8306795, 1.951344, 1, 0, 0.7490196, 1,
1.225116, -2.823193, 2.004874, 1, 0, 0.7450981, 1,
1.254406, -1.185172, 1.319973, 1, 0, 0.7372549, 1,
1.263566, -0.007140281, 1.679744, 1, 0, 0.7333333, 1,
1.263909, 0.005271691, 1.687428, 1, 0, 0.7254902, 1,
1.266864, -0.0926875, 2.408667, 1, 0, 0.7215686, 1,
1.268841, -1.488343, 2.478786, 1, 0, 0.7137255, 1,
1.270652, 0.6976869, 1.165542, 1, 0, 0.7098039, 1,
1.274747, -0.03164754, 1.13914, 1, 0, 0.7019608, 1,
1.280504, 0.4610704, 0.1297672, 1, 0, 0.6941177, 1,
1.28222, 0.1504486, 1.662957, 1, 0, 0.6901961, 1,
1.293002, -0.3789257, 3.044939, 1, 0, 0.682353, 1,
1.293314, -0.2384475, 1.74486, 1, 0, 0.6784314, 1,
1.297085, 0.02911605, 1.554401, 1, 0, 0.6705883, 1,
1.301288, -1.366157, 2.770358, 1, 0, 0.6666667, 1,
1.302874, 0.5378334, 1.409759, 1, 0, 0.6588235, 1,
1.313822, -1.329371, 4.365757, 1, 0, 0.654902, 1,
1.31521, 0.01821155, 1.422779, 1, 0, 0.6470588, 1,
1.323075, -0.9115517, 0.9602022, 1, 0, 0.6431373, 1,
1.324776, -0.5018154, 1.909612, 1, 0, 0.6352941, 1,
1.327419, 0.04178225, 2.197889, 1, 0, 0.6313726, 1,
1.327517, 1.315615, 0.5119944, 1, 0, 0.6235294, 1,
1.328643, -1.792838, 3.883973, 1, 0, 0.6196079, 1,
1.330895, -0.9506132, 1.421507, 1, 0, 0.6117647, 1,
1.344707, 0.4675108, 0.3891637, 1, 0, 0.6078432, 1,
1.346991, -0.1905888, 2.834574, 1, 0, 0.6, 1,
1.352435, 1.368572, 2.948758, 1, 0, 0.5921569, 1,
1.357571, -0.1970662, 3.42539, 1, 0, 0.5882353, 1,
1.359038, -2.271207, 2.94141, 1, 0, 0.5803922, 1,
1.374142, -1.842882, 0.7566181, 1, 0, 0.5764706, 1,
1.37718, 1.799055, 0.8105907, 1, 0, 0.5686275, 1,
1.378543, -0.004958986, 1.065007, 1, 0, 0.5647059, 1,
1.37992, -0.1664445, 0.5114667, 1, 0, 0.5568628, 1,
1.382408, -0.370694, 1.878055, 1, 0, 0.5529412, 1,
1.383728, 0.1503625, 3.627516, 1, 0, 0.5450981, 1,
1.386365, -0.07820596, 1.987231, 1, 0, 0.5411765, 1,
1.386711, -0.1598139, -0.2458445, 1, 0, 0.5333334, 1,
1.389216, 0.8082267, 2.52614, 1, 0, 0.5294118, 1,
1.392334, -0.969365, 1.481233, 1, 0, 0.5215687, 1,
1.430889, -1.097734, 3.680536, 1, 0, 0.5176471, 1,
1.435094, -0.1473499, 1.57755, 1, 0, 0.509804, 1,
1.436878, -0.3534071, 1.046767, 1, 0, 0.5058824, 1,
1.438301, -0.159514, 1.072729, 1, 0, 0.4980392, 1,
1.440638, 0.4732275, 2.196071, 1, 0, 0.4901961, 1,
1.441765, -0.357032, 0.7991271, 1, 0, 0.4862745, 1,
1.445975, 0.507248, 2.441586, 1, 0, 0.4784314, 1,
1.448086, -0.1711196, 4.250478, 1, 0, 0.4745098, 1,
1.450773, -0.9525511, 2.033635, 1, 0, 0.4666667, 1,
1.459642, 0.435433, 1.60078, 1, 0, 0.4627451, 1,
1.461861, -0.1572513, 1.207963, 1, 0, 0.454902, 1,
1.469337, 0.3460938, 0.9271179, 1, 0, 0.4509804, 1,
1.495859, -0.582659, 2.619597, 1, 0, 0.4431373, 1,
1.504132, -0.3326612, -0.01058133, 1, 0, 0.4392157, 1,
1.508, 0.8120532, 1.210508, 1, 0, 0.4313726, 1,
1.508973, -0.9423094, 1.771649, 1, 0, 0.427451, 1,
1.515005, -0.9985926, 2.401275, 1, 0, 0.4196078, 1,
1.519481, 0.4018531, 0.6422609, 1, 0, 0.4156863, 1,
1.534356, -0.7082632, 1.117379, 1, 0, 0.4078431, 1,
1.53451, 0.4251592, 0.6949981, 1, 0, 0.4039216, 1,
1.54618, -0.1194863, 1.546339, 1, 0, 0.3960784, 1,
1.546618, -0.4630881, 1.154106, 1, 0, 0.3882353, 1,
1.549905, -2.473976, 1.854555, 1, 0, 0.3843137, 1,
1.5551, 1.408702, 0.8300511, 1, 0, 0.3764706, 1,
1.556889, -0.6071988, -0.2967978, 1, 0, 0.372549, 1,
1.584283, -0.2388746, 2.986014, 1, 0, 0.3647059, 1,
1.600778, -0.9653435, 2.927503, 1, 0, 0.3607843, 1,
1.614936, -0.6697526, 0.8406675, 1, 0, 0.3529412, 1,
1.630303, 0.8505094, -0.2440133, 1, 0, 0.3490196, 1,
1.636625, -0.6037672, 2.315539, 1, 0, 0.3411765, 1,
1.640471, -1.244805, 1.446956, 1, 0, 0.3372549, 1,
1.654845, -0.04280309, 0.8784308, 1, 0, 0.3294118, 1,
1.661447, 0.02535344, 0.7128353, 1, 0, 0.3254902, 1,
1.666707, 1.632737, 0.9586163, 1, 0, 0.3176471, 1,
1.674478, -0.5909042, 2.46326, 1, 0, 0.3137255, 1,
1.697417, 1.895965, 1.311309, 1, 0, 0.3058824, 1,
1.700767, -0.4991739, 1.78729, 1, 0, 0.2980392, 1,
1.702235, 0.2694671, 2.157423, 1, 0, 0.2941177, 1,
1.709602, 0.01512837, 0.9423124, 1, 0, 0.2862745, 1,
1.725187, 0.3344349, 1.767884, 1, 0, 0.282353, 1,
1.734077, 0.6105626, 2.872015, 1, 0, 0.2745098, 1,
1.739245, 0.6066495, 0.09797714, 1, 0, 0.2705882, 1,
1.739689, 2.593768, 0.2312875, 1, 0, 0.2627451, 1,
1.782684, 0.09662864, 1.439269, 1, 0, 0.2588235, 1,
1.794894, 0.6929886, 1.320062, 1, 0, 0.2509804, 1,
1.800667, 0.92538, 0.704053, 1, 0, 0.2470588, 1,
1.814799, -1.112491, 2.710148, 1, 0, 0.2392157, 1,
1.832442, -0.1694212, 0.7385387, 1, 0, 0.2352941, 1,
1.843415, -0.008086943, 1.906373, 1, 0, 0.227451, 1,
1.868861, -0.3973091, 2.469551, 1, 0, 0.2235294, 1,
1.879724, 0.3202024, 0.7108604, 1, 0, 0.2156863, 1,
1.8915, -0.9894027, 1.797391, 1, 0, 0.2117647, 1,
1.896583, 1.314207, 0.9018987, 1, 0, 0.2039216, 1,
1.904493, 0.4828063, 2.19474, 1, 0, 0.1960784, 1,
1.915011, 0.9017678, 1.908928, 1, 0, 0.1921569, 1,
1.950339, 0.6029831, 0.9034441, 1, 0, 0.1843137, 1,
1.968611, 0.8491145, 2.563423, 1, 0, 0.1803922, 1,
1.976434, -0.7362776, 1.160573, 1, 0, 0.172549, 1,
1.984818, 0.6660492, 2.026789, 1, 0, 0.1686275, 1,
1.985926, 1.927408, -0.3030602, 1, 0, 0.1607843, 1,
2.017366, 0.8188415, 0.3779266, 1, 0, 0.1568628, 1,
2.03193, -0.1283216, 0.4038991, 1, 0, 0.1490196, 1,
2.04079, 0.7292144, 0.1999909, 1, 0, 0.145098, 1,
2.125344, 1.41395, 1.471721, 1, 0, 0.1372549, 1,
2.125488, -2.050427, 3.166971, 1, 0, 0.1333333, 1,
2.177295, 0.4302638, -0.1726766, 1, 0, 0.1254902, 1,
2.184093, -0.2733223, 0.9100462, 1, 0, 0.1215686, 1,
2.189316, 1.62709, -0.1236642, 1, 0, 0.1137255, 1,
2.189514, 0.8449411, 0.6309438, 1, 0, 0.1098039, 1,
2.19426, 1.280303, 1.839463, 1, 0, 0.1019608, 1,
2.194517, 0.2242861, 1.75253, 1, 0, 0.09411765, 1,
2.199738, -1.236669, 1.233748, 1, 0, 0.09019608, 1,
2.244334, 0.5506811, 1.690195, 1, 0, 0.08235294, 1,
2.319121, -0.4933826, 1.497341, 1, 0, 0.07843138, 1,
2.377109, 1.863261, 0.714897, 1, 0, 0.07058824, 1,
2.433089, 0.1184248, 1.247615, 1, 0, 0.06666667, 1,
2.439059, -0.01696953, 0.8642658, 1, 0, 0.05882353, 1,
2.454197, -0.4098335, 2.617938, 1, 0, 0.05490196, 1,
2.48693, 0.5170294, 0.4455986, 1, 0, 0.04705882, 1,
2.566537, -0.3208866, 2.650407, 1, 0, 0.04313726, 1,
2.654333, 1.184502, 1.348036, 1, 0, 0.03529412, 1,
2.701246, 0.7955192, 0.788453, 1, 0, 0.03137255, 1,
2.768385, 0.137188, 2.443335, 1, 0, 0.02352941, 1,
2.94538, 0.5586294, 2.292283, 1, 0, 0.01960784, 1,
2.972408, 2.089842, 0.1190446, 1, 0, 0.01176471, 1,
3.209553, 0.3608035, 0.9496063, 1, 0, 0.007843138, 1
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
-0.05016255, -4.022195, -8.091745, 0, -0.5, 0.5, 0.5,
-0.05016255, -4.022195, -8.091745, 1, -0.5, 0.5, 0.5,
-0.05016255, -4.022195, -8.091745, 1, 1.5, 0.5, 0.5,
-0.05016255, -4.022195, -8.091745, 0, 1.5, 0.5, 0.5
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
-4.414921, 0.06443465, -8.091745, 0, -0.5, 0.5, 0.5,
-4.414921, 0.06443465, -8.091745, 1, -0.5, 0.5, 0.5,
-4.414921, 0.06443465, -8.091745, 1, 1.5, 0.5, 0.5,
-4.414921, 0.06443465, -8.091745, 0, 1.5, 0.5, 0.5
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
-4.414921, -4.022195, -0.441648, 0, -0.5, 0.5, 0.5,
-4.414921, -4.022195, -0.441648, 1, -0.5, 0.5, 0.5,
-4.414921, -4.022195, -0.441648, 1, 1.5, 0.5, 0.5,
-4.414921, -4.022195, -0.441648, 0, 1.5, 0.5, 0.5
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
-3, -3.079127, -6.326338,
3, -3.079127, -6.326338,
-3, -3.079127, -6.326338,
-3, -3.236305, -6.620573,
-2, -3.079127, -6.326338,
-2, -3.236305, -6.620573,
-1, -3.079127, -6.326338,
-1, -3.236305, -6.620573,
0, -3.079127, -6.326338,
0, -3.236305, -6.620573,
1, -3.079127, -6.326338,
1, -3.236305, -6.620573,
2, -3.079127, -6.326338,
2, -3.236305, -6.620573,
3, -3.079127, -6.326338,
3, -3.236305, -6.620573
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
-3, -3.550661, -7.209042, 0, -0.5, 0.5, 0.5,
-3, -3.550661, -7.209042, 1, -0.5, 0.5, 0.5,
-3, -3.550661, -7.209042, 1, 1.5, 0.5, 0.5,
-3, -3.550661, -7.209042, 0, 1.5, 0.5, 0.5,
-2, -3.550661, -7.209042, 0, -0.5, 0.5, 0.5,
-2, -3.550661, -7.209042, 1, -0.5, 0.5, 0.5,
-2, -3.550661, -7.209042, 1, 1.5, 0.5, 0.5,
-2, -3.550661, -7.209042, 0, 1.5, 0.5, 0.5,
-1, -3.550661, -7.209042, 0, -0.5, 0.5, 0.5,
-1, -3.550661, -7.209042, 1, -0.5, 0.5, 0.5,
-1, -3.550661, -7.209042, 1, 1.5, 0.5, 0.5,
-1, -3.550661, -7.209042, 0, 1.5, 0.5, 0.5,
0, -3.550661, -7.209042, 0, -0.5, 0.5, 0.5,
0, -3.550661, -7.209042, 1, -0.5, 0.5, 0.5,
0, -3.550661, -7.209042, 1, 1.5, 0.5, 0.5,
0, -3.550661, -7.209042, 0, 1.5, 0.5, 0.5,
1, -3.550661, -7.209042, 0, -0.5, 0.5, 0.5,
1, -3.550661, -7.209042, 1, -0.5, 0.5, 0.5,
1, -3.550661, -7.209042, 1, 1.5, 0.5, 0.5,
1, -3.550661, -7.209042, 0, 1.5, 0.5, 0.5,
2, -3.550661, -7.209042, 0, -0.5, 0.5, 0.5,
2, -3.550661, -7.209042, 1, -0.5, 0.5, 0.5,
2, -3.550661, -7.209042, 1, 1.5, 0.5, 0.5,
2, -3.550661, -7.209042, 0, 1.5, 0.5, 0.5,
3, -3.550661, -7.209042, 0, -0.5, 0.5, 0.5,
3, -3.550661, -7.209042, 1, -0.5, 0.5, 0.5,
3, -3.550661, -7.209042, 1, 1.5, 0.5, 0.5,
3, -3.550661, -7.209042, 0, 1.5, 0.5, 0.5
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
-3.407669, -2, -6.326338,
-3.407669, 3, -6.326338,
-3.407669, -2, -6.326338,
-3.575544, -2, -6.620573,
-3.407669, -1, -6.326338,
-3.575544, -1, -6.620573,
-3.407669, 0, -6.326338,
-3.575544, 0, -6.620573,
-3.407669, 1, -6.326338,
-3.575544, 1, -6.620573,
-3.407669, 2, -6.326338,
-3.575544, 2, -6.620573,
-3.407669, 3, -6.326338,
-3.575544, 3, -6.620573
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
-3.911295, -2, -7.209042, 0, -0.5, 0.5, 0.5,
-3.911295, -2, -7.209042, 1, -0.5, 0.5, 0.5,
-3.911295, -2, -7.209042, 1, 1.5, 0.5, 0.5,
-3.911295, -2, -7.209042, 0, 1.5, 0.5, 0.5,
-3.911295, -1, -7.209042, 0, -0.5, 0.5, 0.5,
-3.911295, -1, -7.209042, 1, -0.5, 0.5, 0.5,
-3.911295, -1, -7.209042, 1, 1.5, 0.5, 0.5,
-3.911295, -1, -7.209042, 0, 1.5, 0.5, 0.5,
-3.911295, 0, -7.209042, 0, -0.5, 0.5, 0.5,
-3.911295, 0, -7.209042, 1, -0.5, 0.5, 0.5,
-3.911295, 0, -7.209042, 1, 1.5, 0.5, 0.5,
-3.911295, 0, -7.209042, 0, 1.5, 0.5, 0.5,
-3.911295, 1, -7.209042, 0, -0.5, 0.5, 0.5,
-3.911295, 1, -7.209042, 1, -0.5, 0.5, 0.5,
-3.911295, 1, -7.209042, 1, 1.5, 0.5, 0.5,
-3.911295, 1, -7.209042, 0, 1.5, 0.5, 0.5,
-3.911295, 2, -7.209042, 0, -0.5, 0.5, 0.5,
-3.911295, 2, -7.209042, 1, -0.5, 0.5, 0.5,
-3.911295, 2, -7.209042, 1, 1.5, 0.5, 0.5,
-3.911295, 2, -7.209042, 0, 1.5, 0.5, 0.5,
-3.911295, 3, -7.209042, 0, -0.5, 0.5, 0.5,
-3.911295, 3, -7.209042, 1, -0.5, 0.5, 0.5,
-3.911295, 3, -7.209042, 1, 1.5, 0.5, 0.5,
-3.911295, 3, -7.209042, 0, 1.5, 0.5, 0.5
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
-3.407669, -3.079127, -6,
-3.407669, -3.079127, 4,
-3.407669, -3.079127, -6,
-3.575544, -3.236305, -6,
-3.407669, -3.079127, -4,
-3.575544, -3.236305, -4,
-3.407669, -3.079127, -2,
-3.575544, -3.236305, -2,
-3.407669, -3.079127, 0,
-3.575544, -3.236305, 0,
-3.407669, -3.079127, 2,
-3.575544, -3.236305, 2,
-3.407669, -3.079127, 4,
-3.575544, -3.236305, 4
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
-3.911295, -3.550661, -6, 0, -0.5, 0.5, 0.5,
-3.911295, -3.550661, -6, 1, -0.5, 0.5, 0.5,
-3.911295, -3.550661, -6, 1, 1.5, 0.5, 0.5,
-3.911295, -3.550661, -6, 0, 1.5, 0.5, 0.5,
-3.911295, -3.550661, -4, 0, -0.5, 0.5, 0.5,
-3.911295, -3.550661, -4, 1, -0.5, 0.5, 0.5,
-3.911295, -3.550661, -4, 1, 1.5, 0.5, 0.5,
-3.911295, -3.550661, -4, 0, 1.5, 0.5, 0.5,
-3.911295, -3.550661, -2, 0, -0.5, 0.5, 0.5,
-3.911295, -3.550661, -2, 1, -0.5, 0.5, 0.5,
-3.911295, -3.550661, -2, 1, 1.5, 0.5, 0.5,
-3.911295, -3.550661, -2, 0, 1.5, 0.5, 0.5,
-3.911295, -3.550661, 0, 0, -0.5, 0.5, 0.5,
-3.911295, -3.550661, 0, 1, -0.5, 0.5, 0.5,
-3.911295, -3.550661, 0, 1, 1.5, 0.5, 0.5,
-3.911295, -3.550661, 0, 0, 1.5, 0.5, 0.5,
-3.911295, -3.550661, 2, 0, -0.5, 0.5, 0.5,
-3.911295, -3.550661, 2, 1, -0.5, 0.5, 0.5,
-3.911295, -3.550661, 2, 1, 1.5, 0.5, 0.5,
-3.911295, -3.550661, 2, 0, 1.5, 0.5, 0.5,
-3.911295, -3.550661, 4, 0, -0.5, 0.5, 0.5,
-3.911295, -3.550661, 4, 1, -0.5, 0.5, 0.5,
-3.911295, -3.550661, 4, 1, 1.5, 0.5, 0.5,
-3.911295, -3.550661, 4, 0, 1.5, 0.5, 0.5
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
-3.407669, -3.079127, -6.326338,
-3.407669, 3.207996, -6.326338,
-3.407669, -3.079127, 5.443042,
-3.407669, 3.207996, 5.443042,
-3.407669, -3.079127, -6.326338,
-3.407669, -3.079127, 5.443042,
-3.407669, 3.207996, -6.326338,
-3.407669, 3.207996, 5.443042,
-3.407669, -3.079127, -6.326338,
3.307344, -3.079127, -6.326338,
-3.407669, -3.079127, 5.443042,
3.307344, -3.079127, 5.443042,
-3.407669, 3.207996, -6.326338,
3.307344, 3.207996, -6.326338,
-3.407669, 3.207996, 5.443042,
3.307344, 3.207996, 5.443042,
3.307344, -3.079127, -6.326338,
3.307344, 3.207996, -6.326338,
3.307344, -3.079127, 5.443042,
3.307344, 3.207996, 5.443042,
3.307344, -3.079127, -6.326338,
3.307344, -3.079127, 5.443042,
3.307344, 3.207996, -6.326338,
3.307344, 3.207996, 5.443042
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
var radius = 7.976491;
var distance = 35.48831;
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
mvMatrix.translate( 0.05016255, -0.06443465, 0.441648 );
mvMatrix.scale( 1.284337, 1.371747, 0.7327776 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.48831);
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

