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
-4.153247, -0.9214524, -1.68387, 1, 0, 0, 1,
-3.199064, 1.111084, -2.788672, 1, 0.007843138, 0, 1,
-2.964779, -0.3045353, -1.044436, 1, 0.01176471, 0, 1,
-2.851134, -0.9079437, -3.028239, 1, 0.01960784, 0, 1,
-2.845042, -0.1776003, -3.63116, 1, 0.02352941, 0, 1,
-2.801336, 0.6982214, -0.6050166, 1, 0.03137255, 0, 1,
-2.669138, 0.06983203, -0.003143023, 1, 0.03529412, 0, 1,
-2.597979, -0.4025783, -1.558809, 1, 0.04313726, 0, 1,
-2.528147, -1.166387, 0.2208287, 1, 0.04705882, 0, 1,
-2.509603, 0.004023547, -1.431095, 1, 0.05490196, 0, 1,
-2.481141, 1.526677, -0.5799244, 1, 0.05882353, 0, 1,
-2.44382, -1.577437, -0.4469123, 1, 0.06666667, 0, 1,
-2.44226, -0.5020135, -3.636628, 1, 0.07058824, 0, 1,
-2.289079, -0.5103081, -1.367456, 1, 0.07843138, 0, 1,
-2.274801, 0.04435696, -1.95969, 1, 0.08235294, 0, 1,
-2.263515, 0.3872397, -0.05267082, 1, 0.09019608, 0, 1,
-2.259236, 0.3113658, -1.1918, 1, 0.09411765, 0, 1,
-2.229319, 0.1884361, -1.123877, 1, 0.1019608, 0, 1,
-2.217117, -0.1189088, -1.255511, 1, 0.1098039, 0, 1,
-2.194877, -1.189246, -2.660609, 1, 0.1137255, 0, 1,
-2.161148, 0.375385, -0.5198238, 1, 0.1215686, 0, 1,
-2.157739, 1.197485, -0.4911793, 1, 0.1254902, 0, 1,
-2.144518, -1.64889, -4.82603, 1, 0.1333333, 0, 1,
-2.128702, 1.056211, -1.224856, 1, 0.1372549, 0, 1,
-2.082641, 0.3627324, -1.661263, 1, 0.145098, 0, 1,
-2.07315, 1.031309, -0.6124238, 1, 0.1490196, 0, 1,
-2.041259, -1.369741, -2.740498, 1, 0.1568628, 0, 1,
-2.032254, 0.4646201, -3.159646, 1, 0.1607843, 0, 1,
-2.030424, 1.876422, 0.07782173, 1, 0.1686275, 0, 1,
-2.022014, 0.4591351, -0.8213657, 1, 0.172549, 0, 1,
-1.974988, -0.4539752, -3.765075, 1, 0.1803922, 0, 1,
-1.974418, -0.1805468, -2.727949, 1, 0.1843137, 0, 1,
-1.956505, 0.08192717, -1.788864, 1, 0.1921569, 0, 1,
-1.930924, 0.2349709, -0.1452934, 1, 0.1960784, 0, 1,
-1.925776, 0.4982645, -2.270858, 1, 0.2039216, 0, 1,
-1.912737, 0.3426568, -2.141383, 1, 0.2117647, 0, 1,
-1.911341, -0.6762149, -2.519994, 1, 0.2156863, 0, 1,
-1.895482, -0.6020046, -3.004761, 1, 0.2235294, 0, 1,
-1.833263, 1.783636, -2.542938, 1, 0.227451, 0, 1,
-1.82775, 0.6663852, -1.314607, 1, 0.2352941, 0, 1,
-1.826001, -0.5045783, -3.141783, 1, 0.2392157, 0, 1,
-1.817602, -1.323894, -2.743396, 1, 0.2470588, 0, 1,
-1.804342, 0.3627913, -2.157356, 1, 0.2509804, 0, 1,
-1.760937, -1.074474, -1.270039, 1, 0.2588235, 0, 1,
-1.733316, -0.07377487, -0.8398764, 1, 0.2627451, 0, 1,
-1.722221, -0.8250834, -2.745085, 1, 0.2705882, 0, 1,
-1.705808, -0.8667729, -2.526092, 1, 0.2745098, 0, 1,
-1.704664, -2.952052, -2.741138, 1, 0.282353, 0, 1,
-1.70071, -2.179972, -2.411721, 1, 0.2862745, 0, 1,
-1.686639, -0.1844209, -2.291851, 1, 0.2941177, 0, 1,
-1.670043, -0.109882, -1.603805, 1, 0.3019608, 0, 1,
-1.666505, -1.321475, -1.06747, 1, 0.3058824, 0, 1,
-1.634328, 1.139034, -0.9968992, 1, 0.3137255, 0, 1,
-1.624187, 0.6124264, -1.485613, 1, 0.3176471, 0, 1,
-1.620428, 0.9938694, -1.875466, 1, 0.3254902, 0, 1,
-1.61293, 0.03888325, -1.924109, 1, 0.3294118, 0, 1,
-1.593154, -0.03502366, -3.245415, 1, 0.3372549, 0, 1,
-1.589956, 1.708292, 0.2821913, 1, 0.3411765, 0, 1,
-1.589514, 2.501177, 0.5407338, 1, 0.3490196, 0, 1,
-1.584353, 1.018041, -2.27026, 1, 0.3529412, 0, 1,
-1.58346, 0.585657, -0.9028556, 1, 0.3607843, 0, 1,
-1.548602, 1.196372, -1.630177, 1, 0.3647059, 0, 1,
-1.541115, 0.1181437, -1.17487, 1, 0.372549, 0, 1,
-1.539358, -0.6322086, -1.055574, 1, 0.3764706, 0, 1,
-1.52864, -0.8236829, -1.767527, 1, 0.3843137, 0, 1,
-1.520416, 1.632924, -0.769703, 1, 0.3882353, 0, 1,
-1.518716, 0.5873202, -2.724431, 1, 0.3960784, 0, 1,
-1.512234, -1.982344, -3.537411, 1, 0.4039216, 0, 1,
-1.509723, -1.632187, -2.614191, 1, 0.4078431, 0, 1,
-1.501821, -1.508979, -1.926896, 1, 0.4156863, 0, 1,
-1.488399, 0.3830455, -1.26199, 1, 0.4196078, 0, 1,
-1.488011, 0.1184339, -1.427001, 1, 0.427451, 0, 1,
-1.46684, -1.07366, -0.377002, 1, 0.4313726, 0, 1,
-1.464325, 0.5218859, -1.704195, 1, 0.4392157, 0, 1,
-1.454286, -0.6769905, -0.6712911, 1, 0.4431373, 0, 1,
-1.452148, 1.544228, -0.4591811, 1, 0.4509804, 0, 1,
-1.432252, 0.2141776, -0.5995181, 1, 0.454902, 0, 1,
-1.427892, 0.8930433, -1.987657, 1, 0.4627451, 0, 1,
-1.425366, -2.714823, -1.383588, 1, 0.4666667, 0, 1,
-1.418491, 0.3601978, 0.357794, 1, 0.4745098, 0, 1,
-1.411273, 1.442307, -1.652256, 1, 0.4784314, 0, 1,
-1.408591, -1.104928, -1.775412, 1, 0.4862745, 0, 1,
-1.407343, 0.5298008, -1.03718, 1, 0.4901961, 0, 1,
-1.392562, -0.6676431, -1.831137, 1, 0.4980392, 0, 1,
-1.389565, 0.7981181, -0.4953994, 1, 0.5058824, 0, 1,
-1.385178, 0.5789549, -2.023926, 1, 0.509804, 0, 1,
-1.383509, 0.9129232, 0.7404253, 1, 0.5176471, 0, 1,
-1.38258, 0.9765728, 0.6955155, 1, 0.5215687, 0, 1,
-1.379476, 1.079566, -0.5257387, 1, 0.5294118, 0, 1,
-1.378931, -0.9777624, -1.867915, 1, 0.5333334, 0, 1,
-1.367663, 0.9885892, 1.633381, 1, 0.5411765, 0, 1,
-1.366459, -0.9892217, -1.823839, 1, 0.5450981, 0, 1,
-1.347754, -0.2967778, -2.688995, 1, 0.5529412, 0, 1,
-1.33605, -1.158298, -2.120973, 1, 0.5568628, 0, 1,
-1.335009, -0.2450145, -1.597808, 1, 0.5647059, 0, 1,
-1.332882, 0.7758415, -0.8621221, 1, 0.5686275, 0, 1,
-1.323799, 1.434794, -0.5520983, 1, 0.5764706, 0, 1,
-1.318978, 0.3067166, -1.893448, 1, 0.5803922, 0, 1,
-1.314307, 0.5540546, -1.389665, 1, 0.5882353, 0, 1,
-1.313141, -1.410126, -1.398312, 1, 0.5921569, 0, 1,
-1.31281, -0.6050722, -2.668372, 1, 0.6, 0, 1,
-1.311984, -0.9284886, -0.5553561, 1, 0.6078432, 0, 1,
-1.307108, 0.896192, -1.130591, 1, 0.6117647, 0, 1,
-1.293052, -1.274388, -0.8156244, 1, 0.6196079, 0, 1,
-1.291124, -0.05217895, -0.8535466, 1, 0.6235294, 0, 1,
-1.282059, -0.2339002, -2.317989, 1, 0.6313726, 0, 1,
-1.282043, -1.508733, -1.758015, 1, 0.6352941, 0, 1,
-1.280773, 0.3911393, -0.5950167, 1, 0.6431373, 0, 1,
-1.270194, 0.3740804, -0.8225232, 1, 0.6470588, 0, 1,
-1.262653, 0.772509, -0.08733982, 1, 0.654902, 0, 1,
-1.258659, 1.346267, -1.800042, 1, 0.6588235, 0, 1,
-1.255825, -0.5946875, -1.172393, 1, 0.6666667, 0, 1,
-1.253934, -0.6171167, -2.02234, 1, 0.6705883, 0, 1,
-1.253817, -0.3473589, -1.421758, 1, 0.6784314, 0, 1,
-1.246179, 1.378152, -1.475062, 1, 0.682353, 0, 1,
-1.244306, -2.618468, -2.20185, 1, 0.6901961, 0, 1,
-1.24369, -0.5250846, -4.292998, 1, 0.6941177, 0, 1,
-1.236323, -0.8680557, -2.146216, 1, 0.7019608, 0, 1,
-1.225274, -0.3339343, -1.25797, 1, 0.7098039, 0, 1,
-1.215168, -0.9419371, -1.149232, 1, 0.7137255, 0, 1,
-1.214946, -0.8141045, -2.470558, 1, 0.7215686, 0, 1,
-1.211379, 1.413888, 0.06591867, 1, 0.7254902, 0, 1,
-1.210978, -0.6006868, -3.1753, 1, 0.7333333, 0, 1,
-1.20863, -0.1712758, -1.195772, 1, 0.7372549, 0, 1,
-1.200424, -0.3633569, 0.7432814, 1, 0.7450981, 0, 1,
-1.197458, 0.02268625, -1.626199, 1, 0.7490196, 0, 1,
-1.189945, 2.35315, -0.07518986, 1, 0.7568628, 0, 1,
-1.188398, -0.7368324, -2.11562, 1, 0.7607843, 0, 1,
-1.179651, 1.869385, -1.167749, 1, 0.7686275, 0, 1,
-1.1786, 0.3490303, -0.9876883, 1, 0.772549, 0, 1,
-1.174395, 0.8412671, -0.630955, 1, 0.7803922, 0, 1,
-1.172982, -0.0467863, -1.854817, 1, 0.7843137, 0, 1,
-1.171646, -1.070926, -2.634031, 1, 0.7921569, 0, 1,
-1.166529, -0.02340689, -1.272923, 1, 0.7960784, 0, 1,
-1.166232, 0.640259, -1.988492, 1, 0.8039216, 0, 1,
-1.16565, 1.321085, 0.4938646, 1, 0.8117647, 0, 1,
-1.158468, 0.9704514, 0.5094135, 1, 0.8156863, 0, 1,
-1.155462, 0.5693048, -0.3943318, 1, 0.8235294, 0, 1,
-1.148671, -0.6186649, -0.8068517, 1, 0.827451, 0, 1,
-1.140533, -1.221618, -1.912289, 1, 0.8352941, 0, 1,
-1.138372, -1.78424, -3.262895, 1, 0.8392157, 0, 1,
-1.130578, 0.5860189, -1.160649, 1, 0.8470588, 0, 1,
-1.12916, -0.3434778, -2.605086, 1, 0.8509804, 0, 1,
-1.127575, 0.3183304, 1.078662, 1, 0.8588235, 0, 1,
-1.121384, 0.07093514, -3.177501, 1, 0.8627451, 0, 1,
-1.120085, 0.372093, -1.050194, 1, 0.8705882, 0, 1,
-1.113386, 0.3773487, -0.5593203, 1, 0.8745098, 0, 1,
-1.101967, -1.814506, -1.264949, 1, 0.8823529, 0, 1,
-1.09205, 1.559476, -0.9313277, 1, 0.8862745, 0, 1,
-1.08388, -0.3975067, -3.714983, 1, 0.8941177, 0, 1,
-1.075502, 0.285829, -2.475471, 1, 0.8980392, 0, 1,
-1.068118, 0.8513599, 0.02120635, 1, 0.9058824, 0, 1,
-1.048828, -0.4240055, -1.673158, 1, 0.9137255, 0, 1,
-1.046356, -0.138287, -0.7378522, 1, 0.9176471, 0, 1,
-1.044002, 1.098078, -1.521736, 1, 0.9254902, 0, 1,
-1.043869, -1.545487, -2.17699, 1, 0.9294118, 0, 1,
-1.037982, 0.5648743, -1.555636, 1, 0.9372549, 0, 1,
-1.029635, 0.3639511, -1.680357, 1, 0.9411765, 0, 1,
-1.018532, -0.5323266, -3.028476, 1, 0.9490196, 0, 1,
-1.013932, 0.09086618, -0.6015988, 1, 0.9529412, 0, 1,
-1.006219, 1.851453, 1.035797, 1, 0.9607843, 0, 1,
-1.005305, -1.010446, -1.296336, 1, 0.9647059, 0, 1,
-1.003833, -0.09441318, -1.825052, 1, 0.972549, 0, 1,
-0.9959771, 0.970397, -0.01312275, 1, 0.9764706, 0, 1,
-0.9915642, 0.03843546, -2.994778, 1, 0.9843137, 0, 1,
-0.9903064, 0.8567389, 0.1144152, 1, 0.9882353, 0, 1,
-0.989772, 1.022838, -1.008594, 1, 0.9960784, 0, 1,
-0.9866976, 0.1553571, -1.462956, 0.9960784, 1, 0, 1,
-0.9783671, -0.4313298, -2.225076, 0.9921569, 1, 0, 1,
-0.9746986, -1.246555, -1.883324, 0.9843137, 1, 0, 1,
-0.9712291, 1.136206, -1.043723, 0.9803922, 1, 0, 1,
-0.9707179, 0.4984707, -1.505436, 0.972549, 1, 0, 1,
-0.9703305, -0.1594026, -1.283269, 0.9686275, 1, 0, 1,
-0.9636248, -0.2092725, -1.587261, 0.9607843, 1, 0, 1,
-0.9600255, 0.0004679897, -2.383007, 0.9568627, 1, 0, 1,
-0.9598363, -0.1913113, -1.485608, 0.9490196, 1, 0, 1,
-0.9587625, -0.642597, -2.888361, 0.945098, 1, 0, 1,
-0.9576718, 0.8015478, -1.51335, 0.9372549, 1, 0, 1,
-0.956972, 1.982795, -1.077315, 0.9333333, 1, 0, 1,
-0.9537051, 0.004211233, -1.280202, 0.9254902, 1, 0, 1,
-0.9481308, 0.05966549, -1.272627, 0.9215686, 1, 0, 1,
-0.9380292, 0.3785691, -2.436054, 0.9137255, 1, 0, 1,
-0.9357601, 1.775131, -2.093167, 0.9098039, 1, 0, 1,
-0.9267507, -0.2736838, -0.7039787, 0.9019608, 1, 0, 1,
-0.9251322, -1.198182, -0.7841592, 0.8941177, 1, 0, 1,
-0.9238215, -0.5015998, -2.77833, 0.8901961, 1, 0, 1,
-0.9182621, -1.660669, -2.028495, 0.8823529, 1, 0, 1,
-0.9161859, 0.7901936, 0.4929233, 0.8784314, 1, 0, 1,
-0.9087555, -0.7880127, -3.23277, 0.8705882, 1, 0, 1,
-0.9004273, -0.5098976, -3.186395, 0.8666667, 1, 0, 1,
-0.8999454, -0.04183604, -1.764119, 0.8588235, 1, 0, 1,
-0.8963487, -3.542927, -2.652698, 0.854902, 1, 0, 1,
-0.8958735, 0.1172982, -0.1968538, 0.8470588, 1, 0, 1,
-0.894917, 0.4420131, -1.33727, 0.8431373, 1, 0, 1,
-0.8784724, -0.9936562, -0.9972097, 0.8352941, 1, 0, 1,
-0.8780678, -0.03643463, -2.537034, 0.8313726, 1, 0, 1,
-0.876695, 1.731878, -1.572601, 0.8235294, 1, 0, 1,
-0.8743854, 0.1659228, -1.769396, 0.8196079, 1, 0, 1,
-0.8742275, 0.3400537, -1.458151, 0.8117647, 1, 0, 1,
-0.871928, -1.384144, -1.79008, 0.8078431, 1, 0, 1,
-0.8686771, 0.8828477, -0.9091453, 0.8, 1, 0, 1,
-0.8653942, 0.118828, -0.6869748, 0.7921569, 1, 0, 1,
-0.8653514, -0.7033381, -2.001703, 0.7882353, 1, 0, 1,
-0.8615528, -0.637453, -0.6183456, 0.7803922, 1, 0, 1,
-0.861374, -2.180013, -3.171508, 0.7764706, 1, 0, 1,
-0.8600931, -0.3537126, -1.050193, 0.7686275, 1, 0, 1,
-0.8547252, 0.5760491, 0.2892691, 0.7647059, 1, 0, 1,
-0.8543894, 0.5117612, -3.67266, 0.7568628, 1, 0, 1,
-0.8522455, -0.3365401, -3.297793, 0.7529412, 1, 0, 1,
-0.8414556, -0.0130181, -0.7177732, 0.7450981, 1, 0, 1,
-0.8381658, 0.1540982, 0.4698968, 0.7411765, 1, 0, 1,
-0.8363732, 0.2419415, -1.44034, 0.7333333, 1, 0, 1,
-0.8302757, 1.523456, -1.881117, 0.7294118, 1, 0, 1,
-0.8289567, -0.6488612, -2.251221, 0.7215686, 1, 0, 1,
-0.8250709, -0.647701, -1.450404, 0.7176471, 1, 0, 1,
-0.8248914, -0.870836, -3.762381, 0.7098039, 1, 0, 1,
-0.8211449, -0.6393701, -2.492209, 0.7058824, 1, 0, 1,
-0.8153313, 0.02886959, -0.8696656, 0.6980392, 1, 0, 1,
-0.8132693, -1.782813, -2.720059, 0.6901961, 1, 0, 1,
-0.8121637, 0.8618486, -2.026666, 0.6862745, 1, 0, 1,
-0.8118011, 1.199121, 1.736627, 0.6784314, 1, 0, 1,
-0.8104709, -0.02353125, -1.933202, 0.6745098, 1, 0, 1,
-0.8014928, -0.3641183, -2.294241, 0.6666667, 1, 0, 1,
-0.8005772, 1.309479, -1.318785, 0.6627451, 1, 0, 1,
-0.7948071, -0.2207565, -1.573337, 0.654902, 1, 0, 1,
-0.7896945, -1.065809, -2.623756, 0.6509804, 1, 0, 1,
-0.7893659, -0.7990602, -2.408154, 0.6431373, 1, 0, 1,
-0.7870401, -0.6077074, -3.381225, 0.6392157, 1, 0, 1,
-0.7809624, 0.7436289, 0.7031925, 0.6313726, 1, 0, 1,
-0.7794486, -1.045671, -2.882206, 0.627451, 1, 0, 1,
-0.7773656, 1.430318, -1.160105, 0.6196079, 1, 0, 1,
-0.7751631, 0.9249288, -1.18226, 0.6156863, 1, 0, 1,
-0.7683015, 0.1138872, -1.121632, 0.6078432, 1, 0, 1,
-0.7667904, 0.2639292, -2.05371, 0.6039216, 1, 0, 1,
-0.7662096, -1.05914, -2.501002, 0.5960785, 1, 0, 1,
-0.7656637, 0.01302447, -2.644137, 0.5882353, 1, 0, 1,
-0.7602855, 1.286474, 1.225163, 0.5843138, 1, 0, 1,
-0.7571763, -1.212703, -2.855299, 0.5764706, 1, 0, 1,
-0.7557418, -1.304073, -2.528777, 0.572549, 1, 0, 1,
-0.7516817, 0.2776012, 0.9587193, 0.5647059, 1, 0, 1,
-0.7464694, -0.4344746, -1.009552, 0.5607843, 1, 0, 1,
-0.7455456, -0.2244123, 0.7513799, 0.5529412, 1, 0, 1,
-0.744382, -0.05587777, -2.255208, 0.5490196, 1, 0, 1,
-0.74242, -1.93633, -1.579934, 0.5411765, 1, 0, 1,
-0.7370844, -0.03052037, -2.155514, 0.5372549, 1, 0, 1,
-0.7347255, 0.9556825, -1.936376, 0.5294118, 1, 0, 1,
-0.7339162, -0.22432, -0.9656332, 0.5254902, 1, 0, 1,
-0.7331464, -0.4558782, -3.03173, 0.5176471, 1, 0, 1,
-0.7292587, -1.013446, -2.18652, 0.5137255, 1, 0, 1,
-0.7254403, -0.2919023, -1.23841, 0.5058824, 1, 0, 1,
-0.7234095, 0.3019664, -1.469242, 0.5019608, 1, 0, 1,
-0.7171274, 1.142857, -0.8079755, 0.4941176, 1, 0, 1,
-0.7129189, 0.6711383, 0.5751971, 0.4862745, 1, 0, 1,
-0.712294, 0.7704622, -0.1701927, 0.4823529, 1, 0, 1,
-0.7083023, 0.5622059, -0.7842289, 0.4745098, 1, 0, 1,
-0.7042034, 2.02562, 0.2062947, 0.4705882, 1, 0, 1,
-0.7002072, -0.794134, -3.578892, 0.4627451, 1, 0, 1,
-0.6991068, 1.080195, 1.322545, 0.4588235, 1, 0, 1,
-0.6975168, 0.3115016, -1.202171, 0.4509804, 1, 0, 1,
-0.695712, -0.7725964, -0.9483144, 0.4470588, 1, 0, 1,
-0.6937286, 0.4627217, -1.907164, 0.4392157, 1, 0, 1,
-0.6934541, -0.5031272, -1.770034, 0.4352941, 1, 0, 1,
-0.692839, 0.6381785, -0.01416842, 0.427451, 1, 0, 1,
-0.6762242, -1.269571, -2.064945, 0.4235294, 1, 0, 1,
-0.6747608, 0.77364, -1.525719, 0.4156863, 1, 0, 1,
-0.6724105, 0.869196, 2.132962, 0.4117647, 1, 0, 1,
-0.6718824, 1.03443, 0.2157948, 0.4039216, 1, 0, 1,
-0.6664456, 0.2846289, -1.072968, 0.3960784, 1, 0, 1,
-0.6608099, 0.5955741, 0.1004295, 0.3921569, 1, 0, 1,
-0.6558341, -1.037446, -2.69499, 0.3843137, 1, 0, 1,
-0.6417212, 0.3635852, -0.6847383, 0.3803922, 1, 0, 1,
-0.6407479, -0.3409797, -2.377082, 0.372549, 1, 0, 1,
-0.6368166, 3.241525, 0.9549119, 0.3686275, 1, 0, 1,
-0.6335148, 0.2636967, -3.074427, 0.3607843, 1, 0, 1,
-0.6283703, 1.349644, 0.4459487, 0.3568628, 1, 0, 1,
-0.6237148, -0.3710206, -2.141197, 0.3490196, 1, 0, 1,
-0.6222573, 0.3011908, -0.06199782, 0.345098, 1, 0, 1,
-0.6156315, -0.4526551, -2.803341, 0.3372549, 1, 0, 1,
-0.6133979, -0.1525806, -0.5078546, 0.3333333, 1, 0, 1,
-0.6055036, -0.5003735, -2.453662, 0.3254902, 1, 0, 1,
-0.6040035, 0.1101821, -1.004754, 0.3215686, 1, 0, 1,
-0.6034917, 0.07638573, -0.791666, 0.3137255, 1, 0, 1,
-0.6009237, -1.492505, -2.585515, 0.3098039, 1, 0, 1,
-0.600571, -0.1202555, -0.8754915, 0.3019608, 1, 0, 1,
-0.5988405, 1.6112, 0.4468919, 0.2941177, 1, 0, 1,
-0.5911901, 1.080615, 0.3529869, 0.2901961, 1, 0, 1,
-0.5803574, 1.380283, -0.534131, 0.282353, 1, 0, 1,
-0.5801153, 0.6604034, -0.7676829, 0.2784314, 1, 0, 1,
-0.5796084, -0.8372589, -1.408458, 0.2705882, 1, 0, 1,
-0.5749459, 1.002416, 1.210565, 0.2666667, 1, 0, 1,
-0.5708508, -0.8172978, -2.911705, 0.2588235, 1, 0, 1,
-0.5703224, -0.5188885, -3.013917, 0.254902, 1, 0, 1,
-0.5675358, 1.080003, -2.605088, 0.2470588, 1, 0, 1,
-0.5669701, 0.08558586, -2.023994, 0.2431373, 1, 0, 1,
-0.565537, -0.7872013, -1.073918, 0.2352941, 1, 0, 1,
-0.5557903, 1.496352, 0.1681477, 0.2313726, 1, 0, 1,
-0.5557083, -0.7236255, -4.192248, 0.2235294, 1, 0, 1,
-0.5532858, 0.8594022, -1.59306, 0.2196078, 1, 0, 1,
-0.5506204, 0.02014611, -1.893378, 0.2117647, 1, 0, 1,
-0.5456734, -0.1131505, -2.544281, 0.2078431, 1, 0, 1,
-0.5449902, -0.7983127, -2.219877, 0.2, 1, 0, 1,
-0.5434729, -0.5171137, -2.569029, 0.1921569, 1, 0, 1,
-0.5399332, -1.037545, 0.1431248, 0.1882353, 1, 0, 1,
-0.5395153, 0.04412501, -2.602697, 0.1803922, 1, 0, 1,
-0.5389656, 0.6112452, 0.8250017, 0.1764706, 1, 0, 1,
-0.5375587, -0.5807456, -2.876024, 0.1686275, 1, 0, 1,
-0.535738, -0.3918553, -3.306321, 0.1647059, 1, 0, 1,
-0.5336933, -1.279821, -3.672818, 0.1568628, 1, 0, 1,
-0.5311893, -0.5795771, -1.574943, 0.1529412, 1, 0, 1,
-0.5310612, 0.9160997, -2.546372, 0.145098, 1, 0, 1,
-0.5274314, 0.7065741, -0.1270651, 0.1411765, 1, 0, 1,
-0.5253, 0.7856268, -2.42527, 0.1333333, 1, 0, 1,
-0.5203712, -0.4946118, -2.584194, 0.1294118, 1, 0, 1,
-0.5163636, 1.073861, -0.7677029, 0.1215686, 1, 0, 1,
-0.5154633, -0.02726831, -3.620969, 0.1176471, 1, 0, 1,
-0.5146058, 1.041119, -0.170658, 0.1098039, 1, 0, 1,
-0.5130194, -2.104337, -2.567102, 0.1058824, 1, 0, 1,
-0.5126127, 2.109531, -0.07411234, 0.09803922, 1, 0, 1,
-0.5109078, 1.260231, -0.8104339, 0.09019608, 1, 0, 1,
-0.5054584, -0.6153837, -1.544656, 0.08627451, 1, 0, 1,
-0.4984061, -0.7811182, -1.173329, 0.07843138, 1, 0, 1,
-0.493383, 1.699526, 0.4678394, 0.07450981, 1, 0, 1,
-0.4907402, 0.5482295, -1.743296, 0.06666667, 1, 0, 1,
-0.4892974, 1.83702, 0.1789852, 0.0627451, 1, 0, 1,
-0.483947, 0.4118756, -2.304831, 0.05490196, 1, 0, 1,
-0.4819196, 0.5814161, -1.092962, 0.05098039, 1, 0, 1,
-0.4805441, 0.1155795, -1.31234, 0.04313726, 1, 0, 1,
-0.4791012, -0.1742653, -1.161924, 0.03921569, 1, 0, 1,
-0.4787368, 1.701352, -1.100675, 0.03137255, 1, 0, 1,
-0.4774508, 1.009031, 0.5325967, 0.02745098, 1, 0, 1,
-0.474776, -0.4438918, -3.130505, 0.01960784, 1, 0, 1,
-0.4705936, 0.3735322, -0.8348794, 0.01568628, 1, 0, 1,
-0.4679089, 0.001779189, 0.374217, 0.007843138, 1, 0, 1,
-0.4656324, 0.593649, -3.158644, 0.003921569, 1, 0, 1,
-0.4620697, 0.9810608, -0.3648587, 0, 1, 0.003921569, 1,
-0.461717, -0.1641721, -0.9176598, 0, 1, 0.01176471, 1,
-0.4582364, -0.2668108, -2.769361, 0, 1, 0.01568628, 1,
-0.4568975, 0.694582, -1.707042, 0, 1, 0.02352941, 1,
-0.4547501, -0.436368, -3.758974, 0, 1, 0.02745098, 1,
-0.4534444, 1.46878, -1.725035, 0, 1, 0.03529412, 1,
-0.4521381, 0.6872111, -0.5325543, 0, 1, 0.03921569, 1,
-0.4496169, 1.53567, -0.9610175, 0, 1, 0.04705882, 1,
-0.4452269, -0.5813502, -2.89247, 0, 1, 0.05098039, 1,
-0.4436333, 0.2262412, -0.6640007, 0, 1, 0.05882353, 1,
-0.4419511, -0.7530535, -1.737404, 0, 1, 0.0627451, 1,
-0.4413637, -1.016563, -3.190226, 0, 1, 0.07058824, 1,
-0.4353225, -0.0005931056, -2.249663, 0, 1, 0.07450981, 1,
-0.4340347, 0.2040591, -1.048552, 0, 1, 0.08235294, 1,
-0.4337936, -0.1074824, -0.6442808, 0, 1, 0.08627451, 1,
-0.4329262, -0.2239456, -0.2645937, 0, 1, 0.09411765, 1,
-0.4324335, 0.737714, -1.40798, 0, 1, 0.1019608, 1,
-0.4316084, -0.9573807, -3.212404, 0, 1, 0.1058824, 1,
-0.4285851, -0.7650527, -4.372092, 0, 1, 0.1137255, 1,
-0.4220311, -0.9669222, -3.779703, 0, 1, 0.1176471, 1,
-0.415091, -0.322649, -3.976624, 0, 1, 0.1254902, 1,
-0.4148901, 0.6771156, -0.6527964, 0, 1, 0.1294118, 1,
-0.4139425, 0.3761646, -1.526583, 0, 1, 0.1372549, 1,
-0.4136894, -0.2245282, -0.3980578, 0, 1, 0.1411765, 1,
-0.4135671, -0.02937665, -1.185242, 0, 1, 0.1490196, 1,
-0.4061217, 0.05835001, -0.9937128, 0, 1, 0.1529412, 1,
-0.4037252, -1.532454, -4.684705, 0, 1, 0.1607843, 1,
-0.4034543, 1.141271, -0.8750871, 0, 1, 0.1647059, 1,
-0.3996147, -0.9774208, -4.499987, 0, 1, 0.172549, 1,
-0.3978859, 1.399165, -1.080123, 0, 1, 0.1764706, 1,
-0.392452, 1.188293, 0.6944117, 0, 1, 0.1843137, 1,
-0.3838441, 1.107932, 1.356845, 0, 1, 0.1882353, 1,
-0.3824599, 1.188384, -0.1526139, 0, 1, 0.1960784, 1,
-0.3790695, 1.079301, -2.373849, 0, 1, 0.2039216, 1,
-0.3780344, 1.243774, 0.1331314, 0, 1, 0.2078431, 1,
-0.3755815, -0.1953899, -0.9826489, 0, 1, 0.2156863, 1,
-0.373605, -0.2295352, -1.95901, 0, 1, 0.2196078, 1,
-0.373349, 1.510057, -0.1487551, 0, 1, 0.227451, 1,
-0.370208, -0.04096541, -1.705968, 0, 1, 0.2313726, 1,
-0.3688918, 1.008647, -0.2964451, 0, 1, 0.2392157, 1,
-0.3669194, 1.238341, -1.618888, 0, 1, 0.2431373, 1,
-0.3539364, 1.195265, 1.443802, 0, 1, 0.2509804, 1,
-0.35276, 0.5350349, -1.428119, 0, 1, 0.254902, 1,
-0.348265, 0.9905202, 0.8204998, 0, 1, 0.2627451, 1,
-0.3475349, 0.933666, -1.229055, 0, 1, 0.2666667, 1,
-0.3448023, 0.3158956, -0.7331701, 0, 1, 0.2745098, 1,
-0.3428563, 1.090347, -1.179858, 0, 1, 0.2784314, 1,
-0.339938, -1.502332, -4.480453, 0, 1, 0.2862745, 1,
-0.339405, -0.1320312, -2.772238, 0, 1, 0.2901961, 1,
-0.3385266, 1.593862, -0.206212, 0, 1, 0.2980392, 1,
-0.3376439, 0.4774309, -1.938814, 0, 1, 0.3058824, 1,
-0.3318933, 1.203581, 0.3256143, 0, 1, 0.3098039, 1,
-0.327922, -2.018883, -2.987836, 0, 1, 0.3176471, 1,
-0.3270172, -0.5485645, -5.431283, 0, 1, 0.3215686, 1,
-0.3269893, 0.5502555, 0.5986829, 0, 1, 0.3294118, 1,
-0.3268378, 1.622094, 0.4413124, 0, 1, 0.3333333, 1,
-0.3262204, -0.4472147, -5.021124, 0, 1, 0.3411765, 1,
-0.3241725, -0.6835495, -2.959313, 0, 1, 0.345098, 1,
-0.321532, 0.02741292, -0.6991857, 0, 1, 0.3529412, 1,
-0.3213584, -0.2718511, -1.274293, 0, 1, 0.3568628, 1,
-0.3182414, -0.3553534, -1.962273, 0, 1, 0.3647059, 1,
-0.3157003, 0.9219949, 0.07785576, 0, 1, 0.3686275, 1,
-0.3147679, 0.1983343, -0.5349545, 0, 1, 0.3764706, 1,
-0.3109805, 0.5458442, -1.765502, 0, 1, 0.3803922, 1,
-0.3084308, -0.2327516, -1.987692, 0, 1, 0.3882353, 1,
-0.3076283, -1.470024, -2.476508, 0, 1, 0.3921569, 1,
-0.3018954, 0.2104586, -1.441775, 0, 1, 0.4, 1,
-0.2984742, -0.7734939, -1.50579, 0, 1, 0.4078431, 1,
-0.2977764, 1.774175, -0.02716184, 0, 1, 0.4117647, 1,
-0.297737, -0.941522, -3.792765, 0, 1, 0.4196078, 1,
-0.2972311, 0.2943864, -1.656772, 0, 1, 0.4235294, 1,
-0.2939168, -0.1110482, -1.636873, 0, 1, 0.4313726, 1,
-0.2908291, -1.615726, -2.791045, 0, 1, 0.4352941, 1,
-0.287822, 0.2832703, 0.1006887, 0, 1, 0.4431373, 1,
-0.2854682, 0.8090027, -0.2657166, 0, 1, 0.4470588, 1,
-0.2826085, -0.38392, -2.068789, 0, 1, 0.454902, 1,
-0.2821255, -0.5844514, -2.726502, 0, 1, 0.4588235, 1,
-0.2819457, -1.64517, -3.281804, 0, 1, 0.4666667, 1,
-0.279515, 1.055805, -0.4816307, 0, 1, 0.4705882, 1,
-0.2732456, -2.326332, -3.636058, 0, 1, 0.4784314, 1,
-0.2708845, -0.921277, -2.796741, 0, 1, 0.4823529, 1,
-0.2706187, 0.81293, 1.078601, 0, 1, 0.4901961, 1,
-0.2697383, -1.241858, -2.15995, 0, 1, 0.4941176, 1,
-0.2640713, -0.987203, -2.357821, 0, 1, 0.5019608, 1,
-0.2589889, 0.8869603, -1.26336, 0, 1, 0.509804, 1,
-0.2568146, 1.038404, 0.122024, 0, 1, 0.5137255, 1,
-0.2531533, -1.247473, -5.35059, 0, 1, 0.5215687, 1,
-0.2460838, 1.677794, -1.201355, 0, 1, 0.5254902, 1,
-0.2409158, 0.7190225, 0.04925079, 0, 1, 0.5333334, 1,
-0.2384569, -0.5011527, -1.594243, 0, 1, 0.5372549, 1,
-0.2358847, -1.975278, -6.235757, 0, 1, 0.5450981, 1,
-0.231412, -0.8821216, -2.328708, 0, 1, 0.5490196, 1,
-0.2265366, -0.5943695, -0.8901301, 0, 1, 0.5568628, 1,
-0.2251703, 0.05997565, -2.362383, 0, 1, 0.5607843, 1,
-0.2238414, -0.52245, -3.119687, 0, 1, 0.5686275, 1,
-0.2212813, -0.2215109, -2.612125, 0, 1, 0.572549, 1,
-0.2206205, -0.9881467, -3.213758, 0, 1, 0.5803922, 1,
-0.2179418, -0.1989519, -2.486547, 0, 1, 0.5843138, 1,
-0.2160564, -0.2344321, -2.371804, 0, 1, 0.5921569, 1,
-0.2131705, 0.5769169, 0.5528687, 0, 1, 0.5960785, 1,
-0.2117465, -0.5850145, -3.113804, 0, 1, 0.6039216, 1,
-0.2054543, -0.5226612, -1.010051, 0, 1, 0.6117647, 1,
-0.2043934, 0.200563, -1.450323, 0, 1, 0.6156863, 1,
-0.2030057, -1.045573, -2.800814, 0, 1, 0.6235294, 1,
-0.1993454, -1.583658, -2.236066, 0, 1, 0.627451, 1,
-0.1965231, -0.4860376, -1.931551, 0, 1, 0.6352941, 1,
-0.194778, -0.04240211, -3.0789, 0, 1, 0.6392157, 1,
-0.1872286, -0.4179718, -1.820693, 0, 1, 0.6470588, 1,
-0.1849634, 0.2287834, -1.514917, 0, 1, 0.6509804, 1,
-0.1830027, 0.05930671, -2.838048, 0, 1, 0.6588235, 1,
-0.1805937, 0.4793043, -1.182472, 0, 1, 0.6627451, 1,
-0.1774444, -0.002809016, -2.679141, 0, 1, 0.6705883, 1,
-0.1772363, -0.430021, -1.595377, 0, 1, 0.6745098, 1,
-0.1719757, 0.6533865, -0.1741942, 0, 1, 0.682353, 1,
-0.1655476, -0.9299849, -4.262632, 0, 1, 0.6862745, 1,
-0.1626871, -0.08342339, -2.607311, 0, 1, 0.6941177, 1,
-0.1624356, -0.7999278, -3.176892, 0, 1, 0.7019608, 1,
-0.1615755, -0.03298289, -1.047902, 0, 1, 0.7058824, 1,
-0.1606829, -0.1419095, -2.595262, 0, 1, 0.7137255, 1,
-0.1549682, 3.717027, -1.91596, 0, 1, 0.7176471, 1,
-0.1539342, -0.9645523, -5.091791, 0, 1, 0.7254902, 1,
-0.1498566, -1.848241, -2.848949, 0, 1, 0.7294118, 1,
-0.1479957, -0.2433296, -1.516028, 0, 1, 0.7372549, 1,
-0.1479176, -0.7864285, -3.528443, 0, 1, 0.7411765, 1,
-0.1459544, -0.8183574, -2.892084, 0, 1, 0.7490196, 1,
-0.142199, -0.5486682, -3.659504, 0, 1, 0.7529412, 1,
-0.1410072, -1.070134, -2.285972, 0, 1, 0.7607843, 1,
-0.1399676, 0.3096125, -0.8894558, 0, 1, 0.7647059, 1,
-0.136094, 1.905801, -0.401707, 0, 1, 0.772549, 1,
-0.1347884, -2.433285, -1.068258, 0, 1, 0.7764706, 1,
-0.1238154, 0.2133901, 0.3896824, 0, 1, 0.7843137, 1,
-0.1223643, -1.345237, -3.111571, 0, 1, 0.7882353, 1,
-0.1191544, -1.361001, -4.780234, 0, 1, 0.7960784, 1,
-0.11457, 0.7960293, -1.427905, 0, 1, 0.8039216, 1,
-0.1117817, -0.8784563, -1.623955, 0, 1, 0.8078431, 1,
-0.111103, 0.1675096, -2.065367, 0, 1, 0.8156863, 1,
-0.1103276, -1.596325, -5.830657, 0, 1, 0.8196079, 1,
-0.1099838, -0.2029198, -1.493362, 0, 1, 0.827451, 1,
-0.1068176, 1.649693, 0.09755711, 0, 1, 0.8313726, 1,
-0.1053127, 0.2578326, 0.6429248, 0, 1, 0.8392157, 1,
-0.1035988, -1.571013, -1.80651, 0, 1, 0.8431373, 1,
-0.1002195, -1.664368, -2.320481, 0, 1, 0.8509804, 1,
-0.09765968, -0.5887204, -4.278346, 0, 1, 0.854902, 1,
-0.0907886, 2.506929, -0.9397277, 0, 1, 0.8627451, 1,
-0.08262815, -0.2240382, -2.030811, 0, 1, 0.8666667, 1,
-0.08143576, -0.5295978, -3.167811, 0, 1, 0.8745098, 1,
-0.08098354, -0.07108092, -4.098552, 0, 1, 0.8784314, 1,
-0.07845449, -1.215325, -2.803997, 0, 1, 0.8862745, 1,
-0.07534857, 0.2147597, 1.2834, 0, 1, 0.8901961, 1,
-0.07216592, 1.501933, -0.7385337, 0, 1, 0.8980392, 1,
-0.07048692, 0.3243774, 1.048371, 0, 1, 0.9058824, 1,
-0.07008097, -0.8268136, -3.299659, 0, 1, 0.9098039, 1,
-0.06503702, -0.04036894, -2.771737, 0, 1, 0.9176471, 1,
-0.06294642, -0.1392501, -3.393291, 0, 1, 0.9215686, 1,
-0.0629265, -0.1407842, -4.376595, 0, 1, 0.9294118, 1,
-0.06207412, -0.6864664, -3.396856, 0, 1, 0.9333333, 1,
-0.06124212, -1.222184, -3.495795, 0, 1, 0.9411765, 1,
-0.05679971, -0.1699393, -3.406705, 0, 1, 0.945098, 1,
-0.05453881, -0.5160844, -3.911273, 0, 1, 0.9529412, 1,
-0.05384642, -1.650276, -2.939881, 0, 1, 0.9568627, 1,
-0.05068807, -0.06425152, -2.739945, 0, 1, 0.9647059, 1,
-0.03502229, -0.8311698, -3.569257, 0, 1, 0.9686275, 1,
-0.03447651, -1.906304, -3.005387, 0, 1, 0.9764706, 1,
-0.02946185, 1.320586, 1.375849, 0, 1, 0.9803922, 1,
-0.02295735, 0.5488358, 2.139721, 0, 1, 0.9882353, 1,
-0.02264011, 0.3435663, 0.008889662, 0, 1, 0.9921569, 1,
-0.02106384, 0.5528904, 1.4337, 0, 1, 1, 1,
-0.01727959, 1.436787, 0.5751449, 0, 0.9921569, 1, 1,
-0.01617222, -1.176583, -3.109098, 0, 0.9882353, 1, 1,
-0.01466481, -0.753167, -3.441024, 0, 0.9803922, 1, 1,
-0.01320838, -0.9965974, -2.650615, 0, 0.9764706, 1, 1,
-0.0119259, 1.134357, -0.5814952, 0, 0.9686275, 1, 1,
-0.0097805, -1.494516, -0.7351436, 0, 0.9647059, 1, 1,
-0.009155871, 1.132215, 0.8369493, 0, 0.9568627, 1, 1,
-0.001047977, -1.04274, -3.770424, 0, 0.9529412, 1, 1,
-0.0007349612, 0.3499284, -1.282738, 0, 0.945098, 1, 1,
0.0002983037, 0.5685107, 0.3960787, 0, 0.9411765, 1, 1,
0.001059831, -0.9535932, 2.707191, 0, 0.9333333, 1, 1,
0.001693506, -1.802329, 3.521846, 0, 0.9294118, 1, 1,
0.01000733, -0.1598925, 3.832904, 0, 0.9215686, 1, 1,
0.01035674, -0.5569809, 1.796209, 0, 0.9176471, 1, 1,
0.01525502, 0.9752302, 1.784648, 0, 0.9098039, 1, 1,
0.02446127, -0.6936024, 1.993975, 0, 0.9058824, 1, 1,
0.03163664, 0.5937655, 0.07908133, 0, 0.8980392, 1, 1,
0.0366881, 0.9725643, -0.6662081, 0, 0.8901961, 1, 1,
0.03998153, 0.4681123, 1.454467, 0, 0.8862745, 1, 1,
0.0414074, 0.4184423, 0.5186517, 0, 0.8784314, 1, 1,
0.04168153, 0.04662502, 0.7968407, 0, 0.8745098, 1, 1,
0.04251288, 0.5819173, -1.989122, 0, 0.8666667, 1, 1,
0.04323539, 0.5698965, 0.04227961, 0, 0.8627451, 1, 1,
0.04387408, -0.2355642, 3.636434, 0, 0.854902, 1, 1,
0.044211, 0.7420673, -0.1375679, 0, 0.8509804, 1, 1,
0.04579956, 0.6660627, 0.1891978, 0, 0.8431373, 1, 1,
0.04626873, -1.148527, 4.638638, 0, 0.8392157, 1, 1,
0.04669667, -0.5836577, 3.133785, 0, 0.8313726, 1, 1,
0.04782617, -0.6290315, 2.777131, 0, 0.827451, 1, 1,
0.04899763, -0.8375303, 3.763651, 0, 0.8196079, 1, 1,
0.04904387, 0.5234302, 0.06526207, 0, 0.8156863, 1, 1,
0.05984272, -0.2251705, 3.346241, 0, 0.8078431, 1, 1,
0.06160318, 0.9381813, -0.2356538, 0, 0.8039216, 1, 1,
0.06216646, -0.4047309, 2.674967, 0, 0.7960784, 1, 1,
0.06283763, -0.245695, 4.511431, 0, 0.7882353, 1, 1,
0.06344636, 1.030597, -2.146114, 0, 0.7843137, 1, 1,
0.06911867, 0.1028873, -0.1829447, 0, 0.7764706, 1, 1,
0.06941964, 0.5963933, 0.9037132, 0, 0.772549, 1, 1,
0.06981036, -2.343065, 3.647483, 0, 0.7647059, 1, 1,
0.07517607, 1.636219, -0.4616406, 0, 0.7607843, 1, 1,
0.07589021, -0.6440994, 3.235069, 0, 0.7529412, 1, 1,
0.07821926, 0.1165695, 0.5141237, 0, 0.7490196, 1, 1,
0.07983613, -0.08321585, -0.3423422, 0, 0.7411765, 1, 1,
0.08087944, -0.3954603, 4.062322, 0, 0.7372549, 1, 1,
0.0812465, 1.041877, 0.0988187, 0, 0.7294118, 1, 1,
0.08900291, 0.4907593, 1.686515, 0, 0.7254902, 1, 1,
0.09072679, 1.400744, 0.5241905, 0, 0.7176471, 1, 1,
0.09243295, -1.06829, 3.977781, 0, 0.7137255, 1, 1,
0.1048598, -0.7618945, 2.535213, 0, 0.7058824, 1, 1,
0.1073342, 1.987723, 1.034698, 0, 0.6980392, 1, 1,
0.1086585, -2.212893, 5.025876, 0, 0.6941177, 1, 1,
0.1143987, -0.2919365, 2.262629, 0, 0.6862745, 1, 1,
0.1153234, 1.118568, -0.5464389, 0, 0.682353, 1, 1,
0.1167418, -1.224723, 3.14752, 0, 0.6745098, 1, 1,
0.1194322, 1.432758, -0.6047219, 0, 0.6705883, 1, 1,
0.1197028, -0.6955957, 3.027865, 0, 0.6627451, 1, 1,
0.1234557, -0.1698085, 2.208717, 0, 0.6588235, 1, 1,
0.1261846, 1.357646, 1.353651, 0, 0.6509804, 1, 1,
0.1276809, -2.889042, 4.467597, 0, 0.6470588, 1, 1,
0.1277566, 2.118406, 2.067259, 0, 0.6392157, 1, 1,
0.1284044, 2.057462, -1.389791, 0, 0.6352941, 1, 1,
0.129414, -0.2602402, 2.954166, 0, 0.627451, 1, 1,
0.1301146, 0.09613813, 0.6918562, 0, 0.6235294, 1, 1,
0.1346906, -2.471829, 2.239808, 0, 0.6156863, 1, 1,
0.1351759, 0.4058651, 0.6379077, 0, 0.6117647, 1, 1,
0.1373429, 0.2480404, 1.785621, 0, 0.6039216, 1, 1,
0.1395122, 0.7881056, 1.542321, 0, 0.5960785, 1, 1,
0.1428825, -1.192542, 1.696507, 0, 0.5921569, 1, 1,
0.1433851, 0.5352634, 1.884085, 0, 0.5843138, 1, 1,
0.1480575, -0.8334301, 0.8471156, 0, 0.5803922, 1, 1,
0.151606, 0.1009822, 0.4654957, 0, 0.572549, 1, 1,
0.1581156, 0.8966047, 1.29465, 0, 0.5686275, 1, 1,
0.1583949, -1.122881, 3.764173, 0, 0.5607843, 1, 1,
0.1646715, -0.4085577, 2.615623, 0, 0.5568628, 1, 1,
0.1712322, 1.159761, -0.1385796, 0, 0.5490196, 1, 1,
0.1777927, 0.6135832, -2.915284, 0, 0.5450981, 1, 1,
0.1814614, -0.4605737, 2.580593, 0, 0.5372549, 1, 1,
0.1841144, -0.376609, 2.477025, 0, 0.5333334, 1, 1,
0.1859801, 0.2437722, 1.084138, 0, 0.5254902, 1, 1,
0.1893313, -1.975818, 3.006114, 0, 0.5215687, 1, 1,
0.1909951, -0.5641865, 5.280129, 0, 0.5137255, 1, 1,
0.1910132, 1.676138, 0.4837359, 0, 0.509804, 1, 1,
0.192105, -2.00904, 2.686296, 0, 0.5019608, 1, 1,
0.1936471, -1.011168, 2.51809, 0, 0.4941176, 1, 1,
0.1997956, -1.69881, 3.779437, 0, 0.4901961, 1, 1,
0.2011657, 1.094236, -1.074172, 0, 0.4823529, 1, 1,
0.2012806, 1.283258, -1.280851, 0, 0.4784314, 1, 1,
0.2050446, 0.3210706, 2.419207, 0, 0.4705882, 1, 1,
0.2071882, -0.5001124, 1.688923, 0, 0.4666667, 1, 1,
0.2074462, 0.6184294, -0.2613333, 0, 0.4588235, 1, 1,
0.2105351, -1.758338, 2.800386, 0, 0.454902, 1, 1,
0.2111281, -0.08208276, 1.124418, 0, 0.4470588, 1, 1,
0.2147754, -0.03026201, 1.016229, 0, 0.4431373, 1, 1,
0.2204344, -0.504773, 3.104617, 0, 0.4352941, 1, 1,
0.2244925, 0.8283041, -0.2552231, 0, 0.4313726, 1, 1,
0.2277754, 2.000276, -0.8561618, 0, 0.4235294, 1, 1,
0.2296058, -1.338882, 2.060147, 0, 0.4196078, 1, 1,
0.2328866, -0.6288422, 2.722, 0, 0.4117647, 1, 1,
0.2366874, 0.8506114, 0.5028236, 0, 0.4078431, 1, 1,
0.2371197, -0.4005508, 1.708903, 0, 0.4, 1, 1,
0.2374402, -0.8086222, 3.722609, 0, 0.3921569, 1, 1,
0.237554, -0.9267431, 3.05111, 0, 0.3882353, 1, 1,
0.2415805, 0.9195453, -0.4640911, 0, 0.3803922, 1, 1,
0.2438918, -2.09696, 2.664643, 0, 0.3764706, 1, 1,
0.2489168, -0.611681, 2.979537, 0, 0.3686275, 1, 1,
0.2502659, -0.3186998, 2.717246, 0, 0.3647059, 1, 1,
0.2529551, 0.03700684, 1.956932, 0, 0.3568628, 1, 1,
0.2536902, -1.437227, 3.200047, 0, 0.3529412, 1, 1,
0.2586285, -0.797668, 3.967281, 0, 0.345098, 1, 1,
0.262558, 1.681826, 1.01561, 0, 0.3411765, 1, 1,
0.2639775, 0.07305457, 1.82469, 0, 0.3333333, 1, 1,
0.2697797, -0.3035435, 2.801977, 0, 0.3294118, 1, 1,
0.2721896, 0.9725367, 1.34969, 0, 0.3215686, 1, 1,
0.2744847, -0.05659616, 2.266722, 0, 0.3176471, 1, 1,
0.2770348, -0.7730981, 4.1333, 0, 0.3098039, 1, 1,
0.2772391, -0.05907654, 3.575018, 0, 0.3058824, 1, 1,
0.2823064, -0.2936105, 3.168474, 0, 0.2980392, 1, 1,
0.2823762, 1.131631, 1.776051, 0, 0.2901961, 1, 1,
0.2888146, 0.6343513, -0.05972825, 0, 0.2862745, 1, 1,
0.2903534, 1.850475, -0.2474855, 0, 0.2784314, 1, 1,
0.291033, 0.6034501, -0.245675, 0, 0.2745098, 1, 1,
0.2916998, 0.8722742, 1.201992, 0, 0.2666667, 1, 1,
0.2935045, 0.8686175, 1.004019, 0, 0.2627451, 1, 1,
0.2935058, -0.3426197, 2.862564, 0, 0.254902, 1, 1,
0.3002137, 0.9917208, -0.9130858, 0, 0.2509804, 1, 1,
0.302537, 0.8010306, -0.9013718, 0, 0.2431373, 1, 1,
0.3048286, 1.610093, 1.495015, 0, 0.2392157, 1, 1,
0.3094034, 0.8988767, 0.9397701, 0, 0.2313726, 1, 1,
0.310681, -0.8934018, 1.641863, 0, 0.227451, 1, 1,
0.3142176, 1.076485, -0.3141215, 0, 0.2196078, 1, 1,
0.3378769, 0.0423878, 1.02476, 0, 0.2156863, 1, 1,
0.3432986, 0.2484554, 0.787144, 0, 0.2078431, 1, 1,
0.346385, -0.1479609, 1.713026, 0, 0.2039216, 1, 1,
0.3478984, 0.3083982, 0.6037333, 0, 0.1960784, 1, 1,
0.3526637, -0.8678942, 2.569468, 0, 0.1882353, 1, 1,
0.3536205, -0.132243, 2.478731, 0, 0.1843137, 1, 1,
0.3580246, 0.06861892, -0.106278, 0, 0.1764706, 1, 1,
0.3592708, 0.2263927, -0.07933422, 0, 0.172549, 1, 1,
0.3633626, 0.9004165, 1.202427, 0, 0.1647059, 1, 1,
0.364338, -0.416815, 3.110835, 0, 0.1607843, 1, 1,
0.3674561, -0.002665056, 1.995407, 0, 0.1529412, 1, 1,
0.3676766, -0.9981264, 1.641408, 0, 0.1490196, 1, 1,
0.3716156, 0.01890729, 1.738256, 0, 0.1411765, 1, 1,
0.3737876, -1.525653, 2.747303, 0, 0.1372549, 1, 1,
0.3772549, -0.2962544, 3.458568, 0, 0.1294118, 1, 1,
0.3774884, -0.539308, 1.941586, 0, 0.1254902, 1, 1,
0.3837887, -2.653503, 0.18168, 0, 0.1176471, 1, 1,
0.3852022, -0.6498505, 2.61871, 0, 0.1137255, 1, 1,
0.3883833, 0.7340773, 1.757251, 0, 0.1058824, 1, 1,
0.3886202, -0.6920146, 2.202912, 0, 0.09803922, 1, 1,
0.3893575, -0.7336415, 1.58531, 0, 0.09411765, 1, 1,
0.3916399, 1.097371, -0.493562, 0, 0.08627451, 1, 1,
0.3941294, 0.805097, 0.3494187, 0, 0.08235294, 1, 1,
0.3961662, -0.3227358, 2.638639, 0, 0.07450981, 1, 1,
0.3971821, -1.147098, 1.736559, 0, 0.07058824, 1, 1,
0.403077, -0.6252583, 3.453978, 0, 0.0627451, 1, 1,
0.4033274, -0.1891001, 1.277735, 0, 0.05882353, 1, 1,
0.4050266, 1.181188, -0.2319372, 0, 0.05098039, 1, 1,
0.4102987, -0.7187705, 4.296657, 0, 0.04705882, 1, 1,
0.420633, 0.932409, 1.88869, 0, 0.03921569, 1, 1,
0.421822, -0.3749639, 1.286722, 0, 0.03529412, 1, 1,
0.4234037, -0.3830873, 3.047872, 0, 0.02745098, 1, 1,
0.4253384, 0.3071981, 1.734977, 0, 0.02352941, 1, 1,
0.4312267, -0.006059636, 2.4196, 0, 0.01568628, 1, 1,
0.4323686, 1.44571, 0.9115484, 0, 0.01176471, 1, 1,
0.4378031, 0.9768056, 0.3403268, 0, 0.003921569, 1, 1,
0.4423642, 2.41098, -0.1664637, 0.003921569, 0, 1, 1,
0.4492075, -0.7370806, 3.528563, 0.007843138, 0, 1, 1,
0.4492872, 0.377845, 1.405587, 0.01568628, 0, 1, 1,
0.4573657, -0.4272888, 3.863526, 0.01960784, 0, 1, 1,
0.4599479, -0.219507, 1.204048, 0.02745098, 0, 1, 1,
0.4600878, -0.1758188, 0.8407632, 0.03137255, 0, 1, 1,
0.461228, 0.1191848, 1.314876, 0.03921569, 0, 1, 1,
0.4618698, -1.060464, 2.772377, 0.04313726, 0, 1, 1,
0.4658445, 0.4611688, 2.0392, 0.05098039, 0, 1, 1,
0.4676121, 1.68243, 0.139047, 0.05490196, 0, 1, 1,
0.4676171, 0.7239476, -0.009293088, 0.0627451, 0, 1, 1,
0.4711708, -0.2766364, 1.804492, 0.06666667, 0, 1, 1,
0.4747278, 0.9597527, 0.8181226, 0.07450981, 0, 1, 1,
0.4754387, 1.51579, 1.710688, 0.07843138, 0, 1, 1,
0.4786188, 1.361529, -0.02338381, 0.08627451, 0, 1, 1,
0.4843524, 1.685706, -0.3569226, 0.09019608, 0, 1, 1,
0.484676, -1.082024, 2.971192, 0.09803922, 0, 1, 1,
0.492219, -0.5961542, 2.26158, 0.1058824, 0, 1, 1,
0.4931399, -0.6951229, 3.243487, 0.1098039, 0, 1, 1,
0.4933595, 0.09696385, 1.734735, 0.1176471, 0, 1, 1,
0.4972052, -1.143735, 3.720178, 0.1215686, 0, 1, 1,
0.4976015, -0.7399876, 2.040511, 0.1294118, 0, 1, 1,
0.505994, -1.414825, 4.413518, 0.1333333, 0, 1, 1,
0.5093411, 0.1382682, 1.142945, 0.1411765, 0, 1, 1,
0.5126214, -0.4637911, 2.836276, 0.145098, 0, 1, 1,
0.5167141, -1.613028, 2.115818, 0.1529412, 0, 1, 1,
0.5198883, -0.536853, 2.05159, 0.1568628, 0, 1, 1,
0.5226371, -0.9840444, 2.083914, 0.1647059, 0, 1, 1,
0.524509, -0.8198212, 3.221187, 0.1686275, 0, 1, 1,
0.5251112, -0.8906735, 0.595275, 0.1764706, 0, 1, 1,
0.525798, -0.3984286, 1.262151, 0.1803922, 0, 1, 1,
0.5270642, 0.1001323, 2.042993, 0.1882353, 0, 1, 1,
0.5279092, -0.7837988, 2.549657, 0.1921569, 0, 1, 1,
0.5300263, -0.7384808, 1.847709, 0.2, 0, 1, 1,
0.5303069, -0.09780389, 1.41618, 0.2078431, 0, 1, 1,
0.5428608, -1.935364, 3.329297, 0.2117647, 0, 1, 1,
0.5475587, -1.07199, 1.455706, 0.2196078, 0, 1, 1,
0.5485043, 0.1182464, 2.285007, 0.2235294, 0, 1, 1,
0.5530877, -1.089887, 2.182786, 0.2313726, 0, 1, 1,
0.5531653, -0.2121589, 0.684736, 0.2352941, 0, 1, 1,
0.5541303, -0.4208938, 2.062553, 0.2431373, 0, 1, 1,
0.5542411, -0.6755975, 3.896051, 0.2470588, 0, 1, 1,
0.5571759, -0.4284697, 0.8683749, 0.254902, 0, 1, 1,
0.5576317, 1.329722, 1.24178, 0.2588235, 0, 1, 1,
0.5598936, -0.3242708, 2.361056, 0.2666667, 0, 1, 1,
0.5641196, -1.12476, 2.5692, 0.2705882, 0, 1, 1,
0.5646785, -1.544581, 2.052572, 0.2784314, 0, 1, 1,
0.5797564, 0.04688678, 2.869459, 0.282353, 0, 1, 1,
0.5803567, -0.3782131, 2.658514, 0.2901961, 0, 1, 1,
0.5823377, 0.1379542, -0.4969728, 0.2941177, 0, 1, 1,
0.5838869, 1.012381, 0.6100187, 0.3019608, 0, 1, 1,
0.5918507, 0.5113666, -0.5546712, 0.3098039, 0, 1, 1,
0.5940154, 0.2596333, 1.618952, 0.3137255, 0, 1, 1,
0.5940956, -1.069637, 2.118327, 0.3215686, 0, 1, 1,
0.6038496, 0.4505769, 2.664749, 0.3254902, 0, 1, 1,
0.6040072, 1.522844, 2.26198, 0.3333333, 0, 1, 1,
0.6065521, -1.010102, 2.617866, 0.3372549, 0, 1, 1,
0.6078635, -1.363671, 4.802577, 0.345098, 0, 1, 1,
0.6086788, 0.1756087, 0.9881377, 0.3490196, 0, 1, 1,
0.6185735, -0.5990229, 3.834755, 0.3568628, 0, 1, 1,
0.6211994, 1.085281, 2.531654, 0.3607843, 0, 1, 1,
0.6214126, 0.9049459, -1.446682, 0.3686275, 0, 1, 1,
0.6217374, -1.078114, 2.114375, 0.372549, 0, 1, 1,
0.6231483, -0.2547134, 1.672545, 0.3803922, 0, 1, 1,
0.6235311, 0.0887043, 0.1242082, 0.3843137, 0, 1, 1,
0.6283603, -0.2017236, -0.2217899, 0.3921569, 0, 1, 1,
0.6292181, -1.271596, 2.44706, 0.3960784, 0, 1, 1,
0.633338, 0.6173469, 0.4833933, 0.4039216, 0, 1, 1,
0.6362569, -0.2594011, 2.582014, 0.4117647, 0, 1, 1,
0.6463104, 1.289466, -0.1832369, 0.4156863, 0, 1, 1,
0.6481237, -1.551985, 3.182887, 0.4235294, 0, 1, 1,
0.6509807, 1.979532, 0.9974948, 0.427451, 0, 1, 1,
0.651817, -0.2308773, 3.63066, 0.4352941, 0, 1, 1,
0.6536353, 1.91588, 0.07662901, 0.4392157, 0, 1, 1,
0.6560731, 0.1672042, 0.02457763, 0.4470588, 0, 1, 1,
0.6564799, 0.004206842, 0.3994874, 0.4509804, 0, 1, 1,
0.6582659, 0.4739177, -0.3584257, 0.4588235, 0, 1, 1,
0.6590797, -0.6465518, 2.333119, 0.4627451, 0, 1, 1,
0.6621146, -0.5433583, 2.378175, 0.4705882, 0, 1, 1,
0.6658855, 0.7854779, 0.8912865, 0.4745098, 0, 1, 1,
0.6684354, -0.4018786, 0.6811648, 0.4823529, 0, 1, 1,
0.6716228, -1.648878, 1.800259, 0.4862745, 0, 1, 1,
0.6738684, 0.9694057, 1.035269, 0.4941176, 0, 1, 1,
0.6819056, -0.1913715, 2.233421, 0.5019608, 0, 1, 1,
0.6821742, 1.128745, -2.360217, 0.5058824, 0, 1, 1,
0.6826208, 0.4072716, 2.224098, 0.5137255, 0, 1, 1,
0.6835113, 0.5397491, 1.625268, 0.5176471, 0, 1, 1,
0.6835237, -0.06781388, 1.548594, 0.5254902, 0, 1, 1,
0.6883076, -0.5086945, 3.141883, 0.5294118, 0, 1, 1,
0.6925963, 0.1367108, 2.76044, 0.5372549, 0, 1, 1,
0.6928028, 0.4181827, 2.415069, 0.5411765, 0, 1, 1,
0.6960158, 0.07236817, 0.6152134, 0.5490196, 0, 1, 1,
0.7010002, -0.7343713, 3.973314, 0.5529412, 0, 1, 1,
0.7027544, 1.996748, 0.5540354, 0.5607843, 0, 1, 1,
0.7057922, 1.974576, -0.9154435, 0.5647059, 0, 1, 1,
0.7076417, -2.314185, 3.162774, 0.572549, 0, 1, 1,
0.711822, -0.8698438, 1.32459, 0.5764706, 0, 1, 1,
0.7183317, -1.117893, 1.940061, 0.5843138, 0, 1, 1,
0.7205763, -0.3919345, 0.5790865, 0.5882353, 0, 1, 1,
0.7209883, -2.378476, 2.332102, 0.5960785, 0, 1, 1,
0.7232624, 0.4019795, 0.9317722, 0.6039216, 0, 1, 1,
0.7245374, 0.07028871, -0.8254339, 0.6078432, 0, 1, 1,
0.7255432, 0.5031209, 0.3762252, 0.6156863, 0, 1, 1,
0.7283353, 0.01282416, 0.7024118, 0.6196079, 0, 1, 1,
0.7325632, 0.9722286, 0.9164277, 0.627451, 0, 1, 1,
0.7383416, 0.7865858, 1.995268, 0.6313726, 0, 1, 1,
0.7411438, -0.6284639, 0.7620962, 0.6392157, 0, 1, 1,
0.7436864, 1.013576, 0.9960862, 0.6431373, 0, 1, 1,
0.7475159, 0.1689761, 0.8159701, 0.6509804, 0, 1, 1,
0.749392, 1.261568, 0.4851594, 0.654902, 0, 1, 1,
0.751145, 0.6099934, -0.4420023, 0.6627451, 0, 1, 1,
0.7534673, 0.8361536, 3.070098, 0.6666667, 0, 1, 1,
0.7714348, 0.89136, 1.921148, 0.6745098, 0, 1, 1,
0.7769669, -0.5621557, 2.305465, 0.6784314, 0, 1, 1,
0.7891938, -0.4195097, 2.040924, 0.6862745, 0, 1, 1,
0.7912468, 1.3032, 0.4763094, 0.6901961, 0, 1, 1,
0.7913369, -0.5308487, 1.113559, 0.6980392, 0, 1, 1,
0.8012338, -0.5123196, 2.004899, 0.7058824, 0, 1, 1,
0.8013934, -1.702896, 3.854686, 0.7098039, 0, 1, 1,
0.8022986, -0.0253059, 3.121971, 0.7176471, 0, 1, 1,
0.8027056, 1.336277, 0.432622, 0.7215686, 0, 1, 1,
0.8027631, 0.8241442, -0.1384248, 0.7294118, 0, 1, 1,
0.8031114, -1.449123, 1.541442, 0.7333333, 0, 1, 1,
0.8083057, 1.736525, -0.4082491, 0.7411765, 0, 1, 1,
0.808356, -1.024403, 2.710544, 0.7450981, 0, 1, 1,
0.8103007, 0.7590885, 0.8999614, 0.7529412, 0, 1, 1,
0.8105332, -1.969648, 3.942047, 0.7568628, 0, 1, 1,
0.8146354, 0.0737186, 1.368354, 0.7647059, 0, 1, 1,
0.8185118, -0.582211, 2.387123, 0.7686275, 0, 1, 1,
0.8267094, 1.050141, 1.004369, 0.7764706, 0, 1, 1,
0.827828, -1.362945, 1.548699, 0.7803922, 0, 1, 1,
0.8393328, 0.6859231, -0.713847, 0.7882353, 0, 1, 1,
0.8420385, 0.2991118, 0.07649706, 0.7921569, 0, 1, 1,
0.8459684, 0.1746755, 2.421155, 0.8, 0, 1, 1,
0.8502236, 0.6101207, 0.03258384, 0.8078431, 0, 1, 1,
0.854731, 0.7971585, 2.868596, 0.8117647, 0, 1, 1,
0.8558946, -0.08647752, 3.583665, 0.8196079, 0, 1, 1,
0.8612219, 0.7749081, 1.66348, 0.8235294, 0, 1, 1,
0.8612612, 1.119787, 1.21643, 0.8313726, 0, 1, 1,
0.8659894, -0.3813882, 1.945747, 0.8352941, 0, 1, 1,
0.866174, 2.070972, 0.1802763, 0.8431373, 0, 1, 1,
0.868779, -0.9953511, 2.437174, 0.8470588, 0, 1, 1,
0.8688145, 0.840151, -0.4631501, 0.854902, 0, 1, 1,
0.8723773, 1.080669, 1.84633, 0.8588235, 0, 1, 1,
0.8733619, 1.325207, -0.4948664, 0.8666667, 0, 1, 1,
0.8744276, -0.1879406, 1.048144, 0.8705882, 0, 1, 1,
0.8748678, -1.277118, 1.620659, 0.8784314, 0, 1, 1,
0.8782902, 1.198615, 1.722081, 0.8823529, 0, 1, 1,
0.8791749, 0.997526, 0.2431992, 0.8901961, 0, 1, 1,
0.8791761, -0.4174926, 2.528929, 0.8941177, 0, 1, 1,
0.88095, 1.186468, 0.6992287, 0.9019608, 0, 1, 1,
0.8828302, 0.3673443, 1.582108, 0.9098039, 0, 1, 1,
0.8858941, 1.625798, 0.8740025, 0.9137255, 0, 1, 1,
0.8873582, -0.5884084, 4.153776, 0.9215686, 0, 1, 1,
0.8884096, 0.7930464, 0.8872642, 0.9254902, 0, 1, 1,
0.9113237, -0.3988061, 0.1079931, 0.9333333, 0, 1, 1,
0.9145023, -1.561624, 2.577065, 0.9372549, 0, 1, 1,
0.9156705, -0.5376407, 0.735817, 0.945098, 0, 1, 1,
0.9172058, -0.7762661, 1.93184, 0.9490196, 0, 1, 1,
0.9179167, 0.8988665, -0.09824584, 0.9568627, 0, 1, 1,
0.9220669, 1.201048, 2.206014, 0.9607843, 0, 1, 1,
0.9236537, -0.06720201, 0.3677865, 0.9686275, 0, 1, 1,
0.9274454, 0.4265614, 1.153775, 0.972549, 0, 1, 1,
0.9452562, 0.05762612, 2.90912, 0.9803922, 0, 1, 1,
0.9481139, 1.496678, -0.6285642, 0.9843137, 0, 1, 1,
0.9647212, 0.549224, 0.3291538, 0.9921569, 0, 1, 1,
0.9736326, 0.2609946, -1.042752, 0.9960784, 0, 1, 1,
0.9787993, 0.08072757, 3.224634, 1, 0, 0.9960784, 1,
0.9938406, 0.6818869, -0.3695419, 1, 0, 0.9882353, 1,
0.9975601, -0.2721038, 0.9126449, 1, 0, 0.9843137, 1,
1.002147, -0.6607069, 2.075853, 1, 0, 0.9764706, 1,
1.005439, 0.6170149, 0.006787377, 1, 0, 0.972549, 1,
1.010171, -0.6104377, 3.416713, 1, 0, 0.9647059, 1,
1.015062, 0.2492675, 1.602624, 1, 0, 0.9607843, 1,
1.027511, 2.744441, -0.5478957, 1, 0, 0.9529412, 1,
1.029217, 0.2974355, 0.0963951, 1, 0, 0.9490196, 1,
1.030774, 1.29364, -0.4051366, 1, 0, 0.9411765, 1,
1.038226, 0.2391676, 2.977417, 1, 0, 0.9372549, 1,
1.040852, -0.6282507, 2.696649, 1, 0, 0.9294118, 1,
1.042147, 1.124701, -0.1576178, 1, 0, 0.9254902, 1,
1.045607, -1.485626, 1.504054, 1, 0, 0.9176471, 1,
1.052901, 1.412284, -2.11951, 1, 0, 0.9137255, 1,
1.05301, -1.900046, 1.847306, 1, 0, 0.9058824, 1,
1.059927, 0.6392907, 1.509326, 1, 0, 0.9019608, 1,
1.068135, -1.401568, 1.454519, 1, 0, 0.8941177, 1,
1.078215, -0.5424668, 0.5536057, 1, 0, 0.8862745, 1,
1.083812, -0.7272173, 0.9239336, 1, 0, 0.8823529, 1,
1.08761, -0.1016048, 1.99751, 1, 0, 0.8745098, 1,
1.088762, 2.808271, 0.4997858, 1, 0, 0.8705882, 1,
1.103549, -0.3814266, 2.454847, 1, 0, 0.8627451, 1,
1.104209, 0.08634011, -0.7149411, 1, 0, 0.8588235, 1,
1.107153, 0.001151469, 0.6266103, 1, 0, 0.8509804, 1,
1.109668, 1.045722, 1.057514, 1, 0, 0.8470588, 1,
1.110841, 0.8429143, 0.5064034, 1, 0, 0.8392157, 1,
1.114675, 1.005609, 0.180718, 1, 0, 0.8352941, 1,
1.115651, -0.6519117, 2.068339, 1, 0, 0.827451, 1,
1.116085, -0.1950002, 2.205349, 1, 0, 0.8235294, 1,
1.132035, -1.526321, 1.389963, 1, 0, 0.8156863, 1,
1.134597, 0.442661, 1.482832, 1, 0, 0.8117647, 1,
1.136399, -0.625759, 3.581005, 1, 0, 0.8039216, 1,
1.138449, -1.466665, 1.898407, 1, 0, 0.7960784, 1,
1.139856, 0.44893, 1.226902, 1, 0, 0.7921569, 1,
1.149703, 0.4132245, 1.570758, 1, 0, 0.7843137, 1,
1.153378, -0.6743366, 1.946792, 1, 0, 0.7803922, 1,
1.170879, 0.5726641, 0.9208157, 1, 0, 0.772549, 1,
1.184409, -0.1429623, 1.544718, 1, 0, 0.7686275, 1,
1.185382, -0.56233, 2.083971, 1, 0, 0.7607843, 1,
1.187328, -0.4745462, 1.896641, 1, 0, 0.7568628, 1,
1.188413, -0.3152378, 0.2452483, 1, 0, 0.7490196, 1,
1.189693, -0.61453, 2.038169, 1, 0, 0.7450981, 1,
1.194341, 0.1646231, 1.460802, 1, 0, 0.7372549, 1,
1.202145, 1.106185, 1.524375, 1, 0, 0.7333333, 1,
1.209665, -1.132473, 2.038585, 1, 0, 0.7254902, 1,
1.21353, 0.7931776, 0.7420849, 1, 0, 0.7215686, 1,
1.218851, 1.21698, -0.008994476, 1, 0, 0.7137255, 1,
1.227811, 0.1964855, 1.20608, 1, 0, 0.7098039, 1,
1.241608, 0.443303, 1.737219, 1, 0, 0.7019608, 1,
1.246295, -0.08615056, 2.309831, 1, 0, 0.6941177, 1,
1.260192, 1.207575, 0.7137216, 1, 0, 0.6901961, 1,
1.260668, 0.7151783, 1.250642, 1, 0, 0.682353, 1,
1.264713, 0.6109341, 1.063558, 1, 0, 0.6784314, 1,
1.271543, 1.165676, 1.015223, 1, 0, 0.6705883, 1,
1.27251, 0.4093769, -0.2334764, 1, 0, 0.6666667, 1,
1.288388, 0.2566908, 0.05322055, 1, 0, 0.6588235, 1,
1.289927, 0.1505219, 1.633689, 1, 0, 0.654902, 1,
1.290168, -0.9880344, 1.394876, 1, 0, 0.6470588, 1,
1.29283, 0.5864484, 1.122481, 1, 0, 0.6431373, 1,
1.296576, 0.7062039, 0.9149194, 1, 0, 0.6352941, 1,
1.299636, -0.4869156, 2.118904, 1, 0, 0.6313726, 1,
1.300265, 0.6521015, 0.2995121, 1, 0, 0.6235294, 1,
1.300537, 0.8073432, -0.5257036, 1, 0, 0.6196079, 1,
1.304517, 1.549774, 0.2939565, 1, 0, 0.6117647, 1,
1.31266, -0.5174233, 3.393124, 1, 0, 0.6078432, 1,
1.315195, 1.183382, -0.3870889, 1, 0, 0.6, 1,
1.321337, -0.3883017, 4.549504, 1, 0, 0.5921569, 1,
1.336229, 2.606049, 0.8587844, 1, 0, 0.5882353, 1,
1.344038, -0.3943138, 1.900231, 1, 0, 0.5803922, 1,
1.345096, -1.113268, 3.739833, 1, 0, 0.5764706, 1,
1.358802, -0.6337074, 4.45222, 1, 0, 0.5686275, 1,
1.359676, -1.160416, 2.706876, 1, 0, 0.5647059, 1,
1.366491, -1.349393, 2.534586, 1, 0, 0.5568628, 1,
1.368167, 1.078049, 0.7868819, 1, 0, 0.5529412, 1,
1.370471, 0.3499226, 1.139793, 1, 0, 0.5450981, 1,
1.371847, -0.9763458, 1.809899, 1, 0, 0.5411765, 1,
1.37282, 0.7768818, 2.163519, 1, 0, 0.5333334, 1,
1.373405, 0.1558343, 1.80825, 1, 0, 0.5294118, 1,
1.375513, 0.5074144, 0.7874629, 1, 0, 0.5215687, 1,
1.389042, -0.7351118, 1.259092, 1, 0, 0.5176471, 1,
1.390196, 0.8505309, 0.6788788, 1, 0, 0.509804, 1,
1.393742, -0.794952, 4.579028, 1, 0, 0.5058824, 1,
1.421328, 0.2386614, 0.9536627, 1, 0, 0.4980392, 1,
1.422107, -2.106778, 2.87339, 1, 0, 0.4901961, 1,
1.424259, -0.6361232, 3.133367, 1, 0, 0.4862745, 1,
1.445621, -0.4919331, 0.5273491, 1, 0, 0.4784314, 1,
1.450695, 0.9967275, 0.008501041, 1, 0, 0.4745098, 1,
1.452731, -0.2143281, 1.100442, 1, 0, 0.4666667, 1,
1.453252, 0.5004066, 0.06785308, 1, 0, 0.4627451, 1,
1.454153, -1.358618, 3.270393, 1, 0, 0.454902, 1,
1.454625, 0.1167909, -1.194328, 1, 0, 0.4509804, 1,
1.455873, 0.387617, 1.537812, 1, 0, 0.4431373, 1,
1.471205, 0.7119985, -0.4491262, 1, 0, 0.4392157, 1,
1.475812, 1.642244, 0.608474, 1, 0, 0.4313726, 1,
1.477688, 1.447532, -1.679299, 1, 0, 0.427451, 1,
1.501094, -1.118763, 2.299178, 1, 0, 0.4196078, 1,
1.503538, -1.15638, 3.197415, 1, 0, 0.4156863, 1,
1.50499, 0.4934596, 0.7056964, 1, 0, 0.4078431, 1,
1.506559, -1.713511, 0.3006049, 1, 0, 0.4039216, 1,
1.522582, -3.03546, 3.76893, 1, 0, 0.3960784, 1,
1.524313, 1.380241, -0.02951944, 1, 0, 0.3882353, 1,
1.53203, -0.7794632, 2.734236, 1, 0, 0.3843137, 1,
1.534454, -1.939402, 3.38693, 1, 0, 0.3764706, 1,
1.545952, -1.072421, 1.175657, 1, 0, 0.372549, 1,
1.564946, 1.753863, 0.4555054, 1, 0, 0.3647059, 1,
1.573037, -0.1586327, 1.035728, 1, 0, 0.3607843, 1,
1.578029, 0.6357889, 0.9544219, 1, 0, 0.3529412, 1,
1.579967, -0.8769268, 3.606427, 1, 0, 0.3490196, 1,
1.582448, -1.880841, 2.529972, 1, 0, 0.3411765, 1,
1.58452, -0.04428254, 0.9503832, 1, 0, 0.3372549, 1,
1.596497, 1.033356, -0.1148379, 1, 0, 0.3294118, 1,
1.598332, -0.07834961, 1.563424, 1, 0, 0.3254902, 1,
1.605214, -0.7126213, 0.5730326, 1, 0, 0.3176471, 1,
1.615055, 1.142968, 0.7861011, 1, 0, 0.3137255, 1,
1.633757, -0.8412424, 2.013652, 1, 0, 0.3058824, 1,
1.636117, -1.539279, 3.584089, 1, 0, 0.2980392, 1,
1.641366, -1.036106, 0.2396322, 1, 0, 0.2941177, 1,
1.673796, 1.239341, 0.5048642, 1, 0, 0.2862745, 1,
1.680364, 1.23035, 3.924739, 1, 0, 0.282353, 1,
1.682515, 1.213928, 0.748509, 1, 0, 0.2745098, 1,
1.690027, -0.6056999, 1.37023, 1, 0, 0.2705882, 1,
1.711015, 0.9861563, 0.4411297, 1, 0, 0.2627451, 1,
1.727693, -0.3316413, 0.3881518, 1, 0, 0.2588235, 1,
1.744096, 0.7509652, 3.995385, 1, 0, 0.2509804, 1,
1.766651, 0.907992, 1.627265, 1, 0, 0.2470588, 1,
1.773187, -0.132682, 1.659783, 1, 0, 0.2392157, 1,
1.786433, 3.001293, 0.8377867, 1, 0, 0.2352941, 1,
1.801726, 0.7178321, 0.7210669, 1, 0, 0.227451, 1,
1.814417, -0.4771219, 1.430357, 1, 0, 0.2235294, 1,
1.826368, -0.2472983, 0.7339696, 1, 0, 0.2156863, 1,
1.84741, -0.5048422, 4.189307, 1, 0, 0.2117647, 1,
1.851166, -0.6607885, 3.094697, 1, 0, 0.2039216, 1,
1.867529, -0.8773279, 2.768374, 1, 0, 0.1960784, 1,
1.904908, 0.6515359, 1.504266, 1, 0, 0.1921569, 1,
1.919731, -2.237241, 1.70978, 1, 0, 0.1843137, 1,
1.920926, -0.9895072, 0.5048593, 1, 0, 0.1803922, 1,
1.937659, -0.1245308, 0.1638869, 1, 0, 0.172549, 1,
1.938848, -0.1729377, 1.592549, 1, 0, 0.1686275, 1,
1.951231, -0.6878271, 3.765687, 1, 0, 0.1607843, 1,
1.961514, -0.5915464, 1.472041, 1, 0, 0.1568628, 1,
1.964039, 0.08351201, 1.28914, 1, 0, 0.1490196, 1,
1.964962, -1.920655, 2.6083, 1, 0, 0.145098, 1,
1.97843, -0.380337, 2.759089, 1, 0, 0.1372549, 1,
1.985846, -0.2249408, 1.801221, 1, 0, 0.1333333, 1,
1.990378, 0.2179019, 2.179081, 1, 0, 0.1254902, 1,
2.022428, -0.5795582, 1.370811, 1, 0, 0.1215686, 1,
2.022865, -0.1877651, 1.442764, 1, 0, 0.1137255, 1,
2.026989, -0.05781151, 2.380004, 1, 0, 0.1098039, 1,
2.111059, -0.5095261, 2.344535, 1, 0, 0.1019608, 1,
2.145008, -0.4138421, 0.3312858, 1, 0, 0.09411765, 1,
2.174021, 0.241142, 0.1177567, 1, 0, 0.09019608, 1,
2.176337, -0.7746188, 1.532153, 1, 0, 0.08235294, 1,
2.212324, 0.05071876, 1.782025, 1, 0, 0.07843138, 1,
2.272129, -1.852103, 3.5755, 1, 0, 0.07058824, 1,
2.279016, -1.386383, 2.674736, 1, 0, 0.06666667, 1,
2.486021, -0.3050155, 4.211707, 1, 0, 0.05882353, 1,
2.48696, 0.305696, 1.77198, 1, 0, 0.05490196, 1,
2.517126, 0.1780154, 3.544694, 1, 0, 0.04705882, 1,
2.571223, 1.81903, 0.5180947, 1, 0, 0.04313726, 1,
2.571321, -1.450322, 2.125634, 1, 0, 0.03529412, 1,
2.625966, -1.255268, 2.477825, 1, 0, 0.03137255, 1,
2.770041, 0.4460485, 1.279546, 1, 0, 0.02352941, 1,
2.801238, -0.3885968, 3.071714, 1, 0, 0.01960784, 1,
2.820688, -1.566669, 0.6877239, 1, 0, 0.01176471, 1,
2.898425, 1.633162, 1.334097, 1, 0, 0.007843138, 1
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
-0.627411, -4.773489, -8.1877, 0, -0.5, 0.5, 0.5,
-0.627411, -4.773489, -8.1877, 1, -0.5, 0.5, 0.5,
-0.627411, -4.773489, -8.1877, 1, 1.5, 0.5, 0.5,
-0.627411, -4.773489, -8.1877, 0, 1.5, 0.5, 0.5
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
-5.348505, 0.08704996, -8.1877, 0, -0.5, 0.5, 0.5,
-5.348505, 0.08704996, -8.1877, 1, -0.5, 0.5, 0.5,
-5.348505, 0.08704996, -8.1877, 1, 1.5, 0.5, 0.5,
-5.348505, 0.08704996, -8.1877, 0, 1.5, 0.5, 0.5
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
-5.348505, -4.773489, -0.4778142, 0, -0.5, 0.5, 0.5,
-5.348505, -4.773489, -0.4778142, 1, -0.5, 0.5, 0.5,
-5.348505, -4.773489, -0.4778142, 1, 1.5, 0.5, 0.5,
-5.348505, -4.773489, -0.4778142, 0, 1.5, 0.5, 0.5
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
-4, -3.651827, -6.408495,
2, -3.651827, -6.408495,
-4, -3.651827, -6.408495,
-4, -3.83877, -6.705029,
-2, -3.651827, -6.408495,
-2, -3.83877, -6.705029,
0, -3.651827, -6.408495,
0, -3.83877, -6.705029,
2, -3.651827, -6.408495,
2, -3.83877, -6.705029
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
"-4",
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
-4, -4.212658, -7.298098, 0, -0.5, 0.5, 0.5,
-4, -4.212658, -7.298098, 1, -0.5, 0.5, 0.5,
-4, -4.212658, -7.298098, 1, 1.5, 0.5, 0.5,
-4, -4.212658, -7.298098, 0, 1.5, 0.5, 0.5,
-2, -4.212658, -7.298098, 0, -0.5, 0.5, 0.5,
-2, -4.212658, -7.298098, 1, -0.5, 0.5, 0.5,
-2, -4.212658, -7.298098, 1, 1.5, 0.5, 0.5,
-2, -4.212658, -7.298098, 0, 1.5, 0.5, 0.5,
0, -4.212658, -7.298098, 0, -0.5, 0.5, 0.5,
0, -4.212658, -7.298098, 1, -0.5, 0.5, 0.5,
0, -4.212658, -7.298098, 1, 1.5, 0.5, 0.5,
0, -4.212658, -7.298098, 0, 1.5, 0.5, 0.5,
2, -4.212658, -7.298098, 0, -0.5, 0.5, 0.5,
2, -4.212658, -7.298098, 1, -0.5, 0.5, 0.5,
2, -4.212658, -7.298098, 1, 1.5, 0.5, 0.5,
2, -4.212658, -7.298098, 0, 1.5, 0.5, 0.5
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
-4.259022, -2, -6.408495,
-4.259022, 2, -6.408495,
-4.259022, -2, -6.408495,
-4.440602, -2, -6.705029,
-4.259022, 0, -6.408495,
-4.440602, 0, -6.705029,
-4.259022, 2, -6.408495,
-4.440602, 2, -6.705029
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
-4.803763, -2, -7.298098, 0, -0.5, 0.5, 0.5,
-4.803763, -2, -7.298098, 1, -0.5, 0.5, 0.5,
-4.803763, -2, -7.298098, 1, 1.5, 0.5, 0.5,
-4.803763, -2, -7.298098, 0, 1.5, 0.5, 0.5,
-4.803763, 0, -7.298098, 0, -0.5, 0.5, 0.5,
-4.803763, 0, -7.298098, 1, -0.5, 0.5, 0.5,
-4.803763, 0, -7.298098, 1, 1.5, 0.5, 0.5,
-4.803763, 0, -7.298098, 0, 1.5, 0.5, 0.5,
-4.803763, 2, -7.298098, 0, -0.5, 0.5, 0.5,
-4.803763, 2, -7.298098, 1, -0.5, 0.5, 0.5,
-4.803763, 2, -7.298098, 1, 1.5, 0.5, 0.5,
-4.803763, 2, -7.298098, 0, 1.5, 0.5, 0.5
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
-4.259022, -3.651827, -6,
-4.259022, -3.651827, 4,
-4.259022, -3.651827, -6,
-4.440602, -3.83877, -6,
-4.259022, -3.651827, -4,
-4.440602, -3.83877, -4,
-4.259022, -3.651827, -2,
-4.440602, -3.83877, -2,
-4.259022, -3.651827, 0,
-4.440602, -3.83877, 0,
-4.259022, -3.651827, 2,
-4.440602, -3.83877, 2,
-4.259022, -3.651827, 4,
-4.440602, -3.83877, 4
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
-4.803763, -4.212658, -6, 0, -0.5, 0.5, 0.5,
-4.803763, -4.212658, -6, 1, -0.5, 0.5, 0.5,
-4.803763, -4.212658, -6, 1, 1.5, 0.5, 0.5,
-4.803763, -4.212658, -6, 0, 1.5, 0.5, 0.5,
-4.803763, -4.212658, -4, 0, -0.5, 0.5, 0.5,
-4.803763, -4.212658, -4, 1, -0.5, 0.5, 0.5,
-4.803763, -4.212658, -4, 1, 1.5, 0.5, 0.5,
-4.803763, -4.212658, -4, 0, 1.5, 0.5, 0.5,
-4.803763, -4.212658, -2, 0, -0.5, 0.5, 0.5,
-4.803763, -4.212658, -2, 1, -0.5, 0.5, 0.5,
-4.803763, -4.212658, -2, 1, 1.5, 0.5, 0.5,
-4.803763, -4.212658, -2, 0, 1.5, 0.5, 0.5,
-4.803763, -4.212658, 0, 0, -0.5, 0.5, 0.5,
-4.803763, -4.212658, 0, 1, -0.5, 0.5, 0.5,
-4.803763, -4.212658, 0, 1, 1.5, 0.5, 0.5,
-4.803763, -4.212658, 0, 0, 1.5, 0.5, 0.5,
-4.803763, -4.212658, 2, 0, -0.5, 0.5, 0.5,
-4.803763, -4.212658, 2, 1, -0.5, 0.5, 0.5,
-4.803763, -4.212658, 2, 1, 1.5, 0.5, 0.5,
-4.803763, -4.212658, 2, 0, 1.5, 0.5, 0.5,
-4.803763, -4.212658, 4, 0, -0.5, 0.5, 0.5,
-4.803763, -4.212658, 4, 1, -0.5, 0.5, 0.5,
-4.803763, -4.212658, 4, 1, 1.5, 0.5, 0.5,
-4.803763, -4.212658, 4, 0, 1.5, 0.5, 0.5
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
-4.259022, -3.651827, -6.408495,
-4.259022, 3.825927, -6.408495,
-4.259022, -3.651827, 5.452867,
-4.259022, 3.825927, 5.452867,
-4.259022, -3.651827, -6.408495,
-4.259022, -3.651827, 5.452867,
-4.259022, 3.825927, -6.408495,
-4.259022, 3.825927, 5.452867,
-4.259022, -3.651827, -6.408495,
3.0042, -3.651827, -6.408495,
-4.259022, -3.651827, 5.452867,
3.0042, -3.651827, 5.452867,
-4.259022, 3.825927, -6.408495,
3.0042, 3.825927, -6.408495,
-4.259022, 3.825927, 5.452867,
3.0042, 3.825927, 5.452867,
3.0042, -3.651827, -6.408495,
3.0042, 3.825927, -6.408495,
3.0042, -3.651827, 5.452867,
3.0042, 3.825927, 5.452867,
3.0042, -3.651827, -6.408495,
3.0042, -3.651827, 5.452867,
3.0042, 3.825927, -6.408495,
3.0042, 3.825927, 5.452867
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
var radius = 8.432213;
var distance = 37.51587;
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
mvMatrix.translate( 0.627411, -0.08704996, 0.4778142 );
mvMatrix.scale( 1.255238, 1.219226, 0.7686363 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.51587);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
propylaminocarbonylo<-read.table("propylaminocarbonylo.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-propylaminocarbonylo$V2
```

```
## Error in eval(expr, envir, enclos): object 'propylaminocarbonylo' not found
```

```r
y<-propylaminocarbonylo$V3
```

```
## Error in eval(expr, envir, enclos): object 'propylaminocarbonylo' not found
```

```r
z<-propylaminocarbonylo$V4
```

```
## Error in eval(expr, envir, enclos): object 'propylaminocarbonylo' not found
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
-4.153247, -0.9214524, -1.68387, 0, 0, 1, 1, 1,
-3.199064, 1.111084, -2.788672, 1, 0, 0, 1, 1,
-2.964779, -0.3045353, -1.044436, 1, 0, 0, 1, 1,
-2.851134, -0.9079437, -3.028239, 1, 0, 0, 1, 1,
-2.845042, -0.1776003, -3.63116, 1, 0, 0, 1, 1,
-2.801336, 0.6982214, -0.6050166, 1, 0, 0, 1, 1,
-2.669138, 0.06983203, -0.003143023, 0, 0, 0, 1, 1,
-2.597979, -0.4025783, -1.558809, 0, 0, 0, 1, 1,
-2.528147, -1.166387, 0.2208287, 0, 0, 0, 1, 1,
-2.509603, 0.004023547, -1.431095, 0, 0, 0, 1, 1,
-2.481141, 1.526677, -0.5799244, 0, 0, 0, 1, 1,
-2.44382, -1.577437, -0.4469123, 0, 0, 0, 1, 1,
-2.44226, -0.5020135, -3.636628, 0, 0, 0, 1, 1,
-2.289079, -0.5103081, -1.367456, 1, 1, 1, 1, 1,
-2.274801, 0.04435696, -1.95969, 1, 1, 1, 1, 1,
-2.263515, 0.3872397, -0.05267082, 1, 1, 1, 1, 1,
-2.259236, 0.3113658, -1.1918, 1, 1, 1, 1, 1,
-2.229319, 0.1884361, -1.123877, 1, 1, 1, 1, 1,
-2.217117, -0.1189088, -1.255511, 1, 1, 1, 1, 1,
-2.194877, -1.189246, -2.660609, 1, 1, 1, 1, 1,
-2.161148, 0.375385, -0.5198238, 1, 1, 1, 1, 1,
-2.157739, 1.197485, -0.4911793, 1, 1, 1, 1, 1,
-2.144518, -1.64889, -4.82603, 1, 1, 1, 1, 1,
-2.128702, 1.056211, -1.224856, 1, 1, 1, 1, 1,
-2.082641, 0.3627324, -1.661263, 1, 1, 1, 1, 1,
-2.07315, 1.031309, -0.6124238, 1, 1, 1, 1, 1,
-2.041259, -1.369741, -2.740498, 1, 1, 1, 1, 1,
-2.032254, 0.4646201, -3.159646, 1, 1, 1, 1, 1,
-2.030424, 1.876422, 0.07782173, 0, 0, 1, 1, 1,
-2.022014, 0.4591351, -0.8213657, 1, 0, 0, 1, 1,
-1.974988, -0.4539752, -3.765075, 1, 0, 0, 1, 1,
-1.974418, -0.1805468, -2.727949, 1, 0, 0, 1, 1,
-1.956505, 0.08192717, -1.788864, 1, 0, 0, 1, 1,
-1.930924, 0.2349709, -0.1452934, 1, 0, 0, 1, 1,
-1.925776, 0.4982645, -2.270858, 0, 0, 0, 1, 1,
-1.912737, 0.3426568, -2.141383, 0, 0, 0, 1, 1,
-1.911341, -0.6762149, -2.519994, 0, 0, 0, 1, 1,
-1.895482, -0.6020046, -3.004761, 0, 0, 0, 1, 1,
-1.833263, 1.783636, -2.542938, 0, 0, 0, 1, 1,
-1.82775, 0.6663852, -1.314607, 0, 0, 0, 1, 1,
-1.826001, -0.5045783, -3.141783, 0, 0, 0, 1, 1,
-1.817602, -1.323894, -2.743396, 1, 1, 1, 1, 1,
-1.804342, 0.3627913, -2.157356, 1, 1, 1, 1, 1,
-1.760937, -1.074474, -1.270039, 1, 1, 1, 1, 1,
-1.733316, -0.07377487, -0.8398764, 1, 1, 1, 1, 1,
-1.722221, -0.8250834, -2.745085, 1, 1, 1, 1, 1,
-1.705808, -0.8667729, -2.526092, 1, 1, 1, 1, 1,
-1.704664, -2.952052, -2.741138, 1, 1, 1, 1, 1,
-1.70071, -2.179972, -2.411721, 1, 1, 1, 1, 1,
-1.686639, -0.1844209, -2.291851, 1, 1, 1, 1, 1,
-1.670043, -0.109882, -1.603805, 1, 1, 1, 1, 1,
-1.666505, -1.321475, -1.06747, 1, 1, 1, 1, 1,
-1.634328, 1.139034, -0.9968992, 1, 1, 1, 1, 1,
-1.624187, 0.6124264, -1.485613, 1, 1, 1, 1, 1,
-1.620428, 0.9938694, -1.875466, 1, 1, 1, 1, 1,
-1.61293, 0.03888325, -1.924109, 1, 1, 1, 1, 1,
-1.593154, -0.03502366, -3.245415, 0, 0, 1, 1, 1,
-1.589956, 1.708292, 0.2821913, 1, 0, 0, 1, 1,
-1.589514, 2.501177, 0.5407338, 1, 0, 0, 1, 1,
-1.584353, 1.018041, -2.27026, 1, 0, 0, 1, 1,
-1.58346, 0.585657, -0.9028556, 1, 0, 0, 1, 1,
-1.548602, 1.196372, -1.630177, 1, 0, 0, 1, 1,
-1.541115, 0.1181437, -1.17487, 0, 0, 0, 1, 1,
-1.539358, -0.6322086, -1.055574, 0, 0, 0, 1, 1,
-1.52864, -0.8236829, -1.767527, 0, 0, 0, 1, 1,
-1.520416, 1.632924, -0.769703, 0, 0, 0, 1, 1,
-1.518716, 0.5873202, -2.724431, 0, 0, 0, 1, 1,
-1.512234, -1.982344, -3.537411, 0, 0, 0, 1, 1,
-1.509723, -1.632187, -2.614191, 0, 0, 0, 1, 1,
-1.501821, -1.508979, -1.926896, 1, 1, 1, 1, 1,
-1.488399, 0.3830455, -1.26199, 1, 1, 1, 1, 1,
-1.488011, 0.1184339, -1.427001, 1, 1, 1, 1, 1,
-1.46684, -1.07366, -0.377002, 1, 1, 1, 1, 1,
-1.464325, 0.5218859, -1.704195, 1, 1, 1, 1, 1,
-1.454286, -0.6769905, -0.6712911, 1, 1, 1, 1, 1,
-1.452148, 1.544228, -0.4591811, 1, 1, 1, 1, 1,
-1.432252, 0.2141776, -0.5995181, 1, 1, 1, 1, 1,
-1.427892, 0.8930433, -1.987657, 1, 1, 1, 1, 1,
-1.425366, -2.714823, -1.383588, 1, 1, 1, 1, 1,
-1.418491, 0.3601978, 0.357794, 1, 1, 1, 1, 1,
-1.411273, 1.442307, -1.652256, 1, 1, 1, 1, 1,
-1.408591, -1.104928, -1.775412, 1, 1, 1, 1, 1,
-1.407343, 0.5298008, -1.03718, 1, 1, 1, 1, 1,
-1.392562, -0.6676431, -1.831137, 1, 1, 1, 1, 1,
-1.389565, 0.7981181, -0.4953994, 0, 0, 1, 1, 1,
-1.385178, 0.5789549, -2.023926, 1, 0, 0, 1, 1,
-1.383509, 0.9129232, 0.7404253, 1, 0, 0, 1, 1,
-1.38258, 0.9765728, 0.6955155, 1, 0, 0, 1, 1,
-1.379476, 1.079566, -0.5257387, 1, 0, 0, 1, 1,
-1.378931, -0.9777624, -1.867915, 1, 0, 0, 1, 1,
-1.367663, 0.9885892, 1.633381, 0, 0, 0, 1, 1,
-1.366459, -0.9892217, -1.823839, 0, 0, 0, 1, 1,
-1.347754, -0.2967778, -2.688995, 0, 0, 0, 1, 1,
-1.33605, -1.158298, -2.120973, 0, 0, 0, 1, 1,
-1.335009, -0.2450145, -1.597808, 0, 0, 0, 1, 1,
-1.332882, 0.7758415, -0.8621221, 0, 0, 0, 1, 1,
-1.323799, 1.434794, -0.5520983, 0, 0, 0, 1, 1,
-1.318978, 0.3067166, -1.893448, 1, 1, 1, 1, 1,
-1.314307, 0.5540546, -1.389665, 1, 1, 1, 1, 1,
-1.313141, -1.410126, -1.398312, 1, 1, 1, 1, 1,
-1.31281, -0.6050722, -2.668372, 1, 1, 1, 1, 1,
-1.311984, -0.9284886, -0.5553561, 1, 1, 1, 1, 1,
-1.307108, 0.896192, -1.130591, 1, 1, 1, 1, 1,
-1.293052, -1.274388, -0.8156244, 1, 1, 1, 1, 1,
-1.291124, -0.05217895, -0.8535466, 1, 1, 1, 1, 1,
-1.282059, -0.2339002, -2.317989, 1, 1, 1, 1, 1,
-1.282043, -1.508733, -1.758015, 1, 1, 1, 1, 1,
-1.280773, 0.3911393, -0.5950167, 1, 1, 1, 1, 1,
-1.270194, 0.3740804, -0.8225232, 1, 1, 1, 1, 1,
-1.262653, 0.772509, -0.08733982, 1, 1, 1, 1, 1,
-1.258659, 1.346267, -1.800042, 1, 1, 1, 1, 1,
-1.255825, -0.5946875, -1.172393, 1, 1, 1, 1, 1,
-1.253934, -0.6171167, -2.02234, 0, 0, 1, 1, 1,
-1.253817, -0.3473589, -1.421758, 1, 0, 0, 1, 1,
-1.246179, 1.378152, -1.475062, 1, 0, 0, 1, 1,
-1.244306, -2.618468, -2.20185, 1, 0, 0, 1, 1,
-1.24369, -0.5250846, -4.292998, 1, 0, 0, 1, 1,
-1.236323, -0.8680557, -2.146216, 1, 0, 0, 1, 1,
-1.225274, -0.3339343, -1.25797, 0, 0, 0, 1, 1,
-1.215168, -0.9419371, -1.149232, 0, 0, 0, 1, 1,
-1.214946, -0.8141045, -2.470558, 0, 0, 0, 1, 1,
-1.211379, 1.413888, 0.06591867, 0, 0, 0, 1, 1,
-1.210978, -0.6006868, -3.1753, 0, 0, 0, 1, 1,
-1.20863, -0.1712758, -1.195772, 0, 0, 0, 1, 1,
-1.200424, -0.3633569, 0.7432814, 0, 0, 0, 1, 1,
-1.197458, 0.02268625, -1.626199, 1, 1, 1, 1, 1,
-1.189945, 2.35315, -0.07518986, 1, 1, 1, 1, 1,
-1.188398, -0.7368324, -2.11562, 1, 1, 1, 1, 1,
-1.179651, 1.869385, -1.167749, 1, 1, 1, 1, 1,
-1.1786, 0.3490303, -0.9876883, 1, 1, 1, 1, 1,
-1.174395, 0.8412671, -0.630955, 1, 1, 1, 1, 1,
-1.172982, -0.0467863, -1.854817, 1, 1, 1, 1, 1,
-1.171646, -1.070926, -2.634031, 1, 1, 1, 1, 1,
-1.166529, -0.02340689, -1.272923, 1, 1, 1, 1, 1,
-1.166232, 0.640259, -1.988492, 1, 1, 1, 1, 1,
-1.16565, 1.321085, 0.4938646, 1, 1, 1, 1, 1,
-1.158468, 0.9704514, 0.5094135, 1, 1, 1, 1, 1,
-1.155462, 0.5693048, -0.3943318, 1, 1, 1, 1, 1,
-1.148671, -0.6186649, -0.8068517, 1, 1, 1, 1, 1,
-1.140533, -1.221618, -1.912289, 1, 1, 1, 1, 1,
-1.138372, -1.78424, -3.262895, 0, 0, 1, 1, 1,
-1.130578, 0.5860189, -1.160649, 1, 0, 0, 1, 1,
-1.12916, -0.3434778, -2.605086, 1, 0, 0, 1, 1,
-1.127575, 0.3183304, 1.078662, 1, 0, 0, 1, 1,
-1.121384, 0.07093514, -3.177501, 1, 0, 0, 1, 1,
-1.120085, 0.372093, -1.050194, 1, 0, 0, 1, 1,
-1.113386, 0.3773487, -0.5593203, 0, 0, 0, 1, 1,
-1.101967, -1.814506, -1.264949, 0, 0, 0, 1, 1,
-1.09205, 1.559476, -0.9313277, 0, 0, 0, 1, 1,
-1.08388, -0.3975067, -3.714983, 0, 0, 0, 1, 1,
-1.075502, 0.285829, -2.475471, 0, 0, 0, 1, 1,
-1.068118, 0.8513599, 0.02120635, 0, 0, 0, 1, 1,
-1.048828, -0.4240055, -1.673158, 0, 0, 0, 1, 1,
-1.046356, -0.138287, -0.7378522, 1, 1, 1, 1, 1,
-1.044002, 1.098078, -1.521736, 1, 1, 1, 1, 1,
-1.043869, -1.545487, -2.17699, 1, 1, 1, 1, 1,
-1.037982, 0.5648743, -1.555636, 1, 1, 1, 1, 1,
-1.029635, 0.3639511, -1.680357, 1, 1, 1, 1, 1,
-1.018532, -0.5323266, -3.028476, 1, 1, 1, 1, 1,
-1.013932, 0.09086618, -0.6015988, 1, 1, 1, 1, 1,
-1.006219, 1.851453, 1.035797, 1, 1, 1, 1, 1,
-1.005305, -1.010446, -1.296336, 1, 1, 1, 1, 1,
-1.003833, -0.09441318, -1.825052, 1, 1, 1, 1, 1,
-0.9959771, 0.970397, -0.01312275, 1, 1, 1, 1, 1,
-0.9915642, 0.03843546, -2.994778, 1, 1, 1, 1, 1,
-0.9903064, 0.8567389, 0.1144152, 1, 1, 1, 1, 1,
-0.989772, 1.022838, -1.008594, 1, 1, 1, 1, 1,
-0.9866976, 0.1553571, -1.462956, 1, 1, 1, 1, 1,
-0.9783671, -0.4313298, -2.225076, 0, 0, 1, 1, 1,
-0.9746986, -1.246555, -1.883324, 1, 0, 0, 1, 1,
-0.9712291, 1.136206, -1.043723, 1, 0, 0, 1, 1,
-0.9707179, 0.4984707, -1.505436, 1, 0, 0, 1, 1,
-0.9703305, -0.1594026, -1.283269, 1, 0, 0, 1, 1,
-0.9636248, -0.2092725, -1.587261, 1, 0, 0, 1, 1,
-0.9600255, 0.0004679897, -2.383007, 0, 0, 0, 1, 1,
-0.9598363, -0.1913113, -1.485608, 0, 0, 0, 1, 1,
-0.9587625, -0.642597, -2.888361, 0, 0, 0, 1, 1,
-0.9576718, 0.8015478, -1.51335, 0, 0, 0, 1, 1,
-0.956972, 1.982795, -1.077315, 0, 0, 0, 1, 1,
-0.9537051, 0.004211233, -1.280202, 0, 0, 0, 1, 1,
-0.9481308, 0.05966549, -1.272627, 0, 0, 0, 1, 1,
-0.9380292, 0.3785691, -2.436054, 1, 1, 1, 1, 1,
-0.9357601, 1.775131, -2.093167, 1, 1, 1, 1, 1,
-0.9267507, -0.2736838, -0.7039787, 1, 1, 1, 1, 1,
-0.9251322, -1.198182, -0.7841592, 1, 1, 1, 1, 1,
-0.9238215, -0.5015998, -2.77833, 1, 1, 1, 1, 1,
-0.9182621, -1.660669, -2.028495, 1, 1, 1, 1, 1,
-0.9161859, 0.7901936, 0.4929233, 1, 1, 1, 1, 1,
-0.9087555, -0.7880127, -3.23277, 1, 1, 1, 1, 1,
-0.9004273, -0.5098976, -3.186395, 1, 1, 1, 1, 1,
-0.8999454, -0.04183604, -1.764119, 1, 1, 1, 1, 1,
-0.8963487, -3.542927, -2.652698, 1, 1, 1, 1, 1,
-0.8958735, 0.1172982, -0.1968538, 1, 1, 1, 1, 1,
-0.894917, 0.4420131, -1.33727, 1, 1, 1, 1, 1,
-0.8784724, -0.9936562, -0.9972097, 1, 1, 1, 1, 1,
-0.8780678, -0.03643463, -2.537034, 1, 1, 1, 1, 1,
-0.876695, 1.731878, -1.572601, 0, 0, 1, 1, 1,
-0.8743854, 0.1659228, -1.769396, 1, 0, 0, 1, 1,
-0.8742275, 0.3400537, -1.458151, 1, 0, 0, 1, 1,
-0.871928, -1.384144, -1.79008, 1, 0, 0, 1, 1,
-0.8686771, 0.8828477, -0.9091453, 1, 0, 0, 1, 1,
-0.8653942, 0.118828, -0.6869748, 1, 0, 0, 1, 1,
-0.8653514, -0.7033381, -2.001703, 0, 0, 0, 1, 1,
-0.8615528, -0.637453, -0.6183456, 0, 0, 0, 1, 1,
-0.861374, -2.180013, -3.171508, 0, 0, 0, 1, 1,
-0.8600931, -0.3537126, -1.050193, 0, 0, 0, 1, 1,
-0.8547252, 0.5760491, 0.2892691, 0, 0, 0, 1, 1,
-0.8543894, 0.5117612, -3.67266, 0, 0, 0, 1, 1,
-0.8522455, -0.3365401, -3.297793, 0, 0, 0, 1, 1,
-0.8414556, -0.0130181, -0.7177732, 1, 1, 1, 1, 1,
-0.8381658, 0.1540982, 0.4698968, 1, 1, 1, 1, 1,
-0.8363732, 0.2419415, -1.44034, 1, 1, 1, 1, 1,
-0.8302757, 1.523456, -1.881117, 1, 1, 1, 1, 1,
-0.8289567, -0.6488612, -2.251221, 1, 1, 1, 1, 1,
-0.8250709, -0.647701, -1.450404, 1, 1, 1, 1, 1,
-0.8248914, -0.870836, -3.762381, 1, 1, 1, 1, 1,
-0.8211449, -0.6393701, -2.492209, 1, 1, 1, 1, 1,
-0.8153313, 0.02886959, -0.8696656, 1, 1, 1, 1, 1,
-0.8132693, -1.782813, -2.720059, 1, 1, 1, 1, 1,
-0.8121637, 0.8618486, -2.026666, 1, 1, 1, 1, 1,
-0.8118011, 1.199121, 1.736627, 1, 1, 1, 1, 1,
-0.8104709, -0.02353125, -1.933202, 1, 1, 1, 1, 1,
-0.8014928, -0.3641183, -2.294241, 1, 1, 1, 1, 1,
-0.8005772, 1.309479, -1.318785, 1, 1, 1, 1, 1,
-0.7948071, -0.2207565, -1.573337, 0, 0, 1, 1, 1,
-0.7896945, -1.065809, -2.623756, 1, 0, 0, 1, 1,
-0.7893659, -0.7990602, -2.408154, 1, 0, 0, 1, 1,
-0.7870401, -0.6077074, -3.381225, 1, 0, 0, 1, 1,
-0.7809624, 0.7436289, 0.7031925, 1, 0, 0, 1, 1,
-0.7794486, -1.045671, -2.882206, 1, 0, 0, 1, 1,
-0.7773656, 1.430318, -1.160105, 0, 0, 0, 1, 1,
-0.7751631, 0.9249288, -1.18226, 0, 0, 0, 1, 1,
-0.7683015, 0.1138872, -1.121632, 0, 0, 0, 1, 1,
-0.7667904, 0.2639292, -2.05371, 0, 0, 0, 1, 1,
-0.7662096, -1.05914, -2.501002, 0, 0, 0, 1, 1,
-0.7656637, 0.01302447, -2.644137, 0, 0, 0, 1, 1,
-0.7602855, 1.286474, 1.225163, 0, 0, 0, 1, 1,
-0.7571763, -1.212703, -2.855299, 1, 1, 1, 1, 1,
-0.7557418, -1.304073, -2.528777, 1, 1, 1, 1, 1,
-0.7516817, 0.2776012, 0.9587193, 1, 1, 1, 1, 1,
-0.7464694, -0.4344746, -1.009552, 1, 1, 1, 1, 1,
-0.7455456, -0.2244123, 0.7513799, 1, 1, 1, 1, 1,
-0.744382, -0.05587777, -2.255208, 1, 1, 1, 1, 1,
-0.74242, -1.93633, -1.579934, 1, 1, 1, 1, 1,
-0.7370844, -0.03052037, -2.155514, 1, 1, 1, 1, 1,
-0.7347255, 0.9556825, -1.936376, 1, 1, 1, 1, 1,
-0.7339162, -0.22432, -0.9656332, 1, 1, 1, 1, 1,
-0.7331464, -0.4558782, -3.03173, 1, 1, 1, 1, 1,
-0.7292587, -1.013446, -2.18652, 1, 1, 1, 1, 1,
-0.7254403, -0.2919023, -1.23841, 1, 1, 1, 1, 1,
-0.7234095, 0.3019664, -1.469242, 1, 1, 1, 1, 1,
-0.7171274, 1.142857, -0.8079755, 1, 1, 1, 1, 1,
-0.7129189, 0.6711383, 0.5751971, 0, 0, 1, 1, 1,
-0.712294, 0.7704622, -0.1701927, 1, 0, 0, 1, 1,
-0.7083023, 0.5622059, -0.7842289, 1, 0, 0, 1, 1,
-0.7042034, 2.02562, 0.2062947, 1, 0, 0, 1, 1,
-0.7002072, -0.794134, -3.578892, 1, 0, 0, 1, 1,
-0.6991068, 1.080195, 1.322545, 1, 0, 0, 1, 1,
-0.6975168, 0.3115016, -1.202171, 0, 0, 0, 1, 1,
-0.695712, -0.7725964, -0.9483144, 0, 0, 0, 1, 1,
-0.6937286, 0.4627217, -1.907164, 0, 0, 0, 1, 1,
-0.6934541, -0.5031272, -1.770034, 0, 0, 0, 1, 1,
-0.692839, 0.6381785, -0.01416842, 0, 0, 0, 1, 1,
-0.6762242, -1.269571, -2.064945, 0, 0, 0, 1, 1,
-0.6747608, 0.77364, -1.525719, 0, 0, 0, 1, 1,
-0.6724105, 0.869196, 2.132962, 1, 1, 1, 1, 1,
-0.6718824, 1.03443, 0.2157948, 1, 1, 1, 1, 1,
-0.6664456, 0.2846289, -1.072968, 1, 1, 1, 1, 1,
-0.6608099, 0.5955741, 0.1004295, 1, 1, 1, 1, 1,
-0.6558341, -1.037446, -2.69499, 1, 1, 1, 1, 1,
-0.6417212, 0.3635852, -0.6847383, 1, 1, 1, 1, 1,
-0.6407479, -0.3409797, -2.377082, 1, 1, 1, 1, 1,
-0.6368166, 3.241525, 0.9549119, 1, 1, 1, 1, 1,
-0.6335148, 0.2636967, -3.074427, 1, 1, 1, 1, 1,
-0.6283703, 1.349644, 0.4459487, 1, 1, 1, 1, 1,
-0.6237148, -0.3710206, -2.141197, 1, 1, 1, 1, 1,
-0.6222573, 0.3011908, -0.06199782, 1, 1, 1, 1, 1,
-0.6156315, -0.4526551, -2.803341, 1, 1, 1, 1, 1,
-0.6133979, -0.1525806, -0.5078546, 1, 1, 1, 1, 1,
-0.6055036, -0.5003735, -2.453662, 1, 1, 1, 1, 1,
-0.6040035, 0.1101821, -1.004754, 0, 0, 1, 1, 1,
-0.6034917, 0.07638573, -0.791666, 1, 0, 0, 1, 1,
-0.6009237, -1.492505, -2.585515, 1, 0, 0, 1, 1,
-0.600571, -0.1202555, -0.8754915, 1, 0, 0, 1, 1,
-0.5988405, 1.6112, 0.4468919, 1, 0, 0, 1, 1,
-0.5911901, 1.080615, 0.3529869, 1, 0, 0, 1, 1,
-0.5803574, 1.380283, -0.534131, 0, 0, 0, 1, 1,
-0.5801153, 0.6604034, -0.7676829, 0, 0, 0, 1, 1,
-0.5796084, -0.8372589, -1.408458, 0, 0, 0, 1, 1,
-0.5749459, 1.002416, 1.210565, 0, 0, 0, 1, 1,
-0.5708508, -0.8172978, -2.911705, 0, 0, 0, 1, 1,
-0.5703224, -0.5188885, -3.013917, 0, 0, 0, 1, 1,
-0.5675358, 1.080003, -2.605088, 0, 0, 0, 1, 1,
-0.5669701, 0.08558586, -2.023994, 1, 1, 1, 1, 1,
-0.565537, -0.7872013, -1.073918, 1, 1, 1, 1, 1,
-0.5557903, 1.496352, 0.1681477, 1, 1, 1, 1, 1,
-0.5557083, -0.7236255, -4.192248, 1, 1, 1, 1, 1,
-0.5532858, 0.8594022, -1.59306, 1, 1, 1, 1, 1,
-0.5506204, 0.02014611, -1.893378, 1, 1, 1, 1, 1,
-0.5456734, -0.1131505, -2.544281, 1, 1, 1, 1, 1,
-0.5449902, -0.7983127, -2.219877, 1, 1, 1, 1, 1,
-0.5434729, -0.5171137, -2.569029, 1, 1, 1, 1, 1,
-0.5399332, -1.037545, 0.1431248, 1, 1, 1, 1, 1,
-0.5395153, 0.04412501, -2.602697, 1, 1, 1, 1, 1,
-0.5389656, 0.6112452, 0.8250017, 1, 1, 1, 1, 1,
-0.5375587, -0.5807456, -2.876024, 1, 1, 1, 1, 1,
-0.535738, -0.3918553, -3.306321, 1, 1, 1, 1, 1,
-0.5336933, -1.279821, -3.672818, 1, 1, 1, 1, 1,
-0.5311893, -0.5795771, -1.574943, 0, 0, 1, 1, 1,
-0.5310612, 0.9160997, -2.546372, 1, 0, 0, 1, 1,
-0.5274314, 0.7065741, -0.1270651, 1, 0, 0, 1, 1,
-0.5253, 0.7856268, -2.42527, 1, 0, 0, 1, 1,
-0.5203712, -0.4946118, -2.584194, 1, 0, 0, 1, 1,
-0.5163636, 1.073861, -0.7677029, 1, 0, 0, 1, 1,
-0.5154633, -0.02726831, -3.620969, 0, 0, 0, 1, 1,
-0.5146058, 1.041119, -0.170658, 0, 0, 0, 1, 1,
-0.5130194, -2.104337, -2.567102, 0, 0, 0, 1, 1,
-0.5126127, 2.109531, -0.07411234, 0, 0, 0, 1, 1,
-0.5109078, 1.260231, -0.8104339, 0, 0, 0, 1, 1,
-0.5054584, -0.6153837, -1.544656, 0, 0, 0, 1, 1,
-0.4984061, -0.7811182, -1.173329, 0, 0, 0, 1, 1,
-0.493383, 1.699526, 0.4678394, 1, 1, 1, 1, 1,
-0.4907402, 0.5482295, -1.743296, 1, 1, 1, 1, 1,
-0.4892974, 1.83702, 0.1789852, 1, 1, 1, 1, 1,
-0.483947, 0.4118756, -2.304831, 1, 1, 1, 1, 1,
-0.4819196, 0.5814161, -1.092962, 1, 1, 1, 1, 1,
-0.4805441, 0.1155795, -1.31234, 1, 1, 1, 1, 1,
-0.4791012, -0.1742653, -1.161924, 1, 1, 1, 1, 1,
-0.4787368, 1.701352, -1.100675, 1, 1, 1, 1, 1,
-0.4774508, 1.009031, 0.5325967, 1, 1, 1, 1, 1,
-0.474776, -0.4438918, -3.130505, 1, 1, 1, 1, 1,
-0.4705936, 0.3735322, -0.8348794, 1, 1, 1, 1, 1,
-0.4679089, 0.001779189, 0.374217, 1, 1, 1, 1, 1,
-0.4656324, 0.593649, -3.158644, 1, 1, 1, 1, 1,
-0.4620697, 0.9810608, -0.3648587, 1, 1, 1, 1, 1,
-0.461717, -0.1641721, -0.9176598, 1, 1, 1, 1, 1,
-0.4582364, -0.2668108, -2.769361, 0, 0, 1, 1, 1,
-0.4568975, 0.694582, -1.707042, 1, 0, 0, 1, 1,
-0.4547501, -0.436368, -3.758974, 1, 0, 0, 1, 1,
-0.4534444, 1.46878, -1.725035, 1, 0, 0, 1, 1,
-0.4521381, 0.6872111, -0.5325543, 1, 0, 0, 1, 1,
-0.4496169, 1.53567, -0.9610175, 1, 0, 0, 1, 1,
-0.4452269, -0.5813502, -2.89247, 0, 0, 0, 1, 1,
-0.4436333, 0.2262412, -0.6640007, 0, 0, 0, 1, 1,
-0.4419511, -0.7530535, -1.737404, 0, 0, 0, 1, 1,
-0.4413637, -1.016563, -3.190226, 0, 0, 0, 1, 1,
-0.4353225, -0.0005931056, -2.249663, 0, 0, 0, 1, 1,
-0.4340347, 0.2040591, -1.048552, 0, 0, 0, 1, 1,
-0.4337936, -0.1074824, -0.6442808, 0, 0, 0, 1, 1,
-0.4329262, -0.2239456, -0.2645937, 1, 1, 1, 1, 1,
-0.4324335, 0.737714, -1.40798, 1, 1, 1, 1, 1,
-0.4316084, -0.9573807, -3.212404, 1, 1, 1, 1, 1,
-0.4285851, -0.7650527, -4.372092, 1, 1, 1, 1, 1,
-0.4220311, -0.9669222, -3.779703, 1, 1, 1, 1, 1,
-0.415091, -0.322649, -3.976624, 1, 1, 1, 1, 1,
-0.4148901, 0.6771156, -0.6527964, 1, 1, 1, 1, 1,
-0.4139425, 0.3761646, -1.526583, 1, 1, 1, 1, 1,
-0.4136894, -0.2245282, -0.3980578, 1, 1, 1, 1, 1,
-0.4135671, -0.02937665, -1.185242, 1, 1, 1, 1, 1,
-0.4061217, 0.05835001, -0.9937128, 1, 1, 1, 1, 1,
-0.4037252, -1.532454, -4.684705, 1, 1, 1, 1, 1,
-0.4034543, 1.141271, -0.8750871, 1, 1, 1, 1, 1,
-0.3996147, -0.9774208, -4.499987, 1, 1, 1, 1, 1,
-0.3978859, 1.399165, -1.080123, 1, 1, 1, 1, 1,
-0.392452, 1.188293, 0.6944117, 0, 0, 1, 1, 1,
-0.3838441, 1.107932, 1.356845, 1, 0, 0, 1, 1,
-0.3824599, 1.188384, -0.1526139, 1, 0, 0, 1, 1,
-0.3790695, 1.079301, -2.373849, 1, 0, 0, 1, 1,
-0.3780344, 1.243774, 0.1331314, 1, 0, 0, 1, 1,
-0.3755815, -0.1953899, -0.9826489, 1, 0, 0, 1, 1,
-0.373605, -0.2295352, -1.95901, 0, 0, 0, 1, 1,
-0.373349, 1.510057, -0.1487551, 0, 0, 0, 1, 1,
-0.370208, -0.04096541, -1.705968, 0, 0, 0, 1, 1,
-0.3688918, 1.008647, -0.2964451, 0, 0, 0, 1, 1,
-0.3669194, 1.238341, -1.618888, 0, 0, 0, 1, 1,
-0.3539364, 1.195265, 1.443802, 0, 0, 0, 1, 1,
-0.35276, 0.5350349, -1.428119, 0, 0, 0, 1, 1,
-0.348265, 0.9905202, 0.8204998, 1, 1, 1, 1, 1,
-0.3475349, 0.933666, -1.229055, 1, 1, 1, 1, 1,
-0.3448023, 0.3158956, -0.7331701, 1, 1, 1, 1, 1,
-0.3428563, 1.090347, -1.179858, 1, 1, 1, 1, 1,
-0.339938, -1.502332, -4.480453, 1, 1, 1, 1, 1,
-0.339405, -0.1320312, -2.772238, 1, 1, 1, 1, 1,
-0.3385266, 1.593862, -0.206212, 1, 1, 1, 1, 1,
-0.3376439, 0.4774309, -1.938814, 1, 1, 1, 1, 1,
-0.3318933, 1.203581, 0.3256143, 1, 1, 1, 1, 1,
-0.327922, -2.018883, -2.987836, 1, 1, 1, 1, 1,
-0.3270172, -0.5485645, -5.431283, 1, 1, 1, 1, 1,
-0.3269893, 0.5502555, 0.5986829, 1, 1, 1, 1, 1,
-0.3268378, 1.622094, 0.4413124, 1, 1, 1, 1, 1,
-0.3262204, -0.4472147, -5.021124, 1, 1, 1, 1, 1,
-0.3241725, -0.6835495, -2.959313, 1, 1, 1, 1, 1,
-0.321532, 0.02741292, -0.6991857, 0, 0, 1, 1, 1,
-0.3213584, -0.2718511, -1.274293, 1, 0, 0, 1, 1,
-0.3182414, -0.3553534, -1.962273, 1, 0, 0, 1, 1,
-0.3157003, 0.9219949, 0.07785576, 1, 0, 0, 1, 1,
-0.3147679, 0.1983343, -0.5349545, 1, 0, 0, 1, 1,
-0.3109805, 0.5458442, -1.765502, 1, 0, 0, 1, 1,
-0.3084308, -0.2327516, -1.987692, 0, 0, 0, 1, 1,
-0.3076283, -1.470024, -2.476508, 0, 0, 0, 1, 1,
-0.3018954, 0.2104586, -1.441775, 0, 0, 0, 1, 1,
-0.2984742, -0.7734939, -1.50579, 0, 0, 0, 1, 1,
-0.2977764, 1.774175, -0.02716184, 0, 0, 0, 1, 1,
-0.297737, -0.941522, -3.792765, 0, 0, 0, 1, 1,
-0.2972311, 0.2943864, -1.656772, 0, 0, 0, 1, 1,
-0.2939168, -0.1110482, -1.636873, 1, 1, 1, 1, 1,
-0.2908291, -1.615726, -2.791045, 1, 1, 1, 1, 1,
-0.287822, 0.2832703, 0.1006887, 1, 1, 1, 1, 1,
-0.2854682, 0.8090027, -0.2657166, 1, 1, 1, 1, 1,
-0.2826085, -0.38392, -2.068789, 1, 1, 1, 1, 1,
-0.2821255, -0.5844514, -2.726502, 1, 1, 1, 1, 1,
-0.2819457, -1.64517, -3.281804, 1, 1, 1, 1, 1,
-0.279515, 1.055805, -0.4816307, 1, 1, 1, 1, 1,
-0.2732456, -2.326332, -3.636058, 1, 1, 1, 1, 1,
-0.2708845, -0.921277, -2.796741, 1, 1, 1, 1, 1,
-0.2706187, 0.81293, 1.078601, 1, 1, 1, 1, 1,
-0.2697383, -1.241858, -2.15995, 1, 1, 1, 1, 1,
-0.2640713, -0.987203, -2.357821, 1, 1, 1, 1, 1,
-0.2589889, 0.8869603, -1.26336, 1, 1, 1, 1, 1,
-0.2568146, 1.038404, 0.122024, 1, 1, 1, 1, 1,
-0.2531533, -1.247473, -5.35059, 0, 0, 1, 1, 1,
-0.2460838, 1.677794, -1.201355, 1, 0, 0, 1, 1,
-0.2409158, 0.7190225, 0.04925079, 1, 0, 0, 1, 1,
-0.2384569, -0.5011527, -1.594243, 1, 0, 0, 1, 1,
-0.2358847, -1.975278, -6.235757, 1, 0, 0, 1, 1,
-0.231412, -0.8821216, -2.328708, 1, 0, 0, 1, 1,
-0.2265366, -0.5943695, -0.8901301, 0, 0, 0, 1, 1,
-0.2251703, 0.05997565, -2.362383, 0, 0, 0, 1, 1,
-0.2238414, -0.52245, -3.119687, 0, 0, 0, 1, 1,
-0.2212813, -0.2215109, -2.612125, 0, 0, 0, 1, 1,
-0.2206205, -0.9881467, -3.213758, 0, 0, 0, 1, 1,
-0.2179418, -0.1989519, -2.486547, 0, 0, 0, 1, 1,
-0.2160564, -0.2344321, -2.371804, 0, 0, 0, 1, 1,
-0.2131705, 0.5769169, 0.5528687, 1, 1, 1, 1, 1,
-0.2117465, -0.5850145, -3.113804, 1, 1, 1, 1, 1,
-0.2054543, -0.5226612, -1.010051, 1, 1, 1, 1, 1,
-0.2043934, 0.200563, -1.450323, 1, 1, 1, 1, 1,
-0.2030057, -1.045573, -2.800814, 1, 1, 1, 1, 1,
-0.1993454, -1.583658, -2.236066, 1, 1, 1, 1, 1,
-0.1965231, -0.4860376, -1.931551, 1, 1, 1, 1, 1,
-0.194778, -0.04240211, -3.0789, 1, 1, 1, 1, 1,
-0.1872286, -0.4179718, -1.820693, 1, 1, 1, 1, 1,
-0.1849634, 0.2287834, -1.514917, 1, 1, 1, 1, 1,
-0.1830027, 0.05930671, -2.838048, 1, 1, 1, 1, 1,
-0.1805937, 0.4793043, -1.182472, 1, 1, 1, 1, 1,
-0.1774444, -0.002809016, -2.679141, 1, 1, 1, 1, 1,
-0.1772363, -0.430021, -1.595377, 1, 1, 1, 1, 1,
-0.1719757, 0.6533865, -0.1741942, 1, 1, 1, 1, 1,
-0.1655476, -0.9299849, -4.262632, 0, 0, 1, 1, 1,
-0.1626871, -0.08342339, -2.607311, 1, 0, 0, 1, 1,
-0.1624356, -0.7999278, -3.176892, 1, 0, 0, 1, 1,
-0.1615755, -0.03298289, -1.047902, 1, 0, 0, 1, 1,
-0.1606829, -0.1419095, -2.595262, 1, 0, 0, 1, 1,
-0.1549682, 3.717027, -1.91596, 1, 0, 0, 1, 1,
-0.1539342, -0.9645523, -5.091791, 0, 0, 0, 1, 1,
-0.1498566, -1.848241, -2.848949, 0, 0, 0, 1, 1,
-0.1479957, -0.2433296, -1.516028, 0, 0, 0, 1, 1,
-0.1479176, -0.7864285, -3.528443, 0, 0, 0, 1, 1,
-0.1459544, -0.8183574, -2.892084, 0, 0, 0, 1, 1,
-0.142199, -0.5486682, -3.659504, 0, 0, 0, 1, 1,
-0.1410072, -1.070134, -2.285972, 0, 0, 0, 1, 1,
-0.1399676, 0.3096125, -0.8894558, 1, 1, 1, 1, 1,
-0.136094, 1.905801, -0.401707, 1, 1, 1, 1, 1,
-0.1347884, -2.433285, -1.068258, 1, 1, 1, 1, 1,
-0.1238154, 0.2133901, 0.3896824, 1, 1, 1, 1, 1,
-0.1223643, -1.345237, -3.111571, 1, 1, 1, 1, 1,
-0.1191544, -1.361001, -4.780234, 1, 1, 1, 1, 1,
-0.11457, 0.7960293, -1.427905, 1, 1, 1, 1, 1,
-0.1117817, -0.8784563, -1.623955, 1, 1, 1, 1, 1,
-0.111103, 0.1675096, -2.065367, 1, 1, 1, 1, 1,
-0.1103276, -1.596325, -5.830657, 1, 1, 1, 1, 1,
-0.1099838, -0.2029198, -1.493362, 1, 1, 1, 1, 1,
-0.1068176, 1.649693, 0.09755711, 1, 1, 1, 1, 1,
-0.1053127, 0.2578326, 0.6429248, 1, 1, 1, 1, 1,
-0.1035988, -1.571013, -1.80651, 1, 1, 1, 1, 1,
-0.1002195, -1.664368, -2.320481, 1, 1, 1, 1, 1,
-0.09765968, -0.5887204, -4.278346, 0, 0, 1, 1, 1,
-0.0907886, 2.506929, -0.9397277, 1, 0, 0, 1, 1,
-0.08262815, -0.2240382, -2.030811, 1, 0, 0, 1, 1,
-0.08143576, -0.5295978, -3.167811, 1, 0, 0, 1, 1,
-0.08098354, -0.07108092, -4.098552, 1, 0, 0, 1, 1,
-0.07845449, -1.215325, -2.803997, 1, 0, 0, 1, 1,
-0.07534857, 0.2147597, 1.2834, 0, 0, 0, 1, 1,
-0.07216592, 1.501933, -0.7385337, 0, 0, 0, 1, 1,
-0.07048692, 0.3243774, 1.048371, 0, 0, 0, 1, 1,
-0.07008097, -0.8268136, -3.299659, 0, 0, 0, 1, 1,
-0.06503702, -0.04036894, -2.771737, 0, 0, 0, 1, 1,
-0.06294642, -0.1392501, -3.393291, 0, 0, 0, 1, 1,
-0.0629265, -0.1407842, -4.376595, 0, 0, 0, 1, 1,
-0.06207412, -0.6864664, -3.396856, 1, 1, 1, 1, 1,
-0.06124212, -1.222184, -3.495795, 1, 1, 1, 1, 1,
-0.05679971, -0.1699393, -3.406705, 1, 1, 1, 1, 1,
-0.05453881, -0.5160844, -3.911273, 1, 1, 1, 1, 1,
-0.05384642, -1.650276, -2.939881, 1, 1, 1, 1, 1,
-0.05068807, -0.06425152, -2.739945, 1, 1, 1, 1, 1,
-0.03502229, -0.8311698, -3.569257, 1, 1, 1, 1, 1,
-0.03447651, -1.906304, -3.005387, 1, 1, 1, 1, 1,
-0.02946185, 1.320586, 1.375849, 1, 1, 1, 1, 1,
-0.02295735, 0.5488358, 2.139721, 1, 1, 1, 1, 1,
-0.02264011, 0.3435663, 0.008889662, 1, 1, 1, 1, 1,
-0.02106384, 0.5528904, 1.4337, 1, 1, 1, 1, 1,
-0.01727959, 1.436787, 0.5751449, 1, 1, 1, 1, 1,
-0.01617222, -1.176583, -3.109098, 1, 1, 1, 1, 1,
-0.01466481, -0.753167, -3.441024, 1, 1, 1, 1, 1,
-0.01320838, -0.9965974, -2.650615, 0, 0, 1, 1, 1,
-0.0119259, 1.134357, -0.5814952, 1, 0, 0, 1, 1,
-0.0097805, -1.494516, -0.7351436, 1, 0, 0, 1, 1,
-0.009155871, 1.132215, 0.8369493, 1, 0, 0, 1, 1,
-0.001047977, -1.04274, -3.770424, 1, 0, 0, 1, 1,
-0.0007349612, 0.3499284, -1.282738, 1, 0, 0, 1, 1,
0.0002983037, 0.5685107, 0.3960787, 0, 0, 0, 1, 1,
0.001059831, -0.9535932, 2.707191, 0, 0, 0, 1, 1,
0.001693506, -1.802329, 3.521846, 0, 0, 0, 1, 1,
0.01000733, -0.1598925, 3.832904, 0, 0, 0, 1, 1,
0.01035674, -0.5569809, 1.796209, 0, 0, 0, 1, 1,
0.01525502, 0.9752302, 1.784648, 0, 0, 0, 1, 1,
0.02446127, -0.6936024, 1.993975, 0, 0, 0, 1, 1,
0.03163664, 0.5937655, 0.07908133, 1, 1, 1, 1, 1,
0.0366881, 0.9725643, -0.6662081, 1, 1, 1, 1, 1,
0.03998153, 0.4681123, 1.454467, 1, 1, 1, 1, 1,
0.0414074, 0.4184423, 0.5186517, 1, 1, 1, 1, 1,
0.04168153, 0.04662502, 0.7968407, 1, 1, 1, 1, 1,
0.04251288, 0.5819173, -1.989122, 1, 1, 1, 1, 1,
0.04323539, 0.5698965, 0.04227961, 1, 1, 1, 1, 1,
0.04387408, -0.2355642, 3.636434, 1, 1, 1, 1, 1,
0.044211, 0.7420673, -0.1375679, 1, 1, 1, 1, 1,
0.04579956, 0.6660627, 0.1891978, 1, 1, 1, 1, 1,
0.04626873, -1.148527, 4.638638, 1, 1, 1, 1, 1,
0.04669667, -0.5836577, 3.133785, 1, 1, 1, 1, 1,
0.04782617, -0.6290315, 2.777131, 1, 1, 1, 1, 1,
0.04899763, -0.8375303, 3.763651, 1, 1, 1, 1, 1,
0.04904387, 0.5234302, 0.06526207, 1, 1, 1, 1, 1,
0.05984272, -0.2251705, 3.346241, 0, 0, 1, 1, 1,
0.06160318, 0.9381813, -0.2356538, 1, 0, 0, 1, 1,
0.06216646, -0.4047309, 2.674967, 1, 0, 0, 1, 1,
0.06283763, -0.245695, 4.511431, 1, 0, 0, 1, 1,
0.06344636, 1.030597, -2.146114, 1, 0, 0, 1, 1,
0.06911867, 0.1028873, -0.1829447, 1, 0, 0, 1, 1,
0.06941964, 0.5963933, 0.9037132, 0, 0, 0, 1, 1,
0.06981036, -2.343065, 3.647483, 0, 0, 0, 1, 1,
0.07517607, 1.636219, -0.4616406, 0, 0, 0, 1, 1,
0.07589021, -0.6440994, 3.235069, 0, 0, 0, 1, 1,
0.07821926, 0.1165695, 0.5141237, 0, 0, 0, 1, 1,
0.07983613, -0.08321585, -0.3423422, 0, 0, 0, 1, 1,
0.08087944, -0.3954603, 4.062322, 0, 0, 0, 1, 1,
0.0812465, 1.041877, 0.0988187, 1, 1, 1, 1, 1,
0.08900291, 0.4907593, 1.686515, 1, 1, 1, 1, 1,
0.09072679, 1.400744, 0.5241905, 1, 1, 1, 1, 1,
0.09243295, -1.06829, 3.977781, 1, 1, 1, 1, 1,
0.1048598, -0.7618945, 2.535213, 1, 1, 1, 1, 1,
0.1073342, 1.987723, 1.034698, 1, 1, 1, 1, 1,
0.1086585, -2.212893, 5.025876, 1, 1, 1, 1, 1,
0.1143987, -0.2919365, 2.262629, 1, 1, 1, 1, 1,
0.1153234, 1.118568, -0.5464389, 1, 1, 1, 1, 1,
0.1167418, -1.224723, 3.14752, 1, 1, 1, 1, 1,
0.1194322, 1.432758, -0.6047219, 1, 1, 1, 1, 1,
0.1197028, -0.6955957, 3.027865, 1, 1, 1, 1, 1,
0.1234557, -0.1698085, 2.208717, 1, 1, 1, 1, 1,
0.1261846, 1.357646, 1.353651, 1, 1, 1, 1, 1,
0.1276809, -2.889042, 4.467597, 1, 1, 1, 1, 1,
0.1277566, 2.118406, 2.067259, 0, 0, 1, 1, 1,
0.1284044, 2.057462, -1.389791, 1, 0, 0, 1, 1,
0.129414, -0.2602402, 2.954166, 1, 0, 0, 1, 1,
0.1301146, 0.09613813, 0.6918562, 1, 0, 0, 1, 1,
0.1346906, -2.471829, 2.239808, 1, 0, 0, 1, 1,
0.1351759, 0.4058651, 0.6379077, 1, 0, 0, 1, 1,
0.1373429, 0.2480404, 1.785621, 0, 0, 0, 1, 1,
0.1395122, 0.7881056, 1.542321, 0, 0, 0, 1, 1,
0.1428825, -1.192542, 1.696507, 0, 0, 0, 1, 1,
0.1433851, 0.5352634, 1.884085, 0, 0, 0, 1, 1,
0.1480575, -0.8334301, 0.8471156, 0, 0, 0, 1, 1,
0.151606, 0.1009822, 0.4654957, 0, 0, 0, 1, 1,
0.1581156, 0.8966047, 1.29465, 0, 0, 0, 1, 1,
0.1583949, -1.122881, 3.764173, 1, 1, 1, 1, 1,
0.1646715, -0.4085577, 2.615623, 1, 1, 1, 1, 1,
0.1712322, 1.159761, -0.1385796, 1, 1, 1, 1, 1,
0.1777927, 0.6135832, -2.915284, 1, 1, 1, 1, 1,
0.1814614, -0.4605737, 2.580593, 1, 1, 1, 1, 1,
0.1841144, -0.376609, 2.477025, 1, 1, 1, 1, 1,
0.1859801, 0.2437722, 1.084138, 1, 1, 1, 1, 1,
0.1893313, -1.975818, 3.006114, 1, 1, 1, 1, 1,
0.1909951, -0.5641865, 5.280129, 1, 1, 1, 1, 1,
0.1910132, 1.676138, 0.4837359, 1, 1, 1, 1, 1,
0.192105, -2.00904, 2.686296, 1, 1, 1, 1, 1,
0.1936471, -1.011168, 2.51809, 1, 1, 1, 1, 1,
0.1997956, -1.69881, 3.779437, 1, 1, 1, 1, 1,
0.2011657, 1.094236, -1.074172, 1, 1, 1, 1, 1,
0.2012806, 1.283258, -1.280851, 1, 1, 1, 1, 1,
0.2050446, 0.3210706, 2.419207, 0, 0, 1, 1, 1,
0.2071882, -0.5001124, 1.688923, 1, 0, 0, 1, 1,
0.2074462, 0.6184294, -0.2613333, 1, 0, 0, 1, 1,
0.2105351, -1.758338, 2.800386, 1, 0, 0, 1, 1,
0.2111281, -0.08208276, 1.124418, 1, 0, 0, 1, 1,
0.2147754, -0.03026201, 1.016229, 1, 0, 0, 1, 1,
0.2204344, -0.504773, 3.104617, 0, 0, 0, 1, 1,
0.2244925, 0.8283041, -0.2552231, 0, 0, 0, 1, 1,
0.2277754, 2.000276, -0.8561618, 0, 0, 0, 1, 1,
0.2296058, -1.338882, 2.060147, 0, 0, 0, 1, 1,
0.2328866, -0.6288422, 2.722, 0, 0, 0, 1, 1,
0.2366874, 0.8506114, 0.5028236, 0, 0, 0, 1, 1,
0.2371197, -0.4005508, 1.708903, 0, 0, 0, 1, 1,
0.2374402, -0.8086222, 3.722609, 1, 1, 1, 1, 1,
0.237554, -0.9267431, 3.05111, 1, 1, 1, 1, 1,
0.2415805, 0.9195453, -0.4640911, 1, 1, 1, 1, 1,
0.2438918, -2.09696, 2.664643, 1, 1, 1, 1, 1,
0.2489168, -0.611681, 2.979537, 1, 1, 1, 1, 1,
0.2502659, -0.3186998, 2.717246, 1, 1, 1, 1, 1,
0.2529551, 0.03700684, 1.956932, 1, 1, 1, 1, 1,
0.2536902, -1.437227, 3.200047, 1, 1, 1, 1, 1,
0.2586285, -0.797668, 3.967281, 1, 1, 1, 1, 1,
0.262558, 1.681826, 1.01561, 1, 1, 1, 1, 1,
0.2639775, 0.07305457, 1.82469, 1, 1, 1, 1, 1,
0.2697797, -0.3035435, 2.801977, 1, 1, 1, 1, 1,
0.2721896, 0.9725367, 1.34969, 1, 1, 1, 1, 1,
0.2744847, -0.05659616, 2.266722, 1, 1, 1, 1, 1,
0.2770348, -0.7730981, 4.1333, 1, 1, 1, 1, 1,
0.2772391, -0.05907654, 3.575018, 0, 0, 1, 1, 1,
0.2823064, -0.2936105, 3.168474, 1, 0, 0, 1, 1,
0.2823762, 1.131631, 1.776051, 1, 0, 0, 1, 1,
0.2888146, 0.6343513, -0.05972825, 1, 0, 0, 1, 1,
0.2903534, 1.850475, -0.2474855, 1, 0, 0, 1, 1,
0.291033, 0.6034501, -0.245675, 1, 0, 0, 1, 1,
0.2916998, 0.8722742, 1.201992, 0, 0, 0, 1, 1,
0.2935045, 0.8686175, 1.004019, 0, 0, 0, 1, 1,
0.2935058, -0.3426197, 2.862564, 0, 0, 0, 1, 1,
0.3002137, 0.9917208, -0.9130858, 0, 0, 0, 1, 1,
0.302537, 0.8010306, -0.9013718, 0, 0, 0, 1, 1,
0.3048286, 1.610093, 1.495015, 0, 0, 0, 1, 1,
0.3094034, 0.8988767, 0.9397701, 0, 0, 0, 1, 1,
0.310681, -0.8934018, 1.641863, 1, 1, 1, 1, 1,
0.3142176, 1.076485, -0.3141215, 1, 1, 1, 1, 1,
0.3378769, 0.0423878, 1.02476, 1, 1, 1, 1, 1,
0.3432986, 0.2484554, 0.787144, 1, 1, 1, 1, 1,
0.346385, -0.1479609, 1.713026, 1, 1, 1, 1, 1,
0.3478984, 0.3083982, 0.6037333, 1, 1, 1, 1, 1,
0.3526637, -0.8678942, 2.569468, 1, 1, 1, 1, 1,
0.3536205, -0.132243, 2.478731, 1, 1, 1, 1, 1,
0.3580246, 0.06861892, -0.106278, 1, 1, 1, 1, 1,
0.3592708, 0.2263927, -0.07933422, 1, 1, 1, 1, 1,
0.3633626, 0.9004165, 1.202427, 1, 1, 1, 1, 1,
0.364338, -0.416815, 3.110835, 1, 1, 1, 1, 1,
0.3674561, -0.002665056, 1.995407, 1, 1, 1, 1, 1,
0.3676766, -0.9981264, 1.641408, 1, 1, 1, 1, 1,
0.3716156, 0.01890729, 1.738256, 1, 1, 1, 1, 1,
0.3737876, -1.525653, 2.747303, 0, 0, 1, 1, 1,
0.3772549, -0.2962544, 3.458568, 1, 0, 0, 1, 1,
0.3774884, -0.539308, 1.941586, 1, 0, 0, 1, 1,
0.3837887, -2.653503, 0.18168, 1, 0, 0, 1, 1,
0.3852022, -0.6498505, 2.61871, 1, 0, 0, 1, 1,
0.3883833, 0.7340773, 1.757251, 1, 0, 0, 1, 1,
0.3886202, -0.6920146, 2.202912, 0, 0, 0, 1, 1,
0.3893575, -0.7336415, 1.58531, 0, 0, 0, 1, 1,
0.3916399, 1.097371, -0.493562, 0, 0, 0, 1, 1,
0.3941294, 0.805097, 0.3494187, 0, 0, 0, 1, 1,
0.3961662, -0.3227358, 2.638639, 0, 0, 0, 1, 1,
0.3971821, -1.147098, 1.736559, 0, 0, 0, 1, 1,
0.403077, -0.6252583, 3.453978, 0, 0, 0, 1, 1,
0.4033274, -0.1891001, 1.277735, 1, 1, 1, 1, 1,
0.4050266, 1.181188, -0.2319372, 1, 1, 1, 1, 1,
0.4102987, -0.7187705, 4.296657, 1, 1, 1, 1, 1,
0.420633, 0.932409, 1.88869, 1, 1, 1, 1, 1,
0.421822, -0.3749639, 1.286722, 1, 1, 1, 1, 1,
0.4234037, -0.3830873, 3.047872, 1, 1, 1, 1, 1,
0.4253384, 0.3071981, 1.734977, 1, 1, 1, 1, 1,
0.4312267, -0.006059636, 2.4196, 1, 1, 1, 1, 1,
0.4323686, 1.44571, 0.9115484, 1, 1, 1, 1, 1,
0.4378031, 0.9768056, 0.3403268, 1, 1, 1, 1, 1,
0.4423642, 2.41098, -0.1664637, 1, 1, 1, 1, 1,
0.4492075, -0.7370806, 3.528563, 1, 1, 1, 1, 1,
0.4492872, 0.377845, 1.405587, 1, 1, 1, 1, 1,
0.4573657, -0.4272888, 3.863526, 1, 1, 1, 1, 1,
0.4599479, -0.219507, 1.204048, 1, 1, 1, 1, 1,
0.4600878, -0.1758188, 0.8407632, 0, 0, 1, 1, 1,
0.461228, 0.1191848, 1.314876, 1, 0, 0, 1, 1,
0.4618698, -1.060464, 2.772377, 1, 0, 0, 1, 1,
0.4658445, 0.4611688, 2.0392, 1, 0, 0, 1, 1,
0.4676121, 1.68243, 0.139047, 1, 0, 0, 1, 1,
0.4676171, 0.7239476, -0.009293088, 1, 0, 0, 1, 1,
0.4711708, -0.2766364, 1.804492, 0, 0, 0, 1, 1,
0.4747278, 0.9597527, 0.8181226, 0, 0, 0, 1, 1,
0.4754387, 1.51579, 1.710688, 0, 0, 0, 1, 1,
0.4786188, 1.361529, -0.02338381, 0, 0, 0, 1, 1,
0.4843524, 1.685706, -0.3569226, 0, 0, 0, 1, 1,
0.484676, -1.082024, 2.971192, 0, 0, 0, 1, 1,
0.492219, -0.5961542, 2.26158, 0, 0, 0, 1, 1,
0.4931399, -0.6951229, 3.243487, 1, 1, 1, 1, 1,
0.4933595, 0.09696385, 1.734735, 1, 1, 1, 1, 1,
0.4972052, -1.143735, 3.720178, 1, 1, 1, 1, 1,
0.4976015, -0.7399876, 2.040511, 1, 1, 1, 1, 1,
0.505994, -1.414825, 4.413518, 1, 1, 1, 1, 1,
0.5093411, 0.1382682, 1.142945, 1, 1, 1, 1, 1,
0.5126214, -0.4637911, 2.836276, 1, 1, 1, 1, 1,
0.5167141, -1.613028, 2.115818, 1, 1, 1, 1, 1,
0.5198883, -0.536853, 2.05159, 1, 1, 1, 1, 1,
0.5226371, -0.9840444, 2.083914, 1, 1, 1, 1, 1,
0.524509, -0.8198212, 3.221187, 1, 1, 1, 1, 1,
0.5251112, -0.8906735, 0.595275, 1, 1, 1, 1, 1,
0.525798, -0.3984286, 1.262151, 1, 1, 1, 1, 1,
0.5270642, 0.1001323, 2.042993, 1, 1, 1, 1, 1,
0.5279092, -0.7837988, 2.549657, 1, 1, 1, 1, 1,
0.5300263, -0.7384808, 1.847709, 0, 0, 1, 1, 1,
0.5303069, -0.09780389, 1.41618, 1, 0, 0, 1, 1,
0.5428608, -1.935364, 3.329297, 1, 0, 0, 1, 1,
0.5475587, -1.07199, 1.455706, 1, 0, 0, 1, 1,
0.5485043, 0.1182464, 2.285007, 1, 0, 0, 1, 1,
0.5530877, -1.089887, 2.182786, 1, 0, 0, 1, 1,
0.5531653, -0.2121589, 0.684736, 0, 0, 0, 1, 1,
0.5541303, -0.4208938, 2.062553, 0, 0, 0, 1, 1,
0.5542411, -0.6755975, 3.896051, 0, 0, 0, 1, 1,
0.5571759, -0.4284697, 0.8683749, 0, 0, 0, 1, 1,
0.5576317, 1.329722, 1.24178, 0, 0, 0, 1, 1,
0.5598936, -0.3242708, 2.361056, 0, 0, 0, 1, 1,
0.5641196, -1.12476, 2.5692, 0, 0, 0, 1, 1,
0.5646785, -1.544581, 2.052572, 1, 1, 1, 1, 1,
0.5797564, 0.04688678, 2.869459, 1, 1, 1, 1, 1,
0.5803567, -0.3782131, 2.658514, 1, 1, 1, 1, 1,
0.5823377, 0.1379542, -0.4969728, 1, 1, 1, 1, 1,
0.5838869, 1.012381, 0.6100187, 1, 1, 1, 1, 1,
0.5918507, 0.5113666, -0.5546712, 1, 1, 1, 1, 1,
0.5940154, 0.2596333, 1.618952, 1, 1, 1, 1, 1,
0.5940956, -1.069637, 2.118327, 1, 1, 1, 1, 1,
0.6038496, 0.4505769, 2.664749, 1, 1, 1, 1, 1,
0.6040072, 1.522844, 2.26198, 1, 1, 1, 1, 1,
0.6065521, -1.010102, 2.617866, 1, 1, 1, 1, 1,
0.6078635, -1.363671, 4.802577, 1, 1, 1, 1, 1,
0.6086788, 0.1756087, 0.9881377, 1, 1, 1, 1, 1,
0.6185735, -0.5990229, 3.834755, 1, 1, 1, 1, 1,
0.6211994, 1.085281, 2.531654, 1, 1, 1, 1, 1,
0.6214126, 0.9049459, -1.446682, 0, 0, 1, 1, 1,
0.6217374, -1.078114, 2.114375, 1, 0, 0, 1, 1,
0.6231483, -0.2547134, 1.672545, 1, 0, 0, 1, 1,
0.6235311, 0.0887043, 0.1242082, 1, 0, 0, 1, 1,
0.6283603, -0.2017236, -0.2217899, 1, 0, 0, 1, 1,
0.6292181, -1.271596, 2.44706, 1, 0, 0, 1, 1,
0.633338, 0.6173469, 0.4833933, 0, 0, 0, 1, 1,
0.6362569, -0.2594011, 2.582014, 0, 0, 0, 1, 1,
0.6463104, 1.289466, -0.1832369, 0, 0, 0, 1, 1,
0.6481237, -1.551985, 3.182887, 0, 0, 0, 1, 1,
0.6509807, 1.979532, 0.9974948, 0, 0, 0, 1, 1,
0.651817, -0.2308773, 3.63066, 0, 0, 0, 1, 1,
0.6536353, 1.91588, 0.07662901, 0, 0, 0, 1, 1,
0.6560731, 0.1672042, 0.02457763, 1, 1, 1, 1, 1,
0.6564799, 0.004206842, 0.3994874, 1, 1, 1, 1, 1,
0.6582659, 0.4739177, -0.3584257, 1, 1, 1, 1, 1,
0.6590797, -0.6465518, 2.333119, 1, 1, 1, 1, 1,
0.6621146, -0.5433583, 2.378175, 1, 1, 1, 1, 1,
0.6658855, 0.7854779, 0.8912865, 1, 1, 1, 1, 1,
0.6684354, -0.4018786, 0.6811648, 1, 1, 1, 1, 1,
0.6716228, -1.648878, 1.800259, 1, 1, 1, 1, 1,
0.6738684, 0.9694057, 1.035269, 1, 1, 1, 1, 1,
0.6819056, -0.1913715, 2.233421, 1, 1, 1, 1, 1,
0.6821742, 1.128745, -2.360217, 1, 1, 1, 1, 1,
0.6826208, 0.4072716, 2.224098, 1, 1, 1, 1, 1,
0.6835113, 0.5397491, 1.625268, 1, 1, 1, 1, 1,
0.6835237, -0.06781388, 1.548594, 1, 1, 1, 1, 1,
0.6883076, -0.5086945, 3.141883, 1, 1, 1, 1, 1,
0.6925963, 0.1367108, 2.76044, 0, 0, 1, 1, 1,
0.6928028, 0.4181827, 2.415069, 1, 0, 0, 1, 1,
0.6960158, 0.07236817, 0.6152134, 1, 0, 0, 1, 1,
0.7010002, -0.7343713, 3.973314, 1, 0, 0, 1, 1,
0.7027544, 1.996748, 0.5540354, 1, 0, 0, 1, 1,
0.7057922, 1.974576, -0.9154435, 1, 0, 0, 1, 1,
0.7076417, -2.314185, 3.162774, 0, 0, 0, 1, 1,
0.711822, -0.8698438, 1.32459, 0, 0, 0, 1, 1,
0.7183317, -1.117893, 1.940061, 0, 0, 0, 1, 1,
0.7205763, -0.3919345, 0.5790865, 0, 0, 0, 1, 1,
0.7209883, -2.378476, 2.332102, 0, 0, 0, 1, 1,
0.7232624, 0.4019795, 0.9317722, 0, 0, 0, 1, 1,
0.7245374, 0.07028871, -0.8254339, 0, 0, 0, 1, 1,
0.7255432, 0.5031209, 0.3762252, 1, 1, 1, 1, 1,
0.7283353, 0.01282416, 0.7024118, 1, 1, 1, 1, 1,
0.7325632, 0.9722286, 0.9164277, 1, 1, 1, 1, 1,
0.7383416, 0.7865858, 1.995268, 1, 1, 1, 1, 1,
0.7411438, -0.6284639, 0.7620962, 1, 1, 1, 1, 1,
0.7436864, 1.013576, 0.9960862, 1, 1, 1, 1, 1,
0.7475159, 0.1689761, 0.8159701, 1, 1, 1, 1, 1,
0.749392, 1.261568, 0.4851594, 1, 1, 1, 1, 1,
0.751145, 0.6099934, -0.4420023, 1, 1, 1, 1, 1,
0.7534673, 0.8361536, 3.070098, 1, 1, 1, 1, 1,
0.7714348, 0.89136, 1.921148, 1, 1, 1, 1, 1,
0.7769669, -0.5621557, 2.305465, 1, 1, 1, 1, 1,
0.7891938, -0.4195097, 2.040924, 1, 1, 1, 1, 1,
0.7912468, 1.3032, 0.4763094, 1, 1, 1, 1, 1,
0.7913369, -0.5308487, 1.113559, 1, 1, 1, 1, 1,
0.8012338, -0.5123196, 2.004899, 0, 0, 1, 1, 1,
0.8013934, -1.702896, 3.854686, 1, 0, 0, 1, 1,
0.8022986, -0.0253059, 3.121971, 1, 0, 0, 1, 1,
0.8027056, 1.336277, 0.432622, 1, 0, 0, 1, 1,
0.8027631, 0.8241442, -0.1384248, 1, 0, 0, 1, 1,
0.8031114, -1.449123, 1.541442, 1, 0, 0, 1, 1,
0.8083057, 1.736525, -0.4082491, 0, 0, 0, 1, 1,
0.808356, -1.024403, 2.710544, 0, 0, 0, 1, 1,
0.8103007, 0.7590885, 0.8999614, 0, 0, 0, 1, 1,
0.8105332, -1.969648, 3.942047, 0, 0, 0, 1, 1,
0.8146354, 0.0737186, 1.368354, 0, 0, 0, 1, 1,
0.8185118, -0.582211, 2.387123, 0, 0, 0, 1, 1,
0.8267094, 1.050141, 1.004369, 0, 0, 0, 1, 1,
0.827828, -1.362945, 1.548699, 1, 1, 1, 1, 1,
0.8393328, 0.6859231, -0.713847, 1, 1, 1, 1, 1,
0.8420385, 0.2991118, 0.07649706, 1, 1, 1, 1, 1,
0.8459684, 0.1746755, 2.421155, 1, 1, 1, 1, 1,
0.8502236, 0.6101207, 0.03258384, 1, 1, 1, 1, 1,
0.854731, 0.7971585, 2.868596, 1, 1, 1, 1, 1,
0.8558946, -0.08647752, 3.583665, 1, 1, 1, 1, 1,
0.8612219, 0.7749081, 1.66348, 1, 1, 1, 1, 1,
0.8612612, 1.119787, 1.21643, 1, 1, 1, 1, 1,
0.8659894, -0.3813882, 1.945747, 1, 1, 1, 1, 1,
0.866174, 2.070972, 0.1802763, 1, 1, 1, 1, 1,
0.868779, -0.9953511, 2.437174, 1, 1, 1, 1, 1,
0.8688145, 0.840151, -0.4631501, 1, 1, 1, 1, 1,
0.8723773, 1.080669, 1.84633, 1, 1, 1, 1, 1,
0.8733619, 1.325207, -0.4948664, 1, 1, 1, 1, 1,
0.8744276, -0.1879406, 1.048144, 0, 0, 1, 1, 1,
0.8748678, -1.277118, 1.620659, 1, 0, 0, 1, 1,
0.8782902, 1.198615, 1.722081, 1, 0, 0, 1, 1,
0.8791749, 0.997526, 0.2431992, 1, 0, 0, 1, 1,
0.8791761, -0.4174926, 2.528929, 1, 0, 0, 1, 1,
0.88095, 1.186468, 0.6992287, 1, 0, 0, 1, 1,
0.8828302, 0.3673443, 1.582108, 0, 0, 0, 1, 1,
0.8858941, 1.625798, 0.8740025, 0, 0, 0, 1, 1,
0.8873582, -0.5884084, 4.153776, 0, 0, 0, 1, 1,
0.8884096, 0.7930464, 0.8872642, 0, 0, 0, 1, 1,
0.9113237, -0.3988061, 0.1079931, 0, 0, 0, 1, 1,
0.9145023, -1.561624, 2.577065, 0, 0, 0, 1, 1,
0.9156705, -0.5376407, 0.735817, 0, 0, 0, 1, 1,
0.9172058, -0.7762661, 1.93184, 1, 1, 1, 1, 1,
0.9179167, 0.8988665, -0.09824584, 1, 1, 1, 1, 1,
0.9220669, 1.201048, 2.206014, 1, 1, 1, 1, 1,
0.9236537, -0.06720201, 0.3677865, 1, 1, 1, 1, 1,
0.9274454, 0.4265614, 1.153775, 1, 1, 1, 1, 1,
0.9452562, 0.05762612, 2.90912, 1, 1, 1, 1, 1,
0.9481139, 1.496678, -0.6285642, 1, 1, 1, 1, 1,
0.9647212, 0.549224, 0.3291538, 1, 1, 1, 1, 1,
0.9736326, 0.2609946, -1.042752, 1, 1, 1, 1, 1,
0.9787993, 0.08072757, 3.224634, 1, 1, 1, 1, 1,
0.9938406, 0.6818869, -0.3695419, 1, 1, 1, 1, 1,
0.9975601, -0.2721038, 0.9126449, 1, 1, 1, 1, 1,
1.002147, -0.6607069, 2.075853, 1, 1, 1, 1, 1,
1.005439, 0.6170149, 0.006787377, 1, 1, 1, 1, 1,
1.010171, -0.6104377, 3.416713, 1, 1, 1, 1, 1,
1.015062, 0.2492675, 1.602624, 0, 0, 1, 1, 1,
1.027511, 2.744441, -0.5478957, 1, 0, 0, 1, 1,
1.029217, 0.2974355, 0.0963951, 1, 0, 0, 1, 1,
1.030774, 1.29364, -0.4051366, 1, 0, 0, 1, 1,
1.038226, 0.2391676, 2.977417, 1, 0, 0, 1, 1,
1.040852, -0.6282507, 2.696649, 1, 0, 0, 1, 1,
1.042147, 1.124701, -0.1576178, 0, 0, 0, 1, 1,
1.045607, -1.485626, 1.504054, 0, 0, 0, 1, 1,
1.052901, 1.412284, -2.11951, 0, 0, 0, 1, 1,
1.05301, -1.900046, 1.847306, 0, 0, 0, 1, 1,
1.059927, 0.6392907, 1.509326, 0, 0, 0, 1, 1,
1.068135, -1.401568, 1.454519, 0, 0, 0, 1, 1,
1.078215, -0.5424668, 0.5536057, 0, 0, 0, 1, 1,
1.083812, -0.7272173, 0.9239336, 1, 1, 1, 1, 1,
1.08761, -0.1016048, 1.99751, 1, 1, 1, 1, 1,
1.088762, 2.808271, 0.4997858, 1, 1, 1, 1, 1,
1.103549, -0.3814266, 2.454847, 1, 1, 1, 1, 1,
1.104209, 0.08634011, -0.7149411, 1, 1, 1, 1, 1,
1.107153, 0.001151469, 0.6266103, 1, 1, 1, 1, 1,
1.109668, 1.045722, 1.057514, 1, 1, 1, 1, 1,
1.110841, 0.8429143, 0.5064034, 1, 1, 1, 1, 1,
1.114675, 1.005609, 0.180718, 1, 1, 1, 1, 1,
1.115651, -0.6519117, 2.068339, 1, 1, 1, 1, 1,
1.116085, -0.1950002, 2.205349, 1, 1, 1, 1, 1,
1.132035, -1.526321, 1.389963, 1, 1, 1, 1, 1,
1.134597, 0.442661, 1.482832, 1, 1, 1, 1, 1,
1.136399, -0.625759, 3.581005, 1, 1, 1, 1, 1,
1.138449, -1.466665, 1.898407, 1, 1, 1, 1, 1,
1.139856, 0.44893, 1.226902, 0, 0, 1, 1, 1,
1.149703, 0.4132245, 1.570758, 1, 0, 0, 1, 1,
1.153378, -0.6743366, 1.946792, 1, 0, 0, 1, 1,
1.170879, 0.5726641, 0.9208157, 1, 0, 0, 1, 1,
1.184409, -0.1429623, 1.544718, 1, 0, 0, 1, 1,
1.185382, -0.56233, 2.083971, 1, 0, 0, 1, 1,
1.187328, -0.4745462, 1.896641, 0, 0, 0, 1, 1,
1.188413, -0.3152378, 0.2452483, 0, 0, 0, 1, 1,
1.189693, -0.61453, 2.038169, 0, 0, 0, 1, 1,
1.194341, 0.1646231, 1.460802, 0, 0, 0, 1, 1,
1.202145, 1.106185, 1.524375, 0, 0, 0, 1, 1,
1.209665, -1.132473, 2.038585, 0, 0, 0, 1, 1,
1.21353, 0.7931776, 0.7420849, 0, 0, 0, 1, 1,
1.218851, 1.21698, -0.008994476, 1, 1, 1, 1, 1,
1.227811, 0.1964855, 1.20608, 1, 1, 1, 1, 1,
1.241608, 0.443303, 1.737219, 1, 1, 1, 1, 1,
1.246295, -0.08615056, 2.309831, 1, 1, 1, 1, 1,
1.260192, 1.207575, 0.7137216, 1, 1, 1, 1, 1,
1.260668, 0.7151783, 1.250642, 1, 1, 1, 1, 1,
1.264713, 0.6109341, 1.063558, 1, 1, 1, 1, 1,
1.271543, 1.165676, 1.015223, 1, 1, 1, 1, 1,
1.27251, 0.4093769, -0.2334764, 1, 1, 1, 1, 1,
1.288388, 0.2566908, 0.05322055, 1, 1, 1, 1, 1,
1.289927, 0.1505219, 1.633689, 1, 1, 1, 1, 1,
1.290168, -0.9880344, 1.394876, 1, 1, 1, 1, 1,
1.29283, 0.5864484, 1.122481, 1, 1, 1, 1, 1,
1.296576, 0.7062039, 0.9149194, 1, 1, 1, 1, 1,
1.299636, -0.4869156, 2.118904, 1, 1, 1, 1, 1,
1.300265, 0.6521015, 0.2995121, 0, 0, 1, 1, 1,
1.300537, 0.8073432, -0.5257036, 1, 0, 0, 1, 1,
1.304517, 1.549774, 0.2939565, 1, 0, 0, 1, 1,
1.31266, -0.5174233, 3.393124, 1, 0, 0, 1, 1,
1.315195, 1.183382, -0.3870889, 1, 0, 0, 1, 1,
1.321337, -0.3883017, 4.549504, 1, 0, 0, 1, 1,
1.336229, 2.606049, 0.8587844, 0, 0, 0, 1, 1,
1.344038, -0.3943138, 1.900231, 0, 0, 0, 1, 1,
1.345096, -1.113268, 3.739833, 0, 0, 0, 1, 1,
1.358802, -0.6337074, 4.45222, 0, 0, 0, 1, 1,
1.359676, -1.160416, 2.706876, 0, 0, 0, 1, 1,
1.366491, -1.349393, 2.534586, 0, 0, 0, 1, 1,
1.368167, 1.078049, 0.7868819, 0, 0, 0, 1, 1,
1.370471, 0.3499226, 1.139793, 1, 1, 1, 1, 1,
1.371847, -0.9763458, 1.809899, 1, 1, 1, 1, 1,
1.37282, 0.7768818, 2.163519, 1, 1, 1, 1, 1,
1.373405, 0.1558343, 1.80825, 1, 1, 1, 1, 1,
1.375513, 0.5074144, 0.7874629, 1, 1, 1, 1, 1,
1.389042, -0.7351118, 1.259092, 1, 1, 1, 1, 1,
1.390196, 0.8505309, 0.6788788, 1, 1, 1, 1, 1,
1.393742, -0.794952, 4.579028, 1, 1, 1, 1, 1,
1.421328, 0.2386614, 0.9536627, 1, 1, 1, 1, 1,
1.422107, -2.106778, 2.87339, 1, 1, 1, 1, 1,
1.424259, -0.6361232, 3.133367, 1, 1, 1, 1, 1,
1.445621, -0.4919331, 0.5273491, 1, 1, 1, 1, 1,
1.450695, 0.9967275, 0.008501041, 1, 1, 1, 1, 1,
1.452731, -0.2143281, 1.100442, 1, 1, 1, 1, 1,
1.453252, 0.5004066, 0.06785308, 1, 1, 1, 1, 1,
1.454153, -1.358618, 3.270393, 0, 0, 1, 1, 1,
1.454625, 0.1167909, -1.194328, 1, 0, 0, 1, 1,
1.455873, 0.387617, 1.537812, 1, 0, 0, 1, 1,
1.471205, 0.7119985, -0.4491262, 1, 0, 0, 1, 1,
1.475812, 1.642244, 0.608474, 1, 0, 0, 1, 1,
1.477688, 1.447532, -1.679299, 1, 0, 0, 1, 1,
1.501094, -1.118763, 2.299178, 0, 0, 0, 1, 1,
1.503538, -1.15638, 3.197415, 0, 0, 0, 1, 1,
1.50499, 0.4934596, 0.7056964, 0, 0, 0, 1, 1,
1.506559, -1.713511, 0.3006049, 0, 0, 0, 1, 1,
1.522582, -3.03546, 3.76893, 0, 0, 0, 1, 1,
1.524313, 1.380241, -0.02951944, 0, 0, 0, 1, 1,
1.53203, -0.7794632, 2.734236, 0, 0, 0, 1, 1,
1.534454, -1.939402, 3.38693, 1, 1, 1, 1, 1,
1.545952, -1.072421, 1.175657, 1, 1, 1, 1, 1,
1.564946, 1.753863, 0.4555054, 1, 1, 1, 1, 1,
1.573037, -0.1586327, 1.035728, 1, 1, 1, 1, 1,
1.578029, 0.6357889, 0.9544219, 1, 1, 1, 1, 1,
1.579967, -0.8769268, 3.606427, 1, 1, 1, 1, 1,
1.582448, -1.880841, 2.529972, 1, 1, 1, 1, 1,
1.58452, -0.04428254, 0.9503832, 1, 1, 1, 1, 1,
1.596497, 1.033356, -0.1148379, 1, 1, 1, 1, 1,
1.598332, -0.07834961, 1.563424, 1, 1, 1, 1, 1,
1.605214, -0.7126213, 0.5730326, 1, 1, 1, 1, 1,
1.615055, 1.142968, 0.7861011, 1, 1, 1, 1, 1,
1.633757, -0.8412424, 2.013652, 1, 1, 1, 1, 1,
1.636117, -1.539279, 3.584089, 1, 1, 1, 1, 1,
1.641366, -1.036106, 0.2396322, 1, 1, 1, 1, 1,
1.673796, 1.239341, 0.5048642, 0, 0, 1, 1, 1,
1.680364, 1.23035, 3.924739, 1, 0, 0, 1, 1,
1.682515, 1.213928, 0.748509, 1, 0, 0, 1, 1,
1.690027, -0.6056999, 1.37023, 1, 0, 0, 1, 1,
1.711015, 0.9861563, 0.4411297, 1, 0, 0, 1, 1,
1.727693, -0.3316413, 0.3881518, 1, 0, 0, 1, 1,
1.744096, 0.7509652, 3.995385, 0, 0, 0, 1, 1,
1.766651, 0.907992, 1.627265, 0, 0, 0, 1, 1,
1.773187, -0.132682, 1.659783, 0, 0, 0, 1, 1,
1.786433, 3.001293, 0.8377867, 0, 0, 0, 1, 1,
1.801726, 0.7178321, 0.7210669, 0, 0, 0, 1, 1,
1.814417, -0.4771219, 1.430357, 0, 0, 0, 1, 1,
1.826368, -0.2472983, 0.7339696, 0, 0, 0, 1, 1,
1.84741, -0.5048422, 4.189307, 1, 1, 1, 1, 1,
1.851166, -0.6607885, 3.094697, 1, 1, 1, 1, 1,
1.867529, -0.8773279, 2.768374, 1, 1, 1, 1, 1,
1.904908, 0.6515359, 1.504266, 1, 1, 1, 1, 1,
1.919731, -2.237241, 1.70978, 1, 1, 1, 1, 1,
1.920926, -0.9895072, 0.5048593, 1, 1, 1, 1, 1,
1.937659, -0.1245308, 0.1638869, 1, 1, 1, 1, 1,
1.938848, -0.1729377, 1.592549, 1, 1, 1, 1, 1,
1.951231, -0.6878271, 3.765687, 1, 1, 1, 1, 1,
1.961514, -0.5915464, 1.472041, 1, 1, 1, 1, 1,
1.964039, 0.08351201, 1.28914, 1, 1, 1, 1, 1,
1.964962, -1.920655, 2.6083, 1, 1, 1, 1, 1,
1.97843, -0.380337, 2.759089, 1, 1, 1, 1, 1,
1.985846, -0.2249408, 1.801221, 1, 1, 1, 1, 1,
1.990378, 0.2179019, 2.179081, 1, 1, 1, 1, 1,
2.022428, -0.5795582, 1.370811, 0, 0, 1, 1, 1,
2.022865, -0.1877651, 1.442764, 1, 0, 0, 1, 1,
2.026989, -0.05781151, 2.380004, 1, 0, 0, 1, 1,
2.111059, -0.5095261, 2.344535, 1, 0, 0, 1, 1,
2.145008, -0.4138421, 0.3312858, 1, 0, 0, 1, 1,
2.174021, 0.241142, 0.1177567, 1, 0, 0, 1, 1,
2.176337, -0.7746188, 1.532153, 0, 0, 0, 1, 1,
2.212324, 0.05071876, 1.782025, 0, 0, 0, 1, 1,
2.272129, -1.852103, 3.5755, 0, 0, 0, 1, 1,
2.279016, -1.386383, 2.674736, 0, 0, 0, 1, 1,
2.486021, -0.3050155, 4.211707, 0, 0, 0, 1, 1,
2.48696, 0.305696, 1.77198, 0, 0, 0, 1, 1,
2.517126, 0.1780154, 3.544694, 0, 0, 0, 1, 1,
2.571223, 1.81903, 0.5180947, 1, 1, 1, 1, 1,
2.571321, -1.450322, 2.125634, 1, 1, 1, 1, 1,
2.625966, -1.255268, 2.477825, 1, 1, 1, 1, 1,
2.770041, 0.4460485, 1.279546, 1, 1, 1, 1, 1,
2.801238, -0.3885968, 3.071714, 1, 1, 1, 1, 1,
2.820688, -1.566669, 0.6877239, 1, 1, 1, 1, 1,
2.898425, 1.633162, 1.334097, 1, 1, 1, 1, 1
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
var radius = 10.29483;
var distance = 36.16015;
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
mvMatrix.translate( 0.627411, -0.08704996, 0.4778142 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.16015);
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
