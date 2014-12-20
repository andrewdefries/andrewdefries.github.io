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
-2.752488, -2.551105, -2.358295, 1, 0, 0, 1,
-2.721186, -1.239187, -0.6160863, 1, 0.007843138, 0, 1,
-2.559514, 0.6142172, -1.606175, 1, 0.01176471, 0, 1,
-2.369674, 0.9355906, -1.484229, 1, 0.01960784, 0, 1,
-2.366634, 0.5396123, 0.1339904, 1, 0.02352941, 0, 1,
-2.273989, -0.559907, 0.6267958, 1, 0.03137255, 0, 1,
-2.266509, 0.6571707, -0.1776791, 1, 0.03529412, 0, 1,
-2.207142, -0.2330369, -0.9923804, 1, 0.04313726, 0, 1,
-2.197751, -2.911524, -2.163905, 1, 0.04705882, 0, 1,
-2.147302, -1.43327, -0.673233, 1, 0.05490196, 0, 1,
-2.140884, -0.6760471, -2.352533, 1, 0.05882353, 0, 1,
-2.130449, 0.302239, -1.847065, 1, 0.06666667, 0, 1,
-2.109967, -0.2101922, -2.521958, 1, 0.07058824, 0, 1,
-2.057043, 1.147838, -0.6070294, 1, 0.07843138, 0, 1,
-2.021173, -1.348764, -1.947577, 1, 0.08235294, 0, 1,
-2.006305, -0.4864959, -2.39001, 1, 0.09019608, 0, 1,
-2.000675, -0.5309179, -1.077981, 1, 0.09411765, 0, 1,
-2.000396, -1.555258, -2.188784, 1, 0.1019608, 0, 1,
-1.947467, 0.0162781, -1.135506, 1, 0.1098039, 0, 1,
-1.941352, 0.2394887, 0.2365683, 1, 0.1137255, 0, 1,
-1.878478, 0.2772455, -3.242911, 1, 0.1215686, 0, 1,
-1.849254, 0.2420666, -0.6595227, 1, 0.1254902, 0, 1,
-1.848676, 0.3381357, -2.462932, 1, 0.1333333, 0, 1,
-1.847173, -0.4038863, -1.937628, 1, 0.1372549, 0, 1,
-1.840984, 0.3182822, -1.739027, 1, 0.145098, 0, 1,
-1.806516, -0.6570355, -1.603254, 1, 0.1490196, 0, 1,
-1.804241, -0.513508, -0.7208216, 1, 0.1568628, 0, 1,
-1.797889, -0.4883911, -0.8452354, 1, 0.1607843, 0, 1,
-1.797094, 0.04325878, -0.09097794, 1, 0.1686275, 0, 1,
-1.783443, 0.01711522, -1.496614, 1, 0.172549, 0, 1,
-1.779885, 0.6870259, -3.402796, 1, 0.1803922, 0, 1,
-1.757493, 1.372473, 0.2105637, 1, 0.1843137, 0, 1,
-1.750481, 0.056583, -3.496086, 1, 0.1921569, 0, 1,
-1.748334, -0.405302, -0.4191735, 1, 0.1960784, 0, 1,
-1.747418, -1.156808, -1.061098, 1, 0.2039216, 0, 1,
-1.732357, 0.8779336, -0.863816, 1, 0.2117647, 0, 1,
-1.687147, -0.4169739, -2.6176, 1, 0.2156863, 0, 1,
-1.679163, 0.2563048, -1.46434, 1, 0.2235294, 0, 1,
-1.677153, 1.094019, -1.262618, 1, 0.227451, 0, 1,
-1.673463, 0.02959736, -0.8881122, 1, 0.2352941, 0, 1,
-1.666347, -0.02189005, -1.514873, 1, 0.2392157, 0, 1,
-1.653054, -0.3887233, 0.004628763, 1, 0.2470588, 0, 1,
-1.649888, -0.3262014, -0.8098927, 1, 0.2509804, 0, 1,
-1.635154, 0.7193999, -1.243639, 1, 0.2588235, 0, 1,
-1.632675, -2.433376, -1.35917, 1, 0.2627451, 0, 1,
-1.632295, -0.2036036, -2.256063, 1, 0.2705882, 0, 1,
-1.627879, 0.1294485, -2.554815, 1, 0.2745098, 0, 1,
-1.619766, -0.9503214, -1.249192, 1, 0.282353, 0, 1,
-1.601693, 0.5797712, 0.9336016, 1, 0.2862745, 0, 1,
-1.597082, 0.4987057, -1.236051, 1, 0.2941177, 0, 1,
-1.593142, -0.3879062, -2.451165, 1, 0.3019608, 0, 1,
-1.592134, 1.354881, 0.2034413, 1, 0.3058824, 0, 1,
-1.585231, -0.8184762, -3.177792, 1, 0.3137255, 0, 1,
-1.574125, 0.8085378, -2.41466, 1, 0.3176471, 0, 1,
-1.556374, 1.480806, -2.121705, 1, 0.3254902, 0, 1,
-1.55329, 1.513336, -0.3290461, 1, 0.3294118, 0, 1,
-1.549399, 0.08471175, -3.483558, 1, 0.3372549, 0, 1,
-1.547737, -0.4727448, -2.206625, 1, 0.3411765, 0, 1,
-1.531773, 0.7317309, -0.2877542, 1, 0.3490196, 0, 1,
-1.530769, -1.154984, -2.336679, 1, 0.3529412, 0, 1,
-1.528954, -0.2247512, -2.704817, 1, 0.3607843, 0, 1,
-1.526386, 0.8586971, -1.608225, 1, 0.3647059, 0, 1,
-1.524656, 0.363874, 0.4201173, 1, 0.372549, 0, 1,
-1.521277, -0.1215357, -0.4505493, 1, 0.3764706, 0, 1,
-1.519229, 1.412775, -1.315233, 1, 0.3843137, 0, 1,
-1.518543, -0.2676577, -0.9781973, 1, 0.3882353, 0, 1,
-1.516897, -0.364276, -2.701065, 1, 0.3960784, 0, 1,
-1.505954, -1.326828, -2.577169, 1, 0.4039216, 0, 1,
-1.464472, -0.1315147, -1.070112, 1, 0.4078431, 0, 1,
-1.458118, 0.8384014, -2.993362, 1, 0.4156863, 0, 1,
-1.455472, -0.05884338, -1.159362, 1, 0.4196078, 0, 1,
-1.446334, 0.8657036, -1.381532, 1, 0.427451, 0, 1,
-1.443863, -0.1600025, -0.369234, 1, 0.4313726, 0, 1,
-1.43712, -0.879315, -1.587269, 1, 0.4392157, 0, 1,
-1.430777, 0.2163453, -1.499269, 1, 0.4431373, 0, 1,
-1.420226, -0.007712334, -1.791342, 1, 0.4509804, 0, 1,
-1.420074, -0.6024846, -1.327703, 1, 0.454902, 0, 1,
-1.417398, 0.8388088, -0.1377793, 1, 0.4627451, 0, 1,
-1.405196, 1.900039, -0.734141, 1, 0.4666667, 0, 1,
-1.399203, -1.289608, -0.8928059, 1, 0.4745098, 0, 1,
-1.395068, 1.512193, -2.380954, 1, 0.4784314, 0, 1,
-1.39314, -0.281219, -2.118239, 1, 0.4862745, 0, 1,
-1.383345, 1.099879, -2.207351, 1, 0.4901961, 0, 1,
-1.378167, -0.5717868, -1.224175, 1, 0.4980392, 0, 1,
-1.370685, 0.3746428, 0.146251, 1, 0.5058824, 0, 1,
-1.364257, 1.152813, -0.2741916, 1, 0.509804, 0, 1,
-1.35426, -1.134723, -2.312466, 1, 0.5176471, 0, 1,
-1.353185, 1.379128, -1.499334, 1, 0.5215687, 0, 1,
-1.342349, 0.2549469, -2.196908, 1, 0.5294118, 0, 1,
-1.337636, -0.272187, -3.227292, 1, 0.5333334, 0, 1,
-1.327697, -0.3261334, -1.160102, 1, 0.5411765, 0, 1,
-1.318935, -0.2964085, -2.036091, 1, 0.5450981, 0, 1,
-1.318207, 0.8842037, -1.850543, 1, 0.5529412, 0, 1,
-1.309755, -0.3723671, -1.137125, 1, 0.5568628, 0, 1,
-1.303709, 1.049577, -0.5265144, 1, 0.5647059, 0, 1,
-1.29216, -0.8027982, -3.639816, 1, 0.5686275, 0, 1,
-1.278467, 1.232197, -1.316883, 1, 0.5764706, 0, 1,
-1.276149, 0.9905615, -1.922721, 1, 0.5803922, 0, 1,
-1.270055, 0.4337355, 0.3727985, 1, 0.5882353, 0, 1,
-1.269687, -0.008614214, -1.239888, 1, 0.5921569, 0, 1,
-1.246871, -1.027416, -2.963163, 1, 0.6, 0, 1,
-1.246756, -0.2324178, -1.435063, 1, 0.6078432, 0, 1,
-1.242383, -0.1370424, -0.9062923, 1, 0.6117647, 0, 1,
-1.23951, -0.6453626, -2.597531, 1, 0.6196079, 0, 1,
-1.232248, 0.8002661, 0.4955066, 1, 0.6235294, 0, 1,
-1.230043, -0.5951695, -1.977637, 1, 0.6313726, 0, 1,
-1.22995, 1.702003, 1.343772, 1, 0.6352941, 0, 1,
-1.221909, -0.3748813, -1.41551, 1, 0.6431373, 0, 1,
-1.213933, 1.90326, -1.89263, 1, 0.6470588, 0, 1,
-1.212254, -0.1134223, 0.3450776, 1, 0.654902, 0, 1,
-1.205962, 1.328524, -0.4386862, 1, 0.6588235, 0, 1,
-1.203472, 1.165631, -0.9404026, 1, 0.6666667, 0, 1,
-1.201834, -1.346826, -1.317436, 1, 0.6705883, 0, 1,
-1.188992, 0.1758061, 0.171377, 1, 0.6784314, 0, 1,
-1.187688, 1.913274, 0.1707574, 1, 0.682353, 0, 1,
-1.180048, 1.181411, -0.4246717, 1, 0.6901961, 0, 1,
-1.179393, 1.063496, -1.410249, 1, 0.6941177, 0, 1,
-1.178502, 0.01225307, -0.1348723, 1, 0.7019608, 0, 1,
-1.175889, 1.116877, -0.5962354, 1, 0.7098039, 0, 1,
-1.167108, -0.7604271, -0.7800006, 1, 0.7137255, 0, 1,
-1.166132, -1.877992, -1.77941, 1, 0.7215686, 0, 1,
-1.159457, 0.2582631, -0.4817033, 1, 0.7254902, 0, 1,
-1.158448, 0.7042252, -0.3397709, 1, 0.7333333, 0, 1,
-1.15667, 0.2222635, -3.613008, 1, 0.7372549, 0, 1,
-1.15135, -0.2806306, -1.300967, 1, 0.7450981, 0, 1,
-1.144932, -0.3264692, -1.540259, 1, 0.7490196, 0, 1,
-1.141672, 1.660615, -0.7690268, 1, 0.7568628, 0, 1,
-1.137364, -0.3379205, -1.461085, 1, 0.7607843, 0, 1,
-1.134768, -1.381739, -3.982295, 1, 0.7686275, 0, 1,
-1.130718, 0.9526486, -0.7408655, 1, 0.772549, 0, 1,
-1.11829, -1.873434, -4.32238, 1, 0.7803922, 0, 1,
-1.117213, 1.987961, 0.2384804, 1, 0.7843137, 0, 1,
-1.112382, -1.044367, -0.9334245, 1, 0.7921569, 0, 1,
-1.112317, 0.3598475, 0.7295284, 1, 0.7960784, 0, 1,
-1.112314, -0.7389076, -1.767391, 1, 0.8039216, 0, 1,
-1.108285, -1.942027, -1.526474, 1, 0.8117647, 0, 1,
-1.103951, -0.7593703, -1.174868, 1, 0.8156863, 0, 1,
-1.087933, 0.1446209, -3.743034, 1, 0.8235294, 0, 1,
-1.087926, -0.1242025, -2.758046, 1, 0.827451, 0, 1,
-1.084545, -3.112559, -2.187028, 1, 0.8352941, 0, 1,
-1.082491, -1.348146, -2.486211, 1, 0.8392157, 0, 1,
-1.080021, -0.4281977, -0.1405495, 1, 0.8470588, 0, 1,
-1.077878, -0.9379802, -2.235308, 1, 0.8509804, 0, 1,
-1.059042, -0.584989, -2.617629, 1, 0.8588235, 0, 1,
-1.058893, -0.1961465, -3.186639, 1, 0.8627451, 0, 1,
-1.05363, 0.4968915, -0.007343908, 1, 0.8705882, 0, 1,
-1.04188, 0.06155812, -3.972521, 1, 0.8745098, 0, 1,
-1.040037, 0.3973553, 0.2525566, 1, 0.8823529, 0, 1,
-1.036226, -1.252946, -2.886456, 1, 0.8862745, 0, 1,
-1.0358, 2.200148, 0.5833757, 1, 0.8941177, 0, 1,
-1.029935, -1.267122, -4.224154, 1, 0.8980392, 0, 1,
-1.026954, -0.2483625, -0.1688154, 1, 0.9058824, 0, 1,
-1.026846, -2.246325, -4.921412, 1, 0.9137255, 0, 1,
-1.014931, -0.8643619, -0.6800075, 1, 0.9176471, 0, 1,
-1.007549, -0.4568459, -1.262606, 1, 0.9254902, 0, 1,
-1.006841, -1.138333, -2.157884, 1, 0.9294118, 0, 1,
-1.001382, 1.001991, -1.278016, 1, 0.9372549, 0, 1,
-1.001088, 0.2238672, -1.317935, 1, 0.9411765, 0, 1,
-0.9973137, 0.5386401, -1.128911, 1, 0.9490196, 0, 1,
-0.9884352, 0.130461, -3.04446, 1, 0.9529412, 0, 1,
-0.9857432, -0.8306434, -1.865876, 1, 0.9607843, 0, 1,
-0.9830787, -0.1216579, -1.01135, 1, 0.9647059, 0, 1,
-0.9775888, -2.073762, -3.190084, 1, 0.972549, 0, 1,
-0.9761088, -1.059856, -2.953136, 1, 0.9764706, 0, 1,
-0.9741702, -0.842932, -1.459654, 1, 0.9843137, 0, 1,
-0.972448, 0.5733765, -2.43187, 1, 0.9882353, 0, 1,
-0.9665743, -1.853651, -2.321201, 1, 0.9960784, 0, 1,
-0.9608527, -0.2285603, -2.060326, 0.9960784, 1, 0, 1,
-0.9605263, -0.8037657, -0.5897469, 0.9921569, 1, 0, 1,
-0.9584435, -0.6699733, -2.127086, 0.9843137, 1, 0, 1,
-0.9577856, -0.4630091, -0.3747992, 0.9803922, 1, 0, 1,
-0.9570259, -1.371458, -3.111887, 0.972549, 1, 0, 1,
-0.9530729, 0.1933219, -0.7854625, 0.9686275, 1, 0, 1,
-0.9465256, 1.477755, -1.64718, 0.9607843, 1, 0, 1,
-0.9445885, 0.4406239, -2.146549, 0.9568627, 1, 0, 1,
-0.939121, 1.790082, -1.229636, 0.9490196, 1, 0, 1,
-0.934486, -0.6825589, -3.208569, 0.945098, 1, 0, 1,
-0.9343479, 0.5121806, -1.000271, 0.9372549, 1, 0, 1,
-0.9266946, -0.4583051, -0.2632478, 0.9333333, 1, 0, 1,
-0.9255257, 1.342507, 0.7906065, 0.9254902, 1, 0, 1,
-0.9205395, -0.8078919, -2.334642, 0.9215686, 1, 0, 1,
-0.9128291, -0.4262314, -0.6746839, 0.9137255, 1, 0, 1,
-0.9068168, -0.5262768, -1.723831, 0.9098039, 1, 0, 1,
-0.8982912, -0.7794974, -2.644867, 0.9019608, 1, 0, 1,
-0.8979675, 1.626016, -0.2963409, 0.8941177, 1, 0, 1,
-0.8929944, 0.1658095, -2.026114, 0.8901961, 1, 0, 1,
-0.8802886, 0.5255311, -0.4352798, 0.8823529, 1, 0, 1,
-0.8782515, 1.404037, -1.277693, 0.8784314, 1, 0, 1,
-0.8734053, 0.2369624, -0.8461039, 0.8705882, 1, 0, 1,
-0.8719831, -0.4273207, -2.292197, 0.8666667, 1, 0, 1,
-0.8716211, -0.44502, -1.095355, 0.8588235, 1, 0, 1,
-0.8678888, -1.908467, -2.031935, 0.854902, 1, 0, 1,
-0.8670056, 1.63259, -0.2023484, 0.8470588, 1, 0, 1,
-0.8647242, -0.09689654, -1.995057, 0.8431373, 1, 0, 1,
-0.864535, 1.595407, -2.098908, 0.8352941, 1, 0, 1,
-0.8604224, -1.296786, -3.338711, 0.8313726, 1, 0, 1,
-0.8499985, -0.569108, -1.969615, 0.8235294, 1, 0, 1,
-0.8462875, -0.06899454, -3.200963, 0.8196079, 1, 0, 1,
-0.8461165, -0.1359365, -1.434473, 0.8117647, 1, 0, 1,
-0.8389307, 0.3013085, -1.314989, 0.8078431, 1, 0, 1,
-0.8343419, 0.4054657, -1.23171, 0.8, 1, 0, 1,
-0.8308132, -0.2882417, -2.264617, 0.7921569, 1, 0, 1,
-0.8250915, 0.01360633, -1.730125, 0.7882353, 1, 0, 1,
-0.8222669, -0.7474342, -2.47621, 0.7803922, 1, 0, 1,
-0.8196561, 0.9021477, -0.5378306, 0.7764706, 1, 0, 1,
-0.8188448, 0.8543493, -1.848741, 0.7686275, 1, 0, 1,
-0.8106272, 1.347656, -0.1070262, 0.7647059, 1, 0, 1,
-0.8056409, 0.2551941, -1.547403, 0.7568628, 1, 0, 1,
-0.798875, -0.4161006, -0.9627969, 0.7529412, 1, 0, 1,
-0.7948767, -0.4503912, -1.981389, 0.7450981, 1, 0, 1,
-0.7934967, -0.4929111, -2.240585, 0.7411765, 1, 0, 1,
-0.7929184, -1.872091, -4.43611, 0.7333333, 1, 0, 1,
-0.7800602, 0.6045288, 1.973839, 0.7294118, 1, 0, 1,
-0.779662, 1.135739, -1.294861, 0.7215686, 1, 0, 1,
-0.7787857, 0.1844668, -1.799275, 0.7176471, 1, 0, 1,
-0.775863, 0.8204582, -0.5096899, 0.7098039, 1, 0, 1,
-0.7712693, -0.1800305, -0.3582489, 0.7058824, 1, 0, 1,
-0.7688766, -0.6229341, -0.7278359, 0.6980392, 1, 0, 1,
-0.7672084, -0.2887887, -1.72714, 0.6901961, 1, 0, 1,
-0.7583939, -2.418427, -2.212841, 0.6862745, 1, 0, 1,
-0.7576064, 1.352794, 1.650631, 0.6784314, 1, 0, 1,
-0.7508606, 0.9866932, -1.818425, 0.6745098, 1, 0, 1,
-0.74733, -0.0782593, -1.465447, 0.6666667, 1, 0, 1,
-0.7438263, -0.1190007, -1.779268, 0.6627451, 1, 0, 1,
-0.7375184, 0.06323067, -1.017066, 0.654902, 1, 0, 1,
-0.7366479, 3.085042, -0.6881269, 0.6509804, 1, 0, 1,
-0.7359103, -0.3382921, -0.9266837, 0.6431373, 1, 0, 1,
-0.7302198, -0.2011129, -2.356036, 0.6392157, 1, 0, 1,
-0.72977, 2.797995, 0.228753, 0.6313726, 1, 0, 1,
-0.7275103, 1.576678, 0.3199075, 0.627451, 1, 0, 1,
-0.7193616, 1.145184, 0.8682024, 0.6196079, 1, 0, 1,
-0.7190918, -0.6587139, -2.813556, 0.6156863, 1, 0, 1,
-0.7078103, -0.6452684, -2.613345, 0.6078432, 1, 0, 1,
-0.6946405, -0.7061947, -0.651344, 0.6039216, 1, 0, 1,
-0.6936703, 0.5802027, -0.7842104, 0.5960785, 1, 0, 1,
-0.6894538, -0.4179066, -2.104178, 0.5882353, 1, 0, 1,
-0.6872666, -0.3706652, -0.9769718, 0.5843138, 1, 0, 1,
-0.6798866, -0.797762, -1.490461, 0.5764706, 1, 0, 1,
-0.6775341, 0.3746172, 0.2814648, 0.572549, 1, 0, 1,
-0.6754956, -0.6759644, -2.721758, 0.5647059, 1, 0, 1,
-0.6730529, -0.2738873, -1.857993, 0.5607843, 1, 0, 1,
-0.6677982, 1.319462, -0.4424638, 0.5529412, 1, 0, 1,
-0.6656198, 0.1523898, -0.154586, 0.5490196, 1, 0, 1,
-0.6643109, -0.09626643, -1.988609, 0.5411765, 1, 0, 1,
-0.6640195, -0.7904009, -2.958299, 0.5372549, 1, 0, 1,
-0.6629322, -0.9475191, -2.243095, 0.5294118, 1, 0, 1,
-0.6625653, -0.4710048, -0.4596366, 0.5254902, 1, 0, 1,
-0.6620244, -1.177573, -3.34299, 0.5176471, 1, 0, 1,
-0.6593632, 0.6802138, 0.25056, 0.5137255, 1, 0, 1,
-0.6485057, 1.015787, -1.13594, 0.5058824, 1, 0, 1,
-0.6466252, -0.2989133, -2.935501, 0.5019608, 1, 0, 1,
-0.6449907, 0.1484889, -2.327793, 0.4941176, 1, 0, 1,
-0.6446086, -0.189949, -2.696418, 0.4862745, 1, 0, 1,
-0.6427807, -0.7215353, -2.038895, 0.4823529, 1, 0, 1,
-0.6427638, -0.8479319, -1.505027, 0.4745098, 1, 0, 1,
-0.6372235, 1.270903, 0.2475084, 0.4705882, 1, 0, 1,
-0.637116, 0.5734012, -1.201262, 0.4627451, 1, 0, 1,
-0.6360384, -0.7729235, -1.990541, 0.4588235, 1, 0, 1,
-0.6317555, -0.5210958, -2.125918, 0.4509804, 1, 0, 1,
-0.6288285, 0.810797, -0.9921811, 0.4470588, 1, 0, 1,
-0.6287264, 1.288465, 0.4739637, 0.4392157, 1, 0, 1,
-0.6246199, 0.6053244, -1.842089, 0.4352941, 1, 0, 1,
-0.6228828, -0.1816112, -0.7519776, 0.427451, 1, 0, 1,
-0.6161161, 0.2588285, -1.121949, 0.4235294, 1, 0, 1,
-0.6127217, -1.285294, -3.946306, 0.4156863, 1, 0, 1,
-0.6037828, 0.7386666, 0.01056369, 0.4117647, 1, 0, 1,
-0.6020297, 0.07772126, -1.738181, 0.4039216, 1, 0, 1,
-0.5996957, 0.01062742, -1.606319, 0.3960784, 1, 0, 1,
-0.5989885, -0.05314123, -3.038893, 0.3921569, 1, 0, 1,
-0.5967458, -3.697383, -3.361626, 0.3843137, 1, 0, 1,
-0.5944922, 0.7968656, 0.711795, 0.3803922, 1, 0, 1,
-0.588963, 0.07962784, -1.02911, 0.372549, 1, 0, 1,
-0.5863373, -2.322068, -2.824381, 0.3686275, 1, 0, 1,
-0.5838513, -0.5607729, -2.778228, 0.3607843, 1, 0, 1,
-0.5819106, -1.449461, -3.927471, 0.3568628, 1, 0, 1,
-0.5707634, -1.418075, -3.107188, 0.3490196, 1, 0, 1,
-0.5691913, -0.03120023, -2.550934, 0.345098, 1, 0, 1,
-0.5587443, 0.8132305, -0.8018571, 0.3372549, 1, 0, 1,
-0.5574471, 0.1949838, -1.997401, 0.3333333, 1, 0, 1,
-0.5528237, -0.2517095, -0.9429659, 0.3254902, 1, 0, 1,
-0.5524383, 1.36955, 1.145867, 0.3215686, 1, 0, 1,
-0.5496508, 0.2956097, -0.6324686, 0.3137255, 1, 0, 1,
-0.5485054, 0.190323, -2.153193, 0.3098039, 1, 0, 1,
-0.5465811, -1.186345, -1.261667, 0.3019608, 1, 0, 1,
-0.5455295, 0.01281779, -0.9960899, 0.2941177, 1, 0, 1,
-0.5420269, -0.5104336, -0.7577428, 0.2901961, 1, 0, 1,
-0.5410035, -0.3402147, -1.541037, 0.282353, 1, 0, 1,
-0.5329403, 0.7158918, -0.9594789, 0.2784314, 1, 0, 1,
-0.5316702, -0.775439, -2.267068, 0.2705882, 1, 0, 1,
-0.5256084, -0.942195, -4.154904, 0.2666667, 1, 0, 1,
-0.5252151, 0.6879555, -1.676956, 0.2588235, 1, 0, 1,
-0.5209262, -1.57818, -2.737767, 0.254902, 1, 0, 1,
-0.5201918, 0.1983092, 0.6424286, 0.2470588, 1, 0, 1,
-0.5156853, -1.444592, -4.104674, 0.2431373, 1, 0, 1,
-0.5149467, -0.1879065, -1.350365, 0.2352941, 1, 0, 1,
-0.5092433, 0.5929434, -0.9338709, 0.2313726, 1, 0, 1,
-0.504975, 0.7687635, 1.711794, 0.2235294, 1, 0, 1,
-0.5043437, 0.3599086, 1.046722, 0.2196078, 1, 0, 1,
-0.5041499, -0.2134032, -2.117979, 0.2117647, 1, 0, 1,
-0.5036187, 1.625201, -0.1359087, 0.2078431, 1, 0, 1,
-0.5028531, 1.806574, -0.4330836, 0.2, 1, 0, 1,
-0.4989391, -0.002872555, 0.6314663, 0.1921569, 1, 0, 1,
-0.4985154, -0.7225929, -2.846506, 0.1882353, 1, 0, 1,
-0.4930525, -0.3336995, -2.901307, 0.1803922, 1, 0, 1,
-0.4923505, 1.777971, -0.5707436, 0.1764706, 1, 0, 1,
-0.491729, -0.07773279, -1.377229, 0.1686275, 1, 0, 1,
-0.4899118, -0.03913012, -1.912837, 0.1647059, 1, 0, 1,
-0.4876115, -0.3440458, -1.863774, 0.1568628, 1, 0, 1,
-0.4821027, -0.5613165, -2.033075, 0.1529412, 1, 0, 1,
-0.4815756, -0.5057291, -3.296826, 0.145098, 1, 0, 1,
-0.4770488, 0.6486609, -1.876204, 0.1411765, 1, 0, 1,
-0.4755313, -0.01778109, -1.937707, 0.1333333, 1, 0, 1,
-0.4700148, 0.1019935, -3.233371, 0.1294118, 1, 0, 1,
-0.468422, -0.248505, -2.245466, 0.1215686, 1, 0, 1,
-0.4666072, -1.580465, -2.922618, 0.1176471, 1, 0, 1,
-0.4655155, -0.8237959, -2.505094, 0.1098039, 1, 0, 1,
-0.4621225, 0.2970592, -0.4324356, 0.1058824, 1, 0, 1,
-0.4596688, 1.135556, 0.1360696, 0.09803922, 1, 0, 1,
-0.4587148, -1.290442, -2.914012, 0.09019608, 1, 0, 1,
-0.4569868, 0.181019, -1.199169, 0.08627451, 1, 0, 1,
-0.4536743, -0.06381732, -0.8356458, 0.07843138, 1, 0, 1,
-0.4513654, 1.056701, 0.4230543, 0.07450981, 1, 0, 1,
-0.4505015, -1.715195, -2.243562, 0.06666667, 1, 0, 1,
-0.4496316, 0.01840482, -0.8066069, 0.0627451, 1, 0, 1,
-0.4489139, -2.892425, -2.035501, 0.05490196, 1, 0, 1,
-0.4487644, 2.686847, 0.7024702, 0.05098039, 1, 0, 1,
-0.4470925, -0.06305414, -0.5034625, 0.04313726, 1, 0, 1,
-0.44485, 1.444737, 0.7929386, 0.03921569, 1, 0, 1,
-0.4447688, -0.325886, -0.6645192, 0.03137255, 1, 0, 1,
-0.4380189, 0.6789466, -1.268233, 0.02745098, 1, 0, 1,
-0.4372396, -0.8083136, -4.661213, 0.01960784, 1, 0, 1,
-0.4318543, -1.401192, -3.909776, 0.01568628, 1, 0, 1,
-0.4316288, 0.1880077, -3.280117, 0.007843138, 1, 0, 1,
-0.4273859, -0.9140117, -2.892143, 0.003921569, 1, 0, 1,
-0.4255046, -1.423062, -2.051482, 0, 1, 0.003921569, 1,
-0.4245028, -0.7892449, -2.53095, 0, 1, 0.01176471, 1,
-0.4226877, 1.113348, -1.243669, 0, 1, 0.01568628, 1,
-0.4225645, 0.4219391, -0.7053924, 0, 1, 0.02352941, 1,
-0.4211091, -0.03225373, -1.19345, 0, 1, 0.02745098, 1,
-0.4195996, -0.864324, -2.617898, 0, 1, 0.03529412, 1,
-0.4193493, -0.9570844, -2.425195, 0, 1, 0.03921569, 1,
-0.4140833, -0.4600576, -4.234172, 0, 1, 0.04705882, 1,
-0.4110923, -0.3287166, -1.277018, 0, 1, 0.05098039, 1,
-0.4102281, -0.3792543, -2.952909, 0, 1, 0.05882353, 1,
-0.4095026, -1.497008, -3.787423, 0, 1, 0.0627451, 1,
-0.4086867, -0.2603387, -2.725661, 0, 1, 0.07058824, 1,
-0.4059357, 0.8172119, 0.9890424, 0, 1, 0.07450981, 1,
-0.4046972, -0.1048352, -1.526459, 0, 1, 0.08235294, 1,
-0.4024777, -0.8182144, -2.876504, 0, 1, 0.08627451, 1,
-0.4019746, 1.779413, -0.7525154, 0, 1, 0.09411765, 1,
-0.3960907, -0.7698181, -4.604114, 0, 1, 0.1019608, 1,
-0.3922153, 0.8548229, 0.3098872, 0, 1, 0.1058824, 1,
-0.3871666, 0.3504903, 0.7602416, 0, 1, 0.1137255, 1,
-0.3845731, 1.712712, 0.03859558, 0, 1, 0.1176471, 1,
-0.3816041, 1.466385, -0.8199872, 0, 1, 0.1254902, 1,
-0.3772949, 0.2219197, -1.031274, 0, 1, 0.1294118, 1,
-0.3772444, 0.7455788, 1.219903, 0, 1, 0.1372549, 1,
-0.374481, 2.615608, -0.828144, 0, 1, 0.1411765, 1,
-0.369074, -0.7985679, -2.464951, 0, 1, 0.1490196, 1,
-0.3633966, 0.3618566, -0.3448943, 0, 1, 0.1529412, 1,
-0.3603578, -1.455177, -3.686446, 0, 1, 0.1607843, 1,
-0.3595292, -0.3098633, -1.341691, 0, 1, 0.1647059, 1,
-0.3549415, 0.3127004, -1.467091, 0, 1, 0.172549, 1,
-0.354462, 0.3457072, 0.1952551, 0, 1, 0.1764706, 1,
-0.3535534, 0.2372235, -1.569287, 0, 1, 0.1843137, 1,
-0.3526136, -2.110473, -1.652461, 0, 1, 0.1882353, 1,
-0.3483874, -0.2617797, -2.78691, 0, 1, 0.1960784, 1,
-0.3470819, -1.007769, -4.429276, 0, 1, 0.2039216, 1,
-0.3454854, -1.311372, -3.684967, 0, 1, 0.2078431, 1,
-0.3453042, 0.13216, -3.694261, 0, 1, 0.2156863, 1,
-0.3451206, -0.9233699, -2.381809, 0, 1, 0.2196078, 1,
-0.3447606, -0.2088654, -2.250148, 0, 1, 0.227451, 1,
-0.3442792, 1.285324, -3.220366, 0, 1, 0.2313726, 1,
-0.340683, -0.9864938, -4.838705, 0, 1, 0.2392157, 1,
-0.3403402, -0.2047563, -1.804199, 0, 1, 0.2431373, 1,
-0.338543, 0.06038185, -1.757921, 0, 1, 0.2509804, 1,
-0.3348037, 0.6056728, 0.7528822, 0, 1, 0.254902, 1,
-0.3341241, -0.445162, -3.073497, 0, 1, 0.2627451, 1,
-0.3280447, -0.4802431, -4.312022, 0, 1, 0.2666667, 1,
-0.3264655, 0.1804328, -2.672016, 0, 1, 0.2745098, 1,
-0.3235705, -0.4273287, -1.520564, 0, 1, 0.2784314, 1,
-0.3234234, -0.3756193, -4.611746, 0, 1, 0.2862745, 1,
-0.3210631, -0.7333164, -3.612753, 0, 1, 0.2901961, 1,
-0.3171994, 0.5450051, 1.487644, 0, 1, 0.2980392, 1,
-0.3167655, 0.3603572, -1.949548, 0, 1, 0.3058824, 1,
-0.3165439, -1.496565, -1.798576, 0, 1, 0.3098039, 1,
-0.3146103, 0.4410918, -1.514136, 0, 1, 0.3176471, 1,
-0.3143768, 1.003192, 1.294025, 0, 1, 0.3215686, 1,
-0.311399, 1.401596, 0.06380042, 0, 1, 0.3294118, 1,
-0.3099265, 1.043201, -0.2963516, 0, 1, 0.3333333, 1,
-0.3082594, -2.406515, -2.174048, 0, 1, 0.3411765, 1,
-0.301659, -0.7264923, -1.710417, 0, 1, 0.345098, 1,
-0.3006766, -0.9875622, -0.5540468, 0, 1, 0.3529412, 1,
-0.2991896, 0.3838317, -1.398461, 0, 1, 0.3568628, 1,
-0.2944793, -0.6284744, -3.659914, 0, 1, 0.3647059, 1,
-0.2942926, -0.2624576, -1.99427, 0, 1, 0.3686275, 1,
-0.2940636, 0.7829558, 0.009144347, 0, 1, 0.3764706, 1,
-0.2935096, -1.107283, -3.646996, 0, 1, 0.3803922, 1,
-0.2919326, 1.584232, -0.1941092, 0, 1, 0.3882353, 1,
-0.2847389, 1.012708, 1.295785, 0, 1, 0.3921569, 1,
-0.2797945, 0.07580653, -1.761369, 0, 1, 0.4, 1,
-0.2758639, -0.4295651, -2.816246, 0, 1, 0.4078431, 1,
-0.2610226, 0.64483, -1.593569, 0, 1, 0.4117647, 1,
-0.2529557, -0.006184648, -1.359013, 0, 1, 0.4196078, 1,
-0.2507962, -0.07777537, -0.8726329, 0, 1, 0.4235294, 1,
-0.2507039, 1.878218, -1.284346, 0, 1, 0.4313726, 1,
-0.2495705, 1.408433, -0.9933547, 0, 1, 0.4352941, 1,
-0.2479918, -0.6894132, -3.633804, 0, 1, 0.4431373, 1,
-0.245958, 0.9127247, -1.083065, 0, 1, 0.4470588, 1,
-0.2449151, 0.04902343, -0.003393114, 0, 1, 0.454902, 1,
-0.243102, 0.1272284, -1.08262, 0, 1, 0.4588235, 1,
-0.2423063, -0.3917343, -0.3240966, 0, 1, 0.4666667, 1,
-0.2329858, 0.1594909, -1.319313, 0, 1, 0.4705882, 1,
-0.2313824, -1.589352, -2.312587, 0, 1, 0.4784314, 1,
-0.2288901, -0.4910676, -2.308314, 0, 1, 0.4823529, 1,
-0.2268032, -1.189752, -3.511794, 0, 1, 0.4901961, 1,
-0.2263006, -0.09269314, -2.221593, 0, 1, 0.4941176, 1,
-0.2249435, 0.7853386, -0.2557705, 0, 1, 0.5019608, 1,
-0.2247929, 0.173753, -0.6124729, 0, 1, 0.509804, 1,
-0.2235006, -0.8106084, -2.385968, 0, 1, 0.5137255, 1,
-0.2230141, 0.01377123, -2.007656, 0, 1, 0.5215687, 1,
-0.2225202, 0.03665087, -2.162659, 0, 1, 0.5254902, 1,
-0.2197574, -0.28673, -2.366399, 0, 1, 0.5333334, 1,
-0.2157419, 0.9403715, 1.559857, 0, 1, 0.5372549, 1,
-0.2137904, 0.6132791, -1.221885, 0, 1, 0.5450981, 1,
-0.2101705, -2.423273, -2.056594, 0, 1, 0.5490196, 1,
-0.2083839, 0.6468282, -1.358154, 0, 1, 0.5568628, 1,
-0.207646, -2.184131, -0.9458646, 0, 1, 0.5607843, 1,
-0.203888, 1.514407, 1.117574, 0, 1, 0.5686275, 1,
-0.1986642, -1.570786, -2.03198, 0, 1, 0.572549, 1,
-0.1981763, 1.373075, -0.4407452, 0, 1, 0.5803922, 1,
-0.1975827, 0.6822652, 0.8843902, 0, 1, 0.5843138, 1,
-0.1971791, -0.1074821, -2.164788, 0, 1, 0.5921569, 1,
-0.1958411, -0.5203525, -3.952945, 0, 1, 0.5960785, 1,
-0.1936595, -1.284809, -4.024208, 0, 1, 0.6039216, 1,
-0.1829634, -1.010077, -2.294626, 0, 1, 0.6117647, 1,
-0.1814087, -0.09658406, -3.589223, 0, 1, 0.6156863, 1,
-0.1775244, -0.1805815, -3.600837, 0, 1, 0.6235294, 1,
-0.1773854, 0.6361309, -0.1864486, 0, 1, 0.627451, 1,
-0.1773579, 1.572512, 0.1733883, 0, 1, 0.6352941, 1,
-0.1737492, 0.2167613, 0.05458921, 0, 1, 0.6392157, 1,
-0.1713076, 0.737806, -1.112962, 0, 1, 0.6470588, 1,
-0.169216, -0.4136769, -4.402448, 0, 1, 0.6509804, 1,
-0.167501, 0.8226057, -1.113153, 0, 1, 0.6588235, 1,
-0.1666827, -0.08216832, -0.06803399, 0, 1, 0.6627451, 1,
-0.1664127, -0.06997608, -2.528947, 0, 1, 0.6705883, 1,
-0.1596458, -1.553987, -1.634919, 0, 1, 0.6745098, 1,
-0.15725, 0.3353288, 0.512983, 0, 1, 0.682353, 1,
-0.1559289, 0.3212575, -1.24725, 0, 1, 0.6862745, 1,
-0.1547256, -1.514621, -3.050532, 0, 1, 0.6941177, 1,
-0.1541096, -1.205161, -4.075233, 0, 1, 0.7019608, 1,
-0.152816, -0.6260286, -0.4173078, 0, 1, 0.7058824, 1,
-0.1490619, -0.7263102, -2.854073, 0, 1, 0.7137255, 1,
-0.1465022, 0.9645292, -0.3628559, 0, 1, 0.7176471, 1,
-0.1425242, 0.6528643, 0.2759042, 0, 1, 0.7254902, 1,
-0.1419861, 1.891448, -0.8451445, 0, 1, 0.7294118, 1,
-0.140792, 1.183599, 0.3107527, 0, 1, 0.7372549, 1,
-0.1392099, 0.2819712, -0.9339703, 0, 1, 0.7411765, 1,
-0.1311357, 0.6474744, -0.22937, 0, 1, 0.7490196, 1,
-0.1233262, 0.8204321, -0.1658795, 0, 1, 0.7529412, 1,
-0.1211544, 1.918283, 2.322295, 0, 1, 0.7607843, 1,
-0.1211099, 1.900376, -0.3729212, 0, 1, 0.7647059, 1,
-0.1188679, -0.3363887, -1.88271, 0, 1, 0.772549, 1,
-0.1186182, -0.3027113, -3.5489, 0, 1, 0.7764706, 1,
-0.1159963, -0.1910661, -1.84435, 0, 1, 0.7843137, 1,
-0.1156422, 0.3311902, -0.638393, 0, 1, 0.7882353, 1,
-0.1109367, 0.2193724, 1.147006, 0, 1, 0.7960784, 1,
-0.1101584, 2.089934, 1.054282, 0, 1, 0.8039216, 1,
-0.1096028, 1.182789, -0.2831537, 0, 1, 0.8078431, 1,
-0.1095223, -0.3249659, -1.87287, 0, 1, 0.8156863, 1,
-0.1084067, -1.554091, -4.130344, 0, 1, 0.8196079, 1,
-0.1083978, 0.2384745, -1.274857, 0, 1, 0.827451, 1,
-0.1058605, 0.3168922, 0.07250936, 0, 1, 0.8313726, 1,
-0.1056013, -0.6244832, -1.480144, 0, 1, 0.8392157, 1,
-0.1023415, -0.5536626, -2.272405, 0, 1, 0.8431373, 1,
-0.09760232, 3.514687, -1.092384, 0, 1, 0.8509804, 1,
-0.09588837, 0.0534255, -2.213834, 0, 1, 0.854902, 1,
-0.09560087, 0.01671435, -1.576208, 0, 1, 0.8627451, 1,
-0.09234794, 0.8333204, 1.488496, 0, 1, 0.8666667, 1,
-0.09141228, -0.8659705, -3.255115, 0, 1, 0.8745098, 1,
-0.09068298, 0.2507204, -2.632354, 0, 1, 0.8784314, 1,
-0.09041212, -0.4889572, -3.575903, 0, 1, 0.8862745, 1,
-0.08599054, -0.1667652, -3.537197, 0, 1, 0.8901961, 1,
-0.07960209, -0.4298573, -2.142658, 0, 1, 0.8980392, 1,
-0.07886527, -0.1258977, -2.88887, 0, 1, 0.9058824, 1,
-0.0780226, -0.7840212, -4.859505, 0, 1, 0.9098039, 1,
-0.07797298, -0.07173733, -2.28943, 0, 1, 0.9176471, 1,
-0.07642253, 0.5964212, 0.7601006, 0, 1, 0.9215686, 1,
-0.07563632, 0.3841354, 0.4902298, 0, 1, 0.9294118, 1,
-0.07179, 0.9095938, -1.593288, 0, 1, 0.9333333, 1,
-0.07126106, -0.9983255, -1.196618, 0, 1, 0.9411765, 1,
-0.07003269, 0.5824433, 1.089423, 0, 1, 0.945098, 1,
-0.06595147, 0.1364309, -1.637565, 0, 1, 0.9529412, 1,
-0.0616509, -0.4077866, -2.091867, 0, 1, 0.9568627, 1,
-0.05671657, -0.5740596, -3.88922, 0, 1, 0.9647059, 1,
-0.05495506, 0.1469049, 2.081469, 0, 1, 0.9686275, 1,
-0.05445942, -0.6252724, -4.64078, 0, 1, 0.9764706, 1,
-0.05008892, -2.701873, -2.465235, 0, 1, 0.9803922, 1,
-0.0465732, 0.3062152, -0.1538959, 0, 1, 0.9882353, 1,
-0.04315421, -1.168514, -3.197909, 0, 1, 0.9921569, 1,
-0.04002737, -0.5425696, -2.43845, 0, 1, 1, 1,
-0.03774154, 0.5237918, 0.3167946, 0, 0.9921569, 1, 1,
-0.03563952, -2.335886, -1.055491, 0, 0.9882353, 1, 1,
-0.03551319, 1.323863, -2.048605, 0, 0.9803922, 1, 1,
-0.0352269, 1.313081, -2.145417, 0, 0.9764706, 1, 1,
-0.03354828, -0.4648081, -3.19101, 0, 0.9686275, 1, 1,
-0.03106171, 0.8294997, -1.038498, 0, 0.9647059, 1, 1,
-0.02757381, 0.7583582, -1.367461, 0, 0.9568627, 1, 1,
-0.02194811, -1.001307, -3.114266, 0, 0.9529412, 1, 1,
-0.02194529, 1.840487, -1.542801, 0, 0.945098, 1, 1,
-0.02078137, -0.7909744, -3.985568, 0, 0.9411765, 1, 1,
-0.01884356, -0.7150337, -4.783415, 0, 0.9333333, 1, 1,
-0.01759957, 0.03210882, -1.438753, 0, 0.9294118, 1, 1,
-0.01621361, 1.284949, -0.6328704, 0, 0.9215686, 1, 1,
-0.0121014, 0.3219225, -0.9788481, 0, 0.9176471, 1, 1,
-0.01004776, 1.241333, -0.9074963, 0, 0.9098039, 1, 1,
-0.008141306, 0.2707817, 0.275332, 0, 0.9058824, 1, 1,
-0.005588355, -0.4358939, -1.829933, 0, 0.8980392, 1, 1,
-0.003820993, 0.7376855, 1.033646, 0, 0.8901961, 1, 1,
-0.001709308, 1.134899, 0.2505549, 0, 0.8862745, 1, 1,
-0.0006339857, -0.2529763, -2.146792, 0, 0.8784314, 1, 1,
0.004517158, 0.1432023, 0.07185467, 0, 0.8745098, 1, 1,
0.01305265, -0.1427983, 2.478421, 0, 0.8666667, 1, 1,
0.01557132, 1.378009, 0.8616834, 0, 0.8627451, 1, 1,
0.02016423, 2.151754, -0.6367016, 0, 0.854902, 1, 1,
0.02242517, -0.1173349, 2.777737, 0, 0.8509804, 1, 1,
0.02320681, 0.9563107, -0.004826861, 0, 0.8431373, 1, 1,
0.02397243, -1.548433, 2.497079, 0, 0.8392157, 1, 1,
0.02476973, -0.3199578, 1.922107, 0, 0.8313726, 1, 1,
0.02740411, -0.429287, 3.897255, 0, 0.827451, 1, 1,
0.03625248, -1.021752, 3.309284, 0, 0.8196079, 1, 1,
0.03643965, -0.6358795, 2.677731, 0, 0.8156863, 1, 1,
0.0374003, -1.962028, 3.213234, 0, 0.8078431, 1, 1,
0.03744797, 0.5536445, 1.075748, 0, 0.8039216, 1, 1,
0.03751855, -0.1220353, 2.419438, 0, 0.7960784, 1, 1,
0.04060243, -0.1505669, 1.853467, 0, 0.7882353, 1, 1,
0.04130482, -0.3026007, 3.614146, 0, 0.7843137, 1, 1,
0.0422138, -0.02879762, 1.948712, 0, 0.7764706, 1, 1,
0.04411566, -0.6227528, 4.210047, 0, 0.772549, 1, 1,
0.05117387, 1.432535, 0.01417744, 0, 0.7647059, 1, 1,
0.05731764, -0.3920695, 1.958061, 0, 0.7607843, 1, 1,
0.06065577, 0.932135, -1.984083, 0, 0.7529412, 1, 1,
0.06217297, -0.7011511, 4.079393, 0, 0.7490196, 1, 1,
0.06446746, 0.5648122, -0.9847728, 0, 0.7411765, 1, 1,
0.07400309, -0.6949823, 3.21949, 0, 0.7372549, 1, 1,
0.07520878, 1.18343, 1.745312, 0, 0.7294118, 1, 1,
0.07709177, -0.8430904, 3.944924, 0, 0.7254902, 1, 1,
0.08904562, -0.634971, 3.896482, 0, 0.7176471, 1, 1,
0.09175578, -0.06517556, 1.827111, 0, 0.7137255, 1, 1,
0.09531596, -0.2605603, 4.063654, 0, 0.7058824, 1, 1,
0.09577207, -0.5750172, 5.037601, 0, 0.6980392, 1, 1,
0.09605087, -1.174825, 3.53306, 0, 0.6941177, 1, 1,
0.09834019, -0.9653083, 4.097205, 0, 0.6862745, 1, 1,
0.0988318, -0.3722719, 2.336275, 0, 0.682353, 1, 1,
0.1002138, 0.5143422, -2.369219, 0, 0.6745098, 1, 1,
0.1020276, 0.1697242, 1.664868, 0, 0.6705883, 1, 1,
0.1051927, 0.7005809, -1.170793, 0, 0.6627451, 1, 1,
0.1065042, -0.9012373, 3.610492, 0, 0.6588235, 1, 1,
0.1075988, -0.2414534, 2.642241, 0, 0.6509804, 1, 1,
0.1176224, 1.420445, -0.7749956, 0, 0.6470588, 1, 1,
0.1181355, -1.107224, 0.4104829, 0, 0.6392157, 1, 1,
0.1215359, -0.1889689, 1.646565, 0, 0.6352941, 1, 1,
0.1225706, 0.2590873, 2.031125, 0, 0.627451, 1, 1,
0.1253296, -0.3690163, 2.704774, 0, 0.6235294, 1, 1,
0.1258453, 1.180075, -0.8003173, 0, 0.6156863, 1, 1,
0.1269864, 0.8749828, 1.350329, 0, 0.6117647, 1, 1,
0.1292567, -0.5926991, 2.710705, 0, 0.6039216, 1, 1,
0.1303547, 0.05353452, 2.319758, 0, 0.5960785, 1, 1,
0.1326093, -0.7655975, 5.184371, 0, 0.5921569, 1, 1,
0.1360651, 1.094214, 0.4600211, 0, 0.5843138, 1, 1,
0.136676, -0.6814552, 3.250566, 0, 0.5803922, 1, 1,
0.1370169, 0.7969036, -0.9885002, 0, 0.572549, 1, 1,
0.1385435, 0.1646475, -1.013532, 0, 0.5686275, 1, 1,
0.1458358, -0.2404064, 1.952324, 0, 0.5607843, 1, 1,
0.1482072, 0.0430054, 2.697843, 0, 0.5568628, 1, 1,
0.1523143, 0.5376149, 0.6660679, 0, 0.5490196, 1, 1,
0.1524787, 2.31367, -1.719845, 0, 0.5450981, 1, 1,
0.154136, 0.6369903, 0.07701367, 0, 0.5372549, 1, 1,
0.1591004, 0.04431705, 0.3130417, 0, 0.5333334, 1, 1,
0.1599584, -1.575294, 2.224729, 0, 0.5254902, 1, 1,
0.1616222, -0.2306866, 1.877999, 0, 0.5215687, 1, 1,
0.1667543, -0.844319, 2.755815, 0, 0.5137255, 1, 1,
0.1670724, -1.080682, 3.55655, 0, 0.509804, 1, 1,
0.1679834, 0.6408845, -1.1274, 0, 0.5019608, 1, 1,
0.170256, -0.1850055, 2.005704, 0, 0.4941176, 1, 1,
0.1705071, 0.3765313, -1.569861, 0, 0.4901961, 1, 1,
0.1717031, 0.7280364, 2.545617, 0, 0.4823529, 1, 1,
0.1742713, -1.580665, 5.03753, 0, 0.4784314, 1, 1,
0.1755607, -1.122792, 4.202875, 0, 0.4705882, 1, 1,
0.1756894, 0.04043403, 1.138208, 0, 0.4666667, 1, 1,
0.1829511, 1.248639, -1.325378, 0, 0.4588235, 1, 1,
0.1883354, 0.2493593, -0.4777755, 0, 0.454902, 1, 1,
0.1888039, -0.846247, 3.118417, 0, 0.4470588, 1, 1,
0.1915234, 0.1551505, -0.09172237, 0, 0.4431373, 1, 1,
0.1967893, 1.031887, 0.6021885, 0, 0.4352941, 1, 1,
0.2021205, -0.193091, 1.849073, 0, 0.4313726, 1, 1,
0.2024024, 0.734257, 1.218738, 0, 0.4235294, 1, 1,
0.2109163, 0.6939157, 2.264845, 0, 0.4196078, 1, 1,
0.2151034, 0.6848893, 0.6501552, 0, 0.4117647, 1, 1,
0.2154508, 0.298264, 1.440135, 0, 0.4078431, 1, 1,
0.2182057, -1.168723, 2.239948, 0, 0.4, 1, 1,
0.2207133, -0.8516901, 2.045151, 0, 0.3921569, 1, 1,
0.2260859, 2.05808, 0.9509043, 0, 0.3882353, 1, 1,
0.2266197, -0.9429892, 1.559345, 0, 0.3803922, 1, 1,
0.2278971, -0.5122451, 4.838535, 0, 0.3764706, 1, 1,
0.2281114, 0.8314696, 1.140921, 0, 0.3686275, 1, 1,
0.2340853, -1.884477, 5.074349, 0, 0.3647059, 1, 1,
0.2371984, -0.3617752, 1.999187, 0, 0.3568628, 1, 1,
0.2387121, 1.270608, -0.05098784, 0, 0.3529412, 1, 1,
0.2456738, -1.042531, 2.847146, 0, 0.345098, 1, 1,
0.2469545, 0.9063578, 1.481835, 0, 0.3411765, 1, 1,
0.2478385, -1.804341, 2.425097, 0, 0.3333333, 1, 1,
0.2489157, -1.118487, 2.058059, 0, 0.3294118, 1, 1,
0.2514746, -0.03813033, 3.072793, 0, 0.3215686, 1, 1,
0.2537471, -1.33503, 2.379907, 0, 0.3176471, 1, 1,
0.2538313, -0.9004558, 2.782685, 0, 0.3098039, 1, 1,
0.2538424, -0.6709836, 2.086502, 0, 0.3058824, 1, 1,
0.2554835, -0.07846956, 1.363666, 0, 0.2980392, 1, 1,
0.2560328, -0.8455667, 4.511786, 0, 0.2901961, 1, 1,
0.2579956, 0.3452599, -0.1655736, 0, 0.2862745, 1, 1,
0.2583915, 0.6492924, -1.822665, 0, 0.2784314, 1, 1,
0.2585099, -1.594175, 3.863358, 0, 0.2745098, 1, 1,
0.2604936, -0.8158976, 3.922064, 0, 0.2666667, 1, 1,
0.2611014, -0.01033486, 1.142107, 0, 0.2627451, 1, 1,
0.2738331, -1.835374, 1.830899, 0, 0.254902, 1, 1,
0.2743268, -0.2665566, 2.983684, 0, 0.2509804, 1, 1,
0.277063, 0.8205625, -0.1107645, 0, 0.2431373, 1, 1,
0.2805405, 1.437678, 0.1023104, 0, 0.2392157, 1, 1,
0.2809695, 1.541068, -0.008663608, 0, 0.2313726, 1, 1,
0.2810472, -0.05479563, 1.216041, 0, 0.227451, 1, 1,
0.281328, -1.037726, 4.406859, 0, 0.2196078, 1, 1,
0.2815906, 1.008025, 0.1149866, 0, 0.2156863, 1, 1,
0.2845111, -0.9516466, 3.680876, 0, 0.2078431, 1, 1,
0.2886406, -0.8094816, 3.49417, 0, 0.2039216, 1, 1,
0.2893496, -1.879736, 1.356782, 0, 0.1960784, 1, 1,
0.2958805, 1.338588, 1.111606, 0, 0.1882353, 1, 1,
0.3098715, -0.9670743, 4.40735, 0, 0.1843137, 1, 1,
0.3140204, 2.229507, 0.3978697, 0, 0.1764706, 1, 1,
0.3169219, -1.528623, 3.915215, 0, 0.172549, 1, 1,
0.3246311, -0.2829707, 1.962345, 0, 0.1647059, 1, 1,
0.3264317, -0.1911876, 3.729962, 0, 0.1607843, 1, 1,
0.3281386, 1.314745, -1.840294, 0, 0.1529412, 1, 1,
0.3300212, 1.227381, -0.1998036, 0, 0.1490196, 1, 1,
0.3323304, -0.7830406, 1.447054, 0, 0.1411765, 1, 1,
0.3325151, 0.0244405, 1.815395, 0, 0.1372549, 1, 1,
0.3338729, 1.711641, 0.4823656, 0, 0.1294118, 1, 1,
0.3365155, -0.3096927, 2.943228, 0, 0.1254902, 1, 1,
0.3407014, 0.5814421, 0.4263842, 0, 0.1176471, 1, 1,
0.3423075, -0.05993813, -1.113641, 0, 0.1137255, 1, 1,
0.343924, -0.2491737, 2.704952, 0, 0.1058824, 1, 1,
0.3600354, -0.3059879, 3.814373, 0, 0.09803922, 1, 1,
0.3617491, -0.3163778, 2.533131, 0, 0.09411765, 1, 1,
0.3626998, 0.7317781, 0.1728372, 0, 0.08627451, 1, 1,
0.366079, -0.01405286, 1.467964, 0, 0.08235294, 1, 1,
0.3696905, -0.2186971, 3.558482, 0, 0.07450981, 1, 1,
0.3704271, -0.4033945, 3.106051, 0, 0.07058824, 1, 1,
0.3731543, -0.1927657, 2.511487, 0, 0.0627451, 1, 1,
0.3774066, 0.4728847, 0.5691629, 0, 0.05882353, 1, 1,
0.3774427, -0.06743119, 1.928024, 0, 0.05098039, 1, 1,
0.3816457, 0.4690093, 2.226211, 0, 0.04705882, 1, 1,
0.3817496, -1.305248, 2.581231, 0, 0.03921569, 1, 1,
0.3829979, -0.01513936, 1.696296, 0, 0.03529412, 1, 1,
0.3839022, -0.6161466, 2.757416, 0, 0.02745098, 1, 1,
0.3877745, 0.9675065, 0.4827739, 0, 0.02352941, 1, 1,
0.3891894, -0.1479219, 1.159451, 0, 0.01568628, 1, 1,
0.3894845, 1.310206, -0.7858806, 0, 0.01176471, 1, 1,
0.389619, 0.8007906, -0.6414227, 0, 0.003921569, 1, 1,
0.3968009, 1.198303, -0.6785312, 0.003921569, 0, 1, 1,
0.3986846, -1.134714, 3.963635, 0.007843138, 0, 1, 1,
0.3992186, -0.1508754, -0.1208622, 0.01568628, 0, 1, 1,
0.3998533, 1.286838, 0.5970213, 0.01960784, 0, 1, 1,
0.400373, -1.218047, 3.615426, 0.02745098, 0, 1, 1,
0.4020596, 2.019065, 1.044866, 0.03137255, 0, 1, 1,
0.4026321, -1.429124, 2.813895, 0.03921569, 0, 1, 1,
0.403801, 0.5634292, 0.3395768, 0.04313726, 0, 1, 1,
0.4061755, 0.6188777, -2.172783, 0.05098039, 0, 1, 1,
0.4120023, -0.362528, 3.212084, 0.05490196, 0, 1, 1,
0.4128174, 0.05945592, 0.373789, 0.0627451, 0, 1, 1,
0.4156451, 0.67871, -2.873738, 0.06666667, 0, 1, 1,
0.4182412, -0.07955644, 1.515908, 0.07450981, 0, 1, 1,
0.4325006, 0.9526951, 0.03688204, 0.07843138, 0, 1, 1,
0.4325199, -1.976583, 3.168133, 0.08627451, 0, 1, 1,
0.4353788, -0.2615893, 1.918521, 0.09019608, 0, 1, 1,
0.4371633, -0.2481991, 1.53063, 0.09803922, 0, 1, 1,
0.4378476, -0.7110783, 0.8628656, 0.1058824, 0, 1, 1,
0.4391101, 0.6047302, 1.039814, 0.1098039, 0, 1, 1,
0.4467216, 0.01740634, 0.5064043, 0.1176471, 0, 1, 1,
0.4512962, 1.089412, -0.618597, 0.1215686, 0, 1, 1,
0.4519633, -0.755183, 2.177423, 0.1294118, 0, 1, 1,
0.4524077, 0.02643619, -0.171083, 0.1333333, 0, 1, 1,
0.463318, 1.712454, 0.7776905, 0.1411765, 0, 1, 1,
0.4673167, 0.5911245, 0.5365735, 0.145098, 0, 1, 1,
0.4695902, -0.8255607, 1.112061, 0.1529412, 0, 1, 1,
0.4727101, 0.1372532, 1.968732, 0.1568628, 0, 1, 1,
0.4741532, -1.036896, 3.203585, 0.1647059, 0, 1, 1,
0.4754575, -1.608602, 3.746828, 0.1686275, 0, 1, 1,
0.4822493, -0.2199723, 2.146636, 0.1764706, 0, 1, 1,
0.4828261, -0.04870665, 0.6671418, 0.1803922, 0, 1, 1,
0.4878835, 0.5423964, -0.006529353, 0.1882353, 0, 1, 1,
0.495407, 1.882837, -0.7483769, 0.1921569, 0, 1, 1,
0.500881, -0.322769, 3.077006, 0.2, 0, 1, 1,
0.5044827, 1.432621, 1.097413, 0.2078431, 0, 1, 1,
0.5070632, 0.3746387, 3.084618, 0.2117647, 0, 1, 1,
0.5110989, -0.9173561, 2.145121, 0.2196078, 0, 1, 1,
0.5207952, 1.323176, 1.592977, 0.2235294, 0, 1, 1,
0.520825, -1.793404, 5.110438, 0.2313726, 0, 1, 1,
0.5245976, 0.5770233, 3.176887, 0.2352941, 0, 1, 1,
0.5306002, -0.147693, 1.860987, 0.2431373, 0, 1, 1,
0.5369361, 0.4978254, -0.5498848, 0.2470588, 0, 1, 1,
0.5369467, -0.6540106, 0.8858374, 0.254902, 0, 1, 1,
0.5391794, -0.2372615, 0.3511437, 0.2588235, 0, 1, 1,
0.5464237, 1.133329, -0.1373893, 0.2666667, 0, 1, 1,
0.5563206, -0.9774154, 3.632336, 0.2705882, 0, 1, 1,
0.5575881, -0.124002, 1.849753, 0.2784314, 0, 1, 1,
0.5584518, 1.586376, 0.4827439, 0.282353, 0, 1, 1,
0.5588961, -1.15298, 1.999918, 0.2901961, 0, 1, 1,
0.5592029, 0.3169567, 1.452119, 0.2941177, 0, 1, 1,
0.5606223, -0.3620125, 2.068304, 0.3019608, 0, 1, 1,
0.5654877, -1.192033, 2.029963, 0.3098039, 0, 1, 1,
0.5679042, 0.05795438, 0.1004135, 0.3137255, 0, 1, 1,
0.5682849, -0.02395245, 3.462992, 0.3215686, 0, 1, 1,
0.5692201, 0.619308, 1.799534, 0.3254902, 0, 1, 1,
0.5697718, 0.9816317, 0.2362326, 0.3333333, 0, 1, 1,
0.5726252, -0.2725195, 2.99175, 0.3372549, 0, 1, 1,
0.5809554, -1.537935, 0.6168679, 0.345098, 0, 1, 1,
0.5849323, -2.042671, 4.03531, 0.3490196, 0, 1, 1,
0.5850633, 0.2995974, 1.477233, 0.3568628, 0, 1, 1,
0.5947644, -1.128939, 1.909446, 0.3607843, 0, 1, 1,
0.5979621, -0.4272532, 1.534575, 0.3686275, 0, 1, 1,
0.5996652, 1.97529, 2.598138, 0.372549, 0, 1, 1,
0.5996687, -0.7136926, 2.386484, 0.3803922, 0, 1, 1,
0.6001216, -0.6720626, 0.9197065, 0.3843137, 0, 1, 1,
0.6044341, -0.423798, 0.9144321, 0.3921569, 0, 1, 1,
0.6096801, 0.6999648, -1.005822, 0.3960784, 0, 1, 1,
0.6109045, 0.2715993, 1.413106, 0.4039216, 0, 1, 1,
0.6111813, 0.4094729, 1.176678, 0.4117647, 0, 1, 1,
0.6134588, 2.089233, 1.1618, 0.4156863, 0, 1, 1,
0.6135778, -0.7710623, 1.749441, 0.4235294, 0, 1, 1,
0.6156324, 1.109547, 0.6773126, 0.427451, 0, 1, 1,
0.6170022, 0.7649062, 0.2433312, 0.4352941, 0, 1, 1,
0.621779, 2.140889, 0.8308555, 0.4392157, 0, 1, 1,
0.6233568, -1.955894, 0.2838669, 0.4470588, 0, 1, 1,
0.627115, -0.9252674, 1.619969, 0.4509804, 0, 1, 1,
0.6351517, -1.735297, 4.158886, 0.4588235, 0, 1, 1,
0.6366196, 1.003468, 0.1719449, 0.4627451, 0, 1, 1,
0.6409153, -1.060051, 2.159598, 0.4705882, 0, 1, 1,
0.645621, 0.1517106, 0.5116584, 0.4745098, 0, 1, 1,
0.6485972, -0.2044841, 0.7823734, 0.4823529, 0, 1, 1,
0.6489351, -0.2173962, 1.37628, 0.4862745, 0, 1, 1,
0.6498702, -0.9436921, 3.994255, 0.4941176, 0, 1, 1,
0.6537085, -1.21542, 3.551829, 0.5019608, 0, 1, 1,
0.6544244, -1.227979, 2.984658, 0.5058824, 0, 1, 1,
0.6599689, 0.1544749, 2.026369, 0.5137255, 0, 1, 1,
0.6609374, 1.354424, 1.904053, 0.5176471, 0, 1, 1,
0.6642588, -1.220215, 4.02441, 0.5254902, 0, 1, 1,
0.6643125, -1.722134, 3.755161, 0.5294118, 0, 1, 1,
0.6668013, 2.3133, 1.807335, 0.5372549, 0, 1, 1,
0.6691698, -0.03641136, 1.643862, 0.5411765, 0, 1, 1,
0.6709796, 1.092071, -0.3182093, 0.5490196, 0, 1, 1,
0.6740784, 0.4584206, 0.9916943, 0.5529412, 0, 1, 1,
0.679, 0.6606105, 0.6497108, 0.5607843, 0, 1, 1,
0.6804559, 1.959711, -0.3859733, 0.5647059, 0, 1, 1,
0.6849977, -0.5366203, 2.372347, 0.572549, 0, 1, 1,
0.686255, -0.7234006, 0.4817723, 0.5764706, 0, 1, 1,
0.6888559, 1.395363, -0.562926, 0.5843138, 0, 1, 1,
0.6899677, -1.360246, 4.895016, 0.5882353, 0, 1, 1,
0.6902958, 0.7729191, -0.2251478, 0.5960785, 0, 1, 1,
0.6903132, -0.9388403, 2.630165, 0.6039216, 0, 1, 1,
0.6961402, -0.6504275, 0.1208602, 0.6078432, 0, 1, 1,
0.6997055, -1.293602, 3.587221, 0.6156863, 0, 1, 1,
0.7033423, 0.1696754, 1.010132, 0.6196079, 0, 1, 1,
0.7102388, 0.08941729, 0.4240001, 0.627451, 0, 1, 1,
0.7188851, 0.5056346, 0.1067827, 0.6313726, 0, 1, 1,
0.7207054, -0.9443838, 2.644449, 0.6392157, 0, 1, 1,
0.7252787, 0.9272225, 0.8547012, 0.6431373, 0, 1, 1,
0.7261348, 0.2888575, 3.464563, 0.6509804, 0, 1, 1,
0.726219, 0.09596798, 1.874383, 0.654902, 0, 1, 1,
0.7262276, 1.182943, 1.025411, 0.6627451, 0, 1, 1,
0.7326731, -0.2042904, 0.5905719, 0.6666667, 0, 1, 1,
0.7331285, -1.46436, 3.027735, 0.6745098, 0, 1, 1,
0.7372109, -1.757199, 3.3325, 0.6784314, 0, 1, 1,
0.7383771, 0.5499375, 0.8252872, 0.6862745, 0, 1, 1,
0.7434449, 1.03803, 0.7070454, 0.6901961, 0, 1, 1,
0.7457747, -1.400522, 2.398396, 0.6980392, 0, 1, 1,
0.7467126, 1.052935, 1.818173, 0.7058824, 0, 1, 1,
0.7543744, -0.03794904, 0.6634399, 0.7098039, 0, 1, 1,
0.7570691, -1.940022, 1.241209, 0.7176471, 0, 1, 1,
0.7577631, -0.7280586, 2.103269, 0.7215686, 0, 1, 1,
0.7639711, 0.6472363, 1.298821, 0.7294118, 0, 1, 1,
0.7710575, 0.2984645, 0.9612417, 0.7333333, 0, 1, 1,
0.7722912, 0.6540363, 1.071679, 0.7411765, 0, 1, 1,
0.7750014, 0.1703965, 1.556594, 0.7450981, 0, 1, 1,
0.7874245, 0.4574221, 0.4151501, 0.7529412, 0, 1, 1,
0.7878702, 0.002090921, 1.674115, 0.7568628, 0, 1, 1,
0.7879258, -0.9561905, 1.619376, 0.7647059, 0, 1, 1,
0.7895311, 0.07138736, 3.098543, 0.7686275, 0, 1, 1,
0.7928207, -0.3247106, 3.998065, 0.7764706, 0, 1, 1,
0.7945055, 2.126036, -0.02741543, 0.7803922, 0, 1, 1,
0.7993058, 0.2748288, 0.1716176, 0.7882353, 0, 1, 1,
0.7996933, -0.4718353, 3.230973, 0.7921569, 0, 1, 1,
0.8025959, 0.8396991, 1.083335, 0.8, 0, 1, 1,
0.8147614, 1.232677, 1.232611, 0.8078431, 0, 1, 1,
0.8172268, 1.323578, 0.6658808, 0.8117647, 0, 1, 1,
0.8182732, -1.435419, 0.9428677, 0.8196079, 0, 1, 1,
0.8274491, 0.1790693, 1.237084, 0.8235294, 0, 1, 1,
0.8286823, 1.315878, 0.3108196, 0.8313726, 0, 1, 1,
0.8313673, -2.221503, 1.337105, 0.8352941, 0, 1, 1,
0.8335002, -0.9838743, 1.852707, 0.8431373, 0, 1, 1,
0.8385202, 0.4096799, 2.848148, 0.8470588, 0, 1, 1,
0.8451331, -1.243397, 2.022148, 0.854902, 0, 1, 1,
0.8497698, -1.398731, 3.244617, 0.8588235, 0, 1, 1,
0.8582239, -0.01400876, 1.438043, 0.8666667, 0, 1, 1,
0.8598813, 0.8904424, 1.600465, 0.8705882, 0, 1, 1,
0.8625378, 0.9302853, 1.681778, 0.8784314, 0, 1, 1,
0.8694555, 0.7585151, 1.444516, 0.8823529, 0, 1, 1,
0.8741992, 0.4832506, -0.7071068, 0.8901961, 0, 1, 1,
0.8843694, -1.093958, 1.297827, 0.8941177, 0, 1, 1,
0.8882965, 0.5471885, 2.229994, 0.9019608, 0, 1, 1,
0.8905959, 0.2560701, 0.6214361, 0.9098039, 0, 1, 1,
0.8912629, 0.275519, -0.01389687, 0.9137255, 0, 1, 1,
0.8949519, -0.6483744, 2.736126, 0.9215686, 0, 1, 1,
0.897482, 1.191407, 1.244439, 0.9254902, 0, 1, 1,
0.8982457, 1.937516, 1.681435, 0.9333333, 0, 1, 1,
0.9002373, 0.415719, 0.8013406, 0.9372549, 0, 1, 1,
0.9022504, -0.5269629, 1.230705, 0.945098, 0, 1, 1,
0.904266, 0.5943612, 0.5669298, 0.9490196, 0, 1, 1,
0.9057255, -0.9285839, 2.884763, 0.9568627, 0, 1, 1,
0.9092806, -1.20119, 4.823024, 0.9607843, 0, 1, 1,
0.9152794, 0.6519167, 0.5421986, 0.9686275, 0, 1, 1,
0.9290803, 0.08025505, 0.07158975, 0.972549, 0, 1, 1,
0.9335296, -1.346874, 2.776991, 0.9803922, 0, 1, 1,
0.9340836, -0.2729891, 0.9064252, 0.9843137, 0, 1, 1,
0.9402013, -0.8795092, 3.148761, 0.9921569, 0, 1, 1,
0.9432857, -0.2054152, 0.7985107, 0.9960784, 0, 1, 1,
0.9567322, 1.015629, 0.651631, 1, 0, 0.9960784, 1,
0.9589828, 1.283422, 0.2615863, 1, 0, 0.9882353, 1,
0.9781363, -1.350016, 1.178747, 1, 0, 0.9843137, 1,
0.9835457, 0.7204602, -0.683741, 1, 0, 0.9764706, 1,
0.9928944, -0.1065588, 1.724816, 1, 0, 0.972549, 1,
0.9935709, -1.235285, 3.578859, 1, 0, 0.9647059, 1,
0.9942, -1.518027, 2.533248, 1, 0, 0.9607843, 1,
1.000059, 1.608884, -1.649305, 1, 0, 0.9529412, 1,
1.007533, -0.2471408, 1.871965, 1, 0, 0.9490196, 1,
1.017796, 0.5025449, 0.3815541, 1, 0, 0.9411765, 1,
1.025036, -0.165779, 1.8968, 1, 0, 0.9372549, 1,
1.032951, 0.6704924, -0.9133661, 1, 0, 0.9294118, 1,
1.033683, 0.4194788, 1.28317, 1, 0, 0.9254902, 1,
1.037782, -0.5613708, 2.971904, 1, 0, 0.9176471, 1,
1.059287, -0.1072305, 1.920334, 1, 0, 0.9137255, 1,
1.064336, 0.5574043, 1.849308, 1, 0, 0.9058824, 1,
1.068923, 0.01068068, 0.6632366, 1, 0, 0.9019608, 1,
1.074061, -1.13621, 3.469092, 1, 0, 0.8941177, 1,
1.074309, 0.05278917, 1.547968, 1, 0, 0.8862745, 1,
1.076334, 0.7498236, 0.8666329, 1, 0, 0.8823529, 1,
1.08021, -1.9444, 2.734518, 1, 0, 0.8745098, 1,
1.083379, 0.9253265, -0.3514513, 1, 0, 0.8705882, 1,
1.087023, -1.151173, 2.69943, 1, 0, 0.8627451, 1,
1.10037, 1.71231, 0.4768145, 1, 0, 0.8588235, 1,
1.102615, -1.22782, 2.444509, 1, 0, 0.8509804, 1,
1.103206, -0.9385397, 3.23479, 1, 0, 0.8470588, 1,
1.106694, 1.570561, 1.119564, 1, 0, 0.8392157, 1,
1.106757, -0.47073, 2.358143, 1, 0, 0.8352941, 1,
1.109332, -1.193244, 1.260217, 1, 0, 0.827451, 1,
1.11033, -1.363615, 2.478338, 1, 0, 0.8235294, 1,
1.113068, 0.7592171, 0.09152018, 1, 0, 0.8156863, 1,
1.122948, -0.1136979, 2.977061, 1, 0, 0.8117647, 1,
1.123422, -0.2942164, 3.109743, 1, 0, 0.8039216, 1,
1.124365, -0.9500108, 2.488264, 1, 0, 0.7960784, 1,
1.148662, 0.3433653, 0.5403642, 1, 0, 0.7921569, 1,
1.161389, 0.4886818, 2.066034, 1, 0, 0.7843137, 1,
1.165973, -0.4894314, 0.9891655, 1, 0, 0.7803922, 1,
1.180412, -1.771935, 3.473815, 1, 0, 0.772549, 1,
1.187325, 0.6551447, 1.291202, 1, 0, 0.7686275, 1,
1.187349, 0.3358597, 0.9678869, 1, 0, 0.7607843, 1,
1.193992, 1.838416, 0.3245982, 1, 0, 0.7568628, 1,
1.194541, -1.254151, 3.412094, 1, 0, 0.7490196, 1,
1.194825, 0.3760976, 1.923796, 1, 0, 0.7450981, 1,
1.199614, 0.5520583, 1.360691, 1, 0, 0.7372549, 1,
1.200141, -0.8547359, 0.6062036, 1, 0, 0.7333333, 1,
1.206016, -0.2597736, 3.621442, 1, 0, 0.7254902, 1,
1.212338, -0.02145281, 1.576715, 1, 0, 0.7215686, 1,
1.221041, 0.325502, 1.150704, 1, 0, 0.7137255, 1,
1.228862, 1.131499, -0.2613789, 1, 0, 0.7098039, 1,
1.232318, 0.4905972, 1.391722, 1, 0, 0.7019608, 1,
1.232802, 0.4887116, 3.28773, 1, 0, 0.6941177, 1,
1.239664, 0.170717, 1.610679, 1, 0, 0.6901961, 1,
1.24083, 0.278902, 0.6164533, 1, 0, 0.682353, 1,
1.242159, -0.5982214, 2.913049, 1, 0, 0.6784314, 1,
1.246905, -0.2661644, 0.8326697, 1, 0, 0.6705883, 1,
1.261618, -0.5342947, 1.997462, 1, 0, 0.6666667, 1,
1.266136, 0.9403216, 0.3531, 1, 0, 0.6588235, 1,
1.273261, -0.1936706, 0.9131283, 1, 0, 0.654902, 1,
1.278245, 0.5156534, 2.318791, 1, 0, 0.6470588, 1,
1.278282, 1.057769, 0.4555498, 1, 0, 0.6431373, 1,
1.280063, -0.1753955, 2.348737, 1, 0, 0.6352941, 1,
1.282825, 1.424731, 1.554167, 1, 0, 0.6313726, 1,
1.293222, -0.1809943, 1.276189, 1, 0, 0.6235294, 1,
1.300887, -0.8061781, 4.018939, 1, 0, 0.6196079, 1,
1.314695, -0.4099197, 1.262718, 1, 0, 0.6117647, 1,
1.31557, -0.1161499, 1.993617, 1, 0, 0.6078432, 1,
1.318354, -0.2041328, 1.027137, 1, 0, 0.6, 1,
1.328989, -1.505266, 1.858105, 1, 0, 0.5921569, 1,
1.342185, 1.751228, 0.2749794, 1, 0, 0.5882353, 1,
1.350856, -0.599491, 0.2242737, 1, 0, 0.5803922, 1,
1.353397, -1.748578, 3.306465, 1, 0, 0.5764706, 1,
1.363677, 1.419263, 0.7298172, 1, 0, 0.5686275, 1,
1.369372, -0.7877211, 2.158037, 1, 0, 0.5647059, 1,
1.369532, -0.4892459, 2.333755, 1, 0, 0.5568628, 1,
1.39007, -0.272255, 0.3785093, 1, 0, 0.5529412, 1,
1.402189, 2.181189, 0.7777445, 1, 0, 0.5450981, 1,
1.405444, 0.9824666, -0.1100652, 1, 0, 0.5411765, 1,
1.415901, 1.419755, 0.8921548, 1, 0, 0.5333334, 1,
1.423064, -0.8168468, 1.696865, 1, 0, 0.5294118, 1,
1.424445, -0.8511333, 1.451281, 1, 0, 0.5215687, 1,
1.432109, 1.053935, 1.347581, 1, 0, 0.5176471, 1,
1.436913, -1.085658, 1.759115, 1, 0, 0.509804, 1,
1.445531, -1.005035, 0.1799762, 1, 0, 0.5058824, 1,
1.44677, 0.5546835, 1.734136, 1, 0, 0.4980392, 1,
1.447464, 0.3437184, -0.5565097, 1, 0, 0.4901961, 1,
1.447526, 0.8120486, -1.294461, 1, 0, 0.4862745, 1,
1.451682, 0.3025305, 1.014286, 1, 0, 0.4784314, 1,
1.461694, -0.1951711, 2.202337, 1, 0, 0.4745098, 1,
1.461794, 0.2074682, 1.046809, 1, 0, 0.4666667, 1,
1.464321, 3.485169, -0.6881089, 1, 0, 0.4627451, 1,
1.469132, -1.876531, 1.056009, 1, 0, 0.454902, 1,
1.471978, 2.446995, -0.3615095, 1, 0, 0.4509804, 1,
1.481573, -1.070106, 1.416922, 1, 0, 0.4431373, 1,
1.491728, 0.1145264, 2.753167, 1, 0, 0.4392157, 1,
1.496438, 0.4489316, 2.272962, 1, 0, 0.4313726, 1,
1.499795, 0.6043434, 1.548553, 1, 0, 0.427451, 1,
1.511153, -0.2911874, 0.1524821, 1, 0, 0.4196078, 1,
1.516279, 0.1652838, -0.5174193, 1, 0, 0.4156863, 1,
1.519078, 0.1614219, 0.2215105, 1, 0, 0.4078431, 1,
1.520791, -0.3578676, 2.444294, 1, 0, 0.4039216, 1,
1.530837, -0.3318138, 1.693781, 1, 0, 0.3960784, 1,
1.532966, 0.06362058, 1.169609, 1, 0, 0.3882353, 1,
1.538401, -0.8943332, 3.5945, 1, 0, 0.3843137, 1,
1.544794, 0.8905035, 1.13031, 1, 0, 0.3764706, 1,
1.546235, 1.630543, 1.115854, 1, 0, 0.372549, 1,
1.548955, 0.2068115, 1.519227, 1, 0, 0.3647059, 1,
1.550996, -0.1916107, 1.247056, 1, 0, 0.3607843, 1,
1.553083, -0.7149117, 1.464534, 1, 0, 0.3529412, 1,
1.553448, 0.2113605, -0.02734281, 1, 0, 0.3490196, 1,
1.556412, 0.5488316, -0.8621342, 1, 0, 0.3411765, 1,
1.561975, 0.7235261, 0.03685023, 1, 0, 0.3372549, 1,
1.562512, -0.366809, 0.4912633, 1, 0, 0.3294118, 1,
1.576442, -0.1888519, 1.918627, 1, 0, 0.3254902, 1,
1.58669, -0.4426791, 3.126723, 1, 0, 0.3176471, 1,
1.592722, -0.6977221, 1.735868, 1, 0, 0.3137255, 1,
1.601583, -0.624042, 2.91654, 1, 0, 0.3058824, 1,
1.605023, 1.565613, 2.382751, 1, 0, 0.2980392, 1,
1.605341, -0.9519111, 0.4152166, 1, 0, 0.2941177, 1,
1.617194, -0.6588705, 1.36801, 1, 0, 0.2862745, 1,
1.619776, -0.05777194, 1.605736, 1, 0, 0.282353, 1,
1.634871, 2.031782, 0.7805831, 1, 0, 0.2745098, 1,
1.675461, -0.8970518, -0.3854775, 1, 0, 0.2705882, 1,
1.680987, -0.5688614, 2.664431, 1, 0, 0.2627451, 1,
1.682045, 1.004521, 0.8836779, 1, 0, 0.2588235, 1,
1.689005, -0.8196191, 1.496241, 1, 0, 0.2509804, 1,
1.694581, 1.255992, 0.5196401, 1, 0, 0.2470588, 1,
1.710836, -0.3456591, 1.076004, 1, 0, 0.2392157, 1,
1.712487, 0.0003766387, 2.679887, 1, 0, 0.2352941, 1,
1.748714, 0.3529059, 2.938393, 1, 0, 0.227451, 1,
1.769648, 1.384493, 0.7945223, 1, 0, 0.2235294, 1,
1.8095, -0.9218203, 4.062274, 1, 0, 0.2156863, 1,
1.815412, 0.07220788, 1.219986, 1, 0, 0.2117647, 1,
1.817642, 0.06033917, 1.096727, 1, 0, 0.2039216, 1,
1.833566, 0.1912633, -0.6561143, 1, 0, 0.1960784, 1,
1.839585, 0.2713103, 0.7136558, 1, 0, 0.1921569, 1,
1.856763, -1.345753, 2.747757, 1, 0, 0.1843137, 1,
1.862755, 0.7888367, 1.753687, 1, 0, 0.1803922, 1,
1.872039, -0.5463472, -0.005197442, 1, 0, 0.172549, 1,
1.882156, -0.3753394, 2.43139, 1, 0, 0.1686275, 1,
1.89356, 2.200219, 0.5129353, 1, 0, 0.1607843, 1,
1.928857, -0.9460396, 1.084493, 1, 0, 0.1568628, 1,
1.930526, -0.5299938, 0.9879227, 1, 0, 0.1490196, 1,
1.940973, -0.5385608, 2.308335, 1, 0, 0.145098, 1,
1.961252, 1.125031, 1.83939, 1, 0, 0.1372549, 1,
2.012082, 0.3576635, 0.7188497, 1, 0, 0.1333333, 1,
2.045536, 0.2406276, 0.9639172, 1, 0, 0.1254902, 1,
2.099699, 1.632803, 1.043392, 1, 0, 0.1215686, 1,
2.155513, -0.2385253, 2.026826, 1, 0, 0.1137255, 1,
2.230077, 0.5609508, 2.337602, 1, 0, 0.1098039, 1,
2.235816, -0.7251083, 1.061398, 1, 0, 0.1019608, 1,
2.246541, -0.4934077, 2.105067, 1, 0, 0.09411765, 1,
2.25981, 0.1259811, 3.171406, 1, 0, 0.09019608, 1,
2.263844, 0.4213903, 1.937055, 1, 0, 0.08235294, 1,
2.279469, -2.327802, 3.304399, 1, 0, 0.07843138, 1,
2.331676, 0.07228924, 2.053439, 1, 0, 0.07058824, 1,
2.359971, -0.6703609, 3.198176, 1, 0, 0.06666667, 1,
2.387165, -1.13955, 3.4385, 1, 0, 0.05882353, 1,
2.420582, 0.9758323, 1.484764, 1, 0, 0.05490196, 1,
2.461707, -0.352223, 1.912487, 1, 0, 0.04705882, 1,
2.506805, -1.419705, 0.5559811, 1, 0, 0.04313726, 1,
2.530589, -0.9664941, 2.38543, 1, 0, 0.03529412, 1,
2.677886, -0.4679969, 1.419471, 1, 0, 0.03137255, 1,
2.949933, -0.8467187, 0.8182355, 1, 0, 0.02352941, 1,
3.002696, 0.9265297, 2.681874, 1, 0, 0.01960784, 1,
3.060933, -0.08182217, 1.749297, 1, 0, 0.01176471, 1,
3.175518, -2.096981, 3.315656, 1, 0, 0.007843138, 1
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
0.2115149, -4.919829, -6.634342, 0, -0.5, 0.5, 0.5,
0.2115149, -4.919829, -6.634342, 1, -0.5, 0.5, 0.5,
0.2115149, -4.919829, -6.634342, 1, 1.5, 0.5, 0.5,
0.2115149, -4.919829, -6.634342, 0, 1.5, 0.5, 0.5
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
-3.757285, -0.09134781, -6.634342, 0, -0.5, 0.5, 0.5,
-3.757285, -0.09134781, -6.634342, 1, -0.5, 0.5, 0.5,
-3.757285, -0.09134781, -6.634342, 1, 1.5, 0.5, 0.5,
-3.757285, -0.09134781, -6.634342, 0, 1.5, 0.5, 0.5
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
-3.757285, -4.919829, 0.1314795, 0, -0.5, 0.5, 0.5,
-3.757285, -4.919829, 0.1314795, 1, -0.5, 0.5, 0.5,
-3.757285, -4.919829, 0.1314795, 1, 1.5, 0.5, 0.5,
-3.757285, -4.919829, 0.1314795, 0, 1.5, 0.5, 0.5
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
-2, -3.805564, -5.072999,
3, -3.805564, -5.072999,
-2, -3.805564, -5.072999,
-2, -3.991275, -5.333223,
-1, -3.805564, -5.072999,
-1, -3.991275, -5.333223,
0, -3.805564, -5.072999,
0, -3.991275, -5.333223,
1, -3.805564, -5.072999,
1, -3.991275, -5.333223,
2, -3.805564, -5.072999,
2, -3.991275, -5.333223,
3, -3.805564, -5.072999,
3, -3.991275, -5.333223
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
-2, -4.362696, -5.853671, 0, -0.5, 0.5, 0.5,
-2, -4.362696, -5.853671, 1, -0.5, 0.5, 0.5,
-2, -4.362696, -5.853671, 1, 1.5, 0.5, 0.5,
-2, -4.362696, -5.853671, 0, 1.5, 0.5, 0.5,
-1, -4.362696, -5.853671, 0, -0.5, 0.5, 0.5,
-1, -4.362696, -5.853671, 1, -0.5, 0.5, 0.5,
-1, -4.362696, -5.853671, 1, 1.5, 0.5, 0.5,
-1, -4.362696, -5.853671, 0, 1.5, 0.5, 0.5,
0, -4.362696, -5.853671, 0, -0.5, 0.5, 0.5,
0, -4.362696, -5.853671, 1, -0.5, 0.5, 0.5,
0, -4.362696, -5.853671, 1, 1.5, 0.5, 0.5,
0, -4.362696, -5.853671, 0, 1.5, 0.5, 0.5,
1, -4.362696, -5.853671, 0, -0.5, 0.5, 0.5,
1, -4.362696, -5.853671, 1, -0.5, 0.5, 0.5,
1, -4.362696, -5.853671, 1, 1.5, 0.5, 0.5,
1, -4.362696, -5.853671, 0, 1.5, 0.5, 0.5,
2, -4.362696, -5.853671, 0, -0.5, 0.5, 0.5,
2, -4.362696, -5.853671, 1, -0.5, 0.5, 0.5,
2, -4.362696, -5.853671, 1, 1.5, 0.5, 0.5,
2, -4.362696, -5.853671, 0, 1.5, 0.5, 0.5,
3, -4.362696, -5.853671, 0, -0.5, 0.5, 0.5,
3, -4.362696, -5.853671, 1, -0.5, 0.5, 0.5,
3, -4.362696, -5.853671, 1, 1.5, 0.5, 0.5,
3, -4.362696, -5.853671, 0, 1.5, 0.5, 0.5
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
-2.841408, -2, -5.072999,
-2.841408, 2, -5.072999,
-2.841408, -2, -5.072999,
-2.994054, -2, -5.333223,
-2.841408, 0, -5.072999,
-2.994054, 0, -5.333223,
-2.841408, 2, -5.072999,
-2.994054, 2, -5.333223
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
-3.299346, -2, -5.853671, 0, -0.5, 0.5, 0.5,
-3.299346, -2, -5.853671, 1, -0.5, 0.5, 0.5,
-3.299346, -2, -5.853671, 1, 1.5, 0.5, 0.5,
-3.299346, -2, -5.853671, 0, 1.5, 0.5, 0.5,
-3.299346, 0, -5.853671, 0, -0.5, 0.5, 0.5,
-3.299346, 0, -5.853671, 1, -0.5, 0.5, 0.5,
-3.299346, 0, -5.853671, 1, 1.5, 0.5, 0.5,
-3.299346, 0, -5.853671, 0, 1.5, 0.5, 0.5,
-3.299346, 2, -5.853671, 0, -0.5, 0.5, 0.5,
-3.299346, 2, -5.853671, 1, -0.5, 0.5, 0.5,
-3.299346, 2, -5.853671, 1, 1.5, 0.5, 0.5,
-3.299346, 2, -5.853671, 0, 1.5, 0.5, 0.5
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
-2.841408, -3.805564, -4,
-2.841408, -3.805564, 4,
-2.841408, -3.805564, -4,
-2.994054, -3.991275, -4,
-2.841408, -3.805564, -2,
-2.994054, -3.991275, -2,
-2.841408, -3.805564, 0,
-2.994054, -3.991275, 0,
-2.841408, -3.805564, 2,
-2.994054, -3.991275, 2,
-2.841408, -3.805564, 4,
-2.994054, -3.991275, 4
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
-3.299346, -4.362696, -4, 0, -0.5, 0.5, 0.5,
-3.299346, -4.362696, -4, 1, -0.5, 0.5, 0.5,
-3.299346, -4.362696, -4, 1, 1.5, 0.5, 0.5,
-3.299346, -4.362696, -4, 0, 1.5, 0.5, 0.5,
-3.299346, -4.362696, -2, 0, -0.5, 0.5, 0.5,
-3.299346, -4.362696, -2, 1, -0.5, 0.5, 0.5,
-3.299346, -4.362696, -2, 1, 1.5, 0.5, 0.5,
-3.299346, -4.362696, -2, 0, 1.5, 0.5, 0.5,
-3.299346, -4.362696, 0, 0, -0.5, 0.5, 0.5,
-3.299346, -4.362696, 0, 1, -0.5, 0.5, 0.5,
-3.299346, -4.362696, 0, 1, 1.5, 0.5, 0.5,
-3.299346, -4.362696, 0, 0, 1.5, 0.5, 0.5,
-3.299346, -4.362696, 2, 0, -0.5, 0.5, 0.5,
-3.299346, -4.362696, 2, 1, -0.5, 0.5, 0.5,
-3.299346, -4.362696, 2, 1, 1.5, 0.5, 0.5,
-3.299346, -4.362696, 2, 0, 1.5, 0.5, 0.5,
-3.299346, -4.362696, 4, 0, -0.5, 0.5, 0.5,
-3.299346, -4.362696, 4, 1, -0.5, 0.5, 0.5,
-3.299346, -4.362696, 4, 1, 1.5, 0.5, 0.5,
-3.299346, -4.362696, 4, 0, 1.5, 0.5, 0.5
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
-2.841408, -3.805564, -5.072999,
-2.841408, 3.622868, -5.072999,
-2.841408, -3.805564, 5.335958,
-2.841408, 3.622868, 5.335958,
-2.841408, -3.805564, -5.072999,
-2.841408, -3.805564, 5.335958,
-2.841408, 3.622868, -5.072999,
-2.841408, 3.622868, 5.335958,
-2.841408, -3.805564, -5.072999,
3.264438, -3.805564, -5.072999,
-2.841408, -3.805564, 5.335958,
3.264438, -3.805564, 5.335958,
-2.841408, 3.622868, -5.072999,
3.264438, 3.622868, -5.072999,
-2.841408, 3.622868, 5.335958,
3.264438, 3.622868, 5.335958,
3.264438, -3.805564, -5.072999,
3.264438, 3.622868, -5.072999,
3.264438, -3.805564, 5.335958,
3.264438, 3.622868, 5.335958,
3.264438, -3.805564, -5.072999,
3.264438, -3.805564, 5.335958,
3.264438, 3.622868, -5.072999,
3.264438, 3.622868, 5.335958
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
var radius = 7.56689;
var distance = 33.66595;
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
mvMatrix.translate( -0.2115149, 0.09134781, -0.1314795 );
mvMatrix.scale( 1.339941, 1.101372, 0.7860029 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.66595);
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
flufenprox<-read.table("flufenprox.xyz")
```

```
## Error in read.table("flufenprox.xyz"): no lines available in input
```

```r
x<-flufenprox$V2
```

```
## Error in eval(expr, envir, enclos): object 'flufenprox' not found
```

```r
y<-flufenprox$V3
```

```
## Error in eval(expr, envir, enclos): object 'flufenprox' not found
```

```r
z<-flufenprox$V4
```

```
## Error in eval(expr, envir, enclos): object 'flufenprox' not found
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
-2.752488, -2.551105, -2.358295, 0, 0, 1, 1, 1,
-2.721186, -1.239187, -0.6160863, 1, 0, 0, 1, 1,
-2.559514, 0.6142172, -1.606175, 1, 0, 0, 1, 1,
-2.369674, 0.9355906, -1.484229, 1, 0, 0, 1, 1,
-2.366634, 0.5396123, 0.1339904, 1, 0, 0, 1, 1,
-2.273989, -0.559907, 0.6267958, 1, 0, 0, 1, 1,
-2.266509, 0.6571707, -0.1776791, 0, 0, 0, 1, 1,
-2.207142, -0.2330369, -0.9923804, 0, 0, 0, 1, 1,
-2.197751, -2.911524, -2.163905, 0, 0, 0, 1, 1,
-2.147302, -1.43327, -0.673233, 0, 0, 0, 1, 1,
-2.140884, -0.6760471, -2.352533, 0, 0, 0, 1, 1,
-2.130449, 0.302239, -1.847065, 0, 0, 0, 1, 1,
-2.109967, -0.2101922, -2.521958, 0, 0, 0, 1, 1,
-2.057043, 1.147838, -0.6070294, 1, 1, 1, 1, 1,
-2.021173, -1.348764, -1.947577, 1, 1, 1, 1, 1,
-2.006305, -0.4864959, -2.39001, 1, 1, 1, 1, 1,
-2.000675, -0.5309179, -1.077981, 1, 1, 1, 1, 1,
-2.000396, -1.555258, -2.188784, 1, 1, 1, 1, 1,
-1.947467, 0.0162781, -1.135506, 1, 1, 1, 1, 1,
-1.941352, 0.2394887, 0.2365683, 1, 1, 1, 1, 1,
-1.878478, 0.2772455, -3.242911, 1, 1, 1, 1, 1,
-1.849254, 0.2420666, -0.6595227, 1, 1, 1, 1, 1,
-1.848676, 0.3381357, -2.462932, 1, 1, 1, 1, 1,
-1.847173, -0.4038863, -1.937628, 1, 1, 1, 1, 1,
-1.840984, 0.3182822, -1.739027, 1, 1, 1, 1, 1,
-1.806516, -0.6570355, -1.603254, 1, 1, 1, 1, 1,
-1.804241, -0.513508, -0.7208216, 1, 1, 1, 1, 1,
-1.797889, -0.4883911, -0.8452354, 1, 1, 1, 1, 1,
-1.797094, 0.04325878, -0.09097794, 0, 0, 1, 1, 1,
-1.783443, 0.01711522, -1.496614, 1, 0, 0, 1, 1,
-1.779885, 0.6870259, -3.402796, 1, 0, 0, 1, 1,
-1.757493, 1.372473, 0.2105637, 1, 0, 0, 1, 1,
-1.750481, 0.056583, -3.496086, 1, 0, 0, 1, 1,
-1.748334, -0.405302, -0.4191735, 1, 0, 0, 1, 1,
-1.747418, -1.156808, -1.061098, 0, 0, 0, 1, 1,
-1.732357, 0.8779336, -0.863816, 0, 0, 0, 1, 1,
-1.687147, -0.4169739, -2.6176, 0, 0, 0, 1, 1,
-1.679163, 0.2563048, -1.46434, 0, 0, 0, 1, 1,
-1.677153, 1.094019, -1.262618, 0, 0, 0, 1, 1,
-1.673463, 0.02959736, -0.8881122, 0, 0, 0, 1, 1,
-1.666347, -0.02189005, -1.514873, 0, 0, 0, 1, 1,
-1.653054, -0.3887233, 0.004628763, 1, 1, 1, 1, 1,
-1.649888, -0.3262014, -0.8098927, 1, 1, 1, 1, 1,
-1.635154, 0.7193999, -1.243639, 1, 1, 1, 1, 1,
-1.632675, -2.433376, -1.35917, 1, 1, 1, 1, 1,
-1.632295, -0.2036036, -2.256063, 1, 1, 1, 1, 1,
-1.627879, 0.1294485, -2.554815, 1, 1, 1, 1, 1,
-1.619766, -0.9503214, -1.249192, 1, 1, 1, 1, 1,
-1.601693, 0.5797712, 0.9336016, 1, 1, 1, 1, 1,
-1.597082, 0.4987057, -1.236051, 1, 1, 1, 1, 1,
-1.593142, -0.3879062, -2.451165, 1, 1, 1, 1, 1,
-1.592134, 1.354881, 0.2034413, 1, 1, 1, 1, 1,
-1.585231, -0.8184762, -3.177792, 1, 1, 1, 1, 1,
-1.574125, 0.8085378, -2.41466, 1, 1, 1, 1, 1,
-1.556374, 1.480806, -2.121705, 1, 1, 1, 1, 1,
-1.55329, 1.513336, -0.3290461, 1, 1, 1, 1, 1,
-1.549399, 0.08471175, -3.483558, 0, 0, 1, 1, 1,
-1.547737, -0.4727448, -2.206625, 1, 0, 0, 1, 1,
-1.531773, 0.7317309, -0.2877542, 1, 0, 0, 1, 1,
-1.530769, -1.154984, -2.336679, 1, 0, 0, 1, 1,
-1.528954, -0.2247512, -2.704817, 1, 0, 0, 1, 1,
-1.526386, 0.8586971, -1.608225, 1, 0, 0, 1, 1,
-1.524656, 0.363874, 0.4201173, 0, 0, 0, 1, 1,
-1.521277, -0.1215357, -0.4505493, 0, 0, 0, 1, 1,
-1.519229, 1.412775, -1.315233, 0, 0, 0, 1, 1,
-1.518543, -0.2676577, -0.9781973, 0, 0, 0, 1, 1,
-1.516897, -0.364276, -2.701065, 0, 0, 0, 1, 1,
-1.505954, -1.326828, -2.577169, 0, 0, 0, 1, 1,
-1.464472, -0.1315147, -1.070112, 0, 0, 0, 1, 1,
-1.458118, 0.8384014, -2.993362, 1, 1, 1, 1, 1,
-1.455472, -0.05884338, -1.159362, 1, 1, 1, 1, 1,
-1.446334, 0.8657036, -1.381532, 1, 1, 1, 1, 1,
-1.443863, -0.1600025, -0.369234, 1, 1, 1, 1, 1,
-1.43712, -0.879315, -1.587269, 1, 1, 1, 1, 1,
-1.430777, 0.2163453, -1.499269, 1, 1, 1, 1, 1,
-1.420226, -0.007712334, -1.791342, 1, 1, 1, 1, 1,
-1.420074, -0.6024846, -1.327703, 1, 1, 1, 1, 1,
-1.417398, 0.8388088, -0.1377793, 1, 1, 1, 1, 1,
-1.405196, 1.900039, -0.734141, 1, 1, 1, 1, 1,
-1.399203, -1.289608, -0.8928059, 1, 1, 1, 1, 1,
-1.395068, 1.512193, -2.380954, 1, 1, 1, 1, 1,
-1.39314, -0.281219, -2.118239, 1, 1, 1, 1, 1,
-1.383345, 1.099879, -2.207351, 1, 1, 1, 1, 1,
-1.378167, -0.5717868, -1.224175, 1, 1, 1, 1, 1,
-1.370685, 0.3746428, 0.146251, 0, 0, 1, 1, 1,
-1.364257, 1.152813, -0.2741916, 1, 0, 0, 1, 1,
-1.35426, -1.134723, -2.312466, 1, 0, 0, 1, 1,
-1.353185, 1.379128, -1.499334, 1, 0, 0, 1, 1,
-1.342349, 0.2549469, -2.196908, 1, 0, 0, 1, 1,
-1.337636, -0.272187, -3.227292, 1, 0, 0, 1, 1,
-1.327697, -0.3261334, -1.160102, 0, 0, 0, 1, 1,
-1.318935, -0.2964085, -2.036091, 0, 0, 0, 1, 1,
-1.318207, 0.8842037, -1.850543, 0, 0, 0, 1, 1,
-1.309755, -0.3723671, -1.137125, 0, 0, 0, 1, 1,
-1.303709, 1.049577, -0.5265144, 0, 0, 0, 1, 1,
-1.29216, -0.8027982, -3.639816, 0, 0, 0, 1, 1,
-1.278467, 1.232197, -1.316883, 0, 0, 0, 1, 1,
-1.276149, 0.9905615, -1.922721, 1, 1, 1, 1, 1,
-1.270055, 0.4337355, 0.3727985, 1, 1, 1, 1, 1,
-1.269687, -0.008614214, -1.239888, 1, 1, 1, 1, 1,
-1.246871, -1.027416, -2.963163, 1, 1, 1, 1, 1,
-1.246756, -0.2324178, -1.435063, 1, 1, 1, 1, 1,
-1.242383, -0.1370424, -0.9062923, 1, 1, 1, 1, 1,
-1.23951, -0.6453626, -2.597531, 1, 1, 1, 1, 1,
-1.232248, 0.8002661, 0.4955066, 1, 1, 1, 1, 1,
-1.230043, -0.5951695, -1.977637, 1, 1, 1, 1, 1,
-1.22995, 1.702003, 1.343772, 1, 1, 1, 1, 1,
-1.221909, -0.3748813, -1.41551, 1, 1, 1, 1, 1,
-1.213933, 1.90326, -1.89263, 1, 1, 1, 1, 1,
-1.212254, -0.1134223, 0.3450776, 1, 1, 1, 1, 1,
-1.205962, 1.328524, -0.4386862, 1, 1, 1, 1, 1,
-1.203472, 1.165631, -0.9404026, 1, 1, 1, 1, 1,
-1.201834, -1.346826, -1.317436, 0, 0, 1, 1, 1,
-1.188992, 0.1758061, 0.171377, 1, 0, 0, 1, 1,
-1.187688, 1.913274, 0.1707574, 1, 0, 0, 1, 1,
-1.180048, 1.181411, -0.4246717, 1, 0, 0, 1, 1,
-1.179393, 1.063496, -1.410249, 1, 0, 0, 1, 1,
-1.178502, 0.01225307, -0.1348723, 1, 0, 0, 1, 1,
-1.175889, 1.116877, -0.5962354, 0, 0, 0, 1, 1,
-1.167108, -0.7604271, -0.7800006, 0, 0, 0, 1, 1,
-1.166132, -1.877992, -1.77941, 0, 0, 0, 1, 1,
-1.159457, 0.2582631, -0.4817033, 0, 0, 0, 1, 1,
-1.158448, 0.7042252, -0.3397709, 0, 0, 0, 1, 1,
-1.15667, 0.2222635, -3.613008, 0, 0, 0, 1, 1,
-1.15135, -0.2806306, -1.300967, 0, 0, 0, 1, 1,
-1.144932, -0.3264692, -1.540259, 1, 1, 1, 1, 1,
-1.141672, 1.660615, -0.7690268, 1, 1, 1, 1, 1,
-1.137364, -0.3379205, -1.461085, 1, 1, 1, 1, 1,
-1.134768, -1.381739, -3.982295, 1, 1, 1, 1, 1,
-1.130718, 0.9526486, -0.7408655, 1, 1, 1, 1, 1,
-1.11829, -1.873434, -4.32238, 1, 1, 1, 1, 1,
-1.117213, 1.987961, 0.2384804, 1, 1, 1, 1, 1,
-1.112382, -1.044367, -0.9334245, 1, 1, 1, 1, 1,
-1.112317, 0.3598475, 0.7295284, 1, 1, 1, 1, 1,
-1.112314, -0.7389076, -1.767391, 1, 1, 1, 1, 1,
-1.108285, -1.942027, -1.526474, 1, 1, 1, 1, 1,
-1.103951, -0.7593703, -1.174868, 1, 1, 1, 1, 1,
-1.087933, 0.1446209, -3.743034, 1, 1, 1, 1, 1,
-1.087926, -0.1242025, -2.758046, 1, 1, 1, 1, 1,
-1.084545, -3.112559, -2.187028, 1, 1, 1, 1, 1,
-1.082491, -1.348146, -2.486211, 0, 0, 1, 1, 1,
-1.080021, -0.4281977, -0.1405495, 1, 0, 0, 1, 1,
-1.077878, -0.9379802, -2.235308, 1, 0, 0, 1, 1,
-1.059042, -0.584989, -2.617629, 1, 0, 0, 1, 1,
-1.058893, -0.1961465, -3.186639, 1, 0, 0, 1, 1,
-1.05363, 0.4968915, -0.007343908, 1, 0, 0, 1, 1,
-1.04188, 0.06155812, -3.972521, 0, 0, 0, 1, 1,
-1.040037, 0.3973553, 0.2525566, 0, 0, 0, 1, 1,
-1.036226, -1.252946, -2.886456, 0, 0, 0, 1, 1,
-1.0358, 2.200148, 0.5833757, 0, 0, 0, 1, 1,
-1.029935, -1.267122, -4.224154, 0, 0, 0, 1, 1,
-1.026954, -0.2483625, -0.1688154, 0, 0, 0, 1, 1,
-1.026846, -2.246325, -4.921412, 0, 0, 0, 1, 1,
-1.014931, -0.8643619, -0.6800075, 1, 1, 1, 1, 1,
-1.007549, -0.4568459, -1.262606, 1, 1, 1, 1, 1,
-1.006841, -1.138333, -2.157884, 1, 1, 1, 1, 1,
-1.001382, 1.001991, -1.278016, 1, 1, 1, 1, 1,
-1.001088, 0.2238672, -1.317935, 1, 1, 1, 1, 1,
-0.9973137, 0.5386401, -1.128911, 1, 1, 1, 1, 1,
-0.9884352, 0.130461, -3.04446, 1, 1, 1, 1, 1,
-0.9857432, -0.8306434, -1.865876, 1, 1, 1, 1, 1,
-0.9830787, -0.1216579, -1.01135, 1, 1, 1, 1, 1,
-0.9775888, -2.073762, -3.190084, 1, 1, 1, 1, 1,
-0.9761088, -1.059856, -2.953136, 1, 1, 1, 1, 1,
-0.9741702, -0.842932, -1.459654, 1, 1, 1, 1, 1,
-0.972448, 0.5733765, -2.43187, 1, 1, 1, 1, 1,
-0.9665743, -1.853651, -2.321201, 1, 1, 1, 1, 1,
-0.9608527, -0.2285603, -2.060326, 1, 1, 1, 1, 1,
-0.9605263, -0.8037657, -0.5897469, 0, 0, 1, 1, 1,
-0.9584435, -0.6699733, -2.127086, 1, 0, 0, 1, 1,
-0.9577856, -0.4630091, -0.3747992, 1, 0, 0, 1, 1,
-0.9570259, -1.371458, -3.111887, 1, 0, 0, 1, 1,
-0.9530729, 0.1933219, -0.7854625, 1, 0, 0, 1, 1,
-0.9465256, 1.477755, -1.64718, 1, 0, 0, 1, 1,
-0.9445885, 0.4406239, -2.146549, 0, 0, 0, 1, 1,
-0.939121, 1.790082, -1.229636, 0, 0, 0, 1, 1,
-0.934486, -0.6825589, -3.208569, 0, 0, 0, 1, 1,
-0.9343479, 0.5121806, -1.000271, 0, 0, 0, 1, 1,
-0.9266946, -0.4583051, -0.2632478, 0, 0, 0, 1, 1,
-0.9255257, 1.342507, 0.7906065, 0, 0, 0, 1, 1,
-0.9205395, -0.8078919, -2.334642, 0, 0, 0, 1, 1,
-0.9128291, -0.4262314, -0.6746839, 1, 1, 1, 1, 1,
-0.9068168, -0.5262768, -1.723831, 1, 1, 1, 1, 1,
-0.8982912, -0.7794974, -2.644867, 1, 1, 1, 1, 1,
-0.8979675, 1.626016, -0.2963409, 1, 1, 1, 1, 1,
-0.8929944, 0.1658095, -2.026114, 1, 1, 1, 1, 1,
-0.8802886, 0.5255311, -0.4352798, 1, 1, 1, 1, 1,
-0.8782515, 1.404037, -1.277693, 1, 1, 1, 1, 1,
-0.8734053, 0.2369624, -0.8461039, 1, 1, 1, 1, 1,
-0.8719831, -0.4273207, -2.292197, 1, 1, 1, 1, 1,
-0.8716211, -0.44502, -1.095355, 1, 1, 1, 1, 1,
-0.8678888, -1.908467, -2.031935, 1, 1, 1, 1, 1,
-0.8670056, 1.63259, -0.2023484, 1, 1, 1, 1, 1,
-0.8647242, -0.09689654, -1.995057, 1, 1, 1, 1, 1,
-0.864535, 1.595407, -2.098908, 1, 1, 1, 1, 1,
-0.8604224, -1.296786, -3.338711, 1, 1, 1, 1, 1,
-0.8499985, -0.569108, -1.969615, 0, 0, 1, 1, 1,
-0.8462875, -0.06899454, -3.200963, 1, 0, 0, 1, 1,
-0.8461165, -0.1359365, -1.434473, 1, 0, 0, 1, 1,
-0.8389307, 0.3013085, -1.314989, 1, 0, 0, 1, 1,
-0.8343419, 0.4054657, -1.23171, 1, 0, 0, 1, 1,
-0.8308132, -0.2882417, -2.264617, 1, 0, 0, 1, 1,
-0.8250915, 0.01360633, -1.730125, 0, 0, 0, 1, 1,
-0.8222669, -0.7474342, -2.47621, 0, 0, 0, 1, 1,
-0.8196561, 0.9021477, -0.5378306, 0, 0, 0, 1, 1,
-0.8188448, 0.8543493, -1.848741, 0, 0, 0, 1, 1,
-0.8106272, 1.347656, -0.1070262, 0, 0, 0, 1, 1,
-0.8056409, 0.2551941, -1.547403, 0, 0, 0, 1, 1,
-0.798875, -0.4161006, -0.9627969, 0, 0, 0, 1, 1,
-0.7948767, -0.4503912, -1.981389, 1, 1, 1, 1, 1,
-0.7934967, -0.4929111, -2.240585, 1, 1, 1, 1, 1,
-0.7929184, -1.872091, -4.43611, 1, 1, 1, 1, 1,
-0.7800602, 0.6045288, 1.973839, 1, 1, 1, 1, 1,
-0.779662, 1.135739, -1.294861, 1, 1, 1, 1, 1,
-0.7787857, 0.1844668, -1.799275, 1, 1, 1, 1, 1,
-0.775863, 0.8204582, -0.5096899, 1, 1, 1, 1, 1,
-0.7712693, -0.1800305, -0.3582489, 1, 1, 1, 1, 1,
-0.7688766, -0.6229341, -0.7278359, 1, 1, 1, 1, 1,
-0.7672084, -0.2887887, -1.72714, 1, 1, 1, 1, 1,
-0.7583939, -2.418427, -2.212841, 1, 1, 1, 1, 1,
-0.7576064, 1.352794, 1.650631, 1, 1, 1, 1, 1,
-0.7508606, 0.9866932, -1.818425, 1, 1, 1, 1, 1,
-0.74733, -0.0782593, -1.465447, 1, 1, 1, 1, 1,
-0.7438263, -0.1190007, -1.779268, 1, 1, 1, 1, 1,
-0.7375184, 0.06323067, -1.017066, 0, 0, 1, 1, 1,
-0.7366479, 3.085042, -0.6881269, 1, 0, 0, 1, 1,
-0.7359103, -0.3382921, -0.9266837, 1, 0, 0, 1, 1,
-0.7302198, -0.2011129, -2.356036, 1, 0, 0, 1, 1,
-0.72977, 2.797995, 0.228753, 1, 0, 0, 1, 1,
-0.7275103, 1.576678, 0.3199075, 1, 0, 0, 1, 1,
-0.7193616, 1.145184, 0.8682024, 0, 0, 0, 1, 1,
-0.7190918, -0.6587139, -2.813556, 0, 0, 0, 1, 1,
-0.7078103, -0.6452684, -2.613345, 0, 0, 0, 1, 1,
-0.6946405, -0.7061947, -0.651344, 0, 0, 0, 1, 1,
-0.6936703, 0.5802027, -0.7842104, 0, 0, 0, 1, 1,
-0.6894538, -0.4179066, -2.104178, 0, 0, 0, 1, 1,
-0.6872666, -0.3706652, -0.9769718, 0, 0, 0, 1, 1,
-0.6798866, -0.797762, -1.490461, 1, 1, 1, 1, 1,
-0.6775341, 0.3746172, 0.2814648, 1, 1, 1, 1, 1,
-0.6754956, -0.6759644, -2.721758, 1, 1, 1, 1, 1,
-0.6730529, -0.2738873, -1.857993, 1, 1, 1, 1, 1,
-0.6677982, 1.319462, -0.4424638, 1, 1, 1, 1, 1,
-0.6656198, 0.1523898, -0.154586, 1, 1, 1, 1, 1,
-0.6643109, -0.09626643, -1.988609, 1, 1, 1, 1, 1,
-0.6640195, -0.7904009, -2.958299, 1, 1, 1, 1, 1,
-0.6629322, -0.9475191, -2.243095, 1, 1, 1, 1, 1,
-0.6625653, -0.4710048, -0.4596366, 1, 1, 1, 1, 1,
-0.6620244, -1.177573, -3.34299, 1, 1, 1, 1, 1,
-0.6593632, 0.6802138, 0.25056, 1, 1, 1, 1, 1,
-0.6485057, 1.015787, -1.13594, 1, 1, 1, 1, 1,
-0.6466252, -0.2989133, -2.935501, 1, 1, 1, 1, 1,
-0.6449907, 0.1484889, -2.327793, 1, 1, 1, 1, 1,
-0.6446086, -0.189949, -2.696418, 0, 0, 1, 1, 1,
-0.6427807, -0.7215353, -2.038895, 1, 0, 0, 1, 1,
-0.6427638, -0.8479319, -1.505027, 1, 0, 0, 1, 1,
-0.6372235, 1.270903, 0.2475084, 1, 0, 0, 1, 1,
-0.637116, 0.5734012, -1.201262, 1, 0, 0, 1, 1,
-0.6360384, -0.7729235, -1.990541, 1, 0, 0, 1, 1,
-0.6317555, -0.5210958, -2.125918, 0, 0, 0, 1, 1,
-0.6288285, 0.810797, -0.9921811, 0, 0, 0, 1, 1,
-0.6287264, 1.288465, 0.4739637, 0, 0, 0, 1, 1,
-0.6246199, 0.6053244, -1.842089, 0, 0, 0, 1, 1,
-0.6228828, -0.1816112, -0.7519776, 0, 0, 0, 1, 1,
-0.6161161, 0.2588285, -1.121949, 0, 0, 0, 1, 1,
-0.6127217, -1.285294, -3.946306, 0, 0, 0, 1, 1,
-0.6037828, 0.7386666, 0.01056369, 1, 1, 1, 1, 1,
-0.6020297, 0.07772126, -1.738181, 1, 1, 1, 1, 1,
-0.5996957, 0.01062742, -1.606319, 1, 1, 1, 1, 1,
-0.5989885, -0.05314123, -3.038893, 1, 1, 1, 1, 1,
-0.5967458, -3.697383, -3.361626, 1, 1, 1, 1, 1,
-0.5944922, 0.7968656, 0.711795, 1, 1, 1, 1, 1,
-0.588963, 0.07962784, -1.02911, 1, 1, 1, 1, 1,
-0.5863373, -2.322068, -2.824381, 1, 1, 1, 1, 1,
-0.5838513, -0.5607729, -2.778228, 1, 1, 1, 1, 1,
-0.5819106, -1.449461, -3.927471, 1, 1, 1, 1, 1,
-0.5707634, -1.418075, -3.107188, 1, 1, 1, 1, 1,
-0.5691913, -0.03120023, -2.550934, 1, 1, 1, 1, 1,
-0.5587443, 0.8132305, -0.8018571, 1, 1, 1, 1, 1,
-0.5574471, 0.1949838, -1.997401, 1, 1, 1, 1, 1,
-0.5528237, -0.2517095, -0.9429659, 1, 1, 1, 1, 1,
-0.5524383, 1.36955, 1.145867, 0, 0, 1, 1, 1,
-0.5496508, 0.2956097, -0.6324686, 1, 0, 0, 1, 1,
-0.5485054, 0.190323, -2.153193, 1, 0, 0, 1, 1,
-0.5465811, -1.186345, -1.261667, 1, 0, 0, 1, 1,
-0.5455295, 0.01281779, -0.9960899, 1, 0, 0, 1, 1,
-0.5420269, -0.5104336, -0.7577428, 1, 0, 0, 1, 1,
-0.5410035, -0.3402147, -1.541037, 0, 0, 0, 1, 1,
-0.5329403, 0.7158918, -0.9594789, 0, 0, 0, 1, 1,
-0.5316702, -0.775439, -2.267068, 0, 0, 0, 1, 1,
-0.5256084, -0.942195, -4.154904, 0, 0, 0, 1, 1,
-0.5252151, 0.6879555, -1.676956, 0, 0, 0, 1, 1,
-0.5209262, -1.57818, -2.737767, 0, 0, 0, 1, 1,
-0.5201918, 0.1983092, 0.6424286, 0, 0, 0, 1, 1,
-0.5156853, -1.444592, -4.104674, 1, 1, 1, 1, 1,
-0.5149467, -0.1879065, -1.350365, 1, 1, 1, 1, 1,
-0.5092433, 0.5929434, -0.9338709, 1, 1, 1, 1, 1,
-0.504975, 0.7687635, 1.711794, 1, 1, 1, 1, 1,
-0.5043437, 0.3599086, 1.046722, 1, 1, 1, 1, 1,
-0.5041499, -0.2134032, -2.117979, 1, 1, 1, 1, 1,
-0.5036187, 1.625201, -0.1359087, 1, 1, 1, 1, 1,
-0.5028531, 1.806574, -0.4330836, 1, 1, 1, 1, 1,
-0.4989391, -0.002872555, 0.6314663, 1, 1, 1, 1, 1,
-0.4985154, -0.7225929, -2.846506, 1, 1, 1, 1, 1,
-0.4930525, -0.3336995, -2.901307, 1, 1, 1, 1, 1,
-0.4923505, 1.777971, -0.5707436, 1, 1, 1, 1, 1,
-0.491729, -0.07773279, -1.377229, 1, 1, 1, 1, 1,
-0.4899118, -0.03913012, -1.912837, 1, 1, 1, 1, 1,
-0.4876115, -0.3440458, -1.863774, 1, 1, 1, 1, 1,
-0.4821027, -0.5613165, -2.033075, 0, 0, 1, 1, 1,
-0.4815756, -0.5057291, -3.296826, 1, 0, 0, 1, 1,
-0.4770488, 0.6486609, -1.876204, 1, 0, 0, 1, 1,
-0.4755313, -0.01778109, -1.937707, 1, 0, 0, 1, 1,
-0.4700148, 0.1019935, -3.233371, 1, 0, 0, 1, 1,
-0.468422, -0.248505, -2.245466, 1, 0, 0, 1, 1,
-0.4666072, -1.580465, -2.922618, 0, 0, 0, 1, 1,
-0.4655155, -0.8237959, -2.505094, 0, 0, 0, 1, 1,
-0.4621225, 0.2970592, -0.4324356, 0, 0, 0, 1, 1,
-0.4596688, 1.135556, 0.1360696, 0, 0, 0, 1, 1,
-0.4587148, -1.290442, -2.914012, 0, 0, 0, 1, 1,
-0.4569868, 0.181019, -1.199169, 0, 0, 0, 1, 1,
-0.4536743, -0.06381732, -0.8356458, 0, 0, 0, 1, 1,
-0.4513654, 1.056701, 0.4230543, 1, 1, 1, 1, 1,
-0.4505015, -1.715195, -2.243562, 1, 1, 1, 1, 1,
-0.4496316, 0.01840482, -0.8066069, 1, 1, 1, 1, 1,
-0.4489139, -2.892425, -2.035501, 1, 1, 1, 1, 1,
-0.4487644, 2.686847, 0.7024702, 1, 1, 1, 1, 1,
-0.4470925, -0.06305414, -0.5034625, 1, 1, 1, 1, 1,
-0.44485, 1.444737, 0.7929386, 1, 1, 1, 1, 1,
-0.4447688, -0.325886, -0.6645192, 1, 1, 1, 1, 1,
-0.4380189, 0.6789466, -1.268233, 1, 1, 1, 1, 1,
-0.4372396, -0.8083136, -4.661213, 1, 1, 1, 1, 1,
-0.4318543, -1.401192, -3.909776, 1, 1, 1, 1, 1,
-0.4316288, 0.1880077, -3.280117, 1, 1, 1, 1, 1,
-0.4273859, -0.9140117, -2.892143, 1, 1, 1, 1, 1,
-0.4255046, -1.423062, -2.051482, 1, 1, 1, 1, 1,
-0.4245028, -0.7892449, -2.53095, 1, 1, 1, 1, 1,
-0.4226877, 1.113348, -1.243669, 0, 0, 1, 1, 1,
-0.4225645, 0.4219391, -0.7053924, 1, 0, 0, 1, 1,
-0.4211091, -0.03225373, -1.19345, 1, 0, 0, 1, 1,
-0.4195996, -0.864324, -2.617898, 1, 0, 0, 1, 1,
-0.4193493, -0.9570844, -2.425195, 1, 0, 0, 1, 1,
-0.4140833, -0.4600576, -4.234172, 1, 0, 0, 1, 1,
-0.4110923, -0.3287166, -1.277018, 0, 0, 0, 1, 1,
-0.4102281, -0.3792543, -2.952909, 0, 0, 0, 1, 1,
-0.4095026, -1.497008, -3.787423, 0, 0, 0, 1, 1,
-0.4086867, -0.2603387, -2.725661, 0, 0, 0, 1, 1,
-0.4059357, 0.8172119, 0.9890424, 0, 0, 0, 1, 1,
-0.4046972, -0.1048352, -1.526459, 0, 0, 0, 1, 1,
-0.4024777, -0.8182144, -2.876504, 0, 0, 0, 1, 1,
-0.4019746, 1.779413, -0.7525154, 1, 1, 1, 1, 1,
-0.3960907, -0.7698181, -4.604114, 1, 1, 1, 1, 1,
-0.3922153, 0.8548229, 0.3098872, 1, 1, 1, 1, 1,
-0.3871666, 0.3504903, 0.7602416, 1, 1, 1, 1, 1,
-0.3845731, 1.712712, 0.03859558, 1, 1, 1, 1, 1,
-0.3816041, 1.466385, -0.8199872, 1, 1, 1, 1, 1,
-0.3772949, 0.2219197, -1.031274, 1, 1, 1, 1, 1,
-0.3772444, 0.7455788, 1.219903, 1, 1, 1, 1, 1,
-0.374481, 2.615608, -0.828144, 1, 1, 1, 1, 1,
-0.369074, -0.7985679, -2.464951, 1, 1, 1, 1, 1,
-0.3633966, 0.3618566, -0.3448943, 1, 1, 1, 1, 1,
-0.3603578, -1.455177, -3.686446, 1, 1, 1, 1, 1,
-0.3595292, -0.3098633, -1.341691, 1, 1, 1, 1, 1,
-0.3549415, 0.3127004, -1.467091, 1, 1, 1, 1, 1,
-0.354462, 0.3457072, 0.1952551, 1, 1, 1, 1, 1,
-0.3535534, 0.2372235, -1.569287, 0, 0, 1, 1, 1,
-0.3526136, -2.110473, -1.652461, 1, 0, 0, 1, 1,
-0.3483874, -0.2617797, -2.78691, 1, 0, 0, 1, 1,
-0.3470819, -1.007769, -4.429276, 1, 0, 0, 1, 1,
-0.3454854, -1.311372, -3.684967, 1, 0, 0, 1, 1,
-0.3453042, 0.13216, -3.694261, 1, 0, 0, 1, 1,
-0.3451206, -0.9233699, -2.381809, 0, 0, 0, 1, 1,
-0.3447606, -0.2088654, -2.250148, 0, 0, 0, 1, 1,
-0.3442792, 1.285324, -3.220366, 0, 0, 0, 1, 1,
-0.340683, -0.9864938, -4.838705, 0, 0, 0, 1, 1,
-0.3403402, -0.2047563, -1.804199, 0, 0, 0, 1, 1,
-0.338543, 0.06038185, -1.757921, 0, 0, 0, 1, 1,
-0.3348037, 0.6056728, 0.7528822, 0, 0, 0, 1, 1,
-0.3341241, -0.445162, -3.073497, 1, 1, 1, 1, 1,
-0.3280447, -0.4802431, -4.312022, 1, 1, 1, 1, 1,
-0.3264655, 0.1804328, -2.672016, 1, 1, 1, 1, 1,
-0.3235705, -0.4273287, -1.520564, 1, 1, 1, 1, 1,
-0.3234234, -0.3756193, -4.611746, 1, 1, 1, 1, 1,
-0.3210631, -0.7333164, -3.612753, 1, 1, 1, 1, 1,
-0.3171994, 0.5450051, 1.487644, 1, 1, 1, 1, 1,
-0.3167655, 0.3603572, -1.949548, 1, 1, 1, 1, 1,
-0.3165439, -1.496565, -1.798576, 1, 1, 1, 1, 1,
-0.3146103, 0.4410918, -1.514136, 1, 1, 1, 1, 1,
-0.3143768, 1.003192, 1.294025, 1, 1, 1, 1, 1,
-0.311399, 1.401596, 0.06380042, 1, 1, 1, 1, 1,
-0.3099265, 1.043201, -0.2963516, 1, 1, 1, 1, 1,
-0.3082594, -2.406515, -2.174048, 1, 1, 1, 1, 1,
-0.301659, -0.7264923, -1.710417, 1, 1, 1, 1, 1,
-0.3006766, -0.9875622, -0.5540468, 0, 0, 1, 1, 1,
-0.2991896, 0.3838317, -1.398461, 1, 0, 0, 1, 1,
-0.2944793, -0.6284744, -3.659914, 1, 0, 0, 1, 1,
-0.2942926, -0.2624576, -1.99427, 1, 0, 0, 1, 1,
-0.2940636, 0.7829558, 0.009144347, 1, 0, 0, 1, 1,
-0.2935096, -1.107283, -3.646996, 1, 0, 0, 1, 1,
-0.2919326, 1.584232, -0.1941092, 0, 0, 0, 1, 1,
-0.2847389, 1.012708, 1.295785, 0, 0, 0, 1, 1,
-0.2797945, 0.07580653, -1.761369, 0, 0, 0, 1, 1,
-0.2758639, -0.4295651, -2.816246, 0, 0, 0, 1, 1,
-0.2610226, 0.64483, -1.593569, 0, 0, 0, 1, 1,
-0.2529557, -0.006184648, -1.359013, 0, 0, 0, 1, 1,
-0.2507962, -0.07777537, -0.8726329, 0, 0, 0, 1, 1,
-0.2507039, 1.878218, -1.284346, 1, 1, 1, 1, 1,
-0.2495705, 1.408433, -0.9933547, 1, 1, 1, 1, 1,
-0.2479918, -0.6894132, -3.633804, 1, 1, 1, 1, 1,
-0.245958, 0.9127247, -1.083065, 1, 1, 1, 1, 1,
-0.2449151, 0.04902343, -0.003393114, 1, 1, 1, 1, 1,
-0.243102, 0.1272284, -1.08262, 1, 1, 1, 1, 1,
-0.2423063, -0.3917343, -0.3240966, 1, 1, 1, 1, 1,
-0.2329858, 0.1594909, -1.319313, 1, 1, 1, 1, 1,
-0.2313824, -1.589352, -2.312587, 1, 1, 1, 1, 1,
-0.2288901, -0.4910676, -2.308314, 1, 1, 1, 1, 1,
-0.2268032, -1.189752, -3.511794, 1, 1, 1, 1, 1,
-0.2263006, -0.09269314, -2.221593, 1, 1, 1, 1, 1,
-0.2249435, 0.7853386, -0.2557705, 1, 1, 1, 1, 1,
-0.2247929, 0.173753, -0.6124729, 1, 1, 1, 1, 1,
-0.2235006, -0.8106084, -2.385968, 1, 1, 1, 1, 1,
-0.2230141, 0.01377123, -2.007656, 0, 0, 1, 1, 1,
-0.2225202, 0.03665087, -2.162659, 1, 0, 0, 1, 1,
-0.2197574, -0.28673, -2.366399, 1, 0, 0, 1, 1,
-0.2157419, 0.9403715, 1.559857, 1, 0, 0, 1, 1,
-0.2137904, 0.6132791, -1.221885, 1, 0, 0, 1, 1,
-0.2101705, -2.423273, -2.056594, 1, 0, 0, 1, 1,
-0.2083839, 0.6468282, -1.358154, 0, 0, 0, 1, 1,
-0.207646, -2.184131, -0.9458646, 0, 0, 0, 1, 1,
-0.203888, 1.514407, 1.117574, 0, 0, 0, 1, 1,
-0.1986642, -1.570786, -2.03198, 0, 0, 0, 1, 1,
-0.1981763, 1.373075, -0.4407452, 0, 0, 0, 1, 1,
-0.1975827, 0.6822652, 0.8843902, 0, 0, 0, 1, 1,
-0.1971791, -0.1074821, -2.164788, 0, 0, 0, 1, 1,
-0.1958411, -0.5203525, -3.952945, 1, 1, 1, 1, 1,
-0.1936595, -1.284809, -4.024208, 1, 1, 1, 1, 1,
-0.1829634, -1.010077, -2.294626, 1, 1, 1, 1, 1,
-0.1814087, -0.09658406, -3.589223, 1, 1, 1, 1, 1,
-0.1775244, -0.1805815, -3.600837, 1, 1, 1, 1, 1,
-0.1773854, 0.6361309, -0.1864486, 1, 1, 1, 1, 1,
-0.1773579, 1.572512, 0.1733883, 1, 1, 1, 1, 1,
-0.1737492, 0.2167613, 0.05458921, 1, 1, 1, 1, 1,
-0.1713076, 0.737806, -1.112962, 1, 1, 1, 1, 1,
-0.169216, -0.4136769, -4.402448, 1, 1, 1, 1, 1,
-0.167501, 0.8226057, -1.113153, 1, 1, 1, 1, 1,
-0.1666827, -0.08216832, -0.06803399, 1, 1, 1, 1, 1,
-0.1664127, -0.06997608, -2.528947, 1, 1, 1, 1, 1,
-0.1596458, -1.553987, -1.634919, 1, 1, 1, 1, 1,
-0.15725, 0.3353288, 0.512983, 1, 1, 1, 1, 1,
-0.1559289, 0.3212575, -1.24725, 0, 0, 1, 1, 1,
-0.1547256, -1.514621, -3.050532, 1, 0, 0, 1, 1,
-0.1541096, -1.205161, -4.075233, 1, 0, 0, 1, 1,
-0.152816, -0.6260286, -0.4173078, 1, 0, 0, 1, 1,
-0.1490619, -0.7263102, -2.854073, 1, 0, 0, 1, 1,
-0.1465022, 0.9645292, -0.3628559, 1, 0, 0, 1, 1,
-0.1425242, 0.6528643, 0.2759042, 0, 0, 0, 1, 1,
-0.1419861, 1.891448, -0.8451445, 0, 0, 0, 1, 1,
-0.140792, 1.183599, 0.3107527, 0, 0, 0, 1, 1,
-0.1392099, 0.2819712, -0.9339703, 0, 0, 0, 1, 1,
-0.1311357, 0.6474744, -0.22937, 0, 0, 0, 1, 1,
-0.1233262, 0.8204321, -0.1658795, 0, 0, 0, 1, 1,
-0.1211544, 1.918283, 2.322295, 0, 0, 0, 1, 1,
-0.1211099, 1.900376, -0.3729212, 1, 1, 1, 1, 1,
-0.1188679, -0.3363887, -1.88271, 1, 1, 1, 1, 1,
-0.1186182, -0.3027113, -3.5489, 1, 1, 1, 1, 1,
-0.1159963, -0.1910661, -1.84435, 1, 1, 1, 1, 1,
-0.1156422, 0.3311902, -0.638393, 1, 1, 1, 1, 1,
-0.1109367, 0.2193724, 1.147006, 1, 1, 1, 1, 1,
-0.1101584, 2.089934, 1.054282, 1, 1, 1, 1, 1,
-0.1096028, 1.182789, -0.2831537, 1, 1, 1, 1, 1,
-0.1095223, -0.3249659, -1.87287, 1, 1, 1, 1, 1,
-0.1084067, -1.554091, -4.130344, 1, 1, 1, 1, 1,
-0.1083978, 0.2384745, -1.274857, 1, 1, 1, 1, 1,
-0.1058605, 0.3168922, 0.07250936, 1, 1, 1, 1, 1,
-0.1056013, -0.6244832, -1.480144, 1, 1, 1, 1, 1,
-0.1023415, -0.5536626, -2.272405, 1, 1, 1, 1, 1,
-0.09760232, 3.514687, -1.092384, 1, 1, 1, 1, 1,
-0.09588837, 0.0534255, -2.213834, 0, 0, 1, 1, 1,
-0.09560087, 0.01671435, -1.576208, 1, 0, 0, 1, 1,
-0.09234794, 0.8333204, 1.488496, 1, 0, 0, 1, 1,
-0.09141228, -0.8659705, -3.255115, 1, 0, 0, 1, 1,
-0.09068298, 0.2507204, -2.632354, 1, 0, 0, 1, 1,
-0.09041212, -0.4889572, -3.575903, 1, 0, 0, 1, 1,
-0.08599054, -0.1667652, -3.537197, 0, 0, 0, 1, 1,
-0.07960209, -0.4298573, -2.142658, 0, 0, 0, 1, 1,
-0.07886527, -0.1258977, -2.88887, 0, 0, 0, 1, 1,
-0.0780226, -0.7840212, -4.859505, 0, 0, 0, 1, 1,
-0.07797298, -0.07173733, -2.28943, 0, 0, 0, 1, 1,
-0.07642253, 0.5964212, 0.7601006, 0, 0, 0, 1, 1,
-0.07563632, 0.3841354, 0.4902298, 0, 0, 0, 1, 1,
-0.07179, 0.9095938, -1.593288, 1, 1, 1, 1, 1,
-0.07126106, -0.9983255, -1.196618, 1, 1, 1, 1, 1,
-0.07003269, 0.5824433, 1.089423, 1, 1, 1, 1, 1,
-0.06595147, 0.1364309, -1.637565, 1, 1, 1, 1, 1,
-0.0616509, -0.4077866, -2.091867, 1, 1, 1, 1, 1,
-0.05671657, -0.5740596, -3.88922, 1, 1, 1, 1, 1,
-0.05495506, 0.1469049, 2.081469, 1, 1, 1, 1, 1,
-0.05445942, -0.6252724, -4.64078, 1, 1, 1, 1, 1,
-0.05008892, -2.701873, -2.465235, 1, 1, 1, 1, 1,
-0.0465732, 0.3062152, -0.1538959, 1, 1, 1, 1, 1,
-0.04315421, -1.168514, -3.197909, 1, 1, 1, 1, 1,
-0.04002737, -0.5425696, -2.43845, 1, 1, 1, 1, 1,
-0.03774154, 0.5237918, 0.3167946, 1, 1, 1, 1, 1,
-0.03563952, -2.335886, -1.055491, 1, 1, 1, 1, 1,
-0.03551319, 1.323863, -2.048605, 1, 1, 1, 1, 1,
-0.0352269, 1.313081, -2.145417, 0, 0, 1, 1, 1,
-0.03354828, -0.4648081, -3.19101, 1, 0, 0, 1, 1,
-0.03106171, 0.8294997, -1.038498, 1, 0, 0, 1, 1,
-0.02757381, 0.7583582, -1.367461, 1, 0, 0, 1, 1,
-0.02194811, -1.001307, -3.114266, 1, 0, 0, 1, 1,
-0.02194529, 1.840487, -1.542801, 1, 0, 0, 1, 1,
-0.02078137, -0.7909744, -3.985568, 0, 0, 0, 1, 1,
-0.01884356, -0.7150337, -4.783415, 0, 0, 0, 1, 1,
-0.01759957, 0.03210882, -1.438753, 0, 0, 0, 1, 1,
-0.01621361, 1.284949, -0.6328704, 0, 0, 0, 1, 1,
-0.0121014, 0.3219225, -0.9788481, 0, 0, 0, 1, 1,
-0.01004776, 1.241333, -0.9074963, 0, 0, 0, 1, 1,
-0.008141306, 0.2707817, 0.275332, 0, 0, 0, 1, 1,
-0.005588355, -0.4358939, -1.829933, 1, 1, 1, 1, 1,
-0.003820993, 0.7376855, 1.033646, 1, 1, 1, 1, 1,
-0.001709308, 1.134899, 0.2505549, 1, 1, 1, 1, 1,
-0.0006339857, -0.2529763, -2.146792, 1, 1, 1, 1, 1,
0.004517158, 0.1432023, 0.07185467, 1, 1, 1, 1, 1,
0.01305265, -0.1427983, 2.478421, 1, 1, 1, 1, 1,
0.01557132, 1.378009, 0.8616834, 1, 1, 1, 1, 1,
0.02016423, 2.151754, -0.6367016, 1, 1, 1, 1, 1,
0.02242517, -0.1173349, 2.777737, 1, 1, 1, 1, 1,
0.02320681, 0.9563107, -0.004826861, 1, 1, 1, 1, 1,
0.02397243, -1.548433, 2.497079, 1, 1, 1, 1, 1,
0.02476973, -0.3199578, 1.922107, 1, 1, 1, 1, 1,
0.02740411, -0.429287, 3.897255, 1, 1, 1, 1, 1,
0.03625248, -1.021752, 3.309284, 1, 1, 1, 1, 1,
0.03643965, -0.6358795, 2.677731, 1, 1, 1, 1, 1,
0.0374003, -1.962028, 3.213234, 0, 0, 1, 1, 1,
0.03744797, 0.5536445, 1.075748, 1, 0, 0, 1, 1,
0.03751855, -0.1220353, 2.419438, 1, 0, 0, 1, 1,
0.04060243, -0.1505669, 1.853467, 1, 0, 0, 1, 1,
0.04130482, -0.3026007, 3.614146, 1, 0, 0, 1, 1,
0.0422138, -0.02879762, 1.948712, 1, 0, 0, 1, 1,
0.04411566, -0.6227528, 4.210047, 0, 0, 0, 1, 1,
0.05117387, 1.432535, 0.01417744, 0, 0, 0, 1, 1,
0.05731764, -0.3920695, 1.958061, 0, 0, 0, 1, 1,
0.06065577, 0.932135, -1.984083, 0, 0, 0, 1, 1,
0.06217297, -0.7011511, 4.079393, 0, 0, 0, 1, 1,
0.06446746, 0.5648122, -0.9847728, 0, 0, 0, 1, 1,
0.07400309, -0.6949823, 3.21949, 0, 0, 0, 1, 1,
0.07520878, 1.18343, 1.745312, 1, 1, 1, 1, 1,
0.07709177, -0.8430904, 3.944924, 1, 1, 1, 1, 1,
0.08904562, -0.634971, 3.896482, 1, 1, 1, 1, 1,
0.09175578, -0.06517556, 1.827111, 1, 1, 1, 1, 1,
0.09531596, -0.2605603, 4.063654, 1, 1, 1, 1, 1,
0.09577207, -0.5750172, 5.037601, 1, 1, 1, 1, 1,
0.09605087, -1.174825, 3.53306, 1, 1, 1, 1, 1,
0.09834019, -0.9653083, 4.097205, 1, 1, 1, 1, 1,
0.0988318, -0.3722719, 2.336275, 1, 1, 1, 1, 1,
0.1002138, 0.5143422, -2.369219, 1, 1, 1, 1, 1,
0.1020276, 0.1697242, 1.664868, 1, 1, 1, 1, 1,
0.1051927, 0.7005809, -1.170793, 1, 1, 1, 1, 1,
0.1065042, -0.9012373, 3.610492, 1, 1, 1, 1, 1,
0.1075988, -0.2414534, 2.642241, 1, 1, 1, 1, 1,
0.1176224, 1.420445, -0.7749956, 1, 1, 1, 1, 1,
0.1181355, -1.107224, 0.4104829, 0, 0, 1, 1, 1,
0.1215359, -0.1889689, 1.646565, 1, 0, 0, 1, 1,
0.1225706, 0.2590873, 2.031125, 1, 0, 0, 1, 1,
0.1253296, -0.3690163, 2.704774, 1, 0, 0, 1, 1,
0.1258453, 1.180075, -0.8003173, 1, 0, 0, 1, 1,
0.1269864, 0.8749828, 1.350329, 1, 0, 0, 1, 1,
0.1292567, -0.5926991, 2.710705, 0, 0, 0, 1, 1,
0.1303547, 0.05353452, 2.319758, 0, 0, 0, 1, 1,
0.1326093, -0.7655975, 5.184371, 0, 0, 0, 1, 1,
0.1360651, 1.094214, 0.4600211, 0, 0, 0, 1, 1,
0.136676, -0.6814552, 3.250566, 0, 0, 0, 1, 1,
0.1370169, 0.7969036, -0.9885002, 0, 0, 0, 1, 1,
0.1385435, 0.1646475, -1.013532, 0, 0, 0, 1, 1,
0.1458358, -0.2404064, 1.952324, 1, 1, 1, 1, 1,
0.1482072, 0.0430054, 2.697843, 1, 1, 1, 1, 1,
0.1523143, 0.5376149, 0.6660679, 1, 1, 1, 1, 1,
0.1524787, 2.31367, -1.719845, 1, 1, 1, 1, 1,
0.154136, 0.6369903, 0.07701367, 1, 1, 1, 1, 1,
0.1591004, 0.04431705, 0.3130417, 1, 1, 1, 1, 1,
0.1599584, -1.575294, 2.224729, 1, 1, 1, 1, 1,
0.1616222, -0.2306866, 1.877999, 1, 1, 1, 1, 1,
0.1667543, -0.844319, 2.755815, 1, 1, 1, 1, 1,
0.1670724, -1.080682, 3.55655, 1, 1, 1, 1, 1,
0.1679834, 0.6408845, -1.1274, 1, 1, 1, 1, 1,
0.170256, -0.1850055, 2.005704, 1, 1, 1, 1, 1,
0.1705071, 0.3765313, -1.569861, 1, 1, 1, 1, 1,
0.1717031, 0.7280364, 2.545617, 1, 1, 1, 1, 1,
0.1742713, -1.580665, 5.03753, 1, 1, 1, 1, 1,
0.1755607, -1.122792, 4.202875, 0, 0, 1, 1, 1,
0.1756894, 0.04043403, 1.138208, 1, 0, 0, 1, 1,
0.1829511, 1.248639, -1.325378, 1, 0, 0, 1, 1,
0.1883354, 0.2493593, -0.4777755, 1, 0, 0, 1, 1,
0.1888039, -0.846247, 3.118417, 1, 0, 0, 1, 1,
0.1915234, 0.1551505, -0.09172237, 1, 0, 0, 1, 1,
0.1967893, 1.031887, 0.6021885, 0, 0, 0, 1, 1,
0.2021205, -0.193091, 1.849073, 0, 0, 0, 1, 1,
0.2024024, 0.734257, 1.218738, 0, 0, 0, 1, 1,
0.2109163, 0.6939157, 2.264845, 0, 0, 0, 1, 1,
0.2151034, 0.6848893, 0.6501552, 0, 0, 0, 1, 1,
0.2154508, 0.298264, 1.440135, 0, 0, 0, 1, 1,
0.2182057, -1.168723, 2.239948, 0, 0, 0, 1, 1,
0.2207133, -0.8516901, 2.045151, 1, 1, 1, 1, 1,
0.2260859, 2.05808, 0.9509043, 1, 1, 1, 1, 1,
0.2266197, -0.9429892, 1.559345, 1, 1, 1, 1, 1,
0.2278971, -0.5122451, 4.838535, 1, 1, 1, 1, 1,
0.2281114, 0.8314696, 1.140921, 1, 1, 1, 1, 1,
0.2340853, -1.884477, 5.074349, 1, 1, 1, 1, 1,
0.2371984, -0.3617752, 1.999187, 1, 1, 1, 1, 1,
0.2387121, 1.270608, -0.05098784, 1, 1, 1, 1, 1,
0.2456738, -1.042531, 2.847146, 1, 1, 1, 1, 1,
0.2469545, 0.9063578, 1.481835, 1, 1, 1, 1, 1,
0.2478385, -1.804341, 2.425097, 1, 1, 1, 1, 1,
0.2489157, -1.118487, 2.058059, 1, 1, 1, 1, 1,
0.2514746, -0.03813033, 3.072793, 1, 1, 1, 1, 1,
0.2537471, -1.33503, 2.379907, 1, 1, 1, 1, 1,
0.2538313, -0.9004558, 2.782685, 1, 1, 1, 1, 1,
0.2538424, -0.6709836, 2.086502, 0, 0, 1, 1, 1,
0.2554835, -0.07846956, 1.363666, 1, 0, 0, 1, 1,
0.2560328, -0.8455667, 4.511786, 1, 0, 0, 1, 1,
0.2579956, 0.3452599, -0.1655736, 1, 0, 0, 1, 1,
0.2583915, 0.6492924, -1.822665, 1, 0, 0, 1, 1,
0.2585099, -1.594175, 3.863358, 1, 0, 0, 1, 1,
0.2604936, -0.8158976, 3.922064, 0, 0, 0, 1, 1,
0.2611014, -0.01033486, 1.142107, 0, 0, 0, 1, 1,
0.2738331, -1.835374, 1.830899, 0, 0, 0, 1, 1,
0.2743268, -0.2665566, 2.983684, 0, 0, 0, 1, 1,
0.277063, 0.8205625, -0.1107645, 0, 0, 0, 1, 1,
0.2805405, 1.437678, 0.1023104, 0, 0, 0, 1, 1,
0.2809695, 1.541068, -0.008663608, 0, 0, 0, 1, 1,
0.2810472, -0.05479563, 1.216041, 1, 1, 1, 1, 1,
0.281328, -1.037726, 4.406859, 1, 1, 1, 1, 1,
0.2815906, 1.008025, 0.1149866, 1, 1, 1, 1, 1,
0.2845111, -0.9516466, 3.680876, 1, 1, 1, 1, 1,
0.2886406, -0.8094816, 3.49417, 1, 1, 1, 1, 1,
0.2893496, -1.879736, 1.356782, 1, 1, 1, 1, 1,
0.2958805, 1.338588, 1.111606, 1, 1, 1, 1, 1,
0.3098715, -0.9670743, 4.40735, 1, 1, 1, 1, 1,
0.3140204, 2.229507, 0.3978697, 1, 1, 1, 1, 1,
0.3169219, -1.528623, 3.915215, 1, 1, 1, 1, 1,
0.3246311, -0.2829707, 1.962345, 1, 1, 1, 1, 1,
0.3264317, -0.1911876, 3.729962, 1, 1, 1, 1, 1,
0.3281386, 1.314745, -1.840294, 1, 1, 1, 1, 1,
0.3300212, 1.227381, -0.1998036, 1, 1, 1, 1, 1,
0.3323304, -0.7830406, 1.447054, 1, 1, 1, 1, 1,
0.3325151, 0.0244405, 1.815395, 0, 0, 1, 1, 1,
0.3338729, 1.711641, 0.4823656, 1, 0, 0, 1, 1,
0.3365155, -0.3096927, 2.943228, 1, 0, 0, 1, 1,
0.3407014, 0.5814421, 0.4263842, 1, 0, 0, 1, 1,
0.3423075, -0.05993813, -1.113641, 1, 0, 0, 1, 1,
0.343924, -0.2491737, 2.704952, 1, 0, 0, 1, 1,
0.3600354, -0.3059879, 3.814373, 0, 0, 0, 1, 1,
0.3617491, -0.3163778, 2.533131, 0, 0, 0, 1, 1,
0.3626998, 0.7317781, 0.1728372, 0, 0, 0, 1, 1,
0.366079, -0.01405286, 1.467964, 0, 0, 0, 1, 1,
0.3696905, -0.2186971, 3.558482, 0, 0, 0, 1, 1,
0.3704271, -0.4033945, 3.106051, 0, 0, 0, 1, 1,
0.3731543, -0.1927657, 2.511487, 0, 0, 0, 1, 1,
0.3774066, 0.4728847, 0.5691629, 1, 1, 1, 1, 1,
0.3774427, -0.06743119, 1.928024, 1, 1, 1, 1, 1,
0.3816457, 0.4690093, 2.226211, 1, 1, 1, 1, 1,
0.3817496, -1.305248, 2.581231, 1, 1, 1, 1, 1,
0.3829979, -0.01513936, 1.696296, 1, 1, 1, 1, 1,
0.3839022, -0.6161466, 2.757416, 1, 1, 1, 1, 1,
0.3877745, 0.9675065, 0.4827739, 1, 1, 1, 1, 1,
0.3891894, -0.1479219, 1.159451, 1, 1, 1, 1, 1,
0.3894845, 1.310206, -0.7858806, 1, 1, 1, 1, 1,
0.389619, 0.8007906, -0.6414227, 1, 1, 1, 1, 1,
0.3968009, 1.198303, -0.6785312, 1, 1, 1, 1, 1,
0.3986846, -1.134714, 3.963635, 1, 1, 1, 1, 1,
0.3992186, -0.1508754, -0.1208622, 1, 1, 1, 1, 1,
0.3998533, 1.286838, 0.5970213, 1, 1, 1, 1, 1,
0.400373, -1.218047, 3.615426, 1, 1, 1, 1, 1,
0.4020596, 2.019065, 1.044866, 0, 0, 1, 1, 1,
0.4026321, -1.429124, 2.813895, 1, 0, 0, 1, 1,
0.403801, 0.5634292, 0.3395768, 1, 0, 0, 1, 1,
0.4061755, 0.6188777, -2.172783, 1, 0, 0, 1, 1,
0.4120023, -0.362528, 3.212084, 1, 0, 0, 1, 1,
0.4128174, 0.05945592, 0.373789, 1, 0, 0, 1, 1,
0.4156451, 0.67871, -2.873738, 0, 0, 0, 1, 1,
0.4182412, -0.07955644, 1.515908, 0, 0, 0, 1, 1,
0.4325006, 0.9526951, 0.03688204, 0, 0, 0, 1, 1,
0.4325199, -1.976583, 3.168133, 0, 0, 0, 1, 1,
0.4353788, -0.2615893, 1.918521, 0, 0, 0, 1, 1,
0.4371633, -0.2481991, 1.53063, 0, 0, 0, 1, 1,
0.4378476, -0.7110783, 0.8628656, 0, 0, 0, 1, 1,
0.4391101, 0.6047302, 1.039814, 1, 1, 1, 1, 1,
0.4467216, 0.01740634, 0.5064043, 1, 1, 1, 1, 1,
0.4512962, 1.089412, -0.618597, 1, 1, 1, 1, 1,
0.4519633, -0.755183, 2.177423, 1, 1, 1, 1, 1,
0.4524077, 0.02643619, -0.171083, 1, 1, 1, 1, 1,
0.463318, 1.712454, 0.7776905, 1, 1, 1, 1, 1,
0.4673167, 0.5911245, 0.5365735, 1, 1, 1, 1, 1,
0.4695902, -0.8255607, 1.112061, 1, 1, 1, 1, 1,
0.4727101, 0.1372532, 1.968732, 1, 1, 1, 1, 1,
0.4741532, -1.036896, 3.203585, 1, 1, 1, 1, 1,
0.4754575, -1.608602, 3.746828, 1, 1, 1, 1, 1,
0.4822493, -0.2199723, 2.146636, 1, 1, 1, 1, 1,
0.4828261, -0.04870665, 0.6671418, 1, 1, 1, 1, 1,
0.4878835, 0.5423964, -0.006529353, 1, 1, 1, 1, 1,
0.495407, 1.882837, -0.7483769, 1, 1, 1, 1, 1,
0.500881, -0.322769, 3.077006, 0, 0, 1, 1, 1,
0.5044827, 1.432621, 1.097413, 1, 0, 0, 1, 1,
0.5070632, 0.3746387, 3.084618, 1, 0, 0, 1, 1,
0.5110989, -0.9173561, 2.145121, 1, 0, 0, 1, 1,
0.5207952, 1.323176, 1.592977, 1, 0, 0, 1, 1,
0.520825, -1.793404, 5.110438, 1, 0, 0, 1, 1,
0.5245976, 0.5770233, 3.176887, 0, 0, 0, 1, 1,
0.5306002, -0.147693, 1.860987, 0, 0, 0, 1, 1,
0.5369361, 0.4978254, -0.5498848, 0, 0, 0, 1, 1,
0.5369467, -0.6540106, 0.8858374, 0, 0, 0, 1, 1,
0.5391794, -0.2372615, 0.3511437, 0, 0, 0, 1, 1,
0.5464237, 1.133329, -0.1373893, 0, 0, 0, 1, 1,
0.5563206, -0.9774154, 3.632336, 0, 0, 0, 1, 1,
0.5575881, -0.124002, 1.849753, 1, 1, 1, 1, 1,
0.5584518, 1.586376, 0.4827439, 1, 1, 1, 1, 1,
0.5588961, -1.15298, 1.999918, 1, 1, 1, 1, 1,
0.5592029, 0.3169567, 1.452119, 1, 1, 1, 1, 1,
0.5606223, -0.3620125, 2.068304, 1, 1, 1, 1, 1,
0.5654877, -1.192033, 2.029963, 1, 1, 1, 1, 1,
0.5679042, 0.05795438, 0.1004135, 1, 1, 1, 1, 1,
0.5682849, -0.02395245, 3.462992, 1, 1, 1, 1, 1,
0.5692201, 0.619308, 1.799534, 1, 1, 1, 1, 1,
0.5697718, 0.9816317, 0.2362326, 1, 1, 1, 1, 1,
0.5726252, -0.2725195, 2.99175, 1, 1, 1, 1, 1,
0.5809554, -1.537935, 0.6168679, 1, 1, 1, 1, 1,
0.5849323, -2.042671, 4.03531, 1, 1, 1, 1, 1,
0.5850633, 0.2995974, 1.477233, 1, 1, 1, 1, 1,
0.5947644, -1.128939, 1.909446, 1, 1, 1, 1, 1,
0.5979621, -0.4272532, 1.534575, 0, 0, 1, 1, 1,
0.5996652, 1.97529, 2.598138, 1, 0, 0, 1, 1,
0.5996687, -0.7136926, 2.386484, 1, 0, 0, 1, 1,
0.6001216, -0.6720626, 0.9197065, 1, 0, 0, 1, 1,
0.6044341, -0.423798, 0.9144321, 1, 0, 0, 1, 1,
0.6096801, 0.6999648, -1.005822, 1, 0, 0, 1, 1,
0.6109045, 0.2715993, 1.413106, 0, 0, 0, 1, 1,
0.6111813, 0.4094729, 1.176678, 0, 0, 0, 1, 1,
0.6134588, 2.089233, 1.1618, 0, 0, 0, 1, 1,
0.6135778, -0.7710623, 1.749441, 0, 0, 0, 1, 1,
0.6156324, 1.109547, 0.6773126, 0, 0, 0, 1, 1,
0.6170022, 0.7649062, 0.2433312, 0, 0, 0, 1, 1,
0.621779, 2.140889, 0.8308555, 0, 0, 0, 1, 1,
0.6233568, -1.955894, 0.2838669, 1, 1, 1, 1, 1,
0.627115, -0.9252674, 1.619969, 1, 1, 1, 1, 1,
0.6351517, -1.735297, 4.158886, 1, 1, 1, 1, 1,
0.6366196, 1.003468, 0.1719449, 1, 1, 1, 1, 1,
0.6409153, -1.060051, 2.159598, 1, 1, 1, 1, 1,
0.645621, 0.1517106, 0.5116584, 1, 1, 1, 1, 1,
0.6485972, -0.2044841, 0.7823734, 1, 1, 1, 1, 1,
0.6489351, -0.2173962, 1.37628, 1, 1, 1, 1, 1,
0.6498702, -0.9436921, 3.994255, 1, 1, 1, 1, 1,
0.6537085, -1.21542, 3.551829, 1, 1, 1, 1, 1,
0.6544244, -1.227979, 2.984658, 1, 1, 1, 1, 1,
0.6599689, 0.1544749, 2.026369, 1, 1, 1, 1, 1,
0.6609374, 1.354424, 1.904053, 1, 1, 1, 1, 1,
0.6642588, -1.220215, 4.02441, 1, 1, 1, 1, 1,
0.6643125, -1.722134, 3.755161, 1, 1, 1, 1, 1,
0.6668013, 2.3133, 1.807335, 0, 0, 1, 1, 1,
0.6691698, -0.03641136, 1.643862, 1, 0, 0, 1, 1,
0.6709796, 1.092071, -0.3182093, 1, 0, 0, 1, 1,
0.6740784, 0.4584206, 0.9916943, 1, 0, 0, 1, 1,
0.679, 0.6606105, 0.6497108, 1, 0, 0, 1, 1,
0.6804559, 1.959711, -0.3859733, 1, 0, 0, 1, 1,
0.6849977, -0.5366203, 2.372347, 0, 0, 0, 1, 1,
0.686255, -0.7234006, 0.4817723, 0, 0, 0, 1, 1,
0.6888559, 1.395363, -0.562926, 0, 0, 0, 1, 1,
0.6899677, -1.360246, 4.895016, 0, 0, 0, 1, 1,
0.6902958, 0.7729191, -0.2251478, 0, 0, 0, 1, 1,
0.6903132, -0.9388403, 2.630165, 0, 0, 0, 1, 1,
0.6961402, -0.6504275, 0.1208602, 0, 0, 0, 1, 1,
0.6997055, -1.293602, 3.587221, 1, 1, 1, 1, 1,
0.7033423, 0.1696754, 1.010132, 1, 1, 1, 1, 1,
0.7102388, 0.08941729, 0.4240001, 1, 1, 1, 1, 1,
0.7188851, 0.5056346, 0.1067827, 1, 1, 1, 1, 1,
0.7207054, -0.9443838, 2.644449, 1, 1, 1, 1, 1,
0.7252787, 0.9272225, 0.8547012, 1, 1, 1, 1, 1,
0.7261348, 0.2888575, 3.464563, 1, 1, 1, 1, 1,
0.726219, 0.09596798, 1.874383, 1, 1, 1, 1, 1,
0.7262276, 1.182943, 1.025411, 1, 1, 1, 1, 1,
0.7326731, -0.2042904, 0.5905719, 1, 1, 1, 1, 1,
0.7331285, -1.46436, 3.027735, 1, 1, 1, 1, 1,
0.7372109, -1.757199, 3.3325, 1, 1, 1, 1, 1,
0.7383771, 0.5499375, 0.8252872, 1, 1, 1, 1, 1,
0.7434449, 1.03803, 0.7070454, 1, 1, 1, 1, 1,
0.7457747, -1.400522, 2.398396, 1, 1, 1, 1, 1,
0.7467126, 1.052935, 1.818173, 0, 0, 1, 1, 1,
0.7543744, -0.03794904, 0.6634399, 1, 0, 0, 1, 1,
0.7570691, -1.940022, 1.241209, 1, 0, 0, 1, 1,
0.7577631, -0.7280586, 2.103269, 1, 0, 0, 1, 1,
0.7639711, 0.6472363, 1.298821, 1, 0, 0, 1, 1,
0.7710575, 0.2984645, 0.9612417, 1, 0, 0, 1, 1,
0.7722912, 0.6540363, 1.071679, 0, 0, 0, 1, 1,
0.7750014, 0.1703965, 1.556594, 0, 0, 0, 1, 1,
0.7874245, 0.4574221, 0.4151501, 0, 0, 0, 1, 1,
0.7878702, 0.002090921, 1.674115, 0, 0, 0, 1, 1,
0.7879258, -0.9561905, 1.619376, 0, 0, 0, 1, 1,
0.7895311, 0.07138736, 3.098543, 0, 0, 0, 1, 1,
0.7928207, -0.3247106, 3.998065, 0, 0, 0, 1, 1,
0.7945055, 2.126036, -0.02741543, 1, 1, 1, 1, 1,
0.7993058, 0.2748288, 0.1716176, 1, 1, 1, 1, 1,
0.7996933, -0.4718353, 3.230973, 1, 1, 1, 1, 1,
0.8025959, 0.8396991, 1.083335, 1, 1, 1, 1, 1,
0.8147614, 1.232677, 1.232611, 1, 1, 1, 1, 1,
0.8172268, 1.323578, 0.6658808, 1, 1, 1, 1, 1,
0.8182732, -1.435419, 0.9428677, 1, 1, 1, 1, 1,
0.8274491, 0.1790693, 1.237084, 1, 1, 1, 1, 1,
0.8286823, 1.315878, 0.3108196, 1, 1, 1, 1, 1,
0.8313673, -2.221503, 1.337105, 1, 1, 1, 1, 1,
0.8335002, -0.9838743, 1.852707, 1, 1, 1, 1, 1,
0.8385202, 0.4096799, 2.848148, 1, 1, 1, 1, 1,
0.8451331, -1.243397, 2.022148, 1, 1, 1, 1, 1,
0.8497698, -1.398731, 3.244617, 1, 1, 1, 1, 1,
0.8582239, -0.01400876, 1.438043, 1, 1, 1, 1, 1,
0.8598813, 0.8904424, 1.600465, 0, 0, 1, 1, 1,
0.8625378, 0.9302853, 1.681778, 1, 0, 0, 1, 1,
0.8694555, 0.7585151, 1.444516, 1, 0, 0, 1, 1,
0.8741992, 0.4832506, -0.7071068, 1, 0, 0, 1, 1,
0.8843694, -1.093958, 1.297827, 1, 0, 0, 1, 1,
0.8882965, 0.5471885, 2.229994, 1, 0, 0, 1, 1,
0.8905959, 0.2560701, 0.6214361, 0, 0, 0, 1, 1,
0.8912629, 0.275519, -0.01389687, 0, 0, 0, 1, 1,
0.8949519, -0.6483744, 2.736126, 0, 0, 0, 1, 1,
0.897482, 1.191407, 1.244439, 0, 0, 0, 1, 1,
0.8982457, 1.937516, 1.681435, 0, 0, 0, 1, 1,
0.9002373, 0.415719, 0.8013406, 0, 0, 0, 1, 1,
0.9022504, -0.5269629, 1.230705, 0, 0, 0, 1, 1,
0.904266, 0.5943612, 0.5669298, 1, 1, 1, 1, 1,
0.9057255, -0.9285839, 2.884763, 1, 1, 1, 1, 1,
0.9092806, -1.20119, 4.823024, 1, 1, 1, 1, 1,
0.9152794, 0.6519167, 0.5421986, 1, 1, 1, 1, 1,
0.9290803, 0.08025505, 0.07158975, 1, 1, 1, 1, 1,
0.9335296, -1.346874, 2.776991, 1, 1, 1, 1, 1,
0.9340836, -0.2729891, 0.9064252, 1, 1, 1, 1, 1,
0.9402013, -0.8795092, 3.148761, 1, 1, 1, 1, 1,
0.9432857, -0.2054152, 0.7985107, 1, 1, 1, 1, 1,
0.9567322, 1.015629, 0.651631, 1, 1, 1, 1, 1,
0.9589828, 1.283422, 0.2615863, 1, 1, 1, 1, 1,
0.9781363, -1.350016, 1.178747, 1, 1, 1, 1, 1,
0.9835457, 0.7204602, -0.683741, 1, 1, 1, 1, 1,
0.9928944, -0.1065588, 1.724816, 1, 1, 1, 1, 1,
0.9935709, -1.235285, 3.578859, 1, 1, 1, 1, 1,
0.9942, -1.518027, 2.533248, 0, 0, 1, 1, 1,
1.000059, 1.608884, -1.649305, 1, 0, 0, 1, 1,
1.007533, -0.2471408, 1.871965, 1, 0, 0, 1, 1,
1.017796, 0.5025449, 0.3815541, 1, 0, 0, 1, 1,
1.025036, -0.165779, 1.8968, 1, 0, 0, 1, 1,
1.032951, 0.6704924, -0.9133661, 1, 0, 0, 1, 1,
1.033683, 0.4194788, 1.28317, 0, 0, 0, 1, 1,
1.037782, -0.5613708, 2.971904, 0, 0, 0, 1, 1,
1.059287, -0.1072305, 1.920334, 0, 0, 0, 1, 1,
1.064336, 0.5574043, 1.849308, 0, 0, 0, 1, 1,
1.068923, 0.01068068, 0.6632366, 0, 0, 0, 1, 1,
1.074061, -1.13621, 3.469092, 0, 0, 0, 1, 1,
1.074309, 0.05278917, 1.547968, 0, 0, 0, 1, 1,
1.076334, 0.7498236, 0.8666329, 1, 1, 1, 1, 1,
1.08021, -1.9444, 2.734518, 1, 1, 1, 1, 1,
1.083379, 0.9253265, -0.3514513, 1, 1, 1, 1, 1,
1.087023, -1.151173, 2.69943, 1, 1, 1, 1, 1,
1.10037, 1.71231, 0.4768145, 1, 1, 1, 1, 1,
1.102615, -1.22782, 2.444509, 1, 1, 1, 1, 1,
1.103206, -0.9385397, 3.23479, 1, 1, 1, 1, 1,
1.106694, 1.570561, 1.119564, 1, 1, 1, 1, 1,
1.106757, -0.47073, 2.358143, 1, 1, 1, 1, 1,
1.109332, -1.193244, 1.260217, 1, 1, 1, 1, 1,
1.11033, -1.363615, 2.478338, 1, 1, 1, 1, 1,
1.113068, 0.7592171, 0.09152018, 1, 1, 1, 1, 1,
1.122948, -0.1136979, 2.977061, 1, 1, 1, 1, 1,
1.123422, -0.2942164, 3.109743, 1, 1, 1, 1, 1,
1.124365, -0.9500108, 2.488264, 1, 1, 1, 1, 1,
1.148662, 0.3433653, 0.5403642, 0, 0, 1, 1, 1,
1.161389, 0.4886818, 2.066034, 1, 0, 0, 1, 1,
1.165973, -0.4894314, 0.9891655, 1, 0, 0, 1, 1,
1.180412, -1.771935, 3.473815, 1, 0, 0, 1, 1,
1.187325, 0.6551447, 1.291202, 1, 0, 0, 1, 1,
1.187349, 0.3358597, 0.9678869, 1, 0, 0, 1, 1,
1.193992, 1.838416, 0.3245982, 0, 0, 0, 1, 1,
1.194541, -1.254151, 3.412094, 0, 0, 0, 1, 1,
1.194825, 0.3760976, 1.923796, 0, 0, 0, 1, 1,
1.199614, 0.5520583, 1.360691, 0, 0, 0, 1, 1,
1.200141, -0.8547359, 0.6062036, 0, 0, 0, 1, 1,
1.206016, -0.2597736, 3.621442, 0, 0, 0, 1, 1,
1.212338, -0.02145281, 1.576715, 0, 0, 0, 1, 1,
1.221041, 0.325502, 1.150704, 1, 1, 1, 1, 1,
1.228862, 1.131499, -0.2613789, 1, 1, 1, 1, 1,
1.232318, 0.4905972, 1.391722, 1, 1, 1, 1, 1,
1.232802, 0.4887116, 3.28773, 1, 1, 1, 1, 1,
1.239664, 0.170717, 1.610679, 1, 1, 1, 1, 1,
1.24083, 0.278902, 0.6164533, 1, 1, 1, 1, 1,
1.242159, -0.5982214, 2.913049, 1, 1, 1, 1, 1,
1.246905, -0.2661644, 0.8326697, 1, 1, 1, 1, 1,
1.261618, -0.5342947, 1.997462, 1, 1, 1, 1, 1,
1.266136, 0.9403216, 0.3531, 1, 1, 1, 1, 1,
1.273261, -0.1936706, 0.9131283, 1, 1, 1, 1, 1,
1.278245, 0.5156534, 2.318791, 1, 1, 1, 1, 1,
1.278282, 1.057769, 0.4555498, 1, 1, 1, 1, 1,
1.280063, -0.1753955, 2.348737, 1, 1, 1, 1, 1,
1.282825, 1.424731, 1.554167, 1, 1, 1, 1, 1,
1.293222, -0.1809943, 1.276189, 0, 0, 1, 1, 1,
1.300887, -0.8061781, 4.018939, 1, 0, 0, 1, 1,
1.314695, -0.4099197, 1.262718, 1, 0, 0, 1, 1,
1.31557, -0.1161499, 1.993617, 1, 0, 0, 1, 1,
1.318354, -0.2041328, 1.027137, 1, 0, 0, 1, 1,
1.328989, -1.505266, 1.858105, 1, 0, 0, 1, 1,
1.342185, 1.751228, 0.2749794, 0, 0, 0, 1, 1,
1.350856, -0.599491, 0.2242737, 0, 0, 0, 1, 1,
1.353397, -1.748578, 3.306465, 0, 0, 0, 1, 1,
1.363677, 1.419263, 0.7298172, 0, 0, 0, 1, 1,
1.369372, -0.7877211, 2.158037, 0, 0, 0, 1, 1,
1.369532, -0.4892459, 2.333755, 0, 0, 0, 1, 1,
1.39007, -0.272255, 0.3785093, 0, 0, 0, 1, 1,
1.402189, 2.181189, 0.7777445, 1, 1, 1, 1, 1,
1.405444, 0.9824666, -0.1100652, 1, 1, 1, 1, 1,
1.415901, 1.419755, 0.8921548, 1, 1, 1, 1, 1,
1.423064, -0.8168468, 1.696865, 1, 1, 1, 1, 1,
1.424445, -0.8511333, 1.451281, 1, 1, 1, 1, 1,
1.432109, 1.053935, 1.347581, 1, 1, 1, 1, 1,
1.436913, -1.085658, 1.759115, 1, 1, 1, 1, 1,
1.445531, -1.005035, 0.1799762, 1, 1, 1, 1, 1,
1.44677, 0.5546835, 1.734136, 1, 1, 1, 1, 1,
1.447464, 0.3437184, -0.5565097, 1, 1, 1, 1, 1,
1.447526, 0.8120486, -1.294461, 1, 1, 1, 1, 1,
1.451682, 0.3025305, 1.014286, 1, 1, 1, 1, 1,
1.461694, -0.1951711, 2.202337, 1, 1, 1, 1, 1,
1.461794, 0.2074682, 1.046809, 1, 1, 1, 1, 1,
1.464321, 3.485169, -0.6881089, 1, 1, 1, 1, 1,
1.469132, -1.876531, 1.056009, 0, 0, 1, 1, 1,
1.471978, 2.446995, -0.3615095, 1, 0, 0, 1, 1,
1.481573, -1.070106, 1.416922, 1, 0, 0, 1, 1,
1.491728, 0.1145264, 2.753167, 1, 0, 0, 1, 1,
1.496438, 0.4489316, 2.272962, 1, 0, 0, 1, 1,
1.499795, 0.6043434, 1.548553, 1, 0, 0, 1, 1,
1.511153, -0.2911874, 0.1524821, 0, 0, 0, 1, 1,
1.516279, 0.1652838, -0.5174193, 0, 0, 0, 1, 1,
1.519078, 0.1614219, 0.2215105, 0, 0, 0, 1, 1,
1.520791, -0.3578676, 2.444294, 0, 0, 0, 1, 1,
1.530837, -0.3318138, 1.693781, 0, 0, 0, 1, 1,
1.532966, 0.06362058, 1.169609, 0, 0, 0, 1, 1,
1.538401, -0.8943332, 3.5945, 0, 0, 0, 1, 1,
1.544794, 0.8905035, 1.13031, 1, 1, 1, 1, 1,
1.546235, 1.630543, 1.115854, 1, 1, 1, 1, 1,
1.548955, 0.2068115, 1.519227, 1, 1, 1, 1, 1,
1.550996, -0.1916107, 1.247056, 1, 1, 1, 1, 1,
1.553083, -0.7149117, 1.464534, 1, 1, 1, 1, 1,
1.553448, 0.2113605, -0.02734281, 1, 1, 1, 1, 1,
1.556412, 0.5488316, -0.8621342, 1, 1, 1, 1, 1,
1.561975, 0.7235261, 0.03685023, 1, 1, 1, 1, 1,
1.562512, -0.366809, 0.4912633, 1, 1, 1, 1, 1,
1.576442, -0.1888519, 1.918627, 1, 1, 1, 1, 1,
1.58669, -0.4426791, 3.126723, 1, 1, 1, 1, 1,
1.592722, -0.6977221, 1.735868, 1, 1, 1, 1, 1,
1.601583, -0.624042, 2.91654, 1, 1, 1, 1, 1,
1.605023, 1.565613, 2.382751, 1, 1, 1, 1, 1,
1.605341, -0.9519111, 0.4152166, 1, 1, 1, 1, 1,
1.617194, -0.6588705, 1.36801, 0, 0, 1, 1, 1,
1.619776, -0.05777194, 1.605736, 1, 0, 0, 1, 1,
1.634871, 2.031782, 0.7805831, 1, 0, 0, 1, 1,
1.675461, -0.8970518, -0.3854775, 1, 0, 0, 1, 1,
1.680987, -0.5688614, 2.664431, 1, 0, 0, 1, 1,
1.682045, 1.004521, 0.8836779, 1, 0, 0, 1, 1,
1.689005, -0.8196191, 1.496241, 0, 0, 0, 1, 1,
1.694581, 1.255992, 0.5196401, 0, 0, 0, 1, 1,
1.710836, -0.3456591, 1.076004, 0, 0, 0, 1, 1,
1.712487, 0.0003766387, 2.679887, 0, 0, 0, 1, 1,
1.748714, 0.3529059, 2.938393, 0, 0, 0, 1, 1,
1.769648, 1.384493, 0.7945223, 0, 0, 0, 1, 1,
1.8095, -0.9218203, 4.062274, 0, 0, 0, 1, 1,
1.815412, 0.07220788, 1.219986, 1, 1, 1, 1, 1,
1.817642, 0.06033917, 1.096727, 1, 1, 1, 1, 1,
1.833566, 0.1912633, -0.6561143, 1, 1, 1, 1, 1,
1.839585, 0.2713103, 0.7136558, 1, 1, 1, 1, 1,
1.856763, -1.345753, 2.747757, 1, 1, 1, 1, 1,
1.862755, 0.7888367, 1.753687, 1, 1, 1, 1, 1,
1.872039, -0.5463472, -0.005197442, 1, 1, 1, 1, 1,
1.882156, -0.3753394, 2.43139, 1, 1, 1, 1, 1,
1.89356, 2.200219, 0.5129353, 1, 1, 1, 1, 1,
1.928857, -0.9460396, 1.084493, 1, 1, 1, 1, 1,
1.930526, -0.5299938, 0.9879227, 1, 1, 1, 1, 1,
1.940973, -0.5385608, 2.308335, 1, 1, 1, 1, 1,
1.961252, 1.125031, 1.83939, 1, 1, 1, 1, 1,
2.012082, 0.3576635, 0.7188497, 1, 1, 1, 1, 1,
2.045536, 0.2406276, 0.9639172, 1, 1, 1, 1, 1,
2.099699, 1.632803, 1.043392, 0, 0, 1, 1, 1,
2.155513, -0.2385253, 2.026826, 1, 0, 0, 1, 1,
2.230077, 0.5609508, 2.337602, 1, 0, 0, 1, 1,
2.235816, -0.7251083, 1.061398, 1, 0, 0, 1, 1,
2.246541, -0.4934077, 2.105067, 1, 0, 0, 1, 1,
2.25981, 0.1259811, 3.171406, 1, 0, 0, 1, 1,
2.263844, 0.4213903, 1.937055, 0, 0, 0, 1, 1,
2.279469, -2.327802, 3.304399, 0, 0, 0, 1, 1,
2.331676, 0.07228924, 2.053439, 0, 0, 0, 1, 1,
2.359971, -0.6703609, 3.198176, 0, 0, 0, 1, 1,
2.387165, -1.13955, 3.4385, 0, 0, 0, 1, 1,
2.420582, 0.9758323, 1.484764, 0, 0, 0, 1, 1,
2.461707, -0.352223, 1.912487, 0, 0, 0, 1, 1,
2.506805, -1.419705, 0.5559811, 1, 1, 1, 1, 1,
2.530589, -0.9664941, 2.38543, 1, 1, 1, 1, 1,
2.677886, -0.4679969, 1.419471, 1, 1, 1, 1, 1,
2.949933, -0.8467187, 0.8182355, 1, 1, 1, 1, 1,
3.002696, 0.9265297, 2.681874, 1, 1, 1, 1, 1,
3.060933, -0.08182217, 1.749297, 1, 1, 1, 1, 1,
3.175518, -2.096981, 3.315656, 1, 1, 1, 1, 1
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
var radius = 9.434793;
var distance = 33.13931;
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
mvMatrix.translate( -0.2115149, 0.09134769, -0.1314795 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.13931);
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
