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
-3.056541, -1.76281, -2.474586, 1, 0, 0, 1,
-3.054013, -0.3205923, -1.973964, 1, 0.007843138, 0, 1,
-2.927444, 2.219128, -0.7100257, 1, 0.01176471, 0, 1,
-2.779416, -0.1509928, -2.063864, 1, 0.01960784, 0, 1,
-2.774374, -0.5666065, -1.421893, 1, 0.02352941, 0, 1,
-2.757177, -0.03672573, -2.019702, 1, 0.03137255, 0, 1,
-2.646334, 0.07432315, -3.112555, 1, 0.03529412, 0, 1,
-2.573196, -0.4290504, -0.6038368, 1, 0.04313726, 0, 1,
-2.505228, -1.196982, -0.9039972, 1, 0.04705882, 0, 1,
-2.416581, -0.5738108, -3.58539, 1, 0.05490196, 0, 1,
-2.397115, -0.5037943, -4.340471, 1, 0.05882353, 0, 1,
-2.351855, -0.3019404, -2.02319, 1, 0.06666667, 0, 1,
-2.289115, 0.3835286, -0.1737711, 1, 0.07058824, 0, 1,
-2.272267, 0.3160923, -0.3350592, 1, 0.07843138, 0, 1,
-2.25074, -0.7198368, -2.821464, 1, 0.08235294, 0, 1,
-2.181691, 1.032839, -0.382546, 1, 0.09019608, 0, 1,
-2.126922, -2.526668, -3.185438, 1, 0.09411765, 0, 1,
-2.11126, -1.031335, -2.608499, 1, 0.1019608, 0, 1,
-2.101623, 1.411531, -0.06102433, 1, 0.1098039, 0, 1,
-2.097743, 0.4656534, 0.5270556, 1, 0.1137255, 0, 1,
-2.090533, -0.9302607, -1.755248, 1, 0.1215686, 0, 1,
-2.089412, -0.9154159, 1.480303, 1, 0.1254902, 0, 1,
-2.088186, 0.4125422, -0.6212806, 1, 0.1333333, 0, 1,
-2.083059, 0.1593051, -1.627457, 1, 0.1372549, 0, 1,
-1.955963, 0.3351349, -0.7227846, 1, 0.145098, 0, 1,
-1.9552, -1.902083, -2.224965, 1, 0.1490196, 0, 1,
-1.929282, 1.558821, -0.1360451, 1, 0.1568628, 0, 1,
-1.923605, -0.5705411, -1.488729, 1, 0.1607843, 0, 1,
-1.913365, 0.1384258, -2.731778, 1, 0.1686275, 0, 1,
-1.904905, 0.9969537, -2.217336, 1, 0.172549, 0, 1,
-1.893765, 0.3881945, -1.402271, 1, 0.1803922, 0, 1,
-1.888353, 2.176733, 0.5008221, 1, 0.1843137, 0, 1,
-1.879381, 0.31456, -2.805885, 1, 0.1921569, 0, 1,
-1.875389, 1.880242, 0.1226534, 1, 0.1960784, 0, 1,
-1.870262, 2.185013, -0.5289328, 1, 0.2039216, 0, 1,
-1.866115, 1.087451, -1.187482, 1, 0.2117647, 0, 1,
-1.856297, -0.4806123, -1.345468, 1, 0.2156863, 0, 1,
-1.849483, 1.377223, -1.41199, 1, 0.2235294, 0, 1,
-1.828689, 0.5237561, -1.69137, 1, 0.227451, 0, 1,
-1.826304, -0.2625805, -1.876386, 1, 0.2352941, 0, 1,
-1.790563, 0.5411531, -1.272292, 1, 0.2392157, 0, 1,
-1.788745, -0.6458584, -1.617652, 1, 0.2470588, 0, 1,
-1.785887, 1.392742, 0.2901665, 1, 0.2509804, 0, 1,
-1.744084, 0.3972831, -0.5481734, 1, 0.2588235, 0, 1,
-1.727669, 0.1892414, -0.7961386, 1, 0.2627451, 0, 1,
-1.717019, 1.05905, -1.057663, 1, 0.2705882, 0, 1,
-1.713001, -1.106868, -4.667915, 1, 0.2745098, 0, 1,
-1.703171, -0.3498216, -1.721343, 1, 0.282353, 0, 1,
-1.681648, -0.6574896, -1.933728, 1, 0.2862745, 0, 1,
-1.679703, 1.736736, -2.137225, 1, 0.2941177, 0, 1,
-1.679144, 2.217255, -0.745649, 1, 0.3019608, 0, 1,
-1.648406, 0.615006, -2.242208, 1, 0.3058824, 0, 1,
-1.640967, -1.597708, -0.9911116, 1, 0.3137255, 0, 1,
-1.63881, -0.1168756, -2.795789, 1, 0.3176471, 0, 1,
-1.618407, 1.123804, -1.400959, 1, 0.3254902, 0, 1,
-1.595879, -1.486031, -3.247705, 1, 0.3294118, 0, 1,
-1.571481, 0.1612925, -1.540685, 1, 0.3372549, 0, 1,
-1.541967, 0.7954988, 0.6561229, 1, 0.3411765, 0, 1,
-1.540186, -0.4287135, -3.856708, 1, 0.3490196, 0, 1,
-1.508219, -1.609627, -1.804013, 1, 0.3529412, 0, 1,
-1.507215, 1.948653, -1.349694, 1, 0.3607843, 0, 1,
-1.504377, 0.05106923, -0.43173, 1, 0.3647059, 0, 1,
-1.502843, -0.6133506, -2.749658, 1, 0.372549, 0, 1,
-1.500706, -1.669218, -4.543035, 1, 0.3764706, 0, 1,
-1.495066, -0.1452049, -1.80848, 1, 0.3843137, 0, 1,
-1.489523, -0.03857071, -0.185776, 1, 0.3882353, 0, 1,
-1.487315, 0.1224068, -1.158684, 1, 0.3960784, 0, 1,
-1.482936, -0.1391399, -1.065659, 1, 0.4039216, 0, 1,
-1.471508, 0.4501353, -1.554895, 1, 0.4078431, 0, 1,
-1.469143, -0.0003309486, -2.802607, 1, 0.4156863, 0, 1,
-1.454741, -0.357513, -3.507166, 1, 0.4196078, 0, 1,
-1.454033, 0.2737631, -1.769151, 1, 0.427451, 0, 1,
-1.43701, -1.067809, -0.9255567, 1, 0.4313726, 0, 1,
-1.421193, 0.05166161, -0.6598506, 1, 0.4392157, 0, 1,
-1.418301, -2.417761, -2.458554, 1, 0.4431373, 0, 1,
-1.416091, -0.4738219, -1.766231, 1, 0.4509804, 0, 1,
-1.398826, -0.9920056, -2.135073, 1, 0.454902, 0, 1,
-1.397188, -1.053609, -0.516676, 1, 0.4627451, 0, 1,
-1.396969, -1.331264, -1.423883, 1, 0.4666667, 0, 1,
-1.394897, -0.7025797, -1.710978, 1, 0.4745098, 0, 1,
-1.393248, 1.160231, -0.2820066, 1, 0.4784314, 0, 1,
-1.3594, 0.5857528, -1.427029, 1, 0.4862745, 0, 1,
-1.347147, -0.5718763, -2.09848, 1, 0.4901961, 0, 1,
-1.346855, 0.1223173, -0.7025598, 1, 0.4980392, 0, 1,
-1.34559, -0.1234793, -2.112648, 1, 0.5058824, 0, 1,
-1.344637, 0.3268299, -1.310667, 1, 0.509804, 0, 1,
-1.343057, -1.007797, -3.348349, 1, 0.5176471, 0, 1,
-1.330925, 0.5688444, 0.6785983, 1, 0.5215687, 0, 1,
-1.328493, -0.5343848, -0.5683525, 1, 0.5294118, 0, 1,
-1.326533, 0.3397756, -0.4308272, 1, 0.5333334, 0, 1,
-1.305262, 0.8555944, -0.605671, 1, 0.5411765, 0, 1,
-1.281885, -0.6387488, -3.431774, 1, 0.5450981, 0, 1,
-1.276399, -1.369615, -3.327123, 1, 0.5529412, 0, 1,
-1.270677, -0.2457075, -1.599181, 1, 0.5568628, 0, 1,
-1.269577, -0.6489936, -1.712271, 1, 0.5647059, 0, 1,
-1.256658, 0.9297138, -1.129611, 1, 0.5686275, 0, 1,
-1.235962, -0.5242117, -0.8169574, 1, 0.5764706, 0, 1,
-1.234065, 0.8751231, -2.020662, 1, 0.5803922, 0, 1,
-1.233965, -0.004822487, -2.25754, 1, 0.5882353, 0, 1,
-1.228173, -1.145293, -2.435249, 1, 0.5921569, 0, 1,
-1.227017, 0.572886, 0.1490113, 1, 0.6, 0, 1,
-1.223832, -0.1820377, -1.581012, 1, 0.6078432, 0, 1,
-1.220938, 1.837588, -0.04676457, 1, 0.6117647, 0, 1,
-1.209879, 1.119365, -1.101507, 1, 0.6196079, 0, 1,
-1.207685, 0.07401403, -1.358689, 1, 0.6235294, 0, 1,
-1.206336, 1.196041, 0.5305676, 1, 0.6313726, 0, 1,
-1.199924, 0.448092, -0.9662771, 1, 0.6352941, 0, 1,
-1.186046, -1.64705, -2.931751, 1, 0.6431373, 0, 1,
-1.179354, -0.8168035, -3.93665, 1, 0.6470588, 0, 1,
-1.169028, -1.851064, -3.697093, 1, 0.654902, 0, 1,
-1.154317, -1.166275, -1.702749, 1, 0.6588235, 0, 1,
-1.153862, -1.58035, -5.037687, 1, 0.6666667, 0, 1,
-1.152455, 0.4928817, -0.378889, 1, 0.6705883, 0, 1,
-1.147943, 0.4437411, -0.6723748, 1, 0.6784314, 0, 1,
-1.139485, -0.6629579, -0.03985818, 1, 0.682353, 0, 1,
-1.136087, 0.6951791, -0.9357429, 1, 0.6901961, 0, 1,
-1.129706, 0.6188479, -0.6723466, 1, 0.6941177, 0, 1,
-1.129591, -1.196626, -5.28571, 1, 0.7019608, 0, 1,
-1.12478, 0.7936371, -1.14826, 1, 0.7098039, 0, 1,
-1.12159, 0.4500285, -1.395735, 1, 0.7137255, 0, 1,
-1.118948, 0.07547396, -2.855774, 1, 0.7215686, 0, 1,
-1.110411, -0.1828598, -1.062653, 1, 0.7254902, 0, 1,
-1.110093, -0.9288474, -1.415043, 1, 0.7333333, 0, 1,
-1.107819, -0.2424117, -3.499316, 1, 0.7372549, 0, 1,
-1.103493, 2.179316, -0.6189147, 1, 0.7450981, 0, 1,
-1.103164, -0.7576836, -2.762783, 1, 0.7490196, 0, 1,
-1.103102, 1.18509, -1.422102, 1, 0.7568628, 0, 1,
-1.083676, -0.9421434, -1.88367, 1, 0.7607843, 0, 1,
-1.073598, 0.7607425, -1.437225, 1, 0.7686275, 0, 1,
-1.067498, 0.1230086, -1.718476, 1, 0.772549, 0, 1,
-1.058326, 0.1160838, -2.381715, 1, 0.7803922, 0, 1,
-1.051482, 0.4992888, -3.026283, 1, 0.7843137, 0, 1,
-1.040053, 1.800202, -0.3855249, 1, 0.7921569, 0, 1,
-1.027923, -1.947109, -3.229219, 1, 0.7960784, 0, 1,
-1.021849, -0.8139238, -1.871336, 1, 0.8039216, 0, 1,
-1.01951, -0.09512007, -1.131397, 1, 0.8117647, 0, 1,
-1.012329, 0.04011201, -1.108067, 1, 0.8156863, 0, 1,
-1.002738, 0.5867581, -0.4403567, 1, 0.8235294, 0, 1,
-0.9970213, 0.4767497, -1.712057, 1, 0.827451, 0, 1,
-0.9921255, 0.01047626, -2.406877, 1, 0.8352941, 0, 1,
-0.9894719, 0.3865366, -1.158916, 1, 0.8392157, 0, 1,
-0.9865813, 0.8030771, 0.1858869, 1, 0.8470588, 0, 1,
-0.9843897, -0.5134659, -1.522928, 1, 0.8509804, 0, 1,
-0.9828922, -1.144501, -2.566739, 1, 0.8588235, 0, 1,
-0.9794655, 1.068154, -2.096536, 1, 0.8627451, 0, 1,
-0.9782192, 0.220236, -1.254485, 1, 0.8705882, 0, 1,
-0.9689925, -1.050468, -2.258348, 1, 0.8745098, 0, 1,
-0.9688191, 0.2751749, -1.35578, 1, 0.8823529, 0, 1,
-0.961432, -0.7330196, -3.782007, 1, 0.8862745, 0, 1,
-0.9611059, 0.24586, -0.8695198, 1, 0.8941177, 0, 1,
-0.9594615, -1.299374, -3.539503, 1, 0.8980392, 0, 1,
-0.9585229, 0.7593371, -1.630534, 1, 0.9058824, 0, 1,
-0.9576774, 2.143765, -1.832176, 1, 0.9137255, 0, 1,
-0.9551929, -0.8863059, -2.134522, 1, 0.9176471, 0, 1,
-0.9539436, 0.6867048, 1.196815, 1, 0.9254902, 0, 1,
-0.9529682, 0.9939696, -0.4547215, 1, 0.9294118, 0, 1,
-0.9515607, -1.643921, -2.494674, 1, 0.9372549, 0, 1,
-0.9495388, -0.2835047, -2.402742, 1, 0.9411765, 0, 1,
-0.9460407, -1.007967, -2.033348, 1, 0.9490196, 0, 1,
-0.940065, 0.782319, 0.03769242, 1, 0.9529412, 0, 1,
-0.9346321, -2.142533, -1.229074, 1, 0.9607843, 0, 1,
-0.9339191, 1.484275, -0.6179507, 1, 0.9647059, 0, 1,
-0.9325665, 0.02735563, -0.1431726, 1, 0.972549, 0, 1,
-0.9249831, -1.111204, -2.391072, 1, 0.9764706, 0, 1,
-0.9139929, 0.8692674, 0.6458305, 1, 0.9843137, 0, 1,
-0.9135831, 0.3443706, -0.5611364, 1, 0.9882353, 0, 1,
-0.9132432, -1.351213, -0.7712507, 1, 0.9960784, 0, 1,
-0.9090729, 0.08099632, -1.032658, 0.9960784, 1, 0, 1,
-0.9072266, -1.95803, -2.946956, 0.9921569, 1, 0, 1,
-0.9066221, -1.047695, -3.298904, 0.9843137, 1, 0, 1,
-0.9053434, 0.2151803, -2.240511, 0.9803922, 1, 0, 1,
-0.9036018, -0.3460186, -2.544272, 0.972549, 1, 0, 1,
-0.9032271, -0.2770901, -2.12496, 0.9686275, 1, 0, 1,
-0.9004211, -0.03640385, -3.07907, 0.9607843, 1, 0, 1,
-0.8970269, 1.448886, -0.9183339, 0.9568627, 1, 0, 1,
-0.8908907, 0.2511522, -2.296578, 0.9490196, 1, 0, 1,
-0.8904684, -0.3393419, -3.206039, 0.945098, 1, 0, 1,
-0.8749788, 0.9657246, -0.8519056, 0.9372549, 1, 0, 1,
-0.8732246, -0.9529884, -1.75421, 0.9333333, 1, 0, 1,
-0.8710382, 0.1562542, 0.01258826, 0.9254902, 1, 0, 1,
-0.867251, 1.86517, 0.8104452, 0.9215686, 1, 0, 1,
-0.8641888, 0.47038, -1.034389, 0.9137255, 1, 0, 1,
-0.8636746, -0.344346, -2.464854, 0.9098039, 1, 0, 1,
-0.8565733, 0.3496952, -0.3266166, 0.9019608, 1, 0, 1,
-0.8555166, 1.414122, 0.009544802, 0.8941177, 1, 0, 1,
-0.8554084, 0.009142176, 0.3760796, 0.8901961, 1, 0, 1,
-0.8521211, 1.749462, -0.8767468, 0.8823529, 1, 0, 1,
-0.8377689, -1.050911, -2.040433, 0.8784314, 1, 0, 1,
-0.8368787, -0.1068717, 0.3504599, 0.8705882, 1, 0, 1,
-0.8298792, 0.2948186, 0.6256002, 0.8666667, 1, 0, 1,
-0.828306, -0.04236279, -1.799019, 0.8588235, 1, 0, 1,
-0.8213921, 1.010892, -2.560347, 0.854902, 1, 0, 1,
-0.8155212, -0.4627849, -1.32907, 0.8470588, 1, 0, 1,
-0.8145028, -0.8744679, -1.644945, 0.8431373, 1, 0, 1,
-0.8129979, 0.2676286, -2.109562, 0.8352941, 1, 0, 1,
-0.8117967, -0.9947424, -2.85744, 0.8313726, 1, 0, 1,
-0.8104913, -2.014892, -1.337901, 0.8235294, 1, 0, 1,
-0.8039877, -1.043275, -3.202229, 0.8196079, 1, 0, 1,
-0.8029645, -0.03479621, -2.293782, 0.8117647, 1, 0, 1,
-0.8018157, -1.269546, -1.880838, 0.8078431, 1, 0, 1,
-0.7951866, 1.202977, -1.578199, 0.8, 1, 0, 1,
-0.788827, -1.297412, -4.02779, 0.7921569, 1, 0, 1,
-0.7828249, -0.8736347, -1.632889, 0.7882353, 1, 0, 1,
-0.7788328, -3.169813, -3.354105, 0.7803922, 1, 0, 1,
-0.7677875, -0.1809531, -2.178615, 0.7764706, 1, 0, 1,
-0.7651259, -0.2504006, -0.05571182, 0.7686275, 1, 0, 1,
-0.761001, 0.7799442, 1.120191, 0.7647059, 1, 0, 1,
-0.7544633, -0.4388371, -2.340069, 0.7568628, 1, 0, 1,
-0.7506562, -2.011976, -4.297787, 0.7529412, 1, 0, 1,
-0.747022, -1.282372, -2.767514, 0.7450981, 1, 0, 1,
-0.745247, 0.496987, -0.6679871, 0.7411765, 1, 0, 1,
-0.737182, 2.023734, -0.8174744, 0.7333333, 1, 0, 1,
-0.7371512, -1.408604, -3.523769, 0.7294118, 1, 0, 1,
-0.72899, -0.3577563, -2.77403, 0.7215686, 1, 0, 1,
-0.7289479, -0.5631286, -3.166827, 0.7176471, 1, 0, 1,
-0.7223928, -0.8158872, -1.567304, 0.7098039, 1, 0, 1,
-0.7216762, 1.50226, 0.8551317, 0.7058824, 1, 0, 1,
-0.7212961, 1.335327, -0.3580939, 0.6980392, 1, 0, 1,
-0.7149319, -1.500963, -2.665957, 0.6901961, 1, 0, 1,
-0.7112877, 1.253836, -1.142079, 0.6862745, 1, 0, 1,
-0.7109779, 0.8616185, 1.133095, 0.6784314, 1, 0, 1,
-0.709777, -0.7911138, -1.868086, 0.6745098, 1, 0, 1,
-0.7041017, -0.02507532, -1.665726, 0.6666667, 1, 0, 1,
-0.7038326, -0.6827504, -2.098939, 0.6627451, 1, 0, 1,
-0.7028682, -0.3203172, -2.186144, 0.654902, 1, 0, 1,
-0.698132, 0.6706309, -2.218701, 0.6509804, 1, 0, 1,
-0.6957269, -0.6002541, -2.236133, 0.6431373, 1, 0, 1,
-0.6948677, 1.892044, 1.386469, 0.6392157, 1, 0, 1,
-0.6898816, 0.5267984, -0.8740586, 0.6313726, 1, 0, 1,
-0.6827983, -0.5295116, -3.678796, 0.627451, 1, 0, 1,
-0.6806374, 1.499541, -1.467991, 0.6196079, 1, 0, 1,
-0.6740955, 0.65311, 0.002526464, 0.6156863, 1, 0, 1,
-0.6728948, 0.629791, -2.638165, 0.6078432, 1, 0, 1,
-0.6717391, -1.348797, -3.911898, 0.6039216, 1, 0, 1,
-0.6713234, -0.862267, -1.554941, 0.5960785, 1, 0, 1,
-0.6665919, -0.5442754, -1.990457, 0.5882353, 1, 0, 1,
-0.6661385, -1.489663, -3.706015, 0.5843138, 1, 0, 1,
-0.6552705, -0.07369309, -0.2934428, 0.5764706, 1, 0, 1,
-0.6544825, -0.3688676, -0.5739545, 0.572549, 1, 0, 1,
-0.6494437, 1.013294, 0.04540953, 0.5647059, 1, 0, 1,
-0.6448671, -0.0191539, -1.783438, 0.5607843, 1, 0, 1,
-0.6429688, -1.227762, -2.634984, 0.5529412, 1, 0, 1,
-0.6425759, -0.4733333, -1.773732, 0.5490196, 1, 0, 1,
-0.6328946, -0.6464229, -3.173917, 0.5411765, 1, 0, 1,
-0.6279997, 1.632, 0.7757877, 0.5372549, 1, 0, 1,
-0.6260777, 0.4831967, -0.840861, 0.5294118, 1, 0, 1,
-0.6164891, -1.197877, -1.536699, 0.5254902, 1, 0, 1,
-0.5979431, 0.003890011, 1.542975, 0.5176471, 1, 0, 1,
-0.5935313, 2.649044, -1.368119, 0.5137255, 1, 0, 1,
-0.5921699, 1.139095, 0.05039139, 0.5058824, 1, 0, 1,
-0.589772, 0.8397927, 0.3122791, 0.5019608, 1, 0, 1,
-0.5893685, -0.3515725, -1.035393, 0.4941176, 1, 0, 1,
-0.5773783, -1.051787, -1.659451, 0.4862745, 1, 0, 1,
-0.5767638, 0.6066188, -0.2915883, 0.4823529, 1, 0, 1,
-0.5745223, 0.06917991, -1.241623, 0.4745098, 1, 0, 1,
-0.5738993, -0.9135692, -2.89969, 0.4705882, 1, 0, 1,
-0.573025, -0.5568632, -3.778813, 0.4627451, 1, 0, 1,
-0.5722046, 1.776059, -0.571638, 0.4588235, 1, 0, 1,
-0.5713003, 0.9767936, -0.01196839, 0.4509804, 1, 0, 1,
-0.5703934, 0.1815646, -1.506083, 0.4470588, 1, 0, 1,
-0.5701771, -0.9363693, -1.70282, 0.4392157, 1, 0, 1,
-0.5675494, 2.095079, -0.9565928, 0.4352941, 1, 0, 1,
-0.566418, 0.1187765, -1.882833, 0.427451, 1, 0, 1,
-0.5645776, 1.227222, -1.260575, 0.4235294, 1, 0, 1,
-0.564113, 0.4060002, 1.555873, 0.4156863, 1, 0, 1,
-0.5634521, 1.764182, -0.6184351, 0.4117647, 1, 0, 1,
-0.5599765, -1.725183, -1.411916, 0.4039216, 1, 0, 1,
-0.5554535, -0.1449954, -0.8362275, 0.3960784, 1, 0, 1,
-0.5550778, -1.362243, -1.889892, 0.3921569, 1, 0, 1,
-0.5542614, 0.1983394, -1.477075, 0.3843137, 1, 0, 1,
-0.5437294, -0.8351218, -2.917154, 0.3803922, 1, 0, 1,
-0.5406311, 0.7915094, 0.3239356, 0.372549, 1, 0, 1,
-0.5404772, -1.16579, -3.537323, 0.3686275, 1, 0, 1,
-0.5389838, -1.914662, -2.888592, 0.3607843, 1, 0, 1,
-0.5378801, 2.100594, 0.6115315, 0.3568628, 1, 0, 1,
-0.5359223, -0.2530724, -1.862721, 0.3490196, 1, 0, 1,
-0.5268491, -0.3834993, -2.819968, 0.345098, 1, 0, 1,
-0.5231867, 1.137249, 0.03137557, 0.3372549, 1, 0, 1,
-0.5207291, -0.280798, -2.571155, 0.3333333, 1, 0, 1,
-0.520335, -2.328484, -4.121621, 0.3254902, 1, 0, 1,
-0.520184, -0.3007089, -1.998387, 0.3215686, 1, 0, 1,
-0.511745, -0.6743096, -2.438007, 0.3137255, 1, 0, 1,
-0.5097254, -1.288235, -3.185416, 0.3098039, 1, 0, 1,
-0.5005623, -0.2791406, -1.945408, 0.3019608, 1, 0, 1,
-0.4952996, 0.01379373, -2.778085, 0.2941177, 1, 0, 1,
-0.4949126, 0.4481909, -0.4241686, 0.2901961, 1, 0, 1,
-0.4895507, 0.6979066, 0.3452509, 0.282353, 1, 0, 1,
-0.4802653, -0.2540662, -0.08140138, 0.2784314, 1, 0, 1,
-0.4793407, 1.317452, -0.08673461, 0.2705882, 1, 0, 1,
-0.4756164, -0.144128, -1.623189, 0.2666667, 1, 0, 1,
-0.4703107, -0.003474329, -2.779354, 0.2588235, 1, 0, 1,
-0.4619015, 0.05939925, -1.632395, 0.254902, 1, 0, 1,
-0.4603748, -0.9949316, -3.41693, 0.2470588, 1, 0, 1,
-0.4565885, 0.1064012, -2.467217, 0.2431373, 1, 0, 1,
-0.4523107, -0.545182, -1.694911, 0.2352941, 1, 0, 1,
-0.4499653, -0.7398082, -2.665894, 0.2313726, 1, 0, 1,
-0.4487167, -0.6425371, -2.775939, 0.2235294, 1, 0, 1,
-0.4478119, -0.1442349, -1.620707, 0.2196078, 1, 0, 1,
-0.4455896, 0.7356082, -0.1937552, 0.2117647, 1, 0, 1,
-0.4454325, -0.1035067, -1.486263, 0.2078431, 1, 0, 1,
-0.4450112, 1.887993, 0.7747141, 0.2, 1, 0, 1,
-0.4444125, 2.016066, -0.09673745, 0.1921569, 1, 0, 1,
-0.4439576, -0.5538763, -2.106276, 0.1882353, 1, 0, 1,
-0.4435124, 0.1026889, -2.241147, 0.1803922, 1, 0, 1,
-0.4425468, 0.5501919, -1.491851, 0.1764706, 1, 0, 1,
-0.4407935, -0.3625405, -1.889453, 0.1686275, 1, 0, 1,
-0.4339667, -2.470916, -3.34176, 0.1647059, 1, 0, 1,
-0.4312155, -0.4389339, -2.461828, 0.1568628, 1, 0, 1,
-0.4231653, -0.2228544, -1.075004, 0.1529412, 1, 0, 1,
-0.4217636, -0.5743972, -0.1978476, 0.145098, 1, 0, 1,
-0.4212753, -0.2152275, -1.98288, 0.1411765, 1, 0, 1,
-0.4196568, -1.073263, -3.280684, 0.1333333, 1, 0, 1,
-0.4174434, -0.1875353, -0.6189988, 0.1294118, 1, 0, 1,
-0.4160187, 0.6142747, -1.973936, 0.1215686, 1, 0, 1,
-0.4068311, 0.6315789, -1.266248, 0.1176471, 1, 0, 1,
-0.4019874, -1.670503, -1.475532, 0.1098039, 1, 0, 1,
-0.4016423, 1.248323, -0.2261184, 0.1058824, 1, 0, 1,
-0.4015783, 0.5732205, -1.44471, 0.09803922, 1, 0, 1,
-0.4001687, 1.421862, 0.9225358, 0.09019608, 1, 0, 1,
-0.3961557, -0.5512449, -2.5093, 0.08627451, 1, 0, 1,
-0.3955125, 0.01290725, -3.043923, 0.07843138, 1, 0, 1,
-0.393953, 1.891819, -0.6092276, 0.07450981, 1, 0, 1,
-0.3937082, 0.0553593, -0.3096366, 0.06666667, 1, 0, 1,
-0.3907287, 0.7538959, -1.032393, 0.0627451, 1, 0, 1,
-0.3895083, 0.04330296, -1.417473, 0.05490196, 1, 0, 1,
-0.3857162, 1.260367, 0.4553603, 0.05098039, 1, 0, 1,
-0.3853559, 0.8947916, 0.2919138, 0.04313726, 1, 0, 1,
-0.3818501, 0.3303988, 0.52513, 0.03921569, 1, 0, 1,
-0.3799423, -0.1390744, -2.854133, 0.03137255, 1, 0, 1,
-0.3780133, 0.4409847, 1.541196, 0.02745098, 1, 0, 1,
-0.3776997, 0.3927792, 0.6438513, 0.01960784, 1, 0, 1,
-0.3766688, -1.246222, -3.608418, 0.01568628, 1, 0, 1,
-0.3766033, -1.112552, -3.505412, 0.007843138, 1, 0, 1,
-0.3707099, -0.7500876, -2.338861, 0.003921569, 1, 0, 1,
-0.3706653, -0.2851655, -1.538643, 0, 1, 0.003921569, 1,
-0.3682002, -0.7030381, -0.7781467, 0, 1, 0.01176471, 1,
-0.363034, -0.8575982, -2.220627, 0, 1, 0.01568628, 1,
-0.3627343, -0.3374479, -1.242906, 0, 1, 0.02352941, 1,
-0.3610947, -0.07242939, -1.701586, 0, 1, 0.02745098, 1,
-0.3599988, 0.4916469, -1.363805, 0, 1, 0.03529412, 1,
-0.357268, 1.264303, -0.8243244, 0, 1, 0.03921569, 1,
-0.3565748, -0.5976049, -2.595852, 0, 1, 0.04705882, 1,
-0.3475728, -0.6337609, -3.347408, 0, 1, 0.05098039, 1,
-0.3445525, -0.57167, -3.311791, 0, 1, 0.05882353, 1,
-0.3399603, -0.3955426, -1.783953, 0, 1, 0.0627451, 1,
-0.3376069, -0.3385383, -1.503071, 0, 1, 0.07058824, 1,
-0.3368313, 0.9595031, -0.2679046, 0, 1, 0.07450981, 1,
-0.3359701, 0.5919238, 0.2258705, 0, 1, 0.08235294, 1,
-0.3329954, 0.9188662, 0.6424462, 0, 1, 0.08627451, 1,
-0.3318346, 0.1971413, 1.130819, 0, 1, 0.09411765, 1,
-0.3286208, -2.200618, -4.062983, 0, 1, 0.1019608, 1,
-0.3245603, 1.168401, 0.07033683, 0, 1, 0.1058824, 1,
-0.3208463, 0.4835238, 1.880135, 0, 1, 0.1137255, 1,
-0.3148946, -2.712985, -3.365163, 0, 1, 0.1176471, 1,
-0.3144582, 0.1292404, -3.045199, 0, 1, 0.1254902, 1,
-0.3124664, 1.447917, -0.2684342, 0, 1, 0.1294118, 1,
-0.3117955, -1.878999, -4.36431, 0, 1, 0.1372549, 1,
-0.3103014, -1.890015, -2.288215, 0, 1, 0.1411765, 1,
-0.3025916, -0.6718487, -3.675385, 0, 1, 0.1490196, 1,
-0.3016734, 0.5136083, 0.8745503, 0, 1, 0.1529412, 1,
-0.3009477, 1.127603, -2.496104, 0, 1, 0.1607843, 1,
-0.2986907, -0.796212, -1.471543, 0, 1, 0.1647059, 1,
-0.2970889, -1.517459, -2.72328, 0, 1, 0.172549, 1,
-0.2903088, 1.957887, -1.618232, 0, 1, 0.1764706, 1,
-0.2888258, -0.8448995, -4.083956, 0, 1, 0.1843137, 1,
-0.2834736, -0.8656776, -3.115952, 0, 1, 0.1882353, 1,
-0.2819602, 0.1484269, -0.5479932, 0, 1, 0.1960784, 1,
-0.2815212, -0.03359094, -2.097783, 0, 1, 0.2039216, 1,
-0.2805593, 0.4453159, -1.956033, 0, 1, 0.2078431, 1,
-0.2781995, -0.1468339, -0.9441988, 0, 1, 0.2156863, 1,
-0.2769891, -0.00407576, -3.721374, 0, 1, 0.2196078, 1,
-0.2768468, -0.1815797, -2.103248, 0, 1, 0.227451, 1,
-0.275734, 1.387387, -1.450109, 0, 1, 0.2313726, 1,
-0.2757297, -0.1442663, -2.518588, 0, 1, 0.2392157, 1,
-0.275323, 1.142041, -0.6750438, 0, 1, 0.2431373, 1,
-0.2739308, -2.216872, -3.332738, 0, 1, 0.2509804, 1,
-0.2670109, 0.1691712, 0.4225161, 0, 1, 0.254902, 1,
-0.265942, -0.7535936, -1.537505, 0, 1, 0.2627451, 1,
-0.2644938, -1.111573, -1.485961, 0, 1, 0.2666667, 1,
-0.2624851, 0.1631512, -2.300171, 0, 1, 0.2745098, 1,
-0.2612613, 1.465636, -1.162665, 0, 1, 0.2784314, 1,
-0.2598562, -0.1440113, -3.212261, 0, 1, 0.2862745, 1,
-0.2583487, 0.4993504, -1.514145, 0, 1, 0.2901961, 1,
-0.2558503, -2.587653, -2.01096, 0, 1, 0.2980392, 1,
-0.2557607, -0.7530633, -3.831023, 0, 1, 0.3058824, 1,
-0.2541283, 0.05807636, -1.70121, 0, 1, 0.3098039, 1,
-0.2504639, -0.7187896, -3.649337, 0, 1, 0.3176471, 1,
-0.2456847, -2.355785, -2.375374, 0, 1, 0.3215686, 1,
-0.2439128, -0.4716569, -2.02987, 0, 1, 0.3294118, 1,
-0.2413777, -0.3340116, -3.997967, 0, 1, 0.3333333, 1,
-0.2410965, -1.1316, -2.305205, 0, 1, 0.3411765, 1,
-0.2396422, 1.084671, -2.927182, 0, 1, 0.345098, 1,
-0.237977, -0.2656084, -2.187691, 0, 1, 0.3529412, 1,
-0.2366459, 1.541742, -0.02374838, 0, 1, 0.3568628, 1,
-0.2193054, -1.754852, -2.664461, 0, 1, 0.3647059, 1,
-0.216964, 0.786054, 1.031559, 0, 1, 0.3686275, 1,
-0.2162369, -0.02753096, -0.6851372, 0, 1, 0.3764706, 1,
-0.2128173, -0.4844869, -3.18885, 0, 1, 0.3803922, 1,
-0.2119846, 0.3275376, -0.04000529, 0, 1, 0.3882353, 1,
-0.2111855, -0.556628, -3.867445, 0, 1, 0.3921569, 1,
-0.2072083, -0.2859666, -1.09866, 0, 1, 0.4, 1,
-0.2038375, -0.4174313, -2.022565, 0, 1, 0.4078431, 1,
-0.202829, -0.6266273, -3.112441, 0, 1, 0.4117647, 1,
-0.2023496, 0.4167182, -0.2420791, 0, 1, 0.4196078, 1,
-0.2020921, 0.4858433, -0.7945058, 0, 1, 0.4235294, 1,
-0.2020388, 0.5902003, 0.1097074, 0, 1, 0.4313726, 1,
-0.2012946, 0.1504683, -1.634398, 0, 1, 0.4352941, 1,
-0.2003724, 0.469293, -0.5348021, 0, 1, 0.4431373, 1,
-0.1963645, -0.3155286, -3.682589, 0, 1, 0.4470588, 1,
-0.1959848, -1.228682, -3.138312, 0, 1, 0.454902, 1,
-0.1958219, 1.68642, -0.6571352, 0, 1, 0.4588235, 1,
-0.1903751, -0.6212013, -5.207145, 0, 1, 0.4666667, 1,
-0.1872819, 0.09901361, -1.434438, 0, 1, 0.4705882, 1,
-0.1797464, 0.947608, 0.3826628, 0, 1, 0.4784314, 1,
-0.1794155, -0.9597992, -4.396497, 0, 1, 0.4823529, 1,
-0.1786637, 0.1098644, -1.468552, 0, 1, 0.4901961, 1,
-0.1783685, 1.706078, 0.3292195, 0, 1, 0.4941176, 1,
-0.1767967, 0.1311245, -0.5677113, 0, 1, 0.5019608, 1,
-0.1763833, -0.2156624, -2.273483, 0, 1, 0.509804, 1,
-0.173085, -1.268751, -2.388074, 0, 1, 0.5137255, 1,
-0.1691737, 0.2740623, 0.5362905, 0, 1, 0.5215687, 1,
-0.1677549, 1.661114, -2.284302, 0, 1, 0.5254902, 1,
-0.16452, -1.160725, -2.930109, 0, 1, 0.5333334, 1,
-0.1592605, 0.3127265, -2.567317, 0, 1, 0.5372549, 1,
-0.1582719, -0.2479589, -3.054808, 0, 1, 0.5450981, 1,
-0.1552965, 0.8900918, -1.340629, 0, 1, 0.5490196, 1,
-0.1508883, -0.1783433, -0.8824746, 0, 1, 0.5568628, 1,
-0.1485973, -0.7017698, -4.247941, 0, 1, 0.5607843, 1,
-0.1439084, 1.338607, -0.09340613, 0, 1, 0.5686275, 1,
-0.1409827, -0.0542657, -0.2830184, 0, 1, 0.572549, 1,
-0.1409494, 0.1735583, 0.1566337, 0, 1, 0.5803922, 1,
-0.13638, 0.7388494, 1.521738, 0, 1, 0.5843138, 1,
-0.1296349, 0.1409959, -2.533469, 0, 1, 0.5921569, 1,
-0.1259824, -1.800453, -1.770091, 0, 1, 0.5960785, 1,
-0.1259383, -1.958594, -1.5108, 0, 1, 0.6039216, 1,
-0.1253256, -0.5716408, -2.209585, 0, 1, 0.6117647, 1,
-0.1178033, -2.063115, -2.072786, 0, 1, 0.6156863, 1,
-0.116147, 0.9950232, -0.1200667, 0, 1, 0.6235294, 1,
-0.110531, -0.5849841, -1.146742, 0, 1, 0.627451, 1,
-0.1102124, -1.038337, -2.790354, 0, 1, 0.6352941, 1,
-0.1088894, 2.258925, 0.6169933, 0, 1, 0.6392157, 1,
-0.1072048, 1.87827, -2.17583, 0, 1, 0.6470588, 1,
-0.1056165, 0.3990007, 0.9885835, 0, 1, 0.6509804, 1,
-0.1037364, 0.5269117, 1.328833, 0, 1, 0.6588235, 1,
-0.09899512, 0.2585064, 0.7395082, 0, 1, 0.6627451, 1,
-0.0984755, 0.6861237, -1.738972, 0, 1, 0.6705883, 1,
-0.09842257, -0.9041842, -3.407164, 0, 1, 0.6745098, 1,
-0.09489726, -1.970968, -4.612669, 0, 1, 0.682353, 1,
-0.09075237, -1.032902, -2.461807, 0, 1, 0.6862745, 1,
-0.08852457, 0.2066707, -0.06604628, 0, 1, 0.6941177, 1,
-0.08680238, -1.649659, -2.058838, 0, 1, 0.7019608, 1,
-0.08417951, -0.666845, -5.100413, 0, 1, 0.7058824, 1,
-0.07981867, -0.3576972, -2.40352, 0, 1, 0.7137255, 1,
-0.07811667, -0.7612943, -2.937225, 0, 1, 0.7176471, 1,
-0.07199111, 1.150199, 0.9670447, 0, 1, 0.7254902, 1,
-0.06736135, 0.7191566, -0.6996655, 0, 1, 0.7294118, 1,
-0.06646611, -1.169931, -4.512507, 0, 1, 0.7372549, 1,
-0.06636454, -0.1317051, -2.473241, 0, 1, 0.7411765, 1,
-0.06492134, 0.5930257, -0.1514934, 0, 1, 0.7490196, 1,
-0.06440506, 0.3215663, 0.02012424, 0, 1, 0.7529412, 1,
-0.0624865, 2.721845, 1.137781, 0, 1, 0.7607843, 1,
-0.05218561, -0.1597189, -2.841985, 0, 1, 0.7647059, 1,
-0.05153887, 0.3190847, 0.00255298, 0, 1, 0.772549, 1,
-0.04858136, -1.150356, -1.951022, 0, 1, 0.7764706, 1,
-0.04490806, 0.2119614, -0.6393635, 0, 1, 0.7843137, 1,
-0.0431872, -0.1479462, -2.246705, 0, 1, 0.7882353, 1,
-0.03952941, 2.589072, -1.393436, 0, 1, 0.7960784, 1,
-0.03593758, 1.386617, 0.3382233, 0, 1, 0.8039216, 1,
-0.03357737, -1.909374, -3.020324, 0, 1, 0.8078431, 1,
-0.02636199, 0.1113642, -0.3149241, 0, 1, 0.8156863, 1,
-0.02116846, -1.86728, -3.760784, 0, 1, 0.8196079, 1,
-0.02074432, 1.238484, -0.06604735, 0, 1, 0.827451, 1,
-0.01771674, -1.203913, -2.563848, 0, 1, 0.8313726, 1,
-0.01681555, -0.4384401, -2.577731, 0, 1, 0.8392157, 1,
-0.0148494, -0.9134737, -4.882745, 0, 1, 0.8431373, 1,
-0.01312626, 0.06522182, 1.346156, 0, 1, 0.8509804, 1,
-0.002575714, 0.2173245, 1.755836, 0, 1, 0.854902, 1,
0.002594506, -0.5088183, 4.383653, 0, 1, 0.8627451, 1,
0.006301667, -1.564439, 3.900468, 0, 1, 0.8666667, 1,
0.007061471, 0.8441077, -0.5022033, 0, 1, 0.8745098, 1,
0.008677655, 0.7707361, -2.652087, 0, 1, 0.8784314, 1,
0.01138633, 2.218402, -0.1486812, 0, 1, 0.8862745, 1,
0.01336409, 0.5301396, -1.640195, 0, 1, 0.8901961, 1,
0.01540047, -0.3001257, 3.002775, 0, 1, 0.8980392, 1,
0.01867094, -1.990791, 3.036353, 0, 1, 0.9058824, 1,
0.02314364, -0.1948101, 4.548123, 0, 1, 0.9098039, 1,
0.03191968, 1.16499, 0.3754643, 0, 1, 0.9176471, 1,
0.03197383, 0.07806215, -0.003765941, 0, 1, 0.9215686, 1,
0.0320131, 1.524343, 1.508902, 0, 1, 0.9294118, 1,
0.03392765, 0.4237294, 0.8460105, 0, 1, 0.9333333, 1,
0.04234558, -0.04285362, 1.874158, 0, 1, 0.9411765, 1,
0.05069983, -0.3036225, 2.820501, 0, 1, 0.945098, 1,
0.05251776, -0.1937785, 2.851344, 0, 1, 0.9529412, 1,
0.05268003, 0.8511103, -0.2240591, 0, 1, 0.9568627, 1,
0.06558675, 1.969844, -2.545334, 0, 1, 0.9647059, 1,
0.06738379, 0.8381464, 1.197517, 0, 1, 0.9686275, 1,
0.06751368, -0.9760189, 4.038834, 0, 1, 0.9764706, 1,
0.06809237, -0.8191425, 2.155132, 0, 1, 0.9803922, 1,
0.07288371, 0.1887318, 0.05304226, 0, 1, 0.9882353, 1,
0.07524658, -0.9214523, 3.709751, 0, 1, 0.9921569, 1,
0.07527116, 0.04374728, 2.515601, 0, 1, 1, 1,
0.07932552, 0.02686471, 0.5768246, 0, 0.9921569, 1, 1,
0.08287432, 0.330427, 0.2823133, 0, 0.9882353, 1, 1,
0.08340348, -0.4413462, 3.748441, 0, 0.9803922, 1, 1,
0.08348703, 0.1224906, 0.9517047, 0, 0.9764706, 1, 1,
0.08538965, 0.6234365, -0.2467915, 0, 0.9686275, 1, 1,
0.08853517, -0.2261952, 2.873209, 0, 0.9647059, 1, 1,
0.08893481, 0.9113032, 0.1666115, 0, 0.9568627, 1, 1,
0.09372625, 0.113188, -0.7205691, 0, 0.9529412, 1, 1,
0.09385055, 2.399396, -1.471694, 0, 0.945098, 1, 1,
0.09386603, 1.227957, 0.5281165, 0, 0.9411765, 1, 1,
0.09412797, 1.242692, 1.594479, 0, 0.9333333, 1, 1,
0.09831886, 0.6138084, 0.6181856, 0, 0.9294118, 1, 1,
0.1021893, 0.3580543, -1.209987, 0, 0.9215686, 1, 1,
0.1037486, -0.2697725, 1.375115, 0, 0.9176471, 1, 1,
0.10684, -0.5754969, 3.655729, 0, 0.9098039, 1, 1,
0.1105796, -1.296736, 3.749754, 0, 0.9058824, 1, 1,
0.1108986, 1.631374, 0.6310325, 0, 0.8980392, 1, 1,
0.1119848, -0.2380007, 3.916599, 0, 0.8901961, 1, 1,
0.1145272, -0.6492184, 3.576224, 0, 0.8862745, 1, 1,
0.1145462, 0.1755698, 0.5286852, 0, 0.8784314, 1, 1,
0.1148898, -2.144652, 2.159064, 0, 0.8745098, 1, 1,
0.1206765, 0.980508, -1.246645, 0, 0.8666667, 1, 1,
0.1284614, -2.150029, 2.993945, 0, 0.8627451, 1, 1,
0.1319271, -0.544843, 2.758628, 0, 0.854902, 1, 1,
0.1357607, 0.4043382, -1.24813, 0, 0.8509804, 1, 1,
0.1368006, -1.722826, 2.272402, 0, 0.8431373, 1, 1,
0.1387836, 1.988191, 1.051724, 0, 0.8392157, 1, 1,
0.1389437, -0.3124529, 3.87099, 0, 0.8313726, 1, 1,
0.1389614, 0.6371081, -0.545599, 0, 0.827451, 1, 1,
0.1403157, 0.3884306, 0.1187586, 0, 0.8196079, 1, 1,
0.1410904, -1.355087, 1.627616, 0, 0.8156863, 1, 1,
0.144894, -1.907091, 4.019542, 0, 0.8078431, 1, 1,
0.1469464, 1.182177, 0.05214234, 0, 0.8039216, 1, 1,
0.1487513, 0.9625225, 2.920731, 0, 0.7960784, 1, 1,
0.1500868, -0.8623727, 2.91152, 0, 0.7882353, 1, 1,
0.1539697, -0.2901662, 2.14116, 0, 0.7843137, 1, 1,
0.1567492, 0.09230585, 1.310895, 0, 0.7764706, 1, 1,
0.1575141, -0.4378779, 4.264781, 0, 0.772549, 1, 1,
0.1592181, -0.6919272, 2.692357, 0, 0.7647059, 1, 1,
0.1672126, 0.08442401, 0.9595275, 0, 0.7607843, 1, 1,
0.167604, -1.100762, 3.280869, 0, 0.7529412, 1, 1,
0.1677327, -1.620433, 0.8923244, 0, 0.7490196, 1, 1,
0.1695139, 1.106127, 0.7826917, 0, 0.7411765, 1, 1,
0.1709252, 0.9997168, 0.7531594, 0, 0.7372549, 1, 1,
0.1714314, 0.02737328, 3.30342, 0, 0.7294118, 1, 1,
0.1730288, -1.868613, 3.456856, 0, 0.7254902, 1, 1,
0.1731339, 0.668069, 1.501723, 0, 0.7176471, 1, 1,
0.1802152, 0.4174423, -0.04853977, 0, 0.7137255, 1, 1,
0.1821962, 0.1939969, -1.997793, 0, 0.7058824, 1, 1,
0.1834216, 0.48429, 0.2478098, 0, 0.6980392, 1, 1,
0.1848359, -0.7918116, 3.918643, 0, 0.6941177, 1, 1,
0.188961, -1.807384, 2.488196, 0, 0.6862745, 1, 1,
0.1910405, -1.63073, 1.892746, 0, 0.682353, 1, 1,
0.1912298, -0.8157559, 1.294871, 0, 0.6745098, 1, 1,
0.1915517, 0.2119677, 0.9837877, 0, 0.6705883, 1, 1,
0.1949668, 2.721376, 0.8177926, 0, 0.6627451, 1, 1,
0.1958451, 0.06875497, 3.168195, 0, 0.6588235, 1, 1,
0.1967837, 0.8619841, 0.4176535, 0, 0.6509804, 1, 1,
0.1988993, 0.2345084, 1.552859, 0, 0.6470588, 1, 1,
0.2026125, 0.9535018, 0.5250154, 0, 0.6392157, 1, 1,
0.2064441, 0.858416, -0.1027723, 0, 0.6352941, 1, 1,
0.2067604, 0.7505594, 1.076187, 0, 0.627451, 1, 1,
0.2076376, -2.485175, 0.7191436, 0, 0.6235294, 1, 1,
0.2101425, 0.5486332, 0.3703599, 0, 0.6156863, 1, 1,
0.21111, -0.5851737, 1.279344, 0, 0.6117647, 1, 1,
0.2164164, -2.185719, 2.81933, 0, 0.6039216, 1, 1,
0.2184115, 0.8895198, -0.4390444, 0, 0.5960785, 1, 1,
0.2192489, 0.4986267, -1.53128, 0, 0.5921569, 1, 1,
0.2249201, 0.19954, 0.7811701, 0, 0.5843138, 1, 1,
0.2361888, -1.537017, 1.835627, 0, 0.5803922, 1, 1,
0.2415291, -0.3045012, 1.550586, 0, 0.572549, 1, 1,
0.2416375, -0.2385727, 3.486031, 0, 0.5686275, 1, 1,
0.2488552, 0.7150111, 0.1201522, 0, 0.5607843, 1, 1,
0.2521853, 1.077236, 0.6235372, 0, 0.5568628, 1, 1,
0.2549674, 0.9080443, -0.08754983, 0, 0.5490196, 1, 1,
0.2588826, 0.08435816, 0.05438119, 0, 0.5450981, 1, 1,
0.2611387, 0.06420457, 2.682141, 0, 0.5372549, 1, 1,
0.261345, -1.671775, 2.983886, 0, 0.5333334, 1, 1,
0.2661829, -0.2231009, 1.143106, 0, 0.5254902, 1, 1,
0.2683798, 1.089303, 2.402672, 0, 0.5215687, 1, 1,
0.276057, -0.07731928, 0.5424466, 0, 0.5137255, 1, 1,
0.281026, 0.4794995, -0.5784119, 0, 0.509804, 1, 1,
0.2828122, -0.0591359, 1.67376, 0, 0.5019608, 1, 1,
0.2832739, -0.2558485, 0.9152604, 0, 0.4941176, 1, 1,
0.2843403, 0.9250305, -0.4873507, 0, 0.4901961, 1, 1,
0.2855023, -1.096193, 3.601356, 0, 0.4823529, 1, 1,
0.2885156, -1.088493, 2.41523, 0, 0.4784314, 1, 1,
0.2889888, -0.07436521, 0.4249729, 0, 0.4705882, 1, 1,
0.2896109, -1.023592, 2.957325, 0, 0.4666667, 1, 1,
0.2915869, 0.03328856, 3.477059, 0, 0.4588235, 1, 1,
0.2918564, -0.1268453, 1.469756, 0, 0.454902, 1, 1,
0.2955726, 1.144207, -2.254972, 0, 0.4470588, 1, 1,
0.2958402, -0.6228006, 2.316782, 0, 0.4431373, 1, 1,
0.2959872, 0.1258405, 0.8135126, 0, 0.4352941, 1, 1,
0.2983217, 0.2228998, 0.9540163, 0, 0.4313726, 1, 1,
0.2987216, -1.113016, 2.357472, 0, 0.4235294, 1, 1,
0.3001759, -2.785163, 2.915069, 0, 0.4196078, 1, 1,
0.3007931, 0.5034697, 0.01504431, 0, 0.4117647, 1, 1,
0.3129817, -0.3228909, 1.816191, 0, 0.4078431, 1, 1,
0.3147709, -1.455459, 3.478043, 0, 0.4, 1, 1,
0.3181477, -0.5195237, 2.489746, 0, 0.3921569, 1, 1,
0.3216173, 0.2436861, 0.5381528, 0, 0.3882353, 1, 1,
0.3223349, 0.4262016, 1.649314, 0, 0.3803922, 1, 1,
0.3245007, 0.2226818, -0.710277, 0, 0.3764706, 1, 1,
0.3305021, -0.7109451, 1.843568, 0, 0.3686275, 1, 1,
0.3331657, 0.2694604, -1.41598, 0, 0.3647059, 1, 1,
0.3335252, -1.910854, 2.707236, 0, 0.3568628, 1, 1,
0.3339357, 0.102074, 0.8255489, 0, 0.3529412, 1, 1,
0.3377882, 1.761907, 0.4850972, 0, 0.345098, 1, 1,
0.3383942, -1.45257, 2.973475, 0, 0.3411765, 1, 1,
0.3419411, 0.1555757, 1.994107, 0, 0.3333333, 1, 1,
0.3422362, 2.018712, -0.7721676, 0, 0.3294118, 1, 1,
0.342344, 0.4138298, 0.3426678, 0, 0.3215686, 1, 1,
0.3436256, -1.469732, 3.091127, 0, 0.3176471, 1, 1,
0.348296, 0.4225582, 1.476373, 0, 0.3098039, 1, 1,
0.349568, 0.844976, 1.106432, 0, 0.3058824, 1, 1,
0.3495927, -1.511877, 3.027347, 0, 0.2980392, 1, 1,
0.350598, 1.219288, -1.693604, 0, 0.2901961, 1, 1,
0.3545742, 0.5596656, 1.038355, 0, 0.2862745, 1, 1,
0.3639841, -0.5245047, 3.323241, 0, 0.2784314, 1, 1,
0.3654374, 1.018807, 0.6135625, 0, 0.2745098, 1, 1,
0.3666023, 1.199767, 0.615433, 0, 0.2666667, 1, 1,
0.3720608, 0.9645835, 1.088843, 0, 0.2627451, 1, 1,
0.3736942, -0.6094961, 3.096477, 0, 0.254902, 1, 1,
0.3774804, 1.290529, -0.4393331, 0, 0.2509804, 1, 1,
0.3868706, -0.8691804, 3.201408, 0, 0.2431373, 1, 1,
0.3902507, 1.586439, -0.1726454, 0, 0.2392157, 1, 1,
0.3910205, -0.06662914, 1.184238, 0, 0.2313726, 1, 1,
0.3924039, 0.143774, 1.461368, 0, 0.227451, 1, 1,
0.3933, -0.2058428, 3.043447, 0, 0.2196078, 1, 1,
0.3979626, 0.2733708, -1.139841, 0, 0.2156863, 1, 1,
0.3998954, -1.461857, 2.232143, 0, 0.2078431, 1, 1,
0.3999071, -0.5700549, 2.827276, 0, 0.2039216, 1, 1,
0.4004365, -1.019147, 1.83748, 0, 0.1960784, 1, 1,
0.4008935, -0.9254427, 2.868488, 0, 0.1882353, 1, 1,
0.4044802, 0.2290647, 2.540434, 0, 0.1843137, 1, 1,
0.4078165, -0.5062205, 1.711583, 0, 0.1764706, 1, 1,
0.4097107, -0.4990127, 1.969131, 0, 0.172549, 1, 1,
0.4103033, -0.1098653, 1.670349, 0, 0.1647059, 1, 1,
0.4168308, 1.846898, -1.391648, 0, 0.1607843, 1, 1,
0.4168505, 1.845443, 0.8578664, 0, 0.1529412, 1, 1,
0.4254968, 1.449466, 1.247276, 0, 0.1490196, 1, 1,
0.4285831, -0.2644469, 1.690358, 0, 0.1411765, 1, 1,
0.4306865, -1.280586, 1.916831, 0, 0.1372549, 1, 1,
0.4319031, 0.3422782, 0.5815153, 0, 0.1294118, 1, 1,
0.4341195, 0.8033676, -0.5632219, 0, 0.1254902, 1, 1,
0.4353195, 0.4100327, 0.8689204, 0, 0.1176471, 1, 1,
0.4365695, 0.7518322, 1.709194, 0, 0.1137255, 1, 1,
0.4369026, -0.4997831, 2.412773, 0, 0.1058824, 1, 1,
0.4373079, 1.154707, -0.3951701, 0, 0.09803922, 1, 1,
0.438107, -0.03476091, 1.424784, 0, 0.09411765, 1, 1,
0.4384039, -1.884359, 3.216245, 0, 0.08627451, 1, 1,
0.4405337, -1.423424, 1.886782, 0, 0.08235294, 1, 1,
0.444513, -0.5326166, 2.808174, 0, 0.07450981, 1, 1,
0.4455765, -1.057533, 4.671312, 0, 0.07058824, 1, 1,
0.4462817, 1.466804, -1.88731, 0, 0.0627451, 1, 1,
0.4479943, -0.6719614, 2.586665, 0, 0.05882353, 1, 1,
0.4530723, 0.5121055, 0.4264326, 0, 0.05098039, 1, 1,
0.4538209, 2.792397, 0.7190305, 0, 0.04705882, 1, 1,
0.454713, -1.457171, 1.961783, 0, 0.03921569, 1, 1,
0.454908, 0.1668302, 2.133208, 0, 0.03529412, 1, 1,
0.4564363, 0.3655185, 2.105527, 0, 0.02745098, 1, 1,
0.4569151, -1.900376, 4.543883, 0, 0.02352941, 1, 1,
0.458844, 0.52051, -1.056848, 0, 0.01568628, 1, 1,
0.4594662, 0.672549, 1.529164, 0, 0.01176471, 1, 1,
0.4611889, -0.3995838, 1.54511, 0, 0.003921569, 1, 1,
0.4637879, -0.4383277, 1.808775, 0.003921569, 0, 1, 1,
0.4641307, 1.203037, 0.5606425, 0.007843138, 0, 1, 1,
0.4643608, -1.509379, 1.830765, 0.01568628, 0, 1, 1,
0.4687589, -1.775306, 3.80144, 0.01960784, 0, 1, 1,
0.4711376, -0.07598331, 1.541357, 0.02745098, 0, 1, 1,
0.4740994, -0.07144822, 2.656673, 0.03137255, 0, 1, 1,
0.4756417, -0.4805309, 1.940565, 0.03921569, 0, 1, 1,
0.4781013, -2.480551, 1.52035, 0.04313726, 0, 1, 1,
0.4785138, -1.577825, 2.865469, 0.05098039, 0, 1, 1,
0.4787793, 0.7872543, 2.059606, 0.05490196, 0, 1, 1,
0.4800059, 0.5498323, 0.2542603, 0.0627451, 0, 1, 1,
0.4819393, 0.6443365, -0.4356824, 0.06666667, 0, 1, 1,
0.4833872, -0.8580943, 1.541464, 0.07450981, 0, 1, 1,
0.4836788, -0.5970321, 2.38536, 0.07843138, 0, 1, 1,
0.4852817, 0.3710674, 0.0005156584, 0.08627451, 0, 1, 1,
0.487747, 1.485803, 1.176188, 0.09019608, 0, 1, 1,
0.4902342, 0.5357378, 0.5245929, 0.09803922, 0, 1, 1,
0.4910518, 2.451968, -0.5685459, 0.1058824, 0, 1, 1,
0.4913597, -0.09385997, 2.476603, 0.1098039, 0, 1, 1,
0.496456, 0.0840138, 2.240852, 0.1176471, 0, 1, 1,
0.5008188, -1.340393, 1.906847, 0.1215686, 0, 1, 1,
0.5029655, 0.3555432, -0.277009, 0.1294118, 0, 1, 1,
0.5051736, 0.1663594, 0.2650484, 0.1333333, 0, 1, 1,
0.5128907, -0.6486712, 4.164097, 0.1411765, 0, 1, 1,
0.5129449, 0.3798117, -0.1774758, 0.145098, 0, 1, 1,
0.5243109, 0.2647188, 2.28049, 0.1529412, 0, 1, 1,
0.5249026, 0.2652463, 1.880848, 0.1568628, 0, 1, 1,
0.5273823, -0.09220857, 1.832921, 0.1647059, 0, 1, 1,
0.5332727, 1.427268, -0.6882958, 0.1686275, 0, 1, 1,
0.537891, -0.3736758, 3.263019, 0.1764706, 0, 1, 1,
0.5395258, -0.6008022, 2.099102, 0.1803922, 0, 1, 1,
0.5399451, 0.1472797, 2.834015, 0.1882353, 0, 1, 1,
0.5412593, -0.933619, 1.608598, 0.1921569, 0, 1, 1,
0.5457317, 0.1075001, 2.998045, 0.2, 0, 1, 1,
0.5459009, -1.849199, 2.328001, 0.2078431, 0, 1, 1,
0.5466343, -0.6223059, 2.795993, 0.2117647, 0, 1, 1,
0.5467917, -0.01302341, 1.571887, 0.2196078, 0, 1, 1,
0.5483459, 0.2486608, 1.638292, 0.2235294, 0, 1, 1,
0.5515642, 0.9611766, 0.2884133, 0.2313726, 0, 1, 1,
0.5535119, 0.8980879, 0.5208261, 0.2352941, 0, 1, 1,
0.5575451, 0.03096433, 3.282123, 0.2431373, 0, 1, 1,
0.5605975, -2.669041, 4.387612, 0.2470588, 0, 1, 1,
0.5607081, 0.9511681, 0.03682592, 0.254902, 0, 1, 1,
0.5621893, 0.8068058, -0.3898403, 0.2588235, 0, 1, 1,
0.5626851, -1.987705, 4.840247, 0.2666667, 0, 1, 1,
0.5646322, 0.4004931, -0.09303861, 0.2705882, 0, 1, 1,
0.5697858, -0.495801, 2.525198, 0.2784314, 0, 1, 1,
0.5722775, 0.1380834, 0.8657981, 0.282353, 0, 1, 1,
0.5723116, -0.6179695, 2.49021, 0.2901961, 0, 1, 1,
0.5727092, -0.8834662, 3.262382, 0.2941177, 0, 1, 1,
0.5750461, -0.7652504, 1.845925, 0.3019608, 0, 1, 1,
0.5751171, -0.1682055, 3.111431, 0.3098039, 0, 1, 1,
0.5795898, -0.1004865, 1.378081, 0.3137255, 0, 1, 1,
0.5803274, 0.2274619, 2.302826, 0.3215686, 0, 1, 1,
0.580347, 0.8522231, 1.720371, 0.3254902, 0, 1, 1,
0.5852858, -0.2545261, 3.417131, 0.3333333, 0, 1, 1,
0.5906804, -1.248123, 1.892382, 0.3372549, 0, 1, 1,
0.5924708, 0.7748747, 1.140471, 0.345098, 0, 1, 1,
0.6126792, 0.8884721, -0.1729975, 0.3490196, 0, 1, 1,
0.6127766, -1.363901, 4.168499, 0.3568628, 0, 1, 1,
0.6138281, 0.5304557, 1.835187, 0.3607843, 0, 1, 1,
0.6175992, 1.103616, 1.121082, 0.3686275, 0, 1, 1,
0.6198691, 0.3914719, 1.686507, 0.372549, 0, 1, 1,
0.6300008, -1.093052, 3.388263, 0.3803922, 0, 1, 1,
0.6319473, 0.7904461, 1.38083, 0.3843137, 0, 1, 1,
0.6376434, -0.9619577, 2.609779, 0.3921569, 0, 1, 1,
0.6376572, -1.273759, 3.255588, 0.3960784, 0, 1, 1,
0.6377156, -0.2990065, 1.924626, 0.4039216, 0, 1, 1,
0.6392797, -0.04285286, -0.2349469, 0.4117647, 0, 1, 1,
0.6400812, -0.2404929, 1.958688, 0.4156863, 0, 1, 1,
0.6425872, 0.2826986, 0.4450364, 0.4235294, 0, 1, 1,
0.6445486, 2.057034, 0.7670436, 0.427451, 0, 1, 1,
0.6477951, -0.4993046, 3.368534, 0.4352941, 0, 1, 1,
0.6524765, -0.6995418, 1.61134, 0.4392157, 0, 1, 1,
0.6581602, 0.2878103, 0.9439415, 0.4470588, 0, 1, 1,
0.6603417, -0.8365591, 4.076365, 0.4509804, 0, 1, 1,
0.662025, -0.0415807, 0.6510172, 0.4588235, 0, 1, 1,
0.6632533, -1.138326, 2.582873, 0.4627451, 0, 1, 1,
0.6637438, 1.266091, 0.1343654, 0.4705882, 0, 1, 1,
0.6673698, 2.003364, 0.7662784, 0.4745098, 0, 1, 1,
0.6716604, -0.3706778, 1.871761, 0.4823529, 0, 1, 1,
0.6734833, 0.5397511, -1.102165, 0.4862745, 0, 1, 1,
0.6962172, -1.060604, 0.9181717, 0.4941176, 0, 1, 1,
0.6982412, 1.937508, 0.1517208, 0.5019608, 0, 1, 1,
0.703697, -0.7074066, 4.008332, 0.5058824, 0, 1, 1,
0.7063991, 1.615074, 1.541664, 0.5137255, 0, 1, 1,
0.7079466, 1.07952, -0.2669979, 0.5176471, 0, 1, 1,
0.7085152, 0.2509688, 2.93188, 0.5254902, 0, 1, 1,
0.7111628, 0.5350789, 1.295385, 0.5294118, 0, 1, 1,
0.7114223, -1.258855, 2.398301, 0.5372549, 0, 1, 1,
0.7158896, -0.1419109, 2.020044, 0.5411765, 0, 1, 1,
0.7233671, -0.02984602, 1.125969, 0.5490196, 0, 1, 1,
0.7357684, 1.136489, 0.9732336, 0.5529412, 0, 1, 1,
0.7369288, 0.2376101, 0.6706612, 0.5607843, 0, 1, 1,
0.7391321, -0.6343065, 3.362036, 0.5647059, 0, 1, 1,
0.7401636, -0.6926979, 4.003061, 0.572549, 0, 1, 1,
0.7443166, 0.2167626, 1.42227, 0.5764706, 0, 1, 1,
0.7465077, 0.9083351, 1.998457, 0.5843138, 0, 1, 1,
0.7543321, -0.885331, 3.210483, 0.5882353, 0, 1, 1,
0.758222, 0.1142949, 0.4094855, 0.5960785, 0, 1, 1,
0.7600374, 0.7361463, 0.08370545, 0.6039216, 0, 1, 1,
0.773326, -0.3414088, 3.08106, 0.6078432, 0, 1, 1,
0.7800652, -0.4866839, 3.829705, 0.6156863, 0, 1, 1,
0.7836453, -0.6063414, 2.71339, 0.6196079, 0, 1, 1,
0.7868521, -0.03829546, 1.920603, 0.627451, 0, 1, 1,
0.7881283, 0.8130409, -0.3737096, 0.6313726, 0, 1, 1,
0.7889197, 1.377927, 1.900958, 0.6392157, 0, 1, 1,
0.7906879, 0.3733408, 0.6863227, 0.6431373, 0, 1, 1,
0.7914583, -0.6781211, 1.103406, 0.6509804, 0, 1, 1,
0.7919855, 1.663353, -1.181284, 0.654902, 0, 1, 1,
0.7944126, -2.206486, 1.266374, 0.6627451, 0, 1, 1,
0.8034922, 1.946779, 0.2211894, 0.6666667, 0, 1, 1,
0.8052411, 0.78021, 0.3874216, 0.6745098, 0, 1, 1,
0.8066973, 0.1221296, 2.382294, 0.6784314, 0, 1, 1,
0.8133464, 0.797942, 0.8289458, 0.6862745, 0, 1, 1,
0.8174185, -0.8752674, 2.231865, 0.6901961, 0, 1, 1,
0.8184721, 0.8817179, 1.670783, 0.6980392, 0, 1, 1,
0.8195896, -1.459934, 3.764086, 0.7058824, 0, 1, 1,
0.8253068, 0.3183937, 2.108332, 0.7098039, 0, 1, 1,
0.8293682, -2.150519, 3.685031, 0.7176471, 0, 1, 1,
0.8362188, 1.424499, 1.484705, 0.7215686, 0, 1, 1,
0.8400597, -1.117784, 2.646678, 0.7294118, 0, 1, 1,
0.8440095, -0.3878449, -0.02809866, 0.7333333, 0, 1, 1,
0.8494698, 1.618929, -1.347001, 0.7411765, 0, 1, 1,
0.8509564, 1.080623, 0.2370134, 0.7450981, 0, 1, 1,
0.8582911, 0.5994599, 0.8023177, 0.7529412, 0, 1, 1,
0.8589289, -0.3692442, 1.575889, 0.7568628, 0, 1, 1,
0.8651838, -1.202803, 3.10294, 0.7647059, 0, 1, 1,
0.8680011, 0.442742, 2.067808, 0.7686275, 0, 1, 1,
0.8692529, -0.2113279, 1.016748, 0.7764706, 0, 1, 1,
0.8693739, -1.283837, 2.838829, 0.7803922, 0, 1, 1,
0.8738289, -0.3734976, 1.36725, 0.7882353, 0, 1, 1,
0.8765816, 0.01936675, 1.641392, 0.7921569, 0, 1, 1,
0.8798698, 0.1013044, 0.6455595, 0.8, 0, 1, 1,
0.8803673, 0.771356, 2.344118, 0.8078431, 0, 1, 1,
0.8804997, -0.5113809, 1.749239, 0.8117647, 0, 1, 1,
0.8840076, -2.551109, 2.367327, 0.8196079, 0, 1, 1,
0.884245, -0.9617328, 2.542977, 0.8235294, 0, 1, 1,
0.8864483, 1.513572, -0.4080417, 0.8313726, 0, 1, 1,
0.8892946, 1.368034, 0.4201251, 0.8352941, 0, 1, 1,
0.8941343, 0.6272625, 0.7066141, 0.8431373, 0, 1, 1,
0.8957546, 0.4831522, -0.01468546, 0.8470588, 0, 1, 1,
0.9029973, -0.9624158, 2.270599, 0.854902, 0, 1, 1,
0.9126089, 2.257964, 0.4858159, 0.8588235, 0, 1, 1,
0.9205087, 0.8786182, 1.420231, 0.8666667, 0, 1, 1,
0.9233805, 1.252842, -0.3126684, 0.8705882, 0, 1, 1,
0.9247169, -1.217566, 2.143275, 0.8784314, 0, 1, 1,
0.9251871, 0.8744859, 0.9304595, 0.8823529, 0, 1, 1,
0.9296285, -0.8657266, 0.9972327, 0.8901961, 0, 1, 1,
0.9352739, 0.4224731, -1.589939, 0.8941177, 0, 1, 1,
0.9364598, 0.8594036, 3.995358, 0.9019608, 0, 1, 1,
0.9424779, 0.9433001, 0.6249102, 0.9098039, 0, 1, 1,
0.9456816, 0.587862, 0.6325412, 0.9137255, 0, 1, 1,
0.9508492, -2.269005, 4.586111, 0.9215686, 0, 1, 1,
0.9543008, 1.206397, 1.625087, 0.9254902, 0, 1, 1,
0.9594131, -0.280551, 1.676489, 0.9333333, 0, 1, 1,
0.9595882, -0.7532487, 3.825431, 0.9372549, 0, 1, 1,
0.9613957, -0.02096048, 2.701911, 0.945098, 0, 1, 1,
0.9631678, -0.6064717, 1.366965, 0.9490196, 0, 1, 1,
0.9698132, 0.8876261, 2.206648, 0.9568627, 0, 1, 1,
0.9751584, -0.564464, 2.631779, 0.9607843, 0, 1, 1,
0.9810695, -0.6566811, 2.150403, 0.9686275, 0, 1, 1,
0.9823503, -1.508502, 3.585407, 0.972549, 0, 1, 1,
0.9878222, 0.1934792, 2.13108, 0.9803922, 0, 1, 1,
0.9879982, 0.585663, 3.134273, 0.9843137, 0, 1, 1,
0.9939139, -1.1528, 3.198338, 0.9921569, 0, 1, 1,
0.9949359, 0.8822936, 0.1272381, 0.9960784, 0, 1, 1,
0.995629, -1.772079, 3.709436, 1, 0, 0.9960784, 1,
1.01127, -0.6381205, 2.552473, 1, 0, 0.9882353, 1,
1.011539, 1.025997, -0.5196043, 1, 0, 0.9843137, 1,
1.022439, -0.8121648, 2.666909, 1, 0, 0.9764706, 1,
1.02988, -0.1680074, 1.697031, 1, 0, 0.972549, 1,
1.03195, -0.8493693, 2.515451, 1, 0, 0.9647059, 1,
1.043171, 1.08468, 1.294287, 1, 0, 0.9607843, 1,
1.044144, -1.20997, 3.059039, 1, 0, 0.9529412, 1,
1.046285, 0.1148539, 2.102539, 1, 0, 0.9490196, 1,
1.05, 0.266862, 2.079524, 1, 0, 0.9411765, 1,
1.050357, -0.01355687, -0.2093349, 1, 0, 0.9372549, 1,
1.051157, -0.1518618, -0.3268583, 1, 0, 0.9294118, 1,
1.052564, 0.2041224, -0.8262782, 1, 0, 0.9254902, 1,
1.058211, 0.589697, 2.044502, 1, 0, 0.9176471, 1,
1.05914, -0.5040438, 3.33325, 1, 0, 0.9137255, 1,
1.062091, -1.095127, 2.620881, 1, 0, 0.9058824, 1,
1.06225, 2.663923, -0.1825506, 1, 0, 0.9019608, 1,
1.074248, 0.4005399, 1.638913, 1, 0, 0.8941177, 1,
1.07692, 0.488833, 0.7030852, 1, 0, 0.8862745, 1,
1.077216, 0.8701915, 1.314026, 1, 0, 0.8823529, 1,
1.078769, -0.06265126, 2.066912, 1, 0, 0.8745098, 1,
1.079087, 0.3037904, 2.806197, 1, 0, 0.8705882, 1,
1.079562, 0.4899837, 1.565027, 1, 0, 0.8627451, 1,
1.091216, -1.73116, 1.853018, 1, 0, 0.8588235, 1,
1.09475, 1.113, 0.7271089, 1, 0, 0.8509804, 1,
1.098243, -0.894481, 1.88826, 1, 0, 0.8470588, 1,
1.098789, 1.238151, 0.1003091, 1, 0, 0.8392157, 1,
1.104703, 0.7435432, 0.6670379, 1, 0, 0.8352941, 1,
1.107484, -0.7285085, 2.536055, 1, 0, 0.827451, 1,
1.116747, -0.1398681, 1.780829, 1, 0, 0.8235294, 1,
1.117393, -1.603365, 2.002343, 1, 0, 0.8156863, 1,
1.121495, 1.094468, 1.659455, 1, 0, 0.8117647, 1,
1.127095, 0.2417747, 0.09963076, 1, 0, 0.8039216, 1,
1.127941, -1.341708, 1.576198, 1, 0, 0.7960784, 1,
1.131383, 1.66954, 0.01496848, 1, 0, 0.7921569, 1,
1.142799, -0.2895593, -0.8047398, 1, 0, 0.7843137, 1,
1.148232, -1.283892, 2.517133, 1, 0, 0.7803922, 1,
1.15158, 0.8944728, 1.83376, 1, 0, 0.772549, 1,
1.152769, 0.2608532, 1.071262, 1, 0, 0.7686275, 1,
1.159482, -0.9295238, 0.9191254, 1, 0, 0.7607843, 1,
1.173989, -0.08919271, 2.143067, 1, 0, 0.7568628, 1,
1.177229, 1.911721, 1.419729, 1, 0, 0.7490196, 1,
1.17754, -1.381098, 1.765833, 1, 0, 0.7450981, 1,
1.19493, -0.2689716, 4.051829, 1, 0, 0.7372549, 1,
1.195156, 0.9143709, 2.23339, 1, 0, 0.7333333, 1,
1.196438, 1.026533, 0.02057198, 1, 0, 0.7254902, 1,
1.198008, 0.5188177, 3.100461, 1, 0, 0.7215686, 1,
1.202706, 0.3983859, 2.706971, 1, 0, 0.7137255, 1,
1.202709, -1.616451, 3.721144, 1, 0, 0.7098039, 1,
1.211747, -0.679487, 2.901114, 1, 0, 0.7019608, 1,
1.212702, -0.67932, 2.015347, 1, 0, 0.6941177, 1,
1.218681, -0.02782858, 2.178448, 1, 0, 0.6901961, 1,
1.225063, -0.2868825, 1.429102, 1, 0, 0.682353, 1,
1.226402, -0.1508396, 2.708208, 1, 0, 0.6784314, 1,
1.235944, -0.05559733, 0.9006564, 1, 0, 0.6705883, 1,
1.23687, -0.06540524, 2.307185, 1, 0, 0.6666667, 1,
1.246275, -1.642635, 1.163537, 1, 0, 0.6588235, 1,
1.262634, -0.2333239, 1.471035, 1, 0, 0.654902, 1,
1.271014, 0.4947965, 1.22107, 1, 0, 0.6470588, 1,
1.282056, -1.707512, 0.8013137, 1, 0, 0.6431373, 1,
1.286692, 0.2877684, 0.4986265, 1, 0, 0.6352941, 1,
1.286884, -1.143785, 1.806234, 1, 0, 0.6313726, 1,
1.288682, -1.270099, -0.5958762, 1, 0, 0.6235294, 1,
1.298992, 0.5287746, 2.227441, 1, 0, 0.6196079, 1,
1.307451, -0.2490982, 0.3603942, 1, 0, 0.6117647, 1,
1.309232, -0.9006383, 2.61214, 1, 0, 0.6078432, 1,
1.317799, -0.2006869, 0.6786144, 1, 0, 0.6, 1,
1.320206, 0.1670871, -0.1567463, 1, 0, 0.5921569, 1,
1.320283, 1.422802, -0.5709459, 1, 0, 0.5882353, 1,
1.32223, -0.7464092, 2.286893, 1, 0, 0.5803922, 1,
1.329458, -1.732186, 1.957551, 1, 0, 0.5764706, 1,
1.330152, 0.2944938, 0.3796247, 1, 0, 0.5686275, 1,
1.339661, 0.6192166, 0.0878604, 1, 0, 0.5647059, 1,
1.357752, -0.3783544, 1.651668, 1, 0, 0.5568628, 1,
1.358631, 0.03859111, 1.457544, 1, 0, 0.5529412, 1,
1.36349, -1.141282, 3.399726, 1, 0, 0.5450981, 1,
1.365979, -0.714079, 1.171573, 1, 0, 0.5411765, 1,
1.36816, -1.138497, 1.368719, 1, 0, 0.5333334, 1,
1.368947, -1.721481, 2.45959, 1, 0, 0.5294118, 1,
1.375067, -1.947404, 3.104002, 1, 0, 0.5215687, 1,
1.375443, -0.4274989, 2.117563, 1, 0, 0.5176471, 1,
1.375516, -0.05876697, 1.707518, 1, 0, 0.509804, 1,
1.375859, 1.103556, 1.291068, 1, 0, 0.5058824, 1,
1.378618, 0.3275061, 1.868213, 1, 0, 0.4980392, 1,
1.378796, -1.100132, 3.555607, 1, 0, 0.4901961, 1,
1.401921, -0.3104789, 2.878367, 1, 0, 0.4862745, 1,
1.413977, -0.1275292, 2.297012, 1, 0, 0.4784314, 1,
1.421219, -0.9053485, 2.080647, 1, 0, 0.4745098, 1,
1.426612, 0.2680605, 2.7684, 1, 0, 0.4666667, 1,
1.429149, 1.170855, 0.9938883, 1, 0, 0.4627451, 1,
1.430585, -0.06699231, 2.244875, 1, 0, 0.454902, 1,
1.432101, -1.494264, 0.4379388, 1, 0, 0.4509804, 1,
1.43503, 0.2455913, 1.668503, 1, 0, 0.4431373, 1,
1.452309, 0.6911432, 2.026606, 1, 0, 0.4392157, 1,
1.456233, 0.4984846, 1.358122, 1, 0, 0.4313726, 1,
1.463379, -1.321189, 3.657672, 1, 0, 0.427451, 1,
1.471117, 0.1316544, 1.312714, 1, 0, 0.4196078, 1,
1.491748, -0.04659189, 1.851508, 1, 0, 0.4156863, 1,
1.49898, -0.2111542, 2.457237, 1, 0, 0.4078431, 1,
1.501718, -0.8363313, -0.1038171, 1, 0, 0.4039216, 1,
1.504658, -0.645746, 2.32425, 1, 0, 0.3960784, 1,
1.507537, -0.2126232, 2.053084, 1, 0, 0.3882353, 1,
1.510899, 0.8622317, 1.321756, 1, 0, 0.3843137, 1,
1.515929, -0.457977, 1.391286, 1, 0, 0.3764706, 1,
1.519498, -1.956776, 3.64813, 1, 0, 0.372549, 1,
1.519763, -0.9864322, 3.036196, 1, 0, 0.3647059, 1,
1.528672, -0.5318996, 2.631593, 1, 0, 0.3607843, 1,
1.555242, -0.2422293, 1.982641, 1, 0, 0.3529412, 1,
1.557208, 0.300637, 3.592534, 1, 0, 0.3490196, 1,
1.557457, -1.019492, 1.701049, 1, 0, 0.3411765, 1,
1.558222, 0.6059977, 0.3072633, 1, 0, 0.3372549, 1,
1.561422, 2.674459, 0.9999928, 1, 0, 0.3294118, 1,
1.566599, 0.04814918, 3.095956, 1, 0, 0.3254902, 1,
1.576942, -0.6693555, 1.286612, 1, 0, 0.3176471, 1,
1.58119, 1.713133, -1.846236, 1, 0, 0.3137255, 1,
1.59086, 1.144765, 0.3657977, 1, 0, 0.3058824, 1,
1.590875, -1.117185, 2.997696, 1, 0, 0.2980392, 1,
1.599344, 0.3611694, 2.56345, 1, 0, 0.2941177, 1,
1.605751, -0.1325712, 1.959981, 1, 0, 0.2862745, 1,
1.621459, 0.5819995, 1.454815, 1, 0, 0.282353, 1,
1.654246, 0.3221994, 0.5274951, 1, 0, 0.2745098, 1,
1.665782, -0.03010815, 4.011977, 1, 0, 0.2705882, 1,
1.673258, 0.2339744, 0.3219055, 1, 0, 0.2627451, 1,
1.680761, 1.423425, 1.58107, 1, 0, 0.2588235, 1,
1.696885, -0.7736754, 1.669576, 1, 0, 0.2509804, 1,
1.707201, 2.24526, 0.1094159, 1, 0, 0.2470588, 1,
1.713627, -0.1851408, 1.783481, 1, 0, 0.2392157, 1,
1.72172, -0.5220412, 3.190329, 1, 0, 0.2352941, 1,
1.733302, 0.1293496, -0.1515099, 1, 0, 0.227451, 1,
1.757031, 0.2320876, 0.6401094, 1, 0, 0.2235294, 1,
1.76686, 0.429893, 1.848395, 1, 0, 0.2156863, 1,
1.772469, -0.896212, 0.8296666, 1, 0, 0.2117647, 1,
1.782022, 1.017129, 1.529603, 1, 0, 0.2039216, 1,
1.797389, -0.968313, 0.1403887, 1, 0, 0.1960784, 1,
1.79799, 1.87655, 0.5245234, 1, 0, 0.1921569, 1,
1.837082, -0.7657372, -0.8209299, 1, 0, 0.1843137, 1,
1.840974, 0.9663298, 0.4436183, 1, 0, 0.1803922, 1,
1.876871, -0.7636783, 2.102793, 1, 0, 0.172549, 1,
1.896815, 0.010768, 0.4083868, 1, 0, 0.1686275, 1,
1.901546, -0.1467977, 1.827406, 1, 0, 0.1607843, 1,
1.916274, -0.8225577, 1.653553, 1, 0, 0.1568628, 1,
1.933674, -1.010261, 1.829962, 1, 0, 0.1490196, 1,
1.940335, -0.1130943, 0.69697, 1, 0, 0.145098, 1,
1.942986, -1.037102, 2.888731, 1, 0, 0.1372549, 1,
2.001151, 0.2030431, 0.1317716, 1, 0, 0.1333333, 1,
2.004503, -0.8283741, 1.398514, 1, 0, 0.1254902, 1,
2.01309, -0.3513128, 3.355445, 1, 0, 0.1215686, 1,
2.049193, 1.199692, 1.940251, 1, 0, 0.1137255, 1,
2.052957, -0.5773219, 1.922762, 1, 0, 0.1098039, 1,
2.065253, 0.194393, 3.174315, 1, 0, 0.1019608, 1,
2.068658, -0.8070782, 1.688941, 1, 0, 0.09411765, 1,
2.079791, 0.6855748, 0.6909236, 1, 0, 0.09019608, 1,
2.161235, 0.6007836, 2.107203, 1, 0, 0.08235294, 1,
2.183277, -0.2555972, 0.3848565, 1, 0, 0.07843138, 1,
2.188932, 0.2927373, 2.402866, 1, 0, 0.07058824, 1,
2.219838, -0.02760125, 2.755328, 1, 0, 0.06666667, 1,
2.232808, 1.365726, 2.28929, 1, 0, 0.05882353, 1,
2.353679, -0.5620028, 0.6205491, 1, 0, 0.05490196, 1,
2.3853, 1.205912, -0.2523383, 1, 0, 0.04705882, 1,
2.437648, -0.268542, 3.438375, 1, 0, 0.04313726, 1,
2.775495, -3.372202, 2.325291, 1, 0, 0.03529412, 1,
2.873961, -1.362795, 2.258026, 1, 0, 0.03137255, 1,
2.927728, -0.2901613, 1.040134, 1, 0, 0.02352941, 1,
2.934646, 2.297397, 0.3030249, 1, 0, 0.01960784, 1,
2.96613, 1.576297, 0.181636, 1, 0, 0.01176471, 1,
3.171185, -1.478997, 3.082333, 1, 0, 0.007843138, 1
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
0.05732238, -4.417102, -7.00206, 0, -0.5, 0.5, 0.5,
0.05732238, -4.417102, -7.00206, 1, -0.5, 0.5, 0.5,
0.05732238, -4.417102, -7.00206, 1, 1.5, 0.5, 0.5,
0.05732238, -4.417102, -7.00206, 0, 1.5, 0.5, 0.5
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
-4.11214, -0.2899024, -7.00206, 0, -0.5, 0.5, 0.5,
-4.11214, -0.2899024, -7.00206, 1, -0.5, 0.5, 0.5,
-4.11214, -0.2899024, -7.00206, 1, 1.5, 0.5, 0.5,
-4.11214, -0.2899024, -7.00206, 0, 1.5, 0.5, 0.5
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
-4.11214, -4.417102, -0.2227316, 0, -0.5, 0.5, 0.5,
-4.11214, -4.417102, -0.2227316, 1, -0.5, 0.5, 0.5,
-4.11214, -4.417102, -0.2227316, 1, 1.5, 0.5, 0.5,
-4.11214, -4.417102, -0.2227316, 0, 1.5, 0.5, 0.5
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
-3, -3.464671, -5.4376,
3, -3.464671, -5.4376,
-3, -3.464671, -5.4376,
-3, -3.62341, -5.698343,
-2, -3.464671, -5.4376,
-2, -3.62341, -5.698343,
-1, -3.464671, -5.4376,
-1, -3.62341, -5.698343,
0, -3.464671, -5.4376,
0, -3.62341, -5.698343,
1, -3.464671, -5.4376,
1, -3.62341, -5.698343,
2, -3.464671, -5.4376,
2, -3.62341, -5.698343,
3, -3.464671, -5.4376,
3, -3.62341, -5.698343
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
-3, -3.940886, -6.21983, 0, -0.5, 0.5, 0.5,
-3, -3.940886, -6.21983, 1, -0.5, 0.5, 0.5,
-3, -3.940886, -6.21983, 1, 1.5, 0.5, 0.5,
-3, -3.940886, -6.21983, 0, 1.5, 0.5, 0.5,
-2, -3.940886, -6.21983, 0, -0.5, 0.5, 0.5,
-2, -3.940886, -6.21983, 1, -0.5, 0.5, 0.5,
-2, -3.940886, -6.21983, 1, 1.5, 0.5, 0.5,
-2, -3.940886, -6.21983, 0, 1.5, 0.5, 0.5,
-1, -3.940886, -6.21983, 0, -0.5, 0.5, 0.5,
-1, -3.940886, -6.21983, 1, -0.5, 0.5, 0.5,
-1, -3.940886, -6.21983, 1, 1.5, 0.5, 0.5,
-1, -3.940886, -6.21983, 0, 1.5, 0.5, 0.5,
0, -3.940886, -6.21983, 0, -0.5, 0.5, 0.5,
0, -3.940886, -6.21983, 1, -0.5, 0.5, 0.5,
0, -3.940886, -6.21983, 1, 1.5, 0.5, 0.5,
0, -3.940886, -6.21983, 0, 1.5, 0.5, 0.5,
1, -3.940886, -6.21983, 0, -0.5, 0.5, 0.5,
1, -3.940886, -6.21983, 1, -0.5, 0.5, 0.5,
1, -3.940886, -6.21983, 1, 1.5, 0.5, 0.5,
1, -3.940886, -6.21983, 0, 1.5, 0.5, 0.5,
2, -3.940886, -6.21983, 0, -0.5, 0.5, 0.5,
2, -3.940886, -6.21983, 1, -0.5, 0.5, 0.5,
2, -3.940886, -6.21983, 1, 1.5, 0.5, 0.5,
2, -3.940886, -6.21983, 0, 1.5, 0.5, 0.5,
3, -3.940886, -6.21983, 0, -0.5, 0.5, 0.5,
3, -3.940886, -6.21983, 1, -0.5, 0.5, 0.5,
3, -3.940886, -6.21983, 1, 1.5, 0.5, 0.5,
3, -3.940886, -6.21983, 0, 1.5, 0.5, 0.5
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
-3.149957, -3, -5.4376,
-3.149957, 2, -5.4376,
-3.149957, -3, -5.4376,
-3.310321, -3, -5.698343,
-3.149957, -2, -5.4376,
-3.310321, -2, -5.698343,
-3.149957, -1, -5.4376,
-3.310321, -1, -5.698343,
-3.149957, 0, -5.4376,
-3.310321, 0, -5.698343,
-3.149957, 1, -5.4376,
-3.310321, 1, -5.698343,
-3.149957, 2, -5.4376,
-3.310321, 2, -5.698343
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
-3.631048, -3, -6.21983, 0, -0.5, 0.5, 0.5,
-3.631048, -3, -6.21983, 1, -0.5, 0.5, 0.5,
-3.631048, -3, -6.21983, 1, 1.5, 0.5, 0.5,
-3.631048, -3, -6.21983, 0, 1.5, 0.5, 0.5,
-3.631048, -2, -6.21983, 0, -0.5, 0.5, 0.5,
-3.631048, -2, -6.21983, 1, -0.5, 0.5, 0.5,
-3.631048, -2, -6.21983, 1, 1.5, 0.5, 0.5,
-3.631048, -2, -6.21983, 0, 1.5, 0.5, 0.5,
-3.631048, -1, -6.21983, 0, -0.5, 0.5, 0.5,
-3.631048, -1, -6.21983, 1, -0.5, 0.5, 0.5,
-3.631048, -1, -6.21983, 1, 1.5, 0.5, 0.5,
-3.631048, -1, -6.21983, 0, 1.5, 0.5, 0.5,
-3.631048, 0, -6.21983, 0, -0.5, 0.5, 0.5,
-3.631048, 0, -6.21983, 1, -0.5, 0.5, 0.5,
-3.631048, 0, -6.21983, 1, 1.5, 0.5, 0.5,
-3.631048, 0, -6.21983, 0, 1.5, 0.5, 0.5,
-3.631048, 1, -6.21983, 0, -0.5, 0.5, 0.5,
-3.631048, 1, -6.21983, 1, -0.5, 0.5, 0.5,
-3.631048, 1, -6.21983, 1, 1.5, 0.5, 0.5,
-3.631048, 1, -6.21983, 0, 1.5, 0.5, 0.5,
-3.631048, 2, -6.21983, 0, -0.5, 0.5, 0.5,
-3.631048, 2, -6.21983, 1, -0.5, 0.5, 0.5,
-3.631048, 2, -6.21983, 1, 1.5, 0.5, 0.5,
-3.631048, 2, -6.21983, 0, 1.5, 0.5, 0.5
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
-3.149957, -3.464671, -4,
-3.149957, -3.464671, 4,
-3.149957, -3.464671, -4,
-3.310321, -3.62341, -4,
-3.149957, -3.464671, -2,
-3.310321, -3.62341, -2,
-3.149957, -3.464671, 0,
-3.310321, -3.62341, 0,
-3.149957, -3.464671, 2,
-3.310321, -3.62341, 2,
-3.149957, -3.464671, 4,
-3.310321, -3.62341, 4
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
-3.631048, -3.940886, -4, 0, -0.5, 0.5, 0.5,
-3.631048, -3.940886, -4, 1, -0.5, 0.5, 0.5,
-3.631048, -3.940886, -4, 1, 1.5, 0.5, 0.5,
-3.631048, -3.940886, -4, 0, 1.5, 0.5, 0.5,
-3.631048, -3.940886, -2, 0, -0.5, 0.5, 0.5,
-3.631048, -3.940886, -2, 1, -0.5, 0.5, 0.5,
-3.631048, -3.940886, -2, 1, 1.5, 0.5, 0.5,
-3.631048, -3.940886, -2, 0, 1.5, 0.5, 0.5,
-3.631048, -3.940886, 0, 0, -0.5, 0.5, 0.5,
-3.631048, -3.940886, 0, 1, -0.5, 0.5, 0.5,
-3.631048, -3.940886, 0, 1, 1.5, 0.5, 0.5,
-3.631048, -3.940886, 0, 0, 1.5, 0.5, 0.5,
-3.631048, -3.940886, 2, 0, -0.5, 0.5, 0.5,
-3.631048, -3.940886, 2, 1, -0.5, 0.5, 0.5,
-3.631048, -3.940886, 2, 1, 1.5, 0.5, 0.5,
-3.631048, -3.940886, 2, 0, 1.5, 0.5, 0.5,
-3.631048, -3.940886, 4, 0, -0.5, 0.5, 0.5,
-3.631048, -3.940886, 4, 1, -0.5, 0.5, 0.5,
-3.631048, -3.940886, 4, 1, 1.5, 0.5, 0.5,
-3.631048, -3.940886, 4, 0, 1.5, 0.5, 0.5
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
-3.149957, -3.464671, -5.4376,
-3.149957, 2.884866, -5.4376,
-3.149957, -3.464671, 4.992136,
-3.149957, 2.884866, 4.992136,
-3.149957, -3.464671, -5.4376,
-3.149957, -3.464671, 4.992136,
-3.149957, 2.884866, -5.4376,
-3.149957, 2.884866, 4.992136,
-3.149957, -3.464671, -5.4376,
3.264601, -3.464671, -5.4376,
-3.149957, -3.464671, 4.992136,
3.264601, -3.464671, 4.992136,
-3.149957, 2.884866, -5.4376,
3.264601, 2.884866, -5.4376,
-3.149957, 2.884866, 4.992136,
3.264601, 2.884866, 4.992136,
3.264601, -3.464671, -5.4376,
3.264601, 2.884866, -5.4376,
3.264601, -3.464671, 4.992136,
3.264601, 2.884866, 4.992136,
3.264601, -3.464671, -5.4376,
3.264601, -3.464671, 4.992136,
3.264601, 2.884866, -5.4376,
3.264601, 2.884866, 4.992136
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
var radius = 7.365112;
var distance = 32.76821;
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
mvMatrix.translate( -0.05732238, 0.2899024, 0.2227316 );
mvMatrix.scale( 1.241442, 1.254155, 0.7635191 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.76821);
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
flusilazole<-read.table("flusilazole.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-flusilazole$V2
```

```
## Error in eval(expr, envir, enclos): object 'flusilazole' not found
```

```r
y<-flusilazole$V3
```

```
## Error in eval(expr, envir, enclos): object 'flusilazole' not found
```

```r
z<-flusilazole$V4
```

```
## Error in eval(expr, envir, enclos): object 'flusilazole' not found
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
-3.056541, -1.76281, -2.474586, 0, 0, 1, 1, 1,
-3.054013, -0.3205923, -1.973964, 1, 0, 0, 1, 1,
-2.927444, 2.219128, -0.7100257, 1, 0, 0, 1, 1,
-2.779416, -0.1509928, -2.063864, 1, 0, 0, 1, 1,
-2.774374, -0.5666065, -1.421893, 1, 0, 0, 1, 1,
-2.757177, -0.03672573, -2.019702, 1, 0, 0, 1, 1,
-2.646334, 0.07432315, -3.112555, 0, 0, 0, 1, 1,
-2.573196, -0.4290504, -0.6038368, 0, 0, 0, 1, 1,
-2.505228, -1.196982, -0.9039972, 0, 0, 0, 1, 1,
-2.416581, -0.5738108, -3.58539, 0, 0, 0, 1, 1,
-2.397115, -0.5037943, -4.340471, 0, 0, 0, 1, 1,
-2.351855, -0.3019404, -2.02319, 0, 0, 0, 1, 1,
-2.289115, 0.3835286, -0.1737711, 0, 0, 0, 1, 1,
-2.272267, 0.3160923, -0.3350592, 1, 1, 1, 1, 1,
-2.25074, -0.7198368, -2.821464, 1, 1, 1, 1, 1,
-2.181691, 1.032839, -0.382546, 1, 1, 1, 1, 1,
-2.126922, -2.526668, -3.185438, 1, 1, 1, 1, 1,
-2.11126, -1.031335, -2.608499, 1, 1, 1, 1, 1,
-2.101623, 1.411531, -0.06102433, 1, 1, 1, 1, 1,
-2.097743, 0.4656534, 0.5270556, 1, 1, 1, 1, 1,
-2.090533, -0.9302607, -1.755248, 1, 1, 1, 1, 1,
-2.089412, -0.9154159, 1.480303, 1, 1, 1, 1, 1,
-2.088186, 0.4125422, -0.6212806, 1, 1, 1, 1, 1,
-2.083059, 0.1593051, -1.627457, 1, 1, 1, 1, 1,
-1.955963, 0.3351349, -0.7227846, 1, 1, 1, 1, 1,
-1.9552, -1.902083, -2.224965, 1, 1, 1, 1, 1,
-1.929282, 1.558821, -0.1360451, 1, 1, 1, 1, 1,
-1.923605, -0.5705411, -1.488729, 1, 1, 1, 1, 1,
-1.913365, 0.1384258, -2.731778, 0, 0, 1, 1, 1,
-1.904905, 0.9969537, -2.217336, 1, 0, 0, 1, 1,
-1.893765, 0.3881945, -1.402271, 1, 0, 0, 1, 1,
-1.888353, 2.176733, 0.5008221, 1, 0, 0, 1, 1,
-1.879381, 0.31456, -2.805885, 1, 0, 0, 1, 1,
-1.875389, 1.880242, 0.1226534, 1, 0, 0, 1, 1,
-1.870262, 2.185013, -0.5289328, 0, 0, 0, 1, 1,
-1.866115, 1.087451, -1.187482, 0, 0, 0, 1, 1,
-1.856297, -0.4806123, -1.345468, 0, 0, 0, 1, 1,
-1.849483, 1.377223, -1.41199, 0, 0, 0, 1, 1,
-1.828689, 0.5237561, -1.69137, 0, 0, 0, 1, 1,
-1.826304, -0.2625805, -1.876386, 0, 0, 0, 1, 1,
-1.790563, 0.5411531, -1.272292, 0, 0, 0, 1, 1,
-1.788745, -0.6458584, -1.617652, 1, 1, 1, 1, 1,
-1.785887, 1.392742, 0.2901665, 1, 1, 1, 1, 1,
-1.744084, 0.3972831, -0.5481734, 1, 1, 1, 1, 1,
-1.727669, 0.1892414, -0.7961386, 1, 1, 1, 1, 1,
-1.717019, 1.05905, -1.057663, 1, 1, 1, 1, 1,
-1.713001, -1.106868, -4.667915, 1, 1, 1, 1, 1,
-1.703171, -0.3498216, -1.721343, 1, 1, 1, 1, 1,
-1.681648, -0.6574896, -1.933728, 1, 1, 1, 1, 1,
-1.679703, 1.736736, -2.137225, 1, 1, 1, 1, 1,
-1.679144, 2.217255, -0.745649, 1, 1, 1, 1, 1,
-1.648406, 0.615006, -2.242208, 1, 1, 1, 1, 1,
-1.640967, -1.597708, -0.9911116, 1, 1, 1, 1, 1,
-1.63881, -0.1168756, -2.795789, 1, 1, 1, 1, 1,
-1.618407, 1.123804, -1.400959, 1, 1, 1, 1, 1,
-1.595879, -1.486031, -3.247705, 1, 1, 1, 1, 1,
-1.571481, 0.1612925, -1.540685, 0, 0, 1, 1, 1,
-1.541967, 0.7954988, 0.6561229, 1, 0, 0, 1, 1,
-1.540186, -0.4287135, -3.856708, 1, 0, 0, 1, 1,
-1.508219, -1.609627, -1.804013, 1, 0, 0, 1, 1,
-1.507215, 1.948653, -1.349694, 1, 0, 0, 1, 1,
-1.504377, 0.05106923, -0.43173, 1, 0, 0, 1, 1,
-1.502843, -0.6133506, -2.749658, 0, 0, 0, 1, 1,
-1.500706, -1.669218, -4.543035, 0, 0, 0, 1, 1,
-1.495066, -0.1452049, -1.80848, 0, 0, 0, 1, 1,
-1.489523, -0.03857071, -0.185776, 0, 0, 0, 1, 1,
-1.487315, 0.1224068, -1.158684, 0, 0, 0, 1, 1,
-1.482936, -0.1391399, -1.065659, 0, 0, 0, 1, 1,
-1.471508, 0.4501353, -1.554895, 0, 0, 0, 1, 1,
-1.469143, -0.0003309486, -2.802607, 1, 1, 1, 1, 1,
-1.454741, -0.357513, -3.507166, 1, 1, 1, 1, 1,
-1.454033, 0.2737631, -1.769151, 1, 1, 1, 1, 1,
-1.43701, -1.067809, -0.9255567, 1, 1, 1, 1, 1,
-1.421193, 0.05166161, -0.6598506, 1, 1, 1, 1, 1,
-1.418301, -2.417761, -2.458554, 1, 1, 1, 1, 1,
-1.416091, -0.4738219, -1.766231, 1, 1, 1, 1, 1,
-1.398826, -0.9920056, -2.135073, 1, 1, 1, 1, 1,
-1.397188, -1.053609, -0.516676, 1, 1, 1, 1, 1,
-1.396969, -1.331264, -1.423883, 1, 1, 1, 1, 1,
-1.394897, -0.7025797, -1.710978, 1, 1, 1, 1, 1,
-1.393248, 1.160231, -0.2820066, 1, 1, 1, 1, 1,
-1.3594, 0.5857528, -1.427029, 1, 1, 1, 1, 1,
-1.347147, -0.5718763, -2.09848, 1, 1, 1, 1, 1,
-1.346855, 0.1223173, -0.7025598, 1, 1, 1, 1, 1,
-1.34559, -0.1234793, -2.112648, 0, 0, 1, 1, 1,
-1.344637, 0.3268299, -1.310667, 1, 0, 0, 1, 1,
-1.343057, -1.007797, -3.348349, 1, 0, 0, 1, 1,
-1.330925, 0.5688444, 0.6785983, 1, 0, 0, 1, 1,
-1.328493, -0.5343848, -0.5683525, 1, 0, 0, 1, 1,
-1.326533, 0.3397756, -0.4308272, 1, 0, 0, 1, 1,
-1.305262, 0.8555944, -0.605671, 0, 0, 0, 1, 1,
-1.281885, -0.6387488, -3.431774, 0, 0, 0, 1, 1,
-1.276399, -1.369615, -3.327123, 0, 0, 0, 1, 1,
-1.270677, -0.2457075, -1.599181, 0, 0, 0, 1, 1,
-1.269577, -0.6489936, -1.712271, 0, 0, 0, 1, 1,
-1.256658, 0.9297138, -1.129611, 0, 0, 0, 1, 1,
-1.235962, -0.5242117, -0.8169574, 0, 0, 0, 1, 1,
-1.234065, 0.8751231, -2.020662, 1, 1, 1, 1, 1,
-1.233965, -0.004822487, -2.25754, 1, 1, 1, 1, 1,
-1.228173, -1.145293, -2.435249, 1, 1, 1, 1, 1,
-1.227017, 0.572886, 0.1490113, 1, 1, 1, 1, 1,
-1.223832, -0.1820377, -1.581012, 1, 1, 1, 1, 1,
-1.220938, 1.837588, -0.04676457, 1, 1, 1, 1, 1,
-1.209879, 1.119365, -1.101507, 1, 1, 1, 1, 1,
-1.207685, 0.07401403, -1.358689, 1, 1, 1, 1, 1,
-1.206336, 1.196041, 0.5305676, 1, 1, 1, 1, 1,
-1.199924, 0.448092, -0.9662771, 1, 1, 1, 1, 1,
-1.186046, -1.64705, -2.931751, 1, 1, 1, 1, 1,
-1.179354, -0.8168035, -3.93665, 1, 1, 1, 1, 1,
-1.169028, -1.851064, -3.697093, 1, 1, 1, 1, 1,
-1.154317, -1.166275, -1.702749, 1, 1, 1, 1, 1,
-1.153862, -1.58035, -5.037687, 1, 1, 1, 1, 1,
-1.152455, 0.4928817, -0.378889, 0, 0, 1, 1, 1,
-1.147943, 0.4437411, -0.6723748, 1, 0, 0, 1, 1,
-1.139485, -0.6629579, -0.03985818, 1, 0, 0, 1, 1,
-1.136087, 0.6951791, -0.9357429, 1, 0, 0, 1, 1,
-1.129706, 0.6188479, -0.6723466, 1, 0, 0, 1, 1,
-1.129591, -1.196626, -5.28571, 1, 0, 0, 1, 1,
-1.12478, 0.7936371, -1.14826, 0, 0, 0, 1, 1,
-1.12159, 0.4500285, -1.395735, 0, 0, 0, 1, 1,
-1.118948, 0.07547396, -2.855774, 0, 0, 0, 1, 1,
-1.110411, -0.1828598, -1.062653, 0, 0, 0, 1, 1,
-1.110093, -0.9288474, -1.415043, 0, 0, 0, 1, 1,
-1.107819, -0.2424117, -3.499316, 0, 0, 0, 1, 1,
-1.103493, 2.179316, -0.6189147, 0, 0, 0, 1, 1,
-1.103164, -0.7576836, -2.762783, 1, 1, 1, 1, 1,
-1.103102, 1.18509, -1.422102, 1, 1, 1, 1, 1,
-1.083676, -0.9421434, -1.88367, 1, 1, 1, 1, 1,
-1.073598, 0.7607425, -1.437225, 1, 1, 1, 1, 1,
-1.067498, 0.1230086, -1.718476, 1, 1, 1, 1, 1,
-1.058326, 0.1160838, -2.381715, 1, 1, 1, 1, 1,
-1.051482, 0.4992888, -3.026283, 1, 1, 1, 1, 1,
-1.040053, 1.800202, -0.3855249, 1, 1, 1, 1, 1,
-1.027923, -1.947109, -3.229219, 1, 1, 1, 1, 1,
-1.021849, -0.8139238, -1.871336, 1, 1, 1, 1, 1,
-1.01951, -0.09512007, -1.131397, 1, 1, 1, 1, 1,
-1.012329, 0.04011201, -1.108067, 1, 1, 1, 1, 1,
-1.002738, 0.5867581, -0.4403567, 1, 1, 1, 1, 1,
-0.9970213, 0.4767497, -1.712057, 1, 1, 1, 1, 1,
-0.9921255, 0.01047626, -2.406877, 1, 1, 1, 1, 1,
-0.9894719, 0.3865366, -1.158916, 0, 0, 1, 1, 1,
-0.9865813, 0.8030771, 0.1858869, 1, 0, 0, 1, 1,
-0.9843897, -0.5134659, -1.522928, 1, 0, 0, 1, 1,
-0.9828922, -1.144501, -2.566739, 1, 0, 0, 1, 1,
-0.9794655, 1.068154, -2.096536, 1, 0, 0, 1, 1,
-0.9782192, 0.220236, -1.254485, 1, 0, 0, 1, 1,
-0.9689925, -1.050468, -2.258348, 0, 0, 0, 1, 1,
-0.9688191, 0.2751749, -1.35578, 0, 0, 0, 1, 1,
-0.961432, -0.7330196, -3.782007, 0, 0, 0, 1, 1,
-0.9611059, 0.24586, -0.8695198, 0, 0, 0, 1, 1,
-0.9594615, -1.299374, -3.539503, 0, 0, 0, 1, 1,
-0.9585229, 0.7593371, -1.630534, 0, 0, 0, 1, 1,
-0.9576774, 2.143765, -1.832176, 0, 0, 0, 1, 1,
-0.9551929, -0.8863059, -2.134522, 1, 1, 1, 1, 1,
-0.9539436, 0.6867048, 1.196815, 1, 1, 1, 1, 1,
-0.9529682, 0.9939696, -0.4547215, 1, 1, 1, 1, 1,
-0.9515607, -1.643921, -2.494674, 1, 1, 1, 1, 1,
-0.9495388, -0.2835047, -2.402742, 1, 1, 1, 1, 1,
-0.9460407, -1.007967, -2.033348, 1, 1, 1, 1, 1,
-0.940065, 0.782319, 0.03769242, 1, 1, 1, 1, 1,
-0.9346321, -2.142533, -1.229074, 1, 1, 1, 1, 1,
-0.9339191, 1.484275, -0.6179507, 1, 1, 1, 1, 1,
-0.9325665, 0.02735563, -0.1431726, 1, 1, 1, 1, 1,
-0.9249831, -1.111204, -2.391072, 1, 1, 1, 1, 1,
-0.9139929, 0.8692674, 0.6458305, 1, 1, 1, 1, 1,
-0.9135831, 0.3443706, -0.5611364, 1, 1, 1, 1, 1,
-0.9132432, -1.351213, -0.7712507, 1, 1, 1, 1, 1,
-0.9090729, 0.08099632, -1.032658, 1, 1, 1, 1, 1,
-0.9072266, -1.95803, -2.946956, 0, 0, 1, 1, 1,
-0.9066221, -1.047695, -3.298904, 1, 0, 0, 1, 1,
-0.9053434, 0.2151803, -2.240511, 1, 0, 0, 1, 1,
-0.9036018, -0.3460186, -2.544272, 1, 0, 0, 1, 1,
-0.9032271, -0.2770901, -2.12496, 1, 0, 0, 1, 1,
-0.9004211, -0.03640385, -3.07907, 1, 0, 0, 1, 1,
-0.8970269, 1.448886, -0.9183339, 0, 0, 0, 1, 1,
-0.8908907, 0.2511522, -2.296578, 0, 0, 0, 1, 1,
-0.8904684, -0.3393419, -3.206039, 0, 0, 0, 1, 1,
-0.8749788, 0.9657246, -0.8519056, 0, 0, 0, 1, 1,
-0.8732246, -0.9529884, -1.75421, 0, 0, 0, 1, 1,
-0.8710382, 0.1562542, 0.01258826, 0, 0, 0, 1, 1,
-0.867251, 1.86517, 0.8104452, 0, 0, 0, 1, 1,
-0.8641888, 0.47038, -1.034389, 1, 1, 1, 1, 1,
-0.8636746, -0.344346, -2.464854, 1, 1, 1, 1, 1,
-0.8565733, 0.3496952, -0.3266166, 1, 1, 1, 1, 1,
-0.8555166, 1.414122, 0.009544802, 1, 1, 1, 1, 1,
-0.8554084, 0.009142176, 0.3760796, 1, 1, 1, 1, 1,
-0.8521211, 1.749462, -0.8767468, 1, 1, 1, 1, 1,
-0.8377689, -1.050911, -2.040433, 1, 1, 1, 1, 1,
-0.8368787, -0.1068717, 0.3504599, 1, 1, 1, 1, 1,
-0.8298792, 0.2948186, 0.6256002, 1, 1, 1, 1, 1,
-0.828306, -0.04236279, -1.799019, 1, 1, 1, 1, 1,
-0.8213921, 1.010892, -2.560347, 1, 1, 1, 1, 1,
-0.8155212, -0.4627849, -1.32907, 1, 1, 1, 1, 1,
-0.8145028, -0.8744679, -1.644945, 1, 1, 1, 1, 1,
-0.8129979, 0.2676286, -2.109562, 1, 1, 1, 1, 1,
-0.8117967, -0.9947424, -2.85744, 1, 1, 1, 1, 1,
-0.8104913, -2.014892, -1.337901, 0, 0, 1, 1, 1,
-0.8039877, -1.043275, -3.202229, 1, 0, 0, 1, 1,
-0.8029645, -0.03479621, -2.293782, 1, 0, 0, 1, 1,
-0.8018157, -1.269546, -1.880838, 1, 0, 0, 1, 1,
-0.7951866, 1.202977, -1.578199, 1, 0, 0, 1, 1,
-0.788827, -1.297412, -4.02779, 1, 0, 0, 1, 1,
-0.7828249, -0.8736347, -1.632889, 0, 0, 0, 1, 1,
-0.7788328, -3.169813, -3.354105, 0, 0, 0, 1, 1,
-0.7677875, -0.1809531, -2.178615, 0, 0, 0, 1, 1,
-0.7651259, -0.2504006, -0.05571182, 0, 0, 0, 1, 1,
-0.761001, 0.7799442, 1.120191, 0, 0, 0, 1, 1,
-0.7544633, -0.4388371, -2.340069, 0, 0, 0, 1, 1,
-0.7506562, -2.011976, -4.297787, 0, 0, 0, 1, 1,
-0.747022, -1.282372, -2.767514, 1, 1, 1, 1, 1,
-0.745247, 0.496987, -0.6679871, 1, 1, 1, 1, 1,
-0.737182, 2.023734, -0.8174744, 1, 1, 1, 1, 1,
-0.7371512, -1.408604, -3.523769, 1, 1, 1, 1, 1,
-0.72899, -0.3577563, -2.77403, 1, 1, 1, 1, 1,
-0.7289479, -0.5631286, -3.166827, 1, 1, 1, 1, 1,
-0.7223928, -0.8158872, -1.567304, 1, 1, 1, 1, 1,
-0.7216762, 1.50226, 0.8551317, 1, 1, 1, 1, 1,
-0.7212961, 1.335327, -0.3580939, 1, 1, 1, 1, 1,
-0.7149319, -1.500963, -2.665957, 1, 1, 1, 1, 1,
-0.7112877, 1.253836, -1.142079, 1, 1, 1, 1, 1,
-0.7109779, 0.8616185, 1.133095, 1, 1, 1, 1, 1,
-0.709777, -0.7911138, -1.868086, 1, 1, 1, 1, 1,
-0.7041017, -0.02507532, -1.665726, 1, 1, 1, 1, 1,
-0.7038326, -0.6827504, -2.098939, 1, 1, 1, 1, 1,
-0.7028682, -0.3203172, -2.186144, 0, 0, 1, 1, 1,
-0.698132, 0.6706309, -2.218701, 1, 0, 0, 1, 1,
-0.6957269, -0.6002541, -2.236133, 1, 0, 0, 1, 1,
-0.6948677, 1.892044, 1.386469, 1, 0, 0, 1, 1,
-0.6898816, 0.5267984, -0.8740586, 1, 0, 0, 1, 1,
-0.6827983, -0.5295116, -3.678796, 1, 0, 0, 1, 1,
-0.6806374, 1.499541, -1.467991, 0, 0, 0, 1, 1,
-0.6740955, 0.65311, 0.002526464, 0, 0, 0, 1, 1,
-0.6728948, 0.629791, -2.638165, 0, 0, 0, 1, 1,
-0.6717391, -1.348797, -3.911898, 0, 0, 0, 1, 1,
-0.6713234, -0.862267, -1.554941, 0, 0, 0, 1, 1,
-0.6665919, -0.5442754, -1.990457, 0, 0, 0, 1, 1,
-0.6661385, -1.489663, -3.706015, 0, 0, 0, 1, 1,
-0.6552705, -0.07369309, -0.2934428, 1, 1, 1, 1, 1,
-0.6544825, -0.3688676, -0.5739545, 1, 1, 1, 1, 1,
-0.6494437, 1.013294, 0.04540953, 1, 1, 1, 1, 1,
-0.6448671, -0.0191539, -1.783438, 1, 1, 1, 1, 1,
-0.6429688, -1.227762, -2.634984, 1, 1, 1, 1, 1,
-0.6425759, -0.4733333, -1.773732, 1, 1, 1, 1, 1,
-0.6328946, -0.6464229, -3.173917, 1, 1, 1, 1, 1,
-0.6279997, 1.632, 0.7757877, 1, 1, 1, 1, 1,
-0.6260777, 0.4831967, -0.840861, 1, 1, 1, 1, 1,
-0.6164891, -1.197877, -1.536699, 1, 1, 1, 1, 1,
-0.5979431, 0.003890011, 1.542975, 1, 1, 1, 1, 1,
-0.5935313, 2.649044, -1.368119, 1, 1, 1, 1, 1,
-0.5921699, 1.139095, 0.05039139, 1, 1, 1, 1, 1,
-0.589772, 0.8397927, 0.3122791, 1, 1, 1, 1, 1,
-0.5893685, -0.3515725, -1.035393, 1, 1, 1, 1, 1,
-0.5773783, -1.051787, -1.659451, 0, 0, 1, 1, 1,
-0.5767638, 0.6066188, -0.2915883, 1, 0, 0, 1, 1,
-0.5745223, 0.06917991, -1.241623, 1, 0, 0, 1, 1,
-0.5738993, -0.9135692, -2.89969, 1, 0, 0, 1, 1,
-0.573025, -0.5568632, -3.778813, 1, 0, 0, 1, 1,
-0.5722046, 1.776059, -0.571638, 1, 0, 0, 1, 1,
-0.5713003, 0.9767936, -0.01196839, 0, 0, 0, 1, 1,
-0.5703934, 0.1815646, -1.506083, 0, 0, 0, 1, 1,
-0.5701771, -0.9363693, -1.70282, 0, 0, 0, 1, 1,
-0.5675494, 2.095079, -0.9565928, 0, 0, 0, 1, 1,
-0.566418, 0.1187765, -1.882833, 0, 0, 0, 1, 1,
-0.5645776, 1.227222, -1.260575, 0, 0, 0, 1, 1,
-0.564113, 0.4060002, 1.555873, 0, 0, 0, 1, 1,
-0.5634521, 1.764182, -0.6184351, 1, 1, 1, 1, 1,
-0.5599765, -1.725183, -1.411916, 1, 1, 1, 1, 1,
-0.5554535, -0.1449954, -0.8362275, 1, 1, 1, 1, 1,
-0.5550778, -1.362243, -1.889892, 1, 1, 1, 1, 1,
-0.5542614, 0.1983394, -1.477075, 1, 1, 1, 1, 1,
-0.5437294, -0.8351218, -2.917154, 1, 1, 1, 1, 1,
-0.5406311, 0.7915094, 0.3239356, 1, 1, 1, 1, 1,
-0.5404772, -1.16579, -3.537323, 1, 1, 1, 1, 1,
-0.5389838, -1.914662, -2.888592, 1, 1, 1, 1, 1,
-0.5378801, 2.100594, 0.6115315, 1, 1, 1, 1, 1,
-0.5359223, -0.2530724, -1.862721, 1, 1, 1, 1, 1,
-0.5268491, -0.3834993, -2.819968, 1, 1, 1, 1, 1,
-0.5231867, 1.137249, 0.03137557, 1, 1, 1, 1, 1,
-0.5207291, -0.280798, -2.571155, 1, 1, 1, 1, 1,
-0.520335, -2.328484, -4.121621, 1, 1, 1, 1, 1,
-0.520184, -0.3007089, -1.998387, 0, 0, 1, 1, 1,
-0.511745, -0.6743096, -2.438007, 1, 0, 0, 1, 1,
-0.5097254, -1.288235, -3.185416, 1, 0, 0, 1, 1,
-0.5005623, -0.2791406, -1.945408, 1, 0, 0, 1, 1,
-0.4952996, 0.01379373, -2.778085, 1, 0, 0, 1, 1,
-0.4949126, 0.4481909, -0.4241686, 1, 0, 0, 1, 1,
-0.4895507, 0.6979066, 0.3452509, 0, 0, 0, 1, 1,
-0.4802653, -0.2540662, -0.08140138, 0, 0, 0, 1, 1,
-0.4793407, 1.317452, -0.08673461, 0, 0, 0, 1, 1,
-0.4756164, -0.144128, -1.623189, 0, 0, 0, 1, 1,
-0.4703107, -0.003474329, -2.779354, 0, 0, 0, 1, 1,
-0.4619015, 0.05939925, -1.632395, 0, 0, 0, 1, 1,
-0.4603748, -0.9949316, -3.41693, 0, 0, 0, 1, 1,
-0.4565885, 0.1064012, -2.467217, 1, 1, 1, 1, 1,
-0.4523107, -0.545182, -1.694911, 1, 1, 1, 1, 1,
-0.4499653, -0.7398082, -2.665894, 1, 1, 1, 1, 1,
-0.4487167, -0.6425371, -2.775939, 1, 1, 1, 1, 1,
-0.4478119, -0.1442349, -1.620707, 1, 1, 1, 1, 1,
-0.4455896, 0.7356082, -0.1937552, 1, 1, 1, 1, 1,
-0.4454325, -0.1035067, -1.486263, 1, 1, 1, 1, 1,
-0.4450112, 1.887993, 0.7747141, 1, 1, 1, 1, 1,
-0.4444125, 2.016066, -0.09673745, 1, 1, 1, 1, 1,
-0.4439576, -0.5538763, -2.106276, 1, 1, 1, 1, 1,
-0.4435124, 0.1026889, -2.241147, 1, 1, 1, 1, 1,
-0.4425468, 0.5501919, -1.491851, 1, 1, 1, 1, 1,
-0.4407935, -0.3625405, -1.889453, 1, 1, 1, 1, 1,
-0.4339667, -2.470916, -3.34176, 1, 1, 1, 1, 1,
-0.4312155, -0.4389339, -2.461828, 1, 1, 1, 1, 1,
-0.4231653, -0.2228544, -1.075004, 0, 0, 1, 1, 1,
-0.4217636, -0.5743972, -0.1978476, 1, 0, 0, 1, 1,
-0.4212753, -0.2152275, -1.98288, 1, 0, 0, 1, 1,
-0.4196568, -1.073263, -3.280684, 1, 0, 0, 1, 1,
-0.4174434, -0.1875353, -0.6189988, 1, 0, 0, 1, 1,
-0.4160187, 0.6142747, -1.973936, 1, 0, 0, 1, 1,
-0.4068311, 0.6315789, -1.266248, 0, 0, 0, 1, 1,
-0.4019874, -1.670503, -1.475532, 0, 0, 0, 1, 1,
-0.4016423, 1.248323, -0.2261184, 0, 0, 0, 1, 1,
-0.4015783, 0.5732205, -1.44471, 0, 0, 0, 1, 1,
-0.4001687, 1.421862, 0.9225358, 0, 0, 0, 1, 1,
-0.3961557, -0.5512449, -2.5093, 0, 0, 0, 1, 1,
-0.3955125, 0.01290725, -3.043923, 0, 0, 0, 1, 1,
-0.393953, 1.891819, -0.6092276, 1, 1, 1, 1, 1,
-0.3937082, 0.0553593, -0.3096366, 1, 1, 1, 1, 1,
-0.3907287, 0.7538959, -1.032393, 1, 1, 1, 1, 1,
-0.3895083, 0.04330296, -1.417473, 1, 1, 1, 1, 1,
-0.3857162, 1.260367, 0.4553603, 1, 1, 1, 1, 1,
-0.3853559, 0.8947916, 0.2919138, 1, 1, 1, 1, 1,
-0.3818501, 0.3303988, 0.52513, 1, 1, 1, 1, 1,
-0.3799423, -0.1390744, -2.854133, 1, 1, 1, 1, 1,
-0.3780133, 0.4409847, 1.541196, 1, 1, 1, 1, 1,
-0.3776997, 0.3927792, 0.6438513, 1, 1, 1, 1, 1,
-0.3766688, -1.246222, -3.608418, 1, 1, 1, 1, 1,
-0.3766033, -1.112552, -3.505412, 1, 1, 1, 1, 1,
-0.3707099, -0.7500876, -2.338861, 1, 1, 1, 1, 1,
-0.3706653, -0.2851655, -1.538643, 1, 1, 1, 1, 1,
-0.3682002, -0.7030381, -0.7781467, 1, 1, 1, 1, 1,
-0.363034, -0.8575982, -2.220627, 0, 0, 1, 1, 1,
-0.3627343, -0.3374479, -1.242906, 1, 0, 0, 1, 1,
-0.3610947, -0.07242939, -1.701586, 1, 0, 0, 1, 1,
-0.3599988, 0.4916469, -1.363805, 1, 0, 0, 1, 1,
-0.357268, 1.264303, -0.8243244, 1, 0, 0, 1, 1,
-0.3565748, -0.5976049, -2.595852, 1, 0, 0, 1, 1,
-0.3475728, -0.6337609, -3.347408, 0, 0, 0, 1, 1,
-0.3445525, -0.57167, -3.311791, 0, 0, 0, 1, 1,
-0.3399603, -0.3955426, -1.783953, 0, 0, 0, 1, 1,
-0.3376069, -0.3385383, -1.503071, 0, 0, 0, 1, 1,
-0.3368313, 0.9595031, -0.2679046, 0, 0, 0, 1, 1,
-0.3359701, 0.5919238, 0.2258705, 0, 0, 0, 1, 1,
-0.3329954, 0.9188662, 0.6424462, 0, 0, 0, 1, 1,
-0.3318346, 0.1971413, 1.130819, 1, 1, 1, 1, 1,
-0.3286208, -2.200618, -4.062983, 1, 1, 1, 1, 1,
-0.3245603, 1.168401, 0.07033683, 1, 1, 1, 1, 1,
-0.3208463, 0.4835238, 1.880135, 1, 1, 1, 1, 1,
-0.3148946, -2.712985, -3.365163, 1, 1, 1, 1, 1,
-0.3144582, 0.1292404, -3.045199, 1, 1, 1, 1, 1,
-0.3124664, 1.447917, -0.2684342, 1, 1, 1, 1, 1,
-0.3117955, -1.878999, -4.36431, 1, 1, 1, 1, 1,
-0.3103014, -1.890015, -2.288215, 1, 1, 1, 1, 1,
-0.3025916, -0.6718487, -3.675385, 1, 1, 1, 1, 1,
-0.3016734, 0.5136083, 0.8745503, 1, 1, 1, 1, 1,
-0.3009477, 1.127603, -2.496104, 1, 1, 1, 1, 1,
-0.2986907, -0.796212, -1.471543, 1, 1, 1, 1, 1,
-0.2970889, -1.517459, -2.72328, 1, 1, 1, 1, 1,
-0.2903088, 1.957887, -1.618232, 1, 1, 1, 1, 1,
-0.2888258, -0.8448995, -4.083956, 0, 0, 1, 1, 1,
-0.2834736, -0.8656776, -3.115952, 1, 0, 0, 1, 1,
-0.2819602, 0.1484269, -0.5479932, 1, 0, 0, 1, 1,
-0.2815212, -0.03359094, -2.097783, 1, 0, 0, 1, 1,
-0.2805593, 0.4453159, -1.956033, 1, 0, 0, 1, 1,
-0.2781995, -0.1468339, -0.9441988, 1, 0, 0, 1, 1,
-0.2769891, -0.00407576, -3.721374, 0, 0, 0, 1, 1,
-0.2768468, -0.1815797, -2.103248, 0, 0, 0, 1, 1,
-0.275734, 1.387387, -1.450109, 0, 0, 0, 1, 1,
-0.2757297, -0.1442663, -2.518588, 0, 0, 0, 1, 1,
-0.275323, 1.142041, -0.6750438, 0, 0, 0, 1, 1,
-0.2739308, -2.216872, -3.332738, 0, 0, 0, 1, 1,
-0.2670109, 0.1691712, 0.4225161, 0, 0, 0, 1, 1,
-0.265942, -0.7535936, -1.537505, 1, 1, 1, 1, 1,
-0.2644938, -1.111573, -1.485961, 1, 1, 1, 1, 1,
-0.2624851, 0.1631512, -2.300171, 1, 1, 1, 1, 1,
-0.2612613, 1.465636, -1.162665, 1, 1, 1, 1, 1,
-0.2598562, -0.1440113, -3.212261, 1, 1, 1, 1, 1,
-0.2583487, 0.4993504, -1.514145, 1, 1, 1, 1, 1,
-0.2558503, -2.587653, -2.01096, 1, 1, 1, 1, 1,
-0.2557607, -0.7530633, -3.831023, 1, 1, 1, 1, 1,
-0.2541283, 0.05807636, -1.70121, 1, 1, 1, 1, 1,
-0.2504639, -0.7187896, -3.649337, 1, 1, 1, 1, 1,
-0.2456847, -2.355785, -2.375374, 1, 1, 1, 1, 1,
-0.2439128, -0.4716569, -2.02987, 1, 1, 1, 1, 1,
-0.2413777, -0.3340116, -3.997967, 1, 1, 1, 1, 1,
-0.2410965, -1.1316, -2.305205, 1, 1, 1, 1, 1,
-0.2396422, 1.084671, -2.927182, 1, 1, 1, 1, 1,
-0.237977, -0.2656084, -2.187691, 0, 0, 1, 1, 1,
-0.2366459, 1.541742, -0.02374838, 1, 0, 0, 1, 1,
-0.2193054, -1.754852, -2.664461, 1, 0, 0, 1, 1,
-0.216964, 0.786054, 1.031559, 1, 0, 0, 1, 1,
-0.2162369, -0.02753096, -0.6851372, 1, 0, 0, 1, 1,
-0.2128173, -0.4844869, -3.18885, 1, 0, 0, 1, 1,
-0.2119846, 0.3275376, -0.04000529, 0, 0, 0, 1, 1,
-0.2111855, -0.556628, -3.867445, 0, 0, 0, 1, 1,
-0.2072083, -0.2859666, -1.09866, 0, 0, 0, 1, 1,
-0.2038375, -0.4174313, -2.022565, 0, 0, 0, 1, 1,
-0.202829, -0.6266273, -3.112441, 0, 0, 0, 1, 1,
-0.2023496, 0.4167182, -0.2420791, 0, 0, 0, 1, 1,
-0.2020921, 0.4858433, -0.7945058, 0, 0, 0, 1, 1,
-0.2020388, 0.5902003, 0.1097074, 1, 1, 1, 1, 1,
-0.2012946, 0.1504683, -1.634398, 1, 1, 1, 1, 1,
-0.2003724, 0.469293, -0.5348021, 1, 1, 1, 1, 1,
-0.1963645, -0.3155286, -3.682589, 1, 1, 1, 1, 1,
-0.1959848, -1.228682, -3.138312, 1, 1, 1, 1, 1,
-0.1958219, 1.68642, -0.6571352, 1, 1, 1, 1, 1,
-0.1903751, -0.6212013, -5.207145, 1, 1, 1, 1, 1,
-0.1872819, 0.09901361, -1.434438, 1, 1, 1, 1, 1,
-0.1797464, 0.947608, 0.3826628, 1, 1, 1, 1, 1,
-0.1794155, -0.9597992, -4.396497, 1, 1, 1, 1, 1,
-0.1786637, 0.1098644, -1.468552, 1, 1, 1, 1, 1,
-0.1783685, 1.706078, 0.3292195, 1, 1, 1, 1, 1,
-0.1767967, 0.1311245, -0.5677113, 1, 1, 1, 1, 1,
-0.1763833, -0.2156624, -2.273483, 1, 1, 1, 1, 1,
-0.173085, -1.268751, -2.388074, 1, 1, 1, 1, 1,
-0.1691737, 0.2740623, 0.5362905, 0, 0, 1, 1, 1,
-0.1677549, 1.661114, -2.284302, 1, 0, 0, 1, 1,
-0.16452, -1.160725, -2.930109, 1, 0, 0, 1, 1,
-0.1592605, 0.3127265, -2.567317, 1, 0, 0, 1, 1,
-0.1582719, -0.2479589, -3.054808, 1, 0, 0, 1, 1,
-0.1552965, 0.8900918, -1.340629, 1, 0, 0, 1, 1,
-0.1508883, -0.1783433, -0.8824746, 0, 0, 0, 1, 1,
-0.1485973, -0.7017698, -4.247941, 0, 0, 0, 1, 1,
-0.1439084, 1.338607, -0.09340613, 0, 0, 0, 1, 1,
-0.1409827, -0.0542657, -0.2830184, 0, 0, 0, 1, 1,
-0.1409494, 0.1735583, 0.1566337, 0, 0, 0, 1, 1,
-0.13638, 0.7388494, 1.521738, 0, 0, 0, 1, 1,
-0.1296349, 0.1409959, -2.533469, 0, 0, 0, 1, 1,
-0.1259824, -1.800453, -1.770091, 1, 1, 1, 1, 1,
-0.1259383, -1.958594, -1.5108, 1, 1, 1, 1, 1,
-0.1253256, -0.5716408, -2.209585, 1, 1, 1, 1, 1,
-0.1178033, -2.063115, -2.072786, 1, 1, 1, 1, 1,
-0.116147, 0.9950232, -0.1200667, 1, 1, 1, 1, 1,
-0.110531, -0.5849841, -1.146742, 1, 1, 1, 1, 1,
-0.1102124, -1.038337, -2.790354, 1, 1, 1, 1, 1,
-0.1088894, 2.258925, 0.6169933, 1, 1, 1, 1, 1,
-0.1072048, 1.87827, -2.17583, 1, 1, 1, 1, 1,
-0.1056165, 0.3990007, 0.9885835, 1, 1, 1, 1, 1,
-0.1037364, 0.5269117, 1.328833, 1, 1, 1, 1, 1,
-0.09899512, 0.2585064, 0.7395082, 1, 1, 1, 1, 1,
-0.0984755, 0.6861237, -1.738972, 1, 1, 1, 1, 1,
-0.09842257, -0.9041842, -3.407164, 1, 1, 1, 1, 1,
-0.09489726, -1.970968, -4.612669, 1, 1, 1, 1, 1,
-0.09075237, -1.032902, -2.461807, 0, 0, 1, 1, 1,
-0.08852457, 0.2066707, -0.06604628, 1, 0, 0, 1, 1,
-0.08680238, -1.649659, -2.058838, 1, 0, 0, 1, 1,
-0.08417951, -0.666845, -5.100413, 1, 0, 0, 1, 1,
-0.07981867, -0.3576972, -2.40352, 1, 0, 0, 1, 1,
-0.07811667, -0.7612943, -2.937225, 1, 0, 0, 1, 1,
-0.07199111, 1.150199, 0.9670447, 0, 0, 0, 1, 1,
-0.06736135, 0.7191566, -0.6996655, 0, 0, 0, 1, 1,
-0.06646611, -1.169931, -4.512507, 0, 0, 0, 1, 1,
-0.06636454, -0.1317051, -2.473241, 0, 0, 0, 1, 1,
-0.06492134, 0.5930257, -0.1514934, 0, 0, 0, 1, 1,
-0.06440506, 0.3215663, 0.02012424, 0, 0, 0, 1, 1,
-0.0624865, 2.721845, 1.137781, 0, 0, 0, 1, 1,
-0.05218561, -0.1597189, -2.841985, 1, 1, 1, 1, 1,
-0.05153887, 0.3190847, 0.00255298, 1, 1, 1, 1, 1,
-0.04858136, -1.150356, -1.951022, 1, 1, 1, 1, 1,
-0.04490806, 0.2119614, -0.6393635, 1, 1, 1, 1, 1,
-0.0431872, -0.1479462, -2.246705, 1, 1, 1, 1, 1,
-0.03952941, 2.589072, -1.393436, 1, 1, 1, 1, 1,
-0.03593758, 1.386617, 0.3382233, 1, 1, 1, 1, 1,
-0.03357737, -1.909374, -3.020324, 1, 1, 1, 1, 1,
-0.02636199, 0.1113642, -0.3149241, 1, 1, 1, 1, 1,
-0.02116846, -1.86728, -3.760784, 1, 1, 1, 1, 1,
-0.02074432, 1.238484, -0.06604735, 1, 1, 1, 1, 1,
-0.01771674, -1.203913, -2.563848, 1, 1, 1, 1, 1,
-0.01681555, -0.4384401, -2.577731, 1, 1, 1, 1, 1,
-0.0148494, -0.9134737, -4.882745, 1, 1, 1, 1, 1,
-0.01312626, 0.06522182, 1.346156, 1, 1, 1, 1, 1,
-0.002575714, 0.2173245, 1.755836, 0, 0, 1, 1, 1,
0.002594506, -0.5088183, 4.383653, 1, 0, 0, 1, 1,
0.006301667, -1.564439, 3.900468, 1, 0, 0, 1, 1,
0.007061471, 0.8441077, -0.5022033, 1, 0, 0, 1, 1,
0.008677655, 0.7707361, -2.652087, 1, 0, 0, 1, 1,
0.01138633, 2.218402, -0.1486812, 1, 0, 0, 1, 1,
0.01336409, 0.5301396, -1.640195, 0, 0, 0, 1, 1,
0.01540047, -0.3001257, 3.002775, 0, 0, 0, 1, 1,
0.01867094, -1.990791, 3.036353, 0, 0, 0, 1, 1,
0.02314364, -0.1948101, 4.548123, 0, 0, 0, 1, 1,
0.03191968, 1.16499, 0.3754643, 0, 0, 0, 1, 1,
0.03197383, 0.07806215, -0.003765941, 0, 0, 0, 1, 1,
0.0320131, 1.524343, 1.508902, 0, 0, 0, 1, 1,
0.03392765, 0.4237294, 0.8460105, 1, 1, 1, 1, 1,
0.04234558, -0.04285362, 1.874158, 1, 1, 1, 1, 1,
0.05069983, -0.3036225, 2.820501, 1, 1, 1, 1, 1,
0.05251776, -0.1937785, 2.851344, 1, 1, 1, 1, 1,
0.05268003, 0.8511103, -0.2240591, 1, 1, 1, 1, 1,
0.06558675, 1.969844, -2.545334, 1, 1, 1, 1, 1,
0.06738379, 0.8381464, 1.197517, 1, 1, 1, 1, 1,
0.06751368, -0.9760189, 4.038834, 1, 1, 1, 1, 1,
0.06809237, -0.8191425, 2.155132, 1, 1, 1, 1, 1,
0.07288371, 0.1887318, 0.05304226, 1, 1, 1, 1, 1,
0.07524658, -0.9214523, 3.709751, 1, 1, 1, 1, 1,
0.07527116, 0.04374728, 2.515601, 1, 1, 1, 1, 1,
0.07932552, 0.02686471, 0.5768246, 1, 1, 1, 1, 1,
0.08287432, 0.330427, 0.2823133, 1, 1, 1, 1, 1,
0.08340348, -0.4413462, 3.748441, 1, 1, 1, 1, 1,
0.08348703, 0.1224906, 0.9517047, 0, 0, 1, 1, 1,
0.08538965, 0.6234365, -0.2467915, 1, 0, 0, 1, 1,
0.08853517, -0.2261952, 2.873209, 1, 0, 0, 1, 1,
0.08893481, 0.9113032, 0.1666115, 1, 0, 0, 1, 1,
0.09372625, 0.113188, -0.7205691, 1, 0, 0, 1, 1,
0.09385055, 2.399396, -1.471694, 1, 0, 0, 1, 1,
0.09386603, 1.227957, 0.5281165, 0, 0, 0, 1, 1,
0.09412797, 1.242692, 1.594479, 0, 0, 0, 1, 1,
0.09831886, 0.6138084, 0.6181856, 0, 0, 0, 1, 1,
0.1021893, 0.3580543, -1.209987, 0, 0, 0, 1, 1,
0.1037486, -0.2697725, 1.375115, 0, 0, 0, 1, 1,
0.10684, -0.5754969, 3.655729, 0, 0, 0, 1, 1,
0.1105796, -1.296736, 3.749754, 0, 0, 0, 1, 1,
0.1108986, 1.631374, 0.6310325, 1, 1, 1, 1, 1,
0.1119848, -0.2380007, 3.916599, 1, 1, 1, 1, 1,
0.1145272, -0.6492184, 3.576224, 1, 1, 1, 1, 1,
0.1145462, 0.1755698, 0.5286852, 1, 1, 1, 1, 1,
0.1148898, -2.144652, 2.159064, 1, 1, 1, 1, 1,
0.1206765, 0.980508, -1.246645, 1, 1, 1, 1, 1,
0.1284614, -2.150029, 2.993945, 1, 1, 1, 1, 1,
0.1319271, -0.544843, 2.758628, 1, 1, 1, 1, 1,
0.1357607, 0.4043382, -1.24813, 1, 1, 1, 1, 1,
0.1368006, -1.722826, 2.272402, 1, 1, 1, 1, 1,
0.1387836, 1.988191, 1.051724, 1, 1, 1, 1, 1,
0.1389437, -0.3124529, 3.87099, 1, 1, 1, 1, 1,
0.1389614, 0.6371081, -0.545599, 1, 1, 1, 1, 1,
0.1403157, 0.3884306, 0.1187586, 1, 1, 1, 1, 1,
0.1410904, -1.355087, 1.627616, 1, 1, 1, 1, 1,
0.144894, -1.907091, 4.019542, 0, 0, 1, 1, 1,
0.1469464, 1.182177, 0.05214234, 1, 0, 0, 1, 1,
0.1487513, 0.9625225, 2.920731, 1, 0, 0, 1, 1,
0.1500868, -0.8623727, 2.91152, 1, 0, 0, 1, 1,
0.1539697, -0.2901662, 2.14116, 1, 0, 0, 1, 1,
0.1567492, 0.09230585, 1.310895, 1, 0, 0, 1, 1,
0.1575141, -0.4378779, 4.264781, 0, 0, 0, 1, 1,
0.1592181, -0.6919272, 2.692357, 0, 0, 0, 1, 1,
0.1672126, 0.08442401, 0.9595275, 0, 0, 0, 1, 1,
0.167604, -1.100762, 3.280869, 0, 0, 0, 1, 1,
0.1677327, -1.620433, 0.8923244, 0, 0, 0, 1, 1,
0.1695139, 1.106127, 0.7826917, 0, 0, 0, 1, 1,
0.1709252, 0.9997168, 0.7531594, 0, 0, 0, 1, 1,
0.1714314, 0.02737328, 3.30342, 1, 1, 1, 1, 1,
0.1730288, -1.868613, 3.456856, 1, 1, 1, 1, 1,
0.1731339, 0.668069, 1.501723, 1, 1, 1, 1, 1,
0.1802152, 0.4174423, -0.04853977, 1, 1, 1, 1, 1,
0.1821962, 0.1939969, -1.997793, 1, 1, 1, 1, 1,
0.1834216, 0.48429, 0.2478098, 1, 1, 1, 1, 1,
0.1848359, -0.7918116, 3.918643, 1, 1, 1, 1, 1,
0.188961, -1.807384, 2.488196, 1, 1, 1, 1, 1,
0.1910405, -1.63073, 1.892746, 1, 1, 1, 1, 1,
0.1912298, -0.8157559, 1.294871, 1, 1, 1, 1, 1,
0.1915517, 0.2119677, 0.9837877, 1, 1, 1, 1, 1,
0.1949668, 2.721376, 0.8177926, 1, 1, 1, 1, 1,
0.1958451, 0.06875497, 3.168195, 1, 1, 1, 1, 1,
0.1967837, 0.8619841, 0.4176535, 1, 1, 1, 1, 1,
0.1988993, 0.2345084, 1.552859, 1, 1, 1, 1, 1,
0.2026125, 0.9535018, 0.5250154, 0, 0, 1, 1, 1,
0.2064441, 0.858416, -0.1027723, 1, 0, 0, 1, 1,
0.2067604, 0.7505594, 1.076187, 1, 0, 0, 1, 1,
0.2076376, -2.485175, 0.7191436, 1, 0, 0, 1, 1,
0.2101425, 0.5486332, 0.3703599, 1, 0, 0, 1, 1,
0.21111, -0.5851737, 1.279344, 1, 0, 0, 1, 1,
0.2164164, -2.185719, 2.81933, 0, 0, 0, 1, 1,
0.2184115, 0.8895198, -0.4390444, 0, 0, 0, 1, 1,
0.2192489, 0.4986267, -1.53128, 0, 0, 0, 1, 1,
0.2249201, 0.19954, 0.7811701, 0, 0, 0, 1, 1,
0.2361888, -1.537017, 1.835627, 0, 0, 0, 1, 1,
0.2415291, -0.3045012, 1.550586, 0, 0, 0, 1, 1,
0.2416375, -0.2385727, 3.486031, 0, 0, 0, 1, 1,
0.2488552, 0.7150111, 0.1201522, 1, 1, 1, 1, 1,
0.2521853, 1.077236, 0.6235372, 1, 1, 1, 1, 1,
0.2549674, 0.9080443, -0.08754983, 1, 1, 1, 1, 1,
0.2588826, 0.08435816, 0.05438119, 1, 1, 1, 1, 1,
0.2611387, 0.06420457, 2.682141, 1, 1, 1, 1, 1,
0.261345, -1.671775, 2.983886, 1, 1, 1, 1, 1,
0.2661829, -0.2231009, 1.143106, 1, 1, 1, 1, 1,
0.2683798, 1.089303, 2.402672, 1, 1, 1, 1, 1,
0.276057, -0.07731928, 0.5424466, 1, 1, 1, 1, 1,
0.281026, 0.4794995, -0.5784119, 1, 1, 1, 1, 1,
0.2828122, -0.0591359, 1.67376, 1, 1, 1, 1, 1,
0.2832739, -0.2558485, 0.9152604, 1, 1, 1, 1, 1,
0.2843403, 0.9250305, -0.4873507, 1, 1, 1, 1, 1,
0.2855023, -1.096193, 3.601356, 1, 1, 1, 1, 1,
0.2885156, -1.088493, 2.41523, 1, 1, 1, 1, 1,
0.2889888, -0.07436521, 0.4249729, 0, 0, 1, 1, 1,
0.2896109, -1.023592, 2.957325, 1, 0, 0, 1, 1,
0.2915869, 0.03328856, 3.477059, 1, 0, 0, 1, 1,
0.2918564, -0.1268453, 1.469756, 1, 0, 0, 1, 1,
0.2955726, 1.144207, -2.254972, 1, 0, 0, 1, 1,
0.2958402, -0.6228006, 2.316782, 1, 0, 0, 1, 1,
0.2959872, 0.1258405, 0.8135126, 0, 0, 0, 1, 1,
0.2983217, 0.2228998, 0.9540163, 0, 0, 0, 1, 1,
0.2987216, -1.113016, 2.357472, 0, 0, 0, 1, 1,
0.3001759, -2.785163, 2.915069, 0, 0, 0, 1, 1,
0.3007931, 0.5034697, 0.01504431, 0, 0, 0, 1, 1,
0.3129817, -0.3228909, 1.816191, 0, 0, 0, 1, 1,
0.3147709, -1.455459, 3.478043, 0, 0, 0, 1, 1,
0.3181477, -0.5195237, 2.489746, 1, 1, 1, 1, 1,
0.3216173, 0.2436861, 0.5381528, 1, 1, 1, 1, 1,
0.3223349, 0.4262016, 1.649314, 1, 1, 1, 1, 1,
0.3245007, 0.2226818, -0.710277, 1, 1, 1, 1, 1,
0.3305021, -0.7109451, 1.843568, 1, 1, 1, 1, 1,
0.3331657, 0.2694604, -1.41598, 1, 1, 1, 1, 1,
0.3335252, -1.910854, 2.707236, 1, 1, 1, 1, 1,
0.3339357, 0.102074, 0.8255489, 1, 1, 1, 1, 1,
0.3377882, 1.761907, 0.4850972, 1, 1, 1, 1, 1,
0.3383942, -1.45257, 2.973475, 1, 1, 1, 1, 1,
0.3419411, 0.1555757, 1.994107, 1, 1, 1, 1, 1,
0.3422362, 2.018712, -0.7721676, 1, 1, 1, 1, 1,
0.342344, 0.4138298, 0.3426678, 1, 1, 1, 1, 1,
0.3436256, -1.469732, 3.091127, 1, 1, 1, 1, 1,
0.348296, 0.4225582, 1.476373, 1, 1, 1, 1, 1,
0.349568, 0.844976, 1.106432, 0, 0, 1, 1, 1,
0.3495927, -1.511877, 3.027347, 1, 0, 0, 1, 1,
0.350598, 1.219288, -1.693604, 1, 0, 0, 1, 1,
0.3545742, 0.5596656, 1.038355, 1, 0, 0, 1, 1,
0.3639841, -0.5245047, 3.323241, 1, 0, 0, 1, 1,
0.3654374, 1.018807, 0.6135625, 1, 0, 0, 1, 1,
0.3666023, 1.199767, 0.615433, 0, 0, 0, 1, 1,
0.3720608, 0.9645835, 1.088843, 0, 0, 0, 1, 1,
0.3736942, -0.6094961, 3.096477, 0, 0, 0, 1, 1,
0.3774804, 1.290529, -0.4393331, 0, 0, 0, 1, 1,
0.3868706, -0.8691804, 3.201408, 0, 0, 0, 1, 1,
0.3902507, 1.586439, -0.1726454, 0, 0, 0, 1, 1,
0.3910205, -0.06662914, 1.184238, 0, 0, 0, 1, 1,
0.3924039, 0.143774, 1.461368, 1, 1, 1, 1, 1,
0.3933, -0.2058428, 3.043447, 1, 1, 1, 1, 1,
0.3979626, 0.2733708, -1.139841, 1, 1, 1, 1, 1,
0.3998954, -1.461857, 2.232143, 1, 1, 1, 1, 1,
0.3999071, -0.5700549, 2.827276, 1, 1, 1, 1, 1,
0.4004365, -1.019147, 1.83748, 1, 1, 1, 1, 1,
0.4008935, -0.9254427, 2.868488, 1, 1, 1, 1, 1,
0.4044802, 0.2290647, 2.540434, 1, 1, 1, 1, 1,
0.4078165, -0.5062205, 1.711583, 1, 1, 1, 1, 1,
0.4097107, -0.4990127, 1.969131, 1, 1, 1, 1, 1,
0.4103033, -0.1098653, 1.670349, 1, 1, 1, 1, 1,
0.4168308, 1.846898, -1.391648, 1, 1, 1, 1, 1,
0.4168505, 1.845443, 0.8578664, 1, 1, 1, 1, 1,
0.4254968, 1.449466, 1.247276, 1, 1, 1, 1, 1,
0.4285831, -0.2644469, 1.690358, 1, 1, 1, 1, 1,
0.4306865, -1.280586, 1.916831, 0, 0, 1, 1, 1,
0.4319031, 0.3422782, 0.5815153, 1, 0, 0, 1, 1,
0.4341195, 0.8033676, -0.5632219, 1, 0, 0, 1, 1,
0.4353195, 0.4100327, 0.8689204, 1, 0, 0, 1, 1,
0.4365695, 0.7518322, 1.709194, 1, 0, 0, 1, 1,
0.4369026, -0.4997831, 2.412773, 1, 0, 0, 1, 1,
0.4373079, 1.154707, -0.3951701, 0, 0, 0, 1, 1,
0.438107, -0.03476091, 1.424784, 0, 0, 0, 1, 1,
0.4384039, -1.884359, 3.216245, 0, 0, 0, 1, 1,
0.4405337, -1.423424, 1.886782, 0, 0, 0, 1, 1,
0.444513, -0.5326166, 2.808174, 0, 0, 0, 1, 1,
0.4455765, -1.057533, 4.671312, 0, 0, 0, 1, 1,
0.4462817, 1.466804, -1.88731, 0, 0, 0, 1, 1,
0.4479943, -0.6719614, 2.586665, 1, 1, 1, 1, 1,
0.4530723, 0.5121055, 0.4264326, 1, 1, 1, 1, 1,
0.4538209, 2.792397, 0.7190305, 1, 1, 1, 1, 1,
0.454713, -1.457171, 1.961783, 1, 1, 1, 1, 1,
0.454908, 0.1668302, 2.133208, 1, 1, 1, 1, 1,
0.4564363, 0.3655185, 2.105527, 1, 1, 1, 1, 1,
0.4569151, -1.900376, 4.543883, 1, 1, 1, 1, 1,
0.458844, 0.52051, -1.056848, 1, 1, 1, 1, 1,
0.4594662, 0.672549, 1.529164, 1, 1, 1, 1, 1,
0.4611889, -0.3995838, 1.54511, 1, 1, 1, 1, 1,
0.4637879, -0.4383277, 1.808775, 1, 1, 1, 1, 1,
0.4641307, 1.203037, 0.5606425, 1, 1, 1, 1, 1,
0.4643608, -1.509379, 1.830765, 1, 1, 1, 1, 1,
0.4687589, -1.775306, 3.80144, 1, 1, 1, 1, 1,
0.4711376, -0.07598331, 1.541357, 1, 1, 1, 1, 1,
0.4740994, -0.07144822, 2.656673, 0, 0, 1, 1, 1,
0.4756417, -0.4805309, 1.940565, 1, 0, 0, 1, 1,
0.4781013, -2.480551, 1.52035, 1, 0, 0, 1, 1,
0.4785138, -1.577825, 2.865469, 1, 0, 0, 1, 1,
0.4787793, 0.7872543, 2.059606, 1, 0, 0, 1, 1,
0.4800059, 0.5498323, 0.2542603, 1, 0, 0, 1, 1,
0.4819393, 0.6443365, -0.4356824, 0, 0, 0, 1, 1,
0.4833872, -0.8580943, 1.541464, 0, 0, 0, 1, 1,
0.4836788, -0.5970321, 2.38536, 0, 0, 0, 1, 1,
0.4852817, 0.3710674, 0.0005156584, 0, 0, 0, 1, 1,
0.487747, 1.485803, 1.176188, 0, 0, 0, 1, 1,
0.4902342, 0.5357378, 0.5245929, 0, 0, 0, 1, 1,
0.4910518, 2.451968, -0.5685459, 0, 0, 0, 1, 1,
0.4913597, -0.09385997, 2.476603, 1, 1, 1, 1, 1,
0.496456, 0.0840138, 2.240852, 1, 1, 1, 1, 1,
0.5008188, -1.340393, 1.906847, 1, 1, 1, 1, 1,
0.5029655, 0.3555432, -0.277009, 1, 1, 1, 1, 1,
0.5051736, 0.1663594, 0.2650484, 1, 1, 1, 1, 1,
0.5128907, -0.6486712, 4.164097, 1, 1, 1, 1, 1,
0.5129449, 0.3798117, -0.1774758, 1, 1, 1, 1, 1,
0.5243109, 0.2647188, 2.28049, 1, 1, 1, 1, 1,
0.5249026, 0.2652463, 1.880848, 1, 1, 1, 1, 1,
0.5273823, -0.09220857, 1.832921, 1, 1, 1, 1, 1,
0.5332727, 1.427268, -0.6882958, 1, 1, 1, 1, 1,
0.537891, -0.3736758, 3.263019, 1, 1, 1, 1, 1,
0.5395258, -0.6008022, 2.099102, 1, 1, 1, 1, 1,
0.5399451, 0.1472797, 2.834015, 1, 1, 1, 1, 1,
0.5412593, -0.933619, 1.608598, 1, 1, 1, 1, 1,
0.5457317, 0.1075001, 2.998045, 0, 0, 1, 1, 1,
0.5459009, -1.849199, 2.328001, 1, 0, 0, 1, 1,
0.5466343, -0.6223059, 2.795993, 1, 0, 0, 1, 1,
0.5467917, -0.01302341, 1.571887, 1, 0, 0, 1, 1,
0.5483459, 0.2486608, 1.638292, 1, 0, 0, 1, 1,
0.5515642, 0.9611766, 0.2884133, 1, 0, 0, 1, 1,
0.5535119, 0.8980879, 0.5208261, 0, 0, 0, 1, 1,
0.5575451, 0.03096433, 3.282123, 0, 0, 0, 1, 1,
0.5605975, -2.669041, 4.387612, 0, 0, 0, 1, 1,
0.5607081, 0.9511681, 0.03682592, 0, 0, 0, 1, 1,
0.5621893, 0.8068058, -0.3898403, 0, 0, 0, 1, 1,
0.5626851, -1.987705, 4.840247, 0, 0, 0, 1, 1,
0.5646322, 0.4004931, -0.09303861, 0, 0, 0, 1, 1,
0.5697858, -0.495801, 2.525198, 1, 1, 1, 1, 1,
0.5722775, 0.1380834, 0.8657981, 1, 1, 1, 1, 1,
0.5723116, -0.6179695, 2.49021, 1, 1, 1, 1, 1,
0.5727092, -0.8834662, 3.262382, 1, 1, 1, 1, 1,
0.5750461, -0.7652504, 1.845925, 1, 1, 1, 1, 1,
0.5751171, -0.1682055, 3.111431, 1, 1, 1, 1, 1,
0.5795898, -0.1004865, 1.378081, 1, 1, 1, 1, 1,
0.5803274, 0.2274619, 2.302826, 1, 1, 1, 1, 1,
0.580347, 0.8522231, 1.720371, 1, 1, 1, 1, 1,
0.5852858, -0.2545261, 3.417131, 1, 1, 1, 1, 1,
0.5906804, -1.248123, 1.892382, 1, 1, 1, 1, 1,
0.5924708, 0.7748747, 1.140471, 1, 1, 1, 1, 1,
0.6126792, 0.8884721, -0.1729975, 1, 1, 1, 1, 1,
0.6127766, -1.363901, 4.168499, 1, 1, 1, 1, 1,
0.6138281, 0.5304557, 1.835187, 1, 1, 1, 1, 1,
0.6175992, 1.103616, 1.121082, 0, 0, 1, 1, 1,
0.6198691, 0.3914719, 1.686507, 1, 0, 0, 1, 1,
0.6300008, -1.093052, 3.388263, 1, 0, 0, 1, 1,
0.6319473, 0.7904461, 1.38083, 1, 0, 0, 1, 1,
0.6376434, -0.9619577, 2.609779, 1, 0, 0, 1, 1,
0.6376572, -1.273759, 3.255588, 1, 0, 0, 1, 1,
0.6377156, -0.2990065, 1.924626, 0, 0, 0, 1, 1,
0.6392797, -0.04285286, -0.2349469, 0, 0, 0, 1, 1,
0.6400812, -0.2404929, 1.958688, 0, 0, 0, 1, 1,
0.6425872, 0.2826986, 0.4450364, 0, 0, 0, 1, 1,
0.6445486, 2.057034, 0.7670436, 0, 0, 0, 1, 1,
0.6477951, -0.4993046, 3.368534, 0, 0, 0, 1, 1,
0.6524765, -0.6995418, 1.61134, 0, 0, 0, 1, 1,
0.6581602, 0.2878103, 0.9439415, 1, 1, 1, 1, 1,
0.6603417, -0.8365591, 4.076365, 1, 1, 1, 1, 1,
0.662025, -0.0415807, 0.6510172, 1, 1, 1, 1, 1,
0.6632533, -1.138326, 2.582873, 1, 1, 1, 1, 1,
0.6637438, 1.266091, 0.1343654, 1, 1, 1, 1, 1,
0.6673698, 2.003364, 0.7662784, 1, 1, 1, 1, 1,
0.6716604, -0.3706778, 1.871761, 1, 1, 1, 1, 1,
0.6734833, 0.5397511, -1.102165, 1, 1, 1, 1, 1,
0.6962172, -1.060604, 0.9181717, 1, 1, 1, 1, 1,
0.6982412, 1.937508, 0.1517208, 1, 1, 1, 1, 1,
0.703697, -0.7074066, 4.008332, 1, 1, 1, 1, 1,
0.7063991, 1.615074, 1.541664, 1, 1, 1, 1, 1,
0.7079466, 1.07952, -0.2669979, 1, 1, 1, 1, 1,
0.7085152, 0.2509688, 2.93188, 1, 1, 1, 1, 1,
0.7111628, 0.5350789, 1.295385, 1, 1, 1, 1, 1,
0.7114223, -1.258855, 2.398301, 0, 0, 1, 1, 1,
0.7158896, -0.1419109, 2.020044, 1, 0, 0, 1, 1,
0.7233671, -0.02984602, 1.125969, 1, 0, 0, 1, 1,
0.7357684, 1.136489, 0.9732336, 1, 0, 0, 1, 1,
0.7369288, 0.2376101, 0.6706612, 1, 0, 0, 1, 1,
0.7391321, -0.6343065, 3.362036, 1, 0, 0, 1, 1,
0.7401636, -0.6926979, 4.003061, 0, 0, 0, 1, 1,
0.7443166, 0.2167626, 1.42227, 0, 0, 0, 1, 1,
0.7465077, 0.9083351, 1.998457, 0, 0, 0, 1, 1,
0.7543321, -0.885331, 3.210483, 0, 0, 0, 1, 1,
0.758222, 0.1142949, 0.4094855, 0, 0, 0, 1, 1,
0.7600374, 0.7361463, 0.08370545, 0, 0, 0, 1, 1,
0.773326, -0.3414088, 3.08106, 0, 0, 0, 1, 1,
0.7800652, -0.4866839, 3.829705, 1, 1, 1, 1, 1,
0.7836453, -0.6063414, 2.71339, 1, 1, 1, 1, 1,
0.7868521, -0.03829546, 1.920603, 1, 1, 1, 1, 1,
0.7881283, 0.8130409, -0.3737096, 1, 1, 1, 1, 1,
0.7889197, 1.377927, 1.900958, 1, 1, 1, 1, 1,
0.7906879, 0.3733408, 0.6863227, 1, 1, 1, 1, 1,
0.7914583, -0.6781211, 1.103406, 1, 1, 1, 1, 1,
0.7919855, 1.663353, -1.181284, 1, 1, 1, 1, 1,
0.7944126, -2.206486, 1.266374, 1, 1, 1, 1, 1,
0.8034922, 1.946779, 0.2211894, 1, 1, 1, 1, 1,
0.8052411, 0.78021, 0.3874216, 1, 1, 1, 1, 1,
0.8066973, 0.1221296, 2.382294, 1, 1, 1, 1, 1,
0.8133464, 0.797942, 0.8289458, 1, 1, 1, 1, 1,
0.8174185, -0.8752674, 2.231865, 1, 1, 1, 1, 1,
0.8184721, 0.8817179, 1.670783, 1, 1, 1, 1, 1,
0.8195896, -1.459934, 3.764086, 0, 0, 1, 1, 1,
0.8253068, 0.3183937, 2.108332, 1, 0, 0, 1, 1,
0.8293682, -2.150519, 3.685031, 1, 0, 0, 1, 1,
0.8362188, 1.424499, 1.484705, 1, 0, 0, 1, 1,
0.8400597, -1.117784, 2.646678, 1, 0, 0, 1, 1,
0.8440095, -0.3878449, -0.02809866, 1, 0, 0, 1, 1,
0.8494698, 1.618929, -1.347001, 0, 0, 0, 1, 1,
0.8509564, 1.080623, 0.2370134, 0, 0, 0, 1, 1,
0.8582911, 0.5994599, 0.8023177, 0, 0, 0, 1, 1,
0.8589289, -0.3692442, 1.575889, 0, 0, 0, 1, 1,
0.8651838, -1.202803, 3.10294, 0, 0, 0, 1, 1,
0.8680011, 0.442742, 2.067808, 0, 0, 0, 1, 1,
0.8692529, -0.2113279, 1.016748, 0, 0, 0, 1, 1,
0.8693739, -1.283837, 2.838829, 1, 1, 1, 1, 1,
0.8738289, -0.3734976, 1.36725, 1, 1, 1, 1, 1,
0.8765816, 0.01936675, 1.641392, 1, 1, 1, 1, 1,
0.8798698, 0.1013044, 0.6455595, 1, 1, 1, 1, 1,
0.8803673, 0.771356, 2.344118, 1, 1, 1, 1, 1,
0.8804997, -0.5113809, 1.749239, 1, 1, 1, 1, 1,
0.8840076, -2.551109, 2.367327, 1, 1, 1, 1, 1,
0.884245, -0.9617328, 2.542977, 1, 1, 1, 1, 1,
0.8864483, 1.513572, -0.4080417, 1, 1, 1, 1, 1,
0.8892946, 1.368034, 0.4201251, 1, 1, 1, 1, 1,
0.8941343, 0.6272625, 0.7066141, 1, 1, 1, 1, 1,
0.8957546, 0.4831522, -0.01468546, 1, 1, 1, 1, 1,
0.9029973, -0.9624158, 2.270599, 1, 1, 1, 1, 1,
0.9126089, 2.257964, 0.4858159, 1, 1, 1, 1, 1,
0.9205087, 0.8786182, 1.420231, 1, 1, 1, 1, 1,
0.9233805, 1.252842, -0.3126684, 0, 0, 1, 1, 1,
0.9247169, -1.217566, 2.143275, 1, 0, 0, 1, 1,
0.9251871, 0.8744859, 0.9304595, 1, 0, 0, 1, 1,
0.9296285, -0.8657266, 0.9972327, 1, 0, 0, 1, 1,
0.9352739, 0.4224731, -1.589939, 1, 0, 0, 1, 1,
0.9364598, 0.8594036, 3.995358, 1, 0, 0, 1, 1,
0.9424779, 0.9433001, 0.6249102, 0, 0, 0, 1, 1,
0.9456816, 0.587862, 0.6325412, 0, 0, 0, 1, 1,
0.9508492, -2.269005, 4.586111, 0, 0, 0, 1, 1,
0.9543008, 1.206397, 1.625087, 0, 0, 0, 1, 1,
0.9594131, -0.280551, 1.676489, 0, 0, 0, 1, 1,
0.9595882, -0.7532487, 3.825431, 0, 0, 0, 1, 1,
0.9613957, -0.02096048, 2.701911, 0, 0, 0, 1, 1,
0.9631678, -0.6064717, 1.366965, 1, 1, 1, 1, 1,
0.9698132, 0.8876261, 2.206648, 1, 1, 1, 1, 1,
0.9751584, -0.564464, 2.631779, 1, 1, 1, 1, 1,
0.9810695, -0.6566811, 2.150403, 1, 1, 1, 1, 1,
0.9823503, -1.508502, 3.585407, 1, 1, 1, 1, 1,
0.9878222, 0.1934792, 2.13108, 1, 1, 1, 1, 1,
0.9879982, 0.585663, 3.134273, 1, 1, 1, 1, 1,
0.9939139, -1.1528, 3.198338, 1, 1, 1, 1, 1,
0.9949359, 0.8822936, 0.1272381, 1, 1, 1, 1, 1,
0.995629, -1.772079, 3.709436, 1, 1, 1, 1, 1,
1.01127, -0.6381205, 2.552473, 1, 1, 1, 1, 1,
1.011539, 1.025997, -0.5196043, 1, 1, 1, 1, 1,
1.022439, -0.8121648, 2.666909, 1, 1, 1, 1, 1,
1.02988, -0.1680074, 1.697031, 1, 1, 1, 1, 1,
1.03195, -0.8493693, 2.515451, 1, 1, 1, 1, 1,
1.043171, 1.08468, 1.294287, 0, 0, 1, 1, 1,
1.044144, -1.20997, 3.059039, 1, 0, 0, 1, 1,
1.046285, 0.1148539, 2.102539, 1, 0, 0, 1, 1,
1.05, 0.266862, 2.079524, 1, 0, 0, 1, 1,
1.050357, -0.01355687, -0.2093349, 1, 0, 0, 1, 1,
1.051157, -0.1518618, -0.3268583, 1, 0, 0, 1, 1,
1.052564, 0.2041224, -0.8262782, 0, 0, 0, 1, 1,
1.058211, 0.589697, 2.044502, 0, 0, 0, 1, 1,
1.05914, -0.5040438, 3.33325, 0, 0, 0, 1, 1,
1.062091, -1.095127, 2.620881, 0, 0, 0, 1, 1,
1.06225, 2.663923, -0.1825506, 0, 0, 0, 1, 1,
1.074248, 0.4005399, 1.638913, 0, 0, 0, 1, 1,
1.07692, 0.488833, 0.7030852, 0, 0, 0, 1, 1,
1.077216, 0.8701915, 1.314026, 1, 1, 1, 1, 1,
1.078769, -0.06265126, 2.066912, 1, 1, 1, 1, 1,
1.079087, 0.3037904, 2.806197, 1, 1, 1, 1, 1,
1.079562, 0.4899837, 1.565027, 1, 1, 1, 1, 1,
1.091216, -1.73116, 1.853018, 1, 1, 1, 1, 1,
1.09475, 1.113, 0.7271089, 1, 1, 1, 1, 1,
1.098243, -0.894481, 1.88826, 1, 1, 1, 1, 1,
1.098789, 1.238151, 0.1003091, 1, 1, 1, 1, 1,
1.104703, 0.7435432, 0.6670379, 1, 1, 1, 1, 1,
1.107484, -0.7285085, 2.536055, 1, 1, 1, 1, 1,
1.116747, -0.1398681, 1.780829, 1, 1, 1, 1, 1,
1.117393, -1.603365, 2.002343, 1, 1, 1, 1, 1,
1.121495, 1.094468, 1.659455, 1, 1, 1, 1, 1,
1.127095, 0.2417747, 0.09963076, 1, 1, 1, 1, 1,
1.127941, -1.341708, 1.576198, 1, 1, 1, 1, 1,
1.131383, 1.66954, 0.01496848, 0, 0, 1, 1, 1,
1.142799, -0.2895593, -0.8047398, 1, 0, 0, 1, 1,
1.148232, -1.283892, 2.517133, 1, 0, 0, 1, 1,
1.15158, 0.8944728, 1.83376, 1, 0, 0, 1, 1,
1.152769, 0.2608532, 1.071262, 1, 0, 0, 1, 1,
1.159482, -0.9295238, 0.9191254, 1, 0, 0, 1, 1,
1.173989, -0.08919271, 2.143067, 0, 0, 0, 1, 1,
1.177229, 1.911721, 1.419729, 0, 0, 0, 1, 1,
1.17754, -1.381098, 1.765833, 0, 0, 0, 1, 1,
1.19493, -0.2689716, 4.051829, 0, 0, 0, 1, 1,
1.195156, 0.9143709, 2.23339, 0, 0, 0, 1, 1,
1.196438, 1.026533, 0.02057198, 0, 0, 0, 1, 1,
1.198008, 0.5188177, 3.100461, 0, 0, 0, 1, 1,
1.202706, 0.3983859, 2.706971, 1, 1, 1, 1, 1,
1.202709, -1.616451, 3.721144, 1, 1, 1, 1, 1,
1.211747, -0.679487, 2.901114, 1, 1, 1, 1, 1,
1.212702, -0.67932, 2.015347, 1, 1, 1, 1, 1,
1.218681, -0.02782858, 2.178448, 1, 1, 1, 1, 1,
1.225063, -0.2868825, 1.429102, 1, 1, 1, 1, 1,
1.226402, -0.1508396, 2.708208, 1, 1, 1, 1, 1,
1.235944, -0.05559733, 0.9006564, 1, 1, 1, 1, 1,
1.23687, -0.06540524, 2.307185, 1, 1, 1, 1, 1,
1.246275, -1.642635, 1.163537, 1, 1, 1, 1, 1,
1.262634, -0.2333239, 1.471035, 1, 1, 1, 1, 1,
1.271014, 0.4947965, 1.22107, 1, 1, 1, 1, 1,
1.282056, -1.707512, 0.8013137, 1, 1, 1, 1, 1,
1.286692, 0.2877684, 0.4986265, 1, 1, 1, 1, 1,
1.286884, -1.143785, 1.806234, 1, 1, 1, 1, 1,
1.288682, -1.270099, -0.5958762, 0, 0, 1, 1, 1,
1.298992, 0.5287746, 2.227441, 1, 0, 0, 1, 1,
1.307451, -0.2490982, 0.3603942, 1, 0, 0, 1, 1,
1.309232, -0.9006383, 2.61214, 1, 0, 0, 1, 1,
1.317799, -0.2006869, 0.6786144, 1, 0, 0, 1, 1,
1.320206, 0.1670871, -0.1567463, 1, 0, 0, 1, 1,
1.320283, 1.422802, -0.5709459, 0, 0, 0, 1, 1,
1.32223, -0.7464092, 2.286893, 0, 0, 0, 1, 1,
1.329458, -1.732186, 1.957551, 0, 0, 0, 1, 1,
1.330152, 0.2944938, 0.3796247, 0, 0, 0, 1, 1,
1.339661, 0.6192166, 0.0878604, 0, 0, 0, 1, 1,
1.357752, -0.3783544, 1.651668, 0, 0, 0, 1, 1,
1.358631, 0.03859111, 1.457544, 0, 0, 0, 1, 1,
1.36349, -1.141282, 3.399726, 1, 1, 1, 1, 1,
1.365979, -0.714079, 1.171573, 1, 1, 1, 1, 1,
1.36816, -1.138497, 1.368719, 1, 1, 1, 1, 1,
1.368947, -1.721481, 2.45959, 1, 1, 1, 1, 1,
1.375067, -1.947404, 3.104002, 1, 1, 1, 1, 1,
1.375443, -0.4274989, 2.117563, 1, 1, 1, 1, 1,
1.375516, -0.05876697, 1.707518, 1, 1, 1, 1, 1,
1.375859, 1.103556, 1.291068, 1, 1, 1, 1, 1,
1.378618, 0.3275061, 1.868213, 1, 1, 1, 1, 1,
1.378796, -1.100132, 3.555607, 1, 1, 1, 1, 1,
1.401921, -0.3104789, 2.878367, 1, 1, 1, 1, 1,
1.413977, -0.1275292, 2.297012, 1, 1, 1, 1, 1,
1.421219, -0.9053485, 2.080647, 1, 1, 1, 1, 1,
1.426612, 0.2680605, 2.7684, 1, 1, 1, 1, 1,
1.429149, 1.170855, 0.9938883, 1, 1, 1, 1, 1,
1.430585, -0.06699231, 2.244875, 0, 0, 1, 1, 1,
1.432101, -1.494264, 0.4379388, 1, 0, 0, 1, 1,
1.43503, 0.2455913, 1.668503, 1, 0, 0, 1, 1,
1.452309, 0.6911432, 2.026606, 1, 0, 0, 1, 1,
1.456233, 0.4984846, 1.358122, 1, 0, 0, 1, 1,
1.463379, -1.321189, 3.657672, 1, 0, 0, 1, 1,
1.471117, 0.1316544, 1.312714, 0, 0, 0, 1, 1,
1.491748, -0.04659189, 1.851508, 0, 0, 0, 1, 1,
1.49898, -0.2111542, 2.457237, 0, 0, 0, 1, 1,
1.501718, -0.8363313, -0.1038171, 0, 0, 0, 1, 1,
1.504658, -0.645746, 2.32425, 0, 0, 0, 1, 1,
1.507537, -0.2126232, 2.053084, 0, 0, 0, 1, 1,
1.510899, 0.8622317, 1.321756, 0, 0, 0, 1, 1,
1.515929, -0.457977, 1.391286, 1, 1, 1, 1, 1,
1.519498, -1.956776, 3.64813, 1, 1, 1, 1, 1,
1.519763, -0.9864322, 3.036196, 1, 1, 1, 1, 1,
1.528672, -0.5318996, 2.631593, 1, 1, 1, 1, 1,
1.555242, -0.2422293, 1.982641, 1, 1, 1, 1, 1,
1.557208, 0.300637, 3.592534, 1, 1, 1, 1, 1,
1.557457, -1.019492, 1.701049, 1, 1, 1, 1, 1,
1.558222, 0.6059977, 0.3072633, 1, 1, 1, 1, 1,
1.561422, 2.674459, 0.9999928, 1, 1, 1, 1, 1,
1.566599, 0.04814918, 3.095956, 1, 1, 1, 1, 1,
1.576942, -0.6693555, 1.286612, 1, 1, 1, 1, 1,
1.58119, 1.713133, -1.846236, 1, 1, 1, 1, 1,
1.59086, 1.144765, 0.3657977, 1, 1, 1, 1, 1,
1.590875, -1.117185, 2.997696, 1, 1, 1, 1, 1,
1.599344, 0.3611694, 2.56345, 1, 1, 1, 1, 1,
1.605751, -0.1325712, 1.959981, 0, 0, 1, 1, 1,
1.621459, 0.5819995, 1.454815, 1, 0, 0, 1, 1,
1.654246, 0.3221994, 0.5274951, 1, 0, 0, 1, 1,
1.665782, -0.03010815, 4.011977, 1, 0, 0, 1, 1,
1.673258, 0.2339744, 0.3219055, 1, 0, 0, 1, 1,
1.680761, 1.423425, 1.58107, 1, 0, 0, 1, 1,
1.696885, -0.7736754, 1.669576, 0, 0, 0, 1, 1,
1.707201, 2.24526, 0.1094159, 0, 0, 0, 1, 1,
1.713627, -0.1851408, 1.783481, 0, 0, 0, 1, 1,
1.72172, -0.5220412, 3.190329, 0, 0, 0, 1, 1,
1.733302, 0.1293496, -0.1515099, 0, 0, 0, 1, 1,
1.757031, 0.2320876, 0.6401094, 0, 0, 0, 1, 1,
1.76686, 0.429893, 1.848395, 0, 0, 0, 1, 1,
1.772469, -0.896212, 0.8296666, 1, 1, 1, 1, 1,
1.782022, 1.017129, 1.529603, 1, 1, 1, 1, 1,
1.797389, -0.968313, 0.1403887, 1, 1, 1, 1, 1,
1.79799, 1.87655, 0.5245234, 1, 1, 1, 1, 1,
1.837082, -0.7657372, -0.8209299, 1, 1, 1, 1, 1,
1.840974, 0.9663298, 0.4436183, 1, 1, 1, 1, 1,
1.876871, -0.7636783, 2.102793, 1, 1, 1, 1, 1,
1.896815, 0.010768, 0.4083868, 1, 1, 1, 1, 1,
1.901546, -0.1467977, 1.827406, 1, 1, 1, 1, 1,
1.916274, -0.8225577, 1.653553, 1, 1, 1, 1, 1,
1.933674, -1.010261, 1.829962, 1, 1, 1, 1, 1,
1.940335, -0.1130943, 0.69697, 1, 1, 1, 1, 1,
1.942986, -1.037102, 2.888731, 1, 1, 1, 1, 1,
2.001151, 0.2030431, 0.1317716, 1, 1, 1, 1, 1,
2.004503, -0.8283741, 1.398514, 1, 1, 1, 1, 1,
2.01309, -0.3513128, 3.355445, 0, 0, 1, 1, 1,
2.049193, 1.199692, 1.940251, 1, 0, 0, 1, 1,
2.052957, -0.5773219, 1.922762, 1, 0, 0, 1, 1,
2.065253, 0.194393, 3.174315, 1, 0, 0, 1, 1,
2.068658, -0.8070782, 1.688941, 1, 0, 0, 1, 1,
2.079791, 0.6855748, 0.6909236, 1, 0, 0, 1, 1,
2.161235, 0.6007836, 2.107203, 0, 0, 0, 1, 1,
2.183277, -0.2555972, 0.3848565, 0, 0, 0, 1, 1,
2.188932, 0.2927373, 2.402866, 0, 0, 0, 1, 1,
2.219838, -0.02760125, 2.755328, 0, 0, 0, 1, 1,
2.232808, 1.365726, 2.28929, 0, 0, 0, 1, 1,
2.353679, -0.5620028, 0.6205491, 0, 0, 0, 1, 1,
2.3853, 1.205912, -0.2523383, 0, 0, 0, 1, 1,
2.437648, -0.268542, 3.438375, 1, 1, 1, 1, 1,
2.775495, -3.372202, 2.325291, 1, 1, 1, 1, 1,
2.873961, -1.362795, 2.258026, 1, 1, 1, 1, 1,
2.927728, -0.2901613, 1.040134, 1, 1, 1, 1, 1,
2.934646, 2.297397, 0.3030249, 1, 1, 1, 1, 1,
2.96613, 1.576297, 0.181636, 1, 1, 1, 1, 1,
3.171185, -1.478997, 3.082333, 1, 1, 1, 1, 1
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
var radius = 9.226158;
var distance = 32.40649;
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
mvMatrix.translate( -0.0573225, 0.2899023, 0.2227316 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.40649);
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
