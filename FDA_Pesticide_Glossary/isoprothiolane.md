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
-2.934138, 0.3327546, 0.3267463, 1, 0, 0, 1,
-2.855248, -0.5985612, -0.7016107, 1, 0.007843138, 0, 1,
-2.710443, -0.6239473, -2.076655, 1, 0.01176471, 0, 1,
-2.663752, -1.077254, -2.60003, 1, 0.01960784, 0, 1,
-2.616986, 0.1505147, -2.558851, 1, 0.02352941, 0, 1,
-2.572764, 0.1600339, -0.9805809, 1, 0.03137255, 0, 1,
-2.435376, 1.336715, -1.460496, 1, 0.03529412, 0, 1,
-2.433943, -0.7998741, -2.911993, 1, 0.04313726, 0, 1,
-2.397334, -1.516282, -2.823588, 1, 0.04705882, 0, 1,
-2.383294, -0.5336171, -1.757914, 1, 0.05490196, 0, 1,
-2.354054, 1.481019, -1.133934, 1, 0.05882353, 0, 1,
-2.348503, -1.410916, -0.9139675, 1, 0.06666667, 0, 1,
-2.303341, 1.591144, -0.3909492, 1, 0.07058824, 0, 1,
-2.299261, 0.3726043, -0.7046359, 1, 0.07843138, 0, 1,
-2.259593, 1.192124, -0.5269955, 1, 0.08235294, 0, 1,
-2.255695, 0.09589266, -0.8715969, 1, 0.09019608, 0, 1,
-2.246805, 0.9432663, -0.5216489, 1, 0.09411765, 0, 1,
-2.229568, 1.206436, -0.4351311, 1, 0.1019608, 0, 1,
-2.213313, 0.2757787, -2.257571, 1, 0.1098039, 0, 1,
-2.180608, -0.3552933, -2.001536, 1, 0.1137255, 0, 1,
-2.138707, 0.5790826, -2.415476, 1, 0.1215686, 0, 1,
-2.123134, -1.362792, -1.886678, 1, 0.1254902, 0, 1,
-2.122809, 0.1309884, -1.78682, 1, 0.1333333, 0, 1,
-2.112499, 0.323401, -3.772692, 1, 0.1372549, 0, 1,
-2.093733, 1.982144, -1.600533, 1, 0.145098, 0, 1,
-2.022352, 0.2544574, -1.315621, 1, 0.1490196, 0, 1,
-2.01303, 0.7082798, -0.8319778, 1, 0.1568628, 0, 1,
-2.01008, -0.2327348, -2.59601, 1, 0.1607843, 0, 1,
-1.998583, -0.303014, -2.354312, 1, 0.1686275, 0, 1,
-1.995371, -0.4222472, -1.859266, 1, 0.172549, 0, 1,
-1.966313, -0.6032476, -1.675736, 1, 0.1803922, 0, 1,
-1.956072, 1.816676, -1.721906, 1, 0.1843137, 0, 1,
-1.955883, 0.6072436, -1.875457, 1, 0.1921569, 0, 1,
-1.953722, -0.8046494, -1.618933, 1, 0.1960784, 0, 1,
-1.938406, 0.4345915, -3.315828, 1, 0.2039216, 0, 1,
-1.917866, -0.1079604, -0.8764921, 1, 0.2117647, 0, 1,
-1.907294, 0.08058193, -1.945711, 1, 0.2156863, 0, 1,
-1.893292, 1.607485, -1.781999, 1, 0.2235294, 0, 1,
-1.882043, 0.2167322, -2.719752, 1, 0.227451, 0, 1,
-1.866301, -0.0007157659, -1.011089, 1, 0.2352941, 0, 1,
-1.864984, -1.390022, -3.130079, 1, 0.2392157, 0, 1,
-1.836321, -0.6336167, -3.473479, 1, 0.2470588, 0, 1,
-1.834881, -0.0829858, -1.768706, 1, 0.2509804, 0, 1,
-1.825494, 0.1175114, -3.376303, 1, 0.2588235, 0, 1,
-1.802781, 0.9386545, -3.209502, 1, 0.2627451, 0, 1,
-1.793565, 0.576314, -1.126358, 1, 0.2705882, 0, 1,
-1.783775, -1.010247, -2.231186, 1, 0.2745098, 0, 1,
-1.750039, -0.7662746, -0.7903656, 1, 0.282353, 0, 1,
-1.748489, 1.368151, -1.120541, 1, 0.2862745, 0, 1,
-1.74119, -1.100632, -3.546434, 1, 0.2941177, 0, 1,
-1.737672, 0.5893651, -1.040746, 1, 0.3019608, 0, 1,
-1.722048, -1.138637, -2.014272, 1, 0.3058824, 0, 1,
-1.713086, 0.8924137, -0.5579727, 1, 0.3137255, 0, 1,
-1.689983, 0.3565167, -1.167886, 1, 0.3176471, 0, 1,
-1.679017, -2.600646, -2.694331, 1, 0.3254902, 0, 1,
-1.65481, 0.6962424, 0.25525, 1, 0.3294118, 0, 1,
-1.652583, 1.561749, -1.405797, 1, 0.3372549, 0, 1,
-1.649165, -1.255044, -3.344949, 1, 0.3411765, 0, 1,
-1.642467, 0.02042861, -1.659701, 1, 0.3490196, 0, 1,
-1.636183, -0.3537557, 0.1795169, 1, 0.3529412, 0, 1,
-1.632737, 2.14852, -0.9136895, 1, 0.3607843, 0, 1,
-1.628081, 1.074433, -0.7917059, 1, 0.3647059, 0, 1,
-1.624281, -0.8954592, -1.696041, 1, 0.372549, 0, 1,
-1.617996, -1.752178, -2.729706, 1, 0.3764706, 0, 1,
-1.614437, -0.3315513, -3.186165, 1, 0.3843137, 0, 1,
-1.607254, -0.01558894, -1.771461, 1, 0.3882353, 0, 1,
-1.601939, -0.9555452, -1.414771, 1, 0.3960784, 0, 1,
-1.600175, -0.9492986, -1.904572, 1, 0.4039216, 0, 1,
-1.600019, -0.6716983, -2.624628, 1, 0.4078431, 0, 1,
-1.596862, -2.13969, -4.099422, 1, 0.4156863, 0, 1,
-1.565464, 0.1053254, -1.22211, 1, 0.4196078, 0, 1,
-1.560593, 1.550916, -1.337875, 1, 0.427451, 0, 1,
-1.559226, -1.375023, -2.197327, 1, 0.4313726, 0, 1,
-1.542608, 0.9773703, -0.5253266, 1, 0.4392157, 0, 1,
-1.535685, -0.6638836, -1.732248, 1, 0.4431373, 0, 1,
-1.531095, 0.1365484, 0.07677034, 1, 0.4509804, 0, 1,
-1.526057, 0.07115674, -0.7515692, 1, 0.454902, 0, 1,
-1.515663, -0.1986015, -1.105376, 1, 0.4627451, 0, 1,
-1.512166, -0.6790189, -1.952765, 1, 0.4666667, 0, 1,
-1.507483, -0.7015993, -2.621758, 1, 0.4745098, 0, 1,
-1.496514, 0.03697547, -1.607288, 1, 0.4784314, 0, 1,
-1.495909, 0.6782774, -1.479849, 1, 0.4862745, 0, 1,
-1.471039, -0.4621202, -0.02884612, 1, 0.4901961, 0, 1,
-1.450862, 0.1044475, -0.571039, 1, 0.4980392, 0, 1,
-1.429991, 2.663111, -1.42918, 1, 0.5058824, 0, 1,
-1.427835, -0.2157935, -2.684911, 1, 0.509804, 0, 1,
-1.423853, 0.3783698, -2.774234, 1, 0.5176471, 0, 1,
-1.420788, 1.30285, -0.3216927, 1, 0.5215687, 0, 1,
-1.417211, 0.08080851, -2.255686, 1, 0.5294118, 0, 1,
-1.40845, -0.520052, -1.514436, 1, 0.5333334, 0, 1,
-1.407901, -0.3190794, -1.958187, 1, 0.5411765, 0, 1,
-1.402946, -0.6982969, -3.746513, 1, 0.5450981, 0, 1,
-1.400943, 0.188157, -0.3643681, 1, 0.5529412, 0, 1,
-1.399527, -0.8891425, -2.823323, 1, 0.5568628, 0, 1,
-1.392882, -0.2644418, -1.284958, 1, 0.5647059, 0, 1,
-1.37834, 1.76031, 0.1050731, 1, 0.5686275, 0, 1,
-1.376104, 1.87619, -2.578389, 1, 0.5764706, 0, 1,
-1.368413, -0.6259063, -2.130368, 1, 0.5803922, 0, 1,
-1.360308, 1.261178, -1.127796, 1, 0.5882353, 0, 1,
-1.357836, -0.9968653, -2.028573, 1, 0.5921569, 0, 1,
-1.357162, -0.1711655, -0.250748, 1, 0.6, 0, 1,
-1.357156, 0.6405323, -2.075886, 1, 0.6078432, 0, 1,
-1.34303, 1.43101, -1.575412, 1, 0.6117647, 0, 1,
-1.33937, 0.3219944, -4.535242, 1, 0.6196079, 0, 1,
-1.337239, 0.8190072, -0.4029239, 1, 0.6235294, 0, 1,
-1.3337, -1.609796, -2.775029, 1, 0.6313726, 0, 1,
-1.329598, 0.2344549, -0.731199, 1, 0.6352941, 0, 1,
-1.327919, -0.08412816, -1.702892, 1, 0.6431373, 0, 1,
-1.3262, -0.9546743, -3.192506, 1, 0.6470588, 0, 1,
-1.31645, -0.003299512, -1.38094, 1, 0.654902, 0, 1,
-1.312657, 0.3374536, -0.650301, 1, 0.6588235, 0, 1,
-1.310248, 2.73461, -0.3067738, 1, 0.6666667, 0, 1,
-1.295652, 0.5124986, -1.866346, 1, 0.6705883, 0, 1,
-1.294639, 0.6937527, -1.194322, 1, 0.6784314, 0, 1,
-1.291985, -0.2191867, -3.183273, 1, 0.682353, 0, 1,
-1.287882, -0.3753774, -1.361724, 1, 0.6901961, 0, 1,
-1.287368, 0.1062355, -2.129453, 1, 0.6941177, 0, 1,
-1.287146, 0.2812297, 0.7794483, 1, 0.7019608, 0, 1,
-1.284653, 1.26669, -1.421748, 1, 0.7098039, 0, 1,
-1.276871, -1.263139, -2.388416, 1, 0.7137255, 0, 1,
-1.265325, 0.04298849, -2.398016, 1, 0.7215686, 0, 1,
-1.257515, 0.2798647, -0.5593758, 1, 0.7254902, 0, 1,
-1.256818, 1.939259, -1.246076, 1, 0.7333333, 0, 1,
-1.248471, 0.5000294, -0.8081172, 1, 0.7372549, 0, 1,
-1.240145, -0.1195754, -1.781975, 1, 0.7450981, 0, 1,
-1.239774, -0.2172795, -3.237922, 1, 0.7490196, 0, 1,
-1.228812, -0.1224932, -1.542412, 1, 0.7568628, 0, 1,
-1.22292, -0.8228992, -2.647607, 1, 0.7607843, 0, 1,
-1.218396, -0.2242978, -2.560974, 1, 0.7686275, 0, 1,
-1.212394, -0.01848329, -1.28863, 1, 0.772549, 0, 1,
-1.191919, -1.050757, -3.989702, 1, 0.7803922, 0, 1,
-1.188733, 0.01463913, -3.421982, 1, 0.7843137, 0, 1,
-1.180894, 0.3913115, -1.401343, 1, 0.7921569, 0, 1,
-1.179736, 0.3099488, 0.9285166, 1, 0.7960784, 0, 1,
-1.174947, -0.8344348, -2.833388, 1, 0.8039216, 0, 1,
-1.17326, 0.01479361, -0.8904327, 1, 0.8117647, 0, 1,
-1.172479, 0.007393201, -0.165363, 1, 0.8156863, 0, 1,
-1.161386, 0.6927791, -0.9755219, 1, 0.8235294, 0, 1,
-1.149942, -0.2111077, -1.799004, 1, 0.827451, 0, 1,
-1.145275, -0.3485843, -1.136382, 1, 0.8352941, 0, 1,
-1.139822, -0.5451202, -0.9652506, 1, 0.8392157, 0, 1,
-1.13818, 0.5095961, -1.384717, 1, 0.8470588, 0, 1,
-1.135535, -0.8924969, -0.7095898, 1, 0.8509804, 0, 1,
-1.129352, 0.1278068, -0.3422661, 1, 0.8588235, 0, 1,
-1.126209, 2.16227, -0.7241682, 1, 0.8627451, 0, 1,
-1.125224, 0.3174824, -0.7064088, 1, 0.8705882, 0, 1,
-1.124947, -0.9915746, -1.571615, 1, 0.8745098, 0, 1,
-1.120924, -0.8269207, -4.149231, 1, 0.8823529, 0, 1,
-1.114057, 1.735442, -0.2575584, 1, 0.8862745, 0, 1,
-1.113645, 0.5501329, -1.393996, 1, 0.8941177, 0, 1,
-1.106235, 0.7258894, -1.185936, 1, 0.8980392, 0, 1,
-1.081124, -0.1481967, -1.976826, 1, 0.9058824, 0, 1,
-1.076123, 0.03083209, -2.070332, 1, 0.9137255, 0, 1,
-1.069904, 0.8926648, -0.9612328, 1, 0.9176471, 0, 1,
-1.06818, -1.447091, -0.6220858, 1, 0.9254902, 0, 1,
-1.063043, 1.027934, -0.8453335, 1, 0.9294118, 0, 1,
-1.049218, -1.676943, -2.15609, 1, 0.9372549, 0, 1,
-1.046922, -0.08405894, -1.731376, 1, 0.9411765, 0, 1,
-1.04618, -0.03230702, -1.23517, 1, 0.9490196, 0, 1,
-1.044763, -2.412089, -3.339122, 1, 0.9529412, 0, 1,
-1.04038, 1.670817, -2.089077, 1, 0.9607843, 0, 1,
-1.039591, 0.1685379, -1.057922, 1, 0.9647059, 0, 1,
-1.0235, 1.125657, -1.093327, 1, 0.972549, 0, 1,
-1.019308, -1.086935, -3.303908, 1, 0.9764706, 0, 1,
-1.017213, 0.2910459, -1.222104, 1, 0.9843137, 0, 1,
-1.008303, -0.7719901, -1.44972, 1, 0.9882353, 0, 1,
-1.007815, -0.5521693, -0.6638833, 1, 0.9960784, 0, 1,
-1.00493, 1.183075, 1.566184, 0.9960784, 1, 0, 1,
-1.00325, -0.006195778, -2.198929, 0.9921569, 1, 0, 1,
-0.9946785, -0.675388, -0.5250393, 0.9843137, 1, 0, 1,
-0.9941217, 1.156405, -1.551306, 0.9803922, 1, 0, 1,
-0.9930391, -0.5710652, -1.54156, 0.972549, 1, 0, 1,
-0.9907702, -0.03324915, -2.842404, 0.9686275, 1, 0, 1,
-0.9861085, -1.058405, -0.994581, 0.9607843, 1, 0, 1,
-0.9857984, -0.4975053, -2.528594, 0.9568627, 1, 0, 1,
-0.9846442, 1.104347, -0.3769291, 0.9490196, 1, 0, 1,
-0.983866, -0.5475861, -2.165223, 0.945098, 1, 0, 1,
-0.9828778, -0.7685359, -3.456046, 0.9372549, 1, 0, 1,
-0.9814167, 2.395976, -0.7215171, 0.9333333, 1, 0, 1,
-0.9667349, 0.06467389, -1.077508, 0.9254902, 1, 0, 1,
-0.9638007, -0.8291054, -2.827953, 0.9215686, 1, 0, 1,
-0.9608952, -1.061397, -1.389442, 0.9137255, 1, 0, 1,
-0.9577867, 1.579434, -1.429801, 0.9098039, 1, 0, 1,
-0.9496415, -1.850718, -1.306876, 0.9019608, 1, 0, 1,
-0.9490007, 0.7561348, -0.8736981, 0.8941177, 1, 0, 1,
-0.9457898, 0.9641514, 0.1584665, 0.8901961, 1, 0, 1,
-0.9260165, 1.61641, 1.193696, 0.8823529, 1, 0, 1,
-0.9234886, -0.6367191, -2.497007, 0.8784314, 1, 0, 1,
-0.9198053, -0.2397482, -4.009605, 0.8705882, 1, 0, 1,
-0.9136654, 1.196192, 0.6613503, 0.8666667, 1, 0, 1,
-0.9069846, -0.5991019, -1.177982, 0.8588235, 1, 0, 1,
-0.8984886, 2.091644, 0.386458, 0.854902, 1, 0, 1,
-0.8961876, 1.362013, -2.597035, 0.8470588, 1, 0, 1,
-0.8957416, 0.6367424, -0.2551696, 0.8431373, 1, 0, 1,
-0.8888337, -2.331627, -2.017736, 0.8352941, 1, 0, 1,
-0.8886115, 1.566107, -0.4186026, 0.8313726, 1, 0, 1,
-0.8803428, -0.1368263, -1.857195, 0.8235294, 1, 0, 1,
-0.869736, 0.8969573, 0.5348976, 0.8196079, 1, 0, 1,
-0.8671216, 0.9848872, 1.132587, 0.8117647, 1, 0, 1,
-0.8616872, -0.5032888, -1.933972, 0.8078431, 1, 0, 1,
-0.8603303, -0.1457809, -3.483171, 0.8, 1, 0, 1,
-0.8552532, 1.784613, -1.670958, 0.7921569, 1, 0, 1,
-0.8502957, -1.155729, -0.8706101, 0.7882353, 1, 0, 1,
-0.8304269, 1.765185, -0.02729458, 0.7803922, 1, 0, 1,
-0.8302132, -0.6802773, -1.992947, 0.7764706, 1, 0, 1,
-0.8301825, 1.770701, -1.51125, 0.7686275, 1, 0, 1,
-0.8289454, 1.297364, -2.112432, 0.7647059, 1, 0, 1,
-0.8209575, -1.726945, -3.175948, 0.7568628, 1, 0, 1,
-0.819302, 0.799652, -0.852482, 0.7529412, 1, 0, 1,
-0.8164062, -1.088554, -1.524973, 0.7450981, 1, 0, 1,
-0.8146489, 1.217808, -0.1395669, 0.7411765, 1, 0, 1,
-0.8103823, -1.357883, -3.187534, 0.7333333, 1, 0, 1,
-0.8068885, -0.2277072, -0.4265936, 0.7294118, 1, 0, 1,
-0.8060394, -1.042543, -4.417258, 0.7215686, 1, 0, 1,
-0.7935787, 0.245749, -1.819035, 0.7176471, 1, 0, 1,
-0.7909073, -1.737525, -3.716388, 0.7098039, 1, 0, 1,
-0.7876878, -0.05556612, -3.000726, 0.7058824, 1, 0, 1,
-0.7782373, 0.1535562, -1.23404, 0.6980392, 1, 0, 1,
-0.7737444, 1.546152, -1.496487, 0.6901961, 1, 0, 1,
-0.764588, -0.2465157, -3.25493, 0.6862745, 1, 0, 1,
-0.7621239, 1.076467, -1.216293, 0.6784314, 1, 0, 1,
-0.7586098, -0.6962861, -1.755332, 0.6745098, 1, 0, 1,
-0.7580415, -1.71952, -2.831851, 0.6666667, 1, 0, 1,
-0.7553734, -0.6893235, -3.394333, 0.6627451, 1, 0, 1,
-0.7497526, -1.806796, -1.034978, 0.654902, 1, 0, 1,
-0.7484065, -0.5386618, -3.042725, 0.6509804, 1, 0, 1,
-0.7447889, -0.4122874, -1.650411, 0.6431373, 1, 0, 1,
-0.740616, 1.490926, 0.9733992, 0.6392157, 1, 0, 1,
-0.7399304, -1.242869, -0.5017177, 0.6313726, 1, 0, 1,
-0.7352722, -1.097598, -3.409826, 0.627451, 1, 0, 1,
-0.7286932, 0.7147762, -1.715998, 0.6196079, 1, 0, 1,
-0.717931, 0.546829, -0.889827, 0.6156863, 1, 0, 1,
-0.7140676, 0.06514592, -1.666744, 0.6078432, 1, 0, 1,
-0.7138047, -1.967654, -2.093669, 0.6039216, 1, 0, 1,
-0.7124083, -0.06649331, -0.7290213, 0.5960785, 1, 0, 1,
-0.7113163, 0.3327603, -1.471445, 0.5882353, 1, 0, 1,
-0.710138, 0.1562034, -2.499306, 0.5843138, 1, 0, 1,
-0.7100477, 0.7030883, -1.389281, 0.5764706, 1, 0, 1,
-0.7094594, 0.3325965, -0.3650188, 0.572549, 1, 0, 1,
-0.7080376, 0.3073996, 0.054467, 0.5647059, 1, 0, 1,
-0.7059101, -0.4773204, -5.070969, 0.5607843, 1, 0, 1,
-0.7027863, 1.751265, -0.1568354, 0.5529412, 1, 0, 1,
-0.7004559, 0.8207914, 0.4958273, 0.5490196, 1, 0, 1,
-0.698596, -0.1055952, -1.224253, 0.5411765, 1, 0, 1,
-0.6936185, 1.244879, -1.731885, 0.5372549, 1, 0, 1,
-0.6932161, -0.08703295, -1.244635, 0.5294118, 1, 0, 1,
-0.6894636, -0.3473715, -2.260072, 0.5254902, 1, 0, 1,
-0.6795219, -1.856399, -3.059611, 0.5176471, 1, 0, 1,
-0.6744475, -1.642052, -2.268303, 0.5137255, 1, 0, 1,
-0.6726569, 2.343611, 0.4986165, 0.5058824, 1, 0, 1,
-0.6657189, 1.639008, 1.642327, 0.5019608, 1, 0, 1,
-0.6649918, 1.715085, -0.2520928, 0.4941176, 1, 0, 1,
-0.6648002, 0.09486803, 0.3009367, 0.4862745, 1, 0, 1,
-0.6594296, -0.9426194, -2.401522, 0.4823529, 1, 0, 1,
-0.6574398, -1.662414, -3.523798, 0.4745098, 1, 0, 1,
-0.654561, 0.3652209, -1.08613, 0.4705882, 1, 0, 1,
-0.6535365, -0.01270394, -2.084851, 0.4627451, 1, 0, 1,
-0.6529961, 1.217325, -1.76694, 0.4588235, 1, 0, 1,
-0.6522557, 0.7788063, 0.8107322, 0.4509804, 1, 0, 1,
-0.6443043, 2.231616, -0.7359695, 0.4470588, 1, 0, 1,
-0.6429677, 0.8799018, -2.31562, 0.4392157, 1, 0, 1,
-0.6405157, -0.5365915, -2.495953, 0.4352941, 1, 0, 1,
-0.6402859, -0.35747, -4.425436, 0.427451, 1, 0, 1,
-0.6378112, 0.1253523, -1.475114, 0.4235294, 1, 0, 1,
-0.6367066, 0.8904747, 0.9247225, 0.4156863, 1, 0, 1,
-0.632046, 0.3936498, -3.364147, 0.4117647, 1, 0, 1,
-0.6291314, 0.1223284, -1.605791, 0.4039216, 1, 0, 1,
-0.6202646, 0.9359864, -0.3958514, 0.3960784, 1, 0, 1,
-0.6173271, 0.9405774, -2.149839, 0.3921569, 1, 0, 1,
-0.6165259, -0.6496597, -0.635143, 0.3843137, 1, 0, 1,
-0.6141163, 0.6201382, -0.9755787, 0.3803922, 1, 0, 1,
-0.6084496, 0.9931396, -0.1822476, 0.372549, 1, 0, 1,
-0.6074263, -1.158481, -0.4854597, 0.3686275, 1, 0, 1,
-0.6016744, 1.177365, -0.956268, 0.3607843, 1, 0, 1,
-0.6004696, 0.509946, 0.3349217, 0.3568628, 1, 0, 1,
-0.6003886, -2.133981, -2.242323, 0.3490196, 1, 0, 1,
-0.5958847, 0.9398741, -0.6962206, 0.345098, 1, 0, 1,
-0.5958086, 1.331667, -0.2322812, 0.3372549, 1, 0, 1,
-0.5950682, -1.061541, -2.767156, 0.3333333, 1, 0, 1,
-0.5920117, -2.173026, -2.647773, 0.3254902, 1, 0, 1,
-0.5914969, 0.1159588, -0.9845687, 0.3215686, 1, 0, 1,
-0.5865645, 1.291639, -2.010413, 0.3137255, 1, 0, 1,
-0.5751263, 0.07965652, -1.658667, 0.3098039, 1, 0, 1,
-0.5723202, 0.744895, -0.5438541, 0.3019608, 1, 0, 1,
-0.5711312, -0.3037444, -1.279182, 0.2941177, 1, 0, 1,
-0.570066, -0.4656474, -4.494292, 0.2901961, 1, 0, 1,
-0.5662632, 0.4995291, -0.819582, 0.282353, 1, 0, 1,
-0.5622069, 0.156603, -1.530247, 0.2784314, 1, 0, 1,
-0.561834, -0.5800973, -1.706531, 0.2705882, 1, 0, 1,
-0.5600557, -1.016291, -4.411826, 0.2666667, 1, 0, 1,
-0.5576268, -1.85412, -1.43963, 0.2588235, 1, 0, 1,
-0.5565575, -0.7973596, -2.984108, 0.254902, 1, 0, 1,
-0.555541, -0.1182027, -0.4484907, 0.2470588, 1, 0, 1,
-0.5537688, 0.7392925, 0.9385537, 0.2431373, 1, 0, 1,
-0.5474575, 0.02553636, -3.160041, 0.2352941, 1, 0, 1,
-0.54197, -1.19045, -2.985839, 0.2313726, 1, 0, 1,
-0.5384452, -0.2137413, -2.808655, 0.2235294, 1, 0, 1,
-0.5258155, -0.9787787, -2.544884, 0.2196078, 1, 0, 1,
-0.5248256, -0.5721461, -2.939726, 0.2117647, 1, 0, 1,
-0.5226088, -1.156425, -1.946275, 0.2078431, 1, 0, 1,
-0.5225954, -0.2877291, -3.437693, 0.2, 1, 0, 1,
-0.5219654, -0.5477553, -1.303905, 0.1921569, 1, 0, 1,
-0.5169924, 0.03161832, -0.8552866, 0.1882353, 1, 0, 1,
-0.5163342, 1.299733, 0.6421263, 0.1803922, 1, 0, 1,
-0.5064712, 0.6706955, 0.1264856, 0.1764706, 1, 0, 1,
-0.5054262, -0.7297656, -3.095837, 0.1686275, 1, 0, 1,
-0.496613, 0.5546018, -1.20147, 0.1647059, 1, 0, 1,
-0.4947821, 2.09526, 0.6754968, 0.1568628, 1, 0, 1,
-0.4946636, 0.4511015, -1.927414, 0.1529412, 1, 0, 1,
-0.493392, 1.343948, -0.3746195, 0.145098, 1, 0, 1,
-0.4893148, 0.7805293, -0.7553424, 0.1411765, 1, 0, 1,
-0.4880395, -0.4590933, -1.705025, 0.1333333, 1, 0, 1,
-0.485992, -0.4897754, -2.642838, 0.1294118, 1, 0, 1,
-0.485221, -0.1568526, -2.171373, 0.1215686, 1, 0, 1,
-0.4774162, -2.251521, -4.47415, 0.1176471, 1, 0, 1,
-0.4764804, 1.523587, 0.5512037, 0.1098039, 1, 0, 1,
-0.4753874, -0.5499085, -2.344456, 0.1058824, 1, 0, 1,
-0.4712665, 0.7478573, -0.5510547, 0.09803922, 1, 0, 1,
-0.4670896, -0.8356028, -1.20741, 0.09019608, 1, 0, 1,
-0.4640377, 0.3422558, 0.07088726, 0.08627451, 1, 0, 1,
-0.4593892, 0.6538364, 0.5513109, 0.07843138, 1, 0, 1,
-0.4589517, -0.7742545, -3.061114, 0.07450981, 1, 0, 1,
-0.45644, 1.422228, -1.770682, 0.06666667, 1, 0, 1,
-0.4530572, -0.3697479, -3.29948, 0.0627451, 1, 0, 1,
-0.4527389, 0.367129, -0.860096, 0.05490196, 1, 0, 1,
-0.4514916, -0.6668435, -3.48303, 0.05098039, 1, 0, 1,
-0.4433502, 1.537477, -0.5144709, 0.04313726, 1, 0, 1,
-0.4426343, 0.3808214, -0.1235786, 0.03921569, 1, 0, 1,
-0.4405958, 0.2460211, -1.194339, 0.03137255, 1, 0, 1,
-0.4297375, 1.103726, -1.569018, 0.02745098, 1, 0, 1,
-0.429618, 0.131393, 0.1751741, 0.01960784, 1, 0, 1,
-0.4278295, 1.10154, -1.267851, 0.01568628, 1, 0, 1,
-0.4207504, -1.674242, -2.471687, 0.007843138, 1, 0, 1,
-0.4205289, -1.700758, -2.910631, 0.003921569, 1, 0, 1,
-0.4199843, 1.857354, -0.961619, 0, 1, 0.003921569, 1,
-0.4153349, -2.335532, -0.7722273, 0, 1, 0.01176471, 1,
-0.4150456, 0.1036077, -0.5781161, 0, 1, 0.01568628, 1,
-0.4145384, 0.8990648, -0.6976331, 0, 1, 0.02352941, 1,
-0.4095221, 0.3211053, -1.370897, 0, 1, 0.02745098, 1,
-0.4008495, 2.037059, 1.158343, 0, 1, 0.03529412, 1,
-0.3992299, -1.271956, -3.843926, 0, 1, 0.03921569, 1,
-0.3989468, -0.6498089, -3.458369, 0, 1, 0.04705882, 1,
-0.3974438, -0.8694271, -1.221161, 0, 1, 0.05098039, 1,
-0.3928252, 0.2420688, -0.7606966, 0, 1, 0.05882353, 1,
-0.3868274, 0.7777286, -2.246957, 0, 1, 0.0627451, 1,
-0.3809915, 2.285025, 1.429618, 0, 1, 0.07058824, 1,
-0.3801092, 0.3496316, -1.414976, 0, 1, 0.07450981, 1,
-0.378438, 1.078758, -1.182181, 0, 1, 0.08235294, 1,
-0.3777058, 1.441368, 0.3307016, 0, 1, 0.08627451, 1,
-0.3759406, -0.3793739, -2.923301, 0, 1, 0.09411765, 1,
-0.3739258, 0.5714027, -1.124848, 0, 1, 0.1019608, 1,
-0.3705037, -2.395805, -3.531092, 0, 1, 0.1058824, 1,
-0.3585885, -2.12944, -2.604906, 0, 1, 0.1137255, 1,
-0.3548258, -0.1757301, -1.055739, 0, 1, 0.1176471, 1,
-0.354472, 0.3648484, -2.023392, 0, 1, 0.1254902, 1,
-0.3524561, 2.667247, -0.2668037, 0, 1, 0.1294118, 1,
-0.3510213, -0.78907, -4.089972, 0, 1, 0.1372549, 1,
-0.3508789, 1.214031, -0.1837786, 0, 1, 0.1411765, 1,
-0.3476329, -0.2133934, -2.296995, 0, 1, 0.1490196, 1,
-0.3459587, -0.5958707, -1.762641, 0, 1, 0.1529412, 1,
-0.3441918, 0.7077757, 0.0139876, 0, 1, 0.1607843, 1,
-0.3431828, -0.2631575, -1.910697, 0, 1, 0.1647059, 1,
-0.3411385, 0.09831861, -0.8442191, 0, 1, 0.172549, 1,
-0.3314813, 0.1823984, -0.1280524, 0, 1, 0.1764706, 1,
-0.3281784, 0.944837, -2.111918, 0, 1, 0.1843137, 1,
-0.3268283, 0.2034301, -1.363733, 0, 1, 0.1882353, 1,
-0.3189887, -0.3085797, -2.348477, 0, 1, 0.1960784, 1,
-0.3185445, -1.097891, -3.147286, 0, 1, 0.2039216, 1,
-0.3183887, -1.896424, -1.500957, 0, 1, 0.2078431, 1,
-0.3183405, 0.3862915, -1.141379, 0, 1, 0.2156863, 1,
-0.3091269, 0.429455, 1.275901, 0, 1, 0.2196078, 1,
-0.3090871, -1.486916, -2.451369, 0, 1, 0.227451, 1,
-0.3078157, 1.20214, -0.2797645, 0, 1, 0.2313726, 1,
-0.3041642, 0.412131, -0.6385265, 0, 1, 0.2392157, 1,
-0.3005274, -0.6054879, -3.13922, 0, 1, 0.2431373, 1,
-0.2997249, 0.8509194, -1.608216, 0, 1, 0.2509804, 1,
-0.2920028, -0.5747508, -2.751383, 0, 1, 0.254902, 1,
-0.2915188, 0.2979378, 0.2003712, 0, 1, 0.2627451, 1,
-0.2911018, 0.4195133, -0.5194539, 0, 1, 0.2666667, 1,
-0.2910387, 0.2970163, -0.09867078, 0, 1, 0.2745098, 1,
-0.286809, -0.4604072, -2.855653, 0, 1, 0.2784314, 1,
-0.2784384, 0.4086328, 1.230757, 0, 1, 0.2862745, 1,
-0.2730226, -0.3262399, -2.475066, 0, 1, 0.2901961, 1,
-0.2667345, -0.4551854, -2.541501, 0, 1, 0.2980392, 1,
-0.2635384, -1.030746, -2.749161, 0, 1, 0.3058824, 1,
-0.2570395, 0.04302554, -0.1323141, 0, 1, 0.3098039, 1,
-0.2562755, 0.1885691, -2.732175, 0, 1, 0.3176471, 1,
-0.2498688, 0.3588845, 0.09812422, 0, 1, 0.3215686, 1,
-0.2468556, -1.478715, -3.532903, 0, 1, 0.3294118, 1,
-0.2386716, 0.2936633, -0.9104886, 0, 1, 0.3333333, 1,
-0.2371184, 2.362054, -0.3313367, 0, 1, 0.3411765, 1,
-0.2361332, -0.1471125, -2.585784, 0, 1, 0.345098, 1,
-0.2350695, 0.1542495, -4.722589, 0, 1, 0.3529412, 1,
-0.2278542, 0.7572668, -0.4656071, 0, 1, 0.3568628, 1,
-0.2274785, 0.9984273, 0.171645, 0, 1, 0.3647059, 1,
-0.2254798, 0.02162022, -2.560909, 0, 1, 0.3686275, 1,
-0.2236774, -0.9714046, -3.150301, 0, 1, 0.3764706, 1,
-0.2203271, -1.307698, -3.102413, 0, 1, 0.3803922, 1,
-0.2197059, -1.112613, -3.044984, 0, 1, 0.3882353, 1,
-0.2165443, -1.891883, -2.602551, 0, 1, 0.3921569, 1,
-0.2162295, 0.4728139, -2.343533, 0, 1, 0.4, 1,
-0.2157782, -2.252141, -5.584833, 0, 1, 0.4078431, 1,
-0.2098279, -1.242797, -0.8725891, 0, 1, 0.4117647, 1,
-0.2067253, -0.1916037, -1.575897, 0, 1, 0.4196078, 1,
-0.2047809, 1.552672, 2.498039, 0, 1, 0.4235294, 1,
-0.2023099, 1.359705, -0.7699628, 0, 1, 0.4313726, 1,
-0.1994814, 1.28678, 0.05977347, 0, 1, 0.4352941, 1,
-0.1934032, -1.184674, -2.436692, 0, 1, 0.4431373, 1,
-0.1904584, 0.7203936, -0.5169172, 0, 1, 0.4470588, 1,
-0.1866518, 1.002588, -0.4489949, 0, 1, 0.454902, 1,
-0.1851497, -1.170395, -3.866537, 0, 1, 0.4588235, 1,
-0.1831672, 1.173878, -0.7251796, 0, 1, 0.4666667, 1,
-0.1806854, -0.1935111, -0.2502748, 0, 1, 0.4705882, 1,
-0.17991, 2.019581, -1.035914, 0, 1, 0.4784314, 1,
-0.1733549, 1.792215, 1.702953, 0, 1, 0.4823529, 1,
-0.1723367, 1.836351, -1.055035, 0, 1, 0.4901961, 1,
-0.1682226, 2.249797, 0.8765502, 0, 1, 0.4941176, 1,
-0.167525, -1.854569, -3.029079, 0, 1, 0.5019608, 1,
-0.1647863, -0.6052012, -3.252235, 0, 1, 0.509804, 1,
-0.1640468, 1.00716, -1.225001, 0, 1, 0.5137255, 1,
-0.1624824, 0.46335, -0.7812845, 0, 1, 0.5215687, 1,
-0.1605102, 1.120791, -0.78904, 0, 1, 0.5254902, 1,
-0.160019, -0.1089582, -2.222446, 0, 1, 0.5333334, 1,
-0.1579826, 0.3367379, -0.02233828, 0, 1, 0.5372549, 1,
-0.154488, -0.4561358, -1.404379, 0, 1, 0.5450981, 1,
-0.1440594, -0.3844481, -1.927906, 0, 1, 0.5490196, 1,
-0.1412023, 0.1452052, -2.405974, 0, 1, 0.5568628, 1,
-0.1375646, -0.8982308, -2.867883, 0, 1, 0.5607843, 1,
-0.132688, 2.342388, 0.8918085, 0, 1, 0.5686275, 1,
-0.1326105, -0.3144631, -3.749949, 0, 1, 0.572549, 1,
-0.1313338, 1.301081, 0.7758788, 0, 1, 0.5803922, 1,
-0.1301069, -0.3283859, -4.037971, 0, 1, 0.5843138, 1,
-0.1283961, -1.66461, -2.476229, 0, 1, 0.5921569, 1,
-0.1270743, 0.1904661, -1.17073, 0, 1, 0.5960785, 1,
-0.1205857, 0.4497805, -1.357196, 0, 1, 0.6039216, 1,
-0.1157792, 1.089808, -1.12145, 0, 1, 0.6117647, 1,
-0.1143936, 2.664488, -0.1737913, 0, 1, 0.6156863, 1,
-0.1126093, 0.9540942, 0.2465689, 0, 1, 0.6235294, 1,
-0.1087676, -0.318677, -4.416409, 0, 1, 0.627451, 1,
-0.1086873, -0.1499851, -2.310436, 0, 1, 0.6352941, 1,
-0.105932, 1.03657, -0.8444237, 0, 1, 0.6392157, 1,
-0.1041059, -1.710628, -3.072048, 0, 1, 0.6470588, 1,
-0.1017092, 0.5161731, 2.190319, 0, 1, 0.6509804, 1,
-0.1013787, -0.5359311, -1.95826, 0, 1, 0.6588235, 1,
-0.09905881, 0.6036702, -0.8181548, 0, 1, 0.6627451, 1,
-0.09898385, -0.9107738, -3.039751, 0, 1, 0.6705883, 1,
-0.09105149, -0.7447188, -3.847484, 0, 1, 0.6745098, 1,
-0.08728852, 1.653024, 0.6938475, 0, 1, 0.682353, 1,
-0.08447203, -1.088243, -3.602818, 0, 1, 0.6862745, 1,
-0.08302893, -0.9840955, -4.271963, 0, 1, 0.6941177, 1,
-0.08275283, 1.498621, 0.5620706, 0, 1, 0.7019608, 1,
-0.08234752, -0.3926327, -2.801825, 0, 1, 0.7058824, 1,
-0.08023376, 1.338226, -0.4397404, 0, 1, 0.7137255, 1,
-0.07789803, -1.408507, -3.951962, 0, 1, 0.7176471, 1,
-0.07455969, -2.459381, -4.908804, 0, 1, 0.7254902, 1,
-0.07452357, 0.4554579, -1.252968, 0, 1, 0.7294118, 1,
-0.07195497, -0.1682733, -3.869405, 0, 1, 0.7372549, 1,
-0.07081228, 0.3303907, 0.3767886, 0, 1, 0.7411765, 1,
-0.06962342, 0.05926227, -1.224542, 0, 1, 0.7490196, 1,
-0.06852643, -0.6191374, -2.784581, 0, 1, 0.7529412, 1,
-0.06130254, 0.07691883, -0.4808728, 0, 1, 0.7607843, 1,
-0.05734813, 0.6787809, 1.592766, 0, 1, 0.7647059, 1,
-0.0564151, -0.09539915, -3.10825, 0, 1, 0.772549, 1,
-0.0556333, 0.6171508, 0.3504696, 0, 1, 0.7764706, 1,
-0.05355535, 0.5047969, 1.460841, 0, 1, 0.7843137, 1,
-0.04431999, -0.4313406, -3.325859, 0, 1, 0.7882353, 1,
-0.04109347, 0.4606165, -1.110257, 0, 1, 0.7960784, 1,
-0.03963818, -0.4782332, -4.762354, 0, 1, 0.8039216, 1,
-0.03284324, 0.7258677, -1.140742, 0, 1, 0.8078431, 1,
-0.0289469, -0.14008, -4.898025, 0, 1, 0.8156863, 1,
-0.02565824, -0.411212, -2.580902, 0, 1, 0.8196079, 1,
-0.02371086, -1.872072, -4.26587, 0, 1, 0.827451, 1,
-0.02333016, -1.236421, -2.011176, 0, 1, 0.8313726, 1,
-0.02326665, -1.037425, -3.772505, 0, 1, 0.8392157, 1,
-0.02309758, 1.012902, 1.238652, 0, 1, 0.8431373, 1,
-0.02306948, 0.05535503, -0.07381203, 0, 1, 0.8509804, 1,
-0.01746174, -0.5200257, -1.829529, 0, 1, 0.854902, 1,
-0.01342841, 0.04338085, -0.214289, 0, 1, 0.8627451, 1,
-0.01341941, -0.4413055, -2.293126, 0, 1, 0.8666667, 1,
-0.004339104, -0.8725156, -2.529503, 0, 1, 0.8745098, 1,
-0.003559025, 0.5522953, 0.3069897, 0, 1, 0.8784314, 1,
-0.003096115, -0.3059938, -3.347633, 0, 1, 0.8862745, 1,
-0.002634377, -0.05196602, -3.524186, 0, 1, 0.8901961, 1,
-0.00256796, 0.04669579, 0.7262844, 0, 1, 0.8980392, 1,
-0.0006023276, -1.291753, -1.982981, 0, 1, 0.9058824, 1,
0.005692727, 0.9134609, 1.488182, 0, 1, 0.9098039, 1,
0.01061868, -0.2998805, 3.163859, 0, 1, 0.9176471, 1,
0.01643359, -1.500752, 3.413266, 0, 1, 0.9215686, 1,
0.01828947, -1.878431, 2.157905, 0, 1, 0.9294118, 1,
0.02327312, -1.912728, 3.17153, 0, 1, 0.9333333, 1,
0.02784085, -1.871437, 4.038384, 0, 1, 0.9411765, 1,
0.03261911, 0.3014686, 0.3210593, 0, 1, 0.945098, 1,
0.03814613, -0.1523051, 2.858914, 0, 1, 0.9529412, 1,
0.03962283, 0.5778447, -0.6822528, 0, 1, 0.9568627, 1,
0.04444545, 0.9514607, 0.8906596, 0, 1, 0.9647059, 1,
0.04680078, 0.03322799, 0.3202614, 0, 1, 0.9686275, 1,
0.04745634, 0.08348732, 0.7117162, 0, 1, 0.9764706, 1,
0.04763676, -0.324043, 3.509777, 0, 1, 0.9803922, 1,
0.0496674, 1.012693, -1.290125, 0, 1, 0.9882353, 1,
0.04997071, -0.6388164, 3.577998, 0, 1, 0.9921569, 1,
0.05060928, -0.2005333, 3.773295, 0, 1, 1, 1,
0.05305238, -0.1845828, 0.3125651, 0, 0.9921569, 1, 1,
0.05555344, -1.523118, 2.68161, 0, 0.9882353, 1, 1,
0.05655616, 0.3778886, -0.8845106, 0, 0.9803922, 1, 1,
0.06182913, 1.24828, 0.9330758, 0, 0.9764706, 1, 1,
0.06210554, 1.10349, 0.2611108, 0, 0.9686275, 1, 1,
0.06580159, -1.074058, 2.682686, 0, 0.9647059, 1, 1,
0.06738241, -0.8933685, 2.63357, 0, 0.9568627, 1, 1,
0.0682508, 0.2374464, 0.118293, 0, 0.9529412, 1, 1,
0.073099, 1.499463, -0.08351716, 0, 0.945098, 1, 1,
0.07500081, 0.1057251, 1.410346, 0, 0.9411765, 1, 1,
0.07653277, 0.8828849, 0.2483257, 0, 0.9333333, 1, 1,
0.07715435, -1.185718, 5.033809, 0, 0.9294118, 1, 1,
0.07752357, -1.537972, 3.392796, 0, 0.9215686, 1, 1,
0.07889488, -0.9951594, 1.52606, 0, 0.9176471, 1, 1,
0.08032454, -0.3911887, 3.162578, 0, 0.9098039, 1, 1,
0.08176742, 0.7126703, 0.2335048, 0, 0.9058824, 1, 1,
0.0818822, -0.3506443, 3.508073, 0, 0.8980392, 1, 1,
0.08201115, -0.5107494, 4.000884, 0, 0.8901961, 1, 1,
0.09212224, 0.032449, 1.114256, 0, 0.8862745, 1, 1,
0.09376089, -0.4591244, 4.017162, 0, 0.8784314, 1, 1,
0.09386384, 0.2596838, -0.6046348, 0, 0.8745098, 1, 1,
0.09543573, -0.6706288, 2.739501, 0, 0.8666667, 1, 1,
0.09551821, -1.120279, 2.06027, 0, 0.8627451, 1, 1,
0.1030481, 0.8663689, -0.3069341, 0, 0.854902, 1, 1,
0.1032472, -1.815391, 3.361872, 0, 0.8509804, 1, 1,
0.1043909, -1.625589, 3.098715, 0, 0.8431373, 1, 1,
0.1045335, 1.713041, -0.09828532, 0, 0.8392157, 1, 1,
0.1049548, 0.2798657, 2.065938, 0, 0.8313726, 1, 1,
0.1093498, 1.586648, 0.04213711, 0, 0.827451, 1, 1,
0.1101069, 0.7438779, -0.5887187, 0, 0.8196079, 1, 1,
0.1140091, 1.526391, 0.9870765, 0, 0.8156863, 1, 1,
0.1170069, -1.047303, 5.290731, 0, 0.8078431, 1, 1,
0.1185545, 0.5254829, 1.110929, 0, 0.8039216, 1, 1,
0.1192061, 0.3226939, 0.66083, 0, 0.7960784, 1, 1,
0.1205738, -0.3540209, 3.153498, 0, 0.7882353, 1, 1,
0.1236471, -1.469515, 3.869387, 0, 0.7843137, 1, 1,
0.1260269, 0.1601524, 0.7334971, 0, 0.7764706, 1, 1,
0.1268534, -0.5428, 2.753199, 0, 0.772549, 1, 1,
0.1275521, 0.2076234, -0.04134353, 0, 0.7647059, 1, 1,
0.1299015, 0.1122867, 1.337011, 0, 0.7607843, 1, 1,
0.1309115, 0.5514593, -0.6544197, 0, 0.7529412, 1, 1,
0.1313802, 0.4968248, 1.563058, 0, 0.7490196, 1, 1,
0.1392886, -0.7086716, 2.766669, 0, 0.7411765, 1, 1,
0.1400076, -2.887637, 3.915966, 0, 0.7372549, 1, 1,
0.1411525, 0.8917821, -0.7403415, 0, 0.7294118, 1, 1,
0.141257, -0.4251064, 4.109024, 0, 0.7254902, 1, 1,
0.1421011, -1.14441, 3.22135, 0, 0.7176471, 1, 1,
0.1435665, -0.7207718, 4.646434, 0, 0.7137255, 1, 1,
0.1456186, 0.821802, 0.4046218, 0, 0.7058824, 1, 1,
0.145726, -0.2672557, 5.329548, 0, 0.6980392, 1, 1,
0.1460228, -0.1285205, 1.687738, 0, 0.6941177, 1, 1,
0.1464897, -0.8875214, 2.050258, 0, 0.6862745, 1, 1,
0.1475869, 0.05416326, 2.709804, 0, 0.682353, 1, 1,
0.1499053, 1.137104, -0.296639, 0, 0.6745098, 1, 1,
0.1503943, 0.8867177, 0.5253531, 0, 0.6705883, 1, 1,
0.1511671, 0.3828736, -0.1631516, 0, 0.6627451, 1, 1,
0.1516331, 0.5479609, -1.16336, 0, 0.6588235, 1, 1,
0.1564206, 1.016109, -0.3152559, 0, 0.6509804, 1, 1,
0.1565093, 0.3910935, 0.881997, 0, 0.6470588, 1, 1,
0.1574407, 0.9211751, 0.0246224, 0, 0.6392157, 1, 1,
0.1587082, -1.43752, 4.455788, 0, 0.6352941, 1, 1,
0.1607187, 0.1439284, 1.982626, 0, 0.627451, 1, 1,
0.1618266, 1.167328, -0.7805492, 0, 0.6235294, 1, 1,
0.1620519, 1.114622, 1.881322, 0, 0.6156863, 1, 1,
0.1634476, -0.8731833, 2.73948, 0, 0.6117647, 1, 1,
0.1714506, -0.7672114, 3.805299, 0, 0.6039216, 1, 1,
0.1738497, -0.09334122, 2.277711, 0, 0.5960785, 1, 1,
0.1745678, -0.7817618, 2.637539, 0, 0.5921569, 1, 1,
0.1750658, -1.167722, 3.539486, 0, 0.5843138, 1, 1,
0.1764196, 0.2405262, 1.017028, 0, 0.5803922, 1, 1,
0.1769179, 0.8615535, 0.3256981, 0, 0.572549, 1, 1,
0.1772662, -0.1026425, 3.455872, 0, 0.5686275, 1, 1,
0.1874087, 0.1285686, 3.501033, 0, 0.5607843, 1, 1,
0.1891492, -0.241889, 1.949737, 0, 0.5568628, 1, 1,
0.1911293, 1.580072, 0.35761, 0, 0.5490196, 1, 1,
0.192587, 0.5379956, 2.62329, 0, 0.5450981, 1, 1,
0.1926541, 0.1311542, 1.252297, 0, 0.5372549, 1, 1,
0.1933794, 1.427242, 0.5246423, 0, 0.5333334, 1, 1,
0.1973214, 0.7000275, 1.205706, 0, 0.5254902, 1, 1,
0.2007176, 0.6164836, 0.4398835, 0, 0.5215687, 1, 1,
0.2131014, -1.894768, 3.006184, 0, 0.5137255, 1, 1,
0.2151147, 0.3262385, 0.8779198, 0, 0.509804, 1, 1,
0.2159256, -0.8291184, 1.807266, 0, 0.5019608, 1, 1,
0.2175985, 0.3444175, 0.7071396, 0, 0.4941176, 1, 1,
0.2185078, -0.3857951, 3.673067, 0, 0.4901961, 1, 1,
0.2190638, 1.054902, -1.972774, 0, 0.4823529, 1, 1,
0.2200572, -0.2161866, 2.757184, 0, 0.4784314, 1, 1,
0.22036, 1.51683, 0.4967529, 0, 0.4705882, 1, 1,
0.2221598, 0.2203284, 1.007599, 0, 0.4666667, 1, 1,
0.2238235, 1.050083, 0.407079, 0, 0.4588235, 1, 1,
0.2255457, 1.191883, -1.744761, 0, 0.454902, 1, 1,
0.22566, 0.3713523, 0.1329044, 0, 0.4470588, 1, 1,
0.2261436, 1.204088, -0.9508654, 0, 0.4431373, 1, 1,
0.2265483, 0.6345627, 1.202116, 0, 0.4352941, 1, 1,
0.2272328, 0.6324691, 1.725527, 0, 0.4313726, 1, 1,
0.2275046, -0.7318043, 1.611012, 0, 0.4235294, 1, 1,
0.2304749, 0.09012661, 2.112486, 0, 0.4196078, 1, 1,
0.2322624, -0.1288909, 0.4882783, 0, 0.4117647, 1, 1,
0.2337528, -0.157763, 1.777731, 0, 0.4078431, 1, 1,
0.2342512, 0.6058042, 0.5217663, 0, 0.4, 1, 1,
0.2370633, 0.2090892, -0.09119868, 0, 0.3921569, 1, 1,
0.2379706, -0.8607012, 1.594679, 0, 0.3882353, 1, 1,
0.2447404, 0.7516703, 0.2548422, 0, 0.3803922, 1, 1,
0.2450819, 0.4419701, -1.307905, 0, 0.3764706, 1, 1,
0.254844, -0.6878269, 2.659803, 0, 0.3686275, 1, 1,
0.2562228, -1.12865, 2.337141, 0, 0.3647059, 1, 1,
0.2567935, 0.08838078, 0.6979052, 0, 0.3568628, 1, 1,
0.2573002, -0.4221019, 2.120382, 0, 0.3529412, 1, 1,
0.2637911, 0.6739321, 0.5673194, 0, 0.345098, 1, 1,
0.2643177, -2.738111, 3.196912, 0, 0.3411765, 1, 1,
0.2679668, 1.78301, 0.5969189, 0, 0.3333333, 1, 1,
0.2725159, 0.9297855, 1.564361, 0, 0.3294118, 1, 1,
0.2754409, 0.9549925, 1.79345, 0, 0.3215686, 1, 1,
0.2766816, -1.210672, 1.71448, 0, 0.3176471, 1, 1,
0.2768935, -0.7837518, 0.07564058, 0, 0.3098039, 1, 1,
0.2777756, -0.8138217, 1.084571, 0, 0.3058824, 1, 1,
0.2788367, 0.135041, 0.09669179, 0, 0.2980392, 1, 1,
0.2819966, 0.3500449, 1.224639, 0, 0.2901961, 1, 1,
0.288197, -0.8326547, 3.811217, 0, 0.2862745, 1, 1,
0.289985, -1.218983, 2.110173, 0, 0.2784314, 1, 1,
0.2949849, -1.181281, 2.975103, 0, 0.2745098, 1, 1,
0.2966842, -0.4550557, 2.456589, 0, 0.2666667, 1, 1,
0.3055523, -0.7603403, 2.87654, 0, 0.2627451, 1, 1,
0.3066469, 0.07126777, 1.874368, 0, 0.254902, 1, 1,
0.3070102, 1.28503, 0.4119011, 0, 0.2509804, 1, 1,
0.3089731, 1.510084, -0.1502957, 0, 0.2431373, 1, 1,
0.3134268, -0.912183, 3.138634, 0, 0.2392157, 1, 1,
0.314207, -0.07585631, 0.9614978, 0, 0.2313726, 1, 1,
0.3209384, 0.1711697, -0.3286569, 0, 0.227451, 1, 1,
0.3266004, -0.0580222, 3.224612, 0, 0.2196078, 1, 1,
0.3269488, -1.152152, 4.403649, 0, 0.2156863, 1, 1,
0.3299428, 0.4557916, 1.105013, 0, 0.2078431, 1, 1,
0.3324001, -0.8445543, 2.748882, 0, 0.2039216, 1, 1,
0.3356897, 0.896982, 0.5403259, 0, 0.1960784, 1, 1,
0.3357766, 0.1304283, 0.4003381, 0, 0.1882353, 1, 1,
0.3373445, 0.1803048, 1.516742, 0, 0.1843137, 1, 1,
0.3401585, 0.5361725, 0.4293112, 0, 0.1764706, 1, 1,
0.3403309, 0.08132572, -0.3221563, 0, 0.172549, 1, 1,
0.3428076, 1.131226, 1.812705, 0, 0.1647059, 1, 1,
0.3461521, -1.213357, 3.080662, 0, 0.1607843, 1, 1,
0.3480292, 2.687093, 0.8399101, 0, 0.1529412, 1, 1,
0.3483394, 1.639436, -0.4947846, 0, 0.1490196, 1, 1,
0.3542471, -0.4091883, 1.254702, 0, 0.1411765, 1, 1,
0.3594821, 1.886963, -1.189132, 0, 0.1372549, 1, 1,
0.3612428, 1.117722, -0.3645578, 0, 0.1294118, 1, 1,
0.3647247, -0.177212, 2.55, 0, 0.1254902, 1, 1,
0.3673303, 0.4179282, 1.302635, 0, 0.1176471, 1, 1,
0.3683925, -1.492367, 4.277403, 0, 0.1137255, 1, 1,
0.3684172, 0.9862713, -0.2753623, 0, 0.1058824, 1, 1,
0.369431, -1.198624, 1.592699, 0, 0.09803922, 1, 1,
0.3697562, -2.461435, 3.359693, 0, 0.09411765, 1, 1,
0.3703285, -0.04647961, 2.339571, 0, 0.08627451, 1, 1,
0.3715762, -0.2742715, 1.778068, 0, 0.08235294, 1, 1,
0.3730136, 1.59454, -0.1121233, 0, 0.07450981, 1, 1,
0.3783363, 1.406439, -0.0772469, 0, 0.07058824, 1, 1,
0.3805797, 0.4089742, 1.195707, 0, 0.0627451, 1, 1,
0.3832833, 0.4586883, 1.318356, 0, 0.05882353, 1, 1,
0.3842483, -0.4664588, 2.40681, 0, 0.05098039, 1, 1,
0.3854703, -0.2320223, 3.006906, 0, 0.04705882, 1, 1,
0.38619, 0.8370305, 1.301115, 0, 0.03921569, 1, 1,
0.3873664, -0.7544191, 1.668151, 0, 0.03529412, 1, 1,
0.3903491, -0.8428252, 3.501713, 0, 0.02745098, 1, 1,
0.3915422, -0.2655805, 2.448642, 0, 0.02352941, 1, 1,
0.3919123, -0.1293148, 2.445746, 0, 0.01568628, 1, 1,
0.3978503, -0.5557618, 2.656405, 0, 0.01176471, 1, 1,
0.4019771, -2.13377, 4.139497, 0, 0.003921569, 1, 1,
0.4085705, -0.970171, 3.488969, 0.003921569, 0, 1, 1,
0.4126792, 1.215621, 2.119346, 0.007843138, 0, 1, 1,
0.4164875, 0.8890311, -0.09662884, 0.01568628, 0, 1, 1,
0.4215312, 1.30486, -0.00965776, 0.01960784, 0, 1, 1,
0.4222934, 0.8210018, 0.1626617, 0.02745098, 0, 1, 1,
0.4275797, 0.8177692, 0.2031472, 0.03137255, 0, 1, 1,
0.4286225, -0.02586651, 1.27229, 0.03921569, 0, 1, 1,
0.4287127, 0.1634156, 0.8322716, 0.04313726, 0, 1, 1,
0.4289257, 0.6315374, -0.3126629, 0.05098039, 0, 1, 1,
0.4294609, 0.2463287, 0.07000723, 0.05490196, 0, 1, 1,
0.4376245, -0.4948574, 1.701861, 0.0627451, 0, 1, 1,
0.4379717, 1.007656, -1.026969, 0.06666667, 0, 1, 1,
0.4386269, 0.8295143, 1.060226, 0.07450981, 0, 1, 1,
0.4409723, -0.3782988, 2.701988, 0.07843138, 0, 1, 1,
0.4453645, 0.5534923, -0.5304729, 0.08627451, 0, 1, 1,
0.4582852, 1.119425, 0.4122554, 0.09019608, 0, 1, 1,
0.4591484, -1.08771, 1.641218, 0.09803922, 0, 1, 1,
0.4611064, 0.3328368, 0.5900042, 0.1058824, 0, 1, 1,
0.4621872, 0.3611277, 0.9574413, 0.1098039, 0, 1, 1,
0.4630799, -0.5588439, 1.502133, 0.1176471, 0, 1, 1,
0.4650224, 1.247064, 1.249039, 0.1215686, 0, 1, 1,
0.4670719, 0.2645529, -0.1587953, 0.1294118, 0, 1, 1,
0.4694369, 2.783309, 0.4124714, 0.1333333, 0, 1, 1,
0.471139, -1.229198, 3.813635, 0.1411765, 0, 1, 1,
0.4715545, 1.197928, -0.2758199, 0.145098, 0, 1, 1,
0.4726281, -0.7654696, 2.037086, 0.1529412, 0, 1, 1,
0.4738187, 0.6914534, 2.450123, 0.1568628, 0, 1, 1,
0.4783883, -0.1557314, 1.310108, 0.1647059, 0, 1, 1,
0.479015, 0.7178453, 0.8677708, 0.1686275, 0, 1, 1,
0.4836545, -1.421715, 3.474559, 0.1764706, 0, 1, 1,
0.4837376, -1.29824, 4.612637, 0.1803922, 0, 1, 1,
0.4867924, -0.7007204, 3.015736, 0.1882353, 0, 1, 1,
0.4899638, 1.047618, 2.512292, 0.1921569, 0, 1, 1,
0.4906711, 1.026395, 1.733684, 0.2, 0, 1, 1,
0.492137, -1.214628, 5.601199, 0.2078431, 0, 1, 1,
0.4925, 1.084907, -0.4187779, 0.2117647, 0, 1, 1,
0.4934045, 0.4246862, 0.5095868, 0.2196078, 0, 1, 1,
0.4948897, 0.1533619, 0.579212, 0.2235294, 0, 1, 1,
0.4981525, -0.5121164, 2.844068, 0.2313726, 0, 1, 1,
0.4981579, -0.4205176, 2.831884, 0.2352941, 0, 1, 1,
0.4999818, 0.4809625, -0.3934115, 0.2431373, 0, 1, 1,
0.5081607, -0.9781128, 1.227656, 0.2470588, 0, 1, 1,
0.5090604, -0.1233098, 3.29379, 0.254902, 0, 1, 1,
0.509478, -0.405143, 2.229505, 0.2588235, 0, 1, 1,
0.5134404, -0.5417172, 2.689357, 0.2666667, 0, 1, 1,
0.5168012, 0.9092823, 2.314698, 0.2705882, 0, 1, 1,
0.518499, -0.165899, 1.354279, 0.2784314, 0, 1, 1,
0.519628, -1.202127, 2.742164, 0.282353, 0, 1, 1,
0.5233896, 0.3309967, 2.393387, 0.2901961, 0, 1, 1,
0.5235062, 0.9583213, -0.5292985, 0.2941177, 0, 1, 1,
0.525412, 0.4491301, -0.03258434, 0.3019608, 0, 1, 1,
0.5296702, -0.2981597, 2.807729, 0.3098039, 0, 1, 1,
0.5301655, 0.4384831, 2.696166, 0.3137255, 0, 1, 1,
0.5306522, -0.2209986, 0.46939, 0.3215686, 0, 1, 1,
0.5331748, 0.4615106, 0.5259749, 0.3254902, 0, 1, 1,
0.5340252, 0.06706114, 2.150301, 0.3333333, 0, 1, 1,
0.5386184, -1.061662, 2.001752, 0.3372549, 0, 1, 1,
0.5404648, 0.6294921, 1.018273, 0.345098, 0, 1, 1,
0.541541, 0.3800351, 0.6571876, 0.3490196, 0, 1, 1,
0.5443678, 0.1244143, 0.5113522, 0.3568628, 0, 1, 1,
0.5457264, 0.1583632, 1.031335, 0.3607843, 0, 1, 1,
0.5473676, -0.05854424, 2.315282, 0.3686275, 0, 1, 1,
0.5516723, -0.1202573, 1.184008, 0.372549, 0, 1, 1,
0.5541186, -0.9708212, 2.121253, 0.3803922, 0, 1, 1,
0.5592408, -0.6967434, 2.584884, 0.3843137, 0, 1, 1,
0.5632373, -0.7741902, 5.048177, 0.3921569, 0, 1, 1,
0.5632969, -0.5140778, 3.886844, 0.3960784, 0, 1, 1,
0.5640191, -1.827123, 4.3819, 0.4039216, 0, 1, 1,
0.5654846, 0.06015848, 2.948082, 0.4117647, 0, 1, 1,
0.5680754, 1.146321, -1.312243, 0.4156863, 0, 1, 1,
0.5682472, -0.9879671, 1.403536, 0.4235294, 0, 1, 1,
0.5721231, 1.081346, 0.6364734, 0.427451, 0, 1, 1,
0.573531, -1.466611, 2.485857, 0.4352941, 0, 1, 1,
0.5790196, -0.7260837, 3.031471, 0.4392157, 0, 1, 1,
0.5859354, -2.019531, 3.130614, 0.4470588, 0, 1, 1,
0.5881827, 1.753126, -0.6659898, 0.4509804, 0, 1, 1,
0.590513, -0.3771487, 1.755024, 0.4588235, 0, 1, 1,
0.5920509, -0.3288876, 2.281533, 0.4627451, 0, 1, 1,
0.5940073, 1.697738, 0.2012379, 0.4705882, 0, 1, 1,
0.5991709, -0.5828313, 2.403883, 0.4745098, 0, 1, 1,
0.6022406, -1.904889, 3.126392, 0.4823529, 0, 1, 1,
0.6088306, -1.450099, 4.191456, 0.4862745, 0, 1, 1,
0.6094961, 0.1493858, 2.773803, 0.4941176, 0, 1, 1,
0.6125197, 0.9468755, 0.7716051, 0.5019608, 0, 1, 1,
0.6188394, -2.459988, 1.182541, 0.5058824, 0, 1, 1,
0.619394, -0.3142111, 0.9975705, 0.5137255, 0, 1, 1,
0.6197834, 0.2158435, 1.083706, 0.5176471, 0, 1, 1,
0.6200573, -0.1599112, 2.057507, 0.5254902, 0, 1, 1,
0.6208041, -0.1318029, 1.621713, 0.5294118, 0, 1, 1,
0.6210187, -1.168472, 2.111931, 0.5372549, 0, 1, 1,
0.6234175, -1.412088, 3.962312, 0.5411765, 0, 1, 1,
0.6292176, 1.537933, -0.6078534, 0.5490196, 0, 1, 1,
0.6418567, 1.35602, 0.8783798, 0.5529412, 0, 1, 1,
0.6437087, 0.6181956, 1.345306, 0.5607843, 0, 1, 1,
0.6449097, -1.29763, 4.834841, 0.5647059, 0, 1, 1,
0.6469292, -1.81686, 2.190732, 0.572549, 0, 1, 1,
0.649106, -0.6993963, 2.470654, 0.5764706, 0, 1, 1,
0.6499702, 1.116017, -1.153941, 0.5843138, 0, 1, 1,
0.6568254, 1.31001, -1.2791, 0.5882353, 0, 1, 1,
0.6585195, -1.147343, 2.55587, 0.5960785, 0, 1, 1,
0.6611465, 0.8210195, 0.4976338, 0.6039216, 0, 1, 1,
0.6611857, 1.333238, 1.406458, 0.6078432, 0, 1, 1,
0.6642113, -1.01519, 3.213361, 0.6156863, 0, 1, 1,
0.6829931, -0.3694908, 2.765241, 0.6196079, 0, 1, 1,
0.6867124, -1.044221, 1.218721, 0.627451, 0, 1, 1,
0.6870131, 0.4434169, 0.9531642, 0.6313726, 0, 1, 1,
0.6881055, 0.9345722, 0.7982829, 0.6392157, 0, 1, 1,
0.7044807, 1.077015, 0.02823971, 0.6431373, 0, 1, 1,
0.7111442, 0.5159563, 0.4695587, 0.6509804, 0, 1, 1,
0.7191166, 0.4719993, 1.065041, 0.654902, 0, 1, 1,
0.7242939, 1.950366, 2.695659, 0.6627451, 0, 1, 1,
0.7303234, -1.319694, 2.404519, 0.6666667, 0, 1, 1,
0.7323891, 0.1381777, 3.227917, 0.6745098, 0, 1, 1,
0.734479, 0.008303649, 4.670411, 0.6784314, 0, 1, 1,
0.7375084, -2.214561, 1.209499, 0.6862745, 0, 1, 1,
0.7485279, 0.2750499, 2.05476, 0.6901961, 0, 1, 1,
0.7518552, 1.466679, -0.9807274, 0.6980392, 0, 1, 1,
0.7533318, -0.3006534, 2.904331, 0.7058824, 0, 1, 1,
0.7535574, 1.427585, 0.4802251, 0.7098039, 0, 1, 1,
0.7545587, 0.9433932, 1.257167, 0.7176471, 0, 1, 1,
0.7603424, -0.5799906, 2.671536, 0.7215686, 0, 1, 1,
0.7636688, 0.765924, 1.828611, 0.7294118, 0, 1, 1,
0.7665507, -1.305572, 3.595547, 0.7333333, 0, 1, 1,
0.7672122, -0.4643252, 2.007385, 0.7411765, 0, 1, 1,
0.7683788, 1.106545, 0.09072592, 0.7450981, 0, 1, 1,
0.7693852, 0.9393823, 0.4243163, 0.7529412, 0, 1, 1,
0.769825, 1.106689, -0.4040307, 0.7568628, 0, 1, 1,
0.7724234, 0.7369366, 0.5964509, 0.7647059, 0, 1, 1,
0.7768648, 1.307054, 0.8665107, 0.7686275, 0, 1, 1,
0.7787256, 1.380226, 1.181262, 0.7764706, 0, 1, 1,
0.7809397, -0.4960652, 2.627125, 0.7803922, 0, 1, 1,
0.7824979, -0.1122655, 2.740809, 0.7882353, 0, 1, 1,
0.788307, 0.3918019, 2.284463, 0.7921569, 0, 1, 1,
0.7905714, -0.4810697, 1.781037, 0.8, 0, 1, 1,
0.7913739, 1.001757, 1.094797, 0.8078431, 0, 1, 1,
0.7945291, -1.603086, 2.45126, 0.8117647, 0, 1, 1,
0.8156722, 0.6321965, 1.201259, 0.8196079, 0, 1, 1,
0.827395, -0.6486166, 2.367507, 0.8235294, 0, 1, 1,
0.8289231, -0.3903123, 2.869117, 0.8313726, 0, 1, 1,
0.8352721, 0.3094864, 1.83448, 0.8352941, 0, 1, 1,
0.8353249, 0.6332129, 1.842458, 0.8431373, 0, 1, 1,
0.8375927, 0.4484404, 0.925796, 0.8470588, 0, 1, 1,
0.8393986, -0.9436164, 4.176114, 0.854902, 0, 1, 1,
0.8404794, 1.815649, 0.4310611, 0.8588235, 0, 1, 1,
0.8429565, 0.9473736, -0.5691766, 0.8666667, 0, 1, 1,
0.8434524, -0.930057, 0.6618399, 0.8705882, 0, 1, 1,
0.846949, -0.312901, 0.9284053, 0.8784314, 0, 1, 1,
0.8500828, 0.06928609, 1.290671, 0.8823529, 0, 1, 1,
0.8608593, 0.9749995, 0.2365562, 0.8901961, 0, 1, 1,
0.8616591, 0.03927445, 0.5747896, 0.8941177, 0, 1, 1,
0.8630036, 0.7565593, 1.374081, 0.9019608, 0, 1, 1,
0.8643105, 0.4158908, 2.391088, 0.9098039, 0, 1, 1,
0.8669102, -1.995697, 1.38219, 0.9137255, 0, 1, 1,
0.8693057, 0.2713934, 2.075728, 0.9215686, 0, 1, 1,
0.8875797, -3.752273, 2.88563, 0.9254902, 0, 1, 1,
0.9014452, -0.4505172, 2.923559, 0.9333333, 0, 1, 1,
0.9049479, -0.8524139, 2.123043, 0.9372549, 0, 1, 1,
0.9059475, -1.808721, 1.547114, 0.945098, 0, 1, 1,
0.9059501, 1.834206, -0.8750801, 0.9490196, 0, 1, 1,
0.9078282, -0.9254217, 3.049054, 0.9568627, 0, 1, 1,
0.9134596, 0.459625, 1.191995, 0.9607843, 0, 1, 1,
0.922971, 1.388016, 2.838117, 0.9686275, 0, 1, 1,
0.9239706, 0.3409266, -0.4723954, 0.972549, 0, 1, 1,
0.9266184, 1.915431, -0.4789084, 0.9803922, 0, 1, 1,
0.9290159, -0.3407968, 3.076027, 0.9843137, 0, 1, 1,
0.9372839, 0.5378072, 1.082826, 0.9921569, 0, 1, 1,
0.9378993, 0.3903291, 2.614202, 0.9960784, 0, 1, 1,
0.9436215, 0.4668565, -0.1362659, 1, 0, 0.9960784, 1,
0.944695, -0.8136262, 3.134608, 1, 0, 0.9882353, 1,
0.9481074, 2.017967, -1.657381, 1, 0, 0.9843137, 1,
0.9517757, -0.1374314, 4.207982, 1, 0, 0.9764706, 1,
0.9575734, 1.764775, 0.2915963, 1, 0, 0.972549, 1,
0.9616603, -0.1169799, 1.564299, 1, 0, 0.9647059, 1,
0.9655087, 0.7591039, 2.342253, 1, 0, 0.9607843, 1,
0.9670312, 0.518277, -0.6919309, 1, 0, 0.9529412, 1,
0.9696912, -1.273099, 4.626131, 1, 0, 0.9490196, 1,
0.9703925, 1.239405, 0.08285283, 1, 0, 0.9411765, 1,
0.9716757, -1.095908, 3.748699, 1, 0, 0.9372549, 1,
0.9735308, -0.1335152, 1.744845, 1, 0, 0.9294118, 1,
0.9814157, 0.007843865, 1.202719, 1, 0, 0.9254902, 1,
0.9828244, 0.1267784, 1.40842, 1, 0, 0.9176471, 1,
0.9868786, 0.3087828, 1.762231, 1, 0, 0.9137255, 1,
0.990463, 1.088621, 1.428405, 1, 0, 0.9058824, 1,
0.9953505, -1.035023, 2.370366, 1, 0, 0.9019608, 1,
1.000414, 0.1772884, 0.1058375, 1, 0, 0.8941177, 1,
1.002859, -0.6442031, 1.492911, 1, 0, 0.8862745, 1,
1.002923, 0.5962564, 1.476693, 1, 0, 0.8823529, 1,
1.009181, 1.06804, 0.1132379, 1, 0, 0.8745098, 1,
1.014535, 0.3990512, 0.9736534, 1, 0, 0.8705882, 1,
1.020488, 2.090606, -0.1261054, 1, 0, 0.8627451, 1,
1.02337, 1.062606, 0.4292233, 1, 0, 0.8588235, 1,
1.026217, 1.079693, 0.5363709, 1, 0, 0.8509804, 1,
1.026361, -0.3642214, 1.701786, 1, 0, 0.8470588, 1,
1.02779, 1.123413, 0.4107351, 1, 0, 0.8392157, 1,
1.030398, 2.238759, 0.6696564, 1, 0, 0.8352941, 1,
1.030913, 0.09744754, 0.6395902, 1, 0, 0.827451, 1,
1.03199, -1.132253, 2.559815, 1, 0, 0.8235294, 1,
1.04255, 1.703917, 0.2250478, 1, 0, 0.8156863, 1,
1.047215, 0.03390993, 1.318173, 1, 0, 0.8117647, 1,
1.049854, 1.127466, -0.4233805, 1, 0, 0.8039216, 1,
1.061195, 1.187016, 1.148247, 1, 0, 0.7960784, 1,
1.071278, 0.1758331, 3.976734, 1, 0, 0.7921569, 1,
1.08114, 0.9922765, 0.1596778, 1, 0, 0.7843137, 1,
1.095062, 0.45912, 1.686656, 1, 0, 0.7803922, 1,
1.096045, -0.9908843, 3.287587, 1, 0, 0.772549, 1,
1.099092, 1.229048, 0.5368225, 1, 0, 0.7686275, 1,
1.102086, -0.4253565, 3.284669, 1, 0, 0.7607843, 1,
1.10467, -1.658858, 2.310713, 1, 0, 0.7568628, 1,
1.107359, -0.4250784, 2.75606, 1, 0, 0.7490196, 1,
1.125512, -1.041666, 3.460148, 1, 0, 0.7450981, 1,
1.127664, 0.7478929, 1.83089, 1, 0, 0.7372549, 1,
1.136769, 1.954195, 0.05685331, 1, 0, 0.7333333, 1,
1.141184, -0.8737429, 0.9564247, 1, 0, 0.7254902, 1,
1.144788, 1.254536, -0.4075266, 1, 0, 0.7215686, 1,
1.148117, -1.132056, 2.293047, 1, 0, 0.7137255, 1,
1.150478, -0.8680652, 0.966698, 1, 0, 0.7098039, 1,
1.152403, 0.001960913, 3.09065, 1, 0, 0.7019608, 1,
1.157916, -0.2242286, 0.8450712, 1, 0, 0.6941177, 1,
1.159898, 0.9987762, 0.525602, 1, 0, 0.6901961, 1,
1.168347, 0.565764, 1.052339, 1, 0, 0.682353, 1,
1.169406, 2.331507, 2.62349, 1, 0, 0.6784314, 1,
1.173955, 1.077332, 1.599123, 1, 0, 0.6705883, 1,
1.174082, 0.7967293, 2.119753, 1, 0, 0.6666667, 1,
1.179026, 1.084595, 2.163855, 1, 0, 0.6588235, 1,
1.179329, -0.0009382972, 1.822232, 1, 0, 0.654902, 1,
1.180845, -1.009167, 2.662645, 1, 0, 0.6470588, 1,
1.190259, -0.9941356, 1.05936, 1, 0, 0.6431373, 1,
1.198729, -0.5354294, 0.8884484, 1, 0, 0.6352941, 1,
1.202797, -0.5510818, 3.409242, 1, 0, 0.6313726, 1,
1.205627, 0.5105339, 0.09663501, 1, 0, 0.6235294, 1,
1.207042, -1.174042, 3.743041, 1, 0, 0.6196079, 1,
1.209091, 1.21111, 2.680553, 1, 0, 0.6117647, 1,
1.215393, 1.882627, 1.03502, 1, 0, 0.6078432, 1,
1.22351, -0.6426169, 2.981749, 1, 0, 0.6, 1,
1.230024, -0.1555736, 2.019262, 1, 0, 0.5921569, 1,
1.234024, 0.5740305, 2.76422, 1, 0, 0.5882353, 1,
1.236034, -0.1105449, 0.06469683, 1, 0, 0.5803922, 1,
1.242033, -1.914994, 2.935741, 1, 0, 0.5764706, 1,
1.243785, -0.7340099, 2.514712, 1, 0, 0.5686275, 1,
1.252949, -0.2776973, 1.407749, 1, 0, 0.5647059, 1,
1.25348, 0.07522728, 2.876717, 1, 0, 0.5568628, 1,
1.254075, 0.5407808, 1.913457, 1, 0, 0.5529412, 1,
1.255417, 0.5741379, 1.424507, 1, 0, 0.5450981, 1,
1.256478, 0.3200351, 1.716447, 1, 0, 0.5411765, 1,
1.261335, 0.1251353, 2.159009, 1, 0, 0.5333334, 1,
1.263066, -0.6561508, 2.806004, 1, 0, 0.5294118, 1,
1.263768, 0.006733814, 2.751414, 1, 0, 0.5215687, 1,
1.265492, 1.108035, 1.239014, 1, 0, 0.5176471, 1,
1.269535, -0.1392901, -0.6363893, 1, 0, 0.509804, 1,
1.278491, 0.5357193, 1.346307, 1, 0, 0.5058824, 1,
1.278958, 0.5007864, 0.9458289, 1, 0, 0.4980392, 1,
1.279537, 0.6397997, 1.69919, 1, 0, 0.4901961, 1,
1.2804, 0.2257495, 1.342286, 1, 0, 0.4862745, 1,
1.281888, -0.213778, 2.872076, 1, 0, 0.4784314, 1,
1.288387, -0.5382116, 2.463741, 1, 0, 0.4745098, 1,
1.290393, -0.6895131, 0.6522309, 1, 0, 0.4666667, 1,
1.296503, -0.2122077, 0.5964302, 1, 0, 0.4627451, 1,
1.302831, 0.0003127397, 1.780847, 1, 0, 0.454902, 1,
1.304238, -0.967113, 1.076809, 1, 0, 0.4509804, 1,
1.306014, -0.6528734, 1.473004, 1, 0, 0.4431373, 1,
1.315838, 0.6353276, 2.527326, 1, 0, 0.4392157, 1,
1.330996, 2.771652, -0.3148782, 1, 0, 0.4313726, 1,
1.350444, -1.199862, 1.375107, 1, 0, 0.427451, 1,
1.353253, -1.847538, 2.316575, 1, 0, 0.4196078, 1,
1.355656, 0.7937113, 0.7624913, 1, 0, 0.4156863, 1,
1.363894, -1.182213, 3.293343, 1, 0, 0.4078431, 1,
1.373512, -0.5960674, 1.994313, 1, 0, 0.4039216, 1,
1.378854, 0.6282352, 2.630039, 1, 0, 0.3960784, 1,
1.384606, -0.884874, 2.221367, 1, 0, 0.3882353, 1,
1.387141, -0.1923606, 2.205693, 1, 0, 0.3843137, 1,
1.391913, -0.5275125, 1.641324, 1, 0, 0.3764706, 1,
1.400484, -0.5605825, 0.9287269, 1, 0, 0.372549, 1,
1.404095, -0.7198573, 2.068111, 1, 0, 0.3647059, 1,
1.407263, 0.0924319, 1.428208, 1, 0, 0.3607843, 1,
1.416044, -1.765324, 2.14322, 1, 0, 0.3529412, 1,
1.433299, -0.279623, 1.724412, 1, 0, 0.3490196, 1,
1.447366, -0.253463, 1.593577, 1, 0, 0.3411765, 1,
1.453488, -0.08263361, 0.8287705, 1, 0, 0.3372549, 1,
1.457248, -0.335795, 2.62501, 1, 0, 0.3294118, 1,
1.48891, 0.9714904, 0.4794698, 1, 0, 0.3254902, 1,
1.491715, 0.4357848, 1.08108, 1, 0, 0.3176471, 1,
1.506131, -0.01914796, 2.040604, 1, 0, 0.3137255, 1,
1.511515, 1.11221, -1.354249, 1, 0, 0.3058824, 1,
1.51885, -0.7021341, 3.757909, 1, 0, 0.2980392, 1,
1.525975, -0.2536272, 2.586125, 1, 0, 0.2941177, 1,
1.529926, -0.4048287, -1.852884, 1, 0, 0.2862745, 1,
1.533882, 0.8674576, 1.636145, 1, 0, 0.282353, 1,
1.605178, 0.6220101, 0.1676689, 1, 0, 0.2745098, 1,
1.613295, -2.241241, 2.414538, 1, 0, 0.2705882, 1,
1.624631, -0.1741166, 1.276362, 1, 0, 0.2627451, 1,
1.626067, -0.4331951, 1.629567, 1, 0, 0.2588235, 1,
1.628139, -0.7907707, 4.803989, 1, 0, 0.2509804, 1,
1.631692, 1.814322, 1.612243, 1, 0, 0.2470588, 1,
1.633902, -0.1236943, 2.340649, 1, 0, 0.2392157, 1,
1.637118, -0.6211476, 0.4564566, 1, 0, 0.2352941, 1,
1.639174, 0.5810173, 0.2291901, 1, 0, 0.227451, 1,
1.658302, 1.05474, 0.4080025, 1, 0, 0.2235294, 1,
1.66362, -1.160918, 1.979215, 1, 0, 0.2156863, 1,
1.665657, -0.5702393, 1.538324, 1, 0, 0.2117647, 1,
1.67229, -1.125739, 0.0213596, 1, 0, 0.2039216, 1,
1.677838, -0.7413799, 2.466383, 1, 0, 0.1960784, 1,
1.69853, 0.08638401, 1.963127, 1, 0, 0.1921569, 1,
1.703577, -1.568072, 2.531842, 1, 0, 0.1843137, 1,
1.708107, -1.003668, 0.484644, 1, 0, 0.1803922, 1,
1.762291, -0.5056949, 0.9528559, 1, 0, 0.172549, 1,
1.785864, -1.0576, 0.4958985, 1, 0, 0.1686275, 1,
1.787157, 0.7515983, 2.240571, 1, 0, 0.1607843, 1,
1.81, 0.8871835, 1.586655, 1, 0, 0.1568628, 1,
1.863528, -0.9328493, 1.806692, 1, 0, 0.1490196, 1,
1.86522, 1.739015, 2.555926, 1, 0, 0.145098, 1,
1.877051, 1.89243, 2.489508, 1, 0, 0.1372549, 1,
1.923128, -0.3689165, 3.466446, 1, 0, 0.1333333, 1,
1.928499, 0.06212848, 2.216208, 1, 0, 0.1254902, 1,
1.941295, -1.482999, 3.108388, 1, 0, 0.1215686, 1,
1.971913, 1.218313, -0.2817342, 1, 0, 0.1137255, 1,
1.979167, -1.366346, 3.04813, 1, 0, 0.1098039, 1,
1.996052, 0.3901957, 1.144853, 1, 0, 0.1019608, 1,
2.004196, -0.939352, 1.04569, 1, 0, 0.09411765, 1,
2.026281, -0.5853244, 3.355938, 1, 0, 0.09019608, 1,
2.068072, 0.05444984, 2.074516, 1, 0, 0.08235294, 1,
2.073151, 1.991916, 0.530301, 1, 0, 0.07843138, 1,
2.157213, 0.1580241, 1.035946, 1, 0, 0.07058824, 1,
2.201576, -0.8340113, 0.6730748, 1, 0, 0.06666667, 1,
2.234488, 0.3989346, 2.021389, 1, 0, 0.05882353, 1,
2.279983, -0.4161706, 0.1767792, 1, 0, 0.05490196, 1,
2.304484, 1.522377, -0.06486471, 1, 0, 0.04705882, 1,
2.389014, -0.7658683, 1.040182, 1, 0, 0.04313726, 1,
2.501038, -0.1350914, 1.099406, 1, 0, 0.03529412, 1,
2.503734, -0.8926122, 1.808408, 1, 0, 0.03137255, 1,
2.532523, -1.456339, 4.911065, 1, 0, 0.02352941, 1,
2.536603, -0.9391932, 0.589201, 1, 0, 0.01960784, 1,
2.578032, -0.7822754, 0.343686, 1, 0, 0.01176471, 1,
3.177912, -0.1813778, 1.797419, 1, 0, 0.007843138, 1
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
0.1218872, -4.860054, -7.480865, 0, -0.5, 0.5, 0.5,
0.1218872, -4.860054, -7.480865, 1, -0.5, 0.5, 0.5,
0.1218872, -4.860054, -7.480865, 1, 1.5, 0.5, 0.5,
0.1218872, -4.860054, -7.480865, 0, 1.5, 0.5, 0.5
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
-3.97013, -0.4844822, -7.480865, 0, -0.5, 0.5, 0.5,
-3.97013, -0.4844822, -7.480865, 1, -0.5, 0.5, 0.5,
-3.97013, -0.4844822, -7.480865, 1, 1.5, 0.5, 0.5,
-3.97013, -0.4844822, -7.480865, 0, 1.5, 0.5, 0.5
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
-3.97013, -4.860054, 0.008183002, 0, -0.5, 0.5, 0.5,
-3.97013, -4.860054, 0.008183002, 1, -0.5, 0.5, 0.5,
-3.97013, -4.860054, 0.008183002, 1, 1.5, 0.5, 0.5,
-3.97013, -4.860054, 0.008183002, 0, 1.5, 0.5, 0.5
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
-2, -3.850307, -5.752624,
3, -3.850307, -5.752624,
-2, -3.850307, -5.752624,
-2, -4.018598, -6.040664,
-1, -3.850307, -5.752624,
-1, -4.018598, -6.040664,
0, -3.850307, -5.752624,
0, -4.018598, -6.040664,
1, -3.850307, -5.752624,
1, -4.018598, -6.040664,
2, -3.850307, -5.752624,
2, -4.018598, -6.040664,
3, -3.850307, -5.752624,
3, -4.018598, -6.040664
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
-2, -4.355181, -6.616745, 0, -0.5, 0.5, 0.5,
-2, -4.355181, -6.616745, 1, -0.5, 0.5, 0.5,
-2, -4.355181, -6.616745, 1, 1.5, 0.5, 0.5,
-2, -4.355181, -6.616745, 0, 1.5, 0.5, 0.5,
-1, -4.355181, -6.616745, 0, -0.5, 0.5, 0.5,
-1, -4.355181, -6.616745, 1, -0.5, 0.5, 0.5,
-1, -4.355181, -6.616745, 1, 1.5, 0.5, 0.5,
-1, -4.355181, -6.616745, 0, 1.5, 0.5, 0.5,
0, -4.355181, -6.616745, 0, -0.5, 0.5, 0.5,
0, -4.355181, -6.616745, 1, -0.5, 0.5, 0.5,
0, -4.355181, -6.616745, 1, 1.5, 0.5, 0.5,
0, -4.355181, -6.616745, 0, 1.5, 0.5, 0.5,
1, -4.355181, -6.616745, 0, -0.5, 0.5, 0.5,
1, -4.355181, -6.616745, 1, -0.5, 0.5, 0.5,
1, -4.355181, -6.616745, 1, 1.5, 0.5, 0.5,
1, -4.355181, -6.616745, 0, 1.5, 0.5, 0.5,
2, -4.355181, -6.616745, 0, -0.5, 0.5, 0.5,
2, -4.355181, -6.616745, 1, -0.5, 0.5, 0.5,
2, -4.355181, -6.616745, 1, 1.5, 0.5, 0.5,
2, -4.355181, -6.616745, 0, 1.5, 0.5, 0.5,
3, -4.355181, -6.616745, 0, -0.5, 0.5, 0.5,
3, -4.355181, -6.616745, 1, -0.5, 0.5, 0.5,
3, -4.355181, -6.616745, 1, 1.5, 0.5, 0.5,
3, -4.355181, -6.616745, 0, 1.5, 0.5, 0.5
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
-3.025818, -3, -5.752624,
-3.025818, 2, -5.752624,
-3.025818, -3, -5.752624,
-3.183204, -3, -6.040664,
-3.025818, -2, -5.752624,
-3.183204, -2, -6.040664,
-3.025818, -1, -5.752624,
-3.183204, -1, -6.040664,
-3.025818, 0, -5.752624,
-3.183204, 0, -6.040664,
-3.025818, 1, -5.752624,
-3.183204, 1, -6.040664,
-3.025818, 2, -5.752624,
-3.183204, 2, -6.040664
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
-3.497974, -3, -6.616745, 0, -0.5, 0.5, 0.5,
-3.497974, -3, -6.616745, 1, -0.5, 0.5, 0.5,
-3.497974, -3, -6.616745, 1, 1.5, 0.5, 0.5,
-3.497974, -3, -6.616745, 0, 1.5, 0.5, 0.5,
-3.497974, -2, -6.616745, 0, -0.5, 0.5, 0.5,
-3.497974, -2, -6.616745, 1, -0.5, 0.5, 0.5,
-3.497974, -2, -6.616745, 1, 1.5, 0.5, 0.5,
-3.497974, -2, -6.616745, 0, 1.5, 0.5, 0.5,
-3.497974, -1, -6.616745, 0, -0.5, 0.5, 0.5,
-3.497974, -1, -6.616745, 1, -0.5, 0.5, 0.5,
-3.497974, -1, -6.616745, 1, 1.5, 0.5, 0.5,
-3.497974, -1, -6.616745, 0, 1.5, 0.5, 0.5,
-3.497974, 0, -6.616745, 0, -0.5, 0.5, 0.5,
-3.497974, 0, -6.616745, 1, -0.5, 0.5, 0.5,
-3.497974, 0, -6.616745, 1, 1.5, 0.5, 0.5,
-3.497974, 0, -6.616745, 0, 1.5, 0.5, 0.5,
-3.497974, 1, -6.616745, 0, -0.5, 0.5, 0.5,
-3.497974, 1, -6.616745, 1, -0.5, 0.5, 0.5,
-3.497974, 1, -6.616745, 1, 1.5, 0.5, 0.5,
-3.497974, 1, -6.616745, 0, 1.5, 0.5, 0.5,
-3.497974, 2, -6.616745, 0, -0.5, 0.5, 0.5,
-3.497974, 2, -6.616745, 1, -0.5, 0.5, 0.5,
-3.497974, 2, -6.616745, 1, 1.5, 0.5, 0.5,
-3.497974, 2, -6.616745, 0, 1.5, 0.5, 0.5
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
-3.025818, -3.850307, -4,
-3.025818, -3.850307, 4,
-3.025818, -3.850307, -4,
-3.183204, -4.018598, -4,
-3.025818, -3.850307, -2,
-3.183204, -4.018598, -2,
-3.025818, -3.850307, 0,
-3.183204, -4.018598, 0,
-3.025818, -3.850307, 2,
-3.183204, -4.018598, 2,
-3.025818, -3.850307, 4,
-3.183204, -4.018598, 4
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
-3.497974, -4.355181, -4, 0, -0.5, 0.5, 0.5,
-3.497974, -4.355181, -4, 1, -0.5, 0.5, 0.5,
-3.497974, -4.355181, -4, 1, 1.5, 0.5, 0.5,
-3.497974, -4.355181, -4, 0, 1.5, 0.5, 0.5,
-3.497974, -4.355181, -2, 0, -0.5, 0.5, 0.5,
-3.497974, -4.355181, -2, 1, -0.5, 0.5, 0.5,
-3.497974, -4.355181, -2, 1, 1.5, 0.5, 0.5,
-3.497974, -4.355181, -2, 0, 1.5, 0.5, 0.5,
-3.497974, -4.355181, 0, 0, -0.5, 0.5, 0.5,
-3.497974, -4.355181, 0, 1, -0.5, 0.5, 0.5,
-3.497974, -4.355181, 0, 1, 1.5, 0.5, 0.5,
-3.497974, -4.355181, 0, 0, 1.5, 0.5, 0.5,
-3.497974, -4.355181, 2, 0, -0.5, 0.5, 0.5,
-3.497974, -4.355181, 2, 1, -0.5, 0.5, 0.5,
-3.497974, -4.355181, 2, 1, 1.5, 0.5, 0.5,
-3.497974, -4.355181, 2, 0, 1.5, 0.5, 0.5,
-3.497974, -4.355181, 4, 0, -0.5, 0.5, 0.5,
-3.497974, -4.355181, 4, 1, -0.5, 0.5, 0.5,
-3.497974, -4.355181, 4, 1, 1.5, 0.5, 0.5,
-3.497974, -4.355181, 4, 0, 1.5, 0.5, 0.5
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
-3.025818, -3.850307, -5.752624,
-3.025818, 2.881342, -5.752624,
-3.025818, -3.850307, 5.76899,
-3.025818, 2.881342, 5.76899,
-3.025818, -3.850307, -5.752624,
-3.025818, -3.850307, 5.76899,
-3.025818, 2.881342, -5.752624,
-3.025818, 2.881342, 5.76899,
-3.025818, -3.850307, -5.752624,
3.269593, -3.850307, -5.752624,
-3.025818, -3.850307, 5.76899,
3.269593, -3.850307, 5.76899,
-3.025818, 2.881342, -5.752624,
3.269593, 2.881342, -5.752624,
-3.025818, 2.881342, 5.76899,
3.269593, 2.881342, 5.76899,
3.269593, -3.850307, -5.752624,
3.269593, 2.881342, -5.752624,
3.269593, -3.850307, 5.76899,
3.269593, 2.881342, 5.76899,
3.269593, -3.850307, -5.752624,
3.269593, -3.850307, 5.76899,
3.269593, 2.881342, -5.752624,
3.269593, 2.881342, 5.76899
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
var radius = 7.878609;
var distance = 35.05282;
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
mvMatrix.translate( -0.1218872, 0.4844822, -0.008183002 );
mvMatrix.scale( 1.35313, 1.265441, 0.7393502 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.05282);
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
isoprothiolane<-read.table("isoprothiolane.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-isoprothiolane$V2
```

```
## Error in eval(expr, envir, enclos): object 'isoprothiolane' not found
```

```r
y<-isoprothiolane$V3
```

```
## Error in eval(expr, envir, enclos): object 'isoprothiolane' not found
```

```r
z<-isoprothiolane$V4
```

```
## Error in eval(expr, envir, enclos): object 'isoprothiolane' not found
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
-2.934138, 0.3327546, 0.3267463, 0, 0, 1, 1, 1,
-2.855248, -0.5985612, -0.7016107, 1, 0, 0, 1, 1,
-2.710443, -0.6239473, -2.076655, 1, 0, 0, 1, 1,
-2.663752, -1.077254, -2.60003, 1, 0, 0, 1, 1,
-2.616986, 0.1505147, -2.558851, 1, 0, 0, 1, 1,
-2.572764, 0.1600339, -0.9805809, 1, 0, 0, 1, 1,
-2.435376, 1.336715, -1.460496, 0, 0, 0, 1, 1,
-2.433943, -0.7998741, -2.911993, 0, 0, 0, 1, 1,
-2.397334, -1.516282, -2.823588, 0, 0, 0, 1, 1,
-2.383294, -0.5336171, -1.757914, 0, 0, 0, 1, 1,
-2.354054, 1.481019, -1.133934, 0, 0, 0, 1, 1,
-2.348503, -1.410916, -0.9139675, 0, 0, 0, 1, 1,
-2.303341, 1.591144, -0.3909492, 0, 0, 0, 1, 1,
-2.299261, 0.3726043, -0.7046359, 1, 1, 1, 1, 1,
-2.259593, 1.192124, -0.5269955, 1, 1, 1, 1, 1,
-2.255695, 0.09589266, -0.8715969, 1, 1, 1, 1, 1,
-2.246805, 0.9432663, -0.5216489, 1, 1, 1, 1, 1,
-2.229568, 1.206436, -0.4351311, 1, 1, 1, 1, 1,
-2.213313, 0.2757787, -2.257571, 1, 1, 1, 1, 1,
-2.180608, -0.3552933, -2.001536, 1, 1, 1, 1, 1,
-2.138707, 0.5790826, -2.415476, 1, 1, 1, 1, 1,
-2.123134, -1.362792, -1.886678, 1, 1, 1, 1, 1,
-2.122809, 0.1309884, -1.78682, 1, 1, 1, 1, 1,
-2.112499, 0.323401, -3.772692, 1, 1, 1, 1, 1,
-2.093733, 1.982144, -1.600533, 1, 1, 1, 1, 1,
-2.022352, 0.2544574, -1.315621, 1, 1, 1, 1, 1,
-2.01303, 0.7082798, -0.8319778, 1, 1, 1, 1, 1,
-2.01008, -0.2327348, -2.59601, 1, 1, 1, 1, 1,
-1.998583, -0.303014, -2.354312, 0, 0, 1, 1, 1,
-1.995371, -0.4222472, -1.859266, 1, 0, 0, 1, 1,
-1.966313, -0.6032476, -1.675736, 1, 0, 0, 1, 1,
-1.956072, 1.816676, -1.721906, 1, 0, 0, 1, 1,
-1.955883, 0.6072436, -1.875457, 1, 0, 0, 1, 1,
-1.953722, -0.8046494, -1.618933, 1, 0, 0, 1, 1,
-1.938406, 0.4345915, -3.315828, 0, 0, 0, 1, 1,
-1.917866, -0.1079604, -0.8764921, 0, 0, 0, 1, 1,
-1.907294, 0.08058193, -1.945711, 0, 0, 0, 1, 1,
-1.893292, 1.607485, -1.781999, 0, 0, 0, 1, 1,
-1.882043, 0.2167322, -2.719752, 0, 0, 0, 1, 1,
-1.866301, -0.0007157659, -1.011089, 0, 0, 0, 1, 1,
-1.864984, -1.390022, -3.130079, 0, 0, 0, 1, 1,
-1.836321, -0.6336167, -3.473479, 1, 1, 1, 1, 1,
-1.834881, -0.0829858, -1.768706, 1, 1, 1, 1, 1,
-1.825494, 0.1175114, -3.376303, 1, 1, 1, 1, 1,
-1.802781, 0.9386545, -3.209502, 1, 1, 1, 1, 1,
-1.793565, 0.576314, -1.126358, 1, 1, 1, 1, 1,
-1.783775, -1.010247, -2.231186, 1, 1, 1, 1, 1,
-1.750039, -0.7662746, -0.7903656, 1, 1, 1, 1, 1,
-1.748489, 1.368151, -1.120541, 1, 1, 1, 1, 1,
-1.74119, -1.100632, -3.546434, 1, 1, 1, 1, 1,
-1.737672, 0.5893651, -1.040746, 1, 1, 1, 1, 1,
-1.722048, -1.138637, -2.014272, 1, 1, 1, 1, 1,
-1.713086, 0.8924137, -0.5579727, 1, 1, 1, 1, 1,
-1.689983, 0.3565167, -1.167886, 1, 1, 1, 1, 1,
-1.679017, -2.600646, -2.694331, 1, 1, 1, 1, 1,
-1.65481, 0.6962424, 0.25525, 1, 1, 1, 1, 1,
-1.652583, 1.561749, -1.405797, 0, 0, 1, 1, 1,
-1.649165, -1.255044, -3.344949, 1, 0, 0, 1, 1,
-1.642467, 0.02042861, -1.659701, 1, 0, 0, 1, 1,
-1.636183, -0.3537557, 0.1795169, 1, 0, 0, 1, 1,
-1.632737, 2.14852, -0.9136895, 1, 0, 0, 1, 1,
-1.628081, 1.074433, -0.7917059, 1, 0, 0, 1, 1,
-1.624281, -0.8954592, -1.696041, 0, 0, 0, 1, 1,
-1.617996, -1.752178, -2.729706, 0, 0, 0, 1, 1,
-1.614437, -0.3315513, -3.186165, 0, 0, 0, 1, 1,
-1.607254, -0.01558894, -1.771461, 0, 0, 0, 1, 1,
-1.601939, -0.9555452, -1.414771, 0, 0, 0, 1, 1,
-1.600175, -0.9492986, -1.904572, 0, 0, 0, 1, 1,
-1.600019, -0.6716983, -2.624628, 0, 0, 0, 1, 1,
-1.596862, -2.13969, -4.099422, 1, 1, 1, 1, 1,
-1.565464, 0.1053254, -1.22211, 1, 1, 1, 1, 1,
-1.560593, 1.550916, -1.337875, 1, 1, 1, 1, 1,
-1.559226, -1.375023, -2.197327, 1, 1, 1, 1, 1,
-1.542608, 0.9773703, -0.5253266, 1, 1, 1, 1, 1,
-1.535685, -0.6638836, -1.732248, 1, 1, 1, 1, 1,
-1.531095, 0.1365484, 0.07677034, 1, 1, 1, 1, 1,
-1.526057, 0.07115674, -0.7515692, 1, 1, 1, 1, 1,
-1.515663, -0.1986015, -1.105376, 1, 1, 1, 1, 1,
-1.512166, -0.6790189, -1.952765, 1, 1, 1, 1, 1,
-1.507483, -0.7015993, -2.621758, 1, 1, 1, 1, 1,
-1.496514, 0.03697547, -1.607288, 1, 1, 1, 1, 1,
-1.495909, 0.6782774, -1.479849, 1, 1, 1, 1, 1,
-1.471039, -0.4621202, -0.02884612, 1, 1, 1, 1, 1,
-1.450862, 0.1044475, -0.571039, 1, 1, 1, 1, 1,
-1.429991, 2.663111, -1.42918, 0, 0, 1, 1, 1,
-1.427835, -0.2157935, -2.684911, 1, 0, 0, 1, 1,
-1.423853, 0.3783698, -2.774234, 1, 0, 0, 1, 1,
-1.420788, 1.30285, -0.3216927, 1, 0, 0, 1, 1,
-1.417211, 0.08080851, -2.255686, 1, 0, 0, 1, 1,
-1.40845, -0.520052, -1.514436, 1, 0, 0, 1, 1,
-1.407901, -0.3190794, -1.958187, 0, 0, 0, 1, 1,
-1.402946, -0.6982969, -3.746513, 0, 0, 0, 1, 1,
-1.400943, 0.188157, -0.3643681, 0, 0, 0, 1, 1,
-1.399527, -0.8891425, -2.823323, 0, 0, 0, 1, 1,
-1.392882, -0.2644418, -1.284958, 0, 0, 0, 1, 1,
-1.37834, 1.76031, 0.1050731, 0, 0, 0, 1, 1,
-1.376104, 1.87619, -2.578389, 0, 0, 0, 1, 1,
-1.368413, -0.6259063, -2.130368, 1, 1, 1, 1, 1,
-1.360308, 1.261178, -1.127796, 1, 1, 1, 1, 1,
-1.357836, -0.9968653, -2.028573, 1, 1, 1, 1, 1,
-1.357162, -0.1711655, -0.250748, 1, 1, 1, 1, 1,
-1.357156, 0.6405323, -2.075886, 1, 1, 1, 1, 1,
-1.34303, 1.43101, -1.575412, 1, 1, 1, 1, 1,
-1.33937, 0.3219944, -4.535242, 1, 1, 1, 1, 1,
-1.337239, 0.8190072, -0.4029239, 1, 1, 1, 1, 1,
-1.3337, -1.609796, -2.775029, 1, 1, 1, 1, 1,
-1.329598, 0.2344549, -0.731199, 1, 1, 1, 1, 1,
-1.327919, -0.08412816, -1.702892, 1, 1, 1, 1, 1,
-1.3262, -0.9546743, -3.192506, 1, 1, 1, 1, 1,
-1.31645, -0.003299512, -1.38094, 1, 1, 1, 1, 1,
-1.312657, 0.3374536, -0.650301, 1, 1, 1, 1, 1,
-1.310248, 2.73461, -0.3067738, 1, 1, 1, 1, 1,
-1.295652, 0.5124986, -1.866346, 0, 0, 1, 1, 1,
-1.294639, 0.6937527, -1.194322, 1, 0, 0, 1, 1,
-1.291985, -0.2191867, -3.183273, 1, 0, 0, 1, 1,
-1.287882, -0.3753774, -1.361724, 1, 0, 0, 1, 1,
-1.287368, 0.1062355, -2.129453, 1, 0, 0, 1, 1,
-1.287146, 0.2812297, 0.7794483, 1, 0, 0, 1, 1,
-1.284653, 1.26669, -1.421748, 0, 0, 0, 1, 1,
-1.276871, -1.263139, -2.388416, 0, 0, 0, 1, 1,
-1.265325, 0.04298849, -2.398016, 0, 0, 0, 1, 1,
-1.257515, 0.2798647, -0.5593758, 0, 0, 0, 1, 1,
-1.256818, 1.939259, -1.246076, 0, 0, 0, 1, 1,
-1.248471, 0.5000294, -0.8081172, 0, 0, 0, 1, 1,
-1.240145, -0.1195754, -1.781975, 0, 0, 0, 1, 1,
-1.239774, -0.2172795, -3.237922, 1, 1, 1, 1, 1,
-1.228812, -0.1224932, -1.542412, 1, 1, 1, 1, 1,
-1.22292, -0.8228992, -2.647607, 1, 1, 1, 1, 1,
-1.218396, -0.2242978, -2.560974, 1, 1, 1, 1, 1,
-1.212394, -0.01848329, -1.28863, 1, 1, 1, 1, 1,
-1.191919, -1.050757, -3.989702, 1, 1, 1, 1, 1,
-1.188733, 0.01463913, -3.421982, 1, 1, 1, 1, 1,
-1.180894, 0.3913115, -1.401343, 1, 1, 1, 1, 1,
-1.179736, 0.3099488, 0.9285166, 1, 1, 1, 1, 1,
-1.174947, -0.8344348, -2.833388, 1, 1, 1, 1, 1,
-1.17326, 0.01479361, -0.8904327, 1, 1, 1, 1, 1,
-1.172479, 0.007393201, -0.165363, 1, 1, 1, 1, 1,
-1.161386, 0.6927791, -0.9755219, 1, 1, 1, 1, 1,
-1.149942, -0.2111077, -1.799004, 1, 1, 1, 1, 1,
-1.145275, -0.3485843, -1.136382, 1, 1, 1, 1, 1,
-1.139822, -0.5451202, -0.9652506, 0, 0, 1, 1, 1,
-1.13818, 0.5095961, -1.384717, 1, 0, 0, 1, 1,
-1.135535, -0.8924969, -0.7095898, 1, 0, 0, 1, 1,
-1.129352, 0.1278068, -0.3422661, 1, 0, 0, 1, 1,
-1.126209, 2.16227, -0.7241682, 1, 0, 0, 1, 1,
-1.125224, 0.3174824, -0.7064088, 1, 0, 0, 1, 1,
-1.124947, -0.9915746, -1.571615, 0, 0, 0, 1, 1,
-1.120924, -0.8269207, -4.149231, 0, 0, 0, 1, 1,
-1.114057, 1.735442, -0.2575584, 0, 0, 0, 1, 1,
-1.113645, 0.5501329, -1.393996, 0, 0, 0, 1, 1,
-1.106235, 0.7258894, -1.185936, 0, 0, 0, 1, 1,
-1.081124, -0.1481967, -1.976826, 0, 0, 0, 1, 1,
-1.076123, 0.03083209, -2.070332, 0, 0, 0, 1, 1,
-1.069904, 0.8926648, -0.9612328, 1, 1, 1, 1, 1,
-1.06818, -1.447091, -0.6220858, 1, 1, 1, 1, 1,
-1.063043, 1.027934, -0.8453335, 1, 1, 1, 1, 1,
-1.049218, -1.676943, -2.15609, 1, 1, 1, 1, 1,
-1.046922, -0.08405894, -1.731376, 1, 1, 1, 1, 1,
-1.04618, -0.03230702, -1.23517, 1, 1, 1, 1, 1,
-1.044763, -2.412089, -3.339122, 1, 1, 1, 1, 1,
-1.04038, 1.670817, -2.089077, 1, 1, 1, 1, 1,
-1.039591, 0.1685379, -1.057922, 1, 1, 1, 1, 1,
-1.0235, 1.125657, -1.093327, 1, 1, 1, 1, 1,
-1.019308, -1.086935, -3.303908, 1, 1, 1, 1, 1,
-1.017213, 0.2910459, -1.222104, 1, 1, 1, 1, 1,
-1.008303, -0.7719901, -1.44972, 1, 1, 1, 1, 1,
-1.007815, -0.5521693, -0.6638833, 1, 1, 1, 1, 1,
-1.00493, 1.183075, 1.566184, 1, 1, 1, 1, 1,
-1.00325, -0.006195778, -2.198929, 0, 0, 1, 1, 1,
-0.9946785, -0.675388, -0.5250393, 1, 0, 0, 1, 1,
-0.9941217, 1.156405, -1.551306, 1, 0, 0, 1, 1,
-0.9930391, -0.5710652, -1.54156, 1, 0, 0, 1, 1,
-0.9907702, -0.03324915, -2.842404, 1, 0, 0, 1, 1,
-0.9861085, -1.058405, -0.994581, 1, 0, 0, 1, 1,
-0.9857984, -0.4975053, -2.528594, 0, 0, 0, 1, 1,
-0.9846442, 1.104347, -0.3769291, 0, 0, 0, 1, 1,
-0.983866, -0.5475861, -2.165223, 0, 0, 0, 1, 1,
-0.9828778, -0.7685359, -3.456046, 0, 0, 0, 1, 1,
-0.9814167, 2.395976, -0.7215171, 0, 0, 0, 1, 1,
-0.9667349, 0.06467389, -1.077508, 0, 0, 0, 1, 1,
-0.9638007, -0.8291054, -2.827953, 0, 0, 0, 1, 1,
-0.9608952, -1.061397, -1.389442, 1, 1, 1, 1, 1,
-0.9577867, 1.579434, -1.429801, 1, 1, 1, 1, 1,
-0.9496415, -1.850718, -1.306876, 1, 1, 1, 1, 1,
-0.9490007, 0.7561348, -0.8736981, 1, 1, 1, 1, 1,
-0.9457898, 0.9641514, 0.1584665, 1, 1, 1, 1, 1,
-0.9260165, 1.61641, 1.193696, 1, 1, 1, 1, 1,
-0.9234886, -0.6367191, -2.497007, 1, 1, 1, 1, 1,
-0.9198053, -0.2397482, -4.009605, 1, 1, 1, 1, 1,
-0.9136654, 1.196192, 0.6613503, 1, 1, 1, 1, 1,
-0.9069846, -0.5991019, -1.177982, 1, 1, 1, 1, 1,
-0.8984886, 2.091644, 0.386458, 1, 1, 1, 1, 1,
-0.8961876, 1.362013, -2.597035, 1, 1, 1, 1, 1,
-0.8957416, 0.6367424, -0.2551696, 1, 1, 1, 1, 1,
-0.8888337, -2.331627, -2.017736, 1, 1, 1, 1, 1,
-0.8886115, 1.566107, -0.4186026, 1, 1, 1, 1, 1,
-0.8803428, -0.1368263, -1.857195, 0, 0, 1, 1, 1,
-0.869736, 0.8969573, 0.5348976, 1, 0, 0, 1, 1,
-0.8671216, 0.9848872, 1.132587, 1, 0, 0, 1, 1,
-0.8616872, -0.5032888, -1.933972, 1, 0, 0, 1, 1,
-0.8603303, -0.1457809, -3.483171, 1, 0, 0, 1, 1,
-0.8552532, 1.784613, -1.670958, 1, 0, 0, 1, 1,
-0.8502957, -1.155729, -0.8706101, 0, 0, 0, 1, 1,
-0.8304269, 1.765185, -0.02729458, 0, 0, 0, 1, 1,
-0.8302132, -0.6802773, -1.992947, 0, 0, 0, 1, 1,
-0.8301825, 1.770701, -1.51125, 0, 0, 0, 1, 1,
-0.8289454, 1.297364, -2.112432, 0, 0, 0, 1, 1,
-0.8209575, -1.726945, -3.175948, 0, 0, 0, 1, 1,
-0.819302, 0.799652, -0.852482, 0, 0, 0, 1, 1,
-0.8164062, -1.088554, -1.524973, 1, 1, 1, 1, 1,
-0.8146489, 1.217808, -0.1395669, 1, 1, 1, 1, 1,
-0.8103823, -1.357883, -3.187534, 1, 1, 1, 1, 1,
-0.8068885, -0.2277072, -0.4265936, 1, 1, 1, 1, 1,
-0.8060394, -1.042543, -4.417258, 1, 1, 1, 1, 1,
-0.7935787, 0.245749, -1.819035, 1, 1, 1, 1, 1,
-0.7909073, -1.737525, -3.716388, 1, 1, 1, 1, 1,
-0.7876878, -0.05556612, -3.000726, 1, 1, 1, 1, 1,
-0.7782373, 0.1535562, -1.23404, 1, 1, 1, 1, 1,
-0.7737444, 1.546152, -1.496487, 1, 1, 1, 1, 1,
-0.764588, -0.2465157, -3.25493, 1, 1, 1, 1, 1,
-0.7621239, 1.076467, -1.216293, 1, 1, 1, 1, 1,
-0.7586098, -0.6962861, -1.755332, 1, 1, 1, 1, 1,
-0.7580415, -1.71952, -2.831851, 1, 1, 1, 1, 1,
-0.7553734, -0.6893235, -3.394333, 1, 1, 1, 1, 1,
-0.7497526, -1.806796, -1.034978, 0, 0, 1, 1, 1,
-0.7484065, -0.5386618, -3.042725, 1, 0, 0, 1, 1,
-0.7447889, -0.4122874, -1.650411, 1, 0, 0, 1, 1,
-0.740616, 1.490926, 0.9733992, 1, 0, 0, 1, 1,
-0.7399304, -1.242869, -0.5017177, 1, 0, 0, 1, 1,
-0.7352722, -1.097598, -3.409826, 1, 0, 0, 1, 1,
-0.7286932, 0.7147762, -1.715998, 0, 0, 0, 1, 1,
-0.717931, 0.546829, -0.889827, 0, 0, 0, 1, 1,
-0.7140676, 0.06514592, -1.666744, 0, 0, 0, 1, 1,
-0.7138047, -1.967654, -2.093669, 0, 0, 0, 1, 1,
-0.7124083, -0.06649331, -0.7290213, 0, 0, 0, 1, 1,
-0.7113163, 0.3327603, -1.471445, 0, 0, 0, 1, 1,
-0.710138, 0.1562034, -2.499306, 0, 0, 0, 1, 1,
-0.7100477, 0.7030883, -1.389281, 1, 1, 1, 1, 1,
-0.7094594, 0.3325965, -0.3650188, 1, 1, 1, 1, 1,
-0.7080376, 0.3073996, 0.054467, 1, 1, 1, 1, 1,
-0.7059101, -0.4773204, -5.070969, 1, 1, 1, 1, 1,
-0.7027863, 1.751265, -0.1568354, 1, 1, 1, 1, 1,
-0.7004559, 0.8207914, 0.4958273, 1, 1, 1, 1, 1,
-0.698596, -0.1055952, -1.224253, 1, 1, 1, 1, 1,
-0.6936185, 1.244879, -1.731885, 1, 1, 1, 1, 1,
-0.6932161, -0.08703295, -1.244635, 1, 1, 1, 1, 1,
-0.6894636, -0.3473715, -2.260072, 1, 1, 1, 1, 1,
-0.6795219, -1.856399, -3.059611, 1, 1, 1, 1, 1,
-0.6744475, -1.642052, -2.268303, 1, 1, 1, 1, 1,
-0.6726569, 2.343611, 0.4986165, 1, 1, 1, 1, 1,
-0.6657189, 1.639008, 1.642327, 1, 1, 1, 1, 1,
-0.6649918, 1.715085, -0.2520928, 1, 1, 1, 1, 1,
-0.6648002, 0.09486803, 0.3009367, 0, 0, 1, 1, 1,
-0.6594296, -0.9426194, -2.401522, 1, 0, 0, 1, 1,
-0.6574398, -1.662414, -3.523798, 1, 0, 0, 1, 1,
-0.654561, 0.3652209, -1.08613, 1, 0, 0, 1, 1,
-0.6535365, -0.01270394, -2.084851, 1, 0, 0, 1, 1,
-0.6529961, 1.217325, -1.76694, 1, 0, 0, 1, 1,
-0.6522557, 0.7788063, 0.8107322, 0, 0, 0, 1, 1,
-0.6443043, 2.231616, -0.7359695, 0, 0, 0, 1, 1,
-0.6429677, 0.8799018, -2.31562, 0, 0, 0, 1, 1,
-0.6405157, -0.5365915, -2.495953, 0, 0, 0, 1, 1,
-0.6402859, -0.35747, -4.425436, 0, 0, 0, 1, 1,
-0.6378112, 0.1253523, -1.475114, 0, 0, 0, 1, 1,
-0.6367066, 0.8904747, 0.9247225, 0, 0, 0, 1, 1,
-0.632046, 0.3936498, -3.364147, 1, 1, 1, 1, 1,
-0.6291314, 0.1223284, -1.605791, 1, 1, 1, 1, 1,
-0.6202646, 0.9359864, -0.3958514, 1, 1, 1, 1, 1,
-0.6173271, 0.9405774, -2.149839, 1, 1, 1, 1, 1,
-0.6165259, -0.6496597, -0.635143, 1, 1, 1, 1, 1,
-0.6141163, 0.6201382, -0.9755787, 1, 1, 1, 1, 1,
-0.6084496, 0.9931396, -0.1822476, 1, 1, 1, 1, 1,
-0.6074263, -1.158481, -0.4854597, 1, 1, 1, 1, 1,
-0.6016744, 1.177365, -0.956268, 1, 1, 1, 1, 1,
-0.6004696, 0.509946, 0.3349217, 1, 1, 1, 1, 1,
-0.6003886, -2.133981, -2.242323, 1, 1, 1, 1, 1,
-0.5958847, 0.9398741, -0.6962206, 1, 1, 1, 1, 1,
-0.5958086, 1.331667, -0.2322812, 1, 1, 1, 1, 1,
-0.5950682, -1.061541, -2.767156, 1, 1, 1, 1, 1,
-0.5920117, -2.173026, -2.647773, 1, 1, 1, 1, 1,
-0.5914969, 0.1159588, -0.9845687, 0, 0, 1, 1, 1,
-0.5865645, 1.291639, -2.010413, 1, 0, 0, 1, 1,
-0.5751263, 0.07965652, -1.658667, 1, 0, 0, 1, 1,
-0.5723202, 0.744895, -0.5438541, 1, 0, 0, 1, 1,
-0.5711312, -0.3037444, -1.279182, 1, 0, 0, 1, 1,
-0.570066, -0.4656474, -4.494292, 1, 0, 0, 1, 1,
-0.5662632, 0.4995291, -0.819582, 0, 0, 0, 1, 1,
-0.5622069, 0.156603, -1.530247, 0, 0, 0, 1, 1,
-0.561834, -0.5800973, -1.706531, 0, 0, 0, 1, 1,
-0.5600557, -1.016291, -4.411826, 0, 0, 0, 1, 1,
-0.5576268, -1.85412, -1.43963, 0, 0, 0, 1, 1,
-0.5565575, -0.7973596, -2.984108, 0, 0, 0, 1, 1,
-0.555541, -0.1182027, -0.4484907, 0, 0, 0, 1, 1,
-0.5537688, 0.7392925, 0.9385537, 1, 1, 1, 1, 1,
-0.5474575, 0.02553636, -3.160041, 1, 1, 1, 1, 1,
-0.54197, -1.19045, -2.985839, 1, 1, 1, 1, 1,
-0.5384452, -0.2137413, -2.808655, 1, 1, 1, 1, 1,
-0.5258155, -0.9787787, -2.544884, 1, 1, 1, 1, 1,
-0.5248256, -0.5721461, -2.939726, 1, 1, 1, 1, 1,
-0.5226088, -1.156425, -1.946275, 1, 1, 1, 1, 1,
-0.5225954, -0.2877291, -3.437693, 1, 1, 1, 1, 1,
-0.5219654, -0.5477553, -1.303905, 1, 1, 1, 1, 1,
-0.5169924, 0.03161832, -0.8552866, 1, 1, 1, 1, 1,
-0.5163342, 1.299733, 0.6421263, 1, 1, 1, 1, 1,
-0.5064712, 0.6706955, 0.1264856, 1, 1, 1, 1, 1,
-0.5054262, -0.7297656, -3.095837, 1, 1, 1, 1, 1,
-0.496613, 0.5546018, -1.20147, 1, 1, 1, 1, 1,
-0.4947821, 2.09526, 0.6754968, 1, 1, 1, 1, 1,
-0.4946636, 0.4511015, -1.927414, 0, 0, 1, 1, 1,
-0.493392, 1.343948, -0.3746195, 1, 0, 0, 1, 1,
-0.4893148, 0.7805293, -0.7553424, 1, 0, 0, 1, 1,
-0.4880395, -0.4590933, -1.705025, 1, 0, 0, 1, 1,
-0.485992, -0.4897754, -2.642838, 1, 0, 0, 1, 1,
-0.485221, -0.1568526, -2.171373, 1, 0, 0, 1, 1,
-0.4774162, -2.251521, -4.47415, 0, 0, 0, 1, 1,
-0.4764804, 1.523587, 0.5512037, 0, 0, 0, 1, 1,
-0.4753874, -0.5499085, -2.344456, 0, 0, 0, 1, 1,
-0.4712665, 0.7478573, -0.5510547, 0, 0, 0, 1, 1,
-0.4670896, -0.8356028, -1.20741, 0, 0, 0, 1, 1,
-0.4640377, 0.3422558, 0.07088726, 0, 0, 0, 1, 1,
-0.4593892, 0.6538364, 0.5513109, 0, 0, 0, 1, 1,
-0.4589517, -0.7742545, -3.061114, 1, 1, 1, 1, 1,
-0.45644, 1.422228, -1.770682, 1, 1, 1, 1, 1,
-0.4530572, -0.3697479, -3.29948, 1, 1, 1, 1, 1,
-0.4527389, 0.367129, -0.860096, 1, 1, 1, 1, 1,
-0.4514916, -0.6668435, -3.48303, 1, 1, 1, 1, 1,
-0.4433502, 1.537477, -0.5144709, 1, 1, 1, 1, 1,
-0.4426343, 0.3808214, -0.1235786, 1, 1, 1, 1, 1,
-0.4405958, 0.2460211, -1.194339, 1, 1, 1, 1, 1,
-0.4297375, 1.103726, -1.569018, 1, 1, 1, 1, 1,
-0.429618, 0.131393, 0.1751741, 1, 1, 1, 1, 1,
-0.4278295, 1.10154, -1.267851, 1, 1, 1, 1, 1,
-0.4207504, -1.674242, -2.471687, 1, 1, 1, 1, 1,
-0.4205289, -1.700758, -2.910631, 1, 1, 1, 1, 1,
-0.4199843, 1.857354, -0.961619, 1, 1, 1, 1, 1,
-0.4153349, -2.335532, -0.7722273, 1, 1, 1, 1, 1,
-0.4150456, 0.1036077, -0.5781161, 0, 0, 1, 1, 1,
-0.4145384, 0.8990648, -0.6976331, 1, 0, 0, 1, 1,
-0.4095221, 0.3211053, -1.370897, 1, 0, 0, 1, 1,
-0.4008495, 2.037059, 1.158343, 1, 0, 0, 1, 1,
-0.3992299, -1.271956, -3.843926, 1, 0, 0, 1, 1,
-0.3989468, -0.6498089, -3.458369, 1, 0, 0, 1, 1,
-0.3974438, -0.8694271, -1.221161, 0, 0, 0, 1, 1,
-0.3928252, 0.2420688, -0.7606966, 0, 0, 0, 1, 1,
-0.3868274, 0.7777286, -2.246957, 0, 0, 0, 1, 1,
-0.3809915, 2.285025, 1.429618, 0, 0, 0, 1, 1,
-0.3801092, 0.3496316, -1.414976, 0, 0, 0, 1, 1,
-0.378438, 1.078758, -1.182181, 0, 0, 0, 1, 1,
-0.3777058, 1.441368, 0.3307016, 0, 0, 0, 1, 1,
-0.3759406, -0.3793739, -2.923301, 1, 1, 1, 1, 1,
-0.3739258, 0.5714027, -1.124848, 1, 1, 1, 1, 1,
-0.3705037, -2.395805, -3.531092, 1, 1, 1, 1, 1,
-0.3585885, -2.12944, -2.604906, 1, 1, 1, 1, 1,
-0.3548258, -0.1757301, -1.055739, 1, 1, 1, 1, 1,
-0.354472, 0.3648484, -2.023392, 1, 1, 1, 1, 1,
-0.3524561, 2.667247, -0.2668037, 1, 1, 1, 1, 1,
-0.3510213, -0.78907, -4.089972, 1, 1, 1, 1, 1,
-0.3508789, 1.214031, -0.1837786, 1, 1, 1, 1, 1,
-0.3476329, -0.2133934, -2.296995, 1, 1, 1, 1, 1,
-0.3459587, -0.5958707, -1.762641, 1, 1, 1, 1, 1,
-0.3441918, 0.7077757, 0.0139876, 1, 1, 1, 1, 1,
-0.3431828, -0.2631575, -1.910697, 1, 1, 1, 1, 1,
-0.3411385, 0.09831861, -0.8442191, 1, 1, 1, 1, 1,
-0.3314813, 0.1823984, -0.1280524, 1, 1, 1, 1, 1,
-0.3281784, 0.944837, -2.111918, 0, 0, 1, 1, 1,
-0.3268283, 0.2034301, -1.363733, 1, 0, 0, 1, 1,
-0.3189887, -0.3085797, -2.348477, 1, 0, 0, 1, 1,
-0.3185445, -1.097891, -3.147286, 1, 0, 0, 1, 1,
-0.3183887, -1.896424, -1.500957, 1, 0, 0, 1, 1,
-0.3183405, 0.3862915, -1.141379, 1, 0, 0, 1, 1,
-0.3091269, 0.429455, 1.275901, 0, 0, 0, 1, 1,
-0.3090871, -1.486916, -2.451369, 0, 0, 0, 1, 1,
-0.3078157, 1.20214, -0.2797645, 0, 0, 0, 1, 1,
-0.3041642, 0.412131, -0.6385265, 0, 0, 0, 1, 1,
-0.3005274, -0.6054879, -3.13922, 0, 0, 0, 1, 1,
-0.2997249, 0.8509194, -1.608216, 0, 0, 0, 1, 1,
-0.2920028, -0.5747508, -2.751383, 0, 0, 0, 1, 1,
-0.2915188, 0.2979378, 0.2003712, 1, 1, 1, 1, 1,
-0.2911018, 0.4195133, -0.5194539, 1, 1, 1, 1, 1,
-0.2910387, 0.2970163, -0.09867078, 1, 1, 1, 1, 1,
-0.286809, -0.4604072, -2.855653, 1, 1, 1, 1, 1,
-0.2784384, 0.4086328, 1.230757, 1, 1, 1, 1, 1,
-0.2730226, -0.3262399, -2.475066, 1, 1, 1, 1, 1,
-0.2667345, -0.4551854, -2.541501, 1, 1, 1, 1, 1,
-0.2635384, -1.030746, -2.749161, 1, 1, 1, 1, 1,
-0.2570395, 0.04302554, -0.1323141, 1, 1, 1, 1, 1,
-0.2562755, 0.1885691, -2.732175, 1, 1, 1, 1, 1,
-0.2498688, 0.3588845, 0.09812422, 1, 1, 1, 1, 1,
-0.2468556, -1.478715, -3.532903, 1, 1, 1, 1, 1,
-0.2386716, 0.2936633, -0.9104886, 1, 1, 1, 1, 1,
-0.2371184, 2.362054, -0.3313367, 1, 1, 1, 1, 1,
-0.2361332, -0.1471125, -2.585784, 1, 1, 1, 1, 1,
-0.2350695, 0.1542495, -4.722589, 0, 0, 1, 1, 1,
-0.2278542, 0.7572668, -0.4656071, 1, 0, 0, 1, 1,
-0.2274785, 0.9984273, 0.171645, 1, 0, 0, 1, 1,
-0.2254798, 0.02162022, -2.560909, 1, 0, 0, 1, 1,
-0.2236774, -0.9714046, -3.150301, 1, 0, 0, 1, 1,
-0.2203271, -1.307698, -3.102413, 1, 0, 0, 1, 1,
-0.2197059, -1.112613, -3.044984, 0, 0, 0, 1, 1,
-0.2165443, -1.891883, -2.602551, 0, 0, 0, 1, 1,
-0.2162295, 0.4728139, -2.343533, 0, 0, 0, 1, 1,
-0.2157782, -2.252141, -5.584833, 0, 0, 0, 1, 1,
-0.2098279, -1.242797, -0.8725891, 0, 0, 0, 1, 1,
-0.2067253, -0.1916037, -1.575897, 0, 0, 0, 1, 1,
-0.2047809, 1.552672, 2.498039, 0, 0, 0, 1, 1,
-0.2023099, 1.359705, -0.7699628, 1, 1, 1, 1, 1,
-0.1994814, 1.28678, 0.05977347, 1, 1, 1, 1, 1,
-0.1934032, -1.184674, -2.436692, 1, 1, 1, 1, 1,
-0.1904584, 0.7203936, -0.5169172, 1, 1, 1, 1, 1,
-0.1866518, 1.002588, -0.4489949, 1, 1, 1, 1, 1,
-0.1851497, -1.170395, -3.866537, 1, 1, 1, 1, 1,
-0.1831672, 1.173878, -0.7251796, 1, 1, 1, 1, 1,
-0.1806854, -0.1935111, -0.2502748, 1, 1, 1, 1, 1,
-0.17991, 2.019581, -1.035914, 1, 1, 1, 1, 1,
-0.1733549, 1.792215, 1.702953, 1, 1, 1, 1, 1,
-0.1723367, 1.836351, -1.055035, 1, 1, 1, 1, 1,
-0.1682226, 2.249797, 0.8765502, 1, 1, 1, 1, 1,
-0.167525, -1.854569, -3.029079, 1, 1, 1, 1, 1,
-0.1647863, -0.6052012, -3.252235, 1, 1, 1, 1, 1,
-0.1640468, 1.00716, -1.225001, 1, 1, 1, 1, 1,
-0.1624824, 0.46335, -0.7812845, 0, 0, 1, 1, 1,
-0.1605102, 1.120791, -0.78904, 1, 0, 0, 1, 1,
-0.160019, -0.1089582, -2.222446, 1, 0, 0, 1, 1,
-0.1579826, 0.3367379, -0.02233828, 1, 0, 0, 1, 1,
-0.154488, -0.4561358, -1.404379, 1, 0, 0, 1, 1,
-0.1440594, -0.3844481, -1.927906, 1, 0, 0, 1, 1,
-0.1412023, 0.1452052, -2.405974, 0, 0, 0, 1, 1,
-0.1375646, -0.8982308, -2.867883, 0, 0, 0, 1, 1,
-0.132688, 2.342388, 0.8918085, 0, 0, 0, 1, 1,
-0.1326105, -0.3144631, -3.749949, 0, 0, 0, 1, 1,
-0.1313338, 1.301081, 0.7758788, 0, 0, 0, 1, 1,
-0.1301069, -0.3283859, -4.037971, 0, 0, 0, 1, 1,
-0.1283961, -1.66461, -2.476229, 0, 0, 0, 1, 1,
-0.1270743, 0.1904661, -1.17073, 1, 1, 1, 1, 1,
-0.1205857, 0.4497805, -1.357196, 1, 1, 1, 1, 1,
-0.1157792, 1.089808, -1.12145, 1, 1, 1, 1, 1,
-0.1143936, 2.664488, -0.1737913, 1, 1, 1, 1, 1,
-0.1126093, 0.9540942, 0.2465689, 1, 1, 1, 1, 1,
-0.1087676, -0.318677, -4.416409, 1, 1, 1, 1, 1,
-0.1086873, -0.1499851, -2.310436, 1, 1, 1, 1, 1,
-0.105932, 1.03657, -0.8444237, 1, 1, 1, 1, 1,
-0.1041059, -1.710628, -3.072048, 1, 1, 1, 1, 1,
-0.1017092, 0.5161731, 2.190319, 1, 1, 1, 1, 1,
-0.1013787, -0.5359311, -1.95826, 1, 1, 1, 1, 1,
-0.09905881, 0.6036702, -0.8181548, 1, 1, 1, 1, 1,
-0.09898385, -0.9107738, -3.039751, 1, 1, 1, 1, 1,
-0.09105149, -0.7447188, -3.847484, 1, 1, 1, 1, 1,
-0.08728852, 1.653024, 0.6938475, 1, 1, 1, 1, 1,
-0.08447203, -1.088243, -3.602818, 0, 0, 1, 1, 1,
-0.08302893, -0.9840955, -4.271963, 1, 0, 0, 1, 1,
-0.08275283, 1.498621, 0.5620706, 1, 0, 0, 1, 1,
-0.08234752, -0.3926327, -2.801825, 1, 0, 0, 1, 1,
-0.08023376, 1.338226, -0.4397404, 1, 0, 0, 1, 1,
-0.07789803, -1.408507, -3.951962, 1, 0, 0, 1, 1,
-0.07455969, -2.459381, -4.908804, 0, 0, 0, 1, 1,
-0.07452357, 0.4554579, -1.252968, 0, 0, 0, 1, 1,
-0.07195497, -0.1682733, -3.869405, 0, 0, 0, 1, 1,
-0.07081228, 0.3303907, 0.3767886, 0, 0, 0, 1, 1,
-0.06962342, 0.05926227, -1.224542, 0, 0, 0, 1, 1,
-0.06852643, -0.6191374, -2.784581, 0, 0, 0, 1, 1,
-0.06130254, 0.07691883, -0.4808728, 0, 0, 0, 1, 1,
-0.05734813, 0.6787809, 1.592766, 1, 1, 1, 1, 1,
-0.0564151, -0.09539915, -3.10825, 1, 1, 1, 1, 1,
-0.0556333, 0.6171508, 0.3504696, 1, 1, 1, 1, 1,
-0.05355535, 0.5047969, 1.460841, 1, 1, 1, 1, 1,
-0.04431999, -0.4313406, -3.325859, 1, 1, 1, 1, 1,
-0.04109347, 0.4606165, -1.110257, 1, 1, 1, 1, 1,
-0.03963818, -0.4782332, -4.762354, 1, 1, 1, 1, 1,
-0.03284324, 0.7258677, -1.140742, 1, 1, 1, 1, 1,
-0.0289469, -0.14008, -4.898025, 1, 1, 1, 1, 1,
-0.02565824, -0.411212, -2.580902, 1, 1, 1, 1, 1,
-0.02371086, -1.872072, -4.26587, 1, 1, 1, 1, 1,
-0.02333016, -1.236421, -2.011176, 1, 1, 1, 1, 1,
-0.02326665, -1.037425, -3.772505, 1, 1, 1, 1, 1,
-0.02309758, 1.012902, 1.238652, 1, 1, 1, 1, 1,
-0.02306948, 0.05535503, -0.07381203, 1, 1, 1, 1, 1,
-0.01746174, -0.5200257, -1.829529, 0, 0, 1, 1, 1,
-0.01342841, 0.04338085, -0.214289, 1, 0, 0, 1, 1,
-0.01341941, -0.4413055, -2.293126, 1, 0, 0, 1, 1,
-0.004339104, -0.8725156, -2.529503, 1, 0, 0, 1, 1,
-0.003559025, 0.5522953, 0.3069897, 1, 0, 0, 1, 1,
-0.003096115, -0.3059938, -3.347633, 1, 0, 0, 1, 1,
-0.002634377, -0.05196602, -3.524186, 0, 0, 0, 1, 1,
-0.00256796, 0.04669579, 0.7262844, 0, 0, 0, 1, 1,
-0.0006023276, -1.291753, -1.982981, 0, 0, 0, 1, 1,
0.005692727, 0.9134609, 1.488182, 0, 0, 0, 1, 1,
0.01061868, -0.2998805, 3.163859, 0, 0, 0, 1, 1,
0.01643359, -1.500752, 3.413266, 0, 0, 0, 1, 1,
0.01828947, -1.878431, 2.157905, 0, 0, 0, 1, 1,
0.02327312, -1.912728, 3.17153, 1, 1, 1, 1, 1,
0.02784085, -1.871437, 4.038384, 1, 1, 1, 1, 1,
0.03261911, 0.3014686, 0.3210593, 1, 1, 1, 1, 1,
0.03814613, -0.1523051, 2.858914, 1, 1, 1, 1, 1,
0.03962283, 0.5778447, -0.6822528, 1, 1, 1, 1, 1,
0.04444545, 0.9514607, 0.8906596, 1, 1, 1, 1, 1,
0.04680078, 0.03322799, 0.3202614, 1, 1, 1, 1, 1,
0.04745634, 0.08348732, 0.7117162, 1, 1, 1, 1, 1,
0.04763676, -0.324043, 3.509777, 1, 1, 1, 1, 1,
0.0496674, 1.012693, -1.290125, 1, 1, 1, 1, 1,
0.04997071, -0.6388164, 3.577998, 1, 1, 1, 1, 1,
0.05060928, -0.2005333, 3.773295, 1, 1, 1, 1, 1,
0.05305238, -0.1845828, 0.3125651, 1, 1, 1, 1, 1,
0.05555344, -1.523118, 2.68161, 1, 1, 1, 1, 1,
0.05655616, 0.3778886, -0.8845106, 1, 1, 1, 1, 1,
0.06182913, 1.24828, 0.9330758, 0, 0, 1, 1, 1,
0.06210554, 1.10349, 0.2611108, 1, 0, 0, 1, 1,
0.06580159, -1.074058, 2.682686, 1, 0, 0, 1, 1,
0.06738241, -0.8933685, 2.63357, 1, 0, 0, 1, 1,
0.0682508, 0.2374464, 0.118293, 1, 0, 0, 1, 1,
0.073099, 1.499463, -0.08351716, 1, 0, 0, 1, 1,
0.07500081, 0.1057251, 1.410346, 0, 0, 0, 1, 1,
0.07653277, 0.8828849, 0.2483257, 0, 0, 0, 1, 1,
0.07715435, -1.185718, 5.033809, 0, 0, 0, 1, 1,
0.07752357, -1.537972, 3.392796, 0, 0, 0, 1, 1,
0.07889488, -0.9951594, 1.52606, 0, 0, 0, 1, 1,
0.08032454, -0.3911887, 3.162578, 0, 0, 0, 1, 1,
0.08176742, 0.7126703, 0.2335048, 0, 0, 0, 1, 1,
0.0818822, -0.3506443, 3.508073, 1, 1, 1, 1, 1,
0.08201115, -0.5107494, 4.000884, 1, 1, 1, 1, 1,
0.09212224, 0.032449, 1.114256, 1, 1, 1, 1, 1,
0.09376089, -0.4591244, 4.017162, 1, 1, 1, 1, 1,
0.09386384, 0.2596838, -0.6046348, 1, 1, 1, 1, 1,
0.09543573, -0.6706288, 2.739501, 1, 1, 1, 1, 1,
0.09551821, -1.120279, 2.06027, 1, 1, 1, 1, 1,
0.1030481, 0.8663689, -0.3069341, 1, 1, 1, 1, 1,
0.1032472, -1.815391, 3.361872, 1, 1, 1, 1, 1,
0.1043909, -1.625589, 3.098715, 1, 1, 1, 1, 1,
0.1045335, 1.713041, -0.09828532, 1, 1, 1, 1, 1,
0.1049548, 0.2798657, 2.065938, 1, 1, 1, 1, 1,
0.1093498, 1.586648, 0.04213711, 1, 1, 1, 1, 1,
0.1101069, 0.7438779, -0.5887187, 1, 1, 1, 1, 1,
0.1140091, 1.526391, 0.9870765, 1, 1, 1, 1, 1,
0.1170069, -1.047303, 5.290731, 0, 0, 1, 1, 1,
0.1185545, 0.5254829, 1.110929, 1, 0, 0, 1, 1,
0.1192061, 0.3226939, 0.66083, 1, 0, 0, 1, 1,
0.1205738, -0.3540209, 3.153498, 1, 0, 0, 1, 1,
0.1236471, -1.469515, 3.869387, 1, 0, 0, 1, 1,
0.1260269, 0.1601524, 0.7334971, 1, 0, 0, 1, 1,
0.1268534, -0.5428, 2.753199, 0, 0, 0, 1, 1,
0.1275521, 0.2076234, -0.04134353, 0, 0, 0, 1, 1,
0.1299015, 0.1122867, 1.337011, 0, 0, 0, 1, 1,
0.1309115, 0.5514593, -0.6544197, 0, 0, 0, 1, 1,
0.1313802, 0.4968248, 1.563058, 0, 0, 0, 1, 1,
0.1392886, -0.7086716, 2.766669, 0, 0, 0, 1, 1,
0.1400076, -2.887637, 3.915966, 0, 0, 0, 1, 1,
0.1411525, 0.8917821, -0.7403415, 1, 1, 1, 1, 1,
0.141257, -0.4251064, 4.109024, 1, 1, 1, 1, 1,
0.1421011, -1.14441, 3.22135, 1, 1, 1, 1, 1,
0.1435665, -0.7207718, 4.646434, 1, 1, 1, 1, 1,
0.1456186, 0.821802, 0.4046218, 1, 1, 1, 1, 1,
0.145726, -0.2672557, 5.329548, 1, 1, 1, 1, 1,
0.1460228, -0.1285205, 1.687738, 1, 1, 1, 1, 1,
0.1464897, -0.8875214, 2.050258, 1, 1, 1, 1, 1,
0.1475869, 0.05416326, 2.709804, 1, 1, 1, 1, 1,
0.1499053, 1.137104, -0.296639, 1, 1, 1, 1, 1,
0.1503943, 0.8867177, 0.5253531, 1, 1, 1, 1, 1,
0.1511671, 0.3828736, -0.1631516, 1, 1, 1, 1, 1,
0.1516331, 0.5479609, -1.16336, 1, 1, 1, 1, 1,
0.1564206, 1.016109, -0.3152559, 1, 1, 1, 1, 1,
0.1565093, 0.3910935, 0.881997, 1, 1, 1, 1, 1,
0.1574407, 0.9211751, 0.0246224, 0, 0, 1, 1, 1,
0.1587082, -1.43752, 4.455788, 1, 0, 0, 1, 1,
0.1607187, 0.1439284, 1.982626, 1, 0, 0, 1, 1,
0.1618266, 1.167328, -0.7805492, 1, 0, 0, 1, 1,
0.1620519, 1.114622, 1.881322, 1, 0, 0, 1, 1,
0.1634476, -0.8731833, 2.73948, 1, 0, 0, 1, 1,
0.1714506, -0.7672114, 3.805299, 0, 0, 0, 1, 1,
0.1738497, -0.09334122, 2.277711, 0, 0, 0, 1, 1,
0.1745678, -0.7817618, 2.637539, 0, 0, 0, 1, 1,
0.1750658, -1.167722, 3.539486, 0, 0, 0, 1, 1,
0.1764196, 0.2405262, 1.017028, 0, 0, 0, 1, 1,
0.1769179, 0.8615535, 0.3256981, 0, 0, 0, 1, 1,
0.1772662, -0.1026425, 3.455872, 0, 0, 0, 1, 1,
0.1874087, 0.1285686, 3.501033, 1, 1, 1, 1, 1,
0.1891492, -0.241889, 1.949737, 1, 1, 1, 1, 1,
0.1911293, 1.580072, 0.35761, 1, 1, 1, 1, 1,
0.192587, 0.5379956, 2.62329, 1, 1, 1, 1, 1,
0.1926541, 0.1311542, 1.252297, 1, 1, 1, 1, 1,
0.1933794, 1.427242, 0.5246423, 1, 1, 1, 1, 1,
0.1973214, 0.7000275, 1.205706, 1, 1, 1, 1, 1,
0.2007176, 0.6164836, 0.4398835, 1, 1, 1, 1, 1,
0.2131014, -1.894768, 3.006184, 1, 1, 1, 1, 1,
0.2151147, 0.3262385, 0.8779198, 1, 1, 1, 1, 1,
0.2159256, -0.8291184, 1.807266, 1, 1, 1, 1, 1,
0.2175985, 0.3444175, 0.7071396, 1, 1, 1, 1, 1,
0.2185078, -0.3857951, 3.673067, 1, 1, 1, 1, 1,
0.2190638, 1.054902, -1.972774, 1, 1, 1, 1, 1,
0.2200572, -0.2161866, 2.757184, 1, 1, 1, 1, 1,
0.22036, 1.51683, 0.4967529, 0, 0, 1, 1, 1,
0.2221598, 0.2203284, 1.007599, 1, 0, 0, 1, 1,
0.2238235, 1.050083, 0.407079, 1, 0, 0, 1, 1,
0.2255457, 1.191883, -1.744761, 1, 0, 0, 1, 1,
0.22566, 0.3713523, 0.1329044, 1, 0, 0, 1, 1,
0.2261436, 1.204088, -0.9508654, 1, 0, 0, 1, 1,
0.2265483, 0.6345627, 1.202116, 0, 0, 0, 1, 1,
0.2272328, 0.6324691, 1.725527, 0, 0, 0, 1, 1,
0.2275046, -0.7318043, 1.611012, 0, 0, 0, 1, 1,
0.2304749, 0.09012661, 2.112486, 0, 0, 0, 1, 1,
0.2322624, -0.1288909, 0.4882783, 0, 0, 0, 1, 1,
0.2337528, -0.157763, 1.777731, 0, 0, 0, 1, 1,
0.2342512, 0.6058042, 0.5217663, 0, 0, 0, 1, 1,
0.2370633, 0.2090892, -0.09119868, 1, 1, 1, 1, 1,
0.2379706, -0.8607012, 1.594679, 1, 1, 1, 1, 1,
0.2447404, 0.7516703, 0.2548422, 1, 1, 1, 1, 1,
0.2450819, 0.4419701, -1.307905, 1, 1, 1, 1, 1,
0.254844, -0.6878269, 2.659803, 1, 1, 1, 1, 1,
0.2562228, -1.12865, 2.337141, 1, 1, 1, 1, 1,
0.2567935, 0.08838078, 0.6979052, 1, 1, 1, 1, 1,
0.2573002, -0.4221019, 2.120382, 1, 1, 1, 1, 1,
0.2637911, 0.6739321, 0.5673194, 1, 1, 1, 1, 1,
0.2643177, -2.738111, 3.196912, 1, 1, 1, 1, 1,
0.2679668, 1.78301, 0.5969189, 1, 1, 1, 1, 1,
0.2725159, 0.9297855, 1.564361, 1, 1, 1, 1, 1,
0.2754409, 0.9549925, 1.79345, 1, 1, 1, 1, 1,
0.2766816, -1.210672, 1.71448, 1, 1, 1, 1, 1,
0.2768935, -0.7837518, 0.07564058, 1, 1, 1, 1, 1,
0.2777756, -0.8138217, 1.084571, 0, 0, 1, 1, 1,
0.2788367, 0.135041, 0.09669179, 1, 0, 0, 1, 1,
0.2819966, 0.3500449, 1.224639, 1, 0, 0, 1, 1,
0.288197, -0.8326547, 3.811217, 1, 0, 0, 1, 1,
0.289985, -1.218983, 2.110173, 1, 0, 0, 1, 1,
0.2949849, -1.181281, 2.975103, 1, 0, 0, 1, 1,
0.2966842, -0.4550557, 2.456589, 0, 0, 0, 1, 1,
0.3055523, -0.7603403, 2.87654, 0, 0, 0, 1, 1,
0.3066469, 0.07126777, 1.874368, 0, 0, 0, 1, 1,
0.3070102, 1.28503, 0.4119011, 0, 0, 0, 1, 1,
0.3089731, 1.510084, -0.1502957, 0, 0, 0, 1, 1,
0.3134268, -0.912183, 3.138634, 0, 0, 0, 1, 1,
0.314207, -0.07585631, 0.9614978, 0, 0, 0, 1, 1,
0.3209384, 0.1711697, -0.3286569, 1, 1, 1, 1, 1,
0.3266004, -0.0580222, 3.224612, 1, 1, 1, 1, 1,
0.3269488, -1.152152, 4.403649, 1, 1, 1, 1, 1,
0.3299428, 0.4557916, 1.105013, 1, 1, 1, 1, 1,
0.3324001, -0.8445543, 2.748882, 1, 1, 1, 1, 1,
0.3356897, 0.896982, 0.5403259, 1, 1, 1, 1, 1,
0.3357766, 0.1304283, 0.4003381, 1, 1, 1, 1, 1,
0.3373445, 0.1803048, 1.516742, 1, 1, 1, 1, 1,
0.3401585, 0.5361725, 0.4293112, 1, 1, 1, 1, 1,
0.3403309, 0.08132572, -0.3221563, 1, 1, 1, 1, 1,
0.3428076, 1.131226, 1.812705, 1, 1, 1, 1, 1,
0.3461521, -1.213357, 3.080662, 1, 1, 1, 1, 1,
0.3480292, 2.687093, 0.8399101, 1, 1, 1, 1, 1,
0.3483394, 1.639436, -0.4947846, 1, 1, 1, 1, 1,
0.3542471, -0.4091883, 1.254702, 1, 1, 1, 1, 1,
0.3594821, 1.886963, -1.189132, 0, 0, 1, 1, 1,
0.3612428, 1.117722, -0.3645578, 1, 0, 0, 1, 1,
0.3647247, -0.177212, 2.55, 1, 0, 0, 1, 1,
0.3673303, 0.4179282, 1.302635, 1, 0, 0, 1, 1,
0.3683925, -1.492367, 4.277403, 1, 0, 0, 1, 1,
0.3684172, 0.9862713, -0.2753623, 1, 0, 0, 1, 1,
0.369431, -1.198624, 1.592699, 0, 0, 0, 1, 1,
0.3697562, -2.461435, 3.359693, 0, 0, 0, 1, 1,
0.3703285, -0.04647961, 2.339571, 0, 0, 0, 1, 1,
0.3715762, -0.2742715, 1.778068, 0, 0, 0, 1, 1,
0.3730136, 1.59454, -0.1121233, 0, 0, 0, 1, 1,
0.3783363, 1.406439, -0.0772469, 0, 0, 0, 1, 1,
0.3805797, 0.4089742, 1.195707, 0, 0, 0, 1, 1,
0.3832833, 0.4586883, 1.318356, 1, 1, 1, 1, 1,
0.3842483, -0.4664588, 2.40681, 1, 1, 1, 1, 1,
0.3854703, -0.2320223, 3.006906, 1, 1, 1, 1, 1,
0.38619, 0.8370305, 1.301115, 1, 1, 1, 1, 1,
0.3873664, -0.7544191, 1.668151, 1, 1, 1, 1, 1,
0.3903491, -0.8428252, 3.501713, 1, 1, 1, 1, 1,
0.3915422, -0.2655805, 2.448642, 1, 1, 1, 1, 1,
0.3919123, -0.1293148, 2.445746, 1, 1, 1, 1, 1,
0.3978503, -0.5557618, 2.656405, 1, 1, 1, 1, 1,
0.4019771, -2.13377, 4.139497, 1, 1, 1, 1, 1,
0.4085705, -0.970171, 3.488969, 1, 1, 1, 1, 1,
0.4126792, 1.215621, 2.119346, 1, 1, 1, 1, 1,
0.4164875, 0.8890311, -0.09662884, 1, 1, 1, 1, 1,
0.4215312, 1.30486, -0.00965776, 1, 1, 1, 1, 1,
0.4222934, 0.8210018, 0.1626617, 1, 1, 1, 1, 1,
0.4275797, 0.8177692, 0.2031472, 0, 0, 1, 1, 1,
0.4286225, -0.02586651, 1.27229, 1, 0, 0, 1, 1,
0.4287127, 0.1634156, 0.8322716, 1, 0, 0, 1, 1,
0.4289257, 0.6315374, -0.3126629, 1, 0, 0, 1, 1,
0.4294609, 0.2463287, 0.07000723, 1, 0, 0, 1, 1,
0.4376245, -0.4948574, 1.701861, 1, 0, 0, 1, 1,
0.4379717, 1.007656, -1.026969, 0, 0, 0, 1, 1,
0.4386269, 0.8295143, 1.060226, 0, 0, 0, 1, 1,
0.4409723, -0.3782988, 2.701988, 0, 0, 0, 1, 1,
0.4453645, 0.5534923, -0.5304729, 0, 0, 0, 1, 1,
0.4582852, 1.119425, 0.4122554, 0, 0, 0, 1, 1,
0.4591484, -1.08771, 1.641218, 0, 0, 0, 1, 1,
0.4611064, 0.3328368, 0.5900042, 0, 0, 0, 1, 1,
0.4621872, 0.3611277, 0.9574413, 1, 1, 1, 1, 1,
0.4630799, -0.5588439, 1.502133, 1, 1, 1, 1, 1,
0.4650224, 1.247064, 1.249039, 1, 1, 1, 1, 1,
0.4670719, 0.2645529, -0.1587953, 1, 1, 1, 1, 1,
0.4694369, 2.783309, 0.4124714, 1, 1, 1, 1, 1,
0.471139, -1.229198, 3.813635, 1, 1, 1, 1, 1,
0.4715545, 1.197928, -0.2758199, 1, 1, 1, 1, 1,
0.4726281, -0.7654696, 2.037086, 1, 1, 1, 1, 1,
0.4738187, 0.6914534, 2.450123, 1, 1, 1, 1, 1,
0.4783883, -0.1557314, 1.310108, 1, 1, 1, 1, 1,
0.479015, 0.7178453, 0.8677708, 1, 1, 1, 1, 1,
0.4836545, -1.421715, 3.474559, 1, 1, 1, 1, 1,
0.4837376, -1.29824, 4.612637, 1, 1, 1, 1, 1,
0.4867924, -0.7007204, 3.015736, 1, 1, 1, 1, 1,
0.4899638, 1.047618, 2.512292, 1, 1, 1, 1, 1,
0.4906711, 1.026395, 1.733684, 0, 0, 1, 1, 1,
0.492137, -1.214628, 5.601199, 1, 0, 0, 1, 1,
0.4925, 1.084907, -0.4187779, 1, 0, 0, 1, 1,
0.4934045, 0.4246862, 0.5095868, 1, 0, 0, 1, 1,
0.4948897, 0.1533619, 0.579212, 1, 0, 0, 1, 1,
0.4981525, -0.5121164, 2.844068, 1, 0, 0, 1, 1,
0.4981579, -0.4205176, 2.831884, 0, 0, 0, 1, 1,
0.4999818, 0.4809625, -0.3934115, 0, 0, 0, 1, 1,
0.5081607, -0.9781128, 1.227656, 0, 0, 0, 1, 1,
0.5090604, -0.1233098, 3.29379, 0, 0, 0, 1, 1,
0.509478, -0.405143, 2.229505, 0, 0, 0, 1, 1,
0.5134404, -0.5417172, 2.689357, 0, 0, 0, 1, 1,
0.5168012, 0.9092823, 2.314698, 0, 0, 0, 1, 1,
0.518499, -0.165899, 1.354279, 1, 1, 1, 1, 1,
0.519628, -1.202127, 2.742164, 1, 1, 1, 1, 1,
0.5233896, 0.3309967, 2.393387, 1, 1, 1, 1, 1,
0.5235062, 0.9583213, -0.5292985, 1, 1, 1, 1, 1,
0.525412, 0.4491301, -0.03258434, 1, 1, 1, 1, 1,
0.5296702, -0.2981597, 2.807729, 1, 1, 1, 1, 1,
0.5301655, 0.4384831, 2.696166, 1, 1, 1, 1, 1,
0.5306522, -0.2209986, 0.46939, 1, 1, 1, 1, 1,
0.5331748, 0.4615106, 0.5259749, 1, 1, 1, 1, 1,
0.5340252, 0.06706114, 2.150301, 1, 1, 1, 1, 1,
0.5386184, -1.061662, 2.001752, 1, 1, 1, 1, 1,
0.5404648, 0.6294921, 1.018273, 1, 1, 1, 1, 1,
0.541541, 0.3800351, 0.6571876, 1, 1, 1, 1, 1,
0.5443678, 0.1244143, 0.5113522, 1, 1, 1, 1, 1,
0.5457264, 0.1583632, 1.031335, 1, 1, 1, 1, 1,
0.5473676, -0.05854424, 2.315282, 0, 0, 1, 1, 1,
0.5516723, -0.1202573, 1.184008, 1, 0, 0, 1, 1,
0.5541186, -0.9708212, 2.121253, 1, 0, 0, 1, 1,
0.5592408, -0.6967434, 2.584884, 1, 0, 0, 1, 1,
0.5632373, -0.7741902, 5.048177, 1, 0, 0, 1, 1,
0.5632969, -0.5140778, 3.886844, 1, 0, 0, 1, 1,
0.5640191, -1.827123, 4.3819, 0, 0, 0, 1, 1,
0.5654846, 0.06015848, 2.948082, 0, 0, 0, 1, 1,
0.5680754, 1.146321, -1.312243, 0, 0, 0, 1, 1,
0.5682472, -0.9879671, 1.403536, 0, 0, 0, 1, 1,
0.5721231, 1.081346, 0.6364734, 0, 0, 0, 1, 1,
0.573531, -1.466611, 2.485857, 0, 0, 0, 1, 1,
0.5790196, -0.7260837, 3.031471, 0, 0, 0, 1, 1,
0.5859354, -2.019531, 3.130614, 1, 1, 1, 1, 1,
0.5881827, 1.753126, -0.6659898, 1, 1, 1, 1, 1,
0.590513, -0.3771487, 1.755024, 1, 1, 1, 1, 1,
0.5920509, -0.3288876, 2.281533, 1, 1, 1, 1, 1,
0.5940073, 1.697738, 0.2012379, 1, 1, 1, 1, 1,
0.5991709, -0.5828313, 2.403883, 1, 1, 1, 1, 1,
0.6022406, -1.904889, 3.126392, 1, 1, 1, 1, 1,
0.6088306, -1.450099, 4.191456, 1, 1, 1, 1, 1,
0.6094961, 0.1493858, 2.773803, 1, 1, 1, 1, 1,
0.6125197, 0.9468755, 0.7716051, 1, 1, 1, 1, 1,
0.6188394, -2.459988, 1.182541, 1, 1, 1, 1, 1,
0.619394, -0.3142111, 0.9975705, 1, 1, 1, 1, 1,
0.6197834, 0.2158435, 1.083706, 1, 1, 1, 1, 1,
0.6200573, -0.1599112, 2.057507, 1, 1, 1, 1, 1,
0.6208041, -0.1318029, 1.621713, 1, 1, 1, 1, 1,
0.6210187, -1.168472, 2.111931, 0, 0, 1, 1, 1,
0.6234175, -1.412088, 3.962312, 1, 0, 0, 1, 1,
0.6292176, 1.537933, -0.6078534, 1, 0, 0, 1, 1,
0.6418567, 1.35602, 0.8783798, 1, 0, 0, 1, 1,
0.6437087, 0.6181956, 1.345306, 1, 0, 0, 1, 1,
0.6449097, -1.29763, 4.834841, 1, 0, 0, 1, 1,
0.6469292, -1.81686, 2.190732, 0, 0, 0, 1, 1,
0.649106, -0.6993963, 2.470654, 0, 0, 0, 1, 1,
0.6499702, 1.116017, -1.153941, 0, 0, 0, 1, 1,
0.6568254, 1.31001, -1.2791, 0, 0, 0, 1, 1,
0.6585195, -1.147343, 2.55587, 0, 0, 0, 1, 1,
0.6611465, 0.8210195, 0.4976338, 0, 0, 0, 1, 1,
0.6611857, 1.333238, 1.406458, 0, 0, 0, 1, 1,
0.6642113, -1.01519, 3.213361, 1, 1, 1, 1, 1,
0.6829931, -0.3694908, 2.765241, 1, 1, 1, 1, 1,
0.6867124, -1.044221, 1.218721, 1, 1, 1, 1, 1,
0.6870131, 0.4434169, 0.9531642, 1, 1, 1, 1, 1,
0.6881055, 0.9345722, 0.7982829, 1, 1, 1, 1, 1,
0.7044807, 1.077015, 0.02823971, 1, 1, 1, 1, 1,
0.7111442, 0.5159563, 0.4695587, 1, 1, 1, 1, 1,
0.7191166, 0.4719993, 1.065041, 1, 1, 1, 1, 1,
0.7242939, 1.950366, 2.695659, 1, 1, 1, 1, 1,
0.7303234, -1.319694, 2.404519, 1, 1, 1, 1, 1,
0.7323891, 0.1381777, 3.227917, 1, 1, 1, 1, 1,
0.734479, 0.008303649, 4.670411, 1, 1, 1, 1, 1,
0.7375084, -2.214561, 1.209499, 1, 1, 1, 1, 1,
0.7485279, 0.2750499, 2.05476, 1, 1, 1, 1, 1,
0.7518552, 1.466679, -0.9807274, 1, 1, 1, 1, 1,
0.7533318, -0.3006534, 2.904331, 0, 0, 1, 1, 1,
0.7535574, 1.427585, 0.4802251, 1, 0, 0, 1, 1,
0.7545587, 0.9433932, 1.257167, 1, 0, 0, 1, 1,
0.7603424, -0.5799906, 2.671536, 1, 0, 0, 1, 1,
0.7636688, 0.765924, 1.828611, 1, 0, 0, 1, 1,
0.7665507, -1.305572, 3.595547, 1, 0, 0, 1, 1,
0.7672122, -0.4643252, 2.007385, 0, 0, 0, 1, 1,
0.7683788, 1.106545, 0.09072592, 0, 0, 0, 1, 1,
0.7693852, 0.9393823, 0.4243163, 0, 0, 0, 1, 1,
0.769825, 1.106689, -0.4040307, 0, 0, 0, 1, 1,
0.7724234, 0.7369366, 0.5964509, 0, 0, 0, 1, 1,
0.7768648, 1.307054, 0.8665107, 0, 0, 0, 1, 1,
0.7787256, 1.380226, 1.181262, 0, 0, 0, 1, 1,
0.7809397, -0.4960652, 2.627125, 1, 1, 1, 1, 1,
0.7824979, -0.1122655, 2.740809, 1, 1, 1, 1, 1,
0.788307, 0.3918019, 2.284463, 1, 1, 1, 1, 1,
0.7905714, -0.4810697, 1.781037, 1, 1, 1, 1, 1,
0.7913739, 1.001757, 1.094797, 1, 1, 1, 1, 1,
0.7945291, -1.603086, 2.45126, 1, 1, 1, 1, 1,
0.8156722, 0.6321965, 1.201259, 1, 1, 1, 1, 1,
0.827395, -0.6486166, 2.367507, 1, 1, 1, 1, 1,
0.8289231, -0.3903123, 2.869117, 1, 1, 1, 1, 1,
0.8352721, 0.3094864, 1.83448, 1, 1, 1, 1, 1,
0.8353249, 0.6332129, 1.842458, 1, 1, 1, 1, 1,
0.8375927, 0.4484404, 0.925796, 1, 1, 1, 1, 1,
0.8393986, -0.9436164, 4.176114, 1, 1, 1, 1, 1,
0.8404794, 1.815649, 0.4310611, 1, 1, 1, 1, 1,
0.8429565, 0.9473736, -0.5691766, 1, 1, 1, 1, 1,
0.8434524, -0.930057, 0.6618399, 0, 0, 1, 1, 1,
0.846949, -0.312901, 0.9284053, 1, 0, 0, 1, 1,
0.8500828, 0.06928609, 1.290671, 1, 0, 0, 1, 1,
0.8608593, 0.9749995, 0.2365562, 1, 0, 0, 1, 1,
0.8616591, 0.03927445, 0.5747896, 1, 0, 0, 1, 1,
0.8630036, 0.7565593, 1.374081, 1, 0, 0, 1, 1,
0.8643105, 0.4158908, 2.391088, 0, 0, 0, 1, 1,
0.8669102, -1.995697, 1.38219, 0, 0, 0, 1, 1,
0.8693057, 0.2713934, 2.075728, 0, 0, 0, 1, 1,
0.8875797, -3.752273, 2.88563, 0, 0, 0, 1, 1,
0.9014452, -0.4505172, 2.923559, 0, 0, 0, 1, 1,
0.9049479, -0.8524139, 2.123043, 0, 0, 0, 1, 1,
0.9059475, -1.808721, 1.547114, 0, 0, 0, 1, 1,
0.9059501, 1.834206, -0.8750801, 1, 1, 1, 1, 1,
0.9078282, -0.9254217, 3.049054, 1, 1, 1, 1, 1,
0.9134596, 0.459625, 1.191995, 1, 1, 1, 1, 1,
0.922971, 1.388016, 2.838117, 1, 1, 1, 1, 1,
0.9239706, 0.3409266, -0.4723954, 1, 1, 1, 1, 1,
0.9266184, 1.915431, -0.4789084, 1, 1, 1, 1, 1,
0.9290159, -0.3407968, 3.076027, 1, 1, 1, 1, 1,
0.9372839, 0.5378072, 1.082826, 1, 1, 1, 1, 1,
0.9378993, 0.3903291, 2.614202, 1, 1, 1, 1, 1,
0.9436215, 0.4668565, -0.1362659, 1, 1, 1, 1, 1,
0.944695, -0.8136262, 3.134608, 1, 1, 1, 1, 1,
0.9481074, 2.017967, -1.657381, 1, 1, 1, 1, 1,
0.9517757, -0.1374314, 4.207982, 1, 1, 1, 1, 1,
0.9575734, 1.764775, 0.2915963, 1, 1, 1, 1, 1,
0.9616603, -0.1169799, 1.564299, 1, 1, 1, 1, 1,
0.9655087, 0.7591039, 2.342253, 0, 0, 1, 1, 1,
0.9670312, 0.518277, -0.6919309, 1, 0, 0, 1, 1,
0.9696912, -1.273099, 4.626131, 1, 0, 0, 1, 1,
0.9703925, 1.239405, 0.08285283, 1, 0, 0, 1, 1,
0.9716757, -1.095908, 3.748699, 1, 0, 0, 1, 1,
0.9735308, -0.1335152, 1.744845, 1, 0, 0, 1, 1,
0.9814157, 0.007843865, 1.202719, 0, 0, 0, 1, 1,
0.9828244, 0.1267784, 1.40842, 0, 0, 0, 1, 1,
0.9868786, 0.3087828, 1.762231, 0, 0, 0, 1, 1,
0.990463, 1.088621, 1.428405, 0, 0, 0, 1, 1,
0.9953505, -1.035023, 2.370366, 0, 0, 0, 1, 1,
1.000414, 0.1772884, 0.1058375, 0, 0, 0, 1, 1,
1.002859, -0.6442031, 1.492911, 0, 0, 0, 1, 1,
1.002923, 0.5962564, 1.476693, 1, 1, 1, 1, 1,
1.009181, 1.06804, 0.1132379, 1, 1, 1, 1, 1,
1.014535, 0.3990512, 0.9736534, 1, 1, 1, 1, 1,
1.020488, 2.090606, -0.1261054, 1, 1, 1, 1, 1,
1.02337, 1.062606, 0.4292233, 1, 1, 1, 1, 1,
1.026217, 1.079693, 0.5363709, 1, 1, 1, 1, 1,
1.026361, -0.3642214, 1.701786, 1, 1, 1, 1, 1,
1.02779, 1.123413, 0.4107351, 1, 1, 1, 1, 1,
1.030398, 2.238759, 0.6696564, 1, 1, 1, 1, 1,
1.030913, 0.09744754, 0.6395902, 1, 1, 1, 1, 1,
1.03199, -1.132253, 2.559815, 1, 1, 1, 1, 1,
1.04255, 1.703917, 0.2250478, 1, 1, 1, 1, 1,
1.047215, 0.03390993, 1.318173, 1, 1, 1, 1, 1,
1.049854, 1.127466, -0.4233805, 1, 1, 1, 1, 1,
1.061195, 1.187016, 1.148247, 1, 1, 1, 1, 1,
1.071278, 0.1758331, 3.976734, 0, 0, 1, 1, 1,
1.08114, 0.9922765, 0.1596778, 1, 0, 0, 1, 1,
1.095062, 0.45912, 1.686656, 1, 0, 0, 1, 1,
1.096045, -0.9908843, 3.287587, 1, 0, 0, 1, 1,
1.099092, 1.229048, 0.5368225, 1, 0, 0, 1, 1,
1.102086, -0.4253565, 3.284669, 1, 0, 0, 1, 1,
1.10467, -1.658858, 2.310713, 0, 0, 0, 1, 1,
1.107359, -0.4250784, 2.75606, 0, 0, 0, 1, 1,
1.125512, -1.041666, 3.460148, 0, 0, 0, 1, 1,
1.127664, 0.7478929, 1.83089, 0, 0, 0, 1, 1,
1.136769, 1.954195, 0.05685331, 0, 0, 0, 1, 1,
1.141184, -0.8737429, 0.9564247, 0, 0, 0, 1, 1,
1.144788, 1.254536, -0.4075266, 0, 0, 0, 1, 1,
1.148117, -1.132056, 2.293047, 1, 1, 1, 1, 1,
1.150478, -0.8680652, 0.966698, 1, 1, 1, 1, 1,
1.152403, 0.001960913, 3.09065, 1, 1, 1, 1, 1,
1.157916, -0.2242286, 0.8450712, 1, 1, 1, 1, 1,
1.159898, 0.9987762, 0.525602, 1, 1, 1, 1, 1,
1.168347, 0.565764, 1.052339, 1, 1, 1, 1, 1,
1.169406, 2.331507, 2.62349, 1, 1, 1, 1, 1,
1.173955, 1.077332, 1.599123, 1, 1, 1, 1, 1,
1.174082, 0.7967293, 2.119753, 1, 1, 1, 1, 1,
1.179026, 1.084595, 2.163855, 1, 1, 1, 1, 1,
1.179329, -0.0009382972, 1.822232, 1, 1, 1, 1, 1,
1.180845, -1.009167, 2.662645, 1, 1, 1, 1, 1,
1.190259, -0.9941356, 1.05936, 1, 1, 1, 1, 1,
1.198729, -0.5354294, 0.8884484, 1, 1, 1, 1, 1,
1.202797, -0.5510818, 3.409242, 1, 1, 1, 1, 1,
1.205627, 0.5105339, 0.09663501, 0, 0, 1, 1, 1,
1.207042, -1.174042, 3.743041, 1, 0, 0, 1, 1,
1.209091, 1.21111, 2.680553, 1, 0, 0, 1, 1,
1.215393, 1.882627, 1.03502, 1, 0, 0, 1, 1,
1.22351, -0.6426169, 2.981749, 1, 0, 0, 1, 1,
1.230024, -0.1555736, 2.019262, 1, 0, 0, 1, 1,
1.234024, 0.5740305, 2.76422, 0, 0, 0, 1, 1,
1.236034, -0.1105449, 0.06469683, 0, 0, 0, 1, 1,
1.242033, -1.914994, 2.935741, 0, 0, 0, 1, 1,
1.243785, -0.7340099, 2.514712, 0, 0, 0, 1, 1,
1.252949, -0.2776973, 1.407749, 0, 0, 0, 1, 1,
1.25348, 0.07522728, 2.876717, 0, 0, 0, 1, 1,
1.254075, 0.5407808, 1.913457, 0, 0, 0, 1, 1,
1.255417, 0.5741379, 1.424507, 1, 1, 1, 1, 1,
1.256478, 0.3200351, 1.716447, 1, 1, 1, 1, 1,
1.261335, 0.1251353, 2.159009, 1, 1, 1, 1, 1,
1.263066, -0.6561508, 2.806004, 1, 1, 1, 1, 1,
1.263768, 0.006733814, 2.751414, 1, 1, 1, 1, 1,
1.265492, 1.108035, 1.239014, 1, 1, 1, 1, 1,
1.269535, -0.1392901, -0.6363893, 1, 1, 1, 1, 1,
1.278491, 0.5357193, 1.346307, 1, 1, 1, 1, 1,
1.278958, 0.5007864, 0.9458289, 1, 1, 1, 1, 1,
1.279537, 0.6397997, 1.69919, 1, 1, 1, 1, 1,
1.2804, 0.2257495, 1.342286, 1, 1, 1, 1, 1,
1.281888, -0.213778, 2.872076, 1, 1, 1, 1, 1,
1.288387, -0.5382116, 2.463741, 1, 1, 1, 1, 1,
1.290393, -0.6895131, 0.6522309, 1, 1, 1, 1, 1,
1.296503, -0.2122077, 0.5964302, 1, 1, 1, 1, 1,
1.302831, 0.0003127397, 1.780847, 0, 0, 1, 1, 1,
1.304238, -0.967113, 1.076809, 1, 0, 0, 1, 1,
1.306014, -0.6528734, 1.473004, 1, 0, 0, 1, 1,
1.315838, 0.6353276, 2.527326, 1, 0, 0, 1, 1,
1.330996, 2.771652, -0.3148782, 1, 0, 0, 1, 1,
1.350444, -1.199862, 1.375107, 1, 0, 0, 1, 1,
1.353253, -1.847538, 2.316575, 0, 0, 0, 1, 1,
1.355656, 0.7937113, 0.7624913, 0, 0, 0, 1, 1,
1.363894, -1.182213, 3.293343, 0, 0, 0, 1, 1,
1.373512, -0.5960674, 1.994313, 0, 0, 0, 1, 1,
1.378854, 0.6282352, 2.630039, 0, 0, 0, 1, 1,
1.384606, -0.884874, 2.221367, 0, 0, 0, 1, 1,
1.387141, -0.1923606, 2.205693, 0, 0, 0, 1, 1,
1.391913, -0.5275125, 1.641324, 1, 1, 1, 1, 1,
1.400484, -0.5605825, 0.9287269, 1, 1, 1, 1, 1,
1.404095, -0.7198573, 2.068111, 1, 1, 1, 1, 1,
1.407263, 0.0924319, 1.428208, 1, 1, 1, 1, 1,
1.416044, -1.765324, 2.14322, 1, 1, 1, 1, 1,
1.433299, -0.279623, 1.724412, 1, 1, 1, 1, 1,
1.447366, -0.253463, 1.593577, 1, 1, 1, 1, 1,
1.453488, -0.08263361, 0.8287705, 1, 1, 1, 1, 1,
1.457248, -0.335795, 2.62501, 1, 1, 1, 1, 1,
1.48891, 0.9714904, 0.4794698, 1, 1, 1, 1, 1,
1.491715, 0.4357848, 1.08108, 1, 1, 1, 1, 1,
1.506131, -0.01914796, 2.040604, 1, 1, 1, 1, 1,
1.511515, 1.11221, -1.354249, 1, 1, 1, 1, 1,
1.51885, -0.7021341, 3.757909, 1, 1, 1, 1, 1,
1.525975, -0.2536272, 2.586125, 1, 1, 1, 1, 1,
1.529926, -0.4048287, -1.852884, 0, 0, 1, 1, 1,
1.533882, 0.8674576, 1.636145, 1, 0, 0, 1, 1,
1.605178, 0.6220101, 0.1676689, 1, 0, 0, 1, 1,
1.613295, -2.241241, 2.414538, 1, 0, 0, 1, 1,
1.624631, -0.1741166, 1.276362, 1, 0, 0, 1, 1,
1.626067, -0.4331951, 1.629567, 1, 0, 0, 1, 1,
1.628139, -0.7907707, 4.803989, 0, 0, 0, 1, 1,
1.631692, 1.814322, 1.612243, 0, 0, 0, 1, 1,
1.633902, -0.1236943, 2.340649, 0, 0, 0, 1, 1,
1.637118, -0.6211476, 0.4564566, 0, 0, 0, 1, 1,
1.639174, 0.5810173, 0.2291901, 0, 0, 0, 1, 1,
1.658302, 1.05474, 0.4080025, 0, 0, 0, 1, 1,
1.66362, -1.160918, 1.979215, 0, 0, 0, 1, 1,
1.665657, -0.5702393, 1.538324, 1, 1, 1, 1, 1,
1.67229, -1.125739, 0.0213596, 1, 1, 1, 1, 1,
1.677838, -0.7413799, 2.466383, 1, 1, 1, 1, 1,
1.69853, 0.08638401, 1.963127, 1, 1, 1, 1, 1,
1.703577, -1.568072, 2.531842, 1, 1, 1, 1, 1,
1.708107, -1.003668, 0.484644, 1, 1, 1, 1, 1,
1.762291, -0.5056949, 0.9528559, 1, 1, 1, 1, 1,
1.785864, -1.0576, 0.4958985, 1, 1, 1, 1, 1,
1.787157, 0.7515983, 2.240571, 1, 1, 1, 1, 1,
1.81, 0.8871835, 1.586655, 1, 1, 1, 1, 1,
1.863528, -0.9328493, 1.806692, 1, 1, 1, 1, 1,
1.86522, 1.739015, 2.555926, 1, 1, 1, 1, 1,
1.877051, 1.89243, 2.489508, 1, 1, 1, 1, 1,
1.923128, -0.3689165, 3.466446, 1, 1, 1, 1, 1,
1.928499, 0.06212848, 2.216208, 1, 1, 1, 1, 1,
1.941295, -1.482999, 3.108388, 0, 0, 1, 1, 1,
1.971913, 1.218313, -0.2817342, 1, 0, 0, 1, 1,
1.979167, -1.366346, 3.04813, 1, 0, 0, 1, 1,
1.996052, 0.3901957, 1.144853, 1, 0, 0, 1, 1,
2.004196, -0.939352, 1.04569, 1, 0, 0, 1, 1,
2.026281, -0.5853244, 3.355938, 1, 0, 0, 1, 1,
2.068072, 0.05444984, 2.074516, 0, 0, 0, 1, 1,
2.073151, 1.991916, 0.530301, 0, 0, 0, 1, 1,
2.157213, 0.1580241, 1.035946, 0, 0, 0, 1, 1,
2.201576, -0.8340113, 0.6730748, 0, 0, 0, 1, 1,
2.234488, 0.3989346, 2.021389, 0, 0, 0, 1, 1,
2.279983, -0.4161706, 0.1767792, 0, 0, 0, 1, 1,
2.304484, 1.522377, -0.06486471, 0, 0, 0, 1, 1,
2.389014, -0.7658683, 1.040182, 1, 1, 1, 1, 1,
2.501038, -0.1350914, 1.099406, 1, 1, 1, 1, 1,
2.503734, -0.8926122, 1.808408, 1, 1, 1, 1, 1,
2.532523, -1.456339, 4.911065, 1, 1, 1, 1, 1,
2.536603, -0.9391932, 0.589201, 1, 1, 1, 1, 1,
2.578032, -0.7822754, 0.343686, 1, 1, 1, 1, 1,
3.177912, -0.1813778, 1.797419, 1, 1, 1, 1, 1
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
var radius = 9.723231;
var distance = 34.15244;
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
mvMatrix.translate( -0.1218871, 0.4844822, -0.008183002 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.15244);
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
