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
-3.072158, 0.1941063, 0.1187209, 1, 0, 0, 1,
-2.821829, -0.5590065, -0.2259848, 1, 0.007843138, 0, 1,
-2.775247, -1.462855, -1.244426, 1, 0.01176471, 0, 1,
-2.701209, -0.1810345, -2.364401, 1, 0.01960784, 0, 1,
-2.678088, -0.3645841, -1.739969, 1, 0.02352941, 0, 1,
-2.627999, 1.16772, -1.133114, 1, 0.03137255, 0, 1,
-2.560379, -0.492804, -2.255586, 1, 0.03529412, 0, 1,
-2.442247, 2.014801, -2.201487, 1, 0.04313726, 0, 1,
-2.299483, -0.6145012, -1.504609, 1, 0.04705882, 0, 1,
-2.278503, 0.4058261, 0.3721226, 1, 0.05490196, 0, 1,
-2.272425, 2.545329, 0.959369, 1, 0.05882353, 0, 1,
-2.175433, 0.2255521, -2.066834, 1, 0.06666667, 0, 1,
-2.146079, 0.1616848, -0.08443643, 1, 0.07058824, 0, 1,
-2.121668, 0.3973383, -0.1843977, 1, 0.07843138, 0, 1,
-2.107639, -0.005772419, -0.2177214, 1, 0.08235294, 0, 1,
-2.101978, 1.6233, -0.9701291, 1, 0.09019608, 0, 1,
-2.101625, -0.4290682, -1.213474, 1, 0.09411765, 0, 1,
-2.088782, 2.58752, -0.9640952, 1, 0.1019608, 0, 1,
-2.011073, -2.379872, -2.49698, 1, 0.1098039, 0, 1,
-2.008371, -1.437393, -0.8050724, 1, 0.1137255, 0, 1,
-1.94438, -0.6401352, -1.370684, 1, 0.1215686, 0, 1,
-1.903112, -0.5008652, -1.225841, 1, 0.1254902, 0, 1,
-1.893802, -0.6197813, -2.191538, 1, 0.1333333, 0, 1,
-1.854194, 0.9970056, -1.596985, 1, 0.1372549, 0, 1,
-1.833996, 2.152366, -1.328323, 1, 0.145098, 0, 1,
-1.832412, 0.3648602, -1.071571, 1, 0.1490196, 0, 1,
-1.822915, -0.3579286, -0.5134106, 1, 0.1568628, 0, 1,
-1.812688, 1.44851, -1.82911, 1, 0.1607843, 0, 1,
-1.805914, 1.758238, -0.14496, 1, 0.1686275, 0, 1,
-1.788062, 0.1881118, -1.791674, 1, 0.172549, 0, 1,
-1.786783, 0.7382542, -0.6096472, 1, 0.1803922, 0, 1,
-1.777765, -0.06987096, -1.971429, 1, 0.1843137, 0, 1,
-1.766185, -0.4848786, -0.9762452, 1, 0.1921569, 0, 1,
-1.763417, -0.3435845, -2.754416, 1, 0.1960784, 0, 1,
-1.755722, 0.6035844, -2.287272, 1, 0.2039216, 0, 1,
-1.747337, -0.9338345, -2.963459, 1, 0.2117647, 0, 1,
-1.745779, -1.222071, -1.490827, 1, 0.2156863, 0, 1,
-1.734972, -0.9212657, -3.159247, 1, 0.2235294, 0, 1,
-1.722305, 0.93406, -1.542461, 1, 0.227451, 0, 1,
-1.715492, 0.3773736, -1.009456, 1, 0.2352941, 0, 1,
-1.708596, -1.493005, -2.411002, 1, 0.2392157, 0, 1,
-1.691577, -0.9672303, -0.7183955, 1, 0.2470588, 0, 1,
-1.677656, 0.9934345, -0.3102398, 1, 0.2509804, 0, 1,
-1.663146, 1.893196, -0.972549, 1, 0.2588235, 0, 1,
-1.650823, -1.518744, -0.7179595, 1, 0.2627451, 0, 1,
-1.649819, -0.3911656, -1.141645, 1, 0.2705882, 0, 1,
-1.648657, -0.641499, -3.823514, 1, 0.2745098, 0, 1,
-1.632183, 0.0251497, -0.6284052, 1, 0.282353, 0, 1,
-1.629659, -1.401253, -0.7118511, 1, 0.2862745, 0, 1,
-1.620983, -0.8012691, -1.997482, 1, 0.2941177, 0, 1,
-1.620942, 3.442889, 0.002129053, 1, 0.3019608, 0, 1,
-1.612868, 0.8570982, -1.090475, 1, 0.3058824, 0, 1,
-1.598054, -0.257681, -1.180687, 1, 0.3137255, 0, 1,
-1.597672, 1.771166, -1.120522, 1, 0.3176471, 0, 1,
-1.588822, -0.6078967, -1.534094, 1, 0.3254902, 0, 1,
-1.577202, 0.9456224, -2.623963, 1, 0.3294118, 0, 1,
-1.558607, -0.1135088, -0.5019947, 1, 0.3372549, 0, 1,
-1.5339, -0.915567, -1.413523, 1, 0.3411765, 0, 1,
-1.526842, -1.673078, -1.855051, 1, 0.3490196, 0, 1,
-1.521378, 0.5957669, -1.912271, 1, 0.3529412, 0, 1,
-1.520391, 0.259165, -1.208227, 1, 0.3607843, 0, 1,
-1.494543, -1.700406, -1.583485, 1, 0.3647059, 0, 1,
-1.491686, -2.188576, -4.254778, 1, 0.372549, 0, 1,
-1.480759, -0.1192688, -2.459823, 1, 0.3764706, 0, 1,
-1.474954, 0.4662012, -1.172909, 1, 0.3843137, 0, 1,
-1.465532, -0.1774902, -2.441959, 1, 0.3882353, 0, 1,
-1.459038, -1.035427, -2.264186, 1, 0.3960784, 0, 1,
-1.455714, -0.3959852, -0.2557557, 1, 0.4039216, 0, 1,
-1.452884, -0.5221159, -3.100452, 1, 0.4078431, 0, 1,
-1.43811, 1.714958, -1.265048, 1, 0.4156863, 0, 1,
-1.435752, -0.6671722, -1.619029, 1, 0.4196078, 0, 1,
-1.433813, -1.050538, -1.662186, 1, 0.427451, 0, 1,
-1.431546, 0.134835, -1.870153, 1, 0.4313726, 0, 1,
-1.427621, -1.41396, -1.545412, 1, 0.4392157, 0, 1,
-1.427045, 1.553077, -0.2404047, 1, 0.4431373, 0, 1,
-1.421368, 0.9465681, -1.258609, 1, 0.4509804, 0, 1,
-1.399152, 0.01647072, -0.05326319, 1, 0.454902, 0, 1,
-1.396904, -1.533985, -2.980503, 1, 0.4627451, 0, 1,
-1.389961, 0.4223226, -0.8569745, 1, 0.4666667, 0, 1,
-1.385288, 0.8836223, -1.176242, 1, 0.4745098, 0, 1,
-1.381088, 0.6445417, -2.198431, 1, 0.4784314, 0, 1,
-1.377645, 1.505668, -2.21886, 1, 0.4862745, 0, 1,
-1.376775, 0.2897443, -2.397156, 1, 0.4901961, 0, 1,
-1.360586, -0.6842673, -1.220702, 1, 0.4980392, 0, 1,
-1.350133, -0.1724438, -1.646393, 1, 0.5058824, 0, 1,
-1.34794, -0.1689494, -1.892299, 1, 0.509804, 0, 1,
-1.340419, -0.05226469, -3.047762, 1, 0.5176471, 0, 1,
-1.340074, 1.22868, -0.06017845, 1, 0.5215687, 0, 1,
-1.327884, 0.7545919, 0.1417255, 1, 0.5294118, 0, 1,
-1.319258, 2.01454, 0.5803013, 1, 0.5333334, 0, 1,
-1.313925, -1.593585, -1.731706, 1, 0.5411765, 0, 1,
-1.311955, 1.264872, -0.2691462, 1, 0.5450981, 0, 1,
-1.293197, -0.9256627, -1.756757, 1, 0.5529412, 0, 1,
-1.285067, 0.04216947, 0.501902, 1, 0.5568628, 0, 1,
-1.284133, 0.1996973, -4.330139, 1, 0.5647059, 0, 1,
-1.283322, 0.2355426, -1.238178, 1, 0.5686275, 0, 1,
-1.272487, -0.09154135, -1.040213, 1, 0.5764706, 0, 1,
-1.261613, -1.306081, -4.247033, 1, 0.5803922, 0, 1,
-1.259925, 0.8004953, -1.707744, 1, 0.5882353, 0, 1,
-1.25774, -0.771669, -4.170324, 1, 0.5921569, 0, 1,
-1.245375, -0.4998323, -2.0863, 1, 0.6, 0, 1,
-1.245107, 0.7717158, -1.760773, 1, 0.6078432, 0, 1,
-1.242738, 0.8853739, -0.4595585, 1, 0.6117647, 0, 1,
-1.241603, -0.7468479, -2.226271, 1, 0.6196079, 0, 1,
-1.237178, -0.4687167, -2.136971, 1, 0.6235294, 0, 1,
-1.23673, -0.3368069, -1.82082, 1, 0.6313726, 0, 1,
-1.223193, 0.917339, -1.424512, 1, 0.6352941, 0, 1,
-1.203978, -0.2611252, -3.32822, 1, 0.6431373, 0, 1,
-1.194641, -2.350439, -3.405915, 1, 0.6470588, 0, 1,
-1.164953, 0.8875139, -2.958029, 1, 0.654902, 0, 1,
-1.161029, -1.254954, -2.523899, 1, 0.6588235, 0, 1,
-1.158633, 0.9964272, -1.158807, 1, 0.6666667, 0, 1,
-1.146554, 0.5008478, -1.701779, 1, 0.6705883, 0, 1,
-1.136407, -0.3862122, -1.262969, 1, 0.6784314, 0, 1,
-1.129219, 0.1550766, -1.84838, 1, 0.682353, 0, 1,
-1.12627, 0.2029171, -1.944589, 1, 0.6901961, 0, 1,
-1.118598, -0.2481126, -1.394885, 1, 0.6941177, 0, 1,
-1.116787, -0.6721119, -1.498087, 1, 0.7019608, 0, 1,
-1.11297, -0.5476669, -1.247838, 1, 0.7098039, 0, 1,
-1.101721, 1.079425, 0.7613351, 1, 0.7137255, 0, 1,
-1.097165, -1.137881, -1.131849, 1, 0.7215686, 0, 1,
-1.081982, 0.488915, -2.976914, 1, 0.7254902, 0, 1,
-1.079896, 1.159086, -0.2904637, 1, 0.7333333, 0, 1,
-1.078619, -1.81787, -2.453443, 1, 0.7372549, 0, 1,
-1.072365, 1.123729, -1.047239, 1, 0.7450981, 0, 1,
-1.071584, -2.17466, -3.360554, 1, 0.7490196, 0, 1,
-1.068373, 0.8985571, -2.536939, 1, 0.7568628, 0, 1,
-1.060034, 0.1846291, -0.7556049, 1, 0.7607843, 0, 1,
-1.059487, 0.2341265, -1.953363, 1, 0.7686275, 0, 1,
-1.051803, 0.5244866, -0.8108745, 1, 0.772549, 0, 1,
-1.048904, -1.177685, -1.386245, 1, 0.7803922, 0, 1,
-1.035808, -0.4032147, -1.813541, 1, 0.7843137, 0, 1,
-1.032638, -0.1910923, -3.342302, 1, 0.7921569, 0, 1,
-1.032227, 0.6724474, 0.2219041, 1, 0.7960784, 0, 1,
-1.031223, 2.33969, -0.7053091, 1, 0.8039216, 0, 1,
-1.02802, 0.1367429, -1.16224, 1, 0.8117647, 0, 1,
-1.022117, 1.068528, -0.8316339, 1, 0.8156863, 0, 1,
-1.0167, -1.467058, -3.529101, 1, 0.8235294, 0, 1,
-1.014401, -0.580808, -3.25886, 1, 0.827451, 0, 1,
-1.012432, -1.649127, -3.049502, 1, 0.8352941, 0, 1,
-1.006043, -0.7949921, -2.460036, 1, 0.8392157, 0, 1,
-0.9979095, 1.775589, -1.162839, 1, 0.8470588, 0, 1,
-0.996815, 0.5566182, -1.706612, 1, 0.8509804, 0, 1,
-0.996132, -1.857223, -3.628158, 1, 0.8588235, 0, 1,
-0.9951867, 1.059391, -1.294839, 1, 0.8627451, 0, 1,
-0.9834834, -0.7283828, -3.423055, 1, 0.8705882, 0, 1,
-0.9795033, 2.581889, -0.652759, 1, 0.8745098, 0, 1,
-0.9767313, -0.08536933, -0.86462, 1, 0.8823529, 0, 1,
-0.9727684, 0.9708026, -0.2277112, 1, 0.8862745, 0, 1,
-0.9671515, 0.3178963, -1.848688, 1, 0.8941177, 0, 1,
-0.9608347, -0.09326227, -1.262927, 1, 0.8980392, 0, 1,
-0.9446871, 0.4497268, 0.4600971, 1, 0.9058824, 0, 1,
-0.9444121, -0.06328382, -1.494604, 1, 0.9137255, 0, 1,
-0.9432075, 0.8030875, -1.11735, 1, 0.9176471, 0, 1,
-0.9352158, -0.1853994, -3.654853, 1, 0.9254902, 0, 1,
-0.9352032, -0.8860119, -0.5637962, 1, 0.9294118, 0, 1,
-0.9326538, -1.083663, -2.740021, 1, 0.9372549, 0, 1,
-0.9317305, 0.02247752, -1.562713, 1, 0.9411765, 0, 1,
-0.9280297, 0.3386717, -1.010405, 1, 0.9490196, 0, 1,
-0.9257507, -0.8120165, -0.8259066, 1, 0.9529412, 0, 1,
-0.9227437, -0.5230742, -2.613428, 1, 0.9607843, 0, 1,
-0.9224851, 0.691515, -1.027313, 1, 0.9647059, 0, 1,
-0.9215377, 0.06846942, -1.842775, 1, 0.972549, 0, 1,
-0.9122207, -0.3831342, -1.262926, 1, 0.9764706, 0, 1,
-0.9121048, 0.6773894, -0.8033053, 1, 0.9843137, 0, 1,
-0.9057492, 0.9105725, -0.8445468, 1, 0.9882353, 0, 1,
-0.8999462, -0.4167853, -3.204225, 1, 0.9960784, 0, 1,
-0.8983473, -1.005985, -2.625638, 0.9960784, 1, 0, 1,
-0.891561, 0.4559694, -2.3461, 0.9921569, 1, 0, 1,
-0.8887255, -2.608866, -2.243135, 0.9843137, 1, 0, 1,
-0.8874022, 1.348722, -0.6550076, 0.9803922, 1, 0, 1,
-0.8863973, 1.327119, -0.4563, 0.972549, 1, 0, 1,
-0.883553, 0.599798, -2.185951, 0.9686275, 1, 0, 1,
-0.8778286, -0.371556, -2.971904, 0.9607843, 1, 0, 1,
-0.8774748, 0.1510041, -3.684343, 0.9568627, 1, 0, 1,
-0.8754478, 0.5750616, 1.297256, 0.9490196, 1, 0, 1,
-0.870017, 0.467588, 1.323172, 0.945098, 1, 0, 1,
-0.8574893, -0.2843027, -0.4196756, 0.9372549, 1, 0, 1,
-0.8571877, 0.6458142, -2.419349, 0.9333333, 1, 0, 1,
-0.8564219, -0.3354894, -1.271125, 0.9254902, 1, 0, 1,
-0.8527047, 1.656813, -0.8200566, 0.9215686, 1, 0, 1,
-0.8462322, 0.8283135, -1.221957, 0.9137255, 1, 0, 1,
-0.8386995, 0.9762145, -2.429625, 0.9098039, 1, 0, 1,
-0.8368929, -0.8378559, -2.793501, 0.9019608, 1, 0, 1,
-0.8314404, 0.5728284, -0.1497165, 0.8941177, 1, 0, 1,
-0.8309205, -1.463984, -2.762589, 0.8901961, 1, 0, 1,
-0.8263968, -0.3392893, -1.069277, 0.8823529, 1, 0, 1,
-0.8245646, -0.5170628, -3.631061, 0.8784314, 1, 0, 1,
-0.8217967, -1.3635, -3.667995, 0.8705882, 1, 0, 1,
-0.8191981, 0.1889081, -1.917688, 0.8666667, 1, 0, 1,
-0.8191454, 0.7079841, -0.3951665, 0.8588235, 1, 0, 1,
-0.8127418, -0.2948391, -1.238453, 0.854902, 1, 0, 1,
-0.8121181, -0.2282412, -1.955274, 0.8470588, 1, 0, 1,
-0.8061902, -0.6540638, -1.936821, 0.8431373, 1, 0, 1,
-0.8012353, -0.0657554, -1.506631, 0.8352941, 1, 0, 1,
-0.7981969, -1.621647, -3.118833, 0.8313726, 1, 0, 1,
-0.7971899, 0.3061297, -2.346351, 0.8235294, 1, 0, 1,
-0.7953574, 1.050381, -2.168051, 0.8196079, 1, 0, 1,
-0.795302, -1.199433, -2.663815, 0.8117647, 1, 0, 1,
-0.7949119, 1.342445, -1.556607, 0.8078431, 1, 0, 1,
-0.7886645, -0.2781329, -2.694152, 0.8, 1, 0, 1,
-0.7883306, -1.085388, -2.554045, 0.7921569, 1, 0, 1,
-0.7860394, -0.3557515, -3.297158, 0.7882353, 1, 0, 1,
-0.7681191, 0.65398, -1.065525, 0.7803922, 1, 0, 1,
-0.7618606, 0.2240155, -2.457453, 0.7764706, 1, 0, 1,
-0.7592301, -0.7486306, -2.383963, 0.7686275, 1, 0, 1,
-0.7589871, -1.343922, -3.096677, 0.7647059, 1, 0, 1,
-0.7570357, -0.5787568, -1.944161, 0.7568628, 1, 0, 1,
-0.7560429, 0.6318526, -1.079703, 0.7529412, 1, 0, 1,
-0.7526191, -0.3532499, -1.600368, 0.7450981, 1, 0, 1,
-0.7455876, 0.01975241, -2.065208, 0.7411765, 1, 0, 1,
-0.742669, 0.9982573, -1.24052, 0.7333333, 1, 0, 1,
-0.7351168, 0.6609387, -1.700629, 0.7294118, 1, 0, 1,
-0.734364, 0.1120909, -2.842921, 0.7215686, 1, 0, 1,
-0.73413, -0.0493785, -0.7970391, 0.7176471, 1, 0, 1,
-0.7340378, -1.641774, -2.235262, 0.7098039, 1, 0, 1,
-0.7314605, -0.7558219, -2.763669, 0.7058824, 1, 0, 1,
-0.7314575, -0.4731842, 0.2300528, 0.6980392, 1, 0, 1,
-0.730721, 1.175202, 0.1454231, 0.6901961, 1, 0, 1,
-0.7304102, -0.03913921, -2.563305, 0.6862745, 1, 0, 1,
-0.7292052, -1.113374, -1.051722, 0.6784314, 1, 0, 1,
-0.7276402, -1.922557, -3.283546, 0.6745098, 1, 0, 1,
-0.7192457, -0.6049657, -0.7876196, 0.6666667, 1, 0, 1,
-0.7168927, 0.2376079, -0.9740543, 0.6627451, 1, 0, 1,
-0.7134031, -0.9550793, -3.287704, 0.654902, 1, 0, 1,
-0.7121102, -1.479014, -3.672233, 0.6509804, 1, 0, 1,
-0.7093577, -0.4210109, -1.801807, 0.6431373, 1, 0, 1,
-0.708387, -2.184195, -3.772424, 0.6392157, 1, 0, 1,
-0.7028878, -0.3127273, -0.8776925, 0.6313726, 1, 0, 1,
-0.6912134, -2.482594, -0.8034357, 0.627451, 1, 0, 1,
-0.6901825, -0.1388403, -1.699417, 0.6196079, 1, 0, 1,
-0.6874555, -0.05258717, -1.38998, 0.6156863, 1, 0, 1,
-0.6866944, -1.377445, -2.110159, 0.6078432, 1, 0, 1,
-0.6841705, -0.5758947, -2.262534, 0.6039216, 1, 0, 1,
-0.6810716, 0.8864791, -1.018495, 0.5960785, 1, 0, 1,
-0.6678209, 0.723709, -1.109545, 0.5882353, 1, 0, 1,
-0.6648468, 0.444551, -2.679069, 0.5843138, 1, 0, 1,
-0.6629019, -0.5262011, -3.601762, 0.5764706, 1, 0, 1,
-0.6610771, -1.186685, -1.792325, 0.572549, 1, 0, 1,
-0.6573695, 0.9345579, -0.2845852, 0.5647059, 1, 0, 1,
-0.6559426, -0.1852368, -3.087988, 0.5607843, 1, 0, 1,
-0.6471738, 0.6210986, -1.168261, 0.5529412, 1, 0, 1,
-0.6458451, 0.6792313, -0.4976433, 0.5490196, 1, 0, 1,
-0.6431183, -0.3419941, -3.379992, 0.5411765, 1, 0, 1,
-0.6419809, 0.2837272, -1.908257, 0.5372549, 1, 0, 1,
-0.6405444, 0.4393179, -2.415209, 0.5294118, 1, 0, 1,
-0.6375407, -0.2147546, -2.426832, 0.5254902, 1, 0, 1,
-0.6375268, 0.4953441, -1.141026, 0.5176471, 1, 0, 1,
-0.6209875, -1.343065, -1.504471, 0.5137255, 1, 0, 1,
-0.6150065, 0.7203138, -0.4105657, 0.5058824, 1, 0, 1,
-0.6066529, -0.7870466, -0.9433553, 0.5019608, 1, 0, 1,
-0.6036406, -0.6600599, -4.155048, 0.4941176, 1, 0, 1,
-0.6011418, -1.187092, -3.756604, 0.4862745, 1, 0, 1,
-0.5961419, -0.5167062, -2.203827, 0.4823529, 1, 0, 1,
-0.5942847, 0.7390574, -1.85995, 0.4745098, 1, 0, 1,
-0.5927876, 1.46223, -0.2323021, 0.4705882, 1, 0, 1,
-0.5926567, -1.724428, -2.86104, 0.4627451, 1, 0, 1,
-0.5910198, 0.8579238, -0.9367924, 0.4588235, 1, 0, 1,
-0.5889427, 1.129979, -1.584794, 0.4509804, 1, 0, 1,
-0.5786548, 0.6531262, -1.010129, 0.4470588, 1, 0, 1,
-0.5777882, 1.574456, -0.6365206, 0.4392157, 1, 0, 1,
-0.577785, -1.258603, -1.958116, 0.4352941, 1, 0, 1,
-0.5773233, -1.928434, -1.910816, 0.427451, 1, 0, 1,
-0.5771394, -0.7250006, -2.348567, 0.4235294, 1, 0, 1,
-0.575237, 0.607275, -0.1764368, 0.4156863, 1, 0, 1,
-0.5741604, -0.6499017, -2.260257, 0.4117647, 1, 0, 1,
-0.5740285, -0.4076095, -3.462123, 0.4039216, 1, 0, 1,
-0.5732842, -0.7194197, -4.06205, 0.3960784, 1, 0, 1,
-0.5728783, -0.07696114, -2.652427, 0.3921569, 1, 0, 1,
-0.5702924, 0.7570415, 1.718118, 0.3843137, 1, 0, 1,
-0.5647866, 0.4108013, -0.7115023, 0.3803922, 1, 0, 1,
-0.5598601, 0.4345303, -0.377947, 0.372549, 1, 0, 1,
-0.5587057, -1.048979, -3.097597, 0.3686275, 1, 0, 1,
-0.5570211, -0.3962645, -3.40304, 0.3607843, 1, 0, 1,
-0.5481943, -0.6032739, -2.250374, 0.3568628, 1, 0, 1,
-0.5460726, 1.359533, 1.155755, 0.3490196, 1, 0, 1,
-0.5456299, -1.071532, -3.666176, 0.345098, 1, 0, 1,
-0.5455623, -1.177353, -2.834018, 0.3372549, 1, 0, 1,
-0.5398185, 1.124649, -1.307861, 0.3333333, 1, 0, 1,
-0.5395962, -1.227794, -3.7245, 0.3254902, 1, 0, 1,
-0.5384688, -1.832851, -2.702364, 0.3215686, 1, 0, 1,
-0.5314628, 1.614865, 0.3764442, 0.3137255, 1, 0, 1,
-0.529849, 1.099147, -0.3235836, 0.3098039, 1, 0, 1,
-0.5296904, -1.031724, -2.225161, 0.3019608, 1, 0, 1,
-0.5233393, 0.09663532, -1.238386, 0.2941177, 1, 0, 1,
-0.5204404, 0.1450055, -0.8104679, 0.2901961, 1, 0, 1,
-0.5196553, 0.5908187, -1.704934, 0.282353, 1, 0, 1,
-0.5185437, 0.6559919, -0.6389012, 0.2784314, 1, 0, 1,
-0.5179864, 1.066389, 1.358164, 0.2705882, 1, 0, 1,
-0.5163308, 0.2417229, -2.262853, 0.2666667, 1, 0, 1,
-0.5100909, -0.4186541, -2.998948, 0.2588235, 1, 0, 1,
-0.5078739, -0.02172111, -2.32954, 0.254902, 1, 0, 1,
-0.4974772, -0.3854074, -2.269787, 0.2470588, 1, 0, 1,
-0.4973424, 0.2743137, -1.050159, 0.2431373, 1, 0, 1,
-0.4938374, 1.384435, 0.5830999, 0.2352941, 1, 0, 1,
-0.4909557, -1.332501, -4.005524, 0.2313726, 1, 0, 1,
-0.4908332, 1.146546, -0.09008757, 0.2235294, 1, 0, 1,
-0.4858299, -0.6071404, -2.687377, 0.2196078, 1, 0, 1,
-0.4837693, -1.603664, -3.531827, 0.2117647, 1, 0, 1,
-0.4826651, 1.067276, -0.1554057, 0.2078431, 1, 0, 1,
-0.4798714, 0.6265607, 0.7295246, 0.2, 1, 0, 1,
-0.4775541, 1.841306, 1.141474, 0.1921569, 1, 0, 1,
-0.4690135, 1.5177, 1.21352, 0.1882353, 1, 0, 1,
-0.4672119, -0.9565987, -3.248854, 0.1803922, 1, 0, 1,
-0.4661886, 0.5054889, -0.7568437, 0.1764706, 1, 0, 1,
-0.4596593, -0.7967284, -0.3822656, 0.1686275, 1, 0, 1,
-0.4589307, -2.064326, -2.612029, 0.1647059, 1, 0, 1,
-0.4586067, -0.5924877, -1.628094, 0.1568628, 1, 0, 1,
-0.4569757, 0.2777288, -1.968037, 0.1529412, 1, 0, 1,
-0.4566665, -0.7998639, -4.475318, 0.145098, 1, 0, 1,
-0.455103, 0.2348959, -1.875546, 0.1411765, 1, 0, 1,
-0.454406, 0.1684959, -0.3031375, 0.1333333, 1, 0, 1,
-0.4537475, 0.004615565, 0.9177693, 0.1294118, 1, 0, 1,
-0.45249, -0.5358998, -3.636837, 0.1215686, 1, 0, 1,
-0.4514127, 0.8158285, -0.3195459, 0.1176471, 1, 0, 1,
-0.4466478, 0.1278081, -0.9395133, 0.1098039, 1, 0, 1,
-0.4450424, 0.07615817, -1.254456, 0.1058824, 1, 0, 1,
-0.4432548, 0.01779491, -0.6270289, 0.09803922, 1, 0, 1,
-0.4419954, 1.150738, -0.4275722, 0.09019608, 1, 0, 1,
-0.4382336, -0.5203447, -1.836242, 0.08627451, 1, 0, 1,
-0.433931, -0.2289369, -1.430654, 0.07843138, 1, 0, 1,
-0.4330297, 1.318819, 0.6870916, 0.07450981, 1, 0, 1,
-0.428041, 0.2931924, 1.686802, 0.06666667, 1, 0, 1,
-0.4265677, -0.4054906, 0.1754014, 0.0627451, 1, 0, 1,
-0.4230828, -0.03496242, -2.073042, 0.05490196, 1, 0, 1,
-0.4210601, -0.7220851, -1.80758, 0.05098039, 1, 0, 1,
-0.4192821, 0.1504692, -1.436924, 0.04313726, 1, 0, 1,
-0.4188598, -0.6250091, -3.544413, 0.03921569, 1, 0, 1,
-0.4167497, -0.01264632, -1.147396, 0.03137255, 1, 0, 1,
-0.4151668, -0.3581836, -2.825088, 0.02745098, 1, 0, 1,
-0.4081287, 0.4518038, -1.578019, 0.01960784, 1, 0, 1,
-0.4050163, -0.2129193, -3.144329, 0.01568628, 1, 0, 1,
-0.4033639, 0.603765, 1.150731, 0.007843138, 1, 0, 1,
-0.4020703, -0.4915566, -1.345461, 0.003921569, 1, 0, 1,
-0.4010318, -0.05275306, -2.283514, 0, 1, 0.003921569, 1,
-0.3967846, -1.044207, -1.423595, 0, 1, 0.01176471, 1,
-0.3946942, 0.7613804, -0.1571058, 0, 1, 0.01568628, 1,
-0.391881, -0.3038569, -2.214556, 0, 1, 0.02352941, 1,
-0.3898214, -1.291916, -2.774996, 0, 1, 0.02745098, 1,
-0.3893979, 0.3566092, 0.199994, 0, 1, 0.03529412, 1,
-0.3888083, -1.485635, -2.662764, 0, 1, 0.03921569, 1,
-0.3859608, -0.6030868, -3.396198, 0, 1, 0.04705882, 1,
-0.3828226, 1.055411, 0.2008458, 0, 1, 0.05098039, 1,
-0.3811609, -0.5812279, -3.700384, 0, 1, 0.05882353, 1,
-0.3772526, 0.906812, -2.123755, 0, 1, 0.0627451, 1,
-0.3726217, -0.5758656, -3.209469, 0, 1, 0.07058824, 1,
-0.37078, 0.94001, -1.208696, 0, 1, 0.07450981, 1,
-0.3707307, -0.5054463, -1.969559, 0, 1, 0.08235294, 1,
-0.3659856, -0.8900893, -2.544083, 0, 1, 0.08627451, 1,
-0.3654242, 0.3198624, -0.4113762, 0, 1, 0.09411765, 1,
-0.3649128, -0.4454476, -1.122829, 0, 1, 0.1019608, 1,
-0.3592307, 1.280825, -1.973308, 0, 1, 0.1058824, 1,
-0.3537778, -0.4537192, -2.755772, 0, 1, 0.1137255, 1,
-0.3530568, -0.7470727, -2.557778, 0, 1, 0.1176471, 1,
-0.3525093, -0.5534609, -3.266071, 0, 1, 0.1254902, 1,
-0.3488219, -0.437405, -2.03416, 0, 1, 0.1294118, 1,
-0.346693, -0.05059859, -1.973543, 0, 1, 0.1372549, 1,
-0.3457968, 0.5659204, -0.4422844, 0, 1, 0.1411765, 1,
-0.3454398, 0.6067851, 0.2987373, 0, 1, 0.1490196, 1,
-0.3423289, 0.3282875, -1.083912, 0, 1, 0.1529412, 1,
-0.339126, 0.3290189, -0.06159611, 0, 1, 0.1607843, 1,
-0.3388024, 1.463365, -0.2210719, 0, 1, 0.1647059, 1,
-0.3365271, 1.260726, 0.6085547, 0, 1, 0.172549, 1,
-0.3358566, -0.4066494, -3.246929, 0, 1, 0.1764706, 1,
-0.3319131, 1.212734, -0.9559175, 0, 1, 0.1843137, 1,
-0.3271459, -0.8168045, -4.489107, 0, 1, 0.1882353, 1,
-0.3257197, 1.025712, 0.8886921, 0, 1, 0.1960784, 1,
-0.3235407, 0.4100576, -2.541345, 0, 1, 0.2039216, 1,
-0.3174201, -1.015199, -3.260515, 0, 1, 0.2078431, 1,
-0.3086764, -0.3179961, -2.827883, 0, 1, 0.2156863, 1,
-0.2998544, -0.01795248, -2.048356, 0, 1, 0.2196078, 1,
-0.2957521, -0.8593599, -3.357728, 0, 1, 0.227451, 1,
-0.2915369, -2.351356, -3.996066, 0, 1, 0.2313726, 1,
-0.2884734, -0.02902892, -2.209281, 0, 1, 0.2392157, 1,
-0.2867686, -0.4271365, -2.043855, 0, 1, 0.2431373, 1,
-0.2852081, -1.426738, -4.749465, 0, 1, 0.2509804, 1,
-0.2804916, 1.236255, 0.07451447, 0, 1, 0.254902, 1,
-0.2689368, 0.6716563, -2.735361, 0, 1, 0.2627451, 1,
-0.2685251, 1.145044, -0.7594879, 0, 1, 0.2666667, 1,
-0.2678053, 0.9301107, 0.3707984, 0, 1, 0.2745098, 1,
-0.2665193, 1.877312, -1.083461, 0, 1, 0.2784314, 1,
-0.2635338, 1.012755, -0.2452689, 0, 1, 0.2862745, 1,
-0.2557471, 1.970981, -0.5062919, 0, 1, 0.2901961, 1,
-0.253108, 0.8276457, -1.510496, 0, 1, 0.2980392, 1,
-0.2496307, -0.1197385, -2.814102, 0, 1, 0.3058824, 1,
-0.2484194, 0.7139741, -0.5913057, 0, 1, 0.3098039, 1,
-0.2480561, -0.3720177, -1.942902, 0, 1, 0.3176471, 1,
-0.2404336, -0.2851091, -2.196816, 0, 1, 0.3215686, 1,
-0.2379729, -0.7401994, -1.486763, 0, 1, 0.3294118, 1,
-0.2359704, -0.5990568, -4.075108, 0, 1, 0.3333333, 1,
-0.2339084, 0.4039958, -0.8936022, 0, 1, 0.3411765, 1,
-0.2337677, 2.013154, -0.2358936, 0, 1, 0.345098, 1,
-0.2315848, -0.8599021, -3.49598, 0, 1, 0.3529412, 1,
-0.2314484, 0.4329159, -1.734149, 0, 1, 0.3568628, 1,
-0.2207623, -0.6490045, -2.566398, 0, 1, 0.3647059, 1,
-0.2197093, 1.055011, -1.296393, 0, 1, 0.3686275, 1,
-0.2194384, 1.063433, -0.2019268, 0, 1, 0.3764706, 1,
-0.21918, -0.6584707, -3.974482, 0, 1, 0.3803922, 1,
-0.2171496, 0.4073314, -0.2500516, 0, 1, 0.3882353, 1,
-0.2148455, -0.6219491, -3.470174, 0, 1, 0.3921569, 1,
-0.2131812, 1.577937, -1.393968, 0, 1, 0.4, 1,
-0.2026951, 0.7915691, -0.3281268, 0, 1, 0.4078431, 1,
-0.197695, 2.057733, -0.2461816, 0, 1, 0.4117647, 1,
-0.1974867, 0.8141008, -0.543039, 0, 1, 0.4196078, 1,
-0.1940518, 0.02057907, -1.529864, 0, 1, 0.4235294, 1,
-0.1914106, 0.3765271, 0.2137195, 0, 1, 0.4313726, 1,
-0.188751, -1.022722, -1.101047, 0, 1, 0.4352941, 1,
-0.1835186, -0.8131437, -3.908887, 0, 1, 0.4431373, 1,
-0.1825009, 2.02538, 0.1720184, 0, 1, 0.4470588, 1,
-0.1803941, 0.4591224, -1.581675, 0, 1, 0.454902, 1,
-0.1793635, -0.8907903, -2.240243, 0, 1, 0.4588235, 1,
-0.1775547, -0.2798255, -4.05177, 0, 1, 0.4666667, 1,
-0.1753992, 1.906433, -1.089734, 0, 1, 0.4705882, 1,
-0.1724139, 1.231468, -0.1047837, 0, 1, 0.4784314, 1,
-0.1693565, 1.517694, 0.9387337, 0, 1, 0.4823529, 1,
-0.169074, -0.05233515, -2.395812, 0, 1, 0.4901961, 1,
-0.1675555, 0.1699571, -1.95695, 0, 1, 0.4941176, 1,
-0.1634663, 1.922001, -1.649704, 0, 1, 0.5019608, 1,
-0.162443, -0.3233725, -2.277684, 0, 1, 0.509804, 1,
-0.1609195, -0.5929726, -4.278867, 0, 1, 0.5137255, 1,
-0.1582718, -1.141051, -2.993669, 0, 1, 0.5215687, 1,
-0.1581795, -1.325191, -2.402388, 0, 1, 0.5254902, 1,
-0.1562385, -0.8708485, -0.9132433, 0, 1, 0.5333334, 1,
-0.1559084, 0.3256421, -1.523106, 0, 1, 0.5372549, 1,
-0.1555658, -0.5259876, -1.376336, 0, 1, 0.5450981, 1,
-0.1554183, -0.8859997, -2.460403, 0, 1, 0.5490196, 1,
-0.1486451, 0.9465299, -1.477785, 0, 1, 0.5568628, 1,
-0.1480362, -1.835776, -2.240235, 0, 1, 0.5607843, 1,
-0.1478241, -0.6119109, -4.197797, 0, 1, 0.5686275, 1,
-0.1458323, 1.814948, -0.4427811, 0, 1, 0.572549, 1,
-0.1456398, -0.09460893, 0.4445493, 0, 1, 0.5803922, 1,
-0.1450893, -0.2395639, -0.1903054, 0, 1, 0.5843138, 1,
-0.1449769, -0.0190289, -2.088127, 0, 1, 0.5921569, 1,
-0.144122, 0.9327686, -0.4247445, 0, 1, 0.5960785, 1,
-0.1413275, 1.455493, -0.4837111, 0, 1, 0.6039216, 1,
-0.1387554, 0.9963065, -0.7299135, 0, 1, 0.6117647, 1,
-0.1379566, -0.9587422, -1.511893, 0, 1, 0.6156863, 1,
-0.1351726, -2.185745, -3.494113, 0, 1, 0.6235294, 1,
-0.1349398, -0.6330399, -2.917998, 0, 1, 0.627451, 1,
-0.1341708, -0.5069253, -2.658352, 0, 1, 0.6352941, 1,
-0.1339268, 0.1984224, -0.9792433, 0, 1, 0.6392157, 1,
-0.1308451, -1.864663, -5.788801, 0, 1, 0.6470588, 1,
-0.1306038, -1.642886, -4.751017, 0, 1, 0.6509804, 1,
-0.1270634, -0.2615379, -4.944055, 0, 1, 0.6588235, 1,
-0.1263104, -0.7260033, -3.353261, 0, 1, 0.6627451, 1,
-0.1238251, -0.8387359, -3.067994, 0, 1, 0.6705883, 1,
-0.1232191, 0.4275057, -1.255306, 0, 1, 0.6745098, 1,
-0.1212416, -0.02610881, -2.795904, 0, 1, 0.682353, 1,
-0.1198575, -0.06866084, -3.087108, 0, 1, 0.6862745, 1,
-0.119526, -1.276969, -3.987503, 0, 1, 0.6941177, 1,
-0.1134779, -0.2813909, -1.751576, 0, 1, 0.7019608, 1,
-0.1126795, 1.334969, -0.7808967, 0, 1, 0.7058824, 1,
-0.1085025, -2.421268, -1.508509, 0, 1, 0.7137255, 1,
-0.1068986, -1.070463, -1.808917, 0, 1, 0.7176471, 1,
-0.1052739, 0.590382, 0.2816181, 0, 1, 0.7254902, 1,
-0.1033714, -2.181912, -2.187146, 0, 1, 0.7294118, 1,
-0.1010176, 0.4938515, 0.4349589, 0, 1, 0.7372549, 1,
-0.09924331, 0.4238807, 1.283343, 0, 1, 0.7411765, 1,
-0.09910633, 1.406529, 0.8741274, 0, 1, 0.7490196, 1,
-0.09403214, -1.351779, -3.005038, 0, 1, 0.7529412, 1,
-0.09270265, 0.6223513, -1.331461, 0, 1, 0.7607843, 1,
-0.09265395, 0.841727, -0.6913427, 0, 1, 0.7647059, 1,
-0.09157369, -2.508757, -3.595786, 0, 1, 0.772549, 1,
-0.09099838, 1.170978, 1.298846, 0, 1, 0.7764706, 1,
-0.09058493, -1.394441, -2.122393, 0, 1, 0.7843137, 1,
-0.08890872, -0.1143172, -2.45826, 0, 1, 0.7882353, 1,
-0.08793977, 0.4514658, 1.199567, 0, 1, 0.7960784, 1,
-0.08711379, -0.2329067, -4.083161, 0, 1, 0.8039216, 1,
-0.08652422, 0.3344205, -0.4246807, 0, 1, 0.8078431, 1,
-0.085086, 1.501474, -0.2683786, 0, 1, 0.8156863, 1,
-0.07918758, -0.1165499, -2.136691, 0, 1, 0.8196079, 1,
-0.07559498, 0.5222778, -0.5086825, 0, 1, 0.827451, 1,
-0.07548091, 1.691034, -0.4612971, 0, 1, 0.8313726, 1,
-0.07073806, -0.6326995, -2.811337, 0, 1, 0.8392157, 1,
-0.06963287, 0.5798636, -0.7990421, 0, 1, 0.8431373, 1,
-0.06746999, 1.224427, 0.6520778, 0, 1, 0.8509804, 1,
-0.06623052, 1.518705, 0.1435272, 0, 1, 0.854902, 1,
-0.06493238, 1.07909, -0.149342, 0, 1, 0.8627451, 1,
-0.06388345, -0.1803734, -3.536213, 0, 1, 0.8666667, 1,
-0.06210532, -0.3881396, -2.262133, 0, 1, 0.8745098, 1,
-0.06155374, 0.8023219, -0.1654224, 0, 1, 0.8784314, 1,
-0.06056292, 0.6841976, -2.391599, 0, 1, 0.8862745, 1,
-0.04382226, 0.9363732, 0.1059583, 0, 1, 0.8901961, 1,
-0.04293275, 0.3613813, 0.4113765, 0, 1, 0.8980392, 1,
-0.04075954, -0.8020417, -5.217596, 0, 1, 0.9058824, 1,
-0.03932256, 1.162847, -1.956183, 0, 1, 0.9098039, 1,
-0.03706191, -0.1258487, -2.566272, 0, 1, 0.9176471, 1,
-0.02956606, 0.7133837, -0.847393, 0, 1, 0.9215686, 1,
-0.0285801, -1.10108, -4.232933, 0, 1, 0.9294118, 1,
-0.0229274, -2.00252, -2.320822, 0, 1, 0.9333333, 1,
-0.02130978, -0.8571631, -2.298276, 0, 1, 0.9411765, 1,
-0.02019623, 0.4661836, -0.07489935, 0, 1, 0.945098, 1,
-0.01953241, 1.005588, -2.674126, 0, 1, 0.9529412, 1,
-0.01880534, 0.2647125, -0.4506856, 0, 1, 0.9568627, 1,
-0.01464074, -1.747466, -3.059884, 0, 1, 0.9647059, 1,
-0.01136761, 0.06614263, 0.6796689, 0, 1, 0.9686275, 1,
-0.009325996, 2.727019, 0.3209087, 0, 1, 0.9764706, 1,
-0.008041769, -0.2111094, -2.830797, 0, 1, 0.9803922, 1,
-0.007651097, 2.261412, 1.027818, 0, 1, 0.9882353, 1,
-0.005891224, -0.3573289, -2.134477, 0, 1, 0.9921569, 1,
-0.004997396, -0.1789346, -2.861876, 0, 1, 1, 1,
0.001157995, -0.05363925, 4.76415, 0, 0.9921569, 1, 1,
0.001746521, -0.7172927, 2.037938, 0, 0.9882353, 1, 1,
0.006854028, -0.07248116, 2.791388, 0, 0.9803922, 1, 1,
0.007699194, -0.5272536, 2.667736, 0, 0.9764706, 1, 1,
0.01125875, -1.131555, 2.688702, 0, 0.9686275, 1, 1,
0.01480922, -0.6282479, 2.620429, 0, 0.9647059, 1, 1,
0.01654073, -1.492404, 2.088324, 0, 0.9568627, 1, 1,
0.01655665, 1.883942, 0.07220004, 0, 0.9529412, 1, 1,
0.02006373, -3.038013, 0.9419098, 0, 0.945098, 1, 1,
0.02041045, -0.2526153, 2.180012, 0, 0.9411765, 1, 1,
0.0259312, 0.3942908, 2.354787, 0, 0.9333333, 1, 1,
0.02934169, -0.5047003, 3.153798, 0, 0.9294118, 1, 1,
0.03067842, 0.1819669, -0.4756398, 0, 0.9215686, 1, 1,
0.03072071, 0.6041251, -1.006675, 0, 0.9176471, 1, 1,
0.03176669, 1.953141, -0.6996508, 0, 0.9098039, 1, 1,
0.03310742, 1.084187, -0.6483934, 0, 0.9058824, 1, 1,
0.03365717, 0.4504565, -0.7025105, 0, 0.8980392, 1, 1,
0.04013032, -1.265339, 4.066953, 0, 0.8901961, 1, 1,
0.0429597, 0.06975146, 0.7301069, 0, 0.8862745, 1, 1,
0.04337715, 1.219424, -0.9516693, 0, 0.8784314, 1, 1,
0.05022666, 0.05752157, 2.253191, 0, 0.8745098, 1, 1,
0.05317869, 0.7276692, 0.9113981, 0, 0.8666667, 1, 1,
0.05698203, -0.6168686, 2.945721, 0, 0.8627451, 1, 1,
0.07656468, 0.3876378, 2.369299, 0, 0.854902, 1, 1,
0.08260279, -0.2609976, 2.485379, 0, 0.8509804, 1, 1,
0.08566504, -1.019762, 3.770581, 0, 0.8431373, 1, 1,
0.08831283, 0.3493598, 0.02685072, 0, 0.8392157, 1, 1,
0.08928335, 1.145972, 1.076254, 0, 0.8313726, 1, 1,
0.09289971, 0.6563668, -0.6196451, 0, 0.827451, 1, 1,
0.09426678, 1.127654, 1.637227, 0, 0.8196079, 1, 1,
0.09452943, 0.7656516, -0.5370586, 0, 0.8156863, 1, 1,
0.1021747, -0.0605859, 3.666764, 0, 0.8078431, 1, 1,
0.1041772, 1.509477, -0.3276881, 0, 0.8039216, 1, 1,
0.1048711, -2.001174, 2.655465, 0, 0.7960784, 1, 1,
0.1057198, -1.92462, 4.437303, 0, 0.7882353, 1, 1,
0.1071998, -0.3208107, 1.59657, 0, 0.7843137, 1, 1,
0.1080118, -0.1280067, 3.59288, 0, 0.7764706, 1, 1,
0.1159596, 0.5465456, 0.3933663, 0, 0.772549, 1, 1,
0.1278704, 0.5797485, 0.2165376, 0, 0.7647059, 1, 1,
0.1287979, 0.44132, 0.1239949, 0, 0.7607843, 1, 1,
0.1303701, 0.06469256, 1.448228, 0, 0.7529412, 1, 1,
0.132069, 1.64572, -0.7821727, 0, 0.7490196, 1, 1,
0.1338016, -0.9141381, 4.09118, 0, 0.7411765, 1, 1,
0.1353536, -0.9448268, 2.629282, 0, 0.7372549, 1, 1,
0.1355522, 0.3158065, -0.09807547, 0, 0.7294118, 1, 1,
0.1447413, 0.91977, -1.182989, 0, 0.7254902, 1, 1,
0.1461489, 0.0003477357, 0.8422197, 0, 0.7176471, 1, 1,
0.1489409, 1.080744, 1.705671, 0, 0.7137255, 1, 1,
0.1493083, -0.1474958, 3.164577, 0, 0.7058824, 1, 1,
0.1508493, 0.70161, 0.864281, 0, 0.6980392, 1, 1,
0.1518987, -2.054487, 4.393314, 0, 0.6941177, 1, 1,
0.1519494, 1.626034, -0.3651961, 0, 0.6862745, 1, 1,
0.1525455, 1.061224, 1.136629, 0, 0.682353, 1, 1,
0.1533615, 0.2937954, -0.3796237, 0, 0.6745098, 1, 1,
0.1543676, -0.2632755, 2.543071, 0, 0.6705883, 1, 1,
0.1558774, 1.232094, 0.45146, 0, 0.6627451, 1, 1,
0.1627022, 1.855771, 0.3365029, 0, 0.6588235, 1, 1,
0.1628711, -0.2603327, 3.834548, 0, 0.6509804, 1, 1,
0.1631128, 0.0963941, -1.090058, 0, 0.6470588, 1, 1,
0.1678205, -0.3558385, 2.209373, 0, 0.6392157, 1, 1,
0.1699976, -2.775959, 2.08814, 0, 0.6352941, 1, 1,
0.1704686, 0.9820676, -0.6582644, 0, 0.627451, 1, 1,
0.1743261, -0.3995239, 2.424215, 0, 0.6235294, 1, 1,
0.1777554, -0.9663314, 3.684163, 0, 0.6156863, 1, 1,
0.1779644, 0.7522479, 0.4969849, 0, 0.6117647, 1, 1,
0.1779684, 0.08834346, 1.389995, 0, 0.6039216, 1, 1,
0.1787814, -1.00011, 3.702486, 0, 0.5960785, 1, 1,
0.1797315, 0.2218121, 0.5064166, 0, 0.5921569, 1, 1,
0.1861978, 0.1952346, 0.1816339, 0, 0.5843138, 1, 1,
0.1866552, 1.117193, -0.6047394, 0, 0.5803922, 1, 1,
0.1904481, 1.387739, -1.171775, 0, 0.572549, 1, 1,
0.1922922, 1.13688, 0.7674357, 0, 0.5686275, 1, 1,
0.193553, -1.827996, 2.39842, 0, 0.5607843, 1, 1,
0.1983123, -0.7867022, 2.496976, 0, 0.5568628, 1, 1,
0.2025144, -1.363671, 1.156346, 0, 0.5490196, 1, 1,
0.2037645, 0.1676669, 0.6765831, 0, 0.5450981, 1, 1,
0.2052685, -1.062016, 1.691705, 0, 0.5372549, 1, 1,
0.2077271, 0.293777, -0.6739749, 0, 0.5333334, 1, 1,
0.2093728, -0.3102161, 1.576131, 0, 0.5254902, 1, 1,
0.2105827, 0.3128164, 0.5883977, 0, 0.5215687, 1, 1,
0.2125341, -0.4145918, 2.900586, 0, 0.5137255, 1, 1,
0.2125343, 2.829106, -0.7540023, 0, 0.509804, 1, 1,
0.2166432, -0.6524245, 3.286486, 0, 0.5019608, 1, 1,
0.2193145, 0.09897501, -1.014923, 0, 0.4941176, 1, 1,
0.2206801, -0.5242339, 0.5178512, 0, 0.4901961, 1, 1,
0.2314056, -1.209292, 3.168342, 0, 0.4823529, 1, 1,
0.2317945, 0.3543785, 0.7984994, 0, 0.4784314, 1, 1,
0.2323144, 0.5308881, -0.008100436, 0, 0.4705882, 1, 1,
0.2332014, -0.6411552, 2.61789, 0, 0.4666667, 1, 1,
0.2343343, -1.85109, 4.854929, 0, 0.4588235, 1, 1,
0.2357214, -0.8550859, 1.246567, 0, 0.454902, 1, 1,
0.2361747, -0.9671094, 3.01239, 0, 0.4470588, 1, 1,
0.2410286, -2.018757, 4.530124, 0, 0.4431373, 1, 1,
0.2456533, 0.02488165, 2.885921, 0, 0.4352941, 1, 1,
0.2485277, -1.727204, 3.246805, 0, 0.4313726, 1, 1,
0.2522819, 1.946991, -0.7507651, 0, 0.4235294, 1, 1,
0.2523139, -1.708975, 3.242956, 0, 0.4196078, 1, 1,
0.2525639, 0.3408386, 0.8240211, 0, 0.4117647, 1, 1,
0.2531138, 1.487922, 0.2149082, 0, 0.4078431, 1, 1,
0.2565095, -0.3934402, 2.515627, 0, 0.4, 1, 1,
0.2654942, -0.4610264, 1.052385, 0, 0.3921569, 1, 1,
0.2655098, 1.009586, 0.6265938, 0, 0.3882353, 1, 1,
0.2658268, -0.4449673, 1.977325, 0, 0.3803922, 1, 1,
0.2671432, -0.5687701, 3.317191, 0, 0.3764706, 1, 1,
0.2704041, 0.1711106, 0.9833289, 0, 0.3686275, 1, 1,
0.27422, -0.1572628, 2.391242, 0, 0.3647059, 1, 1,
0.2796664, -2.689084, 3.104289, 0, 0.3568628, 1, 1,
0.2821175, -0.7923652, 3.740075, 0, 0.3529412, 1, 1,
0.282894, 0.3074468, 0.9674089, 0, 0.345098, 1, 1,
0.2837492, -0.3469652, 1.497503, 0, 0.3411765, 1, 1,
0.2841979, -2.129548, 3.963043, 0, 0.3333333, 1, 1,
0.2882596, 1.331809, -0.8356254, 0, 0.3294118, 1, 1,
0.2902808, 1.802592, -0.9007782, 0, 0.3215686, 1, 1,
0.2903239, -0.7151136, 4.096865, 0, 0.3176471, 1, 1,
0.2906023, -0.1767384, 0.610872, 0, 0.3098039, 1, 1,
0.2920018, 0.30656, -0.5623633, 0, 0.3058824, 1, 1,
0.2935883, -2.107961, 3.452191, 0, 0.2980392, 1, 1,
0.2937188, 0.6450482, -0.268767, 0, 0.2901961, 1, 1,
0.3008157, -0.8463379, 2.503712, 0, 0.2862745, 1, 1,
0.3009292, -0.2749324, 3.672661, 0, 0.2784314, 1, 1,
0.3044114, -1.45603, 3.825611, 0, 0.2745098, 1, 1,
0.3048775, 0.6939369, -0.5684673, 0, 0.2666667, 1, 1,
0.3079097, -0.5238603, 1.718009, 0, 0.2627451, 1, 1,
0.3083414, -1.048504, 1.545181, 0, 0.254902, 1, 1,
0.3085038, -1.143072, 3.28604, 0, 0.2509804, 1, 1,
0.3086589, 0.3566536, 1.226157, 0, 0.2431373, 1, 1,
0.31139, -0.8325939, 2.813888, 0, 0.2392157, 1, 1,
0.3118359, 1.505558, 1.364504, 0, 0.2313726, 1, 1,
0.3122247, -1.439524, 3.526445, 0, 0.227451, 1, 1,
0.318808, -1.123537, 2.695876, 0, 0.2196078, 1, 1,
0.3238864, 0.03871711, 2.312015, 0, 0.2156863, 1, 1,
0.3244047, -1.667794, 2.623357, 0, 0.2078431, 1, 1,
0.3260564, 0.02833731, 3.384839, 0, 0.2039216, 1, 1,
0.3268797, -0.04223204, 1.428997, 0, 0.1960784, 1, 1,
0.3298298, -0.5646272, 0.587664, 0, 0.1882353, 1, 1,
0.3348911, -0.1873218, 1.310092, 0, 0.1843137, 1, 1,
0.3446606, 1.439202, 1.328471, 0, 0.1764706, 1, 1,
0.344851, -0.6413223, 2.866055, 0, 0.172549, 1, 1,
0.3561871, -0.6100101, 2.13195, 0, 0.1647059, 1, 1,
0.3566477, 1.191718, -0.9516109, 0, 0.1607843, 1, 1,
0.3592092, 1.579435, 0.7576043, 0, 0.1529412, 1, 1,
0.3598342, -0.86583, 1.894567, 0, 0.1490196, 1, 1,
0.3604168, 1.068284, 1.090851, 0, 0.1411765, 1, 1,
0.3713821, 0.6685459, -0.1378348, 0, 0.1372549, 1, 1,
0.3744609, 1.361485, -2.089858, 0, 0.1294118, 1, 1,
0.3758984, 0.01973644, 1.142507, 0, 0.1254902, 1, 1,
0.381255, -0.902256, 2.692776, 0, 0.1176471, 1, 1,
0.3835801, 1.00244, 1.425644, 0, 0.1137255, 1, 1,
0.3842809, -0.03730487, 0.3453645, 0, 0.1058824, 1, 1,
0.3844917, -0.07581975, 0.7783139, 0, 0.09803922, 1, 1,
0.3881348, -0.3434738, 2.688439, 0, 0.09411765, 1, 1,
0.3881629, -2.046321, 1.649121, 0, 0.08627451, 1, 1,
0.3931954, -0.7881953, 3.707299, 0, 0.08235294, 1, 1,
0.394243, 0.06979756, 0.2434618, 0, 0.07450981, 1, 1,
0.4107499, -1.242779, 2.697331, 0, 0.07058824, 1, 1,
0.4133283, 0.9217922, 0.6966155, 0, 0.0627451, 1, 1,
0.4153262, 1.117161, -1.846264, 0, 0.05882353, 1, 1,
0.4156596, -0.4603069, 1.690957, 0, 0.05098039, 1, 1,
0.4161601, -0.01585188, 0.6004112, 0, 0.04705882, 1, 1,
0.4167354, -0.9018222, 2.025839, 0, 0.03921569, 1, 1,
0.4227216, -0.003830279, 1.549977, 0, 0.03529412, 1, 1,
0.4243782, -2.172591, 1.194274, 0, 0.02745098, 1, 1,
0.4257172, 0.2509325, 1.14545, 0, 0.02352941, 1, 1,
0.4342481, -0.1862049, 1.281225, 0, 0.01568628, 1, 1,
0.4399031, -1.918678, 5.956121, 0, 0.01176471, 1, 1,
0.4407593, -2.044862, 1.06075, 0, 0.003921569, 1, 1,
0.4418504, 1.905012, 0.4158982, 0.003921569, 0, 1, 1,
0.4429214, -1.010742, 1.627516, 0.007843138, 0, 1, 1,
0.4594029, -0.229803, 2.711896, 0.01568628, 0, 1, 1,
0.4600744, -1.007767, 4.38729, 0.01960784, 0, 1, 1,
0.4626987, -0.1080784, 2.309791, 0.02745098, 0, 1, 1,
0.4659052, -1.62122, 4.038192, 0.03137255, 0, 1, 1,
0.4713848, -0.8920799, 3.716449, 0.03921569, 0, 1, 1,
0.4762137, 0.3855392, -1.09691, 0.04313726, 0, 1, 1,
0.476715, 1.339287, 0.156363, 0.05098039, 0, 1, 1,
0.4789312, 0.6318718, 1.292387, 0.05490196, 0, 1, 1,
0.4800582, 1.21038, -1.370322, 0.0627451, 0, 1, 1,
0.4806681, 1.692453, -0.9754575, 0.06666667, 0, 1, 1,
0.4849201, 0.4287811, -0.4132183, 0.07450981, 0, 1, 1,
0.4905335, 1.52341, 0.6837982, 0.07843138, 0, 1, 1,
0.4946395, -2.072359, 3.080235, 0.08627451, 0, 1, 1,
0.497417, -0.6392881, 0.5112566, 0.09019608, 0, 1, 1,
0.5001799, -1.005648, 3.603255, 0.09803922, 0, 1, 1,
0.5041773, 0.9220146, 3.448143, 0.1058824, 0, 1, 1,
0.5112444, -0.1812065, 3.115283, 0.1098039, 0, 1, 1,
0.5126674, -0.3031823, 1.167556, 0.1176471, 0, 1, 1,
0.514793, -0.4060006, 1.977393, 0.1215686, 0, 1, 1,
0.5179284, -0.6760882, 3.231394, 0.1294118, 0, 1, 1,
0.5186949, 0.07890613, -0.7154582, 0.1333333, 0, 1, 1,
0.5201756, -0.2845253, 2.794871, 0.1411765, 0, 1, 1,
0.5369269, -1.008302, 2.962341, 0.145098, 0, 1, 1,
0.5393622, 1.232516, -0.6708593, 0.1529412, 0, 1, 1,
0.550562, -0.4351996, 1.296121, 0.1568628, 0, 1, 1,
0.5540991, 0.1573049, 0.08157545, 0.1647059, 0, 1, 1,
0.5543587, 1.042238, 1.253865, 0.1686275, 0, 1, 1,
0.5557932, 0.6423048, -0.13679, 0.1764706, 0, 1, 1,
0.5603099, -1.320201, 0.7258933, 0.1803922, 0, 1, 1,
0.565482, 0.3903463, 1.348008, 0.1882353, 0, 1, 1,
0.5670485, 0.8414851, 0.5724782, 0.1921569, 0, 1, 1,
0.5684801, 0.05622805, 0.2462859, 0.2, 0, 1, 1,
0.5684853, 0.495573, 0.3432992, 0.2078431, 0, 1, 1,
0.5686566, 0.9957071, 0.07639005, 0.2117647, 0, 1, 1,
0.5702254, 1.529239, 0.1928596, 0.2196078, 0, 1, 1,
0.5708431, -1.196501, 3.359656, 0.2235294, 0, 1, 1,
0.5748841, 0.291921, 1.287089, 0.2313726, 0, 1, 1,
0.5763106, 0.09315439, 0.7824814, 0.2352941, 0, 1, 1,
0.5771752, -0.1003883, 2.187849, 0.2431373, 0, 1, 1,
0.5791599, 0.9930935, 1.258887, 0.2470588, 0, 1, 1,
0.5799621, -0.8793568, 3.895677, 0.254902, 0, 1, 1,
0.5846389, 0.9040977, 0.8795501, 0.2588235, 0, 1, 1,
0.5848761, -1.360399, 2.328753, 0.2666667, 0, 1, 1,
0.5876313, 0.6701989, 1.330394, 0.2705882, 0, 1, 1,
0.5885412, 0.005188981, 3.238023, 0.2784314, 0, 1, 1,
0.5987764, 0.3812579, 1.615555, 0.282353, 0, 1, 1,
0.6040311, 0.3351083, -0.08440597, 0.2901961, 0, 1, 1,
0.6085833, -0.5450074, 2.221283, 0.2941177, 0, 1, 1,
0.609957, -1.316908, 5.100029, 0.3019608, 0, 1, 1,
0.6111569, 1.850112, -0.3256968, 0.3098039, 0, 1, 1,
0.612931, 0.4945209, 0.2477859, 0.3137255, 0, 1, 1,
0.6185305, 1.004406, 1.049991, 0.3215686, 0, 1, 1,
0.6187106, -0.2045252, 1.928404, 0.3254902, 0, 1, 1,
0.6199801, -0.252408, 1.486358, 0.3333333, 0, 1, 1,
0.621069, 0.3062317, 0.6481486, 0.3372549, 0, 1, 1,
0.6245917, 1.290027, 0.06666838, 0.345098, 0, 1, 1,
0.6246955, 0.8011369, -0.6368702, 0.3490196, 0, 1, 1,
0.6309608, 0.0004091764, 1.028389, 0.3568628, 0, 1, 1,
0.632663, 1.683156, 1.280867, 0.3607843, 0, 1, 1,
0.6374958, -0.2280303, 1.494901, 0.3686275, 0, 1, 1,
0.6417482, -1.850831, 2.428945, 0.372549, 0, 1, 1,
0.6444554, 0.6001874, -0.05165635, 0.3803922, 0, 1, 1,
0.6470522, -1.086545, 1.313923, 0.3843137, 0, 1, 1,
0.6495533, 0.4789152, -0.6957164, 0.3921569, 0, 1, 1,
0.6520713, 0.2358555, 0.8101968, 0.3960784, 0, 1, 1,
0.6635657, -0.61159, 1.636631, 0.4039216, 0, 1, 1,
0.6654774, 0.03131774, 0.6997371, 0.4117647, 0, 1, 1,
0.667174, 1.123723, -1.222886, 0.4156863, 0, 1, 1,
0.668139, 0.9251087, 2.741706, 0.4235294, 0, 1, 1,
0.6694166, -0.4345437, 4.040544, 0.427451, 0, 1, 1,
0.6709455, -0.1653451, 1.952793, 0.4352941, 0, 1, 1,
0.6745012, -0.09488376, 2.687085, 0.4392157, 0, 1, 1,
0.6776114, 1.645557, 1.091668, 0.4470588, 0, 1, 1,
0.6786832, 1.04708, 2.780455, 0.4509804, 0, 1, 1,
0.6863211, 1.261839, -0.3632454, 0.4588235, 0, 1, 1,
0.6895023, -0.1449513, 1.962635, 0.4627451, 0, 1, 1,
0.6977146, 0.6147152, -0.8118969, 0.4705882, 0, 1, 1,
0.6981006, -2.251453, 2.361708, 0.4745098, 0, 1, 1,
0.6987257, 0.9447652, 0.7557365, 0.4823529, 0, 1, 1,
0.7026484, -1.546037, 1.543291, 0.4862745, 0, 1, 1,
0.7063832, -0.8427823, 2.293422, 0.4941176, 0, 1, 1,
0.7066333, -0.5127532, 1.493213, 0.5019608, 0, 1, 1,
0.7081125, 0.2853633, 1.694926, 0.5058824, 0, 1, 1,
0.723142, -0.7834874, 3.565057, 0.5137255, 0, 1, 1,
0.7293722, 1.969059, -1.094211, 0.5176471, 0, 1, 1,
0.7312921, 1.565124, 3.144908, 0.5254902, 0, 1, 1,
0.7332427, 0.3053924, 2.018076, 0.5294118, 0, 1, 1,
0.7356311, -0.5115008, 2.303988, 0.5372549, 0, 1, 1,
0.7360451, 1.80997, -0.3643528, 0.5411765, 0, 1, 1,
0.7422604, -1.022025, 2.578226, 0.5490196, 0, 1, 1,
0.7517148, -0.01996505, 1.620864, 0.5529412, 0, 1, 1,
0.7531024, 0.4473631, 0.4978982, 0.5607843, 0, 1, 1,
0.7567961, 0.2649057, 0.2160771, 0.5647059, 0, 1, 1,
0.762392, 0.1695588, 0.8965278, 0.572549, 0, 1, 1,
0.7664835, -1.165602, 3.417188, 0.5764706, 0, 1, 1,
0.7670398, 0.8720803, -1.127416, 0.5843138, 0, 1, 1,
0.7690737, 0.5820436, 1.333597, 0.5882353, 0, 1, 1,
0.7751475, -1.009322, 3.138476, 0.5960785, 0, 1, 1,
0.7795888, 0.7986233, 1.839459, 0.6039216, 0, 1, 1,
0.7927049, 0.5965729, 0.6520847, 0.6078432, 0, 1, 1,
0.7943562, 1.371476, -0.4637673, 0.6156863, 0, 1, 1,
0.7951958, -0.4071017, 2.803028, 0.6196079, 0, 1, 1,
0.8063237, -2.767579, 1.834164, 0.627451, 0, 1, 1,
0.8082851, 0.1221579, 0.9015293, 0.6313726, 0, 1, 1,
0.8191189, 0.3434106, 0.5849017, 0.6392157, 0, 1, 1,
0.8231922, 0.6895344, 0.3583876, 0.6431373, 0, 1, 1,
0.8330553, 0.5284227, 0.9064162, 0.6509804, 0, 1, 1,
0.8368806, -2.673216, 2.342736, 0.654902, 0, 1, 1,
0.8377648, -1.783903, 2.021502, 0.6627451, 0, 1, 1,
0.838957, 1.562956, 0.5083735, 0.6666667, 0, 1, 1,
0.8415104, 0.2530515, 0.8334031, 0.6745098, 0, 1, 1,
0.8483446, -1.215858, 2.56271, 0.6784314, 0, 1, 1,
0.8542991, -1.40901, 1.256609, 0.6862745, 0, 1, 1,
0.8554439, -0.5189538, 1.427258, 0.6901961, 0, 1, 1,
0.8628489, -0.7479832, 1.008646, 0.6980392, 0, 1, 1,
0.8672652, 1.537112, 0.2886223, 0.7058824, 0, 1, 1,
0.867508, -1.761386, 3.21205, 0.7098039, 0, 1, 1,
0.8681951, 0.2733653, 1.252146, 0.7176471, 0, 1, 1,
0.8684598, -0.4723356, 0.8155838, 0.7215686, 0, 1, 1,
0.8686616, 0.1499701, 0.6822944, 0.7294118, 0, 1, 1,
0.870176, 0.1418877, 0.3100193, 0.7333333, 0, 1, 1,
0.8747422, -0.3671964, 3.990973, 0.7411765, 0, 1, 1,
0.8747569, -1.257713, 3.330337, 0.7450981, 0, 1, 1,
0.8770573, 0.7963241, 3.103115, 0.7529412, 0, 1, 1,
0.8813627, 0.6618611, 1.066705, 0.7568628, 0, 1, 1,
0.8852772, -1.54944, 2.985767, 0.7647059, 0, 1, 1,
0.8896685, -0.1964588, 1.058853, 0.7686275, 0, 1, 1,
0.890171, -1.924046, 1.279789, 0.7764706, 0, 1, 1,
0.8914628, -1.782204, 2.289693, 0.7803922, 0, 1, 1,
0.8919843, 1.446004, 2.211454, 0.7882353, 0, 1, 1,
0.9001207, -1.068285, 2.79899, 0.7921569, 0, 1, 1,
0.9065005, 0.8723568, 1.623756, 0.8, 0, 1, 1,
0.9075077, -0.5947325, 1.386534, 0.8078431, 0, 1, 1,
0.9145212, 0.3821093, 1.02084, 0.8117647, 0, 1, 1,
0.9201975, 0.3859204, 0.9679679, 0.8196079, 0, 1, 1,
0.9224558, 1.404294, 0.4180144, 0.8235294, 0, 1, 1,
0.9374684, 0.06402116, 2.324319, 0.8313726, 0, 1, 1,
0.9392818, 0.6409754, 2.687553, 0.8352941, 0, 1, 1,
0.9532369, -0.7796816, 1.975441, 0.8431373, 0, 1, 1,
0.9584169, 0.9066082, -0.7781627, 0.8470588, 0, 1, 1,
0.9587071, 0.1306224, 2.117156, 0.854902, 0, 1, 1,
0.9594768, 0.4986747, -0.5131713, 0.8588235, 0, 1, 1,
0.9684597, 0.6450154, 0.4415746, 0.8666667, 0, 1, 1,
0.9811687, -0.5391087, 0.9865506, 0.8705882, 0, 1, 1,
0.9812682, -0.1262294, 1.851007, 0.8784314, 0, 1, 1,
0.9828861, -1.064223, 2.643581, 0.8823529, 0, 1, 1,
0.986715, -1.336104, 1.977829, 0.8901961, 0, 1, 1,
0.9879962, -1.665671, 1.552559, 0.8941177, 0, 1, 1,
0.9887336, 0.1932666, 0.3257992, 0.9019608, 0, 1, 1,
0.9901083, 0.4533296, 2.107353, 0.9098039, 0, 1, 1,
0.993997, -0.8122121, 2.627628, 0.9137255, 0, 1, 1,
1.002809, 0.03652303, 1.205556, 0.9215686, 0, 1, 1,
1.004147, -0.06145094, 1.917163, 0.9254902, 0, 1, 1,
1.008404, -0.5892854, 3.162944, 0.9333333, 0, 1, 1,
1.008455, -0.1508623, 2.35299, 0.9372549, 0, 1, 1,
1.011252, 0.33386, -1.244533, 0.945098, 0, 1, 1,
1.01186, 1.259944, 0.6943458, 0.9490196, 0, 1, 1,
1.012719, 2.056558, 0.5739728, 0.9568627, 0, 1, 1,
1.034638, -0.6812478, 0.2021005, 0.9607843, 0, 1, 1,
1.034829, 0.9501323, 0.9128489, 0.9686275, 0, 1, 1,
1.035881, 1.266342, 0.9464267, 0.972549, 0, 1, 1,
1.036384, 0.5438974, 1.64687, 0.9803922, 0, 1, 1,
1.038295, 1.160152, 0.1548578, 0.9843137, 0, 1, 1,
1.042313, -0.3604587, 2.176871, 0.9921569, 0, 1, 1,
1.043908, 0.8422648, 1.010189, 0.9960784, 0, 1, 1,
1.047465, 0.8510622, 1.916334, 1, 0, 0.9960784, 1,
1.054998, -1.145656, 2.694885, 1, 0, 0.9882353, 1,
1.061758, -0.5631594, 2.626595, 1, 0, 0.9843137, 1,
1.068175, 0.4312599, 3.336861, 1, 0, 0.9764706, 1,
1.075844, 0.939797, 1.067697, 1, 0, 0.972549, 1,
1.085026, 0.7972375, 1.863803, 1, 0, 0.9647059, 1,
1.086592, -0.2841727, 2.078787, 1, 0, 0.9607843, 1,
1.090937, 0.8821588, -0.3612189, 1, 0, 0.9529412, 1,
1.094491, 2.165047, 0.07704761, 1, 0, 0.9490196, 1,
1.096047, -0.6637801, 3.407476, 1, 0, 0.9411765, 1,
1.103209, -0.5051968, 2.515498, 1, 0, 0.9372549, 1,
1.105661, 1.303945, 1.165936, 1, 0, 0.9294118, 1,
1.108561, 0.2791808, 1.752684, 1, 0, 0.9254902, 1,
1.113151, 3.447978, 0.9046344, 1, 0, 0.9176471, 1,
1.117673, -0.9145694, 1.393016, 1, 0, 0.9137255, 1,
1.123052, 0.6486563, 2.487172, 1, 0, 0.9058824, 1,
1.127397, 0.8613685, 0.6180457, 1, 0, 0.9019608, 1,
1.1284, -0.7115055, 2.656167, 1, 0, 0.8941177, 1,
1.128785, -0.8162944, 1.232657, 1, 0, 0.8862745, 1,
1.141674, 0.2985804, 3.043462, 1, 0, 0.8823529, 1,
1.14174, -0.9357768, 2.48442, 1, 0, 0.8745098, 1,
1.142625, -0.4326886, 3.392043, 1, 0, 0.8705882, 1,
1.1456, -0.9736989, 1.497142, 1, 0, 0.8627451, 1,
1.146411, 0.3253046, 0.7370834, 1, 0, 0.8588235, 1,
1.146924, 0.3623708, 0.5908865, 1, 0, 0.8509804, 1,
1.148049, 0.1154311, 1.598668, 1, 0, 0.8470588, 1,
1.153182, 0.6751707, 1.072691, 1, 0, 0.8392157, 1,
1.156257, -0.2021627, 1.050959, 1, 0, 0.8352941, 1,
1.158504, 0.1216999, 0.6223254, 1, 0, 0.827451, 1,
1.158897, -1.69508, 2.695714, 1, 0, 0.8235294, 1,
1.17235, 0.2748868, 0.3653495, 1, 0, 0.8156863, 1,
1.174463, -0.03272371, 2.018229, 1, 0, 0.8117647, 1,
1.176518, -1.208257, 1.689103, 1, 0, 0.8039216, 1,
1.184056, -0.9987651, 1.993129, 1, 0, 0.7960784, 1,
1.192227, 0.4317699, 1.778253, 1, 0, 0.7921569, 1,
1.194172, -0.477513, 2.117277, 1, 0, 0.7843137, 1,
1.198846, -0.01220163, 1.511687, 1, 0, 0.7803922, 1,
1.203789, 1.738166, -0.03384623, 1, 0, 0.772549, 1,
1.208472, 0.09686265, 3.117875, 1, 0, 0.7686275, 1,
1.218512, -0.08628844, 3.24302, 1, 0, 0.7607843, 1,
1.219886, 0.9493324, 0.1444735, 1, 0, 0.7568628, 1,
1.222575, 0.9223163, 2.867282, 1, 0, 0.7490196, 1,
1.228088, 2.365042, -0.03302289, 1, 0, 0.7450981, 1,
1.23556, 0.3289211, 1.302322, 1, 0, 0.7372549, 1,
1.242015, 1.871376, -1.303544, 1, 0, 0.7333333, 1,
1.242223, -1.027183, 2.703583, 1, 0, 0.7254902, 1,
1.244791, -0.8657137, 2.434273, 1, 0, 0.7215686, 1,
1.244938, 0.6546603, 2.449219, 1, 0, 0.7137255, 1,
1.257134, 0.6904771, 0.8353794, 1, 0, 0.7098039, 1,
1.257507, 0.5420015, 0.5039166, 1, 0, 0.7019608, 1,
1.258167, 0.9381737, 1.661371, 1, 0, 0.6941177, 1,
1.26422, -1.366381, 2.051101, 1, 0, 0.6901961, 1,
1.28327, 0.07953188, 1.142023, 1, 0, 0.682353, 1,
1.283626, -1.608971, 1.759568, 1, 0, 0.6784314, 1,
1.289214, -0.1544516, 1.020185, 1, 0, 0.6705883, 1,
1.295739, 0.8068136, 0.8881946, 1, 0, 0.6666667, 1,
1.298972, 0.04002085, 0.7833992, 1, 0, 0.6588235, 1,
1.300194, 0.5838295, 2.317079, 1, 0, 0.654902, 1,
1.300778, 1.505024, 1.148397, 1, 0, 0.6470588, 1,
1.30657, -1.46816, 1.151835, 1, 0, 0.6431373, 1,
1.308363, 0.5233793, 4.062722, 1, 0, 0.6352941, 1,
1.313198, -0.03188309, 3.096297, 1, 0, 0.6313726, 1,
1.32032, -1.323864, 1.689999, 1, 0, 0.6235294, 1,
1.323185, 0.9753451, 1.540195, 1, 0, 0.6196079, 1,
1.324571, -0.1471407, 1.734277, 1, 0, 0.6117647, 1,
1.331202, 0.7962947, 0.5274644, 1, 0, 0.6078432, 1,
1.332344, 0.2590276, 0.43365, 1, 0, 0.6, 1,
1.347717, -1.08753, 2.734546, 1, 0, 0.5921569, 1,
1.349901, -1.186049, 0.3857929, 1, 0, 0.5882353, 1,
1.351121, 0.688612, 1.462358, 1, 0, 0.5803922, 1,
1.353645, 0.01536057, 0.2318795, 1, 0, 0.5764706, 1,
1.358648, -0.8629982, 1.690296, 1, 0, 0.5686275, 1,
1.36426, -2.057772, 3.461009, 1, 0, 0.5647059, 1,
1.37546, 0.1581943, 1.365651, 1, 0, 0.5568628, 1,
1.377093, -0.6286626, 1.825339, 1, 0, 0.5529412, 1,
1.389885, 1.073686, 0.8665563, 1, 0, 0.5450981, 1,
1.394481, -0.2133638, 1.255519, 1, 0, 0.5411765, 1,
1.407065, -1.39237, 1.946848, 1, 0, 0.5333334, 1,
1.409963, -0.6067972, 2.669159, 1, 0, 0.5294118, 1,
1.410744, 0.6561089, 0.8724483, 1, 0, 0.5215687, 1,
1.415284, -0.8917625, 0.8127744, 1, 0, 0.5176471, 1,
1.4221, 1.10983, -0.0644527, 1, 0, 0.509804, 1,
1.428224, -0.2808645, 1.877946, 1, 0, 0.5058824, 1,
1.435154, 0.5917578, 1.343658, 1, 0, 0.4980392, 1,
1.444627, 0.6032543, -0.8507109, 1, 0, 0.4901961, 1,
1.446037, 0.4931944, 0.6967309, 1, 0, 0.4862745, 1,
1.45617, -3.191014, 2.618582, 1, 0, 0.4784314, 1,
1.464742, 0.4460102, 1.724583, 1, 0, 0.4745098, 1,
1.477238, -0.4831417, 1.996876, 1, 0, 0.4666667, 1,
1.478177, -1.579192, 2.731301, 1, 0, 0.4627451, 1,
1.494253, 0.6852707, 0.1395558, 1, 0, 0.454902, 1,
1.496256, -1.685389, 3.173371, 1, 0, 0.4509804, 1,
1.51555, 0.1311826, 1.405724, 1, 0, 0.4431373, 1,
1.532344, -0.3803993, 1.901303, 1, 0, 0.4392157, 1,
1.544641, -0.01159769, 2.165575, 1, 0, 0.4313726, 1,
1.544846, -0.3818873, 2.780556, 1, 0, 0.427451, 1,
1.561877, -0.18008, 0.175462, 1, 0, 0.4196078, 1,
1.569013, 0.2357469, 3.013604, 1, 0, 0.4156863, 1,
1.570205, 0.8230413, 1.089336, 1, 0, 0.4078431, 1,
1.577702, 0.234343, 0.4909988, 1, 0, 0.4039216, 1,
1.577785, -0.5102656, 1.458743, 1, 0, 0.3960784, 1,
1.578903, 2.760481, -0.383906, 1, 0, 0.3882353, 1,
1.586772, 0.2334831, -0.08275072, 1, 0, 0.3843137, 1,
1.593486, 1.707876, 1.879413, 1, 0, 0.3764706, 1,
1.593534, 0.3162276, 2.938692, 1, 0, 0.372549, 1,
1.600194, -0.1106136, 3.093765, 1, 0, 0.3647059, 1,
1.6015, 0.2848926, 0.2072599, 1, 0, 0.3607843, 1,
1.620969, -2.717458, 3.985451, 1, 0, 0.3529412, 1,
1.632486, -0.4895367, 1.535574, 1, 0, 0.3490196, 1,
1.638405, -0.1228232, 1.391187, 1, 0, 0.3411765, 1,
1.639703, 2.114838, 2.702545, 1, 0, 0.3372549, 1,
1.653827, -1.638539, 1.937785, 1, 0, 0.3294118, 1,
1.659577, 1.708881, 1.863648, 1, 0, 0.3254902, 1,
1.669394, 2.122484, 1.323289, 1, 0, 0.3176471, 1,
1.670397, 1.462676, 0.2003391, 1, 0, 0.3137255, 1,
1.671561, -0.8840047, 2.90101, 1, 0, 0.3058824, 1,
1.68525, 1.405095, 0.7807941, 1, 0, 0.2980392, 1,
1.689031, -0.675871, 0.7658228, 1, 0, 0.2941177, 1,
1.689117, 0.150858, 0.9183835, 1, 0, 0.2862745, 1,
1.702263, -0.7098396, 3.103668, 1, 0, 0.282353, 1,
1.704681, 1.22338, 1.649614, 1, 0, 0.2745098, 1,
1.705199, -0.1572099, 0.6121873, 1, 0, 0.2705882, 1,
1.705223, -0.6438926, 1.938309, 1, 0, 0.2627451, 1,
1.707999, -0.3410743, 0.004621255, 1, 0, 0.2588235, 1,
1.726858, -0.4325981, 2.227108, 1, 0, 0.2509804, 1,
1.734622, 0.4274993, 1.439194, 1, 0, 0.2470588, 1,
1.73467, -0.3828177, 2.483733, 1, 0, 0.2392157, 1,
1.738706, -2.15564, 3.553959, 1, 0, 0.2352941, 1,
1.742486, 0.4123195, 1.41673, 1, 0, 0.227451, 1,
1.756924, 1.391024, 1.291643, 1, 0, 0.2235294, 1,
1.762361, 0.6204948, 1.245149, 1, 0, 0.2156863, 1,
1.76418, -1.542041, 3.595571, 1, 0, 0.2117647, 1,
1.76608, 1.509282, 1.15021, 1, 0, 0.2039216, 1,
1.774939, 1.263438, 0.8035731, 1, 0, 0.1960784, 1,
1.792155, -0.7098326, 2.17149, 1, 0, 0.1921569, 1,
1.801035, -1.472008, 2.981598, 1, 0, 0.1843137, 1,
1.814666, -0.625374, 1.641313, 1, 0, 0.1803922, 1,
1.817373, 1.356574, 0.316296, 1, 0, 0.172549, 1,
1.821475, -2.083261, 3.383793, 1, 0, 0.1686275, 1,
1.821806, -1.492995, 2.204609, 1, 0, 0.1607843, 1,
1.823085, -1.262133, 1.05955, 1, 0, 0.1568628, 1,
1.864021, -2.30123, 0.3868576, 1, 0, 0.1490196, 1,
1.871456, -0.5073771, 2.679923, 1, 0, 0.145098, 1,
1.909517, 0.8299453, 2.766289, 1, 0, 0.1372549, 1,
1.914588, -0.03275083, 2.062133, 1, 0, 0.1333333, 1,
1.937629, -1.189609, 3.788443, 1, 0, 0.1254902, 1,
1.959515, -0.4134034, 3.49592, 1, 0, 0.1215686, 1,
2.049286, -1.462223, 1.401719, 1, 0, 0.1137255, 1,
2.051467, -0.7117605, 2.71663, 1, 0, 0.1098039, 1,
2.140784, 2.323219, 1.456088, 1, 0, 0.1019608, 1,
2.143885, -1.03972, 1.784013, 1, 0, 0.09411765, 1,
2.147754, -0.4534485, 2.420009, 1, 0, 0.09019608, 1,
2.173697, -1.349635, 1.847178, 1, 0, 0.08235294, 1,
2.202937, -0.8521761, -0.04971747, 1, 0, 0.07843138, 1,
2.441397, -0.2068519, 2.628196, 1, 0, 0.07058824, 1,
2.447533, 1.979254, 0.2325961, 1, 0, 0.06666667, 1,
2.453491, -0.2007474, 1.274372, 1, 0, 0.05882353, 1,
2.488643, 0.2499061, 2.619329, 1, 0, 0.05490196, 1,
2.556276, -0.3266525, 1.635465, 1, 0, 0.04705882, 1,
2.65802, -1.101352, 2.415997, 1, 0, 0.04313726, 1,
2.716639, 1.26208, 1.851105, 1, 0, 0.03529412, 1,
2.717916, -0.5026199, 2.915256, 1, 0, 0.03137255, 1,
2.724395, -0.2344712, 1.262107, 1, 0, 0.02352941, 1,
2.800433, -0.3497097, 0.8214744, 1, 0, 0.01960784, 1,
3.138527, -1.821987, 1.697926, 1, 0, 0.01176471, 1,
3.31005, 0.5010739, 2.649901, 1, 0, 0.007843138, 1
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
0.1189463, -4.316323, -7.779565, 0, -0.5, 0.5, 0.5,
0.1189463, -4.316323, -7.779565, 1, -0.5, 0.5, 0.5,
0.1189463, -4.316323, -7.779565, 1, 1.5, 0.5, 0.5,
0.1189463, -4.316323, -7.779565, 0, 1.5, 0.5, 0.5
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
-4.153942, 0.128482, -7.779565, 0, -0.5, 0.5, 0.5,
-4.153942, 0.128482, -7.779565, 1, -0.5, 0.5, 0.5,
-4.153942, 0.128482, -7.779565, 1, 1.5, 0.5, 0.5,
-4.153942, 0.128482, -7.779565, 0, 1.5, 0.5, 0.5
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
-4.153942, -4.316323, 0.08365989, 0, -0.5, 0.5, 0.5,
-4.153942, -4.316323, 0.08365989, 1, -0.5, 0.5, 0.5,
-4.153942, -4.316323, 0.08365989, 1, 1.5, 0.5, 0.5,
-4.153942, -4.316323, 0.08365989, 0, 1.5, 0.5, 0.5
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
-3, -3.290598, -5.964975,
3, -3.290598, -5.964975,
-3, -3.290598, -5.964975,
-3, -3.461552, -6.267407,
-2, -3.290598, -5.964975,
-2, -3.461552, -6.267407,
-1, -3.290598, -5.964975,
-1, -3.461552, -6.267407,
0, -3.290598, -5.964975,
0, -3.461552, -6.267407,
1, -3.290598, -5.964975,
1, -3.461552, -6.267407,
2, -3.290598, -5.964975,
2, -3.461552, -6.267407,
3, -3.290598, -5.964975,
3, -3.461552, -6.267407
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
-3, -3.803461, -6.87227, 0, -0.5, 0.5, 0.5,
-3, -3.803461, -6.87227, 1, -0.5, 0.5, 0.5,
-3, -3.803461, -6.87227, 1, 1.5, 0.5, 0.5,
-3, -3.803461, -6.87227, 0, 1.5, 0.5, 0.5,
-2, -3.803461, -6.87227, 0, -0.5, 0.5, 0.5,
-2, -3.803461, -6.87227, 1, -0.5, 0.5, 0.5,
-2, -3.803461, -6.87227, 1, 1.5, 0.5, 0.5,
-2, -3.803461, -6.87227, 0, 1.5, 0.5, 0.5,
-1, -3.803461, -6.87227, 0, -0.5, 0.5, 0.5,
-1, -3.803461, -6.87227, 1, -0.5, 0.5, 0.5,
-1, -3.803461, -6.87227, 1, 1.5, 0.5, 0.5,
-1, -3.803461, -6.87227, 0, 1.5, 0.5, 0.5,
0, -3.803461, -6.87227, 0, -0.5, 0.5, 0.5,
0, -3.803461, -6.87227, 1, -0.5, 0.5, 0.5,
0, -3.803461, -6.87227, 1, 1.5, 0.5, 0.5,
0, -3.803461, -6.87227, 0, 1.5, 0.5, 0.5,
1, -3.803461, -6.87227, 0, -0.5, 0.5, 0.5,
1, -3.803461, -6.87227, 1, -0.5, 0.5, 0.5,
1, -3.803461, -6.87227, 1, 1.5, 0.5, 0.5,
1, -3.803461, -6.87227, 0, 1.5, 0.5, 0.5,
2, -3.803461, -6.87227, 0, -0.5, 0.5, 0.5,
2, -3.803461, -6.87227, 1, -0.5, 0.5, 0.5,
2, -3.803461, -6.87227, 1, 1.5, 0.5, 0.5,
2, -3.803461, -6.87227, 0, 1.5, 0.5, 0.5,
3, -3.803461, -6.87227, 0, -0.5, 0.5, 0.5,
3, -3.803461, -6.87227, 1, -0.5, 0.5, 0.5,
3, -3.803461, -6.87227, 1, 1.5, 0.5, 0.5,
3, -3.803461, -6.87227, 0, 1.5, 0.5, 0.5
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
-3.167891, -3, -5.964975,
-3.167891, 3, -5.964975,
-3.167891, -3, -5.964975,
-3.332233, -3, -6.267407,
-3.167891, -2, -5.964975,
-3.332233, -2, -6.267407,
-3.167891, -1, -5.964975,
-3.332233, -1, -6.267407,
-3.167891, 0, -5.964975,
-3.332233, 0, -6.267407,
-3.167891, 1, -5.964975,
-3.332233, 1, -6.267407,
-3.167891, 2, -5.964975,
-3.332233, 2, -6.267407,
-3.167891, 3, -5.964975,
-3.332233, 3, -6.267407
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
-3.660917, -3, -6.87227, 0, -0.5, 0.5, 0.5,
-3.660917, -3, -6.87227, 1, -0.5, 0.5, 0.5,
-3.660917, -3, -6.87227, 1, 1.5, 0.5, 0.5,
-3.660917, -3, -6.87227, 0, 1.5, 0.5, 0.5,
-3.660917, -2, -6.87227, 0, -0.5, 0.5, 0.5,
-3.660917, -2, -6.87227, 1, -0.5, 0.5, 0.5,
-3.660917, -2, -6.87227, 1, 1.5, 0.5, 0.5,
-3.660917, -2, -6.87227, 0, 1.5, 0.5, 0.5,
-3.660917, -1, -6.87227, 0, -0.5, 0.5, 0.5,
-3.660917, -1, -6.87227, 1, -0.5, 0.5, 0.5,
-3.660917, -1, -6.87227, 1, 1.5, 0.5, 0.5,
-3.660917, -1, -6.87227, 0, 1.5, 0.5, 0.5,
-3.660917, 0, -6.87227, 0, -0.5, 0.5, 0.5,
-3.660917, 0, -6.87227, 1, -0.5, 0.5, 0.5,
-3.660917, 0, -6.87227, 1, 1.5, 0.5, 0.5,
-3.660917, 0, -6.87227, 0, 1.5, 0.5, 0.5,
-3.660917, 1, -6.87227, 0, -0.5, 0.5, 0.5,
-3.660917, 1, -6.87227, 1, -0.5, 0.5, 0.5,
-3.660917, 1, -6.87227, 1, 1.5, 0.5, 0.5,
-3.660917, 1, -6.87227, 0, 1.5, 0.5, 0.5,
-3.660917, 2, -6.87227, 0, -0.5, 0.5, 0.5,
-3.660917, 2, -6.87227, 1, -0.5, 0.5, 0.5,
-3.660917, 2, -6.87227, 1, 1.5, 0.5, 0.5,
-3.660917, 2, -6.87227, 0, 1.5, 0.5, 0.5,
-3.660917, 3, -6.87227, 0, -0.5, 0.5, 0.5,
-3.660917, 3, -6.87227, 1, -0.5, 0.5, 0.5,
-3.660917, 3, -6.87227, 1, 1.5, 0.5, 0.5,
-3.660917, 3, -6.87227, 0, 1.5, 0.5, 0.5
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
-3.167891, -3.290598, -4,
-3.167891, -3.290598, 4,
-3.167891, -3.290598, -4,
-3.332233, -3.461552, -4,
-3.167891, -3.290598, -2,
-3.332233, -3.461552, -2,
-3.167891, -3.290598, 0,
-3.332233, -3.461552, 0,
-3.167891, -3.290598, 2,
-3.332233, -3.461552, 2,
-3.167891, -3.290598, 4,
-3.332233, -3.461552, 4
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
-3.660917, -3.803461, -4, 0, -0.5, 0.5, 0.5,
-3.660917, -3.803461, -4, 1, -0.5, 0.5, 0.5,
-3.660917, -3.803461, -4, 1, 1.5, 0.5, 0.5,
-3.660917, -3.803461, -4, 0, 1.5, 0.5, 0.5,
-3.660917, -3.803461, -2, 0, -0.5, 0.5, 0.5,
-3.660917, -3.803461, -2, 1, -0.5, 0.5, 0.5,
-3.660917, -3.803461, -2, 1, 1.5, 0.5, 0.5,
-3.660917, -3.803461, -2, 0, 1.5, 0.5, 0.5,
-3.660917, -3.803461, 0, 0, -0.5, 0.5, 0.5,
-3.660917, -3.803461, 0, 1, -0.5, 0.5, 0.5,
-3.660917, -3.803461, 0, 1, 1.5, 0.5, 0.5,
-3.660917, -3.803461, 0, 0, 1.5, 0.5, 0.5,
-3.660917, -3.803461, 2, 0, -0.5, 0.5, 0.5,
-3.660917, -3.803461, 2, 1, -0.5, 0.5, 0.5,
-3.660917, -3.803461, 2, 1, 1.5, 0.5, 0.5,
-3.660917, -3.803461, 2, 0, 1.5, 0.5, 0.5,
-3.660917, -3.803461, 4, 0, -0.5, 0.5, 0.5,
-3.660917, -3.803461, 4, 1, -0.5, 0.5, 0.5,
-3.660917, -3.803461, 4, 1, 1.5, 0.5, 0.5,
-3.660917, -3.803461, 4, 0, 1.5, 0.5, 0.5
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
-3.167891, -3.290598, -5.964975,
-3.167891, 3.547562, -5.964975,
-3.167891, -3.290598, 6.132295,
-3.167891, 3.547562, 6.132295,
-3.167891, -3.290598, -5.964975,
-3.167891, -3.290598, 6.132295,
-3.167891, 3.547562, -5.964975,
-3.167891, 3.547562, 6.132295,
-3.167891, -3.290598, -5.964975,
3.405784, -3.290598, -5.964975,
-3.167891, -3.290598, 6.132295,
3.405784, -3.290598, 6.132295,
-3.167891, 3.547562, -5.964975,
3.405784, 3.547562, -5.964975,
-3.167891, 3.547562, 6.132295,
3.405784, 3.547562, 6.132295,
3.405784, -3.290598, -5.964975,
3.405784, 3.547562, -5.964975,
3.405784, -3.290598, 6.132295,
3.405784, 3.547562, 6.132295,
3.405784, -3.290598, -5.964975,
3.405784, -3.290598, 6.132295,
3.405784, 3.547562, -5.964975,
3.405784, 3.547562, 6.132295
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
var radius = 8.208683;
var distance = 36.52136;
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
mvMatrix.translate( -0.1189463, -0.128482, -0.08365989 );
mvMatrix.scale( 1.350141, 1.29792, 0.7336687 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.52136);
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
metazachlor<-read.table("metazachlor.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-metazachlor$V2
```

```
## Error in eval(expr, envir, enclos): object 'metazachlor' not found
```

```r
y<-metazachlor$V3
```

```
## Error in eval(expr, envir, enclos): object 'metazachlor' not found
```

```r
z<-metazachlor$V4
```

```
## Error in eval(expr, envir, enclos): object 'metazachlor' not found
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
-3.072158, 0.1941063, 0.1187209, 0, 0, 1, 1, 1,
-2.821829, -0.5590065, -0.2259848, 1, 0, 0, 1, 1,
-2.775247, -1.462855, -1.244426, 1, 0, 0, 1, 1,
-2.701209, -0.1810345, -2.364401, 1, 0, 0, 1, 1,
-2.678088, -0.3645841, -1.739969, 1, 0, 0, 1, 1,
-2.627999, 1.16772, -1.133114, 1, 0, 0, 1, 1,
-2.560379, -0.492804, -2.255586, 0, 0, 0, 1, 1,
-2.442247, 2.014801, -2.201487, 0, 0, 0, 1, 1,
-2.299483, -0.6145012, -1.504609, 0, 0, 0, 1, 1,
-2.278503, 0.4058261, 0.3721226, 0, 0, 0, 1, 1,
-2.272425, 2.545329, 0.959369, 0, 0, 0, 1, 1,
-2.175433, 0.2255521, -2.066834, 0, 0, 0, 1, 1,
-2.146079, 0.1616848, -0.08443643, 0, 0, 0, 1, 1,
-2.121668, 0.3973383, -0.1843977, 1, 1, 1, 1, 1,
-2.107639, -0.005772419, -0.2177214, 1, 1, 1, 1, 1,
-2.101978, 1.6233, -0.9701291, 1, 1, 1, 1, 1,
-2.101625, -0.4290682, -1.213474, 1, 1, 1, 1, 1,
-2.088782, 2.58752, -0.9640952, 1, 1, 1, 1, 1,
-2.011073, -2.379872, -2.49698, 1, 1, 1, 1, 1,
-2.008371, -1.437393, -0.8050724, 1, 1, 1, 1, 1,
-1.94438, -0.6401352, -1.370684, 1, 1, 1, 1, 1,
-1.903112, -0.5008652, -1.225841, 1, 1, 1, 1, 1,
-1.893802, -0.6197813, -2.191538, 1, 1, 1, 1, 1,
-1.854194, 0.9970056, -1.596985, 1, 1, 1, 1, 1,
-1.833996, 2.152366, -1.328323, 1, 1, 1, 1, 1,
-1.832412, 0.3648602, -1.071571, 1, 1, 1, 1, 1,
-1.822915, -0.3579286, -0.5134106, 1, 1, 1, 1, 1,
-1.812688, 1.44851, -1.82911, 1, 1, 1, 1, 1,
-1.805914, 1.758238, -0.14496, 0, 0, 1, 1, 1,
-1.788062, 0.1881118, -1.791674, 1, 0, 0, 1, 1,
-1.786783, 0.7382542, -0.6096472, 1, 0, 0, 1, 1,
-1.777765, -0.06987096, -1.971429, 1, 0, 0, 1, 1,
-1.766185, -0.4848786, -0.9762452, 1, 0, 0, 1, 1,
-1.763417, -0.3435845, -2.754416, 1, 0, 0, 1, 1,
-1.755722, 0.6035844, -2.287272, 0, 0, 0, 1, 1,
-1.747337, -0.9338345, -2.963459, 0, 0, 0, 1, 1,
-1.745779, -1.222071, -1.490827, 0, 0, 0, 1, 1,
-1.734972, -0.9212657, -3.159247, 0, 0, 0, 1, 1,
-1.722305, 0.93406, -1.542461, 0, 0, 0, 1, 1,
-1.715492, 0.3773736, -1.009456, 0, 0, 0, 1, 1,
-1.708596, -1.493005, -2.411002, 0, 0, 0, 1, 1,
-1.691577, -0.9672303, -0.7183955, 1, 1, 1, 1, 1,
-1.677656, 0.9934345, -0.3102398, 1, 1, 1, 1, 1,
-1.663146, 1.893196, -0.972549, 1, 1, 1, 1, 1,
-1.650823, -1.518744, -0.7179595, 1, 1, 1, 1, 1,
-1.649819, -0.3911656, -1.141645, 1, 1, 1, 1, 1,
-1.648657, -0.641499, -3.823514, 1, 1, 1, 1, 1,
-1.632183, 0.0251497, -0.6284052, 1, 1, 1, 1, 1,
-1.629659, -1.401253, -0.7118511, 1, 1, 1, 1, 1,
-1.620983, -0.8012691, -1.997482, 1, 1, 1, 1, 1,
-1.620942, 3.442889, 0.002129053, 1, 1, 1, 1, 1,
-1.612868, 0.8570982, -1.090475, 1, 1, 1, 1, 1,
-1.598054, -0.257681, -1.180687, 1, 1, 1, 1, 1,
-1.597672, 1.771166, -1.120522, 1, 1, 1, 1, 1,
-1.588822, -0.6078967, -1.534094, 1, 1, 1, 1, 1,
-1.577202, 0.9456224, -2.623963, 1, 1, 1, 1, 1,
-1.558607, -0.1135088, -0.5019947, 0, 0, 1, 1, 1,
-1.5339, -0.915567, -1.413523, 1, 0, 0, 1, 1,
-1.526842, -1.673078, -1.855051, 1, 0, 0, 1, 1,
-1.521378, 0.5957669, -1.912271, 1, 0, 0, 1, 1,
-1.520391, 0.259165, -1.208227, 1, 0, 0, 1, 1,
-1.494543, -1.700406, -1.583485, 1, 0, 0, 1, 1,
-1.491686, -2.188576, -4.254778, 0, 0, 0, 1, 1,
-1.480759, -0.1192688, -2.459823, 0, 0, 0, 1, 1,
-1.474954, 0.4662012, -1.172909, 0, 0, 0, 1, 1,
-1.465532, -0.1774902, -2.441959, 0, 0, 0, 1, 1,
-1.459038, -1.035427, -2.264186, 0, 0, 0, 1, 1,
-1.455714, -0.3959852, -0.2557557, 0, 0, 0, 1, 1,
-1.452884, -0.5221159, -3.100452, 0, 0, 0, 1, 1,
-1.43811, 1.714958, -1.265048, 1, 1, 1, 1, 1,
-1.435752, -0.6671722, -1.619029, 1, 1, 1, 1, 1,
-1.433813, -1.050538, -1.662186, 1, 1, 1, 1, 1,
-1.431546, 0.134835, -1.870153, 1, 1, 1, 1, 1,
-1.427621, -1.41396, -1.545412, 1, 1, 1, 1, 1,
-1.427045, 1.553077, -0.2404047, 1, 1, 1, 1, 1,
-1.421368, 0.9465681, -1.258609, 1, 1, 1, 1, 1,
-1.399152, 0.01647072, -0.05326319, 1, 1, 1, 1, 1,
-1.396904, -1.533985, -2.980503, 1, 1, 1, 1, 1,
-1.389961, 0.4223226, -0.8569745, 1, 1, 1, 1, 1,
-1.385288, 0.8836223, -1.176242, 1, 1, 1, 1, 1,
-1.381088, 0.6445417, -2.198431, 1, 1, 1, 1, 1,
-1.377645, 1.505668, -2.21886, 1, 1, 1, 1, 1,
-1.376775, 0.2897443, -2.397156, 1, 1, 1, 1, 1,
-1.360586, -0.6842673, -1.220702, 1, 1, 1, 1, 1,
-1.350133, -0.1724438, -1.646393, 0, 0, 1, 1, 1,
-1.34794, -0.1689494, -1.892299, 1, 0, 0, 1, 1,
-1.340419, -0.05226469, -3.047762, 1, 0, 0, 1, 1,
-1.340074, 1.22868, -0.06017845, 1, 0, 0, 1, 1,
-1.327884, 0.7545919, 0.1417255, 1, 0, 0, 1, 1,
-1.319258, 2.01454, 0.5803013, 1, 0, 0, 1, 1,
-1.313925, -1.593585, -1.731706, 0, 0, 0, 1, 1,
-1.311955, 1.264872, -0.2691462, 0, 0, 0, 1, 1,
-1.293197, -0.9256627, -1.756757, 0, 0, 0, 1, 1,
-1.285067, 0.04216947, 0.501902, 0, 0, 0, 1, 1,
-1.284133, 0.1996973, -4.330139, 0, 0, 0, 1, 1,
-1.283322, 0.2355426, -1.238178, 0, 0, 0, 1, 1,
-1.272487, -0.09154135, -1.040213, 0, 0, 0, 1, 1,
-1.261613, -1.306081, -4.247033, 1, 1, 1, 1, 1,
-1.259925, 0.8004953, -1.707744, 1, 1, 1, 1, 1,
-1.25774, -0.771669, -4.170324, 1, 1, 1, 1, 1,
-1.245375, -0.4998323, -2.0863, 1, 1, 1, 1, 1,
-1.245107, 0.7717158, -1.760773, 1, 1, 1, 1, 1,
-1.242738, 0.8853739, -0.4595585, 1, 1, 1, 1, 1,
-1.241603, -0.7468479, -2.226271, 1, 1, 1, 1, 1,
-1.237178, -0.4687167, -2.136971, 1, 1, 1, 1, 1,
-1.23673, -0.3368069, -1.82082, 1, 1, 1, 1, 1,
-1.223193, 0.917339, -1.424512, 1, 1, 1, 1, 1,
-1.203978, -0.2611252, -3.32822, 1, 1, 1, 1, 1,
-1.194641, -2.350439, -3.405915, 1, 1, 1, 1, 1,
-1.164953, 0.8875139, -2.958029, 1, 1, 1, 1, 1,
-1.161029, -1.254954, -2.523899, 1, 1, 1, 1, 1,
-1.158633, 0.9964272, -1.158807, 1, 1, 1, 1, 1,
-1.146554, 0.5008478, -1.701779, 0, 0, 1, 1, 1,
-1.136407, -0.3862122, -1.262969, 1, 0, 0, 1, 1,
-1.129219, 0.1550766, -1.84838, 1, 0, 0, 1, 1,
-1.12627, 0.2029171, -1.944589, 1, 0, 0, 1, 1,
-1.118598, -0.2481126, -1.394885, 1, 0, 0, 1, 1,
-1.116787, -0.6721119, -1.498087, 1, 0, 0, 1, 1,
-1.11297, -0.5476669, -1.247838, 0, 0, 0, 1, 1,
-1.101721, 1.079425, 0.7613351, 0, 0, 0, 1, 1,
-1.097165, -1.137881, -1.131849, 0, 0, 0, 1, 1,
-1.081982, 0.488915, -2.976914, 0, 0, 0, 1, 1,
-1.079896, 1.159086, -0.2904637, 0, 0, 0, 1, 1,
-1.078619, -1.81787, -2.453443, 0, 0, 0, 1, 1,
-1.072365, 1.123729, -1.047239, 0, 0, 0, 1, 1,
-1.071584, -2.17466, -3.360554, 1, 1, 1, 1, 1,
-1.068373, 0.8985571, -2.536939, 1, 1, 1, 1, 1,
-1.060034, 0.1846291, -0.7556049, 1, 1, 1, 1, 1,
-1.059487, 0.2341265, -1.953363, 1, 1, 1, 1, 1,
-1.051803, 0.5244866, -0.8108745, 1, 1, 1, 1, 1,
-1.048904, -1.177685, -1.386245, 1, 1, 1, 1, 1,
-1.035808, -0.4032147, -1.813541, 1, 1, 1, 1, 1,
-1.032638, -0.1910923, -3.342302, 1, 1, 1, 1, 1,
-1.032227, 0.6724474, 0.2219041, 1, 1, 1, 1, 1,
-1.031223, 2.33969, -0.7053091, 1, 1, 1, 1, 1,
-1.02802, 0.1367429, -1.16224, 1, 1, 1, 1, 1,
-1.022117, 1.068528, -0.8316339, 1, 1, 1, 1, 1,
-1.0167, -1.467058, -3.529101, 1, 1, 1, 1, 1,
-1.014401, -0.580808, -3.25886, 1, 1, 1, 1, 1,
-1.012432, -1.649127, -3.049502, 1, 1, 1, 1, 1,
-1.006043, -0.7949921, -2.460036, 0, 0, 1, 1, 1,
-0.9979095, 1.775589, -1.162839, 1, 0, 0, 1, 1,
-0.996815, 0.5566182, -1.706612, 1, 0, 0, 1, 1,
-0.996132, -1.857223, -3.628158, 1, 0, 0, 1, 1,
-0.9951867, 1.059391, -1.294839, 1, 0, 0, 1, 1,
-0.9834834, -0.7283828, -3.423055, 1, 0, 0, 1, 1,
-0.9795033, 2.581889, -0.652759, 0, 0, 0, 1, 1,
-0.9767313, -0.08536933, -0.86462, 0, 0, 0, 1, 1,
-0.9727684, 0.9708026, -0.2277112, 0, 0, 0, 1, 1,
-0.9671515, 0.3178963, -1.848688, 0, 0, 0, 1, 1,
-0.9608347, -0.09326227, -1.262927, 0, 0, 0, 1, 1,
-0.9446871, 0.4497268, 0.4600971, 0, 0, 0, 1, 1,
-0.9444121, -0.06328382, -1.494604, 0, 0, 0, 1, 1,
-0.9432075, 0.8030875, -1.11735, 1, 1, 1, 1, 1,
-0.9352158, -0.1853994, -3.654853, 1, 1, 1, 1, 1,
-0.9352032, -0.8860119, -0.5637962, 1, 1, 1, 1, 1,
-0.9326538, -1.083663, -2.740021, 1, 1, 1, 1, 1,
-0.9317305, 0.02247752, -1.562713, 1, 1, 1, 1, 1,
-0.9280297, 0.3386717, -1.010405, 1, 1, 1, 1, 1,
-0.9257507, -0.8120165, -0.8259066, 1, 1, 1, 1, 1,
-0.9227437, -0.5230742, -2.613428, 1, 1, 1, 1, 1,
-0.9224851, 0.691515, -1.027313, 1, 1, 1, 1, 1,
-0.9215377, 0.06846942, -1.842775, 1, 1, 1, 1, 1,
-0.9122207, -0.3831342, -1.262926, 1, 1, 1, 1, 1,
-0.9121048, 0.6773894, -0.8033053, 1, 1, 1, 1, 1,
-0.9057492, 0.9105725, -0.8445468, 1, 1, 1, 1, 1,
-0.8999462, -0.4167853, -3.204225, 1, 1, 1, 1, 1,
-0.8983473, -1.005985, -2.625638, 1, 1, 1, 1, 1,
-0.891561, 0.4559694, -2.3461, 0, 0, 1, 1, 1,
-0.8887255, -2.608866, -2.243135, 1, 0, 0, 1, 1,
-0.8874022, 1.348722, -0.6550076, 1, 0, 0, 1, 1,
-0.8863973, 1.327119, -0.4563, 1, 0, 0, 1, 1,
-0.883553, 0.599798, -2.185951, 1, 0, 0, 1, 1,
-0.8778286, -0.371556, -2.971904, 1, 0, 0, 1, 1,
-0.8774748, 0.1510041, -3.684343, 0, 0, 0, 1, 1,
-0.8754478, 0.5750616, 1.297256, 0, 0, 0, 1, 1,
-0.870017, 0.467588, 1.323172, 0, 0, 0, 1, 1,
-0.8574893, -0.2843027, -0.4196756, 0, 0, 0, 1, 1,
-0.8571877, 0.6458142, -2.419349, 0, 0, 0, 1, 1,
-0.8564219, -0.3354894, -1.271125, 0, 0, 0, 1, 1,
-0.8527047, 1.656813, -0.8200566, 0, 0, 0, 1, 1,
-0.8462322, 0.8283135, -1.221957, 1, 1, 1, 1, 1,
-0.8386995, 0.9762145, -2.429625, 1, 1, 1, 1, 1,
-0.8368929, -0.8378559, -2.793501, 1, 1, 1, 1, 1,
-0.8314404, 0.5728284, -0.1497165, 1, 1, 1, 1, 1,
-0.8309205, -1.463984, -2.762589, 1, 1, 1, 1, 1,
-0.8263968, -0.3392893, -1.069277, 1, 1, 1, 1, 1,
-0.8245646, -0.5170628, -3.631061, 1, 1, 1, 1, 1,
-0.8217967, -1.3635, -3.667995, 1, 1, 1, 1, 1,
-0.8191981, 0.1889081, -1.917688, 1, 1, 1, 1, 1,
-0.8191454, 0.7079841, -0.3951665, 1, 1, 1, 1, 1,
-0.8127418, -0.2948391, -1.238453, 1, 1, 1, 1, 1,
-0.8121181, -0.2282412, -1.955274, 1, 1, 1, 1, 1,
-0.8061902, -0.6540638, -1.936821, 1, 1, 1, 1, 1,
-0.8012353, -0.0657554, -1.506631, 1, 1, 1, 1, 1,
-0.7981969, -1.621647, -3.118833, 1, 1, 1, 1, 1,
-0.7971899, 0.3061297, -2.346351, 0, 0, 1, 1, 1,
-0.7953574, 1.050381, -2.168051, 1, 0, 0, 1, 1,
-0.795302, -1.199433, -2.663815, 1, 0, 0, 1, 1,
-0.7949119, 1.342445, -1.556607, 1, 0, 0, 1, 1,
-0.7886645, -0.2781329, -2.694152, 1, 0, 0, 1, 1,
-0.7883306, -1.085388, -2.554045, 1, 0, 0, 1, 1,
-0.7860394, -0.3557515, -3.297158, 0, 0, 0, 1, 1,
-0.7681191, 0.65398, -1.065525, 0, 0, 0, 1, 1,
-0.7618606, 0.2240155, -2.457453, 0, 0, 0, 1, 1,
-0.7592301, -0.7486306, -2.383963, 0, 0, 0, 1, 1,
-0.7589871, -1.343922, -3.096677, 0, 0, 0, 1, 1,
-0.7570357, -0.5787568, -1.944161, 0, 0, 0, 1, 1,
-0.7560429, 0.6318526, -1.079703, 0, 0, 0, 1, 1,
-0.7526191, -0.3532499, -1.600368, 1, 1, 1, 1, 1,
-0.7455876, 0.01975241, -2.065208, 1, 1, 1, 1, 1,
-0.742669, 0.9982573, -1.24052, 1, 1, 1, 1, 1,
-0.7351168, 0.6609387, -1.700629, 1, 1, 1, 1, 1,
-0.734364, 0.1120909, -2.842921, 1, 1, 1, 1, 1,
-0.73413, -0.0493785, -0.7970391, 1, 1, 1, 1, 1,
-0.7340378, -1.641774, -2.235262, 1, 1, 1, 1, 1,
-0.7314605, -0.7558219, -2.763669, 1, 1, 1, 1, 1,
-0.7314575, -0.4731842, 0.2300528, 1, 1, 1, 1, 1,
-0.730721, 1.175202, 0.1454231, 1, 1, 1, 1, 1,
-0.7304102, -0.03913921, -2.563305, 1, 1, 1, 1, 1,
-0.7292052, -1.113374, -1.051722, 1, 1, 1, 1, 1,
-0.7276402, -1.922557, -3.283546, 1, 1, 1, 1, 1,
-0.7192457, -0.6049657, -0.7876196, 1, 1, 1, 1, 1,
-0.7168927, 0.2376079, -0.9740543, 1, 1, 1, 1, 1,
-0.7134031, -0.9550793, -3.287704, 0, 0, 1, 1, 1,
-0.7121102, -1.479014, -3.672233, 1, 0, 0, 1, 1,
-0.7093577, -0.4210109, -1.801807, 1, 0, 0, 1, 1,
-0.708387, -2.184195, -3.772424, 1, 0, 0, 1, 1,
-0.7028878, -0.3127273, -0.8776925, 1, 0, 0, 1, 1,
-0.6912134, -2.482594, -0.8034357, 1, 0, 0, 1, 1,
-0.6901825, -0.1388403, -1.699417, 0, 0, 0, 1, 1,
-0.6874555, -0.05258717, -1.38998, 0, 0, 0, 1, 1,
-0.6866944, -1.377445, -2.110159, 0, 0, 0, 1, 1,
-0.6841705, -0.5758947, -2.262534, 0, 0, 0, 1, 1,
-0.6810716, 0.8864791, -1.018495, 0, 0, 0, 1, 1,
-0.6678209, 0.723709, -1.109545, 0, 0, 0, 1, 1,
-0.6648468, 0.444551, -2.679069, 0, 0, 0, 1, 1,
-0.6629019, -0.5262011, -3.601762, 1, 1, 1, 1, 1,
-0.6610771, -1.186685, -1.792325, 1, 1, 1, 1, 1,
-0.6573695, 0.9345579, -0.2845852, 1, 1, 1, 1, 1,
-0.6559426, -0.1852368, -3.087988, 1, 1, 1, 1, 1,
-0.6471738, 0.6210986, -1.168261, 1, 1, 1, 1, 1,
-0.6458451, 0.6792313, -0.4976433, 1, 1, 1, 1, 1,
-0.6431183, -0.3419941, -3.379992, 1, 1, 1, 1, 1,
-0.6419809, 0.2837272, -1.908257, 1, 1, 1, 1, 1,
-0.6405444, 0.4393179, -2.415209, 1, 1, 1, 1, 1,
-0.6375407, -0.2147546, -2.426832, 1, 1, 1, 1, 1,
-0.6375268, 0.4953441, -1.141026, 1, 1, 1, 1, 1,
-0.6209875, -1.343065, -1.504471, 1, 1, 1, 1, 1,
-0.6150065, 0.7203138, -0.4105657, 1, 1, 1, 1, 1,
-0.6066529, -0.7870466, -0.9433553, 1, 1, 1, 1, 1,
-0.6036406, -0.6600599, -4.155048, 1, 1, 1, 1, 1,
-0.6011418, -1.187092, -3.756604, 0, 0, 1, 1, 1,
-0.5961419, -0.5167062, -2.203827, 1, 0, 0, 1, 1,
-0.5942847, 0.7390574, -1.85995, 1, 0, 0, 1, 1,
-0.5927876, 1.46223, -0.2323021, 1, 0, 0, 1, 1,
-0.5926567, -1.724428, -2.86104, 1, 0, 0, 1, 1,
-0.5910198, 0.8579238, -0.9367924, 1, 0, 0, 1, 1,
-0.5889427, 1.129979, -1.584794, 0, 0, 0, 1, 1,
-0.5786548, 0.6531262, -1.010129, 0, 0, 0, 1, 1,
-0.5777882, 1.574456, -0.6365206, 0, 0, 0, 1, 1,
-0.577785, -1.258603, -1.958116, 0, 0, 0, 1, 1,
-0.5773233, -1.928434, -1.910816, 0, 0, 0, 1, 1,
-0.5771394, -0.7250006, -2.348567, 0, 0, 0, 1, 1,
-0.575237, 0.607275, -0.1764368, 0, 0, 0, 1, 1,
-0.5741604, -0.6499017, -2.260257, 1, 1, 1, 1, 1,
-0.5740285, -0.4076095, -3.462123, 1, 1, 1, 1, 1,
-0.5732842, -0.7194197, -4.06205, 1, 1, 1, 1, 1,
-0.5728783, -0.07696114, -2.652427, 1, 1, 1, 1, 1,
-0.5702924, 0.7570415, 1.718118, 1, 1, 1, 1, 1,
-0.5647866, 0.4108013, -0.7115023, 1, 1, 1, 1, 1,
-0.5598601, 0.4345303, -0.377947, 1, 1, 1, 1, 1,
-0.5587057, -1.048979, -3.097597, 1, 1, 1, 1, 1,
-0.5570211, -0.3962645, -3.40304, 1, 1, 1, 1, 1,
-0.5481943, -0.6032739, -2.250374, 1, 1, 1, 1, 1,
-0.5460726, 1.359533, 1.155755, 1, 1, 1, 1, 1,
-0.5456299, -1.071532, -3.666176, 1, 1, 1, 1, 1,
-0.5455623, -1.177353, -2.834018, 1, 1, 1, 1, 1,
-0.5398185, 1.124649, -1.307861, 1, 1, 1, 1, 1,
-0.5395962, -1.227794, -3.7245, 1, 1, 1, 1, 1,
-0.5384688, -1.832851, -2.702364, 0, 0, 1, 1, 1,
-0.5314628, 1.614865, 0.3764442, 1, 0, 0, 1, 1,
-0.529849, 1.099147, -0.3235836, 1, 0, 0, 1, 1,
-0.5296904, -1.031724, -2.225161, 1, 0, 0, 1, 1,
-0.5233393, 0.09663532, -1.238386, 1, 0, 0, 1, 1,
-0.5204404, 0.1450055, -0.8104679, 1, 0, 0, 1, 1,
-0.5196553, 0.5908187, -1.704934, 0, 0, 0, 1, 1,
-0.5185437, 0.6559919, -0.6389012, 0, 0, 0, 1, 1,
-0.5179864, 1.066389, 1.358164, 0, 0, 0, 1, 1,
-0.5163308, 0.2417229, -2.262853, 0, 0, 0, 1, 1,
-0.5100909, -0.4186541, -2.998948, 0, 0, 0, 1, 1,
-0.5078739, -0.02172111, -2.32954, 0, 0, 0, 1, 1,
-0.4974772, -0.3854074, -2.269787, 0, 0, 0, 1, 1,
-0.4973424, 0.2743137, -1.050159, 1, 1, 1, 1, 1,
-0.4938374, 1.384435, 0.5830999, 1, 1, 1, 1, 1,
-0.4909557, -1.332501, -4.005524, 1, 1, 1, 1, 1,
-0.4908332, 1.146546, -0.09008757, 1, 1, 1, 1, 1,
-0.4858299, -0.6071404, -2.687377, 1, 1, 1, 1, 1,
-0.4837693, -1.603664, -3.531827, 1, 1, 1, 1, 1,
-0.4826651, 1.067276, -0.1554057, 1, 1, 1, 1, 1,
-0.4798714, 0.6265607, 0.7295246, 1, 1, 1, 1, 1,
-0.4775541, 1.841306, 1.141474, 1, 1, 1, 1, 1,
-0.4690135, 1.5177, 1.21352, 1, 1, 1, 1, 1,
-0.4672119, -0.9565987, -3.248854, 1, 1, 1, 1, 1,
-0.4661886, 0.5054889, -0.7568437, 1, 1, 1, 1, 1,
-0.4596593, -0.7967284, -0.3822656, 1, 1, 1, 1, 1,
-0.4589307, -2.064326, -2.612029, 1, 1, 1, 1, 1,
-0.4586067, -0.5924877, -1.628094, 1, 1, 1, 1, 1,
-0.4569757, 0.2777288, -1.968037, 0, 0, 1, 1, 1,
-0.4566665, -0.7998639, -4.475318, 1, 0, 0, 1, 1,
-0.455103, 0.2348959, -1.875546, 1, 0, 0, 1, 1,
-0.454406, 0.1684959, -0.3031375, 1, 0, 0, 1, 1,
-0.4537475, 0.004615565, 0.9177693, 1, 0, 0, 1, 1,
-0.45249, -0.5358998, -3.636837, 1, 0, 0, 1, 1,
-0.4514127, 0.8158285, -0.3195459, 0, 0, 0, 1, 1,
-0.4466478, 0.1278081, -0.9395133, 0, 0, 0, 1, 1,
-0.4450424, 0.07615817, -1.254456, 0, 0, 0, 1, 1,
-0.4432548, 0.01779491, -0.6270289, 0, 0, 0, 1, 1,
-0.4419954, 1.150738, -0.4275722, 0, 0, 0, 1, 1,
-0.4382336, -0.5203447, -1.836242, 0, 0, 0, 1, 1,
-0.433931, -0.2289369, -1.430654, 0, 0, 0, 1, 1,
-0.4330297, 1.318819, 0.6870916, 1, 1, 1, 1, 1,
-0.428041, 0.2931924, 1.686802, 1, 1, 1, 1, 1,
-0.4265677, -0.4054906, 0.1754014, 1, 1, 1, 1, 1,
-0.4230828, -0.03496242, -2.073042, 1, 1, 1, 1, 1,
-0.4210601, -0.7220851, -1.80758, 1, 1, 1, 1, 1,
-0.4192821, 0.1504692, -1.436924, 1, 1, 1, 1, 1,
-0.4188598, -0.6250091, -3.544413, 1, 1, 1, 1, 1,
-0.4167497, -0.01264632, -1.147396, 1, 1, 1, 1, 1,
-0.4151668, -0.3581836, -2.825088, 1, 1, 1, 1, 1,
-0.4081287, 0.4518038, -1.578019, 1, 1, 1, 1, 1,
-0.4050163, -0.2129193, -3.144329, 1, 1, 1, 1, 1,
-0.4033639, 0.603765, 1.150731, 1, 1, 1, 1, 1,
-0.4020703, -0.4915566, -1.345461, 1, 1, 1, 1, 1,
-0.4010318, -0.05275306, -2.283514, 1, 1, 1, 1, 1,
-0.3967846, -1.044207, -1.423595, 1, 1, 1, 1, 1,
-0.3946942, 0.7613804, -0.1571058, 0, 0, 1, 1, 1,
-0.391881, -0.3038569, -2.214556, 1, 0, 0, 1, 1,
-0.3898214, -1.291916, -2.774996, 1, 0, 0, 1, 1,
-0.3893979, 0.3566092, 0.199994, 1, 0, 0, 1, 1,
-0.3888083, -1.485635, -2.662764, 1, 0, 0, 1, 1,
-0.3859608, -0.6030868, -3.396198, 1, 0, 0, 1, 1,
-0.3828226, 1.055411, 0.2008458, 0, 0, 0, 1, 1,
-0.3811609, -0.5812279, -3.700384, 0, 0, 0, 1, 1,
-0.3772526, 0.906812, -2.123755, 0, 0, 0, 1, 1,
-0.3726217, -0.5758656, -3.209469, 0, 0, 0, 1, 1,
-0.37078, 0.94001, -1.208696, 0, 0, 0, 1, 1,
-0.3707307, -0.5054463, -1.969559, 0, 0, 0, 1, 1,
-0.3659856, -0.8900893, -2.544083, 0, 0, 0, 1, 1,
-0.3654242, 0.3198624, -0.4113762, 1, 1, 1, 1, 1,
-0.3649128, -0.4454476, -1.122829, 1, 1, 1, 1, 1,
-0.3592307, 1.280825, -1.973308, 1, 1, 1, 1, 1,
-0.3537778, -0.4537192, -2.755772, 1, 1, 1, 1, 1,
-0.3530568, -0.7470727, -2.557778, 1, 1, 1, 1, 1,
-0.3525093, -0.5534609, -3.266071, 1, 1, 1, 1, 1,
-0.3488219, -0.437405, -2.03416, 1, 1, 1, 1, 1,
-0.346693, -0.05059859, -1.973543, 1, 1, 1, 1, 1,
-0.3457968, 0.5659204, -0.4422844, 1, 1, 1, 1, 1,
-0.3454398, 0.6067851, 0.2987373, 1, 1, 1, 1, 1,
-0.3423289, 0.3282875, -1.083912, 1, 1, 1, 1, 1,
-0.339126, 0.3290189, -0.06159611, 1, 1, 1, 1, 1,
-0.3388024, 1.463365, -0.2210719, 1, 1, 1, 1, 1,
-0.3365271, 1.260726, 0.6085547, 1, 1, 1, 1, 1,
-0.3358566, -0.4066494, -3.246929, 1, 1, 1, 1, 1,
-0.3319131, 1.212734, -0.9559175, 0, 0, 1, 1, 1,
-0.3271459, -0.8168045, -4.489107, 1, 0, 0, 1, 1,
-0.3257197, 1.025712, 0.8886921, 1, 0, 0, 1, 1,
-0.3235407, 0.4100576, -2.541345, 1, 0, 0, 1, 1,
-0.3174201, -1.015199, -3.260515, 1, 0, 0, 1, 1,
-0.3086764, -0.3179961, -2.827883, 1, 0, 0, 1, 1,
-0.2998544, -0.01795248, -2.048356, 0, 0, 0, 1, 1,
-0.2957521, -0.8593599, -3.357728, 0, 0, 0, 1, 1,
-0.2915369, -2.351356, -3.996066, 0, 0, 0, 1, 1,
-0.2884734, -0.02902892, -2.209281, 0, 0, 0, 1, 1,
-0.2867686, -0.4271365, -2.043855, 0, 0, 0, 1, 1,
-0.2852081, -1.426738, -4.749465, 0, 0, 0, 1, 1,
-0.2804916, 1.236255, 0.07451447, 0, 0, 0, 1, 1,
-0.2689368, 0.6716563, -2.735361, 1, 1, 1, 1, 1,
-0.2685251, 1.145044, -0.7594879, 1, 1, 1, 1, 1,
-0.2678053, 0.9301107, 0.3707984, 1, 1, 1, 1, 1,
-0.2665193, 1.877312, -1.083461, 1, 1, 1, 1, 1,
-0.2635338, 1.012755, -0.2452689, 1, 1, 1, 1, 1,
-0.2557471, 1.970981, -0.5062919, 1, 1, 1, 1, 1,
-0.253108, 0.8276457, -1.510496, 1, 1, 1, 1, 1,
-0.2496307, -0.1197385, -2.814102, 1, 1, 1, 1, 1,
-0.2484194, 0.7139741, -0.5913057, 1, 1, 1, 1, 1,
-0.2480561, -0.3720177, -1.942902, 1, 1, 1, 1, 1,
-0.2404336, -0.2851091, -2.196816, 1, 1, 1, 1, 1,
-0.2379729, -0.7401994, -1.486763, 1, 1, 1, 1, 1,
-0.2359704, -0.5990568, -4.075108, 1, 1, 1, 1, 1,
-0.2339084, 0.4039958, -0.8936022, 1, 1, 1, 1, 1,
-0.2337677, 2.013154, -0.2358936, 1, 1, 1, 1, 1,
-0.2315848, -0.8599021, -3.49598, 0, 0, 1, 1, 1,
-0.2314484, 0.4329159, -1.734149, 1, 0, 0, 1, 1,
-0.2207623, -0.6490045, -2.566398, 1, 0, 0, 1, 1,
-0.2197093, 1.055011, -1.296393, 1, 0, 0, 1, 1,
-0.2194384, 1.063433, -0.2019268, 1, 0, 0, 1, 1,
-0.21918, -0.6584707, -3.974482, 1, 0, 0, 1, 1,
-0.2171496, 0.4073314, -0.2500516, 0, 0, 0, 1, 1,
-0.2148455, -0.6219491, -3.470174, 0, 0, 0, 1, 1,
-0.2131812, 1.577937, -1.393968, 0, 0, 0, 1, 1,
-0.2026951, 0.7915691, -0.3281268, 0, 0, 0, 1, 1,
-0.197695, 2.057733, -0.2461816, 0, 0, 0, 1, 1,
-0.1974867, 0.8141008, -0.543039, 0, 0, 0, 1, 1,
-0.1940518, 0.02057907, -1.529864, 0, 0, 0, 1, 1,
-0.1914106, 0.3765271, 0.2137195, 1, 1, 1, 1, 1,
-0.188751, -1.022722, -1.101047, 1, 1, 1, 1, 1,
-0.1835186, -0.8131437, -3.908887, 1, 1, 1, 1, 1,
-0.1825009, 2.02538, 0.1720184, 1, 1, 1, 1, 1,
-0.1803941, 0.4591224, -1.581675, 1, 1, 1, 1, 1,
-0.1793635, -0.8907903, -2.240243, 1, 1, 1, 1, 1,
-0.1775547, -0.2798255, -4.05177, 1, 1, 1, 1, 1,
-0.1753992, 1.906433, -1.089734, 1, 1, 1, 1, 1,
-0.1724139, 1.231468, -0.1047837, 1, 1, 1, 1, 1,
-0.1693565, 1.517694, 0.9387337, 1, 1, 1, 1, 1,
-0.169074, -0.05233515, -2.395812, 1, 1, 1, 1, 1,
-0.1675555, 0.1699571, -1.95695, 1, 1, 1, 1, 1,
-0.1634663, 1.922001, -1.649704, 1, 1, 1, 1, 1,
-0.162443, -0.3233725, -2.277684, 1, 1, 1, 1, 1,
-0.1609195, -0.5929726, -4.278867, 1, 1, 1, 1, 1,
-0.1582718, -1.141051, -2.993669, 0, 0, 1, 1, 1,
-0.1581795, -1.325191, -2.402388, 1, 0, 0, 1, 1,
-0.1562385, -0.8708485, -0.9132433, 1, 0, 0, 1, 1,
-0.1559084, 0.3256421, -1.523106, 1, 0, 0, 1, 1,
-0.1555658, -0.5259876, -1.376336, 1, 0, 0, 1, 1,
-0.1554183, -0.8859997, -2.460403, 1, 0, 0, 1, 1,
-0.1486451, 0.9465299, -1.477785, 0, 0, 0, 1, 1,
-0.1480362, -1.835776, -2.240235, 0, 0, 0, 1, 1,
-0.1478241, -0.6119109, -4.197797, 0, 0, 0, 1, 1,
-0.1458323, 1.814948, -0.4427811, 0, 0, 0, 1, 1,
-0.1456398, -0.09460893, 0.4445493, 0, 0, 0, 1, 1,
-0.1450893, -0.2395639, -0.1903054, 0, 0, 0, 1, 1,
-0.1449769, -0.0190289, -2.088127, 0, 0, 0, 1, 1,
-0.144122, 0.9327686, -0.4247445, 1, 1, 1, 1, 1,
-0.1413275, 1.455493, -0.4837111, 1, 1, 1, 1, 1,
-0.1387554, 0.9963065, -0.7299135, 1, 1, 1, 1, 1,
-0.1379566, -0.9587422, -1.511893, 1, 1, 1, 1, 1,
-0.1351726, -2.185745, -3.494113, 1, 1, 1, 1, 1,
-0.1349398, -0.6330399, -2.917998, 1, 1, 1, 1, 1,
-0.1341708, -0.5069253, -2.658352, 1, 1, 1, 1, 1,
-0.1339268, 0.1984224, -0.9792433, 1, 1, 1, 1, 1,
-0.1308451, -1.864663, -5.788801, 1, 1, 1, 1, 1,
-0.1306038, -1.642886, -4.751017, 1, 1, 1, 1, 1,
-0.1270634, -0.2615379, -4.944055, 1, 1, 1, 1, 1,
-0.1263104, -0.7260033, -3.353261, 1, 1, 1, 1, 1,
-0.1238251, -0.8387359, -3.067994, 1, 1, 1, 1, 1,
-0.1232191, 0.4275057, -1.255306, 1, 1, 1, 1, 1,
-0.1212416, -0.02610881, -2.795904, 1, 1, 1, 1, 1,
-0.1198575, -0.06866084, -3.087108, 0, 0, 1, 1, 1,
-0.119526, -1.276969, -3.987503, 1, 0, 0, 1, 1,
-0.1134779, -0.2813909, -1.751576, 1, 0, 0, 1, 1,
-0.1126795, 1.334969, -0.7808967, 1, 0, 0, 1, 1,
-0.1085025, -2.421268, -1.508509, 1, 0, 0, 1, 1,
-0.1068986, -1.070463, -1.808917, 1, 0, 0, 1, 1,
-0.1052739, 0.590382, 0.2816181, 0, 0, 0, 1, 1,
-0.1033714, -2.181912, -2.187146, 0, 0, 0, 1, 1,
-0.1010176, 0.4938515, 0.4349589, 0, 0, 0, 1, 1,
-0.09924331, 0.4238807, 1.283343, 0, 0, 0, 1, 1,
-0.09910633, 1.406529, 0.8741274, 0, 0, 0, 1, 1,
-0.09403214, -1.351779, -3.005038, 0, 0, 0, 1, 1,
-0.09270265, 0.6223513, -1.331461, 0, 0, 0, 1, 1,
-0.09265395, 0.841727, -0.6913427, 1, 1, 1, 1, 1,
-0.09157369, -2.508757, -3.595786, 1, 1, 1, 1, 1,
-0.09099838, 1.170978, 1.298846, 1, 1, 1, 1, 1,
-0.09058493, -1.394441, -2.122393, 1, 1, 1, 1, 1,
-0.08890872, -0.1143172, -2.45826, 1, 1, 1, 1, 1,
-0.08793977, 0.4514658, 1.199567, 1, 1, 1, 1, 1,
-0.08711379, -0.2329067, -4.083161, 1, 1, 1, 1, 1,
-0.08652422, 0.3344205, -0.4246807, 1, 1, 1, 1, 1,
-0.085086, 1.501474, -0.2683786, 1, 1, 1, 1, 1,
-0.07918758, -0.1165499, -2.136691, 1, 1, 1, 1, 1,
-0.07559498, 0.5222778, -0.5086825, 1, 1, 1, 1, 1,
-0.07548091, 1.691034, -0.4612971, 1, 1, 1, 1, 1,
-0.07073806, -0.6326995, -2.811337, 1, 1, 1, 1, 1,
-0.06963287, 0.5798636, -0.7990421, 1, 1, 1, 1, 1,
-0.06746999, 1.224427, 0.6520778, 1, 1, 1, 1, 1,
-0.06623052, 1.518705, 0.1435272, 0, 0, 1, 1, 1,
-0.06493238, 1.07909, -0.149342, 1, 0, 0, 1, 1,
-0.06388345, -0.1803734, -3.536213, 1, 0, 0, 1, 1,
-0.06210532, -0.3881396, -2.262133, 1, 0, 0, 1, 1,
-0.06155374, 0.8023219, -0.1654224, 1, 0, 0, 1, 1,
-0.06056292, 0.6841976, -2.391599, 1, 0, 0, 1, 1,
-0.04382226, 0.9363732, 0.1059583, 0, 0, 0, 1, 1,
-0.04293275, 0.3613813, 0.4113765, 0, 0, 0, 1, 1,
-0.04075954, -0.8020417, -5.217596, 0, 0, 0, 1, 1,
-0.03932256, 1.162847, -1.956183, 0, 0, 0, 1, 1,
-0.03706191, -0.1258487, -2.566272, 0, 0, 0, 1, 1,
-0.02956606, 0.7133837, -0.847393, 0, 0, 0, 1, 1,
-0.0285801, -1.10108, -4.232933, 0, 0, 0, 1, 1,
-0.0229274, -2.00252, -2.320822, 1, 1, 1, 1, 1,
-0.02130978, -0.8571631, -2.298276, 1, 1, 1, 1, 1,
-0.02019623, 0.4661836, -0.07489935, 1, 1, 1, 1, 1,
-0.01953241, 1.005588, -2.674126, 1, 1, 1, 1, 1,
-0.01880534, 0.2647125, -0.4506856, 1, 1, 1, 1, 1,
-0.01464074, -1.747466, -3.059884, 1, 1, 1, 1, 1,
-0.01136761, 0.06614263, 0.6796689, 1, 1, 1, 1, 1,
-0.009325996, 2.727019, 0.3209087, 1, 1, 1, 1, 1,
-0.008041769, -0.2111094, -2.830797, 1, 1, 1, 1, 1,
-0.007651097, 2.261412, 1.027818, 1, 1, 1, 1, 1,
-0.005891224, -0.3573289, -2.134477, 1, 1, 1, 1, 1,
-0.004997396, -0.1789346, -2.861876, 1, 1, 1, 1, 1,
0.001157995, -0.05363925, 4.76415, 1, 1, 1, 1, 1,
0.001746521, -0.7172927, 2.037938, 1, 1, 1, 1, 1,
0.006854028, -0.07248116, 2.791388, 1, 1, 1, 1, 1,
0.007699194, -0.5272536, 2.667736, 0, 0, 1, 1, 1,
0.01125875, -1.131555, 2.688702, 1, 0, 0, 1, 1,
0.01480922, -0.6282479, 2.620429, 1, 0, 0, 1, 1,
0.01654073, -1.492404, 2.088324, 1, 0, 0, 1, 1,
0.01655665, 1.883942, 0.07220004, 1, 0, 0, 1, 1,
0.02006373, -3.038013, 0.9419098, 1, 0, 0, 1, 1,
0.02041045, -0.2526153, 2.180012, 0, 0, 0, 1, 1,
0.0259312, 0.3942908, 2.354787, 0, 0, 0, 1, 1,
0.02934169, -0.5047003, 3.153798, 0, 0, 0, 1, 1,
0.03067842, 0.1819669, -0.4756398, 0, 0, 0, 1, 1,
0.03072071, 0.6041251, -1.006675, 0, 0, 0, 1, 1,
0.03176669, 1.953141, -0.6996508, 0, 0, 0, 1, 1,
0.03310742, 1.084187, -0.6483934, 0, 0, 0, 1, 1,
0.03365717, 0.4504565, -0.7025105, 1, 1, 1, 1, 1,
0.04013032, -1.265339, 4.066953, 1, 1, 1, 1, 1,
0.0429597, 0.06975146, 0.7301069, 1, 1, 1, 1, 1,
0.04337715, 1.219424, -0.9516693, 1, 1, 1, 1, 1,
0.05022666, 0.05752157, 2.253191, 1, 1, 1, 1, 1,
0.05317869, 0.7276692, 0.9113981, 1, 1, 1, 1, 1,
0.05698203, -0.6168686, 2.945721, 1, 1, 1, 1, 1,
0.07656468, 0.3876378, 2.369299, 1, 1, 1, 1, 1,
0.08260279, -0.2609976, 2.485379, 1, 1, 1, 1, 1,
0.08566504, -1.019762, 3.770581, 1, 1, 1, 1, 1,
0.08831283, 0.3493598, 0.02685072, 1, 1, 1, 1, 1,
0.08928335, 1.145972, 1.076254, 1, 1, 1, 1, 1,
0.09289971, 0.6563668, -0.6196451, 1, 1, 1, 1, 1,
0.09426678, 1.127654, 1.637227, 1, 1, 1, 1, 1,
0.09452943, 0.7656516, -0.5370586, 1, 1, 1, 1, 1,
0.1021747, -0.0605859, 3.666764, 0, 0, 1, 1, 1,
0.1041772, 1.509477, -0.3276881, 1, 0, 0, 1, 1,
0.1048711, -2.001174, 2.655465, 1, 0, 0, 1, 1,
0.1057198, -1.92462, 4.437303, 1, 0, 0, 1, 1,
0.1071998, -0.3208107, 1.59657, 1, 0, 0, 1, 1,
0.1080118, -0.1280067, 3.59288, 1, 0, 0, 1, 1,
0.1159596, 0.5465456, 0.3933663, 0, 0, 0, 1, 1,
0.1278704, 0.5797485, 0.2165376, 0, 0, 0, 1, 1,
0.1287979, 0.44132, 0.1239949, 0, 0, 0, 1, 1,
0.1303701, 0.06469256, 1.448228, 0, 0, 0, 1, 1,
0.132069, 1.64572, -0.7821727, 0, 0, 0, 1, 1,
0.1338016, -0.9141381, 4.09118, 0, 0, 0, 1, 1,
0.1353536, -0.9448268, 2.629282, 0, 0, 0, 1, 1,
0.1355522, 0.3158065, -0.09807547, 1, 1, 1, 1, 1,
0.1447413, 0.91977, -1.182989, 1, 1, 1, 1, 1,
0.1461489, 0.0003477357, 0.8422197, 1, 1, 1, 1, 1,
0.1489409, 1.080744, 1.705671, 1, 1, 1, 1, 1,
0.1493083, -0.1474958, 3.164577, 1, 1, 1, 1, 1,
0.1508493, 0.70161, 0.864281, 1, 1, 1, 1, 1,
0.1518987, -2.054487, 4.393314, 1, 1, 1, 1, 1,
0.1519494, 1.626034, -0.3651961, 1, 1, 1, 1, 1,
0.1525455, 1.061224, 1.136629, 1, 1, 1, 1, 1,
0.1533615, 0.2937954, -0.3796237, 1, 1, 1, 1, 1,
0.1543676, -0.2632755, 2.543071, 1, 1, 1, 1, 1,
0.1558774, 1.232094, 0.45146, 1, 1, 1, 1, 1,
0.1627022, 1.855771, 0.3365029, 1, 1, 1, 1, 1,
0.1628711, -0.2603327, 3.834548, 1, 1, 1, 1, 1,
0.1631128, 0.0963941, -1.090058, 1, 1, 1, 1, 1,
0.1678205, -0.3558385, 2.209373, 0, 0, 1, 1, 1,
0.1699976, -2.775959, 2.08814, 1, 0, 0, 1, 1,
0.1704686, 0.9820676, -0.6582644, 1, 0, 0, 1, 1,
0.1743261, -0.3995239, 2.424215, 1, 0, 0, 1, 1,
0.1777554, -0.9663314, 3.684163, 1, 0, 0, 1, 1,
0.1779644, 0.7522479, 0.4969849, 1, 0, 0, 1, 1,
0.1779684, 0.08834346, 1.389995, 0, 0, 0, 1, 1,
0.1787814, -1.00011, 3.702486, 0, 0, 0, 1, 1,
0.1797315, 0.2218121, 0.5064166, 0, 0, 0, 1, 1,
0.1861978, 0.1952346, 0.1816339, 0, 0, 0, 1, 1,
0.1866552, 1.117193, -0.6047394, 0, 0, 0, 1, 1,
0.1904481, 1.387739, -1.171775, 0, 0, 0, 1, 1,
0.1922922, 1.13688, 0.7674357, 0, 0, 0, 1, 1,
0.193553, -1.827996, 2.39842, 1, 1, 1, 1, 1,
0.1983123, -0.7867022, 2.496976, 1, 1, 1, 1, 1,
0.2025144, -1.363671, 1.156346, 1, 1, 1, 1, 1,
0.2037645, 0.1676669, 0.6765831, 1, 1, 1, 1, 1,
0.2052685, -1.062016, 1.691705, 1, 1, 1, 1, 1,
0.2077271, 0.293777, -0.6739749, 1, 1, 1, 1, 1,
0.2093728, -0.3102161, 1.576131, 1, 1, 1, 1, 1,
0.2105827, 0.3128164, 0.5883977, 1, 1, 1, 1, 1,
0.2125341, -0.4145918, 2.900586, 1, 1, 1, 1, 1,
0.2125343, 2.829106, -0.7540023, 1, 1, 1, 1, 1,
0.2166432, -0.6524245, 3.286486, 1, 1, 1, 1, 1,
0.2193145, 0.09897501, -1.014923, 1, 1, 1, 1, 1,
0.2206801, -0.5242339, 0.5178512, 1, 1, 1, 1, 1,
0.2314056, -1.209292, 3.168342, 1, 1, 1, 1, 1,
0.2317945, 0.3543785, 0.7984994, 1, 1, 1, 1, 1,
0.2323144, 0.5308881, -0.008100436, 0, 0, 1, 1, 1,
0.2332014, -0.6411552, 2.61789, 1, 0, 0, 1, 1,
0.2343343, -1.85109, 4.854929, 1, 0, 0, 1, 1,
0.2357214, -0.8550859, 1.246567, 1, 0, 0, 1, 1,
0.2361747, -0.9671094, 3.01239, 1, 0, 0, 1, 1,
0.2410286, -2.018757, 4.530124, 1, 0, 0, 1, 1,
0.2456533, 0.02488165, 2.885921, 0, 0, 0, 1, 1,
0.2485277, -1.727204, 3.246805, 0, 0, 0, 1, 1,
0.2522819, 1.946991, -0.7507651, 0, 0, 0, 1, 1,
0.2523139, -1.708975, 3.242956, 0, 0, 0, 1, 1,
0.2525639, 0.3408386, 0.8240211, 0, 0, 0, 1, 1,
0.2531138, 1.487922, 0.2149082, 0, 0, 0, 1, 1,
0.2565095, -0.3934402, 2.515627, 0, 0, 0, 1, 1,
0.2654942, -0.4610264, 1.052385, 1, 1, 1, 1, 1,
0.2655098, 1.009586, 0.6265938, 1, 1, 1, 1, 1,
0.2658268, -0.4449673, 1.977325, 1, 1, 1, 1, 1,
0.2671432, -0.5687701, 3.317191, 1, 1, 1, 1, 1,
0.2704041, 0.1711106, 0.9833289, 1, 1, 1, 1, 1,
0.27422, -0.1572628, 2.391242, 1, 1, 1, 1, 1,
0.2796664, -2.689084, 3.104289, 1, 1, 1, 1, 1,
0.2821175, -0.7923652, 3.740075, 1, 1, 1, 1, 1,
0.282894, 0.3074468, 0.9674089, 1, 1, 1, 1, 1,
0.2837492, -0.3469652, 1.497503, 1, 1, 1, 1, 1,
0.2841979, -2.129548, 3.963043, 1, 1, 1, 1, 1,
0.2882596, 1.331809, -0.8356254, 1, 1, 1, 1, 1,
0.2902808, 1.802592, -0.9007782, 1, 1, 1, 1, 1,
0.2903239, -0.7151136, 4.096865, 1, 1, 1, 1, 1,
0.2906023, -0.1767384, 0.610872, 1, 1, 1, 1, 1,
0.2920018, 0.30656, -0.5623633, 0, 0, 1, 1, 1,
0.2935883, -2.107961, 3.452191, 1, 0, 0, 1, 1,
0.2937188, 0.6450482, -0.268767, 1, 0, 0, 1, 1,
0.3008157, -0.8463379, 2.503712, 1, 0, 0, 1, 1,
0.3009292, -0.2749324, 3.672661, 1, 0, 0, 1, 1,
0.3044114, -1.45603, 3.825611, 1, 0, 0, 1, 1,
0.3048775, 0.6939369, -0.5684673, 0, 0, 0, 1, 1,
0.3079097, -0.5238603, 1.718009, 0, 0, 0, 1, 1,
0.3083414, -1.048504, 1.545181, 0, 0, 0, 1, 1,
0.3085038, -1.143072, 3.28604, 0, 0, 0, 1, 1,
0.3086589, 0.3566536, 1.226157, 0, 0, 0, 1, 1,
0.31139, -0.8325939, 2.813888, 0, 0, 0, 1, 1,
0.3118359, 1.505558, 1.364504, 0, 0, 0, 1, 1,
0.3122247, -1.439524, 3.526445, 1, 1, 1, 1, 1,
0.318808, -1.123537, 2.695876, 1, 1, 1, 1, 1,
0.3238864, 0.03871711, 2.312015, 1, 1, 1, 1, 1,
0.3244047, -1.667794, 2.623357, 1, 1, 1, 1, 1,
0.3260564, 0.02833731, 3.384839, 1, 1, 1, 1, 1,
0.3268797, -0.04223204, 1.428997, 1, 1, 1, 1, 1,
0.3298298, -0.5646272, 0.587664, 1, 1, 1, 1, 1,
0.3348911, -0.1873218, 1.310092, 1, 1, 1, 1, 1,
0.3446606, 1.439202, 1.328471, 1, 1, 1, 1, 1,
0.344851, -0.6413223, 2.866055, 1, 1, 1, 1, 1,
0.3561871, -0.6100101, 2.13195, 1, 1, 1, 1, 1,
0.3566477, 1.191718, -0.9516109, 1, 1, 1, 1, 1,
0.3592092, 1.579435, 0.7576043, 1, 1, 1, 1, 1,
0.3598342, -0.86583, 1.894567, 1, 1, 1, 1, 1,
0.3604168, 1.068284, 1.090851, 1, 1, 1, 1, 1,
0.3713821, 0.6685459, -0.1378348, 0, 0, 1, 1, 1,
0.3744609, 1.361485, -2.089858, 1, 0, 0, 1, 1,
0.3758984, 0.01973644, 1.142507, 1, 0, 0, 1, 1,
0.381255, -0.902256, 2.692776, 1, 0, 0, 1, 1,
0.3835801, 1.00244, 1.425644, 1, 0, 0, 1, 1,
0.3842809, -0.03730487, 0.3453645, 1, 0, 0, 1, 1,
0.3844917, -0.07581975, 0.7783139, 0, 0, 0, 1, 1,
0.3881348, -0.3434738, 2.688439, 0, 0, 0, 1, 1,
0.3881629, -2.046321, 1.649121, 0, 0, 0, 1, 1,
0.3931954, -0.7881953, 3.707299, 0, 0, 0, 1, 1,
0.394243, 0.06979756, 0.2434618, 0, 0, 0, 1, 1,
0.4107499, -1.242779, 2.697331, 0, 0, 0, 1, 1,
0.4133283, 0.9217922, 0.6966155, 0, 0, 0, 1, 1,
0.4153262, 1.117161, -1.846264, 1, 1, 1, 1, 1,
0.4156596, -0.4603069, 1.690957, 1, 1, 1, 1, 1,
0.4161601, -0.01585188, 0.6004112, 1, 1, 1, 1, 1,
0.4167354, -0.9018222, 2.025839, 1, 1, 1, 1, 1,
0.4227216, -0.003830279, 1.549977, 1, 1, 1, 1, 1,
0.4243782, -2.172591, 1.194274, 1, 1, 1, 1, 1,
0.4257172, 0.2509325, 1.14545, 1, 1, 1, 1, 1,
0.4342481, -0.1862049, 1.281225, 1, 1, 1, 1, 1,
0.4399031, -1.918678, 5.956121, 1, 1, 1, 1, 1,
0.4407593, -2.044862, 1.06075, 1, 1, 1, 1, 1,
0.4418504, 1.905012, 0.4158982, 1, 1, 1, 1, 1,
0.4429214, -1.010742, 1.627516, 1, 1, 1, 1, 1,
0.4594029, -0.229803, 2.711896, 1, 1, 1, 1, 1,
0.4600744, -1.007767, 4.38729, 1, 1, 1, 1, 1,
0.4626987, -0.1080784, 2.309791, 1, 1, 1, 1, 1,
0.4659052, -1.62122, 4.038192, 0, 0, 1, 1, 1,
0.4713848, -0.8920799, 3.716449, 1, 0, 0, 1, 1,
0.4762137, 0.3855392, -1.09691, 1, 0, 0, 1, 1,
0.476715, 1.339287, 0.156363, 1, 0, 0, 1, 1,
0.4789312, 0.6318718, 1.292387, 1, 0, 0, 1, 1,
0.4800582, 1.21038, -1.370322, 1, 0, 0, 1, 1,
0.4806681, 1.692453, -0.9754575, 0, 0, 0, 1, 1,
0.4849201, 0.4287811, -0.4132183, 0, 0, 0, 1, 1,
0.4905335, 1.52341, 0.6837982, 0, 0, 0, 1, 1,
0.4946395, -2.072359, 3.080235, 0, 0, 0, 1, 1,
0.497417, -0.6392881, 0.5112566, 0, 0, 0, 1, 1,
0.5001799, -1.005648, 3.603255, 0, 0, 0, 1, 1,
0.5041773, 0.9220146, 3.448143, 0, 0, 0, 1, 1,
0.5112444, -0.1812065, 3.115283, 1, 1, 1, 1, 1,
0.5126674, -0.3031823, 1.167556, 1, 1, 1, 1, 1,
0.514793, -0.4060006, 1.977393, 1, 1, 1, 1, 1,
0.5179284, -0.6760882, 3.231394, 1, 1, 1, 1, 1,
0.5186949, 0.07890613, -0.7154582, 1, 1, 1, 1, 1,
0.5201756, -0.2845253, 2.794871, 1, 1, 1, 1, 1,
0.5369269, -1.008302, 2.962341, 1, 1, 1, 1, 1,
0.5393622, 1.232516, -0.6708593, 1, 1, 1, 1, 1,
0.550562, -0.4351996, 1.296121, 1, 1, 1, 1, 1,
0.5540991, 0.1573049, 0.08157545, 1, 1, 1, 1, 1,
0.5543587, 1.042238, 1.253865, 1, 1, 1, 1, 1,
0.5557932, 0.6423048, -0.13679, 1, 1, 1, 1, 1,
0.5603099, -1.320201, 0.7258933, 1, 1, 1, 1, 1,
0.565482, 0.3903463, 1.348008, 1, 1, 1, 1, 1,
0.5670485, 0.8414851, 0.5724782, 1, 1, 1, 1, 1,
0.5684801, 0.05622805, 0.2462859, 0, 0, 1, 1, 1,
0.5684853, 0.495573, 0.3432992, 1, 0, 0, 1, 1,
0.5686566, 0.9957071, 0.07639005, 1, 0, 0, 1, 1,
0.5702254, 1.529239, 0.1928596, 1, 0, 0, 1, 1,
0.5708431, -1.196501, 3.359656, 1, 0, 0, 1, 1,
0.5748841, 0.291921, 1.287089, 1, 0, 0, 1, 1,
0.5763106, 0.09315439, 0.7824814, 0, 0, 0, 1, 1,
0.5771752, -0.1003883, 2.187849, 0, 0, 0, 1, 1,
0.5791599, 0.9930935, 1.258887, 0, 0, 0, 1, 1,
0.5799621, -0.8793568, 3.895677, 0, 0, 0, 1, 1,
0.5846389, 0.9040977, 0.8795501, 0, 0, 0, 1, 1,
0.5848761, -1.360399, 2.328753, 0, 0, 0, 1, 1,
0.5876313, 0.6701989, 1.330394, 0, 0, 0, 1, 1,
0.5885412, 0.005188981, 3.238023, 1, 1, 1, 1, 1,
0.5987764, 0.3812579, 1.615555, 1, 1, 1, 1, 1,
0.6040311, 0.3351083, -0.08440597, 1, 1, 1, 1, 1,
0.6085833, -0.5450074, 2.221283, 1, 1, 1, 1, 1,
0.609957, -1.316908, 5.100029, 1, 1, 1, 1, 1,
0.6111569, 1.850112, -0.3256968, 1, 1, 1, 1, 1,
0.612931, 0.4945209, 0.2477859, 1, 1, 1, 1, 1,
0.6185305, 1.004406, 1.049991, 1, 1, 1, 1, 1,
0.6187106, -0.2045252, 1.928404, 1, 1, 1, 1, 1,
0.6199801, -0.252408, 1.486358, 1, 1, 1, 1, 1,
0.621069, 0.3062317, 0.6481486, 1, 1, 1, 1, 1,
0.6245917, 1.290027, 0.06666838, 1, 1, 1, 1, 1,
0.6246955, 0.8011369, -0.6368702, 1, 1, 1, 1, 1,
0.6309608, 0.0004091764, 1.028389, 1, 1, 1, 1, 1,
0.632663, 1.683156, 1.280867, 1, 1, 1, 1, 1,
0.6374958, -0.2280303, 1.494901, 0, 0, 1, 1, 1,
0.6417482, -1.850831, 2.428945, 1, 0, 0, 1, 1,
0.6444554, 0.6001874, -0.05165635, 1, 0, 0, 1, 1,
0.6470522, -1.086545, 1.313923, 1, 0, 0, 1, 1,
0.6495533, 0.4789152, -0.6957164, 1, 0, 0, 1, 1,
0.6520713, 0.2358555, 0.8101968, 1, 0, 0, 1, 1,
0.6635657, -0.61159, 1.636631, 0, 0, 0, 1, 1,
0.6654774, 0.03131774, 0.6997371, 0, 0, 0, 1, 1,
0.667174, 1.123723, -1.222886, 0, 0, 0, 1, 1,
0.668139, 0.9251087, 2.741706, 0, 0, 0, 1, 1,
0.6694166, -0.4345437, 4.040544, 0, 0, 0, 1, 1,
0.6709455, -0.1653451, 1.952793, 0, 0, 0, 1, 1,
0.6745012, -0.09488376, 2.687085, 0, 0, 0, 1, 1,
0.6776114, 1.645557, 1.091668, 1, 1, 1, 1, 1,
0.6786832, 1.04708, 2.780455, 1, 1, 1, 1, 1,
0.6863211, 1.261839, -0.3632454, 1, 1, 1, 1, 1,
0.6895023, -0.1449513, 1.962635, 1, 1, 1, 1, 1,
0.6977146, 0.6147152, -0.8118969, 1, 1, 1, 1, 1,
0.6981006, -2.251453, 2.361708, 1, 1, 1, 1, 1,
0.6987257, 0.9447652, 0.7557365, 1, 1, 1, 1, 1,
0.7026484, -1.546037, 1.543291, 1, 1, 1, 1, 1,
0.7063832, -0.8427823, 2.293422, 1, 1, 1, 1, 1,
0.7066333, -0.5127532, 1.493213, 1, 1, 1, 1, 1,
0.7081125, 0.2853633, 1.694926, 1, 1, 1, 1, 1,
0.723142, -0.7834874, 3.565057, 1, 1, 1, 1, 1,
0.7293722, 1.969059, -1.094211, 1, 1, 1, 1, 1,
0.7312921, 1.565124, 3.144908, 1, 1, 1, 1, 1,
0.7332427, 0.3053924, 2.018076, 1, 1, 1, 1, 1,
0.7356311, -0.5115008, 2.303988, 0, 0, 1, 1, 1,
0.7360451, 1.80997, -0.3643528, 1, 0, 0, 1, 1,
0.7422604, -1.022025, 2.578226, 1, 0, 0, 1, 1,
0.7517148, -0.01996505, 1.620864, 1, 0, 0, 1, 1,
0.7531024, 0.4473631, 0.4978982, 1, 0, 0, 1, 1,
0.7567961, 0.2649057, 0.2160771, 1, 0, 0, 1, 1,
0.762392, 0.1695588, 0.8965278, 0, 0, 0, 1, 1,
0.7664835, -1.165602, 3.417188, 0, 0, 0, 1, 1,
0.7670398, 0.8720803, -1.127416, 0, 0, 0, 1, 1,
0.7690737, 0.5820436, 1.333597, 0, 0, 0, 1, 1,
0.7751475, -1.009322, 3.138476, 0, 0, 0, 1, 1,
0.7795888, 0.7986233, 1.839459, 0, 0, 0, 1, 1,
0.7927049, 0.5965729, 0.6520847, 0, 0, 0, 1, 1,
0.7943562, 1.371476, -0.4637673, 1, 1, 1, 1, 1,
0.7951958, -0.4071017, 2.803028, 1, 1, 1, 1, 1,
0.8063237, -2.767579, 1.834164, 1, 1, 1, 1, 1,
0.8082851, 0.1221579, 0.9015293, 1, 1, 1, 1, 1,
0.8191189, 0.3434106, 0.5849017, 1, 1, 1, 1, 1,
0.8231922, 0.6895344, 0.3583876, 1, 1, 1, 1, 1,
0.8330553, 0.5284227, 0.9064162, 1, 1, 1, 1, 1,
0.8368806, -2.673216, 2.342736, 1, 1, 1, 1, 1,
0.8377648, -1.783903, 2.021502, 1, 1, 1, 1, 1,
0.838957, 1.562956, 0.5083735, 1, 1, 1, 1, 1,
0.8415104, 0.2530515, 0.8334031, 1, 1, 1, 1, 1,
0.8483446, -1.215858, 2.56271, 1, 1, 1, 1, 1,
0.8542991, -1.40901, 1.256609, 1, 1, 1, 1, 1,
0.8554439, -0.5189538, 1.427258, 1, 1, 1, 1, 1,
0.8628489, -0.7479832, 1.008646, 1, 1, 1, 1, 1,
0.8672652, 1.537112, 0.2886223, 0, 0, 1, 1, 1,
0.867508, -1.761386, 3.21205, 1, 0, 0, 1, 1,
0.8681951, 0.2733653, 1.252146, 1, 0, 0, 1, 1,
0.8684598, -0.4723356, 0.8155838, 1, 0, 0, 1, 1,
0.8686616, 0.1499701, 0.6822944, 1, 0, 0, 1, 1,
0.870176, 0.1418877, 0.3100193, 1, 0, 0, 1, 1,
0.8747422, -0.3671964, 3.990973, 0, 0, 0, 1, 1,
0.8747569, -1.257713, 3.330337, 0, 0, 0, 1, 1,
0.8770573, 0.7963241, 3.103115, 0, 0, 0, 1, 1,
0.8813627, 0.6618611, 1.066705, 0, 0, 0, 1, 1,
0.8852772, -1.54944, 2.985767, 0, 0, 0, 1, 1,
0.8896685, -0.1964588, 1.058853, 0, 0, 0, 1, 1,
0.890171, -1.924046, 1.279789, 0, 0, 0, 1, 1,
0.8914628, -1.782204, 2.289693, 1, 1, 1, 1, 1,
0.8919843, 1.446004, 2.211454, 1, 1, 1, 1, 1,
0.9001207, -1.068285, 2.79899, 1, 1, 1, 1, 1,
0.9065005, 0.8723568, 1.623756, 1, 1, 1, 1, 1,
0.9075077, -0.5947325, 1.386534, 1, 1, 1, 1, 1,
0.9145212, 0.3821093, 1.02084, 1, 1, 1, 1, 1,
0.9201975, 0.3859204, 0.9679679, 1, 1, 1, 1, 1,
0.9224558, 1.404294, 0.4180144, 1, 1, 1, 1, 1,
0.9374684, 0.06402116, 2.324319, 1, 1, 1, 1, 1,
0.9392818, 0.6409754, 2.687553, 1, 1, 1, 1, 1,
0.9532369, -0.7796816, 1.975441, 1, 1, 1, 1, 1,
0.9584169, 0.9066082, -0.7781627, 1, 1, 1, 1, 1,
0.9587071, 0.1306224, 2.117156, 1, 1, 1, 1, 1,
0.9594768, 0.4986747, -0.5131713, 1, 1, 1, 1, 1,
0.9684597, 0.6450154, 0.4415746, 1, 1, 1, 1, 1,
0.9811687, -0.5391087, 0.9865506, 0, 0, 1, 1, 1,
0.9812682, -0.1262294, 1.851007, 1, 0, 0, 1, 1,
0.9828861, -1.064223, 2.643581, 1, 0, 0, 1, 1,
0.986715, -1.336104, 1.977829, 1, 0, 0, 1, 1,
0.9879962, -1.665671, 1.552559, 1, 0, 0, 1, 1,
0.9887336, 0.1932666, 0.3257992, 1, 0, 0, 1, 1,
0.9901083, 0.4533296, 2.107353, 0, 0, 0, 1, 1,
0.993997, -0.8122121, 2.627628, 0, 0, 0, 1, 1,
1.002809, 0.03652303, 1.205556, 0, 0, 0, 1, 1,
1.004147, -0.06145094, 1.917163, 0, 0, 0, 1, 1,
1.008404, -0.5892854, 3.162944, 0, 0, 0, 1, 1,
1.008455, -0.1508623, 2.35299, 0, 0, 0, 1, 1,
1.011252, 0.33386, -1.244533, 0, 0, 0, 1, 1,
1.01186, 1.259944, 0.6943458, 1, 1, 1, 1, 1,
1.012719, 2.056558, 0.5739728, 1, 1, 1, 1, 1,
1.034638, -0.6812478, 0.2021005, 1, 1, 1, 1, 1,
1.034829, 0.9501323, 0.9128489, 1, 1, 1, 1, 1,
1.035881, 1.266342, 0.9464267, 1, 1, 1, 1, 1,
1.036384, 0.5438974, 1.64687, 1, 1, 1, 1, 1,
1.038295, 1.160152, 0.1548578, 1, 1, 1, 1, 1,
1.042313, -0.3604587, 2.176871, 1, 1, 1, 1, 1,
1.043908, 0.8422648, 1.010189, 1, 1, 1, 1, 1,
1.047465, 0.8510622, 1.916334, 1, 1, 1, 1, 1,
1.054998, -1.145656, 2.694885, 1, 1, 1, 1, 1,
1.061758, -0.5631594, 2.626595, 1, 1, 1, 1, 1,
1.068175, 0.4312599, 3.336861, 1, 1, 1, 1, 1,
1.075844, 0.939797, 1.067697, 1, 1, 1, 1, 1,
1.085026, 0.7972375, 1.863803, 1, 1, 1, 1, 1,
1.086592, -0.2841727, 2.078787, 0, 0, 1, 1, 1,
1.090937, 0.8821588, -0.3612189, 1, 0, 0, 1, 1,
1.094491, 2.165047, 0.07704761, 1, 0, 0, 1, 1,
1.096047, -0.6637801, 3.407476, 1, 0, 0, 1, 1,
1.103209, -0.5051968, 2.515498, 1, 0, 0, 1, 1,
1.105661, 1.303945, 1.165936, 1, 0, 0, 1, 1,
1.108561, 0.2791808, 1.752684, 0, 0, 0, 1, 1,
1.113151, 3.447978, 0.9046344, 0, 0, 0, 1, 1,
1.117673, -0.9145694, 1.393016, 0, 0, 0, 1, 1,
1.123052, 0.6486563, 2.487172, 0, 0, 0, 1, 1,
1.127397, 0.8613685, 0.6180457, 0, 0, 0, 1, 1,
1.1284, -0.7115055, 2.656167, 0, 0, 0, 1, 1,
1.128785, -0.8162944, 1.232657, 0, 0, 0, 1, 1,
1.141674, 0.2985804, 3.043462, 1, 1, 1, 1, 1,
1.14174, -0.9357768, 2.48442, 1, 1, 1, 1, 1,
1.142625, -0.4326886, 3.392043, 1, 1, 1, 1, 1,
1.1456, -0.9736989, 1.497142, 1, 1, 1, 1, 1,
1.146411, 0.3253046, 0.7370834, 1, 1, 1, 1, 1,
1.146924, 0.3623708, 0.5908865, 1, 1, 1, 1, 1,
1.148049, 0.1154311, 1.598668, 1, 1, 1, 1, 1,
1.153182, 0.6751707, 1.072691, 1, 1, 1, 1, 1,
1.156257, -0.2021627, 1.050959, 1, 1, 1, 1, 1,
1.158504, 0.1216999, 0.6223254, 1, 1, 1, 1, 1,
1.158897, -1.69508, 2.695714, 1, 1, 1, 1, 1,
1.17235, 0.2748868, 0.3653495, 1, 1, 1, 1, 1,
1.174463, -0.03272371, 2.018229, 1, 1, 1, 1, 1,
1.176518, -1.208257, 1.689103, 1, 1, 1, 1, 1,
1.184056, -0.9987651, 1.993129, 1, 1, 1, 1, 1,
1.192227, 0.4317699, 1.778253, 0, 0, 1, 1, 1,
1.194172, -0.477513, 2.117277, 1, 0, 0, 1, 1,
1.198846, -0.01220163, 1.511687, 1, 0, 0, 1, 1,
1.203789, 1.738166, -0.03384623, 1, 0, 0, 1, 1,
1.208472, 0.09686265, 3.117875, 1, 0, 0, 1, 1,
1.218512, -0.08628844, 3.24302, 1, 0, 0, 1, 1,
1.219886, 0.9493324, 0.1444735, 0, 0, 0, 1, 1,
1.222575, 0.9223163, 2.867282, 0, 0, 0, 1, 1,
1.228088, 2.365042, -0.03302289, 0, 0, 0, 1, 1,
1.23556, 0.3289211, 1.302322, 0, 0, 0, 1, 1,
1.242015, 1.871376, -1.303544, 0, 0, 0, 1, 1,
1.242223, -1.027183, 2.703583, 0, 0, 0, 1, 1,
1.244791, -0.8657137, 2.434273, 0, 0, 0, 1, 1,
1.244938, 0.6546603, 2.449219, 1, 1, 1, 1, 1,
1.257134, 0.6904771, 0.8353794, 1, 1, 1, 1, 1,
1.257507, 0.5420015, 0.5039166, 1, 1, 1, 1, 1,
1.258167, 0.9381737, 1.661371, 1, 1, 1, 1, 1,
1.26422, -1.366381, 2.051101, 1, 1, 1, 1, 1,
1.28327, 0.07953188, 1.142023, 1, 1, 1, 1, 1,
1.283626, -1.608971, 1.759568, 1, 1, 1, 1, 1,
1.289214, -0.1544516, 1.020185, 1, 1, 1, 1, 1,
1.295739, 0.8068136, 0.8881946, 1, 1, 1, 1, 1,
1.298972, 0.04002085, 0.7833992, 1, 1, 1, 1, 1,
1.300194, 0.5838295, 2.317079, 1, 1, 1, 1, 1,
1.300778, 1.505024, 1.148397, 1, 1, 1, 1, 1,
1.30657, -1.46816, 1.151835, 1, 1, 1, 1, 1,
1.308363, 0.5233793, 4.062722, 1, 1, 1, 1, 1,
1.313198, -0.03188309, 3.096297, 1, 1, 1, 1, 1,
1.32032, -1.323864, 1.689999, 0, 0, 1, 1, 1,
1.323185, 0.9753451, 1.540195, 1, 0, 0, 1, 1,
1.324571, -0.1471407, 1.734277, 1, 0, 0, 1, 1,
1.331202, 0.7962947, 0.5274644, 1, 0, 0, 1, 1,
1.332344, 0.2590276, 0.43365, 1, 0, 0, 1, 1,
1.347717, -1.08753, 2.734546, 1, 0, 0, 1, 1,
1.349901, -1.186049, 0.3857929, 0, 0, 0, 1, 1,
1.351121, 0.688612, 1.462358, 0, 0, 0, 1, 1,
1.353645, 0.01536057, 0.2318795, 0, 0, 0, 1, 1,
1.358648, -0.8629982, 1.690296, 0, 0, 0, 1, 1,
1.36426, -2.057772, 3.461009, 0, 0, 0, 1, 1,
1.37546, 0.1581943, 1.365651, 0, 0, 0, 1, 1,
1.377093, -0.6286626, 1.825339, 0, 0, 0, 1, 1,
1.389885, 1.073686, 0.8665563, 1, 1, 1, 1, 1,
1.394481, -0.2133638, 1.255519, 1, 1, 1, 1, 1,
1.407065, -1.39237, 1.946848, 1, 1, 1, 1, 1,
1.409963, -0.6067972, 2.669159, 1, 1, 1, 1, 1,
1.410744, 0.6561089, 0.8724483, 1, 1, 1, 1, 1,
1.415284, -0.8917625, 0.8127744, 1, 1, 1, 1, 1,
1.4221, 1.10983, -0.0644527, 1, 1, 1, 1, 1,
1.428224, -0.2808645, 1.877946, 1, 1, 1, 1, 1,
1.435154, 0.5917578, 1.343658, 1, 1, 1, 1, 1,
1.444627, 0.6032543, -0.8507109, 1, 1, 1, 1, 1,
1.446037, 0.4931944, 0.6967309, 1, 1, 1, 1, 1,
1.45617, -3.191014, 2.618582, 1, 1, 1, 1, 1,
1.464742, 0.4460102, 1.724583, 1, 1, 1, 1, 1,
1.477238, -0.4831417, 1.996876, 1, 1, 1, 1, 1,
1.478177, -1.579192, 2.731301, 1, 1, 1, 1, 1,
1.494253, 0.6852707, 0.1395558, 0, 0, 1, 1, 1,
1.496256, -1.685389, 3.173371, 1, 0, 0, 1, 1,
1.51555, 0.1311826, 1.405724, 1, 0, 0, 1, 1,
1.532344, -0.3803993, 1.901303, 1, 0, 0, 1, 1,
1.544641, -0.01159769, 2.165575, 1, 0, 0, 1, 1,
1.544846, -0.3818873, 2.780556, 1, 0, 0, 1, 1,
1.561877, -0.18008, 0.175462, 0, 0, 0, 1, 1,
1.569013, 0.2357469, 3.013604, 0, 0, 0, 1, 1,
1.570205, 0.8230413, 1.089336, 0, 0, 0, 1, 1,
1.577702, 0.234343, 0.4909988, 0, 0, 0, 1, 1,
1.577785, -0.5102656, 1.458743, 0, 0, 0, 1, 1,
1.578903, 2.760481, -0.383906, 0, 0, 0, 1, 1,
1.586772, 0.2334831, -0.08275072, 0, 0, 0, 1, 1,
1.593486, 1.707876, 1.879413, 1, 1, 1, 1, 1,
1.593534, 0.3162276, 2.938692, 1, 1, 1, 1, 1,
1.600194, -0.1106136, 3.093765, 1, 1, 1, 1, 1,
1.6015, 0.2848926, 0.2072599, 1, 1, 1, 1, 1,
1.620969, -2.717458, 3.985451, 1, 1, 1, 1, 1,
1.632486, -0.4895367, 1.535574, 1, 1, 1, 1, 1,
1.638405, -0.1228232, 1.391187, 1, 1, 1, 1, 1,
1.639703, 2.114838, 2.702545, 1, 1, 1, 1, 1,
1.653827, -1.638539, 1.937785, 1, 1, 1, 1, 1,
1.659577, 1.708881, 1.863648, 1, 1, 1, 1, 1,
1.669394, 2.122484, 1.323289, 1, 1, 1, 1, 1,
1.670397, 1.462676, 0.2003391, 1, 1, 1, 1, 1,
1.671561, -0.8840047, 2.90101, 1, 1, 1, 1, 1,
1.68525, 1.405095, 0.7807941, 1, 1, 1, 1, 1,
1.689031, -0.675871, 0.7658228, 1, 1, 1, 1, 1,
1.689117, 0.150858, 0.9183835, 0, 0, 1, 1, 1,
1.702263, -0.7098396, 3.103668, 1, 0, 0, 1, 1,
1.704681, 1.22338, 1.649614, 1, 0, 0, 1, 1,
1.705199, -0.1572099, 0.6121873, 1, 0, 0, 1, 1,
1.705223, -0.6438926, 1.938309, 1, 0, 0, 1, 1,
1.707999, -0.3410743, 0.004621255, 1, 0, 0, 1, 1,
1.726858, -0.4325981, 2.227108, 0, 0, 0, 1, 1,
1.734622, 0.4274993, 1.439194, 0, 0, 0, 1, 1,
1.73467, -0.3828177, 2.483733, 0, 0, 0, 1, 1,
1.738706, -2.15564, 3.553959, 0, 0, 0, 1, 1,
1.742486, 0.4123195, 1.41673, 0, 0, 0, 1, 1,
1.756924, 1.391024, 1.291643, 0, 0, 0, 1, 1,
1.762361, 0.6204948, 1.245149, 0, 0, 0, 1, 1,
1.76418, -1.542041, 3.595571, 1, 1, 1, 1, 1,
1.76608, 1.509282, 1.15021, 1, 1, 1, 1, 1,
1.774939, 1.263438, 0.8035731, 1, 1, 1, 1, 1,
1.792155, -0.7098326, 2.17149, 1, 1, 1, 1, 1,
1.801035, -1.472008, 2.981598, 1, 1, 1, 1, 1,
1.814666, -0.625374, 1.641313, 1, 1, 1, 1, 1,
1.817373, 1.356574, 0.316296, 1, 1, 1, 1, 1,
1.821475, -2.083261, 3.383793, 1, 1, 1, 1, 1,
1.821806, -1.492995, 2.204609, 1, 1, 1, 1, 1,
1.823085, -1.262133, 1.05955, 1, 1, 1, 1, 1,
1.864021, -2.30123, 0.3868576, 1, 1, 1, 1, 1,
1.871456, -0.5073771, 2.679923, 1, 1, 1, 1, 1,
1.909517, 0.8299453, 2.766289, 1, 1, 1, 1, 1,
1.914588, -0.03275083, 2.062133, 1, 1, 1, 1, 1,
1.937629, -1.189609, 3.788443, 1, 1, 1, 1, 1,
1.959515, -0.4134034, 3.49592, 0, 0, 1, 1, 1,
2.049286, -1.462223, 1.401719, 1, 0, 0, 1, 1,
2.051467, -0.7117605, 2.71663, 1, 0, 0, 1, 1,
2.140784, 2.323219, 1.456088, 1, 0, 0, 1, 1,
2.143885, -1.03972, 1.784013, 1, 0, 0, 1, 1,
2.147754, -0.4534485, 2.420009, 1, 0, 0, 1, 1,
2.173697, -1.349635, 1.847178, 0, 0, 0, 1, 1,
2.202937, -0.8521761, -0.04971747, 0, 0, 0, 1, 1,
2.441397, -0.2068519, 2.628196, 0, 0, 0, 1, 1,
2.447533, 1.979254, 0.2325961, 0, 0, 0, 1, 1,
2.453491, -0.2007474, 1.274372, 0, 0, 0, 1, 1,
2.488643, 0.2499061, 2.619329, 0, 0, 0, 1, 1,
2.556276, -0.3266525, 1.635465, 0, 0, 0, 1, 1,
2.65802, -1.101352, 2.415997, 1, 1, 1, 1, 1,
2.716639, 1.26208, 1.851105, 1, 1, 1, 1, 1,
2.717916, -0.5026199, 2.915256, 1, 1, 1, 1, 1,
2.724395, -0.2344712, 1.262107, 1, 1, 1, 1, 1,
2.800433, -0.3497097, 0.8214744, 1, 1, 1, 1, 1,
3.138527, -1.821987, 1.697926, 1, 1, 1, 1, 1,
3.31005, 0.5010739, 2.649901, 1, 1, 1, 1, 1
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
var radius = 10.04885;
var distance = 35.29618;
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
mvMatrix.translate( -0.1189463, -0.1284821, -0.08365989 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.29618);
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