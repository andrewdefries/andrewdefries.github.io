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
-3.456954, 1.340478, -1.250899, 1, 0, 0, 1,
-2.715054, 0.7884497, -0.3285521, 1, 0.007843138, 0, 1,
-2.537092, -0.3628794, -1.146121, 1, 0.01176471, 0, 1,
-2.514048, 0.8952467, -2.006841, 1, 0.01960784, 0, 1,
-2.501737, 0.8342646, -0.4886043, 1, 0.02352941, 0, 1,
-2.337761, -0.2089212, -2.153181, 1, 0.03137255, 0, 1,
-2.293313, 1.056322, -2.151591, 1, 0.03529412, 0, 1,
-2.2741, 0.5005594, -0.8324752, 1, 0.04313726, 0, 1,
-2.24213, 0.6149136, -0.2859007, 1, 0.04705882, 0, 1,
-2.189498, 0.05303728, -2.760635, 1, 0.05490196, 0, 1,
-2.168034, 0.9791225, -1.283245, 1, 0.05882353, 0, 1,
-2.167513, -0.3890119, -2.007359, 1, 0.06666667, 0, 1,
-2.151537, -1.128033, -0.578381, 1, 0.07058824, 0, 1,
-2.149552, 0.8106192, -2.125693, 1, 0.07843138, 0, 1,
-2.134465, 1.044703, -1.178694, 1, 0.08235294, 0, 1,
-2.123476, -0.2654703, -2.440483, 1, 0.09019608, 0, 1,
-2.112815, 1.275304, 0.1586412, 1, 0.09411765, 0, 1,
-2.089109, 0.2026013, -1.665759, 1, 0.1019608, 0, 1,
-2.085232, 0.7615764, -3.297982, 1, 0.1098039, 0, 1,
-2.066457, -1.563557, -4.236763, 1, 0.1137255, 0, 1,
-2.058307, 0.357593, 0.5107469, 1, 0.1215686, 0, 1,
-2.018215, 1.72542, -0.4911799, 1, 0.1254902, 0, 1,
-1.994745, 0.1285326, -1.033315, 1, 0.1333333, 0, 1,
-1.958703, 0.3449059, 0.01369672, 1, 0.1372549, 0, 1,
-1.95251, -0.4689809, -0.1479625, 1, 0.145098, 0, 1,
-1.945362, 1.385971, -0.2427439, 1, 0.1490196, 0, 1,
-1.918233, -0.0968674, -2.51042, 1, 0.1568628, 0, 1,
-1.915498, 0.000352589, -1.002134, 1, 0.1607843, 0, 1,
-1.912428, 0.8790641, -2.247973, 1, 0.1686275, 0, 1,
-1.882911, -1.840357, -4.014683, 1, 0.172549, 0, 1,
-1.865729, 1.516278, -1.173168, 1, 0.1803922, 0, 1,
-1.805044, 0.4228704, -0.8834912, 1, 0.1843137, 0, 1,
-1.803469, -0.4429573, -1.028454, 1, 0.1921569, 0, 1,
-1.786143, 0.07249487, -0.7842461, 1, 0.1960784, 0, 1,
-1.776534, 1.757294, -2.010665, 1, 0.2039216, 0, 1,
-1.771267, -0.9990149, -2.555896, 1, 0.2117647, 0, 1,
-1.771264, -3.121996, -0.3821654, 1, 0.2156863, 0, 1,
-1.769665, 0.2105338, 0.2272969, 1, 0.2235294, 0, 1,
-1.758271, 1.055843, -1.253064, 1, 0.227451, 0, 1,
-1.753411, 0.9911153, -1.927264, 1, 0.2352941, 0, 1,
-1.751035, 0.2068088, -2.743401, 1, 0.2392157, 0, 1,
-1.742153, -1.650402, -2.439181, 1, 0.2470588, 0, 1,
-1.739096, -0.4201173, 0.2524661, 1, 0.2509804, 0, 1,
-1.73583, -0.27863, -2.207185, 1, 0.2588235, 0, 1,
-1.712698, -2.34485, -0.256935, 1, 0.2627451, 0, 1,
-1.699181, 0.8910099, -1.213197, 1, 0.2705882, 0, 1,
-1.684581, -0.7672552, -2.198471, 1, 0.2745098, 0, 1,
-1.683805, -0.3474016, -0.5512839, 1, 0.282353, 0, 1,
-1.677759, 0.4081713, -1.622032, 1, 0.2862745, 0, 1,
-1.67376, -0.1081628, -0.9072087, 1, 0.2941177, 0, 1,
-1.673321, -0.4443496, -1.016759, 1, 0.3019608, 0, 1,
-1.661669, -1.612427, -3.471632, 1, 0.3058824, 0, 1,
-1.65865, 0.8223937, -0.9225024, 1, 0.3137255, 0, 1,
-1.655374, 0.2946717, -0.8385856, 1, 0.3176471, 0, 1,
-1.649074, 0.5344818, -1.830558, 1, 0.3254902, 0, 1,
-1.647294, -1.000317, -3.723458, 1, 0.3294118, 0, 1,
-1.642891, -0.7148485, -2.482669, 1, 0.3372549, 0, 1,
-1.637981, -0.4833499, -1.384761, 1, 0.3411765, 0, 1,
-1.632936, 1.733774, -1.092967, 1, 0.3490196, 0, 1,
-1.624743, -1.410926, -3.057539, 1, 0.3529412, 0, 1,
-1.608749, -0.9547817, -2.312318, 1, 0.3607843, 0, 1,
-1.599669, -0.1758805, -1.816584, 1, 0.3647059, 0, 1,
-1.59501, -0.4554611, -2.965116, 1, 0.372549, 0, 1,
-1.591055, -0.6220611, -0.8269205, 1, 0.3764706, 0, 1,
-1.575574, 0.2856806, -1.673449, 1, 0.3843137, 0, 1,
-1.569942, -0.046251, 0.1940448, 1, 0.3882353, 0, 1,
-1.55582, 0.2702655, -0.04399375, 1, 0.3960784, 0, 1,
-1.555312, -0.06055721, -1.383337, 1, 0.4039216, 0, 1,
-1.548921, -1.261971, -0.7949407, 1, 0.4078431, 0, 1,
-1.548683, 1.118147, -1.105995, 1, 0.4156863, 0, 1,
-1.544737, 0.00435663, -1.388672, 1, 0.4196078, 0, 1,
-1.540963, 1.412098, -2.185326, 1, 0.427451, 0, 1,
-1.515089, 0.5994651, -0.009239677, 1, 0.4313726, 0, 1,
-1.50836, 0.5115152, -2.617349, 1, 0.4392157, 0, 1,
-1.502848, 0.347806, 0.06718913, 1, 0.4431373, 0, 1,
-1.49809, 0.5252523, -1.847677, 1, 0.4509804, 0, 1,
-1.46972, 0.2614432, -0.4145086, 1, 0.454902, 0, 1,
-1.459628, -1.332437, -2.667172, 1, 0.4627451, 0, 1,
-1.454295, -0.2200769, -2.321352, 1, 0.4666667, 0, 1,
-1.449718, 1.981986, -0.4125712, 1, 0.4745098, 0, 1,
-1.448375, -1.241036, -3.302846, 1, 0.4784314, 0, 1,
-1.444653, -0.1671708, -0.6849309, 1, 0.4862745, 0, 1,
-1.44453, 1.455798, -0.2871585, 1, 0.4901961, 0, 1,
-1.442074, -0.1751229, -1.611682, 1, 0.4980392, 0, 1,
-1.441352, -0.1247265, -1.108726, 1, 0.5058824, 0, 1,
-1.435347, -1.412214, -3.221938, 1, 0.509804, 0, 1,
-1.434061, 0.9057633, -1.266311, 1, 0.5176471, 0, 1,
-1.418906, 0.8008585, -0.5675651, 1, 0.5215687, 0, 1,
-1.413629, -0.3795608, -1.561849, 1, 0.5294118, 0, 1,
-1.401521, 0.7029715, 0.05173102, 1, 0.5333334, 0, 1,
-1.395653, 0.6630234, -3.181344, 1, 0.5411765, 0, 1,
-1.393408, 0.627957, -1.280636, 1, 0.5450981, 0, 1,
-1.390556, 1.008523, -1.269768, 1, 0.5529412, 0, 1,
-1.370465, 0.5276924, -1.244006, 1, 0.5568628, 0, 1,
-1.368757, -0.3424395, -4.878778, 1, 0.5647059, 0, 1,
-1.362717, -0.5395446, -2.79649, 1, 0.5686275, 0, 1,
-1.354861, -1.466006, -3.611713, 1, 0.5764706, 0, 1,
-1.336671, 1.296853, -1.628416, 1, 0.5803922, 0, 1,
-1.333779, 0.1792689, -1.417125, 1, 0.5882353, 0, 1,
-1.317111, -0.5336741, -0.0430086, 1, 0.5921569, 0, 1,
-1.316154, -0.139029, -0.9063881, 1, 0.6, 0, 1,
-1.314584, 0.5621976, -2.235139, 1, 0.6078432, 0, 1,
-1.311476, 1.004254, -0.7687382, 1, 0.6117647, 0, 1,
-1.305599, -0.1631258, -2.011359, 1, 0.6196079, 0, 1,
-1.303686, -0.7851093, -1.467697, 1, 0.6235294, 0, 1,
-1.29022, -2.095964, -2.767663, 1, 0.6313726, 0, 1,
-1.288991, -0.902983, -2.174163, 1, 0.6352941, 0, 1,
-1.285728, -0.5478707, -0.5779591, 1, 0.6431373, 0, 1,
-1.285345, 1.288587, -1.825774, 1, 0.6470588, 0, 1,
-1.27332, -0.1704318, -1.763771, 1, 0.654902, 0, 1,
-1.268298, 1.422842, -1.451835, 1, 0.6588235, 0, 1,
-1.266287, 0.2234492, -1.304203, 1, 0.6666667, 0, 1,
-1.259517, -0.8778133, -2.788915, 1, 0.6705883, 0, 1,
-1.256723, 0.06980308, -1.394065, 1, 0.6784314, 0, 1,
-1.248819, -0.04511795, -0.3470579, 1, 0.682353, 0, 1,
-1.246842, 0.3246049, -2.669238, 1, 0.6901961, 0, 1,
-1.242161, -0.7703475, -1.968452, 1, 0.6941177, 0, 1,
-1.23743, 1.640292, -0.4927149, 1, 0.7019608, 0, 1,
-1.232502, -1.850941, -4.847136, 1, 0.7098039, 0, 1,
-1.228287, -0.2408645, -3.742967, 1, 0.7137255, 0, 1,
-1.22659, -0.6749115, -2.041143, 1, 0.7215686, 0, 1,
-1.217327, -1.550171, -2.007282, 1, 0.7254902, 0, 1,
-1.210569, 0.1904637, -3.341378, 1, 0.7333333, 0, 1,
-1.205703, 1.282228, 2.401192, 1, 0.7372549, 0, 1,
-1.201647, -0.8579957, -1.938263, 1, 0.7450981, 0, 1,
-1.19371, -0.8591978, -2.617186, 1, 0.7490196, 0, 1,
-1.187663, -1.034349, -0.631634, 1, 0.7568628, 0, 1,
-1.187412, -0.1994793, -1.061191, 1, 0.7607843, 0, 1,
-1.18354, -0.7910442, -3.416934, 1, 0.7686275, 0, 1,
-1.180014, -1.547482, -3.073227, 1, 0.772549, 0, 1,
-1.170367, -0.6259601, -1.413465, 1, 0.7803922, 0, 1,
-1.167684, -0.4565496, -2.552958, 1, 0.7843137, 0, 1,
-1.165459, -1.590671, -2.375435, 1, 0.7921569, 0, 1,
-1.165224, 0.7952015, -0.3063282, 1, 0.7960784, 0, 1,
-1.164175, -0.4310463, -1.976747, 1, 0.8039216, 0, 1,
-1.15613, -0.1276232, -0.973049, 1, 0.8117647, 0, 1,
-1.154059, -0.2000735, -2.160312, 1, 0.8156863, 0, 1,
-1.144484, -0.2640072, -1.276039, 1, 0.8235294, 0, 1,
-1.143431, 0.817167, 0.2837772, 1, 0.827451, 0, 1,
-1.140918, 0.06686479, -1.233639, 1, 0.8352941, 0, 1,
-1.129602, -1.177734, -2.212284, 1, 0.8392157, 0, 1,
-1.127752, -1.223602, -1.018043, 1, 0.8470588, 0, 1,
-1.109817, -0.8425086, -4.425638, 1, 0.8509804, 0, 1,
-1.108445, -1.014622, -3.529468, 1, 0.8588235, 0, 1,
-1.105604, 2.534992, -1.802113, 1, 0.8627451, 0, 1,
-1.102224, -0.4337161, -1.672725, 1, 0.8705882, 0, 1,
-1.097831, -0.263074, -1.3068, 1, 0.8745098, 0, 1,
-1.095629, 0.4062054, -2.207231, 1, 0.8823529, 0, 1,
-1.093288, -1.64708, -2.661258, 1, 0.8862745, 0, 1,
-1.090251, 0.9757707, 0.3928666, 1, 0.8941177, 0, 1,
-1.08538, 0.8779621, -0.3959902, 1, 0.8980392, 0, 1,
-1.08213, 0.3565493, -1.240238, 1, 0.9058824, 0, 1,
-1.079213, 0.4791222, -1.159916, 1, 0.9137255, 0, 1,
-1.079192, 0.2648052, -0.6410545, 1, 0.9176471, 0, 1,
-1.076627, -1.209346, -3.378489, 1, 0.9254902, 0, 1,
-1.07026, -0.1724131, -1.37207, 1, 0.9294118, 0, 1,
-1.065379, 0.3072767, -2.063588, 1, 0.9372549, 0, 1,
-1.063873, -0.6670423, -2.172568, 1, 0.9411765, 0, 1,
-1.056965, 0.9375973, -1.632388, 1, 0.9490196, 0, 1,
-1.056928, 0.6037163, -1.323607, 1, 0.9529412, 0, 1,
-1.049987, -0.6224619, -1.51472, 1, 0.9607843, 0, 1,
-1.049056, -2.273774, -2.183199, 1, 0.9647059, 0, 1,
-1.04559, 0.3750007, -1.629574, 1, 0.972549, 0, 1,
-1.044902, -0.7802623, -2.79568, 1, 0.9764706, 0, 1,
-1.042748, 0.5981779, -0.9788787, 1, 0.9843137, 0, 1,
-1.041706, -0.3688851, -1.756554, 1, 0.9882353, 0, 1,
-1.035721, -1.003195, -2.192578, 1, 0.9960784, 0, 1,
-1.035506, 0.5876144, -2.948071, 0.9960784, 1, 0, 1,
-1.026256, -0.1911431, -2.025097, 0.9921569, 1, 0, 1,
-1.02356, 0.9959399, -0.7857911, 0.9843137, 1, 0, 1,
-1.022979, 0.1903699, -2.998147, 0.9803922, 1, 0, 1,
-1.021364, 0.1476993, 0.02593477, 0.972549, 1, 0, 1,
-1.019641, 1.070883, 0.2691774, 0.9686275, 1, 0, 1,
-1.018594, -0.7326404, -1.502373, 0.9607843, 1, 0, 1,
-1.012288, -0.419992, -3.38756, 0.9568627, 1, 0, 1,
-1.005849, 0.9835172, -0.2346135, 0.9490196, 1, 0, 1,
-1.005051, -0.628067, -1.543738, 0.945098, 1, 0, 1,
-1.003508, -1.927439, -2.680824, 0.9372549, 1, 0, 1,
-0.9988373, 1.030739, -0.2441831, 0.9333333, 1, 0, 1,
-0.9957091, -0.02646886, -1.636957, 0.9254902, 1, 0, 1,
-0.9912298, -0.05723574, -2.636179, 0.9215686, 1, 0, 1,
-0.9868203, 0.3019517, -0.2718116, 0.9137255, 1, 0, 1,
-0.9795299, 0.4996476, -0.1609807, 0.9098039, 1, 0, 1,
-0.9769093, 1.835217, -1.981059, 0.9019608, 1, 0, 1,
-0.9581375, 0.7085934, 0.2967702, 0.8941177, 1, 0, 1,
-0.9556713, 1.4746, 0.0933921, 0.8901961, 1, 0, 1,
-0.941952, 1.671668, 0.1479426, 0.8823529, 1, 0, 1,
-0.9379601, -2.069622, -2.072736, 0.8784314, 1, 0, 1,
-0.9377199, 2.871975, -1.929166, 0.8705882, 1, 0, 1,
-0.9376027, 0.8748978, 0.6236235, 0.8666667, 1, 0, 1,
-0.9349833, 0.8356239, -1.200204, 0.8588235, 1, 0, 1,
-0.9284906, 1.461262, 0.04667917, 0.854902, 1, 0, 1,
-0.922502, 1.057998, -0.6934165, 0.8470588, 1, 0, 1,
-0.9222953, 0.72732, 0.1909806, 0.8431373, 1, 0, 1,
-0.9178827, -0.1770464, -1.514323, 0.8352941, 1, 0, 1,
-0.9178425, -1.527913, -2.801294, 0.8313726, 1, 0, 1,
-0.9158946, 1.116186, -0.9504971, 0.8235294, 1, 0, 1,
-0.9129167, 1.982152, -0.07595555, 0.8196079, 1, 0, 1,
-0.9117972, -1.008103, -0.7490863, 0.8117647, 1, 0, 1,
-0.9052282, 0.5623004, -0.5662734, 0.8078431, 1, 0, 1,
-0.9031924, 1.104305, -1.355958, 0.8, 1, 0, 1,
-0.8986244, 0.04694559, -0.752829, 0.7921569, 1, 0, 1,
-0.8948775, 2.101996, -0.618947, 0.7882353, 1, 0, 1,
-0.8930492, -0.07392463, -0.5246165, 0.7803922, 1, 0, 1,
-0.8921515, -1.741787, -1.043667, 0.7764706, 1, 0, 1,
-0.8878365, -0.8393359, -1.923487, 0.7686275, 1, 0, 1,
-0.8716104, -0.8270869, -3.552089, 0.7647059, 1, 0, 1,
-0.8713557, 1.077273, 0.3247064, 0.7568628, 1, 0, 1,
-0.8666531, 0.1890285, 0.3404228, 0.7529412, 1, 0, 1,
-0.860765, 2.017536, 0.4671036, 0.7450981, 1, 0, 1,
-0.8599632, -1.234436, -2.414145, 0.7411765, 1, 0, 1,
-0.8543013, 1.775792, -1.342469, 0.7333333, 1, 0, 1,
-0.8462517, -0.6263288, -1.144102, 0.7294118, 1, 0, 1,
-0.8440911, -0.1348312, -1.274407, 0.7215686, 1, 0, 1,
-0.8371515, 1.807326, -0.6921412, 0.7176471, 1, 0, 1,
-0.8363982, -0.4386049, -1.449296, 0.7098039, 1, 0, 1,
-0.8257913, -0.7095443, -2.363464, 0.7058824, 1, 0, 1,
-0.8230309, -0.7449006, -3.159696, 0.6980392, 1, 0, 1,
-0.822672, 0.7363951, -1.152933, 0.6901961, 1, 0, 1,
-0.8141389, 1.485141, 1.36066, 0.6862745, 1, 0, 1,
-0.8129328, 1.487606, -1.139724, 0.6784314, 1, 0, 1,
-0.8123761, -1.051487, -1.98149, 0.6745098, 1, 0, 1,
-0.8119751, 0.01024821, -1.118465, 0.6666667, 1, 0, 1,
-0.8116893, 0.287746, -3.162842, 0.6627451, 1, 0, 1,
-0.806511, -0.2230663, -2.752849, 0.654902, 1, 0, 1,
-0.8053595, 0.2599018, -2.484686, 0.6509804, 1, 0, 1,
-0.8052976, -0.7721912, -1.57939, 0.6431373, 1, 0, 1,
-0.8035282, -0.5644287, -1.75799, 0.6392157, 1, 0, 1,
-0.79786, 0.5857662, -1.048412, 0.6313726, 1, 0, 1,
-0.7953274, -0.9725369, -1.62928, 0.627451, 1, 0, 1,
-0.7912315, 0.5820869, -1.937524, 0.6196079, 1, 0, 1,
-0.7900088, 1.084998, -0.3872912, 0.6156863, 1, 0, 1,
-0.7862909, -0.851734, -2.227297, 0.6078432, 1, 0, 1,
-0.7798843, 1.363564, -0.3336028, 0.6039216, 1, 0, 1,
-0.7733607, 0.3402467, -0.9187253, 0.5960785, 1, 0, 1,
-0.7692219, 0.8667963, -1.324495, 0.5882353, 1, 0, 1,
-0.7660899, 1.004322, 0.2047304, 0.5843138, 1, 0, 1,
-0.7628586, 0.8077657, -1.112254, 0.5764706, 1, 0, 1,
-0.7574208, 0.3480468, -0.04052961, 0.572549, 1, 0, 1,
-0.7552221, 0.1205352, 0.2458687, 0.5647059, 1, 0, 1,
-0.7551379, 0.1701005, -2.411401, 0.5607843, 1, 0, 1,
-0.7481917, 2.657555, -0.9660464, 0.5529412, 1, 0, 1,
-0.7440423, -3.068409, -2.440718, 0.5490196, 1, 0, 1,
-0.7433935, 0.3394233, -0.4338624, 0.5411765, 1, 0, 1,
-0.7422173, 0.4318375, -0.9935788, 0.5372549, 1, 0, 1,
-0.7398109, 1.016275, 1.461892, 0.5294118, 1, 0, 1,
-0.7394848, 0.09678127, -2.772579, 0.5254902, 1, 0, 1,
-0.7364795, -2.441198, -3.920135, 0.5176471, 1, 0, 1,
-0.7362484, -1.9822, -3.382519, 0.5137255, 1, 0, 1,
-0.7333651, -1.413334, -2.223299, 0.5058824, 1, 0, 1,
-0.7312645, 1.27106, -1.920265, 0.5019608, 1, 0, 1,
-0.7245817, -0.6290278, -3.732505, 0.4941176, 1, 0, 1,
-0.7243712, -1.85872, -2.815176, 0.4862745, 1, 0, 1,
-0.7077314, -1.193686, -2.281137, 0.4823529, 1, 0, 1,
-0.70178, -1.153476, -1.769756, 0.4745098, 1, 0, 1,
-0.7013879, 1.900742, -1.365547, 0.4705882, 1, 0, 1,
-0.6999629, -1.305492, -2.570812, 0.4627451, 1, 0, 1,
-0.6966935, 0.2003142, -0.6935662, 0.4588235, 1, 0, 1,
-0.6963716, -1.196938, -3.204418, 0.4509804, 1, 0, 1,
-0.6961202, 1.689309, -0.09387946, 0.4470588, 1, 0, 1,
-0.6935194, -1.328175, -2.765109, 0.4392157, 1, 0, 1,
-0.6837963, -1.224043, -0.8051691, 0.4352941, 1, 0, 1,
-0.6783425, -0.08245521, 0.1921818, 0.427451, 1, 0, 1,
-0.6760609, -0.06738882, -0.8302365, 0.4235294, 1, 0, 1,
-0.6746697, 0.6280613, -1.337916, 0.4156863, 1, 0, 1,
-0.6744102, 0.2342457, -1.247163, 0.4117647, 1, 0, 1,
-0.6742321, -1.689038, -3.583286, 0.4039216, 1, 0, 1,
-0.6706505, -0.4676346, -2.826252, 0.3960784, 1, 0, 1,
-0.6698916, -1.641289, -1.692571, 0.3921569, 1, 0, 1,
-0.6643791, -0.5333917, -3.151748, 0.3843137, 1, 0, 1,
-0.6631879, -2.246456, -1.716996, 0.3803922, 1, 0, 1,
-0.6619726, -0.3755351, -2.456448, 0.372549, 1, 0, 1,
-0.6530856, -0.3659907, -2.022718, 0.3686275, 1, 0, 1,
-0.6519158, -0.3814522, -3.015386, 0.3607843, 1, 0, 1,
-0.6510902, 0.4228176, 0.9985462, 0.3568628, 1, 0, 1,
-0.6510497, -0.8461094, -3.962229, 0.3490196, 1, 0, 1,
-0.6486858, 1.2867, -0.223589, 0.345098, 1, 0, 1,
-0.6393458, -0.1083492, -0.7570895, 0.3372549, 1, 0, 1,
-0.6385363, -1.174033, -0.6128983, 0.3333333, 1, 0, 1,
-0.6375729, 0.09194052, -0.8332249, 0.3254902, 1, 0, 1,
-0.6307815, -0.3195282, -2.385517, 0.3215686, 1, 0, 1,
-0.6294582, -1.121765, -3.204178, 0.3137255, 1, 0, 1,
-0.6291619, 1.841563, 0.4331047, 0.3098039, 1, 0, 1,
-0.6262975, -0.04412069, -2.854042, 0.3019608, 1, 0, 1,
-0.6227272, 1.450417, -0.7151921, 0.2941177, 1, 0, 1,
-0.6190026, 0.3178702, -0.3573152, 0.2901961, 1, 0, 1,
-0.6189282, 0.592728, 0.6838092, 0.282353, 1, 0, 1,
-0.6167074, 0.4390113, -0.2405288, 0.2784314, 1, 0, 1,
-0.6138076, 1.379851, -0.2505103, 0.2705882, 1, 0, 1,
-0.6113907, 0.2660954, -1.983449, 0.2666667, 1, 0, 1,
-0.6110122, -0.3277009, -1.114209, 0.2588235, 1, 0, 1,
-0.6081761, 0.08407459, -1.336399, 0.254902, 1, 0, 1,
-0.6067976, 0.5733981, -1.668622, 0.2470588, 1, 0, 1,
-0.6038276, -0.1255465, -0.7309492, 0.2431373, 1, 0, 1,
-0.6030036, -1.887418, -3.58398, 0.2352941, 1, 0, 1,
-0.5987489, -1.06173, -1.305726, 0.2313726, 1, 0, 1,
-0.594255, -1.524979, -2.86881, 0.2235294, 1, 0, 1,
-0.5939313, 0.7354046, -0.1602533, 0.2196078, 1, 0, 1,
-0.592497, -2.321345, -2.398425, 0.2117647, 1, 0, 1,
-0.5862318, 0.4716691, -2.447706, 0.2078431, 1, 0, 1,
-0.5855836, 0.6484421, -0.2746208, 0.2, 1, 0, 1,
-0.5838324, 0.3072519, -1.739541, 0.1921569, 1, 0, 1,
-0.5698676, 0.1695391, -1.215508, 0.1882353, 1, 0, 1,
-0.5643702, -0.6425037, -3.408334, 0.1803922, 1, 0, 1,
-0.5638691, -0.6007907, -2.564703, 0.1764706, 1, 0, 1,
-0.5629057, -0.1796533, -3.179646, 0.1686275, 1, 0, 1,
-0.5555605, -1.401115, -3.541352, 0.1647059, 1, 0, 1,
-0.551723, -1.060325, -1.051337, 0.1568628, 1, 0, 1,
-0.551451, 2.429474, -0.7353208, 0.1529412, 1, 0, 1,
-0.550446, 1.364795, -2.059613, 0.145098, 1, 0, 1,
-0.5421416, 0.9860856, 0.1990724, 0.1411765, 1, 0, 1,
-0.5419953, -0.5107031, -4.250081, 0.1333333, 1, 0, 1,
-0.5365527, -1.549787, -2.048944, 0.1294118, 1, 0, 1,
-0.5353165, -0.5743852, -2.997012, 0.1215686, 1, 0, 1,
-0.5302402, -1.17266, -3.099885, 0.1176471, 1, 0, 1,
-0.5256284, -2.02329, -3.905391, 0.1098039, 1, 0, 1,
-0.5242449, 0.9738625, -0.7347271, 0.1058824, 1, 0, 1,
-0.5232987, -1.713419, -2.442527, 0.09803922, 1, 0, 1,
-0.5231277, -0.433095, -2.971322, 0.09019608, 1, 0, 1,
-0.518594, 1.584226, 0.6496283, 0.08627451, 1, 0, 1,
-0.5177471, 1.050481, -0.2366908, 0.07843138, 1, 0, 1,
-0.5169587, -0.6966975, -1.157967, 0.07450981, 1, 0, 1,
-0.5166091, 1.177802, -0.1023269, 0.06666667, 1, 0, 1,
-0.513846, 0.9508762, -1.066954, 0.0627451, 1, 0, 1,
-0.5090131, -0.7149518, -3.433501, 0.05490196, 1, 0, 1,
-0.504312, 1.609282, -0.3993331, 0.05098039, 1, 0, 1,
-0.5022987, 1.422766, -2.801324, 0.04313726, 1, 0, 1,
-0.5015704, 1.439282, -0.4789177, 0.03921569, 1, 0, 1,
-0.4994, -0.2001713, -2.784696, 0.03137255, 1, 0, 1,
-0.4980229, -0.01395986, -1.103317, 0.02745098, 1, 0, 1,
-0.4957132, -0.2870716, -1.079943, 0.01960784, 1, 0, 1,
-0.4924673, -1.278206, -2.830322, 0.01568628, 1, 0, 1,
-0.487653, -0.1241737, -0.8353789, 0.007843138, 1, 0, 1,
-0.4865027, -0.4918183, -2.248809, 0.003921569, 1, 0, 1,
-0.4806619, 0.4046739, -0.941362, 0, 1, 0.003921569, 1,
-0.4781047, 1.057242, -0.3476312, 0, 1, 0.01176471, 1,
-0.4779963, 0.4913821, -0.8481228, 0, 1, 0.01568628, 1,
-0.4737597, -0.7160375, -1.562542, 0, 1, 0.02352941, 1,
-0.4733262, 0.6376164, -0.5578007, 0, 1, 0.02745098, 1,
-0.4706887, -0.3502798, -2.047254, 0, 1, 0.03529412, 1,
-0.4655212, -1.534637, -4.545856, 0, 1, 0.03921569, 1,
-0.4552191, 1.914416, 0.3481078, 0, 1, 0.04705882, 1,
-0.4441019, -1.761147, -4.052016, 0, 1, 0.05098039, 1,
-0.4410411, -2.225785, -3.451676, 0, 1, 0.05882353, 1,
-0.4378718, 1.38593, -1.292945, 0, 1, 0.0627451, 1,
-0.4368139, 0.3727589, -1.024114, 0, 1, 0.07058824, 1,
-0.4282017, -0.8150619, -3.186872, 0, 1, 0.07450981, 1,
-0.4246444, -2.426246, -5.147982, 0, 1, 0.08235294, 1,
-0.4231762, -0.0461085, -2.362674, 0, 1, 0.08627451, 1,
-0.420378, -0.8000267, -2.699477, 0, 1, 0.09411765, 1,
-0.4202413, 0.9351092, -1.205568, 0, 1, 0.1019608, 1,
-0.4104646, -0.1167088, -1.944019, 0, 1, 0.1058824, 1,
-0.4099168, -0.774761, -3.257155, 0, 1, 0.1137255, 1,
-0.4036231, -0.08438868, -1.435174, 0, 1, 0.1176471, 1,
-0.3981026, 1.19808, -0.7164441, 0, 1, 0.1254902, 1,
-0.3948808, 0.243857, -0.4284328, 0, 1, 0.1294118, 1,
-0.3904104, 0.5091155, -0.9650068, 0, 1, 0.1372549, 1,
-0.3903118, -0.151179, -3.173086, 0, 1, 0.1411765, 1,
-0.3894594, -0.7742176, -1.38332, 0, 1, 0.1490196, 1,
-0.389147, 0.4219385, -0.8304351, 0, 1, 0.1529412, 1,
-0.388932, -3.585929, -2.461217, 0, 1, 0.1607843, 1,
-0.3805681, 0.6086254, -1.397373, 0, 1, 0.1647059, 1,
-0.3800756, 1.860121, -0.09660854, 0, 1, 0.172549, 1,
-0.3771503, -0.7708979, -1.102157, 0, 1, 0.1764706, 1,
-0.3738197, -0.8636498, -3.152049, 0, 1, 0.1843137, 1,
-0.3736798, -0.9876238, -3.672611, 0, 1, 0.1882353, 1,
-0.372609, 0.4287874, -1.447289, 0, 1, 0.1960784, 1,
-0.3682448, -0.05467208, -1.175184, 0, 1, 0.2039216, 1,
-0.3663237, 0.7304806, -0.04418312, 0, 1, 0.2078431, 1,
-0.3650747, 0.7454595, -0.2223387, 0, 1, 0.2156863, 1,
-0.3595131, -0.07659934, -2.398841, 0, 1, 0.2196078, 1,
-0.3579801, 0.8341076, 0.6444544, 0, 1, 0.227451, 1,
-0.3530884, -0.3349121, -3.838033, 0, 1, 0.2313726, 1,
-0.3526931, -1.629242, -1.119641, 0, 1, 0.2392157, 1,
-0.351864, 0.5483699, -0.2184842, 0, 1, 0.2431373, 1,
-0.3509585, -0.4128009, -2.528208, 0, 1, 0.2509804, 1,
-0.3481875, 1.87982, -0.5446002, 0, 1, 0.254902, 1,
-0.3435851, 0.5522055, -0.4283211, 0, 1, 0.2627451, 1,
-0.342418, -0.4498276, -1.684604, 0, 1, 0.2666667, 1,
-0.3392049, -1.327696, -2.829879, 0, 1, 0.2745098, 1,
-0.3366942, 0.9525671, 1.409673, 0, 1, 0.2784314, 1,
-0.3318554, 0.2110439, -0.6338242, 0, 1, 0.2862745, 1,
-0.329063, -1.049864, -4.615233, 0, 1, 0.2901961, 1,
-0.328356, -0.9647662, -3.436457, 0, 1, 0.2980392, 1,
-0.3261131, 1.17861, -0.314797, 0, 1, 0.3058824, 1,
-0.325419, -1.580335, -2.377887, 0, 1, 0.3098039, 1,
-0.3190694, -0.8344798, -3.70609, 0, 1, 0.3176471, 1,
-0.3172647, 0.08556638, -1.283698, 0, 1, 0.3215686, 1,
-0.3157385, -0.4223707, -3.679777, 0, 1, 0.3294118, 1,
-0.3155896, -0.7548283, -2.421331, 0, 1, 0.3333333, 1,
-0.3148941, 0.379804, -0.9509982, 0, 1, 0.3411765, 1,
-0.3145397, 0.7345937, -0.8393859, 0, 1, 0.345098, 1,
-0.3052038, 0.8654581, -2.872283, 0, 1, 0.3529412, 1,
-0.3013835, -1.516805, -3.416246, 0, 1, 0.3568628, 1,
-0.2981392, 0.1412754, -1.275552, 0, 1, 0.3647059, 1,
-0.2959614, -0.2657045, -3.188557, 0, 1, 0.3686275, 1,
-0.2950613, 0.6989519, -1.61783, 0, 1, 0.3764706, 1,
-0.2917025, -0.8488566, -3.213521, 0, 1, 0.3803922, 1,
-0.2913485, -0.5245411, -1.84095, 0, 1, 0.3882353, 1,
-0.2898824, 0.1997972, -0.8339624, 0, 1, 0.3921569, 1,
-0.285961, 0.377617, 0.1163253, 0, 1, 0.4, 1,
-0.2814569, -0.03601449, -1.959749, 0, 1, 0.4078431, 1,
-0.2797091, 0.1134462, -1.464107, 0, 1, 0.4117647, 1,
-0.2788797, -1.121167, -3.38868, 0, 1, 0.4196078, 1,
-0.2753514, 1.560742, -1.816296, 0, 1, 0.4235294, 1,
-0.273962, 2.964916, 0.1208635, 0, 1, 0.4313726, 1,
-0.2721937, -1.042936, -3.199017, 0, 1, 0.4352941, 1,
-0.2678523, 0.2839618, -0.6484578, 0, 1, 0.4431373, 1,
-0.2598166, -0.9504815, -4.048836, 0, 1, 0.4470588, 1,
-0.258397, -1.549144, -2.214158, 0, 1, 0.454902, 1,
-0.252717, 1.600045, 1.507824, 0, 1, 0.4588235, 1,
-0.2518877, -0.1909421, -2.746039, 0, 1, 0.4666667, 1,
-0.2514814, 0.03954313, -2.243949, 0, 1, 0.4705882, 1,
-0.2495424, 1.411306, -1.761968, 0, 1, 0.4784314, 1,
-0.2453254, 0.2332725, -1.198012, 0, 1, 0.4823529, 1,
-0.2437031, -0.5682619, -2.736233, 0, 1, 0.4901961, 1,
-0.24314, -0.4562398, -1.098486, 0, 1, 0.4941176, 1,
-0.2410301, 0.7249331, -0.5943171, 0, 1, 0.5019608, 1,
-0.2407346, -0.3144237, -2.741515, 0, 1, 0.509804, 1,
-0.2381058, 0.1529993, -0.9596196, 0, 1, 0.5137255, 1,
-0.2228323, 0.6813096, -1.780815, 0, 1, 0.5215687, 1,
-0.2195514, 1.929784, -0.272997, 0, 1, 0.5254902, 1,
-0.2176365, -0.05641721, -1.202935, 0, 1, 0.5333334, 1,
-0.2141646, 1.640941, 1.264633, 0, 1, 0.5372549, 1,
-0.2101963, -1.374627, -2.441785, 0, 1, 0.5450981, 1,
-0.2101908, 0.3785601, -0.9973934, 0, 1, 0.5490196, 1,
-0.2075669, -1.652107, -2.536929, 0, 1, 0.5568628, 1,
-0.2062559, -1.214636, -3.830052, 0, 1, 0.5607843, 1,
-0.2043915, 0.6519766, -1.960017, 0, 1, 0.5686275, 1,
-0.2019586, -0.7696939, -4.43084, 0, 1, 0.572549, 1,
-0.2015689, -0.509408, -2.186297, 0, 1, 0.5803922, 1,
-0.1989194, -0.290666, -2.100897, 0, 1, 0.5843138, 1,
-0.1960852, -0.6540083, -2.873878, 0, 1, 0.5921569, 1,
-0.1943302, -0.9508588, -3.073235, 0, 1, 0.5960785, 1,
-0.1942466, 1.35922, 0.1855196, 0, 1, 0.6039216, 1,
-0.1941866, -0.1057074, -1.594133, 0, 1, 0.6117647, 1,
-0.1940618, 0.2436846, -0.2456726, 0, 1, 0.6156863, 1,
-0.1940402, 1.277735, -1.479951, 0, 1, 0.6235294, 1,
-0.193878, -0.9233848, -3.224995, 0, 1, 0.627451, 1,
-0.1924994, 0.5954899, -0.7627654, 0, 1, 0.6352941, 1,
-0.1839623, 0.3803117, 0.4431155, 0, 1, 0.6392157, 1,
-0.1801537, -0.2191165, -2.138932, 0, 1, 0.6470588, 1,
-0.180061, -0.3045006, -1.097665, 0, 1, 0.6509804, 1,
-0.1789793, 0.4959518, -1.219981, 0, 1, 0.6588235, 1,
-0.1765814, 0.4281953, -1.081596, 0, 1, 0.6627451, 1,
-0.1761523, -1.792637, -4.472961, 0, 1, 0.6705883, 1,
-0.1758693, -0.8689337, -2.576922, 0, 1, 0.6745098, 1,
-0.1757281, 0.4923216, 0.8917602, 0, 1, 0.682353, 1,
-0.1755278, 1.043027, 0.3142099, 0, 1, 0.6862745, 1,
-0.1749159, -0.2800554, -2.199654, 0, 1, 0.6941177, 1,
-0.1735146, 0.9329779, -1.057432, 0, 1, 0.7019608, 1,
-0.1729442, -0.2793738, -3.295131, 0, 1, 0.7058824, 1,
-0.1639625, 0.6858548, -0.8259999, 0, 1, 0.7137255, 1,
-0.162252, 0.07387453, 0.1704264, 0, 1, 0.7176471, 1,
-0.1583756, -0.628922, -1.375487, 0, 1, 0.7254902, 1,
-0.1491568, 1.282137, 0.872358, 0, 1, 0.7294118, 1,
-0.1306708, 0.7955642, -0.2322896, 0, 1, 0.7372549, 1,
-0.12534, -0.233586, -4.641489, 0, 1, 0.7411765, 1,
-0.1242384, -0.1114604, -4.259819, 0, 1, 0.7490196, 1,
-0.1225964, 0.2289276, -1.339487, 0, 1, 0.7529412, 1,
-0.1225014, -0.7829414, -4.120767, 0, 1, 0.7607843, 1,
-0.1196253, 0.2409421, 1.111205, 0, 1, 0.7647059, 1,
-0.1105429, -1.48349, -1.226186, 0, 1, 0.772549, 1,
-0.1063373, 0.3537551, -0.3487552, 0, 1, 0.7764706, 1,
-0.106094, 0.9226147, -0.38607, 0, 1, 0.7843137, 1,
-0.09245977, -0.9438437, -2.185348, 0, 1, 0.7882353, 1,
-0.09106628, -1.519714, -4.438941, 0, 1, 0.7960784, 1,
-0.08897542, 1.13954, 0.8328511, 0, 1, 0.8039216, 1,
-0.08560357, 0.0980029, 0.9207044, 0, 1, 0.8078431, 1,
-0.08531703, -0.8155452, -2.421391, 0, 1, 0.8156863, 1,
-0.08475594, 0.838074, -0.2655549, 0, 1, 0.8196079, 1,
-0.08254062, -0.32489, -2.158533, 0, 1, 0.827451, 1,
-0.0766663, 0.8943959, -1.02637, 0, 1, 0.8313726, 1,
-0.07602078, -0.1926749, -2.456219, 0, 1, 0.8392157, 1,
-0.07557774, -0.8014433, -4.228538, 0, 1, 0.8431373, 1,
-0.06802928, 0.5361918, -0.8544562, 0, 1, 0.8509804, 1,
-0.05981352, 0.2960055, -1.304585, 0, 1, 0.854902, 1,
-0.05602167, -1.010095, -2.009991, 0, 1, 0.8627451, 1,
-0.05499247, -0.6270565, 0.01256385, 0, 1, 0.8666667, 1,
-0.047253, 0.9281731, -0.921536, 0, 1, 0.8745098, 1,
-0.04602813, -0.5619346, -4.077702, 0, 1, 0.8784314, 1,
-0.04376416, -0.1106078, -2.584955, 0, 1, 0.8862745, 1,
-0.04346471, -0.5217614, 0.2269582, 0, 1, 0.8901961, 1,
-0.03960072, 0.02885081, -1.342815, 0, 1, 0.8980392, 1,
-0.03795854, -0.6515374, -2.411361, 0, 1, 0.9058824, 1,
-0.03789955, -1.199723, -5.097073, 0, 1, 0.9098039, 1,
-0.03726289, -0.6974105, -4.139601, 0, 1, 0.9176471, 1,
-0.03698033, -0.4821851, -3.32713, 0, 1, 0.9215686, 1,
-0.02690908, 0.5990646, 0.2153216, 0, 1, 0.9294118, 1,
-0.02601629, -0.01725703, -2.821127, 0, 1, 0.9333333, 1,
-0.02575569, -0.8619724, -1.71841, 0, 1, 0.9411765, 1,
-0.02402831, 0.5795714, -1.309882, 0, 1, 0.945098, 1,
-0.02359349, -1.185778, -3.510222, 0, 1, 0.9529412, 1,
-0.02258206, 0.627064, 0.9530755, 0, 1, 0.9568627, 1,
-0.02152859, 0.6518784, -0.3414652, 0, 1, 0.9647059, 1,
-0.01961807, 0.3743762, 0.2760789, 0, 1, 0.9686275, 1,
-0.01938079, 2.487954, 1.128304, 0, 1, 0.9764706, 1,
-0.01866997, -0.7321637, -3.956151, 0, 1, 0.9803922, 1,
-0.01609511, 0.4662766, 0.9953237, 0, 1, 0.9882353, 1,
-0.01540959, 0.4208726, 0.07155232, 0, 1, 0.9921569, 1,
-0.01479145, -1.486575, -4.351786, 0, 1, 1, 1,
-0.01370629, -1.400691, -2.445948, 0, 0.9921569, 1, 1,
-0.01150828, -1.254756, -4.164607, 0, 0.9882353, 1, 1,
-0.009710047, 0.6239113, 1.035544, 0, 0.9803922, 1, 1,
-0.006688267, 0.6250035, -0.661011, 0, 0.9764706, 1, 1,
0.005657207, 0.5633063, -1.328449, 0, 0.9686275, 1, 1,
0.006252078, -1.369341, 3.389467, 0, 0.9647059, 1, 1,
0.007254556, 0.905062, -0.9502096, 0, 0.9568627, 1, 1,
0.007859698, -1.080653, 4.824285, 0, 0.9529412, 1, 1,
0.009313961, 0.7726746, 0.7788595, 0, 0.945098, 1, 1,
0.009357903, 0.3650254, -0.1814685, 0, 0.9411765, 1, 1,
0.01255058, -1.219712, 2.49972, 0, 0.9333333, 1, 1,
0.01282711, -1.055419, 2.718992, 0, 0.9294118, 1, 1,
0.01312305, 1.826704, 0.8268443, 0, 0.9215686, 1, 1,
0.01446852, 0.1279248, -1.036253, 0, 0.9176471, 1, 1,
0.02086295, 0.5427092, -0.5842378, 0, 0.9098039, 1, 1,
0.02185097, -0.4469644, 3.223041, 0, 0.9058824, 1, 1,
0.02375901, -1.169918, 3.075598, 0, 0.8980392, 1, 1,
0.0247822, -0.9282559, 2.004797, 0, 0.8901961, 1, 1,
0.02568587, 0.1217476, 0.9519104, 0, 0.8862745, 1, 1,
0.02953489, 0.6210604, 0.466021, 0, 0.8784314, 1, 1,
0.03190503, -0.2235395, 4.543993, 0, 0.8745098, 1, 1,
0.03396692, 0.04949306, 0.2668902, 0, 0.8666667, 1, 1,
0.0402902, 1.452335, 0.6709998, 0, 0.8627451, 1, 1,
0.04047044, 0.05781271, 1.273632, 0, 0.854902, 1, 1,
0.04207332, 0.5079424, 1.029998, 0, 0.8509804, 1, 1,
0.04265357, -0.6725548, 2.94205, 0, 0.8431373, 1, 1,
0.04359696, -0.7815748, 1.994213, 0, 0.8392157, 1, 1,
0.04361164, -1.551355, 2.028553, 0, 0.8313726, 1, 1,
0.04416443, 1.631868, -0.8559358, 0, 0.827451, 1, 1,
0.05018216, 1.32004, -1.597507, 0, 0.8196079, 1, 1,
0.05448466, -1.151482, 3.737027, 0, 0.8156863, 1, 1,
0.0544963, 0.4072961, -1.103936, 0, 0.8078431, 1, 1,
0.05463645, -2.038691, 5.060112, 0, 0.8039216, 1, 1,
0.05483674, -1.424201, 2.796129, 0, 0.7960784, 1, 1,
0.05539969, -2.603976, 2.864693, 0, 0.7882353, 1, 1,
0.0557608, 0.5168319, 0.856585, 0, 0.7843137, 1, 1,
0.05666364, 0.7673422, -0.5411418, 0, 0.7764706, 1, 1,
0.06323402, 0.9231723, 0.5109867, 0, 0.772549, 1, 1,
0.06525746, -0.02670299, 1.800266, 0, 0.7647059, 1, 1,
0.06546696, 0.4284506, -0.2123325, 0, 0.7607843, 1, 1,
0.07181885, 1.356535, -1.383905, 0, 0.7529412, 1, 1,
0.08101796, -1.681861, 3.665756, 0, 0.7490196, 1, 1,
0.08655226, -0.9114795, 3.888946, 0, 0.7411765, 1, 1,
0.08941028, -0.1966253, 2.431996, 0, 0.7372549, 1, 1,
0.09129012, 1.640119, 2.643053, 0, 0.7294118, 1, 1,
0.0929727, -1.546879, 3.073067, 0, 0.7254902, 1, 1,
0.09798042, 1.678017, 0.7442341, 0, 0.7176471, 1, 1,
0.1036953, -0.6113408, 2.474329, 0, 0.7137255, 1, 1,
0.1088346, 0.6789221, -0.421904, 0, 0.7058824, 1, 1,
0.1090992, 0.3696958, 0.8374445, 0, 0.6980392, 1, 1,
0.1128398, 0.132357, 0.7201332, 0, 0.6941177, 1, 1,
0.1163368, 0.8356397, 0.1543854, 0, 0.6862745, 1, 1,
0.1167455, -1.109866, 1.114334, 0, 0.682353, 1, 1,
0.1176527, -0.154765, 3.302293, 0, 0.6745098, 1, 1,
0.1183229, -0.8035495, 3.098281, 0, 0.6705883, 1, 1,
0.119545, -0.1415305, 1.66826, 0, 0.6627451, 1, 1,
0.1215751, 1.250785, 0.1069448, 0, 0.6588235, 1, 1,
0.1224811, -0.7474013, 3.267075, 0, 0.6509804, 1, 1,
0.1273177, -0.2647385, 2.37816, 0, 0.6470588, 1, 1,
0.1286343, 0.9855223, 1.031299, 0, 0.6392157, 1, 1,
0.1289259, -0.9637495, 3.214651, 0, 0.6352941, 1, 1,
0.1319048, 0.6543105, -0.6290395, 0, 0.627451, 1, 1,
0.1325178, 1.329068, -0.07721663, 0, 0.6235294, 1, 1,
0.1354614, 1.240301, -0.6029505, 0, 0.6156863, 1, 1,
0.1359276, -0.08019683, 3.693368, 0, 0.6117647, 1, 1,
0.1412578, 0.7458284, 1.004129, 0, 0.6039216, 1, 1,
0.1479071, 0.9024501, 0.5976797, 0, 0.5960785, 1, 1,
0.1507592, 0.4567731, -1.917952, 0, 0.5921569, 1, 1,
0.1546037, -0.9322324, 2.290557, 0, 0.5843138, 1, 1,
0.1596458, 0.7467639, 1.037765, 0, 0.5803922, 1, 1,
0.1608414, -0.8475282, 3.48106, 0, 0.572549, 1, 1,
0.1653464, 0.3925584, -0.5157614, 0, 0.5686275, 1, 1,
0.1658736, -0.9114004, 1.505611, 0, 0.5607843, 1, 1,
0.1696272, 0.3821135, 1.756263, 0, 0.5568628, 1, 1,
0.1713302, 1.200992, 1.74566, 0, 0.5490196, 1, 1,
0.1739171, 0.3674785, -0.1699774, 0, 0.5450981, 1, 1,
0.1776995, -0.06224769, 1.676504, 0, 0.5372549, 1, 1,
0.1816526, 1.476839, -0.5382952, 0, 0.5333334, 1, 1,
0.1826674, -0.5858794, 1.522884, 0, 0.5254902, 1, 1,
0.1833545, -1.522903, 2.386104, 0, 0.5215687, 1, 1,
0.1846316, -0.7752923, 2.820704, 0, 0.5137255, 1, 1,
0.1881171, 1.585195, 0.4569457, 0, 0.509804, 1, 1,
0.1891325, -0.6129579, 2.89185, 0, 0.5019608, 1, 1,
0.1926157, 1.396679, 0.5067897, 0, 0.4941176, 1, 1,
0.1937906, -0.3363452, 2.544481, 0, 0.4901961, 1, 1,
0.1945898, 1.437637, -0.6355808, 0, 0.4823529, 1, 1,
0.2012251, -0.1570781, 0.9836886, 0, 0.4784314, 1, 1,
0.2046196, 0.1373418, 2.321409, 0, 0.4705882, 1, 1,
0.2070806, -2.48963, 2.732892, 0, 0.4666667, 1, 1,
0.2090896, 0.4852184, 0.8616508, 0, 0.4588235, 1, 1,
0.2117016, 0.07255713, 0.04386694, 0, 0.454902, 1, 1,
0.2149549, -0.6211925, 2.93706, 0, 0.4470588, 1, 1,
0.2157523, -0.09962651, 3.297017, 0, 0.4431373, 1, 1,
0.2164384, -0.5238795, 3.740345, 0, 0.4352941, 1, 1,
0.2176775, 0.3599221, 1.645411, 0, 0.4313726, 1, 1,
0.2267329, -1.018722, 7.12818, 0, 0.4235294, 1, 1,
0.2275582, -1.224381, 2.367266, 0, 0.4196078, 1, 1,
0.2322317, 0.8139771, 1.451619, 0, 0.4117647, 1, 1,
0.2347215, 0.4708995, 1.465525, 0, 0.4078431, 1, 1,
0.2394544, 0.005022151, 1.203006, 0, 0.4, 1, 1,
0.2426558, -0.1941114, 2.171257, 0, 0.3921569, 1, 1,
0.2461046, 0.1003174, 0.8204789, 0, 0.3882353, 1, 1,
0.2472387, 1.14842, -1.287783, 0, 0.3803922, 1, 1,
0.2500489, 0.05883842, 2.506824, 0, 0.3764706, 1, 1,
0.2504396, -0.3940511, 3.770554, 0, 0.3686275, 1, 1,
0.2546183, 0.9145816, 0.3130564, 0, 0.3647059, 1, 1,
0.2568539, -0.6281276, 2.521904, 0, 0.3568628, 1, 1,
0.2596737, -1.584075, 2.219624, 0, 0.3529412, 1, 1,
0.2611132, -0.665939, 1.609361, 0, 0.345098, 1, 1,
0.2624308, -0.8859553, 3.581021, 0, 0.3411765, 1, 1,
0.2644803, 0.2254237, 1.129735, 0, 0.3333333, 1, 1,
0.2666947, 2.119778, -0.7981885, 0, 0.3294118, 1, 1,
0.2704801, -0.1300905, 2.331124, 0, 0.3215686, 1, 1,
0.2712423, -0.1264174, 1.490722, 0, 0.3176471, 1, 1,
0.2714621, -0.9194815, 3.300351, 0, 0.3098039, 1, 1,
0.276084, 0.1254135, 0.1868513, 0, 0.3058824, 1, 1,
0.276725, -0.4346126, 0.6122283, 0, 0.2980392, 1, 1,
0.2782485, 0.2374409, -0.2394921, 0, 0.2901961, 1, 1,
0.2785622, -1.388486, 1.688463, 0, 0.2862745, 1, 1,
0.2810305, 0.2289599, 0.05763539, 0, 0.2784314, 1, 1,
0.2819543, 2.147988, 1.948389, 0, 0.2745098, 1, 1,
0.2857392, 0.5685526, 0.2580738, 0, 0.2666667, 1, 1,
0.2901817, -0.9939755, 2.861522, 0, 0.2627451, 1, 1,
0.2926632, 0.2176969, -0.08650047, 0, 0.254902, 1, 1,
0.3052999, 0.7256005, -2.476794, 0, 0.2509804, 1, 1,
0.305621, 0.1688593, 1.341237, 0, 0.2431373, 1, 1,
0.3077289, -0.9131806, 2.416184, 0, 0.2392157, 1, 1,
0.312792, 0.6429735, -0.6682965, 0, 0.2313726, 1, 1,
0.3139996, -0.04851503, 1.28561, 0, 0.227451, 1, 1,
0.3207967, 0.8176529, 0.7556143, 0, 0.2196078, 1, 1,
0.321485, 0.5137796, 0.8534907, 0, 0.2156863, 1, 1,
0.3233474, 0.3681404, 1.768531, 0, 0.2078431, 1, 1,
0.3244303, 0.3159793, 0.6612472, 0, 0.2039216, 1, 1,
0.3279404, 0.6002713, 0.5871945, 0, 0.1960784, 1, 1,
0.3279951, 0.3225272, -1.141734, 0, 0.1882353, 1, 1,
0.3323432, 0.9070816, 1.08786, 0, 0.1843137, 1, 1,
0.3332453, 0.4779734, 1.250865, 0, 0.1764706, 1, 1,
0.3363026, 0.4019998, 0.6517112, 0, 0.172549, 1, 1,
0.3419804, -0.7629372, 2.921212, 0, 0.1647059, 1, 1,
0.3425681, -0.7084379, 2.68354, 0, 0.1607843, 1, 1,
0.3494359, -0.7272288, 2.679502, 0, 0.1529412, 1, 1,
0.3559672, -2.020066, 2.49529, 0, 0.1490196, 1, 1,
0.3630672, 0.4722203, 0.4320388, 0, 0.1411765, 1, 1,
0.3700159, 0.1129132, 0.7262025, 0, 0.1372549, 1, 1,
0.370225, 0.192505, 2.497386, 0, 0.1294118, 1, 1,
0.3703112, -2.155364, 4.590711, 0, 0.1254902, 1, 1,
0.3790662, -1.958426, 2.826404, 0, 0.1176471, 1, 1,
0.3799027, 1.241279, -0.5113228, 0, 0.1137255, 1, 1,
0.3810374, 0.4185024, 1.976208, 0, 0.1058824, 1, 1,
0.3813612, 1.499467, -0.6101845, 0, 0.09803922, 1, 1,
0.3822376, -0.4071558, 1.854945, 0, 0.09411765, 1, 1,
0.3841479, 0.06509751, 0.7231992, 0, 0.08627451, 1, 1,
0.3891196, -1.55787, 4.817027, 0, 0.08235294, 1, 1,
0.3972362, 0.7883903, 1.100562, 0, 0.07450981, 1, 1,
0.4025368, 0.1121842, 2.543444, 0, 0.07058824, 1, 1,
0.4037271, -0.6089717, 4.049154, 0, 0.0627451, 1, 1,
0.4041721, -1.061714, 1.792734, 0, 0.05882353, 1, 1,
0.4050882, 0.4690272, 1.897294, 0, 0.05098039, 1, 1,
0.4085481, 0.1859176, 0.8070827, 0, 0.04705882, 1, 1,
0.4088137, 1.046421, 0.1656882, 0, 0.03921569, 1, 1,
0.4167265, 0.6677275, 1.704807, 0, 0.03529412, 1, 1,
0.4192397, 1.493138, 1.045444, 0, 0.02745098, 1, 1,
0.4224521, 0.2881226, 1.506878, 0, 0.02352941, 1, 1,
0.4262873, -0.1313462, 1.615617, 0, 0.01568628, 1, 1,
0.4296426, -1.582118, 2.21716, 0, 0.01176471, 1, 1,
0.4359231, 1.387492, 0.3292887, 0, 0.003921569, 1, 1,
0.4378895, 0.3776987, 0.4760534, 0.003921569, 0, 1, 1,
0.4431943, 0.1829833, 2.24902, 0.007843138, 0, 1, 1,
0.4444657, 0.01204437, 3.271325, 0.01568628, 0, 1, 1,
0.4463077, -0.9925214, 3.304066, 0.01960784, 0, 1, 1,
0.4508065, 0.4010459, 1.604949, 0.02745098, 0, 1, 1,
0.4601335, 0.9739159, -1.219093, 0.03137255, 0, 1, 1,
0.4654446, -0.02489519, 0.8358785, 0.03921569, 0, 1, 1,
0.4684073, -0.5430737, 2.635971, 0.04313726, 0, 1, 1,
0.4738065, -1.375135, 4.838311, 0.05098039, 0, 1, 1,
0.4832259, -1.335668, 1.346885, 0.05490196, 0, 1, 1,
0.4845498, -0.7961111, 3.526371, 0.0627451, 0, 1, 1,
0.4857151, 0.477675, 2.181489, 0.06666667, 0, 1, 1,
0.4859731, -0.8656688, 4.8292, 0.07450981, 0, 1, 1,
0.4864092, -0.2237174, 2.747554, 0.07843138, 0, 1, 1,
0.488147, -0.8274634, 1.744474, 0.08627451, 0, 1, 1,
0.4970147, 1.414096, 1.237096, 0.09019608, 0, 1, 1,
0.4973682, -2.392797, 1.054751, 0.09803922, 0, 1, 1,
0.4982193, 0.2143099, -0.8633994, 0.1058824, 0, 1, 1,
0.5012352, 0.3006467, 0.4244212, 0.1098039, 0, 1, 1,
0.5024762, 0.1423938, 1.084579, 0.1176471, 0, 1, 1,
0.5034497, -1.251806, 2.998529, 0.1215686, 0, 1, 1,
0.5051585, -2.025159, 2.921389, 0.1294118, 0, 1, 1,
0.505883, -0.3134761, 2.710025, 0.1333333, 0, 1, 1,
0.5059592, -1.690483, 1.558041, 0.1411765, 0, 1, 1,
0.5091196, 0.2966798, 1.362127, 0.145098, 0, 1, 1,
0.5121556, -1.602774, 3.662329, 0.1529412, 0, 1, 1,
0.5146421, 0.04137344, 2.347926, 0.1568628, 0, 1, 1,
0.51515, -0.6256152, 2.396591, 0.1647059, 0, 1, 1,
0.5159004, 0.2118931, 3.300688, 0.1686275, 0, 1, 1,
0.5174143, -0.08908527, 1.2892, 0.1764706, 0, 1, 1,
0.5175442, -0.4946735, 2.723771, 0.1803922, 0, 1, 1,
0.5177472, -0.9508681, 3.053139, 0.1882353, 0, 1, 1,
0.5224259, 0.7766892, 0.09569305, 0.1921569, 0, 1, 1,
0.5249016, -1.36184, 1.395426, 0.2, 0, 1, 1,
0.5249791, 0.1523748, 1.025336, 0.2078431, 0, 1, 1,
0.5259926, -0.2062378, 0.4413728, 0.2117647, 0, 1, 1,
0.5261363, -0.3327912, -0.09871373, 0.2196078, 0, 1, 1,
0.5287412, 0.5691901, -0.0226718, 0.2235294, 0, 1, 1,
0.5314218, 0.4468387, 1.706163, 0.2313726, 0, 1, 1,
0.5317967, 0.4507245, 0.8098567, 0.2352941, 0, 1, 1,
0.5354455, 2.598439, 1.153296, 0.2431373, 0, 1, 1,
0.5400283, 0.9219736, 0.6196864, 0.2470588, 0, 1, 1,
0.5420245, 0.5081446, 0.1377263, 0.254902, 0, 1, 1,
0.5435193, 1.066703, 0.723321, 0.2588235, 0, 1, 1,
0.5445568, -0.9226363, 2.685139, 0.2666667, 0, 1, 1,
0.5466824, 0.8669097, 0.30347, 0.2705882, 0, 1, 1,
0.5512635, -1.085702, 3.749206, 0.2784314, 0, 1, 1,
0.5611457, 0.4613378, 2.367314, 0.282353, 0, 1, 1,
0.5661174, 0.6095026, 0.7773515, 0.2901961, 0, 1, 1,
0.5666094, -0.0758879, 2.286516, 0.2941177, 0, 1, 1,
0.5678563, -1.491501, 2.205631, 0.3019608, 0, 1, 1,
0.5681461, -0.4899396, 3.000028, 0.3098039, 0, 1, 1,
0.5690704, -1.080786, 3.019591, 0.3137255, 0, 1, 1,
0.5763505, 0.2524786, 1.445511, 0.3215686, 0, 1, 1,
0.5786587, -0.1130248, 2.299761, 0.3254902, 0, 1, 1,
0.580624, -0.09965324, 1.490236, 0.3333333, 0, 1, 1,
0.5858454, -0.2252623, 3.33148, 0.3372549, 0, 1, 1,
0.5965591, 0.007736296, 0.4586174, 0.345098, 0, 1, 1,
0.5968357, -0.6452374, 4.640072, 0.3490196, 0, 1, 1,
0.5969743, -0.3982477, 1.907348, 0.3568628, 0, 1, 1,
0.5971135, 1.123392, 0.3041968, 0.3607843, 0, 1, 1,
0.5977017, 0.09546871, 1.134574, 0.3686275, 0, 1, 1,
0.5987832, 1.305878, 1.282268, 0.372549, 0, 1, 1,
0.6028581, 0.251961, 2.119154, 0.3803922, 0, 1, 1,
0.6031574, 0.7975808, -0.8286901, 0.3843137, 0, 1, 1,
0.6035414, -2.223989, 1.339466, 0.3921569, 0, 1, 1,
0.6075895, 0.2323241, -1.259567, 0.3960784, 0, 1, 1,
0.6092255, -1.766324, 3.859154, 0.4039216, 0, 1, 1,
0.6113561, -1.356045, 3.653039, 0.4117647, 0, 1, 1,
0.6120024, -0.2999645, 0.4323291, 0.4156863, 0, 1, 1,
0.6144181, 1.836235, -0.01972504, 0.4235294, 0, 1, 1,
0.6144723, -0.1840677, 1.31411, 0.427451, 0, 1, 1,
0.6186706, 0.07450747, 0.8792696, 0.4352941, 0, 1, 1,
0.61915, -0.4015829, 2.25006, 0.4392157, 0, 1, 1,
0.6203169, 0.3260913, 0.4661526, 0.4470588, 0, 1, 1,
0.621224, 1.461614, 0.8342396, 0.4509804, 0, 1, 1,
0.623047, 1.192716, 0.6108295, 0.4588235, 0, 1, 1,
0.6240789, 1.576566, -0.2348164, 0.4627451, 0, 1, 1,
0.6283255, 1.849043, 0.9136899, 0.4705882, 0, 1, 1,
0.6292883, 2.151094, -0.9042209, 0.4745098, 0, 1, 1,
0.6476047, 0.7500109, 0.5327965, 0.4823529, 0, 1, 1,
0.6483697, 0.6087283, 1.899427, 0.4862745, 0, 1, 1,
0.6485241, -0.65982, 1.383595, 0.4941176, 0, 1, 1,
0.6491335, 0.0690964, 0.3349157, 0.5019608, 0, 1, 1,
0.6628994, -2.172044, 3.277662, 0.5058824, 0, 1, 1,
0.6682997, 0.6907879, 2.337277, 0.5137255, 0, 1, 1,
0.6690474, -0.4975165, 2.12522, 0.5176471, 0, 1, 1,
0.6705657, -1.561093, 1.365391, 0.5254902, 0, 1, 1,
0.6725588, -0.4034111, 2.419791, 0.5294118, 0, 1, 1,
0.6742852, -1.028608, 2.311018, 0.5372549, 0, 1, 1,
0.6773857, 1.165249, 0.6390131, 0.5411765, 0, 1, 1,
0.6774175, 1.166549, 0.6919509, 0.5490196, 0, 1, 1,
0.6784961, 0.8992576, 0.3643553, 0.5529412, 0, 1, 1,
0.6881844, 0.04972871, 0.5080732, 0.5607843, 0, 1, 1,
0.6946001, 1.624047, -1.351699, 0.5647059, 0, 1, 1,
0.6963907, 0.5185598, 1.771022, 0.572549, 0, 1, 1,
0.6964022, -0.7456204, 1.547865, 0.5764706, 0, 1, 1,
0.6968632, -0.9039859, 3.566212, 0.5843138, 0, 1, 1,
0.6998309, 1.693033, 0.8444274, 0.5882353, 0, 1, 1,
0.7039512, 1.005986, -0.1627821, 0.5960785, 0, 1, 1,
0.7049406, -0.1203811, 0.8012785, 0.6039216, 0, 1, 1,
0.7077705, -0.6886215, 3.885882, 0.6078432, 0, 1, 1,
0.7078983, -0.9486716, 0.5002245, 0.6156863, 0, 1, 1,
0.7081674, 0.6275891, -0.3626891, 0.6196079, 0, 1, 1,
0.7106864, 1.415126, 0.4948966, 0.627451, 0, 1, 1,
0.710807, -0.4130151, 1.770299, 0.6313726, 0, 1, 1,
0.7122462, 1.013263, 0.9377835, 0.6392157, 0, 1, 1,
0.7189658, -1.771104, 2.571131, 0.6431373, 0, 1, 1,
0.7197073, 0.8356292, 1.913528, 0.6509804, 0, 1, 1,
0.7208404, 0.8089416, 1.808557, 0.654902, 0, 1, 1,
0.7230108, 1.61524, 0.8486063, 0.6627451, 0, 1, 1,
0.7296066, -0.09363375, 0.4574797, 0.6666667, 0, 1, 1,
0.730257, 1.027973, 1.94768, 0.6745098, 0, 1, 1,
0.7336568, -1.341394, 2.756076, 0.6784314, 0, 1, 1,
0.7423155, -1.79899, 1.177879, 0.6862745, 0, 1, 1,
0.7471155, 0.4903427, 1.606223, 0.6901961, 0, 1, 1,
0.7485746, -0.04846066, 2.993056, 0.6980392, 0, 1, 1,
0.7514368, 1.523949, 3.443796, 0.7058824, 0, 1, 1,
0.7524462, 0.5090234, 0.8552428, 0.7098039, 0, 1, 1,
0.7595102, -2.01504, 4.064261, 0.7176471, 0, 1, 1,
0.7605637, 1.072926, 0.760904, 0.7215686, 0, 1, 1,
0.7608737, 0.9330674, -0.645231, 0.7294118, 0, 1, 1,
0.7651758, -0.4279614, -0.4628072, 0.7333333, 0, 1, 1,
0.7708344, 0.2730083, 0.997082, 0.7411765, 0, 1, 1,
0.7719301, -0.8402364, 1.141506, 0.7450981, 0, 1, 1,
0.772186, -1.012058, 1.114605, 0.7529412, 0, 1, 1,
0.7742126, 0.627082, -0.01842586, 0.7568628, 0, 1, 1,
0.7777767, -1.088012, 2.546157, 0.7647059, 0, 1, 1,
0.7819553, -0.62599, 3.517514, 0.7686275, 0, 1, 1,
0.7895402, -0.2401371, 1.478743, 0.7764706, 0, 1, 1,
0.7958608, -0.7560027, 2.154617, 0.7803922, 0, 1, 1,
0.7959774, 1.903909, -0.3017069, 0.7882353, 0, 1, 1,
0.8158761, 0.3715979, 1.028349, 0.7921569, 0, 1, 1,
0.8264423, -1.440079, 4.137415, 0.8, 0, 1, 1,
0.8392445, 0.3962994, -0.03499192, 0.8078431, 0, 1, 1,
0.8409935, -1.648708, 2.426725, 0.8117647, 0, 1, 1,
0.8420466, 1.335259, 1.648822, 0.8196079, 0, 1, 1,
0.8429326, -0.2094247, 2.891506, 0.8235294, 0, 1, 1,
0.8470648, 0.1684681, 2.239306, 0.8313726, 0, 1, 1,
0.8485434, 1.698862, 1.698829, 0.8352941, 0, 1, 1,
0.8490807, -1.08962, 3.520001, 0.8431373, 0, 1, 1,
0.8580539, -0.6012132, 1.535052, 0.8470588, 0, 1, 1,
0.8614122, -1.446689, 2.048129, 0.854902, 0, 1, 1,
0.8617888, 0.7370278, 0.5696579, 0.8588235, 0, 1, 1,
0.8680373, 0.3247461, -1.293301, 0.8666667, 0, 1, 1,
0.8715481, 1.711382, 0.8958635, 0.8705882, 0, 1, 1,
0.8731222, -0.08180674, 3.341944, 0.8784314, 0, 1, 1,
0.8736334, -0.3702964, 0.72579, 0.8823529, 0, 1, 1,
0.8737661, 1.484093, 0.3772512, 0.8901961, 0, 1, 1,
0.8759035, -1.479376, 2.311738, 0.8941177, 0, 1, 1,
0.8847086, 0.3172086, 1.360465, 0.9019608, 0, 1, 1,
0.8860291, -1.524858, 2.06247, 0.9098039, 0, 1, 1,
0.8867269, 0.4477476, 2.289426, 0.9137255, 0, 1, 1,
0.8907183, -0.6691837, 1.662788, 0.9215686, 0, 1, 1,
0.8922094, -0.1906163, 0.7561824, 0.9254902, 0, 1, 1,
0.8961191, 0.1483122, 0.6632539, 0.9333333, 0, 1, 1,
0.8972688, -0.5597968, 3.123257, 0.9372549, 0, 1, 1,
0.897867, 0.2728619, 1.264161, 0.945098, 0, 1, 1,
0.9010692, -0.3986048, 0.03526257, 0.9490196, 0, 1, 1,
0.9023097, 0.1034397, 0.5118039, 0.9568627, 0, 1, 1,
0.9027954, 0.8616713, 2.490619, 0.9607843, 0, 1, 1,
0.9033916, 2.436878, 0.5224453, 0.9686275, 0, 1, 1,
0.9054009, 0.07984848, 0.6368232, 0.972549, 0, 1, 1,
0.9074166, -0.02029145, 3.06764, 0.9803922, 0, 1, 1,
0.908227, -0.40106, 0.5784342, 0.9843137, 0, 1, 1,
0.9129035, 0.3410009, 0.4308716, 0.9921569, 0, 1, 1,
0.9142356, 1.171276, 1.650275, 0.9960784, 0, 1, 1,
0.9173843, -0.1164529, 2.19814, 1, 0, 0.9960784, 1,
0.922858, 0.1613555, 1.417184, 1, 0, 0.9882353, 1,
0.9309393, 0.8776472, 1.208671, 1, 0, 0.9843137, 1,
0.9352506, 0.417897, 0.7979808, 1, 0, 0.9764706, 1,
0.9375027, -0.2563205, 0.7189843, 1, 0, 0.972549, 1,
0.9441881, 0.8542188, 0.8164845, 1, 0, 0.9647059, 1,
0.9478725, -0.5500607, 2.23671, 1, 0, 0.9607843, 1,
0.9610911, -0.08485108, 0.8304065, 1, 0, 0.9529412, 1,
0.967198, -0.252243, 1.619307, 1, 0, 0.9490196, 1,
0.9704083, -0.7169954, 0.08908743, 1, 0, 0.9411765, 1,
0.9733074, -0.9227004, 3.589074, 1, 0, 0.9372549, 1,
0.9734945, 0.2144045, 3.302244, 1, 0, 0.9294118, 1,
0.9826232, 0.7770562, 0.6700112, 1, 0, 0.9254902, 1,
0.9907891, 0.5585119, 1.476763, 1, 0, 0.9176471, 1,
0.9922587, -1.417313, 1.727882, 1, 0, 0.9137255, 1,
1.002282, 1.182194, -0.1969827, 1, 0, 0.9058824, 1,
1.004381, 0.6764967, 0.5257828, 1, 0, 0.9019608, 1,
1.006377, -0.6336113, 1.25757, 1, 0, 0.8941177, 1,
1.007005, -1.2202, 2.530952, 1, 0, 0.8862745, 1,
1.007613, 2.099716, -2.253584, 1, 0, 0.8823529, 1,
1.008428, -0.6378289, 2.214835, 1, 0, 0.8745098, 1,
1.009323, 1.414247, 0.7081268, 1, 0, 0.8705882, 1,
1.009599, 2.002282, -1.102186, 1, 0, 0.8627451, 1,
1.022819, 0.1744745, 3.881752, 1, 0, 0.8588235, 1,
1.027919, -1.568707, 3.229926, 1, 0, 0.8509804, 1,
1.047061, -0.07636835, 1.262697, 1, 0, 0.8470588, 1,
1.051947, -0.5890873, 3.149338, 1, 0, 0.8392157, 1,
1.052359, 0.9718957, 0.8331955, 1, 0, 0.8352941, 1,
1.058395, 1.448444, 0.9386206, 1, 0, 0.827451, 1,
1.058739, -0.8961518, 2.526529, 1, 0, 0.8235294, 1,
1.065034, 0.3935448, 2.056283, 1, 0, 0.8156863, 1,
1.076412, -0.6562833, 2.870763, 1, 0, 0.8117647, 1,
1.077143, -1.747395, 2.539637, 1, 0, 0.8039216, 1,
1.07834, -0.1887314, 3.794677, 1, 0, 0.7960784, 1,
1.082724, 0.06576087, 2.165659, 1, 0, 0.7921569, 1,
1.086244, 0.9001169, 0.9912647, 1, 0, 0.7843137, 1,
1.088629, -0.7683117, 1.871293, 1, 0, 0.7803922, 1,
1.090376, -1.127816, 3.829911, 1, 0, 0.772549, 1,
1.092013, -0.8279775, 2.078609, 1, 0, 0.7686275, 1,
1.098657, 0.06294911, 3.483254, 1, 0, 0.7607843, 1,
1.104296, 1.568353, 2.485353, 1, 0, 0.7568628, 1,
1.105324, 1.059732, -0.137, 1, 0, 0.7490196, 1,
1.108589, -1.093141, 1.380856, 1, 0, 0.7450981, 1,
1.119116, 0.1933208, 1.40953, 1, 0, 0.7372549, 1,
1.119153, -1.908836, 2.838808, 1, 0, 0.7333333, 1,
1.125601, 0.9585872, 1.229856, 1, 0, 0.7254902, 1,
1.128397, 0.7544615, 0.7401562, 1, 0, 0.7215686, 1,
1.137428, 0.2356834, 2.496438, 1, 0, 0.7137255, 1,
1.140373, -2.233028, 2.439929, 1, 0, 0.7098039, 1,
1.141598, 0.0546025, 1.641931, 1, 0, 0.7019608, 1,
1.147008, 1.158242, 1.627805, 1, 0, 0.6941177, 1,
1.160046, 1.61219, 0.1372112, 1, 0, 0.6901961, 1,
1.161926, 0.866193, 1.303333, 1, 0, 0.682353, 1,
1.165654, 0.248645, -0.135536, 1, 0, 0.6784314, 1,
1.167667, -0.2582114, 3.255986, 1, 0, 0.6705883, 1,
1.190953, -0.2641909, 2.423187, 1, 0, 0.6666667, 1,
1.202378, 0.9034705, -0.343437, 1, 0, 0.6588235, 1,
1.205108, 0.1302209, 2.849447, 1, 0, 0.654902, 1,
1.239037, -0.1968974, 1.829689, 1, 0, 0.6470588, 1,
1.242181, -0.2977573, 2.061596, 1, 0, 0.6431373, 1,
1.250284, 0.04201758, 1.712135, 1, 0, 0.6352941, 1,
1.252131, -0.265513, 0.6618527, 1, 0, 0.6313726, 1,
1.26645, -3.320893, 3.071148, 1, 0, 0.6235294, 1,
1.291244, 1.562295, 0.1985302, 1, 0, 0.6196079, 1,
1.296806, -0.608555, 2.010496, 1, 0, 0.6117647, 1,
1.296926, -0.1114397, 2.634268, 1, 0, 0.6078432, 1,
1.303195, -0.69867, 1.738299, 1, 0, 0.6, 1,
1.313938, -0.3769411, 2.646652, 1, 0, 0.5921569, 1,
1.319175, -1.735012, 3.986875, 1, 0, 0.5882353, 1,
1.321638, 0.1748116, 0.570829, 1, 0, 0.5803922, 1,
1.326847, -1.113643, 3.292248, 1, 0, 0.5764706, 1,
1.343004, -1.317225, 4.366164, 1, 0, 0.5686275, 1,
1.350198, -1.135466, 2.02376, 1, 0, 0.5647059, 1,
1.358014, -0.4646132, 3.132552, 1, 0, 0.5568628, 1,
1.365872, -2.05685, 3.763837, 1, 0, 0.5529412, 1,
1.36757, -0.4620496, 1.566048, 1, 0, 0.5450981, 1,
1.375519, 0.3609544, 1.465963, 1, 0, 0.5411765, 1,
1.377563, 0.7031512, 0.5117314, 1, 0, 0.5333334, 1,
1.390856, 0.4935937, 1.899092, 1, 0, 0.5294118, 1,
1.394521, -1.910277, 2.833585, 1, 0, 0.5215687, 1,
1.402732, -0.4235489, 1.349749, 1, 0, 0.5176471, 1,
1.403563, -1.651604, 4.014176, 1, 0, 0.509804, 1,
1.409932, 1.474103, 0.09644063, 1, 0, 0.5058824, 1,
1.412869, -1.19401, 2.739694, 1, 0, 0.4980392, 1,
1.417121, 1.036902, 0.8037059, 1, 0, 0.4901961, 1,
1.451914, -1.571413, 1.566578, 1, 0, 0.4862745, 1,
1.452921, -0.6102123, 2.294028, 1, 0, 0.4784314, 1,
1.455853, 0.7473932, 1.829764, 1, 0, 0.4745098, 1,
1.473361, 1.298796, 0.7673824, 1, 0, 0.4666667, 1,
1.493952, 0.8084238, 0.28679, 1, 0, 0.4627451, 1,
1.49806, 0.8632296, 0.7471207, 1, 0, 0.454902, 1,
1.498871, 0.9966731, 1.496358, 1, 0, 0.4509804, 1,
1.500255, 0.03267509, 2.591989, 1, 0, 0.4431373, 1,
1.506715, -1.053714, 0.8806283, 1, 0, 0.4392157, 1,
1.511409, -2.264715, 0.6446698, 1, 0, 0.4313726, 1,
1.517065, -0.2324608, 1.897125, 1, 0, 0.427451, 1,
1.52786, -0.1715131, -0.006609345, 1, 0, 0.4196078, 1,
1.537959, -0.0781306, 3.110527, 1, 0, 0.4156863, 1,
1.53977, 1.355559, 2.689909, 1, 0, 0.4078431, 1,
1.544363, 0.391081, 1.565877, 1, 0, 0.4039216, 1,
1.549213, -0.3248927, 0.9111354, 1, 0, 0.3960784, 1,
1.567016, 0.3309309, 2.912156, 1, 0, 0.3882353, 1,
1.572989, 1.445821, 1.33396, 1, 0, 0.3843137, 1,
1.574006, 1.754507, 0.9707555, 1, 0, 0.3764706, 1,
1.574226, -0.5918764, 1.862514, 1, 0, 0.372549, 1,
1.578121, 1.98738, 3.240899, 1, 0, 0.3647059, 1,
1.610726, 1.427088, 1.767076, 1, 0, 0.3607843, 1,
1.617779, 0.5251741, 2.752004, 1, 0, 0.3529412, 1,
1.619035, -1.205838, 0.5205287, 1, 0, 0.3490196, 1,
1.637884, -0.3457527, 0.996936, 1, 0, 0.3411765, 1,
1.642919, 0.1339417, 1.324902, 1, 0, 0.3372549, 1,
1.644854, -0.09063231, 2.728821, 1, 0, 0.3294118, 1,
1.646811, 0.01553905, 1.122484, 1, 0, 0.3254902, 1,
1.651795, 0.6315932, 0.7706423, 1, 0, 0.3176471, 1,
1.663704, -1.027596, 2.613342, 1, 0, 0.3137255, 1,
1.679148, 1.150255, 1.449053, 1, 0, 0.3058824, 1,
1.680243, -2.10221, 3.43313, 1, 0, 0.2980392, 1,
1.686248, -0.8469746, 2.576218, 1, 0, 0.2941177, 1,
1.689552, 0.1424774, 0.8148226, 1, 0, 0.2862745, 1,
1.717438, -1.015573, 1.813703, 1, 0, 0.282353, 1,
1.749084, 2.621616, 1.2244, 1, 0, 0.2745098, 1,
1.758574, -0.1293682, 1.096756, 1, 0, 0.2705882, 1,
1.789775, 0.06980437, 0.6627513, 1, 0, 0.2627451, 1,
1.79701, -2.226873, 2.217869, 1, 0, 0.2588235, 1,
1.810681, -0.8063771, 1.319997, 1, 0, 0.2509804, 1,
1.820549, 0.615141, 0.8085527, 1, 0, 0.2470588, 1,
1.838246, -1.600118, 2.421654, 1, 0, 0.2392157, 1,
1.862402, -1.638179, 1.924816, 1, 0, 0.2352941, 1,
1.867084, 0.4920866, 0.8078148, 1, 0, 0.227451, 1,
1.887278, 0.2502787, 3.153034, 1, 0, 0.2235294, 1,
1.910257, 1.57429, 0.7370375, 1, 0, 0.2156863, 1,
1.920299, -1.012629, 1.320031, 1, 0, 0.2117647, 1,
1.926977, 0.9995875, 2.334722, 1, 0, 0.2039216, 1,
1.93444, -0.8906381, 2.042189, 1, 0, 0.1960784, 1,
1.948128, 0.2035697, 0.1505762, 1, 0, 0.1921569, 1,
1.982313, -0.6027392, 1.686236, 1, 0, 0.1843137, 1,
1.988387, -0.4881238, 1.511516, 1, 0, 0.1803922, 1,
2.018628, 0.5583671, 0.1538504, 1, 0, 0.172549, 1,
2.018776, 0.9276875, 1.045068, 1, 0, 0.1686275, 1,
2.052115, 1.167749, 2.097661, 1, 0, 0.1607843, 1,
2.058878, -1.518193, 0.9301772, 1, 0, 0.1568628, 1,
2.067571, -2.246591, 3.603132, 1, 0, 0.1490196, 1,
2.079823, -0.4192869, 1.463193, 1, 0, 0.145098, 1,
2.08947, -0.6279542, -0.2473841, 1, 0, 0.1372549, 1,
2.095792, 0.1117864, 1.490188, 1, 0, 0.1333333, 1,
2.184796, -0.7234552, 2.139128, 1, 0, 0.1254902, 1,
2.215225, 1.449082, 0.4469888, 1, 0, 0.1215686, 1,
2.215583, 0.252084, 1.655929, 1, 0, 0.1137255, 1,
2.216034, -2.099316, 2.182006, 1, 0, 0.1098039, 1,
2.227612, -0.2756574, 3.342336, 1, 0, 0.1019608, 1,
2.253052, 1.425662, 0.947957, 1, 0, 0.09411765, 1,
2.297265, 0.955045, 0.6024668, 1, 0, 0.09019608, 1,
2.324738, 2.18647, 0.4252099, 1, 0, 0.08235294, 1,
2.328922, 0.6196464, 1.099769, 1, 0, 0.07843138, 1,
2.351139, 1.277996, 0.2004633, 1, 0, 0.07058824, 1,
2.372917, -1.127502, 1.789921, 1, 0, 0.06666667, 1,
2.413851, 1.049583, 1.915428, 1, 0, 0.05882353, 1,
2.444157, -0.1545195, 0.9384716, 1, 0, 0.05490196, 1,
2.456703, 1.136051, 1.101254, 1, 0, 0.04705882, 1,
2.478517, 1.234013, 1.711156, 1, 0, 0.04313726, 1,
2.544011, -0.4160209, 3.663259, 1, 0, 0.03529412, 1,
2.575863, -0.8065455, 1.684601, 1, 0, 0.03137255, 1,
2.669516, 0.9750741, -0.2521725, 1, 0, 0.02352941, 1,
2.864046, -0.2686553, 1.648364, 1, 0, 0.01960784, 1,
3.055086, -0.440359, 2.328475, 1, 0, 0.01176471, 1,
3.092134, 1.192426, -0.1690118, 1, 0, 0.007843138, 1
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
-0.18241, -4.696297, -7.228792, 0, -0.5, 0.5, 0.5,
-0.18241, -4.696297, -7.228792, 1, -0.5, 0.5, 0.5,
-0.18241, -4.696297, -7.228792, 1, 1.5, 0.5, 0.5,
-0.18241, -4.696297, -7.228792, 0, 1.5, 0.5, 0.5
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
-4.567024, -0.3105067, -7.228792, 0, -0.5, 0.5, 0.5,
-4.567024, -0.3105067, -7.228792, 1, -0.5, 0.5, 0.5,
-4.567024, -0.3105067, -7.228792, 1, 1.5, 0.5, 0.5,
-4.567024, -0.3105067, -7.228792, 0, 1.5, 0.5, 0.5
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
-4.567024, -4.696297, 0.9900987, 0, -0.5, 0.5, 0.5,
-4.567024, -4.696297, 0.9900987, 1, -0.5, 0.5, 0.5,
-4.567024, -4.696297, 0.9900987, 1, 1.5, 0.5, 0.5,
-4.567024, -4.696297, 0.9900987, 0, 1.5, 0.5, 0.5
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
-3, -3.684192, -5.332125,
3, -3.684192, -5.332125,
-3, -3.684192, -5.332125,
-3, -3.852876, -5.648236,
-2, -3.684192, -5.332125,
-2, -3.852876, -5.648236,
-1, -3.684192, -5.332125,
-1, -3.852876, -5.648236,
0, -3.684192, -5.332125,
0, -3.852876, -5.648236,
1, -3.684192, -5.332125,
1, -3.852876, -5.648236,
2, -3.684192, -5.332125,
2, -3.852876, -5.648236,
3, -3.684192, -5.332125,
3, -3.852876, -5.648236
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
-3, -4.190245, -6.280458, 0, -0.5, 0.5, 0.5,
-3, -4.190245, -6.280458, 1, -0.5, 0.5, 0.5,
-3, -4.190245, -6.280458, 1, 1.5, 0.5, 0.5,
-3, -4.190245, -6.280458, 0, 1.5, 0.5, 0.5,
-2, -4.190245, -6.280458, 0, -0.5, 0.5, 0.5,
-2, -4.190245, -6.280458, 1, -0.5, 0.5, 0.5,
-2, -4.190245, -6.280458, 1, 1.5, 0.5, 0.5,
-2, -4.190245, -6.280458, 0, 1.5, 0.5, 0.5,
-1, -4.190245, -6.280458, 0, -0.5, 0.5, 0.5,
-1, -4.190245, -6.280458, 1, -0.5, 0.5, 0.5,
-1, -4.190245, -6.280458, 1, 1.5, 0.5, 0.5,
-1, -4.190245, -6.280458, 0, 1.5, 0.5, 0.5,
0, -4.190245, -6.280458, 0, -0.5, 0.5, 0.5,
0, -4.190245, -6.280458, 1, -0.5, 0.5, 0.5,
0, -4.190245, -6.280458, 1, 1.5, 0.5, 0.5,
0, -4.190245, -6.280458, 0, 1.5, 0.5, 0.5,
1, -4.190245, -6.280458, 0, -0.5, 0.5, 0.5,
1, -4.190245, -6.280458, 1, -0.5, 0.5, 0.5,
1, -4.190245, -6.280458, 1, 1.5, 0.5, 0.5,
1, -4.190245, -6.280458, 0, 1.5, 0.5, 0.5,
2, -4.190245, -6.280458, 0, -0.5, 0.5, 0.5,
2, -4.190245, -6.280458, 1, -0.5, 0.5, 0.5,
2, -4.190245, -6.280458, 1, 1.5, 0.5, 0.5,
2, -4.190245, -6.280458, 0, 1.5, 0.5, 0.5,
3, -4.190245, -6.280458, 0, -0.5, 0.5, 0.5,
3, -4.190245, -6.280458, 1, -0.5, 0.5, 0.5,
3, -4.190245, -6.280458, 1, 1.5, 0.5, 0.5,
3, -4.190245, -6.280458, 0, 1.5, 0.5, 0.5
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
-3.55519, -3, -5.332125,
-3.55519, 2, -5.332125,
-3.55519, -3, -5.332125,
-3.723829, -3, -5.648236,
-3.55519, -2, -5.332125,
-3.723829, -2, -5.648236,
-3.55519, -1, -5.332125,
-3.723829, -1, -5.648236,
-3.55519, 0, -5.332125,
-3.723829, 0, -5.648236,
-3.55519, 1, -5.332125,
-3.723829, 1, -5.648236,
-3.55519, 2, -5.332125,
-3.723829, 2, -5.648236
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
-4.061107, -3, -6.280458, 0, -0.5, 0.5, 0.5,
-4.061107, -3, -6.280458, 1, -0.5, 0.5, 0.5,
-4.061107, -3, -6.280458, 1, 1.5, 0.5, 0.5,
-4.061107, -3, -6.280458, 0, 1.5, 0.5, 0.5,
-4.061107, -2, -6.280458, 0, -0.5, 0.5, 0.5,
-4.061107, -2, -6.280458, 1, -0.5, 0.5, 0.5,
-4.061107, -2, -6.280458, 1, 1.5, 0.5, 0.5,
-4.061107, -2, -6.280458, 0, 1.5, 0.5, 0.5,
-4.061107, -1, -6.280458, 0, -0.5, 0.5, 0.5,
-4.061107, -1, -6.280458, 1, -0.5, 0.5, 0.5,
-4.061107, -1, -6.280458, 1, 1.5, 0.5, 0.5,
-4.061107, -1, -6.280458, 0, 1.5, 0.5, 0.5,
-4.061107, 0, -6.280458, 0, -0.5, 0.5, 0.5,
-4.061107, 0, -6.280458, 1, -0.5, 0.5, 0.5,
-4.061107, 0, -6.280458, 1, 1.5, 0.5, 0.5,
-4.061107, 0, -6.280458, 0, 1.5, 0.5, 0.5,
-4.061107, 1, -6.280458, 0, -0.5, 0.5, 0.5,
-4.061107, 1, -6.280458, 1, -0.5, 0.5, 0.5,
-4.061107, 1, -6.280458, 1, 1.5, 0.5, 0.5,
-4.061107, 1, -6.280458, 0, 1.5, 0.5, 0.5,
-4.061107, 2, -6.280458, 0, -0.5, 0.5, 0.5,
-4.061107, 2, -6.280458, 1, -0.5, 0.5, 0.5,
-4.061107, 2, -6.280458, 1, 1.5, 0.5, 0.5,
-4.061107, 2, -6.280458, 0, 1.5, 0.5, 0.5
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
-3.55519, -3.684192, -4,
-3.55519, -3.684192, 6,
-3.55519, -3.684192, -4,
-3.723829, -3.852876, -4,
-3.55519, -3.684192, -2,
-3.723829, -3.852876, -2,
-3.55519, -3.684192, 0,
-3.723829, -3.852876, 0,
-3.55519, -3.684192, 2,
-3.723829, -3.852876, 2,
-3.55519, -3.684192, 4,
-3.723829, -3.852876, 4,
-3.55519, -3.684192, 6,
-3.723829, -3.852876, 6
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
"4",
"6"
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
-4.061107, -4.190245, -4, 0, -0.5, 0.5, 0.5,
-4.061107, -4.190245, -4, 1, -0.5, 0.5, 0.5,
-4.061107, -4.190245, -4, 1, 1.5, 0.5, 0.5,
-4.061107, -4.190245, -4, 0, 1.5, 0.5, 0.5,
-4.061107, -4.190245, -2, 0, -0.5, 0.5, 0.5,
-4.061107, -4.190245, -2, 1, -0.5, 0.5, 0.5,
-4.061107, -4.190245, -2, 1, 1.5, 0.5, 0.5,
-4.061107, -4.190245, -2, 0, 1.5, 0.5, 0.5,
-4.061107, -4.190245, 0, 0, -0.5, 0.5, 0.5,
-4.061107, -4.190245, 0, 1, -0.5, 0.5, 0.5,
-4.061107, -4.190245, 0, 1, 1.5, 0.5, 0.5,
-4.061107, -4.190245, 0, 0, 1.5, 0.5, 0.5,
-4.061107, -4.190245, 2, 0, -0.5, 0.5, 0.5,
-4.061107, -4.190245, 2, 1, -0.5, 0.5, 0.5,
-4.061107, -4.190245, 2, 1, 1.5, 0.5, 0.5,
-4.061107, -4.190245, 2, 0, 1.5, 0.5, 0.5,
-4.061107, -4.190245, 4, 0, -0.5, 0.5, 0.5,
-4.061107, -4.190245, 4, 1, -0.5, 0.5, 0.5,
-4.061107, -4.190245, 4, 1, 1.5, 0.5, 0.5,
-4.061107, -4.190245, 4, 0, 1.5, 0.5, 0.5,
-4.061107, -4.190245, 6, 0, -0.5, 0.5, 0.5,
-4.061107, -4.190245, 6, 1, -0.5, 0.5, 0.5,
-4.061107, -4.190245, 6, 1, 1.5, 0.5, 0.5,
-4.061107, -4.190245, 6, 0, 1.5, 0.5, 0.5
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
-3.55519, -3.684192, -5.332125,
-3.55519, 3.063179, -5.332125,
-3.55519, -3.684192, 7.312322,
-3.55519, 3.063179, 7.312322,
-3.55519, -3.684192, -5.332125,
-3.55519, -3.684192, 7.312322,
-3.55519, 3.063179, -5.332125,
-3.55519, 3.063179, 7.312322,
-3.55519, -3.684192, -5.332125,
3.19037, -3.684192, -5.332125,
-3.55519, -3.684192, 7.312322,
3.19037, -3.684192, 7.312322,
-3.55519, 3.063179, -5.332125,
3.19037, 3.063179, -5.332125,
-3.55519, 3.063179, 7.312322,
3.19037, 3.063179, 7.312322,
3.19037, -3.684192, -5.332125,
3.19037, 3.063179, -5.332125,
3.19037, -3.684192, 7.312322,
3.19037, 3.063179, 7.312322,
3.19037, -3.684192, -5.332125,
3.19037, -3.684192, 7.312322,
3.19037, 3.063179, -5.332125,
3.19037, 3.063179, 7.312322
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
var radius = 8.458354;
var distance = 37.63217;
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
mvMatrix.translate( 0.18241, 0.3105067, -0.9900987 );
mvMatrix.scale( 1.355757, 1.355393, 0.7232691 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.63217);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
hydrogen_cyanide_hyd<-read.table("hydrogen_cyanide_hyd.xyz", skip=1)
x<-hydrogen_cyanide_hyd$V2
y<-hydrogen_cyanide_hyd$V3
z<-hydrogen_cyanide_hyd$V4
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
6, 2, 2, 0, 0, 1, 1, 1,
2, 1, 1, 1, 0, 0, 1, 1,
1, 1, 1, 1, 0, 0, 1, 1,
3, 1, 1, 1, 0, 0, 1, 1,
5, 1, 1, 1, 0, 0, 1, 1,
4, 1, 1, 1, 0, 0, 1, 1
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
var radius = 4.501944;
var distance = 15.81289;
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
mvMatrix.translate( -3.5, -1.5, -1.5 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -15.81289);
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
for (var i = 0; i < 6; i++) {
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
