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
-3.604104, -1.652474, -1.014584, 1, 0, 0, 1,
-3.558163, -0.7132199, -1.514414, 1, 0.007843138, 0, 1,
-3.515576, 1.325424, -2.899109, 1, 0.01176471, 0, 1,
-3.214965, -0.5870166, -5.656928, 1, 0.01960784, 0, 1,
-2.921047, 1.213435, -0.3157836, 1, 0.02352941, 0, 1,
-2.851911, 0.4397555, -1.294549, 1, 0.03137255, 0, 1,
-2.845317, 1.25481, -1.212791, 1, 0.03529412, 0, 1,
-2.784243, 0.8233058, -0.4786346, 1, 0.04313726, 0, 1,
-2.606268, 0.09009682, -2.521436, 1, 0.04705882, 0, 1,
-2.360866, 0.7359812, -1.962752, 1, 0.05490196, 0, 1,
-2.349272, 0.3742088, 0.1540946, 1, 0.05882353, 0, 1,
-2.341097, -0.1212414, -1.750972, 1, 0.06666667, 0, 1,
-2.336628, 0.5420724, -1.805961, 1, 0.07058824, 0, 1,
-2.308883, -0.614662, -3.673857, 1, 0.07843138, 0, 1,
-2.27175, 0.9915647, -1.703798, 1, 0.08235294, 0, 1,
-2.263865, 1.501732, -2.289675, 1, 0.09019608, 0, 1,
-2.257745, -1.230861, -2.934541, 1, 0.09411765, 0, 1,
-2.223746, 0.3749644, 0.8292191, 1, 0.1019608, 0, 1,
-2.169716, 1.393031, -0.7328932, 1, 0.1098039, 0, 1,
-2.163838, 0.1560794, -1.978477, 1, 0.1137255, 0, 1,
-2.142202, 0.889124, -0.7754922, 1, 0.1215686, 0, 1,
-2.104417, 1.568354, -0.4150744, 1, 0.1254902, 0, 1,
-2.102445, 0.7448202, -0.5840609, 1, 0.1333333, 0, 1,
-2.102228, 0.205314, -0.5791476, 1, 0.1372549, 0, 1,
-2.060743, -0.5349628, -1.161747, 1, 0.145098, 0, 1,
-2.054632, 0.3344693, -1.862352, 1, 0.1490196, 0, 1,
-2.026478, 1.290622, -2.254573, 1, 0.1568628, 0, 1,
-2.017195, -0.4391821, -1.975115, 1, 0.1607843, 0, 1,
-2.000404, 0.9346976, 0.4531465, 1, 0.1686275, 0, 1,
-1.999793, 1.017675, -1.857814, 1, 0.172549, 0, 1,
-1.972994, 0.8801091, 0.6460496, 1, 0.1803922, 0, 1,
-1.927903, 0.05542714, -1.774286, 1, 0.1843137, 0, 1,
-1.926027, -1.214693, -1.60996, 1, 0.1921569, 0, 1,
-1.920215, 0.5121558, -1.805641, 1, 0.1960784, 0, 1,
-1.912786, 0.5767171, -1.781328, 1, 0.2039216, 0, 1,
-1.87611, -1.213191, -2.487957, 1, 0.2117647, 0, 1,
-1.862216, 2.264646, -0.9429798, 1, 0.2156863, 0, 1,
-1.844997, -1.704917, -1.170561, 1, 0.2235294, 0, 1,
-1.816895, 1.36523, 0.9016873, 1, 0.227451, 0, 1,
-1.803338, -1.128146, -0.6427529, 1, 0.2352941, 0, 1,
-1.797398, 0.4332567, -4.850578, 1, 0.2392157, 0, 1,
-1.785173, -0.1111798, -1.182701, 1, 0.2470588, 0, 1,
-1.781639, -0.1300754, 0.5724465, 1, 0.2509804, 0, 1,
-1.738271, 1.084128, -1.323108, 1, 0.2588235, 0, 1,
-1.728252, -1.496096, -2.833081, 1, 0.2627451, 0, 1,
-1.707115, 0.6527287, -2.846493, 1, 0.2705882, 0, 1,
-1.688866, 0.01635338, -1.562982, 1, 0.2745098, 0, 1,
-1.68759, 1.608228, 0.864945, 1, 0.282353, 0, 1,
-1.681352, 1.374322, -0.9482208, 1, 0.2862745, 0, 1,
-1.675499, -0.3214684, -0.1149372, 1, 0.2941177, 0, 1,
-1.672192, -0.1311602, -2.349075, 1, 0.3019608, 0, 1,
-1.664331, 1.756877, -0.09171233, 1, 0.3058824, 0, 1,
-1.658205, 0.3559738, -2.54752, 1, 0.3137255, 0, 1,
-1.646918, -1.243397, -1.479575, 1, 0.3176471, 0, 1,
-1.635325, 0.1044849, -1.676387, 1, 0.3254902, 0, 1,
-1.62456, 0.4068108, -0.9442773, 1, 0.3294118, 0, 1,
-1.623486, 1.690249, -1.015927, 1, 0.3372549, 0, 1,
-1.621561, 0.1565164, -2.434406, 1, 0.3411765, 0, 1,
-1.620408, 0.1908899, 0.6594443, 1, 0.3490196, 0, 1,
-1.600194, -0.1693511, -1.72434, 1, 0.3529412, 0, 1,
-1.59358, 0.7789364, -2.711974, 1, 0.3607843, 0, 1,
-1.575562, -1.723144, -3.537295, 1, 0.3647059, 0, 1,
-1.5751, -0.5679397, -1.632533, 1, 0.372549, 0, 1,
-1.564839, -0.5137424, -2.467493, 1, 0.3764706, 0, 1,
-1.552009, 0.1006137, -2.004502, 1, 0.3843137, 0, 1,
-1.550504, 0.6335835, -0.8944622, 1, 0.3882353, 0, 1,
-1.531958, -1.105212, -4.121015, 1, 0.3960784, 0, 1,
-1.525144, 0.7429517, -0.9169726, 1, 0.4039216, 0, 1,
-1.515164, -0.8089542, -1.548478, 1, 0.4078431, 0, 1,
-1.503341, 0.3278764, -1.525199, 1, 0.4156863, 0, 1,
-1.502375, 0.1819487, -2.346351, 1, 0.4196078, 0, 1,
-1.494776, 0.2104192, -0.5364977, 1, 0.427451, 0, 1,
-1.491911, 0.3100361, -1.25186, 1, 0.4313726, 0, 1,
-1.490072, -1.114247, -1.926876, 1, 0.4392157, 0, 1,
-1.480315, -0.6173497, -0.8017266, 1, 0.4431373, 0, 1,
-1.475293, 0.6012229, -3.368566, 1, 0.4509804, 0, 1,
-1.474185, 0.09142841, -1.564966, 1, 0.454902, 0, 1,
-1.436081, -0.8772272, -0.3208428, 1, 0.4627451, 0, 1,
-1.410158, -1.062698, -1.541745, 1, 0.4666667, 0, 1,
-1.403934, -1.257319, -4.124576, 1, 0.4745098, 0, 1,
-1.398253, -0.8587004, -0.9511833, 1, 0.4784314, 0, 1,
-1.395818, -1.180737, -2.133549, 1, 0.4862745, 0, 1,
-1.393632, 0.8307825, -1.553196, 1, 0.4901961, 0, 1,
-1.392517, -0.1872691, -3.299117, 1, 0.4980392, 0, 1,
-1.391976, 0.291911, -2.585489, 1, 0.5058824, 0, 1,
-1.386379, 1.766361, -0.3385883, 1, 0.509804, 0, 1,
-1.385429, -0.03143027, -0.9523396, 1, 0.5176471, 0, 1,
-1.377293, 0.803167, -0.2590219, 1, 0.5215687, 0, 1,
-1.375852, -0.2055798, -4.163112, 1, 0.5294118, 0, 1,
-1.375333, -1.283235, -0.8967968, 1, 0.5333334, 0, 1,
-1.375008, -0.09947036, -1.301991, 1, 0.5411765, 0, 1,
-1.364171, -0.6213762, -2.811227, 1, 0.5450981, 0, 1,
-1.354653, -1.459824, -1.883968, 1, 0.5529412, 0, 1,
-1.350759, 0.484775, -3.540751, 1, 0.5568628, 0, 1,
-1.350473, 1.429943, -2.01035, 1, 0.5647059, 0, 1,
-1.342047, 0.4866415, 0.1612103, 1, 0.5686275, 0, 1,
-1.339537, -0.993952, -2.166213, 1, 0.5764706, 0, 1,
-1.336621, -0.3216852, -1.574592, 1, 0.5803922, 0, 1,
-1.324299, 1.779167, 0.2518991, 1, 0.5882353, 0, 1,
-1.317079, -0.8217576, -1.016933, 1, 0.5921569, 0, 1,
-1.310007, -0.8125035, -3.356031, 1, 0.6, 0, 1,
-1.29867, 0.6190093, 0.2936768, 1, 0.6078432, 0, 1,
-1.298532, 1.673236, -0.1153172, 1, 0.6117647, 0, 1,
-1.297379, -0.6861972, -3.329388, 1, 0.6196079, 0, 1,
-1.281902, 0.01439255, -0.4308572, 1, 0.6235294, 0, 1,
-1.281414, -0.5769756, -2.535201, 1, 0.6313726, 0, 1,
-1.281159, 0.631629, 0.1104981, 1, 0.6352941, 0, 1,
-1.27521, 0.9777317, -1.034399, 1, 0.6431373, 0, 1,
-1.272449, -0.4550646, -2.950225, 1, 0.6470588, 0, 1,
-1.272312, 2.612268, -1.823089, 1, 0.654902, 0, 1,
-1.269849, 1.133803, -1.184852, 1, 0.6588235, 0, 1,
-1.260042, 0.3708803, -1.148886, 1, 0.6666667, 0, 1,
-1.25025, 0.579627, -1.344314, 1, 0.6705883, 0, 1,
-1.248646, 0.106573, -1.86929, 1, 0.6784314, 0, 1,
-1.248592, -0.0261347, -1.018849, 1, 0.682353, 0, 1,
-1.235464, -0.06753009, -1.467458, 1, 0.6901961, 0, 1,
-1.223108, -1.295195, -3.91632, 1, 0.6941177, 0, 1,
-1.22256, -0.8209735, -1.960453, 1, 0.7019608, 0, 1,
-1.220679, 0.370775, -1.651388, 1, 0.7098039, 0, 1,
-1.218908, 1.476155, 0.6459028, 1, 0.7137255, 0, 1,
-1.218719, 0.8768691, -3.359394, 1, 0.7215686, 0, 1,
-1.218369, -0.2117421, -1.209772, 1, 0.7254902, 0, 1,
-1.214898, 0.6604959, 0.177869, 1, 0.7333333, 0, 1,
-1.212361, 1.453116, 0.4015948, 1, 0.7372549, 0, 1,
-1.206151, 0.696007, 1.37848, 1, 0.7450981, 0, 1,
-1.201224, 0.002953043, -1.858514, 1, 0.7490196, 0, 1,
-1.200612, 1.000582, -1.254201, 1, 0.7568628, 0, 1,
-1.199667, -0.1528754, -2.301334, 1, 0.7607843, 0, 1,
-1.188445, -0.8648963, -0.05875171, 1, 0.7686275, 0, 1,
-1.186476, 1.879156, 0.6158025, 1, 0.772549, 0, 1,
-1.178931, -0.6825129, -0.9713697, 1, 0.7803922, 0, 1,
-1.172796, -0.5499333, -3.763552, 1, 0.7843137, 0, 1,
-1.166593, 0.9106199, -0.7613908, 1, 0.7921569, 0, 1,
-1.165888, 0.6639355, -1.995986, 1, 0.7960784, 0, 1,
-1.159036, 0.3962254, -0.8959951, 1, 0.8039216, 0, 1,
-1.156962, 0.296442, -0.5046509, 1, 0.8117647, 0, 1,
-1.142137, 0.1701578, -0.7030782, 1, 0.8156863, 0, 1,
-1.141504, 1.265291, 1.089828, 1, 0.8235294, 0, 1,
-1.132197, 0.1952417, -0.6095428, 1, 0.827451, 0, 1,
-1.120821, -2.118679, -1.213752, 1, 0.8352941, 0, 1,
-1.117064, -0.240116, -2.503314, 1, 0.8392157, 0, 1,
-1.112895, -0.5164157, -1.580283, 1, 0.8470588, 0, 1,
-1.108614, -0.3594555, -3.674708, 1, 0.8509804, 0, 1,
-1.106938, 0.1779878, 0.05885601, 1, 0.8588235, 0, 1,
-1.104636, -0.6819385, -3.942223, 1, 0.8627451, 0, 1,
-1.104629, 0.2809445, -1.231377, 1, 0.8705882, 0, 1,
-1.089856, 1.620099, -0.5545412, 1, 0.8745098, 0, 1,
-1.088207, 0.5820913, 0.5538953, 1, 0.8823529, 0, 1,
-1.082748, -1.083649, -3.709777, 1, 0.8862745, 0, 1,
-1.079562, 1.725398, -0.1128077, 1, 0.8941177, 0, 1,
-1.078405, 1.864645, -2.39289, 1, 0.8980392, 0, 1,
-1.076988, 1.72198, -0.427629, 1, 0.9058824, 0, 1,
-1.075877, 0.4317227, -2.18551, 1, 0.9137255, 0, 1,
-1.068599, 2.494308, -0.9932275, 1, 0.9176471, 0, 1,
-1.065261, -0.07499098, 0.03317434, 1, 0.9254902, 0, 1,
-1.062344, 2.193989, -1.325253, 1, 0.9294118, 0, 1,
-1.061949, -0.522759, -1.66805, 1, 0.9372549, 0, 1,
-1.061901, -0.7806566, -1.640235, 1, 0.9411765, 0, 1,
-1.061388, 1.625765, -0.3335753, 1, 0.9490196, 0, 1,
-1.057691, -0.6009312, -0.5894591, 1, 0.9529412, 0, 1,
-1.055056, -0.4440693, -0.8249519, 1, 0.9607843, 0, 1,
-1.051323, -1.829147, -3.363043, 1, 0.9647059, 0, 1,
-1.040503, 0.9846855, 0.5864715, 1, 0.972549, 0, 1,
-1.032468, -1.208156, -2.901182, 1, 0.9764706, 0, 1,
-1.031002, 0.5728022, -1.803921, 1, 0.9843137, 0, 1,
-1.026778, 0.406997, -1.706319, 1, 0.9882353, 0, 1,
-1.011763, 0.9231843, -1.704507, 1, 0.9960784, 0, 1,
-1.009957, -0.161823, -0.8566179, 0.9960784, 1, 0, 1,
-1.007665, -0.005924025, -2.227415, 0.9921569, 1, 0, 1,
-1.006161, -1.065681, -1.337005, 0.9843137, 1, 0, 1,
-0.9998529, -0.4423129, 0.153675, 0.9803922, 1, 0, 1,
-0.9980575, -1.247399, -3.299397, 0.972549, 1, 0, 1,
-0.9963275, 0.9315622, -2.252419, 0.9686275, 1, 0, 1,
-0.9941121, 0.8194251, -0.4546885, 0.9607843, 1, 0, 1,
-0.9916917, 0.5969105, -1.327378, 0.9568627, 1, 0, 1,
-0.98859, 1.558111, 0.5498986, 0.9490196, 1, 0, 1,
-0.9831975, 0.275882, -1.844602, 0.945098, 1, 0, 1,
-0.9740664, 1.711701, -1.277805, 0.9372549, 1, 0, 1,
-0.9703761, 0.3666753, -2.514652, 0.9333333, 1, 0, 1,
-0.9520476, 0.0760074, -1.390795, 0.9254902, 1, 0, 1,
-0.9439494, -1.219979, -2.707185, 0.9215686, 1, 0, 1,
-0.9360989, 0.3817167, -2.027058, 0.9137255, 1, 0, 1,
-0.9350936, -0.5220701, -2.120607, 0.9098039, 1, 0, 1,
-0.9317527, -0.847216, -2.048219, 0.9019608, 1, 0, 1,
-0.9263799, -0.1066519, -3.624761, 0.8941177, 1, 0, 1,
-0.9254413, -0.2007699, -1.679567, 0.8901961, 1, 0, 1,
-0.923025, 0.2870103, -1.775099, 0.8823529, 1, 0, 1,
-0.9126037, -1.355214, -2.539975, 0.8784314, 1, 0, 1,
-0.9125459, 0.2729019, -1.31489, 0.8705882, 1, 0, 1,
-0.9097887, -0.002722979, -3.345422, 0.8666667, 1, 0, 1,
-0.9043474, 0.6501265, -1.225509, 0.8588235, 1, 0, 1,
-0.9006196, 0.3964063, -0.3742105, 0.854902, 1, 0, 1,
-0.8961721, -0.6788336, -1.629288, 0.8470588, 1, 0, 1,
-0.8940075, 0.1703651, -1.596421, 0.8431373, 1, 0, 1,
-0.8861735, 0.1925948, -0.3840286, 0.8352941, 1, 0, 1,
-0.881064, 1.410007, 0.6545717, 0.8313726, 1, 0, 1,
-0.8799663, 1.596861, -0.2659856, 0.8235294, 1, 0, 1,
-0.8787869, 0.975936, -0.2129678, 0.8196079, 1, 0, 1,
-0.8759286, -0.1059862, -2.213818, 0.8117647, 1, 0, 1,
-0.872161, 0.05234962, -1.019555, 0.8078431, 1, 0, 1,
-0.8708715, 0.4499737, -2.048513, 0.8, 1, 0, 1,
-0.8639117, -0.8637025, -2.993365, 0.7921569, 1, 0, 1,
-0.8630025, -1.150904, -1.660124, 0.7882353, 1, 0, 1,
-0.8615351, -0.6296774, -1.60176, 0.7803922, 1, 0, 1,
-0.8580427, -0.3278098, -2.467893, 0.7764706, 1, 0, 1,
-0.8553444, -0.5175978, -2.588081, 0.7686275, 1, 0, 1,
-0.8536917, -0.2957261, -1.579575, 0.7647059, 1, 0, 1,
-0.8476411, -0.1362504, -1.647719, 0.7568628, 1, 0, 1,
-0.8464066, -0.09201105, -1.639205, 0.7529412, 1, 0, 1,
-0.8438211, 1.260798, -0.4721257, 0.7450981, 1, 0, 1,
-0.8390367, 0.1502166, 0.4847315, 0.7411765, 1, 0, 1,
-0.8380509, 0.4093666, -0.8269221, 0.7333333, 1, 0, 1,
-0.8350582, -1.366398, -3.17456, 0.7294118, 1, 0, 1,
-0.831273, 1.05338, -0.6202207, 0.7215686, 1, 0, 1,
-0.8308392, -0.60843, -1.581185, 0.7176471, 1, 0, 1,
-0.8285303, -0.6592956, -2.588449, 0.7098039, 1, 0, 1,
-0.8252249, 0.2696657, -1.910077, 0.7058824, 1, 0, 1,
-0.8241139, -1.8952, -3.415769, 0.6980392, 1, 0, 1,
-0.8154408, 1.262074, -1.925782, 0.6901961, 1, 0, 1,
-0.8153449, 0.006507128, -1.404795, 0.6862745, 1, 0, 1,
-0.8139861, -2.247359, -3.640841, 0.6784314, 1, 0, 1,
-0.8139598, 1.441974, -1.390919, 0.6745098, 1, 0, 1,
-0.8112956, 1.715033, -1.352589, 0.6666667, 1, 0, 1,
-0.806375, 0.6799433, 1.253332, 0.6627451, 1, 0, 1,
-0.8057961, -1.076185, -1.550397, 0.654902, 1, 0, 1,
-0.8013813, -0.130934, -1.791312, 0.6509804, 1, 0, 1,
-0.7993593, 1.100994, -0.6501418, 0.6431373, 1, 0, 1,
-0.7930157, -0.2347115, -3.243285, 0.6392157, 1, 0, 1,
-0.7893813, -0.6219311, -3.152516, 0.6313726, 1, 0, 1,
-0.7891591, 1.179724, 0.3622271, 0.627451, 1, 0, 1,
-0.7796665, -0.5659259, -1.618959, 0.6196079, 1, 0, 1,
-0.7789817, -0.587263, -2.129158, 0.6156863, 1, 0, 1,
-0.7784881, -0.5038818, -3.822392, 0.6078432, 1, 0, 1,
-0.7617186, -0.1423372, -1.383667, 0.6039216, 1, 0, 1,
-0.7595061, 2.374721, 0.5588972, 0.5960785, 1, 0, 1,
-0.7562921, 0.1076251, 0.4504083, 0.5882353, 1, 0, 1,
-0.755608, -0.9589747, -2.679447, 0.5843138, 1, 0, 1,
-0.7462912, 0.07234333, -0.808804, 0.5764706, 1, 0, 1,
-0.7456955, -0.6757418, -3.575044, 0.572549, 1, 0, 1,
-0.7456101, 0.2730318, -1.874755, 0.5647059, 1, 0, 1,
-0.7432401, 0.7259057, -0.04831174, 0.5607843, 1, 0, 1,
-0.7381787, -0.07360342, 0.1945849, 0.5529412, 1, 0, 1,
-0.7260444, -0.1218018, -2.371499, 0.5490196, 1, 0, 1,
-0.7244119, 0.3629642, -0.7823787, 0.5411765, 1, 0, 1,
-0.7213953, -0.8661551, -3.794836, 0.5372549, 1, 0, 1,
-0.7187907, -1.574763, -3.001663, 0.5294118, 1, 0, 1,
-0.7146351, -0.3549336, -2.785077, 0.5254902, 1, 0, 1,
-0.7120754, 0.7937858, 2.021051, 0.5176471, 1, 0, 1,
-0.7107145, 1.455802, -0.09383837, 0.5137255, 1, 0, 1,
-0.7095775, 0.01062107, -2.950881, 0.5058824, 1, 0, 1,
-0.7085823, -0.8115063, -3.973079, 0.5019608, 1, 0, 1,
-0.7047266, -1.804083, -2.361829, 0.4941176, 1, 0, 1,
-0.7025755, 1.01578, -1.657754, 0.4862745, 1, 0, 1,
-0.7020125, -1.999225, -2.494885, 0.4823529, 1, 0, 1,
-0.6967185, 0.02536455, -1.495779, 0.4745098, 1, 0, 1,
-0.6956603, -0.901724, -1.468156, 0.4705882, 1, 0, 1,
-0.690726, -1.077878, -1.45435, 0.4627451, 1, 0, 1,
-0.6874737, -1.104887, -2.500777, 0.4588235, 1, 0, 1,
-0.686797, -0.3358398, -1.814098, 0.4509804, 1, 0, 1,
-0.686134, 0.2169149, -0.7706884, 0.4470588, 1, 0, 1,
-0.6814361, -0.627259, -1.302989, 0.4392157, 1, 0, 1,
-0.6788318, -0.410582, -3.06839, 0.4352941, 1, 0, 1,
-0.6788305, 1.375172, -0.5034306, 0.427451, 1, 0, 1,
-0.6717923, -0.2193001, -1.885534, 0.4235294, 1, 0, 1,
-0.6714802, -0.4457617, -2.262024, 0.4156863, 1, 0, 1,
-0.670448, 0.7976589, -0.9768769, 0.4117647, 1, 0, 1,
-0.6693668, 0.6084855, -1.215668, 0.4039216, 1, 0, 1,
-0.662331, -0.3656066, -2.247662, 0.3960784, 1, 0, 1,
-0.6565593, -0.3114405, -0.6757002, 0.3921569, 1, 0, 1,
-0.6561438, 0.1446701, -4.024834, 0.3843137, 1, 0, 1,
-0.651197, -0.9972569, -4.249172, 0.3803922, 1, 0, 1,
-0.6486666, -0.2842895, -1.463745, 0.372549, 1, 0, 1,
-0.6474233, 0.8958027, -1.016311, 0.3686275, 1, 0, 1,
-0.6400315, 1.458499, 1.632737, 0.3607843, 1, 0, 1,
-0.6344212, 0.5266303, -1.244365, 0.3568628, 1, 0, 1,
-0.6310009, -1.187445, -0.169459, 0.3490196, 1, 0, 1,
-0.629935, 0.4710918, -0.2789634, 0.345098, 1, 0, 1,
-0.6194881, 1.593544, -1.689075, 0.3372549, 1, 0, 1,
-0.6154966, -0.3869626, -1.624876, 0.3333333, 1, 0, 1,
-0.615371, -0.9852279, -2.660102, 0.3254902, 1, 0, 1,
-0.6107194, 1.006716, 1.137197, 0.3215686, 1, 0, 1,
-0.6096845, 0.5401718, 1.50338, 0.3137255, 1, 0, 1,
-0.6072938, -2.368897, -2.912461, 0.3098039, 1, 0, 1,
-0.5970748, -1.645815, -2.576336, 0.3019608, 1, 0, 1,
-0.5912355, -0.3086117, -2.109934, 0.2941177, 1, 0, 1,
-0.5897546, 0.1237176, -0.6704254, 0.2901961, 1, 0, 1,
-0.580223, -0.1332925, -0.6306456, 0.282353, 1, 0, 1,
-0.5761316, 0.3787606, 0.508204, 0.2784314, 1, 0, 1,
-0.5732965, 0.2139948, -0.7958145, 0.2705882, 1, 0, 1,
-0.5710698, -0.3093145, -1.89929, 0.2666667, 1, 0, 1,
-0.5598847, -0.2535948, -0.6095029, 0.2588235, 1, 0, 1,
-0.5597848, -0.1533244, -1.816558, 0.254902, 1, 0, 1,
-0.5574619, 1.264997, 0.5147428, 0.2470588, 1, 0, 1,
-0.5563476, 0.8155561, 0.8645719, 0.2431373, 1, 0, 1,
-0.5554797, -0.07802024, -0.3746542, 0.2352941, 1, 0, 1,
-0.5502453, 0.9240349, -0.2560375, 0.2313726, 1, 0, 1,
-0.5458162, 1.086163, -1.959944, 0.2235294, 1, 0, 1,
-0.5455741, 0.7407688, -0.1194648, 0.2196078, 1, 0, 1,
-0.541912, -0.8463275, -3.393981, 0.2117647, 1, 0, 1,
-0.5351683, -0.1235131, -1.678253, 0.2078431, 1, 0, 1,
-0.5348807, 1.419748, -1.620389, 0.2, 1, 0, 1,
-0.5336369, -0.3903537, -1.6373, 0.1921569, 1, 0, 1,
-0.5273812, -0.2335716, -2.652774, 0.1882353, 1, 0, 1,
-0.525178, 0.2273791, -1.044501, 0.1803922, 1, 0, 1,
-0.5238259, 1.372402, -0.9514428, 0.1764706, 1, 0, 1,
-0.5212536, 0.7724485, -2.24961, 0.1686275, 1, 0, 1,
-0.5191284, 0.7967978, -1.464239, 0.1647059, 1, 0, 1,
-0.5178276, 1.973607, 0.4401015, 0.1568628, 1, 0, 1,
-0.5166525, -0.04391879, -0.9446948, 0.1529412, 1, 0, 1,
-0.5111082, -1.801761, -2.067003, 0.145098, 1, 0, 1,
-0.5110545, -1.493945, -2.243313, 0.1411765, 1, 0, 1,
-0.5090417, -0.9352845, -3.0615, 0.1333333, 1, 0, 1,
-0.5085038, -0.8097734, -2.388011, 0.1294118, 1, 0, 1,
-0.5045976, 0.6074744, -1.513472, 0.1215686, 1, 0, 1,
-0.5042837, -0.6020219, -0.9033955, 0.1176471, 1, 0, 1,
-0.4930412, -0.7972479, -2.214647, 0.1098039, 1, 0, 1,
-0.4925662, -1.933783, -2.3634, 0.1058824, 1, 0, 1,
-0.4908682, -0.3836555, 0.5815951, 0.09803922, 1, 0, 1,
-0.4902202, 0.1422731, -2.590013, 0.09019608, 1, 0, 1,
-0.4876609, -0.6483598, -1.65997, 0.08627451, 1, 0, 1,
-0.4868329, -0.3051458, -1.356409, 0.07843138, 1, 0, 1,
-0.4867156, 0.05032955, -1.948134, 0.07450981, 1, 0, 1,
-0.486466, -0.2318732, -2.422651, 0.06666667, 1, 0, 1,
-0.480997, 1.525024, -1.03382, 0.0627451, 1, 0, 1,
-0.475067, -0.2770789, -2.014408, 0.05490196, 1, 0, 1,
-0.4693256, -1.758708, -3.289321, 0.05098039, 1, 0, 1,
-0.4645641, 1.036523, -1.106996, 0.04313726, 1, 0, 1,
-0.4635022, 2.521246, -0.3363372, 0.03921569, 1, 0, 1,
-0.4621501, 0.9860266, -1.239613, 0.03137255, 1, 0, 1,
-0.4595754, 0.607931, 0.4373897, 0.02745098, 1, 0, 1,
-0.4551615, -0.785975, -1.983394, 0.01960784, 1, 0, 1,
-0.453743, 0.3042791, 0.1089746, 0.01568628, 1, 0, 1,
-0.4485082, -0.08628315, -1.299686, 0.007843138, 1, 0, 1,
-0.4414645, -1.056754, -2.644103, 0.003921569, 1, 0, 1,
-0.4405746, 3.31112, 0.4261264, 0, 1, 0.003921569, 1,
-0.4359286, -0.3675627, -2.279639, 0, 1, 0.01176471, 1,
-0.4357449, -0.9771971, -2.294497, 0, 1, 0.01568628, 1,
-0.4348821, 1.826785, -1.449524, 0, 1, 0.02352941, 1,
-0.4343485, 0.9394596, 0.8449876, 0, 1, 0.02745098, 1,
-0.4268848, 1.139393, 0.03509063, 0, 1, 0.03529412, 1,
-0.4252623, 1.055014, 0.9133876, 0, 1, 0.03921569, 1,
-0.4196708, -1.166518, -1.70671, 0, 1, 0.04705882, 1,
-0.4138379, 0.5475361, -1.072242, 0, 1, 0.05098039, 1,
-0.4128264, 0.3535593, -1.248985, 0, 1, 0.05882353, 1,
-0.4098791, 0.4460601, 0.470021, 0, 1, 0.0627451, 1,
-0.4092095, -0.6548076, -4.591156, 0, 1, 0.07058824, 1,
-0.403509, 0.1663899, -1.572667, 0, 1, 0.07450981, 1,
-0.3974146, -0.5846104, -2.395394, 0, 1, 0.08235294, 1,
-0.3964207, 0.6249543, -0.5812619, 0, 1, 0.08627451, 1,
-0.3868643, -0.6856595, -1.428373, 0, 1, 0.09411765, 1,
-0.3828636, 2.478037, -1.974604, 0, 1, 0.1019608, 1,
-0.3596221, 0.8268347, -2.173091, 0, 1, 0.1058824, 1,
-0.353561, -0.07902578, -1.471906, 0, 1, 0.1137255, 1,
-0.3495505, 2.292036, -0.8389593, 0, 1, 0.1176471, 1,
-0.3480931, 0.4071809, 0.7678726, 0, 1, 0.1254902, 1,
-0.3430917, -0.731772, -4.017626, 0, 1, 0.1294118, 1,
-0.3421252, 1.906554, 0.2687565, 0, 1, 0.1372549, 1,
-0.3415014, 0.8618819, -1.391811, 0, 1, 0.1411765, 1,
-0.3413647, -0.563266, -2.613344, 0, 1, 0.1490196, 1,
-0.3344196, -1.090907, -0.6397209, 0, 1, 0.1529412, 1,
-0.3325334, -0.3655536, -3.083608, 0, 1, 0.1607843, 1,
-0.3310613, 0.6423123, -1.498149, 0, 1, 0.1647059, 1,
-0.3302649, 0.3857055, -0.5871035, 0, 1, 0.172549, 1,
-0.3285316, 0.3813527, -1.523725, 0, 1, 0.1764706, 1,
-0.3247865, -0.5188143, -2.405877, 0, 1, 0.1843137, 1,
-0.3182962, -0.2223624, -2.88257, 0, 1, 0.1882353, 1,
-0.314545, 1.979884, 0.7011077, 0, 1, 0.1960784, 1,
-0.3108855, 0.5307915, -2.864979, 0, 1, 0.2039216, 1,
-0.3076921, 1.325848, -2.064716, 0, 1, 0.2078431, 1,
-0.3065099, 1.033767, -0.6557857, 0, 1, 0.2156863, 1,
-0.3057616, 0.4138365, -1.66233, 0, 1, 0.2196078, 1,
-0.3045244, 0.5150034, 0.83021, 0, 1, 0.227451, 1,
-0.2996899, -0.1625036, -2.934275, 0, 1, 0.2313726, 1,
-0.2943817, -0.1471045, -3.035616, 0, 1, 0.2392157, 1,
-0.2940735, 0.9934072, -1.200282, 0, 1, 0.2431373, 1,
-0.2901872, -1.266045, -1.483832, 0, 1, 0.2509804, 1,
-0.2764507, 0.5332795, 1.036136, 0, 1, 0.254902, 1,
-0.2735028, 0.4859958, -0.9466806, 0, 1, 0.2627451, 1,
-0.264688, -0.3100791, -2.200067, 0, 1, 0.2666667, 1,
-0.2617621, -1.295691, -2.015224, 0, 1, 0.2745098, 1,
-0.2599989, 0.07320438, -1.004632, 0, 1, 0.2784314, 1,
-0.2582136, -0.2708518, -2.238719, 0, 1, 0.2862745, 1,
-0.2580192, 1.120847, -1.247669, 0, 1, 0.2901961, 1,
-0.2546062, 0.7843882, 0.09052575, 0, 1, 0.2980392, 1,
-0.2535283, 0.5793468, 0.6593978, 0, 1, 0.3058824, 1,
-0.2532832, 1.148923, 0.01756619, 0, 1, 0.3098039, 1,
-0.2478108, 0.2445435, -0.4880171, 0, 1, 0.3176471, 1,
-0.2457474, 0.2190943, -0.5155191, 0, 1, 0.3215686, 1,
-0.2437883, 0.6857546, -0.9227179, 0, 1, 0.3294118, 1,
-0.238524, -0.03694128, -0.4199624, 0, 1, 0.3333333, 1,
-0.2359087, 1.872762, -0.02173683, 0, 1, 0.3411765, 1,
-0.2335558, 1.643063, 1.303639, 0, 1, 0.345098, 1,
-0.2329463, -1.664925, -1.461635, 0, 1, 0.3529412, 1,
-0.222227, -0.2074678, -2.09794, 0, 1, 0.3568628, 1,
-0.2193994, -0.1510353, -3.710934, 0, 1, 0.3647059, 1,
-0.2180294, 0.03583134, -2.105626, 0, 1, 0.3686275, 1,
-0.2168751, 0.195454, -0.5422085, 0, 1, 0.3764706, 1,
-0.213714, 0.5451574, -0.1376193, 0, 1, 0.3803922, 1,
-0.2119965, 0.9597485, 0.1540836, 0, 1, 0.3882353, 1,
-0.209597, 0.9354051, -0.2873992, 0, 1, 0.3921569, 1,
-0.2063283, -0.4075178, -3.638397, 0, 1, 0.4, 1,
-0.2054694, -1.651856, -2.547739, 0, 1, 0.4078431, 1,
-0.2014261, 1.526897, 0.8650602, 0, 1, 0.4117647, 1,
-0.1991315, -0.3529498, -3.724115, 0, 1, 0.4196078, 1,
-0.1970118, -1.056148, -3.747732, 0, 1, 0.4235294, 1,
-0.1965724, -0.3068865, -1.862525, 0, 1, 0.4313726, 1,
-0.19491, 1.566865, -0.3754494, 0, 1, 0.4352941, 1,
-0.1943035, 1.552177, -0.2583935, 0, 1, 0.4431373, 1,
-0.1929751, 0.2995922, -1.254849, 0, 1, 0.4470588, 1,
-0.1917387, -0.04896054, -2.268, 0, 1, 0.454902, 1,
-0.1891544, -0.2856955, -2.244777, 0, 1, 0.4588235, 1,
-0.1880144, -0.9932059, -2.36921, 0, 1, 0.4666667, 1,
-0.1863091, -0.7971254, -3.666429, 0, 1, 0.4705882, 1,
-0.1827079, -1.328612, -3.547231, 0, 1, 0.4784314, 1,
-0.1796908, -0.2464383, -2.308398, 0, 1, 0.4823529, 1,
-0.1779441, -0.3633301, -1.709319, 0, 1, 0.4901961, 1,
-0.1733073, 0.9189232, -1.43526, 0, 1, 0.4941176, 1,
-0.1709292, 0.8013096, -0.7191771, 0, 1, 0.5019608, 1,
-0.1693502, 0.4648409, 0.5642717, 0, 1, 0.509804, 1,
-0.16166, -1.0265, -2.051745, 0, 1, 0.5137255, 1,
-0.1608889, 1.351121, -0.3728991, 0, 1, 0.5215687, 1,
-0.1608381, 0.7919024, 0.7820361, 0, 1, 0.5254902, 1,
-0.1590892, 1.113398, -1.070167, 0, 1, 0.5333334, 1,
-0.1576497, -0.6366612, -2.57409, 0, 1, 0.5372549, 1,
-0.1561299, -0.1853804, -2.104253, 0, 1, 0.5450981, 1,
-0.1478542, 0.4694813, 0.8725598, 0, 1, 0.5490196, 1,
-0.1478118, 0.1058463, -2.679162, 0, 1, 0.5568628, 1,
-0.1465153, 0.8987457, -0.6245891, 0, 1, 0.5607843, 1,
-0.1443332, -0.553062, -2.604903, 0, 1, 0.5686275, 1,
-0.1441515, 0.2502117, -1.568206, 0, 1, 0.572549, 1,
-0.1400426, 1.29638, 0.130385, 0, 1, 0.5803922, 1,
-0.1396366, -0.674855, -3.398738, 0, 1, 0.5843138, 1,
-0.1393307, -1.509207, -3.949133, 0, 1, 0.5921569, 1,
-0.1378256, -0.1543869, -2.062373, 0, 1, 0.5960785, 1,
-0.1377863, 0.1530729, -1.414904, 0, 1, 0.6039216, 1,
-0.1373713, -0.4695227, -1.775314, 0, 1, 0.6117647, 1,
-0.1354101, -2.426113, -4.700088, 0, 1, 0.6156863, 1,
-0.1340586, -0.9442175, -3.584936, 0, 1, 0.6235294, 1,
-0.1334868, 2.217607, -0.08716054, 0, 1, 0.627451, 1,
-0.1329383, 0.3460897, 1.6171, 0, 1, 0.6352941, 1,
-0.1305629, 0.2210457, -2.055661, 0, 1, 0.6392157, 1,
-0.1302754, -0.0679986, -1.932283, 0, 1, 0.6470588, 1,
-0.1265561, -0.9943781, -3.133839, 0, 1, 0.6509804, 1,
-0.1193218, -0.6814922, -0.6847249, 0, 1, 0.6588235, 1,
-0.1182132, -0.1239387, -2.316422, 0, 1, 0.6627451, 1,
-0.1152829, -0.402653, -2.682458, 0, 1, 0.6705883, 1,
-0.1150587, 0.2798129, -0.3242916, 0, 1, 0.6745098, 1,
-0.1135121, -1.473948, -2.957789, 0, 1, 0.682353, 1,
-0.1076834, 0.3803715, -0.840884, 0, 1, 0.6862745, 1,
-0.1063594, -0.7279234, -3.190021, 0, 1, 0.6941177, 1,
-0.1039168, -1.257677, -4.510327, 0, 1, 0.7019608, 1,
-0.1030119, 0.7364687, 0.5934492, 0, 1, 0.7058824, 1,
-0.1006386, 1.710736, 1.349724, 0, 1, 0.7137255, 1,
-0.09887923, -0.6890224, -3.596255, 0, 1, 0.7176471, 1,
-0.09643693, 1.088224, 0.07393551, 0, 1, 0.7254902, 1,
-0.09444167, -0.03711965, -2.092542, 0, 1, 0.7294118, 1,
-0.08975695, 1.39857, -1.24681, 0, 1, 0.7372549, 1,
-0.0890578, -1.304048, -3.102484, 0, 1, 0.7411765, 1,
-0.08557903, -1.294244, -4.375185, 0, 1, 0.7490196, 1,
-0.08230854, 0.3914868, 0.4825385, 0, 1, 0.7529412, 1,
-0.07806911, 0.8301884, -0.5365375, 0, 1, 0.7607843, 1,
-0.07686906, 0.2169284, -1.82732, 0, 1, 0.7647059, 1,
-0.0539158, 1.577816, -0.337229, 0, 1, 0.772549, 1,
-0.04971735, 0.07074551, 1.330278, 0, 1, 0.7764706, 1,
-0.0455325, 0.8954975, 0.6895496, 0, 1, 0.7843137, 1,
-0.03800425, 0.5075781, 0.9528149, 0, 1, 0.7882353, 1,
-0.03792048, -0.02308497, -3.558455, 0, 1, 0.7960784, 1,
-0.03470839, -0.1205207, -3.401847, 0, 1, 0.8039216, 1,
-0.03226116, 1.075754, 0.4584875, 0, 1, 0.8078431, 1,
-0.03092431, -0.2076344, -2.870287, 0, 1, 0.8156863, 1,
-0.0282625, 0.7220795, 0.3124425, 0, 1, 0.8196079, 1,
-0.0252072, -0.1698803, -2.604065, 0, 1, 0.827451, 1,
-0.01415401, 0.921499, 0.3160169, 0, 1, 0.8313726, 1,
-0.01144348, 0.7105463, -2.484449, 0, 1, 0.8392157, 1,
-0.006446624, 0.02053798, -0.5268289, 0, 1, 0.8431373, 1,
-0.00600599, -0.04037239, -4.222329, 0, 1, 0.8509804, 1,
-0.005423804, -0.8208711, -5.015156, 0, 1, 0.854902, 1,
-0.004798967, 0.3034813, -0.208688, 0, 1, 0.8627451, 1,
-0.002463485, -0.7007024, -3.692369, 0, 1, 0.8666667, 1,
-0.001885434, -0.0409363, -3.53125, 0, 1, 0.8745098, 1,
-0.0001250624, 1.268387, 1.45738, 0, 1, 0.8784314, 1,
0.004515882, -0.7709861, 3.234924, 0, 1, 0.8862745, 1,
0.005665624, -0.918034, 1.098529, 0, 1, 0.8901961, 1,
0.006227205, -0.273948, 3.264241, 0, 1, 0.8980392, 1,
0.008731341, -1.181287, 3.628737, 0, 1, 0.9058824, 1,
0.01430117, 0.8196995, 1.059929, 0, 1, 0.9098039, 1,
0.01796142, 0.2559854, 0.3724446, 0, 1, 0.9176471, 1,
0.01896002, -0.7807331, 2.077873, 0, 1, 0.9215686, 1,
0.02097622, 0.1473548, -0.2391638, 0, 1, 0.9294118, 1,
0.02100524, -0.05359561, 3.172406, 0, 1, 0.9333333, 1,
0.02160219, -0.1589393, 2.669489, 0, 1, 0.9411765, 1,
0.02275607, 1.621081, 1.6418, 0, 1, 0.945098, 1,
0.02501375, -0.4121583, 3.254044, 0, 1, 0.9529412, 1,
0.02551474, -0.1086461, 1.97193, 0, 1, 0.9568627, 1,
0.02795103, -0.9671848, 4.73504, 0, 1, 0.9647059, 1,
0.02945332, 0.7330651, -1.271051, 0, 1, 0.9686275, 1,
0.03329222, 0.9159088, -0.8503379, 0, 1, 0.9764706, 1,
0.03561705, 1.401591, -0.9388568, 0, 1, 0.9803922, 1,
0.0402819, 0.08686803, 0.5143555, 0, 1, 0.9882353, 1,
0.04041813, -0.0006394198, 2.470422, 0, 1, 0.9921569, 1,
0.04104345, -0.2177972, 4.01472, 0, 1, 1, 1,
0.04309044, -0.3742769, 2.536232, 0, 0.9921569, 1, 1,
0.04439326, 1.122711, -0.1754752, 0, 0.9882353, 1, 1,
0.04509762, 1.165755, -0.08260015, 0, 0.9803922, 1, 1,
0.04643022, -0.5039656, 2.360307, 0, 0.9764706, 1, 1,
0.04650094, 1.030016, -0.004018609, 0, 0.9686275, 1, 1,
0.04811847, -0.6761872, 2.604938, 0, 0.9647059, 1, 1,
0.04864715, 1.055218, 0.5030029, 0, 0.9568627, 1, 1,
0.05371147, -2.849084, 3.658768, 0, 0.9529412, 1, 1,
0.05379761, 0.7137097, 0.2467343, 0, 0.945098, 1, 1,
0.05531923, -0.2161479, 3.122073, 0, 0.9411765, 1, 1,
0.05999339, 0.9928852, 0.3372533, 0, 0.9333333, 1, 1,
0.06036671, -0.2115906, 2.5522, 0, 0.9294118, 1, 1,
0.06141957, 0.07547384, 1.083048, 0, 0.9215686, 1, 1,
0.06562965, -0.6276225, 3.658345, 0, 0.9176471, 1, 1,
0.06588322, -0.8608159, 5.713443, 0, 0.9098039, 1, 1,
0.07501371, -0.5908374, 2.26355, 0, 0.9058824, 1, 1,
0.07510603, 0.6441246, -0.494418, 0, 0.8980392, 1, 1,
0.07518288, -1.45425, 4.166714, 0, 0.8901961, 1, 1,
0.0760129, 0.01025579, 1.116173, 0, 0.8862745, 1, 1,
0.07626154, 1.339358, 0.801935, 0, 0.8784314, 1, 1,
0.07656172, 0.07164478, 0.3371695, 0, 0.8745098, 1, 1,
0.07779794, -1.470523, 0.8285512, 0, 0.8666667, 1, 1,
0.08117362, 0.3650603, 0.2962337, 0, 0.8627451, 1, 1,
0.08165717, -0.3123234, 3.375888, 0, 0.854902, 1, 1,
0.08335448, -1.318892, 3.933015, 0, 0.8509804, 1, 1,
0.08347631, -2.713712, 3.577749, 0, 0.8431373, 1, 1,
0.08415685, 0.7601547, -0.2017159, 0, 0.8392157, 1, 1,
0.09460224, -0.5349997, 0.8678903, 0, 0.8313726, 1, 1,
0.09600302, -2.010398, 4.026679, 0, 0.827451, 1, 1,
0.09857149, 0.7758352, 1.269003, 0, 0.8196079, 1, 1,
0.1035955, 2.253247, -0.7017691, 0, 0.8156863, 1, 1,
0.1078733, 0.7736802, 0.85857, 0, 0.8078431, 1, 1,
0.1127411, -0.1851732, 1.152643, 0, 0.8039216, 1, 1,
0.1132112, 0.1965511, 0.4074945, 0, 0.7960784, 1, 1,
0.1135276, -0.2198911, 3.185942, 0, 0.7882353, 1, 1,
0.1172214, -0.9729402, 1.389954, 0, 0.7843137, 1, 1,
0.1173342, 0.8082288, 2.353288, 0, 0.7764706, 1, 1,
0.1174208, -1.494195, 3.471706, 0, 0.772549, 1, 1,
0.119508, -2.409929, 4.416377, 0, 0.7647059, 1, 1,
0.1232031, -1.048534, 2.89318, 0, 0.7607843, 1, 1,
0.133645, 0.8177931, -0.1700585, 0, 0.7529412, 1, 1,
0.136858, -0.8994, 1.369469, 0, 0.7490196, 1, 1,
0.1382291, 1.31198, -0.05624702, 0, 0.7411765, 1, 1,
0.1400825, 0.2191018, 1.358126, 0, 0.7372549, 1, 1,
0.1409723, -1.004729, 3.9097, 0, 0.7294118, 1, 1,
0.1411066, 0.3527295, 1.791218, 0, 0.7254902, 1, 1,
0.145647, 1.603783, -0.9034384, 0, 0.7176471, 1, 1,
0.1482857, 0.1225333, 0.6779762, 0, 0.7137255, 1, 1,
0.1497238, 0.1634668, -0.3959563, 0, 0.7058824, 1, 1,
0.1532143, -1.723271, 3.883713, 0, 0.6980392, 1, 1,
0.1536754, 0.6919677, 0.08389837, 0, 0.6941177, 1, 1,
0.1541733, 0.9754407, 0.2192927, 0, 0.6862745, 1, 1,
0.1548432, -1.71981, 3.70647, 0, 0.682353, 1, 1,
0.1549369, 0.4858977, -0.3649169, 0, 0.6745098, 1, 1,
0.1555353, 1.590948, 1.064238, 0, 0.6705883, 1, 1,
0.1613416, 0.02340989, 1.365482, 0, 0.6627451, 1, 1,
0.1631808, 0.3069963, 0.9437286, 0, 0.6588235, 1, 1,
0.1653987, 0.2942233, 2.70565, 0, 0.6509804, 1, 1,
0.1694988, 0.09447564, 1.170287, 0, 0.6470588, 1, 1,
0.170321, -0.3366212, 2.445974, 0, 0.6392157, 1, 1,
0.1708005, -0.3509709, 1.132427, 0, 0.6352941, 1, 1,
0.170948, 0.5157167, 0.7666755, 0, 0.627451, 1, 1,
0.1724232, 0.7124508, 1.289826, 0, 0.6235294, 1, 1,
0.1751958, -0.0886733, 1.916505, 0, 0.6156863, 1, 1,
0.1761906, 0.3381075, 1.614783, 0, 0.6117647, 1, 1,
0.1813548, 0.250722, 0.5166591, 0, 0.6039216, 1, 1,
0.1824332, -0.09682369, 3.139642, 0, 0.5960785, 1, 1,
0.1840078, -1.24998, 3.213925, 0, 0.5921569, 1, 1,
0.188987, -0.3993188, 3.058519, 0, 0.5843138, 1, 1,
0.1947642, 0.09194691, 1.579474, 0, 0.5803922, 1, 1,
0.1955791, 0.5256247, 2.162717, 0, 0.572549, 1, 1,
0.1974335, -0.4429786, 2.516992, 0, 0.5686275, 1, 1,
0.1987063, 2.964892, -1.569595, 0, 0.5607843, 1, 1,
0.1990912, -1.531345, 3.644283, 0, 0.5568628, 1, 1,
0.2007091, 1.52458, -0.8395005, 0, 0.5490196, 1, 1,
0.2032408, 0.4705738, -0.9441642, 0, 0.5450981, 1, 1,
0.2036264, 0.16336, 1.04241, 0, 0.5372549, 1, 1,
0.2058367, -1.462226, 1.601423, 0, 0.5333334, 1, 1,
0.2142785, -1.577799, 2.502828, 0, 0.5254902, 1, 1,
0.216072, 2.055547, 0.2268689, 0, 0.5215687, 1, 1,
0.2228021, -0.1945344, 3.343395, 0, 0.5137255, 1, 1,
0.224055, -0.9739962, 3.129978, 0, 0.509804, 1, 1,
0.2284289, -0.5468138, 2.735873, 0, 0.5019608, 1, 1,
0.2300513, -0.9751899, 2.570586, 0, 0.4941176, 1, 1,
0.2307125, 0.4106632, 1.289756, 0, 0.4901961, 1, 1,
0.2325589, 2.339512, -0.1146227, 0, 0.4823529, 1, 1,
0.2361194, 0.1569088, 1.710164, 0, 0.4784314, 1, 1,
0.2452878, -1.248601, 2.1514, 0, 0.4705882, 1, 1,
0.2455353, 0.7841089, -0.3909469, 0, 0.4666667, 1, 1,
0.246574, -0.1306154, 0.4688944, 0, 0.4588235, 1, 1,
0.2502809, -1.222666, 3.230949, 0, 0.454902, 1, 1,
0.2543053, -0.1573927, 2.068522, 0, 0.4470588, 1, 1,
0.2566838, -1.593308, 2.304445, 0, 0.4431373, 1, 1,
0.2568406, 0.7379767, -0.2110184, 0, 0.4352941, 1, 1,
0.2612488, 0.2180285, 0.4137672, 0, 0.4313726, 1, 1,
0.2636977, -0.1729767, 1.814151, 0, 0.4235294, 1, 1,
0.2647696, 0.932681, -0.08447053, 0, 0.4196078, 1, 1,
0.2669393, -0.02068705, 0.6240334, 0, 0.4117647, 1, 1,
0.2673115, 0.07166949, 2.031435, 0, 0.4078431, 1, 1,
0.2683522, -1.723535, 3.58059, 0, 0.4, 1, 1,
0.2696206, 0.6437411, 0.4199659, 0, 0.3921569, 1, 1,
0.2728019, -1.008053, 3.528823, 0, 0.3882353, 1, 1,
0.2750853, -0.5844997, 4.269063, 0, 0.3803922, 1, 1,
0.2755424, -1.247209, 0.8828551, 0, 0.3764706, 1, 1,
0.2807924, 0.2908963, 1.025754, 0, 0.3686275, 1, 1,
0.2822942, 0.8865032, -0.7722433, 0, 0.3647059, 1, 1,
0.2827932, 1.699677, 1.051631, 0, 0.3568628, 1, 1,
0.2891042, -0.9413775, 3.345881, 0, 0.3529412, 1, 1,
0.2906376, 0.3976418, 1.233938, 0, 0.345098, 1, 1,
0.2930247, -0.5281214, 0.7148343, 0, 0.3411765, 1, 1,
0.2933612, 0.02592598, 1.327051, 0, 0.3333333, 1, 1,
0.2935882, 0.7642565, 0.4402361, 0, 0.3294118, 1, 1,
0.2947903, -0.7703168, 2.368406, 0, 0.3215686, 1, 1,
0.3028468, -0.9771166, 1.512813, 0, 0.3176471, 1, 1,
0.3042332, -1.379329, 0.8070651, 0, 0.3098039, 1, 1,
0.3045579, -1.367351, 2.452051, 0, 0.3058824, 1, 1,
0.3047096, 0.01151577, 1.035818, 0, 0.2980392, 1, 1,
0.3135897, -0.4323877, 1.931962, 0, 0.2901961, 1, 1,
0.3171026, -0.5591219, 3.46177, 0, 0.2862745, 1, 1,
0.3181873, 1.551952, -0.6980935, 0, 0.2784314, 1, 1,
0.3253469, 0.2706771, 0.1433272, 0, 0.2745098, 1, 1,
0.3258095, 0.3616837, 1.415304, 0, 0.2666667, 1, 1,
0.3282217, 0.8497506, 0.7171991, 0, 0.2627451, 1, 1,
0.3316863, -0.1120933, 1.192582, 0, 0.254902, 1, 1,
0.3330904, -0.5799623, 3.668096, 0, 0.2509804, 1, 1,
0.3330987, -1.461591, 4.475023, 0, 0.2431373, 1, 1,
0.3334781, 0.8900934, 0.911181, 0, 0.2392157, 1, 1,
0.3492245, -0.422385, 3.210037, 0, 0.2313726, 1, 1,
0.3527668, -0.946981, 3.428261, 0, 0.227451, 1, 1,
0.3532867, -0.2363474, 2.55563, 0, 0.2196078, 1, 1,
0.3548539, 1.948774, 1.152671, 0, 0.2156863, 1, 1,
0.3584782, 0.8435436, 1.844178, 0, 0.2078431, 1, 1,
0.359225, 1.329982, 1.521309, 0, 0.2039216, 1, 1,
0.3609696, 1.166113, 1.29006, 0, 0.1960784, 1, 1,
0.361467, 1.187789, 0.1753197, 0, 0.1882353, 1, 1,
0.3625097, 0.6988891, 0.693636, 0, 0.1843137, 1, 1,
0.3661736, 1.380169, -0.5481328, 0, 0.1764706, 1, 1,
0.3667477, 0.6964065, 1.587739, 0, 0.172549, 1, 1,
0.3686379, 0.03879591, 1.261322, 0, 0.1647059, 1, 1,
0.3688878, -0.865797, 4.721234, 0, 0.1607843, 1, 1,
0.375214, 0.4503459, 0.2522323, 0, 0.1529412, 1, 1,
0.375243, 0.1885985, 0.03272783, 0, 0.1490196, 1, 1,
0.3786723, -0.4150522, 1.751694, 0, 0.1411765, 1, 1,
0.3804174, -0.5957909, 4.291981, 0, 0.1372549, 1, 1,
0.380823, -1.958018, 4.047906, 0, 0.1294118, 1, 1,
0.3810954, -0.9641002, 2.585237, 0, 0.1254902, 1, 1,
0.3880087, 0.5517307, -0.7755424, 0, 0.1176471, 1, 1,
0.3889347, 0.8472764, -0.6269835, 0, 0.1137255, 1, 1,
0.3995546, -0.9056846, 2.756895, 0, 0.1058824, 1, 1,
0.4034127, 0.8838745, 0.585107, 0, 0.09803922, 1, 1,
0.4071504, -0.5913966, 3.002609, 0, 0.09411765, 1, 1,
0.4088023, -0.3228126, 2.4247, 0, 0.08627451, 1, 1,
0.4094328, -0.05620479, 1.507838, 0, 0.08235294, 1, 1,
0.4110078, -0.796252, 3.037454, 0, 0.07450981, 1, 1,
0.4120238, 0.707924, -0.5799913, 0, 0.07058824, 1, 1,
0.416429, 0.2723366, 1.835138, 0, 0.0627451, 1, 1,
0.4213572, -0.3468733, 2.265851, 0, 0.05882353, 1, 1,
0.4234509, 2.233041, 1.156183, 0, 0.05098039, 1, 1,
0.4237019, 0.6639482, 0.7678254, 0, 0.04705882, 1, 1,
0.431524, 0.9280972, 0.4584665, 0, 0.03921569, 1, 1,
0.4317465, -0.714835, 3.325038, 0, 0.03529412, 1, 1,
0.4376434, 0.7881824, 1.836963, 0, 0.02745098, 1, 1,
0.4378621, -0.9645236, 1.989631, 0, 0.02352941, 1, 1,
0.4381545, 0.1160683, 1.490193, 0, 0.01568628, 1, 1,
0.4389398, 0.6655166, 1.929036, 0, 0.01176471, 1, 1,
0.4437486, 1.064071, 0.5022388, 0, 0.003921569, 1, 1,
0.4527069, 0.7720561, 0.7203042, 0.003921569, 0, 1, 1,
0.4553248, -0.4351751, 2.510233, 0.007843138, 0, 1, 1,
0.456912, 0.3213706, 0.9956685, 0.01568628, 0, 1, 1,
0.4623482, 1.338141, -0.5842356, 0.01960784, 0, 1, 1,
0.4653012, -0.7267665, 2.464743, 0.02745098, 0, 1, 1,
0.4653689, 1.047899, 0.7209771, 0.03137255, 0, 1, 1,
0.4724877, -0.01782626, 2.847167, 0.03921569, 0, 1, 1,
0.4736312, 1.698481, 1.161262, 0.04313726, 0, 1, 1,
0.4760525, 0.4253093, 1.29045, 0.05098039, 0, 1, 1,
0.4804082, 0.3918402, -0.7146794, 0.05490196, 0, 1, 1,
0.4844687, 0.8355399, 0.6101862, 0.0627451, 0, 1, 1,
0.4857981, 0.4343805, -0.1097367, 0.06666667, 0, 1, 1,
0.4881942, 0.5907088, 2.003388, 0.07450981, 0, 1, 1,
0.4936902, -0.2251888, 3.02461, 0.07843138, 0, 1, 1,
0.4980255, -0.8419276, 2.839463, 0.08627451, 0, 1, 1,
0.5001996, 1.866064, 0.9002067, 0.09019608, 0, 1, 1,
0.5019785, -1.907024, 3.9355, 0.09803922, 0, 1, 1,
0.5023355, -0.3619712, 3.402399, 0.1058824, 0, 1, 1,
0.5029166, 1.625809, -0.6296007, 0.1098039, 0, 1, 1,
0.5053579, 0.6577418, 1.853453, 0.1176471, 0, 1, 1,
0.5094121, -1.310076, 3.499308, 0.1215686, 0, 1, 1,
0.5097655, 0.7488809, 0.358121, 0.1294118, 0, 1, 1,
0.5114316, -0.1483968, 2.141056, 0.1333333, 0, 1, 1,
0.5148079, -0.5231006, 2.354035, 0.1411765, 0, 1, 1,
0.5188475, 0.1077616, 1.452502, 0.145098, 0, 1, 1,
0.5189629, -1.19238, 2.120614, 0.1529412, 0, 1, 1,
0.5205827, 0.8882205, -1.200907, 0.1568628, 0, 1, 1,
0.5217851, -1.091599, 4.057508, 0.1647059, 0, 1, 1,
0.5244569, 0.3009429, 1.090483, 0.1686275, 0, 1, 1,
0.5253535, -1.688593, 3.360937, 0.1764706, 0, 1, 1,
0.5313716, 0.4545236, 0.1163579, 0.1803922, 0, 1, 1,
0.5334542, 0.5545452, 1.095707, 0.1882353, 0, 1, 1,
0.5381454, 0.7180725, 2.023852, 0.1921569, 0, 1, 1,
0.5383136, 0.9579059, 1.546503, 0.2, 0, 1, 1,
0.5395024, 0.7507371, 0.6132199, 0.2078431, 0, 1, 1,
0.541133, 2.057434, 0.8769971, 0.2117647, 0, 1, 1,
0.541533, -0.03452088, 2.184956, 0.2196078, 0, 1, 1,
0.5418941, 0.8855117, -0.02986666, 0.2235294, 0, 1, 1,
0.5423658, -1.376819, 3.066019, 0.2313726, 0, 1, 1,
0.5500785, 0.30075, 1.164117, 0.2352941, 0, 1, 1,
0.550259, -0.1797323, 2.042041, 0.2431373, 0, 1, 1,
0.5506647, 0.5058411, 1.448433, 0.2470588, 0, 1, 1,
0.5515777, 1.559051, 0.1075659, 0.254902, 0, 1, 1,
0.5596881, -0.8344853, 4.021395, 0.2588235, 0, 1, 1,
0.5608774, -0.0638044, 1.418339, 0.2666667, 0, 1, 1,
0.5664105, 2.071291, 1.333814, 0.2705882, 0, 1, 1,
0.5746461, 0.1756967, 0.6545815, 0.2784314, 0, 1, 1,
0.5776416, 0.2923819, 0.179646, 0.282353, 0, 1, 1,
0.5824893, 0.1509352, 2.838943, 0.2901961, 0, 1, 1,
0.584986, 0.2076698, -0.08312333, 0.2941177, 0, 1, 1,
0.5952459, -1.549003, 2.025311, 0.3019608, 0, 1, 1,
0.5981139, -1.39273, 3.094968, 0.3098039, 0, 1, 1,
0.6001534, 0.1922084, 0.03623415, 0.3137255, 0, 1, 1,
0.6043736, 0.5736642, -1.136695, 0.3215686, 0, 1, 1,
0.6054817, -1.547247, 3.850688, 0.3254902, 0, 1, 1,
0.6101054, 0.8221738, 0.8313172, 0.3333333, 0, 1, 1,
0.6114323, -0.02111213, 2.653863, 0.3372549, 0, 1, 1,
0.6117391, 0.4693752, 1.383312, 0.345098, 0, 1, 1,
0.6138644, 1.846694, 0.0004107401, 0.3490196, 0, 1, 1,
0.6190799, 1.328837, 0.6826077, 0.3568628, 0, 1, 1,
0.6212999, 0.5852036, 1.203319, 0.3607843, 0, 1, 1,
0.6277118, -0.1657262, 1.845162, 0.3686275, 0, 1, 1,
0.6295619, 0.1287363, 1.32142, 0.372549, 0, 1, 1,
0.6306139, 0.2522059, 3.54995, 0.3803922, 0, 1, 1,
0.6309553, -1.098294, 2.047916, 0.3843137, 0, 1, 1,
0.6343094, 1.293803, 0.3592233, 0.3921569, 0, 1, 1,
0.6545827, -0.916861, 2.345691, 0.3960784, 0, 1, 1,
0.657016, -0.05140662, 1.876382, 0.4039216, 0, 1, 1,
0.6585605, -1.618006, 3.018528, 0.4117647, 0, 1, 1,
0.659742, 0.4543864, 1.248929, 0.4156863, 0, 1, 1,
0.6600778, -0.4197564, 1.017057, 0.4235294, 0, 1, 1,
0.6644832, -0.08890481, 2.229728, 0.427451, 0, 1, 1,
0.668536, -0.2997527, -0.3288971, 0.4352941, 0, 1, 1,
0.6696613, -1.550577, 2.710199, 0.4392157, 0, 1, 1,
0.6732144, -1.162698, 2.891773, 0.4470588, 0, 1, 1,
0.6738922, 1.029824, 1.538849, 0.4509804, 0, 1, 1,
0.67818, -0.9125921, 3.628266, 0.4588235, 0, 1, 1,
0.68111, 1.292342, 0.4926503, 0.4627451, 0, 1, 1,
0.6811292, 0.4225926, 0.9518781, 0.4705882, 0, 1, 1,
0.6848199, -1.664981, 0.2331752, 0.4745098, 0, 1, 1,
0.6861809, -0.7499145, 3.159464, 0.4823529, 0, 1, 1,
0.68798, -1.072729, 2.484989, 0.4862745, 0, 1, 1,
0.6899979, 0.701754, 1.844694, 0.4941176, 0, 1, 1,
0.6922467, -0.4247275, 2.240754, 0.5019608, 0, 1, 1,
0.6949199, 2.315365, -0.903566, 0.5058824, 0, 1, 1,
0.697322, -1.110558, 1.314685, 0.5137255, 0, 1, 1,
0.701057, 1.061837, 1.012493, 0.5176471, 0, 1, 1,
0.7021171, -0.4845795, 2.493907, 0.5254902, 0, 1, 1,
0.7025095, -2.883507, 4.661877, 0.5294118, 0, 1, 1,
0.702582, -1.030649, 3.066991, 0.5372549, 0, 1, 1,
0.704017, -0.3295974, 3.288352, 0.5411765, 0, 1, 1,
0.7088276, 0.2654993, 0.8560667, 0.5490196, 0, 1, 1,
0.7262907, 0.1494415, 2.797622, 0.5529412, 0, 1, 1,
0.7381744, -0.6205034, 1.527191, 0.5607843, 0, 1, 1,
0.7417293, -0.4508233, 2.443852, 0.5647059, 0, 1, 1,
0.74248, 0.2302122, 1.852885, 0.572549, 0, 1, 1,
0.7425497, 1.054702, 1.372239, 0.5764706, 0, 1, 1,
0.7476988, -1.936903, 2.930239, 0.5843138, 0, 1, 1,
0.7484479, -0.5504429, 4.215559, 0.5882353, 0, 1, 1,
0.7493696, 0.4013782, 2.891975, 0.5960785, 0, 1, 1,
0.7518918, 0.6382791, 2.050273, 0.6039216, 0, 1, 1,
0.7563904, 1.529736, -0.9413357, 0.6078432, 0, 1, 1,
0.7625226, 0.4098462, 2.367333, 0.6156863, 0, 1, 1,
0.7653066, 0.6053098, -0.1417356, 0.6196079, 0, 1, 1,
0.766193, 0.7166229, 0.8175035, 0.627451, 0, 1, 1,
0.7662177, -1.574935, 3.587896, 0.6313726, 0, 1, 1,
0.7693174, -0.7577136, 0.8197761, 0.6392157, 0, 1, 1,
0.7749757, -0.4636416, 2.038423, 0.6431373, 0, 1, 1,
0.7750033, 0.8068744, 0.7425166, 0.6509804, 0, 1, 1,
0.7778407, -0.8092048, 2.181217, 0.654902, 0, 1, 1,
0.7802671, -0.5775027, 2.265962, 0.6627451, 0, 1, 1,
0.7825981, -1.193573, 2.550271, 0.6666667, 0, 1, 1,
0.783628, 0.3175013, 0.7251645, 0.6745098, 0, 1, 1,
0.7848635, 0.1630518, 0.4920183, 0.6784314, 0, 1, 1,
0.7911111, 1.477178, 0.5315647, 0.6862745, 0, 1, 1,
0.7985778, 1.318866, 0.139245, 0.6901961, 0, 1, 1,
0.8052456, -0.0816885, 2.727838, 0.6980392, 0, 1, 1,
0.8066995, -1.300961, 3.627153, 0.7058824, 0, 1, 1,
0.8068179, -0.8777257, 1.906367, 0.7098039, 0, 1, 1,
0.809843, 0.8553156, 0.1770825, 0.7176471, 0, 1, 1,
0.8103012, -0.2459512, 2.126807, 0.7215686, 0, 1, 1,
0.8109598, -1.708672, 4.20536, 0.7294118, 0, 1, 1,
0.8171458, -0.238374, 2.19806, 0.7333333, 0, 1, 1,
0.8259836, 0.9384871, -0.0522849, 0.7411765, 0, 1, 1,
0.8275056, -0.009833837, 4.077872, 0.7450981, 0, 1, 1,
0.8284215, -2.159866, 3.996942, 0.7529412, 0, 1, 1,
0.828905, 1.458584, 0.6744037, 0.7568628, 0, 1, 1,
0.8292379, -0.4787398, 2.076481, 0.7647059, 0, 1, 1,
0.834519, 0.3928758, 0.1487639, 0.7686275, 0, 1, 1,
0.8350841, -1.099926, 4.830702, 0.7764706, 0, 1, 1,
0.8413385, -1.6586, 3.746666, 0.7803922, 0, 1, 1,
0.8420421, 0.1666172, 1.177042, 0.7882353, 0, 1, 1,
0.8478757, 0.8520675, -0.7026325, 0.7921569, 0, 1, 1,
0.8481468, -1.82773, 3.645038, 0.8, 0, 1, 1,
0.8563243, 0.7639593, -1.15379, 0.8078431, 0, 1, 1,
0.8653288, -1.925985, 2.599457, 0.8117647, 0, 1, 1,
0.8693045, 0.4763118, 1.436544, 0.8196079, 0, 1, 1,
0.8715115, 1.372216, 1.763656, 0.8235294, 0, 1, 1,
0.8728327, 0.5046069, 2.171699, 0.8313726, 0, 1, 1,
0.8757706, 0.07731198, 1.27449, 0.8352941, 0, 1, 1,
0.8854925, -0.9690059, 2.122324, 0.8431373, 0, 1, 1,
0.8888973, 0.06395071, 3.5308, 0.8470588, 0, 1, 1,
0.8902719, -0.2381455, 1.160533, 0.854902, 0, 1, 1,
0.8910626, 0.8181556, 1.291836, 0.8588235, 0, 1, 1,
0.8912096, 1.065112, -1.175934, 0.8666667, 0, 1, 1,
0.8999454, -0.01611953, 3.31286, 0.8705882, 0, 1, 1,
0.9005011, -0.0147015, 1.596607, 0.8784314, 0, 1, 1,
0.9021994, -0.04230101, 3.000155, 0.8823529, 0, 1, 1,
0.9050779, -0.7034216, 2.830097, 0.8901961, 0, 1, 1,
0.9209476, 0.2496136, 0.9258869, 0.8941177, 0, 1, 1,
0.9219361, 0.3085667, 1.349061, 0.9019608, 0, 1, 1,
0.9228519, 0.2303938, 1.274935, 0.9098039, 0, 1, 1,
0.9251622, -0.03879148, 2.183501, 0.9137255, 0, 1, 1,
0.9278663, 0.699664, 1.591481, 0.9215686, 0, 1, 1,
0.9288797, 1.258721, -0.3204223, 0.9254902, 0, 1, 1,
0.9294806, 0.7210182, 1.25097, 0.9333333, 0, 1, 1,
0.9358634, -1.823708, 1.181575, 0.9372549, 0, 1, 1,
0.938093, -1.910462, 2.899313, 0.945098, 0, 1, 1,
0.9439114, -0.880278, 0.02247685, 0.9490196, 0, 1, 1,
0.9470081, -1.043699, 2.206345, 0.9568627, 0, 1, 1,
0.9513605, -0.8867114, 1.303286, 0.9607843, 0, 1, 1,
0.9532017, -1.510702, 2.681367, 0.9686275, 0, 1, 1,
0.9541649, -0.4864188, 2.775637, 0.972549, 0, 1, 1,
0.9588249, -0.8032916, 1.824704, 0.9803922, 0, 1, 1,
0.9622465, -1.506697, 3.780983, 0.9843137, 0, 1, 1,
0.963913, 0.523631, 2.073416, 0.9921569, 0, 1, 1,
0.9678789, 1.338062, -0.003976494, 0.9960784, 0, 1, 1,
0.9681241, -1.177828, 0.8868281, 1, 0, 0.9960784, 1,
0.9758532, -0.6331874, 2.033434, 1, 0, 0.9882353, 1,
0.980554, 0.4169993, 0.07295535, 1, 0, 0.9843137, 1,
0.9841176, 0.6777233, 1.556131, 1, 0, 0.9764706, 1,
0.9841636, -0.4598527, 0.4980171, 1, 0, 0.972549, 1,
0.988298, 0.6371403, 2.424217, 1, 0, 0.9647059, 1,
0.9963657, 0.7600389, -0.4332191, 1, 0, 0.9607843, 1,
0.9974493, 0.1884275, 1.782325, 1, 0, 0.9529412, 1,
1.00181, -0.5640858, 3.123915, 1, 0, 0.9490196, 1,
1.007878, -1.082544, 1.934189, 1, 0, 0.9411765, 1,
1.008087, -1.240015, 5.568281, 1, 0, 0.9372549, 1,
1.014801, 0.402346, 0.8221256, 1, 0, 0.9294118, 1,
1.017646, 0.2544409, 2.121918, 1, 0, 0.9254902, 1,
1.017762, -2.198943, 2.645246, 1, 0, 0.9176471, 1,
1.01859, -0.7268507, 2.271137, 1, 0, 0.9137255, 1,
1.020455, 0.03844224, 3.364989, 1, 0, 0.9058824, 1,
1.021478, -1.310113, 2.80507, 1, 0, 0.9019608, 1,
1.033749, 0.7550339, 1.032163, 1, 0, 0.8941177, 1,
1.034748, 1.109417, -0.2246886, 1, 0, 0.8862745, 1,
1.038575, -1.539407, 3.635902, 1, 0, 0.8823529, 1,
1.038652, 0.07448527, 3.188224, 1, 0, 0.8745098, 1,
1.056674, -0.1010569, 1.760547, 1, 0, 0.8705882, 1,
1.061952, 0.06600753, 1.504468, 1, 0, 0.8627451, 1,
1.064569, 1.144382, 0.8276189, 1, 0, 0.8588235, 1,
1.065144, -0.1066973, 0.890337, 1, 0, 0.8509804, 1,
1.069164, 0.2169074, -0.6999832, 1, 0, 0.8470588, 1,
1.083771, 1.660777, -0.4254047, 1, 0, 0.8392157, 1,
1.094835, 1.011463, 2.090609, 1, 0, 0.8352941, 1,
1.099247, -1.070637, 3.361006, 1, 0, 0.827451, 1,
1.101291, -0.3886666, 1.868116, 1, 0, 0.8235294, 1,
1.101928, 0.6170278, -0.8238727, 1, 0, 0.8156863, 1,
1.102741, -1.49699, 2.438626, 1, 0, 0.8117647, 1,
1.105826, 0.4802951, 1.410955, 1, 0, 0.8039216, 1,
1.108569, -0.8372192, 3.101399, 1, 0, 0.7960784, 1,
1.109131, -0.6931822, 2.548569, 1, 0, 0.7921569, 1,
1.112231, -0.3591343, 0.772197, 1, 0, 0.7843137, 1,
1.113785, -0.1419497, 2.534595, 1, 0, 0.7803922, 1,
1.1146, 0.3225136, 0.5477554, 1, 0, 0.772549, 1,
1.118772, 0.3877088, 0.4951907, 1, 0, 0.7686275, 1,
1.119536, 0.5857032, 0.5205085, 1, 0, 0.7607843, 1,
1.120153, -0.3405589, 1.893138, 1, 0, 0.7568628, 1,
1.122939, -0.3528605, 3.056822, 1, 0, 0.7490196, 1,
1.136863, -0.1674642, 3.154982, 1, 0, 0.7450981, 1,
1.143312, 1.75004, -1.884979, 1, 0, 0.7372549, 1,
1.144083, 1.240839, 0.5966229, 1, 0, 0.7333333, 1,
1.145609, 0.3009659, 1.518414, 1, 0, 0.7254902, 1,
1.151057, 0.01729603, 2.622948, 1, 0, 0.7215686, 1,
1.158632, -2.103481, 4.556049, 1, 0, 0.7137255, 1,
1.161848, -1.161628, 3.054177, 1, 0, 0.7098039, 1,
1.16595, 0.7328424, 0.2675365, 1, 0, 0.7019608, 1,
1.166769, -1.540726, 1.802685, 1, 0, 0.6941177, 1,
1.167163, 2.132883, 2.372454, 1, 0, 0.6901961, 1,
1.198749, 0.6494401, -0.5931714, 1, 0, 0.682353, 1,
1.199829, 0.1089061, 1.55954, 1, 0, 0.6784314, 1,
1.201096, -0.04004551, 0.7159491, 1, 0, 0.6705883, 1,
1.204073, -0.2734195, 1.465386, 1, 0, 0.6666667, 1,
1.205332, -0.06031379, 1.818507, 1, 0, 0.6588235, 1,
1.208216, -0.7259476, 2.177258, 1, 0, 0.654902, 1,
1.212068, -0.5186777, 4.576594, 1, 0, 0.6470588, 1,
1.212095, -0.3276603, 2.983174, 1, 0, 0.6431373, 1,
1.223139, -0.4618595, 1.13294, 1, 0, 0.6352941, 1,
1.230663, -1.057941, 3.447237, 1, 0, 0.6313726, 1,
1.232127, 1.026538, -0.1556296, 1, 0, 0.6235294, 1,
1.232198, -1.531062, 2.317769, 1, 0, 0.6196079, 1,
1.242538, -1.451982, 2.146717, 1, 0, 0.6117647, 1,
1.244292, -0.4531191, 2.313805, 1, 0, 0.6078432, 1,
1.246294, -1.199353, 1.911008, 1, 0, 0.6, 1,
1.248499, -0.7556288, 2.152717, 1, 0, 0.5921569, 1,
1.253794, 1.43017, 1.079729, 1, 0, 0.5882353, 1,
1.256662, -0.3720933, 2.106411, 1, 0, 0.5803922, 1,
1.258971, 0.1992834, 1.354972, 1, 0, 0.5764706, 1,
1.259515, -0.9989411, 3.563622, 1, 0, 0.5686275, 1,
1.263437, 0.3424839, -0.5506194, 1, 0, 0.5647059, 1,
1.267571, -1.726456, 3.358012, 1, 0, 0.5568628, 1,
1.275845, -0.890804, 1.129903, 1, 0, 0.5529412, 1,
1.289991, -0.1127595, 3.699302, 1, 0, 0.5450981, 1,
1.290672, 1.41986, 0.6347693, 1, 0, 0.5411765, 1,
1.309295, -0.4597454, 2.312596, 1, 0, 0.5333334, 1,
1.314244, -2.550722, 1.649622, 1, 0, 0.5294118, 1,
1.320125, -2.311849, 1.512705, 1, 0, 0.5215687, 1,
1.320294, 0.09727012, 1.096849, 1, 0, 0.5176471, 1,
1.322601, 1.669863, 0.15975, 1, 0, 0.509804, 1,
1.330155, 0.004089204, 1.994477, 1, 0, 0.5058824, 1,
1.331834, 0.3042175, 3.224396, 1, 0, 0.4980392, 1,
1.334575, -0.9298174, 2.148643, 1, 0, 0.4901961, 1,
1.336844, -1.144594, 2.648969, 1, 0, 0.4862745, 1,
1.342894, -0.7413786, 3.849112, 1, 0, 0.4784314, 1,
1.344566, -0.05183613, -0.7165118, 1, 0, 0.4745098, 1,
1.35606, -3.061985, 1.557523, 1, 0, 0.4666667, 1,
1.357032, -1.430184, 1.897812, 1, 0, 0.4627451, 1,
1.365626, 0.5279687, -1.059638, 1, 0, 0.454902, 1,
1.395775, -1.518162, 2.819567, 1, 0, 0.4509804, 1,
1.436046, -0.4251971, 3.448731, 1, 0, 0.4431373, 1,
1.441448, -0.9174168, 2.544502, 1, 0, 0.4392157, 1,
1.448931, -1.876351, 1.261162, 1, 0, 0.4313726, 1,
1.453259, -0.6147667, 0.9148107, 1, 0, 0.427451, 1,
1.457089, 1.955215, -0.4808164, 1, 0, 0.4196078, 1,
1.457101, 0.4787461, 2.723848, 1, 0, 0.4156863, 1,
1.468696, -0.5912128, 2.752134, 1, 0, 0.4078431, 1,
1.474864, 0.003178665, 0.8229461, 1, 0, 0.4039216, 1,
1.489264, 0.3312888, 0.1981883, 1, 0, 0.3960784, 1,
1.490567, 0.858486, 1.311224, 1, 0, 0.3882353, 1,
1.491726, 0.5573102, 1.585009, 1, 0, 0.3843137, 1,
1.513818, 1.766563, 0.2349491, 1, 0, 0.3764706, 1,
1.526045, -0.7611583, 2.859597, 1, 0, 0.372549, 1,
1.526741, 0.2174549, 1.38261, 1, 0, 0.3647059, 1,
1.535378, -0.3572153, 1.350008, 1, 0, 0.3607843, 1,
1.53898, 1.142347, 3.975785, 1, 0, 0.3529412, 1,
1.560973, 0.3094245, 0.8113204, 1, 0, 0.3490196, 1,
1.588278, -0.2792913, 0.855673, 1, 0, 0.3411765, 1,
1.592348, 1.346059, 0.1539111, 1, 0, 0.3372549, 1,
1.595759, -0.01256319, 2.586877, 1, 0, 0.3294118, 1,
1.598659, 0.5627615, 3.198875, 1, 0, 0.3254902, 1,
1.624288, -0.08106492, 2.723482, 1, 0, 0.3176471, 1,
1.677579, 0.3842308, -0.254086, 1, 0, 0.3137255, 1,
1.679664, -1.835305, 3.943216, 1, 0, 0.3058824, 1,
1.709798, 0.3427273, 0.9438747, 1, 0, 0.2980392, 1,
1.712568, -0.1715425, 1.515065, 1, 0, 0.2941177, 1,
1.735393, 0.913763, 0.9735445, 1, 0, 0.2862745, 1,
1.741452, 0.3781685, 0.7919117, 1, 0, 0.282353, 1,
1.764625, -0.5469172, 2.507385, 1, 0, 0.2745098, 1,
1.781618, -0.39995, 0.8021154, 1, 0, 0.2705882, 1,
1.78578, 1.171875, -0.0323125, 1, 0, 0.2627451, 1,
1.794416, 1.29749, 1.874965, 1, 0, 0.2588235, 1,
1.800712, 0.6641821, 0.5322153, 1, 0, 0.2509804, 1,
1.814939, -1.295456, 3.223439, 1, 0, 0.2470588, 1,
1.819031, 0.2231623, 1.321816, 1, 0, 0.2392157, 1,
1.824565, 1.644811, 0.3809462, 1, 0, 0.2352941, 1,
1.82553, -1.069431, 1.142546, 1, 0, 0.227451, 1,
1.834508, -1.517091, 1.734538, 1, 0, 0.2235294, 1,
1.845718, -1.250681, 2.036005, 1, 0, 0.2156863, 1,
1.846123, -1.19548, 3.284953, 1, 0, 0.2117647, 1,
1.859258, 1.424428, 0.9982978, 1, 0, 0.2039216, 1,
1.871563, -0.661289, 2.145795, 1, 0, 0.1960784, 1,
1.892854, -0.5768321, 1.718372, 1, 0, 0.1921569, 1,
1.894446, 0.6009185, -0.6016859, 1, 0, 0.1843137, 1,
1.898419, -1.504854, 1.978153, 1, 0, 0.1803922, 1,
1.904715, 0.6173619, 1.031526, 1, 0, 0.172549, 1,
1.922335, -1.015947, 1.813502, 1, 0, 0.1686275, 1,
1.961424, -0.0703008, 1.552174, 1, 0, 0.1607843, 1,
1.96229, -0.7983869, 2.693383, 1, 0, 0.1568628, 1,
1.996737, -0.2077321, 1.70565, 1, 0, 0.1490196, 1,
1.999709, 2.731016, 0.3007056, 1, 0, 0.145098, 1,
2.048455, 2.354789, -0.2418658, 1, 0, 0.1372549, 1,
2.070175, -0.03256986, 2.078454, 1, 0, 0.1333333, 1,
2.088789, 1.81375, 0.3868587, 1, 0, 0.1254902, 1,
2.137568, -0.3486705, -0.06723129, 1, 0, 0.1215686, 1,
2.149239, 1.048695, 1.898571, 1, 0, 0.1137255, 1,
2.173718, -1.929935, 4.076383, 1, 0, 0.1098039, 1,
2.24485, -1.283671, 2.95256, 1, 0, 0.1019608, 1,
2.24789, -0.01668612, 0.7938535, 1, 0, 0.09411765, 1,
2.257512, -0.5929939, 2.03146, 1, 0, 0.09019608, 1,
2.304774, -0.7847572, 1.869841, 1, 0, 0.08235294, 1,
2.363301, -0.5050308, 2.809201, 1, 0, 0.07843138, 1,
2.371536, 1.555451, 0.8195964, 1, 0, 0.07058824, 1,
2.37779, 0.7241401, 1.876297, 1, 0, 0.06666667, 1,
2.390897, 0.6663579, 0.3783326, 1, 0, 0.05882353, 1,
2.446113, 0.7079244, 0.5835187, 1, 0, 0.05490196, 1,
2.47595, 1.457367, 1.058489, 1, 0, 0.04705882, 1,
2.517773, -1.446656, 2.264265, 1, 0, 0.04313726, 1,
2.549953, -0.8163325, 2.188439, 1, 0, 0.03529412, 1,
2.667063, 2.634851, 0.070708, 1, 0, 0.03137255, 1,
2.712412, 0.1315513, 2.622316, 1, 0, 0.02352941, 1,
2.720103, 0.09310932, 2.207414, 1, 0, 0.01960784, 1,
3.072522, -0.6529155, 2.093913, 1, 0, 0.01176471, 1,
3.571604, -1.506202, 2.33422, 1, 0, 0.007843138, 1
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
-0.0162499, -4.142226, -7.584206, 0, -0.5, 0.5, 0.5,
-0.0162499, -4.142226, -7.584206, 1, -0.5, 0.5, 0.5,
-0.0162499, -4.142226, -7.584206, 1, 1.5, 0.5, 0.5,
-0.0162499, -4.142226, -7.584206, 0, 1.5, 0.5, 0.5
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
-4.820386, 0.1245679, -7.584206, 0, -0.5, 0.5, 0.5,
-4.820386, 0.1245679, -7.584206, 1, -0.5, 0.5, 0.5,
-4.820386, 0.1245679, -7.584206, 1, 1.5, 0.5, 0.5,
-4.820386, 0.1245679, -7.584206, 0, 1.5, 0.5, 0.5
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
-4.820386, -4.142226, 0.02825761, 0, -0.5, 0.5, 0.5,
-4.820386, -4.142226, 0.02825761, 1, -0.5, 0.5, 0.5,
-4.820386, -4.142226, 0.02825761, 1, 1.5, 0.5, 0.5,
-4.820386, -4.142226, 0.02825761, 0, 1.5, 0.5, 0.5
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
-2, -3.157581, -5.827484,
2, -3.157581, -5.827484,
-2, -3.157581, -5.827484,
-2, -3.321689, -6.120271,
0, -3.157581, -5.827484,
0, -3.321689, -6.120271,
2, -3.157581, -5.827484,
2, -3.321689, -6.120271
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
"0",
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
-2, -3.649904, -6.705845, 0, -0.5, 0.5, 0.5,
-2, -3.649904, -6.705845, 1, -0.5, 0.5, 0.5,
-2, -3.649904, -6.705845, 1, 1.5, 0.5, 0.5,
-2, -3.649904, -6.705845, 0, 1.5, 0.5, 0.5,
0, -3.649904, -6.705845, 0, -0.5, 0.5, 0.5,
0, -3.649904, -6.705845, 1, -0.5, 0.5, 0.5,
0, -3.649904, -6.705845, 1, 1.5, 0.5, 0.5,
0, -3.649904, -6.705845, 0, 1.5, 0.5, 0.5,
2, -3.649904, -6.705845, 0, -0.5, 0.5, 0.5,
2, -3.649904, -6.705845, 1, -0.5, 0.5, 0.5,
2, -3.649904, -6.705845, 1, 1.5, 0.5, 0.5,
2, -3.649904, -6.705845, 0, 1.5, 0.5, 0.5
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
-3.71174, -3, -5.827484,
-3.71174, 3, -5.827484,
-3.71174, -3, -5.827484,
-3.896514, -3, -6.120271,
-3.71174, -2, -5.827484,
-3.896514, -2, -6.120271,
-3.71174, -1, -5.827484,
-3.896514, -1, -6.120271,
-3.71174, 0, -5.827484,
-3.896514, 0, -6.120271,
-3.71174, 1, -5.827484,
-3.896514, 1, -6.120271,
-3.71174, 2, -5.827484,
-3.896514, 2, -6.120271,
-3.71174, 3, -5.827484,
-3.896514, 3, -6.120271
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
-4.266063, -3, -6.705845, 0, -0.5, 0.5, 0.5,
-4.266063, -3, -6.705845, 1, -0.5, 0.5, 0.5,
-4.266063, -3, -6.705845, 1, 1.5, 0.5, 0.5,
-4.266063, -3, -6.705845, 0, 1.5, 0.5, 0.5,
-4.266063, -2, -6.705845, 0, -0.5, 0.5, 0.5,
-4.266063, -2, -6.705845, 1, -0.5, 0.5, 0.5,
-4.266063, -2, -6.705845, 1, 1.5, 0.5, 0.5,
-4.266063, -2, -6.705845, 0, 1.5, 0.5, 0.5,
-4.266063, -1, -6.705845, 0, -0.5, 0.5, 0.5,
-4.266063, -1, -6.705845, 1, -0.5, 0.5, 0.5,
-4.266063, -1, -6.705845, 1, 1.5, 0.5, 0.5,
-4.266063, -1, -6.705845, 0, 1.5, 0.5, 0.5,
-4.266063, 0, -6.705845, 0, -0.5, 0.5, 0.5,
-4.266063, 0, -6.705845, 1, -0.5, 0.5, 0.5,
-4.266063, 0, -6.705845, 1, 1.5, 0.5, 0.5,
-4.266063, 0, -6.705845, 0, 1.5, 0.5, 0.5,
-4.266063, 1, -6.705845, 0, -0.5, 0.5, 0.5,
-4.266063, 1, -6.705845, 1, -0.5, 0.5, 0.5,
-4.266063, 1, -6.705845, 1, 1.5, 0.5, 0.5,
-4.266063, 1, -6.705845, 0, 1.5, 0.5, 0.5,
-4.266063, 2, -6.705845, 0, -0.5, 0.5, 0.5,
-4.266063, 2, -6.705845, 1, -0.5, 0.5, 0.5,
-4.266063, 2, -6.705845, 1, 1.5, 0.5, 0.5,
-4.266063, 2, -6.705845, 0, 1.5, 0.5, 0.5,
-4.266063, 3, -6.705845, 0, -0.5, 0.5, 0.5,
-4.266063, 3, -6.705845, 1, -0.5, 0.5, 0.5,
-4.266063, 3, -6.705845, 1, 1.5, 0.5, 0.5,
-4.266063, 3, -6.705845, 0, 1.5, 0.5, 0.5
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
-3.71174, -3.157581, -4,
-3.71174, -3.157581, 4,
-3.71174, -3.157581, -4,
-3.896514, -3.321689, -4,
-3.71174, -3.157581, -2,
-3.896514, -3.321689, -2,
-3.71174, -3.157581, 0,
-3.896514, -3.321689, 0,
-3.71174, -3.157581, 2,
-3.896514, -3.321689, 2,
-3.71174, -3.157581, 4,
-3.896514, -3.321689, 4
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
-4.266063, -3.649904, -4, 0, -0.5, 0.5, 0.5,
-4.266063, -3.649904, -4, 1, -0.5, 0.5, 0.5,
-4.266063, -3.649904, -4, 1, 1.5, 0.5, 0.5,
-4.266063, -3.649904, -4, 0, 1.5, 0.5, 0.5,
-4.266063, -3.649904, -2, 0, -0.5, 0.5, 0.5,
-4.266063, -3.649904, -2, 1, -0.5, 0.5, 0.5,
-4.266063, -3.649904, -2, 1, 1.5, 0.5, 0.5,
-4.266063, -3.649904, -2, 0, 1.5, 0.5, 0.5,
-4.266063, -3.649904, 0, 0, -0.5, 0.5, 0.5,
-4.266063, -3.649904, 0, 1, -0.5, 0.5, 0.5,
-4.266063, -3.649904, 0, 1, 1.5, 0.5, 0.5,
-4.266063, -3.649904, 0, 0, 1.5, 0.5, 0.5,
-4.266063, -3.649904, 2, 0, -0.5, 0.5, 0.5,
-4.266063, -3.649904, 2, 1, -0.5, 0.5, 0.5,
-4.266063, -3.649904, 2, 1, 1.5, 0.5, 0.5,
-4.266063, -3.649904, 2, 0, 1.5, 0.5, 0.5,
-4.266063, -3.649904, 4, 0, -0.5, 0.5, 0.5,
-4.266063, -3.649904, 4, 1, -0.5, 0.5, 0.5,
-4.266063, -3.649904, 4, 1, 1.5, 0.5, 0.5,
-4.266063, -3.649904, 4, 0, 1.5, 0.5, 0.5
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
-3.71174, -3.157581, -5.827484,
-3.71174, 3.406717, -5.827484,
-3.71174, -3.157581, 5.883999,
-3.71174, 3.406717, 5.883999,
-3.71174, -3.157581, -5.827484,
-3.71174, -3.157581, 5.883999,
-3.71174, 3.406717, -5.827484,
-3.71174, 3.406717, 5.883999,
-3.71174, -3.157581, -5.827484,
3.67924, -3.157581, -5.827484,
-3.71174, -3.157581, 5.883999,
3.67924, -3.157581, 5.883999,
-3.71174, 3.406717, -5.827484,
3.67924, 3.406717, -5.827484,
-3.71174, 3.406717, 5.883999,
3.67924, 3.406717, 5.883999,
3.67924, -3.157581, -5.827484,
3.67924, 3.406717, -5.827484,
3.67924, -3.157581, 5.883999,
3.67924, 3.406717, 5.883999,
3.67924, -3.157581, -5.827484,
3.67924, -3.157581, 5.883999,
3.67924, 3.406717, -5.827484,
3.67924, 3.406717, 5.883999
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
var radius = 8.183597;
var distance = 36.40975;
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
mvMatrix.translate( 0.0162499, -0.1245679, -0.02825761 );
mvMatrix.scale( 1.197171, 1.347938, 0.7555205 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.40975);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
oxolinic_acid_5-ethy<-read.table("oxolinic_acid_5-ethy.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 5 elements
```

```r
x<-oxolinic_acid_5-ethy$V2
```

```
## Error in eval(expr, envir, enclos): object 'oxolinic_acid_5' not found
```

```r
y<-oxolinic_acid_5-ethy$V3
```

```
## Error in eval(expr, envir, enclos): object 'oxolinic_acid_5' not found
```

```r
z<-oxolinic_acid_5-ethy$V4
```

```
## Error in eval(expr, envir, enclos): object 'oxolinic_acid_5' not found
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
-3.604104, -1.652474, -1.014584, 0, 0, 1, 1, 1,
-3.558163, -0.7132199, -1.514414, 1, 0, 0, 1, 1,
-3.515576, 1.325424, -2.899109, 1, 0, 0, 1, 1,
-3.214965, -0.5870166, -5.656928, 1, 0, 0, 1, 1,
-2.921047, 1.213435, -0.3157836, 1, 0, 0, 1, 1,
-2.851911, 0.4397555, -1.294549, 1, 0, 0, 1, 1,
-2.845317, 1.25481, -1.212791, 0, 0, 0, 1, 1,
-2.784243, 0.8233058, -0.4786346, 0, 0, 0, 1, 1,
-2.606268, 0.09009682, -2.521436, 0, 0, 0, 1, 1,
-2.360866, 0.7359812, -1.962752, 0, 0, 0, 1, 1,
-2.349272, 0.3742088, 0.1540946, 0, 0, 0, 1, 1,
-2.341097, -0.1212414, -1.750972, 0, 0, 0, 1, 1,
-2.336628, 0.5420724, -1.805961, 0, 0, 0, 1, 1,
-2.308883, -0.614662, -3.673857, 1, 1, 1, 1, 1,
-2.27175, 0.9915647, -1.703798, 1, 1, 1, 1, 1,
-2.263865, 1.501732, -2.289675, 1, 1, 1, 1, 1,
-2.257745, -1.230861, -2.934541, 1, 1, 1, 1, 1,
-2.223746, 0.3749644, 0.8292191, 1, 1, 1, 1, 1,
-2.169716, 1.393031, -0.7328932, 1, 1, 1, 1, 1,
-2.163838, 0.1560794, -1.978477, 1, 1, 1, 1, 1,
-2.142202, 0.889124, -0.7754922, 1, 1, 1, 1, 1,
-2.104417, 1.568354, -0.4150744, 1, 1, 1, 1, 1,
-2.102445, 0.7448202, -0.5840609, 1, 1, 1, 1, 1,
-2.102228, 0.205314, -0.5791476, 1, 1, 1, 1, 1,
-2.060743, -0.5349628, -1.161747, 1, 1, 1, 1, 1,
-2.054632, 0.3344693, -1.862352, 1, 1, 1, 1, 1,
-2.026478, 1.290622, -2.254573, 1, 1, 1, 1, 1,
-2.017195, -0.4391821, -1.975115, 1, 1, 1, 1, 1,
-2.000404, 0.9346976, 0.4531465, 0, 0, 1, 1, 1,
-1.999793, 1.017675, -1.857814, 1, 0, 0, 1, 1,
-1.972994, 0.8801091, 0.6460496, 1, 0, 0, 1, 1,
-1.927903, 0.05542714, -1.774286, 1, 0, 0, 1, 1,
-1.926027, -1.214693, -1.60996, 1, 0, 0, 1, 1,
-1.920215, 0.5121558, -1.805641, 1, 0, 0, 1, 1,
-1.912786, 0.5767171, -1.781328, 0, 0, 0, 1, 1,
-1.87611, -1.213191, -2.487957, 0, 0, 0, 1, 1,
-1.862216, 2.264646, -0.9429798, 0, 0, 0, 1, 1,
-1.844997, -1.704917, -1.170561, 0, 0, 0, 1, 1,
-1.816895, 1.36523, 0.9016873, 0, 0, 0, 1, 1,
-1.803338, -1.128146, -0.6427529, 0, 0, 0, 1, 1,
-1.797398, 0.4332567, -4.850578, 0, 0, 0, 1, 1,
-1.785173, -0.1111798, -1.182701, 1, 1, 1, 1, 1,
-1.781639, -0.1300754, 0.5724465, 1, 1, 1, 1, 1,
-1.738271, 1.084128, -1.323108, 1, 1, 1, 1, 1,
-1.728252, -1.496096, -2.833081, 1, 1, 1, 1, 1,
-1.707115, 0.6527287, -2.846493, 1, 1, 1, 1, 1,
-1.688866, 0.01635338, -1.562982, 1, 1, 1, 1, 1,
-1.68759, 1.608228, 0.864945, 1, 1, 1, 1, 1,
-1.681352, 1.374322, -0.9482208, 1, 1, 1, 1, 1,
-1.675499, -0.3214684, -0.1149372, 1, 1, 1, 1, 1,
-1.672192, -0.1311602, -2.349075, 1, 1, 1, 1, 1,
-1.664331, 1.756877, -0.09171233, 1, 1, 1, 1, 1,
-1.658205, 0.3559738, -2.54752, 1, 1, 1, 1, 1,
-1.646918, -1.243397, -1.479575, 1, 1, 1, 1, 1,
-1.635325, 0.1044849, -1.676387, 1, 1, 1, 1, 1,
-1.62456, 0.4068108, -0.9442773, 1, 1, 1, 1, 1,
-1.623486, 1.690249, -1.015927, 0, 0, 1, 1, 1,
-1.621561, 0.1565164, -2.434406, 1, 0, 0, 1, 1,
-1.620408, 0.1908899, 0.6594443, 1, 0, 0, 1, 1,
-1.600194, -0.1693511, -1.72434, 1, 0, 0, 1, 1,
-1.59358, 0.7789364, -2.711974, 1, 0, 0, 1, 1,
-1.575562, -1.723144, -3.537295, 1, 0, 0, 1, 1,
-1.5751, -0.5679397, -1.632533, 0, 0, 0, 1, 1,
-1.564839, -0.5137424, -2.467493, 0, 0, 0, 1, 1,
-1.552009, 0.1006137, -2.004502, 0, 0, 0, 1, 1,
-1.550504, 0.6335835, -0.8944622, 0, 0, 0, 1, 1,
-1.531958, -1.105212, -4.121015, 0, 0, 0, 1, 1,
-1.525144, 0.7429517, -0.9169726, 0, 0, 0, 1, 1,
-1.515164, -0.8089542, -1.548478, 0, 0, 0, 1, 1,
-1.503341, 0.3278764, -1.525199, 1, 1, 1, 1, 1,
-1.502375, 0.1819487, -2.346351, 1, 1, 1, 1, 1,
-1.494776, 0.2104192, -0.5364977, 1, 1, 1, 1, 1,
-1.491911, 0.3100361, -1.25186, 1, 1, 1, 1, 1,
-1.490072, -1.114247, -1.926876, 1, 1, 1, 1, 1,
-1.480315, -0.6173497, -0.8017266, 1, 1, 1, 1, 1,
-1.475293, 0.6012229, -3.368566, 1, 1, 1, 1, 1,
-1.474185, 0.09142841, -1.564966, 1, 1, 1, 1, 1,
-1.436081, -0.8772272, -0.3208428, 1, 1, 1, 1, 1,
-1.410158, -1.062698, -1.541745, 1, 1, 1, 1, 1,
-1.403934, -1.257319, -4.124576, 1, 1, 1, 1, 1,
-1.398253, -0.8587004, -0.9511833, 1, 1, 1, 1, 1,
-1.395818, -1.180737, -2.133549, 1, 1, 1, 1, 1,
-1.393632, 0.8307825, -1.553196, 1, 1, 1, 1, 1,
-1.392517, -0.1872691, -3.299117, 1, 1, 1, 1, 1,
-1.391976, 0.291911, -2.585489, 0, 0, 1, 1, 1,
-1.386379, 1.766361, -0.3385883, 1, 0, 0, 1, 1,
-1.385429, -0.03143027, -0.9523396, 1, 0, 0, 1, 1,
-1.377293, 0.803167, -0.2590219, 1, 0, 0, 1, 1,
-1.375852, -0.2055798, -4.163112, 1, 0, 0, 1, 1,
-1.375333, -1.283235, -0.8967968, 1, 0, 0, 1, 1,
-1.375008, -0.09947036, -1.301991, 0, 0, 0, 1, 1,
-1.364171, -0.6213762, -2.811227, 0, 0, 0, 1, 1,
-1.354653, -1.459824, -1.883968, 0, 0, 0, 1, 1,
-1.350759, 0.484775, -3.540751, 0, 0, 0, 1, 1,
-1.350473, 1.429943, -2.01035, 0, 0, 0, 1, 1,
-1.342047, 0.4866415, 0.1612103, 0, 0, 0, 1, 1,
-1.339537, -0.993952, -2.166213, 0, 0, 0, 1, 1,
-1.336621, -0.3216852, -1.574592, 1, 1, 1, 1, 1,
-1.324299, 1.779167, 0.2518991, 1, 1, 1, 1, 1,
-1.317079, -0.8217576, -1.016933, 1, 1, 1, 1, 1,
-1.310007, -0.8125035, -3.356031, 1, 1, 1, 1, 1,
-1.29867, 0.6190093, 0.2936768, 1, 1, 1, 1, 1,
-1.298532, 1.673236, -0.1153172, 1, 1, 1, 1, 1,
-1.297379, -0.6861972, -3.329388, 1, 1, 1, 1, 1,
-1.281902, 0.01439255, -0.4308572, 1, 1, 1, 1, 1,
-1.281414, -0.5769756, -2.535201, 1, 1, 1, 1, 1,
-1.281159, 0.631629, 0.1104981, 1, 1, 1, 1, 1,
-1.27521, 0.9777317, -1.034399, 1, 1, 1, 1, 1,
-1.272449, -0.4550646, -2.950225, 1, 1, 1, 1, 1,
-1.272312, 2.612268, -1.823089, 1, 1, 1, 1, 1,
-1.269849, 1.133803, -1.184852, 1, 1, 1, 1, 1,
-1.260042, 0.3708803, -1.148886, 1, 1, 1, 1, 1,
-1.25025, 0.579627, -1.344314, 0, 0, 1, 1, 1,
-1.248646, 0.106573, -1.86929, 1, 0, 0, 1, 1,
-1.248592, -0.0261347, -1.018849, 1, 0, 0, 1, 1,
-1.235464, -0.06753009, -1.467458, 1, 0, 0, 1, 1,
-1.223108, -1.295195, -3.91632, 1, 0, 0, 1, 1,
-1.22256, -0.8209735, -1.960453, 1, 0, 0, 1, 1,
-1.220679, 0.370775, -1.651388, 0, 0, 0, 1, 1,
-1.218908, 1.476155, 0.6459028, 0, 0, 0, 1, 1,
-1.218719, 0.8768691, -3.359394, 0, 0, 0, 1, 1,
-1.218369, -0.2117421, -1.209772, 0, 0, 0, 1, 1,
-1.214898, 0.6604959, 0.177869, 0, 0, 0, 1, 1,
-1.212361, 1.453116, 0.4015948, 0, 0, 0, 1, 1,
-1.206151, 0.696007, 1.37848, 0, 0, 0, 1, 1,
-1.201224, 0.002953043, -1.858514, 1, 1, 1, 1, 1,
-1.200612, 1.000582, -1.254201, 1, 1, 1, 1, 1,
-1.199667, -0.1528754, -2.301334, 1, 1, 1, 1, 1,
-1.188445, -0.8648963, -0.05875171, 1, 1, 1, 1, 1,
-1.186476, 1.879156, 0.6158025, 1, 1, 1, 1, 1,
-1.178931, -0.6825129, -0.9713697, 1, 1, 1, 1, 1,
-1.172796, -0.5499333, -3.763552, 1, 1, 1, 1, 1,
-1.166593, 0.9106199, -0.7613908, 1, 1, 1, 1, 1,
-1.165888, 0.6639355, -1.995986, 1, 1, 1, 1, 1,
-1.159036, 0.3962254, -0.8959951, 1, 1, 1, 1, 1,
-1.156962, 0.296442, -0.5046509, 1, 1, 1, 1, 1,
-1.142137, 0.1701578, -0.7030782, 1, 1, 1, 1, 1,
-1.141504, 1.265291, 1.089828, 1, 1, 1, 1, 1,
-1.132197, 0.1952417, -0.6095428, 1, 1, 1, 1, 1,
-1.120821, -2.118679, -1.213752, 1, 1, 1, 1, 1,
-1.117064, -0.240116, -2.503314, 0, 0, 1, 1, 1,
-1.112895, -0.5164157, -1.580283, 1, 0, 0, 1, 1,
-1.108614, -0.3594555, -3.674708, 1, 0, 0, 1, 1,
-1.106938, 0.1779878, 0.05885601, 1, 0, 0, 1, 1,
-1.104636, -0.6819385, -3.942223, 1, 0, 0, 1, 1,
-1.104629, 0.2809445, -1.231377, 1, 0, 0, 1, 1,
-1.089856, 1.620099, -0.5545412, 0, 0, 0, 1, 1,
-1.088207, 0.5820913, 0.5538953, 0, 0, 0, 1, 1,
-1.082748, -1.083649, -3.709777, 0, 0, 0, 1, 1,
-1.079562, 1.725398, -0.1128077, 0, 0, 0, 1, 1,
-1.078405, 1.864645, -2.39289, 0, 0, 0, 1, 1,
-1.076988, 1.72198, -0.427629, 0, 0, 0, 1, 1,
-1.075877, 0.4317227, -2.18551, 0, 0, 0, 1, 1,
-1.068599, 2.494308, -0.9932275, 1, 1, 1, 1, 1,
-1.065261, -0.07499098, 0.03317434, 1, 1, 1, 1, 1,
-1.062344, 2.193989, -1.325253, 1, 1, 1, 1, 1,
-1.061949, -0.522759, -1.66805, 1, 1, 1, 1, 1,
-1.061901, -0.7806566, -1.640235, 1, 1, 1, 1, 1,
-1.061388, 1.625765, -0.3335753, 1, 1, 1, 1, 1,
-1.057691, -0.6009312, -0.5894591, 1, 1, 1, 1, 1,
-1.055056, -0.4440693, -0.8249519, 1, 1, 1, 1, 1,
-1.051323, -1.829147, -3.363043, 1, 1, 1, 1, 1,
-1.040503, 0.9846855, 0.5864715, 1, 1, 1, 1, 1,
-1.032468, -1.208156, -2.901182, 1, 1, 1, 1, 1,
-1.031002, 0.5728022, -1.803921, 1, 1, 1, 1, 1,
-1.026778, 0.406997, -1.706319, 1, 1, 1, 1, 1,
-1.011763, 0.9231843, -1.704507, 1, 1, 1, 1, 1,
-1.009957, -0.161823, -0.8566179, 1, 1, 1, 1, 1,
-1.007665, -0.005924025, -2.227415, 0, 0, 1, 1, 1,
-1.006161, -1.065681, -1.337005, 1, 0, 0, 1, 1,
-0.9998529, -0.4423129, 0.153675, 1, 0, 0, 1, 1,
-0.9980575, -1.247399, -3.299397, 1, 0, 0, 1, 1,
-0.9963275, 0.9315622, -2.252419, 1, 0, 0, 1, 1,
-0.9941121, 0.8194251, -0.4546885, 1, 0, 0, 1, 1,
-0.9916917, 0.5969105, -1.327378, 0, 0, 0, 1, 1,
-0.98859, 1.558111, 0.5498986, 0, 0, 0, 1, 1,
-0.9831975, 0.275882, -1.844602, 0, 0, 0, 1, 1,
-0.9740664, 1.711701, -1.277805, 0, 0, 0, 1, 1,
-0.9703761, 0.3666753, -2.514652, 0, 0, 0, 1, 1,
-0.9520476, 0.0760074, -1.390795, 0, 0, 0, 1, 1,
-0.9439494, -1.219979, -2.707185, 0, 0, 0, 1, 1,
-0.9360989, 0.3817167, -2.027058, 1, 1, 1, 1, 1,
-0.9350936, -0.5220701, -2.120607, 1, 1, 1, 1, 1,
-0.9317527, -0.847216, -2.048219, 1, 1, 1, 1, 1,
-0.9263799, -0.1066519, -3.624761, 1, 1, 1, 1, 1,
-0.9254413, -0.2007699, -1.679567, 1, 1, 1, 1, 1,
-0.923025, 0.2870103, -1.775099, 1, 1, 1, 1, 1,
-0.9126037, -1.355214, -2.539975, 1, 1, 1, 1, 1,
-0.9125459, 0.2729019, -1.31489, 1, 1, 1, 1, 1,
-0.9097887, -0.002722979, -3.345422, 1, 1, 1, 1, 1,
-0.9043474, 0.6501265, -1.225509, 1, 1, 1, 1, 1,
-0.9006196, 0.3964063, -0.3742105, 1, 1, 1, 1, 1,
-0.8961721, -0.6788336, -1.629288, 1, 1, 1, 1, 1,
-0.8940075, 0.1703651, -1.596421, 1, 1, 1, 1, 1,
-0.8861735, 0.1925948, -0.3840286, 1, 1, 1, 1, 1,
-0.881064, 1.410007, 0.6545717, 1, 1, 1, 1, 1,
-0.8799663, 1.596861, -0.2659856, 0, 0, 1, 1, 1,
-0.8787869, 0.975936, -0.2129678, 1, 0, 0, 1, 1,
-0.8759286, -0.1059862, -2.213818, 1, 0, 0, 1, 1,
-0.872161, 0.05234962, -1.019555, 1, 0, 0, 1, 1,
-0.8708715, 0.4499737, -2.048513, 1, 0, 0, 1, 1,
-0.8639117, -0.8637025, -2.993365, 1, 0, 0, 1, 1,
-0.8630025, -1.150904, -1.660124, 0, 0, 0, 1, 1,
-0.8615351, -0.6296774, -1.60176, 0, 0, 0, 1, 1,
-0.8580427, -0.3278098, -2.467893, 0, 0, 0, 1, 1,
-0.8553444, -0.5175978, -2.588081, 0, 0, 0, 1, 1,
-0.8536917, -0.2957261, -1.579575, 0, 0, 0, 1, 1,
-0.8476411, -0.1362504, -1.647719, 0, 0, 0, 1, 1,
-0.8464066, -0.09201105, -1.639205, 0, 0, 0, 1, 1,
-0.8438211, 1.260798, -0.4721257, 1, 1, 1, 1, 1,
-0.8390367, 0.1502166, 0.4847315, 1, 1, 1, 1, 1,
-0.8380509, 0.4093666, -0.8269221, 1, 1, 1, 1, 1,
-0.8350582, -1.366398, -3.17456, 1, 1, 1, 1, 1,
-0.831273, 1.05338, -0.6202207, 1, 1, 1, 1, 1,
-0.8308392, -0.60843, -1.581185, 1, 1, 1, 1, 1,
-0.8285303, -0.6592956, -2.588449, 1, 1, 1, 1, 1,
-0.8252249, 0.2696657, -1.910077, 1, 1, 1, 1, 1,
-0.8241139, -1.8952, -3.415769, 1, 1, 1, 1, 1,
-0.8154408, 1.262074, -1.925782, 1, 1, 1, 1, 1,
-0.8153449, 0.006507128, -1.404795, 1, 1, 1, 1, 1,
-0.8139861, -2.247359, -3.640841, 1, 1, 1, 1, 1,
-0.8139598, 1.441974, -1.390919, 1, 1, 1, 1, 1,
-0.8112956, 1.715033, -1.352589, 1, 1, 1, 1, 1,
-0.806375, 0.6799433, 1.253332, 1, 1, 1, 1, 1,
-0.8057961, -1.076185, -1.550397, 0, 0, 1, 1, 1,
-0.8013813, -0.130934, -1.791312, 1, 0, 0, 1, 1,
-0.7993593, 1.100994, -0.6501418, 1, 0, 0, 1, 1,
-0.7930157, -0.2347115, -3.243285, 1, 0, 0, 1, 1,
-0.7893813, -0.6219311, -3.152516, 1, 0, 0, 1, 1,
-0.7891591, 1.179724, 0.3622271, 1, 0, 0, 1, 1,
-0.7796665, -0.5659259, -1.618959, 0, 0, 0, 1, 1,
-0.7789817, -0.587263, -2.129158, 0, 0, 0, 1, 1,
-0.7784881, -0.5038818, -3.822392, 0, 0, 0, 1, 1,
-0.7617186, -0.1423372, -1.383667, 0, 0, 0, 1, 1,
-0.7595061, 2.374721, 0.5588972, 0, 0, 0, 1, 1,
-0.7562921, 0.1076251, 0.4504083, 0, 0, 0, 1, 1,
-0.755608, -0.9589747, -2.679447, 0, 0, 0, 1, 1,
-0.7462912, 0.07234333, -0.808804, 1, 1, 1, 1, 1,
-0.7456955, -0.6757418, -3.575044, 1, 1, 1, 1, 1,
-0.7456101, 0.2730318, -1.874755, 1, 1, 1, 1, 1,
-0.7432401, 0.7259057, -0.04831174, 1, 1, 1, 1, 1,
-0.7381787, -0.07360342, 0.1945849, 1, 1, 1, 1, 1,
-0.7260444, -0.1218018, -2.371499, 1, 1, 1, 1, 1,
-0.7244119, 0.3629642, -0.7823787, 1, 1, 1, 1, 1,
-0.7213953, -0.8661551, -3.794836, 1, 1, 1, 1, 1,
-0.7187907, -1.574763, -3.001663, 1, 1, 1, 1, 1,
-0.7146351, -0.3549336, -2.785077, 1, 1, 1, 1, 1,
-0.7120754, 0.7937858, 2.021051, 1, 1, 1, 1, 1,
-0.7107145, 1.455802, -0.09383837, 1, 1, 1, 1, 1,
-0.7095775, 0.01062107, -2.950881, 1, 1, 1, 1, 1,
-0.7085823, -0.8115063, -3.973079, 1, 1, 1, 1, 1,
-0.7047266, -1.804083, -2.361829, 1, 1, 1, 1, 1,
-0.7025755, 1.01578, -1.657754, 0, 0, 1, 1, 1,
-0.7020125, -1.999225, -2.494885, 1, 0, 0, 1, 1,
-0.6967185, 0.02536455, -1.495779, 1, 0, 0, 1, 1,
-0.6956603, -0.901724, -1.468156, 1, 0, 0, 1, 1,
-0.690726, -1.077878, -1.45435, 1, 0, 0, 1, 1,
-0.6874737, -1.104887, -2.500777, 1, 0, 0, 1, 1,
-0.686797, -0.3358398, -1.814098, 0, 0, 0, 1, 1,
-0.686134, 0.2169149, -0.7706884, 0, 0, 0, 1, 1,
-0.6814361, -0.627259, -1.302989, 0, 0, 0, 1, 1,
-0.6788318, -0.410582, -3.06839, 0, 0, 0, 1, 1,
-0.6788305, 1.375172, -0.5034306, 0, 0, 0, 1, 1,
-0.6717923, -0.2193001, -1.885534, 0, 0, 0, 1, 1,
-0.6714802, -0.4457617, -2.262024, 0, 0, 0, 1, 1,
-0.670448, 0.7976589, -0.9768769, 1, 1, 1, 1, 1,
-0.6693668, 0.6084855, -1.215668, 1, 1, 1, 1, 1,
-0.662331, -0.3656066, -2.247662, 1, 1, 1, 1, 1,
-0.6565593, -0.3114405, -0.6757002, 1, 1, 1, 1, 1,
-0.6561438, 0.1446701, -4.024834, 1, 1, 1, 1, 1,
-0.651197, -0.9972569, -4.249172, 1, 1, 1, 1, 1,
-0.6486666, -0.2842895, -1.463745, 1, 1, 1, 1, 1,
-0.6474233, 0.8958027, -1.016311, 1, 1, 1, 1, 1,
-0.6400315, 1.458499, 1.632737, 1, 1, 1, 1, 1,
-0.6344212, 0.5266303, -1.244365, 1, 1, 1, 1, 1,
-0.6310009, -1.187445, -0.169459, 1, 1, 1, 1, 1,
-0.629935, 0.4710918, -0.2789634, 1, 1, 1, 1, 1,
-0.6194881, 1.593544, -1.689075, 1, 1, 1, 1, 1,
-0.6154966, -0.3869626, -1.624876, 1, 1, 1, 1, 1,
-0.615371, -0.9852279, -2.660102, 1, 1, 1, 1, 1,
-0.6107194, 1.006716, 1.137197, 0, 0, 1, 1, 1,
-0.6096845, 0.5401718, 1.50338, 1, 0, 0, 1, 1,
-0.6072938, -2.368897, -2.912461, 1, 0, 0, 1, 1,
-0.5970748, -1.645815, -2.576336, 1, 0, 0, 1, 1,
-0.5912355, -0.3086117, -2.109934, 1, 0, 0, 1, 1,
-0.5897546, 0.1237176, -0.6704254, 1, 0, 0, 1, 1,
-0.580223, -0.1332925, -0.6306456, 0, 0, 0, 1, 1,
-0.5761316, 0.3787606, 0.508204, 0, 0, 0, 1, 1,
-0.5732965, 0.2139948, -0.7958145, 0, 0, 0, 1, 1,
-0.5710698, -0.3093145, -1.89929, 0, 0, 0, 1, 1,
-0.5598847, -0.2535948, -0.6095029, 0, 0, 0, 1, 1,
-0.5597848, -0.1533244, -1.816558, 0, 0, 0, 1, 1,
-0.5574619, 1.264997, 0.5147428, 0, 0, 0, 1, 1,
-0.5563476, 0.8155561, 0.8645719, 1, 1, 1, 1, 1,
-0.5554797, -0.07802024, -0.3746542, 1, 1, 1, 1, 1,
-0.5502453, 0.9240349, -0.2560375, 1, 1, 1, 1, 1,
-0.5458162, 1.086163, -1.959944, 1, 1, 1, 1, 1,
-0.5455741, 0.7407688, -0.1194648, 1, 1, 1, 1, 1,
-0.541912, -0.8463275, -3.393981, 1, 1, 1, 1, 1,
-0.5351683, -0.1235131, -1.678253, 1, 1, 1, 1, 1,
-0.5348807, 1.419748, -1.620389, 1, 1, 1, 1, 1,
-0.5336369, -0.3903537, -1.6373, 1, 1, 1, 1, 1,
-0.5273812, -0.2335716, -2.652774, 1, 1, 1, 1, 1,
-0.525178, 0.2273791, -1.044501, 1, 1, 1, 1, 1,
-0.5238259, 1.372402, -0.9514428, 1, 1, 1, 1, 1,
-0.5212536, 0.7724485, -2.24961, 1, 1, 1, 1, 1,
-0.5191284, 0.7967978, -1.464239, 1, 1, 1, 1, 1,
-0.5178276, 1.973607, 0.4401015, 1, 1, 1, 1, 1,
-0.5166525, -0.04391879, -0.9446948, 0, 0, 1, 1, 1,
-0.5111082, -1.801761, -2.067003, 1, 0, 0, 1, 1,
-0.5110545, -1.493945, -2.243313, 1, 0, 0, 1, 1,
-0.5090417, -0.9352845, -3.0615, 1, 0, 0, 1, 1,
-0.5085038, -0.8097734, -2.388011, 1, 0, 0, 1, 1,
-0.5045976, 0.6074744, -1.513472, 1, 0, 0, 1, 1,
-0.5042837, -0.6020219, -0.9033955, 0, 0, 0, 1, 1,
-0.4930412, -0.7972479, -2.214647, 0, 0, 0, 1, 1,
-0.4925662, -1.933783, -2.3634, 0, 0, 0, 1, 1,
-0.4908682, -0.3836555, 0.5815951, 0, 0, 0, 1, 1,
-0.4902202, 0.1422731, -2.590013, 0, 0, 0, 1, 1,
-0.4876609, -0.6483598, -1.65997, 0, 0, 0, 1, 1,
-0.4868329, -0.3051458, -1.356409, 0, 0, 0, 1, 1,
-0.4867156, 0.05032955, -1.948134, 1, 1, 1, 1, 1,
-0.486466, -0.2318732, -2.422651, 1, 1, 1, 1, 1,
-0.480997, 1.525024, -1.03382, 1, 1, 1, 1, 1,
-0.475067, -0.2770789, -2.014408, 1, 1, 1, 1, 1,
-0.4693256, -1.758708, -3.289321, 1, 1, 1, 1, 1,
-0.4645641, 1.036523, -1.106996, 1, 1, 1, 1, 1,
-0.4635022, 2.521246, -0.3363372, 1, 1, 1, 1, 1,
-0.4621501, 0.9860266, -1.239613, 1, 1, 1, 1, 1,
-0.4595754, 0.607931, 0.4373897, 1, 1, 1, 1, 1,
-0.4551615, -0.785975, -1.983394, 1, 1, 1, 1, 1,
-0.453743, 0.3042791, 0.1089746, 1, 1, 1, 1, 1,
-0.4485082, -0.08628315, -1.299686, 1, 1, 1, 1, 1,
-0.4414645, -1.056754, -2.644103, 1, 1, 1, 1, 1,
-0.4405746, 3.31112, 0.4261264, 1, 1, 1, 1, 1,
-0.4359286, -0.3675627, -2.279639, 1, 1, 1, 1, 1,
-0.4357449, -0.9771971, -2.294497, 0, 0, 1, 1, 1,
-0.4348821, 1.826785, -1.449524, 1, 0, 0, 1, 1,
-0.4343485, 0.9394596, 0.8449876, 1, 0, 0, 1, 1,
-0.4268848, 1.139393, 0.03509063, 1, 0, 0, 1, 1,
-0.4252623, 1.055014, 0.9133876, 1, 0, 0, 1, 1,
-0.4196708, -1.166518, -1.70671, 1, 0, 0, 1, 1,
-0.4138379, 0.5475361, -1.072242, 0, 0, 0, 1, 1,
-0.4128264, 0.3535593, -1.248985, 0, 0, 0, 1, 1,
-0.4098791, 0.4460601, 0.470021, 0, 0, 0, 1, 1,
-0.4092095, -0.6548076, -4.591156, 0, 0, 0, 1, 1,
-0.403509, 0.1663899, -1.572667, 0, 0, 0, 1, 1,
-0.3974146, -0.5846104, -2.395394, 0, 0, 0, 1, 1,
-0.3964207, 0.6249543, -0.5812619, 0, 0, 0, 1, 1,
-0.3868643, -0.6856595, -1.428373, 1, 1, 1, 1, 1,
-0.3828636, 2.478037, -1.974604, 1, 1, 1, 1, 1,
-0.3596221, 0.8268347, -2.173091, 1, 1, 1, 1, 1,
-0.353561, -0.07902578, -1.471906, 1, 1, 1, 1, 1,
-0.3495505, 2.292036, -0.8389593, 1, 1, 1, 1, 1,
-0.3480931, 0.4071809, 0.7678726, 1, 1, 1, 1, 1,
-0.3430917, -0.731772, -4.017626, 1, 1, 1, 1, 1,
-0.3421252, 1.906554, 0.2687565, 1, 1, 1, 1, 1,
-0.3415014, 0.8618819, -1.391811, 1, 1, 1, 1, 1,
-0.3413647, -0.563266, -2.613344, 1, 1, 1, 1, 1,
-0.3344196, -1.090907, -0.6397209, 1, 1, 1, 1, 1,
-0.3325334, -0.3655536, -3.083608, 1, 1, 1, 1, 1,
-0.3310613, 0.6423123, -1.498149, 1, 1, 1, 1, 1,
-0.3302649, 0.3857055, -0.5871035, 1, 1, 1, 1, 1,
-0.3285316, 0.3813527, -1.523725, 1, 1, 1, 1, 1,
-0.3247865, -0.5188143, -2.405877, 0, 0, 1, 1, 1,
-0.3182962, -0.2223624, -2.88257, 1, 0, 0, 1, 1,
-0.314545, 1.979884, 0.7011077, 1, 0, 0, 1, 1,
-0.3108855, 0.5307915, -2.864979, 1, 0, 0, 1, 1,
-0.3076921, 1.325848, -2.064716, 1, 0, 0, 1, 1,
-0.3065099, 1.033767, -0.6557857, 1, 0, 0, 1, 1,
-0.3057616, 0.4138365, -1.66233, 0, 0, 0, 1, 1,
-0.3045244, 0.5150034, 0.83021, 0, 0, 0, 1, 1,
-0.2996899, -0.1625036, -2.934275, 0, 0, 0, 1, 1,
-0.2943817, -0.1471045, -3.035616, 0, 0, 0, 1, 1,
-0.2940735, 0.9934072, -1.200282, 0, 0, 0, 1, 1,
-0.2901872, -1.266045, -1.483832, 0, 0, 0, 1, 1,
-0.2764507, 0.5332795, 1.036136, 0, 0, 0, 1, 1,
-0.2735028, 0.4859958, -0.9466806, 1, 1, 1, 1, 1,
-0.264688, -0.3100791, -2.200067, 1, 1, 1, 1, 1,
-0.2617621, -1.295691, -2.015224, 1, 1, 1, 1, 1,
-0.2599989, 0.07320438, -1.004632, 1, 1, 1, 1, 1,
-0.2582136, -0.2708518, -2.238719, 1, 1, 1, 1, 1,
-0.2580192, 1.120847, -1.247669, 1, 1, 1, 1, 1,
-0.2546062, 0.7843882, 0.09052575, 1, 1, 1, 1, 1,
-0.2535283, 0.5793468, 0.6593978, 1, 1, 1, 1, 1,
-0.2532832, 1.148923, 0.01756619, 1, 1, 1, 1, 1,
-0.2478108, 0.2445435, -0.4880171, 1, 1, 1, 1, 1,
-0.2457474, 0.2190943, -0.5155191, 1, 1, 1, 1, 1,
-0.2437883, 0.6857546, -0.9227179, 1, 1, 1, 1, 1,
-0.238524, -0.03694128, -0.4199624, 1, 1, 1, 1, 1,
-0.2359087, 1.872762, -0.02173683, 1, 1, 1, 1, 1,
-0.2335558, 1.643063, 1.303639, 1, 1, 1, 1, 1,
-0.2329463, -1.664925, -1.461635, 0, 0, 1, 1, 1,
-0.222227, -0.2074678, -2.09794, 1, 0, 0, 1, 1,
-0.2193994, -0.1510353, -3.710934, 1, 0, 0, 1, 1,
-0.2180294, 0.03583134, -2.105626, 1, 0, 0, 1, 1,
-0.2168751, 0.195454, -0.5422085, 1, 0, 0, 1, 1,
-0.213714, 0.5451574, -0.1376193, 1, 0, 0, 1, 1,
-0.2119965, 0.9597485, 0.1540836, 0, 0, 0, 1, 1,
-0.209597, 0.9354051, -0.2873992, 0, 0, 0, 1, 1,
-0.2063283, -0.4075178, -3.638397, 0, 0, 0, 1, 1,
-0.2054694, -1.651856, -2.547739, 0, 0, 0, 1, 1,
-0.2014261, 1.526897, 0.8650602, 0, 0, 0, 1, 1,
-0.1991315, -0.3529498, -3.724115, 0, 0, 0, 1, 1,
-0.1970118, -1.056148, -3.747732, 0, 0, 0, 1, 1,
-0.1965724, -0.3068865, -1.862525, 1, 1, 1, 1, 1,
-0.19491, 1.566865, -0.3754494, 1, 1, 1, 1, 1,
-0.1943035, 1.552177, -0.2583935, 1, 1, 1, 1, 1,
-0.1929751, 0.2995922, -1.254849, 1, 1, 1, 1, 1,
-0.1917387, -0.04896054, -2.268, 1, 1, 1, 1, 1,
-0.1891544, -0.2856955, -2.244777, 1, 1, 1, 1, 1,
-0.1880144, -0.9932059, -2.36921, 1, 1, 1, 1, 1,
-0.1863091, -0.7971254, -3.666429, 1, 1, 1, 1, 1,
-0.1827079, -1.328612, -3.547231, 1, 1, 1, 1, 1,
-0.1796908, -0.2464383, -2.308398, 1, 1, 1, 1, 1,
-0.1779441, -0.3633301, -1.709319, 1, 1, 1, 1, 1,
-0.1733073, 0.9189232, -1.43526, 1, 1, 1, 1, 1,
-0.1709292, 0.8013096, -0.7191771, 1, 1, 1, 1, 1,
-0.1693502, 0.4648409, 0.5642717, 1, 1, 1, 1, 1,
-0.16166, -1.0265, -2.051745, 1, 1, 1, 1, 1,
-0.1608889, 1.351121, -0.3728991, 0, 0, 1, 1, 1,
-0.1608381, 0.7919024, 0.7820361, 1, 0, 0, 1, 1,
-0.1590892, 1.113398, -1.070167, 1, 0, 0, 1, 1,
-0.1576497, -0.6366612, -2.57409, 1, 0, 0, 1, 1,
-0.1561299, -0.1853804, -2.104253, 1, 0, 0, 1, 1,
-0.1478542, 0.4694813, 0.8725598, 1, 0, 0, 1, 1,
-0.1478118, 0.1058463, -2.679162, 0, 0, 0, 1, 1,
-0.1465153, 0.8987457, -0.6245891, 0, 0, 0, 1, 1,
-0.1443332, -0.553062, -2.604903, 0, 0, 0, 1, 1,
-0.1441515, 0.2502117, -1.568206, 0, 0, 0, 1, 1,
-0.1400426, 1.29638, 0.130385, 0, 0, 0, 1, 1,
-0.1396366, -0.674855, -3.398738, 0, 0, 0, 1, 1,
-0.1393307, -1.509207, -3.949133, 0, 0, 0, 1, 1,
-0.1378256, -0.1543869, -2.062373, 1, 1, 1, 1, 1,
-0.1377863, 0.1530729, -1.414904, 1, 1, 1, 1, 1,
-0.1373713, -0.4695227, -1.775314, 1, 1, 1, 1, 1,
-0.1354101, -2.426113, -4.700088, 1, 1, 1, 1, 1,
-0.1340586, -0.9442175, -3.584936, 1, 1, 1, 1, 1,
-0.1334868, 2.217607, -0.08716054, 1, 1, 1, 1, 1,
-0.1329383, 0.3460897, 1.6171, 1, 1, 1, 1, 1,
-0.1305629, 0.2210457, -2.055661, 1, 1, 1, 1, 1,
-0.1302754, -0.0679986, -1.932283, 1, 1, 1, 1, 1,
-0.1265561, -0.9943781, -3.133839, 1, 1, 1, 1, 1,
-0.1193218, -0.6814922, -0.6847249, 1, 1, 1, 1, 1,
-0.1182132, -0.1239387, -2.316422, 1, 1, 1, 1, 1,
-0.1152829, -0.402653, -2.682458, 1, 1, 1, 1, 1,
-0.1150587, 0.2798129, -0.3242916, 1, 1, 1, 1, 1,
-0.1135121, -1.473948, -2.957789, 1, 1, 1, 1, 1,
-0.1076834, 0.3803715, -0.840884, 0, 0, 1, 1, 1,
-0.1063594, -0.7279234, -3.190021, 1, 0, 0, 1, 1,
-0.1039168, -1.257677, -4.510327, 1, 0, 0, 1, 1,
-0.1030119, 0.7364687, 0.5934492, 1, 0, 0, 1, 1,
-0.1006386, 1.710736, 1.349724, 1, 0, 0, 1, 1,
-0.09887923, -0.6890224, -3.596255, 1, 0, 0, 1, 1,
-0.09643693, 1.088224, 0.07393551, 0, 0, 0, 1, 1,
-0.09444167, -0.03711965, -2.092542, 0, 0, 0, 1, 1,
-0.08975695, 1.39857, -1.24681, 0, 0, 0, 1, 1,
-0.0890578, -1.304048, -3.102484, 0, 0, 0, 1, 1,
-0.08557903, -1.294244, -4.375185, 0, 0, 0, 1, 1,
-0.08230854, 0.3914868, 0.4825385, 0, 0, 0, 1, 1,
-0.07806911, 0.8301884, -0.5365375, 0, 0, 0, 1, 1,
-0.07686906, 0.2169284, -1.82732, 1, 1, 1, 1, 1,
-0.0539158, 1.577816, -0.337229, 1, 1, 1, 1, 1,
-0.04971735, 0.07074551, 1.330278, 1, 1, 1, 1, 1,
-0.0455325, 0.8954975, 0.6895496, 1, 1, 1, 1, 1,
-0.03800425, 0.5075781, 0.9528149, 1, 1, 1, 1, 1,
-0.03792048, -0.02308497, -3.558455, 1, 1, 1, 1, 1,
-0.03470839, -0.1205207, -3.401847, 1, 1, 1, 1, 1,
-0.03226116, 1.075754, 0.4584875, 1, 1, 1, 1, 1,
-0.03092431, -0.2076344, -2.870287, 1, 1, 1, 1, 1,
-0.0282625, 0.7220795, 0.3124425, 1, 1, 1, 1, 1,
-0.0252072, -0.1698803, -2.604065, 1, 1, 1, 1, 1,
-0.01415401, 0.921499, 0.3160169, 1, 1, 1, 1, 1,
-0.01144348, 0.7105463, -2.484449, 1, 1, 1, 1, 1,
-0.006446624, 0.02053798, -0.5268289, 1, 1, 1, 1, 1,
-0.00600599, -0.04037239, -4.222329, 1, 1, 1, 1, 1,
-0.005423804, -0.8208711, -5.015156, 0, 0, 1, 1, 1,
-0.004798967, 0.3034813, -0.208688, 1, 0, 0, 1, 1,
-0.002463485, -0.7007024, -3.692369, 1, 0, 0, 1, 1,
-0.001885434, -0.0409363, -3.53125, 1, 0, 0, 1, 1,
-0.0001250624, 1.268387, 1.45738, 1, 0, 0, 1, 1,
0.004515882, -0.7709861, 3.234924, 1, 0, 0, 1, 1,
0.005665624, -0.918034, 1.098529, 0, 0, 0, 1, 1,
0.006227205, -0.273948, 3.264241, 0, 0, 0, 1, 1,
0.008731341, -1.181287, 3.628737, 0, 0, 0, 1, 1,
0.01430117, 0.8196995, 1.059929, 0, 0, 0, 1, 1,
0.01796142, 0.2559854, 0.3724446, 0, 0, 0, 1, 1,
0.01896002, -0.7807331, 2.077873, 0, 0, 0, 1, 1,
0.02097622, 0.1473548, -0.2391638, 0, 0, 0, 1, 1,
0.02100524, -0.05359561, 3.172406, 1, 1, 1, 1, 1,
0.02160219, -0.1589393, 2.669489, 1, 1, 1, 1, 1,
0.02275607, 1.621081, 1.6418, 1, 1, 1, 1, 1,
0.02501375, -0.4121583, 3.254044, 1, 1, 1, 1, 1,
0.02551474, -0.1086461, 1.97193, 1, 1, 1, 1, 1,
0.02795103, -0.9671848, 4.73504, 1, 1, 1, 1, 1,
0.02945332, 0.7330651, -1.271051, 1, 1, 1, 1, 1,
0.03329222, 0.9159088, -0.8503379, 1, 1, 1, 1, 1,
0.03561705, 1.401591, -0.9388568, 1, 1, 1, 1, 1,
0.0402819, 0.08686803, 0.5143555, 1, 1, 1, 1, 1,
0.04041813, -0.0006394198, 2.470422, 1, 1, 1, 1, 1,
0.04104345, -0.2177972, 4.01472, 1, 1, 1, 1, 1,
0.04309044, -0.3742769, 2.536232, 1, 1, 1, 1, 1,
0.04439326, 1.122711, -0.1754752, 1, 1, 1, 1, 1,
0.04509762, 1.165755, -0.08260015, 1, 1, 1, 1, 1,
0.04643022, -0.5039656, 2.360307, 0, 0, 1, 1, 1,
0.04650094, 1.030016, -0.004018609, 1, 0, 0, 1, 1,
0.04811847, -0.6761872, 2.604938, 1, 0, 0, 1, 1,
0.04864715, 1.055218, 0.5030029, 1, 0, 0, 1, 1,
0.05371147, -2.849084, 3.658768, 1, 0, 0, 1, 1,
0.05379761, 0.7137097, 0.2467343, 1, 0, 0, 1, 1,
0.05531923, -0.2161479, 3.122073, 0, 0, 0, 1, 1,
0.05999339, 0.9928852, 0.3372533, 0, 0, 0, 1, 1,
0.06036671, -0.2115906, 2.5522, 0, 0, 0, 1, 1,
0.06141957, 0.07547384, 1.083048, 0, 0, 0, 1, 1,
0.06562965, -0.6276225, 3.658345, 0, 0, 0, 1, 1,
0.06588322, -0.8608159, 5.713443, 0, 0, 0, 1, 1,
0.07501371, -0.5908374, 2.26355, 0, 0, 0, 1, 1,
0.07510603, 0.6441246, -0.494418, 1, 1, 1, 1, 1,
0.07518288, -1.45425, 4.166714, 1, 1, 1, 1, 1,
0.0760129, 0.01025579, 1.116173, 1, 1, 1, 1, 1,
0.07626154, 1.339358, 0.801935, 1, 1, 1, 1, 1,
0.07656172, 0.07164478, 0.3371695, 1, 1, 1, 1, 1,
0.07779794, -1.470523, 0.8285512, 1, 1, 1, 1, 1,
0.08117362, 0.3650603, 0.2962337, 1, 1, 1, 1, 1,
0.08165717, -0.3123234, 3.375888, 1, 1, 1, 1, 1,
0.08335448, -1.318892, 3.933015, 1, 1, 1, 1, 1,
0.08347631, -2.713712, 3.577749, 1, 1, 1, 1, 1,
0.08415685, 0.7601547, -0.2017159, 1, 1, 1, 1, 1,
0.09460224, -0.5349997, 0.8678903, 1, 1, 1, 1, 1,
0.09600302, -2.010398, 4.026679, 1, 1, 1, 1, 1,
0.09857149, 0.7758352, 1.269003, 1, 1, 1, 1, 1,
0.1035955, 2.253247, -0.7017691, 1, 1, 1, 1, 1,
0.1078733, 0.7736802, 0.85857, 0, 0, 1, 1, 1,
0.1127411, -0.1851732, 1.152643, 1, 0, 0, 1, 1,
0.1132112, 0.1965511, 0.4074945, 1, 0, 0, 1, 1,
0.1135276, -0.2198911, 3.185942, 1, 0, 0, 1, 1,
0.1172214, -0.9729402, 1.389954, 1, 0, 0, 1, 1,
0.1173342, 0.8082288, 2.353288, 1, 0, 0, 1, 1,
0.1174208, -1.494195, 3.471706, 0, 0, 0, 1, 1,
0.119508, -2.409929, 4.416377, 0, 0, 0, 1, 1,
0.1232031, -1.048534, 2.89318, 0, 0, 0, 1, 1,
0.133645, 0.8177931, -0.1700585, 0, 0, 0, 1, 1,
0.136858, -0.8994, 1.369469, 0, 0, 0, 1, 1,
0.1382291, 1.31198, -0.05624702, 0, 0, 0, 1, 1,
0.1400825, 0.2191018, 1.358126, 0, 0, 0, 1, 1,
0.1409723, -1.004729, 3.9097, 1, 1, 1, 1, 1,
0.1411066, 0.3527295, 1.791218, 1, 1, 1, 1, 1,
0.145647, 1.603783, -0.9034384, 1, 1, 1, 1, 1,
0.1482857, 0.1225333, 0.6779762, 1, 1, 1, 1, 1,
0.1497238, 0.1634668, -0.3959563, 1, 1, 1, 1, 1,
0.1532143, -1.723271, 3.883713, 1, 1, 1, 1, 1,
0.1536754, 0.6919677, 0.08389837, 1, 1, 1, 1, 1,
0.1541733, 0.9754407, 0.2192927, 1, 1, 1, 1, 1,
0.1548432, -1.71981, 3.70647, 1, 1, 1, 1, 1,
0.1549369, 0.4858977, -0.3649169, 1, 1, 1, 1, 1,
0.1555353, 1.590948, 1.064238, 1, 1, 1, 1, 1,
0.1613416, 0.02340989, 1.365482, 1, 1, 1, 1, 1,
0.1631808, 0.3069963, 0.9437286, 1, 1, 1, 1, 1,
0.1653987, 0.2942233, 2.70565, 1, 1, 1, 1, 1,
0.1694988, 0.09447564, 1.170287, 1, 1, 1, 1, 1,
0.170321, -0.3366212, 2.445974, 0, 0, 1, 1, 1,
0.1708005, -0.3509709, 1.132427, 1, 0, 0, 1, 1,
0.170948, 0.5157167, 0.7666755, 1, 0, 0, 1, 1,
0.1724232, 0.7124508, 1.289826, 1, 0, 0, 1, 1,
0.1751958, -0.0886733, 1.916505, 1, 0, 0, 1, 1,
0.1761906, 0.3381075, 1.614783, 1, 0, 0, 1, 1,
0.1813548, 0.250722, 0.5166591, 0, 0, 0, 1, 1,
0.1824332, -0.09682369, 3.139642, 0, 0, 0, 1, 1,
0.1840078, -1.24998, 3.213925, 0, 0, 0, 1, 1,
0.188987, -0.3993188, 3.058519, 0, 0, 0, 1, 1,
0.1947642, 0.09194691, 1.579474, 0, 0, 0, 1, 1,
0.1955791, 0.5256247, 2.162717, 0, 0, 0, 1, 1,
0.1974335, -0.4429786, 2.516992, 0, 0, 0, 1, 1,
0.1987063, 2.964892, -1.569595, 1, 1, 1, 1, 1,
0.1990912, -1.531345, 3.644283, 1, 1, 1, 1, 1,
0.2007091, 1.52458, -0.8395005, 1, 1, 1, 1, 1,
0.2032408, 0.4705738, -0.9441642, 1, 1, 1, 1, 1,
0.2036264, 0.16336, 1.04241, 1, 1, 1, 1, 1,
0.2058367, -1.462226, 1.601423, 1, 1, 1, 1, 1,
0.2142785, -1.577799, 2.502828, 1, 1, 1, 1, 1,
0.216072, 2.055547, 0.2268689, 1, 1, 1, 1, 1,
0.2228021, -0.1945344, 3.343395, 1, 1, 1, 1, 1,
0.224055, -0.9739962, 3.129978, 1, 1, 1, 1, 1,
0.2284289, -0.5468138, 2.735873, 1, 1, 1, 1, 1,
0.2300513, -0.9751899, 2.570586, 1, 1, 1, 1, 1,
0.2307125, 0.4106632, 1.289756, 1, 1, 1, 1, 1,
0.2325589, 2.339512, -0.1146227, 1, 1, 1, 1, 1,
0.2361194, 0.1569088, 1.710164, 1, 1, 1, 1, 1,
0.2452878, -1.248601, 2.1514, 0, 0, 1, 1, 1,
0.2455353, 0.7841089, -0.3909469, 1, 0, 0, 1, 1,
0.246574, -0.1306154, 0.4688944, 1, 0, 0, 1, 1,
0.2502809, -1.222666, 3.230949, 1, 0, 0, 1, 1,
0.2543053, -0.1573927, 2.068522, 1, 0, 0, 1, 1,
0.2566838, -1.593308, 2.304445, 1, 0, 0, 1, 1,
0.2568406, 0.7379767, -0.2110184, 0, 0, 0, 1, 1,
0.2612488, 0.2180285, 0.4137672, 0, 0, 0, 1, 1,
0.2636977, -0.1729767, 1.814151, 0, 0, 0, 1, 1,
0.2647696, 0.932681, -0.08447053, 0, 0, 0, 1, 1,
0.2669393, -0.02068705, 0.6240334, 0, 0, 0, 1, 1,
0.2673115, 0.07166949, 2.031435, 0, 0, 0, 1, 1,
0.2683522, -1.723535, 3.58059, 0, 0, 0, 1, 1,
0.2696206, 0.6437411, 0.4199659, 1, 1, 1, 1, 1,
0.2728019, -1.008053, 3.528823, 1, 1, 1, 1, 1,
0.2750853, -0.5844997, 4.269063, 1, 1, 1, 1, 1,
0.2755424, -1.247209, 0.8828551, 1, 1, 1, 1, 1,
0.2807924, 0.2908963, 1.025754, 1, 1, 1, 1, 1,
0.2822942, 0.8865032, -0.7722433, 1, 1, 1, 1, 1,
0.2827932, 1.699677, 1.051631, 1, 1, 1, 1, 1,
0.2891042, -0.9413775, 3.345881, 1, 1, 1, 1, 1,
0.2906376, 0.3976418, 1.233938, 1, 1, 1, 1, 1,
0.2930247, -0.5281214, 0.7148343, 1, 1, 1, 1, 1,
0.2933612, 0.02592598, 1.327051, 1, 1, 1, 1, 1,
0.2935882, 0.7642565, 0.4402361, 1, 1, 1, 1, 1,
0.2947903, -0.7703168, 2.368406, 1, 1, 1, 1, 1,
0.3028468, -0.9771166, 1.512813, 1, 1, 1, 1, 1,
0.3042332, -1.379329, 0.8070651, 1, 1, 1, 1, 1,
0.3045579, -1.367351, 2.452051, 0, 0, 1, 1, 1,
0.3047096, 0.01151577, 1.035818, 1, 0, 0, 1, 1,
0.3135897, -0.4323877, 1.931962, 1, 0, 0, 1, 1,
0.3171026, -0.5591219, 3.46177, 1, 0, 0, 1, 1,
0.3181873, 1.551952, -0.6980935, 1, 0, 0, 1, 1,
0.3253469, 0.2706771, 0.1433272, 1, 0, 0, 1, 1,
0.3258095, 0.3616837, 1.415304, 0, 0, 0, 1, 1,
0.3282217, 0.8497506, 0.7171991, 0, 0, 0, 1, 1,
0.3316863, -0.1120933, 1.192582, 0, 0, 0, 1, 1,
0.3330904, -0.5799623, 3.668096, 0, 0, 0, 1, 1,
0.3330987, -1.461591, 4.475023, 0, 0, 0, 1, 1,
0.3334781, 0.8900934, 0.911181, 0, 0, 0, 1, 1,
0.3492245, -0.422385, 3.210037, 0, 0, 0, 1, 1,
0.3527668, -0.946981, 3.428261, 1, 1, 1, 1, 1,
0.3532867, -0.2363474, 2.55563, 1, 1, 1, 1, 1,
0.3548539, 1.948774, 1.152671, 1, 1, 1, 1, 1,
0.3584782, 0.8435436, 1.844178, 1, 1, 1, 1, 1,
0.359225, 1.329982, 1.521309, 1, 1, 1, 1, 1,
0.3609696, 1.166113, 1.29006, 1, 1, 1, 1, 1,
0.361467, 1.187789, 0.1753197, 1, 1, 1, 1, 1,
0.3625097, 0.6988891, 0.693636, 1, 1, 1, 1, 1,
0.3661736, 1.380169, -0.5481328, 1, 1, 1, 1, 1,
0.3667477, 0.6964065, 1.587739, 1, 1, 1, 1, 1,
0.3686379, 0.03879591, 1.261322, 1, 1, 1, 1, 1,
0.3688878, -0.865797, 4.721234, 1, 1, 1, 1, 1,
0.375214, 0.4503459, 0.2522323, 1, 1, 1, 1, 1,
0.375243, 0.1885985, 0.03272783, 1, 1, 1, 1, 1,
0.3786723, -0.4150522, 1.751694, 1, 1, 1, 1, 1,
0.3804174, -0.5957909, 4.291981, 0, 0, 1, 1, 1,
0.380823, -1.958018, 4.047906, 1, 0, 0, 1, 1,
0.3810954, -0.9641002, 2.585237, 1, 0, 0, 1, 1,
0.3880087, 0.5517307, -0.7755424, 1, 0, 0, 1, 1,
0.3889347, 0.8472764, -0.6269835, 1, 0, 0, 1, 1,
0.3995546, -0.9056846, 2.756895, 1, 0, 0, 1, 1,
0.4034127, 0.8838745, 0.585107, 0, 0, 0, 1, 1,
0.4071504, -0.5913966, 3.002609, 0, 0, 0, 1, 1,
0.4088023, -0.3228126, 2.4247, 0, 0, 0, 1, 1,
0.4094328, -0.05620479, 1.507838, 0, 0, 0, 1, 1,
0.4110078, -0.796252, 3.037454, 0, 0, 0, 1, 1,
0.4120238, 0.707924, -0.5799913, 0, 0, 0, 1, 1,
0.416429, 0.2723366, 1.835138, 0, 0, 0, 1, 1,
0.4213572, -0.3468733, 2.265851, 1, 1, 1, 1, 1,
0.4234509, 2.233041, 1.156183, 1, 1, 1, 1, 1,
0.4237019, 0.6639482, 0.7678254, 1, 1, 1, 1, 1,
0.431524, 0.9280972, 0.4584665, 1, 1, 1, 1, 1,
0.4317465, -0.714835, 3.325038, 1, 1, 1, 1, 1,
0.4376434, 0.7881824, 1.836963, 1, 1, 1, 1, 1,
0.4378621, -0.9645236, 1.989631, 1, 1, 1, 1, 1,
0.4381545, 0.1160683, 1.490193, 1, 1, 1, 1, 1,
0.4389398, 0.6655166, 1.929036, 1, 1, 1, 1, 1,
0.4437486, 1.064071, 0.5022388, 1, 1, 1, 1, 1,
0.4527069, 0.7720561, 0.7203042, 1, 1, 1, 1, 1,
0.4553248, -0.4351751, 2.510233, 1, 1, 1, 1, 1,
0.456912, 0.3213706, 0.9956685, 1, 1, 1, 1, 1,
0.4623482, 1.338141, -0.5842356, 1, 1, 1, 1, 1,
0.4653012, -0.7267665, 2.464743, 1, 1, 1, 1, 1,
0.4653689, 1.047899, 0.7209771, 0, 0, 1, 1, 1,
0.4724877, -0.01782626, 2.847167, 1, 0, 0, 1, 1,
0.4736312, 1.698481, 1.161262, 1, 0, 0, 1, 1,
0.4760525, 0.4253093, 1.29045, 1, 0, 0, 1, 1,
0.4804082, 0.3918402, -0.7146794, 1, 0, 0, 1, 1,
0.4844687, 0.8355399, 0.6101862, 1, 0, 0, 1, 1,
0.4857981, 0.4343805, -0.1097367, 0, 0, 0, 1, 1,
0.4881942, 0.5907088, 2.003388, 0, 0, 0, 1, 1,
0.4936902, -0.2251888, 3.02461, 0, 0, 0, 1, 1,
0.4980255, -0.8419276, 2.839463, 0, 0, 0, 1, 1,
0.5001996, 1.866064, 0.9002067, 0, 0, 0, 1, 1,
0.5019785, -1.907024, 3.9355, 0, 0, 0, 1, 1,
0.5023355, -0.3619712, 3.402399, 0, 0, 0, 1, 1,
0.5029166, 1.625809, -0.6296007, 1, 1, 1, 1, 1,
0.5053579, 0.6577418, 1.853453, 1, 1, 1, 1, 1,
0.5094121, -1.310076, 3.499308, 1, 1, 1, 1, 1,
0.5097655, 0.7488809, 0.358121, 1, 1, 1, 1, 1,
0.5114316, -0.1483968, 2.141056, 1, 1, 1, 1, 1,
0.5148079, -0.5231006, 2.354035, 1, 1, 1, 1, 1,
0.5188475, 0.1077616, 1.452502, 1, 1, 1, 1, 1,
0.5189629, -1.19238, 2.120614, 1, 1, 1, 1, 1,
0.5205827, 0.8882205, -1.200907, 1, 1, 1, 1, 1,
0.5217851, -1.091599, 4.057508, 1, 1, 1, 1, 1,
0.5244569, 0.3009429, 1.090483, 1, 1, 1, 1, 1,
0.5253535, -1.688593, 3.360937, 1, 1, 1, 1, 1,
0.5313716, 0.4545236, 0.1163579, 1, 1, 1, 1, 1,
0.5334542, 0.5545452, 1.095707, 1, 1, 1, 1, 1,
0.5381454, 0.7180725, 2.023852, 1, 1, 1, 1, 1,
0.5383136, 0.9579059, 1.546503, 0, 0, 1, 1, 1,
0.5395024, 0.7507371, 0.6132199, 1, 0, 0, 1, 1,
0.541133, 2.057434, 0.8769971, 1, 0, 0, 1, 1,
0.541533, -0.03452088, 2.184956, 1, 0, 0, 1, 1,
0.5418941, 0.8855117, -0.02986666, 1, 0, 0, 1, 1,
0.5423658, -1.376819, 3.066019, 1, 0, 0, 1, 1,
0.5500785, 0.30075, 1.164117, 0, 0, 0, 1, 1,
0.550259, -0.1797323, 2.042041, 0, 0, 0, 1, 1,
0.5506647, 0.5058411, 1.448433, 0, 0, 0, 1, 1,
0.5515777, 1.559051, 0.1075659, 0, 0, 0, 1, 1,
0.5596881, -0.8344853, 4.021395, 0, 0, 0, 1, 1,
0.5608774, -0.0638044, 1.418339, 0, 0, 0, 1, 1,
0.5664105, 2.071291, 1.333814, 0, 0, 0, 1, 1,
0.5746461, 0.1756967, 0.6545815, 1, 1, 1, 1, 1,
0.5776416, 0.2923819, 0.179646, 1, 1, 1, 1, 1,
0.5824893, 0.1509352, 2.838943, 1, 1, 1, 1, 1,
0.584986, 0.2076698, -0.08312333, 1, 1, 1, 1, 1,
0.5952459, -1.549003, 2.025311, 1, 1, 1, 1, 1,
0.5981139, -1.39273, 3.094968, 1, 1, 1, 1, 1,
0.6001534, 0.1922084, 0.03623415, 1, 1, 1, 1, 1,
0.6043736, 0.5736642, -1.136695, 1, 1, 1, 1, 1,
0.6054817, -1.547247, 3.850688, 1, 1, 1, 1, 1,
0.6101054, 0.8221738, 0.8313172, 1, 1, 1, 1, 1,
0.6114323, -0.02111213, 2.653863, 1, 1, 1, 1, 1,
0.6117391, 0.4693752, 1.383312, 1, 1, 1, 1, 1,
0.6138644, 1.846694, 0.0004107401, 1, 1, 1, 1, 1,
0.6190799, 1.328837, 0.6826077, 1, 1, 1, 1, 1,
0.6212999, 0.5852036, 1.203319, 1, 1, 1, 1, 1,
0.6277118, -0.1657262, 1.845162, 0, 0, 1, 1, 1,
0.6295619, 0.1287363, 1.32142, 1, 0, 0, 1, 1,
0.6306139, 0.2522059, 3.54995, 1, 0, 0, 1, 1,
0.6309553, -1.098294, 2.047916, 1, 0, 0, 1, 1,
0.6343094, 1.293803, 0.3592233, 1, 0, 0, 1, 1,
0.6545827, -0.916861, 2.345691, 1, 0, 0, 1, 1,
0.657016, -0.05140662, 1.876382, 0, 0, 0, 1, 1,
0.6585605, -1.618006, 3.018528, 0, 0, 0, 1, 1,
0.659742, 0.4543864, 1.248929, 0, 0, 0, 1, 1,
0.6600778, -0.4197564, 1.017057, 0, 0, 0, 1, 1,
0.6644832, -0.08890481, 2.229728, 0, 0, 0, 1, 1,
0.668536, -0.2997527, -0.3288971, 0, 0, 0, 1, 1,
0.6696613, -1.550577, 2.710199, 0, 0, 0, 1, 1,
0.6732144, -1.162698, 2.891773, 1, 1, 1, 1, 1,
0.6738922, 1.029824, 1.538849, 1, 1, 1, 1, 1,
0.67818, -0.9125921, 3.628266, 1, 1, 1, 1, 1,
0.68111, 1.292342, 0.4926503, 1, 1, 1, 1, 1,
0.6811292, 0.4225926, 0.9518781, 1, 1, 1, 1, 1,
0.6848199, -1.664981, 0.2331752, 1, 1, 1, 1, 1,
0.6861809, -0.7499145, 3.159464, 1, 1, 1, 1, 1,
0.68798, -1.072729, 2.484989, 1, 1, 1, 1, 1,
0.6899979, 0.701754, 1.844694, 1, 1, 1, 1, 1,
0.6922467, -0.4247275, 2.240754, 1, 1, 1, 1, 1,
0.6949199, 2.315365, -0.903566, 1, 1, 1, 1, 1,
0.697322, -1.110558, 1.314685, 1, 1, 1, 1, 1,
0.701057, 1.061837, 1.012493, 1, 1, 1, 1, 1,
0.7021171, -0.4845795, 2.493907, 1, 1, 1, 1, 1,
0.7025095, -2.883507, 4.661877, 1, 1, 1, 1, 1,
0.702582, -1.030649, 3.066991, 0, 0, 1, 1, 1,
0.704017, -0.3295974, 3.288352, 1, 0, 0, 1, 1,
0.7088276, 0.2654993, 0.8560667, 1, 0, 0, 1, 1,
0.7262907, 0.1494415, 2.797622, 1, 0, 0, 1, 1,
0.7381744, -0.6205034, 1.527191, 1, 0, 0, 1, 1,
0.7417293, -0.4508233, 2.443852, 1, 0, 0, 1, 1,
0.74248, 0.2302122, 1.852885, 0, 0, 0, 1, 1,
0.7425497, 1.054702, 1.372239, 0, 0, 0, 1, 1,
0.7476988, -1.936903, 2.930239, 0, 0, 0, 1, 1,
0.7484479, -0.5504429, 4.215559, 0, 0, 0, 1, 1,
0.7493696, 0.4013782, 2.891975, 0, 0, 0, 1, 1,
0.7518918, 0.6382791, 2.050273, 0, 0, 0, 1, 1,
0.7563904, 1.529736, -0.9413357, 0, 0, 0, 1, 1,
0.7625226, 0.4098462, 2.367333, 1, 1, 1, 1, 1,
0.7653066, 0.6053098, -0.1417356, 1, 1, 1, 1, 1,
0.766193, 0.7166229, 0.8175035, 1, 1, 1, 1, 1,
0.7662177, -1.574935, 3.587896, 1, 1, 1, 1, 1,
0.7693174, -0.7577136, 0.8197761, 1, 1, 1, 1, 1,
0.7749757, -0.4636416, 2.038423, 1, 1, 1, 1, 1,
0.7750033, 0.8068744, 0.7425166, 1, 1, 1, 1, 1,
0.7778407, -0.8092048, 2.181217, 1, 1, 1, 1, 1,
0.7802671, -0.5775027, 2.265962, 1, 1, 1, 1, 1,
0.7825981, -1.193573, 2.550271, 1, 1, 1, 1, 1,
0.783628, 0.3175013, 0.7251645, 1, 1, 1, 1, 1,
0.7848635, 0.1630518, 0.4920183, 1, 1, 1, 1, 1,
0.7911111, 1.477178, 0.5315647, 1, 1, 1, 1, 1,
0.7985778, 1.318866, 0.139245, 1, 1, 1, 1, 1,
0.8052456, -0.0816885, 2.727838, 1, 1, 1, 1, 1,
0.8066995, -1.300961, 3.627153, 0, 0, 1, 1, 1,
0.8068179, -0.8777257, 1.906367, 1, 0, 0, 1, 1,
0.809843, 0.8553156, 0.1770825, 1, 0, 0, 1, 1,
0.8103012, -0.2459512, 2.126807, 1, 0, 0, 1, 1,
0.8109598, -1.708672, 4.20536, 1, 0, 0, 1, 1,
0.8171458, -0.238374, 2.19806, 1, 0, 0, 1, 1,
0.8259836, 0.9384871, -0.0522849, 0, 0, 0, 1, 1,
0.8275056, -0.009833837, 4.077872, 0, 0, 0, 1, 1,
0.8284215, -2.159866, 3.996942, 0, 0, 0, 1, 1,
0.828905, 1.458584, 0.6744037, 0, 0, 0, 1, 1,
0.8292379, -0.4787398, 2.076481, 0, 0, 0, 1, 1,
0.834519, 0.3928758, 0.1487639, 0, 0, 0, 1, 1,
0.8350841, -1.099926, 4.830702, 0, 0, 0, 1, 1,
0.8413385, -1.6586, 3.746666, 1, 1, 1, 1, 1,
0.8420421, 0.1666172, 1.177042, 1, 1, 1, 1, 1,
0.8478757, 0.8520675, -0.7026325, 1, 1, 1, 1, 1,
0.8481468, -1.82773, 3.645038, 1, 1, 1, 1, 1,
0.8563243, 0.7639593, -1.15379, 1, 1, 1, 1, 1,
0.8653288, -1.925985, 2.599457, 1, 1, 1, 1, 1,
0.8693045, 0.4763118, 1.436544, 1, 1, 1, 1, 1,
0.8715115, 1.372216, 1.763656, 1, 1, 1, 1, 1,
0.8728327, 0.5046069, 2.171699, 1, 1, 1, 1, 1,
0.8757706, 0.07731198, 1.27449, 1, 1, 1, 1, 1,
0.8854925, -0.9690059, 2.122324, 1, 1, 1, 1, 1,
0.8888973, 0.06395071, 3.5308, 1, 1, 1, 1, 1,
0.8902719, -0.2381455, 1.160533, 1, 1, 1, 1, 1,
0.8910626, 0.8181556, 1.291836, 1, 1, 1, 1, 1,
0.8912096, 1.065112, -1.175934, 1, 1, 1, 1, 1,
0.8999454, -0.01611953, 3.31286, 0, 0, 1, 1, 1,
0.9005011, -0.0147015, 1.596607, 1, 0, 0, 1, 1,
0.9021994, -0.04230101, 3.000155, 1, 0, 0, 1, 1,
0.9050779, -0.7034216, 2.830097, 1, 0, 0, 1, 1,
0.9209476, 0.2496136, 0.9258869, 1, 0, 0, 1, 1,
0.9219361, 0.3085667, 1.349061, 1, 0, 0, 1, 1,
0.9228519, 0.2303938, 1.274935, 0, 0, 0, 1, 1,
0.9251622, -0.03879148, 2.183501, 0, 0, 0, 1, 1,
0.9278663, 0.699664, 1.591481, 0, 0, 0, 1, 1,
0.9288797, 1.258721, -0.3204223, 0, 0, 0, 1, 1,
0.9294806, 0.7210182, 1.25097, 0, 0, 0, 1, 1,
0.9358634, -1.823708, 1.181575, 0, 0, 0, 1, 1,
0.938093, -1.910462, 2.899313, 0, 0, 0, 1, 1,
0.9439114, -0.880278, 0.02247685, 1, 1, 1, 1, 1,
0.9470081, -1.043699, 2.206345, 1, 1, 1, 1, 1,
0.9513605, -0.8867114, 1.303286, 1, 1, 1, 1, 1,
0.9532017, -1.510702, 2.681367, 1, 1, 1, 1, 1,
0.9541649, -0.4864188, 2.775637, 1, 1, 1, 1, 1,
0.9588249, -0.8032916, 1.824704, 1, 1, 1, 1, 1,
0.9622465, -1.506697, 3.780983, 1, 1, 1, 1, 1,
0.963913, 0.523631, 2.073416, 1, 1, 1, 1, 1,
0.9678789, 1.338062, -0.003976494, 1, 1, 1, 1, 1,
0.9681241, -1.177828, 0.8868281, 1, 1, 1, 1, 1,
0.9758532, -0.6331874, 2.033434, 1, 1, 1, 1, 1,
0.980554, 0.4169993, 0.07295535, 1, 1, 1, 1, 1,
0.9841176, 0.6777233, 1.556131, 1, 1, 1, 1, 1,
0.9841636, -0.4598527, 0.4980171, 1, 1, 1, 1, 1,
0.988298, 0.6371403, 2.424217, 1, 1, 1, 1, 1,
0.9963657, 0.7600389, -0.4332191, 0, 0, 1, 1, 1,
0.9974493, 0.1884275, 1.782325, 1, 0, 0, 1, 1,
1.00181, -0.5640858, 3.123915, 1, 0, 0, 1, 1,
1.007878, -1.082544, 1.934189, 1, 0, 0, 1, 1,
1.008087, -1.240015, 5.568281, 1, 0, 0, 1, 1,
1.014801, 0.402346, 0.8221256, 1, 0, 0, 1, 1,
1.017646, 0.2544409, 2.121918, 0, 0, 0, 1, 1,
1.017762, -2.198943, 2.645246, 0, 0, 0, 1, 1,
1.01859, -0.7268507, 2.271137, 0, 0, 0, 1, 1,
1.020455, 0.03844224, 3.364989, 0, 0, 0, 1, 1,
1.021478, -1.310113, 2.80507, 0, 0, 0, 1, 1,
1.033749, 0.7550339, 1.032163, 0, 0, 0, 1, 1,
1.034748, 1.109417, -0.2246886, 0, 0, 0, 1, 1,
1.038575, -1.539407, 3.635902, 1, 1, 1, 1, 1,
1.038652, 0.07448527, 3.188224, 1, 1, 1, 1, 1,
1.056674, -0.1010569, 1.760547, 1, 1, 1, 1, 1,
1.061952, 0.06600753, 1.504468, 1, 1, 1, 1, 1,
1.064569, 1.144382, 0.8276189, 1, 1, 1, 1, 1,
1.065144, -0.1066973, 0.890337, 1, 1, 1, 1, 1,
1.069164, 0.2169074, -0.6999832, 1, 1, 1, 1, 1,
1.083771, 1.660777, -0.4254047, 1, 1, 1, 1, 1,
1.094835, 1.011463, 2.090609, 1, 1, 1, 1, 1,
1.099247, -1.070637, 3.361006, 1, 1, 1, 1, 1,
1.101291, -0.3886666, 1.868116, 1, 1, 1, 1, 1,
1.101928, 0.6170278, -0.8238727, 1, 1, 1, 1, 1,
1.102741, -1.49699, 2.438626, 1, 1, 1, 1, 1,
1.105826, 0.4802951, 1.410955, 1, 1, 1, 1, 1,
1.108569, -0.8372192, 3.101399, 1, 1, 1, 1, 1,
1.109131, -0.6931822, 2.548569, 0, 0, 1, 1, 1,
1.112231, -0.3591343, 0.772197, 1, 0, 0, 1, 1,
1.113785, -0.1419497, 2.534595, 1, 0, 0, 1, 1,
1.1146, 0.3225136, 0.5477554, 1, 0, 0, 1, 1,
1.118772, 0.3877088, 0.4951907, 1, 0, 0, 1, 1,
1.119536, 0.5857032, 0.5205085, 1, 0, 0, 1, 1,
1.120153, -0.3405589, 1.893138, 0, 0, 0, 1, 1,
1.122939, -0.3528605, 3.056822, 0, 0, 0, 1, 1,
1.136863, -0.1674642, 3.154982, 0, 0, 0, 1, 1,
1.143312, 1.75004, -1.884979, 0, 0, 0, 1, 1,
1.144083, 1.240839, 0.5966229, 0, 0, 0, 1, 1,
1.145609, 0.3009659, 1.518414, 0, 0, 0, 1, 1,
1.151057, 0.01729603, 2.622948, 0, 0, 0, 1, 1,
1.158632, -2.103481, 4.556049, 1, 1, 1, 1, 1,
1.161848, -1.161628, 3.054177, 1, 1, 1, 1, 1,
1.16595, 0.7328424, 0.2675365, 1, 1, 1, 1, 1,
1.166769, -1.540726, 1.802685, 1, 1, 1, 1, 1,
1.167163, 2.132883, 2.372454, 1, 1, 1, 1, 1,
1.198749, 0.6494401, -0.5931714, 1, 1, 1, 1, 1,
1.199829, 0.1089061, 1.55954, 1, 1, 1, 1, 1,
1.201096, -0.04004551, 0.7159491, 1, 1, 1, 1, 1,
1.204073, -0.2734195, 1.465386, 1, 1, 1, 1, 1,
1.205332, -0.06031379, 1.818507, 1, 1, 1, 1, 1,
1.208216, -0.7259476, 2.177258, 1, 1, 1, 1, 1,
1.212068, -0.5186777, 4.576594, 1, 1, 1, 1, 1,
1.212095, -0.3276603, 2.983174, 1, 1, 1, 1, 1,
1.223139, -0.4618595, 1.13294, 1, 1, 1, 1, 1,
1.230663, -1.057941, 3.447237, 1, 1, 1, 1, 1,
1.232127, 1.026538, -0.1556296, 0, 0, 1, 1, 1,
1.232198, -1.531062, 2.317769, 1, 0, 0, 1, 1,
1.242538, -1.451982, 2.146717, 1, 0, 0, 1, 1,
1.244292, -0.4531191, 2.313805, 1, 0, 0, 1, 1,
1.246294, -1.199353, 1.911008, 1, 0, 0, 1, 1,
1.248499, -0.7556288, 2.152717, 1, 0, 0, 1, 1,
1.253794, 1.43017, 1.079729, 0, 0, 0, 1, 1,
1.256662, -0.3720933, 2.106411, 0, 0, 0, 1, 1,
1.258971, 0.1992834, 1.354972, 0, 0, 0, 1, 1,
1.259515, -0.9989411, 3.563622, 0, 0, 0, 1, 1,
1.263437, 0.3424839, -0.5506194, 0, 0, 0, 1, 1,
1.267571, -1.726456, 3.358012, 0, 0, 0, 1, 1,
1.275845, -0.890804, 1.129903, 0, 0, 0, 1, 1,
1.289991, -0.1127595, 3.699302, 1, 1, 1, 1, 1,
1.290672, 1.41986, 0.6347693, 1, 1, 1, 1, 1,
1.309295, -0.4597454, 2.312596, 1, 1, 1, 1, 1,
1.314244, -2.550722, 1.649622, 1, 1, 1, 1, 1,
1.320125, -2.311849, 1.512705, 1, 1, 1, 1, 1,
1.320294, 0.09727012, 1.096849, 1, 1, 1, 1, 1,
1.322601, 1.669863, 0.15975, 1, 1, 1, 1, 1,
1.330155, 0.004089204, 1.994477, 1, 1, 1, 1, 1,
1.331834, 0.3042175, 3.224396, 1, 1, 1, 1, 1,
1.334575, -0.9298174, 2.148643, 1, 1, 1, 1, 1,
1.336844, -1.144594, 2.648969, 1, 1, 1, 1, 1,
1.342894, -0.7413786, 3.849112, 1, 1, 1, 1, 1,
1.344566, -0.05183613, -0.7165118, 1, 1, 1, 1, 1,
1.35606, -3.061985, 1.557523, 1, 1, 1, 1, 1,
1.357032, -1.430184, 1.897812, 1, 1, 1, 1, 1,
1.365626, 0.5279687, -1.059638, 0, 0, 1, 1, 1,
1.395775, -1.518162, 2.819567, 1, 0, 0, 1, 1,
1.436046, -0.4251971, 3.448731, 1, 0, 0, 1, 1,
1.441448, -0.9174168, 2.544502, 1, 0, 0, 1, 1,
1.448931, -1.876351, 1.261162, 1, 0, 0, 1, 1,
1.453259, -0.6147667, 0.9148107, 1, 0, 0, 1, 1,
1.457089, 1.955215, -0.4808164, 0, 0, 0, 1, 1,
1.457101, 0.4787461, 2.723848, 0, 0, 0, 1, 1,
1.468696, -0.5912128, 2.752134, 0, 0, 0, 1, 1,
1.474864, 0.003178665, 0.8229461, 0, 0, 0, 1, 1,
1.489264, 0.3312888, 0.1981883, 0, 0, 0, 1, 1,
1.490567, 0.858486, 1.311224, 0, 0, 0, 1, 1,
1.491726, 0.5573102, 1.585009, 0, 0, 0, 1, 1,
1.513818, 1.766563, 0.2349491, 1, 1, 1, 1, 1,
1.526045, -0.7611583, 2.859597, 1, 1, 1, 1, 1,
1.526741, 0.2174549, 1.38261, 1, 1, 1, 1, 1,
1.535378, -0.3572153, 1.350008, 1, 1, 1, 1, 1,
1.53898, 1.142347, 3.975785, 1, 1, 1, 1, 1,
1.560973, 0.3094245, 0.8113204, 1, 1, 1, 1, 1,
1.588278, -0.2792913, 0.855673, 1, 1, 1, 1, 1,
1.592348, 1.346059, 0.1539111, 1, 1, 1, 1, 1,
1.595759, -0.01256319, 2.586877, 1, 1, 1, 1, 1,
1.598659, 0.5627615, 3.198875, 1, 1, 1, 1, 1,
1.624288, -0.08106492, 2.723482, 1, 1, 1, 1, 1,
1.677579, 0.3842308, -0.254086, 1, 1, 1, 1, 1,
1.679664, -1.835305, 3.943216, 1, 1, 1, 1, 1,
1.709798, 0.3427273, 0.9438747, 1, 1, 1, 1, 1,
1.712568, -0.1715425, 1.515065, 1, 1, 1, 1, 1,
1.735393, 0.913763, 0.9735445, 0, 0, 1, 1, 1,
1.741452, 0.3781685, 0.7919117, 1, 0, 0, 1, 1,
1.764625, -0.5469172, 2.507385, 1, 0, 0, 1, 1,
1.781618, -0.39995, 0.8021154, 1, 0, 0, 1, 1,
1.78578, 1.171875, -0.0323125, 1, 0, 0, 1, 1,
1.794416, 1.29749, 1.874965, 1, 0, 0, 1, 1,
1.800712, 0.6641821, 0.5322153, 0, 0, 0, 1, 1,
1.814939, -1.295456, 3.223439, 0, 0, 0, 1, 1,
1.819031, 0.2231623, 1.321816, 0, 0, 0, 1, 1,
1.824565, 1.644811, 0.3809462, 0, 0, 0, 1, 1,
1.82553, -1.069431, 1.142546, 0, 0, 0, 1, 1,
1.834508, -1.517091, 1.734538, 0, 0, 0, 1, 1,
1.845718, -1.250681, 2.036005, 0, 0, 0, 1, 1,
1.846123, -1.19548, 3.284953, 1, 1, 1, 1, 1,
1.859258, 1.424428, 0.9982978, 1, 1, 1, 1, 1,
1.871563, -0.661289, 2.145795, 1, 1, 1, 1, 1,
1.892854, -0.5768321, 1.718372, 1, 1, 1, 1, 1,
1.894446, 0.6009185, -0.6016859, 1, 1, 1, 1, 1,
1.898419, -1.504854, 1.978153, 1, 1, 1, 1, 1,
1.904715, 0.6173619, 1.031526, 1, 1, 1, 1, 1,
1.922335, -1.015947, 1.813502, 1, 1, 1, 1, 1,
1.961424, -0.0703008, 1.552174, 1, 1, 1, 1, 1,
1.96229, -0.7983869, 2.693383, 1, 1, 1, 1, 1,
1.996737, -0.2077321, 1.70565, 1, 1, 1, 1, 1,
1.999709, 2.731016, 0.3007056, 1, 1, 1, 1, 1,
2.048455, 2.354789, -0.2418658, 1, 1, 1, 1, 1,
2.070175, -0.03256986, 2.078454, 1, 1, 1, 1, 1,
2.088789, 1.81375, 0.3868587, 1, 1, 1, 1, 1,
2.137568, -0.3486705, -0.06723129, 0, 0, 1, 1, 1,
2.149239, 1.048695, 1.898571, 1, 0, 0, 1, 1,
2.173718, -1.929935, 4.076383, 1, 0, 0, 1, 1,
2.24485, -1.283671, 2.95256, 1, 0, 0, 1, 1,
2.24789, -0.01668612, 0.7938535, 1, 0, 0, 1, 1,
2.257512, -0.5929939, 2.03146, 1, 0, 0, 1, 1,
2.304774, -0.7847572, 1.869841, 0, 0, 0, 1, 1,
2.363301, -0.5050308, 2.809201, 0, 0, 0, 1, 1,
2.371536, 1.555451, 0.8195964, 0, 0, 0, 1, 1,
2.37779, 0.7241401, 1.876297, 0, 0, 0, 1, 1,
2.390897, 0.6663579, 0.3783326, 0, 0, 0, 1, 1,
2.446113, 0.7079244, 0.5835187, 0, 0, 0, 1, 1,
2.47595, 1.457367, 1.058489, 0, 0, 0, 1, 1,
2.517773, -1.446656, 2.264265, 1, 1, 1, 1, 1,
2.549953, -0.8163325, 2.188439, 1, 1, 1, 1, 1,
2.667063, 2.634851, 0.070708, 1, 1, 1, 1, 1,
2.712412, 0.1315513, 2.622316, 1, 1, 1, 1, 1,
2.720103, 0.09310932, 2.207414, 1, 1, 1, 1, 1,
3.072522, -0.6529155, 2.093913, 1, 1, 1, 1, 1,
3.571604, -1.506202, 2.33422, 1, 1, 1, 1, 1
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
var radius = 10.0376;
var distance = 35.25665;
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
mvMatrix.translate( 0.0162499, -0.1245677, -0.02825761 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.25665);
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
