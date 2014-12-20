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
-3.399784, 2.306765, 0.9688292, 1, 0, 0, 1,
-3.224711, -0.3335796, -1.460476, 1, 0.007843138, 0, 1,
-3.104484, 0.03449051, -2.455985, 1, 0.01176471, 0, 1,
-2.904598, -0.2894881, -2.525906, 1, 0.01960784, 0, 1,
-2.899536, -0.7504204, -1.095731, 1, 0.02352941, 0, 1,
-2.810759, -0.2302173, -2.15518, 1, 0.03137255, 0, 1,
-2.653491, 0.5934005, -2.135617, 1, 0.03529412, 0, 1,
-2.592791, 1.103423, -0.8733334, 1, 0.04313726, 0, 1,
-2.556338, -0.530881, -2.639185, 1, 0.04705882, 0, 1,
-2.544089, 0.04509044, -2.862494, 1, 0.05490196, 0, 1,
-2.485484, 0.3687485, -1.353272, 1, 0.05882353, 0, 1,
-2.478755, 1.426768, -1.363032, 1, 0.06666667, 0, 1,
-2.476547, 1.330153, -1.627047, 1, 0.07058824, 0, 1,
-2.403525, -0.650617, -1.19223, 1, 0.07843138, 0, 1,
-2.289788, 0.166035, -0.3112215, 1, 0.08235294, 0, 1,
-2.286597, 0.00521068, -1.547133, 1, 0.09019608, 0, 1,
-2.255536, -2.044077, -3.229742, 1, 0.09411765, 0, 1,
-2.244148, 0.8084247, -2.977814, 1, 0.1019608, 0, 1,
-2.213097, -0.6907851, 0.5210705, 1, 0.1098039, 0, 1,
-2.183794, 0.01000909, -0.8139006, 1, 0.1137255, 0, 1,
-2.178803, -0.8341007, -1.874752, 1, 0.1215686, 0, 1,
-2.103964, 0.3838967, -2.530719, 1, 0.1254902, 0, 1,
-2.101219, -1.135794, -1.881303, 1, 0.1333333, 0, 1,
-2.093059, 1.660791, -3.287288, 1, 0.1372549, 0, 1,
-2.088401, 0.296757, -0.3074797, 1, 0.145098, 0, 1,
-2.087455, 0.5974795, -2.96834, 1, 0.1490196, 0, 1,
-2.083829, 0.3346956, -0.930327, 1, 0.1568628, 0, 1,
-2.081711, 0.6011413, -1.87537, 1, 0.1607843, 0, 1,
-2.07701, 0.1710957, -2.638073, 1, 0.1686275, 0, 1,
-2.071369, 0.478113, -1.536677, 1, 0.172549, 0, 1,
-2.039693, -0.8092649, -2.946259, 1, 0.1803922, 0, 1,
-2.023653, 0.1067739, 0.6900742, 1, 0.1843137, 0, 1,
-2.009595, -2.28934, -2.710687, 1, 0.1921569, 0, 1,
-1.961689, 0.6220125, -0.2964306, 1, 0.1960784, 0, 1,
-1.939174, 0.3839966, 0.2643897, 1, 0.2039216, 0, 1,
-1.932186, 0.7569615, -1.158134, 1, 0.2117647, 0, 1,
-1.930866, -0.993504, -2.70392, 1, 0.2156863, 0, 1,
-1.905906, 2.440725, -0.1803687, 1, 0.2235294, 0, 1,
-1.889875, 0.890021, -1.657659, 1, 0.227451, 0, 1,
-1.871961, -1.899306, -1.521236, 1, 0.2352941, 0, 1,
-1.865144, -0.5951647, -0.05852642, 1, 0.2392157, 0, 1,
-1.829902, 1.960543, -0.0267439, 1, 0.2470588, 0, 1,
-1.814588, -0.5614942, -2.831663, 1, 0.2509804, 0, 1,
-1.807958, 0.4978716, -0.823333, 1, 0.2588235, 0, 1,
-1.785798, -1.40698, -0.2769985, 1, 0.2627451, 0, 1,
-1.756983, -0.1427881, -0.1938505, 1, 0.2705882, 0, 1,
-1.755487, -0.7157826, -2.291343, 1, 0.2745098, 0, 1,
-1.754404, -0.4202331, -1.3915, 1, 0.282353, 0, 1,
-1.75242, 2.045418, -0.7746832, 1, 0.2862745, 0, 1,
-1.739685, -0.898666, -2.279714, 1, 0.2941177, 0, 1,
-1.724653, -0.9566415, -3.118723, 1, 0.3019608, 0, 1,
-1.699387, 0.3292435, -2.36686, 1, 0.3058824, 0, 1,
-1.692562, -1.294585, -0.4031876, 1, 0.3137255, 0, 1,
-1.692514, -0.6591039, -2.908732, 1, 0.3176471, 0, 1,
-1.651963, -0.08406548, -1.341866, 1, 0.3254902, 0, 1,
-1.626412, -0.02368074, -3.231529, 1, 0.3294118, 0, 1,
-1.612847, -2.130213, -4.470058, 1, 0.3372549, 0, 1,
-1.603979, -0.8188334, -1.95994, 1, 0.3411765, 0, 1,
-1.599421, -0.07103438, -2.233639, 1, 0.3490196, 0, 1,
-1.588907, 0.6898785, -0.630916, 1, 0.3529412, 0, 1,
-1.583524, 0.03734253, -2.507318, 1, 0.3607843, 0, 1,
-1.556901, -0.08533325, -1.490088, 1, 0.3647059, 0, 1,
-1.539112, -0.1330871, -0.3169045, 1, 0.372549, 0, 1,
-1.536761, -0.3416856, -1.063314, 1, 0.3764706, 0, 1,
-1.529215, 0.786113, -0.4794322, 1, 0.3843137, 0, 1,
-1.527862, 0.1486079, -1.941563, 1, 0.3882353, 0, 1,
-1.525097, 0.603264, -0.9856017, 1, 0.3960784, 0, 1,
-1.521554, 1.993141, -0.07648169, 1, 0.4039216, 0, 1,
-1.51156, -0.5164001, -0.2648484, 1, 0.4078431, 0, 1,
-1.510091, 0.8329802, -2.083762, 1, 0.4156863, 0, 1,
-1.506268, -0.0165293, -0.5037067, 1, 0.4196078, 0, 1,
-1.497883, 1.158965, -0.9777954, 1, 0.427451, 0, 1,
-1.492903, -0.8963362, -3.675495, 1, 0.4313726, 0, 1,
-1.48522, -0.6819135, -2.682417, 1, 0.4392157, 0, 1,
-1.48049, -1.508429, -3.696281, 1, 0.4431373, 0, 1,
-1.474911, 0.4346118, 0.9190645, 1, 0.4509804, 0, 1,
-1.469112, 0.3532563, -2.611158, 1, 0.454902, 0, 1,
-1.467611, 0.06417891, -2.72661, 1, 0.4627451, 0, 1,
-1.462664, 0.3725691, -2.659957, 1, 0.4666667, 0, 1,
-1.461252, -1.652316, -1.610586, 1, 0.4745098, 0, 1,
-1.459542, -0.5087121, -1.034336, 1, 0.4784314, 0, 1,
-1.45943, -0.008848193, -1.529711, 1, 0.4862745, 0, 1,
-1.440943, 0.1953678, -2.620065, 1, 0.4901961, 0, 1,
-1.434814, 2.006008, -0.6458073, 1, 0.4980392, 0, 1,
-1.422165, -0.2903127, -1.336988, 1, 0.5058824, 0, 1,
-1.417896, -1.027827, -0.9075973, 1, 0.509804, 0, 1,
-1.412483, 0.2678171, 0.3007712, 1, 0.5176471, 0, 1,
-1.403716, 0.7706214, -2.313427, 1, 0.5215687, 0, 1,
-1.398451, 0.151553, -1.036708, 1, 0.5294118, 0, 1,
-1.393475, -0.3926576, -0.7312916, 1, 0.5333334, 0, 1,
-1.391696, -0.7202654, -2.492243, 1, 0.5411765, 0, 1,
-1.389621, 0.3026207, -1.991691, 1, 0.5450981, 0, 1,
-1.377137, 1.175654, -0.6837411, 1, 0.5529412, 0, 1,
-1.372779, -0.6258797, -4.272412, 1, 0.5568628, 0, 1,
-1.371354, 1.45944, 0.8437055, 1, 0.5647059, 0, 1,
-1.364841, -1.420717, -1.952287, 1, 0.5686275, 0, 1,
-1.361119, 1.424444, -0.4632935, 1, 0.5764706, 0, 1,
-1.343624, -0.8739446, -0.8979781, 1, 0.5803922, 0, 1,
-1.335156, 0.5060133, -0.03036204, 1, 0.5882353, 0, 1,
-1.325271, 0.003333671, -1.863403, 1, 0.5921569, 0, 1,
-1.299819, 2.526067, -2.271961, 1, 0.6, 0, 1,
-1.288131, -1.066043, -2.14184, 1, 0.6078432, 0, 1,
-1.287281, -0.8775979, -2.475136, 1, 0.6117647, 0, 1,
-1.281466, 0.9601838, 0.4435339, 1, 0.6196079, 0, 1,
-1.279739, -0.3475176, -4.081114, 1, 0.6235294, 0, 1,
-1.267175, -0.1167343, -1.300518, 1, 0.6313726, 0, 1,
-1.256531, 0.4171913, -1.821606, 1, 0.6352941, 0, 1,
-1.250549, -0.6870852, -0.9369211, 1, 0.6431373, 0, 1,
-1.248387, 1.727639, -1.065523, 1, 0.6470588, 0, 1,
-1.247917, -0.5949215, -0.7578337, 1, 0.654902, 0, 1,
-1.241795, -0.235148, -2.023984, 1, 0.6588235, 0, 1,
-1.239766, -0.5398548, -3.028077, 1, 0.6666667, 0, 1,
-1.235125, 0.9394047, -0.5465096, 1, 0.6705883, 0, 1,
-1.23057, 0.7379971, -1.434234, 1, 0.6784314, 0, 1,
-1.216804, -1.273744, -0.7373343, 1, 0.682353, 0, 1,
-1.213768, 0.108333, 0.3615935, 1, 0.6901961, 0, 1,
-1.207924, 0.7410071, -0.9997576, 1, 0.6941177, 0, 1,
-1.206421, 1.580832, -1.408144, 1, 0.7019608, 0, 1,
-1.206037, -0.1197868, -0.4596398, 1, 0.7098039, 0, 1,
-1.204465, 0.5872623, -1.423421, 1, 0.7137255, 0, 1,
-1.200162, -0.812288, -1.456711, 1, 0.7215686, 0, 1,
-1.188844, -0.439988, -1.887848, 1, 0.7254902, 0, 1,
-1.186065, -0.4271822, -0.3180031, 1, 0.7333333, 0, 1,
-1.181732, -0.4956263, -1.428321, 1, 0.7372549, 0, 1,
-1.181003, -0.5683897, -1.216578, 1, 0.7450981, 0, 1,
-1.175988, 1.286908, -1.666283, 1, 0.7490196, 0, 1,
-1.157946, 1.378377, -0.5173933, 1, 0.7568628, 0, 1,
-1.155304, -1.031174, -3.403814, 1, 0.7607843, 0, 1,
-1.154246, -1.81318, -1.382813, 1, 0.7686275, 0, 1,
-1.149072, -0.411472, -1.846197, 1, 0.772549, 0, 1,
-1.144533, -0.03760685, -1.039406, 1, 0.7803922, 0, 1,
-1.137682, 0.8232418, -0.2954372, 1, 0.7843137, 0, 1,
-1.125776, 1.195778, -0.8047355, 1, 0.7921569, 0, 1,
-1.120825, 0.2197445, -0.4748599, 1, 0.7960784, 0, 1,
-1.102929, -1.235356, -0.6258882, 1, 0.8039216, 0, 1,
-1.080874, -0.2432927, -0.2688281, 1, 0.8117647, 0, 1,
-1.079769, -0.4363256, -2.714882, 1, 0.8156863, 0, 1,
-1.079533, 2.763141, 0.01467864, 1, 0.8235294, 0, 1,
-1.078059, 0.4325237, -2.054976, 1, 0.827451, 0, 1,
-1.077818, 1.300403, -1.455643, 1, 0.8352941, 0, 1,
-1.076614, 0.2775448, 0.4264309, 1, 0.8392157, 0, 1,
-1.074659, -0.03397872, -2.478712, 1, 0.8470588, 0, 1,
-1.067898, -0.4516446, -4.103737, 1, 0.8509804, 0, 1,
-1.066813, 0.3760863, -2.913671, 1, 0.8588235, 0, 1,
-1.062756, 1.346836, -1.021651, 1, 0.8627451, 0, 1,
-1.058178, 0.3400661, -1.999366, 1, 0.8705882, 0, 1,
-1.04968, -2.528723, -2.989779, 1, 0.8745098, 0, 1,
-1.049359, -0.6078597, -3.525972, 1, 0.8823529, 0, 1,
-1.046534, -0.4640755, -1.708051, 1, 0.8862745, 0, 1,
-1.045995, -1.953594, -3.110375, 1, 0.8941177, 0, 1,
-1.045769, -0.2457408, -0.4784661, 1, 0.8980392, 0, 1,
-1.042583, -0.5884159, -2.866362, 1, 0.9058824, 0, 1,
-1.041099, 0.4437708, -2.014852, 1, 0.9137255, 0, 1,
-1.033943, 1.163152, -1.015404, 1, 0.9176471, 0, 1,
-1.025989, 0.9809356, -0.6882014, 1, 0.9254902, 0, 1,
-1.020241, -0.1915333, -0.3609797, 1, 0.9294118, 0, 1,
-1.019818, -0.763371, 0.3147563, 1, 0.9372549, 0, 1,
-1.014087, 0.2202203, -0.4986714, 1, 0.9411765, 0, 1,
-1.01271, -0.5088105, -1.954675, 1, 0.9490196, 0, 1,
-1.005117, 2.970526, -0.9896715, 1, 0.9529412, 0, 1,
-1.002865, -0.1666676, -1.181072, 1, 0.9607843, 0, 1,
-1.001375, -1.11524, -3.180158, 1, 0.9647059, 0, 1,
-0.9990996, -0.8827193, -2.490057, 1, 0.972549, 0, 1,
-0.9950593, 0.03027249, -2.125688, 1, 0.9764706, 0, 1,
-0.9888936, -0.4319949, -1.160728, 1, 0.9843137, 0, 1,
-0.9866282, -0.5674013, -2.959278, 1, 0.9882353, 0, 1,
-0.984737, 1.0878, -2.159506, 1, 0.9960784, 0, 1,
-0.9841124, -0.5177339, -2.610379, 0.9960784, 1, 0, 1,
-0.9828835, -1.06264, -1.526084, 0.9921569, 1, 0, 1,
-0.979084, -0.02119592, -1.053271, 0.9843137, 1, 0, 1,
-0.9702377, -0.1758198, -3.102341, 0.9803922, 1, 0, 1,
-0.9582314, -0.8696829, -2.532217, 0.972549, 1, 0, 1,
-0.9554198, -0.2480642, -1.623079, 0.9686275, 1, 0, 1,
-0.9466779, -1.131556, -1.813685, 0.9607843, 1, 0, 1,
-0.9462458, -2.732374, -2.574177, 0.9568627, 1, 0, 1,
-0.9454669, 0.2953431, -0.7820015, 0.9490196, 1, 0, 1,
-0.9439134, -0.5439797, -2.223105, 0.945098, 1, 0, 1,
-0.9290842, 0.7808579, -0.5438322, 0.9372549, 1, 0, 1,
-0.9237189, 0.8373467, -0.7181348, 0.9333333, 1, 0, 1,
-0.9211661, 0.5745733, 0.6175898, 0.9254902, 1, 0, 1,
-0.9209843, 0.08953226, 1.078103, 0.9215686, 1, 0, 1,
-0.9109739, -0.1256743, -3.039742, 0.9137255, 1, 0, 1,
-0.9073989, 0.1850598, -0.9109191, 0.9098039, 1, 0, 1,
-0.9016225, -0.6392906, -0.2608313, 0.9019608, 1, 0, 1,
-0.8998777, 0.8812848, -2.21932, 0.8941177, 1, 0, 1,
-0.8974605, -0.7684945, -3.109585, 0.8901961, 1, 0, 1,
-0.8906444, 0.2215991, -2.506885, 0.8823529, 1, 0, 1,
-0.8882403, -0.3797348, -1.462839, 0.8784314, 1, 0, 1,
-0.8854983, 0.7715907, -0.01366672, 0.8705882, 1, 0, 1,
-0.8807197, -0.3805831, -1.428472, 0.8666667, 1, 0, 1,
-0.879349, 0.2483503, 0.6888003, 0.8588235, 1, 0, 1,
-0.8749269, 0.3379021, -0.1803115, 0.854902, 1, 0, 1,
-0.87402, 1.332391, -0.5738338, 0.8470588, 1, 0, 1,
-0.8732929, -0.8962897, -2.953901, 0.8431373, 1, 0, 1,
-0.8647616, 0.254335, -0.7870534, 0.8352941, 1, 0, 1,
-0.8646674, 0.254245, 0.6342945, 0.8313726, 1, 0, 1,
-0.8637933, -0.4033712, -3.618472, 0.8235294, 1, 0, 1,
-0.8590629, 0.1335085, 0.03400964, 0.8196079, 1, 0, 1,
-0.8574269, -1.940533, -2.236324, 0.8117647, 1, 0, 1,
-0.854688, -0.2585483, -2.190891, 0.8078431, 1, 0, 1,
-0.8540261, 2.770716, 1.080046, 0.8, 1, 0, 1,
-0.853801, 0.2750333, -1.055155, 0.7921569, 1, 0, 1,
-0.8503801, -0.6981465, -2.363291, 0.7882353, 1, 0, 1,
-0.8498988, -0.124158, -0.2027327, 0.7803922, 1, 0, 1,
-0.8495817, 1.249429, -0.2556422, 0.7764706, 1, 0, 1,
-0.8450248, -2.555, -1.873546, 0.7686275, 1, 0, 1,
-0.8430169, 0.4935073, 0.9272979, 0.7647059, 1, 0, 1,
-0.8400681, -0.247923, -1.841373, 0.7568628, 1, 0, 1,
-0.8378645, 0.775018, -1.417359, 0.7529412, 1, 0, 1,
-0.8362026, -0.08098952, -1.373303, 0.7450981, 1, 0, 1,
-0.8331422, 1.973694, -0.7174512, 0.7411765, 1, 0, 1,
-0.8329419, -3.862877, -1.933928, 0.7333333, 1, 0, 1,
-0.8244906, 0.5657521, -0.4124138, 0.7294118, 1, 0, 1,
-0.8235304, 0.621943, -0.6486637, 0.7215686, 1, 0, 1,
-0.8214667, 0.4020939, -2.596369, 0.7176471, 1, 0, 1,
-0.819443, -1.924386, -4.69839, 0.7098039, 1, 0, 1,
-0.8169502, 0.8592382, -0.7681432, 0.7058824, 1, 0, 1,
-0.815411, 0.7628658, -1.157292, 0.6980392, 1, 0, 1,
-0.8107104, 2.007447, -0.7497176, 0.6901961, 1, 0, 1,
-0.8060479, -1.198137, -3.334811, 0.6862745, 1, 0, 1,
-0.8030291, -1.76252, -2.305996, 0.6784314, 1, 0, 1,
-0.8001294, -0.326407, -2.684861, 0.6745098, 1, 0, 1,
-0.7995762, -1.019429, -2.262809, 0.6666667, 1, 0, 1,
-0.7896547, 0.2129283, -1.018641, 0.6627451, 1, 0, 1,
-0.7892141, 1.858809, -0.06133442, 0.654902, 1, 0, 1,
-0.7815868, -2.220331, -1.202411, 0.6509804, 1, 0, 1,
-0.7807384, 0.3305429, -1.575311, 0.6431373, 1, 0, 1,
-0.7754222, -1.12678, -3.714643, 0.6392157, 1, 0, 1,
-0.7745084, 0.5822232, -1.711768, 0.6313726, 1, 0, 1,
-0.7688082, 2.148288, 0.7407279, 0.627451, 1, 0, 1,
-0.7579939, 0.5524082, 1.653482, 0.6196079, 1, 0, 1,
-0.7564319, -0.9661247, -1.597125, 0.6156863, 1, 0, 1,
-0.7554944, 0.2704132, 0.03687802, 0.6078432, 1, 0, 1,
-0.7514145, -0.6221823, -2.972349, 0.6039216, 1, 0, 1,
-0.749979, 0.002358291, -0.9442095, 0.5960785, 1, 0, 1,
-0.7466034, 0.5044752, -0.5239297, 0.5882353, 1, 0, 1,
-0.7377578, 6.056769e-05, -2.153925, 0.5843138, 1, 0, 1,
-0.7338935, 1.475194, -1.490292, 0.5764706, 1, 0, 1,
-0.7304879, 0.004033458, -3.722457, 0.572549, 1, 0, 1,
-0.7304597, 0.00184496, -0.4004817, 0.5647059, 1, 0, 1,
-0.7303949, -0.2816058, -1.295475, 0.5607843, 1, 0, 1,
-0.7296713, -0.1239375, -2.608458, 0.5529412, 1, 0, 1,
-0.7278383, -0.9749317, -2.575711, 0.5490196, 1, 0, 1,
-0.722164, -0.2774954, -2.438505, 0.5411765, 1, 0, 1,
-0.720174, -1.035242, -3.421182, 0.5372549, 1, 0, 1,
-0.7145922, 1.177231, -0.1856973, 0.5294118, 1, 0, 1,
-0.7095168, -1.971133, -1.469173, 0.5254902, 1, 0, 1,
-0.7076995, -1.244237, -2.55494, 0.5176471, 1, 0, 1,
-0.7074643, 0.4575315, 0.941113, 0.5137255, 1, 0, 1,
-0.6973987, 0.5275646, -1.328069, 0.5058824, 1, 0, 1,
-0.6960756, 0.6378984, 0.4397756, 0.5019608, 1, 0, 1,
-0.6950171, 1.41091, -0.1927087, 0.4941176, 1, 0, 1,
-0.6946124, -1.541797, -4.37287, 0.4862745, 1, 0, 1,
-0.6934797, -0.1434412, -2.79986, 0.4823529, 1, 0, 1,
-0.6864563, 0.2973502, 0.4207812, 0.4745098, 1, 0, 1,
-0.6853984, 0.6644463, -2.615282, 0.4705882, 1, 0, 1,
-0.6791099, 0.050853, -1.203497, 0.4627451, 1, 0, 1,
-0.6762646, -1.612276, -2.316773, 0.4588235, 1, 0, 1,
-0.6753024, 1.222736, -0.3278449, 0.4509804, 1, 0, 1,
-0.6743401, -0.3574969, -1.66745, 0.4470588, 1, 0, 1,
-0.6704133, -0.1581522, -2.362399, 0.4392157, 1, 0, 1,
-0.6677458, -0.5456124, -1.656889, 0.4352941, 1, 0, 1,
-0.665943, 2.611085, -0.6593219, 0.427451, 1, 0, 1,
-0.6616702, -0.1584788, -1.32052, 0.4235294, 1, 0, 1,
-0.6569564, -1.213692, -2.884707, 0.4156863, 1, 0, 1,
-0.6520935, -1.746726, -3.16592, 0.4117647, 1, 0, 1,
-0.6491678, -1.702936, -1.850893, 0.4039216, 1, 0, 1,
-0.642386, 1.159937, 0.4963745, 0.3960784, 1, 0, 1,
-0.6400985, -1.02918, -1.741315, 0.3921569, 1, 0, 1,
-0.6327673, -1.400271, -3.287512, 0.3843137, 1, 0, 1,
-0.6264071, 0.02370373, -1.894659, 0.3803922, 1, 0, 1,
-0.6263135, -2.036972, -2.538729, 0.372549, 1, 0, 1,
-0.6263018, 1.58471, -0.6067129, 0.3686275, 1, 0, 1,
-0.6226525, 1.068374, -1.815567, 0.3607843, 1, 0, 1,
-0.6181115, 0.7787976, -2.415146, 0.3568628, 1, 0, 1,
-0.612142, 0.310053, -0.6704839, 0.3490196, 1, 0, 1,
-0.6087234, 1.431504, -0.7816414, 0.345098, 1, 0, 1,
-0.6085252, 1.422063, -0.8820137, 0.3372549, 1, 0, 1,
-0.6072828, -0.3675646, -3.919608, 0.3333333, 1, 0, 1,
-0.6021513, -0.8781612, -1.250475, 0.3254902, 1, 0, 1,
-0.597818, 0.4223568, -0.3579386, 0.3215686, 1, 0, 1,
-0.5907862, -0.7237008, -0.4441247, 0.3137255, 1, 0, 1,
-0.5907763, 1.458526, 0.8668368, 0.3098039, 1, 0, 1,
-0.5894886, -0.5262989, -2.412953, 0.3019608, 1, 0, 1,
-0.5869087, 1.836384, 0.2904122, 0.2941177, 1, 0, 1,
-0.5868614, 1.294967, -1.316025, 0.2901961, 1, 0, 1,
-0.5864744, -0.5323129, -3.941354, 0.282353, 1, 0, 1,
-0.585453, -0.114653, -1.615252, 0.2784314, 1, 0, 1,
-0.5799434, -0.5813632, -1.220623, 0.2705882, 1, 0, 1,
-0.5754454, 0.9085377, 0.8447184, 0.2666667, 1, 0, 1,
-0.5744209, -0.7173126, -4.391942, 0.2588235, 1, 0, 1,
-0.5733185, -0.9908097, -1.586097, 0.254902, 1, 0, 1,
-0.5716017, 1.398233, -0.853959, 0.2470588, 1, 0, 1,
-0.5714049, 0.3940091, -1.231696, 0.2431373, 1, 0, 1,
-0.5606643, 0.140347, -0.6073114, 0.2352941, 1, 0, 1,
-0.5554424, 0.5417404, 0.6243271, 0.2313726, 1, 0, 1,
-0.544579, 0.07024123, -1.140562, 0.2235294, 1, 0, 1,
-0.5429808, -0.2022467, -1.103208, 0.2196078, 1, 0, 1,
-0.5400692, 0.4888455, -0.8232741, 0.2117647, 1, 0, 1,
-0.5317307, 0.4443663, -1.231696, 0.2078431, 1, 0, 1,
-0.5309773, 0.9551215, -0.6251245, 0.2, 1, 0, 1,
-0.5272612, -0.1844612, -1.392279, 0.1921569, 1, 0, 1,
-0.5222141, -1.283584, -2.431762, 0.1882353, 1, 0, 1,
-0.5198817, 1.229368, -1.138185, 0.1803922, 1, 0, 1,
-0.5163924, 1.983837, -1.642865, 0.1764706, 1, 0, 1,
-0.5152988, -0.7045103, -1.568237, 0.1686275, 1, 0, 1,
-0.5143016, 0.488997, -1.010665, 0.1647059, 1, 0, 1,
-0.5141023, 0.3878134, -1.658625, 0.1568628, 1, 0, 1,
-0.5122379, -1.557941, -3.550526, 0.1529412, 1, 0, 1,
-0.5099847, -0.8456498, -0.9939151, 0.145098, 1, 0, 1,
-0.5096488, 0.385004, 0.13352, 0.1411765, 1, 0, 1,
-0.5095648, 0.2942117, -1.512461, 0.1333333, 1, 0, 1,
-0.5038887, -0.3277613, -2.111194, 0.1294118, 1, 0, 1,
-0.5021204, 0.3728279, -1.551367, 0.1215686, 1, 0, 1,
-0.4979077, -0.3857329, -1.237568, 0.1176471, 1, 0, 1,
-0.4949256, 0.1903957, -0.785888, 0.1098039, 1, 0, 1,
-0.4941532, 0.7741858, -0.1278072, 0.1058824, 1, 0, 1,
-0.4935857, -0.7614383, -3.795877, 0.09803922, 1, 0, 1,
-0.4924594, -0.8422402, -0.8914775, 0.09019608, 1, 0, 1,
-0.4914949, -0.5929128, -2.664335, 0.08627451, 1, 0, 1,
-0.487035, -1.005691, -4.455132, 0.07843138, 1, 0, 1,
-0.4819006, -0.2266003, -2.392464, 0.07450981, 1, 0, 1,
-0.4807658, -0.6910558, -2.979618, 0.06666667, 1, 0, 1,
-0.4772815, 1.024798, -0.2102274, 0.0627451, 1, 0, 1,
-0.4767382, 1.132537, -0.364787, 0.05490196, 1, 0, 1,
-0.4730027, -0.3234652, -1.269865, 0.05098039, 1, 0, 1,
-0.4650299, 0.3936659, -0.6020015, 0.04313726, 1, 0, 1,
-0.4629499, -0.1316431, -1.776632, 0.03921569, 1, 0, 1,
-0.4624923, -0.4145795, -1.008281, 0.03137255, 1, 0, 1,
-0.4622725, 1.014245, -1.273022, 0.02745098, 1, 0, 1,
-0.460151, 0.2869195, -0.718818, 0.01960784, 1, 0, 1,
-0.4594295, 1.406712, -2.400064, 0.01568628, 1, 0, 1,
-0.4546139, -0.1397277, -2.441195, 0.007843138, 1, 0, 1,
-0.4545308, -0.008752693, -0.831009, 0.003921569, 1, 0, 1,
-0.4545037, -1.034277, -4.071876, 0, 1, 0.003921569, 1,
-0.4468136, 0.7656215, -2.152529, 0, 1, 0.01176471, 1,
-0.4450175, 0.6219547, 0.2792866, 0, 1, 0.01568628, 1,
-0.444122, 0.5674878, 1.637702, 0, 1, 0.02352941, 1,
-0.4429344, -0.9402614, -1.276006, 0, 1, 0.02745098, 1,
-0.4387021, -0.2632434, -1.862948, 0, 1, 0.03529412, 1,
-0.4346242, -0.8411567, -3.365755, 0, 1, 0.03921569, 1,
-0.4336405, 0.3088591, -2.091645, 0, 1, 0.04705882, 1,
-0.4325879, 0.4921509, -2.801465, 0, 1, 0.05098039, 1,
-0.4295708, -0.2323712, -2.820744, 0, 1, 0.05882353, 1,
-0.4267276, -0.9674298, -2.38475, 0, 1, 0.0627451, 1,
-0.4252806, -1.083213, -0.1004724, 0, 1, 0.07058824, 1,
-0.4233088, -1.703282, -1.937611, 0, 1, 0.07450981, 1,
-0.4217629, -0.1734301, -1.301092, 0, 1, 0.08235294, 1,
-0.4177253, 0.2498038, -0.07782305, 0, 1, 0.08627451, 1,
-0.407331, 1.946639, -0.3240883, 0, 1, 0.09411765, 1,
-0.4068249, -0.1943523, -3.851055, 0, 1, 0.1019608, 1,
-0.4065254, -0.09232183, -0.2949478, 0, 1, 0.1058824, 1,
-0.4014702, 0.1077355, -0.699268, 0, 1, 0.1137255, 1,
-0.3991682, 1.152187, 0.003678376, 0, 1, 0.1176471, 1,
-0.3970573, 0.5643486, -0.5909675, 0, 1, 0.1254902, 1,
-0.3967122, -0.9646824, -3.648999, 0, 1, 0.1294118, 1,
-0.3901361, -0.6830947, -3.082347, 0, 1, 0.1372549, 1,
-0.387893, 0.4354638, -1.150736, 0, 1, 0.1411765, 1,
-0.3868153, -0.443441, -3.341833, 0, 1, 0.1490196, 1,
-0.3818811, -1.453563, -1.822407, 0, 1, 0.1529412, 1,
-0.3803414, 1.399405, 0.4476369, 0, 1, 0.1607843, 1,
-0.3766021, -0.3096218, -1.244072, 0, 1, 0.1647059, 1,
-0.3758245, 0.657631, -0.5504374, 0, 1, 0.172549, 1,
-0.3729721, 1.445137, -2.154709, 0, 1, 0.1764706, 1,
-0.3719859, 0.6156703, -0.7257422, 0, 1, 0.1843137, 1,
-0.3717856, 0.5399884, -1.612599, 0, 1, 0.1882353, 1,
-0.3702369, 1.807399, -1.808376, 0, 1, 0.1960784, 1,
-0.3691178, -0.5531246, -1.651208, 0, 1, 0.2039216, 1,
-0.3606468, -2.265916, -2.74327, 0, 1, 0.2078431, 1,
-0.3504167, 0.1285244, -1.55916, 0, 1, 0.2156863, 1,
-0.3465558, -1.478888, -3.117329, 0, 1, 0.2196078, 1,
-0.3451352, -2.376654, -2.616887, 0, 1, 0.227451, 1,
-0.3429253, -0.4535049, -1.534974, 0, 1, 0.2313726, 1,
-0.3361166, -2.002868, -3.00099, 0, 1, 0.2392157, 1,
-0.3299444, 1.953786, 0.2237297, 0, 1, 0.2431373, 1,
-0.3246251, -0.09279798, -2.260399, 0, 1, 0.2509804, 1,
-0.3220598, 1.577773, -0.04564841, 0, 1, 0.254902, 1,
-0.3192323, 0.9081429, -1.588063, 0, 1, 0.2627451, 1,
-0.3190147, 0.4156095, -0.32585, 0, 1, 0.2666667, 1,
-0.3178791, -2.333434, -3.80232, 0, 1, 0.2745098, 1,
-0.3175644, 0.8536254, 0.4182992, 0, 1, 0.2784314, 1,
-0.3163387, 1.210631, -0.4088392, 0, 1, 0.2862745, 1,
-0.3161809, -2.031101, -0.1639788, 0, 1, 0.2901961, 1,
-0.316051, 1.358184, -0.5930385, 0, 1, 0.2980392, 1,
-0.3140197, -0.1051322, -4.372746, 0, 1, 0.3058824, 1,
-0.3122765, -0.2532957, -2.264103, 0, 1, 0.3098039, 1,
-0.308355, 0.05181782, -0.793098, 0, 1, 0.3176471, 1,
-0.3082933, 1.461807, -0.6408572, 0, 1, 0.3215686, 1,
-0.3050225, -1.06581, -2.329028, 0, 1, 0.3294118, 1,
-0.3049129, 0.5776199, -0.9575482, 0, 1, 0.3333333, 1,
-0.3035004, -0.8821554, -4.481861, 0, 1, 0.3411765, 1,
-0.2959377, 0.7667058, -1.488842, 0, 1, 0.345098, 1,
-0.2926068, -0.1536874, -2.247766, 0, 1, 0.3529412, 1,
-0.2898241, 0.04143646, 0.3923758, 0, 1, 0.3568628, 1,
-0.2895974, 0.411765, 0.4806695, 0, 1, 0.3647059, 1,
-0.2891476, -0.223997, -3.843158, 0, 1, 0.3686275, 1,
-0.2888202, 1.019222, -0.8632217, 0, 1, 0.3764706, 1,
-0.2880552, -0.1254057, -1.241241, 0, 1, 0.3803922, 1,
-0.2837153, -0.5875567, -4.806477, 0, 1, 0.3882353, 1,
-0.283638, 0.4571497, -0.2166722, 0, 1, 0.3921569, 1,
-0.279933, -1.468223, -3.911727, 0, 1, 0.4, 1,
-0.2767958, 0.07264648, -0.8903062, 0, 1, 0.4078431, 1,
-0.2762269, 0.4388834, -0.2018189, 0, 1, 0.4117647, 1,
-0.268508, 0.7539301, -0.7314023, 0, 1, 0.4196078, 1,
-0.2675411, -0.6178336, -0.5244238, 0, 1, 0.4235294, 1,
-0.2668912, -1.298356, -1.807632, 0, 1, 0.4313726, 1,
-0.2663316, -2.025168, -3.060097, 0, 1, 0.4352941, 1,
-0.2634139, 0.1735956, 0.04531418, 0, 1, 0.4431373, 1,
-0.2556022, -0.6394178, -1.291746, 0, 1, 0.4470588, 1,
-0.2537076, -1.099788, -3.867362, 0, 1, 0.454902, 1,
-0.2511216, 0.3288729, -1.137011, 0, 1, 0.4588235, 1,
-0.2502229, 0.5921195, -0.71698, 0, 1, 0.4666667, 1,
-0.2475416, -2.285978, -4.424641, 0, 1, 0.4705882, 1,
-0.2434739, 0.04431899, -2.283098, 0, 1, 0.4784314, 1,
-0.2427011, 0.9542203, 1.238645, 0, 1, 0.4823529, 1,
-0.2397783, -0.02740387, -0.6138699, 0, 1, 0.4901961, 1,
-0.2388155, 0.7900047, 0.4848033, 0, 1, 0.4941176, 1,
-0.2370273, -1.635186, -3.087925, 0, 1, 0.5019608, 1,
-0.2368657, -0.7050743, -2.304015, 0, 1, 0.509804, 1,
-0.2349871, 0.6809879, 0.72101, 0, 1, 0.5137255, 1,
-0.2346638, -0.8540413, -2.257497, 0, 1, 0.5215687, 1,
-0.2337146, 0.7780937, 0.0376849, 0, 1, 0.5254902, 1,
-0.2260281, -0.3391041, -3.666461, 0, 1, 0.5333334, 1,
-0.2156113, -0.1739898, -2.790186, 0, 1, 0.5372549, 1,
-0.2105503, -0.2828339, -2.382871, 0, 1, 0.5450981, 1,
-0.2103338, 0.8294777, 1.443375, 0, 1, 0.5490196, 1,
-0.2070798, -1.612058, -2.910529, 0, 1, 0.5568628, 1,
-0.2070431, 0.00435963, -1.137412, 0, 1, 0.5607843, 1,
-0.2058066, 0.4395773, 0.05637632, 0, 1, 0.5686275, 1,
-0.2024719, -0.7491714, -3.43537, 0, 1, 0.572549, 1,
-0.1985723, -0.7006865, -2.464253, 0, 1, 0.5803922, 1,
-0.1899162, 0.3272348, -2.802113, 0, 1, 0.5843138, 1,
-0.1896193, 0.5592498, -1.185557, 0, 1, 0.5921569, 1,
-0.1853781, 0.8308365, 1.068949, 0, 1, 0.5960785, 1,
-0.1851035, 0.5684384, 1.162939, 0, 1, 0.6039216, 1,
-0.1847166, -0.249614, -3.002746, 0, 1, 0.6117647, 1,
-0.1813096, -0.1589846, -1.416994, 0, 1, 0.6156863, 1,
-0.1768766, -0.3912169, -2.059165, 0, 1, 0.6235294, 1,
-0.1751876, 0.9544101, -0.2072088, 0, 1, 0.627451, 1,
-0.1741994, -0.9484307, -4.259128, 0, 1, 0.6352941, 1,
-0.1741342, 0.4919885, -0.8467109, 0, 1, 0.6392157, 1,
-0.1705267, 0.1280343, -1.474731, 0, 1, 0.6470588, 1,
-0.1704236, -0.2291793, -2.730934, 0, 1, 0.6509804, 1,
-0.1648215, 0.4755014, -2.333025, 0, 1, 0.6588235, 1,
-0.1597831, 0.5325204, 0.3127235, 0, 1, 0.6627451, 1,
-0.1559801, 0.9612388, 0.2102323, 0, 1, 0.6705883, 1,
-0.1523408, -0.4607323, -2.685664, 0, 1, 0.6745098, 1,
-0.1495199, -1.741912, -3.095168, 0, 1, 0.682353, 1,
-0.1464133, 0.1943972, 0.5713749, 0, 1, 0.6862745, 1,
-0.1461601, 1.707965, 1.916963, 0, 1, 0.6941177, 1,
-0.1458349, 1.057787, 0.3043634, 0, 1, 0.7019608, 1,
-0.144489, -0.06660636, -3.079254, 0, 1, 0.7058824, 1,
-0.1427599, 0.2948672, -0.6895602, 0, 1, 0.7137255, 1,
-0.1394185, -1.539125, -4.240616, 0, 1, 0.7176471, 1,
-0.1346716, 0.1233348, -1.313383, 0, 1, 0.7254902, 1,
-0.1345374, -1.785822, -2.164213, 0, 1, 0.7294118, 1,
-0.1341272, 0.7896588, -0.09130171, 0, 1, 0.7372549, 1,
-0.1336312, 0.04226024, -0.4995187, 0, 1, 0.7411765, 1,
-0.1330854, -0.9468014, -2.370706, 0, 1, 0.7490196, 1,
-0.1320383, 0.8796837, -2.150439, 0, 1, 0.7529412, 1,
-0.1306664, -0.3448037, -3.216213, 0, 1, 0.7607843, 1,
-0.1303018, -0.331959, -2.467142, 0, 1, 0.7647059, 1,
-0.1290766, -0.4430661, -2.949122, 0, 1, 0.772549, 1,
-0.1267514, 0.6338665, 1.172872, 0, 1, 0.7764706, 1,
-0.1207443, -2.094897, -2.821118, 0, 1, 0.7843137, 1,
-0.1194176, 1.162766, -0.9530601, 0, 1, 0.7882353, 1,
-0.1172738, -1.329059, -3.028949, 0, 1, 0.7960784, 1,
-0.1147394, -0.8721858, -3.180953, 0, 1, 0.8039216, 1,
-0.1018735, 1.41022, 1.312738, 0, 1, 0.8078431, 1,
-0.09623691, -0.5907585, -3.146632, 0, 1, 0.8156863, 1,
-0.09484018, 0.6370478, -0.3102477, 0, 1, 0.8196079, 1,
-0.08138116, 0.4218614, -0.3266901, 0, 1, 0.827451, 1,
-0.08118032, -0.5108876, -3.18657, 0, 1, 0.8313726, 1,
-0.07972831, 0.2900912, 0.4179256, 0, 1, 0.8392157, 1,
-0.07734563, -1.60945, -3.559937, 0, 1, 0.8431373, 1,
-0.07698334, -1.556577, -2.43666, 0, 1, 0.8509804, 1,
-0.07670113, 0.596716, -0.1073354, 0, 1, 0.854902, 1,
-0.07587478, -0.2077045, -2.698969, 0, 1, 0.8627451, 1,
-0.07488533, -1.060508, -2.756614, 0, 1, 0.8666667, 1,
-0.07466555, -0.8316408, -3.150307, 0, 1, 0.8745098, 1,
-0.07313741, 0.6251987, -0.6743938, 0, 1, 0.8784314, 1,
-0.06801284, -0.133796, -2.256588, 0, 1, 0.8862745, 1,
-0.06734505, -0.1182081, -2.230244, 0, 1, 0.8901961, 1,
-0.06689676, 1.329356, -0.7230094, 0, 1, 0.8980392, 1,
-0.06648289, -0.4989172, -2.74984, 0, 1, 0.9058824, 1,
-0.06626829, 1.535278, 0.2191295, 0, 1, 0.9098039, 1,
-0.06588253, 1.699606, -1.558915, 0, 1, 0.9176471, 1,
-0.06311651, 0.6807312, -0.7569363, 0, 1, 0.9215686, 1,
-0.05804845, 0.9567408, -0.151604, 0, 1, 0.9294118, 1,
-0.05744322, -0.2497774, -0.9018235, 0, 1, 0.9333333, 1,
-0.05635772, 1.286224, 0.7437682, 0, 1, 0.9411765, 1,
-0.05589715, 0.5658852, 0.668183, 0, 1, 0.945098, 1,
-0.05294293, 0.63433, -0.7700009, 0, 1, 0.9529412, 1,
-0.04855943, -0.2960905, -3.749297, 0, 1, 0.9568627, 1,
-0.04760288, -0.6162173, -5.306502, 0, 1, 0.9647059, 1,
-0.03497412, -1.014734, -3.256093, 0, 1, 0.9686275, 1,
-0.03484737, -0.6221842, -3.995609, 0, 1, 0.9764706, 1,
-0.03258882, 0.8724197, -1.137541, 0, 1, 0.9803922, 1,
-0.03139322, -0.9524511, -3.99039, 0, 1, 0.9882353, 1,
-0.0242881, 1.186966, 0.1365035, 0, 1, 0.9921569, 1,
-0.02064263, 1.071023, -1.174206, 0, 1, 1, 1,
-0.01857203, 0.6509833, 1.060683, 0, 0.9921569, 1, 1,
-0.01785398, -1.308282, -3.803917, 0, 0.9882353, 1, 1,
-0.01233024, -0.5982288, -3.445454, 0, 0.9803922, 1, 1,
-0.004244942, -0.2446131, -0.7325148, 0, 0.9764706, 1, 1,
-0.003952335, 0.1156326, 1.0208, 0, 0.9686275, 1, 1,
-0.002514031, -0.1045892, -1.815153, 0, 0.9647059, 1, 1,
-0.001557773, -0.5313841, -3.951272, 0, 0.9568627, 1, 1,
0.003319905, 1.468675, 0.8433121, 0, 0.9529412, 1, 1,
0.005380635, 0.02373168, 0.9000496, 0, 0.945098, 1, 1,
0.005946907, 0.3490239, 0.01211097, 0, 0.9411765, 1, 1,
0.006999258, -1.271621, 4.045152, 0, 0.9333333, 1, 1,
0.01306772, 0.4029368, 0.4271604, 0, 0.9294118, 1, 1,
0.01587523, 0.02001101, 0.580833, 0, 0.9215686, 1, 1,
0.01758561, -0.472379, 2.005072, 0, 0.9176471, 1, 1,
0.02336217, -0.2165569, 5.368351, 0, 0.9098039, 1, 1,
0.02795838, -0.9575281, 3.387254, 0, 0.9058824, 1, 1,
0.02887724, -0.1897039, 3.680817, 0, 0.8980392, 1, 1,
0.0349085, 1.188904, 1.119685, 0, 0.8901961, 1, 1,
0.03966992, -1.759219, 3.197795, 0, 0.8862745, 1, 1,
0.04010975, -0.1720428, 2.710704, 0, 0.8784314, 1, 1,
0.04463214, 1.387142, -1.441019, 0, 0.8745098, 1, 1,
0.049422, -0.2952831, 1.413828, 0, 0.8666667, 1, 1,
0.05738585, 0.8264816, -1.035012, 0, 0.8627451, 1, 1,
0.06214404, 0.8802493, -1.527637, 0, 0.854902, 1, 1,
0.06617953, 0.1382674, 0.2441004, 0, 0.8509804, 1, 1,
0.06954742, 1.326736, -1.104721, 0, 0.8431373, 1, 1,
0.07233603, 0.02716997, 0.8284264, 0, 0.8392157, 1, 1,
0.07488003, 1.505224, 1.412081, 0, 0.8313726, 1, 1,
0.07537573, 0.1308241, 2.256817, 0, 0.827451, 1, 1,
0.07818621, -1.032412, 3.04177, 0, 0.8196079, 1, 1,
0.09302635, 0.3681327, 0.8429042, 0, 0.8156863, 1, 1,
0.09380662, -1.805589, 5.133504, 0, 0.8078431, 1, 1,
0.09897457, 0.4116232, 0.2516569, 0, 0.8039216, 1, 1,
0.1033788, -0.5374641, 3.533657, 0, 0.7960784, 1, 1,
0.105887, 1.46205, -0.1400612, 0, 0.7882353, 1, 1,
0.1093635, 0.1629548, 2.435038, 0, 0.7843137, 1, 1,
0.1097462, 1.184086, 1.626413, 0, 0.7764706, 1, 1,
0.1104604, 0.05022645, 0.567727, 0, 0.772549, 1, 1,
0.1130453, -1.625921, 1.022703, 0, 0.7647059, 1, 1,
0.113709, 1.714254, 2.327222, 0, 0.7607843, 1, 1,
0.1172864, -1.066285, 1.505611, 0, 0.7529412, 1, 1,
0.1183514, -1.201229, 2.837171, 0, 0.7490196, 1, 1,
0.1270385, -2.369475, 4.285483, 0, 0.7411765, 1, 1,
0.1273423, -0.8840827, 3.069883, 0, 0.7372549, 1, 1,
0.1275171, 0.4931178, 1.87344, 0, 0.7294118, 1, 1,
0.1280665, -0.2462038, 3.545887, 0, 0.7254902, 1, 1,
0.1304893, -0.611671, 1.4716, 0, 0.7176471, 1, 1,
0.13127, -0.4795376, 3.095365, 0, 0.7137255, 1, 1,
0.1327297, 1.259912, -0.3775415, 0, 0.7058824, 1, 1,
0.1342163, -0.3401644, 1.827616, 0, 0.6980392, 1, 1,
0.1356997, -0.4695881, 4.206307, 0, 0.6941177, 1, 1,
0.1404464, 0.5730686, 1.372374, 0, 0.6862745, 1, 1,
0.1406284, 0.8219844, 1.741742, 0, 0.682353, 1, 1,
0.1428391, 0.4645545, 0.9281969, 0, 0.6745098, 1, 1,
0.1432049, 0.6014346, -0.3727927, 0, 0.6705883, 1, 1,
0.145764, 0.3985775, -1.517121, 0, 0.6627451, 1, 1,
0.146149, -0.1222781, 2.89851, 0, 0.6588235, 1, 1,
0.1512415, 0.883176, 0.197662, 0, 0.6509804, 1, 1,
0.1518263, -0.2720671, 2.233266, 0, 0.6470588, 1, 1,
0.162279, 2.038785, -0.2313913, 0, 0.6392157, 1, 1,
0.1624707, -0.2527661, 2.01122, 0, 0.6352941, 1, 1,
0.1680365, 0.0453928, 1.782585, 0, 0.627451, 1, 1,
0.1705951, 1.098158, 0.1075103, 0, 0.6235294, 1, 1,
0.1712839, -3.518488, 1.299369, 0, 0.6156863, 1, 1,
0.1717634, 0.104748, 0.4793141, 0, 0.6117647, 1, 1,
0.1728989, -1.876573, 1.705504, 0, 0.6039216, 1, 1,
0.1768205, 0.5884535, 1.125943, 0, 0.5960785, 1, 1,
0.1787174, 0.6869983, -0.5665534, 0, 0.5921569, 1, 1,
0.1821071, -0.06811955, 1.758604, 0, 0.5843138, 1, 1,
0.1827903, -0.8196055, 3.6232, 0, 0.5803922, 1, 1,
0.1832021, 0.3072095, 2.318855, 0, 0.572549, 1, 1,
0.1841286, -0.9038997, 2.586649, 0, 0.5686275, 1, 1,
0.1852465, 0.7486006, 1.246957, 0, 0.5607843, 1, 1,
0.1889907, 0.3891183, 0.4598901, 0, 0.5568628, 1, 1,
0.1963354, 0.244803, 0.4847008, 0, 0.5490196, 1, 1,
0.2000051, 1.463824, 1.446407, 0, 0.5450981, 1, 1,
0.2007301, 1.829683, -0.7173301, 0, 0.5372549, 1, 1,
0.204187, 0.6630179, -0.3981139, 0, 0.5333334, 1, 1,
0.2089371, 1.985582, 0.8948043, 0, 0.5254902, 1, 1,
0.2115645, 0.09923023, 2.539053, 0, 0.5215687, 1, 1,
0.213305, 1.582774, -1.915644, 0, 0.5137255, 1, 1,
0.2137465, 2.915682, 0.9090682, 0, 0.509804, 1, 1,
0.2145509, 0.3487158, -0.4316536, 0, 0.5019608, 1, 1,
0.216977, 0.8259953, 1.217502, 0, 0.4941176, 1, 1,
0.2173776, 0.856614, 0.5859056, 0, 0.4901961, 1, 1,
0.2189566, 1.511772, 0.3506882, 0, 0.4823529, 1, 1,
0.2197391, -0.2403044, 2.712749, 0, 0.4784314, 1, 1,
0.2205831, -0.326129, 0.9193934, 0, 0.4705882, 1, 1,
0.2229041, 0.4109646, 0.4278097, 0, 0.4666667, 1, 1,
0.2229632, 0.7470831, 1.28288, 0, 0.4588235, 1, 1,
0.2231352, 1.130904, -1.233092, 0, 0.454902, 1, 1,
0.2254151, 0.6581976, 1.02343, 0, 0.4470588, 1, 1,
0.227117, -0.9550245, 3.090001, 0, 0.4431373, 1, 1,
0.2289169, -0.9626063, 2.201129, 0, 0.4352941, 1, 1,
0.2309868, 0.2764019, 2.134284, 0, 0.4313726, 1, 1,
0.2324373, -0.291478, 3.188046, 0, 0.4235294, 1, 1,
0.2339625, 0.6093444, -0.2648402, 0, 0.4196078, 1, 1,
0.2368909, 0.6295396, -0.4420184, 0, 0.4117647, 1, 1,
0.2379977, -0.8690719, 3.383927, 0, 0.4078431, 1, 1,
0.2395012, -0.9802868, 2.139189, 0, 0.4, 1, 1,
0.2397067, 0.05560691, 1.342398, 0, 0.3921569, 1, 1,
0.2415408, 1.345968, 1.682464, 0, 0.3882353, 1, 1,
0.2419391, 0.9958491, -0.961559, 0, 0.3803922, 1, 1,
0.2443607, -0.03615725, 1.396421, 0, 0.3764706, 1, 1,
0.2498511, -0.5794825, 2.29318, 0, 0.3686275, 1, 1,
0.2499009, -1.051095, 2.844748, 0, 0.3647059, 1, 1,
0.2562405, 0.1561059, 1.496551, 0, 0.3568628, 1, 1,
0.2579028, -0.1376688, 3.364901, 0, 0.3529412, 1, 1,
0.2600957, 1.349624, -2.718107, 0, 0.345098, 1, 1,
0.2603769, 1.118496, 1.370264, 0, 0.3411765, 1, 1,
0.2607775, -0.01558995, 2.516762, 0, 0.3333333, 1, 1,
0.2612016, -0.6520294, 3.987439, 0, 0.3294118, 1, 1,
0.2614978, 0.7027829, 1.264654, 0, 0.3215686, 1, 1,
0.2622754, 0.3972129, 0.3357872, 0, 0.3176471, 1, 1,
0.2625242, -0.2640077, 1.407884, 0, 0.3098039, 1, 1,
0.263924, 0.90338, 0.4429088, 0, 0.3058824, 1, 1,
0.2690992, 0.7554532, 0.9039458, 0, 0.2980392, 1, 1,
0.2719331, 0.5818271, 1.033686, 0, 0.2901961, 1, 1,
0.2734751, -0.2886481, 1.765185, 0, 0.2862745, 1, 1,
0.2753148, -0.02684232, 1.58539, 0, 0.2784314, 1, 1,
0.2815424, -0.6120525, 1.723597, 0, 0.2745098, 1, 1,
0.28495, 1.268993, 0.2161687, 0, 0.2666667, 1, 1,
0.2879483, -1.134859, 3.3867, 0, 0.2627451, 1, 1,
0.2885598, -0.0411005, 1.711641, 0, 0.254902, 1, 1,
0.2901893, 1.38049, 1.130337, 0, 0.2509804, 1, 1,
0.2907681, -0.3981211, 2.637661, 0, 0.2431373, 1, 1,
0.2913935, 0.4614742, 0.7384037, 0, 0.2392157, 1, 1,
0.3001659, 1.608507, -0.2177841, 0, 0.2313726, 1, 1,
0.3030997, 1.190088, 0.5040171, 0, 0.227451, 1, 1,
0.3038562, -0.2072625, 4.333941, 0, 0.2196078, 1, 1,
0.3049451, 1.1739, 0.2939036, 0, 0.2156863, 1, 1,
0.3049706, 1.249301, -0.59579, 0, 0.2078431, 1, 1,
0.3070953, 0.7078826, 0.995283, 0, 0.2039216, 1, 1,
0.3091302, 0.2715607, 1.456358, 0, 0.1960784, 1, 1,
0.310087, 0.2752708, 0.4753309, 0, 0.1882353, 1, 1,
0.3113318, 1.208465, -0.0262993, 0, 0.1843137, 1, 1,
0.3145835, -0.5461066, 3.267149, 0, 0.1764706, 1, 1,
0.3193849, 1.723111, 2.06439, 0, 0.172549, 1, 1,
0.3220258, 0.1669435, 0.5794333, 0, 0.1647059, 1, 1,
0.3238778, -0.1407996, 2.563421, 0, 0.1607843, 1, 1,
0.3248264, -0.5338701, 4.7274, 0, 0.1529412, 1, 1,
0.3284659, -0.3554119, 2.447593, 0, 0.1490196, 1, 1,
0.3309025, 1.028469, 1.675838, 0, 0.1411765, 1, 1,
0.3309741, 2.13697, -0.807828, 0, 0.1372549, 1, 1,
0.3316147, -0.2496545, 1.203349, 0, 0.1294118, 1, 1,
0.3361976, 1.747804, -0.8953076, 0, 0.1254902, 1, 1,
0.3372475, -0.4169947, 1.803155, 0, 0.1176471, 1, 1,
0.3373753, -0.02997504, 2.869851, 0, 0.1137255, 1, 1,
0.3409284, 1.550842, -1.131707, 0, 0.1058824, 1, 1,
0.3436843, -0.5793336, 2.221339, 0, 0.09803922, 1, 1,
0.3447215, 0.1867058, 2.018427, 0, 0.09411765, 1, 1,
0.3450479, -0.5172393, 4.189372, 0, 0.08627451, 1, 1,
0.3499747, -1.604338, 1.942482, 0, 0.08235294, 1, 1,
0.3521487, 0.3453732, -0.2699935, 0, 0.07450981, 1, 1,
0.3534617, -0.8149667, 2.374501, 0, 0.07058824, 1, 1,
0.353608, 0.5398782, 1.672422, 0, 0.0627451, 1, 1,
0.3544919, 0.2939717, 0.4359875, 0, 0.05882353, 1, 1,
0.3578399, -1.222064, 3.159657, 0, 0.05098039, 1, 1,
0.3584681, 0.441437, 0.9374117, 0, 0.04705882, 1, 1,
0.3590903, -0.2365298, 1.877383, 0, 0.03921569, 1, 1,
0.3608594, 2.671265, -0.1567277, 0, 0.03529412, 1, 1,
0.3614963, 1.249167, 0.04314724, 0, 0.02745098, 1, 1,
0.362088, -0.2848125, 3.240882, 0, 0.02352941, 1, 1,
0.3701113, 0.947224, 1.330433, 0, 0.01568628, 1, 1,
0.3795561, 0.6816797, -0.2983294, 0, 0.01176471, 1, 1,
0.380696, 1.053643, 2.480071, 0, 0.003921569, 1, 1,
0.3822203, 1.076485, 0.12, 0.003921569, 0, 1, 1,
0.3952638, -0.2238095, 1.084335, 0.007843138, 0, 1, 1,
0.3962839, -1.036546, 2.174175, 0.01568628, 0, 1, 1,
0.403461, 0.7514693, -0.4565155, 0.01960784, 0, 1, 1,
0.4042203, 1.366266, -0.4328274, 0.02745098, 0, 1, 1,
0.4064361, -0.450855, 1.226334, 0.03137255, 0, 1, 1,
0.417151, -0.6568987, 1.717583, 0.03921569, 0, 1, 1,
0.4171919, 0.1665526, 1.355599, 0.04313726, 0, 1, 1,
0.4173236, -0.08842497, -0.7002493, 0.05098039, 0, 1, 1,
0.4224823, -0.09793108, 3.006923, 0.05490196, 0, 1, 1,
0.4267647, -1.242707, 3.601162, 0.0627451, 0, 1, 1,
0.4292161, 0.9159489, 0.8994493, 0.06666667, 0, 1, 1,
0.4347601, -0.9275879, 2.948344, 0.07450981, 0, 1, 1,
0.4376275, -0.3198765, 3.26976, 0.07843138, 0, 1, 1,
0.4377188, -1.405873, 2.132249, 0.08627451, 0, 1, 1,
0.4393828, -0.4206523, 2.458632, 0.09019608, 0, 1, 1,
0.441976, 1.460943, 1.089438, 0.09803922, 0, 1, 1,
0.44385, 0.8967652, -0.9609212, 0.1058824, 0, 1, 1,
0.4475812, -0.7238545, 0.5367776, 0.1098039, 0, 1, 1,
0.4521697, 0.2211007, 0.8255724, 0.1176471, 0, 1, 1,
0.4583649, -0.4503122, 2.146521, 0.1215686, 0, 1, 1,
0.4609425, -0.4341554, 4.840189, 0.1294118, 0, 1, 1,
0.4656518, 0.3696052, 1.346609, 0.1333333, 0, 1, 1,
0.4672352, 0.2720464, 0.5320621, 0.1411765, 0, 1, 1,
0.4700041, 1.192073, -0.3865623, 0.145098, 0, 1, 1,
0.4810417, 0.05436337, -0.08293625, 0.1529412, 0, 1, 1,
0.4817597, -1.835305, 2.724673, 0.1568628, 0, 1, 1,
0.4821559, -0.5836673, 2.918051, 0.1647059, 0, 1, 1,
0.485183, -0.5219745, 2.561277, 0.1686275, 0, 1, 1,
0.4858553, 0.4569741, 2.862249, 0.1764706, 0, 1, 1,
0.489575, -0.7067875, 1.754599, 0.1803922, 0, 1, 1,
0.4971147, -0.67539, 1.883351, 0.1882353, 0, 1, 1,
0.4972579, 1.194858, 2.119629, 0.1921569, 0, 1, 1,
0.4979917, 0.346352, 2.507657, 0.2, 0, 1, 1,
0.5019098, -0.35895, 2.25332, 0.2078431, 0, 1, 1,
0.5019273, -0.1632222, 4.348598, 0.2117647, 0, 1, 1,
0.5027255, 1.870093, 1.197177, 0.2196078, 0, 1, 1,
0.5066095, -0.8310535, 4.023558, 0.2235294, 0, 1, 1,
0.5086356, 0.4453827, -0.7586197, 0.2313726, 0, 1, 1,
0.5095385, -0.1381177, 1.907138, 0.2352941, 0, 1, 1,
0.509551, -0.061547, 2.457206, 0.2431373, 0, 1, 1,
0.5107959, 0.9562419, 1.147537, 0.2470588, 0, 1, 1,
0.5112563, 0.6684271, 1.570639, 0.254902, 0, 1, 1,
0.5136192, -0.2849914, 2.494977, 0.2588235, 0, 1, 1,
0.5146323, -0.30804, 2.741522, 0.2666667, 0, 1, 1,
0.515863, 1.17998, 0.6330337, 0.2705882, 0, 1, 1,
0.5161418, 1.643401, -0.4022917, 0.2784314, 0, 1, 1,
0.5185136, -0.762193, 3.004333, 0.282353, 0, 1, 1,
0.5202588, 1.641443, -1.042131, 0.2901961, 0, 1, 1,
0.5216787, -0.01349619, 3.044347, 0.2941177, 0, 1, 1,
0.5237305, 2.743054, 0.704618, 0.3019608, 0, 1, 1,
0.5258277, 0.4714584, 0.9178769, 0.3098039, 0, 1, 1,
0.5261802, 0.9633288, -0.8982874, 0.3137255, 0, 1, 1,
0.5342111, 1.36897, -0.2771778, 0.3215686, 0, 1, 1,
0.538949, 0.753726, 1.995799, 0.3254902, 0, 1, 1,
0.5454689, -0.6784697, 1.715678, 0.3333333, 0, 1, 1,
0.5494027, 0.4842478, 1.575045, 0.3372549, 0, 1, 1,
0.5521892, 0.3414388, 1.311599, 0.345098, 0, 1, 1,
0.5563782, 0.06738329, 2.256477, 0.3490196, 0, 1, 1,
0.5584586, 1.210158, 0.3118392, 0.3568628, 0, 1, 1,
0.5604827, 2.100206, -0.8043976, 0.3607843, 0, 1, 1,
0.5665092, 0.03396713, 2.87906, 0.3686275, 0, 1, 1,
0.5713367, -0.7202356, 2.148723, 0.372549, 0, 1, 1,
0.5729353, -0.5676427, 1.47668, 0.3803922, 0, 1, 1,
0.5739009, 0.4017016, -0.7697817, 0.3843137, 0, 1, 1,
0.5767905, 0.4927131, -0.2679314, 0.3921569, 0, 1, 1,
0.580213, 2.700706, 0.23002, 0.3960784, 0, 1, 1,
0.5898409, -0.9635022, 3.572099, 0.4039216, 0, 1, 1,
0.5955619, 0.07141688, 0.5533318, 0.4117647, 0, 1, 1,
0.601047, -0.5777344, 3.318269, 0.4156863, 0, 1, 1,
0.6042936, -0.2497784, 1.606568, 0.4235294, 0, 1, 1,
0.606303, 1.175816, 3.328534, 0.427451, 0, 1, 1,
0.6081929, 0.7204798, 0.9960102, 0.4352941, 0, 1, 1,
0.6083106, 1.749559, 2.683287, 0.4392157, 0, 1, 1,
0.6085013, -0.2544087, 1.444658, 0.4470588, 0, 1, 1,
0.6117597, 0.2174662, -0.5498781, 0.4509804, 0, 1, 1,
0.6149355, -0.5236054, 0.9742902, 0.4588235, 0, 1, 1,
0.6169532, -1.525056, 1.461463, 0.4627451, 0, 1, 1,
0.6176828, -0.499225, 3.711403, 0.4705882, 0, 1, 1,
0.6178449, 1.294064, 2.73937, 0.4745098, 0, 1, 1,
0.618902, -0.4090061, 3.013296, 0.4823529, 0, 1, 1,
0.6279219, 1.13006, -1.162865, 0.4862745, 0, 1, 1,
0.6284801, 0.2119854, 0.7795402, 0.4941176, 0, 1, 1,
0.6373298, -0.9593818, 2.628933, 0.5019608, 0, 1, 1,
0.6378431, -1.146662, 3.351867, 0.5058824, 0, 1, 1,
0.6380977, 1.008005, 1.063213, 0.5137255, 0, 1, 1,
0.6383929, -0.2884233, 3.527811, 0.5176471, 0, 1, 1,
0.6399477, -0.8848907, 2.513323, 0.5254902, 0, 1, 1,
0.642642, 0.1301533, 0.968652, 0.5294118, 0, 1, 1,
0.6437747, -0.1200039, 3.26842, 0.5372549, 0, 1, 1,
0.6501158, 1.458921, -0.5631292, 0.5411765, 0, 1, 1,
0.6502716, -0.6735836, 2.9435, 0.5490196, 0, 1, 1,
0.6517119, -1.681861, 2.548476, 0.5529412, 0, 1, 1,
0.6549404, -0.9704916, 3.662365, 0.5607843, 0, 1, 1,
0.6601776, 0.03919711, 1.217781, 0.5647059, 0, 1, 1,
0.6611623, -0.08594998, 1.630631, 0.572549, 0, 1, 1,
0.674255, 0.04126088, 2.757264, 0.5764706, 0, 1, 1,
0.6808431, -0.6197942, 2.815411, 0.5843138, 0, 1, 1,
0.6832674, -0.5407786, 3.172109, 0.5882353, 0, 1, 1,
0.693568, 0.5278733, 0.6430538, 0.5960785, 0, 1, 1,
0.6956158, -0.8640217, 2.737461, 0.6039216, 0, 1, 1,
0.6974919, -0.6518909, 4.317492, 0.6078432, 0, 1, 1,
0.6977767, 2.377362, 1.599744, 0.6156863, 0, 1, 1,
0.703947, -0.0677055, 1.962225, 0.6196079, 0, 1, 1,
0.7057291, -0.1144603, -0.08761308, 0.627451, 0, 1, 1,
0.7089245, 0.4947299, 1.873019, 0.6313726, 0, 1, 1,
0.709643, -0.2673129, 2.742257, 0.6392157, 0, 1, 1,
0.710919, -1.727955, 4.515699, 0.6431373, 0, 1, 1,
0.7117064, 0.4884795, 0.8734292, 0.6509804, 0, 1, 1,
0.7121688, -0.2538395, 2.272053, 0.654902, 0, 1, 1,
0.714848, 0.6368502, -0.425135, 0.6627451, 0, 1, 1,
0.714879, -0.752334, 2.684739, 0.6666667, 0, 1, 1,
0.7152382, 0.7891034, 0.7247254, 0.6745098, 0, 1, 1,
0.7205863, 1.069571, 1.221497, 0.6784314, 0, 1, 1,
0.7221652, -0.8220977, 1.252934, 0.6862745, 0, 1, 1,
0.7232456, 0.08557497, 1.547043, 0.6901961, 0, 1, 1,
0.7286288, -0.2982037, 0.9939471, 0.6980392, 0, 1, 1,
0.7307515, -1.776692, 4.097888, 0.7058824, 0, 1, 1,
0.7487746, 1.073568, 0.03543781, 0.7098039, 0, 1, 1,
0.7602134, 0.731541, -0.1909591, 0.7176471, 0, 1, 1,
0.767553, -0.9765891, 2.443283, 0.7215686, 0, 1, 1,
0.7702608, -1.277997, 1.356762, 0.7294118, 0, 1, 1,
0.7729015, -0.1334045, 0.9005727, 0.7333333, 0, 1, 1,
0.7746144, 1.821847, 0.1797693, 0.7411765, 0, 1, 1,
0.7751843, 0.5051064, -0.2659057, 0.7450981, 0, 1, 1,
0.7761754, -0.6648023, 3.725258, 0.7529412, 0, 1, 1,
0.7836884, -0.4928841, 2.514824, 0.7568628, 0, 1, 1,
0.7895048, -0.3425364, 2.245846, 0.7647059, 0, 1, 1,
0.7976996, 1.175908, -1.532879, 0.7686275, 0, 1, 1,
0.798478, 1.158473, 1.946488, 0.7764706, 0, 1, 1,
0.8022823, -0.7074208, 0.3082956, 0.7803922, 0, 1, 1,
0.8058367, -1.964072, 2.417455, 0.7882353, 0, 1, 1,
0.8089277, -1.728613, 2.152393, 0.7921569, 0, 1, 1,
0.8091299, 0.3988297, 0.3932663, 0.8, 0, 1, 1,
0.8098654, -3.487532, 4.447989, 0.8078431, 0, 1, 1,
0.8102365, 0.06797547, 1.262648, 0.8117647, 0, 1, 1,
0.8109449, -1.231449, 2.042781, 0.8196079, 0, 1, 1,
0.8147709, -0.7514166, 3.703338, 0.8235294, 0, 1, 1,
0.8155966, -0.3594478, 0.4750001, 0.8313726, 0, 1, 1,
0.8176835, -1.227936, 4.616471, 0.8352941, 0, 1, 1,
0.8231307, -0.3528604, 3.129048, 0.8431373, 0, 1, 1,
0.8340175, -0.0005196625, 2.78019, 0.8470588, 0, 1, 1,
0.8360617, 0.004478231, 1.050488, 0.854902, 0, 1, 1,
0.8376754, 0.3355231, 0.6516795, 0.8588235, 0, 1, 1,
0.8378114, -1.071887, 1.661886, 0.8666667, 0, 1, 1,
0.8502401, -0.1262518, 0.4632345, 0.8705882, 0, 1, 1,
0.8504711, 0.005939018, 0.5318679, 0.8784314, 0, 1, 1,
0.8512233, 0.5580169, 0.01603904, 0.8823529, 0, 1, 1,
0.8564199, 0.8792035, -0.2314239, 0.8901961, 0, 1, 1,
0.8570882, -0.9854723, 3.43193, 0.8941177, 0, 1, 1,
0.8575674, -2.309258, 0.86571, 0.9019608, 0, 1, 1,
0.8576355, 0.6621641, 1.982476, 0.9098039, 0, 1, 1,
0.8676986, -1.49715, 2.449978, 0.9137255, 0, 1, 1,
0.8678322, 0.01159933, 1.191656, 0.9215686, 0, 1, 1,
0.8737885, -0.2059244, 0.467272, 0.9254902, 0, 1, 1,
0.8759109, 1.016678, 2.676671, 0.9333333, 0, 1, 1,
0.8769813, 0.04975602, 2.948505, 0.9372549, 0, 1, 1,
0.8804107, -0.3003143, 3.156952, 0.945098, 0, 1, 1,
0.8904743, -0.04204931, 1.463312, 0.9490196, 0, 1, 1,
0.8918031, -0.3939531, 3.30891, 0.9568627, 0, 1, 1,
0.8959094, 1.266269, -0.7070456, 0.9607843, 0, 1, 1,
0.8968167, -0.8030249, -0.0277241, 0.9686275, 0, 1, 1,
0.8977152, -0.4986345, 1.719689, 0.972549, 0, 1, 1,
0.905913, -0.7693747, 3.104675, 0.9803922, 0, 1, 1,
0.9072075, 1.248266, -0.5818909, 0.9843137, 0, 1, 1,
0.909544, -1.98558, 2.756927, 0.9921569, 0, 1, 1,
0.9130742, 0.03421752, 1.754742, 0.9960784, 0, 1, 1,
0.9156449, -1.141175, 1.543683, 1, 0, 0.9960784, 1,
0.9195873, 0.237941, 1.424542, 1, 0, 0.9882353, 1,
0.9244254, 0.3443564, 2.952947, 1, 0, 0.9843137, 1,
0.9301406, 0.5725486, 0.4987523, 1, 0, 0.9764706, 1,
0.9312876, 1.193479, 1.261464, 1, 0, 0.972549, 1,
0.9405051, -0.8363711, 1.023728, 1, 0, 0.9647059, 1,
0.9484035, -0.7617583, 1.796761, 1, 0, 0.9607843, 1,
0.9514918, 0.1943664, 0.2344604, 1, 0, 0.9529412, 1,
0.9531193, 1.328064, 1.140032, 1, 0, 0.9490196, 1,
0.9539173, -2.253866, 3.504007, 1, 0, 0.9411765, 1,
0.9685661, -0.02732854, 0.7440786, 1, 0, 0.9372549, 1,
0.9730375, 1.716166, 0.3861895, 1, 0, 0.9294118, 1,
0.9849011, -1.006839, 1.279734, 1, 0, 0.9254902, 1,
0.987543, -0.240877, 1.727224, 1, 0, 0.9176471, 1,
0.9888551, 0.206438, 1.800065, 1, 0, 0.9137255, 1,
0.9915199, 0.3398096, 1.246636, 1, 0, 0.9058824, 1,
0.9951248, 0.7809402, -0.3199225, 1, 0, 0.9019608, 1,
1.003031, 0.489135, -0.2903219, 1, 0, 0.8941177, 1,
1.003886, 1.685881, 1.615007, 1, 0, 0.8862745, 1,
1.007661, 0.6362043, 0.9619201, 1, 0, 0.8823529, 1,
1.009559, -0.5618502, 2.266385, 1, 0, 0.8745098, 1,
1.012295, -0.141381, 1.61666, 1, 0, 0.8705882, 1,
1.02961, -0.5553978, 3.504148, 1, 0, 0.8627451, 1,
1.031864, 0.3500628, 0.2875034, 1, 0, 0.8588235, 1,
1.03642, 0.7233989, -0.2887836, 1, 0, 0.8509804, 1,
1.036634, 3.096103, 1.117322, 1, 0, 0.8470588, 1,
1.041984, 0.2700989, 2.608158, 1, 0, 0.8392157, 1,
1.042868, -1.459397, 3.466223, 1, 0, 0.8352941, 1,
1.043579, 0.5358604, 1.125374, 1, 0, 0.827451, 1,
1.048088, 3.600361, -0.7432537, 1, 0, 0.8235294, 1,
1.066115, -0.6494914, 2.171813, 1, 0, 0.8156863, 1,
1.082849, -0.9810503, 2.151619, 1, 0, 0.8117647, 1,
1.084608, 0.8301976, 1.749965, 1, 0, 0.8039216, 1,
1.09052, -0.4197294, 1.628795, 1, 0, 0.7960784, 1,
1.100374, 1.075621, -0.1914719, 1, 0, 0.7921569, 1,
1.108145, -1.13314, 2.826575, 1, 0, 0.7843137, 1,
1.109863, -0.6495828, 3.525841, 1, 0, 0.7803922, 1,
1.117617, -0.1368878, 1.391312, 1, 0, 0.772549, 1,
1.118621, -0.2908169, 2.505517, 1, 0, 0.7686275, 1,
1.118728, 1.304375, 0.5097832, 1, 0, 0.7607843, 1,
1.120999, 2.010495, 0.7725911, 1, 0, 0.7568628, 1,
1.122906, 0.2621331, 2.01531, 1, 0, 0.7490196, 1,
1.126322, 0.5359526, -0.1391429, 1, 0, 0.7450981, 1,
1.132253, 1.690204, -0.4253062, 1, 0, 0.7372549, 1,
1.133042, -0.4829955, 1.048171, 1, 0, 0.7333333, 1,
1.143508, -0.1851063, 1.794956, 1, 0, 0.7254902, 1,
1.154343, -1.854276, 4.548135, 1, 0, 0.7215686, 1,
1.156864, 0.7345947, 1.994559, 1, 0, 0.7137255, 1,
1.157373, -1.607405, 4.35764, 1, 0, 0.7098039, 1,
1.160548, -0.002578758, 3.00285, 1, 0, 0.7019608, 1,
1.171902, -2.116194, 1.5971, 1, 0, 0.6941177, 1,
1.172051, -0.6949539, 1.821181, 1, 0, 0.6901961, 1,
1.172778, -0.01504917, 0.8230305, 1, 0, 0.682353, 1,
1.186216, -0.8387552, 1.413234, 1, 0, 0.6784314, 1,
1.188052, 0.7784707, 1.709699, 1, 0, 0.6705883, 1,
1.199026, 0.5815471, -0.4265105, 1, 0, 0.6666667, 1,
1.19927, -0.09596299, 1.334343, 1, 0, 0.6588235, 1,
1.200676, 1.80242, -0.1052149, 1, 0, 0.654902, 1,
1.214616, -0.004643872, 1.345704, 1, 0, 0.6470588, 1,
1.217619, -0.1275121, 2.616024, 1, 0, 0.6431373, 1,
1.22898, -0.3762195, 1.081765, 1, 0, 0.6352941, 1,
1.23612, 2.166714, 2.094244, 1, 0, 0.6313726, 1,
1.237492, -0.58139, 0.2118053, 1, 0, 0.6235294, 1,
1.248546, 0.5659683, 1.018871, 1, 0, 0.6196079, 1,
1.269907, -2.242174, 1.961877, 1, 0, 0.6117647, 1,
1.270561, 0.7329447, 1.275792, 1, 0, 0.6078432, 1,
1.271966, 0.7519018, 1.349797, 1, 0, 0.6, 1,
1.279358, 0.6255369, 0.5561856, 1, 0, 0.5921569, 1,
1.291113, 2.248165, -0.596466, 1, 0, 0.5882353, 1,
1.292179, -0.6177449, 2.733734, 1, 0, 0.5803922, 1,
1.293085, -2.813077, 1.280351, 1, 0, 0.5764706, 1,
1.294531, 1.365154, 1.001445, 1, 0, 0.5686275, 1,
1.32401, 0.4291443, 1.207968, 1, 0, 0.5647059, 1,
1.327035, 1.556072, 2.496921, 1, 0, 0.5568628, 1,
1.330888, -0.2351073, 2.074294, 1, 0, 0.5529412, 1,
1.331341, -0.2222368, 2.784092, 1, 0, 0.5450981, 1,
1.348899, -0.2140253, 0.2973007, 1, 0, 0.5411765, 1,
1.366325, 0.6003803, 1.672082, 1, 0, 0.5333334, 1,
1.36952, -1.234581, 2.36997, 1, 0, 0.5294118, 1,
1.370219, -1.118782, 1.349662, 1, 0, 0.5215687, 1,
1.371177, 1.033132, 3.084213, 1, 0, 0.5176471, 1,
1.373455, -1.226206, 2.975895, 1, 0, 0.509804, 1,
1.375844, -0.1592854, 0.4833477, 1, 0, 0.5058824, 1,
1.388531, 1.400199, 0.2100729, 1, 0, 0.4980392, 1,
1.41239, -1.041317, 2.078418, 1, 0, 0.4901961, 1,
1.418625, 0.1785988, 0.8786312, 1, 0, 0.4862745, 1,
1.443108, -0.1408251, 1.129005, 1, 0, 0.4784314, 1,
1.454548, -0.007458531, 2.257781, 1, 0, 0.4745098, 1,
1.45746, -0.2114455, 2.780625, 1, 0, 0.4666667, 1,
1.465294, 1.204744, 0.7016996, 1, 0, 0.4627451, 1,
1.47832, 0.4242831, 2.955898, 1, 0, 0.454902, 1,
1.479096, -0.7851229, 1.826444, 1, 0, 0.4509804, 1,
1.487816, -0.09815286, 2.455755, 1, 0, 0.4431373, 1,
1.500067, -1.118341, 3.688633, 1, 0, 0.4392157, 1,
1.524586, -0.1828562, 1.221071, 1, 0, 0.4313726, 1,
1.527279, 1.903505, 0.2898465, 1, 0, 0.427451, 1,
1.527298, 0.4179502, 1.662529, 1, 0, 0.4196078, 1,
1.536368, -0.565572, 2.68566, 1, 0, 0.4156863, 1,
1.539667, 0.008656762, 1.303801, 1, 0, 0.4078431, 1,
1.543795, 0.7509652, 2.449801, 1, 0, 0.4039216, 1,
1.546483, 0.1911383, 0.8123288, 1, 0, 0.3960784, 1,
1.551538, 1.871183, 0.2241024, 1, 0, 0.3882353, 1,
1.559966, -0.8870454, 2.503468, 1, 0, 0.3843137, 1,
1.561624, -1.313115, 1.390311, 1, 0, 0.3764706, 1,
1.597909, -0.4762321, 1.382344, 1, 0, 0.372549, 1,
1.598007, -0.1333555, 2.043763, 1, 0, 0.3647059, 1,
1.616163, 1.134437, 1.656436, 1, 0, 0.3607843, 1,
1.618723, 2.711715, 0.7798245, 1, 0, 0.3529412, 1,
1.629, -0.001936344, 0.7014366, 1, 0, 0.3490196, 1,
1.64156, 0.2294839, 0.7743244, 1, 0, 0.3411765, 1,
1.642406, -0.206681, 2.250218, 1, 0, 0.3372549, 1,
1.646202, 0.9867401, 0.5961109, 1, 0, 0.3294118, 1,
1.646236, 0.2192232, 1.867917, 1, 0, 0.3254902, 1,
1.649947, -2.213697, 2.475487, 1, 0, 0.3176471, 1,
1.65625, -0.7125068, 0.8755115, 1, 0, 0.3137255, 1,
1.679612, 1.377463, 1.647381, 1, 0, 0.3058824, 1,
1.683257, 1.003341, 0.5682747, 1, 0, 0.2980392, 1,
1.695395, 1.311112, 2.384377, 1, 0, 0.2941177, 1,
1.705757, 0.4516036, 0.25528, 1, 0, 0.2862745, 1,
1.707691, -0.2485371, 2.870132, 1, 0, 0.282353, 1,
1.710582, 0.6603953, 2.896019, 1, 0, 0.2745098, 1,
1.722961, -2.041909, 1.302141, 1, 0, 0.2705882, 1,
1.782369, -0.04396181, 1.872215, 1, 0, 0.2627451, 1,
1.79991, 0.2080476, 2.045367, 1, 0, 0.2588235, 1,
1.834742, 0.1805243, 3.289479, 1, 0, 0.2509804, 1,
1.851545, 0.3173345, 2.103343, 1, 0, 0.2470588, 1,
1.887073, 0.6119808, 1.344447, 1, 0, 0.2392157, 1,
1.903836, 0.7897184, 0.9414708, 1, 0, 0.2352941, 1,
1.903929, -1.495672, 2.696122, 1, 0, 0.227451, 1,
1.90865, 2.209637, 1.108268, 1, 0, 0.2235294, 1,
1.946441, -0.101657, 2.204341, 1, 0, 0.2156863, 1,
1.979737, 0.9244195, 2.815955, 1, 0, 0.2117647, 1,
1.996676, 1.424709, -0.8842397, 1, 0, 0.2039216, 1,
2.018849, -1.851017, 0.849762, 1, 0, 0.1960784, 1,
2.020151, 0.2503051, 3.367398, 1, 0, 0.1921569, 1,
2.038989, 0.5340914, 1.599954, 1, 0, 0.1843137, 1,
2.044002, -0.08390351, 2.422435, 1, 0, 0.1803922, 1,
2.050741, 0.5239558, 2.316715, 1, 0, 0.172549, 1,
2.052032, -1.147769, 2.501413, 1, 0, 0.1686275, 1,
2.080145, 0.6216034, 2.320647, 1, 0, 0.1607843, 1,
2.081755, -0.4206506, 3.07503, 1, 0, 0.1568628, 1,
2.082952, 0.1044005, 1.656905, 1, 0, 0.1490196, 1,
2.101097, 0.6948506, 0.6990609, 1, 0, 0.145098, 1,
2.128582, 0.2479863, -0.4198017, 1, 0, 0.1372549, 1,
2.148362, 0.4998773, 2.021591, 1, 0, 0.1333333, 1,
2.17547, 0.3533158, 0.9192794, 1, 0, 0.1254902, 1,
2.198981, -0.4960002, 0.8106229, 1, 0, 0.1215686, 1,
2.201199, -1.070705, 2.174167, 1, 0, 0.1137255, 1,
2.208904, -0.5658293, 2.956519, 1, 0, 0.1098039, 1,
2.231888, -0.03022502, 2.888611, 1, 0, 0.1019608, 1,
2.235456, 0.08485733, 1.124612, 1, 0, 0.09411765, 1,
2.280677, -1.397883, 2.326079, 1, 0, 0.09019608, 1,
2.298203, -1.720861, 2.039606, 1, 0, 0.08235294, 1,
2.306604, -0.1692912, 2.607883, 1, 0, 0.07843138, 1,
2.369352, 1.079807, 1.330047, 1, 0, 0.07058824, 1,
2.406283, -1.223203, 3.078858, 1, 0, 0.06666667, 1,
2.407251, -0.8395327, 3.251411, 1, 0, 0.05882353, 1,
2.433263, -2.139151, 1.296719, 1, 0, 0.05490196, 1,
2.481966, -0.5042593, 1.087293, 1, 0, 0.04705882, 1,
2.490538, 0.7572461, 0.5435557, 1, 0, 0.04313726, 1,
2.501113, 1.354043, 0.6558417, 1, 0, 0.03529412, 1,
2.558777, 1.655202, 0.3333989, 1, 0, 0.03137255, 1,
2.7239, 0.5066501, 0.9217351, 1, 0, 0.02352941, 1,
2.782029, -1.425727, 3.544411, 1, 0, 0.01960784, 1,
2.90745, -1.256476, 1.756416, 1, 0, 0.01176471, 1,
2.9312, 0.08981093, 2.204964, 1, 0, 0.007843138, 1
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
-0.234292, -5.127896, -7.11589, 0, -0.5, 0.5, 0.5,
-0.234292, -5.127896, -7.11589, 1, -0.5, 0.5, 0.5,
-0.234292, -5.127896, -7.11589, 1, 1.5, 0.5, 0.5,
-0.234292, -5.127896, -7.11589, 0, 1.5, 0.5, 0.5
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
-4.472885, -0.1312581, -7.11589, 0, -0.5, 0.5, 0.5,
-4.472885, -0.1312581, -7.11589, 1, -0.5, 0.5, 0.5,
-4.472885, -0.1312581, -7.11589, 1, 1.5, 0.5, 0.5,
-4.472885, -0.1312581, -7.11589, 0, 1.5, 0.5, 0.5
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
-4.472885, -5.127896, 0.03092432, 0, -0.5, 0.5, 0.5,
-4.472885, -5.127896, 0.03092432, 1, -0.5, 0.5, 0.5,
-4.472885, -5.127896, 0.03092432, 1, 1.5, 0.5, 0.5,
-4.472885, -5.127896, 0.03092432, 0, 1.5, 0.5, 0.5
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
-3, -3.974826, -5.466625,
2, -3.974826, -5.466625,
-3, -3.974826, -5.466625,
-3, -4.167004, -5.741502,
-2, -3.974826, -5.466625,
-2, -4.167004, -5.741502,
-1, -3.974826, -5.466625,
-1, -4.167004, -5.741502,
0, -3.974826, -5.466625,
0, -4.167004, -5.741502,
1, -3.974826, -5.466625,
1, -4.167004, -5.741502,
2, -3.974826, -5.466625,
2, -4.167004, -5.741502
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
-3, -4.551361, -6.291257, 0, -0.5, 0.5, 0.5,
-3, -4.551361, -6.291257, 1, -0.5, 0.5, 0.5,
-3, -4.551361, -6.291257, 1, 1.5, 0.5, 0.5,
-3, -4.551361, -6.291257, 0, 1.5, 0.5, 0.5,
-2, -4.551361, -6.291257, 0, -0.5, 0.5, 0.5,
-2, -4.551361, -6.291257, 1, -0.5, 0.5, 0.5,
-2, -4.551361, -6.291257, 1, 1.5, 0.5, 0.5,
-2, -4.551361, -6.291257, 0, 1.5, 0.5, 0.5,
-1, -4.551361, -6.291257, 0, -0.5, 0.5, 0.5,
-1, -4.551361, -6.291257, 1, -0.5, 0.5, 0.5,
-1, -4.551361, -6.291257, 1, 1.5, 0.5, 0.5,
-1, -4.551361, -6.291257, 0, 1.5, 0.5, 0.5,
0, -4.551361, -6.291257, 0, -0.5, 0.5, 0.5,
0, -4.551361, -6.291257, 1, -0.5, 0.5, 0.5,
0, -4.551361, -6.291257, 1, 1.5, 0.5, 0.5,
0, -4.551361, -6.291257, 0, 1.5, 0.5, 0.5,
1, -4.551361, -6.291257, 0, -0.5, 0.5, 0.5,
1, -4.551361, -6.291257, 1, -0.5, 0.5, 0.5,
1, -4.551361, -6.291257, 1, 1.5, 0.5, 0.5,
1, -4.551361, -6.291257, 0, 1.5, 0.5, 0.5,
2, -4.551361, -6.291257, 0, -0.5, 0.5, 0.5,
2, -4.551361, -6.291257, 1, -0.5, 0.5, 0.5,
2, -4.551361, -6.291257, 1, 1.5, 0.5, 0.5,
2, -4.551361, -6.291257, 0, 1.5, 0.5, 0.5
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
-3.494748, -2, -5.466625,
-3.494748, 2, -5.466625,
-3.494748, -2, -5.466625,
-3.657771, -2, -5.741502,
-3.494748, 0, -5.466625,
-3.657771, 0, -5.741502,
-3.494748, 2, -5.466625,
-3.657771, 2, -5.741502
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
"0",
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
-3.983817, -2, -6.291257, 0, -0.5, 0.5, 0.5,
-3.983817, -2, -6.291257, 1, -0.5, 0.5, 0.5,
-3.983817, -2, -6.291257, 1, 1.5, 0.5, 0.5,
-3.983817, -2, -6.291257, 0, 1.5, 0.5, 0.5,
-3.983817, 0, -6.291257, 0, -0.5, 0.5, 0.5,
-3.983817, 0, -6.291257, 1, -0.5, 0.5, 0.5,
-3.983817, 0, -6.291257, 1, 1.5, 0.5, 0.5,
-3.983817, 0, -6.291257, 0, 1.5, 0.5, 0.5,
-3.983817, 2, -6.291257, 0, -0.5, 0.5, 0.5,
-3.983817, 2, -6.291257, 1, -0.5, 0.5, 0.5,
-3.983817, 2, -6.291257, 1, 1.5, 0.5, 0.5,
-3.983817, 2, -6.291257, 0, 1.5, 0.5, 0.5
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
-3.494748, -3.974826, -4,
-3.494748, -3.974826, 4,
-3.494748, -3.974826, -4,
-3.657771, -4.167004, -4,
-3.494748, -3.974826, -2,
-3.657771, -4.167004, -2,
-3.494748, -3.974826, 0,
-3.657771, -4.167004, 0,
-3.494748, -3.974826, 2,
-3.657771, -4.167004, 2,
-3.494748, -3.974826, 4,
-3.657771, -4.167004, 4
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
-3.983817, -4.551361, -4, 0, -0.5, 0.5, 0.5,
-3.983817, -4.551361, -4, 1, -0.5, 0.5, 0.5,
-3.983817, -4.551361, -4, 1, 1.5, 0.5, 0.5,
-3.983817, -4.551361, -4, 0, 1.5, 0.5, 0.5,
-3.983817, -4.551361, -2, 0, -0.5, 0.5, 0.5,
-3.983817, -4.551361, -2, 1, -0.5, 0.5, 0.5,
-3.983817, -4.551361, -2, 1, 1.5, 0.5, 0.5,
-3.983817, -4.551361, -2, 0, 1.5, 0.5, 0.5,
-3.983817, -4.551361, 0, 0, -0.5, 0.5, 0.5,
-3.983817, -4.551361, 0, 1, -0.5, 0.5, 0.5,
-3.983817, -4.551361, 0, 1, 1.5, 0.5, 0.5,
-3.983817, -4.551361, 0, 0, 1.5, 0.5, 0.5,
-3.983817, -4.551361, 2, 0, -0.5, 0.5, 0.5,
-3.983817, -4.551361, 2, 1, -0.5, 0.5, 0.5,
-3.983817, -4.551361, 2, 1, 1.5, 0.5, 0.5,
-3.983817, -4.551361, 2, 0, 1.5, 0.5, 0.5,
-3.983817, -4.551361, 4, 0, -0.5, 0.5, 0.5,
-3.983817, -4.551361, 4, 1, -0.5, 0.5, 0.5,
-3.983817, -4.551361, 4, 1, 1.5, 0.5, 0.5,
-3.983817, -4.551361, 4, 0, 1.5, 0.5, 0.5
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
-3.494748, -3.974826, -5.466625,
-3.494748, 3.712309, -5.466625,
-3.494748, -3.974826, 5.528473,
-3.494748, 3.712309, 5.528473,
-3.494748, -3.974826, -5.466625,
-3.494748, -3.974826, 5.528473,
-3.494748, 3.712309, -5.466625,
-3.494748, 3.712309, 5.528473,
-3.494748, -3.974826, -5.466625,
3.026164, -3.974826, -5.466625,
-3.494748, -3.974826, 5.528473,
3.026164, -3.974826, 5.528473,
-3.494748, 3.712309, -5.466625,
3.026164, 3.712309, -5.466625,
-3.494748, 3.712309, 5.528473,
3.026164, 3.712309, 5.528473,
3.026164, -3.974826, -5.466625,
3.026164, 3.712309, -5.466625,
3.026164, -3.974826, 5.528473,
3.026164, 3.712309, 5.528473,
3.026164, -3.974826, -5.466625,
3.026164, -3.974826, 5.528473,
3.026164, 3.712309, -5.466625,
3.026164, 3.712309, 5.528473
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
var radius = 7.965203;
var distance = 35.43809;
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
mvMatrix.translate( 0.234292, 0.1312581, -0.03092432 );
mvMatrix.scale( 1.320694, 1.120331, 0.7832703 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.43809);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
ethofumesate<-read.table("ethofumesate.xyz")
```

```
## Error in read.table("ethofumesate.xyz"): no lines available in input
```

```r
x<-ethofumesate$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethofumesate' not found
```

```r
y<-ethofumesate$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethofumesate' not found
```

```r
z<-ethofumesate$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethofumesate' not found
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
-3.399784, 2.306765, 0.9688292, 0, 0, 1, 1, 1,
-3.224711, -0.3335796, -1.460476, 1, 0, 0, 1, 1,
-3.104484, 0.03449051, -2.455985, 1, 0, 0, 1, 1,
-2.904598, -0.2894881, -2.525906, 1, 0, 0, 1, 1,
-2.899536, -0.7504204, -1.095731, 1, 0, 0, 1, 1,
-2.810759, -0.2302173, -2.15518, 1, 0, 0, 1, 1,
-2.653491, 0.5934005, -2.135617, 0, 0, 0, 1, 1,
-2.592791, 1.103423, -0.8733334, 0, 0, 0, 1, 1,
-2.556338, -0.530881, -2.639185, 0, 0, 0, 1, 1,
-2.544089, 0.04509044, -2.862494, 0, 0, 0, 1, 1,
-2.485484, 0.3687485, -1.353272, 0, 0, 0, 1, 1,
-2.478755, 1.426768, -1.363032, 0, 0, 0, 1, 1,
-2.476547, 1.330153, -1.627047, 0, 0, 0, 1, 1,
-2.403525, -0.650617, -1.19223, 1, 1, 1, 1, 1,
-2.289788, 0.166035, -0.3112215, 1, 1, 1, 1, 1,
-2.286597, 0.00521068, -1.547133, 1, 1, 1, 1, 1,
-2.255536, -2.044077, -3.229742, 1, 1, 1, 1, 1,
-2.244148, 0.8084247, -2.977814, 1, 1, 1, 1, 1,
-2.213097, -0.6907851, 0.5210705, 1, 1, 1, 1, 1,
-2.183794, 0.01000909, -0.8139006, 1, 1, 1, 1, 1,
-2.178803, -0.8341007, -1.874752, 1, 1, 1, 1, 1,
-2.103964, 0.3838967, -2.530719, 1, 1, 1, 1, 1,
-2.101219, -1.135794, -1.881303, 1, 1, 1, 1, 1,
-2.093059, 1.660791, -3.287288, 1, 1, 1, 1, 1,
-2.088401, 0.296757, -0.3074797, 1, 1, 1, 1, 1,
-2.087455, 0.5974795, -2.96834, 1, 1, 1, 1, 1,
-2.083829, 0.3346956, -0.930327, 1, 1, 1, 1, 1,
-2.081711, 0.6011413, -1.87537, 1, 1, 1, 1, 1,
-2.07701, 0.1710957, -2.638073, 0, 0, 1, 1, 1,
-2.071369, 0.478113, -1.536677, 1, 0, 0, 1, 1,
-2.039693, -0.8092649, -2.946259, 1, 0, 0, 1, 1,
-2.023653, 0.1067739, 0.6900742, 1, 0, 0, 1, 1,
-2.009595, -2.28934, -2.710687, 1, 0, 0, 1, 1,
-1.961689, 0.6220125, -0.2964306, 1, 0, 0, 1, 1,
-1.939174, 0.3839966, 0.2643897, 0, 0, 0, 1, 1,
-1.932186, 0.7569615, -1.158134, 0, 0, 0, 1, 1,
-1.930866, -0.993504, -2.70392, 0, 0, 0, 1, 1,
-1.905906, 2.440725, -0.1803687, 0, 0, 0, 1, 1,
-1.889875, 0.890021, -1.657659, 0, 0, 0, 1, 1,
-1.871961, -1.899306, -1.521236, 0, 0, 0, 1, 1,
-1.865144, -0.5951647, -0.05852642, 0, 0, 0, 1, 1,
-1.829902, 1.960543, -0.0267439, 1, 1, 1, 1, 1,
-1.814588, -0.5614942, -2.831663, 1, 1, 1, 1, 1,
-1.807958, 0.4978716, -0.823333, 1, 1, 1, 1, 1,
-1.785798, -1.40698, -0.2769985, 1, 1, 1, 1, 1,
-1.756983, -0.1427881, -0.1938505, 1, 1, 1, 1, 1,
-1.755487, -0.7157826, -2.291343, 1, 1, 1, 1, 1,
-1.754404, -0.4202331, -1.3915, 1, 1, 1, 1, 1,
-1.75242, 2.045418, -0.7746832, 1, 1, 1, 1, 1,
-1.739685, -0.898666, -2.279714, 1, 1, 1, 1, 1,
-1.724653, -0.9566415, -3.118723, 1, 1, 1, 1, 1,
-1.699387, 0.3292435, -2.36686, 1, 1, 1, 1, 1,
-1.692562, -1.294585, -0.4031876, 1, 1, 1, 1, 1,
-1.692514, -0.6591039, -2.908732, 1, 1, 1, 1, 1,
-1.651963, -0.08406548, -1.341866, 1, 1, 1, 1, 1,
-1.626412, -0.02368074, -3.231529, 1, 1, 1, 1, 1,
-1.612847, -2.130213, -4.470058, 0, 0, 1, 1, 1,
-1.603979, -0.8188334, -1.95994, 1, 0, 0, 1, 1,
-1.599421, -0.07103438, -2.233639, 1, 0, 0, 1, 1,
-1.588907, 0.6898785, -0.630916, 1, 0, 0, 1, 1,
-1.583524, 0.03734253, -2.507318, 1, 0, 0, 1, 1,
-1.556901, -0.08533325, -1.490088, 1, 0, 0, 1, 1,
-1.539112, -0.1330871, -0.3169045, 0, 0, 0, 1, 1,
-1.536761, -0.3416856, -1.063314, 0, 0, 0, 1, 1,
-1.529215, 0.786113, -0.4794322, 0, 0, 0, 1, 1,
-1.527862, 0.1486079, -1.941563, 0, 0, 0, 1, 1,
-1.525097, 0.603264, -0.9856017, 0, 0, 0, 1, 1,
-1.521554, 1.993141, -0.07648169, 0, 0, 0, 1, 1,
-1.51156, -0.5164001, -0.2648484, 0, 0, 0, 1, 1,
-1.510091, 0.8329802, -2.083762, 1, 1, 1, 1, 1,
-1.506268, -0.0165293, -0.5037067, 1, 1, 1, 1, 1,
-1.497883, 1.158965, -0.9777954, 1, 1, 1, 1, 1,
-1.492903, -0.8963362, -3.675495, 1, 1, 1, 1, 1,
-1.48522, -0.6819135, -2.682417, 1, 1, 1, 1, 1,
-1.48049, -1.508429, -3.696281, 1, 1, 1, 1, 1,
-1.474911, 0.4346118, 0.9190645, 1, 1, 1, 1, 1,
-1.469112, 0.3532563, -2.611158, 1, 1, 1, 1, 1,
-1.467611, 0.06417891, -2.72661, 1, 1, 1, 1, 1,
-1.462664, 0.3725691, -2.659957, 1, 1, 1, 1, 1,
-1.461252, -1.652316, -1.610586, 1, 1, 1, 1, 1,
-1.459542, -0.5087121, -1.034336, 1, 1, 1, 1, 1,
-1.45943, -0.008848193, -1.529711, 1, 1, 1, 1, 1,
-1.440943, 0.1953678, -2.620065, 1, 1, 1, 1, 1,
-1.434814, 2.006008, -0.6458073, 1, 1, 1, 1, 1,
-1.422165, -0.2903127, -1.336988, 0, 0, 1, 1, 1,
-1.417896, -1.027827, -0.9075973, 1, 0, 0, 1, 1,
-1.412483, 0.2678171, 0.3007712, 1, 0, 0, 1, 1,
-1.403716, 0.7706214, -2.313427, 1, 0, 0, 1, 1,
-1.398451, 0.151553, -1.036708, 1, 0, 0, 1, 1,
-1.393475, -0.3926576, -0.7312916, 1, 0, 0, 1, 1,
-1.391696, -0.7202654, -2.492243, 0, 0, 0, 1, 1,
-1.389621, 0.3026207, -1.991691, 0, 0, 0, 1, 1,
-1.377137, 1.175654, -0.6837411, 0, 0, 0, 1, 1,
-1.372779, -0.6258797, -4.272412, 0, 0, 0, 1, 1,
-1.371354, 1.45944, 0.8437055, 0, 0, 0, 1, 1,
-1.364841, -1.420717, -1.952287, 0, 0, 0, 1, 1,
-1.361119, 1.424444, -0.4632935, 0, 0, 0, 1, 1,
-1.343624, -0.8739446, -0.8979781, 1, 1, 1, 1, 1,
-1.335156, 0.5060133, -0.03036204, 1, 1, 1, 1, 1,
-1.325271, 0.003333671, -1.863403, 1, 1, 1, 1, 1,
-1.299819, 2.526067, -2.271961, 1, 1, 1, 1, 1,
-1.288131, -1.066043, -2.14184, 1, 1, 1, 1, 1,
-1.287281, -0.8775979, -2.475136, 1, 1, 1, 1, 1,
-1.281466, 0.9601838, 0.4435339, 1, 1, 1, 1, 1,
-1.279739, -0.3475176, -4.081114, 1, 1, 1, 1, 1,
-1.267175, -0.1167343, -1.300518, 1, 1, 1, 1, 1,
-1.256531, 0.4171913, -1.821606, 1, 1, 1, 1, 1,
-1.250549, -0.6870852, -0.9369211, 1, 1, 1, 1, 1,
-1.248387, 1.727639, -1.065523, 1, 1, 1, 1, 1,
-1.247917, -0.5949215, -0.7578337, 1, 1, 1, 1, 1,
-1.241795, -0.235148, -2.023984, 1, 1, 1, 1, 1,
-1.239766, -0.5398548, -3.028077, 1, 1, 1, 1, 1,
-1.235125, 0.9394047, -0.5465096, 0, 0, 1, 1, 1,
-1.23057, 0.7379971, -1.434234, 1, 0, 0, 1, 1,
-1.216804, -1.273744, -0.7373343, 1, 0, 0, 1, 1,
-1.213768, 0.108333, 0.3615935, 1, 0, 0, 1, 1,
-1.207924, 0.7410071, -0.9997576, 1, 0, 0, 1, 1,
-1.206421, 1.580832, -1.408144, 1, 0, 0, 1, 1,
-1.206037, -0.1197868, -0.4596398, 0, 0, 0, 1, 1,
-1.204465, 0.5872623, -1.423421, 0, 0, 0, 1, 1,
-1.200162, -0.812288, -1.456711, 0, 0, 0, 1, 1,
-1.188844, -0.439988, -1.887848, 0, 0, 0, 1, 1,
-1.186065, -0.4271822, -0.3180031, 0, 0, 0, 1, 1,
-1.181732, -0.4956263, -1.428321, 0, 0, 0, 1, 1,
-1.181003, -0.5683897, -1.216578, 0, 0, 0, 1, 1,
-1.175988, 1.286908, -1.666283, 1, 1, 1, 1, 1,
-1.157946, 1.378377, -0.5173933, 1, 1, 1, 1, 1,
-1.155304, -1.031174, -3.403814, 1, 1, 1, 1, 1,
-1.154246, -1.81318, -1.382813, 1, 1, 1, 1, 1,
-1.149072, -0.411472, -1.846197, 1, 1, 1, 1, 1,
-1.144533, -0.03760685, -1.039406, 1, 1, 1, 1, 1,
-1.137682, 0.8232418, -0.2954372, 1, 1, 1, 1, 1,
-1.125776, 1.195778, -0.8047355, 1, 1, 1, 1, 1,
-1.120825, 0.2197445, -0.4748599, 1, 1, 1, 1, 1,
-1.102929, -1.235356, -0.6258882, 1, 1, 1, 1, 1,
-1.080874, -0.2432927, -0.2688281, 1, 1, 1, 1, 1,
-1.079769, -0.4363256, -2.714882, 1, 1, 1, 1, 1,
-1.079533, 2.763141, 0.01467864, 1, 1, 1, 1, 1,
-1.078059, 0.4325237, -2.054976, 1, 1, 1, 1, 1,
-1.077818, 1.300403, -1.455643, 1, 1, 1, 1, 1,
-1.076614, 0.2775448, 0.4264309, 0, 0, 1, 1, 1,
-1.074659, -0.03397872, -2.478712, 1, 0, 0, 1, 1,
-1.067898, -0.4516446, -4.103737, 1, 0, 0, 1, 1,
-1.066813, 0.3760863, -2.913671, 1, 0, 0, 1, 1,
-1.062756, 1.346836, -1.021651, 1, 0, 0, 1, 1,
-1.058178, 0.3400661, -1.999366, 1, 0, 0, 1, 1,
-1.04968, -2.528723, -2.989779, 0, 0, 0, 1, 1,
-1.049359, -0.6078597, -3.525972, 0, 0, 0, 1, 1,
-1.046534, -0.4640755, -1.708051, 0, 0, 0, 1, 1,
-1.045995, -1.953594, -3.110375, 0, 0, 0, 1, 1,
-1.045769, -0.2457408, -0.4784661, 0, 0, 0, 1, 1,
-1.042583, -0.5884159, -2.866362, 0, 0, 0, 1, 1,
-1.041099, 0.4437708, -2.014852, 0, 0, 0, 1, 1,
-1.033943, 1.163152, -1.015404, 1, 1, 1, 1, 1,
-1.025989, 0.9809356, -0.6882014, 1, 1, 1, 1, 1,
-1.020241, -0.1915333, -0.3609797, 1, 1, 1, 1, 1,
-1.019818, -0.763371, 0.3147563, 1, 1, 1, 1, 1,
-1.014087, 0.2202203, -0.4986714, 1, 1, 1, 1, 1,
-1.01271, -0.5088105, -1.954675, 1, 1, 1, 1, 1,
-1.005117, 2.970526, -0.9896715, 1, 1, 1, 1, 1,
-1.002865, -0.1666676, -1.181072, 1, 1, 1, 1, 1,
-1.001375, -1.11524, -3.180158, 1, 1, 1, 1, 1,
-0.9990996, -0.8827193, -2.490057, 1, 1, 1, 1, 1,
-0.9950593, 0.03027249, -2.125688, 1, 1, 1, 1, 1,
-0.9888936, -0.4319949, -1.160728, 1, 1, 1, 1, 1,
-0.9866282, -0.5674013, -2.959278, 1, 1, 1, 1, 1,
-0.984737, 1.0878, -2.159506, 1, 1, 1, 1, 1,
-0.9841124, -0.5177339, -2.610379, 1, 1, 1, 1, 1,
-0.9828835, -1.06264, -1.526084, 0, 0, 1, 1, 1,
-0.979084, -0.02119592, -1.053271, 1, 0, 0, 1, 1,
-0.9702377, -0.1758198, -3.102341, 1, 0, 0, 1, 1,
-0.9582314, -0.8696829, -2.532217, 1, 0, 0, 1, 1,
-0.9554198, -0.2480642, -1.623079, 1, 0, 0, 1, 1,
-0.9466779, -1.131556, -1.813685, 1, 0, 0, 1, 1,
-0.9462458, -2.732374, -2.574177, 0, 0, 0, 1, 1,
-0.9454669, 0.2953431, -0.7820015, 0, 0, 0, 1, 1,
-0.9439134, -0.5439797, -2.223105, 0, 0, 0, 1, 1,
-0.9290842, 0.7808579, -0.5438322, 0, 0, 0, 1, 1,
-0.9237189, 0.8373467, -0.7181348, 0, 0, 0, 1, 1,
-0.9211661, 0.5745733, 0.6175898, 0, 0, 0, 1, 1,
-0.9209843, 0.08953226, 1.078103, 0, 0, 0, 1, 1,
-0.9109739, -0.1256743, -3.039742, 1, 1, 1, 1, 1,
-0.9073989, 0.1850598, -0.9109191, 1, 1, 1, 1, 1,
-0.9016225, -0.6392906, -0.2608313, 1, 1, 1, 1, 1,
-0.8998777, 0.8812848, -2.21932, 1, 1, 1, 1, 1,
-0.8974605, -0.7684945, -3.109585, 1, 1, 1, 1, 1,
-0.8906444, 0.2215991, -2.506885, 1, 1, 1, 1, 1,
-0.8882403, -0.3797348, -1.462839, 1, 1, 1, 1, 1,
-0.8854983, 0.7715907, -0.01366672, 1, 1, 1, 1, 1,
-0.8807197, -0.3805831, -1.428472, 1, 1, 1, 1, 1,
-0.879349, 0.2483503, 0.6888003, 1, 1, 1, 1, 1,
-0.8749269, 0.3379021, -0.1803115, 1, 1, 1, 1, 1,
-0.87402, 1.332391, -0.5738338, 1, 1, 1, 1, 1,
-0.8732929, -0.8962897, -2.953901, 1, 1, 1, 1, 1,
-0.8647616, 0.254335, -0.7870534, 1, 1, 1, 1, 1,
-0.8646674, 0.254245, 0.6342945, 1, 1, 1, 1, 1,
-0.8637933, -0.4033712, -3.618472, 0, 0, 1, 1, 1,
-0.8590629, 0.1335085, 0.03400964, 1, 0, 0, 1, 1,
-0.8574269, -1.940533, -2.236324, 1, 0, 0, 1, 1,
-0.854688, -0.2585483, -2.190891, 1, 0, 0, 1, 1,
-0.8540261, 2.770716, 1.080046, 1, 0, 0, 1, 1,
-0.853801, 0.2750333, -1.055155, 1, 0, 0, 1, 1,
-0.8503801, -0.6981465, -2.363291, 0, 0, 0, 1, 1,
-0.8498988, -0.124158, -0.2027327, 0, 0, 0, 1, 1,
-0.8495817, 1.249429, -0.2556422, 0, 0, 0, 1, 1,
-0.8450248, -2.555, -1.873546, 0, 0, 0, 1, 1,
-0.8430169, 0.4935073, 0.9272979, 0, 0, 0, 1, 1,
-0.8400681, -0.247923, -1.841373, 0, 0, 0, 1, 1,
-0.8378645, 0.775018, -1.417359, 0, 0, 0, 1, 1,
-0.8362026, -0.08098952, -1.373303, 1, 1, 1, 1, 1,
-0.8331422, 1.973694, -0.7174512, 1, 1, 1, 1, 1,
-0.8329419, -3.862877, -1.933928, 1, 1, 1, 1, 1,
-0.8244906, 0.5657521, -0.4124138, 1, 1, 1, 1, 1,
-0.8235304, 0.621943, -0.6486637, 1, 1, 1, 1, 1,
-0.8214667, 0.4020939, -2.596369, 1, 1, 1, 1, 1,
-0.819443, -1.924386, -4.69839, 1, 1, 1, 1, 1,
-0.8169502, 0.8592382, -0.7681432, 1, 1, 1, 1, 1,
-0.815411, 0.7628658, -1.157292, 1, 1, 1, 1, 1,
-0.8107104, 2.007447, -0.7497176, 1, 1, 1, 1, 1,
-0.8060479, -1.198137, -3.334811, 1, 1, 1, 1, 1,
-0.8030291, -1.76252, -2.305996, 1, 1, 1, 1, 1,
-0.8001294, -0.326407, -2.684861, 1, 1, 1, 1, 1,
-0.7995762, -1.019429, -2.262809, 1, 1, 1, 1, 1,
-0.7896547, 0.2129283, -1.018641, 1, 1, 1, 1, 1,
-0.7892141, 1.858809, -0.06133442, 0, 0, 1, 1, 1,
-0.7815868, -2.220331, -1.202411, 1, 0, 0, 1, 1,
-0.7807384, 0.3305429, -1.575311, 1, 0, 0, 1, 1,
-0.7754222, -1.12678, -3.714643, 1, 0, 0, 1, 1,
-0.7745084, 0.5822232, -1.711768, 1, 0, 0, 1, 1,
-0.7688082, 2.148288, 0.7407279, 1, 0, 0, 1, 1,
-0.7579939, 0.5524082, 1.653482, 0, 0, 0, 1, 1,
-0.7564319, -0.9661247, -1.597125, 0, 0, 0, 1, 1,
-0.7554944, 0.2704132, 0.03687802, 0, 0, 0, 1, 1,
-0.7514145, -0.6221823, -2.972349, 0, 0, 0, 1, 1,
-0.749979, 0.002358291, -0.9442095, 0, 0, 0, 1, 1,
-0.7466034, 0.5044752, -0.5239297, 0, 0, 0, 1, 1,
-0.7377578, 6.056769e-05, -2.153925, 0, 0, 0, 1, 1,
-0.7338935, 1.475194, -1.490292, 1, 1, 1, 1, 1,
-0.7304879, 0.004033458, -3.722457, 1, 1, 1, 1, 1,
-0.7304597, 0.00184496, -0.4004817, 1, 1, 1, 1, 1,
-0.7303949, -0.2816058, -1.295475, 1, 1, 1, 1, 1,
-0.7296713, -0.1239375, -2.608458, 1, 1, 1, 1, 1,
-0.7278383, -0.9749317, -2.575711, 1, 1, 1, 1, 1,
-0.722164, -0.2774954, -2.438505, 1, 1, 1, 1, 1,
-0.720174, -1.035242, -3.421182, 1, 1, 1, 1, 1,
-0.7145922, 1.177231, -0.1856973, 1, 1, 1, 1, 1,
-0.7095168, -1.971133, -1.469173, 1, 1, 1, 1, 1,
-0.7076995, -1.244237, -2.55494, 1, 1, 1, 1, 1,
-0.7074643, 0.4575315, 0.941113, 1, 1, 1, 1, 1,
-0.6973987, 0.5275646, -1.328069, 1, 1, 1, 1, 1,
-0.6960756, 0.6378984, 0.4397756, 1, 1, 1, 1, 1,
-0.6950171, 1.41091, -0.1927087, 1, 1, 1, 1, 1,
-0.6946124, -1.541797, -4.37287, 0, 0, 1, 1, 1,
-0.6934797, -0.1434412, -2.79986, 1, 0, 0, 1, 1,
-0.6864563, 0.2973502, 0.4207812, 1, 0, 0, 1, 1,
-0.6853984, 0.6644463, -2.615282, 1, 0, 0, 1, 1,
-0.6791099, 0.050853, -1.203497, 1, 0, 0, 1, 1,
-0.6762646, -1.612276, -2.316773, 1, 0, 0, 1, 1,
-0.6753024, 1.222736, -0.3278449, 0, 0, 0, 1, 1,
-0.6743401, -0.3574969, -1.66745, 0, 0, 0, 1, 1,
-0.6704133, -0.1581522, -2.362399, 0, 0, 0, 1, 1,
-0.6677458, -0.5456124, -1.656889, 0, 0, 0, 1, 1,
-0.665943, 2.611085, -0.6593219, 0, 0, 0, 1, 1,
-0.6616702, -0.1584788, -1.32052, 0, 0, 0, 1, 1,
-0.6569564, -1.213692, -2.884707, 0, 0, 0, 1, 1,
-0.6520935, -1.746726, -3.16592, 1, 1, 1, 1, 1,
-0.6491678, -1.702936, -1.850893, 1, 1, 1, 1, 1,
-0.642386, 1.159937, 0.4963745, 1, 1, 1, 1, 1,
-0.6400985, -1.02918, -1.741315, 1, 1, 1, 1, 1,
-0.6327673, -1.400271, -3.287512, 1, 1, 1, 1, 1,
-0.6264071, 0.02370373, -1.894659, 1, 1, 1, 1, 1,
-0.6263135, -2.036972, -2.538729, 1, 1, 1, 1, 1,
-0.6263018, 1.58471, -0.6067129, 1, 1, 1, 1, 1,
-0.6226525, 1.068374, -1.815567, 1, 1, 1, 1, 1,
-0.6181115, 0.7787976, -2.415146, 1, 1, 1, 1, 1,
-0.612142, 0.310053, -0.6704839, 1, 1, 1, 1, 1,
-0.6087234, 1.431504, -0.7816414, 1, 1, 1, 1, 1,
-0.6085252, 1.422063, -0.8820137, 1, 1, 1, 1, 1,
-0.6072828, -0.3675646, -3.919608, 1, 1, 1, 1, 1,
-0.6021513, -0.8781612, -1.250475, 1, 1, 1, 1, 1,
-0.597818, 0.4223568, -0.3579386, 0, 0, 1, 1, 1,
-0.5907862, -0.7237008, -0.4441247, 1, 0, 0, 1, 1,
-0.5907763, 1.458526, 0.8668368, 1, 0, 0, 1, 1,
-0.5894886, -0.5262989, -2.412953, 1, 0, 0, 1, 1,
-0.5869087, 1.836384, 0.2904122, 1, 0, 0, 1, 1,
-0.5868614, 1.294967, -1.316025, 1, 0, 0, 1, 1,
-0.5864744, -0.5323129, -3.941354, 0, 0, 0, 1, 1,
-0.585453, -0.114653, -1.615252, 0, 0, 0, 1, 1,
-0.5799434, -0.5813632, -1.220623, 0, 0, 0, 1, 1,
-0.5754454, 0.9085377, 0.8447184, 0, 0, 0, 1, 1,
-0.5744209, -0.7173126, -4.391942, 0, 0, 0, 1, 1,
-0.5733185, -0.9908097, -1.586097, 0, 0, 0, 1, 1,
-0.5716017, 1.398233, -0.853959, 0, 0, 0, 1, 1,
-0.5714049, 0.3940091, -1.231696, 1, 1, 1, 1, 1,
-0.5606643, 0.140347, -0.6073114, 1, 1, 1, 1, 1,
-0.5554424, 0.5417404, 0.6243271, 1, 1, 1, 1, 1,
-0.544579, 0.07024123, -1.140562, 1, 1, 1, 1, 1,
-0.5429808, -0.2022467, -1.103208, 1, 1, 1, 1, 1,
-0.5400692, 0.4888455, -0.8232741, 1, 1, 1, 1, 1,
-0.5317307, 0.4443663, -1.231696, 1, 1, 1, 1, 1,
-0.5309773, 0.9551215, -0.6251245, 1, 1, 1, 1, 1,
-0.5272612, -0.1844612, -1.392279, 1, 1, 1, 1, 1,
-0.5222141, -1.283584, -2.431762, 1, 1, 1, 1, 1,
-0.5198817, 1.229368, -1.138185, 1, 1, 1, 1, 1,
-0.5163924, 1.983837, -1.642865, 1, 1, 1, 1, 1,
-0.5152988, -0.7045103, -1.568237, 1, 1, 1, 1, 1,
-0.5143016, 0.488997, -1.010665, 1, 1, 1, 1, 1,
-0.5141023, 0.3878134, -1.658625, 1, 1, 1, 1, 1,
-0.5122379, -1.557941, -3.550526, 0, 0, 1, 1, 1,
-0.5099847, -0.8456498, -0.9939151, 1, 0, 0, 1, 1,
-0.5096488, 0.385004, 0.13352, 1, 0, 0, 1, 1,
-0.5095648, 0.2942117, -1.512461, 1, 0, 0, 1, 1,
-0.5038887, -0.3277613, -2.111194, 1, 0, 0, 1, 1,
-0.5021204, 0.3728279, -1.551367, 1, 0, 0, 1, 1,
-0.4979077, -0.3857329, -1.237568, 0, 0, 0, 1, 1,
-0.4949256, 0.1903957, -0.785888, 0, 0, 0, 1, 1,
-0.4941532, 0.7741858, -0.1278072, 0, 0, 0, 1, 1,
-0.4935857, -0.7614383, -3.795877, 0, 0, 0, 1, 1,
-0.4924594, -0.8422402, -0.8914775, 0, 0, 0, 1, 1,
-0.4914949, -0.5929128, -2.664335, 0, 0, 0, 1, 1,
-0.487035, -1.005691, -4.455132, 0, 0, 0, 1, 1,
-0.4819006, -0.2266003, -2.392464, 1, 1, 1, 1, 1,
-0.4807658, -0.6910558, -2.979618, 1, 1, 1, 1, 1,
-0.4772815, 1.024798, -0.2102274, 1, 1, 1, 1, 1,
-0.4767382, 1.132537, -0.364787, 1, 1, 1, 1, 1,
-0.4730027, -0.3234652, -1.269865, 1, 1, 1, 1, 1,
-0.4650299, 0.3936659, -0.6020015, 1, 1, 1, 1, 1,
-0.4629499, -0.1316431, -1.776632, 1, 1, 1, 1, 1,
-0.4624923, -0.4145795, -1.008281, 1, 1, 1, 1, 1,
-0.4622725, 1.014245, -1.273022, 1, 1, 1, 1, 1,
-0.460151, 0.2869195, -0.718818, 1, 1, 1, 1, 1,
-0.4594295, 1.406712, -2.400064, 1, 1, 1, 1, 1,
-0.4546139, -0.1397277, -2.441195, 1, 1, 1, 1, 1,
-0.4545308, -0.008752693, -0.831009, 1, 1, 1, 1, 1,
-0.4545037, -1.034277, -4.071876, 1, 1, 1, 1, 1,
-0.4468136, 0.7656215, -2.152529, 1, 1, 1, 1, 1,
-0.4450175, 0.6219547, 0.2792866, 0, 0, 1, 1, 1,
-0.444122, 0.5674878, 1.637702, 1, 0, 0, 1, 1,
-0.4429344, -0.9402614, -1.276006, 1, 0, 0, 1, 1,
-0.4387021, -0.2632434, -1.862948, 1, 0, 0, 1, 1,
-0.4346242, -0.8411567, -3.365755, 1, 0, 0, 1, 1,
-0.4336405, 0.3088591, -2.091645, 1, 0, 0, 1, 1,
-0.4325879, 0.4921509, -2.801465, 0, 0, 0, 1, 1,
-0.4295708, -0.2323712, -2.820744, 0, 0, 0, 1, 1,
-0.4267276, -0.9674298, -2.38475, 0, 0, 0, 1, 1,
-0.4252806, -1.083213, -0.1004724, 0, 0, 0, 1, 1,
-0.4233088, -1.703282, -1.937611, 0, 0, 0, 1, 1,
-0.4217629, -0.1734301, -1.301092, 0, 0, 0, 1, 1,
-0.4177253, 0.2498038, -0.07782305, 0, 0, 0, 1, 1,
-0.407331, 1.946639, -0.3240883, 1, 1, 1, 1, 1,
-0.4068249, -0.1943523, -3.851055, 1, 1, 1, 1, 1,
-0.4065254, -0.09232183, -0.2949478, 1, 1, 1, 1, 1,
-0.4014702, 0.1077355, -0.699268, 1, 1, 1, 1, 1,
-0.3991682, 1.152187, 0.003678376, 1, 1, 1, 1, 1,
-0.3970573, 0.5643486, -0.5909675, 1, 1, 1, 1, 1,
-0.3967122, -0.9646824, -3.648999, 1, 1, 1, 1, 1,
-0.3901361, -0.6830947, -3.082347, 1, 1, 1, 1, 1,
-0.387893, 0.4354638, -1.150736, 1, 1, 1, 1, 1,
-0.3868153, -0.443441, -3.341833, 1, 1, 1, 1, 1,
-0.3818811, -1.453563, -1.822407, 1, 1, 1, 1, 1,
-0.3803414, 1.399405, 0.4476369, 1, 1, 1, 1, 1,
-0.3766021, -0.3096218, -1.244072, 1, 1, 1, 1, 1,
-0.3758245, 0.657631, -0.5504374, 1, 1, 1, 1, 1,
-0.3729721, 1.445137, -2.154709, 1, 1, 1, 1, 1,
-0.3719859, 0.6156703, -0.7257422, 0, 0, 1, 1, 1,
-0.3717856, 0.5399884, -1.612599, 1, 0, 0, 1, 1,
-0.3702369, 1.807399, -1.808376, 1, 0, 0, 1, 1,
-0.3691178, -0.5531246, -1.651208, 1, 0, 0, 1, 1,
-0.3606468, -2.265916, -2.74327, 1, 0, 0, 1, 1,
-0.3504167, 0.1285244, -1.55916, 1, 0, 0, 1, 1,
-0.3465558, -1.478888, -3.117329, 0, 0, 0, 1, 1,
-0.3451352, -2.376654, -2.616887, 0, 0, 0, 1, 1,
-0.3429253, -0.4535049, -1.534974, 0, 0, 0, 1, 1,
-0.3361166, -2.002868, -3.00099, 0, 0, 0, 1, 1,
-0.3299444, 1.953786, 0.2237297, 0, 0, 0, 1, 1,
-0.3246251, -0.09279798, -2.260399, 0, 0, 0, 1, 1,
-0.3220598, 1.577773, -0.04564841, 0, 0, 0, 1, 1,
-0.3192323, 0.9081429, -1.588063, 1, 1, 1, 1, 1,
-0.3190147, 0.4156095, -0.32585, 1, 1, 1, 1, 1,
-0.3178791, -2.333434, -3.80232, 1, 1, 1, 1, 1,
-0.3175644, 0.8536254, 0.4182992, 1, 1, 1, 1, 1,
-0.3163387, 1.210631, -0.4088392, 1, 1, 1, 1, 1,
-0.3161809, -2.031101, -0.1639788, 1, 1, 1, 1, 1,
-0.316051, 1.358184, -0.5930385, 1, 1, 1, 1, 1,
-0.3140197, -0.1051322, -4.372746, 1, 1, 1, 1, 1,
-0.3122765, -0.2532957, -2.264103, 1, 1, 1, 1, 1,
-0.308355, 0.05181782, -0.793098, 1, 1, 1, 1, 1,
-0.3082933, 1.461807, -0.6408572, 1, 1, 1, 1, 1,
-0.3050225, -1.06581, -2.329028, 1, 1, 1, 1, 1,
-0.3049129, 0.5776199, -0.9575482, 1, 1, 1, 1, 1,
-0.3035004, -0.8821554, -4.481861, 1, 1, 1, 1, 1,
-0.2959377, 0.7667058, -1.488842, 1, 1, 1, 1, 1,
-0.2926068, -0.1536874, -2.247766, 0, 0, 1, 1, 1,
-0.2898241, 0.04143646, 0.3923758, 1, 0, 0, 1, 1,
-0.2895974, 0.411765, 0.4806695, 1, 0, 0, 1, 1,
-0.2891476, -0.223997, -3.843158, 1, 0, 0, 1, 1,
-0.2888202, 1.019222, -0.8632217, 1, 0, 0, 1, 1,
-0.2880552, -0.1254057, -1.241241, 1, 0, 0, 1, 1,
-0.2837153, -0.5875567, -4.806477, 0, 0, 0, 1, 1,
-0.283638, 0.4571497, -0.2166722, 0, 0, 0, 1, 1,
-0.279933, -1.468223, -3.911727, 0, 0, 0, 1, 1,
-0.2767958, 0.07264648, -0.8903062, 0, 0, 0, 1, 1,
-0.2762269, 0.4388834, -0.2018189, 0, 0, 0, 1, 1,
-0.268508, 0.7539301, -0.7314023, 0, 0, 0, 1, 1,
-0.2675411, -0.6178336, -0.5244238, 0, 0, 0, 1, 1,
-0.2668912, -1.298356, -1.807632, 1, 1, 1, 1, 1,
-0.2663316, -2.025168, -3.060097, 1, 1, 1, 1, 1,
-0.2634139, 0.1735956, 0.04531418, 1, 1, 1, 1, 1,
-0.2556022, -0.6394178, -1.291746, 1, 1, 1, 1, 1,
-0.2537076, -1.099788, -3.867362, 1, 1, 1, 1, 1,
-0.2511216, 0.3288729, -1.137011, 1, 1, 1, 1, 1,
-0.2502229, 0.5921195, -0.71698, 1, 1, 1, 1, 1,
-0.2475416, -2.285978, -4.424641, 1, 1, 1, 1, 1,
-0.2434739, 0.04431899, -2.283098, 1, 1, 1, 1, 1,
-0.2427011, 0.9542203, 1.238645, 1, 1, 1, 1, 1,
-0.2397783, -0.02740387, -0.6138699, 1, 1, 1, 1, 1,
-0.2388155, 0.7900047, 0.4848033, 1, 1, 1, 1, 1,
-0.2370273, -1.635186, -3.087925, 1, 1, 1, 1, 1,
-0.2368657, -0.7050743, -2.304015, 1, 1, 1, 1, 1,
-0.2349871, 0.6809879, 0.72101, 1, 1, 1, 1, 1,
-0.2346638, -0.8540413, -2.257497, 0, 0, 1, 1, 1,
-0.2337146, 0.7780937, 0.0376849, 1, 0, 0, 1, 1,
-0.2260281, -0.3391041, -3.666461, 1, 0, 0, 1, 1,
-0.2156113, -0.1739898, -2.790186, 1, 0, 0, 1, 1,
-0.2105503, -0.2828339, -2.382871, 1, 0, 0, 1, 1,
-0.2103338, 0.8294777, 1.443375, 1, 0, 0, 1, 1,
-0.2070798, -1.612058, -2.910529, 0, 0, 0, 1, 1,
-0.2070431, 0.00435963, -1.137412, 0, 0, 0, 1, 1,
-0.2058066, 0.4395773, 0.05637632, 0, 0, 0, 1, 1,
-0.2024719, -0.7491714, -3.43537, 0, 0, 0, 1, 1,
-0.1985723, -0.7006865, -2.464253, 0, 0, 0, 1, 1,
-0.1899162, 0.3272348, -2.802113, 0, 0, 0, 1, 1,
-0.1896193, 0.5592498, -1.185557, 0, 0, 0, 1, 1,
-0.1853781, 0.8308365, 1.068949, 1, 1, 1, 1, 1,
-0.1851035, 0.5684384, 1.162939, 1, 1, 1, 1, 1,
-0.1847166, -0.249614, -3.002746, 1, 1, 1, 1, 1,
-0.1813096, -0.1589846, -1.416994, 1, 1, 1, 1, 1,
-0.1768766, -0.3912169, -2.059165, 1, 1, 1, 1, 1,
-0.1751876, 0.9544101, -0.2072088, 1, 1, 1, 1, 1,
-0.1741994, -0.9484307, -4.259128, 1, 1, 1, 1, 1,
-0.1741342, 0.4919885, -0.8467109, 1, 1, 1, 1, 1,
-0.1705267, 0.1280343, -1.474731, 1, 1, 1, 1, 1,
-0.1704236, -0.2291793, -2.730934, 1, 1, 1, 1, 1,
-0.1648215, 0.4755014, -2.333025, 1, 1, 1, 1, 1,
-0.1597831, 0.5325204, 0.3127235, 1, 1, 1, 1, 1,
-0.1559801, 0.9612388, 0.2102323, 1, 1, 1, 1, 1,
-0.1523408, -0.4607323, -2.685664, 1, 1, 1, 1, 1,
-0.1495199, -1.741912, -3.095168, 1, 1, 1, 1, 1,
-0.1464133, 0.1943972, 0.5713749, 0, 0, 1, 1, 1,
-0.1461601, 1.707965, 1.916963, 1, 0, 0, 1, 1,
-0.1458349, 1.057787, 0.3043634, 1, 0, 0, 1, 1,
-0.144489, -0.06660636, -3.079254, 1, 0, 0, 1, 1,
-0.1427599, 0.2948672, -0.6895602, 1, 0, 0, 1, 1,
-0.1394185, -1.539125, -4.240616, 1, 0, 0, 1, 1,
-0.1346716, 0.1233348, -1.313383, 0, 0, 0, 1, 1,
-0.1345374, -1.785822, -2.164213, 0, 0, 0, 1, 1,
-0.1341272, 0.7896588, -0.09130171, 0, 0, 0, 1, 1,
-0.1336312, 0.04226024, -0.4995187, 0, 0, 0, 1, 1,
-0.1330854, -0.9468014, -2.370706, 0, 0, 0, 1, 1,
-0.1320383, 0.8796837, -2.150439, 0, 0, 0, 1, 1,
-0.1306664, -0.3448037, -3.216213, 0, 0, 0, 1, 1,
-0.1303018, -0.331959, -2.467142, 1, 1, 1, 1, 1,
-0.1290766, -0.4430661, -2.949122, 1, 1, 1, 1, 1,
-0.1267514, 0.6338665, 1.172872, 1, 1, 1, 1, 1,
-0.1207443, -2.094897, -2.821118, 1, 1, 1, 1, 1,
-0.1194176, 1.162766, -0.9530601, 1, 1, 1, 1, 1,
-0.1172738, -1.329059, -3.028949, 1, 1, 1, 1, 1,
-0.1147394, -0.8721858, -3.180953, 1, 1, 1, 1, 1,
-0.1018735, 1.41022, 1.312738, 1, 1, 1, 1, 1,
-0.09623691, -0.5907585, -3.146632, 1, 1, 1, 1, 1,
-0.09484018, 0.6370478, -0.3102477, 1, 1, 1, 1, 1,
-0.08138116, 0.4218614, -0.3266901, 1, 1, 1, 1, 1,
-0.08118032, -0.5108876, -3.18657, 1, 1, 1, 1, 1,
-0.07972831, 0.2900912, 0.4179256, 1, 1, 1, 1, 1,
-0.07734563, -1.60945, -3.559937, 1, 1, 1, 1, 1,
-0.07698334, -1.556577, -2.43666, 1, 1, 1, 1, 1,
-0.07670113, 0.596716, -0.1073354, 0, 0, 1, 1, 1,
-0.07587478, -0.2077045, -2.698969, 1, 0, 0, 1, 1,
-0.07488533, -1.060508, -2.756614, 1, 0, 0, 1, 1,
-0.07466555, -0.8316408, -3.150307, 1, 0, 0, 1, 1,
-0.07313741, 0.6251987, -0.6743938, 1, 0, 0, 1, 1,
-0.06801284, -0.133796, -2.256588, 1, 0, 0, 1, 1,
-0.06734505, -0.1182081, -2.230244, 0, 0, 0, 1, 1,
-0.06689676, 1.329356, -0.7230094, 0, 0, 0, 1, 1,
-0.06648289, -0.4989172, -2.74984, 0, 0, 0, 1, 1,
-0.06626829, 1.535278, 0.2191295, 0, 0, 0, 1, 1,
-0.06588253, 1.699606, -1.558915, 0, 0, 0, 1, 1,
-0.06311651, 0.6807312, -0.7569363, 0, 0, 0, 1, 1,
-0.05804845, 0.9567408, -0.151604, 0, 0, 0, 1, 1,
-0.05744322, -0.2497774, -0.9018235, 1, 1, 1, 1, 1,
-0.05635772, 1.286224, 0.7437682, 1, 1, 1, 1, 1,
-0.05589715, 0.5658852, 0.668183, 1, 1, 1, 1, 1,
-0.05294293, 0.63433, -0.7700009, 1, 1, 1, 1, 1,
-0.04855943, -0.2960905, -3.749297, 1, 1, 1, 1, 1,
-0.04760288, -0.6162173, -5.306502, 1, 1, 1, 1, 1,
-0.03497412, -1.014734, -3.256093, 1, 1, 1, 1, 1,
-0.03484737, -0.6221842, -3.995609, 1, 1, 1, 1, 1,
-0.03258882, 0.8724197, -1.137541, 1, 1, 1, 1, 1,
-0.03139322, -0.9524511, -3.99039, 1, 1, 1, 1, 1,
-0.0242881, 1.186966, 0.1365035, 1, 1, 1, 1, 1,
-0.02064263, 1.071023, -1.174206, 1, 1, 1, 1, 1,
-0.01857203, 0.6509833, 1.060683, 1, 1, 1, 1, 1,
-0.01785398, -1.308282, -3.803917, 1, 1, 1, 1, 1,
-0.01233024, -0.5982288, -3.445454, 1, 1, 1, 1, 1,
-0.004244942, -0.2446131, -0.7325148, 0, 0, 1, 1, 1,
-0.003952335, 0.1156326, 1.0208, 1, 0, 0, 1, 1,
-0.002514031, -0.1045892, -1.815153, 1, 0, 0, 1, 1,
-0.001557773, -0.5313841, -3.951272, 1, 0, 0, 1, 1,
0.003319905, 1.468675, 0.8433121, 1, 0, 0, 1, 1,
0.005380635, 0.02373168, 0.9000496, 1, 0, 0, 1, 1,
0.005946907, 0.3490239, 0.01211097, 0, 0, 0, 1, 1,
0.006999258, -1.271621, 4.045152, 0, 0, 0, 1, 1,
0.01306772, 0.4029368, 0.4271604, 0, 0, 0, 1, 1,
0.01587523, 0.02001101, 0.580833, 0, 0, 0, 1, 1,
0.01758561, -0.472379, 2.005072, 0, 0, 0, 1, 1,
0.02336217, -0.2165569, 5.368351, 0, 0, 0, 1, 1,
0.02795838, -0.9575281, 3.387254, 0, 0, 0, 1, 1,
0.02887724, -0.1897039, 3.680817, 1, 1, 1, 1, 1,
0.0349085, 1.188904, 1.119685, 1, 1, 1, 1, 1,
0.03966992, -1.759219, 3.197795, 1, 1, 1, 1, 1,
0.04010975, -0.1720428, 2.710704, 1, 1, 1, 1, 1,
0.04463214, 1.387142, -1.441019, 1, 1, 1, 1, 1,
0.049422, -0.2952831, 1.413828, 1, 1, 1, 1, 1,
0.05738585, 0.8264816, -1.035012, 1, 1, 1, 1, 1,
0.06214404, 0.8802493, -1.527637, 1, 1, 1, 1, 1,
0.06617953, 0.1382674, 0.2441004, 1, 1, 1, 1, 1,
0.06954742, 1.326736, -1.104721, 1, 1, 1, 1, 1,
0.07233603, 0.02716997, 0.8284264, 1, 1, 1, 1, 1,
0.07488003, 1.505224, 1.412081, 1, 1, 1, 1, 1,
0.07537573, 0.1308241, 2.256817, 1, 1, 1, 1, 1,
0.07818621, -1.032412, 3.04177, 1, 1, 1, 1, 1,
0.09302635, 0.3681327, 0.8429042, 1, 1, 1, 1, 1,
0.09380662, -1.805589, 5.133504, 0, 0, 1, 1, 1,
0.09897457, 0.4116232, 0.2516569, 1, 0, 0, 1, 1,
0.1033788, -0.5374641, 3.533657, 1, 0, 0, 1, 1,
0.105887, 1.46205, -0.1400612, 1, 0, 0, 1, 1,
0.1093635, 0.1629548, 2.435038, 1, 0, 0, 1, 1,
0.1097462, 1.184086, 1.626413, 1, 0, 0, 1, 1,
0.1104604, 0.05022645, 0.567727, 0, 0, 0, 1, 1,
0.1130453, -1.625921, 1.022703, 0, 0, 0, 1, 1,
0.113709, 1.714254, 2.327222, 0, 0, 0, 1, 1,
0.1172864, -1.066285, 1.505611, 0, 0, 0, 1, 1,
0.1183514, -1.201229, 2.837171, 0, 0, 0, 1, 1,
0.1270385, -2.369475, 4.285483, 0, 0, 0, 1, 1,
0.1273423, -0.8840827, 3.069883, 0, 0, 0, 1, 1,
0.1275171, 0.4931178, 1.87344, 1, 1, 1, 1, 1,
0.1280665, -0.2462038, 3.545887, 1, 1, 1, 1, 1,
0.1304893, -0.611671, 1.4716, 1, 1, 1, 1, 1,
0.13127, -0.4795376, 3.095365, 1, 1, 1, 1, 1,
0.1327297, 1.259912, -0.3775415, 1, 1, 1, 1, 1,
0.1342163, -0.3401644, 1.827616, 1, 1, 1, 1, 1,
0.1356997, -0.4695881, 4.206307, 1, 1, 1, 1, 1,
0.1404464, 0.5730686, 1.372374, 1, 1, 1, 1, 1,
0.1406284, 0.8219844, 1.741742, 1, 1, 1, 1, 1,
0.1428391, 0.4645545, 0.9281969, 1, 1, 1, 1, 1,
0.1432049, 0.6014346, -0.3727927, 1, 1, 1, 1, 1,
0.145764, 0.3985775, -1.517121, 1, 1, 1, 1, 1,
0.146149, -0.1222781, 2.89851, 1, 1, 1, 1, 1,
0.1512415, 0.883176, 0.197662, 1, 1, 1, 1, 1,
0.1518263, -0.2720671, 2.233266, 1, 1, 1, 1, 1,
0.162279, 2.038785, -0.2313913, 0, 0, 1, 1, 1,
0.1624707, -0.2527661, 2.01122, 1, 0, 0, 1, 1,
0.1680365, 0.0453928, 1.782585, 1, 0, 0, 1, 1,
0.1705951, 1.098158, 0.1075103, 1, 0, 0, 1, 1,
0.1712839, -3.518488, 1.299369, 1, 0, 0, 1, 1,
0.1717634, 0.104748, 0.4793141, 1, 0, 0, 1, 1,
0.1728989, -1.876573, 1.705504, 0, 0, 0, 1, 1,
0.1768205, 0.5884535, 1.125943, 0, 0, 0, 1, 1,
0.1787174, 0.6869983, -0.5665534, 0, 0, 0, 1, 1,
0.1821071, -0.06811955, 1.758604, 0, 0, 0, 1, 1,
0.1827903, -0.8196055, 3.6232, 0, 0, 0, 1, 1,
0.1832021, 0.3072095, 2.318855, 0, 0, 0, 1, 1,
0.1841286, -0.9038997, 2.586649, 0, 0, 0, 1, 1,
0.1852465, 0.7486006, 1.246957, 1, 1, 1, 1, 1,
0.1889907, 0.3891183, 0.4598901, 1, 1, 1, 1, 1,
0.1963354, 0.244803, 0.4847008, 1, 1, 1, 1, 1,
0.2000051, 1.463824, 1.446407, 1, 1, 1, 1, 1,
0.2007301, 1.829683, -0.7173301, 1, 1, 1, 1, 1,
0.204187, 0.6630179, -0.3981139, 1, 1, 1, 1, 1,
0.2089371, 1.985582, 0.8948043, 1, 1, 1, 1, 1,
0.2115645, 0.09923023, 2.539053, 1, 1, 1, 1, 1,
0.213305, 1.582774, -1.915644, 1, 1, 1, 1, 1,
0.2137465, 2.915682, 0.9090682, 1, 1, 1, 1, 1,
0.2145509, 0.3487158, -0.4316536, 1, 1, 1, 1, 1,
0.216977, 0.8259953, 1.217502, 1, 1, 1, 1, 1,
0.2173776, 0.856614, 0.5859056, 1, 1, 1, 1, 1,
0.2189566, 1.511772, 0.3506882, 1, 1, 1, 1, 1,
0.2197391, -0.2403044, 2.712749, 1, 1, 1, 1, 1,
0.2205831, -0.326129, 0.9193934, 0, 0, 1, 1, 1,
0.2229041, 0.4109646, 0.4278097, 1, 0, 0, 1, 1,
0.2229632, 0.7470831, 1.28288, 1, 0, 0, 1, 1,
0.2231352, 1.130904, -1.233092, 1, 0, 0, 1, 1,
0.2254151, 0.6581976, 1.02343, 1, 0, 0, 1, 1,
0.227117, -0.9550245, 3.090001, 1, 0, 0, 1, 1,
0.2289169, -0.9626063, 2.201129, 0, 0, 0, 1, 1,
0.2309868, 0.2764019, 2.134284, 0, 0, 0, 1, 1,
0.2324373, -0.291478, 3.188046, 0, 0, 0, 1, 1,
0.2339625, 0.6093444, -0.2648402, 0, 0, 0, 1, 1,
0.2368909, 0.6295396, -0.4420184, 0, 0, 0, 1, 1,
0.2379977, -0.8690719, 3.383927, 0, 0, 0, 1, 1,
0.2395012, -0.9802868, 2.139189, 0, 0, 0, 1, 1,
0.2397067, 0.05560691, 1.342398, 1, 1, 1, 1, 1,
0.2415408, 1.345968, 1.682464, 1, 1, 1, 1, 1,
0.2419391, 0.9958491, -0.961559, 1, 1, 1, 1, 1,
0.2443607, -0.03615725, 1.396421, 1, 1, 1, 1, 1,
0.2498511, -0.5794825, 2.29318, 1, 1, 1, 1, 1,
0.2499009, -1.051095, 2.844748, 1, 1, 1, 1, 1,
0.2562405, 0.1561059, 1.496551, 1, 1, 1, 1, 1,
0.2579028, -0.1376688, 3.364901, 1, 1, 1, 1, 1,
0.2600957, 1.349624, -2.718107, 1, 1, 1, 1, 1,
0.2603769, 1.118496, 1.370264, 1, 1, 1, 1, 1,
0.2607775, -0.01558995, 2.516762, 1, 1, 1, 1, 1,
0.2612016, -0.6520294, 3.987439, 1, 1, 1, 1, 1,
0.2614978, 0.7027829, 1.264654, 1, 1, 1, 1, 1,
0.2622754, 0.3972129, 0.3357872, 1, 1, 1, 1, 1,
0.2625242, -0.2640077, 1.407884, 1, 1, 1, 1, 1,
0.263924, 0.90338, 0.4429088, 0, 0, 1, 1, 1,
0.2690992, 0.7554532, 0.9039458, 1, 0, 0, 1, 1,
0.2719331, 0.5818271, 1.033686, 1, 0, 0, 1, 1,
0.2734751, -0.2886481, 1.765185, 1, 0, 0, 1, 1,
0.2753148, -0.02684232, 1.58539, 1, 0, 0, 1, 1,
0.2815424, -0.6120525, 1.723597, 1, 0, 0, 1, 1,
0.28495, 1.268993, 0.2161687, 0, 0, 0, 1, 1,
0.2879483, -1.134859, 3.3867, 0, 0, 0, 1, 1,
0.2885598, -0.0411005, 1.711641, 0, 0, 0, 1, 1,
0.2901893, 1.38049, 1.130337, 0, 0, 0, 1, 1,
0.2907681, -0.3981211, 2.637661, 0, 0, 0, 1, 1,
0.2913935, 0.4614742, 0.7384037, 0, 0, 0, 1, 1,
0.3001659, 1.608507, -0.2177841, 0, 0, 0, 1, 1,
0.3030997, 1.190088, 0.5040171, 1, 1, 1, 1, 1,
0.3038562, -0.2072625, 4.333941, 1, 1, 1, 1, 1,
0.3049451, 1.1739, 0.2939036, 1, 1, 1, 1, 1,
0.3049706, 1.249301, -0.59579, 1, 1, 1, 1, 1,
0.3070953, 0.7078826, 0.995283, 1, 1, 1, 1, 1,
0.3091302, 0.2715607, 1.456358, 1, 1, 1, 1, 1,
0.310087, 0.2752708, 0.4753309, 1, 1, 1, 1, 1,
0.3113318, 1.208465, -0.0262993, 1, 1, 1, 1, 1,
0.3145835, -0.5461066, 3.267149, 1, 1, 1, 1, 1,
0.3193849, 1.723111, 2.06439, 1, 1, 1, 1, 1,
0.3220258, 0.1669435, 0.5794333, 1, 1, 1, 1, 1,
0.3238778, -0.1407996, 2.563421, 1, 1, 1, 1, 1,
0.3248264, -0.5338701, 4.7274, 1, 1, 1, 1, 1,
0.3284659, -0.3554119, 2.447593, 1, 1, 1, 1, 1,
0.3309025, 1.028469, 1.675838, 1, 1, 1, 1, 1,
0.3309741, 2.13697, -0.807828, 0, 0, 1, 1, 1,
0.3316147, -0.2496545, 1.203349, 1, 0, 0, 1, 1,
0.3361976, 1.747804, -0.8953076, 1, 0, 0, 1, 1,
0.3372475, -0.4169947, 1.803155, 1, 0, 0, 1, 1,
0.3373753, -0.02997504, 2.869851, 1, 0, 0, 1, 1,
0.3409284, 1.550842, -1.131707, 1, 0, 0, 1, 1,
0.3436843, -0.5793336, 2.221339, 0, 0, 0, 1, 1,
0.3447215, 0.1867058, 2.018427, 0, 0, 0, 1, 1,
0.3450479, -0.5172393, 4.189372, 0, 0, 0, 1, 1,
0.3499747, -1.604338, 1.942482, 0, 0, 0, 1, 1,
0.3521487, 0.3453732, -0.2699935, 0, 0, 0, 1, 1,
0.3534617, -0.8149667, 2.374501, 0, 0, 0, 1, 1,
0.353608, 0.5398782, 1.672422, 0, 0, 0, 1, 1,
0.3544919, 0.2939717, 0.4359875, 1, 1, 1, 1, 1,
0.3578399, -1.222064, 3.159657, 1, 1, 1, 1, 1,
0.3584681, 0.441437, 0.9374117, 1, 1, 1, 1, 1,
0.3590903, -0.2365298, 1.877383, 1, 1, 1, 1, 1,
0.3608594, 2.671265, -0.1567277, 1, 1, 1, 1, 1,
0.3614963, 1.249167, 0.04314724, 1, 1, 1, 1, 1,
0.362088, -0.2848125, 3.240882, 1, 1, 1, 1, 1,
0.3701113, 0.947224, 1.330433, 1, 1, 1, 1, 1,
0.3795561, 0.6816797, -0.2983294, 1, 1, 1, 1, 1,
0.380696, 1.053643, 2.480071, 1, 1, 1, 1, 1,
0.3822203, 1.076485, 0.12, 1, 1, 1, 1, 1,
0.3952638, -0.2238095, 1.084335, 1, 1, 1, 1, 1,
0.3962839, -1.036546, 2.174175, 1, 1, 1, 1, 1,
0.403461, 0.7514693, -0.4565155, 1, 1, 1, 1, 1,
0.4042203, 1.366266, -0.4328274, 1, 1, 1, 1, 1,
0.4064361, -0.450855, 1.226334, 0, 0, 1, 1, 1,
0.417151, -0.6568987, 1.717583, 1, 0, 0, 1, 1,
0.4171919, 0.1665526, 1.355599, 1, 0, 0, 1, 1,
0.4173236, -0.08842497, -0.7002493, 1, 0, 0, 1, 1,
0.4224823, -0.09793108, 3.006923, 1, 0, 0, 1, 1,
0.4267647, -1.242707, 3.601162, 1, 0, 0, 1, 1,
0.4292161, 0.9159489, 0.8994493, 0, 0, 0, 1, 1,
0.4347601, -0.9275879, 2.948344, 0, 0, 0, 1, 1,
0.4376275, -0.3198765, 3.26976, 0, 0, 0, 1, 1,
0.4377188, -1.405873, 2.132249, 0, 0, 0, 1, 1,
0.4393828, -0.4206523, 2.458632, 0, 0, 0, 1, 1,
0.441976, 1.460943, 1.089438, 0, 0, 0, 1, 1,
0.44385, 0.8967652, -0.9609212, 0, 0, 0, 1, 1,
0.4475812, -0.7238545, 0.5367776, 1, 1, 1, 1, 1,
0.4521697, 0.2211007, 0.8255724, 1, 1, 1, 1, 1,
0.4583649, -0.4503122, 2.146521, 1, 1, 1, 1, 1,
0.4609425, -0.4341554, 4.840189, 1, 1, 1, 1, 1,
0.4656518, 0.3696052, 1.346609, 1, 1, 1, 1, 1,
0.4672352, 0.2720464, 0.5320621, 1, 1, 1, 1, 1,
0.4700041, 1.192073, -0.3865623, 1, 1, 1, 1, 1,
0.4810417, 0.05436337, -0.08293625, 1, 1, 1, 1, 1,
0.4817597, -1.835305, 2.724673, 1, 1, 1, 1, 1,
0.4821559, -0.5836673, 2.918051, 1, 1, 1, 1, 1,
0.485183, -0.5219745, 2.561277, 1, 1, 1, 1, 1,
0.4858553, 0.4569741, 2.862249, 1, 1, 1, 1, 1,
0.489575, -0.7067875, 1.754599, 1, 1, 1, 1, 1,
0.4971147, -0.67539, 1.883351, 1, 1, 1, 1, 1,
0.4972579, 1.194858, 2.119629, 1, 1, 1, 1, 1,
0.4979917, 0.346352, 2.507657, 0, 0, 1, 1, 1,
0.5019098, -0.35895, 2.25332, 1, 0, 0, 1, 1,
0.5019273, -0.1632222, 4.348598, 1, 0, 0, 1, 1,
0.5027255, 1.870093, 1.197177, 1, 0, 0, 1, 1,
0.5066095, -0.8310535, 4.023558, 1, 0, 0, 1, 1,
0.5086356, 0.4453827, -0.7586197, 1, 0, 0, 1, 1,
0.5095385, -0.1381177, 1.907138, 0, 0, 0, 1, 1,
0.509551, -0.061547, 2.457206, 0, 0, 0, 1, 1,
0.5107959, 0.9562419, 1.147537, 0, 0, 0, 1, 1,
0.5112563, 0.6684271, 1.570639, 0, 0, 0, 1, 1,
0.5136192, -0.2849914, 2.494977, 0, 0, 0, 1, 1,
0.5146323, -0.30804, 2.741522, 0, 0, 0, 1, 1,
0.515863, 1.17998, 0.6330337, 0, 0, 0, 1, 1,
0.5161418, 1.643401, -0.4022917, 1, 1, 1, 1, 1,
0.5185136, -0.762193, 3.004333, 1, 1, 1, 1, 1,
0.5202588, 1.641443, -1.042131, 1, 1, 1, 1, 1,
0.5216787, -0.01349619, 3.044347, 1, 1, 1, 1, 1,
0.5237305, 2.743054, 0.704618, 1, 1, 1, 1, 1,
0.5258277, 0.4714584, 0.9178769, 1, 1, 1, 1, 1,
0.5261802, 0.9633288, -0.8982874, 1, 1, 1, 1, 1,
0.5342111, 1.36897, -0.2771778, 1, 1, 1, 1, 1,
0.538949, 0.753726, 1.995799, 1, 1, 1, 1, 1,
0.5454689, -0.6784697, 1.715678, 1, 1, 1, 1, 1,
0.5494027, 0.4842478, 1.575045, 1, 1, 1, 1, 1,
0.5521892, 0.3414388, 1.311599, 1, 1, 1, 1, 1,
0.5563782, 0.06738329, 2.256477, 1, 1, 1, 1, 1,
0.5584586, 1.210158, 0.3118392, 1, 1, 1, 1, 1,
0.5604827, 2.100206, -0.8043976, 1, 1, 1, 1, 1,
0.5665092, 0.03396713, 2.87906, 0, 0, 1, 1, 1,
0.5713367, -0.7202356, 2.148723, 1, 0, 0, 1, 1,
0.5729353, -0.5676427, 1.47668, 1, 0, 0, 1, 1,
0.5739009, 0.4017016, -0.7697817, 1, 0, 0, 1, 1,
0.5767905, 0.4927131, -0.2679314, 1, 0, 0, 1, 1,
0.580213, 2.700706, 0.23002, 1, 0, 0, 1, 1,
0.5898409, -0.9635022, 3.572099, 0, 0, 0, 1, 1,
0.5955619, 0.07141688, 0.5533318, 0, 0, 0, 1, 1,
0.601047, -0.5777344, 3.318269, 0, 0, 0, 1, 1,
0.6042936, -0.2497784, 1.606568, 0, 0, 0, 1, 1,
0.606303, 1.175816, 3.328534, 0, 0, 0, 1, 1,
0.6081929, 0.7204798, 0.9960102, 0, 0, 0, 1, 1,
0.6083106, 1.749559, 2.683287, 0, 0, 0, 1, 1,
0.6085013, -0.2544087, 1.444658, 1, 1, 1, 1, 1,
0.6117597, 0.2174662, -0.5498781, 1, 1, 1, 1, 1,
0.6149355, -0.5236054, 0.9742902, 1, 1, 1, 1, 1,
0.6169532, -1.525056, 1.461463, 1, 1, 1, 1, 1,
0.6176828, -0.499225, 3.711403, 1, 1, 1, 1, 1,
0.6178449, 1.294064, 2.73937, 1, 1, 1, 1, 1,
0.618902, -0.4090061, 3.013296, 1, 1, 1, 1, 1,
0.6279219, 1.13006, -1.162865, 1, 1, 1, 1, 1,
0.6284801, 0.2119854, 0.7795402, 1, 1, 1, 1, 1,
0.6373298, -0.9593818, 2.628933, 1, 1, 1, 1, 1,
0.6378431, -1.146662, 3.351867, 1, 1, 1, 1, 1,
0.6380977, 1.008005, 1.063213, 1, 1, 1, 1, 1,
0.6383929, -0.2884233, 3.527811, 1, 1, 1, 1, 1,
0.6399477, -0.8848907, 2.513323, 1, 1, 1, 1, 1,
0.642642, 0.1301533, 0.968652, 1, 1, 1, 1, 1,
0.6437747, -0.1200039, 3.26842, 0, 0, 1, 1, 1,
0.6501158, 1.458921, -0.5631292, 1, 0, 0, 1, 1,
0.6502716, -0.6735836, 2.9435, 1, 0, 0, 1, 1,
0.6517119, -1.681861, 2.548476, 1, 0, 0, 1, 1,
0.6549404, -0.9704916, 3.662365, 1, 0, 0, 1, 1,
0.6601776, 0.03919711, 1.217781, 1, 0, 0, 1, 1,
0.6611623, -0.08594998, 1.630631, 0, 0, 0, 1, 1,
0.674255, 0.04126088, 2.757264, 0, 0, 0, 1, 1,
0.6808431, -0.6197942, 2.815411, 0, 0, 0, 1, 1,
0.6832674, -0.5407786, 3.172109, 0, 0, 0, 1, 1,
0.693568, 0.5278733, 0.6430538, 0, 0, 0, 1, 1,
0.6956158, -0.8640217, 2.737461, 0, 0, 0, 1, 1,
0.6974919, -0.6518909, 4.317492, 0, 0, 0, 1, 1,
0.6977767, 2.377362, 1.599744, 1, 1, 1, 1, 1,
0.703947, -0.0677055, 1.962225, 1, 1, 1, 1, 1,
0.7057291, -0.1144603, -0.08761308, 1, 1, 1, 1, 1,
0.7089245, 0.4947299, 1.873019, 1, 1, 1, 1, 1,
0.709643, -0.2673129, 2.742257, 1, 1, 1, 1, 1,
0.710919, -1.727955, 4.515699, 1, 1, 1, 1, 1,
0.7117064, 0.4884795, 0.8734292, 1, 1, 1, 1, 1,
0.7121688, -0.2538395, 2.272053, 1, 1, 1, 1, 1,
0.714848, 0.6368502, -0.425135, 1, 1, 1, 1, 1,
0.714879, -0.752334, 2.684739, 1, 1, 1, 1, 1,
0.7152382, 0.7891034, 0.7247254, 1, 1, 1, 1, 1,
0.7205863, 1.069571, 1.221497, 1, 1, 1, 1, 1,
0.7221652, -0.8220977, 1.252934, 1, 1, 1, 1, 1,
0.7232456, 0.08557497, 1.547043, 1, 1, 1, 1, 1,
0.7286288, -0.2982037, 0.9939471, 1, 1, 1, 1, 1,
0.7307515, -1.776692, 4.097888, 0, 0, 1, 1, 1,
0.7487746, 1.073568, 0.03543781, 1, 0, 0, 1, 1,
0.7602134, 0.731541, -0.1909591, 1, 0, 0, 1, 1,
0.767553, -0.9765891, 2.443283, 1, 0, 0, 1, 1,
0.7702608, -1.277997, 1.356762, 1, 0, 0, 1, 1,
0.7729015, -0.1334045, 0.9005727, 1, 0, 0, 1, 1,
0.7746144, 1.821847, 0.1797693, 0, 0, 0, 1, 1,
0.7751843, 0.5051064, -0.2659057, 0, 0, 0, 1, 1,
0.7761754, -0.6648023, 3.725258, 0, 0, 0, 1, 1,
0.7836884, -0.4928841, 2.514824, 0, 0, 0, 1, 1,
0.7895048, -0.3425364, 2.245846, 0, 0, 0, 1, 1,
0.7976996, 1.175908, -1.532879, 0, 0, 0, 1, 1,
0.798478, 1.158473, 1.946488, 0, 0, 0, 1, 1,
0.8022823, -0.7074208, 0.3082956, 1, 1, 1, 1, 1,
0.8058367, -1.964072, 2.417455, 1, 1, 1, 1, 1,
0.8089277, -1.728613, 2.152393, 1, 1, 1, 1, 1,
0.8091299, 0.3988297, 0.3932663, 1, 1, 1, 1, 1,
0.8098654, -3.487532, 4.447989, 1, 1, 1, 1, 1,
0.8102365, 0.06797547, 1.262648, 1, 1, 1, 1, 1,
0.8109449, -1.231449, 2.042781, 1, 1, 1, 1, 1,
0.8147709, -0.7514166, 3.703338, 1, 1, 1, 1, 1,
0.8155966, -0.3594478, 0.4750001, 1, 1, 1, 1, 1,
0.8176835, -1.227936, 4.616471, 1, 1, 1, 1, 1,
0.8231307, -0.3528604, 3.129048, 1, 1, 1, 1, 1,
0.8340175, -0.0005196625, 2.78019, 1, 1, 1, 1, 1,
0.8360617, 0.004478231, 1.050488, 1, 1, 1, 1, 1,
0.8376754, 0.3355231, 0.6516795, 1, 1, 1, 1, 1,
0.8378114, -1.071887, 1.661886, 1, 1, 1, 1, 1,
0.8502401, -0.1262518, 0.4632345, 0, 0, 1, 1, 1,
0.8504711, 0.005939018, 0.5318679, 1, 0, 0, 1, 1,
0.8512233, 0.5580169, 0.01603904, 1, 0, 0, 1, 1,
0.8564199, 0.8792035, -0.2314239, 1, 0, 0, 1, 1,
0.8570882, -0.9854723, 3.43193, 1, 0, 0, 1, 1,
0.8575674, -2.309258, 0.86571, 1, 0, 0, 1, 1,
0.8576355, 0.6621641, 1.982476, 0, 0, 0, 1, 1,
0.8676986, -1.49715, 2.449978, 0, 0, 0, 1, 1,
0.8678322, 0.01159933, 1.191656, 0, 0, 0, 1, 1,
0.8737885, -0.2059244, 0.467272, 0, 0, 0, 1, 1,
0.8759109, 1.016678, 2.676671, 0, 0, 0, 1, 1,
0.8769813, 0.04975602, 2.948505, 0, 0, 0, 1, 1,
0.8804107, -0.3003143, 3.156952, 0, 0, 0, 1, 1,
0.8904743, -0.04204931, 1.463312, 1, 1, 1, 1, 1,
0.8918031, -0.3939531, 3.30891, 1, 1, 1, 1, 1,
0.8959094, 1.266269, -0.7070456, 1, 1, 1, 1, 1,
0.8968167, -0.8030249, -0.0277241, 1, 1, 1, 1, 1,
0.8977152, -0.4986345, 1.719689, 1, 1, 1, 1, 1,
0.905913, -0.7693747, 3.104675, 1, 1, 1, 1, 1,
0.9072075, 1.248266, -0.5818909, 1, 1, 1, 1, 1,
0.909544, -1.98558, 2.756927, 1, 1, 1, 1, 1,
0.9130742, 0.03421752, 1.754742, 1, 1, 1, 1, 1,
0.9156449, -1.141175, 1.543683, 1, 1, 1, 1, 1,
0.9195873, 0.237941, 1.424542, 1, 1, 1, 1, 1,
0.9244254, 0.3443564, 2.952947, 1, 1, 1, 1, 1,
0.9301406, 0.5725486, 0.4987523, 1, 1, 1, 1, 1,
0.9312876, 1.193479, 1.261464, 1, 1, 1, 1, 1,
0.9405051, -0.8363711, 1.023728, 1, 1, 1, 1, 1,
0.9484035, -0.7617583, 1.796761, 0, 0, 1, 1, 1,
0.9514918, 0.1943664, 0.2344604, 1, 0, 0, 1, 1,
0.9531193, 1.328064, 1.140032, 1, 0, 0, 1, 1,
0.9539173, -2.253866, 3.504007, 1, 0, 0, 1, 1,
0.9685661, -0.02732854, 0.7440786, 1, 0, 0, 1, 1,
0.9730375, 1.716166, 0.3861895, 1, 0, 0, 1, 1,
0.9849011, -1.006839, 1.279734, 0, 0, 0, 1, 1,
0.987543, -0.240877, 1.727224, 0, 0, 0, 1, 1,
0.9888551, 0.206438, 1.800065, 0, 0, 0, 1, 1,
0.9915199, 0.3398096, 1.246636, 0, 0, 0, 1, 1,
0.9951248, 0.7809402, -0.3199225, 0, 0, 0, 1, 1,
1.003031, 0.489135, -0.2903219, 0, 0, 0, 1, 1,
1.003886, 1.685881, 1.615007, 0, 0, 0, 1, 1,
1.007661, 0.6362043, 0.9619201, 1, 1, 1, 1, 1,
1.009559, -0.5618502, 2.266385, 1, 1, 1, 1, 1,
1.012295, -0.141381, 1.61666, 1, 1, 1, 1, 1,
1.02961, -0.5553978, 3.504148, 1, 1, 1, 1, 1,
1.031864, 0.3500628, 0.2875034, 1, 1, 1, 1, 1,
1.03642, 0.7233989, -0.2887836, 1, 1, 1, 1, 1,
1.036634, 3.096103, 1.117322, 1, 1, 1, 1, 1,
1.041984, 0.2700989, 2.608158, 1, 1, 1, 1, 1,
1.042868, -1.459397, 3.466223, 1, 1, 1, 1, 1,
1.043579, 0.5358604, 1.125374, 1, 1, 1, 1, 1,
1.048088, 3.600361, -0.7432537, 1, 1, 1, 1, 1,
1.066115, -0.6494914, 2.171813, 1, 1, 1, 1, 1,
1.082849, -0.9810503, 2.151619, 1, 1, 1, 1, 1,
1.084608, 0.8301976, 1.749965, 1, 1, 1, 1, 1,
1.09052, -0.4197294, 1.628795, 1, 1, 1, 1, 1,
1.100374, 1.075621, -0.1914719, 0, 0, 1, 1, 1,
1.108145, -1.13314, 2.826575, 1, 0, 0, 1, 1,
1.109863, -0.6495828, 3.525841, 1, 0, 0, 1, 1,
1.117617, -0.1368878, 1.391312, 1, 0, 0, 1, 1,
1.118621, -0.2908169, 2.505517, 1, 0, 0, 1, 1,
1.118728, 1.304375, 0.5097832, 1, 0, 0, 1, 1,
1.120999, 2.010495, 0.7725911, 0, 0, 0, 1, 1,
1.122906, 0.2621331, 2.01531, 0, 0, 0, 1, 1,
1.126322, 0.5359526, -0.1391429, 0, 0, 0, 1, 1,
1.132253, 1.690204, -0.4253062, 0, 0, 0, 1, 1,
1.133042, -0.4829955, 1.048171, 0, 0, 0, 1, 1,
1.143508, -0.1851063, 1.794956, 0, 0, 0, 1, 1,
1.154343, -1.854276, 4.548135, 0, 0, 0, 1, 1,
1.156864, 0.7345947, 1.994559, 1, 1, 1, 1, 1,
1.157373, -1.607405, 4.35764, 1, 1, 1, 1, 1,
1.160548, -0.002578758, 3.00285, 1, 1, 1, 1, 1,
1.171902, -2.116194, 1.5971, 1, 1, 1, 1, 1,
1.172051, -0.6949539, 1.821181, 1, 1, 1, 1, 1,
1.172778, -0.01504917, 0.8230305, 1, 1, 1, 1, 1,
1.186216, -0.8387552, 1.413234, 1, 1, 1, 1, 1,
1.188052, 0.7784707, 1.709699, 1, 1, 1, 1, 1,
1.199026, 0.5815471, -0.4265105, 1, 1, 1, 1, 1,
1.19927, -0.09596299, 1.334343, 1, 1, 1, 1, 1,
1.200676, 1.80242, -0.1052149, 1, 1, 1, 1, 1,
1.214616, -0.004643872, 1.345704, 1, 1, 1, 1, 1,
1.217619, -0.1275121, 2.616024, 1, 1, 1, 1, 1,
1.22898, -0.3762195, 1.081765, 1, 1, 1, 1, 1,
1.23612, 2.166714, 2.094244, 1, 1, 1, 1, 1,
1.237492, -0.58139, 0.2118053, 0, 0, 1, 1, 1,
1.248546, 0.5659683, 1.018871, 1, 0, 0, 1, 1,
1.269907, -2.242174, 1.961877, 1, 0, 0, 1, 1,
1.270561, 0.7329447, 1.275792, 1, 0, 0, 1, 1,
1.271966, 0.7519018, 1.349797, 1, 0, 0, 1, 1,
1.279358, 0.6255369, 0.5561856, 1, 0, 0, 1, 1,
1.291113, 2.248165, -0.596466, 0, 0, 0, 1, 1,
1.292179, -0.6177449, 2.733734, 0, 0, 0, 1, 1,
1.293085, -2.813077, 1.280351, 0, 0, 0, 1, 1,
1.294531, 1.365154, 1.001445, 0, 0, 0, 1, 1,
1.32401, 0.4291443, 1.207968, 0, 0, 0, 1, 1,
1.327035, 1.556072, 2.496921, 0, 0, 0, 1, 1,
1.330888, -0.2351073, 2.074294, 0, 0, 0, 1, 1,
1.331341, -0.2222368, 2.784092, 1, 1, 1, 1, 1,
1.348899, -0.2140253, 0.2973007, 1, 1, 1, 1, 1,
1.366325, 0.6003803, 1.672082, 1, 1, 1, 1, 1,
1.36952, -1.234581, 2.36997, 1, 1, 1, 1, 1,
1.370219, -1.118782, 1.349662, 1, 1, 1, 1, 1,
1.371177, 1.033132, 3.084213, 1, 1, 1, 1, 1,
1.373455, -1.226206, 2.975895, 1, 1, 1, 1, 1,
1.375844, -0.1592854, 0.4833477, 1, 1, 1, 1, 1,
1.388531, 1.400199, 0.2100729, 1, 1, 1, 1, 1,
1.41239, -1.041317, 2.078418, 1, 1, 1, 1, 1,
1.418625, 0.1785988, 0.8786312, 1, 1, 1, 1, 1,
1.443108, -0.1408251, 1.129005, 1, 1, 1, 1, 1,
1.454548, -0.007458531, 2.257781, 1, 1, 1, 1, 1,
1.45746, -0.2114455, 2.780625, 1, 1, 1, 1, 1,
1.465294, 1.204744, 0.7016996, 1, 1, 1, 1, 1,
1.47832, 0.4242831, 2.955898, 0, 0, 1, 1, 1,
1.479096, -0.7851229, 1.826444, 1, 0, 0, 1, 1,
1.487816, -0.09815286, 2.455755, 1, 0, 0, 1, 1,
1.500067, -1.118341, 3.688633, 1, 0, 0, 1, 1,
1.524586, -0.1828562, 1.221071, 1, 0, 0, 1, 1,
1.527279, 1.903505, 0.2898465, 1, 0, 0, 1, 1,
1.527298, 0.4179502, 1.662529, 0, 0, 0, 1, 1,
1.536368, -0.565572, 2.68566, 0, 0, 0, 1, 1,
1.539667, 0.008656762, 1.303801, 0, 0, 0, 1, 1,
1.543795, 0.7509652, 2.449801, 0, 0, 0, 1, 1,
1.546483, 0.1911383, 0.8123288, 0, 0, 0, 1, 1,
1.551538, 1.871183, 0.2241024, 0, 0, 0, 1, 1,
1.559966, -0.8870454, 2.503468, 0, 0, 0, 1, 1,
1.561624, -1.313115, 1.390311, 1, 1, 1, 1, 1,
1.597909, -0.4762321, 1.382344, 1, 1, 1, 1, 1,
1.598007, -0.1333555, 2.043763, 1, 1, 1, 1, 1,
1.616163, 1.134437, 1.656436, 1, 1, 1, 1, 1,
1.618723, 2.711715, 0.7798245, 1, 1, 1, 1, 1,
1.629, -0.001936344, 0.7014366, 1, 1, 1, 1, 1,
1.64156, 0.2294839, 0.7743244, 1, 1, 1, 1, 1,
1.642406, -0.206681, 2.250218, 1, 1, 1, 1, 1,
1.646202, 0.9867401, 0.5961109, 1, 1, 1, 1, 1,
1.646236, 0.2192232, 1.867917, 1, 1, 1, 1, 1,
1.649947, -2.213697, 2.475487, 1, 1, 1, 1, 1,
1.65625, -0.7125068, 0.8755115, 1, 1, 1, 1, 1,
1.679612, 1.377463, 1.647381, 1, 1, 1, 1, 1,
1.683257, 1.003341, 0.5682747, 1, 1, 1, 1, 1,
1.695395, 1.311112, 2.384377, 1, 1, 1, 1, 1,
1.705757, 0.4516036, 0.25528, 0, 0, 1, 1, 1,
1.707691, -0.2485371, 2.870132, 1, 0, 0, 1, 1,
1.710582, 0.6603953, 2.896019, 1, 0, 0, 1, 1,
1.722961, -2.041909, 1.302141, 1, 0, 0, 1, 1,
1.782369, -0.04396181, 1.872215, 1, 0, 0, 1, 1,
1.79991, 0.2080476, 2.045367, 1, 0, 0, 1, 1,
1.834742, 0.1805243, 3.289479, 0, 0, 0, 1, 1,
1.851545, 0.3173345, 2.103343, 0, 0, 0, 1, 1,
1.887073, 0.6119808, 1.344447, 0, 0, 0, 1, 1,
1.903836, 0.7897184, 0.9414708, 0, 0, 0, 1, 1,
1.903929, -1.495672, 2.696122, 0, 0, 0, 1, 1,
1.90865, 2.209637, 1.108268, 0, 0, 0, 1, 1,
1.946441, -0.101657, 2.204341, 0, 0, 0, 1, 1,
1.979737, 0.9244195, 2.815955, 1, 1, 1, 1, 1,
1.996676, 1.424709, -0.8842397, 1, 1, 1, 1, 1,
2.018849, -1.851017, 0.849762, 1, 1, 1, 1, 1,
2.020151, 0.2503051, 3.367398, 1, 1, 1, 1, 1,
2.038989, 0.5340914, 1.599954, 1, 1, 1, 1, 1,
2.044002, -0.08390351, 2.422435, 1, 1, 1, 1, 1,
2.050741, 0.5239558, 2.316715, 1, 1, 1, 1, 1,
2.052032, -1.147769, 2.501413, 1, 1, 1, 1, 1,
2.080145, 0.6216034, 2.320647, 1, 1, 1, 1, 1,
2.081755, -0.4206506, 3.07503, 1, 1, 1, 1, 1,
2.082952, 0.1044005, 1.656905, 1, 1, 1, 1, 1,
2.101097, 0.6948506, 0.6990609, 1, 1, 1, 1, 1,
2.128582, 0.2479863, -0.4198017, 1, 1, 1, 1, 1,
2.148362, 0.4998773, 2.021591, 1, 1, 1, 1, 1,
2.17547, 0.3533158, 0.9192794, 1, 1, 1, 1, 1,
2.198981, -0.4960002, 0.8106229, 0, 0, 1, 1, 1,
2.201199, -1.070705, 2.174167, 1, 0, 0, 1, 1,
2.208904, -0.5658293, 2.956519, 1, 0, 0, 1, 1,
2.231888, -0.03022502, 2.888611, 1, 0, 0, 1, 1,
2.235456, 0.08485733, 1.124612, 1, 0, 0, 1, 1,
2.280677, -1.397883, 2.326079, 1, 0, 0, 1, 1,
2.298203, -1.720861, 2.039606, 0, 0, 0, 1, 1,
2.306604, -0.1692912, 2.607883, 0, 0, 0, 1, 1,
2.369352, 1.079807, 1.330047, 0, 0, 0, 1, 1,
2.406283, -1.223203, 3.078858, 0, 0, 0, 1, 1,
2.407251, -0.8395327, 3.251411, 0, 0, 0, 1, 1,
2.433263, -2.139151, 1.296719, 0, 0, 0, 1, 1,
2.481966, -0.5042593, 1.087293, 0, 0, 0, 1, 1,
2.490538, 0.7572461, 0.5435557, 1, 1, 1, 1, 1,
2.501113, 1.354043, 0.6558417, 1, 1, 1, 1, 1,
2.558777, 1.655202, 0.3333989, 1, 1, 1, 1, 1,
2.7239, 0.5066501, 0.9217351, 1, 1, 1, 1, 1,
2.782029, -1.425727, 3.544411, 1, 1, 1, 1, 1,
2.90745, -1.256476, 1.756416, 1, 1, 1, 1, 1,
2.9312, 0.08981093, 2.204964, 1, 1, 1, 1, 1
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
var radius = 9.832702;
var distance = 34.53695;
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
mvMatrix.translate( 0.234292, 0.131258, -0.03092432 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.53695);
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
