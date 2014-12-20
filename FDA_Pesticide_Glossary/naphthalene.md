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
-3.169662, 0.270957, -1.138291, 1, 0, 0, 1,
-3.093515, -0.4734419, -1.713533, 1, 0.007843138, 0, 1,
-2.936807, 0.8954104, 0.1056016, 1, 0.01176471, 0, 1,
-2.833797, -0.6583942, -1.171067, 1, 0.01960784, 0, 1,
-2.820703, -1.047734, -1.575415, 1, 0.02352941, 0, 1,
-2.806828, 0.9436762, -2.177542, 1, 0.03137255, 0, 1,
-2.732193, 1.04537, 1.008958, 1, 0.03529412, 0, 1,
-2.501593, -1.083063, -2.522715, 1, 0.04313726, 0, 1,
-2.461991, 0.2427466, -2.35416, 1, 0.04705882, 0, 1,
-2.447391, -0.0636441, -3.061501, 1, 0.05490196, 0, 1,
-2.444999, -0.5154019, -1.547619, 1, 0.05882353, 0, 1,
-2.430546, -0.4432563, -2.657423, 1, 0.06666667, 0, 1,
-2.37437, 0.07471391, -1.046863, 1, 0.07058824, 0, 1,
-2.374073, 0.4717871, -1.496062, 1, 0.07843138, 0, 1,
-2.362319, 0.5598701, -0.1275394, 1, 0.08235294, 0, 1,
-2.302476, -0.08220176, -1.488876, 1, 0.09019608, 0, 1,
-2.289025, -3.017599, -1.875429, 1, 0.09411765, 0, 1,
-2.250599, -0.01237074, -2.338251, 1, 0.1019608, 0, 1,
-2.249181, 0.229638, 0.2001877, 1, 0.1098039, 0, 1,
-2.233999, 0.2821794, -2.320812, 1, 0.1137255, 0, 1,
-2.227653, -0.8008612, -1.145876, 1, 0.1215686, 0, 1,
-2.195654, -1.466814, -1.776817, 1, 0.1254902, 0, 1,
-2.190432, -0.284305, -2.459985, 1, 0.1333333, 0, 1,
-2.154493, 0.5072841, -1.731257, 1, 0.1372549, 0, 1,
-2.144826, 0.4965806, -0.9950827, 1, 0.145098, 0, 1,
-2.1063, -1.103672, -0.1590945, 1, 0.1490196, 0, 1,
-2.105856, -0.8304558, -2.623661, 1, 0.1568628, 0, 1,
-2.095617, -0.788106, -1.031093, 1, 0.1607843, 0, 1,
-2.069559, 0.7459788, -1.393206, 1, 0.1686275, 0, 1,
-2.031379, -1.525799, -0.6072227, 1, 0.172549, 0, 1,
-1.998587, -0.4561524, -1.823493, 1, 0.1803922, 0, 1,
-1.986602, -1.162613, -3.333544, 1, 0.1843137, 0, 1,
-1.943454, -0.4584377, -1.433419, 1, 0.1921569, 0, 1,
-1.867517, -1.333872, -1.738284, 1, 0.1960784, 0, 1,
-1.866394, -1.16205, -1.691434, 1, 0.2039216, 0, 1,
-1.846292, 0.8913696, -0.3697451, 1, 0.2117647, 0, 1,
-1.841085, -2.050472, -2.67779, 1, 0.2156863, 0, 1,
-1.838411, -0.563046, -0.6300153, 1, 0.2235294, 0, 1,
-1.835786, 0.8769093, -1.671996, 1, 0.227451, 0, 1,
-1.821614, 2.694182, -1.50653, 1, 0.2352941, 0, 1,
-1.790166, -0.5503801, -0.1963121, 1, 0.2392157, 0, 1,
-1.780128, 0.7112379, -0.9586434, 1, 0.2470588, 0, 1,
-1.764946, -0.03955098, -1.209307, 1, 0.2509804, 0, 1,
-1.759479, 1.207856, 0.03202441, 1, 0.2588235, 0, 1,
-1.758796, 0.8614797, -1.17937, 1, 0.2627451, 0, 1,
-1.741557, 1.036683, -0.4958362, 1, 0.2705882, 0, 1,
-1.732386, -1.267781, -4.388563, 1, 0.2745098, 0, 1,
-1.725004, 0.2186518, -0.3248087, 1, 0.282353, 0, 1,
-1.714726, 1.862298, 0.2339605, 1, 0.2862745, 0, 1,
-1.697796, 0.4311173, -1.237934, 1, 0.2941177, 0, 1,
-1.69764, 1.72105, -1.201797, 1, 0.3019608, 0, 1,
-1.667473, -0.9116856, -2.949751, 1, 0.3058824, 0, 1,
-1.660208, -0.6022534, -2.0021, 1, 0.3137255, 0, 1,
-1.644109, -0.5558293, -0.9455288, 1, 0.3176471, 0, 1,
-1.643118, -1.756825, -2.525618, 1, 0.3254902, 0, 1,
-1.628898, -0.3717248, -0.8429078, 1, 0.3294118, 0, 1,
-1.627224, -1.170423, -0.01523892, 1, 0.3372549, 0, 1,
-1.604324, 0.2318171, -1.473192, 1, 0.3411765, 0, 1,
-1.603712, 1.133605, -1.363865, 1, 0.3490196, 0, 1,
-1.596957, -0.8530232, -2.072154, 1, 0.3529412, 0, 1,
-1.593538, -0.1411666, -1.971431, 1, 0.3607843, 0, 1,
-1.593062, -0.2363352, -2.557128, 1, 0.3647059, 0, 1,
-1.587524, -2.814957, -3.107185, 1, 0.372549, 0, 1,
-1.58437, 0.7497832, -3.174345, 1, 0.3764706, 0, 1,
-1.580512, 0.9714497, -0.956064, 1, 0.3843137, 0, 1,
-1.572964, 0.584316, -3.325771, 1, 0.3882353, 0, 1,
-1.561147, -0.2151663, -1.722904, 1, 0.3960784, 0, 1,
-1.555471, 1.544116, -1.016616, 1, 0.4039216, 0, 1,
-1.551704, 0.730481, -2.965446, 1, 0.4078431, 0, 1,
-1.55051, -0.2244504, -1.741847, 1, 0.4156863, 0, 1,
-1.549032, -0.1251554, -0.005864743, 1, 0.4196078, 0, 1,
-1.532844, -0.01868452, -2.902258, 1, 0.427451, 0, 1,
-1.498036, 0.4523792, -1.731043, 1, 0.4313726, 0, 1,
-1.497903, -0.03942355, -0.05797292, 1, 0.4392157, 0, 1,
-1.493202, -0.5945417, -0.279455, 1, 0.4431373, 0, 1,
-1.490239, 1.068138, -2.033423, 1, 0.4509804, 0, 1,
-1.488153, -0.1777685, -1.128902, 1, 0.454902, 0, 1,
-1.481866, -0.3276091, -1.713818, 1, 0.4627451, 0, 1,
-1.479622, 0.576232, 0.6343216, 1, 0.4666667, 0, 1,
-1.478135, 0.3133121, -1.8797, 1, 0.4745098, 0, 1,
-1.472278, 1.540857, -0.4384118, 1, 0.4784314, 0, 1,
-1.466421, 0.9063537, -0.180794, 1, 0.4862745, 0, 1,
-1.458869, -0.4077269, -0.1256374, 1, 0.4901961, 0, 1,
-1.437954, 0.4515163, -0.6714154, 1, 0.4980392, 0, 1,
-1.432798, -0.0140033, -1.263869, 1, 0.5058824, 0, 1,
-1.426498, 0.6353748, -3.455863, 1, 0.509804, 0, 1,
-1.398572, -0.5498329, -2.008659, 1, 0.5176471, 0, 1,
-1.398062, 0.7058567, -1.255832, 1, 0.5215687, 0, 1,
-1.395659, 1.267793, -1.321973, 1, 0.5294118, 0, 1,
-1.394468, -0.9316608, -2.578285, 1, 0.5333334, 0, 1,
-1.384622, -0.4966508, -2.745006, 1, 0.5411765, 0, 1,
-1.378059, -0.07430099, 0.02734173, 1, 0.5450981, 0, 1,
-1.36552, 0.6988401, -1.424974, 1, 0.5529412, 0, 1,
-1.365055, -0.1701166, -0.910564, 1, 0.5568628, 0, 1,
-1.356427, -0.7054956, -1.229531, 1, 0.5647059, 0, 1,
-1.349199, -1.074861, -4.054443, 1, 0.5686275, 0, 1,
-1.338879, -1.098751, -2.385618, 1, 0.5764706, 0, 1,
-1.331114, 0.5800966, -1.413849, 1, 0.5803922, 0, 1,
-1.313538, 0.04164442, -0.6631832, 1, 0.5882353, 0, 1,
-1.290626, 0.9453216, -1.240126, 1, 0.5921569, 0, 1,
-1.288164, -0.9873793, -1.633333, 1, 0.6, 0, 1,
-1.283539, 0.5381428, -0.7113855, 1, 0.6078432, 0, 1,
-1.27879, -2.904229, -3.062003, 1, 0.6117647, 0, 1,
-1.272102, 0.6042283, -0.7297254, 1, 0.6196079, 0, 1,
-1.267354, -1.169872, -2.753762, 1, 0.6235294, 0, 1,
-1.263771, -0.6643631, -2.318248, 1, 0.6313726, 0, 1,
-1.262216, -0.9289016, -1.299304, 1, 0.6352941, 0, 1,
-1.260298, 0.04936674, -3.576182, 1, 0.6431373, 0, 1,
-1.24949, 0.7046715, -1.949767, 1, 0.6470588, 0, 1,
-1.248749, -0.2943905, -2.444539, 1, 0.654902, 0, 1,
-1.247479, 0.1076302, -1.552485, 1, 0.6588235, 0, 1,
-1.227523, 0.5098968, -0.1356544, 1, 0.6666667, 0, 1,
-1.226934, -1.639861, -2.598503, 1, 0.6705883, 0, 1,
-1.214867, -1.613266, -2.977678, 1, 0.6784314, 0, 1,
-1.212067, -0.07805379, -1.409389, 1, 0.682353, 0, 1,
-1.206853, 0.9988028, -0.4703253, 1, 0.6901961, 0, 1,
-1.206088, 0.2112532, -0.4947395, 1, 0.6941177, 0, 1,
-1.204262, -1.872551, -2.060189, 1, 0.7019608, 0, 1,
-1.200412, 0.06015532, -0.6508432, 1, 0.7098039, 0, 1,
-1.194558, -0.739579, -3.862527, 1, 0.7137255, 0, 1,
-1.193403, -0.92917, -2.396764, 1, 0.7215686, 0, 1,
-1.178808, -0.4892201, -0.5180691, 1, 0.7254902, 0, 1,
-1.178345, 0.3053091, -1.233311, 1, 0.7333333, 0, 1,
-1.170196, -1.249141, -2.214828, 1, 0.7372549, 0, 1,
-1.164786, 0.7275212, 0.08080871, 1, 0.7450981, 0, 1,
-1.164471, 0.08613878, -0.6844268, 1, 0.7490196, 0, 1,
-1.1594, 0.5314606, -0.5591183, 1, 0.7568628, 0, 1,
-1.146977, 2.183903, -2.166773, 1, 0.7607843, 0, 1,
-1.141188, 0.552368, -1.036974, 1, 0.7686275, 0, 1,
-1.137393, -0.8646498, -1.660853, 1, 0.772549, 0, 1,
-1.136374, -0.7533894, -1.626237, 1, 0.7803922, 0, 1,
-1.132945, 0.6705714, -0.5910437, 1, 0.7843137, 0, 1,
-1.123407, 0.1356306, -1.902523, 1, 0.7921569, 0, 1,
-1.12199, 0.020452, -0.6762963, 1, 0.7960784, 0, 1,
-1.108593, -0.9125102, -1.090176, 1, 0.8039216, 0, 1,
-1.107299, -0.8083051, -2.080771, 1, 0.8117647, 0, 1,
-1.10144, 1.220351, 0.5859601, 1, 0.8156863, 0, 1,
-1.100999, -1.470592, -2.986008, 1, 0.8235294, 0, 1,
-1.100774, -1.078, -1.966227, 1, 0.827451, 0, 1,
-1.099777, -0.9461665, -2.21882, 1, 0.8352941, 0, 1,
-1.094488, 1.25466, -2.644948, 1, 0.8392157, 0, 1,
-1.09128, -0.04526626, -1.175274, 1, 0.8470588, 0, 1,
-1.087294, 0.1688183, -2.423222, 1, 0.8509804, 0, 1,
-1.075655, 1.334895, -0.2245011, 1, 0.8588235, 0, 1,
-1.06729, -0.8239179, -2.687251, 1, 0.8627451, 0, 1,
-1.066474, -0.9769822, -3.52372, 1, 0.8705882, 0, 1,
-1.066053, 0.162766, -0.8748321, 1, 0.8745098, 0, 1,
-1.065463, -1.348119, -2.248452, 1, 0.8823529, 0, 1,
-1.052969, 2.342506, -1.731859, 1, 0.8862745, 0, 1,
-1.047493, -0.1679854, -3.234338, 1, 0.8941177, 0, 1,
-1.041398, -0.8470479, -1.111349, 1, 0.8980392, 0, 1,
-1.038043, -0.7924607, -1.123953, 1, 0.9058824, 0, 1,
-1.037204, -0.4143444, -1.316661, 1, 0.9137255, 0, 1,
-1.036318, -0.04348882, -2.020207, 1, 0.9176471, 0, 1,
-1.032259, -0.01598437, -3.433383, 1, 0.9254902, 0, 1,
-1.032194, -0.4093968, -1.910383, 1, 0.9294118, 0, 1,
-1.031293, 1.499555, 0.9766406, 1, 0.9372549, 0, 1,
-1.029256, 0.462865, -0.9290693, 1, 0.9411765, 0, 1,
-1.028345, -1.663762, -3.228708, 1, 0.9490196, 0, 1,
-1.025557, -1.75329, -2.322751, 1, 0.9529412, 0, 1,
-1.021819, 1.137198, -0.0949723, 1, 0.9607843, 0, 1,
-1.021419, -0.2975791, -1.840368, 1, 0.9647059, 0, 1,
-1.019626, -0.7547604, -1.993128, 1, 0.972549, 0, 1,
-1.019558, -0.1299419, -2.062295, 1, 0.9764706, 0, 1,
-1.016064, -1.04513, -3.341786, 1, 0.9843137, 0, 1,
-1.013007, -1.252481, -4.15741, 1, 0.9882353, 0, 1,
-1.01058, -0.6756001, -1.93972, 1, 0.9960784, 0, 1,
-1.005566, 0.4500328, -2.19162, 0.9960784, 1, 0, 1,
-0.9943748, -0.3423705, -2.021403, 0.9921569, 1, 0, 1,
-0.992239, -0.5886338, -4.748016, 0.9843137, 1, 0, 1,
-0.9914657, 2.178941, -0.1916919, 0.9803922, 1, 0, 1,
-0.9884661, 0.7333111, -0.7564117, 0.972549, 1, 0, 1,
-0.9876086, -0.8489634, -2.682446, 0.9686275, 1, 0, 1,
-0.9858084, 1.493285, -0.8766087, 0.9607843, 1, 0, 1,
-0.9825693, -0.6882298, -1.336005, 0.9568627, 1, 0, 1,
-0.9785684, 0.7065182, -0.5106677, 0.9490196, 1, 0, 1,
-0.977073, 1.441638, -1.289198, 0.945098, 1, 0, 1,
-0.9750623, 1.351463, 1.092645, 0.9372549, 1, 0, 1,
-0.9712905, 0.4618753, -0.2111648, 0.9333333, 1, 0, 1,
-0.963342, -0.62348, -1.708073, 0.9254902, 1, 0, 1,
-0.96285, -1.174321, -2.564535, 0.9215686, 1, 0, 1,
-0.9591413, 0.7527958, -1.330749, 0.9137255, 1, 0, 1,
-0.9550239, -0.8613414, -3.288306, 0.9098039, 1, 0, 1,
-0.9533463, -2.458453, -2.744848, 0.9019608, 1, 0, 1,
-0.9492069, -1.15951, -3.277307, 0.8941177, 1, 0, 1,
-0.9437857, 0.5808983, -1.698144, 0.8901961, 1, 0, 1,
-0.9366786, -0.5057012, -0.09331474, 0.8823529, 1, 0, 1,
-0.9309148, -2.747831, -3.991657, 0.8784314, 1, 0, 1,
-0.9307852, 0.1368113, -0.05236609, 0.8705882, 1, 0, 1,
-0.9288989, 1.377768, -1.367222, 0.8666667, 1, 0, 1,
-0.9286292, 0.6470349, 0.6858196, 0.8588235, 1, 0, 1,
-0.9281124, 1.694459, -0.0721549, 0.854902, 1, 0, 1,
-0.9250346, 0.06708214, -1.825121, 0.8470588, 1, 0, 1,
-0.9249619, -0.7932274, -4.21451, 0.8431373, 1, 0, 1,
-0.9222543, -0.3133145, -1.914758, 0.8352941, 1, 0, 1,
-0.921174, 0.1820353, -2.7032, 0.8313726, 1, 0, 1,
-0.9139626, -0.4292692, -2.508917, 0.8235294, 1, 0, 1,
-0.9128606, -1.798355, -2.691016, 0.8196079, 1, 0, 1,
-0.911323, 0.6380523, -0.8918628, 0.8117647, 1, 0, 1,
-0.9069381, 0.170361, -2.199438, 0.8078431, 1, 0, 1,
-0.903888, 1.724293, -2.535983, 0.8, 1, 0, 1,
-0.9022146, 0.355363, -2.935014, 0.7921569, 1, 0, 1,
-0.9003457, -0.6261892, -2.995754, 0.7882353, 1, 0, 1,
-0.8966357, -2.086807, -4.27848, 0.7803922, 1, 0, 1,
-0.8956831, 0.861966, -1.762857, 0.7764706, 1, 0, 1,
-0.8916404, 0.2318386, 0.3018367, 0.7686275, 1, 0, 1,
-0.8837336, -0.4884283, -2.468345, 0.7647059, 1, 0, 1,
-0.8815069, 1.385489, -0.2407614, 0.7568628, 1, 0, 1,
-0.8768371, 0.1517854, -2.699469, 0.7529412, 1, 0, 1,
-0.8750042, 0.1730384, -2.10622, 0.7450981, 1, 0, 1,
-0.8749099, 1.661103, -2.168704, 0.7411765, 1, 0, 1,
-0.8699539, 0.9587831, -1.467634, 0.7333333, 1, 0, 1,
-0.8653648, 1.491091, 0.2079095, 0.7294118, 1, 0, 1,
-0.8546909, 0.6555948, -1.610699, 0.7215686, 1, 0, 1,
-0.8460643, 1.228905, 0.7057173, 0.7176471, 1, 0, 1,
-0.8458668, -0.05653943, -2.630055, 0.7098039, 1, 0, 1,
-0.8434801, 0.1239756, -1.570592, 0.7058824, 1, 0, 1,
-0.841552, -1.661705, -1.64488, 0.6980392, 1, 0, 1,
-0.8410149, -0.3148617, -4.194838, 0.6901961, 1, 0, 1,
-0.8404688, 0.2510292, -1.570697, 0.6862745, 1, 0, 1,
-0.839587, 1.583009, -0.3273795, 0.6784314, 1, 0, 1,
-0.8395746, -0.4040991, -1.011272, 0.6745098, 1, 0, 1,
-0.8371726, -0.2844695, -1.86909, 0.6666667, 1, 0, 1,
-0.8334489, 0.3521764, -0.6298987, 0.6627451, 1, 0, 1,
-0.8331229, -1.677441, -1.082911, 0.654902, 1, 0, 1,
-0.8248495, 0.486535, 0.2402733, 0.6509804, 1, 0, 1,
-0.8196381, 1.138612, 0.340451, 0.6431373, 1, 0, 1,
-0.8185096, 0.6653666, -1.151086, 0.6392157, 1, 0, 1,
-0.8145638, -0.7420977, -3.800383, 0.6313726, 1, 0, 1,
-0.8075352, -0.4078138, -2.971003, 0.627451, 1, 0, 1,
-0.8071758, 0.2165918, -1.964388, 0.6196079, 1, 0, 1,
-0.8015115, -0.5769149, -2.135858, 0.6156863, 1, 0, 1,
-0.7973291, 0.7432827, -2.308927, 0.6078432, 1, 0, 1,
-0.7956306, 0.1078136, 0.330171, 0.6039216, 1, 0, 1,
-0.7944639, -1.011765, -3.049932, 0.5960785, 1, 0, 1,
-0.7923425, -0.6837016, 0.3206391, 0.5882353, 1, 0, 1,
-0.7882154, 1.185221, -0.8023994, 0.5843138, 1, 0, 1,
-0.7840592, -0.2313169, -1.636359, 0.5764706, 1, 0, 1,
-0.7796018, -0.1384496, -2.47485, 0.572549, 1, 0, 1,
-0.777792, 1.308807, -1.185836, 0.5647059, 1, 0, 1,
-0.7741749, 0.9721389, -0.06471711, 0.5607843, 1, 0, 1,
-0.7661901, -1.377807, -3.516732, 0.5529412, 1, 0, 1,
-0.7658234, -0.6999182, -3.317465, 0.5490196, 1, 0, 1,
-0.7578357, 0.1999813, -0.2658947, 0.5411765, 1, 0, 1,
-0.7537626, -0.8961719, -3.233608, 0.5372549, 1, 0, 1,
-0.7520108, 1.382207, -1.200746, 0.5294118, 1, 0, 1,
-0.7504843, 1.195464, 0.1345433, 0.5254902, 1, 0, 1,
-0.7502463, -0.6825186, -2.07492, 0.5176471, 1, 0, 1,
-0.7478224, -0.09210677, -2.521362, 0.5137255, 1, 0, 1,
-0.7457034, 0.1650496, -2.057609, 0.5058824, 1, 0, 1,
-0.7429225, -0.05120341, -1.147214, 0.5019608, 1, 0, 1,
-0.7344775, 0.570487, -1.255946, 0.4941176, 1, 0, 1,
-0.7342677, -1.882186, -2.581351, 0.4862745, 1, 0, 1,
-0.7342025, -0.4440705, -2.018112, 0.4823529, 1, 0, 1,
-0.7279423, -0.5256548, -2.927171, 0.4745098, 1, 0, 1,
-0.7214938, -0.5765947, -1.65877, 0.4705882, 1, 0, 1,
-0.7185634, 0.03583578, -1.091971, 0.4627451, 1, 0, 1,
-0.7159205, -1.364561, -2.697603, 0.4588235, 1, 0, 1,
-0.7148878, -0.1826236, -2.685595, 0.4509804, 1, 0, 1,
-0.7143161, 1.364358, -0.01493698, 0.4470588, 1, 0, 1,
-0.713444, -0.469799, -2.878254, 0.4392157, 1, 0, 1,
-0.7097386, 1.008036, -2.2432, 0.4352941, 1, 0, 1,
-0.7089678, -1.501705, -2.78987, 0.427451, 1, 0, 1,
-0.7046015, -1.210711, -3.016516, 0.4235294, 1, 0, 1,
-0.700856, 1.03205, -1.839177, 0.4156863, 1, 0, 1,
-0.6989025, -0.2659484, -0.4949596, 0.4117647, 1, 0, 1,
-0.6947377, -0.3685578, -3.111839, 0.4039216, 1, 0, 1,
-0.6922688, 1.406461, 0.4499643, 0.3960784, 1, 0, 1,
-0.6918712, -1.751053, -2.577994, 0.3921569, 1, 0, 1,
-0.6866828, 0.4634121, -2.757325, 0.3843137, 1, 0, 1,
-0.6850241, 0.5779418, -1.405019, 0.3803922, 1, 0, 1,
-0.6843193, 1.044066, -1.656029, 0.372549, 1, 0, 1,
-0.6819408, 0.4905072, 0.9416683, 0.3686275, 1, 0, 1,
-0.6751607, -0.3018741, -2.290214, 0.3607843, 1, 0, 1,
-0.6737391, -1.256907, -1.875538, 0.3568628, 1, 0, 1,
-0.6730925, 1.372068, -1.508682, 0.3490196, 1, 0, 1,
-0.6710404, -0.003081596, -3.383504, 0.345098, 1, 0, 1,
-0.663784, 0.1302331, -2.376687, 0.3372549, 1, 0, 1,
-0.6635701, -0.499333, -1.441074, 0.3333333, 1, 0, 1,
-0.6599621, 0.1634109, -1.602786, 0.3254902, 1, 0, 1,
-0.6599383, -0.06436395, -0.8174538, 0.3215686, 1, 0, 1,
-0.6594813, -1.79969, -2.711253, 0.3137255, 1, 0, 1,
-0.6538686, 0.80185, 0.7228619, 0.3098039, 1, 0, 1,
-0.6484674, -0.9251838, -1.878413, 0.3019608, 1, 0, 1,
-0.6376771, 0.006561032, -2.864248, 0.2941177, 1, 0, 1,
-0.6355406, -0.0848467, -1.396665, 0.2901961, 1, 0, 1,
-0.6313068, -0.8931233, -2.406169, 0.282353, 1, 0, 1,
-0.631117, 1.709733, -1.079076, 0.2784314, 1, 0, 1,
-0.6305074, -0.851903, -4.270154, 0.2705882, 1, 0, 1,
-0.6291159, 1.238067, -0.5603592, 0.2666667, 1, 0, 1,
-0.6283294, 0.02713467, -3.496071, 0.2588235, 1, 0, 1,
-0.623642, -1.085815, -0.4487862, 0.254902, 1, 0, 1,
-0.6198301, -1.630923, -1.888682, 0.2470588, 1, 0, 1,
-0.6124612, 0.1342413, -1.355826, 0.2431373, 1, 0, 1,
-0.6042725, 0.868311, -1.270485, 0.2352941, 1, 0, 1,
-0.6028856, 0.445108, -1.529034, 0.2313726, 1, 0, 1,
-0.6028164, 0.1307523, -0.2544929, 0.2235294, 1, 0, 1,
-0.5905404, -0.3271473, -0.8648036, 0.2196078, 1, 0, 1,
-0.5901228, 0.7656977, -1.695031, 0.2117647, 1, 0, 1,
-0.5854342, -1.246701, -2.932473, 0.2078431, 1, 0, 1,
-0.5828369, -0.3810759, -2.992736, 0.2, 1, 0, 1,
-0.5809914, -0.01118176, -2.144899, 0.1921569, 1, 0, 1,
-0.5805182, -1.01794, -2.294917, 0.1882353, 1, 0, 1,
-0.5734965, -1.694058, -3.507234, 0.1803922, 1, 0, 1,
-0.571808, 0.2504411, -0.9628444, 0.1764706, 1, 0, 1,
-0.5663243, -1.866736, -2.40389, 0.1686275, 1, 0, 1,
-0.5645511, 1.475868, 0.4226592, 0.1647059, 1, 0, 1,
-0.5637362, -0.3364381, -1.011888, 0.1568628, 1, 0, 1,
-0.5562019, 0.663659, -0.1050769, 0.1529412, 1, 0, 1,
-0.5496781, -0.6826872, -2.313267, 0.145098, 1, 0, 1,
-0.5468776, 0.4309067, -1.774237, 0.1411765, 1, 0, 1,
-0.5438741, 1.698384, -0.3641603, 0.1333333, 1, 0, 1,
-0.5425909, 0.4049521, -0.2119532, 0.1294118, 1, 0, 1,
-0.5333865, -0.8687516, -4.199066, 0.1215686, 1, 0, 1,
-0.5286716, 0.9424578, -0.5493568, 0.1176471, 1, 0, 1,
-0.5247721, -1.40974, -2.105283, 0.1098039, 1, 0, 1,
-0.521121, -0.4926322, -0.8101071, 0.1058824, 1, 0, 1,
-0.5154759, -1.4893, -1.759444, 0.09803922, 1, 0, 1,
-0.509982, -0.5449857, -2.277286, 0.09019608, 1, 0, 1,
-0.5014828, -0.3676871, -4.206136, 0.08627451, 1, 0, 1,
-0.4995764, 1.660454, -0.792945, 0.07843138, 1, 0, 1,
-0.4992358, -0.8039029, -1.429702, 0.07450981, 1, 0, 1,
-0.494901, -1.255204, -2.816195, 0.06666667, 1, 0, 1,
-0.4928735, 0.2514079, -1.053076, 0.0627451, 1, 0, 1,
-0.4928092, 0.730801, -2.045071, 0.05490196, 1, 0, 1,
-0.4838755, 0.9570538, 0.3818782, 0.05098039, 1, 0, 1,
-0.4822087, -1.164145, -3.935581, 0.04313726, 1, 0, 1,
-0.4713248, 0.002661241, -3.740269, 0.03921569, 1, 0, 1,
-0.4665543, 1.582103, -0.3587134, 0.03137255, 1, 0, 1,
-0.4651238, -0.01944303, -2.086173, 0.02745098, 1, 0, 1,
-0.4617558, -1.516615, -1.688241, 0.01960784, 1, 0, 1,
-0.4588578, -0.9992268, -4.007984, 0.01568628, 1, 0, 1,
-0.4571552, -2.682522, -2.921952, 0.007843138, 1, 0, 1,
-0.4570794, -0.2470167, -2.959087, 0.003921569, 1, 0, 1,
-0.4570449, -0.08440524, -2.368912, 0, 1, 0.003921569, 1,
-0.4560513, -0.1556365, -2.07365, 0, 1, 0.01176471, 1,
-0.4541052, -0.4775285, -1.680262, 0, 1, 0.01568628, 1,
-0.4530075, 1.022729, 0.2995544, 0, 1, 0.02352941, 1,
-0.4501992, -0.05866214, -0.5142879, 0, 1, 0.02745098, 1,
-0.4500128, 0.3879056, -0.296265, 0, 1, 0.03529412, 1,
-0.4462826, 1.376167, 1.107027, 0, 1, 0.03921569, 1,
-0.4383062, -0.9477285, -0.8347856, 0, 1, 0.04705882, 1,
-0.4363719, -0.855231, -2.745152, 0, 1, 0.05098039, 1,
-0.4333634, -1.039989, -2.539732, 0, 1, 0.05882353, 1,
-0.4295219, -0.2517421, -0.4124058, 0, 1, 0.0627451, 1,
-0.4284751, -0.1777407, -0.5037423, 0, 1, 0.07058824, 1,
-0.4284064, 0.6144457, -0.5107894, 0, 1, 0.07450981, 1,
-0.4261144, 0.1681925, -2.183174, 0, 1, 0.08235294, 1,
-0.4256309, 0.3810377, 0.7747646, 0, 1, 0.08627451, 1,
-0.417956, 0.3048393, -0.5386114, 0, 1, 0.09411765, 1,
-0.4171026, -1.210201, -2.296877, 0, 1, 0.1019608, 1,
-0.4168578, -1.844966, -3.301139, 0, 1, 0.1058824, 1,
-0.4161894, -0.03392885, -0.944165, 0, 1, 0.1137255, 1,
-0.4160482, 0.2751372, -2.038653, 0, 1, 0.1176471, 1,
-0.4134052, 0.4530693, -0.9192119, 0, 1, 0.1254902, 1,
-0.4118589, 0.7853044, -0.8713588, 0, 1, 0.1294118, 1,
-0.4102477, 0.0424342, -2.011251, 0, 1, 0.1372549, 1,
-0.4004515, -0.7437353, -1.779099, 0, 1, 0.1411765, 1,
-0.3996077, -1.138209, -2.517374, 0, 1, 0.1490196, 1,
-0.3961008, -0.7961543, -2.905883, 0, 1, 0.1529412, 1,
-0.3955582, -0.5145364, -3.689024, 0, 1, 0.1607843, 1,
-0.3949023, 1.446844, -1.185555, 0, 1, 0.1647059, 1,
-0.3919093, -0.08223543, -0.9564916, 0, 1, 0.172549, 1,
-0.3870889, 0.1067859, 0.5270358, 0, 1, 0.1764706, 1,
-0.385196, 0.02317048, -1.408393, 0, 1, 0.1843137, 1,
-0.3826526, 0.8672571, 1.183912, 0, 1, 0.1882353, 1,
-0.3812298, -1.130638, -4.36044, 0, 1, 0.1960784, 1,
-0.3793132, -0.5630782, -2.734657, 0, 1, 0.2039216, 1,
-0.3761972, -0.3675741, -1.982606, 0, 1, 0.2078431, 1,
-0.3721699, -1.13919, -4.136441, 0, 1, 0.2156863, 1,
-0.368903, 0.07479287, -0.01011357, 0, 1, 0.2196078, 1,
-0.3685429, -0.1674474, -3.270167, 0, 1, 0.227451, 1,
-0.3663648, -1.240567, -2.988128, 0, 1, 0.2313726, 1,
-0.3612077, 2.354739, -0.1036894, 0, 1, 0.2392157, 1,
-0.3611339, 0.01043424, -0.6118262, 0, 1, 0.2431373, 1,
-0.3580202, -0.1629692, -1.265851, 0, 1, 0.2509804, 1,
-0.3552465, 0.9403445, 0.4829502, 0, 1, 0.254902, 1,
-0.3523909, -1.235243, -2.358456, 0, 1, 0.2627451, 1,
-0.3508281, -1.08297, -3.061852, 0, 1, 0.2666667, 1,
-0.3490035, -0.8190347, -2.782948, 0, 1, 0.2745098, 1,
-0.3464452, 1.141573, -0.4863554, 0, 1, 0.2784314, 1,
-0.3443002, -0.9208229, -2.177038, 0, 1, 0.2862745, 1,
-0.3423745, -0.9099947, -2.69627, 0, 1, 0.2901961, 1,
-0.3405136, -1.268239, -3.07518, 0, 1, 0.2980392, 1,
-0.3329182, -0.2561504, -3.04652, 0, 1, 0.3058824, 1,
-0.3306448, 0.5589268, 0.1778373, 0, 1, 0.3098039, 1,
-0.3237136, 1.882254, 0.7229993, 0, 1, 0.3176471, 1,
-0.323641, 0.8517593, -1.169888, 0, 1, 0.3215686, 1,
-0.3224475, 0.241505, -3.059688, 0, 1, 0.3294118, 1,
-0.32131, -0.7718557, -2.71601, 0, 1, 0.3333333, 1,
-0.3199178, -0.5297616, -2.637826, 0, 1, 0.3411765, 1,
-0.3112651, 1.552762, -1.755227, 0, 1, 0.345098, 1,
-0.3101973, 0.8401166, 1.629656, 0, 1, 0.3529412, 1,
-0.3074276, 1.723463, 0.2058703, 0, 1, 0.3568628, 1,
-0.3052703, 0.9210536, 0.3474034, 0, 1, 0.3647059, 1,
-0.303345, -1.805244, -2.326104, 0, 1, 0.3686275, 1,
-0.2904208, 1.025357, -1.491828, 0, 1, 0.3764706, 1,
-0.2881996, -0.5918908, -2.940931, 0, 1, 0.3803922, 1,
-0.282983, 0.5113437, -0.5013288, 0, 1, 0.3882353, 1,
-0.2820418, 0.08565026, 0.04168668, 0, 1, 0.3921569, 1,
-0.2779367, -1.051845, -2.192874, 0, 1, 0.4, 1,
-0.2771741, -0.6194141, -1.320117, 0, 1, 0.4078431, 1,
-0.2730687, 2.295752, -1.644141, 0, 1, 0.4117647, 1,
-0.2720692, -0.5740328, -2.516838, 0, 1, 0.4196078, 1,
-0.2660672, 0.8361187, -0.9955536, 0, 1, 0.4235294, 1,
-0.2610854, -0.1734434, -1.842051, 0, 1, 0.4313726, 1,
-0.2597892, 0.4130828, -0.06710492, 0, 1, 0.4352941, 1,
-0.2594717, -1.9396, -4.523044, 0, 1, 0.4431373, 1,
-0.2587819, -0.3020186, -1.049785, 0, 1, 0.4470588, 1,
-0.2570167, 0.07012939, -1.120077, 0, 1, 0.454902, 1,
-0.254603, -0.4613345, -1.589284, 0, 1, 0.4588235, 1,
-0.2535708, -1.338551, -4.01008, 0, 1, 0.4666667, 1,
-0.2524583, -1.357931, -1.940284, 0, 1, 0.4705882, 1,
-0.2522167, 3.820327, -0.4237033, 0, 1, 0.4784314, 1,
-0.2511629, -0.2365162, -3.355999, 0, 1, 0.4823529, 1,
-0.2459477, 1.687933, -0.640149, 0, 1, 0.4901961, 1,
-0.2457816, 0.856801, -0.3342823, 0, 1, 0.4941176, 1,
-0.2451045, -1.836948, -2.035379, 0, 1, 0.5019608, 1,
-0.2385618, -1.279844, -2.181884, 0, 1, 0.509804, 1,
-0.2382659, 2.50387, -0.5765211, 0, 1, 0.5137255, 1,
-0.2372439, -0.303102, -0.7701222, 0, 1, 0.5215687, 1,
-0.2340771, 0.1523042, -1.081607, 0, 1, 0.5254902, 1,
-0.2332631, 1.19993, -0.2545781, 0, 1, 0.5333334, 1,
-0.2323559, 0.1014718, -1.52448, 0, 1, 0.5372549, 1,
-0.2239321, 0.3757763, 0.6755237, 0, 1, 0.5450981, 1,
-0.2148499, -1.268589, -2.74021, 0, 1, 0.5490196, 1,
-0.2143902, 0.6569418, 0.3853357, 0, 1, 0.5568628, 1,
-0.2123964, -0.8324108, -2.216367, 0, 1, 0.5607843, 1,
-0.2077064, 2.273849, 0.7373676, 0, 1, 0.5686275, 1,
-0.2052106, -0.2703388, -2.29759, 0, 1, 0.572549, 1,
-0.2027561, 0.3622232, 0.1382873, 0, 1, 0.5803922, 1,
-0.2018232, -1.072668, -1.587316, 0, 1, 0.5843138, 1,
-0.1973501, -0.2812359, -2.473141, 0, 1, 0.5921569, 1,
-0.1964514, -0.999788, -1.698303, 0, 1, 0.5960785, 1,
-0.1910765, -1.13495, -3.742004, 0, 1, 0.6039216, 1,
-0.1905304, 1.504916, -0.07574604, 0, 1, 0.6117647, 1,
-0.187947, -0.5887467, -1.780276, 0, 1, 0.6156863, 1,
-0.1814249, 1.45929, -0.04926641, 0, 1, 0.6235294, 1,
-0.1774909, -0.9678873, -2.500245, 0, 1, 0.627451, 1,
-0.176978, 0.163708, -1.280585, 0, 1, 0.6352941, 1,
-0.1747881, -0.5635301, -2.291955, 0, 1, 0.6392157, 1,
-0.1743986, 2.251065, 0.1892726, 0, 1, 0.6470588, 1,
-0.1691206, 1.06394, -1.118837, 0, 1, 0.6509804, 1,
-0.1677735, 0.2858644, -1.43433, 0, 1, 0.6588235, 1,
-0.1636189, -0.6744014, -1.825206, 0, 1, 0.6627451, 1,
-0.1629409, 0.2146497, -1.700251, 0, 1, 0.6705883, 1,
-0.1603688, -0.9386125, -4.007004, 0, 1, 0.6745098, 1,
-0.1579645, -0.6386713, -3.412596, 0, 1, 0.682353, 1,
-0.1579183, -0.2383714, -3.051252, 0, 1, 0.6862745, 1,
-0.1567063, 1.883638, -0.1458918, 0, 1, 0.6941177, 1,
-0.1519685, 1.301918, -0.5828835, 0, 1, 0.7019608, 1,
-0.1516656, -0.3773042, -3.581333, 0, 1, 0.7058824, 1,
-0.1488137, -1.236214, -3.283191, 0, 1, 0.7137255, 1,
-0.1444561, 0.353236, 1.387327, 0, 1, 0.7176471, 1,
-0.1436773, -0.2838469, -2.603717, 0, 1, 0.7254902, 1,
-0.14082, -0.3935473, -3.188794, 0, 1, 0.7294118, 1,
-0.1387979, 1.500869, 0.4895993, 0, 1, 0.7372549, 1,
-0.1312355, 0.6893313, 0.2257366, 0, 1, 0.7411765, 1,
-0.1305964, 0.512456, -0.840183, 0, 1, 0.7490196, 1,
-0.12773, 0.05197977, -1.167491, 0, 1, 0.7529412, 1,
-0.1263935, 1.325588, -1.703309, 0, 1, 0.7607843, 1,
-0.1251028, 1.850801, -0.3021077, 0, 1, 0.7647059, 1,
-0.1233277, 1.511466, -0.2103577, 0, 1, 0.772549, 1,
-0.1213233, -0.9427815, -3.51921, 0, 1, 0.7764706, 1,
-0.1198401, -0.9210209, -3.832304, 0, 1, 0.7843137, 1,
-0.1192566, -0.590714, -2.495255, 0, 1, 0.7882353, 1,
-0.1189706, -0.8766599, -4.833206, 0, 1, 0.7960784, 1,
-0.1180364, 1.333776, -0.5196088, 0, 1, 0.8039216, 1,
-0.1132993, 1.464341, 0.3366578, 0, 1, 0.8078431, 1,
-0.1128457, 0.4683077, -0.5161358, 0, 1, 0.8156863, 1,
-0.1110256, -0.8578739, -4.74511, 0, 1, 0.8196079, 1,
-0.1107641, -0.1709819, -3.169004, 0, 1, 0.827451, 1,
-0.1080043, 2.2516, -0.6025191, 0, 1, 0.8313726, 1,
-0.1076008, 0.399102, -0.973574, 0, 1, 0.8392157, 1,
-0.1042212, -2.005269, -2.469839, 0, 1, 0.8431373, 1,
-0.1028097, -1.125767, -3.146874, 0, 1, 0.8509804, 1,
-0.1027612, -0.6428499, -2.604714, 0, 1, 0.854902, 1,
-0.09161093, 0.14609, 0.4341846, 0, 1, 0.8627451, 1,
-0.08963048, -1.152324, -1.637931, 0, 1, 0.8666667, 1,
-0.08545823, -1.252355, -3.147482, 0, 1, 0.8745098, 1,
-0.08335567, 0.9432195, -0.0525931, 0, 1, 0.8784314, 1,
-0.08002197, -2.316041, -2.889573, 0, 1, 0.8862745, 1,
-0.0775, 1.507301, 0.2454864, 0, 1, 0.8901961, 1,
-0.0688945, 1.336487, 0.9755495, 0, 1, 0.8980392, 1,
-0.06641369, 1.152715, -0.7775371, 0, 1, 0.9058824, 1,
-0.06377182, -0.8775499, -2.383739, 0, 1, 0.9098039, 1,
-0.06236719, -1.341341, -3.266192, 0, 1, 0.9176471, 1,
-0.06214282, -0.1976936, -3.179066, 0, 1, 0.9215686, 1,
-0.0613659, -0.3434998, -4.082175, 0, 1, 0.9294118, 1,
-0.05908144, 0.09062522, -1.431528, 0, 1, 0.9333333, 1,
-0.05766525, 0.1652405, -0.3783952, 0, 1, 0.9411765, 1,
-0.05757817, -0.4289091, -3.369107, 0, 1, 0.945098, 1,
-0.05400801, 2.687897, 0.09782817, 0, 1, 0.9529412, 1,
-0.05236987, -0.4255696, -1.514455, 0, 1, 0.9568627, 1,
-0.05218194, 0.627561, 0.5696169, 0, 1, 0.9647059, 1,
-0.04687105, 0.2280489, -0.9690335, 0, 1, 0.9686275, 1,
-0.04186416, -1.366139, -3.602072, 0, 1, 0.9764706, 1,
-0.04098963, 1.228744, 1.993957, 0, 1, 0.9803922, 1,
-0.04058802, -0.922348, -1.788517, 0, 1, 0.9882353, 1,
-0.04023024, 0.004291404, 0.8834805, 0, 1, 0.9921569, 1,
-0.04016798, -0.1706771, -2.174794, 0, 1, 1, 1,
-0.03976907, 0.1417928, 0.2820511, 0, 0.9921569, 1, 1,
-0.03894599, 0.9947147, -1.186335, 0, 0.9882353, 1, 1,
-0.03786008, -1.467965, -3.245113, 0, 0.9803922, 1, 1,
-0.03639632, 0.01687675, -0.4300895, 0, 0.9764706, 1, 1,
-0.03615286, 0.7519563, -1.823179, 0, 0.9686275, 1, 1,
-0.03557762, 0.5934141, 2.683053, 0, 0.9647059, 1, 1,
-0.03536814, 0.9962841, 0.4289388, 0, 0.9568627, 1, 1,
-0.0347467, 0.4401509, -0.3924548, 0, 0.9529412, 1, 1,
-0.0310813, 0.5212228, -0.5206619, 0, 0.945098, 1, 1,
-0.02725297, -0.1646489, -3.354544, 0, 0.9411765, 1, 1,
-0.02231189, -0.6487252, -1.166633, 0, 0.9333333, 1, 1,
-0.01798855, 1.011106, -0.3980688, 0, 0.9294118, 1, 1,
-0.01673322, 0.2484531, 0.7503759, 0, 0.9215686, 1, 1,
-0.01447133, -0.7192027, -3.128217, 0, 0.9176471, 1, 1,
-0.01178162, 0.9830338, -1.199579, 0, 0.9098039, 1, 1,
-0.009881645, -1.79678, -2.17731, 0, 0.9058824, 1, 1,
-0.009396911, -0.6191522, -0.7981525, 0, 0.8980392, 1, 1,
-0.009054322, 0.3203325, -1.63979, 0, 0.8901961, 1, 1,
-0.008644421, 2.563979, 0.9160377, 0, 0.8862745, 1, 1,
-0.006930817, 0.6428636, 0.2754504, 0, 0.8784314, 1, 1,
-0.00304149, -0.04649653, -1.869596, 0, 0.8745098, 1, 1,
-0.001090259, -0.4086125, -2.911733, 0, 0.8666667, 1, 1,
0.005559747, 0.6785883, 0.05880516, 0, 0.8627451, 1, 1,
0.006201676, -0.6992677, 2.77792, 0, 0.854902, 1, 1,
0.006600278, 0.8394123, -0.1433038, 0, 0.8509804, 1, 1,
0.006800548, 1.215248, 0.3059785, 0, 0.8431373, 1, 1,
0.007132486, 0.2333415, -0.4626562, 0, 0.8392157, 1, 1,
0.007524632, -0.2745375, 2.628671, 0, 0.8313726, 1, 1,
0.01391493, 1.028776, 0.2092162, 0, 0.827451, 1, 1,
0.01434797, -1.550465, 1.813212, 0, 0.8196079, 1, 1,
0.01465184, -0.3719259, 2.249276, 0, 0.8156863, 1, 1,
0.01481422, 0.3677014, 0.2987399, 0, 0.8078431, 1, 1,
0.0149939, -0.1822816, 2.128217, 0, 0.8039216, 1, 1,
0.01573571, -0.129448, 4.301843, 0, 0.7960784, 1, 1,
0.01631577, -0.3043433, 3.237009, 0, 0.7882353, 1, 1,
0.01900766, -0.03147081, 0.7872812, 0, 0.7843137, 1, 1,
0.01930705, -0.4227828, 2.338626, 0, 0.7764706, 1, 1,
0.02204035, -0.6454903, 2.878226, 0, 0.772549, 1, 1,
0.02297076, 0.1346269, 1.600748, 0, 0.7647059, 1, 1,
0.02690613, 1.949191, 1.08846, 0, 0.7607843, 1, 1,
0.02690944, 0.232699, -0.6361784, 0, 0.7529412, 1, 1,
0.03149972, 1.325935, -1.522079, 0, 0.7490196, 1, 1,
0.03469153, 0.8684, 0.4329155, 0, 0.7411765, 1, 1,
0.04005015, -0.07622755, 2.920906, 0, 0.7372549, 1, 1,
0.04034953, 0.06846628, 0.3240013, 0, 0.7294118, 1, 1,
0.04590315, 0.02906444, 1.521618, 0, 0.7254902, 1, 1,
0.04738091, 0.5831, 0.5117962, 0, 0.7176471, 1, 1,
0.04968699, -1.477993, 4.162271, 0, 0.7137255, 1, 1,
0.0497156, 0.01029783, 2.336468, 0, 0.7058824, 1, 1,
0.0594401, -0.352684, 2.018266, 0, 0.6980392, 1, 1,
0.06366669, -2.188389, 1.745409, 0, 0.6941177, 1, 1,
0.06452662, 0.6382511, -1.270759, 0, 0.6862745, 1, 1,
0.06929272, 0.4776292, 0.8488622, 0, 0.682353, 1, 1,
0.07071159, 0.514756, 1.753737, 0, 0.6745098, 1, 1,
0.07247084, 0.06730179, 0.1513799, 0, 0.6705883, 1, 1,
0.08797725, -1.161016, 1.590461, 0, 0.6627451, 1, 1,
0.09015308, -1.097824, 3.203425, 0, 0.6588235, 1, 1,
0.09113668, -0.8033999, 3.545956, 0, 0.6509804, 1, 1,
0.09353457, 1.062436, 1.855913, 0, 0.6470588, 1, 1,
0.09403392, 0.3571281, -0.2366122, 0, 0.6392157, 1, 1,
0.0944614, 0.7487264, -0.1829652, 0, 0.6352941, 1, 1,
0.09587321, -0.07695898, 2.699108, 0, 0.627451, 1, 1,
0.09670966, 0.7497479, 1.461066, 0, 0.6235294, 1, 1,
0.1049692, 2.172788, 1.068382, 0, 0.6156863, 1, 1,
0.1158239, -0.9476104, 3.309517, 0, 0.6117647, 1, 1,
0.1232586, -1.054017, 3.759086, 0, 0.6039216, 1, 1,
0.1248283, 0.452069, 1.553908, 0, 0.5960785, 1, 1,
0.1264558, 0.9047704, -0.5581187, 0, 0.5921569, 1, 1,
0.1276038, -2.432423, 2.64945, 0, 0.5843138, 1, 1,
0.1318723, 1.29864, 0.4120266, 0, 0.5803922, 1, 1,
0.1389608, -0.75076, 2.492213, 0, 0.572549, 1, 1,
0.1470565, -0.8495322, 1.923916, 0, 0.5686275, 1, 1,
0.1516101, 1.701962, -0.7073289, 0, 0.5607843, 1, 1,
0.1616785, -0.7210732, 2.831951, 0, 0.5568628, 1, 1,
0.1686781, 1.698774, 0.1663104, 0, 0.5490196, 1, 1,
0.1687351, -2.39295, 3.43784, 0, 0.5450981, 1, 1,
0.1691631, 0.4227011, 1.264624, 0, 0.5372549, 1, 1,
0.169351, 1.966645, 0.4447368, 0, 0.5333334, 1, 1,
0.1708211, 1.304018, -0.004218658, 0, 0.5254902, 1, 1,
0.1768663, 0.605591, 1.103466, 0, 0.5215687, 1, 1,
0.181324, 0.1600147, -0.1723749, 0, 0.5137255, 1, 1,
0.1873693, -0.3003601, 1.745956, 0, 0.509804, 1, 1,
0.1875742, 1.655393, -0.8151959, 0, 0.5019608, 1, 1,
0.192601, -0.1034474, 4.327293, 0, 0.4941176, 1, 1,
0.1945289, -1.334287, 3.338509, 0, 0.4901961, 1, 1,
0.1999536, 0.6806381, -0.4895567, 0, 0.4823529, 1, 1,
0.2038264, -1.440004, 3.848937, 0, 0.4784314, 1, 1,
0.2088258, 1.263444, -0.1284307, 0, 0.4705882, 1, 1,
0.209, -0.7162038, 3.354213, 0, 0.4666667, 1, 1,
0.2106517, -0.9751005, 3.345603, 0, 0.4588235, 1, 1,
0.2181714, -1.065248, 2.717791, 0, 0.454902, 1, 1,
0.219269, -0.4066862, 1.48663, 0, 0.4470588, 1, 1,
0.2198991, 0.8393328, 1.406875, 0, 0.4431373, 1, 1,
0.2206302, -2.208424, 2.850112, 0, 0.4352941, 1, 1,
0.220858, 0.8841414, 1.893524, 0, 0.4313726, 1, 1,
0.2219082, 0.3319573, 1.837958, 0, 0.4235294, 1, 1,
0.2223155, 0.4878574, 0.9512776, 0, 0.4196078, 1, 1,
0.2293973, 2.155559, 1.28367, 0, 0.4117647, 1, 1,
0.2321368, -1.999475, 1.524532, 0, 0.4078431, 1, 1,
0.2343207, -0.9101834, 3.178236, 0, 0.4, 1, 1,
0.2377152, -0.5650281, 2.771638, 0, 0.3921569, 1, 1,
0.240842, -0.06594574, 1.477774, 0, 0.3882353, 1, 1,
0.2422384, -0.3984393, 2.43881, 0, 0.3803922, 1, 1,
0.2429615, -0.7388635, 2.956664, 0, 0.3764706, 1, 1,
0.2441176, -0.3233991, 0.31337, 0, 0.3686275, 1, 1,
0.2448242, -0.7366149, 2.275854, 0, 0.3647059, 1, 1,
0.2584315, 1.330576, -1.489248, 0, 0.3568628, 1, 1,
0.2595733, 0.3137847, -0.02076227, 0, 0.3529412, 1, 1,
0.2634521, 0.09141077, 1.290519, 0, 0.345098, 1, 1,
0.2637668, 0.3349618, -0.2630349, 0, 0.3411765, 1, 1,
0.2638804, -0.576319, 1.365858, 0, 0.3333333, 1, 1,
0.2702411, -1.81647, 2.008905, 0, 0.3294118, 1, 1,
0.2715444, 0.5889655, 0.9020801, 0, 0.3215686, 1, 1,
0.2741402, 0.9525781, 2.036344, 0, 0.3176471, 1, 1,
0.2761823, 0.09086587, 2.045207, 0, 0.3098039, 1, 1,
0.2842624, 0.4971579, -0.09345629, 0, 0.3058824, 1, 1,
0.2887167, -2.61354, 2.512292, 0, 0.2980392, 1, 1,
0.294178, 2.223181, -0.7868477, 0, 0.2901961, 1, 1,
0.2953537, -1.746058, 3.303225, 0, 0.2862745, 1, 1,
0.2963271, 0.5762164, -0.5052271, 0, 0.2784314, 1, 1,
0.2969633, -0.566269, 1.620646, 0, 0.2745098, 1, 1,
0.2977221, -0.815832, 3.219865, 0, 0.2666667, 1, 1,
0.2981585, 0.815559, 1.550522, 0, 0.2627451, 1, 1,
0.3033883, 0.196176, 0.6853942, 0, 0.254902, 1, 1,
0.3045119, 0.06492998, 2.655067, 0, 0.2509804, 1, 1,
0.3078857, 0.2124427, 2.292641, 0, 0.2431373, 1, 1,
0.3130476, 1.433153, 1.487553, 0, 0.2392157, 1, 1,
0.314289, -1.615472, 2.022365, 0, 0.2313726, 1, 1,
0.3212584, 0.1150434, 0.3659247, 0, 0.227451, 1, 1,
0.322334, 0.6627736, 1.722662, 0, 0.2196078, 1, 1,
0.3232074, -0.163448, 0.9718738, 0, 0.2156863, 1, 1,
0.3236084, 1.435954, -0.1276005, 0, 0.2078431, 1, 1,
0.3242619, 0.2604171, 2.193541, 0, 0.2039216, 1, 1,
0.327725, 0.8158681, 0.7375517, 0, 0.1960784, 1, 1,
0.3293303, 1.924512, -2.370209, 0, 0.1882353, 1, 1,
0.3295901, -0.3211864, 1.594601, 0, 0.1843137, 1, 1,
0.3348529, 0.2278644, 1.18045, 0, 0.1764706, 1, 1,
0.3414077, -0.9027649, 3.695218, 0, 0.172549, 1, 1,
0.3503139, 0.4978432, 0.4215738, 0, 0.1647059, 1, 1,
0.3504835, -1.511086, 1.382576, 0, 0.1607843, 1, 1,
0.3519095, -1.000795, 2.898463, 0, 0.1529412, 1, 1,
0.3554724, 1.756644, 2.178001, 0, 0.1490196, 1, 1,
0.358932, 0.5016375, 1.164185, 0, 0.1411765, 1, 1,
0.3625024, -2.409592, 3.333168, 0, 0.1372549, 1, 1,
0.362785, -0.9468267, 3.169684, 0, 0.1294118, 1, 1,
0.3673792, -1.328351, 2.685834, 0, 0.1254902, 1, 1,
0.3740672, 0.3901905, 0.0838466, 0, 0.1176471, 1, 1,
0.379749, -0.1890542, 1.369973, 0, 0.1137255, 1, 1,
0.3811443, 0.9072763, 1.006447, 0, 0.1058824, 1, 1,
0.38131, 0.6175691, 0.04197421, 0, 0.09803922, 1, 1,
0.3826105, 1.17821, -2.21492, 0, 0.09411765, 1, 1,
0.3894872, -0.24886, 2.150099, 0, 0.08627451, 1, 1,
0.3895259, 1.362406, 1.18263, 0, 0.08235294, 1, 1,
0.3906571, -0.1327563, 2.782665, 0, 0.07450981, 1, 1,
0.3915789, 1.778188, -1.09473, 0, 0.07058824, 1, 1,
0.3944034, 0.9485475, -0.5539998, 0, 0.0627451, 1, 1,
0.3945328, 0.182908, 2.39991, 0, 0.05882353, 1, 1,
0.3974672, -0.3540213, 3.047507, 0, 0.05098039, 1, 1,
0.3988383, -0.2966914, 2.845805, 0, 0.04705882, 1, 1,
0.3989898, 0.5954521, 1.159256, 0, 0.03921569, 1, 1,
0.4076695, 0.06923003, 1.82876, 0, 0.03529412, 1, 1,
0.4093483, 0.926262, 0.7547476, 0, 0.02745098, 1, 1,
0.4099343, 0.6269847, 0.3322319, 0, 0.02352941, 1, 1,
0.4156342, 0.2918273, -0.9280122, 0, 0.01568628, 1, 1,
0.4197761, -0.2110482, 3.676676, 0, 0.01176471, 1, 1,
0.4252439, 0.06080547, 2.771184, 0, 0.003921569, 1, 1,
0.4263753, 2.112335, -0.7108687, 0.003921569, 0, 1, 1,
0.4278745, -2.15644, 3.243695, 0.007843138, 0, 1, 1,
0.4314209, -1.059351, 4.297462, 0.01568628, 0, 1, 1,
0.4321494, 0.6011428, 0.4281741, 0.01960784, 0, 1, 1,
0.4327545, 0.3390006, 1.570605, 0.02745098, 0, 1, 1,
0.4338216, -1.181234, 0.966872, 0.03137255, 0, 1, 1,
0.4565063, 0.335981, 3.027454, 0.03921569, 0, 1, 1,
0.4572117, 1.560072, -0.8165745, 0.04313726, 0, 1, 1,
0.4579459, -0.1678416, 4.341354, 0.05098039, 0, 1, 1,
0.4585303, -0.02615237, 1.301082, 0.05490196, 0, 1, 1,
0.4605614, 0.4421194, 0.4037736, 0.0627451, 0, 1, 1,
0.4616178, -0.04538839, 0.9479904, 0.06666667, 0, 1, 1,
0.4620954, -1.562999, 0.2131689, 0.07450981, 0, 1, 1,
0.4631935, -2.306307, 2.950622, 0.07843138, 0, 1, 1,
0.4641108, 0.5128409, 0.3365272, 0.08627451, 0, 1, 1,
0.4722341, 1.457269, 1.169172, 0.09019608, 0, 1, 1,
0.474042, -0.8057503, 2.604014, 0.09803922, 0, 1, 1,
0.4745717, -1.224905, 2.983765, 0.1058824, 0, 1, 1,
0.476931, 0.02121028, 1.772033, 0.1098039, 0, 1, 1,
0.4772356, 0.3660106, -0.2949385, 0.1176471, 0, 1, 1,
0.4786587, -0.03702809, 2.732596, 0.1215686, 0, 1, 1,
0.4803568, -0.06939968, 1.048788, 0.1294118, 0, 1, 1,
0.4811332, -0.3304431, 2.326928, 0.1333333, 0, 1, 1,
0.4841203, -0.4893243, 3.718497, 0.1411765, 0, 1, 1,
0.4910526, 0.4126891, -1.330734, 0.145098, 0, 1, 1,
0.4925186, 0.5304939, 0.8444862, 0.1529412, 0, 1, 1,
0.492946, 2.152857, -0.6188181, 0.1568628, 0, 1, 1,
0.4966635, 0.1887539, 0.2097406, 0.1647059, 0, 1, 1,
0.4996915, -0.9412288, 1.132006, 0.1686275, 0, 1, 1,
0.5000818, 0.6585549, 0.7129952, 0.1764706, 0, 1, 1,
0.5053439, -0.1337035, 2.367286, 0.1803922, 0, 1, 1,
0.5097623, 0.469039, 1.428515, 0.1882353, 0, 1, 1,
0.5105677, -0.6826672, 2.846936, 0.1921569, 0, 1, 1,
0.5162821, -0.2245051, 0.4988278, 0.2, 0, 1, 1,
0.5189655, -0.2316292, 1.741767, 0.2078431, 0, 1, 1,
0.5199145, 0.6675599, 1.426993, 0.2117647, 0, 1, 1,
0.5241013, -2.544863, 2.898867, 0.2196078, 0, 1, 1,
0.5252686, 0.6439068, 0.8928252, 0.2235294, 0, 1, 1,
0.5256761, -0.8504457, 1.499469, 0.2313726, 0, 1, 1,
0.5258872, -0.06881076, 1.91534, 0.2352941, 0, 1, 1,
0.5264784, 1.231252, 0.08701941, 0.2431373, 0, 1, 1,
0.5274454, -0.6186835, 3.205827, 0.2470588, 0, 1, 1,
0.527562, 0.5584409, 0.7634524, 0.254902, 0, 1, 1,
0.5304106, 1.127426, 0.5328875, 0.2588235, 0, 1, 1,
0.5320443, 1.384817, 0.7389035, 0.2666667, 0, 1, 1,
0.5405743, -0.3138203, 2.582506, 0.2705882, 0, 1, 1,
0.5451833, -0.5804588, 1.183756, 0.2784314, 0, 1, 1,
0.5461291, 0.4021029, 1.43815, 0.282353, 0, 1, 1,
0.5490617, -0.4259081, 2.183457, 0.2901961, 0, 1, 1,
0.552393, 1.527986, -0.1886313, 0.2941177, 0, 1, 1,
0.5528535, 1.020959, -0.9538697, 0.3019608, 0, 1, 1,
0.5542423, -0.2819829, 1.394308, 0.3098039, 0, 1, 1,
0.5572662, -0.3545074, 1.010834, 0.3137255, 0, 1, 1,
0.5598962, -0.9549841, 1.786657, 0.3215686, 0, 1, 1,
0.5604019, 0.213796, -0.3286476, 0.3254902, 0, 1, 1,
0.5696483, 0.8735623, 0.3394043, 0.3333333, 0, 1, 1,
0.5705604, 0.5771133, 1.4081, 0.3372549, 0, 1, 1,
0.5727057, -1.025469, 3.118141, 0.345098, 0, 1, 1,
0.5730612, 1.295887, 0.9590656, 0.3490196, 0, 1, 1,
0.5765917, 0.6080091, 1.403407, 0.3568628, 0, 1, 1,
0.5782749, -2.725921, 2.503431, 0.3607843, 0, 1, 1,
0.5814712, 2.226287, 1.449738, 0.3686275, 0, 1, 1,
0.5919374, 0.5670429, 0.3714653, 0.372549, 0, 1, 1,
0.5931913, -1.041494, 1.806797, 0.3803922, 0, 1, 1,
0.5937414, 0.4277398, 0.3954676, 0.3843137, 0, 1, 1,
0.593911, 0.8173926, 0.5453627, 0.3921569, 0, 1, 1,
0.5943277, 2.80477, 0.02070724, 0.3960784, 0, 1, 1,
0.5951397, -0.8960686, 3.192525, 0.4039216, 0, 1, 1,
0.5976409, 0.6521596, 1.755178, 0.4117647, 0, 1, 1,
0.6048677, -0.04214301, 1.557498, 0.4156863, 0, 1, 1,
0.6104397, -0.6466098, 3.132972, 0.4235294, 0, 1, 1,
0.6104448, 0.660788, 1.72422, 0.427451, 0, 1, 1,
0.6203696, -0.01514009, 3.732394, 0.4352941, 0, 1, 1,
0.6220176, -0.7947421, 3.412313, 0.4392157, 0, 1, 1,
0.6248948, -0.3023464, 2.671618, 0.4470588, 0, 1, 1,
0.6329139, -1.387209, 2.257948, 0.4509804, 0, 1, 1,
0.6365193, 0.564986, -1.793723, 0.4588235, 0, 1, 1,
0.6394005, -1.341769, 2.023563, 0.4627451, 0, 1, 1,
0.6395165, 0.06744862, 1.172065, 0.4705882, 0, 1, 1,
0.6408954, -1.350996, 2.536532, 0.4745098, 0, 1, 1,
0.6429045, 1.132296, 1.629337, 0.4823529, 0, 1, 1,
0.6466311, 0.5258601, 1.949131, 0.4862745, 0, 1, 1,
0.6473172, 0.4398264, 2.096864, 0.4941176, 0, 1, 1,
0.64931, -1.889705, 3.11735, 0.5019608, 0, 1, 1,
0.6594793, -0.2148799, 0.6466683, 0.5058824, 0, 1, 1,
0.6631159, -0.9341205, 2.65652, 0.5137255, 0, 1, 1,
0.664079, -0.8448972, 2.698338, 0.5176471, 0, 1, 1,
0.6647822, 0.5493015, 1.635269, 0.5254902, 0, 1, 1,
0.6673248, 0.02464338, 1.289171, 0.5294118, 0, 1, 1,
0.671465, -0.1400236, 0.8474809, 0.5372549, 0, 1, 1,
0.6766888, -0.173127, 1.750946, 0.5411765, 0, 1, 1,
0.6854954, 1.819461, -0.05500999, 0.5490196, 0, 1, 1,
0.6882172, 0.2175449, 1.207311, 0.5529412, 0, 1, 1,
0.6897088, -0.07614296, 2.391961, 0.5607843, 0, 1, 1,
0.6916091, -0.05029594, 1.585036, 0.5647059, 0, 1, 1,
0.6959137, -0.6325665, 1.046792, 0.572549, 0, 1, 1,
0.7009735, -0.2746731, 0.9520725, 0.5764706, 0, 1, 1,
0.7019882, 0.3002493, 1.770598, 0.5843138, 0, 1, 1,
0.7043446, 1.615378, 0.2577266, 0.5882353, 0, 1, 1,
0.7054977, -0.3634022, 1.831475, 0.5960785, 0, 1, 1,
0.7072005, 0.4607554, 0.7733381, 0.6039216, 0, 1, 1,
0.7104431, -0.64889, 1.657547, 0.6078432, 0, 1, 1,
0.7130989, 1.251985, 1.520355, 0.6156863, 0, 1, 1,
0.7154715, -1.241026, 3.77877, 0.6196079, 0, 1, 1,
0.720788, -0.3441095, 2.139193, 0.627451, 0, 1, 1,
0.7237837, 0.8228715, -1.109509, 0.6313726, 0, 1, 1,
0.725733, 1.404023, 1.424231, 0.6392157, 0, 1, 1,
0.7275615, -0.4187124, 4.150484, 0.6431373, 0, 1, 1,
0.7309804, 0.09469154, 4.060802, 0.6509804, 0, 1, 1,
0.733761, -1.586259, 2.05484, 0.654902, 0, 1, 1,
0.7358372, 1.31697, 0.7722183, 0.6627451, 0, 1, 1,
0.7366511, 0.2607571, 3.904437, 0.6666667, 0, 1, 1,
0.7455593, 0.4692264, 1.859012, 0.6745098, 0, 1, 1,
0.7512523, -0.5270762, 0.7153168, 0.6784314, 0, 1, 1,
0.7571859, 0.1514285, 2.248769, 0.6862745, 0, 1, 1,
0.7604876, 0.03004575, -0.1552787, 0.6901961, 0, 1, 1,
0.7665291, 0.1623763, 0.475883, 0.6980392, 0, 1, 1,
0.7678676, -1.057498, 1.971833, 0.7058824, 0, 1, 1,
0.7702098, 0.8252616, -1.80459, 0.7098039, 0, 1, 1,
0.7727402, -1.451276, 3.108145, 0.7176471, 0, 1, 1,
0.776206, -0.4242964, 2.928913, 0.7215686, 0, 1, 1,
0.7777119, 0.2276538, 1.119201, 0.7294118, 0, 1, 1,
0.7823256, 1.562549, -0.3397748, 0.7333333, 0, 1, 1,
0.7826532, 1.243534, 1.258119, 0.7411765, 0, 1, 1,
0.7890722, 1.234545, 1.309096, 0.7450981, 0, 1, 1,
0.7921332, 1.015323, 0.1764937, 0.7529412, 0, 1, 1,
0.7930919, 0.1236892, 1.530503, 0.7568628, 0, 1, 1,
0.7988446, -0.9539388, 1.639622, 0.7647059, 0, 1, 1,
0.7997695, 0.4527147, 1.268985, 0.7686275, 0, 1, 1,
0.8004502, 0.8032027, -0.04461696, 0.7764706, 0, 1, 1,
0.800933, 0.757955, -0.3548853, 0.7803922, 0, 1, 1,
0.8054243, 0.2112174, 1.155906, 0.7882353, 0, 1, 1,
0.8063761, 1.73236, 0.5731117, 0.7921569, 0, 1, 1,
0.8136547, -1.770463, 3.784892, 0.8, 0, 1, 1,
0.8136731, -0.7603449, 3.469511, 0.8078431, 0, 1, 1,
0.8168855, -0.2886231, 0.8178822, 0.8117647, 0, 1, 1,
0.8172708, 0.3987827, 1.933604, 0.8196079, 0, 1, 1,
0.8368795, 1.749425, 0.7957636, 0.8235294, 0, 1, 1,
0.8395472, -0.4106214, 2.230095, 0.8313726, 0, 1, 1,
0.841424, 0.6240456, 1.536326, 0.8352941, 0, 1, 1,
0.8433904, -0.3950833, 0.1106282, 0.8431373, 0, 1, 1,
0.8516514, 0.4619053, -1.599528, 0.8470588, 0, 1, 1,
0.8545772, -0.226232, 1.991177, 0.854902, 0, 1, 1,
0.8566432, -1.012806, 1.437042, 0.8588235, 0, 1, 1,
0.8566712, 2.37964, -0.09842106, 0.8666667, 0, 1, 1,
0.8593705, 0.07684075, 0.3672325, 0.8705882, 0, 1, 1,
0.8637357, -2.479099, 2.599661, 0.8784314, 0, 1, 1,
0.8653435, -0.6190053, 1.36008, 0.8823529, 0, 1, 1,
0.8698157, -0.1579502, 0.1898551, 0.8901961, 0, 1, 1,
0.880539, 0.9285049, 0.7607646, 0.8941177, 0, 1, 1,
0.8824717, -0.4011838, 0.5090595, 0.9019608, 0, 1, 1,
0.8836997, 1.039196, 0.9889438, 0.9098039, 0, 1, 1,
0.8845822, 0.1779574, 1.530885, 0.9137255, 0, 1, 1,
0.8857021, 0.137814, 0.9980089, 0.9215686, 0, 1, 1,
0.8874794, 0.5479336, 0.8559312, 0.9254902, 0, 1, 1,
0.8895405, 0.9671752, -0.5483398, 0.9333333, 0, 1, 1,
0.8946598, -1.193314, 1.959052, 0.9372549, 0, 1, 1,
0.9017265, -0.7844985, 1.909569, 0.945098, 0, 1, 1,
0.9073693, 0.6880122, -0.7522302, 0.9490196, 0, 1, 1,
0.9324619, 1.57873, 1.108385, 0.9568627, 0, 1, 1,
0.9331323, 0.8960127, 2.221204, 0.9607843, 0, 1, 1,
0.9343138, 0.3693195, 3.612673, 0.9686275, 0, 1, 1,
0.9349545, 0.9126481, 0.8986881, 0.972549, 0, 1, 1,
0.9430144, 0.3008223, 2.17532, 0.9803922, 0, 1, 1,
0.9446155, -0.5597242, 1.170709, 0.9843137, 0, 1, 1,
0.9515888, 0.1092177, 1.863997, 0.9921569, 0, 1, 1,
0.9581066, 0.5309046, 3.253364, 0.9960784, 0, 1, 1,
0.9610699, 0.1866826, 1.364771, 1, 0, 0.9960784, 1,
0.9714631, -1.87417, 3.333008, 1, 0, 0.9882353, 1,
0.9728775, 0.1707834, 2.97225, 1, 0, 0.9843137, 1,
0.9803193, -0.4931583, 1.22167, 1, 0, 0.9764706, 1,
0.983139, 1.974021, 1.944342, 1, 0, 0.972549, 1,
0.9859442, -0.1811047, 2.58403, 1, 0, 0.9647059, 1,
0.9881234, -1.094421, 2.444678, 1, 0, 0.9607843, 1,
0.9887078, 0.7595958, 1.595575, 1, 0, 0.9529412, 1,
0.9891362, 0.03998088, 1.605923, 1, 0, 0.9490196, 1,
0.9925224, -0.235407, 1.662179, 1, 0, 0.9411765, 1,
1.000963, 0.09777709, 1.285301, 1, 0, 0.9372549, 1,
1.003827, -0.4892367, 1.757561, 1, 0, 0.9294118, 1,
1.007185, -0.4028488, 3.20632, 1, 0, 0.9254902, 1,
1.012647, 0.5192173, 1.034911, 1, 0, 0.9176471, 1,
1.013745, 0.9138075, 0.5388618, 1, 0, 0.9137255, 1,
1.01659, 1.582906, 0.4062475, 1, 0, 0.9058824, 1,
1.020562, -1.008522, 1.860743, 1, 0, 0.9019608, 1,
1.026214, 0.76099, 0.8316192, 1, 0, 0.8941177, 1,
1.02758, -0.5321804, 1.651174, 1, 0, 0.8862745, 1,
1.033951, 0.5055564, 1.065324, 1, 0, 0.8823529, 1,
1.036392, 1.649025, -0.9172542, 1, 0, 0.8745098, 1,
1.04722, 1.036486, 0.8689067, 1, 0, 0.8705882, 1,
1.047514, 2.084286, 0.7470629, 1, 0, 0.8627451, 1,
1.05628, -1.648774, 2.378293, 1, 0, 0.8588235, 1,
1.056309, 0.8249219, 0.5235702, 1, 0, 0.8509804, 1,
1.06107, 1.677039, 1.2531, 1, 0, 0.8470588, 1,
1.065951, 0.7523882, 1.001387, 1, 0, 0.8392157, 1,
1.070964, 0.1625706, 0.3560858, 1, 0, 0.8352941, 1,
1.080544, 0.5115263, 0.9683145, 1, 0, 0.827451, 1,
1.084371, 1.481129, 0.5212378, 1, 0, 0.8235294, 1,
1.091781, 0.9719359, -0.4039938, 1, 0, 0.8156863, 1,
1.093811, -2.042008, 2.3619, 1, 0, 0.8117647, 1,
1.099036, 0.4823372, 0.1936606, 1, 0, 0.8039216, 1,
1.103976, 1.117042, 0.2202689, 1, 0, 0.7960784, 1,
1.106436, -1.294514, 2.505889, 1, 0, 0.7921569, 1,
1.107923, -3.020999, 2.99255, 1, 0, 0.7843137, 1,
1.109113, -0.759567, 1.63364, 1, 0, 0.7803922, 1,
1.110096, 0.775602, 0.7978243, 1, 0, 0.772549, 1,
1.125723, 1.464623, 0.8905746, 1, 0, 0.7686275, 1,
1.126402, -0.2340973, 1.597865, 1, 0, 0.7607843, 1,
1.133217, -0.008950771, 1.628329, 1, 0, 0.7568628, 1,
1.137542, -0.3302487, 2.536757, 1, 0, 0.7490196, 1,
1.139761, -1.980308, 2.035522, 1, 0, 0.7450981, 1,
1.143548, 0.356011, 1.756991, 1, 0, 0.7372549, 1,
1.163872, -0.4769515, 3.219676, 1, 0, 0.7333333, 1,
1.165121, 1.308053, -0.7709293, 1, 0, 0.7254902, 1,
1.171372, 0.972788, 1.92123, 1, 0, 0.7215686, 1,
1.174837, 0.8547151, 0.1030395, 1, 0, 0.7137255, 1,
1.177055, 0.8846112, 0.9916192, 1, 0, 0.7098039, 1,
1.184079, 0.2818259, 1.397393, 1, 0, 0.7019608, 1,
1.194799, -0.9654052, 0.7352979, 1, 0, 0.6941177, 1,
1.197622, 1.54622, 2.145025, 1, 0, 0.6901961, 1,
1.205683, -1.457582, 2.672145, 1, 0, 0.682353, 1,
1.217713, -1.209012, 2.786036, 1, 0, 0.6784314, 1,
1.217822, 0.3679959, 3.250329, 1, 0, 0.6705883, 1,
1.230609, -1.286712, 3.655587, 1, 0, 0.6666667, 1,
1.240348, -1.439514, 3.422536, 1, 0, 0.6588235, 1,
1.248028, 0.7800953, 0.181068, 1, 0, 0.654902, 1,
1.250621, -0.149194, 0.6119666, 1, 0, 0.6470588, 1,
1.251642, -1.156069, 2.10727, 1, 0, 0.6431373, 1,
1.255822, -0.4609118, 3.416048, 1, 0, 0.6352941, 1,
1.263821, -0.9762951, 2.938371, 1, 0, 0.6313726, 1,
1.267737, -1.088611, 3.108077, 1, 0, 0.6235294, 1,
1.272618, 1.675864, 2.733123, 1, 0, 0.6196079, 1,
1.276521, 1.117687, 2.102857, 1, 0, 0.6117647, 1,
1.281125, 1.322836, 0.7262479, 1, 0, 0.6078432, 1,
1.281332, 1.671704, -0.5004895, 1, 0, 0.6, 1,
1.281971, -0.305186, 2.57934, 1, 0, 0.5921569, 1,
1.285259, -0.3004479, 1.028719, 1, 0, 0.5882353, 1,
1.286616, 0.1753217, 1.487004, 1, 0, 0.5803922, 1,
1.294775, -0.2532418, 2.40396, 1, 0, 0.5764706, 1,
1.305784, -0.4891306, 2.431943, 1, 0, 0.5686275, 1,
1.316375, -0.6411985, -0.1748248, 1, 0, 0.5647059, 1,
1.319605, -1.048007, 2.540234, 1, 0, 0.5568628, 1,
1.319772, -0.3779135, 1.754883, 1, 0, 0.5529412, 1,
1.331785, 1.01546, 1.323004, 1, 0, 0.5450981, 1,
1.337841, 0.560065, 2.646922, 1, 0, 0.5411765, 1,
1.348368, 1.041679, -0.06287775, 1, 0, 0.5333334, 1,
1.355937, 0.9957952, 0.6209686, 1, 0, 0.5294118, 1,
1.359776, 1.461, 0.05663125, 1, 0, 0.5215687, 1,
1.361535, 0.952452, 1.587511, 1, 0, 0.5176471, 1,
1.363809, 1.210841, -0.008835638, 1, 0, 0.509804, 1,
1.36523, -1.708316, 2.976844, 1, 0, 0.5058824, 1,
1.371518, -0.7633712, 1.587471, 1, 0, 0.4980392, 1,
1.373565, -0.1995131, 0.7189369, 1, 0, 0.4901961, 1,
1.375095, -0.3335911, 0.8258627, 1, 0, 0.4862745, 1,
1.379486, -0.6347209, 2.257285, 1, 0, 0.4784314, 1,
1.395021, 0.4283917, 0.5393158, 1, 0, 0.4745098, 1,
1.398151, -0.02630008, 1.477716, 1, 0, 0.4666667, 1,
1.401643, 0.1123481, 0.3756422, 1, 0, 0.4627451, 1,
1.407602, 1.125246, 0.5947797, 1, 0, 0.454902, 1,
1.413393, 0.4263318, 2.645791, 1, 0, 0.4509804, 1,
1.415539, -1.756825, 2.617048, 1, 0, 0.4431373, 1,
1.439655, 0.04389051, 1.603781, 1, 0, 0.4392157, 1,
1.453109, -0.9345948, 2.648293, 1, 0, 0.4313726, 1,
1.453799, -0.9037969, 1.74659, 1, 0, 0.427451, 1,
1.456277, -0.1635773, 2.013064, 1, 0, 0.4196078, 1,
1.470867, -0.07700043, 2.015523, 1, 0, 0.4156863, 1,
1.483198, -0.8177264, 2.384003, 1, 0, 0.4078431, 1,
1.504583, 0.2104876, 2.549407, 1, 0, 0.4039216, 1,
1.520055, 0.6453069, 1.618869, 1, 0, 0.3960784, 1,
1.52207, 0.9747933, 0.01719955, 1, 0, 0.3882353, 1,
1.525045, 1.189173, -0.278796, 1, 0, 0.3843137, 1,
1.525967, -0.8156086, 1.882101, 1, 0, 0.3764706, 1,
1.532216, -0.1199967, 1.729378, 1, 0, 0.372549, 1,
1.53737, 1.457001, -0.8822995, 1, 0, 0.3647059, 1,
1.546844, 0.4526215, -0.08996444, 1, 0, 0.3607843, 1,
1.547555, -0.1277096, 0.9400477, 1, 0, 0.3529412, 1,
1.548239, -1.450899, 2.454685, 1, 0, 0.3490196, 1,
1.554436, 0.1938188, 1.560043, 1, 0, 0.3411765, 1,
1.55854, -3.204463, 2.309805, 1, 0, 0.3372549, 1,
1.576693, -0.2605482, 2.973159, 1, 0, 0.3294118, 1,
1.582881, 1.132402, 0.3273023, 1, 0, 0.3254902, 1,
1.602698, -0.05297712, 1.443611, 1, 0, 0.3176471, 1,
1.604899, -1.457603, 2.281852, 1, 0, 0.3137255, 1,
1.608196, -1.439462, 2.004615, 1, 0, 0.3058824, 1,
1.618905, 0.9773403, 2.39978, 1, 0, 0.2980392, 1,
1.625838, -0.3634956, 0.9738468, 1, 0, 0.2941177, 1,
1.641904, -0.6833593, 4.002992, 1, 0, 0.2862745, 1,
1.679736, 0.09268252, 1.973678, 1, 0, 0.282353, 1,
1.694478, 0.3255321, 1.958619, 1, 0, 0.2745098, 1,
1.705914, -1.504431, 2.740892, 1, 0, 0.2705882, 1,
1.716974, 0.5198503, 0.8445839, 1, 0, 0.2627451, 1,
1.739611, -0.3903702, 3.284799, 1, 0, 0.2588235, 1,
1.743049, 1.315323, 0.5981038, 1, 0, 0.2509804, 1,
1.754786, -0.1240889, 3.209946, 1, 0, 0.2470588, 1,
1.764323, 0.1935683, 0.8707285, 1, 0, 0.2392157, 1,
1.770426, -0.5679437, 2.855522, 1, 0, 0.2352941, 1,
1.774299, 0.5783605, 2.1255, 1, 0, 0.227451, 1,
1.789842, 0.2998598, 1.582835, 1, 0, 0.2235294, 1,
1.792204, 0.6534446, 1.347199, 1, 0, 0.2156863, 1,
1.81917, -0.266993, 2.057009, 1, 0, 0.2117647, 1,
1.833966, 0.5795645, 1.356228, 1, 0, 0.2039216, 1,
1.83767, -0.2589684, 3.286785, 1, 0, 0.1960784, 1,
1.838029, -1.220409, 2.893176, 1, 0, 0.1921569, 1,
1.886682, 0.4443931, 2.319681, 1, 0, 0.1843137, 1,
1.892778, 0.8194531, 2.180369, 1, 0, 0.1803922, 1,
1.918043, -0.2848837, 3.025535, 1, 0, 0.172549, 1,
1.969345, 1.096981, -0.04930282, 1, 0, 0.1686275, 1,
1.971692, 1.028876, 0.2850465, 1, 0, 0.1607843, 1,
1.980283, -0.2949019, 1.453979, 1, 0, 0.1568628, 1,
1.981578, -0.3711868, 0.513868, 1, 0, 0.1490196, 1,
2.069664, -1.332798, 1.027614, 1, 0, 0.145098, 1,
2.083812, -0.9157456, -0.3573073, 1, 0, 0.1372549, 1,
2.085838, 0.9093361, 1.356476, 1, 0, 0.1333333, 1,
2.131842, -0.05812663, 1.689828, 1, 0, 0.1254902, 1,
2.138714, 1.53245, 2.357006, 1, 0, 0.1215686, 1,
2.146285, -0.3860417, 1.353556, 1, 0, 0.1137255, 1,
2.151012, 0.3273108, 1.971171, 1, 0, 0.1098039, 1,
2.153305, 0.2240562, 4.023239, 1, 0, 0.1019608, 1,
2.166076, -0.8816001, 1.143795, 1, 0, 0.09411765, 1,
2.171806, -0.3706958, 1.171805, 1, 0, 0.09019608, 1,
2.184374, 0.6122496, 2.268325, 1, 0, 0.08235294, 1,
2.213639, 0.740932, 2.986533, 1, 0, 0.07843138, 1,
2.232626, -0.5720969, 1.05956, 1, 0, 0.07058824, 1,
2.242819, -0.9741277, 3.44791, 1, 0, 0.06666667, 1,
2.249471, -0.1909797, 1.415151, 1, 0, 0.05882353, 1,
2.310925, 0.5900926, 1.863355, 1, 0, 0.05490196, 1,
2.347124, 1.577637, 0.7728456, 1, 0, 0.04705882, 1,
2.411755, -0.8902894, -0.3969975, 1, 0, 0.04313726, 1,
2.42283, -0.162899, -0.009228402, 1, 0, 0.03529412, 1,
2.47315, 0.053385, 1.449012, 1, 0, 0.03137255, 1,
2.727117, -0.6657386, 0.8672508, 1, 0, 0.02352941, 1,
2.913539, -0.2751328, 2.974585, 1, 0, 0.01960784, 1,
2.954751, -0.1237948, 3.767586, 1, 0, 0.01176471, 1,
3.207243, 0.7261585, 2.09587, 1, 0, 0.007843138, 1
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
0.0187906, -4.395164, -6.388294, 0, -0.5, 0.5, 0.5,
0.0187906, -4.395164, -6.388294, 1, -0.5, 0.5, 0.5,
0.0187906, -4.395164, -6.388294, 1, 1.5, 0.5, 0.5,
0.0187906, -4.395164, -6.388294, 0, 1.5, 0.5, 0.5
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
-4.250547, 0.3079321, -6.388294, 0, -0.5, 0.5, 0.5,
-4.250547, 0.3079321, -6.388294, 1, -0.5, 0.5, 0.5,
-4.250547, 0.3079321, -6.388294, 1, 1.5, 0.5, 0.5,
-4.250547, 0.3079321, -6.388294, 0, 1.5, 0.5, 0.5
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
-4.250547, -4.395164, -0.2459261, 0, -0.5, 0.5, 0.5,
-4.250547, -4.395164, -0.2459261, 1, -0.5, 0.5, 0.5,
-4.250547, -4.395164, -0.2459261, 1, 1.5, 0.5, 0.5,
-4.250547, -4.395164, -0.2459261, 0, 1.5, 0.5, 0.5
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
-3, -3.309835, -4.970825,
3, -3.309835, -4.970825,
-3, -3.309835, -4.970825,
-3, -3.490723, -5.207069,
-2, -3.309835, -4.970825,
-2, -3.490723, -5.207069,
-1, -3.309835, -4.970825,
-1, -3.490723, -5.207069,
0, -3.309835, -4.970825,
0, -3.490723, -5.207069,
1, -3.309835, -4.970825,
1, -3.490723, -5.207069,
2, -3.309835, -4.970825,
2, -3.490723, -5.207069,
3, -3.309835, -4.970825,
3, -3.490723, -5.207069
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
-3, -3.8525, -5.679559, 0, -0.5, 0.5, 0.5,
-3, -3.8525, -5.679559, 1, -0.5, 0.5, 0.5,
-3, -3.8525, -5.679559, 1, 1.5, 0.5, 0.5,
-3, -3.8525, -5.679559, 0, 1.5, 0.5, 0.5,
-2, -3.8525, -5.679559, 0, -0.5, 0.5, 0.5,
-2, -3.8525, -5.679559, 1, -0.5, 0.5, 0.5,
-2, -3.8525, -5.679559, 1, 1.5, 0.5, 0.5,
-2, -3.8525, -5.679559, 0, 1.5, 0.5, 0.5,
-1, -3.8525, -5.679559, 0, -0.5, 0.5, 0.5,
-1, -3.8525, -5.679559, 1, -0.5, 0.5, 0.5,
-1, -3.8525, -5.679559, 1, 1.5, 0.5, 0.5,
-1, -3.8525, -5.679559, 0, 1.5, 0.5, 0.5,
0, -3.8525, -5.679559, 0, -0.5, 0.5, 0.5,
0, -3.8525, -5.679559, 1, -0.5, 0.5, 0.5,
0, -3.8525, -5.679559, 1, 1.5, 0.5, 0.5,
0, -3.8525, -5.679559, 0, 1.5, 0.5, 0.5,
1, -3.8525, -5.679559, 0, -0.5, 0.5, 0.5,
1, -3.8525, -5.679559, 1, -0.5, 0.5, 0.5,
1, -3.8525, -5.679559, 1, 1.5, 0.5, 0.5,
1, -3.8525, -5.679559, 0, 1.5, 0.5, 0.5,
2, -3.8525, -5.679559, 0, -0.5, 0.5, 0.5,
2, -3.8525, -5.679559, 1, -0.5, 0.5, 0.5,
2, -3.8525, -5.679559, 1, 1.5, 0.5, 0.5,
2, -3.8525, -5.679559, 0, 1.5, 0.5, 0.5,
3, -3.8525, -5.679559, 0, -0.5, 0.5, 0.5,
3, -3.8525, -5.679559, 1, -0.5, 0.5, 0.5,
3, -3.8525, -5.679559, 1, 1.5, 0.5, 0.5,
3, -3.8525, -5.679559, 0, 1.5, 0.5, 0.5
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
-3.265315, -2, -4.970825,
-3.265315, 2, -4.970825,
-3.265315, -2, -4.970825,
-3.429521, -2, -5.207069,
-3.265315, 0, -4.970825,
-3.429521, 0, -5.207069,
-3.265315, 2, -4.970825,
-3.429521, 2, -5.207069
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
-3.757931, -2, -5.679559, 0, -0.5, 0.5, 0.5,
-3.757931, -2, -5.679559, 1, -0.5, 0.5, 0.5,
-3.757931, -2, -5.679559, 1, 1.5, 0.5, 0.5,
-3.757931, -2, -5.679559, 0, 1.5, 0.5, 0.5,
-3.757931, 0, -5.679559, 0, -0.5, 0.5, 0.5,
-3.757931, 0, -5.679559, 1, -0.5, 0.5, 0.5,
-3.757931, 0, -5.679559, 1, 1.5, 0.5, 0.5,
-3.757931, 0, -5.679559, 0, 1.5, 0.5, 0.5,
-3.757931, 2, -5.679559, 0, -0.5, 0.5, 0.5,
-3.757931, 2, -5.679559, 1, -0.5, 0.5, 0.5,
-3.757931, 2, -5.679559, 1, 1.5, 0.5, 0.5,
-3.757931, 2, -5.679559, 0, 1.5, 0.5, 0.5
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
-3.265315, -3.309835, -4,
-3.265315, -3.309835, 4,
-3.265315, -3.309835, -4,
-3.429521, -3.490723, -4,
-3.265315, -3.309835, -2,
-3.429521, -3.490723, -2,
-3.265315, -3.309835, 0,
-3.429521, -3.490723, 0,
-3.265315, -3.309835, 2,
-3.429521, -3.490723, 2,
-3.265315, -3.309835, 4,
-3.429521, -3.490723, 4
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
-3.757931, -3.8525, -4, 0, -0.5, 0.5, 0.5,
-3.757931, -3.8525, -4, 1, -0.5, 0.5, 0.5,
-3.757931, -3.8525, -4, 1, 1.5, 0.5, 0.5,
-3.757931, -3.8525, -4, 0, 1.5, 0.5, 0.5,
-3.757931, -3.8525, -2, 0, -0.5, 0.5, 0.5,
-3.757931, -3.8525, -2, 1, -0.5, 0.5, 0.5,
-3.757931, -3.8525, -2, 1, 1.5, 0.5, 0.5,
-3.757931, -3.8525, -2, 0, 1.5, 0.5, 0.5,
-3.757931, -3.8525, 0, 0, -0.5, 0.5, 0.5,
-3.757931, -3.8525, 0, 1, -0.5, 0.5, 0.5,
-3.757931, -3.8525, 0, 1, 1.5, 0.5, 0.5,
-3.757931, -3.8525, 0, 0, 1.5, 0.5, 0.5,
-3.757931, -3.8525, 2, 0, -0.5, 0.5, 0.5,
-3.757931, -3.8525, 2, 1, -0.5, 0.5, 0.5,
-3.757931, -3.8525, 2, 1, 1.5, 0.5, 0.5,
-3.757931, -3.8525, 2, 0, 1.5, 0.5, 0.5,
-3.757931, -3.8525, 4, 0, -0.5, 0.5, 0.5,
-3.757931, -3.8525, 4, 1, -0.5, 0.5, 0.5,
-3.757931, -3.8525, 4, 1, 1.5, 0.5, 0.5,
-3.757931, -3.8525, 4, 0, 1.5, 0.5, 0.5
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
-3.265315, -3.309835, -4.970825,
-3.265315, 3.925699, -4.970825,
-3.265315, -3.309835, 4.478972,
-3.265315, 3.925699, 4.478972,
-3.265315, -3.309835, -4.970825,
-3.265315, -3.309835, 4.478972,
-3.265315, 3.925699, -4.970825,
-3.265315, 3.925699, 4.478972,
-3.265315, -3.309835, -4.970825,
3.302896, -3.309835, -4.970825,
-3.265315, -3.309835, 4.478972,
3.302896, -3.309835, 4.478972,
-3.265315, 3.925699, -4.970825,
3.302896, 3.925699, -4.970825,
-3.265315, 3.925699, 4.478972,
3.302896, 3.925699, 4.478972,
3.302896, -3.309835, -4.970825,
3.302896, 3.925699, -4.970825,
3.302896, -3.309835, 4.478972,
3.302896, 3.925699, 4.478972,
3.302896, -3.309835, -4.970825,
3.302896, -3.309835, 4.478972,
3.302896, 3.925699, -4.970825,
3.302896, 3.925699, 4.478972
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
var radius = 7.258857;
var distance = 32.29548;
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
mvMatrix.translate( -0.0187906, -0.3079321, 0.2459261 );
mvMatrix.scale( 1.194909, 1.084705, 0.8305383 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.29548);
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
naphthalene<-read.table("naphthalene.xyz")
```

```
## Error in read.table("naphthalene.xyz"): no lines available in input
```

```r
x<-naphthalene$V2
```

```
## Error in eval(expr, envir, enclos): object 'naphthalene' not found
```

```r
y<-naphthalene$V3
```

```
## Error in eval(expr, envir, enclos): object 'naphthalene' not found
```

```r
z<-naphthalene$V4
```

```
## Error in eval(expr, envir, enclos): object 'naphthalene' not found
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
-3.169662, 0.270957, -1.138291, 0, 0, 1, 1, 1,
-3.093515, -0.4734419, -1.713533, 1, 0, 0, 1, 1,
-2.936807, 0.8954104, 0.1056016, 1, 0, 0, 1, 1,
-2.833797, -0.6583942, -1.171067, 1, 0, 0, 1, 1,
-2.820703, -1.047734, -1.575415, 1, 0, 0, 1, 1,
-2.806828, 0.9436762, -2.177542, 1, 0, 0, 1, 1,
-2.732193, 1.04537, 1.008958, 0, 0, 0, 1, 1,
-2.501593, -1.083063, -2.522715, 0, 0, 0, 1, 1,
-2.461991, 0.2427466, -2.35416, 0, 0, 0, 1, 1,
-2.447391, -0.0636441, -3.061501, 0, 0, 0, 1, 1,
-2.444999, -0.5154019, -1.547619, 0, 0, 0, 1, 1,
-2.430546, -0.4432563, -2.657423, 0, 0, 0, 1, 1,
-2.37437, 0.07471391, -1.046863, 0, 0, 0, 1, 1,
-2.374073, 0.4717871, -1.496062, 1, 1, 1, 1, 1,
-2.362319, 0.5598701, -0.1275394, 1, 1, 1, 1, 1,
-2.302476, -0.08220176, -1.488876, 1, 1, 1, 1, 1,
-2.289025, -3.017599, -1.875429, 1, 1, 1, 1, 1,
-2.250599, -0.01237074, -2.338251, 1, 1, 1, 1, 1,
-2.249181, 0.229638, 0.2001877, 1, 1, 1, 1, 1,
-2.233999, 0.2821794, -2.320812, 1, 1, 1, 1, 1,
-2.227653, -0.8008612, -1.145876, 1, 1, 1, 1, 1,
-2.195654, -1.466814, -1.776817, 1, 1, 1, 1, 1,
-2.190432, -0.284305, -2.459985, 1, 1, 1, 1, 1,
-2.154493, 0.5072841, -1.731257, 1, 1, 1, 1, 1,
-2.144826, 0.4965806, -0.9950827, 1, 1, 1, 1, 1,
-2.1063, -1.103672, -0.1590945, 1, 1, 1, 1, 1,
-2.105856, -0.8304558, -2.623661, 1, 1, 1, 1, 1,
-2.095617, -0.788106, -1.031093, 1, 1, 1, 1, 1,
-2.069559, 0.7459788, -1.393206, 0, 0, 1, 1, 1,
-2.031379, -1.525799, -0.6072227, 1, 0, 0, 1, 1,
-1.998587, -0.4561524, -1.823493, 1, 0, 0, 1, 1,
-1.986602, -1.162613, -3.333544, 1, 0, 0, 1, 1,
-1.943454, -0.4584377, -1.433419, 1, 0, 0, 1, 1,
-1.867517, -1.333872, -1.738284, 1, 0, 0, 1, 1,
-1.866394, -1.16205, -1.691434, 0, 0, 0, 1, 1,
-1.846292, 0.8913696, -0.3697451, 0, 0, 0, 1, 1,
-1.841085, -2.050472, -2.67779, 0, 0, 0, 1, 1,
-1.838411, -0.563046, -0.6300153, 0, 0, 0, 1, 1,
-1.835786, 0.8769093, -1.671996, 0, 0, 0, 1, 1,
-1.821614, 2.694182, -1.50653, 0, 0, 0, 1, 1,
-1.790166, -0.5503801, -0.1963121, 0, 0, 0, 1, 1,
-1.780128, 0.7112379, -0.9586434, 1, 1, 1, 1, 1,
-1.764946, -0.03955098, -1.209307, 1, 1, 1, 1, 1,
-1.759479, 1.207856, 0.03202441, 1, 1, 1, 1, 1,
-1.758796, 0.8614797, -1.17937, 1, 1, 1, 1, 1,
-1.741557, 1.036683, -0.4958362, 1, 1, 1, 1, 1,
-1.732386, -1.267781, -4.388563, 1, 1, 1, 1, 1,
-1.725004, 0.2186518, -0.3248087, 1, 1, 1, 1, 1,
-1.714726, 1.862298, 0.2339605, 1, 1, 1, 1, 1,
-1.697796, 0.4311173, -1.237934, 1, 1, 1, 1, 1,
-1.69764, 1.72105, -1.201797, 1, 1, 1, 1, 1,
-1.667473, -0.9116856, -2.949751, 1, 1, 1, 1, 1,
-1.660208, -0.6022534, -2.0021, 1, 1, 1, 1, 1,
-1.644109, -0.5558293, -0.9455288, 1, 1, 1, 1, 1,
-1.643118, -1.756825, -2.525618, 1, 1, 1, 1, 1,
-1.628898, -0.3717248, -0.8429078, 1, 1, 1, 1, 1,
-1.627224, -1.170423, -0.01523892, 0, 0, 1, 1, 1,
-1.604324, 0.2318171, -1.473192, 1, 0, 0, 1, 1,
-1.603712, 1.133605, -1.363865, 1, 0, 0, 1, 1,
-1.596957, -0.8530232, -2.072154, 1, 0, 0, 1, 1,
-1.593538, -0.1411666, -1.971431, 1, 0, 0, 1, 1,
-1.593062, -0.2363352, -2.557128, 1, 0, 0, 1, 1,
-1.587524, -2.814957, -3.107185, 0, 0, 0, 1, 1,
-1.58437, 0.7497832, -3.174345, 0, 0, 0, 1, 1,
-1.580512, 0.9714497, -0.956064, 0, 0, 0, 1, 1,
-1.572964, 0.584316, -3.325771, 0, 0, 0, 1, 1,
-1.561147, -0.2151663, -1.722904, 0, 0, 0, 1, 1,
-1.555471, 1.544116, -1.016616, 0, 0, 0, 1, 1,
-1.551704, 0.730481, -2.965446, 0, 0, 0, 1, 1,
-1.55051, -0.2244504, -1.741847, 1, 1, 1, 1, 1,
-1.549032, -0.1251554, -0.005864743, 1, 1, 1, 1, 1,
-1.532844, -0.01868452, -2.902258, 1, 1, 1, 1, 1,
-1.498036, 0.4523792, -1.731043, 1, 1, 1, 1, 1,
-1.497903, -0.03942355, -0.05797292, 1, 1, 1, 1, 1,
-1.493202, -0.5945417, -0.279455, 1, 1, 1, 1, 1,
-1.490239, 1.068138, -2.033423, 1, 1, 1, 1, 1,
-1.488153, -0.1777685, -1.128902, 1, 1, 1, 1, 1,
-1.481866, -0.3276091, -1.713818, 1, 1, 1, 1, 1,
-1.479622, 0.576232, 0.6343216, 1, 1, 1, 1, 1,
-1.478135, 0.3133121, -1.8797, 1, 1, 1, 1, 1,
-1.472278, 1.540857, -0.4384118, 1, 1, 1, 1, 1,
-1.466421, 0.9063537, -0.180794, 1, 1, 1, 1, 1,
-1.458869, -0.4077269, -0.1256374, 1, 1, 1, 1, 1,
-1.437954, 0.4515163, -0.6714154, 1, 1, 1, 1, 1,
-1.432798, -0.0140033, -1.263869, 0, 0, 1, 1, 1,
-1.426498, 0.6353748, -3.455863, 1, 0, 0, 1, 1,
-1.398572, -0.5498329, -2.008659, 1, 0, 0, 1, 1,
-1.398062, 0.7058567, -1.255832, 1, 0, 0, 1, 1,
-1.395659, 1.267793, -1.321973, 1, 0, 0, 1, 1,
-1.394468, -0.9316608, -2.578285, 1, 0, 0, 1, 1,
-1.384622, -0.4966508, -2.745006, 0, 0, 0, 1, 1,
-1.378059, -0.07430099, 0.02734173, 0, 0, 0, 1, 1,
-1.36552, 0.6988401, -1.424974, 0, 0, 0, 1, 1,
-1.365055, -0.1701166, -0.910564, 0, 0, 0, 1, 1,
-1.356427, -0.7054956, -1.229531, 0, 0, 0, 1, 1,
-1.349199, -1.074861, -4.054443, 0, 0, 0, 1, 1,
-1.338879, -1.098751, -2.385618, 0, 0, 0, 1, 1,
-1.331114, 0.5800966, -1.413849, 1, 1, 1, 1, 1,
-1.313538, 0.04164442, -0.6631832, 1, 1, 1, 1, 1,
-1.290626, 0.9453216, -1.240126, 1, 1, 1, 1, 1,
-1.288164, -0.9873793, -1.633333, 1, 1, 1, 1, 1,
-1.283539, 0.5381428, -0.7113855, 1, 1, 1, 1, 1,
-1.27879, -2.904229, -3.062003, 1, 1, 1, 1, 1,
-1.272102, 0.6042283, -0.7297254, 1, 1, 1, 1, 1,
-1.267354, -1.169872, -2.753762, 1, 1, 1, 1, 1,
-1.263771, -0.6643631, -2.318248, 1, 1, 1, 1, 1,
-1.262216, -0.9289016, -1.299304, 1, 1, 1, 1, 1,
-1.260298, 0.04936674, -3.576182, 1, 1, 1, 1, 1,
-1.24949, 0.7046715, -1.949767, 1, 1, 1, 1, 1,
-1.248749, -0.2943905, -2.444539, 1, 1, 1, 1, 1,
-1.247479, 0.1076302, -1.552485, 1, 1, 1, 1, 1,
-1.227523, 0.5098968, -0.1356544, 1, 1, 1, 1, 1,
-1.226934, -1.639861, -2.598503, 0, 0, 1, 1, 1,
-1.214867, -1.613266, -2.977678, 1, 0, 0, 1, 1,
-1.212067, -0.07805379, -1.409389, 1, 0, 0, 1, 1,
-1.206853, 0.9988028, -0.4703253, 1, 0, 0, 1, 1,
-1.206088, 0.2112532, -0.4947395, 1, 0, 0, 1, 1,
-1.204262, -1.872551, -2.060189, 1, 0, 0, 1, 1,
-1.200412, 0.06015532, -0.6508432, 0, 0, 0, 1, 1,
-1.194558, -0.739579, -3.862527, 0, 0, 0, 1, 1,
-1.193403, -0.92917, -2.396764, 0, 0, 0, 1, 1,
-1.178808, -0.4892201, -0.5180691, 0, 0, 0, 1, 1,
-1.178345, 0.3053091, -1.233311, 0, 0, 0, 1, 1,
-1.170196, -1.249141, -2.214828, 0, 0, 0, 1, 1,
-1.164786, 0.7275212, 0.08080871, 0, 0, 0, 1, 1,
-1.164471, 0.08613878, -0.6844268, 1, 1, 1, 1, 1,
-1.1594, 0.5314606, -0.5591183, 1, 1, 1, 1, 1,
-1.146977, 2.183903, -2.166773, 1, 1, 1, 1, 1,
-1.141188, 0.552368, -1.036974, 1, 1, 1, 1, 1,
-1.137393, -0.8646498, -1.660853, 1, 1, 1, 1, 1,
-1.136374, -0.7533894, -1.626237, 1, 1, 1, 1, 1,
-1.132945, 0.6705714, -0.5910437, 1, 1, 1, 1, 1,
-1.123407, 0.1356306, -1.902523, 1, 1, 1, 1, 1,
-1.12199, 0.020452, -0.6762963, 1, 1, 1, 1, 1,
-1.108593, -0.9125102, -1.090176, 1, 1, 1, 1, 1,
-1.107299, -0.8083051, -2.080771, 1, 1, 1, 1, 1,
-1.10144, 1.220351, 0.5859601, 1, 1, 1, 1, 1,
-1.100999, -1.470592, -2.986008, 1, 1, 1, 1, 1,
-1.100774, -1.078, -1.966227, 1, 1, 1, 1, 1,
-1.099777, -0.9461665, -2.21882, 1, 1, 1, 1, 1,
-1.094488, 1.25466, -2.644948, 0, 0, 1, 1, 1,
-1.09128, -0.04526626, -1.175274, 1, 0, 0, 1, 1,
-1.087294, 0.1688183, -2.423222, 1, 0, 0, 1, 1,
-1.075655, 1.334895, -0.2245011, 1, 0, 0, 1, 1,
-1.06729, -0.8239179, -2.687251, 1, 0, 0, 1, 1,
-1.066474, -0.9769822, -3.52372, 1, 0, 0, 1, 1,
-1.066053, 0.162766, -0.8748321, 0, 0, 0, 1, 1,
-1.065463, -1.348119, -2.248452, 0, 0, 0, 1, 1,
-1.052969, 2.342506, -1.731859, 0, 0, 0, 1, 1,
-1.047493, -0.1679854, -3.234338, 0, 0, 0, 1, 1,
-1.041398, -0.8470479, -1.111349, 0, 0, 0, 1, 1,
-1.038043, -0.7924607, -1.123953, 0, 0, 0, 1, 1,
-1.037204, -0.4143444, -1.316661, 0, 0, 0, 1, 1,
-1.036318, -0.04348882, -2.020207, 1, 1, 1, 1, 1,
-1.032259, -0.01598437, -3.433383, 1, 1, 1, 1, 1,
-1.032194, -0.4093968, -1.910383, 1, 1, 1, 1, 1,
-1.031293, 1.499555, 0.9766406, 1, 1, 1, 1, 1,
-1.029256, 0.462865, -0.9290693, 1, 1, 1, 1, 1,
-1.028345, -1.663762, -3.228708, 1, 1, 1, 1, 1,
-1.025557, -1.75329, -2.322751, 1, 1, 1, 1, 1,
-1.021819, 1.137198, -0.0949723, 1, 1, 1, 1, 1,
-1.021419, -0.2975791, -1.840368, 1, 1, 1, 1, 1,
-1.019626, -0.7547604, -1.993128, 1, 1, 1, 1, 1,
-1.019558, -0.1299419, -2.062295, 1, 1, 1, 1, 1,
-1.016064, -1.04513, -3.341786, 1, 1, 1, 1, 1,
-1.013007, -1.252481, -4.15741, 1, 1, 1, 1, 1,
-1.01058, -0.6756001, -1.93972, 1, 1, 1, 1, 1,
-1.005566, 0.4500328, -2.19162, 1, 1, 1, 1, 1,
-0.9943748, -0.3423705, -2.021403, 0, 0, 1, 1, 1,
-0.992239, -0.5886338, -4.748016, 1, 0, 0, 1, 1,
-0.9914657, 2.178941, -0.1916919, 1, 0, 0, 1, 1,
-0.9884661, 0.7333111, -0.7564117, 1, 0, 0, 1, 1,
-0.9876086, -0.8489634, -2.682446, 1, 0, 0, 1, 1,
-0.9858084, 1.493285, -0.8766087, 1, 0, 0, 1, 1,
-0.9825693, -0.6882298, -1.336005, 0, 0, 0, 1, 1,
-0.9785684, 0.7065182, -0.5106677, 0, 0, 0, 1, 1,
-0.977073, 1.441638, -1.289198, 0, 0, 0, 1, 1,
-0.9750623, 1.351463, 1.092645, 0, 0, 0, 1, 1,
-0.9712905, 0.4618753, -0.2111648, 0, 0, 0, 1, 1,
-0.963342, -0.62348, -1.708073, 0, 0, 0, 1, 1,
-0.96285, -1.174321, -2.564535, 0, 0, 0, 1, 1,
-0.9591413, 0.7527958, -1.330749, 1, 1, 1, 1, 1,
-0.9550239, -0.8613414, -3.288306, 1, 1, 1, 1, 1,
-0.9533463, -2.458453, -2.744848, 1, 1, 1, 1, 1,
-0.9492069, -1.15951, -3.277307, 1, 1, 1, 1, 1,
-0.9437857, 0.5808983, -1.698144, 1, 1, 1, 1, 1,
-0.9366786, -0.5057012, -0.09331474, 1, 1, 1, 1, 1,
-0.9309148, -2.747831, -3.991657, 1, 1, 1, 1, 1,
-0.9307852, 0.1368113, -0.05236609, 1, 1, 1, 1, 1,
-0.9288989, 1.377768, -1.367222, 1, 1, 1, 1, 1,
-0.9286292, 0.6470349, 0.6858196, 1, 1, 1, 1, 1,
-0.9281124, 1.694459, -0.0721549, 1, 1, 1, 1, 1,
-0.9250346, 0.06708214, -1.825121, 1, 1, 1, 1, 1,
-0.9249619, -0.7932274, -4.21451, 1, 1, 1, 1, 1,
-0.9222543, -0.3133145, -1.914758, 1, 1, 1, 1, 1,
-0.921174, 0.1820353, -2.7032, 1, 1, 1, 1, 1,
-0.9139626, -0.4292692, -2.508917, 0, 0, 1, 1, 1,
-0.9128606, -1.798355, -2.691016, 1, 0, 0, 1, 1,
-0.911323, 0.6380523, -0.8918628, 1, 0, 0, 1, 1,
-0.9069381, 0.170361, -2.199438, 1, 0, 0, 1, 1,
-0.903888, 1.724293, -2.535983, 1, 0, 0, 1, 1,
-0.9022146, 0.355363, -2.935014, 1, 0, 0, 1, 1,
-0.9003457, -0.6261892, -2.995754, 0, 0, 0, 1, 1,
-0.8966357, -2.086807, -4.27848, 0, 0, 0, 1, 1,
-0.8956831, 0.861966, -1.762857, 0, 0, 0, 1, 1,
-0.8916404, 0.2318386, 0.3018367, 0, 0, 0, 1, 1,
-0.8837336, -0.4884283, -2.468345, 0, 0, 0, 1, 1,
-0.8815069, 1.385489, -0.2407614, 0, 0, 0, 1, 1,
-0.8768371, 0.1517854, -2.699469, 0, 0, 0, 1, 1,
-0.8750042, 0.1730384, -2.10622, 1, 1, 1, 1, 1,
-0.8749099, 1.661103, -2.168704, 1, 1, 1, 1, 1,
-0.8699539, 0.9587831, -1.467634, 1, 1, 1, 1, 1,
-0.8653648, 1.491091, 0.2079095, 1, 1, 1, 1, 1,
-0.8546909, 0.6555948, -1.610699, 1, 1, 1, 1, 1,
-0.8460643, 1.228905, 0.7057173, 1, 1, 1, 1, 1,
-0.8458668, -0.05653943, -2.630055, 1, 1, 1, 1, 1,
-0.8434801, 0.1239756, -1.570592, 1, 1, 1, 1, 1,
-0.841552, -1.661705, -1.64488, 1, 1, 1, 1, 1,
-0.8410149, -0.3148617, -4.194838, 1, 1, 1, 1, 1,
-0.8404688, 0.2510292, -1.570697, 1, 1, 1, 1, 1,
-0.839587, 1.583009, -0.3273795, 1, 1, 1, 1, 1,
-0.8395746, -0.4040991, -1.011272, 1, 1, 1, 1, 1,
-0.8371726, -0.2844695, -1.86909, 1, 1, 1, 1, 1,
-0.8334489, 0.3521764, -0.6298987, 1, 1, 1, 1, 1,
-0.8331229, -1.677441, -1.082911, 0, 0, 1, 1, 1,
-0.8248495, 0.486535, 0.2402733, 1, 0, 0, 1, 1,
-0.8196381, 1.138612, 0.340451, 1, 0, 0, 1, 1,
-0.8185096, 0.6653666, -1.151086, 1, 0, 0, 1, 1,
-0.8145638, -0.7420977, -3.800383, 1, 0, 0, 1, 1,
-0.8075352, -0.4078138, -2.971003, 1, 0, 0, 1, 1,
-0.8071758, 0.2165918, -1.964388, 0, 0, 0, 1, 1,
-0.8015115, -0.5769149, -2.135858, 0, 0, 0, 1, 1,
-0.7973291, 0.7432827, -2.308927, 0, 0, 0, 1, 1,
-0.7956306, 0.1078136, 0.330171, 0, 0, 0, 1, 1,
-0.7944639, -1.011765, -3.049932, 0, 0, 0, 1, 1,
-0.7923425, -0.6837016, 0.3206391, 0, 0, 0, 1, 1,
-0.7882154, 1.185221, -0.8023994, 0, 0, 0, 1, 1,
-0.7840592, -0.2313169, -1.636359, 1, 1, 1, 1, 1,
-0.7796018, -0.1384496, -2.47485, 1, 1, 1, 1, 1,
-0.777792, 1.308807, -1.185836, 1, 1, 1, 1, 1,
-0.7741749, 0.9721389, -0.06471711, 1, 1, 1, 1, 1,
-0.7661901, -1.377807, -3.516732, 1, 1, 1, 1, 1,
-0.7658234, -0.6999182, -3.317465, 1, 1, 1, 1, 1,
-0.7578357, 0.1999813, -0.2658947, 1, 1, 1, 1, 1,
-0.7537626, -0.8961719, -3.233608, 1, 1, 1, 1, 1,
-0.7520108, 1.382207, -1.200746, 1, 1, 1, 1, 1,
-0.7504843, 1.195464, 0.1345433, 1, 1, 1, 1, 1,
-0.7502463, -0.6825186, -2.07492, 1, 1, 1, 1, 1,
-0.7478224, -0.09210677, -2.521362, 1, 1, 1, 1, 1,
-0.7457034, 0.1650496, -2.057609, 1, 1, 1, 1, 1,
-0.7429225, -0.05120341, -1.147214, 1, 1, 1, 1, 1,
-0.7344775, 0.570487, -1.255946, 1, 1, 1, 1, 1,
-0.7342677, -1.882186, -2.581351, 0, 0, 1, 1, 1,
-0.7342025, -0.4440705, -2.018112, 1, 0, 0, 1, 1,
-0.7279423, -0.5256548, -2.927171, 1, 0, 0, 1, 1,
-0.7214938, -0.5765947, -1.65877, 1, 0, 0, 1, 1,
-0.7185634, 0.03583578, -1.091971, 1, 0, 0, 1, 1,
-0.7159205, -1.364561, -2.697603, 1, 0, 0, 1, 1,
-0.7148878, -0.1826236, -2.685595, 0, 0, 0, 1, 1,
-0.7143161, 1.364358, -0.01493698, 0, 0, 0, 1, 1,
-0.713444, -0.469799, -2.878254, 0, 0, 0, 1, 1,
-0.7097386, 1.008036, -2.2432, 0, 0, 0, 1, 1,
-0.7089678, -1.501705, -2.78987, 0, 0, 0, 1, 1,
-0.7046015, -1.210711, -3.016516, 0, 0, 0, 1, 1,
-0.700856, 1.03205, -1.839177, 0, 0, 0, 1, 1,
-0.6989025, -0.2659484, -0.4949596, 1, 1, 1, 1, 1,
-0.6947377, -0.3685578, -3.111839, 1, 1, 1, 1, 1,
-0.6922688, 1.406461, 0.4499643, 1, 1, 1, 1, 1,
-0.6918712, -1.751053, -2.577994, 1, 1, 1, 1, 1,
-0.6866828, 0.4634121, -2.757325, 1, 1, 1, 1, 1,
-0.6850241, 0.5779418, -1.405019, 1, 1, 1, 1, 1,
-0.6843193, 1.044066, -1.656029, 1, 1, 1, 1, 1,
-0.6819408, 0.4905072, 0.9416683, 1, 1, 1, 1, 1,
-0.6751607, -0.3018741, -2.290214, 1, 1, 1, 1, 1,
-0.6737391, -1.256907, -1.875538, 1, 1, 1, 1, 1,
-0.6730925, 1.372068, -1.508682, 1, 1, 1, 1, 1,
-0.6710404, -0.003081596, -3.383504, 1, 1, 1, 1, 1,
-0.663784, 0.1302331, -2.376687, 1, 1, 1, 1, 1,
-0.6635701, -0.499333, -1.441074, 1, 1, 1, 1, 1,
-0.6599621, 0.1634109, -1.602786, 1, 1, 1, 1, 1,
-0.6599383, -0.06436395, -0.8174538, 0, 0, 1, 1, 1,
-0.6594813, -1.79969, -2.711253, 1, 0, 0, 1, 1,
-0.6538686, 0.80185, 0.7228619, 1, 0, 0, 1, 1,
-0.6484674, -0.9251838, -1.878413, 1, 0, 0, 1, 1,
-0.6376771, 0.006561032, -2.864248, 1, 0, 0, 1, 1,
-0.6355406, -0.0848467, -1.396665, 1, 0, 0, 1, 1,
-0.6313068, -0.8931233, -2.406169, 0, 0, 0, 1, 1,
-0.631117, 1.709733, -1.079076, 0, 0, 0, 1, 1,
-0.6305074, -0.851903, -4.270154, 0, 0, 0, 1, 1,
-0.6291159, 1.238067, -0.5603592, 0, 0, 0, 1, 1,
-0.6283294, 0.02713467, -3.496071, 0, 0, 0, 1, 1,
-0.623642, -1.085815, -0.4487862, 0, 0, 0, 1, 1,
-0.6198301, -1.630923, -1.888682, 0, 0, 0, 1, 1,
-0.6124612, 0.1342413, -1.355826, 1, 1, 1, 1, 1,
-0.6042725, 0.868311, -1.270485, 1, 1, 1, 1, 1,
-0.6028856, 0.445108, -1.529034, 1, 1, 1, 1, 1,
-0.6028164, 0.1307523, -0.2544929, 1, 1, 1, 1, 1,
-0.5905404, -0.3271473, -0.8648036, 1, 1, 1, 1, 1,
-0.5901228, 0.7656977, -1.695031, 1, 1, 1, 1, 1,
-0.5854342, -1.246701, -2.932473, 1, 1, 1, 1, 1,
-0.5828369, -0.3810759, -2.992736, 1, 1, 1, 1, 1,
-0.5809914, -0.01118176, -2.144899, 1, 1, 1, 1, 1,
-0.5805182, -1.01794, -2.294917, 1, 1, 1, 1, 1,
-0.5734965, -1.694058, -3.507234, 1, 1, 1, 1, 1,
-0.571808, 0.2504411, -0.9628444, 1, 1, 1, 1, 1,
-0.5663243, -1.866736, -2.40389, 1, 1, 1, 1, 1,
-0.5645511, 1.475868, 0.4226592, 1, 1, 1, 1, 1,
-0.5637362, -0.3364381, -1.011888, 1, 1, 1, 1, 1,
-0.5562019, 0.663659, -0.1050769, 0, 0, 1, 1, 1,
-0.5496781, -0.6826872, -2.313267, 1, 0, 0, 1, 1,
-0.5468776, 0.4309067, -1.774237, 1, 0, 0, 1, 1,
-0.5438741, 1.698384, -0.3641603, 1, 0, 0, 1, 1,
-0.5425909, 0.4049521, -0.2119532, 1, 0, 0, 1, 1,
-0.5333865, -0.8687516, -4.199066, 1, 0, 0, 1, 1,
-0.5286716, 0.9424578, -0.5493568, 0, 0, 0, 1, 1,
-0.5247721, -1.40974, -2.105283, 0, 0, 0, 1, 1,
-0.521121, -0.4926322, -0.8101071, 0, 0, 0, 1, 1,
-0.5154759, -1.4893, -1.759444, 0, 0, 0, 1, 1,
-0.509982, -0.5449857, -2.277286, 0, 0, 0, 1, 1,
-0.5014828, -0.3676871, -4.206136, 0, 0, 0, 1, 1,
-0.4995764, 1.660454, -0.792945, 0, 0, 0, 1, 1,
-0.4992358, -0.8039029, -1.429702, 1, 1, 1, 1, 1,
-0.494901, -1.255204, -2.816195, 1, 1, 1, 1, 1,
-0.4928735, 0.2514079, -1.053076, 1, 1, 1, 1, 1,
-0.4928092, 0.730801, -2.045071, 1, 1, 1, 1, 1,
-0.4838755, 0.9570538, 0.3818782, 1, 1, 1, 1, 1,
-0.4822087, -1.164145, -3.935581, 1, 1, 1, 1, 1,
-0.4713248, 0.002661241, -3.740269, 1, 1, 1, 1, 1,
-0.4665543, 1.582103, -0.3587134, 1, 1, 1, 1, 1,
-0.4651238, -0.01944303, -2.086173, 1, 1, 1, 1, 1,
-0.4617558, -1.516615, -1.688241, 1, 1, 1, 1, 1,
-0.4588578, -0.9992268, -4.007984, 1, 1, 1, 1, 1,
-0.4571552, -2.682522, -2.921952, 1, 1, 1, 1, 1,
-0.4570794, -0.2470167, -2.959087, 1, 1, 1, 1, 1,
-0.4570449, -0.08440524, -2.368912, 1, 1, 1, 1, 1,
-0.4560513, -0.1556365, -2.07365, 1, 1, 1, 1, 1,
-0.4541052, -0.4775285, -1.680262, 0, 0, 1, 1, 1,
-0.4530075, 1.022729, 0.2995544, 1, 0, 0, 1, 1,
-0.4501992, -0.05866214, -0.5142879, 1, 0, 0, 1, 1,
-0.4500128, 0.3879056, -0.296265, 1, 0, 0, 1, 1,
-0.4462826, 1.376167, 1.107027, 1, 0, 0, 1, 1,
-0.4383062, -0.9477285, -0.8347856, 1, 0, 0, 1, 1,
-0.4363719, -0.855231, -2.745152, 0, 0, 0, 1, 1,
-0.4333634, -1.039989, -2.539732, 0, 0, 0, 1, 1,
-0.4295219, -0.2517421, -0.4124058, 0, 0, 0, 1, 1,
-0.4284751, -0.1777407, -0.5037423, 0, 0, 0, 1, 1,
-0.4284064, 0.6144457, -0.5107894, 0, 0, 0, 1, 1,
-0.4261144, 0.1681925, -2.183174, 0, 0, 0, 1, 1,
-0.4256309, 0.3810377, 0.7747646, 0, 0, 0, 1, 1,
-0.417956, 0.3048393, -0.5386114, 1, 1, 1, 1, 1,
-0.4171026, -1.210201, -2.296877, 1, 1, 1, 1, 1,
-0.4168578, -1.844966, -3.301139, 1, 1, 1, 1, 1,
-0.4161894, -0.03392885, -0.944165, 1, 1, 1, 1, 1,
-0.4160482, 0.2751372, -2.038653, 1, 1, 1, 1, 1,
-0.4134052, 0.4530693, -0.9192119, 1, 1, 1, 1, 1,
-0.4118589, 0.7853044, -0.8713588, 1, 1, 1, 1, 1,
-0.4102477, 0.0424342, -2.011251, 1, 1, 1, 1, 1,
-0.4004515, -0.7437353, -1.779099, 1, 1, 1, 1, 1,
-0.3996077, -1.138209, -2.517374, 1, 1, 1, 1, 1,
-0.3961008, -0.7961543, -2.905883, 1, 1, 1, 1, 1,
-0.3955582, -0.5145364, -3.689024, 1, 1, 1, 1, 1,
-0.3949023, 1.446844, -1.185555, 1, 1, 1, 1, 1,
-0.3919093, -0.08223543, -0.9564916, 1, 1, 1, 1, 1,
-0.3870889, 0.1067859, 0.5270358, 1, 1, 1, 1, 1,
-0.385196, 0.02317048, -1.408393, 0, 0, 1, 1, 1,
-0.3826526, 0.8672571, 1.183912, 1, 0, 0, 1, 1,
-0.3812298, -1.130638, -4.36044, 1, 0, 0, 1, 1,
-0.3793132, -0.5630782, -2.734657, 1, 0, 0, 1, 1,
-0.3761972, -0.3675741, -1.982606, 1, 0, 0, 1, 1,
-0.3721699, -1.13919, -4.136441, 1, 0, 0, 1, 1,
-0.368903, 0.07479287, -0.01011357, 0, 0, 0, 1, 1,
-0.3685429, -0.1674474, -3.270167, 0, 0, 0, 1, 1,
-0.3663648, -1.240567, -2.988128, 0, 0, 0, 1, 1,
-0.3612077, 2.354739, -0.1036894, 0, 0, 0, 1, 1,
-0.3611339, 0.01043424, -0.6118262, 0, 0, 0, 1, 1,
-0.3580202, -0.1629692, -1.265851, 0, 0, 0, 1, 1,
-0.3552465, 0.9403445, 0.4829502, 0, 0, 0, 1, 1,
-0.3523909, -1.235243, -2.358456, 1, 1, 1, 1, 1,
-0.3508281, -1.08297, -3.061852, 1, 1, 1, 1, 1,
-0.3490035, -0.8190347, -2.782948, 1, 1, 1, 1, 1,
-0.3464452, 1.141573, -0.4863554, 1, 1, 1, 1, 1,
-0.3443002, -0.9208229, -2.177038, 1, 1, 1, 1, 1,
-0.3423745, -0.9099947, -2.69627, 1, 1, 1, 1, 1,
-0.3405136, -1.268239, -3.07518, 1, 1, 1, 1, 1,
-0.3329182, -0.2561504, -3.04652, 1, 1, 1, 1, 1,
-0.3306448, 0.5589268, 0.1778373, 1, 1, 1, 1, 1,
-0.3237136, 1.882254, 0.7229993, 1, 1, 1, 1, 1,
-0.323641, 0.8517593, -1.169888, 1, 1, 1, 1, 1,
-0.3224475, 0.241505, -3.059688, 1, 1, 1, 1, 1,
-0.32131, -0.7718557, -2.71601, 1, 1, 1, 1, 1,
-0.3199178, -0.5297616, -2.637826, 1, 1, 1, 1, 1,
-0.3112651, 1.552762, -1.755227, 1, 1, 1, 1, 1,
-0.3101973, 0.8401166, 1.629656, 0, 0, 1, 1, 1,
-0.3074276, 1.723463, 0.2058703, 1, 0, 0, 1, 1,
-0.3052703, 0.9210536, 0.3474034, 1, 0, 0, 1, 1,
-0.303345, -1.805244, -2.326104, 1, 0, 0, 1, 1,
-0.2904208, 1.025357, -1.491828, 1, 0, 0, 1, 1,
-0.2881996, -0.5918908, -2.940931, 1, 0, 0, 1, 1,
-0.282983, 0.5113437, -0.5013288, 0, 0, 0, 1, 1,
-0.2820418, 0.08565026, 0.04168668, 0, 0, 0, 1, 1,
-0.2779367, -1.051845, -2.192874, 0, 0, 0, 1, 1,
-0.2771741, -0.6194141, -1.320117, 0, 0, 0, 1, 1,
-0.2730687, 2.295752, -1.644141, 0, 0, 0, 1, 1,
-0.2720692, -0.5740328, -2.516838, 0, 0, 0, 1, 1,
-0.2660672, 0.8361187, -0.9955536, 0, 0, 0, 1, 1,
-0.2610854, -0.1734434, -1.842051, 1, 1, 1, 1, 1,
-0.2597892, 0.4130828, -0.06710492, 1, 1, 1, 1, 1,
-0.2594717, -1.9396, -4.523044, 1, 1, 1, 1, 1,
-0.2587819, -0.3020186, -1.049785, 1, 1, 1, 1, 1,
-0.2570167, 0.07012939, -1.120077, 1, 1, 1, 1, 1,
-0.254603, -0.4613345, -1.589284, 1, 1, 1, 1, 1,
-0.2535708, -1.338551, -4.01008, 1, 1, 1, 1, 1,
-0.2524583, -1.357931, -1.940284, 1, 1, 1, 1, 1,
-0.2522167, 3.820327, -0.4237033, 1, 1, 1, 1, 1,
-0.2511629, -0.2365162, -3.355999, 1, 1, 1, 1, 1,
-0.2459477, 1.687933, -0.640149, 1, 1, 1, 1, 1,
-0.2457816, 0.856801, -0.3342823, 1, 1, 1, 1, 1,
-0.2451045, -1.836948, -2.035379, 1, 1, 1, 1, 1,
-0.2385618, -1.279844, -2.181884, 1, 1, 1, 1, 1,
-0.2382659, 2.50387, -0.5765211, 1, 1, 1, 1, 1,
-0.2372439, -0.303102, -0.7701222, 0, 0, 1, 1, 1,
-0.2340771, 0.1523042, -1.081607, 1, 0, 0, 1, 1,
-0.2332631, 1.19993, -0.2545781, 1, 0, 0, 1, 1,
-0.2323559, 0.1014718, -1.52448, 1, 0, 0, 1, 1,
-0.2239321, 0.3757763, 0.6755237, 1, 0, 0, 1, 1,
-0.2148499, -1.268589, -2.74021, 1, 0, 0, 1, 1,
-0.2143902, 0.6569418, 0.3853357, 0, 0, 0, 1, 1,
-0.2123964, -0.8324108, -2.216367, 0, 0, 0, 1, 1,
-0.2077064, 2.273849, 0.7373676, 0, 0, 0, 1, 1,
-0.2052106, -0.2703388, -2.29759, 0, 0, 0, 1, 1,
-0.2027561, 0.3622232, 0.1382873, 0, 0, 0, 1, 1,
-0.2018232, -1.072668, -1.587316, 0, 0, 0, 1, 1,
-0.1973501, -0.2812359, -2.473141, 0, 0, 0, 1, 1,
-0.1964514, -0.999788, -1.698303, 1, 1, 1, 1, 1,
-0.1910765, -1.13495, -3.742004, 1, 1, 1, 1, 1,
-0.1905304, 1.504916, -0.07574604, 1, 1, 1, 1, 1,
-0.187947, -0.5887467, -1.780276, 1, 1, 1, 1, 1,
-0.1814249, 1.45929, -0.04926641, 1, 1, 1, 1, 1,
-0.1774909, -0.9678873, -2.500245, 1, 1, 1, 1, 1,
-0.176978, 0.163708, -1.280585, 1, 1, 1, 1, 1,
-0.1747881, -0.5635301, -2.291955, 1, 1, 1, 1, 1,
-0.1743986, 2.251065, 0.1892726, 1, 1, 1, 1, 1,
-0.1691206, 1.06394, -1.118837, 1, 1, 1, 1, 1,
-0.1677735, 0.2858644, -1.43433, 1, 1, 1, 1, 1,
-0.1636189, -0.6744014, -1.825206, 1, 1, 1, 1, 1,
-0.1629409, 0.2146497, -1.700251, 1, 1, 1, 1, 1,
-0.1603688, -0.9386125, -4.007004, 1, 1, 1, 1, 1,
-0.1579645, -0.6386713, -3.412596, 1, 1, 1, 1, 1,
-0.1579183, -0.2383714, -3.051252, 0, 0, 1, 1, 1,
-0.1567063, 1.883638, -0.1458918, 1, 0, 0, 1, 1,
-0.1519685, 1.301918, -0.5828835, 1, 0, 0, 1, 1,
-0.1516656, -0.3773042, -3.581333, 1, 0, 0, 1, 1,
-0.1488137, -1.236214, -3.283191, 1, 0, 0, 1, 1,
-0.1444561, 0.353236, 1.387327, 1, 0, 0, 1, 1,
-0.1436773, -0.2838469, -2.603717, 0, 0, 0, 1, 1,
-0.14082, -0.3935473, -3.188794, 0, 0, 0, 1, 1,
-0.1387979, 1.500869, 0.4895993, 0, 0, 0, 1, 1,
-0.1312355, 0.6893313, 0.2257366, 0, 0, 0, 1, 1,
-0.1305964, 0.512456, -0.840183, 0, 0, 0, 1, 1,
-0.12773, 0.05197977, -1.167491, 0, 0, 0, 1, 1,
-0.1263935, 1.325588, -1.703309, 0, 0, 0, 1, 1,
-0.1251028, 1.850801, -0.3021077, 1, 1, 1, 1, 1,
-0.1233277, 1.511466, -0.2103577, 1, 1, 1, 1, 1,
-0.1213233, -0.9427815, -3.51921, 1, 1, 1, 1, 1,
-0.1198401, -0.9210209, -3.832304, 1, 1, 1, 1, 1,
-0.1192566, -0.590714, -2.495255, 1, 1, 1, 1, 1,
-0.1189706, -0.8766599, -4.833206, 1, 1, 1, 1, 1,
-0.1180364, 1.333776, -0.5196088, 1, 1, 1, 1, 1,
-0.1132993, 1.464341, 0.3366578, 1, 1, 1, 1, 1,
-0.1128457, 0.4683077, -0.5161358, 1, 1, 1, 1, 1,
-0.1110256, -0.8578739, -4.74511, 1, 1, 1, 1, 1,
-0.1107641, -0.1709819, -3.169004, 1, 1, 1, 1, 1,
-0.1080043, 2.2516, -0.6025191, 1, 1, 1, 1, 1,
-0.1076008, 0.399102, -0.973574, 1, 1, 1, 1, 1,
-0.1042212, -2.005269, -2.469839, 1, 1, 1, 1, 1,
-0.1028097, -1.125767, -3.146874, 1, 1, 1, 1, 1,
-0.1027612, -0.6428499, -2.604714, 0, 0, 1, 1, 1,
-0.09161093, 0.14609, 0.4341846, 1, 0, 0, 1, 1,
-0.08963048, -1.152324, -1.637931, 1, 0, 0, 1, 1,
-0.08545823, -1.252355, -3.147482, 1, 0, 0, 1, 1,
-0.08335567, 0.9432195, -0.0525931, 1, 0, 0, 1, 1,
-0.08002197, -2.316041, -2.889573, 1, 0, 0, 1, 1,
-0.0775, 1.507301, 0.2454864, 0, 0, 0, 1, 1,
-0.0688945, 1.336487, 0.9755495, 0, 0, 0, 1, 1,
-0.06641369, 1.152715, -0.7775371, 0, 0, 0, 1, 1,
-0.06377182, -0.8775499, -2.383739, 0, 0, 0, 1, 1,
-0.06236719, -1.341341, -3.266192, 0, 0, 0, 1, 1,
-0.06214282, -0.1976936, -3.179066, 0, 0, 0, 1, 1,
-0.0613659, -0.3434998, -4.082175, 0, 0, 0, 1, 1,
-0.05908144, 0.09062522, -1.431528, 1, 1, 1, 1, 1,
-0.05766525, 0.1652405, -0.3783952, 1, 1, 1, 1, 1,
-0.05757817, -0.4289091, -3.369107, 1, 1, 1, 1, 1,
-0.05400801, 2.687897, 0.09782817, 1, 1, 1, 1, 1,
-0.05236987, -0.4255696, -1.514455, 1, 1, 1, 1, 1,
-0.05218194, 0.627561, 0.5696169, 1, 1, 1, 1, 1,
-0.04687105, 0.2280489, -0.9690335, 1, 1, 1, 1, 1,
-0.04186416, -1.366139, -3.602072, 1, 1, 1, 1, 1,
-0.04098963, 1.228744, 1.993957, 1, 1, 1, 1, 1,
-0.04058802, -0.922348, -1.788517, 1, 1, 1, 1, 1,
-0.04023024, 0.004291404, 0.8834805, 1, 1, 1, 1, 1,
-0.04016798, -0.1706771, -2.174794, 1, 1, 1, 1, 1,
-0.03976907, 0.1417928, 0.2820511, 1, 1, 1, 1, 1,
-0.03894599, 0.9947147, -1.186335, 1, 1, 1, 1, 1,
-0.03786008, -1.467965, -3.245113, 1, 1, 1, 1, 1,
-0.03639632, 0.01687675, -0.4300895, 0, 0, 1, 1, 1,
-0.03615286, 0.7519563, -1.823179, 1, 0, 0, 1, 1,
-0.03557762, 0.5934141, 2.683053, 1, 0, 0, 1, 1,
-0.03536814, 0.9962841, 0.4289388, 1, 0, 0, 1, 1,
-0.0347467, 0.4401509, -0.3924548, 1, 0, 0, 1, 1,
-0.0310813, 0.5212228, -0.5206619, 1, 0, 0, 1, 1,
-0.02725297, -0.1646489, -3.354544, 0, 0, 0, 1, 1,
-0.02231189, -0.6487252, -1.166633, 0, 0, 0, 1, 1,
-0.01798855, 1.011106, -0.3980688, 0, 0, 0, 1, 1,
-0.01673322, 0.2484531, 0.7503759, 0, 0, 0, 1, 1,
-0.01447133, -0.7192027, -3.128217, 0, 0, 0, 1, 1,
-0.01178162, 0.9830338, -1.199579, 0, 0, 0, 1, 1,
-0.009881645, -1.79678, -2.17731, 0, 0, 0, 1, 1,
-0.009396911, -0.6191522, -0.7981525, 1, 1, 1, 1, 1,
-0.009054322, 0.3203325, -1.63979, 1, 1, 1, 1, 1,
-0.008644421, 2.563979, 0.9160377, 1, 1, 1, 1, 1,
-0.006930817, 0.6428636, 0.2754504, 1, 1, 1, 1, 1,
-0.00304149, -0.04649653, -1.869596, 1, 1, 1, 1, 1,
-0.001090259, -0.4086125, -2.911733, 1, 1, 1, 1, 1,
0.005559747, 0.6785883, 0.05880516, 1, 1, 1, 1, 1,
0.006201676, -0.6992677, 2.77792, 1, 1, 1, 1, 1,
0.006600278, 0.8394123, -0.1433038, 1, 1, 1, 1, 1,
0.006800548, 1.215248, 0.3059785, 1, 1, 1, 1, 1,
0.007132486, 0.2333415, -0.4626562, 1, 1, 1, 1, 1,
0.007524632, -0.2745375, 2.628671, 1, 1, 1, 1, 1,
0.01391493, 1.028776, 0.2092162, 1, 1, 1, 1, 1,
0.01434797, -1.550465, 1.813212, 1, 1, 1, 1, 1,
0.01465184, -0.3719259, 2.249276, 1, 1, 1, 1, 1,
0.01481422, 0.3677014, 0.2987399, 0, 0, 1, 1, 1,
0.0149939, -0.1822816, 2.128217, 1, 0, 0, 1, 1,
0.01573571, -0.129448, 4.301843, 1, 0, 0, 1, 1,
0.01631577, -0.3043433, 3.237009, 1, 0, 0, 1, 1,
0.01900766, -0.03147081, 0.7872812, 1, 0, 0, 1, 1,
0.01930705, -0.4227828, 2.338626, 1, 0, 0, 1, 1,
0.02204035, -0.6454903, 2.878226, 0, 0, 0, 1, 1,
0.02297076, 0.1346269, 1.600748, 0, 0, 0, 1, 1,
0.02690613, 1.949191, 1.08846, 0, 0, 0, 1, 1,
0.02690944, 0.232699, -0.6361784, 0, 0, 0, 1, 1,
0.03149972, 1.325935, -1.522079, 0, 0, 0, 1, 1,
0.03469153, 0.8684, 0.4329155, 0, 0, 0, 1, 1,
0.04005015, -0.07622755, 2.920906, 0, 0, 0, 1, 1,
0.04034953, 0.06846628, 0.3240013, 1, 1, 1, 1, 1,
0.04590315, 0.02906444, 1.521618, 1, 1, 1, 1, 1,
0.04738091, 0.5831, 0.5117962, 1, 1, 1, 1, 1,
0.04968699, -1.477993, 4.162271, 1, 1, 1, 1, 1,
0.0497156, 0.01029783, 2.336468, 1, 1, 1, 1, 1,
0.0594401, -0.352684, 2.018266, 1, 1, 1, 1, 1,
0.06366669, -2.188389, 1.745409, 1, 1, 1, 1, 1,
0.06452662, 0.6382511, -1.270759, 1, 1, 1, 1, 1,
0.06929272, 0.4776292, 0.8488622, 1, 1, 1, 1, 1,
0.07071159, 0.514756, 1.753737, 1, 1, 1, 1, 1,
0.07247084, 0.06730179, 0.1513799, 1, 1, 1, 1, 1,
0.08797725, -1.161016, 1.590461, 1, 1, 1, 1, 1,
0.09015308, -1.097824, 3.203425, 1, 1, 1, 1, 1,
0.09113668, -0.8033999, 3.545956, 1, 1, 1, 1, 1,
0.09353457, 1.062436, 1.855913, 1, 1, 1, 1, 1,
0.09403392, 0.3571281, -0.2366122, 0, 0, 1, 1, 1,
0.0944614, 0.7487264, -0.1829652, 1, 0, 0, 1, 1,
0.09587321, -0.07695898, 2.699108, 1, 0, 0, 1, 1,
0.09670966, 0.7497479, 1.461066, 1, 0, 0, 1, 1,
0.1049692, 2.172788, 1.068382, 1, 0, 0, 1, 1,
0.1158239, -0.9476104, 3.309517, 1, 0, 0, 1, 1,
0.1232586, -1.054017, 3.759086, 0, 0, 0, 1, 1,
0.1248283, 0.452069, 1.553908, 0, 0, 0, 1, 1,
0.1264558, 0.9047704, -0.5581187, 0, 0, 0, 1, 1,
0.1276038, -2.432423, 2.64945, 0, 0, 0, 1, 1,
0.1318723, 1.29864, 0.4120266, 0, 0, 0, 1, 1,
0.1389608, -0.75076, 2.492213, 0, 0, 0, 1, 1,
0.1470565, -0.8495322, 1.923916, 0, 0, 0, 1, 1,
0.1516101, 1.701962, -0.7073289, 1, 1, 1, 1, 1,
0.1616785, -0.7210732, 2.831951, 1, 1, 1, 1, 1,
0.1686781, 1.698774, 0.1663104, 1, 1, 1, 1, 1,
0.1687351, -2.39295, 3.43784, 1, 1, 1, 1, 1,
0.1691631, 0.4227011, 1.264624, 1, 1, 1, 1, 1,
0.169351, 1.966645, 0.4447368, 1, 1, 1, 1, 1,
0.1708211, 1.304018, -0.004218658, 1, 1, 1, 1, 1,
0.1768663, 0.605591, 1.103466, 1, 1, 1, 1, 1,
0.181324, 0.1600147, -0.1723749, 1, 1, 1, 1, 1,
0.1873693, -0.3003601, 1.745956, 1, 1, 1, 1, 1,
0.1875742, 1.655393, -0.8151959, 1, 1, 1, 1, 1,
0.192601, -0.1034474, 4.327293, 1, 1, 1, 1, 1,
0.1945289, -1.334287, 3.338509, 1, 1, 1, 1, 1,
0.1999536, 0.6806381, -0.4895567, 1, 1, 1, 1, 1,
0.2038264, -1.440004, 3.848937, 1, 1, 1, 1, 1,
0.2088258, 1.263444, -0.1284307, 0, 0, 1, 1, 1,
0.209, -0.7162038, 3.354213, 1, 0, 0, 1, 1,
0.2106517, -0.9751005, 3.345603, 1, 0, 0, 1, 1,
0.2181714, -1.065248, 2.717791, 1, 0, 0, 1, 1,
0.219269, -0.4066862, 1.48663, 1, 0, 0, 1, 1,
0.2198991, 0.8393328, 1.406875, 1, 0, 0, 1, 1,
0.2206302, -2.208424, 2.850112, 0, 0, 0, 1, 1,
0.220858, 0.8841414, 1.893524, 0, 0, 0, 1, 1,
0.2219082, 0.3319573, 1.837958, 0, 0, 0, 1, 1,
0.2223155, 0.4878574, 0.9512776, 0, 0, 0, 1, 1,
0.2293973, 2.155559, 1.28367, 0, 0, 0, 1, 1,
0.2321368, -1.999475, 1.524532, 0, 0, 0, 1, 1,
0.2343207, -0.9101834, 3.178236, 0, 0, 0, 1, 1,
0.2377152, -0.5650281, 2.771638, 1, 1, 1, 1, 1,
0.240842, -0.06594574, 1.477774, 1, 1, 1, 1, 1,
0.2422384, -0.3984393, 2.43881, 1, 1, 1, 1, 1,
0.2429615, -0.7388635, 2.956664, 1, 1, 1, 1, 1,
0.2441176, -0.3233991, 0.31337, 1, 1, 1, 1, 1,
0.2448242, -0.7366149, 2.275854, 1, 1, 1, 1, 1,
0.2584315, 1.330576, -1.489248, 1, 1, 1, 1, 1,
0.2595733, 0.3137847, -0.02076227, 1, 1, 1, 1, 1,
0.2634521, 0.09141077, 1.290519, 1, 1, 1, 1, 1,
0.2637668, 0.3349618, -0.2630349, 1, 1, 1, 1, 1,
0.2638804, -0.576319, 1.365858, 1, 1, 1, 1, 1,
0.2702411, -1.81647, 2.008905, 1, 1, 1, 1, 1,
0.2715444, 0.5889655, 0.9020801, 1, 1, 1, 1, 1,
0.2741402, 0.9525781, 2.036344, 1, 1, 1, 1, 1,
0.2761823, 0.09086587, 2.045207, 1, 1, 1, 1, 1,
0.2842624, 0.4971579, -0.09345629, 0, 0, 1, 1, 1,
0.2887167, -2.61354, 2.512292, 1, 0, 0, 1, 1,
0.294178, 2.223181, -0.7868477, 1, 0, 0, 1, 1,
0.2953537, -1.746058, 3.303225, 1, 0, 0, 1, 1,
0.2963271, 0.5762164, -0.5052271, 1, 0, 0, 1, 1,
0.2969633, -0.566269, 1.620646, 1, 0, 0, 1, 1,
0.2977221, -0.815832, 3.219865, 0, 0, 0, 1, 1,
0.2981585, 0.815559, 1.550522, 0, 0, 0, 1, 1,
0.3033883, 0.196176, 0.6853942, 0, 0, 0, 1, 1,
0.3045119, 0.06492998, 2.655067, 0, 0, 0, 1, 1,
0.3078857, 0.2124427, 2.292641, 0, 0, 0, 1, 1,
0.3130476, 1.433153, 1.487553, 0, 0, 0, 1, 1,
0.314289, -1.615472, 2.022365, 0, 0, 0, 1, 1,
0.3212584, 0.1150434, 0.3659247, 1, 1, 1, 1, 1,
0.322334, 0.6627736, 1.722662, 1, 1, 1, 1, 1,
0.3232074, -0.163448, 0.9718738, 1, 1, 1, 1, 1,
0.3236084, 1.435954, -0.1276005, 1, 1, 1, 1, 1,
0.3242619, 0.2604171, 2.193541, 1, 1, 1, 1, 1,
0.327725, 0.8158681, 0.7375517, 1, 1, 1, 1, 1,
0.3293303, 1.924512, -2.370209, 1, 1, 1, 1, 1,
0.3295901, -0.3211864, 1.594601, 1, 1, 1, 1, 1,
0.3348529, 0.2278644, 1.18045, 1, 1, 1, 1, 1,
0.3414077, -0.9027649, 3.695218, 1, 1, 1, 1, 1,
0.3503139, 0.4978432, 0.4215738, 1, 1, 1, 1, 1,
0.3504835, -1.511086, 1.382576, 1, 1, 1, 1, 1,
0.3519095, -1.000795, 2.898463, 1, 1, 1, 1, 1,
0.3554724, 1.756644, 2.178001, 1, 1, 1, 1, 1,
0.358932, 0.5016375, 1.164185, 1, 1, 1, 1, 1,
0.3625024, -2.409592, 3.333168, 0, 0, 1, 1, 1,
0.362785, -0.9468267, 3.169684, 1, 0, 0, 1, 1,
0.3673792, -1.328351, 2.685834, 1, 0, 0, 1, 1,
0.3740672, 0.3901905, 0.0838466, 1, 0, 0, 1, 1,
0.379749, -0.1890542, 1.369973, 1, 0, 0, 1, 1,
0.3811443, 0.9072763, 1.006447, 1, 0, 0, 1, 1,
0.38131, 0.6175691, 0.04197421, 0, 0, 0, 1, 1,
0.3826105, 1.17821, -2.21492, 0, 0, 0, 1, 1,
0.3894872, -0.24886, 2.150099, 0, 0, 0, 1, 1,
0.3895259, 1.362406, 1.18263, 0, 0, 0, 1, 1,
0.3906571, -0.1327563, 2.782665, 0, 0, 0, 1, 1,
0.3915789, 1.778188, -1.09473, 0, 0, 0, 1, 1,
0.3944034, 0.9485475, -0.5539998, 0, 0, 0, 1, 1,
0.3945328, 0.182908, 2.39991, 1, 1, 1, 1, 1,
0.3974672, -0.3540213, 3.047507, 1, 1, 1, 1, 1,
0.3988383, -0.2966914, 2.845805, 1, 1, 1, 1, 1,
0.3989898, 0.5954521, 1.159256, 1, 1, 1, 1, 1,
0.4076695, 0.06923003, 1.82876, 1, 1, 1, 1, 1,
0.4093483, 0.926262, 0.7547476, 1, 1, 1, 1, 1,
0.4099343, 0.6269847, 0.3322319, 1, 1, 1, 1, 1,
0.4156342, 0.2918273, -0.9280122, 1, 1, 1, 1, 1,
0.4197761, -0.2110482, 3.676676, 1, 1, 1, 1, 1,
0.4252439, 0.06080547, 2.771184, 1, 1, 1, 1, 1,
0.4263753, 2.112335, -0.7108687, 1, 1, 1, 1, 1,
0.4278745, -2.15644, 3.243695, 1, 1, 1, 1, 1,
0.4314209, -1.059351, 4.297462, 1, 1, 1, 1, 1,
0.4321494, 0.6011428, 0.4281741, 1, 1, 1, 1, 1,
0.4327545, 0.3390006, 1.570605, 1, 1, 1, 1, 1,
0.4338216, -1.181234, 0.966872, 0, 0, 1, 1, 1,
0.4565063, 0.335981, 3.027454, 1, 0, 0, 1, 1,
0.4572117, 1.560072, -0.8165745, 1, 0, 0, 1, 1,
0.4579459, -0.1678416, 4.341354, 1, 0, 0, 1, 1,
0.4585303, -0.02615237, 1.301082, 1, 0, 0, 1, 1,
0.4605614, 0.4421194, 0.4037736, 1, 0, 0, 1, 1,
0.4616178, -0.04538839, 0.9479904, 0, 0, 0, 1, 1,
0.4620954, -1.562999, 0.2131689, 0, 0, 0, 1, 1,
0.4631935, -2.306307, 2.950622, 0, 0, 0, 1, 1,
0.4641108, 0.5128409, 0.3365272, 0, 0, 0, 1, 1,
0.4722341, 1.457269, 1.169172, 0, 0, 0, 1, 1,
0.474042, -0.8057503, 2.604014, 0, 0, 0, 1, 1,
0.4745717, -1.224905, 2.983765, 0, 0, 0, 1, 1,
0.476931, 0.02121028, 1.772033, 1, 1, 1, 1, 1,
0.4772356, 0.3660106, -0.2949385, 1, 1, 1, 1, 1,
0.4786587, -0.03702809, 2.732596, 1, 1, 1, 1, 1,
0.4803568, -0.06939968, 1.048788, 1, 1, 1, 1, 1,
0.4811332, -0.3304431, 2.326928, 1, 1, 1, 1, 1,
0.4841203, -0.4893243, 3.718497, 1, 1, 1, 1, 1,
0.4910526, 0.4126891, -1.330734, 1, 1, 1, 1, 1,
0.4925186, 0.5304939, 0.8444862, 1, 1, 1, 1, 1,
0.492946, 2.152857, -0.6188181, 1, 1, 1, 1, 1,
0.4966635, 0.1887539, 0.2097406, 1, 1, 1, 1, 1,
0.4996915, -0.9412288, 1.132006, 1, 1, 1, 1, 1,
0.5000818, 0.6585549, 0.7129952, 1, 1, 1, 1, 1,
0.5053439, -0.1337035, 2.367286, 1, 1, 1, 1, 1,
0.5097623, 0.469039, 1.428515, 1, 1, 1, 1, 1,
0.5105677, -0.6826672, 2.846936, 1, 1, 1, 1, 1,
0.5162821, -0.2245051, 0.4988278, 0, 0, 1, 1, 1,
0.5189655, -0.2316292, 1.741767, 1, 0, 0, 1, 1,
0.5199145, 0.6675599, 1.426993, 1, 0, 0, 1, 1,
0.5241013, -2.544863, 2.898867, 1, 0, 0, 1, 1,
0.5252686, 0.6439068, 0.8928252, 1, 0, 0, 1, 1,
0.5256761, -0.8504457, 1.499469, 1, 0, 0, 1, 1,
0.5258872, -0.06881076, 1.91534, 0, 0, 0, 1, 1,
0.5264784, 1.231252, 0.08701941, 0, 0, 0, 1, 1,
0.5274454, -0.6186835, 3.205827, 0, 0, 0, 1, 1,
0.527562, 0.5584409, 0.7634524, 0, 0, 0, 1, 1,
0.5304106, 1.127426, 0.5328875, 0, 0, 0, 1, 1,
0.5320443, 1.384817, 0.7389035, 0, 0, 0, 1, 1,
0.5405743, -0.3138203, 2.582506, 0, 0, 0, 1, 1,
0.5451833, -0.5804588, 1.183756, 1, 1, 1, 1, 1,
0.5461291, 0.4021029, 1.43815, 1, 1, 1, 1, 1,
0.5490617, -0.4259081, 2.183457, 1, 1, 1, 1, 1,
0.552393, 1.527986, -0.1886313, 1, 1, 1, 1, 1,
0.5528535, 1.020959, -0.9538697, 1, 1, 1, 1, 1,
0.5542423, -0.2819829, 1.394308, 1, 1, 1, 1, 1,
0.5572662, -0.3545074, 1.010834, 1, 1, 1, 1, 1,
0.5598962, -0.9549841, 1.786657, 1, 1, 1, 1, 1,
0.5604019, 0.213796, -0.3286476, 1, 1, 1, 1, 1,
0.5696483, 0.8735623, 0.3394043, 1, 1, 1, 1, 1,
0.5705604, 0.5771133, 1.4081, 1, 1, 1, 1, 1,
0.5727057, -1.025469, 3.118141, 1, 1, 1, 1, 1,
0.5730612, 1.295887, 0.9590656, 1, 1, 1, 1, 1,
0.5765917, 0.6080091, 1.403407, 1, 1, 1, 1, 1,
0.5782749, -2.725921, 2.503431, 1, 1, 1, 1, 1,
0.5814712, 2.226287, 1.449738, 0, 0, 1, 1, 1,
0.5919374, 0.5670429, 0.3714653, 1, 0, 0, 1, 1,
0.5931913, -1.041494, 1.806797, 1, 0, 0, 1, 1,
0.5937414, 0.4277398, 0.3954676, 1, 0, 0, 1, 1,
0.593911, 0.8173926, 0.5453627, 1, 0, 0, 1, 1,
0.5943277, 2.80477, 0.02070724, 1, 0, 0, 1, 1,
0.5951397, -0.8960686, 3.192525, 0, 0, 0, 1, 1,
0.5976409, 0.6521596, 1.755178, 0, 0, 0, 1, 1,
0.6048677, -0.04214301, 1.557498, 0, 0, 0, 1, 1,
0.6104397, -0.6466098, 3.132972, 0, 0, 0, 1, 1,
0.6104448, 0.660788, 1.72422, 0, 0, 0, 1, 1,
0.6203696, -0.01514009, 3.732394, 0, 0, 0, 1, 1,
0.6220176, -0.7947421, 3.412313, 0, 0, 0, 1, 1,
0.6248948, -0.3023464, 2.671618, 1, 1, 1, 1, 1,
0.6329139, -1.387209, 2.257948, 1, 1, 1, 1, 1,
0.6365193, 0.564986, -1.793723, 1, 1, 1, 1, 1,
0.6394005, -1.341769, 2.023563, 1, 1, 1, 1, 1,
0.6395165, 0.06744862, 1.172065, 1, 1, 1, 1, 1,
0.6408954, -1.350996, 2.536532, 1, 1, 1, 1, 1,
0.6429045, 1.132296, 1.629337, 1, 1, 1, 1, 1,
0.6466311, 0.5258601, 1.949131, 1, 1, 1, 1, 1,
0.6473172, 0.4398264, 2.096864, 1, 1, 1, 1, 1,
0.64931, -1.889705, 3.11735, 1, 1, 1, 1, 1,
0.6594793, -0.2148799, 0.6466683, 1, 1, 1, 1, 1,
0.6631159, -0.9341205, 2.65652, 1, 1, 1, 1, 1,
0.664079, -0.8448972, 2.698338, 1, 1, 1, 1, 1,
0.6647822, 0.5493015, 1.635269, 1, 1, 1, 1, 1,
0.6673248, 0.02464338, 1.289171, 1, 1, 1, 1, 1,
0.671465, -0.1400236, 0.8474809, 0, 0, 1, 1, 1,
0.6766888, -0.173127, 1.750946, 1, 0, 0, 1, 1,
0.6854954, 1.819461, -0.05500999, 1, 0, 0, 1, 1,
0.6882172, 0.2175449, 1.207311, 1, 0, 0, 1, 1,
0.6897088, -0.07614296, 2.391961, 1, 0, 0, 1, 1,
0.6916091, -0.05029594, 1.585036, 1, 0, 0, 1, 1,
0.6959137, -0.6325665, 1.046792, 0, 0, 0, 1, 1,
0.7009735, -0.2746731, 0.9520725, 0, 0, 0, 1, 1,
0.7019882, 0.3002493, 1.770598, 0, 0, 0, 1, 1,
0.7043446, 1.615378, 0.2577266, 0, 0, 0, 1, 1,
0.7054977, -0.3634022, 1.831475, 0, 0, 0, 1, 1,
0.7072005, 0.4607554, 0.7733381, 0, 0, 0, 1, 1,
0.7104431, -0.64889, 1.657547, 0, 0, 0, 1, 1,
0.7130989, 1.251985, 1.520355, 1, 1, 1, 1, 1,
0.7154715, -1.241026, 3.77877, 1, 1, 1, 1, 1,
0.720788, -0.3441095, 2.139193, 1, 1, 1, 1, 1,
0.7237837, 0.8228715, -1.109509, 1, 1, 1, 1, 1,
0.725733, 1.404023, 1.424231, 1, 1, 1, 1, 1,
0.7275615, -0.4187124, 4.150484, 1, 1, 1, 1, 1,
0.7309804, 0.09469154, 4.060802, 1, 1, 1, 1, 1,
0.733761, -1.586259, 2.05484, 1, 1, 1, 1, 1,
0.7358372, 1.31697, 0.7722183, 1, 1, 1, 1, 1,
0.7366511, 0.2607571, 3.904437, 1, 1, 1, 1, 1,
0.7455593, 0.4692264, 1.859012, 1, 1, 1, 1, 1,
0.7512523, -0.5270762, 0.7153168, 1, 1, 1, 1, 1,
0.7571859, 0.1514285, 2.248769, 1, 1, 1, 1, 1,
0.7604876, 0.03004575, -0.1552787, 1, 1, 1, 1, 1,
0.7665291, 0.1623763, 0.475883, 1, 1, 1, 1, 1,
0.7678676, -1.057498, 1.971833, 0, 0, 1, 1, 1,
0.7702098, 0.8252616, -1.80459, 1, 0, 0, 1, 1,
0.7727402, -1.451276, 3.108145, 1, 0, 0, 1, 1,
0.776206, -0.4242964, 2.928913, 1, 0, 0, 1, 1,
0.7777119, 0.2276538, 1.119201, 1, 0, 0, 1, 1,
0.7823256, 1.562549, -0.3397748, 1, 0, 0, 1, 1,
0.7826532, 1.243534, 1.258119, 0, 0, 0, 1, 1,
0.7890722, 1.234545, 1.309096, 0, 0, 0, 1, 1,
0.7921332, 1.015323, 0.1764937, 0, 0, 0, 1, 1,
0.7930919, 0.1236892, 1.530503, 0, 0, 0, 1, 1,
0.7988446, -0.9539388, 1.639622, 0, 0, 0, 1, 1,
0.7997695, 0.4527147, 1.268985, 0, 0, 0, 1, 1,
0.8004502, 0.8032027, -0.04461696, 0, 0, 0, 1, 1,
0.800933, 0.757955, -0.3548853, 1, 1, 1, 1, 1,
0.8054243, 0.2112174, 1.155906, 1, 1, 1, 1, 1,
0.8063761, 1.73236, 0.5731117, 1, 1, 1, 1, 1,
0.8136547, -1.770463, 3.784892, 1, 1, 1, 1, 1,
0.8136731, -0.7603449, 3.469511, 1, 1, 1, 1, 1,
0.8168855, -0.2886231, 0.8178822, 1, 1, 1, 1, 1,
0.8172708, 0.3987827, 1.933604, 1, 1, 1, 1, 1,
0.8368795, 1.749425, 0.7957636, 1, 1, 1, 1, 1,
0.8395472, -0.4106214, 2.230095, 1, 1, 1, 1, 1,
0.841424, 0.6240456, 1.536326, 1, 1, 1, 1, 1,
0.8433904, -0.3950833, 0.1106282, 1, 1, 1, 1, 1,
0.8516514, 0.4619053, -1.599528, 1, 1, 1, 1, 1,
0.8545772, -0.226232, 1.991177, 1, 1, 1, 1, 1,
0.8566432, -1.012806, 1.437042, 1, 1, 1, 1, 1,
0.8566712, 2.37964, -0.09842106, 1, 1, 1, 1, 1,
0.8593705, 0.07684075, 0.3672325, 0, 0, 1, 1, 1,
0.8637357, -2.479099, 2.599661, 1, 0, 0, 1, 1,
0.8653435, -0.6190053, 1.36008, 1, 0, 0, 1, 1,
0.8698157, -0.1579502, 0.1898551, 1, 0, 0, 1, 1,
0.880539, 0.9285049, 0.7607646, 1, 0, 0, 1, 1,
0.8824717, -0.4011838, 0.5090595, 1, 0, 0, 1, 1,
0.8836997, 1.039196, 0.9889438, 0, 0, 0, 1, 1,
0.8845822, 0.1779574, 1.530885, 0, 0, 0, 1, 1,
0.8857021, 0.137814, 0.9980089, 0, 0, 0, 1, 1,
0.8874794, 0.5479336, 0.8559312, 0, 0, 0, 1, 1,
0.8895405, 0.9671752, -0.5483398, 0, 0, 0, 1, 1,
0.8946598, -1.193314, 1.959052, 0, 0, 0, 1, 1,
0.9017265, -0.7844985, 1.909569, 0, 0, 0, 1, 1,
0.9073693, 0.6880122, -0.7522302, 1, 1, 1, 1, 1,
0.9324619, 1.57873, 1.108385, 1, 1, 1, 1, 1,
0.9331323, 0.8960127, 2.221204, 1, 1, 1, 1, 1,
0.9343138, 0.3693195, 3.612673, 1, 1, 1, 1, 1,
0.9349545, 0.9126481, 0.8986881, 1, 1, 1, 1, 1,
0.9430144, 0.3008223, 2.17532, 1, 1, 1, 1, 1,
0.9446155, -0.5597242, 1.170709, 1, 1, 1, 1, 1,
0.9515888, 0.1092177, 1.863997, 1, 1, 1, 1, 1,
0.9581066, 0.5309046, 3.253364, 1, 1, 1, 1, 1,
0.9610699, 0.1866826, 1.364771, 1, 1, 1, 1, 1,
0.9714631, -1.87417, 3.333008, 1, 1, 1, 1, 1,
0.9728775, 0.1707834, 2.97225, 1, 1, 1, 1, 1,
0.9803193, -0.4931583, 1.22167, 1, 1, 1, 1, 1,
0.983139, 1.974021, 1.944342, 1, 1, 1, 1, 1,
0.9859442, -0.1811047, 2.58403, 1, 1, 1, 1, 1,
0.9881234, -1.094421, 2.444678, 0, 0, 1, 1, 1,
0.9887078, 0.7595958, 1.595575, 1, 0, 0, 1, 1,
0.9891362, 0.03998088, 1.605923, 1, 0, 0, 1, 1,
0.9925224, -0.235407, 1.662179, 1, 0, 0, 1, 1,
1.000963, 0.09777709, 1.285301, 1, 0, 0, 1, 1,
1.003827, -0.4892367, 1.757561, 1, 0, 0, 1, 1,
1.007185, -0.4028488, 3.20632, 0, 0, 0, 1, 1,
1.012647, 0.5192173, 1.034911, 0, 0, 0, 1, 1,
1.013745, 0.9138075, 0.5388618, 0, 0, 0, 1, 1,
1.01659, 1.582906, 0.4062475, 0, 0, 0, 1, 1,
1.020562, -1.008522, 1.860743, 0, 0, 0, 1, 1,
1.026214, 0.76099, 0.8316192, 0, 0, 0, 1, 1,
1.02758, -0.5321804, 1.651174, 0, 0, 0, 1, 1,
1.033951, 0.5055564, 1.065324, 1, 1, 1, 1, 1,
1.036392, 1.649025, -0.9172542, 1, 1, 1, 1, 1,
1.04722, 1.036486, 0.8689067, 1, 1, 1, 1, 1,
1.047514, 2.084286, 0.7470629, 1, 1, 1, 1, 1,
1.05628, -1.648774, 2.378293, 1, 1, 1, 1, 1,
1.056309, 0.8249219, 0.5235702, 1, 1, 1, 1, 1,
1.06107, 1.677039, 1.2531, 1, 1, 1, 1, 1,
1.065951, 0.7523882, 1.001387, 1, 1, 1, 1, 1,
1.070964, 0.1625706, 0.3560858, 1, 1, 1, 1, 1,
1.080544, 0.5115263, 0.9683145, 1, 1, 1, 1, 1,
1.084371, 1.481129, 0.5212378, 1, 1, 1, 1, 1,
1.091781, 0.9719359, -0.4039938, 1, 1, 1, 1, 1,
1.093811, -2.042008, 2.3619, 1, 1, 1, 1, 1,
1.099036, 0.4823372, 0.1936606, 1, 1, 1, 1, 1,
1.103976, 1.117042, 0.2202689, 1, 1, 1, 1, 1,
1.106436, -1.294514, 2.505889, 0, 0, 1, 1, 1,
1.107923, -3.020999, 2.99255, 1, 0, 0, 1, 1,
1.109113, -0.759567, 1.63364, 1, 0, 0, 1, 1,
1.110096, 0.775602, 0.7978243, 1, 0, 0, 1, 1,
1.125723, 1.464623, 0.8905746, 1, 0, 0, 1, 1,
1.126402, -0.2340973, 1.597865, 1, 0, 0, 1, 1,
1.133217, -0.008950771, 1.628329, 0, 0, 0, 1, 1,
1.137542, -0.3302487, 2.536757, 0, 0, 0, 1, 1,
1.139761, -1.980308, 2.035522, 0, 0, 0, 1, 1,
1.143548, 0.356011, 1.756991, 0, 0, 0, 1, 1,
1.163872, -0.4769515, 3.219676, 0, 0, 0, 1, 1,
1.165121, 1.308053, -0.7709293, 0, 0, 0, 1, 1,
1.171372, 0.972788, 1.92123, 0, 0, 0, 1, 1,
1.174837, 0.8547151, 0.1030395, 1, 1, 1, 1, 1,
1.177055, 0.8846112, 0.9916192, 1, 1, 1, 1, 1,
1.184079, 0.2818259, 1.397393, 1, 1, 1, 1, 1,
1.194799, -0.9654052, 0.7352979, 1, 1, 1, 1, 1,
1.197622, 1.54622, 2.145025, 1, 1, 1, 1, 1,
1.205683, -1.457582, 2.672145, 1, 1, 1, 1, 1,
1.217713, -1.209012, 2.786036, 1, 1, 1, 1, 1,
1.217822, 0.3679959, 3.250329, 1, 1, 1, 1, 1,
1.230609, -1.286712, 3.655587, 1, 1, 1, 1, 1,
1.240348, -1.439514, 3.422536, 1, 1, 1, 1, 1,
1.248028, 0.7800953, 0.181068, 1, 1, 1, 1, 1,
1.250621, -0.149194, 0.6119666, 1, 1, 1, 1, 1,
1.251642, -1.156069, 2.10727, 1, 1, 1, 1, 1,
1.255822, -0.4609118, 3.416048, 1, 1, 1, 1, 1,
1.263821, -0.9762951, 2.938371, 1, 1, 1, 1, 1,
1.267737, -1.088611, 3.108077, 0, 0, 1, 1, 1,
1.272618, 1.675864, 2.733123, 1, 0, 0, 1, 1,
1.276521, 1.117687, 2.102857, 1, 0, 0, 1, 1,
1.281125, 1.322836, 0.7262479, 1, 0, 0, 1, 1,
1.281332, 1.671704, -0.5004895, 1, 0, 0, 1, 1,
1.281971, -0.305186, 2.57934, 1, 0, 0, 1, 1,
1.285259, -0.3004479, 1.028719, 0, 0, 0, 1, 1,
1.286616, 0.1753217, 1.487004, 0, 0, 0, 1, 1,
1.294775, -0.2532418, 2.40396, 0, 0, 0, 1, 1,
1.305784, -0.4891306, 2.431943, 0, 0, 0, 1, 1,
1.316375, -0.6411985, -0.1748248, 0, 0, 0, 1, 1,
1.319605, -1.048007, 2.540234, 0, 0, 0, 1, 1,
1.319772, -0.3779135, 1.754883, 0, 0, 0, 1, 1,
1.331785, 1.01546, 1.323004, 1, 1, 1, 1, 1,
1.337841, 0.560065, 2.646922, 1, 1, 1, 1, 1,
1.348368, 1.041679, -0.06287775, 1, 1, 1, 1, 1,
1.355937, 0.9957952, 0.6209686, 1, 1, 1, 1, 1,
1.359776, 1.461, 0.05663125, 1, 1, 1, 1, 1,
1.361535, 0.952452, 1.587511, 1, 1, 1, 1, 1,
1.363809, 1.210841, -0.008835638, 1, 1, 1, 1, 1,
1.36523, -1.708316, 2.976844, 1, 1, 1, 1, 1,
1.371518, -0.7633712, 1.587471, 1, 1, 1, 1, 1,
1.373565, -0.1995131, 0.7189369, 1, 1, 1, 1, 1,
1.375095, -0.3335911, 0.8258627, 1, 1, 1, 1, 1,
1.379486, -0.6347209, 2.257285, 1, 1, 1, 1, 1,
1.395021, 0.4283917, 0.5393158, 1, 1, 1, 1, 1,
1.398151, -0.02630008, 1.477716, 1, 1, 1, 1, 1,
1.401643, 0.1123481, 0.3756422, 1, 1, 1, 1, 1,
1.407602, 1.125246, 0.5947797, 0, 0, 1, 1, 1,
1.413393, 0.4263318, 2.645791, 1, 0, 0, 1, 1,
1.415539, -1.756825, 2.617048, 1, 0, 0, 1, 1,
1.439655, 0.04389051, 1.603781, 1, 0, 0, 1, 1,
1.453109, -0.9345948, 2.648293, 1, 0, 0, 1, 1,
1.453799, -0.9037969, 1.74659, 1, 0, 0, 1, 1,
1.456277, -0.1635773, 2.013064, 0, 0, 0, 1, 1,
1.470867, -0.07700043, 2.015523, 0, 0, 0, 1, 1,
1.483198, -0.8177264, 2.384003, 0, 0, 0, 1, 1,
1.504583, 0.2104876, 2.549407, 0, 0, 0, 1, 1,
1.520055, 0.6453069, 1.618869, 0, 0, 0, 1, 1,
1.52207, 0.9747933, 0.01719955, 0, 0, 0, 1, 1,
1.525045, 1.189173, -0.278796, 0, 0, 0, 1, 1,
1.525967, -0.8156086, 1.882101, 1, 1, 1, 1, 1,
1.532216, -0.1199967, 1.729378, 1, 1, 1, 1, 1,
1.53737, 1.457001, -0.8822995, 1, 1, 1, 1, 1,
1.546844, 0.4526215, -0.08996444, 1, 1, 1, 1, 1,
1.547555, -0.1277096, 0.9400477, 1, 1, 1, 1, 1,
1.548239, -1.450899, 2.454685, 1, 1, 1, 1, 1,
1.554436, 0.1938188, 1.560043, 1, 1, 1, 1, 1,
1.55854, -3.204463, 2.309805, 1, 1, 1, 1, 1,
1.576693, -0.2605482, 2.973159, 1, 1, 1, 1, 1,
1.582881, 1.132402, 0.3273023, 1, 1, 1, 1, 1,
1.602698, -0.05297712, 1.443611, 1, 1, 1, 1, 1,
1.604899, -1.457603, 2.281852, 1, 1, 1, 1, 1,
1.608196, -1.439462, 2.004615, 1, 1, 1, 1, 1,
1.618905, 0.9773403, 2.39978, 1, 1, 1, 1, 1,
1.625838, -0.3634956, 0.9738468, 1, 1, 1, 1, 1,
1.641904, -0.6833593, 4.002992, 0, 0, 1, 1, 1,
1.679736, 0.09268252, 1.973678, 1, 0, 0, 1, 1,
1.694478, 0.3255321, 1.958619, 1, 0, 0, 1, 1,
1.705914, -1.504431, 2.740892, 1, 0, 0, 1, 1,
1.716974, 0.5198503, 0.8445839, 1, 0, 0, 1, 1,
1.739611, -0.3903702, 3.284799, 1, 0, 0, 1, 1,
1.743049, 1.315323, 0.5981038, 0, 0, 0, 1, 1,
1.754786, -0.1240889, 3.209946, 0, 0, 0, 1, 1,
1.764323, 0.1935683, 0.8707285, 0, 0, 0, 1, 1,
1.770426, -0.5679437, 2.855522, 0, 0, 0, 1, 1,
1.774299, 0.5783605, 2.1255, 0, 0, 0, 1, 1,
1.789842, 0.2998598, 1.582835, 0, 0, 0, 1, 1,
1.792204, 0.6534446, 1.347199, 0, 0, 0, 1, 1,
1.81917, -0.266993, 2.057009, 1, 1, 1, 1, 1,
1.833966, 0.5795645, 1.356228, 1, 1, 1, 1, 1,
1.83767, -0.2589684, 3.286785, 1, 1, 1, 1, 1,
1.838029, -1.220409, 2.893176, 1, 1, 1, 1, 1,
1.886682, 0.4443931, 2.319681, 1, 1, 1, 1, 1,
1.892778, 0.8194531, 2.180369, 1, 1, 1, 1, 1,
1.918043, -0.2848837, 3.025535, 1, 1, 1, 1, 1,
1.969345, 1.096981, -0.04930282, 1, 1, 1, 1, 1,
1.971692, 1.028876, 0.2850465, 1, 1, 1, 1, 1,
1.980283, -0.2949019, 1.453979, 1, 1, 1, 1, 1,
1.981578, -0.3711868, 0.513868, 1, 1, 1, 1, 1,
2.069664, -1.332798, 1.027614, 1, 1, 1, 1, 1,
2.083812, -0.9157456, -0.3573073, 1, 1, 1, 1, 1,
2.085838, 0.9093361, 1.356476, 1, 1, 1, 1, 1,
2.131842, -0.05812663, 1.689828, 1, 1, 1, 1, 1,
2.138714, 1.53245, 2.357006, 0, 0, 1, 1, 1,
2.146285, -0.3860417, 1.353556, 1, 0, 0, 1, 1,
2.151012, 0.3273108, 1.971171, 1, 0, 0, 1, 1,
2.153305, 0.2240562, 4.023239, 1, 0, 0, 1, 1,
2.166076, -0.8816001, 1.143795, 1, 0, 0, 1, 1,
2.171806, -0.3706958, 1.171805, 1, 0, 0, 1, 1,
2.184374, 0.6122496, 2.268325, 0, 0, 0, 1, 1,
2.213639, 0.740932, 2.986533, 0, 0, 0, 1, 1,
2.232626, -0.5720969, 1.05956, 0, 0, 0, 1, 1,
2.242819, -0.9741277, 3.44791, 0, 0, 0, 1, 1,
2.249471, -0.1909797, 1.415151, 0, 0, 0, 1, 1,
2.310925, 0.5900926, 1.863355, 0, 0, 0, 1, 1,
2.347124, 1.577637, 0.7728456, 0, 0, 0, 1, 1,
2.411755, -0.8902894, -0.3969975, 1, 1, 1, 1, 1,
2.42283, -0.162899, -0.009228402, 1, 1, 1, 1, 1,
2.47315, 0.053385, 1.449012, 1, 1, 1, 1, 1,
2.727117, -0.6657386, 0.8672508, 1, 1, 1, 1, 1,
2.913539, -0.2751328, 2.974585, 1, 1, 1, 1, 1,
2.954751, -0.1237948, 3.767586, 1, 1, 1, 1, 1,
3.207243, 0.7261585, 2.09587, 1, 1, 1, 1, 1
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
var radius = 9.145396;
var distance = 32.12282;
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
mvMatrix.translate( -0.01879072, -0.3079319, 0.2459261 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.12282);
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
