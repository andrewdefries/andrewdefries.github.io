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
-3.48796, -0.3416615, -2.176485, 1, 0, 0, 1,
-3.078448, 0.3275736, -0.7205529, 1, 0.007843138, 0, 1,
-3.008679, 1.846944, -0.6529938, 1, 0.01176471, 0, 1,
-2.757371, 0.4920244, -0.5563875, 1, 0.01960784, 0, 1,
-2.54495, 1.782418, 0.1527526, 1, 0.02352941, 0, 1,
-2.458646, 0.5339569, -1.599213, 1, 0.03137255, 0, 1,
-2.43469, -1.115288, -2.046997, 1, 0.03529412, 0, 1,
-2.280375, -0.1626092, -2.206864, 1, 0.04313726, 0, 1,
-2.240324, -1.241715, -2.378093, 1, 0.04705882, 0, 1,
-2.157331, -1.651454, -1.328068, 1, 0.05490196, 0, 1,
-2.126106, -2.527611, -2.922201, 1, 0.05882353, 0, 1,
-2.112781, 1.512655, -1.413262, 1, 0.06666667, 0, 1,
-2.106605, -0.9381115, -2.125247, 1, 0.07058824, 0, 1,
-2.095806, 1.160767, -1.771841, 1, 0.07843138, 0, 1,
-2.085392, 1.158216, -1.695799, 1, 0.08235294, 0, 1,
-2.039583, -0.2688413, -0.8588257, 1, 0.09019608, 0, 1,
-2.03944, 1.21047, -0.93369, 1, 0.09411765, 0, 1,
-2.020349, 0.4298204, -0.78668, 1, 0.1019608, 0, 1,
-1.958441, -0.1120955, -2.208991, 1, 0.1098039, 0, 1,
-1.954205, -0.380915, -2.798386, 1, 0.1137255, 0, 1,
-1.950977, 0.6351357, -1.505588, 1, 0.1215686, 0, 1,
-1.940244, -1.429628, -2.891926, 1, 0.1254902, 0, 1,
-1.900819, 0.9584734, -0.05476118, 1, 0.1333333, 0, 1,
-1.886966, -0.3762904, -0.3791745, 1, 0.1372549, 0, 1,
-1.844019, -0.7475921, -2.870183, 1, 0.145098, 0, 1,
-1.841954, -0.8864731, -2.398695, 1, 0.1490196, 0, 1,
-1.837052, 0.9242054, -2.065046, 1, 0.1568628, 0, 1,
-1.829316, 0.5548353, -1.887981, 1, 0.1607843, 0, 1,
-1.795836, 0.2717908, -1.963433, 1, 0.1686275, 0, 1,
-1.78971, -1.025636, -3.030083, 1, 0.172549, 0, 1,
-1.779348, -1.815216, -1.472064, 1, 0.1803922, 0, 1,
-1.725548, 1.397801, -0.6869339, 1, 0.1843137, 0, 1,
-1.714858, -1.908219, -3.721927, 1, 0.1921569, 0, 1,
-1.711548, -1.446, -2.723948, 1, 0.1960784, 0, 1,
-1.702416, -1.728332, -2.124942, 1, 0.2039216, 0, 1,
-1.697195, -0.4057628, -2.991271, 1, 0.2117647, 0, 1,
-1.696117, -0.7897702, -2.228079, 1, 0.2156863, 0, 1,
-1.691446, 1.484079, -0.8110461, 1, 0.2235294, 0, 1,
-1.677674, -1.749703, -2.092183, 1, 0.227451, 0, 1,
-1.67438, -0.536989, -2.810215, 1, 0.2352941, 0, 1,
-1.673742, -0.1323317, -1.402838, 1, 0.2392157, 0, 1,
-1.670356, 0.4614416, -0.7108368, 1, 0.2470588, 0, 1,
-1.614168, 0.4257173, -1.825751, 1, 0.2509804, 0, 1,
-1.611663, 0.6992752, -1.548366, 1, 0.2588235, 0, 1,
-1.577838, -0.3661871, -1.239714, 1, 0.2627451, 0, 1,
-1.570503, -1.136033, -3.577449, 1, 0.2705882, 0, 1,
-1.561691, 1.252677, -0.5758225, 1, 0.2745098, 0, 1,
-1.546563, -1.237759, -2.270619, 1, 0.282353, 0, 1,
-1.532843, -1.448717, -1.732871, 1, 0.2862745, 0, 1,
-1.525003, 0.3066633, -1.072797, 1, 0.2941177, 0, 1,
-1.520435, 0.3087068, -0.471397, 1, 0.3019608, 0, 1,
-1.513663, -1.671919, -2.591957, 1, 0.3058824, 0, 1,
-1.509669, 1.219624, -2.028026, 1, 0.3137255, 0, 1,
-1.48276, 0.4615107, -1.788218, 1, 0.3176471, 0, 1,
-1.476337, 0.7555345, -1.535109, 1, 0.3254902, 0, 1,
-1.468155, 1.739055, -1.859881, 1, 0.3294118, 0, 1,
-1.462729, -1.163929, -2.920611, 1, 0.3372549, 0, 1,
-1.459314, -0.08136591, -1.751284, 1, 0.3411765, 0, 1,
-1.454337, -0.1360228, -4.813523, 1, 0.3490196, 0, 1,
-1.447938, 0.491527, -0.4496163, 1, 0.3529412, 0, 1,
-1.441644, 0.07971869, -0.7608671, 1, 0.3607843, 0, 1,
-1.435522, -1.736681, -1.382614, 1, 0.3647059, 0, 1,
-1.429792, -0.7148766, -3.547797, 1, 0.372549, 0, 1,
-1.41384, -0.8438626, -2.554801, 1, 0.3764706, 0, 1,
-1.413697, 1.152363, -1.517028, 1, 0.3843137, 0, 1,
-1.40587, 0.6069864, -0.4761099, 1, 0.3882353, 0, 1,
-1.40282, 0.3745727, -2.507109, 1, 0.3960784, 0, 1,
-1.4026, 1.844697, -0.6136854, 1, 0.4039216, 0, 1,
-1.402336, 0.212275, -0.7300487, 1, 0.4078431, 0, 1,
-1.395645, 0.9209678, -1.776598, 1, 0.4156863, 0, 1,
-1.382927, 0.2117327, -0.8746655, 1, 0.4196078, 0, 1,
-1.380385, -0.1943965, -2.28691, 1, 0.427451, 0, 1,
-1.376833, -0.7203686, -2.603483, 1, 0.4313726, 0, 1,
-1.373298, -0.06188079, -2.206241, 1, 0.4392157, 0, 1,
-1.367469, -1.864194, -2.122984, 1, 0.4431373, 0, 1,
-1.358804, -0.4073918, -1.446889, 1, 0.4509804, 0, 1,
-1.348566, 0.3510588, -0.6590394, 1, 0.454902, 0, 1,
-1.343975, -0.5118822, -2.206646, 1, 0.4627451, 0, 1,
-1.340361, -0.3664991, -2.896245, 1, 0.4666667, 0, 1,
-1.338764, -0.0866219, -2.173402, 1, 0.4745098, 0, 1,
-1.328092, -1.055773, -1.627289, 1, 0.4784314, 0, 1,
-1.32051, 1.288495, -0.9132953, 1, 0.4862745, 0, 1,
-1.302419, 0.3315465, -0.4753423, 1, 0.4901961, 0, 1,
-1.293935, -0.2742527, -2.614089, 1, 0.4980392, 0, 1,
-1.291543, -0.9395533, -2.832111, 1, 0.5058824, 0, 1,
-1.28162, 2.576567, 0.2928288, 1, 0.509804, 0, 1,
-1.268109, 0.4446879, 0.2989363, 1, 0.5176471, 0, 1,
-1.267745, -1.849118, -2.657259, 1, 0.5215687, 0, 1,
-1.263613, 0.1521599, -0.272266, 1, 0.5294118, 0, 1,
-1.261554, -0.160487, -2.656476, 1, 0.5333334, 0, 1,
-1.259414, -1.119353, -3.705824, 1, 0.5411765, 0, 1,
-1.252907, 0.87311, 0.7014948, 1, 0.5450981, 0, 1,
-1.248009, -1.257998, -0.7650861, 1, 0.5529412, 0, 1,
-1.232955, 0.3307202, -1.994282, 1, 0.5568628, 0, 1,
-1.229428, 0.1584634, -1.551701, 1, 0.5647059, 0, 1,
-1.222807, -0.8618525, -3.341888, 1, 0.5686275, 0, 1,
-1.216603, -1.324829, -1.26594, 1, 0.5764706, 0, 1,
-1.20986, -0.2961371, -2.679456, 1, 0.5803922, 0, 1,
-1.206723, 2.490689, -1.20815, 1, 0.5882353, 0, 1,
-1.191849, -0.1790623, 0.2882945, 1, 0.5921569, 0, 1,
-1.190704, 0.815177, -0.3894384, 1, 0.6, 0, 1,
-1.189061, 1.019705, 0.3038024, 1, 0.6078432, 0, 1,
-1.178439, 0.03858381, -2.116251, 1, 0.6117647, 0, 1,
-1.175513, 0.1925174, -1.610727, 1, 0.6196079, 0, 1,
-1.174026, 0.7820274, -0.4924416, 1, 0.6235294, 0, 1,
-1.170639, -0.7037827, -2.089099, 1, 0.6313726, 0, 1,
-1.16616, 0.5860927, -0.7875809, 1, 0.6352941, 0, 1,
-1.159795, 0.682124, -1.061242, 1, 0.6431373, 0, 1,
-1.144471, 0.6161026, -0.3261203, 1, 0.6470588, 0, 1,
-1.144207, -1.069866, -4.134645, 1, 0.654902, 0, 1,
-1.136774, -0.882349, -1.179491, 1, 0.6588235, 0, 1,
-1.134685, -1.019696, -2.984669, 1, 0.6666667, 0, 1,
-1.12844, 0.7894183, -0.3369106, 1, 0.6705883, 0, 1,
-1.127789, 0.2165179, -0.4498422, 1, 0.6784314, 0, 1,
-1.126645, -0.0873041, -1.642046, 1, 0.682353, 0, 1,
-1.126307, -0.8384058, -3.033689, 1, 0.6901961, 0, 1,
-1.124912, -2.166977, -2.940539, 1, 0.6941177, 0, 1,
-1.110222, 0.622722, -2.227954, 1, 0.7019608, 0, 1,
-1.097601, -0.03684603, -1.716731, 1, 0.7098039, 0, 1,
-1.091059, -1.243659, -3.948282, 1, 0.7137255, 0, 1,
-1.0878, -0.6444348, -2.440073, 1, 0.7215686, 0, 1,
-1.087542, -0.1718228, -1.947848, 1, 0.7254902, 0, 1,
-1.078644, 1.539407, 0.5636973, 1, 0.7333333, 0, 1,
-1.077521, -0.3672286, -0.8329189, 1, 0.7372549, 0, 1,
-1.0728, -0.1074324, -0.8562933, 1, 0.7450981, 0, 1,
-1.068467, -1.012348, -2.261362, 1, 0.7490196, 0, 1,
-1.066581, -0.6106978, -1.853954, 1, 0.7568628, 0, 1,
-1.066327, 1.071052, -1.410181, 1, 0.7607843, 0, 1,
-1.054555, 1.182066, -1.760482, 1, 0.7686275, 0, 1,
-1.052987, 0.1768243, 0.2582049, 1, 0.772549, 0, 1,
-1.050095, 0.3182298, -2.184755, 1, 0.7803922, 0, 1,
-1.045108, 0.3639739, -1.545359, 1, 0.7843137, 0, 1,
-1.042452, -0.7963772, -2.474431, 1, 0.7921569, 0, 1,
-1.040407, 0.5322638, -1.811371, 1, 0.7960784, 0, 1,
-1.036054, 0.1001647, -3.052594, 1, 0.8039216, 0, 1,
-1.035787, -0.561139, -2.566421, 1, 0.8117647, 0, 1,
-1.035447, -0.9998977, -3.52467, 1, 0.8156863, 0, 1,
-1.030574, -0.5840214, -4.360464, 1, 0.8235294, 0, 1,
-1.028004, 0.05464919, -3.608749, 1, 0.827451, 0, 1,
-1.025836, 0.1159149, -1.101338, 1, 0.8352941, 0, 1,
-1.025189, 0.2058164, 0.3820916, 1, 0.8392157, 0, 1,
-1.017805, 0.09331966, -0.9450399, 1, 0.8470588, 0, 1,
-1.016555, -0.0147285, -0.2034344, 1, 0.8509804, 0, 1,
-1.016467, 0.4903471, -0.927627, 1, 0.8588235, 0, 1,
-1.013453, -1.50451, -4.554165, 1, 0.8627451, 0, 1,
-1.012989, 0.2367826, -2.480642, 1, 0.8705882, 0, 1,
-1.009198, -0.355281, -1.794154, 1, 0.8745098, 0, 1,
-1.005261, 0.2183059, -3.136502, 1, 0.8823529, 0, 1,
-0.9979688, 0.4176934, -1.891852, 1, 0.8862745, 0, 1,
-0.9904558, -0.12802, -2.23767, 1, 0.8941177, 0, 1,
-0.9895471, -1.378149, -3.399629, 1, 0.8980392, 0, 1,
-0.9868822, -0.03190496, -0.4952858, 1, 0.9058824, 0, 1,
-0.9682672, -0.3403447, -2.115831, 1, 0.9137255, 0, 1,
-0.9666351, 0.6259866, 0.8028715, 1, 0.9176471, 0, 1,
-0.9610605, -1.668643, -3.081494, 1, 0.9254902, 0, 1,
-0.9561253, 0.3077469, -1.630446, 1, 0.9294118, 0, 1,
-0.9523383, 0.9770377, 0.4535902, 1, 0.9372549, 0, 1,
-0.9497709, -2.496493, -2.880846, 1, 0.9411765, 0, 1,
-0.9493329, -3.947914e-05, -3.987875, 1, 0.9490196, 0, 1,
-0.9433109, 0.4742309, 0.1664672, 1, 0.9529412, 0, 1,
-0.9432769, -0.5238801, -1.48961, 1, 0.9607843, 0, 1,
-0.9357541, -0.03332336, -1.8738, 1, 0.9647059, 0, 1,
-0.9341824, -0.710997, -0.2537361, 1, 0.972549, 0, 1,
-0.9323732, -0.2817705, -0.7949129, 1, 0.9764706, 0, 1,
-0.932267, -0.1862946, -1.843833, 1, 0.9843137, 0, 1,
-0.9321837, 1.200154, -0.4715245, 1, 0.9882353, 0, 1,
-0.9307304, -0.8769916, -2.744862, 1, 0.9960784, 0, 1,
-0.9253748, 0.9790155, 0.03378058, 0.9960784, 1, 0, 1,
-0.9202288, 1.648658, -1.23489, 0.9921569, 1, 0, 1,
-0.9182249, 0.4034645, -1.708063, 0.9843137, 1, 0, 1,
-0.918064, -0.7386454, -2.320694, 0.9803922, 1, 0, 1,
-0.9072484, -1.040298, -1.177406, 0.972549, 1, 0, 1,
-0.9014086, 0.4686489, -1.041478, 0.9686275, 1, 0, 1,
-0.8971659, 0.5676147, -0.8732017, 0.9607843, 1, 0, 1,
-0.8948653, -1.004723, -2.137604, 0.9568627, 1, 0, 1,
-0.8939865, -0.2534869, -1.766782, 0.9490196, 1, 0, 1,
-0.8891391, -1.972403, -3.680854, 0.945098, 1, 0, 1,
-0.8886158, -0.6352021, -2.370384, 0.9372549, 1, 0, 1,
-0.875422, 0.355873, -1.634087, 0.9333333, 1, 0, 1,
-0.8714606, 0.2955941, -1.718929, 0.9254902, 1, 0, 1,
-0.8705584, 0.3371473, -2.15152, 0.9215686, 1, 0, 1,
-0.8685764, 0.1157183, -0.9789523, 0.9137255, 1, 0, 1,
-0.8656592, 0.145111, -0.8474471, 0.9098039, 1, 0, 1,
-0.8656397, 0.8250378, -1.224358, 0.9019608, 1, 0, 1,
-0.8639148, -0.3633643, -2.854995, 0.8941177, 1, 0, 1,
-0.8572423, 0.4630668, 0.03382491, 0.8901961, 1, 0, 1,
-0.8532784, 1.339029, -0.9392527, 0.8823529, 1, 0, 1,
-0.8477337, -1.587207, -4.405012, 0.8784314, 1, 0, 1,
-0.8414879, -0.6147781, -1.211448, 0.8705882, 1, 0, 1,
-0.8378617, 0.9795617, -0.6501033, 0.8666667, 1, 0, 1,
-0.8369239, -0.09174315, -2.924981, 0.8588235, 1, 0, 1,
-0.8320432, 0.166326, -2.536944, 0.854902, 1, 0, 1,
-0.8287354, -1.872914, -1.065036, 0.8470588, 1, 0, 1,
-0.8263241, -1.187455, -2.214668, 0.8431373, 1, 0, 1,
-0.8237399, -0.02968233, -3.319273, 0.8352941, 1, 0, 1,
-0.8198489, -0.06915884, -1.146187, 0.8313726, 1, 0, 1,
-0.8186455, -0.932797, -3.227418, 0.8235294, 1, 0, 1,
-0.8173539, 1.281931, -0.2078029, 0.8196079, 1, 0, 1,
-0.816366, 0.5963914, -0.4173685, 0.8117647, 1, 0, 1,
-0.8117487, -0.1478873, -2.112868, 0.8078431, 1, 0, 1,
-0.8101853, 1.354699, -1.745093, 0.8, 1, 0, 1,
-0.8047928, -0.7567106, -3.436717, 0.7921569, 1, 0, 1,
-0.8035975, -0.1560425, -1.990944, 0.7882353, 1, 0, 1,
-0.7984763, 0.5956249, -0.5889086, 0.7803922, 1, 0, 1,
-0.796706, -0.8950906, -3.129497, 0.7764706, 1, 0, 1,
-0.793754, -0.9111992, -2.041249, 0.7686275, 1, 0, 1,
-0.7918775, 0.3284443, -0.04191728, 0.7647059, 1, 0, 1,
-0.790374, 1.375439, -1.015267, 0.7568628, 1, 0, 1,
-0.7865503, 0.3273025, -2.326028, 0.7529412, 1, 0, 1,
-0.7824654, 0.5133286, -0.4428346, 0.7450981, 1, 0, 1,
-0.7787382, -1.6214, -2.223696, 0.7411765, 1, 0, 1,
-0.7752121, -1.151962, -3.388525, 0.7333333, 1, 0, 1,
-0.7721993, 0.7541609, -0.6816952, 0.7294118, 1, 0, 1,
-0.7673633, -0.04872294, -1.349662, 0.7215686, 1, 0, 1,
-0.7645428, 0.1692079, -2.961427, 0.7176471, 1, 0, 1,
-0.7569112, 0.2170766, -2.123564, 0.7098039, 1, 0, 1,
-0.7456154, 0.7737927, 0.4140751, 0.7058824, 1, 0, 1,
-0.7393432, 0.8706243, -0.5796503, 0.6980392, 1, 0, 1,
-0.7312716, 0.7409925, -0.3897359, 0.6901961, 1, 0, 1,
-0.7269248, -0.3895572, -2.011823, 0.6862745, 1, 0, 1,
-0.7266961, 0.7973188, -1.649209, 0.6784314, 1, 0, 1,
-0.7219937, -0.5329182, -1.705976, 0.6745098, 1, 0, 1,
-0.7218029, 0.42874, -2.370459, 0.6666667, 1, 0, 1,
-0.7204544, -0.6076608, 0.407975, 0.6627451, 1, 0, 1,
-0.7169762, -0.2544971, -0.6778095, 0.654902, 1, 0, 1,
-0.7154455, 0.133775, -2.331633, 0.6509804, 1, 0, 1,
-0.7105315, -2.036358, -3.387083, 0.6431373, 1, 0, 1,
-0.7096003, 0.2052179, -2.36828, 0.6392157, 1, 0, 1,
-0.7019229, 0.7019073, -1.821732, 0.6313726, 1, 0, 1,
-0.7018353, 0.2566861, -0.3242908, 0.627451, 1, 0, 1,
-0.7010853, 0.7757219, 0.4205183, 0.6196079, 1, 0, 1,
-0.6999472, -0.240729, -1.897207, 0.6156863, 1, 0, 1,
-0.6961649, -0.5589862, -3.275436, 0.6078432, 1, 0, 1,
-0.690247, 0.6617157, -1.366728, 0.6039216, 1, 0, 1,
-0.6886343, -1.15029, -3.83642, 0.5960785, 1, 0, 1,
-0.6874881, 0.494549, -1.387056, 0.5882353, 1, 0, 1,
-0.6855764, 0.4145877, -1.550098, 0.5843138, 1, 0, 1,
-0.6852862, 0.07272992, 0.2246917, 0.5764706, 1, 0, 1,
-0.6826317, 0.6989506, -1.358984, 0.572549, 1, 0, 1,
-0.6821295, 0.4171103, -2.349444, 0.5647059, 1, 0, 1,
-0.6736662, 0.9314715, 2.134227, 0.5607843, 1, 0, 1,
-0.6730976, 0.3238686, 1.086179, 0.5529412, 1, 0, 1,
-0.6709068, -1.091089, -2.528965, 0.5490196, 1, 0, 1,
-0.6691014, -0.02816806, -1.094084, 0.5411765, 1, 0, 1,
-0.6688521, 1.031066, -1.498062, 0.5372549, 1, 0, 1,
-0.6576982, 0.6231465, -1.381197, 0.5294118, 1, 0, 1,
-0.6516953, -0.6701707, -3.014884, 0.5254902, 1, 0, 1,
-0.6434729, 1.538414, -1.130866, 0.5176471, 1, 0, 1,
-0.6410267, 0.08695803, -1.442763, 0.5137255, 1, 0, 1,
-0.6372141, 1.687572, 0.4184818, 0.5058824, 1, 0, 1,
-0.6367683, -0.6349065, -2.378833, 0.5019608, 1, 0, 1,
-0.6334991, 1.310244, -1.355469, 0.4941176, 1, 0, 1,
-0.6334651, -1.014223, -2.413292, 0.4862745, 1, 0, 1,
-0.6333711, -0.1347464, -3.849638, 0.4823529, 1, 0, 1,
-0.6310605, -2.411551, -4.704678, 0.4745098, 1, 0, 1,
-0.6298884, 1.286438, 0.2021528, 0.4705882, 1, 0, 1,
-0.6275958, 2.234485, 0.1628095, 0.4627451, 1, 0, 1,
-0.6213861, 0.8494798, -0.2570818, 0.4588235, 1, 0, 1,
-0.6209999, 0.7900659, -0.8091102, 0.4509804, 1, 0, 1,
-0.6163566, 1.351436, -0.717979, 0.4470588, 1, 0, 1,
-0.6131428, -0.08081169, -0.7680078, 0.4392157, 1, 0, 1,
-0.6121614, 0.1429683, -2.23121, 0.4352941, 1, 0, 1,
-0.6113194, 0.4543248, 0.08814318, 0.427451, 1, 0, 1,
-0.6082688, 0.6243258, -0.7514558, 0.4235294, 1, 0, 1,
-0.6029529, 0.0728172, -3.079779, 0.4156863, 1, 0, 1,
-0.6021854, -1.660848, -1.905994, 0.4117647, 1, 0, 1,
-0.6020865, 0.08541818, -0.5598073, 0.4039216, 1, 0, 1,
-0.5994712, 1.21845, 1.495646, 0.3960784, 1, 0, 1,
-0.58989, -0.1951995, -3.285098, 0.3921569, 1, 0, 1,
-0.5859973, 1.912835, 0.3768301, 0.3843137, 1, 0, 1,
-0.5844867, 2.055834, -0.254195, 0.3803922, 1, 0, 1,
-0.5840305, 1.152209, -1.040039, 0.372549, 1, 0, 1,
-0.5821172, 1.407103, -0.3658367, 0.3686275, 1, 0, 1,
-0.5805784, 0.8100089, -1.62592, 0.3607843, 1, 0, 1,
-0.5788618, -0.2817379, -2.412555, 0.3568628, 1, 0, 1,
-0.5706025, -0.2565226, -2.791344, 0.3490196, 1, 0, 1,
-0.5575256, 1.547025, -0.3862693, 0.345098, 1, 0, 1,
-0.5509399, -1.137102, -2.060585, 0.3372549, 1, 0, 1,
-0.5488174, 1.318314, -2.303091, 0.3333333, 1, 0, 1,
-0.5481969, 0.4349016, -1.590147, 0.3254902, 1, 0, 1,
-0.5448186, 0.01843127, -1.703448, 0.3215686, 1, 0, 1,
-0.5446615, -1.462282, -2.674389, 0.3137255, 1, 0, 1,
-0.5391039, -1.248009, -1.706913, 0.3098039, 1, 0, 1,
-0.5328553, -0.5925442, -3.587645, 0.3019608, 1, 0, 1,
-0.5289283, -1.124821, -2.972688, 0.2941177, 1, 0, 1,
-0.5262771, 0.7193903, -0.3333386, 0.2901961, 1, 0, 1,
-0.5252599, -1.242938, -1.377409, 0.282353, 1, 0, 1,
-0.5213429, -0.8571956, -3.584699, 0.2784314, 1, 0, 1,
-0.5196837, 0.9305532, -0.1310796, 0.2705882, 1, 0, 1,
-0.5166568, 0.3502566, -2.136224, 0.2666667, 1, 0, 1,
-0.5159783, 0.2768861, -0.1477105, 0.2588235, 1, 0, 1,
-0.5120384, 1.325943, -1.160472, 0.254902, 1, 0, 1,
-0.5112951, 0.1699256, -2.125061, 0.2470588, 1, 0, 1,
-0.5105987, -0.6386502, -1.43916, 0.2431373, 1, 0, 1,
-0.5099031, -0.1676517, -0.2028386, 0.2352941, 1, 0, 1,
-0.5089759, -0.6196233, -3.223652, 0.2313726, 1, 0, 1,
-0.5053705, 1.385518, -1.880166, 0.2235294, 1, 0, 1,
-0.5043086, -1.38289, -4.201665, 0.2196078, 1, 0, 1,
-0.5035477, -0.04437408, -1.570096, 0.2117647, 1, 0, 1,
-0.5000607, -0.1322154, -2.564348, 0.2078431, 1, 0, 1,
-0.4999634, -1.859965, -2.372658, 0.2, 1, 0, 1,
-0.4982632, -0.4968694, -3.116311, 0.1921569, 1, 0, 1,
-0.4964688, 3.433719, 0.3766779, 0.1882353, 1, 0, 1,
-0.49532, 0.06837014, -2.475464, 0.1803922, 1, 0, 1,
-0.493398, 0.9414645, -0.4594982, 0.1764706, 1, 0, 1,
-0.4926576, 1.011543, 0.6844113, 0.1686275, 1, 0, 1,
-0.4915166, -0.2070385, -0.7826563, 0.1647059, 1, 0, 1,
-0.4874925, 0.2087205, -0.7581905, 0.1568628, 1, 0, 1,
-0.4867288, -0.7807184, -3.714031, 0.1529412, 1, 0, 1,
-0.4857463, 1.558469, -1.521198, 0.145098, 1, 0, 1,
-0.4855194, 1.005465, -0.4718663, 0.1411765, 1, 0, 1,
-0.4845276, -0.2871075, -1.765647, 0.1333333, 1, 0, 1,
-0.4838202, 0.3814024, -1.69356, 0.1294118, 1, 0, 1,
-0.4830143, -0.9418436, -3.608177, 0.1215686, 1, 0, 1,
-0.4814014, 0.7965958, -0.5721037, 0.1176471, 1, 0, 1,
-0.4685655, -0.2596073, -0.7680763, 0.1098039, 1, 0, 1,
-0.4643774, -0.5915152, -2.732759, 0.1058824, 1, 0, 1,
-0.4601277, -1.264699, -4.661195, 0.09803922, 1, 0, 1,
-0.4540184, 0.5703247, -2.06437, 0.09019608, 1, 0, 1,
-0.4525738, -0.170035, -1.51811, 0.08627451, 1, 0, 1,
-0.4484347, -0.6268344, -3.466536, 0.07843138, 1, 0, 1,
-0.4480326, 1.00564, 1.203862, 0.07450981, 1, 0, 1,
-0.4471405, -0.5293396, -2.291413, 0.06666667, 1, 0, 1,
-0.4459184, -1.086171, -1.93598, 0.0627451, 1, 0, 1,
-0.4457805, 0.5626931, -1.029827, 0.05490196, 1, 0, 1,
-0.4442244, -1.253642, -1.753931, 0.05098039, 1, 0, 1,
-0.4437667, 0.1638033, -0.5195013, 0.04313726, 1, 0, 1,
-0.443667, 0.5979347, 0.4097631, 0.03921569, 1, 0, 1,
-0.4430063, 0.4422059, -2.436891, 0.03137255, 1, 0, 1,
-0.4416426, 0.04954981, -3.48125, 0.02745098, 1, 0, 1,
-0.4404469, -1.537825, -3.380499, 0.01960784, 1, 0, 1,
-0.437707, -1.095497, -1.524502, 0.01568628, 1, 0, 1,
-0.4375923, 0.5628875, -0.0415931, 0.007843138, 1, 0, 1,
-0.4359029, -1.389707, -3.4442, 0.003921569, 1, 0, 1,
-0.4324267, -1.199885, -1.897101, 0, 1, 0.003921569, 1,
-0.430892, 0.3229267, -0.9661277, 0, 1, 0.01176471, 1,
-0.4300287, 0.391516, -0.7091542, 0, 1, 0.01568628, 1,
-0.427577, 2.702518, -0.06560817, 0, 1, 0.02352941, 1,
-0.4273986, -0.2782145, -2.298949, 0, 1, 0.02745098, 1,
-0.4218876, -0.8072085, -2.75306, 0, 1, 0.03529412, 1,
-0.4194864, 0.5014518, 0.8313183, 0, 1, 0.03921569, 1,
-0.4191866, 0.1977229, -1.277161, 0, 1, 0.04705882, 1,
-0.4174261, 0.5764068, -1.556377, 0, 1, 0.05098039, 1,
-0.412144, 0.4496132, -1.207457, 0, 1, 0.05882353, 1,
-0.4106685, 0.324827, -1.534788, 0, 1, 0.0627451, 1,
-0.4069353, 0.01403651, -0.4791737, 0, 1, 0.07058824, 1,
-0.40482, 0.1313764, -1.707484, 0, 1, 0.07450981, 1,
-0.4024764, -1.91558, -3.973073, 0, 1, 0.08235294, 1,
-0.4014333, -1.1524, -3.731306, 0, 1, 0.08627451, 1,
-0.3981585, 1.336385, 0.9050557, 0, 1, 0.09411765, 1,
-0.3973797, -2.077223, -3.621469, 0, 1, 0.1019608, 1,
-0.3932486, 0.4568887, -2.276942, 0, 1, 0.1058824, 1,
-0.3921921, -0.3056058, -0.4704971, 0, 1, 0.1137255, 1,
-0.3910806, 0.5228906, -0.958232, 0, 1, 0.1176471, 1,
-0.3884502, -1.707736, -4.725697, 0, 1, 0.1254902, 1,
-0.3882191, 1.042791, -1.039746, 0, 1, 0.1294118, 1,
-0.3773201, 1.15513, -1.626948, 0, 1, 0.1372549, 1,
-0.3772991, -0.1430274, -3.091329, 0, 1, 0.1411765, 1,
-0.3764733, -0.8363758, -4.736873, 0, 1, 0.1490196, 1,
-0.3761519, -0.02328944, -3.885071, 0, 1, 0.1529412, 1,
-0.3744763, -0.7184271, -3.198403, 0, 1, 0.1607843, 1,
-0.3728054, -0.9437047, -2.254867, 0, 1, 0.1647059, 1,
-0.3715863, 1.981738, 0.5924497, 0, 1, 0.172549, 1,
-0.3686086, -0.1379346, -2.112795, 0, 1, 0.1764706, 1,
-0.3616692, -0.2769794, -2.87778, 0, 1, 0.1843137, 1,
-0.3579413, -0.7294595, -3.05852, 0, 1, 0.1882353, 1,
-0.3562147, -0.5028104, -1.276048, 0, 1, 0.1960784, 1,
-0.3521608, 0.2772804, -0.8025305, 0, 1, 0.2039216, 1,
-0.3513859, 1.447939, 0.862509, 0, 1, 0.2078431, 1,
-0.348495, 0.5181645, -0.1589804, 0, 1, 0.2156863, 1,
-0.3482975, -0.5397798, -2.392093, 0, 1, 0.2196078, 1,
-0.3456417, 0.05081793, -0.2924931, 0, 1, 0.227451, 1,
-0.3439012, -1.376186, -2.727409, 0, 1, 0.2313726, 1,
-0.3416114, -0.1173172, -3.243255, 0, 1, 0.2392157, 1,
-0.3387784, 0.07564622, -2.194198, 0, 1, 0.2431373, 1,
-0.3330774, -0.1593582, -1.643687, 0, 1, 0.2509804, 1,
-0.3310194, -1.696577, -3.831715, 0, 1, 0.254902, 1,
-0.3282549, -1.187566, -3.220802, 0, 1, 0.2627451, 1,
-0.3170326, -0.5136642, -3.872171, 0, 1, 0.2666667, 1,
-0.3165241, 1.517742, 0.3809335, 0, 1, 0.2745098, 1,
-0.3158276, 0.4613332, -0.5311483, 0, 1, 0.2784314, 1,
-0.3112496, -0.06163699, -3.608553, 0, 1, 0.2862745, 1,
-0.311146, 1.139679, 1.698451, 0, 1, 0.2901961, 1,
-0.311025, -0.7272193, -0.6119217, 0, 1, 0.2980392, 1,
-0.3106877, -1.563764, -3.728076, 0, 1, 0.3058824, 1,
-0.3044749, -0.4623897, -2.598889, 0, 1, 0.3098039, 1,
-0.2989404, 0.5325695, 0.356673, 0, 1, 0.3176471, 1,
-0.2989269, -0.475841, -2.94703, 0, 1, 0.3215686, 1,
-0.298054, 0.6488864, -0.1451937, 0, 1, 0.3294118, 1,
-0.2963592, 0.07368011, 0.4826125, 0, 1, 0.3333333, 1,
-0.2959691, -1.276161, -1.542904, 0, 1, 0.3411765, 1,
-0.2945837, 0.4475258, 0.3678946, 0, 1, 0.345098, 1,
-0.2943662, 0.4145639, -2.630794, 0, 1, 0.3529412, 1,
-0.293896, -0.3225848, -3.133397, 0, 1, 0.3568628, 1,
-0.2923472, -2.590556, -3.905469, 0, 1, 0.3647059, 1,
-0.2911945, 0.6707461, 0.5181414, 0, 1, 0.3686275, 1,
-0.2902451, -0.2408745, -3.500457, 0, 1, 0.3764706, 1,
-0.288018, -2.595623, -3.023367, 0, 1, 0.3803922, 1,
-0.2850533, -1.167612, -3.013703, 0, 1, 0.3882353, 1,
-0.2829999, -0.09070196, -1.819063, 0, 1, 0.3921569, 1,
-0.2763967, -1.29205, -3.016489, 0, 1, 0.4, 1,
-0.2758726, 1.232996, -0.928512, 0, 1, 0.4078431, 1,
-0.2756073, -1.373652, -4.22087, 0, 1, 0.4117647, 1,
-0.2749778, -1.367437, -4.522809, 0, 1, 0.4196078, 1,
-0.2726776, 0.5921141, -0.3539529, 0, 1, 0.4235294, 1,
-0.2714482, -0.2956368, -1.893011, 0, 1, 0.4313726, 1,
-0.2713473, 0.1499044, -0.8054125, 0, 1, 0.4352941, 1,
-0.268022, -1.142266, -2.447018, 0, 1, 0.4431373, 1,
-0.2650003, -0.7042985, -1.226877, 0, 1, 0.4470588, 1,
-0.2637163, -1.415075, -1.864548, 0, 1, 0.454902, 1,
-0.2627679, 0.802371, 1.601737, 0, 1, 0.4588235, 1,
-0.2621729, 0.4132934, -1.415955, 0, 1, 0.4666667, 1,
-0.2572345, 1.161512, -0.1812787, 0, 1, 0.4705882, 1,
-0.2558537, -0.06115692, -2.431516, 0, 1, 0.4784314, 1,
-0.250566, 0.5357079, -1.963438, 0, 1, 0.4823529, 1,
-0.2499183, 0.9380847, 1.060971, 0, 1, 0.4901961, 1,
-0.2438897, -0.9756546, -2.171447, 0, 1, 0.4941176, 1,
-0.2438657, -1.653272, -5.628604, 0, 1, 0.5019608, 1,
-0.2424929, 0.1737986, -1.499666, 0, 1, 0.509804, 1,
-0.242215, 0.387302, -1.370413, 0, 1, 0.5137255, 1,
-0.2411892, 1.88529, -0.555226, 0, 1, 0.5215687, 1,
-0.2394718, -0.6639774, -2.178476, 0, 1, 0.5254902, 1,
-0.2374874, 1.15076, 0.7228882, 0, 1, 0.5333334, 1,
-0.2333361, 0.8354303, -0.4469004, 0, 1, 0.5372549, 1,
-0.2327322, 0.2738707, 1.075752, 0, 1, 0.5450981, 1,
-0.2314656, -0.3264583, -2.293728, 0, 1, 0.5490196, 1,
-0.2207368, 2.252146, -0.703532, 0, 1, 0.5568628, 1,
-0.2151197, 1.284876, 0.5087109, 0, 1, 0.5607843, 1,
-0.2149732, -0.5819585, -4.16434, 0, 1, 0.5686275, 1,
-0.2130431, -0.3526708, -3.479401, 0, 1, 0.572549, 1,
-0.2056589, -0.7117159, -4.156832, 0, 1, 0.5803922, 1,
-0.2037102, 0.7777793, -1.971385, 0, 1, 0.5843138, 1,
-0.1926871, -1.172745, -2.46628, 0, 1, 0.5921569, 1,
-0.1920929, -0.3303101, -2.218412, 0, 1, 0.5960785, 1,
-0.1822277, -1.362549, -2.37957, 0, 1, 0.6039216, 1,
-0.1791668, 1.139767, -0.4626753, 0, 1, 0.6117647, 1,
-0.1749561, -0.3523386, -2.089677, 0, 1, 0.6156863, 1,
-0.1724388, -0.6520562, -1.811633, 0, 1, 0.6235294, 1,
-0.1705033, 1.81797, 1.316884, 0, 1, 0.627451, 1,
-0.163807, 1.43336, -1.761533, 0, 1, 0.6352941, 1,
-0.1616352, -0.08462615, -0.6466193, 0, 1, 0.6392157, 1,
-0.157914, 2.105475, -0.009634766, 0, 1, 0.6470588, 1,
-0.1574926, 1.611051, -0.9768338, 0, 1, 0.6509804, 1,
-0.156954, 0.6627387, -0.4125201, 0, 1, 0.6588235, 1,
-0.1523496, -2.117487, -3.585564, 0, 1, 0.6627451, 1,
-0.1522481, 0.6828873, -0.5520545, 0, 1, 0.6705883, 1,
-0.1484516, 0.7427592, -0.2761687, 0, 1, 0.6745098, 1,
-0.1474184, -0.3033722, -2.715319, 0, 1, 0.682353, 1,
-0.1424613, 0.5012608, -0.7982991, 0, 1, 0.6862745, 1,
-0.1397446, -1.158944, -2.831758, 0, 1, 0.6941177, 1,
-0.1379959, 2.148862, 0.5080779, 0, 1, 0.7019608, 1,
-0.1370289, 0.6042965, -2.300329, 0, 1, 0.7058824, 1,
-0.134367, -0.3041719, -2.585201, 0, 1, 0.7137255, 1,
-0.127135, 1.015558, 0.03378724, 0, 1, 0.7176471, 1,
-0.1240354, 0.6302962, -0.9456455, 0, 1, 0.7254902, 1,
-0.1223511, 0.3192466, -0.2662397, 0, 1, 0.7294118, 1,
-0.1218337, -0.04935328, -2.574766, 0, 1, 0.7372549, 1,
-0.1169514, -0.6621355, -4.277843, 0, 1, 0.7411765, 1,
-0.1163577, 0.9488057, -2.526672, 0, 1, 0.7490196, 1,
-0.1158708, 0.2795469, -0.9361849, 0, 1, 0.7529412, 1,
-0.1145268, 0.1529082, -0.5416609, 0, 1, 0.7607843, 1,
-0.1137863, 0.2035187, -1.66457, 0, 1, 0.7647059, 1,
-0.1131983, 1.08175, -0.869038, 0, 1, 0.772549, 1,
-0.11301, -0.4379386, -2.589355, 0, 1, 0.7764706, 1,
-0.1123811, 0.1531287, 0.6194633, 0, 1, 0.7843137, 1,
-0.1117491, 1.111804, -0.5336009, 0, 1, 0.7882353, 1,
-0.1032645, -1.482229, -2.323009, 0, 1, 0.7960784, 1,
-0.1026529, 2.640655, -0.01601882, 0, 1, 0.8039216, 1,
-0.1025557, 1.373041, 0.5223629, 0, 1, 0.8078431, 1,
-0.1020877, 0.2118915, -0.0857443, 0, 1, 0.8156863, 1,
-0.09601076, 2.095071, 0.05407387, 0, 1, 0.8196079, 1,
-0.09567789, 0.9512166, 1.307997, 0, 1, 0.827451, 1,
-0.09470611, -2.604604, -3.690894, 0, 1, 0.8313726, 1,
-0.09437129, -0.5715358, -4.346893, 0, 1, 0.8392157, 1,
-0.09125962, -0.2710214, -2.527682, 0, 1, 0.8431373, 1,
-0.09091983, 0.0646962, -0.3090305, 0, 1, 0.8509804, 1,
-0.08679292, 1.123477, 0.2760962, 0, 1, 0.854902, 1,
-0.08082031, -0.6038699, -3.501497, 0, 1, 0.8627451, 1,
-0.07981723, -0.05238419, -1.579397, 0, 1, 0.8666667, 1,
-0.07936783, -0.7617619, -4.679933, 0, 1, 0.8745098, 1,
-0.07903887, 0.5155501, 0.7150385, 0, 1, 0.8784314, 1,
-0.07885325, -0.9269002, -4.11832, 0, 1, 0.8862745, 1,
-0.07711694, -1.506955, -2.406605, 0, 1, 0.8901961, 1,
-0.07251801, -0.02960642, -2.301651, 0, 1, 0.8980392, 1,
-0.06670602, 0.4079308, -0.8973223, 0, 1, 0.9058824, 1,
-0.06182922, 0.3471406, -0.8913275, 0, 1, 0.9098039, 1,
-0.05994103, 1.348572, -0.09371255, 0, 1, 0.9176471, 1,
-0.05977102, -0.06369068, -3.880594, 0, 1, 0.9215686, 1,
-0.05439623, -0.5004991, -2.440265, 0, 1, 0.9294118, 1,
-0.05391239, -0.6269091, -3.336478, 0, 1, 0.9333333, 1,
-0.05194085, 0.340002, -0.5413014, 0, 1, 0.9411765, 1,
-0.05080346, -1.536618, -1.842704, 0, 1, 0.945098, 1,
-0.04670987, 0.2373662, -0.315304, 0, 1, 0.9529412, 1,
-0.04456821, -0.2912399, -5.399373, 0, 1, 0.9568627, 1,
-0.04145204, -0.0541586, -3.200509, 0, 1, 0.9647059, 1,
-0.04026556, -0.86271, -3.572326, 0, 1, 0.9686275, 1,
-0.03949235, 1.546462, 0.3048188, 0, 1, 0.9764706, 1,
-0.03401646, -0.7999696, -4.17274, 0, 1, 0.9803922, 1,
-0.03038781, -0.1038071, -2.458734, 0, 1, 0.9882353, 1,
-0.03024197, -1.238066, -2.604809, 0, 1, 0.9921569, 1,
-0.02914084, -0.7474286, -4.745734, 0, 1, 1, 1,
-0.02739009, 0.1410892, 0.3869945, 0, 0.9921569, 1, 1,
-0.02399369, 0.3773715, -0.07338756, 0, 0.9882353, 1, 1,
-0.02390263, -1.431666, -4.208106, 0, 0.9803922, 1, 1,
-0.02385603, -0.1394141, -2.841336, 0, 0.9764706, 1, 1,
-0.02286211, 0.7448389, -0.3761153, 0, 0.9686275, 1, 1,
-0.02229089, 0.6971819, 0.227426, 0, 0.9647059, 1, 1,
-0.01013668, -0.2307951, -4.478317, 0, 0.9568627, 1, 1,
-0.007843844, 0.5713833, -1.128473, 0, 0.9529412, 1, 1,
-0.003245554, 0.6056383, -0.09916935, 0, 0.945098, 1, 1,
-0.002752902, -0.6603963, -3.83878, 0, 0.9411765, 1, 1,
9.968396e-05, -0.8654891, 4.312355, 0, 0.9333333, 1, 1,
0.006152789, -0.1534486, 3.288208, 0, 0.9294118, 1, 1,
0.006649636, -0.4680001, 3.787516, 0, 0.9215686, 1, 1,
0.006948087, 0.06647058, -0.3169328, 0, 0.9176471, 1, 1,
0.01242985, -1.203761, 2.031814, 0, 0.9098039, 1, 1,
0.01693734, -0.9145855, 1.984579, 0, 0.9058824, 1, 1,
0.01765596, -0.8877919, 4.158762, 0, 0.8980392, 1, 1,
0.02133218, 0.8744717, -2.424795, 0, 0.8901961, 1, 1,
0.02275142, -0.2192124, 2.771177, 0, 0.8862745, 1, 1,
0.02795781, 1.458197, 0.6697193, 0, 0.8784314, 1, 1,
0.03254055, -0.65152, 1.941198, 0, 0.8745098, 1, 1,
0.03293712, 1.307908, 0.1484794, 0, 0.8666667, 1, 1,
0.03329968, 0.2931287, 1.227539, 0, 0.8627451, 1, 1,
0.03515684, -0.8708534, 2.563227, 0, 0.854902, 1, 1,
0.03628525, 1.372215, 0.7496287, 0, 0.8509804, 1, 1,
0.03824068, -1.143459, 2.91124, 0, 0.8431373, 1, 1,
0.04010977, 1.291425, -0.34025, 0, 0.8392157, 1, 1,
0.04899039, 1.049577, 0.9768604, 0, 0.8313726, 1, 1,
0.05259837, 0.1356855, 1.078334, 0, 0.827451, 1, 1,
0.05325361, -0.18085, 4.028392, 0, 0.8196079, 1, 1,
0.05493847, 0.5649262, -0.06178596, 0, 0.8156863, 1, 1,
0.05849505, 0.1336863, 0.1887028, 0, 0.8078431, 1, 1,
0.05878945, -1.282202, 3.900748, 0, 0.8039216, 1, 1,
0.06060822, 0.9693435, 0.1074729, 0, 0.7960784, 1, 1,
0.06118221, 0.8852475, -0.2181475, 0, 0.7882353, 1, 1,
0.06130561, -0.3226618, 3.742217, 0, 0.7843137, 1, 1,
0.06261621, 0.01103541, 2.109265, 0, 0.7764706, 1, 1,
0.06979278, 0.08277588, 0.0005101161, 0, 0.772549, 1, 1,
0.07261264, 1.252408, 0.2832328, 0, 0.7647059, 1, 1,
0.07712173, -1.630813, 2.337082, 0, 0.7607843, 1, 1,
0.07816027, 0.4826681, 0.4808181, 0, 0.7529412, 1, 1,
0.08033811, 0.9377133, -0.514618, 0, 0.7490196, 1, 1,
0.08276547, 1.108023, 2.190389, 0, 0.7411765, 1, 1,
0.09133235, 0.7403951, -0.8490755, 0, 0.7372549, 1, 1,
0.09184644, 0.2701608, -0.6140319, 0, 0.7294118, 1, 1,
0.09414276, 0.06800485, 1.976465, 0, 0.7254902, 1, 1,
0.09467251, -0.2030417, 1.894929, 0, 0.7176471, 1, 1,
0.09484481, 0.8961161, -1.154665, 0, 0.7137255, 1, 1,
0.09658053, 1.269837, 1.550225, 0, 0.7058824, 1, 1,
0.09709516, 0.9750041, 0.1271746, 0, 0.6980392, 1, 1,
0.09964357, -1.907297, 4.10282, 0, 0.6941177, 1, 1,
0.1017355, 0.5039498, 1.532863, 0, 0.6862745, 1, 1,
0.1041177, -0.3579794, 1.331415, 0, 0.682353, 1, 1,
0.1085399, 2.389933, 0.1151847, 0, 0.6745098, 1, 1,
0.1107925, 1.311304, -0.2762279, 0, 0.6705883, 1, 1,
0.1128983, -0.2008903, 2.985206, 0, 0.6627451, 1, 1,
0.1137442, 0.4245837, 1.199322, 0, 0.6588235, 1, 1,
0.1142264, -0.0001183035, 2.354339, 0, 0.6509804, 1, 1,
0.1167207, -0.1197812, 2.897184, 0, 0.6470588, 1, 1,
0.1221539, 2.104646, -0.4669585, 0, 0.6392157, 1, 1,
0.1251145, 0.9543984, 0.8283222, 0, 0.6352941, 1, 1,
0.1275613, 0.4781555, 0.6725973, 0, 0.627451, 1, 1,
0.1361867, -1.670501, 3.669232, 0, 0.6235294, 1, 1,
0.1367526, 0.1933051, 1.723704, 0, 0.6156863, 1, 1,
0.1374839, -0.8825536, 1.121709, 0, 0.6117647, 1, 1,
0.1383066, 0.5669903, 2.019557, 0, 0.6039216, 1, 1,
0.1393938, -0.7698478, 3.856942, 0, 0.5960785, 1, 1,
0.1404325, -0.7155352, 2.19783, 0, 0.5921569, 1, 1,
0.1429919, -0.2773742, 4.165748, 0, 0.5843138, 1, 1,
0.14339, -0.309708, 3.100988, 0, 0.5803922, 1, 1,
0.1497617, 0.8567069, -0.3369396, 0, 0.572549, 1, 1,
0.1497944, -0.8704463, 3.464154, 0, 0.5686275, 1, 1,
0.1536761, -0.7924413, 1.895062, 0, 0.5607843, 1, 1,
0.1542773, 0.1891618, 1.102064, 0, 0.5568628, 1, 1,
0.1547705, -0.783826, 4.325751, 0, 0.5490196, 1, 1,
0.1557741, -0.6237156, 4.750802, 0, 0.5450981, 1, 1,
0.1569982, -2.702218, 3.314935, 0, 0.5372549, 1, 1,
0.1578403, -0.8297718, 2.736072, 0, 0.5333334, 1, 1,
0.1601622, -0.8684618, 0.4993425, 0, 0.5254902, 1, 1,
0.1629938, -1.682174, 2.914217, 0, 0.5215687, 1, 1,
0.1645288, 0.5356302, -0.4594574, 0, 0.5137255, 1, 1,
0.1663525, 0.07685733, -0.7035702, 0, 0.509804, 1, 1,
0.1673604, -0.8374749, 2.541292, 0, 0.5019608, 1, 1,
0.1688355, -1.14017, 2.763338, 0, 0.4941176, 1, 1,
0.175406, -0.3167782, 1.542516, 0, 0.4901961, 1, 1,
0.17577, 0.8411031, 0.2614576, 0, 0.4823529, 1, 1,
0.177183, 0.4775523, 0.3400074, 0, 0.4784314, 1, 1,
0.177741, 0.4375212, -0.3279721, 0, 0.4705882, 1, 1,
0.1794612, -1.894581, 2.9052, 0, 0.4666667, 1, 1,
0.1805753, 0.4897579, 1.373774, 0, 0.4588235, 1, 1,
0.1835059, 0.8161626, -0.1408304, 0, 0.454902, 1, 1,
0.1891812, 0.7867579, 0.03147687, 0, 0.4470588, 1, 1,
0.1896014, -0.815551, 2.391883, 0, 0.4431373, 1, 1,
0.1916811, -0.2231892, 1.91751, 0, 0.4352941, 1, 1,
0.1919941, 1.848226, -0.07666051, 0, 0.4313726, 1, 1,
0.1929235, 0.3662857, 0.7456744, 0, 0.4235294, 1, 1,
0.1981858, -0.1071046, 2.24636, 0, 0.4196078, 1, 1,
0.2026202, 0.2384424, 0.2999447, 0, 0.4117647, 1, 1,
0.2037664, -0.5927688, 0.5342807, 0, 0.4078431, 1, 1,
0.2043165, -0.4137411, 2.310913, 0, 0.4, 1, 1,
0.2043447, -0.0530706, 0.004257481, 0, 0.3921569, 1, 1,
0.2111357, 0.3713146, 2.811478, 0, 0.3882353, 1, 1,
0.2137845, 1.2611, 1.256732, 0, 0.3803922, 1, 1,
0.217027, -0.7455241, 2.278011, 0, 0.3764706, 1, 1,
0.2212567, 1.117776, 0.5320147, 0, 0.3686275, 1, 1,
0.2218799, 3.338316, 2.157605, 0, 0.3647059, 1, 1,
0.2228365, -0.1943501, 4.37918, 0, 0.3568628, 1, 1,
0.2243113, -0.9635142, 3.902358, 0, 0.3529412, 1, 1,
0.2269562, 1.189676, 0.1516766, 0, 0.345098, 1, 1,
0.2273919, -0.7275949, 3.571779, 0, 0.3411765, 1, 1,
0.2285886, 1.964232, -1.23912, 0, 0.3333333, 1, 1,
0.2322593, 0.7227676, 2.211395, 0, 0.3294118, 1, 1,
0.2367221, 0.8820328, -1.357495, 0, 0.3215686, 1, 1,
0.2388094, -0.9568371, 4.585648, 0, 0.3176471, 1, 1,
0.2418136, -0.911564, 3.547639, 0, 0.3098039, 1, 1,
0.2452244, 0.03571439, 1.909287, 0, 0.3058824, 1, 1,
0.2465167, 0.7392708, 0.8209178, 0, 0.2980392, 1, 1,
0.250252, 1.448744, 1.152285, 0, 0.2901961, 1, 1,
0.251983, -0.107111, 1.659723, 0, 0.2862745, 1, 1,
0.2581973, -0.741623, 2.52897, 0, 0.2784314, 1, 1,
0.2617051, 2.005419, -1.068493, 0, 0.2745098, 1, 1,
0.261945, 0.9431091, 1.06283, 0, 0.2666667, 1, 1,
0.2657644, -1.182482, 3.551307, 0, 0.2627451, 1, 1,
0.2682329, 1.024006, 0.5108868, 0, 0.254902, 1, 1,
0.270229, -0.5417303, 3.511692, 0, 0.2509804, 1, 1,
0.2754042, 0.1320613, 0.600768, 0, 0.2431373, 1, 1,
0.2772661, 1.066119, -0.7698016, 0, 0.2392157, 1, 1,
0.2785048, -0.4967546, 3.697032, 0, 0.2313726, 1, 1,
0.2810709, -1.083504, 4.673985, 0, 0.227451, 1, 1,
0.2814153, -0.4111092, 3.167005, 0, 0.2196078, 1, 1,
0.2817991, -0.1061881, 3.033384, 0, 0.2156863, 1, 1,
0.2873505, -1.018392, 3.313881, 0, 0.2078431, 1, 1,
0.2887045, 0.3387909, -0.4497782, 0, 0.2039216, 1, 1,
0.2894167, -1.15712, 0.7397872, 0, 0.1960784, 1, 1,
0.2901598, 1.073444, 0.4003288, 0, 0.1882353, 1, 1,
0.2951953, 0.2673732, 2.25421, 0, 0.1843137, 1, 1,
0.2980039, 0.8022188, 0.6676884, 0, 0.1764706, 1, 1,
0.3106173, -0.9304195, 4.811563, 0, 0.172549, 1, 1,
0.3115208, -0.1387291, 3.018847, 0, 0.1647059, 1, 1,
0.3117956, -0.2392271, 2.999195, 0, 0.1607843, 1, 1,
0.3118258, 1.05338, 0.06424573, 0, 0.1529412, 1, 1,
0.3144744, 0.6966144, 0.8170692, 0, 0.1490196, 1, 1,
0.3225876, -0.3181546, 2.058332, 0, 0.1411765, 1, 1,
0.3229958, -1.735662, 3.323205, 0, 0.1372549, 1, 1,
0.3242391, -1.614617, 2.724613, 0, 0.1294118, 1, 1,
0.328138, 0.7901775, -1.397153, 0, 0.1254902, 1, 1,
0.3461512, -0.7810362, 1.350334, 0, 0.1176471, 1, 1,
0.3485118, 1.081295, -0.6294412, 0, 0.1137255, 1, 1,
0.3486478, 2.703522, 0.04679825, 0, 0.1058824, 1, 1,
0.3500414, -2.620381, 2.23028, 0, 0.09803922, 1, 1,
0.3531068, -0.002573052, 2.353518, 0, 0.09411765, 1, 1,
0.3531344, -0.3468497, 2.806123, 0, 0.08627451, 1, 1,
0.3541849, 1.027165, 1.395087, 0, 0.08235294, 1, 1,
0.3562058, -0.7097937, 3.336761, 0, 0.07450981, 1, 1,
0.3583148, -0.2737024, 3.076392, 0, 0.07058824, 1, 1,
0.358321, -0.7973985, 3.385522, 0, 0.0627451, 1, 1,
0.359241, 1.796384, 0.07048319, 0, 0.05882353, 1, 1,
0.3620847, 1.128805, 0.9417141, 0, 0.05098039, 1, 1,
0.36215, 0.08954511, 2.347087, 0, 0.04705882, 1, 1,
0.3642863, -0.2641828, 2.60886, 0, 0.03921569, 1, 1,
0.3669028, -0.7009394, 2.611161, 0, 0.03529412, 1, 1,
0.3735079, 0.07387581, 2.273316, 0, 0.02745098, 1, 1,
0.3735537, 0.6090469, 1.367771, 0, 0.02352941, 1, 1,
0.3746213, -0.5738116, 1.809454, 0, 0.01568628, 1, 1,
0.376582, 1.376392, 1.278891, 0, 0.01176471, 1, 1,
0.3777456, 0.4758965, 1.227332, 0, 0.003921569, 1, 1,
0.3781729, 0.8445418, 1.166325, 0.003921569, 0, 1, 1,
0.3782908, -0.1255444, 1.815908, 0.007843138, 0, 1, 1,
0.3818592, -0.9197659, 3.535179, 0.01568628, 0, 1, 1,
0.3829224, -0.4236804, 1.225779, 0.01960784, 0, 1, 1,
0.3887545, 0.7910913, -0.1709844, 0.02745098, 0, 1, 1,
0.3909284, 1.313467, -1.519325, 0.03137255, 0, 1, 1,
0.3919622, 0.4047189, -0.3492484, 0.03921569, 0, 1, 1,
0.3930353, 1.272448, 1.369206, 0.04313726, 0, 1, 1,
0.394035, -0.4510473, 2.251833, 0.05098039, 0, 1, 1,
0.3965215, -0.9506961, 3.163309, 0.05490196, 0, 1, 1,
0.3968919, 1.433984, -0.345649, 0.0627451, 0, 1, 1,
0.3983926, -2.031296, 2.518805, 0.06666667, 0, 1, 1,
0.4026897, 0.3723558, 0.06253138, 0.07450981, 0, 1, 1,
0.405009, -0.7562672, 2.318022, 0.07843138, 0, 1, 1,
0.4106455, -1.176765, 2.441933, 0.08627451, 0, 1, 1,
0.4121727, 2.087213, 0.7335406, 0.09019608, 0, 1, 1,
0.4147367, 1.062219, 1.02426, 0.09803922, 0, 1, 1,
0.4174065, 0.4858195, -1.215117, 0.1058824, 0, 1, 1,
0.4175951, -2.478585, 3.285751, 0.1098039, 0, 1, 1,
0.4208168, 1.046569, -0.07273389, 0.1176471, 0, 1, 1,
0.4209408, -1.838779, 2.167766, 0.1215686, 0, 1, 1,
0.4210834, 0.1719147, 0.8040384, 0.1294118, 0, 1, 1,
0.4284299, -1.17808, 2.77829, 0.1333333, 0, 1, 1,
0.4308134, 1.507221, 1.121338, 0.1411765, 0, 1, 1,
0.4316049, -0.7739079, 2.888113, 0.145098, 0, 1, 1,
0.4368119, -0.4187296, 3.50244, 0.1529412, 0, 1, 1,
0.437333, 0.5789265, 1.143966, 0.1568628, 0, 1, 1,
0.4382538, 2.630079, -0.2220074, 0.1647059, 0, 1, 1,
0.4417035, 0.9787104, -0.8625521, 0.1686275, 0, 1, 1,
0.4439682, -1.543895, 2.354399, 0.1764706, 0, 1, 1,
0.444463, -1.133734, 5.048199, 0.1803922, 0, 1, 1,
0.4475977, -0.0283997, 0.8836064, 0.1882353, 0, 1, 1,
0.4489228, 1.116328, 1.625858, 0.1921569, 0, 1, 1,
0.4506345, -0.6290812, 1.344158, 0.2, 0, 1, 1,
0.4545931, 0.6215462, 2.218305, 0.2078431, 0, 1, 1,
0.4585359, 1.12198, 1.270388, 0.2117647, 0, 1, 1,
0.4654309, -2.279981, 1.951442, 0.2196078, 0, 1, 1,
0.4676618, 0.8961427, 0.9011899, 0.2235294, 0, 1, 1,
0.4709056, -0.01016355, 1.403918, 0.2313726, 0, 1, 1,
0.4748306, -1.645512, 1.917913, 0.2352941, 0, 1, 1,
0.4788662, -0.7019253, 1.712742, 0.2431373, 0, 1, 1,
0.4802997, -0.864764, 3.051056, 0.2470588, 0, 1, 1,
0.4852746, -1.23061, 2.231648, 0.254902, 0, 1, 1,
0.4860374, -0.009833707, 1.360155, 0.2588235, 0, 1, 1,
0.4866296, 1.036862, -1.349459, 0.2666667, 0, 1, 1,
0.4871084, 0.1617688, 2.10043, 0.2705882, 0, 1, 1,
0.4919373, -0.002514604, 1.075911, 0.2784314, 0, 1, 1,
0.4964994, 1.298985, 0.9399995, 0.282353, 0, 1, 1,
0.4995664, 1.386851, 0.8020177, 0.2901961, 0, 1, 1,
0.5038444, 1.333984, -1.378158, 0.2941177, 0, 1, 1,
0.5046467, -0.5589052, 2.733565, 0.3019608, 0, 1, 1,
0.5048534, -0.0001821461, 3.17374, 0.3098039, 0, 1, 1,
0.5065496, -0.05126732, 2.194341, 0.3137255, 0, 1, 1,
0.5108974, -0.4979662, 1.924785, 0.3215686, 0, 1, 1,
0.5114001, -1.143375, 3.146362, 0.3254902, 0, 1, 1,
0.5129991, -0.5438789, 1.316017, 0.3333333, 0, 1, 1,
0.5131917, 2.095016, -0.6256062, 0.3372549, 0, 1, 1,
0.5133811, 1.053954, -0.9909894, 0.345098, 0, 1, 1,
0.5147943, 1.248721, 1.148716, 0.3490196, 0, 1, 1,
0.5201942, 0.2912094, 0.6394612, 0.3568628, 0, 1, 1,
0.5221772, 1.722835, 1.311154, 0.3607843, 0, 1, 1,
0.5236735, 1.198905, -0.7362476, 0.3686275, 0, 1, 1,
0.5269872, -1.522359, 1.273481, 0.372549, 0, 1, 1,
0.5318588, 0.6045417, 0.2906694, 0.3803922, 0, 1, 1,
0.5356924, -0.1007136, 2.475233, 0.3843137, 0, 1, 1,
0.5417747, -0.2810867, 2.65985, 0.3921569, 0, 1, 1,
0.5496628, 0.613944, -0.602094, 0.3960784, 0, 1, 1,
0.5543333, 0.5665711, 0.4733182, 0.4039216, 0, 1, 1,
0.5593675, 0.803997, 0.4740364, 0.4117647, 0, 1, 1,
0.5656633, -0.5661024, 2.16183, 0.4156863, 0, 1, 1,
0.5658138, 0.4279661, 0.9009205, 0.4235294, 0, 1, 1,
0.5660338, 0.2373318, -0.8686143, 0.427451, 0, 1, 1,
0.5759526, -2.370266, 4.290701, 0.4352941, 0, 1, 1,
0.5795022, -0.09318403, 3.174263, 0.4392157, 0, 1, 1,
0.585288, -2.06415, 1.929551, 0.4470588, 0, 1, 1,
0.5876646, -0.08256985, 0.2959581, 0.4509804, 0, 1, 1,
0.5877054, 0.3261962, 1.998455, 0.4588235, 0, 1, 1,
0.5905394, -0.1141219, 0.9688917, 0.4627451, 0, 1, 1,
0.5905578, 1.037568, 1.985676, 0.4705882, 0, 1, 1,
0.5950786, -1.118507, 2.70211, 0.4745098, 0, 1, 1,
0.5954826, 0.9676633, 1.540545, 0.4823529, 0, 1, 1,
0.5968497, 3.152686, 0.5488312, 0.4862745, 0, 1, 1,
0.5980446, -0.439742, 2.910263, 0.4941176, 0, 1, 1,
0.6023117, 0.1892404, 0.4342987, 0.5019608, 0, 1, 1,
0.6031885, 1.363415, 0.9907307, 0.5058824, 0, 1, 1,
0.6044536, -0.2771685, 0.3314039, 0.5137255, 0, 1, 1,
0.616527, 0.8210092, -0.7903572, 0.5176471, 0, 1, 1,
0.6174424, 1.551968, 0.9294304, 0.5254902, 0, 1, 1,
0.6240391, -0.2264986, 1.813113, 0.5294118, 0, 1, 1,
0.6298077, -0.6101661, 0.933042, 0.5372549, 0, 1, 1,
0.6307993, 0.1883284, 0.8872241, 0.5411765, 0, 1, 1,
0.6333885, 0.3472986, 2.276042, 0.5490196, 0, 1, 1,
0.6588258, -0.2918548, 2.713089, 0.5529412, 0, 1, 1,
0.6607395, 1.850943, 2.378172, 0.5607843, 0, 1, 1,
0.6682339, -0.3245942, 2.948247, 0.5647059, 0, 1, 1,
0.6708475, -0.6542439, 3.474139, 0.572549, 0, 1, 1,
0.679675, -0.4377911, 0.5869383, 0.5764706, 0, 1, 1,
0.686987, 0.1226753, 0.9558178, 0.5843138, 0, 1, 1,
0.6878854, 1.452891, 1.029021, 0.5882353, 0, 1, 1,
0.6922654, -0.8614553, 0.9459667, 0.5960785, 0, 1, 1,
0.6931546, 1.039602, 0.250931, 0.6039216, 0, 1, 1,
0.6936259, 0.1612042, 0.4676265, 0.6078432, 0, 1, 1,
0.6971229, -2.873825, 2.965762, 0.6156863, 0, 1, 1,
0.7045279, 0.2826798, 1.613836, 0.6196079, 0, 1, 1,
0.7090923, 0.2618785, 2.004968, 0.627451, 0, 1, 1,
0.7107597, 0.7522132, -1.192407, 0.6313726, 0, 1, 1,
0.7134968, 0.8173992, 0.6311028, 0.6392157, 0, 1, 1,
0.720814, 0.04704267, 0.8194611, 0.6431373, 0, 1, 1,
0.7293789, 1.690321, 0.6178799, 0.6509804, 0, 1, 1,
0.7307413, -1.758387, 1.992071, 0.654902, 0, 1, 1,
0.7380285, 0.01448881, 1.033392, 0.6627451, 0, 1, 1,
0.7391185, 0.3496614, 0.2490577, 0.6666667, 0, 1, 1,
0.7431263, 0.3954353, 1.689586, 0.6745098, 0, 1, 1,
0.7440842, 0.03337814, 0.1320632, 0.6784314, 0, 1, 1,
0.745746, -1.345797, 4.691731, 0.6862745, 0, 1, 1,
0.7460092, 0.4324357, 1.60006, 0.6901961, 0, 1, 1,
0.7476808, -0.9590098, 2.2744, 0.6980392, 0, 1, 1,
0.7480155, -0.5575093, 2.021702, 0.7058824, 0, 1, 1,
0.7492285, -1.154401, 4.222128, 0.7098039, 0, 1, 1,
0.7509648, -0.3152089, 2.726961, 0.7176471, 0, 1, 1,
0.7542453, -0.3701594, 1.677138, 0.7215686, 0, 1, 1,
0.7550344, -0.1300848, 3.398128, 0.7294118, 0, 1, 1,
0.7550443, 0.2071265, 0.7372704, 0.7333333, 0, 1, 1,
0.7601589, -0.04375578, 0.8702973, 0.7411765, 0, 1, 1,
0.7621534, 1.567572, 0.8240736, 0.7450981, 0, 1, 1,
0.7670822, -0.1600817, 2.915716, 0.7529412, 0, 1, 1,
0.7747212, 0.5193632, 1.541826, 0.7568628, 0, 1, 1,
0.7767838, -1.443321, 2.780482, 0.7647059, 0, 1, 1,
0.7779049, 0.7081141, 0.4229001, 0.7686275, 0, 1, 1,
0.7817663, 0.4424049, -1.063938, 0.7764706, 0, 1, 1,
0.7897506, 1.315516, 0.7965175, 0.7803922, 0, 1, 1,
0.7942594, -0.5063804, 4.124226, 0.7882353, 0, 1, 1,
0.8038013, -0.64529, 1.499316, 0.7921569, 0, 1, 1,
0.8139735, 1.816336, 0.1396874, 0.8, 0, 1, 1,
0.8171721, -1.02789, 3.464599, 0.8078431, 0, 1, 1,
0.8196409, -0.5398528, -0.2300033, 0.8117647, 0, 1, 1,
0.8212932, -0.1602364, 2.625369, 0.8196079, 0, 1, 1,
0.8227356, -0.04081948, 0.5686396, 0.8235294, 0, 1, 1,
0.8237732, -0.6302996, 1.764927, 0.8313726, 0, 1, 1,
0.8274353, -0.2840554, 2.028783, 0.8352941, 0, 1, 1,
0.8306627, 1.270823, -0.3678276, 0.8431373, 0, 1, 1,
0.8314783, 0.5635929, 1.691882, 0.8470588, 0, 1, 1,
0.8386427, 0.3318826, 1.862478, 0.854902, 0, 1, 1,
0.8419977, -0.01201429, 2.311849, 0.8588235, 0, 1, 1,
0.8452734, -0.01973048, 2.376935, 0.8666667, 0, 1, 1,
0.8535523, -0.6020299, 3.561621, 0.8705882, 0, 1, 1,
0.856667, -0.4593617, 1.199911, 0.8784314, 0, 1, 1,
0.8567082, 0.6937706, 2.552171, 0.8823529, 0, 1, 1,
0.8582295, 0.3374419, 1.446037, 0.8901961, 0, 1, 1,
0.8612652, -0.1317247, 0.8551318, 0.8941177, 0, 1, 1,
0.865836, -0.1135553, 1.624342, 0.9019608, 0, 1, 1,
0.8676929, 1.314708, -0.8448282, 0.9098039, 0, 1, 1,
0.8711546, 0.0624628, 2.933565, 0.9137255, 0, 1, 1,
0.8716004, 1.818637, 0.7170449, 0.9215686, 0, 1, 1,
0.8757681, -0.05911992, 1.188221, 0.9254902, 0, 1, 1,
0.8758222, -0.7721391, 4.056436, 0.9333333, 0, 1, 1,
0.8765141, -1.888607, 3.253417, 0.9372549, 0, 1, 1,
0.8782812, 0.4162552, 1.015001, 0.945098, 0, 1, 1,
0.8809162, 1.932354, 1.863548, 0.9490196, 0, 1, 1,
0.8860427, -0.4010269, 1.45842, 0.9568627, 0, 1, 1,
0.8886093, -0.6820959, 4.174614, 0.9607843, 0, 1, 1,
0.8889453, 0.7365102, -0.4653813, 0.9686275, 0, 1, 1,
0.8908617, -1.061677, 2.417543, 0.972549, 0, 1, 1,
0.9055021, -0.5522609, 1.294181, 0.9803922, 0, 1, 1,
0.9061557, 0.5053923, 1.553497, 0.9843137, 0, 1, 1,
0.9099138, 0.3552073, 2.004348, 0.9921569, 0, 1, 1,
0.9216217, 0.05101639, 2.74522, 0.9960784, 0, 1, 1,
0.9230757, -1.125661, 3.032253, 1, 0, 0.9960784, 1,
0.9285212, -0.549909, 2.241791, 1, 0, 0.9882353, 1,
0.9304078, -0.8904226, 3.885677, 1, 0, 0.9843137, 1,
0.9480908, -0.2625906, 2.438508, 1, 0, 0.9764706, 1,
0.9556237, 0.1604265, -0.3955222, 1, 0, 0.972549, 1,
0.9573072, 0.7711366, -0.03559938, 1, 0, 0.9647059, 1,
0.9669017, -1.210715, 2.392452, 1, 0, 0.9607843, 1,
0.9769664, -1.906074, 5.409579, 1, 0, 0.9529412, 1,
0.9770257, 0.6979486, 0.7054536, 1, 0, 0.9490196, 1,
0.9873603, 0.3280392, 3.434098, 1, 0, 0.9411765, 1,
0.9907016, 0.04055284, 0.8107293, 1, 0, 0.9372549, 1,
0.9913258, -0.6215407, 2.018826, 1, 0, 0.9294118, 1,
1.00167, 0.9997349, -0.5836498, 1, 0, 0.9254902, 1,
1.009944, -0.4283692, 1.139416, 1, 0, 0.9176471, 1,
1.011967, -0.1580606, 0.8853811, 1, 0, 0.9137255, 1,
1.016883, -0.6524177, 2.681073, 1, 0, 0.9058824, 1,
1.020458, -0.1350182, 2.082222, 1, 0, 0.9019608, 1,
1.027308, -0.3658392, 2.498185, 1, 0, 0.8941177, 1,
1.029816, 0.3087194, 3.476268, 1, 0, 0.8862745, 1,
1.030103, 0.3471066, 2.469108, 1, 0, 0.8823529, 1,
1.03473, -0.8100926, 2.91327, 1, 0, 0.8745098, 1,
1.035618, -0.07201141, 2.003664, 1, 0, 0.8705882, 1,
1.038054, -0.6059795, 2.525083, 1, 0, 0.8627451, 1,
1.038888, 0.8752242, 0.05573415, 1, 0, 0.8588235, 1,
1.044621, -2.42326, 3.819113, 1, 0, 0.8509804, 1,
1.046916, -1.992341, 1.675276, 1, 0, 0.8470588, 1,
1.047318, 0.2229791, 0.8873489, 1, 0, 0.8392157, 1,
1.060355, -1.382518, 3.26362, 1, 0, 0.8352941, 1,
1.061639, 1.443509, 1.410795, 1, 0, 0.827451, 1,
1.062262, 0.3029773, 2.15655, 1, 0, 0.8235294, 1,
1.0623, -0.2811619, 1.868316, 1, 0, 0.8156863, 1,
1.075366, -0.623681, 2.256629, 1, 0, 0.8117647, 1,
1.083831, -0.8003673, 2.659473, 1, 0, 0.8039216, 1,
1.08646, -0.01277114, 0.7436364, 1, 0, 0.7960784, 1,
1.08657, -1.848939, 2.790274, 1, 0, 0.7921569, 1,
1.088324, -0.3321209, 2.997414, 1, 0, 0.7843137, 1,
1.089704, 0.285406, 2.052615, 1, 0, 0.7803922, 1,
1.090062, -0.3617785, 2.768116, 1, 0, 0.772549, 1,
1.097999, 0.06224278, 2.799303, 1, 0, 0.7686275, 1,
1.101362, -2.268573, 1.558721, 1, 0, 0.7607843, 1,
1.101776, 0.2653725, 0.4366191, 1, 0, 0.7568628, 1,
1.103806, -0.1339546, 1.548373, 1, 0, 0.7490196, 1,
1.109878, -0.07421479, 3.398433, 1, 0, 0.7450981, 1,
1.113013, -1.163578, 2.767388, 1, 0, 0.7372549, 1,
1.11508, 0.9236566, 1.589117, 1, 0, 0.7333333, 1,
1.117149, -2.148089, 1.852672, 1, 0, 0.7254902, 1,
1.137876, -0.268833, 2.947913, 1, 0, 0.7215686, 1,
1.140192, 0.04351788, 0.2413242, 1, 0, 0.7137255, 1,
1.140265, -0.3261423, 3.18745, 1, 0, 0.7098039, 1,
1.14505, 0.1539701, 3.656738, 1, 0, 0.7019608, 1,
1.153431, 0.8604195, -1.243809, 1, 0, 0.6941177, 1,
1.197564, -0.967199, 3.553304, 1, 0, 0.6901961, 1,
1.201913, 0.4124101, 1.527385, 1, 0, 0.682353, 1,
1.208697, -0.6757649, 1.921391, 1, 0, 0.6784314, 1,
1.21403, 0.1567474, 2.032971, 1, 0, 0.6705883, 1,
1.216516, 0.08924703, 1.193986, 1, 0, 0.6666667, 1,
1.227193, -0.7896321, 2.465056, 1, 0, 0.6588235, 1,
1.227883, -1.421202, 2.245245, 1, 0, 0.654902, 1,
1.244797, 1.975681, 0.4041969, 1, 0, 0.6470588, 1,
1.247029, 0.4174052, 0.01228384, 1, 0, 0.6431373, 1,
1.249274, 1.282173, 1.129592, 1, 0, 0.6352941, 1,
1.252088, 1.117515, -0.0809155, 1, 0, 0.6313726, 1,
1.2617, 1.29101, 1.007453, 1, 0, 0.6235294, 1,
1.262623, 0.6407372, 0.2809691, 1, 0, 0.6196079, 1,
1.264274, 0.540204, 1.922177, 1, 0, 0.6117647, 1,
1.264437, -1.622476, 2.947148, 1, 0, 0.6078432, 1,
1.285424, 0.487743, 2.193967, 1, 0, 0.6, 1,
1.294642, 0.2750096, 1.537151, 1, 0, 0.5921569, 1,
1.302751, 1.338047, 0.1206167, 1, 0, 0.5882353, 1,
1.30419, -1.192175, 4.378328, 1, 0, 0.5803922, 1,
1.305122, 0.2174128, 0.7200907, 1, 0, 0.5764706, 1,
1.305784, -0.09927216, 4.367635, 1, 0, 0.5686275, 1,
1.312074, 0.2211447, 0.4177876, 1, 0, 0.5647059, 1,
1.313274, 0.4499353, 1.508828, 1, 0, 0.5568628, 1,
1.319899, 1.173302, 1.427958, 1, 0, 0.5529412, 1,
1.321361, -0.5471322, 1.526564, 1, 0, 0.5450981, 1,
1.322591, 0.4764012, 2.419878, 1, 0, 0.5411765, 1,
1.337401, 0.1149741, 1.500194, 1, 0, 0.5333334, 1,
1.340946, 0.2789129, 0.6680748, 1, 0, 0.5294118, 1,
1.345712, 1.076909, -0.1413094, 1, 0, 0.5215687, 1,
1.363222, 0.2526698, 1.760629, 1, 0, 0.5176471, 1,
1.368961, 0.3885707, 1.247131, 1, 0, 0.509804, 1,
1.370326, 0.04108761, 1.575717, 1, 0, 0.5058824, 1,
1.376184, -0.874322, 1.762951, 1, 0, 0.4980392, 1,
1.388034, -1.451877, 1.935, 1, 0, 0.4901961, 1,
1.399805, -2.68761, 0.6673146, 1, 0, 0.4862745, 1,
1.406526, -0.8535674, 2.453909, 1, 0, 0.4784314, 1,
1.407794, -0.1185803, 2.084043, 1, 0, 0.4745098, 1,
1.41198, -0.8590334, 2.257063, 1, 0, 0.4666667, 1,
1.413387, 0.6829448, -1.045941, 1, 0, 0.4627451, 1,
1.418816, -1.238591, 3.122993, 1, 0, 0.454902, 1,
1.428068, -1.046038, 3.579315, 1, 0, 0.4509804, 1,
1.43141, -0.4724677, 2.086302, 1, 0, 0.4431373, 1,
1.440388, 1.511676, 0.8148232, 1, 0, 0.4392157, 1,
1.443212, 1.155107, 2.790292, 1, 0, 0.4313726, 1,
1.445157, 0.6057237, 1.817255, 1, 0, 0.427451, 1,
1.452454, 0.2457305, 0.2146646, 1, 0, 0.4196078, 1,
1.468578, -1.272829, 1.688946, 1, 0, 0.4156863, 1,
1.473502, 0.6402754, 0.9248932, 1, 0, 0.4078431, 1,
1.474314, 1.439237, 1.948279, 1, 0, 0.4039216, 1,
1.476559, -0.1703069, -0.3916873, 1, 0, 0.3960784, 1,
1.479841, 1.169088, 0.6073257, 1, 0, 0.3882353, 1,
1.49772, -0.702001, 2.765889, 1, 0, 0.3843137, 1,
1.498013, 0.5974483, 1.061697, 1, 0, 0.3764706, 1,
1.499043, 0.963128, 1.095482, 1, 0, 0.372549, 1,
1.507015, -0.2346308, 1.676267, 1, 0, 0.3647059, 1,
1.515353, -0.4774292, 1.662467, 1, 0, 0.3607843, 1,
1.517619, -0.1692012, 3.384182, 1, 0, 0.3529412, 1,
1.531271, -0.08949517, 3.589042, 1, 0, 0.3490196, 1,
1.54026, -0.3901921, 1.856466, 1, 0, 0.3411765, 1,
1.559972, -0.7462566, 1.755641, 1, 0, 0.3372549, 1,
1.592366, 0.6168911, 1.283031, 1, 0, 0.3294118, 1,
1.60343, 0.2966825, 1.423639, 1, 0, 0.3254902, 1,
1.607903, 1.228091, 1.742375, 1, 0, 0.3176471, 1,
1.626693, -2.601101, 1.304595, 1, 0, 0.3137255, 1,
1.641079, 0.9170331, 1.010101, 1, 0, 0.3058824, 1,
1.652061, -0.5091395, 1.342286, 1, 0, 0.2980392, 1,
1.661395, 0.276042, 1.586363, 1, 0, 0.2941177, 1,
1.666659, 1.251547, 1.152274, 1, 0, 0.2862745, 1,
1.696657, 1.697944, 0.1196783, 1, 0, 0.282353, 1,
1.7139, 0.3271908, 1.158278, 1, 0, 0.2745098, 1,
1.730538, -0.8091298, 2.360534, 1, 0, 0.2705882, 1,
1.738055, 0.9970651, 2.016773, 1, 0, 0.2627451, 1,
1.755437, -0.5849407, 1.870564, 1, 0, 0.2588235, 1,
1.759529, -0.03832268, 1.890705, 1, 0, 0.2509804, 1,
1.763624, 0.8308139, 1.088216, 1, 0, 0.2470588, 1,
1.782696, -0.0609745, 3.386061, 1, 0, 0.2392157, 1,
1.796074, -1.938149, 2.613151, 1, 0, 0.2352941, 1,
1.799961, 0.8301401, 0.2824186, 1, 0, 0.227451, 1,
1.806021, -0.9136406, 3.044481, 1, 0, 0.2235294, 1,
1.833166, 1.286328, 1.88961, 1, 0, 0.2156863, 1,
1.841054, 0.4893754, 1.491534, 1, 0, 0.2117647, 1,
1.844449, 0.6864212, 1.026991, 1, 0, 0.2039216, 1,
1.848573, -1.006186, 2.745876, 1, 0, 0.1960784, 1,
1.863075, -1.004928, 0.8292992, 1, 0, 0.1921569, 1,
1.88835, 0.004502149, 1.412635, 1, 0, 0.1843137, 1,
1.904713, 0.05205779, 0.5503808, 1, 0, 0.1803922, 1,
1.909124, -0.1269543, 1.116916, 1, 0, 0.172549, 1,
1.917108, 1.763245, 1.168914, 1, 0, 0.1686275, 1,
1.930244, 1.790188, 1.136296, 1, 0, 0.1607843, 1,
1.934302, 0.259879, 1.028173, 1, 0, 0.1568628, 1,
1.948119, 1.495526, 0.5392505, 1, 0, 0.1490196, 1,
1.950843, 2.581839, 2.670425, 1, 0, 0.145098, 1,
1.98345, -1.23145, 3.09896, 1, 0, 0.1372549, 1,
2.004705, 0.7815768, -0.0826268, 1, 0, 0.1333333, 1,
2.017656, -0.6372638, 1.616536, 1, 0, 0.1254902, 1,
2.024311, -0.317226, 2.065692, 1, 0, 0.1215686, 1,
2.041455, -0.3836906, 1.428668, 1, 0, 0.1137255, 1,
2.052688, 0.07298604, 1.818384, 1, 0, 0.1098039, 1,
2.098342, 0.4432225, 1.900809, 1, 0, 0.1019608, 1,
2.106826, -0.6049942, 1.798375, 1, 0, 0.09411765, 1,
2.140809, 0.06561436, 2.312359, 1, 0, 0.09019608, 1,
2.214224, 2.410695, 2.17784, 1, 0, 0.08235294, 1,
2.252256, 0.1079701, 0.4314562, 1, 0, 0.07843138, 1,
2.253482, 0.62994, 1.307657, 1, 0, 0.07058824, 1,
2.290536, -0.2212176, 0.8291271, 1, 0, 0.06666667, 1,
2.356298, -0.6872847, 1.306646, 1, 0, 0.05882353, 1,
2.41029, 0.1681752, -0.558354, 1, 0, 0.05490196, 1,
2.42937, -0.5979921, 1.261151, 1, 0, 0.04705882, 1,
2.459101, 1.168099, 0.734382, 1, 0, 0.04313726, 1,
2.545584, -0.2715332, 1.710164, 1, 0, 0.03529412, 1,
2.548832, -2.575589, 3.744823, 1, 0, 0.03137255, 1,
2.624602, 0.212799, -0.08880414, 1, 0, 0.02352941, 1,
2.831665, 0.5830835, 0.09875964, 1, 0, 0.01960784, 1,
3.230083, -0.05261924, 2.5291, 1, 0, 0.01176471, 1,
3.266207, 0.6873304, 1.944244, 1, 0, 0.007843138, 1
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
-0.1108766, -3.942954, -7.499577, 0, -0.5, 0.5, 0.5,
-0.1108766, -3.942954, -7.499577, 1, -0.5, 0.5, 0.5,
-0.1108766, -3.942954, -7.499577, 1, 1.5, 0.5, 0.5,
-0.1108766, -3.942954, -7.499577, 0, 1.5, 0.5, 0.5
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
-4.632791, 0.2799472, -7.499577, 0, -0.5, 0.5, 0.5,
-4.632791, 0.2799472, -7.499577, 1, -0.5, 0.5, 0.5,
-4.632791, 0.2799472, -7.499577, 1, 1.5, 0.5, 0.5,
-4.632791, 0.2799472, -7.499577, 0, 1.5, 0.5, 0.5
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
-4.632791, -3.942954, -0.1095126, 0, -0.5, 0.5, 0.5,
-4.632791, -3.942954, -0.1095126, 1, -0.5, 0.5, 0.5,
-4.632791, -3.942954, -0.1095126, 1, 1.5, 0.5, 0.5,
-4.632791, -3.942954, -0.1095126, 0, 1.5, 0.5, 0.5
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
-3, -2.968438, -5.794177,
3, -2.968438, -5.794177,
-3, -2.968438, -5.794177,
-3, -3.130857, -6.078411,
-2, -2.968438, -5.794177,
-2, -3.130857, -6.078411,
-1, -2.968438, -5.794177,
-1, -3.130857, -6.078411,
0, -2.968438, -5.794177,
0, -3.130857, -6.078411,
1, -2.968438, -5.794177,
1, -3.130857, -6.078411,
2, -2.968438, -5.794177,
2, -3.130857, -6.078411,
3, -2.968438, -5.794177,
3, -3.130857, -6.078411
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
-3, -3.455696, -6.646877, 0, -0.5, 0.5, 0.5,
-3, -3.455696, -6.646877, 1, -0.5, 0.5, 0.5,
-3, -3.455696, -6.646877, 1, 1.5, 0.5, 0.5,
-3, -3.455696, -6.646877, 0, 1.5, 0.5, 0.5,
-2, -3.455696, -6.646877, 0, -0.5, 0.5, 0.5,
-2, -3.455696, -6.646877, 1, -0.5, 0.5, 0.5,
-2, -3.455696, -6.646877, 1, 1.5, 0.5, 0.5,
-2, -3.455696, -6.646877, 0, 1.5, 0.5, 0.5,
-1, -3.455696, -6.646877, 0, -0.5, 0.5, 0.5,
-1, -3.455696, -6.646877, 1, -0.5, 0.5, 0.5,
-1, -3.455696, -6.646877, 1, 1.5, 0.5, 0.5,
-1, -3.455696, -6.646877, 0, 1.5, 0.5, 0.5,
0, -3.455696, -6.646877, 0, -0.5, 0.5, 0.5,
0, -3.455696, -6.646877, 1, -0.5, 0.5, 0.5,
0, -3.455696, -6.646877, 1, 1.5, 0.5, 0.5,
0, -3.455696, -6.646877, 0, 1.5, 0.5, 0.5,
1, -3.455696, -6.646877, 0, -0.5, 0.5, 0.5,
1, -3.455696, -6.646877, 1, -0.5, 0.5, 0.5,
1, -3.455696, -6.646877, 1, 1.5, 0.5, 0.5,
1, -3.455696, -6.646877, 0, 1.5, 0.5, 0.5,
2, -3.455696, -6.646877, 0, -0.5, 0.5, 0.5,
2, -3.455696, -6.646877, 1, -0.5, 0.5, 0.5,
2, -3.455696, -6.646877, 1, 1.5, 0.5, 0.5,
2, -3.455696, -6.646877, 0, 1.5, 0.5, 0.5,
3, -3.455696, -6.646877, 0, -0.5, 0.5, 0.5,
3, -3.455696, -6.646877, 1, -0.5, 0.5, 0.5,
3, -3.455696, -6.646877, 1, 1.5, 0.5, 0.5,
3, -3.455696, -6.646877, 0, 1.5, 0.5, 0.5
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
-3.589272, -2, -5.794177,
-3.589272, 3, -5.794177,
-3.589272, -2, -5.794177,
-3.763192, -2, -6.078411,
-3.589272, -1, -5.794177,
-3.763192, -1, -6.078411,
-3.589272, 0, -5.794177,
-3.763192, 0, -6.078411,
-3.589272, 1, -5.794177,
-3.763192, 1, -6.078411,
-3.589272, 2, -5.794177,
-3.763192, 2, -6.078411,
-3.589272, 3, -5.794177,
-3.763192, 3, -6.078411
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
-4.111032, -2, -6.646877, 0, -0.5, 0.5, 0.5,
-4.111032, -2, -6.646877, 1, -0.5, 0.5, 0.5,
-4.111032, -2, -6.646877, 1, 1.5, 0.5, 0.5,
-4.111032, -2, -6.646877, 0, 1.5, 0.5, 0.5,
-4.111032, -1, -6.646877, 0, -0.5, 0.5, 0.5,
-4.111032, -1, -6.646877, 1, -0.5, 0.5, 0.5,
-4.111032, -1, -6.646877, 1, 1.5, 0.5, 0.5,
-4.111032, -1, -6.646877, 0, 1.5, 0.5, 0.5,
-4.111032, 0, -6.646877, 0, -0.5, 0.5, 0.5,
-4.111032, 0, -6.646877, 1, -0.5, 0.5, 0.5,
-4.111032, 0, -6.646877, 1, 1.5, 0.5, 0.5,
-4.111032, 0, -6.646877, 0, 1.5, 0.5, 0.5,
-4.111032, 1, -6.646877, 0, -0.5, 0.5, 0.5,
-4.111032, 1, -6.646877, 1, -0.5, 0.5, 0.5,
-4.111032, 1, -6.646877, 1, 1.5, 0.5, 0.5,
-4.111032, 1, -6.646877, 0, 1.5, 0.5, 0.5,
-4.111032, 2, -6.646877, 0, -0.5, 0.5, 0.5,
-4.111032, 2, -6.646877, 1, -0.5, 0.5, 0.5,
-4.111032, 2, -6.646877, 1, 1.5, 0.5, 0.5,
-4.111032, 2, -6.646877, 0, 1.5, 0.5, 0.5,
-4.111032, 3, -6.646877, 0, -0.5, 0.5, 0.5,
-4.111032, 3, -6.646877, 1, -0.5, 0.5, 0.5,
-4.111032, 3, -6.646877, 1, 1.5, 0.5, 0.5,
-4.111032, 3, -6.646877, 0, 1.5, 0.5, 0.5
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
-3.589272, -2.968438, -4,
-3.589272, -2.968438, 4,
-3.589272, -2.968438, -4,
-3.763192, -3.130857, -4,
-3.589272, -2.968438, -2,
-3.763192, -3.130857, -2,
-3.589272, -2.968438, 0,
-3.763192, -3.130857, 0,
-3.589272, -2.968438, 2,
-3.763192, -3.130857, 2,
-3.589272, -2.968438, 4,
-3.763192, -3.130857, 4
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
-4.111032, -3.455696, -4, 0, -0.5, 0.5, 0.5,
-4.111032, -3.455696, -4, 1, -0.5, 0.5, 0.5,
-4.111032, -3.455696, -4, 1, 1.5, 0.5, 0.5,
-4.111032, -3.455696, -4, 0, 1.5, 0.5, 0.5,
-4.111032, -3.455696, -2, 0, -0.5, 0.5, 0.5,
-4.111032, -3.455696, -2, 1, -0.5, 0.5, 0.5,
-4.111032, -3.455696, -2, 1, 1.5, 0.5, 0.5,
-4.111032, -3.455696, -2, 0, 1.5, 0.5, 0.5,
-4.111032, -3.455696, 0, 0, -0.5, 0.5, 0.5,
-4.111032, -3.455696, 0, 1, -0.5, 0.5, 0.5,
-4.111032, -3.455696, 0, 1, 1.5, 0.5, 0.5,
-4.111032, -3.455696, 0, 0, 1.5, 0.5, 0.5,
-4.111032, -3.455696, 2, 0, -0.5, 0.5, 0.5,
-4.111032, -3.455696, 2, 1, -0.5, 0.5, 0.5,
-4.111032, -3.455696, 2, 1, 1.5, 0.5, 0.5,
-4.111032, -3.455696, 2, 0, 1.5, 0.5, 0.5,
-4.111032, -3.455696, 4, 0, -0.5, 0.5, 0.5,
-4.111032, -3.455696, 4, 1, -0.5, 0.5, 0.5,
-4.111032, -3.455696, 4, 1, 1.5, 0.5, 0.5,
-4.111032, -3.455696, 4, 0, 1.5, 0.5, 0.5
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
-3.589272, -2.968438, -5.794177,
-3.589272, 3.528332, -5.794177,
-3.589272, -2.968438, 5.575152,
-3.589272, 3.528332, 5.575152,
-3.589272, -2.968438, -5.794177,
-3.589272, -2.968438, 5.575152,
-3.589272, 3.528332, -5.794177,
-3.589272, 3.528332, 5.575152,
-3.589272, -2.968438, -5.794177,
3.367519, -2.968438, -5.794177,
-3.589272, -2.968438, 5.575152,
3.367519, -2.968438, 5.575152,
-3.589272, 3.528332, -5.794177,
3.367519, 3.528332, -5.794177,
-3.589272, 3.528332, 5.575152,
3.367519, 3.528332, 5.575152,
3.367519, -2.968438, -5.794177,
3.367519, 3.528332, -5.794177,
3.367519, -2.968438, 5.575152,
3.367519, 3.528332, 5.575152,
3.367519, -2.968438, -5.794177,
3.367519, -2.968438, 5.575152,
3.367519, 3.528332, -5.794177,
3.367519, 3.528332, 5.575152
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
var radius = 7.917811;
var distance = 35.22723;
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
mvMatrix.translate( 0.1108766, -0.2799472, 0.1095126 );
mvMatrix.scale( 1.230581, 1.317715, 0.7529813 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.22723);
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
pyrethrin_I<-read.table("pyrethrin_I.xyz")
```

```
## Error in read.table("pyrethrin_I.xyz"): no lines available in input
```

```r
x<-pyrethrin_I$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyrethrin_I' not found
```

```r
y<-pyrethrin_I$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyrethrin_I' not found
```

```r
z<-pyrethrin_I$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyrethrin_I' not found
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
-3.48796, -0.3416615, -2.176485, 0, 0, 1, 1, 1,
-3.078448, 0.3275736, -0.7205529, 1, 0, 0, 1, 1,
-3.008679, 1.846944, -0.6529938, 1, 0, 0, 1, 1,
-2.757371, 0.4920244, -0.5563875, 1, 0, 0, 1, 1,
-2.54495, 1.782418, 0.1527526, 1, 0, 0, 1, 1,
-2.458646, 0.5339569, -1.599213, 1, 0, 0, 1, 1,
-2.43469, -1.115288, -2.046997, 0, 0, 0, 1, 1,
-2.280375, -0.1626092, -2.206864, 0, 0, 0, 1, 1,
-2.240324, -1.241715, -2.378093, 0, 0, 0, 1, 1,
-2.157331, -1.651454, -1.328068, 0, 0, 0, 1, 1,
-2.126106, -2.527611, -2.922201, 0, 0, 0, 1, 1,
-2.112781, 1.512655, -1.413262, 0, 0, 0, 1, 1,
-2.106605, -0.9381115, -2.125247, 0, 0, 0, 1, 1,
-2.095806, 1.160767, -1.771841, 1, 1, 1, 1, 1,
-2.085392, 1.158216, -1.695799, 1, 1, 1, 1, 1,
-2.039583, -0.2688413, -0.8588257, 1, 1, 1, 1, 1,
-2.03944, 1.21047, -0.93369, 1, 1, 1, 1, 1,
-2.020349, 0.4298204, -0.78668, 1, 1, 1, 1, 1,
-1.958441, -0.1120955, -2.208991, 1, 1, 1, 1, 1,
-1.954205, -0.380915, -2.798386, 1, 1, 1, 1, 1,
-1.950977, 0.6351357, -1.505588, 1, 1, 1, 1, 1,
-1.940244, -1.429628, -2.891926, 1, 1, 1, 1, 1,
-1.900819, 0.9584734, -0.05476118, 1, 1, 1, 1, 1,
-1.886966, -0.3762904, -0.3791745, 1, 1, 1, 1, 1,
-1.844019, -0.7475921, -2.870183, 1, 1, 1, 1, 1,
-1.841954, -0.8864731, -2.398695, 1, 1, 1, 1, 1,
-1.837052, 0.9242054, -2.065046, 1, 1, 1, 1, 1,
-1.829316, 0.5548353, -1.887981, 1, 1, 1, 1, 1,
-1.795836, 0.2717908, -1.963433, 0, 0, 1, 1, 1,
-1.78971, -1.025636, -3.030083, 1, 0, 0, 1, 1,
-1.779348, -1.815216, -1.472064, 1, 0, 0, 1, 1,
-1.725548, 1.397801, -0.6869339, 1, 0, 0, 1, 1,
-1.714858, -1.908219, -3.721927, 1, 0, 0, 1, 1,
-1.711548, -1.446, -2.723948, 1, 0, 0, 1, 1,
-1.702416, -1.728332, -2.124942, 0, 0, 0, 1, 1,
-1.697195, -0.4057628, -2.991271, 0, 0, 0, 1, 1,
-1.696117, -0.7897702, -2.228079, 0, 0, 0, 1, 1,
-1.691446, 1.484079, -0.8110461, 0, 0, 0, 1, 1,
-1.677674, -1.749703, -2.092183, 0, 0, 0, 1, 1,
-1.67438, -0.536989, -2.810215, 0, 0, 0, 1, 1,
-1.673742, -0.1323317, -1.402838, 0, 0, 0, 1, 1,
-1.670356, 0.4614416, -0.7108368, 1, 1, 1, 1, 1,
-1.614168, 0.4257173, -1.825751, 1, 1, 1, 1, 1,
-1.611663, 0.6992752, -1.548366, 1, 1, 1, 1, 1,
-1.577838, -0.3661871, -1.239714, 1, 1, 1, 1, 1,
-1.570503, -1.136033, -3.577449, 1, 1, 1, 1, 1,
-1.561691, 1.252677, -0.5758225, 1, 1, 1, 1, 1,
-1.546563, -1.237759, -2.270619, 1, 1, 1, 1, 1,
-1.532843, -1.448717, -1.732871, 1, 1, 1, 1, 1,
-1.525003, 0.3066633, -1.072797, 1, 1, 1, 1, 1,
-1.520435, 0.3087068, -0.471397, 1, 1, 1, 1, 1,
-1.513663, -1.671919, -2.591957, 1, 1, 1, 1, 1,
-1.509669, 1.219624, -2.028026, 1, 1, 1, 1, 1,
-1.48276, 0.4615107, -1.788218, 1, 1, 1, 1, 1,
-1.476337, 0.7555345, -1.535109, 1, 1, 1, 1, 1,
-1.468155, 1.739055, -1.859881, 1, 1, 1, 1, 1,
-1.462729, -1.163929, -2.920611, 0, 0, 1, 1, 1,
-1.459314, -0.08136591, -1.751284, 1, 0, 0, 1, 1,
-1.454337, -0.1360228, -4.813523, 1, 0, 0, 1, 1,
-1.447938, 0.491527, -0.4496163, 1, 0, 0, 1, 1,
-1.441644, 0.07971869, -0.7608671, 1, 0, 0, 1, 1,
-1.435522, -1.736681, -1.382614, 1, 0, 0, 1, 1,
-1.429792, -0.7148766, -3.547797, 0, 0, 0, 1, 1,
-1.41384, -0.8438626, -2.554801, 0, 0, 0, 1, 1,
-1.413697, 1.152363, -1.517028, 0, 0, 0, 1, 1,
-1.40587, 0.6069864, -0.4761099, 0, 0, 0, 1, 1,
-1.40282, 0.3745727, -2.507109, 0, 0, 0, 1, 1,
-1.4026, 1.844697, -0.6136854, 0, 0, 0, 1, 1,
-1.402336, 0.212275, -0.7300487, 0, 0, 0, 1, 1,
-1.395645, 0.9209678, -1.776598, 1, 1, 1, 1, 1,
-1.382927, 0.2117327, -0.8746655, 1, 1, 1, 1, 1,
-1.380385, -0.1943965, -2.28691, 1, 1, 1, 1, 1,
-1.376833, -0.7203686, -2.603483, 1, 1, 1, 1, 1,
-1.373298, -0.06188079, -2.206241, 1, 1, 1, 1, 1,
-1.367469, -1.864194, -2.122984, 1, 1, 1, 1, 1,
-1.358804, -0.4073918, -1.446889, 1, 1, 1, 1, 1,
-1.348566, 0.3510588, -0.6590394, 1, 1, 1, 1, 1,
-1.343975, -0.5118822, -2.206646, 1, 1, 1, 1, 1,
-1.340361, -0.3664991, -2.896245, 1, 1, 1, 1, 1,
-1.338764, -0.0866219, -2.173402, 1, 1, 1, 1, 1,
-1.328092, -1.055773, -1.627289, 1, 1, 1, 1, 1,
-1.32051, 1.288495, -0.9132953, 1, 1, 1, 1, 1,
-1.302419, 0.3315465, -0.4753423, 1, 1, 1, 1, 1,
-1.293935, -0.2742527, -2.614089, 1, 1, 1, 1, 1,
-1.291543, -0.9395533, -2.832111, 0, 0, 1, 1, 1,
-1.28162, 2.576567, 0.2928288, 1, 0, 0, 1, 1,
-1.268109, 0.4446879, 0.2989363, 1, 0, 0, 1, 1,
-1.267745, -1.849118, -2.657259, 1, 0, 0, 1, 1,
-1.263613, 0.1521599, -0.272266, 1, 0, 0, 1, 1,
-1.261554, -0.160487, -2.656476, 1, 0, 0, 1, 1,
-1.259414, -1.119353, -3.705824, 0, 0, 0, 1, 1,
-1.252907, 0.87311, 0.7014948, 0, 0, 0, 1, 1,
-1.248009, -1.257998, -0.7650861, 0, 0, 0, 1, 1,
-1.232955, 0.3307202, -1.994282, 0, 0, 0, 1, 1,
-1.229428, 0.1584634, -1.551701, 0, 0, 0, 1, 1,
-1.222807, -0.8618525, -3.341888, 0, 0, 0, 1, 1,
-1.216603, -1.324829, -1.26594, 0, 0, 0, 1, 1,
-1.20986, -0.2961371, -2.679456, 1, 1, 1, 1, 1,
-1.206723, 2.490689, -1.20815, 1, 1, 1, 1, 1,
-1.191849, -0.1790623, 0.2882945, 1, 1, 1, 1, 1,
-1.190704, 0.815177, -0.3894384, 1, 1, 1, 1, 1,
-1.189061, 1.019705, 0.3038024, 1, 1, 1, 1, 1,
-1.178439, 0.03858381, -2.116251, 1, 1, 1, 1, 1,
-1.175513, 0.1925174, -1.610727, 1, 1, 1, 1, 1,
-1.174026, 0.7820274, -0.4924416, 1, 1, 1, 1, 1,
-1.170639, -0.7037827, -2.089099, 1, 1, 1, 1, 1,
-1.16616, 0.5860927, -0.7875809, 1, 1, 1, 1, 1,
-1.159795, 0.682124, -1.061242, 1, 1, 1, 1, 1,
-1.144471, 0.6161026, -0.3261203, 1, 1, 1, 1, 1,
-1.144207, -1.069866, -4.134645, 1, 1, 1, 1, 1,
-1.136774, -0.882349, -1.179491, 1, 1, 1, 1, 1,
-1.134685, -1.019696, -2.984669, 1, 1, 1, 1, 1,
-1.12844, 0.7894183, -0.3369106, 0, 0, 1, 1, 1,
-1.127789, 0.2165179, -0.4498422, 1, 0, 0, 1, 1,
-1.126645, -0.0873041, -1.642046, 1, 0, 0, 1, 1,
-1.126307, -0.8384058, -3.033689, 1, 0, 0, 1, 1,
-1.124912, -2.166977, -2.940539, 1, 0, 0, 1, 1,
-1.110222, 0.622722, -2.227954, 1, 0, 0, 1, 1,
-1.097601, -0.03684603, -1.716731, 0, 0, 0, 1, 1,
-1.091059, -1.243659, -3.948282, 0, 0, 0, 1, 1,
-1.0878, -0.6444348, -2.440073, 0, 0, 0, 1, 1,
-1.087542, -0.1718228, -1.947848, 0, 0, 0, 1, 1,
-1.078644, 1.539407, 0.5636973, 0, 0, 0, 1, 1,
-1.077521, -0.3672286, -0.8329189, 0, 0, 0, 1, 1,
-1.0728, -0.1074324, -0.8562933, 0, 0, 0, 1, 1,
-1.068467, -1.012348, -2.261362, 1, 1, 1, 1, 1,
-1.066581, -0.6106978, -1.853954, 1, 1, 1, 1, 1,
-1.066327, 1.071052, -1.410181, 1, 1, 1, 1, 1,
-1.054555, 1.182066, -1.760482, 1, 1, 1, 1, 1,
-1.052987, 0.1768243, 0.2582049, 1, 1, 1, 1, 1,
-1.050095, 0.3182298, -2.184755, 1, 1, 1, 1, 1,
-1.045108, 0.3639739, -1.545359, 1, 1, 1, 1, 1,
-1.042452, -0.7963772, -2.474431, 1, 1, 1, 1, 1,
-1.040407, 0.5322638, -1.811371, 1, 1, 1, 1, 1,
-1.036054, 0.1001647, -3.052594, 1, 1, 1, 1, 1,
-1.035787, -0.561139, -2.566421, 1, 1, 1, 1, 1,
-1.035447, -0.9998977, -3.52467, 1, 1, 1, 1, 1,
-1.030574, -0.5840214, -4.360464, 1, 1, 1, 1, 1,
-1.028004, 0.05464919, -3.608749, 1, 1, 1, 1, 1,
-1.025836, 0.1159149, -1.101338, 1, 1, 1, 1, 1,
-1.025189, 0.2058164, 0.3820916, 0, 0, 1, 1, 1,
-1.017805, 0.09331966, -0.9450399, 1, 0, 0, 1, 1,
-1.016555, -0.0147285, -0.2034344, 1, 0, 0, 1, 1,
-1.016467, 0.4903471, -0.927627, 1, 0, 0, 1, 1,
-1.013453, -1.50451, -4.554165, 1, 0, 0, 1, 1,
-1.012989, 0.2367826, -2.480642, 1, 0, 0, 1, 1,
-1.009198, -0.355281, -1.794154, 0, 0, 0, 1, 1,
-1.005261, 0.2183059, -3.136502, 0, 0, 0, 1, 1,
-0.9979688, 0.4176934, -1.891852, 0, 0, 0, 1, 1,
-0.9904558, -0.12802, -2.23767, 0, 0, 0, 1, 1,
-0.9895471, -1.378149, -3.399629, 0, 0, 0, 1, 1,
-0.9868822, -0.03190496, -0.4952858, 0, 0, 0, 1, 1,
-0.9682672, -0.3403447, -2.115831, 0, 0, 0, 1, 1,
-0.9666351, 0.6259866, 0.8028715, 1, 1, 1, 1, 1,
-0.9610605, -1.668643, -3.081494, 1, 1, 1, 1, 1,
-0.9561253, 0.3077469, -1.630446, 1, 1, 1, 1, 1,
-0.9523383, 0.9770377, 0.4535902, 1, 1, 1, 1, 1,
-0.9497709, -2.496493, -2.880846, 1, 1, 1, 1, 1,
-0.9493329, -3.947914e-05, -3.987875, 1, 1, 1, 1, 1,
-0.9433109, 0.4742309, 0.1664672, 1, 1, 1, 1, 1,
-0.9432769, -0.5238801, -1.48961, 1, 1, 1, 1, 1,
-0.9357541, -0.03332336, -1.8738, 1, 1, 1, 1, 1,
-0.9341824, -0.710997, -0.2537361, 1, 1, 1, 1, 1,
-0.9323732, -0.2817705, -0.7949129, 1, 1, 1, 1, 1,
-0.932267, -0.1862946, -1.843833, 1, 1, 1, 1, 1,
-0.9321837, 1.200154, -0.4715245, 1, 1, 1, 1, 1,
-0.9307304, -0.8769916, -2.744862, 1, 1, 1, 1, 1,
-0.9253748, 0.9790155, 0.03378058, 1, 1, 1, 1, 1,
-0.9202288, 1.648658, -1.23489, 0, 0, 1, 1, 1,
-0.9182249, 0.4034645, -1.708063, 1, 0, 0, 1, 1,
-0.918064, -0.7386454, -2.320694, 1, 0, 0, 1, 1,
-0.9072484, -1.040298, -1.177406, 1, 0, 0, 1, 1,
-0.9014086, 0.4686489, -1.041478, 1, 0, 0, 1, 1,
-0.8971659, 0.5676147, -0.8732017, 1, 0, 0, 1, 1,
-0.8948653, -1.004723, -2.137604, 0, 0, 0, 1, 1,
-0.8939865, -0.2534869, -1.766782, 0, 0, 0, 1, 1,
-0.8891391, -1.972403, -3.680854, 0, 0, 0, 1, 1,
-0.8886158, -0.6352021, -2.370384, 0, 0, 0, 1, 1,
-0.875422, 0.355873, -1.634087, 0, 0, 0, 1, 1,
-0.8714606, 0.2955941, -1.718929, 0, 0, 0, 1, 1,
-0.8705584, 0.3371473, -2.15152, 0, 0, 0, 1, 1,
-0.8685764, 0.1157183, -0.9789523, 1, 1, 1, 1, 1,
-0.8656592, 0.145111, -0.8474471, 1, 1, 1, 1, 1,
-0.8656397, 0.8250378, -1.224358, 1, 1, 1, 1, 1,
-0.8639148, -0.3633643, -2.854995, 1, 1, 1, 1, 1,
-0.8572423, 0.4630668, 0.03382491, 1, 1, 1, 1, 1,
-0.8532784, 1.339029, -0.9392527, 1, 1, 1, 1, 1,
-0.8477337, -1.587207, -4.405012, 1, 1, 1, 1, 1,
-0.8414879, -0.6147781, -1.211448, 1, 1, 1, 1, 1,
-0.8378617, 0.9795617, -0.6501033, 1, 1, 1, 1, 1,
-0.8369239, -0.09174315, -2.924981, 1, 1, 1, 1, 1,
-0.8320432, 0.166326, -2.536944, 1, 1, 1, 1, 1,
-0.8287354, -1.872914, -1.065036, 1, 1, 1, 1, 1,
-0.8263241, -1.187455, -2.214668, 1, 1, 1, 1, 1,
-0.8237399, -0.02968233, -3.319273, 1, 1, 1, 1, 1,
-0.8198489, -0.06915884, -1.146187, 1, 1, 1, 1, 1,
-0.8186455, -0.932797, -3.227418, 0, 0, 1, 1, 1,
-0.8173539, 1.281931, -0.2078029, 1, 0, 0, 1, 1,
-0.816366, 0.5963914, -0.4173685, 1, 0, 0, 1, 1,
-0.8117487, -0.1478873, -2.112868, 1, 0, 0, 1, 1,
-0.8101853, 1.354699, -1.745093, 1, 0, 0, 1, 1,
-0.8047928, -0.7567106, -3.436717, 1, 0, 0, 1, 1,
-0.8035975, -0.1560425, -1.990944, 0, 0, 0, 1, 1,
-0.7984763, 0.5956249, -0.5889086, 0, 0, 0, 1, 1,
-0.796706, -0.8950906, -3.129497, 0, 0, 0, 1, 1,
-0.793754, -0.9111992, -2.041249, 0, 0, 0, 1, 1,
-0.7918775, 0.3284443, -0.04191728, 0, 0, 0, 1, 1,
-0.790374, 1.375439, -1.015267, 0, 0, 0, 1, 1,
-0.7865503, 0.3273025, -2.326028, 0, 0, 0, 1, 1,
-0.7824654, 0.5133286, -0.4428346, 1, 1, 1, 1, 1,
-0.7787382, -1.6214, -2.223696, 1, 1, 1, 1, 1,
-0.7752121, -1.151962, -3.388525, 1, 1, 1, 1, 1,
-0.7721993, 0.7541609, -0.6816952, 1, 1, 1, 1, 1,
-0.7673633, -0.04872294, -1.349662, 1, 1, 1, 1, 1,
-0.7645428, 0.1692079, -2.961427, 1, 1, 1, 1, 1,
-0.7569112, 0.2170766, -2.123564, 1, 1, 1, 1, 1,
-0.7456154, 0.7737927, 0.4140751, 1, 1, 1, 1, 1,
-0.7393432, 0.8706243, -0.5796503, 1, 1, 1, 1, 1,
-0.7312716, 0.7409925, -0.3897359, 1, 1, 1, 1, 1,
-0.7269248, -0.3895572, -2.011823, 1, 1, 1, 1, 1,
-0.7266961, 0.7973188, -1.649209, 1, 1, 1, 1, 1,
-0.7219937, -0.5329182, -1.705976, 1, 1, 1, 1, 1,
-0.7218029, 0.42874, -2.370459, 1, 1, 1, 1, 1,
-0.7204544, -0.6076608, 0.407975, 1, 1, 1, 1, 1,
-0.7169762, -0.2544971, -0.6778095, 0, 0, 1, 1, 1,
-0.7154455, 0.133775, -2.331633, 1, 0, 0, 1, 1,
-0.7105315, -2.036358, -3.387083, 1, 0, 0, 1, 1,
-0.7096003, 0.2052179, -2.36828, 1, 0, 0, 1, 1,
-0.7019229, 0.7019073, -1.821732, 1, 0, 0, 1, 1,
-0.7018353, 0.2566861, -0.3242908, 1, 0, 0, 1, 1,
-0.7010853, 0.7757219, 0.4205183, 0, 0, 0, 1, 1,
-0.6999472, -0.240729, -1.897207, 0, 0, 0, 1, 1,
-0.6961649, -0.5589862, -3.275436, 0, 0, 0, 1, 1,
-0.690247, 0.6617157, -1.366728, 0, 0, 0, 1, 1,
-0.6886343, -1.15029, -3.83642, 0, 0, 0, 1, 1,
-0.6874881, 0.494549, -1.387056, 0, 0, 0, 1, 1,
-0.6855764, 0.4145877, -1.550098, 0, 0, 0, 1, 1,
-0.6852862, 0.07272992, 0.2246917, 1, 1, 1, 1, 1,
-0.6826317, 0.6989506, -1.358984, 1, 1, 1, 1, 1,
-0.6821295, 0.4171103, -2.349444, 1, 1, 1, 1, 1,
-0.6736662, 0.9314715, 2.134227, 1, 1, 1, 1, 1,
-0.6730976, 0.3238686, 1.086179, 1, 1, 1, 1, 1,
-0.6709068, -1.091089, -2.528965, 1, 1, 1, 1, 1,
-0.6691014, -0.02816806, -1.094084, 1, 1, 1, 1, 1,
-0.6688521, 1.031066, -1.498062, 1, 1, 1, 1, 1,
-0.6576982, 0.6231465, -1.381197, 1, 1, 1, 1, 1,
-0.6516953, -0.6701707, -3.014884, 1, 1, 1, 1, 1,
-0.6434729, 1.538414, -1.130866, 1, 1, 1, 1, 1,
-0.6410267, 0.08695803, -1.442763, 1, 1, 1, 1, 1,
-0.6372141, 1.687572, 0.4184818, 1, 1, 1, 1, 1,
-0.6367683, -0.6349065, -2.378833, 1, 1, 1, 1, 1,
-0.6334991, 1.310244, -1.355469, 1, 1, 1, 1, 1,
-0.6334651, -1.014223, -2.413292, 0, 0, 1, 1, 1,
-0.6333711, -0.1347464, -3.849638, 1, 0, 0, 1, 1,
-0.6310605, -2.411551, -4.704678, 1, 0, 0, 1, 1,
-0.6298884, 1.286438, 0.2021528, 1, 0, 0, 1, 1,
-0.6275958, 2.234485, 0.1628095, 1, 0, 0, 1, 1,
-0.6213861, 0.8494798, -0.2570818, 1, 0, 0, 1, 1,
-0.6209999, 0.7900659, -0.8091102, 0, 0, 0, 1, 1,
-0.6163566, 1.351436, -0.717979, 0, 0, 0, 1, 1,
-0.6131428, -0.08081169, -0.7680078, 0, 0, 0, 1, 1,
-0.6121614, 0.1429683, -2.23121, 0, 0, 0, 1, 1,
-0.6113194, 0.4543248, 0.08814318, 0, 0, 0, 1, 1,
-0.6082688, 0.6243258, -0.7514558, 0, 0, 0, 1, 1,
-0.6029529, 0.0728172, -3.079779, 0, 0, 0, 1, 1,
-0.6021854, -1.660848, -1.905994, 1, 1, 1, 1, 1,
-0.6020865, 0.08541818, -0.5598073, 1, 1, 1, 1, 1,
-0.5994712, 1.21845, 1.495646, 1, 1, 1, 1, 1,
-0.58989, -0.1951995, -3.285098, 1, 1, 1, 1, 1,
-0.5859973, 1.912835, 0.3768301, 1, 1, 1, 1, 1,
-0.5844867, 2.055834, -0.254195, 1, 1, 1, 1, 1,
-0.5840305, 1.152209, -1.040039, 1, 1, 1, 1, 1,
-0.5821172, 1.407103, -0.3658367, 1, 1, 1, 1, 1,
-0.5805784, 0.8100089, -1.62592, 1, 1, 1, 1, 1,
-0.5788618, -0.2817379, -2.412555, 1, 1, 1, 1, 1,
-0.5706025, -0.2565226, -2.791344, 1, 1, 1, 1, 1,
-0.5575256, 1.547025, -0.3862693, 1, 1, 1, 1, 1,
-0.5509399, -1.137102, -2.060585, 1, 1, 1, 1, 1,
-0.5488174, 1.318314, -2.303091, 1, 1, 1, 1, 1,
-0.5481969, 0.4349016, -1.590147, 1, 1, 1, 1, 1,
-0.5448186, 0.01843127, -1.703448, 0, 0, 1, 1, 1,
-0.5446615, -1.462282, -2.674389, 1, 0, 0, 1, 1,
-0.5391039, -1.248009, -1.706913, 1, 0, 0, 1, 1,
-0.5328553, -0.5925442, -3.587645, 1, 0, 0, 1, 1,
-0.5289283, -1.124821, -2.972688, 1, 0, 0, 1, 1,
-0.5262771, 0.7193903, -0.3333386, 1, 0, 0, 1, 1,
-0.5252599, -1.242938, -1.377409, 0, 0, 0, 1, 1,
-0.5213429, -0.8571956, -3.584699, 0, 0, 0, 1, 1,
-0.5196837, 0.9305532, -0.1310796, 0, 0, 0, 1, 1,
-0.5166568, 0.3502566, -2.136224, 0, 0, 0, 1, 1,
-0.5159783, 0.2768861, -0.1477105, 0, 0, 0, 1, 1,
-0.5120384, 1.325943, -1.160472, 0, 0, 0, 1, 1,
-0.5112951, 0.1699256, -2.125061, 0, 0, 0, 1, 1,
-0.5105987, -0.6386502, -1.43916, 1, 1, 1, 1, 1,
-0.5099031, -0.1676517, -0.2028386, 1, 1, 1, 1, 1,
-0.5089759, -0.6196233, -3.223652, 1, 1, 1, 1, 1,
-0.5053705, 1.385518, -1.880166, 1, 1, 1, 1, 1,
-0.5043086, -1.38289, -4.201665, 1, 1, 1, 1, 1,
-0.5035477, -0.04437408, -1.570096, 1, 1, 1, 1, 1,
-0.5000607, -0.1322154, -2.564348, 1, 1, 1, 1, 1,
-0.4999634, -1.859965, -2.372658, 1, 1, 1, 1, 1,
-0.4982632, -0.4968694, -3.116311, 1, 1, 1, 1, 1,
-0.4964688, 3.433719, 0.3766779, 1, 1, 1, 1, 1,
-0.49532, 0.06837014, -2.475464, 1, 1, 1, 1, 1,
-0.493398, 0.9414645, -0.4594982, 1, 1, 1, 1, 1,
-0.4926576, 1.011543, 0.6844113, 1, 1, 1, 1, 1,
-0.4915166, -0.2070385, -0.7826563, 1, 1, 1, 1, 1,
-0.4874925, 0.2087205, -0.7581905, 1, 1, 1, 1, 1,
-0.4867288, -0.7807184, -3.714031, 0, 0, 1, 1, 1,
-0.4857463, 1.558469, -1.521198, 1, 0, 0, 1, 1,
-0.4855194, 1.005465, -0.4718663, 1, 0, 0, 1, 1,
-0.4845276, -0.2871075, -1.765647, 1, 0, 0, 1, 1,
-0.4838202, 0.3814024, -1.69356, 1, 0, 0, 1, 1,
-0.4830143, -0.9418436, -3.608177, 1, 0, 0, 1, 1,
-0.4814014, 0.7965958, -0.5721037, 0, 0, 0, 1, 1,
-0.4685655, -0.2596073, -0.7680763, 0, 0, 0, 1, 1,
-0.4643774, -0.5915152, -2.732759, 0, 0, 0, 1, 1,
-0.4601277, -1.264699, -4.661195, 0, 0, 0, 1, 1,
-0.4540184, 0.5703247, -2.06437, 0, 0, 0, 1, 1,
-0.4525738, -0.170035, -1.51811, 0, 0, 0, 1, 1,
-0.4484347, -0.6268344, -3.466536, 0, 0, 0, 1, 1,
-0.4480326, 1.00564, 1.203862, 1, 1, 1, 1, 1,
-0.4471405, -0.5293396, -2.291413, 1, 1, 1, 1, 1,
-0.4459184, -1.086171, -1.93598, 1, 1, 1, 1, 1,
-0.4457805, 0.5626931, -1.029827, 1, 1, 1, 1, 1,
-0.4442244, -1.253642, -1.753931, 1, 1, 1, 1, 1,
-0.4437667, 0.1638033, -0.5195013, 1, 1, 1, 1, 1,
-0.443667, 0.5979347, 0.4097631, 1, 1, 1, 1, 1,
-0.4430063, 0.4422059, -2.436891, 1, 1, 1, 1, 1,
-0.4416426, 0.04954981, -3.48125, 1, 1, 1, 1, 1,
-0.4404469, -1.537825, -3.380499, 1, 1, 1, 1, 1,
-0.437707, -1.095497, -1.524502, 1, 1, 1, 1, 1,
-0.4375923, 0.5628875, -0.0415931, 1, 1, 1, 1, 1,
-0.4359029, -1.389707, -3.4442, 1, 1, 1, 1, 1,
-0.4324267, -1.199885, -1.897101, 1, 1, 1, 1, 1,
-0.430892, 0.3229267, -0.9661277, 1, 1, 1, 1, 1,
-0.4300287, 0.391516, -0.7091542, 0, 0, 1, 1, 1,
-0.427577, 2.702518, -0.06560817, 1, 0, 0, 1, 1,
-0.4273986, -0.2782145, -2.298949, 1, 0, 0, 1, 1,
-0.4218876, -0.8072085, -2.75306, 1, 0, 0, 1, 1,
-0.4194864, 0.5014518, 0.8313183, 1, 0, 0, 1, 1,
-0.4191866, 0.1977229, -1.277161, 1, 0, 0, 1, 1,
-0.4174261, 0.5764068, -1.556377, 0, 0, 0, 1, 1,
-0.412144, 0.4496132, -1.207457, 0, 0, 0, 1, 1,
-0.4106685, 0.324827, -1.534788, 0, 0, 0, 1, 1,
-0.4069353, 0.01403651, -0.4791737, 0, 0, 0, 1, 1,
-0.40482, 0.1313764, -1.707484, 0, 0, 0, 1, 1,
-0.4024764, -1.91558, -3.973073, 0, 0, 0, 1, 1,
-0.4014333, -1.1524, -3.731306, 0, 0, 0, 1, 1,
-0.3981585, 1.336385, 0.9050557, 1, 1, 1, 1, 1,
-0.3973797, -2.077223, -3.621469, 1, 1, 1, 1, 1,
-0.3932486, 0.4568887, -2.276942, 1, 1, 1, 1, 1,
-0.3921921, -0.3056058, -0.4704971, 1, 1, 1, 1, 1,
-0.3910806, 0.5228906, -0.958232, 1, 1, 1, 1, 1,
-0.3884502, -1.707736, -4.725697, 1, 1, 1, 1, 1,
-0.3882191, 1.042791, -1.039746, 1, 1, 1, 1, 1,
-0.3773201, 1.15513, -1.626948, 1, 1, 1, 1, 1,
-0.3772991, -0.1430274, -3.091329, 1, 1, 1, 1, 1,
-0.3764733, -0.8363758, -4.736873, 1, 1, 1, 1, 1,
-0.3761519, -0.02328944, -3.885071, 1, 1, 1, 1, 1,
-0.3744763, -0.7184271, -3.198403, 1, 1, 1, 1, 1,
-0.3728054, -0.9437047, -2.254867, 1, 1, 1, 1, 1,
-0.3715863, 1.981738, 0.5924497, 1, 1, 1, 1, 1,
-0.3686086, -0.1379346, -2.112795, 1, 1, 1, 1, 1,
-0.3616692, -0.2769794, -2.87778, 0, 0, 1, 1, 1,
-0.3579413, -0.7294595, -3.05852, 1, 0, 0, 1, 1,
-0.3562147, -0.5028104, -1.276048, 1, 0, 0, 1, 1,
-0.3521608, 0.2772804, -0.8025305, 1, 0, 0, 1, 1,
-0.3513859, 1.447939, 0.862509, 1, 0, 0, 1, 1,
-0.348495, 0.5181645, -0.1589804, 1, 0, 0, 1, 1,
-0.3482975, -0.5397798, -2.392093, 0, 0, 0, 1, 1,
-0.3456417, 0.05081793, -0.2924931, 0, 0, 0, 1, 1,
-0.3439012, -1.376186, -2.727409, 0, 0, 0, 1, 1,
-0.3416114, -0.1173172, -3.243255, 0, 0, 0, 1, 1,
-0.3387784, 0.07564622, -2.194198, 0, 0, 0, 1, 1,
-0.3330774, -0.1593582, -1.643687, 0, 0, 0, 1, 1,
-0.3310194, -1.696577, -3.831715, 0, 0, 0, 1, 1,
-0.3282549, -1.187566, -3.220802, 1, 1, 1, 1, 1,
-0.3170326, -0.5136642, -3.872171, 1, 1, 1, 1, 1,
-0.3165241, 1.517742, 0.3809335, 1, 1, 1, 1, 1,
-0.3158276, 0.4613332, -0.5311483, 1, 1, 1, 1, 1,
-0.3112496, -0.06163699, -3.608553, 1, 1, 1, 1, 1,
-0.311146, 1.139679, 1.698451, 1, 1, 1, 1, 1,
-0.311025, -0.7272193, -0.6119217, 1, 1, 1, 1, 1,
-0.3106877, -1.563764, -3.728076, 1, 1, 1, 1, 1,
-0.3044749, -0.4623897, -2.598889, 1, 1, 1, 1, 1,
-0.2989404, 0.5325695, 0.356673, 1, 1, 1, 1, 1,
-0.2989269, -0.475841, -2.94703, 1, 1, 1, 1, 1,
-0.298054, 0.6488864, -0.1451937, 1, 1, 1, 1, 1,
-0.2963592, 0.07368011, 0.4826125, 1, 1, 1, 1, 1,
-0.2959691, -1.276161, -1.542904, 1, 1, 1, 1, 1,
-0.2945837, 0.4475258, 0.3678946, 1, 1, 1, 1, 1,
-0.2943662, 0.4145639, -2.630794, 0, 0, 1, 1, 1,
-0.293896, -0.3225848, -3.133397, 1, 0, 0, 1, 1,
-0.2923472, -2.590556, -3.905469, 1, 0, 0, 1, 1,
-0.2911945, 0.6707461, 0.5181414, 1, 0, 0, 1, 1,
-0.2902451, -0.2408745, -3.500457, 1, 0, 0, 1, 1,
-0.288018, -2.595623, -3.023367, 1, 0, 0, 1, 1,
-0.2850533, -1.167612, -3.013703, 0, 0, 0, 1, 1,
-0.2829999, -0.09070196, -1.819063, 0, 0, 0, 1, 1,
-0.2763967, -1.29205, -3.016489, 0, 0, 0, 1, 1,
-0.2758726, 1.232996, -0.928512, 0, 0, 0, 1, 1,
-0.2756073, -1.373652, -4.22087, 0, 0, 0, 1, 1,
-0.2749778, -1.367437, -4.522809, 0, 0, 0, 1, 1,
-0.2726776, 0.5921141, -0.3539529, 0, 0, 0, 1, 1,
-0.2714482, -0.2956368, -1.893011, 1, 1, 1, 1, 1,
-0.2713473, 0.1499044, -0.8054125, 1, 1, 1, 1, 1,
-0.268022, -1.142266, -2.447018, 1, 1, 1, 1, 1,
-0.2650003, -0.7042985, -1.226877, 1, 1, 1, 1, 1,
-0.2637163, -1.415075, -1.864548, 1, 1, 1, 1, 1,
-0.2627679, 0.802371, 1.601737, 1, 1, 1, 1, 1,
-0.2621729, 0.4132934, -1.415955, 1, 1, 1, 1, 1,
-0.2572345, 1.161512, -0.1812787, 1, 1, 1, 1, 1,
-0.2558537, -0.06115692, -2.431516, 1, 1, 1, 1, 1,
-0.250566, 0.5357079, -1.963438, 1, 1, 1, 1, 1,
-0.2499183, 0.9380847, 1.060971, 1, 1, 1, 1, 1,
-0.2438897, -0.9756546, -2.171447, 1, 1, 1, 1, 1,
-0.2438657, -1.653272, -5.628604, 1, 1, 1, 1, 1,
-0.2424929, 0.1737986, -1.499666, 1, 1, 1, 1, 1,
-0.242215, 0.387302, -1.370413, 1, 1, 1, 1, 1,
-0.2411892, 1.88529, -0.555226, 0, 0, 1, 1, 1,
-0.2394718, -0.6639774, -2.178476, 1, 0, 0, 1, 1,
-0.2374874, 1.15076, 0.7228882, 1, 0, 0, 1, 1,
-0.2333361, 0.8354303, -0.4469004, 1, 0, 0, 1, 1,
-0.2327322, 0.2738707, 1.075752, 1, 0, 0, 1, 1,
-0.2314656, -0.3264583, -2.293728, 1, 0, 0, 1, 1,
-0.2207368, 2.252146, -0.703532, 0, 0, 0, 1, 1,
-0.2151197, 1.284876, 0.5087109, 0, 0, 0, 1, 1,
-0.2149732, -0.5819585, -4.16434, 0, 0, 0, 1, 1,
-0.2130431, -0.3526708, -3.479401, 0, 0, 0, 1, 1,
-0.2056589, -0.7117159, -4.156832, 0, 0, 0, 1, 1,
-0.2037102, 0.7777793, -1.971385, 0, 0, 0, 1, 1,
-0.1926871, -1.172745, -2.46628, 0, 0, 0, 1, 1,
-0.1920929, -0.3303101, -2.218412, 1, 1, 1, 1, 1,
-0.1822277, -1.362549, -2.37957, 1, 1, 1, 1, 1,
-0.1791668, 1.139767, -0.4626753, 1, 1, 1, 1, 1,
-0.1749561, -0.3523386, -2.089677, 1, 1, 1, 1, 1,
-0.1724388, -0.6520562, -1.811633, 1, 1, 1, 1, 1,
-0.1705033, 1.81797, 1.316884, 1, 1, 1, 1, 1,
-0.163807, 1.43336, -1.761533, 1, 1, 1, 1, 1,
-0.1616352, -0.08462615, -0.6466193, 1, 1, 1, 1, 1,
-0.157914, 2.105475, -0.009634766, 1, 1, 1, 1, 1,
-0.1574926, 1.611051, -0.9768338, 1, 1, 1, 1, 1,
-0.156954, 0.6627387, -0.4125201, 1, 1, 1, 1, 1,
-0.1523496, -2.117487, -3.585564, 1, 1, 1, 1, 1,
-0.1522481, 0.6828873, -0.5520545, 1, 1, 1, 1, 1,
-0.1484516, 0.7427592, -0.2761687, 1, 1, 1, 1, 1,
-0.1474184, -0.3033722, -2.715319, 1, 1, 1, 1, 1,
-0.1424613, 0.5012608, -0.7982991, 0, 0, 1, 1, 1,
-0.1397446, -1.158944, -2.831758, 1, 0, 0, 1, 1,
-0.1379959, 2.148862, 0.5080779, 1, 0, 0, 1, 1,
-0.1370289, 0.6042965, -2.300329, 1, 0, 0, 1, 1,
-0.134367, -0.3041719, -2.585201, 1, 0, 0, 1, 1,
-0.127135, 1.015558, 0.03378724, 1, 0, 0, 1, 1,
-0.1240354, 0.6302962, -0.9456455, 0, 0, 0, 1, 1,
-0.1223511, 0.3192466, -0.2662397, 0, 0, 0, 1, 1,
-0.1218337, -0.04935328, -2.574766, 0, 0, 0, 1, 1,
-0.1169514, -0.6621355, -4.277843, 0, 0, 0, 1, 1,
-0.1163577, 0.9488057, -2.526672, 0, 0, 0, 1, 1,
-0.1158708, 0.2795469, -0.9361849, 0, 0, 0, 1, 1,
-0.1145268, 0.1529082, -0.5416609, 0, 0, 0, 1, 1,
-0.1137863, 0.2035187, -1.66457, 1, 1, 1, 1, 1,
-0.1131983, 1.08175, -0.869038, 1, 1, 1, 1, 1,
-0.11301, -0.4379386, -2.589355, 1, 1, 1, 1, 1,
-0.1123811, 0.1531287, 0.6194633, 1, 1, 1, 1, 1,
-0.1117491, 1.111804, -0.5336009, 1, 1, 1, 1, 1,
-0.1032645, -1.482229, -2.323009, 1, 1, 1, 1, 1,
-0.1026529, 2.640655, -0.01601882, 1, 1, 1, 1, 1,
-0.1025557, 1.373041, 0.5223629, 1, 1, 1, 1, 1,
-0.1020877, 0.2118915, -0.0857443, 1, 1, 1, 1, 1,
-0.09601076, 2.095071, 0.05407387, 1, 1, 1, 1, 1,
-0.09567789, 0.9512166, 1.307997, 1, 1, 1, 1, 1,
-0.09470611, -2.604604, -3.690894, 1, 1, 1, 1, 1,
-0.09437129, -0.5715358, -4.346893, 1, 1, 1, 1, 1,
-0.09125962, -0.2710214, -2.527682, 1, 1, 1, 1, 1,
-0.09091983, 0.0646962, -0.3090305, 1, 1, 1, 1, 1,
-0.08679292, 1.123477, 0.2760962, 0, 0, 1, 1, 1,
-0.08082031, -0.6038699, -3.501497, 1, 0, 0, 1, 1,
-0.07981723, -0.05238419, -1.579397, 1, 0, 0, 1, 1,
-0.07936783, -0.7617619, -4.679933, 1, 0, 0, 1, 1,
-0.07903887, 0.5155501, 0.7150385, 1, 0, 0, 1, 1,
-0.07885325, -0.9269002, -4.11832, 1, 0, 0, 1, 1,
-0.07711694, -1.506955, -2.406605, 0, 0, 0, 1, 1,
-0.07251801, -0.02960642, -2.301651, 0, 0, 0, 1, 1,
-0.06670602, 0.4079308, -0.8973223, 0, 0, 0, 1, 1,
-0.06182922, 0.3471406, -0.8913275, 0, 0, 0, 1, 1,
-0.05994103, 1.348572, -0.09371255, 0, 0, 0, 1, 1,
-0.05977102, -0.06369068, -3.880594, 0, 0, 0, 1, 1,
-0.05439623, -0.5004991, -2.440265, 0, 0, 0, 1, 1,
-0.05391239, -0.6269091, -3.336478, 1, 1, 1, 1, 1,
-0.05194085, 0.340002, -0.5413014, 1, 1, 1, 1, 1,
-0.05080346, -1.536618, -1.842704, 1, 1, 1, 1, 1,
-0.04670987, 0.2373662, -0.315304, 1, 1, 1, 1, 1,
-0.04456821, -0.2912399, -5.399373, 1, 1, 1, 1, 1,
-0.04145204, -0.0541586, -3.200509, 1, 1, 1, 1, 1,
-0.04026556, -0.86271, -3.572326, 1, 1, 1, 1, 1,
-0.03949235, 1.546462, 0.3048188, 1, 1, 1, 1, 1,
-0.03401646, -0.7999696, -4.17274, 1, 1, 1, 1, 1,
-0.03038781, -0.1038071, -2.458734, 1, 1, 1, 1, 1,
-0.03024197, -1.238066, -2.604809, 1, 1, 1, 1, 1,
-0.02914084, -0.7474286, -4.745734, 1, 1, 1, 1, 1,
-0.02739009, 0.1410892, 0.3869945, 1, 1, 1, 1, 1,
-0.02399369, 0.3773715, -0.07338756, 1, 1, 1, 1, 1,
-0.02390263, -1.431666, -4.208106, 1, 1, 1, 1, 1,
-0.02385603, -0.1394141, -2.841336, 0, 0, 1, 1, 1,
-0.02286211, 0.7448389, -0.3761153, 1, 0, 0, 1, 1,
-0.02229089, 0.6971819, 0.227426, 1, 0, 0, 1, 1,
-0.01013668, -0.2307951, -4.478317, 1, 0, 0, 1, 1,
-0.007843844, 0.5713833, -1.128473, 1, 0, 0, 1, 1,
-0.003245554, 0.6056383, -0.09916935, 1, 0, 0, 1, 1,
-0.002752902, -0.6603963, -3.83878, 0, 0, 0, 1, 1,
9.968396e-05, -0.8654891, 4.312355, 0, 0, 0, 1, 1,
0.006152789, -0.1534486, 3.288208, 0, 0, 0, 1, 1,
0.006649636, -0.4680001, 3.787516, 0, 0, 0, 1, 1,
0.006948087, 0.06647058, -0.3169328, 0, 0, 0, 1, 1,
0.01242985, -1.203761, 2.031814, 0, 0, 0, 1, 1,
0.01693734, -0.9145855, 1.984579, 0, 0, 0, 1, 1,
0.01765596, -0.8877919, 4.158762, 1, 1, 1, 1, 1,
0.02133218, 0.8744717, -2.424795, 1, 1, 1, 1, 1,
0.02275142, -0.2192124, 2.771177, 1, 1, 1, 1, 1,
0.02795781, 1.458197, 0.6697193, 1, 1, 1, 1, 1,
0.03254055, -0.65152, 1.941198, 1, 1, 1, 1, 1,
0.03293712, 1.307908, 0.1484794, 1, 1, 1, 1, 1,
0.03329968, 0.2931287, 1.227539, 1, 1, 1, 1, 1,
0.03515684, -0.8708534, 2.563227, 1, 1, 1, 1, 1,
0.03628525, 1.372215, 0.7496287, 1, 1, 1, 1, 1,
0.03824068, -1.143459, 2.91124, 1, 1, 1, 1, 1,
0.04010977, 1.291425, -0.34025, 1, 1, 1, 1, 1,
0.04899039, 1.049577, 0.9768604, 1, 1, 1, 1, 1,
0.05259837, 0.1356855, 1.078334, 1, 1, 1, 1, 1,
0.05325361, -0.18085, 4.028392, 1, 1, 1, 1, 1,
0.05493847, 0.5649262, -0.06178596, 1, 1, 1, 1, 1,
0.05849505, 0.1336863, 0.1887028, 0, 0, 1, 1, 1,
0.05878945, -1.282202, 3.900748, 1, 0, 0, 1, 1,
0.06060822, 0.9693435, 0.1074729, 1, 0, 0, 1, 1,
0.06118221, 0.8852475, -0.2181475, 1, 0, 0, 1, 1,
0.06130561, -0.3226618, 3.742217, 1, 0, 0, 1, 1,
0.06261621, 0.01103541, 2.109265, 1, 0, 0, 1, 1,
0.06979278, 0.08277588, 0.0005101161, 0, 0, 0, 1, 1,
0.07261264, 1.252408, 0.2832328, 0, 0, 0, 1, 1,
0.07712173, -1.630813, 2.337082, 0, 0, 0, 1, 1,
0.07816027, 0.4826681, 0.4808181, 0, 0, 0, 1, 1,
0.08033811, 0.9377133, -0.514618, 0, 0, 0, 1, 1,
0.08276547, 1.108023, 2.190389, 0, 0, 0, 1, 1,
0.09133235, 0.7403951, -0.8490755, 0, 0, 0, 1, 1,
0.09184644, 0.2701608, -0.6140319, 1, 1, 1, 1, 1,
0.09414276, 0.06800485, 1.976465, 1, 1, 1, 1, 1,
0.09467251, -0.2030417, 1.894929, 1, 1, 1, 1, 1,
0.09484481, 0.8961161, -1.154665, 1, 1, 1, 1, 1,
0.09658053, 1.269837, 1.550225, 1, 1, 1, 1, 1,
0.09709516, 0.9750041, 0.1271746, 1, 1, 1, 1, 1,
0.09964357, -1.907297, 4.10282, 1, 1, 1, 1, 1,
0.1017355, 0.5039498, 1.532863, 1, 1, 1, 1, 1,
0.1041177, -0.3579794, 1.331415, 1, 1, 1, 1, 1,
0.1085399, 2.389933, 0.1151847, 1, 1, 1, 1, 1,
0.1107925, 1.311304, -0.2762279, 1, 1, 1, 1, 1,
0.1128983, -0.2008903, 2.985206, 1, 1, 1, 1, 1,
0.1137442, 0.4245837, 1.199322, 1, 1, 1, 1, 1,
0.1142264, -0.0001183035, 2.354339, 1, 1, 1, 1, 1,
0.1167207, -0.1197812, 2.897184, 1, 1, 1, 1, 1,
0.1221539, 2.104646, -0.4669585, 0, 0, 1, 1, 1,
0.1251145, 0.9543984, 0.8283222, 1, 0, 0, 1, 1,
0.1275613, 0.4781555, 0.6725973, 1, 0, 0, 1, 1,
0.1361867, -1.670501, 3.669232, 1, 0, 0, 1, 1,
0.1367526, 0.1933051, 1.723704, 1, 0, 0, 1, 1,
0.1374839, -0.8825536, 1.121709, 1, 0, 0, 1, 1,
0.1383066, 0.5669903, 2.019557, 0, 0, 0, 1, 1,
0.1393938, -0.7698478, 3.856942, 0, 0, 0, 1, 1,
0.1404325, -0.7155352, 2.19783, 0, 0, 0, 1, 1,
0.1429919, -0.2773742, 4.165748, 0, 0, 0, 1, 1,
0.14339, -0.309708, 3.100988, 0, 0, 0, 1, 1,
0.1497617, 0.8567069, -0.3369396, 0, 0, 0, 1, 1,
0.1497944, -0.8704463, 3.464154, 0, 0, 0, 1, 1,
0.1536761, -0.7924413, 1.895062, 1, 1, 1, 1, 1,
0.1542773, 0.1891618, 1.102064, 1, 1, 1, 1, 1,
0.1547705, -0.783826, 4.325751, 1, 1, 1, 1, 1,
0.1557741, -0.6237156, 4.750802, 1, 1, 1, 1, 1,
0.1569982, -2.702218, 3.314935, 1, 1, 1, 1, 1,
0.1578403, -0.8297718, 2.736072, 1, 1, 1, 1, 1,
0.1601622, -0.8684618, 0.4993425, 1, 1, 1, 1, 1,
0.1629938, -1.682174, 2.914217, 1, 1, 1, 1, 1,
0.1645288, 0.5356302, -0.4594574, 1, 1, 1, 1, 1,
0.1663525, 0.07685733, -0.7035702, 1, 1, 1, 1, 1,
0.1673604, -0.8374749, 2.541292, 1, 1, 1, 1, 1,
0.1688355, -1.14017, 2.763338, 1, 1, 1, 1, 1,
0.175406, -0.3167782, 1.542516, 1, 1, 1, 1, 1,
0.17577, 0.8411031, 0.2614576, 1, 1, 1, 1, 1,
0.177183, 0.4775523, 0.3400074, 1, 1, 1, 1, 1,
0.177741, 0.4375212, -0.3279721, 0, 0, 1, 1, 1,
0.1794612, -1.894581, 2.9052, 1, 0, 0, 1, 1,
0.1805753, 0.4897579, 1.373774, 1, 0, 0, 1, 1,
0.1835059, 0.8161626, -0.1408304, 1, 0, 0, 1, 1,
0.1891812, 0.7867579, 0.03147687, 1, 0, 0, 1, 1,
0.1896014, -0.815551, 2.391883, 1, 0, 0, 1, 1,
0.1916811, -0.2231892, 1.91751, 0, 0, 0, 1, 1,
0.1919941, 1.848226, -0.07666051, 0, 0, 0, 1, 1,
0.1929235, 0.3662857, 0.7456744, 0, 0, 0, 1, 1,
0.1981858, -0.1071046, 2.24636, 0, 0, 0, 1, 1,
0.2026202, 0.2384424, 0.2999447, 0, 0, 0, 1, 1,
0.2037664, -0.5927688, 0.5342807, 0, 0, 0, 1, 1,
0.2043165, -0.4137411, 2.310913, 0, 0, 0, 1, 1,
0.2043447, -0.0530706, 0.004257481, 1, 1, 1, 1, 1,
0.2111357, 0.3713146, 2.811478, 1, 1, 1, 1, 1,
0.2137845, 1.2611, 1.256732, 1, 1, 1, 1, 1,
0.217027, -0.7455241, 2.278011, 1, 1, 1, 1, 1,
0.2212567, 1.117776, 0.5320147, 1, 1, 1, 1, 1,
0.2218799, 3.338316, 2.157605, 1, 1, 1, 1, 1,
0.2228365, -0.1943501, 4.37918, 1, 1, 1, 1, 1,
0.2243113, -0.9635142, 3.902358, 1, 1, 1, 1, 1,
0.2269562, 1.189676, 0.1516766, 1, 1, 1, 1, 1,
0.2273919, -0.7275949, 3.571779, 1, 1, 1, 1, 1,
0.2285886, 1.964232, -1.23912, 1, 1, 1, 1, 1,
0.2322593, 0.7227676, 2.211395, 1, 1, 1, 1, 1,
0.2367221, 0.8820328, -1.357495, 1, 1, 1, 1, 1,
0.2388094, -0.9568371, 4.585648, 1, 1, 1, 1, 1,
0.2418136, -0.911564, 3.547639, 1, 1, 1, 1, 1,
0.2452244, 0.03571439, 1.909287, 0, 0, 1, 1, 1,
0.2465167, 0.7392708, 0.8209178, 1, 0, 0, 1, 1,
0.250252, 1.448744, 1.152285, 1, 0, 0, 1, 1,
0.251983, -0.107111, 1.659723, 1, 0, 0, 1, 1,
0.2581973, -0.741623, 2.52897, 1, 0, 0, 1, 1,
0.2617051, 2.005419, -1.068493, 1, 0, 0, 1, 1,
0.261945, 0.9431091, 1.06283, 0, 0, 0, 1, 1,
0.2657644, -1.182482, 3.551307, 0, 0, 0, 1, 1,
0.2682329, 1.024006, 0.5108868, 0, 0, 0, 1, 1,
0.270229, -0.5417303, 3.511692, 0, 0, 0, 1, 1,
0.2754042, 0.1320613, 0.600768, 0, 0, 0, 1, 1,
0.2772661, 1.066119, -0.7698016, 0, 0, 0, 1, 1,
0.2785048, -0.4967546, 3.697032, 0, 0, 0, 1, 1,
0.2810709, -1.083504, 4.673985, 1, 1, 1, 1, 1,
0.2814153, -0.4111092, 3.167005, 1, 1, 1, 1, 1,
0.2817991, -0.1061881, 3.033384, 1, 1, 1, 1, 1,
0.2873505, -1.018392, 3.313881, 1, 1, 1, 1, 1,
0.2887045, 0.3387909, -0.4497782, 1, 1, 1, 1, 1,
0.2894167, -1.15712, 0.7397872, 1, 1, 1, 1, 1,
0.2901598, 1.073444, 0.4003288, 1, 1, 1, 1, 1,
0.2951953, 0.2673732, 2.25421, 1, 1, 1, 1, 1,
0.2980039, 0.8022188, 0.6676884, 1, 1, 1, 1, 1,
0.3106173, -0.9304195, 4.811563, 1, 1, 1, 1, 1,
0.3115208, -0.1387291, 3.018847, 1, 1, 1, 1, 1,
0.3117956, -0.2392271, 2.999195, 1, 1, 1, 1, 1,
0.3118258, 1.05338, 0.06424573, 1, 1, 1, 1, 1,
0.3144744, 0.6966144, 0.8170692, 1, 1, 1, 1, 1,
0.3225876, -0.3181546, 2.058332, 1, 1, 1, 1, 1,
0.3229958, -1.735662, 3.323205, 0, 0, 1, 1, 1,
0.3242391, -1.614617, 2.724613, 1, 0, 0, 1, 1,
0.328138, 0.7901775, -1.397153, 1, 0, 0, 1, 1,
0.3461512, -0.7810362, 1.350334, 1, 0, 0, 1, 1,
0.3485118, 1.081295, -0.6294412, 1, 0, 0, 1, 1,
0.3486478, 2.703522, 0.04679825, 1, 0, 0, 1, 1,
0.3500414, -2.620381, 2.23028, 0, 0, 0, 1, 1,
0.3531068, -0.002573052, 2.353518, 0, 0, 0, 1, 1,
0.3531344, -0.3468497, 2.806123, 0, 0, 0, 1, 1,
0.3541849, 1.027165, 1.395087, 0, 0, 0, 1, 1,
0.3562058, -0.7097937, 3.336761, 0, 0, 0, 1, 1,
0.3583148, -0.2737024, 3.076392, 0, 0, 0, 1, 1,
0.358321, -0.7973985, 3.385522, 0, 0, 0, 1, 1,
0.359241, 1.796384, 0.07048319, 1, 1, 1, 1, 1,
0.3620847, 1.128805, 0.9417141, 1, 1, 1, 1, 1,
0.36215, 0.08954511, 2.347087, 1, 1, 1, 1, 1,
0.3642863, -0.2641828, 2.60886, 1, 1, 1, 1, 1,
0.3669028, -0.7009394, 2.611161, 1, 1, 1, 1, 1,
0.3735079, 0.07387581, 2.273316, 1, 1, 1, 1, 1,
0.3735537, 0.6090469, 1.367771, 1, 1, 1, 1, 1,
0.3746213, -0.5738116, 1.809454, 1, 1, 1, 1, 1,
0.376582, 1.376392, 1.278891, 1, 1, 1, 1, 1,
0.3777456, 0.4758965, 1.227332, 1, 1, 1, 1, 1,
0.3781729, 0.8445418, 1.166325, 1, 1, 1, 1, 1,
0.3782908, -0.1255444, 1.815908, 1, 1, 1, 1, 1,
0.3818592, -0.9197659, 3.535179, 1, 1, 1, 1, 1,
0.3829224, -0.4236804, 1.225779, 1, 1, 1, 1, 1,
0.3887545, 0.7910913, -0.1709844, 1, 1, 1, 1, 1,
0.3909284, 1.313467, -1.519325, 0, 0, 1, 1, 1,
0.3919622, 0.4047189, -0.3492484, 1, 0, 0, 1, 1,
0.3930353, 1.272448, 1.369206, 1, 0, 0, 1, 1,
0.394035, -0.4510473, 2.251833, 1, 0, 0, 1, 1,
0.3965215, -0.9506961, 3.163309, 1, 0, 0, 1, 1,
0.3968919, 1.433984, -0.345649, 1, 0, 0, 1, 1,
0.3983926, -2.031296, 2.518805, 0, 0, 0, 1, 1,
0.4026897, 0.3723558, 0.06253138, 0, 0, 0, 1, 1,
0.405009, -0.7562672, 2.318022, 0, 0, 0, 1, 1,
0.4106455, -1.176765, 2.441933, 0, 0, 0, 1, 1,
0.4121727, 2.087213, 0.7335406, 0, 0, 0, 1, 1,
0.4147367, 1.062219, 1.02426, 0, 0, 0, 1, 1,
0.4174065, 0.4858195, -1.215117, 0, 0, 0, 1, 1,
0.4175951, -2.478585, 3.285751, 1, 1, 1, 1, 1,
0.4208168, 1.046569, -0.07273389, 1, 1, 1, 1, 1,
0.4209408, -1.838779, 2.167766, 1, 1, 1, 1, 1,
0.4210834, 0.1719147, 0.8040384, 1, 1, 1, 1, 1,
0.4284299, -1.17808, 2.77829, 1, 1, 1, 1, 1,
0.4308134, 1.507221, 1.121338, 1, 1, 1, 1, 1,
0.4316049, -0.7739079, 2.888113, 1, 1, 1, 1, 1,
0.4368119, -0.4187296, 3.50244, 1, 1, 1, 1, 1,
0.437333, 0.5789265, 1.143966, 1, 1, 1, 1, 1,
0.4382538, 2.630079, -0.2220074, 1, 1, 1, 1, 1,
0.4417035, 0.9787104, -0.8625521, 1, 1, 1, 1, 1,
0.4439682, -1.543895, 2.354399, 1, 1, 1, 1, 1,
0.444463, -1.133734, 5.048199, 1, 1, 1, 1, 1,
0.4475977, -0.0283997, 0.8836064, 1, 1, 1, 1, 1,
0.4489228, 1.116328, 1.625858, 1, 1, 1, 1, 1,
0.4506345, -0.6290812, 1.344158, 0, 0, 1, 1, 1,
0.4545931, 0.6215462, 2.218305, 1, 0, 0, 1, 1,
0.4585359, 1.12198, 1.270388, 1, 0, 0, 1, 1,
0.4654309, -2.279981, 1.951442, 1, 0, 0, 1, 1,
0.4676618, 0.8961427, 0.9011899, 1, 0, 0, 1, 1,
0.4709056, -0.01016355, 1.403918, 1, 0, 0, 1, 1,
0.4748306, -1.645512, 1.917913, 0, 0, 0, 1, 1,
0.4788662, -0.7019253, 1.712742, 0, 0, 0, 1, 1,
0.4802997, -0.864764, 3.051056, 0, 0, 0, 1, 1,
0.4852746, -1.23061, 2.231648, 0, 0, 0, 1, 1,
0.4860374, -0.009833707, 1.360155, 0, 0, 0, 1, 1,
0.4866296, 1.036862, -1.349459, 0, 0, 0, 1, 1,
0.4871084, 0.1617688, 2.10043, 0, 0, 0, 1, 1,
0.4919373, -0.002514604, 1.075911, 1, 1, 1, 1, 1,
0.4964994, 1.298985, 0.9399995, 1, 1, 1, 1, 1,
0.4995664, 1.386851, 0.8020177, 1, 1, 1, 1, 1,
0.5038444, 1.333984, -1.378158, 1, 1, 1, 1, 1,
0.5046467, -0.5589052, 2.733565, 1, 1, 1, 1, 1,
0.5048534, -0.0001821461, 3.17374, 1, 1, 1, 1, 1,
0.5065496, -0.05126732, 2.194341, 1, 1, 1, 1, 1,
0.5108974, -0.4979662, 1.924785, 1, 1, 1, 1, 1,
0.5114001, -1.143375, 3.146362, 1, 1, 1, 1, 1,
0.5129991, -0.5438789, 1.316017, 1, 1, 1, 1, 1,
0.5131917, 2.095016, -0.6256062, 1, 1, 1, 1, 1,
0.5133811, 1.053954, -0.9909894, 1, 1, 1, 1, 1,
0.5147943, 1.248721, 1.148716, 1, 1, 1, 1, 1,
0.5201942, 0.2912094, 0.6394612, 1, 1, 1, 1, 1,
0.5221772, 1.722835, 1.311154, 1, 1, 1, 1, 1,
0.5236735, 1.198905, -0.7362476, 0, 0, 1, 1, 1,
0.5269872, -1.522359, 1.273481, 1, 0, 0, 1, 1,
0.5318588, 0.6045417, 0.2906694, 1, 0, 0, 1, 1,
0.5356924, -0.1007136, 2.475233, 1, 0, 0, 1, 1,
0.5417747, -0.2810867, 2.65985, 1, 0, 0, 1, 1,
0.5496628, 0.613944, -0.602094, 1, 0, 0, 1, 1,
0.5543333, 0.5665711, 0.4733182, 0, 0, 0, 1, 1,
0.5593675, 0.803997, 0.4740364, 0, 0, 0, 1, 1,
0.5656633, -0.5661024, 2.16183, 0, 0, 0, 1, 1,
0.5658138, 0.4279661, 0.9009205, 0, 0, 0, 1, 1,
0.5660338, 0.2373318, -0.8686143, 0, 0, 0, 1, 1,
0.5759526, -2.370266, 4.290701, 0, 0, 0, 1, 1,
0.5795022, -0.09318403, 3.174263, 0, 0, 0, 1, 1,
0.585288, -2.06415, 1.929551, 1, 1, 1, 1, 1,
0.5876646, -0.08256985, 0.2959581, 1, 1, 1, 1, 1,
0.5877054, 0.3261962, 1.998455, 1, 1, 1, 1, 1,
0.5905394, -0.1141219, 0.9688917, 1, 1, 1, 1, 1,
0.5905578, 1.037568, 1.985676, 1, 1, 1, 1, 1,
0.5950786, -1.118507, 2.70211, 1, 1, 1, 1, 1,
0.5954826, 0.9676633, 1.540545, 1, 1, 1, 1, 1,
0.5968497, 3.152686, 0.5488312, 1, 1, 1, 1, 1,
0.5980446, -0.439742, 2.910263, 1, 1, 1, 1, 1,
0.6023117, 0.1892404, 0.4342987, 1, 1, 1, 1, 1,
0.6031885, 1.363415, 0.9907307, 1, 1, 1, 1, 1,
0.6044536, -0.2771685, 0.3314039, 1, 1, 1, 1, 1,
0.616527, 0.8210092, -0.7903572, 1, 1, 1, 1, 1,
0.6174424, 1.551968, 0.9294304, 1, 1, 1, 1, 1,
0.6240391, -0.2264986, 1.813113, 1, 1, 1, 1, 1,
0.6298077, -0.6101661, 0.933042, 0, 0, 1, 1, 1,
0.6307993, 0.1883284, 0.8872241, 1, 0, 0, 1, 1,
0.6333885, 0.3472986, 2.276042, 1, 0, 0, 1, 1,
0.6588258, -0.2918548, 2.713089, 1, 0, 0, 1, 1,
0.6607395, 1.850943, 2.378172, 1, 0, 0, 1, 1,
0.6682339, -0.3245942, 2.948247, 1, 0, 0, 1, 1,
0.6708475, -0.6542439, 3.474139, 0, 0, 0, 1, 1,
0.679675, -0.4377911, 0.5869383, 0, 0, 0, 1, 1,
0.686987, 0.1226753, 0.9558178, 0, 0, 0, 1, 1,
0.6878854, 1.452891, 1.029021, 0, 0, 0, 1, 1,
0.6922654, -0.8614553, 0.9459667, 0, 0, 0, 1, 1,
0.6931546, 1.039602, 0.250931, 0, 0, 0, 1, 1,
0.6936259, 0.1612042, 0.4676265, 0, 0, 0, 1, 1,
0.6971229, -2.873825, 2.965762, 1, 1, 1, 1, 1,
0.7045279, 0.2826798, 1.613836, 1, 1, 1, 1, 1,
0.7090923, 0.2618785, 2.004968, 1, 1, 1, 1, 1,
0.7107597, 0.7522132, -1.192407, 1, 1, 1, 1, 1,
0.7134968, 0.8173992, 0.6311028, 1, 1, 1, 1, 1,
0.720814, 0.04704267, 0.8194611, 1, 1, 1, 1, 1,
0.7293789, 1.690321, 0.6178799, 1, 1, 1, 1, 1,
0.7307413, -1.758387, 1.992071, 1, 1, 1, 1, 1,
0.7380285, 0.01448881, 1.033392, 1, 1, 1, 1, 1,
0.7391185, 0.3496614, 0.2490577, 1, 1, 1, 1, 1,
0.7431263, 0.3954353, 1.689586, 1, 1, 1, 1, 1,
0.7440842, 0.03337814, 0.1320632, 1, 1, 1, 1, 1,
0.745746, -1.345797, 4.691731, 1, 1, 1, 1, 1,
0.7460092, 0.4324357, 1.60006, 1, 1, 1, 1, 1,
0.7476808, -0.9590098, 2.2744, 1, 1, 1, 1, 1,
0.7480155, -0.5575093, 2.021702, 0, 0, 1, 1, 1,
0.7492285, -1.154401, 4.222128, 1, 0, 0, 1, 1,
0.7509648, -0.3152089, 2.726961, 1, 0, 0, 1, 1,
0.7542453, -0.3701594, 1.677138, 1, 0, 0, 1, 1,
0.7550344, -0.1300848, 3.398128, 1, 0, 0, 1, 1,
0.7550443, 0.2071265, 0.7372704, 1, 0, 0, 1, 1,
0.7601589, -0.04375578, 0.8702973, 0, 0, 0, 1, 1,
0.7621534, 1.567572, 0.8240736, 0, 0, 0, 1, 1,
0.7670822, -0.1600817, 2.915716, 0, 0, 0, 1, 1,
0.7747212, 0.5193632, 1.541826, 0, 0, 0, 1, 1,
0.7767838, -1.443321, 2.780482, 0, 0, 0, 1, 1,
0.7779049, 0.7081141, 0.4229001, 0, 0, 0, 1, 1,
0.7817663, 0.4424049, -1.063938, 0, 0, 0, 1, 1,
0.7897506, 1.315516, 0.7965175, 1, 1, 1, 1, 1,
0.7942594, -0.5063804, 4.124226, 1, 1, 1, 1, 1,
0.8038013, -0.64529, 1.499316, 1, 1, 1, 1, 1,
0.8139735, 1.816336, 0.1396874, 1, 1, 1, 1, 1,
0.8171721, -1.02789, 3.464599, 1, 1, 1, 1, 1,
0.8196409, -0.5398528, -0.2300033, 1, 1, 1, 1, 1,
0.8212932, -0.1602364, 2.625369, 1, 1, 1, 1, 1,
0.8227356, -0.04081948, 0.5686396, 1, 1, 1, 1, 1,
0.8237732, -0.6302996, 1.764927, 1, 1, 1, 1, 1,
0.8274353, -0.2840554, 2.028783, 1, 1, 1, 1, 1,
0.8306627, 1.270823, -0.3678276, 1, 1, 1, 1, 1,
0.8314783, 0.5635929, 1.691882, 1, 1, 1, 1, 1,
0.8386427, 0.3318826, 1.862478, 1, 1, 1, 1, 1,
0.8419977, -0.01201429, 2.311849, 1, 1, 1, 1, 1,
0.8452734, -0.01973048, 2.376935, 1, 1, 1, 1, 1,
0.8535523, -0.6020299, 3.561621, 0, 0, 1, 1, 1,
0.856667, -0.4593617, 1.199911, 1, 0, 0, 1, 1,
0.8567082, 0.6937706, 2.552171, 1, 0, 0, 1, 1,
0.8582295, 0.3374419, 1.446037, 1, 0, 0, 1, 1,
0.8612652, -0.1317247, 0.8551318, 1, 0, 0, 1, 1,
0.865836, -0.1135553, 1.624342, 1, 0, 0, 1, 1,
0.8676929, 1.314708, -0.8448282, 0, 0, 0, 1, 1,
0.8711546, 0.0624628, 2.933565, 0, 0, 0, 1, 1,
0.8716004, 1.818637, 0.7170449, 0, 0, 0, 1, 1,
0.8757681, -0.05911992, 1.188221, 0, 0, 0, 1, 1,
0.8758222, -0.7721391, 4.056436, 0, 0, 0, 1, 1,
0.8765141, -1.888607, 3.253417, 0, 0, 0, 1, 1,
0.8782812, 0.4162552, 1.015001, 0, 0, 0, 1, 1,
0.8809162, 1.932354, 1.863548, 1, 1, 1, 1, 1,
0.8860427, -0.4010269, 1.45842, 1, 1, 1, 1, 1,
0.8886093, -0.6820959, 4.174614, 1, 1, 1, 1, 1,
0.8889453, 0.7365102, -0.4653813, 1, 1, 1, 1, 1,
0.8908617, -1.061677, 2.417543, 1, 1, 1, 1, 1,
0.9055021, -0.5522609, 1.294181, 1, 1, 1, 1, 1,
0.9061557, 0.5053923, 1.553497, 1, 1, 1, 1, 1,
0.9099138, 0.3552073, 2.004348, 1, 1, 1, 1, 1,
0.9216217, 0.05101639, 2.74522, 1, 1, 1, 1, 1,
0.9230757, -1.125661, 3.032253, 1, 1, 1, 1, 1,
0.9285212, -0.549909, 2.241791, 1, 1, 1, 1, 1,
0.9304078, -0.8904226, 3.885677, 1, 1, 1, 1, 1,
0.9480908, -0.2625906, 2.438508, 1, 1, 1, 1, 1,
0.9556237, 0.1604265, -0.3955222, 1, 1, 1, 1, 1,
0.9573072, 0.7711366, -0.03559938, 1, 1, 1, 1, 1,
0.9669017, -1.210715, 2.392452, 0, 0, 1, 1, 1,
0.9769664, -1.906074, 5.409579, 1, 0, 0, 1, 1,
0.9770257, 0.6979486, 0.7054536, 1, 0, 0, 1, 1,
0.9873603, 0.3280392, 3.434098, 1, 0, 0, 1, 1,
0.9907016, 0.04055284, 0.8107293, 1, 0, 0, 1, 1,
0.9913258, -0.6215407, 2.018826, 1, 0, 0, 1, 1,
1.00167, 0.9997349, -0.5836498, 0, 0, 0, 1, 1,
1.009944, -0.4283692, 1.139416, 0, 0, 0, 1, 1,
1.011967, -0.1580606, 0.8853811, 0, 0, 0, 1, 1,
1.016883, -0.6524177, 2.681073, 0, 0, 0, 1, 1,
1.020458, -0.1350182, 2.082222, 0, 0, 0, 1, 1,
1.027308, -0.3658392, 2.498185, 0, 0, 0, 1, 1,
1.029816, 0.3087194, 3.476268, 0, 0, 0, 1, 1,
1.030103, 0.3471066, 2.469108, 1, 1, 1, 1, 1,
1.03473, -0.8100926, 2.91327, 1, 1, 1, 1, 1,
1.035618, -0.07201141, 2.003664, 1, 1, 1, 1, 1,
1.038054, -0.6059795, 2.525083, 1, 1, 1, 1, 1,
1.038888, 0.8752242, 0.05573415, 1, 1, 1, 1, 1,
1.044621, -2.42326, 3.819113, 1, 1, 1, 1, 1,
1.046916, -1.992341, 1.675276, 1, 1, 1, 1, 1,
1.047318, 0.2229791, 0.8873489, 1, 1, 1, 1, 1,
1.060355, -1.382518, 3.26362, 1, 1, 1, 1, 1,
1.061639, 1.443509, 1.410795, 1, 1, 1, 1, 1,
1.062262, 0.3029773, 2.15655, 1, 1, 1, 1, 1,
1.0623, -0.2811619, 1.868316, 1, 1, 1, 1, 1,
1.075366, -0.623681, 2.256629, 1, 1, 1, 1, 1,
1.083831, -0.8003673, 2.659473, 1, 1, 1, 1, 1,
1.08646, -0.01277114, 0.7436364, 1, 1, 1, 1, 1,
1.08657, -1.848939, 2.790274, 0, 0, 1, 1, 1,
1.088324, -0.3321209, 2.997414, 1, 0, 0, 1, 1,
1.089704, 0.285406, 2.052615, 1, 0, 0, 1, 1,
1.090062, -0.3617785, 2.768116, 1, 0, 0, 1, 1,
1.097999, 0.06224278, 2.799303, 1, 0, 0, 1, 1,
1.101362, -2.268573, 1.558721, 1, 0, 0, 1, 1,
1.101776, 0.2653725, 0.4366191, 0, 0, 0, 1, 1,
1.103806, -0.1339546, 1.548373, 0, 0, 0, 1, 1,
1.109878, -0.07421479, 3.398433, 0, 0, 0, 1, 1,
1.113013, -1.163578, 2.767388, 0, 0, 0, 1, 1,
1.11508, 0.9236566, 1.589117, 0, 0, 0, 1, 1,
1.117149, -2.148089, 1.852672, 0, 0, 0, 1, 1,
1.137876, -0.268833, 2.947913, 0, 0, 0, 1, 1,
1.140192, 0.04351788, 0.2413242, 1, 1, 1, 1, 1,
1.140265, -0.3261423, 3.18745, 1, 1, 1, 1, 1,
1.14505, 0.1539701, 3.656738, 1, 1, 1, 1, 1,
1.153431, 0.8604195, -1.243809, 1, 1, 1, 1, 1,
1.197564, -0.967199, 3.553304, 1, 1, 1, 1, 1,
1.201913, 0.4124101, 1.527385, 1, 1, 1, 1, 1,
1.208697, -0.6757649, 1.921391, 1, 1, 1, 1, 1,
1.21403, 0.1567474, 2.032971, 1, 1, 1, 1, 1,
1.216516, 0.08924703, 1.193986, 1, 1, 1, 1, 1,
1.227193, -0.7896321, 2.465056, 1, 1, 1, 1, 1,
1.227883, -1.421202, 2.245245, 1, 1, 1, 1, 1,
1.244797, 1.975681, 0.4041969, 1, 1, 1, 1, 1,
1.247029, 0.4174052, 0.01228384, 1, 1, 1, 1, 1,
1.249274, 1.282173, 1.129592, 1, 1, 1, 1, 1,
1.252088, 1.117515, -0.0809155, 1, 1, 1, 1, 1,
1.2617, 1.29101, 1.007453, 0, 0, 1, 1, 1,
1.262623, 0.6407372, 0.2809691, 1, 0, 0, 1, 1,
1.264274, 0.540204, 1.922177, 1, 0, 0, 1, 1,
1.264437, -1.622476, 2.947148, 1, 0, 0, 1, 1,
1.285424, 0.487743, 2.193967, 1, 0, 0, 1, 1,
1.294642, 0.2750096, 1.537151, 1, 0, 0, 1, 1,
1.302751, 1.338047, 0.1206167, 0, 0, 0, 1, 1,
1.30419, -1.192175, 4.378328, 0, 0, 0, 1, 1,
1.305122, 0.2174128, 0.7200907, 0, 0, 0, 1, 1,
1.305784, -0.09927216, 4.367635, 0, 0, 0, 1, 1,
1.312074, 0.2211447, 0.4177876, 0, 0, 0, 1, 1,
1.313274, 0.4499353, 1.508828, 0, 0, 0, 1, 1,
1.319899, 1.173302, 1.427958, 0, 0, 0, 1, 1,
1.321361, -0.5471322, 1.526564, 1, 1, 1, 1, 1,
1.322591, 0.4764012, 2.419878, 1, 1, 1, 1, 1,
1.337401, 0.1149741, 1.500194, 1, 1, 1, 1, 1,
1.340946, 0.2789129, 0.6680748, 1, 1, 1, 1, 1,
1.345712, 1.076909, -0.1413094, 1, 1, 1, 1, 1,
1.363222, 0.2526698, 1.760629, 1, 1, 1, 1, 1,
1.368961, 0.3885707, 1.247131, 1, 1, 1, 1, 1,
1.370326, 0.04108761, 1.575717, 1, 1, 1, 1, 1,
1.376184, -0.874322, 1.762951, 1, 1, 1, 1, 1,
1.388034, -1.451877, 1.935, 1, 1, 1, 1, 1,
1.399805, -2.68761, 0.6673146, 1, 1, 1, 1, 1,
1.406526, -0.8535674, 2.453909, 1, 1, 1, 1, 1,
1.407794, -0.1185803, 2.084043, 1, 1, 1, 1, 1,
1.41198, -0.8590334, 2.257063, 1, 1, 1, 1, 1,
1.413387, 0.6829448, -1.045941, 1, 1, 1, 1, 1,
1.418816, -1.238591, 3.122993, 0, 0, 1, 1, 1,
1.428068, -1.046038, 3.579315, 1, 0, 0, 1, 1,
1.43141, -0.4724677, 2.086302, 1, 0, 0, 1, 1,
1.440388, 1.511676, 0.8148232, 1, 0, 0, 1, 1,
1.443212, 1.155107, 2.790292, 1, 0, 0, 1, 1,
1.445157, 0.6057237, 1.817255, 1, 0, 0, 1, 1,
1.452454, 0.2457305, 0.2146646, 0, 0, 0, 1, 1,
1.468578, -1.272829, 1.688946, 0, 0, 0, 1, 1,
1.473502, 0.6402754, 0.9248932, 0, 0, 0, 1, 1,
1.474314, 1.439237, 1.948279, 0, 0, 0, 1, 1,
1.476559, -0.1703069, -0.3916873, 0, 0, 0, 1, 1,
1.479841, 1.169088, 0.6073257, 0, 0, 0, 1, 1,
1.49772, -0.702001, 2.765889, 0, 0, 0, 1, 1,
1.498013, 0.5974483, 1.061697, 1, 1, 1, 1, 1,
1.499043, 0.963128, 1.095482, 1, 1, 1, 1, 1,
1.507015, -0.2346308, 1.676267, 1, 1, 1, 1, 1,
1.515353, -0.4774292, 1.662467, 1, 1, 1, 1, 1,
1.517619, -0.1692012, 3.384182, 1, 1, 1, 1, 1,
1.531271, -0.08949517, 3.589042, 1, 1, 1, 1, 1,
1.54026, -0.3901921, 1.856466, 1, 1, 1, 1, 1,
1.559972, -0.7462566, 1.755641, 1, 1, 1, 1, 1,
1.592366, 0.6168911, 1.283031, 1, 1, 1, 1, 1,
1.60343, 0.2966825, 1.423639, 1, 1, 1, 1, 1,
1.607903, 1.228091, 1.742375, 1, 1, 1, 1, 1,
1.626693, -2.601101, 1.304595, 1, 1, 1, 1, 1,
1.641079, 0.9170331, 1.010101, 1, 1, 1, 1, 1,
1.652061, -0.5091395, 1.342286, 1, 1, 1, 1, 1,
1.661395, 0.276042, 1.586363, 1, 1, 1, 1, 1,
1.666659, 1.251547, 1.152274, 0, 0, 1, 1, 1,
1.696657, 1.697944, 0.1196783, 1, 0, 0, 1, 1,
1.7139, 0.3271908, 1.158278, 1, 0, 0, 1, 1,
1.730538, -0.8091298, 2.360534, 1, 0, 0, 1, 1,
1.738055, 0.9970651, 2.016773, 1, 0, 0, 1, 1,
1.755437, -0.5849407, 1.870564, 1, 0, 0, 1, 1,
1.759529, -0.03832268, 1.890705, 0, 0, 0, 1, 1,
1.763624, 0.8308139, 1.088216, 0, 0, 0, 1, 1,
1.782696, -0.0609745, 3.386061, 0, 0, 0, 1, 1,
1.796074, -1.938149, 2.613151, 0, 0, 0, 1, 1,
1.799961, 0.8301401, 0.2824186, 0, 0, 0, 1, 1,
1.806021, -0.9136406, 3.044481, 0, 0, 0, 1, 1,
1.833166, 1.286328, 1.88961, 0, 0, 0, 1, 1,
1.841054, 0.4893754, 1.491534, 1, 1, 1, 1, 1,
1.844449, 0.6864212, 1.026991, 1, 1, 1, 1, 1,
1.848573, -1.006186, 2.745876, 1, 1, 1, 1, 1,
1.863075, -1.004928, 0.8292992, 1, 1, 1, 1, 1,
1.88835, 0.004502149, 1.412635, 1, 1, 1, 1, 1,
1.904713, 0.05205779, 0.5503808, 1, 1, 1, 1, 1,
1.909124, -0.1269543, 1.116916, 1, 1, 1, 1, 1,
1.917108, 1.763245, 1.168914, 1, 1, 1, 1, 1,
1.930244, 1.790188, 1.136296, 1, 1, 1, 1, 1,
1.934302, 0.259879, 1.028173, 1, 1, 1, 1, 1,
1.948119, 1.495526, 0.5392505, 1, 1, 1, 1, 1,
1.950843, 2.581839, 2.670425, 1, 1, 1, 1, 1,
1.98345, -1.23145, 3.09896, 1, 1, 1, 1, 1,
2.004705, 0.7815768, -0.0826268, 1, 1, 1, 1, 1,
2.017656, -0.6372638, 1.616536, 1, 1, 1, 1, 1,
2.024311, -0.317226, 2.065692, 0, 0, 1, 1, 1,
2.041455, -0.3836906, 1.428668, 1, 0, 0, 1, 1,
2.052688, 0.07298604, 1.818384, 1, 0, 0, 1, 1,
2.098342, 0.4432225, 1.900809, 1, 0, 0, 1, 1,
2.106826, -0.6049942, 1.798375, 1, 0, 0, 1, 1,
2.140809, 0.06561436, 2.312359, 1, 0, 0, 1, 1,
2.214224, 2.410695, 2.17784, 0, 0, 0, 1, 1,
2.252256, 0.1079701, 0.4314562, 0, 0, 0, 1, 1,
2.253482, 0.62994, 1.307657, 0, 0, 0, 1, 1,
2.290536, -0.2212176, 0.8291271, 0, 0, 0, 1, 1,
2.356298, -0.6872847, 1.306646, 0, 0, 0, 1, 1,
2.41029, 0.1681752, -0.558354, 0, 0, 0, 1, 1,
2.42937, -0.5979921, 1.261151, 0, 0, 0, 1, 1,
2.459101, 1.168099, 0.734382, 1, 1, 1, 1, 1,
2.545584, -0.2715332, 1.710164, 1, 1, 1, 1, 1,
2.548832, -2.575589, 3.744823, 1, 1, 1, 1, 1,
2.624602, 0.212799, -0.08880414, 1, 1, 1, 1, 1,
2.831665, 0.5830835, 0.09875964, 1, 1, 1, 1, 1,
3.230083, -0.05261924, 2.5291, 1, 1, 1, 1, 1,
3.266207, 0.6873304, 1.944244, 1, 1, 1, 1, 1
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
var radius = 9.77152;
var distance = 34.32205;
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
mvMatrix.translate( 0.1108766, -0.2799473, 0.1095126 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.32205);
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
