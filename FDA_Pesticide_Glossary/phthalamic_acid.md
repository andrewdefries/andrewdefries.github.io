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
-3.387585, 1.149321, -0.6765651, 1, 0, 0, 1,
-3.323842, -0.2857224, -0.9988583, 1, 0.007843138, 0, 1,
-2.999148, -0.08245043, -1.680609, 1, 0.01176471, 0, 1,
-2.528843, -0.8462206, -0.3534557, 1, 0.01960784, 0, 1,
-2.387681, -0.3343819, -1.854994, 1, 0.02352941, 0, 1,
-2.264242, 0.8030923, -0.458242, 1, 0.03137255, 0, 1,
-2.25305, -0.6216756, -1.724833, 1, 0.03529412, 0, 1,
-2.225622, 0.8649577, -2.720048, 1, 0.04313726, 0, 1,
-2.212758, -1.097306, -2.63903, 1, 0.04705882, 0, 1,
-2.210898, -0.5600765, -1.272341, 1, 0.05490196, 0, 1,
-2.156029, 0.6116763, -1.622061, 1, 0.05882353, 0, 1,
-2.116315, 0.1583035, -2.900048, 1, 0.06666667, 0, 1,
-2.094579, -0.8383714, -1.428479, 1, 0.07058824, 0, 1,
-2.065432, 1.608368, 0.5404684, 1, 0.07843138, 0, 1,
-2.053737, -0.8210466, -1.634831, 1, 0.08235294, 0, 1,
-2.051529, -0.5238434, -2.063747, 1, 0.09019608, 0, 1,
-2.03989, -0.7490966, -2.101741, 1, 0.09411765, 0, 1,
-2.005153, 1.124197, -1.937531, 1, 0.1019608, 0, 1,
-1.946883, -0.4616898, -0.7510538, 1, 0.1098039, 0, 1,
-1.936403, -2.727694, -2.009969, 1, 0.1137255, 0, 1,
-1.929049, -1.004752, -4.491611, 1, 0.1215686, 0, 1,
-1.926575, 0.246934, -1.221985, 1, 0.1254902, 0, 1,
-1.920952, 0.9079453, -3.027238, 1, 0.1333333, 0, 1,
-1.92019, 0.04178547, -0.7126867, 1, 0.1372549, 0, 1,
-1.907426, 0.5866289, -2.249008, 1, 0.145098, 0, 1,
-1.874923, 0.835457, -1.4906, 1, 0.1490196, 0, 1,
-1.858193, -0.7250785, -2.67872, 1, 0.1568628, 0, 1,
-1.852307, 1.083295, -1.076905, 1, 0.1607843, 0, 1,
-1.835601, -0.9531568, -2.774305, 1, 0.1686275, 0, 1,
-1.820627, 1.15796, -0.4271593, 1, 0.172549, 0, 1,
-1.820523, 0.5132064, -3.370487, 1, 0.1803922, 0, 1,
-1.800143, 0.8046851, -1.781325, 1, 0.1843137, 0, 1,
-1.786299, 1.348085, -0.002061781, 1, 0.1921569, 0, 1,
-1.785833, 0.4931896, -1.026219, 1, 0.1960784, 0, 1,
-1.779127, 2.250594, -0.7141461, 1, 0.2039216, 0, 1,
-1.723061, -0.8617385, -1.868674, 1, 0.2117647, 0, 1,
-1.716278, -1.038138, -0.8240889, 1, 0.2156863, 0, 1,
-1.713943, -0.3818854, -3.204622, 1, 0.2235294, 0, 1,
-1.701098, -1.623421, -1.825495, 1, 0.227451, 0, 1,
-1.691301, 0.1694891, -0.6843511, 1, 0.2352941, 0, 1,
-1.690134, -0.6041359, -1.009154, 1, 0.2392157, 0, 1,
-1.666219, -1.225808, -2.085937, 1, 0.2470588, 0, 1,
-1.663726, 0.470915, -0.2410865, 1, 0.2509804, 0, 1,
-1.657403, 0.08726772, -0.6403818, 1, 0.2588235, 0, 1,
-1.643649, 0.3833804, -2.428044, 1, 0.2627451, 0, 1,
-1.640737, -1.06931, -2.135969, 1, 0.2705882, 0, 1,
-1.62916, 1.947216, -1.729049, 1, 0.2745098, 0, 1,
-1.606851, -2.753926, -2.182787, 1, 0.282353, 0, 1,
-1.599387, -0.05101605, -0.226446, 1, 0.2862745, 0, 1,
-1.587021, 1.540419, -1.26122, 1, 0.2941177, 0, 1,
-1.577707, -1.445431, -0.2977752, 1, 0.3019608, 0, 1,
-1.575035, -0.6111036, -3.779257, 1, 0.3058824, 0, 1,
-1.565135, 0.2110645, -1.90134, 1, 0.3137255, 0, 1,
-1.560358, 2.606167, -0.793586, 1, 0.3176471, 0, 1,
-1.557545, -0.4488097, -1.055256, 1, 0.3254902, 0, 1,
-1.543422, 1.138474, -1.242153, 1, 0.3294118, 0, 1,
-1.534468, -0.5778255, -2.177151, 1, 0.3372549, 0, 1,
-1.53414, -0.5778837, -2.335751, 1, 0.3411765, 0, 1,
-1.524639, -0.4382661, -1.806156, 1, 0.3490196, 0, 1,
-1.518648, -1.830132, -1.6006, 1, 0.3529412, 0, 1,
-1.513275, 0.3306847, -1.231601, 1, 0.3607843, 0, 1,
-1.511821, 1.051784, 0.220241, 1, 0.3647059, 0, 1,
-1.506801, 0.2537684, 0.2446354, 1, 0.372549, 0, 1,
-1.495663, 1.231701, -3.097409, 1, 0.3764706, 0, 1,
-1.489403, 0.6813824, -0.3041264, 1, 0.3843137, 0, 1,
-1.484701, 0.339984, -1.201851, 1, 0.3882353, 0, 1,
-1.470949, -0.1415991, -2.15496, 1, 0.3960784, 0, 1,
-1.469046, 0.1515898, -3.423763, 1, 0.4039216, 0, 1,
-1.462796, 1.279228, -0.7120438, 1, 0.4078431, 0, 1,
-1.458913, -0.9846982, -2.096154, 1, 0.4156863, 0, 1,
-1.458717, 0.04286329, -1.966038, 1, 0.4196078, 0, 1,
-1.457803, 1.413866, -0.626959, 1, 0.427451, 0, 1,
-1.450021, 0.03518848, -0.4510726, 1, 0.4313726, 0, 1,
-1.438125, 0.5009294, -3.299116, 1, 0.4392157, 0, 1,
-1.435534, -1.239073, -1.512822, 1, 0.4431373, 0, 1,
-1.434726, 1.020054, -1.153031, 1, 0.4509804, 0, 1,
-1.434085, -0.690619, -1.302979, 1, 0.454902, 0, 1,
-1.433867, -0.06013652, 0.2109922, 1, 0.4627451, 0, 1,
-1.417247, 0.4315337, -0.843124, 1, 0.4666667, 0, 1,
-1.401099, -1.143218, -2.297626, 1, 0.4745098, 0, 1,
-1.400524, -1.113553, -2.033215, 1, 0.4784314, 0, 1,
-1.38776, 1.251827, -1.43748, 1, 0.4862745, 0, 1,
-1.381472, 0.8496131, 0.4204111, 1, 0.4901961, 0, 1,
-1.376034, -0.2610161, -0.4118447, 1, 0.4980392, 0, 1,
-1.372539, 0.07704049, -0.137063, 1, 0.5058824, 0, 1,
-1.370298, 0.003573102, -0.6724332, 1, 0.509804, 0, 1,
-1.369295, 0.2428142, 0.5506535, 1, 0.5176471, 0, 1,
-1.367139, -0.798536, -2.055125, 1, 0.5215687, 0, 1,
-1.359487, -0.1857093, -1.320556, 1, 0.5294118, 0, 1,
-1.353073, 1.011135, 0.6747968, 1, 0.5333334, 0, 1,
-1.345794, -2.825182, -2.873118, 1, 0.5411765, 0, 1,
-1.338696, -0.9750357, -1.392832, 1, 0.5450981, 0, 1,
-1.334907, -0.6647483, -0.8639888, 1, 0.5529412, 0, 1,
-1.323143, -0.09668419, -2.458449, 1, 0.5568628, 0, 1,
-1.307348, -0.05079742, -1.704175, 1, 0.5647059, 0, 1,
-1.304935, -1.080623, -0.6446168, 1, 0.5686275, 0, 1,
-1.304306, 0.1000503, -1.413483, 1, 0.5764706, 0, 1,
-1.30162, -0.07557416, -1.644675, 1, 0.5803922, 0, 1,
-1.288919, 0.2162292, 0.9037483, 1, 0.5882353, 0, 1,
-1.288651, -0.5344715, -2.92573, 1, 0.5921569, 0, 1,
-1.286652, 0.6986312, -1.188859, 1, 0.6, 0, 1,
-1.284501, -0.04432596, -0.8975407, 1, 0.6078432, 0, 1,
-1.282812, -0.6602111, -2.279831, 1, 0.6117647, 0, 1,
-1.278827, 1.085492, -0.4714927, 1, 0.6196079, 0, 1,
-1.274224, 0.4343152, -2.777145, 1, 0.6235294, 0, 1,
-1.272213, -1.305964, -4.471017, 1, 0.6313726, 0, 1,
-1.27028, -2.819652, -3.239486, 1, 0.6352941, 0, 1,
-1.269306, 0.339837, -1.28872, 1, 0.6431373, 0, 1,
-1.266889, -0.01414269, -0.323186, 1, 0.6470588, 0, 1,
-1.266693, 0.5800173, -0.3845828, 1, 0.654902, 0, 1,
-1.254445, 0.5980769, -1.21748, 1, 0.6588235, 0, 1,
-1.251621, -1.732421, -3.106837, 1, 0.6666667, 0, 1,
-1.251329, -1.336878, -2.680136, 1, 0.6705883, 0, 1,
-1.248825, -1.83984, -1.958673, 1, 0.6784314, 0, 1,
-1.24409, -0.5197569, -2.586993, 1, 0.682353, 0, 1,
-1.237725, -1.755036, -4.144479, 1, 0.6901961, 0, 1,
-1.236955, -1.376126, -1.768575, 1, 0.6941177, 0, 1,
-1.23502, 0.2194181, -1.880159, 1, 0.7019608, 0, 1,
-1.22712, -1.202961, -2.755142, 1, 0.7098039, 0, 1,
-1.223121, 0.2144635, -2.081939, 1, 0.7137255, 0, 1,
-1.222317, -1.655085, -1.706149, 1, 0.7215686, 0, 1,
-1.217976, 1.205831, -3.429727, 1, 0.7254902, 0, 1,
-1.217826, 0.9870991, -0.6171585, 1, 0.7333333, 0, 1,
-1.214011, 0.7226006, 0.09214424, 1, 0.7372549, 0, 1,
-1.213795, -1.220659, -3.269222, 1, 0.7450981, 0, 1,
-1.209584, 1.836065, -0.5282428, 1, 0.7490196, 0, 1,
-1.197392, 2.108994, -0.904707, 1, 0.7568628, 0, 1,
-1.187375, 0.0835164, -3.039122, 1, 0.7607843, 0, 1,
-1.182429, -0.2004749, 0.1269827, 1, 0.7686275, 0, 1,
-1.169991, -0.8068905, -1.2357, 1, 0.772549, 0, 1,
-1.152837, -1.535366, -1.409022, 1, 0.7803922, 0, 1,
-1.141292, -0.290528, -2.714543, 1, 0.7843137, 0, 1,
-1.138495, -0.2866974, -1.368962, 1, 0.7921569, 0, 1,
-1.135781, 0.3639137, -3.132071, 1, 0.7960784, 0, 1,
-1.135473, 1.985338, -0.0007418661, 1, 0.8039216, 0, 1,
-1.124259, -0.0366321, 0.8883666, 1, 0.8117647, 0, 1,
-1.116755, -0.1555519, -1.730519, 1, 0.8156863, 0, 1,
-1.109377, 0.4559504, -0.09467012, 1, 0.8235294, 0, 1,
-1.107614, 0.1513807, -0.3027177, 1, 0.827451, 0, 1,
-1.088265, 0.7740358, -0.6696895, 1, 0.8352941, 0, 1,
-1.087986, -0.8595349, -0.9419058, 1, 0.8392157, 0, 1,
-1.085943, -0.1037066, -1.244685, 1, 0.8470588, 0, 1,
-1.077415, -0.3007863, -2.295687, 1, 0.8509804, 0, 1,
-1.076179, 0.5054981, -1.26146, 1, 0.8588235, 0, 1,
-1.073402, -0.9479777, -2.145831, 1, 0.8627451, 0, 1,
-1.072197, 1.198866, -0.1248024, 1, 0.8705882, 0, 1,
-1.070788, 1.780261, -0.5090646, 1, 0.8745098, 0, 1,
-1.064421, 0.1813673, -1.841453, 1, 0.8823529, 0, 1,
-1.063201, 1.501394, 0.9985855, 1, 0.8862745, 0, 1,
-1.060896, -0.1380132, -1.360309, 1, 0.8941177, 0, 1,
-1.055192, 1.385882, -1.865981, 1, 0.8980392, 0, 1,
-1.053454, -0.7772186, -3.627181, 1, 0.9058824, 0, 1,
-1.051445, 1.217245, -1.295771, 1, 0.9137255, 0, 1,
-1.050502, 0.8280895, -0.8067774, 1, 0.9176471, 0, 1,
-1.04873, -0.04439397, -0.7701024, 1, 0.9254902, 0, 1,
-1.044485, 0.7068179, -1.182105, 1, 0.9294118, 0, 1,
-1.042274, 0.7154422, 0.1729368, 1, 0.9372549, 0, 1,
-1.038209, 0.009124789, -2.496794, 1, 0.9411765, 0, 1,
-1.036985, -0.7641605, -3.249427, 1, 0.9490196, 0, 1,
-1.036879, 0.8460373, -2.168028, 1, 0.9529412, 0, 1,
-1.02615, -0.7565483, -1.639358, 1, 0.9607843, 0, 1,
-1.024765, -2.061118, -2.892429, 1, 0.9647059, 0, 1,
-1.023336, 0.3589813, -0.7936882, 1, 0.972549, 0, 1,
-1.01348, 0.7224156, -2.52148, 1, 0.9764706, 0, 1,
-1.008521, -0.6526403, -0.6891763, 1, 0.9843137, 0, 1,
-1.002417, 1.840185, 0.1417546, 1, 0.9882353, 0, 1,
-0.9930305, 0.1504766, -1.532514, 1, 0.9960784, 0, 1,
-0.9875694, 1.728489, 0.3391694, 0.9960784, 1, 0, 1,
-0.9856253, -1.252591, -2.825868, 0.9921569, 1, 0, 1,
-0.9850265, -0.0005324392, -1.606383, 0.9843137, 1, 0, 1,
-0.9840484, 0.3958193, -0.564424, 0.9803922, 1, 0, 1,
-0.9736304, 0.923268, -0.04285363, 0.972549, 1, 0, 1,
-0.9726007, -1.752059, -2.953283, 0.9686275, 1, 0, 1,
-0.9706292, -0.1350975, -2.576432, 0.9607843, 1, 0, 1,
-0.9704199, 1.068139, -1.025762, 0.9568627, 1, 0, 1,
-0.9648727, 0.2066431, -0.7791375, 0.9490196, 1, 0, 1,
-0.9648169, 0.07349024, -1.125954, 0.945098, 1, 0, 1,
-0.9646936, 0.7957401, -0.4490947, 0.9372549, 1, 0, 1,
-0.9630288, -0.1610407, -2.275254, 0.9333333, 1, 0, 1,
-0.9612217, -2.71256, -4.129926, 0.9254902, 1, 0, 1,
-0.9528943, 0.08531729, -0.8148621, 0.9215686, 1, 0, 1,
-0.9499589, 0.492128, -0.2507472, 0.9137255, 1, 0, 1,
-0.9473789, 0.7572628, -1.614859, 0.9098039, 1, 0, 1,
-0.9471554, -0.1841175, -0.480006, 0.9019608, 1, 0, 1,
-0.944148, -0.08386112, -1.045082, 0.8941177, 1, 0, 1,
-0.9397336, 0.4441187, -0.2071794, 0.8901961, 1, 0, 1,
-0.9377389, -0.8116326, -2.840132, 0.8823529, 1, 0, 1,
-0.9308025, -0.7476467, -1.417971, 0.8784314, 1, 0, 1,
-0.9301541, 0.09390938, -0.9864415, 0.8705882, 1, 0, 1,
-0.9218968, -2.082286, -1.771424, 0.8666667, 1, 0, 1,
-0.9199956, 0.09756522, -1.804573, 0.8588235, 1, 0, 1,
-0.9177449, 1.787585, -0.8350049, 0.854902, 1, 0, 1,
-0.9155908, -1.236534, -1.114573, 0.8470588, 1, 0, 1,
-0.911272, -0.07724419, -0.5108011, 0.8431373, 1, 0, 1,
-0.9102554, 0.08030811, -3.117245, 0.8352941, 1, 0, 1,
-0.9101769, -1.09138, -2.702795, 0.8313726, 1, 0, 1,
-0.9092957, -0.8630319, -1.319902, 0.8235294, 1, 0, 1,
-0.9071779, 0.8931471, -0.6185429, 0.8196079, 1, 0, 1,
-0.9010735, -0.5560544, -1.938415, 0.8117647, 1, 0, 1,
-0.9009684, -0.9421718, -3.046077, 0.8078431, 1, 0, 1,
-0.8967836, 1.051268, 0.3426372, 0.8, 1, 0, 1,
-0.8956134, 0.6632262, -2.370491, 0.7921569, 1, 0, 1,
-0.8925477, 0.07053852, -2.804199, 0.7882353, 1, 0, 1,
-0.8871112, -0.5861858, -1.897142, 0.7803922, 1, 0, 1,
-0.8804653, -1.076717, -3.430571, 0.7764706, 1, 0, 1,
-0.8762443, -0.9145801, -2.708311, 0.7686275, 1, 0, 1,
-0.8758004, 0.2007278, -2.762712, 0.7647059, 1, 0, 1,
-0.8755054, 0.2551086, -1.72169, 0.7568628, 1, 0, 1,
-0.8743292, 0.06411684, -1.801541, 0.7529412, 1, 0, 1,
-0.8699524, -0.9274731, -3.673426, 0.7450981, 1, 0, 1,
-0.8672758, 0.09126369, -0.3316801, 0.7411765, 1, 0, 1,
-0.8638061, 0.7489859, -0.8510716, 0.7333333, 1, 0, 1,
-0.8606271, 1.457113, 0.8332552, 0.7294118, 1, 0, 1,
-0.8561328, -0.9644531, -1.136545, 0.7215686, 1, 0, 1,
-0.843783, -0.1847915, -1.07496, 0.7176471, 1, 0, 1,
-0.8416988, -0.8672275, -2.95026, 0.7098039, 1, 0, 1,
-0.8380027, -0.5059438, -1.829649, 0.7058824, 1, 0, 1,
-0.8375326, -0.5248941, -2.807219, 0.6980392, 1, 0, 1,
-0.8372825, -0.2756072, -2.13849, 0.6901961, 1, 0, 1,
-0.8331162, -0.7093501, -3.038748, 0.6862745, 1, 0, 1,
-0.8241642, -1.017391, -1.380968, 0.6784314, 1, 0, 1,
-0.8201666, 1.264381, -1.153319, 0.6745098, 1, 0, 1,
-0.8201167, -0.9144257, -1.483241, 0.6666667, 1, 0, 1,
-0.8058522, -1.491235, -1.639392, 0.6627451, 1, 0, 1,
-0.7971769, 1.237491, -2.653884, 0.654902, 1, 0, 1,
-0.79388, -0.02146624, -0.2423836, 0.6509804, 1, 0, 1,
-0.7927599, -0.4580366, -2.573375, 0.6431373, 1, 0, 1,
-0.7893759, -0.3746736, -2.237677, 0.6392157, 1, 0, 1,
-0.7843276, -0.01089485, -2.572269, 0.6313726, 1, 0, 1,
-0.783762, 0.2612396, -0.4145078, 0.627451, 1, 0, 1,
-0.7835981, 0.02448588, -0.4660843, 0.6196079, 1, 0, 1,
-0.7829859, -1.066106, -3.458326, 0.6156863, 1, 0, 1,
-0.7765324, 0.03891189, -0.6783592, 0.6078432, 1, 0, 1,
-0.7719567, 0.9865124, -0.7278051, 0.6039216, 1, 0, 1,
-0.767722, 1.203987, -0.1417506, 0.5960785, 1, 0, 1,
-0.7658058, -0.773291, -1.248454, 0.5882353, 1, 0, 1,
-0.7638658, 0.8733238, -0.8637284, 0.5843138, 1, 0, 1,
-0.7625108, 0.5992483, -0.2715241, 0.5764706, 1, 0, 1,
-0.7575292, 2.236631, -1.599885, 0.572549, 1, 0, 1,
-0.7573268, -0.3052985, -1.572521, 0.5647059, 1, 0, 1,
-0.7457311, -0.3965069, -1.179021, 0.5607843, 1, 0, 1,
-0.7414418, -0.1571402, -3.379496, 0.5529412, 1, 0, 1,
-0.7400827, 0.7627869, -2.109025, 0.5490196, 1, 0, 1,
-0.7386466, -0.4189742, -2.371691, 0.5411765, 1, 0, 1,
-0.7292985, -1.057098, -3.151283, 0.5372549, 1, 0, 1,
-0.7285058, 0.06200435, -0.3191046, 0.5294118, 1, 0, 1,
-0.7252535, 0.2769893, -1.372481, 0.5254902, 1, 0, 1,
-0.721743, -1.274189, -2.996547, 0.5176471, 1, 0, 1,
-0.7192378, -0.2662711, -2.474948, 0.5137255, 1, 0, 1,
-0.7107843, -2.134016, -1.723893, 0.5058824, 1, 0, 1,
-0.704545, -0.1381489, 2.023327, 0.5019608, 1, 0, 1,
-0.6942894, 0.05656373, -1.28238, 0.4941176, 1, 0, 1,
-0.6930917, -0.008109533, -3.107518, 0.4862745, 1, 0, 1,
-0.6762958, 1.289071, 0.7272003, 0.4823529, 1, 0, 1,
-0.6747594, 0.6132152, -0.2269273, 0.4745098, 1, 0, 1,
-0.6745897, -0.5298913, -0.7945212, 0.4705882, 1, 0, 1,
-0.6745803, 1.362979, -0.4710965, 0.4627451, 1, 0, 1,
-0.6729809, -0.7513732, -3.152231, 0.4588235, 1, 0, 1,
-0.6723837, 0.008170075, 0.2685736, 0.4509804, 1, 0, 1,
-0.6719364, 1.713876, -0.5705987, 0.4470588, 1, 0, 1,
-0.6711495, -0.1363336, -2.370939, 0.4392157, 1, 0, 1,
-0.671078, -0.885394, -0.6651708, 0.4352941, 1, 0, 1,
-0.6701561, 0.8671407, -0.9787084, 0.427451, 1, 0, 1,
-0.6670902, -0.3474517, -4.227819, 0.4235294, 1, 0, 1,
-0.6641856, 0.3437825, -0.3653227, 0.4156863, 1, 0, 1,
-0.6626588, 1.06598, -1.615236, 0.4117647, 1, 0, 1,
-0.6525574, -0.5412433, -0.577924, 0.4039216, 1, 0, 1,
-0.6463779, -0.370141, -2.719681, 0.3960784, 1, 0, 1,
-0.6460923, 0.9324597, 0.08508873, 0.3921569, 1, 0, 1,
-0.6456907, 0.7783361, -0.2055024, 0.3843137, 1, 0, 1,
-0.6447635, 0.1387828, -0.2797818, 0.3803922, 1, 0, 1,
-0.6373823, -1.342192, -4.127877, 0.372549, 1, 0, 1,
-0.6287188, -0.4263781, -1.397158, 0.3686275, 1, 0, 1,
-0.6282456, -1.497321, -3.019006, 0.3607843, 1, 0, 1,
-0.6276006, -0.5815156, -3.115986, 0.3568628, 1, 0, 1,
-0.6267199, -0.8723828, -3.35837, 0.3490196, 1, 0, 1,
-0.623773, 0.9164809, -0.9071332, 0.345098, 1, 0, 1,
-0.6210502, -1.273229, -3.504664, 0.3372549, 1, 0, 1,
-0.6207322, 1.129282, -0.8080072, 0.3333333, 1, 0, 1,
-0.613169, -1.494574, -4.473493, 0.3254902, 1, 0, 1,
-0.6119625, -0.6941075, -2.926604, 0.3215686, 1, 0, 1,
-0.6090029, 0.2216785, -0.8580461, 0.3137255, 1, 0, 1,
-0.6081111, -0.5736513, -2.702408, 0.3098039, 1, 0, 1,
-0.6074883, 0.3546881, -2.30641, 0.3019608, 1, 0, 1,
-0.6063878, 0.334737, 0.2379812, 0.2941177, 1, 0, 1,
-0.6036253, 1.143148, -0.8814686, 0.2901961, 1, 0, 1,
-0.6028706, -0.2789398, -1.722301, 0.282353, 1, 0, 1,
-0.6003836, 0.8020727, -0.828252, 0.2784314, 1, 0, 1,
-0.5964739, -1.44585, -2.59052, 0.2705882, 1, 0, 1,
-0.5964202, -0.02239302, -0.5099245, 0.2666667, 1, 0, 1,
-0.5928861, -0.8888987, -2.352992, 0.2588235, 1, 0, 1,
-0.5837624, 0.6952531, -1.55569, 0.254902, 1, 0, 1,
-0.5803915, -1.601122, -2.425954, 0.2470588, 1, 0, 1,
-0.5796878, 1.288008, -1.253426, 0.2431373, 1, 0, 1,
-0.5760816, 1.565579, 0.5006131, 0.2352941, 1, 0, 1,
-0.5744764, 0.3384572, -2.599387, 0.2313726, 1, 0, 1,
-0.5660883, -2.752239, -1.302256, 0.2235294, 1, 0, 1,
-0.5613009, -0.1311015, -0.7272285, 0.2196078, 1, 0, 1,
-0.5609499, 1.576747, -0.4186082, 0.2117647, 1, 0, 1,
-0.5588896, -1.39954, -1.854165, 0.2078431, 1, 0, 1,
-0.5565644, -1.351246, -2.653331, 0.2, 1, 0, 1,
-0.552694, -0.5735343, -2.423585, 0.1921569, 1, 0, 1,
-0.5447422, 0.7989905, -0.3129508, 0.1882353, 1, 0, 1,
-0.5386976, 1.334728, -1.282297, 0.1803922, 1, 0, 1,
-0.5336795, -0.2330512, -1.036123, 0.1764706, 1, 0, 1,
-0.53106, -0.6482184, -2.838291, 0.1686275, 1, 0, 1,
-0.5275506, -0.9093099, -1.987723, 0.1647059, 1, 0, 1,
-0.5273582, 0.02317316, -1.536839, 0.1568628, 1, 0, 1,
-0.5271516, 0.5680059, -0.2574428, 0.1529412, 1, 0, 1,
-0.525276, -0.30864, -2.242922, 0.145098, 1, 0, 1,
-0.5214587, 0.2464315, 0.2706176, 0.1411765, 1, 0, 1,
-0.517097, -1.383812, -1.542348, 0.1333333, 1, 0, 1,
-0.5159851, -0.01515104, -1.080641, 0.1294118, 1, 0, 1,
-0.5134787, 0.810998, 1.405554, 0.1215686, 1, 0, 1,
-0.513193, -1.38394, -4.331151, 0.1176471, 1, 0, 1,
-0.5109617, 0.1380696, -1.799005, 0.1098039, 1, 0, 1,
-0.5075087, 0.2272828, -0.03496224, 0.1058824, 1, 0, 1,
-0.5046842, 0.6366166, 1.709419, 0.09803922, 1, 0, 1,
-0.5037525, -1.192022, -3.51055, 0.09019608, 1, 0, 1,
-0.5030415, 2.126353, -1.239044, 0.08627451, 1, 0, 1,
-0.502822, -0.5603467, -2.385391, 0.07843138, 1, 0, 1,
-0.5025135, 1.228712, -0.1028761, 0.07450981, 1, 0, 1,
-0.4951111, -2.31448, -2.304653, 0.06666667, 1, 0, 1,
-0.4937783, -0.4052903, -2.839956, 0.0627451, 1, 0, 1,
-0.4865561, -1.520974, -3.769736, 0.05490196, 1, 0, 1,
-0.4826786, 0.07195789, -2.991781, 0.05098039, 1, 0, 1,
-0.4812612, -1.737398, -2.586454, 0.04313726, 1, 0, 1,
-0.4779626, 0.5712543, 0.3896411, 0.03921569, 1, 0, 1,
-0.4766377, -0.9019375, -3.32743, 0.03137255, 1, 0, 1,
-0.4739299, 1.790347, -0.8709353, 0.02745098, 1, 0, 1,
-0.4679473, -0.7407403, -1.42568, 0.01960784, 1, 0, 1,
-0.4638491, -0.3260643, -3.787068, 0.01568628, 1, 0, 1,
-0.4629566, -1.349168, -3.613104, 0.007843138, 1, 0, 1,
-0.4573264, -0.1149837, -3.348106, 0.003921569, 1, 0, 1,
-0.4561363, -0.4074611, -3.54743, 0, 1, 0.003921569, 1,
-0.449756, 1.757453, -0.5562904, 0, 1, 0.01176471, 1,
-0.4405828, -1.269171, -3.550945, 0, 1, 0.01568628, 1,
-0.4403072, -0.3312995, 0.1706107, 0, 1, 0.02352941, 1,
-0.4333657, 0.2111118, -1.028865, 0, 1, 0.02745098, 1,
-0.4325459, 2.113038, 0.001934197, 0, 1, 0.03529412, 1,
-0.4306235, 0.7349811, -1.520056, 0, 1, 0.03921569, 1,
-0.4292601, -1.108474, -2.955716, 0, 1, 0.04705882, 1,
-0.4278524, 1.283041, -0.622264, 0, 1, 0.05098039, 1,
-0.4250484, -0.1278509, -2.148701, 0, 1, 0.05882353, 1,
-0.4185734, -1.203404, -3.725341, 0, 1, 0.0627451, 1,
-0.4130421, -0.22473, -2.680886, 0, 1, 0.07058824, 1,
-0.4111001, -0.2680543, -1.410102, 0, 1, 0.07450981, 1,
-0.4057501, 1.247145, -1.508344, 0, 1, 0.08235294, 1,
-0.4050556, 0.03924023, -1.754999, 0, 1, 0.08627451, 1,
-0.4044326, -0.8305554, -3.019725, 0, 1, 0.09411765, 1,
-0.4030661, -0.002104769, -3.032493, 0, 1, 0.1019608, 1,
-0.3948945, 0.4481682, -2.015908, 0, 1, 0.1058824, 1,
-0.3946192, 2.148471, 0.8291401, 0, 1, 0.1137255, 1,
-0.3909707, 0.3361013, -0.05895882, 0, 1, 0.1176471, 1,
-0.3860317, -0.440538, -2.336946, 0, 1, 0.1254902, 1,
-0.3806431, 2.39739, 0.3264258, 0, 1, 0.1294118, 1,
-0.3791691, -0.5368267, -1.204287, 0, 1, 0.1372549, 1,
-0.3743613, 0.4595087, 0.3046133, 0, 1, 0.1411765, 1,
-0.371047, -0.5619908, -2.19191, 0, 1, 0.1490196, 1,
-0.3642529, 1.318683, 0.500782, 0, 1, 0.1529412, 1,
-0.3602095, -1.005309, -2.747659, 0, 1, 0.1607843, 1,
-0.3587798, 0.7982153, -0.7656512, 0, 1, 0.1647059, 1,
-0.3565218, -2.182291, -2.69605, 0, 1, 0.172549, 1,
-0.3536865, -0.2208371, -1.330613, 0, 1, 0.1764706, 1,
-0.3511688, -0.3633316, -2.943984, 0, 1, 0.1843137, 1,
-0.3488474, -0.005407252, -1.877757, 0, 1, 0.1882353, 1,
-0.3469774, 0.3286704, -0.3364737, 0, 1, 0.1960784, 1,
-0.3452386, -0.2714465, -1.85006, 0, 1, 0.2039216, 1,
-0.3407542, -0.4438778, -2.407449, 0, 1, 0.2078431, 1,
-0.3381958, -0.552026, -2.654402, 0, 1, 0.2156863, 1,
-0.334124, 0.1984406, -1.680225, 0, 1, 0.2196078, 1,
-0.3315588, -1.017747, -2.939216, 0, 1, 0.227451, 1,
-0.3313733, -0.7923086, -2.089544, 0, 1, 0.2313726, 1,
-0.3258404, -1.019232, -1.112738, 0, 1, 0.2392157, 1,
-0.3251313, -0.007116515, -1.62027, 0, 1, 0.2431373, 1,
-0.3247956, -0.4078781, -2.833927, 0, 1, 0.2509804, 1,
-0.3226189, -0.7475544, -4.517703, 0, 1, 0.254902, 1,
-0.320982, -1.534847, -2.463524, 0, 1, 0.2627451, 1,
-0.3185633, -0.191409, -1.965371, 0, 1, 0.2666667, 1,
-0.3170832, 0.6339107, -1.012569, 0, 1, 0.2745098, 1,
-0.3158782, 0.4916404, -0.8375287, 0, 1, 0.2784314, 1,
-0.3156916, 0.5349218, -1.199602, 0, 1, 0.2862745, 1,
-0.3153637, 0.09103164, -1.784917, 0, 1, 0.2901961, 1,
-0.3143076, 0.4207972, -1.693198, 0, 1, 0.2980392, 1,
-0.3135587, 0.4338048, 0.1906089, 0, 1, 0.3058824, 1,
-0.3069961, -1.315192, -1.989201, 0, 1, 0.3098039, 1,
-0.3064335, 0.5887865, -0.3527797, 0, 1, 0.3176471, 1,
-0.3045805, 0.9384921, -0.1243693, 0, 1, 0.3215686, 1,
-0.3002938, -0.3547314, -2.209992, 0, 1, 0.3294118, 1,
-0.2905666, -1.287916, -4.0418, 0, 1, 0.3333333, 1,
-0.282741, 0.1842239, -1.209803, 0, 1, 0.3411765, 1,
-0.2818628, -0.9470736, -3.526884, 0, 1, 0.345098, 1,
-0.280566, -0.9087858, -3.484451, 0, 1, 0.3529412, 1,
-0.2712085, 0.6494554, -0.4646585, 0, 1, 0.3568628, 1,
-0.2706771, -1.593244, -3.534336, 0, 1, 0.3647059, 1,
-0.265177, -0.3184089, -1.575797, 0, 1, 0.3686275, 1,
-0.2566369, -1.124609, -2.667485, 0, 1, 0.3764706, 1,
-0.2555373, 0.8985499, -2.32985, 0, 1, 0.3803922, 1,
-0.2533517, 1.923391, 1.039689, 0, 1, 0.3882353, 1,
-0.2525329, 0.9784714, -0.7324178, 0, 1, 0.3921569, 1,
-0.2511359, -0.9077622, -2.856043, 0, 1, 0.4, 1,
-0.2503651, 0.1041513, -0.6461876, 0, 1, 0.4078431, 1,
-0.2501764, 1.260719, 0.4454052, 0, 1, 0.4117647, 1,
-0.2483095, 0.02115961, -1.594474, 0, 1, 0.4196078, 1,
-0.2477627, -0.9641631, -5.156149, 0, 1, 0.4235294, 1,
-0.2465056, 0.9539539, 1.027731, 0, 1, 0.4313726, 1,
-0.2449955, 0.9277208, -0.4685767, 0, 1, 0.4352941, 1,
-0.2392365, 0.8615366, -0.6010046, 0, 1, 0.4431373, 1,
-0.2391322, -0.393097, -3.818257, 0, 1, 0.4470588, 1,
-0.2353681, -0.6988941, -2.265879, 0, 1, 0.454902, 1,
-0.2337494, -0.5414752, -4.259745, 0, 1, 0.4588235, 1,
-0.2330986, -0.5631725, -2.823391, 0, 1, 0.4666667, 1,
-0.2318724, 0.8234113, -0.2476672, 0, 1, 0.4705882, 1,
-0.2280225, -0.3954082, -2.390864, 0, 1, 0.4784314, 1,
-0.2274926, 0.3349296, -0.3788628, 0, 1, 0.4823529, 1,
-0.2265809, -1.183447, -3.173289, 0, 1, 0.4901961, 1,
-0.2259486, 0.2515011, -1.306363, 0, 1, 0.4941176, 1,
-0.2252519, 0.6707878, 0.2090091, 0, 1, 0.5019608, 1,
-0.2189679, -0.05962991, -2.276948, 0, 1, 0.509804, 1,
-0.2175025, -2.061989, -2.904279, 0, 1, 0.5137255, 1,
-0.2161719, 0.295902, -0.1055486, 0, 1, 0.5215687, 1,
-0.2107464, 0.02900249, -2.24975, 0, 1, 0.5254902, 1,
-0.202748, 0.3601002, -0.7134964, 0, 1, 0.5333334, 1,
-0.2017792, 0.4798947, 0.7984829, 0, 1, 0.5372549, 1,
-0.1933372, -1.393635, -2.713296, 0, 1, 0.5450981, 1,
-0.1922197, -2.657688, -2.965586, 0, 1, 0.5490196, 1,
-0.1919357, -0.3282925, -1.801324, 0, 1, 0.5568628, 1,
-0.1912215, -0.2033332, -2.241105, 0, 1, 0.5607843, 1,
-0.190975, -0.3370646, -3.274741, 0, 1, 0.5686275, 1,
-0.1855062, -1.038144, -4.032898, 0, 1, 0.572549, 1,
-0.1830336, 0.6764215, -0.6964735, 0, 1, 0.5803922, 1,
-0.1828573, 0.4605963, 0.3987543, 0, 1, 0.5843138, 1,
-0.1804203, -0.2849997, -2.698589, 0, 1, 0.5921569, 1,
-0.1798909, -0.6435525, -2.025744, 0, 1, 0.5960785, 1,
-0.1796092, 0.1940764, -0.8508116, 0, 1, 0.6039216, 1,
-0.1779764, -1.244472, -1.852455, 0, 1, 0.6117647, 1,
-0.1771178, -1.012674, -2.24728, 0, 1, 0.6156863, 1,
-0.1747503, -1.622355, -2.238524, 0, 1, 0.6235294, 1,
-0.1730748, -0.3532334, -1.854265, 0, 1, 0.627451, 1,
-0.1728869, -0.1477672, -1.154051, 0, 1, 0.6352941, 1,
-0.1718943, -1.84599, -1.730994, 0, 1, 0.6392157, 1,
-0.1715157, 0.3135391, -1.806404, 0, 1, 0.6470588, 1,
-0.1687138, 0.8716852, 0.6222744, 0, 1, 0.6509804, 1,
-0.1679904, 0.1761452, 0.03786061, 0, 1, 0.6588235, 1,
-0.1625641, 0.3008476, -1.539919, 0, 1, 0.6627451, 1,
-0.162539, 0.124335, -0.8861083, 0, 1, 0.6705883, 1,
-0.1611764, -0.02708148, -1.702386, 0, 1, 0.6745098, 1,
-0.15602, 1.322943, 0.1545798, 0, 1, 0.682353, 1,
-0.1505582, -0.8024431, -4.213218, 0, 1, 0.6862745, 1,
-0.150027, 0.5249267, -1.069961, 0, 1, 0.6941177, 1,
-0.1463395, 0.5286283, -0.4256682, 0, 1, 0.7019608, 1,
-0.1447191, 0.389813, -0.07672054, 0, 1, 0.7058824, 1,
-0.1436219, 0.9141065, -0.3585648, 0, 1, 0.7137255, 1,
-0.1421023, 0.7161423, 0.3762819, 0, 1, 0.7176471, 1,
-0.1381986, -0.6041512, -6.689471, 0, 1, 0.7254902, 1,
-0.138153, 1.402547, 0.1450308, 0, 1, 0.7294118, 1,
-0.1296407, -0.8648934, -1.875387, 0, 1, 0.7372549, 1,
-0.127548, -1.43209, -3.090519, 0, 1, 0.7411765, 1,
-0.1253336, 1.805277, -0.1804677, 0, 1, 0.7490196, 1,
-0.120457, 0.4944559, -1.018056, 0, 1, 0.7529412, 1,
-0.1198392, -0.01596811, -2.300039, 0, 1, 0.7607843, 1,
-0.1178042, 1.182284, -0.4314186, 0, 1, 0.7647059, 1,
-0.1152325, -1.242358, -2.034522, 0, 1, 0.772549, 1,
-0.1138323, 0.8934409, -0.8111234, 0, 1, 0.7764706, 1,
-0.103391, -0.8052752, -2.434189, 0, 1, 0.7843137, 1,
-0.1031992, -0.5751421, -3.364192, 0, 1, 0.7882353, 1,
-0.09522153, 1.68659, 1.813422, 0, 1, 0.7960784, 1,
-0.09368296, -0.4797427, -3.654347, 0, 1, 0.8039216, 1,
-0.09005024, 0.4248592, -0.9392111, 0, 1, 0.8078431, 1,
-0.08590008, 0.1827444, -1.531547, 0, 1, 0.8156863, 1,
-0.08082337, 2.798968, 0.371922, 0, 1, 0.8196079, 1,
-0.07482359, -0.8736712, -3.707532, 0, 1, 0.827451, 1,
-0.07253639, 0.047259, -0.2861957, 0, 1, 0.8313726, 1,
-0.06768281, -0.7883381, -2.107726, 0, 1, 0.8392157, 1,
-0.06699745, 2.414119, -0.8060475, 0, 1, 0.8431373, 1,
-0.06568117, -0.8230326, -2.487186, 0, 1, 0.8509804, 1,
-0.06275267, 0.6949155, 0.05630051, 0, 1, 0.854902, 1,
-0.06242635, -0.4370228, -2.565717, 0, 1, 0.8627451, 1,
-0.05938794, -0.5524339, -3.418232, 0, 1, 0.8666667, 1,
-0.05861968, -1.245917, -4.043919, 0, 1, 0.8745098, 1,
-0.0566125, 1.093719, -1.511399, 0, 1, 0.8784314, 1,
-0.056275, -0.9270017, -3.404165, 0, 1, 0.8862745, 1,
-0.05417822, 0.4693702, -0.6183289, 0, 1, 0.8901961, 1,
-0.05305618, -1.343745, -3.288543, 0, 1, 0.8980392, 1,
-0.04714758, 0.482762, 0.1174862, 0, 1, 0.9058824, 1,
-0.04439528, -2.583694, -2.160876, 0, 1, 0.9098039, 1,
-0.04437299, -0.4315156, -2.6361, 0, 1, 0.9176471, 1,
-0.03752397, -1.310391, -2.869046, 0, 1, 0.9215686, 1,
-0.03415325, -0.8257976, -4.065429, 0, 1, 0.9294118, 1,
-0.03353043, 1.634929, 0.8060316, 0, 1, 0.9333333, 1,
-0.03278751, 0.7086102, -0.6492907, 0, 1, 0.9411765, 1,
-0.03161533, -1.937718, -3.340699, 0, 1, 0.945098, 1,
-0.03156785, 0.9933925, -0.2314116, 0, 1, 0.9529412, 1,
-0.03007964, -0.08354116, -3.988663, 0, 1, 0.9568627, 1,
-0.0289628, 0.002690137, -1.484332, 0, 1, 0.9647059, 1,
-0.02657853, -0.1262272, -4.503196, 0, 1, 0.9686275, 1,
-0.02365049, -0.777439, -2.2102, 0, 1, 0.9764706, 1,
-0.01997746, -0.7944785, -3.398186, 0, 1, 0.9803922, 1,
-0.01973334, -0.7196182, -2.330184, 0, 1, 0.9882353, 1,
-0.0150881, 0.8649566, -0.2780279, 0, 1, 0.9921569, 1,
-0.01343352, 1.020216, 0.543911, 0, 1, 1, 1,
-0.01132129, 0.5979652, 0.2612679, 0, 0.9921569, 1, 1,
-0.00721155, 0.4825663, -0.654466, 0, 0.9882353, 1, 1,
-0.004821444, 0.7899351, 2.525682, 0, 0.9803922, 1, 1,
-0.002566612, 0.07340834, -0.3064687, 0, 0.9764706, 1, 1,
-0.002213567, -0.05762362, -3.639742, 0, 0.9686275, 1, 1,
0.003465583, -0.7522305, 1.975581, 0, 0.9647059, 1, 1,
0.006435874, 0.09235556, 0.1446021, 0, 0.9568627, 1, 1,
0.008012585, -0.6878185, 1.809057, 0, 0.9529412, 1, 1,
0.008085699, -0.8246817, 2.632408, 0, 0.945098, 1, 1,
0.008710406, 0.3721937, -0.9174469, 0, 0.9411765, 1, 1,
0.01483724, 1.604904, 0.186123, 0, 0.9333333, 1, 1,
0.01819802, 0.6083919, -0.2391559, 0, 0.9294118, 1, 1,
0.02027647, -0.6331853, 2.650572, 0, 0.9215686, 1, 1,
0.02227697, -0.9837167, 3.670083, 0, 0.9176471, 1, 1,
0.02433094, 0.04835354, -0.8063192, 0, 0.9098039, 1, 1,
0.02577159, -0.661518, 4.779704, 0, 0.9058824, 1, 1,
0.02651485, -0.8853635, 4.038786, 0, 0.8980392, 1, 1,
0.02710993, -0.002885562, 1.729717, 0, 0.8901961, 1, 1,
0.02727305, -0.7708947, 2.418602, 0, 0.8862745, 1, 1,
0.02833227, 0.5286569, -3.265774, 0, 0.8784314, 1, 1,
0.03234885, 2.450003, 1.163184, 0, 0.8745098, 1, 1,
0.03401183, -0.08586856, 2.889512, 0, 0.8666667, 1, 1,
0.037569, -0.5497071, 3.623952, 0, 0.8627451, 1, 1,
0.04008336, -1.09119, 1.64107, 0, 0.854902, 1, 1,
0.04323008, 0.4717096, 1.201885, 0, 0.8509804, 1, 1,
0.0436097, -0.5240601, 3.136349, 0, 0.8431373, 1, 1,
0.04859283, -0.1006142, 2.84547, 0, 0.8392157, 1, 1,
0.05083631, 0.8139125, -0.8813519, 0, 0.8313726, 1, 1,
0.0533283, 0.8122901, 1.025397, 0, 0.827451, 1, 1,
0.05549627, -0.8646611, 2.912998, 0, 0.8196079, 1, 1,
0.05678911, -2.004589, 1.608842, 0, 0.8156863, 1, 1,
0.05756428, 0.3873999, 1.705158, 0, 0.8078431, 1, 1,
0.05959085, -0.4669614, 2.701002, 0, 0.8039216, 1, 1,
0.06049322, 0.9046825, -0.2321471, 0, 0.7960784, 1, 1,
0.06371237, -0.3509807, 3.569615, 0, 0.7882353, 1, 1,
0.06598172, 2.231757, -0.8522638, 0, 0.7843137, 1, 1,
0.06616923, -0.0519016, 2.122538, 0, 0.7764706, 1, 1,
0.07799034, -0.2306818, 4.098294, 0, 0.772549, 1, 1,
0.07910569, -0.06198863, 2.112415, 0, 0.7647059, 1, 1,
0.08013166, -0.9801134, 2.524585, 0, 0.7607843, 1, 1,
0.08106454, 0.9297575, -1.179728, 0, 0.7529412, 1, 1,
0.08107997, 1.999539, 0.1593189, 0, 0.7490196, 1, 1,
0.08112877, 0.4171081, 0.6732026, 0, 0.7411765, 1, 1,
0.08269031, -0.8975619, 2.15902, 0, 0.7372549, 1, 1,
0.08285336, 0.199951, 2.058846, 0, 0.7294118, 1, 1,
0.08338669, -0.07002831, 1.233885, 0, 0.7254902, 1, 1,
0.09103753, -1.012743, 2.091148, 0, 0.7176471, 1, 1,
0.09253383, -0.5822297, 3.633561, 0, 0.7137255, 1, 1,
0.09448184, 0.09915734, 1.35447, 0, 0.7058824, 1, 1,
0.09629504, -0.8854289, 1.527049, 0, 0.6980392, 1, 1,
0.09636027, -0.8131365, 3.606773, 0, 0.6941177, 1, 1,
0.09866218, 1.962642, 1.948064, 0, 0.6862745, 1, 1,
0.1003065, -0.1250763, 2.823005, 0, 0.682353, 1, 1,
0.1004001, 0.7836376, 1.880639, 0, 0.6745098, 1, 1,
0.100643, 0.3296306, -0.9829347, 0, 0.6705883, 1, 1,
0.1047704, 0.05471782, 1.923503, 0, 0.6627451, 1, 1,
0.1164924, 2.103813, -0.4706115, 0, 0.6588235, 1, 1,
0.1192808, 1.589387, 0.2250412, 0, 0.6509804, 1, 1,
0.1195751, -0.4863117, 1.515825, 0, 0.6470588, 1, 1,
0.1212379, 0.6245353, 0.4781918, 0, 0.6392157, 1, 1,
0.1246597, -0.7440386, 2.046569, 0, 0.6352941, 1, 1,
0.130321, -1.297133, 2.839108, 0, 0.627451, 1, 1,
0.1332072, -0.5559161, 1.479223, 0, 0.6235294, 1, 1,
0.135424, 0.2364657, 1.721202, 0, 0.6156863, 1, 1,
0.1376266, 0.8865166, -1.694266, 0, 0.6117647, 1, 1,
0.1380839, -0.3466329, 3.178212, 0, 0.6039216, 1, 1,
0.14054, 0.967943, -0.7052196, 0, 0.5960785, 1, 1,
0.1418803, -0.1508166, 1.608322, 0, 0.5921569, 1, 1,
0.1422811, 1.536188, -0.6678643, 0, 0.5843138, 1, 1,
0.1439148, 0.3053837, 0.2183831, 0, 0.5803922, 1, 1,
0.1477996, -0.5550539, 0.7857459, 0, 0.572549, 1, 1,
0.1482274, -0.127594, 0.4693932, 0, 0.5686275, 1, 1,
0.1494009, -1.434206, 2.217235, 0, 0.5607843, 1, 1,
0.1573541, -0.6087807, 1.972048, 0, 0.5568628, 1, 1,
0.1689696, 0.3955465, 1.600575, 0, 0.5490196, 1, 1,
0.1722592, 0.8920451, 1.011374, 0, 0.5450981, 1, 1,
0.175648, 0.1250075, -0.1491833, 0, 0.5372549, 1, 1,
0.1794766, -0.5038272, 3.004077, 0, 0.5333334, 1, 1,
0.1877206, -1.014569, 3.391351, 0, 0.5254902, 1, 1,
0.1886334, 0.1873886, 1.266498, 0, 0.5215687, 1, 1,
0.1905047, 0.8231835, 1.486526, 0, 0.5137255, 1, 1,
0.1909059, -0.8140733, 4.319713, 0, 0.509804, 1, 1,
0.1912023, -0.02568774, 2.056007, 0, 0.5019608, 1, 1,
0.1913936, -1.787278, 3.162924, 0, 0.4941176, 1, 1,
0.1921225, -1.655027, 2.249974, 0, 0.4901961, 1, 1,
0.1945326, 0.8279276, 0.4722263, 0, 0.4823529, 1, 1,
0.2031527, -0.5150583, 2.99108, 0, 0.4784314, 1, 1,
0.2038571, 0.2078549, 1.758608, 0, 0.4705882, 1, 1,
0.204858, -1.178599, 3.154121, 0, 0.4666667, 1, 1,
0.2107211, 1.283461, 0.3189198, 0, 0.4588235, 1, 1,
0.2126596, 0.4916966, -0.08448096, 0, 0.454902, 1, 1,
0.2136041, 0.5354905, 0.3075089, 0, 0.4470588, 1, 1,
0.2158988, 0.3348086, -0.1368298, 0, 0.4431373, 1, 1,
0.2162499, -1.562163, 3.37355, 0, 0.4352941, 1, 1,
0.2208283, -1.03955, 3.743883, 0, 0.4313726, 1, 1,
0.2219421, 1.739912, -1.396808, 0, 0.4235294, 1, 1,
0.2221394, -0.7611973, 3.252551, 0, 0.4196078, 1, 1,
0.2286201, 0.8761559, 0.1886498, 0, 0.4117647, 1, 1,
0.2344498, 1.7275, 0.2590751, 0, 0.4078431, 1, 1,
0.2363449, 0.3837917, 0.6076407, 0, 0.4, 1, 1,
0.2373819, -0.4890211, 1.967367, 0, 0.3921569, 1, 1,
0.2376745, -1.348472, 3.164047, 0, 0.3882353, 1, 1,
0.2464734, 0.7073309, -3.281684, 0, 0.3803922, 1, 1,
0.2572896, -0.3018943, 2.710665, 0, 0.3764706, 1, 1,
0.2575598, -0.5773235, 3.606817, 0, 0.3686275, 1, 1,
0.25916, -1.20851, 2.825465, 0, 0.3647059, 1, 1,
0.2628052, 0.989701, 1.99482, 0, 0.3568628, 1, 1,
0.2658213, 0.8474709, 1.201853, 0, 0.3529412, 1, 1,
0.2659384, 1.03279, 0.4424309, 0, 0.345098, 1, 1,
0.267113, -0.4286209, 2.792927, 0, 0.3411765, 1, 1,
0.268874, -0.8944662, 3.633789, 0, 0.3333333, 1, 1,
0.275225, 0.09540888, 2.555555, 0, 0.3294118, 1, 1,
0.2761644, 1.689772, 0.784797, 0, 0.3215686, 1, 1,
0.2808448, 1.112438, 1.625279, 0, 0.3176471, 1, 1,
0.2903326, 0.3114037, 1.926857, 0, 0.3098039, 1, 1,
0.2942744, 1.65644, -0.6627697, 0, 0.3058824, 1, 1,
0.2949527, -0.4127085, 2.242686, 0, 0.2980392, 1, 1,
0.2960809, -1.227194, 2.699846, 0, 0.2901961, 1, 1,
0.2977624, -0.9105416, 2.907504, 0, 0.2862745, 1, 1,
0.299517, 0.2836059, 1.249116, 0, 0.2784314, 1, 1,
0.3003098, 1.03451, -0.8160754, 0, 0.2745098, 1, 1,
0.3018385, -2.162216, 3.643878, 0, 0.2666667, 1, 1,
0.3020552, -0.3225184, 3.42884, 0, 0.2627451, 1, 1,
0.3040164, -1.029121, 0.2582987, 0, 0.254902, 1, 1,
0.3099357, -1.243735, 2.09415, 0, 0.2509804, 1, 1,
0.3114947, -1.068836, 2.243611, 0, 0.2431373, 1, 1,
0.3132431, -0.170305, 2.78732, 0, 0.2392157, 1, 1,
0.3149305, -0.440727, 1.662388, 0, 0.2313726, 1, 1,
0.3154284, 2.338512, -0.1365359, 0, 0.227451, 1, 1,
0.3257846, 1.070453, -0.2479188, 0, 0.2196078, 1, 1,
0.3291129, -1.087792, 2.450227, 0, 0.2156863, 1, 1,
0.3342238, 1.325261, 1.436702, 0, 0.2078431, 1, 1,
0.3386062, -0.7183102, 2.798281, 0, 0.2039216, 1, 1,
0.3392405, -0.8282771, 1.879601, 0, 0.1960784, 1, 1,
0.3409284, 0.7964977, -0.5398386, 0, 0.1882353, 1, 1,
0.3455201, -0.2861615, 3.559073, 0, 0.1843137, 1, 1,
0.3462929, -1.070465, 2.946458, 0, 0.1764706, 1, 1,
0.3520424, -2.707113, 2.728398, 0, 0.172549, 1, 1,
0.355738, -1.422823, 3.269928, 0, 0.1647059, 1, 1,
0.3569801, 0.1955955, 1.062366, 0, 0.1607843, 1, 1,
0.3635729, -0.2744776, 2.174783, 0, 0.1529412, 1, 1,
0.3643045, -0.3007703, 1.366194, 0, 0.1490196, 1, 1,
0.3681612, 0.9781141, 0.02257962, 0, 0.1411765, 1, 1,
0.369398, 0.3654024, 0.3128717, 0, 0.1372549, 1, 1,
0.372303, -0.5938419, 1.983341, 0, 0.1294118, 1, 1,
0.3745692, 0.4919787, 1.445123, 0, 0.1254902, 1, 1,
0.3746477, 1.131065, 0.8459517, 0, 0.1176471, 1, 1,
0.3766243, -0.7245086, 3.410492, 0, 0.1137255, 1, 1,
0.3770528, 2.345842, 0.5800573, 0, 0.1058824, 1, 1,
0.3839314, 0.06377073, 1.236107, 0, 0.09803922, 1, 1,
0.3850868, -0.9635994, 3.042541, 0, 0.09411765, 1, 1,
0.3858782, -1.357036, 2.39743, 0, 0.08627451, 1, 1,
0.3874703, 0.2715772, 1.118465, 0, 0.08235294, 1, 1,
0.3895142, -0.3248726, 1.90125, 0, 0.07450981, 1, 1,
0.3910915, 0.9325281, 0.2642554, 0, 0.07058824, 1, 1,
0.3934469, 0.06204886, 0.06093184, 0, 0.0627451, 1, 1,
0.3935402, -1.488668, 2.339221, 0, 0.05882353, 1, 1,
0.3956111, 2.412898, -0.2391572, 0, 0.05098039, 1, 1,
0.3971284, -0.002062048, 1.35147, 0, 0.04705882, 1, 1,
0.3987966, -1.811277, 3.934757, 0, 0.03921569, 1, 1,
0.400252, 0.07868094, 0.4187515, 0, 0.03529412, 1, 1,
0.4078227, -0.5559685, 4.334466, 0, 0.02745098, 1, 1,
0.4106307, 0.9141145, 1.396109, 0, 0.02352941, 1, 1,
0.4129483, 0.1853515, 0.9068125, 0, 0.01568628, 1, 1,
0.4141236, -1.108649, 3.455021, 0, 0.01176471, 1, 1,
0.4168813, -0.8430456, 1.987456, 0, 0.003921569, 1, 1,
0.4174336, 0.6169363, 0.448752, 0.003921569, 0, 1, 1,
0.4202278, -0.3511391, 1.411081, 0.007843138, 0, 1, 1,
0.4216383, 0.2901228, -0.3696499, 0.01568628, 0, 1, 1,
0.4253391, -1.085916, 1.131311, 0.01960784, 0, 1, 1,
0.4256263, -1.262268, 3.185529, 0.02745098, 0, 1, 1,
0.4288474, 0.9114338, 0.9854347, 0.03137255, 0, 1, 1,
0.4369071, 0.7218229, 1.360099, 0.03921569, 0, 1, 1,
0.4372953, 0.1838873, -0.8763993, 0.04313726, 0, 1, 1,
0.4444163, 0.3450706, 0.5280655, 0.05098039, 0, 1, 1,
0.4486708, -0.7379075, 1.848088, 0.05490196, 0, 1, 1,
0.4503832, 0.8038985, 0.5810838, 0.0627451, 0, 1, 1,
0.4525596, 0.379264, -1.48269, 0.06666667, 0, 1, 1,
0.4526583, -1.446348, 2.849446, 0.07450981, 0, 1, 1,
0.4556473, -0.46845, 2.6373, 0.07843138, 0, 1, 1,
0.4559219, -0.05358008, 0.709807, 0.08627451, 0, 1, 1,
0.456846, 0.4108332, 0.3239933, 0.09019608, 0, 1, 1,
0.4592898, 0.9144332, 2.194943, 0.09803922, 0, 1, 1,
0.4613931, -1.076401, 1.804937, 0.1058824, 0, 1, 1,
0.464261, -1.162439, 1.472555, 0.1098039, 0, 1, 1,
0.4650348, 0.3820468, 0.8945923, 0.1176471, 0, 1, 1,
0.467864, 0.2993519, 0.3555241, 0.1215686, 0, 1, 1,
0.4682021, 0.225545, 1.885159, 0.1294118, 0, 1, 1,
0.4697407, 2.352504, 0.7147139, 0.1333333, 0, 1, 1,
0.4707114, -0.1374823, 2.651233, 0.1411765, 0, 1, 1,
0.4723648, 1.375199, 1.723069, 0.145098, 0, 1, 1,
0.4726014, -0.842787, 2.726025, 0.1529412, 0, 1, 1,
0.4859261, -0.2335103, 2.907192, 0.1568628, 0, 1, 1,
0.486843, 1.912438, 0.7438652, 0.1647059, 0, 1, 1,
0.4881215, 0.08886664, 1.37883, 0.1686275, 0, 1, 1,
0.4951723, 2.107753, 0.02488209, 0.1764706, 0, 1, 1,
0.498663, 0.7489455, 0.920164, 0.1803922, 0, 1, 1,
0.504909, 0.2391677, 0.6885238, 0.1882353, 0, 1, 1,
0.5050542, -0.5462908, 0.435739, 0.1921569, 0, 1, 1,
0.5054268, 0.2548154, 2.174691, 0.2, 0, 1, 1,
0.5054394, 1.537546, 0.8991824, 0.2078431, 0, 1, 1,
0.5059854, 0.5398018, 2.969595, 0.2117647, 0, 1, 1,
0.5077769, -0.0007218156, 1.813443, 0.2196078, 0, 1, 1,
0.5084025, -0.4194742, 1.061017, 0.2235294, 0, 1, 1,
0.5137216, 1.707869, 0.785221, 0.2313726, 0, 1, 1,
0.5179261, 0.1740899, 0.1187738, 0.2352941, 0, 1, 1,
0.5235265, -0.4267304, 1.489705, 0.2431373, 0, 1, 1,
0.5268574, -0.7916886, 3.710879, 0.2470588, 0, 1, 1,
0.5269463, 0.4971701, 1.107408, 0.254902, 0, 1, 1,
0.533408, 1.650761, 0.1224585, 0.2588235, 0, 1, 1,
0.5370833, -0.4923163, 2.002837, 0.2666667, 0, 1, 1,
0.5414611, 0.3257131, 0.7861923, 0.2705882, 0, 1, 1,
0.5543253, 1.300757, 0.8689537, 0.2784314, 0, 1, 1,
0.555451, -0.4441253, 1.205766, 0.282353, 0, 1, 1,
0.5603469, 0.1514531, 1.169651, 0.2901961, 0, 1, 1,
0.5646989, -0.8998947, 1.586273, 0.2941177, 0, 1, 1,
0.5661075, -0.9807259, 0.7613796, 0.3019608, 0, 1, 1,
0.567585, 0.5989196, 0.9786834, 0.3098039, 0, 1, 1,
0.5686239, 1.710696, 0.2469022, 0.3137255, 0, 1, 1,
0.5707943, -0.2821678, 2.104149, 0.3215686, 0, 1, 1,
0.5751228, 1.671812, 0.3267897, 0.3254902, 0, 1, 1,
0.5775313, -0.7088178, 1.189801, 0.3333333, 0, 1, 1,
0.5829819, -0.3905225, 3.301907, 0.3372549, 0, 1, 1,
0.5841112, 1.169447, 0.3819828, 0.345098, 0, 1, 1,
0.5842205, 1.084749, 2.484448, 0.3490196, 0, 1, 1,
0.5848715, -0.8043332, 2.319712, 0.3568628, 0, 1, 1,
0.5889305, -0.7864214, 1.467444, 0.3607843, 0, 1, 1,
0.5895165, 0.1101492, 2.055393, 0.3686275, 0, 1, 1,
0.5943216, -1.043623, 1.924585, 0.372549, 0, 1, 1,
0.5963828, -0.1370437, 0.6832289, 0.3803922, 0, 1, 1,
0.5965835, -0.1102253, 1.269057, 0.3843137, 0, 1, 1,
0.59995, 0.03288143, 1.559198, 0.3921569, 0, 1, 1,
0.6142164, -2.109921, 4.49272, 0.3960784, 0, 1, 1,
0.6142351, 0.6643303, -0.4064971, 0.4039216, 0, 1, 1,
0.6255284, -1.082355, 2.890679, 0.4117647, 0, 1, 1,
0.626567, -2.123832, 1.926786, 0.4156863, 0, 1, 1,
0.6283411, -1.810688, 1.228499, 0.4235294, 0, 1, 1,
0.6314276, -0.888213, 2.141435, 0.427451, 0, 1, 1,
0.631758, -0.665927, 2.858761, 0.4352941, 0, 1, 1,
0.6318644, 0.4718608, 1.438344, 0.4392157, 0, 1, 1,
0.6322935, 0.7038311, 2.130997, 0.4470588, 0, 1, 1,
0.6346983, 0.6313644, 1.250255, 0.4509804, 0, 1, 1,
0.6363283, 1.254251, -0.2302479, 0.4588235, 0, 1, 1,
0.6379327, 0.8980948, -0.460553, 0.4627451, 0, 1, 1,
0.6436257, -1.050979, 4.512517, 0.4705882, 0, 1, 1,
0.6486841, -0.5746383, 4.040086, 0.4745098, 0, 1, 1,
0.6487057, -0.5305849, 2.61684, 0.4823529, 0, 1, 1,
0.649259, 0.8408051, 1.071758, 0.4862745, 0, 1, 1,
0.6493228, -0.467559, 2.093454, 0.4941176, 0, 1, 1,
0.6563698, 2.43549, -1.369692, 0.5019608, 0, 1, 1,
0.6593724, -0.1986999, 1.652438, 0.5058824, 0, 1, 1,
0.6613427, 2.067345, 0.3377781, 0.5137255, 0, 1, 1,
0.6630781, -0.2825747, 1.870669, 0.5176471, 0, 1, 1,
0.6648228, -2.106476, 3.557266, 0.5254902, 0, 1, 1,
0.6656693, 0.6602357, 0.997507, 0.5294118, 0, 1, 1,
0.6704983, -0.05795459, 0.7162639, 0.5372549, 0, 1, 1,
0.6705418, 1.215501, 1.984803, 0.5411765, 0, 1, 1,
0.6722162, -0.8411402, 2.593448, 0.5490196, 0, 1, 1,
0.6791604, -0.2251658, 1.735164, 0.5529412, 0, 1, 1,
0.6791994, -0.0794448, 1.539319, 0.5607843, 0, 1, 1,
0.6804352, 1.527795, -0.4828063, 0.5647059, 0, 1, 1,
0.686259, 0.5645754, 1.925862, 0.572549, 0, 1, 1,
0.6891605, -1.467021, 2.268557, 0.5764706, 0, 1, 1,
0.6934991, 1.415789, 1.161243, 0.5843138, 0, 1, 1,
0.6990587, 1.502335, -0.06263746, 0.5882353, 0, 1, 1,
0.6996149, -1.101891, 0.7880438, 0.5960785, 0, 1, 1,
0.6997875, 1.549837, -1.074633, 0.6039216, 0, 1, 1,
0.700098, -0.8532681, 2.032869, 0.6078432, 0, 1, 1,
0.7002552, 0.8637896, 1.035297, 0.6156863, 0, 1, 1,
0.7097353, -0.8858075, 2.895292, 0.6196079, 0, 1, 1,
0.7225583, 0.7344778, -0.4479699, 0.627451, 0, 1, 1,
0.7268159, 0.0120034, 2.659577, 0.6313726, 0, 1, 1,
0.7334044, 1.722396, 0.54915, 0.6392157, 0, 1, 1,
0.735483, 1.057016, 0.9162158, 0.6431373, 0, 1, 1,
0.7369892, 0.4985553, 2.556628, 0.6509804, 0, 1, 1,
0.7387505, -0.6127389, 3.147912, 0.654902, 0, 1, 1,
0.7396694, -0.01979827, 2.561964, 0.6627451, 0, 1, 1,
0.7399318, 0.09171481, 1.405117, 0.6666667, 0, 1, 1,
0.7402761, 0.8071474, -1.243671, 0.6745098, 0, 1, 1,
0.7425847, -0.8476824, 2.937946, 0.6784314, 0, 1, 1,
0.7457832, -0.1347037, 1.000468, 0.6862745, 0, 1, 1,
0.748167, 0.8244518, 1.82485, 0.6901961, 0, 1, 1,
0.7502271, 1.293492, -1.146163, 0.6980392, 0, 1, 1,
0.7510642, 1.735045, -0.9503993, 0.7058824, 0, 1, 1,
0.7529106, -0.4659356, 2.02463, 0.7098039, 0, 1, 1,
0.7548165, 0.9516822, 0.6211308, 0.7176471, 0, 1, 1,
0.7654362, 0.5988646, 1.378437, 0.7215686, 0, 1, 1,
0.7666945, -1.28279, 2.369388, 0.7294118, 0, 1, 1,
0.7726026, 0.264161, 1.842515, 0.7333333, 0, 1, 1,
0.7740048, -0.8145909, 2.550558, 0.7411765, 0, 1, 1,
0.7842404, -0.4217213, 3.980958, 0.7450981, 0, 1, 1,
0.7910368, 1.001185, -0.2862376, 0.7529412, 0, 1, 1,
0.7929591, -0.1063903, 2.336015, 0.7568628, 0, 1, 1,
0.7932401, 1.431402, 1.33446, 0.7647059, 0, 1, 1,
0.7974573, -0.02820268, 2.122793, 0.7686275, 0, 1, 1,
0.8022353, -0.6870071, 1.237349, 0.7764706, 0, 1, 1,
0.802424, -1.903358, 2.042835, 0.7803922, 0, 1, 1,
0.8090327, -1.008316, 3.516235, 0.7882353, 0, 1, 1,
0.8102006, 0.9060332, 2.236659, 0.7921569, 0, 1, 1,
0.8104588, 0.7796352, 1.775555, 0.8, 0, 1, 1,
0.8105069, -1.433327, 1.975349, 0.8078431, 0, 1, 1,
0.8127018, -0.02766678, 3.113948, 0.8117647, 0, 1, 1,
0.8162413, 1.218835, 0.4491773, 0.8196079, 0, 1, 1,
0.8172668, -0.3429756, 1.716123, 0.8235294, 0, 1, 1,
0.8181517, -0.2193242, 2.732096, 0.8313726, 0, 1, 1,
0.8219608, 0.2197213, 2.096645, 0.8352941, 0, 1, 1,
0.8222964, -1.693703, 3.867548, 0.8431373, 0, 1, 1,
0.8245603, -0.8099957, 2.207733, 0.8470588, 0, 1, 1,
0.8264362, -2.06228, 4.760312, 0.854902, 0, 1, 1,
0.8280219, 0.4124075, 0.9968928, 0.8588235, 0, 1, 1,
0.8282483, -0.180932, 2.025417, 0.8666667, 0, 1, 1,
0.8304962, -0.506626, 3.53026, 0.8705882, 0, 1, 1,
0.8315759, -0.4530288, 4.37284, 0.8784314, 0, 1, 1,
0.8348423, -0.8865559, 4.00665, 0.8823529, 0, 1, 1,
0.8434386, 0.2066649, -0.03813311, 0.8901961, 0, 1, 1,
0.8498244, 0.5196131, 0.5454764, 0.8941177, 0, 1, 1,
0.8498899, -0.07203814, 2.778284, 0.9019608, 0, 1, 1,
0.854924, 0.05109401, 2.507725, 0.9098039, 0, 1, 1,
0.8569869, 0.04346443, -0.5047057, 0.9137255, 0, 1, 1,
0.8597459, -0.08704464, 1.166548, 0.9215686, 0, 1, 1,
0.8608218, -0.3297772, 3.656033, 0.9254902, 0, 1, 1,
0.8639904, 1.888299, 0.1641465, 0.9333333, 0, 1, 1,
0.8666587, -0.6873947, 1.801568, 0.9372549, 0, 1, 1,
0.8678312, -1.090262, 3.782903, 0.945098, 0, 1, 1,
0.8699395, -1.740986, 0.615764, 0.9490196, 0, 1, 1,
0.8706421, -0.5654665, 3.565327, 0.9568627, 0, 1, 1,
0.8765618, 0.3087957, 3.32088, 0.9607843, 0, 1, 1,
0.8784061, 0.8659788, 0.5780417, 0.9686275, 0, 1, 1,
0.8825733, -0.8999169, 2.796535, 0.972549, 0, 1, 1,
0.8854856, 0.9527915, 1.403328, 0.9803922, 0, 1, 1,
0.8914561, 0.7140988, 0.2952525, 0.9843137, 0, 1, 1,
0.8984566, -0.204991, 2.435791, 0.9921569, 0, 1, 1,
0.9035028, 0.6133259, 0.4351082, 0.9960784, 0, 1, 1,
0.9113182, -1.459874, 2.030186, 1, 0, 0.9960784, 1,
0.9132793, 1.706574, 1.610795, 1, 0, 0.9882353, 1,
0.9142507, -0.5962723, 1.361115, 1, 0, 0.9843137, 1,
0.9167461, 0.4291376, 0.8263422, 1, 0, 0.9764706, 1,
0.9201742, 1.028945, -0.4777071, 1, 0, 0.972549, 1,
0.9252635, 2.186175, 0.4183503, 1, 0, 0.9647059, 1,
0.9259499, 2.82409, -0.1514858, 1, 0, 0.9607843, 1,
0.930265, -0.9329234, 1.861164, 1, 0, 0.9529412, 1,
0.9309931, 0.8455638, 1.716688, 1, 0, 0.9490196, 1,
0.9354112, 0.3991158, 1.492963, 1, 0, 0.9411765, 1,
0.9361921, -0.2627954, 1.967979, 1, 0, 0.9372549, 1,
0.936435, 1.077106, 0.5309153, 1, 0, 0.9294118, 1,
0.9384159, -0.2069552, 3.310065, 1, 0, 0.9254902, 1,
0.9387065, 1.380341, 0.6317074, 1, 0, 0.9176471, 1,
0.9464192, -0.332332, 4.21148, 1, 0, 0.9137255, 1,
0.9478341, 2.649243, 0.5746737, 1, 0, 0.9058824, 1,
0.9603485, 0.4329324, 2.915424, 1, 0, 0.9019608, 1,
0.9633461, 0.1139089, 0.8538795, 1, 0, 0.8941177, 1,
0.9701396, -0.2176491, 2.317786, 1, 0, 0.8862745, 1,
0.9707061, 0.7788606, 1.388312, 1, 0, 0.8823529, 1,
0.9717613, -0.6084241, 3.532936, 1, 0, 0.8745098, 1,
0.973489, 1.798253, 1.327188, 1, 0, 0.8705882, 1,
0.976841, 0.1301179, 1.696689, 1, 0, 0.8627451, 1,
0.9773984, -0.8205917, 3.620309, 1, 0, 0.8588235, 1,
0.9808449, 1.358004, 0.9900636, 1, 0, 0.8509804, 1,
0.9808717, 0.2094993, -1.225098, 1, 0, 0.8470588, 1,
0.9852638, -1.78507, 5.584946, 1, 0, 0.8392157, 1,
0.9886054, 0.1880667, 0.991238, 1, 0, 0.8352941, 1,
0.98879, 0.8636857, 2.055478, 1, 0, 0.827451, 1,
0.9910475, 0.3231485, 2.408136, 1, 0, 0.8235294, 1,
0.995224, 0.1682172, 2.106292, 1, 0, 0.8156863, 1,
0.9979597, -0.3640291, 3.09612, 1, 0, 0.8117647, 1,
0.9986184, -0.213189, 2.26491, 1, 0, 0.8039216, 1,
0.9986821, 1.38689, -0.4652998, 1, 0, 0.7960784, 1,
1.003675, 0.4535234, 0.3386601, 1, 0, 0.7921569, 1,
1.006682, -0.3149585, 2.509689, 1, 0, 0.7843137, 1,
1.007805, -0.7830293, 3.633154, 1, 0, 0.7803922, 1,
1.013328, 0.8858653, 0.3434341, 1, 0, 0.772549, 1,
1.025261, 0.8954113, -0.0953633, 1, 0, 0.7686275, 1,
1.026308, -0.9809412, 1.57553, 1, 0, 0.7607843, 1,
1.030839, -0.716627, 2.573425, 1, 0, 0.7568628, 1,
1.039686, -0.5454255, 2.188999, 1, 0, 0.7490196, 1,
1.046955, -0.6877517, 1.876595, 1, 0, 0.7450981, 1,
1.048053, 0.6614442, 1.229371, 1, 0, 0.7372549, 1,
1.064153, -0.402261, -0.3931082, 1, 0, 0.7333333, 1,
1.064844, -0.2885502, 3.565214, 1, 0, 0.7254902, 1,
1.067361, 0.4871831, 1.814098, 1, 0, 0.7215686, 1,
1.068986, 0.7165693, 0.7210306, 1, 0, 0.7137255, 1,
1.070037, -1.534523, 2.493156, 1, 0, 0.7098039, 1,
1.074552, -0.4706284, 1.932793, 1, 0, 0.7019608, 1,
1.076328, -0.1087251, 1.383582, 1, 0, 0.6941177, 1,
1.078852, -0.8210444, 2.586544, 1, 0, 0.6901961, 1,
1.091953, -1.794887, 2.768275, 1, 0, 0.682353, 1,
1.091972, 0.1890161, 2.461843, 1, 0, 0.6784314, 1,
1.097011, 0.3211937, 1.152582, 1, 0, 0.6705883, 1,
1.10527, 1.260659, 1.894102, 1, 0, 0.6666667, 1,
1.1183, 0.1903516, 1.360672, 1, 0, 0.6588235, 1,
1.129964, -1.508092, 3.169673, 1, 0, 0.654902, 1,
1.130331, 0.3867574, 2.763445, 1, 0, 0.6470588, 1,
1.141774, -1.048415, 4.111567, 1, 0, 0.6431373, 1,
1.147805, -0.3576163, 2.359656, 1, 0, 0.6352941, 1,
1.15071, -0.01104868, 1.895647, 1, 0, 0.6313726, 1,
1.151407, -1.227959, 3.605031, 1, 0, 0.6235294, 1,
1.153507, -1.95018, 3.529621, 1, 0, 0.6196079, 1,
1.156321, 0.6492094, 1.628808, 1, 0, 0.6117647, 1,
1.161807, 0.5949979, 1.151814, 1, 0, 0.6078432, 1,
1.173523, -0.2835651, 1.268581, 1, 0, 0.6, 1,
1.177365, 1.768594, -0.6846354, 1, 0, 0.5921569, 1,
1.185437, -0.02848546, 0.878229, 1, 0, 0.5882353, 1,
1.186354, -1.310786, 3.408814, 1, 0, 0.5803922, 1,
1.192396, 1.349122, 0.4840758, 1, 0, 0.5764706, 1,
1.205132, -0.3087434, 0.9612394, 1, 0, 0.5686275, 1,
1.219567, -0.5936482, 2.76436, 1, 0, 0.5647059, 1,
1.219648, -0.04701092, 3.66381, 1, 0, 0.5568628, 1,
1.219812, 0.9520784, 1.118138, 1, 0, 0.5529412, 1,
1.221553, 1.265739, 0.69274, 1, 0, 0.5450981, 1,
1.230374, -0.5809186, 1.959293, 1, 0, 0.5411765, 1,
1.250752, 0.7866632, 0.6672314, 1, 0, 0.5333334, 1,
1.255308, 2.131793, -1.842386, 1, 0, 0.5294118, 1,
1.260076, 1.325886, -0.7340361, 1, 0, 0.5215687, 1,
1.262784, 0.6530222, 0.8995614, 1, 0, 0.5176471, 1,
1.262882, -0.2764584, 4.129755, 1, 0, 0.509804, 1,
1.269487, -0.3061048, 1.762915, 1, 0, 0.5058824, 1,
1.273216, 1.022697, 1.205667, 1, 0, 0.4980392, 1,
1.275981, -0.6371222, 2.97247, 1, 0, 0.4901961, 1,
1.277102, 0.2893595, 2.952766, 1, 0, 0.4862745, 1,
1.279084, 0.4143944, 0.2875555, 1, 0, 0.4784314, 1,
1.300694, -1.531574, 1.110305, 1, 0, 0.4745098, 1,
1.302409, 1.306644, 1.172765, 1, 0, 0.4666667, 1,
1.30753, 1.923084, -1.540638, 1, 0, 0.4627451, 1,
1.30866, -0.4215796, 2.681928, 1, 0, 0.454902, 1,
1.323099, -0.1774825, 1.121559, 1, 0, 0.4509804, 1,
1.332555, 1.661022, 1.298162, 1, 0, 0.4431373, 1,
1.33511, -0.545839, 2.01422, 1, 0, 0.4392157, 1,
1.342564, -0.5262137, 2.519183, 1, 0, 0.4313726, 1,
1.35373, 1.158561, 1.791962, 1, 0, 0.427451, 1,
1.365211, 1.915624, -0.4322081, 1, 0, 0.4196078, 1,
1.371286, -0.5786027, 3.198832, 1, 0, 0.4156863, 1,
1.389005, -0.1118175, 1.495711, 1, 0, 0.4078431, 1,
1.395562, -0.09612907, 1.837064, 1, 0, 0.4039216, 1,
1.419652, 0.04383142, 1.758221, 1, 0, 0.3960784, 1,
1.424471, 0.08394417, 1.432813, 1, 0, 0.3882353, 1,
1.426068, -1.015738, 2.106146, 1, 0, 0.3843137, 1,
1.444882, -0.8781459, 1.987195, 1, 0, 0.3764706, 1,
1.445526, -1.644504, 2.028105, 1, 0, 0.372549, 1,
1.448906, -1.984469, 2.859346, 1, 0, 0.3647059, 1,
1.452822, -0.8004861, 0.4633502, 1, 0, 0.3607843, 1,
1.45437, 2.120264, 0.4751757, 1, 0, 0.3529412, 1,
1.46909, 0.8297678, -0.7330108, 1, 0, 0.3490196, 1,
1.472428, -0.3140037, 2.411874, 1, 0, 0.3411765, 1,
1.477538, -1.659, 3.437347, 1, 0, 0.3372549, 1,
1.50983, -0.9278159, 3.244456, 1, 0, 0.3294118, 1,
1.511776, -2.026182, 1.511972, 1, 0, 0.3254902, 1,
1.515922, 0.8927891, -0.1239142, 1, 0, 0.3176471, 1,
1.523558, 1.281288, 1.354055, 1, 0, 0.3137255, 1,
1.531536, -0.7570518, 0.9264404, 1, 0, 0.3058824, 1,
1.550274, 0.9994789, 1.708478, 1, 0, 0.2980392, 1,
1.560562, -1.110225, 1.570407, 1, 0, 0.2941177, 1,
1.566718, -0.1702224, 1.415103, 1, 0, 0.2862745, 1,
1.591625, 0.140362, 2.270743, 1, 0, 0.282353, 1,
1.592486, 2.226586, 2.01571, 1, 0, 0.2745098, 1,
1.602071, 1.365282, 1.725363, 1, 0, 0.2705882, 1,
1.604578, -0.6961652, 1.044796, 1, 0, 0.2627451, 1,
1.60765, -0.5085859, 1.476486, 1, 0, 0.2588235, 1,
1.623354, 1.255769, -1.805442, 1, 0, 0.2509804, 1,
1.656858, 0.7710968, 0.8392032, 1, 0, 0.2470588, 1,
1.662095, 0.6818692, -0.5451441, 1, 0, 0.2392157, 1,
1.676102, -0.2516195, 2.187412, 1, 0, 0.2352941, 1,
1.686455, 0.9513367, 0.3315369, 1, 0, 0.227451, 1,
1.688998, 1.739642, -0.2366086, 1, 0, 0.2235294, 1,
1.698304, 0.4795274, 0.5217434, 1, 0, 0.2156863, 1,
1.705531, -0.8741624, 0.2705551, 1, 0, 0.2117647, 1,
1.710634, -1.124457, 2.219308, 1, 0, 0.2039216, 1,
1.71397, 0.009001934, 2.612309, 1, 0, 0.1960784, 1,
1.768695, 1.217987, 1.941122, 1, 0, 0.1921569, 1,
1.80164, -0.09473985, 1.740547, 1, 0, 0.1843137, 1,
1.80448, -1.06242, 3.799549, 1, 0, 0.1803922, 1,
1.834674, -0.02696846, 0.5346907, 1, 0, 0.172549, 1,
1.840991, -0.4160833, 2.682503, 1, 0, 0.1686275, 1,
1.851514, -0.0624802, 2.044394, 1, 0, 0.1607843, 1,
1.86926, -0.4608632, 1.125649, 1, 0, 0.1568628, 1,
1.881216, -1.492658, 2.219288, 1, 0, 0.1490196, 1,
1.928709, -1.033068, 2.0069, 1, 0, 0.145098, 1,
1.985155, -1.88813, 3.951538, 1, 0, 0.1372549, 1,
2.003143, -1.184077, 3.239351, 1, 0, 0.1333333, 1,
2.008457, -2.384729, 1.504489, 1, 0, 0.1254902, 1,
2.041168, -0.07420283, 2.575263, 1, 0, 0.1215686, 1,
2.062641, -0.3217266, 0.2871766, 1, 0, 0.1137255, 1,
2.063263, -0.242581, -0.1601338, 1, 0, 0.1098039, 1,
2.136238, -0.8854533, 2.593184, 1, 0, 0.1019608, 1,
2.152957, -0.09991958, 2.122847, 1, 0, 0.09411765, 1,
2.194316, -0.04528059, 1.495009, 1, 0, 0.09019608, 1,
2.203654, -0.6629347, 1.355917, 1, 0, 0.08235294, 1,
2.216682, -0.1934578, 1.987782, 1, 0, 0.07843138, 1,
2.316352, -0.6589385, 2.008689, 1, 0, 0.07058824, 1,
2.335662, 0.6529518, 2.480723, 1, 0, 0.06666667, 1,
2.345818, -0.3949449, 3.320251, 1, 0, 0.05882353, 1,
2.397013, 0.6177184, 2.309179, 1, 0, 0.05490196, 1,
2.422342, 0.8233463, 2.162338, 1, 0, 0.04705882, 1,
2.484382, 0.0490404, 1.089695, 1, 0, 0.04313726, 1,
2.565812, 1.004121, 0.8220918, 1, 0, 0.03529412, 1,
2.6011, -0.5919972, 2.337659, 1, 0, 0.03137255, 1,
2.738347, -1.997481, 1.38703, 1, 0, 0.02352941, 1,
2.74832, 0.2507728, 2.603452, 1, 0, 0.01960784, 1,
2.816387, 1.004838, 0.9189744, 1, 0, 0.01176471, 1,
3.019724, 2.875051, 0.691068, 1, 0, 0.007843138, 1
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
-0.1839306, -3.791372, -8.769984, 0, -0.5, 0.5, 0.5,
-0.1839306, -3.791372, -8.769984, 1, -0.5, 0.5, 0.5,
-0.1839306, -3.791372, -8.769984, 1, 1.5, 0.5, 0.5,
-0.1839306, -3.791372, -8.769984, 0, 1.5, 0.5, 0.5
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
-4.473624, 0.02493429, -8.769984, 0, -0.5, 0.5, 0.5,
-4.473624, 0.02493429, -8.769984, 1, -0.5, 0.5, 0.5,
-4.473624, 0.02493429, -8.769984, 1, 1.5, 0.5, 0.5,
-4.473624, 0.02493429, -8.769984, 0, 1.5, 0.5, 0.5
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
-4.473624, -3.791372, -0.5522623, 0, -0.5, 0.5, 0.5,
-4.473624, -3.791372, -0.5522623, 1, -0.5, 0.5, 0.5,
-4.473624, -3.791372, -0.5522623, 1, 1.5, 0.5, 0.5,
-4.473624, -3.791372, -0.5522623, 0, 1.5, 0.5, 0.5
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
-3, -2.910686, -6.873587,
3, -2.910686, -6.873587,
-3, -2.910686, -6.873587,
-3, -3.057467, -7.189653,
-2, -2.910686, -6.873587,
-2, -3.057467, -7.189653,
-1, -2.910686, -6.873587,
-1, -3.057467, -7.189653,
0, -2.910686, -6.873587,
0, -3.057467, -7.189653,
1, -2.910686, -6.873587,
1, -3.057467, -7.189653,
2, -2.910686, -6.873587,
2, -3.057467, -7.189653,
3, -2.910686, -6.873587,
3, -3.057467, -7.189653
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
-3, -3.351029, -7.821786, 0, -0.5, 0.5, 0.5,
-3, -3.351029, -7.821786, 1, -0.5, 0.5, 0.5,
-3, -3.351029, -7.821786, 1, 1.5, 0.5, 0.5,
-3, -3.351029, -7.821786, 0, 1.5, 0.5, 0.5,
-2, -3.351029, -7.821786, 0, -0.5, 0.5, 0.5,
-2, -3.351029, -7.821786, 1, -0.5, 0.5, 0.5,
-2, -3.351029, -7.821786, 1, 1.5, 0.5, 0.5,
-2, -3.351029, -7.821786, 0, 1.5, 0.5, 0.5,
-1, -3.351029, -7.821786, 0, -0.5, 0.5, 0.5,
-1, -3.351029, -7.821786, 1, -0.5, 0.5, 0.5,
-1, -3.351029, -7.821786, 1, 1.5, 0.5, 0.5,
-1, -3.351029, -7.821786, 0, 1.5, 0.5, 0.5,
0, -3.351029, -7.821786, 0, -0.5, 0.5, 0.5,
0, -3.351029, -7.821786, 1, -0.5, 0.5, 0.5,
0, -3.351029, -7.821786, 1, 1.5, 0.5, 0.5,
0, -3.351029, -7.821786, 0, 1.5, 0.5, 0.5,
1, -3.351029, -7.821786, 0, -0.5, 0.5, 0.5,
1, -3.351029, -7.821786, 1, -0.5, 0.5, 0.5,
1, -3.351029, -7.821786, 1, 1.5, 0.5, 0.5,
1, -3.351029, -7.821786, 0, 1.5, 0.5, 0.5,
2, -3.351029, -7.821786, 0, -0.5, 0.5, 0.5,
2, -3.351029, -7.821786, 1, -0.5, 0.5, 0.5,
2, -3.351029, -7.821786, 1, 1.5, 0.5, 0.5,
2, -3.351029, -7.821786, 0, 1.5, 0.5, 0.5,
3, -3.351029, -7.821786, 0, -0.5, 0.5, 0.5,
3, -3.351029, -7.821786, 1, -0.5, 0.5, 0.5,
3, -3.351029, -7.821786, 1, 1.5, 0.5, 0.5,
3, -3.351029, -7.821786, 0, 1.5, 0.5, 0.5
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
-3.483695, -2, -6.873587,
-3.483695, 2, -6.873587,
-3.483695, -2, -6.873587,
-3.648683, -2, -7.189653,
-3.483695, -1, -6.873587,
-3.648683, -1, -7.189653,
-3.483695, 0, -6.873587,
-3.648683, 0, -7.189653,
-3.483695, 1, -6.873587,
-3.648683, 1, -7.189653,
-3.483695, 2, -6.873587,
-3.648683, 2, -7.189653
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
-3.97866, -2, -7.821786, 0, -0.5, 0.5, 0.5,
-3.97866, -2, -7.821786, 1, -0.5, 0.5, 0.5,
-3.97866, -2, -7.821786, 1, 1.5, 0.5, 0.5,
-3.97866, -2, -7.821786, 0, 1.5, 0.5, 0.5,
-3.97866, -1, -7.821786, 0, -0.5, 0.5, 0.5,
-3.97866, -1, -7.821786, 1, -0.5, 0.5, 0.5,
-3.97866, -1, -7.821786, 1, 1.5, 0.5, 0.5,
-3.97866, -1, -7.821786, 0, 1.5, 0.5, 0.5,
-3.97866, 0, -7.821786, 0, -0.5, 0.5, 0.5,
-3.97866, 0, -7.821786, 1, -0.5, 0.5, 0.5,
-3.97866, 0, -7.821786, 1, 1.5, 0.5, 0.5,
-3.97866, 0, -7.821786, 0, 1.5, 0.5, 0.5,
-3.97866, 1, -7.821786, 0, -0.5, 0.5, 0.5,
-3.97866, 1, -7.821786, 1, -0.5, 0.5, 0.5,
-3.97866, 1, -7.821786, 1, 1.5, 0.5, 0.5,
-3.97866, 1, -7.821786, 0, 1.5, 0.5, 0.5,
-3.97866, 2, -7.821786, 0, -0.5, 0.5, 0.5,
-3.97866, 2, -7.821786, 1, -0.5, 0.5, 0.5,
-3.97866, 2, -7.821786, 1, 1.5, 0.5, 0.5,
-3.97866, 2, -7.821786, 0, 1.5, 0.5, 0.5
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
-3.483695, -2.910686, -6,
-3.483695, -2.910686, 4,
-3.483695, -2.910686, -6,
-3.648683, -3.057467, -6,
-3.483695, -2.910686, -4,
-3.648683, -3.057467, -4,
-3.483695, -2.910686, -2,
-3.648683, -3.057467, -2,
-3.483695, -2.910686, 0,
-3.648683, -3.057467, 0,
-3.483695, -2.910686, 2,
-3.648683, -3.057467, 2,
-3.483695, -2.910686, 4,
-3.648683, -3.057467, 4
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
"-6",
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
-3.97866, -3.351029, -6, 0, -0.5, 0.5, 0.5,
-3.97866, -3.351029, -6, 1, -0.5, 0.5, 0.5,
-3.97866, -3.351029, -6, 1, 1.5, 0.5, 0.5,
-3.97866, -3.351029, -6, 0, 1.5, 0.5, 0.5,
-3.97866, -3.351029, -4, 0, -0.5, 0.5, 0.5,
-3.97866, -3.351029, -4, 1, -0.5, 0.5, 0.5,
-3.97866, -3.351029, -4, 1, 1.5, 0.5, 0.5,
-3.97866, -3.351029, -4, 0, 1.5, 0.5, 0.5,
-3.97866, -3.351029, -2, 0, -0.5, 0.5, 0.5,
-3.97866, -3.351029, -2, 1, -0.5, 0.5, 0.5,
-3.97866, -3.351029, -2, 1, 1.5, 0.5, 0.5,
-3.97866, -3.351029, -2, 0, 1.5, 0.5, 0.5,
-3.97866, -3.351029, 0, 0, -0.5, 0.5, 0.5,
-3.97866, -3.351029, 0, 1, -0.5, 0.5, 0.5,
-3.97866, -3.351029, 0, 1, 1.5, 0.5, 0.5,
-3.97866, -3.351029, 0, 0, 1.5, 0.5, 0.5,
-3.97866, -3.351029, 2, 0, -0.5, 0.5, 0.5,
-3.97866, -3.351029, 2, 1, -0.5, 0.5, 0.5,
-3.97866, -3.351029, 2, 1, 1.5, 0.5, 0.5,
-3.97866, -3.351029, 2, 0, 1.5, 0.5, 0.5,
-3.97866, -3.351029, 4, 0, -0.5, 0.5, 0.5,
-3.97866, -3.351029, 4, 1, -0.5, 0.5, 0.5,
-3.97866, -3.351029, 4, 1, 1.5, 0.5, 0.5,
-3.97866, -3.351029, 4, 0, 1.5, 0.5, 0.5
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
-3.483695, -2.910686, -6.873587,
-3.483695, 2.960554, -6.873587,
-3.483695, -2.910686, 5.769063,
-3.483695, 2.960554, 5.769063,
-3.483695, -2.910686, -6.873587,
-3.483695, -2.910686, 5.769063,
-3.483695, 2.960554, -6.873587,
-3.483695, 2.960554, 5.769063,
-3.483695, -2.910686, -6.873587,
3.115834, -2.910686, -6.873587,
-3.483695, -2.910686, 5.769063,
3.115834, -2.910686, 5.769063,
-3.483695, 2.960554, -6.873587,
3.115834, 2.960554, -6.873587,
-3.483695, 2.960554, 5.769063,
3.115834, 2.960554, 5.769063,
3.115834, -2.910686, -6.873587,
3.115834, 2.960554, -6.873587,
3.115834, -2.910686, 5.769063,
3.115834, 2.960554, 5.769063,
3.115834, -2.910686, -6.873587,
3.115834, -2.910686, 5.769063,
3.115834, 2.960554, -6.873587,
3.115834, 2.960554, 5.769063
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
var radius = 8.235459;
var distance = 36.64049;
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
mvMatrix.translate( 0.1839306, -0.02493429, 0.5522623 );
mvMatrix.scale( 1.349239, 1.516603, 0.7043096 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.64049);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
phthalamic_acid<-read.table("phthalamic_acid.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-phthalamic_acid$V2
```

```
## Error in eval(expr, envir, enclos): object 'phthalamic_acid' not found
```

```r
y<-phthalamic_acid$V3
```

```
## Error in eval(expr, envir, enclos): object 'phthalamic_acid' not found
```

```r
z<-phthalamic_acid$V4
```

```
## Error in eval(expr, envir, enclos): object 'phthalamic_acid' not found
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
-3.387585, 1.149321, -0.6765651, 0, 0, 1, 1, 1,
-3.323842, -0.2857224, -0.9988583, 1, 0, 0, 1, 1,
-2.999148, -0.08245043, -1.680609, 1, 0, 0, 1, 1,
-2.528843, -0.8462206, -0.3534557, 1, 0, 0, 1, 1,
-2.387681, -0.3343819, -1.854994, 1, 0, 0, 1, 1,
-2.264242, 0.8030923, -0.458242, 1, 0, 0, 1, 1,
-2.25305, -0.6216756, -1.724833, 0, 0, 0, 1, 1,
-2.225622, 0.8649577, -2.720048, 0, 0, 0, 1, 1,
-2.212758, -1.097306, -2.63903, 0, 0, 0, 1, 1,
-2.210898, -0.5600765, -1.272341, 0, 0, 0, 1, 1,
-2.156029, 0.6116763, -1.622061, 0, 0, 0, 1, 1,
-2.116315, 0.1583035, -2.900048, 0, 0, 0, 1, 1,
-2.094579, -0.8383714, -1.428479, 0, 0, 0, 1, 1,
-2.065432, 1.608368, 0.5404684, 1, 1, 1, 1, 1,
-2.053737, -0.8210466, -1.634831, 1, 1, 1, 1, 1,
-2.051529, -0.5238434, -2.063747, 1, 1, 1, 1, 1,
-2.03989, -0.7490966, -2.101741, 1, 1, 1, 1, 1,
-2.005153, 1.124197, -1.937531, 1, 1, 1, 1, 1,
-1.946883, -0.4616898, -0.7510538, 1, 1, 1, 1, 1,
-1.936403, -2.727694, -2.009969, 1, 1, 1, 1, 1,
-1.929049, -1.004752, -4.491611, 1, 1, 1, 1, 1,
-1.926575, 0.246934, -1.221985, 1, 1, 1, 1, 1,
-1.920952, 0.9079453, -3.027238, 1, 1, 1, 1, 1,
-1.92019, 0.04178547, -0.7126867, 1, 1, 1, 1, 1,
-1.907426, 0.5866289, -2.249008, 1, 1, 1, 1, 1,
-1.874923, 0.835457, -1.4906, 1, 1, 1, 1, 1,
-1.858193, -0.7250785, -2.67872, 1, 1, 1, 1, 1,
-1.852307, 1.083295, -1.076905, 1, 1, 1, 1, 1,
-1.835601, -0.9531568, -2.774305, 0, 0, 1, 1, 1,
-1.820627, 1.15796, -0.4271593, 1, 0, 0, 1, 1,
-1.820523, 0.5132064, -3.370487, 1, 0, 0, 1, 1,
-1.800143, 0.8046851, -1.781325, 1, 0, 0, 1, 1,
-1.786299, 1.348085, -0.002061781, 1, 0, 0, 1, 1,
-1.785833, 0.4931896, -1.026219, 1, 0, 0, 1, 1,
-1.779127, 2.250594, -0.7141461, 0, 0, 0, 1, 1,
-1.723061, -0.8617385, -1.868674, 0, 0, 0, 1, 1,
-1.716278, -1.038138, -0.8240889, 0, 0, 0, 1, 1,
-1.713943, -0.3818854, -3.204622, 0, 0, 0, 1, 1,
-1.701098, -1.623421, -1.825495, 0, 0, 0, 1, 1,
-1.691301, 0.1694891, -0.6843511, 0, 0, 0, 1, 1,
-1.690134, -0.6041359, -1.009154, 0, 0, 0, 1, 1,
-1.666219, -1.225808, -2.085937, 1, 1, 1, 1, 1,
-1.663726, 0.470915, -0.2410865, 1, 1, 1, 1, 1,
-1.657403, 0.08726772, -0.6403818, 1, 1, 1, 1, 1,
-1.643649, 0.3833804, -2.428044, 1, 1, 1, 1, 1,
-1.640737, -1.06931, -2.135969, 1, 1, 1, 1, 1,
-1.62916, 1.947216, -1.729049, 1, 1, 1, 1, 1,
-1.606851, -2.753926, -2.182787, 1, 1, 1, 1, 1,
-1.599387, -0.05101605, -0.226446, 1, 1, 1, 1, 1,
-1.587021, 1.540419, -1.26122, 1, 1, 1, 1, 1,
-1.577707, -1.445431, -0.2977752, 1, 1, 1, 1, 1,
-1.575035, -0.6111036, -3.779257, 1, 1, 1, 1, 1,
-1.565135, 0.2110645, -1.90134, 1, 1, 1, 1, 1,
-1.560358, 2.606167, -0.793586, 1, 1, 1, 1, 1,
-1.557545, -0.4488097, -1.055256, 1, 1, 1, 1, 1,
-1.543422, 1.138474, -1.242153, 1, 1, 1, 1, 1,
-1.534468, -0.5778255, -2.177151, 0, 0, 1, 1, 1,
-1.53414, -0.5778837, -2.335751, 1, 0, 0, 1, 1,
-1.524639, -0.4382661, -1.806156, 1, 0, 0, 1, 1,
-1.518648, -1.830132, -1.6006, 1, 0, 0, 1, 1,
-1.513275, 0.3306847, -1.231601, 1, 0, 0, 1, 1,
-1.511821, 1.051784, 0.220241, 1, 0, 0, 1, 1,
-1.506801, 0.2537684, 0.2446354, 0, 0, 0, 1, 1,
-1.495663, 1.231701, -3.097409, 0, 0, 0, 1, 1,
-1.489403, 0.6813824, -0.3041264, 0, 0, 0, 1, 1,
-1.484701, 0.339984, -1.201851, 0, 0, 0, 1, 1,
-1.470949, -0.1415991, -2.15496, 0, 0, 0, 1, 1,
-1.469046, 0.1515898, -3.423763, 0, 0, 0, 1, 1,
-1.462796, 1.279228, -0.7120438, 0, 0, 0, 1, 1,
-1.458913, -0.9846982, -2.096154, 1, 1, 1, 1, 1,
-1.458717, 0.04286329, -1.966038, 1, 1, 1, 1, 1,
-1.457803, 1.413866, -0.626959, 1, 1, 1, 1, 1,
-1.450021, 0.03518848, -0.4510726, 1, 1, 1, 1, 1,
-1.438125, 0.5009294, -3.299116, 1, 1, 1, 1, 1,
-1.435534, -1.239073, -1.512822, 1, 1, 1, 1, 1,
-1.434726, 1.020054, -1.153031, 1, 1, 1, 1, 1,
-1.434085, -0.690619, -1.302979, 1, 1, 1, 1, 1,
-1.433867, -0.06013652, 0.2109922, 1, 1, 1, 1, 1,
-1.417247, 0.4315337, -0.843124, 1, 1, 1, 1, 1,
-1.401099, -1.143218, -2.297626, 1, 1, 1, 1, 1,
-1.400524, -1.113553, -2.033215, 1, 1, 1, 1, 1,
-1.38776, 1.251827, -1.43748, 1, 1, 1, 1, 1,
-1.381472, 0.8496131, 0.4204111, 1, 1, 1, 1, 1,
-1.376034, -0.2610161, -0.4118447, 1, 1, 1, 1, 1,
-1.372539, 0.07704049, -0.137063, 0, 0, 1, 1, 1,
-1.370298, 0.003573102, -0.6724332, 1, 0, 0, 1, 1,
-1.369295, 0.2428142, 0.5506535, 1, 0, 0, 1, 1,
-1.367139, -0.798536, -2.055125, 1, 0, 0, 1, 1,
-1.359487, -0.1857093, -1.320556, 1, 0, 0, 1, 1,
-1.353073, 1.011135, 0.6747968, 1, 0, 0, 1, 1,
-1.345794, -2.825182, -2.873118, 0, 0, 0, 1, 1,
-1.338696, -0.9750357, -1.392832, 0, 0, 0, 1, 1,
-1.334907, -0.6647483, -0.8639888, 0, 0, 0, 1, 1,
-1.323143, -0.09668419, -2.458449, 0, 0, 0, 1, 1,
-1.307348, -0.05079742, -1.704175, 0, 0, 0, 1, 1,
-1.304935, -1.080623, -0.6446168, 0, 0, 0, 1, 1,
-1.304306, 0.1000503, -1.413483, 0, 0, 0, 1, 1,
-1.30162, -0.07557416, -1.644675, 1, 1, 1, 1, 1,
-1.288919, 0.2162292, 0.9037483, 1, 1, 1, 1, 1,
-1.288651, -0.5344715, -2.92573, 1, 1, 1, 1, 1,
-1.286652, 0.6986312, -1.188859, 1, 1, 1, 1, 1,
-1.284501, -0.04432596, -0.8975407, 1, 1, 1, 1, 1,
-1.282812, -0.6602111, -2.279831, 1, 1, 1, 1, 1,
-1.278827, 1.085492, -0.4714927, 1, 1, 1, 1, 1,
-1.274224, 0.4343152, -2.777145, 1, 1, 1, 1, 1,
-1.272213, -1.305964, -4.471017, 1, 1, 1, 1, 1,
-1.27028, -2.819652, -3.239486, 1, 1, 1, 1, 1,
-1.269306, 0.339837, -1.28872, 1, 1, 1, 1, 1,
-1.266889, -0.01414269, -0.323186, 1, 1, 1, 1, 1,
-1.266693, 0.5800173, -0.3845828, 1, 1, 1, 1, 1,
-1.254445, 0.5980769, -1.21748, 1, 1, 1, 1, 1,
-1.251621, -1.732421, -3.106837, 1, 1, 1, 1, 1,
-1.251329, -1.336878, -2.680136, 0, 0, 1, 1, 1,
-1.248825, -1.83984, -1.958673, 1, 0, 0, 1, 1,
-1.24409, -0.5197569, -2.586993, 1, 0, 0, 1, 1,
-1.237725, -1.755036, -4.144479, 1, 0, 0, 1, 1,
-1.236955, -1.376126, -1.768575, 1, 0, 0, 1, 1,
-1.23502, 0.2194181, -1.880159, 1, 0, 0, 1, 1,
-1.22712, -1.202961, -2.755142, 0, 0, 0, 1, 1,
-1.223121, 0.2144635, -2.081939, 0, 0, 0, 1, 1,
-1.222317, -1.655085, -1.706149, 0, 0, 0, 1, 1,
-1.217976, 1.205831, -3.429727, 0, 0, 0, 1, 1,
-1.217826, 0.9870991, -0.6171585, 0, 0, 0, 1, 1,
-1.214011, 0.7226006, 0.09214424, 0, 0, 0, 1, 1,
-1.213795, -1.220659, -3.269222, 0, 0, 0, 1, 1,
-1.209584, 1.836065, -0.5282428, 1, 1, 1, 1, 1,
-1.197392, 2.108994, -0.904707, 1, 1, 1, 1, 1,
-1.187375, 0.0835164, -3.039122, 1, 1, 1, 1, 1,
-1.182429, -0.2004749, 0.1269827, 1, 1, 1, 1, 1,
-1.169991, -0.8068905, -1.2357, 1, 1, 1, 1, 1,
-1.152837, -1.535366, -1.409022, 1, 1, 1, 1, 1,
-1.141292, -0.290528, -2.714543, 1, 1, 1, 1, 1,
-1.138495, -0.2866974, -1.368962, 1, 1, 1, 1, 1,
-1.135781, 0.3639137, -3.132071, 1, 1, 1, 1, 1,
-1.135473, 1.985338, -0.0007418661, 1, 1, 1, 1, 1,
-1.124259, -0.0366321, 0.8883666, 1, 1, 1, 1, 1,
-1.116755, -0.1555519, -1.730519, 1, 1, 1, 1, 1,
-1.109377, 0.4559504, -0.09467012, 1, 1, 1, 1, 1,
-1.107614, 0.1513807, -0.3027177, 1, 1, 1, 1, 1,
-1.088265, 0.7740358, -0.6696895, 1, 1, 1, 1, 1,
-1.087986, -0.8595349, -0.9419058, 0, 0, 1, 1, 1,
-1.085943, -0.1037066, -1.244685, 1, 0, 0, 1, 1,
-1.077415, -0.3007863, -2.295687, 1, 0, 0, 1, 1,
-1.076179, 0.5054981, -1.26146, 1, 0, 0, 1, 1,
-1.073402, -0.9479777, -2.145831, 1, 0, 0, 1, 1,
-1.072197, 1.198866, -0.1248024, 1, 0, 0, 1, 1,
-1.070788, 1.780261, -0.5090646, 0, 0, 0, 1, 1,
-1.064421, 0.1813673, -1.841453, 0, 0, 0, 1, 1,
-1.063201, 1.501394, 0.9985855, 0, 0, 0, 1, 1,
-1.060896, -0.1380132, -1.360309, 0, 0, 0, 1, 1,
-1.055192, 1.385882, -1.865981, 0, 0, 0, 1, 1,
-1.053454, -0.7772186, -3.627181, 0, 0, 0, 1, 1,
-1.051445, 1.217245, -1.295771, 0, 0, 0, 1, 1,
-1.050502, 0.8280895, -0.8067774, 1, 1, 1, 1, 1,
-1.04873, -0.04439397, -0.7701024, 1, 1, 1, 1, 1,
-1.044485, 0.7068179, -1.182105, 1, 1, 1, 1, 1,
-1.042274, 0.7154422, 0.1729368, 1, 1, 1, 1, 1,
-1.038209, 0.009124789, -2.496794, 1, 1, 1, 1, 1,
-1.036985, -0.7641605, -3.249427, 1, 1, 1, 1, 1,
-1.036879, 0.8460373, -2.168028, 1, 1, 1, 1, 1,
-1.02615, -0.7565483, -1.639358, 1, 1, 1, 1, 1,
-1.024765, -2.061118, -2.892429, 1, 1, 1, 1, 1,
-1.023336, 0.3589813, -0.7936882, 1, 1, 1, 1, 1,
-1.01348, 0.7224156, -2.52148, 1, 1, 1, 1, 1,
-1.008521, -0.6526403, -0.6891763, 1, 1, 1, 1, 1,
-1.002417, 1.840185, 0.1417546, 1, 1, 1, 1, 1,
-0.9930305, 0.1504766, -1.532514, 1, 1, 1, 1, 1,
-0.9875694, 1.728489, 0.3391694, 1, 1, 1, 1, 1,
-0.9856253, -1.252591, -2.825868, 0, 0, 1, 1, 1,
-0.9850265, -0.0005324392, -1.606383, 1, 0, 0, 1, 1,
-0.9840484, 0.3958193, -0.564424, 1, 0, 0, 1, 1,
-0.9736304, 0.923268, -0.04285363, 1, 0, 0, 1, 1,
-0.9726007, -1.752059, -2.953283, 1, 0, 0, 1, 1,
-0.9706292, -0.1350975, -2.576432, 1, 0, 0, 1, 1,
-0.9704199, 1.068139, -1.025762, 0, 0, 0, 1, 1,
-0.9648727, 0.2066431, -0.7791375, 0, 0, 0, 1, 1,
-0.9648169, 0.07349024, -1.125954, 0, 0, 0, 1, 1,
-0.9646936, 0.7957401, -0.4490947, 0, 0, 0, 1, 1,
-0.9630288, -0.1610407, -2.275254, 0, 0, 0, 1, 1,
-0.9612217, -2.71256, -4.129926, 0, 0, 0, 1, 1,
-0.9528943, 0.08531729, -0.8148621, 0, 0, 0, 1, 1,
-0.9499589, 0.492128, -0.2507472, 1, 1, 1, 1, 1,
-0.9473789, 0.7572628, -1.614859, 1, 1, 1, 1, 1,
-0.9471554, -0.1841175, -0.480006, 1, 1, 1, 1, 1,
-0.944148, -0.08386112, -1.045082, 1, 1, 1, 1, 1,
-0.9397336, 0.4441187, -0.2071794, 1, 1, 1, 1, 1,
-0.9377389, -0.8116326, -2.840132, 1, 1, 1, 1, 1,
-0.9308025, -0.7476467, -1.417971, 1, 1, 1, 1, 1,
-0.9301541, 0.09390938, -0.9864415, 1, 1, 1, 1, 1,
-0.9218968, -2.082286, -1.771424, 1, 1, 1, 1, 1,
-0.9199956, 0.09756522, -1.804573, 1, 1, 1, 1, 1,
-0.9177449, 1.787585, -0.8350049, 1, 1, 1, 1, 1,
-0.9155908, -1.236534, -1.114573, 1, 1, 1, 1, 1,
-0.911272, -0.07724419, -0.5108011, 1, 1, 1, 1, 1,
-0.9102554, 0.08030811, -3.117245, 1, 1, 1, 1, 1,
-0.9101769, -1.09138, -2.702795, 1, 1, 1, 1, 1,
-0.9092957, -0.8630319, -1.319902, 0, 0, 1, 1, 1,
-0.9071779, 0.8931471, -0.6185429, 1, 0, 0, 1, 1,
-0.9010735, -0.5560544, -1.938415, 1, 0, 0, 1, 1,
-0.9009684, -0.9421718, -3.046077, 1, 0, 0, 1, 1,
-0.8967836, 1.051268, 0.3426372, 1, 0, 0, 1, 1,
-0.8956134, 0.6632262, -2.370491, 1, 0, 0, 1, 1,
-0.8925477, 0.07053852, -2.804199, 0, 0, 0, 1, 1,
-0.8871112, -0.5861858, -1.897142, 0, 0, 0, 1, 1,
-0.8804653, -1.076717, -3.430571, 0, 0, 0, 1, 1,
-0.8762443, -0.9145801, -2.708311, 0, 0, 0, 1, 1,
-0.8758004, 0.2007278, -2.762712, 0, 0, 0, 1, 1,
-0.8755054, 0.2551086, -1.72169, 0, 0, 0, 1, 1,
-0.8743292, 0.06411684, -1.801541, 0, 0, 0, 1, 1,
-0.8699524, -0.9274731, -3.673426, 1, 1, 1, 1, 1,
-0.8672758, 0.09126369, -0.3316801, 1, 1, 1, 1, 1,
-0.8638061, 0.7489859, -0.8510716, 1, 1, 1, 1, 1,
-0.8606271, 1.457113, 0.8332552, 1, 1, 1, 1, 1,
-0.8561328, -0.9644531, -1.136545, 1, 1, 1, 1, 1,
-0.843783, -0.1847915, -1.07496, 1, 1, 1, 1, 1,
-0.8416988, -0.8672275, -2.95026, 1, 1, 1, 1, 1,
-0.8380027, -0.5059438, -1.829649, 1, 1, 1, 1, 1,
-0.8375326, -0.5248941, -2.807219, 1, 1, 1, 1, 1,
-0.8372825, -0.2756072, -2.13849, 1, 1, 1, 1, 1,
-0.8331162, -0.7093501, -3.038748, 1, 1, 1, 1, 1,
-0.8241642, -1.017391, -1.380968, 1, 1, 1, 1, 1,
-0.8201666, 1.264381, -1.153319, 1, 1, 1, 1, 1,
-0.8201167, -0.9144257, -1.483241, 1, 1, 1, 1, 1,
-0.8058522, -1.491235, -1.639392, 1, 1, 1, 1, 1,
-0.7971769, 1.237491, -2.653884, 0, 0, 1, 1, 1,
-0.79388, -0.02146624, -0.2423836, 1, 0, 0, 1, 1,
-0.7927599, -0.4580366, -2.573375, 1, 0, 0, 1, 1,
-0.7893759, -0.3746736, -2.237677, 1, 0, 0, 1, 1,
-0.7843276, -0.01089485, -2.572269, 1, 0, 0, 1, 1,
-0.783762, 0.2612396, -0.4145078, 1, 0, 0, 1, 1,
-0.7835981, 0.02448588, -0.4660843, 0, 0, 0, 1, 1,
-0.7829859, -1.066106, -3.458326, 0, 0, 0, 1, 1,
-0.7765324, 0.03891189, -0.6783592, 0, 0, 0, 1, 1,
-0.7719567, 0.9865124, -0.7278051, 0, 0, 0, 1, 1,
-0.767722, 1.203987, -0.1417506, 0, 0, 0, 1, 1,
-0.7658058, -0.773291, -1.248454, 0, 0, 0, 1, 1,
-0.7638658, 0.8733238, -0.8637284, 0, 0, 0, 1, 1,
-0.7625108, 0.5992483, -0.2715241, 1, 1, 1, 1, 1,
-0.7575292, 2.236631, -1.599885, 1, 1, 1, 1, 1,
-0.7573268, -0.3052985, -1.572521, 1, 1, 1, 1, 1,
-0.7457311, -0.3965069, -1.179021, 1, 1, 1, 1, 1,
-0.7414418, -0.1571402, -3.379496, 1, 1, 1, 1, 1,
-0.7400827, 0.7627869, -2.109025, 1, 1, 1, 1, 1,
-0.7386466, -0.4189742, -2.371691, 1, 1, 1, 1, 1,
-0.7292985, -1.057098, -3.151283, 1, 1, 1, 1, 1,
-0.7285058, 0.06200435, -0.3191046, 1, 1, 1, 1, 1,
-0.7252535, 0.2769893, -1.372481, 1, 1, 1, 1, 1,
-0.721743, -1.274189, -2.996547, 1, 1, 1, 1, 1,
-0.7192378, -0.2662711, -2.474948, 1, 1, 1, 1, 1,
-0.7107843, -2.134016, -1.723893, 1, 1, 1, 1, 1,
-0.704545, -0.1381489, 2.023327, 1, 1, 1, 1, 1,
-0.6942894, 0.05656373, -1.28238, 1, 1, 1, 1, 1,
-0.6930917, -0.008109533, -3.107518, 0, 0, 1, 1, 1,
-0.6762958, 1.289071, 0.7272003, 1, 0, 0, 1, 1,
-0.6747594, 0.6132152, -0.2269273, 1, 0, 0, 1, 1,
-0.6745897, -0.5298913, -0.7945212, 1, 0, 0, 1, 1,
-0.6745803, 1.362979, -0.4710965, 1, 0, 0, 1, 1,
-0.6729809, -0.7513732, -3.152231, 1, 0, 0, 1, 1,
-0.6723837, 0.008170075, 0.2685736, 0, 0, 0, 1, 1,
-0.6719364, 1.713876, -0.5705987, 0, 0, 0, 1, 1,
-0.6711495, -0.1363336, -2.370939, 0, 0, 0, 1, 1,
-0.671078, -0.885394, -0.6651708, 0, 0, 0, 1, 1,
-0.6701561, 0.8671407, -0.9787084, 0, 0, 0, 1, 1,
-0.6670902, -0.3474517, -4.227819, 0, 0, 0, 1, 1,
-0.6641856, 0.3437825, -0.3653227, 0, 0, 0, 1, 1,
-0.6626588, 1.06598, -1.615236, 1, 1, 1, 1, 1,
-0.6525574, -0.5412433, -0.577924, 1, 1, 1, 1, 1,
-0.6463779, -0.370141, -2.719681, 1, 1, 1, 1, 1,
-0.6460923, 0.9324597, 0.08508873, 1, 1, 1, 1, 1,
-0.6456907, 0.7783361, -0.2055024, 1, 1, 1, 1, 1,
-0.6447635, 0.1387828, -0.2797818, 1, 1, 1, 1, 1,
-0.6373823, -1.342192, -4.127877, 1, 1, 1, 1, 1,
-0.6287188, -0.4263781, -1.397158, 1, 1, 1, 1, 1,
-0.6282456, -1.497321, -3.019006, 1, 1, 1, 1, 1,
-0.6276006, -0.5815156, -3.115986, 1, 1, 1, 1, 1,
-0.6267199, -0.8723828, -3.35837, 1, 1, 1, 1, 1,
-0.623773, 0.9164809, -0.9071332, 1, 1, 1, 1, 1,
-0.6210502, -1.273229, -3.504664, 1, 1, 1, 1, 1,
-0.6207322, 1.129282, -0.8080072, 1, 1, 1, 1, 1,
-0.613169, -1.494574, -4.473493, 1, 1, 1, 1, 1,
-0.6119625, -0.6941075, -2.926604, 0, 0, 1, 1, 1,
-0.6090029, 0.2216785, -0.8580461, 1, 0, 0, 1, 1,
-0.6081111, -0.5736513, -2.702408, 1, 0, 0, 1, 1,
-0.6074883, 0.3546881, -2.30641, 1, 0, 0, 1, 1,
-0.6063878, 0.334737, 0.2379812, 1, 0, 0, 1, 1,
-0.6036253, 1.143148, -0.8814686, 1, 0, 0, 1, 1,
-0.6028706, -0.2789398, -1.722301, 0, 0, 0, 1, 1,
-0.6003836, 0.8020727, -0.828252, 0, 0, 0, 1, 1,
-0.5964739, -1.44585, -2.59052, 0, 0, 0, 1, 1,
-0.5964202, -0.02239302, -0.5099245, 0, 0, 0, 1, 1,
-0.5928861, -0.8888987, -2.352992, 0, 0, 0, 1, 1,
-0.5837624, 0.6952531, -1.55569, 0, 0, 0, 1, 1,
-0.5803915, -1.601122, -2.425954, 0, 0, 0, 1, 1,
-0.5796878, 1.288008, -1.253426, 1, 1, 1, 1, 1,
-0.5760816, 1.565579, 0.5006131, 1, 1, 1, 1, 1,
-0.5744764, 0.3384572, -2.599387, 1, 1, 1, 1, 1,
-0.5660883, -2.752239, -1.302256, 1, 1, 1, 1, 1,
-0.5613009, -0.1311015, -0.7272285, 1, 1, 1, 1, 1,
-0.5609499, 1.576747, -0.4186082, 1, 1, 1, 1, 1,
-0.5588896, -1.39954, -1.854165, 1, 1, 1, 1, 1,
-0.5565644, -1.351246, -2.653331, 1, 1, 1, 1, 1,
-0.552694, -0.5735343, -2.423585, 1, 1, 1, 1, 1,
-0.5447422, 0.7989905, -0.3129508, 1, 1, 1, 1, 1,
-0.5386976, 1.334728, -1.282297, 1, 1, 1, 1, 1,
-0.5336795, -0.2330512, -1.036123, 1, 1, 1, 1, 1,
-0.53106, -0.6482184, -2.838291, 1, 1, 1, 1, 1,
-0.5275506, -0.9093099, -1.987723, 1, 1, 1, 1, 1,
-0.5273582, 0.02317316, -1.536839, 1, 1, 1, 1, 1,
-0.5271516, 0.5680059, -0.2574428, 0, 0, 1, 1, 1,
-0.525276, -0.30864, -2.242922, 1, 0, 0, 1, 1,
-0.5214587, 0.2464315, 0.2706176, 1, 0, 0, 1, 1,
-0.517097, -1.383812, -1.542348, 1, 0, 0, 1, 1,
-0.5159851, -0.01515104, -1.080641, 1, 0, 0, 1, 1,
-0.5134787, 0.810998, 1.405554, 1, 0, 0, 1, 1,
-0.513193, -1.38394, -4.331151, 0, 0, 0, 1, 1,
-0.5109617, 0.1380696, -1.799005, 0, 0, 0, 1, 1,
-0.5075087, 0.2272828, -0.03496224, 0, 0, 0, 1, 1,
-0.5046842, 0.6366166, 1.709419, 0, 0, 0, 1, 1,
-0.5037525, -1.192022, -3.51055, 0, 0, 0, 1, 1,
-0.5030415, 2.126353, -1.239044, 0, 0, 0, 1, 1,
-0.502822, -0.5603467, -2.385391, 0, 0, 0, 1, 1,
-0.5025135, 1.228712, -0.1028761, 1, 1, 1, 1, 1,
-0.4951111, -2.31448, -2.304653, 1, 1, 1, 1, 1,
-0.4937783, -0.4052903, -2.839956, 1, 1, 1, 1, 1,
-0.4865561, -1.520974, -3.769736, 1, 1, 1, 1, 1,
-0.4826786, 0.07195789, -2.991781, 1, 1, 1, 1, 1,
-0.4812612, -1.737398, -2.586454, 1, 1, 1, 1, 1,
-0.4779626, 0.5712543, 0.3896411, 1, 1, 1, 1, 1,
-0.4766377, -0.9019375, -3.32743, 1, 1, 1, 1, 1,
-0.4739299, 1.790347, -0.8709353, 1, 1, 1, 1, 1,
-0.4679473, -0.7407403, -1.42568, 1, 1, 1, 1, 1,
-0.4638491, -0.3260643, -3.787068, 1, 1, 1, 1, 1,
-0.4629566, -1.349168, -3.613104, 1, 1, 1, 1, 1,
-0.4573264, -0.1149837, -3.348106, 1, 1, 1, 1, 1,
-0.4561363, -0.4074611, -3.54743, 1, 1, 1, 1, 1,
-0.449756, 1.757453, -0.5562904, 1, 1, 1, 1, 1,
-0.4405828, -1.269171, -3.550945, 0, 0, 1, 1, 1,
-0.4403072, -0.3312995, 0.1706107, 1, 0, 0, 1, 1,
-0.4333657, 0.2111118, -1.028865, 1, 0, 0, 1, 1,
-0.4325459, 2.113038, 0.001934197, 1, 0, 0, 1, 1,
-0.4306235, 0.7349811, -1.520056, 1, 0, 0, 1, 1,
-0.4292601, -1.108474, -2.955716, 1, 0, 0, 1, 1,
-0.4278524, 1.283041, -0.622264, 0, 0, 0, 1, 1,
-0.4250484, -0.1278509, -2.148701, 0, 0, 0, 1, 1,
-0.4185734, -1.203404, -3.725341, 0, 0, 0, 1, 1,
-0.4130421, -0.22473, -2.680886, 0, 0, 0, 1, 1,
-0.4111001, -0.2680543, -1.410102, 0, 0, 0, 1, 1,
-0.4057501, 1.247145, -1.508344, 0, 0, 0, 1, 1,
-0.4050556, 0.03924023, -1.754999, 0, 0, 0, 1, 1,
-0.4044326, -0.8305554, -3.019725, 1, 1, 1, 1, 1,
-0.4030661, -0.002104769, -3.032493, 1, 1, 1, 1, 1,
-0.3948945, 0.4481682, -2.015908, 1, 1, 1, 1, 1,
-0.3946192, 2.148471, 0.8291401, 1, 1, 1, 1, 1,
-0.3909707, 0.3361013, -0.05895882, 1, 1, 1, 1, 1,
-0.3860317, -0.440538, -2.336946, 1, 1, 1, 1, 1,
-0.3806431, 2.39739, 0.3264258, 1, 1, 1, 1, 1,
-0.3791691, -0.5368267, -1.204287, 1, 1, 1, 1, 1,
-0.3743613, 0.4595087, 0.3046133, 1, 1, 1, 1, 1,
-0.371047, -0.5619908, -2.19191, 1, 1, 1, 1, 1,
-0.3642529, 1.318683, 0.500782, 1, 1, 1, 1, 1,
-0.3602095, -1.005309, -2.747659, 1, 1, 1, 1, 1,
-0.3587798, 0.7982153, -0.7656512, 1, 1, 1, 1, 1,
-0.3565218, -2.182291, -2.69605, 1, 1, 1, 1, 1,
-0.3536865, -0.2208371, -1.330613, 1, 1, 1, 1, 1,
-0.3511688, -0.3633316, -2.943984, 0, 0, 1, 1, 1,
-0.3488474, -0.005407252, -1.877757, 1, 0, 0, 1, 1,
-0.3469774, 0.3286704, -0.3364737, 1, 0, 0, 1, 1,
-0.3452386, -0.2714465, -1.85006, 1, 0, 0, 1, 1,
-0.3407542, -0.4438778, -2.407449, 1, 0, 0, 1, 1,
-0.3381958, -0.552026, -2.654402, 1, 0, 0, 1, 1,
-0.334124, 0.1984406, -1.680225, 0, 0, 0, 1, 1,
-0.3315588, -1.017747, -2.939216, 0, 0, 0, 1, 1,
-0.3313733, -0.7923086, -2.089544, 0, 0, 0, 1, 1,
-0.3258404, -1.019232, -1.112738, 0, 0, 0, 1, 1,
-0.3251313, -0.007116515, -1.62027, 0, 0, 0, 1, 1,
-0.3247956, -0.4078781, -2.833927, 0, 0, 0, 1, 1,
-0.3226189, -0.7475544, -4.517703, 0, 0, 0, 1, 1,
-0.320982, -1.534847, -2.463524, 1, 1, 1, 1, 1,
-0.3185633, -0.191409, -1.965371, 1, 1, 1, 1, 1,
-0.3170832, 0.6339107, -1.012569, 1, 1, 1, 1, 1,
-0.3158782, 0.4916404, -0.8375287, 1, 1, 1, 1, 1,
-0.3156916, 0.5349218, -1.199602, 1, 1, 1, 1, 1,
-0.3153637, 0.09103164, -1.784917, 1, 1, 1, 1, 1,
-0.3143076, 0.4207972, -1.693198, 1, 1, 1, 1, 1,
-0.3135587, 0.4338048, 0.1906089, 1, 1, 1, 1, 1,
-0.3069961, -1.315192, -1.989201, 1, 1, 1, 1, 1,
-0.3064335, 0.5887865, -0.3527797, 1, 1, 1, 1, 1,
-0.3045805, 0.9384921, -0.1243693, 1, 1, 1, 1, 1,
-0.3002938, -0.3547314, -2.209992, 1, 1, 1, 1, 1,
-0.2905666, -1.287916, -4.0418, 1, 1, 1, 1, 1,
-0.282741, 0.1842239, -1.209803, 1, 1, 1, 1, 1,
-0.2818628, -0.9470736, -3.526884, 1, 1, 1, 1, 1,
-0.280566, -0.9087858, -3.484451, 0, 0, 1, 1, 1,
-0.2712085, 0.6494554, -0.4646585, 1, 0, 0, 1, 1,
-0.2706771, -1.593244, -3.534336, 1, 0, 0, 1, 1,
-0.265177, -0.3184089, -1.575797, 1, 0, 0, 1, 1,
-0.2566369, -1.124609, -2.667485, 1, 0, 0, 1, 1,
-0.2555373, 0.8985499, -2.32985, 1, 0, 0, 1, 1,
-0.2533517, 1.923391, 1.039689, 0, 0, 0, 1, 1,
-0.2525329, 0.9784714, -0.7324178, 0, 0, 0, 1, 1,
-0.2511359, -0.9077622, -2.856043, 0, 0, 0, 1, 1,
-0.2503651, 0.1041513, -0.6461876, 0, 0, 0, 1, 1,
-0.2501764, 1.260719, 0.4454052, 0, 0, 0, 1, 1,
-0.2483095, 0.02115961, -1.594474, 0, 0, 0, 1, 1,
-0.2477627, -0.9641631, -5.156149, 0, 0, 0, 1, 1,
-0.2465056, 0.9539539, 1.027731, 1, 1, 1, 1, 1,
-0.2449955, 0.9277208, -0.4685767, 1, 1, 1, 1, 1,
-0.2392365, 0.8615366, -0.6010046, 1, 1, 1, 1, 1,
-0.2391322, -0.393097, -3.818257, 1, 1, 1, 1, 1,
-0.2353681, -0.6988941, -2.265879, 1, 1, 1, 1, 1,
-0.2337494, -0.5414752, -4.259745, 1, 1, 1, 1, 1,
-0.2330986, -0.5631725, -2.823391, 1, 1, 1, 1, 1,
-0.2318724, 0.8234113, -0.2476672, 1, 1, 1, 1, 1,
-0.2280225, -0.3954082, -2.390864, 1, 1, 1, 1, 1,
-0.2274926, 0.3349296, -0.3788628, 1, 1, 1, 1, 1,
-0.2265809, -1.183447, -3.173289, 1, 1, 1, 1, 1,
-0.2259486, 0.2515011, -1.306363, 1, 1, 1, 1, 1,
-0.2252519, 0.6707878, 0.2090091, 1, 1, 1, 1, 1,
-0.2189679, -0.05962991, -2.276948, 1, 1, 1, 1, 1,
-0.2175025, -2.061989, -2.904279, 1, 1, 1, 1, 1,
-0.2161719, 0.295902, -0.1055486, 0, 0, 1, 1, 1,
-0.2107464, 0.02900249, -2.24975, 1, 0, 0, 1, 1,
-0.202748, 0.3601002, -0.7134964, 1, 0, 0, 1, 1,
-0.2017792, 0.4798947, 0.7984829, 1, 0, 0, 1, 1,
-0.1933372, -1.393635, -2.713296, 1, 0, 0, 1, 1,
-0.1922197, -2.657688, -2.965586, 1, 0, 0, 1, 1,
-0.1919357, -0.3282925, -1.801324, 0, 0, 0, 1, 1,
-0.1912215, -0.2033332, -2.241105, 0, 0, 0, 1, 1,
-0.190975, -0.3370646, -3.274741, 0, 0, 0, 1, 1,
-0.1855062, -1.038144, -4.032898, 0, 0, 0, 1, 1,
-0.1830336, 0.6764215, -0.6964735, 0, 0, 0, 1, 1,
-0.1828573, 0.4605963, 0.3987543, 0, 0, 0, 1, 1,
-0.1804203, -0.2849997, -2.698589, 0, 0, 0, 1, 1,
-0.1798909, -0.6435525, -2.025744, 1, 1, 1, 1, 1,
-0.1796092, 0.1940764, -0.8508116, 1, 1, 1, 1, 1,
-0.1779764, -1.244472, -1.852455, 1, 1, 1, 1, 1,
-0.1771178, -1.012674, -2.24728, 1, 1, 1, 1, 1,
-0.1747503, -1.622355, -2.238524, 1, 1, 1, 1, 1,
-0.1730748, -0.3532334, -1.854265, 1, 1, 1, 1, 1,
-0.1728869, -0.1477672, -1.154051, 1, 1, 1, 1, 1,
-0.1718943, -1.84599, -1.730994, 1, 1, 1, 1, 1,
-0.1715157, 0.3135391, -1.806404, 1, 1, 1, 1, 1,
-0.1687138, 0.8716852, 0.6222744, 1, 1, 1, 1, 1,
-0.1679904, 0.1761452, 0.03786061, 1, 1, 1, 1, 1,
-0.1625641, 0.3008476, -1.539919, 1, 1, 1, 1, 1,
-0.162539, 0.124335, -0.8861083, 1, 1, 1, 1, 1,
-0.1611764, -0.02708148, -1.702386, 1, 1, 1, 1, 1,
-0.15602, 1.322943, 0.1545798, 1, 1, 1, 1, 1,
-0.1505582, -0.8024431, -4.213218, 0, 0, 1, 1, 1,
-0.150027, 0.5249267, -1.069961, 1, 0, 0, 1, 1,
-0.1463395, 0.5286283, -0.4256682, 1, 0, 0, 1, 1,
-0.1447191, 0.389813, -0.07672054, 1, 0, 0, 1, 1,
-0.1436219, 0.9141065, -0.3585648, 1, 0, 0, 1, 1,
-0.1421023, 0.7161423, 0.3762819, 1, 0, 0, 1, 1,
-0.1381986, -0.6041512, -6.689471, 0, 0, 0, 1, 1,
-0.138153, 1.402547, 0.1450308, 0, 0, 0, 1, 1,
-0.1296407, -0.8648934, -1.875387, 0, 0, 0, 1, 1,
-0.127548, -1.43209, -3.090519, 0, 0, 0, 1, 1,
-0.1253336, 1.805277, -0.1804677, 0, 0, 0, 1, 1,
-0.120457, 0.4944559, -1.018056, 0, 0, 0, 1, 1,
-0.1198392, -0.01596811, -2.300039, 0, 0, 0, 1, 1,
-0.1178042, 1.182284, -0.4314186, 1, 1, 1, 1, 1,
-0.1152325, -1.242358, -2.034522, 1, 1, 1, 1, 1,
-0.1138323, 0.8934409, -0.8111234, 1, 1, 1, 1, 1,
-0.103391, -0.8052752, -2.434189, 1, 1, 1, 1, 1,
-0.1031992, -0.5751421, -3.364192, 1, 1, 1, 1, 1,
-0.09522153, 1.68659, 1.813422, 1, 1, 1, 1, 1,
-0.09368296, -0.4797427, -3.654347, 1, 1, 1, 1, 1,
-0.09005024, 0.4248592, -0.9392111, 1, 1, 1, 1, 1,
-0.08590008, 0.1827444, -1.531547, 1, 1, 1, 1, 1,
-0.08082337, 2.798968, 0.371922, 1, 1, 1, 1, 1,
-0.07482359, -0.8736712, -3.707532, 1, 1, 1, 1, 1,
-0.07253639, 0.047259, -0.2861957, 1, 1, 1, 1, 1,
-0.06768281, -0.7883381, -2.107726, 1, 1, 1, 1, 1,
-0.06699745, 2.414119, -0.8060475, 1, 1, 1, 1, 1,
-0.06568117, -0.8230326, -2.487186, 1, 1, 1, 1, 1,
-0.06275267, 0.6949155, 0.05630051, 0, 0, 1, 1, 1,
-0.06242635, -0.4370228, -2.565717, 1, 0, 0, 1, 1,
-0.05938794, -0.5524339, -3.418232, 1, 0, 0, 1, 1,
-0.05861968, -1.245917, -4.043919, 1, 0, 0, 1, 1,
-0.0566125, 1.093719, -1.511399, 1, 0, 0, 1, 1,
-0.056275, -0.9270017, -3.404165, 1, 0, 0, 1, 1,
-0.05417822, 0.4693702, -0.6183289, 0, 0, 0, 1, 1,
-0.05305618, -1.343745, -3.288543, 0, 0, 0, 1, 1,
-0.04714758, 0.482762, 0.1174862, 0, 0, 0, 1, 1,
-0.04439528, -2.583694, -2.160876, 0, 0, 0, 1, 1,
-0.04437299, -0.4315156, -2.6361, 0, 0, 0, 1, 1,
-0.03752397, -1.310391, -2.869046, 0, 0, 0, 1, 1,
-0.03415325, -0.8257976, -4.065429, 0, 0, 0, 1, 1,
-0.03353043, 1.634929, 0.8060316, 1, 1, 1, 1, 1,
-0.03278751, 0.7086102, -0.6492907, 1, 1, 1, 1, 1,
-0.03161533, -1.937718, -3.340699, 1, 1, 1, 1, 1,
-0.03156785, 0.9933925, -0.2314116, 1, 1, 1, 1, 1,
-0.03007964, -0.08354116, -3.988663, 1, 1, 1, 1, 1,
-0.0289628, 0.002690137, -1.484332, 1, 1, 1, 1, 1,
-0.02657853, -0.1262272, -4.503196, 1, 1, 1, 1, 1,
-0.02365049, -0.777439, -2.2102, 1, 1, 1, 1, 1,
-0.01997746, -0.7944785, -3.398186, 1, 1, 1, 1, 1,
-0.01973334, -0.7196182, -2.330184, 1, 1, 1, 1, 1,
-0.0150881, 0.8649566, -0.2780279, 1, 1, 1, 1, 1,
-0.01343352, 1.020216, 0.543911, 1, 1, 1, 1, 1,
-0.01132129, 0.5979652, 0.2612679, 1, 1, 1, 1, 1,
-0.00721155, 0.4825663, -0.654466, 1, 1, 1, 1, 1,
-0.004821444, 0.7899351, 2.525682, 1, 1, 1, 1, 1,
-0.002566612, 0.07340834, -0.3064687, 0, 0, 1, 1, 1,
-0.002213567, -0.05762362, -3.639742, 1, 0, 0, 1, 1,
0.003465583, -0.7522305, 1.975581, 1, 0, 0, 1, 1,
0.006435874, 0.09235556, 0.1446021, 1, 0, 0, 1, 1,
0.008012585, -0.6878185, 1.809057, 1, 0, 0, 1, 1,
0.008085699, -0.8246817, 2.632408, 1, 0, 0, 1, 1,
0.008710406, 0.3721937, -0.9174469, 0, 0, 0, 1, 1,
0.01483724, 1.604904, 0.186123, 0, 0, 0, 1, 1,
0.01819802, 0.6083919, -0.2391559, 0, 0, 0, 1, 1,
0.02027647, -0.6331853, 2.650572, 0, 0, 0, 1, 1,
0.02227697, -0.9837167, 3.670083, 0, 0, 0, 1, 1,
0.02433094, 0.04835354, -0.8063192, 0, 0, 0, 1, 1,
0.02577159, -0.661518, 4.779704, 0, 0, 0, 1, 1,
0.02651485, -0.8853635, 4.038786, 1, 1, 1, 1, 1,
0.02710993, -0.002885562, 1.729717, 1, 1, 1, 1, 1,
0.02727305, -0.7708947, 2.418602, 1, 1, 1, 1, 1,
0.02833227, 0.5286569, -3.265774, 1, 1, 1, 1, 1,
0.03234885, 2.450003, 1.163184, 1, 1, 1, 1, 1,
0.03401183, -0.08586856, 2.889512, 1, 1, 1, 1, 1,
0.037569, -0.5497071, 3.623952, 1, 1, 1, 1, 1,
0.04008336, -1.09119, 1.64107, 1, 1, 1, 1, 1,
0.04323008, 0.4717096, 1.201885, 1, 1, 1, 1, 1,
0.0436097, -0.5240601, 3.136349, 1, 1, 1, 1, 1,
0.04859283, -0.1006142, 2.84547, 1, 1, 1, 1, 1,
0.05083631, 0.8139125, -0.8813519, 1, 1, 1, 1, 1,
0.0533283, 0.8122901, 1.025397, 1, 1, 1, 1, 1,
0.05549627, -0.8646611, 2.912998, 1, 1, 1, 1, 1,
0.05678911, -2.004589, 1.608842, 1, 1, 1, 1, 1,
0.05756428, 0.3873999, 1.705158, 0, 0, 1, 1, 1,
0.05959085, -0.4669614, 2.701002, 1, 0, 0, 1, 1,
0.06049322, 0.9046825, -0.2321471, 1, 0, 0, 1, 1,
0.06371237, -0.3509807, 3.569615, 1, 0, 0, 1, 1,
0.06598172, 2.231757, -0.8522638, 1, 0, 0, 1, 1,
0.06616923, -0.0519016, 2.122538, 1, 0, 0, 1, 1,
0.07799034, -0.2306818, 4.098294, 0, 0, 0, 1, 1,
0.07910569, -0.06198863, 2.112415, 0, 0, 0, 1, 1,
0.08013166, -0.9801134, 2.524585, 0, 0, 0, 1, 1,
0.08106454, 0.9297575, -1.179728, 0, 0, 0, 1, 1,
0.08107997, 1.999539, 0.1593189, 0, 0, 0, 1, 1,
0.08112877, 0.4171081, 0.6732026, 0, 0, 0, 1, 1,
0.08269031, -0.8975619, 2.15902, 0, 0, 0, 1, 1,
0.08285336, 0.199951, 2.058846, 1, 1, 1, 1, 1,
0.08338669, -0.07002831, 1.233885, 1, 1, 1, 1, 1,
0.09103753, -1.012743, 2.091148, 1, 1, 1, 1, 1,
0.09253383, -0.5822297, 3.633561, 1, 1, 1, 1, 1,
0.09448184, 0.09915734, 1.35447, 1, 1, 1, 1, 1,
0.09629504, -0.8854289, 1.527049, 1, 1, 1, 1, 1,
0.09636027, -0.8131365, 3.606773, 1, 1, 1, 1, 1,
0.09866218, 1.962642, 1.948064, 1, 1, 1, 1, 1,
0.1003065, -0.1250763, 2.823005, 1, 1, 1, 1, 1,
0.1004001, 0.7836376, 1.880639, 1, 1, 1, 1, 1,
0.100643, 0.3296306, -0.9829347, 1, 1, 1, 1, 1,
0.1047704, 0.05471782, 1.923503, 1, 1, 1, 1, 1,
0.1164924, 2.103813, -0.4706115, 1, 1, 1, 1, 1,
0.1192808, 1.589387, 0.2250412, 1, 1, 1, 1, 1,
0.1195751, -0.4863117, 1.515825, 1, 1, 1, 1, 1,
0.1212379, 0.6245353, 0.4781918, 0, 0, 1, 1, 1,
0.1246597, -0.7440386, 2.046569, 1, 0, 0, 1, 1,
0.130321, -1.297133, 2.839108, 1, 0, 0, 1, 1,
0.1332072, -0.5559161, 1.479223, 1, 0, 0, 1, 1,
0.135424, 0.2364657, 1.721202, 1, 0, 0, 1, 1,
0.1376266, 0.8865166, -1.694266, 1, 0, 0, 1, 1,
0.1380839, -0.3466329, 3.178212, 0, 0, 0, 1, 1,
0.14054, 0.967943, -0.7052196, 0, 0, 0, 1, 1,
0.1418803, -0.1508166, 1.608322, 0, 0, 0, 1, 1,
0.1422811, 1.536188, -0.6678643, 0, 0, 0, 1, 1,
0.1439148, 0.3053837, 0.2183831, 0, 0, 0, 1, 1,
0.1477996, -0.5550539, 0.7857459, 0, 0, 0, 1, 1,
0.1482274, -0.127594, 0.4693932, 0, 0, 0, 1, 1,
0.1494009, -1.434206, 2.217235, 1, 1, 1, 1, 1,
0.1573541, -0.6087807, 1.972048, 1, 1, 1, 1, 1,
0.1689696, 0.3955465, 1.600575, 1, 1, 1, 1, 1,
0.1722592, 0.8920451, 1.011374, 1, 1, 1, 1, 1,
0.175648, 0.1250075, -0.1491833, 1, 1, 1, 1, 1,
0.1794766, -0.5038272, 3.004077, 1, 1, 1, 1, 1,
0.1877206, -1.014569, 3.391351, 1, 1, 1, 1, 1,
0.1886334, 0.1873886, 1.266498, 1, 1, 1, 1, 1,
0.1905047, 0.8231835, 1.486526, 1, 1, 1, 1, 1,
0.1909059, -0.8140733, 4.319713, 1, 1, 1, 1, 1,
0.1912023, -0.02568774, 2.056007, 1, 1, 1, 1, 1,
0.1913936, -1.787278, 3.162924, 1, 1, 1, 1, 1,
0.1921225, -1.655027, 2.249974, 1, 1, 1, 1, 1,
0.1945326, 0.8279276, 0.4722263, 1, 1, 1, 1, 1,
0.2031527, -0.5150583, 2.99108, 1, 1, 1, 1, 1,
0.2038571, 0.2078549, 1.758608, 0, 0, 1, 1, 1,
0.204858, -1.178599, 3.154121, 1, 0, 0, 1, 1,
0.2107211, 1.283461, 0.3189198, 1, 0, 0, 1, 1,
0.2126596, 0.4916966, -0.08448096, 1, 0, 0, 1, 1,
0.2136041, 0.5354905, 0.3075089, 1, 0, 0, 1, 1,
0.2158988, 0.3348086, -0.1368298, 1, 0, 0, 1, 1,
0.2162499, -1.562163, 3.37355, 0, 0, 0, 1, 1,
0.2208283, -1.03955, 3.743883, 0, 0, 0, 1, 1,
0.2219421, 1.739912, -1.396808, 0, 0, 0, 1, 1,
0.2221394, -0.7611973, 3.252551, 0, 0, 0, 1, 1,
0.2286201, 0.8761559, 0.1886498, 0, 0, 0, 1, 1,
0.2344498, 1.7275, 0.2590751, 0, 0, 0, 1, 1,
0.2363449, 0.3837917, 0.6076407, 0, 0, 0, 1, 1,
0.2373819, -0.4890211, 1.967367, 1, 1, 1, 1, 1,
0.2376745, -1.348472, 3.164047, 1, 1, 1, 1, 1,
0.2464734, 0.7073309, -3.281684, 1, 1, 1, 1, 1,
0.2572896, -0.3018943, 2.710665, 1, 1, 1, 1, 1,
0.2575598, -0.5773235, 3.606817, 1, 1, 1, 1, 1,
0.25916, -1.20851, 2.825465, 1, 1, 1, 1, 1,
0.2628052, 0.989701, 1.99482, 1, 1, 1, 1, 1,
0.2658213, 0.8474709, 1.201853, 1, 1, 1, 1, 1,
0.2659384, 1.03279, 0.4424309, 1, 1, 1, 1, 1,
0.267113, -0.4286209, 2.792927, 1, 1, 1, 1, 1,
0.268874, -0.8944662, 3.633789, 1, 1, 1, 1, 1,
0.275225, 0.09540888, 2.555555, 1, 1, 1, 1, 1,
0.2761644, 1.689772, 0.784797, 1, 1, 1, 1, 1,
0.2808448, 1.112438, 1.625279, 1, 1, 1, 1, 1,
0.2903326, 0.3114037, 1.926857, 1, 1, 1, 1, 1,
0.2942744, 1.65644, -0.6627697, 0, 0, 1, 1, 1,
0.2949527, -0.4127085, 2.242686, 1, 0, 0, 1, 1,
0.2960809, -1.227194, 2.699846, 1, 0, 0, 1, 1,
0.2977624, -0.9105416, 2.907504, 1, 0, 0, 1, 1,
0.299517, 0.2836059, 1.249116, 1, 0, 0, 1, 1,
0.3003098, 1.03451, -0.8160754, 1, 0, 0, 1, 1,
0.3018385, -2.162216, 3.643878, 0, 0, 0, 1, 1,
0.3020552, -0.3225184, 3.42884, 0, 0, 0, 1, 1,
0.3040164, -1.029121, 0.2582987, 0, 0, 0, 1, 1,
0.3099357, -1.243735, 2.09415, 0, 0, 0, 1, 1,
0.3114947, -1.068836, 2.243611, 0, 0, 0, 1, 1,
0.3132431, -0.170305, 2.78732, 0, 0, 0, 1, 1,
0.3149305, -0.440727, 1.662388, 0, 0, 0, 1, 1,
0.3154284, 2.338512, -0.1365359, 1, 1, 1, 1, 1,
0.3257846, 1.070453, -0.2479188, 1, 1, 1, 1, 1,
0.3291129, -1.087792, 2.450227, 1, 1, 1, 1, 1,
0.3342238, 1.325261, 1.436702, 1, 1, 1, 1, 1,
0.3386062, -0.7183102, 2.798281, 1, 1, 1, 1, 1,
0.3392405, -0.8282771, 1.879601, 1, 1, 1, 1, 1,
0.3409284, 0.7964977, -0.5398386, 1, 1, 1, 1, 1,
0.3455201, -0.2861615, 3.559073, 1, 1, 1, 1, 1,
0.3462929, -1.070465, 2.946458, 1, 1, 1, 1, 1,
0.3520424, -2.707113, 2.728398, 1, 1, 1, 1, 1,
0.355738, -1.422823, 3.269928, 1, 1, 1, 1, 1,
0.3569801, 0.1955955, 1.062366, 1, 1, 1, 1, 1,
0.3635729, -0.2744776, 2.174783, 1, 1, 1, 1, 1,
0.3643045, -0.3007703, 1.366194, 1, 1, 1, 1, 1,
0.3681612, 0.9781141, 0.02257962, 1, 1, 1, 1, 1,
0.369398, 0.3654024, 0.3128717, 0, 0, 1, 1, 1,
0.372303, -0.5938419, 1.983341, 1, 0, 0, 1, 1,
0.3745692, 0.4919787, 1.445123, 1, 0, 0, 1, 1,
0.3746477, 1.131065, 0.8459517, 1, 0, 0, 1, 1,
0.3766243, -0.7245086, 3.410492, 1, 0, 0, 1, 1,
0.3770528, 2.345842, 0.5800573, 1, 0, 0, 1, 1,
0.3839314, 0.06377073, 1.236107, 0, 0, 0, 1, 1,
0.3850868, -0.9635994, 3.042541, 0, 0, 0, 1, 1,
0.3858782, -1.357036, 2.39743, 0, 0, 0, 1, 1,
0.3874703, 0.2715772, 1.118465, 0, 0, 0, 1, 1,
0.3895142, -0.3248726, 1.90125, 0, 0, 0, 1, 1,
0.3910915, 0.9325281, 0.2642554, 0, 0, 0, 1, 1,
0.3934469, 0.06204886, 0.06093184, 0, 0, 0, 1, 1,
0.3935402, -1.488668, 2.339221, 1, 1, 1, 1, 1,
0.3956111, 2.412898, -0.2391572, 1, 1, 1, 1, 1,
0.3971284, -0.002062048, 1.35147, 1, 1, 1, 1, 1,
0.3987966, -1.811277, 3.934757, 1, 1, 1, 1, 1,
0.400252, 0.07868094, 0.4187515, 1, 1, 1, 1, 1,
0.4078227, -0.5559685, 4.334466, 1, 1, 1, 1, 1,
0.4106307, 0.9141145, 1.396109, 1, 1, 1, 1, 1,
0.4129483, 0.1853515, 0.9068125, 1, 1, 1, 1, 1,
0.4141236, -1.108649, 3.455021, 1, 1, 1, 1, 1,
0.4168813, -0.8430456, 1.987456, 1, 1, 1, 1, 1,
0.4174336, 0.6169363, 0.448752, 1, 1, 1, 1, 1,
0.4202278, -0.3511391, 1.411081, 1, 1, 1, 1, 1,
0.4216383, 0.2901228, -0.3696499, 1, 1, 1, 1, 1,
0.4253391, -1.085916, 1.131311, 1, 1, 1, 1, 1,
0.4256263, -1.262268, 3.185529, 1, 1, 1, 1, 1,
0.4288474, 0.9114338, 0.9854347, 0, 0, 1, 1, 1,
0.4369071, 0.7218229, 1.360099, 1, 0, 0, 1, 1,
0.4372953, 0.1838873, -0.8763993, 1, 0, 0, 1, 1,
0.4444163, 0.3450706, 0.5280655, 1, 0, 0, 1, 1,
0.4486708, -0.7379075, 1.848088, 1, 0, 0, 1, 1,
0.4503832, 0.8038985, 0.5810838, 1, 0, 0, 1, 1,
0.4525596, 0.379264, -1.48269, 0, 0, 0, 1, 1,
0.4526583, -1.446348, 2.849446, 0, 0, 0, 1, 1,
0.4556473, -0.46845, 2.6373, 0, 0, 0, 1, 1,
0.4559219, -0.05358008, 0.709807, 0, 0, 0, 1, 1,
0.456846, 0.4108332, 0.3239933, 0, 0, 0, 1, 1,
0.4592898, 0.9144332, 2.194943, 0, 0, 0, 1, 1,
0.4613931, -1.076401, 1.804937, 0, 0, 0, 1, 1,
0.464261, -1.162439, 1.472555, 1, 1, 1, 1, 1,
0.4650348, 0.3820468, 0.8945923, 1, 1, 1, 1, 1,
0.467864, 0.2993519, 0.3555241, 1, 1, 1, 1, 1,
0.4682021, 0.225545, 1.885159, 1, 1, 1, 1, 1,
0.4697407, 2.352504, 0.7147139, 1, 1, 1, 1, 1,
0.4707114, -0.1374823, 2.651233, 1, 1, 1, 1, 1,
0.4723648, 1.375199, 1.723069, 1, 1, 1, 1, 1,
0.4726014, -0.842787, 2.726025, 1, 1, 1, 1, 1,
0.4859261, -0.2335103, 2.907192, 1, 1, 1, 1, 1,
0.486843, 1.912438, 0.7438652, 1, 1, 1, 1, 1,
0.4881215, 0.08886664, 1.37883, 1, 1, 1, 1, 1,
0.4951723, 2.107753, 0.02488209, 1, 1, 1, 1, 1,
0.498663, 0.7489455, 0.920164, 1, 1, 1, 1, 1,
0.504909, 0.2391677, 0.6885238, 1, 1, 1, 1, 1,
0.5050542, -0.5462908, 0.435739, 1, 1, 1, 1, 1,
0.5054268, 0.2548154, 2.174691, 0, 0, 1, 1, 1,
0.5054394, 1.537546, 0.8991824, 1, 0, 0, 1, 1,
0.5059854, 0.5398018, 2.969595, 1, 0, 0, 1, 1,
0.5077769, -0.0007218156, 1.813443, 1, 0, 0, 1, 1,
0.5084025, -0.4194742, 1.061017, 1, 0, 0, 1, 1,
0.5137216, 1.707869, 0.785221, 1, 0, 0, 1, 1,
0.5179261, 0.1740899, 0.1187738, 0, 0, 0, 1, 1,
0.5235265, -0.4267304, 1.489705, 0, 0, 0, 1, 1,
0.5268574, -0.7916886, 3.710879, 0, 0, 0, 1, 1,
0.5269463, 0.4971701, 1.107408, 0, 0, 0, 1, 1,
0.533408, 1.650761, 0.1224585, 0, 0, 0, 1, 1,
0.5370833, -0.4923163, 2.002837, 0, 0, 0, 1, 1,
0.5414611, 0.3257131, 0.7861923, 0, 0, 0, 1, 1,
0.5543253, 1.300757, 0.8689537, 1, 1, 1, 1, 1,
0.555451, -0.4441253, 1.205766, 1, 1, 1, 1, 1,
0.5603469, 0.1514531, 1.169651, 1, 1, 1, 1, 1,
0.5646989, -0.8998947, 1.586273, 1, 1, 1, 1, 1,
0.5661075, -0.9807259, 0.7613796, 1, 1, 1, 1, 1,
0.567585, 0.5989196, 0.9786834, 1, 1, 1, 1, 1,
0.5686239, 1.710696, 0.2469022, 1, 1, 1, 1, 1,
0.5707943, -0.2821678, 2.104149, 1, 1, 1, 1, 1,
0.5751228, 1.671812, 0.3267897, 1, 1, 1, 1, 1,
0.5775313, -0.7088178, 1.189801, 1, 1, 1, 1, 1,
0.5829819, -0.3905225, 3.301907, 1, 1, 1, 1, 1,
0.5841112, 1.169447, 0.3819828, 1, 1, 1, 1, 1,
0.5842205, 1.084749, 2.484448, 1, 1, 1, 1, 1,
0.5848715, -0.8043332, 2.319712, 1, 1, 1, 1, 1,
0.5889305, -0.7864214, 1.467444, 1, 1, 1, 1, 1,
0.5895165, 0.1101492, 2.055393, 0, 0, 1, 1, 1,
0.5943216, -1.043623, 1.924585, 1, 0, 0, 1, 1,
0.5963828, -0.1370437, 0.6832289, 1, 0, 0, 1, 1,
0.5965835, -0.1102253, 1.269057, 1, 0, 0, 1, 1,
0.59995, 0.03288143, 1.559198, 1, 0, 0, 1, 1,
0.6142164, -2.109921, 4.49272, 1, 0, 0, 1, 1,
0.6142351, 0.6643303, -0.4064971, 0, 0, 0, 1, 1,
0.6255284, -1.082355, 2.890679, 0, 0, 0, 1, 1,
0.626567, -2.123832, 1.926786, 0, 0, 0, 1, 1,
0.6283411, -1.810688, 1.228499, 0, 0, 0, 1, 1,
0.6314276, -0.888213, 2.141435, 0, 0, 0, 1, 1,
0.631758, -0.665927, 2.858761, 0, 0, 0, 1, 1,
0.6318644, 0.4718608, 1.438344, 0, 0, 0, 1, 1,
0.6322935, 0.7038311, 2.130997, 1, 1, 1, 1, 1,
0.6346983, 0.6313644, 1.250255, 1, 1, 1, 1, 1,
0.6363283, 1.254251, -0.2302479, 1, 1, 1, 1, 1,
0.6379327, 0.8980948, -0.460553, 1, 1, 1, 1, 1,
0.6436257, -1.050979, 4.512517, 1, 1, 1, 1, 1,
0.6486841, -0.5746383, 4.040086, 1, 1, 1, 1, 1,
0.6487057, -0.5305849, 2.61684, 1, 1, 1, 1, 1,
0.649259, 0.8408051, 1.071758, 1, 1, 1, 1, 1,
0.6493228, -0.467559, 2.093454, 1, 1, 1, 1, 1,
0.6563698, 2.43549, -1.369692, 1, 1, 1, 1, 1,
0.6593724, -0.1986999, 1.652438, 1, 1, 1, 1, 1,
0.6613427, 2.067345, 0.3377781, 1, 1, 1, 1, 1,
0.6630781, -0.2825747, 1.870669, 1, 1, 1, 1, 1,
0.6648228, -2.106476, 3.557266, 1, 1, 1, 1, 1,
0.6656693, 0.6602357, 0.997507, 1, 1, 1, 1, 1,
0.6704983, -0.05795459, 0.7162639, 0, 0, 1, 1, 1,
0.6705418, 1.215501, 1.984803, 1, 0, 0, 1, 1,
0.6722162, -0.8411402, 2.593448, 1, 0, 0, 1, 1,
0.6791604, -0.2251658, 1.735164, 1, 0, 0, 1, 1,
0.6791994, -0.0794448, 1.539319, 1, 0, 0, 1, 1,
0.6804352, 1.527795, -0.4828063, 1, 0, 0, 1, 1,
0.686259, 0.5645754, 1.925862, 0, 0, 0, 1, 1,
0.6891605, -1.467021, 2.268557, 0, 0, 0, 1, 1,
0.6934991, 1.415789, 1.161243, 0, 0, 0, 1, 1,
0.6990587, 1.502335, -0.06263746, 0, 0, 0, 1, 1,
0.6996149, -1.101891, 0.7880438, 0, 0, 0, 1, 1,
0.6997875, 1.549837, -1.074633, 0, 0, 0, 1, 1,
0.700098, -0.8532681, 2.032869, 0, 0, 0, 1, 1,
0.7002552, 0.8637896, 1.035297, 1, 1, 1, 1, 1,
0.7097353, -0.8858075, 2.895292, 1, 1, 1, 1, 1,
0.7225583, 0.7344778, -0.4479699, 1, 1, 1, 1, 1,
0.7268159, 0.0120034, 2.659577, 1, 1, 1, 1, 1,
0.7334044, 1.722396, 0.54915, 1, 1, 1, 1, 1,
0.735483, 1.057016, 0.9162158, 1, 1, 1, 1, 1,
0.7369892, 0.4985553, 2.556628, 1, 1, 1, 1, 1,
0.7387505, -0.6127389, 3.147912, 1, 1, 1, 1, 1,
0.7396694, -0.01979827, 2.561964, 1, 1, 1, 1, 1,
0.7399318, 0.09171481, 1.405117, 1, 1, 1, 1, 1,
0.7402761, 0.8071474, -1.243671, 1, 1, 1, 1, 1,
0.7425847, -0.8476824, 2.937946, 1, 1, 1, 1, 1,
0.7457832, -0.1347037, 1.000468, 1, 1, 1, 1, 1,
0.748167, 0.8244518, 1.82485, 1, 1, 1, 1, 1,
0.7502271, 1.293492, -1.146163, 1, 1, 1, 1, 1,
0.7510642, 1.735045, -0.9503993, 0, 0, 1, 1, 1,
0.7529106, -0.4659356, 2.02463, 1, 0, 0, 1, 1,
0.7548165, 0.9516822, 0.6211308, 1, 0, 0, 1, 1,
0.7654362, 0.5988646, 1.378437, 1, 0, 0, 1, 1,
0.7666945, -1.28279, 2.369388, 1, 0, 0, 1, 1,
0.7726026, 0.264161, 1.842515, 1, 0, 0, 1, 1,
0.7740048, -0.8145909, 2.550558, 0, 0, 0, 1, 1,
0.7842404, -0.4217213, 3.980958, 0, 0, 0, 1, 1,
0.7910368, 1.001185, -0.2862376, 0, 0, 0, 1, 1,
0.7929591, -0.1063903, 2.336015, 0, 0, 0, 1, 1,
0.7932401, 1.431402, 1.33446, 0, 0, 0, 1, 1,
0.7974573, -0.02820268, 2.122793, 0, 0, 0, 1, 1,
0.8022353, -0.6870071, 1.237349, 0, 0, 0, 1, 1,
0.802424, -1.903358, 2.042835, 1, 1, 1, 1, 1,
0.8090327, -1.008316, 3.516235, 1, 1, 1, 1, 1,
0.8102006, 0.9060332, 2.236659, 1, 1, 1, 1, 1,
0.8104588, 0.7796352, 1.775555, 1, 1, 1, 1, 1,
0.8105069, -1.433327, 1.975349, 1, 1, 1, 1, 1,
0.8127018, -0.02766678, 3.113948, 1, 1, 1, 1, 1,
0.8162413, 1.218835, 0.4491773, 1, 1, 1, 1, 1,
0.8172668, -0.3429756, 1.716123, 1, 1, 1, 1, 1,
0.8181517, -0.2193242, 2.732096, 1, 1, 1, 1, 1,
0.8219608, 0.2197213, 2.096645, 1, 1, 1, 1, 1,
0.8222964, -1.693703, 3.867548, 1, 1, 1, 1, 1,
0.8245603, -0.8099957, 2.207733, 1, 1, 1, 1, 1,
0.8264362, -2.06228, 4.760312, 1, 1, 1, 1, 1,
0.8280219, 0.4124075, 0.9968928, 1, 1, 1, 1, 1,
0.8282483, -0.180932, 2.025417, 1, 1, 1, 1, 1,
0.8304962, -0.506626, 3.53026, 0, 0, 1, 1, 1,
0.8315759, -0.4530288, 4.37284, 1, 0, 0, 1, 1,
0.8348423, -0.8865559, 4.00665, 1, 0, 0, 1, 1,
0.8434386, 0.2066649, -0.03813311, 1, 0, 0, 1, 1,
0.8498244, 0.5196131, 0.5454764, 1, 0, 0, 1, 1,
0.8498899, -0.07203814, 2.778284, 1, 0, 0, 1, 1,
0.854924, 0.05109401, 2.507725, 0, 0, 0, 1, 1,
0.8569869, 0.04346443, -0.5047057, 0, 0, 0, 1, 1,
0.8597459, -0.08704464, 1.166548, 0, 0, 0, 1, 1,
0.8608218, -0.3297772, 3.656033, 0, 0, 0, 1, 1,
0.8639904, 1.888299, 0.1641465, 0, 0, 0, 1, 1,
0.8666587, -0.6873947, 1.801568, 0, 0, 0, 1, 1,
0.8678312, -1.090262, 3.782903, 0, 0, 0, 1, 1,
0.8699395, -1.740986, 0.615764, 1, 1, 1, 1, 1,
0.8706421, -0.5654665, 3.565327, 1, 1, 1, 1, 1,
0.8765618, 0.3087957, 3.32088, 1, 1, 1, 1, 1,
0.8784061, 0.8659788, 0.5780417, 1, 1, 1, 1, 1,
0.8825733, -0.8999169, 2.796535, 1, 1, 1, 1, 1,
0.8854856, 0.9527915, 1.403328, 1, 1, 1, 1, 1,
0.8914561, 0.7140988, 0.2952525, 1, 1, 1, 1, 1,
0.8984566, -0.204991, 2.435791, 1, 1, 1, 1, 1,
0.9035028, 0.6133259, 0.4351082, 1, 1, 1, 1, 1,
0.9113182, -1.459874, 2.030186, 1, 1, 1, 1, 1,
0.9132793, 1.706574, 1.610795, 1, 1, 1, 1, 1,
0.9142507, -0.5962723, 1.361115, 1, 1, 1, 1, 1,
0.9167461, 0.4291376, 0.8263422, 1, 1, 1, 1, 1,
0.9201742, 1.028945, -0.4777071, 1, 1, 1, 1, 1,
0.9252635, 2.186175, 0.4183503, 1, 1, 1, 1, 1,
0.9259499, 2.82409, -0.1514858, 0, 0, 1, 1, 1,
0.930265, -0.9329234, 1.861164, 1, 0, 0, 1, 1,
0.9309931, 0.8455638, 1.716688, 1, 0, 0, 1, 1,
0.9354112, 0.3991158, 1.492963, 1, 0, 0, 1, 1,
0.9361921, -0.2627954, 1.967979, 1, 0, 0, 1, 1,
0.936435, 1.077106, 0.5309153, 1, 0, 0, 1, 1,
0.9384159, -0.2069552, 3.310065, 0, 0, 0, 1, 1,
0.9387065, 1.380341, 0.6317074, 0, 0, 0, 1, 1,
0.9464192, -0.332332, 4.21148, 0, 0, 0, 1, 1,
0.9478341, 2.649243, 0.5746737, 0, 0, 0, 1, 1,
0.9603485, 0.4329324, 2.915424, 0, 0, 0, 1, 1,
0.9633461, 0.1139089, 0.8538795, 0, 0, 0, 1, 1,
0.9701396, -0.2176491, 2.317786, 0, 0, 0, 1, 1,
0.9707061, 0.7788606, 1.388312, 1, 1, 1, 1, 1,
0.9717613, -0.6084241, 3.532936, 1, 1, 1, 1, 1,
0.973489, 1.798253, 1.327188, 1, 1, 1, 1, 1,
0.976841, 0.1301179, 1.696689, 1, 1, 1, 1, 1,
0.9773984, -0.8205917, 3.620309, 1, 1, 1, 1, 1,
0.9808449, 1.358004, 0.9900636, 1, 1, 1, 1, 1,
0.9808717, 0.2094993, -1.225098, 1, 1, 1, 1, 1,
0.9852638, -1.78507, 5.584946, 1, 1, 1, 1, 1,
0.9886054, 0.1880667, 0.991238, 1, 1, 1, 1, 1,
0.98879, 0.8636857, 2.055478, 1, 1, 1, 1, 1,
0.9910475, 0.3231485, 2.408136, 1, 1, 1, 1, 1,
0.995224, 0.1682172, 2.106292, 1, 1, 1, 1, 1,
0.9979597, -0.3640291, 3.09612, 1, 1, 1, 1, 1,
0.9986184, -0.213189, 2.26491, 1, 1, 1, 1, 1,
0.9986821, 1.38689, -0.4652998, 1, 1, 1, 1, 1,
1.003675, 0.4535234, 0.3386601, 0, 0, 1, 1, 1,
1.006682, -0.3149585, 2.509689, 1, 0, 0, 1, 1,
1.007805, -0.7830293, 3.633154, 1, 0, 0, 1, 1,
1.013328, 0.8858653, 0.3434341, 1, 0, 0, 1, 1,
1.025261, 0.8954113, -0.0953633, 1, 0, 0, 1, 1,
1.026308, -0.9809412, 1.57553, 1, 0, 0, 1, 1,
1.030839, -0.716627, 2.573425, 0, 0, 0, 1, 1,
1.039686, -0.5454255, 2.188999, 0, 0, 0, 1, 1,
1.046955, -0.6877517, 1.876595, 0, 0, 0, 1, 1,
1.048053, 0.6614442, 1.229371, 0, 0, 0, 1, 1,
1.064153, -0.402261, -0.3931082, 0, 0, 0, 1, 1,
1.064844, -0.2885502, 3.565214, 0, 0, 0, 1, 1,
1.067361, 0.4871831, 1.814098, 0, 0, 0, 1, 1,
1.068986, 0.7165693, 0.7210306, 1, 1, 1, 1, 1,
1.070037, -1.534523, 2.493156, 1, 1, 1, 1, 1,
1.074552, -0.4706284, 1.932793, 1, 1, 1, 1, 1,
1.076328, -0.1087251, 1.383582, 1, 1, 1, 1, 1,
1.078852, -0.8210444, 2.586544, 1, 1, 1, 1, 1,
1.091953, -1.794887, 2.768275, 1, 1, 1, 1, 1,
1.091972, 0.1890161, 2.461843, 1, 1, 1, 1, 1,
1.097011, 0.3211937, 1.152582, 1, 1, 1, 1, 1,
1.10527, 1.260659, 1.894102, 1, 1, 1, 1, 1,
1.1183, 0.1903516, 1.360672, 1, 1, 1, 1, 1,
1.129964, -1.508092, 3.169673, 1, 1, 1, 1, 1,
1.130331, 0.3867574, 2.763445, 1, 1, 1, 1, 1,
1.141774, -1.048415, 4.111567, 1, 1, 1, 1, 1,
1.147805, -0.3576163, 2.359656, 1, 1, 1, 1, 1,
1.15071, -0.01104868, 1.895647, 1, 1, 1, 1, 1,
1.151407, -1.227959, 3.605031, 0, 0, 1, 1, 1,
1.153507, -1.95018, 3.529621, 1, 0, 0, 1, 1,
1.156321, 0.6492094, 1.628808, 1, 0, 0, 1, 1,
1.161807, 0.5949979, 1.151814, 1, 0, 0, 1, 1,
1.173523, -0.2835651, 1.268581, 1, 0, 0, 1, 1,
1.177365, 1.768594, -0.6846354, 1, 0, 0, 1, 1,
1.185437, -0.02848546, 0.878229, 0, 0, 0, 1, 1,
1.186354, -1.310786, 3.408814, 0, 0, 0, 1, 1,
1.192396, 1.349122, 0.4840758, 0, 0, 0, 1, 1,
1.205132, -0.3087434, 0.9612394, 0, 0, 0, 1, 1,
1.219567, -0.5936482, 2.76436, 0, 0, 0, 1, 1,
1.219648, -0.04701092, 3.66381, 0, 0, 0, 1, 1,
1.219812, 0.9520784, 1.118138, 0, 0, 0, 1, 1,
1.221553, 1.265739, 0.69274, 1, 1, 1, 1, 1,
1.230374, -0.5809186, 1.959293, 1, 1, 1, 1, 1,
1.250752, 0.7866632, 0.6672314, 1, 1, 1, 1, 1,
1.255308, 2.131793, -1.842386, 1, 1, 1, 1, 1,
1.260076, 1.325886, -0.7340361, 1, 1, 1, 1, 1,
1.262784, 0.6530222, 0.8995614, 1, 1, 1, 1, 1,
1.262882, -0.2764584, 4.129755, 1, 1, 1, 1, 1,
1.269487, -0.3061048, 1.762915, 1, 1, 1, 1, 1,
1.273216, 1.022697, 1.205667, 1, 1, 1, 1, 1,
1.275981, -0.6371222, 2.97247, 1, 1, 1, 1, 1,
1.277102, 0.2893595, 2.952766, 1, 1, 1, 1, 1,
1.279084, 0.4143944, 0.2875555, 1, 1, 1, 1, 1,
1.300694, -1.531574, 1.110305, 1, 1, 1, 1, 1,
1.302409, 1.306644, 1.172765, 1, 1, 1, 1, 1,
1.30753, 1.923084, -1.540638, 1, 1, 1, 1, 1,
1.30866, -0.4215796, 2.681928, 0, 0, 1, 1, 1,
1.323099, -0.1774825, 1.121559, 1, 0, 0, 1, 1,
1.332555, 1.661022, 1.298162, 1, 0, 0, 1, 1,
1.33511, -0.545839, 2.01422, 1, 0, 0, 1, 1,
1.342564, -0.5262137, 2.519183, 1, 0, 0, 1, 1,
1.35373, 1.158561, 1.791962, 1, 0, 0, 1, 1,
1.365211, 1.915624, -0.4322081, 0, 0, 0, 1, 1,
1.371286, -0.5786027, 3.198832, 0, 0, 0, 1, 1,
1.389005, -0.1118175, 1.495711, 0, 0, 0, 1, 1,
1.395562, -0.09612907, 1.837064, 0, 0, 0, 1, 1,
1.419652, 0.04383142, 1.758221, 0, 0, 0, 1, 1,
1.424471, 0.08394417, 1.432813, 0, 0, 0, 1, 1,
1.426068, -1.015738, 2.106146, 0, 0, 0, 1, 1,
1.444882, -0.8781459, 1.987195, 1, 1, 1, 1, 1,
1.445526, -1.644504, 2.028105, 1, 1, 1, 1, 1,
1.448906, -1.984469, 2.859346, 1, 1, 1, 1, 1,
1.452822, -0.8004861, 0.4633502, 1, 1, 1, 1, 1,
1.45437, 2.120264, 0.4751757, 1, 1, 1, 1, 1,
1.46909, 0.8297678, -0.7330108, 1, 1, 1, 1, 1,
1.472428, -0.3140037, 2.411874, 1, 1, 1, 1, 1,
1.477538, -1.659, 3.437347, 1, 1, 1, 1, 1,
1.50983, -0.9278159, 3.244456, 1, 1, 1, 1, 1,
1.511776, -2.026182, 1.511972, 1, 1, 1, 1, 1,
1.515922, 0.8927891, -0.1239142, 1, 1, 1, 1, 1,
1.523558, 1.281288, 1.354055, 1, 1, 1, 1, 1,
1.531536, -0.7570518, 0.9264404, 1, 1, 1, 1, 1,
1.550274, 0.9994789, 1.708478, 1, 1, 1, 1, 1,
1.560562, -1.110225, 1.570407, 1, 1, 1, 1, 1,
1.566718, -0.1702224, 1.415103, 0, 0, 1, 1, 1,
1.591625, 0.140362, 2.270743, 1, 0, 0, 1, 1,
1.592486, 2.226586, 2.01571, 1, 0, 0, 1, 1,
1.602071, 1.365282, 1.725363, 1, 0, 0, 1, 1,
1.604578, -0.6961652, 1.044796, 1, 0, 0, 1, 1,
1.60765, -0.5085859, 1.476486, 1, 0, 0, 1, 1,
1.623354, 1.255769, -1.805442, 0, 0, 0, 1, 1,
1.656858, 0.7710968, 0.8392032, 0, 0, 0, 1, 1,
1.662095, 0.6818692, -0.5451441, 0, 0, 0, 1, 1,
1.676102, -0.2516195, 2.187412, 0, 0, 0, 1, 1,
1.686455, 0.9513367, 0.3315369, 0, 0, 0, 1, 1,
1.688998, 1.739642, -0.2366086, 0, 0, 0, 1, 1,
1.698304, 0.4795274, 0.5217434, 0, 0, 0, 1, 1,
1.705531, -0.8741624, 0.2705551, 1, 1, 1, 1, 1,
1.710634, -1.124457, 2.219308, 1, 1, 1, 1, 1,
1.71397, 0.009001934, 2.612309, 1, 1, 1, 1, 1,
1.768695, 1.217987, 1.941122, 1, 1, 1, 1, 1,
1.80164, -0.09473985, 1.740547, 1, 1, 1, 1, 1,
1.80448, -1.06242, 3.799549, 1, 1, 1, 1, 1,
1.834674, -0.02696846, 0.5346907, 1, 1, 1, 1, 1,
1.840991, -0.4160833, 2.682503, 1, 1, 1, 1, 1,
1.851514, -0.0624802, 2.044394, 1, 1, 1, 1, 1,
1.86926, -0.4608632, 1.125649, 1, 1, 1, 1, 1,
1.881216, -1.492658, 2.219288, 1, 1, 1, 1, 1,
1.928709, -1.033068, 2.0069, 1, 1, 1, 1, 1,
1.985155, -1.88813, 3.951538, 1, 1, 1, 1, 1,
2.003143, -1.184077, 3.239351, 1, 1, 1, 1, 1,
2.008457, -2.384729, 1.504489, 1, 1, 1, 1, 1,
2.041168, -0.07420283, 2.575263, 0, 0, 1, 1, 1,
2.062641, -0.3217266, 0.2871766, 1, 0, 0, 1, 1,
2.063263, -0.242581, -0.1601338, 1, 0, 0, 1, 1,
2.136238, -0.8854533, 2.593184, 1, 0, 0, 1, 1,
2.152957, -0.09991958, 2.122847, 1, 0, 0, 1, 1,
2.194316, -0.04528059, 1.495009, 1, 0, 0, 1, 1,
2.203654, -0.6629347, 1.355917, 0, 0, 0, 1, 1,
2.216682, -0.1934578, 1.987782, 0, 0, 0, 1, 1,
2.316352, -0.6589385, 2.008689, 0, 0, 0, 1, 1,
2.335662, 0.6529518, 2.480723, 0, 0, 0, 1, 1,
2.345818, -0.3949449, 3.320251, 0, 0, 0, 1, 1,
2.397013, 0.6177184, 2.309179, 0, 0, 0, 1, 1,
2.422342, 0.8233463, 2.162338, 0, 0, 0, 1, 1,
2.484382, 0.0490404, 1.089695, 1, 1, 1, 1, 1,
2.565812, 1.004121, 0.8220918, 1, 1, 1, 1, 1,
2.6011, -0.5919972, 2.337659, 1, 1, 1, 1, 1,
2.738347, -1.997481, 1.38703, 1, 1, 1, 1, 1,
2.74832, 0.2507728, 2.603452, 1, 1, 1, 1, 1,
2.816387, 1.004838, 0.9189744, 1, 1, 1, 1, 1,
3.019724, 2.875051, 0.691068, 1, 1, 1, 1, 1
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
var radius = 10.04763;
var distance = 35.29189;
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
mvMatrix.translate( 0.1839309, -0.02493429, 0.5522623 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.29189);
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