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
-2.510567, 0.8811736, -2.421264, 1, 0, 0, 1,
-2.500351, -0.1533913, -2.15132, 1, 0.007843138, 0, 1,
-2.403604, -0.09012434, -1.351576, 1, 0.01176471, 0, 1,
-2.355597, -2.321278, -1.987264, 1, 0.01960784, 0, 1,
-2.342666, 1.899342, -0.8125601, 1, 0.02352941, 0, 1,
-2.327902, 0.6246293, -2.393931, 1, 0.03137255, 0, 1,
-2.314384, 0.3170364, -1.60819, 1, 0.03529412, 0, 1,
-2.285788, -1.138212, -0.5512978, 1, 0.04313726, 0, 1,
-2.271055, 2.066234, 0.7299466, 1, 0.04705882, 0, 1,
-2.254606, -0.1301517, -2.04684, 1, 0.05490196, 0, 1,
-2.1793, 1.257169, 1.413536, 1, 0.05882353, 0, 1,
-2.150784, 0.7757041, -2.789589, 1, 0.06666667, 0, 1,
-2.129968, -0.06722163, -2.554433, 1, 0.07058824, 0, 1,
-2.128999, -1.624226, -2.086636, 1, 0.07843138, 0, 1,
-2.127821, -1.001718, -1.480957, 1, 0.08235294, 0, 1,
-2.122338, -0.3081271, -2.619801, 1, 0.09019608, 0, 1,
-2.098796, 0.78746, -1.936137, 1, 0.09411765, 0, 1,
-2.076538, -1.044146, -0.5486873, 1, 0.1019608, 0, 1,
-2.060454, -0.9378232, -0.7686388, 1, 0.1098039, 0, 1,
-2.052832, 1.627439, -2.037969, 1, 0.1137255, 0, 1,
-2.043617, -0.7072396, 0.101071, 1, 0.1215686, 0, 1,
-2.037916, 0.250517, -0.9921797, 1, 0.1254902, 0, 1,
-2.02442, 1.287295, -1.316808, 1, 0.1333333, 0, 1,
-2.01895, 1.650076, -1.281855, 1, 0.1372549, 0, 1,
-2.015244, 1.125106, -1.977737, 1, 0.145098, 0, 1,
-1.989257, -0.9892273, -2.063532, 1, 0.1490196, 0, 1,
-1.988183, -1.211089, -1.130353, 1, 0.1568628, 0, 1,
-1.922082, 0.3615331, -1.40762, 1, 0.1607843, 0, 1,
-1.921242, 0.2267275, -1.794465, 1, 0.1686275, 0, 1,
-1.843565, 0.8240793, -1.550763, 1, 0.172549, 0, 1,
-1.830367, 0.8500821, -1.990539, 1, 0.1803922, 0, 1,
-1.816503, -0.9259268, -2.102556, 1, 0.1843137, 0, 1,
-1.78815, 0.3672294, -2.780671, 1, 0.1921569, 0, 1,
-1.777569, 0.6999176, -0.9693562, 1, 0.1960784, 0, 1,
-1.764037, -0.1787179, -0.9931867, 1, 0.2039216, 0, 1,
-1.760694, 1.124704, -0.2226482, 1, 0.2117647, 0, 1,
-1.745478, 0.5287107, -2.376787, 1, 0.2156863, 0, 1,
-1.708036, -0.3174928, -2.531188, 1, 0.2235294, 0, 1,
-1.704487, -0.4867308, -1.229581, 1, 0.227451, 0, 1,
-1.681713, -0.6023231, -1.965859, 1, 0.2352941, 0, 1,
-1.676325, 0.2771262, -1.812399, 1, 0.2392157, 0, 1,
-1.664096, -1.508085, -1.55131, 1, 0.2470588, 0, 1,
-1.646437, -0.1292545, -2.01843, 1, 0.2509804, 0, 1,
-1.639811, 2.715514, -0.9104857, 1, 0.2588235, 0, 1,
-1.626791, 1.926175, -0.3914185, 1, 0.2627451, 0, 1,
-1.625774, 1.892805, -0.7023478, 1, 0.2705882, 0, 1,
-1.620828, 0.01612246, -3.117092, 1, 0.2745098, 0, 1,
-1.620687, 0.1342991, -0.4650152, 1, 0.282353, 0, 1,
-1.61916, -0.1088462, -2.794893, 1, 0.2862745, 0, 1,
-1.612225, -0.3267865, -0.8059391, 1, 0.2941177, 0, 1,
-1.593373, -0.01536331, -0.9818341, 1, 0.3019608, 0, 1,
-1.592234, 1.161846, -1.306903, 1, 0.3058824, 0, 1,
-1.586596, 0.5427333, -1.648018, 1, 0.3137255, 0, 1,
-1.584185, -1.737332, -2.59089, 1, 0.3176471, 0, 1,
-1.583515, 1.164554, -1.113855, 1, 0.3254902, 0, 1,
-1.564576, -0.7825862, -0.8002141, 1, 0.3294118, 0, 1,
-1.558581, 0.390143, -0.6786664, 1, 0.3372549, 0, 1,
-1.545991, -0.628893, -0.870476, 1, 0.3411765, 0, 1,
-1.544902, -0.4102332, -2.96609, 1, 0.3490196, 0, 1,
-1.543814, 0.7553216, -2.107552, 1, 0.3529412, 0, 1,
-1.529423, -1.242511, -2.843162, 1, 0.3607843, 0, 1,
-1.504848, 1.495191, 0.2465427, 1, 0.3647059, 0, 1,
-1.504323, -0.5413577, -0.2946642, 1, 0.372549, 0, 1,
-1.495968, 0.2665573, -0.5425339, 1, 0.3764706, 0, 1,
-1.483721, 2.280866, -2.621344, 1, 0.3843137, 0, 1,
-1.477824, -2.340334, -4.154588, 1, 0.3882353, 0, 1,
-1.477001, -0.5358251, 0.1662183, 1, 0.3960784, 0, 1,
-1.46937, 0.4046491, -1.138702, 1, 0.4039216, 0, 1,
-1.459946, -0.2456862, -2.655353, 1, 0.4078431, 0, 1,
-1.456142, 1.955475, 0.1275467, 1, 0.4156863, 0, 1,
-1.454956, -0.5439646, -2.917269, 1, 0.4196078, 0, 1,
-1.409351, 1.388773, -0.128932, 1, 0.427451, 0, 1,
-1.40706, -1.113965, -2.948389, 1, 0.4313726, 0, 1,
-1.395996, 0.3101695, -1.025612, 1, 0.4392157, 0, 1,
-1.38422, -1.386144, -1.857486, 1, 0.4431373, 0, 1,
-1.381477, 0.2800375, -0.5825557, 1, 0.4509804, 0, 1,
-1.378914, -0.3949144, -1.60469, 1, 0.454902, 0, 1,
-1.372867, -0.003483494, -0.4259374, 1, 0.4627451, 0, 1,
-1.370002, -0.3353373, -0.9129319, 1, 0.4666667, 0, 1,
-1.369936, 1.994033, -1.759544, 1, 0.4745098, 0, 1,
-1.367857, 0.3493199, -0.8234032, 1, 0.4784314, 0, 1,
-1.357296, -0.1856761, -1.810738, 1, 0.4862745, 0, 1,
-1.351765, 0.7910053, -1.222284, 1, 0.4901961, 0, 1,
-1.35171, -0.6761068, -2.274682, 1, 0.4980392, 0, 1,
-1.348466, -0.6450045, -0.1132935, 1, 0.5058824, 0, 1,
-1.344414, -0.2187883, -0.4649893, 1, 0.509804, 0, 1,
-1.344292, -0.7758903, -0.6652882, 1, 0.5176471, 0, 1,
-1.339908, -0.8938691, -1.839575, 1, 0.5215687, 0, 1,
-1.33951, -0.1600539, -1.942295, 1, 0.5294118, 0, 1,
-1.337688, 0.3647459, -1.079008, 1, 0.5333334, 0, 1,
-1.336293, -0.4759958, -0.2316167, 1, 0.5411765, 0, 1,
-1.33106, -0.8525472, -3.060123, 1, 0.5450981, 0, 1,
-1.313665, 5.76653e-05, -1.348509, 1, 0.5529412, 0, 1,
-1.312913, 2.239944, -0.04725903, 1, 0.5568628, 0, 1,
-1.302667, 1.646172, -0.3210577, 1, 0.5647059, 0, 1,
-1.302315, -1.438035, -1.870836, 1, 0.5686275, 0, 1,
-1.299333, 1.457715, -0.634393, 1, 0.5764706, 0, 1,
-1.297665, -1.244567, -3.10792, 1, 0.5803922, 0, 1,
-1.287874, 1.369641, 0.2008921, 1, 0.5882353, 0, 1,
-1.287869, 2.416872, 0.3556196, 1, 0.5921569, 0, 1,
-1.280178, 0.07730123, -1.584879, 1, 0.6, 0, 1,
-1.26814, -3.563159, -1.360924, 1, 0.6078432, 0, 1,
-1.23778, 0.2520665, -0.214866, 1, 0.6117647, 0, 1,
-1.235518, -0.8213363, -1.525089, 1, 0.6196079, 0, 1,
-1.214832, -0.3691185, -2.279731, 1, 0.6235294, 0, 1,
-1.211328, -0.1310016, -1.408404, 1, 0.6313726, 0, 1,
-1.200608, 0.8197607, -2.978355, 1, 0.6352941, 0, 1,
-1.182927, 2.981472, 0.07150631, 1, 0.6431373, 0, 1,
-1.181872, 0.8155635, -1.51062, 1, 0.6470588, 0, 1,
-1.173938, 0.9208621, -0.3443393, 1, 0.654902, 0, 1,
-1.165562, -0.124246, -3.022572, 1, 0.6588235, 0, 1,
-1.163487, 1.543533, -3.004658, 1, 0.6666667, 0, 1,
-1.156483, -0.2790119, -2.539783, 1, 0.6705883, 0, 1,
-1.154499, -0.3223269, -3.199845, 1, 0.6784314, 0, 1,
-1.149332, -0.6498276, -2.542415, 1, 0.682353, 0, 1,
-1.144862, 1.057506, -0.4408678, 1, 0.6901961, 0, 1,
-1.139042, -2.182414, -1.553222, 1, 0.6941177, 0, 1,
-1.126809, -0.5246381, -1.55049, 1, 0.7019608, 0, 1,
-1.124696, 1.483586, -2.689745, 1, 0.7098039, 0, 1,
-1.119843, -0.01095867, -2.031935, 1, 0.7137255, 0, 1,
-1.116072, 2.370751, -1.085626, 1, 0.7215686, 0, 1,
-1.108661, 0.001660346, -0.2516046, 1, 0.7254902, 0, 1,
-1.102243, -1.389623, -3.69698, 1, 0.7333333, 0, 1,
-1.100201, 0.7049398, 0.08606048, 1, 0.7372549, 0, 1,
-1.092344, -0.3010151, -2.56535, 1, 0.7450981, 0, 1,
-1.092271, 1.906977, 0.2031653, 1, 0.7490196, 0, 1,
-1.085019, -2.08119, -3.259217, 1, 0.7568628, 0, 1,
-1.084677, -1.126994, -1.296101, 1, 0.7607843, 0, 1,
-1.083874, -0.8179442, -2.285926, 1, 0.7686275, 0, 1,
-1.08204, 0.3017009, 0.4249047, 1, 0.772549, 0, 1,
-1.073233, -0.6130387, -3.895514, 1, 0.7803922, 0, 1,
-1.071429, 0.6799974, -1.926986, 1, 0.7843137, 0, 1,
-1.065218, 1.028724, -2.26679, 1, 0.7921569, 0, 1,
-1.064822, -1.472188, -3.675931, 1, 0.7960784, 0, 1,
-1.062567, -1.70249, -2.179666, 1, 0.8039216, 0, 1,
-1.060198, -0.6260188, -3.577361, 1, 0.8117647, 0, 1,
-1.056937, 2.088655, -0.8115064, 1, 0.8156863, 0, 1,
-1.048546, 0.4533587, -1.626973, 1, 0.8235294, 0, 1,
-1.044401, 0.8539237, -1.521696, 1, 0.827451, 0, 1,
-1.042879, 1.327016, 0.5230948, 1, 0.8352941, 0, 1,
-1.040815, -0.07978347, -1.523941, 1, 0.8392157, 0, 1,
-1.035424, 0.08627335, -1.328791, 1, 0.8470588, 0, 1,
-1.034413, 0.3483769, -2.810732, 1, 0.8509804, 0, 1,
-1.026121, 0.3112994, -1.389562, 1, 0.8588235, 0, 1,
-1.01744, 0.7865134, -0.2672628, 1, 0.8627451, 0, 1,
-1.017344, 0.6737073, -1.920957, 1, 0.8705882, 0, 1,
-1.016165, 1.074566, -1.268543, 1, 0.8745098, 0, 1,
-1.014327, 0.07178119, -2.137771, 1, 0.8823529, 0, 1,
-1.004999, 0.3356923, -1.531858, 1, 0.8862745, 0, 1,
-1.002593, 0.2785885, 0.5755758, 1, 0.8941177, 0, 1,
-0.9934627, 1.536523, 1.167079, 1, 0.8980392, 0, 1,
-0.9923083, -0.199376, -1.614103, 1, 0.9058824, 0, 1,
-0.9896195, -1.554385, -3.052659, 1, 0.9137255, 0, 1,
-0.9888611, -0.191612, -2.662376, 1, 0.9176471, 0, 1,
-0.9882008, 0.2821779, -1.414743, 1, 0.9254902, 0, 1,
-0.9871666, 0.03125698, -2.162087, 1, 0.9294118, 0, 1,
-0.9777514, -0.5375578, -2.155006, 1, 0.9372549, 0, 1,
-0.9768864, -0.4767085, -0.1615706, 1, 0.9411765, 0, 1,
-0.9761917, -0.3133696, -1.529241, 1, 0.9490196, 0, 1,
-0.9709395, 0.2222681, -1.411566, 1, 0.9529412, 0, 1,
-0.9658797, 1.184252, 0.1305838, 1, 0.9607843, 0, 1,
-0.961178, -0.9829569, -2.066733, 1, 0.9647059, 0, 1,
-0.9558378, 1.405657, -0.6677582, 1, 0.972549, 0, 1,
-0.9555161, -0.683615, -0.7173151, 1, 0.9764706, 0, 1,
-0.9550235, -0.02134086, -2.701574, 1, 0.9843137, 0, 1,
-0.946191, -0.5196115, -1.107334, 1, 0.9882353, 0, 1,
-0.9387655, -0.7722907, -2.660752, 1, 0.9960784, 0, 1,
-0.9357548, -0.1680882, -0.8442048, 0.9960784, 1, 0, 1,
-0.9334984, -0.2378318, -2.123226, 0.9921569, 1, 0, 1,
-0.9270759, -1.238972, -2.466884, 0.9843137, 1, 0, 1,
-0.9225725, 1.022198, -0.2630445, 0.9803922, 1, 0, 1,
-0.9124498, -0.1608222, -0.2284291, 0.972549, 1, 0, 1,
-0.9035883, 0.3366618, -0.92329, 0.9686275, 1, 0, 1,
-0.8950188, -0.3084093, -0.4788667, 0.9607843, 1, 0, 1,
-0.8944805, 0.861342, -0.6814212, 0.9568627, 1, 0, 1,
-0.8931124, 0.6411145, -0.3944406, 0.9490196, 1, 0, 1,
-0.8919201, -1.055727, -3.619806, 0.945098, 1, 0, 1,
-0.8775634, -0.1178853, -1.565311, 0.9372549, 1, 0, 1,
-0.8723982, -1.640434, -2.783645, 0.9333333, 1, 0, 1,
-0.8668005, -0.7730755, -1.994226, 0.9254902, 1, 0, 1,
-0.8643212, 0.5735601, -0.2028427, 0.9215686, 1, 0, 1,
-0.8609998, -0.2696718, -2.343969, 0.9137255, 1, 0, 1,
-0.8598959, 0.5753623, -2.609457, 0.9098039, 1, 0, 1,
-0.8537687, -1.078784, -1.239086, 0.9019608, 1, 0, 1,
-0.853025, 0.3021899, -1.646769, 0.8941177, 1, 0, 1,
-0.8515449, 0.6713021, -2.348401, 0.8901961, 1, 0, 1,
-0.8500207, 0.9385689, -0.8180966, 0.8823529, 1, 0, 1,
-0.8468929, 0.01690016, -0.5311701, 0.8784314, 1, 0, 1,
-0.8465722, 0.6971772, -1.389799, 0.8705882, 1, 0, 1,
-0.8422075, 1.328051, -1.438133, 0.8666667, 1, 0, 1,
-0.8394247, -1.275104, -3.069871, 0.8588235, 1, 0, 1,
-0.8369505, -0.4514864, -1.963722, 0.854902, 1, 0, 1,
-0.8352129, -0.9300686, -4.223814, 0.8470588, 1, 0, 1,
-0.8347444, 1.331544, 0.2236339, 0.8431373, 1, 0, 1,
-0.8298826, -0.5332087, -1.337383, 0.8352941, 1, 0, 1,
-0.81968, -0.1895608, -1.854357, 0.8313726, 1, 0, 1,
-0.8184091, 0.4907491, 0.6301203, 0.8235294, 1, 0, 1,
-0.8145094, -0.8807474, -1.872967, 0.8196079, 1, 0, 1,
-0.8064032, 0.02680708, -2.530309, 0.8117647, 1, 0, 1,
-0.8053017, 0.7841719, -0.8679317, 0.8078431, 1, 0, 1,
-0.8005389, 0.1038052, -2.160958, 0.8, 1, 0, 1,
-0.7973107, -0.1871635, -1.824268, 0.7921569, 1, 0, 1,
-0.7965189, -0.3065394, -1.379761, 0.7882353, 1, 0, 1,
-0.7935284, -1.265033, -3.755265, 0.7803922, 1, 0, 1,
-0.7919074, -1.581861, -3.405106, 0.7764706, 1, 0, 1,
-0.7866254, -1.832242, -1.529338, 0.7686275, 1, 0, 1,
-0.7854787, 1.223396, -1.847243, 0.7647059, 1, 0, 1,
-0.7805822, 1.02483, -0.4664209, 0.7568628, 1, 0, 1,
-0.7770093, -1.603403, -2.737865, 0.7529412, 1, 0, 1,
-0.7740032, -0.8002689, -3.890792, 0.7450981, 1, 0, 1,
-0.773027, -0.2832851, 0.2392464, 0.7411765, 1, 0, 1,
-0.772557, 0.2756003, 1.42117, 0.7333333, 1, 0, 1,
-0.7703023, -0.9612704, -1.599146, 0.7294118, 1, 0, 1,
-0.7652959, -0.659508, -1.933923, 0.7215686, 1, 0, 1,
-0.7631748, 0.5603921, -1.312537, 0.7176471, 1, 0, 1,
-0.7557178, 0.8173124, -1.44613, 0.7098039, 1, 0, 1,
-0.7537482, -0.9850345, -2.374745, 0.7058824, 1, 0, 1,
-0.7515358, -1.351992, -4.049225, 0.6980392, 1, 0, 1,
-0.7486184, 0.2012727, -0.7459534, 0.6901961, 1, 0, 1,
-0.7451698, -0.8526571, -2.369625, 0.6862745, 1, 0, 1,
-0.7401711, -0.07676176, -0.9471835, 0.6784314, 1, 0, 1,
-0.7383376, 1.037573, -0.936218, 0.6745098, 1, 0, 1,
-0.7378109, 0.4578578, -2.962635, 0.6666667, 1, 0, 1,
-0.737762, 0.1350672, -0.8501191, 0.6627451, 1, 0, 1,
-0.7355851, 1.437792, -0.5091632, 0.654902, 1, 0, 1,
-0.7281088, -0.4963288, -1.733431, 0.6509804, 1, 0, 1,
-0.7188133, -1.767553, -3.972688, 0.6431373, 1, 0, 1,
-0.7183119, -0.2553711, -2.047479, 0.6392157, 1, 0, 1,
-0.7108532, 2.784819, -1.333787, 0.6313726, 1, 0, 1,
-0.7100186, -1.465183, -0.0362409, 0.627451, 1, 0, 1,
-0.7081802, 0.7286046, -0.812402, 0.6196079, 1, 0, 1,
-0.7057971, -0.2881362, -0.1264289, 0.6156863, 1, 0, 1,
-0.6989101, 0.8557371, -0.8363279, 0.6078432, 1, 0, 1,
-0.6972727, -0.5343083, -1.962504, 0.6039216, 1, 0, 1,
-0.6940069, 0.1850667, -1.299645, 0.5960785, 1, 0, 1,
-0.6924549, -0.09627627, -0.3321268, 0.5882353, 1, 0, 1,
-0.6821739, 0.8742754, -0.06978765, 0.5843138, 1, 0, 1,
-0.6806338, -2.39342, -2.431658, 0.5764706, 1, 0, 1,
-0.6647758, -0.03356726, -0.6386293, 0.572549, 1, 0, 1,
-0.6596513, -0.8649338, -2.692356, 0.5647059, 1, 0, 1,
-0.6548218, -0.4188923, -0.08027042, 0.5607843, 1, 0, 1,
-0.6508161, 1.187545, 0.3831289, 0.5529412, 1, 0, 1,
-0.6433737, -0.930512, -4.226478, 0.5490196, 1, 0, 1,
-0.641528, -0.1498365, -1.880945, 0.5411765, 1, 0, 1,
-0.6378997, -1.460147, -2.363674, 0.5372549, 1, 0, 1,
-0.635538, 0.5919486, 0.385811, 0.5294118, 1, 0, 1,
-0.6277872, 0.5705258, -2.828479, 0.5254902, 1, 0, 1,
-0.6260818, 0.6303781, -1.928657, 0.5176471, 1, 0, 1,
-0.6252843, 0.05286565, -0.6556129, 0.5137255, 1, 0, 1,
-0.6217458, 1.012968, -1.065327, 0.5058824, 1, 0, 1,
-0.6206454, -0.6376272, -3.202964, 0.5019608, 1, 0, 1,
-0.618501, -0.07875244, 0.338903, 0.4941176, 1, 0, 1,
-0.6134863, -0.1060753, -1.261016, 0.4862745, 1, 0, 1,
-0.6121157, 1.131148, -0.9428418, 0.4823529, 1, 0, 1,
-0.6094305, 1.112952, -0.6888557, 0.4745098, 1, 0, 1,
-0.6053545, -0.3284979, -2.652389, 0.4705882, 1, 0, 1,
-0.6053509, -0.9207228, -1.251435, 0.4627451, 1, 0, 1,
-0.6035969, 1.510792, 0.3577582, 0.4588235, 1, 0, 1,
-0.603018, 2.293104, -1.049173, 0.4509804, 1, 0, 1,
-0.6021813, 0.0500999, -2.075995, 0.4470588, 1, 0, 1,
-0.6020484, 1.008806, -1.754834, 0.4392157, 1, 0, 1,
-0.6009126, -0.3572031, -1.745967, 0.4352941, 1, 0, 1,
-0.600392, -2.393129, -4.284686, 0.427451, 1, 0, 1,
-0.5958822, 1.192945, -0.3054805, 0.4235294, 1, 0, 1,
-0.5955749, 0.527386, -0.2697584, 0.4156863, 1, 0, 1,
-0.5928943, -1.308003, -2.76975, 0.4117647, 1, 0, 1,
-0.5841331, 0.52585, -1.507881, 0.4039216, 1, 0, 1,
-0.5835164, 1.216122, 0.08159897, 0.3960784, 1, 0, 1,
-0.5824065, -0.5858413, -2.499283, 0.3921569, 1, 0, 1,
-0.5812896, -0.6926402, -3.784762, 0.3843137, 1, 0, 1,
-0.5802284, 0.804527, -1.099691, 0.3803922, 1, 0, 1,
-0.5771412, -0.9584739, -2.201224, 0.372549, 1, 0, 1,
-0.5763052, 0.5968972, -0.7543963, 0.3686275, 1, 0, 1,
-0.5757167, 0.02781529, 0.6571097, 0.3607843, 1, 0, 1,
-0.5711547, 1.004989, -0.7108902, 0.3568628, 1, 0, 1,
-0.5684441, 0.6737508, -2.94182, 0.3490196, 1, 0, 1,
-0.5646727, 0.7738934, 0.5423123, 0.345098, 1, 0, 1,
-0.5634511, -0.6444475, -3.552448, 0.3372549, 1, 0, 1,
-0.5618994, -0.2496154, -2.687203, 0.3333333, 1, 0, 1,
-0.5604526, 0.6076113, -0.1787642, 0.3254902, 1, 0, 1,
-0.5554833, 0.8644026, -0.3147732, 0.3215686, 1, 0, 1,
-0.5544001, -0.9655116, -2.965411, 0.3137255, 1, 0, 1,
-0.5530773, -1.094561, -3.34508, 0.3098039, 1, 0, 1,
-0.5515737, 0.2392438, -1.665038, 0.3019608, 1, 0, 1,
-0.5503331, -0.74229, -2.998426, 0.2941177, 1, 0, 1,
-0.5498987, 0.09970129, -3.018595, 0.2901961, 1, 0, 1,
-0.5495375, -0.6077738, -2.360221, 0.282353, 1, 0, 1,
-0.5476618, 0.860286, -1.244492, 0.2784314, 1, 0, 1,
-0.5435226, 1.296247, -1.474095, 0.2705882, 1, 0, 1,
-0.5421916, -0.7112624, -2.40678, 0.2666667, 1, 0, 1,
-0.5388703, -1.493061, -4.715705, 0.2588235, 1, 0, 1,
-0.5384232, 1.438836, -0.4801109, 0.254902, 1, 0, 1,
-0.5353128, -0.2463074, -1.193368, 0.2470588, 1, 0, 1,
-0.5334171, -0.4597634, -2.683473, 0.2431373, 1, 0, 1,
-0.5314283, 0.3034458, -1.074781, 0.2352941, 1, 0, 1,
-0.5297508, 0.701145, 1.118156, 0.2313726, 1, 0, 1,
-0.5291481, 0.108093, -0.606416, 0.2235294, 1, 0, 1,
-0.5282335, -0.4589911, -2.396423, 0.2196078, 1, 0, 1,
-0.5278382, 0.004713952, -1.523593, 0.2117647, 1, 0, 1,
-0.5113433, -0.9465095, -1.239054, 0.2078431, 1, 0, 1,
-0.5111049, -0.8268858, -1.990324, 0.2, 1, 0, 1,
-0.5109825, -1.163999, -4.162258, 0.1921569, 1, 0, 1,
-0.5076227, 0.4388166, -0.2942365, 0.1882353, 1, 0, 1,
-0.504087, -1.058655, -2.982623, 0.1803922, 1, 0, 1,
-0.5034199, -2.305868, -1.375035, 0.1764706, 1, 0, 1,
-0.5015479, -0.5116546, -1.25766, 0.1686275, 1, 0, 1,
-0.4991656, 1.022848, 0.2017976, 0.1647059, 1, 0, 1,
-0.4928176, -1.159673, -3.574262, 0.1568628, 1, 0, 1,
-0.4877565, -0.3272497, -1.853357, 0.1529412, 1, 0, 1,
-0.486674, 0.3960809, -0.6829731, 0.145098, 1, 0, 1,
-0.4793632, -0.8697792, -3.383029, 0.1411765, 1, 0, 1,
-0.4705085, 1.742974, -1.084122, 0.1333333, 1, 0, 1,
-0.4697954, -1.925294, -3.718749, 0.1294118, 1, 0, 1,
-0.4557148, 0.1562487, -1.015229, 0.1215686, 1, 0, 1,
-0.4553461, -0.1308674, -3.360965, 0.1176471, 1, 0, 1,
-0.453717, -0.8465031, -2.490176, 0.1098039, 1, 0, 1,
-0.4455728, 0.2425056, -3.108614, 0.1058824, 1, 0, 1,
-0.4430686, 0.7943558, -2.347662, 0.09803922, 1, 0, 1,
-0.4410089, 1.021751, 1.873181, 0.09019608, 1, 0, 1,
-0.4379186, 0.5000504, -0.184236, 0.08627451, 1, 0, 1,
-0.4342695, -0.9042327, -2.670911, 0.07843138, 1, 0, 1,
-0.4324878, -0.1149142, 0.4972096, 0.07450981, 1, 0, 1,
-0.4315763, 0.4633496, -1.235729, 0.06666667, 1, 0, 1,
-0.4188614, 0.1653079, -1.635586, 0.0627451, 1, 0, 1,
-0.418833, 0.4026809, -0.9183925, 0.05490196, 1, 0, 1,
-0.4135191, -0.7200161, -0.3094515, 0.05098039, 1, 0, 1,
-0.4131918, -0.7685477, -1.882354, 0.04313726, 1, 0, 1,
-0.4116346, 0.01180767, -0.2284287, 0.03921569, 1, 0, 1,
-0.4099623, 1.160129, -1.674379, 0.03137255, 1, 0, 1,
-0.4030809, 0.04872323, -1.589637, 0.02745098, 1, 0, 1,
-0.3977957, -0.8107061, -3.024318, 0.01960784, 1, 0, 1,
-0.3934013, 0.5449027, 1.599469, 0.01568628, 1, 0, 1,
-0.3909032, -0.08598179, -1.987417, 0.007843138, 1, 0, 1,
-0.384516, -0.3276261, -3.094206, 0.003921569, 1, 0, 1,
-0.383016, -0.09783931, -1.691105, 0, 1, 0.003921569, 1,
-0.3823579, -0.001782175, -3.270283, 0, 1, 0.01176471, 1,
-0.3816675, -1.379989, -4.246265, 0, 1, 0.01568628, 1,
-0.3814687, -0.965367, -0.6819583, 0, 1, 0.02352941, 1,
-0.3795628, 0.2006863, 0.8670372, 0, 1, 0.02745098, 1,
-0.3764142, 0.8952804, 0.7161551, 0, 1, 0.03529412, 1,
-0.375688, 0.1446064, -1.231446, 0, 1, 0.03921569, 1,
-0.3756601, -0.1601759, -0.09033381, 0, 1, 0.04705882, 1,
-0.3729639, 0.7775398, 0.02404417, 0, 1, 0.05098039, 1,
-0.369287, -0.2022907, -1.928254, 0, 1, 0.05882353, 1,
-0.3689342, -0.1935382, -2.792697, 0, 1, 0.0627451, 1,
-0.3683403, -0.541358, -2.931538, 0, 1, 0.07058824, 1,
-0.3618889, -1.584042, -2.701927, 0, 1, 0.07450981, 1,
-0.3599968, -0.7098425, -3.231729, 0, 1, 0.08235294, 1,
-0.3599955, 1.180714, -0.8705303, 0, 1, 0.08627451, 1,
-0.3579831, -1.463713, -4.2292, 0, 1, 0.09411765, 1,
-0.3560262, 0.06675988, -2.278801, 0, 1, 0.1019608, 1,
-0.3544523, -2.042936, -3.654012, 0, 1, 0.1058824, 1,
-0.3529542, -1.671117, -4.732227, 0, 1, 0.1137255, 1,
-0.3517262, -0.3968421, 0.8495377, 0, 1, 0.1176471, 1,
-0.3481063, 0.03154051, -0.4126158, 0, 1, 0.1254902, 1,
-0.3458647, -0.2838228, -2.272898, 0, 1, 0.1294118, 1,
-0.3448926, 0.1238567, -0.2991214, 0, 1, 0.1372549, 1,
-0.3431039, 0.0380062, -1.047085, 0, 1, 0.1411765, 1,
-0.3402044, 1.357953, -1.027393, 0, 1, 0.1490196, 1,
-0.3288297, -1.566929, -4.975906, 0, 1, 0.1529412, 1,
-0.3277491, -0.1549435, -1.544312, 0, 1, 0.1607843, 1,
-0.3274846, -0.7175093, -3.424747, 0, 1, 0.1647059, 1,
-0.3227545, -0.5848621, -4.641198, 0, 1, 0.172549, 1,
-0.3179244, -1.660571, -2.669957, 0, 1, 0.1764706, 1,
-0.3169206, 0.2073095, -0.7142336, 0, 1, 0.1843137, 1,
-0.3159932, -0.2832171, -2.814878, 0, 1, 0.1882353, 1,
-0.3155475, -0.1012143, -2.646075, 0, 1, 0.1960784, 1,
-0.313818, -0.189314, -0.4646813, 0, 1, 0.2039216, 1,
-0.30884, -1.225751, -3.783386, 0, 1, 0.2078431, 1,
-0.3063912, 1.247767, -1.557276, 0, 1, 0.2156863, 1,
-0.3056976, 0.226397, -0.5052549, 0, 1, 0.2196078, 1,
-0.3050021, 0.8714265, -0.06602135, 0, 1, 0.227451, 1,
-0.3002609, -2.515979, -2.167497, 0, 1, 0.2313726, 1,
-0.2998787, -0.2526696, -2.545622, 0, 1, 0.2392157, 1,
-0.299029, 1.186545, -0.5093661, 0, 1, 0.2431373, 1,
-0.2960357, -0.875178, -0.79978, 0, 1, 0.2509804, 1,
-0.2915055, 0.07251515, -1.128544, 0, 1, 0.254902, 1,
-0.2900438, -0.5980536, -3.9093, 0, 1, 0.2627451, 1,
-0.2880361, 0.9966227, 0.8386462, 0, 1, 0.2666667, 1,
-0.2825006, 0.7923065, -1.470739, 0, 1, 0.2745098, 1,
-0.2735274, 0.2164288, -2.705026, 0, 1, 0.2784314, 1,
-0.2720759, -0.320834, -1.232785, 0, 1, 0.2862745, 1,
-0.2718093, 0.6663964, -0.9131452, 0, 1, 0.2901961, 1,
-0.2697296, 0.7681964, -0.5740083, 0, 1, 0.2980392, 1,
-0.2677518, -1.910683, -2.073512, 0, 1, 0.3058824, 1,
-0.2670839, -0.2091534, -1.580606, 0, 1, 0.3098039, 1,
-0.2617611, -0.4130234, -3.099298, 0, 1, 0.3176471, 1,
-0.2615975, 0.06099214, -2.031316, 0, 1, 0.3215686, 1,
-0.2612594, -0.6779824, -3.355069, 0, 1, 0.3294118, 1,
-0.2539659, 1.31096, -0.3971127, 0, 1, 0.3333333, 1,
-0.2536079, 1.164297, -1.013626, 0, 1, 0.3411765, 1,
-0.2513129, 0.5147839, -0.2336223, 0, 1, 0.345098, 1,
-0.2478096, -0.6439951, -2.960386, 0, 1, 0.3529412, 1,
-0.2377994, -0.692461, -2.601261, 0, 1, 0.3568628, 1,
-0.2376021, -0.4069951, -2.228504, 0, 1, 0.3647059, 1,
-0.2323117, 0.6461393, -2.108134, 0, 1, 0.3686275, 1,
-0.2321652, 2.434597, 1.173628, 0, 1, 0.3764706, 1,
-0.2315897, -1.165604, -2.766207, 0, 1, 0.3803922, 1,
-0.2247914, -0.7911651, -3.169871, 0, 1, 0.3882353, 1,
-0.2245706, -0.728134, -2.779397, 0, 1, 0.3921569, 1,
-0.2182229, 0.7054746, 0.6383951, 0, 1, 0.4, 1,
-0.2170469, -0.3225128, -1.625133, 0, 1, 0.4078431, 1,
-0.2073153, 0.8987206, -1.055374, 0, 1, 0.4117647, 1,
-0.1982937, -1.457907, -3.429589, 0, 1, 0.4196078, 1,
-0.1965477, -1.398245, -2.07754, 0, 1, 0.4235294, 1,
-0.1962337, 0.5051448, -0.3497668, 0, 1, 0.4313726, 1,
-0.1959862, -0.05677668, -1.73408, 0, 1, 0.4352941, 1,
-0.1945427, 1.17821, 0.7149582, 0, 1, 0.4431373, 1,
-0.1894282, -0.3633122, -1.569728, 0, 1, 0.4470588, 1,
-0.1827373, -1.819474, -4.605714, 0, 1, 0.454902, 1,
-0.1801202, -0.7224041, -2.906321, 0, 1, 0.4588235, 1,
-0.179006, 1.00954, -0.5583169, 0, 1, 0.4666667, 1,
-0.166028, 0.661184, -0.769749, 0, 1, 0.4705882, 1,
-0.1591529, -0.9559187, -2.762582, 0, 1, 0.4784314, 1,
-0.1566887, 0.2751588, -0.8214629, 0, 1, 0.4823529, 1,
-0.1510392, -0.1331809, -4.169307, 0, 1, 0.4901961, 1,
-0.1494293, -0.2288598, -2.920042, 0, 1, 0.4941176, 1,
-0.1439827, 0.9358835, -0.019665, 0, 1, 0.5019608, 1,
-0.1436207, 0.8687509, 0.130012, 0, 1, 0.509804, 1,
-0.1407467, -0.3321708, -3.105261, 0, 1, 0.5137255, 1,
-0.1394362, 0.005759621, -4.302496, 0, 1, 0.5215687, 1,
-0.1388423, 1.243487, -1.741637, 0, 1, 0.5254902, 1,
-0.1366365, -0.153691, -2.449409, 0, 1, 0.5333334, 1,
-0.1341531, 0.5368315, -1.087709, 0, 1, 0.5372549, 1,
-0.1290943, 0.3225902, 0.2688981, 0, 1, 0.5450981, 1,
-0.1287805, -0.5093354, -1.19697, 0, 1, 0.5490196, 1,
-0.1280293, 0.7335703, -0.6599486, 0, 1, 0.5568628, 1,
-0.1255871, 0.9288826, 0.7168101, 0, 1, 0.5607843, 1,
-0.1247794, 0.9949888, -0.005748529, 0, 1, 0.5686275, 1,
-0.1223162, -1.040692, -3.77148, 0, 1, 0.572549, 1,
-0.1198266, 1.999852, -0.6107964, 0, 1, 0.5803922, 1,
-0.1167999, 1.313707, 2.198055, 0, 1, 0.5843138, 1,
-0.1160684, -1.182958, -4.000501, 0, 1, 0.5921569, 1,
-0.1157421, -0.993861, -1.798404, 0, 1, 0.5960785, 1,
-0.1133494, 2.012831, -0.1607866, 0, 1, 0.6039216, 1,
-0.1118064, -0.7399758, -4.220436, 0, 1, 0.6117647, 1,
-0.1040417, 0.9167719, -2.329436, 0, 1, 0.6156863, 1,
-0.09817448, -0.24996, -2.870058, 0, 1, 0.6235294, 1,
-0.09735725, 1.338849, 0.3643565, 0, 1, 0.627451, 1,
-0.09620239, -0.2815414, -2.177108, 0, 1, 0.6352941, 1,
-0.0945323, -1.743167, -4.313478, 0, 1, 0.6392157, 1,
-0.0900786, -1.899632, -3.469823, 0, 1, 0.6470588, 1,
-0.08774941, 1.429063, -1.290211, 0, 1, 0.6509804, 1,
-0.0875724, -0.2563462, -2.832192, 0, 1, 0.6588235, 1,
-0.08620995, 1.374707, 0.5968555, 0, 1, 0.6627451, 1,
-0.08501811, -0.8553351, -1.72355, 0, 1, 0.6705883, 1,
-0.08385294, 0.008986882, -0.2663224, 0, 1, 0.6745098, 1,
-0.0820883, -0.2686288, -3.091795, 0, 1, 0.682353, 1,
-0.08081064, -0.1189246, -2.503658, 0, 1, 0.6862745, 1,
-0.07945697, -0.6283035, -1.51611, 0, 1, 0.6941177, 1,
-0.0730469, 1.190076, 0.7373759, 0, 1, 0.7019608, 1,
-0.07276494, 1.540012, 0.0417536, 0, 1, 0.7058824, 1,
-0.07213553, -0.3938544, -4.754951, 0, 1, 0.7137255, 1,
-0.071385, 0.7613101, -1.829843, 0, 1, 0.7176471, 1,
-0.07125711, -0.8160402, -5.423718, 0, 1, 0.7254902, 1,
-0.06196613, -0.1778647, -2.41735, 0, 1, 0.7294118, 1,
-0.05943853, 0.5139256, 0.316197, 0, 1, 0.7372549, 1,
-0.05888015, -0.3301243, -2.85423, 0, 1, 0.7411765, 1,
-0.05850409, 1.734902, -0.7529701, 0, 1, 0.7490196, 1,
-0.05773617, -1.084895, -2.039951, 0, 1, 0.7529412, 1,
-0.05420164, -0.07611435, -0.05378462, 0, 1, 0.7607843, 1,
-0.05382096, -0.00507539, -2.302399, 0, 1, 0.7647059, 1,
-0.0511756, -0.4945769, -3.464994, 0, 1, 0.772549, 1,
-0.03909798, -1.058909, -2.767571, 0, 1, 0.7764706, 1,
-0.03896872, -0.6132051, -2.301125, 0, 1, 0.7843137, 1,
-0.03805763, 1.301583, 0.2126572, 0, 1, 0.7882353, 1,
-0.03490638, -0.7772347, -2.804858, 0, 1, 0.7960784, 1,
-0.02199294, -0.8522928, -3.958996, 0, 1, 0.8039216, 1,
-0.02031952, -0.5265068, -1.875981, 0, 1, 0.8078431, 1,
-0.01973403, -0.2710327, -1.697389, 0, 1, 0.8156863, 1,
-0.01962886, -0.4436127, -2.389414, 0, 1, 0.8196079, 1,
-0.01891338, 0.4405935, -0.3063705, 0, 1, 0.827451, 1,
-0.01661012, 0.36676, 0.8430561, 0, 1, 0.8313726, 1,
-0.01503024, 0.8369605, -0.7588076, 0, 1, 0.8392157, 1,
-0.004149624, 1.47973, -0.5609643, 0, 1, 0.8431373, 1,
-0.003086761, -0.3112704, -1.861212, 0, 1, 0.8509804, 1,
0.0006015295, -1.950516, 3.252651, 0, 1, 0.854902, 1,
0.001409162, 0.02470197, -0.2454883, 0, 1, 0.8627451, 1,
0.004874753, -0.8893116, 4.315876, 0, 1, 0.8666667, 1,
0.005558665, -0.1357539, 3.169952, 0, 1, 0.8745098, 1,
0.00663762, 0.05729195, 0.3991029, 0, 1, 0.8784314, 1,
0.008585963, -0.8175166, 3.586016, 0, 1, 0.8862745, 1,
0.008953635, -0.8563197, 3.763601, 0, 1, 0.8901961, 1,
0.01037144, 0.4924783, 2.731737, 0, 1, 0.8980392, 1,
0.01631389, 0.5903171, -1.541318, 0, 1, 0.9058824, 1,
0.01818844, 2.018656, 0.1218588, 0, 1, 0.9098039, 1,
0.02673696, -0.7377202, 2.411704, 0, 1, 0.9176471, 1,
0.02956619, -0.1254584, 1.901183, 0, 1, 0.9215686, 1,
0.03014372, 1.524451, -0.664566, 0, 1, 0.9294118, 1,
0.03801969, -0.3655402, 2.007557, 0, 1, 0.9333333, 1,
0.0380897, 0.08735919, 0.1293764, 0, 1, 0.9411765, 1,
0.04071162, 0.9165093, 1.902698, 0, 1, 0.945098, 1,
0.04113877, 0.9813743, 0.8672313, 0, 1, 0.9529412, 1,
0.04318165, 1.174607, -0.1640224, 0, 1, 0.9568627, 1,
0.04819943, 0.05934761, 0.2051443, 0, 1, 0.9647059, 1,
0.05614523, 1.573452, 0.1552861, 0, 1, 0.9686275, 1,
0.0587369, 0.4854194, 1.331752, 0, 1, 0.9764706, 1,
0.05965346, -0.06841515, 3.168932, 0, 1, 0.9803922, 1,
0.06072729, -2.086802, 3.641037, 0, 1, 0.9882353, 1,
0.06479294, 0.1634618, -1.101933, 0, 1, 0.9921569, 1,
0.06684047, -0.5810627, 4.69568, 0, 1, 1, 1,
0.07147134, -0.3859234, 2.517582, 0, 0.9921569, 1, 1,
0.07434378, 0.8705851, 0.7065037, 0, 0.9882353, 1, 1,
0.07437256, 0.153989, 0.4685101, 0, 0.9803922, 1, 1,
0.07625983, 3.052412, 0.5571086, 0, 0.9764706, 1, 1,
0.0762959, -1.708051, 3.696761, 0, 0.9686275, 1, 1,
0.07844502, 0.9033585, -0.5556836, 0, 0.9647059, 1, 1,
0.07887883, -1.109056, 1.850136, 0, 0.9568627, 1, 1,
0.07894206, 0.6404095, 0.781723, 0, 0.9529412, 1, 1,
0.08309589, -0.01152614, 0.6997833, 0, 0.945098, 1, 1,
0.08611232, 0.1000694, 1.042142, 0, 0.9411765, 1, 1,
0.09013279, 0.5042769, -0.7477543, 0, 0.9333333, 1, 1,
0.09230624, 1.106861, -1.455451, 0, 0.9294118, 1, 1,
0.093303, -3.84741, 2.647638, 0, 0.9215686, 1, 1,
0.09538178, -1.088828, 2.075175, 0, 0.9176471, 1, 1,
0.09655691, 1.355935, 1.242694, 0, 0.9098039, 1, 1,
0.09729536, -0.1532385, 4.13103, 0, 0.9058824, 1, 1,
0.1000549, -0.7543332, 2.039992, 0, 0.8980392, 1, 1,
0.1011599, 0.9321738, -0.3966023, 0, 0.8901961, 1, 1,
0.1058258, 0.002276315, 3.54668, 0, 0.8862745, 1, 1,
0.1077712, 1.306551, 0.9050602, 0, 0.8784314, 1, 1,
0.1082581, -1.892415, 2.935206, 0, 0.8745098, 1, 1,
0.1123033, -0.7015173, 3.438701, 0, 0.8666667, 1, 1,
0.1137004, 1.251368, 0.01554768, 0, 0.8627451, 1, 1,
0.1149534, 1.794494, -0.6374056, 0, 0.854902, 1, 1,
0.1195016, 0.2588142, 0.3003736, 0, 0.8509804, 1, 1,
0.1208933, -1.733554, 2.464319, 0, 0.8431373, 1, 1,
0.1261274, -0.1264297, 2.081253, 0, 0.8392157, 1, 1,
0.1366899, 0.3883605, -0.8573588, 0, 0.8313726, 1, 1,
0.138347, 0.8081019, 1.89902, 0, 0.827451, 1, 1,
0.1384496, 1.251132, -1.288476, 0, 0.8196079, 1, 1,
0.1391754, 0.5170602, 1.579919, 0, 0.8156863, 1, 1,
0.1402473, -0.6627126, 1.423762, 0, 0.8078431, 1, 1,
0.1418822, -1.287606, 3.700774, 0, 0.8039216, 1, 1,
0.1423772, 1.122615, -0.1907258, 0, 0.7960784, 1, 1,
0.1469135, -2.586798, 3.234922, 0, 0.7882353, 1, 1,
0.147962, 0.8593298, -0.9180618, 0, 0.7843137, 1, 1,
0.1488528, -1.767249, 4.788697, 0, 0.7764706, 1, 1,
0.1519409, 0.3873083, 1.113794, 0, 0.772549, 1, 1,
0.153697, -0.9080681, 4.189278, 0, 0.7647059, 1, 1,
0.1539613, 0.9538514, -0.3164532, 0, 0.7607843, 1, 1,
0.157658, 1.785827, -0.9368944, 0, 0.7529412, 1, 1,
0.1631074, -0.863757, 3.643401, 0, 0.7490196, 1, 1,
0.1650208, 1.057211, 0.3780799, 0, 0.7411765, 1, 1,
0.1653262, -0.4599273, 3.096125, 0, 0.7372549, 1, 1,
0.1654591, 0.2051244, 0.9859161, 0, 0.7294118, 1, 1,
0.1712389, -0.863741, 2.343255, 0, 0.7254902, 1, 1,
0.1724586, -0.1054228, 3.211737, 0, 0.7176471, 1, 1,
0.1765382, 0.415616, -1.661985, 0, 0.7137255, 1, 1,
0.1815555, -0.001187453, 1.825515, 0, 0.7058824, 1, 1,
0.1873839, -1.188402, 3.793025, 0, 0.6980392, 1, 1,
0.1882183, 1.067379, -0.9985472, 0, 0.6941177, 1, 1,
0.1892635, -0.3894185, 0.4627758, 0, 0.6862745, 1, 1,
0.1894617, -0.8004375, 3.434757, 0, 0.682353, 1, 1,
0.1895093, -0.207663, 2.11087, 0, 0.6745098, 1, 1,
0.1917971, -1.376508, 4.483194, 0, 0.6705883, 1, 1,
0.1959241, 1.081979, 1.069747, 0, 0.6627451, 1, 1,
0.1967483, 0.9755924, -0.2024888, 0, 0.6588235, 1, 1,
0.1971566, -0.8626834, 3.877908, 0, 0.6509804, 1, 1,
0.2060596, -0.9398073, 2.759298, 0, 0.6470588, 1, 1,
0.2096903, 0.2162735, 0.3887585, 0, 0.6392157, 1, 1,
0.2136074, 0.6072397, -0.4235413, 0, 0.6352941, 1, 1,
0.2165651, 0.1819151, 0.2099375, 0, 0.627451, 1, 1,
0.2169099, 0.3335893, 0.7709532, 0, 0.6235294, 1, 1,
0.2201363, 0.6473196, 0.6002382, 0, 0.6156863, 1, 1,
0.2249614, 0.3835696, 1.004323, 0, 0.6117647, 1, 1,
0.2267517, -1.316037, 3.89447, 0, 0.6039216, 1, 1,
0.2286394, -0.2845811, 2.576864, 0, 0.5960785, 1, 1,
0.2324136, 0.7070916, 0.8939049, 0, 0.5921569, 1, 1,
0.2324712, 2.426324, -0.7059143, 0, 0.5843138, 1, 1,
0.234796, -0.8122487, 3.671089, 0, 0.5803922, 1, 1,
0.235761, -0.757288, 3.033479, 0, 0.572549, 1, 1,
0.2367137, 0.6404854, 0.9490352, 0, 0.5686275, 1, 1,
0.240439, -2.206084, 2.012236, 0, 0.5607843, 1, 1,
0.2414082, 0.05609819, 1.655093, 0, 0.5568628, 1, 1,
0.2441387, -2.271492, 3.049477, 0, 0.5490196, 1, 1,
0.2460415, -0.7074255, 2.476876, 0, 0.5450981, 1, 1,
0.2492171, -0.4646396, 3.191397, 0, 0.5372549, 1, 1,
0.2532043, -0.6495204, 3.392966, 0, 0.5333334, 1, 1,
0.2598566, 0.5533077, 0.3487983, 0, 0.5254902, 1, 1,
0.2626979, 0.3587074, 0.1847127, 0, 0.5215687, 1, 1,
0.2654932, -1.479186, 2.433307, 0, 0.5137255, 1, 1,
0.2660522, 0.6740484, 0.9516494, 0, 0.509804, 1, 1,
0.2675203, 1.441699, 1.084148, 0, 0.5019608, 1, 1,
0.2679354, -0.1208803, 2.440262, 0, 0.4941176, 1, 1,
0.2688521, 1.445124, 0.7932112, 0, 0.4901961, 1, 1,
0.2715664, -1.098027, 2.054077, 0, 0.4823529, 1, 1,
0.2749476, 0.3620096, 1.185827, 0, 0.4784314, 1, 1,
0.2817477, 1.176309, -3.225491, 0, 0.4705882, 1, 1,
0.2875365, -1.632527, 0.6194392, 0, 0.4666667, 1, 1,
0.2902372, 0.4722798, 1.069174, 0, 0.4588235, 1, 1,
0.2920682, -0.9653389, 3.704063, 0, 0.454902, 1, 1,
0.2945997, 0.9095123, 1.4455, 0, 0.4470588, 1, 1,
0.2977744, -0.6909315, 2.060822, 0, 0.4431373, 1, 1,
0.2990291, -0.4954553, 2.041267, 0, 0.4352941, 1, 1,
0.3007884, 1.290693, 0.5532104, 0, 0.4313726, 1, 1,
0.301431, -1.592003, 1.267801, 0, 0.4235294, 1, 1,
0.3031575, 1.378706, 0.7391778, 0, 0.4196078, 1, 1,
0.3106456, -0.3885428, 4.281358, 0, 0.4117647, 1, 1,
0.3201977, 0.3012921, 2.514477, 0, 0.4078431, 1, 1,
0.322144, -0.678201, 2.743105, 0, 0.4, 1, 1,
0.3277411, -1.853645, 4.378494, 0, 0.3921569, 1, 1,
0.3341047, -0.2975554, 1.961189, 0, 0.3882353, 1, 1,
0.3375674, -0.6420698, 2.422118, 0, 0.3803922, 1, 1,
0.3445667, 0.2427864, 1.888616, 0, 0.3764706, 1, 1,
0.3459367, -0.7405904, 3.138953, 0, 0.3686275, 1, 1,
0.3508151, -1.011575, 3.315186, 0, 0.3647059, 1, 1,
0.3520832, 0.6512113, -0.07199746, 0, 0.3568628, 1, 1,
0.3521367, -0.1095121, 0.9225046, 0, 0.3529412, 1, 1,
0.3586531, -0.2228242, 3.83805, 0, 0.345098, 1, 1,
0.3588963, -0.5012676, 1.047238, 0, 0.3411765, 1, 1,
0.3618404, -2.584757, 4.660796, 0, 0.3333333, 1, 1,
0.3627176, -0.1356152, 0.2811471, 0, 0.3294118, 1, 1,
0.3635456, -0.6213992, 2.787086, 0, 0.3215686, 1, 1,
0.3655683, 0.751002, 0.820406, 0, 0.3176471, 1, 1,
0.365823, -0.2381799, 3.21165, 0, 0.3098039, 1, 1,
0.3685629, -0.09401059, 1.230213, 0, 0.3058824, 1, 1,
0.3703, -0.5553727, 1.294453, 0, 0.2980392, 1, 1,
0.3725554, 0.1308837, 0.5110564, 0, 0.2901961, 1, 1,
0.377911, 0.1595805, 1.790035, 0, 0.2862745, 1, 1,
0.3784719, -0.05821949, 2.065502, 0, 0.2784314, 1, 1,
0.3819722, 1.377123, 2.179155, 0, 0.2745098, 1, 1,
0.3827487, -1.445891, 2.662487, 0, 0.2666667, 1, 1,
0.3858256, 0.297701, -0.9794087, 0, 0.2627451, 1, 1,
0.3862227, -0.1145729, 1.199272, 0, 0.254902, 1, 1,
0.3884115, -0.4214488, 2.556612, 0, 0.2509804, 1, 1,
0.3888963, 1.126001, -0.2104443, 0, 0.2431373, 1, 1,
0.3914869, -0.623076, 0.8636538, 0, 0.2392157, 1, 1,
0.3930522, -0.3836722, 2.954148, 0, 0.2313726, 1, 1,
0.3934076, 0.04685484, 0.9007761, 0, 0.227451, 1, 1,
0.3940172, -0.4041567, 1.057943, 0, 0.2196078, 1, 1,
0.4009541, 0.139445, 1.89851, 0, 0.2156863, 1, 1,
0.4040006, 0.7826157, 0.4410537, 0, 0.2078431, 1, 1,
0.4181, -1.421971, 2.276904, 0, 0.2039216, 1, 1,
0.4203334, 0.2476542, 2.296095, 0, 0.1960784, 1, 1,
0.4292742, 1.31427, 0.9307777, 0, 0.1882353, 1, 1,
0.429708, -0.4618887, 1.320037, 0, 0.1843137, 1, 1,
0.4302026, 1.719324, 1.086286, 0, 0.1764706, 1, 1,
0.4314061, 0.008714821, 1.145601, 0, 0.172549, 1, 1,
0.4321826, -1.023233, 3.560512, 0, 0.1647059, 1, 1,
0.4338464, 1.49428, -1.234285, 0, 0.1607843, 1, 1,
0.4345144, 0.515287, -0.0742313, 0, 0.1529412, 1, 1,
0.4368039, 0.02571302, 2.324444, 0, 0.1490196, 1, 1,
0.4407293, 0.800419, 0.1794971, 0, 0.1411765, 1, 1,
0.4417826, 0.0004872202, 2.255478, 0, 0.1372549, 1, 1,
0.4420403, 1.175668, -1.400773, 0, 0.1294118, 1, 1,
0.4459363, 0.8841382, 0.6004419, 0, 0.1254902, 1, 1,
0.4510911, -1.632353, 1.184084, 0, 0.1176471, 1, 1,
0.4540467, -0.7418182, 4.054888, 0, 0.1137255, 1, 1,
0.4541267, 0.7766865, 0.7748362, 0, 0.1058824, 1, 1,
0.4601711, 1.842214, 0.7098692, 0, 0.09803922, 1, 1,
0.4640645, -0.4515486, 3.480587, 0, 0.09411765, 1, 1,
0.4643221, -1.355341, 2.920218, 0, 0.08627451, 1, 1,
0.4669874, 0.190494, 2.083246, 0, 0.08235294, 1, 1,
0.4690579, 0.1455941, 0.9712512, 0, 0.07450981, 1, 1,
0.4692977, 0.3190054, -0.0096974, 0, 0.07058824, 1, 1,
0.4706009, -0.7813246, 0.5448048, 0, 0.0627451, 1, 1,
0.4712467, -0.746017, 2.314688, 0, 0.05882353, 1, 1,
0.4719895, 1.742205, 0.4314448, 0, 0.05098039, 1, 1,
0.4725529, -1.098438, 4.879601, 0, 0.04705882, 1, 1,
0.4798508, 0.4811718, 0.4327799, 0, 0.03921569, 1, 1,
0.4808886, -0.1760249, 3.368838, 0, 0.03529412, 1, 1,
0.4855447, -0.1928797, 2.707374, 0, 0.02745098, 1, 1,
0.4881957, -1.637552, 2.900069, 0, 0.02352941, 1, 1,
0.4912943, 0.2089714, -0.6426681, 0, 0.01568628, 1, 1,
0.492097, -0.04312697, 1.819488, 0, 0.01176471, 1, 1,
0.4939823, -3.053207, 2.328835, 0, 0.003921569, 1, 1,
0.496795, -0.1160936, 2.280125, 0.003921569, 0, 1, 1,
0.5118128, -0.3790545, 1.361253, 0.007843138, 0, 1, 1,
0.5122133, 2.382385, -0.2701553, 0.01568628, 0, 1, 1,
0.5126773, 1.626235, 0.6045539, 0.01960784, 0, 1, 1,
0.5130313, 1.090827, -1.239608, 0.02745098, 0, 1, 1,
0.5153942, 0.07167292, -0.05351761, 0.03137255, 0, 1, 1,
0.5178951, -0.6704572, 4.439233, 0.03921569, 0, 1, 1,
0.5191036, 0.8995485, -0.6346512, 0.04313726, 0, 1, 1,
0.5194299, 0.6276758, -0.5094212, 0.05098039, 0, 1, 1,
0.5282103, -1.05688, 2.816469, 0.05490196, 0, 1, 1,
0.5293827, 0.01223721, 3.287805, 0.0627451, 0, 1, 1,
0.5334466, 0.6326072, 2.186674, 0.06666667, 0, 1, 1,
0.5367009, 0.3333414, 1.56316, 0.07450981, 0, 1, 1,
0.5368033, -0.6133105, 2.39254, 0.07843138, 0, 1, 1,
0.5385047, 0.222566, 0.05179901, 0.08627451, 0, 1, 1,
0.5388584, 1.208992, 0.3191519, 0.09019608, 0, 1, 1,
0.5406959, 0.07162284, 0.4307897, 0.09803922, 0, 1, 1,
0.5442064, 0.5932614, 1.484178, 0.1058824, 0, 1, 1,
0.5459623, -0.04311876, -0.3081906, 0.1098039, 0, 1, 1,
0.555075, -0.4669634, 1.581536, 0.1176471, 0, 1, 1,
0.5592111, -1.869869, 3.728046, 0.1215686, 0, 1, 1,
0.5648435, -0.2311274, 3.449323, 0.1294118, 0, 1, 1,
0.5652822, 0.5113351, 0.6115531, 0.1333333, 0, 1, 1,
0.5736746, 0.05162499, 2.292341, 0.1411765, 0, 1, 1,
0.5751047, -0.1638257, 1.652072, 0.145098, 0, 1, 1,
0.5875523, 1.002948, 0.7909489, 0.1529412, 0, 1, 1,
0.5907953, 0.1439698, 0.06148227, 0.1568628, 0, 1, 1,
0.5918735, 0.8577875, 1.351214, 0.1647059, 0, 1, 1,
0.6024246, -0.8432136, 2.374385, 0.1686275, 0, 1, 1,
0.606731, 0.7218714, 2.538013, 0.1764706, 0, 1, 1,
0.607577, -0.01393164, 2.165875, 0.1803922, 0, 1, 1,
0.6084414, 0.379106, 1.144714, 0.1882353, 0, 1, 1,
0.6147699, 1.030005, -0.1968088, 0.1921569, 0, 1, 1,
0.6171039, -0.2460604, 3.747715, 0.2, 0, 1, 1,
0.6198279, 0.7716144, 1.421096, 0.2078431, 0, 1, 1,
0.6216433, -0.2301588, 2.987257, 0.2117647, 0, 1, 1,
0.6270422, -2.377412, 4.329307, 0.2196078, 0, 1, 1,
0.6286809, 0.9717466, -1.140031, 0.2235294, 0, 1, 1,
0.6299118, 1.6058, 0.8759184, 0.2313726, 0, 1, 1,
0.6352136, 0.2842035, 0.7610057, 0.2352941, 0, 1, 1,
0.6361687, 0.8662553, 1.842139, 0.2431373, 0, 1, 1,
0.6384053, 0.6390327, 0.01002824, 0.2470588, 0, 1, 1,
0.6385297, 1.221316, 2.148748, 0.254902, 0, 1, 1,
0.6404487, 1.36242, -0.02956147, 0.2588235, 0, 1, 1,
0.6418666, -0.2856264, 0.8467001, 0.2666667, 0, 1, 1,
0.6447212, 0.4271819, 0.07161964, 0.2705882, 0, 1, 1,
0.648438, 0.4315312, 1.762013, 0.2784314, 0, 1, 1,
0.6535388, -1.081589, 0.8711392, 0.282353, 0, 1, 1,
0.6581429, -0.06131577, 1.29021, 0.2901961, 0, 1, 1,
0.6591477, -0.5300311, 3.680538, 0.2941177, 0, 1, 1,
0.6593491, -1.085945, 4.033799, 0.3019608, 0, 1, 1,
0.6810056, 0.2475407, 1.674638, 0.3098039, 0, 1, 1,
0.6821485, 1.913061, -0.7282652, 0.3137255, 0, 1, 1,
0.6838238, 1.785818, -0.9662261, 0.3215686, 0, 1, 1,
0.6901004, -0.3237435, 1.697131, 0.3254902, 0, 1, 1,
0.6903041, 2.020557, -0.005894079, 0.3333333, 0, 1, 1,
0.6964672, -1.187328, 3.836357, 0.3372549, 0, 1, 1,
0.7069214, -0.001119951, 0.6888119, 0.345098, 0, 1, 1,
0.7117123, 0.8975628, 1.762923, 0.3490196, 0, 1, 1,
0.7222744, -1.328631, 2.18879, 0.3568628, 0, 1, 1,
0.7230495, 1.470163, 0.1180554, 0.3607843, 0, 1, 1,
0.7234277, -0.9152718, 3.044884, 0.3686275, 0, 1, 1,
0.7272299, 0.08814857, 0.1400555, 0.372549, 0, 1, 1,
0.730605, 0.4393862, 2.724786, 0.3803922, 0, 1, 1,
0.7364306, -0.5905491, 1.693194, 0.3843137, 0, 1, 1,
0.7378245, -1.430639, 1.829877, 0.3921569, 0, 1, 1,
0.7408554, 0.5764578, 1.732567, 0.3960784, 0, 1, 1,
0.745466, 0.4504731, 1.126259, 0.4039216, 0, 1, 1,
0.7467166, -1.346208, 3.018292, 0.4117647, 0, 1, 1,
0.7553901, 2.684952, 0.9349516, 0.4156863, 0, 1, 1,
0.7586532, 0.2976848, 0.7347872, 0.4235294, 0, 1, 1,
0.7592346, 0.8113319, 1.576538, 0.427451, 0, 1, 1,
0.7613014, -1.813421, 1.101226, 0.4352941, 0, 1, 1,
0.7696242, -0.1640453, 1.591833, 0.4392157, 0, 1, 1,
0.7740434, 2.795526, 0.2933094, 0.4470588, 0, 1, 1,
0.7757886, -0.8589932, 2.741113, 0.4509804, 0, 1, 1,
0.7760449, 0.4794701, 1.206349, 0.4588235, 0, 1, 1,
0.7774745, -0.4371057, 4.105276, 0.4627451, 0, 1, 1,
0.7792178, 0.5632855, 0.7833709, 0.4705882, 0, 1, 1,
0.7853861, 0.4937354, 1.232609, 0.4745098, 0, 1, 1,
0.7903354, -0.4224713, 1.666586, 0.4823529, 0, 1, 1,
0.7913901, -0.8952706, 1.669702, 0.4862745, 0, 1, 1,
0.7931496, -0.352771, 3.238787, 0.4941176, 0, 1, 1,
0.798151, -0.6715969, 3.666725, 0.5019608, 0, 1, 1,
0.8021934, 0.4891801, -0.5542601, 0.5058824, 0, 1, 1,
0.8030623, -0.3010848, 1.741607, 0.5137255, 0, 1, 1,
0.8096727, -1.747056, 4.184368, 0.5176471, 0, 1, 1,
0.8115122, -1.025361, 3.194735, 0.5254902, 0, 1, 1,
0.8143293, 2.056739, 0.9531345, 0.5294118, 0, 1, 1,
0.8226049, -0.8668316, 2.320574, 0.5372549, 0, 1, 1,
0.8241892, 1.396866, 2.617444, 0.5411765, 0, 1, 1,
0.826312, -0.8025624, 2.404058, 0.5490196, 0, 1, 1,
0.8268977, -1.072187, 3.09878, 0.5529412, 0, 1, 1,
0.8331743, 1.074039, 1.20107, 0.5607843, 0, 1, 1,
0.8335797, -1.370305, 1.672129, 0.5647059, 0, 1, 1,
0.8354687, 0.459514, 0.4180005, 0.572549, 0, 1, 1,
0.8358971, -0.7859352, 1.455828, 0.5764706, 0, 1, 1,
0.8360195, 1.288581, -1.047778, 0.5843138, 0, 1, 1,
0.8399809, 0.2798336, 0.1426693, 0.5882353, 0, 1, 1,
0.845841, -2.092099, 3.595348, 0.5960785, 0, 1, 1,
0.8525252, -0.29055, 1.17787, 0.6039216, 0, 1, 1,
0.8550256, -0.708647, 1.663727, 0.6078432, 0, 1, 1,
0.8627363, 0.458486, 1.341869, 0.6156863, 0, 1, 1,
0.8671302, -1.104066, 2.349131, 0.6196079, 0, 1, 1,
0.867595, 0.376533, -0.8600501, 0.627451, 0, 1, 1,
0.8693772, -1.191764, 2.180608, 0.6313726, 0, 1, 1,
0.869577, -0.9525228, 1.030467, 0.6392157, 0, 1, 1,
0.869637, 1.010953, 0.6138089, 0.6431373, 0, 1, 1,
0.8704857, 2.476706, 1.41863, 0.6509804, 0, 1, 1,
0.8706973, 2.310103, 1.586495, 0.654902, 0, 1, 1,
0.881118, -0.7239445, 2.729775, 0.6627451, 0, 1, 1,
0.886031, -0.2995363, 1.71413, 0.6666667, 0, 1, 1,
0.888982, 0.6840169, 0.2922023, 0.6745098, 0, 1, 1,
0.8914624, 0.8766144, -0.3703894, 0.6784314, 0, 1, 1,
0.8934041, -0.7915853, 3.192267, 0.6862745, 0, 1, 1,
0.9014232, 1.432212, 1.069816, 0.6901961, 0, 1, 1,
0.9053197, 0.5224168, 0.1297837, 0.6980392, 0, 1, 1,
0.9064348, 0.04531289, 1.435664, 0.7058824, 0, 1, 1,
0.9087991, -0.6711518, 3.314204, 0.7098039, 0, 1, 1,
0.9098517, -0.4210826, 3.076157, 0.7176471, 0, 1, 1,
0.9131975, -1.738106, 2.971497, 0.7215686, 0, 1, 1,
0.9142085, 0.2805262, 1.199001, 0.7294118, 0, 1, 1,
0.9173672, 1.882574, -0.005911774, 0.7333333, 0, 1, 1,
0.9186963, 0.09426437, 0.1506717, 0.7411765, 0, 1, 1,
0.9215198, -1.085904, 2.563666, 0.7450981, 0, 1, 1,
0.9267998, -0.1745426, 0.9157288, 0.7529412, 0, 1, 1,
0.9284252, -0.3787873, 1.736891, 0.7568628, 0, 1, 1,
0.9294841, -0.4827688, 1.768795, 0.7647059, 0, 1, 1,
0.9301776, -1.023815, 2.688786, 0.7686275, 0, 1, 1,
0.9345099, 0.3932471, 2.07783, 0.7764706, 0, 1, 1,
0.9350601, 0.1904768, 0.02298516, 0.7803922, 0, 1, 1,
0.9367334, 0.3495175, -0.02052887, 0.7882353, 0, 1, 1,
0.9401131, 0.4186218, 1.912123, 0.7921569, 0, 1, 1,
0.9422307, -0.3477634, 1.501554, 0.8, 0, 1, 1,
0.9437951, 0.9277208, 1.211904, 0.8078431, 0, 1, 1,
0.9452059, 0.1558826, 1.410399, 0.8117647, 0, 1, 1,
0.9559014, 2.758641, -1.934746, 0.8196079, 0, 1, 1,
0.9577618, -0.2707111, 1.891751, 0.8235294, 0, 1, 1,
0.9580894, 0.1929864, -0.3052529, 0.8313726, 0, 1, 1,
0.9585323, -0.5627373, 0.5936524, 0.8352941, 0, 1, 1,
0.9601238, -0.04516361, 2.123845, 0.8431373, 0, 1, 1,
0.9646907, -0.4560249, 1.294011, 0.8470588, 0, 1, 1,
0.9692008, -0.4485095, 3.23208, 0.854902, 0, 1, 1,
0.9711013, 0.5700113, 0.4438905, 0.8588235, 0, 1, 1,
0.9716173, 0.7601781, 1.621261, 0.8666667, 0, 1, 1,
0.9729906, -1.238436, 1.366433, 0.8705882, 0, 1, 1,
0.9762962, 0.1426724, 1.063055, 0.8784314, 0, 1, 1,
0.9810046, 1.076695, -0.5261664, 0.8823529, 0, 1, 1,
0.982779, 1.006768, 3.2171, 0.8901961, 0, 1, 1,
0.9831222, -1.059786, 2.792592, 0.8941177, 0, 1, 1,
0.9838172, -0.5138267, 3.942215, 0.9019608, 0, 1, 1,
0.9872916, 1.375444, 1.399129, 0.9098039, 0, 1, 1,
0.9908504, -1.130355, 3.123302, 0.9137255, 0, 1, 1,
0.9922809, -1.375588, 4.39621, 0.9215686, 0, 1, 1,
0.9964548, 0.6852397, -0.2095951, 0.9254902, 0, 1, 1,
0.9970593, -0.7110238, 3.003731, 0.9333333, 0, 1, 1,
1.008404, 0.6146575, 1.866302, 0.9372549, 0, 1, 1,
1.009927, 0.369969, 0.7184509, 0.945098, 0, 1, 1,
1.012213, 0.1861958, 2.539126, 0.9490196, 0, 1, 1,
1.014718, 0.1476856, 2.286311, 0.9568627, 0, 1, 1,
1.018948, -0.1054501, 0.0313837, 0.9607843, 0, 1, 1,
1.019518, 0.601189, -0.07012773, 0.9686275, 0, 1, 1,
1.021827, 0.8102576, 2.028597, 0.972549, 0, 1, 1,
1.025262, 0.4257333, 0.6789354, 0.9803922, 0, 1, 1,
1.02873, 0.3257565, 0.00518959, 0.9843137, 0, 1, 1,
1.035091, -0.05387857, 1.353949, 0.9921569, 0, 1, 1,
1.038803, -0.5539894, 1.590708, 0.9960784, 0, 1, 1,
1.043493, -1.506266, 0.9034036, 1, 0, 0.9960784, 1,
1.045347, 0.6254482, 1.197227, 1, 0, 0.9882353, 1,
1.047228, -0.1269258, 2.875785, 1, 0, 0.9843137, 1,
1.047961, 0.4479332, 1.822928, 1, 0, 0.9764706, 1,
1.050955, 0.3783998, 1.513636, 1, 0, 0.972549, 1,
1.051517, 1.112162, -0.8398823, 1, 0, 0.9647059, 1,
1.065794, 1.548167, 1.16339, 1, 0, 0.9607843, 1,
1.074189, -0.7891618, 1.725403, 1, 0, 0.9529412, 1,
1.078077, -1.655682, 2.363294, 1, 0, 0.9490196, 1,
1.078175, -1.12765, 2.366335, 1, 0, 0.9411765, 1,
1.080726, 0.6065482, 2.260509, 1, 0, 0.9372549, 1,
1.086066, -0.8570458, 3.940666, 1, 0, 0.9294118, 1,
1.092918, -0.07343328, 4.023452, 1, 0, 0.9254902, 1,
1.102904, 1.657522, -0.8973126, 1, 0, 0.9176471, 1,
1.105075, 2.109523, 1.67747, 1, 0, 0.9137255, 1,
1.106571, 0.1146653, 2.720594, 1, 0, 0.9058824, 1,
1.10734, -0.5733182, 1.7648, 1, 0, 0.9019608, 1,
1.115932, -0.05080962, 2.210934, 1, 0, 0.8941177, 1,
1.120763, -0.8659766, 0.177547, 1, 0, 0.8862745, 1,
1.121874, -0.3041354, 3.886642, 1, 0, 0.8823529, 1,
1.122435, 0.3980035, 0.5952568, 1, 0, 0.8745098, 1,
1.127128, 1.277351, -0.5751817, 1, 0, 0.8705882, 1,
1.129131, 1.124344, -1.979526, 1, 0, 0.8627451, 1,
1.130952, -0.8517933, 2.946452, 1, 0, 0.8588235, 1,
1.144712, 1.081932, 0.4979875, 1, 0, 0.8509804, 1,
1.146918, 1.346599, 2.178319, 1, 0, 0.8470588, 1,
1.158239, 1.003244, 1.447596, 1, 0, 0.8392157, 1,
1.171394, 0.4122629, 4.401472, 1, 0, 0.8352941, 1,
1.171614, 0.3117835, 2.028342, 1, 0, 0.827451, 1,
1.172651, 0.5742958, 1.075161, 1, 0, 0.8235294, 1,
1.176289, -0.2702578, 0.7629703, 1, 0, 0.8156863, 1,
1.186643, 0.4306647, 1.188954, 1, 0, 0.8117647, 1,
1.190011, -0.8443347, 2.862445, 1, 0, 0.8039216, 1,
1.192373, 0.467907, 1.171425, 1, 0, 0.7960784, 1,
1.19912, 0.7534166, 1.209069, 1, 0, 0.7921569, 1,
1.200876, -0.1257235, 1.499746, 1, 0, 0.7843137, 1,
1.203465, 0.01522842, 1.683826, 1, 0, 0.7803922, 1,
1.208176, 0.8403449, 1.267273, 1, 0, 0.772549, 1,
1.209211, 0.1719047, 1.370898, 1, 0, 0.7686275, 1,
1.215602, 0.5893627, 1.228603, 1, 0, 0.7607843, 1,
1.219539, 0.03559851, 1.006842, 1, 0, 0.7568628, 1,
1.228599, 0.6360717, 1.478865, 1, 0, 0.7490196, 1,
1.231079, 1.303409, 0.6600447, 1, 0, 0.7450981, 1,
1.233918, -0.5427238, 2.286363, 1, 0, 0.7372549, 1,
1.234752, 0.4626097, 0.6560714, 1, 0, 0.7333333, 1,
1.234771, -0.1139316, 0.5599958, 1, 0, 0.7254902, 1,
1.236034, 0.1396913, 1.932602, 1, 0, 0.7215686, 1,
1.237349, -0.01171232, 0.8295708, 1, 0, 0.7137255, 1,
1.238004, -0.2837994, 2.416627, 1, 0, 0.7098039, 1,
1.243696, -1.559602, 2.086633, 1, 0, 0.7019608, 1,
1.24427, 1.365706, 0.6247129, 1, 0, 0.6941177, 1,
1.244708, -0.490956, 0.4654028, 1, 0, 0.6901961, 1,
1.245521, 0.05037531, 3.313828, 1, 0, 0.682353, 1,
1.263876, 2.536066, -0.9657939, 1, 0, 0.6784314, 1,
1.265578, 0.01972062, 2.429801, 1, 0, 0.6705883, 1,
1.26634, -0.0953924, 1.05395, 1, 0, 0.6666667, 1,
1.271901, 0.08632538, 2.310318, 1, 0, 0.6588235, 1,
1.281362, -0.0218007, 2.697282, 1, 0, 0.654902, 1,
1.288038, 1.245572, -0.677395, 1, 0, 0.6470588, 1,
1.295891, -1.051314, 2.244141, 1, 0, 0.6431373, 1,
1.296844, -0.7529169, 1.540129, 1, 0, 0.6352941, 1,
1.314844, -1.05909, 0.9430698, 1, 0, 0.6313726, 1,
1.315362, 0.1228672, 1.656205, 1, 0, 0.6235294, 1,
1.318006, -1.510895, 2.810452, 1, 0, 0.6196079, 1,
1.321534, 0.7092931, 0.1031095, 1, 0, 0.6117647, 1,
1.322366, -0.06950613, 0.8427176, 1, 0, 0.6078432, 1,
1.343791, -0.8675487, -0.2209728, 1, 0, 0.6, 1,
1.344003, 1.055873, -0.2612798, 1, 0, 0.5921569, 1,
1.344185, -1.517129, 2.398087, 1, 0, 0.5882353, 1,
1.348794, -0.4262554, 1.252903, 1, 0, 0.5803922, 1,
1.350689, 0.1160478, 2.227831, 1, 0, 0.5764706, 1,
1.370212, -1.097056, 3.387311, 1, 0, 0.5686275, 1,
1.376657, 0.2445201, 1.561507, 1, 0, 0.5647059, 1,
1.378637, -1.723865, 2.769429, 1, 0, 0.5568628, 1,
1.381897, 1.393533, 1.938672, 1, 0, 0.5529412, 1,
1.383102, 1.026708, 0.4479812, 1, 0, 0.5450981, 1,
1.39146, -0.1000053, 1.020648, 1, 0, 0.5411765, 1,
1.405722, 0.4601144, 3.241412, 1, 0, 0.5333334, 1,
1.408463, 0.7609281, 2.049661, 1, 0, 0.5294118, 1,
1.414726, 1.342226, 0.2634225, 1, 0, 0.5215687, 1,
1.415649, -0.3239218, 1.217798, 1, 0, 0.5176471, 1,
1.41802, 1.140988, 2.040956, 1, 0, 0.509804, 1,
1.418087, -2.150422, 4.088737, 1, 0, 0.5058824, 1,
1.419335, -2.123781, 3.794961, 1, 0, 0.4980392, 1,
1.432185, 1.580292, 1.300633, 1, 0, 0.4901961, 1,
1.44209, -0.01938838, 0.7660072, 1, 0, 0.4862745, 1,
1.442788, -1.55258, 1.461612, 1, 0, 0.4784314, 1,
1.444129, -0.9456248, 1.677224, 1, 0, 0.4745098, 1,
1.452487, -1.012002, 2.940217, 1, 0, 0.4666667, 1,
1.457193, -0.8789596, 1.628177, 1, 0, 0.4627451, 1,
1.457744, 0.6676114, -0.09222686, 1, 0, 0.454902, 1,
1.461539, -0.2081232, 1.693104, 1, 0, 0.4509804, 1,
1.462946, 0.04353619, 1.299385, 1, 0, 0.4431373, 1,
1.472254, -0.6660511, 1.381136, 1, 0, 0.4392157, 1,
1.473884, -0.08208677, 0.9497724, 1, 0, 0.4313726, 1,
1.478579, 1.483957, 1.913633, 1, 0, 0.427451, 1,
1.498477, -0.710132, 1.162754, 1, 0, 0.4196078, 1,
1.504401, -0.6057827, 0.5533934, 1, 0, 0.4156863, 1,
1.515861, -0.6148637, 0.9867959, 1, 0, 0.4078431, 1,
1.525316, 0.6779687, 2.796932, 1, 0, 0.4039216, 1,
1.528425, 0.3308842, -1.936148, 1, 0, 0.3960784, 1,
1.539267, 1.179805, 2.100779, 1, 0, 0.3882353, 1,
1.575379, -0.400716, 0.4874039, 1, 0, 0.3843137, 1,
1.575682, -0.575945, -0.7202241, 1, 0, 0.3764706, 1,
1.576181, -0.5251415, 1.974079, 1, 0, 0.372549, 1,
1.580004, -0.1285762, 2.719685, 1, 0, 0.3647059, 1,
1.594479, -0.08552467, 2.057495, 1, 0, 0.3607843, 1,
1.595095, -1.416346, 3.509622, 1, 0, 0.3529412, 1,
1.599413, 2.563997, 0.6835177, 1, 0, 0.3490196, 1,
1.605155, -0.3812456, 1.698215, 1, 0, 0.3411765, 1,
1.623215, -0.4279359, 1.040159, 1, 0, 0.3372549, 1,
1.630198, 0.119942, 1.271611, 1, 0, 0.3294118, 1,
1.631608, -0.121135, 0.797397, 1, 0, 0.3254902, 1,
1.632064, -1.429059, 2.252113, 1, 0, 0.3176471, 1,
1.63562, 0.5101522, 2.832718, 1, 0, 0.3137255, 1,
1.637987, -0.6975341, 2.429602, 1, 0, 0.3058824, 1,
1.645414, -1.072295, 2.812402, 1, 0, 0.2980392, 1,
1.646383, -0.702711, 1.972357, 1, 0, 0.2941177, 1,
1.659376, -0.2704085, -0.6961018, 1, 0, 0.2862745, 1,
1.661882, 0.03406778, 1.591444, 1, 0, 0.282353, 1,
1.666696, 0.3185506, 1.793329, 1, 0, 0.2745098, 1,
1.668536, 1.037876, 1.577548, 1, 0, 0.2705882, 1,
1.677127, 0.08064239, 0.6408178, 1, 0, 0.2627451, 1,
1.677375, 0.06850961, 1.64695, 1, 0, 0.2588235, 1,
1.677445, -0.3519031, 1.729709, 1, 0, 0.2509804, 1,
1.680163, -0.762353, 4.6025, 1, 0, 0.2470588, 1,
1.693296, 1.489716, 1.261155, 1, 0, 0.2392157, 1,
1.70603, -1.844059, 2.222034, 1, 0, 0.2352941, 1,
1.744428, -0.6973048, 2.659006, 1, 0, 0.227451, 1,
1.746883, 0.4841451, 0.7940012, 1, 0, 0.2235294, 1,
1.751709, 1.063208, -0.4669464, 1, 0, 0.2156863, 1,
1.783498, -0.5213721, 0.9254641, 1, 0, 0.2117647, 1,
1.795743, 0.7542257, 2.285735, 1, 0, 0.2039216, 1,
1.82353, -0.6084273, 1.814843, 1, 0, 0.1960784, 1,
1.829352, -0.4244312, 1.580558, 1, 0, 0.1921569, 1,
1.830923, -0.5544446, 3.95076, 1, 0, 0.1843137, 1,
1.844783, 3.250031, 0.6827053, 1, 0, 0.1803922, 1,
1.89251, 1.176947, -0.1050606, 1, 0, 0.172549, 1,
1.89629, -0.1896837, 1.879037, 1, 0, 0.1686275, 1,
1.901786, -0.5062839, 2.07903, 1, 0, 0.1607843, 1,
1.911399, 1.727526, 0.9083786, 1, 0, 0.1568628, 1,
2.00826, 0.1874669, 1.976011, 1, 0, 0.1490196, 1,
2.012367, 0.326924, 1.044426, 1, 0, 0.145098, 1,
2.022777, -0.171673, 1.943997, 1, 0, 0.1372549, 1,
2.060781, -1.36104, 1.59824, 1, 0, 0.1333333, 1,
2.068412, 1.330095, -0.4354567, 1, 0, 0.1254902, 1,
2.090439, 1.983372, 1.148373, 1, 0, 0.1215686, 1,
2.103173, 0.4889952, 1.476869, 1, 0, 0.1137255, 1,
2.121227, 1.514916, -0.2382178, 1, 0, 0.1098039, 1,
2.122696, 0.1709227, 2.390174, 1, 0, 0.1019608, 1,
2.128949, 3.362609, 0.6655278, 1, 0, 0.09411765, 1,
2.170813, 0.2496049, 1.579067, 1, 0, 0.09019608, 1,
2.194135, 0.1861319, 2.010083, 1, 0, 0.08235294, 1,
2.244166, -1.361547, 3.054826, 1, 0, 0.07843138, 1,
2.262527, 1.858912, 0.4506809, 1, 0, 0.07058824, 1,
2.2916, 0.1267035, 3.09797, 1, 0, 0.06666667, 1,
2.313571, 1.097999, 1.190438, 1, 0, 0.05882353, 1,
2.326015, 0.1439934, 2.889931, 1, 0, 0.05490196, 1,
2.329063, -0.8622304, 2.654272, 1, 0, 0.04705882, 1,
2.362474, -0.01770521, 2.362877, 1, 0, 0.04313726, 1,
2.578886, -0.626742, 2.059813, 1, 0, 0.03529412, 1,
2.640525, -0.1155545, 0.5458547, 1, 0, 0.03137255, 1,
2.649431, 1.467281, 2.951345, 1, 0, 0.02352941, 1,
2.670539, 0.4508862, 1.636205, 1, 0, 0.01960784, 1,
2.795528, -0.4257686, 2.27514, 1, 0, 0.01176471, 1,
2.813601, -0.7607213, 1.216821, 1, 0, 0.007843138, 1
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
0.151517, -5.069508, -7.17013, 0, -0.5, 0.5, 0.5,
0.151517, -5.069508, -7.17013, 1, -0.5, 0.5, 0.5,
0.151517, -5.069508, -7.17013, 1, 1.5, 0.5, 0.5,
0.151517, -5.069508, -7.17013, 0, 1.5, 0.5, 0.5
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
-3.413014, -0.2424004, -7.17013, 0, -0.5, 0.5, 0.5,
-3.413014, -0.2424004, -7.17013, 1, -0.5, 0.5, 0.5,
-3.413014, -0.2424004, -7.17013, 1, 1.5, 0.5, 0.5,
-3.413014, -0.2424004, -7.17013, 0, 1.5, 0.5, 0.5
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
-3.413014, -5.069508, -0.2720587, 0, -0.5, 0.5, 0.5,
-3.413014, -5.069508, -0.2720587, 1, -0.5, 0.5, 0.5,
-3.413014, -5.069508, -0.2720587, 1, 1.5, 0.5, 0.5,
-3.413014, -5.069508, -0.2720587, 0, 1.5, 0.5, 0.5
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
-2, -3.95556, -5.578268,
2, -3.95556, -5.578268,
-2, -3.95556, -5.578268,
-2, -4.141218, -5.843578,
-1, -3.95556, -5.578268,
-1, -4.141218, -5.843578,
0, -3.95556, -5.578268,
0, -4.141218, -5.843578,
1, -3.95556, -5.578268,
1, -4.141218, -5.843578,
2, -3.95556, -5.578268,
2, -4.141218, -5.843578
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
-2, -4.512534, -6.374199, 0, -0.5, 0.5, 0.5,
-2, -4.512534, -6.374199, 1, -0.5, 0.5, 0.5,
-2, -4.512534, -6.374199, 1, 1.5, 0.5, 0.5,
-2, -4.512534, -6.374199, 0, 1.5, 0.5, 0.5,
-1, -4.512534, -6.374199, 0, -0.5, 0.5, 0.5,
-1, -4.512534, -6.374199, 1, -0.5, 0.5, 0.5,
-1, -4.512534, -6.374199, 1, 1.5, 0.5, 0.5,
-1, -4.512534, -6.374199, 0, 1.5, 0.5, 0.5,
0, -4.512534, -6.374199, 0, -0.5, 0.5, 0.5,
0, -4.512534, -6.374199, 1, -0.5, 0.5, 0.5,
0, -4.512534, -6.374199, 1, 1.5, 0.5, 0.5,
0, -4.512534, -6.374199, 0, 1.5, 0.5, 0.5,
1, -4.512534, -6.374199, 0, -0.5, 0.5, 0.5,
1, -4.512534, -6.374199, 1, -0.5, 0.5, 0.5,
1, -4.512534, -6.374199, 1, 1.5, 0.5, 0.5,
1, -4.512534, -6.374199, 0, 1.5, 0.5, 0.5,
2, -4.512534, -6.374199, 0, -0.5, 0.5, 0.5,
2, -4.512534, -6.374199, 1, -0.5, 0.5, 0.5,
2, -4.512534, -6.374199, 1, 1.5, 0.5, 0.5,
2, -4.512534, -6.374199, 0, 1.5, 0.5, 0.5
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
-2.59043, -2, -5.578268,
-2.59043, 2, -5.578268,
-2.59043, -2, -5.578268,
-2.727527, -2, -5.843578,
-2.59043, 0, -5.578268,
-2.727527, 0, -5.843578,
-2.59043, 2, -5.578268,
-2.727527, 2, -5.843578
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
-3.001722, -2, -6.374199, 0, -0.5, 0.5, 0.5,
-3.001722, -2, -6.374199, 1, -0.5, 0.5, 0.5,
-3.001722, -2, -6.374199, 1, 1.5, 0.5, 0.5,
-3.001722, -2, -6.374199, 0, 1.5, 0.5, 0.5,
-3.001722, 0, -6.374199, 0, -0.5, 0.5, 0.5,
-3.001722, 0, -6.374199, 1, -0.5, 0.5, 0.5,
-3.001722, 0, -6.374199, 1, 1.5, 0.5, 0.5,
-3.001722, 0, -6.374199, 0, 1.5, 0.5, 0.5,
-3.001722, 2, -6.374199, 0, -0.5, 0.5, 0.5,
-3.001722, 2, -6.374199, 1, -0.5, 0.5, 0.5,
-3.001722, 2, -6.374199, 1, 1.5, 0.5, 0.5,
-3.001722, 2, -6.374199, 0, 1.5, 0.5, 0.5
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
-2.59043, -3.95556, -4,
-2.59043, -3.95556, 4,
-2.59043, -3.95556, -4,
-2.727527, -4.141218, -4,
-2.59043, -3.95556, -2,
-2.727527, -4.141218, -2,
-2.59043, -3.95556, 0,
-2.727527, -4.141218, 0,
-2.59043, -3.95556, 2,
-2.727527, -4.141218, 2,
-2.59043, -3.95556, 4,
-2.727527, -4.141218, 4
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
-3.001722, -4.512534, -4, 0, -0.5, 0.5, 0.5,
-3.001722, -4.512534, -4, 1, -0.5, 0.5, 0.5,
-3.001722, -4.512534, -4, 1, 1.5, 0.5, 0.5,
-3.001722, -4.512534, -4, 0, 1.5, 0.5, 0.5,
-3.001722, -4.512534, -2, 0, -0.5, 0.5, 0.5,
-3.001722, -4.512534, -2, 1, -0.5, 0.5, 0.5,
-3.001722, -4.512534, -2, 1, 1.5, 0.5, 0.5,
-3.001722, -4.512534, -2, 0, 1.5, 0.5, 0.5,
-3.001722, -4.512534, 0, 0, -0.5, 0.5, 0.5,
-3.001722, -4.512534, 0, 1, -0.5, 0.5, 0.5,
-3.001722, -4.512534, 0, 1, 1.5, 0.5, 0.5,
-3.001722, -4.512534, 0, 0, 1.5, 0.5, 0.5,
-3.001722, -4.512534, 2, 0, -0.5, 0.5, 0.5,
-3.001722, -4.512534, 2, 1, -0.5, 0.5, 0.5,
-3.001722, -4.512534, 2, 1, 1.5, 0.5, 0.5,
-3.001722, -4.512534, 2, 0, 1.5, 0.5, 0.5,
-3.001722, -4.512534, 4, 0, -0.5, 0.5, 0.5,
-3.001722, -4.512534, 4, 1, -0.5, 0.5, 0.5,
-3.001722, -4.512534, 4, 1, 1.5, 0.5, 0.5,
-3.001722, -4.512534, 4, 0, 1.5, 0.5, 0.5
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
-2.59043, -3.95556, -5.578268,
-2.59043, 3.470759, -5.578268,
-2.59043, -3.95556, 5.03415,
-2.59043, 3.470759, 5.03415,
-2.59043, -3.95556, -5.578268,
-2.59043, -3.95556, 5.03415,
-2.59043, 3.470759, -5.578268,
-2.59043, 3.470759, 5.03415,
-2.59043, -3.95556, -5.578268,
2.893464, -3.95556, -5.578268,
-2.59043, -3.95556, 5.03415,
2.893464, -3.95556, 5.03415,
-2.59043, 3.470759, -5.578268,
2.893464, 3.470759, -5.578268,
-2.59043, 3.470759, 5.03415,
2.893464, 3.470759, 5.03415,
2.893464, -3.95556, -5.578268,
2.893464, 3.470759, -5.578268,
2.893464, -3.95556, 5.03415,
2.893464, 3.470759, 5.03415,
2.893464, -3.95556, -5.578268,
2.893464, -3.95556, 5.03415,
2.893464, 3.470759, -5.578268,
2.893464, 3.470759, 5.03415
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
var radius = 7.510864;
var distance = 33.41668;
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
mvMatrix.translate( -0.151517, 0.2424004, 0.2720587 );
mvMatrix.scale( 1.480863, 1.093529, 0.7652255 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.41668);
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
metobromuron<-read.table("metobromuron.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-metobromuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'metobromuron' not found
```

```r
y<-metobromuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'metobromuron' not found
```

```r
z<-metobromuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'metobromuron' not found
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
-2.510567, 0.8811736, -2.421264, 0, 0, 1, 1, 1,
-2.500351, -0.1533913, -2.15132, 1, 0, 0, 1, 1,
-2.403604, -0.09012434, -1.351576, 1, 0, 0, 1, 1,
-2.355597, -2.321278, -1.987264, 1, 0, 0, 1, 1,
-2.342666, 1.899342, -0.8125601, 1, 0, 0, 1, 1,
-2.327902, 0.6246293, -2.393931, 1, 0, 0, 1, 1,
-2.314384, 0.3170364, -1.60819, 0, 0, 0, 1, 1,
-2.285788, -1.138212, -0.5512978, 0, 0, 0, 1, 1,
-2.271055, 2.066234, 0.7299466, 0, 0, 0, 1, 1,
-2.254606, -0.1301517, -2.04684, 0, 0, 0, 1, 1,
-2.1793, 1.257169, 1.413536, 0, 0, 0, 1, 1,
-2.150784, 0.7757041, -2.789589, 0, 0, 0, 1, 1,
-2.129968, -0.06722163, -2.554433, 0, 0, 0, 1, 1,
-2.128999, -1.624226, -2.086636, 1, 1, 1, 1, 1,
-2.127821, -1.001718, -1.480957, 1, 1, 1, 1, 1,
-2.122338, -0.3081271, -2.619801, 1, 1, 1, 1, 1,
-2.098796, 0.78746, -1.936137, 1, 1, 1, 1, 1,
-2.076538, -1.044146, -0.5486873, 1, 1, 1, 1, 1,
-2.060454, -0.9378232, -0.7686388, 1, 1, 1, 1, 1,
-2.052832, 1.627439, -2.037969, 1, 1, 1, 1, 1,
-2.043617, -0.7072396, 0.101071, 1, 1, 1, 1, 1,
-2.037916, 0.250517, -0.9921797, 1, 1, 1, 1, 1,
-2.02442, 1.287295, -1.316808, 1, 1, 1, 1, 1,
-2.01895, 1.650076, -1.281855, 1, 1, 1, 1, 1,
-2.015244, 1.125106, -1.977737, 1, 1, 1, 1, 1,
-1.989257, -0.9892273, -2.063532, 1, 1, 1, 1, 1,
-1.988183, -1.211089, -1.130353, 1, 1, 1, 1, 1,
-1.922082, 0.3615331, -1.40762, 1, 1, 1, 1, 1,
-1.921242, 0.2267275, -1.794465, 0, 0, 1, 1, 1,
-1.843565, 0.8240793, -1.550763, 1, 0, 0, 1, 1,
-1.830367, 0.8500821, -1.990539, 1, 0, 0, 1, 1,
-1.816503, -0.9259268, -2.102556, 1, 0, 0, 1, 1,
-1.78815, 0.3672294, -2.780671, 1, 0, 0, 1, 1,
-1.777569, 0.6999176, -0.9693562, 1, 0, 0, 1, 1,
-1.764037, -0.1787179, -0.9931867, 0, 0, 0, 1, 1,
-1.760694, 1.124704, -0.2226482, 0, 0, 0, 1, 1,
-1.745478, 0.5287107, -2.376787, 0, 0, 0, 1, 1,
-1.708036, -0.3174928, -2.531188, 0, 0, 0, 1, 1,
-1.704487, -0.4867308, -1.229581, 0, 0, 0, 1, 1,
-1.681713, -0.6023231, -1.965859, 0, 0, 0, 1, 1,
-1.676325, 0.2771262, -1.812399, 0, 0, 0, 1, 1,
-1.664096, -1.508085, -1.55131, 1, 1, 1, 1, 1,
-1.646437, -0.1292545, -2.01843, 1, 1, 1, 1, 1,
-1.639811, 2.715514, -0.9104857, 1, 1, 1, 1, 1,
-1.626791, 1.926175, -0.3914185, 1, 1, 1, 1, 1,
-1.625774, 1.892805, -0.7023478, 1, 1, 1, 1, 1,
-1.620828, 0.01612246, -3.117092, 1, 1, 1, 1, 1,
-1.620687, 0.1342991, -0.4650152, 1, 1, 1, 1, 1,
-1.61916, -0.1088462, -2.794893, 1, 1, 1, 1, 1,
-1.612225, -0.3267865, -0.8059391, 1, 1, 1, 1, 1,
-1.593373, -0.01536331, -0.9818341, 1, 1, 1, 1, 1,
-1.592234, 1.161846, -1.306903, 1, 1, 1, 1, 1,
-1.586596, 0.5427333, -1.648018, 1, 1, 1, 1, 1,
-1.584185, -1.737332, -2.59089, 1, 1, 1, 1, 1,
-1.583515, 1.164554, -1.113855, 1, 1, 1, 1, 1,
-1.564576, -0.7825862, -0.8002141, 1, 1, 1, 1, 1,
-1.558581, 0.390143, -0.6786664, 0, 0, 1, 1, 1,
-1.545991, -0.628893, -0.870476, 1, 0, 0, 1, 1,
-1.544902, -0.4102332, -2.96609, 1, 0, 0, 1, 1,
-1.543814, 0.7553216, -2.107552, 1, 0, 0, 1, 1,
-1.529423, -1.242511, -2.843162, 1, 0, 0, 1, 1,
-1.504848, 1.495191, 0.2465427, 1, 0, 0, 1, 1,
-1.504323, -0.5413577, -0.2946642, 0, 0, 0, 1, 1,
-1.495968, 0.2665573, -0.5425339, 0, 0, 0, 1, 1,
-1.483721, 2.280866, -2.621344, 0, 0, 0, 1, 1,
-1.477824, -2.340334, -4.154588, 0, 0, 0, 1, 1,
-1.477001, -0.5358251, 0.1662183, 0, 0, 0, 1, 1,
-1.46937, 0.4046491, -1.138702, 0, 0, 0, 1, 1,
-1.459946, -0.2456862, -2.655353, 0, 0, 0, 1, 1,
-1.456142, 1.955475, 0.1275467, 1, 1, 1, 1, 1,
-1.454956, -0.5439646, -2.917269, 1, 1, 1, 1, 1,
-1.409351, 1.388773, -0.128932, 1, 1, 1, 1, 1,
-1.40706, -1.113965, -2.948389, 1, 1, 1, 1, 1,
-1.395996, 0.3101695, -1.025612, 1, 1, 1, 1, 1,
-1.38422, -1.386144, -1.857486, 1, 1, 1, 1, 1,
-1.381477, 0.2800375, -0.5825557, 1, 1, 1, 1, 1,
-1.378914, -0.3949144, -1.60469, 1, 1, 1, 1, 1,
-1.372867, -0.003483494, -0.4259374, 1, 1, 1, 1, 1,
-1.370002, -0.3353373, -0.9129319, 1, 1, 1, 1, 1,
-1.369936, 1.994033, -1.759544, 1, 1, 1, 1, 1,
-1.367857, 0.3493199, -0.8234032, 1, 1, 1, 1, 1,
-1.357296, -0.1856761, -1.810738, 1, 1, 1, 1, 1,
-1.351765, 0.7910053, -1.222284, 1, 1, 1, 1, 1,
-1.35171, -0.6761068, -2.274682, 1, 1, 1, 1, 1,
-1.348466, -0.6450045, -0.1132935, 0, 0, 1, 1, 1,
-1.344414, -0.2187883, -0.4649893, 1, 0, 0, 1, 1,
-1.344292, -0.7758903, -0.6652882, 1, 0, 0, 1, 1,
-1.339908, -0.8938691, -1.839575, 1, 0, 0, 1, 1,
-1.33951, -0.1600539, -1.942295, 1, 0, 0, 1, 1,
-1.337688, 0.3647459, -1.079008, 1, 0, 0, 1, 1,
-1.336293, -0.4759958, -0.2316167, 0, 0, 0, 1, 1,
-1.33106, -0.8525472, -3.060123, 0, 0, 0, 1, 1,
-1.313665, 5.76653e-05, -1.348509, 0, 0, 0, 1, 1,
-1.312913, 2.239944, -0.04725903, 0, 0, 0, 1, 1,
-1.302667, 1.646172, -0.3210577, 0, 0, 0, 1, 1,
-1.302315, -1.438035, -1.870836, 0, 0, 0, 1, 1,
-1.299333, 1.457715, -0.634393, 0, 0, 0, 1, 1,
-1.297665, -1.244567, -3.10792, 1, 1, 1, 1, 1,
-1.287874, 1.369641, 0.2008921, 1, 1, 1, 1, 1,
-1.287869, 2.416872, 0.3556196, 1, 1, 1, 1, 1,
-1.280178, 0.07730123, -1.584879, 1, 1, 1, 1, 1,
-1.26814, -3.563159, -1.360924, 1, 1, 1, 1, 1,
-1.23778, 0.2520665, -0.214866, 1, 1, 1, 1, 1,
-1.235518, -0.8213363, -1.525089, 1, 1, 1, 1, 1,
-1.214832, -0.3691185, -2.279731, 1, 1, 1, 1, 1,
-1.211328, -0.1310016, -1.408404, 1, 1, 1, 1, 1,
-1.200608, 0.8197607, -2.978355, 1, 1, 1, 1, 1,
-1.182927, 2.981472, 0.07150631, 1, 1, 1, 1, 1,
-1.181872, 0.8155635, -1.51062, 1, 1, 1, 1, 1,
-1.173938, 0.9208621, -0.3443393, 1, 1, 1, 1, 1,
-1.165562, -0.124246, -3.022572, 1, 1, 1, 1, 1,
-1.163487, 1.543533, -3.004658, 1, 1, 1, 1, 1,
-1.156483, -0.2790119, -2.539783, 0, 0, 1, 1, 1,
-1.154499, -0.3223269, -3.199845, 1, 0, 0, 1, 1,
-1.149332, -0.6498276, -2.542415, 1, 0, 0, 1, 1,
-1.144862, 1.057506, -0.4408678, 1, 0, 0, 1, 1,
-1.139042, -2.182414, -1.553222, 1, 0, 0, 1, 1,
-1.126809, -0.5246381, -1.55049, 1, 0, 0, 1, 1,
-1.124696, 1.483586, -2.689745, 0, 0, 0, 1, 1,
-1.119843, -0.01095867, -2.031935, 0, 0, 0, 1, 1,
-1.116072, 2.370751, -1.085626, 0, 0, 0, 1, 1,
-1.108661, 0.001660346, -0.2516046, 0, 0, 0, 1, 1,
-1.102243, -1.389623, -3.69698, 0, 0, 0, 1, 1,
-1.100201, 0.7049398, 0.08606048, 0, 0, 0, 1, 1,
-1.092344, -0.3010151, -2.56535, 0, 0, 0, 1, 1,
-1.092271, 1.906977, 0.2031653, 1, 1, 1, 1, 1,
-1.085019, -2.08119, -3.259217, 1, 1, 1, 1, 1,
-1.084677, -1.126994, -1.296101, 1, 1, 1, 1, 1,
-1.083874, -0.8179442, -2.285926, 1, 1, 1, 1, 1,
-1.08204, 0.3017009, 0.4249047, 1, 1, 1, 1, 1,
-1.073233, -0.6130387, -3.895514, 1, 1, 1, 1, 1,
-1.071429, 0.6799974, -1.926986, 1, 1, 1, 1, 1,
-1.065218, 1.028724, -2.26679, 1, 1, 1, 1, 1,
-1.064822, -1.472188, -3.675931, 1, 1, 1, 1, 1,
-1.062567, -1.70249, -2.179666, 1, 1, 1, 1, 1,
-1.060198, -0.6260188, -3.577361, 1, 1, 1, 1, 1,
-1.056937, 2.088655, -0.8115064, 1, 1, 1, 1, 1,
-1.048546, 0.4533587, -1.626973, 1, 1, 1, 1, 1,
-1.044401, 0.8539237, -1.521696, 1, 1, 1, 1, 1,
-1.042879, 1.327016, 0.5230948, 1, 1, 1, 1, 1,
-1.040815, -0.07978347, -1.523941, 0, 0, 1, 1, 1,
-1.035424, 0.08627335, -1.328791, 1, 0, 0, 1, 1,
-1.034413, 0.3483769, -2.810732, 1, 0, 0, 1, 1,
-1.026121, 0.3112994, -1.389562, 1, 0, 0, 1, 1,
-1.01744, 0.7865134, -0.2672628, 1, 0, 0, 1, 1,
-1.017344, 0.6737073, -1.920957, 1, 0, 0, 1, 1,
-1.016165, 1.074566, -1.268543, 0, 0, 0, 1, 1,
-1.014327, 0.07178119, -2.137771, 0, 0, 0, 1, 1,
-1.004999, 0.3356923, -1.531858, 0, 0, 0, 1, 1,
-1.002593, 0.2785885, 0.5755758, 0, 0, 0, 1, 1,
-0.9934627, 1.536523, 1.167079, 0, 0, 0, 1, 1,
-0.9923083, -0.199376, -1.614103, 0, 0, 0, 1, 1,
-0.9896195, -1.554385, -3.052659, 0, 0, 0, 1, 1,
-0.9888611, -0.191612, -2.662376, 1, 1, 1, 1, 1,
-0.9882008, 0.2821779, -1.414743, 1, 1, 1, 1, 1,
-0.9871666, 0.03125698, -2.162087, 1, 1, 1, 1, 1,
-0.9777514, -0.5375578, -2.155006, 1, 1, 1, 1, 1,
-0.9768864, -0.4767085, -0.1615706, 1, 1, 1, 1, 1,
-0.9761917, -0.3133696, -1.529241, 1, 1, 1, 1, 1,
-0.9709395, 0.2222681, -1.411566, 1, 1, 1, 1, 1,
-0.9658797, 1.184252, 0.1305838, 1, 1, 1, 1, 1,
-0.961178, -0.9829569, -2.066733, 1, 1, 1, 1, 1,
-0.9558378, 1.405657, -0.6677582, 1, 1, 1, 1, 1,
-0.9555161, -0.683615, -0.7173151, 1, 1, 1, 1, 1,
-0.9550235, -0.02134086, -2.701574, 1, 1, 1, 1, 1,
-0.946191, -0.5196115, -1.107334, 1, 1, 1, 1, 1,
-0.9387655, -0.7722907, -2.660752, 1, 1, 1, 1, 1,
-0.9357548, -0.1680882, -0.8442048, 1, 1, 1, 1, 1,
-0.9334984, -0.2378318, -2.123226, 0, 0, 1, 1, 1,
-0.9270759, -1.238972, -2.466884, 1, 0, 0, 1, 1,
-0.9225725, 1.022198, -0.2630445, 1, 0, 0, 1, 1,
-0.9124498, -0.1608222, -0.2284291, 1, 0, 0, 1, 1,
-0.9035883, 0.3366618, -0.92329, 1, 0, 0, 1, 1,
-0.8950188, -0.3084093, -0.4788667, 1, 0, 0, 1, 1,
-0.8944805, 0.861342, -0.6814212, 0, 0, 0, 1, 1,
-0.8931124, 0.6411145, -0.3944406, 0, 0, 0, 1, 1,
-0.8919201, -1.055727, -3.619806, 0, 0, 0, 1, 1,
-0.8775634, -0.1178853, -1.565311, 0, 0, 0, 1, 1,
-0.8723982, -1.640434, -2.783645, 0, 0, 0, 1, 1,
-0.8668005, -0.7730755, -1.994226, 0, 0, 0, 1, 1,
-0.8643212, 0.5735601, -0.2028427, 0, 0, 0, 1, 1,
-0.8609998, -0.2696718, -2.343969, 1, 1, 1, 1, 1,
-0.8598959, 0.5753623, -2.609457, 1, 1, 1, 1, 1,
-0.8537687, -1.078784, -1.239086, 1, 1, 1, 1, 1,
-0.853025, 0.3021899, -1.646769, 1, 1, 1, 1, 1,
-0.8515449, 0.6713021, -2.348401, 1, 1, 1, 1, 1,
-0.8500207, 0.9385689, -0.8180966, 1, 1, 1, 1, 1,
-0.8468929, 0.01690016, -0.5311701, 1, 1, 1, 1, 1,
-0.8465722, 0.6971772, -1.389799, 1, 1, 1, 1, 1,
-0.8422075, 1.328051, -1.438133, 1, 1, 1, 1, 1,
-0.8394247, -1.275104, -3.069871, 1, 1, 1, 1, 1,
-0.8369505, -0.4514864, -1.963722, 1, 1, 1, 1, 1,
-0.8352129, -0.9300686, -4.223814, 1, 1, 1, 1, 1,
-0.8347444, 1.331544, 0.2236339, 1, 1, 1, 1, 1,
-0.8298826, -0.5332087, -1.337383, 1, 1, 1, 1, 1,
-0.81968, -0.1895608, -1.854357, 1, 1, 1, 1, 1,
-0.8184091, 0.4907491, 0.6301203, 0, 0, 1, 1, 1,
-0.8145094, -0.8807474, -1.872967, 1, 0, 0, 1, 1,
-0.8064032, 0.02680708, -2.530309, 1, 0, 0, 1, 1,
-0.8053017, 0.7841719, -0.8679317, 1, 0, 0, 1, 1,
-0.8005389, 0.1038052, -2.160958, 1, 0, 0, 1, 1,
-0.7973107, -0.1871635, -1.824268, 1, 0, 0, 1, 1,
-0.7965189, -0.3065394, -1.379761, 0, 0, 0, 1, 1,
-0.7935284, -1.265033, -3.755265, 0, 0, 0, 1, 1,
-0.7919074, -1.581861, -3.405106, 0, 0, 0, 1, 1,
-0.7866254, -1.832242, -1.529338, 0, 0, 0, 1, 1,
-0.7854787, 1.223396, -1.847243, 0, 0, 0, 1, 1,
-0.7805822, 1.02483, -0.4664209, 0, 0, 0, 1, 1,
-0.7770093, -1.603403, -2.737865, 0, 0, 0, 1, 1,
-0.7740032, -0.8002689, -3.890792, 1, 1, 1, 1, 1,
-0.773027, -0.2832851, 0.2392464, 1, 1, 1, 1, 1,
-0.772557, 0.2756003, 1.42117, 1, 1, 1, 1, 1,
-0.7703023, -0.9612704, -1.599146, 1, 1, 1, 1, 1,
-0.7652959, -0.659508, -1.933923, 1, 1, 1, 1, 1,
-0.7631748, 0.5603921, -1.312537, 1, 1, 1, 1, 1,
-0.7557178, 0.8173124, -1.44613, 1, 1, 1, 1, 1,
-0.7537482, -0.9850345, -2.374745, 1, 1, 1, 1, 1,
-0.7515358, -1.351992, -4.049225, 1, 1, 1, 1, 1,
-0.7486184, 0.2012727, -0.7459534, 1, 1, 1, 1, 1,
-0.7451698, -0.8526571, -2.369625, 1, 1, 1, 1, 1,
-0.7401711, -0.07676176, -0.9471835, 1, 1, 1, 1, 1,
-0.7383376, 1.037573, -0.936218, 1, 1, 1, 1, 1,
-0.7378109, 0.4578578, -2.962635, 1, 1, 1, 1, 1,
-0.737762, 0.1350672, -0.8501191, 1, 1, 1, 1, 1,
-0.7355851, 1.437792, -0.5091632, 0, 0, 1, 1, 1,
-0.7281088, -0.4963288, -1.733431, 1, 0, 0, 1, 1,
-0.7188133, -1.767553, -3.972688, 1, 0, 0, 1, 1,
-0.7183119, -0.2553711, -2.047479, 1, 0, 0, 1, 1,
-0.7108532, 2.784819, -1.333787, 1, 0, 0, 1, 1,
-0.7100186, -1.465183, -0.0362409, 1, 0, 0, 1, 1,
-0.7081802, 0.7286046, -0.812402, 0, 0, 0, 1, 1,
-0.7057971, -0.2881362, -0.1264289, 0, 0, 0, 1, 1,
-0.6989101, 0.8557371, -0.8363279, 0, 0, 0, 1, 1,
-0.6972727, -0.5343083, -1.962504, 0, 0, 0, 1, 1,
-0.6940069, 0.1850667, -1.299645, 0, 0, 0, 1, 1,
-0.6924549, -0.09627627, -0.3321268, 0, 0, 0, 1, 1,
-0.6821739, 0.8742754, -0.06978765, 0, 0, 0, 1, 1,
-0.6806338, -2.39342, -2.431658, 1, 1, 1, 1, 1,
-0.6647758, -0.03356726, -0.6386293, 1, 1, 1, 1, 1,
-0.6596513, -0.8649338, -2.692356, 1, 1, 1, 1, 1,
-0.6548218, -0.4188923, -0.08027042, 1, 1, 1, 1, 1,
-0.6508161, 1.187545, 0.3831289, 1, 1, 1, 1, 1,
-0.6433737, -0.930512, -4.226478, 1, 1, 1, 1, 1,
-0.641528, -0.1498365, -1.880945, 1, 1, 1, 1, 1,
-0.6378997, -1.460147, -2.363674, 1, 1, 1, 1, 1,
-0.635538, 0.5919486, 0.385811, 1, 1, 1, 1, 1,
-0.6277872, 0.5705258, -2.828479, 1, 1, 1, 1, 1,
-0.6260818, 0.6303781, -1.928657, 1, 1, 1, 1, 1,
-0.6252843, 0.05286565, -0.6556129, 1, 1, 1, 1, 1,
-0.6217458, 1.012968, -1.065327, 1, 1, 1, 1, 1,
-0.6206454, -0.6376272, -3.202964, 1, 1, 1, 1, 1,
-0.618501, -0.07875244, 0.338903, 1, 1, 1, 1, 1,
-0.6134863, -0.1060753, -1.261016, 0, 0, 1, 1, 1,
-0.6121157, 1.131148, -0.9428418, 1, 0, 0, 1, 1,
-0.6094305, 1.112952, -0.6888557, 1, 0, 0, 1, 1,
-0.6053545, -0.3284979, -2.652389, 1, 0, 0, 1, 1,
-0.6053509, -0.9207228, -1.251435, 1, 0, 0, 1, 1,
-0.6035969, 1.510792, 0.3577582, 1, 0, 0, 1, 1,
-0.603018, 2.293104, -1.049173, 0, 0, 0, 1, 1,
-0.6021813, 0.0500999, -2.075995, 0, 0, 0, 1, 1,
-0.6020484, 1.008806, -1.754834, 0, 0, 0, 1, 1,
-0.6009126, -0.3572031, -1.745967, 0, 0, 0, 1, 1,
-0.600392, -2.393129, -4.284686, 0, 0, 0, 1, 1,
-0.5958822, 1.192945, -0.3054805, 0, 0, 0, 1, 1,
-0.5955749, 0.527386, -0.2697584, 0, 0, 0, 1, 1,
-0.5928943, -1.308003, -2.76975, 1, 1, 1, 1, 1,
-0.5841331, 0.52585, -1.507881, 1, 1, 1, 1, 1,
-0.5835164, 1.216122, 0.08159897, 1, 1, 1, 1, 1,
-0.5824065, -0.5858413, -2.499283, 1, 1, 1, 1, 1,
-0.5812896, -0.6926402, -3.784762, 1, 1, 1, 1, 1,
-0.5802284, 0.804527, -1.099691, 1, 1, 1, 1, 1,
-0.5771412, -0.9584739, -2.201224, 1, 1, 1, 1, 1,
-0.5763052, 0.5968972, -0.7543963, 1, 1, 1, 1, 1,
-0.5757167, 0.02781529, 0.6571097, 1, 1, 1, 1, 1,
-0.5711547, 1.004989, -0.7108902, 1, 1, 1, 1, 1,
-0.5684441, 0.6737508, -2.94182, 1, 1, 1, 1, 1,
-0.5646727, 0.7738934, 0.5423123, 1, 1, 1, 1, 1,
-0.5634511, -0.6444475, -3.552448, 1, 1, 1, 1, 1,
-0.5618994, -0.2496154, -2.687203, 1, 1, 1, 1, 1,
-0.5604526, 0.6076113, -0.1787642, 1, 1, 1, 1, 1,
-0.5554833, 0.8644026, -0.3147732, 0, 0, 1, 1, 1,
-0.5544001, -0.9655116, -2.965411, 1, 0, 0, 1, 1,
-0.5530773, -1.094561, -3.34508, 1, 0, 0, 1, 1,
-0.5515737, 0.2392438, -1.665038, 1, 0, 0, 1, 1,
-0.5503331, -0.74229, -2.998426, 1, 0, 0, 1, 1,
-0.5498987, 0.09970129, -3.018595, 1, 0, 0, 1, 1,
-0.5495375, -0.6077738, -2.360221, 0, 0, 0, 1, 1,
-0.5476618, 0.860286, -1.244492, 0, 0, 0, 1, 1,
-0.5435226, 1.296247, -1.474095, 0, 0, 0, 1, 1,
-0.5421916, -0.7112624, -2.40678, 0, 0, 0, 1, 1,
-0.5388703, -1.493061, -4.715705, 0, 0, 0, 1, 1,
-0.5384232, 1.438836, -0.4801109, 0, 0, 0, 1, 1,
-0.5353128, -0.2463074, -1.193368, 0, 0, 0, 1, 1,
-0.5334171, -0.4597634, -2.683473, 1, 1, 1, 1, 1,
-0.5314283, 0.3034458, -1.074781, 1, 1, 1, 1, 1,
-0.5297508, 0.701145, 1.118156, 1, 1, 1, 1, 1,
-0.5291481, 0.108093, -0.606416, 1, 1, 1, 1, 1,
-0.5282335, -0.4589911, -2.396423, 1, 1, 1, 1, 1,
-0.5278382, 0.004713952, -1.523593, 1, 1, 1, 1, 1,
-0.5113433, -0.9465095, -1.239054, 1, 1, 1, 1, 1,
-0.5111049, -0.8268858, -1.990324, 1, 1, 1, 1, 1,
-0.5109825, -1.163999, -4.162258, 1, 1, 1, 1, 1,
-0.5076227, 0.4388166, -0.2942365, 1, 1, 1, 1, 1,
-0.504087, -1.058655, -2.982623, 1, 1, 1, 1, 1,
-0.5034199, -2.305868, -1.375035, 1, 1, 1, 1, 1,
-0.5015479, -0.5116546, -1.25766, 1, 1, 1, 1, 1,
-0.4991656, 1.022848, 0.2017976, 1, 1, 1, 1, 1,
-0.4928176, -1.159673, -3.574262, 1, 1, 1, 1, 1,
-0.4877565, -0.3272497, -1.853357, 0, 0, 1, 1, 1,
-0.486674, 0.3960809, -0.6829731, 1, 0, 0, 1, 1,
-0.4793632, -0.8697792, -3.383029, 1, 0, 0, 1, 1,
-0.4705085, 1.742974, -1.084122, 1, 0, 0, 1, 1,
-0.4697954, -1.925294, -3.718749, 1, 0, 0, 1, 1,
-0.4557148, 0.1562487, -1.015229, 1, 0, 0, 1, 1,
-0.4553461, -0.1308674, -3.360965, 0, 0, 0, 1, 1,
-0.453717, -0.8465031, -2.490176, 0, 0, 0, 1, 1,
-0.4455728, 0.2425056, -3.108614, 0, 0, 0, 1, 1,
-0.4430686, 0.7943558, -2.347662, 0, 0, 0, 1, 1,
-0.4410089, 1.021751, 1.873181, 0, 0, 0, 1, 1,
-0.4379186, 0.5000504, -0.184236, 0, 0, 0, 1, 1,
-0.4342695, -0.9042327, -2.670911, 0, 0, 0, 1, 1,
-0.4324878, -0.1149142, 0.4972096, 1, 1, 1, 1, 1,
-0.4315763, 0.4633496, -1.235729, 1, 1, 1, 1, 1,
-0.4188614, 0.1653079, -1.635586, 1, 1, 1, 1, 1,
-0.418833, 0.4026809, -0.9183925, 1, 1, 1, 1, 1,
-0.4135191, -0.7200161, -0.3094515, 1, 1, 1, 1, 1,
-0.4131918, -0.7685477, -1.882354, 1, 1, 1, 1, 1,
-0.4116346, 0.01180767, -0.2284287, 1, 1, 1, 1, 1,
-0.4099623, 1.160129, -1.674379, 1, 1, 1, 1, 1,
-0.4030809, 0.04872323, -1.589637, 1, 1, 1, 1, 1,
-0.3977957, -0.8107061, -3.024318, 1, 1, 1, 1, 1,
-0.3934013, 0.5449027, 1.599469, 1, 1, 1, 1, 1,
-0.3909032, -0.08598179, -1.987417, 1, 1, 1, 1, 1,
-0.384516, -0.3276261, -3.094206, 1, 1, 1, 1, 1,
-0.383016, -0.09783931, -1.691105, 1, 1, 1, 1, 1,
-0.3823579, -0.001782175, -3.270283, 1, 1, 1, 1, 1,
-0.3816675, -1.379989, -4.246265, 0, 0, 1, 1, 1,
-0.3814687, -0.965367, -0.6819583, 1, 0, 0, 1, 1,
-0.3795628, 0.2006863, 0.8670372, 1, 0, 0, 1, 1,
-0.3764142, 0.8952804, 0.7161551, 1, 0, 0, 1, 1,
-0.375688, 0.1446064, -1.231446, 1, 0, 0, 1, 1,
-0.3756601, -0.1601759, -0.09033381, 1, 0, 0, 1, 1,
-0.3729639, 0.7775398, 0.02404417, 0, 0, 0, 1, 1,
-0.369287, -0.2022907, -1.928254, 0, 0, 0, 1, 1,
-0.3689342, -0.1935382, -2.792697, 0, 0, 0, 1, 1,
-0.3683403, -0.541358, -2.931538, 0, 0, 0, 1, 1,
-0.3618889, -1.584042, -2.701927, 0, 0, 0, 1, 1,
-0.3599968, -0.7098425, -3.231729, 0, 0, 0, 1, 1,
-0.3599955, 1.180714, -0.8705303, 0, 0, 0, 1, 1,
-0.3579831, -1.463713, -4.2292, 1, 1, 1, 1, 1,
-0.3560262, 0.06675988, -2.278801, 1, 1, 1, 1, 1,
-0.3544523, -2.042936, -3.654012, 1, 1, 1, 1, 1,
-0.3529542, -1.671117, -4.732227, 1, 1, 1, 1, 1,
-0.3517262, -0.3968421, 0.8495377, 1, 1, 1, 1, 1,
-0.3481063, 0.03154051, -0.4126158, 1, 1, 1, 1, 1,
-0.3458647, -0.2838228, -2.272898, 1, 1, 1, 1, 1,
-0.3448926, 0.1238567, -0.2991214, 1, 1, 1, 1, 1,
-0.3431039, 0.0380062, -1.047085, 1, 1, 1, 1, 1,
-0.3402044, 1.357953, -1.027393, 1, 1, 1, 1, 1,
-0.3288297, -1.566929, -4.975906, 1, 1, 1, 1, 1,
-0.3277491, -0.1549435, -1.544312, 1, 1, 1, 1, 1,
-0.3274846, -0.7175093, -3.424747, 1, 1, 1, 1, 1,
-0.3227545, -0.5848621, -4.641198, 1, 1, 1, 1, 1,
-0.3179244, -1.660571, -2.669957, 1, 1, 1, 1, 1,
-0.3169206, 0.2073095, -0.7142336, 0, 0, 1, 1, 1,
-0.3159932, -0.2832171, -2.814878, 1, 0, 0, 1, 1,
-0.3155475, -0.1012143, -2.646075, 1, 0, 0, 1, 1,
-0.313818, -0.189314, -0.4646813, 1, 0, 0, 1, 1,
-0.30884, -1.225751, -3.783386, 1, 0, 0, 1, 1,
-0.3063912, 1.247767, -1.557276, 1, 0, 0, 1, 1,
-0.3056976, 0.226397, -0.5052549, 0, 0, 0, 1, 1,
-0.3050021, 0.8714265, -0.06602135, 0, 0, 0, 1, 1,
-0.3002609, -2.515979, -2.167497, 0, 0, 0, 1, 1,
-0.2998787, -0.2526696, -2.545622, 0, 0, 0, 1, 1,
-0.299029, 1.186545, -0.5093661, 0, 0, 0, 1, 1,
-0.2960357, -0.875178, -0.79978, 0, 0, 0, 1, 1,
-0.2915055, 0.07251515, -1.128544, 0, 0, 0, 1, 1,
-0.2900438, -0.5980536, -3.9093, 1, 1, 1, 1, 1,
-0.2880361, 0.9966227, 0.8386462, 1, 1, 1, 1, 1,
-0.2825006, 0.7923065, -1.470739, 1, 1, 1, 1, 1,
-0.2735274, 0.2164288, -2.705026, 1, 1, 1, 1, 1,
-0.2720759, -0.320834, -1.232785, 1, 1, 1, 1, 1,
-0.2718093, 0.6663964, -0.9131452, 1, 1, 1, 1, 1,
-0.2697296, 0.7681964, -0.5740083, 1, 1, 1, 1, 1,
-0.2677518, -1.910683, -2.073512, 1, 1, 1, 1, 1,
-0.2670839, -0.2091534, -1.580606, 1, 1, 1, 1, 1,
-0.2617611, -0.4130234, -3.099298, 1, 1, 1, 1, 1,
-0.2615975, 0.06099214, -2.031316, 1, 1, 1, 1, 1,
-0.2612594, -0.6779824, -3.355069, 1, 1, 1, 1, 1,
-0.2539659, 1.31096, -0.3971127, 1, 1, 1, 1, 1,
-0.2536079, 1.164297, -1.013626, 1, 1, 1, 1, 1,
-0.2513129, 0.5147839, -0.2336223, 1, 1, 1, 1, 1,
-0.2478096, -0.6439951, -2.960386, 0, 0, 1, 1, 1,
-0.2377994, -0.692461, -2.601261, 1, 0, 0, 1, 1,
-0.2376021, -0.4069951, -2.228504, 1, 0, 0, 1, 1,
-0.2323117, 0.6461393, -2.108134, 1, 0, 0, 1, 1,
-0.2321652, 2.434597, 1.173628, 1, 0, 0, 1, 1,
-0.2315897, -1.165604, -2.766207, 1, 0, 0, 1, 1,
-0.2247914, -0.7911651, -3.169871, 0, 0, 0, 1, 1,
-0.2245706, -0.728134, -2.779397, 0, 0, 0, 1, 1,
-0.2182229, 0.7054746, 0.6383951, 0, 0, 0, 1, 1,
-0.2170469, -0.3225128, -1.625133, 0, 0, 0, 1, 1,
-0.2073153, 0.8987206, -1.055374, 0, 0, 0, 1, 1,
-0.1982937, -1.457907, -3.429589, 0, 0, 0, 1, 1,
-0.1965477, -1.398245, -2.07754, 0, 0, 0, 1, 1,
-0.1962337, 0.5051448, -0.3497668, 1, 1, 1, 1, 1,
-0.1959862, -0.05677668, -1.73408, 1, 1, 1, 1, 1,
-0.1945427, 1.17821, 0.7149582, 1, 1, 1, 1, 1,
-0.1894282, -0.3633122, -1.569728, 1, 1, 1, 1, 1,
-0.1827373, -1.819474, -4.605714, 1, 1, 1, 1, 1,
-0.1801202, -0.7224041, -2.906321, 1, 1, 1, 1, 1,
-0.179006, 1.00954, -0.5583169, 1, 1, 1, 1, 1,
-0.166028, 0.661184, -0.769749, 1, 1, 1, 1, 1,
-0.1591529, -0.9559187, -2.762582, 1, 1, 1, 1, 1,
-0.1566887, 0.2751588, -0.8214629, 1, 1, 1, 1, 1,
-0.1510392, -0.1331809, -4.169307, 1, 1, 1, 1, 1,
-0.1494293, -0.2288598, -2.920042, 1, 1, 1, 1, 1,
-0.1439827, 0.9358835, -0.019665, 1, 1, 1, 1, 1,
-0.1436207, 0.8687509, 0.130012, 1, 1, 1, 1, 1,
-0.1407467, -0.3321708, -3.105261, 1, 1, 1, 1, 1,
-0.1394362, 0.005759621, -4.302496, 0, 0, 1, 1, 1,
-0.1388423, 1.243487, -1.741637, 1, 0, 0, 1, 1,
-0.1366365, -0.153691, -2.449409, 1, 0, 0, 1, 1,
-0.1341531, 0.5368315, -1.087709, 1, 0, 0, 1, 1,
-0.1290943, 0.3225902, 0.2688981, 1, 0, 0, 1, 1,
-0.1287805, -0.5093354, -1.19697, 1, 0, 0, 1, 1,
-0.1280293, 0.7335703, -0.6599486, 0, 0, 0, 1, 1,
-0.1255871, 0.9288826, 0.7168101, 0, 0, 0, 1, 1,
-0.1247794, 0.9949888, -0.005748529, 0, 0, 0, 1, 1,
-0.1223162, -1.040692, -3.77148, 0, 0, 0, 1, 1,
-0.1198266, 1.999852, -0.6107964, 0, 0, 0, 1, 1,
-0.1167999, 1.313707, 2.198055, 0, 0, 0, 1, 1,
-0.1160684, -1.182958, -4.000501, 0, 0, 0, 1, 1,
-0.1157421, -0.993861, -1.798404, 1, 1, 1, 1, 1,
-0.1133494, 2.012831, -0.1607866, 1, 1, 1, 1, 1,
-0.1118064, -0.7399758, -4.220436, 1, 1, 1, 1, 1,
-0.1040417, 0.9167719, -2.329436, 1, 1, 1, 1, 1,
-0.09817448, -0.24996, -2.870058, 1, 1, 1, 1, 1,
-0.09735725, 1.338849, 0.3643565, 1, 1, 1, 1, 1,
-0.09620239, -0.2815414, -2.177108, 1, 1, 1, 1, 1,
-0.0945323, -1.743167, -4.313478, 1, 1, 1, 1, 1,
-0.0900786, -1.899632, -3.469823, 1, 1, 1, 1, 1,
-0.08774941, 1.429063, -1.290211, 1, 1, 1, 1, 1,
-0.0875724, -0.2563462, -2.832192, 1, 1, 1, 1, 1,
-0.08620995, 1.374707, 0.5968555, 1, 1, 1, 1, 1,
-0.08501811, -0.8553351, -1.72355, 1, 1, 1, 1, 1,
-0.08385294, 0.008986882, -0.2663224, 1, 1, 1, 1, 1,
-0.0820883, -0.2686288, -3.091795, 1, 1, 1, 1, 1,
-0.08081064, -0.1189246, -2.503658, 0, 0, 1, 1, 1,
-0.07945697, -0.6283035, -1.51611, 1, 0, 0, 1, 1,
-0.0730469, 1.190076, 0.7373759, 1, 0, 0, 1, 1,
-0.07276494, 1.540012, 0.0417536, 1, 0, 0, 1, 1,
-0.07213553, -0.3938544, -4.754951, 1, 0, 0, 1, 1,
-0.071385, 0.7613101, -1.829843, 1, 0, 0, 1, 1,
-0.07125711, -0.8160402, -5.423718, 0, 0, 0, 1, 1,
-0.06196613, -0.1778647, -2.41735, 0, 0, 0, 1, 1,
-0.05943853, 0.5139256, 0.316197, 0, 0, 0, 1, 1,
-0.05888015, -0.3301243, -2.85423, 0, 0, 0, 1, 1,
-0.05850409, 1.734902, -0.7529701, 0, 0, 0, 1, 1,
-0.05773617, -1.084895, -2.039951, 0, 0, 0, 1, 1,
-0.05420164, -0.07611435, -0.05378462, 0, 0, 0, 1, 1,
-0.05382096, -0.00507539, -2.302399, 1, 1, 1, 1, 1,
-0.0511756, -0.4945769, -3.464994, 1, 1, 1, 1, 1,
-0.03909798, -1.058909, -2.767571, 1, 1, 1, 1, 1,
-0.03896872, -0.6132051, -2.301125, 1, 1, 1, 1, 1,
-0.03805763, 1.301583, 0.2126572, 1, 1, 1, 1, 1,
-0.03490638, -0.7772347, -2.804858, 1, 1, 1, 1, 1,
-0.02199294, -0.8522928, -3.958996, 1, 1, 1, 1, 1,
-0.02031952, -0.5265068, -1.875981, 1, 1, 1, 1, 1,
-0.01973403, -0.2710327, -1.697389, 1, 1, 1, 1, 1,
-0.01962886, -0.4436127, -2.389414, 1, 1, 1, 1, 1,
-0.01891338, 0.4405935, -0.3063705, 1, 1, 1, 1, 1,
-0.01661012, 0.36676, 0.8430561, 1, 1, 1, 1, 1,
-0.01503024, 0.8369605, -0.7588076, 1, 1, 1, 1, 1,
-0.004149624, 1.47973, -0.5609643, 1, 1, 1, 1, 1,
-0.003086761, -0.3112704, -1.861212, 1, 1, 1, 1, 1,
0.0006015295, -1.950516, 3.252651, 0, 0, 1, 1, 1,
0.001409162, 0.02470197, -0.2454883, 1, 0, 0, 1, 1,
0.004874753, -0.8893116, 4.315876, 1, 0, 0, 1, 1,
0.005558665, -0.1357539, 3.169952, 1, 0, 0, 1, 1,
0.00663762, 0.05729195, 0.3991029, 1, 0, 0, 1, 1,
0.008585963, -0.8175166, 3.586016, 1, 0, 0, 1, 1,
0.008953635, -0.8563197, 3.763601, 0, 0, 0, 1, 1,
0.01037144, 0.4924783, 2.731737, 0, 0, 0, 1, 1,
0.01631389, 0.5903171, -1.541318, 0, 0, 0, 1, 1,
0.01818844, 2.018656, 0.1218588, 0, 0, 0, 1, 1,
0.02673696, -0.7377202, 2.411704, 0, 0, 0, 1, 1,
0.02956619, -0.1254584, 1.901183, 0, 0, 0, 1, 1,
0.03014372, 1.524451, -0.664566, 0, 0, 0, 1, 1,
0.03801969, -0.3655402, 2.007557, 1, 1, 1, 1, 1,
0.0380897, 0.08735919, 0.1293764, 1, 1, 1, 1, 1,
0.04071162, 0.9165093, 1.902698, 1, 1, 1, 1, 1,
0.04113877, 0.9813743, 0.8672313, 1, 1, 1, 1, 1,
0.04318165, 1.174607, -0.1640224, 1, 1, 1, 1, 1,
0.04819943, 0.05934761, 0.2051443, 1, 1, 1, 1, 1,
0.05614523, 1.573452, 0.1552861, 1, 1, 1, 1, 1,
0.0587369, 0.4854194, 1.331752, 1, 1, 1, 1, 1,
0.05965346, -0.06841515, 3.168932, 1, 1, 1, 1, 1,
0.06072729, -2.086802, 3.641037, 1, 1, 1, 1, 1,
0.06479294, 0.1634618, -1.101933, 1, 1, 1, 1, 1,
0.06684047, -0.5810627, 4.69568, 1, 1, 1, 1, 1,
0.07147134, -0.3859234, 2.517582, 1, 1, 1, 1, 1,
0.07434378, 0.8705851, 0.7065037, 1, 1, 1, 1, 1,
0.07437256, 0.153989, 0.4685101, 1, 1, 1, 1, 1,
0.07625983, 3.052412, 0.5571086, 0, 0, 1, 1, 1,
0.0762959, -1.708051, 3.696761, 1, 0, 0, 1, 1,
0.07844502, 0.9033585, -0.5556836, 1, 0, 0, 1, 1,
0.07887883, -1.109056, 1.850136, 1, 0, 0, 1, 1,
0.07894206, 0.6404095, 0.781723, 1, 0, 0, 1, 1,
0.08309589, -0.01152614, 0.6997833, 1, 0, 0, 1, 1,
0.08611232, 0.1000694, 1.042142, 0, 0, 0, 1, 1,
0.09013279, 0.5042769, -0.7477543, 0, 0, 0, 1, 1,
0.09230624, 1.106861, -1.455451, 0, 0, 0, 1, 1,
0.093303, -3.84741, 2.647638, 0, 0, 0, 1, 1,
0.09538178, -1.088828, 2.075175, 0, 0, 0, 1, 1,
0.09655691, 1.355935, 1.242694, 0, 0, 0, 1, 1,
0.09729536, -0.1532385, 4.13103, 0, 0, 0, 1, 1,
0.1000549, -0.7543332, 2.039992, 1, 1, 1, 1, 1,
0.1011599, 0.9321738, -0.3966023, 1, 1, 1, 1, 1,
0.1058258, 0.002276315, 3.54668, 1, 1, 1, 1, 1,
0.1077712, 1.306551, 0.9050602, 1, 1, 1, 1, 1,
0.1082581, -1.892415, 2.935206, 1, 1, 1, 1, 1,
0.1123033, -0.7015173, 3.438701, 1, 1, 1, 1, 1,
0.1137004, 1.251368, 0.01554768, 1, 1, 1, 1, 1,
0.1149534, 1.794494, -0.6374056, 1, 1, 1, 1, 1,
0.1195016, 0.2588142, 0.3003736, 1, 1, 1, 1, 1,
0.1208933, -1.733554, 2.464319, 1, 1, 1, 1, 1,
0.1261274, -0.1264297, 2.081253, 1, 1, 1, 1, 1,
0.1366899, 0.3883605, -0.8573588, 1, 1, 1, 1, 1,
0.138347, 0.8081019, 1.89902, 1, 1, 1, 1, 1,
0.1384496, 1.251132, -1.288476, 1, 1, 1, 1, 1,
0.1391754, 0.5170602, 1.579919, 1, 1, 1, 1, 1,
0.1402473, -0.6627126, 1.423762, 0, 0, 1, 1, 1,
0.1418822, -1.287606, 3.700774, 1, 0, 0, 1, 1,
0.1423772, 1.122615, -0.1907258, 1, 0, 0, 1, 1,
0.1469135, -2.586798, 3.234922, 1, 0, 0, 1, 1,
0.147962, 0.8593298, -0.9180618, 1, 0, 0, 1, 1,
0.1488528, -1.767249, 4.788697, 1, 0, 0, 1, 1,
0.1519409, 0.3873083, 1.113794, 0, 0, 0, 1, 1,
0.153697, -0.9080681, 4.189278, 0, 0, 0, 1, 1,
0.1539613, 0.9538514, -0.3164532, 0, 0, 0, 1, 1,
0.157658, 1.785827, -0.9368944, 0, 0, 0, 1, 1,
0.1631074, -0.863757, 3.643401, 0, 0, 0, 1, 1,
0.1650208, 1.057211, 0.3780799, 0, 0, 0, 1, 1,
0.1653262, -0.4599273, 3.096125, 0, 0, 0, 1, 1,
0.1654591, 0.2051244, 0.9859161, 1, 1, 1, 1, 1,
0.1712389, -0.863741, 2.343255, 1, 1, 1, 1, 1,
0.1724586, -0.1054228, 3.211737, 1, 1, 1, 1, 1,
0.1765382, 0.415616, -1.661985, 1, 1, 1, 1, 1,
0.1815555, -0.001187453, 1.825515, 1, 1, 1, 1, 1,
0.1873839, -1.188402, 3.793025, 1, 1, 1, 1, 1,
0.1882183, 1.067379, -0.9985472, 1, 1, 1, 1, 1,
0.1892635, -0.3894185, 0.4627758, 1, 1, 1, 1, 1,
0.1894617, -0.8004375, 3.434757, 1, 1, 1, 1, 1,
0.1895093, -0.207663, 2.11087, 1, 1, 1, 1, 1,
0.1917971, -1.376508, 4.483194, 1, 1, 1, 1, 1,
0.1959241, 1.081979, 1.069747, 1, 1, 1, 1, 1,
0.1967483, 0.9755924, -0.2024888, 1, 1, 1, 1, 1,
0.1971566, -0.8626834, 3.877908, 1, 1, 1, 1, 1,
0.2060596, -0.9398073, 2.759298, 1, 1, 1, 1, 1,
0.2096903, 0.2162735, 0.3887585, 0, 0, 1, 1, 1,
0.2136074, 0.6072397, -0.4235413, 1, 0, 0, 1, 1,
0.2165651, 0.1819151, 0.2099375, 1, 0, 0, 1, 1,
0.2169099, 0.3335893, 0.7709532, 1, 0, 0, 1, 1,
0.2201363, 0.6473196, 0.6002382, 1, 0, 0, 1, 1,
0.2249614, 0.3835696, 1.004323, 1, 0, 0, 1, 1,
0.2267517, -1.316037, 3.89447, 0, 0, 0, 1, 1,
0.2286394, -0.2845811, 2.576864, 0, 0, 0, 1, 1,
0.2324136, 0.7070916, 0.8939049, 0, 0, 0, 1, 1,
0.2324712, 2.426324, -0.7059143, 0, 0, 0, 1, 1,
0.234796, -0.8122487, 3.671089, 0, 0, 0, 1, 1,
0.235761, -0.757288, 3.033479, 0, 0, 0, 1, 1,
0.2367137, 0.6404854, 0.9490352, 0, 0, 0, 1, 1,
0.240439, -2.206084, 2.012236, 1, 1, 1, 1, 1,
0.2414082, 0.05609819, 1.655093, 1, 1, 1, 1, 1,
0.2441387, -2.271492, 3.049477, 1, 1, 1, 1, 1,
0.2460415, -0.7074255, 2.476876, 1, 1, 1, 1, 1,
0.2492171, -0.4646396, 3.191397, 1, 1, 1, 1, 1,
0.2532043, -0.6495204, 3.392966, 1, 1, 1, 1, 1,
0.2598566, 0.5533077, 0.3487983, 1, 1, 1, 1, 1,
0.2626979, 0.3587074, 0.1847127, 1, 1, 1, 1, 1,
0.2654932, -1.479186, 2.433307, 1, 1, 1, 1, 1,
0.2660522, 0.6740484, 0.9516494, 1, 1, 1, 1, 1,
0.2675203, 1.441699, 1.084148, 1, 1, 1, 1, 1,
0.2679354, -0.1208803, 2.440262, 1, 1, 1, 1, 1,
0.2688521, 1.445124, 0.7932112, 1, 1, 1, 1, 1,
0.2715664, -1.098027, 2.054077, 1, 1, 1, 1, 1,
0.2749476, 0.3620096, 1.185827, 1, 1, 1, 1, 1,
0.2817477, 1.176309, -3.225491, 0, 0, 1, 1, 1,
0.2875365, -1.632527, 0.6194392, 1, 0, 0, 1, 1,
0.2902372, 0.4722798, 1.069174, 1, 0, 0, 1, 1,
0.2920682, -0.9653389, 3.704063, 1, 0, 0, 1, 1,
0.2945997, 0.9095123, 1.4455, 1, 0, 0, 1, 1,
0.2977744, -0.6909315, 2.060822, 1, 0, 0, 1, 1,
0.2990291, -0.4954553, 2.041267, 0, 0, 0, 1, 1,
0.3007884, 1.290693, 0.5532104, 0, 0, 0, 1, 1,
0.301431, -1.592003, 1.267801, 0, 0, 0, 1, 1,
0.3031575, 1.378706, 0.7391778, 0, 0, 0, 1, 1,
0.3106456, -0.3885428, 4.281358, 0, 0, 0, 1, 1,
0.3201977, 0.3012921, 2.514477, 0, 0, 0, 1, 1,
0.322144, -0.678201, 2.743105, 0, 0, 0, 1, 1,
0.3277411, -1.853645, 4.378494, 1, 1, 1, 1, 1,
0.3341047, -0.2975554, 1.961189, 1, 1, 1, 1, 1,
0.3375674, -0.6420698, 2.422118, 1, 1, 1, 1, 1,
0.3445667, 0.2427864, 1.888616, 1, 1, 1, 1, 1,
0.3459367, -0.7405904, 3.138953, 1, 1, 1, 1, 1,
0.3508151, -1.011575, 3.315186, 1, 1, 1, 1, 1,
0.3520832, 0.6512113, -0.07199746, 1, 1, 1, 1, 1,
0.3521367, -0.1095121, 0.9225046, 1, 1, 1, 1, 1,
0.3586531, -0.2228242, 3.83805, 1, 1, 1, 1, 1,
0.3588963, -0.5012676, 1.047238, 1, 1, 1, 1, 1,
0.3618404, -2.584757, 4.660796, 1, 1, 1, 1, 1,
0.3627176, -0.1356152, 0.2811471, 1, 1, 1, 1, 1,
0.3635456, -0.6213992, 2.787086, 1, 1, 1, 1, 1,
0.3655683, 0.751002, 0.820406, 1, 1, 1, 1, 1,
0.365823, -0.2381799, 3.21165, 1, 1, 1, 1, 1,
0.3685629, -0.09401059, 1.230213, 0, 0, 1, 1, 1,
0.3703, -0.5553727, 1.294453, 1, 0, 0, 1, 1,
0.3725554, 0.1308837, 0.5110564, 1, 0, 0, 1, 1,
0.377911, 0.1595805, 1.790035, 1, 0, 0, 1, 1,
0.3784719, -0.05821949, 2.065502, 1, 0, 0, 1, 1,
0.3819722, 1.377123, 2.179155, 1, 0, 0, 1, 1,
0.3827487, -1.445891, 2.662487, 0, 0, 0, 1, 1,
0.3858256, 0.297701, -0.9794087, 0, 0, 0, 1, 1,
0.3862227, -0.1145729, 1.199272, 0, 0, 0, 1, 1,
0.3884115, -0.4214488, 2.556612, 0, 0, 0, 1, 1,
0.3888963, 1.126001, -0.2104443, 0, 0, 0, 1, 1,
0.3914869, -0.623076, 0.8636538, 0, 0, 0, 1, 1,
0.3930522, -0.3836722, 2.954148, 0, 0, 0, 1, 1,
0.3934076, 0.04685484, 0.9007761, 1, 1, 1, 1, 1,
0.3940172, -0.4041567, 1.057943, 1, 1, 1, 1, 1,
0.4009541, 0.139445, 1.89851, 1, 1, 1, 1, 1,
0.4040006, 0.7826157, 0.4410537, 1, 1, 1, 1, 1,
0.4181, -1.421971, 2.276904, 1, 1, 1, 1, 1,
0.4203334, 0.2476542, 2.296095, 1, 1, 1, 1, 1,
0.4292742, 1.31427, 0.9307777, 1, 1, 1, 1, 1,
0.429708, -0.4618887, 1.320037, 1, 1, 1, 1, 1,
0.4302026, 1.719324, 1.086286, 1, 1, 1, 1, 1,
0.4314061, 0.008714821, 1.145601, 1, 1, 1, 1, 1,
0.4321826, -1.023233, 3.560512, 1, 1, 1, 1, 1,
0.4338464, 1.49428, -1.234285, 1, 1, 1, 1, 1,
0.4345144, 0.515287, -0.0742313, 1, 1, 1, 1, 1,
0.4368039, 0.02571302, 2.324444, 1, 1, 1, 1, 1,
0.4407293, 0.800419, 0.1794971, 1, 1, 1, 1, 1,
0.4417826, 0.0004872202, 2.255478, 0, 0, 1, 1, 1,
0.4420403, 1.175668, -1.400773, 1, 0, 0, 1, 1,
0.4459363, 0.8841382, 0.6004419, 1, 0, 0, 1, 1,
0.4510911, -1.632353, 1.184084, 1, 0, 0, 1, 1,
0.4540467, -0.7418182, 4.054888, 1, 0, 0, 1, 1,
0.4541267, 0.7766865, 0.7748362, 1, 0, 0, 1, 1,
0.4601711, 1.842214, 0.7098692, 0, 0, 0, 1, 1,
0.4640645, -0.4515486, 3.480587, 0, 0, 0, 1, 1,
0.4643221, -1.355341, 2.920218, 0, 0, 0, 1, 1,
0.4669874, 0.190494, 2.083246, 0, 0, 0, 1, 1,
0.4690579, 0.1455941, 0.9712512, 0, 0, 0, 1, 1,
0.4692977, 0.3190054, -0.0096974, 0, 0, 0, 1, 1,
0.4706009, -0.7813246, 0.5448048, 0, 0, 0, 1, 1,
0.4712467, -0.746017, 2.314688, 1, 1, 1, 1, 1,
0.4719895, 1.742205, 0.4314448, 1, 1, 1, 1, 1,
0.4725529, -1.098438, 4.879601, 1, 1, 1, 1, 1,
0.4798508, 0.4811718, 0.4327799, 1, 1, 1, 1, 1,
0.4808886, -0.1760249, 3.368838, 1, 1, 1, 1, 1,
0.4855447, -0.1928797, 2.707374, 1, 1, 1, 1, 1,
0.4881957, -1.637552, 2.900069, 1, 1, 1, 1, 1,
0.4912943, 0.2089714, -0.6426681, 1, 1, 1, 1, 1,
0.492097, -0.04312697, 1.819488, 1, 1, 1, 1, 1,
0.4939823, -3.053207, 2.328835, 1, 1, 1, 1, 1,
0.496795, -0.1160936, 2.280125, 1, 1, 1, 1, 1,
0.5118128, -0.3790545, 1.361253, 1, 1, 1, 1, 1,
0.5122133, 2.382385, -0.2701553, 1, 1, 1, 1, 1,
0.5126773, 1.626235, 0.6045539, 1, 1, 1, 1, 1,
0.5130313, 1.090827, -1.239608, 1, 1, 1, 1, 1,
0.5153942, 0.07167292, -0.05351761, 0, 0, 1, 1, 1,
0.5178951, -0.6704572, 4.439233, 1, 0, 0, 1, 1,
0.5191036, 0.8995485, -0.6346512, 1, 0, 0, 1, 1,
0.5194299, 0.6276758, -0.5094212, 1, 0, 0, 1, 1,
0.5282103, -1.05688, 2.816469, 1, 0, 0, 1, 1,
0.5293827, 0.01223721, 3.287805, 1, 0, 0, 1, 1,
0.5334466, 0.6326072, 2.186674, 0, 0, 0, 1, 1,
0.5367009, 0.3333414, 1.56316, 0, 0, 0, 1, 1,
0.5368033, -0.6133105, 2.39254, 0, 0, 0, 1, 1,
0.5385047, 0.222566, 0.05179901, 0, 0, 0, 1, 1,
0.5388584, 1.208992, 0.3191519, 0, 0, 0, 1, 1,
0.5406959, 0.07162284, 0.4307897, 0, 0, 0, 1, 1,
0.5442064, 0.5932614, 1.484178, 0, 0, 0, 1, 1,
0.5459623, -0.04311876, -0.3081906, 1, 1, 1, 1, 1,
0.555075, -0.4669634, 1.581536, 1, 1, 1, 1, 1,
0.5592111, -1.869869, 3.728046, 1, 1, 1, 1, 1,
0.5648435, -0.2311274, 3.449323, 1, 1, 1, 1, 1,
0.5652822, 0.5113351, 0.6115531, 1, 1, 1, 1, 1,
0.5736746, 0.05162499, 2.292341, 1, 1, 1, 1, 1,
0.5751047, -0.1638257, 1.652072, 1, 1, 1, 1, 1,
0.5875523, 1.002948, 0.7909489, 1, 1, 1, 1, 1,
0.5907953, 0.1439698, 0.06148227, 1, 1, 1, 1, 1,
0.5918735, 0.8577875, 1.351214, 1, 1, 1, 1, 1,
0.6024246, -0.8432136, 2.374385, 1, 1, 1, 1, 1,
0.606731, 0.7218714, 2.538013, 1, 1, 1, 1, 1,
0.607577, -0.01393164, 2.165875, 1, 1, 1, 1, 1,
0.6084414, 0.379106, 1.144714, 1, 1, 1, 1, 1,
0.6147699, 1.030005, -0.1968088, 1, 1, 1, 1, 1,
0.6171039, -0.2460604, 3.747715, 0, 0, 1, 1, 1,
0.6198279, 0.7716144, 1.421096, 1, 0, 0, 1, 1,
0.6216433, -0.2301588, 2.987257, 1, 0, 0, 1, 1,
0.6270422, -2.377412, 4.329307, 1, 0, 0, 1, 1,
0.6286809, 0.9717466, -1.140031, 1, 0, 0, 1, 1,
0.6299118, 1.6058, 0.8759184, 1, 0, 0, 1, 1,
0.6352136, 0.2842035, 0.7610057, 0, 0, 0, 1, 1,
0.6361687, 0.8662553, 1.842139, 0, 0, 0, 1, 1,
0.6384053, 0.6390327, 0.01002824, 0, 0, 0, 1, 1,
0.6385297, 1.221316, 2.148748, 0, 0, 0, 1, 1,
0.6404487, 1.36242, -0.02956147, 0, 0, 0, 1, 1,
0.6418666, -0.2856264, 0.8467001, 0, 0, 0, 1, 1,
0.6447212, 0.4271819, 0.07161964, 0, 0, 0, 1, 1,
0.648438, 0.4315312, 1.762013, 1, 1, 1, 1, 1,
0.6535388, -1.081589, 0.8711392, 1, 1, 1, 1, 1,
0.6581429, -0.06131577, 1.29021, 1, 1, 1, 1, 1,
0.6591477, -0.5300311, 3.680538, 1, 1, 1, 1, 1,
0.6593491, -1.085945, 4.033799, 1, 1, 1, 1, 1,
0.6810056, 0.2475407, 1.674638, 1, 1, 1, 1, 1,
0.6821485, 1.913061, -0.7282652, 1, 1, 1, 1, 1,
0.6838238, 1.785818, -0.9662261, 1, 1, 1, 1, 1,
0.6901004, -0.3237435, 1.697131, 1, 1, 1, 1, 1,
0.6903041, 2.020557, -0.005894079, 1, 1, 1, 1, 1,
0.6964672, -1.187328, 3.836357, 1, 1, 1, 1, 1,
0.7069214, -0.001119951, 0.6888119, 1, 1, 1, 1, 1,
0.7117123, 0.8975628, 1.762923, 1, 1, 1, 1, 1,
0.7222744, -1.328631, 2.18879, 1, 1, 1, 1, 1,
0.7230495, 1.470163, 0.1180554, 1, 1, 1, 1, 1,
0.7234277, -0.9152718, 3.044884, 0, 0, 1, 1, 1,
0.7272299, 0.08814857, 0.1400555, 1, 0, 0, 1, 1,
0.730605, 0.4393862, 2.724786, 1, 0, 0, 1, 1,
0.7364306, -0.5905491, 1.693194, 1, 0, 0, 1, 1,
0.7378245, -1.430639, 1.829877, 1, 0, 0, 1, 1,
0.7408554, 0.5764578, 1.732567, 1, 0, 0, 1, 1,
0.745466, 0.4504731, 1.126259, 0, 0, 0, 1, 1,
0.7467166, -1.346208, 3.018292, 0, 0, 0, 1, 1,
0.7553901, 2.684952, 0.9349516, 0, 0, 0, 1, 1,
0.7586532, 0.2976848, 0.7347872, 0, 0, 0, 1, 1,
0.7592346, 0.8113319, 1.576538, 0, 0, 0, 1, 1,
0.7613014, -1.813421, 1.101226, 0, 0, 0, 1, 1,
0.7696242, -0.1640453, 1.591833, 0, 0, 0, 1, 1,
0.7740434, 2.795526, 0.2933094, 1, 1, 1, 1, 1,
0.7757886, -0.8589932, 2.741113, 1, 1, 1, 1, 1,
0.7760449, 0.4794701, 1.206349, 1, 1, 1, 1, 1,
0.7774745, -0.4371057, 4.105276, 1, 1, 1, 1, 1,
0.7792178, 0.5632855, 0.7833709, 1, 1, 1, 1, 1,
0.7853861, 0.4937354, 1.232609, 1, 1, 1, 1, 1,
0.7903354, -0.4224713, 1.666586, 1, 1, 1, 1, 1,
0.7913901, -0.8952706, 1.669702, 1, 1, 1, 1, 1,
0.7931496, -0.352771, 3.238787, 1, 1, 1, 1, 1,
0.798151, -0.6715969, 3.666725, 1, 1, 1, 1, 1,
0.8021934, 0.4891801, -0.5542601, 1, 1, 1, 1, 1,
0.8030623, -0.3010848, 1.741607, 1, 1, 1, 1, 1,
0.8096727, -1.747056, 4.184368, 1, 1, 1, 1, 1,
0.8115122, -1.025361, 3.194735, 1, 1, 1, 1, 1,
0.8143293, 2.056739, 0.9531345, 1, 1, 1, 1, 1,
0.8226049, -0.8668316, 2.320574, 0, 0, 1, 1, 1,
0.8241892, 1.396866, 2.617444, 1, 0, 0, 1, 1,
0.826312, -0.8025624, 2.404058, 1, 0, 0, 1, 1,
0.8268977, -1.072187, 3.09878, 1, 0, 0, 1, 1,
0.8331743, 1.074039, 1.20107, 1, 0, 0, 1, 1,
0.8335797, -1.370305, 1.672129, 1, 0, 0, 1, 1,
0.8354687, 0.459514, 0.4180005, 0, 0, 0, 1, 1,
0.8358971, -0.7859352, 1.455828, 0, 0, 0, 1, 1,
0.8360195, 1.288581, -1.047778, 0, 0, 0, 1, 1,
0.8399809, 0.2798336, 0.1426693, 0, 0, 0, 1, 1,
0.845841, -2.092099, 3.595348, 0, 0, 0, 1, 1,
0.8525252, -0.29055, 1.17787, 0, 0, 0, 1, 1,
0.8550256, -0.708647, 1.663727, 0, 0, 0, 1, 1,
0.8627363, 0.458486, 1.341869, 1, 1, 1, 1, 1,
0.8671302, -1.104066, 2.349131, 1, 1, 1, 1, 1,
0.867595, 0.376533, -0.8600501, 1, 1, 1, 1, 1,
0.8693772, -1.191764, 2.180608, 1, 1, 1, 1, 1,
0.869577, -0.9525228, 1.030467, 1, 1, 1, 1, 1,
0.869637, 1.010953, 0.6138089, 1, 1, 1, 1, 1,
0.8704857, 2.476706, 1.41863, 1, 1, 1, 1, 1,
0.8706973, 2.310103, 1.586495, 1, 1, 1, 1, 1,
0.881118, -0.7239445, 2.729775, 1, 1, 1, 1, 1,
0.886031, -0.2995363, 1.71413, 1, 1, 1, 1, 1,
0.888982, 0.6840169, 0.2922023, 1, 1, 1, 1, 1,
0.8914624, 0.8766144, -0.3703894, 1, 1, 1, 1, 1,
0.8934041, -0.7915853, 3.192267, 1, 1, 1, 1, 1,
0.9014232, 1.432212, 1.069816, 1, 1, 1, 1, 1,
0.9053197, 0.5224168, 0.1297837, 1, 1, 1, 1, 1,
0.9064348, 0.04531289, 1.435664, 0, 0, 1, 1, 1,
0.9087991, -0.6711518, 3.314204, 1, 0, 0, 1, 1,
0.9098517, -0.4210826, 3.076157, 1, 0, 0, 1, 1,
0.9131975, -1.738106, 2.971497, 1, 0, 0, 1, 1,
0.9142085, 0.2805262, 1.199001, 1, 0, 0, 1, 1,
0.9173672, 1.882574, -0.005911774, 1, 0, 0, 1, 1,
0.9186963, 0.09426437, 0.1506717, 0, 0, 0, 1, 1,
0.9215198, -1.085904, 2.563666, 0, 0, 0, 1, 1,
0.9267998, -0.1745426, 0.9157288, 0, 0, 0, 1, 1,
0.9284252, -0.3787873, 1.736891, 0, 0, 0, 1, 1,
0.9294841, -0.4827688, 1.768795, 0, 0, 0, 1, 1,
0.9301776, -1.023815, 2.688786, 0, 0, 0, 1, 1,
0.9345099, 0.3932471, 2.07783, 0, 0, 0, 1, 1,
0.9350601, 0.1904768, 0.02298516, 1, 1, 1, 1, 1,
0.9367334, 0.3495175, -0.02052887, 1, 1, 1, 1, 1,
0.9401131, 0.4186218, 1.912123, 1, 1, 1, 1, 1,
0.9422307, -0.3477634, 1.501554, 1, 1, 1, 1, 1,
0.9437951, 0.9277208, 1.211904, 1, 1, 1, 1, 1,
0.9452059, 0.1558826, 1.410399, 1, 1, 1, 1, 1,
0.9559014, 2.758641, -1.934746, 1, 1, 1, 1, 1,
0.9577618, -0.2707111, 1.891751, 1, 1, 1, 1, 1,
0.9580894, 0.1929864, -0.3052529, 1, 1, 1, 1, 1,
0.9585323, -0.5627373, 0.5936524, 1, 1, 1, 1, 1,
0.9601238, -0.04516361, 2.123845, 1, 1, 1, 1, 1,
0.9646907, -0.4560249, 1.294011, 1, 1, 1, 1, 1,
0.9692008, -0.4485095, 3.23208, 1, 1, 1, 1, 1,
0.9711013, 0.5700113, 0.4438905, 1, 1, 1, 1, 1,
0.9716173, 0.7601781, 1.621261, 1, 1, 1, 1, 1,
0.9729906, -1.238436, 1.366433, 0, 0, 1, 1, 1,
0.9762962, 0.1426724, 1.063055, 1, 0, 0, 1, 1,
0.9810046, 1.076695, -0.5261664, 1, 0, 0, 1, 1,
0.982779, 1.006768, 3.2171, 1, 0, 0, 1, 1,
0.9831222, -1.059786, 2.792592, 1, 0, 0, 1, 1,
0.9838172, -0.5138267, 3.942215, 1, 0, 0, 1, 1,
0.9872916, 1.375444, 1.399129, 0, 0, 0, 1, 1,
0.9908504, -1.130355, 3.123302, 0, 0, 0, 1, 1,
0.9922809, -1.375588, 4.39621, 0, 0, 0, 1, 1,
0.9964548, 0.6852397, -0.2095951, 0, 0, 0, 1, 1,
0.9970593, -0.7110238, 3.003731, 0, 0, 0, 1, 1,
1.008404, 0.6146575, 1.866302, 0, 0, 0, 1, 1,
1.009927, 0.369969, 0.7184509, 0, 0, 0, 1, 1,
1.012213, 0.1861958, 2.539126, 1, 1, 1, 1, 1,
1.014718, 0.1476856, 2.286311, 1, 1, 1, 1, 1,
1.018948, -0.1054501, 0.0313837, 1, 1, 1, 1, 1,
1.019518, 0.601189, -0.07012773, 1, 1, 1, 1, 1,
1.021827, 0.8102576, 2.028597, 1, 1, 1, 1, 1,
1.025262, 0.4257333, 0.6789354, 1, 1, 1, 1, 1,
1.02873, 0.3257565, 0.00518959, 1, 1, 1, 1, 1,
1.035091, -0.05387857, 1.353949, 1, 1, 1, 1, 1,
1.038803, -0.5539894, 1.590708, 1, 1, 1, 1, 1,
1.043493, -1.506266, 0.9034036, 1, 1, 1, 1, 1,
1.045347, 0.6254482, 1.197227, 1, 1, 1, 1, 1,
1.047228, -0.1269258, 2.875785, 1, 1, 1, 1, 1,
1.047961, 0.4479332, 1.822928, 1, 1, 1, 1, 1,
1.050955, 0.3783998, 1.513636, 1, 1, 1, 1, 1,
1.051517, 1.112162, -0.8398823, 1, 1, 1, 1, 1,
1.065794, 1.548167, 1.16339, 0, 0, 1, 1, 1,
1.074189, -0.7891618, 1.725403, 1, 0, 0, 1, 1,
1.078077, -1.655682, 2.363294, 1, 0, 0, 1, 1,
1.078175, -1.12765, 2.366335, 1, 0, 0, 1, 1,
1.080726, 0.6065482, 2.260509, 1, 0, 0, 1, 1,
1.086066, -0.8570458, 3.940666, 1, 0, 0, 1, 1,
1.092918, -0.07343328, 4.023452, 0, 0, 0, 1, 1,
1.102904, 1.657522, -0.8973126, 0, 0, 0, 1, 1,
1.105075, 2.109523, 1.67747, 0, 0, 0, 1, 1,
1.106571, 0.1146653, 2.720594, 0, 0, 0, 1, 1,
1.10734, -0.5733182, 1.7648, 0, 0, 0, 1, 1,
1.115932, -0.05080962, 2.210934, 0, 0, 0, 1, 1,
1.120763, -0.8659766, 0.177547, 0, 0, 0, 1, 1,
1.121874, -0.3041354, 3.886642, 1, 1, 1, 1, 1,
1.122435, 0.3980035, 0.5952568, 1, 1, 1, 1, 1,
1.127128, 1.277351, -0.5751817, 1, 1, 1, 1, 1,
1.129131, 1.124344, -1.979526, 1, 1, 1, 1, 1,
1.130952, -0.8517933, 2.946452, 1, 1, 1, 1, 1,
1.144712, 1.081932, 0.4979875, 1, 1, 1, 1, 1,
1.146918, 1.346599, 2.178319, 1, 1, 1, 1, 1,
1.158239, 1.003244, 1.447596, 1, 1, 1, 1, 1,
1.171394, 0.4122629, 4.401472, 1, 1, 1, 1, 1,
1.171614, 0.3117835, 2.028342, 1, 1, 1, 1, 1,
1.172651, 0.5742958, 1.075161, 1, 1, 1, 1, 1,
1.176289, -0.2702578, 0.7629703, 1, 1, 1, 1, 1,
1.186643, 0.4306647, 1.188954, 1, 1, 1, 1, 1,
1.190011, -0.8443347, 2.862445, 1, 1, 1, 1, 1,
1.192373, 0.467907, 1.171425, 1, 1, 1, 1, 1,
1.19912, 0.7534166, 1.209069, 0, 0, 1, 1, 1,
1.200876, -0.1257235, 1.499746, 1, 0, 0, 1, 1,
1.203465, 0.01522842, 1.683826, 1, 0, 0, 1, 1,
1.208176, 0.8403449, 1.267273, 1, 0, 0, 1, 1,
1.209211, 0.1719047, 1.370898, 1, 0, 0, 1, 1,
1.215602, 0.5893627, 1.228603, 1, 0, 0, 1, 1,
1.219539, 0.03559851, 1.006842, 0, 0, 0, 1, 1,
1.228599, 0.6360717, 1.478865, 0, 0, 0, 1, 1,
1.231079, 1.303409, 0.6600447, 0, 0, 0, 1, 1,
1.233918, -0.5427238, 2.286363, 0, 0, 0, 1, 1,
1.234752, 0.4626097, 0.6560714, 0, 0, 0, 1, 1,
1.234771, -0.1139316, 0.5599958, 0, 0, 0, 1, 1,
1.236034, 0.1396913, 1.932602, 0, 0, 0, 1, 1,
1.237349, -0.01171232, 0.8295708, 1, 1, 1, 1, 1,
1.238004, -0.2837994, 2.416627, 1, 1, 1, 1, 1,
1.243696, -1.559602, 2.086633, 1, 1, 1, 1, 1,
1.24427, 1.365706, 0.6247129, 1, 1, 1, 1, 1,
1.244708, -0.490956, 0.4654028, 1, 1, 1, 1, 1,
1.245521, 0.05037531, 3.313828, 1, 1, 1, 1, 1,
1.263876, 2.536066, -0.9657939, 1, 1, 1, 1, 1,
1.265578, 0.01972062, 2.429801, 1, 1, 1, 1, 1,
1.26634, -0.0953924, 1.05395, 1, 1, 1, 1, 1,
1.271901, 0.08632538, 2.310318, 1, 1, 1, 1, 1,
1.281362, -0.0218007, 2.697282, 1, 1, 1, 1, 1,
1.288038, 1.245572, -0.677395, 1, 1, 1, 1, 1,
1.295891, -1.051314, 2.244141, 1, 1, 1, 1, 1,
1.296844, -0.7529169, 1.540129, 1, 1, 1, 1, 1,
1.314844, -1.05909, 0.9430698, 1, 1, 1, 1, 1,
1.315362, 0.1228672, 1.656205, 0, 0, 1, 1, 1,
1.318006, -1.510895, 2.810452, 1, 0, 0, 1, 1,
1.321534, 0.7092931, 0.1031095, 1, 0, 0, 1, 1,
1.322366, -0.06950613, 0.8427176, 1, 0, 0, 1, 1,
1.343791, -0.8675487, -0.2209728, 1, 0, 0, 1, 1,
1.344003, 1.055873, -0.2612798, 1, 0, 0, 1, 1,
1.344185, -1.517129, 2.398087, 0, 0, 0, 1, 1,
1.348794, -0.4262554, 1.252903, 0, 0, 0, 1, 1,
1.350689, 0.1160478, 2.227831, 0, 0, 0, 1, 1,
1.370212, -1.097056, 3.387311, 0, 0, 0, 1, 1,
1.376657, 0.2445201, 1.561507, 0, 0, 0, 1, 1,
1.378637, -1.723865, 2.769429, 0, 0, 0, 1, 1,
1.381897, 1.393533, 1.938672, 0, 0, 0, 1, 1,
1.383102, 1.026708, 0.4479812, 1, 1, 1, 1, 1,
1.39146, -0.1000053, 1.020648, 1, 1, 1, 1, 1,
1.405722, 0.4601144, 3.241412, 1, 1, 1, 1, 1,
1.408463, 0.7609281, 2.049661, 1, 1, 1, 1, 1,
1.414726, 1.342226, 0.2634225, 1, 1, 1, 1, 1,
1.415649, -0.3239218, 1.217798, 1, 1, 1, 1, 1,
1.41802, 1.140988, 2.040956, 1, 1, 1, 1, 1,
1.418087, -2.150422, 4.088737, 1, 1, 1, 1, 1,
1.419335, -2.123781, 3.794961, 1, 1, 1, 1, 1,
1.432185, 1.580292, 1.300633, 1, 1, 1, 1, 1,
1.44209, -0.01938838, 0.7660072, 1, 1, 1, 1, 1,
1.442788, -1.55258, 1.461612, 1, 1, 1, 1, 1,
1.444129, -0.9456248, 1.677224, 1, 1, 1, 1, 1,
1.452487, -1.012002, 2.940217, 1, 1, 1, 1, 1,
1.457193, -0.8789596, 1.628177, 1, 1, 1, 1, 1,
1.457744, 0.6676114, -0.09222686, 0, 0, 1, 1, 1,
1.461539, -0.2081232, 1.693104, 1, 0, 0, 1, 1,
1.462946, 0.04353619, 1.299385, 1, 0, 0, 1, 1,
1.472254, -0.6660511, 1.381136, 1, 0, 0, 1, 1,
1.473884, -0.08208677, 0.9497724, 1, 0, 0, 1, 1,
1.478579, 1.483957, 1.913633, 1, 0, 0, 1, 1,
1.498477, -0.710132, 1.162754, 0, 0, 0, 1, 1,
1.504401, -0.6057827, 0.5533934, 0, 0, 0, 1, 1,
1.515861, -0.6148637, 0.9867959, 0, 0, 0, 1, 1,
1.525316, 0.6779687, 2.796932, 0, 0, 0, 1, 1,
1.528425, 0.3308842, -1.936148, 0, 0, 0, 1, 1,
1.539267, 1.179805, 2.100779, 0, 0, 0, 1, 1,
1.575379, -0.400716, 0.4874039, 0, 0, 0, 1, 1,
1.575682, -0.575945, -0.7202241, 1, 1, 1, 1, 1,
1.576181, -0.5251415, 1.974079, 1, 1, 1, 1, 1,
1.580004, -0.1285762, 2.719685, 1, 1, 1, 1, 1,
1.594479, -0.08552467, 2.057495, 1, 1, 1, 1, 1,
1.595095, -1.416346, 3.509622, 1, 1, 1, 1, 1,
1.599413, 2.563997, 0.6835177, 1, 1, 1, 1, 1,
1.605155, -0.3812456, 1.698215, 1, 1, 1, 1, 1,
1.623215, -0.4279359, 1.040159, 1, 1, 1, 1, 1,
1.630198, 0.119942, 1.271611, 1, 1, 1, 1, 1,
1.631608, -0.121135, 0.797397, 1, 1, 1, 1, 1,
1.632064, -1.429059, 2.252113, 1, 1, 1, 1, 1,
1.63562, 0.5101522, 2.832718, 1, 1, 1, 1, 1,
1.637987, -0.6975341, 2.429602, 1, 1, 1, 1, 1,
1.645414, -1.072295, 2.812402, 1, 1, 1, 1, 1,
1.646383, -0.702711, 1.972357, 1, 1, 1, 1, 1,
1.659376, -0.2704085, -0.6961018, 0, 0, 1, 1, 1,
1.661882, 0.03406778, 1.591444, 1, 0, 0, 1, 1,
1.666696, 0.3185506, 1.793329, 1, 0, 0, 1, 1,
1.668536, 1.037876, 1.577548, 1, 0, 0, 1, 1,
1.677127, 0.08064239, 0.6408178, 1, 0, 0, 1, 1,
1.677375, 0.06850961, 1.64695, 1, 0, 0, 1, 1,
1.677445, -0.3519031, 1.729709, 0, 0, 0, 1, 1,
1.680163, -0.762353, 4.6025, 0, 0, 0, 1, 1,
1.693296, 1.489716, 1.261155, 0, 0, 0, 1, 1,
1.70603, -1.844059, 2.222034, 0, 0, 0, 1, 1,
1.744428, -0.6973048, 2.659006, 0, 0, 0, 1, 1,
1.746883, 0.4841451, 0.7940012, 0, 0, 0, 1, 1,
1.751709, 1.063208, -0.4669464, 0, 0, 0, 1, 1,
1.783498, -0.5213721, 0.9254641, 1, 1, 1, 1, 1,
1.795743, 0.7542257, 2.285735, 1, 1, 1, 1, 1,
1.82353, -0.6084273, 1.814843, 1, 1, 1, 1, 1,
1.829352, -0.4244312, 1.580558, 1, 1, 1, 1, 1,
1.830923, -0.5544446, 3.95076, 1, 1, 1, 1, 1,
1.844783, 3.250031, 0.6827053, 1, 1, 1, 1, 1,
1.89251, 1.176947, -0.1050606, 1, 1, 1, 1, 1,
1.89629, -0.1896837, 1.879037, 1, 1, 1, 1, 1,
1.901786, -0.5062839, 2.07903, 1, 1, 1, 1, 1,
1.911399, 1.727526, 0.9083786, 1, 1, 1, 1, 1,
2.00826, 0.1874669, 1.976011, 1, 1, 1, 1, 1,
2.012367, 0.326924, 1.044426, 1, 1, 1, 1, 1,
2.022777, -0.171673, 1.943997, 1, 1, 1, 1, 1,
2.060781, -1.36104, 1.59824, 1, 1, 1, 1, 1,
2.068412, 1.330095, -0.4354567, 1, 1, 1, 1, 1,
2.090439, 1.983372, 1.148373, 0, 0, 1, 1, 1,
2.103173, 0.4889952, 1.476869, 1, 0, 0, 1, 1,
2.121227, 1.514916, -0.2382178, 1, 0, 0, 1, 1,
2.122696, 0.1709227, 2.390174, 1, 0, 0, 1, 1,
2.128949, 3.362609, 0.6655278, 1, 0, 0, 1, 1,
2.170813, 0.2496049, 1.579067, 1, 0, 0, 1, 1,
2.194135, 0.1861319, 2.010083, 0, 0, 0, 1, 1,
2.244166, -1.361547, 3.054826, 0, 0, 0, 1, 1,
2.262527, 1.858912, 0.4506809, 0, 0, 0, 1, 1,
2.2916, 0.1267035, 3.09797, 0, 0, 0, 1, 1,
2.313571, 1.097999, 1.190438, 0, 0, 0, 1, 1,
2.326015, 0.1439934, 2.889931, 0, 0, 0, 1, 1,
2.329063, -0.8622304, 2.654272, 0, 0, 0, 1, 1,
2.362474, -0.01770521, 2.362877, 1, 1, 1, 1, 1,
2.578886, -0.626742, 2.059813, 1, 1, 1, 1, 1,
2.640525, -0.1155545, 0.5458547, 1, 1, 1, 1, 1,
2.649431, 1.467281, 2.951345, 1, 1, 1, 1, 1,
2.670539, 0.4508862, 1.636205, 1, 1, 1, 1, 1,
2.795528, -0.4257686, 2.27514, 1, 1, 1, 1, 1,
2.813601, -0.7607213, 1.216821, 1, 1, 1, 1, 1
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
var radius = 9.363571;
var distance = 32.88914;
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
mvMatrix.translate( -0.151517, 0.2424006, 0.2720587 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.88914);
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