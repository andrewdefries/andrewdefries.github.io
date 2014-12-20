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
-2.848846, 1.981833, -1.33545, 1, 0, 0, 1,
-2.813878, 1.246354, -1.118438, 1, 0.007843138, 0, 1,
-2.521756, 0.4980676, 1.131009, 1, 0.01176471, 0, 1,
-2.453015, -1.109282, -3.411096, 1, 0.01960784, 0, 1,
-2.431967, 0.3584945, -1.078542, 1, 0.02352941, 0, 1,
-2.350674, 2.28245, -1.185885, 1, 0.03137255, 0, 1,
-2.305025, -0.5580162, -1.450644, 1, 0.03529412, 0, 1,
-2.195044, -0.6118143, -3.637776, 1, 0.04313726, 0, 1,
-2.180561, 2.070741, 0.2177606, 1, 0.04705882, 0, 1,
-2.162414, -0.6072969, -2.302546, 1, 0.05490196, 0, 1,
-2.16117, 1.089661, -2.16205, 1, 0.05882353, 0, 1,
-2.124877, -1.203226, -1.512734, 1, 0.06666667, 0, 1,
-2.12046, 1.585608, -2.928579, 1, 0.07058824, 0, 1,
-2.096957, -0.3745129, -1.185092, 1, 0.07843138, 0, 1,
-2.094968, -0.5556798, -1.396064, 1, 0.08235294, 0, 1,
-2.036791, 0.3706662, -0.7083823, 1, 0.09019608, 0, 1,
-1.959614, 0.6221409, -3.001519, 1, 0.09411765, 0, 1,
-1.958658, -0.7201726, -2.865894, 1, 0.1019608, 0, 1,
-1.928979, 0.5556768, -1.603398, 1, 0.1098039, 0, 1,
-1.92406, -2.67175, -2.398857, 1, 0.1137255, 0, 1,
-1.902017, 1.711141, 0.9183408, 1, 0.1215686, 0, 1,
-1.867744, -0.07536197, -2.309875, 1, 0.1254902, 0, 1,
-1.861496, 1.313459, -1.268531, 1, 0.1333333, 0, 1,
-1.809733, -0.8198484, -1.01212, 1, 0.1372549, 0, 1,
-1.805694, -0.9702942, -2.585334, 1, 0.145098, 0, 1,
-1.801547, 1.554227, -1.468543, 1, 0.1490196, 0, 1,
-1.794886, 1.320758, -0.7222999, 1, 0.1568628, 0, 1,
-1.785672, -1.481607, -1.888205, 1, 0.1607843, 0, 1,
-1.773878, 1.313984, -0.518975, 1, 0.1686275, 0, 1,
-1.761708, 0.6650925, -1.667994, 1, 0.172549, 0, 1,
-1.758107, 0.4920586, -1.763406, 1, 0.1803922, 0, 1,
-1.754643, -1.032212, -3.096862, 1, 0.1843137, 0, 1,
-1.75371, -0.3639013, -1.826555, 1, 0.1921569, 0, 1,
-1.74463, -0.7631454, -0.9204509, 1, 0.1960784, 0, 1,
-1.725956, -1.535985, -4.523847, 1, 0.2039216, 0, 1,
-1.722445, 0.06263056, -1.938789, 1, 0.2117647, 0, 1,
-1.722388, -1.304624, -2.128766, 1, 0.2156863, 0, 1,
-1.720496, -1.526484, -3.123163, 1, 0.2235294, 0, 1,
-1.71276, 0.7407441, -0.3937748, 1, 0.227451, 0, 1,
-1.71, 1.624367, 0.1941825, 1, 0.2352941, 0, 1,
-1.708576, -0.1674556, -1.855617, 1, 0.2392157, 0, 1,
-1.70795, -0.3198881, -2.791968, 1, 0.2470588, 0, 1,
-1.650201, 0.1128475, -0.3475022, 1, 0.2509804, 0, 1,
-1.643864, 0.1270647, -2.742027, 1, 0.2588235, 0, 1,
-1.636862, 1.792972, -2.046124, 1, 0.2627451, 0, 1,
-1.623494, -0.4726384, -1.016625, 1, 0.2705882, 0, 1,
-1.616536, -1.728177, -0.7608177, 1, 0.2745098, 0, 1,
-1.600619, 0.4255017, -1.666059, 1, 0.282353, 0, 1,
-1.598042, -1.16371, -2.218893, 1, 0.2862745, 0, 1,
-1.587429, -0.8566772, -2.902478, 1, 0.2941177, 0, 1,
-1.586366, -2.783628, -3.618511, 1, 0.3019608, 0, 1,
-1.585447, 0.14015, -1.70945, 1, 0.3058824, 0, 1,
-1.583266, 0.7990294, -1.20077, 1, 0.3137255, 0, 1,
-1.550807, 0.06330636, -2.233938, 1, 0.3176471, 0, 1,
-1.544493, -0.5493113, -1.103188, 1, 0.3254902, 0, 1,
-1.540363, -0.2288402, -2.534981, 1, 0.3294118, 0, 1,
-1.534321, 0.4331972, -1.240161, 1, 0.3372549, 0, 1,
-1.520291, 0.7181435, -0.6599322, 1, 0.3411765, 0, 1,
-1.518112, -0.0008867845, 0.1054247, 1, 0.3490196, 0, 1,
-1.517324, -0.2690264, -0.5633539, 1, 0.3529412, 0, 1,
-1.516435, -1.655022, -2.72503, 1, 0.3607843, 0, 1,
-1.503974, 1.295256, -2.256905, 1, 0.3647059, 0, 1,
-1.502863, 0.04799365, -3.273957, 1, 0.372549, 0, 1,
-1.495084, 0.09468446, -1.187898, 1, 0.3764706, 0, 1,
-1.494075, 1.599264, -0.1703413, 1, 0.3843137, 0, 1,
-1.477376, -1.172645, -2.713182, 1, 0.3882353, 0, 1,
-1.465665, -0.5790283, -4.466707, 1, 0.3960784, 0, 1,
-1.462999, -0.7026106, -1.48109, 1, 0.4039216, 0, 1,
-1.459358, 0.04589021, -1.728619, 1, 0.4078431, 0, 1,
-1.456653, 0.2744378, -2.338995, 1, 0.4156863, 0, 1,
-1.444685, -0.4476933, -3.084789, 1, 0.4196078, 0, 1,
-1.425867, 0.9473485, -1.010448, 1, 0.427451, 0, 1,
-1.42052, 0.06735025, -0.8266321, 1, 0.4313726, 0, 1,
-1.417162, -0.009464842, 1.279691, 1, 0.4392157, 0, 1,
-1.414167, -0.1841216, -2.916225, 1, 0.4431373, 0, 1,
-1.412862, 0.001785548, -2.257744, 1, 0.4509804, 0, 1,
-1.410046, 0.1546632, -1.162265, 1, 0.454902, 0, 1,
-1.408986, 0.03501905, -2.332186, 1, 0.4627451, 0, 1,
-1.408797, -0.504569, -1.108163, 1, 0.4666667, 0, 1,
-1.402555, -0.1232906, -1.008768, 1, 0.4745098, 0, 1,
-1.399332, -0.7676341, -2.725893, 1, 0.4784314, 0, 1,
-1.398957, -0.8352008, -2.75711, 1, 0.4862745, 0, 1,
-1.394667, 0.0898646, -1.825136, 1, 0.4901961, 0, 1,
-1.382357, -0.2273132, -1.577517, 1, 0.4980392, 0, 1,
-1.374256, 1.783689, 0.175362, 1, 0.5058824, 0, 1,
-1.350569, 0.3345304, -0.58308, 1, 0.509804, 0, 1,
-1.349913, -0.01643985, -1.720315, 1, 0.5176471, 0, 1,
-1.339795, 0.009089686, -1.755789, 1, 0.5215687, 0, 1,
-1.339166, 0.0001511091, -0.9823478, 1, 0.5294118, 0, 1,
-1.336165, 2.761248, 0.2360133, 1, 0.5333334, 0, 1,
-1.329875, -0.4857824, -1.842228, 1, 0.5411765, 0, 1,
-1.313982, 1.653111, -2.62448, 1, 0.5450981, 0, 1,
-1.30879, 0.9835685, -0.7404724, 1, 0.5529412, 0, 1,
-1.30255, 1.544186, -1.747594, 1, 0.5568628, 0, 1,
-1.298764, 1.044908, -2.395032, 1, 0.5647059, 0, 1,
-1.289958, -2.051887, -0.6950623, 1, 0.5686275, 0, 1,
-1.280021, -0.3384308, -2.294107, 1, 0.5764706, 0, 1,
-1.26166, -0.5790628, -0.7175173, 1, 0.5803922, 0, 1,
-1.258982, -1.848003, -2.44308, 1, 0.5882353, 0, 1,
-1.251006, 0.317582, -2.006895, 1, 0.5921569, 0, 1,
-1.242768, -0.06859172, -1.913394, 1, 0.6, 0, 1,
-1.242554, -0.3925152, -3.241156, 1, 0.6078432, 0, 1,
-1.201878, 0.9994633, -1.723501, 1, 0.6117647, 0, 1,
-1.199914, 0.1712038, -0.1205857, 1, 0.6196079, 0, 1,
-1.196448, -0.2172123, 0.2704028, 1, 0.6235294, 0, 1,
-1.179604, -0.9192046, -2.350737, 1, 0.6313726, 0, 1,
-1.178296, 0.1765787, -1.589872, 1, 0.6352941, 0, 1,
-1.176663, -0.8120927, -1.627596, 1, 0.6431373, 0, 1,
-1.175899, 0.0720752, -0.32336, 1, 0.6470588, 0, 1,
-1.170592, 0.08861726, -0.2313929, 1, 0.654902, 0, 1,
-1.170491, 0.4416195, 1.360271, 1, 0.6588235, 0, 1,
-1.165863, 0.546811, -1.798983, 1, 0.6666667, 0, 1,
-1.152349, 1.183427, -1.94987, 1, 0.6705883, 0, 1,
-1.151575, -1.036224, -1.934888, 1, 0.6784314, 0, 1,
-1.14623, -0.5430967, -0.9551535, 1, 0.682353, 0, 1,
-1.125244, -2.462765, -2.564082, 1, 0.6901961, 0, 1,
-1.125193, -0.2634531, -1.745952, 1, 0.6941177, 0, 1,
-1.120095, -0.3073033, -1.896438, 1, 0.7019608, 0, 1,
-1.119366, 0.8200594, 0.0526393, 1, 0.7098039, 0, 1,
-1.107162, -0.4785594, -0.4610557, 1, 0.7137255, 0, 1,
-1.103062, -0.7105232, -2.034143, 1, 0.7215686, 0, 1,
-1.100108, -0.7121227, -3.707678, 1, 0.7254902, 0, 1,
-1.092669, -0.2238648, -2.268787, 1, 0.7333333, 0, 1,
-1.081463, -1.060212, -3.803921, 1, 0.7372549, 0, 1,
-1.078209, -1.823479, -3.937694, 1, 0.7450981, 0, 1,
-1.078073, -0.01828399, -1.561535, 1, 0.7490196, 0, 1,
-1.076897, 1.522788, -1.3536, 1, 0.7568628, 0, 1,
-1.074189, 1.06719, -1.172818, 1, 0.7607843, 0, 1,
-1.072197, 0.6953642, -1.545289, 1, 0.7686275, 0, 1,
-1.070542, 0.5542499, -0.8945634, 1, 0.772549, 0, 1,
-1.067465, 0.4429339, -0.938626, 1, 0.7803922, 0, 1,
-1.063358, 0.9519562, -1.551317, 1, 0.7843137, 0, 1,
-1.063013, -1.233941, -3.328748, 1, 0.7921569, 0, 1,
-1.057238, -0.6356917, -2.042228, 1, 0.7960784, 0, 1,
-1.053275, 0.7690603, -1.469103, 1, 0.8039216, 0, 1,
-1.052399, -1.071444, -3.429238, 1, 0.8117647, 0, 1,
-1.045539, -0.2374857, -4.397357, 1, 0.8156863, 0, 1,
-1.044797, -0.7322641, -3.01651, 1, 0.8235294, 0, 1,
-1.041437, -0.0632168, -0.5966168, 1, 0.827451, 0, 1,
-1.033295, -1.277574, -2.779734, 1, 0.8352941, 0, 1,
-1.032955, -0.8651828, -0.4621165, 1, 0.8392157, 0, 1,
-1.032583, 0.9490904, -0.2099212, 1, 0.8470588, 0, 1,
-1.031846, -0.9241388, -2.617149, 1, 0.8509804, 0, 1,
-1.031199, -1.088742, -1.65602, 1, 0.8588235, 0, 1,
-1.030707, 0.7956057, -1.797483, 1, 0.8627451, 0, 1,
-1.028263, -0.1768381, -2.445588, 1, 0.8705882, 0, 1,
-1.012724, -0.4089063, -2.189903, 1, 0.8745098, 0, 1,
-1.009906, 0.8958828, -1.795396, 1, 0.8823529, 0, 1,
-1.007783, 0.07663277, -0.8334886, 1, 0.8862745, 0, 1,
-0.9900509, -1.710307, -4.475435, 1, 0.8941177, 0, 1,
-0.9829985, -0.1582394, -2.168323, 1, 0.8980392, 0, 1,
-0.9814258, 0.4251805, -1.439367, 1, 0.9058824, 0, 1,
-0.9782906, -0.8491194, -3.148474, 1, 0.9137255, 0, 1,
-0.960582, 0.5190217, -1.101755, 1, 0.9176471, 0, 1,
-0.9602297, -1.098254, -3.920506, 1, 0.9254902, 0, 1,
-0.95795, -0.206282, -2.797624, 1, 0.9294118, 0, 1,
-0.9569265, -0.08405085, -1.754507, 1, 0.9372549, 0, 1,
-0.9497406, -1.54273, -2.400066, 1, 0.9411765, 0, 1,
-0.9429639, -0.4939319, -3.141271, 1, 0.9490196, 0, 1,
-0.9267573, 1.020098, -1.487354, 1, 0.9529412, 0, 1,
-0.9248847, -1.747213, -2.904559, 1, 0.9607843, 0, 1,
-0.9239663, -0.343924, -3.623658, 1, 0.9647059, 0, 1,
-0.9212314, 0.5535548, -1.32782, 1, 0.972549, 0, 1,
-0.9195886, 1.603099, -1.099783, 1, 0.9764706, 0, 1,
-0.9149522, -0.8423584, -3.432111, 1, 0.9843137, 0, 1,
-0.912731, 0.5957425, -0.03531945, 1, 0.9882353, 0, 1,
-0.9081835, 2.259488, 0.9087916, 1, 0.9960784, 0, 1,
-0.9059516, -1.09103, -1.973332, 0.9960784, 1, 0, 1,
-0.9039803, -1.111932, -3.698197, 0.9921569, 1, 0, 1,
-0.903412, -1.615795, -3.263674, 0.9843137, 1, 0, 1,
-0.9004561, -1.391072, -2.564218, 0.9803922, 1, 0, 1,
-0.8903126, -1.04764, -4.766119, 0.972549, 1, 0, 1,
-0.8896991, -0.002661057, -1.165932, 0.9686275, 1, 0, 1,
-0.8851691, 1.291029, -1.924311, 0.9607843, 1, 0, 1,
-0.8830084, -0.5824298, -0.2536663, 0.9568627, 1, 0, 1,
-0.8789872, -0.7016281, -3.14659, 0.9490196, 1, 0, 1,
-0.8788252, -0.3367118, -1.49356, 0.945098, 1, 0, 1,
-0.8761539, 1.443998, -0.266756, 0.9372549, 1, 0, 1,
-0.875019, 0.4250354, -0.5255359, 0.9333333, 1, 0, 1,
-0.8670839, -0.7757109, -2.717599, 0.9254902, 1, 0, 1,
-0.8661262, -0.03375763, -2.04408, 0.9215686, 1, 0, 1,
-0.8623877, -0.2562672, -1.79966, 0.9137255, 1, 0, 1,
-0.8535683, 0.526494, -0.7928421, 0.9098039, 1, 0, 1,
-0.8497262, 0.09396826, -2.777723, 0.9019608, 1, 0, 1,
-0.8431611, -0.007664977, -2.322431, 0.8941177, 1, 0, 1,
-0.8392801, -0.2278535, -0.5531818, 0.8901961, 1, 0, 1,
-0.83682, -0.8042521, -2.706213, 0.8823529, 1, 0, 1,
-0.8349415, 0.1056048, -0.5959933, 0.8784314, 1, 0, 1,
-0.8332167, 1.143155, -0.3781161, 0.8705882, 1, 0, 1,
-0.8284641, 0.386675, -1.691128, 0.8666667, 1, 0, 1,
-0.8208666, -0.4724856, -0.9637107, 0.8588235, 1, 0, 1,
-0.8115516, 1.18917, -0.745884, 0.854902, 1, 0, 1,
-0.8106112, 1.419467, -1.215937, 0.8470588, 1, 0, 1,
-0.8091029, -0.5040079, -1.21305, 0.8431373, 1, 0, 1,
-0.8082116, -1.420936, -2.660722, 0.8352941, 1, 0, 1,
-0.806136, -0.5711524, -2.276556, 0.8313726, 1, 0, 1,
-0.8024876, -0.2685662, -2.973346, 0.8235294, 1, 0, 1,
-0.8019229, -0.4128108, -1.646925, 0.8196079, 1, 0, 1,
-0.8010377, 1.445037, -1.749331, 0.8117647, 1, 0, 1,
-0.7997668, -0.4680555, -3.772281, 0.8078431, 1, 0, 1,
-0.7994222, 0.7869195, -2.93511, 0.8, 1, 0, 1,
-0.7970541, -1.006134, -0.623731, 0.7921569, 1, 0, 1,
-0.7963728, 0.0883624, -1.402313, 0.7882353, 1, 0, 1,
-0.7928155, 1.52993, -1.133292, 0.7803922, 1, 0, 1,
-0.7875786, 0.4374104, -1.908937, 0.7764706, 1, 0, 1,
-0.7851558, -0.4465915, -2.348723, 0.7686275, 1, 0, 1,
-0.7820952, -0.585942, -1.884316, 0.7647059, 1, 0, 1,
-0.7706909, 0.7808439, -1.014512, 0.7568628, 1, 0, 1,
-0.7667914, 1.19292, 0.5523152, 0.7529412, 1, 0, 1,
-0.7602957, 0.0263203, -0.1177218, 0.7450981, 1, 0, 1,
-0.7577201, -0.8498421, -3.536418, 0.7411765, 1, 0, 1,
-0.7573618, -1.237089, -3.405152, 0.7333333, 1, 0, 1,
-0.7569134, 0.02630041, 0.1680404, 0.7294118, 1, 0, 1,
-0.7544419, 1.579463, -0.3305371, 0.7215686, 1, 0, 1,
-0.7536875, 0.987, -1.200772, 0.7176471, 1, 0, 1,
-0.7471817, 1.126082, 0.3331502, 0.7098039, 1, 0, 1,
-0.7467923, 0.96443, 0.5404495, 0.7058824, 1, 0, 1,
-0.7366281, 0.03093666, -2.765652, 0.6980392, 1, 0, 1,
-0.7356864, 1.854155, -0.03006551, 0.6901961, 1, 0, 1,
-0.733478, -1.147729, -3.230227, 0.6862745, 1, 0, 1,
-0.7317497, 0.06979178, -3.51778, 0.6784314, 1, 0, 1,
-0.7303094, -0.3273149, -0.7375315, 0.6745098, 1, 0, 1,
-0.7221386, -0.2508359, -2.008704, 0.6666667, 1, 0, 1,
-0.7178894, -1.863744, -2.255153, 0.6627451, 1, 0, 1,
-0.7140489, -0.3661385, -0.439883, 0.654902, 1, 0, 1,
-0.7134675, -0.4130844, -3.103649, 0.6509804, 1, 0, 1,
-0.7110896, 1.865614, -0.6117095, 0.6431373, 1, 0, 1,
-0.7097869, 2.378661, -0.1708379, 0.6392157, 1, 0, 1,
-0.7084687, -0.8169557, -0.5000843, 0.6313726, 1, 0, 1,
-0.7065, 0.2914836, -1.922269, 0.627451, 1, 0, 1,
-0.7032575, -1.086107, -4.043693, 0.6196079, 1, 0, 1,
-0.7003899, 2.241659, -1.482077, 0.6156863, 1, 0, 1,
-0.697326, -0.05113723, -1.648234, 0.6078432, 1, 0, 1,
-0.6922536, 0.1726585, -0.7123233, 0.6039216, 1, 0, 1,
-0.6891622, 0.2556352, -1.457682, 0.5960785, 1, 0, 1,
-0.6879961, 1.108856, -0.8911401, 0.5882353, 1, 0, 1,
-0.675065, 0.5632904, -0.3136027, 0.5843138, 1, 0, 1,
-0.6655406, 1.100862, -0.6395191, 0.5764706, 1, 0, 1,
-0.6647459, 0.07067906, 0.8846232, 0.572549, 1, 0, 1,
-0.6623928, 0.7864097, -1.35723, 0.5647059, 1, 0, 1,
-0.6577197, -1.213811, -4.457952, 0.5607843, 1, 0, 1,
-0.6562454, 3.069685, 1.004837, 0.5529412, 1, 0, 1,
-0.6553146, -2.087274, -2.166165, 0.5490196, 1, 0, 1,
-0.654071, 0.6004886, 0.7090778, 0.5411765, 1, 0, 1,
-0.6535489, -2.108907, -2.481508, 0.5372549, 1, 0, 1,
-0.6523648, -0.7462572, -1.175868, 0.5294118, 1, 0, 1,
-0.650623, -1.758473, -2.535088, 0.5254902, 1, 0, 1,
-0.6487005, -2.023, -1.672408, 0.5176471, 1, 0, 1,
-0.6449339, -1.117015, -2.349759, 0.5137255, 1, 0, 1,
-0.6440179, 0.2899901, -0.173321, 0.5058824, 1, 0, 1,
-0.6438769, 1.432697, 0.7157049, 0.5019608, 1, 0, 1,
-0.6434969, 0.7345131, -0.7561726, 0.4941176, 1, 0, 1,
-0.6393658, 0.2131672, -0.2820514, 0.4862745, 1, 0, 1,
-0.6390084, 1.010388, -0.7772321, 0.4823529, 1, 0, 1,
-0.632515, 0.8248445, -1.275248, 0.4745098, 1, 0, 1,
-0.6302397, 2.091553, 0.6036424, 0.4705882, 1, 0, 1,
-0.6300807, -1.266256, -1.946508, 0.4627451, 1, 0, 1,
-0.6256191, -2.041767, -2.85523, 0.4588235, 1, 0, 1,
-0.6232169, -1.297421, -1.173376, 0.4509804, 1, 0, 1,
-0.6231392, 0.8693277, 0.9237794, 0.4470588, 1, 0, 1,
-0.6147376, -1.17371, -4.767956, 0.4392157, 1, 0, 1,
-0.6132064, -0.02117142, -1.666741, 0.4352941, 1, 0, 1,
-0.6109163, -1.992126, -1.562858, 0.427451, 1, 0, 1,
-0.6108578, -0.629437, -1.051436, 0.4235294, 1, 0, 1,
-0.60984, -0.882852, -0.6937304, 0.4156863, 1, 0, 1,
-0.5989241, 2.390872, 0.6928697, 0.4117647, 1, 0, 1,
-0.5950755, 0.9185415, -0.7429454, 0.4039216, 1, 0, 1,
-0.5882009, 2.93938, -0.5420176, 0.3960784, 1, 0, 1,
-0.5846936, -0.5060843, -3.001256, 0.3921569, 1, 0, 1,
-0.5828815, 0.2011058, -3.367019, 0.3843137, 1, 0, 1,
-0.5816614, 1.074747, 1.045893, 0.3803922, 1, 0, 1,
-0.578729, -0.440306, -1.810545, 0.372549, 1, 0, 1,
-0.5716494, 2.147045, -0.9973294, 0.3686275, 1, 0, 1,
-0.566017, -2.088335, -3.128917, 0.3607843, 1, 0, 1,
-0.5621244, -0.1293867, -3.297039, 0.3568628, 1, 0, 1,
-0.5594994, -1.674938, -2.555051, 0.3490196, 1, 0, 1,
-0.5542729, 1.600664, -0.1624953, 0.345098, 1, 0, 1,
-0.5521712, 0.7401986, -1.515712, 0.3372549, 1, 0, 1,
-0.5520887, 1.868393, -0.2115946, 0.3333333, 1, 0, 1,
-0.549579, -0.5459379, -3.276171, 0.3254902, 1, 0, 1,
-0.5476341, 1.488926, -1.367219, 0.3215686, 1, 0, 1,
-0.5442749, 0.6734277, -0.7648401, 0.3137255, 1, 0, 1,
-0.5431809, 0.1086623, -1.901208, 0.3098039, 1, 0, 1,
-0.5426657, 1.997103, -0.4904901, 0.3019608, 1, 0, 1,
-0.5389332, 1.157706, -0.6074837, 0.2941177, 1, 0, 1,
-0.537791, 1.06808, -2.47253, 0.2901961, 1, 0, 1,
-0.5300674, -1.841816, -1.733125, 0.282353, 1, 0, 1,
-0.5286856, 1.463555, 0.9917569, 0.2784314, 1, 0, 1,
-0.5263783, 0.006418483, 0.1659771, 0.2705882, 1, 0, 1,
-0.5252811, -1.654559, -4.495349, 0.2666667, 1, 0, 1,
-0.5212111, 0.3367228, -1.454312, 0.2588235, 1, 0, 1,
-0.5195512, -1.588978, -2.146489, 0.254902, 1, 0, 1,
-0.5169449, 1.02488, 0.6247487, 0.2470588, 1, 0, 1,
-0.5155658, -0.4573332, -3.733745, 0.2431373, 1, 0, 1,
-0.5129224, -0.4392243, -1.167941, 0.2352941, 1, 0, 1,
-0.5110486, -0.9115307, -2.961091, 0.2313726, 1, 0, 1,
-0.4996651, 0.6840985, -1.391031, 0.2235294, 1, 0, 1,
-0.4917766, -0.8248527, -2.934454, 0.2196078, 1, 0, 1,
-0.481378, -0.147233, -1.297954, 0.2117647, 1, 0, 1,
-0.4710955, -0.6816181, -3.132444, 0.2078431, 1, 0, 1,
-0.4678708, -1.405255, -2.550284, 0.2, 1, 0, 1,
-0.4618499, 0.4519594, -0.1450255, 0.1921569, 1, 0, 1,
-0.4560898, 0.2806979, -2.066853, 0.1882353, 1, 0, 1,
-0.4559924, -0.6368991, -2.515722, 0.1803922, 1, 0, 1,
-0.4521869, -0.264703, -2.485442, 0.1764706, 1, 0, 1,
-0.4432395, -1.307501, -2.134862, 0.1686275, 1, 0, 1,
-0.4431134, 1.206796, 0.2595537, 0.1647059, 1, 0, 1,
-0.4414899, 0.6628347, 0.6382878, 0.1568628, 1, 0, 1,
-0.4412601, -0.2170364, -2.332963, 0.1529412, 1, 0, 1,
-0.4347625, -0.9946417, -2.928874, 0.145098, 1, 0, 1,
-0.4329492, 0.3069264, -0.547485, 0.1411765, 1, 0, 1,
-0.427502, -0.564446, -1.186638, 0.1333333, 1, 0, 1,
-0.4268555, -2.639138, -3.137647, 0.1294118, 1, 0, 1,
-0.4266007, -0.9291718, -2.473931, 0.1215686, 1, 0, 1,
-0.4254681, 2.261178, 0.1196057, 0.1176471, 1, 0, 1,
-0.4215422, 0.05032426, -1.003762, 0.1098039, 1, 0, 1,
-0.4214703, 0.3075835, -2.031975, 0.1058824, 1, 0, 1,
-0.4162053, -0.0978751, -1.337361, 0.09803922, 1, 0, 1,
-0.4144451, -0.1572162, -1.831895, 0.09019608, 1, 0, 1,
-0.4140305, 0.315476, -2.388511, 0.08627451, 1, 0, 1,
-0.4077186, -0.5924636, -3.28033, 0.07843138, 1, 0, 1,
-0.4047373, -2.299922, -3.072969, 0.07450981, 1, 0, 1,
-0.403803, 0.873044, 0.1954585, 0.06666667, 1, 0, 1,
-0.4011631, -0.5714517, -1.453584, 0.0627451, 1, 0, 1,
-0.3987293, 0.2628938, -1.452825, 0.05490196, 1, 0, 1,
-0.3927345, -0.4308626, -1.876856, 0.05098039, 1, 0, 1,
-0.3918304, -0.1685857, -1.649137, 0.04313726, 1, 0, 1,
-0.3911074, -1.719191, -0.7833582, 0.03921569, 1, 0, 1,
-0.3906019, 0.7081058, -1.154217, 0.03137255, 1, 0, 1,
-0.3899186, 0.6063675, -0.4681539, 0.02745098, 1, 0, 1,
-0.3820764, -0.6980817, -2.0231, 0.01960784, 1, 0, 1,
-0.3795438, -1.674437, -3.649347, 0.01568628, 1, 0, 1,
-0.37941, 0.366307, -2.01368, 0.007843138, 1, 0, 1,
-0.3779586, 0.05842949, -1.235831, 0.003921569, 1, 0, 1,
-0.3757766, -0.3815584, -1.97937, 0, 1, 0.003921569, 1,
-0.374022, 0.8021257, -0.4820957, 0, 1, 0.01176471, 1,
-0.3734549, 0.639178, -0.5654836, 0, 1, 0.01568628, 1,
-0.3683058, 0.768935, -1.401572, 0, 1, 0.02352941, 1,
-0.3631941, 0.4357901, -1.251917, 0, 1, 0.02745098, 1,
-0.355662, 0.5690624, -0.08776581, 0, 1, 0.03529412, 1,
-0.3553121, 0.7097552, 0.1810591, 0, 1, 0.03921569, 1,
-0.3548687, -0.3685942, -4.401297, 0, 1, 0.04705882, 1,
-0.3536268, 0.3804033, -0.9520357, 0, 1, 0.05098039, 1,
-0.3519103, 0.03586405, -0.9768675, 0, 1, 0.05882353, 1,
-0.3483005, 0.9222288, -0.8507057, 0, 1, 0.0627451, 1,
-0.347247, -0.07165258, -2.25069, 0, 1, 0.07058824, 1,
-0.3465998, -0.5232328, -2.005955, 0, 1, 0.07450981, 1,
-0.3349113, -1.37621, -3.399028, 0, 1, 0.08235294, 1,
-0.3348912, -0.3446194, -2.569712, 0, 1, 0.08627451, 1,
-0.3334551, 1.158514, 0.7571474, 0, 1, 0.09411765, 1,
-0.3313397, -1.006024, -3.033717, 0, 1, 0.1019608, 1,
-0.3312281, 2.278962, -0.1671263, 0, 1, 0.1058824, 1,
-0.3311556, 0.05009225, -1.262491, 0, 1, 0.1137255, 1,
-0.3297502, -0.3802134, -2.749072, 0, 1, 0.1176471, 1,
-0.326559, 1.392104, -1.627925, 0, 1, 0.1254902, 1,
-0.3196499, -1.001532, -1.643185, 0, 1, 0.1294118, 1,
-0.3195063, -0.5591494, -2.235329, 0, 1, 0.1372549, 1,
-0.3147189, -0.8521075, -2.068045, 0, 1, 0.1411765, 1,
-0.314716, -0.2610683, -5.958224, 0, 1, 0.1490196, 1,
-0.3098838, 0.6591001, -2.428098, 0, 1, 0.1529412, 1,
-0.3091427, -2.001773, -2.890238, 0, 1, 0.1607843, 1,
-0.3051581, -0.5057308, -2.538284, 0, 1, 0.1647059, 1,
-0.2981796, 1.725758, 1.310236, 0, 1, 0.172549, 1,
-0.2979162, -0.0495905, -1.321306, 0, 1, 0.1764706, 1,
-0.2956148, -0.9860047, -4.096082, 0, 1, 0.1843137, 1,
-0.2929339, 0.1347106, -0.8236621, 0, 1, 0.1882353, 1,
-0.2923632, -0.209414, -1.606687, 0, 1, 0.1960784, 1,
-0.2914009, -0.9856179, -1.697409, 0, 1, 0.2039216, 1,
-0.288509, 0.7768502, -1.349243, 0, 1, 0.2078431, 1,
-0.2824672, -0.1275581, -2.07017, 0, 1, 0.2156863, 1,
-0.281338, -1.056348, -1.572112, 0, 1, 0.2196078, 1,
-0.2805209, 0.8240374, 1.374153, 0, 1, 0.227451, 1,
-0.2802661, 1.678495, 1.043102, 0, 1, 0.2313726, 1,
-0.2785149, 1.127107, -0.0862471, 0, 1, 0.2392157, 1,
-0.2709705, 0.6093165, 1.264699, 0, 1, 0.2431373, 1,
-0.2665739, 0.2240549, 0.3872085, 0, 1, 0.2509804, 1,
-0.2632561, -0.8915924, -0.6630511, 0, 1, 0.254902, 1,
-0.2628956, 0.9097127, 0.8750886, 0, 1, 0.2627451, 1,
-0.2619716, -0.305817, -3.433347, 0, 1, 0.2666667, 1,
-0.2581453, 0.488747, 0.873201, 0, 1, 0.2745098, 1,
-0.2547527, 0.1649963, -2.006339, 0, 1, 0.2784314, 1,
-0.2547089, 0.3546016, -0.2227536, 0, 1, 0.2862745, 1,
-0.2529504, -0.4962285, -3.136842, 0, 1, 0.2901961, 1,
-0.2500455, -1.013869, -1.758646, 0, 1, 0.2980392, 1,
-0.2464874, 0.8311896, 0.8252892, 0, 1, 0.3058824, 1,
-0.2447826, 1.083994, -1.708743, 0, 1, 0.3098039, 1,
-0.2444195, 0.3026641, -2.979985, 0, 1, 0.3176471, 1,
-0.2441597, -0.7884949, -2.036265, 0, 1, 0.3215686, 1,
-0.2425983, -0.9347796, -1.956038, 0, 1, 0.3294118, 1,
-0.2415288, -0.2347905, -1.256379, 0, 1, 0.3333333, 1,
-0.2368332, 2.087919, 0.3552425, 0, 1, 0.3411765, 1,
-0.2336335, -1.279229, -4.18849, 0, 1, 0.345098, 1,
-0.2298334, 0.4955388, -0.2003113, 0, 1, 0.3529412, 1,
-0.2297975, -0.6365299, -4.135278, 0, 1, 0.3568628, 1,
-0.2295331, -0.03175038, -2.009548, 0, 1, 0.3647059, 1,
-0.2265741, -0.7465275, -3.393815, 0, 1, 0.3686275, 1,
-0.2237032, 0.2030978, -0.3117942, 0, 1, 0.3764706, 1,
-0.2171954, 1.734781, 0.01519263, 0, 1, 0.3803922, 1,
-0.2156244, -1.074549, -2.197738, 0, 1, 0.3882353, 1,
-0.2142129, -0.0939644, -2.524139, 0, 1, 0.3921569, 1,
-0.2119331, 0.418788, 1.155534, 0, 1, 0.4, 1,
-0.2015293, 0.7802923, 0.8378615, 0, 1, 0.4078431, 1,
-0.2000795, 1.254752, -0.93858, 0, 1, 0.4117647, 1,
-0.1981046, -0.07743293, -0.8263916, 0, 1, 0.4196078, 1,
-0.191706, -1.459914, -2.86755, 0, 1, 0.4235294, 1,
-0.1900614, -0.1086945, -2.696275, 0, 1, 0.4313726, 1,
-0.1898686, -1.362509, -2.917865, 0, 1, 0.4352941, 1,
-0.1890728, -0.7240991, -1.897814, 0, 1, 0.4431373, 1,
-0.1861336, -0.7771895, -5.265742, 0, 1, 0.4470588, 1,
-0.1845815, -0.09108293, -3.143389, 0, 1, 0.454902, 1,
-0.1843881, 0.560988, 0.127789, 0, 1, 0.4588235, 1,
-0.1733303, 0.1243718, -1.904289, 0, 1, 0.4666667, 1,
-0.1711927, -1.204591, -2.84676, 0, 1, 0.4705882, 1,
-0.1709395, 0.9893641, 0.045369, 0, 1, 0.4784314, 1,
-0.1698209, -0.1813577, -2.738454, 0, 1, 0.4823529, 1,
-0.1687009, -0.6079464, -3.293091, 0, 1, 0.4901961, 1,
-0.1647095, 0.8432083, 0.7023156, 0, 1, 0.4941176, 1,
-0.1640468, -1.162723, -1.553821, 0, 1, 0.5019608, 1,
-0.1620603, 0.1137485, -1.235086, 0, 1, 0.509804, 1,
-0.1602467, -0.6862368, -3.998115, 0, 1, 0.5137255, 1,
-0.157612, -0.9528419, -4.086062, 0, 1, 0.5215687, 1,
-0.1573949, -0.2406107, -2.653316, 0, 1, 0.5254902, 1,
-0.1554853, -0.929779, -2.121902, 0, 1, 0.5333334, 1,
-0.1515791, 1.727807, 0.5434278, 0, 1, 0.5372549, 1,
-0.1419756, 1.013314, 0.2146454, 0, 1, 0.5450981, 1,
-0.1398961, -0.1867618, -2.690005, 0, 1, 0.5490196, 1,
-0.1391747, -0.6421526, -4.873872, 0, 1, 0.5568628, 1,
-0.1386393, 0.0966494, -1.822621, 0, 1, 0.5607843, 1,
-0.1370457, -0.4997956, -3.336722, 0, 1, 0.5686275, 1,
-0.1340309, -0.4640143, -4.153067, 0, 1, 0.572549, 1,
-0.1291214, 0.1037733, 0.1607296, 0, 1, 0.5803922, 1,
-0.1247869, 1.760918, -0.1787702, 0, 1, 0.5843138, 1,
-0.1246627, 1.774808, 1.474853, 0, 1, 0.5921569, 1,
-0.1204581, 2.606106, -0.116963, 0, 1, 0.5960785, 1,
-0.1199751, 0.1521939, -1.813043, 0, 1, 0.6039216, 1,
-0.1178442, 0.9537352, 1.024539, 0, 1, 0.6117647, 1,
-0.1165529, -0.9566255, -2.736571, 0, 1, 0.6156863, 1,
-0.1151592, -1.657021, -3.40234, 0, 1, 0.6235294, 1,
-0.1144653, 0.5716172, -0.4494635, 0, 1, 0.627451, 1,
-0.1129493, 0.4975248, -1.789221, 0, 1, 0.6352941, 1,
-0.1102923, -0.9143671, -2.862974, 0, 1, 0.6392157, 1,
-0.1094563, 1.353871, 1.693961, 0, 1, 0.6470588, 1,
-0.1086006, -2.186017, -2.322289, 0, 1, 0.6509804, 1,
-0.1007521, 0.3339605, 0.929593, 0, 1, 0.6588235, 1,
-0.09896772, 0.3410949, -0.04507142, 0, 1, 0.6627451, 1,
-0.09786964, -0.2211925, -4.225103, 0, 1, 0.6705883, 1,
-0.09610534, 0.2663304, -0.8486557, 0, 1, 0.6745098, 1,
-0.09532477, -0.3338968, -3.169004, 0, 1, 0.682353, 1,
-0.0942563, 0.06071969, -1.297416, 0, 1, 0.6862745, 1,
-0.09391501, 0.5234675, -2.384098, 0, 1, 0.6941177, 1,
-0.09338955, -0.2364507, -2.833748, 0, 1, 0.7019608, 1,
-0.09327311, -0.5598909, -2.539058, 0, 1, 0.7058824, 1,
-0.09149133, 0.9315578, -0.9086343, 0, 1, 0.7137255, 1,
-0.08996956, 0.05993855, -1.561553, 0, 1, 0.7176471, 1,
-0.08989415, 1.453531, 0.5534589, 0, 1, 0.7254902, 1,
-0.08288467, 0.8689936, -0.1673103, 0, 1, 0.7294118, 1,
-0.07871549, 0.5008993, 0.03994364, 0, 1, 0.7372549, 1,
-0.0763986, 0.5917675, 0.3418943, 0, 1, 0.7411765, 1,
-0.07378579, 1.169543, -1.620677, 0, 1, 0.7490196, 1,
-0.07365795, -0.7077914, -4.372871, 0, 1, 0.7529412, 1,
-0.07281796, -0.6890085, -1.834526, 0, 1, 0.7607843, 1,
-0.06911561, -1.435123, -2.916354, 0, 1, 0.7647059, 1,
-0.06832889, 1.655432, 0.9532143, 0, 1, 0.772549, 1,
-0.06769714, -0.1474134, -3.986076, 0, 1, 0.7764706, 1,
-0.06576642, 0.4756275, 0.7107282, 0, 1, 0.7843137, 1,
-0.06355739, -2.365845, -4.005973, 0, 1, 0.7882353, 1,
-0.06281754, 1.521616, -2.068663, 0, 1, 0.7960784, 1,
-0.06226753, -0.6624856, -3.387828, 0, 1, 0.8039216, 1,
-0.05861713, -0.7659647, -1.925842, 0, 1, 0.8078431, 1,
-0.05415022, -0.1783395, -2.516331, 0, 1, 0.8156863, 1,
-0.05319422, -1.565559, -3.13928, 0, 1, 0.8196079, 1,
-0.04756613, 0.2552472, -1.169569, 0, 1, 0.827451, 1,
-0.04619503, 0.3874747, -0.6199831, 0, 1, 0.8313726, 1,
-0.04522644, 0.1206516, -0.2054841, 0, 1, 0.8392157, 1,
-0.04250742, 1.751227, 0.2300911, 0, 1, 0.8431373, 1,
-0.04044956, -0.4020539, -3.478998, 0, 1, 0.8509804, 1,
-0.04027287, -0.6549119, -3.328851, 0, 1, 0.854902, 1,
-0.03820262, 0.4782044, -0.2772937, 0, 1, 0.8627451, 1,
-0.03569418, 0.9150065, -0.3694365, 0, 1, 0.8666667, 1,
-0.02612515, -0.5955715, -2.885611, 0, 1, 0.8745098, 1,
-0.02510964, -0.5112908, -2.463196, 0, 1, 0.8784314, 1,
-0.02317272, -0.9790242, -4.206642, 0, 1, 0.8862745, 1,
-0.01983261, -0.08442401, -2.92163, 0, 1, 0.8901961, 1,
-0.01666118, 1.058267, -1.096743, 0, 1, 0.8980392, 1,
-0.01267658, -0.6536571, -1.762312, 0, 1, 0.9058824, 1,
-0.01231775, 0.7424684, 0.3591224, 0, 1, 0.9098039, 1,
-0.007641817, 0.9547715, -0.4798263, 0, 1, 0.9176471, 1,
-0.006012246, 0.496913, 0.3002005, 0, 1, 0.9215686, 1,
0.002466025, -0.0146938, 2.9337, 0, 1, 0.9294118, 1,
0.004371549, 0.5002659, 0.641916, 0, 1, 0.9333333, 1,
0.00494125, 0.8477674, -1.069386, 0, 1, 0.9411765, 1,
0.01207402, 0.195768, 1.512316, 0, 1, 0.945098, 1,
0.0130315, 0.9820098, 0.2814979, 0, 1, 0.9529412, 1,
0.01949206, 0.4503183, 1.304338, 0, 1, 0.9568627, 1,
0.01975874, -0.5354928, 3.139976, 0, 1, 0.9647059, 1,
0.02073609, -0.0471488, 3.990258, 0, 1, 0.9686275, 1,
0.02874895, -0.1794007, 2.816495, 0, 1, 0.9764706, 1,
0.03084238, 0.04655695, 1.779755, 0, 1, 0.9803922, 1,
0.03413199, -0.9944566, 3.273701, 0, 1, 0.9882353, 1,
0.03944165, -1.538829, 3.169486, 0, 1, 0.9921569, 1,
0.04396896, -0.07430214, 3.488039, 0, 1, 1, 1,
0.04491964, 0.8607002, 0.00221472, 0, 0.9921569, 1, 1,
0.04709482, -1.152884, 3.466582, 0, 0.9882353, 1, 1,
0.04811218, -0.4648131, 4.007602, 0, 0.9803922, 1, 1,
0.04811333, 0.5646234, 0.2391623, 0, 0.9764706, 1, 1,
0.04923745, -0.8209195, 2.148551, 0, 0.9686275, 1, 1,
0.05103213, 0.3880467, 0.4187713, 0, 0.9647059, 1, 1,
0.05203095, 0.3623169, 0.10694, 0, 0.9568627, 1, 1,
0.05338328, 2.619866, -1.83971, 0, 0.9529412, 1, 1,
0.05368543, 0.9390875, -2.47345, 0, 0.945098, 1, 1,
0.05779994, 0.5000823, -0.05763974, 0, 0.9411765, 1, 1,
0.05890495, -1.029603, 5.132388, 0, 0.9333333, 1, 1,
0.06101782, 0.1948511, -0.6978816, 0, 0.9294118, 1, 1,
0.06133016, 0.5103909, 2.732843, 0, 0.9215686, 1, 1,
0.06495269, -0.7247813, 2.59782, 0, 0.9176471, 1, 1,
0.06578888, 0.2850518, -1.410148, 0, 0.9098039, 1, 1,
0.06586435, 0.7289078, 2.438401, 0, 0.9058824, 1, 1,
0.06688754, 1.495668, 0.04028948, 0, 0.8980392, 1, 1,
0.06998929, -0.4888385, 4.302201, 0, 0.8901961, 1, 1,
0.07772362, -0.09211992, 2.576858, 0, 0.8862745, 1, 1,
0.07931247, -1.47871, 1.424667, 0, 0.8784314, 1, 1,
0.08059946, -0.2006662, 1.529233, 0, 0.8745098, 1, 1,
0.08065471, -0.3563968, 2.950258, 0, 0.8666667, 1, 1,
0.08075481, 1.627369, -0.4264642, 0, 0.8627451, 1, 1,
0.0818798, 0.1966195, -1.604871, 0, 0.854902, 1, 1,
0.08223122, -0.8922955, 4.172516, 0, 0.8509804, 1, 1,
0.08406939, -0.6648234, 3.363243, 0, 0.8431373, 1, 1,
0.0907767, 0.7493436, -0.8328055, 0, 0.8392157, 1, 1,
0.09098561, 1.904843, -0.3599526, 0, 0.8313726, 1, 1,
0.09270577, -2.010098, 1.517684, 0, 0.827451, 1, 1,
0.09353948, -3.257254, 3.286132, 0, 0.8196079, 1, 1,
0.0935894, -0.7608336, 1.597881, 0, 0.8156863, 1, 1,
0.1028911, -0.1126955, 1.906063, 0, 0.8078431, 1, 1,
0.1052251, -0.6151162, 3.172082, 0, 0.8039216, 1, 1,
0.1082532, 2.445158, -0.5402877, 0, 0.7960784, 1, 1,
0.1129272, 0.4279086, -0.3275542, 0, 0.7882353, 1, 1,
0.1132591, -1.847793, 2.986403, 0, 0.7843137, 1, 1,
0.1137181, 1.315516, -1.021205, 0, 0.7764706, 1, 1,
0.1145213, -0.07450348, 0.741871, 0, 0.772549, 1, 1,
0.1190081, 0.8854814, 1.651814, 0, 0.7647059, 1, 1,
0.1202837, 1.218386, 1.270935, 0, 0.7607843, 1, 1,
0.1203517, -1.517882, 3.092788, 0, 0.7529412, 1, 1,
0.1235714, 0.3568704, 0.563892, 0, 0.7490196, 1, 1,
0.124671, 0.1532133, -0.5011181, 0, 0.7411765, 1, 1,
0.1300272, 0.7265111, 0.7795858, 0, 0.7372549, 1, 1,
0.1300385, 0.02992664, 2.082977, 0, 0.7294118, 1, 1,
0.1310875, -1.272254, 2.159105, 0, 0.7254902, 1, 1,
0.1458335, 0.5427756, -1.530982, 0, 0.7176471, 1, 1,
0.1474977, -0.3472457, 4.409604, 0, 0.7137255, 1, 1,
0.1487704, -0.6589666, 4.377584, 0, 0.7058824, 1, 1,
0.1521253, 1.081028, -0.8721745, 0, 0.6980392, 1, 1,
0.1529571, -1.025583, 2.817754, 0, 0.6941177, 1, 1,
0.1553015, -0.4873744, 4.202193, 0, 0.6862745, 1, 1,
0.1566479, 1.026919, -0.3564503, 0, 0.682353, 1, 1,
0.1575251, -1.324993, 2.029135, 0, 0.6745098, 1, 1,
0.1592046, -1.236412, 1.147018, 0, 0.6705883, 1, 1,
0.1609643, -0.3447729, 2.413422, 0, 0.6627451, 1, 1,
0.1637076, -0.5650203, 3.157631, 0, 0.6588235, 1, 1,
0.1642271, 2.130752, -0.2734168, 0, 0.6509804, 1, 1,
0.1672918, -1.48732, 2.948865, 0, 0.6470588, 1, 1,
0.1687128, -0.07438052, 2.741956, 0, 0.6392157, 1, 1,
0.1719794, 0.5803848, -0.9389703, 0, 0.6352941, 1, 1,
0.1728703, -0.3216724, 2.812517, 0, 0.627451, 1, 1,
0.1733649, -1.311768, 3.755065, 0, 0.6235294, 1, 1,
0.1755859, -1.022287, 3.442674, 0, 0.6156863, 1, 1,
0.182474, 0.3840572, 2.114846, 0, 0.6117647, 1, 1,
0.1867062, 2.62846, -0.541227, 0, 0.6039216, 1, 1,
0.1881385, -0.7494604, 2.612483, 0, 0.5960785, 1, 1,
0.1882637, 0.1312623, 0.994461, 0, 0.5921569, 1, 1,
0.1889117, 0.6979766, 1.588671, 0, 0.5843138, 1, 1,
0.1910075, 1.2531, -0.4239165, 0, 0.5803922, 1, 1,
0.1934436, 2.264574, -0.2475992, 0, 0.572549, 1, 1,
0.1991179, 1.377222, 1.485681, 0, 0.5686275, 1, 1,
0.2036994, -1.686508, 2.634065, 0, 0.5607843, 1, 1,
0.2070199, 1.234405, 0.2501869, 0, 0.5568628, 1, 1,
0.2110732, -0.4451843, 2.245288, 0, 0.5490196, 1, 1,
0.2165381, 0.07564802, 3.007828, 0, 0.5450981, 1, 1,
0.2223797, -1.207411, 2.209772, 0, 0.5372549, 1, 1,
0.22613, -0.04992047, 2.706666, 0, 0.5333334, 1, 1,
0.2274379, 0.7028592, 1.587248, 0, 0.5254902, 1, 1,
0.2274764, -2.202931, 2.890972, 0, 0.5215687, 1, 1,
0.2298433, 0.3887397, 0.8703396, 0, 0.5137255, 1, 1,
0.2343016, -0.6261379, 2.494801, 0, 0.509804, 1, 1,
0.2356282, 1.054479, 0.5113742, 0, 0.5019608, 1, 1,
0.2392703, 0.6406604, -1.168086, 0, 0.4941176, 1, 1,
0.2400457, 0.6573088, 0.8076091, 0, 0.4901961, 1, 1,
0.2475019, 1.085025, 1.23308, 0, 0.4823529, 1, 1,
0.2475403, 1.250044, 0.07306767, 0, 0.4784314, 1, 1,
0.2493197, 0.883661, 0.0503255, 0, 0.4705882, 1, 1,
0.253489, 0.3113243, 0.3888559, 0, 0.4666667, 1, 1,
0.2542096, 0.2163176, 1.96204, 0, 0.4588235, 1, 1,
0.257586, 2.277603, -0.08215729, 0, 0.454902, 1, 1,
0.2580995, -0.3711838, 4.203837, 0, 0.4470588, 1, 1,
0.2609815, 0.9300281, 0.3312141, 0, 0.4431373, 1, 1,
0.2631077, 0.7141846, 0.5077033, 0, 0.4352941, 1, 1,
0.2632432, 0.8228506, 1.247061, 0, 0.4313726, 1, 1,
0.2638977, -0.97515, 3.830009, 0, 0.4235294, 1, 1,
0.2643168, 2.263215, -1.255352, 0, 0.4196078, 1, 1,
0.2675515, 1.2007, 0.3341022, 0, 0.4117647, 1, 1,
0.2679925, 1.763277, -0.7700187, 0, 0.4078431, 1, 1,
0.2710831, 0.2258898, 2.204112, 0, 0.4, 1, 1,
0.27112, -1.497193, 2.995759, 0, 0.3921569, 1, 1,
0.2749544, -1.622707, 4.599281, 0, 0.3882353, 1, 1,
0.2777036, 0.1316532, 1.221749, 0, 0.3803922, 1, 1,
0.2791233, 0.6086143, -0.7466933, 0, 0.3764706, 1, 1,
0.2809146, 1.214353, -0.6571054, 0, 0.3686275, 1, 1,
0.2831711, -1.486164, 3.463222, 0, 0.3647059, 1, 1,
0.2883345, 1.962406, -0.946905, 0, 0.3568628, 1, 1,
0.2895407, 0.6521349, -0.3586737, 0, 0.3529412, 1, 1,
0.2910863, -0.2587463, 2.337721, 0, 0.345098, 1, 1,
0.2962406, 0.2035907, 0.6742368, 0, 0.3411765, 1, 1,
0.2983784, -0.2066291, 3.092021, 0, 0.3333333, 1, 1,
0.3027225, 0.5686086, 0.2776584, 0, 0.3294118, 1, 1,
0.3038478, 1.078955, 0.2706028, 0, 0.3215686, 1, 1,
0.3108133, 0.827517, 0.9309418, 0, 0.3176471, 1, 1,
0.3152879, -0.9646795, 1.852252, 0, 0.3098039, 1, 1,
0.3176448, -1.0696, 2.461336, 0, 0.3058824, 1, 1,
0.3178312, -0.3857146, 0.6227587, 0, 0.2980392, 1, 1,
0.3219969, -1.17037, 3.352973, 0, 0.2901961, 1, 1,
0.3251342, -0.3428167, 2.707541, 0, 0.2862745, 1, 1,
0.3288085, -1.415084, 0.9408059, 0, 0.2784314, 1, 1,
0.3414318, 0.1034204, 2.203129, 0, 0.2745098, 1, 1,
0.3448642, 1.3342, -0.6124825, 0, 0.2666667, 1, 1,
0.3510049, -0.5390629, 1.884062, 0, 0.2627451, 1, 1,
0.3539503, 2.194711, 0.6334653, 0, 0.254902, 1, 1,
0.3564959, 1.482562, 1.333758, 0, 0.2509804, 1, 1,
0.3595752, 0.7466224, 1.288333, 0, 0.2431373, 1, 1,
0.3641584, -0.3552084, 0.8656032, 0, 0.2392157, 1, 1,
0.3715019, -0.07510822, 1.946748, 0, 0.2313726, 1, 1,
0.3719331, -1.486352, 2.953105, 0, 0.227451, 1, 1,
0.3747248, 0.6968659, 0.5081103, 0, 0.2196078, 1, 1,
0.3756968, 2.052239, -1.43908, 0, 0.2156863, 1, 1,
0.3759715, 1.625548, 1.781405, 0, 0.2078431, 1, 1,
0.3760909, -0.1313233, 3.014102, 0, 0.2039216, 1, 1,
0.3773424, -1.429214, 2.902845, 0, 0.1960784, 1, 1,
0.3824269, 0.2660886, 2.27986, 0, 0.1882353, 1, 1,
0.3825091, -0.3327783, 3.249009, 0, 0.1843137, 1, 1,
0.383258, 0.03800821, 0.8073244, 0, 0.1764706, 1, 1,
0.3869326, 1.325729, -0.844018, 0, 0.172549, 1, 1,
0.3878457, 0.6847618, 0.2627136, 0, 0.1647059, 1, 1,
0.3908938, -1.384754, 3.156229, 0, 0.1607843, 1, 1,
0.3923777, 0.2807077, 1.861185, 0, 0.1529412, 1, 1,
0.3960513, 1.295218, 0.6965483, 0, 0.1490196, 1, 1,
0.3965524, 0.9283186, 0.4657658, 0, 0.1411765, 1, 1,
0.3972923, -0.8089043, 3.02677, 0, 0.1372549, 1, 1,
0.4049694, 0.9595, 0.3798335, 0, 0.1294118, 1, 1,
0.4088522, -0.7407539, 2.853702, 0, 0.1254902, 1, 1,
0.4093046, 0.5319779, 1.269602, 0, 0.1176471, 1, 1,
0.4120492, 0.6910345, 1.066687, 0, 0.1137255, 1, 1,
0.4129872, 0.6974085, 0.5044055, 0, 0.1058824, 1, 1,
0.4149869, 0.6911135, 1.070455, 0, 0.09803922, 1, 1,
0.4167019, 0.3300258, 3.12442, 0, 0.09411765, 1, 1,
0.4202146, 1.176868, 1.715164, 0, 0.08627451, 1, 1,
0.421903, -0.2104158, 2.904621, 0, 0.08235294, 1, 1,
0.4251445, 0.8710703, -0.1818783, 0, 0.07450981, 1, 1,
0.4293605, -1.56615, 2.433596, 0, 0.07058824, 1, 1,
0.4304954, -1.930957, 3.554125, 0, 0.0627451, 1, 1,
0.4359356, -1.730655, 2.596721, 0, 0.05882353, 1, 1,
0.4375207, -0.8088663, 3.90172, 0, 0.05098039, 1, 1,
0.4379579, -0.4498609, 1.787047, 0, 0.04705882, 1, 1,
0.4401582, -1.310332, 1.759592, 0, 0.03921569, 1, 1,
0.4477586, -1.546946, 3.053249, 0, 0.03529412, 1, 1,
0.448798, 1.763238, 0.4793661, 0, 0.02745098, 1, 1,
0.4500429, -0.5469369, 2.552517, 0, 0.02352941, 1, 1,
0.4514094, -1.185351, 0.4686408, 0, 0.01568628, 1, 1,
0.4533365, 0.9757806, 1.478873, 0, 0.01176471, 1, 1,
0.4541118, 1.532393, 0.194875, 0, 0.003921569, 1, 1,
0.4626232, 1.155602, 2.530486, 0.003921569, 0, 1, 1,
0.4648291, 0.8400061, -0.2754102, 0.007843138, 0, 1, 1,
0.4658102, -0.1608661, 2.026774, 0.01568628, 0, 1, 1,
0.4700158, -0.619417, 1.142264, 0.01960784, 0, 1, 1,
0.4791262, 0.8421809, 0.1058856, 0.02745098, 0, 1, 1,
0.479836, -0.2487918, 1.246522, 0.03137255, 0, 1, 1,
0.4812423, -0.7478526, 2.857141, 0.03921569, 0, 1, 1,
0.4839856, -0.2271221, 0.5708824, 0.04313726, 0, 1, 1,
0.4876595, 0.8516813, 0.7133046, 0.05098039, 0, 1, 1,
0.4901439, -1.041178, 2.910028, 0.05490196, 0, 1, 1,
0.4905402, 0.783035, 0.6395649, 0.0627451, 0, 1, 1,
0.4930506, -0.3015435, 1.696227, 0.06666667, 0, 1, 1,
0.5021965, 0.1140731, 1.44214, 0.07450981, 0, 1, 1,
0.5050744, 0.3784556, 1.090461, 0.07843138, 0, 1, 1,
0.5073667, -0.2064262, 2.194133, 0.08627451, 0, 1, 1,
0.5091923, 0.498312, 1.125702, 0.09019608, 0, 1, 1,
0.5114638, -1.041569, 3.999841, 0.09803922, 0, 1, 1,
0.5122953, -0.8732265, 2.24552, 0.1058824, 0, 1, 1,
0.5139565, -0.008884305, 1.686511, 0.1098039, 0, 1, 1,
0.5166661, 1.811343, 1.136469, 0.1176471, 0, 1, 1,
0.5177171, -0.6553931, 2.70344, 0.1215686, 0, 1, 1,
0.5227495, -1.557201, 2.186615, 0.1294118, 0, 1, 1,
0.532796, 1.10418, -0.2577593, 0.1333333, 0, 1, 1,
0.5349161, 3.582383, -0.280285, 0.1411765, 0, 1, 1,
0.5353115, 0.4183498, -1.600589, 0.145098, 0, 1, 1,
0.5355781, 0.002900686, 0.4983515, 0.1529412, 0, 1, 1,
0.536909, 0.2050928, 2.480019, 0.1568628, 0, 1, 1,
0.5476847, 0.9992658, 0.4430883, 0.1647059, 0, 1, 1,
0.5482486, -1.716614, 3.125813, 0.1686275, 0, 1, 1,
0.5491495, -0.9572951, 2.611235, 0.1764706, 0, 1, 1,
0.5498814, 0.499008, -0.9694232, 0.1803922, 0, 1, 1,
0.5505129, 1.261164, 0.6101422, 0.1882353, 0, 1, 1,
0.5507954, -0.6860961, 2.266747, 0.1921569, 0, 1, 1,
0.5526867, 1.4818, -1.813655, 0.2, 0, 1, 1,
0.5533395, -0.1361263, 1.979762, 0.2078431, 0, 1, 1,
0.5547599, 0.3026229, 3.485443, 0.2117647, 0, 1, 1,
0.5564467, -0.3147282, 3.833293, 0.2196078, 0, 1, 1,
0.5575666, 0.469322, 0.8448487, 0.2235294, 0, 1, 1,
0.5592806, -0.4326447, 0.811788, 0.2313726, 0, 1, 1,
0.5599494, 0.7789986, -0.4091094, 0.2352941, 0, 1, 1,
0.5610282, -1.201651, 3.834159, 0.2431373, 0, 1, 1,
0.5625685, -0.9416841, 4.032203, 0.2470588, 0, 1, 1,
0.5636202, -0.4039883, -0.03753057, 0.254902, 0, 1, 1,
0.5669971, 1.522624, -0.4386232, 0.2588235, 0, 1, 1,
0.5679022, -1.179289, 2.989823, 0.2666667, 0, 1, 1,
0.5702268, 0.4092056, 2.425489, 0.2705882, 0, 1, 1,
0.5746171, -1.230371, 1.97203, 0.2784314, 0, 1, 1,
0.5752317, 0.2301906, 0.5367419, 0.282353, 0, 1, 1,
0.5766308, 1.491226, 1.422966, 0.2901961, 0, 1, 1,
0.5809115, -1.257749, 3.429951, 0.2941177, 0, 1, 1,
0.5811704, 0.01608324, 0.6152843, 0.3019608, 0, 1, 1,
0.5814182, -1.489297, 3.970564, 0.3098039, 0, 1, 1,
0.5827312, 0.1175629, 1.929806, 0.3137255, 0, 1, 1,
0.5863888, -0.3475546, 1.465189, 0.3215686, 0, 1, 1,
0.5896488, -0.7650105, 2.626618, 0.3254902, 0, 1, 1,
0.5903021, 0.1917268, 1.502818, 0.3333333, 0, 1, 1,
0.5920638, 0.1763905, 0.1675012, 0.3372549, 0, 1, 1,
0.5928676, -1.323043, 3.595832, 0.345098, 0, 1, 1,
0.5949389, 0.1725493, 1.789545, 0.3490196, 0, 1, 1,
0.5980022, 0.3380283, 1.410374, 0.3568628, 0, 1, 1,
0.599524, 0.4124679, 0.3230129, 0.3607843, 0, 1, 1,
0.599894, -0.3905362, 2.249147, 0.3686275, 0, 1, 1,
0.6067697, 0.3385954, 1.062662, 0.372549, 0, 1, 1,
0.6094738, 2.531093, -1.114267, 0.3803922, 0, 1, 1,
0.6102691, 0.8645857, 0.4650401, 0.3843137, 0, 1, 1,
0.6117115, 0.3522182, 1.816688, 0.3921569, 0, 1, 1,
0.6186804, 1.29135, -0.1023593, 0.3960784, 0, 1, 1,
0.61978, -2.4921, 2.065634, 0.4039216, 0, 1, 1,
0.626426, 0.09570432, 1.411924, 0.4117647, 0, 1, 1,
0.6283715, -0.8863387, 1.735176, 0.4156863, 0, 1, 1,
0.6310139, 1.676246, -0.4344641, 0.4235294, 0, 1, 1,
0.6365097, 0.4323657, 1.984203, 0.427451, 0, 1, 1,
0.6367518, 0.5808842, 1.589583, 0.4352941, 0, 1, 1,
0.6376669, -1.050887, 3.127511, 0.4392157, 0, 1, 1,
0.6475646, -0.2681698, 1.285171, 0.4470588, 0, 1, 1,
0.6499374, -0.4716123, -0.3183892, 0.4509804, 0, 1, 1,
0.6525874, 0.8705071, 1.494096, 0.4588235, 0, 1, 1,
0.6552094, -0.05915941, 0.04282356, 0.4627451, 0, 1, 1,
0.6598778, -1.29121, 3.562689, 0.4705882, 0, 1, 1,
0.6614442, -0.5270326, 3.041619, 0.4745098, 0, 1, 1,
0.662743, -0.4078416, 3.17998, 0.4823529, 0, 1, 1,
0.6655346, 0.4622886, 0.5625277, 0.4862745, 0, 1, 1,
0.666806, -1.143363, 2.945703, 0.4941176, 0, 1, 1,
0.6678125, -1.102422, 3.287074, 0.5019608, 0, 1, 1,
0.6686751, -0.9105638, 3.293516, 0.5058824, 0, 1, 1,
0.6690603, -0.4417929, 0.7489043, 0.5137255, 0, 1, 1,
0.6703218, -1.622375, 2.769384, 0.5176471, 0, 1, 1,
0.6766084, -0.7199284, 3.062853, 0.5254902, 0, 1, 1,
0.6857947, -1.880778, 0.6152616, 0.5294118, 0, 1, 1,
0.6886435, -0.9493729, 3.852935, 0.5372549, 0, 1, 1,
0.7044526, -1.882583, 3.549963, 0.5411765, 0, 1, 1,
0.7074668, 0.6450902, 0.4528826, 0.5490196, 0, 1, 1,
0.7088591, 0.3338483, 1.893419, 0.5529412, 0, 1, 1,
0.712727, 0.03267168, 1.350563, 0.5607843, 0, 1, 1,
0.7127596, -0.02715465, 0.3272938, 0.5647059, 0, 1, 1,
0.7209777, -0.3927471, 2.176083, 0.572549, 0, 1, 1,
0.7310219, -3.267344, 1.773471, 0.5764706, 0, 1, 1,
0.7346755, 0.1111858, 1.455279, 0.5843138, 0, 1, 1,
0.7348113, -0.5847312, 1.198004, 0.5882353, 0, 1, 1,
0.7353514, -1.156128, 2.418195, 0.5960785, 0, 1, 1,
0.7404716, -0.1009252, 3.151633, 0.6039216, 0, 1, 1,
0.7436864, 0.01564669, -0.1639692, 0.6078432, 0, 1, 1,
0.7500316, -1.550187, 2.426242, 0.6156863, 0, 1, 1,
0.7535914, 0.2992947, 1.266755, 0.6196079, 0, 1, 1,
0.756151, 0.1312887, 3.514672, 0.627451, 0, 1, 1,
0.7594545, -1.73533, 3.641101, 0.6313726, 0, 1, 1,
0.7608691, -0.9496045, 1.187828, 0.6392157, 0, 1, 1,
0.7659795, -0.4365624, 2.721514, 0.6431373, 0, 1, 1,
0.7707492, 0.7739435, 0.6314254, 0.6509804, 0, 1, 1,
0.7765878, 0.7416301, 0.1625519, 0.654902, 0, 1, 1,
0.7775767, -1.915324, 3.785792, 0.6627451, 0, 1, 1,
0.7796909, -0.9163257, 0.5536752, 0.6666667, 0, 1, 1,
0.7825152, -0.6975451, 1.207408, 0.6745098, 0, 1, 1,
0.784446, -1.695698, 1.687845, 0.6784314, 0, 1, 1,
0.7873017, 0.2638752, 0.8354617, 0.6862745, 0, 1, 1,
0.7905326, -0.7837814, 1.260808, 0.6901961, 0, 1, 1,
0.7991004, -1.143168, 2.206522, 0.6980392, 0, 1, 1,
0.803303, -0.01397573, 2.586941, 0.7058824, 0, 1, 1,
0.8085033, 0.6963243, -0.2892382, 0.7098039, 0, 1, 1,
0.8086433, 0.3101248, 0.7774098, 0.7176471, 0, 1, 1,
0.820832, 1.006179, 1.45796, 0.7215686, 0, 1, 1,
0.8271859, 0.395292, 0.1238049, 0.7294118, 0, 1, 1,
0.8296233, 0.8898728, 0.9470492, 0.7333333, 0, 1, 1,
0.8350844, 1.11231, 0.4601356, 0.7411765, 0, 1, 1,
0.8420833, 0.5118545, 2.379944, 0.7450981, 0, 1, 1,
0.8421841, 0.2682643, 0.02695279, 0.7529412, 0, 1, 1,
0.8435003, -0.07871252, 0.8316802, 0.7568628, 0, 1, 1,
0.8464453, -0.2285704, 1.167272, 0.7647059, 0, 1, 1,
0.8478563, -0.5726992, 2.123169, 0.7686275, 0, 1, 1,
0.8607104, -1.102826, 2.854232, 0.7764706, 0, 1, 1,
0.862616, 1.125335, -0.5888014, 0.7803922, 0, 1, 1,
0.8634109, -0.6297287, 2.140744, 0.7882353, 0, 1, 1,
0.865426, 0.3737708, 1.044435, 0.7921569, 0, 1, 1,
0.8687193, -0.8221529, 1.941447, 0.8, 0, 1, 1,
0.8687294, -0.1322006, 1.493434, 0.8078431, 0, 1, 1,
0.868991, -1.177466, 3.17422, 0.8117647, 0, 1, 1,
0.8718817, 0.5664155, 0.4815779, 0.8196079, 0, 1, 1,
0.8769947, -0.6193873, 1.36645, 0.8235294, 0, 1, 1,
0.8777747, 0.1086195, 1.301582, 0.8313726, 0, 1, 1,
0.8819584, -1.446817, 1.952729, 0.8352941, 0, 1, 1,
0.8832627, 0.1413419, 1.110709, 0.8431373, 0, 1, 1,
0.8898163, -1.371321, 2.642126, 0.8470588, 0, 1, 1,
0.8928674, 3.032321, -0.9435798, 0.854902, 0, 1, 1,
0.9002587, -0.04770044, 1.265852, 0.8588235, 0, 1, 1,
0.9086655, -1.113157, 2.50352, 0.8666667, 0, 1, 1,
0.9099843, 0.07687617, 1.311004, 0.8705882, 0, 1, 1,
0.9107333, -0.2613161, 2.158081, 0.8784314, 0, 1, 1,
0.9213775, 0.7875687, 1.131209, 0.8823529, 0, 1, 1,
0.9244964, 0.747191, 0.1249496, 0.8901961, 0, 1, 1,
0.9348083, -2.168858, 3.389549, 0.8941177, 0, 1, 1,
0.937306, -1.518348, 1.977988, 0.9019608, 0, 1, 1,
0.9384122, -0.7057396, 2.884225, 0.9098039, 0, 1, 1,
0.9430502, 0.6490267, 1.190675, 0.9137255, 0, 1, 1,
0.9441934, 0.2786091, -0.2700257, 0.9215686, 0, 1, 1,
0.9459558, 0.1104088, 0.7942343, 0.9254902, 0, 1, 1,
0.9467658, -0.7960369, 1.424212, 0.9333333, 0, 1, 1,
0.9576508, 0.6612834, -0.5592676, 0.9372549, 0, 1, 1,
0.9602656, -2.236028, 3.105923, 0.945098, 0, 1, 1,
0.9637578, -1.379001, 0.9240896, 0.9490196, 0, 1, 1,
0.964472, -0.4452757, 2.43867, 0.9568627, 0, 1, 1,
0.9651812, -1.636587, 2.431399, 0.9607843, 0, 1, 1,
0.9682263, -1.587199, 0.6787062, 0.9686275, 0, 1, 1,
0.9684066, -0.730767, 3.596443, 0.972549, 0, 1, 1,
0.9733008, 0.1679971, 1.588462, 0.9803922, 0, 1, 1,
0.9751309, 1.16987, 1.057324, 0.9843137, 0, 1, 1,
0.979705, -1.007137, 4.055413, 0.9921569, 0, 1, 1,
0.9840247, 1.416875, 1.339124, 0.9960784, 0, 1, 1,
0.9862257, -1.931383, 1.350037, 1, 0, 0.9960784, 1,
0.9878466, -0.5698986, 1.799831, 1, 0, 0.9882353, 1,
0.9901392, -1.921249, 2.411785, 1, 0, 0.9843137, 1,
0.9934439, 0.8404843, 2.113714, 1, 0, 0.9764706, 1,
0.994577, -0.8939357, 1.128453, 1, 0, 0.972549, 1,
0.9965547, -0.3976393, 1.53519, 1, 0, 0.9647059, 1,
0.9990297, -2.048717, 4.663074, 1, 0, 0.9607843, 1,
1.004552, 0.8488314, -0.2641732, 1, 0, 0.9529412, 1,
1.012095, -1.526398, 1.33454, 1, 0, 0.9490196, 1,
1.012118, -0.8083133, 2.500185, 1, 0, 0.9411765, 1,
1.012184, 0.8809207, 1.099476, 1, 0, 0.9372549, 1,
1.015374, 1.504985, -0.3204834, 1, 0, 0.9294118, 1,
1.01868, 1.020277, 1.479466, 1, 0, 0.9254902, 1,
1.019062, 0.154833, 0.6377723, 1, 0, 0.9176471, 1,
1.022629, -0.5770913, 2.834495, 1, 0, 0.9137255, 1,
1.02991, 0.4275183, 0.586316, 1, 0, 0.9058824, 1,
1.030329, -1.16172, 3.253888, 1, 0, 0.9019608, 1,
1.030407, 1.199538, -0.9738042, 1, 0, 0.8941177, 1,
1.032317, -0.7740384, 2.949068, 1, 0, 0.8862745, 1,
1.033301, 1.84508, 1.325652, 1, 0, 0.8823529, 1,
1.034512, -0.5557941, 2.496843, 1, 0, 0.8745098, 1,
1.043389, 1.020566, 0.7163401, 1, 0, 0.8705882, 1,
1.051792, 0.7913215, 1.513878, 1, 0, 0.8627451, 1,
1.056939, -1.629851, 2.497975, 1, 0, 0.8588235, 1,
1.057022, 0.3719114, 2.834618, 1, 0, 0.8509804, 1,
1.068723, 1.743454, 0.6861471, 1, 0, 0.8470588, 1,
1.072105, 0.4087703, 0.4944367, 1, 0, 0.8392157, 1,
1.081645, 0.3404349, 0.4764839, 1, 0, 0.8352941, 1,
1.082052, -0.09920552, 1.799902, 1, 0, 0.827451, 1,
1.089039, 1.352138, 0.2706191, 1, 0, 0.8235294, 1,
1.093336, 0.0766673, 1.222911, 1, 0, 0.8156863, 1,
1.098619, -0.08038954, 3.666961, 1, 0, 0.8117647, 1,
1.127554, -1.322668, 3.424154, 1, 0, 0.8039216, 1,
1.131426, -1.343345, 3.305319, 1, 0, 0.7960784, 1,
1.135357, -1.407176, 1.937865, 1, 0, 0.7921569, 1,
1.140482, -0.8508699, 3.016051, 1, 0, 0.7843137, 1,
1.14341, 0.7878289, 0.5022522, 1, 0, 0.7803922, 1,
1.145258, 1.232498, 0.7356343, 1, 0, 0.772549, 1,
1.146225, -0.5008642, 1.570871, 1, 0, 0.7686275, 1,
1.155135, 0.1245184, 1.345756, 1, 0, 0.7607843, 1,
1.165042, -0.6814691, 2.751822, 1, 0, 0.7568628, 1,
1.165418, -0.006834094, -0.1222711, 1, 0, 0.7490196, 1,
1.181492, 0.01825734, -0.2496217, 1, 0, 0.7450981, 1,
1.199289, -0.7366731, -0.0164481, 1, 0, 0.7372549, 1,
1.211466, -0.4235656, -0.1671003, 1, 0, 0.7333333, 1,
1.212128, 0.4311098, 0.3376319, 1, 0, 0.7254902, 1,
1.222986, -0.4131399, 3.309613, 1, 0, 0.7215686, 1,
1.232203, -0.5674228, 2.469844, 1, 0, 0.7137255, 1,
1.241926, 0.6757904, 1.419243, 1, 0, 0.7098039, 1,
1.248786, 0.9517499, 1.041032, 1, 0, 0.7019608, 1,
1.249418, 0.3299183, 0.4754798, 1, 0, 0.6941177, 1,
1.252528, 1.003024, 0.7082697, 1, 0, 0.6901961, 1,
1.253171, 0.3632083, 1.954835, 1, 0, 0.682353, 1,
1.256256, -1.742657, 0.7073483, 1, 0, 0.6784314, 1,
1.262325, 0.7981935, 0.8724679, 1, 0, 0.6705883, 1,
1.262996, 0.1567832, 0.4351265, 1, 0, 0.6666667, 1,
1.268578, 0.3171463, 1.417797, 1, 0, 0.6588235, 1,
1.282959, 0.05175303, 1.433099, 1, 0, 0.654902, 1,
1.286068, -0.9328094, 2.156991, 1, 0, 0.6470588, 1,
1.286424, -0.1150573, 0.3220425, 1, 0, 0.6431373, 1,
1.292277, 0.556632, 1.180667, 1, 0, 0.6352941, 1,
1.296033, -0.4891959, 1.999968, 1, 0, 0.6313726, 1,
1.314418, 0.3070896, 3.311916, 1, 0, 0.6235294, 1,
1.318387, -1.364016, 1.589192, 1, 0, 0.6196079, 1,
1.318872, -0.2623619, 2.682218, 1, 0, 0.6117647, 1,
1.321084, 1.21049, 2.200385, 1, 0, 0.6078432, 1,
1.326588, 1.086477, 2.119191, 1, 0, 0.6, 1,
1.356991, -1.101673, 3.674372, 1, 0, 0.5921569, 1,
1.357467, 1.550188, 2.255056, 1, 0, 0.5882353, 1,
1.361028, 0.6395261, 1.36587, 1, 0, 0.5803922, 1,
1.368152, 0.9049886, 2.500745, 1, 0, 0.5764706, 1,
1.369018, 0.4000246, 1.434762, 1, 0, 0.5686275, 1,
1.375258, -1.470734, 2.472632, 1, 0, 0.5647059, 1,
1.382343, -1.707108, 5.172608, 1, 0, 0.5568628, 1,
1.392229, 0.8042771, 1.480177, 1, 0, 0.5529412, 1,
1.399035, -0.4361042, 2.381169, 1, 0, 0.5450981, 1,
1.412431, -0.7457342, 2.525964, 1, 0, 0.5411765, 1,
1.432165, -1.45609, 1.707665, 1, 0, 0.5333334, 1,
1.436227, 0.3054371, 0.9384265, 1, 0, 0.5294118, 1,
1.448154, -0.9777281, 2.124283, 1, 0, 0.5215687, 1,
1.45526, -0.5091421, 3.557458, 1, 0, 0.5176471, 1,
1.457811, 1.448945, 0.9577901, 1, 0, 0.509804, 1,
1.458373, -0.1630295, -0.5212837, 1, 0, 0.5058824, 1,
1.463056, 1.238568, 1.696493, 1, 0, 0.4980392, 1,
1.463361, -0.8351569, 1.33209, 1, 0, 0.4901961, 1,
1.470833, -0.4945543, 2.789851, 1, 0, 0.4862745, 1,
1.473103, -1.6792, 3.286148, 1, 0, 0.4784314, 1,
1.477082, 0.3182949, 0.9189381, 1, 0, 0.4745098, 1,
1.482183, 1.868223, 0.3096834, 1, 0, 0.4666667, 1,
1.484201, -1.643181, 2.672201, 1, 0, 0.4627451, 1,
1.487287, -0.1227539, 0.385268, 1, 0, 0.454902, 1,
1.496946, 0.2344687, 0.5331372, 1, 0, 0.4509804, 1,
1.508739, -0.6207544, 2.059187, 1, 0, 0.4431373, 1,
1.509502, -0.8584759, 2.922414, 1, 0, 0.4392157, 1,
1.512485, 0.5979292, 1.663335, 1, 0, 0.4313726, 1,
1.527084, 0.08884384, 4.145446, 1, 0, 0.427451, 1,
1.53525, -0.005708405, 2.336763, 1, 0, 0.4196078, 1,
1.535717, 0.6342482, 2.024088, 1, 0, 0.4156863, 1,
1.553614, -0.1393153, 2.574354, 1, 0, 0.4078431, 1,
1.553635, -0.2272923, 1.829136, 1, 0, 0.4039216, 1,
1.557669, 2.816316, 0.7901186, 1, 0, 0.3960784, 1,
1.565177, -0.2264908, 1.794856, 1, 0, 0.3882353, 1,
1.57254, -0.8437754, 3.497647, 1, 0, 0.3843137, 1,
1.57544, 0.9357717, 0.3922326, 1, 0, 0.3764706, 1,
1.583169, 1.058521, 2.780977, 1, 0, 0.372549, 1,
1.586558, -1.693781, 3.079444, 1, 0, 0.3647059, 1,
1.587716, 0.8346897, 2.29058, 1, 0, 0.3607843, 1,
1.588584, -0.7544976, 1.176128, 1, 0, 0.3529412, 1,
1.595521, 0.479876, 1.335793, 1, 0, 0.3490196, 1,
1.618339, 0.1059396, 1.330598, 1, 0, 0.3411765, 1,
1.624064, -0.9058851, 2.426642, 1, 0, 0.3372549, 1,
1.627075, 0.2904663, 2.571032, 1, 0, 0.3294118, 1,
1.629357, -1.430464, 3.289149, 1, 0, 0.3254902, 1,
1.630523, -0.8245012, 4.369822, 1, 0, 0.3176471, 1,
1.631015, -1.725239, 4.79225, 1, 0, 0.3137255, 1,
1.631816, 0.2071114, 0.03786424, 1, 0, 0.3058824, 1,
1.635821, 0.443456, 2.236568, 1, 0, 0.2980392, 1,
1.642744, 0.1201979, 0.4468181, 1, 0, 0.2941177, 1,
1.650847, -0.3886039, 2.599117, 1, 0, 0.2862745, 1,
1.659042, -0.5149104, 1.03386, 1, 0, 0.282353, 1,
1.661645, 0.7154794, 0.2140487, 1, 0, 0.2745098, 1,
1.663334, 0.3977812, 0.8533441, 1, 0, 0.2705882, 1,
1.694654, 0.6809376, 1.406821, 1, 0, 0.2627451, 1,
1.706049, 0.8189468, -0.857587, 1, 0, 0.2588235, 1,
1.716593, 0.5603276, 1.055726, 1, 0, 0.2509804, 1,
1.718455, -0.5395566, 3.205841, 1, 0, 0.2470588, 1,
1.735102, 0.5277537, 1.610811, 1, 0, 0.2392157, 1,
1.737303, 1.58623, 2.437959, 1, 0, 0.2352941, 1,
1.737516, 0.4326872, 1.262814, 1, 0, 0.227451, 1,
1.737581, -0.3129023, 2.043286, 1, 0, 0.2235294, 1,
1.738307, -0.04289333, 1.157675, 1, 0, 0.2156863, 1,
1.772354, 0.2019311, 2.944617, 1, 0, 0.2117647, 1,
1.779445, -1.907071, 1.638912, 1, 0, 0.2039216, 1,
1.789893, -1.869016, 2.939594, 1, 0, 0.1960784, 1,
1.79491, 0.06095589, 2.084777, 1, 0, 0.1921569, 1,
1.807337, 0.03610599, 0.7502267, 1, 0, 0.1843137, 1,
1.838488, -2.282476, 3.397646, 1, 0, 0.1803922, 1,
1.839938, 1.597547, 1.205844, 1, 0, 0.172549, 1,
1.896508, -0.08793997, 1.608899, 1, 0, 0.1686275, 1,
1.918835, -0.580646, -0.02862598, 1, 0, 0.1607843, 1,
1.921153, -0.291381, 2.19824, 1, 0, 0.1568628, 1,
1.975191, -0.6097919, 1.211469, 1, 0, 0.1490196, 1,
1.980637, -0.2423159, 0.3819854, 1, 0, 0.145098, 1,
1.984564, 1.746134, 1.060475, 1, 0, 0.1372549, 1,
1.989853, 0.0005554609, 1.114586, 1, 0, 0.1333333, 1,
2.000207, 0.4488012, 0.909295, 1, 0, 0.1254902, 1,
2.00933, 0.5992774, 0.4979512, 1, 0, 0.1215686, 1,
2.035703, 0.1966845, 2.33306, 1, 0, 0.1137255, 1,
2.066825, 0.1071359, 1.484509, 1, 0, 0.1098039, 1,
2.183504, -0.6034702, 1.834502, 1, 0, 0.1019608, 1,
2.205863, 3.839296, 0.3107456, 1, 0, 0.09411765, 1,
2.209101, -0.1596445, 1.66857, 1, 0, 0.09019608, 1,
2.275051, 2.312463, 0.5379772, 1, 0, 0.08235294, 1,
2.293697, 0.2865264, 2.481701, 1, 0, 0.07843138, 1,
2.342148, -0.988238, 2.06283, 1, 0, 0.07058824, 1,
2.368997, 2.291145, 2.080019, 1, 0, 0.06666667, 1,
2.436787, -0.2170141, 1.735663, 1, 0, 0.05882353, 1,
2.495188, 0.8813016, 1.902714, 1, 0, 0.05490196, 1,
2.519406, 0.5428091, 0.4945783, 1, 0, 0.04705882, 1,
2.523081, -0.2743817, 1.079198, 1, 0, 0.04313726, 1,
2.532086, -0.4266472, 1.697167, 1, 0, 0.03529412, 1,
2.621719, 0.9284899, 1.433552, 1, 0, 0.03137255, 1,
2.648993, 0.4950878, 1.1364, 1, 0, 0.02352941, 1,
2.650241, -1.511897, 2.668988, 1, 0, 0.01960784, 1,
2.849694, -0.007868055, 1.09977, 1, 0, 0.01176471, 1,
3.032811, -0.1523686, 0.7643287, 1, 0, 0.007843138, 1
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
0.09198236, -4.47192, -7.8449, 0, -0.5, 0.5, 0.5,
0.09198236, -4.47192, -7.8449, 1, -0.5, 0.5, 0.5,
0.09198236, -4.47192, -7.8449, 1, 1.5, 0.5, 0.5,
0.09198236, -4.47192, -7.8449, 0, 1.5, 0.5, 0.5
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
-3.845787, 0.2859762, -7.8449, 0, -0.5, 0.5, 0.5,
-3.845787, 0.2859762, -7.8449, 1, -0.5, 0.5, 0.5,
-3.845787, 0.2859762, -7.8449, 1, 1.5, 0.5, 0.5,
-3.845787, 0.2859762, -7.8449, 0, 1.5, 0.5, 0.5
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
-3.845787, -4.47192, -0.3928082, 0, -0.5, 0.5, 0.5,
-3.845787, -4.47192, -0.3928082, 1, -0.5, 0.5, 0.5,
-3.845787, -4.47192, -0.3928082, 1, 1.5, 0.5, 0.5,
-3.845787, -4.47192, -0.3928082, 0, 1.5, 0.5, 0.5
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
-2, -3.373944, -6.125187,
3, -3.373944, -6.125187,
-2, -3.373944, -6.125187,
-2, -3.55694, -6.411806,
-1, -3.373944, -6.125187,
-1, -3.55694, -6.411806,
0, -3.373944, -6.125187,
0, -3.55694, -6.411806,
1, -3.373944, -6.125187,
1, -3.55694, -6.411806,
2, -3.373944, -6.125187,
2, -3.55694, -6.411806,
3, -3.373944, -6.125187,
3, -3.55694, -6.411806
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
-2, -3.922932, -6.985044, 0, -0.5, 0.5, 0.5,
-2, -3.922932, -6.985044, 1, -0.5, 0.5, 0.5,
-2, -3.922932, -6.985044, 1, 1.5, 0.5, 0.5,
-2, -3.922932, -6.985044, 0, 1.5, 0.5, 0.5,
-1, -3.922932, -6.985044, 0, -0.5, 0.5, 0.5,
-1, -3.922932, -6.985044, 1, -0.5, 0.5, 0.5,
-1, -3.922932, -6.985044, 1, 1.5, 0.5, 0.5,
-1, -3.922932, -6.985044, 0, 1.5, 0.5, 0.5,
0, -3.922932, -6.985044, 0, -0.5, 0.5, 0.5,
0, -3.922932, -6.985044, 1, -0.5, 0.5, 0.5,
0, -3.922932, -6.985044, 1, 1.5, 0.5, 0.5,
0, -3.922932, -6.985044, 0, 1.5, 0.5, 0.5,
1, -3.922932, -6.985044, 0, -0.5, 0.5, 0.5,
1, -3.922932, -6.985044, 1, -0.5, 0.5, 0.5,
1, -3.922932, -6.985044, 1, 1.5, 0.5, 0.5,
1, -3.922932, -6.985044, 0, 1.5, 0.5, 0.5,
2, -3.922932, -6.985044, 0, -0.5, 0.5, 0.5,
2, -3.922932, -6.985044, 1, -0.5, 0.5, 0.5,
2, -3.922932, -6.985044, 1, 1.5, 0.5, 0.5,
2, -3.922932, -6.985044, 0, 1.5, 0.5, 0.5,
3, -3.922932, -6.985044, 0, -0.5, 0.5, 0.5,
3, -3.922932, -6.985044, 1, -0.5, 0.5, 0.5,
3, -3.922932, -6.985044, 1, 1.5, 0.5, 0.5,
3, -3.922932, -6.985044, 0, 1.5, 0.5, 0.5
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
-2.937071, -2, -6.125187,
-2.937071, 2, -6.125187,
-2.937071, -2, -6.125187,
-3.088523, -2, -6.411806,
-2.937071, 0, -6.125187,
-3.088523, 0, -6.411806,
-2.937071, 2, -6.125187,
-3.088523, 2, -6.411806
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
-3.391429, -2, -6.985044, 0, -0.5, 0.5, 0.5,
-3.391429, -2, -6.985044, 1, -0.5, 0.5, 0.5,
-3.391429, -2, -6.985044, 1, 1.5, 0.5, 0.5,
-3.391429, -2, -6.985044, 0, 1.5, 0.5, 0.5,
-3.391429, 0, -6.985044, 0, -0.5, 0.5, 0.5,
-3.391429, 0, -6.985044, 1, -0.5, 0.5, 0.5,
-3.391429, 0, -6.985044, 1, 1.5, 0.5, 0.5,
-3.391429, 0, -6.985044, 0, 1.5, 0.5, 0.5,
-3.391429, 2, -6.985044, 0, -0.5, 0.5, 0.5,
-3.391429, 2, -6.985044, 1, -0.5, 0.5, 0.5,
-3.391429, 2, -6.985044, 1, 1.5, 0.5, 0.5,
-3.391429, 2, -6.985044, 0, 1.5, 0.5, 0.5
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
-2.937071, -3.373944, -4,
-2.937071, -3.373944, 4,
-2.937071, -3.373944, -4,
-3.088523, -3.55694, -4,
-2.937071, -3.373944, -2,
-3.088523, -3.55694, -2,
-2.937071, -3.373944, 0,
-3.088523, -3.55694, 0,
-2.937071, -3.373944, 2,
-3.088523, -3.55694, 2,
-2.937071, -3.373944, 4,
-3.088523, -3.55694, 4
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
-3.391429, -3.922932, -4, 0, -0.5, 0.5, 0.5,
-3.391429, -3.922932, -4, 1, -0.5, 0.5, 0.5,
-3.391429, -3.922932, -4, 1, 1.5, 0.5, 0.5,
-3.391429, -3.922932, -4, 0, 1.5, 0.5, 0.5,
-3.391429, -3.922932, -2, 0, -0.5, 0.5, 0.5,
-3.391429, -3.922932, -2, 1, -0.5, 0.5, 0.5,
-3.391429, -3.922932, -2, 1, 1.5, 0.5, 0.5,
-3.391429, -3.922932, -2, 0, 1.5, 0.5, 0.5,
-3.391429, -3.922932, 0, 0, -0.5, 0.5, 0.5,
-3.391429, -3.922932, 0, 1, -0.5, 0.5, 0.5,
-3.391429, -3.922932, 0, 1, 1.5, 0.5, 0.5,
-3.391429, -3.922932, 0, 0, 1.5, 0.5, 0.5,
-3.391429, -3.922932, 2, 0, -0.5, 0.5, 0.5,
-3.391429, -3.922932, 2, 1, -0.5, 0.5, 0.5,
-3.391429, -3.922932, 2, 1, 1.5, 0.5, 0.5,
-3.391429, -3.922932, 2, 0, 1.5, 0.5, 0.5,
-3.391429, -3.922932, 4, 0, -0.5, 0.5, 0.5,
-3.391429, -3.922932, 4, 1, -0.5, 0.5, 0.5,
-3.391429, -3.922932, 4, 1, 1.5, 0.5, 0.5,
-3.391429, -3.922932, 4, 0, 1.5, 0.5, 0.5
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
-2.937071, -3.373944, -6.125187,
-2.937071, 3.945896, -6.125187,
-2.937071, -3.373944, 5.339571,
-2.937071, 3.945896, 5.339571,
-2.937071, -3.373944, -6.125187,
-2.937071, -3.373944, 5.339571,
-2.937071, 3.945896, -6.125187,
-2.937071, 3.945896, 5.339571,
-2.937071, -3.373944, -6.125187,
3.121036, -3.373944, -6.125187,
-2.937071, -3.373944, 5.339571,
3.121036, -3.373944, 5.339571,
-2.937071, 3.945896, -6.125187,
3.121036, 3.945896, -6.125187,
-2.937071, 3.945896, 5.339571,
3.121036, 3.945896, 5.339571,
3.121036, -3.373944, -6.125187,
3.121036, 3.945896, -6.125187,
3.121036, -3.373944, 5.339571,
3.121036, 3.945896, 5.339571,
3.121036, -3.373944, -6.125187,
3.121036, -3.373944, 5.339571,
3.121036, 3.945896, -6.125187,
3.121036, 3.945896, 5.339571
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
var radius = 7.951137;
var distance = 35.37551;
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
mvMatrix.translate( -0.09198236, -0.2859762, 0.3928082 );
mvMatrix.scale( 1.419078, 1.174469, 0.7498567 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.37551);
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
prolan<-read.table("prolan.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-prolan$V2
```

```
## Error in eval(expr, envir, enclos): object 'prolan' not found
```

```r
y<-prolan$V3
```

```
## Error in eval(expr, envir, enclos): object 'prolan' not found
```

```r
z<-prolan$V4
```

```
## Error in eval(expr, envir, enclos): object 'prolan' not found
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
-2.848846, 1.981833, -1.33545, 0, 0, 1, 1, 1,
-2.813878, 1.246354, -1.118438, 1, 0, 0, 1, 1,
-2.521756, 0.4980676, 1.131009, 1, 0, 0, 1, 1,
-2.453015, -1.109282, -3.411096, 1, 0, 0, 1, 1,
-2.431967, 0.3584945, -1.078542, 1, 0, 0, 1, 1,
-2.350674, 2.28245, -1.185885, 1, 0, 0, 1, 1,
-2.305025, -0.5580162, -1.450644, 0, 0, 0, 1, 1,
-2.195044, -0.6118143, -3.637776, 0, 0, 0, 1, 1,
-2.180561, 2.070741, 0.2177606, 0, 0, 0, 1, 1,
-2.162414, -0.6072969, -2.302546, 0, 0, 0, 1, 1,
-2.16117, 1.089661, -2.16205, 0, 0, 0, 1, 1,
-2.124877, -1.203226, -1.512734, 0, 0, 0, 1, 1,
-2.12046, 1.585608, -2.928579, 0, 0, 0, 1, 1,
-2.096957, -0.3745129, -1.185092, 1, 1, 1, 1, 1,
-2.094968, -0.5556798, -1.396064, 1, 1, 1, 1, 1,
-2.036791, 0.3706662, -0.7083823, 1, 1, 1, 1, 1,
-1.959614, 0.6221409, -3.001519, 1, 1, 1, 1, 1,
-1.958658, -0.7201726, -2.865894, 1, 1, 1, 1, 1,
-1.928979, 0.5556768, -1.603398, 1, 1, 1, 1, 1,
-1.92406, -2.67175, -2.398857, 1, 1, 1, 1, 1,
-1.902017, 1.711141, 0.9183408, 1, 1, 1, 1, 1,
-1.867744, -0.07536197, -2.309875, 1, 1, 1, 1, 1,
-1.861496, 1.313459, -1.268531, 1, 1, 1, 1, 1,
-1.809733, -0.8198484, -1.01212, 1, 1, 1, 1, 1,
-1.805694, -0.9702942, -2.585334, 1, 1, 1, 1, 1,
-1.801547, 1.554227, -1.468543, 1, 1, 1, 1, 1,
-1.794886, 1.320758, -0.7222999, 1, 1, 1, 1, 1,
-1.785672, -1.481607, -1.888205, 1, 1, 1, 1, 1,
-1.773878, 1.313984, -0.518975, 0, 0, 1, 1, 1,
-1.761708, 0.6650925, -1.667994, 1, 0, 0, 1, 1,
-1.758107, 0.4920586, -1.763406, 1, 0, 0, 1, 1,
-1.754643, -1.032212, -3.096862, 1, 0, 0, 1, 1,
-1.75371, -0.3639013, -1.826555, 1, 0, 0, 1, 1,
-1.74463, -0.7631454, -0.9204509, 1, 0, 0, 1, 1,
-1.725956, -1.535985, -4.523847, 0, 0, 0, 1, 1,
-1.722445, 0.06263056, -1.938789, 0, 0, 0, 1, 1,
-1.722388, -1.304624, -2.128766, 0, 0, 0, 1, 1,
-1.720496, -1.526484, -3.123163, 0, 0, 0, 1, 1,
-1.71276, 0.7407441, -0.3937748, 0, 0, 0, 1, 1,
-1.71, 1.624367, 0.1941825, 0, 0, 0, 1, 1,
-1.708576, -0.1674556, -1.855617, 0, 0, 0, 1, 1,
-1.70795, -0.3198881, -2.791968, 1, 1, 1, 1, 1,
-1.650201, 0.1128475, -0.3475022, 1, 1, 1, 1, 1,
-1.643864, 0.1270647, -2.742027, 1, 1, 1, 1, 1,
-1.636862, 1.792972, -2.046124, 1, 1, 1, 1, 1,
-1.623494, -0.4726384, -1.016625, 1, 1, 1, 1, 1,
-1.616536, -1.728177, -0.7608177, 1, 1, 1, 1, 1,
-1.600619, 0.4255017, -1.666059, 1, 1, 1, 1, 1,
-1.598042, -1.16371, -2.218893, 1, 1, 1, 1, 1,
-1.587429, -0.8566772, -2.902478, 1, 1, 1, 1, 1,
-1.586366, -2.783628, -3.618511, 1, 1, 1, 1, 1,
-1.585447, 0.14015, -1.70945, 1, 1, 1, 1, 1,
-1.583266, 0.7990294, -1.20077, 1, 1, 1, 1, 1,
-1.550807, 0.06330636, -2.233938, 1, 1, 1, 1, 1,
-1.544493, -0.5493113, -1.103188, 1, 1, 1, 1, 1,
-1.540363, -0.2288402, -2.534981, 1, 1, 1, 1, 1,
-1.534321, 0.4331972, -1.240161, 0, 0, 1, 1, 1,
-1.520291, 0.7181435, -0.6599322, 1, 0, 0, 1, 1,
-1.518112, -0.0008867845, 0.1054247, 1, 0, 0, 1, 1,
-1.517324, -0.2690264, -0.5633539, 1, 0, 0, 1, 1,
-1.516435, -1.655022, -2.72503, 1, 0, 0, 1, 1,
-1.503974, 1.295256, -2.256905, 1, 0, 0, 1, 1,
-1.502863, 0.04799365, -3.273957, 0, 0, 0, 1, 1,
-1.495084, 0.09468446, -1.187898, 0, 0, 0, 1, 1,
-1.494075, 1.599264, -0.1703413, 0, 0, 0, 1, 1,
-1.477376, -1.172645, -2.713182, 0, 0, 0, 1, 1,
-1.465665, -0.5790283, -4.466707, 0, 0, 0, 1, 1,
-1.462999, -0.7026106, -1.48109, 0, 0, 0, 1, 1,
-1.459358, 0.04589021, -1.728619, 0, 0, 0, 1, 1,
-1.456653, 0.2744378, -2.338995, 1, 1, 1, 1, 1,
-1.444685, -0.4476933, -3.084789, 1, 1, 1, 1, 1,
-1.425867, 0.9473485, -1.010448, 1, 1, 1, 1, 1,
-1.42052, 0.06735025, -0.8266321, 1, 1, 1, 1, 1,
-1.417162, -0.009464842, 1.279691, 1, 1, 1, 1, 1,
-1.414167, -0.1841216, -2.916225, 1, 1, 1, 1, 1,
-1.412862, 0.001785548, -2.257744, 1, 1, 1, 1, 1,
-1.410046, 0.1546632, -1.162265, 1, 1, 1, 1, 1,
-1.408986, 0.03501905, -2.332186, 1, 1, 1, 1, 1,
-1.408797, -0.504569, -1.108163, 1, 1, 1, 1, 1,
-1.402555, -0.1232906, -1.008768, 1, 1, 1, 1, 1,
-1.399332, -0.7676341, -2.725893, 1, 1, 1, 1, 1,
-1.398957, -0.8352008, -2.75711, 1, 1, 1, 1, 1,
-1.394667, 0.0898646, -1.825136, 1, 1, 1, 1, 1,
-1.382357, -0.2273132, -1.577517, 1, 1, 1, 1, 1,
-1.374256, 1.783689, 0.175362, 0, 0, 1, 1, 1,
-1.350569, 0.3345304, -0.58308, 1, 0, 0, 1, 1,
-1.349913, -0.01643985, -1.720315, 1, 0, 0, 1, 1,
-1.339795, 0.009089686, -1.755789, 1, 0, 0, 1, 1,
-1.339166, 0.0001511091, -0.9823478, 1, 0, 0, 1, 1,
-1.336165, 2.761248, 0.2360133, 1, 0, 0, 1, 1,
-1.329875, -0.4857824, -1.842228, 0, 0, 0, 1, 1,
-1.313982, 1.653111, -2.62448, 0, 0, 0, 1, 1,
-1.30879, 0.9835685, -0.7404724, 0, 0, 0, 1, 1,
-1.30255, 1.544186, -1.747594, 0, 0, 0, 1, 1,
-1.298764, 1.044908, -2.395032, 0, 0, 0, 1, 1,
-1.289958, -2.051887, -0.6950623, 0, 0, 0, 1, 1,
-1.280021, -0.3384308, -2.294107, 0, 0, 0, 1, 1,
-1.26166, -0.5790628, -0.7175173, 1, 1, 1, 1, 1,
-1.258982, -1.848003, -2.44308, 1, 1, 1, 1, 1,
-1.251006, 0.317582, -2.006895, 1, 1, 1, 1, 1,
-1.242768, -0.06859172, -1.913394, 1, 1, 1, 1, 1,
-1.242554, -0.3925152, -3.241156, 1, 1, 1, 1, 1,
-1.201878, 0.9994633, -1.723501, 1, 1, 1, 1, 1,
-1.199914, 0.1712038, -0.1205857, 1, 1, 1, 1, 1,
-1.196448, -0.2172123, 0.2704028, 1, 1, 1, 1, 1,
-1.179604, -0.9192046, -2.350737, 1, 1, 1, 1, 1,
-1.178296, 0.1765787, -1.589872, 1, 1, 1, 1, 1,
-1.176663, -0.8120927, -1.627596, 1, 1, 1, 1, 1,
-1.175899, 0.0720752, -0.32336, 1, 1, 1, 1, 1,
-1.170592, 0.08861726, -0.2313929, 1, 1, 1, 1, 1,
-1.170491, 0.4416195, 1.360271, 1, 1, 1, 1, 1,
-1.165863, 0.546811, -1.798983, 1, 1, 1, 1, 1,
-1.152349, 1.183427, -1.94987, 0, 0, 1, 1, 1,
-1.151575, -1.036224, -1.934888, 1, 0, 0, 1, 1,
-1.14623, -0.5430967, -0.9551535, 1, 0, 0, 1, 1,
-1.125244, -2.462765, -2.564082, 1, 0, 0, 1, 1,
-1.125193, -0.2634531, -1.745952, 1, 0, 0, 1, 1,
-1.120095, -0.3073033, -1.896438, 1, 0, 0, 1, 1,
-1.119366, 0.8200594, 0.0526393, 0, 0, 0, 1, 1,
-1.107162, -0.4785594, -0.4610557, 0, 0, 0, 1, 1,
-1.103062, -0.7105232, -2.034143, 0, 0, 0, 1, 1,
-1.100108, -0.7121227, -3.707678, 0, 0, 0, 1, 1,
-1.092669, -0.2238648, -2.268787, 0, 0, 0, 1, 1,
-1.081463, -1.060212, -3.803921, 0, 0, 0, 1, 1,
-1.078209, -1.823479, -3.937694, 0, 0, 0, 1, 1,
-1.078073, -0.01828399, -1.561535, 1, 1, 1, 1, 1,
-1.076897, 1.522788, -1.3536, 1, 1, 1, 1, 1,
-1.074189, 1.06719, -1.172818, 1, 1, 1, 1, 1,
-1.072197, 0.6953642, -1.545289, 1, 1, 1, 1, 1,
-1.070542, 0.5542499, -0.8945634, 1, 1, 1, 1, 1,
-1.067465, 0.4429339, -0.938626, 1, 1, 1, 1, 1,
-1.063358, 0.9519562, -1.551317, 1, 1, 1, 1, 1,
-1.063013, -1.233941, -3.328748, 1, 1, 1, 1, 1,
-1.057238, -0.6356917, -2.042228, 1, 1, 1, 1, 1,
-1.053275, 0.7690603, -1.469103, 1, 1, 1, 1, 1,
-1.052399, -1.071444, -3.429238, 1, 1, 1, 1, 1,
-1.045539, -0.2374857, -4.397357, 1, 1, 1, 1, 1,
-1.044797, -0.7322641, -3.01651, 1, 1, 1, 1, 1,
-1.041437, -0.0632168, -0.5966168, 1, 1, 1, 1, 1,
-1.033295, -1.277574, -2.779734, 1, 1, 1, 1, 1,
-1.032955, -0.8651828, -0.4621165, 0, 0, 1, 1, 1,
-1.032583, 0.9490904, -0.2099212, 1, 0, 0, 1, 1,
-1.031846, -0.9241388, -2.617149, 1, 0, 0, 1, 1,
-1.031199, -1.088742, -1.65602, 1, 0, 0, 1, 1,
-1.030707, 0.7956057, -1.797483, 1, 0, 0, 1, 1,
-1.028263, -0.1768381, -2.445588, 1, 0, 0, 1, 1,
-1.012724, -0.4089063, -2.189903, 0, 0, 0, 1, 1,
-1.009906, 0.8958828, -1.795396, 0, 0, 0, 1, 1,
-1.007783, 0.07663277, -0.8334886, 0, 0, 0, 1, 1,
-0.9900509, -1.710307, -4.475435, 0, 0, 0, 1, 1,
-0.9829985, -0.1582394, -2.168323, 0, 0, 0, 1, 1,
-0.9814258, 0.4251805, -1.439367, 0, 0, 0, 1, 1,
-0.9782906, -0.8491194, -3.148474, 0, 0, 0, 1, 1,
-0.960582, 0.5190217, -1.101755, 1, 1, 1, 1, 1,
-0.9602297, -1.098254, -3.920506, 1, 1, 1, 1, 1,
-0.95795, -0.206282, -2.797624, 1, 1, 1, 1, 1,
-0.9569265, -0.08405085, -1.754507, 1, 1, 1, 1, 1,
-0.9497406, -1.54273, -2.400066, 1, 1, 1, 1, 1,
-0.9429639, -0.4939319, -3.141271, 1, 1, 1, 1, 1,
-0.9267573, 1.020098, -1.487354, 1, 1, 1, 1, 1,
-0.9248847, -1.747213, -2.904559, 1, 1, 1, 1, 1,
-0.9239663, -0.343924, -3.623658, 1, 1, 1, 1, 1,
-0.9212314, 0.5535548, -1.32782, 1, 1, 1, 1, 1,
-0.9195886, 1.603099, -1.099783, 1, 1, 1, 1, 1,
-0.9149522, -0.8423584, -3.432111, 1, 1, 1, 1, 1,
-0.912731, 0.5957425, -0.03531945, 1, 1, 1, 1, 1,
-0.9081835, 2.259488, 0.9087916, 1, 1, 1, 1, 1,
-0.9059516, -1.09103, -1.973332, 1, 1, 1, 1, 1,
-0.9039803, -1.111932, -3.698197, 0, 0, 1, 1, 1,
-0.903412, -1.615795, -3.263674, 1, 0, 0, 1, 1,
-0.9004561, -1.391072, -2.564218, 1, 0, 0, 1, 1,
-0.8903126, -1.04764, -4.766119, 1, 0, 0, 1, 1,
-0.8896991, -0.002661057, -1.165932, 1, 0, 0, 1, 1,
-0.8851691, 1.291029, -1.924311, 1, 0, 0, 1, 1,
-0.8830084, -0.5824298, -0.2536663, 0, 0, 0, 1, 1,
-0.8789872, -0.7016281, -3.14659, 0, 0, 0, 1, 1,
-0.8788252, -0.3367118, -1.49356, 0, 0, 0, 1, 1,
-0.8761539, 1.443998, -0.266756, 0, 0, 0, 1, 1,
-0.875019, 0.4250354, -0.5255359, 0, 0, 0, 1, 1,
-0.8670839, -0.7757109, -2.717599, 0, 0, 0, 1, 1,
-0.8661262, -0.03375763, -2.04408, 0, 0, 0, 1, 1,
-0.8623877, -0.2562672, -1.79966, 1, 1, 1, 1, 1,
-0.8535683, 0.526494, -0.7928421, 1, 1, 1, 1, 1,
-0.8497262, 0.09396826, -2.777723, 1, 1, 1, 1, 1,
-0.8431611, -0.007664977, -2.322431, 1, 1, 1, 1, 1,
-0.8392801, -0.2278535, -0.5531818, 1, 1, 1, 1, 1,
-0.83682, -0.8042521, -2.706213, 1, 1, 1, 1, 1,
-0.8349415, 0.1056048, -0.5959933, 1, 1, 1, 1, 1,
-0.8332167, 1.143155, -0.3781161, 1, 1, 1, 1, 1,
-0.8284641, 0.386675, -1.691128, 1, 1, 1, 1, 1,
-0.8208666, -0.4724856, -0.9637107, 1, 1, 1, 1, 1,
-0.8115516, 1.18917, -0.745884, 1, 1, 1, 1, 1,
-0.8106112, 1.419467, -1.215937, 1, 1, 1, 1, 1,
-0.8091029, -0.5040079, -1.21305, 1, 1, 1, 1, 1,
-0.8082116, -1.420936, -2.660722, 1, 1, 1, 1, 1,
-0.806136, -0.5711524, -2.276556, 1, 1, 1, 1, 1,
-0.8024876, -0.2685662, -2.973346, 0, 0, 1, 1, 1,
-0.8019229, -0.4128108, -1.646925, 1, 0, 0, 1, 1,
-0.8010377, 1.445037, -1.749331, 1, 0, 0, 1, 1,
-0.7997668, -0.4680555, -3.772281, 1, 0, 0, 1, 1,
-0.7994222, 0.7869195, -2.93511, 1, 0, 0, 1, 1,
-0.7970541, -1.006134, -0.623731, 1, 0, 0, 1, 1,
-0.7963728, 0.0883624, -1.402313, 0, 0, 0, 1, 1,
-0.7928155, 1.52993, -1.133292, 0, 0, 0, 1, 1,
-0.7875786, 0.4374104, -1.908937, 0, 0, 0, 1, 1,
-0.7851558, -0.4465915, -2.348723, 0, 0, 0, 1, 1,
-0.7820952, -0.585942, -1.884316, 0, 0, 0, 1, 1,
-0.7706909, 0.7808439, -1.014512, 0, 0, 0, 1, 1,
-0.7667914, 1.19292, 0.5523152, 0, 0, 0, 1, 1,
-0.7602957, 0.0263203, -0.1177218, 1, 1, 1, 1, 1,
-0.7577201, -0.8498421, -3.536418, 1, 1, 1, 1, 1,
-0.7573618, -1.237089, -3.405152, 1, 1, 1, 1, 1,
-0.7569134, 0.02630041, 0.1680404, 1, 1, 1, 1, 1,
-0.7544419, 1.579463, -0.3305371, 1, 1, 1, 1, 1,
-0.7536875, 0.987, -1.200772, 1, 1, 1, 1, 1,
-0.7471817, 1.126082, 0.3331502, 1, 1, 1, 1, 1,
-0.7467923, 0.96443, 0.5404495, 1, 1, 1, 1, 1,
-0.7366281, 0.03093666, -2.765652, 1, 1, 1, 1, 1,
-0.7356864, 1.854155, -0.03006551, 1, 1, 1, 1, 1,
-0.733478, -1.147729, -3.230227, 1, 1, 1, 1, 1,
-0.7317497, 0.06979178, -3.51778, 1, 1, 1, 1, 1,
-0.7303094, -0.3273149, -0.7375315, 1, 1, 1, 1, 1,
-0.7221386, -0.2508359, -2.008704, 1, 1, 1, 1, 1,
-0.7178894, -1.863744, -2.255153, 1, 1, 1, 1, 1,
-0.7140489, -0.3661385, -0.439883, 0, 0, 1, 1, 1,
-0.7134675, -0.4130844, -3.103649, 1, 0, 0, 1, 1,
-0.7110896, 1.865614, -0.6117095, 1, 0, 0, 1, 1,
-0.7097869, 2.378661, -0.1708379, 1, 0, 0, 1, 1,
-0.7084687, -0.8169557, -0.5000843, 1, 0, 0, 1, 1,
-0.7065, 0.2914836, -1.922269, 1, 0, 0, 1, 1,
-0.7032575, -1.086107, -4.043693, 0, 0, 0, 1, 1,
-0.7003899, 2.241659, -1.482077, 0, 0, 0, 1, 1,
-0.697326, -0.05113723, -1.648234, 0, 0, 0, 1, 1,
-0.6922536, 0.1726585, -0.7123233, 0, 0, 0, 1, 1,
-0.6891622, 0.2556352, -1.457682, 0, 0, 0, 1, 1,
-0.6879961, 1.108856, -0.8911401, 0, 0, 0, 1, 1,
-0.675065, 0.5632904, -0.3136027, 0, 0, 0, 1, 1,
-0.6655406, 1.100862, -0.6395191, 1, 1, 1, 1, 1,
-0.6647459, 0.07067906, 0.8846232, 1, 1, 1, 1, 1,
-0.6623928, 0.7864097, -1.35723, 1, 1, 1, 1, 1,
-0.6577197, -1.213811, -4.457952, 1, 1, 1, 1, 1,
-0.6562454, 3.069685, 1.004837, 1, 1, 1, 1, 1,
-0.6553146, -2.087274, -2.166165, 1, 1, 1, 1, 1,
-0.654071, 0.6004886, 0.7090778, 1, 1, 1, 1, 1,
-0.6535489, -2.108907, -2.481508, 1, 1, 1, 1, 1,
-0.6523648, -0.7462572, -1.175868, 1, 1, 1, 1, 1,
-0.650623, -1.758473, -2.535088, 1, 1, 1, 1, 1,
-0.6487005, -2.023, -1.672408, 1, 1, 1, 1, 1,
-0.6449339, -1.117015, -2.349759, 1, 1, 1, 1, 1,
-0.6440179, 0.2899901, -0.173321, 1, 1, 1, 1, 1,
-0.6438769, 1.432697, 0.7157049, 1, 1, 1, 1, 1,
-0.6434969, 0.7345131, -0.7561726, 1, 1, 1, 1, 1,
-0.6393658, 0.2131672, -0.2820514, 0, 0, 1, 1, 1,
-0.6390084, 1.010388, -0.7772321, 1, 0, 0, 1, 1,
-0.632515, 0.8248445, -1.275248, 1, 0, 0, 1, 1,
-0.6302397, 2.091553, 0.6036424, 1, 0, 0, 1, 1,
-0.6300807, -1.266256, -1.946508, 1, 0, 0, 1, 1,
-0.6256191, -2.041767, -2.85523, 1, 0, 0, 1, 1,
-0.6232169, -1.297421, -1.173376, 0, 0, 0, 1, 1,
-0.6231392, 0.8693277, 0.9237794, 0, 0, 0, 1, 1,
-0.6147376, -1.17371, -4.767956, 0, 0, 0, 1, 1,
-0.6132064, -0.02117142, -1.666741, 0, 0, 0, 1, 1,
-0.6109163, -1.992126, -1.562858, 0, 0, 0, 1, 1,
-0.6108578, -0.629437, -1.051436, 0, 0, 0, 1, 1,
-0.60984, -0.882852, -0.6937304, 0, 0, 0, 1, 1,
-0.5989241, 2.390872, 0.6928697, 1, 1, 1, 1, 1,
-0.5950755, 0.9185415, -0.7429454, 1, 1, 1, 1, 1,
-0.5882009, 2.93938, -0.5420176, 1, 1, 1, 1, 1,
-0.5846936, -0.5060843, -3.001256, 1, 1, 1, 1, 1,
-0.5828815, 0.2011058, -3.367019, 1, 1, 1, 1, 1,
-0.5816614, 1.074747, 1.045893, 1, 1, 1, 1, 1,
-0.578729, -0.440306, -1.810545, 1, 1, 1, 1, 1,
-0.5716494, 2.147045, -0.9973294, 1, 1, 1, 1, 1,
-0.566017, -2.088335, -3.128917, 1, 1, 1, 1, 1,
-0.5621244, -0.1293867, -3.297039, 1, 1, 1, 1, 1,
-0.5594994, -1.674938, -2.555051, 1, 1, 1, 1, 1,
-0.5542729, 1.600664, -0.1624953, 1, 1, 1, 1, 1,
-0.5521712, 0.7401986, -1.515712, 1, 1, 1, 1, 1,
-0.5520887, 1.868393, -0.2115946, 1, 1, 1, 1, 1,
-0.549579, -0.5459379, -3.276171, 1, 1, 1, 1, 1,
-0.5476341, 1.488926, -1.367219, 0, 0, 1, 1, 1,
-0.5442749, 0.6734277, -0.7648401, 1, 0, 0, 1, 1,
-0.5431809, 0.1086623, -1.901208, 1, 0, 0, 1, 1,
-0.5426657, 1.997103, -0.4904901, 1, 0, 0, 1, 1,
-0.5389332, 1.157706, -0.6074837, 1, 0, 0, 1, 1,
-0.537791, 1.06808, -2.47253, 1, 0, 0, 1, 1,
-0.5300674, -1.841816, -1.733125, 0, 0, 0, 1, 1,
-0.5286856, 1.463555, 0.9917569, 0, 0, 0, 1, 1,
-0.5263783, 0.006418483, 0.1659771, 0, 0, 0, 1, 1,
-0.5252811, -1.654559, -4.495349, 0, 0, 0, 1, 1,
-0.5212111, 0.3367228, -1.454312, 0, 0, 0, 1, 1,
-0.5195512, -1.588978, -2.146489, 0, 0, 0, 1, 1,
-0.5169449, 1.02488, 0.6247487, 0, 0, 0, 1, 1,
-0.5155658, -0.4573332, -3.733745, 1, 1, 1, 1, 1,
-0.5129224, -0.4392243, -1.167941, 1, 1, 1, 1, 1,
-0.5110486, -0.9115307, -2.961091, 1, 1, 1, 1, 1,
-0.4996651, 0.6840985, -1.391031, 1, 1, 1, 1, 1,
-0.4917766, -0.8248527, -2.934454, 1, 1, 1, 1, 1,
-0.481378, -0.147233, -1.297954, 1, 1, 1, 1, 1,
-0.4710955, -0.6816181, -3.132444, 1, 1, 1, 1, 1,
-0.4678708, -1.405255, -2.550284, 1, 1, 1, 1, 1,
-0.4618499, 0.4519594, -0.1450255, 1, 1, 1, 1, 1,
-0.4560898, 0.2806979, -2.066853, 1, 1, 1, 1, 1,
-0.4559924, -0.6368991, -2.515722, 1, 1, 1, 1, 1,
-0.4521869, -0.264703, -2.485442, 1, 1, 1, 1, 1,
-0.4432395, -1.307501, -2.134862, 1, 1, 1, 1, 1,
-0.4431134, 1.206796, 0.2595537, 1, 1, 1, 1, 1,
-0.4414899, 0.6628347, 0.6382878, 1, 1, 1, 1, 1,
-0.4412601, -0.2170364, -2.332963, 0, 0, 1, 1, 1,
-0.4347625, -0.9946417, -2.928874, 1, 0, 0, 1, 1,
-0.4329492, 0.3069264, -0.547485, 1, 0, 0, 1, 1,
-0.427502, -0.564446, -1.186638, 1, 0, 0, 1, 1,
-0.4268555, -2.639138, -3.137647, 1, 0, 0, 1, 1,
-0.4266007, -0.9291718, -2.473931, 1, 0, 0, 1, 1,
-0.4254681, 2.261178, 0.1196057, 0, 0, 0, 1, 1,
-0.4215422, 0.05032426, -1.003762, 0, 0, 0, 1, 1,
-0.4214703, 0.3075835, -2.031975, 0, 0, 0, 1, 1,
-0.4162053, -0.0978751, -1.337361, 0, 0, 0, 1, 1,
-0.4144451, -0.1572162, -1.831895, 0, 0, 0, 1, 1,
-0.4140305, 0.315476, -2.388511, 0, 0, 0, 1, 1,
-0.4077186, -0.5924636, -3.28033, 0, 0, 0, 1, 1,
-0.4047373, -2.299922, -3.072969, 1, 1, 1, 1, 1,
-0.403803, 0.873044, 0.1954585, 1, 1, 1, 1, 1,
-0.4011631, -0.5714517, -1.453584, 1, 1, 1, 1, 1,
-0.3987293, 0.2628938, -1.452825, 1, 1, 1, 1, 1,
-0.3927345, -0.4308626, -1.876856, 1, 1, 1, 1, 1,
-0.3918304, -0.1685857, -1.649137, 1, 1, 1, 1, 1,
-0.3911074, -1.719191, -0.7833582, 1, 1, 1, 1, 1,
-0.3906019, 0.7081058, -1.154217, 1, 1, 1, 1, 1,
-0.3899186, 0.6063675, -0.4681539, 1, 1, 1, 1, 1,
-0.3820764, -0.6980817, -2.0231, 1, 1, 1, 1, 1,
-0.3795438, -1.674437, -3.649347, 1, 1, 1, 1, 1,
-0.37941, 0.366307, -2.01368, 1, 1, 1, 1, 1,
-0.3779586, 0.05842949, -1.235831, 1, 1, 1, 1, 1,
-0.3757766, -0.3815584, -1.97937, 1, 1, 1, 1, 1,
-0.374022, 0.8021257, -0.4820957, 1, 1, 1, 1, 1,
-0.3734549, 0.639178, -0.5654836, 0, 0, 1, 1, 1,
-0.3683058, 0.768935, -1.401572, 1, 0, 0, 1, 1,
-0.3631941, 0.4357901, -1.251917, 1, 0, 0, 1, 1,
-0.355662, 0.5690624, -0.08776581, 1, 0, 0, 1, 1,
-0.3553121, 0.7097552, 0.1810591, 1, 0, 0, 1, 1,
-0.3548687, -0.3685942, -4.401297, 1, 0, 0, 1, 1,
-0.3536268, 0.3804033, -0.9520357, 0, 0, 0, 1, 1,
-0.3519103, 0.03586405, -0.9768675, 0, 0, 0, 1, 1,
-0.3483005, 0.9222288, -0.8507057, 0, 0, 0, 1, 1,
-0.347247, -0.07165258, -2.25069, 0, 0, 0, 1, 1,
-0.3465998, -0.5232328, -2.005955, 0, 0, 0, 1, 1,
-0.3349113, -1.37621, -3.399028, 0, 0, 0, 1, 1,
-0.3348912, -0.3446194, -2.569712, 0, 0, 0, 1, 1,
-0.3334551, 1.158514, 0.7571474, 1, 1, 1, 1, 1,
-0.3313397, -1.006024, -3.033717, 1, 1, 1, 1, 1,
-0.3312281, 2.278962, -0.1671263, 1, 1, 1, 1, 1,
-0.3311556, 0.05009225, -1.262491, 1, 1, 1, 1, 1,
-0.3297502, -0.3802134, -2.749072, 1, 1, 1, 1, 1,
-0.326559, 1.392104, -1.627925, 1, 1, 1, 1, 1,
-0.3196499, -1.001532, -1.643185, 1, 1, 1, 1, 1,
-0.3195063, -0.5591494, -2.235329, 1, 1, 1, 1, 1,
-0.3147189, -0.8521075, -2.068045, 1, 1, 1, 1, 1,
-0.314716, -0.2610683, -5.958224, 1, 1, 1, 1, 1,
-0.3098838, 0.6591001, -2.428098, 1, 1, 1, 1, 1,
-0.3091427, -2.001773, -2.890238, 1, 1, 1, 1, 1,
-0.3051581, -0.5057308, -2.538284, 1, 1, 1, 1, 1,
-0.2981796, 1.725758, 1.310236, 1, 1, 1, 1, 1,
-0.2979162, -0.0495905, -1.321306, 1, 1, 1, 1, 1,
-0.2956148, -0.9860047, -4.096082, 0, 0, 1, 1, 1,
-0.2929339, 0.1347106, -0.8236621, 1, 0, 0, 1, 1,
-0.2923632, -0.209414, -1.606687, 1, 0, 0, 1, 1,
-0.2914009, -0.9856179, -1.697409, 1, 0, 0, 1, 1,
-0.288509, 0.7768502, -1.349243, 1, 0, 0, 1, 1,
-0.2824672, -0.1275581, -2.07017, 1, 0, 0, 1, 1,
-0.281338, -1.056348, -1.572112, 0, 0, 0, 1, 1,
-0.2805209, 0.8240374, 1.374153, 0, 0, 0, 1, 1,
-0.2802661, 1.678495, 1.043102, 0, 0, 0, 1, 1,
-0.2785149, 1.127107, -0.0862471, 0, 0, 0, 1, 1,
-0.2709705, 0.6093165, 1.264699, 0, 0, 0, 1, 1,
-0.2665739, 0.2240549, 0.3872085, 0, 0, 0, 1, 1,
-0.2632561, -0.8915924, -0.6630511, 0, 0, 0, 1, 1,
-0.2628956, 0.9097127, 0.8750886, 1, 1, 1, 1, 1,
-0.2619716, -0.305817, -3.433347, 1, 1, 1, 1, 1,
-0.2581453, 0.488747, 0.873201, 1, 1, 1, 1, 1,
-0.2547527, 0.1649963, -2.006339, 1, 1, 1, 1, 1,
-0.2547089, 0.3546016, -0.2227536, 1, 1, 1, 1, 1,
-0.2529504, -0.4962285, -3.136842, 1, 1, 1, 1, 1,
-0.2500455, -1.013869, -1.758646, 1, 1, 1, 1, 1,
-0.2464874, 0.8311896, 0.8252892, 1, 1, 1, 1, 1,
-0.2447826, 1.083994, -1.708743, 1, 1, 1, 1, 1,
-0.2444195, 0.3026641, -2.979985, 1, 1, 1, 1, 1,
-0.2441597, -0.7884949, -2.036265, 1, 1, 1, 1, 1,
-0.2425983, -0.9347796, -1.956038, 1, 1, 1, 1, 1,
-0.2415288, -0.2347905, -1.256379, 1, 1, 1, 1, 1,
-0.2368332, 2.087919, 0.3552425, 1, 1, 1, 1, 1,
-0.2336335, -1.279229, -4.18849, 1, 1, 1, 1, 1,
-0.2298334, 0.4955388, -0.2003113, 0, 0, 1, 1, 1,
-0.2297975, -0.6365299, -4.135278, 1, 0, 0, 1, 1,
-0.2295331, -0.03175038, -2.009548, 1, 0, 0, 1, 1,
-0.2265741, -0.7465275, -3.393815, 1, 0, 0, 1, 1,
-0.2237032, 0.2030978, -0.3117942, 1, 0, 0, 1, 1,
-0.2171954, 1.734781, 0.01519263, 1, 0, 0, 1, 1,
-0.2156244, -1.074549, -2.197738, 0, 0, 0, 1, 1,
-0.2142129, -0.0939644, -2.524139, 0, 0, 0, 1, 1,
-0.2119331, 0.418788, 1.155534, 0, 0, 0, 1, 1,
-0.2015293, 0.7802923, 0.8378615, 0, 0, 0, 1, 1,
-0.2000795, 1.254752, -0.93858, 0, 0, 0, 1, 1,
-0.1981046, -0.07743293, -0.8263916, 0, 0, 0, 1, 1,
-0.191706, -1.459914, -2.86755, 0, 0, 0, 1, 1,
-0.1900614, -0.1086945, -2.696275, 1, 1, 1, 1, 1,
-0.1898686, -1.362509, -2.917865, 1, 1, 1, 1, 1,
-0.1890728, -0.7240991, -1.897814, 1, 1, 1, 1, 1,
-0.1861336, -0.7771895, -5.265742, 1, 1, 1, 1, 1,
-0.1845815, -0.09108293, -3.143389, 1, 1, 1, 1, 1,
-0.1843881, 0.560988, 0.127789, 1, 1, 1, 1, 1,
-0.1733303, 0.1243718, -1.904289, 1, 1, 1, 1, 1,
-0.1711927, -1.204591, -2.84676, 1, 1, 1, 1, 1,
-0.1709395, 0.9893641, 0.045369, 1, 1, 1, 1, 1,
-0.1698209, -0.1813577, -2.738454, 1, 1, 1, 1, 1,
-0.1687009, -0.6079464, -3.293091, 1, 1, 1, 1, 1,
-0.1647095, 0.8432083, 0.7023156, 1, 1, 1, 1, 1,
-0.1640468, -1.162723, -1.553821, 1, 1, 1, 1, 1,
-0.1620603, 0.1137485, -1.235086, 1, 1, 1, 1, 1,
-0.1602467, -0.6862368, -3.998115, 1, 1, 1, 1, 1,
-0.157612, -0.9528419, -4.086062, 0, 0, 1, 1, 1,
-0.1573949, -0.2406107, -2.653316, 1, 0, 0, 1, 1,
-0.1554853, -0.929779, -2.121902, 1, 0, 0, 1, 1,
-0.1515791, 1.727807, 0.5434278, 1, 0, 0, 1, 1,
-0.1419756, 1.013314, 0.2146454, 1, 0, 0, 1, 1,
-0.1398961, -0.1867618, -2.690005, 1, 0, 0, 1, 1,
-0.1391747, -0.6421526, -4.873872, 0, 0, 0, 1, 1,
-0.1386393, 0.0966494, -1.822621, 0, 0, 0, 1, 1,
-0.1370457, -0.4997956, -3.336722, 0, 0, 0, 1, 1,
-0.1340309, -0.4640143, -4.153067, 0, 0, 0, 1, 1,
-0.1291214, 0.1037733, 0.1607296, 0, 0, 0, 1, 1,
-0.1247869, 1.760918, -0.1787702, 0, 0, 0, 1, 1,
-0.1246627, 1.774808, 1.474853, 0, 0, 0, 1, 1,
-0.1204581, 2.606106, -0.116963, 1, 1, 1, 1, 1,
-0.1199751, 0.1521939, -1.813043, 1, 1, 1, 1, 1,
-0.1178442, 0.9537352, 1.024539, 1, 1, 1, 1, 1,
-0.1165529, -0.9566255, -2.736571, 1, 1, 1, 1, 1,
-0.1151592, -1.657021, -3.40234, 1, 1, 1, 1, 1,
-0.1144653, 0.5716172, -0.4494635, 1, 1, 1, 1, 1,
-0.1129493, 0.4975248, -1.789221, 1, 1, 1, 1, 1,
-0.1102923, -0.9143671, -2.862974, 1, 1, 1, 1, 1,
-0.1094563, 1.353871, 1.693961, 1, 1, 1, 1, 1,
-0.1086006, -2.186017, -2.322289, 1, 1, 1, 1, 1,
-0.1007521, 0.3339605, 0.929593, 1, 1, 1, 1, 1,
-0.09896772, 0.3410949, -0.04507142, 1, 1, 1, 1, 1,
-0.09786964, -0.2211925, -4.225103, 1, 1, 1, 1, 1,
-0.09610534, 0.2663304, -0.8486557, 1, 1, 1, 1, 1,
-0.09532477, -0.3338968, -3.169004, 1, 1, 1, 1, 1,
-0.0942563, 0.06071969, -1.297416, 0, 0, 1, 1, 1,
-0.09391501, 0.5234675, -2.384098, 1, 0, 0, 1, 1,
-0.09338955, -0.2364507, -2.833748, 1, 0, 0, 1, 1,
-0.09327311, -0.5598909, -2.539058, 1, 0, 0, 1, 1,
-0.09149133, 0.9315578, -0.9086343, 1, 0, 0, 1, 1,
-0.08996956, 0.05993855, -1.561553, 1, 0, 0, 1, 1,
-0.08989415, 1.453531, 0.5534589, 0, 0, 0, 1, 1,
-0.08288467, 0.8689936, -0.1673103, 0, 0, 0, 1, 1,
-0.07871549, 0.5008993, 0.03994364, 0, 0, 0, 1, 1,
-0.0763986, 0.5917675, 0.3418943, 0, 0, 0, 1, 1,
-0.07378579, 1.169543, -1.620677, 0, 0, 0, 1, 1,
-0.07365795, -0.7077914, -4.372871, 0, 0, 0, 1, 1,
-0.07281796, -0.6890085, -1.834526, 0, 0, 0, 1, 1,
-0.06911561, -1.435123, -2.916354, 1, 1, 1, 1, 1,
-0.06832889, 1.655432, 0.9532143, 1, 1, 1, 1, 1,
-0.06769714, -0.1474134, -3.986076, 1, 1, 1, 1, 1,
-0.06576642, 0.4756275, 0.7107282, 1, 1, 1, 1, 1,
-0.06355739, -2.365845, -4.005973, 1, 1, 1, 1, 1,
-0.06281754, 1.521616, -2.068663, 1, 1, 1, 1, 1,
-0.06226753, -0.6624856, -3.387828, 1, 1, 1, 1, 1,
-0.05861713, -0.7659647, -1.925842, 1, 1, 1, 1, 1,
-0.05415022, -0.1783395, -2.516331, 1, 1, 1, 1, 1,
-0.05319422, -1.565559, -3.13928, 1, 1, 1, 1, 1,
-0.04756613, 0.2552472, -1.169569, 1, 1, 1, 1, 1,
-0.04619503, 0.3874747, -0.6199831, 1, 1, 1, 1, 1,
-0.04522644, 0.1206516, -0.2054841, 1, 1, 1, 1, 1,
-0.04250742, 1.751227, 0.2300911, 1, 1, 1, 1, 1,
-0.04044956, -0.4020539, -3.478998, 1, 1, 1, 1, 1,
-0.04027287, -0.6549119, -3.328851, 0, 0, 1, 1, 1,
-0.03820262, 0.4782044, -0.2772937, 1, 0, 0, 1, 1,
-0.03569418, 0.9150065, -0.3694365, 1, 0, 0, 1, 1,
-0.02612515, -0.5955715, -2.885611, 1, 0, 0, 1, 1,
-0.02510964, -0.5112908, -2.463196, 1, 0, 0, 1, 1,
-0.02317272, -0.9790242, -4.206642, 1, 0, 0, 1, 1,
-0.01983261, -0.08442401, -2.92163, 0, 0, 0, 1, 1,
-0.01666118, 1.058267, -1.096743, 0, 0, 0, 1, 1,
-0.01267658, -0.6536571, -1.762312, 0, 0, 0, 1, 1,
-0.01231775, 0.7424684, 0.3591224, 0, 0, 0, 1, 1,
-0.007641817, 0.9547715, -0.4798263, 0, 0, 0, 1, 1,
-0.006012246, 0.496913, 0.3002005, 0, 0, 0, 1, 1,
0.002466025, -0.0146938, 2.9337, 0, 0, 0, 1, 1,
0.004371549, 0.5002659, 0.641916, 1, 1, 1, 1, 1,
0.00494125, 0.8477674, -1.069386, 1, 1, 1, 1, 1,
0.01207402, 0.195768, 1.512316, 1, 1, 1, 1, 1,
0.0130315, 0.9820098, 0.2814979, 1, 1, 1, 1, 1,
0.01949206, 0.4503183, 1.304338, 1, 1, 1, 1, 1,
0.01975874, -0.5354928, 3.139976, 1, 1, 1, 1, 1,
0.02073609, -0.0471488, 3.990258, 1, 1, 1, 1, 1,
0.02874895, -0.1794007, 2.816495, 1, 1, 1, 1, 1,
0.03084238, 0.04655695, 1.779755, 1, 1, 1, 1, 1,
0.03413199, -0.9944566, 3.273701, 1, 1, 1, 1, 1,
0.03944165, -1.538829, 3.169486, 1, 1, 1, 1, 1,
0.04396896, -0.07430214, 3.488039, 1, 1, 1, 1, 1,
0.04491964, 0.8607002, 0.00221472, 1, 1, 1, 1, 1,
0.04709482, -1.152884, 3.466582, 1, 1, 1, 1, 1,
0.04811218, -0.4648131, 4.007602, 1, 1, 1, 1, 1,
0.04811333, 0.5646234, 0.2391623, 0, 0, 1, 1, 1,
0.04923745, -0.8209195, 2.148551, 1, 0, 0, 1, 1,
0.05103213, 0.3880467, 0.4187713, 1, 0, 0, 1, 1,
0.05203095, 0.3623169, 0.10694, 1, 0, 0, 1, 1,
0.05338328, 2.619866, -1.83971, 1, 0, 0, 1, 1,
0.05368543, 0.9390875, -2.47345, 1, 0, 0, 1, 1,
0.05779994, 0.5000823, -0.05763974, 0, 0, 0, 1, 1,
0.05890495, -1.029603, 5.132388, 0, 0, 0, 1, 1,
0.06101782, 0.1948511, -0.6978816, 0, 0, 0, 1, 1,
0.06133016, 0.5103909, 2.732843, 0, 0, 0, 1, 1,
0.06495269, -0.7247813, 2.59782, 0, 0, 0, 1, 1,
0.06578888, 0.2850518, -1.410148, 0, 0, 0, 1, 1,
0.06586435, 0.7289078, 2.438401, 0, 0, 0, 1, 1,
0.06688754, 1.495668, 0.04028948, 1, 1, 1, 1, 1,
0.06998929, -0.4888385, 4.302201, 1, 1, 1, 1, 1,
0.07772362, -0.09211992, 2.576858, 1, 1, 1, 1, 1,
0.07931247, -1.47871, 1.424667, 1, 1, 1, 1, 1,
0.08059946, -0.2006662, 1.529233, 1, 1, 1, 1, 1,
0.08065471, -0.3563968, 2.950258, 1, 1, 1, 1, 1,
0.08075481, 1.627369, -0.4264642, 1, 1, 1, 1, 1,
0.0818798, 0.1966195, -1.604871, 1, 1, 1, 1, 1,
0.08223122, -0.8922955, 4.172516, 1, 1, 1, 1, 1,
0.08406939, -0.6648234, 3.363243, 1, 1, 1, 1, 1,
0.0907767, 0.7493436, -0.8328055, 1, 1, 1, 1, 1,
0.09098561, 1.904843, -0.3599526, 1, 1, 1, 1, 1,
0.09270577, -2.010098, 1.517684, 1, 1, 1, 1, 1,
0.09353948, -3.257254, 3.286132, 1, 1, 1, 1, 1,
0.0935894, -0.7608336, 1.597881, 1, 1, 1, 1, 1,
0.1028911, -0.1126955, 1.906063, 0, 0, 1, 1, 1,
0.1052251, -0.6151162, 3.172082, 1, 0, 0, 1, 1,
0.1082532, 2.445158, -0.5402877, 1, 0, 0, 1, 1,
0.1129272, 0.4279086, -0.3275542, 1, 0, 0, 1, 1,
0.1132591, -1.847793, 2.986403, 1, 0, 0, 1, 1,
0.1137181, 1.315516, -1.021205, 1, 0, 0, 1, 1,
0.1145213, -0.07450348, 0.741871, 0, 0, 0, 1, 1,
0.1190081, 0.8854814, 1.651814, 0, 0, 0, 1, 1,
0.1202837, 1.218386, 1.270935, 0, 0, 0, 1, 1,
0.1203517, -1.517882, 3.092788, 0, 0, 0, 1, 1,
0.1235714, 0.3568704, 0.563892, 0, 0, 0, 1, 1,
0.124671, 0.1532133, -0.5011181, 0, 0, 0, 1, 1,
0.1300272, 0.7265111, 0.7795858, 0, 0, 0, 1, 1,
0.1300385, 0.02992664, 2.082977, 1, 1, 1, 1, 1,
0.1310875, -1.272254, 2.159105, 1, 1, 1, 1, 1,
0.1458335, 0.5427756, -1.530982, 1, 1, 1, 1, 1,
0.1474977, -0.3472457, 4.409604, 1, 1, 1, 1, 1,
0.1487704, -0.6589666, 4.377584, 1, 1, 1, 1, 1,
0.1521253, 1.081028, -0.8721745, 1, 1, 1, 1, 1,
0.1529571, -1.025583, 2.817754, 1, 1, 1, 1, 1,
0.1553015, -0.4873744, 4.202193, 1, 1, 1, 1, 1,
0.1566479, 1.026919, -0.3564503, 1, 1, 1, 1, 1,
0.1575251, -1.324993, 2.029135, 1, 1, 1, 1, 1,
0.1592046, -1.236412, 1.147018, 1, 1, 1, 1, 1,
0.1609643, -0.3447729, 2.413422, 1, 1, 1, 1, 1,
0.1637076, -0.5650203, 3.157631, 1, 1, 1, 1, 1,
0.1642271, 2.130752, -0.2734168, 1, 1, 1, 1, 1,
0.1672918, -1.48732, 2.948865, 1, 1, 1, 1, 1,
0.1687128, -0.07438052, 2.741956, 0, 0, 1, 1, 1,
0.1719794, 0.5803848, -0.9389703, 1, 0, 0, 1, 1,
0.1728703, -0.3216724, 2.812517, 1, 0, 0, 1, 1,
0.1733649, -1.311768, 3.755065, 1, 0, 0, 1, 1,
0.1755859, -1.022287, 3.442674, 1, 0, 0, 1, 1,
0.182474, 0.3840572, 2.114846, 1, 0, 0, 1, 1,
0.1867062, 2.62846, -0.541227, 0, 0, 0, 1, 1,
0.1881385, -0.7494604, 2.612483, 0, 0, 0, 1, 1,
0.1882637, 0.1312623, 0.994461, 0, 0, 0, 1, 1,
0.1889117, 0.6979766, 1.588671, 0, 0, 0, 1, 1,
0.1910075, 1.2531, -0.4239165, 0, 0, 0, 1, 1,
0.1934436, 2.264574, -0.2475992, 0, 0, 0, 1, 1,
0.1991179, 1.377222, 1.485681, 0, 0, 0, 1, 1,
0.2036994, -1.686508, 2.634065, 1, 1, 1, 1, 1,
0.2070199, 1.234405, 0.2501869, 1, 1, 1, 1, 1,
0.2110732, -0.4451843, 2.245288, 1, 1, 1, 1, 1,
0.2165381, 0.07564802, 3.007828, 1, 1, 1, 1, 1,
0.2223797, -1.207411, 2.209772, 1, 1, 1, 1, 1,
0.22613, -0.04992047, 2.706666, 1, 1, 1, 1, 1,
0.2274379, 0.7028592, 1.587248, 1, 1, 1, 1, 1,
0.2274764, -2.202931, 2.890972, 1, 1, 1, 1, 1,
0.2298433, 0.3887397, 0.8703396, 1, 1, 1, 1, 1,
0.2343016, -0.6261379, 2.494801, 1, 1, 1, 1, 1,
0.2356282, 1.054479, 0.5113742, 1, 1, 1, 1, 1,
0.2392703, 0.6406604, -1.168086, 1, 1, 1, 1, 1,
0.2400457, 0.6573088, 0.8076091, 1, 1, 1, 1, 1,
0.2475019, 1.085025, 1.23308, 1, 1, 1, 1, 1,
0.2475403, 1.250044, 0.07306767, 1, 1, 1, 1, 1,
0.2493197, 0.883661, 0.0503255, 0, 0, 1, 1, 1,
0.253489, 0.3113243, 0.3888559, 1, 0, 0, 1, 1,
0.2542096, 0.2163176, 1.96204, 1, 0, 0, 1, 1,
0.257586, 2.277603, -0.08215729, 1, 0, 0, 1, 1,
0.2580995, -0.3711838, 4.203837, 1, 0, 0, 1, 1,
0.2609815, 0.9300281, 0.3312141, 1, 0, 0, 1, 1,
0.2631077, 0.7141846, 0.5077033, 0, 0, 0, 1, 1,
0.2632432, 0.8228506, 1.247061, 0, 0, 0, 1, 1,
0.2638977, -0.97515, 3.830009, 0, 0, 0, 1, 1,
0.2643168, 2.263215, -1.255352, 0, 0, 0, 1, 1,
0.2675515, 1.2007, 0.3341022, 0, 0, 0, 1, 1,
0.2679925, 1.763277, -0.7700187, 0, 0, 0, 1, 1,
0.2710831, 0.2258898, 2.204112, 0, 0, 0, 1, 1,
0.27112, -1.497193, 2.995759, 1, 1, 1, 1, 1,
0.2749544, -1.622707, 4.599281, 1, 1, 1, 1, 1,
0.2777036, 0.1316532, 1.221749, 1, 1, 1, 1, 1,
0.2791233, 0.6086143, -0.7466933, 1, 1, 1, 1, 1,
0.2809146, 1.214353, -0.6571054, 1, 1, 1, 1, 1,
0.2831711, -1.486164, 3.463222, 1, 1, 1, 1, 1,
0.2883345, 1.962406, -0.946905, 1, 1, 1, 1, 1,
0.2895407, 0.6521349, -0.3586737, 1, 1, 1, 1, 1,
0.2910863, -0.2587463, 2.337721, 1, 1, 1, 1, 1,
0.2962406, 0.2035907, 0.6742368, 1, 1, 1, 1, 1,
0.2983784, -0.2066291, 3.092021, 1, 1, 1, 1, 1,
0.3027225, 0.5686086, 0.2776584, 1, 1, 1, 1, 1,
0.3038478, 1.078955, 0.2706028, 1, 1, 1, 1, 1,
0.3108133, 0.827517, 0.9309418, 1, 1, 1, 1, 1,
0.3152879, -0.9646795, 1.852252, 1, 1, 1, 1, 1,
0.3176448, -1.0696, 2.461336, 0, 0, 1, 1, 1,
0.3178312, -0.3857146, 0.6227587, 1, 0, 0, 1, 1,
0.3219969, -1.17037, 3.352973, 1, 0, 0, 1, 1,
0.3251342, -0.3428167, 2.707541, 1, 0, 0, 1, 1,
0.3288085, -1.415084, 0.9408059, 1, 0, 0, 1, 1,
0.3414318, 0.1034204, 2.203129, 1, 0, 0, 1, 1,
0.3448642, 1.3342, -0.6124825, 0, 0, 0, 1, 1,
0.3510049, -0.5390629, 1.884062, 0, 0, 0, 1, 1,
0.3539503, 2.194711, 0.6334653, 0, 0, 0, 1, 1,
0.3564959, 1.482562, 1.333758, 0, 0, 0, 1, 1,
0.3595752, 0.7466224, 1.288333, 0, 0, 0, 1, 1,
0.3641584, -0.3552084, 0.8656032, 0, 0, 0, 1, 1,
0.3715019, -0.07510822, 1.946748, 0, 0, 0, 1, 1,
0.3719331, -1.486352, 2.953105, 1, 1, 1, 1, 1,
0.3747248, 0.6968659, 0.5081103, 1, 1, 1, 1, 1,
0.3756968, 2.052239, -1.43908, 1, 1, 1, 1, 1,
0.3759715, 1.625548, 1.781405, 1, 1, 1, 1, 1,
0.3760909, -0.1313233, 3.014102, 1, 1, 1, 1, 1,
0.3773424, -1.429214, 2.902845, 1, 1, 1, 1, 1,
0.3824269, 0.2660886, 2.27986, 1, 1, 1, 1, 1,
0.3825091, -0.3327783, 3.249009, 1, 1, 1, 1, 1,
0.383258, 0.03800821, 0.8073244, 1, 1, 1, 1, 1,
0.3869326, 1.325729, -0.844018, 1, 1, 1, 1, 1,
0.3878457, 0.6847618, 0.2627136, 1, 1, 1, 1, 1,
0.3908938, -1.384754, 3.156229, 1, 1, 1, 1, 1,
0.3923777, 0.2807077, 1.861185, 1, 1, 1, 1, 1,
0.3960513, 1.295218, 0.6965483, 1, 1, 1, 1, 1,
0.3965524, 0.9283186, 0.4657658, 1, 1, 1, 1, 1,
0.3972923, -0.8089043, 3.02677, 0, 0, 1, 1, 1,
0.4049694, 0.9595, 0.3798335, 1, 0, 0, 1, 1,
0.4088522, -0.7407539, 2.853702, 1, 0, 0, 1, 1,
0.4093046, 0.5319779, 1.269602, 1, 0, 0, 1, 1,
0.4120492, 0.6910345, 1.066687, 1, 0, 0, 1, 1,
0.4129872, 0.6974085, 0.5044055, 1, 0, 0, 1, 1,
0.4149869, 0.6911135, 1.070455, 0, 0, 0, 1, 1,
0.4167019, 0.3300258, 3.12442, 0, 0, 0, 1, 1,
0.4202146, 1.176868, 1.715164, 0, 0, 0, 1, 1,
0.421903, -0.2104158, 2.904621, 0, 0, 0, 1, 1,
0.4251445, 0.8710703, -0.1818783, 0, 0, 0, 1, 1,
0.4293605, -1.56615, 2.433596, 0, 0, 0, 1, 1,
0.4304954, -1.930957, 3.554125, 0, 0, 0, 1, 1,
0.4359356, -1.730655, 2.596721, 1, 1, 1, 1, 1,
0.4375207, -0.8088663, 3.90172, 1, 1, 1, 1, 1,
0.4379579, -0.4498609, 1.787047, 1, 1, 1, 1, 1,
0.4401582, -1.310332, 1.759592, 1, 1, 1, 1, 1,
0.4477586, -1.546946, 3.053249, 1, 1, 1, 1, 1,
0.448798, 1.763238, 0.4793661, 1, 1, 1, 1, 1,
0.4500429, -0.5469369, 2.552517, 1, 1, 1, 1, 1,
0.4514094, -1.185351, 0.4686408, 1, 1, 1, 1, 1,
0.4533365, 0.9757806, 1.478873, 1, 1, 1, 1, 1,
0.4541118, 1.532393, 0.194875, 1, 1, 1, 1, 1,
0.4626232, 1.155602, 2.530486, 1, 1, 1, 1, 1,
0.4648291, 0.8400061, -0.2754102, 1, 1, 1, 1, 1,
0.4658102, -0.1608661, 2.026774, 1, 1, 1, 1, 1,
0.4700158, -0.619417, 1.142264, 1, 1, 1, 1, 1,
0.4791262, 0.8421809, 0.1058856, 1, 1, 1, 1, 1,
0.479836, -0.2487918, 1.246522, 0, 0, 1, 1, 1,
0.4812423, -0.7478526, 2.857141, 1, 0, 0, 1, 1,
0.4839856, -0.2271221, 0.5708824, 1, 0, 0, 1, 1,
0.4876595, 0.8516813, 0.7133046, 1, 0, 0, 1, 1,
0.4901439, -1.041178, 2.910028, 1, 0, 0, 1, 1,
0.4905402, 0.783035, 0.6395649, 1, 0, 0, 1, 1,
0.4930506, -0.3015435, 1.696227, 0, 0, 0, 1, 1,
0.5021965, 0.1140731, 1.44214, 0, 0, 0, 1, 1,
0.5050744, 0.3784556, 1.090461, 0, 0, 0, 1, 1,
0.5073667, -0.2064262, 2.194133, 0, 0, 0, 1, 1,
0.5091923, 0.498312, 1.125702, 0, 0, 0, 1, 1,
0.5114638, -1.041569, 3.999841, 0, 0, 0, 1, 1,
0.5122953, -0.8732265, 2.24552, 0, 0, 0, 1, 1,
0.5139565, -0.008884305, 1.686511, 1, 1, 1, 1, 1,
0.5166661, 1.811343, 1.136469, 1, 1, 1, 1, 1,
0.5177171, -0.6553931, 2.70344, 1, 1, 1, 1, 1,
0.5227495, -1.557201, 2.186615, 1, 1, 1, 1, 1,
0.532796, 1.10418, -0.2577593, 1, 1, 1, 1, 1,
0.5349161, 3.582383, -0.280285, 1, 1, 1, 1, 1,
0.5353115, 0.4183498, -1.600589, 1, 1, 1, 1, 1,
0.5355781, 0.002900686, 0.4983515, 1, 1, 1, 1, 1,
0.536909, 0.2050928, 2.480019, 1, 1, 1, 1, 1,
0.5476847, 0.9992658, 0.4430883, 1, 1, 1, 1, 1,
0.5482486, -1.716614, 3.125813, 1, 1, 1, 1, 1,
0.5491495, -0.9572951, 2.611235, 1, 1, 1, 1, 1,
0.5498814, 0.499008, -0.9694232, 1, 1, 1, 1, 1,
0.5505129, 1.261164, 0.6101422, 1, 1, 1, 1, 1,
0.5507954, -0.6860961, 2.266747, 1, 1, 1, 1, 1,
0.5526867, 1.4818, -1.813655, 0, 0, 1, 1, 1,
0.5533395, -0.1361263, 1.979762, 1, 0, 0, 1, 1,
0.5547599, 0.3026229, 3.485443, 1, 0, 0, 1, 1,
0.5564467, -0.3147282, 3.833293, 1, 0, 0, 1, 1,
0.5575666, 0.469322, 0.8448487, 1, 0, 0, 1, 1,
0.5592806, -0.4326447, 0.811788, 1, 0, 0, 1, 1,
0.5599494, 0.7789986, -0.4091094, 0, 0, 0, 1, 1,
0.5610282, -1.201651, 3.834159, 0, 0, 0, 1, 1,
0.5625685, -0.9416841, 4.032203, 0, 0, 0, 1, 1,
0.5636202, -0.4039883, -0.03753057, 0, 0, 0, 1, 1,
0.5669971, 1.522624, -0.4386232, 0, 0, 0, 1, 1,
0.5679022, -1.179289, 2.989823, 0, 0, 0, 1, 1,
0.5702268, 0.4092056, 2.425489, 0, 0, 0, 1, 1,
0.5746171, -1.230371, 1.97203, 1, 1, 1, 1, 1,
0.5752317, 0.2301906, 0.5367419, 1, 1, 1, 1, 1,
0.5766308, 1.491226, 1.422966, 1, 1, 1, 1, 1,
0.5809115, -1.257749, 3.429951, 1, 1, 1, 1, 1,
0.5811704, 0.01608324, 0.6152843, 1, 1, 1, 1, 1,
0.5814182, -1.489297, 3.970564, 1, 1, 1, 1, 1,
0.5827312, 0.1175629, 1.929806, 1, 1, 1, 1, 1,
0.5863888, -0.3475546, 1.465189, 1, 1, 1, 1, 1,
0.5896488, -0.7650105, 2.626618, 1, 1, 1, 1, 1,
0.5903021, 0.1917268, 1.502818, 1, 1, 1, 1, 1,
0.5920638, 0.1763905, 0.1675012, 1, 1, 1, 1, 1,
0.5928676, -1.323043, 3.595832, 1, 1, 1, 1, 1,
0.5949389, 0.1725493, 1.789545, 1, 1, 1, 1, 1,
0.5980022, 0.3380283, 1.410374, 1, 1, 1, 1, 1,
0.599524, 0.4124679, 0.3230129, 1, 1, 1, 1, 1,
0.599894, -0.3905362, 2.249147, 0, 0, 1, 1, 1,
0.6067697, 0.3385954, 1.062662, 1, 0, 0, 1, 1,
0.6094738, 2.531093, -1.114267, 1, 0, 0, 1, 1,
0.6102691, 0.8645857, 0.4650401, 1, 0, 0, 1, 1,
0.6117115, 0.3522182, 1.816688, 1, 0, 0, 1, 1,
0.6186804, 1.29135, -0.1023593, 1, 0, 0, 1, 1,
0.61978, -2.4921, 2.065634, 0, 0, 0, 1, 1,
0.626426, 0.09570432, 1.411924, 0, 0, 0, 1, 1,
0.6283715, -0.8863387, 1.735176, 0, 0, 0, 1, 1,
0.6310139, 1.676246, -0.4344641, 0, 0, 0, 1, 1,
0.6365097, 0.4323657, 1.984203, 0, 0, 0, 1, 1,
0.6367518, 0.5808842, 1.589583, 0, 0, 0, 1, 1,
0.6376669, -1.050887, 3.127511, 0, 0, 0, 1, 1,
0.6475646, -0.2681698, 1.285171, 1, 1, 1, 1, 1,
0.6499374, -0.4716123, -0.3183892, 1, 1, 1, 1, 1,
0.6525874, 0.8705071, 1.494096, 1, 1, 1, 1, 1,
0.6552094, -0.05915941, 0.04282356, 1, 1, 1, 1, 1,
0.6598778, -1.29121, 3.562689, 1, 1, 1, 1, 1,
0.6614442, -0.5270326, 3.041619, 1, 1, 1, 1, 1,
0.662743, -0.4078416, 3.17998, 1, 1, 1, 1, 1,
0.6655346, 0.4622886, 0.5625277, 1, 1, 1, 1, 1,
0.666806, -1.143363, 2.945703, 1, 1, 1, 1, 1,
0.6678125, -1.102422, 3.287074, 1, 1, 1, 1, 1,
0.6686751, -0.9105638, 3.293516, 1, 1, 1, 1, 1,
0.6690603, -0.4417929, 0.7489043, 1, 1, 1, 1, 1,
0.6703218, -1.622375, 2.769384, 1, 1, 1, 1, 1,
0.6766084, -0.7199284, 3.062853, 1, 1, 1, 1, 1,
0.6857947, -1.880778, 0.6152616, 1, 1, 1, 1, 1,
0.6886435, -0.9493729, 3.852935, 0, 0, 1, 1, 1,
0.7044526, -1.882583, 3.549963, 1, 0, 0, 1, 1,
0.7074668, 0.6450902, 0.4528826, 1, 0, 0, 1, 1,
0.7088591, 0.3338483, 1.893419, 1, 0, 0, 1, 1,
0.712727, 0.03267168, 1.350563, 1, 0, 0, 1, 1,
0.7127596, -0.02715465, 0.3272938, 1, 0, 0, 1, 1,
0.7209777, -0.3927471, 2.176083, 0, 0, 0, 1, 1,
0.7310219, -3.267344, 1.773471, 0, 0, 0, 1, 1,
0.7346755, 0.1111858, 1.455279, 0, 0, 0, 1, 1,
0.7348113, -0.5847312, 1.198004, 0, 0, 0, 1, 1,
0.7353514, -1.156128, 2.418195, 0, 0, 0, 1, 1,
0.7404716, -0.1009252, 3.151633, 0, 0, 0, 1, 1,
0.7436864, 0.01564669, -0.1639692, 0, 0, 0, 1, 1,
0.7500316, -1.550187, 2.426242, 1, 1, 1, 1, 1,
0.7535914, 0.2992947, 1.266755, 1, 1, 1, 1, 1,
0.756151, 0.1312887, 3.514672, 1, 1, 1, 1, 1,
0.7594545, -1.73533, 3.641101, 1, 1, 1, 1, 1,
0.7608691, -0.9496045, 1.187828, 1, 1, 1, 1, 1,
0.7659795, -0.4365624, 2.721514, 1, 1, 1, 1, 1,
0.7707492, 0.7739435, 0.6314254, 1, 1, 1, 1, 1,
0.7765878, 0.7416301, 0.1625519, 1, 1, 1, 1, 1,
0.7775767, -1.915324, 3.785792, 1, 1, 1, 1, 1,
0.7796909, -0.9163257, 0.5536752, 1, 1, 1, 1, 1,
0.7825152, -0.6975451, 1.207408, 1, 1, 1, 1, 1,
0.784446, -1.695698, 1.687845, 1, 1, 1, 1, 1,
0.7873017, 0.2638752, 0.8354617, 1, 1, 1, 1, 1,
0.7905326, -0.7837814, 1.260808, 1, 1, 1, 1, 1,
0.7991004, -1.143168, 2.206522, 1, 1, 1, 1, 1,
0.803303, -0.01397573, 2.586941, 0, 0, 1, 1, 1,
0.8085033, 0.6963243, -0.2892382, 1, 0, 0, 1, 1,
0.8086433, 0.3101248, 0.7774098, 1, 0, 0, 1, 1,
0.820832, 1.006179, 1.45796, 1, 0, 0, 1, 1,
0.8271859, 0.395292, 0.1238049, 1, 0, 0, 1, 1,
0.8296233, 0.8898728, 0.9470492, 1, 0, 0, 1, 1,
0.8350844, 1.11231, 0.4601356, 0, 0, 0, 1, 1,
0.8420833, 0.5118545, 2.379944, 0, 0, 0, 1, 1,
0.8421841, 0.2682643, 0.02695279, 0, 0, 0, 1, 1,
0.8435003, -0.07871252, 0.8316802, 0, 0, 0, 1, 1,
0.8464453, -0.2285704, 1.167272, 0, 0, 0, 1, 1,
0.8478563, -0.5726992, 2.123169, 0, 0, 0, 1, 1,
0.8607104, -1.102826, 2.854232, 0, 0, 0, 1, 1,
0.862616, 1.125335, -0.5888014, 1, 1, 1, 1, 1,
0.8634109, -0.6297287, 2.140744, 1, 1, 1, 1, 1,
0.865426, 0.3737708, 1.044435, 1, 1, 1, 1, 1,
0.8687193, -0.8221529, 1.941447, 1, 1, 1, 1, 1,
0.8687294, -0.1322006, 1.493434, 1, 1, 1, 1, 1,
0.868991, -1.177466, 3.17422, 1, 1, 1, 1, 1,
0.8718817, 0.5664155, 0.4815779, 1, 1, 1, 1, 1,
0.8769947, -0.6193873, 1.36645, 1, 1, 1, 1, 1,
0.8777747, 0.1086195, 1.301582, 1, 1, 1, 1, 1,
0.8819584, -1.446817, 1.952729, 1, 1, 1, 1, 1,
0.8832627, 0.1413419, 1.110709, 1, 1, 1, 1, 1,
0.8898163, -1.371321, 2.642126, 1, 1, 1, 1, 1,
0.8928674, 3.032321, -0.9435798, 1, 1, 1, 1, 1,
0.9002587, -0.04770044, 1.265852, 1, 1, 1, 1, 1,
0.9086655, -1.113157, 2.50352, 1, 1, 1, 1, 1,
0.9099843, 0.07687617, 1.311004, 0, 0, 1, 1, 1,
0.9107333, -0.2613161, 2.158081, 1, 0, 0, 1, 1,
0.9213775, 0.7875687, 1.131209, 1, 0, 0, 1, 1,
0.9244964, 0.747191, 0.1249496, 1, 0, 0, 1, 1,
0.9348083, -2.168858, 3.389549, 1, 0, 0, 1, 1,
0.937306, -1.518348, 1.977988, 1, 0, 0, 1, 1,
0.9384122, -0.7057396, 2.884225, 0, 0, 0, 1, 1,
0.9430502, 0.6490267, 1.190675, 0, 0, 0, 1, 1,
0.9441934, 0.2786091, -0.2700257, 0, 0, 0, 1, 1,
0.9459558, 0.1104088, 0.7942343, 0, 0, 0, 1, 1,
0.9467658, -0.7960369, 1.424212, 0, 0, 0, 1, 1,
0.9576508, 0.6612834, -0.5592676, 0, 0, 0, 1, 1,
0.9602656, -2.236028, 3.105923, 0, 0, 0, 1, 1,
0.9637578, -1.379001, 0.9240896, 1, 1, 1, 1, 1,
0.964472, -0.4452757, 2.43867, 1, 1, 1, 1, 1,
0.9651812, -1.636587, 2.431399, 1, 1, 1, 1, 1,
0.9682263, -1.587199, 0.6787062, 1, 1, 1, 1, 1,
0.9684066, -0.730767, 3.596443, 1, 1, 1, 1, 1,
0.9733008, 0.1679971, 1.588462, 1, 1, 1, 1, 1,
0.9751309, 1.16987, 1.057324, 1, 1, 1, 1, 1,
0.979705, -1.007137, 4.055413, 1, 1, 1, 1, 1,
0.9840247, 1.416875, 1.339124, 1, 1, 1, 1, 1,
0.9862257, -1.931383, 1.350037, 1, 1, 1, 1, 1,
0.9878466, -0.5698986, 1.799831, 1, 1, 1, 1, 1,
0.9901392, -1.921249, 2.411785, 1, 1, 1, 1, 1,
0.9934439, 0.8404843, 2.113714, 1, 1, 1, 1, 1,
0.994577, -0.8939357, 1.128453, 1, 1, 1, 1, 1,
0.9965547, -0.3976393, 1.53519, 1, 1, 1, 1, 1,
0.9990297, -2.048717, 4.663074, 0, 0, 1, 1, 1,
1.004552, 0.8488314, -0.2641732, 1, 0, 0, 1, 1,
1.012095, -1.526398, 1.33454, 1, 0, 0, 1, 1,
1.012118, -0.8083133, 2.500185, 1, 0, 0, 1, 1,
1.012184, 0.8809207, 1.099476, 1, 0, 0, 1, 1,
1.015374, 1.504985, -0.3204834, 1, 0, 0, 1, 1,
1.01868, 1.020277, 1.479466, 0, 0, 0, 1, 1,
1.019062, 0.154833, 0.6377723, 0, 0, 0, 1, 1,
1.022629, -0.5770913, 2.834495, 0, 0, 0, 1, 1,
1.02991, 0.4275183, 0.586316, 0, 0, 0, 1, 1,
1.030329, -1.16172, 3.253888, 0, 0, 0, 1, 1,
1.030407, 1.199538, -0.9738042, 0, 0, 0, 1, 1,
1.032317, -0.7740384, 2.949068, 0, 0, 0, 1, 1,
1.033301, 1.84508, 1.325652, 1, 1, 1, 1, 1,
1.034512, -0.5557941, 2.496843, 1, 1, 1, 1, 1,
1.043389, 1.020566, 0.7163401, 1, 1, 1, 1, 1,
1.051792, 0.7913215, 1.513878, 1, 1, 1, 1, 1,
1.056939, -1.629851, 2.497975, 1, 1, 1, 1, 1,
1.057022, 0.3719114, 2.834618, 1, 1, 1, 1, 1,
1.068723, 1.743454, 0.6861471, 1, 1, 1, 1, 1,
1.072105, 0.4087703, 0.4944367, 1, 1, 1, 1, 1,
1.081645, 0.3404349, 0.4764839, 1, 1, 1, 1, 1,
1.082052, -0.09920552, 1.799902, 1, 1, 1, 1, 1,
1.089039, 1.352138, 0.2706191, 1, 1, 1, 1, 1,
1.093336, 0.0766673, 1.222911, 1, 1, 1, 1, 1,
1.098619, -0.08038954, 3.666961, 1, 1, 1, 1, 1,
1.127554, -1.322668, 3.424154, 1, 1, 1, 1, 1,
1.131426, -1.343345, 3.305319, 1, 1, 1, 1, 1,
1.135357, -1.407176, 1.937865, 0, 0, 1, 1, 1,
1.140482, -0.8508699, 3.016051, 1, 0, 0, 1, 1,
1.14341, 0.7878289, 0.5022522, 1, 0, 0, 1, 1,
1.145258, 1.232498, 0.7356343, 1, 0, 0, 1, 1,
1.146225, -0.5008642, 1.570871, 1, 0, 0, 1, 1,
1.155135, 0.1245184, 1.345756, 1, 0, 0, 1, 1,
1.165042, -0.6814691, 2.751822, 0, 0, 0, 1, 1,
1.165418, -0.006834094, -0.1222711, 0, 0, 0, 1, 1,
1.181492, 0.01825734, -0.2496217, 0, 0, 0, 1, 1,
1.199289, -0.7366731, -0.0164481, 0, 0, 0, 1, 1,
1.211466, -0.4235656, -0.1671003, 0, 0, 0, 1, 1,
1.212128, 0.4311098, 0.3376319, 0, 0, 0, 1, 1,
1.222986, -0.4131399, 3.309613, 0, 0, 0, 1, 1,
1.232203, -0.5674228, 2.469844, 1, 1, 1, 1, 1,
1.241926, 0.6757904, 1.419243, 1, 1, 1, 1, 1,
1.248786, 0.9517499, 1.041032, 1, 1, 1, 1, 1,
1.249418, 0.3299183, 0.4754798, 1, 1, 1, 1, 1,
1.252528, 1.003024, 0.7082697, 1, 1, 1, 1, 1,
1.253171, 0.3632083, 1.954835, 1, 1, 1, 1, 1,
1.256256, -1.742657, 0.7073483, 1, 1, 1, 1, 1,
1.262325, 0.7981935, 0.8724679, 1, 1, 1, 1, 1,
1.262996, 0.1567832, 0.4351265, 1, 1, 1, 1, 1,
1.268578, 0.3171463, 1.417797, 1, 1, 1, 1, 1,
1.282959, 0.05175303, 1.433099, 1, 1, 1, 1, 1,
1.286068, -0.9328094, 2.156991, 1, 1, 1, 1, 1,
1.286424, -0.1150573, 0.3220425, 1, 1, 1, 1, 1,
1.292277, 0.556632, 1.180667, 1, 1, 1, 1, 1,
1.296033, -0.4891959, 1.999968, 1, 1, 1, 1, 1,
1.314418, 0.3070896, 3.311916, 0, 0, 1, 1, 1,
1.318387, -1.364016, 1.589192, 1, 0, 0, 1, 1,
1.318872, -0.2623619, 2.682218, 1, 0, 0, 1, 1,
1.321084, 1.21049, 2.200385, 1, 0, 0, 1, 1,
1.326588, 1.086477, 2.119191, 1, 0, 0, 1, 1,
1.356991, -1.101673, 3.674372, 1, 0, 0, 1, 1,
1.357467, 1.550188, 2.255056, 0, 0, 0, 1, 1,
1.361028, 0.6395261, 1.36587, 0, 0, 0, 1, 1,
1.368152, 0.9049886, 2.500745, 0, 0, 0, 1, 1,
1.369018, 0.4000246, 1.434762, 0, 0, 0, 1, 1,
1.375258, -1.470734, 2.472632, 0, 0, 0, 1, 1,
1.382343, -1.707108, 5.172608, 0, 0, 0, 1, 1,
1.392229, 0.8042771, 1.480177, 0, 0, 0, 1, 1,
1.399035, -0.4361042, 2.381169, 1, 1, 1, 1, 1,
1.412431, -0.7457342, 2.525964, 1, 1, 1, 1, 1,
1.432165, -1.45609, 1.707665, 1, 1, 1, 1, 1,
1.436227, 0.3054371, 0.9384265, 1, 1, 1, 1, 1,
1.448154, -0.9777281, 2.124283, 1, 1, 1, 1, 1,
1.45526, -0.5091421, 3.557458, 1, 1, 1, 1, 1,
1.457811, 1.448945, 0.9577901, 1, 1, 1, 1, 1,
1.458373, -0.1630295, -0.5212837, 1, 1, 1, 1, 1,
1.463056, 1.238568, 1.696493, 1, 1, 1, 1, 1,
1.463361, -0.8351569, 1.33209, 1, 1, 1, 1, 1,
1.470833, -0.4945543, 2.789851, 1, 1, 1, 1, 1,
1.473103, -1.6792, 3.286148, 1, 1, 1, 1, 1,
1.477082, 0.3182949, 0.9189381, 1, 1, 1, 1, 1,
1.482183, 1.868223, 0.3096834, 1, 1, 1, 1, 1,
1.484201, -1.643181, 2.672201, 1, 1, 1, 1, 1,
1.487287, -0.1227539, 0.385268, 0, 0, 1, 1, 1,
1.496946, 0.2344687, 0.5331372, 1, 0, 0, 1, 1,
1.508739, -0.6207544, 2.059187, 1, 0, 0, 1, 1,
1.509502, -0.8584759, 2.922414, 1, 0, 0, 1, 1,
1.512485, 0.5979292, 1.663335, 1, 0, 0, 1, 1,
1.527084, 0.08884384, 4.145446, 1, 0, 0, 1, 1,
1.53525, -0.005708405, 2.336763, 0, 0, 0, 1, 1,
1.535717, 0.6342482, 2.024088, 0, 0, 0, 1, 1,
1.553614, -0.1393153, 2.574354, 0, 0, 0, 1, 1,
1.553635, -0.2272923, 1.829136, 0, 0, 0, 1, 1,
1.557669, 2.816316, 0.7901186, 0, 0, 0, 1, 1,
1.565177, -0.2264908, 1.794856, 0, 0, 0, 1, 1,
1.57254, -0.8437754, 3.497647, 0, 0, 0, 1, 1,
1.57544, 0.9357717, 0.3922326, 1, 1, 1, 1, 1,
1.583169, 1.058521, 2.780977, 1, 1, 1, 1, 1,
1.586558, -1.693781, 3.079444, 1, 1, 1, 1, 1,
1.587716, 0.8346897, 2.29058, 1, 1, 1, 1, 1,
1.588584, -0.7544976, 1.176128, 1, 1, 1, 1, 1,
1.595521, 0.479876, 1.335793, 1, 1, 1, 1, 1,
1.618339, 0.1059396, 1.330598, 1, 1, 1, 1, 1,
1.624064, -0.9058851, 2.426642, 1, 1, 1, 1, 1,
1.627075, 0.2904663, 2.571032, 1, 1, 1, 1, 1,
1.629357, -1.430464, 3.289149, 1, 1, 1, 1, 1,
1.630523, -0.8245012, 4.369822, 1, 1, 1, 1, 1,
1.631015, -1.725239, 4.79225, 1, 1, 1, 1, 1,
1.631816, 0.2071114, 0.03786424, 1, 1, 1, 1, 1,
1.635821, 0.443456, 2.236568, 1, 1, 1, 1, 1,
1.642744, 0.1201979, 0.4468181, 1, 1, 1, 1, 1,
1.650847, -0.3886039, 2.599117, 0, 0, 1, 1, 1,
1.659042, -0.5149104, 1.03386, 1, 0, 0, 1, 1,
1.661645, 0.7154794, 0.2140487, 1, 0, 0, 1, 1,
1.663334, 0.3977812, 0.8533441, 1, 0, 0, 1, 1,
1.694654, 0.6809376, 1.406821, 1, 0, 0, 1, 1,
1.706049, 0.8189468, -0.857587, 1, 0, 0, 1, 1,
1.716593, 0.5603276, 1.055726, 0, 0, 0, 1, 1,
1.718455, -0.5395566, 3.205841, 0, 0, 0, 1, 1,
1.735102, 0.5277537, 1.610811, 0, 0, 0, 1, 1,
1.737303, 1.58623, 2.437959, 0, 0, 0, 1, 1,
1.737516, 0.4326872, 1.262814, 0, 0, 0, 1, 1,
1.737581, -0.3129023, 2.043286, 0, 0, 0, 1, 1,
1.738307, -0.04289333, 1.157675, 0, 0, 0, 1, 1,
1.772354, 0.2019311, 2.944617, 1, 1, 1, 1, 1,
1.779445, -1.907071, 1.638912, 1, 1, 1, 1, 1,
1.789893, -1.869016, 2.939594, 1, 1, 1, 1, 1,
1.79491, 0.06095589, 2.084777, 1, 1, 1, 1, 1,
1.807337, 0.03610599, 0.7502267, 1, 1, 1, 1, 1,
1.838488, -2.282476, 3.397646, 1, 1, 1, 1, 1,
1.839938, 1.597547, 1.205844, 1, 1, 1, 1, 1,
1.896508, -0.08793997, 1.608899, 1, 1, 1, 1, 1,
1.918835, -0.580646, -0.02862598, 1, 1, 1, 1, 1,
1.921153, -0.291381, 2.19824, 1, 1, 1, 1, 1,
1.975191, -0.6097919, 1.211469, 1, 1, 1, 1, 1,
1.980637, -0.2423159, 0.3819854, 1, 1, 1, 1, 1,
1.984564, 1.746134, 1.060475, 1, 1, 1, 1, 1,
1.989853, 0.0005554609, 1.114586, 1, 1, 1, 1, 1,
2.000207, 0.4488012, 0.909295, 1, 1, 1, 1, 1,
2.00933, 0.5992774, 0.4979512, 0, 0, 1, 1, 1,
2.035703, 0.1966845, 2.33306, 1, 0, 0, 1, 1,
2.066825, 0.1071359, 1.484509, 1, 0, 0, 1, 1,
2.183504, -0.6034702, 1.834502, 1, 0, 0, 1, 1,
2.205863, 3.839296, 0.3107456, 1, 0, 0, 1, 1,
2.209101, -0.1596445, 1.66857, 1, 0, 0, 1, 1,
2.275051, 2.312463, 0.5379772, 0, 0, 0, 1, 1,
2.293697, 0.2865264, 2.481701, 0, 0, 0, 1, 1,
2.342148, -0.988238, 2.06283, 0, 0, 0, 1, 1,
2.368997, 2.291145, 2.080019, 0, 0, 0, 1, 1,
2.436787, -0.2170141, 1.735663, 0, 0, 0, 1, 1,
2.495188, 0.8813016, 1.902714, 0, 0, 0, 1, 1,
2.519406, 0.5428091, 0.4945783, 0, 0, 0, 1, 1,
2.523081, -0.2743817, 1.079198, 1, 1, 1, 1, 1,
2.532086, -0.4266472, 1.697167, 1, 1, 1, 1, 1,
2.621719, 0.9284899, 1.433552, 1, 1, 1, 1, 1,
2.648993, 0.4950878, 1.1364, 1, 1, 1, 1, 1,
2.650241, -1.511897, 2.668988, 1, 1, 1, 1, 1,
2.849694, -0.007868055, 1.09977, 1, 1, 1, 1, 1,
3.032811, -0.1523686, 0.7643287, 1, 1, 1, 1, 1
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
var radius = 9.799731;
var distance = 34.42114;
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
mvMatrix.translate( -0.09198236, -0.2859762, 0.3928082 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.42114);
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
