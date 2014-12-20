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
-3.063576, 0.02140719, -1.393298, 1, 0, 0, 1,
-3.035495, -0.0553389, -1.245281, 1, 0.007843138, 0, 1,
-2.856358, 1.61669, 0.03259708, 1, 0.01176471, 0, 1,
-2.82536, 0.378302, -2.963365, 1, 0.01960784, 0, 1,
-2.801995, 0.04358792, -1.371847, 1, 0.02352941, 0, 1,
-2.737494, -0.5194044, -0.4942238, 1, 0.03137255, 0, 1,
-2.713441, -0.2983778, -2.89342, 1, 0.03529412, 0, 1,
-2.633441, 0.4449498, -1.115787, 1, 0.04313726, 0, 1,
-2.537209, 0.1376136, -1.248337, 1, 0.04705882, 0, 1,
-2.531045, -0.6507862, -2.822315, 1, 0.05490196, 0, 1,
-2.516862, 0.4923271, -1.30337, 1, 0.05882353, 0, 1,
-2.506283, 0.8404586, -1.427158, 1, 0.06666667, 0, 1,
-2.453794, -0.129495, -1.994918, 1, 0.07058824, 0, 1,
-2.429606, -0.1239266, -0.9677734, 1, 0.07843138, 0, 1,
-2.373451, -1.294664, -3.517119, 1, 0.08235294, 0, 1,
-2.345336, 0.4420943, -0.9446197, 1, 0.09019608, 0, 1,
-2.337693, -1.050306, -2.815373, 1, 0.09411765, 0, 1,
-2.310642, 0.8643276, -1.580935, 1, 0.1019608, 0, 1,
-2.260236, -1.32119, -2.195139, 1, 0.1098039, 0, 1,
-2.16651, -0.04927577, -2.854454, 1, 0.1137255, 0, 1,
-2.159158, 0.2125921, -0.2859391, 1, 0.1215686, 0, 1,
-2.158786, -0.1399273, -0.4388998, 1, 0.1254902, 0, 1,
-2.082256, -1.532335, -2.07645, 1, 0.1333333, 0, 1,
-2.078238, 0.4383415, -1.195118, 1, 0.1372549, 0, 1,
-2.068196, -0.6882769, -1.472345, 1, 0.145098, 0, 1,
-2.065189, 1.185226, -0.01935036, 1, 0.1490196, 0, 1,
-2.056519, -0.3472476, -1.92011, 1, 0.1568628, 0, 1,
-2.040489, 2.22181, 1.282256, 1, 0.1607843, 0, 1,
-2.024575, 0.2059478, -1.496337, 1, 0.1686275, 0, 1,
-1.987468, 0.3664602, -2.235558, 1, 0.172549, 0, 1,
-1.985151, 0.463334, -3.328954, 1, 0.1803922, 0, 1,
-1.953521, -0.3831438, -1.404817, 1, 0.1843137, 0, 1,
-1.951313, 0.2808733, -1.420131, 1, 0.1921569, 0, 1,
-1.936848, 1.587005, -1.315035, 1, 0.1960784, 0, 1,
-1.914037, 1.920036, -0.4222803, 1, 0.2039216, 0, 1,
-1.913918, 0.2799113, -1.826791, 1, 0.2117647, 0, 1,
-1.913111, 0.5866435, -3.043218, 1, 0.2156863, 0, 1,
-1.880089, -0.4328511, -2.883386, 1, 0.2235294, 0, 1,
-1.846091, 0.9220696, -0.8317799, 1, 0.227451, 0, 1,
-1.84045, 0.5322708, -0.2572376, 1, 0.2352941, 0, 1,
-1.830968, 1.341268, -1.279043, 1, 0.2392157, 0, 1,
-1.820565, -1.558511, -1.471005, 1, 0.2470588, 0, 1,
-1.817495, 0.2538468, -0.1814924, 1, 0.2509804, 0, 1,
-1.802659, -0.5636829, -3.7261, 1, 0.2588235, 0, 1,
-1.798184, -0.4468045, -0.01710258, 1, 0.2627451, 0, 1,
-1.79547, -0.7302211, -0.5420417, 1, 0.2705882, 0, 1,
-1.789837, 0.5488873, -0.04713687, 1, 0.2745098, 0, 1,
-1.784117, -0.8007447, -2.296596, 1, 0.282353, 0, 1,
-1.775729, -0.7119556, -3.163067, 1, 0.2862745, 0, 1,
-1.752674, -0.6714026, -0.7503371, 1, 0.2941177, 0, 1,
-1.738936, 0.3021771, -1.967727, 1, 0.3019608, 0, 1,
-1.735531, -1.49018, -2.498955, 1, 0.3058824, 0, 1,
-1.699608, 1.380071, -1.576825, 1, 0.3137255, 0, 1,
-1.666565, 0.3598243, -0.4236283, 1, 0.3176471, 0, 1,
-1.649175, 0.3081155, -1.303251, 1, 0.3254902, 0, 1,
-1.645934, -1.37905, -1.403488, 1, 0.3294118, 0, 1,
-1.645582, -0.6250468, -1.867639, 1, 0.3372549, 0, 1,
-1.635355, -0.07491943, -0.2472955, 1, 0.3411765, 0, 1,
-1.620006, 0.5433219, -2.803952, 1, 0.3490196, 0, 1,
-1.578795, 0.6503726, -0.2017248, 1, 0.3529412, 0, 1,
-1.573817, 1.016878, -0.673749, 1, 0.3607843, 0, 1,
-1.570803, -0.6241515, -1.305309, 1, 0.3647059, 0, 1,
-1.568728, -0.8800414, -3.94672, 1, 0.372549, 0, 1,
-1.520298, -0.7851701, -4.680469, 1, 0.3764706, 0, 1,
-1.498066, 0.08966642, -1.148692, 1, 0.3843137, 0, 1,
-1.486998, -0.4309431, -2.136263, 1, 0.3882353, 0, 1,
-1.485827, -0.5991511, -2.766561, 1, 0.3960784, 0, 1,
-1.484299, -1.112459, -0.1601269, 1, 0.4039216, 0, 1,
-1.47796, 0.6383846, -1.754805, 1, 0.4078431, 0, 1,
-1.475236, -1.106559, -0.2981957, 1, 0.4156863, 0, 1,
-1.475234, 0.3666795, -0.1619231, 1, 0.4196078, 0, 1,
-1.458714, -1.991681, -1.951821, 1, 0.427451, 0, 1,
-1.432596, 1.006911, -0.2317717, 1, 0.4313726, 0, 1,
-1.430508, 1.214715, -0.8616647, 1, 0.4392157, 0, 1,
-1.429337, 1.487519, -0.4673927, 1, 0.4431373, 0, 1,
-1.428588, 0.8977459, -3.432274, 1, 0.4509804, 0, 1,
-1.407109, -0.7485408, -1.314977, 1, 0.454902, 0, 1,
-1.383775, -0.2794936, -1.664649, 1, 0.4627451, 0, 1,
-1.383048, -1.795517, -0.8009266, 1, 0.4666667, 0, 1,
-1.381237, 0.01459384, -0.3815377, 1, 0.4745098, 0, 1,
-1.380275, -0.1715062, -2.894205, 1, 0.4784314, 0, 1,
-1.379066, -2.383054, -1.870223, 1, 0.4862745, 0, 1,
-1.370099, 1.362084, -1.331506, 1, 0.4901961, 0, 1,
-1.364125, 0.5238717, -0.4465515, 1, 0.4980392, 0, 1,
-1.357198, 1.337506, -1.596292, 1, 0.5058824, 0, 1,
-1.336155, -0.8719405, -0.708077, 1, 0.509804, 0, 1,
-1.315671, 0.2100714, -3.387436, 1, 0.5176471, 0, 1,
-1.314616, 1.155733, -1.118715, 1, 0.5215687, 0, 1,
-1.307537, -1.694396, -2.514366, 1, 0.5294118, 0, 1,
-1.282998, -0.2551238, 0.0867148, 1, 0.5333334, 0, 1,
-1.275944, 1.003238, 1.980345, 1, 0.5411765, 0, 1,
-1.275745, 0.5890146, -1.21901, 1, 0.5450981, 0, 1,
-1.274688, -1.09378, -2.892286, 1, 0.5529412, 0, 1,
-1.271521, 0.1477164, -2.723772, 1, 0.5568628, 0, 1,
-1.254077, -0.5240382, -3.829129, 1, 0.5647059, 0, 1,
-1.252927, 0.664655, 0.007598707, 1, 0.5686275, 0, 1,
-1.251731, 0.7988002, -0.6901233, 1, 0.5764706, 0, 1,
-1.247538, -1.632738, -1.877574, 1, 0.5803922, 0, 1,
-1.230099, -0.337268, -0.6983539, 1, 0.5882353, 0, 1,
-1.229034, -0.8638707, -2.068208, 1, 0.5921569, 0, 1,
-1.221018, -1.571748, -3.734896, 1, 0.6, 0, 1,
-1.218994, -0.6821854, -2.217875, 1, 0.6078432, 0, 1,
-1.21744, -1.888146, -4.069587, 1, 0.6117647, 0, 1,
-1.213969, -2.474437, -1.705967, 1, 0.6196079, 0, 1,
-1.205637, -0.6500338, -3.771705, 1, 0.6235294, 0, 1,
-1.204334, 0.9349859, -1.797738, 1, 0.6313726, 0, 1,
-1.200945, 0.4978647, -0.08990604, 1, 0.6352941, 0, 1,
-1.200905, -2.910759, -3.542818, 1, 0.6431373, 0, 1,
-1.195613, 1.232875, -1.182359, 1, 0.6470588, 0, 1,
-1.178488, -1.964885, -3.811178, 1, 0.654902, 0, 1,
-1.176883, -0.9630762, -1.415159, 1, 0.6588235, 0, 1,
-1.176105, 1.964464, -0.2200805, 1, 0.6666667, 0, 1,
-1.175692, 0.4203389, -1.473082, 1, 0.6705883, 0, 1,
-1.174118, 0.07371844, -1.075702, 1, 0.6784314, 0, 1,
-1.171538, -0.4797471, -1.700402, 1, 0.682353, 0, 1,
-1.169242, 0.783154, -0.2592619, 1, 0.6901961, 0, 1,
-1.168597, -0.4924212, -3.840749, 1, 0.6941177, 0, 1,
-1.164852, -0.2148788, -1.581508, 1, 0.7019608, 0, 1,
-1.162346, -0.6813816, -0.8963243, 1, 0.7098039, 0, 1,
-1.15433, 1.417685, -1.736319, 1, 0.7137255, 0, 1,
-1.151641, -0.2545093, -0.8901885, 1, 0.7215686, 0, 1,
-1.149122, 1.41823, -0.3860352, 1, 0.7254902, 0, 1,
-1.139866, 0.1482702, -3.153898, 1, 0.7333333, 0, 1,
-1.138029, 0.8074563, -0.4894739, 1, 0.7372549, 0, 1,
-1.13137, -0.3856487, -1.370245, 1, 0.7450981, 0, 1,
-1.129073, 0.1982745, -1.663256, 1, 0.7490196, 0, 1,
-1.127421, -0.4575769, -2.078671, 1, 0.7568628, 0, 1,
-1.123496, 1.44705, 0.854841, 1, 0.7607843, 0, 1,
-1.116951, 0.5871124, -3.241399, 1, 0.7686275, 0, 1,
-1.114802, -1.40432, -2.773165, 1, 0.772549, 0, 1,
-1.114461, -0.6792533, -0.9999042, 1, 0.7803922, 0, 1,
-1.105024, -0.8452291, -2.577582, 1, 0.7843137, 0, 1,
-1.100552, -0.2020863, -2.063821, 1, 0.7921569, 0, 1,
-1.09868, -2.030127, -3.302001, 1, 0.7960784, 0, 1,
-1.089866, -0.3650392, -0.9870128, 1, 0.8039216, 0, 1,
-1.089449, 1.022057, -0.2527527, 1, 0.8117647, 0, 1,
-1.084744, 0.6565394, 1.444185, 1, 0.8156863, 0, 1,
-1.079978, 0.8157053, -0.9967697, 1, 0.8235294, 0, 1,
-1.077782, -1.315305, -3.694991, 1, 0.827451, 0, 1,
-1.074762, 1.234475, -0.491793, 1, 0.8352941, 0, 1,
-1.074415, 1.564163, -0.1822866, 1, 0.8392157, 0, 1,
-1.07395, 0.1239744, -1.034151, 1, 0.8470588, 0, 1,
-1.06641, -0.7894942, -2.412358, 1, 0.8509804, 0, 1,
-1.064995, -0.5083092, -1.000261, 1, 0.8588235, 0, 1,
-1.062533, 1.50037, 0.7213795, 1, 0.8627451, 0, 1,
-1.051412, 0.09041972, -2.199285, 1, 0.8705882, 0, 1,
-1.05075, -0.02076365, -1.470308, 1, 0.8745098, 0, 1,
-1.034256, 0.5949942, -0.3043534, 1, 0.8823529, 0, 1,
-1.028548, -0.6853764, -1.652933, 1, 0.8862745, 0, 1,
-1.00834, -1.277074, -1.38788, 1, 0.8941177, 0, 1,
-1.004507, 0.0657477, -1.830408, 1, 0.8980392, 0, 1,
-1.003683, -0.4677845, -1.525985, 1, 0.9058824, 0, 1,
-1.001788, 0.5820561, -1.059687, 1, 0.9137255, 0, 1,
-0.9952938, 0.4712747, -0.4914769, 1, 0.9176471, 0, 1,
-0.9948123, -0.5997232, -1.78645, 1, 0.9254902, 0, 1,
-0.9937637, 0.05781648, -2.992165, 1, 0.9294118, 0, 1,
-0.9931985, -0.4227825, -2.478917, 1, 0.9372549, 0, 1,
-0.992927, 0.5312992, -2.36773, 1, 0.9411765, 0, 1,
-0.9921298, -0.9638354, -2.018226, 1, 0.9490196, 0, 1,
-0.9915069, -0.9739835, -3.118088, 1, 0.9529412, 0, 1,
-0.9895314, -1.454622, -0.1270283, 1, 0.9607843, 0, 1,
-0.9891476, -1.524635, -1.627603, 1, 0.9647059, 0, 1,
-0.9878156, -0.8056295, -2.921358, 1, 0.972549, 0, 1,
-0.9829454, 0.4118375, -0.5636486, 1, 0.9764706, 0, 1,
-0.9817323, -1.658927, -3.728554, 1, 0.9843137, 0, 1,
-0.9719892, -0.2973902, -0.7937244, 1, 0.9882353, 0, 1,
-0.9651135, -0.7792801, -4.066122, 1, 0.9960784, 0, 1,
-0.9634317, -0.8551767, -1.503851, 0.9960784, 1, 0, 1,
-0.963368, 1.352429, -0.9749399, 0.9921569, 1, 0, 1,
-0.9552303, 0.7180259, -2.303101, 0.9843137, 1, 0, 1,
-0.9548475, 1.864255, 0.007021829, 0.9803922, 1, 0, 1,
-0.9426059, 1.399824, -0.6747054, 0.972549, 1, 0, 1,
-0.9366607, -1.172121, -1.0679, 0.9686275, 1, 0, 1,
-0.9350005, 0.5191728, -1.593058, 0.9607843, 1, 0, 1,
-0.9322857, 0.2718402, -0.8353813, 0.9568627, 1, 0, 1,
-0.9316589, 0.9393961, -1.034235, 0.9490196, 1, 0, 1,
-0.9204746, 0.1639502, -1.325918, 0.945098, 1, 0, 1,
-0.9189419, -1.781745, -3.008454, 0.9372549, 1, 0, 1,
-0.9125568, -0.09902643, -0.9351341, 0.9333333, 1, 0, 1,
-0.908496, 0.7813306, 0.09883838, 0.9254902, 1, 0, 1,
-0.9052569, 0.5050139, -2.060358, 0.9215686, 1, 0, 1,
-0.9030092, -0.02690318, 1.073964, 0.9137255, 1, 0, 1,
-0.9011339, 2.040358, -0.5808021, 0.9098039, 1, 0, 1,
-0.9007828, -0.2755831, -2.124555, 0.9019608, 1, 0, 1,
-0.8989934, 0.1052676, -1.719711, 0.8941177, 1, 0, 1,
-0.8976073, 0.3429473, -1.632058, 0.8901961, 1, 0, 1,
-0.8970683, 0.1931683, -2.820664, 0.8823529, 1, 0, 1,
-0.8907999, 1.54444, -0.983954, 0.8784314, 1, 0, 1,
-0.8794264, -0.7485104, -1.974097, 0.8705882, 1, 0, 1,
-0.8792653, 0.03155571, -0.5361665, 0.8666667, 1, 0, 1,
-0.8658953, -0.4650843, -2.910104, 0.8588235, 1, 0, 1,
-0.8573882, 0.8244701, -0.7085725, 0.854902, 1, 0, 1,
-0.8438511, -0.3545274, -2.841582, 0.8470588, 1, 0, 1,
-0.842946, -0.07987403, -2.249291, 0.8431373, 1, 0, 1,
-0.8376372, 0.2705887, -2.314775, 0.8352941, 1, 0, 1,
-0.8374328, 0.3230339, -0.578877, 0.8313726, 1, 0, 1,
-0.8327544, -0.7643919, -3.912749, 0.8235294, 1, 0, 1,
-0.8321439, -0.6140152, -3.598808, 0.8196079, 1, 0, 1,
-0.8220854, 0.299626, -5.511407, 0.8117647, 1, 0, 1,
-0.8151871, -1.128662, -3.097342, 0.8078431, 1, 0, 1,
-0.8033594, 1.270061, 0.02533283, 0.8, 1, 0, 1,
-0.8030639, 1.100655, -0.3675112, 0.7921569, 1, 0, 1,
-0.7972329, -0.2327174, -0.789345, 0.7882353, 1, 0, 1,
-0.7953855, -0.2072633, -0.4930562, 0.7803922, 1, 0, 1,
-0.7950302, -0.978969, -3.798451, 0.7764706, 1, 0, 1,
-0.7947171, 0.03010529, -0.01717202, 0.7686275, 1, 0, 1,
-0.7903315, -0.186516, -1.405256, 0.7647059, 1, 0, 1,
-0.7863516, 1.292016, -1.995765, 0.7568628, 1, 0, 1,
-0.7848826, -0.5257559, -1.981238, 0.7529412, 1, 0, 1,
-0.7764173, -0.7893528, -2.804487, 0.7450981, 1, 0, 1,
-0.7756724, 0.1748086, -3.750626, 0.7411765, 1, 0, 1,
-0.7747405, -0.4499608, -1.316821, 0.7333333, 1, 0, 1,
-0.7741526, 0.7415327, -0.6038546, 0.7294118, 1, 0, 1,
-0.7729933, 0.438597, -0.8249308, 0.7215686, 1, 0, 1,
-0.7720805, 0.8873894, -0.9088016, 0.7176471, 1, 0, 1,
-0.7687607, 0.3992037, -1.467887, 0.7098039, 1, 0, 1,
-0.764109, 0.03113352, 0.2307631, 0.7058824, 1, 0, 1,
-0.7614515, 0.6091715, 0.1059667, 0.6980392, 1, 0, 1,
-0.7551924, 0.04187231, -2.072988, 0.6901961, 1, 0, 1,
-0.7501595, 1.085391, -2.092124, 0.6862745, 1, 0, 1,
-0.7418889, 0.9740099, -0.9969095, 0.6784314, 1, 0, 1,
-0.73992, 1.647457, -0.2186253, 0.6745098, 1, 0, 1,
-0.7370741, 0.2838708, -0.4337934, 0.6666667, 1, 0, 1,
-0.7356659, 0.591083, -1.352272, 0.6627451, 1, 0, 1,
-0.7338764, 0.6978399, -0.6296274, 0.654902, 1, 0, 1,
-0.7334664, 0.8891938, -1.063396, 0.6509804, 1, 0, 1,
-0.7330012, -1.919747, -3.363608, 0.6431373, 1, 0, 1,
-0.731479, 0.2364297, -0.6131648, 0.6392157, 1, 0, 1,
-0.728543, -0.4043368, -1.410624, 0.6313726, 1, 0, 1,
-0.7229902, 0.6230099, -0.2675014, 0.627451, 1, 0, 1,
-0.7226817, 0.2773145, -1.145331, 0.6196079, 1, 0, 1,
-0.7180315, 0.02714138, -2.655406, 0.6156863, 1, 0, 1,
-0.7121509, -1.27494, -1.759643, 0.6078432, 1, 0, 1,
-0.7116238, 0.149215, -0.04459868, 0.6039216, 1, 0, 1,
-0.7100286, -1.64065, -1.433972, 0.5960785, 1, 0, 1,
-0.6930263, 1.589601, -0.6922831, 0.5882353, 1, 0, 1,
-0.683829, 0.6892341, -0.2832404, 0.5843138, 1, 0, 1,
-0.6825752, -0.9731451, -2.550231, 0.5764706, 1, 0, 1,
-0.6754283, 2.047707, -1.660503, 0.572549, 1, 0, 1,
-0.6712182, -0.2418222, -1.68721, 0.5647059, 1, 0, 1,
-0.6698892, 1.077274, 0.2926874, 0.5607843, 1, 0, 1,
-0.6658124, 0.6455361, -3.427262, 0.5529412, 1, 0, 1,
-0.6599188, -0.5368057, -2.098454, 0.5490196, 1, 0, 1,
-0.654457, -0.1554693, -2.392616, 0.5411765, 1, 0, 1,
-0.6528153, 1.141978, 0.05026197, 0.5372549, 1, 0, 1,
-0.6503416, -2.537686, -2.326353, 0.5294118, 1, 0, 1,
-0.6487084, -2.060039, -2.240063, 0.5254902, 1, 0, 1,
-0.6454607, -0.04620389, -2.665209, 0.5176471, 1, 0, 1,
-0.6441222, -1.777451, -2.823662, 0.5137255, 1, 0, 1,
-0.6360862, 1.291448, -0.7860299, 0.5058824, 1, 0, 1,
-0.6339712, 1.637778, -0.8896823, 0.5019608, 1, 0, 1,
-0.6298409, -0.4945792, -2.057268, 0.4941176, 1, 0, 1,
-0.6250938, -0.452992, -2.537582, 0.4862745, 1, 0, 1,
-0.6238309, 0.2331411, -0.7416924, 0.4823529, 1, 0, 1,
-0.618461, -1.617187, -3.622161, 0.4745098, 1, 0, 1,
-0.6128137, -0.1622491, -3.673006, 0.4705882, 1, 0, 1,
-0.6122259, -0.6257633, -1.726513, 0.4627451, 1, 0, 1,
-0.6101627, 1.287832, 0.02872415, 0.4588235, 1, 0, 1,
-0.6087251, 0.7539018, -0.8094461, 0.4509804, 1, 0, 1,
-0.6047049, -1.155086, -0.4597717, 0.4470588, 1, 0, 1,
-0.6030954, -1.820034, -3.464825, 0.4392157, 1, 0, 1,
-0.6027927, 0.4283031, -5.192915, 0.4352941, 1, 0, 1,
-0.6021346, 0.3228424, -0.2675114, 0.427451, 1, 0, 1,
-0.6013542, 0.2579908, -1.432865, 0.4235294, 1, 0, 1,
-0.5990559, 0.2340875, 0.214823, 0.4156863, 1, 0, 1,
-0.5987519, -0.02937947, -1.358335, 0.4117647, 1, 0, 1,
-0.5973216, -2.826832, -2.107235, 0.4039216, 1, 0, 1,
-0.593393, 2.163523, 0.8300206, 0.3960784, 1, 0, 1,
-0.5932345, 0.7773189, -1.164282, 0.3921569, 1, 0, 1,
-0.5900466, -0.1416196, -2.537748, 0.3843137, 1, 0, 1,
-0.587642, 0.14686, -1.492138, 0.3803922, 1, 0, 1,
-0.5765225, 1.328108, -2.2309, 0.372549, 1, 0, 1,
-0.5738581, -0.4859887, -1.700167, 0.3686275, 1, 0, 1,
-0.5728016, -0.09200992, -2.288282, 0.3607843, 1, 0, 1,
-0.5707992, 0.1322901, 1.236321, 0.3568628, 1, 0, 1,
-0.5603932, 1.095948, 0.9104161, 0.3490196, 1, 0, 1,
-0.5561346, 0.00411399, -0.874318, 0.345098, 1, 0, 1,
-0.55451, -0.1059851, -1.701986, 0.3372549, 1, 0, 1,
-0.5523154, 0.8406134, 0.8299962, 0.3333333, 1, 0, 1,
-0.550232, -0.3643966, -1.282651, 0.3254902, 1, 0, 1,
-0.5455056, 0.8431723, -1.325793, 0.3215686, 1, 0, 1,
-0.5410595, 1.130892, -0.3137386, 0.3137255, 1, 0, 1,
-0.5334464, 0.6717435, -0.3476373, 0.3098039, 1, 0, 1,
-0.5321124, -0.2428572, -2.115919, 0.3019608, 1, 0, 1,
-0.5285712, 0.06749746, -0.9785175, 0.2941177, 1, 0, 1,
-0.5260361, 0.6850834, -2.01686, 0.2901961, 1, 0, 1,
-0.5178243, 0.2722514, -1.565033, 0.282353, 1, 0, 1,
-0.5136064, 1.615646, -0.1054264, 0.2784314, 1, 0, 1,
-0.5127407, -0.5090144, -3.286537, 0.2705882, 1, 0, 1,
-0.5084119, 0.4495549, -1.714114, 0.2666667, 1, 0, 1,
-0.5047686, 0.08616865, -0.264265, 0.2588235, 1, 0, 1,
-0.5025131, 1.09139, 1.496675, 0.254902, 1, 0, 1,
-0.4997589, -0.6238433, -2.039518, 0.2470588, 1, 0, 1,
-0.4962293, 0.6683329, -0.6027631, 0.2431373, 1, 0, 1,
-0.4955377, 0.4925108, 0.002033992, 0.2352941, 1, 0, 1,
-0.4891014, 0.6340059, -0.3316901, 0.2313726, 1, 0, 1,
-0.4886208, 1.384297, -1.631876, 0.2235294, 1, 0, 1,
-0.4870772, 1.036501, -1.083155, 0.2196078, 1, 0, 1,
-0.4855427, -0.7477044, -1.769031, 0.2117647, 1, 0, 1,
-0.4835694, 0.8275343, -2.117068, 0.2078431, 1, 0, 1,
-0.4831823, 0.7793633, -0.9200248, 0.2, 1, 0, 1,
-0.4807881, 0.04482353, -2.335742, 0.1921569, 1, 0, 1,
-0.4788496, 0.9609421, -2.800809, 0.1882353, 1, 0, 1,
-0.4764106, -0.8538273, -3.541051, 0.1803922, 1, 0, 1,
-0.4714416, 1.146523, -1.349007, 0.1764706, 1, 0, 1,
-0.4679317, 0.6234119, -0.03008085, 0.1686275, 1, 0, 1,
-0.466934, -0.4817214, -1.559456, 0.1647059, 1, 0, 1,
-0.4656622, -0.4240466, -2.925506, 0.1568628, 1, 0, 1,
-0.4651172, 2.751812, 2.999764, 0.1529412, 1, 0, 1,
-0.4627473, -0.9595026, -2.146382, 0.145098, 1, 0, 1,
-0.4609991, 0.1837637, -0.4481694, 0.1411765, 1, 0, 1,
-0.4606982, 2.232007, -0.6992611, 0.1333333, 1, 0, 1,
-0.4567116, 0.7816491, -1.257848, 0.1294118, 1, 0, 1,
-0.4553367, 2.207144, 1.528386, 0.1215686, 1, 0, 1,
-0.4430277, 1.383835, 1.299409, 0.1176471, 1, 0, 1,
-0.4399025, 0.146357, -1.379197, 0.1098039, 1, 0, 1,
-0.4390464, 1.995132, 0.8211515, 0.1058824, 1, 0, 1,
-0.438359, -0.867532, -2.22405, 0.09803922, 1, 0, 1,
-0.437705, -0.5868155, -4.409113, 0.09019608, 1, 0, 1,
-0.4371378, 1.100392, -0.001466556, 0.08627451, 1, 0, 1,
-0.4369286, 0.8437651, 1.354448, 0.07843138, 1, 0, 1,
-0.43617, 1.830214, -0.9683052, 0.07450981, 1, 0, 1,
-0.4315132, 0.2522681, -1.448934, 0.06666667, 1, 0, 1,
-0.431079, -0.03484411, -1.124075, 0.0627451, 1, 0, 1,
-0.4287457, 0.664884, 0.2511666, 0.05490196, 1, 0, 1,
-0.4283779, 0.5114799, -0.3857493, 0.05098039, 1, 0, 1,
-0.4224304, 1.08232, -0.4386067, 0.04313726, 1, 0, 1,
-0.422214, -1.763204, -1.975667, 0.03921569, 1, 0, 1,
-0.4168921, 0.06885785, -2.862169, 0.03137255, 1, 0, 1,
-0.4144334, -1.58475, -4.513834, 0.02745098, 1, 0, 1,
-0.4097076, -0.1758281, -2.4841, 0.01960784, 1, 0, 1,
-0.4074465, -0.8792475, -2.67158, 0.01568628, 1, 0, 1,
-0.4065692, -0.213139, -3.032065, 0.007843138, 1, 0, 1,
-0.4046722, 0.8821523, 0.6484088, 0.003921569, 1, 0, 1,
-0.4002548, -0.5992669, -2.904521, 0, 1, 0.003921569, 1,
-0.3998549, 0.2452666, -0.9498859, 0, 1, 0.01176471, 1,
-0.3994195, 0.6990752, -1.9471, 0, 1, 0.01568628, 1,
-0.3949532, -1.265454, -3.546798, 0, 1, 0.02352941, 1,
-0.3941182, -1.931333, -3.999116, 0, 1, 0.02745098, 1,
-0.3929435, -0.7780086, -2.180575, 0, 1, 0.03529412, 1,
-0.389558, -0.6054488, -1.907328, 0, 1, 0.03921569, 1,
-0.3888738, 2.033695, 0.9619083, 0, 1, 0.04705882, 1,
-0.3869566, 0.3037117, 1.033435, 0, 1, 0.05098039, 1,
-0.3846042, 1.090232, -0.9632066, 0, 1, 0.05882353, 1,
-0.3843382, -0.1337075, -4.161042, 0, 1, 0.0627451, 1,
-0.3814352, 1.688886, -0.5246387, 0, 1, 0.07058824, 1,
-0.378312, -1.947059, -2.2853, 0, 1, 0.07450981, 1,
-0.3766423, 0.1998834, 0.7299761, 0, 1, 0.08235294, 1,
-0.3695533, -1.355571, -2.077966, 0, 1, 0.08627451, 1,
-0.364267, -0.2008449, -0.877717, 0, 1, 0.09411765, 1,
-0.3637368, -1.042981, -2.734801, 0, 1, 0.1019608, 1,
-0.3626412, -1.785623, -4.188349, 0, 1, 0.1058824, 1,
-0.3609848, -1.167213, -3.784524, 0, 1, 0.1137255, 1,
-0.3601911, 0.5950361, -0.2911687, 0, 1, 0.1176471, 1,
-0.3596512, 1.651059, -1.112709, 0, 1, 0.1254902, 1,
-0.3589548, 0.587685, -0.1160218, 0, 1, 0.1294118, 1,
-0.357194, 1.192391, -1.382181, 0, 1, 0.1372549, 1,
-0.3565143, -0.2089236, -3.191143, 0, 1, 0.1411765, 1,
-0.3498565, 1.091977, -2.117116, 0, 1, 0.1490196, 1,
-0.349787, -0.6789242, -3.410324, 0, 1, 0.1529412, 1,
-0.3487616, 0.3647757, -0.1031857, 0, 1, 0.1607843, 1,
-0.3481654, 0.7756222, -0.543052, 0, 1, 0.1647059, 1,
-0.344116, 0.3311832, -2.094955, 0, 1, 0.172549, 1,
-0.3440415, -0.6165609, -1.831968, 0, 1, 0.1764706, 1,
-0.343137, -0.9255664, -3.214676, 0, 1, 0.1843137, 1,
-0.3416347, -1.013566, -3.482452, 0, 1, 0.1882353, 1,
-0.3354739, 0.4236874, -1.376207, 0, 1, 0.1960784, 1,
-0.3310125, 0.5245792, -1.159098, 0, 1, 0.2039216, 1,
-0.3234865, -0.08171079, -1.627892, 0, 1, 0.2078431, 1,
-0.3233945, 0.2412258, -0.829667, 0, 1, 0.2156863, 1,
-0.3212666, 1.558363, -0.04213602, 0, 1, 0.2196078, 1,
-0.3208556, -0.8689079, -3.123938, 0, 1, 0.227451, 1,
-0.3185557, 1.144334, -0.130572, 0, 1, 0.2313726, 1,
-0.3172872, -0.7932348, -2.018057, 0, 1, 0.2392157, 1,
-0.3122194, -0.1056899, -3.238326, 0, 1, 0.2431373, 1,
-0.3107381, 0.754989, -0.2784543, 0, 1, 0.2509804, 1,
-0.3062757, -0.988366, -4.121402, 0, 1, 0.254902, 1,
-0.3027883, -1.527663, -3.22031, 0, 1, 0.2627451, 1,
-0.3015193, 0.7177495, 0.3189317, 0, 1, 0.2666667, 1,
-0.3008288, 0.42217, -1.419153, 0, 1, 0.2745098, 1,
-0.2969247, -0.1423501, -1.41564, 0, 1, 0.2784314, 1,
-0.2955568, 0.5416867, -1.37119, 0, 1, 0.2862745, 1,
-0.2950381, -0.05663171, -0.03563863, 0, 1, 0.2901961, 1,
-0.2872854, -0.3403936, -1.294077, 0, 1, 0.2980392, 1,
-0.2829934, -0.02139509, -0.2505926, 0, 1, 0.3058824, 1,
-0.2787049, 0.1010927, -1.261753, 0, 1, 0.3098039, 1,
-0.277384, -0.4215173, -2.218162, 0, 1, 0.3176471, 1,
-0.276775, 1.078653, -0.459049, 0, 1, 0.3215686, 1,
-0.2738439, -0.9051477, -2.985765, 0, 1, 0.3294118, 1,
-0.2721258, -1.092979, -2.642895, 0, 1, 0.3333333, 1,
-0.2709402, -0.270327, -3.45244, 0, 1, 0.3411765, 1,
-0.2697783, -0.9014117, -2.708251, 0, 1, 0.345098, 1,
-0.26807, 0.6813378, -1.771395, 0, 1, 0.3529412, 1,
-0.2676193, -1.251136, -1.513615, 0, 1, 0.3568628, 1,
-0.2674386, 0.4697257, -0.9356365, 0, 1, 0.3647059, 1,
-0.2631204, -1.483917, -3.020429, 0, 1, 0.3686275, 1,
-0.262656, -0.3399381, -3.768087, 0, 1, 0.3764706, 1,
-0.2588436, 1.529039, 0.7693036, 0, 1, 0.3803922, 1,
-0.2586125, 0.4698733, -2.039648, 0, 1, 0.3882353, 1,
-0.2570844, 1.57678, 0.3633871, 0, 1, 0.3921569, 1,
-0.2564445, -0.6191877, -3.608819, 0, 1, 0.4, 1,
-0.2545793, 0.9890221, 0.2659395, 0, 1, 0.4078431, 1,
-0.2529506, -0.7538162, -3.894684, 0, 1, 0.4117647, 1,
-0.248907, -0.2478335, -1.212004, 0, 1, 0.4196078, 1,
-0.2481287, -0.5770707, -4.868732, 0, 1, 0.4235294, 1,
-0.2453166, 1.022147, 0.7086772, 0, 1, 0.4313726, 1,
-0.2347506, -0.3586416, -5.059537, 0, 1, 0.4352941, 1,
-0.2343633, -0.6940167, -4.016811, 0, 1, 0.4431373, 1,
-0.2293174, -0.5490209, -2.57707, 0, 1, 0.4470588, 1,
-0.2285289, 0.5746439, -0.1252593, 0, 1, 0.454902, 1,
-0.2264905, -0.9607486, -3.705479, 0, 1, 0.4588235, 1,
-0.2262563, -0.1924731, -2.652786, 0, 1, 0.4666667, 1,
-0.2259139, -1.35743, -3.156605, 0, 1, 0.4705882, 1,
-0.2233529, -0.1358487, -1.438978, 0, 1, 0.4784314, 1,
-0.2215675, 0.05460249, -1.114122, 0, 1, 0.4823529, 1,
-0.2211955, 0.7373618, 1.137492, 0, 1, 0.4901961, 1,
-0.2197293, -0.5874841, -2.863453, 0, 1, 0.4941176, 1,
-0.2129159, 0.701294, -1.172297, 0, 1, 0.5019608, 1,
-0.2104189, 0.07509988, -1.328905, 0, 1, 0.509804, 1,
-0.2082325, -1.008049, -2.254617, 0, 1, 0.5137255, 1,
-0.2037562, 1.751458, 0.1038416, 0, 1, 0.5215687, 1,
-0.2023723, -0.1803143, -2.806528, 0, 1, 0.5254902, 1,
-0.1977254, 1.622925, 0.92927, 0, 1, 0.5333334, 1,
-0.1848358, -0.03973055, -3.249885, 0, 1, 0.5372549, 1,
-0.1839039, -0.9430662, -4.0386, 0, 1, 0.5450981, 1,
-0.1812106, -1.870298, -2.686463, 0, 1, 0.5490196, 1,
-0.1796676, -0.9315162, -3.43268, 0, 1, 0.5568628, 1,
-0.1638988, 1.015662, -0.2944576, 0, 1, 0.5607843, 1,
-0.1638272, -1.298187, -4.019038, 0, 1, 0.5686275, 1,
-0.1623134, 0.4673527, -2.277677, 0, 1, 0.572549, 1,
-0.1621283, 0.7883974, -1.985658, 0, 1, 0.5803922, 1,
-0.1601786, -0.7027021, -3.566408, 0, 1, 0.5843138, 1,
-0.160089, -1.126941, -2.584663, 0, 1, 0.5921569, 1,
-0.1593567, -0.9087229, -1.760622, 0, 1, 0.5960785, 1,
-0.156666, -0.6861401, -2.326226, 0, 1, 0.6039216, 1,
-0.1533595, -0.9942726, -3.030753, 0, 1, 0.6117647, 1,
-0.147359, 1.159163, 1.013553, 0, 1, 0.6156863, 1,
-0.1467776, -0.5606103, -2.43989, 0, 1, 0.6235294, 1,
-0.1409548, -0.1462967, -2.724543, 0, 1, 0.627451, 1,
-0.1396465, -1.458596, -2.733449, 0, 1, 0.6352941, 1,
-0.1394832, -0.7088159, -2.895891, 0, 1, 0.6392157, 1,
-0.1342504, -0.06325664, -2.129318, 0, 1, 0.6470588, 1,
-0.133884, -0.4972698, -2.959345, 0, 1, 0.6509804, 1,
-0.1335439, -0.8384282, -4.30903, 0, 1, 0.6588235, 1,
-0.1321914, 0.3323951, -1.356975, 0, 1, 0.6627451, 1,
-0.1319042, 1.316794, 0.01493908, 0, 1, 0.6705883, 1,
-0.1316457, 0.7693697, -0.6371371, 0, 1, 0.6745098, 1,
-0.1310149, 0.1257897, -2.925252, 0, 1, 0.682353, 1,
-0.1301131, 0.2684331, 0.3586982, 0, 1, 0.6862745, 1,
-0.1295924, 1.676944, 0.2006008, 0, 1, 0.6941177, 1,
-0.1261976, 0.3989296, -0.3002951, 0, 1, 0.7019608, 1,
-0.1222426, 0.6945258, -1.319403, 0, 1, 0.7058824, 1,
-0.1211926, 1.621049, 0.8383647, 0, 1, 0.7137255, 1,
-0.1205332, 0.4009112, -0.2846444, 0, 1, 0.7176471, 1,
-0.1203995, -1.555762, -1.870759, 0, 1, 0.7254902, 1,
-0.1153762, 0.09690296, 0.1373868, 0, 1, 0.7294118, 1,
-0.1116703, 1.018938, -1.812788, 0, 1, 0.7372549, 1,
-0.1107853, -0.8015612, -3.565535, 0, 1, 0.7411765, 1,
-0.1069744, -1.554408, -3.506356, 0, 1, 0.7490196, 1,
-0.100573, -2.572059, -3.702434, 0, 1, 0.7529412, 1,
-0.09930067, 0.1097415, 0.2873057, 0, 1, 0.7607843, 1,
-0.09876259, 0.6186412, 2.119849, 0, 1, 0.7647059, 1,
-0.09687382, 0.04626233, -1.36432, 0, 1, 0.772549, 1,
-0.09677352, 0.1150031, 0.8498468, 0, 1, 0.7764706, 1,
-0.09554997, 0.1155008, -0.8383359, 0, 1, 0.7843137, 1,
-0.0913545, -0.1649838, -3.124359, 0, 1, 0.7882353, 1,
-0.09034198, -1.070528, -1.250385, 0, 1, 0.7960784, 1,
-0.09027825, -1.709084, -3.517776, 0, 1, 0.8039216, 1,
-0.08801727, -0.8599954, -5.471031, 0, 1, 0.8078431, 1,
-0.08218508, 1.813125, 1.572173, 0, 1, 0.8156863, 1,
-0.08039935, 0.3087389, -1.066675, 0, 1, 0.8196079, 1,
-0.08010908, 1.225556, 0.3850097, 0, 1, 0.827451, 1,
-0.07726984, 0.6676824, -0.0724509, 0, 1, 0.8313726, 1,
-0.07534161, -0.4300762, -4.192412, 0, 1, 0.8392157, 1,
-0.07489562, 0.9407728, -0.2697036, 0, 1, 0.8431373, 1,
-0.07486545, 0.4162167, -1.861409, 0, 1, 0.8509804, 1,
-0.07391757, 0.410648, -0.8598607, 0, 1, 0.854902, 1,
-0.06694885, 0.1064052, -0.2011567, 0, 1, 0.8627451, 1,
-0.0664128, 0.8703697, -1.236173, 0, 1, 0.8666667, 1,
-0.06187926, -1.103965, -2.969109, 0, 1, 0.8745098, 1,
-0.06143958, 0.3000028, -1.350414, 0, 1, 0.8784314, 1,
-0.06119765, 0.6826856, 0.7938535, 0, 1, 0.8862745, 1,
-0.04900283, -0.7605711, -3.729921, 0, 1, 0.8901961, 1,
-0.04324027, -1.179215, -3.054756, 0, 1, 0.8980392, 1,
-0.04218049, 1.349645, -0.3109894, 0, 1, 0.9058824, 1,
-0.0412917, 0.2409977, -0.4448436, 0, 1, 0.9098039, 1,
-0.03966619, 0.1963883, -0.02816906, 0, 1, 0.9176471, 1,
-0.03830985, -0.8154582, -2.047386, 0, 1, 0.9215686, 1,
-0.03757155, 0.8840449, 0.7400927, 0, 1, 0.9294118, 1,
-0.03505038, 1.211244, -0.3724477, 0, 1, 0.9333333, 1,
-0.03122956, -0.3067465, -2.693032, 0, 1, 0.9411765, 1,
-0.02821813, -2.084683, -2.601907, 0, 1, 0.945098, 1,
-0.02708691, -0.6705185, -3.84554, 0, 1, 0.9529412, 1,
-0.02378813, -1.671414, -3.777615, 0, 1, 0.9568627, 1,
-0.02082697, -2.871955, -4.09787, 0, 1, 0.9647059, 1,
-0.01864496, 0.1291926, -0.05977574, 0, 1, 0.9686275, 1,
-0.01565639, -1.161674, -2.573782, 0, 1, 0.9764706, 1,
-0.01505496, 0.8964095, 1.19032, 0, 1, 0.9803922, 1,
-0.01268457, 1.362246, 0.8442448, 0, 1, 0.9882353, 1,
-0.007298313, -1.4364, -2.733046, 0, 1, 0.9921569, 1,
-0.007220259, 2.702472, 1.738584, 0, 1, 1, 1,
-0.001593229, -1.755764, -4.640574, 0, 0.9921569, 1, 1,
0.00118669, -0.8804545, 2.712179, 0, 0.9882353, 1, 1,
0.001876907, 2.073854, -1.11283, 0, 0.9803922, 1, 1,
0.004209243, -0.7738346, 2.474101, 0, 0.9764706, 1, 1,
0.008187756, -0.9393581, 2.746853, 0, 0.9686275, 1, 1,
0.008493752, 0.2899775, -1.107795, 0, 0.9647059, 1, 1,
0.009266392, -1.287703, 2.719532, 0, 0.9568627, 1, 1,
0.01042005, 0.9012883, -1.038208, 0, 0.9529412, 1, 1,
0.01255449, -0.009554396, 3.516352, 0, 0.945098, 1, 1,
0.01292358, -1.315169, 4.690247, 0, 0.9411765, 1, 1,
0.01312421, -0.8857535, 4.118427, 0, 0.9333333, 1, 1,
0.01325073, -0.3705267, 2.348276, 0, 0.9294118, 1, 1,
0.01661823, -0.1784039, 1.512709, 0, 0.9215686, 1, 1,
0.01680825, 0.1936108, -1.261251, 0, 0.9176471, 1, 1,
0.01767544, 0.8604559, -0.4290271, 0, 0.9098039, 1, 1,
0.03401954, -0.8102316, 3.510792, 0, 0.9058824, 1, 1,
0.03467976, -0.3599874, 2.806469, 0, 0.8980392, 1, 1,
0.03473652, 1.736697, -0.2994791, 0, 0.8901961, 1, 1,
0.03487191, -0.3082261, 4.851902, 0, 0.8862745, 1, 1,
0.03886962, -0.4833717, 2.35459, 0, 0.8784314, 1, 1,
0.04176122, 0.2441718, 1.523458, 0, 0.8745098, 1, 1,
0.0420272, 1.004003, -1.350531, 0, 0.8666667, 1, 1,
0.04546106, -0.1939618, 3.116799, 0, 0.8627451, 1, 1,
0.04608718, -0.1232336, 1.510121, 0, 0.854902, 1, 1,
0.04679811, 0.4577979, 0.5754125, 0, 0.8509804, 1, 1,
0.04906048, -1.29439, 3.160914, 0, 0.8431373, 1, 1,
0.04925815, -0.7073785, 4.090861, 0, 0.8392157, 1, 1,
0.05066804, -0.02358435, -0.127952, 0, 0.8313726, 1, 1,
0.05595064, -1.19903, 2.363076, 0, 0.827451, 1, 1,
0.05902655, -0.2803902, 3.101755, 0, 0.8196079, 1, 1,
0.06025017, 0.4206264, 1.166333, 0, 0.8156863, 1, 1,
0.06313674, -0.6029849, 3.088559, 0, 0.8078431, 1, 1,
0.06702246, -0.03952575, 2.438432, 0, 0.8039216, 1, 1,
0.06841359, 0.3372489, -0.825096, 0, 0.7960784, 1, 1,
0.07068516, 0.7515087, 0.6691764, 0, 0.7882353, 1, 1,
0.07238875, 0.6223727, 1.263041, 0, 0.7843137, 1, 1,
0.0758616, 1.852237, -0.4252113, 0, 0.7764706, 1, 1,
0.07662735, 0.2286102, 1.317871, 0, 0.772549, 1, 1,
0.07899027, 1.461598, 0.7428361, 0, 0.7647059, 1, 1,
0.08463848, 0.1733343, -0.2957309, 0, 0.7607843, 1, 1,
0.08523237, 1.267517, -0.2309605, 0, 0.7529412, 1, 1,
0.08653323, 1.25095, 0.5418463, 0, 0.7490196, 1, 1,
0.08698393, -0.3382708, 1.86761, 0, 0.7411765, 1, 1,
0.08709434, 1.822939, -0.5757024, 0, 0.7372549, 1, 1,
0.09069282, 0.5409599, 0.2245407, 0, 0.7294118, 1, 1,
0.09107161, -0.7022856, 3.573265, 0, 0.7254902, 1, 1,
0.09210093, 1.20487, 0.03451248, 0, 0.7176471, 1, 1,
0.09502569, 1.396714, -1.308201, 0, 0.7137255, 1, 1,
0.1041521, 0.3829811, -1.687283, 0, 0.7058824, 1, 1,
0.1043014, -0.8086382, 1.910937, 0, 0.6980392, 1, 1,
0.1050149, -0.1288437, 1.88243, 0, 0.6941177, 1, 1,
0.1053793, 0.5076491, -0.9578584, 0, 0.6862745, 1, 1,
0.1057151, 0.956698, -1.017935, 0, 0.682353, 1, 1,
0.1077748, -0.5686917, 3.609923, 0, 0.6745098, 1, 1,
0.1111177, -0.7749932, 3.491086, 0, 0.6705883, 1, 1,
0.1155407, 1.399139, 0.9441395, 0, 0.6627451, 1, 1,
0.1195579, 1.112018, 0.8088586, 0, 0.6588235, 1, 1,
0.1205256, -1.528047, 2.505153, 0, 0.6509804, 1, 1,
0.1245463, 0.9743705, -1.177307, 0, 0.6470588, 1, 1,
0.1255539, 0.004582298, 2.177111, 0, 0.6392157, 1, 1,
0.12898, -1.033882, 2.447165, 0, 0.6352941, 1, 1,
0.1323532, 0.572624, 0.7127497, 0, 0.627451, 1, 1,
0.136915, -0.4613147, 2.80264, 0, 0.6235294, 1, 1,
0.1477783, 1.773275, 0.08014865, 0, 0.6156863, 1, 1,
0.1543037, -0.2528833, 1.789279, 0, 0.6117647, 1, 1,
0.1543377, 1.534105, 0.5260982, 0, 0.6039216, 1, 1,
0.1593249, 0.6925589, -0.4733374, 0, 0.5960785, 1, 1,
0.1615183, -0.8466104, 3.344853, 0, 0.5921569, 1, 1,
0.1637409, -0.4077355, 2.613965, 0, 0.5843138, 1, 1,
0.1647023, -2.380945, 1.810652, 0, 0.5803922, 1, 1,
0.1794159, 0.9758934, 0.8619737, 0, 0.572549, 1, 1,
0.1811781, -0.3003959, 2.562006, 0, 0.5686275, 1, 1,
0.1845515, 0.4266334, -0.1410693, 0, 0.5607843, 1, 1,
0.1856902, 0.4639319, 0.6404496, 0, 0.5568628, 1, 1,
0.1935066, -1.257561, 3.976096, 0, 0.5490196, 1, 1,
0.1945746, -0.8661326, 1.848138, 0, 0.5450981, 1, 1,
0.1996746, 0.1848365, 0.2963533, 0, 0.5372549, 1, 1,
0.2040567, 0.7168065, -0.7748908, 0, 0.5333334, 1, 1,
0.2048063, 2.16882, 1.253856, 0, 0.5254902, 1, 1,
0.2076059, -0.7017614, 3.125304, 0, 0.5215687, 1, 1,
0.2099089, 0.5248784, 1.331012, 0, 0.5137255, 1, 1,
0.2103649, 0.09853802, 1.792229, 0, 0.509804, 1, 1,
0.2104872, 0.7416765, 0.4121989, 0, 0.5019608, 1, 1,
0.2189121, -0.3285978, 1.438871, 0, 0.4941176, 1, 1,
0.2191893, 2.164983, -0.1273802, 0, 0.4901961, 1, 1,
0.2195384, 0.4241776, 2.826493, 0, 0.4823529, 1, 1,
0.2245659, 0.4987271, 0.3694758, 0, 0.4784314, 1, 1,
0.2272688, -1.762561, 1.929106, 0, 0.4705882, 1, 1,
0.2289357, -2.438886, 2.379009, 0, 0.4666667, 1, 1,
0.2311656, 0.2708662, 1.565697, 0, 0.4588235, 1, 1,
0.2338075, -0.4511519, 3.051843, 0, 0.454902, 1, 1,
0.2364775, 0.3389243, 1.168003, 0, 0.4470588, 1, 1,
0.2381985, 0.2781357, 1.919217, 0, 0.4431373, 1, 1,
0.2386373, 0.36241, 0.6327466, 0, 0.4352941, 1, 1,
0.241096, 1.237489, -0.1116323, 0, 0.4313726, 1, 1,
0.2429285, 0.4543969, -1.585864, 0, 0.4235294, 1, 1,
0.2451705, -0.9261619, 3.600359, 0, 0.4196078, 1, 1,
0.2471022, 1.854544, 1.342553, 0, 0.4117647, 1, 1,
0.2499862, 0.5690562, 3.402777, 0, 0.4078431, 1, 1,
0.251423, -0.7634735, 2.549038, 0, 0.4, 1, 1,
0.2539879, 0.229584, 0.476167, 0, 0.3921569, 1, 1,
0.2552269, -0.082768, 1.537216, 0, 0.3882353, 1, 1,
0.2559756, 0.7913818, -1.80392, 0, 0.3803922, 1, 1,
0.25934, 1.836699, -0.1675172, 0, 0.3764706, 1, 1,
0.2640224, -0.8845389, 3.971394, 0, 0.3686275, 1, 1,
0.2640408, -1.949185, 3.592997, 0, 0.3647059, 1, 1,
0.267591, -2.379792, 1.611055, 0, 0.3568628, 1, 1,
0.2692452, 2.317263, 0.2231679, 0, 0.3529412, 1, 1,
0.2696384, -0.2527842, 2.574321, 0, 0.345098, 1, 1,
0.2696705, -0.6965503, 1.558211, 0, 0.3411765, 1, 1,
0.2708868, 0.06765036, 3.045086, 0, 0.3333333, 1, 1,
0.2708897, 0.08448777, 0.6521678, 0, 0.3294118, 1, 1,
0.2756572, 0.9071122, 0.8810231, 0, 0.3215686, 1, 1,
0.2842405, 0.2064992, 0.7771651, 0, 0.3176471, 1, 1,
0.2884867, -0.1808755, 1.656464, 0, 0.3098039, 1, 1,
0.2920088, 0.8790966, 2.823628, 0, 0.3058824, 1, 1,
0.2957156, 0.1524216, -0.2821505, 0, 0.2980392, 1, 1,
0.2980188, 0.6179104, 0.08260176, 0, 0.2901961, 1, 1,
0.305487, -0.4805077, 2.9741, 0, 0.2862745, 1, 1,
0.3074422, 0.517226, 2.467593, 0, 0.2784314, 1, 1,
0.308652, -0.6006154, 1.519233, 0, 0.2745098, 1, 1,
0.3100912, -0.90018, 3.258857, 0, 0.2666667, 1, 1,
0.3101818, 0.3658527, -0.8326905, 0, 0.2627451, 1, 1,
0.3125848, -1.075742, 5.722485, 0, 0.254902, 1, 1,
0.3137187, 1.533455, 0.5706041, 0, 0.2509804, 1, 1,
0.3161208, -0.6834268, 1.776719, 0, 0.2431373, 1, 1,
0.3173718, -0.2948227, 2.338303, 0, 0.2392157, 1, 1,
0.3181595, -0.4294174, 2.037119, 0, 0.2313726, 1, 1,
0.3216692, -0.5234921, 2.097111, 0, 0.227451, 1, 1,
0.3285886, -1.883635, 3.441536, 0, 0.2196078, 1, 1,
0.3294263, -0.03281462, 1.559391, 0, 0.2156863, 1, 1,
0.3356223, -0.2224193, 1.915549, 0, 0.2078431, 1, 1,
0.3390374, -0.4790938, 1.171761, 0, 0.2039216, 1, 1,
0.340985, -1.202965, 2.713518, 0, 0.1960784, 1, 1,
0.3421014, 0.1745631, 1.714275, 0, 0.1882353, 1, 1,
0.3429784, -0.1197527, 2.693456, 0, 0.1843137, 1, 1,
0.3445351, 0.04703898, 2.105502, 0, 0.1764706, 1, 1,
0.3450252, -1.794554, 4.396097, 0, 0.172549, 1, 1,
0.3466035, 0.1626904, 0.1284436, 0, 0.1647059, 1, 1,
0.3473619, -0.3564655, 2.924125, 0, 0.1607843, 1, 1,
0.3478488, 1.141076, 0.38342, 0, 0.1529412, 1, 1,
0.3492929, 0.4255735, 1.539243, 0, 0.1490196, 1, 1,
0.3494124, -0.2530315, 1.389418, 0, 0.1411765, 1, 1,
0.3508193, -0.3544908, 3.201163, 0, 0.1372549, 1, 1,
0.3509183, 0.8796982, 1.440061, 0, 0.1294118, 1, 1,
0.3604258, 1.506975, 2.073993, 0, 0.1254902, 1, 1,
0.3623357, 0.05975544, 0.2458889, 0, 0.1176471, 1, 1,
0.3625593, 0.6982192, 1.13663, 0, 0.1137255, 1, 1,
0.366478, 0.6977131, 1.501288, 0, 0.1058824, 1, 1,
0.3696199, 1.982666, 0.363263, 0, 0.09803922, 1, 1,
0.3698647, 0.2978578, 1.593806, 0, 0.09411765, 1, 1,
0.372495, -0.6636071, 2.210633, 0, 0.08627451, 1, 1,
0.3725519, -0.1086325, 4.097901, 0, 0.08235294, 1, 1,
0.3733754, -0.8934609, 2.634795, 0, 0.07450981, 1, 1,
0.3784093, -0.7825758, 2.569272, 0, 0.07058824, 1, 1,
0.3807403, -0.4009759, 4.367783, 0, 0.0627451, 1, 1,
0.3821148, 0.1725658, 0.1973373, 0, 0.05882353, 1, 1,
0.3834376, -1.942877, 2.851749, 0, 0.05098039, 1, 1,
0.3861005, -0.2179025, 2.200192, 0, 0.04705882, 1, 1,
0.3896444, 0.4824663, 0.4154022, 0, 0.03921569, 1, 1,
0.3901978, -0.4169943, 0.5186294, 0, 0.03529412, 1, 1,
0.3929082, 0.4316442, 1.144354, 0, 0.02745098, 1, 1,
0.3939216, 1.403702, -0.3925786, 0, 0.02352941, 1, 1,
0.3941046, -0.8177318, 3.532092, 0, 0.01568628, 1, 1,
0.3976485, -1.530174, 1.804698, 0, 0.01176471, 1, 1,
0.3996368, 0.4377164, 0.7827175, 0, 0.003921569, 1, 1,
0.4027478, -0.158924, 0.9335559, 0.003921569, 0, 1, 1,
0.404398, -0.9115593, 3.050972, 0.007843138, 0, 1, 1,
0.406035, -1.208257, 1.408027, 0.01568628, 0, 1, 1,
0.407287, 2.145272, -0.3895482, 0.01960784, 0, 1, 1,
0.4078156, -0.3946094, 3.153045, 0.02745098, 0, 1, 1,
0.4086213, 0.2463145, 1.391862, 0.03137255, 0, 1, 1,
0.4148408, 1.527038, 1.28097, 0.03921569, 0, 1, 1,
0.4170761, -2.436027, 1.682627, 0.04313726, 0, 1, 1,
0.4190009, -0.7415684, 3.257834, 0.05098039, 0, 1, 1,
0.4192103, 0.09343422, -0.9547366, 0.05490196, 0, 1, 1,
0.4198346, 2.605336, -1.098367, 0.0627451, 0, 1, 1,
0.4278641, -1.841355, 2.826537, 0.06666667, 0, 1, 1,
0.4313512, -0.518533, 3.286636, 0.07450981, 0, 1, 1,
0.4322302, -0.4593608, 1.58115, 0.07843138, 0, 1, 1,
0.4358857, 0.05611098, 1.87306, 0.08627451, 0, 1, 1,
0.450301, 0.3944094, 0.395236, 0.09019608, 0, 1, 1,
0.4555466, 0.8904634, -0.5378309, 0.09803922, 0, 1, 1,
0.4565837, -0.009304109, 4.209394, 0.1058824, 0, 1, 1,
0.459773, 1.14174, 1.101883, 0.1098039, 0, 1, 1,
0.4641725, 1.00991, -0.585405, 0.1176471, 0, 1, 1,
0.4650095, -0.3353215, 2.719683, 0.1215686, 0, 1, 1,
0.4685944, -0.6997375, 2.471586, 0.1294118, 0, 1, 1,
0.4733019, 0.3506738, 1.006024, 0.1333333, 0, 1, 1,
0.4781548, 0.3858389, 1.468565, 0.1411765, 0, 1, 1,
0.4844572, -0.6329935, 3.882243, 0.145098, 0, 1, 1,
0.4877718, 1.174302, 1.286203, 0.1529412, 0, 1, 1,
0.4879242, 0.0863936, 0.9832405, 0.1568628, 0, 1, 1,
0.4885094, 1.27296, -0.4532965, 0.1647059, 0, 1, 1,
0.4889653, -0.2572611, 0.2059888, 0.1686275, 0, 1, 1,
0.4890951, -0.01135754, 1.090631, 0.1764706, 0, 1, 1,
0.4914462, -0.9248082, 2.821096, 0.1803922, 0, 1, 1,
0.4968459, 1.466232, 0.6320595, 0.1882353, 0, 1, 1,
0.5002427, 0.7612153, 0.6760098, 0.1921569, 0, 1, 1,
0.5002491, -0.5924279, 3.160956, 0.2, 0, 1, 1,
0.5006375, -1.5266, 1.534236, 0.2078431, 0, 1, 1,
0.500813, -1.025148, 2.442322, 0.2117647, 0, 1, 1,
0.5022525, -0.4260712, 3.150649, 0.2196078, 0, 1, 1,
0.5057375, 1.319596, 0.5140529, 0.2235294, 0, 1, 1,
0.5092393, -0.1832894, 1.074467, 0.2313726, 0, 1, 1,
0.5094509, -0.6250508, 1.999695, 0.2352941, 0, 1, 1,
0.5107948, 0.7031648, -0.1032415, 0.2431373, 0, 1, 1,
0.5111225, 0.3587315, 1.591579, 0.2470588, 0, 1, 1,
0.5166442, -1.162766, 2.880861, 0.254902, 0, 1, 1,
0.5180216, -0.9626623, 0.9911256, 0.2588235, 0, 1, 1,
0.5290185, -1.077277, 2.796911, 0.2666667, 0, 1, 1,
0.5299202, 1.786898, 1.503838, 0.2705882, 0, 1, 1,
0.5307008, -1.145151, 1.848586, 0.2784314, 0, 1, 1,
0.5342575, 1.534175, 0.05216863, 0.282353, 0, 1, 1,
0.5403083, -0.3589039, 3.045098, 0.2901961, 0, 1, 1,
0.5430659, 0.8955368, -1.230689, 0.2941177, 0, 1, 1,
0.5456369, 0.4748537, 0.6361846, 0.3019608, 0, 1, 1,
0.5459806, 0.6315359, 0.07476599, 0.3098039, 0, 1, 1,
0.5504752, -1.111737, 2.908996, 0.3137255, 0, 1, 1,
0.5531173, 2.094359, 0.04980576, 0.3215686, 0, 1, 1,
0.5563299, -1.289388, 2.685693, 0.3254902, 0, 1, 1,
0.5612643, -0.7027948, 0.5425755, 0.3333333, 0, 1, 1,
0.5656, -0.2676491, 2.155395, 0.3372549, 0, 1, 1,
0.568692, 0.1694019, 1.526514, 0.345098, 0, 1, 1,
0.5690429, 0.03221124, 1.853, 0.3490196, 0, 1, 1,
0.5691415, -0.4051188, 3.752847, 0.3568628, 0, 1, 1,
0.5726861, 1.501436, 1.098639, 0.3607843, 0, 1, 1,
0.5755537, 1.132008, -0.4144913, 0.3686275, 0, 1, 1,
0.5771901, -2.002833, 2.960407, 0.372549, 0, 1, 1,
0.5835028, 1.074635, -0.9502888, 0.3803922, 0, 1, 1,
0.5849467, 0.4823356, 0.8951079, 0.3843137, 0, 1, 1,
0.5866451, -0.2963605, 1.519681, 0.3921569, 0, 1, 1,
0.5892457, 0.09475491, 0.5489652, 0.3960784, 0, 1, 1,
0.6013799, 1.473719, 1.350344, 0.4039216, 0, 1, 1,
0.6067193, -0.8896071, 3.701221, 0.4117647, 0, 1, 1,
0.6105857, 0.4103797, 1.586151, 0.4156863, 0, 1, 1,
0.6108982, -0.3603414, 2.328509, 0.4235294, 0, 1, 1,
0.6124012, -0.1412919, 2.635292, 0.427451, 0, 1, 1,
0.6140004, -0.7420413, 3.641092, 0.4352941, 0, 1, 1,
0.6169214, 1.40012, -0.2148443, 0.4392157, 0, 1, 1,
0.6175848, 0.3740584, 3.009365, 0.4470588, 0, 1, 1,
0.6202741, -2.15089, 3.781784, 0.4509804, 0, 1, 1,
0.6296513, -0.4203565, 1.097248, 0.4588235, 0, 1, 1,
0.6303494, -0.2798792, 1.309798, 0.4627451, 0, 1, 1,
0.6343842, 1.228848, -0.5733595, 0.4705882, 0, 1, 1,
0.6369698, 1.381602, 0.397969, 0.4745098, 0, 1, 1,
0.6388302, 0.2554291, 1.701665, 0.4823529, 0, 1, 1,
0.6398714, -0.6782315, 0.8838478, 0.4862745, 0, 1, 1,
0.640256, -1.105356, 1.190103, 0.4941176, 0, 1, 1,
0.6426066, 0.6788564, -0.2723478, 0.5019608, 0, 1, 1,
0.6426827, 0.1274253, 1.586483, 0.5058824, 0, 1, 1,
0.6477095, -1.05606, 2.26028, 0.5137255, 0, 1, 1,
0.6498719, -0.1371141, 1.872072, 0.5176471, 0, 1, 1,
0.6560861, 0.7921107, 2.70895, 0.5254902, 0, 1, 1,
0.6707006, 1.263136, 1.6211, 0.5294118, 0, 1, 1,
0.6746305, 0.3965357, -0.2164226, 0.5372549, 0, 1, 1,
0.6763324, 1.154106, -0.9037068, 0.5411765, 0, 1, 1,
0.6865053, -0.3044059, 2.172475, 0.5490196, 0, 1, 1,
0.6865844, 1.107832, -0.3400759, 0.5529412, 0, 1, 1,
0.6918049, 0.554907, 1.393865, 0.5607843, 0, 1, 1,
0.6918262, -0.5973751, 3.254496, 0.5647059, 0, 1, 1,
0.6933749, -0.4691203, 2.769541, 0.572549, 0, 1, 1,
0.6941525, -0.3369017, 1.303335, 0.5764706, 0, 1, 1,
0.6944584, 0.5281291, 0.7563515, 0.5843138, 0, 1, 1,
0.6995749, -2.180397, 3.607744, 0.5882353, 0, 1, 1,
0.7143868, 0.8490521, -0.7103139, 0.5960785, 0, 1, 1,
0.7168864, 1.190038, 2.671354, 0.6039216, 0, 1, 1,
0.7169312, -0.1625569, 1.628678, 0.6078432, 0, 1, 1,
0.7172693, -0.2022424, 0.3148535, 0.6156863, 0, 1, 1,
0.7188777, 1.496808, -0.3444985, 0.6196079, 0, 1, 1,
0.723833, 0.8713978, 1.661926, 0.627451, 0, 1, 1,
0.737695, -0.07352994, 2.177896, 0.6313726, 0, 1, 1,
0.7377468, 1.186618, 0.6029354, 0.6392157, 0, 1, 1,
0.7380749, 1.465837, -0.3537754, 0.6431373, 0, 1, 1,
0.7386858, -0.1515281, 2.714249, 0.6509804, 0, 1, 1,
0.7418548, -0.2680679, 2.366742, 0.654902, 0, 1, 1,
0.7532189, -0.2832118, 0.257396, 0.6627451, 0, 1, 1,
0.7560691, -0.2037311, 2.653873, 0.6666667, 0, 1, 1,
0.7679232, -1.191199, 2.914019, 0.6745098, 0, 1, 1,
0.7704229, 0.5034878, -1.084534, 0.6784314, 0, 1, 1,
0.7756018, -1.215182, 2.873337, 0.6862745, 0, 1, 1,
0.7870529, -0.8051665, 1.9102, 0.6901961, 0, 1, 1,
0.7892243, -1.183578, 1.795457, 0.6980392, 0, 1, 1,
0.7930552, -1.069668, 2.935848, 0.7058824, 0, 1, 1,
0.7956778, -0.9118943, 1.853489, 0.7098039, 0, 1, 1,
0.7986163, -1.614134, 1.364454, 0.7176471, 0, 1, 1,
0.8015768, 0.5418066, 0.4905349, 0.7215686, 0, 1, 1,
0.801603, 0.3137192, -0.5082271, 0.7294118, 0, 1, 1,
0.8052455, -0.584171, 2.773229, 0.7333333, 0, 1, 1,
0.8064347, 0.08147407, 1.60458, 0.7411765, 0, 1, 1,
0.8072556, 0.8743716, 0.9693711, 0.7450981, 0, 1, 1,
0.8082577, -0.2077406, 1.581983, 0.7529412, 0, 1, 1,
0.8125688, -0.6803793, 1.75293, 0.7568628, 0, 1, 1,
0.8145767, 0.4948401, -0.9325014, 0.7647059, 0, 1, 1,
0.818835, -0.0845921, 2.281072, 0.7686275, 0, 1, 1,
0.8199965, 0.2967423, 0.7444547, 0.7764706, 0, 1, 1,
0.8231946, 1.771467, 1.400393, 0.7803922, 0, 1, 1,
0.8358833, -1.72802, 3.222092, 0.7882353, 0, 1, 1,
0.8359262, 1.07445, 1.054388, 0.7921569, 0, 1, 1,
0.8383292, 0.825631, 0.4925699, 0.8, 0, 1, 1,
0.8432292, -0.6238366, 3.523568, 0.8078431, 0, 1, 1,
0.8486971, 0.5945594, -0.1271182, 0.8117647, 0, 1, 1,
0.8499175, -0.1567791, 3.08615, 0.8196079, 0, 1, 1,
0.8617372, 1.432621, -1.140208, 0.8235294, 0, 1, 1,
0.86519, 0.9994443, -0.3788821, 0.8313726, 0, 1, 1,
0.8715212, -0.06004751, 1.204348, 0.8352941, 0, 1, 1,
0.8723688, -0.7149953, 2.051454, 0.8431373, 0, 1, 1,
0.874136, 0.006593096, 1.681479, 0.8470588, 0, 1, 1,
0.8905391, 0.7242039, 1.039598, 0.854902, 0, 1, 1,
0.8949186, 0.2570003, 0.8600787, 0.8588235, 0, 1, 1,
0.9040334, 0.221403, 1.832304, 0.8666667, 0, 1, 1,
0.9052162, 1.119405, 2.528577, 0.8705882, 0, 1, 1,
0.907672, 1.569524, -0.2725374, 0.8784314, 0, 1, 1,
0.9103466, -1.525729, 0.8364275, 0.8823529, 0, 1, 1,
0.9153777, -0.7944978, 1.785639, 0.8901961, 0, 1, 1,
0.9176659, 0.08493807, 1.640566, 0.8941177, 0, 1, 1,
0.9210042, 1.219554, 1.862046, 0.9019608, 0, 1, 1,
0.9244838, -0.4804743, 2.394756, 0.9098039, 0, 1, 1,
0.9266778, 1.096458, 0.6502663, 0.9137255, 0, 1, 1,
0.9273533, -0.9293404, 2.949565, 0.9215686, 0, 1, 1,
0.9278472, 0.6758395, 0.8149686, 0.9254902, 0, 1, 1,
0.9287863, -1.74507, 1.353876, 0.9333333, 0, 1, 1,
0.9298151, -1.8652, 1.901753, 0.9372549, 0, 1, 1,
0.9376115, 1.370944, 0.07658602, 0.945098, 0, 1, 1,
0.9387534, 1.441306, 1.308576, 0.9490196, 0, 1, 1,
0.941456, -1.574428, 1.12716, 0.9568627, 0, 1, 1,
0.9436627, 1.154371, 1.654608, 0.9607843, 0, 1, 1,
0.9521838, 0.2254098, 2.272536, 0.9686275, 0, 1, 1,
0.960676, 0.1303133, 1.276408, 0.972549, 0, 1, 1,
0.9608112, -0.03015808, 2.333636, 0.9803922, 0, 1, 1,
0.9705675, 0.6343488, 1.054607, 0.9843137, 0, 1, 1,
0.9769679, -0.4862018, 2.704856, 0.9921569, 0, 1, 1,
0.9817367, -1.765866, 2.947056, 0.9960784, 0, 1, 1,
0.9884983, -0.8991475, 2.452927, 1, 0, 0.9960784, 1,
0.9905133, -0.4240082, 3.085772, 1, 0, 0.9882353, 1,
0.9924069, 1.601071, 1.405043, 1, 0, 0.9843137, 1,
0.9932944, 0.6343988, 2.416008, 1, 0, 0.9764706, 1,
0.9956851, -0.5541273, 4.180615, 1, 0, 0.972549, 1,
0.999448, 3.093764, -0.7929527, 1, 0, 0.9647059, 1,
1.000776, 0.001558775, 2.655263, 1, 0, 0.9607843, 1,
1.004831, 1.22647, -0.2670446, 1, 0, 0.9529412, 1,
1.007058, -0.9503948, 0.45878, 1, 0, 0.9490196, 1,
1.011996, -2.259091, 2.245056, 1, 0, 0.9411765, 1,
1.014462, -0.01283459, 1.78512, 1, 0, 0.9372549, 1,
1.018742, 1.367113, 0.6144162, 1, 0, 0.9294118, 1,
1.028332, -0.3742303, 0.9239097, 1, 0, 0.9254902, 1,
1.028677, 0.4127511, 0.6207478, 1, 0, 0.9176471, 1,
1.035872, 0.8026563, 2.823698, 1, 0, 0.9137255, 1,
1.036914, -0.5112025, 0.5707642, 1, 0, 0.9058824, 1,
1.037311, -0.2124519, 0.1633552, 1, 0, 0.9019608, 1,
1.03812, 0.7658989, -0.4106095, 1, 0, 0.8941177, 1,
1.041692, -0.521751, 2.117103, 1, 0, 0.8862745, 1,
1.042792, 0.08244649, 2.099545, 1, 0, 0.8823529, 1,
1.050721, 1.484931, 1.362073, 1, 0, 0.8745098, 1,
1.057601, -0.7898225, 2.684358, 1, 0, 0.8705882, 1,
1.058565, 0.2031906, -0.6827939, 1, 0, 0.8627451, 1,
1.06544, 0.2025764, 1.669459, 1, 0, 0.8588235, 1,
1.066913, 0.1272633, 1.565634, 1, 0, 0.8509804, 1,
1.077896, -0.3372742, 1.862319, 1, 0, 0.8470588, 1,
1.080929, 0.438818, 0.1845483, 1, 0, 0.8392157, 1,
1.081014, -0.883332, 1.607487, 1, 0, 0.8352941, 1,
1.083642, -0.3254019, 1.997195, 1, 0, 0.827451, 1,
1.087263, -0.7278115, 1.056031, 1, 0, 0.8235294, 1,
1.093195, -0.00333594, 0.7093934, 1, 0, 0.8156863, 1,
1.094381, -1.957115, 4.355648, 1, 0, 0.8117647, 1,
1.097214, 0.8907045, 1.169169, 1, 0, 0.8039216, 1,
1.100046, 0.2097328, 0.2114081, 1, 0, 0.7960784, 1,
1.112344, -0.9750059, 2.220194, 1, 0, 0.7921569, 1,
1.115523, -0.1868922, -0.2567858, 1, 0, 0.7843137, 1,
1.12088, 0.146403, 1.151162, 1, 0, 0.7803922, 1,
1.125003, 0.04133294, 2.591477, 1, 0, 0.772549, 1,
1.132336, 2.283413, -1.899259, 1, 0, 0.7686275, 1,
1.149973, 1.501517, 2.358883, 1, 0, 0.7607843, 1,
1.153189, 1.080324, 1.185901, 1, 0, 0.7568628, 1,
1.163562, -1.304719, 2.901121, 1, 0, 0.7490196, 1,
1.164594, 2.131561, 1.739522, 1, 0, 0.7450981, 1,
1.164685, 0.208076, 1.277063, 1, 0, 0.7372549, 1,
1.165579, 0.3926696, 1.421037, 1, 0, 0.7333333, 1,
1.16693, -1.375331, 3.352276, 1, 0, 0.7254902, 1,
1.167619, 0.4495538, 0.4388463, 1, 0, 0.7215686, 1,
1.170753, -0.3563572, 1.157344, 1, 0, 0.7137255, 1,
1.175394, 1.13134, -0.2725237, 1, 0, 0.7098039, 1,
1.18549, 0.7087487, 1.409186, 1, 0, 0.7019608, 1,
1.185573, -0.3744937, 1.582927, 1, 0, 0.6941177, 1,
1.20301, -0.9088011, 3.095887, 1, 0, 0.6901961, 1,
1.210629, 1.422788, 0.1473217, 1, 0, 0.682353, 1,
1.212784, -0.1400499, 2.086785, 1, 0, 0.6784314, 1,
1.216384, -0.7605355, 2.038652, 1, 0, 0.6705883, 1,
1.234192, 1.998814, 1.042127, 1, 0, 0.6666667, 1,
1.237294, 2.269049, 0.2933204, 1, 0, 0.6588235, 1,
1.242778, 2.615538, -0.297926, 1, 0, 0.654902, 1,
1.253498, 1.169743, 1.210788, 1, 0, 0.6470588, 1,
1.257356, -0.5168075, 1.025348, 1, 0, 0.6431373, 1,
1.260833, -0.1906059, 0.8111271, 1, 0, 0.6352941, 1,
1.265706, 1.524336, 1.499634, 1, 0, 0.6313726, 1,
1.266201, 1.155601, 2.039928, 1, 0, 0.6235294, 1,
1.266293, -0.0944146, 1.463904, 1, 0, 0.6196079, 1,
1.270657, -1.444094, 2.076971, 1, 0, 0.6117647, 1,
1.273606, -0.8255814, 2.946192, 1, 0, 0.6078432, 1,
1.275948, 0.4666123, 2.246524, 1, 0, 0.6, 1,
1.276559, -0.6449955, 1.655244, 1, 0, 0.5921569, 1,
1.276592, -0.02316879, 1.918219, 1, 0, 0.5882353, 1,
1.280177, 0.630994, 1.354932, 1, 0, 0.5803922, 1,
1.288838, 0.09790002, 0.7516536, 1, 0, 0.5764706, 1,
1.288989, -0.7601255, 3.981792, 1, 0, 0.5686275, 1,
1.292028, 0.8270662, 1.077016, 1, 0, 0.5647059, 1,
1.305467, -0.2393056, 3.266124, 1, 0, 0.5568628, 1,
1.306539, -0.5744632, 2.614833, 1, 0, 0.5529412, 1,
1.307988, 1.927248, -0.4661231, 1, 0, 0.5450981, 1,
1.326477, 0.08555356, 2.506208, 1, 0, 0.5411765, 1,
1.329474, 0.7336397, 1.918703, 1, 0, 0.5333334, 1,
1.33336, -0.8793226, 2.982553, 1, 0, 0.5294118, 1,
1.334692, -0.2279468, 2.184349, 1, 0, 0.5215687, 1,
1.337479, 0.4242424, 2.405342, 1, 0, 0.5176471, 1,
1.337763, 0.7946151, 0.997754, 1, 0, 0.509804, 1,
1.339568, -0.8333385, 0.7612646, 1, 0, 0.5058824, 1,
1.348734, -1.385032, 2.994064, 1, 0, 0.4980392, 1,
1.35867, -1.404648, 2.213262, 1, 0, 0.4901961, 1,
1.362009, 3.664263, -0.2424434, 1, 0, 0.4862745, 1,
1.364255, 0.4282166, 1.526171, 1, 0, 0.4784314, 1,
1.364721, 0.8713272, 1.482862, 1, 0, 0.4745098, 1,
1.385261, 1.068522, 1.626103, 1, 0, 0.4666667, 1,
1.385916, -0.7343462, 1.482359, 1, 0, 0.4627451, 1,
1.401665, -0.3998079, 1.810581, 1, 0, 0.454902, 1,
1.407359, 1.39458, 0.9110214, 1, 0, 0.4509804, 1,
1.409885, 0.2660913, 0.9191417, 1, 0, 0.4431373, 1,
1.410568, -1.294472, 1.785084, 1, 0, 0.4392157, 1,
1.412374, -0.0396103, 2.762682, 1, 0, 0.4313726, 1,
1.438709, 0.5897754, -0.08782364, 1, 0, 0.427451, 1,
1.446082, -0.8210651, -0.9108146, 1, 0, 0.4196078, 1,
1.453848, 2.097477, 1.585755, 1, 0, 0.4156863, 1,
1.457742, 0.2733414, 1.886019, 1, 0, 0.4078431, 1,
1.459083, 0.6042999, 2.521949, 1, 0, 0.4039216, 1,
1.459946, -0.5788007, 2.372531, 1, 0, 0.3960784, 1,
1.465127, -0.4199222, 1.092927, 1, 0, 0.3882353, 1,
1.500571, -1.379362, 2.378875, 1, 0, 0.3843137, 1,
1.502064, 0.269133, 0.6240302, 1, 0, 0.3764706, 1,
1.507629, 0.09678277, 1.166977, 1, 0, 0.372549, 1,
1.509391, -0.1645887, 0.3917162, 1, 0, 0.3647059, 1,
1.514992, -0.1156168, -0.02965138, 1, 0, 0.3607843, 1,
1.51608, -1.455367, 1.919999, 1, 0, 0.3529412, 1,
1.523251, 0.3433801, 0.7419291, 1, 0, 0.3490196, 1,
1.533273, -0.4796804, 3.687942, 1, 0, 0.3411765, 1,
1.533873, 1.553346, 1.175919, 1, 0, 0.3372549, 1,
1.565961, 0.2568481, 0.7829479, 1, 0, 0.3294118, 1,
1.569755, 1.403765, -0.7243029, 1, 0, 0.3254902, 1,
1.572175, 0.03885025, 2.728971, 1, 0, 0.3176471, 1,
1.572959, -1.291441, 1.010368, 1, 0, 0.3137255, 1,
1.588818, -0.08029556, 1.438576, 1, 0, 0.3058824, 1,
1.591575, 0.4701098, 0.6568353, 1, 0, 0.2980392, 1,
1.593452, -1.456495, 1.993566, 1, 0, 0.2941177, 1,
1.600319, 0.3373119, 0.9859197, 1, 0, 0.2862745, 1,
1.638588, -1.301069, 0.5950341, 1, 0, 0.282353, 1,
1.639455, 0.4147147, 0.0788771, 1, 0, 0.2745098, 1,
1.644926, -2.801674, 1.2586, 1, 0, 0.2705882, 1,
1.653919, -1.230508, 0.6918383, 1, 0, 0.2627451, 1,
1.659706, 0.5270075, -0.8289867, 1, 0, 0.2588235, 1,
1.671123, -0.6883106, 1.711927, 1, 0, 0.2509804, 1,
1.686401, 1.337924, 2.12924, 1, 0, 0.2470588, 1,
1.69797, -1.010438, 2.583397, 1, 0, 0.2392157, 1,
1.708158, -0.3400906, 2.863281, 1, 0, 0.2352941, 1,
1.723657, 0.2577738, 1.504789, 1, 0, 0.227451, 1,
1.764657, -0.5249214, 1.372982, 1, 0, 0.2235294, 1,
1.77116, 0.07317422, 2.717742, 1, 0, 0.2156863, 1,
1.835844, -0.7608663, 3.699288, 1, 0, 0.2117647, 1,
1.841095, 1.39903, 1.181259, 1, 0, 0.2039216, 1,
1.871049, 0.3545698, 2.559079, 1, 0, 0.1960784, 1,
1.886848, 0.01391967, 0.9886302, 1, 0, 0.1921569, 1,
1.900785, -0.4571449, 1.509794, 1, 0, 0.1843137, 1,
1.905441, 0.8755666, 1.46765, 1, 0, 0.1803922, 1,
1.91124, 0.7616937, 0.4770284, 1, 0, 0.172549, 1,
1.917659, -0.2188496, 3.417948, 1, 0, 0.1686275, 1,
1.952791, -0.1343043, 1.268064, 1, 0, 0.1607843, 1,
1.981303, -0.9326466, 2.927335, 1, 0, 0.1568628, 1,
1.983421, 0.4261566, 2.128614, 1, 0, 0.1490196, 1,
2.022237, 1.55403, 0.9229569, 1, 0, 0.145098, 1,
2.035659, 0.2926239, 2.336297, 1, 0, 0.1372549, 1,
2.043253, 0.4357722, 1.900627, 1, 0, 0.1333333, 1,
2.069427, 1.942435, 0.7005298, 1, 0, 0.1254902, 1,
2.076289, 0.5928919, 1.783165, 1, 0, 0.1215686, 1,
2.082326, 0.3206775, 1.826963, 1, 0, 0.1137255, 1,
2.092287, -0.5351164, 1.276956, 1, 0, 0.1098039, 1,
2.09638, 1.768601, 1.799774, 1, 0, 0.1019608, 1,
2.121345, 1.247001, 0.4991585, 1, 0, 0.09411765, 1,
2.147355, 1.30901, 0.6963101, 1, 0, 0.09019608, 1,
2.155915, 1.26502, 0.6966102, 1, 0, 0.08235294, 1,
2.161831, -0.3457726, 2.535144, 1, 0, 0.07843138, 1,
2.208208, -1.005564, 1.53623, 1, 0, 0.07058824, 1,
2.218228, 0.1366625, 1.29608, 1, 0, 0.06666667, 1,
2.321904, 0.4054452, 3.473685, 1, 0, 0.05882353, 1,
2.345834, -0.7746406, 1.224198, 1, 0, 0.05490196, 1,
2.366428, -0.8292714, 1.201383, 1, 0, 0.04705882, 1,
2.466817, -0.8586847, 0.6183582, 1, 0, 0.04313726, 1,
2.467495, -0.8728, 1.689786, 1, 0, 0.03529412, 1,
2.481044, -0.0602298, 0.3955494, 1, 0, 0.03137255, 1,
2.595118, 0.1643987, 0.3664538, 1, 0, 0.02352941, 1,
2.617583, 0.6124184, 2.627964, 1, 0, 0.01960784, 1,
2.697747, -1.453797, 2.276516, 1, 0, 0.01176471, 1,
2.883571, -1.247504, 1.49817, 1, 0, 0.007843138, 1
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
-0.09000218, -4.025226, -7.415552, 0, -0.5, 0.5, 0.5,
-0.09000218, -4.025226, -7.415552, 1, -0.5, 0.5, 0.5,
-0.09000218, -4.025226, -7.415552, 1, 1.5, 0.5, 0.5,
-0.09000218, -4.025226, -7.415552, 0, 1.5, 0.5, 0.5
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
-4.071617, 0.376752, -7.415552, 0, -0.5, 0.5, 0.5,
-4.071617, 0.376752, -7.415552, 1, -0.5, 0.5, 0.5,
-4.071617, 0.376752, -7.415552, 1, 1.5, 0.5, 0.5,
-4.071617, 0.376752, -7.415552, 0, 1.5, 0.5, 0.5
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
-4.071617, -4.025226, 0.1055391, 0, -0.5, 0.5, 0.5,
-4.071617, -4.025226, 0.1055391, 1, -0.5, 0.5, 0.5,
-4.071617, -4.025226, 0.1055391, 1, 1.5, 0.5, 0.5,
-4.071617, -4.025226, 0.1055391, 0, 1.5, 0.5, 0.5
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
-3, -3.009385, -5.679915,
2, -3.009385, -5.679915,
-3, -3.009385, -5.679915,
-3, -3.178691, -5.969188,
-2, -3.009385, -5.679915,
-2, -3.178691, -5.969188,
-1, -3.009385, -5.679915,
-1, -3.178691, -5.969188,
0, -3.009385, -5.679915,
0, -3.178691, -5.969188,
1, -3.009385, -5.679915,
1, -3.178691, -5.969188,
2, -3.009385, -5.679915,
2, -3.178691, -5.969188
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
-3, -3.517305, -6.547733, 0, -0.5, 0.5, 0.5,
-3, -3.517305, -6.547733, 1, -0.5, 0.5, 0.5,
-3, -3.517305, -6.547733, 1, 1.5, 0.5, 0.5,
-3, -3.517305, -6.547733, 0, 1.5, 0.5, 0.5,
-2, -3.517305, -6.547733, 0, -0.5, 0.5, 0.5,
-2, -3.517305, -6.547733, 1, -0.5, 0.5, 0.5,
-2, -3.517305, -6.547733, 1, 1.5, 0.5, 0.5,
-2, -3.517305, -6.547733, 0, 1.5, 0.5, 0.5,
-1, -3.517305, -6.547733, 0, -0.5, 0.5, 0.5,
-1, -3.517305, -6.547733, 1, -0.5, 0.5, 0.5,
-1, -3.517305, -6.547733, 1, 1.5, 0.5, 0.5,
-1, -3.517305, -6.547733, 0, 1.5, 0.5, 0.5,
0, -3.517305, -6.547733, 0, -0.5, 0.5, 0.5,
0, -3.517305, -6.547733, 1, -0.5, 0.5, 0.5,
0, -3.517305, -6.547733, 1, 1.5, 0.5, 0.5,
0, -3.517305, -6.547733, 0, 1.5, 0.5, 0.5,
1, -3.517305, -6.547733, 0, -0.5, 0.5, 0.5,
1, -3.517305, -6.547733, 1, -0.5, 0.5, 0.5,
1, -3.517305, -6.547733, 1, 1.5, 0.5, 0.5,
1, -3.517305, -6.547733, 0, 1.5, 0.5, 0.5,
2, -3.517305, -6.547733, 0, -0.5, 0.5, 0.5,
2, -3.517305, -6.547733, 1, -0.5, 0.5, 0.5,
2, -3.517305, -6.547733, 1, 1.5, 0.5, 0.5,
2, -3.517305, -6.547733, 0, 1.5, 0.5, 0.5
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
-3.152783, -2, -5.679915,
-3.152783, 3, -5.679915,
-3.152783, -2, -5.679915,
-3.305922, -2, -5.969188,
-3.152783, -1, -5.679915,
-3.305922, -1, -5.969188,
-3.152783, 0, -5.679915,
-3.305922, 0, -5.969188,
-3.152783, 1, -5.679915,
-3.305922, 1, -5.969188,
-3.152783, 2, -5.679915,
-3.305922, 2, -5.969188,
-3.152783, 3, -5.679915,
-3.305922, 3, -5.969188
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
-3.6122, -2, -6.547733, 0, -0.5, 0.5, 0.5,
-3.6122, -2, -6.547733, 1, -0.5, 0.5, 0.5,
-3.6122, -2, -6.547733, 1, 1.5, 0.5, 0.5,
-3.6122, -2, -6.547733, 0, 1.5, 0.5, 0.5,
-3.6122, -1, -6.547733, 0, -0.5, 0.5, 0.5,
-3.6122, -1, -6.547733, 1, -0.5, 0.5, 0.5,
-3.6122, -1, -6.547733, 1, 1.5, 0.5, 0.5,
-3.6122, -1, -6.547733, 0, 1.5, 0.5, 0.5,
-3.6122, 0, -6.547733, 0, -0.5, 0.5, 0.5,
-3.6122, 0, -6.547733, 1, -0.5, 0.5, 0.5,
-3.6122, 0, -6.547733, 1, 1.5, 0.5, 0.5,
-3.6122, 0, -6.547733, 0, 1.5, 0.5, 0.5,
-3.6122, 1, -6.547733, 0, -0.5, 0.5, 0.5,
-3.6122, 1, -6.547733, 1, -0.5, 0.5, 0.5,
-3.6122, 1, -6.547733, 1, 1.5, 0.5, 0.5,
-3.6122, 1, -6.547733, 0, 1.5, 0.5, 0.5,
-3.6122, 2, -6.547733, 0, -0.5, 0.5, 0.5,
-3.6122, 2, -6.547733, 1, -0.5, 0.5, 0.5,
-3.6122, 2, -6.547733, 1, 1.5, 0.5, 0.5,
-3.6122, 2, -6.547733, 0, 1.5, 0.5, 0.5,
-3.6122, 3, -6.547733, 0, -0.5, 0.5, 0.5,
-3.6122, 3, -6.547733, 1, -0.5, 0.5, 0.5,
-3.6122, 3, -6.547733, 1, 1.5, 0.5, 0.5,
-3.6122, 3, -6.547733, 0, 1.5, 0.5, 0.5
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
-3.152783, -3.009385, -4,
-3.152783, -3.009385, 4,
-3.152783, -3.009385, -4,
-3.305922, -3.178691, -4,
-3.152783, -3.009385, -2,
-3.305922, -3.178691, -2,
-3.152783, -3.009385, 0,
-3.305922, -3.178691, 0,
-3.152783, -3.009385, 2,
-3.305922, -3.178691, 2,
-3.152783, -3.009385, 4,
-3.305922, -3.178691, 4
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
-3.6122, -3.517305, -4, 0, -0.5, 0.5, 0.5,
-3.6122, -3.517305, -4, 1, -0.5, 0.5, 0.5,
-3.6122, -3.517305, -4, 1, 1.5, 0.5, 0.5,
-3.6122, -3.517305, -4, 0, 1.5, 0.5, 0.5,
-3.6122, -3.517305, -2, 0, -0.5, 0.5, 0.5,
-3.6122, -3.517305, -2, 1, -0.5, 0.5, 0.5,
-3.6122, -3.517305, -2, 1, 1.5, 0.5, 0.5,
-3.6122, -3.517305, -2, 0, 1.5, 0.5, 0.5,
-3.6122, -3.517305, 0, 0, -0.5, 0.5, 0.5,
-3.6122, -3.517305, 0, 1, -0.5, 0.5, 0.5,
-3.6122, -3.517305, 0, 1, 1.5, 0.5, 0.5,
-3.6122, -3.517305, 0, 0, 1.5, 0.5, 0.5,
-3.6122, -3.517305, 2, 0, -0.5, 0.5, 0.5,
-3.6122, -3.517305, 2, 1, -0.5, 0.5, 0.5,
-3.6122, -3.517305, 2, 1, 1.5, 0.5, 0.5,
-3.6122, -3.517305, 2, 0, 1.5, 0.5, 0.5,
-3.6122, -3.517305, 4, 0, -0.5, 0.5, 0.5,
-3.6122, -3.517305, 4, 1, -0.5, 0.5, 0.5,
-3.6122, -3.517305, 4, 1, 1.5, 0.5, 0.5,
-3.6122, -3.517305, 4, 0, 1.5, 0.5, 0.5
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
-3.152783, -3.009385, -5.679915,
-3.152783, 3.762889, -5.679915,
-3.152783, -3.009385, 5.890994,
-3.152783, 3.762889, 5.890994,
-3.152783, -3.009385, -5.679915,
-3.152783, -3.009385, 5.890994,
-3.152783, 3.762889, -5.679915,
-3.152783, 3.762889, 5.890994,
-3.152783, -3.009385, -5.679915,
2.972778, -3.009385, -5.679915,
-3.152783, -3.009385, 5.890994,
2.972778, -3.009385, 5.890994,
-3.152783, 3.762889, -5.679915,
2.972778, 3.762889, -5.679915,
-3.152783, 3.762889, 5.890994,
2.972778, 3.762889, 5.890994,
2.972778, -3.009385, -5.679915,
2.972778, 3.762889, -5.679915,
2.972778, -3.009385, 5.890994,
2.972778, 3.762889, 5.890994,
2.972778, -3.009385, -5.679915,
2.972778, -3.009385, 5.890994,
2.972778, 3.762889, -5.679915,
2.972778, 3.762889, 5.890994
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
var radius = 7.870955;
var distance = 35.01877;
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
mvMatrix.translate( 0.09000218, -0.376752, -0.1055391 );
mvMatrix.scale( 1.389298, 1.256629, 0.7354851 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.01877);
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
nuarimol<-read.table("nuarimol.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-nuarimol$V2
```

```
## Error in eval(expr, envir, enclos): object 'nuarimol' not found
```

```r
y<-nuarimol$V3
```

```
## Error in eval(expr, envir, enclos): object 'nuarimol' not found
```

```r
z<-nuarimol$V4
```

```
## Error in eval(expr, envir, enclos): object 'nuarimol' not found
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
-3.063576, 0.02140719, -1.393298, 0, 0, 1, 1, 1,
-3.035495, -0.0553389, -1.245281, 1, 0, 0, 1, 1,
-2.856358, 1.61669, 0.03259708, 1, 0, 0, 1, 1,
-2.82536, 0.378302, -2.963365, 1, 0, 0, 1, 1,
-2.801995, 0.04358792, -1.371847, 1, 0, 0, 1, 1,
-2.737494, -0.5194044, -0.4942238, 1, 0, 0, 1, 1,
-2.713441, -0.2983778, -2.89342, 0, 0, 0, 1, 1,
-2.633441, 0.4449498, -1.115787, 0, 0, 0, 1, 1,
-2.537209, 0.1376136, -1.248337, 0, 0, 0, 1, 1,
-2.531045, -0.6507862, -2.822315, 0, 0, 0, 1, 1,
-2.516862, 0.4923271, -1.30337, 0, 0, 0, 1, 1,
-2.506283, 0.8404586, -1.427158, 0, 0, 0, 1, 1,
-2.453794, -0.129495, -1.994918, 0, 0, 0, 1, 1,
-2.429606, -0.1239266, -0.9677734, 1, 1, 1, 1, 1,
-2.373451, -1.294664, -3.517119, 1, 1, 1, 1, 1,
-2.345336, 0.4420943, -0.9446197, 1, 1, 1, 1, 1,
-2.337693, -1.050306, -2.815373, 1, 1, 1, 1, 1,
-2.310642, 0.8643276, -1.580935, 1, 1, 1, 1, 1,
-2.260236, -1.32119, -2.195139, 1, 1, 1, 1, 1,
-2.16651, -0.04927577, -2.854454, 1, 1, 1, 1, 1,
-2.159158, 0.2125921, -0.2859391, 1, 1, 1, 1, 1,
-2.158786, -0.1399273, -0.4388998, 1, 1, 1, 1, 1,
-2.082256, -1.532335, -2.07645, 1, 1, 1, 1, 1,
-2.078238, 0.4383415, -1.195118, 1, 1, 1, 1, 1,
-2.068196, -0.6882769, -1.472345, 1, 1, 1, 1, 1,
-2.065189, 1.185226, -0.01935036, 1, 1, 1, 1, 1,
-2.056519, -0.3472476, -1.92011, 1, 1, 1, 1, 1,
-2.040489, 2.22181, 1.282256, 1, 1, 1, 1, 1,
-2.024575, 0.2059478, -1.496337, 0, 0, 1, 1, 1,
-1.987468, 0.3664602, -2.235558, 1, 0, 0, 1, 1,
-1.985151, 0.463334, -3.328954, 1, 0, 0, 1, 1,
-1.953521, -0.3831438, -1.404817, 1, 0, 0, 1, 1,
-1.951313, 0.2808733, -1.420131, 1, 0, 0, 1, 1,
-1.936848, 1.587005, -1.315035, 1, 0, 0, 1, 1,
-1.914037, 1.920036, -0.4222803, 0, 0, 0, 1, 1,
-1.913918, 0.2799113, -1.826791, 0, 0, 0, 1, 1,
-1.913111, 0.5866435, -3.043218, 0, 0, 0, 1, 1,
-1.880089, -0.4328511, -2.883386, 0, 0, 0, 1, 1,
-1.846091, 0.9220696, -0.8317799, 0, 0, 0, 1, 1,
-1.84045, 0.5322708, -0.2572376, 0, 0, 0, 1, 1,
-1.830968, 1.341268, -1.279043, 0, 0, 0, 1, 1,
-1.820565, -1.558511, -1.471005, 1, 1, 1, 1, 1,
-1.817495, 0.2538468, -0.1814924, 1, 1, 1, 1, 1,
-1.802659, -0.5636829, -3.7261, 1, 1, 1, 1, 1,
-1.798184, -0.4468045, -0.01710258, 1, 1, 1, 1, 1,
-1.79547, -0.7302211, -0.5420417, 1, 1, 1, 1, 1,
-1.789837, 0.5488873, -0.04713687, 1, 1, 1, 1, 1,
-1.784117, -0.8007447, -2.296596, 1, 1, 1, 1, 1,
-1.775729, -0.7119556, -3.163067, 1, 1, 1, 1, 1,
-1.752674, -0.6714026, -0.7503371, 1, 1, 1, 1, 1,
-1.738936, 0.3021771, -1.967727, 1, 1, 1, 1, 1,
-1.735531, -1.49018, -2.498955, 1, 1, 1, 1, 1,
-1.699608, 1.380071, -1.576825, 1, 1, 1, 1, 1,
-1.666565, 0.3598243, -0.4236283, 1, 1, 1, 1, 1,
-1.649175, 0.3081155, -1.303251, 1, 1, 1, 1, 1,
-1.645934, -1.37905, -1.403488, 1, 1, 1, 1, 1,
-1.645582, -0.6250468, -1.867639, 0, 0, 1, 1, 1,
-1.635355, -0.07491943, -0.2472955, 1, 0, 0, 1, 1,
-1.620006, 0.5433219, -2.803952, 1, 0, 0, 1, 1,
-1.578795, 0.6503726, -0.2017248, 1, 0, 0, 1, 1,
-1.573817, 1.016878, -0.673749, 1, 0, 0, 1, 1,
-1.570803, -0.6241515, -1.305309, 1, 0, 0, 1, 1,
-1.568728, -0.8800414, -3.94672, 0, 0, 0, 1, 1,
-1.520298, -0.7851701, -4.680469, 0, 0, 0, 1, 1,
-1.498066, 0.08966642, -1.148692, 0, 0, 0, 1, 1,
-1.486998, -0.4309431, -2.136263, 0, 0, 0, 1, 1,
-1.485827, -0.5991511, -2.766561, 0, 0, 0, 1, 1,
-1.484299, -1.112459, -0.1601269, 0, 0, 0, 1, 1,
-1.47796, 0.6383846, -1.754805, 0, 0, 0, 1, 1,
-1.475236, -1.106559, -0.2981957, 1, 1, 1, 1, 1,
-1.475234, 0.3666795, -0.1619231, 1, 1, 1, 1, 1,
-1.458714, -1.991681, -1.951821, 1, 1, 1, 1, 1,
-1.432596, 1.006911, -0.2317717, 1, 1, 1, 1, 1,
-1.430508, 1.214715, -0.8616647, 1, 1, 1, 1, 1,
-1.429337, 1.487519, -0.4673927, 1, 1, 1, 1, 1,
-1.428588, 0.8977459, -3.432274, 1, 1, 1, 1, 1,
-1.407109, -0.7485408, -1.314977, 1, 1, 1, 1, 1,
-1.383775, -0.2794936, -1.664649, 1, 1, 1, 1, 1,
-1.383048, -1.795517, -0.8009266, 1, 1, 1, 1, 1,
-1.381237, 0.01459384, -0.3815377, 1, 1, 1, 1, 1,
-1.380275, -0.1715062, -2.894205, 1, 1, 1, 1, 1,
-1.379066, -2.383054, -1.870223, 1, 1, 1, 1, 1,
-1.370099, 1.362084, -1.331506, 1, 1, 1, 1, 1,
-1.364125, 0.5238717, -0.4465515, 1, 1, 1, 1, 1,
-1.357198, 1.337506, -1.596292, 0, 0, 1, 1, 1,
-1.336155, -0.8719405, -0.708077, 1, 0, 0, 1, 1,
-1.315671, 0.2100714, -3.387436, 1, 0, 0, 1, 1,
-1.314616, 1.155733, -1.118715, 1, 0, 0, 1, 1,
-1.307537, -1.694396, -2.514366, 1, 0, 0, 1, 1,
-1.282998, -0.2551238, 0.0867148, 1, 0, 0, 1, 1,
-1.275944, 1.003238, 1.980345, 0, 0, 0, 1, 1,
-1.275745, 0.5890146, -1.21901, 0, 0, 0, 1, 1,
-1.274688, -1.09378, -2.892286, 0, 0, 0, 1, 1,
-1.271521, 0.1477164, -2.723772, 0, 0, 0, 1, 1,
-1.254077, -0.5240382, -3.829129, 0, 0, 0, 1, 1,
-1.252927, 0.664655, 0.007598707, 0, 0, 0, 1, 1,
-1.251731, 0.7988002, -0.6901233, 0, 0, 0, 1, 1,
-1.247538, -1.632738, -1.877574, 1, 1, 1, 1, 1,
-1.230099, -0.337268, -0.6983539, 1, 1, 1, 1, 1,
-1.229034, -0.8638707, -2.068208, 1, 1, 1, 1, 1,
-1.221018, -1.571748, -3.734896, 1, 1, 1, 1, 1,
-1.218994, -0.6821854, -2.217875, 1, 1, 1, 1, 1,
-1.21744, -1.888146, -4.069587, 1, 1, 1, 1, 1,
-1.213969, -2.474437, -1.705967, 1, 1, 1, 1, 1,
-1.205637, -0.6500338, -3.771705, 1, 1, 1, 1, 1,
-1.204334, 0.9349859, -1.797738, 1, 1, 1, 1, 1,
-1.200945, 0.4978647, -0.08990604, 1, 1, 1, 1, 1,
-1.200905, -2.910759, -3.542818, 1, 1, 1, 1, 1,
-1.195613, 1.232875, -1.182359, 1, 1, 1, 1, 1,
-1.178488, -1.964885, -3.811178, 1, 1, 1, 1, 1,
-1.176883, -0.9630762, -1.415159, 1, 1, 1, 1, 1,
-1.176105, 1.964464, -0.2200805, 1, 1, 1, 1, 1,
-1.175692, 0.4203389, -1.473082, 0, 0, 1, 1, 1,
-1.174118, 0.07371844, -1.075702, 1, 0, 0, 1, 1,
-1.171538, -0.4797471, -1.700402, 1, 0, 0, 1, 1,
-1.169242, 0.783154, -0.2592619, 1, 0, 0, 1, 1,
-1.168597, -0.4924212, -3.840749, 1, 0, 0, 1, 1,
-1.164852, -0.2148788, -1.581508, 1, 0, 0, 1, 1,
-1.162346, -0.6813816, -0.8963243, 0, 0, 0, 1, 1,
-1.15433, 1.417685, -1.736319, 0, 0, 0, 1, 1,
-1.151641, -0.2545093, -0.8901885, 0, 0, 0, 1, 1,
-1.149122, 1.41823, -0.3860352, 0, 0, 0, 1, 1,
-1.139866, 0.1482702, -3.153898, 0, 0, 0, 1, 1,
-1.138029, 0.8074563, -0.4894739, 0, 0, 0, 1, 1,
-1.13137, -0.3856487, -1.370245, 0, 0, 0, 1, 1,
-1.129073, 0.1982745, -1.663256, 1, 1, 1, 1, 1,
-1.127421, -0.4575769, -2.078671, 1, 1, 1, 1, 1,
-1.123496, 1.44705, 0.854841, 1, 1, 1, 1, 1,
-1.116951, 0.5871124, -3.241399, 1, 1, 1, 1, 1,
-1.114802, -1.40432, -2.773165, 1, 1, 1, 1, 1,
-1.114461, -0.6792533, -0.9999042, 1, 1, 1, 1, 1,
-1.105024, -0.8452291, -2.577582, 1, 1, 1, 1, 1,
-1.100552, -0.2020863, -2.063821, 1, 1, 1, 1, 1,
-1.09868, -2.030127, -3.302001, 1, 1, 1, 1, 1,
-1.089866, -0.3650392, -0.9870128, 1, 1, 1, 1, 1,
-1.089449, 1.022057, -0.2527527, 1, 1, 1, 1, 1,
-1.084744, 0.6565394, 1.444185, 1, 1, 1, 1, 1,
-1.079978, 0.8157053, -0.9967697, 1, 1, 1, 1, 1,
-1.077782, -1.315305, -3.694991, 1, 1, 1, 1, 1,
-1.074762, 1.234475, -0.491793, 1, 1, 1, 1, 1,
-1.074415, 1.564163, -0.1822866, 0, 0, 1, 1, 1,
-1.07395, 0.1239744, -1.034151, 1, 0, 0, 1, 1,
-1.06641, -0.7894942, -2.412358, 1, 0, 0, 1, 1,
-1.064995, -0.5083092, -1.000261, 1, 0, 0, 1, 1,
-1.062533, 1.50037, 0.7213795, 1, 0, 0, 1, 1,
-1.051412, 0.09041972, -2.199285, 1, 0, 0, 1, 1,
-1.05075, -0.02076365, -1.470308, 0, 0, 0, 1, 1,
-1.034256, 0.5949942, -0.3043534, 0, 0, 0, 1, 1,
-1.028548, -0.6853764, -1.652933, 0, 0, 0, 1, 1,
-1.00834, -1.277074, -1.38788, 0, 0, 0, 1, 1,
-1.004507, 0.0657477, -1.830408, 0, 0, 0, 1, 1,
-1.003683, -0.4677845, -1.525985, 0, 0, 0, 1, 1,
-1.001788, 0.5820561, -1.059687, 0, 0, 0, 1, 1,
-0.9952938, 0.4712747, -0.4914769, 1, 1, 1, 1, 1,
-0.9948123, -0.5997232, -1.78645, 1, 1, 1, 1, 1,
-0.9937637, 0.05781648, -2.992165, 1, 1, 1, 1, 1,
-0.9931985, -0.4227825, -2.478917, 1, 1, 1, 1, 1,
-0.992927, 0.5312992, -2.36773, 1, 1, 1, 1, 1,
-0.9921298, -0.9638354, -2.018226, 1, 1, 1, 1, 1,
-0.9915069, -0.9739835, -3.118088, 1, 1, 1, 1, 1,
-0.9895314, -1.454622, -0.1270283, 1, 1, 1, 1, 1,
-0.9891476, -1.524635, -1.627603, 1, 1, 1, 1, 1,
-0.9878156, -0.8056295, -2.921358, 1, 1, 1, 1, 1,
-0.9829454, 0.4118375, -0.5636486, 1, 1, 1, 1, 1,
-0.9817323, -1.658927, -3.728554, 1, 1, 1, 1, 1,
-0.9719892, -0.2973902, -0.7937244, 1, 1, 1, 1, 1,
-0.9651135, -0.7792801, -4.066122, 1, 1, 1, 1, 1,
-0.9634317, -0.8551767, -1.503851, 1, 1, 1, 1, 1,
-0.963368, 1.352429, -0.9749399, 0, 0, 1, 1, 1,
-0.9552303, 0.7180259, -2.303101, 1, 0, 0, 1, 1,
-0.9548475, 1.864255, 0.007021829, 1, 0, 0, 1, 1,
-0.9426059, 1.399824, -0.6747054, 1, 0, 0, 1, 1,
-0.9366607, -1.172121, -1.0679, 1, 0, 0, 1, 1,
-0.9350005, 0.5191728, -1.593058, 1, 0, 0, 1, 1,
-0.9322857, 0.2718402, -0.8353813, 0, 0, 0, 1, 1,
-0.9316589, 0.9393961, -1.034235, 0, 0, 0, 1, 1,
-0.9204746, 0.1639502, -1.325918, 0, 0, 0, 1, 1,
-0.9189419, -1.781745, -3.008454, 0, 0, 0, 1, 1,
-0.9125568, -0.09902643, -0.9351341, 0, 0, 0, 1, 1,
-0.908496, 0.7813306, 0.09883838, 0, 0, 0, 1, 1,
-0.9052569, 0.5050139, -2.060358, 0, 0, 0, 1, 1,
-0.9030092, -0.02690318, 1.073964, 1, 1, 1, 1, 1,
-0.9011339, 2.040358, -0.5808021, 1, 1, 1, 1, 1,
-0.9007828, -0.2755831, -2.124555, 1, 1, 1, 1, 1,
-0.8989934, 0.1052676, -1.719711, 1, 1, 1, 1, 1,
-0.8976073, 0.3429473, -1.632058, 1, 1, 1, 1, 1,
-0.8970683, 0.1931683, -2.820664, 1, 1, 1, 1, 1,
-0.8907999, 1.54444, -0.983954, 1, 1, 1, 1, 1,
-0.8794264, -0.7485104, -1.974097, 1, 1, 1, 1, 1,
-0.8792653, 0.03155571, -0.5361665, 1, 1, 1, 1, 1,
-0.8658953, -0.4650843, -2.910104, 1, 1, 1, 1, 1,
-0.8573882, 0.8244701, -0.7085725, 1, 1, 1, 1, 1,
-0.8438511, -0.3545274, -2.841582, 1, 1, 1, 1, 1,
-0.842946, -0.07987403, -2.249291, 1, 1, 1, 1, 1,
-0.8376372, 0.2705887, -2.314775, 1, 1, 1, 1, 1,
-0.8374328, 0.3230339, -0.578877, 1, 1, 1, 1, 1,
-0.8327544, -0.7643919, -3.912749, 0, 0, 1, 1, 1,
-0.8321439, -0.6140152, -3.598808, 1, 0, 0, 1, 1,
-0.8220854, 0.299626, -5.511407, 1, 0, 0, 1, 1,
-0.8151871, -1.128662, -3.097342, 1, 0, 0, 1, 1,
-0.8033594, 1.270061, 0.02533283, 1, 0, 0, 1, 1,
-0.8030639, 1.100655, -0.3675112, 1, 0, 0, 1, 1,
-0.7972329, -0.2327174, -0.789345, 0, 0, 0, 1, 1,
-0.7953855, -0.2072633, -0.4930562, 0, 0, 0, 1, 1,
-0.7950302, -0.978969, -3.798451, 0, 0, 0, 1, 1,
-0.7947171, 0.03010529, -0.01717202, 0, 0, 0, 1, 1,
-0.7903315, -0.186516, -1.405256, 0, 0, 0, 1, 1,
-0.7863516, 1.292016, -1.995765, 0, 0, 0, 1, 1,
-0.7848826, -0.5257559, -1.981238, 0, 0, 0, 1, 1,
-0.7764173, -0.7893528, -2.804487, 1, 1, 1, 1, 1,
-0.7756724, 0.1748086, -3.750626, 1, 1, 1, 1, 1,
-0.7747405, -0.4499608, -1.316821, 1, 1, 1, 1, 1,
-0.7741526, 0.7415327, -0.6038546, 1, 1, 1, 1, 1,
-0.7729933, 0.438597, -0.8249308, 1, 1, 1, 1, 1,
-0.7720805, 0.8873894, -0.9088016, 1, 1, 1, 1, 1,
-0.7687607, 0.3992037, -1.467887, 1, 1, 1, 1, 1,
-0.764109, 0.03113352, 0.2307631, 1, 1, 1, 1, 1,
-0.7614515, 0.6091715, 0.1059667, 1, 1, 1, 1, 1,
-0.7551924, 0.04187231, -2.072988, 1, 1, 1, 1, 1,
-0.7501595, 1.085391, -2.092124, 1, 1, 1, 1, 1,
-0.7418889, 0.9740099, -0.9969095, 1, 1, 1, 1, 1,
-0.73992, 1.647457, -0.2186253, 1, 1, 1, 1, 1,
-0.7370741, 0.2838708, -0.4337934, 1, 1, 1, 1, 1,
-0.7356659, 0.591083, -1.352272, 1, 1, 1, 1, 1,
-0.7338764, 0.6978399, -0.6296274, 0, 0, 1, 1, 1,
-0.7334664, 0.8891938, -1.063396, 1, 0, 0, 1, 1,
-0.7330012, -1.919747, -3.363608, 1, 0, 0, 1, 1,
-0.731479, 0.2364297, -0.6131648, 1, 0, 0, 1, 1,
-0.728543, -0.4043368, -1.410624, 1, 0, 0, 1, 1,
-0.7229902, 0.6230099, -0.2675014, 1, 0, 0, 1, 1,
-0.7226817, 0.2773145, -1.145331, 0, 0, 0, 1, 1,
-0.7180315, 0.02714138, -2.655406, 0, 0, 0, 1, 1,
-0.7121509, -1.27494, -1.759643, 0, 0, 0, 1, 1,
-0.7116238, 0.149215, -0.04459868, 0, 0, 0, 1, 1,
-0.7100286, -1.64065, -1.433972, 0, 0, 0, 1, 1,
-0.6930263, 1.589601, -0.6922831, 0, 0, 0, 1, 1,
-0.683829, 0.6892341, -0.2832404, 0, 0, 0, 1, 1,
-0.6825752, -0.9731451, -2.550231, 1, 1, 1, 1, 1,
-0.6754283, 2.047707, -1.660503, 1, 1, 1, 1, 1,
-0.6712182, -0.2418222, -1.68721, 1, 1, 1, 1, 1,
-0.6698892, 1.077274, 0.2926874, 1, 1, 1, 1, 1,
-0.6658124, 0.6455361, -3.427262, 1, 1, 1, 1, 1,
-0.6599188, -0.5368057, -2.098454, 1, 1, 1, 1, 1,
-0.654457, -0.1554693, -2.392616, 1, 1, 1, 1, 1,
-0.6528153, 1.141978, 0.05026197, 1, 1, 1, 1, 1,
-0.6503416, -2.537686, -2.326353, 1, 1, 1, 1, 1,
-0.6487084, -2.060039, -2.240063, 1, 1, 1, 1, 1,
-0.6454607, -0.04620389, -2.665209, 1, 1, 1, 1, 1,
-0.6441222, -1.777451, -2.823662, 1, 1, 1, 1, 1,
-0.6360862, 1.291448, -0.7860299, 1, 1, 1, 1, 1,
-0.6339712, 1.637778, -0.8896823, 1, 1, 1, 1, 1,
-0.6298409, -0.4945792, -2.057268, 1, 1, 1, 1, 1,
-0.6250938, -0.452992, -2.537582, 0, 0, 1, 1, 1,
-0.6238309, 0.2331411, -0.7416924, 1, 0, 0, 1, 1,
-0.618461, -1.617187, -3.622161, 1, 0, 0, 1, 1,
-0.6128137, -0.1622491, -3.673006, 1, 0, 0, 1, 1,
-0.6122259, -0.6257633, -1.726513, 1, 0, 0, 1, 1,
-0.6101627, 1.287832, 0.02872415, 1, 0, 0, 1, 1,
-0.6087251, 0.7539018, -0.8094461, 0, 0, 0, 1, 1,
-0.6047049, -1.155086, -0.4597717, 0, 0, 0, 1, 1,
-0.6030954, -1.820034, -3.464825, 0, 0, 0, 1, 1,
-0.6027927, 0.4283031, -5.192915, 0, 0, 0, 1, 1,
-0.6021346, 0.3228424, -0.2675114, 0, 0, 0, 1, 1,
-0.6013542, 0.2579908, -1.432865, 0, 0, 0, 1, 1,
-0.5990559, 0.2340875, 0.214823, 0, 0, 0, 1, 1,
-0.5987519, -0.02937947, -1.358335, 1, 1, 1, 1, 1,
-0.5973216, -2.826832, -2.107235, 1, 1, 1, 1, 1,
-0.593393, 2.163523, 0.8300206, 1, 1, 1, 1, 1,
-0.5932345, 0.7773189, -1.164282, 1, 1, 1, 1, 1,
-0.5900466, -0.1416196, -2.537748, 1, 1, 1, 1, 1,
-0.587642, 0.14686, -1.492138, 1, 1, 1, 1, 1,
-0.5765225, 1.328108, -2.2309, 1, 1, 1, 1, 1,
-0.5738581, -0.4859887, -1.700167, 1, 1, 1, 1, 1,
-0.5728016, -0.09200992, -2.288282, 1, 1, 1, 1, 1,
-0.5707992, 0.1322901, 1.236321, 1, 1, 1, 1, 1,
-0.5603932, 1.095948, 0.9104161, 1, 1, 1, 1, 1,
-0.5561346, 0.00411399, -0.874318, 1, 1, 1, 1, 1,
-0.55451, -0.1059851, -1.701986, 1, 1, 1, 1, 1,
-0.5523154, 0.8406134, 0.8299962, 1, 1, 1, 1, 1,
-0.550232, -0.3643966, -1.282651, 1, 1, 1, 1, 1,
-0.5455056, 0.8431723, -1.325793, 0, 0, 1, 1, 1,
-0.5410595, 1.130892, -0.3137386, 1, 0, 0, 1, 1,
-0.5334464, 0.6717435, -0.3476373, 1, 0, 0, 1, 1,
-0.5321124, -0.2428572, -2.115919, 1, 0, 0, 1, 1,
-0.5285712, 0.06749746, -0.9785175, 1, 0, 0, 1, 1,
-0.5260361, 0.6850834, -2.01686, 1, 0, 0, 1, 1,
-0.5178243, 0.2722514, -1.565033, 0, 0, 0, 1, 1,
-0.5136064, 1.615646, -0.1054264, 0, 0, 0, 1, 1,
-0.5127407, -0.5090144, -3.286537, 0, 0, 0, 1, 1,
-0.5084119, 0.4495549, -1.714114, 0, 0, 0, 1, 1,
-0.5047686, 0.08616865, -0.264265, 0, 0, 0, 1, 1,
-0.5025131, 1.09139, 1.496675, 0, 0, 0, 1, 1,
-0.4997589, -0.6238433, -2.039518, 0, 0, 0, 1, 1,
-0.4962293, 0.6683329, -0.6027631, 1, 1, 1, 1, 1,
-0.4955377, 0.4925108, 0.002033992, 1, 1, 1, 1, 1,
-0.4891014, 0.6340059, -0.3316901, 1, 1, 1, 1, 1,
-0.4886208, 1.384297, -1.631876, 1, 1, 1, 1, 1,
-0.4870772, 1.036501, -1.083155, 1, 1, 1, 1, 1,
-0.4855427, -0.7477044, -1.769031, 1, 1, 1, 1, 1,
-0.4835694, 0.8275343, -2.117068, 1, 1, 1, 1, 1,
-0.4831823, 0.7793633, -0.9200248, 1, 1, 1, 1, 1,
-0.4807881, 0.04482353, -2.335742, 1, 1, 1, 1, 1,
-0.4788496, 0.9609421, -2.800809, 1, 1, 1, 1, 1,
-0.4764106, -0.8538273, -3.541051, 1, 1, 1, 1, 1,
-0.4714416, 1.146523, -1.349007, 1, 1, 1, 1, 1,
-0.4679317, 0.6234119, -0.03008085, 1, 1, 1, 1, 1,
-0.466934, -0.4817214, -1.559456, 1, 1, 1, 1, 1,
-0.4656622, -0.4240466, -2.925506, 1, 1, 1, 1, 1,
-0.4651172, 2.751812, 2.999764, 0, 0, 1, 1, 1,
-0.4627473, -0.9595026, -2.146382, 1, 0, 0, 1, 1,
-0.4609991, 0.1837637, -0.4481694, 1, 0, 0, 1, 1,
-0.4606982, 2.232007, -0.6992611, 1, 0, 0, 1, 1,
-0.4567116, 0.7816491, -1.257848, 1, 0, 0, 1, 1,
-0.4553367, 2.207144, 1.528386, 1, 0, 0, 1, 1,
-0.4430277, 1.383835, 1.299409, 0, 0, 0, 1, 1,
-0.4399025, 0.146357, -1.379197, 0, 0, 0, 1, 1,
-0.4390464, 1.995132, 0.8211515, 0, 0, 0, 1, 1,
-0.438359, -0.867532, -2.22405, 0, 0, 0, 1, 1,
-0.437705, -0.5868155, -4.409113, 0, 0, 0, 1, 1,
-0.4371378, 1.100392, -0.001466556, 0, 0, 0, 1, 1,
-0.4369286, 0.8437651, 1.354448, 0, 0, 0, 1, 1,
-0.43617, 1.830214, -0.9683052, 1, 1, 1, 1, 1,
-0.4315132, 0.2522681, -1.448934, 1, 1, 1, 1, 1,
-0.431079, -0.03484411, -1.124075, 1, 1, 1, 1, 1,
-0.4287457, 0.664884, 0.2511666, 1, 1, 1, 1, 1,
-0.4283779, 0.5114799, -0.3857493, 1, 1, 1, 1, 1,
-0.4224304, 1.08232, -0.4386067, 1, 1, 1, 1, 1,
-0.422214, -1.763204, -1.975667, 1, 1, 1, 1, 1,
-0.4168921, 0.06885785, -2.862169, 1, 1, 1, 1, 1,
-0.4144334, -1.58475, -4.513834, 1, 1, 1, 1, 1,
-0.4097076, -0.1758281, -2.4841, 1, 1, 1, 1, 1,
-0.4074465, -0.8792475, -2.67158, 1, 1, 1, 1, 1,
-0.4065692, -0.213139, -3.032065, 1, 1, 1, 1, 1,
-0.4046722, 0.8821523, 0.6484088, 1, 1, 1, 1, 1,
-0.4002548, -0.5992669, -2.904521, 1, 1, 1, 1, 1,
-0.3998549, 0.2452666, -0.9498859, 1, 1, 1, 1, 1,
-0.3994195, 0.6990752, -1.9471, 0, 0, 1, 1, 1,
-0.3949532, -1.265454, -3.546798, 1, 0, 0, 1, 1,
-0.3941182, -1.931333, -3.999116, 1, 0, 0, 1, 1,
-0.3929435, -0.7780086, -2.180575, 1, 0, 0, 1, 1,
-0.389558, -0.6054488, -1.907328, 1, 0, 0, 1, 1,
-0.3888738, 2.033695, 0.9619083, 1, 0, 0, 1, 1,
-0.3869566, 0.3037117, 1.033435, 0, 0, 0, 1, 1,
-0.3846042, 1.090232, -0.9632066, 0, 0, 0, 1, 1,
-0.3843382, -0.1337075, -4.161042, 0, 0, 0, 1, 1,
-0.3814352, 1.688886, -0.5246387, 0, 0, 0, 1, 1,
-0.378312, -1.947059, -2.2853, 0, 0, 0, 1, 1,
-0.3766423, 0.1998834, 0.7299761, 0, 0, 0, 1, 1,
-0.3695533, -1.355571, -2.077966, 0, 0, 0, 1, 1,
-0.364267, -0.2008449, -0.877717, 1, 1, 1, 1, 1,
-0.3637368, -1.042981, -2.734801, 1, 1, 1, 1, 1,
-0.3626412, -1.785623, -4.188349, 1, 1, 1, 1, 1,
-0.3609848, -1.167213, -3.784524, 1, 1, 1, 1, 1,
-0.3601911, 0.5950361, -0.2911687, 1, 1, 1, 1, 1,
-0.3596512, 1.651059, -1.112709, 1, 1, 1, 1, 1,
-0.3589548, 0.587685, -0.1160218, 1, 1, 1, 1, 1,
-0.357194, 1.192391, -1.382181, 1, 1, 1, 1, 1,
-0.3565143, -0.2089236, -3.191143, 1, 1, 1, 1, 1,
-0.3498565, 1.091977, -2.117116, 1, 1, 1, 1, 1,
-0.349787, -0.6789242, -3.410324, 1, 1, 1, 1, 1,
-0.3487616, 0.3647757, -0.1031857, 1, 1, 1, 1, 1,
-0.3481654, 0.7756222, -0.543052, 1, 1, 1, 1, 1,
-0.344116, 0.3311832, -2.094955, 1, 1, 1, 1, 1,
-0.3440415, -0.6165609, -1.831968, 1, 1, 1, 1, 1,
-0.343137, -0.9255664, -3.214676, 0, 0, 1, 1, 1,
-0.3416347, -1.013566, -3.482452, 1, 0, 0, 1, 1,
-0.3354739, 0.4236874, -1.376207, 1, 0, 0, 1, 1,
-0.3310125, 0.5245792, -1.159098, 1, 0, 0, 1, 1,
-0.3234865, -0.08171079, -1.627892, 1, 0, 0, 1, 1,
-0.3233945, 0.2412258, -0.829667, 1, 0, 0, 1, 1,
-0.3212666, 1.558363, -0.04213602, 0, 0, 0, 1, 1,
-0.3208556, -0.8689079, -3.123938, 0, 0, 0, 1, 1,
-0.3185557, 1.144334, -0.130572, 0, 0, 0, 1, 1,
-0.3172872, -0.7932348, -2.018057, 0, 0, 0, 1, 1,
-0.3122194, -0.1056899, -3.238326, 0, 0, 0, 1, 1,
-0.3107381, 0.754989, -0.2784543, 0, 0, 0, 1, 1,
-0.3062757, -0.988366, -4.121402, 0, 0, 0, 1, 1,
-0.3027883, -1.527663, -3.22031, 1, 1, 1, 1, 1,
-0.3015193, 0.7177495, 0.3189317, 1, 1, 1, 1, 1,
-0.3008288, 0.42217, -1.419153, 1, 1, 1, 1, 1,
-0.2969247, -0.1423501, -1.41564, 1, 1, 1, 1, 1,
-0.2955568, 0.5416867, -1.37119, 1, 1, 1, 1, 1,
-0.2950381, -0.05663171, -0.03563863, 1, 1, 1, 1, 1,
-0.2872854, -0.3403936, -1.294077, 1, 1, 1, 1, 1,
-0.2829934, -0.02139509, -0.2505926, 1, 1, 1, 1, 1,
-0.2787049, 0.1010927, -1.261753, 1, 1, 1, 1, 1,
-0.277384, -0.4215173, -2.218162, 1, 1, 1, 1, 1,
-0.276775, 1.078653, -0.459049, 1, 1, 1, 1, 1,
-0.2738439, -0.9051477, -2.985765, 1, 1, 1, 1, 1,
-0.2721258, -1.092979, -2.642895, 1, 1, 1, 1, 1,
-0.2709402, -0.270327, -3.45244, 1, 1, 1, 1, 1,
-0.2697783, -0.9014117, -2.708251, 1, 1, 1, 1, 1,
-0.26807, 0.6813378, -1.771395, 0, 0, 1, 1, 1,
-0.2676193, -1.251136, -1.513615, 1, 0, 0, 1, 1,
-0.2674386, 0.4697257, -0.9356365, 1, 0, 0, 1, 1,
-0.2631204, -1.483917, -3.020429, 1, 0, 0, 1, 1,
-0.262656, -0.3399381, -3.768087, 1, 0, 0, 1, 1,
-0.2588436, 1.529039, 0.7693036, 1, 0, 0, 1, 1,
-0.2586125, 0.4698733, -2.039648, 0, 0, 0, 1, 1,
-0.2570844, 1.57678, 0.3633871, 0, 0, 0, 1, 1,
-0.2564445, -0.6191877, -3.608819, 0, 0, 0, 1, 1,
-0.2545793, 0.9890221, 0.2659395, 0, 0, 0, 1, 1,
-0.2529506, -0.7538162, -3.894684, 0, 0, 0, 1, 1,
-0.248907, -0.2478335, -1.212004, 0, 0, 0, 1, 1,
-0.2481287, -0.5770707, -4.868732, 0, 0, 0, 1, 1,
-0.2453166, 1.022147, 0.7086772, 1, 1, 1, 1, 1,
-0.2347506, -0.3586416, -5.059537, 1, 1, 1, 1, 1,
-0.2343633, -0.6940167, -4.016811, 1, 1, 1, 1, 1,
-0.2293174, -0.5490209, -2.57707, 1, 1, 1, 1, 1,
-0.2285289, 0.5746439, -0.1252593, 1, 1, 1, 1, 1,
-0.2264905, -0.9607486, -3.705479, 1, 1, 1, 1, 1,
-0.2262563, -0.1924731, -2.652786, 1, 1, 1, 1, 1,
-0.2259139, -1.35743, -3.156605, 1, 1, 1, 1, 1,
-0.2233529, -0.1358487, -1.438978, 1, 1, 1, 1, 1,
-0.2215675, 0.05460249, -1.114122, 1, 1, 1, 1, 1,
-0.2211955, 0.7373618, 1.137492, 1, 1, 1, 1, 1,
-0.2197293, -0.5874841, -2.863453, 1, 1, 1, 1, 1,
-0.2129159, 0.701294, -1.172297, 1, 1, 1, 1, 1,
-0.2104189, 0.07509988, -1.328905, 1, 1, 1, 1, 1,
-0.2082325, -1.008049, -2.254617, 1, 1, 1, 1, 1,
-0.2037562, 1.751458, 0.1038416, 0, 0, 1, 1, 1,
-0.2023723, -0.1803143, -2.806528, 1, 0, 0, 1, 1,
-0.1977254, 1.622925, 0.92927, 1, 0, 0, 1, 1,
-0.1848358, -0.03973055, -3.249885, 1, 0, 0, 1, 1,
-0.1839039, -0.9430662, -4.0386, 1, 0, 0, 1, 1,
-0.1812106, -1.870298, -2.686463, 1, 0, 0, 1, 1,
-0.1796676, -0.9315162, -3.43268, 0, 0, 0, 1, 1,
-0.1638988, 1.015662, -0.2944576, 0, 0, 0, 1, 1,
-0.1638272, -1.298187, -4.019038, 0, 0, 0, 1, 1,
-0.1623134, 0.4673527, -2.277677, 0, 0, 0, 1, 1,
-0.1621283, 0.7883974, -1.985658, 0, 0, 0, 1, 1,
-0.1601786, -0.7027021, -3.566408, 0, 0, 0, 1, 1,
-0.160089, -1.126941, -2.584663, 0, 0, 0, 1, 1,
-0.1593567, -0.9087229, -1.760622, 1, 1, 1, 1, 1,
-0.156666, -0.6861401, -2.326226, 1, 1, 1, 1, 1,
-0.1533595, -0.9942726, -3.030753, 1, 1, 1, 1, 1,
-0.147359, 1.159163, 1.013553, 1, 1, 1, 1, 1,
-0.1467776, -0.5606103, -2.43989, 1, 1, 1, 1, 1,
-0.1409548, -0.1462967, -2.724543, 1, 1, 1, 1, 1,
-0.1396465, -1.458596, -2.733449, 1, 1, 1, 1, 1,
-0.1394832, -0.7088159, -2.895891, 1, 1, 1, 1, 1,
-0.1342504, -0.06325664, -2.129318, 1, 1, 1, 1, 1,
-0.133884, -0.4972698, -2.959345, 1, 1, 1, 1, 1,
-0.1335439, -0.8384282, -4.30903, 1, 1, 1, 1, 1,
-0.1321914, 0.3323951, -1.356975, 1, 1, 1, 1, 1,
-0.1319042, 1.316794, 0.01493908, 1, 1, 1, 1, 1,
-0.1316457, 0.7693697, -0.6371371, 1, 1, 1, 1, 1,
-0.1310149, 0.1257897, -2.925252, 1, 1, 1, 1, 1,
-0.1301131, 0.2684331, 0.3586982, 0, 0, 1, 1, 1,
-0.1295924, 1.676944, 0.2006008, 1, 0, 0, 1, 1,
-0.1261976, 0.3989296, -0.3002951, 1, 0, 0, 1, 1,
-0.1222426, 0.6945258, -1.319403, 1, 0, 0, 1, 1,
-0.1211926, 1.621049, 0.8383647, 1, 0, 0, 1, 1,
-0.1205332, 0.4009112, -0.2846444, 1, 0, 0, 1, 1,
-0.1203995, -1.555762, -1.870759, 0, 0, 0, 1, 1,
-0.1153762, 0.09690296, 0.1373868, 0, 0, 0, 1, 1,
-0.1116703, 1.018938, -1.812788, 0, 0, 0, 1, 1,
-0.1107853, -0.8015612, -3.565535, 0, 0, 0, 1, 1,
-0.1069744, -1.554408, -3.506356, 0, 0, 0, 1, 1,
-0.100573, -2.572059, -3.702434, 0, 0, 0, 1, 1,
-0.09930067, 0.1097415, 0.2873057, 0, 0, 0, 1, 1,
-0.09876259, 0.6186412, 2.119849, 1, 1, 1, 1, 1,
-0.09687382, 0.04626233, -1.36432, 1, 1, 1, 1, 1,
-0.09677352, 0.1150031, 0.8498468, 1, 1, 1, 1, 1,
-0.09554997, 0.1155008, -0.8383359, 1, 1, 1, 1, 1,
-0.0913545, -0.1649838, -3.124359, 1, 1, 1, 1, 1,
-0.09034198, -1.070528, -1.250385, 1, 1, 1, 1, 1,
-0.09027825, -1.709084, -3.517776, 1, 1, 1, 1, 1,
-0.08801727, -0.8599954, -5.471031, 1, 1, 1, 1, 1,
-0.08218508, 1.813125, 1.572173, 1, 1, 1, 1, 1,
-0.08039935, 0.3087389, -1.066675, 1, 1, 1, 1, 1,
-0.08010908, 1.225556, 0.3850097, 1, 1, 1, 1, 1,
-0.07726984, 0.6676824, -0.0724509, 1, 1, 1, 1, 1,
-0.07534161, -0.4300762, -4.192412, 1, 1, 1, 1, 1,
-0.07489562, 0.9407728, -0.2697036, 1, 1, 1, 1, 1,
-0.07486545, 0.4162167, -1.861409, 1, 1, 1, 1, 1,
-0.07391757, 0.410648, -0.8598607, 0, 0, 1, 1, 1,
-0.06694885, 0.1064052, -0.2011567, 1, 0, 0, 1, 1,
-0.0664128, 0.8703697, -1.236173, 1, 0, 0, 1, 1,
-0.06187926, -1.103965, -2.969109, 1, 0, 0, 1, 1,
-0.06143958, 0.3000028, -1.350414, 1, 0, 0, 1, 1,
-0.06119765, 0.6826856, 0.7938535, 1, 0, 0, 1, 1,
-0.04900283, -0.7605711, -3.729921, 0, 0, 0, 1, 1,
-0.04324027, -1.179215, -3.054756, 0, 0, 0, 1, 1,
-0.04218049, 1.349645, -0.3109894, 0, 0, 0, 1, 1,
-0.0412917, 0.2409977, -0.4448436, 0, 0, 0, 1, 1,
-0.03966619, 0.1963883, -0.02816906, 0, 0, 0, 1, 1,
-0.03830985, -0.8154582, -2.047386, 0, 0, 0, 1, 1,
-0.03757155, 0.8840449, 0.7400927, 0, 0, 0, 1, 1,
-0.03505038, 1.211244, -0.3724477, 1, 1, 1, 1, 1,
-0.03122956, -0.3067465, -2.693032, 1, 1, 1, 1, 1,
-0.02821813, -2.084683, -2.601907, 1, 1, 1, 1, 1,
-0.02708691, -0.6705185, -3.84554, 1, 1, 1, 1, 1,
-0.02378813, -1.671414, -3.777615, 1, 1, 1, 1, 1,
-0.02082697, -2.871955, -4.09787, 1, 1, 1, 1, 1,
-0.01864496, 0.1291926, -0.05977574, 1, 1, 1, 1, 1,
-0.01565639, -1.161674, -2.573782, 1, 1, 1, 1, 1,
-0.01505496, 0.8964095, 1.19032, 1, 1, 1, 1, 1,
-0.01268457, 1.362246, 0.8442448, 1, 1, 1, 1, 1,
-0.007298313, -1.4364, -2.733046, 1, 1, 1, 1, 1,
-0.007220259, 2.702472, 1.738584, 1, 1, 1, 1, 1,
-0.001593229, -1.755764, -4.640574, 1, 1, 1, 1, 1,
0.00118669, -0.8804545, 2.712179, 1, 1, 1, 1, 1,
0.001876907, 2.073854, -1.11283, 1, 1, 1, 1, 1,
0.004209243, -0.7738346, 2.474101, 0, 0, 1, 1, 1,
0.008187756, -0.9393581, 2.746853, 1, 0, 0, 1, 1,
0.008493752, 0.2899775, -1.107795, 1, 0, 0, 1, 1,
0.009266392, -1.287703, 2.719532, 1, 0, 0, 1, 1,
0.01042005, 0.9012883, -1.038208, 1, 0, 0, 1, 1,
0.01255449, -0.009554396, 3.516352, 1, 0, 0, 1, 1,
0.01292358, -1.315169, 4.690247, 0, 0, 0, 1, 1,
0.01312421, -0.8857535, 4.118427, 0, 0, 0, 1, 1,
0.01325073, -0.3705267, 2.348276, 0, 0, 0, 1, 1,
0.01661823, -0.1784039, 1.512709, 0, 0, 0, 1, 1,
0.01680825, 0.1936108, -1.261251, 0, 0, 0, 1, 1,
0.01767544, 0.8604559, -0.4290271, 0, 0, 0, 1, 1,
0.03401954, -0.8102316, 3.510792, 0, 0, 0, 1, 1,
0.03467976, -0.3599874, 2.806469, 1, 1, 1, 1, 1,
0.03473652, 1.736697, -0.2994791, 1, 1, 1, 1, 1,
0.03487191, -0.3082261, 4.851902, 1, 1, 1, 1, 1,
0.03886962, -0.4833717, 2.35459, 1, 1, 1, 1, 1,
0.04176122, 0.2441718, 1.523458, 1, 1, 1, 1, 1,
0.0420272, 1.004003, -1.350531, 1, 1, 1, 1, 1,
0.04546106, -0.1939618, 3.116799, 1, 1, 1, 1, 1,
0.04608718, -0.1232336, 1.510121, 1, 1, 1, 1, 1,
0.04679811, 0.4577979, 0.5754125, 1, 1, 1, 1, 1,
0.04906048, -1.29439, 3.160914, 1, 1, 1, 1, 1,
0.04925815, -0.7073785, 4.090861, 1, 1, 1, 1, 1,
0.05066804, -0.02358435, -0.127952, 1, 1, 1, 1, 1,
0.05595064, -1.19903, 2.363076, 1, 1, 1, 1, 1,
0.05902655, -0.2803902, 3.101755, 1, 1, 1, 1, 1,
0.06025017, 0.4206264, 1.166333, 1, 1, 1, 1, 1,
0.06313674, -0.6029849, 3.088559, 0, 0, 1, 1, 1,
0.06702246, -0.03952575, 2.438432, 1, 0, 0, 1, 1,
0.06841359, 0.3372489, -0.825096, 1, 0, 0, 1, 1,
0.07068516, 0.7515087, 0.6691764, 1, 0, 0, 1, 1,
0.07238875, 0.6223727, 1.263041, 1, 0, 0, 1, 1,
0.0758616, 1.852237, -0.4252113, 1, 0, 0, 1, 1,
0.07662735, 0.2286102, 1.317871, 0, 0, 0, 1, 1,
0.07899027, 1.461598, 0.7428361, 0, 0, 0, 1, 1,
0.08463848, 0.1733343, -0.2957309, 0, 0, 0, 1, 1,
0.08523237, 1.267517, -0.2309605, 0, 0, 0, 1, 1,
0.08653323, 1.25095, 0.5418463, 0, 0, 0, 1, 1,
0.08698393, -0.3382708, 1.86761, 0, 0, 0, 1, 1,
0.08709434, 1.822939, -0.5757024, 0, 0, 0, 1, 1,
0.09069282, 0.5409599, 0.2245407, 1, 1, 1, 1, 1,
0.09107161, -0.7022856, 3.573265, 1, 1, 1, 1, 1,
0.09210093, 1.20487, 0.03451248, 1, 1, 1, 1, 1,
0.09502569, 1.396714, -1.308201, 1, 1, 1, 1, 1,
0.1041521, 0.3829811, -1.687283, 1, 1, 1, 1, 1,
0.1043014, -0.8086382, 1.910937, 1, 1, 1, 1, 1,
0.1050149, -0.1288437, 1.88243, 1, 1, 1, 1, 1,
0.1053793, 0.5076491, -0.9578584, 1, 1, 1, 1, 1,
0.1057151, 0.956698, -1.017935, 1, 1, 1, 1, 1,
0.1077748, -0.5686917, 3.609923, 1, 1, 1, 1, 1,
0.1111177, -0.7749932, 3.491086, 1, 1, 1, 1, 1,
0.1155407, 1.399139, 0.9441395, 1, 1, 1, 1, 1,
0.1195579, 1.112018, 0.8088586, 1, 1, 1, 1, 1,
0.1205256, -1.528047, 2.505153, 1, 1, 1, 1, 1,
0.1245463, 0.9743705, -1.177307, 1, 1, 1, 1, 1,
0.1255539, 0.004582298, 2.177111, 0, 0, 1, 1, 1,
0.12898, -1.033882, 2.447165, 1, 0, 0, 1, 1,
0.1323532, 0.572624, 0.7127497, 1, 0, 0, 1, 1,
0.136915, -0.4613147, 2.80264, 1, 0, 0, 1, 1,
0.1477783, 1.773275, 0.08014865, 1, 0, 0, 1, 1,
0.1543037, -0.2528833, 1.789279, 1, 0, 0, 1, 1,
0.1543377, 1.534105, 0.5260982, 0, 0, 0, 1, 1,
0.1593249, 0.6925589, -0.4733374, 0, 0, 0, 1, 1,
0.1615183, -0.8466104, 3.344853, 0, 0, 0, 1, 1,
0.1637409, -0.4077355, 2.613965, 0, 0, 0, 1, 1,
0.1647023, -2.380945, 1.810652, 0, 0, 0, 1, 1,
0.1794159, 0.9758934, 0.8619737, 0, 0, 0, 1, 1,
0.1811781, -0.3003959, 2.562006, 0, 0, 0, 1, 1,
0.1845515, 0.4266334, -0.1410693, 1, 1, 1, 1, 1,
0.1856902, 0.4639319, 0.6404496, 1, 1, 1, 1, 1,
0.1935066, -1.257561, 3.976096, 1, 1, 1, 1, 1,
0.1945746, -0.8661326, 1.848138, 1, 1, 1, 1, 1,
0.1996746, 0.1848365, 0.2963533, 1, 1, 1, 1, 1,
0.2040567, 0.7168065, -0.7748908, 1, 1, 1, 1, 1,
0.2048063, 2.16882, 1.253856, 1, 1, 1, 1, 1,
0.2076059, -0.7017614, 3.125304, 1, 1, 1, 1, 1,
0.2099089, 0.5248784, 1.331012, 1, 1, 1, 1, 1,
0.2103649, 0.09853802, 1.792229, 1, 1, 1, 1, 1,
0.2104872, 0.7416765, 0.4121989, 1, 1, 1, 1, 1,
0.2189121, -0.3285978, 1.438871, 1, 1, 1, 1, 1,
0.2191893, 2.164983, -0.1273802, 1, 1, 1, 1, 1,
0.2195384, 0.4241776, 2.826493, 1, 1, 1, 1, 1,
0.2245659, 0.4987271, 0.3694758, 1, 1, 1, 1, 1,
0.2272688, -1.762561, 1.929106, 0, 0, 1, 1, 1,
0.2289357, -2.438886, 2.379009, 1, 0, 0, 1, 1,
0.2311656, 0.2708662, 1.565697, 1, 0, 0, 1, 1,
0.2338075, -0.4511519, 3.051843, 1, 0, 0, 1, 1,
0.2364775, 0.3389243, 1.168003, 1, 0, 0, 1, 1,
0.2381985, 0.2781357, 1.919217, 1, 0, 0, 1, 1,
0.2386373, 0.36241, 0.6327466, 0, 0, 0, 1, 1,
0.241096, 1.237489, -0.1116323, 0, 0, 0, 1, 1,
0.2429285, 0.4543969, -1.585864, 0, 0, 0, 1, 1,
0.2451705, -0.9261619, 3.600359, 0, 0, 0, 1, 1,
0.2471022, 1.854544, 1.342553, 0, 0, 0, 1, 1,
0.2499862, 0.5690562, 3.402777, 0, 0, 0, 1, 1,
0.251423, -0.7634735, 2.549038, 0, 0, 0, 1, 1,
0.2539879, 0.229584, 0.476167, 1, 1, 1, 1, 1,
0.2552269, -0.082768, 1.537216, 1, 1, 1, 1, 1,
0.2559756, 0.7913818, -1.80392, 1, 1, 1, 1, 1,
0.25934, 1.836699, -0.1675172, 1, 1, 1, 1, 1,
0.2640224, -0.8845389, 3.971394, 1, 1, 1, 1, 1,
0.2640408, -1.949185, 3.592997, 1, 1, 1, 1, 1,
0.267591, -2.379792, 1.611055, 1, 1, 1, 1, 1,
0.2692452, 2.317263, 0.2231679, 1, 1, 1, 1, 1,
0.2696384, -0.2527842, 2.574321, 1, 1, 1, 1, 1,
0.2696705, -0.6965503, 1.558211, 1, 1, 1, 1, 1,
0.2708868, 0.06765036, 3.045086, 1, 1, 1, 1, 1,
0.2708897, 0.08448777, 0.6521678, 1, 1, 1, 1, 1,
0.2756572, 0.9071122, 0.8810231, 1, 1, 1, 1, 1,
0.2842405, 0.2064992, 0.7771651, 1, 1, 1, 1, 1,
0.2884867, -0.1808755, 1.656464, 1, 1, 1, 1, 1,
0.2920088, 0.8790966, 2.823628, 0, 0, 1, 1, 1,
0.2957156, 0.1524216, -0.2821505, 1, 0, 0, 1, 1,
0.2980188, 0.6179104, 0.08260176, 1, 0, 0, 1, 1,
0.305487, -0.4805077, 2.9741, 1, 0, 0, 1, 1,
0.3074422, 0.517226, 2.467593, 1, 0, 0, 1, 1,
0.308652, -0.6006154, 1.519233, 1, 0, 0, 1, 1,
0.3100912, -0.90018, 3.258857, 0, 0, 0, 1, 1,
0.3101818, 0.3658527, -0.8326905, 0, 0, 0, 1, 1,
0.3125848, -1.075742, 5.722485, 0, 0, 0, 1, 1,
0.3137187, 1.533455, 0.5706041, 0, 0, 0, 1, 1,
0.3161208, -0.6834268, 1.776719, 0, 0, 0, 1, 1,
0.3173718, -0.2948227, 2.338303, 0, 0, 0, 1, 1,
0.3181595, -0.4294174, 2.037119, 0, 0, 0, 1, 1,
0.3216692, -0.5234921, 2.097111, 1, 1, 1, 1, 1,
0.3285886, -1.883635, 3.441536, 1, 1, 1, 1, 1,
0.3294263, -0.03281462, 1.559391, 1, 1, 1, 1, 1,
0.3356223, -0.2224193, 1.915549, 1, 1, 1, 1, 1,
0.3390374, -0.4790938, 1.171761, 1, 1, 1, 1, 1,
0.340985, -1.202965, 2.713518, 1, 1, 1, 1, 1,
0.3421014, 0.1745631, 1.714275, 1, 1, 1, 1, 1,
0.3429784, -0.1197527, 2.693456, 1, 1, 1, 1, 1,
0.3445351, 0.04703898, 2.105502, 1, 1, 1, 1, 1,
0.3450252, -1.794554, 4.396097, 1, 1, 1, 1, 1,
0.3466035, 0.1626904, 0.1284436, 1, 1, 1, 1, 1,
0.3473619, -0.3564655, 2.924125, 1, 1, 1, 1, 1,
0.3478488, 1.141076, 0.38342, 1, 1, 1, 1, 1,
0.3492929, 0.4255735, 1.539243, 1, 1, 1, 1, 1,
0.3494124, -0.2530315, 1.389418, 1, 1, 1, 1, 1,
0.3508193, -0.3544908, 3.201163, 0, 0, 1, 1, 1,
0.3509183, 0.8796982, 1.440061, 1, 0, 0, 1, 1,
0.3604258, 1.506975, 2.073993, 1, 0, 0, 1, 1,
0.3623357, 0.05975544, 0.2458889, 1, 0, 0, 1, 1,
0.3625593, 0.6982192, 1.13663, 1, 0, 0, 1, 1,
0.366478, 0.6977131, 1.501288, 1, 0, 0, 1, 1,
0.3696199, 1.982666, 0.363263, 0, 0, 0, 1, 1,
0.3698647, 0.2978578, 1.593806, 0, 0, 0, 1, 1,
0.372495, -0.6636071, 2.210633, 0, 0, 0, 1, 1,
0.3725519, -0.1086325, 4.097901, 0, 0, 0, 1, 1,
0.3733754, -0.8934609, 2.634795, 0, 0, 0, 1, 1,
0.3784093, -0.7825758, 2.569272, 0, 0, 0, 1, 1,
0.3807403, -0.4009759, 4.367783, 0, 0, 0, 1, 1,
0.3821148, 0.1725658, 0.1973373, 1, 1, 1, 1, 1,
0.3834376, -1.942877, 2.851749, 1, 1, 1, 1, 1,
0.3861005, -0.2179025, 2.200192, 1, 1, 1, 1, 1,
0.3896444, 0.4824663, 0.4154022, 1, 1, 1, 1, 1,
0.3901978, -0.4169943, 0.5186294, 1, 1, 1, 1, 1,
0.3929082, 0.4316442, 1.144354, 1, 1, 1, 1, 1,
0.3939216, 1.403702, -0.3925786, 1, 1, 1, 1, 1,
0.3941046, -0.8177318, 3.532092, 1, 1, 1, 1, 1,
0.3976485, -1.530174, 1.804698, 1, 1, 1, 1, 1,
0.3996368, 0.4377164, 0.7827175, 1, 1, 1, 1, 1,
0.4027478, -0.158924, 0.9335559, 1, 1, 1, 1, 1,
0.404398, -0.9115593, 3.050972, 1, 1, 1, 1, 1,
0.406035, -1.208257, 1.408027, 1, 1, 1, 1, 1,
0.407287, 2.145272, -0.3895482, 1, 1, 1, 1, 1,
0.4078156, -0.3946094, 3.153045, 1, 1, 1, 1, 1,
0.4086213, 0.2463145, 1.391862, 0, 0, 1, 1, 1,
0.4148408, 1.527038, 1.28097, 1, 0, 0, 1, 1,
0.4170761, -2.436027, 1.682627, 1, 0, 0, 1, 1,
0.4190009, -0.7415684, 3.257834, 1, 0, 0, 1, 1,
0.4192103, 0.09343422, -0.9547366, 1, 0, 0, 1, 1,
0.4198346, 2.605336, -1.098367, 1, 0, 0, 1, 1,
0.4278641, -1.841355, 2.826537, 0, 0, 0, 1, 1,
0.4313512, -0.518533, 3.286636, 0, 0, 0, 1, 1,
0.4322302, -0.4593608, 1.58115, 0, 0, 0, 1, 1,
0.4358857, 0.05611098, 1.87306, 0, 0, 0, 1, 1,
0.450301, 0.3944094, 0.395236, 0, 0, 0, 1, 1,
0.4555466, 0.8904634, -0.5378309, 0, 0, 0, 1, 1,
0.4565837, -0.009304109, 4.209394, 0, 0, 0, 1, 1,
0.459773, 1.14174, 1.101883, 1, 1, 1, 1, 1,
0.4641725, 1.00991, -0.585405, 1, 1, 1, 1, 1,
0.4650095, -0.3353215, 2.719683, 1, 1, 1, 1, 1,
0.4685944, -0.6997375, 2.471586, 1, 1, 1, 1, 1,
0.4733019, 0.3506738, 1.006024, 1, 1, 1, 1, 1,
0.4781548, 0.3858389, 1.468565, 1, 1, 1, 1, 1,
0.4844572, -0.6329935, 3.882243, 1, 1, 1, 1, 1,
0.4877718, 1.174302, 1.286203, 1, 1, 1, 1, 1,
0.4879242, 0.0863936, 0.9832405, 1, 1, 1, 1, 1,
0.4885094, 1.27296, -0.4532965, 1, 1, 1, 1, 1,
0.4889653, -0.2572611, 0.2059888, 1, 1, 1, 1, 1,
0.4890951, -0.01135754, 1.090631, 1, 1, 1, 1, 1,
0.4914462, -0.9248082, 2.821096, 1, 1, 1, 1, 1,
0.4968459, 1.466232, 0.6320595, 1, 1, 1, 1, 1,
0.5002427, 0.7612153, 0.6760098, 1, 1, 1, 1, 1,
0.5002491, -0.5924279, 3.160956, 0, 0, 1, 1, 1,
0.5006375, -1.5266, 1.534236, 1, 0, 0, 1, 1,
0.500813, -1.025148, 2.442322, 1, 0, 0, 1, 1,
0.5022525, -0.4260712, 3.150649, 1, 0, 0, 1, 1,
0.5057375, 1.319596, 0.5140529, 1, 0, 0, 1, 1,
0.5092393, -0.1832894, 1.074467, 1, 0, 0, 1, 1,
0.5094509, -0.6250508, 1.999695, 0, 0, 0, 1, 1,
0.5107948, 0.7031648, -0.1032415, 0, 0, 0, 1, 1,
0.5111225, 0.3587315, 1.591579, 0, 0, 0, 1, 1,
0.5166442, -1.162766, 2.880861, 0, 0, 0, 1, 1,
0.5180216, -0.9626623, 0.9911256, 0, 0, 0, 1, 1,
0.5290185, -1.077277, 2.796911, 0, 0, 0, 1, 1,
0.5299202, 1.786898, 1.503838, 0, 0, 0, 1, 1,
0.5307008, -1.145151, 1.848586, 1, 1, 1, 1, 1,
0.5342575, 1.534175, 0.05216863, 1, 1, 1, 1, 1,
0.5403083, -0.3589039, 3.045098, 1, 1, 1, 1, 1,
0.5430659, 0.8955368, -1.230689, 1, 1, 1, 1, 1,
0.5456369, 0.4748537, 0.6361846, 1, 1, 1, 1, 1,
0.5459806, 0.6315359, 0.07476599, 1, 1, 1, 1, 1,
0.5504752, -1.111737, 2.908996, 1, 1, 1, 1, 1,
0.5531173, 2.094359, 0.04980576, 1, 1, 1, 1, 1,
0.5563299, -1.289388, 2.685693, 1, 1, 1, 1, 1,
0.5612643, -0.7027948, 0.5425755, 1, 1, 1, 1, 1,
0.5656, -0.2676491, 2.155395, 1, 1, 1, 1, 1,
0.568692, 0.1694019, 1.526514, 1, 1, 1, 1, 1,
0.5690429, 0.03221124, 1.853, 1, 1, 1, 1, 1,
0.5691415, -0.4051188, 3.752847, 1, 1, 1, 1, 1,
0.5726861, 1.501436, 1.098639, 1, 1, 1, 1, 1,
0.5755537, 1.132008, -0.4144913, 0, 0, 1, 1, 1,
0.5771901, -2.002833, 2.960407, 1, 0, 0, 1, 1,
0.5835028, 1.074635, -0.9502888, 1, 0, 0, 1, 1,
0.5849467, 0.4823356, 0.8951079, 1, 0, 0, 1, 1,
0.5866451, -0.2963605, 1.519681, 1, 0, 0, 1, 1,
0.5892457, 0.09475491, 0.5489652, 1, 0, 0, 1, 1,
0.6013799, 1.473719, 1.350344, 0, 0, 0, 1, 1,
0.6067193, -0.8896071, 3.701221, 0, 0, 0, 1, 1,
0.6105857, 0.4103797, 1.586151, 0, 0, 0, 1, 1,
0.6108982, -0.3603414, 2.328509, 0, 0, 0, 1, 1,
0.6124012, -0.1412919, 2.635292, 0, 0, 0, 1, 1,
0.6140004, -0.7420413, 3.641092, 0, 0, 0, 1, 1,
0.6169214, 1.40012, -0.2148443, 0, 0, 0, 1, 1,
0.6175848, 0.3740584, 3.009365, 1, 1, 1, 1, 1,
0.6202741, -2.15089, 3.781784, 1, 1, 1, 1, 1,
0.6296513, -0.4203565, 1.097248, 1, 1, 1, 1, 1,
0.6303494, -0.2798792, 1.309798, 1, 1, 1, 1, 1,
0.6343842, 1.228848, -0.5733595, 1, 1, 1, 1, 1,
0.6369698, 1.381602, 0.397969, 1, 1, 1, 1, 1,
0.6388302, 0.2554291, 1.701665, 1, 1, 1, 1, 1,
0.6398714, -0.6782315, 0.8838478, 1, 1, 1, 1, 1,
0.640256, -1.105356, 1.190103, 1, 1, 1, 1, 1,
0.6426066, 0.6788564, -0.2723478, 1, 1, 1, 1, 1,
0.6426827, 0.1274253, 1.586483, 1, 1, 1, 1, 1,
0.6477095, -1.05606, 2.26028, 1, 1, 1, 1, 1,
0.6498719, -0.1371141, 1.872072, 1, 1, 1, 1, 1,
0.6560861, 0.7921107, 2.70895, 1, 1, 1, 1, 1,
0.6707006, 1.263136, 1.6211, 1, 1, 1, 1, 1,
0.6746305, 0.3965357, -0.2164226, 0, 0, 1, 1, 1,
0.6763324, 1.154106, -0.9037068, 1, 0, 0, 1, 1,
0.6865053, -0.3044059, 2.172475, 1, 0, 0, 1, 1,
0.6865844, 1.107832, -0.3400759, 1, 0, 0, 1, 1,
0.6918049, 0.554907, 1.393865, 1, 0, 0, 1, 1,
0.6918262, -0.5973751, 3.254496, 1, 0, 0, 1, 1,
0.6933749, -0.4691203, 2.769541, 0, 0, 0, 1, 1,
0.6941525, -0.3369017, 1.303335, 0, 0, 0, 1, 1,
0.6944584, 0.5281291, 0.7563515, 0, 0, 0, 1, 1,
0.6995749, -2.180397, 3.607744, 0, 0, 0, 1, 1,
0.7143868, 0.8490521, -0.7103139, 0, 0, 0, 1, 1,
0.7168864, 1.190038, 2.671354, 0, 0, 0, 1, 1,
0.7169312, -0.1625569, 1.628678, 0, 0, 0, 1, 1,
0.7172693, -0.2022424, 0.3148535, 1, 1, 1, 1, 1,
0.7188777, 1.496808, -0.3444985, 1, 1, 1, 1, 1,
0.723833, 0.8713978, 1.661926, 1, 1, 1, 1, 1,
0.737695, -0.07352994, 2.177896, 1, 1, 1, 1, 1,
0.7377468, 1.186618, 0.6029354, 1, 1, 1, 1, 1,
0.7380749, 1.465837, -0.3537754, 1, 1, 1, 1, 1,
0.7386858, -0.1515281, 2.714249, 1, 1, 1, 1, 1,
0.7418548, -0.2680679, 2.366742, 1, 1, 1, 1, 1,
0.7532189, -0.2832118, 0.257396, 1, 1, 1, 1, 1,
0.7560691, -0.2037311, 2.653873, 1, 1, 1, 1, 1,
0.7679232, -1.191199, 2.914019, 1, 1, 1, 1, 1,
0.7704229, 0.5034878, -1.084534, 1, 1, 1, 1, 1,
0.7756018, -1.215182, 2.873337, 1, 1, 1, 1, 1,
0.7870529, -0.8051665, 1.9102, 1, 1, 1, 1, 1,
0.7892243, -1.183578, 1.795457, 1, 1, 1, 1, 1,
0.7930552, -1.069668, 2.935848, 0, 0, 1, 1, 1,
0.7956778, -0.9118943, 1.853489, 1, 0, 0, 1, 1,
0.7986163, -1.614134, 1.364454, 1, 0, 0, 1, 1,
0.8015768, 0.5418066, 0.4905349, 1, 0, 0, 1, 1,
0.801603, 0.3137192, -0.5082271, 1, 0, 0, 1, 1,
0.8052455, -0.584171, 2.773229, 1, 0, 0, 1, 1,
0.8064347, 0.08147407, 1.60458, 0, 0, 0, 1, 1,
0.8072556, 0.8743716, 0.9693711, 0, 0, 0, 1, 1,
0.8082577, -0.2077406, 1.581983, 0, 0, 0, 1, 1,
0.8125688, -0.6803793, 1.75293, 0, 0, 0, 1, 1,
0.8145767, 0.4948401, -0.9325014, 0, 0, 0, 1, 1,
0.818835, -0.0845921, 2.281072, 0, 0, 0, 1, 1,
0.8199965, 0.2967423, 0.7444547, 0, 0, 0, 1, 1,
0.8231946, 1.771467, 1.400393, 1, 1, 1, 1, 1,
0.8358833, -1.72802, 3.222092, 1, 1, 1, 1, 1,
0.8359262, 1.07445, 1.054388, 1, 1, 1, 1, 1,
0.8383292, 0.825631, 0.4925699, 1, 1, 1, 1, 1,
0.8432292, -0.6238366, 3.523568, 1, 1, 1, 1, 1,
0.8486971, 0.5945594, -0.1271182, 1, 1, 1, 1, 1,
0.8499175, -0.1567791, 3.08615, 1, 1, 1, 1, 1,
0.8617372, 1.432621, -1.140208, 1, 1, 1, 1, 1,
0.86519, 0.9994443, -0.3788821, 1, 1, 1, 1, 1,
0.8715212, -0.06004751, 1.204348, 1, 1, 1, 1, 1,
0.8723688, -0.7149953, 2.051454, 1, 1, 1, 1, 1,
0.874136, 0.006593096, 1.681479, 1, 1, 1, 1, 1,
0.8905391, 0.7242039, 1.039598, 1, 1, 1, 1, 1,
0.8949186, 0.2570003, 0.8600787, 1, 1, 1, 1, 1,
0.9040334, 0.221403, 1.832304, 1, 1, 1, 1, 1,
0.9052162, 1.119405, 2.528577, 0, 0, 1, 1, 1,
0.907672, 1.569524, -0.2725374, 1, 0, 0, 1, 1,
0.9103466, -1.525729, 0.8364275, 1, 0, 0, 1, 1,
0.9153777, -0.7944978, 1.785639, 1, 0, 0, 1, 1,
0.9176659, 0.08493807, 1.640566, 1, 0, 0, 1, 1,
0.9210042, 1.219554, 1.862046, 1, 0, 0, 1, 1,
0.9244838, -0.4804743, 2.394756, 0, 0, 0, 1, 1,
0.9266778, 1.096458, 0.6502663, 0, 0, 0, 1, 1,
0.9273533, -0.9293404, 2.949565, 0, 0, 0, 1, 1,
0.9278472, 0.6758395, 0.8149686, 0, 0, 0, 1, 1,
0.9287863, -1.74507, 1.353876, 0, 0, 0, 1, 1,
0.9298151, -1.8652, 1.901753, 0, 0, 0, 1, 1,
0.9376115, 1.370944, 0.07658602, 0, 0, 0, 1, 1,
0.9387534, 1.441306, 1.308576, 1, 1, 1, 1, 1,
0.941456, -1.574428, 1.12716, 1, 1, 1, 1, 1,
0.9436627, 1.154371, 1.654608, 1, 1, 1, 1, 1,
0.9521838, 0.2254098, 2.272536, 1, 1, 1, 1, 1,
0.960676, 0.1303133, 1.276408, 1, 1, 1, 1, 1,
0.9608112, -0.03015808, 2.333636, 1, 1, 1, 1, 1,
0.9705675, 0.6343488, 1.054607, 1, 1, 1, 1, 1,
0.9769679, -0.4862018, 2.704856, 1, 1, 1, 1, 1,
0.9817367, -1.765866, 2.947056, 1, 1, 1, 1, 1,
0.9884983, -0.8991475, 2.452927, 1, 1, 1, 1, 1,
0.9905133, -0.4240082, 3.085772, 1, 1, 1, 1, 1,
0.9924069, 1.601071, 1.405043, 1, 1, 1, 1, 1,
0.9932944, 0.6343988, 2.416008, 1, 1, 1, 1, 1,
0.9956851, -0.5541273, 4.180615, 1, 1, 1, 1, 1,
0.999448, 3.093764, -0.7929527, 1, 1, 1, 1, 1,
1.000776, 0.001558775, 2.655263, 0, 0, 1, 1, 1,
1.004831, 1.22647, -0.2670446, 1, 0, 0, 1, 1,
1.007058, -0.9503948, 0.45878, 1, 0, 0, 1, 1,
1.011996, -2.259091, 2.245056, 1, 0, 0, 1, 1,
1.014462, -0.01283459, 1.78512, 1, 0, 0, 1, 1,
1.018742, 1.367113, 0.6144162, 1, 0, 0, 1, 1,
1.028332, -0.3742303, 0.9239097, 0, 0, 0, 1, 1,
1.028677, 0.4127511, 0.6207478, 0, 0, 0, 1, 1,
1.035872, 0.8026563, 2.823698, 0, 0, 0, 1, 1,
1.036914, -0.5112025, 0.5707642, 0, 0, 0, 1, 1,
1.037311, -0.2124519, 0.1633552, 0, 0, 0, 1, 1,
1.03812, 0.7658989, -0.4106095, 0, 0, 0, 1, 1,
1.041692, -0.521751, 2.117103, 0, 0, 0, 1, 1,
1.042792, 0.08244649, 2.099545, 1, 1, 1, 1, 1,
1.050721, 1.484931, 1.362073, 1, 1, 1, 1, 1,
1.057601, -0.7898225, 2.684358, 1, 1, 1, 1, 1,
1.058565, 0.2031906, -0.6827939, 1, 1, 1, 1, 1,
1.06544, 0.2025764, 1.669459, 1, 1, 1, 1, 1,
1.066913, 0.1272633, 1.565634, 1, 1, 1, 1, 1,
1.077896, -0.3372742, 1.862319, 1, 1, 1, 1, 1,
1.080929, 0.438818, 0.1845483, 1, 1, 1, 1, 1,
1.081014, -0.883332, 1.607487, 1, 1, 1, 1, 1,
1.083642, -0.3254019, 1.997195, 1, 1, 1, 1, 1,
1.087263, -0.7278115, 1.056031, 1, 1, 1, 1, 1,
1.093195, -0.00333594, 0.7093934, 1, 1, 1, 1, 1,
1.094381, -1.957115, 4.355648, 1, 1, 1, 1, 1,
1.097214, 0.8907045, 1.169169, 1, 1, 1, 1, 1,
1.100046, 0.2097328, 0.2114081, 1, 1, 1, 1, 1,
1.112344, -0.9750059, 2.220194, 0, 0, 1, 1, 1,
1.115523, -0.1868922, -0.2567858, 1, 0, 0, 1, 1,
1.12088, 0.146403, 1.151162, 1, 0, 0, 1, 1,
1.125003, 0.04133294, 2.591477, 1, 0, 0, 1, 1,
1.132336, 2.283413, -1.899259, 1, 0, 0, 1, 1,
1.149973, 1.501517, 2.358883, 1, 0, 0, 1, 1,
1.153189, 1.080324, 1.185901, 0, 0, 0, 1, 1,
1.163562, -1.304719, 2.901121, 0, 0, 0, 1, 1,
1.164594, 2.131561, 1.739522, 0, 0, 0, 1, 1,
1.164685, 0.208076, 1.277063, 0, 0, 0, 1, 1,
1.165579, 0.3926696, 1.421037, 0, 0, 0, 1, 1,
1.16693, -1.375331, 3.352276, 0, 0, 0, 1, 1,
1.167619, 0.4495538, 0.4388463, 0, 0, 0, 1, 1,
1.170753, -0.3563572, 1.157344, 1, 1, 1, 1, 1,
1.175394, 1.13134, -0.2725237, 1, 1, 1, 1, 1,
1.18549, 0.7087487, 1.409186, 1, 1, 1, 1, 1,
1.185573, -0.3744937, 1.582927, 1, 1, 1, 1, 1,
1.20301, -0.9088011, 3.095887, 1, 1, 1, 1, 1,
1.210629, 1.422788, 0.1473217, 1, 1, 1, 1, 1,
1.212784, -0.1400499, 2.086785, 1, 1, 1, 1, 1,
1.216384, -0.7605355, 2.038652, 1, 1, 1, 1, 1,
1.234192, 1.998814, 1.042127, 1, 1, 1, 1, 1,
1.237294, 2.269049, 0.2933204, 1, 1, 1, 1, 1,
1.242778, 2.615538, -0.297926, 1, 1, 1, 1, 1,
1.253498, 1.169743, 1.210788, 1, 1, 1, 1, 1,
1.257356, -0.5168075, 1.025348, 1, 1, 1, 1, 1,
1.260833, -0.1906059, 0.8111271, 1, 1, 1, 1, 1,
1.265706, 1.524336, 1.499634, 1, 1, 1, 1, 1,
1.266201, 1.155601, 2.039928, 0, 0, 1, 1, 1,
1.266293, -0.0944146, 1.463904, 1, 0, 0, 1, 1,
1.270657, -1.444094, 2.076971, 1, 0, 0, 1, 1,
1.273606, -0.8255814, 2.946192, 1, 0, 0, 1, 1,
1.275948, 0.4666123, 2.246524, 1, 0, 0, 1, 1,
1.276559, -0.6449955, 1.655244, 1, 0, 0, 1, 1,
1.276592, -0.02316879, 1.918219, 0, 0, 0, 1, 1,
1.280177, 0.630994, 1.354932, 0, 0, 0, 1, 1,
1.288838, 0.09790002, 0.7516536, 0, 0, 0, 1, 1,
1.288989, -0.7601255, 3.981792, 0, 0, 0, 1, 1,
1.292028, 0.8270662, 1.077016, 0, 0, 0, 1, 1,
1.305467, -0.2393056, 3.266124, 0, 0, 0, 1, 1,
1.306539, -0.5744632, 2.614833, 0, 0, 0, 1, 1,
1.307988, 1.927248, -0.4661231, 1, 1, 1, 1, 1,
1.326477, 0.08555356, 2.506208, 1, 1, 1, 1, 1,
1.329474, 0.7336397, 1.918703, 1, 1, 1, 1, 1,
1.33336, -0.8793226, 2.982553, 1, 1, 1, 1, 1,
1.334692, -0.2279468, 2.184349, 1, 1, 1, 1, 1,
1.337479, 0.4242424, 2.405342, 1, 1, 1, 1, 1,
1.337763, 0.7946151, 0.997754, 1, 1, 1, 1, 1,
1.339568, -0.8333385, 0.7612646, 1, 1, 1, 1, 1,
1.348734, -1.385032, 2.994064, 1, 1, 1, 1, 1,
1.35867, -1.404648, 2.213262, 1, 1, 1, 1, 1,
1.362009, 3.664263, -0.2424434, 1, 1, 1, 1, 1,
1.364255, 0.4282166, 1.526171, 1, 1, 1, 1, 1,
1.364721, 0.8713272, 1.482862, 1, 1, 1, 1, 1,
1.385261, 1.068522, 1.626103, 1, 1, 1, 1, 1,
1.385916, -0.7343462, 1.482359, 1, 1, 1, 1, 1,
1.401665, -0.3998079, 1.810581, 0, 0, 1, 1, 1,
1.407359, 1.39458, 0.9110214, 1, 0, 0, 1, 1,
1.409885, 0.2660913, 0.9191417, 1, 0, 0, 1, 1,
1.410568, -1.294472, 1.785084, 1, 0, 0, 1, 1,
1.412374, -0.0396103, 2.762682, 1, 0, 0, 1, 1,
1.438709, 0.5897754, -0.08782364, 1, 0, 0, 1, 1,
1.446082, -0.8210651, -0.9108146, 0, 0, 0, 1, 1,
1.453848, 2.097477, 1.585755, 0, 0, 0, 1, 1,
1.457742, 0.2733414, 1.886019, 0, 0, 0, 1, 1,
1.459083, 0.6042999, 2.521949, 0, 0, 0, 1, 1,
1.459946, -0.5788007, 2.372531, 0, 0, 0, 1, 1,
1.465127, -0.4199222, 1.092927, 0, 0, 0, 1, 1,
1.500571, -1.379362, 2.378875, 0, 0, 0, 1, 1,
1.502064, 0.269133, 0.6240302, 1, 1, 1, 1, 1,
1.507629, 0.09678277, 1.166977, 1, 1, 1, 1, 1,
1.509391, -0.1645887, 0.3917162, 1, 1, 1, 1, 1,
1.514992, -0.1156168, -0.02965138, 1, 1, 1, 1, 1,
1.51608, -1.455367, 1.919999, 1, 1, 1, 1, 1,
1.523251, 0.3433801, 0.7419291, 1, 1, 1, 1, 1,
1.533273, -0.4796804, 3.687942, 1, 1, 1, 1, 1,
1.533873, 1.553346, 1.175919, 1, 1, 1, 1, 1,
1.565961, 0.2568481, 0.7829479, 1, 1, 1, 1, 1,
1.569755, 1.403765, -0.7243029, 1, 1, 1, 1, 1,
1.572175, 0.03885025, 2.728971, 1, 1, 1, 1, 1,
1.572959, -1.291441, 1.010368, 1, 1, 1, 1, 1,
1.588818, -0.08029556, 1.438576, 1, 1, 1, 1, 1,
1.591575, 0.4701098, 0.6568353, 1, 1, 1, 1, 1,
1.593452, -1.456495, 1.993566, 1, 1, 1, 1, 1,
1.600319, 0.3373119, 0.9859197, 0, 0, 1, 1, 1,
1.638588, -1.301069, 0.5950341, 1, 0, 0, 1, 1,
1.639455, 0.4147147, 0.0788771, 1, 0, 0, 1, 1,
1.644926, -2.801674, 1.2586, 1, 0, 0, 1, 1,
1.653919, -1.230508, 0.6918383, 1, 0, 0, 1, 1,
1.659706, 0.5270075, -0.8289867, 1, 0, 0, 1, 1,
1.671123, -0.6883106, 1.711927, 0, 0, 0, 1, 1,
1.686401, 1.337924, 2.12924, 0, 0, 0, 1, 1,
1.69797, -1.010438, 2.583397, 0, 0, 0, 1, 1,
1.708158, -0.3400906, 2.863281, 0, 0, 0, 1, 1,
1.723657, 0.2577738, 1.504789, 0, 0, 0, 1, 1,
1.764657, -0.5249214, 1.372982, 0, 0, 0, 1, 1,
1.77116, 0.07317422, 2.717742, 0, 0, 0, 1, 1,
1.835844, -0.7608663, 3.699288, 1, 1, 1, 1, 1,
1.841095, 1.39903, 1.181259, 1, 1, 1, 1, 1,
1.871049, 0.3545698, 2.559079, 1, 1, 1, 1, 1,
1.886848, 0.01391967, 0.9886302, 1, 1, 1, 1, 1,
1.900785, -0.4571449, 1.509794, 1, 1, 1, 1, 1,
1.905441, 0.8755666, 1.46765, 1, 1, 1, 1, 1,
1.91124, 0.7616937, 0.4770284, 1, 1, 1, 1, 1,
1.917659, -0.2188496, 3.417948, 1, 1, 1, 1, 1,
1.952791, -0.1343043, 1.268064, 1, 1, 1, 1, 1,
1.981303, -0.9326466, 2.927335, 1, 1, 1, 1, 1,
1.983421, 0.4261566, 2.128614, 1, 1, 1, 1, 1,
2.022237, 1.55403, 0.9229569, 1, 1, 1, 1, 1,
2.035659, 0.2926239, 2.336297, 1, 1, 1, 1, 1,
2.043253, 0.4357722, 1.900627, 1, 1, 1, 1, 1,
2.069427, 1.942435, 0.7005298, 1, 1, 1, 1, 1,
2.076289, 0.5928919, 1.783165, 0, 0, 1, 1, 1,
2.082326, 0.3206775, 1.826963, 1, 0, 0, 1, 1,
2.092287, -0.5351164, 1.276956, 1, 0, 0, 1, 1,
2.09638, 1.768601, 1.799774, 1, 0, 0, 1, 1,
2.121345, 1.247001, 0.4991585, 1, 0, 0, 1, 1,
2.147355, 1.30901, 0.6963101, 1, 0, 0, 1, 1,
2.155915, 1.26502, 0.6966102, 0, 0, 0, 1, 1,
2.161831, -0.3457726, 2.535144, 0, 0, 0, 1, 1,
2.208208, -1.005564, 1.53623, 0, 0, 0, 1, 1,
2.218228, 0.1366625, 1.29608, 0, 0, 0, 1, 1,
2.321904, 0.4054452, 3.473685, 0, 0, 0, 1, 1,
2.345834, -0.7746406, 1.224198, 0, 0, 0, 1, 1,
2.366428, -0.8292714, 1.201383, 0, 0, 0, 1, 1,
2.466817, -0.8586847, 0.6183582, 1, 1, 1, 1, 1,
2.467495, -0.8728, 1.689786, 1, 1, 1, 1, 1,
2.481044, -0.0602298, 0.3955494, 1, 1, 1, 1, 1,
2.595118, 0.1643987, 0.3664538, 1, 1, 1, 1, 1,
2.617583, 0.6124184, 2.627964, 1, 1, 1, 1, 1,
2.697747, -1.453797, 2.276516, 1, 1, 1, 1, 1,
2.883571, -1.247504, 1.49817, 1, 1, 1, 1, 1
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
var radius = 9.712197;
var distance = 34.11368;
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
mvMatrix.translate( 0.0900023, -0.376752, -0.1055391 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.11368);
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
