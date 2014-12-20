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
-3.91766, 0.8599173, -0.5515691, 1, 0, 0, 1,
-3.449156, -1.61222, -1.283394, 1, 0.007843138, 0, 1,
-3.418875, -0.8114929, -1.326713, 1, 0.01176471, 0, 1,
-2.808892, 1.394384, -2.332738, 1, 0.01960784, 0, 1,
-2.524012, -0.5908825, -0.1285863, 1, 0.02352941, 0, 1,
-2.447366, 1.115481, -1.263547, 1, 0.03137255, 0, 1,
-2.446654, 2.10188, -1.002921, 1, 0.03529412, 0, 1,
-2.441948, -0.5018812, -2.24996, 1, 0.04313726, 0, 1,
-2.416775, -0.1123629, 0.6441224, 1, 0.04705882, 0, 1,
-2.415462, 0.009699431, -2.014154, 1, 0.05490196, 0, 1,
-2.411472, 1.090128, -1.802509, 1, 0.05882353, 0, 1,
-2.300249, -0.4731543, -1.549049, 1, 0.06666667, 0, 1,
-2.260656, 0.2573737, -0.2415378, 1, 0.07058824, 0, 1,
-2.23395, 1.34932, -1.433315, 1, 0.07843138, 0, 1,
-2.228319, 1.624734, -2.653577, 1, 0.08235294, 0, 1,
-2.228112, -0.08794282, -3.075805, 1, 0.09019608, 0, 1,
-2.162748, 0.6198885, 0.4956027, 1, 0.09411765, 0, 1,
-2.149018, -0.1154392, -1.302639, 1, 0.1019608, 0, 1,
-2.141311, -1.545185, -1.573343, 1, 0.1098039, 0, 1,
-2.126336, 1.848548, -1.762475, 1, 0.1137255, 0, 1,
-2.125869, 0.4705012, -2.654245, 1, 0.1215686, 0, 1,
-2.11901, 1.464536, -0.2280304, 1, 0.1254902, 0, 1,
-2.108886, -0.893064, -1.507826, 1, 0.1333333, 0, 1,
-2.105428, -0.6681762, -1.211393, 1, 0.1372549, 0, 1,
-2.065886, 1.235568, -0.9948478, 1, 0.145098, 0, 1,
-2.045121, 1.639488, -1.204468, 1, 0.1490196, 0, 1,
-2.015896, 0.5303754, -1.471951, 1, 0.1568628, 0, 1,
-1.981117, -0.001722638, -2.132053, 1, 0.1607843, 0, 1,
-1.947647, -0.7406409, -1.772764, 1, 0.1686275, 0, 1,
-1.93265, 0.9705665, -2.992748, 1, 0.172549, 0, 1,
-1.90934, -0.0124858, -1.051481, 1, 0.1803922, 0, 1,
-1.897526, -1.098859, -0.7288433, 1, 0.1843137, 0, 1,
-1.884274, 1.310032, -0.9363176, 1, 0.1921569, 0, 1,
-1.872714, 0.551485, -0.8847319, 1, 0.1960784, 0, 1,
-1.872455, 0.5818474, -0.1518486, 1, 0.2039216, 0, 1,
-1.847278, 1.482745, -0.5585909, 1, 0.2117647, 0, 1,
-1.83795, -1.077815, -1.825205, 1, 0.2156863, 0, 1,
-1.829873, -0.02157312, 1.703571, 1, 0.2235294, 0, 1,
-1.807806, 1.238461, -0.2703125, 1, 0.227451, 0, 1,
-1.798236, -2.116484, -2.084487, 1, 0.2352941, 0, 1,
-1.789351, 2.066543, -1.652059, 1, 0.2392157, 0, 1,
-1.769174, 1.075032, -2.756787, 1, 0.2470588, 0, 1,
-1.759059, -0.5412344, -0.1842087, 1, 0.2509804, 0, 1,
-1.758397, -1.381356, -2.026249, 1, 0.2588235, 0, 1,
-1.740328, 0.330633, 0.03843541, 1, 0.2627451, 0, 1,
-1.732901, 1.236684, -2.784417, 1, 0.2705882, 0, 1,
-1.731799, -1.748335, -2.232494, 1, 0.2745098, 0, 1,
-1.66972, 0.4384283, -0.749941, 1, 0.282353, 0, 1,
-1.634739, -0.5119407, -2.23645, 1, 0.2862745, 0, 1,
-1.633789, 0.6887038, -2.086987, 1, 0.2941177, 0, 1,
-1.624939, -0.3046931, -0.4621001, 1, 0.3019608, 0, 1,
-1.619512, -1.916839, -1.786971, 1, 0.3058824, 0, 1,
-1.613819, -0.5477483, -3.082524, 1, 0.3137255, 0, 1,
-1.606082, -0.4823, -1.818394, 1, 0.3176471, 0, 1,
-1.605174, -0.1302107, -3.007562, 1, 0.3254902, 0, 1,
-1.598986, 1.136824, -0.5520648, 1, 0.3294118, 0, 1,
-1.598205, -0.4799803, -1.37601, 1, 0.3372549, 0, 1,
-1.597218, 1.035071, -1.206908, 1, 0.3411765, 0, 1,
-1.596701, -1.268897, -2.873951, 1, 0.3490196, 0, 1,
-1.59092, -0.6964633, -1.844517, 1, 0.3529412, 0, 1,
-1.587494, -1.71525, -0.4374696, 1, 0.3607843, 0, 1,
-1.582992, 0.3289035, -0.03208058, 1, 0.3647059, 0, 1,
-1.580941, 0.5516448, -0.98265, 1, 0.372549, 0, 1,
-1.556752, 0.4637129, 0.0980818, 1, 0.3764706, 0, 1,
-1.556608, -0.3826682, -3.477157, 1, 0.3843137, 0, 1,
-1.546056, 0.684883, -1.619012, 1, 0.3882353, 0, 1,
-1.54474, 0.06863981, -1.908507, 1, 0.3960784, 0, 1,
-1.529277, 0.5999002, -2.530364, 1, 0.4039216, 0, 1,
-1.52161, -1.057307, -1.033083, 1, 0.4078431, 0, 1,
-1.51651, 0.4477292, -0.7107933, 1, 0.4156863, 0, 1,
-1.516326, 0.3633579, -1.07968, 1, 0.4196078, 0, 1,
-1.506533, 0.2104162, -0.7959659, 1, 0.427451, 0, 1,
-1.491082, -0.4665462, -1.35709, 1, 0.4313726, 0, 1,
-1.481502, -1.846658, -2.031728, 1, 0.4392157, 0, 1,
-1.481358, 1.043916, -1.303943, 1, 0.4431373, 0, 1,
-1.465304, -0.6340285, -2.045448, 1, 0.4509804, 0, 1,
-1.464323, -0.0639047, -1.563804, 1, 0.454902, 0, 1,
-1.462736, 0.1280761, 0.3985617, 1, 0.4627451, 0, 1,
-1.450875, 0.6510537, -0.8427095, 1, 0.4666667, 0, 1,
-1.448539, 0.5209562, -2.063528, 1, 0.4745098, 0, 1,
-1.441645, -0.8710063, -0.6542876, 1, 0.4784314, 0, 1,
-1.438891, -0.6750427, -2.059292, 1, 0.4862745, 0, 1,
-1.427565, 0.6634519, -2.454373, 1, 0.4901961, 0, 1,
-1.425193, -0.4047538, -2.590405, 1, 0.4980392, 0, 1,
-1.422513, -0.06703032, -3.11162, 1, 0.5058824, 0, 1,
-1.411313, 0.1739928, -1.975173, 1, 0.509804, 0, 1,
-1.401813, -0.623246, -2.078124, 1, 0.5176471, 0, 1,
-1.393768, -0.4970502, -1.136649, 1, 0.5215687, 0, 1,
-1.393598, 1.799222, 1.492421, 1, 0.5294118, 0, 1,
-1.38074, 1.15385, -0.9408222, 1, 0.5333334, 0, 1,
-1.380316, 0.1927486, -1.28252, 1, 0.5411765, 0, 1,
-1.376789, 1.165103, -1.526544, 1, 0.5450981, 0, 1,
-1.374478, 1.196299, -0.2523022, 1, 0.5529412, 0, 1,
-1.373108, 1.657411, -1.30102, 1, 0.5568628, 0, 1,
-1.364679, -0.1006489, -1.741905, 1, 0.5647059, 0, 1,
-1.362858, -0.4027133, -0.4710072, 1, 0.5686275, 0, 1,
-1.355544, -1.359832, -2.500638, 1, 0.5764706, 0, 1,
-1.351849, 0.5941474, -1.491863, 1, 0.5803922, 0, 1,
-1.351209, 0.5811936, -0.4596676, 1, 0.5882353, 0, 1,
-1.350345, 0.3838159, -0.2787116, 1, 0.5921569, 0, 1,
-1.340074, -0.02326565, -1.877751, 1, 0.6, 0, 1,
-1.339905, -0.4605954, -2.338843, 1, 0.6078432, 0, 1,
-1.337511, -0.7164029, -3.560432, 1, 0.6117647, 0, 1,
-1.335956, 0.2429575, -0.4889323, 1, 0.6196079, 0, 1,
-1.333051, 1.317488, -1.537838, 1, 0.6235294, 0, 1,
-1.331354, -0.9910201, -4.268444, 1, 0.6313726, 0, 1,
-1.330229, -1.04351, -2.617114, 1, 0.6352941, 0, 1,
-1.3132, -0.7024103, -0.520505, 1, 0.6431373, 0, 1,
-1.308031, -1.379608, -4.111085, 1, 0.6470588, 0, 1,
-1.304803, -0.6856539, -2.039077, 1, 0.654902, 0, 1,
-1.300495, 0.4145218, -0.8619527, 1, 0.6588235, 0, 1,
-1.287252, 0.2722889, 0.4658968, 1, 0.6666667, 0, 1,
-1.285126, 0.5291435, -0.1106481, 1, 0.6705883, 0, 1,
-1.276677, 0.2287138, -2.328895, 1, 0.6784314, 0, 1,
-1.274402, 0.5108632, -0.6549488, 1, 0.682353, 0, 1,
-1.273498, 0.3801653, 0.0008377612, 1, 0.6901961, 0, 1,
-1.273457, 0.3949671, -1.164731, 1, 0.6941177, 0, 1,
-1.262865, -0.52772, -4.612727, 1, 0.7019608, 0, 1,
-1.249019, -2.052386, -2.793975, 1, 0.7098039, 0, 1,
-1.241127, -0.5386285, -0.5629974, 1, 0.7137255, 0, 1,
-1.239928, 0.3192704, -1.395535, 1, 0.7215686, 0, 1,
-1.239761, -0.2743475, -0.56441, 1, 0.7254902, 0, 1,
-1.233173, 1.226089, -0.9365586, 1, 0.7333333, 0, 1,
-1.231225, 1.867732, -1.439972, 1, 0.7372549, 0, 1,
-1.221237, 0.1557807, -0.5032783, 1, 0.7450981, 0, 1,
-1.214898, -0.9701938, -2.947564, 1, 0.7490196, 0, 1,
-1.207635, 0.6851293, -2.630024, 1, 0.7568628, 0, 1,
-1.202439, 0.8727633, -1.05239, 1, 0.7607843, 0, 1,
-1.200933, -0.8373588, -3.956592, 1, 0.7686275, 0, 1,
-1.192108, -0.3368703, -3.17637, 1, 0.772549, 0, 1,
-1.191932, -0.7480239, -2.434451, 1, 0.7803922, 0, 1,
-1.190385, 0.2908593, -0.5592585, 1, 0.7843137, 0, 1,
-1.189249, 0.0951447, -1.517495, 1, 0.7921569, 0, 1,
-1.187531, 0.3477911, -2.474037, 1, 0.7960784, 0, 1,
-1.18727, 0.4760718, -0.7821979, 1, 0.8039216, 0, 1,
-1.182049, -0.985689, -2.119057, 1, 0.8117647, 0, 1,
-1.181463, -0.6069695, -2.007226, 1, 0.8156863, 0, 1,
-1.17983, -1.817531, -4.098433, 1, 0.8235294, 0, 1,
-1.173713, 1.469759, -0.2552517, 1, 0.827451, 0, 1,
-1.172784, -1.440609, -1.250401, 1, 0.8352941, 0, 1,
-1.172055, -0.8049942, -2.475697, 1, 0.8392157, 0, 1,
-1.171057, 0.1378394, -1.44155, 1, 0.8470588, 0, 1,
-1.157907, 1.457182, -0.6752577, 1, 0.8509804, 0, 1,
-1.150591, -0.7384609, -2.33117, 1, 0.8588235, 0, 1,
-1.149569, 0.6834047, -1.525386, 1, 0.8627451, 0, 1,
-1.145472, 0.06646221, -1.82559, 1, 0.8705882, 0, 1,
-1.128255, 0.01014122, -0.6443579, 1, 0.8745098, 0, 1,
-1.124796, -1.377671, -3.388091, 1, 0.8823529, 0, 1,
-1.121973, 0.4993467, -2.774065, 1, 0.8862745, 0, 1,
-1.121004, 0.2988245, -2.330824, 1, 0.8941177, 0, 1,
-1.118874, -0.1564462, -2.10189, 1, 0.8980392, 0, 1,
-1.116233, 0.05622663, -0.2957281, 1, 0.9058824, 0, 1,
-1.110749, 0.8864645, -1.053209, 1, 0.9137255, 0, 1,
-1.110305, -0.1293176, -1.677176, 1, 0.9176471, 0, 1,
-1.109279, -1.261455, -1.632959, 1, 0.9254902, 0, 1,
-1.108494, -0.1501714, -2.317105, 1, 0.9294118, 0, 1,
-1.090917, -0.01155493, -2.485967, 1, 0.9372549, 0, 1,
-1.08361, -0.08960881, -0.7019363, 1, 0.9411765, 0, 1,
-1.080792, 0.2960132, -0.5325931, 1, 0.9490196, 0, 1,
-1.078449, 0.3549265, -1.462373, 1, 0.9529412, 0, 1,
-1.074168, 0.3846262, 0.1555503, 1, 0.9607843, 0, 1,
-1.071248, -0.6459646, -2.556922, 1, 0.9647059, 0, 1,
-1.06698, 0.04846595, 0.3429974, 1, 0.972549, 0, 1,
-1.056224, -0.5179454, -3.102449, 1, 0.9764706, 0, 1,
-1.054756, 0.2319856, 0.1514579, 1, 0.9843137, 0, 1,
-1.053908, 0.4632618, 0.2814232, 1, 0.9882353, 0, 1,
-1.052522, 0.2609459, -3.291529, 1, 0.9960784, 0, 1,
-1.051122, 0.3419285, -1.314878, 0.9960784, 1, 0, 1,
-1.042594, 1.370073, 0.1758744, 0.9921569, 1, 0, 1,
-1.03673, 1.934037, -1.583276, 0.9843137, 1, 0, 1,
-1.036663, 0.6954727, -0.5769297, 0.9803922, 1, 0, 1,
-1.036568, -0.948285, -3.530101, 0.972549, 1, 0, 1,
-1.033764, 0.09001517, -0.9457946, 0.9686275, 1, 0, 1,
-1.031822, 0.1973586, -0.8135586, 0.9607843, 1, 0, 1,
-1.029801, 0.4921378, -0.3236977, 0.9568627, 1, 0, 1,
-1.027969, 1.027454, 0.2484894, 0.9490196, 1, 0, 1,
-1.027078, -1.319725, -3.187964, 0.945098, 1, 0, 1,
-1.024372, -0.175717, -0.6375101, 0.9372549, 1, 0, 1,
-1.021166, 0.6033587, -0.7527951, 0.9333333, 1, 0, 1,
-1.017461, -0.2605558, -0.7032962, 0.9254902, 1, 0, 1,
-1.017158, 1.149929, 1.238021, 0.9215686, 1, 0, 1,
-1.01402, -1.533291, -2.454351, 0.9137255, 1, 0, 1,
-0.995187, 0.3677991, -2.463873, 0.9098039, 1, 0, 1,
-0.994603, 0.6258358, -0.9389811, 0.9019608, 1, 0, 1,
-0.9793394, -0.2069673, -2.488822, 0.8941177, 1, 0, 1,
-0.9679548, -1.646618, -4.070491, 0.8901961, 1, 0, 1,
-0.9627498, -0.5362867, -2.518434, 0.8823529, 1, 0, 1,
-0.9597275, -0.9747443, -1.500743, 0.8784314, 1, 0, 1,
-0.9550586, 1.432786, -0.3551919, 0.8705882, 1, 0, 1,
-0.9523483, 0.1627977, -1.796278, 0.8666667, 1, 0, 1,
-0.9483069, 0.9747616, -0.6769524, 0.8588235, 1, 0, 1,
-0.9448364, 0.05026764, -0.5859087, 0.854902, 1, 0, 1,
-0.937511, 0.418902, -1.552926, 0.8470588, 1, 0, 1,
-0.9254053, -2.134012, -3.68834, 0.8431373, 1, 0, 1,
-0.9228674, 0.1767879, -1.453043, 0.8352941, 1, 0, 1,
-0.9142722, -0.2972014, -2.835714, 0.8313726, 1, 0, 1,
-0.9107908, -0.882283, -1.14589, 0.8235294, 1, 0, 1,
-0.9001867, -1.085341, -1.610253, 0.8196079, 1, 0, 1,
-0.8864529, 0.6358347, -1.802638, 0.8117647, 1, 0, 1,
-0.8814567, -0.168355, -0.6915436, 0.8078431, 1, 0, 1,
-0.8804777, -0.2131423, -1.865733, 0.8, 1, 0, 1,
-0.8710841, 1.395203, 1.135848, 0.7921569, 1, 0, 1,
-0.8694238, -0.3130914, -0.4695632, 0.7882353, 1, 0, 1,
-0.8659658, 1.183834, -1.009117, 0.7803922, 1, 0, 1,
-0.8564404, 0.2110552, 0.2365057, 0.7764706, 1, 0, 1,
-0.8542215, -0.1336922, 0.2946844, 0.7686275, 1, 0, 1,
-0.8413271, 0.1751477, -0.09759533, 0.7647059, 1, 0, 1,
-0.8379933, -0.3986715, -1.56548, 0.7568628, 1, 0, 1,
-0.8310021, 0.08836444, -1.933821, 0.7529412, 1, 0, 1,
-0.8287113, -0.2418889, -1.200216, 0.7450981, 1, 0, 1,
-0.8286313, -1.501493, -3.612367, 0.7411765, 1, 0, 1,
-0.8238567, 0.4933011, -0.097899, 0.7333333, 1, 0, 1,
-0.8224632, -1.068832, -0.2766677, 0.7294118, 1, 0, 1,
-0.8207902, 0.2191192, 0.3102451, 0.7215686, 1, 0, 1,
-0.8045192, -0.3880951, -2.149197, 0.7176471, 1, 0, 1,
-0.8010159, -0.9100394, -3.486367, 0.7098039, 1, 0, 1,
-0.7987456, -1.097019, -4.769025, 0.7058824, 1, 0, 1,
-0.7935939, -0.6089836, -2.925747, 0.6980392, 1, 0, 1,
-0.7934322, -0.2574974, -1.609859, 0.6901961, 1, 0, 1,
-0.7915498, 0.390203, 0.08050937, 0.6862745, 1, 0, 1,
-0.7870443, 0.643782, -2.216272, 0.6784314, 1, 0, 1,
-0.7848191, 1.83181, -1.885951, 0.6745098, 1, 0, 1,
-0.7848135, 0.2086261, -0.6835261, 0.6666667, 1, 0, 1,
-0.7844538, -0.1765907, -3.237219, 0.6627451, 1, 0, 1,
-0.7752872, -0.2501311, -2.545525, 0.654902, 1, 0, 1,
-0.7690747, -2.187149, -5.001738, 0.6509804, 1, 0, 1,
-0.7646238, -1.655952, -2.69122, 0.6431373, 1, 0, 1,
-0.7624077, -1.45725, -1.509825, 0.6392157, 1, 0, 1,
-0.7617912, -1.562955, -0.7864203, 0.6313726, 1, 0, 1,
-0.7599382, -0.7179959, -3.749635, 0.627451, 1, 0, 1,
-0.755524, -1.35451, -1.578604, 0.6196079, 1, 0, 1,
-0.7543275, 1.053097, -0.9797085, 0.6156863, 1, 0, 1,
-0.7529733, 0.2713455, -1.835981, 0.6078432, 1, 0, 1,
-0.752898, 0.7342256, -1.719033, 0.6039216, 1, 0, 1,
-0.7505771, 0.6732295, 0.5013173, 0.5960785, 1, 0, 1,
-0.7467974, -0.7751003, -3.008222, 0.5882353, 1, 0, 1,
-0.7455227, -0.2089829, -0.7048108, 0.5843138, 1, 0, 1,
-0.7444156, 1.083884, -1.016303, 0.5764706, 1, 0, 1,
-0.7435512, -0.737542, -4.808862, 0.572549, 1, 0, 1,
-0.7414659, 1.091655, -1.11624, 0.5647059, 1, 0, 1,
-0.7414588, 0.3005194, -0.7926254, 0.5607843, 1, 0, 1,
-0.7410703, 0.5957283, 0.356565, 0.5529412, 1, 0, 1,
-0.7407696, 0.6923686, -1.083837, 0.5490196, 1, 0, 1,
-0.7384658, 1.505619, 1.404771, 0.5411765, 1, 0, 1,
-0.7355974, -0.3364891, -3.059722, 0.5372549, 1, 0, 1,
-0.7299231, -1.135531, -0.337621, 0.5294118, 1, 0, 1,
-0.7225342, 0.6688423, -0.7151343, 0.5254902, 1, 0, 1,
-0.7205365, -0.3360855, -3.07008, 0.5176471, 1, 0, 1,
-0.7153731, 0.3583027, -3.522257, 0.5137255, 1, 0, 1,
-0.7088546, 1.413772, -1.51574, 0.5058824, 1, 0, 1,
-0.7032268, -0.9721873, -1.459903, 0.5019608, 1, 0, 1,
-0.7013466, 1.075624, 0.5216367, 0.4941176, 1, 0, 1,
-0.7010913, 1.007898, -1.251466, 0.4862745, 1, 0, 1,
-0.695828, 1.483739, -0.45575, 0.4823529, 1, 0, 1,
-0.6952383, 0.3231491, -2.161436, 0.4745098, 1, 0, 1,
-0.6712996, -0.5970867, -3.291448, 0.4705882, 1, 0, 1,
-0.670555, 0.1740501, -1.755794, 0.4627451, 1, 0, 1,
-0.6677065, -1.34783, -3.433321, 0.4588235, 1, 0, 1,
-0.6643782, -1.044098, 0.01543249, 0.4509804, 1, 0, 1,
-0.6639639, 0.4372777, 0.6739846, 0.4470588, 1, 0, 1,
-0.6617327, 0.6513918, -2.12543, 0.4392157, 1, 0, 1,
-0.6608616, 0.9400288, -1.176347, 0.4352941, 1, 0, 1,
-0.6599695, 0.1377898, -0.3432436, 0.427451, 1, 0, 1,
-0.6553563, 0.1770873, -0.7099227, 0.4235294, 1, 0, 1,
-0.6552395, -0.8498271, -2.268919, 0.4156863, 1, 0, 1,
-0.6534897, -0.8926131, -2.277573, 0.4117647, 1, 0, 1,
-0.6497859, -0.1591723, 0.2853557, 0.4039216, 1, 0, 1,
-0.6458359, 1.430991, -0.4948676, 0.3960784, 1, 0, 1,
-0.645262, 1.471772, -0.9396878, 0.3921569, 1, 0, 1,
-0.6437318, -1.049873, -2.55562, 0.3843137, 1, 0, 1,
-0.6423768, -1.919075, -3.081701, 0.3803922, 1, 0, 1,
-0.6417483, 1.387375, 0.7738302, 0.372549, 1, 0, 1,
-0.641218, 1.154477, -0.1000838, 0.3686275, 1, 0, 1,
-0.6317635, -0.6809189, -2.491022, 0.3607843, 1, 0, 1,
-0.6290666, -0.393469, -0.7320812, 0.3568628, 1, 0, 1,
-0.6202145, -0.8437689, -2.172674, 0.3490196, 1, 0, 1,
-0.6175196, -1.148145, -2.537245, 0.345098, 1, 0, 1,
-0.6097903, 0.3545705, -1.171683, 0.3372549, 1, 0, 1,
-0.6092513, -0.5800032, -3.956727, 0.3333333, 1, 0, 1,
-0.6088175, -1.363586, -2.762325, 0.3254902, 1, 0, 1,
-0.6081118, -1.632943, -3.41709, 0.3215686, 1, 0, 1,
-0.6035254, 0.1240718, -2.096749, 0.3137255, 1, 0, 1,
-0.6018277, 1.749527, 0.09815663, 0.3098039, 1, 0, 1,
-0.5978333, -0.2069167, -1.271411, 0.3019608, 1, 0, 1,
-0.5958338, -0.4176889, -3.363343, 0.2941177, 1, 0, 1,
-0.5957862, -1.031522, -3.973697, 0.2901961, 1, 0, 1,
-0.5908117, -1.477041, -1.38608, 0.282353, 1, 0, 1,
-0.5901386, 0.3747465, 1.179107, 0.2784314, 1, 0, 1,
-0.5823633, 1.132127, -1.577133, 0.2705882, 1, 0, 1,
-0.5740448, 0.5437367, 0.7959545, 0.2666667, 1, 0, 1,
-0.5722475, 1.071774, -0.7758583, 0.2588235, 1, 0, 1,
-0.5603626, -0.9440134, -1.791409, 0.254902, 1, 0, 1,
-0.5543231, 1.265758, -2.768567, 0.2470588, 1, 0, 1,
-0.5537254, 1.36298, 0.02706886, 0.2431373, 1, 0, 1,
-0.551271, 1.007789, -1.63284, 0.2352941, 1, 0, 1,
-0.5507238, 0.7679502, -1.147964, 0.2313726, 1, 0, 1,
-0.5444016, 0.6936541, -0.5641351, 0.2235294, 1, 0, 1,
-0.5402644, 2.13046, -0.4142572, 0.2196078, 1, 0, 1,
-0.5375392, 0.4876388, -0.4585888, 0.2117647, 1, 0, 1,
-0.5325527, 0.3272009, -0.9744222, 0.2078431, 1, 0, 1,
-0.5314265, 0.3830345, 1.482739, 0.2, 1, 0, 1,
-0.5285239, 0.1495814, -1.562135, 0.1921569, 1, 0, 1,
-0.5280134, -1.545673, -4.451343, 0.1882353, 1, 0, 1,
-0.5241493, 1.180408, -1.921811, 0.1803922, 1, 0, 1,
-0.5222177, 0.4259123, -1.350579, 0.1764706, 1, 0, 1,
-0.5220581, 1.046839, 0.3994249, 0.1686275, 1, 0, 1,
-0.5139275, 0.215382, 0.0843511, 0.1647059, 1, 0, 1,
-0.5135279, -0.1546038, -1.562732, 0.1568628, 1, 0, 1,
-0.5063746, 0.59383, -0.4042458, 0.1529412, 1, 0, 1,
-0.5039057, -0.1010681, -1.056117, 0.145098, 1, 0, 1,
-0.4974191, 0.2653124, -1.105108, 0.1411765, 1, 0, 1,
-0.4964733, -1.076933, -3.956405, 0.1333333, 1, 0, 1,
-0.4944754, -1.328757, -4.814245, 0.1294118, 1, 0, 1,
-0.4922134, 2.092087, -0.2190428, 0.1215686, 1, 0, 1,
-0.4913486, -0.3663926, -1.917863, 0.1176471, 1, 0, 1,
-0.4909398, -0.3105479, -3.079689, 0.1098039, 1, 0, 1,
-0.4894544, -2.137855, -3.549443, 0.1058824, 1, 0, 1,
-0.4894132, -0.2220296, 1.279631, 0.09803922, 1, 0, 1,
-0.4845513, -0.2067357, -4.096968, 0.09019608, 1, 0, 1,
-0.4845241, -0.0528014, -1.170123, 0.08627451, 1, 0, 1,
-0.48307, -1.035362, -3.204697, 0.07843138, 1, 0, 1,
-0.4822518, 1.148483, -1.366562, 0.07450981, 1, 0, 1,
-0.4818894, 1.075522, -2.518587, 0.06666667, 1, 0, 1,
-0.4808888, 1.241228, 1.965943, 0.0627451, 1, 0, 1,
-0.4793547, 0.4990626, -0.8301936, 0.05490196, 1, 0, 1,
-0.4741092, -0.02827637, -0.5905118, 0.05098039, 1, 0, 1,
-0.4733406, 1.098718, -1.523464, 0.04313726, 1, 0, 1,
-0.470581, -0.5107716, -3.336443, 0.03921569, 1, 0, 1,
-0.4644262, 0.944768, -2.837527, 0.03137255, 1, 0, 1,
-0.4572674, -1.858726, -4.275986, 0.02745098, 1, 0, 1,
-0.4523278, 1.676235, -0.02927164, 0.01960784, 1, 0, 1,
-0.4506401, -0.8730145, -1.462699, 0.01568628, 1, 0, 1,
-0.4452311, 0.4988787, -1.966288, 0.007843138, 1, 0, 1,
-0.4368896, 0.9211872, -1.547602, 0.003921569, 1, 0, 1,
-0.4367712, 1.780939, -0.9025975, 0, 1, 0.003921569, 1,
-0.435597, 0.8640024, -0.7197123, 0, 1, 0.01176471, 1,
-0.4325969, -2.336617, -4.131268, 0, 1, 0.01568628, 1,
-0.4308147, -0.4920302, -3.255123, 0, 1, 0.02352941, 1,
-0.4248397, 1.58024, -1.755373, 0, 1, 0.02745098, 1,
-0.4203079, 0.9310222, -0.8017889, 0, 1, 0.03529412, 1,
-0.4202705, 2.206919, -0.1624857, 0, 1, 0.03921569, 1,
-0.4071435, 0.2525786, -1.641603, 0, 1, 0.04705882, 1,
-0.4037065, 0.5330218, 0.7460322, 0, 1, 0.05098039, 1,
-0.4009779, 0.3149597, -1.012421, 0, 1, 0.05882353, 1,
-0.3964319, 1.728709, -1.12805, 0, 1, 0.0627451, 1,
-0.3937509, 0.9765043, -2.237259, 0, 1, 0.07058824, 1,
-0.3912375, 0.3502021, -0.8011542, 0, 1, 0.07450981, 1,
-0.390473, 0.004580871, -3.12136, 0, 1, 0.08235294, 1,
-0.3865372, 0.02640419, -2.12772, 0, 1, 0.08627451, 1,
-0.3831684, 0.05587985, -1.708155, 0, 1, 0.09411765, 1,
-0.381757, 0.9713003, 0.04975287, 0, 1, 0.1019608, 1,
-0.3817552, -1.059752, -2.929435, 0, 1, 0.1058824, 1,
-0.3811236, -1.519354, -3.093906, 0, 1, 0.1137255, 1,
-0.3776767, -1.126283, -3.117817, 0, 1, 0.1176471, 1,
-0.3767883, -0.8279652, -0.8919883, 0, 1, 0.1254902, 1,
-0.3723271, 1.631177, -0.08495169, 0, 1, 0.1294118, 1,
-0.3665184, -0.8978469, -0.816716, 0, 1, 0.1372549, 1,
-0.3650244, 0.762402, -2.314423, 0, 1, 0.1411765, 1,
-0.3599676, 1.240683, 1.725848, 0, 1, 0.1490196, 1,
-0.3592794, 0.1033021, 0.2546797, 0, 1, 0.1529412, 1,
-0.3579219, 2.397796, 1.083225, 0, 1, 0.1607843, 1,
-0.3571553, 0.02337317, -2.668223, 0, 1, 0.1647059, 1,
-0.3567912, 0.04909669, -1.537506, 0, 1, 0.172549, 1,
-0.3551523, -0.4909595, -3.350363, 0, 1, 0.1764706, 1,
-0.3500153, -0.1325081, -2.177151, 0, 1, 0.1843137, 1,
-0.3447964, 1.071614, -1.281574, 0, 1, 0.1882353, 1,
-0.3436402, -0.9688132, -3.477645, 0, 1, 0.1960784, 1,
-0.3432896, 0.9292121, -0.2033404, 0, 1, 0.2039216, 1,
-0.3429235, -0.5581456, -2.50546, 0, 1, 0.2078431, 1,
-0.3407103, -0.4973347, -3.744395, 0, 1, 0.2156863, 1,
-0.3402062, 0.2652496, -1.329805, 0, 1, 0.2196078, 1,
-0.3377176, 0.4103873, -0.6195482, 0, 1, 0.227451, 1,
-0.3330466, 0.5648963, -0.323134, 0, 1, 0.2313726, 1,
-0.3320094, 0.122365, -0.4269018, 0, 1, 0.2392157, 1,
-0.3290237, -1.636642, -2.867306, 0, 1, 0.2431373, 1,
-0.3279551, -1.178633, -3.158479, 0, 1, 0.2509804, 1,
-0.3257249, 0.06631885, -1.023138, 0, 1, 0.254902, 1,
-0.3227867, 0.5041225, -0.3992788, 0, 1, 0.2627451, 1,
-0.3194846, -0.328334, -3.533628, 0, 1, 0.2666667, 1,
-0.3191151, 0.844157, -0.2873416, 0, 1, 0.2745098, 1,
-0.3189338, -0.1037521, -0.7429918, 0, 1, 0.2784314, 1,
-0.3183734, -0.4406813, -1.706702, 0, 1, 0.2862745, 1,
-0.3050686, -1.348319, -1.61198, 0, 1, 0.2901961, 1,
-0.3019237, 0.2491518, -1.484611, 0, 1, 0.2980392, 1,
-0.2889715, 0.2756335, 0.402494, 0, 1, 0.3058824, 1,
-0.2879823, 0.6047791, 0.150717, 0, 1, 0.3098039, 1,
-0.2869013, -1.716117, -0.7323402, 0, 1, 0.3176471, 1,
-0.2855203, -0.50625, -1.886367, 0, 1, 0.3215686, 1,
-0.2851374, -0.4871453, -2.071794, 0, 1, 0.3294118, 1,
-0.2836131, 0.8232701, -0.5018228, 0, 1, 0.3333333, 1,
-0.2810257, 0.5164706, -0.06344622, 0, 1, 0.3411765, 1,
-0.2803181, -0.3214935, -0.7458261, 0, 1, 0.345098, 1,
-0.2764545, -0.2818404, -1.412828, 0, 1, 0.3529412, 1,
-0.2702385, -1.234618, -3.586319, 0, 1, 0.3568628, 1,
-0.266418, 0.2055983, -0.2244621, 0, 1, 0.3647059, 1,
-0.266213, 0.3027965, -1.9476, 0, 1, 0.3686275, 1,
-0.2652567, -0.9734, -3.854554, 0, 1, 0.3764706, 1,
-0.2628887, -2.049463, -2.140278, 0, 1, 0.3803922, 1,
-0.2575159, -1.310045, -1.871935, 0, 1, 0.3882353, 1,
-0.2573927, 2.434694, 0.2174084, 0, 1, 0.3921569, 1,
-0.2569411, 0.2262582, -0.4444755, 0, 1, 0.4, 1,
-0.2565701, 0.07353064, -2.149378, 0, 1, 0.4078431, 1,
-0.2502849, -2.267549, -4.361918, 0, 1, 0.4117647, 1,
-0.2491411, 0.5723721, -1.787438, 0, 1, 0.4196078, 1,
-0.2459121, 1.052325, -0.4002956, 0, 1, 0.4235294, 1,
-0.2438407, -0.3119816, -3.015051, 0, 1, 0.4313726, 1,
-0.2406555, 1.595573, -0.3282362, 0, 1, 0.4352941, 1,
-0.2388174, 0.3826313, -0.2394071, 0, 1, 0.4431373, 1,
-0.2356506, -1.01237, -2.592695, 0, 1, 0.4470588, 1,
-0.2295156, 0.4252796, -1.62965, 0, 1, 0.454902, 1,
-0.228726, -1.357706, -1.915197, 0, 1, 0.4588235, 1,
-0.2275618, -0.3447004, -0.2345367, 0, 1, 0.4666667, 1,
-0.2259577, 0.1627402, -2.675819, 0, 1, 0.4705882, 1,
-0.2222897, -1.637869, -1.935488, 0, 1, 0.4784314, 1,
-0.2199145, 0.1955511, -1.804567, 0, 1, 0.4823529, 1,
-0.2171649, 0.477714, -1.581214, 0, 1, 0.4901961, 1,
-0.2137297, -0.7672848, -2.359946, 0, 1, 0.4941176, 1,
-0.2132853, 0.8409231, 0.9300936, 0, 1, 0.5019608, 1,
-0.2109787, 0.4519705, 0.3108631, 0, 1, 0.509804, 1,
-0.2084493, 1.574262, -0.7919629, 0, 1, 0.5137255, 1,
-0.1988102, -0.2291659, -2.297768, 0, 1, 0.5215687, 1,
-0.1985869, 0.538292, -1.505541, 0, 1, 0.5254902, 1,
-0.1985653, -2.15181, -1.447013, 0, 1, 0.5333334, 1,
-0.1957767, -0.08118179, -2.340028, 0, 1, 0.5372549, 1,
-0.1944812, -1.491741, -2.35487, 0, 1, 0.5450981, 1,
-0.1938347, 0.6095325, 0.9631215, 0, 1, 0.5490196, 1,
-0.1909, 0.5099648, 1.440105, 0, 1, 0.5568628, 1,
-0.1888204, 1.032695, 0.4439806, 0, 1, 0.5607843, 1,
-0.1883137, 2.177067, -0.01732247, 0, 1, 0.5686275, 1,
-0.1791456, -0.2930659, -1.829843, 0, 1, 0.572549, 1,
-0.1786941, 0.1457742, -1.906821, 0, 1, 0.5803922, 1,
-0.1782945, 0.6473364, 0.1665314, 0, 1, 0.5843138, 1,
-0.1770351, -1.670107, -3.458403, 0, 1, 0.5921569, 1,
-0.1753179, -0.005833261, 0.5790135, 0, 1, 0.5960785, 1,
-0.1744909, 0.7069516, -0.2831517, 0, 1, 0.6039216, 1,
-0.1715151, -0.2388549, -1.682252, 0, 1, 0.6117647, 1,
-0.1714218, -1.928051, -1.764341, 0, 1, 0.6156863, 1,
-0.170292, -1.138144, -3.024864, 0, 1, 0.6235294, 1,
-0.1686664, -0.1153702, -3.214196, 0, 1, 0.627451, 1,
-0.1606217, 1.066239, -0.798227, 0, 1, 0.6352941, 1,
-0.1485923, 0.9867525, -1.345997, 0, 1, 0.6392157, 1,
-0.145037, -0.9050316, -3.727215, 0, 1, 0.6470588, 1,
-0.1333068, -0.7722312, -1.768381, 0, 1, 0.6509804, 1,
-0.1326752, -0.1815323, -3.494898, 0, 1, 0.6588235, 1,
-0.1321741, 0.9481115, 1.334284, 0, 1, 0.6627451, 1,
-0.1276802, -0.8814051, -4.328979, 0, 1, 0.6705883, 1,
-0.125848, 0.764393, 0.3086529, 0, 1, 0.6745098, 1,
-0.1219902, 0.4505874, -1.507497, 0, 1, 0.682353, 1,
-0.1210386, 0.1883894, -0.6492497, 0, 1, 0.6862745, 1,
-0.1200509, 0.4945871, -0.8856845, 0, 1, 0.6941177, 1,
-0.1196795, -0.7461906, -4.077715, 0, 1, 0.7019608, 1,
-0.1181341, -0.2234259, -4.345211, 0, 1, 0.7058824, 1,
-0.117369, 0.5619901, -1.295721, 0, 1, 0.7137255, 1,
-0.1155472, 1.157562, 0.3113473, 0, 1, 0.7176471, 1,
-0.1132093, -0.1219893, -1.965278, 0, 1, 0.7254902, 1,
-0.1126565, -1.011638, -3.664209, 0, 1, 0.7294118, 1,
-0.1122492, 0.3475703, -1.533868, 0, 1, 0.7372549, 1,
-0.1103278, -0.3192243, -1.570914, 0, 1, 0.7411765, 1,
-0.108969, 0.559826, -0.3383671, 0, 1, 0.7490196, 1,
-0.1071078, 0.373847, 2.122285, 0, 1, 0.7529412, 1,
-0.1048887, -0.5887825, -3.677743, 0, 1, 0.7607843, 1,
-0.1038049, -0.1735566, -0.8133718, 0, 1, 0.7647059, 1,
-0.09952312, 1.774329, 0.5162227, 0, 1, 0.772549, 1,
-0.09891263, -0.1100267, -2.586039, 0, 1, 0.7764706, 1,
-0.09659799, -0.4456399, -3.628583, 0, 1, 0.7843137, 1,
-0.0953682, -0.07213517, -3.052509, 0, 1, 0.7882353, 1,
-0.09491919, 1.236323, 0.0841536, 0, 1, 0.7960784, 1,
-0.09124314, -0.5682206, -3.9658, 0, 1, 0.8039216, 1,
-0.09082767, -0.4897239, -1.954043, 0, 1, 0.8078431, 1,
-0.08805004, 0.518234, -0.7219738, 0, 1, 0.8156863, 1,
-0.08331314, -0.6357217, -2.181488, 0, 1, 0.8196079, 1,
-0.06715089, 1.38192, 0.6225877, 0, 1, 0.827451, 1,
-0.06400903, -1.229601, -3.894037, 0, 1, 0.8313726, 1,
-0.06154781, -0.2664029, -2.339595, 0, 1, 0.8392157, 1,
-0.06033608, -4.032552, -2.395719, 0, 1, 0.8431373, 1,
-0.05870951, 1.256168, -1.24035, 0, 1, 0.8509804, 1,
-0.05757451, 0.6410409, 0.1844193, 0, 1, 0.854902, 1,
-0.05277096, 0.3293794, -0.389944, 0, 1, 0.8627451, 1,
-0.04985284, -1.58816, -3.444827, 0, 1, 0.8666667, 1,
-0.04729274, 0.4369542, 0.2407641, 0, 1, 0.8745098, 1,
-0.04567327, 0.8608978, -1.654715, 0, 1, 0.8784314, 1,
-0.04442176, -1.555001, -4.463205, 0, 1, 0.8862745, 1,
-0.04099327, -0.4543393, -4.292815, 0, 1, 0.8901961, 1,
-0.03894018, -0.5566704, -2.582284, 0, 1, 0.8980392, 1,
-0.03847384, -2.640953, -3.155632, 0, 1, 0.9058824, 1,
-0.03636256, -0.2489281, -4.776218, 0, 1, 0.9098039, 1,
-0.03577948, -0.1680931, -3.500656, 0, 1, 0.9176471, 1,
-0.0341303, 0.04634691, 0.3123353, 0, 1, 0.9215686, 1,
-0.03353054, -1.518973, -3.8863, 0, 1, 0.9294118, 1,
-0.0290323, -0.8405812, -3.816807, 0, 1, 0.9333333, 1,
-0.02824279, 0.1770275, -0.687221, 0, 1, 0.9411765, 1,
-0.02795572, 0.1539727, -0.6200271, 0, 1, 0.945098, 1,
-0.01798686, -0.7971987, -3.485409, 0, 1, 0.9529412, 1,
-0.01541156, 0.2586364, -1.145115, 0, 1, 0.9568627, 1,
-0.01318949, -0.5690721, -2.880276, 0, 1, 0.9647059, 1,
-0.0104744, 0.2258547, -1.079354, 0, 1, 0.9686275, 1,
-0.009170329, -1.649718, -2.476055, 0, 1, 0.9764706, 1,
-0.007498065, -0.1337482, -3.556262, 0, 1, 0.9803922, 1,
-0.006731475, -1.048874, -3.036559, 0, 1, 0.9882353, 1,
-0.004169024, 0.544509, -0.5268256, 0, 1, 0.9921569, 1,
-0.004117409, 0.8728356, 0.1495265, 0, 1, 1, 1,
-0.003472848, 1.189684, 0.002043229, 0, 0.9921569, 1, 1,
-0.003298189, 0.7255015, -1.387501, 0, 0.9882353, 1, 1,
-0.0009923776, -0.23154, -2.345806, 0, 0.9803922, 1, 1,
0.008349887, -1.784875, 2.22327, 0, 0.9764706, 1, 1,
0.0147975, 0.02552453, 0.03185954, 0, 0.9686275, 1, 1,
0.01790433, -0.03277495, 2.456111, 0, 0.9647059, 1, 1,
0.02000237, -0.6432168, 5.069105, 0, 0.9568627, 1, 1,
0.02319602, 0.9953678, 0.7804242, 0, 0.9529412, 1, 1,
0.02633548, 0.8214268, 1.283053, 0, 0.945098, 1, 1,
0.02828228, -1.481495, 2.849274, 0, 0.9411765, 1, 1,
0.02830692, 0.3133788, 1.100659, 0, 0.9333333, 1, 1,
0.02839941, 0.04128369, -0.6034636, 0, 0.9294118, 1, 1,
0.02861415, 0.5122761, -0.8445267, 0, 0.9215686, 1, 1,
0.02891415, 1.497893, 1.004894, 0, 0.9176471, 1, 1,
0.02958195, -0.4005625, 2.166976, 0, 0.9098039, 1, 1,
0.03069682, -1.026043, 4.356226, 0, 0.9058824, 1, 1,
0.03346132, 1.842446, 0.6532721, 0, 0.8980392, 1, 1,
0.03818449, 0.06784621, 0.2344398, 0, 0.8901961, 1, 1,
0.03968436, -0.894133, 2.342505, 0, 0.8862745, 1, 1,
0.03985564, -0.8366122, 3.332523, 0, 0.8784314, 1, 1,
0.04247073, -0.6297185, 1.900903, 0, 0.8745098, 1, 1,
0.04952025, 1.288944, -0.2086814, 0, 0.8666667, 1, 1,
0.05440537, -1.799657, 3.257459, 0, 0.8627451, 1, 1,
0.05644437, 1.810069, 0.05730693, 0, 0.854902, 1, 1,
0.05831988, 0.2624834, 1.154007, 0, 0.8509804, 1, 1,
0.06063175, 0.5359934, -1.472073, 0, 0.8431373, 1, 1,
0.06085846, -0.8958124, 2.515498, 0, 0.8392157, 1, 1,
0.0624343, 0.5188415, -1.533481, 0, 0.8313726, 1, 1,
0.06326888, -1.584894, 4.327682, 0, 0.827451, 1, 1,
0.06472268, -1.961802, 4.107852, 0, 0.8196079, 1, 1,
0.07402541, -1.377247, 4.366274, 0, 0.8156863, 1, 1,
0.07569586, -0.625915, 2.476019, 0, 0.8078431, 1, 1,
0.07836463, -1.049531, 2.328052, 0, 0.8039216, 1, 1,
0.08252543, 0.05455821, -0.4011548, 0, 0.7960784, 1, 1,
0.08736099, 0.5130374, 0.3320108, 0, 0.7882353, 1, 1,
0.0894593, 0.4759017, 0.5011428, 0, 0.7843137, 1, 1,
0.09165056, 0.4425372, 0.5921364, 0, 0.7764706, 1, 1,
0.0924245, 1.892571, 0.5742099, 0, 0.772549, 1, 1,
0.09243957, 0.7775586, -1.074721, 0, 0.7647059, 1, 1,
0.09669866, -1.244402, 3.072857, 0, 0.7607843, 1, 1,
0.1007369, -0.3882321, 2.961964, 0, 0.7529412, 1, 1,
0.1051857, -0.5902035, 2.609689, 0, 0.7490196, 1, 1,
0.1109544, -0.9089519, 3.541849, 0, 0.7411765, 1, 1,
0.1121544, 2.088126, -0.7821223, 0, 0.7372549, 1, 1,
0.1149324, 1.231817, -0.837437, 0, 0.7294118, 1, 1,
0.1189648, 0.9260595, 0.242265, 0, 0.7254902, 1, 1,
0.1196984, 0.009115805, 1.111139, 0, 0.7176471, 1, 1,
0.1230629, 1.251015, -1.288616, 0, 0.7137255, 1, 1,
0.1253054, 0.4010518, -1.364228, 0, 0.7058824, 1, 1,
0.1278033, -0.3593931, 0.8571224, 0, 0.6980392, 1, 1,
0.1301073, 0.887172, 0.3893718, 0, 0.6941177, 1, 1,
0.1308714, 0.09369347, 1.290509, 0, 0.6862745, 1, 1,
0.1429307, 0.8760874, 0.7347869, 0, 0.682353, 1, 1,
0.1458397, -0.4878068, 0.8238506, 0, 0.6745098, 1, 1,
0.1467379, -0.272906, 3.232662, 0, 0.6705883, 1, 1,
0.1470101, 0.1184293, 0.4310341, 0, 0.6627451, 1, 1,
0.1530685, -0.8658401, 3.643046, 0, 0.6588235, 1, 1,
0.1560258, -0.04135503, 1.822185, 0, 0.6509804, 1, 1,
0.1565213, 1.404896, -1.635267, 0, 0.6470588, 1, 1,
0.158368, -1.671953, 1.994366, 0, 0.6392157, 1, 1,
0.1620419, -0.09650253, 2.350943, 0, 0.6352941, 1, 1,
0.1635102, 0.2911338, -1.4373, 0, 0.627451, 1, 1,
0.1645619, -1.429182, 3.263891, 0, 0.6235294, 1, 1,
0.1657662, 0.2628803, -0.5371866, 0, 0.6156863, 1, 1,
0.1710491, -0.4244696, 4.151189, 0, 0.6117647, 1, 1,
0.1749326, 1.038442, 0.2103337, 0, 0.6039216, 1, 1,
0.1830523, -2.906563, 5.710851, 0, 0.5960785, 1, 1,
0.1830872, 0.8122137, -0.7788665, 0, 0.5921569, 1, 1,
0.1832807, 1.165188, 0.7033346, 0, 0.5843138, 1, 1,
0.1840207, -0.9308876, 1.944467, 0, 0.5803922, 1, 1,
0.1843354, 0.02118541, 2.277707, 0, 0.572549, 1, 1,
0.1900664, -1.207353, 4.191967, 0, 0.5686275, 1, 1,
0.1905935, -1.417105, 1.046277, 0, 0.5607843, 1, 1,
0.1965611, -0.7376584, 2.933572, 0, 0.5568628, 1, 1,
0.1986821, 0.6548356, 1.176523, 0, 0.5490196, 1, 1,
0.2079503, -0.9222787, 4.199565, 0, 0.5450981, 1, 1,
0.2083555, 0.407347, -0.01012117, 0, 0.5372549, 1, 1,
0.2171945, 1.011764, -0.1569712, 0, 0.5333334, 1, 1,
0.21875, -0.4345013, 3.487456, 0, 0.5254902, 1, 1,
0.2266428, -0.6683828, 2.163594, 0, 0.5215687, 1, 1,
0.2268184, 0.8981694, -1.717414, 0, 0.5137255, 1, 1,
0.2322962, 0.2484704, 2.949548, 0, 0.509804, 1, 1,
0.2335004, -0.3850251, 3.700122, 0, 0.5019608, 1, 1,
0.2377912, 1.343975, 0.034282, 0, 0.4941176, 1, 1,
0.2416147, -1.599458, 3.60665, 0, 0.4901961, 1, 1,
0.242329, 2.286405, 0.5414842, 0, 0.4823529, 1, 1,
0.2448739, -1.000519, 3.390932, 0, 0.4784314, 1, 1,
0.2452694, 3.411106, 0.5074592, 0, 0.4705882, 1, 1,
0.247566, -0.3371135, 1.222078, 0, 0.4666667, 1, 1,
0.2490931, 0.7392645, 1.107329, 0, 0.4588235, 1, 1,
0.2534912, 1.448129, 1.049442, 0, 0.454902, 1, 1,
0.2543184, 0.1546169, 1.768108, 0, 0.4470588, 1, 1,
0.2561959, 0.8128195, -0.3577073, 0, 0.4431373, 1, 1,
0.2586519, 0.2858055, 0.7942031, 0, 0.4352941, 1, 1,
0.2588886, -0.08311186, 2.117851, 0, 0.4313726, 1, 1,
0.2637517, 1.265581, 1.136389, 0, 0.4235294, 1, 1,
0.2670667, -1.39687, 2.94004, 0, 0.4196078, 1, 1,
0.268675, 1.889076, -0.3449734, 0, 0.4117647, 1, 1,
0.2717275, 0.4654934, 2.410716, 0, 0.4078431, 1, 1,
0.2740932, -1.808177, 2.91665, 0, 0.4, 1, 1,
0.2742895, 0.1652248, 0.4199868, 0, 0.3921569, 1, 1,
0.2774708, 0.6512102, 1.081777, 0, 0.3882353, 1, 1,
0.2788388, -2.568394, 3.314008, 0, 0.3803922, 1, 1,
0.2832803, -0.5541303, 3.372927, 0, 0.3764706, 1, 1,
0.2839893, -1.081053, 2.706776, 0, 0.3686275, 1, 1,
0.2906566, 1.62459, 0.2516031, 0, 0.3647059, 1, 1,
0.2919544, 2.007007, -0.06052443, 0, 0.3568628, 1, 1,
0.2936831, -0.6065187, 3.185455, 0, 0.3529412, 1, 1,
0.2952289, 0.4604178, -0.4498035, 0, 0.345098, 1, 1,
0.3001907, -0.5041525, 2.031439, 0, 0.3411765, 1, 1,
0.3003295, 2.64865, 0.3031319, 0, 0.3333333, 1, 1,
0.3011166, -0.4724137, 2.062422, 0, 0.3294118, 1, 1,
0.3029366, -0.09071024, 1.346189, 0, 0.3215686, 1, 1,
0.3040864, -0.5350186, 2.514709, 0, 0.3176471, 1, 1,
0.3042862, -0.1772785, 2.140782, 0, 0.3098039, 1, 1,
0.3047288, -0.1951005, 0.9839541, 0, 0.3058824, 1, 1,
0.3052055, -0.493777, 2.525883, 0, 0.2980392, 1, 1,
0.3055008, 2.227291, -2.099637, 0, 0.2901961, 1, 1,
0.3115076, -0.3568574, 1.322716, 0, 0.2862745, 1, 1,
0.3147427, 0.3833608, 1.156377, 0, 0.2784314, 1, 1,
0.3148311, -0.6382177, 3.443354, 0, 0.2745098, 1, 1,
0.3169434, -0.6251214, 3.271877, 0, 0.2666667, 1, 1,
0.3171498, 0.9428289, -1.142257, 0, 0.2627451, 1, 1,
0.319999, 2.233211, 0.01608592, 0, 0.254902, 1, 1,
0.323983, 0.2053468, 1.911365, 0, 0.2509804, 1, 1,
0.3263697, -0.3753768, 4.014114, 0, 0.2431373, 1, 1,
0.327985, -0.5564774, 4.75429, 0, 0.2392157, 1, 1,
0.3319742, 0.6982665, 1.458775, 0, 0.2313726, 1, 1,
0.3350561, 0.3104411, 1.690411, 0, 0.227451, 1, 1,
0.3379003, -0.1771845, 0.2068936, 0, 0.2196078, 1, 1,
0.3396433, -0.142156, 2.519585, 0, 0.2156863, 1, 1,
0.3410263, 1.204195, 0.1816885, 0, 0.2078431, 1, 1,
0.343163, 0.08842885, 0.7793624, 0, 0.2039216, 1, 1,
0.3447012, 0.9325007, 2.020867, 0, 0.1960784, 1, 1,
0.3484107, -1.316625, 2.788353, 0, 0.1882353, 1, 1,
0.3500595, -0.6150609, 3.292608, 0, 0.1843137, 1, 1,
0.3703243, -1.338406, 2.731887, 0, 0.1764706, 1, 1,
0.3758639, -1.466825, 2.6467, 0, 0.172549, 1, 1,
0.3768625, 0.7676619, 0.2281221, 0, 0.1647059, 1, 1,
0.3782887, 1.48248, -0.7348784, 0, 0.1607843, 1, 1,
0.3787791, 2.057266, 0.2003705, 0, 0.1529412, 1, 1,
0.3796274, 0.6206685, 1.535254, 0, 0.1490196, 1, 1,
0.380041, -0.1642054, 1.606181, 0, 0.1411765, 1, 1,
0.3844411, -0.5761187, 3.40483, 0, 0.1372549, 1, 1,
0.3904575, 1.588654, 0.4055589, 0, 0.1294118, 1, 1,
0.3938308, -0.8730377, 3.396776, 0, 0.1254902, 1, 1,
0.3984756, 1.995529, 0.3886746, 0, 0.1176471, 1, 1,
0.3988885, -0.9634017, 3.45362, 0, 0.1137255, 1, 1,
0.4012465, -0.2015148, 3.539443, 0, 0.1058824, 1, 1,
0.4040741, -0.2695453, 1.643291, 0, 0.09803922, 1, 1,
0.4082164, -0.961557, 2.921191, 0, 0.09411765, 1, 1,
0.4103702, -1.240577, 0.9925283, 0, 0.08627451, 1, 1,
0.4148204, 1.948303, -0.2005768, 0, 0.08235294, 1, 1,
0.4171527, -0.1159312, 4.00247, 0, 0.07450981, 1, 1,
0.4190421, 0.1367882, 0.03267734, 0, 0.07058824, 1, 1,
0.4230309, 1.068759, 0.9803352, 0, 0.0627451, 1, 1,
0.4232283, 0.2933857, 2.252732, 0, 0.05882353, 1, 1,
0.4278595, -0.7374573, 1.796689, 0, 0.05098039, 1, 1,
0.4285322, 0.8691048, 0.3607489, 0, 0.04705882, 1, 1,
0.4338717, -1.95263, 3.788466, 0, 0.03921569, 1, 1,
0.4344055, 0.3199408, -0.2776265, 0, 0.03529412, 1, 1,
0.4350995, 0.7632428, 0.1046494, 0, 0.02745098, 1, 1,
0.4351312, -0.2859664, 3.940375, 0, 0.02352941, 1, 1,
0.4381189, -1.175166, 3.471161, 0, 0.01568628, 1, 1,
0.4425537, 0.1219119, 2.150878, 0, 0.01176471, 1, 1,
0.4457959, -0.3719162, 2.917882, 0, 0.003921569, 1, 1,
0.4494573, 0.2563729, -0.4420685, 0.003921569, 0, 1, 1,
0.4505234, -0.1962994, 1.295697, 0.007843138, 0, 1, 1,
0.4506027, 1.836634, -1.447782, 0.01568628, 0, 1, 1,
0.458444, -1.51686, 1.750106, 0.01960784, 0, 1, 1,
0.45885, 0.9948674, -0.8488528, 0.02745098, 0, 1, 1,
0.4617599, -0.1997464, 1.663152, 0.03137255, 0, 1, 1,
0.4708758, -0.8666308, 2.264139, 0.03921569, 0, 1, 1,
0.4728512, -0.1084423, 1.408556, 0.04313726, 0, 1, 1,
0.4821675, -1.063607, 3.146826, 0.05098039, 0, 1, 1,
0.4843925, -1.381746, 2.434101, 0.05490196, 0, 1, 1,
0.4884816, 1.220351, 0.4610359, 0.0627451, 0, 1, 1,
0.4946519, -0.73107, 3.696009, 0.06666667, 0, 1, 1,
0.4965765, 0.9133215, 1.616239, 0.07450981, 0, 1, 1,
0.4988332, 0.5905164, 1.497339, 0.07843138, 0, 1, 1,
0.4992149, 1.056433, -0.1043264, 0.08627451, 0, 1, 1,
0.5010054, -0.5132507, 3.697446, 0.09019608, 0, 1, 1,
0.5051484, -1.663555, 3.272498, 0.09803922, 0, 1, 1,
0.5071957, 0.5627958, 2.132958, 0.1058824, 0, 1, 1,
0.5134327, -0.2349378, 1.703753, 0.1098039, 0, 1, 1,
0.5242531, 1.221264, -0.3181967, 0.1176471, 0, 1, 1,
0.5309616, -0.1602284, 1.378035, 0.1215686, 0, 1, 1,
0.5380831, -1.329753, 2.381886, 0.1294118, 0, 1, 1,
0.5403953, 0.7443927, -0.3509349, 0.1333333, 0, 1, 1,
0.5437305, 1.275132, -0.135403, 0.1411765, 0, 1, 1,
0.549613, -0.008670293, 1.290647, 0.145098, 0, 1, 1,
0.5545012, 0.1419776, 1.036095, 0.1529412, 0, 1, 1,
0.5582287, 0.3112689, 1.489004, 0.1568628, 0, 1, 1,
0.5586914, 0.2796407, -0.08002257, 0.1647059, 0, 1, 1,
0.5676808, -0.6277994, 2.146511, 0.1686275, 0, 1, 1,
0.5680267, 1.2758, -0.3117355, 0.1764706, 0, 1, 1,
0.5687491, -0.6954021, 1.622872, 0.1803922, 0, 1, 1,
0.5726652, 0.6981879, 0.3609096, 0.1882353, 0, 1, 1,
0.5745679, 1.733882, -1.388108, 0.1921569, 0, 1, 1,
0.5746296, -0.579393, 5.280102, 0.2, 0, 1, 1,
0.5774277, 0.4130946, 1.54047, 0.2078431, 0, 1, 1,
0.5785452, -0.4015464, 1.170703, 0.2117647, 0, 1, 1,
0.5785741, -0.3533791, 3.123665, 0.2196078, 0, 1, 1,
0.5863163, 1.237409, 0.707731, 0.2235294, 0, 1, 1,
0.5886768, -0.6845974, -0.5078944, 0.2313726, 0, 1, 1,
0.5921361, 1.303987, 1.692992, 0.2352941, 0, 1, 1,
0.5927426, 0.3632201, 1.703262, 0.2431373, 0, 1, 1,
0.5932737, 0.4153001, 1.559412, 0.2470588, 0, 1, 1,
0.6016948, 1.094373, 0.7716271, 0.254902, 0, 1, 1,
0.6045899, -0.04915449, 2.514153, 0.2588235, 0, 1, 1,
0.6053372, -0.6992105, 0.9963834, 0.2666667, 0, 1, 1,
0.6062999, 1.313329, 0.6358055, 0.2705882, 0, 1, 1,
0.6104552, -0.2730376, 2.07985, 0.2784314, 0, 1, 1,
0.6114871, -0.5269724, 3.583429, 0.282353, 0, 1, 1,
0.6137509, -0.3931238, 3.667075, 0.2901961, 0, 1, 1,
0.6150996, 0.5416735, 0.9348754, 0.2941177, 0, 1, 1,
0.6153208, -1.130883, 3.200114, 0.3019608, 0, 1, 1,
0.6162175, -1.116075, 2.826414, 0.3098039, 0, 1, 1,
0.6177891, -0.3703682, 1.551617, 0.3137255, 0, 1, 1,
0.6180591, 0.8979606, 0.9950091, 0.3215686, 0, 1, 1,
0.6187831, -1.777016, 1.80578, 0.3254902, 0, 1, 1,
0.6201268, -0.5876917, 1.261925, 0.3333333, 0, 1, 1,
0.6233571, -0.3412483, 2.352028, 0.3372549, 0, 1, 1,
0.6285774, 0.7009935, 0.6802067, 0.345098, 0, 1, 1,
0.6298295, 0.8608566, 0.8647912, 0.3490196, 0, 1, 1,
0.6319502, 0.7746716, 0.995702, 0.3568628, 0, 1, 1,
0.6343018, -0.3213427, 2.509299, 0.3607843, 0, 1, 1,
0.6355917, -1.095293, 4.372461, 0.3686275, 0, 1, 1,
0.6372719, 0.3553365, 2.314863, 0.372549, 0, 1, 1,
0.6397305, 0.5162549, 0.2313341, 0.3803922, 0, 1, 1,
0.6433471, 1.084769, 0.4550444, 0.3843137, 0, 1, 1,
0.6443614, -0.9688848, 1.96757, 0.3921569, 0, 1, 1,
0.644424, -0.6615145, 2.183125, 0.3960784, 0, 1, 1,
0.6445171, -0.5898138, 1.586412, 0.4039216, 0, 1, 1,
0.6525832, 0.3203795, 1.163452, 0.4117647, 0, 1, 1,
0.6539125, 0.7684301, -1.852194, 0.4156863, 0, 1, 1,
0.6545168, 0.146925, 0.7434158, 0.4235294, 0, 1, 1,
0.6553329, -0.5370681, 1.749865, 0.427451, 0, 1, 1,
0.6572867, -0.9335159, 2.021763, 0.4352941, 0, 1, 1,
0.6577117, -0.3863655, 2.551908, 0.4392157, 0, 1, 1,
0.661537, 0.2362711, 0.475907, 0.4470588, 0, 1, 1,
0.6627035, -0.6942852, 3.066959, 0.4509804, 0, 1, 1,
0.6674449, 0.656453, 0.2669438, 0.4588235, 0, 1, 1,
0.6699935, 0.1983452, 1.119221, 0.4627451, 0, 1, 1,
0.6741301, 0.3336261, 1.059403, 0.4705882, 0, 1, 1,
0.6745388, 0.3407882, 0.6457846, 0.4745098, 0, 1, 1,
0.6795219, -0.9430568, 3.041831, 0.4823529, 0, 1, 1,
0.6808435, 0.5268357, 0.3941489, 0.4862745, 0, 1, 1,
0.6812643, 0.004728946, 1.372665, 0.4941176, 0, 1, 1,
0.6827547, -2.219567, 2.403044, 0.5019608, 0, 1, 1,
0.6885615, -0.4835582, 2.456459, 0.5058824, 0, 1, 1,
0.6906198, -0.5786665, 3.751959, 0.5137255, 0, 1, 1,
0.6916396, -1.210245, 1.552903, 0.5176471, 0, 1, 1,
0.6923779, -0.6128113, 0.5334109, 0.5254902, 0, 1, 1,
0.6926864, -1.026799, 2.482213, 0.5294118, 0, 1, 1,
0.6950074, 0.7319436, 1.800669, 0.5372549, 0, 1, 1,
0.6950248, -0.1369816, 2.295981, 0.5411765, 0, 1, 1,
0.6961854, 0.1718091, 1.286659, 0.5490196, 0, 1, 1,
0.7000788, 0.3877434, 3.504325, 0.5529412, 0, 1, 1,
0.7008738, -0.1343922, 0.9390353, 0.5607843, 0, 1, 1,
0.7050278, -0.9764267, 3.053685, 0.5647059, 0, 1, 1,
0.7077034, 0.5694832, 0.06484491, 0.572549, 0, 1, 1,
0.7083282, 1.178677, 1.133007, 0.5764706, 0, 1, 1,
0.7101874, 0.6879874, 0.1289433, 0.5843138, 0, 1, 1,
0.7147584, -0.9412001, 3.212847, 0.5882353, 0, 1, 1,
0.718292, -0.6411105, 2.245203, 0.5960785, 0, 1, 1,
0.7221414, 1.023144, 0.6746706, 0.6039216, 0, 1, 1,
0.7238043, -0.01273809, 2.260649, 0.6078432, 0, 1, 1,
0.7238762, 0.1847591, 3.582086, 0.6156863, 0, 1, 1,
0.7276838, -1.016537, 3.062634, 0.6196079, 0, 1, 1,
0.7285338, 0.5722438, 1.638391, 0.627451, 0, 1, 1,
0.7349522, -0.7762069, 4.222707, 0.6313726, 0, 1, 1,
0.7364961, 1.031195, 1.811786, 0.6392157, 0, 1, 1,
0.7410733, -1.560169, 3.808691, 0.6431373, 0, 1, 1,
0.7416075, -0.4208231, 1.461134, 0.6509804, 0, 1, 1,
0.7416469, -0.5473652, 2.548935, 0.654902, 0, 1, 1,
0.7422345, 0.6838986, 0.4748794, 0.6627451, 0, 1, 1,
0.7426075, -1.417917, 2.746296, 0.6666667, 0, 1, 1,
0.7431056, 1.329186, 0.299261, 0.6745098, 0, 1, 1,
0.7470376, 0.6508207, 0.9562577, 0.6784314, 0, 1, 1,
0.7477563, 1.370597, 1.266986, 0.6862745, 0, 1, 1,
0.7519614, -1.119797, 1.280999, 0.6901961, 0, 1, 1,
0.7531836, 0.6145725, 1.536126, 0.6980392, 0, 1, 1,
0.7565794, -0.2191521, 1.440266, 0.7058824, 0, 1, 1,
0.7574245, -0.366393, 1.173133, 0.7098039, 0, 1, 1,
0.7592781, -1.449231, 1.886267, 0.7176471, 0, 1, 1,
0.7599778, -0.5681673, 1.432306, 0.7215686, 0, 1, 1,
0.7625885, 0.2552458, 1.849081, 0.7294118, 0, 1, 1,
0.7627552, -1.128309, 3.463088, 0.7333333, 0, 1, 1,
0.7643518, 1.607065, 0.1731204, 0.7411765, 0, 1, 1,
0.7660689, 0.006371684, 1.836908, 0.7450981, 0, 1, 1,
0.7694478, -0.9310013, 3.577246, 0.7529412, 0, 1, 1,
0.7699617, 1.105444, -0.02128446, 0.7568628, 0, 1, 1,
0.7703968, 0.6810452, 0.371181, 0.7647059, 0, 1, 1,
0.7704737, -0.4416822, 0.8668752, 0.7686275, 0, 1, 1,
0.7809137, 1.686367, -1.442694, 0.7764706, 0, 1, 1,
0.789365, 0.2975396, 0.68809, 0.7803922, 0, 1, 1,
0.7904068, 0.4204991, 3.217685, 0.7882353, 0, 1, 1,
0.791234, -2.042137, 2.087746, 0.7921569, 0, 1, 1,
0.7925798, 0.1582039, 1.17043, 0.8, 0, 1, 1,
0.7951506, -1.523894, 2.260124, 0.8078431, 0, 1, 1,
0.7969086, 0.1189902, 2.570727, 0.8117647, 0, 1, 1,
0.7987664, -1.497771, 2.643795, 0.8196079, 0, 1, 1,
0.8051715, -1.843248, 3.467156, 0.8235294, 0, 1, 1,
0.8099639, -0.2305854, 1.523948, 0.8313726, 0, 1, 1,
0.8122948, -0.9748836, 2.363122, 0.8352941, 0, 1, 1,
0.8185121, 0.3562964, -0.8368197, 0.8431373, 0, 1, 1,
0.8222629, 1.687399, 0.9370638, 0.8470588, 0, 1, 1,
0.822747, -0.0004364949, -0.3445609, 0.854902, 0, 1, 1,
0.8227981, -0.2950019, 0.6110898, 0.8588235, 0, 1, 1,
0.8239645, 0.7144336, 0.3073712, 0.8666667, 0, 1, 1,
0.8344157, 0.86588, 2.064957, 0.8705882, 0, 1, 1,
0.8452017, -0.740312, 3.209952, 0.8784314, 0, 1, 1,
0.8475437, -0.6096189, 3.368878, 0.8823529, 0, 1, 1,
0.8500391, 0.2733421, 1.336265, 0.8901961, 0, 1, 1,
0.8527262, 0.05537841, 1.062847, 0.8941177, 0, 1, 1,
0.8543512, 1.888916, 0.9025612, 0.9019608, 0, 1, 1,
0.8705015, -1.054559, 2.04518, 0.9098039, 0, 1, 1,
0.8713956, 1.120478, 0.2539577, 0.9137255, 0, 1, 1,
0.8802273, 1.690452, 1.748244, 0.9215686, 0, 1, 1,
0.8854969, 1.648577, 0.0006981994, 0.9254902, 0, 1, 1,
0.8892499, -0.1966478, 2.718482, 0.9333333, 0, 1, 1,
0.8898043, 1.492157, -0.2077597, 0.9372549, 0, 1, 1,
0.8904985, -0.3035414, 2.401541, 0.945098, 0, 1, 1,
0.8956018, -1.61875, 1.893443, 0.9490196, 0, 1, 1,
0.8997706, 0.5871621, 1.951601, 0.9568627, 0, 1, 1,
0.9084173, 1.085101, 1.756963, 0.9607843, 0, 1, 1,
0.9115341, 0.05137108, 0.5463735, 0.9686275, 0, 1, 1,
0.913678, 0.4324651, 0.3680133, 0.972549, 0, 1, 1,
0.9192166, 1.040111, 1.415584, 0.9803922, 0, 1, 1,
0.9299653, 0.6132208, 2.514591, 0.9843137, 0, 1, 1,
0.9361163, -1.041437, 1.700423, 0.9921569, 0, 1, 1,
0.9521802, -0.5015757, 3.648351, 0.9960784, 0, 1, 1,
0.953913, 0.5422636, 0.862987, 1, 0, 0.9960784, 1,
0.9600599, 0.1108741, 1.912067, 1, 0, 0.9882353, 1,
0.9632064, -0.2029631, 1.492557, 1, 0, 0.9843137, 1,
0.9648011, 0.9228591, 1.29216, 1, 0, 0.9764706, 1,
0.9661141, 0.3274634, 1.643317, 1, 0, 0.972549, 1,
0.968757, 0.004135845, 2.005413, 1, 0, 0.9647059, 1,
0.9778854, -0.4483524, 1.779055, 1, 0, 0.9607843, 1,
0.9814098, -2.015623, 4.321248, 1, 0, 0.9529412, 1,
0.9825009, -0.6882205, 0.9772224, 1, 0, 0.9490196, 1,
0.9844344, 0.5912868, 0.6112737, 1, 0, 0.9411765, 1,
0.9918011, 1.362902, 2.215345, 1, 0, 0.9372549, 1,
0.9928322, 1.518938, 1.565247, 1, 0, 0.9294118, 1,
0.994469, 0.9363774, 0.3247027, 1, 0, 0.9254902, 1,
0.9969068, 2.03337, -1.202684, 1, 0, 0.9176471, 1,
0.9984012, 0.7276199, 0.6549672, 1, 0, 0.9137255, 1,
0.998751, -1.488468, 1.889474, 1, 0, 0.9058824, 1,
1.000916, 0.8977259, -0.667317, 1, 0, 0.9019608, 1,
1.004838, 2.136932, -1.60777, 1, 0, 0.8941177, 1,
1.005705, 0.5170153, 2.553958, 1, 0, 0.8862745, 1,
1.016441, -0.9442016, 2.872861, 1, 0, 0.8823529, 1,
1.016565, 1.032488, 1.521191, 1, 0, 0.8745098, 1,
1.022539, -0.4622839, 1.777289, 1, 0, 0.8705882, 1,
1.035644, -1.571068, 3.398659, 1, 0, 0.8627451, 1,
1.036303, 0.2029146, 0.4618144, 1, 0, 0.8588235, 1,
1.036323, -0.6058165, 1.887353, 1, 0, 0.8509804, 1,
1.038961, 1.466648, -0.1591562, 1, 0, 0.8470588, 1,
1.039501, 0.2006925, 0.8490384, 1, 0, 0.8392157, 1,
1.050219, -0.7189794, 2.510985, 1, 0, 0.8352941, 1,
1.053006, 0.6655762, 0.5698867, 1, 0, 0.827451, 1,
1.0714, 1.703674, 1.16466, 1, 0, 0.8235294, 1,
1.090936, 0.9054295, 1.020943, 1, 0, 0.8156863, 1,
1.091295, -1.4675, 3.155124, 1, 0, 0.8117647, 1,
1.091925, 1.816364, -0.9872137, 1, 0, 0.8039216, 1,
1.09535, -0.6083618, 1.942653, 1, 0, 0.7960784, 1,
1.097187, -1.006484, 1.876535, 1, 0, 0.7921569, 1,
1.097715, 0.3066134, 1.051494, 1, 0, 0.7843137, 1,
1.099787, -1.08672, 2.889268, 1, 0, 0.7803922, 1,
1.103598, 2.030514, -1.72422, 1, 0, 0.772549, 1,
1.111407, 0.515928, 0.4030322, 1, 0, 0.7686275, 1,
1.114634, -1.387941, 2.08843, 1, 0, 0.7607843, 1,
1.119764, 0.8318468, 0.09067994, 1, 0, 0.7568628, 1,
1.125533, -0.1058922, 1.605232, 1, 0, 0.7490196, 1,
1.138749, 0.472267, 2.166045, 1, 0, 0.7450981, 1,
1.139768, -0.9221236, 1.209779, 1, 0, 0.7372549, 1,
1.140696, -0.6670354, 2.328194, 1, 0, 0.7333333, 1,
1.14217, 0.09159256, 1.951834, 1, 0, 0.7254902, 1,
1.152393, -0.506555, 1.480393, 1, 0, 0.7215686, 1,
1.166674, 0.6851009, 0.8167362, 1, 0, 0.7137255, 1,
1.172612, 0.7377309, -0.3178349, 1, 0, 0.7098039, 1,
1.173939, 1.541653, 0.04886696, 1, 0, 0.7019608, 1,
1.182957, -0.6264499, 3.340724, 1, 0, 0.6941177, 1,
1.183178, 0.5195752, 3.393682, 1, 0, 0.6901961, 1,
1.19243, -0.01283314, 0.1410664, 1, 0, 0.682353, 1,
1.196203, 0.2182552, 2.942038, 1, 0, 0.6784314, 1,
1.198192, 1.012087, 1.473337, 1, 0, 0.6705883, 1,
1.212384, -0.07237046, 1.851416, 1, 0, 0.6666667, 1,
1.214101, -1.895164, 2.404909, 1, 0, 0.6588235, 1,
1.21839, 1.082952, 0.5761155, 1, 0, 0.654902, 1,
1.222354, 0.2161983, -0.1897804, 1, 0, 0.6470588, 1,
1.224119, 0.1508953, 3.130307, 1, 0, 0.6431373, 1,
1.232746, -0.5960309, 2.03695, 1, 0, 0.6352941, 1,
1.236228, 0.5836411, 1.416675, 1, 0, 0.6313726, 1,
1.242118, -0.5376423, 3.407804, 1, 0, 0.6235294, 1,
1.242895, 1.011512, 0.9258969, 1, 0, 0.6196079, 1,
1.246982, -0.4856597, 1.433023, 1, 0, 0.6117647, 1,
1.251589, -0.9717433, 0.8810108, 1, 0, 0.6078432, 1,
1.251604, -0.556962, 2.033907, 1, 0, 0.6, 1,
1.253496, 1.171367, 1.676853, 1, 0, 0.5921569, 1,
1.262881, 1.416889, -1.757004, 1, 0, 0.5882353, 1,
1.263131, -1.490074, 2.932315, 1, 0, 0.5803922, 1,
1.264392, 1.214643, -0.9708847, 1, 0, 0.5764706, 1,
1.274299, -1.369544, 3.069415, 1, 0, 0.5686275, 1,
1.296574, -0.995619, 1.828241, 1, 0, 0.5647059, 1,
1.302553, -1.328975, 1.319523, 1, 0, 0.5568628, 1,
1.31855, -0.5650083, 1.878502, 1, 0, 0.5529412, 1,
1.32057, -1.031405, -0.08877715, 1, 0, 0.5450981, 1,
1.327401, 1.191571, 1.693011, 1, 0, 0.5411765, 1,
1.330543, 0.7645893, 2.466056, 1, 0, 0.5333334, 1,
1.33435, -0.7224421, 2.600424, 1, 0, 0.5294118, 1,
1.337883, -1.086846, 1.545962, 1, 0, 0.5215687, 1,
1.340945, -0.6772954, 3.077425, 1, 0, 0.5176471, 1,
1.352393, 0.1644958, 1.864224, 1, 0, 0.509804, 1,
1.354716, -1.026625, 1.925682, 1, 0, 0.5058824, 1,
1.360246, -0.2278815, -0.1461229, 1, 0, 0.4980392, 1,
1.365113, -0.1814944, 0.2324449, 1, 0, 0.4901961, 1,
1.381169, 0.9137589, 0.4396058, 1, 0, 0.4862745, 1,
1.386744, -0.757525, 2.051996, 1, 0, 0.4784314, 1,
1.392151, -0.793872, 2.3529, 1, 0, 0.4745098, 1,
1.392179, 0.4310458, 1.322657, 1, 0, 0.4666667, 1,
1.400064, 0.8593013, 0.3478465, 1, 0, 0.4627451, 1,
1.426631, 1.031351, 1.429878, 1, 0, 0.454902, 1,
1.429942, 2.456223, -1.680104, 1, 0, 0.4509804, 1,
1.436667, -0.1416328, 3.797532, 1, 0, 0.4431373, 1,
1.437739, 0.4908111, 2.196085, 1, 0, 0.4392157, 1,
1.439918, 0.6266369, 1.949976, 1, 0, 0.4313726, 1,
1.443714, 1.322462, 0.4654085, 1, 0, 0.427451, 1,
1.447636, -0.9668394, 2.18094, 1, 0, 0.4196078, 1,
1.449535, -0.7975415, 1.65122, 1, 0, 0.4156863, 1,
1.456719, 1.57148, -0.07368796, 1, 0, 0.4078431, 1,
1.477277, -2.23384, 2.617832, 1, 0, 0.4039216, 1,
1.486342, 0.4952209, 1.100911, 1, 0, 0.3960784, 1,
1.496808, 0.07411139, 1.826592, 1, 0, 0.3882353, 1,
1.501067, 1.77725, -0.5336139, 1, 0, 0.3843137, 1,
1.527167, 1.15997, -0.1718315, 1, 0, 0.3764706, 1,
1.556747, -1.168144, 3.084902, 1, 0, 0.372549, 1,
1.562374, 0.8031119, -0.1954528, 1, 0, 0.3647059, 1,
1.563279, 0.5916587, 0.4873874, 1, 0, 0.3607843, 1,
1.565299, -0.3231929, 2.008388, 1, 0, 0.3529412, 1,
1.568681, 0.1093049, 1.369099, 1, 0, 0.3490196, 1,
1.575392, 0.7668424, 1.785301, 1, 0, 0.3411765, 1,
1.593843, 0.9335749, 0.8143807, 1, 0, 0.3372549, 1,
1.599218, -1.358062, 0.3365841, 1, 0, 0.3294118, 1,
1.606181, -0.09793027, 2.291047, 1, 0, 0.3254902, 1,
1.60762, -1.722786, 2.671077, 1, 0, 0.3176471, 1,
1.638417, -0.3282188, 0.3305025, 1, 0, 0.3137255, 1,
1.638434, -0.4719684, 2.689827, 1, 0, 0.3058824, 1,
1.646613, 0.04291041, 2.303148, 1, 0, 0.2980392, 1,
1.649649, 0.009799596, 1.307844, 1, 0, 0.2941177, 1,
1.651232, 1.106694, 0.1420906, 1, 0, 0.2862745, 1,
1.656965, 0.6302347, 1.526873, 1, 0, 0.282353, 1,
1.661612, 2.383634, -0.4875297, 1, 0, 0.2745098, 1,
1.661686, -1.29533, 2.737068, 1, 0, 0.2705882, 1,
1.669917, -1.706903, 2.578266, 1, 0, 0.2627451, 1,
1.681011, -0.09661374, 0.7130603, 1, 0, 0.2588235, 1,
1.701578, -1.536369, 4.379693, 1, 0, 0.2509804, 1,
1.714382, 0.5748054, 1.6735, 1, 0, 0.2470588, 1,
1.722173, -0.284793, 2.611651, 1, 0, 0.2392157, 1,
1.723569, -0.3484972, 3.465828, 1, 0, 0.2352941, 1,
1.723794, -0.7908372, 0.7418448, 1, 0, 0.227451, 1,
1.734218, -0.5387207, 2.879226, 1, 0, 0.2235294, 1,
1.749108, 0.6363854, 1.153881, 1, 0, 0.2156863, 1,
1.753583, -0.08417451, 1.101123, 1, 0, 0.2117647, 1,
1.761315, 0.7364472, 0.3497376, 1, 0, 0.2039216, 1,
1.762067, -0.3772877, 1.727157, 1, 0, 0.1960784, 1,
1.769751, -2.412338, 0.9190864, 1, 0, 0.1921569, 1,
1.772385, 2.290918, 0.4774438, 1, 0, 0.1843137, 1,
1.775061, 0.6145399, 1.61349, 1, 0, 0.1803922, 1,
1.791675, -0.1755058, -0.2049646, 1, 0, 0.172549, 1,
1.797971, -1.803404, 1.588618, 1, 0, 0.1686275, 1,
1.81845, 0.2872875, 2.610261, 1, 0, 0.1607843, 1,
1.855623, -0.7257278, 1.612975, 1, 0, 0.1568628, 1,
1.890851, -0.1015315, 0.9380897, 1, 0, 0.1490196, 1,
1.891225, 1.315521, -0.01675762, 1, 0, 0.145098, 1,
1.903249, 0.5532614, 1.298084, 1, 0, 0.1372549, 1,
1.92334, -1.6682, 3.221441, 1, 0, 0.1333333, 1,
1.932371, 0.02716676, -0.06459849, 1, 0, 0.1254902, 1,
1.946841, -0.4888419, 2.943818, 1, 0, 0.1215686, 1,
1.960367, 2.104985, 2.475605, 1, 0, 0.1137255, 1,
1.990662, 0.7416878, 1.542076, 1, 0, 0.1098039, 1,
1.996985, 0.3538027, 0.9665729, 1, 0, 0.1019608, 1,
2.003646, -0.4859415, 2.583653, 1, 0, 0.09411765, 1,
2.009372, 0.9673653, -0.1576736, 1, 0, 0.09019608, 1,
2.016651, 0.8631935, -0.2350584, 1, 0, 0.08235294, 1,
2.028904, 1.447017, 0.1302894, 1, 0, 0.07843138, 1,
2.08867, -1.000415, 2.187298, 1, 0, 0.07058824, 1,
2.09474, 0.3403817, 1.348518, 1, 0, 0.06666667, 1,
2.105438, -1.178733, 0.7993166, 1, 0, 0.05882353, 1,
2.247003, -0.00364216, 0.8620824, 1, 0, 0.05490196, 1,
2.253721, -0.4943303, 3.195207, 1, 0, 0.04705882, 1,
2.347116, 0.5588734, -0.2104115, 1, 0, 0.04313726, 1,
2.349878, 0.005137776, 2.710913, 1, 0, 0.03529412, 1,
2.357273, -1.946777, -0.3854289, 1, 0, 0.03137255, 1,
2.643857, -0.3984457, 1.908947, 1, 0, 0.02352941, 1,
2.763474, -0.3363877, 2.52897, 1, 0, 0.01960784, 1,
2.95766, -0.587581, 2.330347, 1, 0, 0.01176471, 1,
3.564272, -1.639732, 0.6010534, 1, 0, 0.007843138, 1
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
-0.1766942, -5.294252, -6.817522, 0, -0.5, 0.5, 0.5,
-0.1766942, -5.294252, -6.817522, 1, -0.5, 0.5, 0.5,
-0.1766942, -5.294252, -6.817522, 1, 1.5, 0.5, 0.5,
-0.1766942, -5.294252, -6.817522, 0, 1.5, 0.5, 0.5
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
-5.185847, -0.3107233, -6.817522, 0, -0.5, 0.5, 0.5,
-5.185847, -0.3107233, -6.817522, 1, -0.5, 0.5, 0.5,
-5.185847, -0.3107233, -6.817522, 1, 1.5, 0.5, 0.5,
-5.185847, -0.3107233, -6.817522, 0, 1.5, 0.5, 0.5
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
-5.185847, -5.294252, 0.3545568, 0, -0.5, 0.5, 0.5,
-5.185847, -5.294252, 0.3545568, 1, -0.5, 0.5, 0.5,
-5.185847, -5.294252, 0.3545568, 1, 1.5, 0.5, 0.5,
-5.185847, -5.294252, 0.3545568, 0, 1.5, 0.5, 0.5
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
-2, -4.144207, -5.162426,
2, -4.144207, -5.162426,
-2, -4.144207, -5.162426,
-2, -4.335881, -5.438276,
0, -4.144207, -5.162426,
0, -4.335881, -5.438276,
2, -4.144207, -5.162426,
2, -4.335881, -5.438276
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
-2, -4.71923, -5.989974, 0, -0.5, 0.5, 0.5,
-2, -4.71923, -5.989974, 1, -0.5, 0.5, 0.5,
-2, -4.71923, -5.989974, 1, 1.5, 0.5, 0.5,
-2, -4.71923, -5.989974, 0, 1.5, 0.5, 0.5,
0, -4.71923, -5.989974, 0, -0.5, 0.5, 0.5,
0, -4.71923, -5.989974, 1, -0.5, 0.5, 0.5,
0, -4.71923, -5.989974, 1, 1.5, 0.5, 0.5,
0, -4.71923, -5.989974, 0, 1.5, 0.5, 0.5,
2, -4.71923, -5.989974, 0, -0.5, 0.5, 0.5,
2, -4.71923, -5.989974, 1, -0.5, 0.5, 0.5,
2, -4.71923, -5.989974, 1, 1.5, 0.5, 0.5,
2, -4.71923, -5.989974, 0, 1.5, 0.5, 0.5
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
-4.029889, -4, -5.162426,
-4.029889, 2, -5.162426,
-4.029889, -4, -5.162426,
-4.222548, -4, -5.438276,
-4.029889, -2, -5.162426,
-4.222548, -2, -5.438276,
-4.029889, 0, -5.162426,
-4.222548, 0, -5.438276,
-4.029889, 2, -5.162426,
-4.222548, 2, -5.438276
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
-4.607868, -4, -5.989974, 0, -0.5, 0.5, 0.5,
-4.607868, -4, -5.989974, 1, -0.5, 0.5, 0.5,
-4.607868, -4, -5.989974, 1, 1.5, 0.5, 0.5,
-4.607868, -4, -5.989974, 0, 1.5, 0.5, 0.5,
-4.607868, -2, -5.989974, 0, -0.5, 0.5, 0.5,
-4.607868, -2, -5.989974, 1, -0.5, 0.5, 0.5,
-4.607868, -2, -5.989974, 1, 1.5, 0.5, 0.5,
-4.607868, -2, -5.989974, 0, 1.5, 0.5, 0.5,
-4.607868, 0, -5.989974, 0, -0.5, 0.5, 0.5,
-4.607868, 0, -5.989974, 1, -0.5, 0.5, 0.5,
-4.607868, 0, -5.989974, 1, 1.5, 0.5, 0.5,
-4.607868, 0, -5.989974, 0, 1.5, 0.5, 0.5,
-4.607868, 2, -5.989974, 0, -0.5, 0.5, 0.5,
-4.607868, 2, -5.989974, 1, -0.5, 0.5, 0.5,
-4.607868, 2, -5.989974, 1, 1.5, 0.5, 0.5,
-4.607868, 2, -5.989974, 0, 1.5, 0.5, 0.5
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
-4.029889, -4.144207, -4,
-4.029889, -4.144207, 4,
-4.029889, -4.144207, -4,
-4.222548, -4.335881, -4,
-4.029889, -4.144207, -2,
-4.222548, -4.335881, -2,
-4.029889, -4.144207, 0,
-4.222548, -4.335881, 0,
-4.029889, -4.144207, 2,
-4.222548, -4.335881, 2,
-4.029889, -4.144207, 4,
-4.222548, -4.335881, 4
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
-4.607868, -4.71923, -4, 0, -0.5, 0.5, 0.5,
-4.607868, -4.71923, -4, 1, -0.5, 0.5, 0.5,
-4.607868, -4.71923, -4, 1, 1.5, 0.5, 0.5,
-4.607868, -4.71923, -4, 0, 1.5, 0.5, 0.5,
-4.607868, -4.71923, -2, 0, -0.5, 0.5, 0.5,
-4.607868, -4.71923, -2, 1, -0.5, 0.5, 0.5,
-4.607868, -4.71923, -2, 1, 1.5, 0.5, 0.5,
-4.607868, -4.71923, -2, 0, 1.5, 0.5, 0.5,
-4.607868, -4.71923, 0, 0, -0.5, 0.5, 0.5,
-4.607868, -4.71923, 0, 1, -0.5, 0.5, 0.5,
-4.607868, -4.71923, 0, 1, 1.5, 0.5, 0.5,
-4.607868, -4.71923, 0, 0, 1.5, 0.5, 0.5,
-4.607868, -4.71923, 2, 0, -0.5, 0.5, 0.5,
-4.607868, -4.71923, 2, 1, -0.5, 0.5, 0.5,
-4.607868, -4.71923, 2, 1, 1.5, 0.5, 0.5,
-4.607868, -4.71923, 2, 0, 1.5, 0.5, 0.5,
-4.607868, -4.71923, 4, 0, -0.5, 0.5, 0.5,
-4.607868, -4.71923, 4, 1, -0.5, 0.5, 0.5,
-4.607868, -4.71923, 4, 1, 1.5, 0.5, 0.5,
-4.607868, -4.71923, 4, 0, 1.5, 0.5, 0.5
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
-4.029889, -4.144207, -5.162426,
-4.029889, 3.52276, -5.162426,
-4.029889, -4.144207, 5.87154,
-4.029889, 3.52276, 5.87154,
-4.029889, -4.144207, -5.162426,
-4.029889, -4.144207, 5.87154,
-4.029889, 3.52276, -5.162426,
-4.029889, 3.52276, 5.87154,
-4.029889, -4.144207, -5.162426,
3.676501, -4.144207, -5.162426,
-4.029889, -4.144207, 5.87154,
3.676501, -4.144207, 5.87154,
-4.029889, 3.52276, -5.162426,
3.676501, 3.52276, -5.162426,
-4.029889, 3.52276, 5.87154,
3.676501, 3.52276, 5.87154,
3.676501, -4.144207, -5.162426,
3.676501, 3.52276, -5.162426,
3.676501, -4.144207, 5.87154,
3.676501, 3.52276, 5.87154,
3.676501, -4.144207, -5.162426,
3.676501, -4.144207, 5.87154,
3.676501, 3.52276, -5.162426,
3.676501, 3.52276, 5.87154
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
var radius = 8.271;
var distance = 36.79861;
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
mvMatrix.translate( 0.1766942, 0.3107233, -0.3545568 );
mvMatrix.scale( 1.160435, 1.166402, 0.8104762 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.79861);
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


