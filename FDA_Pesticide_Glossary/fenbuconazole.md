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
-3.643878, 0.2631152, -2.005672, 1, 0, 0, 1,
-2.950306, -0.2408233, -0.3246597, 1, 0.007843138, 0, 1,
-2.937592, 2.03236, -3.826335, 1, 0.01176471, 0, 1,
-2.926497, 0.706829, -1.446939, 1, 0.01960784, 0, 1,
-2.757069, 0.07958411, -2.278965, 1, 0.02352941, 0, 1,
-2.686743, -0.1194709, 0.1835708, 1, 0.03137255, 0, 1,
-2.674446, -1.308355, -1.900119, 1, 0.03529412, 0, 1,
-2.515211, -0.1628977, -2.453373, 1, 0.04313726, 0, 1,
-2.498713, 1.79302, 1.083431, 1, 0.04705882, 0, 1,
-2.343567, 0.8086428, -2.044266, 1, 0.05490196, 0, 1,
-2.327755, -0.8843949, -0.8439912, 1, 0.05882353, 0, 1,
-2.297117, 1.027623, -0.7920824, 1, 0.06666667, 0, 1,
-2.26899, 1.209646, -0.3383698, 1, 0.07058824, 0, 1,
-2.211041, -1.324916, -1.828319, 1, 0.07843138, 0, 1,
-2.199026, -0.7589759, -0.5156307, 1, 0.08235294, 0, 1,
-2.159223, -2.50384, -1.207956, 1, 0.09019608, 0, 1,
-2.120463, -2.167176, -4.094388, 1, 0.09411765, 0, 1,
-2.057334, -0.745017, -1.777092, 1, 0.1019608, 0, 1,
-2.055212, 0.2667544, -2.247017, 1, 0.1098039, 0, 1,
-2.052411, -0.5467685, -2.148482, 1, 0.1137255, 0, 1,
-2.003937, -0.7352564, -0.1575128, 1, 0.1215686, 0, 1,
-1.991655, -1.20315, -3.366744, 1, 0.1254902, 0, 1,
-1.975355, 0.8120047, -0.7365154, 1, 0.1333333, 0, 1,
-1.935589, 0.2062447, -1.714498, 1, 0.1372549, 0, 1,
-1.928825, 2.673352, -0.8803303, 1, 0.145098, 0, 1,
-1.913205, 0.1491238, -1.984981, 1, 0.1490196, 0, 1,
-1.91064, 1.279523, -2.276607, 1, 0.1568628, 0, 1,
-1.890682, -1.683098, -1.970657, 1, 0.1607843, 0, 1,
-1.830306, 1.253095, -1.542685, 1, 0.1686275, 0, 1,
-1.812754, -0.03862557, -2.622579, 1, 0.172549, 0, 1,
-1.803244, -1.168246, -1.209266, 1, 0.1803922, 0, 1,
-1.797952, -0.2597319, -3.193449, 1, 0.1843137, 0, 1,
-1.795147, -1.716176, -1.363464, 1, 0.1921569, 0, 1,
-1.789963, -1.508296, -2.149796, 1, 0.1960784, 0, 1,
-1.785167, 1.136557, -1.734436, 1, 0.2039216, 0, 1,
-1.769047, 0.6764922, -1.353565, 1, 0.2117647, 0, 1,
-1.768429, -0.3458871, -1.093935, 1, 0.2156863, 0, 1,
-1.757606, -0.1802993, -1.524544, 1, 0.2235294, 0, 1,
-1.75502, -1.039855, -0.8316383, 1, 0.227451, 0, 1,
-1.750917, -0.4625874, -0.7230946, 1, 0.2352941, 0, 1,
-1.716095, -0.5223472, -1.613885, 1, 0.2392157, 0, 1,
-1.708313, -0.08956333, -0.8169025, 1, 0.2470588, 0, 1,
-1.702936, -0.6059916, -3.28667, 1, 0.2509804, 0, 1,
-1.702734, 0.5869411, -1.517402, 1, 0.2588235, 0, 1,
-1.69991, 1.328863, -0.5800869, 1, 0.2627451, 0, 1,
-1.699246, 0.3667896, -1.090123, 1, 0.2705882, 0, 1,
-1.680226, -0.7570305, -1.769444, 1, 0.2745098, 0, 1,
-1.680107, -0.9725356, -2.429016, 1, 0.282353, 0, 1,
-1.67008, -2.591245, -2.522611, 1, 0.2862745, 0, 1,
-1.666912, 0.4510739, -0.6498479, 1, 0.2941177, 0, 1,
-1.654591, 0.4661275, -0.8652761, 1, 0.3019608, 0, 1,
-1.644367, -0.02105924, -1.010095, 1, 0.3058824, 0, 1,
-1.639264, 0.3534842, -1.271017, 1, 0.3137255, 0, 1,
-1.634131, 0.007044838, -1.426881, 1, 0.3176471, 0, 1,
-1.625091, -0.3229766, -0.3152411, 1, 0.3254902, 0, 1,
-1.590194, -1.389172, -3.509947, 1, 0.3294118, 0, 1,
-1.580224, -0.08005779, -1.943939, 1, 0.3372549, 0, 1,
-1.575563, 0.03639116, -1.106196, 1, 0.3411765, 0, 1,
-1.570096, -1.857646, -1.344399, 1, 0.3490196, 0, 1,
-1.56038, 0.3920061, -2.088885, 1, 0.3529412, 0, 1,
-1.559404, 1.774137, -1.822278, 1, 0.3607843, 0, 1,
-1.543894, -0.2758257, -2.002909, 1, 0.3647059, 0, 1,
-1.539581, 0.6852586, -1.354093, 1, 0.372549, 0, 1,
-1.532635, -0.07627469, 0.2109145, 1, 0.3764706, 0, 1,
-1.529195, 1.826039, -0.8680768, 1, 0.3843137, 0, 1,
-1.513489, -2.428787, -2.570951, 1, 0.3882353, 0, 1,
-1.506208, 0.4000231, -0.3115563, 1, 0.3960784, 0, 1,
-1.502098, 1.046633, -0.4215811, 1, 0.4039216, 0, 1,
-1.499328, -1.21228, -2.640362, 1, 0.4078431, 0, 1,
-1.494234, 0.3347581, -0.3600945, 1, 0.4156863, 0, 1,
-1.478281, -0.3694639, -1.516417, 1, 0.4196078, 0, 1,
-1.475249, -1.051746, -1.307705, 1, 0.427451, 0, 1,
-1.47241, -0.7146856, -2.99876, 1, 0.4313726, 0, 1,
-1.469795, 1.37846, -0.353208, 1, 0.4392157, 0, 1,
-1.467829, -0.6974109, -2.239974, 1, 0.4431373, 0, 1,
-1.464745, 0.7928391, 0.3766949, 1, 0.4509804, 0, 1,
-1.458199, -0.6423356, -3.633911, 1, 0.454902, 0, 1,
-1.450839, 1.087459, -1.793617, 1, 0.4627451, 0, 1,
-1.447049, 0.2356366, -0.1542857, 1, 0.4666667, 0, 1,
-1.435125, -0.5210682, -2.200908, 1, 0.4745098, 0, 1,
-1.419796, 0.07189304, -0.5524867, 1, 0.4784314, 0, 1,
-1.394117, 0.3439541, -0.7411351, 1, 0.4862745, 0, 1,
-1.393156, -1.18037, -2.450257, 1, 0.4901961, 0, 1,
-1.387878, 0.5505531, -1.035894, 1, 0.4980392, 0, 1,
-1.387772, -0.1911922, -1.12528, 1, 0.5058824, 0, 1,
-1.383832, -1.746831, -1.57888, 1, 0.509804, 0, 1,
-1.357392, -1.488486, -3.571684, 1, 0.5176471, 0, 1,
-1.355213, 0.7494104, -0.3351321, 1, 0.5215687, 0, 1,
-1.329538, 0.6324709, -1.627175, 1, 0.5294118, 0, 1,
-1.325301, 0.9642415, 0.6243687, 1, 0.5333334, 0, 1,
-1.318067, -1.711411, -3.047623, 1, 0.5411765, 0, 1,
-1.316909, 0.1889986, -2.411506, 1, 0.5450981, 0, 1,
-1.304496, -0.4361729, -0.8689265, 1, 0.5529412, 0, 1,
-1.301385, 0.5012898, -0.9269372, 1, 0.5568628, 0, 1,
-1.299133, -0.2560285, -0.5156311, 1, 0.5647059, 0, 1,
-1.293328, 0.7183682, -1.751971, 1, 0.5686275, 0, 1,
-1.293148, -0.5331015, -1.051346, 1, 0.5764706, 0, 1,
-1.282383, -0.963815, -1.679109, 1, 0.5803922, 0, 1,
-1.277187, -0.1679091, -3.167412, 1, 0.5882353, 0, 1,
-1.271235, -0.01399109, -2.004595, 1, 0.5921569, 0, 1,
-1.270792, 0.5285944, -2.674964, 1, 0.6, 0, 1,
-1.255641, -0.8110994, -2.018665, 1, 0.6078432, 0, 1,
-1.236717, -0.8553413, -3.827574, 1, 0.6117647, 0, 1,
-1.225724, 0.2643346, -1.27919, 1, 0.6196079, 0, 1,
-1.222623, 0.6776738, -1.787889, 1, 0.6235294, 0, 1,
-1.203944, -1.555908, -1.080171, 1, 0.6313726, 0, 1,
-1.203034, -0.03471185, -0.8465179, 1, 0.6352941, 0, 1,
-1.198399, 1.466364, -1.213107, 1, 0.6431373, 0, 1,
-1.192648, 0.8774118, -0.612882, 1, 0.6470588, 0, 1,
-1.19135, 1.624573, -0.6997381, 1, 0.654902, 0, 1,
-1.189034, -0.3124387, -3.020969, 1, 0.6588235, 0, 1,
-1.187889, -0.5681046, -2.121672, 1, 0.6666667, 0, 1,
-1.173765, -0.2452872, -1.776076, 1, 0.6705883, 0, 1,
-1.167719, 1.550944, -0.9397938, 1, 0.6784314, 0, 1,
-1.160027, 1.549649, -0.2650065, 1, 0.682353, 0, 1,
-1.153171, 0.3580694, -0.8053296, 1, 0.6901961, 0, 1,
-1.147265, 0.06807463, -3.167033, 1, 0.6941177, 0, 1,
-1.145435, 0.4983639, -0.5827834, 1, 0.7019608, 0, 1,
-1.140434, -0.6819227, -1.192706, 1, 0.7098039, 0, 1,
-1.132278, -0.2069828, -2.72294, 1, 0.7137255, 0, 1,
-1.119353, -0.8517081, -2.424566, 1, 0.7215686, 0, 1,
-1.119105, -0.5171984, -0.04003276, 1, 0.7254902, 0, 1,
-1.118106, 0.5832299, -0.1799008, 1, 0.7333333, 0, 1,
-1.116807, 0.9285003, -0.9875081, 1, 0.7372549, 0, 1,
-1.111178, 0.9844381, -1.336665, 1, 0.7450981, 0, 1,
-1.109212, 0.414699, -2.48138, 1, 0.7490196, 0, 1,
-1.095643, -0.4029932, -1.702746, 1, 0.7568628, 0, 1,
-1.090794, -0.2262009, -2.276917, 1, 0.7607843, 0, 1,
-1.086099, 0.6035164, -1.616629, 1, 0.7686275, 0, 1,
-1.08488, -1.837482, -3.607675, 1, 0.772549, 0, 1,
-1.079712, 1.458026, 0.3757255, 1, 0.7803922, 0, 1,
-1.07573, -1.326443, -3.644317, 1, 0.7843137, 0, 1,
-1.075309, 0.1032225, -3.688518, 1, 0.7921569, 0, 1,
-1.073893, 0.8337189, -1.06592, 1, 0.7960784, 0, 1,
-1.070542, -2.15275, -0.86171, 1, 0.8039216, 0, 1,
-1.065712, -0.9666268, -2.913876, 1, 0.8117647, 0, 1,
-1.053982, -0.7068048, -4.472378, 1, 0.8156863, 0, 1,
-1.047156, -0.7003643, -2.636352, 1, 0.8235294, 0, 1,
-1.045286, 1.298995, -2.228235, 1, 0.827451, 0, 1,
-1.044665, -1.465973, -3.239803, 1, 0.8352941, 0, 1,
-1.044397, -1.769078, -3.397824, 1, 0.8392157, 0, 1,
-1.042112, -0.1915711, -3.48493, 1, 0.8470588, 0, 1,
-1.030615, -0.2728056, -1.445548, 1, 0.8509804, 0, 1,
-1.030003, 0.7310408, 0.4889053, 1, 0.8588235, 0, 1,
-1.029802, -1.238989, -0.6707662, 1, 0.8627451, 0, 1,
-1.029507, 2.265805, -0.5940133, 1, 0.8705882, 0, 1,
-1.028497, 0.6623639, -1.452595, 1, 0.8745098, 0, 1,
-1.027302, 0.8727627, -1.187258, 1, 0.8823529, 0, 1,
-1.027122, 0.1202056, -0.5266839, 1, 0.8862745, 0, 1,
-1.026124, 0.8092514, -1.570617, 1, 0.8941177, 0, 1,
-1.023895, -1.012872, 0.1707781, 1, 0.8980392, 0, 1,
-1.018249, -1.400532, -2.056547, 1, 0.9058824, 0, 1,
-1.014113, -0.6155179, -2.221153, 1, 0.9137255, 0, 1,
-1.003659, 0.9810979, -0.3529843, 1, 0.9176471, 0, 1,
-0.9966062, 0.7868744, 0.6388048, 1, 0.9254902, 0, 1,
-0.9949136, 0.6052445, -1.615081, 1, 0.9294118, 0, 1,
-0.9931087, -0.3827008, -3.573422, 1, 0.9372549, 0, 1,
-0.9909495, 0.9926036, 0.4580406, 1, 0.9411765, 0, 1,
-0.9829677, 1.628448, -0.2893116, 1, 0.9490196, 0, 1,
-0.9817951, 1.838471, -1.439128, 1, 0.9529412, 0, 1,
-0.9790815, -1.85379, -3.305886, 1, 0.9607843, 0, 1,
-0.9782519, -0.2727068, -1.552272, 1, 0.9647059, 0, 1,
-0.9727783, 0.01368039, -1.630102, 1, 0.972549, 0, 1,
-0.9704801, 0.05202487, -2.022079, 1, 0.9764706, 0, 1,
-0.9690582, -1.234831, -0.3528893, 1, 0.9843137, 0, 1,
-0.9648582, -1.019549, -1.258744, 1, 0.9882353, 0, 1,
-0.9552146, 0.2932114, -2.184917, 1, 0.9960784, 0, 1,
-0.952831, 1.06439, -1.055745, 0.9960784, 1, 0, 1,
-0.9509308, 0.2855994, -1.835716, 0.9921569, 1, 0, 1,
-0.948145, 1.352711, 0.8002625, 0.9843137, 1, 0, 1,
-0.9473527, 1.130005, -1.138528, 0.9803922, 1, 0, 1,
-0.9457686, -0.2006402, -2.713333, 0.972549, 1, 0, 1,
-0.944746, -0.8923989, -3.463869, 0.9686275, 1, 0, 1,
-0.9410726, -1.086438, -2.702966, 0.9607843, 1, 0, 1,
-0.9401374, 0.7445885, -1.143406, 0.9568627, 1, 0, 1,
-0.9312279, 0.8643154, -0.3526059, 0.9490196, 1, 0, 1,
-0.9257906, -0.8473009, -1.382485, 0.945098, 1, 0, 1,
-0.9173839, -0.4833865, -4.270027, 0.9372549, 1, 0, 1,
-0.91631, -0.7746061, -2.619593, 0.9333333, 1, 0, 1,
-0.9137329, -0.6278718, -2.758618, 0.9254902, 1, 0, 1,
-0.913284, 0.453733, -1.216011, 0.9215686, 1, 0, 1,
-0.9085798, -1.847754, -2.255791, 0.9137255, 1, 0, 1,
-0.9068611, -2.856218, -2.867222, 0.9098039, 1, 0, 1,
-0.8990381, 0.4000878, -1.103231, 0.9019608, 1, 0, 1,
-0.895979, -0.8764733, -3.300045, 0.8941177, 1, 0, 1,
-0.8948309, 0.4675162, -0.2940637, 0.8901961, 1, 0, 1,
-0.8935601, 0.5626565, -0.3495095, 0.8823529, 1, 0, 1,
-0.8883082, -0.05960388, -2.078574, 0.8784314, 1, 0, 1,
-0.8878471, 0.1370896, -0.6211291, 0.8705882, 1, 0, 1,
-0.8816014, 0.9731967, -0.2660002, 0.8666667, 1, 0, 1,
-0.8779948, -1.242224, -1.187567, 0.8588235, 1, 0, 1,
-0.8731996, -0.9109647, -3.514406, 0.854902, 1, 0, 1,
-0.8712809, 0.625136, -0.4355396, 0.8470588, 1, 0, 1,
-0.8700899, 2.003961, -0.01637262, 0.8431373, 1, 0, 1,
-0.8542869, -0.7124813, -3.622447, 0.8352941, 1, 0, 1,
-0.8525209, 0.601949, 0.02818477, 0.8313726, 1, 0, 1,
-0.849521, -0.5477925, -4.439265, 0.8235294, 1, 0, 1,
-0.8480777, -0.03531561, -2.060405, 0.8196079, 1, 0, 1,
-0.8388649, -0.5457383, -1.866427, 0.8117647, 1, 0, 1,
-0.8388557, 1.133991, 0.06604668, 0.8078431, 1, 0, 1,
-0.8370916, 0.19362, -1.689195, 0.8, 1, 0, 1,
-0.8322293, -0.01530493, -1.939254, 0.7921569, 1, 0, 1,
-0.82809, -0.8838761, -2.436852, 0.7882353, 1, 0, 1,
-0.8137004, 0.8522136, -1.703305, 0.7803922, 1, 0, 1,
-0.8055645, -0.6579545, -2.784125, 0.7764706, 1, 0, 1,
-0.8051702, -1.349605, -1.485722, 0.7686275, 1, 0, 1,
-0.8027344, 0.393266, -1.12632, 0.7647059, 1, 0, 1,
-0.8015699, -0.2341896, -1.488423, 0.7568628, 1, 0, 1,
-0.7995565, -0.2418804, -3.344784, 0.7529412, 1, 0, 1,
-0.7910874, 0.2648059, -0.1538293, 0.7450981, 1, 0, 1,
-0.7897029, 1.326243, 0.03011167, 0.7411765, 1, 0, 1,
-0.7895171, 0.8766488, 0.1442051, 0.7333333, 1, 0, 1,
-0.7854557, -0.6862981, -3.314725, 0.7294118, 1, 0, 1,
-0.7849308, 1.481733, 0.1252945, 0.7215686, 1, 0, 1,
-0.7805824, 0.0437525, -4.80793, 0.7176471, 1, 0, 1,
-0.7780982, 0.6641432, -0.03639501, 0.7098039, 1, 0, 1,
-0.7746981, -0.749944, -2.634754, 0.7058824, 1, 0, 1,
-0.7746503, 2.425616, -0.7053616, 0.6980392, 1, 0, 1,
-0.7680979, 0.6847433, 0.3542317, 0.6901961, 1, 0, 1,
-0.7648975, -0.110116, -4.019198, 0.6862745, 1, 0, 1,
-0.7613746, -0.9750157, -0.1066129, 0.6784314, 1, 0, 1,
-0.7595028, -0.6688542, -1.592497, 0.6745098, 1, 0, 1,
-0.7567847, 0.4311208, -2.868454, 0.6666667, 1, 0, 1,
-0.753503, -0.9022471, -0.03531811, 0.6627451, 1, 0, 1,
-0.7524175, -0.4434395, -3.564174, 0.654902, 1, 0, 1,
-0.7458568, 0.7474232, -2.32638, 0.6509804, 1, 0, 1,
-0.7453187, 0.415477, 0.438503, 0.6431373, 1, 0, 1,
-0.7336794, 1.174443, -1.609419, 0.6392157, 1, 0, 1,
-0.71957, 0.71592, 0.7016526, 0.6313726, 1, 0, 1,
-0.719093, 1.571836, 1.307386, 0.627451, 1, 0, 1,
-0.7188666, 0.6363828, -0.9891972, 0.6196079, 1, 0, 1,
-0.7184794, 0.5954083, -2.222124, 0.6156863, 1, 0, 1,
-0.7182437, 1.306296, -0.07908458, 0.6078432, 1, 0, 1,
-0.7156452, 0.3487728, -0.5815338, 0.6039216, 1, 0, 1,
-0.711136, -1.761312, -3.25156, 0.5960785, 1, 0, 1,
-0.7102164, 0.828101, 0.5383246, 0.5882353, 1, 0, 1,
-0.7101831, 1.536593, -1.36313, 0.5843138, 1, 0, 1,
-0.7091368, 0.7672955, -1.335187, 0.5764706, 1, 0, 1,
-0.708666, 0.738579, 0.03591501, 0.572549, 1, 0, 1,
-0.6974162, 0.3675953, -0.8606721, 0.5647059, 1, 0, 1,
-0.6955655, 1.38116, 0.1778595, 0.5607843, 1, 0, 1,
-0.6952916, 0.9316724, -2.165931, 0.5529412, 1, 0, 1,
-0.6952109, -0.5576457, -3.497815, 0.5490196, 1, 0, 1,
-0.6933752, 0.2622298, -0.4676135, 0.5411765, 1, 0, 1,
-0.6889985, -0.00981793, -1.390672, 0.5372549, 1, 0, 1,
-0.6867515, -1.98104, -3.399418, 0.5294118, 1, 0, 1,
-0.6840209, -1.396717, -5.205946, 0.5254902, 1, 0, 1,
-0.6818473, -0.197891, -2.779124, 0.5176471, 1, 0, 1,
-0.6794042, 1.567643, -0.8037884, 0.5137255, 1, 0, 1,
-0.6709583, 1.838655, 0.9629292, 0.5058824, 1, 0, 1,
-0.6695572, -0.07964651, -0.2639686, 0.5019608, 1, 0, 1,
-0.6677868, -1.105711, -3.231885, 0.4941176, 1, 0, 1,
-0.663978, -0.3956672, -1.447644, 0.4862745, 1, 0, 1,
-0.6627491, 0.7870673, 0.3559997, 0.4823529, 1, 0, 1,
-0.6556332, 0.440431, -0.6829013, 0.4745098, 1, 0, 1,
-0.6545681, -1.089846, -4.145904, 0.4705882, 1, 0, 1,
-0.6446984, -2.073854, -1.952591, 0.4627451, 1, 0, 1,
-0.6380101, -0.2421176, -2.119911, 0.4588235, 1, 0, 1,
-0.6376167, -1.683755, -1.764622, 0.4509804, 1, 0, 1,
-0.636259, 0.2210679, -2.348666, 0.4470588, 1, 0, 1,
-0.6351783, -1.349671, -2.854193, 0.4392157, 1, 0, 1,
-0.6255824, -0.1761483, -2.439179, 0.4352941, 1, 0, 1,
-0.621811, -0.02649002, -2.102321, 0.427451, 1, 0, 1,
-0.620673, 1.599307, -0.6109621, 0.4235294, 1, 0, 1,
-0.6168894, 0.6593801, 0.9160328, 0.4156863, 1, 0, 1,
-0.6134882, 0.2251644, -0.7707813, 0.4117647, 1, 0, 1,
-0.6085516, -0.7221863, -2.342212, 0.4039216, 1, 0, 1,
-0.608153, 0.6252729, -0.8598537, 0.3960784, 1, 0, 1,
-0.6080813, -0.3142605, -0.8020898, 0.3921569, 1, 0, 1,
-0.6073588, -0.03897281, -2.305921, 0.3843137, 1, 0, 1,
-0.6060948, 0.7726907, 0.1204329, 0.3803922, 1, 0, 1,
-0.6049787, -1.690794, -1.596916, 0.372549, 1, 0, 1,
-0.5997474, -1.070863, -1.922084, 0.3686275, 1, 0, 1,
-0.5960563, 0.8649552, 0.4362018, 0.3607843, 1, 0, 1,
-0.5940945, 1.272426, -0.4688324, 0.3568628, 1, 0, 1,
-0.5935891, -0.04361046, -2.085683, 0.3490196, 1, 0, 1,
-0.5907212, 0.7740894, -0.7444027, 0.345098, 1, 0, 1,
-0.5889552, 0.2170407, -1.090809, 0.3372549, 1, 0, 1,
-0.5877441, 0.1946285, -0.937421, 0.3333333, 1, 0, 1,
-0.5833483, -0.0007602534, 0.04782358, 0.3254902, 1, 0, 1,
-0.5774212, -0.3113155, -2.45558, 0.3215686, 1, 0, 1,
-0.5763412, -0.4762132, -3.068117, 0.3137255, 1, 0, 1,
-0.5742148, 1.1432, -1.414465, 0.3098039, 1, 0, 1,
-0.567188, 0.5116279, -0.1074039, 0.3019608, 1, 0, 1,
-0.5614161, 1.628042, -0.9414132, 0.2941177, 1, 0, 1,
-0.559154, 0.3534185, -1.532057, 0.2901961, 1, 0, 1,
-0.5588701, -1.147562, -4.306415, 0.282353, 1, 0, 1,
-0.5470535, 0.3604186, -1.363639, 0.2784314, 1, 0, 1,
-0.5449638, -0.9444265, -3.853719, 0.2705882, 1, 0, 1,
-0.5389882, -0.1810033, -1.560615, 0.2666667, 1, 0, 1,
-0.5386745, -1.172857, -2.839912, 0.2588235, 1, 0, 1,
-0.5348157, 0.6164651, -0.5726603, 0.254902, 1, 0, 1,
-0.5325015, -0.4933782, -3.066257, 0.2470588, 1, 0, 1,
-0.5296721, 0.7490832, -0.03977874, 0.2431373, 1, 0, 1,
-0.5263363, -0.8463242, -1.746753, 0.2352941, 1, 0, 1,
-0.5238276, 2.22974, -1.710695, 0.2313726, 1, 0, 1,
-0.5149828, 0.6881554, -1.024093, 0.2235294, 1, 0, 1,
-0.5144446, -0.1647663, 0.2169792, 0.2196078, 1, 0, 1,
-0.5135378, -0.0342905, -1.885141, 0.2117647, 1, 0, 1,
-0.5118583, -1.517477, -3.184141, 0.2078431, 1, 0, 1,
-0.5115824, -0.7918035, -1.308651, 0.2, 1, 0, 1,
-0.5114827, -0.4180965, -1.867566, 0.1921569, 1, 0, 1,
-0.5073908, -1.021573, -2.597752, 0.1882353, 1, 0, 1,
-0.5064734, -0.0929708, -2.007025, 0.1803922, 1, 0, 1,
-0.5041524, -0.1141833, -0.5904901, 0.1764706, 1, 0, 1,
-0.4997818, -0.1527179, -2.538251, 0.1686275, 1, 0, 1,
-0.4979835, 0.2269177, -2.736845, 0.1647059, 1, 0, 1,
-0.4918165, -2.101214, -1.821523, 0.1568628, 1, 0, 1,
-0.475166, -0.7998698, -4.172023, 0.1529412, 1, 0, 1,
-0.4725702, 0.635267, -2.200282, 0.145098, 1, 0, 1,
-0.4725246, 1.288733, -0.2961559, 0.1411765, 1, 0, 1,
-0.4689375, 1.021034, -1.591538, 0.1333333, 1, 0, 1,
-0.468345, -0.8558477, -2.448348, 0.1294118, 1, 0, 1,
-0.4642952, 0.7722685, -1.97503, 0.1215686, 1, 0, 1,
-0.4641866, 0.2721184, -0.9634024, 0.1176471, 1, 0, 1,
-0.4621336, -0.5596648, -3.332995, 0.1098039, 1, 0, 1,
-0.4600418, -0.9099071, -1.745653, 0.1058824, 1, 0, 1,
-0.4569083, 1.169141, 0.2792422, 0.09803922, 1, 0, 1,
-0.4558416, -0.2763489, -4.177364, 0.09019608, 1, 0, 1,
-0.4523225, -1.26223, -3.502893, 0.08627451, 1, 0, 1,
-0.4520234, 0.87063, -0.3268596, 0.07843138, 1, 0, 1,
-0.4411192, 0.4860469, -0.6787888, 0.07450981, 1, 0, 1,
-0.4404199, 0.4139395, -0.2118482, 0.06666667, 1, 0, 1,
-0.4199421, -0.1341096, -2.727164, 0.0627451, 1, 0, 1,
-0.4138026, 0.9525672, 0.04796135, 0.05490196, 1, 0, 1,
-0.4115668, 0.6575238, -1.100078, 0.05098039, 1, 0, 1,
-0.4106271, 0.3138914, -0.04373783, 0.04313726, 1, 0, 1,
-0.4102355, 0.6507041, 0.3448343, 0.03921569, 1, 0, 1,
-0.4087567, -0.07192371, -0.6499348, 0.03137255, 1, 0, 1,
-0.4077299, 1.927904, -1.296409, 0.02745098, 1, 0, 1,
-0.4066044, 1.177362, -0.1296561, 0.01960784, 1, 0, 1,
-0.4007762, 0.04006565, -1.667887, 0.01568628, 1, 0, 1,
-0.4001269, 0.9115883, -0.482592, 0.007843138, 1, 0, 1,
-0.3992873, -0.6704627, -4.317476, 0.003921569, 1, 0, 1,
-0.3912999, 1.329522, 0.1873749, 0, 1, 0.003921569, 1,
-0.3909338, 1.058789, -1.535373, 0, 1, 0.01176471, 1,
-0.3825803, 0.9035557, 2.001979, 0, 1, 0.01568628, 1,
-0.3801824, -0.7153052, -1.737429, 0, 1, 0.02352941, 1,
-0.3783873, -0.7685184, -3.284158, 0, 1, 0.02745098, 1,
-0.3744551, 0.540413, -0.1769014, 0, 1, 0.03529412, 1,
-0.3732711, 0.643946, 0.8077346, 0, 1, 0.03921569, 1,
-0.3727082, 1.990627, 0.8083784, 0, 1, 0.04705882, 1,
-0.3723553, -0.8364798, -2.90114, 0, 1, 0.05098039, 1,
-0.3661916, -2.946564, -2.612896, 0, 1, 0.05882353, 1,
-0.3617257, -0.5115328, -1.812218, 0, 1, 0.0627451, 1,
-0.3583275, 0.767078, -0.7052263, 0, 1, 0.07058824, 1,
-0.3551045, 1.455075, 0.2631672, 0, 1, 0.07450981, 1,
-0.3547674, -0.7323756, -2.479153, 0, 1, 0.08235294, 1,
-0.3534835, -1.250425, -3.269815, 0, 1, 0.08627451, 1,
-0.3530178, 0.2105407, -0.4074197, 0, 1, 0.09411765, 1,
-0.3502135, -1.098099, -4.0055, 0, 1, 0.1019608, 1,
-0.3495772, -0.3980855, -1.634459, 0, 1, 0.1058824, 1,
-0.3487794, -0.6489453, -1.711382, 0, 1, 0.1137255, 1,
-0.3473662, -0.6573221, -3.265317, 0, 1, 0.1176471, 1,
-0.3470271, -2.31393, -3.455611, 0, 1, 0.1254902, 1,
-0.3357771, 1.249916, 0.1408556, 0, 1, 0.1294118, 1,
-0.3352832, -2.492605, -2.508009, 0, 1, 0.1372549, 1,
-0.3346443, 1.825601, 0.1794826, 0, 1, 0.1411765, 1,
-0.3336881, -1.331196, -3.461789, 0, 1, 0.1490196, 1,
-0.328612, -0.2508552, -3.225039, 0, 1, 0.1529412, 1,
-0.3223411, -0.4903359, -2.008751, 0, 1, 0.1607843, 1,
-0.322165, 0.1052474, -2.669143, 0, 1, 0.1647059, 1,
-0.3178521, 0.9693691, 0.05545043, 0, 1, 0.172549, 1,
-0.3156772, -1.36557, -2.217478, 0, 1, 0.1764706, 1,
-0.3155504, 0.6061604, -0.14383, 0, 1, 0.1843137, 1,
-0.3107143, 0.9217649, -0.1432219, 0, 1, 0.1882353, 1,
-0.3037978, -0.4070441, -3.643694, 0, 1, 0.1960784, 1,
-0.3036167, 0.3733622, -1.335387, 0, 1, 0.2039216, 1,
-0.3013811, -0.9216977, -1.307036, 0, 1, 0.2078431, 1,
-0.2987358, -0.1416701, -2.592661, 0, 1, 0.2156863, 1,
-0.2975382, -1.920429, -2.768204, 0, 1, 0.2196078, 1,
-0.2902921, 0.7653585, -0.6069635, 0, 1, 0.227451, 1,
-0.2887698, 1.223804, -0.48277, 0, 1, 0.2313726, 1,
-0.2869711, 1.104567, 1.216406, 0, 1, 0.2392157, 1,
-0.2844751, 0.9629402, 0.8693669, 0, 1, 0.2431373, 1,
-0.2835125, -0.1883462, -2.258017, 0, 1, 0.2509804, 1,
-0.2832487, 1.60134, 1.689359, 0, 1, 0.254902, 1,
-0.2812319, 0.224246, 0.3948686, 0, 1, 0.2627451, 1,
-0.2739063, 0.8709534, 1.202901, 0, 1, 0.2666667, 1,
-0.2734055, 0.1270088, -0.3807354, 0, 1, 0.2745098, 1,
-0.2690654, -0.8037239, -2.759005, 0, 1, 0.2784314, 1,
-0.2674835, 0.0941084, 0.2004706, 0, 1, 0.2862745, 1,
-0.2649625, -0.06601654, -3.392028, 0, 1, 0.2901961, 1,
-0.2617561, 0.06362123, -1.395799, 0, 1, 0.2980392, 1,
-0.2604588, -1.11239, -2.5153, 0, 1, 0.3058824, 1,
-0.2567081, -0.6504964, -3.06877, 0, 1, 0.3098039, 1,
-0.2504721, 0.2475979, -1.386839, 0, 1, 0.3176471, 1,
-0.2493032, 0.2616241, -2.007944, 0, 1, 0.3215686, 1,
-0.2487491, 1.657194, -0.173903, 0, 1, 0.3294118, 1,
-0.2472321, 0.5184035, 0.02775489, 0, 1, 0.3333333, 1,
-0.246337, -0.7055278, -3.168832, 0, 1, 0.3411765, 1,
-0.2428209, 1.183064, 0.3811362, 0, 1, 0.345098, 1,
-0.2417464, 1.921465, -0.3027825, 0, 1, 0.3529412, 1,
-0.2408588, -0.3553137, -2.02087, 0, 1, 0.3568628, 1,
-0.2382948, 0.5486001, 0.1815894, 0, 1, 0.3647059, 1,
-0.2377944, -0.6160115, -3.692204, 0, 1, 0.3686275, 1,
-0.2345904, -0.7370399, -4.805452, 0, 1, 0.3764706, 1,
-0.2336192, 2.19851, -1.467821, 0, 1, 0.3803922, 1,
-0.2306318, -1.315221, -3.006006, 0, 1, 0.3882353, 1,
-0.2258199, 0.8286855, -0.3374211, 0, 1, 0.3921569, 1,
-0.2218061, -0.5027014, -1.804046, 0, 1, 0.4, 1,
-0.2215978, 0.1752702, -0.9845612, 0, 1, 0.4078431, 1,
-0.2211665, -1.079464, -1.139388, 0, 1, 0.4117647, 1,
-0.2179371, 0.4266574, -1.480719, 0, 1, 0.4196078, 1,
-0.2175624, 0.6418619, 0.6438532, 0, 1, 0.4235294, 1,
-0.2128519, 0.4312091, -0.5115973, 0, 1, 0.4313726, 1,
-0.2110456, 0.3184781, -0.7605104, 0, 1, 0.4352941, 1,
-0.2089224, 1.354636, -0.8515341, 0, 1, 0.4431373, 1,
-0.2082573, 0.0001110211, -0.4481463, 0, 1, 0.4470588, 1,
-0.2081258, 0.7310649, 1.448042, 0, 1, 0.454902, 1,
-0.2080645, -0.2902513, -4.768602, 0, 1, 0.4588235, 1,
-0.2065636, 0.3527853, -2.042665, 0, 1, 0.4666667, 1,
-0.206193, -1.183541, -2.136015, 0, 1, 0.4705882, 1,
-0.2051255, 0.02222947, -3.365505, 0, 1, 0.4784314, 1,
-0.2020776, 0.455676, 1.02942, 0, 1, 0.4823529, 1,
-0.1996566, 0.03535924, -1.645244, 0, 1, 0.4901961, 1,
-0.1959666, 0.3308386, -1.486806, 0, 1, 0.4941176, 1,
-0.1937511, -0.03496398, -1.878875, 0, 1, 0.5019608, 1,
-0.1876767, 0.3107382, -1.507852, 0, 1, 0.509804, 1,
-0.1856653, 0.9341435, 1.815544, 0, 1, 0.5137255, 1,
-0.1813373, -1.032833, -3.044575, 0, 1, 0.5215687, 1,
-0.175769, -2.877846, -3.713501, 0, 1, 0.5254902, 1,
-0.1735806, 0.7947388, -0.0004730593, 0, 1, 0.5333334, 1,
-0.1719099, -0.7764161, -3.378035, 0, 1, 0.5372549, 1,
-0.1709192, 1.190366, 0.3894692, 0, 1, 0.5450981, 1,
-0.1683808, 0.0348146, -1.703063, 0, 1, 0.5490196, 1,
-0.1636319, 1.045204, 0.1878554, 0, 1, 0.5568628, 1,
-0.1630977, -1.398912, -3.947573, 0, 1, 0.5607843, 1,
-0.1608949, -0.293704, -2.656984, 0, 1, 0.5686275, 1,
-0.160084, -1.322324, -2.402558, 0, 1, 0.572549, 1,
-0.1598718, -1.055284, -3.372204, 0, 1, 0.5803922, 1,
-0.1598614, -0.7855269, -1.939756, 0, 1, 0.5843138, 1,
-0.1556949, -1.671623, -2.967297, 0, 1, 0.5921569, 1,
-0.1497911, -0.3703677, -2.011401, 0, 1, 0.5960785, 1,
-0.1491824, -0.1751086, -2.033898, 0, 1, 0.6039216, 1,
-0.1437153, -1.287541, -1.67636, 0, 1, 0.6117647, 1,
-0.1375988, 0.1945564, -1.924265, 0, 1, 0.6156863, 1,
-0.1337121, -0.1976148, -2.367283, 0, 1, 0.6235294, 1,
-0.1268211, -1.202011, -1.674606, 0, 1, 0.627451, 1,
-0.1197417, -0.1765414, -2.549335, 0, 1, 0.6352941, 1,
-0.1187608, 0.5068434, 0.3371213, 0, 1, 0.6392157, 1,
-0.1163585, 0.7111606, 0.08312239, 0, 1, 0.6470588, 1,
-0.1161757, -0.1691189, -3.066092, 0, 1, 0.6509804, 1,
-0.114417, 1.170267, -1.640285, 0, 1, 0.6588235, 1,
-0.1090226, 0.5619831, -0.2699071, 0, 1, 0.6627451, 1,
-0.108046, 0.7428493, 0.6877647, 0, 1, 0.6705883, 1,
-0.1059288, 1.632604, -0.6090723, 0, 1, 0.6745098, 1,
-0.1041936, -0.6740438, -0.7218053, 0, 1, 0.682353, 1,
-0.1041393, 1.484981, 0.9343441, 0, 1, 0.6862745, 1,
-0.1007936, -0.2529629, -3.800149, 0, 1, 0.6941177, 1,
-0.1002099, -0.8093522, -3.23315, 0, 1, 0.7019608, 1,
-0.09919992, -0.009310559, -1.855205, 0, 1, 0.7058824, 1,
-0.09785474, -0.8538434, -4.261908, 0, 1, 0.7137255, 1,
-0.09399598, -0.0343593, -2.206403, 0, 1, 0.7176471, 1,
-0.09391187, -0.8763542, -3.250394, 0, 1, 0.7254902, 1,
-0.09379125, -1.019257, -4.738453, 0, 1, 0.7294118, 1,
-0.0922479, -0.8067737, -2.065561, 0, 1, 0.7372549, 1,
-0.08486953, 0.1479581, 0.2477582, 0, 1, 0.7411765, 1,
-0.08044802, 0.6459563, -1.010425, 0, 1, 0.7490196, 1,
-0.07749094, -1.007832, -3.037819, 0, 1, 0.7529412, 1,
-0.07599521, 1.187, -1.956842, 0, 1, 0.7607843, 1,
-0.07518993, -0.1950808, -1.364457, 0, 1, 0.7647059, 1,
-0.07452492, 0.4174614, -0.7688153, 0, 1, 0.772549, 1,
-0.07336621, -0.6724917, -2.943036, 0, 1, 0.7764706, 1,
-0.07112131, 0.1833064, -1.316437, 0, 1, 0.7843137, 1,
-0.0678563, -0.07970437, -2.348333, 0, 1, 0.7882353, 1,
-0.0675172, -0.8329507, -5.787796, 0, 1, 0.7960784, 1,
-0.06690477, 2.433577, 0.1048875, 0, 1, 0.8039216, 1,
-0.06415033, 0.8584624, -0.2296885, 0, 1, 0.8078431, 1,
-0.06316815, -0.8509666, -1.354247, 0, 1, 0.8156863, 1,
-0.06112241, 2.453944, -0.8522307, 0, 1, 0.8196079, 1,
-0.05977101, -0.7443794, -3.119413, 0, 1, 0.827451, 1,
-0.0567128, -0.1452612, -1.8781, 0, 1, 0.8313726, 1,
-0.05521606, -1.357495, -2.351823, 0, 1, 0.8392157, 1,
-0.05383926, -0.039454, -2.737394, 0, 1, 0.8431373, 1,
-0.05323806, -1.510403, -0.8188946, 0, 1, 0.8509804, 1,
-0.05311703, -0.4098337, -2.802914, 0, 1, 0.854902, 1,
-0.04982326, -0.3121018, -1.722773, 0, 1, 0.8627451, 1,
-0.04542309, -1.362309, -0.9915946, 0, 1, 0.8666667, 1,
-0.04539556, -0.5856827, -1.835202, 0, 1, 0.8745098, 1,
-0.04481191, 1.155232, -0.9522734, 0, 1, 0.8784314, 1,
-0.04014926, 0.8825004, 0.1359114, 0, 1, 0.8862745, 1,
-0.03614394, 0.3590529, -0.08317318, 0, 1, 0.8901961, 1,
-0.03016, 0.1675042, -0.2571631, 0, 1, 0.8980392, 1,
-0.024846, -0.9277698, -3.518105, 0, 1, 0.9058824, 1,
-0.02338855, 0.4577803, -0.248217, 0, 1, 0.9098039, 1,
-0.01973017, -0.9224842, -1.331786, 0, 1, 0.9176471, 1,
-0.01878346, 0.8321357, 0.00767022, 0, 1, 0.9215686, 1,
-0.01716048, -2.737012, -3.874102, 0, 1, 0.9294118, 1,
-0.01686975, 0.4432163, -0.2750666, 0, 1, 0.9333333, 1,
-0.01442164, -0.5874527, -2.897918, 0, 1, 0.9411765, 1,
-0.01036862, 0.5121494, 2.402285, 0, 1, 0.945098, 1,
-0.009876299, -0.4359462, -3.823924, 0, 1, 0.9529412, 1,
-0.009713043, -1.433679, -2.706735, 0, 1, 0.9568627, 1,
-0.008513993, 0.3274115, -0.2610375, 0, 1, 0.9647059, 1,
-0.006455332, 0.2891951, 0.3331756, 0, 1, 0.9686275, 1,
0.0003536888, -0.378976, 4.34699, 0, 1, 0.9764706, 1,
0.005302704, 0.08676352, -0.9236065, 0, 1, 0.9803922, 1,
0.007531331, 0.7800976, 1.578226, 0, 1, 0.9882353, 1,
0.01024472, 0.1990905, 0.08198977, 0, 1, 0.9921569, 1,
0.01059614, 0.8255557, 0.7924279, 0, 1, 1, 1,
0.01511297, -0.9595966, 4.015304, 0, 0.9921569, 1, 1,
0.01549949, -1.040564, 3.879525, 0, 0.9882353, 1, 1,
0.01585908, 0.2898347, -0.2193941, 0, 0.9803922, 1, 1,
0.02031699, -0.4223056, 2.468281, 0, 0.9764706, 1, 1,
0.02340852, 0.8994375, 0.236939, 0, 0.9686275, 1, 1,
0.02464463, -1.485597, 3.71016, 0, 0.9647059, 1, 1,
0.02590731, 0.9587158, -1.035532, 0, 0.9568627, 1, 1,
0.02984195, -0.7424804, 2.005821, 0, 0.9529412, 1, 1,
0.03301436, 0.1818392, 0.407721, 0, 0.945098, 1, 1,
0.03346653, -1.766643, 2.469393, 0, 0.9411765, 1, 1,
0.03525441, -0.9841577, 1.39642, 0, 0.9333333, 1, 1,
0.0364202, 0.08998844, 0.1898104, 0, 0.9294118, 1, 1,
0.03842446, -0.5302986, 2.483338, 0, 0.9215686, 1, 1,
0.04193862, 0.4708525, 0.6160959, 0, 0.9176471, 1, 1,
0.04223704, -0.0002903372, 2.113091, 0, 0.9098039, 1, 1,
0.04418414, -0.3222573, 2.475397, 0, 0.9058824, 1, 1,
0.04748326, -1.189564, 3.029816, 0, 0.8980392, 1, 1,
0.04969995, 1.272291, 1.666817, 0, 0.8901961, 1, 1,
0.05032168, -0.5729241, 2.107685, 0, 0.8862745, 1, 1,
0.05320191, 1.80635, 0.6726803, 0, 0.8784314, 1, 1,
0.05924681, 0.8777508, -0.7289622, 0, 0.8745098, 1, 1,
0.06110986, 0.992557, 0.1415161, 0, 0.8666667, 1, 1,
0.06239315, -0.4517326, 1.473888, 0, 0.8627451, 1, 1,
0.06441533, 1.463419, -1.822122, 0, 0.854902, 1, 1,
0.0663721, -0.248663, 2.70041, 0, 0.8509804, 1, 1,
0.06853054, -0.1817876, 3.829004, 0, 0.8431373, 1, 1,
0.06967846, -0.1189178, 2.337168, 0, 0.8392157, 1, 1,
0.06972312, 0.6985576, 0.4558164, 0, 0.8313726, 1, 1,
0.07088032, 0.3191901, -0.1432309, 0, 0.827451, 1, 1,
0.07943249, -0.7030302, 2.451119, 0, 0.8196079, 1, 1,
0.08063676, -0.8204214, 2.61841, 0, 0.8156863, 1, 1,
0.08386356, -1.660085, 3.441203, 0, 0.8078431, 1, 1,
0.08616593, -1.168594, 3.682301, 0, 0.8039216, 1, 1,
0.08813839, 1.596034, -0.0274565, 0, 0.7960784, 1, 1,
0.09394553, -0.9737628, 3.47935, 0, 0.7882353, 1, 1,
0.09801769, -0.4687504, 4.506069, 0, 0.7843137, 1, 1,
0.1001885, -0.9932681, 4.907823, 0, 0.7764706, 1, 1,
0.1067818, -0.7119949, 2.163395, 0, 0.772549, 1, 1,
0.1091881, -0.1271773, 0.2398409, 0, 0.7647059, 1, 1,
0.1093916, -0.09290054, 2.494372, 0, 0.7607843, 1, 1,
0.1099765, -0.01301226, 1.756113, 0, 0.7529412, 1, 1,
0.1127126, 1.542713, 1.20112, 0, 0.7490196, 1, 1,
0.1131374, -0.0283497, 1.626074, 0, 0.7411765, 1, 1,
0.1160366, 0.6183628, 1.433728, 0, 0.7372549, 1, 1,
0.1177015, -0.8734777, 4.073712, 0, 0.7294118, 1, 1,
0.1189291, 0.4928769, 0.4313227, 0, 0.7254902, 1, 1,
0.1202315, 0.6172861, 1.689081, 0, 0.7176471, 1, 1,
0.1244094, 0.2707691, 0.9348817, 0, 0.7137255, 1, 1,
0.1249913, -0.4502262, 2.960525, 0, 0.7058824, 1, 1,
0.1279511, -0.1633864, 2.40585, 0, 0.6980392, 1, 1,
0.1284526, -0.3187987, 2.395423, 0, 0.6941177, 1, 1,
0.1306936, 0.8998895, 0.6511949, 0, 0.6862745, 1, 1,
0.1387238, 0.3533318, 0.3783335, 0, 0.682353, 1, 1,
0.1391926, 0.7564898, 1.151544, 0, 0.6745098, 1, 1,
0.1403372, 0.6341162, -2.048533, 0, 0.6705883, 1, 1,
0.1409878, 1.78037, -0.1820457, 0, 0.6627451, 1, 1,
0.1424001, -1.325842, 1.736334, 0, 0.6588235, 1, 1,
0.1463796, 0.4965832, 0.08972801, 0, 0.6509804, 1, 1,
0.149028, -1.022597, 2.771622, 0, 0.6470588, 1, 1,
0.1532391, 0.1609242, -1.310076, 0, 0.6392157, 1, 1,
0.1540102, 0.774062, 0.1937645, 0, 0.6352941, 1, 1,
0.1545863, 0.7007844, 0.6440212, 0, 0.627451, 1, 1,
0.1566541, -0.2718333, 3.14259, 0, 0.6235294, 1, 1,
0.1585289, 0.4249914, 0.4386657, 0, 0.6156863, 1, 1,
0.1596507, -0.6019916, 1.771051, 0, 0.6117647, 1, 1,
0.1710531, -0.2186971, 3.337671, 0, 0.6039216, 1, 1,
0.1734916, -0.3945146, 1.392976, 0, 0.5960785, 1, 1,
0.1740405, -0.5420552, 3.275322, 0, 0.5921569, 1, 1,
0.1758085, -1.419964, 2.655095, 0, 0.5843138, 1, 1,
0.1796339, 1.352324, -0.3416803, 0, 0.5803922, 1, 1,
0.1806862, -0.3195102, 1.156727, 0, 0.572549, 1, 1,
0.1900643, 1.434513, 0.9964693, 0, 0.5686275, 1, 1,
0.1922581, 1.117563, 0.4377212, 0, 0.5607843, 1, 1,
0.1943751, -0.593474, 2.496555, 0, 0.5568628, 1, 1,
0.2008845, -2.659464, 2.906471, 0, 0.5490196, 1, 1,
0.2045373, 0.9345609, 1.042341, 0, 0.5450981, 1, 1,
0.2084173, -0.1357345, 2.191074, 0, 0.5372549, 1, 1,
0.2098679, -0.6211008, 2.710365, 0, 0.5333334, 1, 1,
0.2113719, -0.2840555, 2.358136, 0, 0.5254902, 1, 1,
0.2115244, -0.8103216, 2.036483, 0, 0.5215687, 1, 1,
0.2167609, -0.8373049, 1.930784, 0, 0.5137255, 1, 1,
0.2233677, 0.7136782, 0.2686476, 0, 0.509804, 1, 1,
0.2234131, 0.6389108, -0.142441, 0, 0.5019608, 1, 1,
0.2239268, 0.7655324, -1.978765, 0, 0.4941176, 1, 1,
0.2239541, 0.08381815, 0.2680097, 0, 0.4901961, 1, 1,
0.2247671, 0.4405049, -0.3804178, 0, 0.4823529, 1, 1,
0.2264755, -1.144082, 3.509598, 0, 0.4784314, 1, 1,
0.2316844, -1.368981, 3.727775, 0, 0.4705882, 1, 1,
0.2324836, -0.6137347, 1.718396, 0, 0.4666667, 1, 1,
0.233893, -0.5813834, 2.042228, 0, 0.4588235, 1, 1,
0.2351285, -0.2850365, 1.131567, 0, 0.454902, 1, 1,
0.2354796, -0.8278043, 3.291994, 0, 0.4470588, 1, 1,
0.235879, -0.3862681, 1.771821, 0, 0.4431373, 1, 1,
0.2430603, 0.3101684, 1.314165, 0, 0.4352941, 1, 1,
0.2432171, 1.49961, 0.2850195, 0, 0.4313726, 1, 1,
0.2432329, 0.5827221, 0.3198647, 0, 0.4235294, 1, 1,
0.2463276, -0.5139259, 2.321709, 0, 0.4196078, 1, 1,
0.2468602, -0.7360154, 1.680962, 0, 0.4117647, 1, 1,
0.2470843, -1.88469, 4.617147, 0, 0.4078431, 1, 1,
0.250422, 2.064145, -1.449744, 0, 0.4, 1, 1,
0.2518887, -0.1565747, 2.870107, 0, 0.3921569, 1, 1,
0.2526408, 1.145835, -0.856611, 0, 0.3882353, 1, 1,
0.2652953, -0.2841085, 3.855975, 0, 0.3803922, 1, 1,
0.2686632, -1.224952, 2.915452, 0, 0.3764706, 1, 1,
0.2702025, 0.3020965, -0.0506739, 0, 0.3686275, 1, 1,
0.2729536, -0.9846104, 3.203394, 0, 0.3647059, 1, 1,
0.2779302, -2.824524, 3.733992, 0, 0.3568628, 1, 1,
0.2792622, -1.099806, 2.586711, 0, 0.3529412, 1, 1,
0.2808442, -0.0003295468, 3.900442, 0, 0.345098, 1, 1,
0.2820361, 1.012758, 1.022935, 0, 0.3411765, 1, 1,
0.283237, -1.018892, 3.758977, 0, 0.3333333, 1, 1,
0.2842416, 2.396893, 1.936226, 0, 0.3294118, 1, 1,
0.2849984, 0.7534762, 0.6008287, 0, 0.3215686, 1, 1,
0.2859333, -1.28232, 2.570485, 0, 0.3176471, 1, 1,
0.2869363, -1.623524, 4.007668, 0, 0.3098039, 1, 1,
0.2871574, 0.04123556, 0.09520973, 0, 0.3058824, 1, 1,
0.2896009, -0.006646421, 1.27705, 0, 0.2980392, 1, 1,
0.2916104, 0.1558661, 0.255988, 0, 0.2901961, 1, 1,
0.2973765, 0.8837576, -1.203919, 0, 0.2862745, 1, 1,
0.2975879, -0.5696107, 1.173272, 0, 0.2784314, 1, 1,
0.3005638, -0.30608, 4.140823, 0, 0.2745098, 1, 1,
0.3061676, 1.158266, -0.4138527, 0, 0.2666667, 1, 1,
0.3081507, 0.2688375, 1.64395, 0, 0.2627451, 1, 1,
0.3087689, -0.3640594, 4.166031, 0, 0.254902, 1, 1,
0.3111412, -0.2675643, 2.341627, 0, 0.2509804, 1, 1,
0.3125916, 1.735941, 1.768311, 0, 0.2431373, 1, 1,
0.313979, -0.6480519, 1.899364, 0, 0.2392157, 1, 1,
0.3235892, 0.1017994, 1.095459, 0, 0.2313726, 1, 1,
0.3265668, -0.3922347, 2.059347, 0, 0.227451, 1, 1,
0.3291933, -2.081758, 2.920201, 0, 0.2196078, 1, 1,
0.3318389, 0.5147471, 2.543153, 0, 0.2156863, 1, 1,
0.3342195, 1.567526, -0.970678, 0, 0.2078431, 1, 1,
0.3380157, -1.720336, 4.263243, 0, 0.2039216, 1, 1,
0.3381748, -0.8556044, 3.080833, 0, 0.1960784, 1, 1,
0.3493043, -1.009133, 1.736137, 0, 0.1882353, 1, 1,
0.3506226, 0.8283576, -0.07920785, 0, 0.1843137, 1, 1,
0.3506463, -0.2579504, 4.127252, 0, 0.1764706, 1, 1,
0.3539614, 0.1690933, 3.046544, 0, 0.172549, 1, 1,
0.3564845, -0.8611192, 3.444536, 0, 0.1647059, 1, 1,
0.3570465, -1.037857, 2.450894, 0, 0.1607843, 1, 1,
0.362147, -0.609744, 2.016078, 0, 0.1529412, 1, 1,
0.3635023, 0.3597936, 1.197322, 0, 0.1490196, 1, 1,
0.3671651, -1.239608, 1.913701, 0, 0.1411765, 1, 1,
0.3724263, 0.07219482, 2.402753, 0, 0.1372549, 1, 1,
0.3771972, 0.198513, 1.226384, 0, 0.1294118, 1, 1,
0.3877199, 2.485759, 0.5747834, 0, 0.1254902, 1, 1,
0.390345, 1.006701, -0.32359, 0, 0.1176471, 1, 1,
0.396054, 0.7203203, -0.9235091, 0, 0.1137255, 1, 1,
0.3987664, 0.451119, -0.039285, 0, 0.1058824, 1, 1,
0.4040084, 1.279925, 0.2963061, 0, 0.09803922, 1, 1,
0.4049767, 0.6641259, -1.310442, 0, 0.09411765, 1, 1,
0.405771, -1.552304, 3.439862, 0, 0.08627451, 1, 1,
0.4127735, -0.02602152, 0.9426275, 0, 0.08235294, 1, 1,
0.4169264, -0.5693778, 3.858709, 0, 0.07450981, 1, 1,
0.4203162, -0.04683987, 1.675849, 0, 0.07058824, 1, 1,
0.4224312, 1.641683, 0.6282163, 0, 0.0627451, 1, 1,
0.436578, 0.6097283, 1.519654, 0, 0.05882353, 1, 1,
0.4394177, -0.04028827, 2.982114, 0, 0.05098039, 1, 1,
0.4434755, 0.4504598, 1.754457, 0, 0.04705882, 1, 1,
0.4442198, -2.464328, 3.374395, 0, 0.03921569, 1, 1,
0.4447592, 0.6261672, 0.06649976, 0, 0.03529412, 1, 1,
0.4460775, -1.810107, 2.197953, 0, 0.02745098, 1, 1,
0.4468759, -1.660143, 4.184307, 0, 0.02352941, 1, 1,
0.448119, 1.229712, 0.5883724, 0, 0.01568628, 1, 1,
0.4539031, 1.482958, 0.7578602, 0, 0.01176471, 1, 1,
0.4539698, 0.4764571, -1.83101, 0, 0.003921569, 1, 1,
0.4565464, 1.097782, 0.8956893, 0.003921569, 0, 1, 1,
0.4643644, -0.1973263, 0.9560256, 0.007843138, 0, 1, 1,
0.4652671, -0.3188848, 1.424299, 0.01568628, 0, 1, 1,
0.4655822, 0.6847643, 0.4186915, 0.01960784, 0, 1, 1,
0.4711016, -1.46844, 2.746234, 0.02745098, 0, 1, 1,
0.4735855, 0.8800748, -0.4153951, 0.03137255, 0, 1, 1,
0.4799662, 0.7411446, 0.3687246, 0.03921569, 0, 1, 1,
0.4803665, 1.790446, -0.03829748, 0.04313726, 0, 1, 1,
0.4811331, -1.212755, 1.548863, 0.05098039, 0, 1, 1,
0.4897196, 1.604469, -0.9759237, 0.05490196, 0, 1, 1,
0.4913244, -0.987983, 2.5206, 0.0627451, 0, 1, 1,
0.4917761, 0.1790975, 2.71751, 0.06666667, 0, 1, 1,
0.4940018, 0.824784, -1.802143, 0.07450981, 0, 1, 1,
0.4979191, 0.9358338, -0.2433101, 0.07843138, 0, 1, 1,
0.4979203, -2.199351, 2.053138, 0.08627451, 0, 1, 1,
0.500122, 2.035733, -1.388417, 0.09019608, 0, 1, 1,
0.5041602, -0.2444971, 2.592054, 0.09803922, 0, 1, 1,
0.5106357, 1.676208, 0.3999366, 0.1058824, 0, 1, 1,
0.5146452, 0.4065712, 1.428245, 0.1098039, 0, 1, 1,
0.5162612, -1.693485, 2.196609, 0.1176471, 0, 1, 1,
0.5181051, -0.6356961, 1.879413, 0.1215686, 0, 1, 1,
0.5191132, 2.42945, -0.1574162, 0.1294118, 0, 1, 1,
0.529465, 0.8355542, 0.1265132, 0.1333333, 0, 1, 1,
0.5308901, 2.754264, -0.6191424, 0.1411765, 0, 1, 1,
0.5379143, -0.4551306, 1.737206, 0.145098, 0, 1, 1,
0.5408738, 0.9591969, 0.1318534, 0.1529412, 0, 1, 1,
0.5409061, 0.3791672, 2.308146, 0.1568628, 0, 1, 1,
0.542056, 0.5954137, 1.576913, 0.1647059, 0, 1, 1,
0.54652, -0.75484, 3.380135, 0.1686275, 0, 1, 1,
0.5486457, 0.01589778, 0.9523289, 0.1764706, 0, 1, 1,
0.5491755, 0.9176171, -0.1223518, 0.1803922, 0, 1, 1,
0.5529343, 0.8244988, -0.967146, 0.1882353, 0, 1, 1,
0.5548452, 0.7629701, 1.836608, 0.1921569, 0, 1, 1,
0.5578892, 1.453449, 2.390545, 0.2, 0, 1, 1,
0.5587406, 0.9554121, -0.785967, 0.2078431, 0, 1, 1,
0.5598931, 0.7459612, 0.6166887, 0.2117647, 0, 1, 1,
0.5608335, -0.009973603, 0.937488, 0.2196078, 0, 1, 1,
0.5633373, 0.9258878, 0.4427268, 0.2235294, 0, 1, 1,
0.5666562, 2.00428, -1.409637, 0.2313726, 0, 1, 1,
0.5694569, -1.324966, 2.320028, 0.2352941, 0, 1, 1,
0.5709453, -0.8049756, 5.077975, 0.2431373, 0, 1, 1,
0.5757223, 0.4880523, 0.2969537, 0.2470588, 0, 1, 1,
0.57651, 0.640914, 0.6115519, 0.254902, 0, 1, 1,
0.5786767, 1.563773, -0.05054358, 0.2588235, 0, 1, 1,
0.5797918, -0.5813388, 4.098155, 0.2666667, 0, 1, 1,
0.5811792, 1.054391, 1.015831, 0.2705882, 0, 1, 1,
0.5812658, 0.6828802, -0.9887514, 0.2784314, 0, 1, 1,
0.5826962, -1.787767, 4.612049, 0.282353, 0, 1, 1,
0.5886907, 0.05558138, 0.9757875, 0.2901961, 0, 1, 1,
0.5888517, 0.1770726, 1.518956, 0.2941177, 0, 1, 1,
0.5890625, -1.790964, 1.96553, 0.3019608, 0, 1, 1,
0.5948912, -0.1253292, -0.2453331, 0.3098039, 0, 1, 1,
0.5975103, -1.152618, 2.2236, 0.3137255, 0, 1, 1,
0.6003236, 0.9046438, 0.3820043, 0.3215686, 0, 1, 1,
0.6021477, 1.160755, -0.4571061, 0.3254902, 0, 1, 1,
0.6035525, -2.093504, 3.070616, 0.3333333, 0, 1, 1,
0.6090245, -2.34099, 2.62707, 0.3372549, 0, 1, 1,
0.6110638, -1.022784, 3.761215, 0.345098, 0, 1, 1,
0.6114076, -1.605971, 3.166174, 0.3490196, 0, 1, 1,
0.6140155, -0.8568704, 1.360563, 0.3568628, 0, 1, 1,
0.6150149, -0.6655025, 2.608534, 0.3607843, 0, 1, 1,
0.6178802, 0.2192115, 1.313526, 0.3686275, 0, 1, 1,
0.6181457, 1.190964, 1.208897, 0.372549, 0, 1, 1,
0.6206316, -1.379414, 2.220571, 0.3803922, 0, 1, 1,
0.6216593, -0.214269, 3.823854, 0.3843137, 0, 1, 1,
0.6232213, 0.5491633, 0.04530685, 0.3921569, 0, 1, 1,
0.6246171, -0.3134425, 2.132019, 0.3960784, 0, 1, 1,
0.6253592, -1.787057, 2.13711, 0.4039216, 0, 1, 1,
0.627073, 0.8663812, 1.169582, 0.4117647, 0, 1, 1,
0.62821, -0.2384552, 1.086252, 0.4156863, 0, 1, 1,
0.6297493, 0.03451947, 1.056207, 0.4235294, 0, 1, 1,
0.6385705, 0.8187811, -0.002871828, 0.427451, 0, 1, 1,
0.6400877, 0.04720949, 1.355986, 0.4352941, 0, 1, 1,
0.6488587, -0.3578498, 1.399071, 0.4392157, 0, 1, 1,
0.6500584, -0.959445, 2.982125, 0.4470588, 0, 1, 1,
0.6549045, -0.2244419, 2.371132, 0.4509804, 0, 1, 1,
0.6587349, -1.008949, 0.6446337, 0.4588235, 0, 1, 1,
0.6592139, -1.706958, 3.372488, 0.4627451, 0, 1, 1,
0.6600312, 0.9298849, 2.147888, 0.4705882, 0, 1, 1,
0.6631636, 0.6013762, -0.7371721, 0.4745098, 0, 1, 1,
0.6720006, -0.007633488, 1.32088, 0.4823529, 0, 1, 1,
0.6740305, -0.8189968, 2.239553, 0.4862745, 0, 1, 1,
0.6797528, -0.3303601, 2.081673, 0.4941176, 0, 1, 1,
0.680912, -0.09857138, 0.2335708, 0.5019608, 0, 1, 1,
0.6812223, 0.7877063, 2.049634, 0.5058824, 0, 1, 1,
0.6857635, 0.0733643, 2.047539, 0.5137255, 0, 1, 1,
0.6881852, 2.232868, 1.235639, 0.5176471, 0, 1, 1,
0.6944316, 0.410093, 0.7489811, 0.5254902, 0, 1, 1,
0.7053667, -1.645721, 3.010505, 0.5294118, 0, 1, 1,
0.7067561, 1.072498, 0.3175354, 0.5372549, 0, 1, 1,
0.7072066, -1.323742, 1.176994, 0.5411765, 0, 1, 1,
0.7091916, -0.6064067, 1.805728, 0.5490196, 0, 1, 1,
0.7092594, -0.08901618, 1.946301, 0.5529412, 0, 1, 1,
0.7093583, -0.0828594, 2.688353, 0.5607843, 0, 1, 1,
0.7099395, -0.5096576, 1.768041, 0.5647059, 0, 1, 1,
0.714322, 0.4195806, 2.30887, 0.572549, 0, 1, 1,
0.7157474, -0.5089077, 3.840401, 0.5764706, 0, 1, 1,
0.715993, -0.2337895, 2.148633, 0.5843138, 0, 1, 1,
0.7220861, 0.04004655, 2.635192, 0.5882353, 0, 1, 1,
0.7233812, 0.2763863, 0.1361364, 0.5960785, 0, 1, 1,
0.7262071, 1.158564, 1.24247, 0.6039216, 0, 1, 1,
0.7324979, 0.2720582, 0.01952972, 0.6078432, 0, 1, 1,
0.735639, 1.743429, 1.458444, 0.6156863, 0, 1, 1,
0.7479943, -0.1587102, 3.082875, 0.6196079, 0, 1, 1,
0.7505475, 1.857607, 0.6096966, 0.627451, 0, 1, 1,
0.7510571, -1.358035, 2.47041, 0.6313726, 0, 1, 1,
0.7517252, -1.53975, 1.297246, 0.6392157, 0, 1, 1,
0.7546446, -0.4397429, 2.048077, 0.6431373, 0, 1, 1,
0.7548038, 0.01964165, 1.07188, 0.6509804, 0, 1, 1,
0.7603351, 0.007808399, 1.522067, 0.654902, 0, 1, 1,
0.7609731, 0.302138, 0.6766341, 0.6627451, 0, 1, 1,
0.7720083, 1.418242, 1.64611, 0.6666667, 0, 1, 1,
0.7771251, 1.425057, 1.25291, 0.6745098, 0, 1, 1,
0.7858896, 1.460483, -0.8316107, 0.6784314, 0, 1, 1,
0.7870742, -0.4191135, 1.956591, 0.6862745, 0, 1, 1,
0.7943928, -0.3159495, 1.648027, 0.6901961, 0, 1, 1,
0.7996899, -0.5018288, 2.410821, 0.6980392, 0, 1, 1,
0.8014231, 0.5807604, 0.7597567, 0.7058824, 0, 1, 1,
0.8054636, 0.2141486, 0.3146302, 0.7098039, 0, 1, 1,
0.8073722, 0.3990003, 1.811347, 0.7176471, 0, 1, 1,
0.8117048, -0.2027316, 2.31494, 0.7215686, 0, 1, 1,
0.8118079, -1.610237, 1.201708, 0.7294118, 0, 1, 1,
0.8129881, 0.2255774, 1.34931, 0.7333333, 0, 1, 1,
0.817317, -0.04725078, 1.857529, 0.7411765, 0, 1, 1,
0.8263288, 0.2401685, 0.9081135, 0.7450981, 0, 1, 1,
0.82969, -0.9071468, 0.8453832, 0.7529412, 0, 1, 1,
0.8314818, 1.081421, -1.079045, 0.7568628, 0, 1, 1,
0.832791, -0.7820126, 1.541287, 0.7647059, 0, 1, 1,
0.8371323, 1.764639, 2.25449, 0.7686275, 0, 1, 1,
0.8405045, 0.06213195, 0.807323, 0.7764706, 0, 1, 1,
0.8436482, 1.396268, -0.0869541, 0.7803922, 0, 1, 1,
0.8551675, 0.02907248, 1.135337, 0.7882353, 0, 1, 1,
0.8582925, -0.2997961, 0.2766705, 0.7921569, 0, 1, 1,
0.8607139, 0.7229879, 3.514718, 0.8, 0, 1, 1,
0.8644065, 0.5149256, -0.1675795, 0.8078431, 0, 1, 1,
0.8668597, -0.8898086, 1.381803, 0.8117647, 0, 1, 1,
0.8690345, 1.563595, -0.3807783, 0.8196079, 0, 1, 1,
0.8715988, 0.1013063, 0.8548945, 0.8235294, 0, 1, 1,
0.8725971, 1.419836, -0.6962976, 0.8313726, 0, 1, 1,
0.8777441, 0.01674595, 1.014768, 0.8352941, 0, 1, 1,
0.8815529, -1.180207, 1.828668, 0.8431373, 0, 1, 1,
0.8836889, 0.502593, 1.524817, 0.8470588, 0, 1, 1,
0.8869672, 0.2292513, 1.88544, 0.854902, 0, 1, 1,
0.8930353, -0.5969834, 2.68142, 0.8588235, 0, 1, 1,
0.8971881, -1.458585, 1.447087, 0.8666667, 0, 1, 1,
0.8974134, 1.670187, 0.7398304, 0.8705882, 0, 1, 1,
0.8982804, -0.4542749, 2.327708, 0.8784314, 0, 1, 1,
0.9026694, -1.986524, 2.335731, 0.8823529, 0, 1, 1,
0.9036067, 0.9344627, -0.7966442, 0.8901961, 0, 1, 1,
0.909462, 0.979533, 1.938167, 0.8941177, 0, 1, 1,
0.921948, -0.2045407, 0.8149015, 0.9019608, 0, 1, 1,
0.925775, 0.5517926, 2.95293, 0.9098039, 0, 1, 1,
0.9349411, 0.6074558, 1.257017, 0.9137255, 0, 1, 1,
0.9357669, 1.197115, 1.166278, 0.9215686, 0, 1, 1,
0.9405643, 0.6172004, -0.3785153, 0.9254902, 0, 1, 1,
0.941075, -2.359881, 1.973895, 0.9333333, 0, 1, 1,
0.9437987, 0.8937232, 1.150458, 0.9372549, 0, 1, 1,
0.9550061, 1.591293, -1.123559, 0.945098, 0, 1, 1,
0.9603201, -1.059057, 1.814809, 0.9490196, 0, 1, 1,
0.9706919, 1.010783, 0.2489765, 0.9568627, 0, 1, 1,
0.9763448, -0.5472136, 2.204935, 0.9607843, 0, 1, 1,
0.9847881, 0.2367036, 0.9255593, 0.9686275, 0, 1, 1,
0.9851872, 1.096528, 1.79635, 0.972549, 0, 1, 1,
0.9879401, -0.09150784, 1.597552, 0.9803922, 0, 1, 1,
0.9907514, -0.2858815, 1.956909, 0.9843137, 0, 1, 1,
0.992151, -1.183006, 2.913656, 0.9921569, 0, 1, 1,
0.9936804, 0.6896836, 0.4949496, 0.9960784, 0, 1, 1,
0.9976512, -0.9796344, 1.276771, 1, 0, 0.9960784, 1,
0.9997116, 0.2926939, 0.4900306, 1, 0, 0.9882353, 1,
1.003374, 1.178466, 1.036492, 1, 0, 0.9843137, 1,
1.006872, -0.4106655, 1.510153, 1, 0, 0.9764706, 1,
1.012879, 0.2988812, 0.1469951, 1, 0, 0.972549, 1,
1.013505, 1.646958, -0.07459459, 1, 0, 0.9647059, 1,
1.014699, 1.581616, -0.0433495, 1, 0, 0.9607843, 1,
1.019928, -0.8602055, 2.252487, 1, 0, 0.9529412, 1,
1.035318, 0.2552022, 1.125426, 1, 0, 0.9490196, 1,
1.047035, -0.09034595, 1.785564, 1, 0, 0.9411765, 1,
1.051306, -0.2861663, 0.7796413, 1, 0, 0.9372549, 1,
1.056036, 0.5689031, 1.122722, 1, 0, 0.9294118, 1,
1.057858, -0.8507267, 2.612855, 1, 0, 0.9254902, 1,
1.06103, 0.04586244, 1.802228, 1, 0, 0.9176471, 1,
1.061628, 0.6517888, 1.798078, 1, 0, 0.9137255, 1,
1.07075, 1.075542, 0.9359996, 1, 0, 0.9058824, 1,
1.072067, 0.8927135, 1.012293, 1, 0, 0.9019608, 1,
1.072116, 0.3081249, 1.447953, 1, 0, 0.8941177, 1,
1.072135, -0.1864509, 0.7986282, 1, 0, 0.8862745, 1,
1.073118, 0.6876881, 1.79656, 1, 0, 0.8823529, 1,
1.081003, -1.360468, 1.300198, 1, 0, 0.8745098, 1,
1.089477, -0.8616838, 2.438398, 1, 0, 0.8705882, 1,
1.095223, 2.055558, 1.731455, 1, 0, 0.8627451, 1,
1.098384, 0.0383472, 0.5300551, 1, 0, 0.8588235, 1,
1.10334, -0.5618442, 3.234389, 1, 0, 0.8509804, 1,
1.103794, 2.224634, 0.1460127, 1, 0, 0.8470588, 1,
1.106183, 2.838935, 1.06652, 1, 0, 0.8392157, 1,
1.106477, -1.340197, 3.509411, 1, 0, 0.8352941, 1,
1.113552, -0.8370453, -0.4394018, 1, 0, 0.827451, 1,
1.119128, -0.6882655, 1.267318, 1, 0, 0.8235294, 1,
1.121203, 1.095644, 1.938674, 1, 0, 0.8156863, 1,
1.122113, -1.282267, 3.363632, 1, 0, 0.8117647, 1,
1.122561, -0.1853363, 1.167074, 1, 0, 0.8039216, 1,
1.122837, -0.7262731, 4.003907, 1, 0, 0.7960784, 1,
1.126295, -0.0005328836, 2.305029, 1, 0, 0.7921569, 1,
1.130981, 0.2255207, 1.386058, 1, 0, 0.7843137, 1,
1.142499, 1.9779, 2.150676, 1, 0, 0.7803922, 1,
1.144326, 1.585689, -0.5545444, 1, 0, 0.772549, 1,
1.144847, -0.5775554, 3.493286, 1, 0, 0.7686275, 1,
1.145594, 0.4212559, 0.5533142, 1, 0, 0.7607843, 1,
1.146294, -0.5150231, 2.729063, 1, 0, 0.7568628, 1,
1.159714, 0.6003819, 0.8614756, 1, 0, 0.7490196, 1,
1.161927, 0.667108, 3.814921, 1, 0, 0.7450981, 1,
1.167351, 0.5186488, 0.7799473, 1, 0, 0.7372549, 1,
1.174358, -1.320736, 2.789618, 1, 0, 0.7333333, 1,
1.177774, -1.209223, 3.245186, 1, 0, 0.7254902, 1,
1.178581, -0.0656716, 3.027046, 1, 0, 0.7215686, 1,
1.183363, 0.1728067, 2.098887, 1, 0, 0.7137255, 1,
1.185845, 1.709212, 1.259164, 1, 0, 0.7098039, 1,
1.187107, 2.774892, -0.1745664, 1, 0, 0.7019608, 1,
1.187968, 0.7575889, 1.811051, 1, 0, 0.6941177, 1,
1.199495, 0.1299323, 1.747965, 1, 0, 0.6901961, 1,
1.200332, -0.6814518, 2.19933, 1, 0, 0.682353, 1,
1.21949, 0.5865905, 2.062703, 1, 0, 0.6784314, 1,
1.221933, -0.06701493, 1.295666, 1, 0, 0.6705883, 1,
1.226603, -0.9936382, 3.488302, 1, 0, 0.6666667, 1,
1.228477, -0.9115425, 3.513239, 1, 0, 0.6588235, 1,
1.231841, -1.350361, 2.373547, 1, 0, 0.654902, 1,
1.242605, -2.2362, -0.5951892, 1, 0, 0.6470588, 1,
1.247827, -0.1564835, 2.271558, 1, 0, 0.6431373, 1,
1.248321, 0.3727475, 1.181121, 1, 0, 0.6352941, 1,
1.251089, -0.2375458, 1.818239, 1, 0, 0.6313726, 1,
1.265187, -2.019327, 2.182976, 1, 0, 0.6235294, 1,
1.270443, -0.474583, 2.002978, 1, 0, 0.6196079, 1,
1.279042, 0.1276545, 1.701772, 1, 0, 0.6117647, 1,
1.283895, 1.914294, 1.285576, 1, 0, 0.6078432, 1,
1.284378, 2.35414, 1.403146, 1, 0, 0.6, 1,
1.286883, -1.455731, 1.628552, 1, 0, 0.5921569, 1,
1.289385, -0.6565853, 1.040076, 1, 0, 0.5882353, 1,
1.302603, 0.7946365, 1.915014, 1, 0, 0.5803922, 1,
1.311975, 1.320516, 0.9585066, 1, 0, 0.5764706, 1,
1.313682, 1.57739, 1.022513, 1, 0, 0.5686275, 1,
1.315363, -1.70967, 2.196329, 1, 0, 0.5647059, 1,
1.318635, -2.422263, 1.630518, 1, 0, 0.5568628, 1,
1.333082, 0.7150164, 2.376082, 1, 0, 0.5529412, 1,
1.336847, -1.501943, 1.130415, 1, 0, 0.5450981, 1,
1.342409, 0.4305743, 1.178931, 1, 0, 0.5411765, 1,
1.344949, 0.6252707, 1.397343, 1, 0, 0.5333334, 1,
1.345289, 1.701409, -0.2350279, 1, 0, 0.5294118, 1,
1.362977, 0.8045541, -0.0750873, 1, 0, 0.5215687, 1,
1.381854, 0.7108142, 1.769776, 1, 0, 0.5176471, 1,
1.404209, -1.07874, 3.902357, 1, 0, 0.509804, 1,
1.412863, -0.6082184, 2.671728, 1, 0, 0.5058824, 1,
1.413707, 1.759848, 0.248459, 1, 0, 0.4980392, 1,
1.416727, -0.7553303, 1.926495, 1, 0, 0.4901961, 1,
1.417433, -0.5863436, 2.80881, 1, 0, 0.4862745, 1,
1.420781, 0.4532083, 2.200124, 1, 0, 0.4784314, 1,
1.425476, -1.724316, 1.141661, 1, 0, 0.4745098, 1,
1.43461, -2.418787, 2.39622, 1, 0, 0.4666667, 1,
1.441076, 1.129221, 0.9749532, 1, 0, 0.4627451, 1,
1.446075, 1.637309, 0.5966808, 1, 0, 0.454902, 1,
1.451325, 0.5416912, 1.013091, 1, 0, 0.4509804, 1,
1.455539, 0.1575462, 1.897745, 1, 0, 0.4431373, 1,
1.456964, -1.404138, 4.020782, 1, 0, 0.4392157, 1,
1.460471, 0.3192905, 2.212162, 1, 0, 0.4313726, 1,
1.472739, 1.108526, 2.091345, 1, 0, 0.427451, 1,
1.477744, 0.2757863, 4.071464, 1, 0, 0.4196078, 1,
1.483314, 1.312804, 2.604597, 1, 0, 0.4156863, 1,
1.483587, 0.3257893, 2.10112, 1, 0, 0.4078431, 1,
1.484393, 1.065858, 0.3796294, 1, 0, 0.4039216, 1,
1.491783, 1.181409, 2.392998, 1, 0, 0.3960784, 1,
1.491829, -1.344058, 3.195682, 1, 0, 0.3882353, 1,
1.508426, -0.6419534, 1.996738, 1, 0, 0.3843137, 1,
1.514064, -0.3607179, 2.662063, 1, 0, 0.3764706, 1,
1.515311, 0.7219636, -0.3888199, 1, 0, 0.372549, 1,
1.515586, -0.3252073, -0.57907, 1, 0, 0.3647059, 1,
1.529297, -0.08246339, 0.5046416, 1, 0, 0.3607843, 1,
1.536478, -0.7180473, 2.172755, 1, 0, 0.3529412, 1,
1.547628, 0.2585248, 0.7511151, 1, 0, 0.3490196, 1,
1.553283, 0.4911852, 0.467351, 1, 0, 0.3411765, 1,
1.567757, 3.090401, 0.6471943, 1, 0, 0.3372549, 1,
1.569152, -0.3827895, 3.026385, 1, 0, 0.3294118, 1,
1.57031, -0.7990661, 1.672151, 1, 0, 0.3254902, 1,
1.574329, 0.224343, 1.889666, 1, 0, 0.3176471, 1,
1.576265, 0.4896812, 0.5943814, 1, 0, 0.3137255, 1,
1.585041, 0.7755882, 1.692324, 1, 0, 0.3058824, 1,
1.58685, -0.9819458, 3.960408, 1, 0, 0.2980392, 1,
1.587863, 0.6346492, 2.093009, 1, 0, 0.2941177, 1,
1.600174, 0.6790417, 0.3909725, 1, 0, 0.2862745, 1,
1.613024, 0.7329176, 2.038724, 1, 0, 0.282353, 1,
1.616698, 0.2833144, 0.3971955, 1, 0, 0.2745098, 1,
1.631391, -0.1081455, 2.32107, 1, 0, 0.2705882, 1,
1.632197, 0.01695625, 2.978933, 1, 0, 0.2627451, 1,
1.643704, -0.5221786, 1.424047, 1, 0, 0.2588235, 1,
1.643951, -0.6703099, 2.918878, 1, 0, 0.2509804, 1,
1.644051, 0.218475, 1.314755, 1, 0, 0.2470588, 1,
1.654655, 0.135575, 1.655708, 1, 0, 0.2392157, 1,
1.678684, -1.586338, 2.183109, 1, 0, 0.2352941, 1,
1.690776, -0.4693598, 1.994685, 1, 0, 0.227451, 1,
1.694875, 0.4993225, 1.977187, 1, 0, 0.2235294, 1,
1.69638, 0.6668935, 2.036959, 1, 0, 0.2156863, 1,
1.753178, -0.376004, 1.477334, 1, 0, 0.2117647, 1,
1.757431, -0.009726448, 2.49224, 1, 0, 0.2039216, 1,
1.774962, 0.9206491, 0.285054, 1, 0, 0.1960784, 1,
1.828254, 2.222025, -0.4696151, 1, 0, 0.1921569, 1,
1.838192, 0.4057983, 2.543303, 1, 0, 0.1843137, 1,
1.848246, 1.339526, -0.3382253, 1, 0, 0.1803922, 1,
1.898375, -0.6573872, 0.7166972, 1, 0, 0.172549, 1,
1.901043, 0.9450927, 0.9883478, 1, 0, 0.1686275, 1,
1.938186, -1.758171, 2.030004, 1, 0, 0.1607843, 1,
1.960938, 2.115427, 0.5444145, 1, 0, 0.1568628, 1,
1.971303, -0.1866933, 3.333195, 1, 0, 0.1490196, 1,
2.003457, 1.108412, 1.187399, 1, 0, 0.145098, 1,
2.019065, 0.8839017, 1.570165, 1, 0, 0.1372549, 1,
2.024505, -0.3676815, 2.190095, 1, 0, 0.1333333, 1,
2.026003, 0.2947594, 3.026999, 1, 0, 0.1254902, 1,
2.028425, 1.312195, 0.1650798, 1, 0, 0.1215686, 1,
2.030796, 0.1938426, 3.012813, 1, 0, 0.1137255, 1,
2.041008, -0.6346806, 0.6959612, 1, 0, 0.1098039, 1,
2.043527, -0.9248162, 2.695257, 1, 0, 0.1019608, 1,
2.063156, -0.101756, 1.603137, 1, 0, 0.09411765, 1,
2.06967, 0.7438815, 0.1980458, 1, 0, 0.09019608, 1,
2.103332, -0.5948052, 1.740221, 1, 0, 0.08235294, 1,
2.116922, -1.27987, 2.488396, 1, 0, 0.07843138, 1,
2.127979, 0.200062, 0.3874843, 1, 0, 0.07058824, 1,
2.149917, -1.485017, 3.525366, 1, 0, 0.06666667, 1,
2.165836, -0.205033, -0.4057275, 1, 0, 0.05882353, 1,
2.200087, 0.4715262, 0.5005189, 1, 0, 0.05490196, 1,
2.226455, 0.1089249, 2.132498, 1, 0, 0.04705882, 1,
2.241699, -1.192179, 2.747429, 1, 0, 0.04313726, 1,
2.319329, -0.747752, 3.660676, 1, 0, 0.03529412, 1,
2.394671, 0.9213486, 2.679141, 1, 0, 0.03137255, 1,
2.543478, 0.7771133, 1.299871, 1, 0, 0.02352941, 1,
2.564167, 0.8162473, -0.3579095, 1, 0, 0.01960784, 1,
3.348398, -0.2027719, 1.913955, 1, 0, 0.01176471, 1,
3.425304, -0.5001357, 1.481377, 1, 0, 0.007843138, 1
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
-0.1092867, -3.96983, -7.629545, 0, -0.5, 0.5, 0.5,
-0.1092867, -3.96983, -7.629545, 1, -0.5, 0.5, 0.5,
-0.1092867, -3.96983, -7.629545, 1, 1.5, 0.5, 0.5,
-0.1092867, -3.96983, -7.629545, 0, 1.5, 0.5, 0.5
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
-4.842104, 0.07191825, -7.629545, 0, -0.5, 0.5, 0.5,
-4.842104, 0.07191825, -7.629545, 1, -0.5, 0.5, 0.5,
-4.842104, 0.07191825, -7.629545, 1, 1.5, 0.5, 0.5,
-4.842104, 0.07191825, -7.629545, 0, 1.5, 0.5, 0.5
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
-4.842104, -3.96983, -0.3549109, 0, -0.5, 0.5, 0.5,
-4.842104, -3.96983, -0.3549109, 1, -0.5, 0.5, 0.5,
-4.842104, -3.96983, -0.3549109, 1, 1.5, 0.5, 0.5,
-4.842104, -3.96983, -0.3549109, 0, 1.5, 0.5, 0.5
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
-2, -3.037119, -5.950783,
2, -3.037119, -5.950783,
-2, -3.037119, -5.950783,
-2, -3.192571, -6.230577,
0, -3.037119, -5.950783,
0, -3.192571, -6.230577,
2, -3.037119, -5.950783,
2, -3.192571, -6.230577
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
"0",
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
-2, -3.503474, -6.790164, 0, -0.5, 0.5, 0.5,
-2, -3.503474, -6.790164, 1, -0.5, 0.5, 0.5,
-2, -3.503474, -6.790164, 1, 1.5, 0.5, 0.5,
-2, -3.503474, -6.790164, 0, 1.5, 0.5, 0.5,
0, -3.503474, -6.790164, 0, -0.5, 0.5, 0.5,
0, -3.503474, -6.790164, 1, -0.5, 0.5, 0.5,
0, -3.503474, -6.790164, 1, 1.5, 0.5, 0.5,
0, -3.503474, -6.790164, 0, 1.5, 0.5, 0.5,
2, -3.503474, -6.790164, 0, -0.5, 0.5, 0.5,
2, -3.503474, -6.790164, 1, -0.5, 0.5, 0.5,
2, -3.503474, -6.790164, 1, 1.5, 0.5, 0.5,
2, -3.503474, -6.790164, 0, 1.5, 0.5, 0.5
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
-3.749915, -2, -5.950783,
-3.749915, 3, -5.950783,
-3.749915, -2, -5.950783,
-3.931947, -2, -6.230577,
-3.749915, -1, -5.950783,
-3.931947, -1, -6.230577,
-3.749915, 0, -5.950783,
-3.931947, 0, -6.230577,
-3.749915, 1, -5.950783,
-3.931947, 1, -6.230577,
-3.749915, 2, -5.950783,
-3.931947, 2, -6.230577,
-3.749915, 3, -5.950783,
-3.931947, 3, -6.230577
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
-4.29601, -2, -6.790164, 0, -0.5, 0.5, 0.5,
-4.29601, -2, -6.790164, 1, -0.5, 0.5, 0.5,
-4.29601, -2, -6.790164, 1, 1.5, 0.5, 0.5,
-4.29601, -2, -6.790164, 0, 1.5, 0.5, 0.5,
-4.29601, -1, -6.790164, 0, -0.5, 0.5, 0.5,
-4.29601, -1, -6.790164, 1, -0.5, 0.5, 0.5,
-4.29601, -1, -6.790164, 1, 1.5, 0.5, 0.5,
-4.29601, -1, -6.790164, 0, 1.5, 0.5, 0.5,
-4.29601, 0, -6.790164, 0, -0.5, 0.5, 0.5,
-4.29601, 0, -6.790164, 1, -0.5, 0.5, 0.5,
-4.29601, 0, -6.790164, 1, 1.5, 0.5, 0.5,
-4.29601, 0, -6.790164, 0, 1.5, 0.5, 0.5,
-4.29601, 1, -6.790164, 0, -0.5, 0.5, 0.5,
-4.29601, 1, -6.790164, 1, -0.5, 0.5, 0.5,
-4.29601, 1, -6.790164, 1, 1.5, 0.5, 0.5,
-4.29601, 1, -6.790164, 0, 1.5, 0.5, 0.5,
-4.29601, 2, -6.790164, 0, -0.5, 0.5, 0.5,
-4.29601, 2, -6.790164, 1, -0.5, 0.5, 0.5,
-4.29601, 2, -6.790164, 1, 1.5, 0.5, 0.5,
-4.29601, 2, -6.790164, 0, 1.5, 0.5, 0.5,
-4.29601, 3, -6.790164, 0, -0.5, 0.5, 0.5,
-4.29601, 3, -6.790164, 1, -0.5, 0.5, 0.5,
-4.29601, 3, -6.790164, 1, 1.5, 0.5, 0.5,
-4.29601, 3, -6.790164, 0, 1.5, 0.5, 0.5
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
-3.749915, -3.037119, -4,
-3.749915, -3.037119, 4,
-3.749915, -3.037119, -4,
-3.931947, -3.192571, -4,
-3.749915, -3.037119, -2,
-3.931947, -3.192571, -2,
-3.749915, -3.037119, 0,
-3.931947, -3.192571, 0,
-3.749915, -3.037119, 2,
-3.931947, -3.192571, 2,
-3.749915, -3.037119, 4,
-3.931947, -3.192571, 4
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
-4.29601, -3.503474, -4, 0, -0.5, 0.5, 0.5,
-4.29601, -3.503474, -4, 1, -0.5, 0.5, 0.5,
-4.29601, -3.503474, -4, 1, 1.5, 0.5, 0.5,
-4.29601, -3.503474, -4, 0, 1.5, 0.5, 0.5,
-4.29601, -3.503474, -2, 0, -0.5, 0.5, 0.5,
-4.29601, -3.503474, -2, 1, -0.5, 0.5, 0.5,
-4.29601, -3.503474, -2, 1, 1.5, 0.5, 0.5,
-4.29601, -3.503474, -2, 0, 1.5, 0.5, 0.5,
-4.29601, -3.503474, 0, 0, -0.5, 0.5, 0.5,
-4.29601, -3.503474, 0, 1, -0.5, 0.5, 0.5,
-4.29601, -3.503474, 0, 1, 1.5, 0.5, 0.5,
-4.29601, -3.503474, 0, 0, 1.5, 0.5, 0.5,
-4.29601, -3.503474, 2, 0, -0.5, 0.5, 0.5,
-4.29601, -3.503474, 2, 1, -0.5, 0.5, 0.5,
-4.29601, -3.503474, 2, 1, 1.5, 0.5, 0.5,
-4.29601, -3.503474, 2, 0, 1.5, 0.5, 0.5,
-4.29601, -3.503474, 4, 0, -0.5, 0.5, 0.5,
-4.29601, -3.503474, 4, 1, -0.5, 0.5, 0.5,
-4.29601, -3.503474, 4, 1, 1.5, 0.5, 0.5,
-4.29601, -3.503474, 4, 0, 1.5, 0.5, 0.5
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
-3.749915, -3.037119, -5.950783,
-3.749915, 3.180955, -5.950783,
-3.749915, -3.037119, 5.240962,
-3.749915, 3.180955, 5.240962,
-3.749915, -3.037119, -5.950783,
-3.749915, -3.037119, 5.240962,
-3.749915, 3.180955, -5.950783,
-3.749915, 3.180955, 5.240962,
-3.749915, -3.037119, -5.950783,
3.531342, -3.037119, -5.950783,
-3.749915, -3.037119, 5.240962,
3.531342, -3.037119, 5.240962,
-3.749915, 3.180955, -5.950783,
3.531342, 3.180955, -5.950783,
-3.749915, 3.180955, 5.240962,
3.531342, 3.180955, 5.240962,
3.531342, -3.037119, -5.950783,
3.531342, 3.180955, -5.950783,
3.531342, -3.037119, 5.240962,
3.531342, 3.180955, 5.240962,
3.531342, -3.037119, -5.950783,
3.531342, -3.037119, 5.240962,
3.531342, 3.180955, -5.950783,
3.531342, 3.180955, 5.240962
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
var radius = 7.864871;
var distance = 34.9917;
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
mvMatrix.translate( 0.1092867, -0.07191825, 0.3549109 );
mvMatrix.scale( 1.167882, 1.36757, 0.7598147 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.9917);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
fenbuconazole<-read.table("fenbuconazole.xyz")
```

```
## Error in read.table("fenbuconazole.xyz"): no lines available in input
```

```r
x<-fenbuconazole$V2
```

```
## Error in eval(expr, envir, enclos): object 'fenbuconazole' not found
```

```r
y<-fenbuconazole$V3
```

```
## Error in eval(expr, envir, enclos): object 'fenbuconazole' not found
```

```r
z<-fenbuconazole$V4
```

```
## Error in eval(expr, envir, enclos): object 'fenbuconazole' not found
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
-3.643878, 0.2631152, -2.005672, 0, 0, 1, 1, 1,
-2.950306, -0.2408233, -0.3246597, 1, 0, 0, 1, 1,
-2.937592, 2.03236, -3.826335, 1, 0, 0, 1, 1,
-2.926497, 0.706829, -1.446939, 1, 0, 0, 1, 1,
-2.757069, 0.07958411, -2.278965, 1, 0, 0, 1, 1,
-2.686743, -0.1194709, 0.1835708, 1, 0, 0, 1, 1,
-2.674446, -1.308355, -1.900119, 0, 0, 0, 1, 1,
-2.515211, -0.1628977, -2.453373, 0, 0, 0, 1, 1,
-2.498713, 1.79302, 1.083431, 0, 0, 0, 1, 1,
-2.343567, 0.8086428, -2.044266, 0, 0, 0, 1, 1,
-2.327755, -0.8843949, -0.8439912, 0, 0, 0, 1, 1,
-2.297117, 1.027623, -0.7920824, 0, 0, 0, 1, 1,
-2.26899, 1.209646, -0.3383698, 0, 0, 0, 1, 1,
-2.211041, -1.324916, -1.828319, 1, 1, 1, 1, 1,
-2.199026, -0.7589759, -0.5156307, 1, 1, 1, 1, 1,
-2.159223, -2.50384, -1.207956, 1, 1, 1, 1, 1,
-2.120463, -2.167176, -4.094388, 1, 1, 1, 1, 1,
-2.057334, -0.745017, -1.777092, 1, 1, 1, 1, 1,
-2.055212, 0.2667544, -2.247017, 1, 1, 1, 1, 1,
-2.052411, -0.5467685, -2.148482, 1, 1, 1, 1, 1,
-2.003937, -0.7352564, -0.1575128, 1, 1, 1, 1, 1,
-1.991655, -1.20315, -3.366744, 1, 1, 1, 1, 1,
-1.975355, 0.8120047, -0.7365154, 1, 1, 1, 1, 1,
-1.935589, 0.2062447, -1.714498, 1, 1, 1, 1, 1,
-1.928825, 2.673352, -0.8803303, 1, 1, 1, 1, 1,
-1.913205, 0.1491238, -1.984981, 1, 1, 1, 1, 1,
-1.91064, 1.279523, -2.276607, 1, 1, 1, 1, 1,
-1.890682, -1.683098, -1.970657, 1, 1, 1, 1, 1,
-1.830306, 1.253095, -1.542685, 0, 0, 1, 1, 1,
-1.812754, -0.03862557, -2.622579, 1, 0, 0, 1, 1,
-1.803244, -1.168246, -1.209266, 1, 0, 0, 1, 1,
-1.797952, -0.2597319, -3.193449, 1, 0, 0, 1, 1,
-1.795147, -1.716176, -1.363464, 1, 0, 0, 1, 1,
-1.789963, -1.508296, -2.149796, 1, 0, 0, 1, 1,
-1.785167, 1.136557, -1.734436, 0, 0, 0, 1, 1,
-1.769047, 0.6764922, -1.353565, 0, 0, 0, 1, 1,
-1.768429, -0.3458871, -1.093935, 0, 0, 0, 1, 1,
-1.757606, -0.1802993, -1.524544, 0, 0, 0, 1, 1,
-1.75502, -1.039855, -0.8316383, 0, 0, 0, 1, 1,
-1.750917, -0.4625874, -0.7230946, 0, 0, 0, 1, 1,
-1.716095, -0.5223472, -1.613885, 0, 0, 0, 1, 1,
-1.708313, -0.08956333, -0.8169025, 1, 1, 1, 1, 1,
-1.702936, -0.6059916, -3.28667, 1, 1, 1, 1, 1,
-1.702734, 0.5869411, -1.517402, 1, 1, 1, 1, 1,
-1.69991, 1.328863, -0.5800869, 1, 1, 1, 1, 1,
-1.699246, 0.3667896, -1.090123, 1, 1, 1, 1, 1,
-1.680226, -0.7570305, -1.769444, 1, 1, 1, 1, 1,
-1.680107, -0.9725356, -2.429016, 1, 1, 1, 1, 1,
-1.67008, -2.591245, -2.522611, 1, 1, 1, 1, 1,
-1.666912, 0.4510739, -0.6498479, 1, 1, 1, 1, 1,
-1.654591, 0.4661275, -0.8652761, 1, 1, 1, 1, 1,
-1.644367, -0.02105924, -1.010095, 1, 1, 1, 1, 1,
-1.639264, 0.3534842, -1.271017, 1, 1, 1, 1, 1,
-1.634131, 0.007044838, -1.426881, 1, 1, 1, 1, 1,
-1.625091, -0.3229766, -0.3152411, 1, 1, 1, 1, 1,
-1.590194, -1.389172, -3.509947, 1, 1, 1, 1, 1,
-1.580224, -0.08005779, -1.943939, 0, 0, 1, 1, 1,
-1.575563, 0.03639116, -1.106196, 1, 0, 0, 1, 1,
-1.570096, -1.857646, -1.344399, 1, 0, 0, 1, 1,
-1.56038, 0.3920061, -2.088885, 1, 0, 0, 1, 1,
-1.559404, 1.774137, -1.822278, 1, 0, 0, 1, 1,
-1.543894, -0.2758257, -2.002909, 1, 0, 0, 1, 1,
-1.539581, 0.6852586, -1.354093, 0, 0, 0, 1, 1,
-1.532635, -0.07627469, 0.2109145, 0, 0, 0, 1, 1,
-1.529195, 1.826039, -0.8680768, 0, 0, 0, 1, 1,
-1.513489, -2.428787, -2.570951, 0, 0, 0, 1, 1,
-1.506208, 0.4000231, -0.3115563, 0, 0, 0, 1, 1,
-1.502098, 1.046633, -0.4215811, 0, 0, 0, 1, 1,
-1.499328, -1.21228, -2.640362, 0, 0, 0, 1, 1,
-1.494234, 0.3347581, -0.3600945, 1, 1, 1, 1, 1,
-1.478281, -0.3694639, -1.516417, 1, 1, 1, 1, 1,
-1.475249, -1.051746, -1.307705, 1, 1, 1, 1, 1,
-1.47241, -0.7146856, -2.99876, 1, 1, 1, 1, 1,
-1.469795, 1.37846, -0.353208, 1, 1, 1, 1, 1,
-1.467829, -0.6974109, -2.239974, 1, 1, 1, 1, 1,
-1.464745, 0.7928391, 0.3766949, 1, 1, 1, 1, 1,
-1.458199, -0.6423356, -3.633911, 1, 1, 1, 1, 1,
-1.450839, 1.087459, -1.793617, 1, 1, 1, 1, 1,
-1.447049, 0.2356366, -0.1542857, 1, 1, 1, 1, 1,
-1.435125, -0.5210682, -2.200908, 1, 1, 1, 1, 1,
-1.419796, 0.07189304, -0.5524867, 1, 1, 1, 1, 1,
-1.394117, 0.3439541, -0.7411351, 1, 1, 1, 1, 1,
-1.393156, -1.18037, -2.450257, 1, 1, 1, 1, 1,
-1.387878, 0.5505531, -1.035894, 1, 1, 1, 1, 1,
-1.387772, -0.1911922, -1.12528, 0, 0, 1, 1, 1,
-1.383832, -1.746831, -1.57888, 1, 0, 0, 1, 1,
-1.357392, -1.488486, -3.571684, 1, 0, 0, 1, 1,
-1.355213, 0.7494104, -0.3351321, 1, 0, 0, 1, 1,
-1.329538, 0.6324709, -1.627175, 1, 0, 0, 1, 1,
-1.325301, 0.9642415, 0.6243687, 1, 0, 0, 1, 1,
-1.318067, -1.711411, -3.047623, 0, 0, 0, 1, 1,
-1.316909, 0.1889986, -2.411506, 0, 0, 0, 1, 1,
-1.304496, -0.4361729, -0.8689265, 0, 0, 0, 1, 1,
-1.301385, 0.5012898, -0.9269372, 0, 0, 0, 1, 1,
-1.299133, -0.2560285, -0.5156311, 0, 0, 0, 1, 1,
-1.293328, 0.7183682, -1.751971, 0, 0, 0, 1, 1,
-1.293148, -0.5331015, -1.051346, 0, 0, 0, 1, 1,
-1.282383, -0.963815, -1.679109, 1, 1, 1, 1, 1,
-1.277187, -0.1679091, -3.167412, 1, 1, 1, 1, 1,
-1.271235, -0.01399109, -2.004595, 1, 1, 1, 1, 1,
-1.270792, 0.5285944, -2.674964, 1, 1, 1, 1, 1,
-1.255641, -0.8110994, -2.018665, 1, 1, 1, 1, 1,
-1.236717, -0.8553413, -3.827574, 1, 1, 1, 1, 1,
-1.225724, 0.2643346, -1.27919, 1, 1, 1, 1, 1,
-1.222623, 0.6776738, -1.787889, 1, 1, 1, 1, 1,
-1.203944, -1.555908, -1.080171, 1, 1, 1, 1, 1,
-1.203034, -0.03471185, -0.8465179, 1, 1, 1, 1, 1,
-1.198399, 1.466364, -1.213107, 1, 1, 1, 1, 1,
-1.192648, 0.8774118, -0.612882, 1, 1, 1, 1, 1,
-1.19135, 1.624573, -0.6997381, 1, 1, 1, 1, 1,
-1.189034, -0.3124387, -3.020969, 1, 1, 1, 1, 1,
-1.187889, -0.5681046, -2.121672, 1, 1, 1, 1, 1,
-1.173765, -0.2452872, -1.776076, 0, 0, 1, 1, 1,
-1.167719, 1.550944, -0.9397938, 1, 0, 0, 1, 1,
-1.160027, 1.549649, -0.2650065, 1, 0, 0, 1, 1,
-1.153171, 0.3580694, -0.8053296, 1, 0, 0, 1, 1,
-1.147265, 0.06807463, -3.167033, 1, 0, 0, 1, 1,
-1.145435, 0.4983639, -0.5827834, 1, 0, 0, 1, 1,
-1.140434, -0.6819227, -1.192706, 0, 0, 0, 1, 1,
-1.132278, -0.2069828, -2.72294, 0, 0, 0, 1, 1,
-1.119353, -0.8517081, -2.424566, 0, 0, 0, 1, 1,
-1.119105, -0.5171984, -0.04003276, 0, 0, 0, 1, 1,
-1.118106, 0.5832299, -0.1799008, 0, 0, 0, 1, 1,
-1.116807, 0.9285003, -0.9875081, 0, 0, 0, 1, 1,
-1.111178, 0.9844381, -1.336665, 0, 0, 0, 1, 1,
-1.109212, 0.414699, -2.48138, 1, 1, 1, 1, 1,
-1.095643, -0.4029932, -1.702746, 1, 1, 1, 1, 1,
-1.090794, -0.2262009, -2.276917, 1, 1, 1, 1, 1,
-1.086099, 0.6035164, -1.616629, 1, 1, 1, 1, 1,
-1.08488, -1.837482, -3.607675, 1, 1, 1, 1, 1,
-1.079712, 1.458026, 0.3757255, 1, 1, 1, 1, 1,
-1.07573, -1.326443, -3.644317, 1, 1, 1, 1, 1,
-1.075309, 0.1032225, -3.688518, 1, 1, 1, 1, 1,
-1.073893, 0.8337189, -1.06592, 1, 1, 1, 1, 1,
-1.070542, -2.15275, -0.86171, 1, 1, 1, 1, 1,
-1.065712, -0.9666268, -2.913876, 1, 1, 1, 1, 1,
-1.053982, -0.7068048, -4.472378, 1, 1, 1, 1, 1,
-1.047156, -0.7003643, -2.636352, 1, 1, 1, 1, 1,
-1.045286, 1.298995, -2.228235, 1, 1, 1, 1, 1,
-1.044665, -1.465973, -3.239803, 1, 1, 1, 1, 1,
-1.044397, -1.769078, -3.397824, 0, 0, 1, 1, 1,
-1.042112, -0.1915711, -3.48493, 1, 0, 0, 1, 1,
-1.030615, -0.2728056, -1.445548, 1, 0, 0, 1, 1,
-1.030003, 0.7310408, 0.4889053, 1, 0, 0, 1, 1,
-1.029802, -1.238989, -0.6707662, 1, 0, 0, 1, 1,
-1.029507, 2.265805, -0.5940133, 1, 0, 0, 1, 1,
-1.028497, 0.6623639, -1.452595, 0, 0, 0, 1, 1,
-1.027302, 0.8727627, -1.187258, 0, 0, 0, 1, 1,
-1.027122, 0.1202056, -0.5266839, 0, 0, 0, 1, 1,
-1.026124, 0.8092514, -1.570617, 0, 0, 0, 1, 1,
-1.023895, -1.012872, 0.1707781, 0, 0, 0, 1, 1,
-1.018249, -1.400532, -2.056547, 0, 0, 0, 1, 1,
-1.014113, -0.6155179, -2.221153, 0, 0, 0, 1, 1,
-1.003659, 0.9810979, -0.3529843, 1, 1, 1, 1, 1,
-0.9966062, 0.7868744, 0.6388048, 1, 1, 1, 1, 1,
-0.9949136, 0.6052445, -1.615081, 1, 1, 1, 1, 1,
-0.9931087, -0.3827008, -3.573422, 1, 1, 1, 1, 1,
-0.9909495, 0.9926036, 0.4580406, 1, 1, 1, 1, 1,
-0.9829677, 1.628448, -0.2893116, 1, 1, 1, 1, 1,
-0.9817951, 1.838471, -1.439128, 1, 1, 1, 1, 1,
-0.9790815, -1.85379, -3.305886, 1, 1, 1, 1, 1,
-0.9782519, -0.2727068, -1.552272, 1, 1, 1, 1, 1,
-0.9727783, 0.01368039, -1.630102, 1, 1, 1, 1, 1,
-0.9704801, 0.05202487, -2.022079, 1, 1, 1, 1, 1,
-0.9690582, -1.234831, -0.3528893, 1, 1, 1, 1, 1,
-0.9648582, -1.019549, -1.258744, 1, 1, 1, 1, 1,
-0.9552146, 0.2932114, -2.184917, 1, 1, 1, 1, 1,
-0.952831, 1.06439, -1.055745, 1, 1, 1, 1, 1,
-0.9509308, 0.2855994, -1.835716, 0, 0, 1, 1, 1,
-0.948145, 1.352711, 0.8002625, 1, 0, 0, 1, 1,
-0.9473527, 1.130005, -1.138528, 1, 0, 0, 1, 1,
-0.9457686, -0.2006402, -2.713333, 1, 0, 0, 1, 1,
-0.944746, -0.8923989, -3.463869, 1, 0, 0, 1, 1,
-0.9410726, -1.086438, -2.702966, 1, 0, 0, 1, 1,
-0.9401374, 0.7445885, -1.143406, 0, 0, 0, 1, 1,
-0.9312279, 0.8643154, -0.3526059, 0, 0, 0, 1, 1,
-0.9257906, -0.8473009, -1.382485, 0, 0, 0, 1, 1,
-0.9173839, -0.4833865, -4.270027, 0, 0, 0, 1, 1,
-0.91631, -0.7746061, -2.619593, 0, 0, 0, 1, 1,
-0.9137329, -0.6278718, -2.758618, 0, 0, 0, 1, 1,
-0.913284, 0.453733, -1.216011, 0, 0, 0, 1, 1,
-0.9085798, -1.847754, -2.255791, 1, 1, 1, 1, 1,
-0.9068611, -2.856218, -2.867222, 1, 1, 1, 1, 1,
-0.8990381, 0.4000878, -1.103231, 1, 1, 1, 1, 1,
-0.895979, -0.8764733, -3.300045, 1, 1, 1, 1, 1,
-0.8948309, 0.4675162, -0.2940637, 1, 1, 1, 1, 1,
-0.8935601, 0.5626565, -0.3495095, 1, 1, 1, 1, 1,
-0.8883082, -0.05960388, -2.078574, 1, 1, 1, 1, 1,
-0.8878471, 0.1370896, -0.6211291, 1, 1, 1, 1, 1,
-0.8816014, 0.9731967, -0.2660002, 1, 1, 1, 1, 1,
-0.8779948, -1.242224, -1.187567, 1, 1, 1, 1, 1,
-0.8731996, -0.9109647, -3.514406, 1, 1, 1, 1, 1,
-0.8712809, 0.625136, -0.4355396, 1, 1, 1, 1, 1,
-0.8700899, 2.003961, -0.01637262, 1, 1, 1, 1, 1,
-0.8542869, -0.7124813, -3.622447, 1, 1, 1, 1, 1,
-0.8525209, 0.601949, 0.02818477, 1, 1, 1, 1, 1,
-0.849521, -0.5477925, -4.439265, 0, 0, 1, 1, 1,
-0.8480777, -0.03531561, -2.060405, 1, 0, 0, 1, 1,
-0.8388649, -0.5457383, -1.866427, 1, 0, 0, 1, 1,
-0.8388557, 1.133991, 0.06604668, 1, 0, 0, 1, 1,
-0.8370916, 0.19362, -1.689195, 1, 0, 0, 1, 1,
-0.8322293, -0.01530493, -1.939254, 1, 0, 0, 1, 1,
-0.82809, -0.8838761, -2.436852, 0, 0, 0, 1, 1,
-0.8137004, 0.8522136, -1.703305, 0, 0, 0, 1, 1,
-0.8055645, -0.6579545, -2.784125, 0, 0, 0, 1, 1,
-0.8051702, -1.349605, -1.485722, 0, 0, 0, 1, 1,
-0.8027344, 0.393266, -1.12632, 0, 0, 0, 1, 1,
-0.8015699, -0.2341896, -1.488423, 0, 0, 0, 1, 1,
-0.7995565, -0.2418804, -3.344784, 0, 0, 0, 1, 1,
-0.7910874, 0.2648059, -0.1538293, 1, 1, 1, 1, 1,
-0.7897029, 1.326243, 0.03011167, 1, 1, 1, 1, 1,
-0.7895171, 0.8766488, 0.1442051, 1, 1, 1, 1, 1,
-0.7854557, -0.6862981, -3.314725, 1, 1, 1, 1, 1,
-0.7849308, 1.481733, 0.1252945, 1, 1, 1, 1, 1,
-0.7805824, 0.0437525, -4.80793, 1, 1, 1, 1, 1,
-0.7780982, 0.6641432, -0.03639501, 1, 1, 1, 1, 1,
-0.7746981, -0.749944, -2.634754, 1, 1, 1, 1, 1,
-0.7746503, 2.425616, -0.7053616, 1, 1, 1, 1, 1,
-0.7680979, 0.6847433, 0.3542317, 1, 1, 1, 1, 1,
-0.7648975, -0.110116, -4.019198, 1, 1, 1, 1, 1,
-0.7613746, -0.9750157, -0.1066129, 1, 1, 1, 1, 1,
-0.7595028, -0.6688542, -1.592497, 1, 1, 1, 1, 1,
-0.7567847, 0.4311208, -2.868454, 1, 1, 1, 1, 1,
-0.753503, -0.9022471, -0.03531811, 1, 1, 1, 1, 1,
-0.7524175, -0.4434395, -3.564174, 0, 0, 1, 1, 1,
-0.7458568, 0.7474232, -2.32638, 1, 0, 0, 1, 1,
-0.7453187, 0.415477, 0.438503, 1, 0, 0, 1, 1,
-0.7336794, 1.174443, -1.609419, 1, 0, 0, 1, 1,
-0.71957, 0.71592, 0.7016526, 1, 0, 0, 1, 1,
-0.719093, 1.571836, 1.307386, 1, 0, 0, 1, 1,
-0.7188666, 0.6363828, -0.9891972, 0, 0, 0, 1, 1,
-0.7184794, 0.5954083, -2.222124, 0, 0, 0, 1, 1,
-0.7182437, 1.306296, -0.07908458, 0, 0, 0, 1, 1,
-0.7156452, 0.3487728, -0.5815338, 0, 0, 0, 1, 1,
-0.711136, -1.761312, -3.25156, 0, 0, 0, 1, 1,
-0.7102164, 0.828101, 0.5383246, 0, 0, 0, 1, 1,
-0.7101831, 1.536593, -1.36313, 0, 0, 0, 1, 1,
-0.7091368, 0.7672955, -1.335187, 1, 1, 1, 1, 1,
-0.708666, 0.738579, 0.03591501, 1, 1, 1, 1, 1,
-0.6974162, 0.3675953, -0.8606721, 1, 1, 1, 1, 1,
-0.6955655, 1.38116, 0.1778595, 1, 1, 1, 1, 1,
-0.6952916, 0.9316724, -2.165931, 1, 1, 1, 1, 1,
-0.6952109, -0.5576457, -3.497815, 1, 1, 1, 1, 1,
-0.6933752, 0.2622298, -0.4676135, 1, 1, 1, 1, 1,
-0.6889985, -0.00981793, -1.390672, 1, 1, 1, 1, 1,
-0.6867515, -1.98104, -3.399418, 1, 1, 1, 1, 1,
-0.6840209, -1.396717, -5.205946, 1, 1, 1, 1, 1,
-0.6818473, -0.197891, -2.779124, 1, 1, 1, 1, 1,
-0.6794042, 1.567643, -0.8037884, 1, 1, 1, 1, 1,
-0.6709583, 1.838655, 0.9629292, 1, 1, 1, 1, 1,
-0.6695572, -0.07964651, -0.2639686, 1, 1, 1, 1, 1,
-0.6677868, -1.105711, -3.231885, 1, 1, 1, 1, 1,
-0.663978, -0.3956672, -1.447644, 0, 0, 1, 1, 1,
-0.6627491, 0.7870673, 0.3559997, 1, 0, 0, 1, 1,
-0.6556332, 0.440431, -0.6829013, 1, 0, 0, 1, 1,
-0.6545681, -1.089846, -4.145904, 1, 0, 0, 1, 1,
-0.6446984, -2.073854, -1.952591, 1, 0, 0, 1, 1,
-0.6380101, -0.2421176, -2.119911, 1, 0, 0, 1, 1,
-0.6376167, -1.683755, -1.764622, 0, 0, 0, 1, 1,
-0.636259, 0.2210679, -2.348666, 0, 0, 0, 1, 1,
-0.6351783, -1.349671, -2.854193, 0, 0, 0, 1, 1,
-0.6255824, -0.1761483, -2.439179, 0, 0, 0, 1, 1,
-0.621811, -0.02649002, -2.102321, 0, 0, 0, 1, 1,
-0.620673, 1.599307, -0.6109621, 0, 0, 0, 1, 1,
-0.6168894, 0.6593801, 0.9160328, 0, 0, 0, 1, 1,
-0.6134882, 0.2251644, -0.7707813, 1, 1, 1, 1, 1,
-0.6085516, -0.7221863, -2.342212, 1, 1, 1, 1, 1,
-0.608153, 0.6252729, -0.8598537, 1, 1, 1, 1, 1,
-0.6080813, -0.3142605, -0.8020898, 1, 1, 1, 1, 1,
-0.6073588, -0.03897281, -2.305921, 1, 1, 1, 1, 1,
-0.6060948, 0.7726907, 0.1204329, 1, 1, 1, 1, 1,
-0.6049787, -1.690794, -1.596916, 1, 1, 1, 1, 1,
-0.5997474, -1.070863, -1.922084, 1, 1, 1, 1, 1,
-0.5960563, 0.8649552, 0.4362018, 1, 1, 1, 1, 1,
-0.5940945, 1.272426, -0.4688324, 1, 1, 1, 1, 1,
-0.5935891, -0.04361046, -2.085683, 1, 1, 1, 1, 1,
-0.5907212, 0.7740894, -0.7444027, 1, 1, 1, 1, 1,
-0.5889552, 0.2170407, -1.090809, 1, 1, 1, 1, 1,
-0.5877441, 0.1946285, -0.937421, 1, 1, 1, 1, 1,
-0.5833483, -0.0007602534, 0.04782358, 1, 1, 1, 1, 1,
-0.5774212, -0.3113155, -2.45558, 0, 0, 1, 1, 1,
-0.5763412, -0.4762132, -3.068117, 1, 0, 0, 1, 1,
-0.5742148, 1.1432, -1.414465, 1, 0, 0, 1, 1,
-0.567188, 0.5116279, -0.1074039, 1, 0, 0, 1, 1,
-0.5614161, 1.628042, -0.9414132, 1, 0, 0, 1, 1,
-0.559154, 0.3534185, -1.532057, 1, 0, 0, 1, 1,
-0.5588701, -1.147562, -4.306415, 0, 0, 0, 1, 1,
-0.5470535, 0.3604186, -1.363639, 0, 0, 0, 1, 1,
-0.5449638, -0.9444265, -3.853719, 0, 0, 0, 1, 1,
-0.5389882, -0.1810033, -1.560615, 0, 0, 0, 1, 1,
-0.5386745, -1.172857, -2.839912, 0, 0, 0, 1, 1,
-0.5348157, 0.6164651, -0.5726603, 0, 0, 0, 1, 1,
-0.5325015, -0.4933782, -3.066257, 0, 0, 0, 1, 1,
-0.5296721, 0.7490832, -0.03977874, 1, 1, 1, 1, 1,
-0.5263363, -0.8463242, -1.746753, 1, 1, 1, 1, 1,
-0.5238276, 2.22974, -1.710695, 1, 1, 1, 1, 1,
-0.5149828, 0.6881554, -1.024093, 1, 1, 1, 1, 1,
-0.5144446, -0.1647663, 0.2169792, 1, 1, 1, 1, 1,
-0.5135378, -0.0342905, -1.885141, 1, 1, 1, 1, 1,
-0.5118583, -1.517477, -3.184141, 1, 1, 1, 1, 1,
-0.5115824, -0.7918035, -1.308651, 1, 1, 1, 1, 1,
-0.5114827, -0.4180965, -1.867566, 1, 1, 1, 1, 1,
-0.5073908, -1.021573, -2.597752, 1, 1, 1, 1, 1,
-0.5064734, -0.0929708, -2.007025, 1, 1, 1, 1, 1,
-0.5041524, -0.1141833, -0.5904901, 1, 1, 1, 1, 1,
-0.4997818, -0.1527179, -2.538251, 1, 1, 1, 1, 1,
-0.4979835, 0.2269177, -2.736845, 1, 1, 1, 1, 1,
-0.4918165, -2.101214, -1.821523, 1, 1, 1, 1, 1,
-0.475166, -0.7998698, -4.172023, 0, 0, 1, 1, 1,
-0.4725702, 0.635267, -2.200282, 1, 0, 0, 1, 1,
-0.4725246, 1.288733, -0.2961559, 1, 0, 0, 1, 1,
-0.4689375, 1.021034, -1.591538, 1, 0, 0, 1, 1,
-0.468345, -0.8558477, -2.448348, 1, 0, 0, 1, 1,
-0.4642952, 0.7722685, -1.97503, 1, 0, 0, 1, 1,
-0.4641866, 0.2721184, -0.9634024, 0, 0, 0, 1, 1,
-0.4621336, -0.5596648, -3.332995, 0, 0, 0, 1, 1,
-0.4600418, -0.9099071, -1.745653, 0, 0, 0, 1, 1,
-0.4569083, 1.169141, 0.2792422, 0, 0, 0, 1, 1,
-0.4558416, -0.2763489, -4.177364, 0, 0, 0, 1, 1,
-0.4523225, -1.26223, -3.502893, 0, 0, 0, 1, 1,
-0.4520234, 0.87063, -0.3268596, 0, 0, 0, 1, 1,
-0.4411192, 0.4860469, -0.6787888, 1, 1, 1, 1, 1,
-0.4404199, 0.4139395, -0.2118482, 1, 1, 1, 1, 1,
-0.4199421, -0.1341096, -2.727164, 1, 1, 1, 1, 1,
-0.4138026, 0.9525672, 0.04796135, 1, 1, 1, 1, 1,
-0.4115668, 0.6575238, -1.100078, 1, 1, 1, 1, 1,
-0.4106271, 0.3138914, -0.04373783, 1, 1, 1, 1, 1,
-0.4102355, 0.6507041, 0.3448343, 1, 1, 1, 1, 1,
-0.4087567, -0.07192371, -0.6499348, 1, 1, 1, 1, 1,
-0.4077299, 1.927904, -1.296409, 1, 1, 1, 1, 1,
-0.4066044, 1.177362, -0.1296561, 1, 1, 1, 1, 1,
-0.4007762, 0.04006565, -1.667887, 1, 1, 1, 1, 1,
-0.4001269, 0.9115883, -0.482592, 1, 1, 1, 1, 1,
-0.3992873, -0.6704627, -4.317476, 1, 1, 1, 1, 1,
-0.3912999, 1.329522, 0.1873749, 1, 1, 1, 1, 1,
-0.3909338, 1.058789, -1.535373, 1, 1, 1, 1, 1,
-0.3825803, 0.9035557, 2.001979, 0, 0, 1, 1, 1,
-0.3801824, -0.7153052, -1.737429, 1, 0, 0, 1, 1,
-0.3783873, -0.7685184, -3.284158, 1, 0, 0, 1, 1,
-0.3744551, 0.540413, -0.1769014, 1, 0, 0, 1, 1,
-0.3732711, 0.643946, 0.8077346, 1, 0, 0, 1, 1,
-0.3727082, 1.990627, 0.8083784, 1, 0, 0, 1, 1,
-0.3723553, -0.8364798, -2.90114, 0, 0, 0, 1, 1,
-0.3661916, -2.946564, -2.612896, 0, 0, 0, 1, 1,
-0.3617257, -0.5115328, -1.812218, 0, 0, 0, 1, 1,
-0.3583275, 0.767078, -0.7052263, 0, 0, 0, 1, 1,
-0.3551045, 1.455075, 0.2631672, 0, 0, 0, 1, 1,
-0.3547674, -0.7323756, -2.479153, 0, 0, 0, 1, 1,
-0.3534835, -1.250425, -3.269815, 0, 0, 0, 1, 1,
-0.3530178, 0.2105407, -0.4074197, 1, 1, 1, 1, 1,
-0.3502135, -1.098099, -4.0055, 1, 1, 1, 1, 1,
-0.3495772, -0.3980855, -1.634459, 1, 1, 1, 1, 1,
-0.3487794, -0.6489453, -1.711382, 1, 1, 1, 1, 1,
-0.3473662, -0.6573221, -3.265317, 1, 1, 1, 1, 1,
-0.3470271, -2.31393, -3.455611, 1, 1, 1, 1, 1,
-0.3357771, 1.249916, 0.1408556, 1, 1, 1, 1, 1,
-0.3352832, -2.492605, -2.508009, 1, 1, 1, 1, 1,
-0.3346443, 1.825601, 0.1794826, 1, 1, 1, 1, 1,
-0.3336881, -1.331196, -3.461789, 1, 1, 1, 1, 1,
-0.328612, -0.2508552, -3.225039, 1, 1, 1, 1, 1,
-0.3223411, -0.4903359, -2.008751, 1, 1, 1, 1, 1,
-0.322165, 0.1052474, -2.669143, 1, 1, 1, 1, 1,
-0.3178521, 0.9693691, 0.05545043, 1, 1, 1, 1, 1,
-0.3156772, -1.36557, -2.217478, 1, 1, 1, 1, 1,
-0.3155504, 0.6061604, -0.14383, 0, 0, 1, 1, 1,
-0.3107143, 0.9217649, -0.1432219, 1, 0, 0, 1, 1,
-0.3037978, -0.4070441, -3.643694, 1, 0, 0, 1, 1,
-0.3036167, 0.3733622, -1.335387, 1, 0, 0, 1, 1,
-0.3013811, -0.9216977, -1.307036, 1, 0, 0, 1, 1,
-0.2987358, -0.1416701, -2.592661, 1, 0, 0, 1, 1,
-0.2975382, -1.920429, -2.768204, 0, 0, 0, 1, 1,
-0.2902921, 0.7653585, -0.6069635, 0, 0, 0, 1, 1,
-0.2887698, 1.223804, -0.48277, 0, 0, 0, 1, 1,
-0.2869711, 1.104567, 1.216406, 0, 0, 0, 1, 1,
-0.2844751, 0.9629402, 0.8693669, 0, 0, 0, 1, 1,
-0.2835125, -0.1883462, -2.258017, 0, 0, 0, 1, 1,
-0.2832487, 1.60134, 1.689359, 0, 0, 0, 1, 1,
-0.2812319, 0.224246, 0.3948686, 1, 1, 1, 1, 1,
-0.2739063, 0.8709534, 1.202901, 1, 1, 1, 1, 1,
-0.2734055, 0.1270088, -0.3807354, 1, 1, 1, 1, 1,
-0.2690654, -0.8037239, -2.759005, 1, 1, 1, 1, 1,
-0.2674835, 0.0941084, 0.2004706, 1, 1, 1, 1, 1,
-0.2649625, -0.06601654, -3.392028, 1, 1, 1, 1, 1,
-0.2617561, 0.06362123, -1.395799, 1, 1, 1, 1, 1,
-0.2604588, -1.11239, -2.5153, 1, 1, 1, 1, 1,
-0.2567081, -0.6504964, -3.06877, 1, 1, 1, 1, 1,
-0.2504721, 0.2475979, -1.386839, 1, 1, 1, 1, 1,
-0.2493032, 0.2616241, -2.007944, 1, 1, 1, 1, 1,
-0.2487491, 1.657194, -0.173903, 1, 1, 1, 1, 1,
-0.2472321, 0.5184035, 0.02775489, 1, 1, 1, 1, 1,
-0.246337, -0.7055278, -3.168832, 1, 1, 1, 1, 1,
-0.2428209, 1.183064, 0.3811362, 1, 1, 1, 1, 1,
-0.2417464, 1.921465, -0.3027825, 0, 0, 1, 1, 1,
-0.2408588, -0.3553137, -2.02087, 1, 0, 0, 1, 1,
-0.2382948, 0.5486001, 0.1815894, 1, 0, 0, 1, 1,
-0.2377944, -0.6160115, -3.692204, 1, 0, 0, 1, 1,
-0.2345904, -0.7370399, -4.805452, 1, 0, 0, 1, 1,
-0.2336192, 2.19851, -1.467821, 1, 0, 0, 1, 1,
-0.2306318, -1.315221, -3.006006, 0, 0, 0, 1, 1,
-0.2258199, 0.8286855, -0.3374211, 0, 0, 0, 1, 1,
-0.2218061, -0.5027014, -1.804046, 0, 0, 0, 1, 1,
-0.2215978, 0.1752702, -0.9845612, 0, 0, 0, 1, 1,
-0.2211665, -1.079464, -1.139388, 0, 0, 0, 1, 1,
-0.2179371, 0.4266574, -1.480719, 0, 0, 0, 1, 1,
-0.2175624, 0.6418619, 0.6438532, 0, 0, 0, 1, 1,
-0.2128519, 0.4312091, -0.5115973, 1, 1, 1, 1, 1,
-0.2110456, 0.3184781, -0.7605104, 1, 1, 1, 1, 1,
-0.2089224, 1.354636, -0.8515341, 1, 1, 1, 1, 1,
-0.2082573, 0.0001110211, -0.4481463, 1, 1, 1, 1, 1,
-0.2081258, 0.7310649, 1.448042, 1, 1, 1, 1, 1,
-0.2080645, -0.2902513, -4.768602, 1, 1, 1, 1, 1,
-0.2065636, 0.3527853, -2.042665, 1, 1, 1, 1, 1,
-0.206193, -1.183541, -2.136015, 1, 1, 1, 1, 1,
-0.2051255, 0.02222947, -3.365505, 1, 1, 1, 1, 1,
-0.2020776, 0.455676, 1.02942, 1, 1, 1, 1, 1,
-0.1996566, 0.03535924, -1.645244, 1, 1, 1, 1, 1,
-0.1959666, 0.3308386, -1.486806, 1, 1, 1, 1, 1,
-0.1937511, -0.03496398, -1.878875, 1, 1, 1, 1, 1,
-0.1876767, 0.3107382, -1.507852, 1, 1, 1, 1, 1,
-0.1856653, 0.9341435, 1.815544, 1, 1, 1, 1, 1,
-0.1813373, -1.032833, -3.044575, 0, 0, 1, 1, 1,
-0.175769, -2.877846, -3.713501, 1, 0, 0, 1, 1,
-0.1735806, 0.7947388, -0.0004730593, 1, 0, 0, 1, 1,
-0.1719099, -0.7764161, -3.378035, 1, 0, 0, 1, 1,
-0.1709192, 1.190366, 0.3894692, 1, 0, 0, 1, 1,
-0.1683808, 0.0348146, -1.703063, 1, 0, 0, 1, 1,
-0.1636319, 1.045204, 0.1878554, 0, 0, 0, 1, 1,
-0.1630977, -1.398912, -3.947573, 0, 0, 0, 1, 1,
-0.1608949, -0.293704, -2.656984, 0, 0, 0, 1, 1,
-0.160084, -1.322324, -2.402558, 0, 0, 0, 1, 1,
-0.1598718, -1.055284, -3.372204, 0, 0, 0, 1, 1,
-0.1598614, -0.7855269, -1.939756, 0, 0, 0, 1, 1,
-0.1556949, -1.671623, -2.967297, 0, 0, 0, 1, 1,
-0.1497911, -0.3703677, -2.011401, 1, 1, 1, 1, 1,
-0.1491824, -0.1751086, -2.033898, 1, 1, 1, 1, 1,
-0.1437153, -1.287541, -1.67636, 1, 1, 1, 1, 1,
-0.1375988, 0.1945564, -1.924265, 1, 1, 1, 1, 1,
-0.1337121, -0.1976148, -2.367283, 1, 1, 1, 1, 1,
-0.1268211, -1.202011, -1.674606, 1, 1, 1, 1, 1,
-0.1197417, -0.1765414, -2.549335, 1, 1, 1, 1, 1,
-0.1187608, 0.5068434, 0.3371213, 1, 1, 1, 1, 1,
-0.1163585, 0.7111606, 0.08312239, 1, 1, 1, 1, 1,
-0.1161757, -0.1691189, -3.066092, 1, 1, 1, 1, 1,
-0.114417, 1.170267, -1.640285, 1, 1, 1, 1, 1,
-0.1090226, 0.5619831, -0.2699071, 1, 1, 1, 1, 1,
-0.108046, 0.7428493, 0.6877647, 1, 1, 1, 1, 1,
-0.1059288, 1.632604, -0.6090723, 1, 1, 1, 1, 1,
-0.1041936, -0.6740438, -0.7218053, 1, 1, 1, 1, 1,
-0.1041393, 1.484981, 0.9343441, 0, 0, 1, 1, 1,
-0.1007936, -0.2529629, -3.800149, 1, 0, 0, 1, 1,
-0.1002099, -0.8093522, -3.23315, 1, 0, 0, 1, 1,
-0.09919992, -0.009310559, -1.855205, 1, 0, 0, 1, 1,
-0.09785474, -0.8538434, -4.261908, 1, 0, 0, 1, 1,
-0.09399598, -0.0343593, -2.206403, 1, 0, 0, 1, 1,
-0.09391187, -0.8763542, -3.250394, 0, 0, 0, 1, 1,
-0.09379125, -1.019257, -4.738453, 0, 0, 0, 1, 1,
-0.0922479, -0.8067737, -2.065561, 0, 0, 0, 1, 1,
-0.08486953, 0.1479581, 0.2477582, 0, 0, 0, 1, 1,
-0.08044802, 0.6459563, -1.010425, 0, 0, 0, 1, 1,
-0.07749094, -1.007832, -3.037819, 0, 0, 0, 1, 1,
-0.07599521, 1.187, -1.956842, 0, 0, 0, 1, 1,
-0.07518993, -0.1950808, -1.364457, 1, 1, 1, 1, 1,
-0.07452492, 0.4174614, -0.7688153, 1, 1, 1, 1, 1,
-0.07336621, -0.6724917, -2.943036, 1, 1, 1, 1, 1,
-0.07112131, 0.1833064, -1.316437, 1, 1, 1, 1, 1,
-0.0678563, -0.07970437, -2.348333, 1, 1, 1, 1, 1,
-0.0675172, -0.8329507, -5.787796, 1, 1, 1, 1, 1,
-0.06690477, 2.433577, 0.1048875, 1, 1, 1, 1, 1,
-0.06415033, 0.8584624, -0.2296885, 1, 1, 1, 1, 1,
-0.06316815, -0.8509666, -1.354247, 1, 1, 1, 1, 1,
-0.06112241, 2.453944, -0.8522307, 1, 1, 1, 1, 1,
-0.05977101, -0.7443794, -3.119413, 1, 1, 1, 1, 1,
-0.0567128, -0.1452612, -1.8781, 1, 1, 1, 1, 1,
-0.05521606, -1.357495, -2.351823, 1, 1, 1, 1, 1,
-0.05383926, -0.039454, -2.737394, 1, 1, 1, 1, 1,
-0.05323806, -1.510403, -0.8188946, 1, 1, 1, 1, 1,
-0.05311703, -0.4098337, -2.802914, 0, 0, 1, 1, 1,
-0.04982326, -0.3121018, -1.722773, 1, 0, 0, 1, 1,
-0.04542309, -1.362309, -0.9915946, 1, 0, 0, 1, 1,
-0.04539556, -0.5856827, -1.835202, 1, 0, 0, 1, 1,
-0.04481191, 1.155232, -0.9522734, 1, 0, 0, 1, 1,
-0.04014926, 0.8825004, 0.1359114, 1, 0, 0, 1, 1,
-0.03614394, 0.3590529, -0.08317318, 0, 0, 0, 1, 1,
-0.03016, 0.1675042, -0.2571631, 0, 0, 0, 1, 1,
-0.024846, -0.9277698, -3.518105, 0, 0, 0, 1, 1,
-0.02338855, 0.4577803, -0.248217, 0, 0, 0, 1, 1,
-0.01973017, -0.9224842, -1.331786, 0, 0, 0, 1, 1,
-0.01878346, 0.8321357, 0.00767022, 0, 0, 0, 1, 1,
-0.01716048, -2.737012, -3.874102, 0, 0, 0, 1, 1,
-0.01686975, 0.4432163, -0.2750666, 1, 1, 1, 1, 1,
-0.01442164, -0.5874527, -2.897918, 1, 1, 1, 1, 1,
-0.01036862, 0.5121494, 2.402285, 1, 1, 1, 1, 1,
-0.009876299, -0.4359462, -3.823924, 1, 1, 1, 1, 1,
-0.009713043, -1.433679, -2.706735, 1, 1, 1, 1, 1,
-0.008513993, 0.3274115, -0.2610375, 1, 1, 1, 1, 1,
-0.006455332, 0.2891951, 0.3331756, 1, 1, 1, 1, 1,
0.0003536888, -0.378976, 4.34699, 1, 1, 1, 1, 1,
0.005302704, 0.08676352, -0.9236065, 1, 1, 1, 1, 1,
0.007531331, 0.7800976, 1.578226, 1, 1, 1, 1, 1,
0.01024472, 0.1990905, 0.08198977, 1, 1, 1, 1, 1,
0.01059614, 0.8255557, 0.7924279, 1, 1, 1, 1, 1,
0.01511297, -0.9595966, 4.015304, 1, 1, 1, 1, 1,
0.01549949, -1.040564, 3.879525, 1, 1, 1, 1, 1,
0.01585908, 0.2898347, -0.2193941, 1, 1, 1, 1, 1,
0.02031699, -0.4223056, 2.468281, 0, 0, 1, 1, 1,
0.02340852, 0.8994375, 0.236939, 1, 0, 0, 1, 1,
0.02464463, -1.485597, 3.71016, 1, 0, 0, 1, 1,
0.02590731, 0.9587158, -1.035532, 1, 0, 0, 1, 1,
0.02984195, -0.7424804, 2.005821, 1, 0, 0, 1, 1,
0.03301436, 0.1818392, 0.407721, 1, 0, 0, 1, 1,
0.03346653, -1.766643, 2.469393, 0, 0, 0, 1, 1,
0.03525441, -0.9841577, 1.39642, 0, 0, 0, 1, 1,
0.0364202, 0.08998844, 0.1898104, 0, 0, 0, 1, 1,
0.03842446, -0.5302986, 2.483338, 0, 0, 0, 1, 1,
0.04193862, 0.4708525, 0.6160959, 0, 0, 0, 1, 1,
0.04223704, -0.0002903372, 2.113091, 0, 0, 0, 1, 1,
0.04418414, -0.3222573, 2.475397, 0, 0, 0, 1, 1,
0.04748326, -1.189564, 3.029816, 1, 1, 1, 1, 1,
0.04969995, 1.272291, 1.666817, 1, 1, 1, 1, 1,
0.05032168, -0.5729241, 2.107685, 1, 1, 1, 1, 1,
0.05320191, 1.80635, 0.6726803, 1, 1, 1, 1, 1,
0.05924681, 0.8777508, -0.7289622, 1, 1, 1, 1, 1,
0.06110986, 0.992557, 0.1415161, 1, 1, 1, 1, 1,
0.06239315, -0.4517326, 1.473888, 1, 1, 1, 1, 1,
0.06441533, 1.463419, -1.822122, 1, 1, 1, 1, 1,
0.0663721, -0.248663, 2.70041, 1, 1, 1, 1, 1,
0.06853054, -0.1817876, 3.829004, 1, 1, 1, 1, 1,
0.06967846, -0.1189178, 2.337168, 1, 1, 1, 1, 1,
0.06972312, 0.6985576, 0.4558164, 1, 1, 1, 1, 1,
0.07088032, 0.3191901, -0.1432309, 1, 1, 1, 1, 1,
0.07943249, -0.7030302, 2.451119, 1, 1, 1, 1, 1,
0.08063676, -0.8204214, 2.61841, 1, 1, 1, 1, 1,
0.08386356, -1.660085, 3.441203, 0, 0, 1, 1, 1,
0.08616593, -1.168594, 3.682301, 1, 0, 0, 1, 1,
0.08813839, 1.596034, -0.0274565, 1, 0, 0, 1, 1,
0.09394553, -0.9737628, 3.47935, 1, 0, 0, 1, 1,
0.09801769, -0.4687504, 4.506069, 1, 0, 0, 1, 1,
0.1001885, -0.9932681, 4.907823, 1, 0, 0, 1, 1,
0.1067818, -0.7119949, 2.163395, 0, 0, 0, 1, 1,
0.1091881, -0.1271773, 0.2398409, 0, 0, 0, 1, 1,
0.1093916, -0.09290054, 2.494372, 0, 0, 0, 1, 1,
0.1099765, -0.01301226, 1.756113, 0, 0, 0, 1, 1,
0.1127126, 1.542713, 1.20112, 0, 0, 0, 1, 1,
0.1131374, -0.0283497, 1.626074, 0, 0, 0, 1, 1,
0.1160366, 0.6183628, 1.433728, 0, 0, 0, 1, 1,
0.1177015, -0.8734777, 4.073712, 1, 1, 1, 1, 1,
0.1189291, 0.4928769, 0.4313227, 1, 1, 1, 1, 1,
0.1202315, 0.6172861, 1.689081, 1, 1, 1, 1, 1,
0.1244094, 0.2707691, 0.9348817, 1, 1, 1, 1, 1,
0.1249913, -0.4502262, 2.960525, 1, 1, 1, 1, 1,
0.1279511, -0.1633864, 2.40585, 1, 1, 1, 1, 1,
0.1284526, -0.3187987, 2.395423, 1, 1, 1, 1, 1,
0.1306936, 0.8998895, 0.6511949, 1, 1, 1, 1, 1,
0.1387238, 0.3533318, 0.3783335, 1, 1, 1, 1, 1,
0.1391926, 0.7564898, 1.151544, 1, 1, 1, 1, 1,
0.1403372, 0.6341162, -2.048533, 1, 1, 1, 1, 1,
0.1409878, 1.78037, -0.1820457, 1, 1, 1, 1, 1,
0.1424001, -1.325842, 1.736334, 1, 1, 1, 1, 1,
0.1463796, 0.4965832, 0.08972801, 1, 1, 1, 1, 1,
0.149028, -1.022597, 2.771622, 1, 1, 1, 1, 1,
0.1532391, 0.1609242, -1.310076, 0, 0, 1, 1, 1,
0.1540102, 0.774062, 0.1937645, 1, 0, 0, 1, 1,
0.1545863, 0.7007844, 0.6440212, 1, 0, 0, 1, 1,
0.1566541, -0.2718333, 3.14259, 1, 0, 0, 1, 1,
0.1585289, 0.4249914, 0.4386657, 1, 0, 0, 1, 1,
0.1596507, -0.6019916, 1.771051, 1, 0, 0, 1, 1,
0.1710531, -0.2186971, 3.337671, 0, 0, 0, 1, 1,
0.1734916, -0.3945146, 1.392976, 0, 0, 0, 1, 1,
0.1740405, -0.5420552, 3.275322, 0, 0, 0, 1, 1,
0.1758085, -1.419964, 2.655095, 0, 0, 0, 1, 1,
0.1796339, 1.352324, -0.3416803, 0, 0, 0, 1, 1,
0.1806862, -0.3195102, 1.156727, 0, 0, 0, 1, 1,
0.1900643, 1.434513, 0.9964693, 0, 0, 0, 1, 1,
0.1922581, 1.117563, 0.4377212, 1, 1, 1, 1, 1,
0.1943751, -0.593474, 2.496555, 1, 1, 1, 1, 1,
0.2008845, -2.659464, 2.906471, 1, 1, 1, 1, 1,
0.2045373, 0.9345609, 1.042341, 1, 1, 1, 1, 1,
0.2084173, -0.1357345, 2.191074, 1, 1, 1, 1, 1,
0.2098679, -0.6211008, 2.710365, 1, 1, 1, 1, 1,
0.2113719, -0.2840555, 2.358136, 1, 1, 1, 1, 1,
0.2115244, -0.8103216, 2.036483, 1, 1, 1, 1, 1,
0.2167609, -0.8373049, 1.930784, 1, 1, 1, 1, 1,
0.2233677, 0.7136782, 0.2686476, 1, 1, 1, 1, 1,
0.2234131, 0.6389108, -0.142441, 1, 1, 1, 1, 1,
0.2239268, 0.7655324, -1.978765, 1, 1, 1, 1, 1,
0.2239541, 0.08381815, 0.2680097, 1, 1, 1, 1, 1,
0.2247671, 0.4405049, -0.3804178, 1, 1, 1, 1, 1,
0.2264755, -1.144082, 3.509598, 1, 1, 1, 1, 1,
0.2316844, -1.368981, 3.727775, 0, 0, 1, 1, 1,
0.2324836, -0.6137347, 1.718396, 1, 0, 0, 1, 1,
0.233893, -0.5813834, 2.042228, 1, 0, 0, 1, 1,
0.2351285, -0.2850365, 1.131567, 1, 0, 0, 1, 1,
0.2354796, -0.8278043, 3.291994, 1, 0, 0, 1, 1,
0.235879, -0.3862681, 1.771821, 1, 0, 0, 1, 1,
0.2430603, 0.3101684, 1.314165, 0, 0, 0, 1, 1,
0.2432171, 1.49961, 0.2850195, 0, 0, 0, 1, 1,
0.2432329, 0.5827221, 0.3198647, 0, 0, 0, 1, 1,
0.2463276, -0.5139259, 2.321709, 0, 0, 0, 1, 1,
0.2468602, -0.7360154, 1.680962, 0, 0, 0, 1, 1,
0.2470843, -1.88469, 4.617147, 0, 0, 0, 1, 1,
0.250422, 2.064145, -1.449744, 0, 0, 0, 1, 1,
0.2518887, -0.1565747, 2.870107, 1, 1, 1, 1, 1,
0.2526408, 1.145835, -0.856611, 1, 1, 1, 1, 1,
0.2652953, -0.2841085, 3.855975, 1, 1, 1, 1, 1,
0.2686632, -1.224952, 2.915452, 1, 1, 1, 1, 1,
0.2702025, 0.3020965, -0.0506739, 1, 1, 1, 1, 1,
0.2729536, -0.9846104, 3.203394, 1, 1, 1, 1, 1,
0.2779302, -2.824524, 3.733992, 1, 1, 1, 1, 1,
0.2792622, -1.099806, 2.586711, 1, 1, 1, 1, 1,
0.2808442, -0.0003295468, 3.900442, 1, 1, 1, 1, 1,
0.2820361, 1.012758, 1.022935, 1, 1, 1, 1, 1,
0.283237, -1.018892, 3.758977, 1, 1, 1, 1, 1,
0.2842416, 2.396893, 1.936226, 1, 1, 1, 1, 1,
0.2849984, 0.7534762, 0.6008287, 1, 1, 1, 1, 1,
0.2859333, -1.28232, 2.570485, 1, 1, 1, 1, 1,
0.2869363, -1.623524, 4.007668, 1, 1, 1, 1, 1,
0.2871574, 0.04123556, 0.09520973, 0, 0, 1, 1, 1,
0.2896009, -0.006646421, 1.27705, 1, 0, 0, 1, 1,
0.2916104, 0.1558661, 0.255988, 1, 0, 0, 1, 1,
0.2973765, 0.8837576, -1.203919, 1, 0, 0, 1, 1,
0.2975879, -0.5696107, 1.173272, 1, 0, 0, 1, 1,
0.3005638, -0.30608, 4.140823, 1, 0, 0, 1, 1,
0.3061676, 1.158266, -0.4138527, 0, 0, 0, 1, 1,
0.3081507, 0.2688375, 1.64395, 0, 0, 0, 1, 1,
0.3087689, -0.3640594, 4.166031, 0, 0, 0, 1, 1,
0.3111412, -0.2675643, 2.341627, 0, 0, 0, 1, 1,
0.3125916, 1.735941, 1.768311, 0, 0, 0, 1, 1,
0.313979, -0.6480519, 1.899364, 0, 0, 0, 1, 1,
0.3235892, 0.1017994, 1.095459, 0, 0, 0, 1, 1,
0.3265668, -0.3922347, 2.059347, 1, 1, 1, 1, 1,
0.3291933, -2.081758, 2.920201, 1, 1, 1, 1, 1,
0.3318389, 0.5147471, 2.543153, 1, 1, 1, 1, 1,
0.3342195, 1.567526, -0.970678, 1, 1, 1, 1, 1,
0.3380157, -1.720336, 4.263243, 1, 1, 1, 1, 1,
0.3381748, -0.8556044, 3.080833, 1, 1, 1, 1, 1,
0.3493043, -1.009133, 1.736137, 1, 1, 1, 1, 1,
0.3506226, 0.8283576, -0.07920785, 1, 1, 1, 1, 1,
0.3506463, -0.2579504, 4.127252, 1, 1, 1, 1, 1,
0.3539614, 0.1690933, 3.046544, 1, 1, 1, 1, 1,
0.3564845, -0.8611192, 3.444536, 1, 1, 1, 1, 1,
0.3570465, -1.037857, 2.450894, 1, 1, 1, 1, 1,
0.362147, -0.609744, 2.016078, 1, 1, 1, 1, 1,
0.3635023, 0.3597936, 1.197322, 1, 1, 1, 1, 1,
0.3671651, -1.239608, 1.913701, 1, 1, 1, 1, 1,
0.3724263, 0.07219482, 2.402753, 0, 0, 1, 1, 1,
0.3771972, 0.198513, 1.226384, 1, 0, 0, 1, 1,
0.3877199, 2.485759, 0.5747834, 1, 0, 0, 1, 1,
0.390345, 1.006701, -0.32359, 1, 0, 0, 1, 1,
0.396054, 0.7203203, -0.9235091, 1, 0, 0, 1, 1,
0.3987664, 0.451119, -0.039285, 1, 0, 0, 1, 1,
0.4040084, 1.279925, 0.2963061, 0, 0, 0, 1, 1,
0.4049767, 0.6641259, -1.310442, 0, 0, 0, 1, 1,
0.405771, -1.552304, 3.439862, 0, 0, 0, 1, 1,
0.4127735, -0.02602152, 0.9426275, 0, 0, 0, 1, 1,
0.4169264, -0.5693778, 3.858709, 0, 0, 0, 1, 1,
0.4203162, -0.04683987, 1.675849, 0, 0, 0, 1, 1,
0.4224312, 1.641683, 0.6282163, 0, 0, 0, 1, 1,
0.436578, 0.6097283, 1.519654, 1, 1, 1, 1, 1,
0.4394177, -0.04028827, 2.982114, 1, 1, 1, 1, 1,
0.4434755, 0.4504598, 1.754457, 1, 1, 1, 1, 1,
0.4442198, -2.464328, 3.374395, 1, 1, 1, 1, 1,
0.4447592, 0.6261672, 0.06649976, 1, 1, 1, 1, 1,
0.4460775, -1.810107, 2.197953, 1, 1, 1, 1, 1,
0.4468759, -1.660143, 4.184307, 1, 1, 1, 1, 1,
0.448119, 1.229712, 0.5883724, 1, 1, 1, 1, 1,
0.4539031, 1.482958, 0.7578602, 1, 1, 1, 1, 1,
0.4539698, 0.4764571, -1.83101, 1, 1, 1, 1, 1,
0.4565464, 1.097782, 0.8956893, 1, 1, 1, 1, 1,
0.4643644, -0.1973263, 0.9560256, 1, 1, 1, 1, 1,
0.4652671, -0.3188848, 1.424299, 1, 1, 1, 1, 1,
0.4655822, 0.6847643, 0.4186915, 1, 1, 1, 1, 1,
0.4711016, -1.46844, 2.746234, 1, 1, 1, 1, 1,
0.4735855, 0.8800748, -0.4153951, 0, 0, 1, 1, 1,
0.4799662, 0.7411446, 0.3687246, 1, 0, 0, 1, 1,
0.4803665, 1.790446, -0.03829748, 1, 0, 0, 1, 1,
0.4811331, -1.212755, 1.548863, 1, 0, 0, 1, 1,
0.4897196, 1.604469, -0.9759237, 1, 0, 0, 1, 1,
0.4913244, -0.987983, 2.5206, 1, 0, 0, 1, 1,
0.4917761, 0.1790975, 2.71751, 0, 0, 0, 1, 1,
0.4940018, 0.824784, -1.802143, 0, 0, 0, 1, 1,
0.4979191, 0.9358338, -0.2433101, 0, 0, 0, 1, 1,
0.4979203, -2.199351, 2.053138, 0, 0, 0, 1, 1,
0.500122, 2.035733, -1.388417, 0, 0, 0, 1, 1,
0.5041602, -0.2444971, 2.592054, 0, 0, 0, 1, 1,
0.5106357, 1.676208, 0.3999366, 0, 0, 0, 1, 1,
0.5146452, 0.4065712, 1.428245, 1, 1, 1, 1, 1,
0.5162612, -1.693485, 2.196609, 1, 1, 1, 1, 1,
0.5181051, -0.6356961, 1.879413, 1, 1, 1, 1, 1,
0.5191132, 2.42945, -0.1574162, 1, 1, 1, 1, 1,
0.529465, 0.8355542, 0.1265132, 1, 1, 1, 1, 1,
0.5308901, 2.754264, -0.6191424, 1, 1, 1, 1, 1,
0.5379143, -0.4551306, 1.737206, 1, 1, 1, 1, 1,
0.5408738, 0.9591969, 0.1318534, 1, 1, 1, 1, 1,
0.5409061, 0.3791672, 2.308146, 1, 1, 1, 1, 1,
0.542056, 0.5954137, 1.576913, 1, 1, 1, 1, 1,
0.54652, -0.75484, 3.380135, 1, 1, 1, 1, 1,
0.5486457, 0.01589778, 0.9523289, 1, 1, 1, 1, 1,
0.5491755, 0.9176171, -0.1223518, 1, 1, 1, 1, 1,
0.5529343, 0.8244988, -0.967146, 1, 1, 1, 1, 1,
0.5548452, 0.7629701, 1.836608, 1, 1, 1, 1, 1,
0.5578892, 1.453449, 2.390545, 0, 0, 1, 1, 1,
0.5587406, 0.9554121, -0.785967, 1, 0, 0, 1, 1,
0.5598931, 0.7459612, 0.6166887, 1, 0, 0, 1, 1,
0.5608335, -0.009973603, 0.937488, 1, 0, 0, 1, 1,
0.5633373, 0.9258878, 0.4427268, 1, 0, 0, 1, 1,
0.5666562, 2.00428, -1.409637, 1, 0, 0, 1, 1,
0.5694569, -1.324966, 2.320028, 0, 0, 0, 1, 1,
0.5709453, -0.8049756, 5.077975, 0, 0, 0, 1, 1,
0.5757223, 0.4880523, 0.2969537, 0, 0, 0, 1, 1,
0.57651, 0.640914, 0.6115519, 0, 0, 0, 1, 1,
0.5786767, 1.563773, -0.05054358, 0, 0, 0, 1, 1,
0.5797918, -0.5813388, 4.098155, 0, 0, 0, 1, 1,
0.5811792, 1.054391, 1.015831, 0, 0, 0, 1, 1,
0.5812658, 0.6828802, -0.9887514, 1, 1, 1, 1, 1,
0.5826962, -1.787767, 4.612049, 1, 1, 1, 1, 1,
0.5886907, 0.05558138, 0.9757875, 1, 1, 1, 1, 1,
0.5888517, 0.1770726, 1.518956, 1, 1, 1, 1, 1,
0.5890625, -1.790964, 1.96553, 1, 1, 1, 1, 1,
0.5948912, -0.1253292, -0.2453331, 1, 1, 1, 1, 1,
0.5975103, -1.152618, 2.2236, 1, 1, 1, 1, 1,
0.6003236, 0.9046438, 0.3820043, 1, 1, 1, 1, 1,
0.6021477, 1.160755, -0.4571061, 1, 1, 1, 1, 1,
0.6035525, -2.093504, 3.070616, 1, 1, 1, 1, 1,
0.6090245, -2.34099, 2.62707, 1, 1, 1, 1, 1,
0.6110638, -1.022784, 3.761215, 1, 1, 1, 1, 1,
0.6114076, -1.605971, 3.166174, 1, 1, 1, 1, 1,
0.6140155, -0.8568704, 1.360563, 1, 1, 1, 1, 1,
0.6150149, -0.6655025, 2.608534, 1, 1, 1, 1, 1,
0.6178802, 0.2192115, 1.313526, 0, 0, 1, 1, 1,
0.6181457, 1.190964, 1.208897, 1, 0, 0, 1, 1,
0.6206316, -1.379414, 2.220571, 1, 0, 0, 1, 1,
0.6216593, -0.214269, 3.823854, 1, 0, 0, 1, 1,
0.6232213, 0.5491633, 0.04530685, 1, 0, 0, 1, 1,
0.6246171, -0.3134425, 2.132019, 1, 0, 0, 1, 1,
0.6253592, -1.787057, 2.13711, 0, 0, 0, 1, 1,
0.627073, 0.8663812, 1.169582, 0, 0, 0, 1, 1,
0.62821, -0.2384552, 1.086252, 0, 0, 0, 1, 1,
0.6297493, 0.03451947, 1.056207, 0, 0, 0, 1, 1,
0.6385705, 0.8187811, -0.002871828, 0, 0, 0, 1, 1,
0.6400877, 0.04720949, 1.355986, 0, 0, 0, 1, 1,
0.6488587, -0.3578498, 1.399071, 0, 0, 0, 1, 1,
0.6500584, -0.959445, 2.982125, 1, 1, 1, 1, 1,
0.6549045, -0.2244419, 2.371132, 1, 1, 1, 1, 1,
0.6587349, -1.008949, 0.6446337, 1, 1, 1, 1, 1,
0.6592139, -1.706958, 3.372488, 1, 1, 1, 1, 1,
0.6600312, 0.9298849, 2.147888, 1, 1, 1, 1, 1,
0.6631636, 0.6013762, -0.7371721, 1, 1, 1, 1, 1,
0.6720006, -0.007633488, 1.32088, 1, 1, 1, 1, 1,
0.6740305, -0.8189968, 2.239553, 1, 1, 1, 1, 1,
0.6797528, -0.3303601, 2.081673, 1, 1, 1, 1, 1,
0.680912, -0.09857138, 0.2335708, 1, 1, 1, 1, 1,
0.6812223, 0.7877063, 2.049634, 1, 1, 1, 1, 1,
0.6857635, 0.0733643, 2.047539, 1, 1, 1, 1, 1,
0.6881852, 2.232868, 1.235639, 1, 1, 1, 1, 1,
0.6944316, 0.410093, 0.7489811, 1, 1, 1, 1, 1,
0.7053667, -1.645721, 3.010505, 1, 1, 1, 1, 1,
0.7067561, 1.072498, 0.3175354, 0, 0, 1, 1, 1,
0.7072066, -1.323742, 1.176994, 1, 0, 0, 1, 1,
0.7091916, -0.6064067, 1.805728, 1, 0, 0, 1, 1,
0.7092594, -0.08901618, 1.946301, 1, 0, 0, 1, 1,
0.7093583, -0.0828594, 2.688353, 1, 0, 0, 1, 1,
0.7099395, -0.5096576, 1.768041, 1, 0, 0, 1, 1,
0.714322, 0.4195806, 2.30887, 0, 0, 0, 1, 1,
0.7157474, -0.5089077, 3.840401, 0, 0, 0, 1, 1,
0.715993, -0.2337895, 2.148633, 0, 0, 0, 1, 1,
0.7220861, 0.04004655, 2.635192, 0, 0, 0, 1, 1,
0.7233812, 0.2763863, 0.1361364, 0, 0, 0, 1, 1,
0.7262071, 1.158564, 1.24247, 0, 0, 0, 1, 1,
0.7324979, 0.2720582, 0.01952972, 0, 0, 0, 1, 1,
0.735639, 1.743429, 1.458444, 1, 1, 1, 1, 1,
0.7479943, -0.1587102, 3.082875, 1, 1, 1, 1, 1,
0.7505475, 1.857607, 0.6096966, 1, 1, 1, 1, 1,
0.7510571, -1.358035, 2.47041, 1, 1, 1, 1, 1,
0.7517252, -1.53975, 1.297246, 1, 1, 1, 1, 1,
0.7546446, -0.4397429, 2.048077, 1, 1, 1, 1, 1,
0.7548038, 0.01964165, 1.07188, 1, 1, 1, 1, 1,
0.7603351, 0.007808399, 1.522067, 1, 1, 1, 1, 1,
0.7609731, 0.302138, 0.6766341, 1, 1, 1, 1, 1,
0.7720083, 1.418242, 1.64611, 1, 1, 1, 1, 1,
0.7771251, 1.425057, 1.25291, 1, 1, 1, 1, 1,
0.7858896, 1.460483, -0.8316107, 1, 1, 1, 1, 1,
0.7870742, -0.4191135, 1.956591, 1, 1, 1, 1, 1,
0.7943928, -0.3159495, 1.648027, 1, 1, 1, 1, 1,
0.7996899, -0.5018288, 2.410821, 1, 1, 1, 1, 1,
0.8014231, 0.5807604, 0.7597567, 0, 0, 1, 1, 1,
0.8054636, 0.2141486, 0.3146302, 1, 0, 0, 1, 1,
0.8073722, 0.3990003, 1.811347, 1, 0, 0, 1, 1,
0.8117048, -0.2027316, 2.31494, 1, 0, 0, 1, 1,
0.8118079, -1.610237, 1.201708, 1, 0, 0, 1, 1,
0.8129881, 0.2255774, 1.34931, 1, 0, 0, 1, 1,
0.817317, -0.04725078, 1.857529, 0, 0, 0, 1, 1,
0.8263288, 0.2401685, 0.9081135, 0, 0, 0, 1, 1,
0.82969, -0.9071468, 0.8453832, 0, 0, 0, 1, 1,
0.8314818, 1.081421, -1.079045, 0, 0, 0, 1, 1,
0.832791, -0.7820126, 1.541287, 0, 0, 0, 1, 1,
0.8371323, 1.764639, 2.25449, 0, 0, 0, 1, 1,
0.8405045, 0.06213195, 0.807323, 0, 0, 0, 1, 1,
0.8436482, 1.396268, -0.0869541, 1, 1, 1, 1, 1,
0.8551675, 0.02907248, 1.135337, 1, 1, 1, 1, 1,
0.8582925, -0.2997961, 0.2766705, 1, 1, 1, 1, 1,
0.8607139, 0.7229879, 3.514718, 1, 1, 1, 1, 1,
0.8644065, 0.5149256, -0.1675795, 1, 1, 1, 1, 1,
0.8668597, -0.8898086, 1.381803, 1, 1, 1, 1, 1,
0.8690345, 1.563595, -0.3807783, 1, 1, 1, 1, 1,
0.8715988, 0.1013063, 0.8548945, 1, 1, 1, 1, 1,
0.8725971, 1.419836, -0.6962976, 1, 1, 1, 1, 1,
0.8777441, 0.01674595, 1.014768, 1, 1, 1, 1, 1,
0.8815529, -1.180207, 1.828668, 1, 1, 1, 1, 1,
0.8836889, 0.502593, 1.524817, 1, 1, 1, 1, 1,
0.8869672, 0.2292513, 1.88544, 1, 1, 1, 1, 1,
0.8930353, -0.5969834, 2.68142, 1, 1, 1, 1, 1,
0.8971881, -1.458585, 1.447087, 1, 1, 1, 1, 1,
0.8974134, 1.670187, 0.7398304, 0, 0, 1, 1, 1,
0.8982804, -0.4542749, 2.327708, 1, 0, 0, 1, 1,
0.9026694, -1.986524, 2.335731, 1, 0, 0, 1, 1,
0.9036067, 0.9344627, -0.7966442, 1, 0, 0, 1, 1,
0.909462, 0.979533, 1.938167, 1, 0, 0, 1, 1,
0.921948, -0.2045407, 0.8149015, 1, 0, 0, 1, 1,
0.925775, 0.5517926, 2.95293, 0, 0, 0, 1, 1,
0.9349411, 0.6074558, 1.257017, 0, 0, 0, 1, 1,
0.9357669, 1.197115, 1.166278, 0, 0, 0, 1, 1,
0.9405643, 0.6172004, -0.3785153, 0, 0, 0, 1, 1,
0.941075, -2.359881, 1.973895, 0, 0, 0, 1, 1,
0.9437987, 0.8937232, 1.150458, 0, 0, 0, 1, 1,
0.9550061, 1.591293, -1.123559, 0, 0, 0, 1, 1,
0.9603201, -1.059057, 1.814809, 1, 1, 1, 1, 1,
0.9706919, 1.010783, 0.2489765, 1, 1, 1, 1, 1,
0.9763448, -0.5472136, 2.204935, 1, 1, 1, 1, 1,
0.9847881, 0.2367036, 0.9255593, 1, 1, 1, 1, 1,
0.9851872, 1.096528, 1.79635, 1, 1, 1, 1, 1,
0.9879401, -0.09150784, 1.597552, 1, 1, 1, 1, 1,
0.9907514, -0.2858815, 1.956909, 1, 1, 1, 1, 1,
0.992151, -1.183006, 2.913656, 1, 1, 1, 1, 1,
0.9936804, 0.6896836, 0.4949496, 1, 1, 1, 1, 1,
0.9976512, -0.9796344, 1.276771, 1, 1, 1, 1, 1,
0.9997116, 0.2926939, 0.4900306, 1, 1, 1, 1, 1,
1.003374, 1.178466, 1.036492, 1, 1, 1, 1, 1,
1.006872, -0.4106655, 1.510153, 1, 1, 1, 1, 1,
1.012879, 0.2988812, 0.1469951, 1, 1, 1, 1, 1,
1.013505, 1.646958, -0.07459459, 1, 1, 1, 1, 1,
1.014699, 1.581616, -0.0433495, 0, 0, 1, 1, 1,
1.019928, -0.8602055, 2.252487, 1, 0, 0, 1, 1,
1.035318, 0.2552022, 1.125426, 1, 0, 0, 1, 1,
1.047035, -0.09034595, 1.785564, 1, 0, 0, 1, 1,
1.051306, -0.2861663, 0.7796413, 1, 0, 0, 1, 1,
1.056036, 0.5689031, 1.122722, 1, 0, 0, 1, 1,
1.057858, -0.8507267, 2.612855, 0, 0, 0, 1, 1,
1.06103, 0.04586244, 1.802228, 0, 0, 0, 1, 1,
1.061628, 0.6517888, 1.798078, 0, 0, 0, 1, 1,
1.07075, 1.075542, 0.9359996, 0, 0, 0, 1, 1,
1.072067, 0.8927135, 1.012293, 0, 0, 0, 1, 1,
1.072116, 0.3081249, 1.447953, 0, 0, 0, 1, 1,
1.072135, -0.1864509, 0.7986282, 0, 0, 0, 1, 1,
1.073118, 0.6876881, 1.79656, 1, 1, 1, 1, 1,
1.081003, -1.360468, 1.300198, 1, 1, 1, 1, 1,
1.089477, -0.8616838, 2.438398, 1, 1, 1, 1, 1,
1.095223, 2.055558, 1.731455, 1, 1, 1, 1, 1,
1.098384, 0.0383472, 0.5300551, 1, 1, 1, 1, 1,
1.10334, -0.5618442, 3.234389, 1, 1, 1, 1, 1,
1.103794, 2.224634, 0.1460127, 1, 1, 1, 1, 1,
1.106183, 2.838935, 1.06652, 1, 1, 1, 1, 1,
1.106477, -1.340197, 3.509411, 1, 1, 1, 1, 1,
1.113552, -0.8370453, -0.4394018, 1, 1, 1, 1, 1,
1.119128, -0.6882655, 1.267318, 1, 1, 1, 1, 1,
1.121203, 1.095644, 1.938674, 1, 1, 1, 1, 1,
1.122113, -1.282267, 3.363632, 1, 1, 1, 1, 1,
1.122561, -0.1853363, 1.167074, 1, 1, 1, 1, 1,
1.122837, -0.7262731, 4.003907, 1, 1, 1, 1, 1,
1.126295, -0.0005328836, 2.305029, 0, 0, 1, 1, 1,
1.130981, 0.2255207, 1.386058, 1, 0, 0, 1, 1,
1.142499, 1.9779, 2.150676, 1, 0, 0, 1, 1,
1.144326, 1.585689, -0.5545444, 1, 0, 0, 1, 1,
1.144847, -0.5775554, 3.493286, 1, 0, 0, 1, 1,
1.145594, 0.4212559, 0.5533142, 1, 0, 0, 1, 1,
1.146294, -0.5150231, 2.729063, 0, 0, 0, 1, 1,
1.159714, 0.6003819, 0.8614756, 0, 0, 0, 1, 1,
1.161927, 0.667108, 3.814921, 0, 0, 0, 1, 1,
1.167351, 0.5186488, 0.7799473, 0, 0, 0, 1, 1,
1.174358, -1.320736, 2.789618, 0, 0, 0, 1, 1,
1.177774, -1.209223, 3.245186, 0, 0, 0, 1, 1,
1.178581, -0.0656716, 3.027046, 0, 0, 0, 1, 1,
1.183363, 0.1728067, 2.098887, 1, 1, 1, 1, 1,
1.185845, 1.709212, 1.259164, 1, 1, 1, 1, 1,
1.187107, 2.774892, -0.1745664, 1, 1, 1, 1, 1,
1.187968, 0.7575889, 1.811051, 1, 1, 1, 1, 1,
1.199495, 0.1299323, 1.747965, 1, 1, 1, 1, 1,
1.200332, -0.6814518, 2.19933, 1, 1, 1, 1, 1,
1.21949, 0.5865905, 2.062703, 1, 1, 1, 1, 1,
1.221933, -0.06701493, 1.295666, 1, 1, 1, 1, 1,
1.226603, -0.9936382, 3.488302, 1, 1, 1, 1, 1,
1.228477, -0.9115425, 3.513239, 1, 1, 1, 1, 1,
1.231841, -1.350361, 2.373547, 1, 1, 1, 1, 1,
1.242605, -2.2362, -0.5951892, 1, 1, 1, 1, 1,
1.247827, -0.1564835, 2.271558, 1, 1, 1, 1, 1,
1.248321, 0.3727475, 1.181121, 1, 1, 1, 1, 1,
1.251089, -0.2375458, 1.818239, 1, 1, 1, 1, 1,
1.265187, -2.019327, 2.182976, 0, 0, 1, 1, 1,
1.270443, -0.474583, 2.002978, 1, 0, 0, 1, 1,
1.279042, 0.1276545, 1.701772, 1, 0, 0, 1, 1,
1.283895, 1.914294, 1.285576, 1, 0, 0, 1, 1,
1.284378, 2.35414, 1.403146, 1, 0, 0, 1, 1,
1.286883, -1.455731, 1.628552, 1, 0, 0, 1, 1,
1.289385, -0.6565853, 1.040076, 0, 0, 0, 1, 1,
1.302603, 0.7946365, 1.915014, 0, 0, 0, 1, 1,
1.311975, 1.320516, 0.9585066, 0, 0, 0, 1, 1,
1.313682, 1.57739, 1.022513, 0, 0, 0, 1, 1,
1.315363, -1.70967, 2.196329, 0, 0, 0, 1, 1,
1.318635, -2.422263, 1.630518, 0, 0, 0, 1, 1,
1.333082, 0.7150164, 2.376082, 0, 0, 0, 1, 1,
1.336847, -1.501943, 1.130415, 1, 1, 1, 1, 1,
1.342409, 0.4305743, 1.178931, 1, 1, 1, 1, 1,
1.344949, 0.6252707, 1.397343, 1, 1, 1, 1, 1,
1.345289, 1.701409, -0.2350279, 1, 1, 1, 1, 1,
1.362977, 0.8045541, -0.0750873, 1, 1, 1, 1, 1,
1.381854, 0.7108142, 1.769776, 1, 1, 1, 1, 1,
1.404209, -1.07874, 3.902357, 1, 1, 1, 1, 1,
1.412863, -0.6082184, 2.671728, 1, 1, 1, 1, 1,
1.413707, 1.759848, 0.248459, 1, 1, 1, 1, 1,
1.416727, -0.7553303, 1.926495, 1, 1, 1, 1, 1,
1.417433, -0.5863436, 2.80881, 1, 1, 1, 1, 1,
1.420781, 0.4532083, 2.200124, 1, 1, 1, 1, 1,
1.425476, -1.724316, 1.141661, 1, 1, 1, 1, 1,
1.43461, -2.418787, 2.39622, 1, 1, 1, 1, 1,
1.441076, 1.129221, 0.9749532, 1, 1, 1, 1, 1,
1.446075, 1.637309, 0.5966808, 0, 0, 1, 1, 1,
1.451325, 0.5416912, 1.013091, 1, 0, 0, 1, 1,
1.455539, 0.1575462, 1.897745, 1, 0, 0, 1, 1,
1.456964, -1.404138, 4.020782, 1, 0, 0, 1, 1,
1.460471, 0.3192905, 2.212162, 1, 0, 0, 1, 1,
1.472739, 1.108526, 2.091345, 1, 0, 0, 1, 1,
1.477744, 0.2757863, 4.071464, 0, 0, 0, 1, 1,
1.483314, 1.312804, 2.604597, 0, 0, 0, 1, 1,
1.483587, 0.3257893, 2.10112, 0, 0, 0, 1, 1,
1.484393, 1.065858, 0.3796294, 0, 0, 0, 1, 1,
1.491783, 1.181409, 2.392998, 0, 0, 0, 1, 1,
1.491829, -1.344058, 3.195682, 0, 0, 0, 1, 1,
1.508426, -0.6419534, 1.996738, 0, 0, 0, 1, 1,
1.514064, -0.3607179, 2.662063, 1, 1, 1, 1, 1,
1.515311, 0.7219636, -0.3888199, 1, 1, 1, 1, 1,
1.515586, -0.3252073, -0.57907, 1, 1, 1, 1, 1,
1.529297, -0.08246339, 0.5046416, 1, 1, 1, 1, 1,
1.536478, -0.7180473, 2.172755, 1, 1, 1, 1, 1,
1.547628, 0.2585248, 0.7511151, 1, 1, 1, 1, 1,
1.553283, 0.4911852, 0.467351, 1, 1, 1, 1, 1,
1.567757, 3.090401, 0.6471943, 1, 1, 1, 1, 1,
1.569152, -0.3827895, 3.026385, 1, 1, 1, 1, 1,
1.57031, -0.7990661, 1.672151, 1, 1, 1, 1, 1,
1.574329, 0.224343, 1.889666, 1, 1, 1, 1, 1,
1.576265, 0.4896812, 0.5943814, 1, 1, 1, 1, 1,
1.585041, 0.7755882, 1.692324, 1, 1, 1, 1, 1,
1.58685, -0.9819458, 3.960408, 1, 1, 1, 1, 1,
1.587863, 0.6346492, 2.093009, 1, 1, 1, 1, 1,
1.600174, 0.6790417, 0.3909725, 0, 0, 1, 1, 1,
1.613024, 0.7329176, 2.038724, 1, 0, 0, 1, 1,
1.616698, 0.2833144, 0.3971955, 1, 0, 0, 1, 1,
1.631391, -0.1081455, 2.32107, 1, 0, 0, 1, 1,
1.632197, 0.01695625, 2.978933, 1, 0, 0, 1, 1,
1.643704, -0.5221786, 1.424047, 1, 0, 0, 1, 1,
1.643951, -0.6703099, 2.918878, 0, 0, 0, 1, 1,
1.644051, 0.218475, 1.314755, 0, 0, 0, 1, 1,
1.654655, 0.135575, 1.655708, 0, 0, 0, 1, 1,
1.678684, -1.586338, 2.183109, 0, 0, 0, 1, 1,
1.690776, -0.4693598, 1.994685, 0, 0, 0, 1, 1,
1.694875, 0.4993225, 1.977187, 0, 0, 0, 1, 1,
1.69638, 0.6668935, 2.036959, 0, 0, 0, 1, 1,
1.753178, -0.376004, 1.477334, 1, 1, 1, 1, 1,
1.757431, -0.009726448, 2.49224, 1, 1, 1, 1, 1,
1.774962, 0.9206491, 0.285054, 1, 1, 1, 1, 1,
1.828254, 2.222025, -0.4696151, 1, 1, 1, 1, 1,
1.838192, 0.4057983, 2.543303, 1, 1, 1, 1, 1,
1.848246, 1.339526, -0.3382253, 1, 1, 1, 1, 1,
1.898375, -0.6573872, 0.7166972, 1, 1, 1, 1, 1,
1.901043, 0.9450927, 0.9883478, 1, 1, 1, 1, 1,
1.938186, -1.758171, 2.030004, 1, 1, 1, 1, 1,
1.960938, 2.115427, 0.5444145, 1, 1, 1, 1, 1,
1.971303, -0.1866933, 3.333195, 1, 1, 1, 1, 1,
2.003457, 1.108412, 1.187399, 1, 1, 1, 1, 1,
2.019065, 0.8839017, 1.570165, 1, 1, 1, 1, 1,
2.024505, -0.3676815, 2.190095, 1, 1, 1, 1, 1,
2.026003, 0.2947594, 3.026999, 1, 1, 1, 1, 1,
2.028425, 1.312195, 0.1650798, 0, 0, 1, 1, 1,
2.030796, 0.1938426, 3.012813, 1, 0, 0, 1, 1,
2.041008, -0.6346806, 0.6959612, 1, 0, 0, 1, 1,
2.043527, -0.9248162, 2.695257, 1, 0, 0, 1, 1,
2.063156, -0.101756, 1.603137, 1, 0, 0, 1, 1,
2.06967, 0.7438815, 0.1980458, 1, 0, 0, 1, 1,
2.103332, -0.5948052, 1.740221, 0, 0, 0, 1, 1,
2.116922, -1.27987, 2.488396, 0, 0, 0, 1, 1,
2.127979, 0.200062, 0.3874843, 0, 0, 0, 1, 1,
2.149917, -1.485017, 3.525366, 0, 0, 0, 1, 1,
2.165836, -0.205033, -0.4057275, 0, 0, 0, 1, 1,
2.200087, 0.4715262, 0.5005189, 0, 0, 0, 1, 1,
2.226455, 0.1089249, 2.132498, 0, 0, 0, 1, 1,
2.241699, -1.192179, 2.747429, 1, 1, 1, 1, 1,
2.319329, -0.747752, 3.660676, 1, 1, 1, 1, 1,
2.394671, 0.9213486, 2.679141, 1, 1, 1, 1, 1,
2.543478, 0.7771133, 1.299871, 1, 1, 1, 1, 1,
2.564167, 0.8162473, -0.3579095, 1, 1, 1, 1, 1,
3.348398, -0.2027719, 1.913955, 1, 1, 1, 1, 1,
3.425304, -0.5001357, 1.481377, 1, 1, 1, 1, 1
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
var radius = 9.72071;
var distance = 34.14358;
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
mvMatrix.translate( 0.1092868, -0.07191813, 0.3549109 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.14358);
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
