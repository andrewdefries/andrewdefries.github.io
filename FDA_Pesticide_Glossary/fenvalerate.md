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
-3.034348, -1.138508, -2.510649, 1, 0, 0, 1,
-2.903171, -0.3712688, -1.037009, 1, 0.007843138, 0, 1,
-2.632832, -0.4809593, -1.630086, 1, 0.01176471, 0, 1,
-2.559063, -0.6561425, -1.798, 1, 0.01960784, 0, 1,
-2.54162, 0.1430948, -2.960264, 1, 0.02352941, 0, 1,
-2.494978, 0.3907934, -0.65517, 1, 0.03137255, 0, 1,
-2.402253, 0.9136872, -1.612418, 1, 0.03529412, 0, 1,
-2.319086, -0.8860808, -2.0966, 1, 0.04313726, 0, 1,
-2.312417, 0.910832, -2.022732, 1, 0.04705882, 0, 1,
-2.282365, 1.011823, -1.055144, 1, 0.05490196, 0, 1,
-2.227764, -0.9163248, -2.650588, 1, 0.05882353, 0, 1,
-2.186404, 0.03758864, -1.595722, 1, 0.06666667, 0, 1,
-2.17747, -0.08788951, -0.7565774, 1, 0.07058824, 0, 1,
-2.142863, -1.215167, -0.9892242, 1, 0.07843138, 0, 1,
-2.142071, 0.156983, -1.540094, 1, 0.08235294, 0, 1,
-2.134071, 0.6250674, -0.8011972, 1, 0.09019608, 0, 1,
-2.112989, -1.538033, -2.123863, 1, 0.09411765, 0, 1,
-2.088701, 0.3892507, 0.03782633, 1, 0.1019608, 0, 1,
-2.061367, 1.229207, 0.6284063, 1, 0.1098039, 0, 1,
-2.061313, 0.1401593, -0.7836522, 1, 0.1137255, 0, 1,
-2.05515, 1.324857, -1.653592, 1, 0.1215686, 0, 1,
-2.03645, 0.7102056, -2.063739, 1, 0.1254902, 0, 1,
-2.024322, 0.1151984, -0.7720326, 1, 0.1333333, 0, 1,
-1.987681, -0.7279469, -2.540585, 1, 0.1372549, 0, 1,
-1.982492, -0.1877585, 0.2924997, 1, 0.145098, 0, 1,
-1.97473, 0.4693664, -0.1508234, 1, 0.1490196, 0, 1,
-1.931877, 2.45294, -0.5182735, 1, 0.1568628, 0, 1,
-1.929118, 1.150134, 0.05631682, 1, 0.1607843, 0, 1,
-1.910806, 1.459588, -0.5925461, 1, 0.1686275, 0, 1,
-1.908766, -0.0864367, -0.6232061, 1, 0.172549, 0, 1,
-1.907134, -1.781896, -1.89972, 1, 0.1803922, 0, 1,
-1.902748, 2.088389, -1.536041, 1, 0.1843137, 0, 1,
-1.887223, -0.3472749, -3.173061, 1, 0.1921569, 0, 1,
-1.887151, 0.6780493, -0.3241625, 1, 0.1960784, 0, 1,
-1.881088, -0.3750283, -1.333187, 1, 0.2039216, 0, 1,
-1.862687, 0.4306931, -1.226947, 1, 0.2117647, 0, 1,
-1.837878, 0.03260828, -2.476731, 1, 0.2156863, 0, 1,
-1.818197, 1.237442, 0.4331327, 1, 0.2235294, 0, 1,
-1.805474, -0.5023766, 0.5179695, 1, 0.227451, 0, 1,
-1.789916, -0.5513392, -3.032119, 1, 0.2352941, 0, 1,
-1.762888, 0.06696217, -1.246722, 1, 0.2392157, 0, 1,
-1.728105, -0.259968, -0.7505094, 1, 0.2470588, 0, 1,
-1.725178, -0.07264673, -0.7415111, 1, 0.2509804, 0, 1,
-1.721497, 0.492143, -1.190051, 1, 0.2588235, 0, 1,
-1.719598, 0.9778604, -2.997534, 1, 0.2627451, 0, 1,
-1.715324, 1.784185, 0.6353402, 1, 0.2705882, 0, 1,
-1.713691, 0.6442844, -2.20186, 1, 0.2745098, 0, 1,
-1.707708, 1.479428, -2.999676, 1, 0.282353, 0, 1,
-1.707509, 0.3965247, -2.086148, 1, 0.2862745, 0, 1,
-1.699083, -0.3576467, 0.01604392, 1, 0.2941177, 0, 1,
-1.688771, 0.2158843, -0.6213233, 1, 0.3019608, 0, 1,
-1.672478, 0.8996506, -0.8863167, 1, 0.3058824, 0, 1,
-1.656451, 1.534498, 1.852647, 1, 0.3137255, 0, 1,
-1.650199, -1.68322, -1.784311, 1, 0.3176471, 0, 1,
-1.644041, -0.4471166, -1.8483, 1, 0.3254902, 0, 1,
-1.639941, -0.3583667, -3.424526, 1, 0.3294118, 0, 1,
-1.637183, -0.6529532, -1.107614, 1, 0.3372549, 0, 1,
-1.633852, -0.3302827, 1.229037, 1, 0.3411765, 0, 1,
-1.627228, -0.7333646, -0.9850416, 1, 0.3490196, 0, 1,
-1.613028, -0.627755, -4.342941, 1, 0.3529412, 0, 1,
-1.598907, 0.004475744, -1.342964, 1, 0.3607843, 0, 1,
-1.583093, 1.510597, -0.9574171, 1, 0.3647059, 0, 1,
-1.579487, -0.2836887, -3.479344, 1, 0.372549, 0, 1,
-1.574865, 1.112149, -1.117442, 1, 0.3764706, 0, 1,
-1.566686, -2.218621, -3.442849, 1, 0.3843137, 0, 1,
-1.557982, -0.3075668, -0.5583338, 1, 0.3882353, 0, 1,
-1.523347, 0.86436, -0.335937, 1, 0.3960784, 0, 1,
-1.522408, -1.274732, -0.9191395, 1, 0.4039216, 0, 1,
-1.505033, -0.380343, -2.440187, 1, 0.4078431, 0, 1,
-1.50174, 0.4638251, -2.730758, 1, 0.4156863, 0, 1,
-1.476505, -0.02030513, -3.449969, 1, 0.4196078, 0, 1,
-1.475654, -1.583158, -2.998356, 1, 0.427451, 0, 1,
-1.473336, -0.1878483, -0.5346505, 1, 0.4313726, 0, 1,
-1.46446, -1.625986, -2.89126, 1, 0.4392157, 0, 1,
-1.456116, -1.239278, -0.03823972, 1, 0.4431373, 0, 1,
-1.446492, -0.2052787, -1.296813, 1, 0.4509804, 0, 1,
-1.445044, -0.4534038, -1.649166, 1, 0.454902, 0, 1,
-1.444856, 0.3086811, -1.248763, 1, 0.4627451, 0, 1,
-1.439318, 0.9078979, 0.2511247, 1, 0.4666667, 0, 1,
-1.432768, -0.9650476, -1.020634, 1, 0.4745098, 0, 1,
-1.432483, 1.660946, -0.5747108, 1, 0.4784314, 0, 1,
-1.431536, 0.7495894, -0.04293209, 1, 0.4862745, 0, 1,
-1.431367, -0.558769, -2.796386, 1, 0.4901961, 0, 1,
-1.42874, -0.211253, -1.358385, 1, 0.4980392, 0, 1,
-1.420365, -0.06852999, -1.433803, 1, 0.5058824, 0, 1,
-1.414505, 0.3799678, -1.323135, 1, 0.509804, 0, 1,
-1.41255, 1.338823, 0.3890702, 1, 0.5176471, 0, 1,
-1.400561, 0.5605329, 0.1320751, 1, 0.5215687, 0, 1,
-1.390434, 0.3667869, -0.3613349, 1, 0.5294118, 0, 1,
-1.381376, 0.6995096, 0.3441644, 1, 0.5333334, 0, 1,
-1.380112, 1.27874, -0.7665276, 1, 0.5411765, 0, 1,
-1.380081, -0.3921776, -1.181238, 1, 0.5450981, 0, 1,
-1.379145, -0.3874643, -3.193991, 1, 0.5529412, 0, 1,
-1.377041, 1.054436, -1.645119, 1, 0.5568628, 0, 1,
-1.376473, 0.7046378, 0.3211551, 1, 0.5647059, 0, 1,
-1.374406, -0.5589927, -2.604998, 1, 0.5686275, 0, 1,
-1.368356, -0.1385764, -2.668968, 1, 0.5764706, 0, 1,
-1.365272, -0.2368982, -2.341267, 1, 0.5803922, 0, 1,
-1.360992, -1.972629, -2.098613, 1, 0.5882353, 0, 1,
-1.354124, 0.983047, 0.3594972, 1, 0.5921569, 0, 1,
-1.352043, -1.372169, -1.197039, 1, 0.6, 0, 1,
-1.343402, -0.5395012, -1.939509, 1, 0.6078432, 0, 1,
-1.342883, -0.9850563, -2.03119, 1, 0.6117647, 0, 1,
-1.340868, -0.2799027, -2.144825, 1, 0.6196079, 0, 1,
-1.329459, -1.422566, -3.208695, 1, 0.6235294, 0, 1,
-1.320168, -0.4702935, -2.167859, 1, 0.6313726, 0, 1,
-1.312142, -1.606463, -1.098416, 1, 0.6352941, 0, 1,
-1.309998, 1.431635, -1.322621, 1, 0.6431373, 0, 1,
-1.308874, 0.1019191, -2.559896, 1, 0.6470588, 0, 1,
-1.30818, 0.3425363, -1.902219, 1, 0.654902, 0, 1,
-1.303643, 0.4186576, -0.1781675, 1, 0.6588235, 0, 1,
-1.302508, -1.58956, -2.610924, 1, 0.6666667, 0, 1,
-1.297207, -0.4358308, -1.712511, 1, 0.6705883, 0, 1,
-1.292579, -0.1085497, -2.374123, 1, 0.6784314, 0, 1,
-1.285405, -0.9474871, -2.097782, 1, 0.682353, 0, 1,
-1.283628, 0.876921, 0.3455449, 1, 0.6901961, 0, 1,
-1.283195, 0.5380101, -1.474945, 1, 0.6941177, 0, 1,
-1.280571, 1.98314, 0.4793556, 1, 0.7019608, 0, 1,
-1.273587, -0.8907492, -2.462689, 1, 0.7098039, 0, 1,
-1.271752, -1.784483, -2.901647, 1, 0.7137255, 0, 1,
-1.261474, 0.6647829, -0.9224096, 1, 0.7215686, 0, 1,
-1.256635, -0.0707234, -1.154196, 1, 0.7254902, 0, 1,
-1.256407, -0.7576056, -1.667428, 1, 0.7333333, 0, 1,
-1.252729, 0.9864228, -1.222122, 1, 0.7372549, 0, 1,
-1.248246, -0.5952112, -2.215504, 1, 0.7450981, 0, 1,
-1.247388, -0.454304, -2.093261, 1, 0.7490196, 0, 1,
-1.244798, -3.457742, -2.376144, 1, 0.7568628, 0, 1,
-1.231953, -1.16964, -3.260518, 1, 0.7607843, 0, 1,
-1.225997, -1.027437, -3.967559, 1, 0.7686275, 0, 1,
-1.225291, -0.2487886, -1.613946, 1, 0.772549, 0, 1,
-1.217143, -1.056398, -3.226832, 1, 0.7803922, 0, 1,
-1.210216, -2.292478, -3.812691, 1, 0.7843137, 0, 1,
-1.202242, 1.549657, -2.48007, 1, 0.7921569, 0, 1,
-1.194528, -2.096514, -2.57855, 1, 0.7960784, 0, 1,
-1.194323, 0.6803828, 0.154352, 1, 0.8039216, 0, 1,
-1.194317, 0.05916712, -2.418553, 1, 0.8117647, 0, 1,
-1.190801, 0.09215086, -1.80984, 1, 0.8156863, 0, 1,
-1.188642, -0.3868275, -1.02556, 1, 0.8235294, 0, 1,
-1.179771, -2.472023, -1.164589, 1, 0.827451, 0, 1,
-1.178312, 0.1232931, -0.152594, 1, 0.8352941, 0, 1,
-1.175001, -2.095506, -2.369072, 1, 0.8392157, 0, 1,
-1.17177, -0.2850932, -3.234772, 1, 0.8470588, 0, 1,
-1.153507, 1.887493, -1.100186, 1, 0.8509804, 0, 1,
-1.152698, -0.665618, -3.501925, 1, 0.8588235, 0, 1,
-1.146896, 2.37153, -0.02347936, 1, 0.8627451, 0, 1,
-1.125536, 0.3476324, -1.548554, 1, 0.8705882, 0, 1,
-1.12163, 0.1678134, -1.297046, 1, 0.8745098, 0, 1,
-1.110856, 0.2921767, -1.856177, 1, 0.8823529, 0, 1,
-1.104414, 0.5205271, -0.670768, 1, 0.8862745, 0, 1,
-1.102893, -0.8681876, -2.79539, 1, 0.8941177, 0, 1,
-1.098755, -1.440002, -2.047711, 1, 0.8980392, 0, 1,
-1.083948, -0.2108698, -2.689329, 1, 0.9058824, 0, 1,
-1.082882, -0.8706489, -2.108925, 1, 0.9137255, 0, 1,
-1.077208, 2.840568, -0.3854012, 1, 0.9176471, 0, 1,
-1.069862, 1.303905, 0.9216828, 1, 0.9254902, 0, 1,
-1.066218, 0.6715632, -0.3658664, 1, 0.9294118, 0, 1,
-1.058726, 0.9002451, 0.3194692, 1, 0.9372549, 0, 1,
-1.055933, 0.01723914, -1.974676, 1, 0.9411765, 0, 1,
-1.055803, 1.223856, -0.7836752, 1, 0.9490196, 0, 1,
-1.055722, -0.3858381, -2.422307, 1, 0.9529412, 0, 1,
-1.053683, 0.6917179, -0.4206103, 1, 0.9607843, 0, 1,
-1.051466, -0.4320813, -1.959537, 1, 0.9647059, 0, 1,
-1.04971, -0.2586646, -0.9097942, 1, 0.972549, 0, 1,
-1.041502, -1.120996, -1.543937, 1, 0.9764706, 0, 1,
-1.039441, -1.521602, -2.248087, 1, 0.9843137, 0, 1,
-1.025054, 0.0347062, -0.2103482, 1, 0.9882353, 0, 1,
-1.021208, -1.076483, -2.061306, 1, 0.9960784, 0, 1,
-1.020776, 0.9170476, -0.5197739, 0.9960784, 1, 0, 1,
-1.018987, 0.3357427, -1.026555, 0.9921569, 1, 0, 1,
-1.018056, 2.348144, 0.8387698, 0.9843137, 1, 0, 1,
-1.017037, -1.039676, -3.886091, 0.9803922, 1, 0, 1,
-1.015481, -0.4751466, -2.043421, 0.972549, 1, 0, 1,
-1.012276, 0.2909977, -3.805573, 0.9686275, 1, 0, 1,
-0.9976361, 0.4221327, -0.8652436, 0.9607843, 1, 0, 1,
-0.9974892, -0.5056345, 0.6563396, 0.9568627, 1, 0, 1,
-0.9943619, -0.9070717, -1.762757, 0.9490196, 1, 0, 1,
-0.9894052, -0.1947351, -1.622516, 0.945098, 1, 0, 1,
-0.9868346, 1.337527, -0.3488667, 0.9372549, 1, 0, 1,
-0.9811817, 0.3012728, -0.6824912, 0.9333333, 1, 0, 1,
-0.9785812, 1.80531, -1.909254, 0.9254902, 1, 0, 1,
-0.9700588, 2.360069, -0.2416388, 0.9215686, 1, 0, 1,
-0.9698296, 0.7169704, -2.130935, 0.9137255, 1, 0, 1,
-0.9661759, 1.488351, -1.862972, 0.9098039, 1, 0, 1,
-0.9536375, -1.351158, -3.479226, 0.9019608, 1, 0, 1,
-0.9529355, -0.0120725, -1.98542, 0.8941177, 1, 0, 1,
-0.9488651, 0.9984495, 0.3424492, 0.8901961, 1, 0, 1,
-0.9465904, -0.2806911, -1.607622, 0.8823529, 1, 0, 1,
-0.9396703, 1.286561, -0.1396666, 0.8784314, 1, 0, 1,
-0.9376239, -1.902968, -4.451635, 0.8705882, 1, 0, 1,
-0.9278412, -0.4549725, -1.375984, 0.8666667, 1, 0, 1,
-0.9247234, -0.3378853, -1.048553, 0.8588235, 1, 0, 1,
-0.9236665, -0.4814899, -0.8142206, 0.854902, 1, 0, 1,
-0.92107, -0.3505391, -0.7013715, 0.8470588, 1, 0, 1,
-0.9178532, -0.5375693, -3.899734, 0.8431373, 1, 0, 1,
-0.9175479, -1.145904, -3.439692, 0.8352941, 1, 0, 1,
-0.9158184, 0.2754625, 0.1325952, 0.8313726, 1, 0, 1,
-0.9120028, -1.117061, -2.367756, 0.8235294, 1, 0, 1,
-0.9103281, 0.5380581, -2.24473, 0.8196079, 1, 0, 1,
-0.9087712, -0.01427656, -2.963068, 0.8117647, 1, 0, 1,
-0.9016076, 0.8437103, 0.1054538, 0.8078431, 1, 0, 1,
-0.8982278, -1.65744, -2.291553, 0.8, 1, 0, 1,
-0.8927319, 0.8077991, -3.186943, 0.7921569, 1, 0, 1,
-0.8925959, -0.2331694, -0.6300561, 0.7882353, 1, 0, 1,
-0.8908205, 1.24172, -1.927573, 0.7803922, 1, 0, 1,
-0.8892038, 0.2832129, 0.1341634, 0.7764706, 1, 0, 1,
-0.8871441, -0.1841902, -2.536569, 0.7686275, 1, 0, 1,
-0.8828493, -0.3453773, -2.303402, 0.7647059, 1, 0, 1,
-0.8798711, -1.001074, -3.842499, 0.7568628, 1, 0, 1,
-0.8773316, -0.7227983, -3.002404, 0.7529412, 1, 0, 1,
-0.873112, -1.077823, -2.315884, 0.7450981, 1, 0, 1,
-0.8725641, 1.302519, -2.069114, 0.7411765, 1, 0, 1,
-0.8711056, 1.075887, -1.860606, 0.7333333, 1, 0, 1,
-0.8683557, -0.1353589, -1.797409, 0.7294118, 1, 0, 1,
-0.8638354, -1.705208, -2.712693, 0.7215686, 1, 0, 1,
-0.8637081, -2.237668, -2.539224, 0.7176471, 1, 0, 1,
-0.8583674, 0.8172759, -0.9276628, 0.7098039, 1, 0, 1,
-0.8564941, 1.13172, -2.23758, 0.7058824, 1, 0, 1,
-0.8513521, 0.9184205, 0.2065921, 0.6980392, 1, 0, 1,
-0.8490711, 0.3087626, -4.410858, 0.6901961, 1, 0, 1,
-0.8471892, -0.5457332, -2.240532, 0.6862745, 1, 0, 1,
-0.8446844, -2.778398, -1.602705, 0.6784314, 1, 0, 1,
-0.8434772, 0.06603085, -2.34847, 0.6745098, 1, 0, 1,
-0.8426176, 1.216403, -1.50148, 0.6666667, 1, 0, 1,
-0.8393726, -0.1690402, -1.688431, 0.6627451, 1, 0, 1,
-0.8340263, 0.3022212, -2.042775, 0.654902, 1, 0, 1,
-0.8306589, -2.15825, -1.387052, 0.6509804, 1, 0, 1,
-0.8299584, -1.323311, -3.153852, 0.6431373, 1, 0, 1,
-0.8294638, 0.3475779, -0.4773531, 0.6392157, 1, 0, 1,
-0.826, 0.737165, -1.024379, 0.6313726, 1, 0, 1,
-0.824895, 0.1238, -0.4680446, 0.627451, 1, 0, 1,
-0.8242396, 0.506011, 0.9283201, 0.6196079, 1, 0, 1,
-0.823833, -0.8737069, -2.210266, 0.6156863, 1, 0, 1,
-0.8082273, -0.2254081, -1.081534, 0.6078432, 1, 0, 1,
-0.8017951, 0.720888, 1.111241, 0.6039216, 1, 0, 1,
-0.7961438, 1.052747, -1.321529, 0.5960785, 1, 0, 1,
-0.7939882, -1.407833, -2.128908, 0.5882353, 1, 0, 1,
-0.7857561, -1.043873, -1.558473, 0.5843138, 1, 0, 1,
-0.7792614, 0.1965951, -1.54636, 0.5764706, 1, 0, 1,
-0.7783098, -0.6509376, -1.978605, 0.572549, 1, 0, 1,
-0.776255, 0.6387048, -0.4917896, 0.5647059, 1, 0, 1,
-0.77522, -1.371056, -2.70747, 0.5607843, 1, 0, 1,
-0.7744535, 0.4700556, -2.252525, 0.5529412, 1, 0, 1,
-0.770028, 0.3449714, -0.2657476, 0.5490196, 1, 0, 1,
-0.7658677, 0.004864861, -0.2168313, 0.5411765, 1, 0, 1,
-0.7628581, 0.1953389, -0.6390502, 0.5372549, 1, 0, 1,
-0.7612946, 0.4144182, -0.9447688, 0.5294118, 1, 0, 1,
-0.7560123, -0.8112671, -2.027442, 0.5254902, 1, 0, 1,
-0.7534467, -1.522646, -1.804674, 0.5176471, 1, 0, 1,
-0.7530453, 0.6894261, -2.346566, 0.5137255, 1, 0, 1,
-0.751301, 0.4249564, -0.5771053, 0.5058824, 1, 0, 1,
-0.7415761, 2.216456, -0.1190584, 0.5019608, 1, 0, 1,
-0.7415401, -1.616282, -1.614221, 0.4941176, 1, 0, 1,
-0.7401879, 0.1964793, -2.683062, 0.4862745, 1, 0, 1,
-0.7401753, -0.06241747, -1.256557, 0.4823529, 1, 0, 1,
-0.7337161, -1.945588, -3.730253, 0.4745098, 1, 0, 1,
-0.7229353, 0.5232702, 0.9055532, 0.4705882, 1, 0, 1,
-0.7219295, -0.1262575, -0.439558, 0.4627451, 1, 0, 1,
-0.7197892, 2.503598, -1.531076, 0.4588235, 1, 0, 1,
-0.7141874, 1.038561, -0.1915064, 0.4509804, 1, 0, 1,
-0.7114874, -0.4432539, -1.682733, 0.4470588, 1, 0, 1,
-0.7075397, -0.1014028, -3.220518, 0.4392157, 1, 0, 1,
-0.7042761, 0.410224, -0.8592603, 0.4352941, 1, 0, 1,
-0.700367, 1.471001, 0.1543851, 0.427451, 1, 0, 1,
-0.6976665, -0.3324108, -2.836227, 0.4235294, 1, 0, 1,
-0.6969755, 1.34726, -1.361387, 0.4156863, 1, 0, 1,
-0.6933262, 0.06649534, -2.004529, 0.4117647, 1, 0, 1,
-0.6922705, 0.2555409, -1.642082, 0.4039216, 1, 0, 1,
-0.68931, 0.1415195, -0.7509689, 0.3960784, 1, 0, 1,
-0.6758706, -0.4206062, -2.046429, 0.3921569, 1, 0, 1,
-0.6732869, 0.1542514, -1.944385, 0.3843137, 1, 0, 1,
-0.6700867, 0.3900185, -2.364279, 0.3803922, 1, 0, 1,
-0.6677231, 0.2209621, -1.962554, 0.372549, 1, 0, 1,
-0.6669706, -1.202918, -2.029195, 0.3686275, 1, 0, 1,
-0.6656062, -0.4379988, -3.814469, 0.3607843, 1, 0, 1,
-0.6651604, 0.567341, -1.187957, 0.3568628, 1, 0, 1,
-0.6635142, -1.274055, -3.205189, 0.3490196, 1, 0, 1,
-0.6569079, -0.2071806, -3.157674, 0.345098, 1, 0, 1,
-0.6522142, -0.569236, -0.345947, 0.3372549, 1, 0, 1,
-0.6488443, -1.127405, -3.956775, 0.3333333, 1, 0, 1,
-0.6478127, 1.818936, -1.244099, 0.3254902, 1, 0, 1,
-0.6451497, 0.2290825, -1.811954, 0.3215686, 1, 0, 1,
-0.6440586, 1.02098, 0.2120706, 0.3137255, 1, 0, 1,
-0.6437628, 0.4041623, -0.6035494, 0.3098039, 1, 0, 1,
-0.6426187, -1.241495, -3.947036, 0.3019608, 1, 0, 1,
-0.6392381, -0.1265902, -3.760358, 0.2941177, 1, 0, 1,
-0.6324789, 0.203951, -2.75583, 0.2901961, 1, 0, 1,
-0.6310105, -0.3327917, -2.185928, 0.282353, 1, 0, 1,
-0.6273932, 0.2763415, -0.7088102, 0.2784314, 1, 0, 1,
-0.627361, -0.7752498, -1.119505, 0.2705882, 1, 0, 1,
-0.6270661, -0.8527064, -4.146467, 0.2666667, 1, 0, 1,
-0.6244854, -0.26239, -2.842046, 0.2588235, 1, 0, 1,
-0.6118013, -0.4371328, -4.33504, 0.254902, 1, 0, 1,
-0.6088276, 0.04077377, -0.8743752, 0.2470588, 1, 0, 1,
-0.6085096, 0.1823008, -1.133496, 0.2431373, 1, 0, 1,
-0.6066336, 0.002612093, -1.244933, 0.2352941, 1, 0, 1,
-0.5954293, 1.907796, -1.036518, 0.2313726, 1, 0, 1,
-0.590602, 0.9165555, 1.17334, 0.2235294, 1, 0, 1,
-0.5903608, 0.7214235, -1.018893, 0.2196078, 1, 0, 1,
-0.5899847, -0.7897638, -2.723476, 0.2117647, 1, 0, 1,
-0.5880392, 1.660314, -0.7096836, 0.2078431, 1, 0, 1,
-0.5873646, 0.7238178, -1.246726, 0.2, 1, 0, 1,
-0.5867079, -0.4405162, -2.983315, 0.1921569, 1, 0, 1,
-0.5865594, -1.598316, -4.640062, 0.1882353, 1, 0, 1,
-0.5785074, 0.6430198, -2.379688, 0.1803922, 1, 0, 1,
-0.5771899, 0.7580571, 0.657937, 0.1764706, 1, 0, 1,
-0.5703799, 0.2475727, -0.3685776, 0.1686275, 1, 0, 1,
-0.5695151, -1.838604, -4.336959, 0.1647059, 1, 0, 1,
-0.5665596, -1.992978, -4.365053, 0.1568628, 1, 0, 1,
-0.5656095, -1.422928, -2.464537, 0.1529412, 1, 0, 1,
-0.5653624, 2.026654, 0.0419039, 0.145098, 1, 0, 1,
-0.5622222, -1.399968, -3.111273, 0.1411765, 1, 0, 1,
-0.5612848, 0.5709338, 0.1190822, 0.1333333, 1, 0, 1,
-0.5586348, 0.1862198, 1.22692, 0.1294118, 1, 0, 1,
-0.5565859, 0.5802945, 0.4043699, 0.1215686, 1, 0, 1,
-0.5559626, 0.4766449, -1.150463, 0.1176471, 1, 0, 1,
-0.5558656, 1.152254, -1.446345, 0.1098039, 1, 0, 1,
-0.5538986, 0.2583635, -1.70741, 0.1058824, 1, 0, 1,
-0.5522202, 0.87548, -0.3268482, 0.09803922, 1, 0, 1,
-0.5495697, 0.1545891, -2.098017, 0.09019608, 1, 0, 1,
-0.5434191, -0.6129761, -2.938362, 0.08627451, 1, 0, 1,
-0.5425065, 0.2364666, -0.4725033, 0.07843138, 1, 0, 1,
-0.5389317, 1.115345, 0.4892339, 0.07450981, 1, 0, 1,
-0.5374687, -1.161419, -2.438033, 0.06666667, 1, 0, 1,
-0.5291057, 0.5466581, -0.1576058, 0.0627451, 1, 0, 1,
-0.5275, -1.149273, -2.346869, 0.05490196, 1, 0, 1,
-0.5274507, 0.7062278, -0.0831476, 0.05098039, 1, 0, 1,
-0.5261664, 0.3086551, -0.2464383, 0.04313726, 1, 0, 1,
-0.5200531, -1.883407, -4.425418, 0.03921569, 1, 0, 1,
-0.5127058, 3.456786, -1.361102, 0.03137255, 1, 0, 1,
-0.5108697, 1.012263, -0.2861503, 0.02745098, 1, 0, 1,
-0.509214, -0.8633907, -2.178224, 0.01960784, 1, 0, 1,
-0.5089704, 1.0821, 0.2941789, 0.01568628, 1, 0, 1,
-0.5088699, -0.04019013, -2.235061, 0.007843138, 1, 0, 1,
-0.5056215, -0.5068432, -3.956229, 0.003921569, 1, 0, 1,
-0.5031676, -0.2856093, -1.956478, 0, 1, 0.003921569, 1,
-0.4997009, -1.562179, -1.020977, 0, 1, 0.01176471, 1,
-0.4969763, -0.3512029, -3.099826, 0, 1, 0.01568628, 1,
-0.4950207, 0.4797616, -1.280604, 0, 1, 0.02352941, 1,
-0.4894914, 0.1268338, 0.4291717, 0, 1, 0.02745098, 1,
-0.4887742, 1.423354, -0.4902597, 0, 1, 0.03529412, 1,
-0.4879782, 1.070752, -1.114677, 0, 1, 0.03921569, 1,
-0.4855767, 0.3890817, -0.2104484, 0, 1, 0.04705882, 1,
-0.4818258, -0.1483237, -1.869981, 0, 1, 0.05098039, 1,
-0.479043, 1.337994, 0.1456792, 0, 1, 0.05882353, 1,
-0.4784593, -0.6649733, -2.759549, 0, 1, 0.0627451, 1,
-0.4723137, -0.5385686, -2.214064, 0, 1, 0.07058824, 1,
-0.4719069, 0.9352977, -1.540149, 0, 1, 0.07450981, 1,
-0.4676925, -0.8154991, -1.571254, 0, 1, 0.08235294, 1,
-0.4669485, -0.6825836, -4.061126, 0, 1, 0.08627451, 1,
-0.4655598, 0.7901843, -0.1031407, 0, 1, 0.09411765, 1,
-0.4650614, -1.016047, -4.524371, 0, 1, 0.1019608, 1,
-0.4644397, 0.7586567, -0.04908302, 0, 1, 0.1058824, 1,
-0.4637328, 1.797301, -0.4946116, 0, 1, 0.1137255, 1,
-0.4583839, -0.3461757, -2.287251, 0, 1, 0.1176471, 1,
-0.4577623, -0.6622856, -2.164253, 0, 1, 0.1254902, 1,
-0.4558341, -0.5882635, -3.93224, 0, 1, 0.1294118, 1,
-0.4549238, -1.034305, -1.073959, 0, 1, 0.1372549, 1,
-0.4510901, 0.1478257, -0.6329128, 0, 1, 0.1411765, 1,
-0.4472129, -1.461044, -3.599918, 0, 1, 0.1490196, 1,
-0.4435122, 0.7692644, -1.25935, 0, 1, 0.1529412, 1,
-0.442718, -0.6347812, -3.79735, 0, 1, 0.1607843, 1,
-0.4425413, 1.478633, 0.1716419, 0, 1, 0.1647059, 1,
-0.4400645, -0.8707871, -0.7309589, 0, 1, 0.172549, 1,
-0.439878, -0.419102, -2.993212, 0, 1, 0.1764706, 1,
-0.439306, 1.1054, 0.1403385, 0, 1, 0.1843137, 1,
-0.4381308, -0.1489934, -2.989536, 0, 1, 0.1882353, 1,
-0.435757, 0.5272045, 0.05202617, 0, 1, 0.1960784, 1,
-0.433546, -1.497882, -2.765759, 0, 1, 0.2039216, 1,
-0.4330528, 0.147144, -0.245004, 0, 1, 0.2078431, 1,
-0.4328048, 1.489524, -1.185442, 0, 1, 0.2156863, 1,
-0.4268486, 0.1351431, -1.193636, 0, 1, 0.2196078, 1,
-0.4207134, -1.006786, -3.23921, 0, 1, 0.227451, 1,
-0.4159663, -2.001322, -3.019863, 0, 1, 0.2313726, 1,
-0.4153574, 0.9871868, -0.7795495, 0, 1, 0.2392157, 1,
-0.4150499, -2.228493, -3.132059, 0, 1, 0.2431373, 1,
-0.4094243, -0.3177404, -2.949165, 0, 1, 0.2509804, 1,
-0.4087013, 1.397324, 0.6353777, 0, 1, 0.254902, 1,
-0.4057908, 1.597577, -0.9410104, 0, 1, 0.2627451, 1,
-0.4025851, -0.5659949, -1.581585, 0, 1, 0.2666667, 1,
-0.3958515, 0.4057171, -0.565533, 0, 1, 0.2745098, 1,
-0.3958414, -0.9693938, -2.028276, 0, 1, 0.2784314, 1,
-0.3865649, -1.049202, -2.489233, 0, 1, 0.2862745, 1,
-0.385587, -0.6007034, -3.180903, 0, 1, 0.2901961, 1,
-0.3833281, -0.09047181, -1.017303, 0, 1, 0.2980392, 1,
-0.3819901, -0.737235, -3.692934, 0, 1, 0.3058824, 1,
-0.379804, 1.118366, 0.05792438, 0, 1, 0.3098039, 1,
-0.3779366, 2.100001, 0.4051172, 0, 1, 0.3176471, 1,
-0.3771841, 2.034348, -0.8258926, 0, 1, 0.3215686, 1,
-0.3737108, -0.01486015, -1.947404, 0, 1, 0.3294118, 1,
-0.3705233, 0.661558, -2.065285, 0, 1, 0.3333333, 1,
-0.3703391, 0.3613892, 0.267655, 0, 1, 0.3411765, 1,
-0.3628208, -0.8799566, -1.170125, 0, 1, 0.345098, 1,
-0.3561562, -0.508846, -2.609029, 0, 1, 0.3529412, 1,
-0.3560288, -0.6977112, -1.766778, 0, 1, 0.3568628, 1,
-0.3540762, 0.951563, 0.9243954, 0, 1, 0.3647059, 1,
-0.3518752, -0.5562268, -2.897663, 0, 1, 0.3686275, 1,
-0.3500716, 0.6637685, -1.964984, 0, 1, 0.3764706, 1,
-0.3494168, 1.443653, 1.129122, 0, 1, 0.3803922, 1,
-0.3490143, -0.2235726, -0.4577029, 0, 1, 0.3882353, 1,
-0.3470009, -0.08251652, -1.28857, 0, 1, 0.3921569, 1,
-0.3461896, 0.7323036, -1.672367, 0, 1, 0.4, 1,
-0.3452304, -2.702988, -2.399168, 0, 1, 0.4078431, 1,
-0.3363441, -0.03422055, -1.696886, 0, 1, 0.4117647, 1,
-0.335582, 0.6663769, -0.9638694, 0, 1, 0.4196078, 1,
-0.3349422, -0.01752522, -1.733544, 0, 1, 0.4235294, 1,
-0.3312413, 0.01537792, -1.861785, 0, 1, 0.4313726, 1,
-0.3284323, -0.294315, -1.529463, 0, 1, 0.4352941, 1,
-0.3230527, 0.05083871, -3.465577, 0, 1, 0.4431373, 1,
-0.3149504, -1.429606, -4.899652, 0, 1, 0.4470588, 1,
-0.3118376, -1.384385, -2.953235, 0, 1, 0.454902, 1,
-0.3102525, -0.8130167, -3.890505, 0, 1, 0.4588235, 1,
-0.3055243, -1.560699, -1.182109, 0, 1, 0.4666667, 1,
-0.3044887, 0.1582228, -1.817608, 0, 1, 0.4705882, 1,
-0.3043502, 0.5844645, -1.957036, 0, 1, 0.4784314, 1,
-0.3023059, 2.104036, -1.005297, 0, 1, 0.4823529, 1,
-0.2996831, -0.1640291, -1.564674, 0, 1, 0.4901961, 1,
-0.2989323, 0.4136824, -1.272128, 0, 1, 0.4941176, 1,
-0.2970796, 2.582528, -2.527334, 0, 1, 0.5019608, 1,
-0.2848562, -1.39962, -3.782117, 0, 1, 0.509804, 1,
-0.2848485, -0.6428474, -5.341073, 0, 1, 0.5137255, 1,
-0.278856, -0.2524272, -2.756007, 0, 1, 0.5215687, 1,
-0.2782766, 1.160982, -0.3489267, 0, 1, 0.5254902, 1,
-0.2727069, -1.102357, -4.069118, 0, 1, 0.5333334, 1,
-0.2682152, 1.620517, -0.4002368, 0, 1, 0.5372549, 1,
-0.2648903, 0.001910893, -1.471938, 0, 1, 0.5450981, 1,
-0.2602318, 1.213741, 0.0117286, 0, 1, 0.5490196, 1,
-0.2591665, -1.038405, -0.4881188, 0, 1, 0.5568628, 1,
-0.2568038, -0.6036982, -3.30006, 0, 1, 0.5607843, 1,
-0.2533207, -0.7435963, -2.684032, 0, 1, 0.5686275, 1,
-0.2393411, 0.8672956, 1.919386, 0, 1, 0.572549, 1,
-0.2386493, 1.91557, 1.953211, 0, 1, 0.5803922, 1,
-0.2385617, -0.07919888, 0.1005675, 0, 1, 0.5843138, 1,
-0.2343736, -0.4400442, -1.952308, 0, 1, 0.5921569, 1,
-0.232519, -0.1858477, -1.916872, 0, 1, 0.5960785, 1,
-0.2319201, 1.225833, -0.3552282, 0, 1, 0.6039216, 1,
-0.2303071, -0.8868673, -2.190464, 0, 1, 0.6117647, 1,
-0.2278093, -0.4885871, -2.808689, 0, 1, 0.6156863, 1,
-0.2246108, -0.4409642, -1.201442, 0, 1, 0.6235294, 1,
-0.2206879, -0.6071823, -3.090552, 0, 1, 0.627451, 1,
-0.2159547, -0.5042287, -1.780233, 0, 1, 0.6352941, 1,
-0.2073026, 1.009776, 1.273241, 0, 1, 0.6392157, 1,
-0.2058286, 0.1534672, -0.7551349, 0, 1, 0.6470588, 1,
-0.2045968, 0.5568559, -1.84138, 0, 1, 0.6509804, 1,
-0.1980158, -0.8683377, -3.559679, 0, 1, 0.6588235, 1,
-0.1959931, -0.4990953, -2.652409, 0, 1, 0.6627451, 1,
-0.1938083, 1.878923, 0.1798945, 0, 1, 0.6705883, 1,
-0.1909853, -1.262504, -3.379056, 0, 1, 0.6745098, 1,
-0.1905643, 0.3596586, -1.441228, 0, 1, 0.682353, 1,
-0.1840531, -1.638792, -3.033042, 0, 1, 0.6862745, 1,
-0.1822404, 0.08671974, 0.804809, 0, 1, 0.6941177, 1,
-0.1818125, 0.205425, -1.087382, 0, 1, 0.7019608, 1,
-0.1811178, 0.09577323, -1.272921, 0, 1, 0.7058824, 1,
-0.1748907, -0.6573444, -3.847131, 0, 1, 0.7137255, 1,
-0.1707921, 0.8097262, 0.3061933, 0, 1, 0.7176471, 1,
-0.1696613, -1.827168, -3.962894, 0, 1, 0.7254902, 1,
-0.1682333, 0.1622485, -0.5230842, 0, 1, 0.7294118, 1,
-0.1667646, -1.186626, -3.171834, 0, 1, 0.7372549, 1,
-0.1659356, -1.206973, -3.533016, 0, 1, 0.7411765, 1,
-0.1656834, 0.4674681, -2.695565, 0, 1, 0.7490196, 1,
-0.1642051, 1.642581, -1.149245, 0, 1, 0.7529412, 1,
-0.163863, -1.003275, -3.022041, 0, 1, 0.7607843, 1,
-0.1614221, 0.5190673, 0.9762396, 0, 1, 0.7647059, 1,
-0.1613795, 1.100888, -0.3426087, 0, 1, 0.772549, 1,
-0.1527577, -1.043112, -2.31572, 0, 1, 0.7764706, 1,
-0.1520151, 0.449166, -0.4900975, 0, 1, 0.7843137, 1,
-0.1502756, -0.2445054, -2.358434, 0, 1, 0.7882353, 1,
-0.150057, -1.002774, -2.109011, 0, 1, 0.7960784, 1,
-0.1492038, -0.2588206, -3.086918, 0, 1, 0.8039216, 1,
-0.1299938, 1.332223, 1.181562, 0, 1, 0.8078431, 1,
-0.1257898, 2.008976, 0.581122, 0, 1, 0.8156863, 1,
-0.1256997, -0.01731755, -0.6928256, 0, 1, 0.8196079, 1,
-0.1256239, -1.184143, -3.881321, 0, 1, 0.827451, 1,
-0.1228229, 0.9653348, -1.789663, 0, 1, 0.8313726, 1,
-0.1214728, 0.07166308, 0.03139335, 0, 1, 0.8392157, 1,
-0.1195703, 0.7033814, 0.1258043, 0, 1, 0.8431373, 1,
-0.1194301, 0.6931751, -0.02140254, 0, 1, 0.8509804, 1,
-0.1185756, 0.5844516, 0.4194329, 0, 1, 0.854902, 1,
-0.1102352, -0.42799, -2.676177, 0, 1, 0.8627451, 1,
-0.1073975, -0.2758389, -2.282535, 0, 1, 0.8666667, 1,
-0.1065281, -0.7740417, -2.188912, 0, 1, 0.8745098, 1,
-0.1065065, -0.1021956, -1.965301, 0, 1, 0.8784314, 1,
-0.1029296, -0.8798138, -3.354779, 0, 1, 0.8862745, 1,
-0.1019627, -0.1283896, -0.4121245, 0, 1, 0.8901961, 1,
-0.1003461, 0.008528742, -2.455174, 0, 1, 0.8980392, 1,
-0.09642977, 2.129971, 0.1046233, 0, 1, 0.9058824, 1,
-0.08783514, 0.3052825, 0.2279352, 0, 1, 0.9098039, 1,
-0.08483995, -0.134391, -1.682206, 0, 1, 0.9176471, 1,
-0.08351684, -0.1139952, -1.619634, 0, 1, 0.9215686, 1,
-0.08322625, -1.357232, -1.754928, 0, 1, 0.9294118, 1,
-0.08237389, -1.95103, -2.161041, 0, 1, 0.9333333, 1,
-0.07756377, -1.431782, -3.93678, 0, 1, 0.9411765, 1,
-0.0766684, 0.2761731, 0.1367715, 0, 1, 0.945098, 1,
-0.07635083, 1.651337, -1.841186, 0, 1, 0.9529412, 1,
-0.07526373, 0.6095703, -1.77518, 0, 1, 0.9568627, 1,
-0.07104088, 0.7962391, 1.336166, 0, 1, 0.9647059, 1,
-0.06870998, 0.8803887, 1.524115, 0, 1, 0.9686275, 1,
-0.06650107, -0.7434986, -2.135115, 0, 1, 0.9764706, 1,
-0.06540717, 1.414693, 1.813769, 0, 1, 0.9803922, 1,
-0.05374094, -0.4686421, -3.632846, 0, 1, 0.9882353, 1,
-0.05362389, -0.7512966, -2.888718, 0, 1, 0.9921569, 1,
-0.04824189, 0.7864732, 2.279027, 0, 1, 1, 1,
-0.04823697, -0.6126152, -2.88099, 0, 0.9921569, 1, 1,
-0.03691923, -0.6169339, -3.233859, 0, 0.9882353, 1, 1,
-0.0356435, -0.7622676, -2.527178, 0, 0.9803922, 1, 1,
-0.03495036, -1.973615, -0.6111403, 0, 0.9764706, 1, 1,
-0.03087406, 0.653551, 1.088072, 0, 0.9686275, 1, 1,
-0.03074639, 0.8431233, 0.1538313, 0, 0.9647059, 1, 1,
-0.02914317, -0.3867976, -2.163761, 0, 0.9568627, 1, 1,
-0.02727614, 0.2504471, -0.4858218, 0, 0.9529412, 1, 1,
-0.02700817, 2.594382, -0.6000072, 0, 0.945098, 1, 1,
-0.02615726, -0.07710563, -3.570312, 0, 0.9411765, 1, 1,
-0.02591331, 0.4794038, -0.5584929, 0, 0.9333333, 1, 1,
-0.02123161, 1.33097, 0.222641, 0, 0.9294118, 1, 1,
-0.02040256, 0.1646404, -0.9825211, 0, 0.9215686, 1, 1,
-0.01843858, -0.7185928, -4.168521, 0, 0.9176471, 1, 1,
-0.01745364, 0.5280956, -0.707812, 0, 0.9098039, 1, 1,
-0.01658781, 0.06175266, 0.08506494, 0, 0.9058824, 1, 1,
-0.01642066, 1.097679, 1.635716, 0, 0.8980392, 1, 1,
-0.01487613, 0.2951416, 0.1441211, 0, 0.8901961, 1, 1,
-0.01364536, -0.1989858, -0.7761375, 0, 0.8862745, 1, 1,
-0.01355073, -0.4286339, -2.366192, 0, 0.8784314, 1, 1,
-0.01182234, -0.4885551, -3.694279, 0, 0.8745098, 1, 1,
-0.005732779, -1.327399, -2.154537, 0, 0.8666667, 1, 1,
-0.002678599, 0.0317499, 0.3925054, 0, 0.8627451, 1, 1,
-0.0005218904, 0.4816204, -0.196881, 0, 0.854902, 1, 1,
0.002249973, 1.110292, -1.103011, 0, 0.8509804, 1, 1,
0.009846489, 0.9572331, 0.3472263, 0, 0.8431373, 1, 1,
0.01333834, -0.2170965, 3.134131, 0, 0.8392157, 1, 1,
0.01798103, -0.4530221, 4.282142, 0, 0.8313726, 1, 1,
0.01800613, 0.5013927, 0.08533922, 0, 0.827451, 1, 1,
0.02162789, -0.9986104, 3.358142, 0, 0.8196079, 1, 1,
0.02245581, -0.3859698, 3.58662, 0, 0.8156863, 1, 1,
0.02454452, 0.06102897, -1.901617, 0, 0.8078431, 1, 1,
0.02553256, 0.8265168, 0.8879524, 0, 0.8039216, 1, 1,
0.02726602, -0.4400019, 2.072999, 0, 0.7960784, 1, 1,
0.02966405, 0.01265406, 0.8967867, 0, 0.7882353, 1, 1,
0.03000323, 0.3046355, 2.152323, 0, 0.7843137, 1, 1,
0.03286015, -2.260953, 4.119729, 0, 0.7764706, 1, 1,
0.03549736, 0.9492463, -0.08982377, 0, 0.772549, 1, 1,
0.04097473, -0.2893941, 3.185945, 0, 0.7647059, 1, 1,
0.04542692, 1.03796, -1.40349, 0, 0.7607843, 1, 1,
0.04543921, 0.6134282, -0.5662864, 0, 0.7529412, 1, 1,
0.04602977, 0.3583078, -1.126993, 0, 0.7490196, 1, 1,
0.04865745, -0.3303336, 2.458663, 0, 0.7411765, 1, 1,
0.05033417, 0.767855, -1.166277, 0, 0.7372549, 1, 1,
0.05050183, -0.6589603, 3.480231, 0, 0.7294118, 1, 1,
0.05297052, 0.6964608, -0.4059877, 0, 0.7254902, 1, 1,
0.05591528, 2.14966, -0.6097884, 0, 0.7176471, 1, 1,
0.05743339, -2.310432, 3.369595, 0, 0.7137255, 1, 1,
0.06022278, -2.866447, 4.482909, 0, 0.7058824, 1, 1,
0.06061178, 0.5427268, 1.383554, 0, 0.6980392, 1, 1,
0.06214659, -0.4089713, 2.676242, 0, 0.6941177, 1, 1,
0.06349587, -1.053021, 2.272703, 0, 0.6862745, 1, 1,
0.06384509, -1.89001, 4.606211, 0, 0.682353, 1, 1,
0.06481784, 1.006035, -0.1378454, 0, 0.6745098, 1, 1,
0.06769691, -1.359321, 3.021946, 0, 0.6705883, 1, 1,
0.06801546, -0.2406915, 3.882065, 0, 0.6627451, 1, 1,
0.07196624, 1.89486, 0.03351878, 0, 0.6588235, 1, 1,
0.07201893, 0.3812758, -0.08177829, 0, 0.6509804, 1, 1,
0.07490115, -0.2068406, 3.857515, 0, 0.6470588, 1, 1,
0.07511785, 1.542234, -1.006782, 0, 0.6392157, 1, 1,
0.0767144, 1.711445, 1.867007, 0, 0.6352941, 1, 1,
0.08023212, -0.4580094, 2.554293, 0, 0.627451, 1, 1,
0.08181753, -0.1701332, 2.418126, 0, 0.6235294, 1, 1,
0.08386783, -0.5064034, 1.955243, 0, 0.6156863, 1, 1,
0.08405915, 0.02193177, 1.437327, 0, 0.6117647, 1, 1,
0.08512101, -2.182646, 2.908112, 0, 0.6039216, 1, 1,
0.09488121, 0.9238971, -2.112128, 0, 0.5960785, 1, 1,
0.09781396, -2.048821, 2.972447, 0, 0.5921569, 1, 1,
0.1034989, 0.01266673, -0.5685534, 0, 0.5843138, 1, 1,
0.1102883, -0.205994, 3.220948, 0, 0.5803922, 1, 1,
0.1170845, -0.8520567, 2.809982, 0, 0.572549, 1, 1,
0.1185102, 0.2330188, 0.1349705, 0, 0.5686275, 1, 1,
0.1193513, 0.7714086, 1.137149, 0, 0.5607843, 1, 1,
0.1236967, 0.1939882, 0.608379, 0, 0.5568628, 1, 1,
0.1308588, 0.02802947, 0.8247762, 0, 0.5490196, 1, 1,
0.1319765, -2.071568, 2.06095, 0, 0.5450981, 1, 1,
0.1357672, -0.2781757, 3.208494, 0, 0.5372549, 1, 1,
0.1374131, 0.2781039, -0.5479171, 0, 0.5333334, 1, 1,
0.1410574, -0.4353033, 2.627677, 0, 0.5254902, 1, 1,
0.1422136, 0.7525364, 0.7115211, 0, 0.5215687, 1, 1,
0.1476935, -0.7836617, 1.823741, 0, 0.5137255, 1, 1,
0.1509512, 0.06463496, 2.328543, 0, 0.509804, 1, 1,
0.1546734, 0.3488096, 1.829291, 0, 0.5019608, 1, 1,
0.1562331, 0.07525083, 1.494601, 0, 0.4941176, 1, 1,
0.1574398, 0.4674948, 1.47214, 0, 0.4901961, 1, 1,
0.1582907, -0.1278378, 1.402459, 0, 0.4823529, 1, 1,
0.1591319, -0.1227607, 0.8458893, 0, 0.4784314, 1, 1,
0.1600645, -0.1068148, 2.56113, 0, 0.4705882, 1, 1,
0.1622941, -0.9001518, 3.1683, 0, 0.4666667, 1, 1,
0.163057, 0.7062267, -1.001597, 0, 0.4588235, 1, 1,
0.163777, 1.028769, 0.4965895, 0, 0.454902, 1, 1,
0.1687269, -0.4208351, 1.783143, 0, 0.4470588, 1, 1,
0.1730181, 0.4977477, 0.9657136, 0, 0.4431373, 1, 1,
0.1734861, -0.504977, 1.654146, 0, 0.4352941, 1, 1,
0.1798297, 0.4573979, 1.979864, 0, 0.4313726, 1, 1,
0.1828845, 0.7190863, 0.399166, 0, 0.4235294, 1, 1,
0.1856239, -0.2477459, 3.690728, 0, 0.4196078, 1, 1,
0.1865999, 1.334422, 0.8539264, 0, 0.4117647, 1, 1,
0.188999, -1.096996, 3.277701, 0, 0.4078431, 1, 1,
0.1916652, -0.5537754, 5.387456, 0, 0.4, 1, 1,
0.1920568, -0.6660392, 3.478453, 0, 0.3921569, 1, 1,
0.1939749, -0.7822681, 2.021614, 0, 0.3882353, 1, 1,
0.1952271, 1.09118, -0.09114882, 0, 0.3803922, 1, 1,
0.1991335, -0.7916316, 3.284146, 0, 0.3764706, 1, 1,
0.1992263, 0.6390905, 1.209435, 0, 0.3686275, 1, 1,
0.2006509, -0.1706589, 3.484916, 0, 0.3647059, 1, 1,
0.2006717, 1.419875, 0.7205958, 0, 0.3568628, 1, 1,
0.2015815, -0.9057032, 1.534638, 0, 0.3529412, 1, 1,
0.2017828, 2.138337, 1.075504, 0, 0.345098, 1, 1,
0.2020889, -0.8191615, 2.41824, 0, 0.3411765, 1, 1,
0.2040475, 0.6471353, -0.620362, 0, 0.3333333, 1, 1,
0.2064061, -2.17011, 2.708647, 0, 0.3294118, 1, 1,
0.2118807, 0.3431617, -1.228979, 0, 0.3215686, 1, 1,
0.2145081, -0.7505918, 4.614544, 0, 0.3176471, 1, 1,
0.2147319, 0.2700954, 1.195475, 0, 0.3098039, 1, 1,
0.2224612, -1.194747, 1.849785, 0, 0.3058824, 1, 1,
0.2245978, 0.5330946, 1.885582, 0, 0.2980392, 1, 1,
0.2252349, 0.103421, 1.162822, 0, 0.2901961, 1, 1,
0.225672, -1.755295, 4.148179, 0, 0.2862745, 1, 1,
0.2259185, -0.4645636, 2.012552, 0, 0.2784314, 1, 1,
0.2271418, -1.181896, 2.795934, 0, 0.2745098, 1, 1,
0.2332249, -0.5132613, 1.922486, 0, 0.2666667, 1, 1,
0.244841, 0.7561247, 1.706585, 0, 0.2627451, 1, 1,
0.2490304, 1.186946, -0.3452787, 0, 0.254902, 1, 1,
0.2494755, 0.8401234, 0.6337051, 0, 0.2509804, 1, 1,
0.2520733, -0.7290219, 3.695695, 0, 0.2431373, 1, 1,
0.2534402, 0.6357428, 0.2791164, 0, 0.2392157, 1, 1,
0.2537631, 0.005536968, 1.785184, 0, 0.2313726, 1, 1,
0.2539338, -0.1393627, 1.977612, 0, 0.227451, 1, 1,
0.2590255, 1.853146, -1.621165, 0, 0.2196078, 1, 1,
0.2608145, -0.01392955, 0.9561937, 0, 0.2156863, 1, 1,
0.2660211, -0.05585714, 1.548274, 0, 0.2078431, 1, 1,
0.2673671, -0.7705451, 3.715866, 0, 0.2039216, 1, 1,
0.2675084, -0.9716992, 2.109958, 0, 0.1960784, 1, 1,
0.2710763, 0.5556369, -1.351658, 0, 0.1882353, 1, 1,
0.2729, 0.4812306, 0.9431748, 0, 0.1843137, 1, 1,
0.2759001, 0.02102275, 2.529055, 0, 0.1764706, 1, 1,
0.2811677, -1.270967, 1.025527, 0, 0.172549, 1, 1,
0.2888553, -0.5603921, 3.851748, 0, 0.1647059, 1, 1,
0.2982615, -0.4344516, 1.726056, 0, 0.1607843, 1, 1,
0.2999805, 0.5025545, 0.03359835, 0, 0.1529412, 1, 1,
0.3019307, 1.97641, 1.575712, 0, 0.1490196, 1, 1,
0.3071251, 0.03407221, 2.141715, 0, 0.1411765, 1, 1,
0.3084006, -0.01000006, 1.223612, 0, 0.1372549, 1, 1,
0.3103322, -0.6584194, 1.610051, 0, 0.1294118, 1, 1,
0.310557, -0.7438598, 2.182566, 0, 0.1254902, 1, 1,
0.3132948, 0.5606912, 0.7871277, 0, 0.1176471, 1, 1,
0.3159769, -1.060763, 2.775192, 0, 0.1137255, 1, 1,
0.3199208, 0.1546348, 0.7937977, 0, 0.1058824, 1, 1,
0.3235166, 0.07946275, 0.6470131, 0, 0.09803922, 1, 1,
0.3271687, 0.8870891, 0.5072938, 0, 0.09411765, 1, 1,
0.3287143, 0.3257037, 0.249855, 0, 0.08627451, 1, 1,
0.3302009, 0.6918349, 0.8641692, 0, 0.08235294, 1, 1,
0.3309838, -0.869702, 3.108993, 0, 0.07450981, 1, 1,
0.3318499, -0.6474011, 4.393853, 0, 0.07058824, 1, 1,
0.3320285, 0.3777905, -0.1335813, 0, 0.0627451, 1, 1,
0.33926, -1.109434, 2.023633, 0, 0.05882353, 1, 1,
0.3399482, 1.70534, 0.0355542, 0, 0.05098039, 1, 1,
0.3401057, -1.018863, 1.834389, 0, 0.04705882, 1, 1,
0.3410591, -0.5045307, 0.9971002, 0, 0.03921569, 1, 1,
0.3432399, 0.5862387, -0.3913107, 0, 0.03529412, 1, 1,
0.3440255, -0.5505035, 4.446513, 0, 0.02745098, 1, 1,
0.3441838, 0.37736, 1.888479, 0, 0.02352941, 1, 1,
0.3456613, 0.39248, -0.3416898, 0, 0.01568628, 1, 1,
0.3537994, 0.6634538, -0.05105792, 0, 0.01176471, 1, 1,
0.3563057, 2.0962, 1.348101, 0, 0.003921569, 1, 1,
0.3577673, -0.2055187, 1.478044, 0.003921569, 0, 1, 1,
0.3611321, 0.1706918, 2.371662, 0.007843138, 0, 1, 1,
0.3657003, 0.5724386, 0.6861175, 0.01568628, 0, 1, 1,
0.3657773, 0.4225149, 0.7650311, 0.01960784, 0, 1, 1,
0.366876, 1.414743, -2.376322, 0.02745098, 0, 1, 1,
0.3705155, -0.5559681, 2.891174, 0.03137255, 0, 1, 1,
0.3705864, -0.7540219, 0.1219944, 0.03921569, 0, 1, 1,
0.3717526, -0.02535103, -0.4502681, 0.04313726, 0, 1, 1,
0.3798795, -0.1488876, 1.121323, 0.05098039, 0, 1, 1,
0.3828637, -1.874962, 4.250372, 0.05490196, 0, 1, 1,
0.3869894, -1.398043, 2.910327, 0.0627451, 0, 1, 1,
0.3908489, 0.5150428, 2.092868, 0.06666667, 0, 1, 1,
0.3910797, 0.2234777, 0.3118676, 0.07450981, 0, 1, 1,
0.3919453, 0.6168796, -1.676633, 0.07843138, 0, 1, 1,
0.3962366, 0.3241892, 1.193658, 0.08627451, 0, 1, 1,
0.4045648, -0.6416525, 1.451431, 0.09019608, 0, 1, 1,
0.4048058, -0.2549782, 1.447004, 0.09803922, 0, 1, 1,
0.404959, -0.07549746, 2.156881, 0.1058824, 0, 1, 1,
0.4051172, -0.482786, 2.562829, 0.1098039, 0, 1, 1,
0.4082753, -0.5638908, 2.697655, 0.1176471, 0, 1, 1,
0.415472, 0.1831664, 3.053562, 0.1215686, 0, 1, 1,
0.4198326, -0.9665604, 4.194361, 0.1294118, 0, 1, 1,
0.4262065, 0.562313, 0.5672824, 0.1333333, 0, 1, 1,
0.4264486, 0.8164993, 1.319682, 0.1411765, 0, 1, 1,
0.4296907, -0.6025826, 4.102931, 0.145098, 0, 1, 1,
0.4300481, 1.345336, 2.162203, 0.1529412, 0, 1, 1,
0.4327755, 1.143694, 0.362911, 0.1568628, 0, 1, 1,
0.4357359, 0.6910186, 0.7967707, 0.1647059, 0, 1, 1,
0.4408171, -2.026314, 3.561291, 0.1686275, 0, 1, 1,
0.4448109, 0.5957268, 1.961276, 0.1764706, 0, 1, 1,
0.4504432, -0.3931307, 0.6985278, 0.1803922, 0, 1, 1,
0.4531561, -0.2902088, 2.861436, 0.1882353, 0, 1, 1,
0.4542125, 0.3995794, 0.7940952, 0.1921569, 0, 1, 1,
0.4571958, 1.058593, 2.648764, 0.2, 0, 1, 1,
0.4643411, 1.448798, 0.4272287, 0.2078431, 0, 1, 1,
0.4653351, -0.2803762, 2.380798, 0.2117647, 0, 1, 1,
0.4725409, 0.9957765, 1.293761, 0.2196078, 0, 1, 1,
0.4790644, -1.398939, 0.9584896, 0.2235294, 0, 1, 1,
0.4794601, 0.1399506, 2.683668, 0.2313726, 0, 1, 1,
0.479659, 0.2735027, 1.658403, 0.2352941, 0, 1, 1,
0.4808924, -1.079099, 1.598887, 0.2431373, 0, 1, 1,
0.4837118, 0.2729923, 1.400636, 0.2470588, 0, 1, 1,
0.4844705, 1.503709, 0.4866331, 0.254902, 0, 1, 1,
0.4921305, -1.51028, 0.8416106, 0.2588235, 0, 1, 1,
0.4972731, 1.284327, -0.322338, 0.2666667, 0, 1, 1,
0.498227, -0.1639547, 2.191684, 0.2705882, 0, 1, 1,
0.5010881, 2.003974, -0.731521, 0.2784314, 0, 1, 1,
0.5019361, 1.274031, -0.01080479, 0.282353, 0, 1, 1,
0.5021209, -1.366768, 0.9146149, 0.2901961, 0, 1, 1,
0.5021434, -0.1408773, 3.294769, 0.2941177, 0, 1, 1,
0.5022111, -0.8277904, 5.765335, 0.3019608, 0, 1, 1,
0.5027155, 0.1422733, 1.002365, 0.3098039, 0, 1, 1,
0.5108638, 0.6062762, 0.7481585, 0.3137255, 0, 1, 1,
0.5140434, -1.432049, 3.463312, 0.3215686, 0, 1, 1,
0.5176398, 1.061913, -1.14337, 0.3254902, 0, 1, 1,
0.5183776, 0.6714905, -0.5896225, 0.3333333, 0, 1, 1,
0.5240494, -0.02684834, -0.5361128, 0.3372549, 0, 1, 1,
0.5281421, -1.435188, 1.903479, 0.345098, 0, 1, 1,
0.5308693, 0.9846927, 0.7584336, 0.3490196, 0, 1, 1,
0.5337171, -0.7281289, 2.744605, 0.3568628, 0, 1, 1,
0.540773, -0.4370783, 0.58751, 0.3607843, 0, 1, 1,
0.545361, -1.986002, 2.548175, 0.3686275, 0, 1, 1,
0.5464673, -0.9017556, 1.615143, 0.372549, 0, 1, 1,
0.5513331, -0.3260697, 2.237259, 0.3803922, 0, 1, 1,
0.552359, -2.827227, 1.915879, 0.3843137, 0, 1, 1,
0.5585988, 0.9020207, 1.889165, 0.3921569, 0, 1, 1,
0.5588095, -0.6314499, 2.950432, 0.3960784, 0, 1, 1,
0.5681887, -1.905736, 2.399352, 0.4039216, 0, 1, 1,
0.5716614, -0.2507987, 2.788522, 0.4117647, 0, 1, 1,
0.5717022, 1.196646, 0.2505063, 0.4156863, 0, 1, 1,
0.5725916, -0.7024341, 3.370695, 0.4235294, 0, 1, 1,
0.576286, 0.1617323, 1.572747, 0.427451, 0, 1, 1,
0.5766923, -0.08776363, 4.20239, 0.4352941, 0, 1, 1,
0.5767959, -0.3877231, 2.716946, 0.4392157, 0, 1, 1,
0.57926, 0.2178164, 2.542865, 0.4470588, 0, 1, 1,
0.5834993, -0.4274819, 1.189629, 0.4509804, 0, 1, 1,
0.5847043, -0.1476013, 2.951239, 0.4588235, 0, 1, 1,
0.5860083, 0.4556308, 2.127303, 0.4627451, 0, 1, 1,
0.5893927, -0.09825879, 2.527302, 0.4705882, 0, 1, 1,
0.5922999, 0.5923297, 1.114062, 0.4745098, 0, 1, 1,
0.5923038, -0.9650878, 4.454457, 0.4823529, 0, 1, 1,
0.5957443, 0.7811021, 1.633349, 0.4862745, 0, 1, 1,
0.5963401, -0.5012047, 2.012176, 0.4941176, 0, 1, 1,
0.5971032, 0.4185757, 0.8494831, 0.5019608, 0, 1, 1,
0.5984863, 1.523607, 0.999008, 0.5058824, 0, 1, 1,
0.5985688, -0.3220308, 1.062672, 0.5137255, 0, 1, 1,
0.5989705, 1.88678, 0.08550157, 0.5176471, 0, 1, 1,
0.6024937, 0.7511435, 0.8459794, 0.5254902, 0, 1, 1,
0.6058303, -2.015962, 3.712671, 0.5294118, 0, 1, 1,
0.6061503, 1.597847, 2.060849, 0.5372549, 0, 1, 1,
0.6093262, -0.5639254, 2.507806, 0.5411765, 0, 1, 1,
0.6099262, -0.1178946, 3.471349, 0.5490196, 0, 1, 1,
0.6182937, -0.5417605, 3.264782, 0.5529412, 0, 1, 1,
0.6197688, -1.91, 0.3047326, 0.5607843, 0, 1, 1,
0.6214566, -1.178488, 3.318668, 0.5647059, 0, 1, 1,
0.6250188, -0.7284237, 1.786754, 0.572549, 0, 1, 1,
0.6280626, -0.242501, 0.07988207, 0.5764706, 0, 1, 1,
0.6281356, 0.4548409, -0.8082325, 0.5843138, 0, 1, 1,
0.6293476, -0.9107047, 1.791493, 0.5882353, 0, 1, 1,
0.6295104, -1.213463, 3.945339, 0.5960785, 0, 1, 1,
0.6352884, -0.2706549, 2.583372, 0.6039216, 0, 1, 1,
0.636281, -2.393748, 2.315052, 0.6078432, 0, 1, 1,
0.6485623, -0.03002905, 1.838426, 0.6156863, 0, 1, 1,
0.6499786, -0.7024714, 2.412664, 0.6196079, 0, 1, 1,
0.6522675, 0.4380315, 1.406591, 0.627451, 0, 1, 1,
0.6531931, 0.8905334, 0.6004121, 0.6313726, 0, 1, 1,
0.6565372, 1.791801, -1.609067, 0.6392157, 0, 1, 1,
0.6590255, -0.4641112, 2.480777, 0.6431373, 0, 1, 1,
0.6595835, 1.438698, 1.420852, 0.6509804, 0, 1, 1,
0.6655267, 0.746694, 0.6595953, 0.654902, 0, 1, 1,
0.6918791, -0.4339803, 2.118671, 0.6627451, 0, 1, 1,
0.6952027, -0.5481626, 2.461385, 0.6666667, 0, 1, 1,
0.6955038, -0.01649592, 1.878346, 0.6745098, 0, 1, 1,
0.6965248, -0.9683247, 0.9036229, 0.6784314, 0, 1, 1,
0.7027882, 0.09719915, 1.417758, 0.6862745, 0, 1, 1,
0.7033352, -0.3056439, 0.1506542, 0.6901961, 0, 1, 1,
0.7084347, -0.2149942, 2.411516, 0.6980392, 0, 1, 1,
0.7119899, -0.6614065, 1.730865, 0.7058824, 0, 1, 1,
0.7145069, 0.131391, 1.423697, 0.7098039, 0, 1, 1,
0.7180628, -1.612022, 3.206224, 0.7176471, 0, 1, 1,
0.7188786, 0.7792176, 1.214497, 0.7215686, 0, 1, 1,
0.7196941, 0.6969768, 1.140977, 0.7294118, 0, 1, 1,
0.7270308, 0.8603602, 1.71255, 0.7333333, 0, 1, 1,
0.7281243, 1.781983, -1.022153, 0.7411765, 0, 1, 1,
0.7303889, 0.1345042, 2.429573, 0.7450981, 0, 1, 1,
0.7398148, -0.4366344, 1.029078, 0.7529412, 0, 1, 1,
0.742744, 0.6403707, -0.2192678, 0.7568628, 0, 1, 1,
0.75382, -0.6504345, 1.387117, 0.7647059, 0, 1, 1,
0.7578224, -0.5921858, 2.055442, 0.7686275, 0, 1, 1,
0.7611469, 0.9383273, 0.2889272, 0.7764706, 0, 1, 1,
0.7636164, 0.4012432, 0.479821, 0.7803922, 0, 1, 1,
0.7676004, -1.011941, 1.615582, 0.7882353, 0, 1, 1,
0.7789391, -0.1184884, 4.037552, 0.7921569, 0, 1, 1,
0.7865677, -1.284742, 3.821856, 0.8, 0, 1, 1,
0.7914053, -1.155106, 2.645462, 0.8078431, 0, 1, 1,
0.7915898, -1.251854, 3.136001, 0.8117647, 0, 1, 1,
0.795296, -0.9139175, 1.921774, 0.8196079, 0, 1, 1,
0.7996894, -0.9216202, 2.410631, 0.8235294, 0, 1, 1,
0.802816, 0.5152358, 0.1109156, 0.8313726, 0, 1, 1,
0.8036681, 2.104579, 0.05145966, 0.8352941, 0, 1, 1,
0.807578, 0.9994574, 0.7705179, 0.8431373, 0, 1, 1,
0.8138745, -1.635324, 3.066205, 0.8470588, 0, 1, 1,
0.8191579, 0.4085662, 2.864887, 0.854902, 0, 1, 1,
0.8198546, -0.2414019, 0.7806307, 0.8588235, 0, 1, 1,
0.8221627, -2.216446, 2.187708, 0.8666667, 0, 1, 1,
0.8226175, 1.617806, 0.4243945, 0.8705882, 0, 1, 1,
0.823876, -0.2128758, 1.355892, 0.8784314, 0, 1, 1,
0.8325577, -0.827317, 3.722235, 0.8823529, 0, 1, 1,
0.8327515, 0.7725464, 1.167516, 0.8901961, 0, 1, 1,
0.8332596, 0.4608195, 1.494006, 0.8941177, 0, 1, 1,
0.8346159, 1.216012, -0.487556, 0.9019608, 0, 1, 1,
0.8361169, -1.195839, 2.508865, 0.9098039, 0, 1, 1,
0.8371819, 1.956757, 0.4286524, 0.9137255, 0, 1, 1,
0.8398383, 0.9542886, 1.244735, 0.9215686, 0, 1, 1,
0.8420899, 0.445881, 1.560245, 0.9254902, 0, 1, 1,
0.8454776, 0.1745434, 1.429546, 0.9333333, 0, 1, 1,
0.8527354, 0.6502268, 1.323673, 0.9372549, 0, 1, 1,
0.8553859, 1.204083, 3.05758, 0.945098, 0, 1, 1,
0.857311, -0.4548154, 0.9049301, 0.9490196, 0, 1, 1,
0.8586141, 0.6989259, -0.3070523, 0.9568627, 0, 1, 1,
0.8602247, 0.4109503, -1.071993, 0.9607843, 0, 1, 1,
0.8608933, -0.3856987, 4.422095, 0.9686275, 0, 1, 1,
0.8629176, -1.103897, 2.713933, 0.972549, 0, 1, 1,
0.8659949, -0.5817821, 1.234535, 0.9803922, 0, 1, 1,
0.8689486, 1.152967, 1.855425, 0.9843137, 0, 1, 1,
0.8826834, -0.6940041, 2.8545, 0.9921569, 0, 1, 1,
0.8839637, 0.597612, 2.13164, 0.9960784, 0, 1, 1,
0.8906574, -0.02712411, 2.741502, 1, 0, 0.9960784, 1,
0.9010801, -1.091219, 4.812011, 1, 0, 0.9882353, 1,
0.9033123, 0.6966251, 0.9470078, 1, 0, 0.9843137, 1,
0.9067091, -0.2139867, 3.501094, 1, 0, 0.9764706, 1,
0.9070517, -0.03907746, 2.025015, 1, 0, 0.972549, 1,
0.9098228, -1.915246, 1.143514, 1, 0, 0.9647059, 1,
0.9108596, -0.2400855, 2.38674, 1, 0, 0.9607843, 1,
0.914901, 0.05040019, 2.374054, 1, 0, 0.9529412, 1,
0.9176849, -0.8568542, 3.033046, 1, 0, 0.9490196, 1,
0.9207479, 2.031326, 1.567066, 1, 0, 0.9411765, 1,
0.9261398, 1.367722, -0.1366506, 1, 0, 0.9372549, 1,
0.9326937, -0.9131239, 2.594257, 1, 0, 0.9294118, 1,
0.9349765, -0.8229557, 0.5968201, 1, 0, 0.9254902, 1,
0.9363649, 0.5302741, 0.4928516, 1, 0, 0.9176471, 1,
0.940159, -1.21561, 3.250849, 1, 0, 0.9137255, 1,
0.9462631, 0.1720017, -0.3893605, 1, 0, 0.9058824, 1,
0.9482133, 1.083668, 1.689025, 1, 0, 0.9019608, 1,
0.9592514, 0.8757857, 0.8453854, 1, 0, 0.8941177, 1,
0.9680163, -0.8744851, 3.559995, 1, 0, 0.8862745, 1,
0.9704448, 0.1456527, 0.8142406, 1, 0, 0.8823529, 1,
0.972807, -0.0274622, 1.955454, 1, 0, 0.8745098, 1,
0.9744851, 0.440555, 2.611258, 1, 0, 0.8705882, 1,
0.98224, 0.9542368, -0.7994233, 1, 0, 0.8627451, 1,
0.9834441, -0.727181, 1.877718, 1, 0, 0.8588235, 1,
0.9966705, -0.06156934, 0.7803291, 1, 0, 0.8509804, 1,
1.008445, -0.7667369, 2.75363, 1, 0, 0.8470588, 1,
1.012706, -0.7342464, -0.3740517, 1, 0, 0.8392157, 1,
1.016141, -1.4972, 3.027876, 1, 0, 0.8352941, 1,
1.028084, -0.01646262, 3.076146, 1, 0, 0.827451, 1,
1.032257, 1.461131, -0.3066922, 1, 0, 0.8235294, 1,
1.050658, 0.3911601, -0.299191, 1, 0, 0.8156863, 1,
1.051558, -1.106408, 0.698167, 1, 0, 0.8117647, 1,
1.05349, -1.84136, 3.153085, 1, 0, 0.8039216, 1,
1.065571, -0.03412125, 0.8560815, 1, 0, 0.7960784, 1,
1.068132, -0.1139928, 1.344138, 1, 0, 0.7921569, 1,
1.070953, 1.803206, 0.2982848, 1, 0, 0.7843137, 1,
1.073737, 0.2366315, 1.907444, 1, 0, 0.7803922, 1,
1.07424, 0.3133988, 0.376038, 1, 0, 0.772549, 1,
1.081654, -0.2508156, 3.154309, 1, 0, 0.7686275, 1,
1.086779, 0.8464834, 1.97745, 1, 0, 0.7607843, 1,
1.087499, 0.5311075, 1.764964, 1, 0, 0.7568628, 1,
1.090984, -0.6356182, 2.944998, 1, 0, 0.7490196, 1,
1.097509, 2.68032, 1.003346, 1, 0, 0.7450981, 1,
1.107694, 0.5965068, -0.9608319, 1, 0, 0.7372549, 1,
1.111572, 0.2194257, 0.8864447, 1, 0, 0.7333333, 1,
1.129041, 0.08236967, 0.1664409, 1, 0, 0.7254902, 1,
1.140041, 1.035435, 0.5631547, 1, 0, 0.7215686, 1,
1.14474, -1.311445, 1.783647, 1, 0, 0.7137255, 1,
1.148788, -0.4038804, 2.823958, 1, 0, 0.7098039, 1,
1.148819, 0.6640633, 1.058022, 1, 0, 0.7019608, 1,
1.149498, 1.328596, 0.04043527, 1, 0, 0.6941177, 1,
1.149776, 0.04075636, 2.146763, 1, 0, 0.6901961, 1,
1.154121, 1.101916, 0.5095446, 1, 0, 0.682353, 1,
1.156517, 0.5457381, -0.3431459, 1, 0, 0.6784314, 1,
1.158186, -1.708075, 4.125797, 1, 0, 0.6705883, 1,
1.164508, 0.2384122, 0.1243292, 1, 0, 0.6666667, 1,
1.171973, -1.11477, 3.9041, 1, 0, 0.6588235, 1,
1.176516, -0.6075935, 1.08484, 1, 0, 0.654902, 1,
1.182999, -0.8797828, 1.517159, 1, 0, 0.6470588, 1,
1.183799, -0.5858122, 3.258005, 1, 0, 0.6431373, 1,
1.187352, 0.1511809, 0.9718106, 1, 0, 0.6352941, 1,
1.189468, -1.710946, 2.529807, 1, 0, 0.6313726, 1,
1.193293, 1.246023, -0.0928247, 1, 0, 0.6235294, 1,
1.193669, -0.9981108, -0.5172364, 1, 0, 0.6196079, 1,
1.203591, 1.009429, 0.6318774, 1, 0, 0.6117647, 1,
1.20803, -0.8866089, 3.844324, 1, 0, 0.6078432, 1,
1.213118, 1.406739, -0.2611482, 1, 0, 0.6, 1,
1.214907, 1.315968, 1.336316, 1, 0, 0.5921569, 1,
1.22804, -0.9222427, 3.411267, 1, 0, 0.5882353, 1,
1.234763, -0.5196918, 1.624307, 1, 0, 0.5803922, 1,
1.239616, -2.339862, 1.807717, 1, 0, 0.5764706, 1,
1.244676, -2.005301, 1.925168, 1, 0, 0.5686275, 1,
1.2574, -1.24678, 2.482328, 1, 0, 0.5647059, 1,
1.262972, -0.5456253, 3.43169, 1, 0, 0.5568628, 1,
1.263954, 1.792125, 2.129813, 1, 0, 0.5529412, 1,
1.266529, 0.6432552, 2.730442, 1, 0, 0.5450981, 1,
1.272031, -1.299479, 0.8817716, 1, 0, 0.5411765, 1,
1.274272, 1.49134, -0.2140308, 1, 0, 0.5333334, 1,
1.279651, 1.549776, 1.137002, 1, 0, 0.5294118, 1,
1.280012, -1.991638, 1.435958, 1, 0, 0.5215687, 1,
1.28784, 0.2524348, 2.066003, 1, 0, 0.5176471, 1,
1.30224, 2.060659, 1.639134, 1, 0, 0.509804, 1,
1.305375, 0.4935782, 3.049935, 1, 0, 0.5058824, 1,
1.319404, -0.2297642, 2.616575, 1, 0, 0.4980392, 1,
1.337417, -0.5778179, 2.501687, 1, 0, 0.4901961, 1,
1.349499, 0.3287934, -0.2570499, 1, 0, 0.4862745, 1,
1.353724, -0.9775722, 3.748718, 1, 0, 0.4784314, 1,
1.361791, 0.04412761, 1.181726, 1, 0, 0.4745098, 1,
1.363495, -1.17483, 3.818832, 1, 0, 0.4666667, 1,
1.381118, -0.3547942, 1.643626, 1, 0, 0.4627451, 1,
1.386139, 0.3935612, 0.3981077, 1, 0, 0.454902, 1,
1.389756, -0.9192174, 2.082234, 1, 0, 0.4509804, 1,
1.394935, 1.222773, 0.9375317, 1, 0, 0.4431373, 1,
1.399899, -0.5175832, 2.01551, 1, 0, 0.4392157, 1,
1.401367, -1.81592, 5.586515, 1, 0, 0.4313726, 1,
1.405651, -0.4498184, 2.252069, 1, 0, 0.427451, 1,
1.413883, 1.364649, 1.200686, 1, 0, 0.4196078, 1,
1.416297, 0.5403146, 0.7987732, 1, 0, 0.4156863, 1,
1.422935, 0.5066298, -1.227826, 1, 0, 0.4078431, 1,
1.4239, 0.2657643, 1.756385, 1, 0, 0.4039216, 1,
1.433876, -0.5315994, 2.343086, 1, 0, 0.3960784, 1,
1.435863, -0.07897346, 0.8457437, 1, 0, 0.3882353, 1,
1.440658, -0.6171268, 1.380217, 1, 0, 0.3843137, 1,
1.470593, 1.514764, 0.124912, 1, 0, 0.3764706, 1,
1.474194, 0.9385204, 0.4352144, 1, 0, 0.372549, 1,
1.486997, 0.1382494, 0.7953368, 1, 0, 0.3647059, 1,
1.490122, -0.5267448, 0.1587489, 1, 0, 0.3607843, 1,
1.491796, -1.115348, 2.879224, 1, 0, 0.3529412, 1,
1.502643, -0.1166648, 1.945884, 1, 0, 0.3490196, 1,
1.514024, 0.01495957, 1.156497, 1, 0, 0.3411765, 1,
1.514367, 0.1931436, 1.541009, 1, 0, 0.3372549, 1,
1.523828, -0.1960279, 1.862753, 1, 0, 0.3294118, 1,
1.528975, -0.1833734, 1.498362, 1, 0, 0.3254902, 1,
1.529359, 0.3438097, 2.386736, 1, 0, 0.3176471, 1,
1.534879, -1.200288, 1.8445, 1, 0, 0.3137255, 1,
1.538702, -0.6396334, 1.137, 1, 0, 0.3058824, 1,
1.552717, -0.02054434, 0.9638103, 1, 0, 0.2980392, 1,
1.555983, -0.1297235, 2.705837, 1, 0, 0.2941177, 1,
1.590632, 0.6615065, 2.044102, 1, 0, 0.2862745, 1,
1.594744, 0.935145, 1.694476, 1, 0, 0.282353, 1,
1.602299, -1.337022, 1.878466, 1, 0, 0.2745098, 1,
1.60948, -1.946827, 2.280475, 1, 0, 0.2705882, 1,
1.610559, 2.189621, 0.1220109, 1, 0, 0.2627451, 1,
1.617922, -0.6466339, 2.514864, 1, 0, 0.2588235, 1,
1.633857, 0.0007946597, 0.3879718, 1, 0, 0.2509804, 1,
1.638805, 1.594349, 1.990392, 1, 0, 0.2470588, 1,
1.646438, -0.8257062, 3.573122, 1, 0, 0.2392157, 1,
1.649989, -0.8726197, 3.605231, 1, 0, 0.2352941, 1,
1.654016, 0.1353393, -0.8739058, 1, 0, 0.227451, 1,
1.654681, 0.0761352, 3.195708, 1, 0, 0.2235294, 1,
1.660045, -0.8376122, 2.60582, 1, 0, 0.2156863, 1,
1.67037, 0.437969, 1.640754, 1, 0, 0.2117647, 1,
1.678771, 0.6830003, 1.884468, 1, 0, 0.2039216, 1,
1.703678, -0.2236844, 2.531673, 1, 0, 0.1960784, 1,
1.78446, 1.83338, 0.5287926, 1, 0, 0.1921569, 1,
1.791227, -0.5194094, 2.854329, 1, 0, 0.1843137, 1,
1.793643, -0.9568703, 1.068175, 1, 0, 0.1803922, 1,
1.835849, -1.055979, 3.125117, 1, 0, 0.172549, 1,
1.873698, 1.25042, 2.023962, 1, 0, 0.1686275, 1,
1.878868, 0.4247777, -0.166513, 1, 0, 0.1607843, 1,
1.886228, 1.68197, 0.1509685, 1, 0, 0.1568628, 1,
1.893633, 2.095785, -0.7028731, 1, 0, 0.1490196, 1,
1.89588, 0.2998069, 0.437365, 1, 0, 0.145098, 1,
1.959993, 0.2461445, 2.436831, 1, 0, 0.1372549, 1,
1.968606, 0.7274742, 1.543984, 1, 0, 0.1333333, 1,
2.013687, -1.078719, 2.694321, 1, 0, 0.1254902, 1,
2.021579, 0.6131487, 1.840072, 1, 0, 0.1215686, 1,
2.056252, 1.583411, 1.453557, 1, 0, 0.1137255, 1,
2.073212, 0.4965595, 1.458544, 1, 0, 0.1098039, 1,
2.082638, 0.8738517, 0.794682, 1, 0, 0.1019608, 1,
2.083861, -0.8500844, 0.1453558, 1, 0, 0.09411765, 1,
2.095167, -1.404086, 2.241867, 1, 0, 0.09019608, 1,
2.190696, -1.503714, 2.644583, 1, 0, 0.08235294, 1,
2.192774, 0.5167957, 0.01636375, 1, 0, 0.07843138, 1,
2.194169, 0.166108, 0.4372615, 1, 0, 0.07058824, 1,
2.298288, -1.464277, 2.308717, 1, 0, 0.06666667, 1,
2.306702, -0.3912451, -0.01130425, 1, 0, 0.05882353, 1,
2.332283, 0.3222689, 1.190544, 1, 0, 0.05490196, 1,
2.434314, -0.3627501, 2.2082, 1, 0, 0.04705882, 1,
2.437497, 1.096002, -0.4585291, 1, 0, 0.04313726, 1,
2.470199, 1.248555, 1.590412, 1, 0, 0.03529412, 1,
2.535732, -1.479425, 2.459903, 1, 0, 0.03137255, 1,
2.644989, -0.6014921, 2.335463, 1, 0, 0.02352941, 1,
2.717554, -0.211327, 1.512122, 1, 0, 0.01960784, 1,
2.896561, -0.9160278, 4.160455, 1, 0, 0.01176471, 1,
3.926968, 0.163644, 2.903824, 1, 0, 0.007843138, 1
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
0.4463102, -4.629755, -7.223608, 0, -0.5, 0.5, 0.5,
0.4463102, -4.629755, -7.223608, 1, -0.5, 0.5, 0.5,
0.4463102, -4.629755, -7.223608, 1, 1.5, 0.5, 0.5,
0.4463102, -4.629755, -7.223608, 0, 1.5, 0.5, 0.5
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
-4.214291, -0.0004780293, -7.223608, 0, -0.5, 0.5, 0.5,
-4.214291, -0.0004780293, -7.223608, 1, -0.5, 0.5, 0.5,
-4.214291, -0.0004780293, -7.223608, 1, 1.5, 0.5, 0.5,
-4.214291, -0.0004780293, -7.223608, 0, 1.5, 0.5, 0.5
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
-4.214291, -4.629755, 0.2121313, 0, -0.5, 0.5, 0.5,
-4.214291, -4.629755, 0.2121313, 1, -0.5, 0.5, 0.5,
-4.214291, -4.629755, 0.2121313, 1, 1.5, 0.5, 0.5,
-4.214291, -4.629755, 0.2121313, 0, 1.5, 0.5, 0.5
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
-3, -3.56146, -5.507668,
3, -3.56146, -5.507668,
-3, -3.56146, -5.507668,
-3, -3.739509, -5.793659,
-2, -3.56146, -5.507668,
-2, -3.739509, -5.793659,
-1, -3.56146, -5.507668,
-1, -3.739509, -5.793659,
0, -3.56146, -5.507668,
0, -3.739509, -5.793659,
1, -3.56146, -5.507668,
1, -3.739509, -5.793659,
2, -3.56146, -5.507668,
2, -3.739509, -5.793659,
3, -3.56146, -5.507668,
3, -3.739509, -5.793659
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
-3, -4.095607, -6.365639, 0, -0.5, 0.5, 0.5,
-3, -4.095607, -6.365639, 1, -0.5, 0.5, 0.5,
-3, -4.095607, -6.365639, 1, 1.5, 0.5, 0.5,
-3, -4.095607, -6.365639, 0, 1.5, 0.5, 0.5,
-2, -4.095607, -6.365639, 0, -0.5, 0.5, 0.5,
-2, -4.095607, -6.365639, 1, -0.5, 0.5, 0.5,
-2, -4.095607, -6.365639, 1, 1.5, 0.5, 0.5,
-2, -4.095607, -6.365639, 0, 1.5, 0.5, 0.5,
-1, -4.095607, -6.365639, 0, -0.5, 0.5, 0.5,
-1, -4.095607, -6.365639, 1, -0.5, 0.5, 0.5,
-1, -4.095607, -6.365639, 1, 1.5, 0.5, 0.5,
-1, -4.095607, -6.365639, 0, 1.5, 0.5, 0.5,
0, -4.095607, -6.365639, 0, -0.5, 0.5, 0.5,
0, -4.095607, -6.365639, 1, -0.5, 0.5, 0.5,
0, -4.095607, -6.365639, 1, 1.5, 0.5, 0.5,
0, -4.095607, -6.365639, 0, 1.5, 0.5, 0.5,
1, -4.095607, -6.365639, 0, -0.5, 0.5, 0.5,
1, -4.095607, -6.365639, 1, -0.5, 0.5, 0.5,
1, -4.095607, -6.365639, 1, 1.5, 0.5, 0.5,
1, -4.095607, -6.365639, 0, 1.5, 0.5, 0.5,
2, -4.095607, -6.365639, 0, -0.5, 0.5, 0.5,
2, -4.095607, -6.365639, 1, -0.5, 0.5, 0.5,
2, -4.095607, -6.365639, 1, 1.5, 0.5, 0.5,
2, -4.095607, -6.365639, 0, 1.5, 0.5, 0.5,
3, -4.095607, -6.365639, 0, -0.5, 0.5, 0.5,
3, -4.095607, -6.365639, 1, -0.5, 0.5, 0.5,
3, -4.095607, -6.365639, 1, 1.5, 0.5, 0.5,
3, -4.095607, -6.365639, 0, 1.5, 0.5, 0.5
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
-3.138768, -3, -5.507668,
-3.138768, 3, -5.507668,
-3.138768, -3, -5.507668,
-3.318022, -3, -5.793659,
-3.138768, -2, -5.507668,
-3.318022, -2, -5.793659,
-3.138768, -1, -5.507668,
-3.318022, -1, -5.793659,
-3.138768, 0, -5.507668,
-3.318022, 0, -5.793659,
-3.138768, 1, -5.507668,
-3.318022, 1, -5.793659,
-3.138768, 2, -5.507668,
-3.318022, 2, -5.793659,
-3.138768, 3, -5.507668,
-3.318022, 3, -5.793659
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
-3.676529, -3, -6.365639, 0, -0.5, 0.5, 0.5,
-3.676529, -3, -6.365639, 1, -0.5, 0.5, 0.5,
-3.676529, -3, -6.365639, 1, 1.5, 0.5, 0.5,
-3.676529, -3, -6.365639, 0, 1.5, 0.5, 0.5,
-3.676529, -2, -6.365639, 0, -0.5, 0.5, 0.5,
-3.676529, -2, -6.365639, 1, -0.5, 0.5, 0.5,
-3.676529, -2, -6.365639, 1, 1.5, 0.5, 0.5,
-3.676529, -2, -6.365639, 0, 1.5, 0.5, 0.5,
-3.676529, -1, -6.365639, 0, -0.5, 0.5, 0.5,
-3.676529, -1, -6.365639, 1, -0.5, 0.5, 0.5,
-3.676529, -1, -6.365639, 1, 1.5, 0.5, 0.5,
-3.676529, -1, -6.365639, 0, 1.5, 0.5, 0.5,
-3.676529, 0, -6.365639, 0, -0.5, 0.5, 0.5,
-3.676529, 0, -6.365639, 1, -0.5, 0.5, 0.5,
-3.676529, 0, -6.365639, 1, 1.5, 0.5, 0.5,
-3.676529, 0, -6.365639, 0, 1.5, 0.5, 0.5,
-3.676529, 1, -6.365639, 0, -0.5, 0.5, 0.5,
-3.676529, 1, -6.365639, 1, -0.5, 0.5, 0.5,
-3.676529, 1, -6.365639, 1, 1.5, 0.5, 0.5,
-3.676529, 1, -6.365639, 0, 1.5, 0.5, 0.5,
-3.676529, 2, -6.365639, 0, -0.5, 0.5, 0.5,
-3.676529, 2, -6.365639, 1, -0.5, 0.5, 0.5,
-3.676529, 2, -6.365639, 1, 1.5, 0.5, 0.5,
-3.676529, 2, -6.365639, 0, 1.5, 0.5, 0.5,
-3.676529, 3, -6.365639, 0, -0.5, 0.5, 0.5,
-3.676529, 3, -6.365639, 1, -0.5, 0.5, 0.5,
-3.676529, 3, -6.365639, 1, 1.5, 0.5, 0.5,
-3.676529, 3, -6.365639, 0, 1.5, 0.5, 0.5
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
-3.138768, -3.56146, -4,
-3.138768, -3.56146, 4,
-3.138768, -3.56146, -4,
-3.318022, -3.739509, -4,
-3.138768, -3.56146, -2,
-3.318022, -3.739509, -2,
-3.138768, -3.56146, 0,
-3.318022, -3.739509, 0,
-3.138768, -3.56146, 2,
-3.318022, -3.739509, 2,
-3.138768, -3.56146, 4,
-3.318022, -3.739509, 4
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
-3.676529, -4.095607, -4, 0, -0.5, 0.5, 0.5,
-3.676529, -4.095607, -4, 1, -0.5, 0.5, 0.5,
-3.676529, -4.095607, -4, 1, 1.5, 0.5, 0.5,
-3.676529, -4.095607, -4, 0, 1.5, 0.5, 0.5,
-3.676529, -4.095607, -2, 0, -0.5, 0.5, 0.5,
-3.676529, -4.095607, -2, 1, -0.5, 0.5, 0.5,
-3.676529, -4.095607, -2, 1, 1.5, 0.5, 0.5,
-3.676529, -4.095607, -2, 0, 1.5, 0.5, 0.5,
-3.676529, -4.095607, 0, 0, -0.5, 0.5, 0.5,
-3.676529, -4.095607, 0, 1, -0.5, 0.5, 0.5,
-3.676529, -4.095607, 0, 1, 1.5, 0.5, 0.5,
-3.676529, -4.095607, 0, 0, 1.5, 0.5, 0.5,
-3.676529, -4.095607, 2, 0, -0.5, 0.5, 0.5,
-3.676529, -4.095607, 2, 1, -0.5, 0.5, 0.5,
-3.676529, -4.095607, 2, 1, 1.5, 0.5, 0.5,
-3.676529, -4.095607, 2, 0, 1.5, 0.5, 0.5,
-3.676529, -4.095607, 4, 0, -0.5, 0.5, 0.5,
-3.676529, -4.095607, 4, 1, -0.5, 0.5, 0.5,
-3.676529, -4.095607, 4, 1, 1.5, 0.5, 0.5,
-3.676529, -4.095607, 4, 0, 1.5, 0.5, 0.5
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
-3.138768, -3.56146, -5.507668,
-3.138768, 3.560504, -5.507668,
-3.138768, -3.56146, 5.931931,
-3.138768, 3.560504, 5.931931,
-3.138768, -3.56146, -5.507668,
-3.138768, -3.56146, 5.931931,
-3.138768, 3.560504, -5.507668,
-3.138768, 3.560504, 5.931931,
-3.138768, -3.56146, -5.507668,
4.031388, -3.56146, -5.507668,
-3.138768, -3.56146, 5.931931,
4.031388, -3.56146, 5.931931,
-3.138768, 3.560504, -5.507668,
4.031388, 3.560504, -5.507668,
-3.138768, 3.560504, 5.931931,
4.031388, 3.560504, 5.931931,
4.031388, -3.56146, -5.507668,
4.031388, 3.560504, -5.507668,
4.031388, -3.56146, 5.931931,
4.031388, 3.560504, 5.931931,
4.031388, -3.56146, -5.507668,
4.031388, -3.56146, 5.931931,
4.031388, 3.560504, -5.507668,
4.031388, 3.560504, 5.931931
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
var radius = 8.150824;
var distance = 36.26394;
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
mvMatrix.translate( -0.4463102, 0.0004780293, -0.2121313 );
mvMatrix.scale( 1.229099, 1.237416, 0.7703792 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.26394);
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
fenvalerate<-read.table("fenvalerate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fenvalerate$V2
```

```
## Error in eval(expr, envir, enclos): object 'fenvalerate' not found
```

```r
y<-fenvalerate$V3
```

```
## Error in eval(expr, envir, enclos): object 'fenvalerate' not found
```

```r
z<-fenvalerate$V4
```

```
## Error in eval(expr, envir, enclos): object 'fenvalerate' not found
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
-3.034348, -1.138508, -2.510649, 0, 0, 1, 1, 1,
-2.903171, -0.3712688, -1.037009, 1, 0, 0, 1, 1,
-2.632832, -0.4809593, -1.630086, 1, 0, 0, 1, 1,
-2.559063, -0.6561425, -1.798, 1, 0, 0, 1, 1,
-2.54162, 0.1430948, -2.960264, 1, 0, 0, 1, 1,
-2.494978, 0.3907934, -0.65517, 1, 0, 0, 1, 1,
-2.402253, 0.9136872, -1.612418, 0, 0, 0, 1, 1,
-2.319086, -0.8860808, -2.0966, 0, 0, 0, 1, 1,
-2.312417, 0.910832, -2.022732, 0, 0, 0, 1, 1,
-2.282365, 1.011823, -1.055144, 0, 0, 0, 1, 1,
-2.227764, -0.9163248, -2.650588, 0, 0, 0, 1, 1,
-2.186404, 0.03758864, -1.595722, 0, 0, 0, 1, 1,
-2.17747, -0.08788951, -0.7565774, 0, 0, 0, 1, 1,
-2.142863, -1.215167, -0.9892242, 1, 1, 1, 1, 1,
-2.142071, 0.156983, -1.540094, 1, 1, 1, 1, 1,
-2.134071, 0.6250674, -0.8011972, 1, 1, 1, 1, 1,
-2.112989, -1.538033, -2.123863, 1, 1, 1, 1, 1,
-2.088701, 0.3892507, 0.03782633, 1, 1, 1, 1, 1,
-2.061367, 1.229207, 0.6284063, 1, 1, 1, 1, 1,
-2.061313, 0.1401593, -0.7836522, 1, 1, 1, 1, 1,
-2.05515, 1.324857, -1.653592, 1, 1, 1, 1, 1,
-2.03645, 0.7102056, -2.063739, 1, 1, 1, 1, 1,
-2.024322, 0.1151984, -0.7720326, 1, 1, 1, 1, 1,
-1.987681, -0.7279469, -2.540585, 1, 1, 1, 1, 1,
-1.982492, -0.1877585, 0.2924997, 1, 1, 1, 1, 1,
-1.97473, 0.4693664, -0.1508234, 1, 1, 1, 1, 1,
-1.931877, 2.45294, -0.5182735, 1, 1, 1, 1, 1,
-1.929118, 1.150134, 0.05631682, 1, 1, 1, 1, 1,
-1.910806, 1.459588, -0.5925461, 0, 0, 1, 1, 1,
-1.908766, -0.0864367, -0.6232061, 1, 0, 0, 1, 1,
-1.907134, -1.781896, -1.89972, 1, 0, 0, 1, 1,
-1.902748, 2.088389, -1.536041, 1, 0, 0, 1, 1,
-1.887223, -0.3472749, -3.173061, 1, 0, 0, 1, 1,
-1.887151, 0.6780493, -0.3241625, 1, 0, 0, 1, 1,
-1.881088, -0.3750283, -1.333187, 0, 0, 0, 1, 1,
-1.862687, 0.4306931, -1.226947, 0, 0, 0, 1, 1,
-1.837878, 0.03260828, -2.476731, 0, 0, 0, 1, 1,
-1.818197, 1.237442, 0.4331327, 0, 0, 0, 1, 1,
-1.805474, -0.5023766, 0.5179695, 0, 0, 0, 1, 1,
-1.789916, -0.5513392, -3.032119, 0, 0, 0, 1, 1,
-1.762888, 0.06696217, -1.246722, 0, 0, 0, 1, 1,
-1.728105, -0.259968, -0.7505094, 1, 1, 1, 1, 1,
-1.725178, -0.07264673, -0.7415111, 1, 1, 1, 1, 1,
-1.721497, 0.492143, -1.190051, 1, 1, 1, 1, 1,
-1.719598, 0.9778604, -2.997534, 1, 1, 1, 1, 1,
-1.715324, 1.784185, 0.6353402, 1, 1, 1, 1, 1,
-1.713691, 0.6442844, -2.20186, 1, 1, 1, 1, 1,
-1.707708, 1.479428, -2.999676, 1, 1, 1, 1, 1,
-1.707509, 0.3965247, -2.086148, 1, 1, 1, 1, 1,
-1.699083, -0.3576467, 0.01604392, 1, 1, 1, 1, 1,
-1.688771, 0.2158843, -0.6213233, 1, 1, 1, 1, 1,
-1.672478, 0.8996506, -0.8863167, 1, 1, 1, 1, 1,
-1.656451, 1.534498, 1.852647, 1, 1, 1, 1, 1,
-1.650199, -1.68322, -1.784311, 1, 1, 1, 1, 1,
-1.644041, -0.4471166, -1.8483, 1, 1, 1, 1, 1,
-1.639941, -0.3583667, -3.424526, 1, 1, 1, 1, 1,
-1.637183, -0.6529532, -1.107614, 0, 0, 1, 1, 1,
-1.633852, -0.3302827, 1.229037, 1, 0, 0, 1, 1,
-1.627228, -0.7333646, -0.9850416, 1, 0, 0, 1, 1,
-1.613028, -0.627755, -4.342941, 1, 0, 0, 1, 1,
-1.598907, 0.004475744, -1.342964, 1, 0, 0, 1, 1,
-1.583093, 1.510597, -0.9574171, 1, 0, 0, 1, 1,
-1.579487, -0.2836887, -3.479344, 0, 0, 0, 1, 1,
-1.574865, 1.112149, -1.117442, 0, 0, 0, 1, 1,
-1.566686, -2.218621, -3.442849, 0, 0, 0, 1, 1,
-1.557982, -0.3075668, -0.5583338, 0, 0, 0, 1, 1,
-1.523347, 0.86436, -0.335937, 0, 0, 0, 1, 1,
-1.522408, -1.274732, -0.9191395, 0, 0, 0, 1, 1,
-1.505033, -0.380343, -2.440187, 0, 0, 0, 1, 1,
-1.50174, 0.4638251, -2.730758, 1, 1, 1, 1, 1,
-1.476505, -0.02030513, -3.449969, 1, 1, 1, 1, 1,
-1.475654, -1.583158, -2.998356, 1, 1, 1, 1, 1,
-1.473336, -0.1878483, -0.5346505, 1, 1, 1, 1, 1,
-1.46446, -1.625986, -2.89126, 1, 1, 1, 1, 1,
-1.456116, -1.239278, -0.03823972, 1, 1, 1, 1, 1,
-1.446492, -0.2052787, -1.296813, 1, 1, 1, 1, 1,
-1.445044, -0.4534038, -1.649166, 1, 1, 1, 1, 1,
-1.444856, 0.3086811, -1.248763, 1, 1, 1, 1, 1,
-1.439318, 0.9078979, 0.2511247, 1, 1, 1, 1, 1,
-1.432768, -0.9650476, -1.020634, 1, 1, 1, 1, 1,
-1.432483, 1.660946, -0.5747108, 1, 1, 1, 1, 1,
-1.431536, 0.7495894, -0.04293209, 1, 1, 1, 1, 1,
-1.431367, -0.558769, -2.796386, 1, 1, 1, 1, 1,
-1.42874, -0.211253, -1.358385, 1, 1, 1, 1, 1,
-1.420365, -0.06852999, -1.433803, 0, 0, 1, 1, 1,
-1.414505, 0.3799678, -1.323135, 1, 0, 0, 1, 1,
-1.41255, 1.338823, 0.3890702, 1, 0, 0, 1, 1,
-1.400561, 0.5605329, 0.1320751, 1, 0, 0, 1, 1,
-1.390434, 0.3667869, -0.3613349, 1, 0, 0, 1, 1,
-1.381376, 0.6995096, 0.3441644, 1, 0, 0, 1, 1,
-1.380112, 1.27874, -0.7665276, 0, 0, 0, 1, 1,
-1.380081, -0.3921776, -1.181238, 0, 0, 0, 1, 1,
-1.379145, -0.3874643, -3.193991, 0, 0, 0, 1, 1,
-1.377041, 1.054436, -1.645119, 0, 0, 0, 1, 1,
-1.376473, 0.7046378, 0.3211551, 0, 0, 0, 1, 1,
-1.374406, -0.5589927, -2.604998, 0, 0, 0, 1, 1,
-1.368356, -0.1385764, -2.668968, 0, 0, 0, 1, 1,
-1.365272, -0.2368982, -2.341267, 1, 1, 1, 1, 1,
-1.360992, -1.972629, -2.098613, 1, 1, 1, 1, 1,
-1.354124, 0.983047, 0.3594972, 1, 1, 1, 1, 1,
-1.352043, -1.372169, -1.197039, 1, 1, 1, 1, 1,
-1.343402, -0.5395012, -1.939509, 1, 1, 1, 1, 1,
-1.342883, -0.9850563, -2.03119, 1, 1, 1, 1, 1,
-1.340868, -0.2799027, -2.144825, 1, 1, 1, 1, 1,
-1.329459, -1.422566, -3.208695, 1, 1, 1, 1, 1,
-1.320168, -0.4702935, -2.167859, 1, 1, 1, 1, 1,
-1.312142, -1.606463, -1.098416, 1, 1, 1, 1, 1,
-1.309998, 1.431635, -1.322621, 1, 1, 1, 1, 1,
-1.308874, 0.1019191, -2.559896, 1, 1, 1, 1, 1,
-1.30818, 0.3425363, -1.902219, 1, 1, 1, 1, 1,
-1.303643, 0.4186576, -0.1781675, 1, 1, 1, 1, 1,
-1.302508, -1.58956, -2.610924, 1, 1, 1, 1, 1,
-1.297207, -0.4358308, -1.712511, 0, 0, 1, 1, 1,
-1.292579, -0.1085497, -2.374123, 1, 0, 0, 1, 1,
-1.285405, -0.9474871, -2.097782, 1, 0, 0, 1, 1,
-1.283628, 0.876921, 0.3455449, 1, 0, 0, 1, 1,
-1.283195, 0.5380101, -1.474945, 1, 0, 0, 1, 1,
-1.280571, 1.98314, 0.4793556, 1, 0, 0, 1, 1,
-1.273587, -0.8907492, -2.462689, 0, 0, 0, 1, 1,
-1.271752, -1.784483, -2.901647, 0, 0, 0, 1, 1,
-1.261474, 0.6647829, -0.9224096, 0, 0, 0, 1, 1,
-1.256635, -0.0707234, -1.154196, 0, 0, 0, 1, 1,
-1.256407, -0.7576056, -1.667428, 0, 0, 0, 1, 1,
-1.252729, 0.9864228, -1.222122, 0, 0, 0, 1, 1,
-1.248246, -0.5952112, -2.215504, 0, 0, 0, 1, 1,
-1.247388, -0.454304, -2.093261, 1, 1, 1, 1, 1,
-1.244798, -3.457742, -2.376144, 1, 1, 1, 1, 1,
-1.231953, -1.16964, -3.260518, 1, 1, 1, 1, 1,
-1.225997, -1.027437, -3.967559, 1, 1, 1, 1, 1,
-1.225291, -0.2487886, -1.613946, 1, 1, 1, 1, 1,
-1.217143, -1.056398, -3.226832, 1, 1, 1, 1, 1,
-1.210216, -2.292478, -3.812691, 1, 1, 1, 1, 1,
-1.202242, 1.549657, -2.48007, 1, 1, 1, 1, 1,
-1.194528, -2.096514, -2.57855, 1, 1, 1, 1, 1,
-1.194323, 0.6803828, 0.154352, 1, 1, 1, 1, 1,
-1.194317, 0.05916712, -2.418553, 1, 1, 1, 1, 1,
-1.190801, 0.09215086, -1.80984, 1, 1, 1, 1, 1,
-1.188642, -0.3868275, -1.02556, 1, 1, 1, 1, 1,
-1.179771, -2.472023, -1.164589, 1, 1, 1, 1, 1,
-1.178312, 0.1232931, -0.152594, 1, 1, 1, 1, 1,
-1.175001, -2.095506, -2.369072, 0, 0, 1, 1, 1,
-1.17177, -0.2850932, -3.234772, 1, 0, 0, 1, 1,
-1.153507, 1.887493, -1.100186, 1, 0, 0, 1, 1,
-1.152698, -0.665618, -3.501925, 1, 0, 0, 1, 1,
-1.146896, 2.37153, -0.02347936, 1, 0, 0, 1, 1,
-1.125536, 0.3476324, -1.548554, 1, 0, 0, 1, 1,
-1.12163, 0.1678134, -1.297046, 0, 0, 0, 1, 1,
-1.110856, 0.2921767, -1.856177, 0, 0, 0, 1, 1,
-1.104414, 0.5205271, -0.670768, 0, 0, 0, 1, 1,
-1.102893, -0.8681876, -2.79539, 0, 0, 0, 1, 1,
-1.098755, -1.440002, -2.047711, 0, 0, 0, 1, 1,
-1.083948, -0.2108698, -2.689329, 0, 0, 0, 1, 1,
-1.082882, -0.8706489, -2.108925, 0, 0, 0, 1, 1,
-1.077208, 2.840568, -0.3854012, 1, 1, 1, 1, 1,
-1.069862, 1.303905, 0.9216828, 1, 1, 1, 1, 1,
-1.066218, 0.6715632, -0.3658664, 1, 1, 1, 1, 1,
-1.058726, 0.9002451, 0.3194692, 1, 1, 1, 1, 1,
-1.055933, 0.01723914, -1.974676, 1, 1, 1, 1, 1,
-1.055803, 1.223856, -0.7836752, 1, 1, 1, 1, 1,
-1.055722, -0.3858381, -2.422307, 1, 1, 1, 1, 1,
-1.053683, 0.6917179, -0.4206103, 1, 1, 1, 1, 1,
-1.051466, -0.4320813, -1.959537, 1, 1, 1, 1, 1,
-1.04971, -0.2586646, -0.9097942, 1, 1, 1, 1, 1,
-1.041502, -1.120996, -1.543937, 1, 1, 1, 1, 1,
-1.039441, -1.521602, -2.248087, 1, 1, 1, 1, 1,
-1.025054, 0.0347062, -0.2103482, 1, 1, 1, 1, 1,
-1.021208, -1.076483, -2.061306, 1, 1, 1, 1, 1,
-1.020776, 0.9170476, -0.5197739, 1, 1, 1, 1, 1,
-1.018987, 0.3357427, -1.026555, 0, 0, 1, 1, 1,
-1.018056, 2.348144, 0.8387698, 1, 0, 0, 1, 1,
-1.017037, -1.039676, -3.886091, 1, 0, 0, 1, 1,
-1.015481, -0.4751466, -2.043421, 1, 0, 0, 1, 1,
-1.012276, 0.2909977, -3.805573, 1, 0, 0, 1, 1,
-0.9976361, 0.4221327, -0.8652436, 1, 0, 0, 1, 1,
-0.9974892, -0.5056345, 0.6563396, 0, 0, 0, 1, 1,
-0.9943619, -0.9070717, -1.762757, 0, 0, 0, 1, 1,
-0.9894052, -0.1947351, -1.622516, 0, 0, 0, 1, 1,
-0.9868346, 1.337527, -0.3488667, 0, 0, 0, 1, 1,
-0.9811817, 0.3012728, -0.6824912, 0, 0, 0, 1, 1,
-0.9785812, 1.80531, -1.909254, 0, 0, 0, 1, 1,
-0.9700588, 2.360069, -0.2416388, 0, 0, 0, 1, 1,
-0.9698296, 0.7169704, -2.130935, 1, 1, 1, 1, 1,
-0.9661759, 1.488351, -1.862972, 1, 1, 1, 1, 1,
-0.9536375, -1.351158, -3.479226, 1, 1, 1, 1, 1,
-0.9529355, -0.0120725, -1.98542, 1, 1, 1, 1, 1,
-0.9488651, 0.9984495, 0.3424492, 1, 1, 1, 1, 1,
-0.9465904, -0.2806911, -1.607622, 1, 1, 1, 1, 1,
-0.9396703, 1.286561, -0.1396666, 1, 1, 1, 1, 1,
-0.9376239, -1.902968, -4.451635, 1, 1, 1, 1, 1,
-0.9278412, -0.4549725, -1.375984, 1, 1, 1, 1, 1,
-0.9247234, -0.3378853, -1.048553, 1, 1, 1, 1, 1,
-0.9236665, -0.4814899, -0.8142206, 1, 1, 1, 1, 1,
-0.92107, -0.3505391, -0.7013715, 1, 1, 1, 1, 1,
-0.9178532, -0.5375693, -3.899734, 1, 1, 1, 1, 1,
-0.9175479, -1.145904, -3.439692, 1, 1, 1, 1, 1,
-0.9158184, 0.2754625, 0.1325952, 1, 1, 1, 1, 1,
-0.9120028, -1.117061, -2.367756, 0, 0, 1, 1, 1,
-0.9103281, 0.5380581, -2.24473, 1, 0, 0, 1, 1,
-0.9087712, -0.01427656, -2.963068, 1, 0, 0, 1, 1,
-0.9016076, 0.8437103, 0.1054538, 1, 0, 0, 1, 1,
-0.8982278, -1.65744, -2.291553, 1, 0, 0, 1, 1,
-0.8927319, 0.8077991, -3.186943, 1, 0, 0, 1, 1,
-0.8925959, -0.2331694, -0.6300561, 0, 0, 0, 1, 1,
-0.8908205, 1.24172, -1.927573, 0, 0, 0, 1, 1,
-0.8892038, 0.2832129, 0.1341634, 0, 0, 0, 1, 1,
-0.8871441, -0.1841902, -2.536569, 0, 0, 0, 1, 1,
-0.8828493, -0.3453773, -2.303402, 0, 0, 0, 1, 1,
-0.8798711, -1.001074, -3.842499, 0, 0, 0, 1, 1,
-0.8773316, -0.7227983, -3.002404, 0, 0, 0, 1, 1,
-0.873112, -1.077823, -2.315884, 1, 1, 1, 1, 1,
-0.8725641, 1.302519, -2.069114, 1, 1, 1, 1, 1,
-0.8711056, 1.075887, -1.860606, 1, 1, 1, 1, 1,
-0.8683557, -0.1353589, -1.797409, 1, 1, 1, 1, 1,
-0.8638354, -1.705208, -2.712693, 1, 1, 1, 1, 1,
-0.8637081, -2.237668, -2.539224, 1, 1, 1, 1, 1,
-0.8583674, 0.8172759, -0.9276628, 1, 1, 1, 1, 1,
-0.8564941, 1.13172, -2.23758, 1, 1, 1, 1, 1,
-0.8513521, 0.9184205, 0.2065921, 1, 1, 1, 1, 1,
-0.8490711, 0.3087626, -4.410858, 1, 1, 1, 1, 1,
-0.8471892, -0.5457332, -2.240532, 1, 1, 1, 1, 1,
-0.8446844, -2.778398, -1.602705, 1, 1, 1, 1, 1,
-0.8434772, 0.06603085, -2.34847, 1, 1, 1, 1, 1,
-0.8426176, 1.216403, -1.50148, 1, 1, 1, 1, 1,
-0.8393726, -0.1690402, -1.688431, 1, 1, 1, 1, 1,
-0.8340263, 0.3022212, -2.042775, 0, 0, 1, 1, 1,
-0.8306589, -2.15825, -1.387052, 1, 0, 0, 1, 1,
-0.8299584, -1.323311, -3.153852, 1, 0, 0, 1, 1,
-0.8294638, 0.3475779, -0.4773531, 1, 0, 0, 1, 1,
-0.826, 0.737165, -1.024379, 1, 0, 0, 1, 1,
-0.824895, 0.1238, -0.4680446, 1, 0, 0, 1, 1,
-0.8242396, 0.506011, 0.9283201, 0, 0, 0, 1, 1,
-0.823833, -0.8737069, -2.210266, 0, 0, 0, 1, 1,
-0.8082273, -0.2254081, -1.081534, 0, 0, 0, 1, 1,
-0.8017951, 0.720888, 1.111241, 0, 0, 0, 1, 1,
-0.7961438, 1.052747, -1.321529, 0, 0, 0, 1, 1,
-0.7939882, -1.407833, -2.128908, 0, 0, 0, 1, 1,
-0.7857561, -1.043873, -1.558473, 0, 0, 0, 1, 1,
-0.7792614, 0.1965951, -1.54636, 1, 1, 1, 1, 1,
-0.7783098, -0.6509376, -1.978605, 1, 1, 1, 1, 1,
-0.776255, 0.6387048, -0.4917896, 1, 1, 1, 1, 1,
-0.77522, -1.371056, -2.70747, 1, 1, 1, 1, 1,
-0.7744535, 0.4700556, -2.252525, 1, 1, 1, 1, 1,
-0.770028, 0.3449714, -0.2657476, 1, 1, 1, 1, 1,
-0.7658677, 0.004864861, -0.2168313, 1, 1, 1, 1, 1,
-0.7628581, 0.1953389, -0.6390502, 1, 1, 1, 1, 1,
-0.7612946, 0.4144182, -0.9447688, 1, 1, 1, 1, 1,
-0.7560123, -0.8112671, -2.027442, 1, 1, 1, 1, 1,
-0.7534467, -1.522646, -1.804674, 1, 1, 1, 1, 1,
-0.7530453, 0.6894261, -2.346566, 1, 1, 1, 1, 1,
-0.751301, 0.4249564, -0.5771053, 1, 1, 1, 1, 1,
-0.7415761, 2.216456, -0.1190584, 1, 1, 1, 1, 1,
-0.7415401, -1.616282, -1.614221, 1, 1, 1, 1, 1,
-0.7401879, 0.1964793, -2.683062, 0, 0, 1, 1, 1,
-0.7401753, -0.06241747, -1.256557, 1, 0, 0, 1, 1,
-0.7337161, -1.945588, -3.730253, 1, 0, 0, 1, 1,
-0.7229353, 0.5232702, 0.9055532, 1, 0, 0, 1, 1,
-0.7219295, -0.1262575, -0.439558, 1, 0, 0, 1, 1,
-0.7197892, 2.503598, -1.531076, 1, 0, 0, 1, 1,
-0.7141874, 1.038561, -0.1915064, 0, 0, 0, 1, 1,
-0.7114874, -0.4432539, -1.682733, 0, 0, 0, 1, 1,
-0.7075397, -0.1014028, -3.220518, 0, 0, 0, 1, 1,
-0.7042761, 0.410224, -0.8592603, 0, 0, 0, 1, 1,
-0.700367, 1.471001, 0.1543851, 0, 0, 0, 1, 1,
-0.6976665, -0.3324108, -2.836227, 0, 0, 0, 1, 1,
-0.6969755, 1.34726, -1.361387, 0, 0, 0, 1, 1,
-0.6933262, 0.06649534, -2.004529, 1, 1, 1, 1, 1,
-0.6922705, 0.2555409, -1.642082, 1, 1, 1, 1, 1,
-0.68931, 0.1415195, -0.7509689, 1, 1, 1, 1, 1,
-0.6758706, -0.4206062, -2.046429, 1, 1, 1, 1, 1,
-0.6732869, 0.1542514, -1.944385, 1, 1, 1, 1, 1,
-0.6700867, 0.3900185, -2.364279, 1, 1, 1, 1, 1,
-0.6677231, 0.2209621, -1.962554, 1, 1, 1, 1, 1,
-0.6669706, -1.202918, -2.029195, 1, 1, 1, 1, 1,
-0.6656062, -0.4379988, -3.814469, 1, 1, 1, 1, 1,
-0.6651604, 0.567341, -1.187957, 1, 1, 1, 1, 1,
-0.6635142, -1.274055, -3.205189, 1, 1, 1, 1, 1,
-0.6569079, -0.2071806, -3.157674, 1, 1, 1, 1, 1,
-0.6522142, -0.569236, -0.345947, 1, 1, 1, 1, 1,
-0.6488443, -1.127405, -3.956775, 1, 1, 1, 1, 1,
-0.6478127, 1.818936, -1.244099, 1, 1, 1, 1, 1,
-0.6451497, 0.2290825, -1.811954, 0, 0, 1, 1, 1,
-0.6440586, 1.02098, 0.2120706, 1, 0, 0, 1, 1,
-0.6437628, 0.4041623, -0.6035494, 1, 0, 0, 1, 1,
-0.6426187, -1.241495, -3.947036, 1, 0, 0, 1, 1,
-0.6392381, -0.1265902, -3.760358, 1, 0, 0, 1, 1,
-0.6324789, 0.203951, -2.75583, 1, 0, 0, 1, 1,
-0.6310105, -0.3327917, -2.185928, 0, 0, 0, 1, 1,
-0.6273932, 0.2763415, -0.7088102, 0, 0, 0, 1, 1,
-0.627361, -0.7752498, -1.119505, 0, 0, 0, 1, 1,
-0.6270661, -0.8527064, -4.146467, 0, 0, 0, 1, 1,
-0.6244854, -0.26239, -2.842046, 0, 0, 0, 1, 1,
-0.6118013, -0.4371328, -4.33504, 0, 0, 0, 1, 1,
-0.6088276, 0.04077377, -0.8743752, 0, 0, 0, 1, 1,
-0.6085096, 0.1823008, -1.133496, 1, 1, 1, 1, 1,
-0.6066336, 0.002612093, -1.244933, 1, 1, 1, 1, 1,
-0.5954293, 1.907796, -1.036518, 1, 1, 1, 1, 1,
-0.590602, 0.9165555, 1.17334, 1, 1, 1, 1, 1,
-0.5903608, 0.7214235, -1.018893, 1, 1, 1, 1, 1,
-0.5899847, -0.7897638, -2.723476, 1, 1, 1, 1, 1,
-0.5880392, 1.660314, -0.7096836, 1, 1, 1, 1, 1,
-0.5873646, 0.7238178, -1.246726, 1, 1, 1, 1, 1,
-0.5867079, -0.4405162, -2.983315, 1, 1, 1, 1, 1,
-0.5865594, -1.598316, -4.640062, 1, 1, 1, 1, 1,
-0.5785074, 0.6430198, -2.379688, 1, 1, 1, 1, 1,
-0.5771899, 0.7580571, 0.657937, 1, 1, 1, 1, 1,
-0.5703799, 0.2475727, -0.3685776, 1, 1, 1, 1, 1,
-0.5695151, -1.838604, -4.336959, 1, 1, 1, 1, 1,
-0.5665596, -1.992978, -4.365053, 1, 1, 1, 1, 1,
-0.5656095, -1.422928, -2.464537, 0, 0, 1, 1, 1,
-0.5653624, 2.026654, 0.0419039, 1, 0, 0, 1, 1,
-0.5622222, -1.399968, -3.111273, 1, 0, 0, 1, 1,
-0.5612848, 0.5709338, 0.1190822, 1, 0, 0, 1, 1,
-0.5586348, 0.1862198, 1.22692, 1, 0, 0, 1, 1,
-0.5565859, 0.5802945, 0.4043699, 1, 0, 0, 1, 1,
-0.5559626, 0.4766449, -1.150463, 0, 0, 0, 1, 1,
-0.5558656, 1.152254, -1.446345, 0, 0, 0, 1, 1,
-0.5538986, 0.2583635, -1.70741, 0, 0, 0, 1, 1,
-0.5522202, 0.87548, -0.3268482, 0, 0, 0, 1, 1,
-0.5495697, 0.1545891, -2.098017, 0, 0, 0, 1, 1,
-0.5434191, -0.6129761, -2.938362, 0, 0, 0, 1, 1,
-0.5425065, 0.2364666, -0.4725033, 0, 0, 0, 1, 1,
-0.5389317, 1.115345, 0.4892339, 1, 1, 1, 1, 1,
-0.5374687, -1.161419, -2.438033, 1, 1, 1, 1, 1,
-0.5291057, 0.5466581, -0.1576058, 1, 1, 1, 1, 1,
-0.5275, -1.149273, -2.346869, 1, 1, 1, 1, 1,
-0.5274507, 0.7062278, -0.0831476, 1, 1, 1, 1, 1,
-0.5261664, 0.3086551, -0.2464383, 1, 1, 1, 1, 1,
-0.5200531, -1.883407, -4.425418, 1, 1, 1, 1, 1,
-0.5127058, 3.456786, -1.361102, 1, 1, 1, 1, 1,
-0.5108697, 1.012263, -0.2861503, 1, 1, 1, 1, 1,
-0.509214, -0.8633907, -2.178224, 1, 1, 1, 1, 1,
-0.5089704, 1.0821, 0.2941789, 1, 1, 1, 1, 1,
-0.5088699, -0.04019013, -2.235061, 1, 1, 1, 1, 1,
-0.5056215, -0.5068432, -3.956229, 1, 1, 1, 1, 1,
-0.5031676, -0.2856093, -1.956478, 1, 1, 1, 1, 1,
-0.4997009, -1.562179, -1.020977, 1, 1, 1, 1, 1,
-0.4969763, -0.3512029, -3.099826, 0, 0, 1, 1, 1,
-0.4950207, 0.4797616, -1.280604, 1, 0, 0, 1, 1,
-0.4894914, 0.1268338, 0.4291717, 1, 0, 0, 1, 1,
-0.4887742, 1.423354, -0.4902597, 1, 0, 0, 1, 1,
-0.4879782, 1.070752, -1.114677, 1, 0, 0, 1, 1,
-0.4855767, 0.3890817, -0.2104484, 1, 0, 0, 1, 1,
-0.4818258, -0.1483237, -1.869981, 0, 0, 0, 1, 1,
-0.479043, 1.337994, 0.1456792, 0, 0, 0, 1, 1,
-0.4784593, -0.6649733, -2.759549, 0, 0, 0, 1, 1,
-0.4723137, -0.5385686, -2.214064, 0, 0, 0, 1, 1,
-0.4719069, 0.9352977, -1.540149, 0, 0, 0, 1, 1,
-0.4676925, -0.8154991, -1.571254, 0, 0, 0, 1, 1,
-0.4669485, -0.6825836, -4.061126, 0, 0, 0, 1, 1,
-0.4655598, 0.7901843, -0.1031407, 1, 1, 1, 1, 1,
-0.4650614, -1.016047, -4.524371, 1, 1, 1, 1, 1,
-0.4644397, 0.7586567, -0.04908302, 1, 1, 1, 1, 1,
-0.4637328, 1.797301, -0.4946116, 1, 1, 1, 1, 1,
-0.4583839, -0.3461757, -2.287251, 1, 1, 1, 1, 1,
-0.4577623, -0.6622856, -2.164253, 1, 1, 1, 1, 1,
-0.4558341, -0.5882635, -3.93224, 1, 1, 1, 1, 1,
-0.4549238, -1.034305, -1.073959, 1, 1, 1, 1, 1,
-0.4510901, 0.1478257, -0.6329128, 1, 1, 1, 1, 1,
-0.4472129, -1.461044, -3.599918, 1, 1, 1, 1, 1,
-0.4435122, 0.7692644, -1.25935, 1, 1, 1, 1, 1,
-0.442718, -0.6347812, -3.79735, 1, 1, 1, 1, 1,
-0.4425413, 1.478633, 0.1716419, 1, 1, 1, 1, 1,
-0.4400645, -0.8707871, -0.7309589, 1, 1, 1, 1, 1,
-0.439878, -0.419102, -2.993212, 1, 1, 1, 1, 1,
-0.439306, 1.1054, 0.1403385, 0, 0, 1, 1, 1,
-0.4381308, -0.1489934, -2.989536, 1, 0, 0, 1, 1,
-0.435757, 0.5272045, 0.05202617, 1, 0, 0, 1, 1,
-0.433546, -1.497882, -2.765759, 1, 0, 0, 1, 1,
-0.4330528, 0.147144, -0.245004, 1, 0, 0, 1, 1,
-0.4328048, 1.489524, -1.185442, 1, 0, 0, 1, 1,
-0.4268486, 0.1351431, -1.193636, 0, 0, 0, 1, 1,
-0.4207134, -1.006786, -3.23921, 0, 0, 0, 1, 1,
-0.4159663, -2.001322, -3.019863, 0, 0, 0, 1, 1,
-0.4153574, 0.9871868, -0.7795495, 0, 0, 0, 1, 1,
-0.4150499, -2.228493, -3.132059, 0, 0, 0, 1, 1,
-0.4094243, -0.3177404, -2.949165, 0, 0, 0, 1, 1,
-0.4087013, 1.397324, 0.6353777, 0, 0, 0, 1, 1,
-0.4057908, 1.597577, -0.9410104, 1, 1, 1, 1, 1,
-0.4025851, -0.5659949, -1.581585, 1, 1, 1, 1, 1,
-0.3958515, 0.4057171, -0.565533, 1, 1, 1, 1, 1,
-0.3958414, -0.9693938, -2.028276, 1, 1, 1, 1, 1,
-0.3865649, -1.049202, -2.489233, 1, 1, 1, 1, 1,
-0.385587, -0.6007034, -3.180903, 1, 1, 1, 1, 1,
-0.3833281, -0.09047181, -1.017303, 1, 1, 1, 1, 1,
-0.3819901, -0.737235, -3.692934, 1, 1, 1, 1, 1,
-0.379804, 1.118366, 0.05792438, 1, 1, 1, 1, 1,
-0.3779366, 2.100001, 0.4051172, 1, 1, 1, 1, 1,
-0.3771841, 2.034348, -0.8258926, 1, 1, 1, 1, 1,
-0.3737108, -0.01486015, -1.947404, 1, 1, 1, 1, 1,
-0.3705233, 0.661558, -2.065285, 1, 1, 1, 1, 1,
-0.3703391, 0.3613892, 0.267655, 1, 1, 1, 1, 1,
-0.3628208, -0.8799566, -1.170125, 1, 1, 1, 1, 1,
-0.3561562, -0.508846, -2.609029, 0, 0, 1, 1, 1,
-0.3560288, -0.6977112, -1.766778, 1, 0, 0, 1, 1,
-0.3540762, 0.951563, 0.9243954, 1, 0, 0, 1, 1,
-0.3518752, -0.5562268, -2.897663, 1, 0, 0, 1, 1,
-0.3500716, 0.6637685, -1.964984, 1, 0, 0, 1, 1,
-0.3494168, 1.443653, 1.129122, 1, 0, 0, 1, 1,
-0.3490143, -0.2235726, -0.4577029, 0, 0, 0, 1, 1,
-0.3470009, -0.08251652, -1.28857, 0, 0, 0, 1, 1,
-0.3461896, 0.7323036, -1.672367, 0, 0, 0, 1, 1,
-0.3452304, -2.702988, -2.399168, 0, 0, 0, 1, 1,
-0.3363441, -0.03422055, -1.696886, 0, 0, 0, 1, 1,
-0.335582, 0.6663769, -0.9638694, 0, 0, 0, 1, 1,
-0.3349422, -0.01752522, -1.733544, 0, 0, 0, 1, 1,
-0.3312413, 0.01537792, -1.861785, 1, 1, 1, 1, 1,
-0.3284323, -0.294315, -1.529463, 1, 1, 1, 1, 1,
-0.3230527, 0.05083871, -3.465577, 1, 1, 1, 1, 1,
-0.3149504, -1.429606, -4.899652, 1, 1, 1, 1, 1,
-0.3118376, -1.384385, -2.953235, 1, 1, 1, 1, 1,
-0.3102525, -0.8130167, -3.890505, 1, 1, 1, 1, 1,
-0.3055243, -1.560699, -1.182109, 1, 1, 1, 1, 1,
-0.3044887, 0.1582228, -1.817608, 1, 1, 1, 1, 1,
-0.3043502, 0.5844645, -1.957036, 1, 1, 1, 1, 1,
-0.3023059, 2.104036, -1.005297, 1, 1, 1, 1, 1,
-0.2996831, -0.1640291, -1.564674, 1, 1, 1, 1, 1,
-0.2989323, 0.4136824, -1.272128, 1, 1, 1, 1, 1,
-0.2970796, 2.582528, -2.527334, 1, 1, 1, 1, 1,
-0.2848562, -1.39962, -3.782117, 1, 1, 1, 1, 1,
-0.2848485, -0.6428474, -5.341073, 1, 1, 1, 1, 1,
-0.278856, -0.2524272, -2.756007, 0, 0, 1, 1, 1,
-0.2782766, 1.160982, -0.3489267, 1, 0, 0, 1, 1,
-0.2727069, -1.102357, -4.069118, 1, 0, 0, 1, 1,
-0.2682152, 1.620517, -0.4002368, 1, 0, 0, 1, 1,
-0.2648903, 0.001910893, -1.471938, 1, 0, 0, 1, 1,
-0.2602318, 1.213741, 0.0117286, 1, 0, 0, 1, 1,
-0.2591665, -1.038405, -0.4881188, 0, 0, 0, 1, 1,
-0.2568038, -0.6036982, -3.30006, 0, 0, 0, 1, 1,
-0.2533207, -0.7435963, -2.684032, 0, 0, 0, 1, 1,
-0.2393411, 0.8672956, 1.919386, 0, 0, 0, 1, 1,
-0.2386493, 1.91557, 1.953211, 0, 0, 0, 1, 1,
-0.2385617, -0.07919888, 0.1005675, 0, 0, 0, 1, 1,
-0.2343736, -0.4400442, -1.952308, 0, 0, 0, 1, 1,
-0.232519, -0.1858477, -1.916872, 1, 1, 1, 1, 1,
-0.2319201, 1.225833, -0.3552282, 1, 1, 1, 1, 1,
-0.2303071, -0.8868673, -2.190464, 1, 1, 1, 1, 1,
-0.2278093, -0.4885871, -2.808689, 1, 1, 1, 1, 1,
-0.2246108, -0.4409642, -1.201442, 1, 1, 1, 1, 1,
-0.2206879, -0.6071823, -3.090552, 1, 1, 1, 1, 1,
-0.2159547, -0.5042287, -1.780233, 1, 1, 1, 1, 1,
-0.2073026, 1.009776, 1.273241, 1, 1, 1, 1, 1,
-0.2058286, 0.1534672, -0.7551349, 1, 1, 1, 1, 1,
-0.2045968, 0.5568559, -1.84138, 1, 1, 1, 1, 1,
-0.1980158, -0.8683377, -3.559679, 1, 1, 1, 1, 1,
-0.1959931, -0.4990953, -2.652409, 1, 1, 1, 1, 1,
-0.1938083, 1.878923, 0.1798945, 1, 1, 1, 1, 1,
-0.1909853, -1.262504, -3.379056, 1, 1, 1, 1, 1,
-0.1905643, 0.3596586, -1.441228, 1, 1, 1, 1, 1,
-0.1840531, -1.638792, -3.033042, 0, 0, 1, 1, 1,
-0.1822404, 0.08671974, 0.804809, 1, 0, 0, 1, 1,
-0.1818125, 0.205425, -1.087382, 1, 0, 0, 1, 1,
-0.1811178, 0.09577323, -1.272921, 1, 0, 0, 1, 1,
-0.1748907, -0.6573444, -3.847131, 1, 0, 0, 1, 1,
-0.1707921, 0.8097262, 0.3061933, 1, 0, 0, 1, 1,
-0.1696613, -1.827168, -3.962894, 0, 0, 0, 1, 1,
-0.1682333, 0.1622485, -0.5230842, 0, 0, 0, 1, 1,
-0.1667646, -1.186626, -3.171834, 0, 0, 0, 1, 1,
-0.1659356, -1.206973, -3.533016, 0, 0, 0, 1, 1,
-0.1656834, 0.4674681, -2.695565, 0, 0, 0, 1, 1,
-0.1642051, 1.642581, -1.149245, 0, 0, 0, 1, 1,
-0.163863, -1.003275, -3.022041, 0, 0, 0, 1, 1,
-0.1614221, 0.5190673, 0.9762396, 1, 1, 1, 1, 1,
-0.1613795, 1.100888, -0.3426087, 1, 1, 1, 1, 1,
-0.1527577, -1.043112, -2.31572, 1, 1, 1, 1, 1,
-0.1520151, 0.449166, -0.4900975, 1, 1, 1, 1, 1,
-0.1502756, -0.2445054, -2.358434, 1, 1, 1, 1, 1,
-0.150057, -1.002774, -2.109011, 1, 1, 1, 1, 1,
-0.1492038, -0.2588206, -3.086918, 1, 1, 1, 1, 1,
-0.1299938, 1.332223, 1.181562, 1, 1, 1, 1, 1,
-0.1257898, 2.008976, 0.581122, 1, 1, 1, 1, 1,
-0.1256997, -0.01731755, -0.6928256, 1, 1, 1, 1, 1,
-0.1256239, -1.184143, -3.881321, 1, 1, 1, 1, 1,
-0.1228229, 0.9653348, -1.789663, 1, 1, 1, 1, 1,
-0.1214728, 0.07166308, 0.03139335, 1, 1, 1, 1, 1,
-0.1195703, 0.7033814, 0.1258043, 1, 1, 1, 1, 1,
-0.1194301, 0.6931751, -0.02140254, 1, 1, 1, 1, 1,
-0.1185756, 0.5844516, 0.4194329, 0, 0, 1, 1, 1,
-0.1102352, -0.42799, -2.676177, 1, 0, 0, 1, 1,
-0.1073975, -0.2758389, -2.282535, 1, 0, 0, 1, 1,
-0.1065281, -0.7740417, -2.188912, 1, 0, 0, 1, 1,
-0.1065065, -0.1021956, -1.965301, 1, 0, 0, 1, 1,
-0.1029296, -0.8798138, -3.354779, 1, 0, 0, 1, 1,
-0.1019627, -0.1283896, -0.4121245, 0, 0, 0, 1, 1,
-0.1003461, 0.008528742, -2.455174, 0, 0, 0, 1, 1,
-0.09642977, 2.129971, 0.1046233, 0, 0, 0, 1, 1,
-0.08783514, 0.3052825, 0.2279352, 0, 0, 0, 1, 1,
-0.08483995, -0.134391, -1.682206, 0, 0, 0, 1, 1,
-0.08351684, -0.1139952, -1.619634, 0, 0, 0, 1, 1,
-0.08322625, -1.357232, -1.754928, 0, 0, 0, 1, 1,
-0.08237389, -1.95103, -2.161041, 1, 1, 1, 1, 1,
-0.07756377, -1.431782, -3.93678, 1, 1, 1, 1, 1,
-0.0766684, 0.2761731, 0.1367715, 1, 1, 1, 1, 1,
-0.07635083, 1.651337, -1.841186, 1, 1, 1, 1, 1,
-0.07526373, 0.6095703, -1.77518, 1, 1, 1, 1, 1,
-0.07104088, 0.7962391, 1.336166, 1, 1, 1, 1, 1,
-0.06870998, 0.8803887, 1.524115, 1, 1, 1, 1, 1,
-0.06650107, -0.7434986, -2.135115, 1, 1, 1, 1, 1,
-0.06540717, 1.414693, 1.813769, 1, 1, 1, 1, 1,
-0.05374094, -0.4686421, -3.632846, 1, 1, 1, 1, 1,
-0.05362389, -0.7512966, -2.888718, 1, 1, 1, 1, 1,
-0.04824189, 0.7864732, 2.279027, 1, 1, 1, 1, 1,
-0.04823697, -0.6126152, -2.88099, 1, 1, 1, 1, 1,
-0.03691923, -0.6169339, -3.233859, 1, 1, 1, 1, 1,
-0.0356435, -0.7622676, -2.527178, 1, 1, 1, 1, 1,
-0.03495036, -1.973615, -0.6111403, 0, 0, 1, 1, 1,
-0.03087406, 0.653551, 1.088072, 1, 0, 0, 1, 1,
-0.03074639, 0.8431233, 0.1538313, 1, 0, 0, 1, 1,
-0.02914317, -0.3867976, -2.163761, 1, 0, 0, 1, 1,
-0.02727614, 0.2504471, -0.4858218, 1, 0, 0, 1, 1,
-0.02700817, 2.594382, -0.6000072, 1, 0, 0, 1, 1,
-0.02615726, -0.07710563, -3.570312, 0, 0, 0, 1, 1,
-0.02591331, 0.4794038, -0.5584929, 0, 0, 0, 1, 1,
-0.02123161, 1.33097, 0.222641, 0, 0, 0, 1, 1,
-0.02040256, 0.1646404, -0.9825211, 0, 0, 0, 1, 1,
-0.01843858, -0.7185928, -4.168521, 0, 0, 0, 1, 1,
-0.01745364, 0.5280956, -0.707812, 0, 0, 0, 1, 1,
-0.01658781, 0.06175266, 0.08506494, 0, 0, 0, 1, 1,
-0.01642066, 1.097679, 1.635716, 1, 1, 1, 1, 1,
-0.01487613, 0.2951416, 0.1441211, 1, 1, 1, 1, 1,
-0.01364536, -0.1989858, -0.7761375, 1, 1, 1, 1, 1,
-0.01355073, -0.4286339, -2.366192, 1, 1, 1, 1, 1,
-0.01182234, -0.4885551, -3.694279, 1, 1, 1, 1, 1,
-0.005732779, -1.327399, -2.154537, 1, 1, 1, 1, 1,
-0.002678599, 0.0317499, 0.3925054, 1, 1, 1, 1, 1,
-0.0005218904, 0.4816204, -0.196881, 1, 1, 1, 1, 1,
0.002249973, 1.110292, -1.103011, 1, 1, 1, 1, 1,
0.009846489, 0.9572331, 0.3472263, 1, 1, 1, 1, 1,
0.01333834, -0.2170965, 3.134131, 1, 1, 1, 1, 1,
0.01798103, -0.4530221, 4.282142, 1, 1, 1, 1, 1,
0.01800613, 0.5013927, 0.08533922, 1, 1, 1, 1, 1,
0.02162789, -0.9986104, 3.358142, 1, 1, 1, 1, 1,
0.02245581, -0.3859698, 3.58662, 1, 1, 1, 1, 1,
0.02454452, 0.06102897, -1.901617, 0, 0, 1, 1, 1,
0.02553256, 0.8265168, 0.8879524, 1, 0, 0, 1, 1,
0.02726602, -0.4400019, 2.072999, 1, 0, 0, 1, 1,
0.02966405, 0.01265406, 0.8967867, 1, 0, 0, 1, 1,
0.03000323, 0.3046355, 2.152323, 1, 0, 0, 1, 1,
0.03286015, -2.260953, 4.119729, 1, 0, 0, 1, 1,
0.03549736, 0.9492463, -0.08982377, 0, 0, 0, 1, 1,
0.04097473, -0.2893941, 3.185945, 0, 0, 0, 1, 1,
0.04542692, 1.03796, -1.40349, 0, 0, 0, 1, 1,
0.04543921, 0.6134282, -0.5662864, 0, 0, 0, 1, 1,
0.04602977, 0.3583078, -1.126993, 0, 0, 0, 1, 1,
0.04865745, -0.3303336, 2.458663, 0, 0, 0, 1, 1,
0.05033417, 0.767855, -1.166277, 0, 0, 0, 1, 1,
0.05050183, -0.6589603, 3.480231, 1, 1, 1, 1, 1,
0.05297052, 0.6964608, -0.4059877, 1, 1, 1, 1, 1,
0.05591528, 2.14966, -0.6097884, 1, 1, 1, 1, 1,
0.05743339, -2.310432, 3.369595, 1, 1, 1, 1, 1,
0.06022278, -2.866447, 4.482909, 1, 1, 1, 1, 1,
0.06061178, 0.5427268, 1.383554, 1, 1, 1, 1, 1,
0.06214659, -0.4089713, 2.676242, 1, 1, 1, 1, 1,
0.06349587, -1.053021, 2.272703, 1, 1, 1, 1, 1,
0.06384509, -1.89001, 4.606211, 1, 1, 1, 1, 1,
0.06481784, 1.006035, -0.1378454, 1, 1, 1, 1, 1,
0.06769691, -1.359321, 3.021946, 1, 1, 1, 1, 1,
0.06801546, -0.2406915, 3.882065, 1, 1, 1, 1, 1,
0.07196624, 1.89486, 0.03351878, 1, 1, 1, 1, 1,
0.07201893, 0.3812758, -0.08177829, 1, 1, 1, 1, 1,
0.07490115, -0.2068406, 3.857515, 1, 1, 1, 1, 1,
0.07511785, 1.542234, -1.006782, 0, 0, 1, 1, 1,
0.0767144, 1.711445, 1.867007, 1, 0, 0, 1, 1,
0.08023212, -0.4580094, 2.554293, 1, 0, 0, 1, 1,
0.08181753, -0.1701332, 2.418126, 1, 0, 0, 1, 1,
0.08386783, -0.5064034, 1.955243, 1, 0, 0, 1, 1,
0.08405915, 0.02193177, 1.437327, 1, 0, 0, 1, 1,
0.08512101, -2.182646, 2.908112, 0, 0, 0, 1, 1,
0.09488121, 0.9238971, -2.112128, 0, 0, 0, 1, 1,
0.09781396, -2.048821, 2.972447, 0, 0, 0, 1, 1,
0.1034989, 0.01266673, -0.5685534, 0, 0, 0, 1, 1,
0.1102883, -0.205994, 3.220948, 0, 0, 0, 1, 1,
0.1170845, -0.8520567, 2.809982, 0, 0, 0, 1, 1,
0.1185102, 0.2330188, 0.1349705, 0, 0, 0, 1, 1,
0.1193513, 0.7714086, 1.137149, 1, 1, 1, 1, 1,
0.1236967, 0.1939882, 0.608379, 1, 1, 1, 1, 1,
0.1308588, 0.02802947, 0.8247762, 1, 1, 1, 1, 1,
0.1319765, -2.071568, 2.06095, 1, 1, 1, 1, 1,
0.1357672, -0.2781757, 3.208494, 1, 1, 1, 1, 1,
0.1374131, 0.2781039, -0.5479171, 1, 1, 1, 1, 1,
0.1410574, -0.4353033, 2.627677, 1, 1, 1, 1, 1,
0.1422136, 0.7525364, 0.7115211, 1, 1, 1, 1, 1,
0.1476935, -0.7836617, 1.823741, 1, 1, 1, 1, 1,
0.1509512, 0.06463496, 2.328543, 1, 1, 1, 1, 1,
0.1546734, 0.3488096, 1.829291, 1, 1, 1, 1, 1,
0.1562331, 0.07525083, 1.494601, 1, 1, 1, 1, 1,
0.1574398, 0.4674948, 1.47214, 1, 1, 1, 1, 1,
0.1582907, -0.1278378, 1.402459, 1, 1, 1, 1, 1,
0.1591319, -0.1227607, 0.8458893, 1, 1, 1, 1, 1,
0.1600645, -0.1068148, 2.56113, 0, 0, 1, 1, 1,
0.1622941, -0.9001518, 3.1683, 1, 0, 0, 1, 1,
0.163057, 0.7062267, -1.001597, 1, 0, 0, 1, 1,
0.163777, 1.028769, 0.4965895, 1, 0, 0, 1, 1,
0.1687269, -0.4208351, 1.783143, 1, 0, 0, 1, 1,
0.1730181, 0.4977477, 0.9657136, 1, 0, 0, 1, 1,
0.1734861, -0.504977, 1.654146, 0, 0, 0, 1, 1,
0.1798297, 0.4573979, 1.979864, 0, 0, 0, 1, 1,
0.1828845, 0.7190863, 0.399166, 0, 0, 0, 1, 1,
0.1856239, -0.2477459, 3.690728, 0, 0, 0, 1, 1,
0.1865999, 1.334422, 0.8539264, 0, 0, 0, 1, 1,
0.188999, -1.096996, 3.277701, 0, 0, 0, 1, 1,
0.1916652, -0.5537754, 5.387456, 0, 0, 0, 1, 1,
0.1920568, -0.6660392, 3.478453, 1, 1, 1, 1, 1,
0.1939749, -0.7822681, 2.021614, 1, 1, 1, 1, 1,
0.1952271, 1.09118, -0.09114882, 1, 1, 1, 1, 1,
0.1991335, -0.7916316, 3.284146, 1, 1, 1, 1, 1,
0.1992263, 0.6390905, 1.209435, 1, 1, 1, 1, 1,
0.2006509, -0.1706589, 3.484916, 1, 1, 1, 1, 1,
0.2006717, 1.419875, 0.7205958, 1, 1, 1, 1, 1,
0.2015815, -0.9057032, 1.534638, 1, 1, 1, 1, 1,
0.2017828, 2.138337, 1.075504, 1, 1, 1, 1, 1,
0.2020889, -0.8191615, 2.41824, 1, 1, 1, 1, 1,
0.2040475, 0.6471353, -0.620362, 1, 1, 1, 1, 1,
0.2064061, -2.17011, 2.708647, 1, 1, 1, 1, 1,
0.2118807, 0.3431617, -1.228979, 1, 1, 1, 1, 1,
0.2145081, -0.7505918, 4.614544, 1, 1, 1, 1, 1,
0.2147319, 0.2700954, 1.195475, 1, 1, 1, 1, 1,
0.2224612, -1.194747, 1.849785, 0, 0, 1, 1, 1,
0.2245978, 0.5330946, 1.885582, 1, 0, 0, 1, 1,
0.2252349, 0.103421, 1.162822, 1, 0, 0, 1, 1,
0.225672, -1.755295, 4.148179, 1, 0, 0, 1, 1,
0.2259185, -0.4645636, 2.012552, 1, 0, 0, 1, 1,
0.2271418, -1.181896, 2.795934, 1, 0, 0, 1, 1,
0.2332249, -0.5132613, 1.922486, 0, 0, 0, 1, 1,
0.244841, 0.7561247, 1.706585, 0, 0, 0, 1, 1,
0.2490304, 1.186946, -0.3452787, 0, 0, 0, 1, 1,
0.2494755, 0.8401234, 0.6337051, 0, 0, 0, 1, 1,
0.2520733, -0.7290219, 3.695695, 0, 0, 0, 1, 1,
0.2534402, 0.6357428, 0.2791164, 0, 0, 0, 1, 1,
0.2537631, 0.005536968, 1.785184, 0, 0, 0, 1, 1,
0.2539338, -0.1393627, 1.977612, 1, 1, 1, 1, 1,
0.2590255, 1.853146, -1.621165, 1, 1, 1, 1, 1,
0.2608145, -0.01392955, 0.9561937, 1, 1, 1, 1, 1,
0.2660211, -0.05585714, 1.548274, 1, 1, 1, 1, 1,
0.2673671, -0.7705451, 3.715866, 1, 1, 1, 1, 1,
0.2675084, -0.9716992, 2.109958, 1, 1, 1, 1, 1,
0.2710763, 0.5556369, -1.351658, 1, 1, 1, 1, 1,
0.2729, 0.4812306, 0.9431748, 1, 1, 1, 1, 1,
0.2759001, 0.02102275, 2.529055, 1, 1, 1, 1, 1,
0.2811677, -1.270967, 1.025527, 1, 1, 1, 1, 1,
0.2888553, -0.5603921, 3.851748, 1, 1, 1, 1, 1,
0.2982615, -0.4344516, 1.726056, 1, 1, 1, 1, 1,
0.2999805, 0.5025545, 0.03359835, 1, 1, 1, 1, 1,
0.3019307, 1.97641, 1.575712, 1, 1, 1, 1, 1,
0.3071251, 0.03407221, 2.141715, 1, 1, 1, 1, 1,
0.3084006, -0.01000006, 1.223612, 0, 0, 1, 1, 1,
0.3103322, -0.6584194, 1.610051, 1, 0, 0, 1, 1,
0.310557, -0.7438598, 2.182566, 1, 0, 0, 1, 1,
0.3132948, 0.5606912, 0.7871277, 1, 0, 0, 1, 1,
0.3159769, -1.060763, 2.775192, 1, 0, 0, 1, 1,
0.3199208, 0.1546348, 0.7937977, 1, 0, 0, 1, 1,
0.3235166, 0.07946275, 0.6470131, 0, 0, 0, 1, 1,
0.3271687, 0.8870891, 0.5072938, 0, 0, 0, 1, 1,
0.3287143, 0.3257037, 0.249855, 0, 0, 0, 1, 1,
0.3302009, 0.6918349, 0.8641692, 0, 0, 0, 1, 1,
0.3309838, -0.869702, 3.108993, 0, 0, 0, 1, 1,
0.3318499, -0.6474011, 4.393853, 0, 0, 0, 1, 1,
0.3320285, 0.3777905, -0.1335813, 0, 0, 0, 1, 1,
0.33926, -1.109434, 2.023633, 1, 1, 1, 1, 1,
0.3399482, 1.70534, 0.0355542, 1, 1, 1, 1, 1,
0.3401057, -1.018863, 1.834389, 1, 1, 1, 1, 1,
0.3410591, -0.5045307, 0.9971002, 1, 1, 1, 1, 1,
0.3432399, 0.5862387, -0.3913107, 1, 1, 1, 1, 1,
0.3440255, -0.5505035, 4.446513, 1, 1, 1, 1, 1,
0.3441838, 0.37736, 1.888479, 1, 1, 1, 1, 1,
0.3456613, 0.39248, -0.3416898, 1, 1, 1, 1, 1,
0.3537994, 0.6634538, -0.05105792, 1, 1, 1, 1, 1,
0.3563057, 2.0962, 1.348101, 1, 1, 1, 1, 1,
0.3577673, -0.2055187, 1.478044, 1, 1, 1, 1, 1,
0.3611321, 0.1706918, 2.371662, 1, 1, 1, 1, 1,
0.3657003, 0.5724386, 0.6861175, 1, 1, 1, 1, 1,
0.3657773, 0.4225149, 0.7650311, 1, 1, 1, 1, 1,
0.366876, 1.414743, -2.376322, 1, 1, 1, 1, 1,
0.3705155, -0.5559681, 2.891174, 0, 0, 1, 1, 1,
0.3705864, -0.7540219, 0.1219944, 1, 0, 0, 1, 1,
0.3717526, -0.02535103, -0.4502681, 1, 0, 0, 1, 1,
0.3798795, -0.1488876, 1.121323, 1, 0, 0, 1, 1,
0.3828637, -1.874962, 4.250372, 1, 0, 0, 1, 1,
0.3869894, -1.398043, 2.910327, 1, 0, 0, 1, 1,
0.3908489, 0.5150428, 2.092868, 0, 0, 0, 1, 1,
0.3910797, 0.2234777, 0.3118676, 0, 0, 0, 1, 1,
0.3919453, 0.6168796, -1.676633, 0, 0, 0, 1, 1,
0.3962366, 0.3241892, 1.193658, 0, 0, 0, 1, 1,
0.4045648, -0.6416525, 1.451431, 0, 0, 0, 1, 1,
0.4048058, -0.2549782, 1.447004, 0, 0, 0, 1, 1,
0.404959, -0.07549746, 2.156881, 0, 0, 0, 1, 1,
0.4051172, -0.482786, 2.562829, 1, 1, 1, 1, 1,
0.4082753, -0.5638908, 2.697655, 1, 1, 1, 1, 1,
0.415472, 0.1831664, 3.053562, 1, 1, 1, 1, 1,
0.4198326, -0.9665604, 4.194361, 1, 1, 1, 1, 1,
0.4262065, 0.562313, 0.5672824, 1, 1, 1, 1, 1,
0.4264486, 0.8164993, 1.319682, 1, 1, 1, 1, 1,
0.4296907, -0.6025826, 4.102931, 1, 1, 1, 1, 1,
0.4300481, 1.345336, 2.162203, 1, 1, 1, 1, 1,
0.4327755, 1.143694, 0.362911, 1, 1, 1, 1, 1,
0.4357359, 0.6910186, 0.7967707, 1, 1, 1, 1, 1,
0.4408171, -2.026314, 3.561291, 1, 1, 1, 1, 1,
0.4448109, 0.5957268, 1.961276, 1, 1, 1, 1, 1,
0.4504432, -0.3931307, 0.6985278, 1, 1, 1, 1, 1,
0.4531561, -0.2902088, 2.861436, 1, 1, 1, 1, 1,
0.4542125, 0.3995794, 0.7940952, 1, 1, 1, 1, 1,
0.4571958, 1.058593, 2.648764, 0, 0, 1, 1, 1,
0.4643411, 1.448798, 0.4272287, 1, 0, 0, 1, 1,
0.4653351, -0.2803762, 2.380798, 1, 0, 0, 1, 1,
0.4725409, 0.9957765, 1.293761, 1, 0, 0, 1, 1,
0.4790644, -1.398939, 0.9584896, 1, 0, 0, 1, 1,
0.4794601, 0.1399506, 2.683668, 1, 0, 0, 1, 1,
0.479659, 0.2735027, 1.658403, 0, 0, 0, 1, 1,
0.4808924, -1.079099, 1.598887, 0, 0, 0, 1, 1,
0.4837118, 0.2729923, 1.400636, 0, 0, 0, 1, 1,
0.4844705, 1.503709, 0.4866331, 0, 0, 0, 1, 1,
0.4921305, -1.51028, 0.8416106, 0, 0, 0, 1, 1,
0.4972731, 1.284327, -0.322338, 0, 0, 0, 1, 1,
0.498227, -0.1639547, 2.191684, 0, 0, 0, 1, 1,
0.5010881, 2.003974, -0.731521, 1, 1, 1, 1, 1,
0.5019361, 1.274031, -0.01080479, 1, 1, 1, 1, 1,
0.5021209, -1.366768, 0.9146149, 1, 1, 1, 1, 1,
0.5021434, -0.1408773, 3.294769, 1, 1, 1, 1, 1,
0.5022111, -0.8277904, 5.765335, 1, 1, 1, 1, 1,
0.5027155, 0.1422733, 1.002365, 1, 1, 1, 1, 1,
0.5108638, 0.6062762, 0.7481585, 1, 1, 1, 1, 1,
0.5140434, -1.432049, 3.463312, 1, 1, 1, 1, 1,
0.5176398, 1.061913, -1.14337, 1, 1, 1, 1, 1,
0.5183776, 0.6714905, -0.5896225, 1, 1, 1, 1, 1,
0.5240494, -0.02684834, -0.5361128, 1, 1, 1, 1, 1,
0.5281421, -1.435188, 1.903479, 1, 1, 1, 1, 1,
0.5308693, 0.9846927, 0.7584336, 1, 1, 1, 1, 1,
0.5337171, -0.7281289, 2.744605, 1, 1, 1, 1, 1,
0.540773, -0.4370783, 0.58751, 1, 1, 1, 1, 1,
0.545361, -1.986002, 2.548175, 0, 0, 1, 1, 1,
0.5464673, -0.9017556, 1.615143, 1, 0, 0, 1, 1,
0.5513331, -0.3260697, 2.237259, 1, 0, 0, 1, 1,
0.552359, -2.827227, 1.915879, 1, 0, 0, 1, 1,
0.5585988, 0.9020207, 1.889165, 1, 0, 0, 1, 1,
0.5588095, -0.6314499, 2.950432, 1, 0, 0, 1, 1,
0.5681887, -1.905736, 2.399352, 0, 0, 0, 1, 1,
0.5716614, -0.2507987, 2.788522, 0, 0, 0, 1, 1,
0.5717022, 1.196646, 0.2505063, 0, 0, 0, 1, 1,
0.5725916, -0.7024341, 3.370695, 0, 0, 0, 1, 1,
0.576286, 0.1617323, 1.572747, 0, 0, 0, 1, 1,
0.5766923, -0.08776363, 4.20239, 0, 0, 0, 1, 1,
0.5767959, -0.3877231, 2.716946, 0, 0, 0, 1, 1,
0.57926, 0.2178164, 2.542865, 1, 1, 1, 1, 1,
0.5834993, -0.4274819, 1.189629, 1, 1, 1, 1, 1,
0.5847043, -0.1476013, 2.951239, 1, 1, 1, 1, 1,
0.5860083, 0.4556308, 2.127303, 1, 1, 1, 1, 1,
0.5893927, -0.09825879, 2.527302, 1, 1, 1, 1, 1,
0.5922999, 0.5923297, 1.114062, 1, 1, 1, 1, 1,
0.5923038, -0.9650878, 4.454457, 1, 1, 1, 1, 1,
0.5957443, 0.7811021, 1.633349, 1, 1, 1, 1, 1,
0.5963401, -0.5012047, 2.012176, 1, 1, 1, 1, 1,
0.5971032, 0.4185757, 0.8494831, 1, 1, 1, 1, 1,
0.5984863, 1.523607, 0.999008, 1, 1, 1, 1, 1,
0.5985688, -0.3220308, 1.062672, 1, 1, 1, 1, 1,
0.5989705, 1.88678, 0.08550157, 1, 1, 1, 1, 1,
0.6024937, 0.7511435, 0.8459794, 1, 1, 1, 1, 1,
0.6058303, -2.015962, 3.712671, 1, 1, 1, 1, 1,
0.6061503, 1.597847, 2.060849, 0, 0, 1, 1, 1,
0.6093262, -0.5639254, 2.507806, 1, 0, 0, 1, 1,
0.6099262, -0.1178946, 3.471349, 1, 0, 0, 1, 1,
0.6182937, -0.5417605, 3.264782, 1, 0, 0, 1, 1,
0.6197688, -1.91, 0.3047326, 1, 0, 0, 1, 1,
0.6214566, -1.178488, 3.318668, 1, 0, 0, 1, 1,
0.6250188, -0.7284237, 1.786754, 0, 0, 0, 1, 1,
0.6280626, -0.242501, 0.07988207, 0, 0, 0, 1, 1,
0.6281356, 0.4548409, -0.8082325, 0, 0, 0, 1, 1,
0.6293476, -0.9107047, 1.791493, 0, 0, 0, 1, 1,
0.6295104, -1.213463, 3.945339, 0, 0, 0, 1, 1,
0.6352884, -0.2706549, 2.583372, 0, 0, 0, 1, 1,
0.636281, -2.393748, 2.315052, 0, 0, 0, 1, 1,
0.6485623, -0.03002905, 1.838426, 1, 1, 1, 1, 1,
0.6499786, -0.7024714, 2.412664, 1, 1, 1, 1, 1,
0.6522675, 0.4380315, 1.406591, 1, 1, 1, 1, 1,
0.6531931, 0.8905334, 0.6004121, 1, 1, 1, 1, 1,
0.6565372, 1.791801, -1.609067, 1, 1, 1, 1, 1,
0.6590255, -0.4641112, 2.480777, 1, 1, 1, 1, 1,
0.6595835, 1.438698, 1.420852, 1, 1, 1, 1, 1,
0.6655267, 0.746694, 0.6595953, 1, 1, 1, 1, 1,
0.6918791, -0.4339803, 2.118671, 1, 1, 1, 1, 1,
0.6952027, -0.5481626, 2.461385, 1, 1, 1, 1, 1,
0.6955038, -0.01649592, 1.878346, 1, 1, 1, 1, 1,
0.6965248, -0.9683247, 0.9036229, 1, 1, 1, 1, 1,
0.7027882, 0.09719915, 1.417758, 1, 1, 1, 1, 1,
0.7033352, -0.3056439, 0.1506542, 1, 1, 1, 1, 1,
0.7084347, -0.2149942, 2.411516, 1, 1, 1, 1, 1,
0.7119899, -0.6614065, 1.730865, 0, 0, 1, 1, 1,
0.7145069, 0.131391, 1.423697, 1, 0, 0, 1, 1,
0.7180628, -1.612022, 3.206224, 1, 0, 0, 1, 1,
0.7188786, 0.7792176, 1.214497, 1, 0, 0, 1, 1,
0.7196941, 0.6969768, 1.140977, 1, 0, 0, 1, 1,
0.7270308, 0.8603602, 1.71255, 1, 0, 0, 1, 1,
0.7281243, 1.781983, -1.022153, 0, 0, 0, 1, 1,
0.7303889, 0.1345042, 2.429573, 0, 0, 0, 1, 1,
0.7398148, -0.4366344, 1.029078, 0, 0, 0, 1, 1,
0.742744, 0.6403707, -0.2192678, 0, 0, 0, 1, 1,
0.75382, -0.6504345, 1.387117, 0, 0, 0, 1, 1,
0.7578224, -0.5921858, 2.055442, 0, 0, 0, 1, 1,
0.7611469, 0.9383273, 0.2889272, 0, 0, 0, 1, 1,
0.7636164, 0.4012432, 0.479821, 1, 1, 1, 1, 1,
0.7676004, -1.011941, 1.615582, 1, 1, 1, 1, 1,
0.7789391, -0.1184884, 4.037552, 1, 1, 1, 1, 1,
0.7865677, -1.284742, 3.821856, 1, 1, 1, 1, 1,
0.7914053, -1.155106, 2.645462, 1, 1, 1, 1, 1,
0.7915898, -1.251854, 3.136001, 1, 1, 1, 1, 1,
0.795296, -0.9139175, 1.921774, 1, 1, 1, 1, 1,
0.7996894, -0.9216202, 2.410631, 1, 1, 1, 1, 1,
0.802816, 0.5152358, 0.1109156, 1, 1, 1, 1, 1,
0.8036681, 2.104579, 0.05145966, 1, 1, 1, 1, 1,
0.807578, 0.9994574, 0.7705179, 1, 1, 1, 1, 1,
0.8138745, -1.635324, 3.066205, 1, 1, 1, 1, 1,
0.8191579, 0.4085662, 2.864887, 1, 1, 1, 1, 1,
0.8198546, -0.2414019, 0.7806307, 1, 1, 1, 1, 1,
0.8221627, -2.216446, 2.187708, 1, 1, 1, 1, 1,
0.8226175, 1.617806, 0.4243945, 0, 0, 1, 1, 1,
0.823876, -0.2128758, 1.355892, 1, 0, 0, 1, 1,
0.8325577, -0.827317, 3.722235, 1, 0, 0, 1, 1,
0.8327515, 0.7725464, 1.167516, 1, 0, 0, 1, 1,
0.8332596, 0.4608195, 1.494006, 1, 0, 0, 1, 1,
0.8346159, 1.216012, -0.487556, 1, 0, 0, 1, 1,
0.8361169, -1.195839, 2.508865, 0, 0, 0, 1, 1,
0.8371819, 1.956757, 0.4286524, 0, 0, 0, 1, 1,
0.8398383, 0.9542886, 1.244735, 0, 0, 0, 1, 1,
0.8420899, 0.445881, 1.560245, 0, 0, 0, 1, 1,
0.8454776, 0.1745434, 1.429546, 0, 0, 0, 1, 1,
0.8527354, 0.6502268, 1.323673, 0, 0, 0, 1, 1,
0.8553859, 1.204083, 3.05758, 0, 0, 0, 1, 1,
0.857311, -0.4548154, 0.9049301, 1, 1, 1, 1, 1,
0.8586141, 0.6989259, -0.3070523, 1, 1, 1, 1, 1,
0.8602247, 0.4109503, -1.071993, 1, 1, 1, 1, 1,
0.8608933, -0.3856987, 4.422095, 1, 1, 1, 1, 1,
0.8629176, -1.103897, 2.713933, 1, 1, 1, 1, 1,
0.8659949, -0.5817821, 1.234535, 1, 1, 1, 1, 1,
0.8689486, 1.152967, 1.855425, 1, 1, 1, 1, 1,
0.8826834, -0.6940041, 2.8545, 1, 1, 1, 1, 1,
0.8839637, 0.597612, 2.13164, 1, 1, 1, 1, 1,
0.8906574, -0.02712411, 2.741502, 1, 1, 1, 1, 1,
0.9010801, -1.091219, 4.812011, 1, 1, 1, 1, 1,
0.9033123, 0.6966251, 0.9470078, 1, 1, 1, 1, 1,
0.9067091, -0.2139867, 3.501094, 1, 1, 1, 1, 1,
0.9070517, -0.03907746, 2.025015, 1, 1, 1, 1, 1,
0.9098228, -1.915246, 1.143514, 1, 1, 1, 1, 1,
0.9108596, -0.2400855, 2.38674, 0, 0, 1, 1, 1,
0.914901, 0.05040019, 2.374054, 1, 0, 0, 1, 1,
0.9176849, -0.8568542, 3.033046, 1, 0, 0, 1, 1,
0.9207479, 2.031326, 1.567066, 1, 0, 0, 1, 1,
0.9261398, 1.367722, -0.1366506, 1, 0, 0, 1, 1,
0.9326937, -0.9131239, 2.594257, 1, 0, 0, 1, 1,
0.9349765, -0.8229557, 0.5968201, 0, 0, 0, 1, 1,
0.9363649, 0.5302741, 0.4928516, 0, 0, 0, 1, 1,
0.940159, -1.21561, 3.250849, 0, 0, 0, 1, 1,
0.9462631, 0.1720017, -0.3893605, 0, 0, 0, 1, 1,
0.9482133, 1.083668, 1.689025, 0, 0, 0, 1, 1,
0.9592514, 0.8757857, 0.8453854, 0, 0, 0, 1, 1,
0.9680163, -0.8744851, 3.559995, 0, 0, 0, 1, 1,
0.9704448, 0.1456527, 0.8142406, 1, 1, 1, 1, 1,
0.972807, -0.0274622, 1.955454, 1, 1, 1, 1, 1,
0.9744851, 0.440555, 2.611258, 1, 1, 1, 1, 1,
0.98224, 0.9542368, -0.7994233, 1, 1, 1, 1, 1,
0.9834441, -0.727181, 1.877718, 1, 1, 1, 1, 1,
0.9966705, -0.06156934, 0.7803291, 1, 1, 1, 1, 1,
1.008445, -0.7667369, 2.75363, 1, 1, 1, 1, 1,
1.012706, -0.7342464, -0.3740517, 1, 1, 1, 1, 1,
1.016141, -1.4972, 3.027876, 1, 1, 1, 1, 1,
1.028084, -0.01646262, 3.076146, 1, 1, 1, 1, 1,
1.032257, 1.461131, -0.3066922, 1, 1, 1, 1, 1,
1.050658, 0.3911601, -0.299191, 1, 1, 1, 1, 1,
1.051558, -1.106408, 0.698167, 1, 1, 1, 1, 1,
1.05349, -1.84136, 3.153085, 1, 1, 1, 1, 1,
1.065571, -0.03412125, 0.8560815, 1, 1, 1, 1, 1,
1.068132, -0.1139928, 1.344138, 0, 0, 1, 1, 1,
1.070953, 1.803206, 0.2982848, 1, 0, 0, 1, 1,
1.073737, 0.2366315, 1.907444, 1, 0, 0, 1, 1,
1.07424, 0.3133988, 0.376038, 1, 0, 0, 1, 1,
1.081654, -0.2508156, 3.154309, 1, 0, 0, 1, 1,
1.086779, 0.8464834, 1.97745, 1, 0, 0, 1, 1,
1.087499, 0.5311075, 1.764964, 0, 0, 0, 1, 1,
1.090984, -0.6356182, 2.944998, 0, 0, 0, 1, 1,
1.097509, 2.68032, 1.003346, 0, 0, 0, 1, 1,
1.107694, 0.5965068, -0.9608319, 0, 0, 0, 1, 1,
1.111572, 0.2194257, 0.8864447, 0, 0, 0, 1, 1,
1.129041, 0.08236967, 0.1664409, 0, 0, 0, 1, 1,
1.140041, 1.035435, 0.5631547, 0, 0, 0, 1, 1,
1.14474, -1.311445, 1.783647, 1, 1, 1, 1, 1,
1.148788, -0.4038804, 2.823958, 1, 1, 1, 1, 1,
1.148819, 0.6640633, 1.058022, 1, 1, 1, 1, 1,
1.149498, 1.328596, 0.04043527, 1, 1, 1, 1, 1,
1.149776, 0.04075636, 2.146763, 1, 1, 1, 1, 1,
1.154121, 1.101916, 0.5095446, 1, 1, 1, 1, 1,
1.156517, 0.5457381, -0.3431459, 1, 1, 1, 1, 1,
1.158186, -1.708075, 4.125797, 1, 1, 1, 1, 1,
1.164508, 0.2384122, 0.1243292, 1, 1, 1, 1, 1,
1.171973, -1.11477, 3.9041, 1, 1, 1, 1, 1,
1.176516, -0.6075935, 1.08484, 1, 1, 1, 1, 1,
1.182999, -0.8797828, 1.517159, 1, 1, 1, 1, 1,
1.183799, -0.5858122, 3.258005, 1, 1, 1, 1, 1,
1.187352, 0.1511809, 0.9718106, 1, 1, 1, 1, 1,
1.189468, -1.710946, 2.529807, 1, 1, 1, 1, 1,
1.193293, 1.246023, -0.0928247, 0, 0, 1, 1, 1,
1.193669, -0.9981108, -0.5172364, 1, 0, 0, 1, 1,
1.203591, 1.009429, 0.6318774, 1, 0, 0, 1, 1,
1.20803, -0.8866089, 3.844324, 1, 0, 0, 1, 1,
1.213118, 1.406739, -0.2611482, 1, 0, 0, 1, 1,
1.214907, 1.315968, 1.336316, 1, 0, 0, 1, 1,
1.22804, -0.9222427, 3.411267, 0, 0, 0, 1, 1,
1.234763, -0.5196918, 1.624307, 0, 0, 0, 1, 1,
1.239616, -2.339862, 1.807717, 0, 0, 0, 1, 1,
1.244676, -2.005301, 1.925168, 0, 0, 0, 1, 1,
1.2574, -1.24678, 2.482328, 0, 0, 0, 1, 1,
1.262972, -0.5456253, 3.43169, 0, 0, 0, 1, 1,
1.263954, 1.792125, 2.129813, 0, 0, 0, 1, 1,
1.266529, 0.6432552, 2.730442, 1, 1, 1, 1, 1,
1.272031, -1.299479, 0.8817716, 1, 1, 1, 1, 1,
1.274272, 1.49134, -0.2140308, 1, 1, 1, 1, 1,
1.279651, 1.549776, 1.137002, 1, 1, 1, 1, 1,
1.280012, -1.991638, 1.435958, 1, 1, 1, 1, 1,
1.28784, 0.2524348, 2.066003, 1, 1, 1, 1, 1,
1.30224, 2.060659, 1.639134, 1, 1, 1, 1, 1,
1.305375, 0.4935782, 3.049935, 1, 1, 1, 1, 1,
1.319404, -0.2297642, 2.616575, 1, 1, 1, 1, 1,
1.337417, -0.5778179, 2.501687, 1, 1, 1, 1, 1,
1.349499, 0.3287934, -0.2570499, 1, 1, 1, 1, 1,
1.353724, -0.9775722, 3.748718, 1, 1, 1, 1, 1,
1.361791, 0.04412761, 1.181726, 1, 1, 1, 1, 1,
1.363495, -1.17483, 3.818832, 1, 1, 1, 1, 1,
1.381118, -0.3547942, 1.643626, 1, 1, 1, 1, 1,
1.386139, 0.3935612, 0.3981077, 0, 0, 1, 1, 1,
1.389756, -0.9192174, 2.082234, 1, 0, 0, 1, 1,
1.394935, 1.222773, 0.9375317, 1, 0, 0, 1, 1,
1.399899, -0.5175832, 2.01551, 1, 0, 0, 1, 1,
1.401367, -1.81592, 5.586515, 1, 0, 0, 1, 1,
1.405651, -0.4498184, 2.252069, 1, 0, 0, 1, 1,
1.413883, 1.364649, 1.200686, 0, 0, 0, 1, 1,
1.416297, 0.5403146, 0.7987732, 0, 0, 0, 1, 1,
1.422935, 0.5066298, -1.227826, 0, 0, 0, 1, 1,
1.4239, 0.2657643, 1.756385, 0, 0, 0, 1, 1,
1.433876, -0.5315994, 2.343086, 0, 0, 0, 1, 1,
1.435863, -0.07897346, 0.8457437, 0, 0, 0, 1, 1,
1.440658, -0.6171268, 1.380217, 0, 0, 0, 1, 1,
1.470593, 1.514764, 0.124912, 1, 1, 1, 1, 1,
1.474194, 0.9385204, 0.4352144, 1, 1, 1, 1, 1,
1.486997, 0.1382494, 0.7953368, 1, 1, 1, 1, 1,
1.490122, -0.5267448, 0.1587489, 1, 1, 1, 1, 1,
1.491796, -1.115348, 2.879224, 1, 1, 1, 1, 1,
1.502643, -0.1166648, 1.945884, 1, 1, 1, 1, 1,
1.514024, 0.01495957, 1.156497, 1, 1, 1, 1, 1,
1.514367, 0.1931436, 1.541009, 1, 1, 1, 1, 1,
1.523828, -0.1960279, 1.862753, 1, 1, 1, 1, 1,
1.528975, -0.1833734, 1.498362, 1, 1, 1, 1, 1,
1.529359, 0.3438097, 2.386736, 1, 1, 1, 1, 1,
1.534879, -1.200288, 1.8445, 1, 1, 1, 1, 1,
1.538702, -0.6396334, 1.137, 1, 1, 1, 1, 1,
1.552717, -0.02054434, 0.9638103, 1, 1, 1, 1, 1,
1.555983, -0.1297235, 2.705837, 1, 1, 1, 1, 1,
1.590632, 0.6615065, 2.044102, 0, 0, 1, 1, 1,
1.594744, 0.935145, 1.694476, 1, 0, 0, 1, 1,
1.602299, -1.337022, 1.878466, 1, 0, 0, 1, 1,
1.60948, -1.946827, 2.280475, 1, 0, 0, 1, 1,
1.610559, 2.189621, 0.1220109, 1, 0, 0, 1, 1,
1.617922, -0.6466339, 2.514864, 1, 0, 0, 1, 1,
1.633857, 0.0007946597, 0.3879718, 0, 0, 0, 1, 1,
1.638805, 1.594349, 1.990392, 0, 0, 0, 1, 1,
1.646438, -0.8257062, 3.573122, 0, 0, 0, 1, 1,
1.649989, -0.8726197, 3.605231, 0, 0, 0, 1, 1,
1.654016, 0.1353393, -0.8739058, 0, 0, 0, 1, 1,
1.654681, 0.0761352, 3.195708, 0, 0, 0, 1, 1,
1.660045, -0.8376122, 2.60582, 0, 0, 0, 1, 1,
1.67037, 0.437969, 1.640754, 1, 1, 1, 1, 1,
1.678771, 0.6830003, 1.884468, 1, 1, 1, 1, 1,
1.703678, -0.2236844, 2.531673, 1, 1, 1, 1, 1,
1.78446, 1.83338, 0.5287926, 1, 1, 1, 1, 1,
1.791227, -0.5194094, 2.854329, 1, 1, 1, 1, 1,
1.793643, -0.9568703, 1.068175, 1, 1, 1, 1, 1,
1.835849, -1.055979, 3.125117, 1, 1, 1, 1, 1,
1.873698, 1.25042, 2.023962, 1, 1, 1, 1, 1,
1.878868, 0.4247777, -0.166513, 1, 1, 1, 1, 1,
1.886228, 1.68197, 0.1509685, 1, 1, 1, 1, 1,
1.893633, 2.095785, -0.7028731, 1, 1, 1, 1, 1,
1.89588, 0.2998069, 0.437365, 1, 1, 1, 1, 1,
1.959993, 0.2461445, 2.436831, 1, 1, 1, 1, 1,
1.968606, 0.7274742, 1.543984, 1, 1, 1, 1, 1,
2.013687, -1.078719, 2.694321, 1, 1, 1, 1, 1,
2.021579, 0.6131487, 1.840072, 0, 0, 1, 1, 1,
2.056252, 1.583411, 1.453557, 1, 0, 0, 1, 1,
2.073212, 0.4965595, 1.458544, 1, 0, 0, 1, 1,
2.082638, 0.8738517, 0.794682, 1, 0, 0, 1, 1,
2.083861, -0.8500844, 0.1453558, 1, 0, 0, 1, 1,
2.095167, -1.404086, 2.241867, 1, 0, 0, 1, 1,
2.190696, -1.503714, 2.644583, 0, 0, 0, 1, 1,
2.192774, 0.5167957, 0.01636375, 0, 0, 0, 1, 1,
2.194169, 0.166108, 0.4372615, 0, 0, 0, 1, 1,
2.298288, -1.464277, 2.308717, 0, 0, 0, 1, 1,
2.306702, -0.3912451, -0.01130425, 0, 0, 0, 1, 1,
2.332283, 0.3222689, 1.190544, 0, 0, 0, 1, 1,
2.434314, -0.3627501, 2.2082, 0, 0, 0, 1, 1,
2.437497, 1.096002, -0.4585291, 1, 1, 1, 1, 1,
2.470199, 1.248555, 1.590412, 1, 1, 1, 1, 1,
2.535732, -1.479425, 2.459903, 1, 1, 1, 1, 1,
2.644989, -0.6014921, 2.335463, 1, 1, 1, 1, 1,
2.717554, -0.211327, 1.512122, 1, 1, 1, 1, 1,
2.896561, -0.9160278, 4.160455, 1, 1, 1, 1, 1,
3.926968, 0.163644, 2.903824, 1, 1, 1, 1, 1
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
var radius = 10.01471;
var distance = 35.17625;
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
mvMatrix.translate( -0.4463103, 0.0004777908, -0.2121313 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.17625);
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
