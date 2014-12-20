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
-3.087896, -0.1113025, -0.9370783, 1, 0, 0, 1,
-3.028518, 0.9773142, -1.299941, 1, 0.007843138, 0, 1,
-3.027846, 0.0939784, -0.9494266, 1, 0.01176471, 0, 1,
-2.841821, 0.5300978, -2.882383, 1, 0.01960784, 0, 1,
-2.79671, -0.6651219, -2.072984, 1, 0.02352941, 0, 1,
-2.758711, 1.013106, -1.523142, 1, 0.03137255, 0, 1,
-2.636435, -0.7865048, -2.827594, 1, 0.03529412, 0, 1,
-2.41607, -1.483072, -3.555619, 1, 0.04313726, 0, 1,
-2.349691, -0.3676044, -2.607962, 1, 0.04705882, 0, 1,
-2.288772, -0.2895021, -1.892549, 1, 0.05490196, 0, 1,
-2.279253, -1.694354, -1.416791, 1, 0.05882353, 0, 1,
-2.269977, 0.2946769, -1.397009, 1, 0.06666667, 0, 1,
-2.261031, 0.376687, -1.968367, 1, 0.07058824, 0, 1,
-2.233177, -0.7294052, -1.874091, 1, 0.07843138, 0, 1,
-2.220323, 1.259311, -0.5466381, 1, 0.08235294, 0, 1,
-2.17421, 0.8194384, -0.9069182, 1, 0.09019608, 0, 1,
-2.074531, -0.4216855, -1.279395, 1, 0.09411765, 0, 1,
-2.072248, -1.320277, -2.365392, 1, 0.1019608, 0, 1,
-2.071643, 2.383191, 1.057332, 1, 0.1098039, 0, 1,
-2.045549, -1.25266, -2.38499, 1, 0.1137255, 0, 1,
-2.019241, 0.4497753, -0.8285212, 1, 0.1215686, 0, 1,
-2.018986, 1.305453, -0.9418007, 1, 0.1254902, 0, 1,
-2.018035, 0.1324639, -1.501912, 1, 0.1333333, 0, 1,
-2.00296, -1.130324, -4.630364, 1, 0.1372549, 0, 1,
-1.964934, 1.285079, -1.278966, 1, 0.145098, 0, 1,
-1.962447, 0.2059981, -0.1328214, 1, 0.1490196, 0, 1,
-1.938405, 0.1558937, -2.164509, 1, 0.1568628, 0, 1,
-1.937564, -1.957914, -2.763946, 1, 0.1607843, 0, 1,
-1.935691, 2.528656, -2.101477, 1, 0.1686275, 0, 1,
-1.918741, -0.3992881, -2.450273, 1, 0.172549, 0, 1,
-1.900896, 0.8276168, -1.423085, 1, 0.1803922, 0, 1,
-1.890206, -0.6491591, -3.738775, 1, 0.1843137, 0, 1,
-1.839504, -1.700786, -3.06649, 1, 0.1921569, 0, 1,
-1.790232, -0.2687653, -3.088797, 1, 0.1960784, 0, 1,
-1.766598, -0.3877182, -1.526085, 1, 0.2039216, 0, 1,
-1.763688, -0.3869363, -2.822454, 1, 0.2117647, 0, 1,
-1.752303, -0.02538441, -2.006348, 1, 0.2156863, 0, 1,
-1.751985, 0.07644209, -0.5959755, 1, 0.2235294, 0, 1,
-1.726392, -1.308162, -2.918603, 1, 0.227451, 0, 1,
-1.708295, 1.165328, -2.413081, 1, 0.2352941, 0, 1,
-1.693681, -1.084328, -3.073698, 1, 0.2392157, 0, 1,
-1.692475, 0.544801, -1.553811, 1, 0.2470588, 0, 1,
-1.682296, -0.1638041, -2.553853, 1, 0.2509804, 0, 1,
-1.673605, -1.369307, -3.846432, 1, 0.2588235, 0, 1,
-1.665416, 0.0001241777, -1.705608, 1, 0.2627451, 0, 1,
-1.663588, 1.575573, -1.22127, 1, 0.2705882, 0, 1,
-1.649882, 0.0487025, -0.9422455, 1, 0.2745098, 0, 1,
-1.649371, -0.3201542, -2.28818, 1, 0.282353, 0, 1,
-1.647179, -0.5581269, -1.926697, 1, 0.2862745, 0, 1,
-1.627512, -0.5189306, -0.2331244, 1, 0.2941177, 0, 1,
-1.626201, -0.7017701, -1.605816, 1, 0.3019608, 0, 1,
-1.626021, 0.4636399, -1.643081, 1, 0.3058824, 0, 1,
-1.61882, -1.795067, -4.368098, 1, 0.3137255, 0, 1,
-1.616022, -1.525185, -1.813547, 1, 0.3176471, 0, 1,
-1.613309, 1.267814, -0.5501473, 1, 0.3254902, 0, 1,
-1.593568, -1.302398, -2.248715, 1, 0.3294118, 0, 1,
-1.588377, -2.150244, -1.926398, 1, 0.3372549, 0, 1,
-1.577365, -1.187959, -2.554827, 1, 0.3411765, 0, 1,
-1.568582, 1.215673, -0.3471487, 1, 0.3490196, 0, 1,
-1.560842, -0.690232, -2.857629, 1, 0.3529412, 0, 1,
-1.555105, 1.416678, -0.3928974, 1, 0.3607843, 0, 1,
-1.554379, -0.02441034, -0.5702382, 1, 0.3647059, 0, 1,
-1.540861, 0.170397, -4.122927, 1, 0.372549, 0, 1,
-1.528728, -2.107083, -2.129552, 1, 0.3764706, 0, 1,
-1.525856, -0.0170237, -1.450802, 1, 0.3843137, 0, 1,
-1.525053, 0.4747833, -1.600656, 1, 0.3882353, 0, 1,
-1.518915, 0.4761219, 0.2284263, 1, 0.3960784, 0, 1,
-1.511566, 0.6120331, -1.467088, 1, 0.4039216, 0, 1,
-1.509168, -0.4851106, -1.762631, 1, 0.4078431, 0, 1,
-1.508851, 1.095263, -1.912096, 1, 0.4156863, 0, 1,
-1.500481, -0.8346311, -0.06692137, 1, 0.4196078, 0, 1,
-1.491571, 1.32596, -1.184447, 1, 0.427451, 0, 1,
-1.487537, -0.393536, 0.2334987, 1, 0.4313726, 0, 1,
-1.468626, 0.5029069, -1.976745, 1, 0.4392157, 0, 1,
-1.467216, 0.7149987, -0.8673452, 1, 0.4431373, 0, 1,
-1.457933, 0.5109296, -1.50394, 1, 0.4509804, 0, 1,
-1.443679, 1.286874, -1.136977, 1, 0.454902, 0, 1,
-1.440674, 2.692984, -0.9093077, 1, 0.4627451, 0, 1,
-1.427224, -2.157661, -2.676016, 1, 0.4666667, 0, 1,
-1.41996, 1.076566, -1.928109, 1, 0.4745098, 0, 1,
-1.419139, 0.5598364, -1.810129, 1, 0.4784314, 0, 1,
-1.417705, -1.709091, -2.544638, 1, 0.4862745, 0, 1,
-1.415037, -1.369739, -2.031755, 1, 0.4901961, 0, 1,
-1.405202, 0.9897282, 1.380424, 1, 0.4980392, 0, 1,
-1.402762, 0.1723523, -1.115591, 1, 0.5058824, 0, 1,
-1.392446, 1.362303, -1.562694, 1, 0.509804, 0, 1,
-1.388494, 0.9118461, -1.852125, 1, 0.5176471, 0, 1,
-1.38805, -1.016876, -2.768351, 1, 0.5215687, 0, 1,
-1.386911, -1.450668, -3.220112, 1, 0.5294118, 0, 1,
-1.382175, -0.2860973, -2.432341, 1, 0.5333334, 0, 1,
-1.381196, -0.296441, -1.653531, 1, 0.5411765, 0, 1,
-1.375969, -0.1855846, -1.952975, 1, 0.5450981, 0, 1,
-1.366003, -0.2104608, -0.6501088, 1, 0.5529412, 0, 1,
-1.361703, -0.1395772, -1.577764, 1, 0.5568628, 0, 1,
-1.356003, 0.6009617, -0.4406724, 1, 0.5647059, 0, 1,
-1.344556, 0.6029683, -0.7212955, 1, 0.5686275, 0, 1,
-1.341112, -0.04662744, -1.874825, 1, 0.5764706, 0, 1,
-1.338951, -1.777728, -1.458156, 1, 0.5803922, 0, 1,
-1.315082, -1.149496, -2.371127, 1, 0.5882353, 0, 1,
-1.309474, -0.7179673, -1.077898, 1, 0.5921569, 0, 1,
-1.308021, 1.437096, -3.294996, 1, 0.6, 0, 1,
-1.301859, 0.8069725, 0.4963769, 1, 0.6078432, 0, 1,
-1.301217, 0.4100012, -2.995599, 1, 0.6117647, 0, 1,
-1.299834, -0.5300531, -1.719865, 1, 0.6196079, 0, 1,
-1.297847, -0.6458852, -1.354111, 1, 0.6235294, 0, 1,
-1.295398, -0.6808047, -1.615798, 1, 0.6313726, 0, 1,
-1.29252, 1.45109, 0.7684827, 1, 0.6352941, 0, 1,
-1.285246, -0.8260795, -1.782413, 1, 0.6431373, 0, 1,
-1.28519, -0.4038138, -3.370188, 1, 0.6470588, 0, 1,
-1.283662, 0.1049818, -2.848367, 1, 0.654902, 0, 1,
-1.270423, 0.6228999, -2.200199, 1, 0.6588235, 0, 1,
-1.265839, 1.523248, -1.242212, 1, 0.6666667, 0, 1,
-1.24908, 0.2878177, -0.1395328, 1, 0.6705883, 0, 1,
-1.243004, 0.9205928, -1.571478, 1, 0.6784314, 0, 1,
-1.236178, 0.262395, -1.818643, 1, 0.682353, 0, 1,
-1.235794, 0.6440808, -0.1195102, 1, 0.6901961, 0, 1,
-1.233526, -0.5282663, -2.441675, 1, 0.6941177, 0, 1,
-1.233479, -0.1466361, -0.7673174, 1, 0.7019608, 0, 1,
-1.232941, 0.7741746, 1.343235, 1, 0.7098039, 0, 1,
-1.227336, 0.9917298, -0.1659386, 1, 0.7137255, 0, 1,
-1.215184, 0.7905066, -0.5020366, 1, 0.7215686, 0, 1,
-1.209122, -1.792504, -1.789107, 1, 0.7254902, 0, 1,
-1.191671, 0.04342182, -0.1627109, 1, 0.7333333, 0, 1,
-1.184466, -0.7986622, -1.655935, 1, 0.7372549, 0, 1,
-1.184008, 0.8675008, 1.246478, 1, 0.7450981, 0, 1,
-1.18384, 0.7857665, -1.62218, 1, 0.7490196, 0, 1,
-1.178491, 0.1856861, -0.2495341, 1, 0.7568628, 0, 1,
-1.172192, -0.8901324, -0.9293779, 1, 0.7607843, 0, 1,
-1.166193, -1.708285, -4.991297, 1, 0.7686275, 0, 1,
-1.163262, 0.1379082, -1.431958, 1, 0.772549, 0, 1,
-1.155652, -0.1251679, -0.5851918, 1, 0.7803922, 0, 1,
-1.137327, 0.2741183, -1.157001, 1, 0.7843137, 0, 1,
-1.132976, 0.1354448, -0.6451345, 1, 0.7921569, 0, 1,
-1.132633, 0.4687318, -2.299625, 1, 0.7960784, 0, 1,
-1.127788, 0.4518986, -1.001818, 1, 0.8039216, 0, 1,
-1.127125, 0.249125, -0.1334615, 1, 0.8117647, 0, 1,
-1.120606, -1.122965, -2.570232, 1, 0.8156863, 0, 1,
-1.120031, 0.622377, -2.290271, 1, 0.8235294, 0, 1,
-1.116948, -0.2614979, -1.881516, 1, 0.827451, 0, 1,
-1.108098, 1.002593, -1.559488, 1, 0.8352941, 0, 1,
-1.103725, 0.2676826, -2.594978, 1, 0.8392157, 0, 1,
-1.096535, -0.7027485, -1.922008, 1, 0.8470588, 0, 1,
-1.094367, -0.4677132, -0.6062132, 1, 0.8509804, 0, 1,
-1.092731, -1.00711, -1.834625, 1, 0.8588235, 0, 1,
-1.085222, 1.509978, 1.385341, 1, 0.8627451, 0, 1,
-1.080968, -0.06559673, -2.876899, 1, 0.8705882, 0, 1,
-1.077205, 0.02427893, -1.384095, 1, 0.8745098, 0, 1,
-1.076467, -1.143963, -1.997249, 1, 0.8823529, 0, 1,
-1.068655, 0.2841808, -1.211446, 1, 0.8862745, 0, 1,
-1.063281, 0.6687367, 0.4834462, 1, 0.8941177, 0, 1,
-1.062788, 0.1568873, -2.837493, 1, 0.8980392, 0, 1,
-1.062074, -0.3852908, -0.3806601, 1, 0.9058824, 0, 1,
-1.061544, 1.272267, -1.155512, 1, 0.9137255, 0, 1,
-1.059965, -0.9434112, -2.21343, 1, 0.9176471, 0, 1,
-1.033148, -0.4316859, -1.936812, 1, 0.9254902, 0, 1,
-1.028996, 1.32053, 0.5977933, 1, 0.9294118, 0, 1,
-1.023726, -0.5864531, -2.301662, 1, 0.9372549, 0, 1,
-1.020681, -0.04078734, -1.275331, 1, 0.9411765, 0, 1,
-1.013425, 0.1123999, -1.719249, 1, 0.9490196, 0, 1,
-1.006451, -1.334343, -4.355533, 1, 0.9529412, 0, 1,
-1.000785, -0.2021246, -1.961751, 1, 0.9607843, 0, 1,
-0.9957665, 0.1254692, -0.9844015, 1, 0.9647059, 0, 1,
-0.9956086, 0.3679609, -1.640826, 1, 0.972549, 0, 1,
-0.989763, -0.01844325, -2.591506, 1, 0.9764706, 0, 1,
-0.9865865, -0.1540385, -2.39852, 1, 0.9843137, 0, 1,
-0.9788015, 0.5535984, -0.6582395, 1, 0.9882353, 0, 1,
-0.9658877, -0.3261925, -3.520462, 1, 0.9960784, 0, 1,
-0.9556794, -0.1891615, -3.061418, 0.9960784, 1, 0, 1,
-0.9524173, 0.06262701, -1.475546, 0.9921569, 1, 0, 1,
-0.9521291, 0.7376018, -1.257488, 0.9843137, 1, 0, 1,
-0.947446, -1.1685, -2.881932, 0.9803922, 1, 0, 1,
-0.9392631, -0.1417416, -0.9801591, 0.972549, 1, 0, 1,
-0.9372455, -0.6682907, -1.440943, 0.9686275, 1, 0, 1,
-0.936532, 0.3936871, -0.712995, 0.9607843, 1, 0, 1,
-0.9358192, -0.438255, -2.309069, 0.9568627, 1, 0, 1,
-0.9318804, 2.450883, 1.649777, 0.9490196, 1, 0, 1,
-0.9305489, 0.4676453, -1.731861, 0.945098, 1, 0, 1,
-0.925347, 0.9284123, -1.270188, 0.9372549, 1, 0, 1,
-0.9229042, -0.8551752, -3.539041, 0.9333333, 1, 0, 1,
-0.9226685, 0.870323, 1.160552, 0.9254902, 1, 0, 1,
-0.9190629, 0.8875785, -0.1194387, 0.9215686, 1, 0, 1,
-0.9120892, 0.6864713, -2.378582, 0.9137255, 1, 0, 1,
-0.9006584, 0.2306006, 0.1377627, 0.9098039, 1, 0, 1,
-0.8940285, 1.130925, -1.467736, 0.9019608, 1, 0, 1,
-0.8934398, -0.5103576, -3.147897, 0.8941177, 1, 0, 1,
-0.8894526, 1.243848, 0.08718167, 0.8901961, 1, 0, 1,
-0.8714435, -0.3356439, -2.416094, 0.8823529, 1, 0, 1,
-0.8674253, -1.289597, -2.069689, 0.8784314, 1, 0, 1,
-0.863763, 0.1973471, -1.804614, 0.8705882, 1, 0, 1,
-0.8587894, -0.5982314, -3.245013, 0.8666667, 1, 0, 1,
-0.8568534, -0.2201251, -3.417203, 0.8588235, 1, 0, 1,
-0.8493552, 0.153927, -2.054415, 0.854902, 1, 0, 1,
-0.8459997, -1.556702, -1.581804, 0.8470588, 1, 0, 1,
-0.8364035, -1.938877, -3.076629, 0.8431373, 1, 0, 1,
-0.8317196, -0.03853219, -0.1682375, 0.8352941, 1, 0, 1,
-0.827989, -1.153232, -0.140998, 0.8313726, 1, 0, 1,
-0.8263701, 1.080606, 0.01010283, 0.8235294, 1, 0, 1,
-0.8212786, -1.089692, -1.164081, 0.8196079, 1, 0, 1,
-0.8201329, 0.1545278, -0.8316037, 0.8117647, 1, 0, 1,
-0.8195523, 0.5358293, -0.3218936, 0.8078431, 1, 0, 1,
-0.8160761, -1.123182, -2.878153, 0.8, 1, 0, 1,
-0.8155023, 0.1678616, -0.3582128, 0.7921569, 1, 0, 1,
-0.8080536, 0.1631394, -1.386155, 0.7882353, 1, 0, 1,
-0.8019667, 0.6488916, -2.006165, 0.7803922, 1, 0, 1,
-0.8000063, 0.5577077, 0.0107421, 0.7764706, 1, 0, 1,
-0.7992697, 0.08385492, -2.778673, 0.7686275, 1, 0, 1,
-0.7958807, -0.03892866, -1.712813, 0.7647059, 1, 0, 1,
-0.7949951, 0.004332971, -1.549542, 0.7568628, 1, 0, 1,
-0.7926903, 0.2962097, -2.259706, 0.7529412, 1, 0, 1,
-0.7922284, 0.1440552, -1.265706, 0.7450981, 1, 0, 1,
-0.7903805, -1.766863, -3.564332, 0.7411765, 1, 0, 1,
-0.7891387, 1.243222, -1.894989, 0.7333333, 1, 0, 1,
-0.786358, -0.4702413, -2.786131, 0.7294118, 1, 0, 1,
-0.7742959, 0.4548653, 0.8275248, 0.7215686, 1, 0, 1,
-0.7722945, -1.38456, -3.576116, 0.7176471, 1, 0, 1,
-0.770085, 0.7318177, 0.1703272, 0.7098039, 1, 0, 1,
-0.7575626, 1.613788, -0.05660466, 0.7058824, 1, 0, 1,
-0.7566229, -0.7443969, -3.532204, 0.6980392, 1, 0, 1,
-0.749393, -0.03203239, -3.060851, 0.6901961, 1, 0, 1,
-0.7479237, -0.9755881, -2.450511, 0.6862745, 1, 0, 1,
-0.7421852, -1.779231, -4.297051, 0.6784314, 1, 0, 1,
-0.73983, -1.058215, -4.505064, 0.6745098, 1, 0, 1,
-0.7334177, -1.009633, -2.221754, 0.6666667, 1, 0, 1,
-0.7306927, 0.7715369, -0.3620389, 0.6627451, 1, 0, 1,
-0.729889, 1.301236, -0.5921845, 0.654902, 1, 0, 1,
-0.7281677, -0.3074946, -2.53782, 0.6509804, 1, 0, 1,
-0.7267687, -0.4457939, -1.734599, 0.6431373, 1, 0, 1,
-0.7261861, 0.8191531, -1.261869, 0.6392157, 1, 0, 1,
-0.7253035, -0.2497147, 0.2360408, 0.6313726, 1, 0, 1,
-0.7247947, -0.2747097, -3.113414, 0.627451, 1, 0, 1,
-0.7246002, 0.5946249, -1.722147, 0.6196079, 1, 0, 1,
-0.7177876, -0.6585332, -2.553995, 0.6156863, 1, 0, 1,
-0.715412, 0.7276368, 0.06493086, 0.6078432, 1, 0, 1,
-0.7151489, 0.622825, 0.2837808, 0.6039216, 1, 0, 1,
-0.7148133, 0.647383, -1.499967, 0.5960785, 1, 0, 1,
-0.7099985, 0.9335885, 0.2558281, 0.5882353, 1, 0, 1,
-0.7087029, -1.212713, -3.753075, 0.5843138, 1, 0, 1,
-0.7081088, -1.001287, -3.014119, 0.5764706, 1, 0, 1,
-0.6893727, 0.9652374, 0.2969908, 0.572549, 1, 0, 1,
-0.6871398, 0.1225946, -1.96576, 0.5647059, 1, 0, 1,
-0.6823508, -2.329609, -4.666596, 0.5607843, 1, 0, 1,
-0.6800008, -1.283884, -1.559914, 0.5529412, 1, 0, 1,
-0.6797132, 1.346536, 2.073203, 0.5490196, 1, 0, 1,
-0.6748397, 0.1766646, -0.3449728, 0.5411765, 1, 0, 1,
-0.6691606, 0.7946029, -2.64946, 0.5372549, 1, 0, 1,
-0.6689209, -2.357213, -4.604843, 0.5294118, 1, 0, 1,
-0.6669748, 0.7132686, -0.9971801, 0.5254902, 1, 0, 1,
-0.6632305, -1.879904, -3.098738, 0.5176471, 1, 0, 1,
-0.6625725, 1.961683, 0.07025567, 0.5137255, 1, 0, 1,
-0.6625583, 0.1647859, -0.8864294, 0.5058824, 1, 0, 1,
-0.6604338, 0.3353249, -1.22018, 0.5019608, 1, 0, 1,
-0.6571234, -0.4553113, -2.248348, 0.4941176, 1, 0, 1,
-0.6550581, -2.437957, -0.9256162, 0.4862745, 1, 0, 1,
-0.6542058, -0.07085858, -1.180705, 0.4823529, 1, 0, 1,
-0.6498924, 0.1453775, -1.817506, 0.4745098, 1, 0, 1,
-0.6418844, 2.161044, -0.8533968, 0.4705882, 1, 0, 1,
-0.6339397, -1.610306, -3.142762, 0.4627451, 1, 0, 1,
-0.6297394, -0.1795098, -1.21796, 0.4588235, 1, 0, 1,
-0.6276599, 0.6197003, -1.031322, 0.4509804, 1, 0, 1,
-0.623834, 1.719643, 0.124844, 0.4470588, 1, 0, 1,
-0.6200082, -2.148115, -3.068058, 0.4392157, 1, 0, 1,
-0.6157586, -1.535176, -2.372849, 0.4352941, 1, 0, 1,
-0.6089068, -0.6607564, -3.59695, 0.427451, 1, 0, 1,
-0.6073403, 0.7133425, -0.5250208, 0.4235294, 1, 0, 1,
-0.6061688, -0.1659201, -1.252844, 0.4156863, 1, 0, 1,
-0.5973287, -0.7681352, -2.205721, 0.4117647, 1, 0, 1,
-0.5971838, 0.7290034, -0.7516019, 0.4039216, 1, 0, 1,
-0.584765, 0.9858089, 1.104887, 0.3960784, 1, 0, 1,
-0.5832109, 0.003626585, -3.711898, 0.3921569, 1, 0, 1,
-0.5675661, -0.8845874, -3.158901, 0.3843137, 1, 0, 1,
-0.5666821, -0.4772017, -1.834205, 0.3803922, 1, 0, 1,
-0.564509, -0.4359635, -2.772071, 0.372549, 1, 0, 1,
-0.5578036, -0.5909494, -2.837128, 0.3686275, 1, 0, 1,
-0.5539931, -0.7974904, -2.497836, 0.3607843, 1, 0, 1,
-0.5494964, -1.39362, -4.532101, 0.3568628, 1, 0, 1,
-0.5490057, -0.5776417, -0.6616209, 0.3490196, 1, 0, 1,
-0.5419293, -0.06725752, -0.4929705, 0.345098, 1, 0, 1,
-0.5359802, -0.0801082, -2.013543, 0.3372549, 1, 0, 1,
-0.5350421, 0.7451074, -0.8083032, 0.3333333, 1, 0, 1,
-0.5304561, -1.234429, -3.570419, 0.3254902, 1, 0, 1,
-0.5303614, -0.5127503, -2.922057, 0.3215686, 1, 0, 1,
-0.5230654, 0.0353443, -0.1024428, 0.3137255, 1, 0, 1,
-0.5220848, 0.06909129, -1.920973, 0.3098039, 1, 0, 1,
-0.5150294, -0.9621896, -1.113906, 0.3019608, 1, 0, 1,
-0.5145445, -2.040155, -1.364341, 0.2941177, 1, 0, 1,
-0.5103375, -0.04046401, -0.3277499, 0.2901961, 1, 0, 1,
-0.5055127, 0.398121, -1.93554, 0.282353, 1, 0, 1,
-0.4914172, 0.046432, -1.039911, 0.2784314, 1, 0, 1,
-0.4879379, -0.5141819, -3.77823, 0.2705882, 1, 0, 1,
-0.4861805, -0.7294809, -1.415991, 0.2666667, 1, 0, 1,
-0.4846524, -0.3070227, -2.927537, 0.2588235, 1, 0, 1,
-0.4815871, 1.133295, -1.811718, 0.254902, 1, 0, 1,
-0.4733936, -2.6261, -2.604455, 0.2470588, 1, 0, 1,
-0.4662046, 1.411398, 0.13835, 0.2431373, 1, 0, 1,
-0.4649449, 0.9638845, -1.092315, 0.2352941, 1, 0, 1,
-0.4599459, 1.263301, -0.7875702, 0.2313726, 1, 0, 1,
-0.4594406, 0.7845522, -1.417224, 0.2235294, 1, 0, 1,
-0.453547, 0.5265726, 0.03606736, 0.2196078, 1, 0, 1,
-0.4534455, -1.229509, -3.450428, 0.2117647, 1, 0, 1,
-0.4507118, 0.8042744, -0.4548191, 0.2078431, 1, 0, 1,
-0.4501197, 1.269259, 1.549399, 0.2, 1, 0, 1,
-0.4440629, -1.195743, -0.704959, 0.1921569, 1, 0, 1,
-0.438123, -1.406952, -2.001524, 0.1882353, 1, 0, 1,
-0.4317642, 0.0006255773, -0.6590984, 0.1803922, 1, 0, 1,
-0.4282521, 1.513793, -1.224331, 0.1764706, 1, 0, 1,
-0.4277456, -0.5189404, -0.849774, 0.1686275, 1, 0, 1,
-0.423672, 1.50192, 0.5619235, 0.1647059, 1, 0, 1,
-0.4217362, 0.9808973, -1.329038, 0.1568628, 1, 0, 1,
-0.4181385, -0.2310456, -1.940292, 0.1529412, 1, 0, 1,
-0.4164523, -0.60356, -2.879385, 0.145098, 1, 0, 1,
-0.4163568, 0.1515451, 0.1540145, 0.1411765, 1, 0, 1,
-0.4145766, 0.1299985, -2.363554, 0.1333333, 1, 0, 1,
-0.4132218, 0.03371122, -0.8238751, 0.1294118, 1, 0, 1,
-0.4130176, 0.05674803, -2.107949, 0.1215686, 1, 0, 1,
-0.4127758, 1.535551, -0.5153641, 0.1176471, 1, 0, 1,
-0.4123978, 0.6794915, 0.3103306, 0.1098039, 1, 0, 1,
-0.412394, -0.7141216, -2.855152, 0.1058824, 1, 0, 1,
-0.4057731, 0.3952215, 0.1220892, 0.09803922, 1, 0, 1,
-0.4044223, -0.4454494, -2.452511, 0.09019608, 1, 0, 1,
-0.4030078, -0.2535698, -2.904346, 0.08627451, 1, 0, 1,
-0.394265, 0.7437517, -1.86913, 0.07843138, 1, 0, 1,
-0.3907609, -0.4235643, -3.535591, 0.07450981, 1, 0, 1,
-0.3787268, 1.271009, 2.966108, 0.06666667, 1, 0, 1,
-0.377709, -0.2420361, -2.279542, 0.0627451, 1, 0, 1,
-0.3752589, 0.2720354, -1.452857, 0.05490196, 1, 0, 1,
-0.3725598, -0.07812744, -1.901916, 0.05098039, 1, 0, 1,
-0.3723473, 1.451017, 0.5247548, 0.04313726, 1, 0, 1,
-0.37162, -0.2755372, -1.080842, 0.03921569, 1, 0, 1,
-0.3657891, 0.2935571, 0.1207667, 0.03137255, 1, 0, 1,
-0.3604816, -0.6363229, -2.044206, 0.02745098, 1, 0, 1,
-0.3566909, -0.351204, -2.910749, 0.01960784, 1, 0, 1,
-0.3537461, 0.5746412, -1.250575, 0.01568628, 1, 0, 1,
-0.3530537, -1.280819, -2.119476, 0.007843138, 1, 0, 1,
-0.3454633, -0.09223524, -1.096515, 0.003921569, 1, 0, 1,
-0.3444195, -0.7818993, -2.200907, 0, 1, 0.003921569, 1,
-0.3410113, -1.802083, -1.782408, 0, 1, 0.01176471, 1,
-0.3393525, -0.4875129, -2.16435, 0, 1, 0.01568628, 1,
-0.3392155, -0.4864504, -1.879365, 0, 1, 0.02352941, 1,
-0.3339869, -0.8580546, -3.805606, 0, 1, 0.02745098, 1,
-0.3296274, 0.05843162, -2.444302, 0, 1, 0.03529412, 1,
-0.3292117, 0.8878816, -0.4492752, 0, 1, 0.03921569, 1,
-0.3291264, -2.115988, -3.319109, 0, 1, 0.04705882, 1,
-0.3279917, 0.2101099, -0.8122898, 0, 1, 0.05098039, 1,
-0.3268577, -1.434654, -3.187893, 0, 1, 0.05882353, 1,
-0.3268459, 0.5746213, -1.240455, 0, 1, 0.0627451, 1,
-0.3255514, 0.6538789, -1.568165, 0, 1, 0.07058824, 1,
-0.3233382, 0.3350947, 0.1636921, 0, 1, 0.07450981, 1,
-0.323172, 0.8341027, -0.3448697, 0, 1, 0.08235294, 1,
-0.3214801, -0.8713607, -1.866835, 0, 1, 0.08627451, 1,
-0.3201913, 1.966616, -0.3575517, 0, 1, 0.09411765, 1,
-0.3155866, 1.568203, -2.13893, 0, 1, 0.1019608, 1,
-0.3154474, -2.096781, -4.183281, 0, 1, 0.1058824, 1,
-0.3145414, 0.616656, -1.217323, 0, 1, 0.1137255, 1,
-0.3144321, -1.687779, -3.172565, 0, 1, 0.1176471, 1,
-0.3122646, -0.2686746, -1.181382, 0, 1, 0.1254902, 1,
-0.3057446, -1.059147, -3.046581, 0, 1, 0.1294118, 1,
-0.3042879, 0.1880738, -1.593718, 0, 1, 0.1372549, 1,
-0.3006324, 0.8614519, 0.7972849, 0, 1, 0.1411765, 1,
-0.2979431, 0.3976551, -1.800079, 0, 1, 0.1490196, 1,
-0.2941796, 0.9002072, -0.1055064, 0, 1, 0.1529412, 1,
-0.2931193, -0.8991125, -2.458457, 0, 1, 0.1607843, 1,
-0.292881, 0.3150254, -0.509433, 0, 1, 0.1647059, 1,
-0.2917831, -1.13268, -3.121539, 0, 1, 0.172549, 1,
-0.2917037, -1.01094, -4.706752, 0, 1, 0.1764706, 1,
-0.2900418, -0.06464528, -1.301814, 0, 1, 0.1843137, 1,
-0.2890681, 1.162187, -0.5844452, 0, 1, 0.1882353, 1,
-0.2883804, 2.16389, 0.2160201, 0, 1, 0.1960784, 1,
-0.2868558, 1.378042, 0.3555671, 0, 1, 0.2039216, 1,
-0.285273, -0.874099, -2.801285, 0, 1, 0.2078431, 1,
-0.2835596, -0.7643369, -2.973352, 0, 1, 0.2156863, 1,
-0.2825379, -0.4182797, -1.084127, 0, 1, 0.2196078, 1,
-0.2676474, 0.7679561, -0.9347948, 0, 1, 0.227451, 1,
-0.2665662, -1.398281, -2.822671, 0, 1, 0.2313726, 1,
-0.2650245, 0.3344545, -1.005413, 0, 1, 0.2392157, 1,
-0.2642703, -0.4172324, -3.163553, 0, 1, 0.2431373, 1,
-0.2617117, -0.2561852, -3.725615, 0, 1, 0.2509804, 1,
-0.2541795, 1.069436, -0.94608, 0, 1, 0.254902, 1,
-0.2531279, 0.566148, 0.07594403, 0, 1, 0.2627451, 1,
-0.2525001, -0.1679352, -1.596881, 0, 1, 0.2666667, 1,
-0.2512269, -1.332677, -2.397922, 0, 1, 0.2745098, 1,
-0.2492635, 0.07010996, -2.484955, 0, 1, 0.2784314, 1,
-0.2477428, 1.872182, 1.544078, 0, 1, 0.2862745, 1,
-0.2464481, -1.690828, -2.061046, 0, 1, 0.2901961, 1,
-0.2391604, -1.092748, -2.896538, 0, 1, 0.2980392, 1,
-0.238852, 1.641291, -0.04869631, 0, 1, 0.3058824, 1,
-0.2363104, 0.4646472, 0.4684575, 0, 1, 0.3098039, 1,
-0.233742, 2.137537, 0.2815369, 0, 1, 0.3176471, 1,
-0.2262544, -0.2592193, -3.724221, 0, 1, 0.3215686, 1,
-0.2245206, 0.1082353, -0.5516997, 0, 1, 0.3294118, 1,
-0.2199268, -0.7730065, -3.460125, 0, 1, 0.3333333, 1,
-0.217274, 1.963253, -3.406137, 0, 1, 0.3411765, 1,
-0.2169691, 1.946513, 0.5851249, 0, 1, 0.345098, 1,
-0.2145975, -0.4582029, -2.948885, 0, 1, 0.3529412, 1,
-0.2126663, 0.3350934, -1.78127, 0, 1, 0.3568628, 1,
-0.2058543, 1.01411, 0.04427889, 0, 1, 0.3647059, 1,
-0.1870959, -0.3724459, -1.088243, 0, 1, 0.3686275, 1,
-0.1862852, 0.01167546, -1.99574, 0, 1, 0.3764706, 1,
-0.1856952, -0.8197559, -2.64809, 0, 1, 0.3803922, 1,
-0.1853482, 0.3392519, -1.795935, 0, 1, 0.3882353, 1,
-0.1817347, -0.1002043, -2.907553, 0, 1, 0.3921569, 1,
-0.1813331, -0.9730842, -3.040701, 0, 1, 0.4, 1,
-0.1794852, -0.09101957, -0.270085, 0, 1, 0.4078431, 1,
-0.1782425, -0.9535381, -3.944638, 0, 1, 0.4117647, 1,
-0.1777279, 0.6301995, 1.57278, 0, 1, 0.4196078, 1,
-0.1760724, 0.2141875, -0.7921514, 0, 1, 0.4235294, 1,
-0.1753807, 0.4719356, 0.4778453, 0, 1, 0.4313726, 1,
-0.1690801, 1.24968, -1.471786, 0, 1, 0.4352941, 1,
-0.1686132, -1.232652, -1.865654, 0, 1, 0.4431373, 1,
-0.1615559, -2.523033, -3.360298, 0, 1, 0.4470588, 1,
-0.1611101, 1.630421, 0.3859793, 0, 1, 0.454902, 1,
-0.1597117, 2.680917, -0.4021229, 0, 1, 0.4588235, 1,
-0.1593699, -0.84098, -2.254007, 0, 1, 0.4666667, 1,
-0.1567432, -0.639603, -1.222314, 0, 1, 0.4705882, 1,
-0.1554977, -0.2647066, -2.409714, 0, 1, 0.4784314, 1,
-0.1535923, -1.519342, -3.125354, 0, 1, 0.4823529, 1,
-0.1514864, 1.044065, 1.825354, 0, 1, 0.4901961, 1,
-0.1481511, 0.482368, -1.215743, 0, 1, 0.4941176, 1,
-0.1461423, 0.1801431, -0.2365201, 0, 1, 0.5019608, 1,
-0.1447259, -0.8191423, -3.473716, 0, 1, 0.509804, 1,
-0.1440919, 1.219304, -2.648001, 0, 1, 0.5137255, 1,
-0.1433593, 0.459165, 0.3205979, 0, 1, 0.5215687, 1,
-0.1429162, 0.01618724, -1.593004, 0, 1, 0.5254902, 1,
-0.14193, 1.054124, 2.393682, 0, 1, 0.5333334, 1,
-0.1413316, 0.1505377, 1.06092, 0, 1, 0.5372549, 1,
-0.1409099, 1.09072, -0.5231176, 0, 1, 0.5450981, 1,
-0.1398202, 0.2341333, 0.6865385, 0, 1, 0.5490196, 1,
-0.1312714, 0.6106339, -1.979555, 0, 1, 0.5568628, 1,
-0.1173128, -1.648492, -2.588596, 0, 1, 0.5607843, 1,
-0.1166799, 0.4878997, 1.125906, 0, 1, 0.5686275, 1,
-0.1093938, -0.2025726, -2.568725, 0, 1, 0.572549, 1,
-0.1086434, 0.7840533, 0.9849117, 0, 1, 0.5803922, 1,
-0.1064686, -0.9447544, -2.598263, 0, 1, 0.5843138, 1,
-0.1038444, 1.43871, -0.7456548, 0, 1, 0.5921569, 1,
-0.100129, -0.1452859, -3.359151, 0, 1, 0.5960785, 1,
-0.09943451, -2.137949, -1.58176, 0, 1, 0.6039216, 1,
-0.09582179, -0.3428631, -1.718518, 0, 1, 0.6117647, 1,
-0.0924692, -0.6766401, -1.215368, 0, 1, 0.6156863, 1,
-0.08957951, -0.7889687, -2.03755, 0, 1, 0.6235294, 1,
-0.08846365, -1.718048, -4.231273, 0, 1, 0.627451, 1,
-0.08735285, -0.2864451, -4.689884, 0, 1, 0.6352941, 1,
-0.07953371, 0.7561325, 0.817977, 0, 1, 0.6392157, 1,
-0.07869615, -2.186091, -2.931641, 0, 1, 0.6470588, 1,
-0.07450655, -0.9746431, -2.647239, 0, 1, 0.6509804, 1,
-0.07129795, -1.422712, -3.141649, 0, 1, 0.6588235, 1,
-0.06686765, 1.28587, -0.1906399, 0, 1, 0.6627451, 1,
-0.0621553, 0.02574425, -0.08014832, 0, 1, 0.6705883, 1,
-0.0598182, -2.714259, -2.888302, 0, 1, 0.6745098, 1,
-0.05610562, -1.253909, -1.502795, 0, 1, 0.682353, 1,
-0.05425468, 0.2285643, -0.1488107, 0, 1, 0.6862745, 1,
-0.05053977, 0.6669674, 0.3515839, 0, 1, 0.6941177, 1,
-0.04396777, -2.376938, -2.016074, 0, 1, 0.7019608, 1,
-0.0435255, 0.06793246, -1.449559, 0, 1, 0.7058824, 1,
-0.03794181, 0.9273496, 0.1710723, 0, 1, 0.7137255, 1,
-0.03732891, 0.4486706, 1.901361, 0, 1, 0.7176471, 1,
-0.03569575, 0.1525778, 0.8303472, 0, 1, 0.7254902, 1,
-0.02986407, 0.4297304, -0.2350738, 0, 1, 0.7294118, 1,
-0.0178006, -2.087819, -1.888459, 0, 1, 0.7372549, 1,
-0.01469922, 0.2841846, 1.129251, 0, 1, 0.7411765, 1,
-0.01349485, 0.5820889, 0.2903484, 0, 1, 0.7490196, 1,
-0.00822497, 0.5971351, -0.01616057, 0, 1, 0.7529412, 1,
-0.007794454, -0.5006814, -2.539659, 0, 1, 0.7607843, 1,
-0.006787293, 0.3940731, -0.1913722, 0, 1, 0.7647059, 1,
0.0006089315, -1.699529, 4.335504, 0, 1, 0.772549, 1,
0.002559485, 0.9207888, 1.358479, 0, 1, 0.7764706, 1,
0.002898604, -0.5719537, 4.037515, 0, 1, 0.7843137, 1,
0.003925691, 1.355358, 0.6407923, 0, 1, 0.7882353, 1,
0.004428034, 0.2094157, -1.259696, 0, 1, 0.7960784, 1,
0.005407071, 0.02067202, 0.8331042, 0, 1, 0.8039216, 1,
0.007660232, 0.7608702, -0.4406932, 0, 1, 0.8078431, 1,
0.009912117, 0.450844, -0.1351675, 0, 1, 0.8156863, 1,
0.01081779, 1.389719, -2.095359, 0, 1, 0.8196079, 1,
0.01592259, -1.142783, 2.748909, 0, 1, 0.827451, 1,
0.01610866, -0.315667, 3.370684, 0, 1, 0.8313726, 1,
0.02183349, -1.401613, 4.873749, 0, 1, 0.8392157, 1,
0.02264522, -1.83535, 2.60439, 0, 1, 0.8431373, 1,
0.02279539, 0.1943127, -1.716222, 0, 1, 0.8509804, 1,
0.02413648, 0.5190272, 1.744428, 0, 1, 0.854902, 1,
0.02536491, -1.18679, 2.953491, 0, 1, 0.8627451, 1,
0.02557962, 0.6661999, 0.4897666, 0, 1, 0.8666667, 1,
0.02975689, -1.17302, 3.319387, 0, 1, 0.8745098, 1,
0.03765614, 0.8518333, -0.6909565, 0, 1, 0.8784314, 1,
0.03834612, -0.2225688, 3.357862, 0, 1, 0.8862745, 1,
0.03983587, 1.409941, -0.004991764, 0, 1, 0.8901961, 1,
0.04112747, -1.271923, 4.766551, 0, 1, 0.8980392, 1,
0.04143076, 0.161466, 0.822932, 0, 1, 0.9058824, 1,
0.04223593, 0.6522319, 0.6709861, 0, 1, 0.9098039, 1,
0.0428464, 0.9417197, 1.696532, 0, 1, 0.9176471, 1,
0.04488942, 0.6623818, -0.4095323, 0, 1, 0.9215686, 1,
0.04671338, -0.145925, 1.416069, 0, 1, 0.9294118, 1,
0.0475608, -0.9301402, 3.213333, 0, 1, 0.9333333, 1,
0.04839591, -0.197937, 3.674245, 0, 1, 0.9411765, 1,
0.05411838, -0.3792922, 3.368244, 0, 1, 0.945098, 1,
0.06890442, -0.8721092, 4.101531, 0, 1, 0.9529412, 1,
0.07106666, 1.078682, -0.8567971, 0, 1, 0.9568627, 1,
0.07135651, -0.6498219, 2.911845, 0, 1, 0.9647059, 1,
0.07199595, 1.241395, 0.3149461, 0, 1, 0.9686275, 1,
0.07234887, 0.2093918, 1.060966, 0, 1, 0.9764706, 1,
0.07337414, -0.3921182, 3.385227, 0, 1, 0.9803922, 1,
0.07522641, 1.719039, 0.4054733, 0, 1, 0.9882353, 1,
0.07636955, 0.911521, 0.05951178, 0, 1, 0.9921569, 1,
0.08336494, -0.656453, 3.753376, 0, 1, 1, 1,
0.08366045, 0.7102926, -0.5206915, 0, 0.9921569, 1, 1,
0.08431462, -0.9890084, 4.046629, 0, 0.9882353, 1, 1,
0.08544548, -0.2382614, 2.606667, 0, 0.9803922, 1, 1,
0.09040743, 0.7105663, -0.82113, 0, 0.9764706, 1, 1,
0.09157408, -0.4002614, 3.042015, 0, 0.9686275, 1, 1,
0.09177318, 0.1442923, 0.6184457, 0, 0.9647059, 1, 1,
0.09192597, 0.1836716, 0.9381249, 0, 0.9568627, 1, 1,
0.09272853, -0.4742306, 3.893929, 0, 0.9529412, 1, 1,
0.09316075, 0.327081, 0.200415, 0, 0.945098, 1, 1,
0.09783519, 0.1851549, 0.8918309, 0, 0.9411765, 1, 1,
0.1029559, -0.3018515, 2.600826, 0, 0.9333333, 1, 1,
0.1029975, -0.8515092, 3.537986, 0, 0.9294118, 1, 1,
0.1062805, 0.5801992, 0.09319912, 0, 0.9215686, 1, 1,
0.108088, 0.5142549, 0.9588206, 0, 0.9176471, 1, 1,
0.1103932, -0.6486051, 3.127908, 0, 0.9098039, 1, 1,
0.1113014, 0.5170285, 3.008695, 0, 0.9058824, 1, 1,
0.1127609, 0.6746671, 0.7079223, 0, 0.8980392, 1, 1,
0.113745, -1.370418, 2.871132, 0, 0.8901961, 1, 1,
0.1173024, -1.178814, 5.159418, 0, 0.8862745, 1, 1,
0.1192806, 0.7760254, 0.7877046, 0, 0.8784314, 1, 1,
0.1246541, 0.2051732, 1.037146, 0, 0.8745098, 1, 1,
0.126847, 0.8467416, 0.4197856, 0, 0.8666667, 1, 1,
0.1337712, 0.04663082, 1.802883, 0, 0.8627451, 1, 1,
0.1349233, 0.3891632, -1.03925, 0, 0.854902, 1, 1,
0.136699, -1.120218, 3.080631, 0, 0.8509804, 1, 1,
0.1393953, -1.755418, 2.732109, 0, 0.8431373, 1, 1,
0.1416136, 2.018465, -0.6174016, 0, 0.8392157, 1, 1,
0.1435435, -0.2365778, 2.740139, 0, 0.8313726, 1, 1,
0.1476275, -0.3422939, 2.405067, 0, 0.827451, 1, 1,
0.1479747, 0.02605037, 0.9808025, 0, 0.8196079, 1, 1,
0.1555874, -0.8494178, 3.423488, 0, 0.8156863, 1, 1,
0.156081, -0.01155368, 0.4862385, 0, 0.8078431, 1, 1,
0.1565859, 1.835132, -1.310212, 0, 0.8039216, 1, 1,
0.1597537, -0.7478999, 4.66645, 0, 0.7960784, 1, 1,
0.1606639, 0.05179105, -0.7824838, 0, 0.7882353, 1, 1,
0.1616878, 0.5031977, 0.3172469, 0, 0.7843137, 1, 1,
0.1631286, 0.3922944, -1.255382, 0, 0.7764706, 1, 1,
0.1644488, 1.282748, -0.2929129, 0, 0.772549, 1, 1,
0.167632, -0.4642722, 2.20512, 0, 0.7647059, 1, 1,
0.1691918, 0.997934, 0.3732613, 0, 0.7607843, 1, 1,
0.1699557, -0.7551469, 3.131047, 0, 0.7529412, 1, 1,
0.1720892, -0.1493872, 1.375949, 0, 0.7490196, 1, 1,
0.1738698, 0.4013343, -0.7575285, 0, 0.7411765, 1, 1,
0.1763731, 0.1671573, 1.635233, 0, 0.7372549, 1, 1,
0.1767811, 0.9961725, 0.2642918, 0, 0.7294118, 1, 1,
0.1774837, -0.5732683, 4.577056, 0, 0.7254902, 1, 1,
0.1782267, 0.3511387, 1.529899, 0, 0.7176471, 1, 1,
0.17963, -0.6924741, 2.231845, 0, 0.7137255, 1, 1,
0.180984, -0.05195603, 2.687519, 0, 0.7058824, 1, 1,
0.1822381, 1.129357, -1.222554, 0, 0.6980392, 1, 1,
0.1842728, -0.6119884, 3.155259, 0, 0.6941177, 1, 1,
0.1876039, -1.29099, 4.386884, 0, 0.6862745, 1, 1,
0.1918855, -0.9205804, 4.316482, 0, 0.682353, 1, 1,
0.1966822, 0.816395, 1.503953, 0, 0.6745098, 1, 1,
0.2017076, -0.07842822, 2.211417, 0, 0.6705883, 1, 1,
0.202298, -0.1451152, 1.7274, 0, 0.6627451, 1, 1,
0.2083565, 1.218736, 2.52092, 0, 0.6588235, 1, 1,
0.2137541, 0.6056907, 0.6872858, 0, 0.6509804, 1, 1,
0.2148655, 0.4011571, 3.91954, 0, 0.6470588, 1, 1,
0.2190822, -0.3278869, 3.166718, 0, 0.6392157, 1, 1,
0.2212225, 0.6077708, -0.5182405, 0, 0.6352941, 1, 1,
0.2217336, 0.4277877, -1.043965, 0, 0.627451, 1, 1,
0.2242821, 2.027328, -1.826367, 0, 0.6235294, 1, 1,
0.2250209, -0.09330162, 2.463254, 0, 0.6156863, 1, 1,
0.2268826, 0.2560589, 0.1041601, 0, 0.6117647, 1, 1,
0.2296427, 0.4818177, -1.585212, 0, 0.6039216, 1, 1,
0.2311243, 0.7205557, -0.3844593, 0, 0.5960785, 1, 1,
0.2312684, -0.2876613, 1.056045, 0, 0.5921569, 1, 1,
0.2383984, -0.8933681, 4.088193, 0, 0.5843138, 1, 1,
0.2411336, -0.1656877, 1.957785, 0, 0.5803922, 1, 1,
0.2435386, -0.02312695, 1.765678, 0, 0.572549, 1, 1,
0.2485397, -1.653324, 2.683863, 0, 0.5686275, 1, 1,
0.2506616, 1.853508, -1.443273, 0, 0.5607843, 1, 1,
0.2507605, 0.7681921, 0.7773742, 0, 0.5568628, 1, 1,
0.2525963, -2.719055, 2.409648, 0, 0.5490196, 1, 1,
0.2550089, 0.06931853, 2.126832, 0, 0.5450981, 1, 1,
0.255833, 1.078665, -0.1894513, 0, 0.5372549, 1, 1,
0.256812, -0.4929978, 3.281016, 0, 0.5333334, 1, 1,
0.2577825, 0.9466543, 1.316252, 0, 0.5254902, 1, 1,
0.2651205, -0.3808492, 3.632776, 0, 0.5215687, 1, 1,
0.2740553, -2.878235, 2.102988, 0, 0.5137255, 1, 1,
0.2799132, -0.6980296, 4.098643, 0, 0.509804, 1, 1,
0.2844349, 1.436116, -0.4525176, 0, 0.5019608, 1, 1,
0.2853077, 1.985442, 0.6221508, 0, 0.4941176, 1, 1,
0.2854542, 0.005814998, 0.7598746, 0, 0.4901961, 1, 1,
0.2898063, -0.5041848, 2.048673, 0, 0.4823529, 1, 1,
0.2910675, 0.3667917, 1.063002, 0, 0.4784314, 1, 1,
0.2948763, 1.883634, 0.7234098, 0, 0.4705882, 1, 1,
0.2987538, 0.5852435, 1.394339, 0, 0.4666667, 1, 1,
0.3002138, 0.9310666, 2.367446, 0, 0.4588235, 1, 1,
0.3071838, -0.006239961, 2.214558, 0, 0.454902, 1, 1,
0.3151673, -2.699976, 1.565073, 0, 0.4470588, 1, 1,
0.3201222, 0.775843, -1.643312, 0, 0.4431373, 1, 1,
0.3226835, 0.946304, 1.866174, 0, 0.4352941, 1, 1,
0.3261208, 0.1758692, 2.181504, 0, 0.4313726, 1, 1,
0.3268811, 0.04034112, 1.008515, 0, 0.4235294, 1, 1,
0.3302719, 0.8514781, 1.61607, 0, 0.4196078, 1, 1,
0.3345276, -0.4493776, 2.235153, 0, 0.4117647, 1, 1,
0.3376983, -0.2263533, 3.29901, 0, 0.4078431, 1, 1,
0.3386978, 2.399103, -0.5961047, 0, 0.4, 1, 1,
0.3398627, -0.5803921, 1.88709, 0, 0.3921569, 1, 1,
0.3402116, -0.1526625, 3.449389, 0, 0.3882353, 1, 1,
0.3408681, -0.1162892, 1.106764, 0, 0.3803922, 1, 1,
0.3441543, -0.6461227, 2.308864, 0, 0.3764706, 1, 1,
0.34431, -0.72877, 1.697027, 0, 0.3686275, 1, 1,
0.3499733, -1.183731, 1.442896, 0, 0.3647059, 1, 1,
0.3522171, -0.05931161, 0.7217263, 0, 0.3568628, 1, 1,
0.3540921, -1.337381, 3.237426, 0, 0.3529412, 1, 1,
0.3548243, -0.5383864, 3.193916, 0, 0.345098, 1, 1,
0.358074, 0.02341465, 2.437308, 0, 0.3411765, 1, 1,
0.359398, 0.7885801, 0.500126, 0, 0.3333333, 1, 1,
0.3641549, -0.220357, 2.855579, 0, 0.3294118, 1, 1,
0.3684835, 0.7245356, 1.667782, 0, 0.3215686, 1, 1,
0.3733003, -0.6135471, 3.034569, 0, 0.3176471, 1, 1,
0.3744601, 1.168077, 1.248141, 0, 0.3098039, 1, 1,
0.3745437, -0.6635364, 3.017592, 0, 0.3058824, 1, 1,
0.376093, 0.8527938, 1.931996, 0, 0.2980392, 1, 1,
0.3770506, -0.5209844, 2.045516, 0, 0.2901961, 1, 1,
0.377128, 0.5055419, -0.1891951, 0, 0.2862745, 1, 1,
0.3778301, 0.3293061, 1.011991, 0, 0.2784314, 1, 1,
0.3798377, -1.39097, 1.69702, 0, 0.2745098, 1, 1,
0.3806392, -0.2278047, 0.58591, 0, 0.2666667, 1, 1,
0.3808239, 0.5293363, 0.5740635, 0, 0.2627451, 1, 1,
0.3846392, -0.9968168, 3.644981, 0, 0.254902, 1, 1,
0.3869206, -0.1244472, 2.181822, 0, 0.2509804, 1, 1,
0.3902327, -0.804864, 2.086182, 0, 0.2431373, 1, 1,
0.3921006, -1.018427, 2.396268, 0, 0.2392157, 1, 1,
0.3930615, -0.3587249, 3.116169, 0, 0.2313726, 1, 1,
0.3950385, 0.3040886, 2.08851, 0, 0.227451, 1, 1,
0.3951277, 0.4044681, -0.08544527, 0, 0.2196078, 1, 1,
0.3988544, -0.9639807, 3.91306, 0, 0.2156863, 1, 1,
0.4008225, 1.519518, 0.2274805, 0, 0.2078431, 1, 1,
0.4031667, -0.4839087, 2.681725, 0, 0.2039216, 1, 1,
0.4110982, 0.3803732, -0.6703051, 0, 0.1960784, 1, 1,
0.4111756, -0.5848803, 2.643747, 0, 0.1882353, 1, 1,
0.4118266, 0.2697608, 0.06289074, 0, 0.1843137, 1, 1,
0.4143547, 0.2787361, 2.359802, 0, 0.1764706, 1, 1,
0.4150071, 0.489804, 0.9756137, 0, 0.172549, 1, 1,
0.4185235, 0.3452203, 1.898914, 0, 0.1647059, 1, 1,
0.4194266, -0.4528598, 2.516618, 0, 0.1607843, 1, 1,
0.4208963, 0.8387846, -0.8651806, 0, 0.1529412, 1, 1,
0.4209335, 0.05231051, 1.11582, 0, 0.1490196, 1, 1,
0.4225338, 1.065766, -1.474806, 0, 0.1411765, 1, 1,
0.4226587, -0.345623, 3.446213, 0, 0.1372549, 1, 1,
0.4231515, 0.1524778, 1.202509, 0, 0.1294118, 1, 1,
0.4241191, 2.386961, -2.13119, 0, 0.1254902, 1, 1,
0.4262776, 0.8164816, 0.893477, 0, 0.1176471, 1, 1,
0.4273425, 0.1761833, 1.349448, 0, 0.1137255, 1, 1,
0.4290788, -1.091452, 1.786026, 0, 0.1058824, 1, 1,
0.433904, -0.1300183, 2.087229, 0, 0.09803922, 1, 1,
0.4345392, 0.3741942, 0.8068947, 0, 0.09411765, 1, 1,
0.4369452, -2.667623, 2.897451, 0, 0.08627451, 1, 1,
0.4370928, -1.532546, 4.282062, 0, 0.08235294, 1, 1,
0.4403276, 1.692887, -0.434978, 0, 0.07450981, 1, 1,
0.4454125, 0.4742318, 0.6803799, 0, 0.07058824, 1, 1,
0.4472271, 0.5557874, 0.2920898, 0, 0.0627451, 1, 1,
0.4493154, 0.2111731, 2.416878, 0, 0.05882353, 1, 1,
0.4522939, -0.08137156, 0.3913529, 0, 0.05098039, 1, 1,
0.4537522, 1.883334, -0.9345312, 0, 0.04705882, 1, 1,
0.4555418, -2.300442, 2.936578, 0, 0.03921569, 1, 1,
0.4634244, -0.2595839, 2.959687, 0, 0.03529412, 1, 1,
0.4634529, 0.8490413, 2.217747, 0, 0.02745098, 1, 1,
0.4648487, -0.6320963, 2.47873, 0, 0.02352941, 1, 1,
0.4655691, -1.370185, 2.749843, 0, 0.01568628, 1, 1,
0.4665922, 0.3102057, 0.9239629, 0, 0.01176471, 1, 1,
0.4683905, 0.364694, 1.411935, 0, 0.003921569, 1, 1,
0.4706207, 0.4457485, 0.4034285, 0.003921569, 0, 1, 1,
0.4725111, 0.2606801, 0.8097664, 0.007843138, 0, 1, 1,
0.4747434, 1.331774, 1.182081, 0.01568628, 0, 1, 1,
0.4750625, 1.367377, 1.733594, 0.01960784, 0, 1, 1,
0.478643, -0.02441083, 0.8381293, 0.02745098, 0, 1, 1,
0.4885052, -0.3748611, 1.95457, 0.03137255, 0, 1, 1,
0.4927136, 0.4410382, 1.22257, 0.03921569, 0, 1, 1,
0.4938869, 0.7608817, -0.2965594, 0.04313726, 0, 1, 1,
0.4951519, 0.5769508, -0.2912022, 0.05098039, 0, 1, 1,
0.4954374, 1.382235, -0.3946864, 0.05490196, 0, 1, 1,
0.4980847, 0.9135188, 1.115646, 0.0627451, 0, 1, 1,
0.5008627, 0.3620251, 1.420757, 0.06666667, 0, 1, 1,
0.5015242, -0.5065893, 1.81785, 0.07450981, 0, 1, 1,
0.5069813, -0.09035516, 2.04629, 0.07843138, 0, 1, 1,
0.5070647, -0.858109, 2.108376, 0.08627451, 0, 1, 1,
0.5098785, 0.2353938, 0.1855186, 0.09019608, 0, 1, 1,
0.5099739, -2.233154, 2.752028, 0.09803922, 0, 1, 1,
0.51031, -1.767893, 1.270314, 0.1058824, 0, 1, 1,
0.5169572, -1.046042, 3.126753, 0.1098039, 0, 1, 1,
0.5187882, 0.4169219, 0.7408029, 0.1176471, 0, 1, 1,
0.5219136, 1.044778, 1.616616, 0.1215686, 0, 1, 1,
0.5224686, 0.1974508, 0.8467513, 0.1294118, 0, 1, 1,
0.5255196, 0.1863467, 2.147756, 0.1333333, 0, 1, 1,
0.5261409, -1.595498, 3.830353, 0.1411765, 0, 1, 1,
0.5265829, -1.145244, 2.324891, 0.145098, 0, 1, 1,
0.5270278, -1.226966, 1.843569, 0.1529412, 0, 1, 1,
0.5281867, 1.368129, -0.2380304, 0.1568628, 0, 1, 1,
0.5282907, 0.1408946, 0.8850405, 0.1647059, 0, 1, 1,
0.5335236, -1.840693, 5.021247, 0.1686275, 0, 1, 1,
0.5344349, 1.571404, 1.546977, 0.1764706, 0, 1, 1,
0.5353371, 0.0511837, 1.176547, 0.1803922, 0, 1, 1,
0.5361674, 0.2828707, 1.985008, 0.1882353, 0, 1, 1,
0.5428729, 1.789137, -0.961309, 0.1921569, 0, 1, 1,
0.5446856, -1.917772, 3.430954, 0.2, 0, 1, 1,
0.5447016, 1.272564, 0.1834639, 0.2078431, 0, 1, 1,
0.5456474, -0.3008631, 2.46298, 0.2117647, 0, 1, 1,
0.5475339, -0.1187818, 2.421933, 0.2196078, 0, 1, 1,
0.5487223, -2.031114, 3.796826, 0.2235294, 0, 1, 1,
0.5497522, 1.936969, 2.27235, 0.2313726, 0, 1, 1,
0.5637459, 0.2898751, 1.77031, 0.2352941, 0, 1, 1,
0.5676946, 0.001946162, 2.375574, 0.2431373, 0, 1, 1,
0.5693864, 0.9365247, 1.466175, 0.2470588, 0, 1, 1,
0.5757455, -1.165023, 3.200107, 0.254902, 0, 1, 1,
0.5772462, -0.4771388, 0.6231446, 0.2588235, 0, 1, 1,
0.577454, 1.149807, -0.5895381, 0.2666667, 0, 1, 1,
0.5791249, 0.7504515, -0.733824, 0.2705882, 0, 1, 1,
0.5801768, -0.9084366, 1.974465, 0.2784314, 0, 1, 1,
0.5822076, 1.475386, 1.73039, 0.282353, 0, 1, 1,
0.5850436, -1.982369, 5.154729, 0.2901961, 0, 1, 1,
0.5856134, -1.938304, 1.827215, 0.2941177, 0, 1, 1,
0.5867884, 1.238769, 0.5604375, 0.3019608, 0, 1, 1,
0.5944479, 0.02212455, 0.9025792, 0.3098039, 0, 1, 1,
0.5990396, 0.860997, 1.44731, 0.3137255, 0, 1, 1,
0.6016892, 1.487695, 0.2245287, 0.3215686, 0, 1, 1,
0.6061704, 0.3596187, 2.121575, 0.3254902, 0, 1, 1,
0.6071923, 0.2637625, 1.2161, 0.3333333, 0, 1, 1,
0.6104131, 1.518372, 0.7701389, 0.3372549, 0, 1, 1,
0.6118563, -0.3408827, 2.677747, 0.345098, 0, 1, 1,
0.614331, 2.304989, -0.414116, 0.3490196, 0, 1, 1,
0.6166307, 0.7248043, -0.007969974, 0.3568628, 0, 1, 1,
0.6179992, 0.1954927, 3.67893, 0.3607843, 0, 1, 1,
0.6188173, -1.690197, 3.406691, 0.3686275, 0, 1, 1,
0.619401, 0.2583566, -0.5250258, 0.372549, 0, 1, 1,
0.6210416, -0.6372582, 0.9171095, 0.3803922, 0, 1, 1,
0.624742, 0.9004217, 0.8532895, 0.3843137, 0, 1, 1,
0.6306937, 0.3729737, 1.156994, 0.3921569, 0, 1, 1,
0.6323861, 0.8852296, -0.6684158, 0.3960784, 0, 1, 1,
0.6349276, 0.3288808, 0.6808944, 0.4039216, 0, 1, 1,
0.6369712, 1.586314, -0.895528, 0.4117647, 0, 1, 1,
0.6386552, -0.5517192, 3.204859, 0.4156863, 0, 1, 1,
0.6418468, 0.955338, -0.004789513, 0.4235294, 0, 1, 1,
0.6447008, 0.6143651, 1.591505, 0.427451, 0, 1, 1,
0.6453242, 0.5202935, 2.637108, 0.4352941, 0, 1, 1,
0.6488082, -1.360777, 4.19812, 0.4392157, 0, 1, 1,
0.6518019, -0.7203183, 0.3426117, 0.4470588, 0, 1, 1,
0.6528342, -1.249793, 2.580466, 0.4509804, 0, 1, 1,
0.6554408, -1.114549, 2.823161, 0.4588235, 0, 1, 1,
0.6586675, 0.703064, -0.03983177, 0.4627451, 0, 1, 1,
0.6586801, -1.441638, 1.385348, 0.4705882, 0, 1, 1,
0.6633711, 0.6213371, 1.006399, 0.4745098, 0, 1, 1,
0.663932, 0.185394, 1.045239, 0.4823529, 0, 1, 1,
0.6651778, -1.002826, 0.8722025, 0.4862745, 0, 1, 1,
0.6656167, 0.290574, 2.580834, 0.4941176, 0, 1, 1,
0.6668449, -2.241255, 5.583073, 0.5019608, 0, 1, 1,
0.6725528, 1.611208, -1.412563, 0.5058824, 0, 1, 1,
0.6728804, -0.3441218, 2.663462, 0.5137255, 0, 1, 1,
0.672987, 0.2349873, 1.679017, 0.5176471, 0, 1, 1,
0.6793927, 0.6564475, 1.467625, 0.5254902, 0, 1, 1,
0.6843801, -1.60862, 2.651962, 0.5294118, 0, 1, 1,
0.6930757, -0.4103468, 2.631171, 0.5372549, 0, 1, 1,
0.6939651, 0.1669599, 1.572269, 0.5411765, 0, 1, 1,
0.6939735, -1.052781, 2.881535, 0.5490196, 0, 1, 1,
0.694019, 0.2729759, 2.707075, 0.5529412, 0, 1, 1,
0.694827, -0.7523974, 1.064829, 0.5607843, 0, 1, 1,
0.6962476, -0.6406607, 2.834831, 0.5647059, 0, 1, 1,
0.7024953, -1.804355, 2.11797, 0.572549, 0, 1, 1,
0.704727, -0.02971562, 3.284354, 0.5764706, 0, 1, 1,
0.7079689, -0.3726873, 2.925167, 0.5843138, 0, 1, 1,
0.7097389, 1.300297, 0.5627435, 0.5882353, 0, 1, 1,
0.7125243, 1.072625, -0.0457091, 0.5960785, 0, 1, 1,
0.7164283, -0.581156, 1.502017, 0.6039216, 0, 1, 1,
0.7181956, -0.02042462, 0.8731889, 0.6078432, 0, 1, 1,
0.7189009, 0.2447594, 0.5509594, 0.6156863, 0, 1, 1,
0.7255191, 0.3726143, 1.201503, 0.6196079, 0, 1, 1,
0.7266831, 0.1208328, 1.538117, 0.627451, 0, 1, 1,
0.7314224, 0.5122281, 0.5148904, 0.6313726, 0, 1, 1,
0.742029, -1.042048, 2.467466, 0.6392157, 0, 1, 1,
0.7446824, -2.069113, 1.002831, 0.6431373, 0, 1, 1,
0.74958, 2.060694, 0.3772309, 0.6509804, 0, 1, 1,
0.7505068, 1.188961, -0.3618828, 0.654902, 0, 1, 1,
0.7531651, 1.477873, 0.2772383, 0.6627451, 0, 1, 1,
0.7589685, 0.05065662, 0.2835939, 0.6666667, 0, 1, 1,
0.7696514, -0.5089519, 2.864497, 0.6745098, 0, 1, 1,
0.7722471, -0.4782383, 2.311798, 0.6784314, 0, 1, 1,
0.7783923, -0.1702061, 2.593232, 0.6862745, 0, 1, 1,
0.7827295, 1.609453, -0.5391804, 0.6901961, 0, 1, 1,
0.7890317, 1.030383, 0.01112041, 0.6980392, 0, 1, 1,
0.7930917, -0.1742558, 1.795535, 0.7058824, 0, 1, 1,
0.7965237, -0.2471444, 2.523279, 0.7098039, 0, 1, 1,
0.7969292, -0.538967, 1.985407, 0.7176471, 0, 1, 1,
0.8012137, 0.9271656, 0.1031451, 0.7215686, 0, 1, 1,
0.8027472, 0.2205661, 0.4316829, 0.7294118, 0, 1, 1,
0.803191, 1.090969, 0.7186775, 0.7333333, 0, 1, 1,
0.8058262, 0.5282381, 1.114374, 0.7411765, 0, 1, 1,
0.8104219, -1.052364, 3.900699, 0.7450981, 0, 1, 1,
0.8129392, -1.249322, 1.55115, 0.7529412, 0, 1, 1,
0.8141176, -0.6903961, 1.795403, 0.7568628, 0, 1, 1,
0.8150089, 1.384037, 0.1429914, 0.7647059, 0, 1, 1,
0.8169483, -0.9551911, 3.800776, 0.7686275, 0, 1, 1,
0.8174809, -1.099808, 1.873246, 0.7764706, 0, 1, 1,
0.8275941, 1.523736, 0.4076107, 0.7803922, 0, 1, 1,
0.8305437, 0.436583, 0.06640396, 0.7882353, 0, 1, 1,
0.8322563, -0.6656499, 1.689606, 0.7921569, 0, 1, 1,
0.8325587, -0.4021625, 2.578235, 0.8, 0, 1, 1,
0.8347861, -1.720609, 1.754655, 0.8078431, 0, 1, 1,
0.8386895, -1.046012, 1.693058, 0.8117647, 0, 1, 1,
0.8412021, -2.169226, 2.404417, 0.8196079, 0, 1, 1,
0.8438905, -1.769392, 0.7973861, 0.8235294, 0, 1, 1,
0.8492727, 0.3155865, 2.260572, 0.8313726, 0, 1, 1,
0.8630496, -0.1857758, 0.02444291, 0.8352941, 0, 1, 1,
0.864672, 0.1552773, 0.5360396, 0.8431373, 0, 1, 1,
0.8661094, 0.1941642, -0.2879464, 0.8470588, 0, 1, 1,
0.866701, 0.5113442, 1.421583, 0.854902, 0, 1, 1,
0.8826253, 0.5387151, 2.041896, 0.8588235, 0, 1, 1,
0.8837254, 0.5725868, 0.9396437, 0.8666667, 0, 1, 1,
0.8900198, -0.4727977, 3.478734, 0.8705882, 0, 1, 1,
0.8906466, -1.807199, 1.953217, 0.8784314, 0, 1, 1,
0.8986603, 0.1599735, 2.727118, 0.8823529, 0, 1, 1,
0.9039001, -0.2417036, 0.4883466, 0.8901961, 0, 1, 1,
0.9150971, -0.4942756, 2.650529, 0.8941177, 0, 1, 1,
0.9223289, -0.496138, 2.639803, 0.9019608, 0, 1, 1,
0.9224798, 0.263158, -1.393077, 0.9098039, 0, 1, 1,
0.9234474, -0.02726643, 1.132198, 0.9137255, 0, 1, 1,
0.9234966, 0.2298917, 1.605283, 0.9215686, 0, 1, 1,
0.9284117, 0.4909163, 1.618236, 0.9254902, 0, 1, 1,
0.9313948, 0.3719755, 1.31873, 0.9333333, 0, 1, 1,
0.9361044, -0.37881, 5.160685, 0.9372549, 0, 1, 1,
0.9364377, 0.73338, -1.735291, 0.945098, 0, 1, 1,
0.9429184, -0.04116968, 1.1778, 0.9490196, 0, 1, 1,
0.9450575, 0.9448103, 2.012093, 0.9568627, 0, 1, 1,
0.9461995, 1.666809, 2.535848, 0.9607843, 0, 1, 1,
0.9462631, 1.286684, 1.642766, 0.9686275, 0, 1, 1,
0.9481069, -1.468189, 1.697898, 0.972549, 0, 1, 1,
0.9530339, -1.739026, 0.6163498, 0.9803922, 0, 1, 1,
0.9545772, -0.5704057, 3.699712, 0.9843137, 0, 1, 1,
0.9586961, 1.162065, 0.6432818, 0.9921569, 0, 1, 1,
0.961253, -0.7034847, 1.340968, 0.9960784, 0, 1, 1,
0.9642369, -1.145721, 3.412852, 1, 0, 0.9960784, 1,
0.9653035, -0.05391734, 2.10807, 1, 0, 0.9882353, 1,
0.9672831, 2.230325, 0.4441038, 1, 0, 0.9843137, 1,
0.9682704, -2.583964, 2.427468, 1, 0, 0.9764706, 1,
0.9685364, 0.3206552, 1.891392, 1, 0, 0.972549, 1,
0.9691439, 0.3039583, 2.606903, 1, 0, 0.9647059, 1,
0.9692672, -1.299404, 1.204825, 1, 0, 0.9607843, 1,
0.9702703, 1.097525, 2.133857, 1, 0, 0.9529412, 1,
0.970805, -0.5175427, 0.9962513, 1, 0, 0.9490196, 1,
0.9738382, 0.01964505, 1.723505, 1, 0, 0.9411765, 1,
0.9865318, 0.4465252, 2.216698, 1, 0, 0.9372549, 1,
0.986728, 1.45984, 0.6589307, 1, 0, 0.9294118, 1,
0.9897114, -1.48735, 1.90243, 1, 0, 0.9254902, 1,
0.9926598, 0.4068966, 3.445763, 1, 0, 0.9176471, 1,
1.005049, 0.2181686, 1.741194, 1, 0, 0.9137255, 1,
1.008447, 1.084895, 2.622455, 1, 0, 0.9058824, 1,
1.013494, -1.810958, 1.102683, 1, 0, 0.9019608, 1,
1.013556, 0.5602719, -0.08341169, 1, 0, 0.8941177, 1,
1.020535, -0.1298451, 1.075586, 1, 0, 0.8862745, 1,
1.022529, -2.393182, 1.139395, 1, 0, 0.8823529, 1,
1.027828, -0.5077537, -1.103914, 1, 0, 0.8745098, 1,
1.043662, -1.737788, 2.198622, 1, 0, 0.8705882, 1,
1.051475, 0.8326128, 2.06288, 1, 0, 0.8627451, 1,
1.053676, 0.09721407, 1.859443, 1, 0, 0.8588235, 1,
1.062159, 0.2474725, -0.6839315, 1, 0, 0.8509804, 1,
1.067738, -0.7196151, 2.019054, 1, 0, 0.8470588, 1,
1.070612, -0.6106532, 2.024104, 1, 0, 0.8392157, 1,
1.07816, 0.4217807, 2.488642, 1, 0, 0.8352941, 1,
1.081082, 0.7441387, 0.4498481, 1, 0, 0.827451, 1,
1.083086, 0.8949764, 2.162029, 1, 0, 0.8235294, 1,
1.084864, 0.1532149, 2.844297, 1, 0, 0.8156863, 1,
1.094836, 1.025695, -0.2629772, 1, 0, 0.8117647, 1,
1.097834, -0.02757407, 2.902697, 1, 0, 0.8039216, 1,
1.101272, -0.4705954, 1.178386, 1, 0, 0.7960784, 1,
1.108244, 0.3842801, 2.533749, 1, 0, 0.7921569, 1,
1.117094, -0.4398652, 2.039916, 1, 0, 0.7843137, 1,
1.127796, 0.7672858, 1.539489, 1, 0, 0.7803922, 1,
1.132725, 1.047145, 0.8003243, 1, 0, 0.772549, 1,
1.147324, 1.228785, 0.5307313, 1, 0, 0.7686275, 1,
1.181637, 0.7853832, 1.220448, 1, 0, 0.7607843, 1,
1.185805, 0.7063147, 2.124474, 1, 0, 0.7568628, 1,
1.186532, 0.08925983, 0.714641, 1, 0, 0.7490196, 1,
1.186718, 0.9549932, 1.198421, 1, 0, 0.7450981, 1,
1.195145, -1.034098, 2.461046, 1, 0, 0.7372549, 1,
1.200382, 0.3409295, 2.186845, 1, 0, 0.7333333, 1,
1.20657, -1.093035, 2.933784, 1, 0, 0.7254902, 1,
1.210888, -1.887352, 2.407254, 1, 0, 0.7215686, 1,
1.212172, -0.8005076, 2.930036, 1, 0, 0.7137255, 1,
1.21523, -0.53787, 3.887984, 1, 0, 0.7098039, 1,
1.222716, -0.2253034, 3.061332, 1, 0, 0.7019608, 1,
1.22287, 0.3159666, 0.9587783, 1, 0, 0.6941177, 1,
1.227859, -2.22614, 1.798334, 1, 0, 0.6901961, 1,
1.233342, -0.254754, 0.9876859, 1, 0, 0.682353, 1,
1.245205, 0.5324034, -0.6074951, 1, 0, 0.6784314, 1,
1.2475, 0.1316218, -0.1839284, 1, 0, 0.6705883, 1,
1.248918, -1.040773, 1.780525, 1, 0, 0.6666667, 1,
1.26588, -0.4035809, 0.7876182, 1, 0, 0.6588235, 1,
1.276571, -0.7258898, 1.427385, 1, 0, 0.654902, 1,
1.282136, 0.144367, 0.677959, 1, 0, 0.6470588, 1,
1.282423, -1.662483, 0.4405426, 1, 0, 0.6431373, 1,
1.283277, -0.9892253, 2.127971, 1, 0, 0.6352941, 1,
1.288706, -0.4919963, 1.555445, 1, 0, 0.6313726, 1,
1.29035, -0.9032176, 2.369416, 1, 0, 0.6235294, 1,
1.29331, -1.200452, 2.024342, 1, 0, 0.6196079, 1,
1.29364, -0.4755358, 1.149431, 1, 0, 0.6117647, 1,
1.294111, -0.0007389256, 2.313144, 1, 0, 0.6078432, 1,
1.299132, 0.5006695, 0.5290608, 1, 0, 0.6, 1,
1.301153, 0.4848735, 0.4831992, 1, 0, 0.5921569, 1,
1.303602, -0.4746442, 1.931918, 1, 0, 0.5882353, 1,
1.311737, -0.463366, 0.4058336, 1, 0, 0.5803922, 1,
1.317894, 0.1162392, 1.369673, 1, 0, 0.5764706, 1,
1.329268, -0.7977609, 0.8966178, 1, 0, 0.5686275, 1,
1.337789, -1.062033, 2.661683, 1, 0, 0.5647059, 1,
1.356263, 0.9246586, 1.776086, 1, 0, 0.5568628, 1,
1.364595, -0.5316217, 1.076914, 1, 0, 0.5529412, 1,
1.366242, -1.533442, 2.425989, 1, 0, 0.5450981, 1,
1.381418, 0.4301052, 0.5619184, 1, 0, 0.5411765, 1,
1.384447, 1.059698, 2.399317, 1, 0, 0.5333334, 1,
1.384774, 1.672893, 1.288148, 1, 0, 0.5294118, 1,
1.387039, 2.248821, 0.8703146, 1, 0, 0.5215687, 1,
1.390246, -1.54283, 2.973031, 1, 0, 0.5176471, 1,
1.393761, 0.87427, 1.440429, 1, 0, 0.509804, 1,
1.402872, 0.2153127, 0.7519126, 1, 0, 0.5058824, 1,
1.406569, -0.5511913, 4.019072, 1, 0, 0.4980392, 1,
1.407086, -0.6597477, 2.481612, 1, 0, 0.4901961, 1,
1.407525, -0.8035347, 3.011933, 1, 0, 0.4862745, 1,
1.407579, 0.2702935, 3.340205, 1, 0, 0.4784314, 1,
1.410003, -0.6093447, 1.646201, 1, 0, 0.4745098, 1,
1.414885, -0.1425833, 2.504842, 1, 0, 0.4666667, 1,
1.435499, 0.2153697, 1.546763, 1, 0, 0.4627451, 1,
1.447981, 1.709623, -1.653212, 1, 0, 0.454902, 1,
1.449819, 1.339707, 1.491757, 1, 0, 0.4509804, 1,
1.450858, -1.178878, 2.63267, 1, 0, 0.4431373, 1,
1.456067, 0.1807692, 2.639348, 1, 0, 0.4392157, 1,
1.464976, 0.7544788, 2.254332, 1, 0, 0.4313726, 1,
1.469213, -0.5977983, 1.674964, 1, 0, 0.427451, 1,
1.471601, 0.3694495, -0.3644172, 1, 0, 0.4196078, 1,
1.488122, -0.7368347, 2.951263, 1, 0, 0.4156863, 1,
1.49214, 0.1040302, 1.333409, 1, 0, 0.4078431, 1,
1.495732, 0.3328953, 0.5393052, 1, 0, 0.4039216, 1,
1.501313, 0.2304868, 1.309119, 1, 0, 0.3960784, 1,
1.509594, -1.185882, 2.324438, 1, 0, 0.3882353, 1,
1.512171, 0.2009008, 1.414601, 1, 0, 0.3843137, 1,
1.534206, -0.03651656, 1.880244, 1, 0, 0.3764706, 1,
1.541952, 2.20538, 0.7241031, 1, 0, 0.372549, 1,
1.547714, 0.877162, -0.7715277, 1, 0, 0.3647059, 1,
1.548972, -0.9150971, 1.714282, 1, 0, 0.3607843, 1,
1.557627, 0.1899416, 0.2960314, 1, 0, 0.3529412, 1,
1.566075, 1.707154, -0.4930612, 1, 0, 0.3490196, 1,
1.56689, 0.120266, 1.358639, 1, 0, 0.3411765, 1,
1.580524, -1.643208, 4.272172, 1, 0, 0.3372549, 1,
1.594401, 1.366641, 1.383498, 1, 0, 0.3294118, 1,
1.599424, -1.320636, 3.82514, 1, 0, 0.3254902, 1,
1.600133, 0.4634554, 1.278722, 1, 0, 0.3176471, 1,
1.606558, -0.460933, 3.13956, 1, 0, 0.3137255, 1,
1.627385, -0.9225189, 1.790099, 1, 0, 0.3058824, 1,
1.628356, -0.5745707, 2.291459, 1, 0, 0.2980392, 1,
1.653391, 0.3191136, 1.55331, 1, 0, 0.2941177, 1,
1.662937, 1.211314, 1.175777, 1, 0, 0.2862745, 1,
1.671394, -1.890278, 3.023116, 1, 0, 0.282353, 1,
1.6744, -1.800022, 3.568339, 1, 0, 0.2745098, 1,
1.677775, 1.795898, -0.2064008, 1, 0, 0.2705882, 1,
1.678008, -0.1606492, 1.020255, 1, 0, 0.2627451, 1,
1.681985, 1.0447, -0.1372354, 1, 0, 0.2588235, 1,
1.692901, 1.653839, -0.3171841, 1, 0, 0.2509804, 1,
1.706901, 0.2744219, 3.309856, 1, 0, 0.2470588, 1,
1.71151, 0.7120895, -0.2580589, 1, 0, 0.2392157, 1,
1.715082, -1.094462, 1.411948, 1, 0, 0.2352941, 1,
1.71639, -1.87728, 2.738071, 1, 0, 0.227451, 1,
1.717918, 0.1426132, 1.058004, 1, 0, 0.2235294, 1,
1.72217, 0.02356536, -0.3559016, 1, 0, 0.2156863, 1,
1.727483, 0.2807721, 0.493507, 1, 0, 0.2117647, 1,
1.728022, 0.5412391, 1.41491, 1, 0, 0.2039216, 1,
1.757602, 0.9605349, -0.5759254, 1, 0, 0.1960784, 1,
1.770665, -0.1069581, 3.200067, 1, 0, 0.1921569, 1,
1.774057, 2.062816, 1.681802, 1, 0, 0.1843137, 1,
1.78652, 2.334129, 0.001297324, 1, 0, 0.1803922, 1,
1.805935, 1.591857, 0.9074656, 1, 0, 0.172549, 1,
1.822595, -1.238019, 2.331302, 1, 0, 0.1686275, 1,
1.82344, -0.3114528, 2.679075, 1, 0, 0.1607843, 1,
1.849068, -0.06229329, 0.8311843, 1, 0, 0.1568628, 1,
1.865624, 0.6250069, -0.5318763, 1, 0, 0.1490196, 1,
1.867995, -0.09492619, 1.110097, 1, 0, 0.145098, 1,
1.888963, -0.1847773, -0.4370228, 1, 0, 0.1372549, 1,
1.902088, 0.3902376, 3.286321, 1, 0, 0.1333333, 1,
1.914857, -0.6610064, 1.740775, 1, 0, 0.1254902, 1,
1.934673, -0.09554002, 0.8898377, 1, 0, 0.1215686, 1,
1.95277, -0.2364447, -0.1527354, 1, 0, 0.1137255, 1,
1.976814, -0.6891818, 2.560946, 1, 0, 0.1098039, 1,
2.036809, 0.2760588, 1.270901, 1, 0, 0.1019608, 1,
2.07038, -0.2116853, 0.6453732, 1, 0, 0.09411765, 1,
2.070968, 0.1781895, -1.220614, 1, 0, 0.09019608, 1,
2.08042, 0.007547322, 2.816856, 1, 0, 0.08235294, 1,
2.0887, -2.982633, -0.005592763, 1, 0, 0.07843138, 1,
2.099789, 0.4846965, 0.2704392, 1, 0, 0.07058824, 1,
2.129546, 1.899099, 1.704557, 1, 0, 0.06666667, 1,
2.130261, -1.668571, 1.81381, 1, 0, 0.05882353, 1,
2.144838, 1.4196, -0.3617009, 1, 0, 0.05490196, 1,
2.190873, 1.639163, -1.222361, 1, 0, 0.04705882, 1,
2.207822, 0.2337303, 2.234354, 1, 0, 0.04313726, 1,
2.534956, -1.425398, 1.893259, 1, 0, 0.03529412, 1,
2.539579, 0.04353712, 1.419628, 1, 0, 0.03137255, 1,
2.682993, -0.7679548, 2.294216, 1, 0, 0.02352941, 1,
2.98471, 0.2319157, 2.058182, 1, 0, 0.01960784, 1,
3.031664, -0.497316, 2.466554, 1, 0, 0.01176471, 1,
3.357343, 1.037796, 0.8718342, 1, 0, 0.007843138, 1
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
0.1347238, -3.94465, -6.783652, 0, -0.5, 0.5, 0.5,
0.1347238, -3.94465, -6.783652, 1, -0.5, 0.5, 0.5,
0.1347238, -3.94465, -6.783652, 1, 1.5, 0.5, 0.5,
0.1347238, -3.94465, -6.783652, 0, 1.5, 0.5, 0.5
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
-4.180364, -0.1448243, -6.783652, 0, -0.5, 0.5, 0.5,
-4.180364, -0.1448243, -6.783652, 1, -0.5, 0.5, 0.5,
-4.180364, -0.1448243, -6.783652, 1, 1.5, 0.5, 0.5,
-4.180364, -0.1448243, -6.783652, 0, 1.5, 0.5, 0.5
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
-4.180364, -3.94465, 0.2958879, 0, -0.5, 0.5, 0.5,
-4.180364, -3.94465, 0.2958879, 1, -0.5, 0.5, 0.5,
-4.180364, -3.94465, 0.2958879, 1, 1.5, 0.5, 0.5,
-4.180364, -3.94465, 0.2958879, 0, 1.5, 0.5, 0.5
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
-3, -3.067767, -5.149912,
3, -3.067767, -5.149912,
-3, -3.067767, -5.149912,
-3, -3.213914, -5.422202,
-2, -3.067767, -5.149912,
-2, -3.213914, -5.422202,
-1, -3.067767, -5.149912,
-1, -3.213914, -5.422202,
0, -3.067767, -5.149912,
0, -3.213914, -5.422202,
1, -3.067767, -5.149912,
1, -3.213914, -5.422202,
2, -3.067767, -5.149912,
2, -3.213914, -5.422202,
3, -3.067767, -5.149912,
3, -3.213914, -5.422202
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
-3, -3.506208, -5.966783, 0, -0.5, 0.5, 0.5,
-3, -3.506208, -5.966783, 1, -0.5, 0.5, 0.5,
-3, -3.506208, -5.966783, 1, 1.5, 0.5, 0.5,
-3, -3.506208, -5.966783, 0, 1.5, 0.5, 0.5,
-2, -3.506208, -5.966783, 0, -0.5, 0.5, 0.5,
-2, -3.506208, -5.966783, 1, -0.5, 0.5, 0.5,
-2, -3.506208, -5.966783, 1, 1.5, 0.5, 0.5,
-2, -3.506208, -5.966783, 0, 1.5, 0.5, 0.5,
-1, -3.506208, -5.966783, 0, -0.5, 0.5, 0.5,
-1, -3.506208, -5.966783, 1, -0.5, 0.5, 0.5,
-1, -3.506208, -5.966783, 1, 1.5, 0.5, 0.5,
-1, -3.506208, -5.966783, 0, 1.5, 0.5, 0.5,
0, -3.506208, -5.966783, 0, -0.5, 0.5, 0.5,
0, -3.506208, -5.966783, 1, -0.5, 0.5, 0.5,
0, -3.506208, -5.966783, 1, 1.5, 0.5, 0.5,
0, -3.506208, -5.966783, 0, 1.5, 0.5, 0.5,
1, -3.506208, -5.966783, 0, -0.5, 0.5, 0.5,
1, -3.506208, -5.966783, 1, -0.5, 0.5, 0.5,
1, -3.506208, -5.966783, 1, 1.5, 0.5, 0.5,
1, -3.506208, -5.966783, 0, 1.5, 0.5, 0.5,
2, -3.506208, -5.966783, 0, -0.5, 0.5, 0.5,
2, -3.506208, -5.966783, 1, -0.5, 0.5, 0.5,
2, -3.506208, -5.966783, 1, 1.5, 0.5, 0.5,
2, -3.506208, -5.966783, 0, 1.5, 0.5, 0.5,
3, -3.506208, -5.966783, 0, -0.5, 0.5, 0.5,
3, -3.506208, -5.966783, 1, -0.5, 0.5, 0.5,
3, -3.506208, -5.966783, 1, 1.5, 0.5, 0.5,
3, -3.506208, -5.966783, 0, 1.5, 0.5, 0.5
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
-3.184574, -2, -5.149912,
-3.184574, 2, -5.149912,
-3.184574, -2, -5.149912,
-3.350539, -2, -5.422202,
-3.184574, -1, -5.149912,
-3.350539, -1, -5.422202,
-3.184574, 0, -5.149912,
-3.350539, 0, -5.422202,
-3.184574, 1, -5.149912,
-3.350539, 1, -5.422202,
-3.184574, 2, -5.149912,
-3.350539, 2, -5.422202
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
-3.682469, -2, -5.966783, 0, -0.5, 0.5, 0.5,
-3.682469, -2, -5.966783, 1, -0.5, 0.5, 0.5,
-3.682469, -2, -5.966783, 1, 1.5, 0.5, 0.5,
-3.682469, -2, -5.966783, 0, 1.5, 0.5, 0.5,
-3.682469, -1, -5.966783, 0, -0.5, 0.5, 0.5,
-3.682469, -1, -5.966783, 1, -0.5, 0.5, 0.5,
-3.682469, -1, -5.966783, 1, 1.5, 0.5, 0.5,
-3.682469, -1, -5.966783, 0, 1.5, 0.5, 0.5,
-3.682469, 0, -5.966783, 0, -0.5, 0.5, 0.5,
-3.682469, 0, -5.966783, 1, -0.5, 0.5, 0.5,
-3.682469, 0, -5.966783, 1, 1.5, 0.5, 0.5,
-3.682469, 0, -5.966783, 0, 1.5, 0.5, 0.5,
-3.682469, 1, -5.966783, 0, -0.5, 0.5, 0.5,
-3.682469, 1, -5.966783, 1, -0.5, 0.5, 0.5,
-3.682469, 1, -5.966783, 1, 1.5, 0.5, 0.5,
-3.682469, 1, -5.966783, 0, 1.5, 0.5, 0.5,
-3.682469, 2, -5.966783, 0, -0.5, 0.5, 0.5,
-3.682469, 2, -5.966783, 1, -0.5, 0.5, 0.5,
-3.682469, 2, -5.966783, 1, 1.5, 0.5, 0.5,
-3.682469, 2, -5.966783, 0, 1.5, 0.5, 0.5
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
-3.184574, -3.067767, -4,
-3.184574, -3.067767, 4,
-3.184574, -3.067767, -4,
-3.350539, -3.213914, -4,
-3.184574, -3.067767, -2,
-3.350539, -3.213914, -2,
-3.184574, -3.067767, 0,
-3.350539, -3.213914, 0,
-3.184574, -3.067767, 2,
-3.350539, -3.213914, 2,
-3.184574, -3.067767, 4,
-3.350539, -3.213914, 4
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
-3.682469, -3.506208, -4, 0, -0.5, 0.5, 0.5,
-3.682469, -3.506208, -4, 1, -0.5, 0.5, 0.5,
-3.682469, -3.506208, -4, 1, 1.5, 0.5, 0.5,
-3.682469, -3.506208, -4, 0, 1.5, 0.5, 0.5,
-3.682469, -3.506208, -2, 0, -0.5, 0.5, 0.5,
-3.682469, -3.506208, -2, 1, -0.5, 0.5, 0.5,
-3.682469, -3.506208, -2, 1, 1.5, 0.5, 0.5,
-3.682469, -3.506208, -2, 0, 1.5, 0.5, 0.5,
-3.682469, -3.506208, 0, 0, -0.5, 0.5, 0.5,
-3.682469, -3.506208, 0, 1, -0.5, 0.5, 0.5,
-3.682469, -3.506208, 0, 1, 1.5, 0.5, 0.5,
-3.682469, -3.506208, 0, 0, 1.5, 0.5, 0.5,
-3.682469, -3.506208, 2, 0, -0.5, 0.5, 0.5,
-3.682469, -3.506208, 2, 1, -0.5, 0.5, 0.5,
-3.682469, -3.506208, 2, 1, 1.5, 0.5, 0.5,
-3.682469, -3.506208, 2, 0, 1.5, 0.5, 0.5,
-3.682469, -3.506208, 4, 0, -0.5, 0.5, 0.5,
-3.682469, -3.506208, 4, 1, -0.5, 0.5, 0.5,
-3.682469, -3.506208, 4, 1, 1.5, 0.5, 0.5,
-3.682469, -3.506208, 4, 0, 1.5, 0.5, 0.5
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
-3.184574, -3.067767, -5.149912,
-3.184574, 2.778118, -5.149912,
-3.184574, -3.067767, 5.741688,
-3.184574, 2.778118, 5.741688,
-3.184574, -3.067767, -5.149912,
-3.184574, -3.067767, 5.741688,
-3.184574, 2.778118, -5.149912,
-3.184574, 2.778118, 5.741688,
-3.184574, -3.067767, -5.149912,
3.454022, -3.067767, -5.149912,
-3.184574, -3.067767, 5.741688,
3.454022, -3.067767, 5.741688,
-3.184574, 2.778118, -5.149912,
3.454022, 2.778118, -5.149912,
-3.184574, 2.778118, 5.741688,
3.454022, 2.778118, 5.741688,
3.454022, -3.067767, -5.149912,
3.454022, 2.778118, -5.149912,
3.454022, -3.067767, 5.741688,
3.454022, 2.778118, 5.741688,
3.454022, -3.067767, -5.149912,
3.454022, -3.067767, 5.741688,
3.454022, 2.778118, -5.149912,
3.454022, 2.778118, 5.741688
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
var radius = 7.492345;
var distance = 33.33429;
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
mvMatrix.translate( -0.1347238, 0.1448243, -0.2958879 );
mvMatrix.scale( 1.220268, 1.385739, 0.7437723 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.33429);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
inabenfide<-read.table("inabenfide.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-inabenfide$V2
```

```
## Error in eval(expr, envir, enclos): object 'inabenfide' not found
```

```r
y<-inabenfide$V3
```

```
## Error in eval(expr, envir, enclos): object 'inabenfide' not found
```

```r
z<-inabenfide$V4
```

```
## Error in eval(expr, envir, enclos): object 'inabenfide' not found
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
-3.087896, -0.1113025, -0.9370783, 0, 0, 1, 1, 1,
-3.028518, 0.9773142, -1.299941, 1, 0, 0, 1, 1,
-3.027846, 0.0939784, -0.9494266, 1, 0, 0, 1, 1,
-2.841821, 0.5300978, -2.882383, 1, 0, 0, 1, 1,
-2.79671, -0.6651219, -2.072984, 1, 0, 0, 1, 1,
-2.758711, 1.013106, -1.523142, 1, 0, 0, 1, 1,
-2.636435, -0.7865048, -2.827594, 0, 0, 0, 1, 1,
-2.41607, -1.483072, -3.555619, 0, 0, 0, 1, 1,
-2.349691, -0.3676044, -2.607962, 0, 0, 0, 1, 1,
-2.288772, -0.2895021, -1.892549, 0, 0, 0, 1, 1,
-2.279253, -1.694354, -1.416791, 0, 0, 0, 1, 1,
-2.269977, 0.2946769, -1.397009, 0, 0, 0, 1, 1,
-2.261031, 0.376687, -1.968367, 0, 0, 0, 1, 1,
-2.233177, -0.7294052, -1.874091, 1, 1, 1, 1, 1,
-2.220323, 1.259311, -0.5466381, 1, 1, 1, 1, 1,
-2.17421, 0.8194384, -0.9069182, 1, 1, 1, 1, 1,
-2.074531, -0.4216855, -1.279395, 1, 1, 1, 1, 1,
-2.072248, -1.320277, -2.365392, 1, 1, 1, 1, 1,
-2.071643, 2.383191, 1.057332, 1, 1, 1, 1, 1,
-2.045549, -1.25266, -2.38499, 1, 1, 1, 1, 1,
-2.019241, 0.4497753, -0.8285212, 1, 1, 1, 1, 1,
-2.018986, 1.305453, -0.9418007, 1, 1, 1, 1, 1,
-2.018035, 0.1324639, -1.501912, 1, 1, 1, 1, 1,
-2.00296, -1.130324, -4.630364, 1, 1, 1, 1, 1,
-1.964934, 1.285079, -1.278966, 1, 1, 1, 1, 1,
-1.962447, 0.2059981, -0.1328214, 1, 1, 1, 1, 1,
-1.938405, 0.1558937, -2.164509, 1, 1, 1, 1, 1,
-1.937564, -1.957914, -2.763946, 1, 1, 1, 1, 1,
-1.935691, 2.528656, -2.101477, 0, 0, 1, 1, 1,
-1.918741, -0.3992881, -2.450273, 1, 0, 0, 1, 1,
-1.900896, 0.8276168, -1.423085, 1, 0, 0, 1, 1,
-1.890206, -0.6491591, -3.738775, 1, 0, 0, 1, 1,
-1.839504, -1.700786, -3.06649, 1, 0, 0, 1, 1,
-1.790232, -0.2687653, -3.088797, 1, 0, 0, 1, 1,
-1.766598, -0.3877182, -1.526085, 0, 0, 0, 1, 1,
-1.763688, -0.3869363, -2.822454, 0, 0, 0, 1, 1,
-1.752303, -0.02538441, -2.006348, 0, 0, 0, 1, 1,
-1.751985, 0.07644209, -0.5959755, 0, 0, 0, 1, 1,
-1.726392, -1.308162, -2.918603, 0, 0, 0, 1, 1,
-1.708295, 1.165328, -2.413081, 0, 0, 0, 1, 1,
-1.693681, -1.084328, -3.073698, 0, 0, 0, 1, 1,
-1.692475, 0.544801, -1.553811, 1, 1, 1, 1, 1,
-1.682296, -0.1638041, -2.553853, 1, 1, 1, 1, 1,
-1.673605, -1.369307, -3.846432, 1, 1, 1, 1, 1,
-1.665416, 0.0001241777, -1.705608, 1, 1, 1, 1, 1,
-1.663588, 1.575573, -1.22127, 1, 1, 1, 1, 1,
-1.649882, 0.0487025, -0.9422455, 1, 1, 1, 1, 1,
-1.649371, -0.3201542, -2.28818, 1, 1, 1, 1, 1,
-1.647179, -0.5581269, -1.926697, 1, 1, 1, 1, 1,
-1.627512, -0.5189306, -0.2331244, 1, 1, 1, 1, 1,
-1.626201, -0.7017701, -1.605816, 1, 1, 1, 1, 1,
-1.626021, 0.4636399, -1.643081, 1, 1, 1, 1, 1,
-1.61882, -1.795067, -4.368098, 1, 1, 1, 1, 1,
-1.616022, -1.525185, -1.813547, 1, 1, 1, 1, 1,
-1.613309, 1.267814, -0.5501473, 1, 1, 1, 1, 1,
-1.593568, -1.302398, -2.248715, 1, 1, 1, 1, 1,
-1.588377, -2.150244, -1.926398, 0, 0, 1, 1, 1,
-1.577365, -1.187959, -2.554827, 1, 0, 0, 1, 1,
-1.568582, 1.215673, -0.3471487, 1, 0, 0, 1, 1,
-1.560842, -0.690232, -2.857629, 1, 0, 0, 1, 1,
-1.555105, 1.416678, -0.3928974, 1, 0, 0, 1, 1,
-1.554379, -0.02441034, -0.5702382, 1, 0, 0, 1, 1,
-1.540861, 0.170397, -4.122927, 0, 0, 0, 1, 1,
-1.528728, -2.107083, -2.129552, 0, 0, 0, 1, 1,
-1.525856, -0.0170237, -1.450802, 0, 0, 0, 1, 1,
-1.525053, 0.4747833, -1.600656, 0, 0, 0, 1, 1,
-1.518915, 0.4761219, 0.2284263, 0, 0, 0, 1, 1,
-1.511566, 0.6120331, -1.467088, 0, 0, 0, 1, 1,
-1.509168, -0.4851106, -1.762631, 0, 0, 0, 1, 1,
-1.508851, 1.095263, -1.912096, 1, 1, 1, 1, 1,
-1.500481, -0.8346311, -0.06692137, 1, 1, 1, 1, 1,
-1.491571, 1.32596, -1.184447, 1, 1, 1, 1, 1,
-1.487537, -0.393536, 0.2334987, 1, 1, 1, 1, 1,
-1.468626, 0.5029069, -1.976745, 1, 1, 1, 1, 1,
-1.467216, 0.7149987, -0.8673452, 1, 1, 1, 1, 1,
-1.457933, 0.5109296, -1.50394, 1, 1, 1, 1, 1,
-1.443679, 1.286874, -1.136977, 1, 1, 1, 1, 1,
-1.440674, 2.692984, -0.9093077, 1, 1, 1, 1, 1,
-1.427224, -2.157661, -2.676016, 1, 1, 1, 1, 1,
-1.41996, 1.076566, -1.928109, 1, 1, 1, 1, 1,
-1.419139, 0.5598364, -1.810129, 1, 1, 1, 1, 1,
-1.417705, -1.709091, -2.544638, 1, 1, 1, 1, 1,
-1.415037, -1.369739, -2.031755, 1, 1, 1, 1, 1,
-1.405202, 0.9897282, 1.380424, 1, 1, 1, 1, 1,
-1.402762, 0.1723523, -1.115591, 0, 0, 1, 1, 1,
-1.392446, 1.362303, -1.562694, 1, 0, 0, 1, 1,
-1.388494, 0.9118461, -1.852125, 1, 0, 0, 1, 1,
-1.38805, -1.016876, -2.768351, 1, 0, 0, 1, 1,
-1.386911, -1.450668, -3.220112, 1, 0, 0, 1, 1,
-1.382175, -0.2860973, -2.432341, 1, 0, 0, 1, 1,
-1.381196, -0.296441, -1.653531, 0, 0, 0, 1, 1,
-1.375969, -0.1855846, -1.952975, 0, 0, 0, 1, 1,
-1.366003, -0.2104608, -0.6501088, 0, 0, 0, 1, 1,
-1.361703, -0.1395772, -1.577764, 0, 0, 0, 1, 1,
-1.356003, 0.6009617, -0.4406724, 0, 0, 0, 1, 1,
-1.344556, 0.6029683, -0.7212955, 0, 0, 0, 1, 1,
-1.341112, -0.04662744, -1.874825, 0, 0, 0, 1, 1,
-1.338951, -1.777728, -1.458156, 1, 1, 1, 1, 1,
-1.315082, -1.149496, -2.371127, 1, 1, 1, 1, 1,
-1.309474, -0.7179673, -1.077898, 1, 1, 1, 1, 1,
-1.308021, 1.437096, -3.294996, 1, 1, 1, 1, 1,
-1.301859, 0.8069725, 0.4963769, 1, 1, 1, 1, 1,
-1.301217, 0.4100012, -2.995599, 1, 1, 1, 1, 1,
-1.299834, -0.5300531, -1.719865, 1, 1, 1, 1, 1,
-1.297847, -0.6458852, -1.354111, 1, 1, 1, 1, 1,
-1.295398, -0.6808047, -1.615798, 1, 1, 1, 1, 1,
-1.29252, 1.45109, 0.7684827, 1, 1, 1, 1, 1,
-1.285246, -0.8260795, -1.782413, 1, 1, 1, 1, 1,
-1.28519, -0.4038138, -3.370188, 1, 1, 1, 1, 1,
-1.283662, 0.1049818, -2.848367, 1, 1, 1, 1, 1,
-1.270423, 0.6228999, -2.200199, 1, 1, 1, 1, 1,
-1.265839, 1.523248, -1.242212, 1, 1, 1, 1, 1,
-1.24908, 0.2878177, -0.1395328, 0, 0, 1, 1, 1,
-1.243004, 0.9205928, -1.571478, 1, 0, 0, 1, 1,
-1.236178, 0.262395, -1.818643, 1, 0, 0, 1, 1,
-1.235794, 0.6440808, -0.1195102, 1, 0, 0, 1, 1,
-1.233526, -0.5282663, -2.441675, 1, 0, 0, 1, 1,
-1.233479, -0.1466361, -0.7673174, 1, 0, 0, 1, 1,
-1.232941, 0.7741746, 1.343235, 0, 0, 0, 1, 1,
-1.227336, 0.9917298, -0.1659386, 0, 0, 0, 1, 1,
-1.215184, 0.7905066, -0.5020366, 0, 0, 0, 1, 1,
-1.209122, -1.792504, -1.789107, 0, 0, 0, 1, 1,
-1.191671, 0.04342182, -0.1627109, 0, 0, 0, 1, 1,
-1.184466, -0.7986622, -1.655935, 0, 0, 0, 1, 1,
-1.184008, 0.8675008, 1.246478, 0, 0, 0, 1, 1,
-1.18384, 0.7857665, -1.62218, 1, 1, 1, 1, 1,
-1.178491, 0.1856861, -0.2495341, 1, 1, 1, 1, 1,
-1.172192, -0.8901324, -0.9293779, 1, 1, 1, 1, 1,
-1.166193, -1.708285, -4.991297, 1, 1, 1, 1, 1,
-1.163262, 0.1379082, -1.431958, 1, 1, 1, 1, 1,
-1.155652, -0.1251679, -0.5851918, 1, 1, 1, 1, 1,
-1.137327, 0.2741183, -1.157001, 1, 1, 1, 1, 1,
-1.132976, 0.1354448, -0.6451345, 1, 1, 1, 1, 1,
-1.132633, 0.4687318, -2.299625, 1, 1, 1, 1, 1,
-1.127788, 0.4518986, -1.001818, 1, 1, 1, 1, 1,
-1.127125, 0.249125, -0.1334615, 1, 1, 1, 1, 1,
-1.120606, -1.122965, -2.570232, 1, 1, 1, 1, 1,
-1.120031, 0.622377, -2.290271, 1, 1, 1, 1, 1,
-1.116948, -0.2614979, -1.881516, 1, 1, 1, 1, 1,
-1.108098, 1.002593, -1.559488, 1, 1, 1, 1, 1,
-1.103725, 0.2676826, -2.594978, 0, 0, 1, 1, 1,
-1.096535, -0.7027485, -1.922008, 1, 0, 0, 1, 1,
-1.094367, -0.4677132, -0.6062132, 1, 0, 0, 1, 1,
-1.092731, -1.00711, -1.834625, 1, 0, 0, 1, 1,
-1.085222, 1.509978, 1.385341, 1, 0, 0, 1, 1,
-1.080968, -0.06559673, -2.876899, 1, 0, 0, 1, 1,
-1.077205, 0.02427893, -1.384095, 0, 0, 0, 1, 1,
-1.076467, -1.143963, -1.997249, 0, 0, 0, 1, 1,
-1.068655, 0.2841808, -1.211446, 0, 0, 0, 1, 1,
-1.063281, 0.6687367, 0.4834462, 0, 0, 0, 1, 1,
-1.062788, 0.1568873, -2.837493, 0, 0, 0, 1, 1,
-1.062074, -0.3852908, -0.3806601, 0, 0, 0, 1, 1,
-1.061544, 1.272267, -1.155512, 0, 0, 0, 1, 1,
-1.059965, -0.9434112, -2.21343, 1, 1, 1, 1, 1,
-1.033148, -0.4316859, -1.936812, 1, 1, 1, 1, 1,
-1.028996, 1.32053, 0.5977933, 1, 1, 1, 1, 1,
-1.023726, -0.5864531, -2.301662, 1, 1, 1, 1, 1,
-1.020681, -0.04078734, -1.275331, 1, 1, 1, 1, 1,
-1.013425, 0.1123999, -1.719249, 1, 1, 1, 1, 1,
-1.006451, -1.334343, -4.355533, 1, 1, 1, 1, 1,
-1.000785, -0.2021246, -1.961751, 1, 1, 1, 1, 1,
-0.9957665, 0.1254692, -0.9844015, 1, 1, 1, 1, 1,
-0.9956086, 0.3679609, -1.640826, 1, 1, 1, 1, 1,
-0.989763, -0.01844325, -2.591506, 1, 1, 1, 1, 1,
-0.9865865, -0.1540385, -2.39852, 1, 1, 1, 1, 1,
-0.9788015, 0.5535984, -0.6582395, 1, 1, 1, 1, 1,
-0.9658877, -0.3261925, -3.520462, 1, 1, 1, 1, 1,
-0.9556794, -0.1891615, -3.061418, 1, 1, 1, 1, 1,
-0.9524173, 0.06262701, -1.475546, 0, 0, 1, 1, 1,
-0.9521291, 0.7376018, -1.257488, 1, 0, 0, 1, 1,
-0.947446, -1.1685, -2.881932, 1, 0, 0, 1, 1,
-0.9392631, -0.1417416, -0.9801591, 1, 0, 0, 1, 1,
-0.9372455, -0.6682907, -1.440943, 1, 0, 0, 1, 1,
-0.936532, 0.3936871, -0.712995, 1, 0, 0, 1, 1,
-0.9358192, -0.438255, -2.309069, 0, 0, 0, 1, 1,
-0.9318804, 2.450883, 1.649777, 0, 0, 0, 1, 1,
-0.9305489, 0.4676453, -1.731861, 0, 0, 0, 1, 1,
-0.925347, 0.9284123, -1.270188, 0, 0, 0, 1, 1,
-0.9229042, -0.8551752, -3.539041, 0, 0, 0, 1, 1,
-0.9226685, 0.870323, 1.160552, 0, 0, 0, 1, 1,
-0.9190629, 0.8875785, -0.1194387, 0, 0, 0, 1, 1,
-0.9120892, 0.6864713, -2.378582, 1, 1, 1, 1, 1,
-0.9006584, 0.2306006, 0.1377627, 1, 1, 1, 1, 1,
-0.8940285, 1.130925, -1.467736, 1, 1, 1, 1, 1,
-0.8934398, -0.5103576, -3.147897, 1, 1, 1, 1, 1,
-0.8894526, 1.243848, 0.08718167, 1, 1, 1, 1, 1,
-0.8714435, -0.3356439, -2.416094, 1, 1, 1, 1, 1,
-0.8674253, -1.289597, -2.069689, 1, 1, 1, 1, 1,
-0.863763, 0.1973471, -1.804614, 1, 1, 1, 1, 1,
-0.8587894, -0.5982314, -3.245013, 1, 1, 1, 1, 1,
-0.8568534, -0.2201251, -3.417203, 1, 1, 1, 1, 1,
-0.8493552, 0.153927, -2.054415, 1, 1, 1, 1, 1,
-0.8459997, -1.556702, -1.581804, 1, 1, 1, 1, 1,
-0.8364035, -1.938877, -3.076629, 1, 1, 1, 1, 1,
-0.8317196, -0.03853219, -0.1682375, 1, 1, 1, 1, 1,
-0.827989, -1.153232, -0.140998, 1, 1, 1, 1, 1,
-0.8263701, 1.080606, 0.01010283, 0, 0, 1, 1, 1,
-0.8212786, -1.089692, -1.164081, 1, 0, 0, 1, 1,
-0.8201329, 0.1545278, -0.8316037, 1, 0, 0, 1, 1,
-0.8195523, 0.5358293, -0.3218936, 1, 0, 0, 1, 1,
-0.8160761, -1.123182, -2.878153, 1, 0, 0, 1, 1,
-0.8155023, 0.1678616, -0.3582128, 1, 0, 0, 1, 1,
-0.8080536, 0.1631394, -1.386155, 0, 0, 0, 1, 1,
-0.8019667, 0.6488916, -2.006165, 0, 0, 0, 1, 1,
-0.8000063, 0.5577077, 0.0107421, 0, 0, 0, 1, 1,
-0.7992697, 0.08385492, -2.778673, 0, 0, 0, 1, 1,
-0.7958807, -0.03892866, -1.712813, 0, 0, 0, 1, 1,
-0.7949951, 0.004332971, -1.549542, 0, 0, 0, 1, 1,
-0.7926903, 0.2962097, -2.259706, 0, 0, 0, 1, 1,
-0.7922284, 0.1440552, -1.265706, 1, 1, 1, 1, 1,
-0.7903805, -1.766863, -3.564332, 1, 1, 1, 1, 1,
-0.7891387, 1.243222, -1.894989, 1, 1, 1, 1, 1,
-0.786358, -0.4702413, -2.786131, 1, 1, 1, 1, 1,
-0.7742959, 0.4548653, 0.8275248, 1, 1, 1, 1, 1,
-0.7722945, -1.38456, -3.576116, 1, 1, 1, 1, 1,
-0.770085, 0.7318177, 0.1703272, 1, 1, 1, 1, 1,
-0.7575626, 1.613788, -0.05660466, 1, 1, 1, 1, 1,
-0.7566229, -0.7443969, -3.532204, 1, 1, 1, 1, 1,
-0.749393, -0.03203239, -3.060851, 1, 1, 1, 1, 1,
-0.7479237, -0.9755881, -2.450511, 1, 1, 1, 1, 1,
-0.7421852, -1.779231, -4.297051, 1, 1, 1, 1, 1,
-0.73983, -1.058215, -4.505064, 1, 1, 1, 1, 1,
-0.7334177, -1.009633, -2.221754, 1, 1, 1, 1, 1,
-0.7306927, 0.7715369, -0.3620389, 1, 1, 1, 1, 1,
-0.729889, 1.301236, -0.5921845, 0, 0, 1, 1, 1,
-0.7281677, -0.3074946, -2.53782, 1, 0, 0, 1, 1,
-0.7267687, -0.4457939, -1.734599, 1, 0, 0, 1, 1,
-0.7261861, 0.8191531, -1.261869, 1, 0, 0, 1, 1,
-0.7253035, -0.2497147, 0.2360408, 1, 0, 0, 1, 1,
-0.7247947, -0.2747097, -3.113414, 1, 0, 0, 1, 1,
-0.7246002, 0.5946249, -1.722147, 0, 0, 0, 1, 1,
-0.7177876, -0.6585332, -2.553995, 0, 0, 0, 1, 1,
-0.715412, 0.7276368, 0.06493086, 0, 0, 0, 1, 1,
-0.7151489, 0.622825, 0.2837808, 0, 0, 0, 1, 1,
-0.7148133, 0.647383, -1.499967, 0, 0, 0, 1, 1,
-0.7099985, 0.9335885, 0.2558281, 0, 0, 0, 1, 1,
-0.7087029, -1.212713, -3.753075, 0, 0, 0, 1, 1,
-0.7081088, -1.001287, -3.014119, 1, 1, 1, 1, 1,
-0.6893727, 0.9652374, 0.2969908, 1, 1, 1, 1, 1,
-0.6871398, 0.1225946, -1.96576, 1, 1, 1, 1, 1,
-0.6823508, -2.329609, -4.666596, 1, 1, 1, 1, 1,
-0.6800008, -1.283884, -1.559914, 1, 1, 1, 1, 1,
-0.6797132, 1.346536, 2.073203, 1, 1, 1, 1, 1,
-0.6748397, 0.1766646, -0.3449728, 1, 1, 1, 1, 1,
-0.6691606, 0.7946029, -2.64946, 1, 1, 1, 1, 1,
-0.6689209, -2.357213, -4.604843, 1, 1, 1, 1, 1,
-0.6669748, 0.7132686, -0.9971801, 1, 1, 1, 1, 1,
-0.6632305, -1.879904, -3.098738, 1, 1, 1, 1, 1,
-0.6625725, 1.961683, 0.07025567, 1, 1, 1, 1, 1,
-0.6625583, 0.1647859, -0.8864294, 1, 1, 1, 1, 1,
-0.6604338, 0.3353249, -1.22018, 1, 1, 1, 1, 1,
-0.6571234, -0.4553113, -2.248348, 1, 1, 1, 1, 1,
-0.6550581, -2.437957, -0.9256162, 0, 0, 1, 1, 1,
-0.6542058, -0.07085858, -1.180705, 1, 0, 0, 1, 1,
-0.6498924, 0.1453775, -1.817506, 1, 0, 0, 1, 1,
-0.6418844, 2.161044, -0.8533968, 1, 0, 0, 1, 1,
-0.6339397, -1.610306, -3.142762, 1, 0, 0, 1, 1,
-0.6297394, -0.1795098, -1.21796, 1, 0, 0, 1, 1,
-0.6276599, 0.6197003, -1.031322, 0, 0, 0, 1, 1,
-0.623834, 1.719643, 0.124844, 0, 0, 0, 1, 1,
-0.6200082, -2.148115, -3.068058, 0, 0, 0, 1, 1,
-0.6157586, -1.535176, -2.372849, 0, 0, 0, 1, 1,
-0.6089068, -0.6607564, -3.59695, 0, 0, 0, 1, 1,
-0.6073403, 0.7133425, -0.5250208, 0, 0, 0, 1, 1,
-0.6061688, -0.1659201, -1.252844, 0, 0, 0, 1, 1,
-0.5973287, -0.7681352, -2.205721, 1, 1, 1, 1, 1,
-0.5971838, 0.7290034, -0.7516019, 1, 1, 1, 1, 1,
-0.584765, 0.9858089, 1.104887, 1, 1, 1, 1, 1,
-0.5832109, 0.003626585, -3.711898, 1, 1, 1, 1, 1,
-0.5675661, -0.8845874, -3.158901, 1, 1, 1, 1, 1,
-0.5666821, -0.4772017, -1.834205, 1, 1, 1, 1, 1,
-0.564509, -0.4359635, -2.772071, 1, 1, 1, 1, 1,
-0.5578036, -0.5909494, -2.837128, 1, 1, 1, 1, 1,
-0.5539931, -0.7974904, -2.497836, 1, 1, 1, 1, 1,
-0.5494964, -1.39362, -4.532101, 1, 1, 1, 1, 1,
-0.5490057, -0.5776417, -0.6616209, 1, 1, 1, 1, 1,
-0.5419293, -0.06725752, -0.4929705, 1, 1, 1, 1, 1,
-0.5359802, -0.0801082, -2.013543, 1, 1, 1, 1, 1,
-0.5350421, 0.7451074, -0.8083032, 1, 1, 1, 1, 1,
-0.5304561, -1.234429, -3.570419, 1, 1, 1, 1, 1,
-0.5303614, -0.5127503, -2.922057, 0, 0, 1, 1, 1,
-0.5230654, 0.0353443, -0.1024428, 1, 0, 0, 1, 1,
-0.5220848, 0.06909129, -1.920973, 1, 0, 0, 1, 1,
-0.5150294, -0.9621896, -1.113906, 1, 0, 0, 1, 1,
-0.5145445, -2.040155, -1.364341, 1, 0, 0, 1, 1,
-0.5103375, -0.04046401, -0.3277499, 1, 0, 0, 1, 1,
-0.5055127, 0.398121, -1.93554, 0, 0, 0, 1, 1,
-0.4914172, 0.046432, -1.039911, 0, 0, 0, 1, 1,
-0.4879379, -0.5141819, -3.77823, 0, 0, 0, 1, 1,
-0.4861805, -0.7294809, -1.415991, 0, 0, 0, 1, 1,
-0.4846524, -0.3070227, -2.927537, 0, 0, 0, 1, 1,
-0.4815871, 1.133295, -1.811718, 0, 0, 0, 1, 1,
-0.4733936, -2.6261, -2.604455, 0, 0, 0, 1, 1,
-0.4662046, 1.411398, 0.13835, 1, 1, 1, 1, 1,
-0.4649449, 0.9638845, -1.092315, 1, 1, 1, 1, 1,
-0.4599459, 1.263301, -0.7875702, 1, 1, 1, 1, 1,
-0.4594406, 0.7845522, -1.417224, 1, 1, 1, 1, 1,
-0.453547, 0.5265726, 0.03606736, 1, 1, 1, 1, 1,
-0.4534455, -1.229509, -3.450428, 1, 1, 1, 1, 1,
-0.4507118, 0.8042744, -0.4548191, 1, 1, 1, 1, 1,
-0.4501197, 1.269259, 1.549399, 1, 1, 1, 1, 1,
-0.4440629, -1.195743, -0.704959, 1, 1, 1, 1, 1,
-0.438123, -1.406952, -2.001524, 1, 1, 1, 1, 1,
-0.4317642, 0.0006255773, -0.6590984, 1, 1, 1, 1, 1,
-0.4282521, 1.513793, -1.224331, 1, 1, 1, 1, 1,
-0.4277456, -0.5189404, -0.849774, 1, 1, 1, 1, 1,
-0.423672, 1.50192, 0.5619235, 1, 1, 1, 1, 1,
-0.4217362, 0.9808973, -1.329038, 1, 1, 1, 1, 1,
-0.4181385, -0.2310456, -1.940292, 0, 0, 1, 1, 1,
-0.4164523, -0.60356, -2.879385, 1, 0, 0, 1, 1,
-0.4163568, 0.1515451, 0.1540145, 1, 0, 0, 1, 1,
-0.4145766, 0.1299985, -2.363554, 1, 0, 0, 1, 1,
-0.4132218, 0.03371122, -0.8238751, 1, 0, 0, 1, 1,
-0.4130176, 0.05674803, -2.107949, 1, 0, 0, 1, 1,
-0.4127758, 1.535551, -0.5153641, 0, 0, 0, 1, 1,
-0.4123978, 0.6794915, 0.3103306, 0, 0, 0, 1, 1,
-0.412394, -0.7141216, -2.855152, 0, 0, 0, 1, 1,
-0.4057731, 0.3952215, 0.1220892, 0, 0, 0, 1, 1,
-0.4044223, -0.4454494, -2.452511, 0, 0, 0, 1, 1,
-0.4030078, -0.2535698, -2.904346, 0, 0, 0, 1, 1,
-0.394265, 0.7437517, -1.86913, 0, 0, 0, 1, 1,
-0.3907609, -0.4235643, -3.535591, 1, 1, 1, 1, 1,
-0.3787268, 1.271009, 2.966108, 1, 1, 1, 1, 1,
-0.377709, -0.2420361, -2.279542, 1, 1, 1, 1, 1,
-0.3752589, 0.2720354, -1.452857, 1, 1, 1, 1, 1,
-0.3725598, -0.07812744, -1.901916, 1, 1, 1, 1, 1,
-0.3723473, 1.451017, 0.5247548, 1, 1, 1, 1, 1,
-0.37162, -0.2755372, -1.080842, 1, 1, 1, 1, 1,
-0.3657891, 0.2935571, 0.1207667, 1, 1, 1, 1, 1,
-0.3604816, -0.6363229, -2.044206, 1, 1, 1, 1, 1,
-0.3566909, -0.351204, -2.910749, 1, 1, 1, 1, 1,
-0.3537461, 0.5746412, -1.250575, 1, 1, 1, 1, 1,
-0.3530537, -1.280819, -2.119476, 1, 1, 1, 1, 1,
-0.3454633, -0.09223524, -1.096515, 1, 1, 1, 1, 1,
-0.3444195, -0.7818993, -2.200907, 1, 1, 1, 1, 1,
-0.3410113, -1.802083, -1.782408, 1, 1, 1, 1, 1,
-0.3393525, -0.4875129, -2.16435, 0, 0, 1, 1, 1,
-0.3392155, -0.4864504, -1.879365, 1, 0, 0, 1, 1,
-0.3339869, -0.8580546, -3.805606, 1, 0, 0, 1, 1,
-0.3296274, 0.05843162, -2.444302, 1, 0, 0, 1, 1,
-0.3292117, 0.8878816, -0.4492752, 1, 0, 0, 1, 1,
-0.3291264, -2.115988, -3.319109, 1, 0, 0, 1, 1,
-0.3279917, 0.2101099, -0.8122898, 0, 0, 0, 1, 1,
-0.3268577, -1.434654, -3.187893, 0, 0, 0, 1, 1,
-0.3268459, 0.5746213, -1.240455, 0, 0, 0, 1, 1,
-0.3255514, 0.6538789, -1.568165, 0, 0, 0, 1, 1,
-0.3233382, 0.3350947, 0.1636921, 0, 0, 0, 1, 1,
-0.323172, 0.8341027, -0.3448697, 0, 0, 0, 1, 1,
-0.3214801, -0.8713607, -1.866835, 0, 0, 0, 1, 1,
-0.3201913, 1.966616, -0.3575517, 1, 1, 1, 1, 1,
-0.3155866, 1.568203, -2.13893, 1, 1, 1, 1, 1,
-0.3154474, -2.096781, -4.183281, 1, 1, 1, 1, 1,
-0.3145414, 0.616656, -1.217323, 1, 1, 1, 1, 1,
-0.3144321, -1.687779, -3.172565, 1, 1, 1, 1, 1,
-0.3122646, -0.2686746, -1.181382, 1, 1, 1, 1, 1,
-0.3057446, -1.059147, -3.046581, 1, 1, 1, 1, 1,
-0.3042879, 0.1880738, -1.593718, 1, 1, 1, 1, 1,
-0.3006324, 0.8614519, 0.7972849, 1, 1, 1, 1, 1,
-0.2979431, 0.3976551, -1.800079, 1, 1, 1, 1, 1,
-0.2941796, 0.9002072, -0.1055064, 1, 1, 1, 1, 1,
-0.2931193, -0.8991125, -2.458457, 1, 1, 1, 1, 1,
-0.292881, 0.3150254, -0.509433, 1, 1, 1, 1, 1,
-0.2917831, -1.13268, -3.121539, 1, 1, 1, 1, 1,
-0.2917037, -1.01094, -4.706752, 1, 1, 1, 1, 1,
-0.2900418, -0.06464528, -1.301814, 0, 0, 1, 1, 1,
-0.2890681, 1.162187, -0.5844452, 1, 0, 0, 1, 1,
-0.2883804, 2.16389, 0.2160201, 1, 0, 0, 1, 1,
-0.2868558, 1.378042, 0.3555671, 1, 0, 0, 1, 1,
-0.285273, -0.874099, -2.801285, 1, 0, 0, 1, 1,
-0.2835596, -0.7643369, -2.973352, 1, 0, 0, 1, 1,
-0.2825379, -0.4182797, -1.084127, 0, 0, 0, 1, 1,
-0.2676474, 0.7679561, -0.9347948, 0, 0, 0, 1, 1,
-0.2665662, -1.398281, -2.822671, 0, 0, 0, 1, 1,
-0.2650245, 0.3344545, -1.005413, 0, 0, 0, 1, 1,
-0.2642703, -0.4172324, -3.163553, 0, 0, 0, 1, 1,
-0.2617117, -0.2561852, -3.725615, 0, 0, 0, 1, 1,
-0.2541795, 1.069436, -0.94608, 0, 0, 0, 1, 1,
-0.2531279, 0.566148, 0.07594403, 1, 1, 1, 1, 1,
-0.2525001, -0.1679352, -1.596881, 1, 1, 1, 1, 1,
-0.2512269, -1.332677, -2.397922, 1, 1, 1, 1, 1,
-0.2492635, 0.07010996, -2.484955, 1, 1, 1, 1, 1,
-0.2477428, 1.872182, 1.544078, 1, 1, 1, 1, 1,
-0.2464481, -1.690828, -2.061046, 1, 1, 1, 1, 1,
-0.2391604, -1.092748, -2.896538, 1, 1, 1, 1, 1,
-0.238852, 1.641291, -0.04869631, 1, 1, 1, 1, 1,
-0.2363104, 0.4646472, 0.4684575, 1, 1, 1, 1, 1,
-0.233742, 2.137537, 0.2815369, 1, 1, 1, 1, 1,
-0.2262544, -0.2592193, -3.724221, 1, 1, 1, 1, 1,
-0.2245206, 0.1082353, -0.5516997, 1, 1, 1, 1, 1,
-0.2199268, -0.7730065, -3.460125, 1, 1, 1, 1, 1,
-0.217274, 1.963253, -3.406137, 1, 1, 1, 1, 1,
-0.2169691, 1.946513, 0.5851249, 1, 1, 1, 1, 1,
-0.2145975, -0.4582029, -2.948885, 0, 0, 1, 1, 1,
-0.2126663, 0.3350934, -1.78127, 1, 0, 0, 1, 1,
-0.2058543, 1.01411, 0.04427889, 1, 0, 0, 1, 1,
-0.1870959, -0.3724459, -1.088243, 1, 0, 0, 1, 1,
-0.1862852, 0.01167546, -1.99574, 1, 0, 0, 1, 1,
-0.1856952, -0.8197559, -2.64809, 1, 0, 0, 1, 1,
-0.1853482, 0.3392519, -1.795935, 0, 0, 0, 1, 1,
-0.1817347, -0.1002043, -2.907553, 0, 0, 0, 1, 1,
-0.1813331, -0.9730842, -3.040701, 0, 0, 0, 1, 1,
-0.1794852, -0.09101957, -0.270085, 0, 0, 0, 1, 1,
-0.1782425, -0.9535381, -3.944638, 0, 0, 0, 1, 1,
-0.1777279, 0.6301995, 1.57278, 0, 0, 0, 1, 1,
-0.1760724, 0.2141875, -0.7921514, 0, 0, 0, 1, 1,
-0.1753807, 0.4719356, 0.4778453, 1, 1, 1, 1, 1,
-0.1690801, 1.24968, -1.471786, 1, 1, 1, 1, 1,
-0.1686132, -1.232652, -1.865654, 1, 1, 1, 1, 1,
-0.1615559, -2.523033, -3.360298, 1, 1, 1, 1, 1,
-0.1611101, 1.630421, 0.3859793, 1, 1, 1, 1, 1,
-0.1597117, 2.680917, -0.4021229, 1, 1, 1, 1, 1,
-0.1593699, -0.84098, -2.254007, 1, 1, 1, 1, 1,
-0.1567432, -0.639603, -1.222314, 1, 1, 1, 1, 1,
-0.1554977, -0.2647066, -2.409714, 1, 1, 1, 1, 1,
-0.1535923, -1.519342, -3.125354, 1, 1, 1, 1, 1,
-0.1514864, 1.044065, 1.825354, 1, 1, 1, 1, 1,
-0.1481511, 0.482368, -1.215743, 1, 1, 1, 1, 1,
-0.1461423, 0.1801431, -0.2365201, 1, 1, 1, 1, 1,
-0.1447259, -0.8191423, -3.473716, 1, 1, 1, 1, 1,
-0.1440919, 1.219304, -2.648001, 1, 1, 1, 1, 1,
-0.1433593, 0.459165, 0.3205979, 0, 0, 1, 1, 1,
-0.1429162, 0.01618724, -1.593004, 1, 0, 0, 1, 1,
-0.14193, 1.054124, 2.393682, 1, 0, 0, 1, 1,
-0.1413316, 0.1505377, 1.06092, 1, 0, 0, 1, 1,
-0.1409099, 1.09072, -0.5231176, 1, 0, 0, 1, 1,
-0.1398202, 0.2341333, 0.6865385, 1, 0, 0, 1, 1,
-0.1312714, 0.6106339, -1.979555, 0, 0, 0, 1, 1,
-0.1173128, -1.648492, -2.588596, 0, 0, 0, 1, 1,
-0.1166799, 0.4878997, 1.125906, 0, 0, 0, 1, 1,
-0.1093938, -0.2025726, -2.568725, 0, 0, 0, 1, 1,
-0.1086434, 0.7840533, 0.9849117, 0, 0, 0, 1, 1,
-0.1064686, -0.9447544, -2.598263, 0, 0, 0, 1, 1,
-0.1038444, 1.43871, -0.7456548, 0, 0, 0, 1, 1,
-0.100129, -0.1452859, -3.359151, 1, 1, 1, 1, 1,
-0.09943451, -2.137949, -1.58176, 1, 1, 1, 1, 1,
-0.09582179, -0.3428631, -1.718518, 1, 1, 1, 1, 1,
-0.0924692, -0.6766401, -1.215368, 1, 1, 1, 1, 1,
-0.08957951, -0.7889687, -2.03755, 1, 1, 1, 1, 1,
-0.08846365, -1.718048, -4.231273, 1, 1, 1, 1, 1,
-0.08735285, -0.2864451, -4.689884, 1, 1, 1, 1, 1,
-0.07953371, 0.7561325, 0.817977, 1, 1, 1, 1, 1,
-0.07869615, -2.186091, -2.931641, 1, 1, 1, 1, 1,
-0.07450655, -0.9746431, -2.647239, 1, 1, 1, 1, 1,
-0.07129795, -1.422712, -3.141649, 1, 1, 1, 1, 1,
-0.06686765, 1.28587, -0.1906399, 1, 1, 1, 1, 1,
-0.0621553, 0.02574425, -0.08014832, 1, 1, 1, 1, 1,
-0.0598182, -2.714259, -2.888302, 1, 1, 1, 1, 1,
-0.05610562, -1.253909, -1.502795, 1, 1, 1, 1, 1,
-0.05425468, 0.2285643, -0.1488107, 0, 0, 1, 1, 1,
-0.05053977, 0.6669674, 0.3515839, 1, 0, 0, 1, 1,
-0.04396777, -2.376938, -2.016074, 1, 0, 0, 1, 1,
-0.0435255, 0.06793246, -1.449559, 1, 0, 0, 1, 1,
-0.03794181, 0.9273496, 0.1710723, 1, 0, 0, 1, 1,
-0.03732891, 0.4486706, 1.901361, 1, 0, 0, 1, 1,
-0.03569575, 0.1525778, 0.8303472, 0, 0, 0, 1, 1,
-0.02986407, 0.4297304, -0.2350738, 0, 0, 0, 1, 1,
-0.0178006, -2.087819, -1.888459, 0, 0, 0, 1, 1,
-0.01469922, 0.2841846, 1.129251, 0, 0, 0, 1, 1,
-0.01349485, 0.5820889, 0.2903484, 0, 0, 0, 1, 1,
-0.00822497, 0.5971351, -0.01616057, 0, 0, 0, 1, 1,
-0.007794454, -0.5006814, -2.539659, 0, 0, 0, 1, 1,
-0.006787293, 0.3940731, -0.1913722, 1, 1, 1, 1, 1,
0.0006089315, -1.699529, 4.335504, 1, 1, 1, 1, 1,
0.002559485, 0.9207888, 1.358479, 1, 1, 1, 1, 1,
0.002898604, -0.5719537, 4.037515, 1, 1, 1, 1, 1,
0.003925691, 1.355358, 0.6407923, 1, 1, 1, 1, 1,
0.004428034, 0.2094157, -1.259696, 1, 1, 1, 1, 1,
0.005407071, 0.02067202, 0.8331042, 1, 1, 1, 1, 1,
0.007660232, 0.7608702, -0.4406932, 1, 1, 1, 1, 1,
0.009912117, 0.450844, -0.1351675, 1, 1, 1, 1, 1,
0.01081779, 1.389719, -2.095359, 1, 1, 1, 1, 1,
0.01592259, -1.142783, 2.748909, 1, 1, 1, 1, 1,
0.01610866, -0.315667, 3.370684, 1, 1, 1, 1, 1,
0.02183349, -1.401613, 4.873749, 1, 1, 1, 1, 1,
0.02264522, -1.83535, 2.60439, 1, 1, 1, 1, 1,
0.02279539, 0.1943127, -1.716222, 1, 1, 1, 1, 1,
0.02413648, 0.5190272, 1.744428, 0, 0, 1, 1, 1,
0.02536491, -1.18679, 2.953491, 1, 0, 0, 1, 1,
0.02557962, 0.6661999, 0.4897666, 1, 0, 0, 1, 1,
0.02975689, -1.17302, 3.319387, 1, 0, 0, 1, 1,
0.03765614, 0.8518333, -0.6909565, 1, 0, 0, 1, 1,
0.03834612, -0.2225688, 3.357862, 1, 0, 0, 1, 1,
0.03983587, 1.409941, -0.004991764, 0, 0, 0, 1, 1,
0.04112747, -1.271923, 4.766551, 0, 0, 0, 1, 1,
0.04143076, 0.161466, 0.822932, 0, 0, 0, 1, 1,
0.04223593, 0.6522319, 0.6709861, 0, 0, 0, 1, 1,
0.0428464, 0.9417197, 1.696532, 0, 0, 0, 1, 1,
0.04488942, 0.6623818, -0.4095323, 0, 0, 0, 1, 1,
0.04671338, -0.145925, 1.416069, 0, 0, 0, 1, 1,
0.0475608, -0.9301402, 3.213333, 1, 1, 1, 1, 1,
0.04839591, -0.197937, 3.674245, 1, 1, 1, 1, 1,
0.05411838, -0.3792922, 3.368244, 1, 1, 1, 1, 1,
0.06890442, -0.8721092, 4.101531, 1, 1, 1, 1, 1,
0.07106666, 1.078682, -0.8567971, 1, 1, 1, 1, 1,
0.07135651, -0.6498219, 2.911845, 1, 1, 1, 1, 1,
0.07199595, 1.241395, 0.3149461, 1, 1, 1, 1, 1,
0.07234887, 0.2093918, 1.060966, 1, 1, 1, 1, 1,
0.07337414, -0.3921182, 3.385227, 1, 1, 1, 1, 1,
0.07522641, 1.719039, 0.4054733, 1, 1, 1, 1, 1,
0.07636955, 0.911521, 0.05951178, 1, 1, 1, 1, 1,
0.08336494, -0.656453, 3.753376, 1, 1, 1, 1, 1,
0.08366045, 0.7102926, -0.5206915, 1, 1, 1, 1, 1,
0.08431462, -0.9890084, 4.046629, 1, 1, 1, 1, 1,
0.08544548, -0.2382614, 2.606667, 1, 1, 1, 1, 1,
0.09040743, 0.7105663, -0.82113, 0, 0, 1, 1, 1,
0.09157408, -0.4002614, 3.042015, 1, 0, 0, 1, 1,
0.09177318, 0.1442923, 0.6184457, 1, 0, 0, 1, 1,
0.09192597, 0.1836716, 0.9381249, 1, 0, 0, 1, 1,
0.09272853, -0.4742306, 3.893929, 1, 0, 0, 1, 1,
0.09316075, 0.327081, 0.200415, 1, 0, 0, 1, 1,
0.09783519, 0.1851549, 0.8918309, 0, 0, 0, 1, 1,
0.1029559, -0.3018515, 2.600826, 0, 0, 0, 1, 1,
0.1029975, -0.8515092, 3.537986, 0, 0, 0, 1, 1,
0.1062805, 0.5801992, 0.09319912, 0, 0, 0, 1, 1,
0.108088, 0.5142549, 0.9588206, 0, 0, 0, 1, 1,
0.1103932, -0.6486051, 3.127908, 0, 0, 0, 1, 1,
0.1113014, 0.5170285, 3.008695, 0, 0, 0, 1, 1,
0.1127609, 0.6746671, 0.7079223, 1, 1, 1, 1, 1,
0.113745, -1.370418, 2.871132, 1, 1, 1, 1, 1,
0.1173024, -1.178814, 5.159418, 1, 1, 1, 1, 1,
0.1192806, 0.7760254, 0.7877046, 1, 1, 1, 1, 1,
0.1246541, 0.2051732, 1.037146, 1, 1, 1, 1, 1,
0.126847, 0.8467416, 0.4197856, 1, 1, 1, 1, 1,
0.1337712, 0.04663082, 1.802883, 1, 1, 1, 1, 1,
0.1349233, 0.3891632, -1.03925, 1, 1, 1, 1, 1,
0.136699, -1.120218, 3.080631, 1, 1, 1, 1, 1,
0.1393953, -1.755418, 2.732109, 1, 1, 1, 1, 1,
0.1416136, 2.018465, -0.6174016, 1, 1, 1, 1, 1,
0.1435435, -0.2365778, 2.740139, 1, 1, 1, 1, 1,
0.1476275, -0.3422939, 2.405067, 1, 1, 1, 1, 1,
0.1479747, 0.02605037, 0.9808025, 1, 1, 1, 1, 1,
0.1555874, -0.8494178, 3.423488, 1, 1, 1, 1, 1,
0.156081, -0.01155368, 0.4862385, 0, 0, 1, 1, 1,
0.1565859, 1.835132, -1.310212, 1, 0, 0, 1, 1,
0.1597537, -0.7478999, 4.66645, 1, 0, 0, 1, 1,
0.1606639, 0.05179105, -0.7824838, 1, 0, 0, 1, 1,
0.1616878, 0.5031977, 0.3172469, 1, 0, 0, 1, 1,
0.1631286, 0.3922944, -1.255382, 1, 0, 0, 1, 1,
0.1644488, 1.282748, -0.2929129, 0, 0, 0, 1, 1,
0.167632, -0.4642722, 2.20512, 0, 0, 0, 1, 1,
0.1691918, 0.997934, 0.3732613, 0, 0, 0, 1, 1,
0.1699557, -0.7551469, 3.131047, 0, 0, 0, 1, 1,
0.1720892, -0.1493872, 1.375949, 0, 0, 0, 1, 1,
0.1738698, 0.4013343, -0.7575285, 0, 0, 0, 1, 1,
0.1763731, 0.1671573, 1.635233, 0, 0, 0, 1, 1,
0.1767811, 0.9961725, 0.2642918, 1, 1, 1, 1, 1,
0.1774837, -0.5732683, 4.577056, 1, 1, 1, 1, 1,
0.1782267, 0.3511387, 1.529899, 1, 1, 1, 1, 1,
0.17963, -0.6924741, 2.231845, 1, 1, 1, 1, 1,
0.180984, -0.05195603, 2.687519, 1, 1, 1, 1, 1,
0.1822381, 1.129357, -1.222554, 1, 1, 1, 1, 1,
0.1842728, -0.6119884, 3.155259, 1, 1, 1, 1, 1,
0.1876039, -1.29099, 4.386884, 1, 1, 1, 1, 1,
0.1918855, -0.9205804, 4.316482, 1, 1, 1, 1, 1,
0.1966822, 0.816395, 1.503953, 1, 1, 1, 1, 1,
0.2017076, -0.07842822, 2.211417, 1, 1, 1, 1, 1,
0.202298, -0.1451152, 1.7274, 1, 1, 1, 1, 1,
0.2083565, 1.218736, 2.52092, 1, 1, 1, 1, 1,
0.2137541, 0.6056907, 0.6872858, 1, 1, 1, 1, 1,
0.2148655, 0.4011571, 3.91954, 1, 1, 1, 1, 1,
0.2190822, -0.3278869, 3.166718, 0, 0, 1, 1, 1,
0.2212225, 0.6077708, -0.5182405, 1, 0, 0, 1, 1,
0.2217336, 0.4277877, -1.043965, 1, 0, 0, 1, 1,
0.2242821, 2.027328, -1.826367, 1, 0, 0, 1, 1,
0.2250209, -0.09330162, 2.463254, 1, 0, 0, 1, 1,
0.2268826, 0.2560589, 0.1041601, 1, 0, 0, 1, 1,
0.2296427, 0.4818177, -1.585212, 0, 0, 0, 1, 1,
0.2311243, 0.7205557, -0.3844593, 0, 0, 0, 1, 1,
0.2312684, -0.2876613, 1.056045, 0, 0, 0, 1, 1,
0.2383984, -0.8933681, 4.088193, 0, 0, 0, 1, 1,
0.2411336, -0.1656877, 1.957785, 0, 0, 0, 1, 1,
0.2435386, -0.02312695, 1.765678, 0, 0, 0, 1, 1,
0.2485397, -1.653324, 2.683863, 0, 0, 0, 1, 1,
0.2506616, 1.853508, -1.443273, 1, 1, 1, 1, 1,
0.2507605, 0.7681921, 0.7773742, 1, 1, 1, 1, 1,
0.2525963, -2.719055, 2.409648, 1, 1, 1, 1, 1,
0.2550089, 0.06931853, 2.126832, 1, 1, 1, 1, 1,
0.255833, 1.078665, -0.1894513, 1, 1, 1, 1, 1,
0.256812, -0.4929978, 3.281016, 1, 1, 1, 1, 1,
0.2577825, 0.9466543, 1.316252, 1, 1, 1, 1, 1,
0.2651205, -0.3808492, 3.632776, 1, 1, 1, 1, 1,
0.2740553, -2.878235, 2.102988, 1, 1, 1, 1, 1,
0.2799132, -0.6980296, 4.098643, 1, 1, 1, 1, 1,
0.2844349, 1.436116, -0.4525176, 1, 1, 1, 1, 1,
0.2853077, 1.985442, 0.6221508, 1, 1, 1, 1, 1,
0.2854542, 0.005814998, 0.7598746, 1, 1, 1, 1, 1,
0.2898063, -0.5041848, 2.048673, 1, 1, 1, 1, 1,
0.2910675, 0.3667917, 1.063002, 1, 1, 1, 1, 1,
0.2948763, 1.883634, 0.7234098, 0, 0, 1, 1, 1,
0.2987538, 0.5852435, 1.394339, 1, 0, 0, 1, 1,
0.3002138, 0.9310666, 2.367446, 1, 0, 0, 1, 1,
0.3071838, -0.006239961, 2.214558, 1, 0, 0, 1, 1,
0.3151673, -2.699976, 1.565073, 1, 0, 0, 1, 1,
0.3201222, 0.775843, -1.643312, 1, 0, 0, 1, 1,
0.3226835, 0.946304, 1.866174, 0, 0, 0, 1, 1,
0.3261208, 0.1758692, 2.181504, 0, 0, 0, 1, 1,
0.3268811, 0.04034112, 1.008515, 0, 0, 0, 1, 1,
0.3302719, 0.8514781, 1.61607, 0, 0, 0, 1, 1,
0.3345276, -0.4493776, 2.235153, 0, 0, 0, 1, 1,
0.3376983, -0.2263533, 3.29901, 0, 0, 0, 1, 1,
0.3386978, 2.399103, -0.5961047, 0, 0, 0, 1, 1,
0.3398627, -0.5803921, 1.88709, 1, 1, 1, 1, 1,
0.3402116, -0.1526625, 3.449389, 1, 1, 1, 1, 1,
0.3408681, -0.1162892, 1.106764, 1, 1, 1, 1, 1,
0.3441543, -0.6461227, 2.308864, 1, 1, 1, 1, 1,
0.34431, -0.72877, 1.697027, 1, 1, 1, 1, 1,
0.3499733, -1.183731, 1.442896, 1, 1, 1, 1, 1,
0.3522171, -0.05931161, 0.7217263, 1, 1, 1, 1, 1,
0.3540921, -1.337381, 3.237426, 1, 1, 1, 1, 1,
0.3548243, -0.5383864, 3.193916, 1, 1, 1, 1, 1,
0.358074, 0.02341465, 2.437308, 1, 1, 1, 1, 1,
0.359398, 0.7885801, 0.500126, 1, 1, 1, 1, 1,
0.3641549, -0.220357, 2.855579, 1, 1, 1, 1, 1,
0.3684835, 0.7245356, 1.667782, 1, 1, 1, 1, 1,
0.3733003, -0.6135471, 3.034569, 1, 1, 1, 1, 1,
0.3744601, 1.168077, 1.248141, 1, 1, 1, 1, 1,
0.3745437, -0.6635364, 3.017592, 0, 0, 1, 1, 1,
0.376093, 0.8527938, 1.931996, 1, 0, 0, 1, 1,
0.3770506, -0.5209844, 2.045516, 1, 0, 0, 1, 1,
0.377128, 0.5055419, -0.1891951, 1, 0, 0, 1, 1,
0.3778301, 0.3293061, 1.011991, 1, 0, 0, 1, 1,
0.3798377, -1.39097, 1.69702, 1, 0, 0, 1, 1,
0.3806392, -0.2278047, 0.58591, 0, 0, 0, 1, 1,
0.3808239, 0.5293363, 0.5740635, 0, 0, 0, 1, 1,
0.3846392, -0.9968168, 3.644981, 0, 0, 0, 1, 1,
0.3869206, -0.1244472, 2.181822, 0, 0, 0, 1, 1,
0.3902327, -0.804864, 2.086182, 0, 0, 0, 1, 1,
0.3921006, -1.018427, 2.396268, 0, 0, 0, 1, 1,
0.3930615, -0.3587249, 3.116169, 0, 0, 0, 1, 1,
0.3950385, 0.3040886, 2.08851, 1, 1, 1, 1, 1,
0.3951277, 0.4044681, -0.08544527, 1, 1, 1, 1, 1,
0.3988544, -0.9639807, 3.91306, 1, 1, 1, 1, 1,
0.4008225, 1.519518, 0.2274805, 1, 1, 1, 1, 1,
0.4031667, -0.4839087, 2.681725, 1, 1, 1, 1, 1,
0.4110982, 0.3803732, -0.6703051, 1, 1, 1, 1, 1,
0.4111756, -0.5848803, 2.643747, 1, 1, 1, 1, 1,
0.4118266, 0.2697608, 0.06289074, 1, 1, 1, 1, 1,
0.4143547, 0.2787361, 2.359802, 1, 1, 1, 1, 1,
0.4150071, 0.489804, 0.9756137, 1, 1, 1, 1, 1,
0.4185235, 0.3452203, 1.898914, 1, 1, 1, 1, 1,
0.4194266, -0.4528598, 2.516618, 1, 1, 1, 1, 1,
0.4208963, 0.8387846, -0.8651806, 1, 1, 1, 1, 1,
0.4209335, 0.05231051, 1.11582, 1, 1, 1, 1, 1,
0.4225338, 1.065766, -1.474806, 1, 1, 1, 1, 1,
0.4226587, -0.345623, 3.446213, 0, 0, 1, 1, 1,
0.4231515, 0.1524778, 1.202509, 1, 0, 0, 1, 1,
0.4241191, 2.386961, -2.13119, 1, 0, 0, 1, 1,
0.4262776, 0.8164816, 0.893477, 1, 0, 0, 1, 1,
0.4273425, 0.1761833, 1.349448, 1, 0, 0, 1, 1,
0.4290788, -1.091452, 1.786026, 1, 0, 0, 1, 1,
0.433904, -0.1300183, 2.087229, 0, 0, 0, 1, 1,
0.4345392, 0.3741942, 0.8068947, 0, 0, 0, 1, 1,
0.4369452, -2.667623, 2.897451, 0, 0, 0, 1, 1,
0.4370928, -1.532546, 4.282062, 0, 0, 0, 1, 1,
0.4403276, 1.692887, -0.434978, 0, 0, 0, 1, 1,
0.4454125, 0.4742318, 0.6803799, 0, 0, 0, 1, 1,
0.4472271, 0.5557874, 0.2920898, 0, 0, 0, 1, 1,
0.4493154, 0.2111731, 2.416878, 1, 1, 1, 1, 1,
0.4522939, -0.08137156, 0.3913529, 1, 1, 1, 1, 1,
0.4537522, 1.883334, -0.9345312, 1, 1, 1, 1, 1,
0.4555418, -2.300442, 2.936578, 1, 1, 1, 1, 1,
0.4634244, -0.2595839, 2.959687, 1, 1, 1, 1, 1,
0.4634529, 0.8490413, 2.217747, 1, 1, 1, 1, 1,
0.4648487, -0.6320963, 2.47873, 1, 1, 1, 1, 1,
0.4655691, -1.370185, 2.749843, 1, 1, 1, 1, 1,
0.4665922, 0.3102057, 0.9239629, 1, 1, 1, 1, 1,
0.4683905, 0.364694, 1.411935, 1, 1, 1, 1, 1,
0.4706207, 0.4457485, 0.4034285, 1, 1, 1, 1, 1,
0.4725111, 0.2606801, 0.8097664, 1, 1, 1, 1, 1,
0.4747434, 1.331774, 1.182081, 1, 1, 1, 1, 1,
0.4750625, 1.367377, 1.733594, 1, 1, 1, 1, 1,
0.478643, -0.02441083, 0.8381293, 1, 1, 1, 1, 1,
0.4885052, -0.3748611, 1.95457, 0, 0, 1, 1, 1,
0.4927136, 0.4410382, 1.22257, 1, 0, 0, 1, 1,
0.4938869, 0.7608817, -0.2965594, 1, 0, 0, 1, 1,
0.4951519, 0.5769508, -0.2912022, 1, 0, 0, 1, 1,
0.4954374, 1.382235, -0.3946864, 1, 0, 0, 1, 1,
0.4980847, 0.9135188, 1.115646, 1, 0, 0, 1, 1,
0.5008627, 0.3620251, 1.420757, 0, 0, 0, 1, 1,
0.5015242, -0.5065893, 1.81785, 0, 0, 0, 1, 1,
0.5069813, -0.09035516, 2.04629, 0, 0, 0, 1, 1,
0.5070647, -0.858109, 2.108376, 0, 0, 0, 1, 1,
0.5098785, 0.2353938, 0.1855186, 0, 0, 0, 1, 1,
0.5099739, -2.233154, 2.752028, 0, 0, 0, 1, 1,
0.51031, -1.767893, 1.270314, 0, 0, 0, 1, 1,
0.5169572, -1.046042, 3.126753, 1, 1, 1, 1, 1,
0.5187882, 0.4169219, 0.7408029, 1, 1, 1, 1, 1,
0.5219136, 1.044778, 1.616616, 1, 1, 1, 1, 1,
0.5224686, 0.1974508, 0.8467513, 1, 1, 1, 1, 1,
0.5255196, 0.1863467, 2.147756, 1, 1, 1, 1, 1,
0.5261409, -1.595498, 3.830353, 1, 1, 1, 1, 1,
0.5265829, -1.145244, 2.324891, 1, 1, 1, 1, 1,
0.5270278, -1.226966, 1.843569, 1, 1, 1, 1, 1,
0.5281867, 1.368129, -0.2380304, 1, 1, 1, 1, 1,
0.5282907, 0.1408946, 0.8850405, 1, 1, 1, 1, 1,
0.5335236, -1.840693, 5.021247, 1, 1, 1, 1, 1,
0.5344349, 1.571404, 1.546977, 1, 1, 1, 1, 1,
0.5353371, 0.0511837, 1.176547, 1, 1, 1, 1, 1,
0.5361674, 0.2828707, 1.985008, 1, 1, 1, 1, 1,
0.5428729, 1.789137, -0.961309, 1, 1, 1, 1, 1,
0.5446856, -1.917772, 3.430954, 0, 0, 1, 1, 1,
0.5447016, 1.272564, 0.1834639, 1, 0, 0, 1, 1,
0.5456474, -0.3008631, 2.46298, 1, 0, 0, 1, 1,
0.5475339, -0.1187818, 2.421933, 1, 0, 0, 1, 1,
0.5487223, -2.031114, 3.796826, 1, 0, 0, 1, 1,
0.5497522, 1.936969, 2.27235, 1, 0, 0, 1, 1,
0.5637459, 0.2898751, 1.77031, 0, 0, 0, 1, 1,
0.5676946, 0.001946162, 2.375574, 0, 0, 0, 1, 1,
0.5693864, 0.9365247, 1.466175, 0, 0, 0, 1, 1,
0.5757455, -1.165023, 3.200107, 0, 0, 0, 1, 1,
0.5772462, -0.4771388, 0.6231446, 0, 0, 0, 1, 1,
0.577454, 1.149807, -0.5895381, 0, 0, 0, 1, 1,
0.5791249, 0.7504515, -0.733824, 0, 0, 0, 1, 1,
0.5801768, -0.9084366, 1.974465, 1, 1, 1, 1, 1,
0.5822076, 1.475386, 1.73039, 1, 1, 1, 1, 1,
0.5850436, -1.982369, 5.154729, 1, 1, 1, 1, 1,
0.5856134, -1.938304, 1.827215, 1, 1, 1, 1, 1,
0.5867884, 1.238769, 0.5604375, 1, 1, 1, 1, 1,
0.5944479, 0.02212455, 0.9025792, 1, 1, 1, 1, 1,
0.5990396, 0.860997, 1.44731, 1, 1, 1, 1, 1,
0.6016892, 1.487695, 0.2245287, 1, 1, 1, 1, 1,
0.6061704, 0.3596187, 2.121575, 1, 1, 1, 1, 1,
0.6071923, 0.2637625, 1.2161, 1, 1, 1, 1, 1,
0.6104131, 1.518372, 0.7701389, 1, 1, 1, 1, 1,
0.6118563, -0.3408827, 2.677747, 1, 1, 1, 1, 1,
0.614331, 2.304989, -0.414116, 1, 1, 1, 1, 1,
0.6166307, 0.7248043, -0.007969974, 1, 1, 1, 1, 1,
0.6179992, 0.1954927, 3.67893, 1, 1, 1, 1, 1,
0.6188173, -1.690197, 3.406691, 0, 0, 1, 1, 1,
0.619401, 0.2583566, -0.5250258, 1, 0, 0, 1, 1,
0.6210416, -0.6372582, 0.9171095, 1, 0, 0, 1, 1,
0.624742, 0.9004217, 0.8532895, 1, 0, 0, 1, 1,
0.6306937, 0.3729737, 1.156994, 1, 0, 0, 1, 1,
0.6323861, 0.8852296, -0.6684158, 1, 0, 0, 1, 1,
0.6349276, 0.3288808, 0.6808944, 0, 0, 0, 1, 1,
0.6369712, 1.586314, -0.895528, 0, 0, 0, 1, 1,
0.6386552, -0.5517192, 3.204859, 0, 0, 0, 1, 1,
0.6418468, 0.955338, -0.004789513, 0, 0, 0, 1, 1,
0.6447008, 0.6143651, 1.591505, 0, 0, 0, 1, 1,
0.6453242, 0.5202935, 2.637108, 0, 0, 0, 1, 1,
0.6488082, -1.360777, 4.19812, 0, 0, 0, 1, 1,
0.6518019, -0.7203183, 0.3426117, 1, 1, 1, 1, 1,
0.6528342, -1.249793, 2.580466, 1, 1, 1, 1, 1,
0.6554408, -1.114549, 2.823161, 1, 1, 1, 1, 1,
0.6586675, 0.703064, -0.03983177, 1, 1, 1, 1, 1,
0.6586801, -1.441638, 1.385348, 1, 1, 1, 1, 1,
0.6633711, 0.6213371, 1.006399, 1, 1, 1, 1, 1,
0.663932, 0.185394, 1.045239, 1, 1, 1, 1, 1,
0.6651778, -1.002826, 0.8722025, 1, 1, 1, 1, 1,
0.6656167, 0.290574, 2.580834, 1, 1, 1, 1, 1,
0.6668449, -2.241255, 5.583073, 1, 1, 1, 1, 1,
0.6725528, 1.611208, -1.412563, 1, 1, 1, 1, 1,
0.6728804, -0.3441218, 2.663462, 1, 1, 1, 1, 1,
0.672987, 0.2349873, 1.679017, 1, 1, 1, 1, 1,
0.6793927, 0.6564475, 1.467625, 1, 1, 1, 1, 1,
0.6843801, -1.60862, 2.651962, 1, 1, 1, 1, 1,
0.6930757, -0.4103468, 2.631171, 0, 0, 1, 1, 1,
0.6939651, 0.1669599, 1.572269, 1, 0, 0, 1, 1,
0.6939735, -1.052781, 2.881535, 1, 0, 0, 1, 1,
0.694019, 0.2729759, 2.707075, 1, 0, 0, 1, 1,
0.694827, -0.7523974, 1.064829, 1, 0, 0, 1, 1,
0.6962476, -0.6406607, 2.834831, 1, 0, 0, 1, 1,
0.7024953, -1.804355, 2.11797, 0, 0, 0, 1, 1,
0.704727, -0.02971562, 3.284354, 0, 0, 0, 1, 1,
0.7079689, -0.3726873, 2.925167, 0, 0, 0, 1, 1,
0.7097389, 1.300297, 0.5627435, 0, 0, 0, 1, 1,
0.7125243, 1.072625, -0.0457091, 0, 0, 0, 1, 1,
0.7164283, -0.581156, 1.502017, 0, 0, 0, 1, 1,
0.7181956, -0.02042462, 0.8731889, 0, 0, 0, 1, 1,
0.7189009, 0.2447594, 0.5509594, 1, 1, 1, 1, 1,
0.7255191, 0.3726143, 1.201503, 1, 1, 1, 1, 1,
0.7266831, 0.1208328, 1.538117, 1, 1, 1, 1, 1,
0.7314224, 0.5122281, 0.5148904, 1, 1, 1, 1, 1,
0.742029, -1.042048, 2.467466, 1, 1, 1, 1, 1,
0.7446824, -2.069113, 1.002831, 1, 1, 1, 1, 1,
0.74958, 2.060694, 0.3772309, 1, 1, 1, 1, 1,
0.7505068, 1.188961, -0.3618828, 1, 1, 1, 1, 1,
0.7531651, 1.477873, 0.2772383, 1, 1, 1, 1, 1,
0.7589685, 0.05065662, 0.2835939, 1, 1, 1, 1, 1,
0.7696514, -0.5089519, 2.864497, 1, 1, 1, 1, 1,
0.7722471, -0.4782383, 2.311798, 1, 1, 1, 1, 1,
0.7783923, -0.1702061, 2.593232, 1, 1, 1, 1, 1,
0.7827295, 1.609453, -0.5391804, 1, 1, 1, 1, 1,
0.7890317, 1.030383, 0.01112041, 1, 1, 1, 1, 1,
0.7930917, -0.1742558, 1.795535, 0, 0, 1, 1, 1,
0.7965237, -0.2471444, 2.523279, 1, 0, 0, 1, 1,
0.7969292, -0.538967, 1.985407, 1, 0, 0, 1, 1,
0.8012137, 0.9271656, 0.1031451, 1, 0, 0, 1, 1,
0.8027472, 0.2205661, 0.4316829, 1, 0, 0, 1, 1,
0.803191, 1.090969, 0.7186775, 1, 0, 0, 1, 1,
0.8058262, 0.5282381, 1.114374, 0, 0, 0, 1, 1,
0.8104219, -1.052364, 3.900699, 0, 0, 0, 1, 1,
0.8129392, -1.249322, 1.55115, 0, 0, 0, 1, 1,
0.8141176, -0.6903961, 1.795403, 0, 0, 0, 1, 1,
0.8150089, 1.384037, 0.1429914, 0, 0, 0, 1, 1,
0.8169483, -0.9551911, 3.800776, 0, 0, 0, 1, 1,
0.8174809, -1.099808, 1.873246, 0, 0, 0, 1, 1,
0.8275941, 1.523736, 0.4076107, 1, 1, 1, 1, 1,
0.8305437, 0.436583, 0.06640396, 1, 1, 1, 1, 1,
0.8322563, -0.6656499, 1.689606, 1, 1, 1, 1, 1,
0.8325587, -0.4021625, 2.578235, 1, 1, 1, 1, 1,
0.8347861, -1.720609, 1.754655, 1, 1, 1, 1, 1,
0.8386895, -1.046012, 1.693058, 1, 1, 1, 1, 1,
0.8412021, -2.169226, 2.404417, 1, 1, 1, 1, 1,
0.8438905, -1.769392, 0.7973861, 1, 1, 1, 1, 1,
0.8492727, 0.3155865, 2.260572, 1, 1, 1, 1, 1,
0.8630496, -0.1857758, 0.02444291, 1, 1, 1, 1, 1,
0.864672, 0.1552773, 0.5360396, 1, 1, 1, 1, 1,
0.8661094, 0.1941642, -0.2879464, 1, 1, 1, 1, 1,
0.866701, 0.5113442, 1.421583, 1, 1, 1, 1, 1,
0.8826253, 0.5387151, 2.041896, 1, 1, 1, 1, 1,
0.8837254, 0.5725868, 0.9396437, 1, 1, 1, 1, 1,
0.8900198, -0.4727977, 3.478734, 0, 0, 1, 1, 1,
0.8906466, -1.807199, 1.953217, 1, 0, 0, 1, 1,
0.8986603, 0.1599735, 2.727118, 1, 0, 0, 1, 1,
0.9039001, -0.2417036, 0.4883466, 1, 0, 0, 1, 1,
0.9150971, -0.4942756, 2.650529, 1, 0, 0, 1, 1,
0.9223289, -0.496138, 2.639803, 1, 0, 0, 1, 1,
0.9224798, 0.263158, -1.393077, 0, 0, 0, 1, 1,
0.9234474, -0.02726643, 1.132198, 0, 0, 0, 1, 1,
0.9234966, 0.2298917, 1.605283, 0, 0, 0, 1, 1,
0.9284117, 0.4909163, 1.618236, 0, 0, 0, 1, 1,
0.9313948, 0.3719755, 1.31873, 0, 0, 0, 1, 1,
0.9361044, -0.37881, 5.160685, 0, 0, 0, 1, 1,
0.9364377, 0.73338, -1.735291, 0, 0, 0, 1, 1,
0.9429184, -0.04116968, 1.1778, 1, 1, 1, 1, 1,
0.9450575, 0.9448103, 2.012093, 1, 1, 1, 1, 1,
0.9461995, 1.666809, 2.535848, 1, 1, 1, 1, 1,
0.9462631, 1.286684, 1.642766, 1, 1, 1, 1, 1,
0.9481069, -1.468189, 1.697898, 1, 1, 1, 1, 1,
0.9530339, -1.739026, 0.6163498, 1, 1, 1, 1, 1,
0.9545772, -0.5704057, 3.699712, 1, 1, 1, 1, 1,
0.9586961, 1.162065, 0.6432818, 1, 1, 1, 1, 1,
0.961253, -0.7034847, 1.340968, 1, 1, 1, 1, 1,
0.9642369, -1.145721, 3.412852, 1, 1, 1, 1, 1,
0.9653035, -0.05391734, 2.10807, 1, 1, 1, 1, 1,
0.9672831, 2.230325, 0.4441038, 1, 1, 1, 1, 1,
0.9682704, -2.583964, 2.427468, 1, 1, 1, 1, 1,
0.9685364, 0.3206552, 1.891392, 1, 1, 1, 1, 1,
0.9691439, 0.3039583, 2.606903, 1, 1, 1, 1, 1,
0.9692672, -1.299404, 1.204825, 0, 0, 1, 1, 1,
0.9702703, 1.097525, 2.133857, 1, 0, 0, 1, 1,
0.970805, -0.5175427, 0.9962513, 1, 0, 0, 1, 1,
0.9738382, 0.01964505, 1.723505, 1, 0, 0, 1, 1,
0.9865318, 0.4465252, 2.216698, 1, 0, 0, 1, 1,
0.986728, 1.45984, 0.6589307, 1, 0, 0, 1, 1,
0.9897114, -1.48735, 1.90243, 0, 0, 0, 1, 1,
0.9926598, 0.4068966, 3.445763, 0, 0, 0, 1, 1,
1.005049, 0.2181686, 1.741194, 0, 0, 0, 1, 1,
1.008447, 1.084895, 2.622455, 0, 0, 0, 1, 1,
1.013494, -1.810958, 1.102683, 0, 0, 0, 1, 1,
1.013556, 0.5602719, -0.08341169, 0, 0, 0, 1, 1,
1.020535, -0.1298451, 1.075586, 0, 0, 0, 1, 1,
1.022529, -2.393182, 1.139395, 1, 1, 1, 1, 1,
1.027828, -0.5077537, -1.103914, 1, 1, 1, 1, 1,
1.043662, -1.737788, 2.198622, 1, 1, 1, 1, 1,
1.051475, 0.8326128, 2.06288, 1, 1, 1, 1, 1,
1.053676, 0.09721407, 1.859443, 1, 1, 1, 1, 1,
1.062159, 0.2474725, -0.6839315, 1, 1, 1, 1, 1,
1.067738, -0.7196151, 2.019054, 1, 1, 1, 1, 1,
1.070612, -0.6106532, 2.024104, 1, 1, 1, 1, 1,
1.07816, 0.4217807, 2.488642, 1, 1, 1, 1, 1,
1.081082, 0.7441387, 0.4498481, 1, 1, 1, 1, 1,
1.083086, 0.8949764, 2.162029, 1, 1, 1, 1, 1,
1.084864, 0.1532149, 2.844297, 1, 1, 1, 1, 1,
1.094836, 1.025695, -0.2629772, 1, 1, 1, 1, 1,
1.097834, -0.02757407, 2.902697, 1, 1, 1, 1, 1,
1.101272, -0.4705954, 1.178386, 1, 1, 1, 1, 1,
1.108244, 0.3842801, 2.533749, 0, 0, 1, 1, 1,
1.117094, -0.4398652, 2.039916, 1, 0, 0, 1, 1,
1.127796, 0.7672858, 1.539489, 1, 0, 0, 1, 1,
1.132725, 1.047145, 0.8003243, 1, 0, 0, 1, 1,
1.147324, 1.228785, 0.5307313, 1, 0, 0, 1, 1,
1.181637, 0.7853832, 1.220448, 1, 0, 0, 1, 1,
1.185805, 0.7063147, 2.124474, 0, 0, 0, 1, 1,
1.186532, 0.08925983, 0.714641, 0, 0, 0, 1, 1,
1.186718, 0.9549932, 1.198421, 0, 0, 0, 1, 1,
1.195145, -1.034098, 2.461046, 0, 0, 0, 1, 1,
1.200382, 0.3409295, 2.186845, 0, 0, 0, 1, 1,
1.20657, -1.093035, 2.933784, 0, 0, 0, 1, 1,
1.210888, -1.887352, 2.407254, 0, 0, 0, 1, 1,
1.212172, -0.8005076, 2.930036, 1, 1, 1, 1, 1,
1.21523, -0.53787, 3.887984, 1, 1, 1, 1, 1,
1.222716, -0.2253034, 3.061332, 1, 1, 1, 1, 1,
1.22287, 0.3159666, 0.9587783, 1, 1, 1, 1, 1,
1.227859, -2.22614, 1.798334, 1, 1, 1, 1, 1,
1.233342, -0.254754, 0.9876859, 1, 1, 1, 1, 1,
1.245205, 0.5324034, -0.6074951, 1, 1, 1, 1, 1,
1.2475, 0.1316218, -0.1839284, 1, 1, 1, 1, 1,
1.248918, -1.040773, 1.780525, 1, 1, 1, 1, 1,
1.26588, -0.4035809, 0.7876182, 1, 1, 1, 1, 1,
1.276571, -0.7258898, 1.427385, 1, 1, 1, 1, 1,
1.282136, 0.144367, 0.677959, 1, 1, 1, 1, 1,
1.282423, -1.662483, 0.4405426, 1, 1, 1, 1, 1,
1.283277, -0.9892253, 2.127971, 1, 1, 1, 1, 1,
1.288706, -0.4919963, 1.555445, 1, 1, 1, 1, 1,
1.29035, -0.9032176, 2.369416, 0, 0, 1, 1, 1,
1.29331, -1.200452, 2.024342, 1, 0, 0, 1, 1,
1.29364, -0.4755358, 1.149431, 1, 0, 0, 1, 1,
1.294111, -0.0007389256, 2.313144, 1, 0, 0, 1, 1,
1.299132, 0.5006695, 0.5290608, 1, 0, 0, 1, 1,
1.301153, 0.4848735, 0.4831992, 1, 0, 0, 1, 1,
1.303602, -0.4746442, 1.931918, 0, 0, 0, 1, 1,
1.311737, -0.463366, 0.4058336, 0, 0, 0, 1, 1,
1.317894, 0.1162392, 1.369673, 0, 0, 0, 1, 1,
1.329268, -0.7977609, 0.8966178, 0, 0, 0, 1, 1,
1.337789, -1.062033, 2.661683, 0, 0, 0, 1, 1,
1.356263, 0.9246586, 1.776086, 0, 0, 0, 1, 1,
1.364595, -0.5316217, 1.076914, 0, 0, 0, 1, 1,
1.366242, -1.533442, 2.425989, 1, 1, 1, 1, 1,
1.381418, 0.4301052, 0.5619184, 1, 1, 1, 1, 1,
1.384447, 1.059698, 2.399317, 1, 1, 1, 1, 1,
1.384774, 1.672893, 1.288148, 1, 1, 1, 1, 1,
1.387039, 2.248821, 0.8703146, 1, 1, 1, 1, 1,
1.390246, -1.54283, 2.973031, 1, 1, 1, 1, 1,
1.393761, 0.87427, 1.440429, 1, 1, 1, 1, 1,
1.402872, 0.2153127, 0.7519126, 1, 1, 1, 1, 1,
1.406569, -0.5511913, 4.019072, 1, 1, 1, 1, 1,
1.407086, -0.6597477, 2.481612, 1, 1, 1, 1, 1,
1.407525, -0.8035347, 3.011933, 1, 1, 1, 1, 1,
1.407579, 0.2702935, 3.340205, 1, 1, 1, 1, 1,
1.410003, -0.6093447, 1.646201, 1, 1, 1, 1, 1,
1.414885, -0.1425833, 2.504842, 1, 1, 1, 1, 1,
1.435499, 0.2153697, 1.546763, 1, 1, 1, 1, 1,
1.447981, 1.709623, -1.653212, 0, 0, 1, 1, 1,
1.449819, 1.339707, 1.491757, 1, 0, 0, 1, 1,
1.450858, -1.178878, 2.63267, 1, 0, 0, 1, 1,
1.456067, 0.1807692, 2.639348, 1, 0, 0, 1, 1,
1.464976, 0.7544788, 2.254332, 1, 0, 0, 1, 1,
1.469213, -0.5977983, 1.674964, 1, 0, 0, 1, 1,
1.471601, 0.3694495, -0.3644172, 0, 0, 0, 1, 1,
1.488122, -0.7368347, 2.951263, 0, 0, 0, 1, 1,
1.49214, 0.1040302, 1.333409, 0, 0, 0, 1, 1,
1.495732, 0.3328953, 0.5393052, 0, 0, 0, 1, 1,
1.501313, 0.2304868, 1.309119, 0, 0, 0, 1, 1,
1.509594, -1.185882, 2.324438, 0, 0, 0, 1, 1,
1.512171, 0.2009008, 1.414601, 0, 0, 0, 1, 1,
1.534206, -0.03651656, 1.880244, 1, 1, 1, 1, 1,
1.541952, 2.20538, 0.7241031, 1, 1, 1, 1, 1,
1.547714, 0.877162, -0.7715277, 1, 1, 1, 1, 1,
1.548972, -0.9150971, 1.714282, 1, 1, 1, 1, 1,
1.557627, 0.1899416, 0.2960314, 1, 1, 1, 1, 1,
1.566075, 1.707154, -0.4930612, 1, 1, 1, 1, 1,
1.56689, 0.120266, 1.358639, 1, 1, 1, 1, 1,
1.580524, -1.643208, 4.272172, 1, 1, 1, 1, 1,
1.594401, 1.366641, 1.383498, 1, 1, 1, 1, 1,
1.599424, -1.320636, 3.82514, 1, 1, 1, 1, 1,
1.600133, 0.4634554, 1.278722, 1, 1, 1, 1, 1,
1.606558, -0.460933, 3.13956, 1, 1, 1, 1, 1,
1.627385, -0.9225189, 1.790099, 1, 1, 1, 1, 1,
1.628356, -0.5745707, 2.291459, 1, 1, 1, 1, 1,
1.653391, 0.3191136, 1.55331, 1, 1, 1, 1, 1,
1.662937, 1.211314, 1.175777, 0, 0, 1, 1, 1,
1.671394, -1.890278, 3.023116, 1, 0, 0, 1, 1,
1.6744, -1.800022, 3.568339, 1, 0, 0, 1, 1,
1.677775, 1.795898, -0.2064008, 1, 0, 0, 1, 1,
1.678008, -0.1606492, 1.020255, 1, 0, 0, 1, 1,
1.681985, 1.0447, -0.1372354, 1, 0, 0, 1, 1,
1.692901, 1.653839, -0.3171841, 0, 0, 0, 1, 1,
1.706901, 0.2744219, 3.309856, 0, 0, 0, 1, 1,
1.71151, 0.7120895, -0.2580589, 0, 0, 0, 1, 1,
1.715082, -1.094462, 1.411948, 0, 0, 0, 1, 1,
1.71639, -1.87728, 2.738071, 0, 0, 0, 1, 1,
1.717918, 0.1426132, 1.058004, 0, 0, 0, 1, 1,
1.72217, 0.02356536, -0.3559016, 0, 0, 0, 1, 1,
1.727483, 0.2807721, 0.493507, 1, 1, 1, 1, 1,
1.728022, 0.5412391, 1.41491, 1, 1, 1, 1, 1,
1.757602, 0.9605349, -0.5759254, 1, 1, 1, 1, 1,
1.770665, -0.1069581, 3.200067, 1, 1, 1, 1, 1,
1.774057, 2.062816, 1.681802, 1, 1, 1, 1, 1,
1.78652, 2.334129, 0.001297324, 1, 1, 1, 1, 1,
1.805935, 1.591857, 0.9074656, 1, 1, 1, 1, 1,
1.822595, -1.238019, 2.331302, 1, 1, 1, 1, 1,
1.82344, -0.3114528, 2.679075, 1, 1, 1, 1, 1,
1.849068, -0.06229329, 0.8311843, 1, 1, 1, 1, 1,
1.865624, 0.6250069, -0.5318763, 1, 1, 1, 1, 1,
1.867995, -0.09492619, 1.110097, 1, 1, 1, 1, 1,
1.888963, -0.1847773, -0.4370228, 1, 1, 1, 1, 1,
1.902088, 0.3902376, 3.286321, 1, 1, 1, 1, 1,
1.914857, -0.6610064, 1.740775, 1, 1, 1, 1, 1,
1.934673, -0.09554002, 0.8898377, 0, 0, 1, 1, 1,
1.95277, -0.2364447, -0.1527354, 1, 0, 0, 1, 1,
1.976814, -0.6891818, 2.560946, 1, 0, 0, 1, 1,
2.036809, 0.2760588, 1.270901, 1, 0, 0, 1, 1,
2.07038, -0.2116853, 0.6453732, 1, 0, 0, 1, 1,
2.070968, 0.1781895, -1.220614, 1, 0, 0, 1, 1,
2.08042, 0.007547322, 2.816856, 0, 0, 0, 1, 1,
2.0887, -2.982633, -0.005592763, 0, 0, 0, 1, 1,
2.099789, 0.4846965, 0.2704392, 0, 0, 0, 1, 1,
2.129546, 1.899099, 1.704557, 0, 0, 0, 1, 1,
2.130261, -1.668571, 1.81381, 0, 0, 0, 1, 1,
2.144838, 1.4196, -0.3617009, 0, 0, 0, 1, 1,
2.190873, 1.639163, -1.222361, 0, 0, 0, 1, 1,
2.207822, 0.2337303, 2.234354, 1, 1, 1, 1, 1,
2.534956, -1.425398, 1.893259, 1, 1, 1, 1, 1,
2.539579, 0.04353712, 1.419628, 1, 1, 1, 1, 1,
2.682993, -0.7679548, 2.294216, 1, 1, 1, 1, 1,
2.98471, 0.2319157, 2.058182, 1, 1, 1, 1, 1,
3.031664, -0.497316, 2.466554, 1, 1, 1, 1, 1,
3.357343, 1.037796, 0.8718342, 1, 1, 1, 1, 1
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
var radius = 9.339511;
var distance = 32.80463;
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
mvMatrix.translate( -0.1347239, 0.1448243, -0.2958879 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.80463);
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
