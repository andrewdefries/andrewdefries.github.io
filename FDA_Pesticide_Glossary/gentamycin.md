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
-3.707872, 0.5109931, 0.1922245, 1, 0, 0, 1,
-2.977294, 0.4508644, -1.546569, 1, 0.007843138, 0, 1,
-2.623012, -0.433741, -0.1170159, 1, 0.01176471, 0, 1,
-2.600976, 0.7756442, -1.917261, 1, 0.01960784, 0, 1,
-2.579271, 1.886091, -1.876624, 1, 0.02352941, 0, 1,
-2.577172, 2.726302, -0.5475178, 1, 0.03137255, 0, 1,
-2.46989, -0.8900896, -2.084279, 1, 0.03529412, 0, 1,
-2.447767, -1.64051, -3.192111, 1, 0.04313726, 0, 1,
-2.447517, 1.394627, -0.9006227, 1, 0.04705882, 0, 1,
-2.352905, -1.028867, 0.4497848, 1, 0.05490196, 0, 1,
-2.320415, -0.0829347, -1.167116, 1, 0.05882353, 0, 1,
-2.227032, 0.05429796, -0.5878206, 1, 0.06666667, 0, 1,
-2.181838, 0.09076032, -0.1045803, 1, 0.07058824, 0, 1,
-2.171224, 0.2423177, -3.453187, 1, 0.07843138, 0, 1,
-2.105742, 0.8276245, -2.119079, 1, 0.08235294, 0, 1,
-2.103832, -0.4467675, -0.1372277, 1, 0.09019608, 0, 1,
-2.089866, 0.2485657, -1.642911, 1, 0.09411765, 0, 1,
-2.087797, 0.2677209, -1.815606, 1, 0.1019608, 0, 1,
-2.082322, 0.962337, -0.9558159, 1, 0.1098039, 0, 1,
-2.06766, -0.7962613, -2.560966, 1, 0.1137255, 0, 1,
-2.046703, -0.8544493, -0.4476853, 1, 0.1215686, 0, 1,
-2.022253, 0.6851058, -1.196473, 1, 0.1254902, 0, 1,
-2.018518, 0.007877599, -2.087079, 1, 0.1333333, 0, 1,
-1.926209, -2.702976, -1.473339, 1, 0.1372549, 0, 1,
-1.924617, -1.72403, -2.126858, 1, 0.145098, 0, 1,
-1.919164, 1.526849, -0.7149673, 1, 0.1490196, 0, 1,
-1.918859, -0.5752941, -0.02601322, 1, 0.1568628, 0, 1,
-1.900989, -1.329652, -1.010334, 1, 0.1607843, 0, 1,
-1.890813, 0.899935, -1.135973, 1, 0.1686275, 0, 1,
-1.837184, -0.7237427, -3.208137, 1, 0.172549, 0, 1,
-1.824354, -0.4835244, -1.134485, 1, 0.1803922, 0, 1,
-1.809045, 0.9064072, -1.178018, 1, 0.1843137, 0, 1,
-1.808915, -1.803418, -1.575294, 1, 0.1921569, 0, 1,
-1.806658, 0.08990504, -0.9498803, 1, 0.1960784, 0, 1,
-1.804884, 0.8510259, -2.141022, 1, 0.2039216, 0, 1,
-1.788427, -0.3438596, -4.493366, 1, 0.2117647, 0, 1,
-1.776645, 0.2917709, -1.394451, 1, 0.2156863, 0, 1,
-1.774122, -1.989448, -0.7076765, 1, 0.2235294, 0, 1,
-1.763748, -0.4095311, -0.7849112, 1, 0.227451, 0, 1,
-1.752285, 0.9399928, 0.7603966, 1, 0.2352941, 0, 1,
-1.744496, -0.9144213, -1.880589, 1, 0.2392157, 0, 1,
-1.742699, -0.680393, -1.600564, 1, 0.2470588, 0, 1,
-1.742329, 0.9597419, -1.290096, 1, 0.2509804, 0, 1,
-1.732385, 0.3482752, -0.2894607, 1, 0.2588235, 0, 1,
-1.726059, 0.198514, -0.8171592, 1, 0.2627451, 0, 1,
-1.714115, -0.6830825, -1.370015, 1, 0.2705882, 0, 1,
-1.671531, 1.521432, -1.121392, 1, 0.2745098, 0, 1,
-1.653145, 0.2810763, 0.5485746, 1, 0.282353, 0, 1,
-1.637, 0.7016751, -1.672169, 1, 0.2862745, 0, 1,
-1.630225, -0.04834051, -0.4994134, 1, 0.2941177, 0, 1,
-1.613669, 0.7015797, -1.547476, 1, 0.3019608, 0, 1,
-1.612858, -1.528265, -2.641758, 1, 0.3058824, 0, 1,
-1.591161, 1.558374, -0.4320366, 1, 0.3137255, 0, 1,
-1.58762, 0.8327913, -0.7250132, 1, 0.3176471, 0, 1,
-1.576522, -1.833187, -2.995759, 1, 0.3254902, 0, 1,
-1.576248, 0.6454801, -3.136299, 1, 0.3294118, 0, 1,
-1.575324, 0.6691426, -2.268183, 1, 0.3372549, 0, 1,
-1.567005, 0.6742607, -2.788558, 1, 0.3411765, 0, 1,
-1.566719, -0.6549761, 0.3622855, 1, 0.3490196, 0, 1,
-1.564119, -0.2579324, -1.768039, 1, 0.3529412, 0, 1,
-1.560144, 0.54206, -0.9389713, 1, 0.3607843, 0, 1,
-1.559958, 2.554777, 1.424389, 1, 0.3647059, 0, 1,
-1.558609, -1.578439, -2.046209, 1, 0.372549, 0, 1,
-1.552411, -1.297803, -2.751624, 1, 0.3764706, 0, 1,
-1.551424, -1.17009, -2.176107, 1, 0.3843137, 0, 1,
-1.535821, -1.307949, -0.3178013, 1, 0.3882353, 0, 1,
-1.531044, -0.4943723, 0.08269741, 1, 0.3960784, 0, 1,
-1.500537, 0.6861412, -1.516816, 1, 0.4039216, 0, 1,
-1.480967, -0.5243082, -1.572261, 1, 0.4078431, 0, 1,
-1.464143, 1.197671, 0.9398283, 1, 0.4156863, 0, 1,
-1.462482, 0.4998707, -2.122703, 1, 0.4196078, 0, 1,
-1.462127, 0.6444236, -0.4441676, 1, 0.427451, 0, 1,
-1.456002, 0.1525044, -1.6081, 1, 0.4313726, 0, 1,
-1.443874, 0.2174419, -0.7893124, 1, 0.4392157, 0, 1,
-1.436902, -0.08720091, -1.103836, 1, 0.4431373, 0, 1,
-1.431648, -1.072814, -2.787663, 1, 0.4509804, 0, 1,
-1.427698, 2.301483, -1.602972, 1, 0.454902, 0, 1,
-1.425092, 0.342976, -3.067156, 1, 0.4627451, 0, 1,
-1.41795, -2.571743, 0.05869276, 1, 0.4666667, 0, 1,
-1.417744, -0.7560638, -1.624491, 1, 0.4745098, 0, 1,
-1.415754, 2.313063, -0.2010695, 1, 0.4784314, 0, 1,
-1.40739, 0.7795415, -2.321946, 1, 0.4862745, 0, 1,
-1.406931, 1.054469, -1.857782, 1, 0.4901961, 0, 1,
-1.39642, -0.261977, -1.629048, 1, 0.4980392, 0, 1,
-1.392545, -1.303622, -2.703517, 1, 0.5058824, 0, 1,
-1.389357, -1.366705, -0.4659675, 1, 0.509804, 0, 1,
-1.38523, -0.5225874, -2.459886, 1, 0.5176471, 0, 1,
-1.374173, 0.8168973, -1.141388, 1, 0.5215687, 0, 1,
-1.37221, -1.313709, -1.824866, 1, 0.5294118, 0, 1,
-1.370017, 0.1212208, -3.287302, 1, 0.5333334, 0, 1,
-1.339261, 0.3188792, -3.079141, 1, 0.5411765, 0, 1,
-1.338955, -1.110474, -4.444948, 1, 0.5450981, 0, 1,
-1.331391, 1.659894, -1.48204, 1, 0.5529412, 0, 1,
-1.330735, -1.535498, -0.1224154, 1, 0.5568628, 0, 1,
-1.310524, 0.8525399, -0.6392773, 1, 0.5647059, 0, 1,
-1.308203, -1.419076, -3.429003, 1, 0.5686275, 0, 1,
-1.302065, -0.5942058, -1.436316, 1, 0.5764706, 0, 1,
-1.296944, 1.075835, -2.761281, 1, 0.5803922, 0, 1,
-1.29552, 0.5155714, 1.253748, 1, 0.5882353, 0, 1,
-1.28927, 0.2372932, -0.00615544, 1, 0.5921569, 0, 1,
-1.277764, 0.3835901, -2.765087, 1, 0.6, 0, 1,
-1.276426, 1.169518, -0.4185217, 1, 0.6078432, 0, 1,
-1.266207, 1.52948, -0.1270126, 1, 0.6117647, 0, 1,
-1.264675, 0.009816791, -0.7653776, 1, 0.6196079, 0, 1,
-1.255715, 0.1976012, -1.738523, 1, 0.6235294, 0, 1,
-1.25299, -0.8224056, -2.52949, 1, 0.6313726, 0, 1,
-1.251364, 2.177975, -0.5023624, 1, 0.6352941, 0, 1,
-1.238451, -1.989569, -2.628514, 1, 0.6431373, 0, 1,
-1.237139, 1.249447, -0.238616, 1, 0.6470588, 0, 1,
-1.232843, 0.3787622, -0.9460199, 1, 0.654902, 0, 1,
-1.226592, -0.2394108, -2.226522, 1, 0.6588235, 0, 1,
-1.226063, -0.6926132, -0.4966639, 1, 0.6666667, 0, 1,
-1.225548, 0.1445661, -1.621949, 1, 0.6705883, 0, 1,
-1.219203, 0.3627513, -0.973638, 1, 0.6784314, 0, 1,
-1.217039, -0.003154799, -2.13634, 1, 0.682353, 0, 1,
-1.201554, 0.554899, -1.107635, 1, 0.6901961, 0, 1,
-1.190471, -0.7027807, -1.181402, 1, 0.6941177, 0, 1,
-1.189558, -2.027476, -3.287648, 1, 0.7019608, 0, 1,
-1.187182, 0.3422354, -0.7002477, 1, 0.7098039, 0, 1,
-1.186448, -0.733085, -2.928591, 1, 0.7137255, 0, 1,
-1.184077, -1.363613, -1.144452, 1, 0.7215686, 0, 1,
-1.178318, 0.9128808, -1.091254, 1, 0.7254902, 0, 1,
-1.175389, 0.5709329, -1.400989, 1, 0.7333333, 0, 1,
-1.16343, -0.4438607, -2.437997, 1, 0.7372549, 0, 1,
-1.159738, 1.046405, -2.124599, 1, 0.7450981, 0, 1,
-1.150148, -0.4693313, -1.648111, 1, 0.7490196, 0, 1,
-1.145708, 1.21202, 0.2151741, 1, 0.7568628, 0, 1,
-1.143207, 0.002290371, -3.145825, 1, 0.7607843, 0, 1,
-1.131293, 0.814957, -0.09607887, 1, 0.7686275, 0, 1,
-1.128699, -0.2241116, -4.381033, 1, 0.772549, 0, 1,
-1.125662, -0.3812511, -2.61126, 1, 0.7803922, 0, 1,
-1.119859, -0.867209, -2.314577, 1, 0.7843137, 0, 1,
-1.115817, -0.115572, -2.118803, 1, 0.7921569, 0, 1,
-1.104515, 1.501809, -0.6523168, 1, 0.7960784, 0, 1,
-1.103408, 0.2055018, 0.0464788, 1, 0.8039216, 0, 1,
-1.101963, 1.049964, -1.086213, 1, 0.8117647, 0, 1,
-1.100333, 1.559628, 0.596891, 1, 0.8156863, 0, 1,
-1.097129, -2.454741, -2.26156, 1, 0.8235294, 0, 1,
-1.095319, 1.293197, -1.850798, 1, 0.827451, 0, 1,
-1.094894, -0.5270786, -2.355676, 1, 0.8352941, 0, 1,
-1.088589, 1.961771, 1.162825, 1, 0.8392157, 0, 1,
-1.086785, 1.00955, -0.9508336, 1, 0.8470588, 0, 1,
-1.084466, 1.033535, -1.187947, 1, 0.8509804, 0, 1,
-1.083339, -1.170185, -2.00737, 1, 0.8588235, 0, 1,
-1.078948, 0.008722097, -1.912488, 1, 0.8627451, 0, 1,
-1.07359, -0.7010905, -1.136317, 1, 0.8705882, 0, 1,
-1.072793, 0.3581976, 0.2641796, 1, 0.8745098, 0, 1,
-1.069109, 2.404384, -0.1852813, 1, 0.8823529, 0, 1,
-1.065339, -2.230189, -2.224521, 1, 0.8862745, 0, 1,
-1.064825, -0.00431332, -1.022183, 1, 0.8941177, 0, 1,
-1.060705, -0.2960597, -2.460846, 1, 0.8980392, 0, 1,
-1.055186, 0.1666097, -1.64528, 1, 0.9058824, 0, 1,
-1.05325, 0.8263893, -0.2411701, 1, 0.9137255, 0, 1,
-1.049345, 1.08683, 0.06026874, 1, 0.9176471, 0, 1,
-1.043559, -0.0764844, -0.4319019, 1, 0.9254902, 0, 1,
-1.042209, 0.5276898, 0.521734, 1, 0.9294118, 0, 1,
-1.040701, 0.2037784, -1.13793, 1, 0.9372549, 0, 1,
-1.036868, -0.3200302, -2.332547, 1, 0.9411765, 0, 1,
-1.035871, 0.3682264, -0.7079369, 1, 0.9490196, 0, 1,
-1.029496, 0.1260067, -1.01728, 1, 0.9529412, 0, 1,
-1.02253, -0.6840779, -1.983003, 1, 0.9607843, 0, 1,
-1.018999, -0.3571807, -1.725748, 1, 0.9647059, 0, 1,
-1.016246, 0.3981508, -0.9701239, 1, 0.972549, 0, 1,
-1.010854, -1.04239, -2.347698, 1, 0.9764706, 0, 1,
-1.008468, 0.8489864, -1.09324, 1, 0.9843137, 0, 1,
-0.9976221, -0.4739524, -0.9157189, 1, 0.9882353, 0, 1,
-0.993885, -0.3011802, -1.551925, 1, 0.9960784, 0, 1,
-0.9710488, 0.7211515, -0.8813163, 0.9960784, 1, 0, 1,
-0.9700162, -1.393335, -1.651803, 0.9921569, 1, 0, 1,
-0.9652053, -0.1683338, 0.03142213, 0.9843137, 1, 0, 1,
-0.9610725, 0.8257182, 0.8645539, 0.9803922, 1, 0, 1,
-0.9584455, -0.3639966, -3.153963, 0.972549, 1, 0, 1,
-0.9572578, -0.00560838, -2.90356, 0.9686275, 1, 0, 1,
-0.9447316, 0.7067327, -0.6605517, 0.9607843, 1, 0, 1,
-0.9442469, 1.683207, -0.0799557, 0.9568627, 1, 0, 1,
-0.9424927, 0.7804931, -0.5819556, 0.9490196, 1, 0, 1,
-0.9404418, 0.7387055, -1.833636, 0.945098, 1, 0, 1,
-0.9391971, -0.8461099, -2.788004, 0.9372549, 1, 0, 1,
-0.9339765, 0.1587223, -1.016244, 0.9333333, 1, 0, 1,
-0.9327686, 0.1889243, -0.7475802, 0.9254902, 1, 0, 1,
-0.9220474, 1.827327, -0.2579815, 0.9215686, 1, 0, 1,
-0.9153934, -0.2946856, -2.480865, 0.9137255, 1, 0, 1,
-0.9128727, 0.05677326, -2.533792, 0.9098039, 1, 0, 1,
-0.9091037, -1.263201, -3.802595, 0.9019608, 1, 0, 1,
-0.9088845, 0.1703116, -1.195544, 0.8941177, 1, 0, 1,
-0.9083904, 0.5794146, 1.352735, 0.8901961, 1, 0, 1,
-0.8987159, 0.2594394, -2.719611, 0.8823529, 1, 0, 1,
-0.8967434, 1.454415, -1.072444, 0.8784314, 1, 0, 1,
-0.8927412, -0.6205236, -2.922219, 0.8705882, 1, 0, 1,
-0.891426, 1.035872, 0.816755, 0.8666667, 1, 0, 1,
-0.8911262, -1.628444, -2.584615, 0.8588235, 1, 0, 1,
-0.8801697, 0.4279537, -1.893265, 0.854902, 1, 0, 1,
-0.8786309, 0.3380837, -4.311572, 0.8470588, 1, 0, 1,
-0.875944, 0.1822261, -3.579718, 0.8431373, 1, 0, 1,
-0.8746158, 0.5546062, -2.768735, 0.8352941, 1, 0, 1,
-0.8740315, 2.385906, -1.386507, 0.8313726, 1, 0, 1,
-0.8695462, 0.1293741, -0.996056, 0.8235294, 1, 0, 1,
-0.8672688, 1.220804, -0.9785372, 0.8196079, 1, 0, 1,
-0.8621638, -0.8174223, -3.331142, 0.8117647, 1, 0, 1,
-0.8599269, 0.9363919, -0.6156846, 0.8078431, 1, 0, 1,
-0.8568604, -0.4797941, -1.617696, 0.8, 1, 0, 1,
-0.8526784, -1.077044, -2.34828, 0.7921569, 1, 0, 1,
-0.8480491, 0.8817334, -1.454146, 0.7882353, 1, 0, 1,
-0.8462681, -0.0583394, -1.498713, 0.7803922, 1, 0, 1,
-0.8447236, -1.062147, -2.157553, 0.7764706, 1, 0, 1,
-0.841044, -1.380698, -3.855068, 0.7686275, 1, 0, 1,
-0.8394885, 1.073476, -0.5254084, 0.7647059, 1, 0, 1,
-0.8366219, -1.585787, -2.98435, 0.7568628, 1, 0, 1,
-0.8361365, 1.398402, -1.31048, 0.7529412, 1, 0, 1,
-0.8327193, 0.03926273, 0.6164448, 0.7450981, 1, 0, 1,
-0.8315767, 1.027107, 0.8925048, 0.7411765, 1, 0, 1,
-0.8306762, -1.065964, -4.350094, 0.7333333, 1, 0, 1,
-0.8303516, -0.4111453, -2.654966, 0.7294118, 1, 0, 1,
-0.82455, 0.5983238, -1.216586, 0.7215686, 1, 0, 1,
-0.8202699, -1.296449, -1.417298, 0.7176471, 1, 0, 1,
-0.8154484, -0.1077187, -2.74805, 0.7098039, 1, 0, 1,
-0.8138033, 0.1945569, -0.5659806, 0.7058824, 1, 0, 1,
-0.8135803, 0.3435531, -0.9171608, 0.6980392, 1, 0, 1,
-0.8107186, -0.08121012, -2.383538, 0.6901961, 1, 0, 1,
-0.8079566, -0.6224242, -1.749303, 0.6862745, 1, 0, 1,
-0.8072339, -0.3232849, -1.379626, 0.6784314, 1, 0, 1,
-0.8015025, -0.7752591, -0.888392, 0.6745098, 1, 0, 1,
-0.7978845, 0.4811249, -0.6941098, 0.6666667, 1, 0, 1,
-0.795197, -0.8867899, -2.783054, 0.6627451, 1, 0, 1,
-0.7911826, 1.082222, -1.306457, 0.654902, 1, 0, 1,
-0.7862254, 0.8286851, 0.9559445, 0.6509804, 1, 0, 1,
-0.7823877, 0.4587031, -1.169079, 0.6431373, 1, 0, 1,
-0.7789285, -0.3547492, -3.220356, 0.6392157, 1, 0, 1,
-0.7751676, 1.056221, -2.245719, 0.6313726, 1, 0, 1,
-0.7751649, 0.1957108, -1.310097, 0.627451, 1, 0, 1,
-0.7749609, 1.405841, -0.557642, 0.6196079, 1, 0, 1,
-0.7727481, -0.3024395, -1.478979, 0.6156863, 1, 0, 1,
-0.7690355, 0.5521538, 0.1919201, 0.6078432, 1, 0, 1,
-0.7654305, -1.111111, -2.959751, 0.6039216, 1, 0, 1,
-0.7621927, -1.224579, -0.2758909, 0.5960785, 1, 0, 1,
-0.7619735, -1.123277, -1.509215, 0.5882353, 1, 0, 1,
-0.7579396, 0.4867513, -0.5275792, 0.5843138, 1, 0, 1,
-0.7522977, -0.7058425, -1.205938, 0.5764706, 1, 0, 1,
-0.7509767, -0.02017904, -2.547879, 0.572549, 1, 0, 1,
-0.7474728, 1.620966, 1.084582, 0.5647059, 1, 0, 1,
-0.7419656, 1.081044, -1.567919, 0.5607843, 1, 0, 1,
-0.7394752, 1.422595, -0.771364, 0.5529412, 1, 0, 1,
-0.7379377, 0.825555, 0.9187387, 0.5490196, 1, 0, 1,
-0.7373775, -0.4545282, 0.01083842, 0.5411765, 1, 0, 1,
-0.7365906, 0.05178249, -2.282826, 0.5372549, 1, 0, 1,
-0.7352329, 0.2397048, -1.957287, 0.5294118, 1, 0, 1,
-0.7344617, -1.056106, -3.620898, 0.5254902, 1, 0, 1,
-0.7250782, -0.5456467, -2.641994, 0.5176471, 1, 0, 1,
-0.7174208, -1.769644, -3.733914, 0.5137255, 1, 0, 1,
-0.7160487, 0.9877735, -0.7457917, 0.5058824, 1, 0, 1,
-0.7122783, 1.053108, -1.761132, 0.5019608, 1, 0, 1,
-0.7111035, 0.07481461, -1.578207, 0.4941176, 1, 0, 1,
-0.7083143, -0.5332763, -2.137653, 0.4862745, 1, 0, 1,
-0.708096, -0.7074137, -2.539128, 0.4823529, 1, 0, 1,
-0.7056499, 0.4600236, -0.6265745, 0.4745098, 1, 0, 1,
-0.7052934, -0.5177438, -2.281879, 0.4705882, 1, 0, 1,
-0.7033547, 1.335845, 0.4991903, 0.4627451, 1, 0, 1,
-0.7005493, 0.4687441, -0.4604504, 0.4588235, 1, 0, 1,
-0.7000879, -0.5655546, -2.638307, 0.4509804, 1, 0, 1,
-0.7000476, -0.02874111, -1.940599, 0.4470588, 1, 0, 1,
-0.6987416, -1.224342, -2.291996, 0.4392157, 1, 0, 1,
-0.6972242, -0.8229455, -1.903006, 0.4352941, 1, 0, 1,
-0.6964644, 1.676333, -0.5642135, 0.427451, 1, 0, 1,
-0.6945388, 0.7320339, -0.6232547, 0.4235294, 1, 0, 1,
-0.6931247, -1.114539, -3.430548, 0.4156863, 1, 0, 1,
-0.6873716, -0.1790342, -1.608034, 0.4117647, 1, 0, 1,
-0.6862562, 0.1134425, 0.2202558, 0.4039216, 1, 0, 1,
-0.685849, 1.153382, 0.01363307, 0.3960784, 1, 0, 1,
-0.6800284, 0.1604541, -0.9260702, 0.3921569, 1, 0, 1,
-0.6793517, -1.090582, -2.390025, 0.3843137, 1, 0, 1,
-0.6743668, 0.6510953, -0.3709325, 0.3803922, 1, 0, 1,
-0.6709958, -1.183238, -3.343434, 0.372549, 1, 0, 1,
-0.6693706, -1.148106, -1.856601, 0.3686275, 1, 0, 1,
-0.6688569, 1.665994, -1.303113, 0.3607843, 1, 0, 1,
-0.662532, 0.07752758, -1.726655, 0.3568628, 1, 0, 1,
-0.6374792, 1.860402, 0.9601965, 0.3490196, 1, 0, 1,
-0.6272619, 0.3869011, -1.40072, 0.345098, 1, 0, 1,
-0.6214047, 0.6813242, -1.118008, 0.3372549, 1, 0, 1,
-0.620998, 1.19876, -0.647832, 0.3333333, 1, 0, 1,
-0.6197201, 0.3732636, -0.4481828, 0.3254902, 1, 0, 1,
-0.618627, 0.06117608, -1.989679, 0.3215686, 1, 0, 1,
-0.6179559, 0.643275, -1.911014, 0.3137255, 1, 0, 1,
-0.6076661, 0.7821035, -1.646588, 0.3098039, 1, 0, 1,
-0.6057549, -1.013291, -1.643116, 0.3019608, 1, 0, 1,
-0.5990728, -0.4115197, -2.638974, 0.2941177, 1, 0, 1,
-0.5933938, -1.009479, -2.186852, 0.2901961, 1, 0, 1,
-0.592303, 0.006165937, 0.2299646, 0.282353, 1, 0, 1,
-0.5909961, 0.360403, -2.417055, 0.2784314, 1, 0, 1,
-0.5909753, 1.748587, -0.349158, 0.2705882, 1, 0, 1,
-0.5874106, 1.195027, 0.7893466, 0.2666667, 1, 0, 1,
-0.5872918, 1.500666, -0.3676018, 0.2588235, 1, 0, 1,
-0.5872443, 0.6835816, -1.57165, 0.254902, 1, 0, 1,
-0.575737, -0.3999796, -3.032492, 0.2470588, 1, 0, 1,
-0.5724249, -1.331386, -3.181098, 0.2431373, 1, 0, 1,
-0.5710827, 0.288539, -0.6100259, 0.2352941, 1, 0, 1,
-0.5702298, -0.8280382, -2.105109, 0.2313726, 1, 0, 1,
-0.5685576, -0.3122009, -1.598553, 0.2235294, 1, 0, 1,
-0.5670642, -0.3778726, -0.2366435, 0.2196078, 1, 0, 1,
-0.5652949, 1.231344, -0.2884654, 0.2117647, 1, 0, 1,
-0.5636178, -1.475427, -1.548378, 0.2078431, 1, 0, 1,
-0.5632859, 0.2942121, -0.3423682, 0.2, 1, 0, 1,
-0.5610985, -0.878648, -1.912617, 0.1921569, 1, 0, 1,
-0.5600402, -0.1520804, -2.70485, 0.1882353, 1, 0, 1,
-0.5581728, -1.148552, -2.7054, 0.1803922, 1, 0, 1,
-0.5506927, 0.05415732, -3.605822, 0.1764706, 1, 0, 1,
-0.5498326, -0.6759821, -2.149677, 0.1686275, 1, 0, 1,
-0.5473687, 0.09302786, -1.47789, 0.1647059, 1, 0, 1,
-0.5417253, 1.185873, -0.9291313, 0.1568628, 1, 0, 1,
-0.5331908, -0.8676338, 0.8180668, 0.1529412, 1, 0, 1,
-0.5325966, 0.1238968, -2.752, 0.145098, 1, 0, 1,
-0.5275632, 0.2832868, -2.32097, 0.1411765, 1, 0, 1,
-0.5271672, -0.8183684, -1.424417, 0.1333333, 1, 0, 1,
-0.5244641, 1.018683, -2.351736, 0.1294118, 1, 0, 1,
-0.5210664, -0.2115609, -2.017557, 0.1215686, 1, 0, 1,
-0.5131775, -0.02512414, -0.9090239, 0.1176471, 1, 0, 1,
-0.5085737, 2.326215, -2.996161, 0.1098039, 1, 0, 1,
-0.5085083, -0.8044388, -1.565373, 0.1058824, 1, 0, 1,
-0.4984268, -1.796129, -1.480735, 0.09803922, 1, 0, 1,
-0.4933505, -1.556209, -4.026326, 0.09019608, 1, 0, 1,
-0.4912801, 1.082981, -0.9298041, 0.08627451, 1, 0, 1,
-0.4901082, 1.089248, 0.8838614, 0.07843138, 1, 0, 1,
-0.4841211, 0.09572149, -3.334546, 0.07450981, 1, 0, 1,
-0.4822212, 1.574888, -0.1961838, 0.06666667, 1, 0, 1,
-0.4771939, 0.4786149, -1.407822, 0.0627451, 1, 0, 1,
-0.4761955, 1.625125, 0.4422221, 0.05490196, 1, 0, 1,
-0.4695533, -2.15744, -2.850383, 0.05098039, 1, 0, 1,
-0.4691315, -0.3163741, -2.685452, 0.04313726, 1, 0, 1,
-0.4680458, -0.6753137, -2.171907, 0.03921569, 1, 0, 1,
-0.4634117, -0.1947496, 0.9327174, 0.03137255, 1, 0, 1,
-0.4630162, 0.08041044, -2.59252, 0.02745098, 1, 0, 1,
-0.4617567, 0.806391, -0.728174, 0.01960784, 1, 0, 1,
-0.45996, -1.340247, -3.097369, 0.01568628, 1, 0, 1,
-0.4563153, 0.7551673, -0.6753706, 0.007843138, 1, 0, 1,
-0.4557262, 0.434126, -0.6640466, 0.003921569, 1, 0, 1,
-0.4532186, -1.89895, -3.411393, 0, 1, 0.003921569, 1,
-0.4526826, -1.09254, -2.2785, 0, 1, 0.01176471, 1,
-0.4486245, 0.6749622, -0.5569857, 0, 1, 0.01568628, 1,
-0.4482587, -1.643635, -2.594389, 0, 1, 0.02352941, 1,
-0.4452604, 0.6130066, -1.111218, 0, 1, 0.02745098, 1,
-0.4444872, 0.7479956, -0.18607, 0, 1, 0.03529412, 1,
-0.4419928, 0.6610939, -0.2914897, 0, 1, 0.03921569, 1,
-0.4412265, -0.3420429, -3.066621, 0, 1, 0.04705882, 1,
-0.4387122, -2.283329, -5.074804, 0, 1, 0.05098039, 1,
-0.4330969, 0.8859956, -0.3389286, 0, 1, 0.05882353, 1,
-0.4318851, 1.598889, 1.044116, 0, 1, 0.0627451, 1,
-0.4274628, 0.2607231, -1.61466, 0, 1, 0.07058824, 1,
-0.4257654, -0.2315599, -1.402786, 0, 1, 0.07450981, 1,
-0.4204996, 1.888718, -0.6057016, 0, 1, 0.08235294, 1,
-0.4186467, -1.079473, -1.602228, 0, 1, 0.08627451, 1,
-0.4119391, -0.2253084, -2.447353, 0, 1, 0.09411765, 1,
-0.4113547, -0.3916058, -2.791819, 0, 1, 0.1019608, 1,
-0.4082148, -0.8192195, -2.939916, 0, 1, 0.1058824, 1,
-0.4060174, 2.246159, 0.2647628, 0, 1, 0.1137255, 1,
-0.4016732, 1.521086, -0.559783, 0, 1, 0.1176471, 1,
-0.4011529, -0.7506702, -4.400525, 0, 1, 0.1254902, 1,
-0.3967761, 1.085698, -1.399077, 0, 1, 0.1294118, 1,
-0.3967537, -0.5764182, -3.014853, 0, 1, 0.1372549, 1,
-0.3943759, -0.9971431, -1.448218, 0, 1, 0.1411765, 1,
-0.3935375, 0.09249071, -1.532527, 0, 1, 0.1490196, 1,
-0.3884208, -0.9252365, -1.551946, 0, 1, 0.1529412, 1,
-0.387157, -0.2709987, -0.2646734, 0, 1, 0.1607843, 1,
-0.3859576, 0.1049832, -0.9003992, 0, 1, 0.1647059, 1,
-0.3808206, 0.4005747, -1.902702, 0, 1, 0.172549, 1,
-0.3789203, -2.232595, -3.849596, 0, 1, 0.1764706, 1,
-0.3762878, -1.234117, -0.12542, 0, 1, 0.1843137, 1,
-0.3759805, -0.3670805, -3.039352, 0, 1, 0.1882353, 1,
-0.374887, 0.4666167, 0.7274495, 0, 1, 0.1960784, 1,
-0.3732171, 1.513853, -0.3135519, 0, 1, 0.2039216, 1,
-0.3694696, 0.9450135, 0.4957859, 0, 1, 0.2078431, 1,
-0.3668654, -0.5249001, -3.518533, 0, 1, 0.2156863, 1,
-0.3615065, -0.8604745, -2.592022, 0, 1, 0.2196078, 1,
-0.3578296, -0.05232004, -2.741967, 0, 1, 0.227451, 1,
-0.3557735, -1.610822, -1.89302, 0, 1, 0.2313726, 1,
-0.3552657, -0.6536335, -1.546192, 0, 1, 0.2392157, 1,
-0.3543844, 0.6149668, 0.4899584, 0, 1, 0.2431373, 1,
-0.3383744, 0.8311155, 1.361691, 0, 1, 0.2509804, 1,
-0.330897, -0.6645758, -0.1610464, 0, 1, 0.254902, 1,
-0.3308134, 0.6466175, -1.308767, 0, 1, 0.2627451, 1,
-0.3272544, 1.475108, -1.795169, 0, 1, 0.2666667, 1,
-0.3267848, 0.6518341, -2.236348, 0, 1, 0.2745098, 1,
-0.3256362, 1.021297, -0.3038361, 0, 1, 0.2784314, 1,
-0.3247284, -0.1758769, -2.084652, 0, 1, 0.2862745, 1,
-0.3237961, -0.07316492, -2.16192, 0, 1, 0.2901961, 1,
-0.3212988, -0.4279992, -4.041005, 0, 1, 0.2980392, 1,
-0.3210239, 0.3500951, 0.2853716, 0, 1, 0.3058824, 1,
-0.3210076, 0.6514353, -0.2624108, 0, 1, 0.3098039, 1,
-0.3206137, 1.263327, 0.2923185, 0, 1, 0.3176471, 1,
-0.3201625, -0.09392834, -2.063235, 0, 1, 0.3215686, 1,
-0.3160101, -1.67997, -2.650548, 0, 1, 0.3294118, 1,
-0.3078668, -0.1331191, -1.314914, 0, 1, 0.3333333, 1,
-0.3010232, -0.4710639, -2.954663, 0, 1, 0.3411765, 1,
-0.2994508, 1.479333, -1.639528, 0, 1, 0.345098, 1,
-0.2972162, -0.660655, -2.436814, 0, 1, 0.3529412, 1,
-0.29566, 0.6061976, -1.65878, 0, 1, 0.3568628, 1,
-0.2922083, -0.2300805, -0.7290233, 0, 1, 0.3647059, 1,
-0.291854, 1.060945, -0.98616, 0, 1, 0.3686275, 1,
-0.2879302, 1.078111, 0.4058841, 0, 1, 0.3764706, 1,
-0.287734, 0.2303531, -1.191879, 0, 1, 0.3803922, 1,
-0.2876152, -1.002602, -4.298782, 0, 1, 0.3882353, 1,
-0.2790527, -0.361008, -1.202363, 0, 1, 0.3921569, 1,
-0.2764309, -0.7149133, -4.015582, 0, 1, 0.4, 1,
-0.2751543, -0.7459556, -5.596834, 0, 1, 0.4078431, 1,
-0.2739874, 1.215995, -1.925135, 0, 1, 0.4117647, 1,
-0.2728722, 0.5464776, 0.5188004, 0, 1, 0.4196078, 1,
-0.2727993, -0.007436549, -1.334177, 0, 1, 0.4235294, 1,
-0.2715936, -1.502374, -4.226622, 0, 1, 0.4313726, 1,
-0.2669422, 0.8251798, -1.301195, 0, 1, 0.4352941, 1,
-0.2652584, 0.993204, -0.08638599, 0, 1, 0.4431373, 1,
-0.2639609, 0.4572338, 0.219207, 0, 1, 0.4470588, 1,
-0.2632123, 1.498292, 0.6993846, 0, 1, 0.454902, 1,
-0.2621942, 0.07857963, -2.747539, 0, 1, 0.4588235, 1,
-0.2621537, -0.07003748, -2.440982, 0, 1, 0.4666667, 1,
-0.2618682, 1.558807, -0.003923052, 0, 1, 0.4705882, 1,
-0.2617397, 0.804799, 2.557829, 0, 1, 0.4784314, 1,
-0.2614348, 2.476161, -0.1010602, 0, 1, 0.4823529, 1,
-0.2507629, 1.077621, -2.315297, 0, 1, 0.4901961, 1,
-0.249543, 2.162545, -0.05628019, 0, 1, 0.4941176, 1,
-0.2483031, 2.284092, 0.738543, 0, 1, 0.5019608, 1,
-0.2478476, 0.106383, -2.352004, 0, 1, 0.509804, 1,
-0.2458288, -0.409337, -1.905069, 0, 1, 0.5137255, 1,
-0.2457273, 0.09220207, -0.1892513, 0, 1, 0.5215687, 1,
-0.2392983, -2.273569, -2.045915, 0, 1, 0.5254902, 1,
-0.2370119, 1.305822, 0.05854228, 0, 1, 0.5333334, 1,
-0.2331452, -1.093163, -3.463182, 0, 1, 0.5372549, 1,
-0.2296058, 0.1402362, 0.3707884, 0, 1, 0.5450981, 1,
-0.2264527, -0.1607807, -1.563528, 0, 1, 0.5490196, 1,
-0.2174727, 0.1443173, -0.908889, 0, 1, 0.5568628, 1,
-0.2166477, 0.5244, -0.2667755, 0, 1, 0.5607843, 1,
-0.2162828, 0.3423579, -0.6063683, 0, 1, 0.5686275, 1,
-0.2147888, -2.299092, -1.982611, 0, 1, 0.572549, 1,
-0.214596, 0.3042658, -2.119612, 0, 1, 0.5803922, 1,
-0.2143616, -0.9655364, -1.735861, 0, 1, 0.5843138, 1,
-0.2062923, 2.397762, -0.2009638, 0, 1, 0.5921569, 1,
-0.2053733, -1.476514, -2.759413, 0, 1, 0.5960785, 1,
-0.2040355, 0.5175882, 0.3297933, 0, 1, 0.6039216, 1,
-0.1978855, 2.455708, -1.121133, 0, 1, 0.6117647, 1,
-0.194818, -0.5764585, -4.025454, 0, 1, 0.6156863, 1,
-0.1925137, -0.7160149, -2.458257, 0, 1, 0.6235294, 1,
-0.1918999, -1.884416, -2.988518, 0, 1, 0.627451, 1,
-0.1898691, 0.255272, -1.971464, 0, 1, 0.6352941, 1,
-0.1865166, 1.378295, 0.01557168, 0, 1, 0.6392157, 1,
-0.1818624, 0.4563026, 0.3603377, 0, 1, 0.6470588, 1,
-0.1816983, -0.8691665, -2.598344, 0, 1, 0.6509804, 1,
-0.1780167, -1.451562, -5.437404, 0, 1, 0.6588235, 1,
-0.1763465, -0.5555933, -3.878235, 0, 1, 0.6627451, 1,
-0.1692487, 0.4732004, 1.128492, 0, 1, 0.6705883, 1,
-0.159898, -0.2337212, -2.29422, 0, 1, 0.6745098, 1,
-0.159806, 0.1773125, -1.528893, 0, 1, 0.682353, 1,
-0.154309, -1.263796, -3.271681, 0, 1, 0.6862745, 1,
-0.1534881, -0.2183557, -1.748954, 0, 1, 0.6941177, 1,
-0.1529646, -0.9787625, -3.186019, 0, 1, 0.7019608, 1,
-0.1492898, 0.8383863, 2.086666, 0, 1, 0.7058824, 1,
-0.1478567, -0.2811224, -3.204111, 0, 1, 0.7137255, 1,
-0.1471841, -0.7793827, -2.069348, 0, 1, 0.7176471, 1,
-0.142892, -0.05080097, -1.412813, 0, 1, 0.7254902, 1,
-0.1396573, -0.3902601, -1.674731, 0, 1, 0.7294118, 1,
-0.1383802, 1.686937, 0.5020997, 0, 1, 0.7372549, 1,
-0.1346198, 1.550946, -0.6122332, 0, 1, 0.7411765, 1,
-0.131656, -0.00142268, -0.1605596, 0, 1, 0.7490196, 1,
-0.1308926, 0.1640254, -0.6456111, 0, 1, 0.7529412, 1,
-0.1228575, -0.2237499, -2.346656, 0, 1, 0.7607843, 1,
-0.1197195, 0.2212104, -0.09647572, 0, 1, 0.7647059, 1,
-0.1129393, -1.585244, -3.231179, 0, 1, 0.772549, 1,
-0.1070947, -1.210612, -1.788729, 0, 1, 0.7764706, 1,
-0.1064282, 1.235233, 0.2994525, 0, 1, 0.7843137, 1,
-0.1020476, 0.5687814, -1.400721, 0, 1, 0.7882353, 1,
-0.1009681, -0.06964913, -2.039742, 0, 1, 0.7960784, 1,
-0.1000134, -0.06410245, -3.446343, 0, 1, 0.8039216, 1,
-0.09872236, 2.545627, -0.4946201, 0, 1, 0.8078431, 1,
-0.09716313, -0.5641297, -3.482501, 0, 1, 0.8156863, 1,
-0.09461334, 1.171171, -0.09497453, 0, 1, 0.8196079, 1,
-0.09374464, -0.9482483, -2.996871, 0, 1, 0.827451, 1,
-0.09219164, -0.005976751, -1.400978, 0, 1, 0.8313726, 1,
-0.09024718, -1.524124, -2.110145, 0, 1, 0.8392157, 1,
-0.08803287, -0.8542899, -2.94732, 0, 1, 0.8431373, 1,
-0.08798209, 0.2030583, -0.2050024, 0, 1, 0.8509804, 1,
-0.08681466, 0.5497061, 0.4723071, 0, 1, 0.854902, 1,
-0.08490907, -1.441283, -2.98071, 0, 1, 0.8627451, 1,
-0.08020934, 0.1821719, 0.09200935, 0, 1, 0.8666667, 1,
-0.07862692, -0.7691529, -2.944304, 0, 1, 0.8745098, 1,
-0.07843958, 0.9269773, -2.361332, 0, 1, 0.8784314, 1,
-0.07688377, 0.8952383, 2.452831, 0, 1, 0.8862745, 1,
-0.07161966, -0.3885995, -3.66028, 0, 1, 0.8901961, 1,
-0.06986965, 0.8725325, -0.2593223, 0, 1, 0.8980392, 1,
-0.06915772, 1.008962, 1.243001, 0, 1, 0.9058824, 1,
-0.06826751, -0.5309247, -3.2773, 0, 1, 0.9098039, 1,
-0.06280013, -1.047522, -2.115787, 0, 1, 0.9176471, 1,
-0.06203325, -0.06170024, -2.105784, 0, 1, 0.9215686, 1,
-0.05401356, 0.3874627, -0.4261279, 0, 1, 0.9294118, 1,
-0.0512595, -0.3856838, -2.906994, 0, 1, 0.9333333, 1,
-0.04994682, -0.8513445, -3.536068, 0, 1, 0.9411765, 1,
-0.04783159, 0.7923344, 0.4314815, 0, 1, 0.945098, 1,
-0.04672625, -0.2047614, -2.930673, 0, 1, 0.9529412, 1,
-0.04583227, -1.1921, -1.829758, 0, 1, 0.9568627, 1,
-0.04490286, 0.06059585, -0.1635667, 0, 1, 0.9647059, 1,
-0.04138302, -0.842248, -3.732634, 0, 1, 0.9686275, 1,
-0.03990902, -0.4114742, -3.582181, 0, 1, 0.9764706, 1,
-0.03950151, -0.7729694, -2.082135, 0, 1, 0.9803922, 1,
-0.03911324, 2.245727, 0.3817858, 0, 1, 0.9882353, 1,
-0.03570505, 0.4927169, -1.863828, 0, 1, 0.9921569, 1,
-0.03556224, -0.2835453, -3.809002, 0, 1, 1, 1,
-0.03469645, -0.6456054, -2.615533, 0, 0.9921569, 1, 1,
-0.03183152, 0.4540526, -0.6737384, 0, 0.9882353, 1, 1,
-0.03078895, 0.2058093, 0.9943001, 0, 0.9803922, 1, 1,
-0.03042691, -0.4527829, -4.354206, 0, 0.9764706, 1, 1,
-0.03021668, -1.241711, -4.240286, 0, 0.9686275, 1, 1,
-0.02907467, 0.4029676, -1.232134, 0, 0.9647059, 1, 1,
-0.02870425, 1.293469, -0.6216804, 0, 0.9568627, 1, 1,
-0.02803173, -0.508164, -1.728867, 0, 0.9529412, 1, 1,
-0.02665765, -0.05147799, -1.465146, 0, 0.945098, 1, 1,
-0.0233185, 0.5733739, 0.9515271, 0, 0.9411765, 1, 1,
-0.01772692, -0.214269, -2.627905, 0, 0.9333333, 1, 1,
-0.0109715, -1.786811, -4.568756, 0, 0.9294118, 1, 1,
-0.007810283, 1.580176, 0.9656177, 0, 0.9215686, 1, 1,
-0.007351391, -1.800432, -2.967486, 0, 0.9176471, 1, 1,
-0.004679287, -0.2209341, -2.757502, 0, 0.9098039, 1, 1,
-0.0008382465, 0.01810688, -0.9886398, 0, 0.9058824, 1, 1,
-0.0006584969, -1.337743, -4.914579, 0, 0.8980392, 1, 1,
0.0002940473, -0.3238283, 2.112328, 0, 0.8901961, 1, 1,
0.003551613, 0.3034005, -0.7726123, 0, 0.8862745, 1, 1,
0.007017034, 1.575126, -0.3507713, 0, 0.8784314, 1, 1,
0.02276167, -0.7786861, 3.546153, 0, 0.8745098, 1, 1,
0.02624386, 0.8387585, 0.0677551, 0, 0.8666667, 1, 1,
0.03229475, -0.8034205, 1.889206, 0, 0.8627451, 1, 1,
0.03474303, 2.186575, -0.9132087, 0, 0.854902, 1, 1,
0.03527028, 0.5723055, 1.000359, 0, 0.8509804, 1, 1,
0.035317, -0.7263656, 4.711215, 0, 0.8431373, 1, 1,
0.03716827, 0.2534208, 0.326764, 0, 0.8392157, 1, 1,
0.04602893, -1.027357, 2.732933, 0, 0.8313726, 1, 1,
0.05177452, -1.391747, 4.277323, 0, 0.827451, 1, 1,
0.05535944, -0.8999685, 2.733261, 0, 0.8196079, 1, 1,
0.05588244, -0.3220073, 3.068999, 0, 0.8156863, 1, 1,
0.05671797, -0.7693838, 1.778138, 0, 0.8078431, 1, 1,
0.07322506, 0.2721249, 1.743419, 0, 0.8039216, 1, 1,
0.07605571, -0.6048824, 2.728709, 0, 0.7960784, 1, 1,
0.07640467, 1.700014, -0.4395128, 0, 0.7882353, 1, 1,
0.07699888, -0.03405795, 0.9452733, 0, 0.7843137, 1, 1,
0.080048, 0.2250492, -2.786558, 0, 0.7764706, 1, 1,
0.08381887, 0.2525031, 1.033827, 0, 0.772549, 1, 1,
0.09586405, -2.280396, 4.455211, 0, 0.7647059, 1, 1,
0.09800694, -0.593705, 3.140999, 0, 0.7607843, 1, 1,
0.100384, 0.4375556, 0.523636, 0, 0.7529412, 1, 1,
0.1004626, -1.105653, 2.988881, 0, 0.7490196, 1, 1,
0.1020203, 1.663042, 0.1083174, 0, 0.7411765, 1, 1,
0.1039175, 0.1776222, 0.7056946, 0, 0.7372549, 1, 1,
0.1040188, 0.3536356, -0.07387538, 0, 0.7294118, 1, 1,
0.1059118, -0.6115667, 2.653875, 0, 0.7254902, 1, 1,
0.1075587, -0.2617625, 2.932271, 0, 0.7176471, 1, 1,
0.1134282, 1.126439, -1.325561, 0, 0.7137255, 1, 1,
0.1150869, -2.114699, 2.979732, 0, 0.7058824, 1, 1,
0.1195155, -1.568913, 3.100207, 0, 0.6980392, 1, 1,
0.1257459, -0.8062972, 1.620126, 0, 0.6941177, 1, 1,
0.1258425, 0.202202, -0.3532662, 0, 0.6862745, 1, 1,
0.1259576, -0.6916468, 4.493693, 0, 0.682353, 1, 1,
0.1275546, 0.3641578, 1.577375, 0, 0.6745098, 1, 1,
0.1289736, 0.1055687, 1.109691, 0, 0.6705883, 1, 1,
0.1315635, -1.762711, 3.43156, 0, 0.6627451, 1, 1,
0.1332107, -1.25654, 1.50585, 0, 0.6588235, 1, 1,
0.1359288, 1.705498, 0.1520952, 0, 0.6509804, 1, 1,
0.1365337, 1.979111, 1.093271, 0, 0.6470588, 1, 1,
0.1436984, -1.828036, 3.133147, 0, 0.6392157, 1, 1,
0.1443168, 1.265779, -0.8126559, 0, 0.6352941, 1, 1,
0.1533321, -0.8240608, 2.290931, 0, 0.627451, 1, 1,
0.1558261, 0.7676688, -0.1949677, 0, 0.6235294, 1, 1,
0.1573659, -0.6863623, 2.035179, 0, 0.6156863, 1, 1,
0.1652162, 0.7881495, -1.616568, 0, 0.6117647, 1, 1,
0.1656333, 0.9409567, 1.609471, 0, 0.6039216, 1, 1,
0.1661534, 1.533723, 0.6586088, 0, 0.5960785, 1, 1,
0.1673885, 1.851048, -0.9421921, 0, 0.5921569, 1, 1,
0.1705884, -0.3162286, 3.390716, 0, 0.5843138, 1, 1,
0.1718873, 2.420844, -0.8935562, 0, 0.5803922, 1, 1,
0.1734206, 1.445748, -2.433343, 0, 0.572549, 1, 1,
0.1766583, 0.1412815, 1.758533, 0, 0.5686275, 1, 1,
0.1823368, 0.2194037, 0.4301781, 0, 0.5607843, 1, 1,
0.1856204, 1.459605, 0.3097019, 0, 0.5568628, 1, 1,
0.1866633, 1.05488, -0.2567176, 0, 0.5490196, 1, 1,
0.1875053, -0.3878496, 2.050306, 0, 0.5450981, 1, 1,
0.189237, -0.6773938, 1.840025, 0, 0.5372549, 1, 1,
0.194624, -0.699221, 3.371787, 0, 0.5333334, 1, 1,
0.1951394, -0.7661374, 3.025102, 0, 0.5254902, 1, 1,
0.195806, 0.1114685, 1.785094, 0, 0.5215687, 1, 1,
0.1976628, -0.5435267, 3.318336, 0, 0.5137255, 1, 1,
0.1977153, 1.728117, -0.6149706, 0, 0.509804, 1, 1,
0.1997231, -0.08949733, 2.100012, 0, 0.5019608, 1, 1,
0.2015566, 1.441256, -0.4062084, 0, 0.4941176, 1, 1,
0.2019828, 0.3237534, 1.107556, 0, 0.4901961, 1, 1,
0.2061579, -0.9432454, 4.436373, 0, 0.4823529, 1, 1,
0.2066208, -0.3549109, 2.434376, 0, 0.4784314, 1, 1,
0.2103069, 0.4841067, 0.685231, 0, 0.4705882, 1, 1,
0.2105055, 0.7642846, -0.4822643, 0, 0.4666667, 1, 1,
0.2144015, -0.6056451, 2.24223, 0, 0.4588235, 1, 1,
0.2172656, -1.388056, 1.331666, 0, 0.454902, 1, 1,
0.2243821, 0.6970732, 0.6019352, 0, 0.4470588, 1, 1,
0.2249808, 0.1244731, 1.345661, 0, 0.4431373, 1, 1,
0.2278575, -0.4548452, 3.203968, 0, 0.4352941, 1, 1,
0.229328, -0.1036121, 2.568877, 0, 0.4313726, 1, 1,
0.229987, -1.373484, 1.891723, 0, 0.4235294, 1, 1,
0.2358971, -0.1379777, 3.120935, 0, 0.4196078, 1, 1,
0.2372059, 0.06735315, 0.9168928, 0, 0.4117647, 1, 1,
0.2415291, 0.5755084, -0.193773, 0, 0.4078431, 1, 1,
0.2431331, 1.455645, -0.07075813, 0, 0.4, 1, 1,
0.2431788, -0.6171568, 2.473595, 0, 0.3921569, 1, 1,
0.2457931, -1.034476, 3.751941, 0, 0.3882353, 1, 1,
0.2462021, -0.26771, 3.89292, 0, 0.3803922, 1, 1,
0.249392, 0.6569436, -1.109741, 0, 0.3764706, 1, 1,
0.2538907, 0.5615938, 1.567212, 0, 0.3686275, 1, 1,
0.2549587, 0.6899813, 0.5086249, 0, 0.3647059, 1, 1,
0.2572939, 0.4302051, -1.358614, 0, 0.3568628, 1, 1,
0.2593327, 0.5600131, 1.247876, 0, 0.3529412, 1, 1,
0.2596846, -0.6230922, 4.173744, 0, 0.345098, 1, 1,
0.2609991, -0.2603258, 1.604385, 0, 0.3411765, 1, 1,
0.2628773, -0.1542625, 1.694957, 0, 0.3333333, 1, 1,
0.2675283, -1.612151, 2.354833, 0, 0.3294118, 1, 1,
0.2752616, -1.113721, 3.181951, 0, 0.3215686, 1, 1,
0.2786112, 1.463779, 0.3260781, 0, 0.3176471, 1, 1,
0.2832079, -0.04885197, 1.275707, 0, 0.3098039, 1, 1,
0.2837513, -0.2391036, 3.70355, 0, 0.3058824, 1, 1,
0.2856798, 0.07724413, 0.6980234, 0, 0.2980392, 1, 1,
0.2892196, 1.200678, 0.698061, 0, 0.2901961, 1, 1,
0.293273, -0.5422903, 4.443301, 0, 0.2862745, 1, 1,
0.2950293, -0.3949653, 2.393866, 0, 0.2784314, 1, 1,
0.2988631, 1.442561, 1.211255, 0, 0.2745098, 1, 1,
0.3065168, -0.4726773, 1.433587, 0, 0.2666667, 1, 1,
0.3123744, 0.5436687, 0.6721715, 0, 0.2627451, 1, 1,
0.3147267, -1.064239, 3.129125, 0, 0.254902, 1, 1,
0.3179948, 0.2326005, 0.8098206, 0, 0.2509804, 1, 1,
0.3193924, 1.568811, 0.7586803, 0, 0.2431373, 1, 1,
0.3201784, 2.083889, 1.067236, 0, 0.2392157, 1, 1,
0.3239354, 2.184269, 1.965291, 0, 0.2313726, 1, 1,
0.3261092, -0.2569285, 1.95866, 0, 0.227451, 1, 1,
0.3267641, -0.4314891, 2.397827, 0, 0.2196078, 1, 1,
0.3303483, 0.1085036, 0.793102, 0, 0.2156863, 1, 1,
0.3355145, 1.148045, -0.3897186, 0, 0.2078431, 1, 1,
0.335653, -0.7431397, 2.892822, 0, 0.2039216, 1, 1,
0.3373608, 0.9313162, -0.5290668, 0, 0.1960784, 1, 1,
0.3381632, 0.6620088, 0.3887282, 0, 0.1882353, 1, 1,
0.3407054, 0.3397318, 0.3413059, 0, 0.1843137, 1, 1,
0.3440593, 0.09614587, 1.500599, 0, 0.1764706, 1, 1,
0.3445865, -0.4206245, 1.177477, 0, 0.172549, 1, 1,
0.3456401, -0.241795, 2.174225, 0, 0.1647059, 1, 1,
0.3475638, -0.6273055, 3.469353, 0, 0.1607843, 1, 1,
0.3498432, -1.043897, 4.053602, 0, 0.1529412, 1, 1,
0.3506298, -1.212491, 3.414262, 0, 0.1490196, 1, 1,
0.3599915, 1.660981, -0.1787539, 0, 0.1411765, 1, 1,
0.3694633, -1.226957, 3.562283, 0, 0.1372549, 1, 1,
0.3696226, -0.1922366, 2.936552, 0, 0.1294118, 1, 1,
0.3702228, 0.916017, -0.1422222, 0, 0.1254902, 1, 1,
0.3711223, -0.3739491, 0.9251361, 0, 0.1176471, 1, 1,
0.372339, -0.2597797, 1.037251, 0, 0.1137255, 1, 1,
0.3735813, 0.2372934, 0.7445971, 0, 0.1058824, 1, 1,
0.3742143, 2.130952, -0.5590426, 0, 0.09803922, 1, 1,
0.37618, 0.9290003, -0.02738135, 0, 0.09411765, 1, 1,
0.3765011, 0.3264108, 0.4664991, 0, 0.08627451, 1, 1,
0.3808188, 0.1088265, -0.3653468, 0, 0.08235294, 1, 1,
0.3855627, 0.276848, 2.000338, 0, 0.07450981, 1, 1,
0.387231, -0.223748, 1.918264, 0, 0.07058824, 1, 1,
0.388584, -0.80618, 1.669441, 0, 0.0627451, 1, 1,
0.391095, 0.9783316, 0.8725362, 0, 0.05882353, 1, 1,
0.391291, 1.010237, 0.4892224, 0, 0.05098039, 1, 1,
0.3946514, -0.7833232, 3.987919, 0, 0.04705882, 1, 1,
0.3964659, -0.9436876, 2.232753, 0, 0.03921569, 1, 1,
0.3998732, 0.08101407, -1.057913, 0, 0.03529412, 1, 1,
0.3998929, 0.0748354, 1.126802, 0, 0.02745098, 1, 1,
0.4019397, -0.4506461, 2.625531, 0, 0.02352941, 1, 1,
0.4036144, 1.271118, 2.931889, 0, 0.01568628, 1, 1,
0.4042251, -2.167295, 3.812326, 0, 0.01176471, 1, 1,
0.4049216, 1.708591, 1.336046, 0, 0.003921569, 1, 1,
0.4152131, 0.08931787, 0.2118696, 0.003921569, 0, 1, 1,
0.4155502, -2.549571, 3.024934, 0.007843138, 0, 1, 1,
0.4171999, 0.1246754, 1.094755, 0.01568628, 0, 1, 1,
0.4192574, -2.261249, 2.444201, 0.01960784, 0, 1, 1,
0.4275486, -1.195643, 1.550483, 0.02745098, 0, 1, 1,
0.4286295, 0.914225, 0.9368868, 0.03137255, 0, 1, 1,
0.4295155, 0.2259667, 1.110381, 0.03921569, 0, 1, 1,
0.4302588, -0.08816753, 2.874156, 0.04313726, 0, 1, 1,
0.4351321, 1.235848, -0.06001639, 0.05098039, 0, 1, 1,
0.436068, -0.7205486, 1.706173, 0.05490196, 0, 1, 1,
0.4361652, 0.1960292, 1.220518, 0.0627451, 0, 1, 1,
0.4492164, -0.7128112, 1.760882, 0.06666667, 0, 1, 1,
0.4557551, -0.4240269, 2.798198, 0.07450981, 0, 1, 1,
0.4559154, -1.001538, 3.113925, 0.07843138, 0, 1, 1,
0.4573467, 0.2507122, 2.166456, 0.08627451, 0, 1, 1,
0.4604694, 0.0531672, 1.06901, 0.09019608, 0, 1, 1,
0.4616181, -0.5882495, 3.157869, 0.09803922, 0, 1, 1,
0.4661148, 0.8416674, 0.696595, 0.1058824, 0, 1, 1,
0.4694353, -0.0002507556, 2.397712, 0.1098039, 0, 1, 1,
0.4703866, 0.2454772, 0.9044665, 0.1176471, 0, 1, 1,
0.4720742, 1.522092, -1.338475, 0.1215686, 0, 1, 1,
0.4728364, 0.6949635, 1.394795, 0.1294118, 0, 1, 1,
0.4740045, -0.4248491, 2.273277, 0.1333333, 0, 1, 1,
0.4747955, 2.13532, 1.476459, 0.1411765, 0, 1, 1,
0.4757506, 2.548384, 1.416794, 0.145098, 0, 1, 1,
0.4759304, 0.7167259, -0.4877775, 0.1529412, 0, 1, 1,
0.478668, -0.2838046, 3.32994, 0.1568628, 0, 1, 1,
0.4794422, -0.9890567, 2.187698, 0.1647059, 0, 1, 1,
0.4811509, -0.03966309, 1.322003, 0.1686275, 0, 1, 1,
0.4812874, 2.167899, 1.145813, 0.1764706, 0, 1, 1,
0.4818656, 0.4342492, 0.236448, 0.1803922, 0, 1, 1,
0.4820254, -0.8633774, 1.900536, 0.1882353, 0, 1, 1,
0.4913769, 3.58003, 0.2207756, 0.1921569, 0, 1, 1,
0.5058685, 0.3434087, -0.6464373, 0.2, 0, 1, 1,
0.5078365, 0.5990396, -0.3812692, 0.2078431, 0, 1, 1,
0.5090953, -1.262226, 2.583856, 0.2117647, 0, 1, 1,
0.5135134, -0.05846217, 2.289842, 0.2196078, 0, 1, 1,
0.5139398, -1.306997, 1.331918, 0.2235294, 0, 1, 1,
0.5148328, 0.1923452, 2.529673, 0.2313726, 0, 1, 1,
0.5170159, -0.6006285, 3.240805, 0.2352941, 0, 1, 1,
0.5184661, -1.093366, 2.573708, 0.2431373, 0, 1, 1,
0.5189146, -0.5166075, 3.310127, 0.2470588, 0, 1, 1,
0.5193145, -1.795646, 3.848408, 0.254902, 0, 1, 1,
0.5221326, -0.1700877, 2.907809, 0.2588235, 0, 1, 1,
0.5327392, -0.7278682, 1.668966, 0.2666667, 0, 1, 1,
0.5402759, -0.9494633, 1.285982, 0.2705882, 0, 1, 1,
0.5421697, -0.6622072, 2.702899, 0.2784314, 0, 1, 1,
0.5423687, 0.5271567, 0.8993787, 0.282353, 0, 1, 1,
0.5428852, -0.6330124, 3.712989, 0.2901961, 0, 1, 1,
0.5459531, 0.8629904, 0.8283805, 0.2941177, 0, 1, 1,
0.552398, -0.3633936, 2.251084, 0.3019608, 0, 1, 1,
0.5534289, -0.3252141, 0.04378311, 0.3098039, 0, 1, 1,
0.555859, -1.300819, 1.985333, 0.3137255, 0, 1, 1,
0.5596212, -0.7552598, 1.957048, 0.3215686, 0, 1, 1,
0.5627705, -0.9072199, 4.397257, 0.3254902, 0, 1, 1,
0.5639811, -0.03803231, 2.063965, 0.3333333, 0, 1, 1,
0.56527, 1.016384, 2.19212, 0.3372549, 0, 1, 1,
0.5656161, 1.074479, 0.4127411, 0.345098, 0, 1, 1,
0.5660866, -0.5149885, 1.639841, 0.3490196, 0, 1, 1,
0.5673378, -1.990257, 1.265305, 0.3568628, 0, 1, 1,
0.5775735, 0.3241104, 1.970387, 0.3607843, 0, 1, 1,
0.578876, -0.5476985, 2.794431, 0.3686275, 0, 1, 1,
0.580807, -0.1967353, 1.705232, 0.372549, 0, 1, 1,
0.5816236, 1.023084, 1.79186, 0.3803922, 0, 1, 1,
0.5833838, 0.3546776, -2.185898, 0.3843137, 0, 1, 1,
0.58442, 0.4150588, -0.3006743, 0.3921569, 0, 1, 1,
0.5917268, 0.09204786, 1.359613, 0.3960784, 0, 1, 1,
0.5972492, 1.429099, -0.5206062, 0.4039216, 0, 1, 1,
0.6053204, 1.915452, -0.6280889, 0.4117647, 0, 1, 1,
0.6075469, 0.9699585, -0.1695193, 0.4156863, 0, 1, 1,
0.6098515, -1.906449, 2.086112, 0.4235294, 0, 1, 1,
0.6124207, -0.3686313, 1.395815, 0.427451, 0, 1, 1,
0.6155689, -0.8244104, 2.038013, 0.4352941, 0, 1, 1,
0.6172705, -0.1578652, 1.218436, 0.4392157, 0, 1, 1,
0.6173902, -0.2830941, 0.6077163, 0.4470588, 0, 1, 1,
0.6189415, 0.470068, -0.8110599, 0.4509804, 0, 1, 1,
0.6215457, 0.644682, 0.944373, 0.4588235, 0, 1, 1,
0.6223431, -0.4746601, 2.269694, 0.4627451, 0, 1, 1,
0.6258659, 0.7727588, 1.539749, 0.4705882, 0, 1, 1,
0.626937, 1.819617, 1.718987, 0.4745098, 0, 1, 1,
0.6313618, -0.9004841, 4.254938, 0.4823529, 0, 1, 1,
0.6414827, -1.2586, 2.895183, 0.4862745, 0, 1, 1,
0.6540855, -1.488538, 3.415671, 0.4941176, 0, 1, 1,
0.6584388, -0.009602183, 2.256203, 0.5019608, 0, 1, 1,
0.6594285, -1.484016, 2.204138, 0.5058824, 0, 1, 1,
0.6600093, -0.3353987, 2.035258, 0.5137255, 0, 1, 1,
0.6621853, -0.02754063, 0.2085492, 0.5176471, 0, 1, 1,
0.6650473, 0.9875064, 1.679694, 0.5254902, 0, 1, 1,
0.6715971, -1.158055, 3.07647, 0.5294118, 0, 1, 1,
0.6721897, 0.05058972, 1.9808, 0.5372549, 0, 1, 1,
0.6736174, -0.1309228, 2.453007, 0.5411765, 0, 1, 1,
0.6772866, -1.421762, 3.414547, 0.5490196, 0, 1, 1,
0.6808318, -0.1950968, 1.638309, 0.5529412, 0, 1, 1,
0.682579, -0.5490446, 1.782254, 0.5607843, 0, 1, 1,
0.6842747, 0.9082925, 0.2870238, 0.5647059, 0, 1, 1,
0.6901612, 0.5373394, 1.228237, 0.572549, 0, 1, 1,
0.694849, -0.7108676, 1.768162, 0.5764706, 0, 1, 1,
0.6964952, 1.529377, 0.5585689, 0.5843138, 0, 1, 1,
0.6995201, 1.265865, 1.149106, 0.5882353, 0, 1, 1,
0.6999754, -0.8386738, 3.234344, 0.5960785, 0, 1, 1,
0.7008126, 0.143049, 2.12116, 0.6039216, 0, 1, 1,
0.7029506, 0.5754829, -0.4571867, 0.6078432, 0, 1, 1,
0.7034775, 0.6026382, 1.045847, 0.6156863, 0, 1, 1,
0.708548, 0.0873666, -0.05694565, 0.6196079, 0, 1, 1,
0.7094832, 0.4801045, -0.3387642, 0.627451, 0, 1, 1,
0.712484, 1.685823, -0.5242903, 0.6313726, 0, 1, 1,
0.7180164, 1.580209, -1.172931, 0.6392157, 0, 1, 1,
0.7196591, 0.2346083, 1.113662, 0.6431373, 0, 1, 1,
0.7206528, -0.5095962, 1.824664, 0.6509804, 0, 1, 1,
0.7223232, -0.2622412, 2.964195, 0.654902, 0, 1, 1,
0.7245344, 0.1435799, 1.027317, 0.6627451, 0, 1, 1,
0.735353, 0.01463183, 1.363549, 0.6666667, 0, 1, 1,
0.7390169, -0.1383167, 2.712393, 0.6745098, 0, 1, 1,
0.7420386, 0.1921182, 2.189984, 0.6784314, 0, 1, 1,
0.7425783, -0.5987386, 2.745743, 0.6862745, 0, 1, 1,
0.7465208, 0.231561, 2.578904, 0.6901961, 0, 1, 1,
0.7469044, -0.8696479, 3.760861, 0.6980392, 0, 1, 1,
0.756915, 0.3103316, 0.8042562, 0.7058824, 0, 1, 1,
0.761794, 1.254623, 1.596462, 0.7098039, 0, 1, 1,
0.7631839, -0.6364853, 2.885275, 0.7176471, 0, 1, 1,
0.7699986, 0.5286258, -0.2073493, 0.7215686, 0, 1, 1,
0.7709088, 0.03922989, 0.4752445, 0.7294118, 0, 1, 1,
0.771073, 1.323698, -0.06450003, 0.7333333, 0, 1, 1,
0.7715998, -0.6610563, 1.695088, 0.7411765, 0, 1, 1,
0.7723947, -0.4027286, 1.231435, 0.7450981, 0, 1, 1,
0.7753254, -1.038715, 2.217012, 0.7529412, 0, 1, 1,
0.7768134, -1.348512, 4.865314, 0.7568628, 0, 1, 1,
0.7771635, -0.5476862, 1.9883, 0.7647059, 0, 1, 1,
0.7778414, 1.755403, 0.477426, 0.7686275, 0, 1, 1,
0.781209, -2.067189, 2.853871, 0.7764706, 0, 1, 1,
0.7837247, -0.02363117, 0.6472005, 0.7803922, 0, 1, 1,
0.7906625, -0.5446236, 4.358846, 0.7882353, 0, 1, 1,
0.7916034, -0.7116045, 2.858003, 0.7921569, 0, 1, 1,
0.80436, 2.313323, -0.4046062, 0.8, 0, 1, 1,
0.8043767, 0.3286972, 0.3322482, 0.8078431, 0, 1, 1,
0.8063316, 0.2720432, 1.271629, 0.8117647, 0, 1, 1,
0.8099406, 0.8995348, 0.2582379, 0.8196079, 0, 1, 1,
0.8114085, -1.168114, 2.814918, 0.8235294, 0, 1, 1,
0.8167773, -0.4183761, 0.6384875, 0.8313726, 0, 1, 1,
0.8225778, -0.09481695, 1.67625, 0.8352941, 0, 1, 1,
0.8308723, 0.06422874, 0.8309553, 0.8431373, 0, 1, 1,
0.8349844, -1.27195, 2.79106, 0.8470588, 0, 1, 1,
0.8363307, -0.9512339, 3.171964, 0.854902, 0, 1, 1,
0.8406288, 0.5072986, 1.106762, 0.8588235, 0, 1, 1,
0.842759, -0.7168909, 0.2183176, 0.8666667, 0, 1, 1,
0.8444175, 0.9977237, 1.602824, 0.8705882, 0, 1, 1,
0.8469323, 0.1977066, 0.9929082, 0.8784314, 0, 1, 1,
0.8482502, -0.1687974, 1.38881, 0.8823529, 0, 1, 1,
0.8498861, -0.7306404, 2.990833, 0.8901961, 0, 1, 1,
0.8500611, -1.65915, 2.163003, 0.8941177, 0, 1, 1,
0.8529184, -0.1986584, 0.8253613, 0.9019608, 0, 1, 1,
0.8544897, -0.5369575, 2.070281, 0.9098039, 0, 1, 1,
0.8550725, -0.8880959, 2.530927, 0.9137255, 0, 1, 1,
0.8568166, -0.8912877, 2.24839, 0.9215686, 0, 1, 1,
0.8579887, 0.9687144, 1.264945, 0.9254902, 0, 1, 1,
0.8637702, 1.35877, 0.2097262, 0.9333333, 0, 1, 1,
0.8665108, 0.04230036, 2.430743, 0.9372549, 0, 1, 1,
0.867204, -0.2647201, 1.237286, 0.945098, 0, 1, 1,
0.8680863, -0.09736319, 0.9194328, 0.9490196, 0, 1, 1,
0.8681228, 0.8517399, 2.335744, 0.9568627, 0, 1, 1,
0.8701651, 0.3840888, 3.074429, 0.9607843, 0, 1, 1,
0.8718972, -0.5950603, 2.881729, 0.9686275, 0, 1, 1,
0.8724787, -0.276274, 0.7553467, 0.972549, 0, 1, 1,
0.8872588, -0.8288908, 3.168037, 0.9803922, 0, 1, 1,
0.8912879, -1.064979, 0.7509723, 0.9843137, 0, 1, 1,
0.8913494, 0.9990994, 0.524149, 0.9921569, 0, 1, 1,
0.8914509, 0.07922734, -0.3249762, 0.9960784, 0, 1, 1,
0.8916543, 0.3365149, 2.066024, 1, 0, 0.9960784, 1,
0.8932647, -0.5793974, 3.287872, 1, 0, 0.9882353, 1,
0.8954574, -0.7597983, 2.411957, 1, 0, 0.9843137, 1,
0.9030412, 1.411153, 0.2693317, 1, 0, 0.9764706, 1,
0.9036462, 1.264042, -0.4922598, 1, 0, 0.972549, 1,
0.9044732, 0.369134, 0.1461573, 1, 0, 0.9647059, 1,
0.912425, -1.149573, 4.374489, 1, 0, 0.9607843, 1,
0.9134699, 0.3254381, 2.672159, 1, 0, 0.9529412, 1,
0.9145573, 0.3545318, 1.060157, 1, 0, 0.9490196, 1,
0.9176217, -1.42649, 3.849059, 1, 0, 0.9411765, 1,
0.9176908, 0.3758187, 0.1799379, 1, 0, 0.9372549, 1,
0.9182431, -0.9741223, 0.7186203, 1, 0, 0.9294118, 1,
0.91932, -1.512187, 0.1141435, 1, 0, 0.9254902, 1,
0.9277442, -0.3218783, 0.9236826, 1, 0, 0.9176471, 1,
0.9312593, 0.1512289, 2.990734, 1, 0, 0.9137255, 1,
0.9338531, -0.5932059, 2.858538, 1, 0, 0.9058824, 1,
0.9395579, 0.5816861, 2.214061, 1, 0, 0.9019608, 1,
0.9538563, 0.8682697, 1.699466, 1, 0, 0.8941177, 1,
0.9542163, 0.4920515, 1.989052, 1, 0, 0.8862745, 1,
0.9589879, 0.2076398, 0.8623635, 1, 0, 0.8823529, 1,
0.9607681, -0.4739901, 0.9036919, 1, 0, 0.8745098, 1,
0.9715697, 0.6694173, 0.6216726, 1, 0, 0.8705882, 1,
0.9749771, 0.5501744, 1.195807, 1, 0, 0.8627451, 1,
0.9766745, -0.3591823, 2.028588, 1, 0, 0.8588235, 1,
0.9794822, -0.8495601, 2.92693, 1, 0, 0.8509804, 1,
0.9846225, -0.6951705, 1.772196, 1, 0, 0.8470588, 1,
0.9895641, -1.359455, 3.238297, 1, 0, 0.8392157, 1,
0.9899308, -1.286929, 2.849958, 1, 0, 0.8352941, 1,
0.9929491, 0.3128445, 1.885138, 1, 0, 0.827451, 1,
0.9934433, -0.4057224, 1.989512, 1, 0, 0.8235294, 1,
0.9948223, 0.7265421, 1.642277, 1, 0, 0.8156863, 1,
0.9980484, 0.5752662, 2.131255, 1, 0, 0.8117647, 1,
1.000564, 1.355794, 0.9464728, 1, 0, 0.8039216, 1,
1.001847, -0.4113368, 0.8190199, 1, 0, 0.7960784, 1,
1.007988, 0.8452349, 1.574916, 1, 0, 0.7921569, 1,
1.009264, -0.9239988, 2.224077, 1, 0, 0.7843137, 1,
1.023602, 0.501175, 1.345508, 1, 0, 0.7803922, 1,
1.025068, 1.100546, -0.3760589, 1, 0, 0.772549, 1,
1.028141, -0.4189803, 0.6562719, 1, 0, 0.7686275, 1,
1.032881, -1.679964, 2.167642, 1, 0, 0.7607843, 1,
1.03669, -0.1157586, 1.328051, 1, 0, 0.7568628, 1,
1.042932, -0.4947764, 1.298292, 1, 0, 0.7490196, 1,
1.065373, 0.02579568, -0.2164811, 1, 0, 0.7450981, 1,
1.066905, -1.729352, 2.002424, 1, 0, 0.7372549, 1,
1.068819, 2.225717, 0.6189178, 1, 0, 0.7333333, 1,
1.073127, -0.6000621, 2.067429, 1, 0, 0.7254902, 1,
1.073273, -1.314043, 2.047667, 1, 0, 0.7215686, 1,
1.081807, 1.288006, 1.020843, 1, 0, 0.7137255, 1,
1.084454, 1.732824, -0.2109988, 1, 0, 0.7098039, 1,
1.099737, -0.3772224, 1.300299, 1, 0, 0.7019608, 1,
1.101276, 1.956352, -0.1821309, 1, 0, 0.6941177, 1,
1.122946, 1.083993, 0.9349174, 1, 0, 0.6901961, 1,
1.136809, -0.7999648, 2.484309, 1, 0, 0.682353, 1,
1.145789, 1.474031, 1.530475, 1, 0, 0.6784314, 1,
1.146848, 0.709469, 1.798835, 1, 0, 0.6705883, 1,
1.153397, 0.06506318, 1.044014, 1, 0, 0.6666667, 1,
1.156254, -1.018039, 3.735808, 1, 0, 0.6588235, 1,
1.17063, -0.5309136, 3.386599, 1, 0, 0.654902, 1,
1.172708, -0.1567885, 1.211362, 1, 0, 0.6470588, 1,
1.186196, -0.7306072, 0.7110301, 1, 0, 0.6431373, 1,
1.186734, 0.269805, 1.156752, 1, 0, 0.6352941, 1,
1.191758, -0.6669467, 2.680952, 1, 0, 0.6313726, 1,
1.197699, -1.159393, 1.568386, 1, 0, 0.6235294, 1,
1.220162, -0.807967, 0.6283384, 1, 0, 0.6196079, 1,
1.237245, -1.378083, 2.704232, 1, 0, 0.6117647, 1,
1.23766, 0.8726174, -0.686127, 1, 0, 0.6078432, 1,
1.244084, -1.197338, 1.580983, 1, 0, 0.6, 1,
1.246017, -0.5232909, 0.8590035, 1, 0, 0.5921569, 1,
1.246669, -0.006766265, 3.241557, 1, 0, 0.5882353, 1,
1.251326, -0.1393636, 0.07142518, 1, 0, 0.5803922, 1,
1.255301, 0.1870803, 2.447083, 1, 0, 0.5764706, 1,
1.257441, -0.7769689, 1.450827, 1, 0, 0.5686275, 1,
1.260015, 0.9566652, 1.146809, 1, 0, 0.5647059, 1,
1.263894, -0.1307151, 1.475904, 1, 0, 0.5568628, 1,
1.266349, -0.7884488, 1.382546, 1, 0, 0.5529412, 1,
1.272511, 0.2631779, 0.4524542, 1, 0, 0.5450981, 1,
1.284298, -0.7279224, 1.155336, 1, 0, 0.5411765, 1,
1.287397, 0.3589879, 0.9029614, 1, 0, 0.5333334, 1,
1.288686, -0.1441968, 0.9834555, 1, 0, 0.5294118, 1,
1.288804, 1.266314, -0.07039096, 1, 0, 0.5215687, 1,
1.294289, -1.666937, 2.664759, 1, 0, 0.5176471, 1,
1.296457, 2.094521, 2.01402, 1, 0, 0.509804, 1,
1.315065, -1.391272, 1.028937, 1, 0, 0.5058824, 1,
1.346871, 0.2270075, 0.3625279, 1, 0, 0.4980392, 1,
1.347949, -0.9793134, 1.801751, 1, 0, 0.4901961, 1,
1.352265, -1.46014, 3.092671, 1, 0, 0.4862745, 1,
1.361486, -0.7861449, 3.179859, 1, 0, 0.4784314, 1,
1.364653, 0.2036606, 0.7019394, 1, 0, 0.4745098, 1,
1.366017, 0.5903435, -1.786794, 1, 0, 0.4666667, 1,
1.37406, 1.058922, -1.11203, 1, 0, 0.4627451, 1,
1.378056, -0.9368156, 2.04603, 1, 0, 0.454902, 1,
1.379744, 1.527276, 0.2477694, 1, 0, 0.4509804, 1,
1.38187, -0.8748817, 1.436312, 1, 0, 0.4431373, 1,
1.386809, 0.9820127, -0.06939515, 1, 0, 0.4392157, 1,
1.38824, -0.6218584, 1.938489, 1, 0, 0.4313726, 1,
1.394346, -0.3141422, 1.488385, 1, 0, 0.427451, 1,
1.396538, -0.4638613, 3.490693, 1, 0, 0.4196078, 1,
1.406825, -0.7746059, 2.509538, 1, 0, 0.4156863, 1,
1.407547, -0.1626994, -0.006138199, 1, 0, 0.4078431, 1,
1.411724, 0.5508979, 0.3996026, 1, 0, 0.4039216, 1,
1.411736, 2.060282, -0.6457595, 1, 0, 0.3960784, 1,
1.41606, -2.014174, 2.83345, 1, 0, 0.3882353, 1,
1.422735, -0.5524591, 1.91699, 1, 0, 0.3843137, 1,
1.440391, 0.1232715, 0.8861294, 1, 0, 0.3764706, 1,
1.454636, 0.0584894, 2.06435, 1, 0, 0.372549, 1,
1.458992, -0.357344, 3.100985, 1, 0, 0.3647059, 1,
1.471444, 1.276428, -0.852868, 1, 0, 0.3607843, 1,
1.484589, -1.16706, 2.374542, 1, 0, 0.3529412, 1,
1.49253, -0.559599, 1.353794, 1, 0, 0.3490196, 1,
1.50385, -0.7830395, 1.457509, 1, 0, 0.3411765, 1,
1.526535, -0.4703805, 1.590275, 1, 0, 0.3372549, 1,
1.538964, 1.392671, -0.3106824, 1, 0, 0.3294118, 1,
1.54572, 1.203397, 0.833127, 1, 0, 0.3254902, 1,
1.549011, 0.4277191, 1.410204, 1, 0, 0.3176471, 1,
1.552699, -0.6628001, 0.8110371, 1, 0, 0.3137255, 1,
1.562937, -1.018788, 2.390631, 1, 0, 0.3058824, 1,
1.598089, 0.893182, 0.8003185, 1, 0, 0.2980392, 1,
1.601058, 2.42043, 1.036947, 1, 0, 0.2941177, 1,
1.601633, -0.6732601, 2.570659, 1, 0, 0.2862745, 1,
1.602699, -1.765114, 4.054703, 1, 0, 0.282353, 1,
1.603823, -1.919692, 1.92599, 1, 0, 0.2745098, 1,
1.635811, 0.2480738, 0.8711432, 1, 0, 0.2705882, 1,
1.670287, -1.057204, 4.048258, 1, 0, 0.2627451, 1,
1.687984, -0.07070109, 2.852567, 1, 0, 0.2588235, 1,
1.697021, -0.006662987, 0.6924244, 1, 0, 0.2509804, 1,
1.700199, 1.356845, 0.4940947, 1, 0, 0.2470588, 1,
1.708554, -0.2439046, 2.165211, 1, 0, 0.2392157, 1,
1.711555, -0.2568499, 3.061858, 1, 0, 0.2352941, 1,
1.726368, -0.831311, 2.292618, 1, 0, 0.227451, 1,
1.737547, 0.9191889, 1.710853, 1, 0, 0.2235294, 1,
1.743997, 1.203539, 0.3356161, 1, 0, 0.2156863, 1,
1.753794, 1.87357, 1.373999, 1, 0, 0.2117647, 1,
1.771161, 0.5356852, 0.7133461, 1, 0, 0.2039216, 1,
1.786016, 0.9085208, 1.8128, 1, 0, 0.1960784, 1,
1.811929, -0.6715549, 1.185396, 1, 0, 0.1921569, 1,
1.812128, -1.046664, 3.862139, 1, 0, 0.1843137, 1,
1.813179, 1.090488, 0.8654236, 1, 0, 0.1803922, 1,
1.933732, 0.6086559, -0.4427401, 1, 0, 0.172549, 1,
1.942534, 1.020106, 0.05427286, 1, 0, 0.1686275, 1,
1.945346, -1.056557, 2.857587, 1, 0, 0.1607843, 1,
1.962249, -0.01806362, 0.6605974, 1, 0, 0.1568628, 1,
1.969596, 0.1590506, 1.938405, 1, 0, 0.1490196, 1,
1.977181, -1.397548, 3.737803, 1, 0, 0.145098, 1,
2.023537, 0.3397173, 1.046723, 1, 0, 0.1372549, 1,
2.0242, -0.2146357, 3.175221, 1, 0, 0.1333333, 1,
2.029873, -0.1402167, 2.401088, 1, 0, 0.1254902, 1,
2.034374, -1.20619, 1.986648, 1, 0, 0.1215686, 1,
2.044075, -0.2107918, 1.089336, 1, 0, 0.1137255, 1,
2.050441, -1.414744, 1.916581, 1, 0, 0.1098039, 1,
2.06173, -0.7129427, 2.50996, 1, 0, 0.1019608, 1,
2.065812, 1.653634, -0.6121836, 1, 0, 0.09411765, 1,
2.120809, -1.068194, 0.6408851, 1, 0, 0.09019608, 1,
2.16849, 1.323316, 0.1297481, 1, 0, 0.08235294, 1,
2.255887, -0.6243303, 0.3155093, 1, 0, 0.07843138, 1,
2.314749, -0.8807377, 0.6237134, 1, 0, 0.07058824, 1,
2.31655, -0.6123303, 0.9319804, 1, 0, 0.06666667, 1,
2.344079, 0.2654869, 1.220274, 1, 0, 0.05882353, 1,
2.352186, -0.4542572, 3.244682, 1, 0, 0.05490196, 1,
2.426657, -1.721663, 2.628518, 1, 0, 0.04705882, 1,
2.512863, 1.018513, 3.032289, 1, 0, 0.04313726, 1,
2.549576, -0.7172204, 1.009856, 1, 0, 0.03529412, 1,
2.595246, 0.9491881, -0.3162973, 1, 0, 0.03137255, 1,
2.663106, 1.749973, 2.025992, 1, 0, 0.02352941, 1,
2.681781, -0.44231, 1.934376, 1, 0, 0.01960784, 1,
2.905066, -1.558581, 1.719558, 1, 0, 0.01176471, 1,
3.12884, 0.7303547, 3.102053, 1, 0, 0.007843138, 1
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
-0.2895162, -3.767945, -7.370168, 0, -0.5, 0.5, 0.5,
-0.2895162, -3.767945, -7.370168, 1, -0.5, 0.5, 0.5,
-0.2895162, -3.767945, -7.370168, 1, 1.5, 0.5, 0.5,
-0.2895162, -3.767945, -7.370168, 0, 1.5, 0.5, 0.5
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
-4.866695, 0.438527, -7.370168, 0, -0.5, 0.5, 0.5,
-4.866695, 0.438527, -7.370168, 1, -0.5, 0.5, 0.5,
-4.866695, 0.438527, -7.370168, 1, 1.5, 0.5, 0.5,
-4.866695, 0.438527, -7.370168, 0, 1.5, 0.5, 0.5
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
-4.866695, -3.767945, -0.3657601, 0, -0.5, 0.5, 0.5,
-4.866695, -3.767945, -0.3657601, 1, -0.5, 0.5, 0.5,
-4.866695, -3.767945, -0.3657601, 1, 1.5, 0.5, 0.5,
-4.866695, -3.767945, -0.3657601, 0, 1.5, 0.5, 0.5
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
-3, -2.797221, -5.753767,
3, -2.797221, -5.753767,
-3, -2.797221, -5.753767,
-3, -2.959008, -6.023167,
-2, -2.797221, -5.753767,
-2, -2.959008, -6.023167,
-1, -2.797221, -5.753767,
-1, -2.959008, -6.023167,
0, -2.797221, -5.753767,
0, -2.959008, -6.023167,
1, -2.797221, -5.753767,
1, -2.959008, -6.023167,
2, -2.797221, -5.753767,
2, -2.959008, -6.023167,
3, -2.797221, -5.753767,
3, -2.959008, -6.023167
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
-3, -3.282583, -6.561967, 0, -0.5, 0.5, 0.5,
-3, -3.282583, -6.561967, 1, -0.5, 0.5, 0.5,
-3, -3.282583, -6.561967, 1, 1.5, 0.5, 0.5,
-3, -3.282583, -6.561967, 0, 1.5, 0.5, 0.5,
-2, -3.282583, -6.561967, 0, -0.5, 0.5, 0.5,
-2, -3.282583, -6.561967, 1, -0.5, 0.5, 0.5,
-2, -3.282583, -6.561967, 1, 1.5, 0.5, 0.5,
-2, -3.282583, -6.561967, 0, 1.5, 0.5, 0.5,
-1, -3.282583, -6.561967, 0, -0.5, 0.5, 0.5,
-1, -3.282583, -6.561967, 1, -0.5, 0.5, 0.5,
-1, -3.282583, -6.561967, 1, 1.5, 0.5, 0.5,
-1, -3.282583, -6.561967, 0, 1.5, 0.5, 0.5,
0, -3.282583, -6.561967, 0, -0.5, 0.5, 0.5,
0, -3.282583, -6.561967, 1, -0.5, 0.5, 0.5,
0, -3.282583, -6.561967, 1, 1.5, 0.5, 0.5,
0, -3.282583, -6.561967, 0, 1.5, 0.5, 0.5,
1, -3.282583, -6.561967, 0, -0.5, 0.5, 0.5,
1, -3.282583, -6.561967, 1, -0.5, 0.5, 0.5,
1, -3.282583, -6.561967, 1, 1.5, 0.5, 0.5,
1, -3.282583, -6.561967, 0, 1.5, 0.5, 0.5,
2, -3.282583, -6.561967, 0, -0.5, 0.5, 0.5,
2, -3.282583, -6.561967, 1, -0.5, 0.5, 0.5,
2, -3.282583, -6.561967, 1, 1.5, 0.5, 0.5,
2, -3.282583, -6.561967, 0, 1.5, 0.5, 0.5,
3, -3.282583, -6.561967, 0, -0.5, 0.5, 0.5,
3, -3.282583, -6.561967, 1, -0.5, 0.5, 0.5,
3, -3.282583, -6.561967, 1, 1.5, 0.5, 0.5,
3, -3.282583, -6.561967, 0, 1.5, 0.5, 0.5
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
-3.810423, -2, -5.753767,
-3.810423, 3, -5.753767,
-3.810423, -2, -5.753767,
-3.986468, -2, -6.023167,
-3.810423, -1, -5.753767,
-3.986468, -1, -6.023167,
-3.810423, 0, -5.753767,
-3.986468, 0, -6.023167,
-3.810423, 1, -5.753767,
-3.986468, 1, -6.023167,
-3.810423, 2, -5.753767,
-3.986468, 2, -6.023167,
-3.810423, 3, -5.753767,
-3.986468, 3, -6.023167
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
-4.338559, -2, -6.561967, 0, -0.5, 0.5, 0.5,
-4.338559, -2, -6.561967, 1, -0.5, 0.5, 0.5,
-4.338559, -2, -6.561967, 1, 1.5, 0.5, 0.5,
-4.338559, -2, -6.561967, 0, 1.5, 0.5, 0.5,
-4.338559, -1, -6.561967, 0, -0.5, 0.5, 0.5,
-4.338559, -1, -6.561967, 1, -0.5, 0.5, 0.5,
-4.338559, -1, -6.561967, 1, 1.5, 0.5, 0.5,
-4.338559, -1, -6.561967, 0, 1.5, 0.5, 0.5,
-4.338559, 0, -6.561967, 0, -0.5, 0.5, 0.5,
-4.338559, 0, -6.561967, 1, -0.5, 0.5, 0.5,
-4.338559, 0, -6.561967, 1, 1.5, 0.5, 0.5,
-4.338559, 0, -6.561967, 0, 1.5, 0.5, 0.5,
-4.338559, 1, -6.561967, 0, -0.5, 0.5, 0.5,
-4.338559, 1, -6.561967, 1, -0.5, 0.5, 0.5,
-4.338559, 1, -6.561967, 1, 1.5, 0.5, 0.5,
-4.338559, 1, -6.561967, 0, 1.5, 0.5, 0.5,
-4.338559, 2, -6.561967, 0, -0.5, 0.5, 0.5,
-4.338559, 2, -6.561967, 1, -0.5, 0.5, 0.5,
-4.338559, 2, -6.561967, 1, 1.5, 0.5, 0.5,
-4.338559, 2, -6.561967, 0, 1.5, 0.5, 0.5,
-4.338559, 3, -6.561967, 0, -0.5, 0.5, 0.5,
-4.338559, 3, -6.561967, 1, -0.5, 0.5, 0.5,
-4.338559, 3, -6.561967, 1, 1.5, 0.5, 0.5,
-4.338559, 3, -6.561967, 0, 1.5, 0.5, 0.5
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
-3.810423, -2.797221, -4,
-3.810423, -2.797221, 4,
-3.810423, -2.797221, -4,
-3.986468, -2.959008, -4,
-3.810423, -2.797221, -2,
-3.986468, -2.959008, -2,
-3.810423, -2.797221, 0,
-3.986468, -2.959008, 0,
-3.810423, -2.797221, 2,
-3.986468, -2.959008, 2,
-3.810423, -2.797221, 4,
-3.986468, -2.959008, 4
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
-4.338559, -3.282583, -4, 0, -0.5, 0.5, 0.5,
-4.338559, -3.282583, -4, 1, -0.5, 0.5, 0.5,
-4.338559, -3.282583, -4, 1, 1.5, 0.5, 0.5,
-4.338559, -3.282583, -4, 0, 1.5, 0.5, 0.5,
-4.338559, -3.282583, -2, 0, -0.5, 0.5, 0.5,
-4.338559, -3.282583, -2, 1, -0.5, 0.5, 0.5,
-4.338559, -3.282583, -2, 1, 1.5, 0.5, 0.5,
-4.338559, -3.282583, -2, 0, 1.5, 0.5, 0.5,
-4.338559, -3.282583, 0, 0, -0.5, 0.5, 0.5,
-4.338559, -3.282583, 0, 1, -0.5, 0.5, 0.5,
-4.338559, -3.282583, 0, 1, 1.5, 0.5, 0.5,
-4.338559, -3.282583, 0, 0, 1.5, 0.5, 0.5,
-4.338559, -3.282583, 2, 0, -0.5, 0.5, 0.5,
-4.338559, -3.282583, 2, 1, -0.5, 0.5, 0.5,
-4.338559, -3.282583, 2, 1, 1.5, 0.5, 0.5,
-4.338559, -3.282583, 2, 0, 1.5, 0.5, 0.5,
-4.338559, -3.282583, 4, 0, -0.5, 0.5, 0.5,
-4.338559, -3.282583, 4, 1, -0.5, 0.5, 0.5,
-4.338559, -3.282583, 4, 1, 1.5, 0.5, 0.5,
-4.338559, -3.282583, 4, 0, 1.5, 0.5, 0.5
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
-3.810423, -2.797221, -5.753767,
-3.810423, 3.674275, -5.753767,
-3.810423, -2.797221, 5.022246,
-3.810423, 3.674275, 5.022246,
-3.810423, -2.797221, -5.753767,
-3.810423, -2.797221, 5.022246,
-3.810423, 3.674275, -5.753767,
-3.810423, 3.674275, 5.022246,
-3.810423, -2.797221, -5.753767,
3.23139, -2.797221, -5.753767,
-3.810423, -2.797221, 5.022246,
3.23139, -2.797221, 5.022246,
-3.810423, 3.674275, -5.753767,
3.23139, 3.674275, -5.753767,
-3.810423, 3.674275, 5.022246,
3.23139, 3.674275, 5.022246,
3.23139, -2.797221, -5.753767,
3.23139, 3.674275, -5.753767,
3.23139, -2.797221, 5.022246,
3.23139, 3.674275, 5.022246,
3.23139, -2.797221, -5.753767,
3.23139, -2.797221, 5.022246,
3.23139, 3.674275, -5.753767,
3.23139, 3.674275, 5.022246
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
var radius = 7.69358;
var distance = 34.22961;
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
mvMatrix.translate( 0.2895162, -0.438527, 0.3657601 );
mvMatrix.scale( 1.181294, 1.285398, 0.7719414 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.22961);
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
gentamycin<-read.table("gentamycin.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-gentamycin$V2
```

```
## Error in eval(expr, envir, enclos): object 'gentamycin' not found
```

```r
y<-gentamycin$V3
```

```
## Error in eval(expr, envir, enclos): object 'gentamycin' not found
```

```r
z<-gentamycin$V4
```

```
## Error in eval(expr, envir, enclos): object 'gentamycin' not found
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
-3.707872, 0.5109931, 0.1922245, 0, 0, 1, 1, 1,
-2.977294, 0.4508644, -1.546569, 1, 0, 0, 1, 1,
-2.623012, -0.433741, -0.1170159, 1, 0, 0, 1, 1,
-2.600976, 0.7756442, -1.917261, 1, 0, 0, 1, 1,
-2.579271, 1.886091, -1.876624, 1, 0, 0, 1, 1,
-2.577172, 2.726302, -0.5475178, 1, 0, 0, 1, 1,
-2.46989, -0.8900896, -2.084279, 0, 0, 0, 1, 1,
-2.447767, -1.64051, -3.192111, 0, 0, 0, 1, 1,
-2.447517, 1.394627, -0.9006227, 0, 0, 0, 1, 1,
-2.352905, -1.028867, 0.4497848, 0, 0, 0, 1, 1,
-2.320415, -0.0829347, -1.167116, 0, 0, 0, 1, 1,
-2.227032, 0.05429796, -0.5878206, 0, 0, 0, 1, 1,
-2.181838, 0.09076032, -0.1045803, 0, 0, 0, 1, 1,
-2.171224, 0.2423177, -3.453187, 1, 1, 1, 1, 1,
-2.105742, 0.8276245, -2.119079, 1, 1, 1, 1, 1,
-2.103832, -0.4467675, -0.1372277, 1, 1, 1, 1, 1,
-2.089866, 0.2485657, -1.642911, 1, 1, 1, 1, 1,
-2.087797, 0.2677209, -1.815606, 1, 1, 1, 1, 1,
-2.082322, 0.962337, -0.9558159, 1, 1, 1, 1, 1,
-2.06766, -0.7962613, -2.560966, 1, 1, 1, 1, 1,
-2.046703, -0.8544493, -0.4476853, 1, 1, 1, 1, 1,
-2.022253, 0.6851058, -1.196473, 1, 1, 1, 1, 1,
-2.018518, 0.007877599, -2.087079, 1, 1, 1, 1, 1,
-1.926209, -2.702976, -1.473339, 1, 1, 1, 1, 1,
-1.924617, -1.72403, -2.126858, 1, 1, 1, 1, 1,
-1.919164, 1.526849, -0.7149673, 1, 1, 1, 1, 1,
-1.918859, -0.5752941, -0.02601322, 1, 1, 1, 1, 1,
-1.900989, -1.329652, -1.010334, 1, 1, 1, 1, 1,
-1.890813, 0.899935, -1.135973, 0, 0, 1, 1, 1,
-1.837184, -0.7237427, -3.208137, 1, 0, 0, 1, 1,
-1.824354, -0.4835244, -1.134485, 1, 0, 0, 1, 1,
-1.809045, 0.9064072, -1.178018, 1, 0, 0, 1, 1,
-1.808915, -1.803418, -1.575294, 1, 0, 0, 1, 1,
-1.806658, 0.08990504, -0.9498803, 1, 0, 0, 1, 1,
-1.804884, 0.8510259, -2.141022, 0, 0, 0, 1, 1,
-1.788427, -0.3438596, -4.493366, 0, 0, 0, 1, 1,
-1.776645, 0.2917709, -1.394451, 0, 0, 0, 1, 1,
-1.774122, -1.989448, -0.7076765, 0, 0, 0, 1, 1,
-1.763748, -0.4095311, -0.7849112, 0, 0, 0, 1, 1,
-1.752285, 0.9399928, 0.7603966, 0, 0, 0, 1, 1,
-1.744496, -0.9144213, -1.880589, 0, 0, 0, 1, 1,
-1.742699, -0.680393, -1.600564, 1, 1, 1, 1, 1,
-1.742329, 0.9597419, -1.290096, 1, 1, 1, 1, 1,
-1.732385, 0.3482752, -0.2894607, 1, 1, 1, 1, 1,
-1.726059, 0.198514, -0.8171592, 1, 1, 1, 1, 1,
-1.714115, -0.6830825, -1.370015, 1, 1, 1, 1, 1,
-1.671531, 1.521432, -1.121392, 1, 1, 1, 1, 1,
-1.653145, 0.2810763, 0.5485746, 1, 1, 1, 1, 1,
-1.637, 0.7016751, -1.672169, 1, 1, 1, 1, 1,
-1.630225, -0.04834051, -0.4994134, 1, 1, 1, 1, 1,
-1.613669, 0.7015797, -1.547476, 1, 1, 1, 1, 1,
-1.612858, -1.528265, -2.641758, 1, 1, 1, 1, 1,
-1.591161, 1.558374, -0.4320366, 1, 1, 1, 1, 1,
-1.58762, 0.8327913, -0.7250132, 1, 1, 1, 1, 1,
-1.576522, -1.833187, -2.995759, 1, 1, 1, 1, 1,
-1.576248, 0.6454801, -3.136299, 1, 1, 1, 1, 1,
-1.575324, 0.6691426, -2.268183, 0, 0, 1, 1, 1,
-1.567005, 0.6742607, -2.788558, 1, 0, 0, 1, 1,
-1.566719, -0.6549761, 0.3622855, 1, 0, 0, 1, 1,
-1.564119, -0.2579324, -1.768039, 1, 0, 0, 1, 1,
-1.560144, 0.54206, -0.9389713, 1, 0, 0, 1, 1,
-1.559958, 2.554777, 1.424389, 1, 0, 0, 1, 1,
-1.558609, -1.578439, -2.046209, 0, 0, 0, 1, 1,
-1.552411, -1.297803, -2.751624, 0, 0, 0, 1, 1,
-1.551424, -1.17009, -2.176107, 0, 0, 0, 1, 1,
-1.535821, -1.307949, -0.3178013, 0, 0, 0, 1, 1,
-1.531044, -0.4943723, 0.08269741, 0, 0, 0, 1, 1,
-1.500537, 0.6861412, -1.516816, 0, 0, 0, 1, 1,
-1.480967, -0.5243082, -1.572261, 0, 0, 0, 1, 1,
-1.464143, 1.197671, 0.9398283, 1, 1, 1, 1, 1,
-1.462482, 0.4998707, -2.122703, 1, 1, 1, 1, 1,
-1.462127, 0.6444236, -0.4441676, 1, 1, 1, 1, 1,
-1.456002, 0.1525044, -1.6081, 1, 1, 1, 1, 1,
-1.443874, 0.2174419, -0.7893124, 1, 1, 1, 1, 1,
-1.436902, -0.08720091, -1.103836, 1, 1, 1, 1, 1,
-1.431648, -1.072814, -2.787663, 1, 1, 1, 1, 1,
-1.427698, 2.301483, -1.602972, 1, 1, 1, 1, 1,
-1.425092, 0.342976, -3.067156, 1, 1, 1, 1, 1,
-1.41795, -2.571743, 0.05869276, 1, 1, 1, 1, 1,
-1.417744, -0.7560638, -1.624491, 1, 1, 1, 1, 1,
-1.415754, 2.313063, -0.2010695, 1, 1, 1, 1, 1,
-1.40739, 0.7795415, -2.321946, 1, 1, 1, 1, 1,
-1.406931, 1.054469, -1.857782, 1, 1, 1, 1, 1,
-1.39642, -0.261977, -1.629048, 1, 1, 1, 1, 1,
-1.392545, -1.303622, -2.703517, 0, 0, 1, 1, 1,
-1.389357, -1.366705, -0.4659675, 1, 0, 0, 1, 1,
-1.38523, -0.5225874, -2.459886, 1, 0, 0, 1, 1,
-1.374173, 0.8168973, -1.141388, 1, 0, 0, 1, 1,
-1.37221, -1.313709, -1.824866, 1, 0, 0, 1, 1,
-1.370017, 0.1212208, -3.287302, 1, 0, 0, 1, 1,
-1.339261, 0.3188792, -3.079141, 0, 0, 0, 1, 1,
-1.338955, -1.110474, -4.444948, 0, 0, 0, 1, 1,
-1.331391, 1.659894, -1.48204, 0, 0, 0, 1, 1,
-1.330735, -1.535498, -0.1224154, 0, 0, 0, 1, 1,
-1.310524, 0.8525399, -0.6392773, 0, 0, 0, 1, 1,
-1.308203, -1.419076, -3.429003, 0, 0, 0, 1, 1,
-1.302065, -0.5942058, -1.436316, 0, 0, 0, 1, 1,
-1.296944, 1.075835, -2.761281, 1, 1, 1, 1, 1,
-1.29552, 0.5155714, 1.253748, 1, 1, 1, 1, 1,
-1.28927, 0.2372932, -0.00615544, 1, 1, 1, 1, 1,
-1.277764, 0.3835901, -2.765087, 1, 1, 1, 1, 1,
-1.276426, 1.169518, -0.4185217, 1, 1, 1, 1, 1,
-1.266207, 1.52948, -0.1270126, 1, 1, 1, 1, 1,
-1.264675, 0.009816791, -0.7653776, 1, 1, 1, 1, 1,
-1.255715, 0.1976012, -1.738523, 1, 1, 1, 1, 1,
-1.25299, -0.8224056, -2.52949, 1, 1, 1, 1, 1,
-1.251364, 2.177975, -0.5023624, 1, 1, 1, 1, 1,
-1.238451, -1.989569, -2.628514, 1, 1, 1, 1, 1,
-1.237139, 1.249447, -0.238616, 1, 1, 1, 1, 1,
-1.232843, 0.3787622, -0.9460199, 1, 1, 1, 1, 1,
-1.226592, -0.2394108, -2.226522, 1, 1, 1, 1, 1,
-1.226063, -0.6926132, -0.4966639, 1, 1, 1, 1, 1,
-1.225548, 0.1445661, -1.621949, 0, 0, 1, 1, 1,
-1.219203, 0.3627513, -0.973638, 1, 0, 0, 1, 1,
-1.217039, -0.003154799, -2.13634, 1, 0, 0, 1, 1,
-1.201554, 0.554899, -1.107635, 1, 0, 0, 1, 1,
-1.190471, -0.7027807, -1.181402, 1, 0, 0, 1, 1,
-1.189558, -2.027476, -3.287648, 1, 0, 0, 1, 1,
-1.187182, 0.3422354, -0.7002477, 0, 0, 0, 1, 1,
-1.186448, -0.733085, -2.928591, 0, 0, 0, 1, 1,
-1.184077, -1.363613, -1.144452, 0, 0, 0, 1, 1,
-1.178318, 0.9128808, -1.091254, 0, 0, 0, 1, 1,
-1.175389, 0.5709329, -1.400989, 0, 0, 0, 1, 1,
-1.16343, -0.4438607, -2.437997, 0, 0, 0, 1, 1,
-1.159738, 1.046405, -2.124599, 0, 0, 0, 1, 1,
-1.150148, -0.4693313, -1.648111, 1, 1, 1, 1, 1,
-1.145708, 1.21202, 0.2151741, 1, 1, 1, 1, 1,
-1.143207, 0.002290371, -3.145825, 1, 1, 1, 1, 1,
-1.131293, 0.814957, -0.09607887, 1, 1, 1, 1, 1,
-1.128699, -0.2241116, -4.381033, 1, 1, 1, 1, 1,
-1.125662, -0.3812511, -2.61126, 1, 1, 1, 1, 1,
-1.119859, -0.867209, -2.314577, 1, 1, 1, 1, 1,
-1.115817, -0.115572, -2.118803, 1, 1, 1, 1, 1,
-1.104515, 1.501809, -0.6523168, 1, 1, 1, 1, 1,
-1.103408, 0.2055018, 0.0464788, 1, 1, 1, 1, 1,
-1.101963, 1.049964, -1.086213, 1, 1, 1, 1, 1,
-1.100333, 1.559628, 0.596891, 1, 1, 1, 1, 1,
-1.097129, -2.454741, -2.26156, 1, 1, 1, 1, 1,
-1.095319, 1.293197, -1.850798, 1, 1, 1, 1, 1,
-1.094894, -0.5270786, -2.355676, 1, 1, 1, 1, 1,
-1.088589, 1.961771, 1.162825, 0, 0, 1, 1, 1,
-1.086785, 1.00955, -0.9508336, 1, 0, 0, 1, 1,
-1.084466, 1.033535, -1.187947, 1, 0, 0, 1, 1,
-1.083339, -1.170185, -2.00737, 1, 0, 0, 1, 1,
-1.078948, 0.008722097, -1.912488, 1, 0, 0, 1, 1,
-1.07359, -0.7010905, -1.136317, 1, 0, 0, 1, 1,
-1.072793, 0.3581976, 0.2641796, 0, 0, 0, 1, 1,
-1.069109, 2.404384, -0.1852813, 0, 0, 0, 1, 1,
-1.065339, -2.230189, -2.224521, 0, 0, 0, 1, 1,
-1.064825, -0.00431332, -1.022183, 0, 0, 0, 1, 1,
-1.060705, -0.2960597, -2.460846, 0, 0, 0, 1, 1,
-1.055186, 0.1666097, -1.64528, 0, 0, 0, 1, 1,
-1.05325, 0.8263893, -0.2411701, 0, 0, 0, 1, 1,
-1.049345, 1.08683, 0.06026874, 1, 1, 1, 1, 1,
-1.043559, -0.0764844, -0.4319019, 1, 1, 1, 1, 1,
-1.042209, 0.5276898, 0.521734, 1, 1, 1, 1, 1,
-1.040701, 0.2037784, -1.13793, 1, 1, 1, 1, 1,
-1.036868, -0.3200302, -2.332547, 1, 1, 1, 1, 1,
-1.035871, 0.3682264, -0.7079369, 1, 1, 1, 1, 1,
-1.029496, 0.1260067, -1.01728, 1, 1, 1, 1, 1,
-1.02253, -0.6840779, -1.983003, 1, 1, 1, 1, 1,
-1.018999, -0.3571807, -1.725748, 1, 1, 1, 1, 1,
-1.016246, 0.3981508, -0.9701239, 1, 1, 1, 1, 1,
-1.010854, -1.04239, -2.347698, 1, 1, 1, 1, 1,
-1.008468, 0.8489864, -1.09324, 1, 1, 1, 1, 1,
-0.9976221, -0.4739524, -0.9157189, 1, 1, 1, 1, 1,
-0.993885, -0.3011802, -1.551925, 1, 1, 1, 1, 1,
-0.9710488, 0.7211515, -0.8813163, 1, 1, 1, 1, 1,
-0.9700162, -1.393335, -1.651803, 0, 0, 1, 1, 1,
-0.9652053, -0.1683338, 0.03142213, 1, 0, 0, 1, 1,
-0.9610725, 0.8257182, 0.8645539, 1, 0, 0, 1, 1,
-0.9584455, -0.3639966, -3.153963, 1, 0, 0, 1, 1,
-0.9572578, -0.00560838, -2.90356, 1, 0, 0, 1, 1,
-0.9447316, 0.7067327, -0.6605517, 1, 0, 0, 1, 1,
-0.9442469, 1.683207, -0.0799557, 0, 0, 0, 1, 1,
-0.9424927, 0.7804931, -0.5819556, 0, 0, 0, 1, 1,
-0.9404418, 0.7387055, -1.833636, 0, 0, 0, 1, 1,
-0.9391971, -0.8461099, -2.788004, 0, 0, 0, 1, 1,
-0.9339765, 0.1587223, -1.016244, 0, 0, 0, 1, 1,
-0.9327686, 0.1889243, -0.7475802, 0, 0, 0, 1, 1,
-0.9220474, 1.827327, -0.2579815, 0, 0, 0, 1, 1,
-0.9153934, -0.2946856, -2.480865, 1, 1, 1, 1, 1,
-0.9128727, 0.05677326, -2.533792, 1, 1, 1, 1, 1,
-0.9091037, -1.263201, -3.802595, 1, 1, 1, 1, 1,
-0.9088845, 0.1703116, -1.195544, 1, 1, 1, 1, 1,
-0.9083904, 0.5794146, 1.352735, 1, 1, 1, 1, 1,
-0.8987159, 0.2594394, -2.719611, 1, 1, 1, 1, 1,
-0.8967434, 1.454415, -1.072444, 1, 1, 1, 1, 1,
-0.8927412, -0.6205236, -2.922219, 1, 1, 1, 1, 1,
-0.891426, 1.035872, 0.816755, 1, 1, 1, 1, 1,
-0.8911262, -1.628444, -2.584615, 1, 1, 1, 1, 1,
-0.8801697, 0.4279537, -1.893265, 1, 1, 1, 1, 1,
-0.8786309, 0.3380837, -4.311572, 1, 1, 1, 1, 1,
-0.875944, 0.1822261, -3.579718, 1, 1, 1, 1, 1,
-0.8746158, 0.5546062, -2.768735, 1, 1, 1, 1, 1,
-0.8740315, 2.385906, -1.386507, 1, 1, 1, 1, 1,
-0.8695462, 0.1293741, -0.996056, 0, 0, 1, 1, 1,
-0.8672688, 1.220804, -0.9785372, 1, 0, 0, 1, 1,
-0.8621638, -0.8174223, -3.331142, 1, 0, 0, 1, 1,
-0.8599269, 0.9363919, -0.6156846, 1, 0, 0, 1, 1,
-0.8568604, -0.4797941, -1.617696, 1, 0, 0, 1, 1,
-0.8526784, -1.077044, -2.34828, 1, 0, 0, 1, 1,
-0.8480491, 0.8817334, -1.454146, 0, 0, 0, 1, 1,
-0.8462681, -0.0583394, -1.498713, 0, 0, 0, 1, 1,
-0.8447236, -1.062147, -2.157553, 0, 0, 0, 1, 1,
-0.841044, -1.380698, -3.855068, 0, 0, 0, 1, 1,
-0.8394885, 1.073476, -0.5254084, 0, 0, 0, 1, 1,
-0.8366219, -1.585787, -2.98435, 0, 0, 0, 1, 1,
-0.8361365, 1.398402, -1.31048, 0, 0, 0, 1, 1,
-0.8327193, 0.03926273, 0.6164448, 1, 1, 1, 1, 1,
-0.8315767, 1.027107, 0.8925048, 1, 1, 1, 1, 1,
-0.8306762, -1.065964, -4.350094, 1, 1, 1, 1, 1,
-0.8303516, -0.4111453, -2.654966, 1, 1, 1, 1, 1,
-0.82455, 0.5983238, -1.216586, 1, 1, 1, 1, 1,
-0.8202699, -1.296449, -1.417298, 1, 1, 1, 1, 1,
-0.8154484, -0.1077187, -2.74805, 1, 1, 1, 1, 1,
-0.8138033, 0.1945569, -0.5659806, 1, 1, 1, 1, 1,
-0.8135803, 0.3435531, -0.9171608, 1, 1, 1, 1, 1,
-0.8107186, -0.08121012, -2.383538, 1, 1, 1, 1, 1,
-0.8079566, -0.6224242, -1.749303, 1, 1, 1, 1, 1,
-0.8072339, -0.3232849, -1.379626, 1, 1, 1, 1, 1,
-0.8015025, -0.7752591, -0.888392, 1, 1, 1, 1, 1,
-0.7978845, 0.4811249, -0.6941098, 1, 1, 1, 1, 1,
-0.795197, -0.8867899, -2.783054, 1, 1, 1, 1, 1,
-0.7911826, 1.082222, -1.306457, 0, 0, 1, 1, 1,
-0.7862254, 0.8286851, 0.9559445, 1, 0, 0, 1, 1,
-0.7823877, 0.4587031, -1.169079, 1, 0, 0, 1, 1,
-0.7789285, -0.3547492, -3.220356, 1, 0, 0, 1, 1,
-0.7751676, 1.056221, -2.245719, 1, 0, 0, 1, 1,
-0.7751649, 0.1957108, -1.310097, 1, 0, 0, 1, 1,
-0.7749609, 1.405841, -0.557642, 0, 0, 0, 1, 1,
-0.7727481, -0.3024395, -1.478979, 0, 0, 0, 1, 1,
-0.7690355, 0.5521538, 0.1919201, 0, 0, 0, 1, 1,
-0.7654305, -1.111111, -2.959751, 0, 0, 0, 1, 1,
-0.7621927, -1.224579, -0.2758909, 0, 0, 0, 1, 1,
-0.7619735, -1.123277, -1.509215, 0, 0, 0, 1, 1,
-0.7579396, 0.4867513, -0.5275792, 0, 0, 0, 1, 1,
-0.7522977, -0.7058425, -1.205938, 1, 1, 1, 1, 1,
-0.7509767, -0.02017904, -2.547879, 1, 1, 1, 1, 1,
-0.7474728, 1.620966, 1.084582, 1, 1, 1, 1, 1,
-0.7419656, 1.081044, -1.567919, 1, 1, 1, 1, 1,
-0.7394752, 1.422595, -0.771364, 1, 1, 1, 1, 1,
-0.7379377, 0.825555, 0.9187387, 1, 1, 1, 1, 1,
-0.7373775, -0.4545282, 0.01083842, 1, 1, 1, 1, 1,
-0.7365906, 0.05178249, -2.282826, 1, 1, 1, 1, 1,
-0.7352329, 0.2397048, -1.957287, 1, 1, 1, 1, 1,
-0.7344617, -1.056106, -3.620898, 1, 1, 1, 1, 1,
-0.7250782, -0.5456467, -2.641994, 1, 1, 1, 1, 1,
-0.7174208, -1.769644, -3.733914, 1, 1, 1, 1, 1,
-0.7160487, 0.9877735, -0.7457917, 1, 1, 1, 1, 1,
-0.7122783, 1.053108, -1.761132, 1, 1, 1, 1, 1,
-0.7111035, 0.07481461, -1.578207, 1, 1, 1, 1, 1,
-0.7083143, -0.5332763, -2.137653, 0, 0, 1, 1, 1,
-0.708096, -0.7074137, -2.539128, 1, 0, 0, 1, 1,
-0.7056499, 0.4600236, -0.6265745, 1, 0, 0, 1, 1,
-0.7052934, -0.5177438, -2.281879, 1, 0, 0, 1, 1,
-0.7033547, 1.335845, 0.4991903, 1, 0, 0, 1, 1,
-0.7005493, 0.4687441, -0.4604504, 1, 0, 0, 1, 1,
-0.7000879, -0.5655546, -2.638307, 0, 0, 0, 1, 1,
-0.7000476, -0.02874111, -1.940599, 0, 0, 0, 1, 1,
-0.6987416, -1.224342, -2.291996, 0, 0, 0, 1, 1,
-0.6972242, -0.8229455, -1.903006, 0, 0, 0, 1, 1,
-0.6964644, 1.676333, -0.5642135, 0, 0, 0, 1, 1,
-0.6945388, 0.7320339, -0.6232547, 0, 0, 0, 1, 1,
-0.6931247, -1.114539, -3.430548, 0, 0, 0, 1, 1,
-0.6873716, -0.1790342, -1.608034, 1, 1, 1, 1, 1,
-0.6862562, 0.1134425, 0.2202558, 1, 1, 1, 1, 1,
-0.685849, 1.153382, 0.01363307, 1, 1, 1, 1, 1,
-0.6800284, 0.1604541, -0.9260702, 1, 1, 1, 1, 1,
-0.6793517, -1.090582, -2.390025, 1, 1, 1, 1, 1,
-0.6743668, 0.6510953, -0.3709325, 1, 1, 1, 1, 1,
-0.6709958, -1.183238, -3.343434, 1, 1, 1, 1, 1,
-0.6693706, -1.148106, -1.856601, 1, 1, 1, 1, 1,
-0.6688569, 1.665994, -1.303113, 1, 1, 1, 1, 1,
-0.662532, 0.07752758, -1.726655, 1, 1, 1, 1, 1,
-0.6374792, 1.860402, 0.9601965, 1, 1, 1, 1, 1,
-0.6272619, 0.3869011, -1.40072, 1, 1, 1, 1, 1,
-0.6214047, 0.6813242, -1.118008, 1, 1, 1, 1, 1,
-0.620998, 1.19876, -0.647832, 1, 1, 1, 1, 1,
-0.6197201, 0.3732636, -0.4481828, 1, 1, 1, 1, 1,
-0.618627, 0.06117608, -1.989679, 0, 0, 1, 1, 1,
-0.6179559, 0.643275, -1.911014, 1, 0, 0, 1, 1,
-0.6076661, 0.7821035, -1.646588, 1, 0, 0, 1, 1,
-0.6057549, -1.013291, -1.643116, 1, 0, 0, 1, 1,
-0.5990728, -0.4115197, -2.638974, 1, 0, 0, 1, 1,
-0.5933938, -1.009479, -2.186852, 1, 0, 0, 1, 1,
-0.592303, 0.006165937, 0.2299646, 0, 0, 0, 1, 1,
-0.5909961, 0.360403, -2.417055, 0, 0, 0, 1, 1,
-0.5909753, 1.748587, -0.349158, 0, 0, 0, 1, 1,
-0.5874106, 1.195027, 0.7893466, 0, 0, 0, 1, 1,
-0.5872918, 1.500666, -0.3676018, 0, 0, 0, 1, 1,
-0.5872443, 0.6835816, -1.57165, 0, 0, 0, 1, 1,
-0.575737, -0.3999796, -3.032492, 0, 0, 0, 1, 1,
-0.5724249, -1.331386, -3.181098, 1, 1, 1, 1, 1,
-0.5710827, 0.288539, -0.6100259, 1, 1, 1, 1, 1,
-0.5702298, -0.8280382, -2.105109, 1, 1, 1, 1, 1,
-0.5685576, -0.3122009, -1.598553, 1, 1, 1, 1, 1,
-0.5670642, -0.3778726, -0.2366435, 1, 1, 1, 1, 1,
-0.5652949, 1.231344, -0.2884654, 1, 1, 1, 1, 1,
-0.5636178, -1.475427, -1.548378, 1, 1, 1, 1, 1,
-0.5632859, 0.2942121, -0.3423682, 1, 1, 1, 1, 1,
-0.5610985, -0.878648, -1.912617, 1, 1, 1, 1, 1,
-0.5600402, -0.1520804, -2.70485, 1, 1, 1, 1, 1,
-0.5581728, -1.148552, -2.7054, 1, 1, 1, 1, 1,
-0.5506927, 0.05415732, -3.605822, 1, 1, 1, 1, 1,
-0.5498326, -0.6759821, -2.149677, 1, 1, 1, 1, 1,
-0.5473687, 0.09302786, -1.47789, 1, 1, 1, 1, 1,
-0.5417253, 1.185873, -0.9291313, 1, 1, 1, 1, 1,
-0.5331908, -0.8676338, 0.8180668, 0, 0, 1, 1, 1,
-0.5325966, 0.1238968, -2.752, 1, 0, 0, 1, 1,
-0.5275632, 0.2832868, -2.32097, 1, 0, 0, 1, 1,
-0.5271672, -0.8183684, -1.424417, 1, 0, 0, 1, 1,
-0.5244641, 1.018683, -2.351736, 1, 0, 0, 1, 1,
-0.5210664, -0.2115609, -2.017557, 1, 0, 0, 1, 1,
-0.5131775, -0.02512414, -0.9090239, 0, 0, 0, 1, 1,
-0.5085737, 2.326215, -2.996161, 0, 0, 0, 1, 1,
-0.5085083, -0.8044388, -1.565373, 0, 0, 0, 1, 1,
-0.4984268, -1.796129, -1.480735, 0, 0, 0, 1, 1,
-0.4933505, -1.556209, -4.026326, 0, 0, 0, 1, 1,
-0.4912801, 1.082981, -0.9298041, 0, 0, 0, 1, 1,
-0.4901082, 1.089248, 0.8838614, 0, 0, 0, 1, 1,
-0.4841211, 0.09572149, -3.334546, 1, 1, 1, 1, 1,
-0.4822212, 1.574888, -0.1961838, 1, 1, 1, 1, 1,
-0.4771939, 0.4786149, -1.407822, 1, 1, 1, 1, 1,
-0.4761955, 1.625125, 0.4422221, 1, 1, 1, 1, 1,
-0.4695533, -2.15744, -2.850383, 1, 1, 1, 1, 1,
-0.4691315, -0.3163741, -2.685452, 1, 1, 1, 1, 1,
-0.4680458, -0.6753137, -2.171907, 1, 1, 1, 1, 1,
-0.4634117, -0.1947496, 0.9327174, 1, 1, 1, 1, 1,
-0.4630162, 0.08041044, -2.59252, 1, 1, 1, 1, 1,
-0.4617567, 0.806391, -0.728174, 1, 1, 1, 1, 1,
-0.45996, -1.340247, -3.097369, 1, 1, 1, 1, 1,
-0.4563153, 0.7551673, -0.6753706, 1, 1, 1, 1, 1,
-0.4557262, 0.434126, -0.6640466, 1, 1, 1, 1, 1,
-0.4532186, -1.89895, -3.411393, 1, 1, 1, 1, 1,
-0.4526826, -1.09254, -2.2785, 1, 1, 1, 1, 1,
-0.4486245, 0.6749622, -0.5569857, 0, 0, 1, 1, 1,
-0.4482587, -1.643635, -2.594389, 1, 0, 0, 1, 1,
-0.4452604, 0.6130066, -1.111218, 1, 0, 0, 1, 1,
-0.4444872, 0.7479956, -0.18607, 1, 0, 0, 1, 1,
-0.4419928, 0.6610939, -0.2914897, 1, 0, 0, 1, 1,
-0.4412265, -0.3420429, -3.066621, 1, 0, 0, 1, 1,
-0.4387122, -2.283329, -5.074804, 0, 0, 0, 1, 1,
-0.4330969, 0.8859956, -0.3389286, 0, 0, 0, 1, 1,
-0.4318851, 1.598889, 1.044116, 0, 0, 0, 1, 1,
-0.4274628, 0.2607231, -1.61466, 0, 0, 0, 1, 1,
-0.4257654, -0.2315599, -1.402786, 0, 0, 0, 1, 1,
-0.4204996, 1.888718, -0.6057016, 0, 0, 0, 1, 1,
-0.4186467, -1.079473, -1.602228, 0, 0, 0, 1, 1,
-0.4119391, -0.2253084, -2.447353, 1, 1, 1, 1, 1,
-0.4113547, -0.3916058, -2.791819, 1, 1, 1, 1, 1,
-0.4082148, -0.8192195, -2.939916, 1, 1, 1, 1, 1,
-0.4060174, 2.246159, 0.2647628, 1, 1, 1, 1, 1,
-0.4016732, 1.521086, -0.559783, 1, 1, 1, 1, 1,
-0.4011529, -0.7506702, -4.400525, 1, 1, 1, 1, 1,
-0.3967761, 1.085698, -1.399077, 1, 1, 1, 1, 1,
-0.3967537, -0.5764182, -3.014853, 1, 1, 1, 1, 1,
-0.3943759, -0.9971431, -1.448218, 1, 1, 1, 1, 1,
-0.3935375, 0.09249071, -1.532527, 1, 1, 1, 1, 1,
-0.3884208, -0.9252365, -1.551946, 1, 1, 1, 1, 1,
-0.387157, -0.2709987, -0.2646734, 1, 1, 1, 1, 1,
-0.3859576, 0.1049832, -0.9003992, 1, 1, 1, 1, 1,
-0.3808206, 0.4005747, -1.902702, 1, 1, 1, 1, 1,
-0.3789203, -2.232595, -3.849596, 1, 1, 1, 1, 1,
-0.3762878, -1.234117, -0.12542, 0, 0, 1, 1, 1,
-0.3759805, -0.3670805, -3.039352, 1, 0, 0, 1, 1,
-0.374887, 0.4666167, 0.7274495, 1, 0, 0, 1, 1,
-0.3732171, 1.513853, -0.3135519, 1, 0, 0, 1, 1,
-0.3694696, 0.9450135, 0.4957859, 1, 0, 0, 1, 1,
-0.3668654, -0.5249001, -3.518533, 1, 0, 0, 1, 1,
-0.3615065, -0.8604745, -2.592022, 0, 0, 0, 1, 1,
-0.3578296, -0.05232004, -2.741967, 0, 0, 0, 1, 1,
-0.3557735, -1.610822, -1.89302, 0, 0, 0, 1, 1,
-0.3552657, -0.6536335, -1.546192, 0, 0, 0, 1, 1,
-0.3543844, 0.6149668, 0.4899584, 0, 0, 0, 1, 1,
-0.3383744, 0.8311155, 1.361691, 0, 0, 0, 1, 1,
-0.330897, -0.6645758, -0.1610464, 0, 0, 0, 1, 1,
-0.3308134, 0.6466175, -1.308767, 1, 1, 1, 1, 1,
-0.3272544, 1.475108, -1.795169, 1, 1, 1, 1, 1,
-0.3267848, 0.6518341, -2.236348, 1, 1, 1, 1, 1,
-0.3256362, 1.021297, -0.3038361, 1, 1, 1, 1, 1,
-0.3247284, -0.1758769, -2.084652, 1, 1, 1, 1, 1,
-0.3237961, -0.07316492, -2.16192, 1, 1, 1, 1, 1,
-0.3212988, -0.4279992, -4.041005, 1, 1, 1, 1, 1,
-0.3210239, 0.3500951, 0.2853716, 1, 1, 1, 1, 1,
-0.3210076, 0.6514353, -0.2624108, 1, 1, 1, 1, 1,
-0.3206137, 1.263327, 0.2923185, 1, 1, 1, 1, 1,
-0.3201625, -0.09392834, -2.063235, 1, 1, 1, 1, 1,
-0.3160101, -1.67997, -2.650548, 1, 1, 1, 1, 1,
-0.3078668, -0.1331191, -1.314914, 1, 1, 1, 1, 1,
-0.3010232, -0.4710639, -2.954663, 1, 1, 1, 1, 1,
-0.2994508, 1.479333, -1.639528, 1, 1, 1, 1, 1,
-0.2972162, -0.660655, -2.436814, 0, 0, 1, 1, 1,
-0.29566, 0.6061976, -1.65878, 1, 0, 0, 1, 1,
-0.2922083, -0.2300805, -0.7290233, 1, 0, 0, 1, 1,
-0.291854, 1.060945, -0.98616, 1, 0, 0, 1, 1,
-0.2879302, 1.078111, 0.4058841, 1, 0, 0, 1, 1,
-0.287734, 0.2303531, -1.191879, 1, 0, 0, 1, 1,
-0.2876152, -1.002602, -4.298782, 0, 0, 0, 1, 1,
-0.2790527, -0.361008, -1.202363, 0, 0, 0, 1, 1,
-0.2764309, -0.7149133, -4.015582, 0, 0, 0, 1, 1,
-0.2751543, -0.7459556, -5.596834, 0, 0, 0, 1, 1,
-0.2739874, 1.215995, -1.925135, 0, 0, 0, 1, 1,
-0.2728722, 0.5464776, 0.5188004, 0, 0, 0, 1, 1,
-0.2727993, -0.007436549, -1.334177, 0, 0, 0, 1, 1,
-0.2715936, -1.502374, -4.226622, 1, 1, 1, 1, 1,
-0.2669422, 0.8251798, -1.301195, 1, 1, 1, 1, 1,
-0.2652584, 0.993204, -0.08638599, 1, 1, 1, 1, 1,
-0.2639609, 0.4572338, 0.219207, 1, 1, 1, 1, 1,
-0.2632123, 1.498292, 0.6993846, 1, 1, 1, 1, 1,
-0.2621942, 0.07857963, -2.747539, 1, 1, 1, 1, 1,
-0.2621537, -0.07003748, -2.440982, 1, 1, 1, 1, 1,
-0.2618682, 1.558807, -0.003923052, 1, 1, 1, 1, 1,
-0.2617397, 0.804799, 2.557829, 1, 1, 1, 1, 1,
-0.2614348, 2.476161, -0.1010602, 1, 1, 1, 1, 1,
-0.2507629, 1.077621, -2.315297, 1, 1, 1, 1, 1,
-0.249543, 2.162545, -0.05628019, 1, 1, 1, 1, 1,
-0.2483031, 2.284092, 0.738543, 1, 1, 1, 1, 1,
-0.2478476, 0.106383, -2.352004, 1, 1, 1, 1, 1,
-0.2458288, -0.409337, -1.905069, 1, 1, 1, 1, 1,
-0.2457273, 0.09220207, -0.1892513, 0, 0, 1, 1, 1,
-0.2392983, -2.273569, -2.045915, 1, 0, 0, 1, 1,
-0.2370119, 1.305822, 0.05854228, 1, 0, 0, 1, 1,
-0.2331452, -1.093163, -3.463182, 1, 0, 0, 1, 1,
-0.2296058, 0.1402362, 0.3707884, 1, 0, 0, 1, 1,
-0.2264527, -0.1607807, -1.563528, 1, 0, 0, 1, 1,
-0.2174727, 0.1443173, -0.908889, 0, 0, 0, 1, 1,
-0.2166477, 0.5244, -0.2667755, 0, 0, 0, 1, 1,
-0.2162828, 0.3423579, -0.6063683, 0, 0, 0, 1, 1,
-0.2147888, -2.299092, -1.982611, 0, 0, 0, 1, 1,
-0.214596, 0.3042658, -2.119612, 0, 0, 0, 1, 1,
-0.2143616, -0.9655364, -1.735861, 0, 0, 0, 1, 1,
-0.2062923, 2.397762, -0.2009638, 0, 0, 0, 1, 1,
-0.2053733, -1.476514, -2.759413, 1, 1, 1, 1, 1,
-0.2040355, 0.5175882, 0.3297933, 1, 1, 1, 1, 1,
-0.1978855, 2.455708, -1.121133, 1, 1, 1, 1, 1,
-0.194818, -0.5764585, -4.025454, 1, 1, 1, 1, 1,
-0.1925137, -0.7160149, -2.458257, 1, 1, 1, 1, 1,
-0.1918999, -1.884416, -2.988518, 1, 1, 1, 1, 1,
-0.1898691, 0.255272, -1.971464, 1, 1, 1, 1, 1,
-0.1865166, 1.378295, 0.01557168, 1, 1, 1, 1, 1,
-0.1818624, 0.4563026, 0.3603377, 1, 1, 1, 1, 1,
-0.1816983, -0.8691665, -2.598344, 1, 1, 1, 1, 1,
-0.1780167, -1.451562, -5.437404, 1, 1, 1, 1, 1,
-0.1763465, -0.5555933, -3.878235, 1, 1, 1, 1, 1,
-0.1692487, 0.4732004, 1.128492, 1, 1, 1, 1, 1,
-0.159898, -0.2337212, -2.29422, 1, 1, 1, 1, 1,
-0.159806, 0.1773125, -1.528893, 1, 1, 1, 1, 1,
-0.154309, -1.263796, -3.271681, 0, 0, 1, 1, 1,
-0.1534881, -0.2183557, -1.748954, 1, 0, 0, 1, 1,
-0.1529646, -0.9787625, -3.186019, 1, 0, 0, 1, 1,
-0.1492898, 0.8383863, 2.086666, 1, 0, 0, 1, 1,
-0.1478567, -0.2811224, -3.204111, 1, 0, 0, 1, 1,
-0.1471841, -0.7793827, -2.069348, 1, 0, 0, 1, 1,
-0.142892, -0.05080097, -1.412813, 0, 0, 0, 1, 1,
-0.1396573, -0.3902601, -1.674731, 0, 0, 0, 1, 1,
-0.1383802, 1.686937, 0.5020997, 0, 0, 0, 1, 1,
-0.1346198, 1.550946, -0.6122332, 0, 0, 0, 1, 1,
-0.131656, -0.00142268, -0.1605596, 0, 0, 0, 1, 1,
-0.1308926, 0.1640254, -0.6456111, 0, 0, 0, 1, 1,
-0.1228575, -0.2237499, -2.346656, 0, 0, 0, 1, 1,
-0.1197195, 0.2212104, -0.09647572, 1, 1, 1, 1, 1,
-0.1129393, -1.585244, -3.231179, 1, 1, 1, 1, 1,
-0.1070947, -1.210612, -1.788729, 1, 1, 1, 1, 1,
-0.1064282, 1.235233, 0.2994525, 1, 1, 1, 1, 1,
-0.1020476, 0.5687814, -1.400721, 1, 1, 1, 1, 1,
-0.1009681, -0.06964913, -2.039742, 1, 1, 1, 1, 1,
-0.1000134, -0.06410245, -3.446343, 1, 1, 1, 1, 1,
-0.09872236, 2.545627, -0.4946201, 1, 1, 1, 1, 1,
-0.09716313, -0.5641297, -3.482501, 1, 1, 1, 1, 1,
-0.09461334, 1.171171, -0.09497453, 1, 1, 1, 1, 1,
-0.09374464, -0.9482483, -2.996871, 1, 1, 1, 1, 1,
-0.09219164, -0.005976751, -1.400978, 1, 1, 1, 1, 1,
-0.09024718, -1.524124, -2.110145, 1, 1, 1, 1, 1,
-0.08803287, -0.8542899, -2.94732, 1, 1, 1, 1, 1,
-0.08798209, 0.2030583, -0.2050024, 1, 1, 1, 1, 1,
-0.08681466, 0.5497061, 0.4723071, 0, 0, 1, 1, 1,
-0.08490907, -1.441283, -2.98071, 1, 0, 0, 1, 1,
-0.08020934, 0.1821719, 0.09200935, 1, 0, 0, 1, 1,
-0.07862692, -0.7691529, -2.944304, 1, 0, 0, 1, 1,
-0.07843958, 0.9269773, -2.361332, 1, 0, 0, 1, 1,
-0.07688377, 0.8952383, 2.452831, 1, 0, 0, 1, 1,
-0.07161966, -0.3885995, -3.66028, 0, 0, 0, 1, 1,
-0.06986965, 0.8725325, -0.2593223, 0, 0, 0, 1, 1,
-0.06915772, 1.008962, 1.243001, 0, 0, 0, 1, 1,
-0.06826751, -0.5309247, -3.2773, 0, 0, 0, 1, 1,
-0.06280013, -1.047522, -2.115787, 0, 0, 0, 1, 1,
-0.06203325, -0.06170024, -2.105784, 0, 0, 0, 1, 1,
-0.05401356, 0.3874627, -0.4261279, 0, 0, 0, 1, 1,
-0.0512595, -0.3856838, -2.906994, 1, 1, 1, 1, 1,
-0.04994682, -0.8513445, -3.536068, 1, 1, 1, 1, 1,
-0.04783159, 0.7923344, 0.4314815, 1, 1, 1, 1, 1,
-0.04672625, -0.2047614, -2.930673, 1, 1, 1, 1, 1,
-0.04583227, -1.1921, -1.829758, 1, 1, 1, 1, 1,
-0.04490286, 0.06059585, -0.1635667, 1, 1, 1, 1, 1,
-0.04138302, -0.842248, -3.732634, 1, 1, 1, 1, 1,
-0.03990902, -0.4114742, -3.582181, 1, 1, 1, 1, 1,
-0.03950151, -0.7729694, -2.082135, 1, 1, 1, 1, 1,
-0.03911324, 2.245727, 0.3817858, 1, 1, 1, 1, 1,
-0.03570505, 0.4927169, -1.863828, 1, 1, 1, 1, 1,
-0.03556224, -0.2835453, -3.809002, 1, 1, 1, 1, 1,
-0.03469645, -0.6456054, -2.615533, 1, 1, 1, 1, 1,
-0.03183152, 0.4540526, -0.6737384, 1, 1, 1, 1, 1,
-0.03078895, 0.2058093, 0.9943001, 1, 1, 1, 1, 1,
-0.03042691, -0.4527829, -4.354206, 0, 0, 1, 1, 1,
-0.03021668, -1.241711, -4.240286, 1, 0, 0, 1, 1,
-0.02907467, 0.4029676, -1.232134, 1, 0, 0, 1, 1,
-0.02870425, 1.293469, -0.6216804, 1, 0, 0, 1, 1,
-0.02803173, -0.508164, -1.728867, 1, 0, 0, 1, 1,
-0.02665765, -0.05147799, -1.465146, 1, 0, 0, 1, 1,
-0.0233185, 0.5733739, 0.9515271, 0, 0, 0, 1, 1,
-0.01772692, -0.214269, -2.627905, 0, 0, 0, 1, 1,
-0.0109715, -1.786811, -4.568756, 0, 0, 0, 1, 1,
-0.007810283, 1.580176, 0.9656177, 0, 0, 0, 1, 1,
-0.007351391, -1.800432, -2.967486, 0, 0, 0, 1, 1,
-0.004679287, -0.2209341, -2.757502, 0, 0, 0, 1, 1,
-0.0008382465, 0.01810688, -0.9886398, 0, 0, 0, 1, 1,
-0.0006584969, -1.337743, -4.914579, 1, 1, 1, 1, 1,
0.0002940473, -0.3238283, 2.112328, 1, 1, 1, 1, 1,
0.003551613, 0.3034005, -0.7726123, 1, 1, 1, 1, 1,
0.007017034, 1.575126, -0.3507713, 1, 1, 1, 1, 1,
0.02276167, -0.7786861, 3.546153, 1, 1, 1, 1, 1,
0.02624386, 0.8387585, 0.0677551, 1, 1, 1, 1, 1,
0.03229475, -0.8034205, 1.889206, 1, 1, 1, 1, 1,
0.03474303, 2.186575, -0.9132087, 1, 1, 1, 1, 1,
0.03527028, 0.5723055, 1.000359, 1, 1, 1, 1, 1,
0.035317, -0.7263656, 4.711215, 1, 1, 1, 1, 1,
0.03716827, 0.2534208, 0.326764, 1, 1, 1, 1, 1,
0.04602893, -1.027357, 2.732933, 1, 1, 1, 1, 1,
0.05177452, -1.391747, 4.277323, 1, 1, 1, 1, 1,
0.05535944, -0.8999685, 2.733261, 1, 1, 1, 1, 1,
0.05588244, -0.3220073, 3.068999, 1, 1, 1, 1, 1,
0.05671797, -0.7693838, 1.778138, 0, 0, 1, 1, 1,
0.07322506, 0.2721249, 1.743419, 1, 0, 0, 1, 1,
0.07605571, -0.6048824, 2.728709, 1, 0, 0, 1, 1,
0.07640467, 1.700014, -0.4395128, 1, 0, 0, 1, 1,
0.07699888, -0.03405795, 0.9452733, 1, 0, 0, 1, 1,
0.080048, 0.2250492, -2.786558, 1, 0, 0, 1, 1,
0.08381887, 0.2525031, 1.033827, 0, 0, 0, 1, 1,
0.09586405, -2.280396, 4.455211, 0, 0, 0, 1, 1,
0.09800694, -0.593705, 3.140999, 0, 0, 0, 1, 1,
0.100384, 0.4375556, 0.523636, 0, 0, 0, 1, 1,
0.1004626, -1.105653, 2.988881, 0, 0, 0, 1, 1,
0.1020203, 1.663042, 0.1083174, 0, 0, 0, 1, 1,
0.1039175, 0.1776222, 0.7056946, 0, 0, 0, 1, 1,
0.1040188, 0.3536356, -0.07387538, 1, 1, 1, 1, 1,
0.1059118, -0.6115667, 2.653875, 1, 1, 1, 1, 1,
0.1075587, -0.2617625, 2.932271, 1, 1, 1, 1, 1,
0.1134282, 1.126439, -1.325561, 1, 1, 1, 1, 1,
0.1150869, -2.114699, 2.979732, 1, 1, 1, 1, 1,
0.1195155, -1.568913, 3.100207, 1, 1, 1, 1, 1,
0.1257459, -0.8062972, 1.620126, 1, 1, 1, 1, 1,
0.1258425, 0.202202, -0.3532662, 1, 1, 1, 1, 1,
0.1259576, -0.6916468, 4.493693, 1, 1, 1, 1, 1,
0.1275546, 0.3641578, 1.577375, 1, 1, 1, 1, 1,
0.1289736, 0.1055687, 1.109691, 1, 1, 1, 1, 1,
0.1315635, -1.762711, 3.43156, 1, 1, 1, 1, 1,
0.1332107, -1.25654, 1.50585, 1, 1, 1, 1, 1,
0.1359288, 1.705498, 0.1520952, 1, 1, 1, 1, 1,
0.1365337, 1.979111, 1.093271, 1, 1, 1, 1, 1,
0.1436984, -1.828036, 3.133147, 0, 0, 1, 1, 1,
0.1443168, 1.265779, -0.8126559, 1, 0, 0, 1, 1,
0.1533321, -0.8240608, 2.290931, 1, 0, 0, 1, 1,
0.1558261, 0.7676688, -0.1949677, 1, 0, 0, 1, 1,
0.1573659, -0.6863623, 2.035179, 1, 0, 0, 1, 1,
0.1652162, 0.7881495, -1.616568, 1, 0, 0, 1, 1,
0.1656333, 0.9409567, 1.609471, 0, 0, 0, 1, 1,
0.1661534, 1.533723, 0.6586088, 0, 0, 0, 1, 1,
0.1673885, 1.851048, -0.9421921, 0, 0, 0, 1, 1,
0.1705884, -0.3162286, 3.390716, 0, 0, 0, 1, 1,
0.1718873, 2.420844, -0.8935562, 0, 0, 0, 1, 1,
0.1734206, 1.445748, -2.433343, 0, 0, 0, 1, 1,
0.1766583, 0.1412815, 1.758533, 0, 0, 0, 1, 1,
0.1823368, 0.2194037, 0.4301781, 1, 1, 1, 1, 1,
0.1856204, 1.459605, 0.3097019, 1, 1, 1, 1, 1,
0.1866633, 1.05488, -0.2567176, 1, 1, 1, 1, 1,
0.1875053, -0.3878496, 2.050306, 1, 1, 1, 1, 1,
0.189237, -0.6773938, 1.840025, 1, 1, 1, 1, 1,
0.194624, -0.699221, 3.371787, 1, 1, 1, 1, 1,
0.1951394, -0.7661374, 3.025102, 1, 1, 1, 1, 1,
0.195806, 0.1114685, 1.785094, 1, 1, 1, 1, 1,
0.1976628, -0.5435267, 3.318336, 1, 1, 1, 1, 1,
0.1977153, 1.728117, -0.6149706, 1, 1, 1, 1, 1,
0.1997231, -0.08949733, 2.100012, 1, 1, 1, 1, 1,
0.2015566, 1.441256, -0.4062084, 1, 1, 1, 1, 1,
0.2019828, 0.3237534, 1.107556, 1, 1, 1, 1, 1,
0.2061579, -0.9432454, 4.436373, 1, 1, 1, 1, 1,
0.2066208, -0.3549109, 2.434376, 1, 1, 1, 1, 1,
0.2103069, 0.4841067, 0.685231, 0, 0, 1, 1, 1,
0.2105055, 0.7642846, -0.4822643, 1, 0, 0, 1, 1,
0.2144015, -0.6056451, 2.24223, 1, 0, 0, 1, 1,
0.2172656, -1.388056, 1.331666, 1, 0, 0, 1, 1,
0.2243821, 0.6970732, 0.6019352, 1, 0, 0, 1, 1,
0.2249808, 0.1244731, 1.345661, 1, 0, 0, 1, 1,
0.2278575, -0.4548452, 3.203968, 0, 0, 0, 1, 1,
0.229328, -0.1036121, 2.568877, 0, 0, 0, 1, 1,
0.229987, -1.373484, 1.891723, 0, 0, 0, 1, 1,
0.2358971, -0.1379777, 3.120935, 0, 0, 0, 1, 1,
0.2372059, 0.06735315, 0.9168928, 0, 0, 0, 1, 1,
0.2415291, 0.5755084, -0.193773, 0, 0, 0, 1, 1,
0.2431331, 1.455645, -0.07075813, 0, 0, 0, 1, 1,
0.2431788, -0.6171568, 2.473595, 1, 1, 1, 1, 1,
0.2457931, -1.034476, 3.751941, 1, 1, 1, 1, 1,
0.2462021, -0.26771, 3.89292, 1, 1, 1, 1, 1,
0.249392, 0.6569436, -1.109741, 1, 1, 1, 1, 1,
0.2538907, 0.5615938, 1.567212, 1, 1, 1, 1, 1,
0.2549587, 0.6899813, 0.5086249, 1, 1, 1, 1, 1,
0.2572939, 0.4302051, -1.358614, 1, 1, 1, 1, 1,
0.2593327, 0.5600131, 1.247876, 1, 1, 1, 1, 1,
0.2596846, -0.6230922, 4.173744, 1, 1, 1, 1, 1,
0.2609991, -0.2603258, 1.604385, 1, 1, 1, 1, 1,
0.2628773, -0.1542625, 1.694957, 1, 1, 1, 1, 1,
0.2675283, -1.612151, 2.354833, 1, 1, 1, 1, 1,
0.2752616, -1.113721, 3.181951, 1, 1, 1, 1, 1,
0.2786112, 1.463779, 0.3260781, 1, 1, 1, 1, 1,
0.2832079, -0.04885197, 1.275707, 1, 1, 1, 1, 1,
0.2837513, -0.2391036, 3.70355, 0, 0, 1, 1, 1,
0.2856798, 0.07724413, 0.6980234, 1, 0, 0, 1, 1,
0.2892196, 1.200678, 0.698061, 1, 0, 0, 1, 1,
0.293273, -0.5422903, 4.443301, 1, 0, 0, 1, 1,
0.2950293, -0.3949653, 2.393866, 1, 0, 0, 1, 1,
0.2988631, 1.442561, 1.211255, 1, 0, 0, 1, 1,
0.3065168, -0.4726773, 1.433587, 0, 0, 0, 1, 1,
0.3123744, 0.5436687, 0.6721715, 0, 0, 0, 1, 1,
0.3147267, -1.064239, 3.129125, 0, 0, 0, 1, 1,
0.3179948, 0.2326005, 0.8098206, 0, 0, 0, 1, 1,
0.3193924, 1.568811, 0.7586803, 0, 0, 0, 1, 1,
0.3201784, 2.083889, 1.067236, 0, 0, 0, 1, 1,
0.3239354, 2.184269, 1.965291, 0, 0, 0, 1, 1,
0.3261092, -0.2569285, 1.95866, 1, 1, 1, 1, 1,
0.3267641, -0.4314891, 2.397827, 1, 1, 1, 1, 1,
0.3303483, 0.1085036, 0.793102, 1, 1, 1, 1, 1,
0.3355145, 1.148045, -0.3897186, 1, 1, 1, 1, 1,
0.335653, -0.7431397, 2.892822, 1, 1, 1, 1, 1,
0.3373608, 0.9313162, -0.5290668, 1, 1, 1, 1, 1,
0.3381632, 0.6620088, 0.3887282, 1, 1, 1, 1, 1,
0.3407054, 0.3397318, 0.3413059, 1, 1, 1, 1, 1,
0.3440593, 0.09614587, 1.500599, 1, 1, 1, 1, 1,
0.3445865, -0.4206245, 1.177477, 1, 1, 1, 1, 1,
0.3456401, -0.241795, 2.174225, 1, 1, 1, 1, 1,
0.3475638, -0.6273055, 3.469353, 1, 1, 1, 1, 1,
0.3498432, -1.043897, 4.053602, 1, 1, 1, 1, 1,
0.3506298, -1.212491, 3.414262, 1, 1, 1, 1, 1,
0.3599915, 1.660981, -0.1787539, 1, 1, 1, 1, 1,
0.3694633, -1.226957, 3.562283, 0, 0, 1, 1, 1,
0.3696226, -0.1922366, 2.936552, 1, 0, 0, 1, 1,
0.3702228, 0.916017, -0.1422222, 1, 0, 0, 1, 1,
0.3711223, -0.3739491, 0.9251361, 1, 0, 0, 1, 1,
0.372339, -0.2597797, 1.037251, 1, 0, 0, 1, 1,
0.3735813, 0.2372934, 0.7445971, 1, 0, 0, 1, 1,
0.3742143, 2.130952, -0.5590426, 0, 0, 0, 1, 1,
0.37618, 0.9290003, -0.02738135, 0, 0, 0, 1, 1,
0.3765011, 0.3264108, 0.4664991, 0, 0, 0, 1, 1,
0.3808188, 0.1088265, -0.3653468, 0, 0, 0, 1, 1,
0.3855627, 0.276848, 2.000338, 0, 0, 0, 1, 1,
0.387231, -0.223748, 1.918264, 0, 0, 0, 1, 1,
0.388584, -0.80618, 1.669441, 0, 0, 0, 1, 1,
0.391095, 0.9783316, 0.8725362, 1, 1, 1, 1, 1,
0.391291, 1.010237, 0.4892224, 1, 1, 1, 1, 1,
0.3946514, -0.7833232, 3.987919, 1, 1, 1, 1, 1,
0.3964659, -0.9436876, 2.232753, 1, 1, 1, 1, 1,
0.3998732, 0.08101407, -1.057913, 1, 1, 1, 1, 1,
0.3998929, 0.0748354, 1.126802, 1, 1, 1, 1, 1,
0.4019397, -0.4506461, 2.625531, 1, 1, 1, 1, 1,
0.4036144, 1.271118, 2.931889, 1, 1, 1, 1, 1,
0.4042251, -2.167295, 3.812326, 1, 1, 1, 1, 1,
0.4049216, 1.708591, 1.336046, 1, 1, 1, 1, 1,
0.4152131, 0.08931787, 0.2118696, 1, 1, 1, 1, 1,
0.4155502, -2.549571, 3.024934, 1, 1, 1, 1, 1,
0.4171999, 0.1246754, 1.094755, 1, 1, 1, 1, 1,
0.4192574, -2.261249, 2.444201, 1, 1, 1, 1, 1,
0.4275486, -1.195643, 1.550483, 1, 1, 1, 1, 1,
0.4286295, 0.914225, 0.9368868, 0, 0, 1, 1, 1,
0.4295155, 0.2259667, 1.110381, 1, 0, 0, 1, 1,
0.4302588, -0.08816753, 2.874156, 1, 0, 0, 1, 1,
0.4351321, 1.235848, -0.06001639, 1, 0, 0, 1, 1,
0.436068, -0.7205486, 1.706173, 1, 0, 0, 1, 1,
0.4361652, 0.1960292, 1.220518, 1, 0, 0, 1, 1,
0.4492164, -0.7128112, 1.760882, 0, 0, 0, 1, 1,
0.4557551, -0.4240269, 2.798198, 0, 0, 0, 1, 1,
0.4559154, -1.001538, 3.113925, 0, 0, 0, 1, 1,
0.4573467, 0.2507122, 2.166456, 0, 0, 0, 1, 1,
0.4604694, 0.0531672, 1.06901, 0, 0, 0, 1, 1,
0.4616181, -0.5882495, 3.157869, 0, 0, 0, 1, 1,
0.4661148, 0.8416674, 0.696595, 0, 0, 0, 1, 1,
0.4694353, -0.0002507556, 2.397712, 1, 1, 1, 1, 1,
0.4703866, 0.2454772, 0.9044665, 1, 1, 1, 1, 1,
0.4720742, 1.522092, -1.338475, 1, 1, 1, 1, 1,
0.4728364, 0.6949635, 1.394795, 1, 1, 1, 1, 1,
0.4740045, -0.4248491, 2.273277, 1, 1, 1, 1, 1,
0.4747955, 2.13532, 1.476459, 1, 1, 1, 1, 1,
0.4757506, 2.548384, 1.416794, 1, 1, 1, 1, 1,
0.4759304, 0.7167259, -0.4877775, 1, 1, 1, 1, 1,
0.478668, -0.2838046, 3.32994, 1, 1, 1, 1, 1,
0.4794422, -0.9890567, 2.187698, 1, 1, 1, 1, 1,
0.4811509, -0.03966309, 1.322003, 1, 1, 1, 1, 1,
0.4812874, 2.167899, 1.145813, 1, 1, 1, 1, 1,
0.4818656, 0.4342492, 0.236448, 1, 1, 1, 1, 1,
0.4820254, -0.8633774, 1.900536, 1, 1, 1, 1, 1,
0.4913769, 3.58003, 0.2207756, 1, 1, 1, 1, 1,
0.5058685, 0.3434087, -0.6464373, 0, 0, 1, 1, 1,
0.5078365, 0.5990396, -0.3812692, 1, 0, 0, 1, 1,
0.5090953, -1.262226, 2.583856, 1, 0, 0, 1, 1,
0.5135134, -0.05846217, 2.289842, 1, 0, 0, 1, 1,
0.5139398, -1.306997, 1.331918, 1, 0, 0, 1, 1,
0.5148328, 0.1923452, 2.529673, 1, 0, 0, 1, 1,
0.5170159, -0.6006285, 3.240805, 0, 0, 0, 1, 1,
0.5184661, -1.093366, 2.573708, 0, 0, 0, 1, 1,
0.5189146, -0.5166075, 3.310127, 0, 0, 0, 1, 1,
0.5193145, -1.795646, 3.848408, 0, 0, 0, 1, 1,
0.5221326, -0.1700877, 2.907809, 0, 0, 0, 1, 1,
0.5327392, -0.7278682, 1.668966, 0, 0, 0, 1, 1,
0.5402759, -0.9494633, 1.285982, 0, 0, 0, 1, 1,
0.5421697, -0.6622072, 2.702899, 1, 1, 1, 1, 1,
0.5423687, 0.5271567, 0.8993787, 1, 1, 1, 1, 1,
0.5428852, -0.6330124, 3.712989, 1, 1, 1, 1, 1,
0.5459531, 0.8629904, 0.8283805, 1, 1, 1, 1, 1,
0.552398, -0.3633936, 2.251084, 1, 1, 1, 1, 1,
0.5534289, -0.3252141, 0.04378311, 1, 1, 1, 1, 1,
0.555859, -1.300819, 1.985333, 1, 1, 1, 1, 1,
0.5596212, -0.7552598, 1.957048, 1, 1, 1, 1, 1,
0.5627705, -0.9072199, 4.397257, 1, 1, 1, 1, 1,
0.5639811, -0.03803231, 2.063965, 1, 1, 1, 1, 1,
0.56527, 1.016384, 2.19212, 1, 1, 1, 1, 1,
0.5656161, 1.074479, 0.4127411, 1, 1, 1, 1, 1,
0.5660866, -0.5149885, 1.639841, 1, 1, 1, 1, 1,
0.5673378, -1.990257, 1.265305, 1, 1, 1, 1, 1,
0.5775735, 0.3241104, 1.970387, 1, 1, 1, 1, 1,
0.578876, -0.5476985, 2.794431, 0, 0, 1, 1, 1,
0.580807, -0.1967353, 1.705232, 1, 0, 0, 1, 1,
0.5816236, 1.023084, 1.79186, 1, 0, 0, 1, 1,
0.5833838, 0.3546776, -2.185898, 1, 0, 0, 1, 1,
0.58442, 0.4150588, -0.3006743, 1, 0, 0, 1, 1,
0.5917268, 0.09204786, 1.359613, 1, 0, 0, 1, 1,
0.5972492, 1.429099, -0.5206062, 0, 0, 0, 1, 1,
0.6053204, 1.915452, -0.6280889, 0, 0, 0, 1, 1,
0.6075469, 0.9699585, -0.1695193, 0, 0, 0, 1, 1,
0.6098515, -1.906449, 2.086112, 0, 0, 0, 1, 1,
0.6124207, -0.3686313, 1.395815, 0, 0, 0, 1, 1,
0.6155689, -0.8244104, 2.038013, 0, 0, 0, 1, 1,
0.6172705, -0.1578652, 1.218436, 0, 0, 0, 1, 1,
0.6173902, -0.2830941, 0.6077163, 1, 1, 1, 1, 1,
0.6189415, 0.470068, -0.8110599, 1, 1, 1, 1, 1,
0.6215457, 0.644682, 0.944373, 1, 1, 1, 1, 1,
0.6223431, -0.4746601, 2.269694, 1, 1, 1, 1, 1,
0.6258659, 0.7727588, 1.539749, 1, 1, 1, 1, 1,
0.626937, 1.819617, 1.718987, 1, 1, 1, 1, 1,
0.6313618, -0.9004841, 4.254938, 1, 1, 1, 1, 1,
0.6414827, -1.2586, 2.895183, 1, 1, 1, 1, 1,
0.6540855, -1.488538, 3.415671, 1, 1, 1, 1, 1,
0.6584388, -0.009602183, 2.256203, 1, 1, 1, 1, 1,
0.6594285, -1.484016, 2.204138, 1, 1, 1, 1, 1,
0.6600093, -0.3353987, 2.035258, 1, 1, 1, 1, 1,
0.6621853, -0.02754063, 0.2085492, 1, 1, 1, 1, 1,
0.6650473, 0.9875064, 1.679694, 1, 1, 1, 1, 1,
0.6715971, -1.158055, 3.07647, 1, 1, 1, 1, 1,
0.6721897, 0.05058972, 1.9808, 0, 0, 1, 1, 1,
0.6736174, -0.1309228, 2.453007, 1, 0, 0, 1, 1,
0.6772866, -1.421762, 3.414547, 1, 0, 0, 1, 1,
0.6808318, -0.1950968, 1.638309, 1, 0, 0, 1, 1,
0.682579, -0.5490446, 1.782254, 1, 0, 0, 1, 1,
0.6842747, 0.9082925, 0.2870238, 1, 0, 0, 1, 1,
0.6901612, 0.5373394, 1.228237, 0, 0, 0, 1, 1,
0.694849, -0.7108676, 1.768162, 0, 0, 0, 1, 1,
0.6964952, 1.529377, 0.5585689, 0, 0, 0, 1, 1,
0.6995201, 1.265865, 1.149106, 0, 0, 0, 1, 1,
0.6999754, -0.8386738, 3.234344, 0, 0, 0, 1, 1,
0.7008126, 0.143049, 2.12116, 0, 0, 0, 1, 1,
0.7029506, 0.5754829, -0.4571867, 0, 0, 0, 1, 1,
0.7034775, 0.6026382, 1.045847, 1, 1, 1, 1, 1,
0.708548, 0.0873666, -0.05694565, 1, 1, 1, 1, 1,
0.7094832, 0.4801045, -0.3387642, 1, 1, 1, 1, 1,
0.712484, 1.685823, -0.5242903, 1, 1, 1, 1, 1,
0.7180164, 1.580209, -1.172931, 1, 1, 1, 1, 1,
0.7196591, 0.2346083, 1.113662, 1, 1, 1, 1, 1,
0.7206528, -0.5095962, 1.824664, 1, 1, 1, 1, 1,
0.7223232, -0.2622412, 2.964195, 1, 1, 1, 1, 1,
0.7245344, 0.1435799, 1.027317, 1, 1, 1, 1, 1,
0.735353, 0.01463183, 1.363549, 1, 1, 1, 1, 1,
0.7390169, -0.1383167, 2.712393, 1, 1, 1, 1, 1,
0.7420386, 0.1921182, 2.189984, 1, 1, 1, 1, 1,
0.7425783, -0.5987386, 2.745743, 1, 1, 1, 1, 1,
0.7465208, 0.231561, 2.578904, 1, 1, 1, 1, 1,
0.7469044, -0.8696479, 3.760861, 1, 1, 1, 1, 1,
0.756915, 0.3103316, 0.8042562, 0, 0, 1, 1, 1,
0.761794, 1.254623, 1.596462, 1, 0, 0, 1, 1,
0.7631839, -0.6364853, 2.885275, 1, 0, 0, 1, 1,
0.7699986, 0.5286258, -0.2073493, 1, 0, 0, 1, 1,
0.7709088, 0.03922989, 0.4752445, 1, 0, 0, 1, 1,
0.771073, 1.323698, -0.06450003, 1, 0, 0, 1, 1,
0.7715998, -0.6610563, 1.695088, 0, 0, 0, 1, 1,
0.7723947, -0.4027286, 1.231435, 0, 0, 0, 1, 1,
0.7753254, -1.038715, 2.217012, 0, 0, 0, 1, 1,
0.7768134, -1.348512, 4.865314, 0, 0, 0, 1, 1,
0.7771635, -0.5476862, 1.9883, 0, 0, 0, 1, 1,
0.7778414, 1.755403, 0.477426, 0, 0, 0, 1, 1,
0.781209, -2.067189, 2.853871, 0, 0, 0, 1, 1,
0.7837247, -0.02363117, 0.6472005, 1, 1, 1, 1, 1,
0.7906625, -0.5446236, 4.358846, 1, 1, 1, 1, 1,
0.7916034, -0.7116045, 2.858003, 1, 1, 1, 1, 1,
0.80436, 2.313323, -0.4046062, 1, 1, 1, 1, 1,
0.8043767, 0.3286972, 0.3322482, 1, 1, 1, 1, 1,
0.8063316, 0.2720432, 1.271629, 1, 1, 1, 1, 1,
0.8099406, 0.8995348, 0.2582379, 1, 1, 1, 1, 1,
0.8114085, -1.168114, 2.814918, 1, 1, 1, 1, 1,
0.8167773, -0.4183761, 0.6384875, 1, 1, 1, 1, 1,
0.8225778, -0.09481695, 1.67625, 1, 1, 1, 1, 1,
0.8308723, 0.06422874, 0.8309553, 1, 1, 1, 1, 1,
0.8349844, -1.27195, 2.79106, 1, 1, 1, 1, 1,
0.8363307, -0.9512339, 3.171964, 1, 1, 1, 1, 1,
0.8406288, 0.5072986, 1.106762, 1, 1, 1, 1, 1,
0.842759, -0.7168909, 0.2183176, 1, 1, 1, 1, 1,
0.8444175, 0.9977237, 1.602824, 0, 0, 1, 1, 1,
0.8469323, 0.1977066, 0.9929082, 1, 0, 0, 1, 1,
0.8482502, -0.1687974, 1.38881, 1, 0, 0, 1, 1,
0.8498861, -0.7306404, 2.990833, 1, 0, 0, 1, 1,
0.8500611, -1.65915, 2.163003, 1, 0, 0, 1, 1,
0.8529184, -0.1986584, 0.8253613, 1, 0, 0, 1, 1,
0.8544897, -0.5369575, 2.070281, 0, 0, 0, 1, 1,
0.8550725, -0.8880959, 2.530927, 0, 0, 0, 1, 1,
0.8568166, -0.8912877, 2.24839, 0, 0, 0, 1, 1,
0.8579887, 0.9687144, 1.264945, 0, 0, 0, 1, 1,
0.8637702, 1.35877, 0.2097262, 0, 0, 0, 1, 1,
0.8665108, 0.04230036, 2.430743, 0, 0, 0, 1, 1,
0.867204, -0.2647201, 1.237286, 0, 0, 0, 1, 1,
0.8680863, -0.09736319, 0.9194328, 1, 1, 1, 1, 1,
0.8681228, 0.8517399, 2.335744, 1, 1, 1, 1, 1,
0.8701651, 0.3840888, 3.074429, 1, 1, 1, 1, 1,
0.8718972, -0.5950603, 2.881729, 1, 1, 1, 1, 1,
0.8724787, -0.276274, 0.7553467, 1, 1, 1, 1, 1,
0.8872588, -0.8288908, 3.168037, 1, 1, 1, 1, 1,
0.8912879, -1.064979, 0.7509723, 1, 1, 1, 1, 1,
0.8913494, 0.9990994, 0.524149, 1, 1, 1, 1, 1,
0.8914509, 0.07922734, -0.3249762, 1, 1, 1, 1, 1,
0.8916543, 0.3365149, 2.066024, 1, 1, 1, 1, 1,
0.8932647, -0.5793974, 3.287872, 1, 1, 1, 1, 1,
0.8954574, -0.7597983, 2.411957, 1, 1, 1, 1, 1,
0.9030412, 1.411153, 0.2693317, 1, 1, 1, 1, 1,
0.9036462, 1.264042, -0.4922598, 1, 1, 1, 1, 1,
0.9044732, 0.369134, 0.1461573, 1, 1, 1, 1, 1,
0.912425, -1.149573, 4.374489, 0, 0, 1, 1, 1,
0.9134699, 0.3254381, 2.672159, 1, 0, 0, 1, 1,
0.9145573, 0.3545318, 1.060157, 1, 0, 0, 1, 1,
0.9176217, -1.42649, 3.849059, 1, 0, 0, 1, 1,
0.9176908, 0.3758187, 0.1799379, 1, 0, 0, 1, 1,
0.9182431, -0.9741223, 0.7186203, 1, 0, 0, 1, 1,
0.91932, -1.512187, 0.1141435, 0, 0, 0, 1, 1,
0.9277442, -0.3218783, 0.9236826, 0, 0, 0, 1, 1,
0.9312593, 0.1512289, 2.990734, 0, 0, 0, 1, 1,
0.9338531, -0.5932059, 2.858538, 0, 0, 0, 1, 1,
0.9395579, 0.5816861, 2.214061, 0, 0, 0, 1, 1,
0.9538563, 0.8682697, 1.699466, 0, 0, 0, 1, 1,
0.9542163, 0.4920515, 1.989052, 0, 0, 0, 1, 1,
0.9589879, 0.2076398, 0.8623635, 1, 1, 1, 1, 1,
0.9607681, -0.4739901, 0.9036919, 1, 1, 1, 1, 1,
0.9715697, 0.6694173, 0.6216726, 1, 1, 1, 1, 1,
0.9749771, 0.5501744, 1.195807, 1, 1, 1, 1, 1,
0.9766745, -0.3591823, 2.028588, 1, 1, 1, 1, 1,
0.9794822, -0.8495601, 2.92693, 1, 1, 1, 1, 1,
0.9846225, -0.6951705, 1.772196, 1, 1, 1, 1, 1,
0.9895641, -1.359455, 3.238297, 1, 1, 1, 1, 1,
0.9899308, -1.286929, 2.849958, 1, 1, 1, 1, 1,
0.9929491, 0.3128445, 1.885138, 1, 1, 1, 1, 1,
0.9934433, -0.4057224, 1.989512, 1, 1, 1, 1, 1,
0.9948223, 0.7265421, 1.642277, 1, 1, 1, 1, 1,
0.9980484, 0.5752662, 2.131255, 1, 1, 1, 1, 1,
1.000564, 1.355794, 0.9464728, 1, 1, 1, 1, 1,
1.001847, -0.4113368, 0.8190199, 1, 1, 1, 1, 1,
1.007988, 0.8452349, 1.574916, 0, 0, 1, 1, 1,
1.009264, -0.9239988, 2.224077, 1, 0, 0, 1, 1,
1.023602, 0.501175, 1.345508, 1, 0, 0, 1, 1,
1.025068, 1.100546, -0.3760589, 1, 0, 0, 1, 1,
1.028141, -0.4189803, 0.6562719, 1, 0, 0, 1, 1,
1.032881, -1.679964, 2.167642, 1, 0, 0, 1, 1,
1.03669, -0.1157586, 1.328051, 0, 0, 0, 1, 1,
1.042932, -0.4947764, 1.298292, 0, 0, 0, 1, 1,
1.065373, 0.02579568, -0.2164811, 0, 0, 0, 1, 1,
1.066905, -1.729352, 2.002424, 0, 0, 0, 1, 1,
1.068819, 2.225717, 0.6189178, 0, 0, 0, 1, 1,
1.073127, -0.6000621, 2.067429, 0, 0, 0, 1, 1,
1.073273, -1.314043, 2.047667, 0, 0, 0, 1, 1,
1.081807, 1.288006, 1.020843, 1, 1, 1, 1, 1,
1.084454, 1.732824, -0.2109988, 1, 1, 1, 1, 1,
1.099737, -0.3772224, 1.300299, 1, 1, 1, 1, 1,
1.101276, 1.956352, -0.1821309, 1, 1, 1, 1, 1,
1.122946, 1.083993, 0.9349174, 1, 1, 1, 1, 1,
1.136809, -0.7999648, 2.484309, 1, 1, 1, 1, 1,
1.145789, 1.474031, 1.530475, 1, 1, 1, 1, 1,
1.146848, 0.709469, 1.798835, 1, 1, 1, 1, 1,
1.153397, 0.06506318, 1.044014, 1, 1, 1, 1, 1,
1.156254, -1.018039, 3.735808, 1, 1, 1, 1, 1,
1.17063, -0.5309136, 3.386599, 1, 1, 1, 1, 1,
1.172708, -0.1567885, 1.211362, 1, 1, 1, 1, 1,
1.186196, -0.7306072, 0.7110301, 1, 1, 1, 1, 1,
1.186734, 0.269805, 1.156752, 1, 1, 1, 1, 1,
1.191758, -0.6669467, 2.680952, 1, 1, 1, 1, 1,
1.197699, -1.159393, 1.568386, 0, 0, 1, 1, 1,
1.220162, -0.807967, 0.6283384, 1, 0, 0, 1, 1,
1.237245, -1.378083, 2.704232, 1, 0, 0, 1, 1,
1.23766, 0.8726174, -0.686127, 1, 0, 0, 1, 1,
1.244084, -1.197338, 1.580983, 1, 0, 0, 1, 1,
1.246017, -0.5232909, 0.8590035, 1, 0, 0, 1, 1,
1.246669, -0.006766265, 3.241557, 0, 0, 0, 1, 1,
1.251326, -0.1393636, 0.07142518, 0, 0, 0, 1, 1,
1.255301, 0.1870803, 2.447083, 0, 0, 0, 1, 1,
1.257441, -0.7769689, 1.450827, 0, 0, 0, 1, 1,
1.260015, 0.9566652, 1.146809, 0, 0, 0, 1, 1,
1.263894, -0.1307151, 1.475904, 0, 0, 0, 1, 1,
1.266349, -0.7884488, 1.382546, 0, 0, 0, 1, 1,
1.272511, 0.2631779, 0.4524542, 1, 1, 1, 1, 1,
1.284298, -0.7279224, 1.155336, 1, 1, 1, 1, 1,
1.287397, 0.3589879, 0.9029614, 1, 1, 1, 1, 1,
1.288686, -0.1441968, 0.9834555, 1, 1, 1, 1, 1,
1.288804, 1.266314, -0.07039096, 1, 1, 1, 1, 1,
1.294289, -1.666937, 2.664759, 1, 1, 1, 1, 1,
1.296457, 2.094521, 2.01402, 1, 1, 1, 1, 1,
1.315065, -1.391272, 1.028937, 1, 1, 1, 1, 1,
1.346871, 0.2270075, 0.3625279, 1, 1, 1, 1, 1,
1.347949, -0.9793134, 1.801751, 1, 1, 1, 1, 1,
1.352265, -1.46014, 3.092671, 1, 1, 1, 1, 1,
1.361486, -0.7861449, 3.179859, 1, 1, 1, 1, 1,
1.364653, 0.2036606, 0.7019394, 1, 1, 1, 1, 1,
1.366017, 0.5903435, -1.786794, 1, 1, 1, 1, 1,
1.37406, 1.058922, -1.11203, 1, 1, 1, 1, 1,
1.378056, -0.9368156, 2.04603, 0, 0, 1, 1, 1,
1.379744, 1.527276, 0.2477694, 1, 0, 0, 1, 1,
1.38187, -0.8748817, 1.436312, 1, 0, 0, 1, 1,
1.386809, 0.9820127, -0.06939515, 1, 0, 0, 1, 1,
1.38824, -0.6218584, 1.938489, 1, 0, 0, 1, 1,
1.394346, -0.3141422, 1.488385, 1, 0, 0, 1, 1,
1.396538, -0.4638613, 3.490693, 0, 0, 0, 1, 1,
1.406825, -0.7746059, 2.509538, 0, 0, 0, 1, 1,
1.407547, -0.1626994, -0.006138199, 0, 0, 0, 1, 1,
1.411724, 0.5508979, 0.3996026, 0, 0, 0, 1, 1,
1.411736, 2.060282, -0.6457595, 0, 0, 0, 1, 1,
1.41606, -2.014174, 2.83345, 0, 0, 0, 1, 1,
1.422735, -0.5524591, 1.91699, 0, 0, 0, 1, 1,
1.440391, 0.1232715, 0.8861294, 1, 1, 1, 1, 1,
1.454636, 0.0584894, 2.06435, 1, 1, 1, 1, 1,
1.458992, -0.357344, 3.100985, 1, 1, 1, 1, 1,
1.471444, 1.276428, -0.852868, 1, 1, 1, 1, 1,
1.484589, -1.16706, 2.374542, 1, 1, 1, 1, 1,
1.49253, -0.559599, 1.353794, 1, 1, 1, 1, 1,
1.50385, -0.7830395, 1.457509, 1, 1, 1, 1, 1,
1.526535, -0.4703805, 1.590275, 1, 1, 1, 1, 1,
1.538964, 1.392671, -0.3106824, 1, 1, 1, 1, 1,
1.54572, 1.203397, 0.833127, 1, 1, 1, 1, 1,
1.549011, 0.4277191, 1.410204, 1, 1, 1, 1, 1,
1.552699, -0.6628001, 0.8110371, 1, 1, 1, 1, 1,
1.562937, -1.018788, 2.390631, 1, 1, 1, 1, 1,
1.598089, 0.893182, 0.8003185, 1, 1, 1, 1, 1,
1.601058, 2.42043, 1.036947, 1, 1, 1, 1, 1,
1.601633, -0.6732601, 2.570659, 0, 0, 1, 1, 1,
1.602699, -1.765114, 4.054703, 1, 0, 0, 1, 1,
1.603823, -1.919692, 1.92599, 1, 0, 0, 1, 1,
1.635811, 0.2480738, 0.8711432, 1, 0, 0, 1, 1,
1.670287, -1.057204, 4.048258, 1, 0, 0, 1, 1,
1.687984, -0.07070109, 2.852567, 1, 0, 0, 1, 1,
1.697021, -0.006662987, 0.6924244, 0, 0, 0, 1, 1,
1.700199, 1.356845, 0.4940947, 0, 0, 0, 1, 1,
1.708554, -0.2439046, 2.165211, 0, 0, 0, 1, 1,
1.711555, -0.2568499, 3.061858, 0, 0, 0, 1, 1,
1.726368, -0.831311, 2.292618, 0, 0, 0, 1, 1,
1.737547, 0.9191889, 1.710853, 0, 0, 0, 1, 1,
1.743997, 1.203539, 0.3356161, 0, 0, 0, 1, 1,
1.753794, 1.87357, 1.373999, 1, 1, 1, 1, 1,
1.771161, 0.5356852, 0.7133461, 1, 1, 1, 1, 1,
1.786016, 0.9085208, 1.8128, 1, 1, 1, 1, 1,
1.811929, -0.6715549, 1.185396, 1, 1, 1, 1, 1,
1.812128, -1.046664, 3.862139, 1, 1, 1, 1, 1,
1.813179, 1.090488, 0.8654236, 1, 1, 1, 1, 1,
1.933732, 0.6086559, -0.4427401, 1, 1, 1, 1, 1,
1.942534, 1.020106, 0.05427286, 1, 1, 1, 1, 1,
1.945346, -1.056557, 2.857587, 1, 1, 1, 1, 1,
1.962249, -0.01806362, 0.6605974, 1, 1, 1, 1, 1,
1.969596, 0.1590506, 1.938405, 1, 1, 1, 1, 1,
1.977181, -1.397548, 3.737803, 1, 1, 1, 1, 1,
2.023537, 0.3397173, 1.046723, 1, 1, 1, 1, 1,
2.0242, -0.2146357, 3.175221, 1, 1, 1, 1, 1,
2.029873, -0.1402167, 2.401088, 1, 1, 1, 1, 1,
2.034374, -1.20619, 1.986648, 0, 0, 1, 1, 1,
2.044075, -0.2107918, 1.089336, 1, 0, 0, 1, 1,
2.050441, -1.414744, 1.916581, 1, 0, 0, 1, 1,
2.06173, -0.7129427, 2.50996, 1, 0, 0, 1, 1,
2.065812, 1.653634, -0.6121836, 1, 0, 0, 1, 1,
2.120809, -1.068194, 0.6408851, 1, 0, 0, 1, 1,
2.16849, 1.323316, 0.1297481, 0, 0, 0, 1, 1,
2.255887, -0.6243303, 0.3155093, 0, 0, 0, 1, 1,
2.314749, -0.8807377, 0.6237134, 0, 0, 0, 1, 1,
2.31655, -0.6123303, 0.9319804, 0, 0, 0, 1, 1,
2.344079, 0.2654869, 1.220274, 0, 0, 0, 1, 1,
2.352186, -0.4542572, 3.244682, 0, 0, 0, 1, 1,
2.426657, -1.721663, 2.628518, 0, 0, 0, 1, 1,
2.512863, 1.018513, 3.032289, 1, 1, 1, 1, 1,
2.549576, -0.7172204, 1.009856, 1, 1, 1, 1, 1,
2.595246, 0.9491881, -0.3162973, 1, 1, 1, 1, 1,
2.663106, 1.749973, 2.025992, 1, 1, 1, 1, 1,
2.681781, -0.44231, 1.934376, 1, 1, 1, 1, 1,
2.905066, -1.558581, 1.719558, 1, 1, 1, 1, 1,
3.12884, 0.7303547, 3.102053, 1, 1, 1, 1, 1
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
var radius = 9.557993;
var distance = 33.57205;
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
mvMatrix.translate( 0.2895164, -0.4385269, 0.3657601 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.57205);
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