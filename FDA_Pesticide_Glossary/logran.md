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
-3.14063, 0.02294887, -0.8220984, 1, 0, 0, 1,
-2.876947, -0.6195417, -1.819912, 1, 0.007843138, 0, 1,
-2.682746, 0.4421868, -1.880165, 1, 0.01176471, 0, 1,
-2.660182, 0.6959569, -0.05132267, 1, 0.01960784, 0, 1,
-2.517876, 1.293267, -0.6097924, 1, 0.02352941, 0, 1,
-2.455172, 0.6370451, -2.065383, 1, 0.03137255, 0, 1,
-2.415819, -0.9142336, -2.059048, 1, 0.03529412, 0, 1,
-2.409477, -0.3754908, -2.990437, 1, 0.04313726, 0, 1,
-2.366668, 1.156829, -0.6103947, 1, 0.04705882, 0, 1,
-2.362052, -0.403018, -2.220705, 1, 0.05490196, 0, 1,
-2.256307, 1.538138, -2.022627, 1, 0.05882353, 0, 1,
-2.231241, -0.2660963, -0.9262616, 1, 0.06666667, 0, 1,
-2.219476, -0.3826005, -0.723698, 1, 0.07058824, 0, 1,
-2.21506, 1.054329, -0.7107061, 1, 0.07843138, 0, 1,
-2.200038, 0.5170735, -1.776086, 1, 0.08235294, 0, 1,
-2.134864, 0.3314728, -1.462764, 1, 0.09019608, 0, 1,
-2.128909, -0.04809872, -1.440344, 1, 0.09411765, 0, 1,
-2.111794, -0.542034, -2.39431, 1, 0.1019608, 0, 1,
-2.084676, 0.9851637, -2.078883, 1, 0.1098039, 0, 1,
-2.079381, -0.6113302, -1.564863, 1, 0.1137255, 0, 1,
-2.07108, -1.024966, -0.8370851, 1, 0.1215686, 0, 1,
-2.008732, 0.07611998, -1.204446, 1, 0.1254902, 0, 1,
-2.005831, -0.2484419, -3.26, 1, 0.1333333, 0, 1,
-1.991674, 1.290275, -0.7418143, 1, 0.1372549, 0, 1,
-1.986275, -1.822319, -1.353323, 1, 0.145098, 0, 1,
-1.979958, 0.5567446, -1.061338, 1, 0.1490196, 0, 1,
-1.956314, 1.097057, -1.527428, 1, 0.1568628, 0, 1,
-1.949488, 0.5556912, -0.8536978, 1, 0.1607843, 0, 1,
-1.947312, -1.14501, -2.457059, 1, 0.1686275, 0, 1,
-1.94664, -0.5373936, -1.687758, 1, 0.172549, 0, 1,
-1.937534, 0.7616752, 0.5240573, 1, 0.1803922, 0, 1,
-1.932024, 0.6849436, -1.3262, 1, 0.1843137, 0, 1,
-1.90633, 1.417177, -0.5294485, 1, 0.1921569, 0, 1,
-1.906178, -1.898232, -2.984288, 1, 0.1960784, 0, 1,
-1.893152, -2.289941, -2.334847, 1, 0.2039216, 0, 1,
-1.869796, 0.259162, -1.859996, 1, 0.2117647, 0, 1,
-1.864953, -0.7288476, -0.7119996, 1, 0.2156863, 0, 1,
-1.818587, 0.9975191, -1.442732, 1, 0.2235294, 0, 1,
-1.802307, 0.3156592, -1.77117, 1, 0.227451, 0, 1,
-1.769324, 1.866624, 0.6857412, 1, 0.2352941, 0, 1,
-1.768669, 0.4315852, -1.45701, 1, 0.2392157, 0, 1,
-1.767122, -1.411943, -1.859779, 1, 0.2470588, 0, 1,
-1.763559, 0.1278452, -4.008127, 1, 0.2509804, 0, 1,
-1.733385, 0.5022993, -1.707581, 1, 0.2588235, 0, 1,
-1.724738, -0.4615216, -2.161178, 1, 0.2627451, 0, 1,
-1.720534, 0.17615, -2.911422, 1, 0.2705882, 0, 1,
-1.719282, 1.124892, -0.7603769, 1, 0.2745098, 0, 1,
-1.7177, 2.336079, -1.017373, 1, 0.282353, 0, 1,
-1.692207, -0.5510691, -1.891072, 1, 0.2862745, 0, 1,
-1.691976, 2.185349, -0.231774, 1, 0.2941177, 0, 1,
-1.685649, 1.242832, -2.254379, 1, 0.3019608, 0, 1,
-1.683239, 0.7884228, -1.336862, 1, 0.3058824, 0, 1,
-1.68284, -0.8625073, -1.42104, 1, 0.3137255, 0, 1,
-1.664908, 0.1436613, -0.9242402, 1, 0.3176471, 0, 1,
-1.661113, 0.3309329, 1.219399, 1, 0.3254902, 0, 1,
-1.657376, -0.2270518, -3.080824, 1, 0.3294118, 0, 1,
-1.618151, 1.200649, 0.2619225, 1, 0.3372549, 0, 1,
-1.616072, 0.09528973, 1.189111, 1, 0.3411765, 0, 1,
-1.605983, 0.3310811, -2.39784, 1, 0.3490196, 0, 1,
-1.601199, -0.6927428, -3.254495, 1, 0.3529412, 0, 1,
-1.596793, 0.7403975, -1.428926, 1, 0.3607843, 0, 1,
-1.595196, 0.2748862, -1.078837, 1, 0.3647059, 0, 1,
-1.59411, 0.5846528, -1.937116, 1, 0.372549, 0, 1,
-1.587934, 0.4345992, -0.3959379, 1, 0.3764706, 0, 1,
-1.586592, -1.735515, -1.896612, 1, 0.3843137, 0, 1,
-1.573353, 1.247211, -1.665343, 1, 0.3882353, 0, 1,
-1.572123, 0.7608727, -1.581049, 1, 0.3960784, 0, 1,
-1.571877, 0.4159657, -0.2972136, 1, 0.4039216, 0, 1,
-1.571387, 0.5343701, 0.1114951, 1, 0.4078431, 0, 1,
-1.569374, -0.2219003, -0.5771551, 1, 0.4156863, 0, 1,
-1.56757, -0.7110028, -4.021816, 1, 0.4196078, 0, 1,
-1.556872, 0.1446073, -1.981024, 1, 0.427451, 0, 1,
-1.555927, 0.3577111, -2.107191, 1, 0.4313726, 0, 1,
-1.554135, 0.08835359, -1.350338, 1, 0.4392157, 0, 1,
-1.553656, 0.2448367, 0.9226375, 1, 0.4431373, 0, 1,
-1.553285, -1.129671, -2.405872, 1, 0.4509804, 0, 1,
-1.541614, -0.3900608, -4.200765, 1, 0.454902, 0, 1,
-1.532337, -0.04489731, -2.376938, 1, 0.4627451, 0, 1,
-1.522616, -0.4502789, -3.088637, 1, 0.4666667, 0, 1,
-1.521512, 1.030196, -0.6085671, 1, 0.4745098, 0, 1,
-1.519562, -1.045885, -1.58648, 1, 0.4784314, 0, 1,
-1.519531, 1.660102, -1.307059, 1, 0.4862745, 0, 1,
-1.493604, 0.2200246, -2.125459, 1, 0.4901961, 0, 1,
-1.489582, -1.276648, -2.210279, 1, 0.4980392, 0, 1,
-1.486159, 0.543583, -1.834046, 1, 0.5058824, 0, 1,
-1.478229, -1.338767, -0.6578139, 1, 0.509804, 0, 1,
-1.474178, -0.6785412, -3.740881, 1, 0.5176471, 0, 1,
-1.469728, 0.2810717, -1.933242, 1, 0.5215687, 0, 1,
-1.465812, -0.8204871, -0.708712, 1, 0.5294118, 0, 1,
-1.461442, 0.46748, -1.364572, 1, 0.5333334, 0, 1,
-1.459835, 0.07949391, -2.262663, 1, 0.5411765, 0, 1,
-1.446078, -0.960315, 0.1832924, 1, 0.5450981, 0, 1,
-1.446073, 0.7037669, -0.7870024, 1, 0.5529412, 0, 1,
-1.444485, -0.6066382, -0.5989773, 1, 0.5568628, 0, 1,
-1.442735, 1.557836, 0.2583323, 1, 0.5647059, 0, 1,
-1.431157, 2.011495, -1.06613, 1, 0.5686275, 0, 1,
-1.425615, 1.028712, -0.9908069, 1, 0.5764706, 0, 1,
-1.423639, 0.342802, -2.834456, 1, 0.5803922, 0, 1,
-1.419547, 0.1747217, -1.735283, 1, 0.5882353, 0, 1,
-1.404276, 0.08553246, -1.711352, 1, 0.5921569, 0, 1,
-1.401183, -0.3017467, -1.02993, 1, 0.6, 0, 1,
-1.397752, -1.343212, -4.969051, 1, 0.6078432, 0, 1,
-1.384972, -0.6023281, -3.097325, 1, 0.6117647, 0, 1,
-1.376873, -0.5732078, -0.7210237, 1, 0.6196079, 0, 1,
-1.376029, 0.6250572, -2.922006, 1, 0.6235294, 0, 1,
-1.374169, -1.092631, -2.709437, 1, 0.6313726, 0, 1,
-1.365308, -0.2841029, -1.02497, 1, 0.6352941, 0, 1,
-1.361825, 1.305551, -1.129856, 1, 0.6431373, 0, 1,
-1.358182, 2.17537, 0.2097541, 1, 0.6470588, 0, 1,
-1.356939, 0.1878472, -1.271015, 1, 0.654902, 0, 1,
-1.356497, -0.5655282, -2.043048, 1, 0.6588235, 0, 1,
-1.355413, 0.2632449, -1.508394, 1, 0.6666667, 0, 1,
-1.34986, 0.1903804, -3.399147, 1, 0.6705883, 0, 1,
-1.345958, 0.2368129, -0.1533598, 1, 0.6784314, 0, 1,
-1.343643, -1.003915, -3.651198, 1, 0.682353, 0, 1,
-1.341428, 0.9371632, -2.307393, 1, 0.6901961, 0, 1,
-1.3406, 0.807076, -0.6485647, 1, 0.6941177, 0, 1,
-1.329025, 0.1006304, -2.926973, 1, 0.7019608, 0, 1,
-1.320699, 0.2413943, -1.038512, 1, 0.7098039, 0, 1,
-1.320395, 1.053212, -1.014021, 1, 0.7137255, 0, 1,
-1.305519, 0.4666588, -0.720594, 1, 0.7215686, 0, 1,
-1.30169, -1.727596, -2.30162, 1, 0.7254902, 0, 1,
-1.299694, -0.819159, -1.970083, 1, 0.7333333, 0, 1,
-1.297216, -0.2950418, -1.547516, 1, 0.7372549, 0, 1,
-1.292436, -0.2098871, -2.646364, 1, 0.7450981, 0, 1,
-1.289928, -0.3921107, -1.011588, 1, 0.7490196, 0, 1,
-1.277984, 0.5792308, -0.8407339, 1, 0.7568628, 0, 1,
-1.27254, -1.300536, -1.107384, 1, 0.7607843, 0, 1,
-1.272029, 0.2970956, -0.476086, 1, 0.7686275, 0, 1,
-1.267025, -0.673436, -1.394831, 1, 0.772549, 0, 1,
-1.264949, 2.146354, -0.3515314, 1, 0.7803922, 0, 1,
-1.25848, -0.07411461, -2.435655, 1, 0.7843137, 0, 1,
-1.255638, 0.4816737, -2.276095, 1, 0.7921569, 0, 1,
-1.24824, 2.093435, 1.210259, 1, 0.7960784, 0, 1,
-1.245681, 0.2130204, -2.653073, 1, 0.8039216, 0, 1,
-1.245339, 2.109953, 1.836966, 1, 0.8117647, 0, 1,
-1.244795, -0.4220679, -1.801953, 1, 0.8156863, 0, 1,
-1.237299, 2.67362, -2.025511, 1, 0.8235294, 0, 1,
-1.236294, -0.04205044, -0.5509254, 1, 0.827451, 0, 1,
-1.236248, 0.7607981, -1.095287, 1, 0.8352941, 0, 1,
-1.220883, -2.433108, -0.6279713, 1, 0.8392157, 0, 1,
-1.217024, -1.612952, -4.076058, 1, 0.8470588, 0, 1,
-1.208062, -1.49823, -2.252493, 1, 0.8509804, 0, 1,
-1.206057, -1.087825, -3.317638, 1, 0.8588235, 0, 1,
-1.205923, -1.346703, -3.232635, 1, 0.8627451, 0, 1,
-1.203842, -1.826505, -2.629144, 1, 0.8705882, 0, 1,
-1.200906, 0.7565317, -1.137925, 1, 0.8745098, 0, 1,
-1.189635, -0.666867, -3.179043, 1, 0.8823529, 0, 1,
-1.187603, 1.331682, -1.10846, 1, 0.8862745, 0, 1,
-1.185901, -1.253212, -3.063818, 1, 0.8941177, 0, 1,
-1.178224, 0.1745578, -2.445332, 1, 0.8980392, 0, 1,
-1.178176, -0.1470716, -0.8585731, 1, 0.9058824, 0, 1,
-1.17674, -0.0950407, -1.427201, 1, 0.9137255, 0, 1,
-1.166396, -1.12206, -3.729429, 1, 0.9176471, 0, 1,
-1.165437, -2.63703, -3.993001, 1, 0.9254902, 0, 1,
-1.163514, 1.059429, -0.8464136, 1, 0.9294118, 0, 1,
-1.162253, -0.6572995, -1.270305, 1, 0.9372549, 0, 1,
-1.159941, 1.476887, 0.1955337, 1, 0.9411765, 0, 1,
-1.158367, 0.3153536, -2.055763, 1, 0.9490196, 0, 1,
-1.157616, -0.7800385, -1.776622, 1, 0.9529412, 0, 1,
-1.151884, -0.4941322, -1.613374, 1, 0.9607843, 0, 1,
-1.148928, -0.4147226, -1.455702, 1, 0.9647059, 0, 1,
-1.139403, 1.096204, -0.4428835, 1, 0.972549, 0, 1,
-1.130968, 0.888836, -1.646916, 1, 0.9764706, 0, 1,
-1.120488, -0.1914405, -1.268901, 1, 0.9843137, 0, 1,
-1.119922, -0.1669729, -3.792228, 1, 0.9882353, 0, 1,
-1.118461, 0.09773979, -2.175097, 1, 0.9960784, 0, 1,
-1.114037, -0.6185646, -2.002808, 0.9960784, 1, 0, 1,
-1.110377, 0.2881835, 0.432317, 0.9921569, 1, 0, 1,
-1.107285, 1.465972, -0.8715369, 0.9843137, 1, 0, 1,
-1.098831, -0.4919566, -2.382013, 0.9803922, 1, 0, 1,
-1.09596, 0.8743238, -1.348536, 0.972549, 1, 0, 1,
-1.092921, 0.2669992, -3.205764, 0.9686275, 1, 0, 1,
-1.083527, -0.8227017, -1.534967, 0.9607843, 1, 0, 1,
-1.083189, 0.2923155, -1.270278, 0.9568627, 1, 0, 1,
-1.083185, -0.6092591, 0.2743489, 0.9490196, 1, 0, 1,
-1.07485, 0.8575908, -1.407501, 0.945098, 1, 0, 1,
-1.065957, -1.467035, -2.601768, 0.9372549, 1, 0, 1,
-1.055812, 0.2949598, -1.374377, 0.9333333, 1, 0, 1,
-1.052405, -0.3515099, -2.609847, 0.9254902, 1, 0, 1,
-1.051327, 0.257089, -0.7826743, 0.9215686, 1, 0, 1,
-1.050755, -0.5182461, -2.011166, 0.9137255, 1, 0, 1,
-1.046046, -0.8666573, -3.006403, 0.9098039, 1, 0, 1,
-1.034779, 0.06724841, -1.597446, 0.9019608, 1, 0, 1,
-1.033891, 0.1567288, -0.0139322, 0.8941177, 1, 0, 1,
-1.029907, 1.127986, -1.247983, 0.8901961, 1, 0, 1,
-1.029837, -0.4240691, -3.794227, 0.8823529, 1, 0, 1,
-1.028018, -0.6921998, -0.3962995, 0.8784314, 1, 0, 1,
-1.01725, -0.7634908, -2.084714, 0.8705882, 1, 0, 1,
-1.01394, 0.4102733, -1.211108, 0.8666667, 1, 0, 1,
-1.013843, 0.8646821, 0.1984648, 0.8588235, 1, 0, 1,
-1.011813, -0.407989, -1.509567, 0.854902, 1, 0, 1,
-1.00899, 0.2046242, -2.041415, 0.8470588, 1, 0, 1,
-1.007599, -0.9805729, -1.477242, 0.8431373, 1, 0, 1,
-1.002411, -1.455253, -1.934999, 0.8352941, 1, 0, 1,
-1.001502, 1.833809, -0.928848, 0.8313726, 1, 0, 1,
-0.9999623, -1.955507, -3.186151, 0.8235294, 1, 0, 1,
-0.9979048, 0.4778979, -0.6556283, 0.8196079, 1, 0, 1,
-0.995651, -1.081527, -3.104794, 0.8117647, 1, 0, 1,
-0.9923055, -0.04553036, -2.255676, 0.8078431, 1, 0, 1,
-0.9812274, -0.2033792, -2.11875, 0.8, 1, 0, 1,
-0.9756406, 0.1203297, -1.287982, 0.7921569, 1, 0, 1,
-0.9693083, 0.215153, 0.2456779, 0.7882353, 1, 0, 1,
-0.9675911, -0.5969412, -1.820943, 0.7803922, 1, 0, 1,
-0.9650895, 0.09542651, -0.7277472, 0.7764706, 1, 0, 1,
-0.9587963, 2.420064, -1.188543, 0.7686275, 1, 0, 1,
-0.9584408, -0.7022622, -2.903953, 0.7647059, 1, 0, 1,
-0.9583351, 0.1959491, -1.233344, 0.7568628, 1, 0, 1,
-0.9530548, -0.1186541, -0.2576695, 0.7529412, 1, 0, 1,
-0.9522516, -1.882395, -3.967887, 0.7450981, 1, 0, 1,
-0.9491479, 0.8196244, 0.854139, 0.7411765, 1, 0, 1,
-0.9444784, -0.2751318, -1.650751, 0.7333333, 1, 0, 1,
-0.9398848, 0.5683496, -2.448169, 0.7294118, 1, 0, 1,
-0.935927, -0.1347481, -0.9862468, 0.7215686, 1, 0, 1,
-0.9332788, -1.328642, -2.450507, 0.7176471, 1, 0, 1,
-0.931181, -0.5243563, -1.201128, 0.7098039, 1, 0, 1,
-0.9273945, -0.06699696, -0.2799913, 0.7058824, 1, 0, 1,
-0.9245696, -0.8243233, -3.38239, 0.6980392, 1, 0, 1,
-0.9140384, 0.4960531, -2.361773, 0.6901961, 1, 0, 1,
-0.9123328, 1.24447, -0.3528004, 0.6862745, 1, 0, 1,
-0.9121594, -0.3759268, -0.9764503, 0.6784314, 1, 0, 1,
-0.8909758, 2.33272, -1.792743, 0.6745098, 1, 0, 1,
-0.8857575, 0.4736824, 0.1771348, 0.6666667, 1, 0, 1,
-0.8849776, 0.662087, -2.475457, 0.6627451, 1, 0, 1,
-0.8830732, -0.4927085, -1.660322, 0.654902, 1, 0, 1,
-0.8809994, -0.7538396, -4.646491, 0.6509804, 1, 0, 1,
-0.8806252, 0.2896633, -2.82769, 0.6431373, 1, 0, 1,
-0.8789796, -0.7136852, -1.839572, 0.6392157, 1, 0, 1,
-0.8755559, 0.03708288, -2.28801, 0.6313726, 1, 0, 1,
-0.8749819, 0.7530314, -0.2769737, 0.627451, 1, 0, 1,
-0.8729808, 1.489086, -2.048981, 0.6196079, 1, 0, 1,
-0.8630738, 0.3426451, -1.549129, 0.6156863, 1, 0, 1,
-0.8606175, -0.25792, -0.8328838, 0.6078432, 1, 0, 1,
-0.8580306, -0.07767513, -2.355679, 0.6039216, 1, 0, 1,
-0.8536879, -1.213466, -3.143254, 0.5960785, 1, 0, 1,
-0.8468623, -0.6561081, -3.326453, 0.5882353, 1, 0, 1,
-0.8431326, 1.027068, 0.053808, 0.5843138, 1, 0, 1,
-0.8424509, 1.771652, -1.169242, 0.5764706, 1, 0, 1,
-0.8417097, 1.01473, -2.476274, 0.572549, 1, 0, 1,
-0.8407782, 1.16071, -1.004472, 0.5647059, 1, 0, 1,
-0.8397561, -0.6292542, -1.375742, 0.5607843, 1, 0, 1,
-0.8394184, 2.711146, -0.8566822, 0.5529412, 1, 0, 1,
-0.8342028, -0.5201266, -2.466056, 0.5490196, 1, 0, 1,
-0.8291857, 1.215123, 0.211302, 0.5411765, 1, 0, 1,
-0.827464, -1.126253, -3.190122, 0.5372549, 1, 0, 1,
-0.8259419, 0.01683185, -2.515234, 0.5294118, 1, 0, 1,
-0.8239397, -1.630592, -1.693534, 0.5254902, 1, 0, 1,
-0.8235362, -0.4338598, -1.571736, 0.5176471, 1, 0, 1,
-0.8193102, -1.831999, -2.17619, 0.5137255, 1, 0, 1,
-0.8160517, -0.7372693, -0.584866, 0.5058824, 1, 0, 1,
-0.815001, -0.01551547, -0.4307938, 0.5019608, 1, 0, 1,
-0.8149805, 0.5014386, -1.489491, 0.4941176, 1, 0, 1,
-0.8130876, -0.6098653, -3.451772, 0.4862745, 1, 0, 1,
-0.8094091, -0.295572, -0.4217764, 0.4823529, 1, 0, 1,
-0.8068869, 0.3460496, -0.6532556, 0.4745098, 1, 0, 1,
-0.8036754, 1.375196, -2.532127, 0.4705882, 1, 0, 1,
-0.8004133, 0.6399729, -1.470486, 0.4627451, 1, 0, 1,
-0.7955711, -1.139373, -2.12736, 0.4588235, 1, 0, 1,
-0.7953379, 2.564689, -0.1847138, 0.4509804, 1, 0, 1,
-0.7904835, 0.9178988, -0.4197956, 0.4470588, 1, 0, 1,
-0.7754133, 0.3424277, -0.7783675, 0.4392157, 1, 0, 1,
-0.7645952, 0.7173411, -0.466231, 0.4352941, 1, 0, 1,
-0.7645155, -1.324006, -3.943696, 0.427451, 1, 0, 1,
-0.7548439, -1.123398, -3.013596, 0.4235294, 1, 0, 1,
-0.753773, -1.885489, -2.077633, 0.4156863, 1, 0, 1,
-0.7534295, 0.9872828, -0.9639113, 0.4117647, 1, 0, 1,
-0.7461767, -0.8447453, -2.928922, 0.4039216, 1, 0, 1,
-0.7435731, -0.9505098, -2.987144, 0.3960784, 1, 0, 1,
-0.7431275, 0.913519, 0.7100009, 0.3921569, 1, 0, 1,
-0.7419804, -0.1412087, -2.162564, 0.3843137, 1, 0, 1,
-0.7403167, 1.233682, 1.2135, 0.3803922, 1, 0, 1,
-0.7314972, -1.045019, -1.958516, 0.372549, 1, 0, 1,
-0.7311102, 0.9815659, -0.5690544, 0.3686275, 1, 0, 1,
-0.7271867, -0.3304746, -0.778258, 0.3607843, 1, 0, 1,
-0.7257459, 1.198489, -1.454969, 0.3568628, 1, 0, 1,
-0.7199053, -0.1402636, -2.028821, 0.3490196, 1, 0, 1,
-0.7169721, 0.06507097, -2.06722, 0.345098, 1, 0, 1,
-0.7147903, 0.6677227, -0.6847195, 0.3372549, 1, 0, 1,
-0.7133329, -0.2256151, -0.3765892, 0.3333333, 1, 0, 1,
-0.710997, -0.4201077, -1.477735, 0.3254902, 1, 0, 1,
-0.7019771, -0.3651178, -3.66866, 0.3215686, 1, 0, 1,
-0.699053, 0.9119846, -0.5041774, 0.3137255, 1, 0, 1,
-0.6946922, -0.2198671, -0.1247445, 0.3098039, 1, 0, 1,
-0.6938663, -0.1062604, -1.822654, 0.3019608, 1, 0, 1,
-0.6874179, 1.840006, 1.12461, 0.2941177, 1, 0, 1,
-0.6871474, 0.5394735, 0.08118928, 0.2901961, 1, 0, 1,
-0.6823273, -1.386368, -3.067269, 0.282353, 1, 0, 1,
-0.6778979, 0.1723386, -2.218145, 0.2784314, 1, 0, 1,
-0.6778095, -0.8381787, -2.124847, 0.2705882, 1, 0, 1,
-0.674953, 0.05816505, -1.730449, 0.2666667, 1, 0, 1,
-0.6715459, 0.5366748, 0.8420786, 0.2588235, 1, 0, 1,
-0.6711031, -0.7558915, -3.133486, 0.254902, 1, 0, 1,
-0.6668152, 0.746221, 0.1843957, 0.2470588, 1, 0, 1,
-0.6509742, -0.7588146, -1.699683, 0.2431373, 1, 0, 1,
-0.6494411, 0.7708031, -2.004069, 0.2352941, 1, 0, 1,
-0.649187, -0.4576472, -3.695144, 0.2313726, 1, 0, 1,
-0.6391377, -0.1806326, -1.922444, 0.2235294, 1, 0, 1,
-0.6362162, -0.4167789, -2.7296, 0.2196078, 1, 0, 1,
-0.6262038, 0.8376048, -0.39392, 0.2117647, 1, 0, 1,
-0.6258653, 1.026259, -0.6576394, 0.2078431, 1, 0, 1,
-0.6216632, -0.2406188, -2.333375, 0.2, 1, 0, 1,
-0.6131266, -0.1534669, -1.382014, 0.1921569, 1, 0, 1,
-0.6116371, 1.794855, 2.029857, 0.1882353, 1, 0, 1,
-0.6071833, -0.1648913, -1.379011, 0.1803922, 1, 0, 1,
-0.6016687, -1.264022, -1.417989, 0.1764706, 1, 0, 1,
-0.5778864, -1.054446, -2.866701, 0.1686275, 1, 0, 1,
-0.5730183, 0.7465822, 0.5497001, 0.1647059, 1, 0, 1,
-0.5703835, 0.4772201, 0.9092581, 0.1568628, 1, 0, 1,
-0.5653188, -1.324439, -4.119946, 0.1529412, 1, 0, 1,
-0.5628611, -0.2887595, -2.792006, 0.145098, 1, 0, 1,
-0.5617152, -0.4592999, -2.039924, 0.1411765, 1, 0, 1,
-0.5548258, 2.138005, -0.3469098, 0.1333333, 1, 0, 1,
-0.5533518, -0.3052853, -3.703622, 0.1294118, 1, 0, 1,
-0.542818, 0.3923254, -1.50801, 0.1215686, 1, 0, 1,
-0.5365672, -0.2253936, -3.250336, 0.1176471, 1, 0, 1,
-0.5298073, -0.1450431, -2.195939, 0.1098039, 1, 0, 1,
-0.5278004, -0.7233831, -1.771552, 0.1058824, 1, 0, 1,
-0.5274054, 2.434048, -0.6873867, 0.09803922, 1, 0, 1,
-0.5273168, -0.9629797, -2.706758, 0.09019608, 1, 0, 1,
-0.526884, 0.2141454, -1.750369, 0.08627451, 1, 0, 1,
-0.5254116, 1.030375, 0.6668629, 0.07843138, 1, 0, 1,
-0.5239042, -0.1127964, -1.438227, 0.07450981, 1, 0, 1,
-0.5218891, 0.7545446, 0.2549851, 0.06666667, 1, 0, 1,
-0.5205326, 0.6204741, -2.143201, 0.0627451, 1, 0, 1,
-0.5176547, -1.300178, -4.675282, 0.05490196, 1, 0, 1,
-0.5168377, 0.1327557, -1.687255, 0.05098039, 1, 0, 1,
-0.5123276, -1.575189, -1.2665, 0.04313726, 1, 0, 1,
-0.5122257, 0.5365905, 0.9878538, 0.03921569, 1, 0, 1,
-0.5083386, 1.220585, -0.5486093, 0.03137255, 1, 0, 1,
-0.5074595, 0.5818305, -1.480098, 0.02745098, 1, 0, 1,
-0.5056419, -0.6081096, -2.491379, 0.01960784, 1, 0, 1,
-0.5037224, 0.1325688, -1.389446, 0.01568628, 1, 0, 1,
-0.5035296, 0.7975767, -1.08614, 0.007843138, 1, 0, 1,
-0.5021113, -1.331388, -2.100397, 0.003921569, 1, 0, 1,
-0.5010381, 0.5949178, 0.1237314, 0, 1, 0.003921569, 1,
-0.4971634, 0.8150133, -0.2488396, 0, 1, 0.01176471, 1,
-0.4964616, -0.2217081, -1.892887, 0, 1, 0.01568628, 1,
-0.4852926, 0.4325155, -1.262775, 0, 1, 0.02352941, 1,
-0.4852289, -0.01629554, -1.125317, 0, 1, 0.02745098, 1,
-0.482675, -0.5744109, -2.107716, 0, 1, 0.03529412, 1,
-0.4791652, -1.227537, -1.569857, 0, 1, 0.03921569, 1,
-0.4759495, 1.697358, -0.923645, 0, 1, 0.04705882, 1,
-0.4752736, -0.3275664, -1.490188, 0, 1, 0.05098039, 1,
-0.473316, 1.51461, -1.010813, 0, 1, 0.05882353, 1,
-0.4700177, 0.7021202, -0.2417432, 0, 1, 0.0627451, 1,
-0.4650348, 1.058299, 2.402399, 0, 1, 0.07058824, 1,
-0.461258, 0.3651075, -0.6788751, 0, 1, 0.07450981, 1,
-0.4599851, -0.4406448, -3.66374, 0, 1, 0.08235294, 1,
-0.4596145, 0.2437941, -0.5546417, 0, 1, 0.08627451, 1,
-0.4589274, -0.3510017, -0.8001907, 0, 1, 0.09411765, 1,
-0.4566368, 0.5112214, 1.804199, 0, 1, 0.1019608, 1,
-0.4494944, -1.586181, -1.978807, 0, 1, 0.1058824, 1,
-0.4485153, 1.146166, -0.3374598, 0, 1, 0.1137255, 1,
-0.4470186, -1.176262, -2.051435, 0, 1, 0.1176471, 1,
-0.4450118, -0.2951559, -2.706095, 0, 1, 0.1254902, 1,
-0.4435714, 0.2617109, -0.5222077, 0, 1, 0.1294118, 1,
-0.4424797, -1.332356, -1.643993, 0, 1, 0.1372549, 1,
-0.4391947, -0.236211, -1.111949, 0, 1, 0.1411765, 1,
-0.4358, 0.5548748, -0.7149474, 0, 1, 0.1490196, 1,
-0.4263998, 0.02636108, -2.294245, 0, 1, 0.1529412, 1,
-0.4237965, 0.131697, -0.8489124, 0, 1, 0.1607843, 1,
-0.42225, 1.570005, 0.4580086, 0, 1, 0.1647059, 1,
-0.4222171, -1.156629, -3.854067, 0, 1, 0.172549, 1,
-0.4186682, 0.8209177, 0.5865008, 0, 1, 0.1764706, 1,
-0.4180868, -0.8843786, -2.573432, 0, 1, 0.1843137, 1,
-0.4151706, -1.551012, -1.806151, 0, 1, 0.1882353, 1,
-0.4141701, -0.4823984, -1.819677, 0, 1, 0.1960784, 1,
-0.4133932, -0.7773745, -2.673805, 0, 1, 0.2039216, 1,
-0.4070348, 0.533179, -0.002108604, 0, 1, 0.2078431, 1,
-0.4058657, -1.388497, -3.447141, 0, 1, 0.2156863, 1,
-0.4055821, 0.3313695, 0.1353599, 0, 1, 0.2196078, 1,
-0.4042097, -0.06810393, -2.394508, 0, 1, 0.227451, 1,
-0.40261, 0.04900002, -1.282101, 0, 1, 0.2313726, 1,
-0.4008131, -0.3341858, -2.941002, 0, 1, 0.2392157, 1,
-0.3981283, -0.1053042, -1.528736, 0, 1, 0.2431373, 1,
-0.3974162, 0.2859611, -0.4363547, 0, 1, 0.2509804, 1,
-0.3934787, 0.8933049, 0.07798056, 0, 1, 0.254902, 1,
-0.3839127, 1.396496, -1.317891, 0, 1, 0.2627451, 1,
-0.3767279, 0.4960583, -1.784972, 0, 1, 0.2666667, 1,
-0.3718361, -0.8349108, -1.654277, 0, 1, 0.2745098, 1,
-0.3707965, 0.3450433, 1.021725, 0, 1, 0.2784314, 1,
-0.3703021, -0.04873144, -1.628088, 0, 1, 0.2862745, 1,
-0.3690512, -0.2774493, -3.535167, 0, 1, 0.2901961, 1,
-0.3667196, -0.03920749, -2.64511, 0, 1, 0.2980392, 1,
-0.3658019, -0.2425035, -2.492405, 0, 1, 0.3058824, 1,
-0.3657725, -0.3195214, -2.177188, 0, 1, 0.3098039, 1,
-0.3607959, -0.2515056, -2.118845, 0, 1, 0.3176471, 1,
-0.357597, -2.00509, -2.321763, 0, 1, 0.3215686, 1,
-0.3560594, 2.377916, -0.8859721, 0, 1, 0.3294118, 1,
-0.3543303, 1.166997, -1.197005, 0, 1, 0.3333333, 1,
-0.3524755, 0.2079972, -0.772915, 0, 1, 0.3411765, 1,
-0.349006, 0.2008748, -1.53641, 0, 1, 0.345098, 1,
-0.3474586, -0.01763146, -0.5907645, 0, 1, 0.3529412, 1,
-0.3469864, 0.3740715, -0.9627228, 0, 1, 0.3568628, 1,
-0.3364135, 0.4287265, -1.20905, 0, 1, 0.3647059, 1,
-0.3263004, 0.2703429, 0.2796523, 0, 1, 0.3686275, 1,
-0.3243047, -0.1480205, -1.945955, 0, 1, 0.3764706, 1,
-0.316061, -1.084779, -2.983277, 0, 1, 0.3803922, 1,
-0.3133677, -0.2534227, -1.412215, 0, 1, 0.3882353, 1,
-0.3045437, 0.2107841, -0.5074407, 0, 1, 0.3921569, 1,
-0.3039481, 0.02262771, -1.339227, 0, 1, 0.4, 1,
-0.3010672, 0.3536675, -1.045699, 0, 1, 0.4078431, 1,
-0.3009073, 0.7752614, -0.4247312, 0, 1, 0.4117647, 1,
-0.2968933, -1.053439, -3.031717, 0, 1, 0.4196078, 1,
-0.2915706, 0.5793324, 0.2247403, 0, 1, 0.4235294, 1,
-0.2849755, 1.919763, -0.7890802, 0, 1, 0.4313726, 1,
-0.2835689, -0.2763265, -2.399661, 0, 1, 0.4352941, 1,
-0.2820581, 0.1586528, -1.072399, 0, 1, 0.4431373, 1,
-0.2798315, -0.9415565, -2.287658, 0, 1, 0.4470588, 1,
-0.2795793, -0.1639488, -0.7821921, 0, 1, 0.454902, 1,
-0.2770595, 1.275874, 1.430109, 0, 1, 0.4588235, 1,
-0.2717896, -0.723642, -4.251713, 0, 1, 0.4666667, 1,
-0.2663075, -0.5246626, -3.106944, 0, 1, 0.4705882, 1,
-0.2641067, 0.8117152, -0.2641858, 0, 1, 0.4784314, 1,
-0.2630325, -1.865888, -4.299446, 0, 1, 0.4823529, 1,
-0.2624621, -1.455054, -2.176648, 0, 1, 0.4901961, 1,
-0.2608978, 0.6132361, -1.191383, 0, 1, 0.4941176, 1,
-0.2599203, 0.1163214, -1.795879, 0, 1, 0.5019608, 1,
-0.2597449, 0.6722398, -1.199583, 0, 1, 0.509804, 1,
-0.2520812, 1.200825, 1.657489, 0, 1, 0.5137255, 1,
-0.2503056, -0.4770769, -2.470375, 0, 1, 0.5215687, 1,
-0.2481694, -0.7719949, -1.923586, 0, 1, 0.5254902, 1,
-0.2461451, 0.9083281, 0.6839657, 0, 1, 0.5333334, 1,
-0.2425999, -0.2699034, -4.690896, 0, 1, 0.5372549, 1,
-0.2407677, 0.5039119, -0.428529, 0, 1, 0.5450981, 1,
-0.2401529, -1.030704, -2.370042, 0, 1, 0.5490196, 1,
-0.2369947, 1.659178, -0.5289739, 0, 1, 0.5568628, 1,
-0.2323119, -0.8025104, -2.05766, 0, 1, 0.5607843, 1,
-0.2321599, 0.9286299, 0.2166942, 0, 1, 0.5686275, 1,
-0.2319036, 1.923257, -0.4458129, 0, 1, 0.572549, 1,
-0.2234995, 0.7073342, -1.627432, 0, 1, 0.5803922, 1,
-0.2203912, -0.7845667, -1.943886, 0, 1, 0.5843138, 1,
-0.2154757, 0.06968252, -1.090194, 0, 1, 0.5921569, 1,
-0.2087836, -0.215423, -1.533919, 0, 1, 0.5960785, 1,
-0.2055176, -1.649547, -2.62616, 0, 1, 0.6039216, 1,
-0.1980567, -0.1041269, -1.629893, 0, 1, 0.6117647, 1,
-0.1979927, 0.8349891, 0.8055356, 0, 1, 0.6156863, 1,
-0.1956563, -1.73454, -1.957397, 0, 1, 0.6235294, 1,
-0.193249, -1.699142, -3.170486, 0, 1, 0.627451, 1,
-0.1909065, -1.164515, -2.47589, 0, 1, 0.6352941, 1,
-0.1828849, 1.396753, 0.9534525, 0, 1, 0.6392157, 1,
-0.1813685, -0.08102053, -0.9358215, 0, 1, 0.6470588, 1,
-0.180187, -0.3018104, -2.498021, 0, 1, 0.6509804, 1,
-0.1758665, 0.6670505, 0.1350856, 0, 1, 0.6588235, 1,
-0.1728361, 0.126169, -0.3627044, 0, 1, 0.6627451, 1,
-0.1717353, -0.8205119, -4.251046, 0, 1, 0.6705883, 1,
-0.1696206, -0.6305337, -2.408529, 0, 1, 0.6745098, 1,
-0.165009, 0.4655887, -0.3583028, 0, 1, 0.682353, 1,
-0.1633452, 0.1182338, -1.695509, 0, 1, 0.6862745, 1,
-0.1626696, 0.01593541, 0.4161612, 0, 1, 0.6941177, 1,
-0.161692, 1.276918, 0.5023746, 0, 1, 0.7019608, 1,
-0.1599981, -1.710665, -3.712469, 0, 1, 0.7058824, 1,
-0.1577347, 1.095652, -0.5753841, 0, 1, 0.7137255, 1,
-0.157516, -0.425042, -3.15086, 0, 1, 0.7176471, 1,
-0.1568156, 0.615237, -0.2101325, 0, 1, 0.7254902, 1,
-0.156427, 1.494188, 1.563128, 0, 1, 0.7294118, 1,
-0.1503471, 2.048931, -1.59285, 0, 1, 0.7372549, 1,
-0.1498742, -1.735046, -2.697312, 0, 1, 0.7411765, 1,
-0.1492668, 1.403015, 0.8150951, 0, 1, 0.7490196, 1,
-0.1459861, 0.7984961, 1.770575, 0, 1, 0.7529412, 1,
-0.1442376, 0.2752018, -1.392741, 0, 1, 0.7607843, 1,
-0.1440435, 0.280884, -1.792158, 0, 1, 0.7647059, 1,
-0.1427789, -1.341853, -3.246472, 0, 1, 0.772549, 1,
-0.1401964, -1.054096, -1.925804, 0, 1, 0.7764706, 1,
-0.1386196, -0.8262016, -3.155378, 0, 1, 0.7843137, 1,
-0.1378849, -0.1869704, -1.741513, 0, 1, 0.7882353, 1,
-0.1301083, -1.155436, -3.660907, 0, 1, 0.7960784, 1,
-0.126534, -0.3060184, -2.616327, 0, 1, 0.8039216, 1,
-0.1242613, -0.9222398, -3.140227, 0, 1, 0.8078431, 1,
-0.119468, -0.3056206, -2.537536, 0, 1, 0.8156863, 1,
-0.1164864, -1.428206, -2.318038, 0, 1, 0.8196079, 1,
-0.1160297, 1.474443, -2.026888, 0, 1, 0.827451, 1,
-0.1153223, -0.2842198, -0.3610265, 0, 1, 0.8313726, 1,
-0.1141487, -0.192829, -3.115193, 0, 1, 0.8392157, 1,
-0.1088628, 0.4283459, 0.3580913, 0, 1, 0.8431373, 1,
-0.1085244, -0.7591801, -4.722198, 0, 1, 0.8509804, 1,
-0.1084394, 0.0894255, -1.677222, 0, 1, 0.854902, 1,
-0.1062242, -0.50898, -3.193408, 0, 1, 0.8627451, 1,
-0.1034884, -0.05251266, -1.336172, 0, 1, 0.8666667, 1,
-0.09708071, 0.8476866, 1.104033, 0, 1, 0.8745098, 1,
-0.09603477, -1.202428, -2.778444, 0, 1, 0.8784314, 1,
-0.09290267, -0.01908668, -2.2156, 0, 1, 0.8862745, 1,
-0.09112249, -0.5735901, -4.07798, 0, 1, 0.8901961, 1,
-0.08978405, -1.728386, -3.243663, 0, 1, 0.8980392, 1,
-0.08509146, -0.8255237, -1.953429, 0, 1, 0.9058824, 1,
-0.08416656, 0.1894952, 0.00410965, 0, 1, 0.9098039, 1,
-0.07906575, -0.4054063, -2.530111, 0, 1, 0.9176471, 1,
-0.0789537, 0.124818, 0.4937679, 0, 1, 0.9215686, 1,
-0.07861404, -0.8297865, -3.997093, 0, 1, 0.9294118, 1,
-0.07383926, 0.7107183, -2.11526, 0, 1, 0.9333333, 1,
-0.07262351, -1.059834, -2.876893, 0, 1, 0.9411765, 1,
-0.07056342, 0.8297214, 0.1922947, 0, 1, 0.945098, 1,
-0.06145705, -0.8850961, -3.349763, 0, 1, 0.9529412, 1,
-0.06137085, 0.7814579, -0.4205204, 0, 1, 0.9568627, 1,
-0.05671851, -0.05701349, -2.312937, 0, 1, 0.9647059, 1,
-0.04653721, 0.1876649, -0.655822, 0, 1, 0.9686275, 1,
-0.03868794, 0.2357648, -2.764361, 0, 1, 0.9764706, 1,
-0.03273845, 0.5098222, 0.3909301, 0, 1, 0.9803922, 1,
-0.02870905, -0.3640814, -3.0044, 0, 1, 0.9882353, 1,
-0.02833361, -1.58251, -3.526744, 0, 1, 0.9921569, 1,
-0.0271673, -1.708941, -2.313708, 0, 1, 1, 1,
-0.02519589, 0.8882591, 0.04038018, 0, 0.9921569, 1, 1,
-0.02434685, 0.6585698, 0.3419246, 0, 0.9882353, 1, 1,
-0.01732815, -0.1461258, -3.073935, 0, 0.9803922, 1, 1,
-0.009370427, 0.1751642, -0.9840276, 0, 0.9764706, 1, 1,
-0.006407607, 0.97515, -1.707312, 0, 0.9686275, 1, 1,
-0.003394249, 1.371172, 0.5662591, 0, 0.9647059, 1, 1,
0.003433494, -1.763133, 2.613303, 0, 0.9568627, 1, 1,
0.00641945, -1.254606, 2.308317, 0, 0.9529412, 1, 1,
0.007116547, -0.5197707, 2.451287, 0, 0.945098, 1, 1,
0.02192929, 1.130469, 1.284672, 0, 0.9411765, 1, 1,
0.02461852, -2.610307, 3.331326, 0, 0.9333333, 1, 1,
0.03495331, -1.177118, 2.812464, 0, 0.9294118, 1, 1,
0.03532638, -0.5704404, 3.954322, 0, 0.9215686, 1, 1,
0.03614371, 2.12084, 0.3802489, 0, 0.9176471, 1, 1,
0.03843059, 0.9039897, 0.4056718, 0, 0.9098039, 1, 1,
0.04066685, -0.01887187, 0.8420252, 0, 0.9058824, 1, 1,
0.04422186, 1.340089, 0.7120021, 0, 0.8980392, 1, 1,
0.05057785, -1.732868, 4.071727, 0, 0.8901961, 1, 1,
0.0508989, -0.4056502, 1.917848, 0, 0.8862745, 1, 1,
0.05172971, -0.09832079, 2.40391, 0, 0.8784314, 1, 1,
0.06638645, -1.789216, 3.255907, 0, 0.8745098, 1, 1,
0.06727903, 0.4328911, 0.7043039, 0, 0.8666667, 1, 1,
0.06944967, -1.494544, 3.485404, 0, 0.8627451, 1, 1,
0.07030494, -0.2474324, 2.149863, 0, 0.854902, 1, 1,
0.07203558, -0.05558756, 1.112056, 0, 0.8509804, 1, 1,
0.07217989, 0.0878963, 0.9118835, 0, 0.8431373, 1, 1,
0.07453371, -0.2009659, 2.442825, 0, 0.8392157, 1, 1,
0.078194, 0.5330257, -0.2273505, 0, 0.8313726, 1, 1,
0.08110751, -0.5943395, 2.607302, 0, 0.827451, 1, 1,
0.08557183, 0.5724809, 0.1604442, 0, 0.8196079, 1, 1,
0.08696166, 0.8982974, -0.4672419, 0, 0.8156863, 1, 1,
0.09424251, 0.2746986, -0.3510012, 0, 0.8078431, 1, 1,
0.0945036, 0.002265708, -1.123346, 0, 0.8039216, 1, 1,
0.1138551, -1.360784, 1.637473, 0, 0.7960784, 1, 1,
0.1146967, -0.4222549, 2.879547, 0, 0.7882353, 1, 1,
0.1158069, 1.347462, -1.454455, 0, 0.7843137, 1, 1,
0.1226371, -1.058092, 3.102068, 0, 0.7764706, 1, 1,
0.1233475, -0.9939976, 1.891358, 0, 0.772549, 1, 1,
0.1256331, 0.003331965, 1.159346, 0, 0.7647059, 1, 1,
0.1361489, -1.226059, 4.209693, 0, 0.7607843, 1, 1,
0.1388254, -0.5221712, 2.485867, 0, 0.7529412, 1, 1,
0.1394499, 0.3722501, 0.339659, 0, 0.7490196, 1, 1,
0.140386, 0.1431919, -0.4022145, 0, 0.7411765, 1, 1,
0.1415466, -1.202688, 2.963689, 0, 0.7372549, 1, 1,
0.1476151, -0.7049488, 1.512967, 0, 0.7294118, 1, 1,
0.1477197, 1.026153, -1.752532, 0, 0.7254902, 1, 1,
0.1481919, 0.3759406, 0.9410398, 0, 0.7176471, 1, 1,
0.1552302, 2.07401, -0.9168896, 0, 0.7137255, 1, 1,
0.155595, -0.1228671, 2.04784, 0, 0.7058824, 1, 1,
0.1559765, -0.5141741, 4.131847, 0, 0.6980392, 1, 1,
0.1582213, 1.108109, -0.1374786, 0, 0.6941177, 1, 1,
0.1604325, 0.8892336, 0.1647592, 0, 0.6862745, 1, 1,
0.1691126, 0.7846351, -0.3437024, 0, 0.682353, 1, 1,
0.172351, -1.633386, 2.813919, 0, 0.6745098, 1, 1,
0.1723925, 1.375916, 0.2049597, 0, 0.6705883, 1, 1,
0.1734743, 0.3314009, 0.492347, 0, 0.6627451, 1, 1,
0.1769223, -2.116621, 4.73211, 0, 0.6588235, 1, 1,
0.1823269, -0.3823441, 2.654332, 0, 0.6509804, 1, 1,
0.1842837, 1.213421, -0.9881779, 0, 0.6470588, 1, 1,
0.1850269, -1.019576, 4.391624, 0, 0.6392157, 1, 1,
0.1858267, 0.857345, 0.8859439, 0, 0.6352941, 1, 1,
0.1871397, -1.388629, 4.235499, 0, 0.627451, 1, 1,
0.1897546, 1.760156, 0.4660355, 0, 0.6235294, 1, 1,
0.1959764, 0.00512142, 1.179078, 0, 0.6156863, 1, 1,
0.1999866, -0.2499583, 0.6129313, 0, 0.6117647, 1, 1,
0.2017019, 0.1455799, 0.007012085, 0, 0.6039216, 1, 1,
0.2018644, 1.400396, 0.1355113, 0, 0.5960785, 1, 1,
0.2049153, 0.2373853, 3.318322, 0, 0.5921569, 1, 1,
0.2088155, 0.7108467, -0.7926285, 0, 0.5843138, 1, 1,
0.2149855, -0.7280328, 4.086617, 0, 0.5803922, 1, 1,
0.2158048, -0.8937293, 3.2353, 0, 0.572549, 1, 1,
0.2158128, -0.4307986, 4.194556, 0, 0.5686275, 1, 1,
0.2176694, -0.9736235, 2.993784, 0, 0.5607843, 1, 1,
0.2187321, -1.637688, 4.007625, 0, 0.5568628, 1, 1,
0.2213649, -0.7136847, 1.932074, 0, 0.5490196, 1, 1,
0.2219584, -2.632444, 2.763875, 0, 0.5450981, 1, 1,
0.2275249, -1.588964, 0.9837142, 0, 0.5372549, 1, 1,
0.2276034, 0.1155224, 0.3100694, 0, 0.5333334, 1, 1,
0.2283396, 1.361428, 0.3348923, 0, 0.5254902, 1, 1,
0.2307853, -0.8834816, 2.379275, 0, 0.5215687, 1, 1,
0.232105, 0.3668976, 0.8903481, 0, 0.5137255, 1, 1,
0.2343746, 0.3532287, 0.3720396, 0, 0.509804, 1, 1,
0.2345968, -0.04248363, 1.278048, 0, 0.5019608, 1, 1,
0.2370285, -1.44995, 2.343639, 0, 0.4941176, 1, 1,
0.2381793, -1.323837, 4.675621, 0, 0.4901961, 1, 1,
0.2424795, 0.5952182, 2.200196, 0, 0.4823529, 1, 1,
0.24405, 0.9195378, -1.488514, 0, 0.4784314, 1, 1,
0.2485332, -0.05868533, 2.062678, 0, 0.4705882, 1, 1,
0.2535281, 0.04213409, 1.125816, 0, 0.4666667, 1, 1,
0.2548883, 0.4583274, 0.4206013, 0, 0.4588235, 1, 1,
0.2555001, 0.2337037, 3.510863, 0, 0.454902, 1, 1,
0.2576382, -0.03742427, 1.916139, 0, 0.4470588, 1, 1,
0.2647853, -0.2833816, 1.234811, 0, 0.4431373, 1, 1,
0.2679697, -1.000543, 2.213998, 0, 0.4352941, 1, 1,
0.2707477, -0.8094735, 0.3643957, 0, 0.4313726, 1, 1,
0.2713242, 0.1128972, -1.353202, 0, 0.4235294, 1, 1,
0.272661, 0.06447196, -0.193948, 0, 0.4196078, 1, 1,
0.2774823, -1.844165, 3.751595, 0, 0.4117647, 1, 1,
0.2802627, -0.5491617, 1.626545, 0, 0.4078431, 1, 1,
0.2807567, 0.02225269, 1.687238, 0, 0.4, 1, 1,
0.2812162, -0.8874996, 3.026517, 0, 0.3921569, 1, 1,
0.2875406, 0.604726, 0.1300088, 0, 0.3882353, 1, 1,
0.2881959, 0.1885003, 0.5604043, 0, 0.3803922, 1, 1,
0.2889929, 0.9476755, -1.054346, 0, 0.3764706, 1, 1,
0.295526, 1.208535, -0.3473688, 0, 0.3686275, 1, 1,
0.2960466, -0.1643107, 2.742527, 0, 0.3647059, 1, 1,
0.296305, -1.379509, 3.07272, 0, 0.3568628, 1, 1,
0.2973602, -0.8982125, 3.973557, 0, 0.3529412, 1, 1,
0.2993566, -0.5582331, 3.589006, 0, 0.345098, 1, 1,
0.3012559, -1.306001, 5.419897, 0, 0.3411765, 1, 1,
0.3038776, -0.1486358, 1.487635, 0, 0.3333333, 1, 1,
0.3078749, -0.4394441, 0.955141, 0, 0.3294118, 1, 1,
0.3142238, 1.510605, -0.8035604, 0, 0.3215686, 1, 1,
0.3154464, 0.1770902, 1.720198, 0, 0.3176471, 1, 1,
0.318473, 0.02705817, 0.3731343, 0, 0.3098039, 1, 1,
0.3185278, -0.5553211, 4.216491, 0, 0.3058824, 1, 1,
0.3231142, -1.463869, 2.059212, 0, 0.2980392, 1, 1,
0.3272607, -0.01166236, 1.409966, 0, 0.2901961, 1, 1,
0.3365756, -2.214973, 1.153618, 0, 0.2862745, 1, 1,
0.3404918, -1.062952, 2.61974, 0, 0.2784314, 1, 1,
0.3408906, 2.342063, 0.2664137, 0, 0.2745098, 1, 1,
0.3416275, -1.721334, 3.499679, 0, 0.2666667, 1, 1,
0.3437351, -0.153683, 0.9631866, 0, 0.2627451, 1, 1,
0.3456406, -0.6366397, 3.277186, 0, 0.254902, 1, 1,
0.3546733, -0.9289871, 2.095726, 0, 0.2509804, 1, 1,
0.3575941, -1.825933, 3.251194, 0, 0.2431373, 1, 1,
0.3584316, -1.561178, 3.817638, 0, 0.2392157, 1, 1,
0.3623984, -0.003394435, 2.519484, 0, 0.2313726, 1, 1,
0.3624749, 0.2366688, 3.380003, 0, 0.227451, 1, 1,
0.3636018, -0.3668866, 3.437615, 0, 0.2196078, 1, 1,
0.3639914, 0.1599592, 0.6781815, 0, 0.2156863, 1, 1,
0.3662362, 1.440843, 0.03463123, 0, 0.2078431, 1, 1,
0.3671678, 0.1796472, 1.699352, 0, 0.2039216, 1, 1,
0.3721369, 0.4766215, 0.9188542, 0, 0.1960784, 1, 1,
0.377144, -0.03114826, 1.834453, 0, 0.1882353, 1, 1,
0.3800056, 0.42749, -0.9712105, 0, 0.1843137, 1, 1,
0.3816461, -0.02054602, 2.286134, 0, 0.1764706, 1, 1,
0.3829184, 0.4993366, -0.09906554, 0, 0.172549, 1, 1,
0.3846429, -2.082136, 2.047277, 0, 0.1647059, 1, 1,
0.3857791, -0.1490812, 0.8247429, 0, 0.1607843, 1, 1,
0.3857976, 1.460319, 2.818356, 0, 0.1529412, 1, 1,
0.3868264, 0.03672995, 2.755831, 0, 0.1490196, 1, 1,
0.3874083, 0.3225802, 3.237653, 0, 0.1411765, 1, 1,
0.3878932, -0.4859326, 2.231952, 0, 0.1372549, 1, 1,
0.391658, -0.2256892, 3.277007, 0, 0.1294118, 1, 1,
0.3964373, 0.322961, 0.2903549, 0, 0.1254902, 1, 1,
0.4059491, -1.819802, 2.1013, 0, 0.1176471, 1, 1,
0.4112329, 1.530163, 1.658312, 0, 0.1137255, 1, 1,
0.4113192, 1.489735, -0.01763429, 0, 0.1058824, 1, 1,
0.4163911, 0.4714325, -1.718504, 0, 0.09803922, 1, 1,
0.4237883, -0.3356479, 0.3899033, 0, 0.09411765, 1, 1,
0.4281608, 0.5164184, 0.6083408, 0, 0.08627451, 1, 1,
0.4290799, -0.9973461, 4.422722, 0, 0.08235294, 1, 1,
0.4297061, -0.3186006, 1.103287, 0, 0.07450981, 1, 1,
0.4372598, -0.5358105, 2.327189, 0, 0.07058824, 1, 1,
0.4391357, 0.6788614, 2.318075, 0, 0.0627451, 1, 1,
0.4399554, 0.4662246, -0.9690204, 0, 0.05882353, 1, 1,
0.4400047, -0.9455221, 1.092714, 0, 0.05098039, 1, 1,
0.4402934, -0.8965033, 3.145608, 0, 0.04705882, 1, 1,
0.441014, 0.43191, -2.119581, 0, 0.03921569, 1, 1,
0.4436476, -0.802116, 2.242293, 0, 0.03529412, 1, 1,
0.4455957, 0.8468813, -0.4491331, 0, 0.02745098, 1, 1,
0.4472606, -0.1233102, 2.44425, 0, 0.02352941, 1, 1,
0.4473994, -0.8684559, 1.208017, 0, 0.01568628, 1, 1,
0.447817, 0.1645124, 1.03029, 0, 0.01176471, 1, 1,
0.4494311, 0.4595757, 1.979687, 0, 0.003921569, 1, 1,
0.4564787, -0.9844069, 3.950632, 0.003921569, 0, 1, 1,
0.4589354, -1.084723, 2.907798, 0.007843138, 0, 1, 1,
0.4607144, 1.190027, -0.551596, 0.01568628, 0, 1, 1,
0.4614313, -0.3773319, 3.195146, 0.01960784, 0, 1, 1,
0.4629036, 1.427127, -0.3255278, 0.02745098, 0, 1, 1,
0.4656305, -0.7200148, 2.805294, 0.03137255, 0, 1, 1,
0.4662763, -0.002410738, 2.008631, 0.03921569, 0, 1, 1,
0.4664143, -2.35789, 3.450026, 0.04313726, 0, 1, 1,
0.4694027, 0.2238771, 2.254979, 0.05098039, 0, 1, 1,
0.4695795, -0.5505211, 3.32105, 0.05490196, 0, 1, 1,
0.4713444, -0.4870777, 2.116584, 0.0627451, 0, 1, 1,
0.4714005, -1.048627, 3.307552, 0.06666667, 0, 1, 1,
0.4729312, -0.2965876, 1.64121, 0.07450981, 0, 1, 1,
0.4821882, 0.5165077, 1.117195, 0.07843138, 0, 1, 1,
0.4842139, 0.3559959, 1.61016, 0.08627451, 0, 1, 1,
0.495321, 0.1416922, -1.171356, 0.09019608, 0, 1, 1,
0.4956595, -1.498738, 2.692493, 0.09803922, 0, 1, 1,
0.4998517, -0.1077717, 2.286738, 0.1058824, 0, 1, 1,
0.5000591, 0.6370569, 0.8546373, 0.1098039, 0, 1, 1,
0.5004523, 0.3155798, 1.531802, 0.1176471, 0, 1, 1,
0.5037634, 0.08250932, 0.631285, 0.1215686, 0, 1, 1,
0.5040231, 1.098053, 0.5963524, 0.1294118, 0, 1, 1,
0.5054144, -0.5572057, 1.527383, 0.1333333, 0, 1, 1,
0.5082721, -1.430254, 4.669058, 0.1411765, 0, 1, 1,
0.5090586, 1.159698, -0.8047593, 0.145098, 0, 1, 1,
0.5107948, 0.723222, -1.365058, 0.1529412, 0, 1, 1,
0.5240358, 1.314165, 0.3103894, 0.1568628, 0, 1, 1,
0.5255458, 0.2564359, -0.1866339, 0.1647059, 0, 1, 1,
0.5284196, -0.9195957, 2.170885, 0.1686275, 0, 1, 1,
0.533991, 0.5057213, 0.4910088, 0.1764706, 0, 1, 1,
0.538805, 0.3443578, 0.660368, 0.1803922, 0, 1, 1,
0.5486119, -0.2010925, 2.009138, 0.1882353, 0, 1, 1,
0.5539241, 0.2131114, -0.1469806, 0.1921569, 0, 1, 1,
0.560945, 0.2136338, 1.310947, 0.2, 0, 1, 1,
0.5624818, -0.1298994, 2.321246, 0.2078431, 0, 1, 1,
0.5634032, 0.1979946, 1.214284, 0.2117647, 0, 1, 1,
0.572219, 0.5229019, 0.9718618, 0.2196078, 0, 1, 1,
0.5730808, -1.397409, 1.563989, 0.2235294, 0, 1, 1,
0.5828674, -1.452323, 3.729365, 0.2313726, 0, 1, 1,
0.5831686, 0.7297344, -1.34576, 0.2352941, 0, 1, 1,
0.5874776, 0.1082292, 2.320681, 0.2431373, 0, 1, 1,
0.5893474, 0.4169108, 2.55101, 0.2470588, 0, 1, 1,
0.5959224, 0.1477813, -0.9908578, 0.254902, 0, 1, 1,
0.5983432, 1.283862, -1.279288, 0.2588235, 0, 1, 1,
0.6025447, 0.05186597, 2.558426, 0.2666667, 0, 1, 1,
0.602935, 2.117014, 2.131408, 0.2705882, 0, 1, 1,
0.6080381, 0.4183951, 0.07688015, 0.2784314, 0, 1, 1,
0.6108165, -0.0836594, 2.518697, 0.282353, 0, 1, 1,
0.616324, 0.4377988, 0.3797821, 0.2901961, 0, 1, 1,
0.6168, -0.9551, 2.247043, 0.2941177, 0, 1, 1,
0.6222137, -0.4383668, 3.107504, 0.3019608, 0, 1, 1,
0.6225269, -1.291195, 4.225186, 0.3098039, 0, 1, 1,
0.6254815, 0.163939, 1.428925, 0.3137255, 0, 1, 1,
0.6295841, -0.3184275, 2.48369, 0.3215686, 0, 1, 1,
0.6300407, -0.5543483, 2.985118, 0.3254902, 0, 1, 1,
0.6303645, 1.538287, 1.351005, 0.3333333, 0, 1, 1,
0.6328903, 0.7248895, 1.085824, 0.3372549, 0, 1, 1,
0.6396837, -2.102035, 3.224233, 0.345098, 0, 1, 1,
0.6492796, -0.08284994, 0.5943286, 0.3490196, 0, 1, 1,
0.6503829, -0.2291523, 1.262419, 0.3568628, 0, 1, 1,
0.653993, -1.058702, 4.09657, 0.3607843, 0, 1, 1,
0.6556284, -0.7312809, 2.10649, 0.3686275, 0, 1, 1,
0.6563193, 0.01078869, 1.116398, 0.372549, 0, 1, 1,
0.6580721, 0.7387317, 1.254295, 0.3803922, 0, 1, 1,
0.6593852, -1.250628, 0.64403, 0.3843137, 0, 1, 1,
0.6604372, -0.6261108, 2.207671, 0.3921569, 0, 1, 1,
0.6611107, 0.3865632, 2.459136, 0.3960784, 0, 1, 1,
0.661893, -1.006107, 2.992219, 0.4039216, 0, 1, 1,
0.6645182, 1.108579, 2.095294, 0.4117647, 0, 1, 1,
0.6670831, 0.6934506, 1.775356, 0.4156863, 0, 1, 1,
0.6685528, 0.481153, -0.6129879, 0.4235294, 0, 1, 1,
0.6688166, -0.2323026, 1.757084, 0.427451, 0, 1, 1,
0.6735218, -1.073042, 4.05047, 0.4352941, 0, 1, 1,
0.6760556, 1.054591, -0.2647583, 0.4392157, 0, 1, 1,
0.6778539, -1.418605, 3.294232, 0.4470588, 0, 1, 1,
0.6883588, -1.165437, 3.849869, 0.4509804, 0, 1, 1,
0.7113808, -0.431715, 2.194153, 0.4588235, 0, 1, 1,
0.7325444, 0.7128969, 0.1081901, 0.4627451, 0, 1, 1,
0.7357122, -0.3669162, 1.28168, 0.4705882, 0, 1, 1,
0.7402561, -1.305379, 3.473221, 0.4745098, 0, 1, 1,
0.7423756, -0.5240111, 3.021756, 0.4823529, 0, 1, 1,
0.743112, 0.5954533, 1.669819, 0.4862745, 0, 1, 1,
0.7442288, -0.3275439, 2.394351, 0.4941176, 0, 1, 1,
0.7521271, -0.8741047, 0.9973204, 0.5019608, 0, 1, 1,
0.7527804, -1.341985, 1.978312, 0.5058824, 0, 1, 1,
0.7531227, -0.2699338, 3.654961, 0.5137255, 0, 1, 1,
0.7550811, 0.02192574, 2.908829, 0.5176471, 0, 1, 1,
0.7556225, -1.0604, 2.507856, 0.5254902, 0, 1, 1,
0.7627954, 1.206955, 3.446167, 0.5294118, 0, 1, 1,
0.7640651, -1.121596, 2.839223, 0.5372549, 0, 1, 1,
0.767577, -0.2394845, 0.7455665, 0.5411765, 0, 1, 1,
0.7677249, 0.9657575, -0.642847, 0.5490196, 0, 1, 1,
0.7704301, -0.09907644, 0.8395972, 0.5529412, 0, 1, 1,
0.7708715, -1.155716, 2.016135, 0.5607843, 0, 1, 1,
0.7723266, -0.09269025, 2.966264, 0.5647059, 0, 1, 1,
0.7751839, -0.07562258, 1.123167, 0.572549, 0, 1, 1,
0.7762151, -0.365642, 1.690502, 0.5764706, 0, 1, 1,
0.7910162, 1.441904, -0.6052639, 0.5843138, 0, 1, 1,
0.8057674, 1.444165, -0.2723063, 0.5882353, 0, 1, 1,
0.8074933, 0.02109702, 1.034974, 0.5960785, 0, 1, 1,
0.8085718, 0.03782744, 2.279785, 0.6039216, 0, 1, 1,
0.8160464, 0.1611623, 2.647262, 0.6078432, 0, 1, 1,
0.8221741, 0.4351542, 1.250649, 0.6156863, 0, 1, 1,
0.8250309, 1.611013, 0.4939409, 0.6196079, 0, 1, 1,
0.8266613, 0.2227902, 1.389942, 0.627451, 0, 1, 1,
0.8272864, -0.05846927, 2.478103, 0.6313726, 0, 1, 1,
0.8295818, -0.3450853, 1.907637, 0.6392157, 0, 1, 1,
0.8328686, 0.9758119, 1.101791, 0.6431373, 0, 1, 1,
0.8340039, -0.2636774, 3.219827, 0.6509804, 0, 1, 1,
0.8379092, 1.346552, -0.97629, 0.654902, 0, 1, 1,
0.8418354, 0.5394612, -0.5042199, 0.6627451, 0, 1, 1,
0.8447292, -1.128361, 2.0285, 0.6666667, 0, 1, 1,
0.845487, -0.5902519, 1.197942, 0.6745098, 0, 1, 1,
0.8525902, -2.024715, 4.743653, 0.6784314, 0, 1, 1,
0.8579133, -0.5564899, 2.804656, 0.6862745, 0, 1, 1,
0.8623073, -0.3181964, 1.938678, 0.6901961, 0, 1, 1,
0.8642584, 0.01074798, 0.5903528, 0.6980392, 0, 1, 1,
0.8663781, 1.454411, 1.664127, 0.7058824, 0, 1, 1,
0.8676636, 0.6357088, 1.981029, 0.7098039, 0, 1, 1,
0.8678671, 0.2144484, 1.80071, 0.7176471, 0, 1, 1,
0.8700533, 0.06575169, 1.948535, 0.7215686, 0, 1, 1,
0.8726661, 1.137458, -0.4586921, 0.7294118, 0, 1, 1,
0.8726896, 1.608847, -0.386535, 0.7333333, 0, 1, 1,
0.8728654, 0.5277427, 1.312349, 0.7411765, 0, 1, 1,
0.8748465, 1.237967, 0.006612977, 0.7450981, 0, 1, 1,
0.8882037, -0.7327329, 1.559242, 0.7529412, 0, 1, 1,
0.8924742, -1.678399, 1.467321, 0.7568628, 0, 1, 1,
0.8979448, -2.069215, 3.959677, 0.7647059, 0, 1, 1,
0.8983808, -0.2255858, 3.118555, 0.7686275, 0, 1, 1,
0.9002044, 0.4685106, 0.5367513, 0.7764706, 0, 1, 1,
0.903008, 1.614899, 1.235267, 0.7803922, 0, 1, 1,
0.9070416, 1.651105, -0.7785686, 0.7882353, 0, 1, 1,
0.9086971, -0.3754562, 2.496573, 0.7921569, 0, 1, 1,
0.9091495, 0.1500662, 2.221678, 0.8, 0, 1, 1,
0.9120089, 2.069089, 0.6166567, 0.8078431, 0, 1, 1,
0.9132648, 1.443978, 1.003633, 0.8117647, 0, 1, 1,
0.9185376, -0.06202842, 2.774115, 0.8196079, 0, 1, 1,
0.9254159, 1.642632, 2.21757, 0.8235294, 0, 1, 1,
0.9290663, 0.3956245, 1.373737, 0.8313726, 0, 1, 1,
0.9321553, -0.6759841, 1.459973, 0.8352941, 0, 1, 1,
0.9326128, -0.8252059, 3.57016, 0.8431373, 0, 1, 1,
0.9387481, 1.274045, 1.107985, 0.8470588, 0, 1, 1,
0.9450083, -0.6237803, 1.652783, 0.854902, 0, 1, 1,
0.9453654, 0.1748282, 2.289581, 0.8588235, 0, 1, 1,
0.9505341, -0.1433547, 0.7754886, 0.8666667, 0, 1, 1,
0.9516252, -0.9407958, 2.16588, 0.8705882, 0, 1, 1,
0.9615172, 0.4026165, 0.1536787, 0.8784314, 0, 1, 1,
0.9644722, -0.9796165, 3.958256, 0.8823529, 0, 1, 1,
0.966579, 0.816905, 0.1341388, 0.8901961, 0, 1, 1,
0.9695079, -0.1009818, 2.207384, 0.8941177, 0, 1, 1,
0.9751436, 0.5846094, 1.030052, 0.9019608, 0, 1, 1,
0.9824765, 0.4982988, 1.543018, 0.9098039, 0, 1, 1,
0.983014, -1.019067, 3.832493, 0.9137255, 0, 1, 1,
0.9869766, -0.7214553, 1.651708, 0.9215686, 0, 1, 1,
0.987447, 1.166772, -0.9595283, 0.9254902, 0, 1, 1,
0.9903808, -0.1254905, 2.04958, 0.9333333, 0, 1, 1,
0.9911786, 0.7424318, 0.6168861, 0.9372549, 0, 1, 1,
0.992865, 1.317321, 0.02755235, 0.945098, 0, 1, 1,
1.000699, 0.6664127, -1.531987, 0.9490196, 0, 1, 1,
1.000973, 0.9821136, 0.9357404, 0.9568627, 0, 1, 1,
1.009852, 0.6320592, 0.08829349, 0.9607843, 0, 1, 1,
1.017773, -0.7903855, 0.684685, 0.9686275, 0, 1, 1,
1.021164, 0.1744141, 1.137242, 0.972549, 0, 1, 1,
1.021378, 1.529113, 0.1194214, 0.9803922, 0, 1, 1,
1.032549, -0.2040031, 1.576463, 0.9843137, 0, 1, 1,
1.032574, -0.9275802, 1.930533, 0.9921569, 0, 1, 1,
1.03937, -0.942116, 3.525373, 0.9960784, 0, 1, 1,
1.039483, -1.051189, 3.57844, 1, 0, 0.9960784, 1,
1.043544, -1.28087, 3.241293, 1, 0, 0.9882353, 1,
1.044171, -0.2516301, 2.497623, 1, 0, 0.9843137, 1,
1.047376, -0.0993551, 3.037861, 1, 0, 0.9764706, 1,
1.054152, -0.5635733, 3.542336, 1, 0, 0.972549, 1,
1.055674, 0.2040485, 3.029911, 1, 0, 0.9647059, 1,
1.064847, -0.5516553, 3.438509, 1, 0, 0.9607843, 1,
1.073807, 0.4273969, 1.869217, 1, 0, 0.9529412, 1,
1.076221, -0.4075806, 2.380102, 1, 0, 0.9490196, 1,
1.078972, 0.9545145, 0.9796833, 1, 0, 0.9411765, 1,
1.081414, 0.04539923, 2.26654, 1, 0, 0.9372549, 1,
1.088059, -0.5252295, 3.331532, 1, 0, 0.9294118, 1,
1.089364, -1.149032, 2.697225, 1, 0, 0.9254902, 1,
1.09126, 1.808521, 1.705508, 1, 0, 0.9176471, 1,
1.092742, -0.5636477, 3.711168, 1, 0, 0.9137255, 1,
1.093868, -2.531435, 0.2883518, 1, 0, 0.9058824, 1,
1.09536, 1.220197, 0.1391108, 1, 0, 0.9019608, 1,
1.096424, 0.09617176, 2.379211, 1, 0, 0.8941177, 1,
1.098388, -0.9027873, 1.511942, 1, 0, 0.8862745, 1,
1.103437, 0.4324344, 1.121025, 1, 0, 0.8823529, 1,
1.125015, 0.7077493, 3.000317, 1, 0, 0.8745098, 1,
1.130124, 0.1272896, 1.119242, 1, 0, 0.8705882, 1,
1.135005, -0.8366937, 2.497101, 1, 0, 0.8627451, 1,
1.135612, -1.602954, 3.022425, 1, 0, 0.8588235, 1,
1.138656, -0.5871544, 2.253982, 1, 0, 0.8509804, 1,
1.138753, 0.3959693, 1.322143, 1, 0, 0.8470588, 1,
1.142704, -1.529962, 2.064442, 1, 0, 0.8392157, 1,
1.147384, 0.2177802, 3.585531, 1, 0, 0.8352941, 1,
1.147998, -1.185604, 3.064283, 1, 0, 0.827451, 1,
1.150156, -0.0221088, 2.183335, 1, 0, 0.8235294, 1,
1.151316, 1.525817, -0.2972889, 1, 0, 0.8156863, 1,
1.158948, 1.308271, 0.1073771, 1, 0, 0.8117647, 1,
1.161312, -1.481753, 3.949465, 1, 0, 0.8039216, 1,
1.166695, -0.6375353, 2.970596, 1, 0, 0.7960784, 1,
1.172696, -0.9275306, 2.904727, 1, 0, 0.7921569, 1,
1.173583, 0.8383701, 2.138957, 1, 0, 0.7843137, 1,
1.17764, 0.403118, 0.3149485, 1, 0, 0.7803922, 1,
1.179868, -0.1702505, 2.230421, 1, 0, 0.772549, 1,
1.184982, -0.7855969, 0.4743646, 1, 0, 0.7686275, 1,
1.192749, 2.286693, 0.5311372, 1, 0, 0.7607843, 1,
1.193261, 0.6775907, 1.369499, 1, 0, 0.7568628, 1,
1.196326, -0.7582209, 2.538122, 1, 0, 0.7490196, 1,
1.210296, 0.1570663, 2.070381, 1, 0, 0.7450981, 1,
1.21832, -1.451317, 3.765962, 1, 0, 0.7372549, 1,
1.221384, -0.1354768, 2.521553, 1, 0, 0.7333333, 1,
1.223409, 0.4354933, 1.515475, 1, 0, 0.7254902, 1,
1.225481, 1.904582, 0.8142787, 1, 0, 0.7215686, 1,
1.229524, -2.337564, 0.9800957, 1, 0, 0.7137255, 1,
1.229786, 0.2104434, 1.298652, 1, 0, 0.7098039, 1,
1.235738, 0.2236742, 2.515718, 1, 0, 0.7019608, 1,
1.241431, 0.3080606, 0.265366, 1, 0, 0.6941177, 1,
1.241717, -0.5452955, 2.606599, 1, 0, 0.6901961, 1,
1.246361, -1.247198, 1.899049, 1, 0, 0.682353, 1,
1.251625, -0.8327298, 2.682422, 1, 0, 0.6784314, 1,
1.25668, 0.06821937, 0.4177325, 1, 0, 0.6705883, 1,
1.257018, 1.475874, 1.178802, 1, 0, 0.6666667, 1,
1.273327, -0.1458959, 1.447401, 1, 0, 0.6588235, 1,
1.300247, 1.101871, 1.275394, 1, 0, 0.654902, 1,
1.311447, 0.06280752, 0.4036795, 1, 0, 0.6470588, 1,
1.316893, -0.357208, 3.112549, 1, 0, 0.6431373, 1,
1.317022, -2.088534, 2.210087, 1, 0, 0.6352941, 1,
1.317797, -0.4835593, 4.257438, 1, 0, 0.6313726, 1,
1.320668, 0.2903064, 0.2697431, 1, 0, 0.6235294, 1,
1.323084, -1.277293, 2.518455, 1, 0, 0.6196079, 1,
1.328935, 0.3995061, -0.3426524, 1, 0, 0.6117647, 1,
1.341384, 0.4691519, -0.6250091, 1, 0, 0.6078432, 1,
1.348042, -0.9190862, 4.462349, 1, 0, 0.6, 1,
1.352085, -0.4890232, 1.575622, 1, 0, 0.5921569, 1,
1.358734, 0.3382351, 0.951476, 1, 0, 0.5882353, 1,
1.360299, -1.133155, 2.086295, 1, 0, 0.5803922, 1,
1.366582, -1.601291, 2.475804, 1, 0, 0.5764706, 1,
1.370303, 0.3261277, 0.6629655, 1, 0, 0.5686275, 1,
1.374147, -0.8919072, 1.152507, 1, 0, 0.5647059, 1,
1.378392, 1.160309, 0.5211918, 1, 0, 0.5568628, 1,
1.378538, -0.6272039, 1.900612, 1, 0, 0.5529412, 1,
1.379951, -1.146339, 2.377869, 1, 0, 0.5450981, 1,
1.382909, -0.8011889, 3.061202, 1, 0, 0.5411765, 1,
1.385259, 1.183793, 1.038679, 1, 0, 0.5333334, 1,
1.39498, 1.19898, 2.641375, 1, 0, 0.5294118, 1,
1.397849, -0.8884271, 1.114362, 1, 0, 0.5215687, 1,
1.403868, -0.1433006, 1.158383, 1, 0, 0.5176471, 1,
1.404059, 1.086476, -0.7913168, 1, 0, 0.509804, 1,
1.405891, -0.7682327, 3.690559, 1, 0, 0.5058824, 1,
1.410835, -2.388835, 1.457134, 1, 0, 0.4980392, 1,
1.413494, 0.6862774, 1.69298, 1, 0, 0.4901961, 1,
1.41728, -1.317581, 2.861845, 1, 0, 0.4862745, 1,
1.431986, 0.02293278, 0.6132405, 1, 0, 0.4784314, 1,
1.433055, 1.102397, 1.476854, 1, 0, 0.4745098, 1,
1.437131, 0.6145993, 1.388914, 1, 0, 0.4666667, 1,
1.439044, 0.4078166, 0.1847873, 1, 0, 0.4627451, 1,
1.439345, -0.8578895, 1.161391, 1, 0, 0.454902, 1,
1.446067, -0.2319518, 0.2366903, 1, 0, 0.4509804, 1,
1.453042, 0.1738099, 0.8295015, 1, 0, 0.4431373, 1,
1.455073, 1.320734, 0.3775101, 1, 0, 0.4392157, 1,
1.460852, -1.136344, 2.389052, 1, 0, 0.4313726, 1,
1.471554, 2.086143, 0.5186073, 1, 0, 0.427451, 1,
1.472836, 0.0001451211, 2.518409, 1, 0, 0.4196078, 1,
1.493613, -0.2136611, 1.381973, 1, 0, 0.4156863, 1,
1.49713, -0.1409761, 1.815601, 1, 0, 0.4078431, 1,
1.505166, 0.5312811, 0.9640368, 1, 0, 0.4039216, 1,
1.506704, -0.726281, 1.835899, 1, 0, 0.3960784, 1,
1.51337, -0.01273912, 1.414489, 1, 0, 0.3882353, 1,
1.530306, -2.614264, 0.9849784, 1, 0, 0.3843137, 1,
1.544755, -0.5067237, 1.663534, 1, 0, 0.3764706, 1,
1.553083, 1.504699, 3.643775, 1, 0, 0.372549, 1,
1.554494, 0.007183583, 2.044033, 1, 0, 0.3647059, 1,
1.555629, 0.6179866, 1.852898, 1, 0, 0.3607843, 1,
1.569867, -1.106227, 1.40393, 1, 0, 0.3529412, 1,
1.573831, 0.5379217, 0.7368038, 1, 0, 0.3490196, 1,
1.578497, 0.06896584, 1.778523, 1, 0, 0.3411765, 1,
1.582756, 0.1569209, 3.142672, 1, 0, 0.3372549, 1,
1.587399, 1.391965, 1.105753, 1, 0, 0.3294118, 1,
1.589262, 0.5617236, 2.331047, 1, 0, 0.3254902, 1,
1.594792, 0.2409443, 0.6573625, 1, 0, 0.3176471, 1,
1.598421, 0.3258941, 3.085662, 1, 0, 0.3137255, 1,
1.599343, 0.5263865, 1.325333, 1, 0, 0.3058824, 1,
1.612561, -0.138848, 2.490764, 1, 0, 0.2980392, 1,
1.620472, 0.004624184, 2.336377, 1, 0, 0.2941177, 1,
1.620544, 0.4292879, 1.560518, 1, 0, 0.2862745, 1,
1.628565, 0.3532658, 2.245073, 1, 0, 0.282353, 1,
1.629142, 0.2474344, 1.41884, 1, 0, 0.2745098, 1,
1.658635, -0.3852356, 2.342688, 1, 0, 0.2705882, 1,
1.666213, 0.249018, 0.5395638, 1, 0, 0.2627451, 1,
1.675069, -0.6932473, 0.3335612, 1, 0, 0.2588235, 1,
1.683749, 1.508227, 0.9144174, 1, 0, 0.2509804, 1,
1.685871, -1.882158, 2.699199, 1, 0, 0.2470588, 1,
1.695205, -1.660151, 2.606868, 1, 0, 0.2392157, 1,
1.720794, 1.411176, 1.167192, 1, 0, 0.2352941, 1,
1.733848, 0.1736011, 1.444385, 1, 0, 0.227451, 1,
1.753222, 0.04686121, 1.401842, 1, 0, 0.2235294, 1,
1.777778, -0.2517755, 1.114002, 1, 0, 0.2156863, 1,
1.793507, -0.4758, 2.644031, 1, 0, 0.2117647, 1,
1.8338, -0.6089005, 1.109314, 1, 0, 0.2039216, 1,
1.876065, 0.5302243, 1.557474, 1, 0, 0.1960784, 1,
1.879689, 1.016724, 1.57206, 1, 0, 0.1921569, 1,
1.90824, -0.7289218, 1.164459, 1, 0, 0.1843137, 1,
1.914362, 0.7437094, 0.5074909, 1, 0, 0.1803922, 1,
1.923456, 0.4497332, 2.319667, 1, 0, 0.172549, 1,
1.928789, 0.7541757, 0.2429912, 1, 0, 0.1686275, 1,
1.932652, -0.6287165, 2.586126, 1, 0, 0.1607843, 1,
1.976889, 0.543734, 1.477014, 1, 0, 0.1568628, 1,
1.986331, 0.128119, 1.67933, 1, 0, 0.1490196, 1,
1.989502, -2.665786, 1.233663, 1, 0, 0.145098, 1,
1.993759, -0.1523849, 1.329865, 1, 0, 0.1372549, 1,
2.00013, -0.981653, 2.199674, 1, 0, 0.1333333, 1,
2.004429, -0.398736, 2.205857, 1, 0, 0.1254902, 1,
2.032187, 1.248417, -0.6554762, 1, 0, 0.1215686, 1,
2.079538, 1.337791, 3.744448, 1, 0, 0.1137255, 1,
2.13331, 0.0005533731, 0.8291185, 1, 0, 0.1098039, 1,
2.138247, 0.09527346, 2.188502, 1, 0, 0.1019608, 1,
2.152697, -0.1919674, 0.1360713, 1, 0, 0.09411765, 1,
2.225041, 1.649898, -0.8069355, 1, 0, 0.09019608, 1,
2.285659, -1.380671, 1.324361, 1, 0, 0.08235294, 1,
2.293425, 0.2292383, 3.400812, 1, 0, 0.07843138, 1,
2.333194, -0.2433753, 1.508424, 1, 0, 0.07058824, 1,
2.339481, 1.91464, 0.8560517, 1, 0, 0.06666667, 1,
2.388625, 0.592243, 1.011393, 1, 0, 0.05882353, 1,
2.554383, -0.871978, 3.261807, 1, 0, 0.05490196, 1,
2.609147, -0.6269714, 0.2963012, 1, 0, 0.04705882, 1,
2.610087, 1.644773, 0.9019704, 1, 0, 0.04313726, 1,
2.656663, 0.3143425, 2.59828, 1, 0, 0.03529412, 1,
2.687342, 0.6403109, 3.03673, 1, 0, 0.03137255, 1,
2.884083, 1.254924, 0.445034, 1, 0, 0.02352941, 1,
3.14185, 0.5049345, 1.908482, 1, 0, 0.01960784, 1,
3.526567, -0.2819618, 2.657154, 1, 0, 0.01176471, 1,
3.782833, -0.1305587, 1.832406, 1, 0, 0.007843138, 1
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
0.3211012, -3.577176, -6.729978, 0, -0.5, 0.5, 0.5,
0.3211012, -3.577176, -6.729978, 1, -0.5, 0.5, 0.5,
0.3211012, -3.577176, -6.729978, 1, 1.5, 0.5, 0.5,
0.3211012, -3.577176, -6.729978, 0, 1.5, 0.5, 0.5
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
-4.314157, 0.02267992, -6.729978, 0, -0.5, 0.5, 0.5,
-4.314157, 0.02267992, -6.729978, 1, -0.5, 0.5, 0.5,
-4.314157, 0.02267992, -6.729978, 1, 1.5, 0.5, 0.5,
-4.314157, 0.02267992, -6.729978, 0, 1.5, 0.5, 0.5
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
-4.314157, -3.577176, 0.2254229, 0, -0.5, 0.5, 0.5,
-4.314157, -3.577176, 0.2254229, 1, -0.5, 0.5, 0.5,
-4.314157, -3.577176, 0.2254229, 1, 1.5, 0.5, 0.5,
-4.314157, -3.577176, 0.2254229, 0, 1.5, 0.5, 0.5
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
-3, -2.74644, -5.124886,
3, -2.74644, -5.124886,
-3, -2.74644, -5.124886,
-3, -2.884896, -5.392401,
-2, -2.74644, -5.124886,
-2, -2.884896, -5.392401,
-1, -2.74644, -5.124886,
-1, -2.884896, -5.392401,
0, -2.74644, -5.124886,
0, -2.884896, -5.392401,
1, -2.74644, -5.124886,
1, -2.884896, -5.392401,
2, -2.74644, -5.124886,
2, -2.884896, -5.392401,
3, -2.74644, -5.124886,
3, -2.884896, -5.392401
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
-3, -3.161808, -5.927432, 0, -0.5, 0.5, 0.5,
-3, -3.161808, -5.927432, 1, -0.5, 0.5, 0.5,
-3, -3.161808, -5.927432, 1, 1.5, 0.5, 0.5,
-3, -3.161808, -5.927432, 0, 1.5, 0.5, 0.5,
-2, -3.161808, -5.927432, 0, -0.5, 0.5, 0.5,
-2, -3.161808, -5.927432, 1, -0.5, 0.5, 0.5,
-2, -3.161808, -5.927432, 1, 1.5, 0.5, 0.5,
-2, -3.161808, -5.927432, 0, 1.5, 0.5, 0.5,
-1, -3.161808, -5.927432, 0, -0.5, 0.5, 0.5,
-1, -3.161808, -5.927432, 1, -0.5, 0.5, 0.5,
-1, -3.161808, -5.927432, 1, 1.5, 0.5, 0.5,
-1, -3.161808, -5.927432, 0, 1.5, 0.5, 0.5,
0, -3.161808, -5.927432, 0, -0.5, 0.5, 0.5,
0, -3.161808, -5.927432, 1, -0.5, 0.5, 0.5,
0, -3.161808, -5.927432, 1, 1.5, 0.5, 0.5,
0, -3.161808, -5.927432, 0, 1.5, 0.5, 0.5,
1, -3.161808, -5.927432, 0, -0.5, 0.5, 0.5,
1, -3.161808, -5.927432, 1, -0.5, 0.5, 0.5,
1, -3.161808, -5.927432, 1, 1.5, 0.5, 0.5,
1, -3.161808, -5.927432, 0, 1.5, 0.5, 0.5,
2, -3.161808, -5.927432, 0, -0.5, 0.5, 0.5,
2, -3.161808, -5.927432, 1, -0.5, 0.5, 0.5,
2, -3.161808, -5.927432, 1, 1.5, 0.5, 0.5,
2, -3.161808, -5.927432, 0, 1.5, 0.5, 0.5,
3, -3.161808, -5.927432, 0, -0.5, 0.5, 0.5,
3, -3.161808, -5.927432, 1, -0.5, 0.5, 0.5,
3, -3.161808, -5.927432, 1, 1.5, 0.5, 0.5,
3, -3.161808, -5.927432, 0, 1.5, 0.5, 0.5
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
-3.244482, -2, -5.124886,
-3.244482, 2, -5.124886,
-3.244482, -2, -5.124886,
-3.422761, -2, -5.392401,
-3.244482, -1, -5.124886,
-3.422761, -1, -5.392401,
-3.244482, 0, -5.124886,
-3.422761, 0, -5.392401,
-3.244482, 1, -5.124886,
-3.422761, 1, -5.392401,
-3.244482, 2, -5.124886,
-3.422761, 2, -5.392401
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
-3.77932, -2, -5.927432, 0, -0.5, 0.5, 0.5,
-3.77932, -2, -5.927432, 1, -0.5, 0.5, 0.5,
-3.77932, -2, -5.927432, 1, 1.5, 0.5, 0.5,
-3.77932, -2, -5.927432, 0, 1.5, 0.5, 0.5,
-3.77932, -1, -5.927432, 0, -0.5, 0.5, 0.5,
-3.77932, -1, -5.927432, 1, -0.5, 0.5, 0.5,
-3.77932, -1, -5.927432, 1, 1.5, 0.5, 0.5,
-3.77932, -1, -5.927432, 0, 1.5, 0.5, 0.5,
-3.77932, 0, -5.927432, 0, -0.5, 0.5, 0.5,
-3.77932, 0, -5.927432, 1, -0.5, 0.5, 0.5,
-3.77932, 0, -5.927432, 1, 1.5, 0.5, 0.5,
-3.77932, 0, -5.927432, 0, 1.5, 0.5, 0.5,
-3.77932, 1, -5.927432, 0, -0.5, 0.5, 0.5,
-3.77932, 1, -5.927432, 1, -0.5, 0.5, 0.5,
-3.77932, 1, -5.927432, 1, 1.5, 0.5, 0.5,
-3.77932, 1, -5.927432, 0, 1.5, 0.5, 0.5,
-3.77932, 2, -5.927432, 0, -0.5, 0.5, 0.5,
-3.77932, 2, -5.927432, 1, -0.5, 0.5, 0.5,
-3.77932, 2, -5.927432, 1, 1.5, 0.5, 0.5,
-3.77932, 2, -5.927432, 0, 1.5, 0.5, 0.5
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
-3.244482, -2.74644, -4,
-3.244482, -2.74644, 4,
-3.244482, -2.74644, -4,
-3.422761, -2.884896, -4,
-3.244482, -2.74644, -2,
-3.422761, -2.884896, -2,
-3.244482, -2.74644, 0,
-3.422761, -2.884896, 0,
-3.244482, -2.74644, 2,
-3.422761, -2.884896, 2,
-3.244482, -2.74644, 4,
-3.422761, -2.884896, 4
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
-3.77932, -3.161808, -4, 0, -0.5, 0.5, 0.5,
-3.77932, -3.161808, -4, 1, -0.5, 0.5, 0.5,
-3.77932, -3.161808, -4, 1, 1.5, 0.5, 0.5,
-3.77932, -3.161808, -4, 0, 1.5, 0.5, 0.5,
-3.77932, -3.161808, -2, 0, -0.5, 0.5, 0.5,
-3.77932, -3.161808, -2, 1, -0.5, 0.5, 0.5,
-3.77932, -3.161808, -2, 1, 1.5, 0.5, 0.5,
-3.77932, -3.161808, -2, 0, 1.5, 0.5, 0.5,
-3.77932, -3.161808, 0, 0, -0.5, 0.5, 0.5,
-3.77932, -3.161808, 0, 1, -0.5, 0.5, 0.5,
-3.77932, -3.161808, 0, 1, 1.5, 0.5, 0.5,
-3.77932, -3.161808, 0, 0, 1.5, 0.5, 0.5,
-3.77932, -3.161808, 2, 0, -0.5, 0.5, 0.5,
-3.77932, -3.161808, 2, 1, -0.5, 0.5, 0.5,
-3.77932, -3.161808, 2, 1, 1.5, 0.5, 0.5,
-3.77932, -3.161808, 2, 0, 1.5, 0.5, 0.5,
-3.77932, -3.161808, 4, 0, -0.5, 0.5, 0.5,
-3.77932, -3.161808, 4, 1, -0.5, 0.5, 0.5,
-3.77932, -3.161808, 4, 1, 1.5, 0.5, 0.5,
-3.77932, -3.161808, 4, 0, 1.5, 0.5, 0.5
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
-3.244482, -2.74644, -5.124886,
-3.244482, 2.7918, -5.124886,
-3.244482, -2.74644, 5.575731,
-3.244482, 2.7918, 5.575731,
-3.244482, -2.74644, -5.124886,
-3.244482, -2.74644, 5.575731,
-3.244482, 2.7918, -5.124886,
-3.244482, 2.7918, 5.575731,
-3.244482, -2.74644, -5.124886,
3.886685, -2.74644, -5.124886,
-3.244482, -2.74644, 5.575731,
3.886685, -2.74644, 5.575731,
-3.244482, 2.7918, -5.124886,
3.886685, 2.7918, -5.124886,
-3.244482, 2.7918, 5.575731,
3.886685, 2.7918, 5.575731,
3.886685, -2.74644, -5.124886,
3.886685, 2.7918, -5.124886,
3.886685, -2.74644, 5.575731,
3.886685, 2.7918, 5.575731,
3.886685, -2.74644, -5.124886,
3.886685, -2.74644, 5.575731,
3.886685, 2.7918, -5.124886,
3.886685, 2.7918, 5.575731
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
var radius = 7.476278;
var distance = 33.26281;
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
mvMatrix.translate( -0.3211012, -0.02267992, -0.2254229 );
mvMatrix.scale( 1.133545, 1.459579, 0.7554236 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.26281);
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
logran<-read.table("logran.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-logran$V2
```

```
## Error in eval(expr, envir, enclos): object 'logran' not found
```

```r
y<-logran$V3
```

```
## Error in eval(expr, envir, enclos): object 'logran' not found
```

```r
z<-logran$V4
```

```
## Error in eval(expr, envir, enclos): object 'logran' not found
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
-3.14063, 0.02294887, -0.8220984, 0, 0, 1, 1, 1,
-2.876947, -0.6195417, -1.819912, 1, 0, 0, 1, 1,
-2.682746, 0.4421868, -1.880165, 1, 0, 0, 1, 1,
-2.660182, 0.6959569, -0.05132267, 1, 0, 0, 1, 1,
-2.517876, 1.293267, -0.6097924, 1, 0, 0, 1, 1,
-2.455172, 0.6370451, -2.065383, 1, 0, 0, 1, 1,
-2.415819, -0.9142336, -2.059048, 0, 0, 0, 1, 1,
-2.409477, -0.3754908, -2.990437, 0, 0, 0, 1, 1,
-2.366668, 1.156829, -0.6103947, 0, 0, 0, 1, 1,
-2.362052, -0.403018, -2.220705, 0, 0, 0, 1, 1,
-2.256307, 1.538138, -2.022627, 0, 0, 0, 1, 1,
-2.231241, -0.2660963, -0.9262616, 0, 0, 0, 1, 1,
-2.219476, -0.3826005, -0.723698, 0, 0, 0, 1, 1,
-2.21506, 1.054329, -0.7107061, 1, 1, 1, 1, 1,
-2.200038, 0.5170735, -1.776086, 1, 1, 1, 1, 1,
-2.134864, 0.3314728, -1.462764, 1, 1, 1, 1, 1,
-2.128909, -0.04809872, -1.440344, 1, 1, 1, 1, 1,
-2.111794, -0.542034, -2.39431, 1, 1, 1, 1, 1,
-2.084676, 0.9851637, -2.078883, 1, 1, 1, 1, 1,
-2.079381, -0.6113302, -1.564863, 1, 1, 1, 1, 1,
-2.07108, -1.024966, -0.8370851, 1, 1, 1, 1, 1,
-2.008732, 0.07611998, -1.204446, 1, 1, 1, 1, 1,
-2.005831, -0.2484419, -3.26, 1, 1, 1, 1, 1,
-1.991674, 1.290275, -0.7418143, 1, 1, 1, 1, 1,
-1.986275, -1.822319, -1.353323, 1, 1, 1, 1, 1,
-1.979958, 0.5567446, -1.061338, 1, 1, 1, 1, 1,
-1.956314, 1.097057, -1.527428, 1, 1, 1, 1, 1,
-1.949488, 0.5556912, -0.8536978, 1, 1, 1, 1, 1,
-1.947312, -1.14501, -2.457059, 0, 0, 1, 1, 1,
-1.94664, -0.5373936, -1.687758, 1, 0, 0, 1, 1,
-1.937534, 0.7616752, 0.5240573, 1, 0, 0, 1, 1,
-1.932024, 0.6849436, -1.3262, 1, 0, 0, 1, 1,
-1.90633, 1.417177, -0.5294485, 1, 0, 0, 1, 1,
-1.906178, -1.898232, -2.984288, 1, 0, 0, 1, 1,
-1.893152, -2.289941, -2.334847, 0, 0, 0, 1, 1,
-1.869796, 0.259162, -1.859996, 0, 0, 0, 1, 1,
-1.864953, -0.7288476, -0.7119996, 0, 0, 0, 1, 1,
-1.818587, 0.9975191, -1.442732, 0, 0, 0, 1, 1,
-1.802307, 0.3156592, -1.77117, 0, 0, 0, 1, 1,
-1.769324, 1.866624, 0.6857412, 0, 0, 0, 1, 1,
-1.768669, 0.4315852, -1.45701, 0, 0, 0, 1, 1,
-1.767122, -1.411943, -1.859779, 1, 1, 1, 1, 1,
-1.763559, 0.1278452, -4.008127, 1, 1, 1, 1, 1,
-1.733385, 0.5022993, -1.707581, 1, 1, 1, 1, 1,
-1.724738, -0.4615216, -2.161178, 1, 1, 1, 1, 1,
-1.720534, 0.17615, -2.911422, 1, 1, 1, 1, 1,
-1.719282, 1.124892, -0.7603769, 1, 1, 1, 1, 1,
-1.7177, 2.336079, -1.017373, 1, 1, 1, 1, 1,
-1.692207, -0.5510691, -1.891072, 1, 1, 1, 1, 1,
-1.691976, 2.185349, -0.231774, 1, 1, 1, 1, 1,
-1.685649, 1.242832, -2.254379, 1, 1, 1, 1, 1,
-1.683239, 0.7884228, -1.336862, 1, 1, 1, 1, 1,
-1.68284, -0.8625073, -1.42104, 1, 1, 1, 1, 1,
-1.664908, 0.1436613, -0.9242402, 1, 1, 1, 1, 1,
-1.661113, 0.3309329, 1.219399, 1, 1, 1, 1, 1,
-1.657376, -0.2270518, -3.080824, 1, 1, 1, 1, 1,
-1.618151, 1.200649, 0.2619225, 0, 0, 1, 1, 1,
-1.616072, 0.09528973, 1.189111, 1, 0, 0, 1, 1,
-1.605983, 0.3310811, -2.39784, 1, 0, 0, 1, 1,
-1.601199, -0.6927428, -3.254495, 1, 0, 0, 1, 1,
-1.596793, 0.7403975, -1.428926, 1, 0, 0, 1, 1,
-1.595196, 0.2748862, -1.078837, 1, 0, 0, 1, 1,
-1.59411, 0.5846528, -1.937116, 0, 0, 0, 1, 1,
-1.587934, 0.4345992, -0.3959379, 0, 0, 0, 1, 1,
-1.586592, -1.735515, -1.896612, 0, 0, 0, 1, 1,
-1.573353, 1.247211, -1.665343, 0, 0, 0, 1, 1,
-1.572123, 0.7608727, -1.581049, 0, 0, 0, 1, 1,
-1.571877, 0.4159657, -0.2972136, 0, 0, 0, 1, 1,
-1.571387, 0.5343701, 0.1114951, 0, 0, 0, 1, 1,
-1.569374, -0.2219003, -0.5771551, 1, 1, 1, 1, 1,
-1.56757, -0.7110028, -4.021816, 1, 1, 1, 1, 1,
-1.556872, 0.1446073, -1.981024, 1, 1, 1, 1, 1,
-1.555927, 0.3577111, -2.107191, 1, 1, 1, 1, 1,
-1.554135, 0.08835359, -1.350338, 1, 1, 1, 1, 1,
-1.553656, 0.2448367, 0.9226375, 1, 1, 1, 1, 1,
-1.553285, -1.129671, -2.405872, 1, 1, 1, 1, 1,
-1.541614, -0.3900608, -4.200765, 1, 1, 1, 1, 1,
-1.532337, -0.04489731, -2.376938, 1, 1, 1, 1, 1,
-1.522616, -0.4502789, -3.088637, 1, 1, 1, 1, 1,
-1.521512, 1.030196, -0.6085671, 1, 1, 1, 1, 1,
-1.519562, -1.045885, -1.58648, 1, 1, 1, 1, 1,
-1.519531, 1.660102, -1.307059, 1, 1, 1, 1, 1,
-1.493604, 0.2200246, -2.125459, 1, 1, 1, 1, 1,
-1.489582, -1.276648, -2.210279, 1, 1, 1, 1, 1,
-1.486159, 0.543583, -1.834046, 0, 0, 1, 1, 1,
-1.478229, -1.338767, -0.6578139, 1, 0, 0, 1, 1,
-1.474178, -0.6785412, -3.740881, 1, 0, 0, 1, 1,
-1.469728, 0.2810717, -1.933242, 1, 0, 0, 1, 1,
-1.465812, -0.8204871, -0.708712, 1, 0, 0, 1, 1,
-1.461442, 0.46748, -1.364572, 1, 0, 0, 1, 1,
-1.459835, 0.07949391, -2.262663, 0, 0, 0, 1, 1,
-1.446078, -0.960315, 0.1832924, 0, 0, 0, 1, 1,
-1.446073, 0.7037669, -0.7870024, 0, 0, 0, 1, 1,
-1.444485, -0.6066382, -0.5989773, 0, 0, 0, 1, 1,
-1.442735, 1.557836, 0.2583323, 0, 0, 0, 1, 1,
-1.431157, 2.011495, -1.06613, 0, 0, 0, 1, 1,
-1.425615, 1.028712, -0.9908069, 0, 0, 0, 1, 1,
-1.423639, 0.342802, -2.834456, 1, 1, 1, 1, 1,
-1.419547, 0.1747217, -1.735283, 1, 1, 1, 1, 1,
-1.404276, 0.08553246, -1.711352, 1, 1, 1, 1, 1,
-1.401183, -0.3017467, -1.02993, 1, 1, 1, 1, 1,
-1.397752, -1.343212, -4.969051, 1, 1, 1, 1, 1,
-1.384972, -0.6023281, -3.097325, 1, 1, 1, 1, 1,
-1.376873, -0.5732078, -0.7210237, 1, 1, 1, 1, 1,
-1.376029, 0.6250572, -2.922006, 1, 1, 1, 1, 1,
-1.374169, -1.092631, -2.709437, 1, 1, 1, 1, 1,
-1.365308, -0.2841029, -1.02497, 1, 1, 1, 1, 1,
-1.361825, 1.305551, -1.129856, 1, 1, 1, 1, 1,
-1.358182, 2.17537, 0.2097541, 1, 1, 1, 1, 1,
-1.356939, 0.1878472, -1.271015, 1, 1, 1, 1, 1,
-1.356497, -0.5655282, -2.043048, 1, 1, 1, 1, 1,
-1.355413, 0.2632449, -1.508394, 1, 1, 1, 1, 1,
-1.34986, 0.1903804, -3.399147, 0, 0, 1, 1, 1,
-1.345958, 0.2368129, -0.1533598, 1, 0, 0, 1, 1,
-1.343643, -1.003915, -3.651198, 1, 0, 0, 1, 1,
-1.341428, 0.9371632, -2.307393, 1, 0, 0, 1, 1,
-1.3406, 0.807076, -0.6485647, 1, 0, 0, 1, 1,
-1.329025, 0.1006304, -2.926973, 1, 0, 0, 1, 1,
-1.320699, 0.2413943, -1.038512, 0, 0, 0, 1, 1,
-1.320395, 1.053212, -1.014021, 0, 0, 0, 1, 1,
-1.305519, 0.4666588, -0.720594, 0, 0, 0, 1, 1,
-1.30169, -1.727596, -2.30162, 0, 0, 0, 1, 1,
-1.299694, -0.819159, -1.970083, 0, 0, 0, 1, 1,
-1.297216, -0.2950418, -1.547516, 0, 0, 0, 1, 1,
-1.292436, -0.2098871, -2.646364, 0, 0, 0, 1, 1,
-1.289928, -0.3921107, -1.011588, 1, 1, 1, 1, 1,
-1.277984, 0.5792308, -0.8407339, 1, 1, 1, 1, 1,
-1.27254, -1.300536, -1.107384, 1, 1, 1, 1, 1,
-1.272029, 0.2970956, -0.476086, 1, 1, 1, 1, 1,
-1.267025, -0.673436, -1.394831, 1, 1, 1, 1, 1,
-1.264949, 2.146354, -0.3515314, 1, 1, 1, 1, 1,
-1.25848, -0.07411461, -2.435655, 1, 1, 1, 1, 1,
-1.255638, 0.4816737, -2.276095, 1, 1, 1, 1, 1,
-1.24824, 2.093435, 1.210259, 1, 1, 1, 1, 1,
-1.245681, 0.2130204, -2.653073, 1, 1, 1, 1, 1,
-1.245339, 2.109953, 1.836966, 1, 1, 1, 1, 1,
-1.244795, -0.4220679, -1.801953, 1, 1, 1, 1, 1,
-1.237299, 2.67362, -2.025511, 1, 1, 1, 1, 1,
-1.236294, -0.04205044, -0.5509254, 1, 1, 1, 1, 1,
-1.236248, 0.7607981, -1.095287, 1, 1, 1, 1, 1,
-1.220883, -2.433108, -0.6279713, 0, 0, 1, 1, 1,
-1.217024, -1.612952, -4.076058, 1, 0, 0, 1, 1,
-1.208062, -1.49823, -2.252493, 1, 0, 0, 1, 1,
-1.206057, -1.087825, -3.317638, 1, 0, 0, 1, 1,
-1.205923, -1.346703, -3.232635, 1, 0, 0, 1, 1,
-1.203842, -1.826505, -2.629144, 1, 0, 0, 1, 1,
-1.200906, 0.7565317, -1.137925, 0, 0, 0, 1, 1,
-1.189635, -0.666867, -3.179043, 0, 0, 0, 1, 1,
-1.187603, 1.331682, -1.10846, 0, 0, 0, 1, 1,
-1.185901, -1.253212, -3.063818, 0, 0, 0, 1, 1,
-1.178224, 0.1745578, -2.445332, 0, 0, 0, 1, 1,
-1.178176, -0.1470716, -0.8585731, 0, 0, 0, 1, 1,
-1.17674, -0.0950407, -1.427201, 0, 0, 0, 1, 1,
-1.166396, -1.12206, -3.729429, 1, 1, 1, 1, 1,
-1.165437, -2.63703, -3.993001, 1, 1, 1, 1, 1,
-1.163514, 1.059429, -0.8464136, 1, 1, 1, 1, 1,
-1.162253, -0.6572995, -1.270305, 1, 1, 1, 1, 1,
-1.159941, 1.476887, 0.1955337, 1, 1, 1, 1, 1,
-1.158367, 0.3153536, -2.055763, 1, 1, 1, 1, 1,
-1.157616, -0.7800385, -1.776622, 1, 1, 1, 1, 1,
-1.151884, -0.4941322, -1.613374, 1, 1, 1, 1, 1,
-1.148928, -0.4147226, -1.455702, 1, 1, 1, 1, 1,
-1.139403, 1.096204, -0.4428835, 1, 1, 1, 1, 1,
-1.130968, 0.888836, -1.646916, 1, 1, 1, 1, 1,
-1.120488, -0.1914405, -1.268901, 1, 1, 1, 1, 1,
-1.119922, -0.1669729, -3.792228, 1, 1, 1, 1, 1,
-1.118461, 0.09773979, -2.175097, 1, 1, 1, 1, 1,
-1.114037, -0.6185646, -2.002808, 1, 1, 1, 1, 1,
-1.110377, 0.2881835, 0.432317, 0, 0, 1, 1, 1,
-1.107285, 1.465972, -0.8715369, 1, 0, 0, 1, 1,
-1.098831, -0.4919566, -2.382013, 1, 0, 0, 1, 1,
-1.09596, 0.8743238, -1.348536, 1, 0, 0, 1, 1,
-1.092921, 0.2669992, -3.205764, 1, 0, 0, 1, 1,
-1.083527, -0.8227017, -1.534967, 1, 0, 0, 1, 1,
-1.083189, 0.2923155, -1.270278, 0, 0, 0, 1, 1,
-1.083185, -0.6092591, 0.2743489, 0, 0, 0, 1, 1,
-1.07485, 0.8575908, -1.407501, 0, 0, 0, 1, 1,
-1.065957, -1.467035, -2.601768, 0, 0, 0, 1, 1,
-1.055812, 0.2949598, -1.374377, 0, 0, 0, 1, 1,
-1.052405, -0.3515099, -2.609847, 0, 0, 0, 1, 1,
-1.051327, 0.257089, -0.7826743, 0, 0, 0, 1, 1,
-1.050755, -0.5182461, -2.011166, 1, 1, 1, 1, 1,
-1.046046, -0.8666573, -3.006403, 1, 1, 1, 1, 1,
-1.034779, 0.06724841, -1.597446, 1, 1, 1, 1, 1,
-1.033891, 0.1567288, -0.0139322, 1, 1, 1, 1, 1,
-1.029907, 1.127986, -1.247983, 1, 1, 1, 1, 1,
-1.029837, -0.4240691, -3.794227, 1, 1, 1, 1, 1,
-1.028018, -0.6921998, -0.3962995, 1, 1, 1, 1, 1,
-1.01725, -0.7634908, -2.084714, 1, 1, 1, 1, 1,
-1.01394, 0.4102733, -1.211108, 1, 1, 1, 1, 1,
-1.013843, 0.8646821, 0.1984648, 1, 1, 1, 1, 1,
-1.011813, -0.407989, -1.509567, 1, 1, 1, 1, 1,
-1.00899, 0.2046242, -2.041415, 1, 1, 1, 1, 1,
-1.007599, -0.9805729, -1.477242, 1, 1, 1, 1, 1,
-1.002411, -1.455253, -1.934999, 1, 1, 1, 1, 1,
-1.001502, 1.833809, -0.928848, 1, 1, 1, 1, 1,
-0.9999623, -1.955507, -3.186151, 0, 0, 1, 1, 1,
-0.9979048, 0.4778979, -0.6556283, 1, 0, 0, 1, 1,
-0.995651, -1.081527, -3.104794, 1, 0, 0, 1, 1,
-0.9923055, -0.04553036, -2.255676, 1, 0, 0, 1, 1,
-0.9812274, -0.2033792, -2.11875, 1, 0, 0, 1, 1,
-0.9756406, 0.1203297, -1.287982, 1, 0, 0, 1, 1,
-0.9693083, 0.215153, 0.2456779, 0, 0, 0, 1, 1,
-0.9675911, -0.5969412, -1.820943, 0, 0, 0, 1, 1,
-0.9650895, 0.09542651, -0.7277472, 0, 0, 0, 1, 1,
-0.9587963, 2.420064, -1.188543, 0, 0, 0, 1, 1,
-0.9584408, -0.7022622, -2.903953, 0, 0, 0, 1, 1,
-0.9583351, 0.1959491, -1.233344, 0, 0, 0, 1, 1,
-0.9530548, -0.1186541, -0.2576695, 0, 0, 0, 1, 1,
-0.9522516, -1.882395, -3.967887, 1, 1, 1, 1, 1,
-0.9491479, 0.8196244, 0.854139, 1, 1, 1, 1, 1,
-0.9444784, -0.2751318, -1.650751, 1, 1, 1, 1, 1,
-0.9398848, 0.5683496, -2.448169, 1, 1, 1, 1, 1,
-0.935927, -0.1347481, -0.9862468, 1, 1, 1, 1, 1,
-0.9332788, -1.328642, -2.450507, 1, 1, 1, 1, 1,
-0.931181, -0.5243563, -1.201128, 1, 1, 1, 1, 1,
-0.9273945, -0.06699696, -0.2799913, 1, 1, 1, 1, 1,
-0.9245696, -0.8243233, -3.38239, 1, 1, 1, 1, 1,
-0.9140384, 0.4960531, -2.361773, 1, 1, 1, 1, 1,
-0.9123328, 1.24447, -0.3528004, 1, 1, 1, 1, 1,
-0.9121594, -0.3759268, -0.9764503, 1, 1, 1, 1, 1,
-0.8909758, 2.33272, -1.792743, 1, 1, 1, 1, 1,
-0.8857575, 0.4736824, 0.1771348, 1, 1, 1, 1, 1,
-0.8849776, 0.662087, -2.475457, 1, 1, 1, 1, 1,
-0.8830732, -0.4927085, -1.660322, 0, 0, 1, 1, 1,
-0.8809994, -0.7538396, -4.646491, 1, 0, 0, 1, 1,
-0.8806252, 0.2896633, -2.82769, 1, 0, 0, 1, 1,
-0.8789796, -0.7136852, -1.839572, 1, 0, 0, 1, 1,
-0.8755559, 0.03708288, -2.28801, 1, 0, 0, 1, 1,
-0.8749819, 0.7530314, -0.2769737, 1, 0, 0, 1, 1,
-0.8729808, 1.489086, -2.048981, 0, 0, 0, 1, 1,
-0.8630738, 0.3426451, -1.549129, 0, 0, 0, 1, 1,
-0.8606175, -0.25792, -0.8328838, 0, 0, 0, 1, 1,
-0.8580306, -0.07767513, -2.355679, 0, 0, 0, 1, 1,
-0.8536879, -1.213466, -3.143254, 0, 0, 0, 1, 1,
-0.8468623, -0.6561081, -3.326453, 0, 0, 0, 1, 1,
-0.8431326, 1.027068, 0.053808, 0, 0, 0, 1, 1,
-0.8424509, 1.771652, -1.169242, 1, 1, 1, 1, 1,
-0.8417097, 1.01473, -2.476274, 1, 1, 1, 1, 1,
-0.8407782, 1.16071, -1.004472, 1, 1, 1, 1, 1,
-0.8397561, -0.6292542, -1.375742, 1, 1, 1, 1, 1,
-0.8394184, 2.711146, -0.8566822, 1, 1, 1, 1, 1,
-0.8342028, -0.5201266, -2.466056, 1, 1, 1, 1, 1,
-0.8291857, 1.215123, 0.211302, 1, 1, 1, 1, 1,
-0.827464, -1.126253, -3.190122, 1, 1, 1, 1, 1,
-0.8259419, 0.01683185, -2.515234, 1, 1, 1, 1, 1,
-0.8239397, -1.630592, -1.693534, 1, 1, 1, 1, 1,
-0.8235362, -0.4338598, -1.571736, 1, 1, 1, 1, 1,
-0.8193102, -1.831999, -2.17619, 1, 1, 1, 1, 1,
-0.8160517, -0.7372693, -0.584866, 1, 1, 1, 1, 1,
-0.815001, -0.01551547, -0.4307938, 1, 1, 1, 1, 1,
-0.8149805, 0.5014386, -1.489491, 1, 1, 1, 1, 1,
-0.8130876, -0.6098653, -3.451772, 0, 0, 1, 1, 1,
-0.8094091, -0.295572, -0.4217764, 1, 0, 0, 1, 1,
-0.8068869, 0.3460496, -0.6532556, 1, 0, 0, 1, 1,
-0.8036754, 1.375196, -2.532127, 1, 0, 0, 1, 1,
-0.8004133, 0.6399729, -1.470486, 1, 0, 0, 1, 1,
-0.7955711, -1.139373, -2.12736, 1, 0, 0, 1, 1,
-0.7953379, 2.564689, -0.1847138, 0, 0, 0, 1, 1,
-0.7904835, 0.9178988, -0.4197956, 0, 0, 0, 1, 1,
-0.7754133, 0.3424277, -0.7783675, 0, 0, 0, 1, 1,
-0.7645952, 0.7173411, -0.466231, 0, 0, 0, 1, 1,
-0.7645155, -1.324006, -3.943696, 0, 0, 0, 1, 1,
-0.7548439, -1.123398, -3.013596, 0, 0, 0, 1, 1,
-0.753773, -1.885489, -2.077633, 0, 0, 0, 1, 1,
-0.7534295, 0.9872828, -0.9639113, 1, 1, 1, 1, 1,
-0.7461767, -0.8447453, -2.928922, 1, 1, 1, 1, 1,
-0.7435731, -0.9505098, -2.987144, 1, 1, 1, 1, 1,
-0.7431275, 0.913519, 0.7100009, 1, 1, 1, 1, 1,
-0.7419804, -0.1412087, -2.162564, 1, 1, 1, 1, 1,
-0.7403167, 1.233682, 1.2135, 1, 1, 1, 1, 1,
-0.7314972, -1.045019, -1.958516, 1, 1, 1, 1, 1,
-0.7311102, 0.9815659, -0.5690544, 1, 1, 1, 1, 1,
-0.7271867, -0.3304746, -0.778258, 1, 1, 1, 1, 1,
-0.7257459, 1.198489, -1.454969, 1, 1, 1, 1, 1,
-0.7199053, -0.1402636, -2.028821, 1, 1, 1, 1, 1,
-0.7169721, 0.06507097, -2.06722, 1, 1, 1, 1, 1,
-0.7147903, 0.6677227, -0.6847195, 1, 1, 1, 1, 1,
-0.7133329, -0.2256151, -0.3765892, 1, 1, 1, 1, 1,
-0.710997, -0.4201077, -1.477735, 1, 1, 1, 1, 1,
-0.7019771, -0.3651178, -3.66866, 0, 0, 1, 1, 1,
-0.699053, 0.9119846, -0.5041774, 1, 0, 0, 1, 1,
-0.6946922, -0.2198671, -0.1247445, 1, 0, 0, 1, 1,
-0.6938663, -0.1062604, -1.822654, 1, 0, 0, 1, 1,
-0.6874179, 1.840006, 1.12461, 1, 0, 0, 1, 1,
-0.6871474, 0.5394735, 0.08118928, 1, 0, 0, 1, 1,
-0.6823273, -1.386368, -3.067269, 0, 0, 0, 1, 1,
-0.6778979, 0.1723386, -2.218145, 0, 0, 0, 1, 1,
-0.6778095, -0.8381787, -2.124847, 0, 0, 0, 1, 1,
-0.674953, 0.05816505, -1.730449, 0, 0, 0, 1, 1,
-0.6715459, 0.5366748, 0.8420786, 0, 0, 0, 1, 1,
-0.6711031, -0.7558915, -3.133486, 0, 0, 0, 1, 1,
-0.6668152, 0.746221, 0.1843957, 0, 0, 0, 1, 1,
-0.6509742, -0.7588146, -1.699683, 1, 1, 1, 1, 1,
-0.6494411, 0.7708031, -2.004069, 1, 1, 1, 1, 1,
-0.649187, -0.4576472, -3.695144, 1, 1, 1, 1, 1,
-0.6391377, -0.1806326, -1.922444, 1, 1, 1, 1, 1,
-0.6362162, -0.4167789, -2.7296, 1, 1, 1, 1, 1,
-0.6262038, 0.8376048, -0.39392, 1, 1, 1, 1, 1,
-0.6258653, 1.026259, -0.6576394, 1, 1, 1, 1, 1,
-0.6216632, -0.2406188, -2.333375, 1, 1, 1, 1, 1,
-0.6131266, -0.1534669, -1.382014, 1, 1, 1, 1, 1,
-0.6116371, 1.794855, 2.029857, 1, 1, 1, 1, 1,
-0.6071833, -0.1648913, -1.379011, 1, 1, 1, 1, 1,
-0.6016687, -1.264022, -1.417989, 1, 1, 1, 1, 1,
-0.5778864, -1.054446, -2.866701, 1, 1, 1, 1, 1,
-0.5730183, 0.7465822, 0.5497001, 1, 1, 1, 1, 1,
-0.5703835, 0.4772201, 0.9092581, 1, 1, 1, 1, 1,
-0.5653188, -1.324439, -4.119946, 0, 0, 1, 1, 1,
-0.5628611, -0.2887595, -2.792006, 1, 0, 0, 1, 1,
-0.5617152, -0.4592999, -2.039924, 1, 0, 0, 1, 1,
-0.5548258, 2.138005, -0.3469098, 1, 0, 0, 1, 1,
-0.5533518, -0.3052853, -3.703622, 1, 0, 0, 1, 1,
-0.542818, 0.3923254, -1.50801, 1, 0, 0, 1, 1,
-0.5365672, -0.2253936, -3.250336, 0, 0, 0, 1, 1,
-0.5298073, -0.1450431, -2.195939, 0, 0, 0, 1, 1,
-0.5278004, -0.7233831, -1.771552, 0, 0, 0, 1, 1,
-0.5274054, 2.434048, -0.6873867, 0, 0, 0, 1, 1,
-0.5273168, -0.9629797, -2.706758, 0, 0, 0, 1, 1,
-0.526884, 0.2141454, -1.750369, 0, 0, 0, 1, 1,
-0.5254116, 1.030375, 0.6668629, 0, 0, 0, 1, 1,
-0.5239042, -0.1127964, -1.438227, 1, 1, 1, 1, 1,
-0.5218891, 0.7545446, 0.2549851, 1, 1, 1, 1, 1,
-0.5205326, 0.6204741, -2.143201, 1, 1, 1, 1, 1,
-0.5176547, -1.300178, -4.675282, 1, 1, 1, 1, 1,
-0.5168377, 0.1327557, -1.687255, 1, 1, 1, 1, 1,
-0.5123276, -1.575189, -1.2665, 1, 1, 1, 1, 1,
-0.5122257, 0.5365905, 0.9878538, 1, 1, 1, 1, 1,
-0.5083386, 1.220585, -0.5486093, 1, 1, 1, 1, 1,
-0.5074595, 0.5818305, -1.480098, 1, 1, 1, 1, 1,
-0.5056419, -0.6081096, -2.491379, 1, 1, 1, 1, 1,
-0.5037224, 0.1325688, -1.389446, 1, 1, 1, 1, 1,
-0.5035296, 0.7975767, -1.08614, 1, 1, 1, 1, 1,
-0.5021113, -1.331388, -2.100397, 1, 1, 1, 1, 1,
-0.5010381, 0.5949178, 0.1237314, 1, 1, 1, 1, 1,
-0.4971634, 0.8150133, -0.2488396, 1, 1, 1, 1, 1,
-0.4964616, -0.2217081, -1.892887, 0, 0, 1, 1, 1,
-0.4852926, 0.4325155, -1.262775, 1, 0, 0, 1, 1,
-0.4852289, -0.01629554, -1.125317, 1, 0, 0, 1, 1,
-0.482675, -0.5744109, -2.107716, 1, 0, 0, 1, 1,
-0.4791652, -1.227537, -1.569857, 1, 0, 0, 1, 1,
-0.4759495, 1.697358, -0.923645, 1, 0, 0, 1, 1,
-0.4752736, -0.3275664, -1.490188, 0, 0, 0, 1, 1,
-0.473316, 1.51461, -1.010813, 0, 0, 0, 1, 1,
-0.4700177, 0.7021202, -0.2417432, 0, 0, 0, 1, 1,
-0.4650348, 1.058299, 2.402399, 0, 0, 0, 1, 1,
-0.461258, 0.3651075, -0.6788751, 0, 0, 0, 1, 1,
-0.4599851, -0.4406448, -3.66374, 0, 0, 0, 1, 1,
-0.4596145, 0.2437941, -0.5546417, 0, 0, 0, 1, 1,
-0.4589274, -0.3510017, -0.8001907, 1, 1, 1, 1, 1,
-0.4566368, 0.5112214, 1.804199, 1, 1, 1, 1, 1,
-0.4494944, -1.586181, -1.978807, 1, 1, 1, 1, 1,
-0.4485153, 1.146166, -0.3374598, 1, 1, 1, 1, 1,
-0.4470186, -1.176262, -2.051435, 1, 1, 1, 1, 1,
-0.4450118, -0.2951559, -2.706095, 1, 1, 1, 1, 1,
-0.4435714, 0.2617109, -0.5222077, 1, 1, 1, 1, 1,
-0.4424797, -1.332356, -1.643993, 1, 1, 1, 1, 1,
-0.4391947, -0.236211, -1.111949, 1, 1, 1, 1, 1,
-0.4358, 0.5548748, -0.7149474, 1, 1, 1, 1, 1,
-0.4263998, 0.02636108, -2.294245, 1, 1, 1, 1, 1,
-0.4237965, 0.131697, -0.8489124, 1, 1, 1, 1, 1,
-0.42225, 1.570005, 0.4580086, 1, 1, 1, 1, 1,
-0.4222171, -1.156629, -3.854067, 1, 1, 1, 1, 1,
-0.4186682, 0.8209177, 0.5865008, 1, 1, 1, 1, 1,
-0.4180868, -0.8843786, -2.573432, 0, 0, 1, 1, 1,
-0.4151706, -1.551012, -1.806151, 1, 0, 0, 1, 1,
-0.4141701, -0.4823984, -1.819677, 1, 0, 0, 1, 1,
-0.4133932, -0.7773745, -2.673805, 1, 0, 0, 1, 1,
-0.4070348, 0.533179, -0.002108604, 1, 0, 0, 1, 1,
-0.4058657, -1.388497, -3.447141, 1, 0, 0, 1, 1,
-0.4055821, 0.3313695, 0.1353599, 0, 0, 0, 1, 1,
-0.4042097, -0.06810393, -2.394508, 0, 0, 0, 1, 1,
-0.40261, 0.04900002, -1.282101, 0, 0, 0, 1, 1,
-0.4008131, -0.3341858, -2.941002, 0, 0, 0, 1, 1,
-0.3981283, -0.1053042, -1.528736, 0, 0, 0, 1, 1,
-0.3974162, 0.2859611, -0.4363547, 0, 0, 0, 1, 1,
-0.3934787, 0.8933049, 0.07798056, 0, 0, 0, 1, 1,
-0.3839127, 1.396496, -1.317891, 1, 1, 1, 1, 1,
-0.3767279, 0.4960583, -1.784972, 1, 1, 1, 1, 1,
-0.3718361, -0.8349108, -1.654277, 1, 1, 1, 1, 1,
-0.3707965, 0.3450433, 1.021725, 1, 1, 1, 1, 1,
-0.3703021, -0.04873144, -1.628088, 1, 1, 1, 1, 1,
-0.3690512, -0.2774493, -3.535167, 1, 1, 1, 1, 1,
-0.3667196, -0.03920749, -2.64511, 1, 1, 1, 1, 1,
-0.3658019, -0.2425035, -2.492405, 1, 1, 1, 1, 1,
-0.3657725, -0.3195214, -2.177188, 1, 1, 1, 1, 1,
-0.3607959, -0.2515056, -2.118845, 1, 1, 1, 1, 1,
-0.357597, -2.00509, -2.321763, 1, 1, 1, 1, 1,
-0.3560594, 2.377916, -0.8859721, 1, 1, 1, 1, 1,
-0.3543303, 1.166997, -1.197005, 1, 1, 1, 1, 1,
-0.3524755, 0.2079972, -0.772915, 1, 1, 1, 1, 1,
-0.349006, 0.2008748, -1.53641, 1, 1, 1, 1, 1,
-0.3474586, -0.01763146, -0.5907645, 0, 0, 1, 1, 1,
-0.3469864, 0.3740715, -0.9627228, 1, 0, 0, 1, 1,
-0.3364135, 0.4287265, -1.20905, 1, 0, 0, 1, 1,
-0.3263004, 0.2703429, 0.2796523, 1, 0, 0, 1, 1,
-0.3243047, -0.1480205, -1.945955, 1, 0, 0, 1, 1,
-0.316061, -1.084779, -2.983277, 1, 0, 0, 1, 1,
-0.3133677, -0.2534227, -1.412215, 0, 0, 0, 1, 1,
-0.3045437, 0.2107841, -0.5074407, 0, 0, 0, 1, 1,
-0.3039481, 0.02262771, -1.339227, 0, 0, 0, 1, 1,
-0.3010672, 0.3536675, -1.045699, 0, 0, 0, 1, 1,
-0.3009073, 0.7752614, -0.4247312, 0, 0, 0, 1, 1,
-0.2968933, -1.053439, -3.031717, 0, 0, 0, 1, 1,
-0.2915706, 0.5793324, 0.2247403, 0, 0, 0, 1, 1,
-0.2849755, 1.919763, -0.7890802, 1, 1, 1, 1, 1,
-0.2835689, -0.2763265, -2.399661, 1, 1, 1, 1, 1,
-0.2820581, 0.1586528, -1.072399, 1, 1, 1, 1, 1,
-0.2798315, -0.9415565, -2.287658, 1, 1, 1, 1, 1,
-0.2795793, -0.1639488, -0.7821921, 1, 1, 1, 1, 1,
-0.2770595, 1.275874, 1.430109, 1, 1, 1, 1, 1,
-0.2717896, -0.723642, -4.251713, 1, 1, 1, 1, 1,
-0.2663075, -0.5246626, -3.106944, 1, 1, 1, 1, 1,
-0.2641067, 0.8117152, -0.2641858, 1, 1, 1, 1, 1,
-0.2630325, -1.865888, -4.299446, 1, 1, 1, 1, 1,
-0.2624621, -1.455054, -2.176648, 1, 1, 1, 1, 1,
-0.2608978, 0.6132361, -1.191383, 1, 1, 1, 1, 1,
-0.2599203, 0.1163214, -1.795879, 1, 1, 1, 1, 1,
-0.2597449, 0.6722398, -1.199583, 1, 1, 1, 1, 1,
-0.2520812, 1.200825, 1.657489, 1, 1, 1, 1, 1,
-0.2503056, -0.4770769, -2.470375, 0, 0, 1, 1, 1,
-0.2481694, -0.7719949, -1.923586, 1, 0, 0, 1, 1,
-0.2461451, 0.9083281, 0.6839657, 1, 0, 0, 1, 1,
-0.2425999, -0.2699034, -4.690896, 1, 0, 0, 1, 1,
-0.2407677, 0.5039119, -0.428529, 1, 0, 0, 1, 1,
-0.2401529, -1.030704, -2.370042, 1, 0, 0, 1, 1,
-0.2369947, 1.659178, -0.5289739, 0, 0, 0, 1, 1,
-0.2323119, -0.8025104, -2.05766, 0, 0, 0, 1, 1,
-0.2321599, 0.9286299, 0.2166942, 0, 0, 0, 1, 1,
-0.2319036, 1.923257, -0.4458129, 0, 0, 0, 1, 1,
-0.2234995, 0.7073342, -1.627432, 0, 0, 0, 1, 1,
-0.2203912, -0.7845667, -1.943886, 0, 0, 0, 1, 1,
-0.2154757, 0.06968252, -1.090194, 0, 0, 0, 1, 1,
-0.2087836, -0.215423, -1.533919, 1, 1, 1, 1, 1,
-0.2055176, -1.649547, -2.62616, 1, 1, 1, 1, 1,
-0.1980567, -0.1041269, -1.629893, 1, 1, 1, 1, 1,
-0.1979927, 0.8349891, 0.8055356, 1, 1, 1, 1, 1,
-0.1956563, -1.73454, -1.957397, 1, 1, 1, 1, 1,
-0.193249, -1.699142, -3.170486, 1, 1, 1, 1, 1,
-0.1909065, -1.164515, -2.47589, 1, 1, 1, 1, 1,
-0.1828849, 1.396753, 0.9534525, 1, 1, 1, 1, 1,
-0.1813685, -0.08102053, -0.9358215, 1, 1, 1, 1, 1,
-0.180187, -0.3018104, -2.498021, 1, 1, 1, 1, 1,
-0.1758665, 0.6670505, 0.1350856, 1, 1, 1, 1, 1,
-0.1728361, 0.126169, -0.3627044, 1, 1, 1, 1, 1,
-0.1717353, -0.8205119, -4.251046, 1, 1, 1, 1, 1,
-0.1696206, -0.6305337, -2.408529, 1, 1, 1, 1, 1,
-0.165009, 0.4655887, -0.3583028, 1, 1, 1, 1, 1,
-0.1633452, 0.1182338, -1.695509, 0, 0, 1, 1, 1,
-0.1626696, 0.01593541, 0.4161612, 1, 0, 0, 1, 1,
-0.161692, 1.276918, 0.5023746, 1, 0, 0, 1, 1,
-0.1599981, -1.710665, -3.712469, 1, 0, 0, 1, 1,
-0.1577347, 1.095652, -0.5753841, 1, 0, 0, 1, 1,
-0.157516, -0.425042, -3.15086, 1, 0, 0, 1, 1,
-0.1568156, 0.615237, -0.2101325, 0, 0, 0, 1, 1,
-0.156427, 1.494188, 1.563128, 0, 0, 0, 1, 1,
-0.1503471, 2.048931, -1.59285, 0, 0, 0, 1, 1,
-0.1498742, -1.735046, -2.697312, 0, 0, 0, 1, 1,
-0.1492668, 1.403015, 0.8150951, 0, 0, 0, 1, 1,
-0.1459861, 0.7984961, 1.770575, 0, 0, 0, 1, 1,
-0.1442376, 0.2752018, -1.392741, 0, 0, 0, 1, 1,
-0.1440435, 0.280884, -1.792158, 1, 1, 1, 1, 1,
-0.1427789, -1.341853, -3.246472, 1, 1, 1, 1, 1,
-0.1401964, -1.054096, -1.925804, 1, 1, 1, 1, 1,
-0.1386196, -0.8262016, -3.155378, 1, 1, 1, 1, 1,
-0.1378849, -0.1869704, -1.741513, 1, 1, 1, 1, 1,
-0.1301083, -1.155436, -3.660907, 1, 1, 1, 1, 1,
-0.126534, -0.3060184, -2.616327, 1, 1, 1, 1, 1,
-0.1242613, -0.9222398, -3.140227, 1, 1, 1, 1, 1,
-0.119468, -0.3056206, -2.537536, 1, 1, 1, 1, 1,
-0.1164864, -1.428206, -2.318038, 1, 1, 1, 1, 1,
-0.1160297, 1.474443, -2.026888, 1, 1, 1, 1, 1,
-0.1153223, -0.2842198, -0.3610265, 1, 1, 1, 1, 1,
-0.1141487, -0.192829, -3.115193, 1, 1, 1, 1, 1,
-0.1088628, 0.4283459, 0.3580913, 1, 1, 1, 1, 1,
-0.1085244, -0.7591801, -4.722198, 1, 1, 1, 1, 1,
-0.1084394, 0.0894255, -1.677222, 0, 0, 1, 1, 1,
-0.1062242, -0.50898, -3.193408, 1, 0, 0, 1, 1,
-0.1034884, -0.05251266, -1.336172, 1, 0, 0, 1, 1,
-0.09708071, 0.8476866, 1.104033, 1, 0, 0, 1, 1,
-0.09603477, -1.202428, -2.778444, 1, 0, 0, 1, 1,
-0.09290267, -0.01908668, -2.2156, 1, 0, 0, 1, 1,
-0.09112249, -0.5735901, -4.07798, 0, 0, 0, 1, 1,
-0.08978405, -1.728386, -3.243663, 0, 0, 0, 1, 1,
-0.08509146, -0.8255237, -1.953429, 0, 0, 0, 1, 1,
-0.08416656, 0.1894952, 0.00410965, 0, 0, 0, 1, 1,
-0.07906575, -0.4054063, -2.530111, 0, 0, 0, 1, 1,
-0.0789537, 0.124818, 0.4937679, 0, 0, 0, 1, 1,
-0.07861404, -0.8297865, -3.997093, 0, 0, 0, 1, 1,
-0.07383926, 0.7107183, -2.11526, 1, 1, 1, 1, 1,
-0.07262351, -1.059834, -2.876893, 1, 1, 1, 1, 1,
-0.07056342, 0.8297214, 0.1922947, 1, 1, 1, 1, 1,
-0.06145705, -0.8850961, -3.349763, 1, 1, 1, 1, 1,
-0.06137085, 0.7814579, -0.4205204, 1, 1, 1, 1, 1,
-0.05671851, -0.05701349, -2.312937, 1, 1, 1, 1, 1,
-0.04653721, 0.1876649, -0.655822, 1, 1, 1, 1, 1,
-0.03868794, 0.2357648, -2.764361, 1, 1, 1, 1, 1,
-0.03273845, 0.5098222, 0.3909301, 1, 1, 1, 1, 1,
-0.02870905, -0.3640814, -3.0044, 1, 1, 1, 1, 1,
-0.02833361, -1.58251, -3.526744, 1, 1, 1, 1, 1,
-0.0271673, -1.708941, -2.313708, 1, 1, 1, 1, 1,
-0.02519589, 0.8882591, 0.04038018, 1, 1, 1, 1, 1,
-0.02434685, 0.6585698, 0.3419246, 1, 1, 1, 1, 1,
-0.01732815, -0.1461258, -3.073935, 1, 1, 1, 1, 1,
-0.009370427, 0.1751642, -0.9840276, 0, 0, 1, 1, 1,
-0.006407607, 0.97515, -1.707312, 1, 0, 0, 1, 1,
-0.003394249, 1.371172, 0.5662591, 1, 0, 0, 1, 1,
0.003433494, -1.763133, 2.613303, 1, 0, 0, 1, 1,
0.00641945, -1.254606, 2.308317, 1, 0, 0, 1, 1,
0.007116547, -0.5197707, 2.451287, 1, 0, 0, 1, 1,
0.02192929, 1.130469, 1.284672, 0, 0, 0, 1, 1,
0.02461852, -2.610307, 3.331326, 0, 0, 0, 1, 1,
0.03495331, -1.177118, 2.812464, 0, 0, 0, 1, 1,
0.03532638, -0.5704404, 3.954322, 0, 0, 0, 1, 1,
0.03614371, 2.12084, 0.3802489, 0, 0, 0, 1, 1,
0.03843059, 0.9039897, 0.4056718, 0, 0, 0, 1, 1,
0.04066685, -0.01887187, 0.8420252, 0, 0, 0, 1, 1,
0.04422186, 1.340089, 0.7120021, 1, 1, 1, 1, 1,
0.05057785, -1.732868, 4.071727, 1, 1, 1, 1, 1,
0.0508989, -0.4056502, 1.917848, 1, 1, 1, 1, 1,
0.05172971, -0.09832079, 2.40391, 1, 1, 1, 1, 1,
0.06638645, -1.789216, 3.255907, 1, 1, 1, 1, 1,
0.06727903, 0.4328911, 0.7043039, 1, 1, 1, 1, 1,
0.06944967, -1.494544, 3.485404, 1, 1, 1, 1, 1,
0.07030494, -0.2474324, 2.149863, 1, 1, 1, 1, 1,
0.07203558, -0.05558756, 1.112056, 1, 1, 1, 1, 1,
0.07217989, 0.0878963, 0.9118835, 1, 1, 1, 1, 1,
0.07453371, -0.2009659, 2.442825, 1, 1, 1, 1, 1,
0.078194, 0.5330257, -0.2273505, 1, 1, 1, 1, 1,
0.08110751, -0.5943395, 2.607302, 1, 1, 1, 1, 1,
0.08557183, 0.5724809, 0.1604442, 1, 1, 1, 1, 1,
0.08696166, 0.8982974, -0.4672419, 1, 1, 1, 1, 1,
0.09424251, 0.2746986, -0.3510012, 0, 0, 1, 1, 1,
0.0945036, 0.002265708, -1.123346, 1, 0, 0, 1, 1,
0.1138551, -1.360784, 1.637473, 1, 0, 0, 1, 1,
0.1146967, -0.4222549, 2.879547, 1, 0, 0, 1, 1,
0.1158069, 1.347462, -1.454455, 1, 0, 0, 1, 1,
0.1226371, -1.058092, 3.102068, 1, 0, 0, 1, 1,
0.1233475, -0.9939976, 1.891358, 0, 0, 0, 1, 1,
0.1256331, 0.003331965, 1.159346, 0, 0, 0, 1, 1,
0.1361489, -1.226059, 4.209693, 0, 0, 0, 1, 1,
0.1388254, -0.5221712, 2.485867, 0, 0, 0, 1, 1,
0.1394499, 0.3722501, 0.339659, 0, 0, 0, 1, 1,
0.140386, 0.1431919, -0.4022145, 0, 0, 0, 1, 1,
0.1415466, -1.202688, 2.963689, 0, 0, 0, 1, 1,
0.1476151, -0.7049488, 1.512967, 1, 1, 1, 1, 1,
0.1477197, 1.026153, -1.752532, 1, 1, 1, 1, 1,
0.1481919, 0.3759406, 0.9410398, 1, 1, 1, 1, 1,
0.1552302, 2.07401, -0.9168896, 1, 1, 1, 1, 1,
0.155595, -0.1228671, 2.04784, 1, 1, 1, 1, 1,
0.1559765, -0.5141741, 4.131847, 1, 1, 1, 1, 1,
0.1582213, 1.108109, -0.1374786, 1, 1, 1, 1, 1,
0.1604325, 0.8892336, 0.1647592, 1, 1, 1, 1, 1,
0.1691126, 0.7846351, -0.3437024, 1, 1, 1, 1, 1,
0.172351, -1.633386, 2.813919, 1, 1, 1, 1, 1,
0.1723925, 1.375916, 0.2049597, 1, 1, 1, 1, 1,
0.1734743, 0.3314009, 0.492347, 1, 1, 1, 1, 1,
0.1769223, -2.116621, 4.73211, 1, 1, 1, 1, 1,
0.1823269, -0.3823441, 2.654332, 1, 1, 1, 1, 1,
0.1842837, 1.213421, -0.9881779, 1, 1, 1, 1, 1,
0.1850269, -1.019576, 4.391624, 0, 0, 1, 1, 1,
0.1858267, 0.857345, 0.8859439, 1, 0, 0, 1, 1,
0.1871397, -1.388629, 4.235499, 1, 0, 0, 1, 1,
0.1897546, 1.760156, 0.4660355, 1, 0, 0, 1, 1,
0.1959764, 0.00512142, 1.179078, 1, 0, 0, 1, 1,
0.1999866, -0.2499583, 0.6129313, 1, 0, 0, 1, 1,
0.2017019, 0.1455799, 0.007012085, 0, 0, 0, 1, 1,
0.2018644, 1.400396, 0.1355113, 0, 0, 0, 1, 1,
0.2049153, 0.2373853, 3.318322, 0, 0, 0, 1, 1,
0.2088155, 0.7108467, -0.7926285, 0, 0, 0, 1, 1,
0.2149855, -0.7280328, 4.086617, 0, 0, 0, 1, 1,
0.2158048, -0.8937293, 3.2353, 0, 0, 0, 1, 1,
0.2158128, -0.4307986, 4.194556, 0, 0, 0, 1, 1,
0.2176694, -0.9736235, 2.993784, 1, 1, 1, 1, 1,
0.2187321, -1.637688, 4.007625, 1, 1, 1, 1, 1,
0.2213649, -0.7136847, 1.932074, 1, 1, 1, 1, 1,
0.2219584, -2.632444, 2.763875, 1, 1, 1, 1, 1,
0.2275249, -1.588964, 0.9837142, 1, 1, 1, 1, 1,
0.2276034, 0.1155224, 0.3100694, 1, 1, 1, 1, 1,
0.2283396, 1.361428, 0.3348923, 1, 1, 1, 1, 1,
0.2307853, -0.8834816, 2.379275, 1, 1, 1, 1, 1,
0.232105, 0.3668976, 0.8903481, 1, 1, 1, 1, 1,
0.2343746, 0.3532287, 0.3720396, 1, 1, 1, 1, 1,
0.2345968, -0.04248363, 1.278048, 1, 1, 1, 1, 1,
0.2370285, -1.44995, 2.343639, 1, 1, 1, 1, 1,
0.2381793, -1.323837, 4.675621, 1, 1, 1, 1, 1,
0.2424795, 0.5952182, 2.200196, 1, 1, 1, 1, 1,
0.24405, 0.9195378, -1.488514, 1, 1, 1, 1, 1,
0.2485332, -0.05868533, 2.062678, 0, 0, 1, 1, 1,
0.2535281, 0.04213409, 1.125816, 1, 0, 0, 1, 1,
0.2548883, 0.4583274, 0.4206013, 1, 0, 0, 1, 1,
0.2555001, 0.2337037, 3.510863, 1, 0, 0, 1, 1,
0.2576382, -0.03742427, 1.916139, 1, 0, 0, 1, 1,
0.2647853, -0.2833816, 1.234811, 1, 0, 0, 1, 1,
0.2679697, -1.000543, 2.213998, 0, 0, 0, 1, 1,
0.2707477, -0.8094735, 0.3643957, 0, 0, 0, 1, 1,
0.2713242, 0.1128972, -1.353202, 0, 0, 0, 1, 1,
0.272661, 0.06447196, -0.193948, 0, 0, 0, 1, 1,
0.2774823, -1.844165, 3.751595, 0, 0, 0, 1, 1,
0.2802627, -0.5491617, 1.626545, 0, 0, 0, 1, 1,
0.2807567, 0.02225269, 1.687238, 0, 0, 0, 1, 1,
0.2812162, -0.8874996, 3.026517, 1, 1, 1, 1, 1,
0.2875406, 0.604726, 0.1300088, 1, 1, 1, 1, 1,
0.2881959, 0.1885003, 0.5604043, 1, 1, 1, 1, 1,
0.2889929, 0.9476755, -1.054346, 1, 1, 1, 1, 1,
0.295526, 1.208535, -0.3473688, 1, 1, 1, 1, 1,
0.2960466, -0.1643107, 2.742527, 1, 1, 1, 1, 1,
0.296305, -1.379509, 3.07272, 1, 1, 1, 1, 1,
0.2973602, -0.8982125, 3.973557, 1, 1, 1, 1, 1,
0.2993566, -0.5582331, 3.589006, 1, 1, 1, 1, 1,
0.3012559, -1.306001, 5.419897, 1, 1, 1, 1, 1,
0.3038776, -0.1486358, 1.487635, 1, 1, 1, 1, 1,
0.3078749, -0.4394441, 0.955141, 1, 1, 1, 1, 1,
0.3142238, 1.510605, -0.8035604, 1, 1, 1, 1, 1,
0.3154464, 0.1770902, 1.720198, 1, 1, 1, 1, 1,
0.318473, 0.02705817, 0.3731343, 1, 1, 1, 1, 1,
0.3185278, -0.5553211, 4.216491, 0, 0, 1, 1, 1,
0.3231142, -1.463869, 2.059212, 1, 0, 0, 1, 1,
0.3272607, -0.01166236, 1.409966, 1, 0, 0, 1, 1,
0.3365756, -2.214973, 1.153618, 1, 0, 0, 1, 1,
0.3404918, -1.062952, 2.61974, 1, 0, 0, 1, 1,
0.3408906, 2.342063, 0.2664137, 1, 0, 0, 1, 1,
0.3416275, -1.721334, 3.499679, 0, 0, 0, 1, 1,
0.3437351, -0.153683, 0.9631866, 0, 0, 0, 1, 1,
0.3456406, -0.6366397, 3.277186, 0, 0, 0, 1, 1,
0.3546733, -0.9289871, 2.095726, 0, 0, 0, 1, 1,
0.3575941, -1.825933, 3.251194, 0, 0, 0, 1, 1,
0.3584316, -1.561178, 3.817638, 0, 0, 0, 1, 1,
0.3623984, -0.003394435, 2.519484, 0, 0, 0, 1, 1,
0.3624749, 0.2366688, 3.380003, 1, 1, 1, 1, 1,
0.3636018, -0.3668866, 3.437615, 1, 1, 1, 1, 1,
0.3639914, 0.1599592, 0.6781815, 1, 1, 1, 1, 1,
0.3662362, 1.440843, 0.03463123, 1, 1, 1, 1, 1,
0.3671678, 0.1796472, 1.699352, 1, 1, 1, 1, 1,
0.3721369, 0.4766215, 0.9188542, 1, 1, 1, 1, 1,
0.377144, -0.03114826, 1.834453, 1, 1, 1, 1, 1,
0.3800056, 0.42749, -0.9712105, 1, 1, 1, 1, 1,
0.3816461, -0.02054602, 2.286134, 1, 1, 1, 1, 1,
0.3829184, 0.4993366, -0.09906554, 1, 1, 1, 1, 1,
0.3846429, -2.082136, 2.047277, 1, 1, 1, 1, 1,
0.3857791, -0.1490812, 0.8247429, 1, 1, 1, 1, 1,
0.3857976, 1.460319, 2.818356, 1, 1, 1, 1, 1,
0.3868264, 0.03672995, 2.755831, 1, 1, 1, 1, 1,
0.3874083, 0.3225802, 3.237653, 1, 1, 1, 1, 1,
0.3878932, -0.4859326, 2.231952, 0, 0, 1, 1, 1,
0.391658, -0.2256892, 3.277007, 1, 0, 0, 1, 1,
0.3964373, 0.322961, 0.2903549, 1, 0, 0, 1, 1,
0.4059491, -1.819802, 2.1013, 1, 0, 0, 1, 1,
0.4112329, 1.530163, 1.658312, 1, 0, 0, 1, 1,
0.4113192, 1.489735, -0.01763429, 1, 0, 0, 1, 1,
0.4163911, 0.4714325, -1.718504, 0, 0, 0, 1, 1,
0.4237883, -0.3356479, 0.3899033, 0, 0, 0, 1, 1,
0.4281608, 0.5164184, 0.6083408, 0, 0, 0, 1, 1,
0.4290799, -0.9973461, 4.422722, 0, 0, 0, 1, 1,
0.4297061, -0.3186006, 1.103287, 0, 0, 0, 1, 1,
0.4372598, -0.5358105, 2.327189, 0, 0, 0, 1, 1,
0.4391357, 0.6788614, 2.318075, 0, 0, 0, 1, 1,
0.4399554, 0.4662246, -0.9690204, 1, 1, 1, 1, 1,
0.4400047, -0.9455221, 1.092714, 1, 1, 1, 1, 1,
0.4402934, -0.8965033, 3.145608, 1, 1, 1, 1, 1,
0.441014, 0.43191, -2.119581, 1, 1, 1, 1, 1,
0.4436476, -0.802116, 2.242293, 1, 1, 1, 1, 1,
0.4455957, 0.8468813, -0.4491331, 1, 1, 1, 1, 1,
0.4472606, -0.1233102, 2.44425, 1, 1, 1, 1, 1,
0.4473994, -0.8684559, 1.208017, 1, 1, 1, 1, 1,
0.447817, 0.1645124, 1.03029, 1, 1, 1, 1, 1,
0.4494311, 0.4595757, 1.979687, 1, 1, 1, 1, 1,
0.4564787, -0.9844069, 3.950632, 1, 1, 1, 1, 1,
0.4589354, -1.084723, 2.907798, 1, 1, 1, 1, 1,
0.4607144, 1.190027, -0.551596, 1, 1, 1, 1, 1,
0.4614313, -0.3773319, 3.195146, 1, 1, 1, 1, 1,
0.4629036, 1.427127, -0.3255278, 1, 1, 1, 1, 1,
0.4656305, -0.7200148, 2.805294, 0, 0, 1, 1, 1,
0.4662763, -0.002410738, 2.008631, 1, 0, 0, 1, 1,
0.4664143, -2.35789, 3.450026, 1, 0, 0, 1, 1,
0.4694027, 0.2238771, 2.254979, 1, 0, 0, 1, 1,
0.4695795, -0.5505211, 3.32105, 1, 0, 0, 1, 1,
0.4713444, -0.4870777, 2.116584, 1, 0, 0, 1, 1,
0.4714005, -1.048627, 3.307552, 0, 0, 0, 1, 1,
0.4729312, -0.2965876, 1.64121, 0, 0, 0, 1, 1,
0.4821882, 0.5165077, 1.117195, 0, 0, 0, 1, 1,
0.4842139, 0.3559959, 1.61016, 0, 0, 0, 1, 1,
0.495321, 0.1416922, -1.171356, 0, 0, 0, 1, 1,
0.4956595, -1.498738, 2.692493, 0, 0, 0, 1, 1,
0.4998517, -0.1077717, 2.286738, 0, 0, 0, 1, 1,
0.5000591, 0.6370569, 0.8546373, 1, 1, 1, 1, 1,
0.5004523, 0.3155798, 1.531802, 1, 1, 1, 1, 1,
0.5037634, 0.08250932, 0.631285, 1, 1, 1, 1, 1,
0.5040231, 1.098053, 0.5963524, 1, 1, 1, 1, 1,
0.5054144, -0.5572057, 1.527383, 1, 1, 1, 1, 1,
0.5082721, -1.430254, 4.669058, 1, 1, 1, 1, 1,
0.5090586, 1.159698, -0.8047593, 1, 1, 1, 1, 1,
0.5107948, 0.723222, -1.365058, 1, 1, 1, 1, 1,
0.5240358, 1.314165, 0.3103894, 1, 1, 1, 1, 1,
0.5255458, 0.2564359, -0.1866339, 1, 1, 1, 1, 1,
0.5284196, -0.9195957, 2.170885, 1, 1, 1, 1, 1,
0.533991, 0.5057213, 0.4910088, 1, 1, 1, 1, 1,
0.538805, 0.3443578, 0.660368, 1, 1, 1, 1, 1,
0.5486119, -0.2010925, 2.009138, 1, 1, 1, 1, 1,
0.5539241, 0.2131114, -0.1469806, 1, 1, 1, 1, 1,
0.560945, 0.2136338, 1.310947, 0, 0, 1, 1, 1,
0.5624818, -0.1298994, 2.321246, 1, 0, 0, 1, 1,
0.5634032, 0.1979946, 1.214284, 1, 0, 0, 1, 1,
0.572219, 0.5229019, 0.9718618, 1, 0, 0, 1, 1,
0.5730808, -1.397409, 1.563989, 1, 0, 0, 1, 1,
0.5828674, -1.452323, 3.729365, 1, 0, 0, 1, 1,
0.5831686, 0.7297344, -1.34576, 0, 0, 0, 1, 1,
0.5874776, 0.1082292, 2.320681, 0, 0, 0, 1, 1,
0.5893474, 0.4169108, 2.55101, 0, 0, 0, 1, 1,
0.5959224, 0.1477813, -0.9908578, 0, 0, 0, 1, 1,
0.5983432, 1.283862, -1.279288, 0, 0, 0, 1, 1,
0.6025447, 0.05186597, 2.558426, 0, 0, 0, 1, 1,
0.602935, 2.117014, 2.131408, 0, 0, 0, 1, 1,
0.6080381, 0.4183951, 0.07688015, 1, 1, 1, 1, 1,
0.6108165, -0.0836594, 2.518697, 1, 1, 1, 1, 1,
0.616324, 0.4377988, 0.3797821, 1, 1, 1, 1, 1,
0.6168, -0.9551, 2.247043, 1, 1, 1, 1, 1,
0.6222137, -0.4383668, 3.107504, 1, 1, 1, 1, 1,
0.6225269, -1.291195, 4.225186, 1, 1, 1, 1, 1,
0.6254815, 0.163939, 1.428925, 1, 1, 1, 1, 1,
0.6295841, -0.3184275, 2.48369, 1, 1, 1, 1, 1,
0.6300407, -0.5543483, 2.985118, 1, 1, 1, 1, 1,
0.6303645, 1.538287, 1.351005, 1, 1, 1, 1, 1,
0.6328903, 0.7248895, 1.085824, 1, 1, 1, 1, 1,
0.6396837, -2.102035, 3.224233, 1, 1, 1, 1, 1,
0.6492796, -0.08284994, 0.5943286, 1, 1, 1, 1, 1,
0.6503829, -0.2291523, 1.262419, 1, 1, 1, 1, 1,
0.653993, -1.058702, 4.09657, 1, 1, 1, 1, 1,
0.6556284, -0.7312809, 2.10649, 0, 0, 1, 1, 1,
0.6563193, 0.01078869, 1.116398, 1, 0, 0, 1, 1,
0.6580721, 0.7387317, 1.254295, 1, 0, 0, 1, 1,
0.6593852, -1.250628, 0.64403, 1, 0, 0, 1, 1,
0.6604372, -0.6261108, 2.207671, 1, 0, 0, 1, 1,
0.6611107, 0.3865632, 2.459136, 1, 0, 0, 1, 1,
0.661893, -1.006107, 2.992219, 0, 0, 0, 1, 1,
0.6645182, 1.108579, 2.095294, 0, 0, 0, 1, 1,
0.6670831, 0.6934506, 1.775356, 0, 0, 0, 1, 1,
0.6685528, 0.481153, -0.6129879, 0, 0, 0, 1, 1,
0.6688166, -0.2323026, 1.757084, 0, 0, 0, 1, 1,
0.6735218, -1.073042, 4.05047, 0, 0, 0, 1, 1,
0.6760556, 1.054591, -0.2647583, 0, 0, 0, 1, 1,
0.6778539, -1.418605, 3.294232, 1, 1, 1, 1, 1,
0.6883588, -1.165437, 3.849869, 1, 1, 1, 1, 1,
0.7113808, -0.431715, 2.194153, 1, 1, 1, 1, 1,
0.7325444, 0.7128969, 0.1081901, 1, 1, 1, 1, 1,
0.7357122, -0.3669162, 1.28168, 1, 1, 1, 1, 1,
0.7402561, -1.305379, 3.473221, 1, 1, 1, 1, 1,
0.7423756, -0.5240111, 3.021756, 1, 1, 1, 1, 1,
0.743112, 0.5954533, 1.669819, 1, 1, 1, 1, 1,
0.7442288, -0.3275439, 2.394351, 1, 1, 1, 1, 1,
0.7521271, -0.8741047, 0.9973204, 1, 1, 1, 1, 1,
0.7527804, -1.341985, 1.978312, 1, 1, 1, 1, 1,
0.7531227, -0.2699338, 3.654961, 1, 1, 1, 1, 1,
0.7550811, 0.02192574, 2.908829, 1, 1, 1, 1, 1,
0.7556225, -1.0604, 2.507856, 1, 1, 1, 1, 1,
0.7627954, 1.206955, 3.446167, 1, 1, 1, 1, 1,
0.7640651, -1.121596, 2.839223, 0, 0, 1, 1, 1,
0.767577, -0.2394845, 0.7455665, 1, 0, 0, 1, 1,
0.7677249, 0.9657575, -0.642847, 1, 0, 0, 1, 1,
0.7704301, -0.09907644, 0.8395972, 1, 0, 0, 1, 1,
0.7708715, -1.155716, 2.016135, 1, 0, 0, 1, 1,
0.7723266, -0.09269025, 2.966264, 1, 0, 0, 1, 1,
0.7751839, -0.07562258, 1.123167, 0, 0, 0, 1, 1,
0.7762151, -0.365642, 1.690502, 0, 0, 0, 1, 1,
0.7910162, 1.441904, -0.6052639, 0, 0, 0, 1, 1,
0.8057674, 1.444165, -0.2723063, 0, 0, 0, 1, 1,
0.8074933, 0.02109702, 1.034974, 0, 0, 0, 1, 1,
0.8085718, 0.03782744, 2.279785, 0, 0, 0, 1, 1,
0.8160464, 0.1611623, 2.647262, 0, 0, 0, 1, 1,
0.8221741, 0.4351542, 1.250649, 1, 1, 1, 1, 1,
0.8250309, 1.611013, 0.4939409, 1, 1, 1, 1, 1,
0.8266613, 0.2227902, 1.389942, 1, 1, 1, 1, 1,
0.8272864, -0.05846927, 2.478103, 1, 1, 1, 1, 1,
0.8295818, -0.3450853, 1.907637, 1, 1, 1, 1, 1,
0.8328686, 0.9758119, 1.101791, 1, 1, 1, 1, 1,
0.8340039, -0.2636774, 3.219827, 1, 1, 1, 1, 1,
0.8379092, 1.346552, -0.97629, 1, 1, 1, 1, 1,
0.8418354, 0.5394612, -0.5042199, 1, 1, 1, 1, 1,
0.8447292, -1.128361, 2.0285, 1, 1, 1, 1, 1,
0.845487, -0.5902519, 1.197942, 1, 1, 1, 1, 1,
0.8525902, -2.024715, 4.743653, 1, 1, 1, 1, 1,
0.8579133, -0.5564899, 2.804656, 1, 1, 1, 1, 1,
0.8623073, -0.3181964, 1.938678, 1, 1, 1, 1, 1,
0.8642584, 0.01074798, 0.5903528, 1, 1, 1, 1, 1,
0.8663781, 1.454411, 1.664127, 0, 0, 1, 1, 1,
0.8676636, 0.6357088, 1.981029, 1, 0, 0, 1, 1,
0.8678671, 0.2144484, 1.80071, 1, 0, 0, 1, 1,
0.8700533, 0.06575169, 1.948535, 1, 0, 0, 1, 1,
0.8726661, 1.137458, -0.4586921, 1, 0, 0, 1, 1,
0.8726896, 1.608847, -0.386535, 1, 0, 0, 1, 1,
0.8728654, 0.5277427, 1.312349, 0, 0, 0, 1, 1,
0.8748465, 1.237967, 0.006612977, 0, 0, 0, 1, 1,
0.8882037, -0.7327329, 1.559242, 0, 0, 0, 1, 1,
0.8924742, -1.678399, 1.467321, 0, 0, 0, 1, 1,
0.8979448, -2.069215, 3.959677, 0, 0, 0, 1, 1,
0.8983808, -0.2255858, 3.118555, 0, 0, 0, 1, 1,
0.9002044, 0.4685106, 0.5367513, 0, 0, 0, 1, 1,
0.903008, 1.614899, 1.235267, 1, 1, 1, 1, 1,
0.9070416, 1.651105, -0.7785686, 1, 1, 1, 1, 1,
0.9086971, -0.3754562, 2.496573, 1, 1, 1, 1, 1,
0.9091495, 0.1500662, 2.221678, 1, 1, 1, 1, 1,
0.9120089, 2.069089, 0.6166567, 1, 1, 1, 1, 1,
0.9132648, 1.443978, 1.003633, 1, 1, 1, 1, 1,
0.9185376, -0.06202842, 2.774115, 1, 1, 1, 1, 1,
0.9254159, 1.642632, 2.21757, 1, 1, 1, 1, 1,
0.9290663, 0.3956245, 1.373737, 1, 1, 1, 1, 1,
0.9321553, -0.6759841, 1.459973, 1, 1, 1, 1, 1,
0.9326128, -0.8252059, 3.57016, 1, 1, 1, 1, 1,
0.9387481, 1.274045, 1.107985, 1, 1, 1, 1, 1,
0.9450083, -0.6237803, 1.652783, 1, 1, 1, 1, 1,
0.9453654, 0.1748282, 2.289581, 1, 1, 1, 1, 1,
0.9505341, -0.1433547, 0.7754886, 1, 1, 1, 1, 1,
0.9516252, -0.9407958, 2.16588, 0, 0, 1, 1, 1,
0.9615172, 0.4026165, 0.1536787, 1, 0, 0, 1, 1,
0.9644722, -0.9796165, 3.958256, 1, 0, 0, 1, 1,
0.966579, 0.816905, 0.1341388, 1, 0, 0, 1, 1,
0.9695079, -0.1009818, 2.207384, 1, 0, 0, 1, 1,
0.9751436, 0.5846094, 1.030052, 1, 0, 0, 1, 1,
0.9824765, 0.4982988, 1.543018, 0, 0, 0, 1, 1,
0.983014, -1.019067, 3.832493, 0, 0, 0, 1, 1,
0.9869766, -0.7214553, 1.651708, 0, 0, 0, 1, 1,
0.987447, 1.166772, -0.9595283, 0, 0, 0, 1, 1,
0.9903808, -0.1254905, 2.04958, 0, 0, 0, 1, 1,
0.9911786, 0.7424318, 0.6168861, 0, 0, 0, 1, 1,
0.992865, 1.317321, 0.02755235, 0, 0, 0, 1, 1,
1.000699, 0.6664127, -1.531987, 1, 1, 1, 1, 1,
1.000973, 0.9821136, 0.9357404, 1, 1, 1, 1, 1,
1.009852, 0.6320592, 0.08829349, 1, 1, 1, 1, 1,
1.017773, -0.7903855, 0.684685, 1, 1, 1, 1, 1,
1.021164, 0.1744141, 1.137242, 1, 1, 1, 1, 1,
1.021378, 1.529113, 0.1194214, 1, 1, 1, 1, 1,
1.032549, -0.2040031, 1.576463, 1, 1, 1, 1, 1,
1.032574, -0.9275802, 1.930533, 1, 1, 1, 1, 1,
1.03937, -0.942116, 3.525373, 1, 1, 1, 1, 1,
1.039483, -1.051189, 3.57844, 1, 1, 1, 1, 1,
1.043544, -1.28087, 3.241293, 1, 1, 1, 1, 1,
1.044171, -0.2516301, 2.497623, 1, 1, 1, 1, 1,
1.047376, -0.0993551, 3.037861, 1, 1, 1, 1, 1,
1.054152, -0.5635733, 3.542336, 1, 1, 1, 1, 1,
1.055674, 0.2040485, 3.029911, 1, 1, 1, 1, 1,
1.064847, -0.5516553, 3.438509, 0, 0, 1, 1, 1,
1.073807, 0.4273969, 1.869217, 1, 0, 0, 1, 1,
1.076221, -0.4075806, 2.380102, 1, 0, 0, 1, 1,
1.078972, 0.9545145, 0.9796833, 1, 0, 0, 1, 1,
1.081414, 0.04539923, 2.26654, 1, 0, 0, 1, 1,
1.088059, -0.5252295, 3.331532, 1, 0, 0, 1, 1,
1.089364, -1.149032, 2.697225, 0, 0, 0, 1, 1,
1.09126, 1.808521, 1.705508, 0, 0, 0, 1, 1,
1.092742, -0.5636477, 3.711168, 0, 0, 0, 1, 1,
1.093868, -2.531435, 0.2883518, 0, 0, 0, 1, 1,
1.09536, 1.220197, 0.1391108, 0, 0, 0, 1, 1,
1.096424, 0.09617176, 2.379211, 0, 0, 0, 1, 1,
1.098388, -0.9027873, 1.511942, 0, 0, 0, 1, 1,
1.103437, 0.4324344, 1.121025, 1, 1, 1, 1, 1,
1.125015, 0.7077493, 3.000317, 1, 1, 1, 1, 1,
1.130124, 0.1272896, 1.119242, 1, 1, 1, 1, 1,
1.135005, -0.8366937, 2.497101, 1, 1, 1, 1, 1,
1.135612, -1.602954, 3.022425, 1, 1, 1, 1, 1,
1.138656, -0.5871544, 2.253982, 1, 1, 1, 1, 1,
1.138753, 0.3959693, 1.322143, 1, 1, 1, 1, 1,
1.142704, -1.529962, 2.064442, 1, 1, 1, 1, 1,
1.147384, 0.2177802, 3.585531, 1, 1, 1, 1, 1,
1.147998, -1.185604, 3.064283, 1, 1, 1, 1, 1,
1.150156, -0.0221088, 2.183335, 1, 1, 1, 1, 1,
1.151316, 1.525817, -0.2972889, 1, 1, 1, 1, 1,
1.158948, 1.308271, 0.1073771, 1, 1, 1, 1, 1,
1.161312, -1.481753, 3.949465, 1, 1, 1, 1, 1,
1.166695, -0.6375353, 2.970596, 1, 1, 1, 1, 1,
1.172696, -0.9275306, 2.904727, 0, 0, 1, 1, 1,
1.173583, 0.8383701, 2.138957, 1, 0, 0, 1, 1,
1.17764, 0.403118, 0.3149485, 1, 0, 0, 1, 1,
1.179868, -0.1702505, 2.230421, 1, 0, 0, 1, 1,
1.184982, -0.7855969, 0.4743646, 1, 0, 0, 1, 1,
1.192749, 2.286693, 0.5311372, 1, 0, 0, 1, 1,
1.193261, 0.6775907, 1.369499, 0, 0, 0, 1, 1,
1.196326, -0.7582209, 2.538122, 0, 0, 0, 1, 1,
1.210296, 0.1570663, 2.070381, 0, 0, 0, 1, 1,
1.21832, -1.451317, 3.765962, 0, 0, 0, 1, 1,
1.221384, -0.1354768, 2.521553, 0, 0, 0, 1, 1,
1.223409, 0.4354933, 1.515475, 0, 0, 0, 1, 1,
1.225481, 1.904582, 0.8142787, 0, 0, 0, 1, 1,
1.229524, -2.337564, 0.9800957, 1, 1, 1, 1, 1,
1.229786, 0.2104434, 1.298652, 1, 1, 1, 1, 1,
1.235738, 0.2236742, 2.515718, 1, 1, 1, 1, 1,
1.241431, 0.3080606, 0.265366, 1, 1, 1, 1, 1,
1.241717, -0.5452955, 2.606599, 1, 1, 1, 1, 1,
1.246361, -1.247198, 1.899049, 1, 1, 1, 1, 1,
1.251625, -0.8327298, 2.682422, 1, 1, 1, 1, 1,
1.25668, 0.06821937, 0.4177325, 1, 1, 1, 1, 1,
1.257018, 1.475874, 1.178802, 1, 1, 1, 1, 1,
1.273327, -0.1458959, 1.447401, 1, 1, 1, 1, 1,
1.300247, 1.101871, 1.275394, 1, 1, 1, 1, 1,
1.311447, 0.06280752, 0.4036795, 1, 1, 1, 1, 1,
1.316893, -0.357208, 3.112549, 1, 1, 1, 1, 1,
1.317022, -2.088534, 2.210087, 1, 1, 1, 1, 1,
1.317797, -0.4835593, 4.257438, 1, 1, 1, 1, 1,
1.320668, 0.2903064, 0.2697431, 0, 0, 1, 1, 1,
1.323084, -1.277293, 2.518455, 1, 0, 0, 1, 1,
1.328935, 0.3995061, -0.3426524, 1, 0, 0, 1, 1,
1.341384, 0.4691519, -0.6250091, 1, 0, 0, 1, 1,
1.348042, -0.9190862, 4.462349, 1, 0, 0, 1, 1,
1.352085, -0.4890232, 1.575622, 1, 0, 0, 1, 1,
1.358734, 0.3382351, 0.951476, 0, 0, 0, 1, 1,
1.360299, -1.133155, 2.086295, 0, 0, 0, 1, 1,
1.366582, -1.601291, 2.475804, 0, 0, 0, 1, 1,
1.370303, 0.3261277, 0.6629655, 0, 0, 0, 1, 1,
1.374147, -0.8919072, 1.152507, 0, 0, 0, 1, 1,
1.378392, 1.160309, 0.5211918, 0, 0, 0, 1, 1,
1.378538, -0.6272039, 1.900612, 0, 0, 0, 1, 1,
1.379951, -1.146339, 2.377869, 1, 1, 1, 1, 1,
1.382909, -0.8011889, 3.061202, 1, 1, 1, 1, 1,
1.385259, 1.183793, 1.038679, 1, 1, 1, 1, 1,
1.39498, 1.19898, 2.641375, 1, 1, 1, 1, 1,
1.397849, -0.8884271, 1.114362, 1, 1, 1, 1, 1,
1.403868, -0.1433006, 1.158383, 1, 1, 1, 1, 1,
1.404059, 1.086476, -0.7913168, 1, 1, 1, 1, 1,
1.405891, -0.7682327, 3.690559, 1, 1, 1, 1, 1,
1.410835, -2.388835, 1.457134, 1, 1, 1, 1, 1,
1.413494, 0.6862774, 1.69298, 1, 1, 1, 1, 1,
1.41728, -1.317581, 2.861845, 1, 1, 1, 1, 1,
1.431986, 0.02293278, 0.6132405, 1, 1, 1, 1, 1,
1.433055, 1.102397, 1.476854, 1, 1, 1, 1, 1,
1.437131, 0.6145993, 1.388914, 1, 1, 1, 1, 1,
1.439044, 0.4078166, 0.1847873, 1, 1, 1, 1, 1,
1.439345, -0.8578895, 1.161391, 0, 0, 1, 1, 1,
1.446067, -0.2319518, 0.2366903, 1, 0, 0, 1, 1,
1.453042, 0.1738099, 0.8295015, 1, 0, 0, 1, 1,
1.455073, 1.320734, 0.3775101, 1, 0, 0, 1, 1,
1.460852, -1.136344, 2.389052, 1, 0, 0, 1, 1,
1.471554, 2.086143, 0.5186073, 1, 0, 0, 1, 1,
1.472836, 0.0001451211, 2.518409, 0, 0, 0, 1, 1,
1.493613, -0.2136611, 1.381973, 0, 0, 0, 1, 1,
1.49713, -0.1409761, 1.815601, 0, 0, 0, 1, 1,
1.505166, 0.5312811, 0.9640368, 0, 0, 0, 1, 1,
1.506704, -0.726281, 1.835899, 0, 0, 0, 1, 1,
1.51337, -0.01273912, 1.414489, 0, 0, 0, 1, 1,
1.530306, -2.614264, 0.9849784, 0, 0, 0, 1, 1,
1.544755, -0.5067237, 1.663534, 1, 1, 1, 1, 1,
1.553083, 1.504699, 3.643775, 1, 1, 1, 1, 1,
1.554494, 0.007183583, 2.044033, 1, 1, 1, 1, 1,
1.555629, 0.6179866, 1.852898, 1, 1, 1, 1, 1,
1.569867, -1.106227, 1.40393, 1, 1, 1, 1, 1,
1.573831, 0.5379217, 0.7368038, 1, 1, 1, 1, 1,
1.578497, 0.06896584, 1.778523, 1, 1, 1, 1, 1,
1.582756, 0.1569209, 3.142672, 1, 1, 1, 1, 1,
1.587399, 1.391965, 1.105753, 1, 1, 1, 1, 1,
1.589262, 0.5617236, 2.331047, 1, 1, 1, 1, 1,
1.594792, 0.2409443, 0.6573625, 1, 1, 1, 1, 1,
1.598421, 0.3258941, 3.085662, 1, 1, 1, 1, 1,
1.599343, 0.5263865, 1.325333, 1, 1, 1, 1, 1,
1.612561, -0.138848, 2.490764, 1, 1, 1, 1, 1,
1.620472, 0.004624184, 2.336377, 1, 1, 1, 1, 1,
1.620544, 0.4292879, 1.560518, 0, 0, 1, 1, 1,
1.628565, 0.3532658, 2.245073, 1, 0, 0, 1, 1,
1.629142, 0.2474344, 1.41884, 1, 0, 0, 1, 1,
1.658635, -0.3852356, 2.342688, 1, 0, 0, 1, 1,
1.666213, 0.249018, 0.5395638, 1, 0, 0, 1, 1,
1.675069, -0.6932473, 0.3335612, 1, 0, 0, 1, 1,
1.683749, 1.508227, 0.9144174, 0, 0, 0, 1, 1,
1.685871, -1.882158, 2.699199, 0, 0, 0, 1, 1,
1.695205, -1.660151, 2.606868, 0, 0, 0, 1, 1,
1.720794, 1.411176, 1.167192, 0, 0, 0, 1, 1,
1.733848, 0.1736011, 1.444385, 0, 0, 0, 1, 1,
1.753222, 0.04686121, 1.401842, 0, 0, 0, 1, 1,
1.777778, -0.2517755, 1.114002, 0, 0, 0, 1, 1,
1.793507, -0.4758, 2.644031, 1, 1, 1, 1, 1,
1.8338, -0.6089005, 1.109314, 1, 1, 1, 1, 1,
1.876065, 0.5302243, 1.557474, 1, 1, 1, 1, 1,
1.879689, 1.016724, 1.57206, 1, 1, 1, 1, 1,
1.90824, -0.7289218, 1.164459, 1, 1, 1, 1, 1,
1.914362, 0.7437094, 0.5074909, 1, 1, 1, 1, 1,
1.923456, 0.4497332, 2.319667, 1, 1, 1, 1, 1,
1.928789, 0.7541757, 0.2429912, 1, 1, 1, 1, 1,
1.932652, -0.6287165, 2.586126, 1, 1, 1, 1, 1,
1.976889, 0.543734, 1.477014, 1, 1, 1, 1, 1,
1.986331, 0.128119, 1.67933, 1, 1, 1, 1, 1,
1.989502, -2.665786, 1.233663, 1, 1, 1, 1, 1,
1.993759, -0.1523849, 1.329865, 1, 1, 1, 1, 1,
2.00013, -0.981653, 2.199674, 1, 1, 1, 1, 1,
2.004429, -0.398736, 2.205857, 1, 1, 1, 1, 1,
2.032187, 1.248417, -0.6554762, 0, 0, 1, 1, 1,
2.079538, 1.337791, 3.744448, 1, 0, 0, 1, 1,
2.13331, 0.0005533731, 0.8291185, 1, 0, 0, 1, 1,
2.138247, 0.09527346, 2.188502, 1, 0, 0, 1, 1,
2.152697, -0.1919674, 0.1360713, 1, 0, 0, 1, 1,
2.225041, 1.649898, -0.8069355, 1, 0, 0, 1, 1,
2.285659, -1.380671, 1.324361, 0, 0, 0, 1, 1,
2.293425, 0.2292383, 3.400812, 0, 0, 0, 1, 1,
2.333194, -0.2433753, 1.508424, 0, 0, 0, 1, 1,
2.339481, 1.91464, 0.8560517, 0, 0, 0, 1, 1,
2.388625, 0.592243, 1.011393, 0, 0, 0, 1, 1,
2.554383, -0.871978, 3.261807, 0, 0, 0, 1, 1,
2.609147, -0.6269714, 0.2963012, 0, 0, 0, 1, 1,
2.610087, 1.644773, 0.9019704, 1, 1, 1, 1, 1,
2.656663, 0.3143425, 2.59828, 1, 1, 1, 1, 1,
2.687342, 0.6403109, 3.03673, 1, 1, 1, 1, 1,
2.884083, 1.254924, 0.445034, 1, 1, 1, 1, 1,
3.14185, 0.5049345, 1.908482, 1, 1, 1, 1, 1,
3.526567, -0.2819618, 2.657154, 1, 1, 1, 1, 1,
3.782833, -0.1305587, 1.832406, 1, 1, 1, 1, 1
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
var radius = 9.326245;
var distance = 32.75804;
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
mvMatrix.translate( -0.3211012, -0.02267992, -0.2254229 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.75804);
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
