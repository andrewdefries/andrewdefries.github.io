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
-2.901264, 0.5845448, -0.6247708, 1, 0, 0, 1,
-2.8558, 0.06431215, -1.390647, 1, 0.007843138, 0, 1,
-2.685467, -0.4246942, -2.559997, 1, 0.01176471, 0, 1,
-2.579224, 0.03425458, -2.161706, 1, 0.01960784, 0, 1,
-2.575036, -0.6315717, -1.698749, 1, 0.02352941, 0, 1,
-2.537066, 0.2704559, -0.8626024, 1, 0.03137255, 0, 1,
-2.535979, -0.2860104, -0.57547, 1, 0.03529412, 0, 1,
-2.479479, 0.3893546, -0.932959, 1, 0.04313726, 0, 1,
-2.470258, 0.9099747, -1.001883, 1, 0.04705882, 0, 1,
-2.432491, -1.518727, -0.4815329, 1, 0.05490196, 0, 1,
-2.329522, 0.6139227, -1.661567, 1, 0.05882353, 0, 1,
-2.325895, -0.7208332, -1.92583, 1, 0.06666667, 0, 1,
-2.280423, -1.117923, -1.784989, 1, 0.07058824, 0, 1,
-2.269788, 0.3793086, -0.3614802, 1, 0.07843138, 0, 1,
-2.219342, 0.3791471, -1.741099, 1, 0.08235294, 0, 1,
-2.18601, 0.2130204, -1.300447, 1, 0.09019608, 0, 1,
-2.131631, 0.2366477, -1.028695, 1, 0.09411765, 0, 1,
-2.102445, 0.1663757, -1.817627, 1, 0.1019608, 0, 1,
-2.097814, 0.5103357, -1.411126, 1, 0.1098039, 0, 1,
-2.090868, -0.1905557, -0.1212551, 1, 0.1137255, 0, 1,
-2.085795, 0.4573465, -0.8052472, 1, 0.1215686, 0, 1,
-2.06181, 0.9322125, -3.65799, 1, 0.1254902, 0, 1,
-2.04599, -0.2684792, -3.180081, 1, 0.1333333, 0, 1,
-2.000674, 0.8460339, -2.019748, 1, 0.1372549, 0, 1,
-1.97832, -1.227219, -2.820371, 1, 0.145098, 0, 1,
-1.959126, -0.1198336, -0.5593769, 1, 0.1490196, 0, 1,
-1.958182, -0.4576477, -1.913147, 1, 0.1568628, 0, 1,
-1.952059, 1.065143, -0.916055, 1, 0.1607843, 0, 1,
-1.904849, 0.5742767, -1.485161, 1, 0.1686275, 0, 1,
-1.886411, -0.3964681, -1.316953, 1, 0.172549, 0, 1,
-1.875277, 0.9829444, -0.4574106, 1, 0.1803922, 0, 1,
-1.869324, -0.1356397, -0.7421691, 1, 0.1843137, 0, 1,
-1.850994, -1.539645, -1.432681, 1, 0.1921569, 0, 1,
-1.831107, -0.9656152, -1.943902, 1, 0.1960784, 0, 1,
-1.804731, -1.141451, -1.900397, 1, 0.2039216, 0, 1,
-1.79137, -0.6389568, -1.586156, 1, 0.2117647, 0, 1,
-1.766487, -1.875407, -0.7582007, 1, 0.2156863, 0, 1,
-1.76611, 0.4379483, -0.8243636, 1, 0.2235294, 0, 1,
-1.760904, 0.8530584, 0.1846227, 1, 0.227451, 0, 1,
-1.749639, -0.5998342, -1.861473, 1, 0.2352941, 0, 1,
-1.747797, -1.411116, -4.179986, 1, 0.2392157, 0, 1,
-1.737512, -0.180381, -4.002153, 1, 0.2470588, 0, 1,
-1.737099, 1.10265, -1.42606, 1, 0.2509804, 0, 1,
-1.715316, -0.6434384, -1.887082, 1, 0.2588235, 0, 1,
-1.700049, -0.5908412, -2.795125, 1, 0.2627451, 0, 1,
-1.661964, 1.325448, 0.3107629, 1, 0.2705882, 0, 1,
-1.640835, 0.3895921, -2.52291, 1, 0.2745098, 0, 1,
-1.624554, -1.814806, -1.432307, 1, 0.282353, 0, 1,
-1.615856, 0.2690025, -0.1783049, 1, 0.2862745, 0, 1,
-1.608802, 0.2596225, -2.33189, 1, 0.2941177, 0, 1,
-1.595369, 0.1745773, -1.960686, 1, 0.3019608, 0, 1,
-1.589679, -1.131005, -1.006681, 1, 0.3058824, 0, 1,
-1.579237, 0.1010276, -0.4486418, 1, 0.3137255, 0, 1,
-1.554838, 0.3567232, -1.587247, 1, 0.3176471, 0, 1,
-1.552577, -1.020325, -1.591634, 1, 0.3254902, 0, 1,
-1.544894, -0.140309, -1.702838, 1, 0.3294118, 0, 1,
-1.535334, -0.5508596, -1.740949, 1, 0.3372549, 0, 1,
-1.534495, 0.2476222, -0.9247366, 1, 0.3411765, 0, 1,
-1.513526, -0.6994304, -1.895892, 1, 0.3490196, 0, 1,
-1.507672, 0.9152806, -0.8393126, 1, 0.3529412, 0, 1,
-1.505334, -0.4891333, -3.668218, 1, 0.3607843, 0, 1,
-1.490832, -1.096361, -1.26726, 1, 0.3647059, 0, 1,
-1.479883, 1.61785, -0.189286, 1, 0.372549, 0, 1,
-1.476969, 0.7556682, -1.319779, 1, 0.3764706, 0, 1,
-1.460718, 0.8741331, -0.8633338, 1, 0.3843137, 0, 1,
-1.458953, 0.06057302, -1.24098, 1, 0.3882353, 0, 1,
-1.450675, 0.5080845, -0.1995146, 1, 0.3960784, 0, 1,
-1.44338, 1.761341, -1.004921, 1, 0.4039216, 0, 1,
-1.442665, 1.452632, 0.5019255, 1, 0.4078431, 0, 1,
-1.436934, 0.5415732, -0.4045712, 1, 0.4156863, 0, 1,
-1.429083, 0.6312903, -2.050167, 1, 0.4196078, 0, 1,
-1.429013, -0.09493352, -0.9525997, 1, 0.427451, 0, 1,
-1.426288, -0.9283453, -1.189818, 1, 0.4313726, 0, 1,
-1.423674, -0.3232539, -2.118621, 1, 0.4392157, 0, 1,
-1.419851, 0.2786437, -2.728308, 1, 0.4431373, 0, 1,
-1.416526, 0.7439832, -1.524897, 1, 0.4509804, 0, 1,
-1.414733, -0.4279088, -4.059512, 1, 0.454902, 0, 1,
-1.411154, 0.7503284, -2.629043, 1, 0.4627451, 0, 1,
-1.411083, -1.403938, -2.534163, 1, 0.4666667, 0, 1,
-1.404576, 0.6330378, -0.01822517, 1, 0.4745098, 0, 1,
-1.386752, -0.2882131, -2.823691, 1, 0.4784314, 0, 1,
-1.385868, 2.548873, -0.1119923, 1, 0.4862745, 0, 1,
-1.385136, -0.8997025, -1.146334, 1, 0.4901961, 0, 1,
-1.382784, 1.998567, -0.6054369, 1, 0.4980392, 0, 1,
-1.375808, 0.3079351, -1.289147, 1, 0.5058824, 0, 1,
-1.375727, -1.216765, -2.841, 1, 0.509804, 0, 1,
-1.375494, -0.851917, -1.474723, 1, 0.5176471, 0, 1,
-1.371348, 1.741313, -1.023226, 1, 0.5215687, 0, 1,
-1.369986, -0.06999331, -2.006208, 1, 0.5294118, 0, 1,
-1.369432, -1.303326, -1.372647, 1, 0.5333334, 0, 1,
-1.358908, 0.2270697, -0.5164275, 1, 0.5411765, 0, 1,
-1.345232, 0.3969903, -1.302716, 1, 0.5450981, 0, 1,
-1.340963, -0.2980219, -2.592831, 1, 0.5529412, 0, 1,
-1.337767, 0.4679754, -0.8921362, 1, 0.5568628, 0, 1,
-1.333098, -0.3490053, -3.849458, 1, 0.5647059, 0, 1,
-1.329224, 0.04282019, -2.843293, 1, 0.5686275, 0, 1,
-1.327762, -0.00789916, -2.377282, 1, 0.5764706, 0, 1,
-1.321158, 1.360333, 0.1689993, 1, 0.5803922, 0, 1,
-1.319826, -0.7978373, -2.483239, 1, 0.5882353, 0, 1,
-1.318532, 2.06101, -1.360441, 1, 0.5921569, 0, 1,
-1.290478, 0.4385198, -0.01564289, 1, 0.6, 0, 1,
-1.281888, -0.1282586, -0.4211948, 1, 0.6078432, 0, 1,
-1.278844, -0.003732288, -2.982712, 1, 0.6117647, 0, 1,
-1.270743, 0.2354343, -2.856561, 1, 0.6196079, 0, 1,
-1.269981, -1.293239, -2.132517, 1, 0.6235294, 0, 1,
-1.239634, -0.09506907, -1.129593, 1, 0.6313726, 0, 1,
-1.223695, -2.101336, -3.092801, 1, 0.6352941, 0, 1,
-1.222921, -1.088695, -3.576559, 1, 0.6431373, 0, 1,
-1.220077, -1.148839, -2.898027, 1, 0.6470588, 0, 1,
-1.214846, -0.01921488, -1.232986, 1, 0.654902, 0, 1,
-1.21466, -1.045216, -1.642742, 1, 0.6588235, 0, 1,
-1.212617, -1.039401, -2.045739, 1, 0.6666667, 0, 1,
-1.208215, -0.6106663, -3.427807, 1, 0.6705883, 0, 1,
-1.203015, 0.3637766, -1.753172, 1, 0.6784314, 0, 1,
-1.19238, -0.4784849, -2.72963, 1, 0.682353, 0, 1,
-1.192322, 0.04084057, -3.554163, 1, 0.6901961, 0, 1,
-1.187623, 0.6112357, -3.031445, 1, 0.6941177, 0, 1,
-1.185847, -0.1596462, -2.025336, 1, 0.7019608, 0, 1,
-1.18457, 0.01333451, -0.8680046, 1, 0.7098039, 0, 1,
-1.184298, -0.2845727, -1.670702, 1, 0.7137255, 0, 1,
-1.182941, 0.4624371, -0.5843506, 1, 0.7215686, 0, 1,
-1.173195, -0.7058387, -1.578057, 1, 0.7254902, 0, 1,
-1.173006, -0.389394, -0.9355254, 1, 0.7333333, 0, 1,
-1.170282, -1.395519, -1.42575, 1, 0.7372549, 0, 1,
-1.166189, 0.7391719, -0.5965065, 1, 0.7450981, 0, 1,
-1.164743, -1.744049, -2.031233, 1, 0.7490196, 0, 1,
-1.164201, -0.0006584309, -1.514122, 1, 0.7568628, 0, 1,
-1.1603, -0.1736312, -3.67581, 1, 0.7607843, 0, 1,
-1.159164, 1.069465, 0.53683, 1, 0.7686275, 0, 1,
-1.152318, 0.8518084, -1.32251, 1, 0.772549, 0, 1,
-1.142229, 0.5524564, -1.407575, 1, 0.7803922, 0, 1,
-1.137479, 0.6635741, -2.083195, 1, 0.7843137, 0, 1,
-1.136329, 1.284679, -1.191645, 1, 0.7921569, 0, 1,
-1.133726, 0.3629875, -0.5069003, 1, 0.7960784, 0, 1,
-1.129552, 0.2161517, -3.151831, 1, 0.8039216, 0, 1,
-1.122264, -0.2264869, -2.075702, 1, 0.8117647, 0, 1,
-1.121305, -1.389585, -2.75918, 1, 0.8156863, 0, 1,
-1.118363, -0.5062351, -2.899056, 1, 0.8235294, 0, 1,
-1.113812, 0.5441051, -0.7046559, 1, 0.827451, 0, 1,
-1.111709, -0.02712524, -1.052404, 1, 0.8352941, 0, 1,
-1.11062, -0.503703, -1.148978, 1, 0.8392157, 0, 1,
-1.090976, 2.317442, -0.128941, 1, 0.8470588, 0, 1,
-1.090072, 0.7697303, -2.457917, 1, 0.8509804, 0, 1,
-1.084089, 1.486341, 0.5418847, 1, 0.8588235, 0, 1,
-1.081738, 0.3505997, 0.1240693, 1, 0.8627451, 0, 1,
-1.081353, -0.2232385, -0.9117373, 1, 0.8705882, 0, 1,
-1.077019, -0.05800818, -2.672082, 1, 0.8745098, 0, 1,
-1.076882, -0.2740935, -1.498041, 1, 0.8823529, 0, 1,
-1.076509, -1.440746, -3.674677, 1, 0.8862745, 0, 1,
-1.073194, 1.249136, -1.832236, 1, 0.8941177, 0, 1,
-1.06227, -0.4269041, -2.597702, 1, 0.8980392, 0, 1,
-1.060522, 0.2046233, -1.010884, 1, 0.9058824, 0, 1,
-1.060204, 0.1731247, -0.7745071, 1, 0.9137255, 0, 1,
-1.05731, -0.4763362, -3.708346, 1, 0.9176471, 0, 1,
-1.054282, 0.4808118, -0.5376332, 1, 0.9254902, 0, 1,
-1.048949, -0.2069198, -0.8141764, 1, 0.9294118, 0, 1,
-1.048658, -0.931941, -2.152458, 1, 0.9372549, 0, 1,
-1.046684, 1.326254, -3.162121, 1, 0.9411765, 0, 1,
-1.045359, 0.2753623, -1.000472, 1, 0.9490196, 0, 1,
-1.038929, -0.6242691, -2.157402, 1, 0.9529412, 0, 1,
-1.030205, 0.6087568, -1.436934, 1, 0.9607843, 0, 1,
-1.027165, 0.1065197, -0.9817553, 1, 0.9647059, 0, 1,
-1.018939, 1.222964, 0.4477258, 1, 0.972549, 0, 1,
-1.018435, -0.4180779, -1.451977, 1, 0.9764706, 0, 1,
-1.012463, 1.926477, -0.2628064, 1, 0.9843137, 0, 1,
-1.009881, 1.467676, -1.283717, 1, 0.9882353, 0, 1,
-1.008579, 0.5677878, 0.09870406, 1, 0.9960784, 0, 1,
-1.007918, 0.3061737, -1.112863, 0.9960784, 1, 0, 1,
-1.003373, -0.9789138, -1.906033, 0.9921569, 1, 0, 1,
-0.9976653, -0.276778, -3.419123, 0.9843137, 1, 0, 1,
-0.9959834, -1.574312, -3.022177, 0.9803922, 1, 0, 1,
-0.9929203, -0.2846048, -1.686046, 0.972549, 1, 0, 1,
-0.9871293, -0.5504194, -1.506503, 0.9686275, 1, 0, 1,
-0.9849771, -0.8761995, -1.703896, 0.9607843, 1, 0, 1,
-0.9781857, 0.5221958, -1.040195, 0.9568627, 1, 0, 1,
-0.9757358, -1.528999, -4.452559, 0.9490196, 1, 0, 1,
-0.9739006, -0.8253632, -1.906841, 0.945098, 1, 0, 1,
-0.9690025, -0.1210203, -2.461952, 0.9372549, 1, 0, 1,
-0.9679715, 1.093284, -1.803006, 0.9333333, 1, 0, 1,
-0.9621115, -0.5778781, -1.309229, 0.9254902, 1, 0, 1,
-0.9615334, 1.881232, -0.7165934, 0.9215686, 1, 0, 1,
-0.9594941, 0.7929285, -1.919329, 0.9137255, 1, 0, 1,
-0.9545853, 1.076186, 0.3136523, 0.9098039, 1, 0, 1,
-0.9545377, 1.369391, -1.33768, 0.9019608, 1, 0, 1,
-0.9511158, -0.8450148, -2.070894, 0.8941177, 1, 0, 1,
-0.9478214, 0.4882344, 0.1384221, 0.8901961, 1, 0, 1,
-0.9360106, 0.2762571, -1.495991, 0.8823529, 1, 0, 1,
-0.9324366, 1.908935, 0.2238061, 0.8784314, 1, 0, 1,
-0.9292247, 0.4560195, -1.692995, 0.8705882, 1, 0, 1,
-0.9250295, 0.4934548, -0.9122623, 0.8666667, 1, 0, 1,
-0.924768, 0.6983219, -1.487509, 0.8588235, 1, 0, 1,
-0.9124134, 0.3368876, 0.384353, 0.854902, 1, 0, 1,
-0.9028069, 0.1068134, -1.404276, 0.8470588, 1, 0, 1,
-0.8954447, 1.96988, 0.9781767, 0.8431373, 1, 0, 1,
-0.8826065, -0.4476528, -2.546501, 0.8352941, 1, 0, 1,
-0.8773379, 1.631145, -1.034869, 0.8313726, 1, 0, 1,
-0.8719714, -1.18828, -2.790487, 0.8235294, 1, 0, 1,
-0.8597406, 0.03147203, -1.712805, 0.8196079, 1, 0, 1,
-0.8585024, -0.5127593, -2.749171, 0.8117647, 1, 0, 1,
-0.8471383, 0.4208452, -0.2545082, 0.8078431, 1, 0, 1,
-0.846598, 0.9612845, -0.1715157, 0.8, 1, 0, 1,
-0.8402951, -0.1963269, -1.015046, 0.7921569, 1, 0, 1,
-0.8382774, -0.4185767, -2.052008, 0.7882353, 1, 0, 1,
-0.8354315, -0.3844469, -3.382021, 0.7803922, 1, 0, 1,
-0.8328686, -0.3301103, -2.73515, 0.7764706, 1, 0, 1,
-0.8284208, 0.6154104, 0.1712217, 0.7686275, 1, 0, 1,
-0.8216879, -0.1796898, -1.946245, 0.7647059, 1, 0, 1,
-0.8196355, 1.791429, -1.067984, 0.7568628, 1, 0, 1,
-0.8160578, 0.5417858, -1.756958, 0.7529412, 1, 0, 1,
-0.8157286, 0.9202566, -1.556175, 0.7450981, 1, 0, 1,
-0.806928, 0.3797856, -1.65278, 0.7411765, 1, 0, 1,
-0.7982044, -0.4246917, -2.855883, 0.7333333, 1, 0, 1,
-0.7981023, -1.813335, -2.664048, 0.7294118, 1, 0, 1,
-0.7817093, -1.191006, -2.075835, 0.7215686, 1, 0, 1,
-0.78143, -0.6283585, 0.5734516, 0.7176471, 1, 0, 1,
-0.779312, 0.4018264, -2.283852, 0.7098039, 1, 0, 1,
-0.7774624, 0.04805645, -1.406539, 0.7058824, 1, 0, 1,
-0.7756259, 0.0217301, -2.274575, 0.6980392, 1, 0, 1,
-0.773922, 0.5659617, -0.4219176, 0.6901961, 1, 0, 1,
-0.7679696, 0.1697687, -1.319826, 0.6862745, 1, 0, 1,
-0.7656306, -0.4532827, -2.824466, 0.6784314, 1, 0, 1,
-0.7638922, -0.8199161, -4.267237, 0.6745098, 1, 0, 1,
-0.7575822, 0.3370791, -0.3353053, 0.6666667, 1, 0, 1,
-0.750501, 0.1348764, -0.7407237, 0.6627451, 1, 0, 1,
-0.7498363, 1.048339, -2.404641, 0.654902, 1, 0, 1,
-0.7471354, 0.5888373, -1.348603, 0.6509804, 1, 0, 1,
-0.7459587, -0.4095409, -0.9488525, 0.6431373, 1, 0, 1,
-0.7438148, -1.072299, -1.289123, 0.6392157, 1, 0, 1,
-0.7437965, -1.004089, -4.573334, 0.6313726, 1, 0, 1,
-0.7407166, -1.437169, -2.318525, 0.627451, 1, 0, 1,
-0.7386939, -0.1963037, 0.7563964, 0.6196079, 1, 0, 1,
-0.7352575, -0.7642739, -4.056394, 0.6156863, 1, 0, 1,
-0.7298031, 0.6306685, 0.1652269, 0.6078432, 1, 0, 1,
-0.7275167, -0.1799671, -1.697409, 0.6039216, 1, 0, 1,
-0.7249228, -0.09642043, -1.708537, 0.5960785, 1, 0, 1,
-0.7158467, 0.2986383, -0.6458071, 0.5882353, 1, 0, 1,
-0.7054021, 1.077094, -0.05375147, 0.5843138, 1, 0, 1,
-0.7043167, 1.23612, -1.106874, 0.5764706, 1, 0, 1,
-0.7025437, -1.853879, -1.388255, 0.572549, 1, 0, 1,
-0.7024106, 1.189237, -1.776384, 0.5647059, 1, 0, 1,
-0.6992356, -3.670357, -3.218543, 0.5607843, 1, 0, 1,
-0.6941485, 0.1985329, -2.288267, 0.5529412, 1, 0, 1,
-0.6930537, 0.2562657, -1.369459, 0.5490196, 1, 0, 1,
-0.6923279, -1.153869, -4.195234, 0.5411765, 1, 0, 1,
-0.6911542, 1.571217, -0.05655092, 0.5372549, 1, 0, 1,
-0.6880217, -1.840032, -1.437473, 0.5294118, 1, 0, 1,
-0.6840466, 0.6281394, -1.900002, 0.5254902, 1, 0, 1,
-0.6797243, 1.004402, -0.1970552, 0.5176471, 1, 0, 1,
-0.6788411, 0.111576, -2.495595, 0.5137255, 1, 0, 1,
-0.6760842, 1.150077, -1.649188, 0.5058824, 1, 0, 1,
-0.66987, 0.7421474, -2.067887, 0.5019608, 1, 0, 1,
-0.6690317, 0.01679777, -2.102133, 0.4941176, 1, 0, 1,
-0.6653829, -0.7384061, -3.882437, 0.4862745, 1, 0, 1,
-0.6622942, -0.2448147, -2.116948, 0.4823529, 1, 0, 1,
-0.6576212, 0.5970646, -0.3952789, 0.4745098, 1, 0, 1,
-0.6570773, -0.6139272, -2.685282, 0.4705882, 1, 0, 1,
-0.6568544, 0.7441853, -2.414116, 0.4627451, 1, 0, 1,
-0.6544179, -0.1098994, -2.697718, 0.4588235, 1, 0, 1,
-0.6538386, 0.3702735, -1.169116, 0.4509804, 1, 0, 1,
-0.6518083, 1.788657, 0.3986131, 0.4470588, 1, 0, 1,
-0.6498921, -0.7651374, -2.079935, 0.4392157, 1, 0, 1,
-0.6449026, 1.769612, 0.8373952, 0.4352941, 1, 0, 1,
-0.6341167, -0.6832733, -1.927755, 0.427451, 1, 0, 1,
-0.6315071, -0.9403813, -1.24169, 0.4235294, 1, 0, 1,
-0.6302959, 0.4065285, -0.2147295, 0.4156863, 1, 0, 1,
-0.6275214, 0.1556702, -1.54766, 0.4117647, 1, 0, 1,
-0.6262057, 0.845696, 0.9841064, 0.4039216, 1, 0, 1,
-0.6248192, 1.220023, 0.2497205, 0.3960784, 1, 0, 1,
-0.6183056, 1.587719, 0.9579671, 0.3921569, 1, 0, 1,
-0.6172494, 0.8982216, -1.259346, 0.3843137, 1, 0, 1,
-0.6148676, 1.823505, 0.6644258, 0.3803922, 1, 0, 1,
-0.6125335, -0.9808714, -3.784882, 0.372549, 1, 0, 1,
-0.610455, -1.878821, -3.351537, 0.3686275, 1, 0, 1,
-0.6083974, 1.189197, -0.150959, 0.3607843, 1, 0, 1,
-0.6076029, -0.901549, -3.495428, 0.3568628, 1, 0, 1,
-0.6019086, -0.5759493, -1.497262, 0.3490196, 1, 0, 1,
-0.5995049, -0.09172825, -1.393691, 0.345098, 1, 0, 1,
-0.5910161, -0.592876, -4.199805, 0.3372549, 1, 0, 1,
-0.5885534, 0.3447656, -1.879233, 0.3333333, 1, 0, 1,
-0.5798716, 0.9536986, -0.9715539, 0.3254902, 1, 0, 1,
-0.5771576, -0.7571543, -3.685562, 0.3215686, 1, 0, 1,
-0.5732451, 1.101262, -1.046661, 0.3137255, 1, 0, 1,
-0.571674, -0.6264941, -3.055945, 0.3098039, 1, 0, 1,
-0.5681579, 0.02214562, -2.182747, 0.3019608, 1, 0, 1,
-0.5676838, 1.311266, 0.008474154, 0.2941177, 1, 0, 1,
-0.5625639, 0.8387732, -0.4223805, 0.2901961, 1, 0, 1,
-0.5614963, -0.9196375, -5.110831, 0.282353, 1, 0, 1,
-0.5611675, -0.6114819, -2.893529, 0.2784314, 1, 0, 1,
-0.5570646, -0.4923155, -0.4078661, 0.2705882, 1, 0, 1,
-0.5549728, -2.277403, -2.378984, 0.2666667, 1, 0, 1,
-0.5434177, 0.2442798, -2.400855, 0.2588235, 1, 0, 1,
-0.5386924, -0.472712, -0.6423348, 0.254902, 1, 0, 1,
-0.5344105, 0.8477168, -0.239829, 0.2470588, 1, 0, 1,
-0.5333029, 0.3790563, 0.6859704, 0.2431373, 1, 0, 1,
-0.5331751, 0.5538055, -0.7996483, 0.2352941, 1, 0, 1,
-0.5283999, 0.5785993, -2.172513, 0.2313726, 1, 0, 1,
-0.5269564, 0.4506257, -1.441847, 0.2235294, 1, 0, 1,
-0.525839, 1.159534, -0.832702, 0.2196078, 1, 0, 1,
-0.5256286, -0.7200153, -1.979424, 0.2117647, 1, 0, 1,
-0.5210148, 2.350412, 0.3411948, 0.2078431, 1, 0, 1,
-0.5140199, -0.8679767, -3.20936, 0.2, 1, 0, 1,
-0.5114321, -1.306027, -4.036399, 0.1921569, 1, 0, 1,
-0.5048546, -0.3432752, -2.345304, 0.1882353, 1, 0, 1,
-0.5000184, 0.4322616, 1.269934, 0.1803922, 1, 0, 1,
-0.4973509, 0.7313416, 0.486376, 0.1764706, 1, 0, 1,
-0.495496, -0.139026, -0.9048331, 0.1686275, 1, 0, 1,
-0.4941017, -0.1808228, -2.796865, 0.1647059, 1, 0, 1,
-0.4934497, 0.9262895, -1.419016, 0.1568628, 1, 0, 1,
-0.492644, -0.4327775, -1.255881, 0.1529412, 1, 0, 1,
-0.4923522, 1.477348, -0.4041668, 0.145098, 1, 0, 1,
-0.4864909, -0.04375996, -1.902229, 0.1411765, 1, 0, 1,
-0.4851173, -0.6417814, -3.120918, 0.1333333, 1, 0, 1,
-0.482598, -0.2566774, -1.391927, 0.1294118, 1, 0, 1,
-0.4787025, 2.013826, -0.5631306, 0.1215686, 1, 0, 1,
-0.4774525, -2.479266, -3.455507, 0.1176471, 1, 0, 1,
-0.4738305, -1.532755, -2.702061, 0.1098039, 1, 0, 1,
-0.4641642, 0.551865, 0.2288996, 0.1058824, 1, 0, 1,
-0.4585063, 0.06914916, -1.673059, 0.09803922, 1, 0, 1,
-0.4579613, 1.12566, 0.805206, 0.09019608, 1, 0, 1,
-0.4553995, 0.2236147, -1.560473, 0.08627451, 1, 0, 1,
-0.45103, 1.246846, -0.03091401, 0.07843138, 1, 0, 1,
-0.4483453, 0.3374767, 1.540299, 0.07450981, 1, 0, 1,
-0.446886, -0.6226988, -3.327308, 0.06666667, 1, 0, 1,
-0.4422286, 1.241972, -0.4967669, 0.0627451, 1, 0, 1,
-0.4407082, 0.7013502, 1.401844, 0.05490196, 1, 0, 1,
-0.4343949, 2.520708, 2.152075, 0.05098039, 1, 0, 1,
-0.4332052, -0.5165235, -2.785084, 0.04313726, 1, 0, 1,
-0.4327862, -1.641459, -3.548495, 0.03921569, 1, 0, 1,
-0.431998, 2.041067, -0.6837288, 0.03137255, 1, 0, 1,
-0.429114, -0.1717819, -3.020324, 0.02745098, 1, 0, 1,
-0.4281568, -0.05801617, -2.668961, 0.01960784, 1, 0, 1,
-0.4257898, -0.1566688, -2.128745, 0.01568628, 1, 0, 1,
-0.4187805, -0.4182486, -1.950311, 0.007843138, 1, 0, 1,
-0.4179331, 0.969615, 1.153709, 0.003921569, 1, 0, 1,
-0.4159026, -2.126518, -1.330461, 0, 1, 0.003921569, 1,
-0.4150471, -0.1439404, -0.9834696, 0, 1, 0.01176471, 1,
-0.4135376, -0.5362741, -2.225359, 0, 1, 0.01568628, 1,
-0.4114482, -2.10866, -3.255124, 0, 1, 0.02352941, 1,
-0.3998245, 0.02753009, -4.055511, 0, 1, 0.02745098, 1,
-0.3996527, -0.6634234, -3.011931, 0, 1, 0.03529412, 1,
-0.3974276, 0.6599337, 0.04679501, 0, 1, 0.03921569, 1,
-0.3956069, 0.1709061, -1.774426, 0, 1, 0.04705882, 1,
-0.3926399, -1.064859, -3.131674, 0, 1, 0.05098039, 1,
-0.3924951, -0.03089463, -0.6251554, 0, 1, 0.05882353, 1,
-0.3916056, 1.145694, 0.0587289, 0, 1, 0.0627451, 1,
-0.389113, 0.4759296, -0.3441008, 0, 1, 0.07058824, 1,
-0.386852, 0.4033791, -1.522775, 0, 1, 0.07450981, 1,
-0.3852837, -0.7415144, -2.308221, 0, 1, 0.08235294, 1,
-0.3831469, -0.4552948, -3.029524, 0, 1, 0.08627451, 1,
-0.3819648, 0.3967586, 0.07414011, 0, 1, 0.09411765, 1,
-0.3764777, 0.85209, 1.866918, 0, 1, 0.1019608, 1,
-0.3759703, -0.6951181, -2.88089, 0, 1, 0.1058824, 1,
-0.3752824, -0.9285865, -2.529686, 0, 1, 0.1137255, 1,
-0.3750829, 0.6554185, -1.064503, 0, 1, 0.1176471, 1,
-0.3740754, 0.748372, 0.529317, 0, 1, 0.1254902, 1,
-0.3711152, -2.548538, -1.362607, 0, 1, 0.1294118, 1,
-0.3672305, -0.9663648, -4.393545, 0, 1, 0.1372549, 1,
-0.3542644, -0.7968097, -2.970502, 0, 1, 0.1411765, 1,
-0.3516117, -0.5957519, -0.2403091, 0, 1, 0.1490196, 1,
-0.3495718, 0.01576952, -1.804834, 0, 1, 0.1529412, 1,
-0.347407, -0.07886936, -1.852853, 0, 1, 0.1607843, 1,
-0.3471595, -0.3373505, -2.600538, 0, 1, 0.1647059, 1,
-0.3454229, -0.915606, -2.245317, 0, 1, 0.172549, 1,
-0.3388669, -0.6992342, -2.772682, 0, 1, 0.1764706, 1,
-0.3377186, 1.305804, 0.08343948, 0, 1, 0.1843137, 1,
-0.3340398, -0.1639265, -1.356908, 0, 1, 0.1882353, 1,
-0.3314504, -1.347968, -2.799556, 0, 1, 0.1960784, 1,
-0.329866, -0.7201553, -4.555113, 0, 1, 0.2039216, 1,
-0.3291914, 0.05590775, -1.127288, 0, 1, 0.2078431, 1,
-0.3226258, -0.9392563, -2.964453, 0, 1, 0.2156863, 1,
-0.3198229, -0.04380805, -1.98025, 0, 1, 0.2196078, 1,
-0.3143119, 1.083382, -1.16482, 0, 1, 0.227451, 1,
-0.3131264, 1.465226, -0.8574967, 0, 1, 0.2313726, 1,
-0.3076309, 0.9341975, -1.139222, 0, 1, 0.2392157, 1,
-0.3072964, -0.002935987, -1.181913, 0, 1, 0.2431373, 1,
-0.3068261, -0.6675601, -3.014683, 0, 1, 0.2509804, 1,
-0.3015495, -1.725152, -1.915042, 0, 1, 0.254902, 1,
-0.3003851, 1.382663, -1.104906, 0, 1, 0.2627451, 1,
-0.296125, -1.947814, -1.82546, 0, 1, 0.2666667, 1,
-0.2897317, 1.812869, 0.9271936, 0, 1, 0.2745098, 1,
-0.2891082, -0.3670229, -2.44166, 0, 1, 0.2784314, 1,
-0.2872237, 1.657343, -0.1809854, 0, 1, 0.2862745, 1,
-0.2833375, -0.2638808, -2.759919, 0, 1, 0.2901961, 1,
-0.2822238, -0.5762905, -2.592613, 0, 1, 0.2980392, 1,
-0.2799944, 0.1620148, -1.761757, 0, 1, 0.3058824, 1,
-0.2769698, 0.3593995, 0.5662858, 0, 1, 0.3098039, 1,
-0.274707, 0.3981664, -0.1600848, 0, 1, 0.3176471, 1,
-0.2685314, 1.398062, -0.6722885, 0, 1, 0.3215686, 1,
-0.2680735, -0.09531107, -0.4540869, 0, 1, 0.3294118, 1,
-0.2659942, -0.9372712, -1.708516, 0, 1, 0.3333333, 1,
-0.2643553, 1.032608, -1.192816, 0, 1, 0.3411765, 1,
-0.2638163, -0.4379121, -3.281083, 0, 1, 0.345098, 1,
-0.261259, 0.7886742, 0.2533941, 0, 1, 0.3529412, 1,
-0.2592408, 0.002052916, -1.644258, 0, 1, 0.3568628, 1,
-0.2560401, 1.228141, 0.1218243, 0, 1, 0.3647059, 1,
-0.2558219, -0.2007773, -2.888303, 0, 1, 0.3686275, 1,
-0.2550557, -0.1407697, -1.918766, 0, 1, 0.3764706, 1,
-0.2541096, -1.488223, -2.845961, 0, 1, 0.3803922, 1,
-0.2432329, 1.257201, -0.9935721, 0, 1, 0.3882353, 1,
-0.2424913, -0.2198524, -3.687966, 0, 1, 0.3921569, 1,
-0.2391153, 0.4100589, -2.91623, 0, 1, 0.4, 1,
-0.2372659, -0.5011486, -3.228799, 0, 1, 0.4078431, 1,
-0.2362644, -0.4939331, -2.994132, 0, 1, 0.4117647, 1,
-0.2345151, -0.7296277, -2.276413, 0, 1, 0.4196078, 1,
-0.2343582, 2.227089, -0.1405795, 0, 1, 0.4235294, 1,
-0.2285066, -1.808621, -3.228092, 0, 1, 0.4313726, 1,
-0.2250197, -0.03473756, 0.02671604, 0, 1, 0.4352941, 1,
-0.2242303, -0.8993261, -2.711114, 0, 1, 0.4431373, 1,
-0.2216855, 0.3054222, -0.2332526, 0, 1, 0.4470588, 1,
-0.2204556, -0.3568389, -3.25384, 0, 1, 0.454902, 1,
-0.2117369, 2.265887, 1.030325, 0, 1, 0.4588235, 1,
-0.2082333, -0.7989643, -4.161926, 0, 1, 0.4666667, 1,
-0.2081579, 1.384904, -0.08542106, 0, 1, 0.4705882, 1,
-0.2072323, 0.008797684, -0.4928453, 0, 1, 0.4784314, 1,
-0.2062454, -0.7942485, -2.680995, 0, 1, 0.4823529, 1,
-0.2034514, -0.1181057, -2.461151, 0, 1, 0.4901961, 1,
-0.2017187, -2.906511, -0.7290301, 0, 1, 0.4941176, 1,
-0.1919564, -1.41257, -3.30795, 0, 1, 0.5019608, 1,
-0.1907023, 0.8091996, -0.2743405, 0, 1, 0.509804, 1,
-0.1900953, -0.4953382, -1.8247, 0, 1, 0.5137255, 1,
-0.1895542, 0.9569499, -2.419126, 0, 1, 0.5215687, 1,
-0.1892926, 1.222176, -0.8157635, 0, 1, 0.5254902, 1,
-0.1880641, 0.08868284, -2.617443, 0, 1, 0.5333334, 1,
-0.1873178, 1.037457, -1.070707, 0, 1, 0.5372549, 1,
-0.1872204, -0.4497499, -2.727529, 0, 1, 0.5450981, 1,
-0.1864348, -1.02836, -2.59321, 0, 1, 0.5490196, 1,
-0.1861421, -1.596211, -1.093868, 0, 1, 0.5568628, 1,
-0.1856315, 0.3087147, -1.716194, 0, 1, 0.5607843, 1,
-0.1839001, 0.5578488, 1.392222, 0, 1, 0.5686275, 1,
-0.1827282, -1.156097, -2.184439, 0, 1, 0.572549, 1,
-0.180108, 0.3240123, -0.8999074, 0, 1, 0.5803922, 1,
-0.1734657, -0.116449, -1.355435, 0, 1, 0.5843138, 1,
-0.1712339, -2.154228, -3.298266, 0, 1, 0.5921569, 1,
-0.1701659, 0.4555069, -1.277874, 0, 1, 0.5960785, 1,
-0.1649194, 1.425462, 0.3323145, 0, 1, 0.6039216, 1,
-0.1642668, 0.7823576, 0.5237235, 0, 1, 0.6117647, 1,
-0.1571331, 1.624321, 0.01845661, 0, 1, 0.6156863, 1,
-0.1552952, 0.9726327, 0.7399906, 0, 1, 0.6235294, 1,
-0.1534319, 0.158976, -1.277558, 0, 1, 0.627451, 1,
-0.1530785, -1.267068, -1.088363, 0, 1, 0.6352941, 1,
-0.1521083, -0.8566591, -2.952797, 0, 1, 0.6392157, 1,
-0.1483079, -2.233138, -0.3944999, 0, 1, 0.6470588, 1,
-0.1471819, 1.120048, -1.989146, 0, 1, 0.6509804, 1,
-0.1447747, 1.316234, 1.282719, 0, 1, 0.6588235, 1,
-0.1332806, -0.9157863, -1.717043, 0, 1, 0.6627451, 1,
-0.1328651, -1.032234, -1.099107, 0, 1, 0.6705883, 1,
-0.132058, -0.06656336, -3.586778, 0, 1, 0.6745098, 1,
-0.1288943, 0.4279557, -1.097323, 0, 1, 0.682353, 1,
-0.1267734, 1.308502, 0.5776116, 0, 1, 0.6862745, 1,
-0.1234242, 0.02829239, -1.566768, 0, 1, 0.6941177, 1,
-0.120327, 0.5252677, 0.2531716, 0, 1, 0.7019608, 1,
-0.1182993, 0.4916916, -1.084946, 0, 1, 0.7058824, 1,
-0.1153496, -1.006227, -3.929506, 0, 1, 0.7137255, 1,
-0.1148339, 1.561725, 0.1059742, 0, 1, 0.7176471, 1,
-0.1040426, 0.07648344, 0.2926163, 0, 1, 0.7254902, 1,
-0.1031052, -0.06681433, -2.767589, 0, 1, 0.7294118, 1,
-0.09736846, 0.7934352, -1.508175, 0, 1, 0.7372549, 1,
-0.09517594, 0.8885537, -0.4136603, 0, 1, 0.7411765, 1,
-0.09281028, -1.199852, -2.955034, 0, 1, 0.7490196, 1,
-0.09217989, 0.2271546, 0.004337381, 0, 1, 0.7529412, 1,
-0.09141692, 0.664066, 1.272275, 0, 1, 0.7607843, 1,
-0.09071776, 0.01901177, -0.003851981, 0, 1, 0.7647059, 1,
-0.08822991, 0.1255601, -1.722721, 0, 1, 0.772549, 1,
-0.08715112, 0.8383718, -0.9061146, 0, 1, 0.7764706, 1,
-0.08522695, 0.3499929, -0.8434315, 0, 1, 0.7843137, 1,
-0.08454021, 0.7163967, 1.458666, 0, 1, 0.7882353, 1,
-0.08411472, -1.782468, -3.18528, 0, 1, 0.7960784, 1,
-0.08277501, -1.203684, -1.512787, 0, 1, 0.8039216, 1,
-0.08189622, 1.314778, -0.5338485, 0, 1, 0.8078431, 1,
-0.0806778, 1.716126, 1.221897, 0, 1, 0.8156863, 1,
-0.07758675, 0.07783113, -1.437349, 0, 1, 0.8196079, 1,
-0.07557327, -0.9101549, -1.187908, 0, 1, 0.827451, 1,
-0.075199, -1.005022, -3.819638, 0, 1, 0.8313726, 1,
-0.07020696, 0.7937491, 0.3281462, 0, 1, 0.8392157, 1,
-0.06938794, 0.1333432, -0.486681, 0, 1, 0.8431373, 1,
-0.06749704, 0.1490949, -1.28496, 0, 1, 0.8509804, 1,
-0.06715453, -0.1549284, -4.091244, 0, 1, 0.854902, 1,
-0.06670345, -0.0580417, -4.163638, 0, 1, 0.8627451, 1,
-0.06496478, -0.6549225, -2.846521, 0, 1, 0.8666667, 1,
-0.05965848, 0.5550244, -0.2927307, 0, 1, 0.8745098, 1,
-0.05952217, -0.4910024, -3.524817, 0, 1, 0.8784314, 1,
-0.05796263, 0.7599952, -1.504954, 0, 1, 0.8862745, 1,
-0.05557613, 0.5608392, 1.469596, 0, 1, 0.8901961, 1,
-0.05500354, -0.3852477, -4.057963, 0, 1, 0.8980392, 1,
-0.04716476, -0.4530009, -2.222994, 0, 1, 0.9058824, 1,
-0.04290586, -1.251496, -2.376437, 0, 1, 0.9098039, 1,
-0.04164062, -0.9057389, -2.491597, 0, 1, 0.9176471, 1,
-0.03964785, -0.2685378, -2.958371, 0, 1, 0.9215686, 1,
-0.03848715, -1.641548, -3.358348, 0, 1, 0.9294118, 1,
-0.0361788, -0.6344694, -1.620076, 0, 1, 0.9333333, 1,
-0.03371021, 1.004866, -0.5750503, 0, 1, 0.9411765, 1,
-0.02459351, -0.2381314, -2.823659, 0, 1, 0.945098, 1,
-0.02313809, -0.6642213, -2.096866, 0, 1, 0.9529412, 1,
-0.0202169, -0.5183543, -2.431888, 0, 1, 0.9568627, 1,
-0.01970044, -2.349493, -2.107334, 0, 1, 0.9647059, 1,
-0.01436519, -0.6245789, -2.950672, 0, 1, 0.9686275, 1,
-0.01256332, -0.3433243, -3.710634, 0, 1, 0.9764706, 1,
-0.01233525, 0.8647293, 0.1874947, 0, 1, 0.9803922, 1,
-0.01178232, -0.4963275, -3.803963, 0, 1, 0.9882353, 1,
-0.009148412, 0.1907392, 0.186095, 0, 1, 0.9921569, 1,
-0.00511646, 1.636491, 0.1296873, 0, 1, 1, 1,
-0.005044521, 0.8345016, -0.1105002, 0, 0.9921569, 1, 1,
-0.003403886, -1.154272, -2.549706, 0, 0.9882353, 1, 1,
3.255864e-05, -0.343944, 4.1323, 0, 0.9803922, 1, 1,
0.00433763, -1.121287, 4.34326, 0, 0.9764706, 1, 1,
0.006416688, 1.167008, -0.7972191, 0, 0.9686275, 1, 1,
0.007324277, -0.8894265, 2.981388, 0, 0.9647059, 1, 1,
0.01284043, 0.2542186, -1.045549, 0, 0.9568627, 1, 1,
0.01809057, 1.928402, 0.8516057, 0, 0.9529412, 1, 1,
0.02153432, -2.144531, 3.261135, 0, 0.945098, 1, 1,
0.02242539, -2.496505, 3.778077, 0, 0.9411765, 1, 1,
0.02276521, 0.2542147, 0.7877426, 0, 0.9333333, 1, 1,
0.02587342, -0.2299405, 1.791935, 0, 0.9294118, 1, 1,
0.02786626, 0.9405001, -1.176125, 0, 0.9215686, 1, 1,
0.02810204, -0.366117, 3.710432, 0, 0.9176471, 1, 1,
0.03767611, -0.1751067, 3.102222, 0, 0.9098039, 1, 1,
0.04081199, -0.6671849, 4.317294, 0, 0.9058824, 1, 1,
0.04520512, 0.807296, 0.1740973, 0, 0.8980392, 1, 1,
0.04558321, 0.1837521, -1.147665, 0, 0.8901961, 1, 1,
0.04889706, -0.006725638, 2.421344, 0, 0.8862745, 1, 1,
0.05870077, -1.002158, 2.257025, 0, 0.8784314, 1, 1,
0.0601353, -1.253691, 2.740979, 0, 0.8745098, 1, 1,
0.0607767, -0.1460702, 1.922862, 0, 0.8666667, 1, 1,
0.06097934, -1.180864, 4.078115, 0, 0.8627451, 1, 1,
0.06261186, 0.04656337, 1.789405, 0, 0.854902, 1, 1,
0.06319904, 0.4489934, -0.5370279, 0, 0.8509804, 1, 1,
0.06895089, 0.8886825, -0.05220584, 0, 0.8431373, 1, 1,
0.07414004, 1.186032, -1.150061, 0, 0.8392157, 1, 1,
0.07790697, -0.7565157, 1.333743, 0, 0.8313726, 1, 1,
0.09232206, -0.2076018, 3.158247, 0, 0.827451, 1, 1,
0.09402363, 0.05243318, 2.053686, 0, 0.8196079, 1, 1,
0.09403963, -0.260134, 1.431958, 0, 0.8156863, 1, 1,
0.09498929, -0.7981952, 2.394169, 0, 0.8078431, 1, 1,
0.09742039, -0.1926095, 2.335174, 0, 0.8039216, 1, 1,
0.1003616, -0.1526242, 1.413782, 0, 0.7960784, 1, 1,
0.1019362, -1.276496, 3.650197, 0, 0.7882353, 1, 1,
0.1038333, 2.579579, 1.640961, 0, 0.7843137, 1, 1,
0.1040758, -0.3997967, 0.5476753, 0, 0.7764706, 1, 1,
0.1041721, 1.991045, -0.05881358, 0, 0.772549, 1, 1,
0.1060032, 1.19419, 0.2870598, 0, 0.7647059, 1, 1,
0.1098405, -1.410758, 2.346148, 0, 0.7607843, 1, 1,
0.1164097, -0.8136599, 1.994007, 0, 0.7529412, 1, 1,
0.1169459, -0.1363205, 1.608437, 0, 0.7490196, 1, 1,
0.1172401, 0.1142721, -0.4000866, 0, 0.7411765, 1, 1,
0.1205196, -0.1162356, 1.566224, 0, 0.7372549, 1, 1,
0.1294521, -0.1813754, 2.524608, 0, 0.7294118, 1, 1,
0.1311398, 0.4133454, 1.133898, 0, 0.7254902, 1, 1,
0.1313731, 0.8868008, -1.010492, 0, 0.7176471, 1, 1,
0.1325244, -1.001898, 3.483565, 0, 0.7137255, 1, 1,
0.1377336, 0.6507691, 1.048303, 0, 0.7058824, 1, 1,
0.1433491, -4.118605, 3.133931, 0, 0.6980392, 1, 1,
0.1495784, 0.9549472, 0.6450263, 0, 0.6941177, 1, 1,
0.1557606, -0.2220942, 2.526041, 0, 0.6862745, 1, 1,
0.1681675, 0.4269949, -1.485189, 0, 0.682353, 1, 1,
0.1683992, 1.176408, 1.77958, 0, 0.6745098, 1, 1,
0.1684595, -1.09838, 4.696321, 0, 0.6705883, 1, 1,
0.1685496, -0.4046475, 0.726894, 0, 0.6627451, 1, 1,
0.1701517, -0.3065524, 2.538487, 0, 0.6588235, 1, 1,
0.1718781, -0.705451, 4.622962, 0, 0.6509804, 1, 1,
0.1737603, -0.005585095, 0.9046748, 0, 0.6470588, 1, 1,
0.1790404, -1.760949, 2.241342, 0, 0.6392157, 1, 1,
0.1817649, 0.1922385, -0.6860307, 0, 0.6352941, 1, 1,
0.181879, -1.289303, 2.645267, 0, 0.627451, 1, 1,
0.1834236, 1.034294, -1.839381, 0, 0.6235294, 1, 1,
0.185994, 0.4900659, 0.9533241, 0, 0.6156863, 1, 1,
0.189079, 1.688863, 0.8113106, 0, 0.6117647, 1, 1,
0.1894314, 0.1063726, 0.2397265, 0, 0.6039216, 1, 1,
0.1895612, -0.859706, 3.336543, 0, 0.5960785, 1, 1,
0.1913387, 0.6513021, 0.8876592, 0, 0.5921569, 1, 1,
0.1926021, 0.5041252, 0.1879694, 0, 0.5843138, 1, 1,
0.1939346, 1.362576, -2.321365, 0, 0.5803922, 1, 1,
0.1967176, -0.9819102, 2.36163, 0, 0.572549, 1, 1,
0.1992308, -0.274525, 3.914855, 0, 0.5686275, 1, 1,
0.2003848, 2.256891, -1.538457, 0, 0.5607843, 1, 1,
0.2102506, 1.785974, 0.5923555, 0, 0.5568628, 1, 1,
0.2107962, 1.441872, 1.248543, 0, 0.5490196, 1, 1,
0.2154243, 1.111042, -0.1462171, 0, 0.5450981, 1, 1,
0.2155738, 0.08217349, -0.2738857, 0, 0.5372549, 1, 1,
0.2162421, -1.491228, 2.745168, 0, 0.5333334, 1, 1,
0.2205996, 0.1977273, 0.0785478, 0, 0.5254902, 1, 1,
0.221335, -0.1417659, 2.007706, 0, 0.5215687, 1, 1,
0.2267548, -0.8156454, 5.015086, 0, 0.5137255, 1, 1,
0.2299688, 0.2116422, 1.435677, 0, 0.509804, 1, 1,
0.2310022, -0.8288844, 2.941115, 0, 0.5019608, 1, 1,
0.2327057, 0.4678056, 0.8043419, 0, 0.4941176, 1, 1,
0.2330777, -0.4105955, 4.275454, 0, 0.4901961, 1, 1,
0.238349, 1.766945, -1.981001, 0, 0.4823529, 1, 1,
0.2396591, 1.24242, 0.4045123, 0, 0.4784314, 1, 1,
0.2428305, -1.034023, 2.476728, 0, 0.4705882, 1, 1,
0.2551008, -0.7684736, 4.369147, 0, 0.4666667, 1, 1,
0.2555087, -0.6957586, 3.710194, 0, 0.4588235, 1, 1,
0.2578105, 0.2608614, 0.418007, 0, 0.454902, 1, 1,
0.2621343, 0.8774924, 0.05642751, 0, 0.4470588, 1, 1,
0.262144, -1.111774, 3.610897, 0, 0.4431373, 1, 1,
0.264528, 0.1869981, 0.3977536, 0, 0.4352941, 1, 1,
0.2655518, 1.001774, -0.3044894, 0, 0.4313726, 1, 1,
0.2662839, 0.9453577, 0.5092835, 0, 0.4235294, 1, 1,
0.2679603, -0.9787402, 1.499602, 0, 0.4196078, 1, 1,
0.2688578, 0.3688636, 1.368925, 0, 0.4117647, 1, 1,
0.2715318, 0.9015197, -0.1931774, 0, 0.4078431, 1, 1,
0.2737427, -0.8535987, 3.71757, 0, 0.4, 1, 1,
0.2749326, -0.4476031, 2.719473, 0, 0.3921569, 1, 1,
0.2755447, 0.3556392, 2.491017, 0, 0.3882353, 1, 1,
0.2762467, -1.027434, 2.886419, 0, 0.3803922, 1, 1,
0.2845315, 1.115936, 1.880657, 0, 0.3764706, 1, 1,
0.2866085, 0.7153985, 1.047452, 0, 0.3686275, 1, 1,
0.2867599, -0.9623374, 1.941445, 0, 0.3647059, 1, 1,
0.2871777, 0.2175105, -0.8106679, 0, 0.3568628, 1, 1,
0.2872811, 1.531224, -0.7480612, 0, 0.3529412, 1, 1,
0.2877667, 0.7705001, -0.5796019, 0, 0.345098, 1, 1,
0.2921938, -1.136313, 4.89007, 0, 0.3411765, 1, 1,
0.296422, -0.5366267, 2.316433, 0, 0.3333333, 1, 1,
0.297904, 1.082417, -0.5508515, 0, 0.3294118, 1, 1,
0.302048, -1.080679, 3.477823, 0, 0.3215686, 1, 1,
0.3068719, -2.410851, 2.684604, 0, 0.3176471, 1, 1,
0.3069923, -0.08720917, 2.772655, 0, 0.3098039, 1, 1,
0.3071221, 0.060708, 1.78735, 0, 0.3058824, 1, 1,
0.3103966, -0.396335, 2.891085, 0, 0.2980392, 1, 1,
0.3151805, -0.4315868, 2.323637, 0, 0.2901961, 1, 1,
0.3171936, -0.3764031, 4.528128, 0, 0.2862745, 1, 1,
0.3177554, 0.06279146, 2.32959, 0, 0.2784314, 1, 1,
0.3179263, -0.8774253, 4.870317, 0, 0.2745098, 1, 1,
0.3211554, -0.7229413, 4.748457, 0, 0.2666667, 1, 1,
0.32664, 0.1415993, 2.762538, 0, 0.2627451, 1, 1,
0.3326758, -1.010352, 3.63214, 0, 0.254902, 1, 1,
0.3339915, -0.3960858, 2.781346, 0, 0.2509804, 1, 1,
0.3356647, -0.792304, 2.595273, 0, 0.2431373, 1, 1,
0.3360607, -0.1152317, 1.387174, 0, 0.2392157, 1, 1,
0.3366453, 0.4359551, -0.8386831, 0, 0.2313726, 1, 1,
0.3385816, -0.8198959, 2.031931, 0, 0.227451, 1, 1,
0.338788, -0.2078429, 3.021279, 0, 0.2196078, 1, 1,
0.3400312, 1.661098, 1.00337, 0, 0.2156863, 1, 1,
0.3406488, 0.7987286, 1.557425, 0, 0.2078431, 1, 1,
0.3413539, 0.5838202, 1.287852, 0, 0.2039216, 1, 1,
0.3415959, 0.3254561, -0.5641433, 0, 0.1960784, 1, 1,
0.3426168, -0.1365916, 1.663556, 0, 0.1882353, 1, 1,
0.34308, 0.362216, 0.4035442, 0, 0.1843137, 1, 1,
0.3433244, 2.241663, 0.8705217, 0, 0.1764706, 1, 1,
0.3434912, -0.7102665, 2.842574, 0, 0.172549, 1, 1,
0.3487769, -2.013995, 3.275069, 0, 0.1647059, 1, 1,
0.3513342, -0.5350937, 2.715695, 0, 0.1607843, 1, 1,
0.3532028, 0.9014978, -0.6485336, 0, 0.1529412, 1, 1,
0.3604704, 0.1989167, -0.5331663, 0, 0.1490196, 1, 1,
0.3634551, 2.811154, 1.213983, 0, 0.1411765, 1, 1,
0.3644956, -0.6877665, 3.375683, 0, 0.1372549, 1, 1,
0.3702966, 0.1581865, 2.295565, 0, 0.1294118, 1, 1,
0.3737833, 0.9988793, 0.9045871, 0, 0.1254902, 1, 1,
0.3778431, 1.126178, 0.06546501, 0, 0.1176471, 1, 1,
0.3816196, 1.414698, 0.5330464, 0, 0.1137255, 1, 1,
0.3856301, -0.2777596, 3.854792, 0, 0.1058824, 1, 1,
0.386221, -0.8976759, 4.770456, 0, 0.09803922, 1, 1,
0.3901997, -0.1332188, 0.2110847, 0, 0.09411765, 1, 1,
0.3917841, 0.6822183, 1.140787, 0, 0.08627451, 1, 1,
0.3962182, 0.4068231, 2.240633, 0, 0.08235294, 1, 1,
0.3991373, 1.479303, -0.03690398, 0, 0.07450981, 1, 1,
0.4003739, 0.8128994, -0.3180529, 0, 0.07058824, 1, 1,
0.4054442, -1.373937, 2.802102, 0, 0.0627451, 1, 1,
0.4097331, -0.3469305, 4.281363, 0, 0.05882353, 1, 1,
0.4103061, -2.112217, 3.305135, 0, 0.05098039, 1, 1,
0.4123808, -0.8917867, 3.122738, 0, 0.04705882, 1, 1,
0.4126544, -1.098212, 4.744744, 0, 0.03921569, 1, 1,
0.4130046, -1.330723, 0.8034105, 0, 0.03529412, 1, 1,
0.4137382, -0.1435608, 0.6935737, 0, 0.02745098, 1, 1,
0.4218286, -0.1003318, 2.290311, 0, 0.02352941, 1, 1,
0.4243878, 0.4899567, 0.009281241, 0, 0.01568628, 1, 1,
0.4274722, -0.2001655, 1.447843, 0, 0.01176471, 1, 1,
0.4296081, 0.4550015, 1.550449, 0, 0.003921569, 1, 1,
0.4299772, 0.8076774, 2.348407, 0.003921569, 0, 1, 1,
0.4342032, -0.136659, -0.878235, 0.007843138, 0, 1, 1,
0.4405856, 1.560006, 1.345719, 0.01568628, 0, 1, 1,
0.4446786, -0.4181723, 2.928054, 0.01960784, 0, 1, 1,
0.4461856, -1.748354, 3.504306, 0.02745098, 0, 1, 1,
0.4466994, -0.02000852, 1.643873, 0.03137255, 0, 1, 1,
0.4477447, -0.149863, 1.565449, 0.03921569, 0, 1, 1,
0.4654384, -0.5764948, 2.022577, 0.04313726, 0, 1, 1,
0.4657705, -1.45318, 2.84005, 0.05098039, 0, 1, 1,
0.4660596, 0.3742279, 2.075546, 0.05490196, 0, 1, 1,
0.4740302, 0.3859942, 1.612025, 0.0627451, 0, 1, 1,
0.4818682, 1.53741, -0.5677252, 0.06666667, 0, 1, 1,
0.4837336, 0.06045977, 2.012691, 0.07450981, 0, 1, 1,
0.4882471, -0.1313955, 2.974187, 0.07843138, 0, 1, 1,
0.4905876, -2.208692, 3.733683, 0.08627451, 0, 1, 1,
0.4924875, -1.060234, 2.762652, 0.09019608, 0, 1, 1,
0.4958686, 0.6592434, 2.252872, 0.09803922, 0, 1, 1,
0.4990546, -0.380057, 1.635318, 0.1058824, 0, 1, 1,
0.5001357, -1.922289, 2.492388, 0.1098039, 0, 1, 1,
0.5013874, 1.375265, 0.8847089, 0.1176471, 0, 1, 1,
0.5044522, 0.2028526, 0.5723958, 0.1215686, 0, 1, 1,
0.5048045, 1.59143, -1.044166, 0.1294118, 0, 1, 1,
0.5075693, -0.948881, 0.781422, 0.1333333, 0, 1, 1,
0.5123359, 0.6970646, 1.979493, 0.1411765, 0, 1, 1,
0.5124474, 0.4223399, 0.5299046, 0.145098, 0, 1, 1,
0.513039, 0.3146673, -1.418928, 0.1529412, 0, 1, 1,
0.5137416, 0.227215, 2.105595, 0.1568628, 0, 1, 1,
0.5150656, 2.022008, 1.52275, 0.1647059, 0, 1, 1,
0.5181657, 1.244213, 0.498771, 0.1686275, 0, 1, 1,
0.524112, -1.102855, 3.462661, 0.1764706, 0, 1, 1,
0.5288819, 0.3584465, 1.659817, 0.1803922, 0, 1, 1,
0.5295711, 1.988082, 0.9990426, 0.1882353, 0, 1, 1,
0.5297133, -1.885289, 3.104519, 0.1921569, 0, 1, 1,
0.531538, 1.821177, -1.559659, 0.2, 0, 1, 1,
0.5325452, -1.05797, 2.824731, 0.2078431, 0, 1, 1,
0.5335442, -1.911107, 3.498267, 0.2117647, 0, 1, 1,
0.5374996, -0.1025931, 2.185772, 0.2196078, 0, 1, 1,
0.5386954, 0.09600925, 3.588152, 0.2235294, 0, 1, 1,
0.540915, -0.1394243, 1.63163, 0.2313726, 0, 1, 1,
0.5412418, 1.801533, -0.01492315, 0.2352941, 0, 1, 1,
0.5444247, -1.024972, 3.854061, 0.2431373, 0, 1, 1,
0.5452309, -1.002875, 2.559858, 0.2470588, 0, 1, 1,
0.54746, -0.6041898, 3.195203, 0.254902, 0, 1, 1,
0.552325, -0.2740237, 2.883178, 0.2588235, 0, 1, 1,
0.5553524, 1.439195, 2.720556, 0.2666667, 0, 1, 1,
0.5581408, 1.469145, 1.271902, 0.2705882, 0, 1, 1,
0.5610108, 1.10631, 0.1821594, 0.2784314, 0, 1, 1,
0.5668722, -0.4712833, 0.5177332, 0.282353, 0, 1, 1,
0.5721779, 0.3293962, 2.535352, 0.2901961, 0, 1, 1,
0.574666, -1.108924, 0.1940949, 0.2941177, 0, 1, 1,
0.574856, -0.413588, 2.056949, 0.3019608, 0, 1, 1,
0.5775579, -0.3799337, 1.864958, 0.3098039, 0, 1, 1,
0.5779275, -0.6915368, 0.8522068, 0.3137255, 0, 1, 1,
0.5881466, 1.041378, -0.4703165, 0.3215686, 0, 1, 1,
0.5903022, 1.234884, 1.136308, 0.3254902, 0, 1, 1,
0.5947168, -0.8540348, 3.391381, 0.3333333, 0, 1, 1,
0.6040357, 0.6553304, 1.637396, 0.3372549, 0, 1, 1,
0.6061355, -1.213546, 1.062806, 0.345098, 0, 1, 1,
0.6124179, -0.1659341, 2.938119, 0.3490196, 0, 1, 1,
0.6128708, -0.8575919, 3.649547, 0.3568628, 0, 1, 1,
0.6150516, -0.1595996, 1.041252, 0.3607843, 0, 1, 1,
0.6189969, 0.4518337, 2.159914, 0.3686275, 0, 1, 1,
0.6222821, 1.036948, 0.1578842, 0.372549, 0, 1, 1,
0.6235194, 0.8528553, 2.288001, 0.3803922, 0, 1, 1,
0.6286495, 1.0627, -0.1728197, 0.3843137, 0, 1, 1,
0.6343977, 0.7892692, 0.3629178, 0.3921569, 0, 1, 1,
0.6372041, 0.7288871, 0.03200409, 0.3960784, 0, 1, 1,
0.6380403, -1.50597, 2.186299, 0.4039216, 0, 1, 1,
0.6435169, -1.713965, 2.954902, 0.4117647, 0, 1, 1,
0.6445156, 0.230938, 2.03095, 0.4156863, 0, 1, 1,
0.6464164, 0.8697534, 1.730372, 0.4235294, 0, 1, 1,
0.6472459, -0.2040484, 0.8994976, 0.427451, 0, 1, 1,
0.6490217, 0.008072086, 2.824684, 0.4352941, 0, 1, 1,
0.6490899, 1.781401, -0.8954659, 0.4392157, 0, 1, 1,
0.649409, -0.5470394, 2.015188, 0.4470588, 0, 1, 1,
0.6519845, -1.159193, 4.007795, 0.4509804, 0, 1, 1,
0.6609967, 0.7138468, 1.213145, 0.4588235, 0, 1, 1,
0.6635323, 0.8301419, 2.276052, 0.4627451, 0, 1, 1,
0.6690369, -0.3987377, 3.042312, 0.4705882, 0, 1, 1,
0.6702431, -0.1011645, 2.956013, 0.4745098, 0, 1, 1,
0.6714662, -1.359384, 1.637876, 0.4823529, 0, 1, 1,
0.6746048, -1.06416, 0.7505783, 0.4862745, 0, 1, 1,
0.6789429, -0.9158351, 1.924584, 0.4941176, 0, 1, 1,
0.6834193, 1.284606, 2.281285, 0.5019608, 0, 1, 1,
0.6856599, 1.403143, 1.196059, 0.5058824, 0, 1, 1,
0.6872091, 0.06040508, 0.8460472, 0.5137255, 0, 1, 1,
0.6904697, 1.153689, 1.203375, 0.5176471, 0, 1, 1,
0.6930171, 1.355555, 1.25261, 0.5254902, 0, 1, 1,
0.6941255, -0.4903842, 3.52515, 0.5294118, 0, 1, 1,
0.6944382, -0.4335208, 1.935317, 0.5372549, 0, 1, 1,
0.6978412, 0.4672019, 1.126123, 0.5411765, 0, 1, 1,
0.7035959, 0.450082, -0.2902313, 0.5490196, 0, 1, 1,
0.7069082, 1.148451, 0.7208568, 0.5529412, 0, 1, 1,
0.7117022, -0.07409434, 1.614878, 0.5607843, 0, 1, 1,
0.7219108, -0.1202175, 1.089082, 0.5647059, 0, 1, 1,
0.7259479, 1.549367, 1.548962, 0.572549, 0, 1, 1,
0.7325516, 1.303647, 1.598804, 0.5764706, 0, 1, 1,
0.7365609, -0.103002, 1.885269, 0.5843138, 0, 1, 1,
0.7373509, -0.6114207, 3.398787, 0.5882353, 0, 1, 1,
0.7502067, -1.141273, 2.45649, 0.5960785, 0, 1, 1,
0.7527848, 0.4479182, 1.599301, 0.6039216, 0, 1, 1,
0.754261, 0.3410944, 1.493044, 0.6078432, 0, 1, 1,
0.7569662, -0.2010133, 3.050089, 0.6156863, 0, 1, 1,
0.7607331, 0.6977634, -0.1734638, 0.6196079, 0, 1, 1,
0.764372, 1.104126, 0.04474135, 0.627451, 0, 1, 1,
0.772575, -0.04386633, 0.8970092, 0.6313726, 0, 1, 1,
0.7811534, 0.006790824, 1.276968, 0.6392157, 0, 1, 1,
0.7886508, 0.5581474, -0.7408122, 0.6431373, 0, 1, 1,
0.7888471, -0.4525649, 2.010585, 0.6509804, 0, 1, 1,
0.7899928, 0.3674608, 0.7718241, 0.654902, 0, 1, 1,
0.7907971, -0.1980215, 1.922084, 0.6627451, 0, 1, 1,
0.7938484, -0.7740979, 3.735412, 0.6666667, 0, 1, 1,
0.794259, -0.6317816, 1.119076, 0.6745098, 0, 1, 1,
0.7950571, -1.076036, 3.121199, 0.6784314, 0, 1, 1,
0.7951406, -1.732743, 2.524945, 0.6862745, 0, 1, 1,
0.7963737, 0.3234622, -0.7445012, 0.6901961, 0, 1, 1,
0.8001599, 0.778899, 0.5153162, 0.6980392, 0, 1, 1,
0.8002065, 1.202159, 0.9788203, 0.7058824, 0, 1, 1,
0.8002666, 1.320602, 0.5441296, 0.7098039, 0, 1, 1,
0.8004516, -1.694715, 4.615172, 0.7176471, 0, 1, 1,
0.81234, -0.009956812, 2.140035, 0.7215686, 0, 1, 1,
0.8134212, -0.2269548, 2.342507, 0.7294118, 0, 1, 1,
0.8140062, -1.201945, 2.227336, 0.7333333, 0, 1, 1,
0.8190064, 0.489078, 0.708764, 0.7411765, 0, 1, 1,
0.8248778, -0.765038, 1.452435, 0.7450981, 0, 1, 1,
0.8270433, 0.6741653, -0.3198741, 0.7529412, 0, 1, 1,
0.8345758, 1.227445, -0.5454583, 0.7568628, 0, 1, 1,
0.8492601, -1.582449, 3.305568, 0.7647059, 0, 1, 1,
0.850035, 0.1162824, 1.415347, 0.7686275, 0, 1, 1,
0.8564534, -1.221535, 1.69134, 0.7764706, 0, 1, 1,
0.8582924, 0.09861588, 0.08493406, 0.7803922, 0, 1, 1,
0.8595003, 1.718926, 0.7696466, 0.7882353, 0, 1, 1,
0.8647123, -0.8642743, 2.80703, 0.7921569, 0, 1, 1,
0.8715513, 0.3105104, -0.7742421, 0.8, 0, 1, 1,
0.8728745, -0.5892435, 1.219611, 0.8078431, 0, 1, 1,
0.8728963, 0.7948703, 0.5901829, 0.8117647, 0, 1, 1,
0.8771839, 0.1798919, 3.409063, 0.8196079, 0, 1, 1,
0.8778892, -0.62813, 0.87083, 0.8235294, 0, 1, 1,
0.8792481, 0.8165504, 3.016903, 0.8313726, 0, 1, 1,
0.8956891, -0.4717985, 2.92777, 0.8352941, 0, 1, 1,
0.8962316, 0.07773182, 2.110946, 0.8431373, 0, 1, 1,
0.8981308, 1.042274, 0.5902702, 0.8470588, 0, 1, 1,
0.9037084, -1.154707, 1.860857, 0.854902, 0, 1, 1,
0.906587, -1.281713, 4.759303, 0.8588235, 0, 1, 1,
0.9137727, 0.9525281, -1.491368, 0.8666667, 0, 1, 1,
0.9148849, -0.915257, 2.320049, 0.8705882, 0, 1, 1,
0.9198871, 0.4715656, 1.048063, 0.8784314, 0, 1, 1,
0.9328258, 3.221004, 0.8534843, 0.8823529, 0, 1, 1,
0.934655, -0.4921601, 1.502919, 0.8901961, 0, 1, 1,
0.9424539, -0.9120323, 3.237236, 0.8941177, 0, 1, 1,
0.9444414, 0.7386014, 1.132302, 0.9019608, 0, 1, 1,
0.9452884, -1.354334, 5.580511, 0.9098039, 0, 1, 1,
0.9469, 1.468131, 1.513097, 0.9137255, 0, 1, 1,
0.9515471, -0.2642617, 1.793053, 0.9215686, 0, 1, 1,
0.9565293, -1.221276, 3.61942, 0.9254902, 0, 1, 1,
0.9658986, -1.781559, 1.937105, 0.9333333, 0, 1, 1,
0.9678313, -0.740562, 1.493385, 0.9372549, 0, 1, 1,
0.9715688, 1.272378, 2.129109, 0.945098, 0, 1, 1,
0.9732026, 0.01420198, 0.5668334, 0.9490196, 0, 1, 1,
0.975556, 0.5599744, 0.5856668, 0.9568627, 0, 1, 1,
0.9835516, -0.3260922, 2.810741, 0.9607843, 0, 1, 1,
0.9902896, 0.4729281, 1.042306, 0.9686275, 0, 1, 1,
0.9923214, -0.7666492, 1.665501, 0.972549, 0, 1, 1,
1.000278, -0.8794109, 1.814553, 0.9803922, 0, 1, 1,
1.000546, 1.559325, 1.324303, 0.9843137, 0, 1, 1,
1.001508, -0.9438582, 3.089382, 0.9921569, 0, 1, 1,
1.006752, 0.355832, 3.363895, 0.9960784, 0, 1, 1,
1.01453, -0.05787713, 2.294594, 1, 0, 0.9960784, 1,
1.016371, -0.436054, 2.556629, 1, 0, 0.9882353, 1,
1.025054, 0.5779996, 0.5463339, 1, 0, 0.9843137, 1,
1.02836, 0.2819288, 1.122204, 1, 0, 0.9764706, 1,
1.028622, -1.742327, 1.385597, 1, 0, 0.972549, 1,
1.033307, 0.1905586, 1.79957, 1, 0, 0.9647059, 1,
1.044969, -1.029415, 0.9212039, 1, 0, 0.9607843, 1,
1.063707, 1.442716, 1.224796, 1, 0, 0.9529412, 1,
1.067464, -1.587295, 1.864678, 1, 0, 0.9490196, 1,
1.06813, -1.242927, 2.078804, 1, 0, 0.9411765, 1,
1.075809, -0.8128723, 2.653051, 1, 0, 0.9372549, 1,
1.083453, 0.7967207, 0.6644433, 1, 0, 0.9294118, 1,
1.089724, -2.161911, 2.630143, 1, 0, 0.9254902, 1,
1.093212, -0.1624865, 3.877146, 1, 0, 0.9176471, 1,
1.094787, 0.5263335, 1.452823, 1, 0, 0.9137255, 1,
1.096454, 2.576862, 1.473622, 1, 0, 0.9058824, 1,
1.098601, -1.084025, 2.574687, 1, 0, 0.9019608, 1,
1.099746, -1.262415, 3.742343, 1, 0, 0.8941177, 1,
1.110198, 0.7873254, 0.1666728, 1, 0, 0.8862745, 1,
1.115286, 0.2549466, 1.742782, 1, 0, 0.8823529, 1,
1.117618, -0.2612709, 3.605211, 1, 0, 0.8745098, 1,
1.120895, 0.297523, 2.577733, 1, 0, 0.8705882, 1,
1.125576, 0.1378065, 1.454744, 1, 0, 0.8627451, 1,
1.128099, 0.1639697, 2.194035, 1, 0, 0.8588235, 1,
1.128171, 1.670019, 0.205588, 1, 0, 0.8509804, 1,
1.133527, 0.01652449, 1.58362, 1, 0, 0.8470588, 1,
1.134056, 0.1149862, 0.4101884, 1, 0, 0.8392157, 1,
1.136094, -2.365613, 2.051728, 1, 0, 0.8352941, 1,
1.142143, 0.3720454, 0.06120122, 1, 0, 0.827451, 1,
1.142541, 0.1367669, 1.826721, 1, 0, 0.8235294, 1,
1.1447, 1.39168, 1.166556, 1, 0, 0.8156863, 1,
1.154134, 0.398897, 0.6815567, 1, 0, 0.8117647, 1,
1.155069, 0.6065595, 0.5653096, 1, 0, 0.8039216, 1,
1.157102, -0.5136391, 1.168746, 1, 0, 0.7960784, 1,
1.164913, -1.047797, 1.646691, 1, 0, 0.7921569, 1,
1.175097, -0.9977859, 4.01044, 1, 0, 0.7843137, 1,
1.175175, -0.1899086, 1.58084, 1, 0, 0.7803922, 1,
1.178344, -0.4794919, 1.073677, 1, 0, 0.772549, 1,
1.178984, -0.2628186, 2.360425, 1, 0, 0.7686275, 1,
1.17944, -0.01711729, 1.679556, 1, 0, 0.7607843, 1,
1.181974, 0.2660128, 1.175555, 1, 0, 0.7568628, 1,
1.186801, 0.27121, 1.815619, 1, 0, 0.7490196, 1,
1.192103, 0.7230249, 1.579189, 1, 0, 0.7450981, 1,
1.204297, -1.301463, 2.631487, 1, 0, 0.7372549, 1,
1.207471, 0.3777254, 1.615597, 1, 0, 0.7333333, 1,
1.212673, 1.077053, 0.4202384, 1, 0, 0.7254902, 1,
1.215845, -0.3129403, 3.353622, 1, 0, 0.7215686, 1,
1.216455, 0.7365278, -0.06727517, 1, 0, 0.7137255, 1,
1.226497, -0.3599173, 2.970366, 1, 0, 0.7098039, 1,
1.229019, 0.4858924, 1.266979, 1, 0, 0.7019608, 1,
1.232407, 1.374612, 0.1172261, 1, 0, 0.6941177, 1,
1.233376, 0.9735559, 2.153264, 1, 0, 0.6901961, 1,
1.238886, 0.2749877, 3.005271, 1, 0, 0.682353, 1,
1.252915, -2.030044, 3.991269, 1, 0, 0.6784314, 1,
1.252982, 0.3769229, 1.16578, 1, 0, 0.6705883, 1,
1.263275, 0.7490411, 1.124506, 1, 0, 0.6666667, 1,
1.263933, -0.2003926, 1.672758, 1, 0, 0.6588235, 1,
1.26948, 1.130583, 1.390632, 1, 0, 0.654902, 1,
1.29673, 0.3958242, 0.9781346, 1, 0, 0.6470588, 1,
1.299241, -0.2482525, 1.813141, 1, 0, 0.6431373, 1,
1.306051, -1.252883, 1.891716, 1, 0, 0.6352941, 1,
1.306691, -0.5132621, 1.191528, 1, 0, 0.6313726, 1,
1.321526, -2.496343, 2.943962, 1, 0, 0.6235294, 1,
1.325379, -0.9138691, 2.798824, 1, 0, 0.6196079, 1,
1.330747, 0.3059222, -0.9517985, 1, 0, 0.6117647, 1,
1.336466, -1.481162, 3.961772, 1, 0, 0.6078432, 1,
1.356366, 1.204212, 0.4966088, 1, 0, 0.6, 1,
1.359169, 0.2789681, 0.7307058, 1, 0, 0.5921569, 1,
1.36125, 0.9911683, 1.650447, 1, 0, 0.5882353, 1,
1.363124, 0.7686826, 1.043885, 1, 0, 0.5803922, 1,
1.364732, 0.1537693, 0.2122926, 1, 0, 0.5764706, 1,
1.373046, 1.742676, 0.5354741, 1, 0, 0.5686275, 1,
1.37737, -0.4421913, 1.882912, 1, 0, 0.5647059, 1,
1.378985, -0.7672274, 2.211402, 1, 0, 0.5568628, 1,
1.379771, 0.1475925, -0.1261579, 1, 0, 0.5529412, 1,
1.386467, 0.192511, 2.705208, 1, 0, 0.5450981, 1,
1.400778, 0.6281346, 1.00924, 1, 0, 0.5411765, 1,
1.410217, 0.2188786, 1.151505, 1, 0, 0.5333334, 1,
1.413169, -0.5038847, 1.261665, 1, 0, 0.5294118, 1,
1.414086, -1.202435, 1.457518, 1, 0, 0.5215687, 1,
1.415511, 2.223999, 0.4517897, 1, 0, 0.5176471, 1,
1.418879, -0.1449955, 1.25196, 1, 0, 0.509804, 1,
1.422989, 0.9142054, 2.07335, 1, 0, 0.5058824, 1,
1.448621, 0.1921189, 1.61403, 1, 0, 0.4980392, 1,
1.454766, 1.359781, 1.710753, 1, 0, 0.4901961, 1,
1.462119, -0.7070375, 2.48779, 1, 0, 0.4862745, 1,
1.466064, 0.5516049, 2.081696, 1, 0, 0.4784314, 1,
1.466966, -0.5022615, 1.786023, 1, 0, 0.4745098, 1,
1.472357, 0.3820381, 3.529003, 1, 0, 0.4666667, 1,
1.475945, 0.8300099, 1.003515, 1, 0, 0.4627451, 1,
1.4846, 1.467261, 1.576157, 1, 0, 0.454902, 1,
1.487636, -0.1807009, 2.156939, 1, 0, 0.4509804, 1,
1.48984, 1.797712, 0.3353407, 1, 0, 0.4431373, 1,
1.506422, 0.8517285, -0.01903311, 1, 0, 0.4392157, 1,
1.512307, -1.464048, 2.336977, 1, 0, 0.4313726, 1,
1.518895, -0.812095, 1.220461, 1, 0, 0.427451, 1,
1.535821, -0.3681526, 2.146729, 1, 0, 0.4196078, 1,
1.542258, -2.212614, 1.600011, 1, 0, 0.4156863, 1,
1.54541, -0.138929, 1.370715, 1, 0, 0.4078431, 1,
1.554305, -0.5222507, 0.8168512, 1, 0, 0.4039216, 1,
1.559711, -0.8392429, 1.476479, 1, 0, 0.3960784, 1,
1.561027, 1.045378, -1.068315, 1, 0, 0.3882353, 1,
1.569965, 0.3489244, 1.009206, 1, 0, 0.3843137, 1,
1.576299, -2.336834, 2.693482, 1, 0, 0.3764706, 1,
1.577372, 0.6472586, 0.7828512, 1, 0, 0.372549, 1,
1.581025, 0.6075925, 2.055385, 1, 0, 0.3647059, 1,
1.588663, 2.12724, 2.265923, 1, 0, 0.3607843, 1,
1.597363, 1.981663, 0.8725755, 1, 0, 0.3529412, 1,
1.605753, 1.262579, 0.08440568, 1, 0, 0.3490196, 1,
1.608497, -1.56286, 2.949195, 1, 0, 0.3411765, 1,
1.627772, 1.373746, 2.75857, 1, 0, 0.3372549, 1,
1.630187, -1.070832, 3.365652, 1, 0, 0.3294118, 1,
1.650776, 1.263414, -0.203405, 1, 0, 0.3254902, 1,
1.666126, 0.2411333, 0.3173223, 1, 0, 0.3176471, 1,
1.679954, -0.1558165, 2.654651, 1, 0, 0.3137255, 1,
1.688364, 2.39703, -0.7493191, 1, 0, 0.3058824, 1,
1.703605, -0.3284151, 1.24428, 1, 0, 0.2980392, 1,
1.715596, -1.121294, 1.326583, 1, 0, 0.2941177, 1,
1.7219, -0.597957, 1.930958, 1, 0, 0.2862745, 1,
1.740555, 1.603119, 1.997415, 1, 0, 0.282353, 1,
1.745932, 0.6364586, 1.400127, 1, 0, 0.2745098, 1,
1.763256, 0.3578792, 0.3930816, 1, 0, 0.2705882, 1,
1.784394, 0.2233765, 0.8241409, 1, 0, 0.2627451, 1,
1.787069, -1.697546, 2.405026, 1, 0, 0.2588235, 1,
1.792947, -0.5661938, 2.003133, 1, 0, 0.2509804, 1,
1.803238, 1.484214, 1.262797, 1, 0, 0.2470588, 1,
1.835489, -0.3638799, 3.760968, 1, 0, 0.2392157, 1,
1.83984, -1.145491, 3.013488, 1, 0, 0.2352941, 1,
1.863294, -0.80436, 2.746534, 1, 0, 0.227451, 1,
1.875429, -0.02032726, 2.352314, 1, 0, 0.2235294, 1,
1.887349, -1.705842, 1.617899, 1, 0, 0.2156863, 1,
1.940101, 1.756923, 0.2476001, 1, 0, 0.2117647, 1,
1.942186, -0.6494804, 1.346013, 1, 0, 0.2039216, 1,
1.94698, -0.02707238, 0.2752814, 1, 0, 0.1960784, 1,
1.950977, -1.133059, 2.17255, 1, 0, 0.1921569, 1,
1.989481, 0.4845732, 0.7890143, 1, 0, 0.1843137, 1,
1.995271, -1.066929, 2.872235, 1, 0, 0.1803922, 1,
2.003965, -0.5578622, 2.082954, 1, 0, 0.172549, 1,
2.031968, 1.316679, 1.335651, 1, 0, 0.1686275, 1,
2.054528, 2.141069, 1.281109, 1, 0, 0.1607843, 1,
2.058352, 0.2641515, 0.1712445, 1, 0, 0.1568628, 1,
2.063243, 2.16876, 2.199589, 1, 0, 0.1490196, 1,
2.085444, -0.661883, 2.697386, 1, 0, 0.145098, 1,
2.101664, 0.8762637, -0.2965924, 1, 0, 0.1372549, 1,
2.103215, 0.07288098, 1.974297, 1, 0, 0.1333333, 1,
2.122712, -1.711031, 2.433319, 1, 0, 0.1254902, 1,
2.12703, -0.3327193, 2.568175, 1, 0, 0.1215686, 1,
2.146133, -0.2825888, 0.650443, 1, 0, 0.1137255, 1,
2.194237, 0.09804447, 1.207338, 1, 0, 0.1098039, 1,
2.198918, 1.26523, 2.520146, 1, 0, 0.1019608, 1,
2.215012, 0.2947982, 2.059692, 1, 0, 0.09411765, 1,
2.223456, 2.355868, 0.5118703, 1, 0, 0.09019608, 1,
2.338969, 0.3840513, 0.1618048, 1, 0, 0.08235294, 1,
2.354718, 0.07205007, 1.145611, 1, 0, 0.07843138, 1,
2.362936, -1.803306, 3.074866, 1, 0, 0.07058824, 1,
2.388981, -1.82108, 1.630319, 1, 0, 0.06666667, 1,
2.39583, 0.290636, 2.101717, 1, 0, 0.05882353, 1,
2.482935, -0.05577711, -0.876959, 1, 0, 0.05490196, 1,
2.487962, 0.658586, 1.91495, 1, 0, 0.04705882, 1,
2.514165, 0.07385282, 0.9153337, 1, 0, 0.04313726, 1,
2.564492, -0.293464, 2.399026, 1, 0, 0.03529412, 1,
2.672433, -0.2930399, 0.9091682, 1, 0, 0.03137255, 1,
2.735515, -0.4328507, 1.486537, 1, 0, 0.02352941, 1,
2.875008, 0.7304113, 0.949437, 1, 0, 0.01960784, 1,
2.915623, -0.6652021, 1.887251, 1, 0, 0.01176471, 1,
2.948852, 0.1085024, 0.05238056, 1, 0, 0.007843138, 1
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
0.02379394, -5.362669, -6.923014, 0, -0.5, 0.5, 0.5,
0.02379394, -5.362669, -6.923014, 1, -0.5, 0.5, 0.5,
0.02379394, -5.362669, -6.923014, 1, 1.5, 0.5, 0.5,
0.02379394, -5.362669, -6.923014, 0, 1.5, 0.5, 0.5
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
-3.892858, -0.4488004, -6.923014, 0, -0.5, 0.5, 0.5,
-3.892858, -0.4488004, -6.923014, 1, -0.5, 0.5, 0.5,
-3.892858, -0.4488004, -6.923014, 1, 1.5, 0.5, 0.5,
-3.892858, -0.4488004, -6.923014, 0, 1.5, 0.5, 0.5
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
-3.892858, -5.362669, 0.2348399, 0, -0.5, 0.5, 0.5,
-3.892858, -5.362669, 0.2348399, 1, -0.5, 0.5, 0.5,
-3.892858, -5.362669, 0.2348399, 1, 1.5, 0.5, 0.5,
-3.892858, -5.362669, 0.2348399, 0, 1.5, 0.5, 0.5
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
-2, -4.228699, -5.271202,
2, -4.228699, -5.271202,
-2, -4.228699, -5.271202,
-2, -4.417694, -5.546504,
-1, -4.228699, -5.271202,
-1, -4.417694, -5.546504,
0, -4.228699, -5.271202,
0, -4.417694, -5.546504,
1, -4.228699, -5.271202,
1, -4.417694, -5.546504,
2, -4.228699, -5.271202,
2, -4.417694, -5.546504
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
-2, -4.795684, -6.097107, 0, -0.5, 0.5, 0.5,
-2, -4.795684, -6.097107, 1, -0.5, 0.5, 0.5,
-2, -4.795684, -6.097107, 1, 1.5, 0.5, 0.5,
-2, -4.795684, -6.097107, 0, 1.5, 0.5, 0.5,
-1, -4.795684, -6.097107, 0, -0.5, 0.5, 0.5,
-1, -4.795684, -6.097107, 1, -0.5, 0.5, 0.5,
-1, -4.795684, -6.097107, 1, 1.5, 0.5, 0.5,
-1, -4.795684, -6.097107, 0, 1.5, 0.5, 0.5,
0, -4.795684, -6.097107, 0, -0.5, 0.5, 0.5,
0, -4.795684, -6.097107, 1, -0.5, 0.5, 0.5,
0, -4.795684, -6.097107, 1, 1.5, 0.5, 0.5,
0, -4.795684, -6.097107, 0, 1.5, 0.5, 0.5,
1, -4.795684, -6.097107, 0, -0.5, 0.5, 0.5,
1, -4.795684, -6.097107, 1, -0.5, 0.5, 0.5,
1, -4.795684, -6.097107, 1, 1.5, 0.5, 0.5,
1, -4.795684, -6.097107, 0, 1.5, 0.5, 0.5,
2, -4.795684, -6.097107, 0, -0.5, 0.5, 0.5,
2, -4.795684, -6.097107, 1, -0.5, 0.5, 0.5,
2, -4.795684, -6.097107, 1, 1.5, 0.5, 0.5,
2, -4.795684, -6.097107, 0, 1.5, 0.5, 0.5
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
-2.989015, -4, -5.271202,
-2.989015, 2, -5.271202,
-2.989015, -4, -5.271202,
-3.139656, -4, -5.546504,
-2.989015, -2, -5.271202,
-3.139656, -2, -5.546504,
-2.989015, 0, -5.271202,
-3.139656, 0, -5.546504,
-2.989015, 2, -5.271202,
-3.139656, 2, -5.546504
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
"-4",
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
-3.440937, -4, -6.097107, 0, -0.5, 0.5, 0.5,
-3.440937, -4, -6.097107, 1, -0.5, 0.5, 0.5,
-3.440937, -4, -6.097107, 1, 1.5, 0.5, 0.5,
-3.440937, -4, -6.097107, 0, 1.5, 0.5, 0.5,
-3.440937, -2, -6.097107, 0, -0.5, 0.5, 0.5,
-3.440937, -2, -6.097107, 1, -0.5, 0.5, 0.5,
-3.440937, -2, -6.097107, 1, 1.5, 0.5, 0.5,
-3.440937, -2, -6.097107, 0, 1.5, 0.5, 0.5,
-3.440937, 0, -6.097107, 0, -0.5, 0.5, 0.5,
-3.440937, 0, -6.097107, 1, -0.5, 0.5, 0.5,
-3.440937, 0, -6.097107, 1, 1.5, 0.5, 0.5,
-3.440937, 0, -6.097107, 0, 1.5, 0.5, 0.5,
-3.440937, 2, -6.097107, 0, -0.5, 0.5, 0.5,
-3.440937, 2, -6.097107, 1, -0.5, 0.5, 0.5,
-3.440937, 2, -6.097107, 1, 1.5, 0.5, 0.5,
-3.440937, 2, -6.097107, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-2.989015, -4.228699, -4,
-2.989015, -4.228699, 4,
-2.989015, -4.228699, -4,
-3.139656, -4.417694, -4,
-2.989015, -4.228699, -2,
-3.139656, -4.417694, -2,
-2.989015, -4.228699, 0,
-3.139656, -4.417694, 0,
-2.989015, -4.228699, 2,
-3.139656, -4.417694, 2,
-2.989015, -4.228699, 4,
-3.139656, -4.417694, 4
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
-3.440937, -4.795684, -4, 0, -0.5, 0.5, 0.5,
-3.440937, -4.795684, -4, 1, -0.5, 0.5, 0.5,
-3.440937, -4.795684, -4, 1, 1.5, 0.5, 0.5,
-3.440937, -4.795684, -4, 0, 1.5, 0.5, 0.5,
-3.440937, -4.795684, -2, 0, -0.5, 0.5, 0.5,
-3.440937, -4.795684, -2, 1, -0.5, 0.5, 0.5,
-3.440937, -4.795684, -2, 1, 1.5, 0.5, 0.5,
-3.440937, -4.795684, -2, 0, 1.5, 0.5, 0.5,
-3.440937, -4.795684, 0, 0, -0.5, 0.5, 0.5,
-3.440937, -4.795684, 0, 1, -0.5, 0.5, 0.5,
-3.440937, -4.795684, 0, 1, 1.5, 0.5, 0.5,
-3.440937, -4.795684, 0, 0, 1.5, 0.5, 0.5,
-3.440937, -4.795684, 2, 0, -0.5, 0.5, 0.5,
-3.440937, -4.795684, 2, 1, -0.5, 0.5, 0.5,
-3.440937, -4.795684, 2, 1, 1.5, 0.5, 0.5,
-3.440937, -4.795684, 2, 0, 1.5, 0.5, 0.5,
-3.440937, -4.795684, 4, 0, -0.5, 0.5, 0.5,
-3.440937, -4.795684, 4, 1, -0.5, 0.5, 0.5,
-3.440937, -4.795684, 4, 1, 1.5, 0.5, 0.5,
-3.440937, -4.795684, 4, 0, 1.5, 0.5, 0.5
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
-2.989015, -4.228699, -5.271202,
-2.989015, 3.331098, -5.271202,
-2.989015, -4.228699, 5.740881,
-2.989015, 3.331098, 5.740881,
-2.989015, -4.228699, -5.271202,
-2.989015, -4.228699, 5.740881,
-2.989015, 3.331098, -5.271202,
-2.989015, 3.331098, 5.740881,
-2.989015, -4.228699, -5.271202,
3.036603, -4.228699, -5.271202,
-2.989015, -4.228699, 5.740881,
3.036603, -4.228699, 5.740881,
-2.989015, 3.331098, -5.271202,
3.036603, 3.331098, -5.271202,
-2.989015, 3.331098, 5.740881,
3.036603, 3.331098, 5.740881,
3.036603, -4.228699, -5.271202,
3.036603, 3.331098, -5.271202,
3.036603, -4.228699, 5.740881,
3.036603, 3.331098, 5.740881,
3.036603, -4.228699, -5.271202,
3.036603, -4.228699, 5.740881,
3.036603, 3.331098, -5.271202,
3.036603, 3.331098, 5.740881
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
var radius = 7.824676;
var distance = 34.81287;
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
mvMatrix.translate( -0.02379394, 0.4488004, -0.2348399 );
mvMatrix.scale( 1.404037, 1.119103, 0.7682645 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.81287);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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


