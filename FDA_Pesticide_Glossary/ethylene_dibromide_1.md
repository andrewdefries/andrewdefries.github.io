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
-3.308229, -1.003171, -1.867805, 1, 0, 0, 1,
-3.092164, 0.7888005, -2.249197, 1, 0.007843138, 0, 1,
-3.007156, -1.102176, -1.631788, 1, 0.01176471, 0, 1,
-3.005616, -2.508106, -0.7390617, 1, 0.01960784, 0, 1,
-2.964188, -0.7799147, -1.836619, 1, 0.02352941, 0, 1,
-2.592821, 0.1139855, -1.088802, 1, 0.03137255, 0, 1,
-2.392562, -1.067705, -1.006639, 1, 0.03529412, 0, 1,
-2.34206, 0.3159929, -1.500352, 1, 0.04313726, 0, 1,
-2.28471, -0.991177, -2.986521, 1, 0.04705882, 0, 1,
-2.268923, 0.3384109, 0.2958195, 1, 0.05490196, 0, 1,
-2.228881, -0.5249185, -3.940213, 1, 0.05882353, 0, 1,
-2.2211, -0.9852405, -2.711393, 1, 0.06666667, 0, 1,
-2.197556, -0.3239982, -2.454973, 1, 0.07058824, 0, 1,
-2.184065, 0.9765484, -1.054323, 1, 0.07843138, 0, 1,
-2.157453, 1.985042, -1.400563, 1, 0.08235294, 0, 1,
-2.154132, 0.05867779, -1.657352, 1, 0.09019608, 0, 1,
-2.152262, -0.4115479, -1.890948, 1, 0.09411765, 0, 1,
-2.148765, 0.9173341, -1.183485, 1, 0.1019608, 0, 1,
-2.138059, 1.123425, -1.947823, 1, 0.1098039, 0, 1,
-2.097975, 0.7909448, -0.5107366, 1, 0.1137255, 0, 1,
-2.096909, 1.811267, -0.09513945, 1, 0.1215686, 0, 1,
-2.087018, 0.9016467, -2.431586, 1, 0.1254902, 0, 1,
-2.069263, 0.6062771, -1.124731, 1, 0.1333333, 0, 1,
-2.05368, 0.6981336, 0.2098414, 1, 0.1372549, 0, 1,
-2.051011, -0.6499408, -1.920146, 1, 0.145098, 0, 1,
-2.040088, -0.4094392, -0.1600417, 1, 0.1490196, 0, 1,
-2.021787, 0.1595342, -1.094014, 1, 0.1568628, 0, 1,
-1.939486, 1.503608, -0.8097144, 1, 0.1607843, 0, 1,
-1.938024, 0.1933404, -1.748302, 1, 0.1686275, 0, 1,
-1.903609, 1.162004, -2.556967, 1, 0.172549, 0, 1,
-1.892401, -2.422762, -0.9390209, 1, 0.1803922, 0, 1,
-1.835292, 0.7118456, -0.1657606, 1, 0.1843137, 0, 1,
-1.818265, -0.6479717, -1.847449, 1, 0.1921569, 0, 1,
-1.781241, -0.5270723, -0.6040354, 1, 0.1960784, 0, 1,
-1.770115, 1.394581, -1.436623, 1, 0.2039216, 0, 1,
-1.753074, 2.0717, -1.312722, 1, 0.2117647, 0, 1,
-1.749925, -0.9548439, -3.500676, 1, 0.2156863, 0, 1,
-1.747628, -0.397064, -1.512035, 1, 0.2235294, 0, 1,
-1.734612, 0.859831, -1.397159, 1, 0.227451, 0, 1,
-1.707799, 0.1097237, -0.8035476, 1, 0.2352941, 0, 1,
-1.707669, 1.543104, 0.3262539, 1, 0.2392157, 0, 1,
-1.662065, 0.8106461, -0.8317565, 1, 0.2470588, 0, 1,
-1.656648, 0.4500788, -2.70615, 1, 0.2509804, 0, 1,
-1.652294, 0.7131373, -1.386123, 1, 0.2588235, 0, 1,
-1.648182, -0.8202239, -1.793923, 1, 0.2627451, 0, 1,
-1.615595, 0.06752732, -2.398632, 1, 0.2705882, 0, 1,
-1.607435, 1.444396, -1.009708, 1, 0.2745098, 0, 1,
-1.602495, 0.5212574, -0.8145711, 1, 0.282353, 0, 1,
-1.58252, -0.3848758, -0.7963474, 1, 0.2862745, 0, 1,
-1.550808, -1.362123, -2.589329, 1, 0.2941177, 0, 1,
-1.549163, -0.3672576, -1.182094, 1, 0.3019608, 0, 1,
-1.541282, -0.4089806, -2.966382, 1, 0.3058824, 0, 1,
-1.540129, 1.499957, -1.948649, 1, 0.3137255, 0, 1,
-1.52213, -0.7223825, 0.393821, 1, 0.3176471, 0, 1,
-1.518031, -0.9970175, -1.989218, 1, 0.3254902, 0, 1,
-1.514407, 0.2293941, -0.08308273, 1, 0.3294118, 0, 1,
-1.502083, 0.9762139, -2.077241, 1, 0.3372549, 0, 1,
-1.489252, -0.0311137, -0.570406, 1, 0.3411765, 0, 1,
-1.480007, -0.7113513, -2.859928, 1, 0.3490196, 0, 1,
-1.455446, -0.3511126, -1.400922, 1, 0.3529412, 0, 1,
-1.454258, 1.475407, -3.887873, 1, 0.3607843, 0, 1,
-1.452302, -1.28736, -2.354416, 1, 0.3647059, 0, 1,
-1.438418, -1.637433, -2.000679, 1, 0.372549, 0, 1,
-1.437559, -1.133835, -1.535421, 1, 0.3764706, 0, 1,
-1.426455, 0.9351012, -0.6474, 1, 0.3843137, 0, 1,
-1.42074, -1.060588, -1.495632, 1, 0.3882353, 0, 1,
-1.412957, 0.4297817, -2.808468, 1, 0.3960784, 0, 1,
-1.410044, 0.1267494, -0.2577129, 1, 0.4039216, 0, 1,
-1.404566, 1.041534, -0.3001959, 1, 0.4078431, 0, 1,
-1.399726, 1.056207, -1.440631, 1, 0.4156863, 0, 1,
-1.394256, 0.5307154, -0.8759341, 1, 0.4196078, 0, 1,
-1.389663, -0.7844805, -2.179701, 1, 0.427451, 0, 1,
-1.384282, 1.538373, -1.65081, 1, 0.4313726, 0, 1,
-1.384181, -0.9193999, -4.098565, 1, 0.4392157, 0, 1,
-1.383881, 0.9847107, 0.2655927, 1, 0.4431373, 0, 1,
-1.378448, -0.6247329, -1.974862, 1, 0.4509804, 0, 1,
-1.373339, 1.013203, -1.067231, 1, 0.454902, 0, 1,
-1.371811, -0.8761691, -1.918015, 1, 0.4627451, 0, 1,
-1.363875, 0.7983454, -0.3112108, 1, 0.4666667, 0, 1,
-1.355468, -0.5721191, -3.150641, 1, 0.4745098, 0, 1,
-1.352372, 0.5564465, 0.2569241, 1, 0.4784314, 0, 1,
-1.352024, 1.12684, -1.754987, 1, 0.4862745, 0, 1,
-1.34869, 0.873019, -2.073837, 1, 0.4901961, 0, 1,
-1.345169, 0.5406713, -0.2981117, 1, 0.4980392, 0, 1,
-1.338154, 1.304668, -1.323105, 1, 0.5058824, 0, 1,
-1.337491, 0.3335218, -1.134897, 1, 0.509804, 0, 1,
-1.322342, 0.7581371, -2.005878, 1, 0.5176471, 0, 1,
-1.317625, 0.2018748, -1.354799, 1, 0.5215687, 0, 1,
-1.313811, -0.9576087, 0.7792686, 1, 0.5294118, 0, 1,
-1.292509, -2.078147, -1.258797, 1, 0.5333334, 0, 1,
-1.291471, -0.2611427, -1.328289, 1, 0.5411765, 0, 1,
-1.290424, 0.9892725, -1.539558, 1, 0.5450981, 0, 1,
-1.278816, 1.14824, 0.5807003, 1, 0.5529412, 0, 1,
-1.269375, 0.1964383, -2.14557, 1, 0.5568628, 0, 1,
-1.256117, -0.3817786, -2.349844, 1, 0.5647059, 0, 1,
-1.251354, 0.0761295, -1.663189, 1, 0.5686275, 0, 1,
-1.25043, -0.1755358, -2.907514, 1, 0.5764706, 0, 1,
-1.244097, 0.2322929, 0.6050488, 1, 0.5803922, 0, 1,
-1.242798, -0.5103323, -1.005132, 1, 0.5882353, 0, 1,
-1.237359, -0.7201459, -2.911809, 1, 0.5921569, 0, 1,
-1.228755, -2.38361, -1.175742, 1, 0.6, 0, 1,
-1.227914, -0.2053011, -1.601119, 1, 0.6078432, 0, 1,
-1.222975, -0.07104584, -0.9334027, 1, 0.6117647, 0, 1,
-1.206384, -0.8677189, -1.11786, 1, 0.6196079, 0, 1,
-1.203893, 2.227798, 0.7744802, 1, 0.6235294, 0, 1,
-1.198275, 0.6558403, -1.07653, 1, 0.6313726, 0, 1,
-1.197594, 1.328913, -0.9040569, 1, 0.6352941, 0, 1,
-1.197577, -0.1642714, -2.682778, 1, 0.6431373, 0, 1,
-1.196424, -0.1183505, -2.448315, 1, 0.6470588, 0, 1,
-1.194486, -1.378964, -2.428407, 1, 0.654902, 0, 1,
-1.178009, -1.014752, -2.7069, 1, 0.6588235, 0, 1,
-1.171039, 0.007286771, -2.291035, 1, 0.6666667, 0, 1,
-1.166888, -2.713112, -2.891678, 1, 0.6705883, 0, 1,
-1.166475, 1.117274, -0.1272135, 1, 0.6784314, 0, 1,
-1.161115, 1.201183, 0.2143731, 1, 0.682353, 0, 1,
-1.154817, -0.1872755, -0.8845193, 1, 0.6901961, 0, 1,
-1.153144, -0.6374865, -2.056766, 1, 0.6941177, 0, 1,
-1.149325, -0.8447484, -1.152497, 1, 0.7019608, 0, 1,
-1.148437, 2.146465, -0.444607, 1, 0.7098039, 0, 1,
-1.145828, -1.268864, -1.142311, 1, 0.7137255, 0, 1,
-1.144496, -0.03936288, -1.905861, 1, 0.7215686, 0, 1,
-1.14269, -1.560674, -2.296183, 1, 0.7254902, 0, 1,
-1.136961, -0.3643133, -0.3726839, 1, 0.7333333, 0, 1,
-1.13566, -0.7912616, -2.015352, 1, 0.7372549, 0, 1,
-1.134108, -0.6465096, -2.229464, 1, 0.7450981, 0, 1,
-1.12392, 2.060787, -1.781639, 1, 0.7490196, 0, 1,
-1.113832, 0.5043413, -1.890804, 1, 0.7568628, 0, 1,
-1.11279, -1.233788, -0.8846494, 1, 0.7607843, 0, 1,
-1.108324, -0.2827562, -1.90268, 1, 0.7686275, 0, 1,
-1.101953, 0.09544244, -1.404483, 1, 0.772549, 0, 1,
-1.097748, -1.034066, -2.101473, 1, 0.7803922, 0, 1,
-1.094402, -0.7587621, -3.080537, 1, 0.7843137, 0, 1,
-1.086065, 0.8697879, 0.4289226, 1, 0.7921569, 0, 1,
-1.074279, 3.502145, 0.5472983, 1, 0.7960784, 0, 1,
-1.059391, 0.8269121, -0.721884, 1, 0.8039216, 0, 1,
-1.058683, 1.031087, -1.186843, 1, 0.8117647, 0, 1,
-1.057829, -0.7837833, -1.25251, 1, 0.8156863, 0, 1,
-1.055935, -2.31844, -1.179598, 1, 0.8235294, 0, 1,
-1.044291, 0.9037567, -0.2222296, 1, 0.827451, 0, 1,
-1.041205, 0.4280137, -1.800464, 1, 0.8352941, 0, 1,
-1.039375, -0.6474618, -0.1276826, 1, 0.8392157, 0, 1,
-1.03538, 0.4569381, -0.7685224, 1, 0.8470588, 0, 1,
-1.026926, 0.5949593, -0.1853868, 1, 0.8509804, 0, 1,
-1.023731, -1.522439, -0.6511431, 1, 0.8588235, 0, 1,
-1.022397, 0.1235008, -2.055287, 1, 0.8627451, 0, 1,
-1.022157, -0.2988733, -1.659661, 1, 0.8705882, 0, 1,
-1.020003, -0.7344582, -3.252021, 1, 0.8745098, 0, 1,
-1.018142, 0.8538263, -2.367855, 1, 0.8823529, 0, 1,
-1.016587, 2.013213, -1.400691, 1, 0.8862745, 0, 1,
-1.01643, 0.2478725, -0.9023092, 1, 0.8941177, 0, 1,
-1.007009, -0.830798, -1.90152, 1, 0.8980392, 0, 1,
-0.9937477, 0.891715, -0.03054444, 1, 0.9058824, 0, 1,
-0.9901673, -1.879778, -2.362452, 1, 0.9137255, 0, 1,
-0.9888822, 1.335165, -0.4595812, 1, 0.9176471, 0, 1,
-0.9799027, -1.033417, -0.7429812, 1, 0.9254902, 0, 1,
-0.9792737, -0.6875497, -1.470265, 1, 0.9294118, 0, 1,
-0.9738712, 1.539977, 0.5907533, 1, 0.9372549, 0, 1,
-0.9654375, 0.2339821, -1.093965, 1, 0.9411765, 0, 1,
-0.9585864, -0.7359782, -2.448814, 1, 0.9490196, 0, 1,
-0.9465807, 0.2644282, -1.659041, 1, 0.9529412, 0, 1,
-0.9429978, -0.007158985, -2.37228, 1, 0.9607843, 0, 1,
-0.9391738, -0.4913664, -2.859362, 1, 0.9647059, 0, 1,
-0.9384531, -0.3197638, -2.298431, 1, 0.972549, 0, 1,
-0.9380898, -0.9254548, -1.897669, 1, 0.9764706, 0, 1,
-0.9331746, 1.506525, -0.8220578, 1, 0.9843137, 0, 1,
-0.9316109, -0.8265023, -2.161826, 1, 0.9882353, 0, 1,
-0.9293743, -0.001303999, -2.094681, 1, 0.9960784, 0, 1,
-0.9266591, 0.3877417, -0.3215211, 0.9960784, 1, 0, 1,
-0.9252247, -1.56864, -4.045992, 0.9921569, 1, 0, 1,
-0.9218653, 2.924403, -0.9920543, 0.9843137, 1, 0, 1,
-0.921447, 1.116585, -1.477179, 0.9803922, 1, 0, 1,
-0.9165452, 1.078838, -0.313229, 0.972549, 1, 0, 1,
-0.9137694, 0.4443457, 0.7388006, 0.9686275, 1, 0, 1,
-0.9127502, -0.3269211, -0.5813884, 0.9607843, 1, 0, 1,
-0.9082931, 0.228541, -0.1707212, 0.9568627, 1, 0, 1,
-0.898334, -1.566858, -0.5102677, 0.9490196, 1, 0, 1,
-0.8915126, 0.5952652, 1.328217, 0.945098, 1, 0, 1,
-0.8851863, -1.545829, -2.428481, 0.9372549, 1, 0, 1,
-0.8843144, -0.9916168, -0.8428796, 0.9333333, 1, 0, 1,
-0.8838508, 0.439842, -1.577483, 0.9254902, 1, 0, 1,
-0.8786139, -0.4128785, -2.281618, 0.9215686, 1, 0, 1,
-0.8744524, -0.07848446, -1.335214, 0.9137255, 1, 0, 1,
-0.8643595, 0.7395617, -0.09575126, 0.9098039, 1, 0, 1,
-0.861344, 1.000815, -1.28594, 0.9019608, 1, 0, 1,
-0.859197, -0.9119388, -3.358671, 0.8941177, 1, 0, 1,
-0.8578048, 1.508819, -0.05328873, 0.8901961, 1, 0, 1,
-0.8486274, 1.541132, -0.424114, 0.8823529, 1, 0, 1,
-0.8474336, 1.438634, -1.627116, 0.8784314, 1, 0, 1,
-0.8434379, -1.270699, -1.351812, 0.8705882, 1, 0, 1,
-0.8408135, -0.4948668, -1.423989, 0.8666667, 1, 0, 1,
-0.8404952, -0.6106841, -4.12824, 0.8588235, 1, 0, 1,
-0.8380013, -0.02477298, -0.5082751, 0.854902, 1, 0, 1,
-0.837934, 0.5294403, -2.053117, 0.8470588, 1, 0, 1,
-0.8373777, 0.9777215, -0.3468875, 0.8431373, 1, 0, 1,
-0.836969, -1.488304, -2.022376, 0.8352941, 1, 0, 1,
-0.8361641, 1.35073, 1.223655, 0.8313726, 1, 0, 1,
-0.8311212, 1.142457, -0.5333906, 0.8235294, 1, 0, 1,
-0.8307455, -0.01578399, -0.7374018, 0.8196079, 1, 0, 1,
-0.8216189, 1.769179, -1.041849, 0.8117647, 1, 0, 1,
-0.8123246, -0.8848598, -2.582834, 0.8078431, 1, 0, 1,
-0.8112656, 0.8798208, -1.05218, 0.8, 1, 0, 1,
-0.8094344, -0.7289919, -2.892918, 0.7921569, 1, 0, 1,
-0.807585, 1.735969, 0.8314843, 0.7882353, 1, 0, 1,
-0.8050242, -0.9229404, -3.058553, 0.7803922, 1, 0, 1,
-0.7972268, 0.3095196, -2.085002, 0.7764706, 1, 0, 1,
-0.7873773, -0.9987558, -1.127249, 0.7686275, 1, 0, 1,
-0.7841471, 0.7593096, -1.714261, 0.7647059, 1, 0, 1,
-0.7804531, -1.661241, -2.174722, 0.7568628, 1, 0, 1,
-0.7732972, 1.063266, -0.6202735, 0.7529412, 1, 0, 1,
-0.7712756, 0.8001427, 0.6655315, 0.7450981, 1, 0, 1,
-0.7708674, 0.3099975, -1.599385, 0.7411765, 1, 0, 1,
-0.7704904, -2.142701, -2.531995, 0.7333333, 1, 0, 1,
-0.7698227, 1.10916, 0.7694349, 0.7294118, 1, 0, 1,
-0.7649068, -1.12103, -3.099139, 0.7215686, 1, 0, 1,
-0.7612541, -1.503366, -3.14576, 0.7176471, 1, 0, 1,
-0.7593359, -0.6082637, -0.6058871, 0.7098039, 1, 0, 1,
-0.7563336, 0.5120687, -0.9336764, 0.7058824, 1, 0, 1,
-0.7527205, -1.583314, -3.111206, 0.6980392, 1, 0, 1,
-0.7498317, 1.023738, -1.232363, 0.6901961, 1, 0, 1,
-0.7495993, 0.4199689, -2.0211, 0.6862745, 1, 0, 1,
-0.7489391, -0.8837301, -2.506151, 0.6784314, 1, 0, 1,
-0.7433942, -0.7436962, -2.161735, 0.6745098, 1, 0, 1,
-0.7433645, 0.9679536, -1.422662, 0.6666667, 1, 0, 1,
-0.7407159, 1.437228, -0.7230644, 0.6627451, 1, 0, 1,
-0.7399099, 0.6940491, -0.9425289, 0.654902, 1, 0, 1,
-0.7392869, 0.289445, -0.9218829, 0.6509804, 1, 0, 1,
-0.7390441, -0.7805406, -1.656296, 0.6431373, 1, 0, 1,
-0.7305732, -2.227051, -2.788983, 0.6392157, 1, 0, 1,
-0.7281132, -0.5865626, -1.167439, 0.6313726, 1, 0, 1,
-0.7251703, -1.687876, -0.6289394, 0.627451, 1, 0, 1,
-0.7239756, 0.6800777, -0.1383316, 0.6196079, 1, 0, 1,
-0.7187886, -0.02011958, -2.234807, 0.6156863, 1, 0, 1,
-0.716324, 0.8784229, -0.1806796, 0.6078432, 1, 0, 1,
-0.7157168, -0.03765861, -1.206383, 0.6039216, 1, 0, 1,
-0.7121902, 1.395886, 0.152336, 0.5960785, 1, 0, 1,
-0.7078232, 0.7422498, -2.31846, 0.5882353, 1, 0, 1,
-0.705808, 1.14717, -2.118589, 0.5843138, 1, 0, 1,
-0.7056825, 0.7667673, -0.2454533, 0.5764706, 1, 0, 1,
-0.7055085, 2.235117, -0.5265601, 0.572549, 1, 0, 1,
-0.7034568, 0.5325664, -2.893818, 0.5647059, 1, 0, 1,
-0.7031817, -1.111548, -3.106491, 0.5607843, 1, 0, 1,
-0.7020915, -0.3664674, -3.410551, 0.5529412, 1, 0, 1,
-0.7015002, 1.402886, -1.193701, 0.5490196, 1, 0, 1,
-0.6974282, 1.419136, -2.335429, 0.5411765, 1, 0, 1,
-0.6863772, -0.5950916, -1.37985, 0.5372549, 1, 0, 1,
-0.6853413, 0.5465252, -0.1778821, 0.5294118, 1, 0, 1,
-0.6832005, -0.5049476, -2.863573, 0.5254902, 1, 0, 1,
-0.6782193, -0.4518079, -3.266829, 0.5176471, 1, 0, 1,
-0.6780586, -0.530921, -2.929262, 0.5137255, 1, 0, 1,
-0.6728548, 1.483115, 1.162228, 0.5058824, 1, 0, 1,
-0.6711842, 0.03886712, -2.064442, 0.5019608, 1, 0, 1,
-0.6694418, -0.1524619, -3.558751, 0.4941176, 1, 0, 1,
-0.6667832, -1.207681, -2.614895, 0.4862745, 1, 0, 1,
-0.6603625, 0.1799209, -0.395348, 0.4823529, 1, 0, 1,
-0.6583318, 0.997673, -0.9131058, 0.4745098, 1, 0, 1,
-0.6578967, 0.2252466, -1.739866, 0.4705882, 1, 0, 1,
-0.6483592, 0.2753467, -1.18003, 0.4627451, 1, 0, 1,
-0.6447381, 0.3125172, -1.916771, 0.4588235, 1, 0, 1,
-0.6409915, 0.5937918, -1.490772, 0.4509804, 1, 0, 1,
-0.6344794, -0.5027336, -1.132626, 0.4470588, 1, 0, 1,
-0.6317244, 1.531333, -0.06195638, 0.4392157, 1, 0, 1,
-0.6250322, -1.0835, -1.379533, 0.4352941, 1, 0, 1,
-0.6247188, -0.2355652, -2.625363, 0.427451, 1, 0, 1,
-0.6205121, -0.7537543, -2.35715, 0.4235294, 1, 0, 1,
-0.6136485, 1.232523, -0.8105223, 0.4156863, 1, 0, 1,
-0.6116451, 0.1166878, -2.46193, 0.4117647, 1, 0, 1,
-0.6104135, -1.000203, -2.900249, 0.4039216, 1, 0, 1,
-0.609629, 0.8579004, -2.734713, 0.3960784, 1, 0, 1,
-0.6088282, -0.3787983, -1.375003, 0.3921569, 1, 0, 1,
-0.6009373, 0.2311581, -0.4351805, 0.3843137, 1, 0, 1,
-0.6007187, 1.306538, -0.02152557, 0.3803922, 1, 0, 1,
-0.5974107, 0.8396193, -1.098421, 0.372549, 1, 0, 1,
-0.5877715, -1.42722, -4.321744, 0.3686275, 1, 0, 1,
-0.5860698, -0.5142862, -1.249734, 0.3607843, 1, 0, 1,
-0.5847197, -0.2511683, -3.636636, 0.3568628, 1, 0, 1,
-0.5839695, 0.1544953, -1.613009, 0.3490196, 1, 0, 1,
-0.5829065, -0.003969625, -0.1923237, 0.345098, 1, 0, 1,
-0.5826578, 0.588818, 0.566525, 0.3372549, 1, 0, 1,
-0.5809602, 0.137211, -0.3489093, 0.3333333, 1, 0, 1,
-0.5776267, -0.1264864, -1.239819, 0.3254902, 1, 0, 1,
-0.5766432, 0.5992993, -0.3980135, 0.3215686, 1, 0, 1,
-0.5738786, -1.452212, -2.684385, 0.3137255, 1, 0, 1,
-0.5660562, 1.111561, -0.8410459, 0.3098039, 1, 0, 1,
-0.5642664, 0.895875, -0.2190118, 0.3019608, 1, 0, 1,
-0.5599905, -0.1843805, -2.136734, 0.2941177, 1, 0, 1,
-0.5592692, -0.1521481, -2.18915, 0.2901961, 1, 0, 1,
-0.5584981, 1.44503, 0.2387383, 0.282353, 1, 0, 1,
-0.5559915, -1.119883, -2.114959, 0.2784314, 1, 0, 1,
-0.5542102, 1.941762, -2.523269, 0.2705882, 1, 0, 1,
-0.5449159, -1.360499, -2.804145, 0.2666667, 1, 0, 1,
-0.5371896, 0.4981045, -1.873347, 0.2588235, 1, 0, 1,
-0.5335138, -0.3824281, -0.3298025, 0.254902, 1, 0, 1,
-0.5332922, 1.557785, -2.115017, 0.2470588, 1, 0, 1,
-0.5315391, -0.1240679, -1.973257, 0.2431373, 1, 0, 1,
-0.5295148, 0.192483, -0.1614039, 0.2352941, 1, 0, 1,
-0.5292972, -1.201646, -1.74057, 0.2313726, 1, 0, 1,
-0.5291276, -0.1928958, -2.1019, 0.2235294, 1, 0, 1,
-0.5285621, 1.591692, -1.508339, 0.2196078, 1, 0, 1,
-0.5278606, -2.11395, -1.750763, 0.2117647, 1, 0, 1,
-0.5252731, -1.24263, -1.77809, 0.2078431, 1, 0, 1,
-0.521898, -0.2839303, -1.154274, 0.2, 1, 0, 1,
-0.5168568, 2.430784, 0.5039159, 0.1921569, 1, 0, 1,
-0.5157744, -2.04693, -3.117244, 0.1882353, 1, 0, 1,
-0.5121604, 0.1518144, -0.5156431, 0.1803922, 1, 0, 1,
-0.5083655, -0.168548, -0.5447843, 0.1764706, 1, 0, 1,
-0.5065954, -0.9206164, -3.690344, 0.1686275, 1, 0, 1,
-0.5016594, 1.712217, 0.8439582, 0.1647059, 1, 0, 1,
-0.5004806, -1.281592, -2.316823, 0.1568628, 1, 0, 1,
-0.4996461, 1.382978, -1.157904, 0.1529412, 1, 0, 1,
-0.4992065, 0.2629927, -1.428677, 0.145098, 1, 0, 1,
-0.497211, 0.6271439, -0.7223151, 0.1411765, 1, 0, 1,
-0.4972006, 0.6199329, -1.930357, 0.1333333, 1, 0, 1,
-0.496358, -1.564336, -1.680801, 0.1294118, 1, 0, 1,
-0.4902474, 0.6067045, 0.2929877, 0.1215686, 1, 0, 1,
-0.4878885, 0.8251429, -1.101745, 0.1176471, 1, 0, 1,
-0.4867203, 0.7019879, -0.09557693, 0.1098039, 1, 0, 1,
-0.4852127, 0.2839122, -1.732542, 0.1058824, 1, 0, 1,
-0.4834923, 0.764432, -1.009952, 0.09803922, 1, 0, 1,
-0.4829222, 0.2829507, -0.2531055, 0.09019608, 1, 0, 1,
-0.4789419, -1.224262, -2.927453, 0.08627451, 1, 0, 1,
-0.4774579, -1.244296, -2.95754, 0.07843138, 1, 0, 1,
-0.4731348, -1.199311, -2.773283, 0.07450981, 1, 0, 1,
-0.4720971, -1.879536, -4.090863, 0.06666667, 1, 0, 1,
-0.4708087, 0.3296602, -1.172205, 0.0627451, 1, 0, 1,
-0.4686226, 0.1805415, -2.017697, 0.05490196, 1, 0, 1,
-0.4672257, 0.09852617, -0.6480253, 0.05098039, 1, 0, 1,
-0.4655269, -1.052936, -4.039123, 0.04313726, 1, 0, 1,
-0.4652241, 0.3816023, -0.7814582, 0.03921569, 1, 0, 1,
-0.4632846, -0.2387179, -0.5839279, 0.03137255, 1, 0, 1,
-0.4603666, -1.683453, -3.465005, 0.02745098, 1, 0, 1,
-0.4594143, -0.08909651, -1.546784, 0.01960784, 1, 0, 1,
-0.4569336, -1.090743, -0.313162, 0.01568628, 1, 0, 1,
-0.454375, 1.722856, -1.167622, 0.007843138, 1, 0, 1,
-0.4523257, 1.476579, 2.259675, 0.003921569, 1, 0, 1,
-0.4480119, 0.09965348, 0.2708717, 0, 1, 0.003921569, 1,
-0.4467157, -1.311342, -4.132352, 0, 1, 0.01176471, 1,
-0.4422186, -0.926839, -2.173287, 0, 1, 0.01568628, 1,
-0.4372126, -0.1407378, -3.237179, 0, 1, 0.02352941, 1,
-0.4358635, 0.6773573, 0.1999148, 0, 1, 0.02745098, 1,
-0.4351858, 0.8955948, 0.01391247, 0, 1, 0.03529412, 1,
-0.4344216, -0.3902439, -0.4825449, 0, 1, 0.03921569, 1,
-0.4233443, -0.2985299, -2.056268, 0, 1, 0.04705882, 1,
-0.4177657, 1.774214, 0.7306898, 0, 1, 0.05098039, 1,
-0.4165812, -0.09381168, -1.862646, 0, 1, 0.05882353, 1,
-0.4130104, -0.5400133, -2.673293, 0, 1, 0.0627451, 1,
-0.4128748, 2.129134, 0.9070656, 0, 1, 0.07058824, 1,
-0.4124746, 0.5858368, 0.3977974, 0, 1, 0.07450981, 1,
-0.407744, -1.075704, -2.559152, 0, 1, 0.08235294, 1,
-0.4058044, 0.4173641, -1.753632, 0, 1, 0.08627451, 1,
-0.4045686, -0.3917134, -1.335174, 0, 1, 0.09411765, 1,
-0.4021572, 0.6002488, -1.068645, 0, 1, 0.1019608, 1,
-0.3917734, -0.01478245, -1.942403, 0, 1, 0.1058824, 1,
-0.3894034, -1.152613, -2.143649, 0, 1, 0.1137255, 1,
-0.3886982, 0.1978638, -0.7426561, 0, 1, 0.1176471, 1,
-0.3852129, -1.005291, -5.05513, 0, 1, 0.1254902, 1,
-0.3820215, 0.06891245, -1.107017, 0, 1, 0.1294118, 1,
-0.3813447, 1.037667, 1.643753, 0, 1, 0.1372549, 1,
-0.3792083, 0.3517162, -1.232053, 0, 1, 0.1411765, 1,
-0.3785321, 0.9270033, -1.676869, 0, 1, 0.1490196, 1,
-0.3770887, -0.1551777, -1.50727, 0, 1, 0.1529412, 1,
-0.3723086, -0.87509, -2.396622, 0, 1, 0.1607843, 1,
-0.3690457, -0.8314711, -3.396865, 0, 1, 0.1647059, 1,
-0.3649779, -0.3074658, -1.54263, 0, 1, 0.172549, 1,
-0.3620981, 1.506693, -1.452365, 0, 1, 0.1764706, 1,
-0.3586676, 1.258281, 0.875989, 0, 1, 0.1843137, 1,
-0.3575402, -1.652741, -3.056778, 0, 1, 0.1882353, 1,
-0.3540866, 1.514513, -0.4205724, 0, 1, 0.1960784, 1,
-0.3464205, 0.3660337, -0.9038285, 0, 1, 0.2039216, 1,
-0.3455642, 0.9534204, -1.504074, 0, 1, 0.2078431, 1,
-0.3444977, -0.1148925, -3.236321, 0, 1, 0.2156863, 1,
-0.3443772, 1.040833, -0.5128549, 0, 1, 0.2196078, 1,
-0.3391722, -0.7536627, -1.831698, 0, 1, 0.227451, 1,
-0.3359737, 0.04658961, -0.8944898, 0, 1, 0.2313726, 1,
-0.3348354, -1.118965, -3.180615, 0, 1, 0.2392157, 1,
-0.3332371, -3.342238, -3.929016, 0, 1, 0.2431373, 1,
-0.3323508, 1.519003, 0.675321, 0, 1, 0.2509804, 1,
-0.3303664, -1.185209, -1.937218, 0, 1, 0.254902, 1,
-0.3302514, -2.471043, -4.344575, 0, 1, 0.2627451, 1,
-0.3301652, 0.3504424, -1.908488, 0, 1, 0.2666667, 1,
-0.3260854, 0.5645495, -2.215763, 0, 1, 0.2745098, 1,
-0.3252589, 0.6959801, -1.730882, 0, 1, 0.2784314, 1,
-0.3234911, -2.15472, -2.818537, 0, 1, 0.2862745, 1,
-0.3216683, 1.194078, -1.934721, 0, 1, 0.2901961, 1,
-0.3215848, -0.001763708, -1.578727, 0, 1, 0.2980392, 1,
-0.3199634, -1.125135, -3.023533, 0, 1, 0.3058824, 1,
-0.3161869, 1.219477, -1.126635, 0, 1, 0.3098039, 1,
-0.3159025, 1.832775, 2.076241, 0, 1, 0.3176471, 1,
-0.3151915, 1.731203, 0.5505711, 0, 1, 0.3215686, 1,
-0.3139414, -0.5786839, -2.076516, 0, 1, 0.3294118, 1,
-0.3131073, 0.459841, -2.295917, 0, 1, 0.3333333, 1,
-0.3120473, -0.4376512, -2.537508, 0, 1, 0.3411765, 1,
-0.3105593, 0.3010609, -1.121194, 0, 1, 0.345098, 1,
-0.3096474, -0.3509244, -2.735586, 0, 1, 0.3529412, 1,
-0.3095189, -0.8969525, -5.349109, 0, 1, 0.3568628, 1,
-0.3073559, 0.01503494, -1.115385, 0, 1, 0.3647059, 1,
-0.3053288, -0.4226028, -2.287604, 0, 1, 0.3686275, 1,
-0.3037958, 0.9537367, 0.6767448, 0, 1, 0.3764706, 1,
-0.3028904, 1.243028, -1.018546, 0, 1, 0.3803922, 1,
-0.3000618, 0.5574969, 0.3908912, 0, 1, 0.3882353, 1,
-0.2994691, 0.1036094, -0.9606068, 0, 1, 0.3921569, 1,
-0.2964396, 0.2499821, -2.316462, 0, 1, 0.4, 1,
-0.2919062, 0.8033469, 1.485005, 0, 1, 0.4078431, 1,
-0.2899129, 0.5310785, -0.7777768, 0, 1, 0.4117647, 1,
-0.2893851, 1.004018, -0.007475947, 0, 1, 0.4196078, 1,
-0.2854776, -0.4443724, -1.463443, 0, 1, 0.4235294, 1,
-0.285166, -0.1894, -2.915435, 0, 1, 0.4313726, 1,
-0.2807387, -0.4547994, -0.9835523, 0, 1, 0.4352941, 1,
-0.2770318, 0.4321507, 2.140203, 0, 1, 0.4431373, 1,
-0.2745499, -1.279938, -2.034262, 0, 1, 0.4470588, 1,
-0.2721748, 0.5751834, 0.3055446, 0, 1, 0.454902, 1,
-0.2695169, 0.9900338, -1.276847, 0, 1, 0.4588235, 1,
-0.2662868, -0.3014622, -2.558876, 0, 1, 0.4666667, 1,
-0.265914, -1.222033, -3.498095, 0, 1, 0.4705882, 1,
-0.264883, -0.29535, -2.767293, 0, 1, 0.4784314, 1,
-0.2645268, 0.9897962, 0.7037042, 0, 1, 0.4823529, 1,
-0.2645155, 0.59104, -1.394867, 0, 1, 0.4901961, 1,
-0.2613361, 0.5523075, 1.533349, 0, 1, 0.4941176, 1,
-0.2581803, -1.237484, -3.413628, 0, 1, 0.5019608, 1,
-0.2515486, -0.2698006, -2.188995, 0, 1, 0.509804, 1,
-0.250285, -0.6547673, -4.373831, 0, 1, 0.5137255, 1,
-0.249299, -1.756738, -2.605875, 0, 1, 0.5215687, 1,
-0.2457651, -0.6769096, -3.485961, 0, 1, 0.5254902, 1,
-0.2452691, 1.015352, 0.5211657, 0, 1, 0.5333334, 1,
-0.239461, -0.4125184, -0.8406926, 0, 1, 0.5372549, 1,
-0.2381202, 0.9059979, 0.1860599, 0, 1, 0.5450981, 1,
-0.2375519, 0.3058667, -1.112777, 0, 1, 0.5490196, 1,
-0.2367026, -1.169187, -3.437249, 0, 1, 0.5568628, 1,
-0.2358783, -1.036924, -4.19002, 0, 1, 0.5607843, 1,
-0.2354848, -1.446651, -3.449934, 0, 1, 0.5686275, 1,
-0.2329786, -0.6893356, -2.175397, 0, 1, 0.572549, 1,
-0.2319765, 0.9130986, -1.611124, 0, 1, 0.5803922, 1,
-0.231549, -1.257496, -1.687819, 0, 1, 0.5843138, 1,
-0.2297177, -1.432766, -1.507508, 0, 1, 0.5921569, 1,
-0.2273663, -0.1192969, -2.293517, 0, 1, 0.5960785, 1,
-0.2219204, -0.6620765, -1.378383, 0, 1, 0.6039216, 1,
-0.2211462, -0.8882303, -4.370411, 0, 1, 0.6117647, 1,
-0.2201805, 0.4106178, -0.04745118, 0, 1, 0.6156863, 1,
-0.219405, 2.048625, -1.764843, 0, 1, 0.6235294, 1,
-0.2180952, 0.8192383, 0.7844549, 0, 1, 0.627451, 1,
-0.2180553, -0.52066, -4.129545, 0, 1, 0.6352941, 1,
-0.214935, -0.3299784, -3.061439, 0, 1, 0.6392157, 1,
-0.212315, -0.270207, -3.046798, 0, 1, 0.6470588, 1,
-0.2097143, -0.4365394, -1.699669, 0, 1, 0.6509804, 1,
-0.2095149, 0.4985913, 2.148629, 0, 1, 0.6588235, 1,
-0.2056463, 0.5951635, -0.1575122, 0, 1, 0.6627451, 1,
-0.2052765, 0.1013999, -0.473454, 0, 1, 0.6705883, 1,
-0.2036332, 0.5081171, -0.6021632, 0, 1, 0.6745098, 1,
-0.2028761, -0.8369142, -2.819344, 0, 1, 0.682353, 1,
-0.2012877, 0.7533903, -0.06888905, 0, 1, 0.6862745, 1,
-0.1985269, 2.244343, -1.266303, 0, 1, 0.6941177, 1,
-0.197459, 1.213328, -0.2819751, 0, 1, 0.7019608, 1,
-0.1963277, 1.007171, 0.1366892, 0, 1, 0.7058824, 1,
-0.192201, 0.3622277, -0.05510465, 0, 1, 0.7137255, 1,
-0.1920624, -0.3359892, -1.752908, 0, 1, 0.7176471, 1,
-0.1870313, -1.899556, -3.6139, 0, 1, 0.7254902, 1,
-0.183902, 1.044329, 1.793918, 0, 1, 0.7294118, 1,
-0.1827606, 0.314678, -2.265271, 0, 1, 0.7372549, 1,
-0.1743796, -0.5693174, -3.198113, 0, 1, 0.7411765, 1,
-0.1726096, -1.250121, -3.214715, 0, 1, 0.7490196, 1,
-0.1722206, 0.2349648, 1.089395, 0, 1, 0.7529412, 1,
-0.1709824, 0.6544822, -0.06054989, 0, 1, 0.7607843, 1,
-0.1702088, -0.7105967, -3.760979, 0, 1, 0.7647059, 1,
-0.1680817, 1.164802, -0.3897769, 0, 1, 0.772549, 1,
-0.1626715, -0.8199423, -2.824715, 0, 1, 0.7764706, 1,
-0.1624119, -0.1184093, -3.15302, 0, 1, 0.7843137, 1,
-0.1608307, -1.420834, -2.544704, 0, 1, 0.7882353, 1,
-0.1587484, 0.8940049, -0.5659435, 0, 1, 0.7960784, 1,
-0.1570352, -0.9168186, -3.919089, 0, 1, 0.8039216, 1,
-0.1539792, -0.9151603, -4.573387, 0, 1, 0.8078431, 1,
-0.1485254, -0.7076969, -2.877798, 0, 1, 0.8156863, 1,
-0.146719, 0.264698, 0.254484, 0, 1, 0.8196079, 1,
-0.1452907, 0.2536376, -0.4389199, 0, 1, 0.827451, 1,
-0.1413053, -0.4721979, -2.847978, 0, 1, 0.8313726, 1,
-0.1411535, -0.7005056, -2.656451, 0, 1, 0.8392157, 1,
-0.140902, 0.8752649, -0.3040951, 0, 1, 0.8431373, 1,
-0.1382336, -0.09937503, -0.9786167, 0, 1, 0.8509804, 1,
-0.1381855, -0.6950501, -1.878941, 0, 1, 0.854902, 1,
-0.1331821, 0.7413474, -1.09781, 0, 1, 0.8627451, 1,
-0.1306402, 0.3127559, -2.413401, 0, 1, 0.8666667, 1,
-0.130536, -0.3967366, -2.8235, 0, 1, 0.8745098, 1,
-0.1296, -1.41901, -1.555669, 0, 1, 0.8784314, 1,
-0.1280062, -0.6002775, -2.66102, 0, 1, 0.8862745, 1,
-0.1165081, 1.112366, -0.8600046, 0, 1, 0.8901961, 1,
-0.1131221, 0.4329922, 0.6233289, 0, 1, 0.8980392, 1,
-0.1124351, 0.176442, -0.9953939, 0, 1, 0.9058824, 1,
-0.1068702, 0.000906299, -1.812626, 0, 1, 0.9098039, 1,
-0.1038143, -1.974312, -2.947406, 0, 1, 0.9176471, 1,
-0.1037002, 0.4083879, 0.3684757, 0, 1, 0.9215686, 1,
-0.09359215, 0.176498, -0.9331803, 0, 1, 0.9294118, 1,
-0.09259668, -0.2465555, -2.054982, 0, 1, 0.9333333, 1,
-0.08912672, -1.082142, -3.469918, 0, 1, 0.9411765, 1,
-0.08854009, -0.4546622, -3.007911, 0, 1, 0.945098, 1,
-0.0862736, -2.144536, -5.237177, 0, 1, 0.9529412, 1,
-0.08026896, 0.3456608, 0.3672066, 0, 1, 0.9568627, 1,
-0.07916298, 0.3705513, 0.9179702, 0, 1, 0.9647059, 1,
-0.07472885, -0.5988731, -0.9770718, 0, 1, 0.9686275, 1,
-0.07156366, -0.5666588, -3.207419, 0, 1, 0.9764706, 1,
-0.06569462, 1.177496, 1.155913, 0, 1, 0.9803922, 1,
-0.06416749, -1.741699, -3.843123, 0, 1, 0.9882353, 1,
-0.06357027, 0.937278, -0.5185134, 0, 1, 0.9921569, 1,
-0.06261309, 0.5874776, -1.644194, 0, 1, 1, 1,
-0.05960932, 1.686796, -0.8192688, 0, 0.9921569, 1, 1,
-0.05246352, 2.492427, -0.04674999, 0, 0.9882353, 1, 1,
-0.05200266, -0.3307992, -3.006469, 0, 0.9803922, 1, 1,
-0.05186063, -1.114448, -2.744221, 0, 0.9764706, 1, 1,
-0.04803908, -2.226116, -1.367877, 0, 0.9686275, 1, 1,
-0.04429974, 0.7002788, 1.559236, 0, 0.9647059, 1, 1,
-0.04239174, 0.7253014, 0.9497582, 0, 0.9568627, 1, 1,
-0.04033592, 2.937895, 2.181738, 0, 0.9529412, 1, 1,
-0.03530115, -1.362561, -3.749233, 0, 0.945098, 1, 1,
-0.03484995, 0.8887442, -1.299614, 0, 0.9411765, 1, 1,
-0.03434917, 0.2709509, -0.5383984, 0, 0.9333333, 1, 1,
-0.03401753, -0.1988764, -2.218906, 0, 0.9294118, 1, 1,
-0.03184921, 0.2096186, 0.2156633, 0, 0.9215686, 1, 1,
-0.03153424, 0.223964, 0.9023163, 0, 0.9176471, 1, 1,
-0.03004518, -0.5413209, -1.576355, 0, 0.9098039, 1, 1,
-0.02878744, -0.01267401, -2.79117, 0, 0.9058824, 1, 1,
-0.02740429, 1.152135, 0.4256611, 0, 0.8980392, 1, 1,
-0.02645631, 0.308895, -1.54239, 0, 0.8901961, 1, 1,
-0.02413771, -0.7218361, -1.911141, 0, 0.8862745, 1, 1,
-0.02220908, 0.07488982, -0.7050108, 0, 0.8784314, 1, 1,
-0.0213452, -2.349814, -2.064093, 0, 0.8745098, 1, 1,
-0.01957313, -0.03392595, -3.544028, 0, 0.8666667, 1, 1,
-0.01831881, -0.149676, -2.579359, 0, 0.8627451, 1, 1,
-0.01797393, 0.4067941, 0.5258328, 0, 0.854902, 1, 1,
-0.01465414, 0.7282993, 0.2656606, 0, 0.8509804, 1, 1,
-0.01396376, 0.6844289, 0.0660018, 0, 0.8431373, 1, 1,
-0.01346573, -0.3690934, -1.094008, 0, 0.8392157, 1, 1,
-0.0116826, -1.821405, -3.519558, 0, 0.8313726, 1, 1,
-0.007034887, 0.04168904, -0.1968405, 0, 0.827451, 1, 1,
-0.005986372, -0.071029, -3.483359, 0, 0.8196079, 1, 1,
-0.00426232, -1.544634, -1.810817, 0, 0.8156863, 1, 1,
-0.003883515, -1.024629, -1.856771, 0, 0.8078431, 1, 1,
-0.002947986, -0.7276187, -3.995303, 0, 0.8039216, 1, 1,
0.01055768, -0.4524857, 2.550248, 0, 0.7960784, 1, 1,
0.01283465, 0.5924093, 0.1411473, 0, 0.7882353, 1, 1,
0.01336389, 1.486397, 0.008084535, 0, 0.7843137, 1, 1,
0.01784194, 0.8341616, 0.4579336, 0, 0.7764706, 1, 1,
0.01829394, 2.419675, -1.46891, 0, 0.772549, 1, 1,
0.02825081, -0.5696819, 3.362589, 0, 0.7647059, 1, 1,
0.02888106, 1.609976, -0.8682012, 0, 0.7607843, 1, 1,
0.0358054, -0.3068545, 1.96844, 0, 0.7529412, 1, 1,
0.0452521, -0.6994893, 4.527206, 0, 0.7490196, 1, 1,
0.04648905, -0.3155234, 3.351645, 0, 0.7411765, 1, 1,
0.05041321, 0.05611849, -0.7444468, 0, 0.7372549, 1, 1,
0.05303252, 0.253649, 0.799252, 0, 0.7294118, 1, 1,
0.0540845, 0.5951324, -0.3107061, 0, 0.7254902, 1, 1,
0.05682859, -0.8991965, 2.38822, 0, 0.7176471, 1, 1,
0.05718, -2.009136, 3.791364, 0, 0.7137255, 1, 1,
0.05873426, -0.3041629, 2.441423, 0, 0.7058824, 1, 1,
0.05956184, -1.420453, 2.568603, 0, 0.6980392, 1, 1,
0.06243097, -0.1150607, 3.525648, 0, 0.6941177, 1, 1,
0.07371822, -0.6210091, 4.182784, 0, 0.6862745, 1, 1,
0.07447986, -0.5073063, 2.145731, 0, 0.682353, 1, 1,
0.07494172, 0.2890239, -1.866904, 0, 0.6745098, 1, 1,
0.07744091, -0.9028707, 3.299782, 0, 0.6705883, 1, 1,
0.07942986, 0.02375758, 0.7706091, 0, 0.6627451, 1, 1,
0.08006941, 1.265632, 0.7379348, 0, 0.6588235, 1, 1,
0.08109126, -0.4213163, 1.560475, 0, 0.6509804, 1, 1,
0.08649438, 0.998181, 1.964769, 0, 0.6470588, 1, 1,
0.08655377, 0.6684524, 0.09453844, 0, 0.6392157, 1, 1,
0.08863806, -0.07593609, 2.454614, 0, 0.6352941, 1, 1,
0.09298773, -0.7875773, 2.791723, 0, 0.627451, 1, 1,
0.09329069, 0.1069435, -0.7048449, 0, 0.6235294, 1, 1,
0.09601784, 0.4134693, -0.4934804, 0, 0.6156863, 1, 1,
0.1032866, -0.6985062, 3.459964, 0, 0.6117647, 1, 1,
0.1040689, 2.136965, 0.130347, 0, 0.6039216, 1, 1,
0.1051779, -1.214547, 3.504019, 0, 0.5960785, 1, 1,
0.1119338, -0.3071831, 2.788096, 0, 0.5921569, 1, 1,
0.1132242, 1.852868, 0.1993387, 0, 0.5843138, 1, 1,
0.1143463, 0.1327049, 0.1262643, 0, 0.5803922, 1, 1,
0.1151597, -0.6683402, 1.569227, 0, 0.572549, 1, 1,
0.1188467, 0.5819011, -0.2496221, 0, 0.5686275, 1, 1,
0.1225146, -2.348946, 3.652149, 0, 0.5607843, 1, 1,
0.1271813, -1.732715, 1.589392, 0, 0.5568628, 1, 1,
0.1334804, 1.74292, -2.001602, 0, 0.5490196, 1, 1,
0.1415091, -1.035365, 2.679138, 0, 0.5450981, 1, 1,
0.1419794, 0.522317, 0.2020475, 0, 0.5372549, 1, 1,
0.1428111, -0.2977339, 2.53149, 0, 0.5333334, 1, 1,
0.1456707, -0.5495694, 2.221662, 0, 0.5254902, 1, 1,
0.1522251, 0.5671224, -0.1659174, 0, 0.5215687, 1, 1,
0.158966, 0.4542859, 0.5491157, 0, 0.5137255, 1, 1,
0.1673663, -0.3851455, 1.425621, 0, 0.509804, 1, 1,
0.1681174, 0.4161355, 1.090974, 0, 0.5019608, 1, 1,
0.1685812, -0.06690887, 2.479809, 0, 0.4941176, 1, 1,
0.1709267, 0.543276, 0.04876062, 0, 0.4901961, 1, 1,
0.173316, 1.855137, 0.3765853, 0, 0.4823529, 1, 1,
0.1751113, 0.2874096, 0.7501638, 0, 0.4784314, 1, 1,
0.1825058, -1.947136, 1.696542, 0, 0.4705882, 1, 1,
0.1850274, 2.024058, 1.010754, 0, 0.4666667, 1, 1,
0.1875369, -0.04569281, 2.752989, 0, 0.4588235, 1, 1,
0.1909222, 0.4500783, -1.310058, 0, 0.454902, 1, 1,
0.1922534, -0.6323242, 4.055316, 0, 0.4470588, 1, 1,
0.1926448, 0.3391124, -0.5494066, 0, 0.4431373, 1, 1,
0.1948387, 0.1874712, 1.058552, 0, 0.4352941, 1, 1,
0.1981968, 1.39286, -0.2205362, 0, 0.4313726, 1, 1,
0.199374, -0.832566, 1.353626, 0, 0.4235294, 1, 1,
0.1994933, -1.159097, 4.2684, 0, 0.4196078, 1, 1,
0.2010608, 1.729521, 1.613763, 0, 0.4117647, 1, 1,
0.2015998, 0.04377373, 1.295013, 0, 0.4078431, 1, 1,
0.2034303, 0.883325, -0.08922296, 0, 0.4, 1, 1,
0.2095863, 0.9950424, 0.0338847, 0, 0.3921569, 1, 1,
0.2116277, -1.610184, 2.277013, 0, 0.3882353, 1, 1,
0.2122889, -0.6121259, 2.317662, 0, 0.3803922, 1, 1,
0.2146179, 0.1623221, 1.255627, 0, 0.3764706, 1, 1,
0.2174328, 0.7186318, 0.8669436, 0, 0.3686275, 1, 1,
0.217435, 1.488035, 2.218569, 0, 0.3647059, 1, 1,
0.2221727, -0.007096574, -0.1304072, 0, 0.3568628, 1, 1,
0.2293369, -0.196711, 2.286973, 0, 0.3529412, 1, 1,
0.2304541, 1.374586, 1.120263, 0, 0.345098, 1, 1,
0.2374349, 0.3606378, -0.7591533, 0, 0.3411765, 1, 1,
0.2395074, -0.6929032, 3.096532, 0, 0.3333333, 1, 1,
0.2404246, 1.602707, 1.626985, 0, 0.3294118, 1, 1,
0.2439813, 0.9117866, 0.3839966, 0, 0.3215686, 1, 1,
0.244748, 0.8733346, 0.4926161, 0, 0.3176471, 1, 1,
0.2456024, -0.8837138, 2.589916, 0, 0.3098039, 1, 1,
0.2458084, -1.026883, 3.630275, 0, 0.3058824, 1, 1,
0.2466184, 1.023448, -1.058395, 0, 0.2980392, 1, 1,
0.2526708, 1.019227, -0.3092549, 0, 0.2901961, 1, 1,
0.254999, 0.2796947, -0.7591745, 0, 0.2862745, 1, 1,
0.255209, 1.219677, 0.08437926, 0, 0.2784314, 1, 1,
0.259865, 0.4299952, -2.490693, 0, 0.2745098, 1, 1,
0.2659008, -1.49273, 4.293389, 0, 0.2666667, 1, 1,
0.2663511, -0.2072999, 3.686932, 0, 0.2627451, 1, 1,
0.2686214, -1.015666, 2.422378, 0, 0.254902, 1, 1,
0.2703408, 0.8741403, -0.3419887, 0, 0.2509804, 1, 1,
0.2705166, 1.077272, 0.5153239, 0, 0.2431373, 1, 1,
0.2724196, -1.309824, 4.730888, 0, 0.2392157, 1, 1,
0.2786923, 2.085061, -1.66704, 0, 0.2313726, 1, 1,
0.2788642, 0.5344145, 1.119078, 0, 0.227451, 1, 1,
0.283153, -0.7793428, 4.351961, 0, 0.2196078, 1, 1,
0.2848497, -0.9529871, 1.485313, 0, 0.2156863, 1, 1,
0.2868351, -0.2063447, 3.091965, 0, 0.2078431, 1, 1,
0.2878541, 0.6043495, 0.4919927, 0, 0.2039216, 1, 1,
0.2898783, -1.167935, 2.81796, 0, 0.1960784, 1, 1,
0.290214, 0.7544123, 0.05404267, 0, 0.1882353, 1, 1,
0.2911476, -1.028137, 2.21476, 0, 0.1843137, 1, 1,
0.2930618, -0.3389593, 3.103677, 0, 0.1764706, 1, 1,
0.2931753, -0.05760441, 2.626877, 0, 0.172549, 1, 1,
0.301861, 0.03415787, 1.138306, 0, 0.1647059, 1, 1,
0.3109638, 1.224875, -0.8512769, 0, 0.1607843, 1, 1,
0.3141194, -0.673201, 1.433487, 0, 0.1529412, 1, 1,
0.3157032, 0.01575224, 3.32749, 0, 0.1490196, 1, 1,
0.3183996, 0.2702073, -0.7677104, 0, 0.1411765, 1, 1,
0.3240378, -0.3010826, 2.987838, 0, 0.1372549, 1, 1,
0.3287822, -0.6714968, 5.19496, 0, 0.1294118, 1, 1,
0.3318985, -0.4982626, 1.446552, 0, 0.1254902, 1, 1,
0.3423271, 0.3043894, -0.5683064, 0, 0.1176471, 1, 1,
0.3437582, -0.830913, 4.83111, 0, 0.1137255, 1, 1,
0.3460582, 1.000648, 1.609433, 0, 0.1058824, 1, 1,
0.3473208, -1.393085, 2.640112, 0, 0.09803922, 1, 1,
0.356348, -1.01608, 0.04335855, 0, 0.09411765, 1, 1,
0.3573278, -0.4730708, 2.460625, 0, 0.08627451, 1, 1,
0.3589304, -0.1254807, 2.709743, 0, 0.08235294, 1, 1,
0.3638086, -1.965466, 4.000307, 0, 0.07450981, 1, 1,
0.3648625, 0.1792611, 0.614621, 0, 0.07058824, 1, 1,
0.3667104, -0.4818982, 2.682354, 0, 0.0627451, 1, 1,
0.3688695, -1.981811, 1.609958, 0, 0.05882353, 1, 1,
0.3701738, -3.170458, 3.94474, 0, 0.05098039, 1, 1,
0.3751811, -0.2886512, 1.944705, 0, 0.04705882, 1, 1,
0.3764643, -0.3586188, 2.189864, 0, 0.03921569, 1, 1,
0.3993661, 0.3189968, -0.297953, 0, 0.03529412, 1, 1,
0.3997146, -0.04758727, 1.632692, 0, 0.02745098, 1, 1,
0.4046424, -1.393814, 3.821255, 0, 0.02352941, 1, 1,
0.4092137, 0.1435268, 1.723937, 0, 0.01568628, 1, 1,
0.4109831, 2.234771, 0.2710696, 0, 0.01176471, 1, 1,
0.4123238, 0.2438253, 0.3772356, 0, 0.003921569, 1, 1,
0.4150981, 0.02110801, 2.342918, 0.003921569, 0, 1, 1,
0.4151668, -1.342166, 1.576665, 0.007843138, 0, 1, 1,
0.4221126, 1.016324, 1.325062, 0.01568628, 0, 1, 1,
0.422448, -0.781643, 4.075035, 0.01960784, 0, 1, 1,
0.4271758, 0.9559262, 1.033833, 0.02745098, 0, 1, 1,
0.4383099, -0.3143978, 2.862296, 0.03137255, 0, 1, 1,
0.4386813, -1.099678, 2.597436, 0.03921569, 0, 1, 1,
0.4404087, 0.4990124, 2.284609, 0.04313726, 0, 1, 1,
0.4404827, 0.05054173, 0.3425357, 0.05098039, 0, 1, 1,
0.4537809, -1.277478, 1.71481, 0.05490196, 0, 1, 1,
0.4540519, -1.687284, 1.390262, 0.0627451, 0, 1, 1,
0.4594233, 0.7707586, 1.106458, 0.06666667, 0, 1, 1,
0.463725, -0.305921, 2.227136, 0.07450981, 0, 1, 1,
0.4697488, -0.542742, 1.810653, 0.07843138, 0, 1, 1,
0.4706043, 1.182058, -0.5124465, 0.08627451, 0, 1, 1,
0.4710021, -0.6874977, 5.5185, 0.09019608, 0, 1, 1,
0.4740787, -1.210831, 3.174298, 0.09803922, 0, 1, 1,
0.4830279, 1.225462, -0.4213832, 0.1058824, 0, 1, 1,
0.4854672, -0.7674058, 3.10976, 0.1098039, 0, 1, 1,
0.4878705, 0.1655237, 1.603758, 0.1176471, 0, 1, 1,
0.4886807, -0.914807, 1.501988, 0.1215686, 0, 1, 1,
0.4888776, -2.380033, 2.685642, 0.1294118, 0, 1, 1,
0.4973632, 2.444982, 0.3648224, 0.1333333, 0, 1, 1,
0.5050898, -0.03454399, 0.5869707, 0.1411765, 0, 1, 1,
0.5110388, 0.1189642, 1.988582, 0.145098, 0, 1, 1,
0.5131274, 0.9372801, 0.7577831, 0.1529412, 0, 1, 1,
0.5155605, 1.4095, -0.8748813, 0.1568628, 0, 1, 1,
0.515747, -1.553389, 1.982969, 0.1647059, 0, 1, 1,
0.5181946, -0.4443012, 2.603338, 0.1686275, 0, 1, 1,
0.5193345, -0.5049418, 4.361855, 0.1764706, 0, 1, 1,
0.5194713, 1.107622, -1.351168, 0.1803922, 0, 1, 1,
0.5203866, 0.9142821, 1.037652, 0.1882353, 0, 1, 1,
0.5212659, -1.157949, 4.878333, 0.1921569, 0, 1, 1,
0.5282781, 0.0373152, 1.120458, 0.2, 0, 1, 1,
0.5303151, 0.6506276, -0.1596787, 0.2078431, 0, 1, 1,
0.5362203, 0.6058904, 2.400814, 0.2117647, 0, 1, 1,
0.5369364, -0.517677, 2.536183, 0.2196078, 0, 1, 1,
0.5468968, 1.03493, -0.6045318, 0.2235294, 0, 1, 1,
0.5485941, 1.291137, -0.06446413, 0.2313726, 0, 1, 1,
0.5497894, 0.4181318, 2.183585, 0.2352941, 0, 1, 1,
0.5532803, -0.2209183, 3.444828, 0.2431373, 0, 1, 1,
0.5573654, 1.470009, 0.5694136, 0.2470588, 0, 1, 1,
0.5593796, -2.507609, 3.172199, 0.254902, 0, 1, 1,
0.5606292, 0.28567, 2.071329, 0.2588235, 0, 1, 1,
0.5612883, 1.039163, -0.1649902, 0.2666667, 0, 1, 1,
0.5639538, 1.161255, -0.6181964, 0.2705882, 0, 1, 1,
0.5650231, 0.02861822, 1.346189, 0.2784314, 0, 1, 1,
0.5651978, 0.1052946, 0.8763569, 0.282353, 0, 1, 1,
0.5672383, -1.584387, 4.627716, 0.2901961, 0, 1, 1,
0.5677954, -0.8537465, 4.531177, 0.2941177, 0, 1, 1,
0.5741817, 0.5103313, 1.109421, 0.3019608, 0, 1, 1,
0.581177, -0.5399066, 2.345384, 0.3098039, 0, 1, 1,
0.5833142, -0.708746, 1.591744, 0.3137255, 0, 1, 1,
0.5850126, 1.275131, 0.00959321, 0.3215686, 0, 1, 1,
0.5860822, 0.07222126, 1.729183, 0.3254902, 0, 1, 1,
0.5961682, 0.1529215, 0.001225011, 0.3333333, 0, 1, 1,
0.5965307, -1.652689, 3.694536, 0.3372549, 0, 1, 1,
0.5981687, 1.345692, 1.391562, 0.345098, 0, 1, 1,
0.6051641, 0.2003325, 0.5283978, 0.3490196, 0, 1, 1,
0.6052884, 0.5516103, 0.0738302, 0.3568628, 0, 1, 1,
0.6087905, 0.6488978, 2.177692, 0.3607843, 0, 1, 1,
0.6120467, 0.2369605, 2.240749, 0.3686275, 0, 1, 1,
0.6185823, 1.281994, 0.1646833, 0.372549, 0, 1, 1,
0.6199119, 0.08487266, 0.3087172, 0.3803922, 0, 1, 1,
0.6210728, -0.2043251, 1.98003, 0.3843137, 0, 1, 1,
0.622485, 0.3062049, 1.072338, 0.3921569, 0, 1, 1,
0.631223, 0.3673164, 1.380199, 0.3960784, 0, 1, 1,
0.6329266, -0.8910217, 3.470522, 0.4039216, 0, 1, 1,
0.6334201, -2.229041, 2.927731, 0.4117647, 0, 1, 1,
0.6344544, 0.5308266, 0.5775052, 0.4156863, 0, 1, 1,
0.6394534, 0.2924711, -0.1253699, 0.4235294, 0, 1, 1,
0.6394958, 2.055036, 1.352743, 0.427451, 0, 1, 1,
0.6445474, -1.657349, 2.832802, 0.4352941, 0, 1, 1,
0.6515667, -1.180608, 2.354211, 0.4392157, 0, 1, 1,
0.6537741, -0.3937656, 2.579445, 0.4470588, 0, 1, 1,
0.6539353, -1.428166, 4.191103, 0.4509804, 0, 1, 1,
0.6634929, -0.6068625, 1.34317, 0.4588235, 0, 1, 1,
0.6654902, -0.8554105, 2.724319, 0.4627451, 0, 1, 1,
0.6658652, 1.989874, 0.3369783, 0.4705882, 0, 1, 1,
0.6663709, 1.425512, 1.451212, 0.4745098, 0, 1, 1,
0.6665457, -0.941764, 0.7649491, 0.4823529, 0, 1, 1,
0.6686708, 0.1779687, -0.1503812, 0.4862745, 0, 1, 1,
0.6813712, -1.707065, 1.331358, 0.4941176, 0, 1, 1,
0.6892695, 0.3525831, 0.6362736, 0.5019608, 0, 1, 1,
0.6932572, 0.8372152, 1.058813, 0.5058824, 0, 1, 1,
0.6982708, -1.506711, 2.038669, 0.5137255, 0, 1, 1,
0.7007728, -0.6517426, 2.422713, 0.5176471, 0, 1, 1,
0.7052354, -0.1914277, 0.6837416, 0.5254902, 0, 1, 1,
0.705784, -0.0006461534, 2.437689, 0.5294118, 0, 1, 1,
0.7088892, 1.434781, 0.5191155, 0.5372549, 0, 1, 1,
0.7100244, 0.8397636, 2.374747, 0.5411765, 0, 1, 1,
0.710301, 0.3596876, 1.031179, 0.5490196, 0, 1, 1,
0.7145389, 1.555061, 0.2284169, 0.5529412, 0, 1, 1,
0.7174857, 0.1856479, 0.02572272, 0.5607843, 0, 1, 1,
0.7206715, 1.732345, 0.09179422, 0.5647059, 0, 1, 1,
0.723245, -0.4459448, 2.737746, 0.572549, 0, 1, 1,
0.7235407, -0.5142979, 1.711641, 0.5764706, 0, 1, 1,
0.7288206, -0.5269932, 2.823384, 0.5843138, 0, 1, 1,
0.7291369, -1.506151, 2.963332, 0.5882353, 0, 1, 1,
0.7351503, 0.5901321, 1.841612, 0.5960785, 0, 1, 1,
0.7365019, 2.699033, -0.6365563, 0.6039216, 0, 1, 1,
0.737509, -1.252537, 2.293906, 0.6078432, 0, 1, 1,
0.7385677, 0.2869662, 1.796669, 0.6156863, 0, 1, 1,
0.7394369, 0.2348003, 0.4328729, 0.6196079, 0, 1, 1,
0.7406366, 0.3787171, 1.823471, 0.627451, 0, 1, 1,
0.7408351, -0.1867592, 2.053402, 0.6313726, 0, 1, 1,
0.7432272, 0.7253087, -1.15733, 0.6392157, 0, 1, 1,
0.7467546, -1.393119, 3.451953, 0.6431373, 0, 1, 1,
0.7654608, -0.09711002, 2.787263, 0.6509804, 0, 1, 1,
0.7662462, -1.156763, 2.943842, 0.654902, 0, 1, 1,
0.7663265, -0.4237514, 0.2346847, 0.6627451, 0, 1, 1,
0.7663976, 0.3431194, 0.206148, 0.6666667, 0, 1, 1,
0.7688729, 0.1413127, 1.762308, 0.6745098, 0, 1, 1,
0.7708335, 1.177722, 2.091475, 0.6784314, 0, 1, 1,
0.7714356, -0.5258279, 4.07215, 0.6862745, 0, 1, 1,
0.7763925, -0.712755, 1.90051, 0.6901961, 0, 1, 1,
0.7810624, -0.4008386, 3.763862, 0.6980392, 0, 1, 1,
0.7850168, 0.2812544, 1.851482, 0.7058824, 0, 1, 1,
0.7904576, 1.297256, 1.566733, 0.7098039, 0, 1, 1,
0.7939056, 0.9868522, -1.154693, 0.7176471, 0, 1, 1,
0.8034039, 0.02835375, 3.281819, 0.7215686, 0, 1, 1,
0.8155127, -0.3840259, 2.702353, 0.7294118, 0, 1, 1,
0.8212413, 0.3113732, 1.819372, 0.7333333, 0, 1, 1,
0.8237963, 0.01836708, 0.9192857, 0.7411765, 0, 1, 1,
0.8255504, 0.2744901, 0.9443084, 0.7450981, 0, 1, 1,
0.8276978, 1.344304, -0.2241256, 0.7529412, 0, 1, 1,
0.8277112, -0.09158964, 1.616462, 0.7568628, 0, 1, 1,
0.8304786, 0.102795, 1.305157, 0.7647059, 0, 1, 1,
0.8363261, 0.2382387, 1.925532, 0.7686275, 0, 1, 1,
0.8414295, -0.1180901, -0.1309876, 0.7764706, 0, 1, 1,
0.8437845, 1.74351, 0.7295464, 0.7803922, 0, 1, 1,
0.8441135, -0.4233375, 2.15666, 0.7882353, 0, 1, 1,
0.8465278, -0.3808343, 2.953904, 0.7921569, 0, 1, 1,
0.8486955, 1.061527, 0.1301177, 0.8, 0, 1, 1,
0.8537896, 0.74441, -0.8357942, 0.8078431, 0, 1, 1,
0.8598649, 0.7552994, 1.815568, 0.8117647, 0, 1, 1,
0.8606585, -0.1122094, 1.587077, 0.8196079, 0, 1, 1,
0.8627632, -0.5827273, 2.527684, 0.8235294, 0, 1, 1,
0.8633716, -0.7203051, 1.702454, 0.8313726, 0, 1, 1,
0.8639635, 1.117158, -0.5273172, 0.8352941, 0, 1, 1,
0.8640078, -0.7809942, 1.528404, 0.8431373, 0, 1, 1,
0.8682609, 0.5793319, -0.8446941, 0.8470588, 0, 1, 1,
0.872246, 0.5614524, 0.8439385, 0.854902, 0, 1, 1,
0.8758546, 1.692878, -0.01719298, 0.8588235, 0, 1, 1,
0.8774152, 0.8001698, 2.361716, 0.8666667, 0, 1, 1,
0.8813823, -1.062353, 0.504913, 0.8705882, 0, 1, 1,
0.8893837, 0.5260311, 0.9729146, 0.8784314, 0, 1, 1,
0.8898309, 1.132422, 1.088814, 0.8823529, 0, 1, 1,
0.8974697, -0.4189784, 2.520088, 0.8901961, 0, 1, 1,
0.9003041, -0.2153829, 1.217839, 0.8941177, 0, 1, 1,
0.904919, 1.008503, 0.6032484, 0.9019608, 0, 1, 1,
0.9060267, 0.0411517, 0.5391471, 0.9098039, 0, 1, 1,
0.9064206, 1.755223, 1.40362, 0.9137255, 0, 1, 1,
0.9070796, 0.8459479, -0.1293, 0.9215686, 0, 1, 1,
0.9087453, -0.2513151, 1.696316, 0.9254902, 0, 1, 1,
0.9129145, -0.4717789, 1.056082, 0.9333333, 0, 1, 1,
0.9178053, -1.205681, 2.173828, 0.9372549, 0, 1, 1,
0.9222611, 0.6930681, 0.8556655, 0.945098, 0, 1, 1,
0.9255609, -1.191481, 3.647542, 0.9490196, 0, 1, 1,
0.9291582, -0.4569829, 1.815106, 0.9568627, 0, 1, 1,
0.9308856, -0.1152848, 2.408426, 0.9607843, 0, 1, 1,
0.9331509, -1.343964, 2.891882, 0.9686275, 0, 1, 1,
0.9342312, 0.6496742, 1.18336, 0.972549, 0, 1, 1,
0.9406286, -1.199589, 1.147904, 0.9803922, 0, 1, 1,
0.9454263, 1.158215, 1.911337, 0.9843137, 0, 1, 1,
0.9471081, 0.3154631, -0.2603128, 0.9921569, 0, 1, 1,
0.9502191, -0.2265086, 2.451683, 0.9960784, 0, 1, 1,
0.953046, -0.4822084, 0.6907152, 1, 0, 0.9960784, 1,
0.9544241, 1.354896, 1.976534, 1, 0, 0.9882353, 1,
0.9544498, 0.9873438, 2.157134, 1, 0, 0.9843137, 1,
0.9566298, 0.4949848, 0.2423201, 1, 0, 0.9764706, 1,
0.9573916, 0.097201, 3.083381, 1, 0, 0.972549, 1,
0.9576099, 0.8253815, -0.2520773, 1, 0, 0.9647059, 1,
0.9652369, 0.8142806, 0.282822, 1, 0, 0.9607843, 1,
0.9753547, 1.669477, -0.07275827, 1, 0, 0.9529412, 1,
0.9774577, 0.5045015, -0.2776277, 1, 0, 0.9490196, 1,
0.9865987, 1.101711, 0.6901572, 1, 0, 0.9411765, 1,
0.9886436, 0.3452821, 1.687212, 1, 0, 0.9372549, 1,
0.9970164, -0.6707515, 1.622812, 1, 0, 0.9294118, 1,
0.998688, 0.1059715, 0.6800703, 1, 0, 0.9254902, 1,
0.9987598, 0.3253942, 1.650573, 1, 0, 0.9176471, 1,
1.004095, 0.02463908, 0.9474197, 1, 0, 0.9137255, 1,
1.020577, 2.693366, -0.776511, 1, 0, 0.9058824, 1,
1.020671, 2.178041, -0.0457935, 1, 0, 0.9019608, 1,
1.031246, -0.343695, 1.944614, 1, 0, 0.8941177, 1,
1.032076, -0.7974191, 4.267037, 1, 0, 0.8862745, 1,
1.03233, -0.5905671, 0.6657779, 1, 0, 0.8823529, 1,
1.039241, -1.743661, 2.120909, 1, 0, 0.8745098, 1,
1.046661, -0.9516614, 2.050923, 1, 0, 0.8705882, 1,
1.049239, -2.013051, 2.853475, 1, 0, 0.8627451, 1,
1.053924, -2.49517, 2.164378, 1, 0, 0.8588235, 1,
1.059352, 0.1505282, 1.745178, 1, 0, 0.8509804, 1,
1.063873, -0.4800908, 0.5563685, 1, 0, 0.8470588, 1,
1.068198, 0.1517111, 0.8320022, 1, 0, 0.8392157, 1,
1.074919, 1.296537, 0.6138493, 1, 0, 0.8352941, 1,
1.076791, -2.330738, 3.724695, 1, 0, 0.827451, 1,
1.083638, -0.01707922, 2.089307, 1, 0, 0.8235294, 1,
1.085793, -1.488264, 1.554253, 1, 0, 0.8156863, 1,
1.092786, -0.09976704, 1.128267, 1, 0, 0.8117647, 1,
1.092932, 0.1635876, 0.8988897, 1, 0, 0.8039216, 1,
1.095062, 0.6837423, 0.9984145, 1, 0, 0.7960784, 1,
1.101948, -0.1103449, -0.1177024, 1, 0, 0.7921569, 1,
1.106271, -1.408178, 1.941747, 1, 0, 0.7843137, 1,
1.117456, 0.6566303, 1.054962, 1, 0, 0.7803922, 1,
1.118649, -0.3582601, 1.357819, 1, 0, 0.772549, 1,
1.119389, 0.1637569, 3.008994, 1, 0, 0.7686275, 1,
1.119603, -1.411158, 1.601009, 1, 0, 0.7607843, 1,
1.121421, 0.7273059, 1.70353, 1, 0, 0.7568628, 1,
1.128944, -0.2932587, 1.895374, 1, 0, 0.7490196, 1,
1.138341, -0.3959149, 3.847953, 1, 0, 0.7450981, 1,
1.151245, 0.8522693, -0.172624, 1, 0, 0.7372549, 1,
1.154544, -0.7537109, 3.656719, 1, 0, 0.7333333, 1,
1.162203, 0.2725818, 0.7785505, 1, 0, 0.7254902, 1,
1.167013, 0.8855741, 1.399517, 1, 0, 0.7215686, 1,
1.170879, -0.7736837, 2.86917, 1, 0, 0.7137255, 1,
1.175648, 0.01056836, 2.166189, 1, 0, 0.7098039, 1,
1.177048, -0.007607298, -0.2948157, 1, 0, 0.7019608, 1,
1.178081, -2.548395, 4.624958, 1, 0, 0.6941177, 1,
1.185882, -0.1947911, 1.499648, 1, 0, 0.6901961, 1,
1.18636, -0.1391483, 0.1602516, 1, 0, 0.682353, 1,
1.186421, -0.3282725, 3.844424, 1, 0, 0.6784314, 1,
1.198673, 0.5694385, 1.608185, 1, 0, 0.6705883, 1,
1.225353, -0.08196877, 1.680028, 1, 0, 0.6666667, 1,
1.225397, 0.7421607, 1.982366, 1, 0, 0.6588235, 1,
1.257207, 0.6151842, 2.889454, 1, 0, 0.654902, 1,
1.259073, -2.095305, 1.657092, 1, 0, 0.6470588, 1,
1.2606, -0.6303688, 1.000656, 1, 0, 0.6431373, 1,
1.289411, 0.1200333, 1.284568, 1, 0, 0.6352941, 1,
1.304315, -0.647405, 1.547255, 1, 0, 0.6313726, 1,
1.319631, -0.2944517, 2.742747, 1, 0, 0.6235294, 1,
1.321967, 1.301167, 0.8089652, 1, 0, 0.6196079, 1,
1.323447, 1.232131, 0.4479674, 1, 0, 0.6117647, 1,
1.331422, -0.772499, 3.062567, 1, 0, 0.6078432, 1,
1.33328, 0.986232, 0.1069657, 1, 0, 0.6, 1,
1.336265, -0.1236028, 3.298896, 1, 0, 0.5921569, 1,
1.336917, 0.8189108, 0.4558688, 1, 0, 0.5882353, 1,
1.33915, -1.023778, 2.502502, 1, 0, 0.5803922, 1,
1.343793, 0.2214409, 1.766037, 1, 0, 0.5764706, 1,
1.348984, 0.803884, 2.355699, 1, 0, 0.5686275, 1,
1.350685, -0.5024325, 1.611265, 1, 0, 0.5647059, 1,
1.357687, -1.162885, 2.115548, 1, 0, 0.5568628, 1,
1.358278, -1.272581, 1.079932, 1, 0, 0.5529412, 1,
1.35991, 1.161165, 0.1101442, 1, 0, 0.5450981, 1,
1.364678, 0.05789983, 1.833348, 1, 0, 0.5411765, 1,
1.382073, -0.02324139, 2.21282, 1, 0, 0.5333334, 1,
1.396028, 0.4878016, 0.6891389, 1, 0, 0.5294118, 1,
1.40037, -1.733755, 2.118403, 1, 0, 0.5215687, 1,
1.403729, 1.110769, 0.4955696, 1, 0, 0.5176471, 1,
1.406058, -1.80417, 2.698238, 1, 0, 0.509804, 1,
1.408404, 1.328769, 1.25924, 1, 0, 0.5058824, 1,
1.415108, 0.4827635, 2.018357, 1, 0, 0.4980392, 1,
1.418339, 0.081976, 2.901244, 1, 0, 0.4901961, 1,
1.426778, 0.2390565, 1.916843, 1, 0, 0.4862745, 1,
1.427116, 0.4469814, 1.98293, 1, 0, 0.4784314, 1,
1.431361, 0.7069846, 1.880036, 1, 0, 0.4745098, 1,
1.448172, 0.7837188, 2.968225, 1, 0, 0.4666667, 1,
1.448523, 0.9885505, 2.427113, 1, 0, 0.4627451, 1,
1.450354, 0.1365414, 2.389493, 1, 0, 0.454902, 1,
1.45122, -1.347793, 3.32813, 1, 0, 0.4509804, 1,
1.451802, 1.151225, 1.286502, 1, 0, 0.4431373, 1,
1.466068, -0.4755008, 1.365212, 1, 0, 0.4392157, 1,
1.474445, -0.4544633, 0.9684749, 1, 0, 0.4313726, 1,
1.48057, -0.6405543, 1.052633, 1, 0, 0.427451, 1,
1.486906, 0.7254185, -0.06852907, 1, 0, 0.4196078, 1,
1.505504, 0.8455841, 1.242273, 1, 0, 0.4156863, 1,
1.506704, -0.0154355, 1.251768, 1, 0, 0.4078431, 1,
1.511303, -0.2514365, 2.17698, 1, 0, 0.4039216, 1,
1.51808, -1.033064, 3.492113, 1, 0, 0.3960784, 1,
1.528718, -0.421115, 1.228864, 1, 0, 0.3882353, 1,
1.530938, 0.4375636, -0.3870037, 1, 0, 0.3843137, 1,
1.538727, 0.7662427, 2.086364, 1, 0, 0.3764706, 1,
1.542804, -1.399107, 1.233912, 1, 0, 0.372549, 1,
1.543478, 1.600961, -0.9183789, 1, 0, 0.3647059, 1,
1.553598, -1.329125, 1.572294, 1, 0, 0.3607843, 1,
1.565487, 0.618422, 0.5281597, 1, 0, 0.3529412, 1,
1.582645, -1.661734, 4.18272, 1, 0, 0.3490196, 1,
1.60663, 0.7160931, 2.118861, 1, 0, 0.3411765, 1,
1.614422, -1.127076, 2.035359, 1, 0, 0.3372549, 1,
1.618662, 0.09480429, 1.698614, 1, 0, 0.3294118, 1,
1.62871, 0.5618404, 1.087174, 1, 0, 0.3254902, 1,
1.646527, -0.6880397, 2.448821, 1, 0, 0.3176471, 1,
1.660782, 0.02285112, 2.580769, 1, 0, 0.3137255, 1,
1.665359, -0.07726396, 2.582385, 1, 0, 0.3058824, 1,
1.672148, -0.2412282, 2.863233, 1, 0, 0.2980392, 1,
1.698476, 0.1985597, 1.480525, 1, 0, 0.2941177, 1,
1.703763, 1.854704, 0.2438297, 1, 0, 0.2862745, 1,
1.711832, -0.4368151, 1.991329, 1, 0, 0.282353, 1,
1.73793, -0.5721943, -0.5078169, 1, 0, 0.2745098, 1,
1.739308, 1.268134, 2.918929, 1, 0, 0.2705882, 1,
1.755227, 0.259933, -1.289735, 1, 0, 0.2627451, 1,
1.795159, 0.03129442, 2.076222, 1, 0, 0.2588235, 1,
1.806408, 0.7036468, 0.6412651, 1, 0, 0.2509804, 1,
1.810099, -0.8852875, 3.369761, 1, 0, 0.2470588, 1,
1.840477, -0.25273, 2.990134, 1, 0, 0.2392157, 1,
1.871581, 1.301919, 0.4371268, 1, 0, 0.2352941, 1,
1.892211, -0.9528146, 2.507512, 1, 0, 0.227451, 1,
1.903242, -1.51348, 3.049489, 1, 0, 0.2235294, 1,
1.908819, -0.5444586, 1.360808, 1, 0, 0.2156863, 1,
1.931803, 0.1396368, 1.477534, 1, 0, 0.2117647, 1,
1.934398, 1.205745, 1.267837, 1, 0, 0.2039216, 1,
1.936148, 2.317632, 0.2737412, 1, 0, 0.1960784, 1,
1.946079, -0.2036719, 3.634627, 1, 0, 0.1921569, 1,
1.959895, 0.1811848, 1.520913, 1, 0, 0.1843137, 1,
1.960832, -0.3763655, 1.235281, 1, 0, 0.1803922, 1,
2.004577, -0.7796714, 0.4582645, 1, 0, 0.172549, 1,
2.024014, -0.7987294, 4.29728, 1, 0, 0.1686275, 1,
2.054823, -0.7168913, 2.665232, 1, 0, 0.1607843, 1,
2.080435, -0.5923605, 1.90554, 1, 0, 0.1568628, 1,
2.081717, -1.161889, 4.508332, 1, 0, 0.1490196, 1,
2.083663, 1.03233, 2.487591, 1, 0, 0.145098, 1,
2.110238, 0.4021764, 0.8294255, 1, 0, 0.1372549, 1,
2.116959, 0.08183207, 0.6369998, 1, 0, 0.1333333, 1,
2.142457, 0.1385837, 2.24567, 1, 0, 0.1254902, 1,
2.165947, 0.0888816, 1.226678, 1, 0, 0.1215686, 1,
2.170804, -0.3578798, 1.34799, 1, 0, 0.1137255, 1,
2.1731, 0.5071198, 1.694157, 1, 0, 0.1098039, 1,
2.221757, -2.023626, 1.39858, 1, 0, 0.1019608, 1,
2.224746, 0.0869596, 2.761811, 1, 0, 0.09411765, 1,
2.284417, 0.4060535, 1.278275, 1, 0, 0.09019608, 1,
2.306742, -1.08462, 2.780333, 1, 0, 0.08235294, 1,
2.317275, -0.7877671, 1.239917, 1, 0, 0.07843138, 1,
2.334782, 0.1604145, 1.013732, 1, 0, 0.07058824, 1,
2.389156, 0.2425752, 2.385198, 1, 0, 0.06666667, 1,
2.398447, 0.1228669, 2.053971, 1, 0, 0.05882353, 1,
2.40807, 0.2259989, -0.3425112, 1, 0, 0.05490196, 1,
2.416728, -0.1503831, 0.8419484, 1, 0, 0.04705882, 1,
2.446908, -0.5778005, 2.654152, 1, 0, 0.04313726, 1,
2.496236, -1.694973, 2.687902, 1, 0, 0.03529412, 1,
2.641197, 0.2883843, 1.457471, 1, 0, 0.03137255, 1,
2.673771, -0.4302009, 2.240356, 1, 0, 0.02352941, 1,
2.716573, 0.3214848, 2.113976, 1, 0, 0.01960784, 1,
3.155782, -0.2375493, 1.939293, 1, 0, 0.01176471, 1,
3.415597, -0.6427042, 2.461782, 1, 0, 0.007843138, 1
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
0.05368388, -4.502361, -7.191169, 0, -0.5, 0.5, 0.5,
0.05368388, -4.502361, -7.191169, 1, -0.5, 0.5, 0.5,
0.05368388, -4.502361, -7.191169, 1, 1.5, 0.5, 0.5,
0.05368388, -4.502361, -7.191169, 0, 1.5, 0.5, 0.5
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
-4.447918, 0.07995307, -7.191169, 0, -0.5, 0.5, 0.5,
-4.447918, 0.07995307, -7.191169, 1, -0.5, 0.5, 0.5,
-4.447918, 0.07995307, -7.191169, 1, 1.5, 0.5, 0.5,
-4.447918, 0.07995307, -7.191169, 0, 1.5, 0.5, 0.5
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
-4.447918, -4.502361, 0.08469534, 0, -0.5, 0.5, 0.5,
-4.447918, -4.502361, 0.08469534, 1, -0.5, 0.5, 0.5,
-4.447918, -4.502361, 0.08469534, 1, 1.5, 0.5, 0.5,
-4.447918, -4.502361, 0.08469534, 0, 1.5, 0.5, 0.5
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
-3, -3.444904, -5.512123,
3, -3.444904, -5.512123,
-3, -3.444904, -5.512123,
-3, -3.621147, -5.791964,
-2, -3.444904, -5.512123,
-2, -3.621147, -5.791964,
-1, -3.444904, -5.512123,
-1, -3.621147, -5.791964,
0, -3.444904, -5.512123,
0, -3.621147, -5.791964,
1, -3.444904, -5.512123,
1, -3.621147, -5.791964,
2, -3.444904, -5.512123,
2, -3.621147, -5.791964,
3, -3.444904, -5.512123,
3, -3.621147, -5.791964
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
-3, -3.973633, -6.351646, 0, -0.5, 0.5, 0.5,
-3, -3.973633, -6.351646, 1, -0.5, 0.5, 0.5,
-3, -3.973633, -6.351646, 1, 1.5, 0.5, 0.5,
-3, -3.973633, -6.351646, 0, 1.5, 0.5, 0.5,
-2, -3.973633, -6.351646, 0, -0.5, 0.5, 0.5,
-2, -3.973633, -6.351646, 1, -0.5, 0.5, 0.5,
-2, -3.973633, -6.351646, 1, 1.5, 0.5, 0.5,
-2, -3.973633, -6.351646, 0, 1.5, 0.5, 0.5,
-1, -3.973633, -6.351646, 0, -0.5, 0.5, 0.5,
-1, -3.973633, -6.351646, 1, -0.5, 0.5, 0.5,
-1, -3.973633, -6.351646, 1, 1.5, 0.5, 0.5,
-1, -3.973633, -6.351646, 0, 1.5, 0.5, 0.5,
0, -3.973633, -6.351646, 0, -0.5, 0.5, 0.5,
0, -3.973633, -6.351646, 1, -0.5, 0.5, 0.5,
0, -3.973633, -6.351646, 1, 1.5, 0.5, 0.5,
0, -3.973633, -6.351646, 0, 1.5, 0.5, 0.5,
1, -3.973633, -6.351646, 0, -0.5, 0.5, 0.5,
1, -3.973633, -6.351646, 1, -0.5, 0.5, 0.5,
1, -3.973633, -6.351646, 1, 1.5, 0.5, 0.5,
1, -3.973633, -6.351646, 0, 1.5, 0.5, 0.5,
2, -3.973633, -6.351646, 0, -0.5, 0.5, 0.5,
2, -3.973633, -6.351646, 1, -0.5, 0.5, 0.5,
2, -3.973633, -6.351646, 1, 1.5, 0.5, 0.5,
2, -3.973633, -6.351646, 0, 1.5, 0.5, 0.5,
3, -3.973633, -6.351646, 0, -0.5, 0.5, 0.5,
3, -3.973633, -6.351646, 1, -0.5, 0.5, 0.5,
3, -3.973633, -6.351646, 1, 1.5, 0.5, 0.5,
3, -3.973633, -6.351646, 0, 1.5, 0.5, 0.5
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
-3.409087, -3, -5.512123,
-3.409087, 3, -5.512123,
-3.409087, -3, -5.512123,
-3.582225, -3, -5.791964,
-3.409087, -2, -5.512123,
-3.582225, -2, -5.791964,
-3.409087, -1, -5.512123,
-3.582225, -1, -5.791964,
-3.409087, 0, -5.512123,
-3.582225, 0, -5.791964,
-3.409087, 1, -5.512123,
-3.582225, 1, -5.791964,
-3.409087, 2, -5.512123,
-3.582225, 2, -5.791964,
-3.409087, 3, -5.512123,
-3.582225, 3, -5.791964
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
-3.928503, -3, -6.351646, 0, -0.5, 0.5, 0.5,
-3.928503, -3, -6.351646, 1, -0.5, 0.5, 0.5,
-3.928503, -3, -6.351646, 1, 1.5, 0.5, 0.5,
-3.928503, -3, -6.351646, 0, 1.5, 0.5, 0.5,
-3.928503, -2, -6.351646, 0, -0.5, 0.5, 0.5,
-3.928503, -2, -6.351646, 1, -0.5, 0.5, 0.5,
-3.928503, -2, -6.351646, 1, 1.5, 0.5, 0.5,
-3.928503, -2, -6.351646, 0, 1.5, 0.5, 0.5,
-3.928503, -1, -6.351646, 0, -0.5, 0.5, 0.5,
-3.928503, -1, -6.351646, 1, -0.5, 0.5, 0.5,
-3.928503, -1, -6.351646, 1, 1.5, 0.5, 0.5,
-3.928503, -1, -6.351646, 0, 1.5, 0.5, 0.5,
-3.928503, 0, -6.351646, 0, -0.5, 0.5, 0.5,
-3.928503, 0, -6.351646, 1, -0.5, 0.5, 0.5,
-3.928503, 0, -6.351646, 1, 1.5, 0.5, 0.5,
-3.928503, 0, -6.351646, 0, 1.5, 0.5, 0.5,
-3.928503, 1, -6.351646, 0, -0.5, 0.5, 0.5,
-3.928503, 1, -6.351646, 1, -0.5, 0.5, 0.5,
-3.928503, 1, -6.351646, 1, 1.5, 0.5, 0.5,
-3.928503, 1, -6.351646, 0, 1.5, 0.5, 0.5,
-3.928503, 2, -6.351646, 0, -0.5, 0.5, 0.5,
-3.928503, 2, -6.351646, 1, -0.5, 0.5, 0.5,
-3.928503, 2, -6.351646, 1, 1.5, 0.5, 0.5,
-3.928503, 2, -6.351646, 0, 1.5, 0.5, 0.5,
-3.928503, 3, -6.351646, 0, -0.5, 0.5, 0.5,
-3.928503, 3, -6.351646, 1, -0.5, 0.5, 0.5,
-3.928503, 3, -6.351646, 1, 1.5, 0.5, 0.5,
-3.928503, 3, -6.351646, 0, 1.5, 0.5, 0.5
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
-3.409087, -3.444904, -4,
-3.409087, -3.444904, 4,
-3.409087, -3.444904, -4,
-3.582225, -3.621147, -4,
-3.409087, -3.444904, -2,
-3.582225, -3.621147, -2,
-3.409087, -3.444904, 0,
-3.582225, -3.621147, 0,
-3.409087, -3.444904, 2,
-3.582225, -3.621147, 2,
-3.409087, -3.444904, 4,
-3.582225, -3.621147, 4
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
-3.928503, -3.973633, -4, 0, -0.5, 0.5, 0.5,
-3.928503, -3.973633, -4, 1, -0.5, 0.5, 0.5,
-3.928503, -3.973633, -4, 1, 1.5, 0.5, 0.5,
-3.928503, -3.973633, -4, 0, 1.5, 0.5, 0.5,
-3.928503, -3.973633, -2, 0, -0.5, 0.5, 0.5,
-3.928503, -3.973633, -2, 1, -0.5, 0.5, 0.5,
-3.928503, -3.973633, -2, 1, 1.5, 0.5, 0.5,
-3.928503, -3.973633, -2, 0, 1.5, 0.5, 0.5,
-3.928503, -3.973633, 0, 0, -0.5, 0.5, 0.5,
-3.928503, -3.973633, 0, 1, -0.5, 0.5, 0.5,
-3.928503, -3.973633, 0, 1, 1.5, 0.5, 0.5,
-3.928503, -3.973633, 0, 0, 1.5, 0.5, 0.5,
-3.928503, -3.973633, 2, 0, -0.5, 0.5, 0.5,
-3.928503, -3.973633, 2, 1, -0.5, 0.5, 0.5,
-3.928503, -3.973633, 2, 1, 1.5, 0.5, 0.5,
-3.928503, -3.973633, 2, 0, 1.5, 0.5, 0.5,
-3.928503, -3.973633, 4, 0, -0.5, 0.5, 0.5,
-3.928503, -3.973633, 4, 1, -0.5, 0.5, 0.5,
-3.928503, -3.973633, 4, 1, 1.5, 0.5, 0.5,
-3.928503, -3.973633, 4, 0, 1.5, 0.5, 0.5
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
-3.409087, -3.444904, -5.512123,
-3.409087, 3.60481, -5.512123,
-3.409087, -3.444904, 5.681514,
-3.409087, 3.60481, 5.681514,
-3.409087, -3.444904, -5.512123,
-3.409087, -3.444904, 5.681514,
-3.409087, 3.60481, -5.512123,
-3.409087, 3.60481, 5.681514,
-3.409087, -3.444904, -5.512123,
3.516455, -3.444904, -5.512123,
-3.409087, -3.444904, 5.681514,
3.516455, -3.444904, 5.681514,
-3.409087, 3.60481, -5.512123,
3.516455, 3.60481, -5.512123,
-3.409087, 3.60481, 5.681514,
3.516455, 3.60481, 5.681514,
3.516455, -3.444904, -5.512123,
3.516455, 3.60481, -5.512123,
3.516455, -3.444904, 5.681514,
3.516455, 3.60481, 5.681514,
3.516455, -3.444904, -5.512123,
3.516455, -3.444904, 5.681514,
3.516455, 3.60481, -5.512123,
3.516455, 3.60481, 5.681514
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
var radius = 7.973299;
var distance = 35.47411;
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
mvMatrix.translate( -0.05368388, -0.07995307, -0.08469534 );
mvMatrix.scale( 1.244796, 1.22287, 0.7701597 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.47411);
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
ethylene_dibromide_1<-read.table("ethylene_dibromide_1.xyz", skip=1)
```

```
## Error in read.table("ethylene_dibromide_1.xyz", skip = 1): duplicate 'row.names' are not allowed
```

```r
x<-ethylene_dibromide_1$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethylene_dibromide_1' not found
```

```r
y<-ethylene_dibromide_1$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethylene_dibromide_1' not found
```

```r
z<-ethylene_dibromide_1$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethylene_dibromide_1' not found
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
-3.308229, -1.003171, -1.867805, 0, 0, 1, 1, 1,
-3.092164, 0.7888005, -2.249197, 1, 0, 0, 1, 1,
-3.007156, -1.102176, -1.631788, 1, 0, 0, 1, 1,
-3.005616, -2.508106, -0.7390617, 1, 0, 0, 1, 1,
-2.964188, -0.7799147, -1.836619, 1, 0, 0, 1, 1,
-2.592821, 0.1139855, -1.088802, 1, 0, 0, 1, 1,
-2.392562, -1.067705, -1.006639, 0, 0, 0, 1, 1,
-2.34206, 0.3159929, -1.500352, 0, 0, 0, 1, 1,
-2.28471, -0.991177, -2.986521, 0, 0, 0, 1, 1,
-2.268923, 0.3384109, 0.2958195, 0, 0, 0, 1, 1,
-2.228881, -0.5249185, -3.940213, 0, 0, 0, 1, 1,
-2.2211, -0.9852405, -2.711393, 0, 0, 0, 1, 1,
-2.197556, -0.3239982, -2.454973, 0, 0, 0, 1, 1,
-2.184065, 0.9765484, -1.054323, 1, 1, 1, 1, 1,
-2.157453, 1.985042, -1.400563, 1, 1, 1, 1, 1,
-2.154132, 0.05867779, -1.657352, 1, 1, 1, 1, 1,
-2.152262, -0.4115479, -1.890948, 1, 1, 1, 1, 1,
-2.148765, 0.9173341, -1.183485, 1, 1, 1, 1, 1,
-2.138059, 1.123425, -1.947823, 1, 1, 1, 1, 1,
-2.097975, 0.7909448, -0.5107366, 1, 1, 1, 1, 1,
-2.096909, 1.811267, -0.09513945, 1, 1, 1, 1, 1,
-2.087018, 0.9016467, -2.431586, 1, 1, 1, 1, 1,
-2.069263, 0.6062771, -1.124731, 1, 1, 1, 1, 1,
-2.05368, 0.6981336, 0.2098414, 1, 1, 1, 1, 1,
-2.051011, -0.6499408, -1.920146, 1, 1, 1, 1, 1,
-2.040088, -0.4094392, -0.1600417, 1, 1, 1, 1, 1,
-2.021787, 0.1595342, -1.094014, 1, 1, 1, 1, 1,
-1.939486, 1.503608, -0.8097144, 1, 1, 1, 1, 1,
-1.938024, 0.1933404, -1.748302, 0, 0, 1, 1, 1,
-1.903609, 1.162004, -2.556967, 1, 0, 0, 1, 1,
-1.892401, -2.422762, -0.9390209, 1, 0, 0, 1, 1,
-1.835292, 0.7118456, -0.1657606, 1, 0, 0, 1, 1,
-1.818265, -0.6479717, -1.847449, 1, 0, 0, 1, 1,
-1.781241, -0.5270723, -0.6040354, 1, 0, 0, 1, 1,
-1.770115, 1.394581, -1.436623, 0, 0, 0, 1, 1,
-1.753074, 2.0717, -1.312722, 0, 0, 0, 1, 1,
-1.749925, -0.9548439, -3.500676, 0, 0, 0, 1, 1,
-1.747628, -0.397064, -1.512035, 0, 0, 0, 1, 1,
-1.734612, 0.859831, -1.397159, 0, 0, 0, 1, 1,
-1.707799, 0.1097237, -0.8035476, 0, 0, 0, 1, 1,
-1.707669, 1.543104, 0.3262539, 0, 0, 0, 1, 1,
-1.662065, 0.8106461, -0.8317565, 1, 1, 1, 1, 1,
-1.656648, 0.4500788, -2.70615, 1, 1, 1, 1, 1,
-1.652294, 0.7131373, -1.386123, 1, 1, 1, 1, 1,
-1.648182, -0.8202239, -1.793923, 1, 1, 1, 1, 1,
-1.615595, 0.06752732, -2.398632, 1, 1, 1, 1, 1,
-1.607435, 1.444396, -1.009708, 1, 1, 1, 1, 1,
-1.602495, 0.5212574, -0.8145711, 1, 1, 1, 1, 1,
-1.58252, -0.3848758, -0.7963474, 1, 1, 1, 1, 1,
-1.550808, -1.362123, -2.589329, 1, 1, 1, 1, 1,
-1.549163, -0.3672576, -1.182094, 1, 1, 1, 1, 1,
-1.541282, -0.4089806, -2.966382, 1, 1, 1, 1, 1,
-1.540129, 1.499957, -1.948649, 1, 1, 1, 1, 1,
-1.52213, -0.7223825, 0.393821, 1, 1, 1, 1, 1,
-1.518031, -0.9970175, -1.989218, 1, 1, 1, 1, 1,
-1.514407, 0.2293941, -0.08308273, 1, 1, 1, 1, 1,
-1.502083, 0.9762139, -2.077241, 0, 0, 1, 1, 1,
-1.489252, -0.0311137, -0.570406, 1, 0, 0, 1, 1,
-1.480007, -0.7113513, -2.859928, 1, 0, 0, 1, 1,
-1.455446, -0.3511126, -1.400922, 1, 0, 0, 1, 1,
-1.454258, 1.475407, -3.887873, 1, 0, 0, 1, 1,
-1.452302, -1.28736, -2.354416, 1, 0, 0, 1, 1,
-1.438418, -1.637433, -2.000679, 0, 0, 0, 1, 1,
-1.437559, -1.133835, -1.535421, 0, 0, 0, 1, 1,
-1.426455, 0.9351012, -0.6474, 0, 0, 0, 1, 1,
-1.42074, -1.060588, -1.495632, 0, 0, 0, 1, 1,
-1.412957, 0.4297817, -2.808468, 0, 0, 0, 1, 1,
-1.410044, 0.1267494, -0.2577129, 0, 0, 0, 1, 1,
-1.404566, 1.041534, -0.3001959, 0, 0, 0, 1, 1,
-1.399726, 1.056207, -1.440631, 1, 1, 1, 1, 1,
-1.394256, 0.5307154, -0.8759341, 1, 1, 1, 1, 1,
-1.389663, -0.7844805, -2.179701, 1, 1, 1, 1, 1,
-1.384282, 1.538373, -1.65081, 1, 1, 1, 1, 1,
-1.384181, -0.9193999, -4.098565, 1, 1, 1, 1, 1,
-1.383881, 0.9847107, 0.2655927, 1, 1, 1, 1, 1,
-1.378448, -0.6247329, -1.974862, 1, 1, 1, 1, 1,
-1.373339, 1.013203, -1.067231, 1, 1, 1, 1, 1,
-1.371811, -0.8761691, -1.918015, 1, 1, 1, 1, 1,
-1.363875, 0.7983454, -0.3112108, 1, 1, 1, 1, 1,
-1.355468, -0.5721191, -3.150641, 1, 1, 1, 1, 1,
-1.352372, 0.5564465, 0.2569241, 1, 1, 1, 1, 1,
-1.352024, 1.12684, -1.754987, 1, 1, 1, 1, 1,
-1.34869, 0.873019, -2.073837, 1, 1, 1, 1, 1,
-1.345169, 0.5406713, -0.2981117, 1, 1, 1, 1, 1,
-1.338154, 1.304668, -1.323105, 0, 0, 1, 1, 1,
-1.337491, 0.3335218, -1.134897, 1, 0, 0, 1, 1,
-1.322342, 0.7581371, -2.005878, 1, 0, 0, 1, 1,
-1.317625, 0.2018748, -1.354799, 1, 0, 0, 1, 1,
-1.313811, -0.9576087, 0.7792686, 1, 0, 0, 1, 1,
-1.292509, -2.078147, -1.258797, 1, 0, 0, 1, 1,
-1.291471, -0.2611427, -1.328289, 0, 0, 0, 1, 1,
-1.290424, 0.9892725, -1.539558, 0, 0, 0, 1, 1,
-1.278816, 1.14824, 0.5807003, 0, 0, 0, 1, 1,
-1.269375, 0.1964383, -2.14557, 0, 0, 0, 1, 1,
-1.256117, -0.3817786, -2.349844, 0, 0, 0, 1, 1,
-1.251354, 0.0761295, -1.663189, 0, 0, 0, 1, 1,
-1.25043, -0.1755358, -2.907514, 0, 0, 0, 1, 1,
-1.244097, 0.2322929, 0.6050488, 1, 1, 1, 1, 1,
-1.242798, -0.5103323, -1.005132, 1, 1, 1, 1, 1,
-1.237359, -0.7201459, -2.911809, 1, 1, 1, 1, 1,
-1.228755, -2.38361, -1.175742, 1, 1, 1, 1, 1,
-1.227914, -0.2053011, -1.601119, 1, 1, 1, 1, 1,
-1.222975, -0.07104584, -0.9334027, 1, 1, 1, 1, 1,
-1.206384, -0.8677189, -1.11786, 1, 1, 1, 1, 1,
-1.203893, 2.227798, 0.7744802, 1, 1, 1, 1, 1,
-1.198275, 0.6558403, -1.07653, 1, 1, 1, 1, 1,
-1.197594, 1.328913, -0.9040569, 1, 1, 1, 1, 1,
-1.197577, -0.1642714, -2.682778, 1, 1, 1, 1, 1,
-1.196424, -0.1183505, -2.448315, 1, 1, 1, 1, 1,
-1.194486, -1.378964, -2.428407, 1, 1, 1, 1, 1,
-1.178009, -1.014752, -2.7069, 1, 1, 1, 1, 1,
-1.171039, 0.007286771, -2.291035, 1, 1, 1, 1, 1,
-1.166888, -2.713112, -2.891678, 0, 0, 1, 1, 1,
-1.166475, 1.117274, -0.1272135, 1, 0, 0, 1, 1,
-1.161115, 1.201183, 0.2143731, 1, 0, 0, 1, 1,
-1.154817, -0.1872755, -0.8845193, 1, 0, 0, 1, 1,
-1.153144, -0.6374865, -2.056766, 1, 0, 0, 1, 1,
-1.149325, -0.8447484, -1.152497, 1, 0, 0, 1, 1,
-1.148437, 2.146465, -0.444607, 0, 0, 0, 1, 1,
-1.145828, -1.268864, -1.142311, 0, 0, 0, 1, 1,
-1.144496, -0.03936288, -1.905861, 0, 0, 0, 1, 1,
-1.14269, -1.560674, -2.296183, 0, 0, 0, 1, 1,
-1.136961, -0.3643133, -0.3726839, 0, 0, 0, 1, 1,
-1.13566, -0.7912616, -2.015352, 0, 0, 0, 1, 1,
-1.134108, -0.6465096, -2.229464, 0, 0, 0, 1, 1,
-1.12392, 2.060787, -1.781639, 1, 1, 1, 1, 1,
-1.113832, 0.5043413, -1.890804, 1, 1, 1, 1, 1,
-1.11279, -1.233788, -0.8846494, 1, 1, 1, 1, 1,
-1.108324, -0.2827562, -1.90268, 1, 1, 1, 1, 1,
-1.101953, 0.09544244, -1.404483, 1, 1, 1, 1, 1,
-1.097748, -1.034066, -2.101473, 1, 1, 1, 1, 1,
-1.094402, -0.7587621, -3.080537, 1, 1, 1, 1, 1,
-1.086065, 0.8697879, 0.4289226, 1, 1, 1, 1, 1,
-1.074279, 3.502145, 0.5472983, 1, 1, 1, 1, 1,
-1.059391, 0.8269121, -0.721884, 1, 1, 1, 1, 1,
-1.058683, 1.031087, -1.186843, 1, 1, 1, 1, 1,
-1.057829, -0.7837833, -1.25251, 1, 1, 1, 1, 1,
-1.055935, -2.31844, -1.179598, 1, 1, 1, 1, 1,
-1.044291, 0.9037567, -0.2222296, 1, 1, 1, 1, 1,
-1.041205, 0.4280137, -1.800464, 1, 1, 1, 1, 1,
-1.039375, -0.6474618, -0.1276826, 0, 0, 1, 1, 1,
-1.03538, 0.4569381, -0.7685224, 1, 0, 0, 1, 1,
-1.026926, 0.5949593, -0.1853868, 1, 0, 0, 1, 1,
-1.023731, -1.522439, -0.6511431, 1, 0, 0, 1, 1,
-1.022397, 0.1235008, -2.055287, 1, 0, 0, 1, 1,
-1.022157, -0.2988733, -1.659661, 1, 0, 0, 1, 1,
-1.020003, -0.7344582, -3.252021, 0, 0, 0, 1, 1,
-1.018142, 0.8538263, -2.367855, 0, 0, 0, 1, 1,
-1.016587, 2.013213, -1.400691, 0, 0, 0, 1, 1,
-1.01643, 0.2478725, -0.9023092, 0, 0, 0, 1, 1,
-1.007009, -0.830798, -1.90152, 0, 0, 0, 1, 1,
-0.9937477, 0.891715, -0.03054444, 0, 0, 0, 1, 1,
-0.9901673, -1.879778, -2.362452, 0, 0, 0, 1, 1,
-0.9888822, 1.335165, -0.4595812, 1, 1, 1, 1, 1,
-0.9799027, -1.033417, -0.7429812, 1, 1, 1, 1, 1,
-0.9792737, -0.6875497, -1.470265, 1, 1, 1, 1, 1,
-0.9738712, 1.539977, 0.5907533, 1, 1, 1, 1, 1,
-0.9654375, 0.2339821, -1.093965, 1, 1, 1, 1, 1,
-0.9585864, -0.7359782, -2.448814, 1, 1, 1, 1, 1,
-0.9465807, 0.2644282, -1.659041, 1, 1, 1, 1, 1,
-0.9429978, -0.007158985, -2.37228, 1, 1, 1, 1, 1,
-0.9391738, -0.4913664, -2.859362, 1, 1, 1, 1, 1,
-0.9384531, -0.3197638, -2.298431, 1, 1, 1, 1, 1,
-0.9380898, -0.9254548, -1.897669, 1, 1, 1, 1, 1,
-0.9331746, 1.506525, -0.8220578, 1, 1, 1, 1, 1,
-0.9316109, -0.8265023, -2.161826, 1, 1, 1, 1, 1,
-0.9293743, -0.001303999, -2.094681, 1, 1, 1, 1, 1,
-0.9266591, 0.3877417, -0.3215211, 1, 1, 1, 1, 1,
-0.9252247, -1.56864, -4.045992, 0, 0, 1, 1, 1,
-0.9218653, 2.924403, -0.9920543, 1, 0, 0, 1, 1,
-0.921447, 1.116585, -1.477179, 1, 0, 0, 1, 1,
-0.9165452, 1.078838, -0.313229, 1, 0, 0, 1, 1,
-0.9137694, 0.4443457, 0.7388006, 1, 0, 0, 1, 1,
-0.9127502, -0.3269211, -0.5813884, 1, 0, 0, 1, 1,
-0.9082931, 0.228541, -0.1707212, 0, 0, 0, 1, 1,
-0.898334, -1.566858, -0.5102677, 0, 0, 0, 1, 1,
-0.8915126, 0.5952652, 1.328217, 0, 0, 0, 1, 1,
-0.8851863, -1.545829, -2.428481, 0, 0, 0, 1, 1,
-0.8843144, -0.9916168, -0.8428796, 0, 0, 0, 1, 1,
-0.8838508, 0.439842, -1.577483, 0, 0, 0, 1, 1,
-0.8786139, -0.4128785, -2.281618, 0, 0, 0, 1, 1,
-0.8744524, -0.07848446, -1.335214, 1, 1, 1, 1, 1,
-0.8643595, 0.7395617, -0.09575126, 1, 1, 1, 1, 1,
-0.861344, 1.000815, -1.28594, 1, 1, 1, 1, 1,
-0.859197, -0.9119388, -3.358671, 1, 1, 1, 1, 1,
-0.8578048, 1.508819, -0.05328873, 1, 1, 1, 1, 1,
-0.8486274, 1.541132, -0.424114, 1, 1, 1, 1, 1,
-0.8474336, 1.438634, -1.627116, 1, 1, 1, 1, 1,
-0.8434379, -1.270699, -1.351812, 1, 1, 1, 1, 1,
-0.8408135, -0.4948668, -1.423989, 1, 1, 1, 1, 1,
-0.8404952, -0.6106841, -4.12824, 1, 1, 1, 1, 1,
-0.8380013, -0.02477298, -0.5082751, 1, 1, 1, 1, 1,
-0.837934, 0.5294403, -2.053117, 1, 1, 1, 1, 1,
-0.8373777, 0.9777215, -0.3468875, 1, 1, 1, 1, 1,
-0.836969, -1.488304, -2.022376, 1, 1, 1, 1, 1,
-0.8361641, 1.35073, 1.223655, 1, 1, 1, 1, 1,
-0.8311212, 1.142457, -0.5333906, 0, 0, 1, 1, 1,
-0.8307455, -0.01578399, -0.7374018, 1, 0, 0, 1, 1,
-0.8216189, 1.769179, -1.041849, 1, 0, 0, 1, 1,
-0.8123246, -0.8848598, -2.582834, 1, 0, 0, 1, 1,
-0.8112656, 0.8798208, -1.05218, 1, 0, 0, 1, 1,
-0.8094344, -0.7289919, -2.892918, 1, 0, 0, 1, 1,
-0.807585, 1.735969, 0.8314843, 0, 0, 0, 1, 1,
-0.8050242, -0.9229404, -3.058553, 0, 0, 0, 1, 1,
-0.7972268, 0.3095196, -2.085002, 0, 0, 0, 1, 1,
-0.7873773, -0.9987558, -1.127249, 0, 0, 0, 1, 1,
-0.7841471, 0.7593096, -1.714261, 0, 0, 0, 1, 1,
-0.7804531, -1.661241, -2.174722, 0, 0, 0, 1, 1,
-0.7732972, 1.063266, -0.6202735, 0, 0, 0, 1, 1,
-0.7712756, 0.8001427, 0.6655315, 1, 1, 1, 1, 1,
-0.7708674, 0.3099975, -1.599385, 1, 1, 1, 1, 1,
-0.7704904, -2.142701, -2.531995, 1, 1, 1, 1, 1,
-0.7698227, 1.10916, 0.7694349, 1, 1, 1, 1, 1,
-0.7649068, -1.12103, -3.099139, 1, 1, 1, 1, 1,
-0.7612541, -1.503366, -3.14576, 1, 1, 1, 1, 1,
-0.7593359, -0.6082637, -0.6058871, 1, 1, 1, 1, 1,
-0.7563336, 0.5120687, -0.9336764, 1, 1, 1, 1, 1,
-0.7527205, -1.583314, -3.111206, 1, 1, 1, 1, 1,
-0.7498317, 1.023738, -1.232363, 1, 1, 1, 1, 1,
-0.7495993, 0.4199689, -2.0211, 1, 1, 1, 1, 1,
-0.7489391, -0.8837301, -2.506151, 1, 1, 1, 1, 1,
-0.7433942, -0.7436962, -2.161735, 1, 1, 1, 1, 1,
-0.7433645, 0.9679536, -1.422662, 1, 1, 1, 1, 1,
-0.7407159, 1.437228, -0.7230644, 1, 1, 1, 1, 1,
-0.7399099, 0.6940491, -0.9425289, 0, 0, 1, 1, 1,
-0.7392869, 0.289445, -0.9218829, 1, 0, 0, 1, 1,
-0.7390441, -0.7805406, -1.656296, 1, 0, 0, 1, 1,
-0.7305732, -2.227051, -2.788983, 1, 0, 0, 1, 1,
-0.7281132, -0.5865626, -1.167439, 1, 0, 0, 1, 1,
-0.7251703, -1.687876, -0.6289394, 1, 0, 0, 1, 1,
-0.7239756, 0.6800777, -0.1383316, 0, 0, 0, 1, 1,
-0.7187886, -0.02011958, -2.234807, 0, 0, 0, 1, 1,
-0.716324, 0.8784229, -0.1806796, 0, 0, 0, 1, 1,
-0.7157168, -0.03765861, -1.206383, 0, 0, 0, 1, 1,
-0.7121902, 1.395886, 0.152336, 0, 0, 0, 1, 1,
-0.7078232, 0.7422498, -2.31846, 0, 0, 0, 1, 1,
-0.705808, 1.14717, -2.118589, 0, 0, 0, 1, 1,
-0.7056825, 0.7667673, -0.2454533, 1, 1, 1, 1, 1,
-0.7055085, 2.235117, -0.5265601, 1, 1, 1, 1, 1,
-0.7034568, 0.5325664, -2.893818, 1, 1, 1, 1, 1,
-0.7031817, -1.111548, -3.106491, 1, 1, 1, 1, 1,
-0.7020915, -0.3664674, -3.410551, 1, 1, 1, 1, 1,
-0.7015002, 1.402886, -1.193701, 1, 1, 1, 1, 1,
-0.6974282, 1.419136, -2.335429, 1, 1, 1, 1, 1,
-0.6863772, -0.5950916, -1.37985, 1, 1, 1, 1, 1,
-0.6853413, 0.5465252, -0.1778821, 1, 1, 1, 1, 1,
-0.6832005, -0.5049476, -2.863573, 1, 1, 1, 1, 1,
-0.6782193, -0.4518079, -3.266829, 1, 1, 1, 1, 1,
-0.6780586, -0.530921, -2.929262, 1, 1, 1, 1, 1,
-0.6728548, 1.483115, 1.162228, 1, 1, 1, 1, 1,
-0.6711842, 0.03886712, -2.064442, 1, 1, 1, 1, 1,
-0.6694418, -0.1524619, -3.558751, 1, 1, 1, 1, 1,
-0.6667832, -1.207681, -2.614895, 0, 0, 1, 1, 1,
-0.6603625, 0.1799209, -0.395348, 1, 0, 0, 1, 1,
-0.6583318, 0.997673, -0.9131058, 1, 0, 0, 1, 1,
-0.6578967, 0.2252466, -1.739866, 1, 0, 0, 1, 1,
-0.6483592, 0.2753467, -1.18003, 1, 0, 0, 1, 1,
-0.6447381, 0.3125172, -1.916771, 1, 0, 0, 1, 1,
-0.6409915, 0.5937918, -1.490772, 0, 0, 0, 1, 1,
-0.6344794, -0.5027336, -1.132626, 0, 0, 0, 1, 1,
-0.6317244, 1.531333, -0.06195638, 0, 0, 0, 1, 1,
-0.6250322, -1.0835, -1.379533, 0, 0, 0, 1, 1,
-0.6247188, -0.2355652, -2.625363, 0, 0, 0, 1, 1,
-0.6205121, -0.7537543, -2.35715, 0, 0, 0, 1, 1,
-0.6136485, 1.232523, -0.8105223, 0, 0, 0, 1, 1,
-0.6116451, 0.1166878, -2.46193, 1, 1, 1, 1, 1,
-0.6104135, -1.000203, -2.900249, 1, 1, 1, 1, 1,
-0.609629, 0.8579004, -2.734713, 1, 1, 1, 1, 1,
-0.6088282, -0.3787983, -1.375003, 1, 1, 1, 1, 1,
-0.6009373, 0.2311581, -0.4351805, 1, 1, 1, 1, 1,
-0.6007187, 1.306538, -0.02152557, 1, 1, 1, 1, 1,
-0.5974107, 0.8396193, -1.098421, 1, 1, 1, 1, 1,
-0.5877715, -1.42722, -4.321744, 1, 1, 1, 1, 1,
-0.5860698, -0.5142862, -1.249734, 1, 1, 1, 1, 1,
-0.5847197, -0.2511683, -3.636636, 1, 1, 1, 1, 1,
-0.5839695, 0.1544953, -1.613009, 1, 1, 1, 1, 1,
-0.5829065, -0.003969625, -0.1923237, 1, 1, 1, 1, 1,
-0.5826578, 0.588818, 0.566525, 1, 1, 1, 1, 1,
-0.5809602, 0.137211, -0.3489093, 1, 1, 1, 1, 1,
-0.5776267, -0.1264864, -1.239819, 1, 1, 1, 1, 1,
-0.5766432, 0.5992993, -0.3980135, 0, 0, 1, 1, 1,
-0.5738786, -1.452212, -2.684385, 1, 0, 0, 1, 1,
-0.5660562, 1.111561, -0.8410459, 1, 0, 0, 1, 1,
-0.5642664, 0.895875, -0.2190118, 1, 0, 0, 1, 1,
-0.5599905, -0.1843805, -2.136734, 1, 0, 0, 1, 1,
-0.5592692, -0.1521481, -2.18915, 1, 0, 0, 1, 1,
-0.5584981, 1.44503, 0.2387383, 0, 0, 0, 1, 1,
-0.5559915, -1.119883, -2.114959, 0, 0, 0, 1, 1,
-0.5542102, 1.941762, -2.523269, 0, 0, 0, 1, 1,
-0.5449159, -1.360499, -2.804145, 0, 0, 0, 1, 1,
-0.5371896, 0.4981045, -1.873347, 0, 0, 0, 1, 1,
-0.5335138, -0.3824281, -0.3298025, 0, 0, 0, 1, 1,
-0.5332922, 1.557785, -2.115017, 0, 0, 0, 1, 1,
-0.5315391, -0.1240679, -1.973257, 1, 1, 1, 1, 1,
-0.5295148, 0.192483, -0.1614039, 1, 1, 1, 1, 1,
-0.5292972, -1.201646, -1.74057, 1, 1, 1, 1, 1,
-0.5291276, -0.1928958, -2.1019, 1, 1, 1, 1, 1,
-0.5285621, 1.591692, -1.508339, 1, 1, 1, 1, 1,
-0.5278606, -2.11395, -1.750763, 1, 1, 1, 1, 1,
-0.5252731, -1.24263, -1.77809, 1, 1, 1, 1, 1,
-0.521898, -0.2839303, -1.154274, 1, 1, 1, 1, 1,
-0.5168568, 2.430784, 0.5039159, 1, 1, 1, 1, 1,
-0.5157744, -2.04693, -3.117244, 1, 1, 1, 1, 1,
-0.5121604, 0.1518144, -0.5156431, 1, 1, 1, 1, 1,
-0.5083655, -0.168548, -0.5447843, 1, 1, 1, 1, 1,
-0.5065954, -0.9206164, -3.690344, 1, 1, 1, 1, 1,
-0.5016594, 1.712217, 0.8439582, 1, 1, 1, 1, 1,
-0.5004806, -1.281592, -2.316823, 1, 1, 1, 1, 1,
-0.4996461, 1.382978, -1.157904, 0, 0, 1, 1, 1,
-0.4992065, 0.2629927, -1.428677, 1, 0, 0, 1, 1,
-0.497211, 0.6271439, -0.7223151, 1, 0, 0, 1, 1,
-0.4972006, 0.6199329, -1.930357, 1, 0, 0, 1, 1,
-0.496358, -1.564336, -1.680801, 1, 0, 0, 1, 1,
-0.4902474, 0.6067045, 0.2929877, 1, 0, 0, 1, 1,
-0.4878885, 0.8251429, -1.101745, 0, 0, 0, 1, 1,
-0.4867203, 0.7019879, -0.09557693, 0, 0, 0, 1, 1,
-0.4852127, 0.2839122, -1.732542, 0, 0, 0, 1, 1,
-0.4834923, 0.764432, -1.009952, 0, 0, 0, 1, 1,
-0.4829222, 0.2829507, -0.2531055, 0, 0, 0, 1, 1,
-0.4789419, -1.224262, -2.927453, 0, 0, 0, 1, 1,
-0.4774579, -1.244296, -2.95754, 0, 0, 0, 1, 1,
-0.4731348, -1.199311, -2.773283, 1, 1, 1, 1, 1,
-0.4720971, -1.879536, -4.090863, 1, 1, 1, 1, 1,
-0.4708087, 0.3296602, -1.172205, 1, 1, 1, 1, 1,
-0.4686226, 0.1805415, -2.017697, 1, 1, 1, 1, 1,
-0.4672257, 0.09852617, -0.6480253, 1, 1, 1, 1, 1,
-0.4655269, -1.052936, -4.039123, 1, 1, 1, 1, 1,
-0.4652241, 0.3816023, -0.7814582, 1, 1, 1, 1, 1,
-0.4632846, -0.2387179, -0.5839279, 1, 1, 1, 1, 1,
-0.4603666, -1.683453, -3.465005, 1, 1, 1, 1, 1,
-0.4594143, -0.08909651, -1.546784, 1, 1, 1, 1, 1,
-0.4569336, -1.090743, -0.313162, 1, 1, 1, 1, 1,
-0.454375, 1.722856, -1.167622, 1, 1, 1, 1, 1,
-0.4523257, 1.476579, 2.259675, 1, 1, 1, 1, 1,
-0.4480119, 0.09965348, 0.2708717, 1, 1, 1, 1, 1,
-0.4467157, -1.311342, -4.132352, 1, 1, 1, 1, 1,
-0.4422186, -0.926839, -2.173287, 0, 0, 1, 1, 1,
-0.4372126, -0.1407378, -3.237179, 1, 0, 0, 1, 1,
-0.4358635, 0.6773573, 0.1999148, 1, 0, 0, 1, 1,
-0.4351858, 0.8955948, 0.01391247, 1, 0, 0, 1, 1,
-0.4344216, -0.3902439, -0.4825449, 1, 0, 0, 1, 1,
-0.4233443, -0.2985299, -2.056268, 1, 0, 0, 1, 1,
-0.4177657, 1.774214, 0.7306898, 0, 0, 0, 1, 1,
-0.4165812, -0.09381168, -1.862646, 0, 0, 0, 1, 1,
-0.4130104, -0.5400133, -2.673293, 0, 0, 0, 1, 1,
-0.4128748, 2.129134, 0.9070656, 0, 0, 0, 1, 1,
-0.4124746, 0.5858368, 0.3977974, 0, 0, 0, 1, 1,
-0.407744, -1.075704, -2.559152, 0, 0, 0, 1, 1,
-0.4058044, 0.4173641, -1.753632, 0, 0, 0, 1, 1,
-0.4045686, -0.3917134, -1.335174, 1, 1, 1, 1, 1,
-0.4021572, 0.6002488, -1.068645, 1, 1, 1, 1, 1,
-0.3917734, -0.01478245, -1.942403, 1, 1, 1, 1, 1,
-0.3894034, -1.152613, -2.143649, 1, 1, 1, 1, 1,
-0.3886982, 0.1978638, -0.7426561, 1, 1, 1, 1, 1,
-0.3852129, -1.005291, -5.05513, 1, 1, 1, 1, 1,
-0.3820215, 0.06891245, -1.107017, 1, 1, 1, 1, 1,
-0.3813447, 1.037667, 1.643753, 1, 1, 1, 1, 1,
-0.3792083, 0.3517162, -1.232053, 1, 1, 1, 1, 1,
-0.3785321, 0.9270033, -1.676869, 1, 1, 1, 1, 1,
-0.3770887, -0.1551777, -1.50727, 1, 1, 1, 1, 1,
-0.3723086, -0.87509, -2.396622, 1, 1, 1, 1, 1,
-0.3690457, -0.8314711, -3.396865, 1, 1, 1, 1, 1,
-0.3649779, -0.3074658, -1.54263, 1, 1, 1, 1, 1,
-0.3620981, 1.506693, -1.452365, 1, 1, 1, 1, 1,
-0.3586676, 1.258281, 0.875989, 0, 0, 1, 1, 1,
-0.3575402, -1.652741, -3.056778, 1, 0, 0, 1, 1,
-0.3540866, 1.514513, -0.4205724, 1, 0, 0, 1, 1,
-0.3464205, 0.3660337, -0.9038285, 1, 0, 0, 1, 1,
-0.3455642, 0.9534204, -1.504074, 1, 0, 0, 1, 1,
-0.3444977, -0.1148925, -3.236321, 1, 0, 0, 1, 1,
-0.3443772, 1.040833, -0.5128549, 0, 0, 0, 1, 1,
-0.3391722, -0.7536627, -1.831698, 0, 0, 0, 1, 1,
-0.3359737, 0.04658961, -0.8944898, 0, 0, 0, 1, 1,
-0.3348354, -1.118965, -3.180615, 0, 0, 0, 1, 1,
-0.3332371, -3.342238, -3.929016, 0, 0, 0, 1, 1,
-0.3323508, 1.519003, 0.675321, 0, 0, 0, 1, 1,
-0.3303664, -1.185209, -1.937218, 0, 0, 0, 1, 1,
-0.3302514, -2.471043, -4.344575, 1, 1, 1, 1, 1,
-0.3301652, 0.3504424, -1.908488, 1, 1, 1, 1, 1,
-0.3260854, 0.5645495, -2.215763, 1, 1, 1, 1, 1,
-0.3252589, 0.6959801, -1.730882, 1, 1, 1, 1, 1,
-0.3234911, -2.15472, -2.818537, 1, 1, 1, 1, 1,
-0.3216683, 1.194078, -1.934721, 1, 1, 1, 1, 1,
-0.3215848, -0.001763708, -1.578727, 1, 1, 1, 1, 1,
-0.3199634, -1.125135, -3.023533, 1, 1, 1, 1, 1,
-0.3161869, 1.219477, -1.126635, 1, 1, 1, 1, 1,
-0.3159025, 1.832775, 2.076241, 1, 1, 1, 1, 1,
-0.3151915, 1.731203, 0.5505711, 1, 1, 1, 1, 1,
-0.3139414, -0.5786839, -2.076516, 1, 1, 1, 1, 1,
-0.3131073, 0.459841, -2.295917, 1, 1, 1, 1, 1,
-0.3120473, -0.4376512, -2.537508, 1, 1, 1, 1, 1,
-0.3105593, 0.3010609, -1.121194, 1, 1, 1, 1, 1,
-0.3096474, -0.3509244, -2.735586, 0, 0, 1, 1, 1,
-0.3095189, -0.8969525, -5.349109, 1, 0, 0, 1, 1,
-0.3073559, 0.01503494, -1.115385, 1, 0, 0, 1, 1,
-0.3053288, -0.4226028, -2.287604, 1, 0, 0, 1, 1,
-0.3037958, 0.9537367, 0.6767448, 1, 0, 0, 1, 1,
-0.3028904, 1.243028, -1.018546, 1, 0, 0, 1, 1,
-0.3000618, 0.5574969, 0.3908912, 0, 0, 0, 1, 1,
-0.2994691, 0.1036094, -0.9606068, 0, 0, 0, 1, 1,
-0.2964396, 0.2499821, -2.316462, 0, 0, 0, 1, 1,
-0.2919062, 0.8033469, 1.485005, 0, 0, 0, 1, 1,
-0.2899129, 0.5310785, -0.7777768, 0, 0, 0, 1, 1,
-0.2893851, 1.004018, -0.007475947, 0, 0, 0, 1, 1,
-0.2854776, -0.4443724, -1.463443, 0, 0, 0, 1, 1,
-0.285166, -0.1894, -2.915435, 1, 1, 1, 1, 1,
-0.2807387, -0.4547994, -0.9835523, 1, 1, 1, 1, 1,
-0.2770318, 0.4321507, 2.140203, 1, 1, 1, 1, 1,
-0.2745499, -1.279938, -2.034262, 1, 1, 1, 1, 1,
-0.2721748, 0.5751834, 0.3055446, 1, 1, 1, 1, 1,
-0.2695169, 0.9900338, -1.276847, 1, 1, 1, 1, 1,
-0.2662868, -0.3014622, -2.558876, 1, 1, 1, 1, 1,
-0.265914, -1.222033, -3.498095, 1, 1, 1, 1, 1,
-0.264883, -0.29535, -2.767293, 1, 1, 1, 1, 1,
-0.2645268, 0.9897962, 0.7037042, 1, 1, 1, 1, 1,
-0.2645155, 0.59104, -1.394867, 1, 1, 1, 1, 1,
-0.2613361, 0.5523075, 1.533349, 1, 1, 1, 1, 1,
-0.2581803, -1.237484, -3.413628, 1, 1, 1, 1, 1,
-0.2515486, -0.2698006, -2.188995, 1, 1, 1, 1, 1,
-0.250285, -0.6547673, -4.373831, 1, 1, 1, 1, 1,
-0.249299, -1.756738, -2.605875, 0, 0, 1, 1, 1,
-0.2457651, -0.6769096, -3.485961, 1, 0, 0, 1, 1,
-0.2452691, 1.015352, 0.5211657, 1, 0, 0, 1, 1,
-0.239461, -0.4125184, -0.8406926, 1, 0, 0, 1, 1,
-0.2381202, 0.9059979, 0.1860599, 1, 0, 0, 1, 1,
-0.2375519, 0.3058667, -1.112777, 1, 0, 0, 1, 1,
-0.2367026, -1.169187, -3.437249, 0, 0, 0, 1, 1,
-0.2358783, -1.036924, -4.19002, 0, 0, 0, 1, 1,
-0.2354848, -1.446651, -3.449934, 0, 0, 0, 1, 1,
-0.2329786, -0.6893356, -2.175397, 0, 0, 0, 1, 1,
-0.2319765, 0.9130986, -1.611124, 0, 0, 0, 1, 1,
-0.231549, -1.257496, -1.687819, 0, 0, 0, 1, 1,
-0.2297177, -1.432766, -1.507508, 0, 0, 0, 1, 1,
-0.2273663, -0.1192969, -2.293517, 1, 1, 1, 1, 1,
-0.2219204, -0.6620765, -1.378383, 1, 1, 1, 1, 1,
-0.2211462, -0.8882303, -4.370411, 1, 1, 1, 1, 1,
-0.2201805, 0.4106178, -0.04745118, 1, 1, 1, 1, 1,
-0.219405, 2.048625, -1.764843, 1, 1, 1, 1, 1,
-0.2180952, 0.8192383, 0.7844549, 1, 1, 1, 1, 1,
-0.2180553, -0.52066, -4.129545, 1, 1, 1, 1, 1,
-0.214935, -0.3299784, -3.061439, 1, 1, 1, 1, 1,
-0.212315, -0.270207, -3.046798, 1, 1, 1, 1, 1,
-0.2097143, -0.4365394, -1.699669, 1, 1, 1, 1, 1,
-0.2095149, 0.4985913, 2.148629, 1, 1, 1, 1, 1,
-0.2056463, 0.5951635, -0.1575122, 1, 1, 1, 1, 1,
-0.2052765, 0.1013999, -0.473454, 1, 1, 1, 1, 1,
-0.2036332, 0.5081171, -0.6021632, 1, 1, 1, 1, 1,
-0.2028761, -0.8369142, -2.819344, 1, 1, 1, 1, 1,
-0.2012877, 0.7533903, -0.06888905, 0, 0, 1, 1, 1,
-0.1985269, 2.244343, -1.266303, 1, 0, 0, 1, 1,
-0.197459, 1.213328, -0.2819751, 1, 0, 0, 1, 1,
-0.1963277, 1.007171, 0.1366892, 1, 0, 0, 1, 1,
-0.192201, 0.3622277, -0.05510465, 1, 0, 0, 1, 1,
-0.1920624, -0.3359892, -1.752908, 1, 0, 0, 1, 1,
-0.1870313, -1.899556, -3.6139, 0, 0, 0, 1, 1,
-0.183902, 1.044329, 1.793918, 0, 0, 0, 1, 1,
-0.1827606, 0.314678, -2.265271, 0, 0, 0, 1, 1,
-0.1743796, -0.5693174, -3.198113, 0, 0, 0, 1, 1,
-0.1726096, -1.250121, -3.214715, 0, 0, 0, 1, 1,
-0.1722206, 0.2349648, 1.089395, 0, 0, 0, 1, 1,
-0.1709824, 0.6544822, -0.06054989, 0, 0, 0, 1, 1,
-0.1702088, -0.7105967, -3.760979, 1, 1, 1, 1, 1,
-0.1680817, 1.164802, -0.3897769, 1, 1, 1, 1, 1,
-0.1626715, -0.8199423, -2.824715, 1, 1, 1, 1, 1,
-0.1624119, -0.1184093, -3.15302, 1, 1, 1, 1, 1,
-0.1608307, -1.420834, -2.544704, 1, 1, 1, 1, 1,
-0.1587484, 0.8940049, -0.5659435, 1, 1, 1, 1, 1,
-0.1570352, -0.9168186, -3.919089, 1, 1, 1, 1, 1,
-0.1539792, -0.9151603, -4.573387, 1, 1, 1, 1, 1,
-0.1485254, -0.7076969, -2.877798, 1, 1, 1, 1, 1,
-0.146719, 0.264698, 0.254484, 1, 1, 1, 1, 1,
-0.1452907, 0.2536376, -0.4389199, 1, 1, 1, 1, 1,
-0.1413053, -0.4721979, -2.847978, 1, 1, 1, 1, 1,
-0.1411535, -0.7005056, -2.656451, 1, 1, 1, 1, 1,
-0.140902, 0.8752649, -0.3040951, 1, 1, 1, 1, 1,
-0.1382336, -0.09937503, -0.9786167, 1, 1, 1, 1, 1,
-0.1381855, -0.6950501, -1.878941, 0, 0, 1, 1, 1,
-0.1331821, 0.7413474, -1.09781, 1, 0, 0, 1, 1,
-0.1306402, 0.3127559, -2.413401, 1, 0, 0, 1, 1,
-0.130536, -0.3967366, -2.8235, 1, 0, 0, 1, 1,
-0.1296, -1.41901, -1.555669, 1, 0, 0, 1, 1,
-0.1280062, -0.6002775, -2.66102, 1, 0, 0, 1, 1,
-0.1165081, 1.112366, -0.8600046, 0, 0, 0, 1, 1,
-0.1131221, 0.4329922, 0.6233289, 0, 0, 0, 1, 1,
-0.1124351, 0.176442, -0.9953939, 0, 0, 0, 1, 1,
-0.1068702, 0.000906299, -1.812626, 0, 0, 0, 1, 1,
-0.1038143, -1.974312, -2.947406, 0, 0, 0, 1, 1,
-0.1037002, 0.4083879, 0.3684757, 0, 0, 0, 1, 1,
-0.09359215, 0.176498, -0.9331803, 0, 0, 0, 1, 1,
-0.09259668, -0.2465555, -2.054982, 1, 1, 1, 1, 1,
-0.08912672, -1.082142, -3.469918, 1, 1, 1, 1, 1,
-0.08854009, -0.4546622, -3.007911, 1, 1, 1, 1, 1,
-0.0862736, -2.144536, -5.237177, 1, 1, 1, 1, 1,
-0.08026896, 0.3456608, 0.3672066, 1, 1, 1, 1, 1,
-0.07916298, 0.3705513, 0.9179702, 1, 1, 1, 1, 1,
-0.07472885, -0.5988731, -0.9770718, 1, 1, 1, 1, 1,
-0.07156366, -0.5666588, -3.207419, 1, 1, 1, 1, 1,
-0.06569462, 1.177496, 1.155913, 1, 1, 1, 1, 1,
-0.06416749, -1.741699, -3.843123, 1, 1, 1, 1, 1,
-0.06357027, 0.937278, -0.5185134, 1, 1, 1, 1, 1,
-0.06261309, 0.5874776, -1.644194, 1, 1, 1, 1, 1,
-0.05960932, 1.686796, -0.8192688, 1, 1, 1, 1, 1,
-0.05246352, 2.492427, -0.04674999, 1, 1, 1, 1, 1,
-0.05200266, -0.3307992, -3.006469, 1, 1, 1, 1, 1,
-0.05186063, -1.114448, -2.744221, 0, 0, 1, 1, 1,
-0.04803908, -2.226116, -1.367877, 1, 0, 0, 1, 1,
-0.04429974, 0.7002788, 1.559236, 1, 0, 0, 1, 1,
-0.04239174, 0.7253014, 0.9497582, 1, 0, 0, 1, 1,
-0.04033592, 2.937895, 2.181738, 1, 0, 0, 1, 1,
-0.03530115, -1.362561, -3.749233, 1, 0, 0, 1, 1,
-0.03484995, 0.8887442, -1.299614, 0, 0, 0, 1, 1,
-0.03434917, 0.2709509, -0.5383984, 0, 0, 0, 1, 1,
-0.03401753, -0.1988764, -2.218906, 0, 0, 0, 1, 1,
-0.03184921, 0.2096186, 0.2156633, 0, 0, 0, 1, 1,
-0.03153424, 0.223964, 0.9023163, 0, 0, 0, 1, 1,
-0.03004518, -0.5413209, -1.576355, 0, 0, 0, 1, 1,
-0.02878744, -0.01267401, -2.79117, 0, 0, 0, 1, 1,
-0.02740429, 1.152135, 0.4256611, 1, 1, 1, 1, 1,
-0.02645631, 0.308895, -1.54239, 1, 1, 1, 1, 1,
-0.02413771, -0.7218361, -1.911141, 1, 1, 1, 1, 1,
-0.02220908, 0.07488982, -0.7050108, 1, 1, 1, 1, 1,
-0.0213452, -2.349814, -2.064093, 1, 1, 1, 1, 1,
-0.01957313, -0.03392595, -3.544028, 1, 1, 1, 1, 1,
-0.01831881, -0.149676, -2.579359, 1, 1, 1, 1, 1,
-0.01797393, 0.4067941, 0.5258328, 1, 1, 1, 1, 1,
-0.01465414, 0.7282993, 0.2656606, 1, 1, 1, 1, 1,
-0.01396376, 0.6844289, 0.0660018, 1, 1, 1, 1, 1,
-0.01346573, -0.3690934, -1.094008, 1, 1, 1, 1, 1,
-0.0116826, -1.821405, -3.519558, 1, 1, 1, 1, 1,
-0.007034887, 0.04168904, -0.1968405, 1, 1, 1, 1, 1,
-0.005986372, -0.071029, -3.483359, 1, 1, 1, 1, 1,
-0.00426232, -1.544634, -1.810817, 1, 1, 1, 1, 1,
-0.003883515, -1.024629, -1.856771, 0, 0, 1, 1, 1,
-0.002947986, -0.7276187, -3.995303, 1, 0, 0, 1, 1,
0.01055768, -0.4524857, 2.550248, 1, 0, 0, 1, 1,
0.01283465, 0.5924093, 0.1411473, 1, 0, 0, 1, 1,
0.01336389, 1.486397, 0.008084535, 1, 0, 0, 1, 1,
0.01784194, 0.8341616, 0.4579336, 1, 0, 0, 1, 1,
0.01829394, 2.419675, -1.46891, 0, 0, 0, 1, 1,
0.02825081, -0.5696819, 3.362589, 0, 0, 0, 1, 1,
0.02888106, 1.609976, -0.8682012, 0, 0, 0, 1, 1,
0.0358054, -0.3068545, 1.96844, 0, 0, 0, 1, 1,
0.0452521, -0.6994893, 4.527206, 0, 0, 0, 1, 1,
0.04648905, -0.3155234, 3.351645, 0, 0, 0, 1, 1,
0.05041321, 0.05611849, -0.7444468, 0, 0, 0, 1, 1,
0.05303252, 0.253649, 0.799252, 1, 1, 1, 1, 1,
0.0540845, 0.5951324, -0.3107061, 1, 1, 1, 1, 1,
0.05682859, -0.8991965, 2.38822, 1, 1, 1, 1, 1,
0.05718, -2.009136, 3.791364, 1, 1, 1, 1, 1,
0.05873426, -0.3041629, 2.441423, 1, 1, 1, 1, 1,
0.05956184, -1.420453, 2.568603, 1, 1, 1, 1, 1,
0.06243097, -0.1150607, 3.525648, 1, 1, 1, 1, 1,
0.07371822, -0.6210091, 4.182784, 1, 1, 1, 1, 1,
0.07447986, -0.5073063, 2.145731, 1, 1, 1, 1, 1,
0.07494172, 0.2890239, -1.866904, 1, 1, 1, 1, 1,
0.07744091, -0.9028707, 3.299782, 1, 1, 1, 1, 1,
0.07942986, 0.02375758, 0.7706091, 1, 1, 1, 1, 1,
0.08006941, 1.265632, 0.7379348, 1, 1, 1, 1, 1,
0.08109126, -0.4213163, 1.560475, 1, 1, 1, 1, 1,
0.08649438, 0.998181, 1.964769, 1, 1, 1, 1, 1,
0.08655377, 0.6684524, 0.09453844, 0, 0, 1, 1, 1,
0.08863806, -0.07593609, 2.454614, 1, 0, 0, 1, 1,
0.09298773, -0.7875773, 2.791723, 1, 0, 0, 1, 1,
0.09329069, 0.1069435, -0.7048449, 1, 0, 0, 1, 1,
0.09601784, 0.4134693, -0.4934804, 1, 0, 0, 1, 1,
0.1032866, -0.6985062, 3.459964, 1, 0, 0, 1, 1,
0.1040689, 2.136965, 0.130347, 0, 0, 0, 1, 1,
0.1051779, -1.214547, 3.504019, 0, 0, 0, 1, 1,
0.1119338, -0.3071831, 2.788096, 0, 0, 0, 1, 1,
0.1132242, 1.852868, 0.1993387, 0, 0, 0, 1, 1,
0.1143463, 0.1327049, 0.1262643, 0, 0, 0, 1, 1,
0.1151597, -0.6683402, 1.569227, 0, 0, 0, 1, 1,
0.1188467, 0.5819011, -0.2496221, 0, 0, 0, 1, 1,
0.1225146, -2.348946, 3.652149, 1, 1, 1, 1, 1,
0.1271813, -1.732715, 1.589392, 1, 1, 1, 1, 1,
0.1334804, 1.74292, -2.001602, 1, 1, 1, 1, 1,
0.1415091, -1.035365, 2.679138, 1, 1, 1, 1, 1,
0.1419794, 0.522317, 0.2020475, 1, 1, 1, 1, 1,
0.1428111, -0.2977339, 2.53149, 1, 1, 1, 1, 1,
0.1456707, -0.5495694, 2.221662, 1, 1, 1, 1, 1,
0.1522251, 0.5671224, -0.1659174, 1, 1, 1, 1, 1,
0.158966, 0.4542859, 0.5491157, 1, 1, 1, 1, 1,
0.1673663, -0.3851455, 1.425621, 1, 1, 1, 1, 1,
0.1681174, 0.4161355, 1.090974, 1, 1, 1, 1, 1,
0.1685812, -0.06690887, 2.479809, 1, 1, 1, 1, 1,
0.1709267, 0.543276, 0.04876062, 1, 1, 1, 1, 1,
0.173316, 1.855137, 0.3765853, 1, 1, 1, 1, 1,
0.1751113, 0.2874096, 0.7501638, 1, 1, 1, 1, 1,
0.1825058, -1.947136, 1.696542, 0, 0, 1, 1, 1,
0.1850274, 2.024058, 1.010754, 1, 0, 0, 1, 1,
0.1875369, -0.04569281, 2.752989, 1, 0, 0, 1, 1,
0.1909222, 0.4500783, -1.310058, 1, 0, 0, 1, 1,
0.1922534, -0.6323242, 4.055316, 1, 0, 0, 1, 1,
0.1926448, 0.3391124, -0.5494066, 1, 0, 0, 1, 1,
0.1948387, 0.1874712, 1.058552, 0, 0, 0, 1, 1,
0.1981968, 1.39286, -0.2205362, 0, 0, 0, 1, 1,
0.199374, -0.832566, 1.353626, 0, 0, 0, 1, 1,
0.1994933, -1.159097, 4.2684, 0, 0, 0, 1, 1,
0.2010608, 1.729521, 1.613763, 0, 0, 0, 1, 1,
0.2015998, 0.04377373, 1.295013, 0, 0, 0, 1, 1,
0.2034303, 0.883325, -0.08922296, 0, 0, 0, 1, 1,
0.2095863, 0.9950424, 0.0338847, 1, 1, 1, 1, 1,
0.2116277, -1.610184, 2.277013, 1, 1, 1, 1, 1,
0.2122889, -0.6121259, 2.317662, 1, 1, 1, 1, 1,
0.2146179, 0.1623221, 1.255627, 1, 1, 1, 1, 1,
0.2174328, 0.7186318, 0.8669436, 1, 1, 1, 1, 1,
0.217435, 1.488035, 2.218569, 1, 1, 1, 1, 1,
0.2221727, -0.007096574, -0.1304072, 1, 1, 1, 1, 1,
0.2293369, -0.196711, 2.286973, 1, 1, 1, 1, 1,
0.2304541, 1.374586, 1.120263, 1, 1, 1, 1, 1,
0.2374349, 0.3606378, -0.7591533, 1, 1, 1, 1, 1,
0.2395074, -0.6929032, 3.096532, 1, 1, 1, 1, 1,
0.2404246, 1.602707, 1.626985, 1, 1, 1, 1, 1,
0.2439813, 0.9117866, 0.3839966, 1, 1, 1, 1, 1,
0.244748, 0.8733346, 0.4926161, 1, 1, 1, 1, 1,
0.2456024, -0.8837138, 2.589916, 1, 1, 1, 1, 1,
0.2458084, -1.026883, 3.630275, 0, 0, 1, 1, 1,
0.2466184, 1.023448, -1.058395, 1, 0, 0, 1, 1,
0.2526708, 1.019227, -0.3092549, 1, 0, 0, 1, 1,
0.254999, 0.2796947, -0.7591745, 1, 0, 0, 1, 1,
0.255209, 1.219677, 0.08437926, 1, 0, 0, 1, 1,
0.259865, 0.4299952, -2.490693, 1, 0, 0, 1, 1,
0.2659008, -1.49273, 4.293389, 0, 0, 0, 1, 1,
0.2663511, -0.2072999, 3.686932, 0, 0, 0, 1, 1,
0.2686214, -1.015666, 2.422378, 0, 0, 0, 1, 1,
0.2703408, 0.8741403, -0.3419887, 0, 0, 0, 1, 1,
0.2705166, 1.077272, 0.5153239, 0, 0, 0, 1, 1,
0.2724196, -1.309824, 4.730888, 0, 0, 0, 1, 1,
0.2786923, 2.085061, -1.66704, 0, 0, 0, 1, 1,
0.2788642, 0.5344145, 1.119078, 1, 1, 1, 1, 1,
0.283153, -0.7793428, 4.351961, 1, 1, 1, 1, 1,
0.2848497, -0.9529871, 1.485313, 1, 1, 1, 1, 1,
0.2868351, -0.2063447, 3.091965, 1, 1, 1, 1, 1,
0.2878541, 0.6043495, 0.4919927, 1, 1, 1, 1, 1,
0.2898783, -1.167935, 2.81796, 1, 1, 1, 1, 1,
0.290214, 0.7544123, 0.05404267, 1, 1, 1, 1, 1,
0.2911476, -1.028137, 2.21476, 1, 1, 1, 1, 1,
0.2930618, -0.3389593, 3.103677, 1, 1, 1, 1, 1,
0.2931753, -0.05760441, 2.626877, 1, 1, 1, 1, 1,
0.301861, 0.03415787, 1.138306, 1, 1, 1, 1, 1,
0.3109638, 1.224875, -0.8512769, 1, 1, 1, 1, 1,
0.3141194, -0.673201, 1.433487, 1, 1, 1, 1, 1,
0.3157032, 0.01575224, 3.32749, 1, 1, 1, 1, 1,
0.3183996, 0.2702073, -0.7677104, 1, 1, 1, 1, 1,
0.3240378, -0.3010826, 2.987838, 0, 0, 1, 1, 1,
0.3287822, -0.6714968, 5.19496, 1, 0, 0, 1, 1,
0.3318985, -0.4982626, 1.446552, 1, 0, 0, 1, 1,
0.3423271, 0.3043894, -0.5683064, 1, 0, 0, 1, 1,
0.3437582, -0.830913, 4.83111, 1, 0, 0, 1, 1,
0.3460582, 1.000648, 1.609433, 1, 0, 0, 1, 1,
0.3473208, -1.393085, 2.640112, 0, 0, 0, 1, 1,
0.356348, -1.01608, 0.04335855, 0, 0, 0, 1, 1,
0.3573278, -0.4730708, 2.460625, 0, 0, 0, 1, 1,
0.3589304, -0.1254807, 2.709743, 0, 0, 0, 1, 1,
0.3638086, -1.965466, 4.000307, 0, 0, 0, 1, 1,
0.3648625, 0.1792611, 0.614621, 0, 0, 0, 1, 1,
0.3667104, -0.4818982, 2.682354, 0, 0, 0, 1, 1,
0.3688695, -1.981811, 1.609958, 1, 1, 1, 1, 1,
0.3701738, -3.170458, 3.94474, 1, 1, 1, 1, 1,
0.3751811, -0.2886512, 1.944705, 1, 1, 1, 1, 1,
0.3764643, -0.3586188, 2.189864, 1, 1, 1, 1, 1,
0.3993661, 0.3189968, -0.297953, 1, 1, 1, 1, 1,
0.3997146, -0.04758727, 1.632692, 1, 1, 1, 1, 1,
0.4046424, -1.393814, 3.821255, 1, 1, 1, 1, 1,
0.4092137, 0.1435268, 1.723937, 1, 1, 1, 1, 1,
0.4109831, 2.234771, 0.2710696, 1, 1, 1, 1, 1,
0.4123238, 0.2438253, 0.3772356, 1, 1, 1, 1, 1,
0.4150981, 0.02110801, 2.342918, 1, 1, 1, 1, 1,
0.4151668, -1.342166, 1.576665, 1, 1, 1, 1, 1,
0.4221126, 1.016324, 1.325062, 1, 1, 1, 1, 1,
0.422448, -0.781643, 4.075035, 1, 1, 1, 1, 1,
0.4271758, 0.9559262, 1.033833, 1, 1, 1, 1, 1,
0.4383099, -0.3143978, 2.862296, 0, 0, 1, 1, 1,
0.4386813, -1.099678, 2.597436, 1, 0, 0, 1, 1,
0.4404087, 0.4990124, 2.284609, 1, 0, 0, 1, 1,
0.4404827, 0.05054173, 0.3425357, 1, 0, 0, 1, 1,
0.4537809, -1.277478, 1.71481, 1, 0, 0, 1, 1,
0.4540519, -1.687284, 1.390262, 1, 0, 0, 1, 1,
0.4594233, 0.7707586, 1.106458, 0, 0, 0, 1, 1,
0.463725, -0.305921, 2.227136, 0, 0, 0, 1, 1,
0.4697488, -0.542742, 1.810653, 0, 0, 0, 1, 1,
0.4706043, 1.182058, -0.5124465, 0, 0, 0, 1, 1,
0.4710021, -0.6874977, 5.5185, 0, 0, 0, 1, 1,
0.4740787, -1.210831, 3.174298, 0, 0, 0, 1, 1,
0.4830279, 1.225462, -0.4213832, 0, 0, 0, 1, 1,
0.4854672, -0.7674058, 3.10976, 1, 1, 1, 1, 1,
0.4878705, 0.1655237, 1.603758, 1, 1, 1, 1, 1,
0.4886807, -0.914807, 1.501988, 1, 1, 1, 1, 1,
0.4888776, -2.380033, 2.685642, 1, 1, 1, 1, 1,
0.4973632, 2.444982, 0.3648224, 1, 1, 1, 1, 1,
0.5050898, -0.03454399, 0.5869707, 1, 1, 1, 1, 1,
0.5110388, 0.1189642, 1.988582, 1, 1, 1, 1, 1,
0.5131274, 0.9372801, 0.7577831, 1, 1, 1, 1, 1,
0.5155605, 1.4095, -0.8748813, 1, 1, 1, 1, 1,
0.515747, -1.553389, 1.982969, 1, 1, 1, 1, 1,
0.5181946, -0.4443012, 2.603338, 1, 1, 1, 1, 1,
0.5193345, -0.5049418, 4.361855, 1, 1, 1, 1, 1,
0.5194713, 1.107622, -1.351168, 1, 1, 1, 1, 1,
0.5203866, 0.9142821, 1.037652, 1, 1, 1, 1, 1,
0.5212659, -1.157949, 4.878333, 1, 1, 1, 1, 1,
0.5282781, 0.0373152, 1.120458, 0, 0, 1, 1, 1,
0.5303151, 0.6506276, -0.1596787, 1, 0, 0, 1, 1,
0.5362203, 0.6058904, 2.400814, 1, 0, 0, 1, 1,
0.5369364, -0.517677, 2.536183, 1, 0, 0, 1, 1,
0.5468968, 1.03493, -0.6045318, 1, 0, 0, 1, 1,
0.5485941, 1.291137, -0.06446413, 1, 0, 0, 1, 1,
0.5497894, 0.4181318, 2.183585, 0, 0, 0, 1, 1,
0.5532803, -0.2209183, 3.444828, 0, 0, 0, 1, 1,
0.5573654, 1.470009, 0.5694136, 0, 0, 0, 1, 1,
0.5593796, -2.507609, 3.172199, 0, 0, 0, 1, 1,
0.5606292, 0.28567, 2.071329, 0, 0, 0, 1, 1,
0.5612883, 1.039163, -0.1649902, 0, 0, 0, 1, 1,
0.5639538, 1.161255, -0.6181964, 0, 0, 0, 1, 1,
0.5650231, 0.02861822, 1.346189, 1, 1, 1, 1, 1,
0.5651978, 0.1052946, 0.8763569, 1, 1, 1, 1, 1,
0.5672383, -1.584387, 4.627716, 1, 1, 1, 1, 1,
0.5677954, -0.8537465, 4.531177, 1, 1, 1, 1, 1,
0.5741817, 0.5103313, 1.109421, 1, 1, 1, 1, 1,
0.581177, -0.5399066, 2.345384, 1, 1, 1, 1, 1,
0.5833142, -0.708746, 1.591744, 1, 1, 1, 1, 1,
0.5850126, 1.275131, 0.00959321, 1, 1, 1, 1, 1,
0.5860822, 0.07222126, 1.729183, 1, 1, 1, 1, 1,
0.5961682, 0.1529215, 0.001225011, 1, 1, 1, 1, 1,
0.5965307, -1.652689, 3.694536, 1, 1, 1, 1, 1,
0.5981687, 1.345692, 1.391562, 1, 1, 1, 1, 1,
0.6051641, 0.2003325, 0.5283978, 1, 1, 1, 1, 1,
0.6052884, 0.5516103, 0.0738302, 1, 1, 1, 1, 1,
0.6087905, 0.6488978, 2.177692, 1, 1, 1, 1, 1,
0.6120467, 0.2369605, 2.240749, 0, 0, 1, 1, 1,
0.6185823, 1.281994, 0.1646833, 1, 0, 0, 1, 1,
0.6199119, 0.08487266, 0.3087172, 1, 0, 0, 1, 1,
0.6210728, -0.2043251, 1.98003, 1, 0, 0, 1, 1,
0.622485, 0.3062049, 1.072338, 1, 0, 0, 1, 1,
0.631223, 0.3673164, 1.380199, 1, 0, 0, 1, 1,
0.6329266, -0.8910217, 3.470522, 0, 0, 0, 1, 1,
0.6334201, -2.229041, 2.927731, 0, 0, 0, 1, 1,
0.6344544, 0.5308266, 0.5775052, 0, 0, 0, 1, 1,
0.6394534, 0.2924711, -0.1253699, 0, 0, 0, 1, 1,
0.6394958, 2.055036, 1.352743, 0, 0, 0, 1, 1,
0.6445474, -1.657349, 2.832802, 0, 0, 0, 1, 1,
0.6515667, -1.180608, 2.354211, 0, 0, 0, 1, 1,
0.6537741, -0.3937656, 2.579445, 1, 1, 1, 1, 1,
0.6539353, -1.428166, 4.191103, 1, 1, 1, 1, 1,
0.6634929, -0.6068625, 1.34317, 1, 1, 1, 1, 1,
0.6654902, -0.8554105, 2.724319, 1, 1, 1, 1, 1,
0.6658652, 1.989874, 0.3369783, 1, 1, 1, 1, 1,
0.6663709, 1.425512, 1.451212, 1, 1, 1, 1, 1,
0.6665457, -0.941764, 0.7649491, 1, 1, 1, 1, 1,
0.6686708, 0.1779687, -0.1503812, 1, 1, 1, 1, 1,
0.6813712, -1.707065, 1.331358, 1, 1, 1, 1, 1,
0.6892695, 0.3525831, 0.6362736, 1, 1, 1, 1, 1,
0.6932572, 0.8372152, 1.058813, 1, 1, 1, 1, 1,
0.6982708, -1.506711, 2.038669, 1, 1, 1, 1, 1,
0.7007728, -0.6517426, 2.422713, 1, 1, 1, 1, 1,
0.7052354, -0.1914277, 0.6837416, 1, 1, 1, 1, 1,
0.705784, -0.0006461534, 2.437689, 1, 1, 1, 1, 1,
0.7088892, 1.434781, 0.5191155, 0, 0, 1, 1, 1,
0.7100244, 0.8397636, 2.374747, 1, 0, 0, 1, 1,
0.710301, 0.3596876, 1.031179, 1, 0, 0, 1, 1,
0.7145389, 1.555061, 0.2284169, 1, 0, 0, 1, 1,
0.7174857, 0.1856479, 0.02572272, 1, 0, 0, 1, 1,
0.7206715, 1.732345, 0.09179422, 1, 0, 0, 1, 1,
0.723245, -0.4459448, 2.737746, 0, 0, 0, 1, 1,
0.7235407, -0.5142979, 1.711641, 0, 0, 0, 1, 1,
0.7288206, -0.5269932, 2.823384, 0, 0, 0, 1, 1,
0.7291369, -1.506151, 2.963332, 0, 0, 0, 1, 1,
0.7351503, 0.5901321, 1.841612, 0, 0, 0, 1, 1,
0.7365019, 2.699033, -0.6365563, 0, 0, 0, 1, 1,
0.737509, -1.252537, 2.293906, 0, 0, 0, 1, 1,
0.7385677, 0.2869662, 1.796669, 1, 1, 1, 1, 1,
0.7394369, 0.2348003, 0.4328729, 1, 1, 1, 1, 1,
0.7406366, 0.3787171, 1.823471, 1, 1, 1, 1, 1,
0.7408351, -0.1867592, 2.053402, 1, 1, 1, 1, 1,
0.7432272, 0.7253087, -1.15733, 1, 1, 1, 1, 1,
0.7467546, -1.393119, 3.451953, 1, 1, 1, 1, 1,
0.7654608, -0.09711002, 2.787263, 1, 1, 1, 1, 1,
0.7662462, -1.156763, 2.943842, 1, 1, 1, 1, 1,
0.7663265, -0.4237514, 0.2346847, 1, 1, 1, 1, 1,
0.7663976, 0.3431194, 0.206148, 1, 1, 1, 1, 1,
0.7688729, 0.1413127, 1.762308, 1, 1, 1, 1, 1,
0.7708335, 1.177722, 2.091475, 1, 1, 1, 1, 1,
0.7714356, -0.5258279, 4.07215, 1, 1, 1, 1, 1,
0.7763925, -0.712755, 1.90051, 1, 1, 1, 1, 1,
0.7810624, -0.4008386, 3.763862, 1, 1, 1, 1, 1,
0.7850168, 0.2812544, 1.851482, 0, 0, 1, 1, 1,
0.7904576, 1.297256, 1.566733, 1, 0, 0, 1, 1,
0.7939056, 0.9868522, -1.154693, 1, 0, 0, 1, 1,
0.8034039, 0.02835375, 3.281819, 1, 0, 0, 1, 1,
0.8155127, -0.3840259, 2.702353, 1, 0, 0, 1, 1,
0.8212413, 0.3113732, 1.819372, 1, 0, 0, 1, 1,
0.8237963, 0.01836708, 0.9192857, 0, 0, 0, 1, 1,
0.8255504, 0.2744901, 0.9443084, 0, 0, 0, 1, 1,
0.8276978, 1.344304, -0.2241256, 0, 0, 0, 1, 1,
0.8277112, -0.09158964, 1.616462, 0, 0, 0, 1, 1,
0.8304786, 0.102795, 1.305157, 0, 0, 0, 1, 1,
0.8363261, 0.2382387, 1.925532, 0, 0, 0, 1, 1,
0.8414295, -0.1180901, -0.1309876, 0, 0, 0, 1, 1,
0.8437845, 1.74351, 0.7295464, 1, 1, 1, 1, 1,
0.8441135, -0.4233375, 2.15666, 1, 1, 1, 1, 1,
0.8465278, -0.3808343, 2.953904, 1, 1, 1, 1, 1,
0.8486955, 1.061527, 0.1301177, 1, 1, 1, 1, 1,
0.8537896, 0.74441, -0.8357942, 1, 1, 1, 1, 1,
0.8598649, 0.7552994, 1.815568, 1, 1, 1, 1, 1,
0.8606585, -0.1122094, 1.587077, 1, 1, 1, 1, 1,
0.8627632, -0.5827273, 2.527684, 1, 1, 1, 1, 1,
0.8633716, -0.7203051, 1.702454, 1, 1, 1, 1, 1,
0.8639635, 1.117158, -0.5273172, 1, 1, 1, 1, 1,
0.8640078, -0.7809942, 1.528404, 1, 1, 1, 1, 1,
0.8682609, 0.5793319, -0.8446941, 1, 1, 1, 1, 1,
0.872246, 0.5614524, 0.8439385, 1, 1, 1, 1, 1,
0.8758546, 1.692878, -0.01719298, 1, 1, 1, 1, 1,
0.8774152, 0.8001698, 2.361716, 1, 1, 1, 1, 1,
0.8813823, -1.062353, 0.504913, 0, 0, 1, 1, 1,
0.8893837, 0.5260311, 0.9729146, 1, 0, 0, 1, 1,
0.8898309, 1.132422, 1.088814, 1, 0, 0, 1, 1,
0.8974697, -0.4189784, 2.520088, 1, 0, 0, 1, 1,
0.9003041, -0.2153829, 1.217839, 1, 0, 0, 1, 1,
0.904919, 1.008503, 0.6032484, 1, 0, 0, 1, 1,
0.9060267, 0.0411517, 0.5391471, 0, 0, 0, 1, 1,
0.9064206, 1.755223, 1.40362, 0, 0, 0, 1, 1,
0.9070796, 0.8459479, -0.1293, 0, 0, 0, 1, 1,
0.9087453, -0.2513151, 1.696316, 0, 0, 0, 1, 1,
0.9129145, -0.4717789, 1.056082, 0, 0, 0, 1, 1,
0.9178053, -1.205681, 2.173828, 0, 0, 0, 1, 1,
0.9222611, 0.6930681, 0.8556655, 0, 0, 0, 1, 1,
0.9255609, -1.191481, 3.647542, 1, 1, 1, 1, 1,
0.9291582, -0.4569829, 1.815106, 1, 1, 1, 1, 1,
0.9308856, -0.1152848, 2.408426, 1, 1, 1, 1, 1,
0.9331509, -1.343964, 2.891882, 1, 1, 1, 1, 1,
0.9342312, 0.6496742, 1.18336, 1, 1, 1, 1, 1,
0.9406286, -1.199589, 1.147904, 1, 1, 1, 1, 1,
0.9454263, 1.158215, 1.911337, 1, 1, 1, 1, 1,
0.9471081, 0.3154631, -0.2603128, 1, 1, 1, 1, 1,
0.9502191, -0.2265086, 2.451683, 1, 1, 1, 1, 1,
0.953046, -0.4822084, 0.6907152, 1, 1, 1, 1, 1,
0.9544241, 1.354896, 1.976534, 1, 1, 1, 1, 1,
0.9544498, 0.9873438, 2.157134, 1, 1, 1, 1, 1,
0.9566298, 0.4949848, 0.2423201, 1, 1, 1, 1, 1,
0.9573916, 0.097201, 3.083381, 1, 1, 1, 1, 1,
0.9576099, 0.8253815, -0.2520773, 1, 1, 1, 1, 1,
0.9652369, 0.8142806, 0.282822, 0, 0, 1, 1, 1,
0.9753547, 1.669477, -0.07275827, 1, 0, 0, 1, 1,
0.9774577, 0.5045015, -0.2776277, 1, 0, 0, 1, 1,
0.9865987, 1.101711, 0.6901572, 1, 0, 0, 1, 1,
0.9886436, 0.3452821, 1.687212, 1, 0, 0, 1, 1,
0.9970164, -0.6707515, 1.622812, 1, 0, 0, 1, 1,
0.998688, 0.1059715, 0.6800703, 0, 0, 0, 1, 1,
0.9987598, 0.3253942, 1.650573, 0, 0, 0, 1, 1,
1.004095, 0.02463908, 0.9474197, 0, 0, 0, 1, 1,
1.020577, 2.693366, -0.776511, 0, 0, 0, 1, 1,
1.020671, 2.178041, -0.0457935, 0, 0, 0, 1, 1,
1.031246, -0.343695, 1.944614, 0, 0, 0, 1, 1,
1.032076, -0.7974191, 4.267037, 0, 0, 0, 1, 1,
1.03233, -0.5905671, 0.6657779, 1, 1, 1, 1, 1,
1.039241, -1.743661, 2.120909, 1, 1, 1, 1, 1,
1.046661, -0.9516614, 2.050923, 1, 1, 1, 1, 1,
1.049239, -2.013051, 2.853475, 1, 1, 1, 1, 1,
1.053924, -2.49517, 2.164378, 1, 1, 1, 1, 1,
1.059352, 0.1505282, 1.745178, 1, 1, 1, 1, 1,
1.063873, -0.4800908, 0.5563685, 1, 1, 1, 1, 1,
1.068198, 0.1517111, 0.8320022, 1, 1, 1, 1, 1,
1.074919, 1.296537, 0.6138493, 1, 1, 1, 1, 1,
1.076791, -2.330738, 3.724695, 1, 1, 1, 1, 1,
1.083638, -0.01707922, 2.089307, 1, 1, 1, 1, 1,
1.085793, -1.488264, 1.554253, 1, 1, 1, 1, 1,
1.092786, -0.09976704, 1.128267, 1, 1, 1, 1, 1,
1.092932, 0.1635876, 0.8988897, 1, 1, 1, 1, 1,
1.095062, 0.6837423, 0.9984145, 1, 1, 1, 1, 1,
1.101948, -0.1103449, -0.1177024, 0, 0, 1, 1, 1,
1.106271, -1.408178, 1.941747, 1, 0, 0, 1, 1,
1.117456, 0.6566303, 1.054962, 1, 0, 0, 1, 1,
1.118649, -0.3582601, 1.357819, 1, 0, 0, 1, 1,
1.119389, 0.1637569, 3.008994, 1, 0, 0, 1, 1,
1.119603, -1.411158, 1.601009, 1, 0, 0, 1, 1,
1.121421, 0.7273059, 1.70353, 0, 0, 0, 1, 1,
1.128944, -0.2932587, 1.895374, 0, 0, 0, 1, 1,
1.138341, -0.3959149, 3.847953, 0, 0, 0, 1, 1,
1.151245, 0.8522693, -0.172624, 0, 0, 0, 1, 1,
1.154544, -0.7537109, 3.656719, 0, 0, 0, 1, 1,
1.162203, 0.2725818, 0.7785505, 0, 0, 0, 1, 1,
1.167013, 0.8855741, 1.399517, 0, 0, 0, 1, 1,
1.170879, -0.7736837, 2.86917, 1, 1, 1, 1, 1,
1.175648, 0.01056836, 2.166189, 1, 1, 1, 1, 1,
1.177048, -0.007607298, -0.2948157, 1, 1, 1, 1, 1,
1.178081, -2.548395, 4.624958, 1, 1, 1, 1, 1,
1.185882, -0.1947911, 1.499648, 1, 1, 1, 1, 1,
1.18636, -0.1391483, 0.1602516, 1, 1, 1, 1, 1,
1.186421, -0.3282725, 3.844424, 1, 1, 1, 1, 1,
1.198673, 0.5694385, 1.608185, 1, 1, 1, 1, 1,
1.225353, -0.08196877, 1.680028, 1, 1, 1, 1, 1,
1.225397, 0.7421607, 1.982366, 1, 1, 1, 1, 1,
1.257207, 0.6151842, 2.889454, 1, 1, 1, 1, 1,
1.259073, -2.095305, 1.657092, 1, 1, 1, 1, 1,
1.2606, -0.6303688, 1.000656, 1, 1, 1, 1, 1,
1.289411, 0.1200333, 1.284568, 1, 1, 1, 1, 1,
1.304315, -0.647405, 1.547255, 1, 1, 1, 1, 1,
1.319631, -0.2944517, 2.742747, 0, 0, 1, 1, 1,
1.321967, 1.301167, 0.8089652, 1, 0, 0, 1, 1,
1.323447, 1.232131, 0.4479674, 1, 0, 0, 1, 1,
1.331422, -0.772499, 3.062567, 1, 0, 0, 1, 1,
1.33328, 0.986232, 0.1069657, 1, 0, 0, 1, 1,
1.336265, -0.1236028, 3.298896, 1, 0, 0, 1, 1,
1.336917, 0.8189108, 0.4558688, 0, 0, 0, 1, 1,
1.33915, -1.023778, 2.502502, 0, 0, 0, 1, 1,
1.343793, 0.2214409, 1.766037, 0, 0, 0, 1, 1,
1.348984, 0.803884, 2.355699, 0, 0, 0, 1, 1,
1.350685, -0.5024325, 1.611265, 0, 0, 0, 1, 1,
1.357687, -1.162885, 2.115548, 0, 0, 0, 1, 1,
1.358278, -1.272581, 1.079932, 0, 0, 0, 1, 1,
1.35991, 1.161165, 0.1101442, 1, 1, 1, 1, 1,
1.364678, 0.05789983, 1.833348, 1, 1, 1, 1, 1,
1.382073, -0.02324139, 2.21282, 1, 1, 1, 1, 1,
1.396028, 0.4878016, 0.6891389, 1, 1, 1, 1, 1,
1.40037, -1.733755, 2.118403, 1, 1, 1, 1, 1,
1.403729, 1.110769, 0.4955696, 1, 1, 1, 1, 1,
1.406058, -1.80417, 2.698238, 1, 1, 1, 1, 1,
1.408404, 1.328769, 1.25924, 1, 1, 1, 1, 1,
1.415108, 0.4827635, 2.018357, 1, 1, 1, 1, 1,
1.418339, 0.081976, 2.901244, 1, 1, 1, 1, 1,
1.426778, 0.2390565, 1.916843, 1, 1, 1, 1, 1,
1.427116, 0.4469814, 1.98293, 1, 1, 1, 1, 1,
1.431361, 0.7069846, 1.880036, 1, 1, 1, 1, 1,
1.448172, 0.7837188, 2.968225, 1, 1, 1, 1, 1,
1.448523, 0.9885505, 2.427113, 1, 1, 1, 1, 1,
1.450354, 0.1365414, 2.389493, 0, 0, 1, 1, 1,
1.45122, -1.347793, 3.32813, 1, 0, 0, 1, 1,
1.451802, 1.151225, 1.286502, 1, 0, 0, 1, 1,
1.466068, -0.4755008, 1.365212, 1, 0, 0, 1, 1,
1.474445, -0.4544633, 0.9684749, 1, 0, 0, 1, 1,
1.48057, -0.6405543, 1.052633, 1, 0, 0, 1, 1,
1.486906, 0.7254185, -0.06852907, 0, 0, 0, 1, 1,
1.505504, 0.8455841, 1.242273, 0, 0, 0, 1, 1,
1.506704, -0.0154355, 1.251768, 0, 0, 0, 1, 1,
1.511303, -0.2514365, 2.17698, 0, 0, 0, 1, 1,
1.51808, -1.033064, 3.492113, 0, 0, 0, 1, 1,
1.528718, -0.421115, 1.228864, 0, 0, 0, 1, 1,
1.530938, 0.4375636, -0.3870037, 0, 0, 0, 1, 1,
1.538727, 0.7662427, 2.086364, 1, 1, 1, 1, 1,
1.542804, -1.399107, 1.233912, 1, 1, 1, 1, 1,
1.543478, 1.600961, -0.9183789, 1, 1, 1, 1, 1,
1.553598, -1.329125, 1.572294, 1, 1, 1, 1, 1,
1.565487, 0.618422, 0.5281597, 1, 1, 1, 1, 1,
1.582645, -1.661734, 4.18272, 1, 1, 1, 1, 1,
1.60663, 0.7160931, 2.118861, 1, 1, 1, 1, 1,
1.614422, -1.127076, 2.035359, 1, 1, 1, 1, 1,
1.618662, 0.09480429, 1.698614, 1, 1, 1, 1, 1,
1.62871, 0.5618404, 1.087174, 1, 1, 1, 1, 1,
1.646527, -0.6880397, 2.448821, 1, 1, 1, 1, 1,
1.660782, 0.02285112, 2.580769, 1, 1, 1, 1, 1,
1.665359, -0.07726396, 2.582385, 1, 1, 1, 1, 1,
1.672148, -0.2412282, 2.863233, 1, 1, 1, 1, 1,
1.698476, 0.1985597, 1.480525, 1, 1, 1, 1, 1,
1.703763, 1.854704, 0.2438297, 0, 0, 1, 1, 1,
1.711832, -0.4368151, 1.991329, 1, 0, 0, 1, 1,
1.73793, -0.5721943, -0.5078169, 1, 0, 0, 1, 1,
1.739308, 1.268134, 2.918929, 1, 0, 0, 1, 1,
1.755227, 0.259933, -1.289735, 1, 0, 0, 1, 1,
1.795159, 0.03129442, 2.076222, 1, 0, 0, 1, 1,
1.806408, 0.7036468, 0.6412651, 0, 0, 0, 1, 1,
1.810099, -0.8852875, 3.369761, 0, 0, 0, 1, 1,
1.840477, -0.25273, 2.990134, 0, 0, 0, 1, 1,
1.871581, 1.301919, 0.4371268, 0, 0, 0, 1, 1,
1.892211, -0.9528146, 2.507512, 0, 0, 0, 1, 1,
1.903242, -1.51348, 3.049489, 0, 0, 0, 1, 1,
1.908819, -0.5444586, 1.360808, 0, 0, 0, 1, 1,
1.931803, 0.1396368, 1.477534, 1, 1, 1, 1, 1,
1.934398, 1.205745, 1.267837, 1, 1, 1, 1, 1,
1.936148, 2.317632, 0.2737412, 1, 1, 1, 1, 1,
1.946079, -0.2036719, 3.634627, 1, 1, 1, 1, 1,
1.959895, 0.1811848, 1.520913, 1, 1, 1, 1, 1,
1.960832, -0.3763655, 1.235281, 1, 1, 1, 1, 1,
2.004577, -0.7796714, 0.4582645, 1, 1, 1, 1, 1,
2.024014, -0.7987294, 4.29728, 1, 1, 1, 1, 1,
2.054823, -0.7168913, 2.665232, 1, 1, 1, 1, 1,
2.080435, -0.5923605, 1.90554, 1, 1, 1, 1, 1,
2.081717, -1.161889, 4.508332, 1, 1, 1, 1, 1,
2.083663, 1.03233, 2.487591, 1, 1, 1, 1, 1,
2.110238, 0.4021764, 0.8294255, 1, 1, 1, 1, 1,
2.116959, 0.08183207, 0.6369998, 1, 1, 1, 1, 1,
2.142457, 0.1385837, 2.24567, 1, 1, 1, 1, 1,
2.165947, 0.0888816, 1.226678, 0, 0, 1, 1, 1,
2.170804, -0.3578798, 1.34799, 1, 0, 0, 1, 1,
2.1731, 0.5071198, 1.694157, 1, 0, 0, 1, 1,
2.221757, -2.023626, 1.39858, 1, 0, 0, 1, 1,
2.224746, 0.0869596, 2.761811, 1, 0, 0, 1, 1,
2.284417, 0.4060535, 1.278275, 1, 0, 0, 1, 1,
2.306742, -1.08462, 2.780333, 0, 0, 0, 1, 1,
2.317275, -0.7877671, 1.239917, 0, 0, 0, 1, 1,
2.334782, 0.1604145, 1.013732, 0, 0, 0, 1, 1,
2.389156, 0.2425752, 2.385198, 0, 0, 0, 1, 1,
2.398447, 0.1228669, 2.053971, 0, 0, 0, 1, 1,
2.40807, 0.2259989, -0.3425112, 0, 0, 0, 1, 1,
2.416728, -0.1503831, 0.8419484, 0, 0, 0, 1, 1,
2.446908, -0.5778005, 2.654152, 1, 1, 1, 1, 1,
2.496236, -1.694973, 2.687902, 1, 1, 1, 1, 1,
2.641197, 0.2883843, 1.457471, 1, 1, 1, 1, 1,
2.673771, -0.4302009, 2.240356, 1, 1, 1, 1, 1,
2.716573, 0.3214848, 2.113976, 1, 1, 1, 1, 1,
3.155782, -0.2375493, 1.939293, 1, 1, 1, 1, 1,
3.415597, -0.6427042, 2.461782, 1, 1, 1, 1, 1
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
var radius = 9.837217;
var distance = 34.55281;
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
mvMatrix.translate( -0.05368376, -0.07995319, -0.08469534 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.55281);
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