```r
open3d()
```

```
## glX 
##   2
```

```r
perhydroazepine-1-th<-read.table("perhydroazepine-1-th.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-perhydroazepine-1-th$V2
```

```
## Error in eval(expr, envir, enclos): object 'perhydroazepine' not found
```

```r
y<-perhydroazepine-1-th$V3
```

```
## Error in eval(expr, envir, enclos): object 'perhydroazepine' not found
```

```r
z<-perhydroazepine-1-th$V4
```

```
## Error in eval(expr, envir, enclos): object 'perhydroazepine' not found
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
-3.91766, 0.8599173, -0.5515691, 0, 0, 1, 1, 1,
-3.449156, -1.61222, -1.283394, 1, 0, 0, 1, 1,
-3.418875, -0.8114929, -1.326713, 1, 0, 0, 1, 1,
-2.808892, 1.394384, -2.332738, 1, 0, 0, 1, 1,
-2.524012, -0.5908825, -0.1285863, 1, 0, 0, 1, 1,
-2.447366, 1.115481, -1.263547, 1, 0, 0, 1, 1,
-2.446654, 2.10188, -1.002921, 0, 0, 0, 1, 1,
-2.441948, -0.5018812, -2.24996, 0, 0, 0, 1, 1,
-2.416775, -0.1123629, 0.6441224, 0, 0, 0, 1, 1,
-2.415462, 0.009699431, -2.014154, 0, 0, 0, 1, 1,
-2.411472, 1.090128, -1.802509, 0, 0, 0, 1, 1,
-2.300249, -0.4731543, -1.549049, 0, 0, 0, 1, 1,
-2.260656, 0.2573737, -0.2415378, 0, 0, 0, 1, 1,
-2.23395, 1.34932, -1.433315, 1, 1, 1, 1, 1,
-2.228319, 1.624734, -2.653577, 1, 1, 1, 1, 1,
-2.228112, -0.08794282, -3.075805, 1, 1, 1, 1, 1,
-2.162748, 0.6198885, 0.4956027, 1, 1, 1, 1, 1,
-2.149018, -0.1154392, -1.302639, 1, 1, 1, 1, 1,
-2.141311, -1.545185, -1.573343, 1, 1, 1, 1, 1,
-2.126336, 1.848548, -1.762475, 1, 1, 1, 1, 1,
-2.125869, 0.4705012, -2.654245, 1, 1, 1, 1, 1,
-2.11901, 1.464536, -0.2280304, 1, 1, 1, 1, 1,
-2.108886, -0.893064, -1.507826, 1, 1, 1, 1, 1,
-2.105428, -0.6681762, -1.211393, 1, 1, 1, 1, 1,
-2.065886, 1.235568, -0.9948478, 1, 1, 1, 1, 1,
-2.045121, 1.639488, -1.204468, 1, 1, 1, 1, 1,
-2.015896, 0.5303754, -1.471951, 1, 1, 1, 1, 1,
-1.981117, -0.001722638, -2.132053, 1, 1, 1, 1, 1,
-1.947647, -0.7406409, -1.772764, 0, 0, 1, 1, 1,
-1.93265, 0.9705665, -2.992748, 1, 0, 0, 1, 1,
-1.90934, -0.0124858, -1.051481, 1, 0, 0, 1, 1,
-1.897526, -1.098859, -0.7288433, 1, 0, 0, 1, 1,
-1.884274, 1.310032, -0.9363176, 1, 0, 0, 1, 1,
-1.872714, 0.551485, -0.8847319, 1, 0, 0, 1, 1,
-1.872455, 0.5818474, -0.1518486, 0, 0, 0, 1, 1,
-1.847278, 1.482745, -0.5585909, 0, 0, 0, 1, 1,
-1.83795, -1.077815, -1.825205, 0, 0, 0, 1, 1,
-1.829873, -0.02157312, 1.703571, 0, 0, 0, 1, 1,
-1.807806, 1.238461, -0.2703125, 0, 0, 0, 1, 1,
-1.798236, -2.116484, -2.084487, 0, 0, 0, 1, 1,
-1.789351, 2.066543, -1.652059, 0, 0, 0, 1, 1,
-1.769174, 1.075032, -2.756787, 1, 1, 1, 1, 1,
-1.759059, -0.5412344, -0.1842087, 1, 1, 1, 1, 1,
-1.758397, -1.381356, -2.026249, 1, 1, 1, 1, 1,
-1.740328, 0.330633, 0.03843541, 1, 1, 1, 1, 1,
-1.732901, 1.236684, -2.784417, 1, 1, 1, 1, 1,
-1.731799, -1.748335, -2.232494, 1, 1, 1, 1, 1,
-1.66972, 0.4384283, -0.749941, 1, 1, 1, 1, 1,
-1.634739, -0.5119407, -2.23645, 1, 1, 1, 1, 1,
-1.633789, 0.6887038, -2.086987, 1, 1, 1, 1, 1,
-1.624939, -0.3046931, -0.4621001, 1, 1, 1, 1, 1,
-1.619512, -1.916839, -1.786971, 1, 1, 1, 1, 1,
-1.613819, -0.5477483, -3.082524, 1, 1, 1, 1, 1,
-1.606082, -0.4823, -1.818394, 1, 1, 1, 1, 1,
-1.605174, -0.1302107, -3.007562, 1, 1, 1, 1, 1,
-1.598986, 1.136824, -0.5520648, 1, 1, 1, 1, 1,
-1.598205, -0.4799803, -1.37601, 0, 0, 1, 1, 1,
-1.597218, 1.035071, -1.206908, 1, 0, 0, 1, 1,
-1.596701, -1.268897, -2.873951, 1, 0, 0, 1, 1,
-1.59092, -0.6964633, -1.844517, 1, 0, 0, 1, 1,
-1.587494, -1.71525, -0.4374696, 1, 0, 0, 1, 1,
-1.582992, 0.3289035, -0.03208058, 1, 0, 0, 1, 1,
-1.580941, 0.5516448, -0.98265, 0, 0, 0, 1, 1,
-1.556752, 0.4637129, 0.0980818, 0, 0, 0, 1, 1,
-1.556608, -0.3826682, -3.477157, 0, 0, 0, 1, 1,
-1.546056, 0.684883, -1.619012, 0, 0, 0, 1, 1,
-1.54474, 0.06863981, -1.908507, 0, 0, 0, 1, 1,
-1.529277, 0.5999002, -2.530364, 0, 0, 0, 1, 1,
-1.52161, -1.057307, -1.033083, 0, 0, 0, 1, 1,
-1.51651, 0.4477292, -0.7107933, 1, 1, 1, 1, 1,
-1.516326, 0.3633579, -1.07968, 1, 1, 1, 1, 1,
-1.506533, 0.2104162, -0.7959659, 1, 1, 1, 1, 1,
-1.491082, -0.4665462, -1.35709, 1, 1, 1, 1, 1,
-1.481502, -1.846658, -2.031728, 1, 1, 1, 1, 1,
-1.481358, 1.043916, -1.303943, 1, 1, 1, 1, 1,
-1.465304, -0.6340285, -2.045448, 1, 1, 1, 1, 1,
-1.464323, -0.0639047, -1.563804, 1, 1, 1, 1, 1,
-1.462736, 0.1280761, 0.3985617, 1, 1, 1, 1, 1,
-1.450875, 0.6510537, -0.8427095, 1, 1, 1, 1, 1,
-1.448539, 0.5209562, -2.063528, 1, 1, 1, 1, 1,
-1.441645, -0.8710063, -0.6542876, 1, 1, 1, 1, 1,
-1.438891, -0.6750427, -2.059292, 1, 1, 1, 1, 1,
-1.427565, 0.6634519, -2.454373, 1, 1, 1, 1, 1,
-1.425193, -0.4047538, -2.590405, 1, 1, 1, 1, 1,
-1.422513, -0.06703032, -3.11162, 0, 0, 1, 1, 1,
-1.411313, 0.1739928, -1.975173, 1, 0, 0, 1, 1,
-1.401813, -0.623246, -2.078124, 1, 0, 0, 1, 1,
-1.393768, -0.4970502, -1.136649, 1, 0, 0, 1, 1,
-1.393598, 1.799222, 1.492421, 1, 0, 0, 1, 1,
-1.38074, 1.15385, -0.9408222, 1, 0, 0, 1, 1,
-1.380316, 0.1927486, -1.28252, 0, 0, 0, 1, 1,
-1.376789, 1.165103, -1.526544, 0, 0, 0, 1, 1,
-1.374478, 1.196299, -0.2523022, 0, 0, 0, 1, 1,
-1.373108, 1.657411, -1.30102, 0, 0, 0, 1, 1,
-1.364679, -0.1006489, -1.741905, 0, 0, 0, 1, 1,
-1.362858, -0.4027133, -0.4710072, 0, 0, 0, 1, 1,
-1.355544, -1.359832, -2.500638, 0, 0, 0, 1, 1,
-1.351849, 0.5941474, -1.491863, 1, 1, 1, 1, 1,
-1.351209, 0.5811936, -0.4596676, 1, 1, 1, 1, 1,
-1.350345, 0.3838159, -0.2787116, 1, 1, 1, 1, 1,
-1.340074, -0.02326565, -1.877751, 1, 1, 1, 1, 1,
-1.339905, -0.4605954, -2.338843, 1, 1, 1, 1, 1,
-1.337511, -0.7164029, -3.560432, 1, 1, 1, 1, 1,
-1.335956, 0.2429575, -0.4889323, 1, 1, 1, 1, 1,
-1.333051, 1.317488, -1.537838, 1, 1, 1, 1, 1,
-1.331354, -0.9910201, -4.268444, 1, 1, 1, 1, 1,
-1.330229, -1.04351, -2.617114, 1, 1, 1, 1, 1,
-1.3132, -0.7024103, -0.520505, 1, 1, 1, 1, 1,
-1.308031, -1.379608, -4.111085, 1, 1, 1, 1, 1,
-1.304803, -0.6856539, -2.039077, 1, 1, 1, 1, 1,
-1.300495, 0.4145218, -0.8619527, 1, 1, 1, 1, 1,
-1.287252, 0.2722889, 0.4658968, 1, 1, 1, 1, 1,
-1.285126, 0.5291435, -0.1106481, 0, 0, 1, 1, 1,
-1.276677, 0.2287138, -2.328895, 1, 0, 0, 1, 1,
-1.274402, 0.5108632, -0.6549488, 1, 0, 0, 1, 1,
-1.273498, 0.3801653, 0.0008377612, 1, 0, 0, 1, 1,
-1.273457, 0.3949671, -1.164731, 1, 0, 0, 1, 1,
-1.262865, -0.52772, -4.612727, 1, 0, 0, 1, 1,
-1.249019, -2.052386, -2.793975, 0, 0, 0, 1, 1,
-1.241127, -0.5386285, -0.5629974, 0, 0, 0, 1, 1,
-1.239928, 0.3192704, -1.395535, 0, 0, 0, 1, 1,
-1.239761, -0.2743475, -0.56441, 0, 0, 0, 1, 1,
-1.233173, 1.226089, -0.9365586, 0, 0, 0, 1, 1,
-1.231225, 1.867732, -1.439972, 0, 0, 0, 1, 1,
-1.221237, 0.1557807, -0.5032783, 0, 0, 0, 1, 1,
-1.214898, -0.9701938, -2.947564, 1, 1, 1, 1, 1,
-1.207635, 0.6851293, -2.630024, 1, 1, 1, 1, 1,
-1.202439, 0.8727633, -1.05239, 1, 1, 1, 1, 1,
-1.200933, -0.8373588, -3.956592, 1, 1, 1, 1, 1,
-1.192108, -0.3368703, -3.17637, 1, 1, 1, 1, 1,
-1.191932, -0.7480239, -2.434451, 1, 1, 1, 1, 1,
-1.190385, 0.2908593, -0.5592585, 1, 1, 1, 1, 1,
-1.189249, 0.0951447, -1.517495, 1, 1, 1, 1, 1,
-1.187531, 0.3477911, -2.474037, 1, 1, 1, 1, 1,
-1.18727, 0.4760718, -0.7821979, 1, 1, 1, 1, 1,
-1.182049, -0.985689, -2.119057, 1, 1, 1, 1, 1,
-1.181463, -0.6069695, -2.007226, 1, 1, 1, 1, 1,
-1.17983, -1.817531, -4.098433, 1, 1, 1, 1, 1,
-1.173713, 1.469759, -0.2552517, 1, 1, 1, 1, 1,
-1.172784, -1.440609, -1.250401, 1, 1, 1, 1, 1,
-1.172055, -0.8049942, -2.475697, 0, 0, 1, 1, 1,
-1.171057, 0.1378394, -1.44155, 1, 0, 0, 1, 1,
-1.157907, 1.457182, -0.6752577, 1, 0, 0, 1, 1,
-1.150591, -0.7384609, -2.33117, 1, 0, 0, 1, 1,
-1.149569, 0.6834047, -1.525386, 1, 0, 0, 1, 1,
-1.145472, 0.06646221, -1.82559, 1, 0, 0, 1, 1,
-1.128255, 0.01014122, -0.6443579, 0, 0, 0, 1, 1,
-1.124796, -1.377671, -3.388091, 0, 0, 0, 1, 1,
-1.121973, 0.4993467, -2.774065, 0, 0, 0, 1, 1,
-1.121004, 0.2988245, -2.330824, 0, 0, 0, 1, 1,
-1.118874, -0.1564462, -2.10189, 0, 0, 0, 1, 1,
-1.116233, 0.05622663, -0.2957281, 0, 0, 0, 1, 1,
-1.110749, 0.8864645, -1.053209, 0, 0, 0, 1, 1,
-1.110305, -0.1293176, -1.677176, 1, 1, 1, 1, 1,
-1.109279, -1.261455, -1.632959, 1, 1, 1, 1, 1,
-1.108494, -0.1501714, -2.317105, 1, 1, 1, 1, 1,
-1.090917, -0.01155493, -2.485967, 1, 1, 1, 1, 1,
-1.08361, -0.08960881, -0.7019363, 1, 1, 1, 1, 1,
-1.080792, 0.2960132, -0.5325931, 1, 1, 1, 1, 1,
-1.078449, 0.3549265, -1.462373, 1, 1, 1, 1, 1,
-1.074168, 0.3846262, 0.1555503, 1, 1, 1, 1, 1,
-1.071248, -0.6459646, -2.556922, 1, 1, 1, 1, 1,
-1.06698, 0.04846595, 0.3429974, 1, 1, 1, 1, 1,
-1.056224, -0.5179454, -3.102449, 1, 1, 1, 1, 1,
-1.054756, 0.2319856, 0.1514579, 1, 1, 1, 1, 1,
-1.053908, 0.4632618, 0.2814232, 1, 1, 1, 1, 1,
-1.052522, 0.2609459, -3.291529, 1, 1, 1, 1, 1,
-1.051122, 0.3419285, -1.314878, 1, 1, 1, 1, 1,
-1.042594, 1.370073, 0.1758744, 0, 0, 1, 1, 1,
-1.03673, 1.934037, -1.583276, 1, 0, 0, 1, 1,
-1.036663, 0.6954727, -0.5769297, 1, 0, 0, 1, 1,
-1.036568, -0.948285, -3.530101, 1, 0, 0, 1, 1,
-1.033764, 0.09001517, -0.9457946, 1, 0, 0, 1, 1,
-1.031822, 0.1973586, -0.8135586, 1, 0, 0, 1, 1,
-1.029801, 0.4921378, -0.3236977, 0, 0, 0, 1, 1,
-1.027969, 1.027454, 0.2484894, 0, 0, 0, 1, 1,
-1.027078, -1.319725, -3.187964, 0, 0, 0, 1, 1,
-1.024372, -0.175717, -0.6375101, 0, 0, 0, 1, 1,
-1.021166, 0.6033587, -0.7527951, 0, 0, 0, 1, 1,
-1.017461, -0.2605558, -0.7032962, 0, 0, 0, 1, 1,
-1.017158, 1.149929, 1.238021, 0, 0, 0, 1, 1,
-1.01402, -1.533291, -2.454351, 1, 1, 1, 1, 1,
-0.995187, 0.3677991, -2.463873, 1, 1, 1, 1, 1,
-0.994603, 0.6258358, -0.9389811, 1, 1, 1, 1, 1,
-0.9793394, -0.2069673, -2.488822, 1, 1, 1, 1, 1,
-0.9679548, -1.646618, -4.070491, 1, 1, 1, 1, 1,
-0.9627498, -0.5362867, -2.518434, 1, 1, 1, 1, 1,
-0.9597275, -0.9747443, -1.500743, 1, 1, 1, 1, 1,
-0.9550586, 1.432786, -0.3551919, 1, 1, 1, 1, 1,
-0.9523483, 0.1627977, -1.796278, 1, 1, 1, 1, 1,
-0.9483069, 0.9747616, -0.6769524, 1, 1, 1, 1, 1,
-0.9448364, 0.05026764, -0.5859087, 1, 1, 1, 1, 1,
-0.937511, 0.418902, -1.552926, 1, 1, 1, 1, 1,
-0.9254053, -2.134012, -3.68834, 1, 1, 1, 1, 1,
-0.9228674, 0.1767879, -1.453043, 1, 1, 1, 1, 1,
-0.9142722, -0.2972014, -2.835714, 1, 1, 1, 1, 1,
-0.9107908, -0.882283, -1.14589, 0, 0, 1, 1, 1,
-0.9001867, -1.085341, -1.610253, 1, 0, 0, 1, 1,
-0.8864529, 0.6358347, -1.802638, 1, 0, 0, 1, 1,
-0.8814567, -0.168355, -0.6915436, 1, 0, 0, 1, 1,
-0.8804777, -0.2131423, -1.865733, 1, 0, 0, 1, 1,
-0.8710841, 1.395203, 1.135848, 1, 0, 0, 1, 1,
-0.8694238, -0.3130914, -0.4695632, 0, 0, 0, 1, 1,
-0.8659658, 1.183834, -1.009117, 0, 0, 0, 1, 1,
-0.8564404, 0.2110552, 0.2365057, 0, 0, 0, 1, 1,
-0.8542215, -0.1336922, 0.2946844, 0, 0, 0, 1, 1,
-0.8413271, 0.1751477, -0.09759533, 0, 0, 0, 1, 1,
-0.8379933, -0.3986715, -1.56548, 0, 0, 0, 1, 1,
-0.8310021, 0.08836444, -1.933821, 0, 0, 0, 1, 1,
-0.8287113, -0.2418889, -1.200216, 1, 1, 1, 1, 1,
-0.8286313, -1.501493, -3.612367, 1, 1, 1, 1, 1,
-0.8238567, 0.4933011, -0.097899, 1, 1, 1, 1, 1,
-0.8224632, -1.068832, -0.2766677, 1, 1, 1, 1, 1,
-0.8207902, 0.2191192, 0.3102451, 1, 1, 1, 1, 1,
-0.8045192, -0.3880951, -2.149197, 1, 1, 1, 1, 1,
-0.8010159, -0.9100394, -3.486367, 1, 1, 1, 1, 1,
-0.7987456, -1.097019, -4.769025, 1, 1, 1, 1, 1,
-0.7935939, -0.6089836, -2.925747, 1, 1, 1, 1, 1,
-0.7934322, -0.2574974, -1.609859, 1, 1, 1, 1, 1,
-0.7915498, 0.390203, 0.08050937, 1, 1, 1, 1, 1,
-0.7870443, 0.643782, -2.216272, 1, 1, 1, 1, 1,
-0.7848191, 1.83181, -1.885951, 1, 1, 1, 1, 1,
-0.7848135, 0.2086261, -0.6835261, 1, 1, 1, 1, 1,
-0.7844538, -0.1765907, -3.237219, 1, 1, 1, 1, 1,
-0.7752872, -0.2501311, -2.545525, 0, 0, 1, 1, 1,
-0.7690747, -2.187149, -5.001738, 1, 0, 0, 1, 1,
-0.7646238, -1.655952, -2.69122, 1, 0, 0, 1, 1,
-0.7624077, -1.45725, -1.509825, 1, 0, 0, 1, 1,
-0.7617912, -1.562955, -0.7864203, 1, 0, 0, 1, 1,
-0.7599382, -0.7179959, -3.749635, 1, 0, 0, 1, 1,
-0.755524, -1.35451, -1.578604, 0, 0, 0, 1, 1,
-0.7543275, 1.053097, -0.9797085, 0, 0, 0, 1, 1,
-0.7529733, 0.2713455, -1.835981, 0, 0, 0, 1, 1,
-0.752898, 0.7342256, -1.719033, 0, 0, 0, 1, 1,
-0.7505771, 0.6732295, 0.5013173, 0, 0, 0, 1, 1,
-0.7467974, -0.7751003, -3.008222, 0, 0, 0, 1, 1,
-0.7455227, -0.2089829, -0.7048108, 0, 0, 0, 1, 1,
-0.7444156, 1.083884, -1.016303, 1, 1, 1, 1, 1,
-0.7435512, -0.737542, -4.808862, 1, 1, 1, 1, 1,
-0.7414659, 1.091655, -1.11624, 1, 1, 1, 1, 1,
-0.7414588, 0.3005194, -0.7926254, 1, 1, 1, 1, 1,
-0.7410703, 0.5957283, 0.356565, 1, 1, 1, 1, 1,
-0.7407696, 0.6923686, -1.083837, 1, 1, 1, 1, 1,
-0.7384658, 1.505619, 1.404771, 1, 1, 1, 1, 1,
-0.7355974, -0.3364891, -3.059722, 1, 1, 1, 1, 1,
-0.7299231, -1.135531, -0.337621, 1, 1, 1, 1, 1,
-0.7225342, 0.6688423, -0.7151343, 1, 1, 1, 1, 1,
-0.7205365, -0.3360855, -3.07008, 1, 1, 1, 1, 1,
-0.7153731, 0.3583027, -3.522257, 1, 1, 1, 1, 1,
-0.7088546, 1.413772, -1.51574, 1, 1, 1, 1, 1,
-0.7032268, -0.9721873, -1.459903, 1, 1, 1, 1, 1,
-0.7013466, 1.075624, 0.5216367, 1, 1, 1, 1, 1,
-0.7010913, 1.007898, -1.251466, 0, 0, 1, 1, 1,
-0.695828, 1.483739, -0.45575, 1, 0, 0, 1, 1,
-0.6952383, 0.3231491, -2.161436, 1, 0, 0, 1, 1,
-0.6712996, -0.5970867, -3.291448, 1, 0, 0, 1, 1,
-0.670555, 0.1740501, -1.755794, 1, 0, 0, 1, 1,
-0.6677065, -1.34783, -3.433321, 1, 0, 0, 1, 1,
-0.6643782, -1.044098, 0.01543249, 0, 0, 0, 1, 1,
-0.6639639, 0.4372777, 0.6739846, 0, 0, 0, 1, 1,
-0.6617327, 0.6513918, -2.12543, 0, 0, 0, 1, 1,
-0.6608616, 0.9400288, -1.176347, 0, 0, 0, 1, 1,
-0.6599695, 0.1377898, -0.3432436, 0, 0, 0, 1, 1,
-0.6553563, 0.1770873, -0.7099227, 0, 0, 0, 1, 1,
-0.6552395, -0.8498271, -2.268919, 0, 0, 0, 1, 1,
-0.6534897, -0.8926131, -2.277573, 1, 1, 1, 1, 1,
-0.6497859, -0.1591723, 0.2853557, 1, 1, 1, 1, 1,
-0.6458359, 1.430991, -0.4948676, 1, 1, 1, 1, 1,
-0.645262, 1.471772, -0.9396878, 1, 1, 1, 1, 1,
-0.6437318, -1.049873, -2.55562, 1, 1, 1, 1, 1,
-0.6423768, -1.919075, -3.081701, 1, 1, 1, 1, 1,
-0.6417483, 1.387375, 0.7738302, 1, 1, 1, 1, 1,
-0.641218, 1.154477, -0.1000838, 1, 1, 1, 1, 1,
-0.6317635, -0.6809189, -2.491022, 1, 1, 1, 1, 1,
-0.6290666, -0.393469, -0.7320812, 1, 1, 1, 1, 1,
-0.6202145, -0.8437689, -2.172674, 1, 1, 1, 1, 1,
-0.6175196, -1.148145, -2.537245, 1, 1, 1, 1, 1,
-0.6097903, 0.3545705, -1.171683, 1, 1, 1, 1, 1,
-0.6092513, -0.5800032, -3.956727, 1, 1, 1, 1, 1,
-0.6088175, -1.363586, -2.762325, 1, 1, 1, 1, 1,
-0.6081118, -1.632943, -3.41709, 0, 0, 1, 1, 1,
-0.6035254, 0.1240718, -2.096749, 1, 0, 0, 1, 1,
-0.6018277, 1.749527, 0.09815663, 1, 0, 0, 1, 1,
-0.5978333, -0.2069167, -1.271411, 1, 0, 0, 1, 1,
-0.5958338, -0.4176889, -3.363343, 1, 0, 0, 1, 1,
-0.5957862, -1.031522, -3.973697, 1, 0, 0, 1, 1,
-0.5908117, -1.477041, -1.38608, 0, 0, 0, 1, 1,
-0.5901386, 0.3747465, 1.179107, 0, 0, 0, 1, 1,
-0.5823633, 1.132127, -1.577133, 0, 0, 0, 1, 1,
-0.5740448, 0.5437367, 0.7959545, 0, 0, 0, 1, 1,
-0.5722475, 1.071774, -0.7758583, 0, 0, 0, 1, 1,
-0.5603626, -0.9440134, -1.791409, 0, 0, 0, 1, 1,
-0.5543231, 1.265758, -2.768567, 0, 0, 0, 1, 1,
-0.5537254, 1.36298, 0.02706886, 1, 1, 1, 1, 1,
-0.551271, 1.007789, -1.63284, 1, 1, 1, 1, 1,
-0.5507238, 0.7679502, -1.147964, 1, 1, 1, 1, 1,
-0.5444016, 0.6936541, -0.5641351, 1, 1, 1, 1, 1,
-0.5402644, 2.13046, -0.4142572, 1, 1, 1, 1, 1,
-0.5375392, 0.4876388, -0.4585888, 1, 1, 1, 1, 1,
-0.5325527, 0.3272009, -0.9744222, 1, 1, 1, 1, 1,
-0.5314265, 0.3830345, 1.482739, 1, 1, 1, 1, 1,
-0.5285239, 0.1495814, -1.562135, 1, 1, 1, 1, 1,
-0.5280134, -1.545673, -4.451343, 1, 1, 1, 1, 1,
-0.5241493, 1.180408, -1.921811, 1, 1, 1, 1, 1,
-0.5222177, 0.4259123, -1.350579, 1, 1, 1, 1, 1,
-0.5220581, 1.046839, 0.3994249, 1, 1, 1, 1, 1,
-0.5139275, 0.215382, 0.0843511, 1, 1, 1, 1, 1,
-0.5135279, -0.1546038, -1.562732, 1, 1, 1, 1, 1,
-0.5063746, 0.59383, -0.4042458, 0, 0, 1, 1, 1,
-0.5039057, -0.1010681, -1.056117, 1, 0, 0, 1, 1,
-0.4974191, 0.2653124, -1.105108, 1, 0, 0, 1, 1,
-0.4964733, -1.076933, -3.956405, 1, 0, 0, 1, 1,
-0.4944754, -1.328757, -4.814245, 1, 0, 0, 1, 1,
-0.4922134, 2.092087, -0.2190428, 1, 0, 0, 1, 1,
-0.4913486, -0.3663926, -1.917863, 0, 0, 0, 1, 1,
-0.4909398, -0.3105479, -3.079689, 0, 0, 0, 1, 1,
-0.4894544, -2.137855, -3.549443, 0, 0, 0, 1, 1,
-0.4894132, -0.2220296, 1.279631, 0, 0, 0, 1, 1,
-0.4845513, -0.2067357, -4.096968, 0, 0, 0, 1, 1,
-0.4845241, -0.0528014, -1.170123, 0, 0, 0, 1, 1,
-0.48307, -1.035362, -3.204697, 0, 0, 0, 1, 1,
-0.4822518, 1.148483, -1.366562, 1, 1, 1, 1, 1,
-0.4818894, 1.075522, -2.518587, 1, 1, 1, 1, 1,
-0.4808888, 1.241228, 1.965943, 1, 1, 1, 1, 1,
-0.4793547, 0.4990626, -0.8301936, 1, 1, 1, 1, 1,
-0.4741092, -0.02827637, -0.5905118, 1, 1, 1, 1, 1,
-0.4733406, 1.098718, -1.523464, 1, 1, 1, 1, 1,
-0.470581, -0.5107716, -3.336443, 1, 1, 1, 1, 1,
-0.4644262, 0.944768, -2.837527, 1, 1, 1, 1, 1,
-0.4572674, -1.858726, -4.275986, 1, 1, 1, 1, 1,
-0.4523278, 1.676235, -0.02927164, 1, 1, 1, 1, 1,
-0.4506401, -0.8730145, -1.462699, 1, 1, 1, 1, 1,
-0.4452311, 0.4988787, -1.966288, 1, 1, 1, 1, 1,
-0.4368896, 0.9211872, -1.547602, 1, 1, 1, 1, 1,
-0.4367712, 1.780939, -0.9025975, 1, 1, 1, 1, 1,
-0.435597, 0.8640024, -0.7197123, 1, 1, 1, 1, 1,
-0.4325969, -2.336617, -4.131268, 0, 0, 1, 1, 1,
-0.4308147, -0.4920302, -3.255123, 1, 0, 0, 1, 1,
-0.4248397, 1.58024, -1.755373, 1, 0, 0, 1, 1,
-0.4203079, 0.9310222, -0.8017889, 1, 0, 0, 1, 1,
-0.4202705, 2.206919, -0.1624857, 1, 0, 0, 1, 1,
-0.4071435, 0.2525786, -1.641603, 1, 0, 0, 1, 1,
-0.4037065, 0.5330218, 0.7460322, 0, 0, 0, 1, 1,
-0.4009779, 0.3149597, -1.012421, 0, 0, 0, 1, 1,
-0.3964319, 1.728709, -1.12805, 0, 0, 0, 1, 1,
-0.3937509, 0.9765043, -2.237259, 0, 0, 0, 1, 1,
-0.3912375, 0.3502021, -0.8011542, 0, 0, 0, 1, 1,
-0.390473, 0.004580871, -3.12136, 0, 0, 0, 1, 1,
-0.3865372, 0.02640419, -2.12772, 0, 0, 0, 1, 1,
-0.3831684, 0.05587985, -1.708155, 1, 1, 1, 1, 1,
-0.381757, 0.9713003, 0.04975287, 1, 1, 1, 1, 1,
-0.3817552, -1.059752, -2.929435, 1, 1, 1, 1, 1,
-0.3811236, -1.519354, -3.093906, 1, 1, 1, 1, 1,
-0.3776767, -1.126283, -3.117817, 1, 1, 1, 1, 1,
-0.3767883, -0.8279652, -0.8919883, 1, 1, 1, 1, 1,
-0.3723271, 1.631177, -0.08495169, 1, 1, 1, 1, 1,
-0.3665184, -0.8978469, -0.816716, 1, 1, 1, 1, 1,
-0.3650244, 0.762402, -2.314423, 1, 1, 1, 1, 1,
-0.3599676, 1.240683, 1.725848, 1, 1, 1, 1, 1,
-0.3592794, 0.1033021, 0.2546797, 1, 1, 1, 1, 1,
-0.3579219, 2.397796, 1.083225, 1, 1, 1, 1, 1,
-0.3571553, 0.02337317, -2.668223, 1, 1, 1, 1, 1,
-0.3567912, 0.04909669, -1.537506, 1, 1, 1, 1, 1,
-0.3551523, -0.4909595, -3.350363, 1, 1, 1, 1, 1,
-0.3500153, -0.1325081, -2.177151, 0, 0, 1, 1, 1,
-0.3447964, 1.071614, -1.281574, 1, 0, 0, 1, 1,
-0.3436402, -0.9688132, -3.477645, 1, 0, 0, 1, 1,
-0.3432896, 0.9292121, -0.2033404, 1, 0, 0, 1, 1,
-0.3429235, -0.5581456, -2.50546, 1, 0, 0, 1, 1,
-0.3407103, -0.4973347, -3.744395, 1, 0, 0, 1, 1,
-0.3402062, 0.2652496, -1.329805, 0, 0, 0, 1, 1,
-0.3377176, 0.4103873, -0.6195482, 0, 0, 0, 1, 1,
-0.3330466, 0.5648963, -0.323134, 0, 0, 0, 1, 1,
-0.3320094, 0.122365, -0.4269018, 0, 0, 0, 1, 1,
-0.3290237, -1.636642, -2.867306, 0, 0, 0, 1, 1,
-0.3279551, -1.178633, -3.158479, 0, 0, 0, 1, 1,
-0.3257249, 0.06631885, -1.023138, 0, 0, 0, 1, 1,
-0.3227867, 0.5041225, -0.3992788, 1, 1, 1, 1, 1,
-0.3194846, -0.328334, -3.533628, 1, 1, 1, 1, 1,
-0.3191151, 0.844157, -0.2873416, 1, 1, 1, 1, 1,
-0.3189338, -0.1037521, -0.7429918, 1, 1, 1, 1, 1,
-0.3183734, -0.4406813, -1.706702, 1, 1, 1, 1, 1,
-0.3050686, -1.348319, -1.61198, 1, 1, 1, 1, 1,
-0.3019237, 0.2491518, -1.484611, 1, 1, 1, 1, 1,
-0.2889715, 0.2756335, 0.402494, 1, 1, 1, 1, 1,
-0.2879823, 0.6047791, 0.150717, 1, 1, 1, 1, 1,
-0.2869013, -1.716117, -0.7323402, 1, 1, 1, 1, 1,
-0.2855203, -0.50625, -1.886367, 1, 1, 1, 1, 1,
-0.2851374, -0.4871453, -2.071794, 1, 1, 1, 1, 1,
-0.2836131, 0.8232701, -0.5018228, 1, 1, 1, 1, 1,
-0.2810257, 0.5164706, -0.06344622, 1, 1, 1, 1, 1,
-0.2803181, -0.3214935, -0.7458261, 1, 1, 1, 1, 1,
-0.2764545, -0.2818404, -1.412828, 0, 0, 1, 1, 1,
-0.2702385, -1.234618, -3.586319, 1, 0, 0, 1, 1,
-0.266418, 0.2055983, -0.2244621, 1, 0, 0, 1, 1,
-0.266213, 0.3027965, -1.9476, 1, 0, 0, 1, 1,
-0.2652567, -0.9734, -3.854554, 1, 0, 0, 1, 1,
-0.2628887, -2.049463, -2.140278, 1, 0, 0, 1, 1,
-0.2575159, -1.310045, -1.871935, 0, 0, 0, 1, 1,
-0.2573927, 2.434694, 0.2174084, 0, 0, 0, 1, 1,
-0.2569411, 0.2262582, -0.4444755, 0, 0, 0, 1, 1,
-0.2565701, 0.07353064, -2.149378, 0, 0, 0, 1, 1,
-0.2502849, -2.267549, -4.361918, 0, 0, 0, 1, 1,
-0.2491411, 0.5723721, -1.787438, 0, 0, 0, 1, 1,
-0.2459121, 1.052325, -0.4002956, 0, 0, 0, 1, 1,
-0.2438407, -0.3119816, -3.015051, 1, 1, 1, 1, 1,
-0.2406555, 1.595573, -0.3282362, 1, 1, 1, 1, 1,
-0.2388174, 0.3826313, -0.2394071, 1, 1, 1, 1, 1,
-0.2356506, -1.01237, -2.592695, 1, 1, 1, 1, 1,
-0.2295156, 0.4252796, -1.62965, 1, 1, 1, 1, 1,
-0.228726, -1.357706, -1.915197, 1, 1, 1, 1, 1,
-0.2275618, -0.3447004, -0.2345367, 1, 1, 1, 1, 1,
-0.2259577, 0.1627402, -2.675819, 1, 1, 1, 1, 1,
-0.2222897, -1.637869, -1.935488, 1, 1, 1, 1, 1,
-0.2199145, 0.1955511, -1.804567, 1, 1, 1, 1, 1,
-0.2171649, 0.477714, -1.581214, 1, 1, 1, 1, 1,
-0.2137297, -0.7672848, -2.359946, 1, 1, 1, 1, 1,
-0.2132853, 0.8409231, 0.9300936, 1, 1, 1, 1, 1,
-0.2109787, 0.4519705, 0.3108631, 1, 1, 1, 1, 1,
-0.2084493, 1.574262, -0.7919629, 1, 1, 1, 1, 1,
-0.1988102, -0.2291659, -2.297768, 0, 0, 1, 1, 1,
-0.1985869, 0.538292, -1.505541, 1, 0, 0, 1, 1,
-0.1985653, -2.15181, -1.447013, 1, 0, 0, 1, 1,
-0.1957767, -0.08118179, -2.340028, 1, 0, 0, 1, 1,
-0.1944812, -1.491741, -2.35487, 1, 0, 0, 1, 1,
-0.1938347, 0.6095325, 0.9631215, 1, 0, 0, 1, 1,
-0.1909, 0.5099648, 1.440105, 0, 0, 0, 1, 1,
-0.1888204, 1.032695, 0.4439806, 0, 0, 0, 1, 1,
-0.1883137, 2.177067, -0.01732247, 0, 0, 0, 1, 1,
-0.1791456, -0.2930659, -1.829843, 0, 0, 0, 1, 1,
-0.1786941, 0.1457742, -1.906821, 0, 0, 0, 1, 1,
-0.1782945, 0.6473364, 0.1665314, 0, 0, 0, 1, 1,
-0.1770351, -1.670107, -3.458403, 0, 0, 0, 1, 1,
-0.1753179, -0.005833261, 0.5790135, 1, 1, 1, 1, 1,
-0.1744909, 0.7069516, -0.2831517, 1, 1, 1, 1, 1,
-0.1715151, -0.2388549, -1.682252, 1, 1, 1, 1, 1,
-0.1714218, -1.928051, -1.764341, 1, 1, 1, 1, 1,
-0.170292, -1.138144, -3.024864, 1, 1, 1, 1, 1,
-0.1686664, -0.1153702, -3.214196, 1, 1, 1, 1, 1,
-0.1606217, 1.066239, -0.798227, 1, 1, 1, 1, 1,
-0.1485923, 0.9867525, -1.345997, 1, 1, 1, 1, 1,
-0.145037, -0.9050316, -3.727215, 1, 1, 1, 1, 1,
-0.1333068, -0.7722312, -1.768381, 1, 1, 1, 1, 1,
-0.1326752, -0.1815323, -3.494898, 1, 1, 1, 1, 1,
-0.1321741, 0.9481115, 1.334284, 1, 1, 1, 1, 1,
-0.1276802, -0.8814051, -4.328979, 1, 1, 1, 1, 1,
-0.125848, 0.764393, 0.3086529, 1, 1, 1, 1, 1,
-0.1219902, 0.4505874, -1.507497, 1, 1, 1, 1, 1,
-0.1210386, 0.1883894, -0.6492497, 0, 0, 1, 1, 1,
-0.1200509, 0.4945871, -0.8856845, 1, 0, 0, 1, 1,
-0.1196795, -0.7461906, -4.077715, 1, 0, 0, 1, 1,
-0.1181341, -0.2234259, -4.345211, 1, 0, 0, 1, 1,
-0.117369, 0.5619901, -1.295721, 1, 0, 0, 1, 1,
-0.1155472, 1.157562, 0.3113473, 1, 0, 0, 1, 1,
-0.1132093, -0.1219893, -1.965278, 0, 0, 0, 1, 1,
-0.1126565, -1.011638, -3.664209, 0, 0, 0, 1, 1,
-0.1122492, 0.3475703, -1.533868, 0, 0, 0, 1, 1,
-0.1103278, -0.3192243, -1.570914, 0, 0, 0, 1, 1,
-0.108969, 0.559826, -0.3383671, 0, 0, 0, 1, 1,
-0.1071078, 0.373847, 2.122285, 0, 0, 0, 1, 1,
-0.1048887, -0.5887825, -3.677743, 0, 0, 0, 1, 1,
-0.1038049, -0.1735566, -0.8133718, 1, 1, 1, 1, 1,
-0.09952312, 1.774329, 0.5162227, 1, 1, 1, 1, 1,
-0.09891263, -0.1100267, -2.586039, 1, 1, 1, 1, 1,
-0.09659799, -0.4456399, -3.628583, 1, 1, 1, 1, 1,
-0.0953682, -0.07213517, -3.052509, 1, 1, 1, 1, 1,
-0.09491919, 1.236323, 0.0841536, 1, 1, 1, 1, 1,
-0.09124314, -0.5682206, -3.9658, 1, 1, 1, 1, 1,
-0.09082767, -0.4897239, -1.954043, 1, 1, 1, 1, 1,
-0.08805004, 0.518234, -0.7219738, 1, 1, 1, 1, 1,
-0.08331314, -0.6357217, -2.181488, 1, 1, 1, 1, 1,
-0.06715089, 1.38192, 0.6225877, 1, 1, 1, 1, 1,
-0.06400903, -1.229601, -3.894037, 1, 1, 1, 1, 1,
-0.06154781, -0.2664029, -2.339595, 1, 1, 1, 1, 1,
-0.06033608, -4.032552, -2.395719, 1, 1, 1, 1, 1,
-0.05870951, 1.256168, -1.24035, 1, 1, 1, 1, 1,
-0.05757451, 0.6410409, 0.1844193, 0, 0, 1, 1, 1,
-0.05277096, 0.3293794, -0.389944, 1, 0, 0, 1, 1,
-0.04985284, -1.58816, -3.444827, 1, 0, 0, 1, 1,
-0.04729274, 0.4369542, 0.2407641, 1, 0, 0, 1, 1,
-0.04567327, 0.8608978, -1.654715, 1, 0, 0, 1, 1,
-0.04442176, -1.555001, -4.463205, 1, 0, 0, 1, 1,
-0.04099327, -0.4543393, -4.292815, 0, 0, 0, 1, 1,
-0.03894018, -0.5566704, -2.582284, 0, 0, 0, 1, 1,
-0.03847384, -2.640953, -3.155632, 0, 0, 0, 1, 1,
-0.03636256, -0.2489281, -4.776218, 0, 0, 0, 1, 1,
-0.03577948, -0.1680931, -3.500656, 0, 0, 0, 1, 1,
-0.0341303, 0.04634691, 0.3123353, 0, 0, 0, 1, 1,
-0.03353054, -1.518973, -3.8863, 0, 0, 0, 1, 1,
-0.0290323, -0.8405812, -3.816807, 1, 1, 1, 1, 1,
-0.02824279, 0.1770275, -0.687221, 1, 1, 1, 1, 1,
-0.02795572, 0.1539727, -0.6200271, 1, 1, 1, 1, 1,
-0.01798686, -0.7971987, -3.485409, 1, 1, 1, 1, 1,
-0.01541156, 0.2586364, -1.145115, 1, 1, 1, 1, 1,
-0.01318949, -0.5690721, -2.880276, 1, 1, 1, 1, 1,
-0.0104744, 0.2258547, -1.079354, 1, 1, 1, 1, 1,
-0.009170329, -1.649718, -2.476055, 1, 1, 1, 1, 1,
-0.007498065, -0.1337482, -3.556262, 1, 1, 1, 1, 1,
-0.006731475, -1.048874, -3.036559, 1, 1, 1, 1, 1,
-0.004169024, 0.544509, -0.5268256, 1, 1, 1, 1, 1,
-0.004117409, 0.8728356, 0.1495265, 1, 1, 1, 1, 1,
-0.003472848, 1.189684, 0.002043229, 1, 1, 1, 1, 1,
-0.003298189, 0.7255015, -1.387501, 1, 1, 1, 1, 1,
-0.0009923776, -0.23154, -2.345806, 1, 1, 1, 1, 1,
0.008349887, -1.784875, 2.22327, 0, 0, 1, 1, 1,
0.0147975, 0.02552453, 0.03185954, 1, 0, 0, 1, 1,
0.01790433, -0.03277495, 2.456111, 1, 0, 0, 1, 1,
0.02000237, -0.6432168, 5.069105, 1, 0, 0, 1, 1,
0.02319602, 0.9953678, 0.7804242, 1, 0, 0, 1, 1,
0.02633548, 0.8214268, 1.283053, 1, 0, 0, 1, 1,
0.02828228, -1.481495, 2.849274, 0, 0, 0, 1, 1,
0.02830692, 0.3133788, 1.100659, 0, 0, 0, 1, 1,
0.02839941, 0.04128369, -0.6034636, 0, 0, 0, 1, 1,
0.02861415, 0.5122761, -0.8445267, 0, 0, 0, 1, 1,
0.02891415, 1.497893, 1.004894, 0, 0, 0, 1, 1,
0.02958195, -0.4005625, 2.166976, 0, 0, 0, 1, 1,
0.03069682, -1.026043, 4.356226, 0, 0, 0, 1, 1,
0.03346132, 1.842446, 0.6532721, 1, 1, 1, 1, 1,
0.03818449, 0.06784621, 0.2344398, 1, 1, 1, 1, 1,
0.03968436, -0.894133, 2.342505, 1, 1, 1, 1, 1,
0.03985564, -0.8366122, 3.332523, 1, 1, 1, 1, 1,
0.04247073, -0.6297185, 1.900903, 1, 1, 1, 1, 1,
0.04952025, 1.288944, -0.2086814, 1, 1, 1, 1, 1,
0.05440537, -1.799657, 3.257459, 1, 1, 1, 1, 1,
0.05644437, 1.810069, 0.05730693, 1, 1, 1, 1, 1,
0.05831988, 0.2624834, 1.154007, 1, 1, 1, 1, 1,
0.06063175, 0.5359934, -1.472073, 1, 1, 1, 1, 1,
0.06085846, -0.8958124, 2.515498, 1, 1, 1, 1, 1,
0.0624343, 0.5188415, -1.533481, 1, 1, 1, 1, 1,
0.06326888, -1.584894, 4.327682, 1, 1, 1, 1, 1,
0.06472268, -1.961802, 4.107852, 1, 1, 1, 1, 1,
0.07402541, -1.377247, 4.366274, 1, 1, 1, 1, 1,
0.07569586, -0.625915, 2.476019, 0, 0, 1, 1, 1,
0.07836463, -1.049531, 2.328052, 1, 0, 0, 1, 1,
0.08252543, 0.05455821, -0.4011548, 1, 0, 0, 1, 1,
0.08736099, 0.5130374, 0.3320108, 1, 0, 0, 1, 1,
0.0894593, 0.4759017, 0.5011428, 1, 0, 0, 1, 1,
0.09165056, 0.4425372, 0.5921364, 1, 0, 0, 1, 1,
0.0924245, 1.892571, 0.5742099, 0, 0, 0, 1, 1,
0.09243957, 0.7775586, -1.074721, 0, 0, 0, 1, 1,
0.09669866, -1.244402, 3.072857, 0, 0, 0, 1, 1,
0.1007369, -0.3882321, 2.961964, 0, 0, 0, 1, 1,
0.1051857, -0.5902035, 2.609689, 0, 0, 0, 1, 1,
0.1109544, -0.9089519, 3.541849, 0, 0, 0, 1, 1,
0.1121544, 2.088126, -0.7821223, 0, 0, 0, 1, 1,
0.1149324, 1.231817, -0.837437, 1, 1, 1, 1, 1,
0.1189648, 0.9260595, 0.242265, 1, 1, 1, 1, 1,
0.1196984, 0.009115805, 1.111139, 1, 1, 1, 1, 1,
0.1230629, 1.251015, -1.288616, 1, 1, 1, 1, 1,
0.1253054, 0.4010518, -1.364228, 1, 1, 1, 1, 1,
0.1278033, -0.3593931, 0.8571224, 1, 1, 1, 1, 1,
0.1301073, 0.887172, 0.3893718, 1, 1, 1, 1, 1,
0.1308714, 0.09369347, 1.290509, 1, 1, 1, 1, 1,
0.1429307, 0.8760874, 0.7347869, 1, 1, 1, 1, 1,
0.1458397, -0.4878068, 0.8238506, 1, 1, 1, 1, 1,
0.1467379, -0.272906, 3.232662, 1, 1, 1, 1, 1,
0.1470101, 0.1184293, 0.4310341, 1, 1, 1, 1, 1,
0.1530685, -0.8658401, 3.643046, 1, 1, 1, 1, 1,
0.1560258, -0.04135503, 1.822185, 1, 1, 1, 1, 1,
0.1565213, 1.404896, -1.635267, 1, 1, 1, 1, 1,
0.158368, -1.671953, 1.994366, 0, 0, 1, 1, 1,
0.1620419, -0.09650253, 2.350943, 1, 0, 0, 1, 1,
0.1635102, 0.2911338, -1.4373, 1, 0, 0, 1, 1,
0.1645619, -1.429182, 3.263891, 1, 0, 0, 1, 1,
0.1657662, 0.2628803, -0.5371866, 1, 0, 0, 1, 1,
0.1710491, -0.4244696, 4.151189, 1, 0, 0, 1, 1,
0.1749326, 1.038442, 0.2103337, 0, 0, 0, 1, 1,
0.1830523, -2.906563, 5.710851, 0, 0, 0, 1, 1,
0.1830872, 0.8122137, -0.7788665, 0, 0, 0, 1, 1,
0.1832807, 1.165188, 0.7033346, 0, 0, 0, 1, 1,
0.1840207, -0.9308876, 1.944467, 0, 0, 0, 1, 1,
0.1843354, 0.02118541, 2.277707, 0, 0, 0, 1, 1,
0.1900664, -1.207353, 4.191967, 0, 0, 0, 1, 1,
0.1905935, -1.417105, 1.046277, 1, 1, 1, 1, 1,
0.1965611, -0.7376584, 2.933572, 1, 1, 1, 1, 1,
0.1986821, 0.6548356, 1.176523, 1, 1, 1, 1, 1,
0.2079503, -0.9222787, 4.199565, 1, 1, 1, 1, 1,
0.2083555, 0.407347, -0.01012117, 1, 1, 1, 1, 1,
0.2171945, 1.011764, -0.1569712, 1, 1, 1, 1, 1,
0.21875, -0.4345013, 3.487456, 1, 1, 1, 1, 1,
0.2266428, -0.6683828, 2.163594, 1, 1, 1, 1, 1,
0.2268184, 0.8981694, -1.717414, 1, 1, 1, 1, 1,
0.2322962, 0.2484704, 2.949548, 1, 1, 1, 1, 1,
0.2335004, -0.3850251, 3.700122, 1, 1, 1, 1, 1,
0.2377912, 1.343975, 0.034282, 1, 1, 1, 1, 1,
0.2416147, -1.599458, 3.60665, 1, 1, 1, 1, 1,
0.242329, 2.286405, 0.5414842, 1, 1, 1, 1, 1,
0.2448739, -1.000519, 3.390932, 1, 1, 1, 1, 1,
0.2452694, 3.411106, 0.5074592, 0, 0, 1, 1, 1,
0.247566, -0.3371135, 1.222078, 1, 0, 0, 1, 1,
0.2490931, 0.7392645, 1.107329, 1, 0, 0, 1, 1,
0.2534912, 1.448129, 1.049442, 1, 0, 0, 1, 1,
0.2543184, 0.1546169, 1.768108, 1, 0, 0, 1, 1,
0.2561959, 0.8128195, -0.3577073, 1, 0, 0, 1, 1,
0.2586519, 0.2858055, 0.7942031, 0, 0, 0, 1, 1,
0.2588886, -0.08311186, 2.117851, 0, 0, 0, 1, 1,
0.2637517, 1.265581, 1.136389, 0, 0, 0, 1, 1,
0.2670667, -1.39687, 2.94004, 0, 0, 0, 1, 1,
0.268675, 1.889076, -0.3449734, 0, 0, 0, 1, 1,
0.2717275, 0.4654934, 2.410716, 0, 0, 0, 1, 1,
0.2740932, -1.808177, 2.91665, 0, 0, 0, 1, 1,
0.2742895, 0.1652248, 0.4199868, 1, 1, 1, 1, 1,
0.2774708, 0.6512102, 1.081777, 1, 1, 1, 1, 1,
0.2788388, -2.568394, 3.314008, 1, 1, 1, 1, 1,
0.2832803, -0.5541303, 3.372927, 1, 1, 1, 1, 1,
0.2839893, -1.081053, 2.706776, 1, 1, 1, 1, 1,
0.2906566, 1.62459, 0.2516031, 1, 1, 1, 1, 1,
0.2919544, 2.007007, -0.06052443, 1, 1, 1, 1, 1,
0.2936831, -0.6065187, 3.185455, 1, 1, 1, 1, 1,
0.2952289, 0.4604178, -0.4498035, 1, 1, 1, 1, 1,
0.3001907, -0.5041525, 2.031439, 1, 1, 1, 1, 1,
0.3003295, 2.64865, 0.3031319, 1, 1, 1, 1, 1,
0.3011166, -0.4724137, 2.062422, 1, 1, 1, 1, 1,
0.3029366, -0.09071024, 1.346189, 1, 1, 1, 1, 1,
0.3040864, -0.5350186, 2.514709, 1, 1, 1, 1, 1,
0.3042862, -0.1772785, 2.140782, 1, 1, 1, 1, 1,
0.3047288, -0.1951005, 0.9839541, 0, 0, 1, 1, 1,
0.3052055, -0.493777, 2.525883, 1, 0, 0, 1, 1,
0.3055008, 2.227291, -2.099637, 1, 0, 0, 1, 1,
0.3115076, -0.3568574, 1.322716, 1, 0, 0, 1, 1,
0.3147427, 0.3833608, 1.156377, 1, 0, 0, 1, 1,
0.3148311, -0.6382177, 3.443354, 1, 0, 0, 1, 1,
0.3169434, -0.6251214, 3.271877, 0, 0, 0, 1, 1,
0.3171498, 0.9428289, -1.142257, 0, 0, 0, 1, 1,
0.319999, 2.233211, 0.01608592, 0, 0, 0, 1, 1,
0.323983, 0.2053468, 1.911365, 0, 0, 0, 1, 1,
0.3263697, -0.3753768, 4.014114, 0, 0, 0, 1, 1,
0.327985, -0.5564774, 4.75429, 0, 0, 0, 1, 1,
0.3319742, 0.6982665, 1.458775, 0, 0, 0, 1, 1,
0.3350561, 0.3104411, 1.690411, 1, 1, 1, 1, 1,
0.3379003, -0.1771845, 0.2068936, 1, 1, 1, 1, 1,
0.3396433, -0.142156, 2.519585, 1, 1, 1, 1, 1,
0.3410263, 1.204195, 0.1816885, 1, 1, 1, 1, 1,
0.343163, 0.08842885, 0.7793624, 1, 1, 1, 1, 1,
0.3447012, 0.9325007, 2.020867, 1, 1, 1, 1, 1,
0.3484107, -1.316625, 2.788353, 1, 1, 1, 1, 1,
0.3500595, -0.6150609, 3.292608, 1, 1, 1, 1, 1,
0.3703243, -1.338406, 2.731887, 1, 1, 1, 1, 1,
0.3758639, -1.466825, 2.6467, 1, 1, 1, 1, 1,
0.3768625, 0.7676619, 0.2281221, 1, 1, 1, 1, 1,
0.3782887, 1.48248, -0.7348784, 1, 1, 1, 1, 1,
0.3787791, 2.057266, 0.2003705, 1, 1, 1, 1, 1,
0.3796274, 0.6206685, 1.535254, 1, 1, 1, 1, 1,
0.380041, -0.1642054, 1.606181, 1, 1, 1, 1, 1,
0.3844411, -0.5761187, 3.40483, 0, 0, 1, 1, 1,
0.3904575, 1.588654, 0.4055589, 1, 0, 0, 1, 1,
0.3938308, -0.8730377, 3.396776, 1, 0, 0, 1, 1,
0.3984756, 1.995529, 0.3886746, 1, 0, 0, 1, 1,
0.3988885, -0.9634017, 3.45362, 1, 0, 0, 1, 1,
0.4012465, -0.2015148, 3.539443, 1, 0, 0, 1, 1,
0.4040741, -0.2695453, 1.643291, 0, 0, 0, 1, 1,
0.4082164, -0.961557, 2.921191, 0, 0, 0, 1, 1,
0.4103702, -1.240577, 0.9925283, 0, 0, 0, 1, 1,
0.4148204, 1.948303, -0.2005768, 0, 0, 0, 1, 1,
0.4171527, -0.1159312, 4.00247, 0, 0, 0, 1, 1,
0.4190421, 0.1367882, 0.03267734, 0, 0, 0, 1, 1,
0.4230309, 1.068759, 0.9803352, 0, 0, 0, 1, 1,
0.4232283, 0.2933857, 2.252732, 1, 1, 1, 1, 1,
0.4278595, -0.7374573, 1.796689, 1, 1, 1, 1, 1,
0.4285322, 0.8691048, 0.3607489, 1, 1, 1, 1, 1,
0.4338717, -1.95263, 3.788466, 1, 1, 1, 1, 1,
0.4344055, 0.3199408, -0.2776265, 1, 1, 1, 1, 1,
0.4350995, 0.7632428, 0.1046494, 1, 1, 1, 1, 1,
0.4351312, -0.2859664, 3.940375, 1, 1, 1, 1, 1,
0.4381189, -1.175166, 3.471161, 1, 1, 1, 1, 1,
0.4425537, 0.1219119, 2.150878, 1, 1, 1, 1, 1,
0.4457959, -0.3719162, 2.917882, 1, 1, 1, 1, 1,
0.4494573, 0.2563729, -0.4420685, 1, 1, 1, 1, 1,
0.4505234, -0.1962994, 1.295697, 1, 1, 1, 1, 1,
0.4506027, 1.836634, -1.447782, 1, 1, 1, 1, 1,
0.458444, -1.51686, 1.750106, 1, 1, 1, 1, 1,
0.45885, 0.9948674, -0.8488528, 1, 1, 1, 1, 1,
0.4617599, -0.1997464, 1.663152, 0, 0, 1, 1, 1,
0.4708758, -0.8666308, 2.264139, 1, 0, 0, 1, 1,
0.4728512, -0.1084423, 1.408556, 1, 0, 0, 1, 1,
0.4821675, -1.063607, 3.146826, 1, 0, 0, 1, 1,
0.4843925, -1.381746, 2.434101, 1, 0, 0, 1, 1,
0.4884816, 1.220351, 0.4610359, 1, 0, 0, 1, 1,
0.4946519, -0.73107, 3.696009, 0, 0, 0, 1, 1,
0.4965765, 0.9133215, 1.616239, 0, 0, 0, 1, 1,
0.4988332, 0.5905164, 1.497339, 0, 0, 0, 1, 1,
0.4992149, 1.056433, -0.1043264, 0, 0, 0, 1, 1,
0.5010054, -0.5132507, 3.697446, 0, 0, 0, 1, 1,
0.5051484, -1.663555, 3.272498, 0, 0, 0, 1, 1,
0.5071957, 0.5627958, 2.132958, 0, 0, 0, 1, 1,
0.5134327, -0.2349378, 1.703753, 1, 1, 1, 1, 1,
0.5242531, 1.221264, -0.3181967, 1, 1, 1, 1, 1,
0.5309616, -0.1602284, 1.378035, 1, 1, 1, 1, 1,
0.5380831, -1.329753, 2.381886, 1, 1, 1, 1, 1,
0.5403953, 0.7443927, -0.3509349, 1, 1, 1, 1, 1,
0.5437305, 1.275132, -0.135403, 1, 1, 1, 1, 1,
0.549613, -0.008670293, 1.290647, 1, 1, 1, 1, 1,
0.5545012, 0.1419776, 1.036095, 1, 1, 1, 1, 1,
0.5582287, 0.3112689, 1.489004, 1, 1, 1, 1, 1,
0.5586914, 0.2796407, -0.08002257, 1, 1, 1, 1, 1,
0.5676808, -0.6277994, 2.146511, 1, 1, 1, 1, 1,
0.5680267, 1.2758, -0.3117355, 1, 1, 1, 1, 1,
0.5687491, -0.6954021, 1.622872, 1, 1, 1, 1, 1,
0.5726652, 0.6981879, 0.3609096, 1, 1, 1, 1, 1,
0.5745679, 1.733882, -1.388108, 1, 1, 1, 1, 1,
0.5746296, -0.579393, 5.280102, 0, 0, 1, 1, 1,
0.5774277, 0.4130946, 1.54047, 1, 0, 0, 1, 1,
0.5785452, -0.4015464, 1.170703, 1, 0, 0, 1, 1,
0.5785741, -0.3533791, 3.123665, 1, 0, 0, 1, 1,
0.5863163, 1.237409, 0.707731, 1, 0, 0, 1, 1,
0.5886768, -0.6845974, -0.5078944, 1, 0, 0, 1, 1,
0.5921361, 1.303987, 1.692992, 0, 0, 0, 1, 1,
0.5927426, 0.3632201, 1.703262, 0, 0, 0, 1, 1,
0.5932737, 0.4153001, 1.559412, 0, 0, 0, 1, 1,
0.6016948, 1.094373, 0.7716271, 0, 0, 0, 1, 1,
0.6045899, -0.04915449, 2.514153, 0, 0, 0, 1, 1,
0.6053372, -0.6992105, 0.9963834, 0, 0, 0, 1, 1,
0.6062999, 1.313329, 0.6358055, 0, 0, 0, 1, 1,
0.6104552, -0.2730376, 2.07985, 1, 1, 1, 1, 1,
0.6114871, -0.5269724, 3.583429, 1, 1, 1, 1, 1,
0.6137509, -0.3931238, 3.667075, 1, 1, 1, 1, 1,
0.6150996, 0.5416735, 0.9348754, 1, 1, 1, 1, 1,
0.6153208, -1.130883, 3.200114, 1, 1, 1, 1, 1,
0.6162175, -1.116075, 2.826414, 1, 1, 1, 1, 1,
0.6177891, -0.3703682, 1.551617, 1, 1, 1, 1, 1,
0.6180591, 0.8979606, 0.9950091, 1, 1, 1, 1, 1,
0.6187831, -1.777016, 1.80578, 1, 1, 1, 1, 1,
0.6201268, -0.5876917, 1.261925, 1, 1, 1, 1, 1,
0.6233571, -0.3412483, 2.352028, 1, 1, 1, 1, 1,
0.6285774, 0.7009935, 0.6802067, 1, 1, 1, 1, 1,
0.6298295, 0.8608566, 0.8647912, 1, 1, 1, 1, 1,
0.6319502, 0.7746716, 0.995702, 1, 1, 1, 1, 1,
0.6343018, -0.3213427, 2.509299, 1, 1, 1, 1, 1,
0.6355917, -1.095293, 4.372461, 0, 0, 1, 1, 1,
0.6372719, 0.3553365, 2.314863, 1, 0, 0, 1, 1,
0.6397305, 0.5162549, 0.2313341, 1, 0, 0, 1, 1,
0.6433471, 1.084769, 0.4550444, 1, 0, 0, 1, 1,
0.6443614, -0.9688848, 1.96757, 1, 0, 0, 1, 1,
0.644424, -0.6615145, 2.183125, 1, 0, 0, 1, 1,
0.6445171, -0.5898138, 1.586412, 0, 0, 0, 1, 1,
0.6525832, 0.3203795, 1.163452, 0, 0, 0, 1, 1,
0.6539125, 0.7684301, -1.852194, 0, 0, 0, 1, 1,
0.6545168, 0.146925, 0.7434158, 0, 0, 0, 1, 1,
0.6553329, -0.5370681, 1.749865, 0, 0, 0, 1, 1,
0.6572867, -0.9335159, 2.021763, 0, 0, 0, 1, 1,
0.6577117, -0.3863655, 2.551908, 0, 0, 0, 1, 1,
0.661537, 0.2362711, 0.475907, 1, 1, 1, 1, 1,
0.6627035, -0.6942852, 3.066959, 1, 1, 1, 1, 1,
0.6674449, 0.656453, 0.2669438, 1, 1, 1, 1, 1,
0.6699935, 0.1983452, 1.119221, 1, 1, 1, 1, 1,
0.6741301, 0.3336261, 1.059403, 1, 1, 1, 1, 1,
0.6745388, 0.3407882, 0.6457846, 1, 1, 1, 1, 1,
0.6795219, -0.9430568, 3.041831, 1, 1, 1, 1, 1,
0.6808435, 0.5268357, 0.3941489, 1, 1, 1, 1, 1,
0.6812643, 0.004728946, 1.372665, 1, 1, 1, 1, 1,
0.6827547, -2.219567, 2.403044, 1, 1, 1, 1, 1,
0.6885615, -0.4835582, 2.456459, 1, 1, 1, 1, 1,
0.6906198, -0.5786665, 3.751959, 1, 1, 1, 1, 1,
0.6916396, -1.210245, 1.552903, 1, 1, 1, 1, 1,
0.6923779, -0.6128113, 0.5334109, 1, 1, 1, 1, 1,
0.6926864, -1.026799, 2.482213, 1, 1, 1, 1, 1,
0.6950074, 0.7319436, 1.800669, 0, 0, 1, 1, 1,
0.6950248, -0.1369816, 2.295981, 1, 0, 0, 1, 1,
0.6961854, 0.1718091, 1.286659, 1, 0, 0, 1, 1,
0.7000788, 0.3877434, 3.504325, 1, 0, 0, 1, 1,
0.7008738, -0.1343922, 0.9390353, 1, 0, 0, 1, 1,
0.7050278, -0.9764267, 3.053685, 1, 0, 0, 1, 1,
0.7077034, 0.5694832, 0.06484491, 0, 0, 0, 1, 1,
0.7083282, 1.178677, 1.133007, 0, 0, 0, 1, 1,
0.7101874, 0.6879874, 0.1289433, 0, 0, 0, 1, 1,
0.7147584, -0.9412001, 3.212847, 0, 0, 0, 1, 1,
0.718292, -0.6411105, 2.245203, 0, 0, 0, 1, 1,
0.7221414, 1.023144, 0.6746706, 0, 0, 0, 1, 1,
0.7238043, -0.01273809, 2.260649, 0, 0, 0, 1, 1,
0.7238762, 0.1847591, 3.582086, 1, 1, 1, 1, 1,
0.7276838, -1.016537, 3.062634, 1, 1, 1, 1, 1,
0.7285338, 0.5722438, 1.638391, 1, 1, 1, 1, 1,
0.7349522, -0.7762069, 4.222707, 1, 1, 1, 1, 1,
0.7364961, 1.031195, 1.811786, 1, 1, 1, 1, 1,
0.7410733, -1.560169, 3.808691, 1, 1, 1, 1, 1,
0.7416075, -0.4208231, 1.461134, 1, 1, 1, 1, 1,
0.7416469, -0.5473652, 2.548935, 1, 1, 1, 1, 1,
0.7422345, 0.6838986, 0.4748794, 1, 1, 1, 1, 1,
0.7426075, -1.417917, 2.746296, 1, 1, 1, 1, 1,
0.7431056, 1.329186, 0.299261, 1, 1, 1, 1, 1,
0.7470376, 0.6508207, 0.9562577, 1, 1, 1, 1, 1,
0.7477563, 1.370597, 1.266986, 1, 1, 1, 1, 1,
0.7519614, -1.119797, 1.280999, 1, 1, 1, 1, 1,
0.7531836, 0.6145725, 1.536126, 1, 1, 1, 1, 1,
0.7565794, -0.2191521, 1.440266, 0, 0, 1, 1, 1,
0.7574245, -0.366393, 1.173133, 1, 0, 0, 1, 1,
0.7592781, -1.449231, 1.886267, 1, 0, 0, 1, 1,
0.7599778, -0.5681673, 1.432306, 1, 0, 0, 1, 1,
0.7625885, 0.2552458, 1.849081, 1, 0, 0, 1, 1,
0.7627552, -1.128309, 3.463088, 1, 0, 0, 1, 1,
0.7643518, 1.607065, 0.1731204, 0, 0, 0, 1, 1,
0.7660689, 0.006371684, 1.836908, 0, 0, 0, 1, 1,
0.7694478, -0.9310013, 3.577246, 0, 0, 0, 1, 1,
0.7699617, 1.105444, -0.02128446, 0, 0, 0, 1, 1,
0.7703968, 0.6810452, 0.371181, 0, 0, 0, 1, 1,
0.7704737, -0.4416822, 0.8668752, 0, 0, 0, 1, 1,
0.7809137, 1.686367, -1.442694, 0, 0, 0, 1, 1,
0.789365, 0.2975396, 0.68809, 1, 1, 1, 1, 1,
0.7904068, 0.4204991, 3.217685, 1, 1, 1, 1, 1,
0.791234, -2.042137, 2.087746, 1, 1, 1, 1, 1,
0.7925798, 0.1582039, 1.17043, 1, 1, 1, 1, 1,
0.7951506, -1.523894, 2.260124, 1, 1, 1, 1, 1,
0.7969086, 0.1189902, 2.570727, 1, 1, 1, 1, 1,
0.7987664, -1.497771, 2.643795, 1, 1, 1, 1, 1,
0.8051715, -1.843248, 3.467156, 1, 1, 1, 1, 1,
0.8099639, -0.2305854, 1.523948, 1, 1, 1, 1, 1,
0.8122948, -0.9748836, 2.363122, 1, 1, 1, 1, 1,
0.8185121, 0.3562964, -0.8368197, 1, 1, 1, 1, 1,
0.8222629, 1.687399, 0.9370638, 1, 1, 1, 1, 1,
0.822747, -0.0004364949, -0.3445609, 1, 1, 1, 1, 1,
0.8227981, -0.2950019, 0.6110898, 1, 1, 1, 1, 1,
0.8239645, 0.7144336, 0.3073712, 1, 1, 1, 1, 1,
0.8344157, 0.86588, 2.064957, 0, 0, 1, 1, 1,
0.8452017, -0.740312, 3.209952, 1, 0, 0, 1, 1,
0.8475437, -0.6096189, 3.368878, 1, 0, 0, 1, 1,
0.8500391, 0.2733421, 1.336265, 1, 0, 0, 1, 1,
0.8527262, 0.05537841, 1.062847, 1, 0, 0, 1, 1,
0.8543512, 1.888916, 0.9025612, 1, 0, 0, 1, 1,
0.8705015, -1.054559, 2.04518, 0, 0, 0, 1, 1,
0.8713956, 1.120478, 0.2539577, 0, 0, 0, 1, 1,
0.8802273, 1.690452, 1.748244, 0, 0, 0, 1, 1,
0.8854969, 1.648577, 0.0006981994, 0, 0, 0, 1, 1,
0.8892499, -0.1966478, 2.718482, 0, 0, 0, 1, 1,
0.8898043, 1.492157, -0.2077597, 0, 0, 0, 1, 1,
0.8904985, -0.3035414, 2.401541, 0, 0, 0, 1, 1,
0.8956018, -1.61875, 1.893443, 1, 1, 1, 1, 1,
0.8997706, 0.5871621, 1.951601, 1, 1, 1, 1, 1,
0.9084173, 1.085101, 1.756963, 1, 1, 1, 1, 1,
0.9115341, 0.05137108, 0.5463735, 1, 1, 1, 1, 1,
0.913678, 0.4324651, 0.3680133, 1, 1, 1, 1, 1,
0.9192166, 1.040111, 1.415584, 1, 1, 1, 1, 1,
0.9299653, 0.6132208, 2.514591, 1, 1, 1, 1, 1,
0.9361163, -1.041437, 1.700423, 1, 1, 1, 1, 1,
0.9521802, -0.5015757, 3.648351, 1, 1, 1, 1, 1,
0.953913, 0.5422636, 0.862987, 1, 1, 1, 1, 1,
0.9600599, 0.1108741, 1.912067, 1, 1, 1, 1, 1,
0.9632064, -0.2029631, 1.492557, 1, 1, 1, 1, 1,
0.9648011, 0.9228591, 1.29216, 1, 1, 1, 1, 1,
0.9661141, 0.3274634, 1.643317, 1, 1, 1, 1, 1,
0.968757, 0.004135845, 2.005413, 1, 1, 1, 1, 1,
0.9778854, -0.4483524, 1.779055, 0, 0, 1, 1, 1,
0.9814098, -2.015623, 4.321248, 1, 0, 0, 1, 1,
0.9825009, -0.6882205, 0.9772224, 1, 0, 0, 1, 1,
0.9844344, 0.5912868, 0.6112737, 1, 0, 0, 1, 1,
0.9918011, 1.362902, 2.215345, 1, 0, 0, 1, 1,
0.9928322, 1.518938, 1.565247, 1, 0, 0, 1, 1,
0.994469, 0.9363774, 0.3247027, 0, 0, 0, 1, 1,
0.9969068, 2.03337, -1.202684, 0, 0, 0, 1, 1,
0.9984012, 0.7276199, 0.6549672, 0, 0, 0, 1, 1,
0.998751, -1.488468, 1.889474, 0, 0, 0, 1, 1,
1.000916, 0.8977259, -0.667317, 0, 0, 0, 1, 1,
1.004838, 2.136932, -1.60777, 0, 0, 0, 1, 1,
1.005705, 0.5170153, 2.553958, 0, 0, 0, 1, 1,
1.016441, -0.9442016, 2.872861, 1, 1, 1, 1, 1,
1.016565, 1.032488, 1.521191, 1, 1, 1, 1, 1,
1.022539, -0.4622839, 1.777289, 1, 1, 1, 1, 1,
1.035644, -1.571068, 3.398659, 1, 1, 1, 1, 1,
1.036303, 0.2029146, 0.4618144, 1, 1, 1, 1, 1,
1.036323, -0.6058165, 1.887353, 1, 1, 1, 1, 1,
1.038961, 1.466648, -0.1591562, 1, 1, 1, 1, 1,
1.039501, 0.2006925, 0.8490384, 1, 1, 1, 1, 1,
1.050219, -0.7189794, 2.510985, 1, 1, 1, 1, 1,
1.053006, 0.6655762, 0.5698867, 1, 1, 1, 1, 1,
1.0714, 1.703674, 1.16466, 1, 1, 1, 1, 1,
1.090936, 0.9054295, 1.020943, 1, 1, 1, 1, 1,
1.091295, -1.4675, 3.155124, 1, 1, 1, 1, 1,
1.091925, 1.816364, -0.9872137, 1, 1, 1, 1, 1,
1.09535, -0.6083618, 1.942653, 1, 1, 1, 1, 1,
1.097187, -1.006484, 1.876535, 0, 0, 1, 1, 1,
1.097715, 0.3066134, 1.051494, 1, 0, 0, 1, 1,
1.099787, -1.08672, 2.889268, 1, 0, 0, 1, 1,
1.103598, 2.030514, -1.72422, 1, 0, 0, 1, 1,
1.111407, 0.515928, 0.4030322, 1, 0, 0, 1, 1,
1.114634, -1.387941, 2.08843, 1, 0, 0, 1, 1,
1.119764, 0.8318468, 0.09067994, 0, 0, 0, 1, 1,
1.125533, -0.1058922, 1.605232, 0, 0, 0, 1, 1,
1.138749, 0.472267, 2.166045, 0, 0, 0, 1, 1,
1.139768, -0.9221236, 1.209779, 0, 0, 0, 1, 1,
1.140696, -0.6670354, 2.328194, 0, 0, 0, 1, 1,
1.14217, 0.09159256, 1.951834, 0, 0, 0, 1, 1,
1.152393, -0.506555, 1.480393, 0, 0, 0, 1, 1,
1.166674, 0.6851009, 0.8167362, 1, 1, 1, 1, 1,
1.172612, 0.7377309, -0.3178349, 1, 1, 1, 1, 1,
1.173939, 1.541653, 0.04886696, 1, 1, 1, 1, 1,
1.182957, -0.6264499, 3.340724, 1, 1, 1, 1, 1,
1.183178, 0.5195752, 3.393682, 1, 1, 1, 1, 1,
1.19243, -0.01283314, 0.1410664, 1, 1, 1, 1, 1,
1.196203, 0.2182552, 2.942038, 1, 1, 1, 1, 1,
1.198192, 1.012087, 1.473337, 1, 1, 1, 1, 1,
1.212384, -0.07237046, 1.851416, 1, 1, 1, 1, 1,
1.214101, -1.895164, 2.404909, 1, 1, 1, 1, 1,
1.21839, 1.082952, 0.5761155, 1, 1, 1, 1, 1,
1.222354, 0.2161983, -0.1897804, 1, 1, 1, 1, 1,
1.224119, 0.1508953, 3.130307, 1, 1, 1, 1, 1,
1.232746, -0.5960309, 2.03695, 1, 1, 1, 1, 1,
1.236228, 0.5836411, 1.416675, 1, 1, 1, 1, 1,
1.242118, -0.5376423, 3.407804, 0, 0, 1, 1, 1,
1.242895, 1.011512, 0.9258969, 1, 0, 0, 1, 1,
1.246982, -0.4856597, 1.433023, 1, 0, 0, 1, 1,
1.251589, -0.9717433, 0.8810108, 1, 0, 0, 1, 1,
1.251604, -0.556962, 2.033907, 1, 0, 0, 1, 1,
1.253496, 1.171367, 1.676853, 1, 0, 0, 1, 1,
1.262881, 1.416889, -1.757004, 0, 0, 0, 1, 1,
1.263131, -1.490074, 2.932315, 0, 0, 0, 1, 1,
1.264392, 1.214643, -0.9708847, 0, 0, 0, 1, 1,
1.274299, -1.369544, 3.069415, 0, 0, 0, 1, 1,
1.296574, -0.995619, 1.828241, 0, 0, 0, 1, 1,
1.302553, -1.328975, 1.319523, 0, 0, 0, 1, 1,
1.31855, -0.5650083, 1.878502, 0, 0, 0, 1, 1,
1.32057, -1.031405, -0.08877715, 1, 1, 1, 1, 1,
1.327401, 1.191571, 1.693011, 1, 1, 1, 1, 1,
1.330543, 0.7645893, 2.466056, 1, 1, 1, 1, 1,
1.33435, -0.7224421, 2.600424, 1, 1, 1, 1, 1,
1.337883, -1.086846, 1.545962, 1, 1, 1, 1, 1,
1.340945, -0.6772954, 3.077425, 1, 1, 1, 1, 1,
1.352393, 0.1644958, 1.864224, 1, 1, 1, 1, 1,
1.354716, -1.026625, 1.925682, 1, 1, 1, 1, 1,
1.360246, -0.2278815, -0.1461229, 1, 1, 1, 1, 1,
1.365113, -0.1814944, 0.2324449, 1, 1, 1, 1, 1,
1.381169, 0.9137589, 0.4396058, 1, 1, 1, 1, 1,
1.386744, -0.757525, 2.051996, 1, 1, 1, 1, 1,
1.392151, -0.793872, 2.3529, 1, 1, 1, 1, 1,
1.392179, 0.4310458, 1.322657, 1, 1, 1, 1, 1,
1.400064, 0.8593013, 0.3478465, 1, 1, 1, 1, 1,
1.426631, 1.031351, 1.429878, 0, 0, 1, 1, 1,
1.429942, 2.456223, -1.680104, 1, 0, 0, 1, 1,
1.436667, -0.1416328, 3.797532, 1, 0, 0, 1, 1,
1.437739, 0.4908111, 2.196085, 1, 0, 0, 1, 1,
1.439918, 0.6266369, 1.949976, 1, 0, 0, 1, 1,
1.443714, 1.322462, 0.4654085, 1, 0, 0, 1, 1,
1.447636, -0.9668394, 2.18094, 0, 0, 0, 1, 1,
1.449535, -0.7975415, 1.65122, 0, 0, 0, 1, 1,
1.456719, 1.57148, -0.07368796, 0, 0, 0, 1, 1,
1.477277, -2.23384, 2.617832, 0, 0, 0, 1, 1,
1.486342, 0.4952209, 1.100911, 0, 0, 0, 1, 1,
1.496808, 0.07411139, 1.826592, 0, 0, 0, 1, 1,
1.501067, 1.77725, -0.5336139, 0, 0, 0, 1, 1,
1.527167, 1.15997, -0.1718315, 1, 1, 1, 1, 1,
1.556747, -1.168144, 3.084902, 1, 1, 1, 1, 1,
1.562374, 0.8031119, -0.1954528, 1, 1, 1, 1, 1,
1.563279, 0.5916587, 0.4873874, 1, 1, 1, 1, 1,
1.565299, -0.3231929, 2.008388, 1, 1, 1, 1, 1,
1.568681, 0.1093049, 1.369099, 1, 1, 1, 1, 1,
1.575392, 0.7668424, 1.785301, 1, 1, 1, 1, 1,
1.593843, 0.9335749, 0.8143807, 1, 1, 1, 1, 1,
1.599218, -1.358062, 0.3365841, 1, 1, 1, 1, 1,
1.606181, -0.09793027, 2.291047, 1, 1, 1, 1, 1,
1.60762, -1.722786, 2.671077, 1, 1, 1, 1, 1,
1.638417, -0.3282188, 0.3305025, 1, 1, 1, 1, 1,
1.638434, -0.4719684, 2.689827, 1, 1, 1, 1, 1,
1.646613, 0.04291041, 2.303148, 1, 1, 1, 1, 1,
1.649649, 0.009799596, 1.307844, 1, 1, 1, 1, 1,
1.651232, 1.106694, 0.1420906, 0, 0, 1, 1, 1,
1.656965, 0.6302347, 1.526873, 1, 0, 0, 1, 1,
1.661612, 2.383634, -0.4875297, 1, 0, 0, 1, 1,
1.661686, -1.29533, 2.737068, 1, 0, 0, 1, 1,
1.669917, -1.706903, 2.578266, 1, 0, 0, 1, 1,
1.681011, -0.09661374, 0.7130603, 1, 0, 0, 1, 1,
1.701578, -1.536369, 4.379693, 0, 0, 0, 1, 1,
1.714382, 0.5748054, 1.6735, 0, 0, 0, 1, 1,
1.722173, -0.284793, 2.611651, 0, 0, 0, 1, 1,
1.723569, -0.3484972, 3.465828, 0, 0, 0, 1, 1,
1.723794, -0.7908372, 0.7418448, 0, 0, 0, 1, 1,
1.734218, -0.5387207, 2.879226, 0, 0, 0, 1, 1,
1.749108, 0.6363854, 1.153881, 0, 0, 0, 1, 1,
1.753583, -0.08417451, 1.101123, 1, 1, 1, 1, 1,
1.761315, 0.7364472, 0.3497376, 1, 1, 1, 1, 1,
1.762067, -0.3772877, 1.727157, 1, 1, 1, 1, 1,
1.769751, -2.412338, 0.9190864, 1, 1, 1, 1, 1,
1.772385, 2.290918, 0.4774438, 1, 1, 1, 1, 1,
1.775061, 0.6145399, 1.61349, 1, 1, 1, 1, 1,
1.791675, -0.1755058, -0.2049646, 1, 1, 1, 1, 1,
1.797971, -1.803404, 1.588618, 1, 1, 1, 1, 1,
1.81845, 0.2872875, 2.610261, 1, 1, 1, 1, 1,
1.855623, -0.7257278, 1.612975, 1, 1, 1, 1, 1,
1.890851, -0.1015315, 0.9380897, 1, 1, 1, 1, 1,
1.891225, 1.315521, -0.01675762, 1, 1, 1, 1, 1,
1.903249, 0.5532614, 1.298084, 1, 1, 1, 1, 1,
1.92334, -1.6682, 3.221441, 1, 1, 1, 1, 1,
1.932371, 0.02716676, -0.06459849, 1, 1, 1, 1, 1,
1.946841, -0.4888419, 2.943818, 0, 0, 1, 1, 1,
1.960367, 2.104985, 2.475605, 1, 0, 0, 1, 1,
1.990662, 0.7416878, 1.542076, 1, 0, 0, 1, 1,
1.996985, 0.3538027, 0.9665729, 1, 0, 0, 1, 1,
2.003646, -0.4859415, 2.583653, 1, 0, 0, 1, 1,
2.009372, 0.9673653, -0.1576736, 1, 0, 0, 1, 1,
2.016651, 0.8631935, -0.2350584, 0, 0, 0, 1, 1,
2.028904, 1.447017, 0.1302894, 0, 0, 0, 1, 1,
2.08867, -1.000415, 2.187298, 0, 0, 0, 1, 1,
2.09474, 0.3403817, 1.348518, 0, 0, 0, 1, 1,
2.105438, -1.178733, 0.7993166, 0, 0, 0, 1, 1,
2.247003, -0.00364216, 0.8620824, 0, 0, 0, 1, 1,
2.253721, -0.4943303, 3.195207, 0, 0, 0, 1, 1,
2.347116, 0.5588734, -0.2104115, 1, 1, 1, 1, 1,
2.349878, 0.005137776, 2.710913, 1, 1, 1, 1, 1,
2.357273, -1.946777, -0.3854289, 1, 1, 1, 1, 1,
2.643857, -0.3984457, 1.908947, 1, 1, 1, 1, 1,
2.763474, -0.3363877, 2.52897, 1, 1, 1, 1, 1,
2.95766, -0.587581, 2.330347, 1, 1, 1, 1, 1,
3.564272, -1.639732, 0.6010534, 1, 1, 1, 1, 1
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
var radius = 10.15193;
var distance = 35.65821;
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
mvMatrix.translate( 0.1766939, 0.3107233, -0.3545568 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.65821);
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
