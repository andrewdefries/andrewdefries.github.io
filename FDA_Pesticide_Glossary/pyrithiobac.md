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
-2.917978, -0.6805921, -1.503401, 1, 0, 0, 1,
-2.817103, -1.06694, -1.516495, 1, 0.007843138, 0, 1,
-2.74362, -2.107502, -1.562662, 1, 0.01176471, 0, 1,
-2.658168, 0.9216597, -1.284473, 1, 0.01960784, 0, 1,
-2.653821, 0.2099916, -2.027327, 1, 0.02352941, 0, 1,
-2.513792, -0.8594944, -1.484976, 1, 0.03137255, 0, 1,
-2.509978, -0.1625177, -0.1037381, 1, 0.03529412, 0, 1,
-2.50807, 1.306893, -0.2320351, 1, 0.04313726, 0, 1,
-2.493719, -0.9184701, -2.173937, 1, 0.04705882, 0, 1,
-2.304261, 1.002257, 0.1958904, 1, 0.05490196, 0, 1,
-2.293756, 1.548076, 0.6151651, 1, 0.05882353, 0, 1,
-2.229448, 2.281658, -1.104293, 1, 0.06666667, 0, 1,
-2.194022, 0.0117195, -0.1341413, 1, 0.07058824, 0, 1,
-2.189355, -0.6001709, -1.456359, 1, 0.07843138, 0, 1,
-2.172089, 0.6866241, -2.34693, 1, 0.08235294, 0, 1,
-2.135867, -1.637714, -3.75486, 1, 0.09019608, 0, 1,
-2.117405, -1.297908, -3.030381, 1, 0.09411765, 0, 1,
-2.053584, -0.3933272, -2.727671, 1, 0.1019608, 0, 1,
-2.024513, -1.054287, -1.252288, 1, 0.1098039, 0, 1,
-1.991201, 0.9877614, 0.9318022, 1, 0.1137255, 0, 1,
-1.925591, 0.06576738, -2.14301, 1, 0.1215686, 0, 1,
-1.893904, -1.944334, -0.9965539, 1, 0.1254902, 0, 1,
-1.870079, 0.7408908, -1.982315, 1, 0.1333333, 0, 1,
-1.864478, -0.7267292, -3.281017, 1, 0.1372549, 0, 1,
-1.828572, 1.618006, -1.543399, 1, 0.145098, 0, 1,
-1.799407, -0.3126478, -3.192428, 1, 0.1490196, 0, 1,
-1.786608, -1.328206, -4.153622, 1, 0.1568628, 0, 1,
-1.777664, 0.5607136, -1.153701, 1, 0.1607843, 0, 1,
-1.752516, -1.726578, -2.244775, 1, 0.1686275, 0, 1,
-1.742284, 0.1130427, -1.529057, 1, 0.172549, 0, 1,
-1.724062, 1.906234, 0.8449478, 1, 0.1803922, 0, 1,
-1.706225, 1.529011, -0.1961185, 1, 0.1843137, 0, 1,
-1.69418, -0.05901793, -3.113284, 1, 0.1921569, 0, 1,
-1.683396, -0.5670393, -2.050426, 1, 0.1960784, 0, 1,
-1.680015, 0.6802143, -2.016854, 1, 0.2039216, 0, 1,
-1.676658, 1.62761, -2.083808, 1, 0.2117647, 0, 1,
-1.668392, -0.9728224, -1.503193, 1, 0.2156863, 0, 1,
-1.668275, 0.8482795, 0.06931356, 1, 0.2235294, 0, 1,
-1.652323, 0.8810443, -2.726009, 1, 0.227451, 0, 1,
-1.619665, -0.0647429, -3.382653, 1, 0.2352941, 0, 1,
-1.619118, -0.7133404, -2.153378, 1, 0.2392157, 0, 1,
-1.60272, -0.5338055, -2.008037, 1, 0.2470588, 0, 1,
-1.6026, 1.468431, -2.683577, 1, 0.2509804, 0, 1,
-1.595095, 0.7143021, -3.278801, 1, 0.2588235, 0, 1,
-1.563957, -1.548206, -2.030407, 1, 0.2627451, 0, 1,
-1.531309, 1.127113, 0.4233082, 1, 0.2705882, 0, 1,
-1.526621, 0.9696536, -2.561871, 1, 0.2745098, 0, 1,
-1.52193, -0.6747732, -0.4125632, 1, 0.282353, 0, 1,
-1.520081, 0.1343387, -2.953172, 1, 0.2862745, 0, 1,
-1.500976, -0.3250238, -3.058164, 1, 0.2941177, 0, 1,
-1.483805, -0.1980975, -2.868075, 1, 0.3019608, 0, 1,
-1.479605, 0.275519, -0.5623397, 1, 0.3058824, 0, 1,
-1.475131, 0.2697047, -2.243349, 1, 0.3137255, 0, 1,
-1.469316, 0.08207135, -2.782647, 1, 0.3176471, 0, 1,
-1.463653, -0.5642524, -1.456074, 1, 0.3254902, 0, 1,
-1.446721, -0.1770023, 0.8540897, 1, 0.3294118, 0, 1,
-1.444111, 1.607024, -1.994218, 1, 0.3372549, 0, 1,
-1.443581, 1.638433, 1.488588, 1, 0.3411765, 0, 1,
-1.43347, -0.05727432, -3.338998, 1, 0.3490196, 0, 1,
-1.432307, 1.200072, 0.5763621, 1, 0.3529412, 0, 1,
-1.424482, -0.4905378, -2.549624, 1, 0.3607843, 0, 1,
-1.419105, 0.5178057, -1.447054, 1, 0.3647059, 0, 1,
-1.407982, -1.722726, -2.475377, 1, 0.372549, 0, 1,
-1.403181, -1.786211, -0.8900112, 1, 0.3764706, 0, 1,
-1.401814, 0.5075249, -1.970454, 1, 0.3843137, 0, 1,
-1.398363, 0.5961283, -2.671072, 1, 0.3882353, 0, 1,
-1.389061, -1.815911, -4.525188, 1, 0.3960784, 0, 1,
-1.387385, -1.531645, -3.166691, 1, 0.4039216, 0, 1,
-1.385456, 0.2807689, -0.6919113, 1, 0.4078431, 0, 1,
-1.384215, -0.6795202, -2.762695, 1, 0.4156863, 0, 1,
-1.380038, 0.001636677, -2.684832, 1, 0.4196078, 0, 1,
-1.371887, 1.516428, -2.410069, 1, 0.427451, 0, 1,
-1.365444, -0.5960981, -2.308872, 1, 0.4313726, 0, 1,
-1.352676, 0.03023999, -2.074543, 1, 0.4392157, 0, 1,
-1.351079, -0.08937029, -1.117005, 1, 0.4431373, 0, 1,
-1.333703, 0.4676737, -1.742182, 1, 0.4509804, 0, 1,
-1.319554, 1.605945, -0.9658684, 1, 0.454902, 0, 1,
-1.319485, -0.31859, -2.082207, 1, 0.4627451, 0, 1,
-1.308115, -0.2376155, -1.871571, 1, 0.4666667, 0, 1,
-1.307897, 0.03787399, -2.256428, 1, 0.4745098, 0, 1,
-1.30132, 0.09705369, -1.357031, 1, 0.4784314, 0, 1,
-1.300112, -0.3040763, -1.862775, 1, 0.4862745, 0, 1,
-1.297292, 1.369134, -1.545941, 1, 0.4901961, 0, 1,
-1.289839, -0.8151273, -2.057564, 1, 0.4980392, 0, 1,
-1.288662, 1.66504, -2.454821, 1, 0.5058824, 0, 1,
-1.284901, 0.9134369, 1.037118, 1, 0.509804, 0, 1,
-1.278597, -0.0872848, -1.72886, 1, 0.5176471, 0, 1,
-1.277541, 0.6189312, -0.05766179, 1, 0.5215687, 0, 1,
-1.27655, -0.7839562, -0.6278131, 1, 0.5294118, 0, 1,
-1.276394, 0.8604776, -0.9615782, 1, 0.5333334, 0, 1,
-1.276324, -0.3061111, -1.99661, 1, 0.5411765, 0, 1,
-1.276192, -0.003401987, -1.83913, 1, 0.5450981, 0, 1,
-1.273944, 2.260448, -0.5293758, 1, 0.5529412, 0, 1,
-1.265754, 0.4933845, -1.137305, 1, 0.5568628, 0, 1,
-1.253565, 1.00971, -3.087013, 1, 0.5647059, 0, 1,
-1.25213, 1.419879, -1.111895, 1, 0.5686275, 0, 1,
-1.251938, 0.244158, -2.429288, 1, 0.5764706, 0, 1,
-1.230724, 0.529461, -1.788616, 1, 0.5803922, 0, 1,
-1.225873, -0.03598186, -0.2034824, 1, 0.5882353, 0, 1,
-1.212817, -0.3287334, -0.8278589, 1, 0.5921569, 0, 1,
-1.208715, -1.85175, -1.548262, 1, 0.6, 0, 1,
-1.206112, -0.2911545, -2.17974, 1, 0.6078432, 0, 1,
-1.191693, -0.6828616, -2.11894, 1, 0.6117647, 0, 1,
-1.179237, 1.40645, 0.3856044, 1, 0.6196079, 0, 1,
-1.170357, 1.223791, -2.860798, 1, 0.6235294, 0, 1,
-1.161799, -0.01008484, -1.260696, 1, 0.6313726, 0, 1,
-1.156599, -0.9968863, -1.099494, 1, 0.6352941, 0, 1,
-1.150327, -0.8335299, -3.66724, 1, 0.6431373, 0, 1,
-1.140767, 1.143351, -0.4943425, 1, 0.6470588, 0, 1,
-1.139532, -0.6595719, -3.685859, 1, 0.654902, 0, 1,
-1.136933, -0.5501438, -1.639706, 1, 0.6588235, 0, 1,
-1.128832, 1.478852, -1.096524, 1, 0.6666667, 0, 1,
-1.125167, 0.5528204, -0.2546998, 1, 0.6705883, 0, 1,
-1.118779, 1.710284, -0.9708703, 1, 0.6784314, 0, 1,
-1.110124, -0.8520738, -2.688659, 1, 0.682353, 0, 1,
-1.105158, 0.03710325, -1.22356, 1, 0.6901961, 0, 1,
-1.10035, -1.7037, -2.730307, 1, 0.6941177, 0, 1,
-1.095085, -0.2102022, -0.08444039, 1, 0.7019608, 0, 1,
-1.092252, 0.9343505, 1.46945, 1, 0.7098039, 0, 1,
-1.088133, 0.05625344, -2.450422, 1, 0.7137255, 0, 1,
-1.085023, 0.7069523, -0.6546957, 1, 0.7215686, 0, 1,
-1.070284, 0.6518984, -0.002070348, 1, 0.7254902, 0, 1,
-1.059061, 1.262153, -1.664627, 1, 0.7333333, 0, 1,
-1.058935, -0.8023584, -1.129404, 1, 0.7372549, 0, 1,
-1.058531, 1.36196, 0.7726258, 1, 0.7450981, 0, 1,
-1.057174, -0.895817, -1.408441, 1, 0.7490196, 0, 1,
-1.055487, 0.1889603, -2.049091, 1, 0.7568628, 0, 1,
-1.049095, -0.134653, -1.753558, 1, 0.7607843, 0, 1,
-1.047752, 1.889537, -2.478817, 1, 0.7686275, 0, 1,
-1.046166, -0.5277615, -1.625002, 1, 0.772549, 0, 1,
-1.045375, -0.7844514, -1.803547, 1, 0.7803922, 0, 1,
-1.044328, -0.3054197, -1.957034, 1, 0.7843137, 0, 1,
-1.036505, 0.09501224, -2.444196, 1, 0.7921569, 0, 1,
-1.0328, 0.2442413, 0.657092, 1, 0.7960784, 0, 1,
-1.030489, 1.576884, -0.9315228, 1, 0.8039216, 0, 1,
-1.028684, 0.2235824, -0.0701458, 1, 0.8117647, 0, 1,
-1.026884, -1.170195, -2.912387, 1, 0.8156863, 0, 1,
-1.024884, -0.1864495, -3.795924, 1, 0.8235294, 0, 1,
-1.020377, 0.07317038, -1.516895, 1, 0.827451, 0, 1,
-1.014234, -1.564685, -0.733796, 1, 0.8352941, 0, 1,
-1.012405, 1.477726, 0.399407, 1, 0.8392157, 0, 1,
-1.008915, 0.2472982, -0.1772452, 1, 0.8470588, 0, 1,
-1.007467, -0.1849451, -1.63965, 1, 0.8509804, 0, 1,
-0.9919851, 0.8930085, -1.960071, 1, 0.8588235, 0, 1,
-0.9881465, 0.2041973, 0.1189663, 1, 0.8627451, 0, 1,
-0.9834815, -1.457511, -1.441584, 1, 0.8705882, 0, 1,
-0.9786529, -2.064142, 0.1760732, 1, 0.8745098, 0, 1,
-0.9782678, 1.52945, 0.05253247, 1, 0.8823529, 0, 1,
-0.9719067, 2.637341, 0.8963773, 1, 0.8862745, 0, 1,
-0.9632939, -1.141503, -2.485206, 1, 0.8941177, 0, 1,
-0.9607117, -0.1816023, -1.448777, 1, 0.8980392, 0, 1,
-0.9546421, 1.1693, -1.460568, 1, 0.9058824, 0, 1,
-0.9531888, -0.4255307, -3.150311, 1, 0.9137255, 0, 1,
-0.9531074, -0.8041802, -1.257988, 1, 0.9176471, 0, 1,
-0.952894, 2.004303, -1.617293, 1, 0.9254902, 0, 1,
-0.952768, 0.4770277, -0.7013199, 1, 0.9294118, 0, 1,
-0.9339675, -0.3719088, -2.73041, 1, 0.9372549, 0, 1,
-0.9318146, 1.102581, -0.954491, 1, 0.9411765, 0, 1,
-0.931599, -0.142842, -1.615012, 1, 0.9490196, 0, 1,
-0.9295105, 0.6567954, -3.619512, 1, 0.9529412, 0, 1,
-0.927303, -0.5236478, -3.667968, 1, 0.9607843, 0, 1,
-0.9237279, 1.809216, -0.9674494, 1, 0.9647059, 0, 1,
-0.9217551, -1.478646, 0.03301577, 1, 0.972549, 0, 1,
-0.9195296, 0.1095216, -2.321834, 1, 0.9764706, 0, 1,
-0.9172279, 0.4158128, -1.963879, 1, 0.9843137, 0, 1,
-0.9136125, 2.109285, 0.3795067, 1, 0.9882353, 0, 1,
-0.8940659, -0.5981523, -3.328688, 1, 0.9960784, 0, 1,
-0.883925, 0.4599833, -3.977153, 0.9960784, 1, 0, 1,
-0.8830038, 0.5242928, -3.63514, 0.9921569, 1, 0, 1,
-0.8802294, 0.4495293, -1.018963, 0.9843137, 1, 0, 1,
-0.8799338, 0.9425597, -2.152632, 0.9803922, 1, 0, 1,
-0.8711034, 1.212288, -1.502827, 0.972549, 1, 0, 1,
-0.8639132, 0.4116615, -1.215081, 0.9686275, 1, 0, 1,
-0.8597291, 0.6186679, -0.123972, 0.9607843, 1, 0, 1,
-0.8597018, -0.8408805, -2.609964, 0.9568627, 1, 0, 1,
-0.8532495, 0.6389711, -2.022968, 0.9490196, 1, 0, 1,
-0.8522629, -0.06037755, -2.638446, 0.945098, 1, 0, 1,
-0.8508165, -1.78503, -2.40845, 0.9372549, 1, 0, 1,
-0.8507456, -1.579018, -1.949664, 0.9333333, 1, 0, 1,
-0.8436816, -0.1881109, -1.7084, 0.9254902, 1, 0, 1,
-0.8376796, 2.534613, -1.526358, 0.9215686, 1, 0, 1,
-0.8312016, 1.272448, -0.7488841, 0.9137255, 1, 0, 1,
-0.8293878, 1.30364, 0.3391609, 0.9098039, 1, 0, 1,
-0.8284031, 0.3283029, -2.228986, 0.9019608, 1, 0, 1,
-0.8277966, -0.3797624, -1.961225, 0.8941177, 1, 0, 1,
-0.8180509, 0.170338, -0.4283095, 0.8901961, 1, 0, 1,
-0.8162446, 0.2342301, -1.861542, 0.8823529, 1, 0, 1,
-0.8111741, 0.8939737, -0.08652164, 0.8784314, 1, 0, 1,
-0.805251, 0.8035613, 1.693993, 0.8705882, 1, 0, 1,
-0.7956987, -0.3560461, -1.319522, 0.8666667, 1, 0, 1,
-0.7919456, 0.1260857, -2.672432, 0.8588235, 1, 0, 1,
-0.7879152, 0.8732354, -0.5062242, 0.854902, 1, 0, 1,
-0.7867396, -0.2281818, -0.3760639, 0.8470588, 1, 0, 1,
-0.7814235, -0.1818722, -0.1328209, 0.8431373, 1, 0, 1,
-0.7765974, -1.01871, -3.437647, 0.8352941, 1, 0, 1,
-0.7702562, -0.5951115, -2.920819, 0.8313726, 1, 0, 1,
-0.7688213, 0.6866769, 0.08176606, 0.8235294, 1, 0, 1,
-0.7687683, -0.6661328, -0.4666749, 0.8196079, 1, 0, 1,
-0.7593524, 0.7987573, -0.01304602, 0.8117647, 1, 0, 1,
-0.7579647, 0.2187185, -2.281739, 0.8078431, 1, 0, 1,
-0.7537262, -0.7328684, -3.359833, 0.8, 1, 0, 1,
-0.7536068, 0.4733364, -1.043566, 0.7921569, 1, 0, 1,
-0.753236, 0.0581197, -0.05050704, 0.7882353, 1, 0, 1,
-0.7478953, -0.2662014, -1.965, 0.7803922, 1, 0, 1,
-0.7470835, 0.5784226, -1.67632, 0.7764706, 1, 0, 1,
-0.7427214, 2.453052, -0.8890699, 0.7686275, 1, 0, 1,
-0.7420144, -0.5340023, -1.739983, 0.7647059, 1, 0, 1,
-0.7366335, 0.2013322, -2.409893, 0.7568628, 1, 0, 1,
-0.7294373, 0.3775806, 0.5234496, 0.7529412, 1, 0, 1,
-0.711894, -1.894082, -3.171648, 0.7450981, 1, 0, 1,
-0.6984936, -1.464557, -2.195015, 0.7411765, 1, 0, 1,
-0.6965498, -0.6743386, -1.394539, 0.7333333, 1, 0, 1,
-0.6922123, -1.014455, -3.604647, 0.7294118, 1, 0, 1,
-0.6867397, 1.817764, -1.586999, 0.7215686, 1, 0, 1,
-0.6862401, 0.3327517, -2.54009, 0.7176471, 1, 0, 1,
-0.682148, -0.4007129, -1.853311, 0.7098039, 1, 0, 1,
-0.6775347, -0.3327752, -2.927103, 0.7058824, 1, 0, 1,
-0.6669689, -1.308407, -3.095842, 0.6980392, 1, 0, 1,
-0.6665735, -0.03406808, -1.991767, 0.6901961, 1, 0, 1,
-0.6618617, -1.773866, -3.361741, 0.6862745, 1, 0, 1,
-0.6597504, -1.877989, -2.918827, 0.6784314, 1, 0, 1,
-0.6578642, 0.03303367, -0.05153361, 0.6745098, 1, 0, 1,
-0.6571093, 0.4106706, -1.129959, 0.6666667, 1, 0, 1,
-0.6568843, 1.528936, -0.9378365, 0.6627451, 1, 0, 1,
-0.6542916, -0.9297404, -4.272041, 0.654902, 1, 0, 1,
-0.6529285, 0.6144684, -0.9401146, 0.6509804, 1, 0, 1,
-0.6486794, 0.01464179, -0.6291676, 0.6431373, 1, 0, 1,
-0.6449142, 1.818911, -1.16291, 0.6392157, 1, 0, 1,
-0.6438094, -0.06573015, -1.473234, 0.6313726, 1, 0, 1,
-0.6408414, -2.702061, -1.112522, 0.627451, 1, 0, 1,
-0.6403553, 1.43018, 1.250765, 0.6196079, 1, 0, 1,
-0.6401664, 0.1872734, -2.455769, 0.6156863, 1, 0, 1,
-0.6373766, -0.8186995, -1.495881, 0.6078432, 1, 0, 1,
-0.6318526, -0.7449957, -2.373803, 0.6039216, 1, 0, 1,
-0.6313604, 0.29724, -0.469155, 0.5960785, 1, 0, 1,
-0.6290842, 0.5256967, -1.055195, 0.5882353, 1, 0, 1,
-0.6283056, 0.4667574, -0.6740392, 0.5843138, 1, 0, 1,
-0.6277498, 1.420967, -0.5620691, 0.5764706, 1, 0, 1,
-0.6238168, 0.9061061, -0.003367936, 0.572549, 1, 0, 1,
-0.6209589, -0.7163187, -2.964409, 0.5647059, 1, 0, 1,
-0.6133314, -0.8312569, -1.392642, 0.5607843, 1, 0, 1,
-0.6105322, 0.5790761, 2.22762, 0.5529412, 1, 0, 1,
-0.6095163, 0.568518, -0.5874814, 0.5490196, 1, 0, 1,
-0.6082276, -0.2636444, -2.735192, 0.5411765, 1, 0, 1,
-0.6046494, -0.7427181, -1.494223, 0.5372549, 1, 0, 1,
-0.6034684, 0.06428275, -1.366081, 0.5294118, 1, 0, 1,
-0.593208, 0.4439608, -0.2338906, 0.5254902, 1, 0, 1,
-0.5897655, -0.7214506, -3.729291, 0.5176471, 1, 0, 1,
-0.5867938, -1.385756, -1.839922, 0.5137255, 1, 0, 1,
-0.585587, -0.07653464, -2.087871, 0.5058824, 1, 0, 1,
-0.578297, 0.4265668, -1.395785, 0.5019608, 1, 0, 1,
-0.5749255, -1.486872, -4.026411, 0.4941176, 1, 0, 1,
-0.5745283, -0.3624308, -3.674416, 0.4862745, 1, 0, 1,
-0.5744244, -0.3078642, -2.498337, 0.4823529, 1, 0, 1,
-0.573713, 1.60128, -1.969851, 0.4745098, 1, 0, 1,
-0.5700532, 0.2818164, -2.146938, 0.4705882, 1, 0, 1,
-0.5645092, 0.2810322, -1.514899, 0.4627451, 1, 0, 1,
-0.5621186, 0.8285819, -2.56117, 0.4588235, 1, 0, 1,
-0.5602481, -0.2236803, -1.693598, 0.4509804, 1, 0, 1,
-0.5592421, 0.9160234, -0.6468754, 0.4470588, 1, 0, 1,
-0.5531708, 0.08176482, -1.493287, 0.4392157, 1, 0, 1,
-0.5499828, 0.9570705, -0.8066759, 0.4352941, 1, 0, 1,
-0.5373898, 0.6809014, -0.6554859, 0.427451, 1, 0, 1,
-0.5363308, -0.1773514, -0.8520729, 0.4235294, 1, 0, 1,
-0.5353736, -1.562978, -2.387493, 0.4156863, 1, 0, 1,
-0.5333753, -0.1597558, -1.688001, 0.4117647, 1, 0, 1,
-0.5306774, -0.4943722, -0.4356264, 0.4039216, 1, 0, 1,
-0.5298031, 0.1114225, -2.332218, 0.3960784, 1, 0, 1,
-0.5277632, 0.6699616, -0.7686609, 0.3921569, 1, 0, 1,
-0.5208155, 0.3822327, -1.061983, 0.3843137, 1, 0, 1,
-0.520663, 0.8164955, 0.318081, 0.3803922, 1, 0, 1,
-0.5187801, -1.288043, -3.742638, 0.372549, 1, 0, 1,
-0.5181516, 1.079565, -1.430311, 0.3686275, 1, 0, 1,
-0.5108507, -1.37566, -2.223471, 0.3607843, 1, 0, 1,
-0.5050179, 0.08573575, -3.020054, 0.3568628, 1, 0, 1,
-0.5027565, -0.6267983, -1.12786, 0.3490196, 1, 0, 1,
-0.4955573, 1.28402, -2.107336, 0.345098, 1, 0, 1,
-0.4923903, 0.1337969, -0.2358729, 0.3372549, 1, 0, 1,
-0.4922163, -1.326012, -1.308285, 0.3333333, 1, 0, 1,
-0.4915093, -0.1002198, -1.896989, 0.3254902, 1, 0, 1,
-0.4894561, -0.851788, -2.846296, 0.3215686, 1, 0, 1,
-0.486485, -0.2555357, -3.182885, 0.3137255, 1, 0, 1,
-0.4855739, 0.6792199, 0.416057, 0.3098039, 1, 0, 1,
-0.4830816, -1.169398, -2.298565, 0.3019608, 1, 0, 1,
-0.482228, 0.9968663, -2.965279, 0.2941177, 1, 0, 1,
-0.4713223, 0.4284556, 0.2354638, 0.2901961, 1, 0, 1,
-0.4643712, -0.3853247, -0.8007472, 0.282353, 1, 0, 1,
-0.4584861, -0.4190642, -1.868774, 0.2784314, 1, 0, 1,
-0.4578208, 0.400743, -0.3114254, 0.2705882, 1, 0, 1,
-0.4572108, 1.304279, 0.1752362, 0.2666667, 1, 0, 1,
-0.4559317, -0.2394022, -1.217023, 0.2588235, 1, 0, 1,
-0.454594, 0.6130519, -0.527943, 0.254902, 1, 0, 1,
-0.4542425, 0.6273071, -1.579298, 0.2470588, 1, 0, 1,
-0.4540398, -2.019696, -1.395387, 0.2431373, 1, 0, 1,
-0.4526624, 1.355099, -1.3607, 0.2352941, 1, 0, 1,
-0.4518599, 0.5399756, -1.148062, 0.2313726, 1, 0, 1,
-0.4514311, -1.277061, -0.7513861, 0.2235294, 1, 0, 1,
-0.4479935, -0.3975943, -1.276686, 0.2196078, 1, 0, 1,
-0.445561, -0.7070707, -2.232192, 0.2117647, 1, 0, 1,
-0.4448538, -0.6046816, -1.168676, 0.2078431, 1, 0, 1,
-0.4434416, -1.311638, -2.534323, 0.2, 1, 0, 1,
-0.4424904, 0.4061765, -0.6502656, 0.1921569, 1, 0, 1,
-0.4413447, -0.5348219, -2.166986, 0.1882353, 1, 0, 1,
-0.4395833, -0.006156382, -3.469468, 0.1803922, 1, 0, 1,
-0.439276, 0.1699088, -0.7929651, 0.1764706, 1, 0, 1,
-0.4383703, -0.4064545, -3.478977, 0.1686275, 1, 0, 1,
-0.4348004, 0.7051043, -0.2902987, 0.1647059, 1, 0, 1,
-0.4327269, -0.5659367, -2.912654, 0.1568628, 1, 0, 1,
-0.4320132, 0.7901339, 0.5234503, 0.1529412, 1, 0, 1,
-0.4313793, -2.277754, -3.874232, 0.145098, 1, 0, 1,
-0.4312817, 0.8707748, -1.096938, 0.1411765, 1, 0, 1,
-0.4298083, -0.6580331, -2.507858, 0.1333333, 1, 0, 1,
-0.4247632, 1.720536, -1.039076, 0.1294118, 1, 0, 1,
-0.4242226, 1.110644, -1.49425, 0.1215686, 1, 0, 1,
-0.4156446, -0.001095504, -2.473502, 0.1176471, 1, 0, 1,
-0.409789, -0.02487824, -1.197946, 0.1098039, 1, 0, 1,
-0.4088027, -0.1684515, -2.792566, 0.1058824, 1, 0, 1,
-0.4082313, -2.101476, -2.522766, 0.09803922, 1, 0, 1,
-0.4025271, 1.605999, 0.0918875, 0.09019608, 1, 0, 1,
-0.400995, 1.25186, -0.2296455, 0.08627451, 1, 0, 1,
-0.3967193, 0.08838005, -1.037354, 0.07843138, 1, 0, 1,
-0.3964078, 0.8724493, -0.8601909, 0.07450981, 1, 0, 1,
-0.3881643, -1.208814, -3.322804, 0.06666667, 1, 0, 1,
-0.3806899, -0.04043509, -3.270415, 0.0627451, 1, 0, 1,
-0.3783161, -0.1406147, -2.648251, 0.05490196, 1, 0, 1,
-0.3767232, 0.6325232, -1.566192, 0.05098039, 1, 0, 1,
-0.375632, -2.752079, -4.04553, 0.04313726, 1, 0, 1,
-0.3756078, 1.691246, -0.1226259, 0.03921569, 1, 0, 1,
-0.3751231, -0.4612204, -1.894846, 0.03137255, 1, 0, 1,
-0.3732759, -0.2704303, -0.1928343, 0.02745098, 1, 0, 1,
-0.3676237, 1.371212, 0.3774496, 0.01960784, 1, 0, 1,
-0.3671289, -0.7429834, -1.359397, 0.01568628, 1, 0, 1,
-0.3670501, 0.5783653, -1.559492, 0.007843138, 1, 0, 1,
-0.3631298, -0.908004, -2.579808, 0.003921569, 1, 0, 1,
-0.3626646, 1.051101, -0.1782886, 0, 1, 0.003921569, 1,
-0.361274, -1.141081, -1.766329, 0, 1, 0.01176471, 1,
-0.3594656, -0.957497, -2.253816, 0, 1, 0.01568628, 1,
-0.3506373, 0.5481175, 0.7004657, 0, 1, 0.02352941, 1,
-0.3484834, 0.1383394, -0.2933434, 0, 1, 0.02745098, 1,
-0.3444329, 0.360257, -1.197282, 0, 1, 0.03529412, 1,
-0.3397282, 1.076469, -1.923679, 0, 1, 0.03921569, 1,
-0.3387747, -0.8245289, -2.238114, 0, 1, 0.04705882, 1,
-0.3374786, -0.4585774, -3.25742, 0, 1, 0.05098039, 1,
-0.3357374, 0.2594535, 0.02702609, 0, 1, 0.05882353, 1,
-0.3341725, 0.3749182, -0.9659286, 0, 1, 0.0627451, 1,
-0.3338044, 1.278394, 0.6798483, 0, 1, 0.07058824, 1,
-0.3291707, 1.580736, -0.6480771, 0, 1, 0.07450981, 1,
-0.3280274, 1.147922, 0.8484819, 0, 1, 0.08235294, 1,
-0.3273668, -1.690218, -3.383809, 0, 1, 0.08627451, 1,
-0.3261377, -0.6661886, -3.284617, 0, 1, 0.09411765, 1,
-0.3230181, -0.1945913, -1.689483, 0, 1, 0.1019608, 1,
-0.3206749, -1.354723e-05, -4.051592, 0, 1, 0.1058824, 1,
-0.314918, 0.8392819, -1.034256, 0, 1, 0.1137255, 1,
-0.3120955, -0.1203737, -1.110244, 0, 1, 0.1176471, 1,
-0.3075046, -0.2807872, -2.941123, 0, 1, 0.1254902, 1,
-0.3052082, -0.3207523, -1.143834, 0, 1, 0.1294118, 1,
-0.3028069, 0.2929544, -0.522014, 0, 1, 0.1372549, 1,
-0.3012149, 0.115109, -2.544256, 0, 1, 0.1411765, 1,
-0.3010821, -1.637092, -1.948859, 0, 1, 0.1490196, 1,
-0.3003751, 0.780883, -1.731005, 0, 1, 0.1529412, 1,
-0.2978024, 0.7864297, -0.5709559, 0, 1, 0.1607843, 1,
-0.2951722, 0.4513842, -1.415851, 0, 1, 0.1647059, 1,
-0.2929541, 0.3766903, -2.096013, 0, 1, 0.172549, 1,
-0.29189, 0.2004806, -0.2519814, 0, 1, 0.1764706, 1,
-0.2887922, -1.7589, -3.374125, 0, 1, 0.1843137, 1,
-0.2877687, -1.762777, -4.873877, 0, 1, 0.1882353, 1,
-0.2836262, 1.318732, -0.3294845, 0, 1, 0.1960784, 1,
-0.2800402, 0.9397711, -0.04949727, 0, 1, 0.2039216, 1,
-0.2799094, 1.347017, 0.593726, 0, 1, 0.2078431, 1,
-0.2772258, 2.844433, -0.9379081, 0, 1, 0.2156863, 1,
-0.2752909, -2.66043, -4.38161, 0, 1, 0.2196078, 1,
-0.26866, 0.09377698, -2.115095, 0, 1, 0.227451, 1,
-0.2655997, 1.743942, 0.1402055, 0, 1, 0.2313726, 1,
-0.2634071, -0.3491405, -3.530957, 0, 1, 0.2392157, 1,
-0.2628313, 0.9413714, -0.02299821, 0, 1, 0.2431373, 1,
-0.2607562, 0.3280354, -1.342863, 0, 1, 0.2509804, 1,
-0.2600284, 0.4592429, -0.2023913, 0, 1, 0.254902, 1,
-0.2593992, 0.126072, 1.59927, 0, 1, 0.2627451, 1,
-0.2586743, 0.8899743, -0.8739811, 0, 1, 0.2666667, 1,
-0.256874, -0.9511944, -1.030288, 0, 1, 0.2745098, 1,
-0.2555426, -0.7331735, -3.362967, 0, 1, 0.2784314, 1,
-0.2518046, 0.1438574, -3.448637, 0, 1, 0.2862745, 1,
-0.2455998, -0.2499171, -2.521593, 0, 1, 0.2901961, 1,
-0.2434533, -0.3943437, -1.586142, 0, 1, 0.2980392, 1,
-0.2427304, -0.4227329, -2.0146, 0, 1, 0.3058824, 1,
-0.2372783, -0.1862207, -2.066191, 0, 1, 0.3098039, 1,
-0.2363771, 0.4152612, -0.1962532, 0, 1, 0.3176471, 1,
-0.2285424, -0.1035301, -3.304816, 0, 1, 0.3215686, 1,
-0.2206066, -0.9174575, -1.833016, 0, 1, 0.3294118, 1,
-0.2181785, -2.393574, -1.78761, 0, 1, 0.3333333, 1,
-0.2172074, -2.812112, -3.077443, 0, 1, 0.3411765, 1,
-0.2167832, 1.058857, 0.05547379, 0, 1, 0.345098, 1,
-0.2159322, 0.3308187, -0.9806828, 0, 1, 0.3529412, 1,
-0.2111033, 0.7300142, -1.126678, 0, 1, 0.3568628, 1,
-0.2092443, -0.9103107, -4.277711, 0, 1, 0.3647059, 1,
-0.2034591, -1.052562, -1.381353, 0, 1, 0.3686275, 1,
-0.2000928, -0.4686524, -1.293068, 0, 1, 0.3764706, 1,
-0.1988657, -0.08216991, -2.315189, 0, 1, 0.3803922, 1,
-0.1981559, -0.3674093, -2.772329, 0, 1, 0.3882353, 1,
-0.1960249, -0.318848, -0.6866446, 0, 1, 0.3921569, 1,
-0.1951778, 2.014836, -0.1268546, 0, 1, 0.4, 1,
-0.1939026, 1.051679, -1.478517, 0, 1, 0.4078431, 1,
-0.1873622, -0.6488825, -0.2976724, 0, 1, 0.4117647, 1,
-0.1873562, -0.127754, -3.866216, 0, 1, 0.4196078, 1,
-0.1818197, -0.4452573, -1.828432, 0, 1, 0.4235294, 1,
-0.1807126, 0.8935471, -1.174881, 0, 1, 0.4313726, 1,
-0.1769702, 0.9451419, 2.098568, 0, 1, 0.4352941, 1,
-0.1719983, 1.549121, -0.5826712, 0, 1, 0.4431373, 1,
-0.1716365, 0.4470476, -1.722683, 0, 1, 0.4470588, 1,
-0.1679204, -1.266017, -4.000434, 0, 1, 0.454902, 1,
-0.1644218, -0.5907131, -4.023476, 0, 1, 0.4588235, 1,
-0.1586975, 0.4272231, -1.741536, 0, 1, 0.4666667, 1,
-0.151274, -0.5141854, -1.301682, 0, 1, 0.4705882, 1,
-0.1511792, 0.3339528, -3.284605, 0, 1, 0.4784314, 1,
-0.1507834, 1.46789, -1.275603, 0, 1, 0.4823529, 1,
-0.1500949, 0.04236675, -0.027681, 0, 1, 0.4901961, 1,
-0.1461334, 1.489505, -0.7537521, 0, 1, 0.4941176, 1,
-0.1441181, 0.141061, -0.08300963, 0, 1, 0.5019608, 1,
-0.1375252, -0.1106172, -2.422841, 0, 1, 0.509804, 1,
-0.1364746, -0.8312914, -5.259589, 0, 1, 0.5137255, 1,
-0.1362348, -1.172928, -3.471519, 0, 1, 0.5215687, 1,
-0.1312772, 0.2833549, 0.4046108, 0, 1, 0.5254902, 1,
-0.1275273, 0.0899027, -1.398748, 0, 1, 0.5333334, 1,
-0.1190524, -0.6412266, -2.557174, 0, 1, 0.5372549, 1,
-0.1134942, -0.266481, -1.57879, 0, 1, 0.5450981, 1,
-0.1130909, 0.802224, -1.489273, 0, 1, 0.5490196, 1,
-0.1112689, 0.5913083, -0.06607372, 0, 1, 0.5568628, 1,
-0.1111323, -1.218633, -1.804153, 0, 1, 0.5607843, 1,
-0.1105791, -0.5644472, -2.697511, 0, 1, 0.5686275, 1,
-0.1078879, -1.322718, -3.275312, 0, 1, 0.572549, 1,
-0.1056136, 0.2724082, -0.7868988, 0, 1, 0.5803922, 1,
-0.102701, 0.4253235, -1.755936, 0, 1, 0.5843138, 1,
-0.1018253, -1.259069, -3.317992, 0, 1, 0.5921569, 1,
-0.1017696, 0.08169057, -2.433301, 0, 1, 0.5960785, 1,
-0.100342, -0.3899922, -1.233227, 0, 1, 0.6039216, 1,
-0.1001355, -1.696649, -1.930926, 0, 1, 0.6117647, 1,
-0.09784675, 0.6540408, -1.881009, 0, 1, 0.6156863, 1,
-0.09727905, 0.318196, -1.812521, 0, 1, 0.6235294, 1,
-0.09663758, 1.559418, -0.7977166, 0, 1, 0.627451, 1,
-0.09637982, 0.739473, -0.6461277, 0, 1, 0.6352941, 1,
-0.09608864, 0.7188386, -1.834518, 0, 1, 0.6392157, 1,
-0.09546199, 0.3631518, -0.744624, 0, 1, 0.6470588, 1,
-0.0918735, 0.5665974, -0.2843446, 0, 1, 0.6509804, 1,
-0.08219316, 0.6703931, 1.029844, 0, 1, 0.6588235, 1,
-0.07955245, -0.1195893, -2.896081, 0, 1, 0.6627451, 1,
-0.06807608, 0.309905, -1.181095, 0, 1, 0.6705883, 1,
-0.06354267, -1.384352, -5.10853, 0, 1, 0.6745098, 1,
-0.06328071, 0.1789077, 0.03420083, 0, 1, 0.682353, 1,
-0.06254181, 0.9549605, 0.5780182, 0, 1, 0.6862745, 1,
-0.05735814, -0.1252779, -3.325267, 0, 1, 0.6941177, 1,
-0.05728059, 0.2397118, 0.9095695, 0, 1, 0.7019608, 1,
-0.05706745, -0.2411403, -3.62537, 0, 1, 0.7058824, 1,
-0.05383313, 0.6668324, -1.37485, 0, 1, 0.7137255, 1,
-0.0511899, 2.514511, -0.7066339, 0, 1, 0.7176471, 1,
-0.05080797, -1.910693, -1.859327, 0, 1, 0.7254902, 1,
-0.05074593, 2.039226, 0.8652081, 0, 1, 0.7294118, 1,
-0.04972844, -0.3485507, -2.90455, 0, 1, 0.7372549, 1,
-0.045966, 0.313769, -0.8766219, 0, 1, 0.7411765, 1,
-0.04242326, 0.01838966, -1.723111, 0, 1, 0.7490196, 1,
-0.04223904, -0.2120556, -2.48925, 0, 1, 0.7529412, 1,
-0.03358587, 0.7120941, 0.4172989, 0, 1, 0.7607843, 1,
-0.03139278, 0.3545038, -0.4009383, 0, 1, 0.7647059, 1,
-0.03118213, 0.1519371, -0.2132505, 0, 1, 0.772549, 1,
-0.03104578, -1.108976, -4.281896, 0, 1, 0.7764706, 1,
-0.02992931, -1.508097, -3.335479, 0, 1, 0.7843137, 1,
-0.02533558, -0.4565131, -2.965691, 0, 1, 0.7882353, 1,
-0.02480878, -3.765735, -5.442265, 0, 1, 0.7960784, 1,
-0.02060705, -0.7707199, -2.053011, 0, 1, 0.8039216, 1,
-0.02044831, 0.4777207, -1.06144, 0, 1, 0.8078431, 1,
-0.01784637, 0.359497, -1.005748, 0, 1, 0.8156863, 1,
-0.01758108, -0.2330642, -1.517177, 0, 1, 0.8196079, 1,
-0.01608782, 1.24154, -2.314519, 0, 1, 0.827451, 1,
-0.01477531, -0.4689535, -5.086432, 0, 1, 0.8313726, 1,
-0.01104304, -0.452038, -4.054371, 0, 1, 0.8392157, 1,
-0.007080919, 0.8868907, 0.6900442, 0, 1, 0.8431373, 1,
-0.004315783, 0.3145095, 1.287694, 0, 1, 0.8509804, 1,
-0.004015423, -1.05768, -4.137018, 0, 1, 0.854902, 1,
-0.002806177, -0.5844247, -3.98109, 0, 1, 0.8627451, 1,
-0.001502523, 1.439746, 1.080135, 0, 1, 0.8666667, 1,
0.004779945, 0.3933127, 1.133455, 0, 1, 0.8745098, 1,
0.006022287, -1.580271, 4.165664, 0, 1, 0.8784314, 1,
0.007605754, -1.276524, 1.855262, 0, 1, 0.8862745, 1,
0.01289421, -1.085968, 2.100121, 0, 1, 0.8901961, 1,
0.01375332, 0.5697942, -0.1732393, 0, 1, 0.8980392, 1,
0.01514779, 0.6951277, -0.2747941, 0, 1, 0.9058824, 1,
0.02213773, -0.01195557, 3.710285, 0, 1, 0.9098039, 1,
0.02248787, -0.05732233, 1.300777, 0, 1, 0.9176471, 1,
0.02944031, 0.9024642, 0.2353452, 0, 1, 0.9215686, 1,
0.03171569, 0.8596822, -1.221646, 0, 1, 0.9294118, 1,
0.03374613, 0.7596663, -0.9009941, 0, 1, 0.9333333, 1,
0.03387875, 0.396595, 0.8537149, 0, 1, 0.9411765, 1,
0.03536162, -0.02552936, 3.369056, 0, 1, 0.945098, 1,
0.04140675, 2.638568, 0.4504642, 0, 1, 0.9529412, 1,
0.04435495, 0.9307062, -0.2299175, 0, 1, 0.9568627, 1,
0.04613737, -0.8942719, 3.932034, 0, 1, 0.9647059, 1,
0.04705297, -0.9031364, 2.80278, 0, 1, 0.9686275, 1,
0.04895732, 1.915123, 0.4001925, 0, 1, 0.9764706, 1,
0.04902169, 0.8675545, 0.5244511, 0, 1, 0.9803922, 1,
0.04929554, 0.2363351, -0.311419, 0, 1, 0.9882353, 1,
0.04990384, -2.276737, 2.19486, 0, 1, 0.9921569, 1,
0.05195764, -0.4079135, 2.87658, 0, 1, 1, 1,
0.05217349, 0.7743701, 0.6868708, 0, 0.9921569, 1, 1,
0.05219283, -0.7590144, 2.727562, 0, 0.9882353, 1, 1,
0.05898325, 0.08151656, 1.682603, 0, 0.9803922, 1, 1,
0.06096605, 0.5813819, -0.1415035, 0, 0.9764706, 1, 1,
0.06271911, 1.170615, 0.8854339, 0, 0.9686275, 1, 1,
0.06369893, -0.538264, 2.988052, 0, 0.9647059, 1, 1,
0.06717382, 0.9994752, 1.043523, 0, 0.9568627, 1, 1,
0.07067384, 1.18024, -0.1173995, 0, 0.9529412, 1, 1,
0.07136437, 0.8176878, 0.122692, 0, 0.945098, 1, 1,
0.07503627, -0.3259668, 2.266065, 0, 0.9411765, 1, 1,
0.09076226, 0.5856426, 1.005134, 0, 0.9333333, 1, 1,
0.09475602, 0.8365978, 0.2377642, 0, 0.9294118, 1, 1,
0.09802819, -0.3253193, 3.736145, 0, 0.9215686, 1, 1,
0.09805448, -0.1249211, 0.04482037, 0, 0.9176471, 1, 1,
0.1029127, -0.8594001, 1.724309, 0, 0.9098039, 1, 1,
0.1033339, -2.16503, 3.223057, 0, 0.9058824, 1, 1,
0.1035148, 0.2388907, 1.278318, 0, 0.8980392, 1, 1,
0.1035976, -1.20349, 3.720549, 0, 0.8901961, 1, 1,
0.1042761, -1.103002, 3.558473, 0, 0.8862745, 1, 1,
0.1044285, 0.2683148, -0.8048797, 0, 0.8784314, 1, 1,
0.1082456, 0.5087087, 0.6761506, 0, 0.8745098, 1, 1,
0.1091912, -0.2437453, 1.536301, 0, 0.8666667, 1, 1,
0.1111449, 0.2882341, 1.117792, 0, 0.8627451, 1, 1,
0.1116968, -1.617279, 3.54006, 0, 0.854902, 1, 1,
0.1125022, -0.8245755, 3.795855, 0, 0.8509804, 1, 1,
0.1125991, -0.4793857, 3.202872, 0, 0.8431373, 1, 1,
0.1138373, -1.372475, 2.359208, 0, 0.8392157, 1, 1,
0.1143105, 0.08371396, 1.91555, 0, 0.8313726, 1, 1,
0.1160124, -0.4396842, 3.409812, 0, 0.827451, 1, 1,
0.1243403, 1.133329, -2.397644, 0, 0.8196079, 1, 1,
0.1253188, 1.472477, 0.1586624, 0, 0.8156863, 1, 1,
0.1298843, 0.8178195, 0.8944781, 0, 0.8078431, 1, 1,
0.1303065, -1.4264, 4.291625, 0, 0.8039216, 1, 1,
0.1319919, -0.8491406, 3.77089, 0, 0.7960784, 1, 1,
0.1336488, 0.7924613, 1.488417, 0, 0.7882353, 1, 1,
0.1356124, -0.1958108, 1.93504, 0, 0.7843137, 1, 1,
0.137922, 0.1111594, 0.2931318, 0, 0.7764706, 1, 1,
0.139558, 0.170928, 2.375511, 0, 0.772549, 1, 1,
0.1476931, -1.128855, 2.474583, 0, 0.7647059, 1, 1,
0.1527062, 0.7611492, 1.978956, 0, 0.7607843, 1, 1,
0.1550712, -0.5533573, 3.295806, 0, 0.7529412, 1, 1,
0.1615163, -0.9906909, 2.659978, 0, 0.7490196, 1, 1,
0.1628081, -0.5490896, 3.737553, 0, 0.7411765, 1, 1,
0.1636628, -0.07575722, 2.623583, 0, 0.7372549, 1, 1,
0.1664679, 1.35538, 0.8700073, 0, 0.7294118, 1, 1,
0.172965, 0.5909335, 0.1583122, 0, 0.7254902, 1, 1,
0.1772048, -0.9384866, 1.816362, 0, 0.7176471, 1, 1,
0.1784401, 1.485232, 0.009645956, 0, 0.7137255, 1, 1,
0.1803731, -1.339068, 1.47453, 0, 0.7058824, 1, 1,
0.1806854, -0.4951025, 2.079343, 0, 0.6980392, 1, 1,
0.1843173, 0.4046679, 1.399851, 0, 0.6941177, 1, 1,
0.1880594, -0.09812982, 2.03808, 0, 0.6862745, 1, 1,
0.1903792, 0.781112, 0.9720832, 0, 0.682353, 1, 1,
0.2041107, 1.507052, -0.3107491, 0, 0.6745098, 1, 1,
0.2048253, 0.2445891, 1.736738, 0, 0.6705883, 1, 1,
0.2062033, -0.3805611, 3.570515, 0, 0.6627451, 1, 1,
0.206725, -0.5393496, 3.715748, 0, 0.6588235, 1, 1,
0.2086356, -0.7433105, 1.781979, 0, 0.6509804, 1, 1,
0.2159936, -0.3098399, 2.542602, 0, 0.6470588, 1, 1,
0.2172473, -1.135592, 2.40962, 0, 0.6392157, 1, 1,
0.2195173, 0.3302982, 0.9960048, 0, 0.6352941, 1, 1,
0.2270273, -0.4431719, 1.383924, 0, 0.627451, 1, 1,
0.2275725, 1.078315, 0.2686927, 0, 0.6235294, 1, 1,
0.2288051, 0.07299939, 1.404659, 0, 0.6156863, 1, 1,
0.2324493, 0.08605359, 1.424109, 0, 0.6117647, 1, 1,
0.2380074, -0.9817648, 1.869475, 0, 0.6039216, 1, 1,
0.2400438, 1.837403, -0.8234292, 0, 0.5960785, 1, 1,
0.241015, 0.1210513, 0.1416186, 0, 0.5921569, 1, 1,
0.2417783, -0.988088, 0.942521, 0, 0.5843138, 1, 1,
0.2418441, -0.3432478, 2.827142, 0, 0.5803922, 1, 1,
0.2509999, -1.313069, 2.227499, 0, 0.572549, 1, 1,
0.2535554, -0.7994965, 2.831376, 0, 0.5686275, 1, 1,
0.2565558, 0.1938618, -1.951913, 0, 0.5607843, 1, 1,
0.257373, -0.5227108, 1.248438, 0, 0.5568628, 1, 1,
0.2575014, 0.8074687, 0.5677844, 0, 0.5490196, 1, 1,
0.2577284, 0.09151465, 1.787778, 0, 0.5450981, 1, 1,
0.2585361, 0.3642555, 2.138216, 0, 0.5372549, 1, 1,
0.2597336, 0.8011569, -0.6806409, 0, 0.5333334, 1, 1,
0.2605427, 0.9810627, 0.3600556, 0, 0.5254902, 1, 1,
0.2614864, 0.488677, 1.633677, 0, 0.5215687, 1, 1,
0.267974, -0.4309324, 3.883758, 0, 0.5137255, 1, 1,
0.2681805, 0.7687914, 0.5733142, 0, 0.509804, 1, 1,
0.2687778, 1.870497, -0.4256287, 0, 0.5019608, 1, 1,
0.2715317, 0.205575, 0.6717935, 0, 0.4941176, 1, 1,
0.2740312, 0.7424592, 1.232271, 0, 0.4901961, 1, 1,
0.2779406, 1.965996, -0.8145322, 0, 0.4823529, 1, 1,
0.2804667, -1.185387, 1.73876, 0, 0.4784314, 1, 1,
0.2817549, 0.7050857, 1.973093, 0, 0.4705882, 1, 1,
0.2866288, 1.973748, 0.6516361, 0, 0.4666667, 1, 1,
0.2896826, 0.2950825, 2.792622, 0, 0.4588235, 1, 1,
0.290972, -0.2584865, 3.314649, 0, 0.454902, 1, 1,
0.2909844, -0.8414959, 3.183691, 0, 0.4470588, 1, 1,
0.2994417, 0.8998803, 0.71965, 0, 0.4431373, 1, 1,
0.3011209, 0.9346023, -0.1306895, 0, 0.4352941, 1, 1,
0.3028785, 2.75275, 0.1444736, 0, 0.4313726, 1, 1,
0.3029587, -0.5085935, 1.190965, 0, 0.4235294, 1, 1,
0.3029768, -2.003443, 4.892588, 0, 0.4196078, 1, 1,
0.3030649, 2.287414, 2.415823, 0, 0.4117647, 1, 1,
0.3043149, -0.9889457, 4.268443, 0, 0.4078431, 1, 1,
0.3046356, 0.7169517, 0.03759011, 0, 0.4, 1, 1,
0.305536, 0.2478703, -2.165437, 0, 0.3921569, 1, 1,
0.3094085, -1.736, 2.403131, 0, 0.3882353, 1, 1,
0.3102245, -0.9516305, 2.932011, 0, 0.3803922, 1, 1,
0.3137837, 0.6594481, -1.443871, 0, 0.3764706, 1, 1,
0.3141723, -0.8871474, 2.046017, 0, 0.3686275, 1, 1,
0.314878, 0.531993, 0.8453738, 0, 0.3647059, 1, 1,
0.318069, 2.106573, 1.977702, 0, 0.3568628, 1, 1,
0.3216368, 1.049361, 0.002250922, 0, 0.3529412, 1, 1,
0.3217426, -0.5683452, 2.992746, 0, 0.345098, 1, 1,
0.3233581, 1.090283, 0.1766875, 0, 0.3411765, 1, 1,
0.3256241, 0.01023812, 1.313096, 0, 0.3333333, 1, 1,
0.3289369, 1.057654, 0.3555066, 0, 0.3294118, 1, 1,
0.3394677, 1.934427, 0.6111853, 0, 0.3215686, 1, 1,
0.3422483, 0.01529746, 1.790483, 0, 0.3176471, 1, 1,
0.3463596, -0.7100021, 4.425011, 0, 0.3098039, 1, 1,
0.3485068, 0.8580956, -1.235984, 0, 0.3058824, 1, 1,
0.3486936, 1.010261, -0.6633008, 0, 0.2980392, 1, 1,
0.3525901, 0.497397, 1.4962, 0, 0.2901961, 1, 1,
0.3527384, 0.05274892, 1.058029, 0, 0.2862745, 1, 1,
0.3543773, -0.5000234, 2.476301, 0, 0.2784314, 1, 1,
0.3548394, -1.460939, 3.21493, 0, 0.2745098, 1, 1,
0.355814, 0.9417098, -0.2589194, 0, 0.2666667, 1, 1,
0.3635218, -0.01006198, 2.729784, 0, 0.2627451, 1, 1,
0.3640068, 0.7090884, 0.7776837, 0, 0.254902, 1, 1,
0.3669474, 1.005201, 1.697441, 0, 0.2509804, 1, 1,
0.3708666, 0.2249514, 1.216119, 0, 0.2431373, 1, 1,
0.371985, 0.336164, 0.8686504, 0, 0.2392157, 1, 1,
0.3720303, 0.6319765, -0.4301048, 0, 0.2313726, 1, 1,
0.3745293, 0.02085827, 2.218328, 0, 0.227451, 1, 1,
0.3766966, -0.6106017, 3.678565, 0, 0.2196078, 1, 1,
0.3767069, -0.2505417, 2.05489, 0, 0.2156863, 1, 1,
0.3769365, 0.4980326, 1.106475, 0, 0.2078431, 1, 1,
0.3824682, 0.560038, -0.8104926, 0, 0.2039216, 1, 1,
0.3829335, -0.8791456, 2.731175, 0, 0.1960784, 1, 1,
0.3872811, -1.553503, 4.363954, 0, 0.1882353, 1, 1,
0.3878846, 1.790423, -0.3398213, 0, 0.1843137, 1, 1,
0.3885379, -0.1809437, 0.7617067, 0, 0.1764706, 1, 1,
0.3892899, -0.08439384, 2.003869, 0, 0.172549, 1, 1,
0.3905493, 0.4763586, 0.05930631, 0, 0.1647059, 1, 1,
0.3918017, 1.599726, -0.3329592, 0, 0.1607843, 1, 1,
0.4024823, -0.7363055, 2.317693, 0, 0.1529412, 1, 1,
0.4035294, 1.363279, 0.05436846, 0, 0.1490196, 1, 1,
0.4076418, -1.401494, 1.80969, 0, 0.1411765, 1, 1,
0.410746, -1.37502, 2.417359, 0, 0.1372549, 1, 1,
0.411207, -0.834646, 3.705524, 0, 0.1294118, 1, 1,
0.4130307, 0.006433379, -0.151861, 0, 0.1254902, 1, 1,
0.4300016, -0.7118102, 3.687835, 0, 0.1176471, 1, 1,
0.4373676, 2.388362, 0.2523998, 0, 0.1137255, 1, 1,
0.4406801, -1.361403, 3.706592, 0, 0.1058824, 1, 1,
0.4426013, -0.06893734, 1.641976, 0, 0.09803922, 1, 1,
0.4460619, -0.2541147, 2.234588, 0, 0.09411765, 1, 1,
0.4466021, -0.9307982, 4.380649, 0, 0.08627451, 1, 1,
0.4478568, -0.5000183, 1.670805, 0, 0.08235294, 1, 1,
0.4561138, -0.5637056, 2.391899, 0, 0.07450981, 1, 1,
0.4573749, 0.04341696, 1.117278, 0, 0.07058824, 1, 1,
0.457658, -0.765699, 2.275403, 0, 0.0627451, 1, 1,
0.4706634, -2.465517, 3.732429, 0, 0.05882353, 1, 1,
0.4828105, 0.0404673, 3.50459, 0, 0.05098039, 1, 1,
0.4856119, 0.7769561, 0.7454466, 0, 0.04705882, 1, 1,
0.4869149, -1.296046, 1.784942, 0, 0.03921569, 1, 1,
0.4884933, -0.9068587, 2.099866, 0, 0.03529412, 1, 1,
0.4967645, -1.855765, 2.994135, 0, 0.02745098, 1, 1,
0.4972475, 0.2650944, 1.478316, 0, 0.02352941, 1, 1,
0.4986793, -0.6663433, 0.562831, 0, 0.01568628, 1, 1,
0.5033315, 0.363402, 0.9306003, 0, 0.01176471, 1, 1,
0.5140561, -0.1523023, 1.322721, 0, 0.003921569, 1, 1,
0.5159749, -1.251371, 4.13636, 0.003921569, 0, 1, 1,
0.517365, 0.8988025, 0.6496637, 0.007843138, 0, 1, 1,
0.5229754, -0.8304694, 2.814317, 0.01568628, 0, 1, 1,
0.5291482, 0.3373315, 0.6400835, 0.01960784, 0, 1, 1,
0.5313295, -0.9270735, 2.21061, 0.02745098, 0, 1, 1,
0.5356514, 2.599502, -0.316503, 0.03137255, 0, 1, 1,
0.5369971, -0.7413307, 2.647228, 0.03921569, 0, 1, 1,
0.5410109, -1.20783, 2.568835, 0.04313726, 0, 1, 1,
0.5415323, 0.3851253, 1.048834, 0.05098039, 0, 1, 1,
0.5482997, 0.8732468, 2.049972, 0.05490196, 0, 1, 1,
0.5484396, -0.1481701, 0.4014102, 0.0627451, 0, 1, 1,
0.5499124, -1.10336, 1.523095, 0.06666667, 0, 1, 1,
0.5503367, -1.105397, 3.742175, 0.07450981, 0, 1, 1,
0.5538067, 0.02035016, -0.3698167, 0.07843138, 0, 1, 1,
0.5555234, 1.591751, 2.25112, 0.08627451, 0, 1, 1,
0.5608056, -2.522502, 4.709117, 0.09019608, 0, 1, 1,
0.5670303, -1.05589, 2.181162, 0.09803922, 0, 1, 1,
0.5684704, -1.335578, 2.467574, 0.1058824, 0, 1, 1,
0.5685647, -0.8162779, 2.230034, 0.1098039, 0, 1, 1,
0.5750152, -0.7529592, 2.333964, 0.1176471, 0, 1, 1,
0.5756981, -1.635609, 2.956619, 0.1215686, 0, 1, 1,
0.5791723, -0.8095465, 2.100533, 0.1294118, 0, 1, 1,
0.5846651, 0.8407388, 1.153651, 0.1333333, 0, 1, 1,
0.5861607, 1.089011, 0.7017547, 0.1411765, 0, 1, 1,
0.589761, -1.213309, 1.413357, 0.145098, 0, 1, 1,
0.5948299, 0.4567684, 0.03323462, 0.1529412, 0, 1, 1,
0.5975078, -0.7150434, 2.253142, 0.1568628, 0, 1, 1,
0.5976096, 0.4366622, 1.279425, 0.1647059, 0, 1, 1,
0.6005736, -0.7905877, 2.086803, 0.1686275, 0, 1, 1,
0.6145577, -1.234748, 2.046098, 0.1764706, 0, 1, 1,
0.6190453, 0.1971734, 0.8027164, 0.1803922, 0, 1, 1,
0.6211359, -0.7301561, 3.673888, 0.1882353, 0, 1, 1,
0.6229594, 1.099931, 1.082706, 0.1921569, 0, 1, 1,
0.6235315, -1.524336, 3.088015, 0.2, 0, 1, 1,
0.6258829, 0.9524637, -0.449493, 0.2078431, 0, 1, 1,
0.6280896, -0.848888, 2.509204, 0.2117647, 0, 1, 1,
0.6368357, -2.394351, 1.840028, 0.2196078, 0, 1, 1,
0.6557567, 0.01589271, 1.391538, 0.2235294, 0, 1, 1,
0.6600127, -1.662593, 1.409724, 0.2313726, 0, 1, 1,
0.6622987, 1.701359, 0.3245203, 0.2352941, 0, 1, 1,
0.663182, 0.7070791, 1.164541, 0.2431373, 0, 1, 1,
0.663422, -1.138455, 3.241452, 0.2470588, 0, 1, 1,
0.6668598, -0.5220975, 1.778795, 0.254902, 0, 1, 1,
0.6729386, -1.556308, 2.776442, 0.2588235, 0, 1, 1,
0.6834491, -0.2452013, 1.759957, 0.2666667, 0, 1, 1,
0.6850221, 0.1415606, 1.316412, 0.2705882, 0, 1, 1,
0.6883593, -0.5596262, 0.9210961, 0.2784314, 0, 1, 1,
0.6885685, 1.224626, 0.7920437, 0.282353, 0, 1, 1,
0.6908438, 0.3198243, 1.979531, 0.2901961, 0, 1, 1,
0.6953686, -0.26201, 1.893152, 0.2941177, 0, 1, 1,
0.7086348, -0.629313, 2.802737, 0.3019608, 0, 1, 1,
0.7128311, 0.7119324, 2.722394, 0.3098039, 0, 1, 1,
0.715215, -0.7692836, 2.22853, 0.3137255, 0, 1, 1,
0.7155221, -0.1307475, 2.089931, 0.3215686, 0, 1, 1,
0.7156631, 0.9093055, 1.498147, 0.3254902, 0, 1, 1,
0.7161502, 1.839909, 0.6617923, 0.3333333, 0, 1, 1,
0.7167078, 0.9602435, 2.333035, 0.3372549, 0, 1, 1,
0.7168394, 0.6822309, 1.302168, 0.345098, 0, 1, 1,
0.7174742, 1.302859, 1.424608, 0.3490196, 0, 1, 1,
0.7176099, 1.784067, 1.672273, 0.3568628, 0, 1, 1,
0.7181162, 0.1837849, 2.879268, 0.3607843, 0, 1, 1,
0.7269533, 1.078974, 1.407082, 0.3686275, 0, 1, 1,
0.7284231, -0.0006257041, 1.676582, 0.372549, 0, 1, 1,
0.7330656, 1.125104, -0.2024182, 0.3803922, 0, 1, 1,
0.7341987, 0.07764072, 0.6658389, 0.3843137, 0, 1, 1,
0.7374381, 0.8629794, 0.8072219, 0.3921569, 0, 1, 1,
0.7418808, 1.506661, -0.1085064, 0.3960784, 0, 1, 1,
0.7492063, 0.1102356, 1.486225, 0.4039216, 0, 1, 1,
0.7500199, 0.6325404, -1.133571, 0.4117647, 0, 1, 1,
0.7527178, 0.3558294, 2.514188, 0.4156863, 0, 1, 1,
0.7560981, -0.423283, 1.735759, 0.4235294, 0, 1, 1,
0.7565733, 1.022413, 0.8867399, 0.427451, 0, 1, 1,
0.7568885, -1.040862, 2.881649, 0.4352941, 0, 1, 1,
0.7598639, -0.8123434, 2.214135, 0.4392157, 0, 1, 1,
0.759936, 0.8211296, 1.96796, 0.4470588, 0, 1, 1,
0.7656103, -0.3105468, 1.588611, 0.4509804, 0, 1, 1,
0.7709877, -0.07489798, 2.299435, 0.4588235, 0, 1, 1,
0.7787054, -0.7375944, 3.910712, 0.4627451, 0, 1, 1,
0.7810209, -0.1950397, 0.9070213, 0.4705882, 0, 1, 1,
0.7858374, -1.407683, 2.285195, 0.4745098, 0, 1, 1,
0.7892603, 1.872524, 1.225267, 0.4823529, 0, 1, 1,
0.7898067, -1.566663, 2.438141, 0.4862745, 0, 1, 1,
0.7917364, 3.138816, 0.3205317, 0.4941176, 0, 1, 1,
0.7930288, -0.2773867, 2.935608, 0.5019608, 0, 1, 1,
0.7938083, 0.7277833, 0.7899047, 0.5058824, 0, 1, 1,
0.793816, 0.8688432, -0.01332135, 0.5137255, 0, 1, 1,
0.7975035, 1.643782, 0.1395601, 0.5176471, 0, 1, 1,
0.7977737, 0.01268525, 0.1425776, 0.5254902, 0, 1, 1,
0.8039002, -0.4427832, 2.056433, 0.5294118, 0, 1, 1,
0.8108181, 0.2927726, 0.4960734, 0.5372549, 0, 1, 1,
0.8138937, 1.109195, -0.1029772, 0.5411765, 0, 1, 1,
0.8148603, 0.9059649, 0.6643416, 0.5490196, 0, 1, 1,
0.8149591, 1.040978, -1.188894, 0.5529412, 0, 1, 1,
0.8179428, 0.04143615, 1.11431, 0.5607843, 0, 1, 1,
0.824192, -1.517312, 2.000405, 0.5647059, 0, 1, 1,
0.8350701, -0.02476085, 2.470937, 0.572549, 0, 1, 1,
0.8360847, -0.1697787, 1.990885, 0.5764706, 0, 1, 1,
0.8475409, 0.7459328, 2.017484, 0.5843138, 0, 1, 1,
0.848337, 1.361729, 0.341914, 0.5882353, 0, 1, 1,
0.8509755, -1.298649, 0.9492345, 0.5960785, 0, 1, 1,
0.8552914, 0.9068598, -0.2516315, 0.6039216, 0, 1, 1,
0.8570403, 0.8932446, 1.852822, 0.6078432, 0, 1, 1,
0.8603523, -1.642917, 3.13977, 0.6156863, 0, 1, 1,
0.8614029, 0.3965264, 2.668185, 0.6196079, 0, 1, 1,
0.8647902, -0.01119031, 2.072062, 0.627451, 0, 1, 1,
0.8671914, 0.9627258, 2.235659, 0.6313726, 0, 1, 1,
0.8708134, -0.0965909, 2.304786, 0.6392157, 0, 1, 1,
0.8720218, 1.162424, 0.555499, 0.6431373, 0, 1, 1,
0.8723106, 1.183188, 1.39916, 0.6509804, 0, 1, 1,
0.8775234, -0.4472822, 0.3542939, 0.654902, 0, 1, 1,
0.8776432, 1.49182, 0.8895112, 0.6627451, 0, 1, 1,
0.8817084, 1.075534, -0.04374144, 0.6666667, 0, 1, 1,
0.8834733, -0.235845, 1.390441, 0.6745098, 0, 1, 1,
0.8846269, -0.7044085, 2.750994, 0.6784314, 0, 1, 1,
0.885868, 0.6919795, 0.2696045, 0.6862745, 0, 1, 1,
0.8873894, -0.05467789, 4.390707, 0.6901961, 0, 1, 1,
0.8932782, 0.4586712, 1.291954, 0.6980392, 0, 1, 1,
0.8937676, 0.201996, 1.525114, 0.7058824, 0, 1, 1,
0.9006776, -1.285366, 2.198925, 0.7098039, 0, 1, 1,
0.9043704, -1.814075, 1.771994, 0.7176471, 0, 1, 1,
0.9050405, -0.04595071, 2.255996, 0.7215686, 0, 1, 1,
0.9060423, -0.8769749, 1.701436, 0.7294118, 0, 1, 1,
0.9380838, -0.5749887, 1.704206, 0.7333333, 0, 1, 1,
0.9475276, -0.7553785, 0.7844099, 0.7411765, 0, 1, 1,
0.9515491, -0.3812515, 1.289062, 0.7450981, 0, 1, 1,
0.9517592, -1.289879, 2.821064, 0.7529412, 0, 1, 1,
0.9519231, 1.595397, 0.977213, 0.7568628, 0, 1, 1,
0.9573132, -1.010308, 3.1041, 0.7647059, 0, 1, 1,
0.9575468, 0.7897272, 1.663841, 0.7686275, 0, 1, 1,
0.9581744, 0.1606957, 2.947967, 0.7764706, 0, 1, 1,
0.9582803, -1.026866, 2.342153, 0.7803922, 0, 1, 1,
0.9711245, -0.5173711, 1.291049, 0.7882353, 0, 1, 1,
0.9733933, -0.4970056, 1.760221, 0.7921569, 0, 1, 1,
0.9758263, -0.3474227, 2.379484, 0.8, 0, 1, 1,
0.9768103, -0.4634877, 1.549088, 0.8078431, 0, 1, 1,
0.9775181, -1.086516, 1.595077, 0.8117647, 0, 1, 1,
0.9776928, 0.00578903, 0.4047301, 0.8196079, 0, 1, 1,
0.9786123, -0.3325768, 1.016143, 0.8235294, 0, 1, 1,
0.9788215, 0.9498818, 0.727735, 0.8313726, 0, 1, 1,
0.9794617, -0.7376693, 3.689906, 0.8352941, 0, 1, 1,
0.9839787, 0.005395357, 2.441168, 0.8431373, 0, 1, 1,
0.9843089, 0.8731335, 2.118436, 0.8470588, 0, 1, 1,
0.9903532, -2.366261, 3.612876, 0.854902, 0, 1, 1,
0.9966753, 2.196893, 0.2772886, 0.8588235, 0, 1, 1,
0.998902, 0.8054793, 0.1357044, 0.8666667, 0, 1, 1,
0.9997334, -0.1226926, 2.570876, 0.8705882, 0, 1, 1,
1.002821, -0.7924172, 1.460195, 0.8784314, 0, 1, 1,
1.003153, 1.427148, 0.9430642, 0.8823529, 0, 1, 1,
1.005662, -1.856835, 5.041303, 0.8901961, 0, 1, 1,
1.008244, -0.2747193, 1.289703, 0.8941177, 0, 1, 1,
1.00857, 0.2449905, -0.1224168, 0.9019608, 0, 1, 1,
1.01084, 0.4516407, 0.4835544, 0.9098039, 0, 1, 1,
1.014753, -0.307436, 2.037311, 0.9137255, 0, 1, 1,
1.019052, 0.2525997, 2.263123, 0.9215686, 0, 1, 1,
1.024317, -0.3137731, 1.065061, 0.9254902, 0, 1, 1,
1.024911, -0.5115551, -0.4160736, 0.9333333, 0, 1, 1,
1.026645, 2.336071, -0.5323124, 0.9372549, 0, 1, 1,
1.030333, 0.3313985, 1.466847, 0.945098, 0, 1, 1,
1.03491, -1.159185, 0.5889131, 0.9490196, 0, 1, 1,
1.042674, -0.07117632, 1.289119, 0.9568627, 0, 1, 1,
1.048024, -0.7724904, 1.473894, 0.9607843, 0, 1, 1,
1.049828, -0.3671062, 2.240295, 0.9686275, 0, 1, 1,
1.051364, 0.6809467, 1.351711, 0.972549, 0, 1, 1,
1.058907, -1.028841, 2.912735, 0.9803922, 0, 1, 1,
1.067902, 0.1602608, 1.418752, 0.9843137, 0, 1, 1,
1.068158, -1.984609, 2.786009, 0.9921569, 0, 1, 1,
1.06902, 0.5896287, 1.623324, 0.9960784, 0, 1, 1,
1.071073, 0.9372322, 0.4147345, 1, 0, 0.9960784, 1,
1.072892, -0.1696388, 1.444199, 1, 0, 0.9882353, 1,
1.07668, -0.3764075, 1.885525, 1, 0, 0.9843137, 1,
1.081708, -1.446649, 0.2127588, 1, 0, 0.9764706, 1,
1.084373, -0.2010856, 2.241178, 1, 0, 0.972549, 1,
1.085166, -0.6615434, 1.478186, 1, 0, 0.9647059, 1,
1.086136, -0.04576208, 0.05500113, 1, 0, 0.9607843, 1,
1.088766, 0.7707456, 1.309431, 1, 0, 0.9529412, 1,
1.090249, 0.2842514, 1.022465, 1, 0, 0.9490196, 1,
1.09561, 0.7806482, 1.044829, 1, 0, 0.9411765, 1,
1.098137, 1.201649, 0.1133233, 1, 0, 0.9372549, 1,
1.09841, 0.3876207, 2.305451, 1, 0, 0.9294118, 1,
1.114319, -0.1441253, 2.582559, 1, 0, 0.9254902, 1,
1.115257, 0.484895, 1.199287, 1, 0, 0.9176471, 1,
1.117164, -1.41127, 1.933271, 1, 0, 0.9137255, 1,
1.133494, -0.8027444, 1.753975, 1, 0, 0.9058824, 1,
1.133617, 1.012947, 0.2087869, 1, 0, 0.9019608, 1,
1.141855, -0.4967211, 1.760439, 1, 0, 0.8941177, 1,
1.145487, -1.000915, 1.824425, 1, 0, 0.8862745, 1,
1.146637, -0.4066281, 1.243954, 1, 0, 0.8823529, 1,
1.147286, 0.5569944, 1.124695, 1, 0, 0.8745098, 1,
1.151995, -0.4588272, 3.753233, 1, 0, 0.8705882, 1,
1.152502, -1.145751, 2.500581, 1, 0, 0.8627451, 1,
1.153055, -0.4813575, 2.018882, 1, 0, 0.8588235, 1,
1.165903, -0.3624759, 2.693095, 1, 0, 0.8509804, 1,
1.169301, 0.6544619, 0.8519717, 1, 0, 0.8470588, 1,
1.17729, -2.218234, 3.445651, 1, 0, 0.8392157, 1,
1.18014, 0.5624311, 0.6537348, 1, 0, 0.8352941, 1,
1.181684, 0.8110384, 2.547968, 1, 0, 0.827451, 1,
1.183156, 1.825566, 0.5069018, 1, 0, 0.8235294, 1,
1.186008, -1.266299, 2.883718, 1, 0, 0.8156863, 1,
1.186641, 1.720316, 1.870152, 1, 0, 0.8117647, 1,
1.194627, -0.496998, 3.9024, 1, 0, 0.8039216, 1,
1.200709, 1.063944, 0.8031776, 1, 0, 0.7960784, 1,
1.206765, 0.5620697, 2.757798, 1, 0, 0.7921569, 1,
1.210118, 0.3549827, 1.197834, 1, 0, 0.7843137, 1,
1.210374, 0.6343464, 0.7157612, 1, 0, 0.7803922, 1,
1.216129, 0.9223201, 2.527897, 1, 0, 0.772549, 1,
1.221049, 1.424025, -0.2464621, 1, 0, 0.7686275, 1,
1.22415, 0.4764847, -1.313433, 1, 0, 0.7607843, 1,
1.229092, -0.7805203, 2.638353, 1, 0, 0.7568628, 1,
1.232921, 0.06263761, 0.9520279, 1, 0, 0.7490196, 1,
1.233111, 0.06047512, 3.008161, 1, 0, 0.7450981, 1,
1.236887, -0.5075848, 1.498706, 1, 0, 0.7372549, 1,
1.238542, -0.9774937, 0.9607896, 1, 0, 0.7333333, 1,
1.240682, -1.1067, 2.137775, 1, 0, 0.7254902, 1,
1.24331, 0.220056, 1.634465, 1, 0, 0.7215686, 1,
1.251272, 1.183189, -0.5885372, 1, 0, 0.7137255, 1,
1.260182, 3.573401, 0.2893532, 1, 0, 0.7098039, 1,
1.269704, 0.8916476, 1.428824, 1, 0, 0.7019608, 1,
1.271635, 0.00981089, 3.030649, 1, 0, 0.6941177, 1,
1.276461, 0.9585943, 2.865927, 1, 0, 0.6901961, 1,
1.280736, -0.3228889, 2.020927, 1, 0, 0.682353, 1,
1.290402, 1.420431, 2.336178, 1, 0, 0.6784314, 1,
1.294449, -1.322683, 0.8162372, 1, 0, 0.6705883, 1,
1.306102, -0.3522231, 2.400836, 1, 0, 0.6666667, 1,
1.308107, 2.671882, 1.414949, 1, 0, 0.6588235, 1,
1.31206, -0.8765814, 2.774585, 1, 0, 0.654902, 1,
1.322826, 0.6660845, -0.06988979, 1, 0, 0.6470588, 1,
1.330524, 0.5849304, 1.270039, 1, 0, 0.6431373, 1,
1.331423, -0.7720895, 1.449829, 1, 0, 0.6352941, 1,
1.331661, -0.4195596, 0.7940276, 1, 0, 0.6313726, 1,
1.336181, -1.637578, 2.356592, 1, 0, 0.6235294, 1,
1.337354, 1.510392, 1.466904, 1, 0, 0.6196079, 1,
1.343975, 0.9090436, -0.6923925, 1, 0, 0.6117647, 1,
1.354294, -0.7092665, 3.633193, 1, 0, 0.6078432, 1,
1.363652, -0.03124352, 1.519729, 1, 0, 0.6, 1,
1.378498, 1.677427, 0.1144745, 1, 0, 0.5921569, 1,
1.383053, -0.1889995, 0.7021675, 1, 0, 0.5882353, 1,
1.386814, -1.119298, 3.405315, 1, 0, 0.5803922, 1,
1.390136, 0.8803254, 0.928026, 1, 0, 0.5764706, 1,
1.392252, -0.005365758, 1.362293, 1, 0, 0.5686275, 1,
1.393286, 0.2137479, 0.7971935, 1, 0, 0.5647059, 1,
1.400366, 0.4228854, 2.447966, 1, 0, 0.5568628, 1,
1.40094, -0.5620039, 0.2637476, 1, 0, 0.5529412, 1,
1.408608, 1.908777, 0.2366656, 1, 0, 0.5450981, 1,
1.412676, 0.81649, 0.5443323, 1, 0, 0.5411765, 1,
1.415276, 0.1490682, 0.7001562, 1, 0, 0.5333334, 1,
1.421948, -0.2491406, 1.077272, 1, 0, 0.5294118, 1,
1.425166, -0.7991267, 2.23695, 1, 0, 0.5215687, 1,
1.426379, -1.061941, 2.487933, 1, 0, 0.5176471, 1,
1.434957, -1.090791, 2.468983, 1, 0, 0.509804, 1,
1.436982, -0.1320126, 2.466879, 1, 0, 0.5058824, 1,
1.442702, -0.248256, 0.4786615, 1, 0, 0.4980392, 1,
1.445894, -0.364138, 2.00147, 1, 0, 0.4901961, 1,
1.45022, -0.2886987, 0.3750508, 1, 0, 0.4862745, 1,
1.47404, -0.4128229, 2.410525, 1, 0, 0.4784314, 1,
1.475691, -0.9872139, 1.26972, 1, 0, 0.4745098, 1,
1.477166, 0.08328341, 3.112878, 1, 0, 0.4666667, 1,
1.478731, -0.3127739, 2.877619, 1, 0, 0.4627451, 1,
1.487204, -0.7853087, 0.30374, 1, 0, 0.454902, 1,
1.489153, -0.3429637, 0.9698064, 1, 0, 0.4509804, 1,
1.492459, -0.3510075, 3.258678, 1, 0, 0.4431373, 1,
1.49291, 0.7683364, 1.580423, 1, 0, 0.4392157, 1,
1.496867, 0.7270655, 2.655978, 1, 0, 0.4313726, 1,
1.499294, -0.9825247, 3.001055, 1, 0, 0.427451, 1,
1.515771, -0.8165298, 2.441642, 1, 0, 0.4196078, 1,
1.51683, 0.7254238, 0.008673165, 1, 0, 0.4156863, 1,
1.520702, -0.08043748, 1.796188, 1, 0, 0.4078431, 1,
1.527819, -0.9141702, 2.647747, 1, 0, 0.4039216, 1,
1.530691, 1.766627, -1.143006, 1, 0, 0.3960784, 1,
1.537243, -1.319129, 3.121612, 1, 0, 0.3882353, 1,
1.546768, -0.3743558, 2.368882, 1, 0, 0.3843137, 1,
1.556468, -0.8554122, 0.7849641, 1, 0, 0.3764706, 1,
1.557665, 0.809939, 0.5981595, 1, 0, 0.372549, 1,
1.579713, -0.6334997, 3.068016, 1, 0, 0.3647059, 1,
1.579796, -0.6034553, 2.259328, 1, 0, 0.3607843, 1,
1.592091, 0.03325736, 3.219744, 1, 0, 0.3529412, 1,
1.592824, 0.01765122, 1.836959, 1, 0, 0.3490196, 1,
1.595681, -0.05319146, 2.276729, 1, 0, 0.3411765, 1,
1.596455, -1.148924, 3.562508, 1, 0, 0.3372549, 1,
1.611883, 0.7460233, 0.9525324, 1, 0, 0.3294118, 1,
1.627328, -1.657306, 2.160276, 1, 0, 0.3254902, 1,
1.62944, 0.1516631, 1.592151, 1, 0, 0.3176471, 1,
1.632031, 0.2332376, 2.072428, 1, 0, 0.3137255, 1,
1.637053, 0.9808729, -1.231424, 1, 0, 0.3058824, 1,
1.656872, -0.1672881, 0.1727181, 1, 0, 0.2980392, 1,
1.678841, 0.5878365, -0.1455857, 1, 0, 0.2941177, 1,
1.681672, 0.8491287, 1.450572, 1, 0, 0.2862745, 1,
1.695095, -0.02747238, 0.5106924, 1, 0, 0.282353, 1,
1.723494, 0.9199919, 1.644794, 1, 0, 0.2745098, 1,
1.726582, -2.358273, 2.704832, 1, 0, 0.2705882, 1,
1.748019, -0.05411372, 1.962062, 1, 0, 0.2627451, 1,
1.758415, -0.5686219, 0.6308759, 1, 0, 0.2588235, 1,
1.7794, 0.6768021, 0.9106213, 1, 0, 0.2509804, 1,
1.798596, 0.91036, 0.1048279, 1, 0, 0.2470588, 1,
1.800922, -0.7414617, 1.092296, 1, 0, 0.2392157, 1,
1.802143, -0.568243, 3.960621, 1, 0, 0.2352941, 1,
1.821742, 0.1690602, 3.570518, 1, 0, 0.227451, 1,
1.846672, -0.1906086, 1.402451, 1, 0, 0.2235294, 1,
1.847067, -0.3401601, 1.341811, 1, 0, 0.2156863, 1,
1.853989, -0.6444408, 2.55556, 1, 0, 0.2117647, 1,
1.8672, 2.408985, 0.8966079, 1, 0, 0.2039216, 1,
1.885739, -0.03453631, 2.222605, 1, 0, 0.1960784, 1,
1.890275, -1.10445, 3.405032, 1, 0, 0.1921569, 1,
1.896667, 0.6143221, 2.211405, 1, 0, 0.1843137, 1,
1.945333, 0.9861037, 1.917907, 1, 0, 0.1803922, 1,
1.952187, 1.259559, 0.9784082, 1, 0, 0.172549, 1,
1.964079, 1.786234, 0.2193437, 1, 0, 0.1686275, 1,
2.001382, -0.5630612, 2.818924, 1, 0, 0.1607843, 1,
2.002316, -0.6062026, 1.93226, 1, 0, 0.1568628, 1,
2.011722, -0.4389767, 0.4378116, 1, 0, 0.1490196, 1,
2.014927, -0.2610606, 0.80898, 1, 0, 0.145098, 1,
2.046877, -0.08146451, 2.203784, 1, 0, 0.1372549, 1,
2.058882, -1.950266, 3.201266, 1, 0, 0.1333333, 1,
2.100324, -0.4164685, 2.035154, 1, 0, 0.1254902, 1,
2.100326, 0.8402573, -0.8048307, 1, 0, 0.1215686, 1,
2.101682, -0.7621029, 1.283261, 1, 0, 0.1137255, 1,
2.111311, 0.5811193, 1.053515, 1, 0, 0.1098039, 1,
2.132711, 0.2942646, 1.517516, 1, 0, 0.1019608, 1,
2.160324, 2.244177, 2.167934, 1, 0, 0.09411765, 1,
2.184697, 0.413424, 1.442309, 1, 0, 0.09019608, 1,
2.205542, 0.9924858, 0.9775916, 1, 0, 0.08235294, 1,
2.212765, -1.093008, 0.7860696, 1, 0, 0.07843138, 1,
2.264265, 1.476892, 1.272623, 1, 0, 0.07058824, 1,
2.282954, -1.599357, 2.696639, 1, 0, 0.06666667, 1,
2.290261, 0.3774494, 1.892977, 1, 0, 0.05882353, 1,
2.492908, -0.60143, -0.334182, 1, 0, 0.05490196, 1,
2.502071, 1.411555, 2.136701, 1, 0, 0.04705882, 1,
2.589315, -0.1127113, 1.871833, 1, 0, 0.04313726, 1,
2.658797, -1.885014, 1.822093, 1, 0, 0.03529412, 1,
2.660824, 0.6675203, 1.970382, 1, 0, 0.03137255, 1,
2.719582, 1.668412, -0.1892328, 1, 0, 0.02352941, 1,
2.777819, -1.181736, 2.834656, 1, 0, 0.01960784, 1,
3.619305, 0.9333124, 1.24807, 1, 0, 0.01176471, 1,
4.349744, -0.5712631, 1.647085, 1, 0, 0.007843138, 1
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
0.715883, -5.009719, -7.21923, 0, -0.5, 0.5, 0.5,
0.715883, -5.009719, -7.21923, 1, -0.5, 0.5, 0.5,
0.715883, -5.009719, -7.21923, 1, 1.5, 0.5, 0.5,
0.715883, -5.009719, -7.21923, 0, 1.5, 0.5, 0.5
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
-4.149857, -0.09616721, -7.21923, 0, -0.5, 0.5, 0.5,
-4.149857, -0.09616721, -7.21923, 1, -0.5, 0.5, 0.5,
-4.149857, -0.09616721, -7.21923, 1, 1.5, 0.5, 0.5,
-4.149857, -0.09616721, -7.21923, 0, 1.5, 0.5, 0.5
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
-4.149857, -5.009719, -0.2004809, 0, -0.5, 0.5, 0.5,
-4.149857, -5.009719, -0.2004809, 1, -0.5, 0.5, 0.5,
-4.149857, -5.009719, -0.2004809, 1, 1.5, 0.5, 0.5,
-4.149857, -5.009719, -0.2004809, 0, 1.5, 0.5, 0.5
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
-2, -3.875822, -5.599519,
4, -3.875822, -5.599519,
-2, -3.875822, -5.599519,
-2, -4.064805, -5.869471,
0, -3.875822, -5.599519,
0, -4.064805, -5.869471,
2, -3.875822, -5.599519,
2, -4.064805, -5.869471,
4, -3.875822, -5.599519,
4, -4.064805, -5.869471
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
"2",
"4"
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
-2, -4.44277, -6.409374, 0, -0.5, 0.5, 0.5,
-2, -4.44277, -6.409374, 1, -0.5, 0.5, 0.5,
-2, -4.44277, -6.409374, 1, 1.5, 0.5, 0.5,
-2, -4.44277, -6.409374, 0, 1.5, 0.5, 0.5,
0, -4.44277, -6.409374, 0, -0.5, 0.5, 0.5,
0, -4.44277, -6.409374, 1, -0.5, 0.5, 0.5,
0, -4.44277, -6.409374, 1, 1.5, 0.5, 0.5,
0, -4.44277, -6.409374, 0, 1.5, 0.5, 0.5,
2, -4.44277, -6.409374, 0, -0.5, 0.5, 0.5,
2, -4.44277, -6.409374, 1, -0.5, 0.5, 0.5,
2, -4.44277, -6.409374, 1, 1.5, 0.5, 0.5,
2, -4.44277, -6.409374, 0, 1.5, 0.5, 0.5,
4, -4.44277, -6.409374, 0, -0.5, 0.5, 0.5,
4, -4.44277, -6.409374, 1, -0.5, 0.5, 0.5,
4, -4.44277, -6.409374, 1, 1.5, 0.5, 0.5,
4, -4.44277, -6.409374, 0, 1.5, 0.5, 0.5
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
-3.026994, -2, -5.599519,
-3.026994, 2, -5.599519,
-3.026994, -2, -5.599519,
-3.214138, -2, -5.869471,
-3.026994, 0, -5.599519,
-3.214138, 0, -5.869471,
-3.026994, 2, -5.599519,
-3.214138, 2, -5.869471
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
-3.588426, -2, -6.409374, 0, -0.5, 0.5, 0.5,
-3.588426, -2, -6.409374, 1, -0.5, 0.5, 0.5,
-3.588426, -2, -6.409374, 1, 1.5, 0.5, 0.5,
-3.588426, -2, -6.409374, 0, 1.5, 0.5, 0.5,
-3.588426, 0, -6.409374, 0, -0.5, 0.5, 0.5,
-3.588426, 0, -6.409374, 1, -0.5, 0.5, 0.5,
-3.588426, 0, -6.409374, 1, 1.5, 0.5, 0.5,
-3.588426, 0, -6.409374, 0, 1.5, 0.5, 0.5,
-3.588426, 2, -6.409374, 0, -0.5, 0.5, 0.5,
-3.588426, 2, -6.409374, 1, -0.5, 0.5, 0.5,
-3.588426, 2, -6.409374, 1, 1.5, 0.5, 0.5,
-3.588426, 2, -6.409374, 0, 1.5, 0.5, 0.5
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
-3.026994, -3.875822, -4,
-3.026994, -3.875822, 4,
-3.026994, -3.875822, -4,
-3.214138, -4.064805, -4,
-3.026994, -3.875822, -2,
-3.214138, -4.064805, -2,
-3.026994, -3.875822, 0,
-3.214138, -4.064805, 0,
-3.026994, -3.875822, 2,
-3.214138, -4.064805, 2,
-3.026994, -3.875822, 4,
-3.214138, -4.064805, 4
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
-3.588426, -4.44277, -4, 0, -0.5, 0.5, 0.5,
-3.588426, -4.44277, -4, 1, -0.5, 0.5, 0.5,
-3.588426, -4.44277, -4, 1, 1.5, 0.5, 0.5,
-3.588426, -4.44277, -4, 0, 1.5, 0.5, 0.5,
-3.588426, -4.44277, -2, 0, -0.5, 0.5, 0.5,
-3.588426, -4.44277, -2, 1, -0.5, 0.5, 0.5,
-3.588426, -4.44277, -2, 1, 1.5, 0.5, 0.5,
-3.588426, -4.44277, -2, 0, 1.5, 0.5, 0.5,
-3.588426, -4.44277, 0, 0, -0.5, 0.5, 0.5,
-3.588426, -4.44277, 0, 1, -0.5, 0.5, 0.5,
-3.588426, -4.44277, 0, 1, 1.5, 0.5, 0.5,
-3.588426, -4.44277, 0, 0, 1.5, 0.5, 0.5,
-3.588426, -4.44277, 2, 0, -0.5, 0.5, 0.5,
-3.588426, -4.44277, 2, 1, -0.5, 0.5, 0.5,
-3.588426, -4.44277, 2, 1, 1.5, 0.5, 0.5,
-3.588426, -4.44277, 2, 0, 1.5, 0.5, 0.5,
-3.588426, -4.44277, 4, 0, -0.5, 0.5, 0.5,
-3.588426, -4.44277, 4, 1, -0.5, 0.5, 0.5,
-3.588426, -4.44277, 4, 1, 1.5, 0.5, 0.5,
-3.588426, -4.44277, 4, 0, 1.5, 0.5, 0.5
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
-3.026994, -3.875822, -5.599519,
-3.026994, 3.683488, -5.599519,
-3.026994, -3.875822, 5.198557,
-3.026994, 3.683488, 5.198557,
-3.026994, -3.875822, -5.599519,
-3.026994, -3.875822, 5.198557,
-3.026994, 3.683488, -5.599519,
-3.026994, 3.683488, 5.198557,
-3.026994, -3.875822, -5.599519,
4.45876, -3.875822, -5.599519,
-3.026994, -3.875822, 5.198557,
4.45876, -3.875822, 5.198557,
-3.026994, 3.683488, -5.599519,
4.45876, 3.683488, -5.599519,
-3.026994, 3.683488, 5.198557,
4.45876, 3.683488, 5.198557,
4.45876, -3.875822, -5.599519,
4.45876, 3.683488, -5.599519,
4.45876, -3.875822, 5.198557,
4.45876, 3.683488, 5.198557,
4.45876, -3.875822, -5.599519,
4.45876, -3.875822, 5.198557,
4.45876, 3.683488, -5.599519,
4.45876, 3.683488, 5.198557
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
var radius = 8.094309;
var distance = 36.0125;
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
mvMatrix.translate( -0.715883, 0.09616721, 0.2004809 );
mvMatrix.scale( 1.169117, 1.157741, 0.8104894 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.0125);
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
pyrithiobac<-read.table("pyrithiobac.xyz")
```

```
## Error in read.table("pyrithiobac.xyz"): no lines available in input
```

```r
x<-pyrithiobac$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyrithiobac' not found
```

```r
y<-pyrithiobac$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyrithiobac' not found
```

```r
z<-pyrithiobac$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyrithiobac' not found
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
-2.917978, -0.6805921, -1.503401, 0, 0, 1, 1, 1,
-2.817103, -1.06694, -1.516495, 1, 0, 0, 1, 1,
-2.74362, -2.107502, -1.562662, 1, 0, 0, 1, 1,
-2.658168, 0.9216597, -1.284473, 1, 0, 0, 1, 1,
-2.653821, 0.2099916, -2.027327, 1, 0, 0, 1, 1,
-2.513792, -0.8594944, -1.484976, 1, 0, 0, 1, 1,
-2.509978, -0.1625177, -0.1037381, 0, 0, 0, 1, 1,
-2.50807, 1.306893, -0.2320351, 0, 0, 0, 1, 1,
-2.493719, -0.9184701, -2.173937, 0, 0, 0, 1, 1,
-2.304261, 1.002257, 0.1958904, 0, 0, 0, 1, 1,
-2.293756, 1.548076, 0.6151651, 0, 0, 0, 1, 1,
-2.229448, 2.281658, -1.104293, 0, 0, 0, 1, 1,
-2.194022, 0.0117195, -0.1341413, 0, 0, 0, 1, 1,
-2.189355, -0.6001709, -1.456359, 1, 1, 1, 1, 1,
-2.172089, 0.6866241, -2.34693, 1, 1, 1, 1, 1,
-2.135867, -1.637714, -3.75486, 1, 1, 1, 1, 1,
-2.117405, -1.297908, -3.030381, 1, 1, 1, 1, 1,
-2.053584, -0.3933272, -2.727671, 1, 1, 1, 1, 1,
-2.024513, -1.054287, -1.252288, 1, 1, 1, 1, 1,
-1.991201, 0.9877614, 0.9318022, 1, 1, 1, 1, 1,
-1.925591, 0.06576738, -2.14301, 1, 1, 1, 1, 1,
-1.893904, -1.944334, -0.9965539, 1, 1, 1, 1, 1,
-1.870079, 0.7408908, -1.982315, 1, 1, 1, 1, 1,
-1.864478, -0.7267292, -3.281017, 1, 1, 1, 1, 1,
-1.828572, 1.618006, -1.543399, 1, 1, 1, 1, 1,
-1.799407, -0.3126478, -3.192428, 1, 1, 1, 1, 1,
-1.786608, -1.328206, -4.153622, 1, 1, 1, 1, 1,
-1.777664, 0.5607136, -1.153701, 1, 1, 1, 1, 1,
-1.752516, -1.726578, -2.244775, 0, 0, 1, 1, 1,
-1.742284, 0.1130427, -1.529057, 1, 0, 0, 1, 1,
-1.724062, 1.906234, 0.8449478, 1, 0, 0, 1, 1,
-1.706225, 1.529011, -0.1961185, 1, 0, 0, 1, 1,
-1.69418, -0.05901793, -3.113284, 1, 0, 0, 1, 1,
-1.683396, -0.5670393, -2.050426, 1, 0, 0, 1, 1,
-1.680015, 0.6802143, -2.016854, 0, 0, 0, 1, 1,
-1.676658, 1.62761, -2.083808, 0, 0, 0, 1, 1,
-1.668392, -0.9728224, -1.503193, 0, 0, 0, 1, 1,
-1.668275, 0.8482795, 0.06931356, 0, 0, 0, 1, 1,
-1.652323, 0.8810443, -2.726009, 0, 0, 0, 1, 1,
-1.619665, -0.0647429, -3.382653, 0, 0, 0, 1, 1,
-1.619118, -0.7133404, -2.153378, 0, 0, 0, 1, 1,
-1.60272, -0.5338055, -2.008037, 1, 1, 1, 1, 1,
-1.6026, 1.468431, -2.683577, 1, 1, 1, 1, 1,
-1.595095, 0.7143021, -3.278801, 1, 1, 1, 1, 1,
-1.563957, -1.548206, -2.030407, 1, 1, 1, 1, 1,
-1.531309, 1.127113, 0.4233082, 1, 1, 1, 1, 1,
-1.526621, 0.9696536, -2.561871, 1, 1, 1, 1, 1,
-1.52193, -0.6747732, -0.4125632, 1, 1, 1, 1, 1,
-1.520081, 0.1343387, -2.953172, 1, 1, 1, 1, 1,
-1.500976, -0.3250238, -3.058164, 1, 1, 1, 1, 1,
-1.483805, -0.1980975, -2.868075, 1, 1, 1, 1, 1,
-1.479605, 0.275519, -0.5623397, 1, 1, 1, 1, 1,
-1.475131, 0.2697047, -2.243349, 1, 1, 1, 1, 1,
-1.469316, 0.08207135, -2.782647, 1, 1, 1, 1, 1,
-1.463653, -0.5642524, -1.456074, 1, 1, 1, 1, 1,
-1.446721, -0.1770023, 0.8540897, 1, 1, 1, 1, 1,
-1.444111, 1.607024, -1.994218, 0, 0, 1, 1, 1,
-1.443581, 1.638433, 1.488588, 1, 0, 0, 1, 1,
-1.43347, -0.05727432, -3.338998, 1, 0, 0, 1, 1,
-1.432307, 1.200072, 0.5763621, 1, 0, 0, 1, 1,
-1.424482, -0.4905378, -2.549624, 1, 0, 0, 1, 1,
-1.419105, 0.5178057, -1.447054, 1, 0, 0, 1, 1,
-1.407982, -1.722726, -2.475377, 0, 0, 0, 1, 1,
-1.403181, -1.786211, -0.8900112, 0, 0, 0, 1, 1,
-1.401814, 0.5075249, -1.970454, 0, 0, 0, 1, 1,
-1.398363, 0.5961283, -2.671072, 0, 0, 0, 1, 1,
-1.389061, -1.815911, -4.525188, 0, 0, 0, 1, 1,
-1.387385, -1.531645, -3.166691, 0, 0, 0, 1, 1,
-1.385456, 0.2807689, -0.6919113, 0, 0, 0, 1, 1,
-1.384215, -0.6795202, -2.762695, 1, 1, 1, 1, 1,
-1.380038, 0.001636677, -2.684832, 1, 1, 1, 1, 1,
-1.371887, 1.516428, -2.410069, 1, 1, 1, 1, 1,
-1.365444, -0.5960981, -2.308872, 1, 1, 1, 1, 1,
-1.352676, 0.03023999, -2.074543, 1, 1, 1, 1, 1,
-1.351079, -0.08937029, -1.117005, 1, 1, 1, 1, 1,
-1.333703, 0.4676737, -1.742182, 1, 1, 1, 1, 1,
-1.319554, 1.605945, -0.9658684, 1, 1, 1, 1, 1,
-1.319485, -0.31859, -2.082207, 1, 1, 1, 1, 1,
-1.308115, -0.2376155, -1.871571, 1, 1, 1, 1, 1,
-1.307897, 0.03787399, -2.256428, 1, 1, 1, 1, 1,
-1.30132, 0.09705369, -1.357031, 1, 1, 1, 1, 1,
-1.300112, -0.3040763, -1.862775, 1, 1, 1, 1, 1,
-1.297292, 1.369134, -1.545941, 1, 1, 1, 1, 1,
-1.289839, -0.8151273, -2.057564, 1, 1, 1, 1, 1,
-1.288662, 1.66504, -2.454821, 0, 0, 1, 1, 1,
-1.284901, 0.9134369, 1.037118, 1, 0, 0, 1, 1,
-1.278597, -0.0872848, -1.72886, 1, 0, 0, 1, 1,
-1.277541, 0.6189312, -0.05766179, 1, 0, 0, 1, 1,
-1.27655, -0.7839562, -0.6278131, 1, 0, 0, 1, 1,
-1.276394, 0.8604776, -0.9615782, 1, 0, 0, 1, 1,
-1.276324, -0.3061111, -1.99661, 0, 0, 0, 1, 1,
-1.276192, -0.003401987, -1.83913, 0, 0, 0, 1, 1,
-1.273944, 2.260448, -0.5293758, 0, 0, 0, 1, 1,
-1.265754, 0.4933845, -1.137305, 0, 0, 0, 1, 1,
-1.253565, 1.00971, -3.087013, 0, 0, 0, 1, 1,
-1.25213, 1.419879, -1.111895, 0, 0, 0, 1, 1,
-1.251938, 0.244158, -2.429288, 0, 0, 0, 1, 1,
-1.230724, 0.529461, -1.788616, 1, 1, 1, 1, 1,
-1.225873, -0.03598186, -0.2034824, 1, 1, 1, 1, 1,
-1.212817, -0.3287334, -0.8278589, 1, 1, 1, 1, 1,
-1.208715, -1.85175, -1.548262, 1, 1, 1, 1, 1,
-1.206112, -0.2911545, -2.17974, 1, 1, 1, 1, 1,
-1.191693, -0.6828616, -2.11894, 1, 1, 1, 1, 1,
-1.179237, 1.40645, 0.3856044, 1, 1, 1, 1, 1,
-1.170357, 1.223791, -2.860798, 1, 1, 1, 1, 1,
-1.161799, -0.01008484, -1.260696, 1, 1, 1, 1, 1,
-1.156599, -0.9968863, -1.099494, 1, 1, 1, 1, 1,
-1.150327, -0.8335299, -3.66724, 1, 1, 1, 1, 1,
-1.140767, 1.143351, -0.4943425, 1, 1, 1, 1, 1,
-1.139532, -0.6595719, -3.685859, 1, 1, 1, 1, 1,
-1.136933, -0.5501438, -1.639706, 1, 1, 1, 1, 1,
-1.128832, 1.478852, -1.096524, 1, 1, 1, 1, 1,
-1.125167, 0.5528204, -0.2546998, 0, 0, 1, 1, 1,
-1.118779, 1.710284, -0.9708703, 1, 0, 0, 1, 1,
-1.110124, -0.8520738, -2.688659, 1, 0, 0, 1, 1,
-1.105158, 0.03710325, -1.22356, 1, 0, 0, 1, 1,
-1.10035, -1.7037, -2.730307, 1, 0, 0, 1, 1,
-1.095085, -0.2102022, -0.08444039, 1, 0, 0, 1, 1,
-1.092252, 0.9343505, 1.46945, 0, 0, 0, 1, 1,
-1.088133, 0.05625344, -2.450422, 0, 0, 0, 1, 1,
-1.085023, 0.7069523, -0.6546957, 0, 0, 0, 1, 1,
-1.070284, 0.6518984, -0.002070348, 0, 0, 0, 1, 1,
-1.059061, 1.262153, -1.664627, 0, 0, 0, 1, 1,
-1.058935, -0.8023584, -1.129404, 0, 0, 0, 1, 1,
-1.058531, 1.36196, 0.7726258, 0, 0, 0, 1, 1,
-1.057174, -0.895817, -1.408441, 1, 1, 1, 1, 1,
-1.055487, 0.1889603, -2.049091, 1, 1, 1, 1, 1,
-1.049095, -0.134653, -1.753558, 1, 1, 1, 1, 1,
-1.047752, 1.889537, -2.478817, 1, 1, 1, 1, 1,
-1.046166, -0.5277615, -1.625002, 1, 1, 1, 1, 1,
-1.045375, -0.7844514, -1.803547, 1, 1, 1, 1, 1,
-1.044328, -0.3054197, -1.957034, 1, 1, 1, 1, 1,
-1.036505, 0.09501224, -2.444196, 1, 1, 1, 1, 1,
-1.0328, 0.2442413, 0.657092, 1, 1, 1, 1, 1,
-1.030489, 1.576884, -0.9315228, 1, 1, 1, 1, 1,
-1.028684, 0.2235824, -0.0701458, 1, 1, 1, 1, 1,
-1.026884, -1.170195, -2.912387, 1, 1, 1, 1, 1,
-1.024884, -0.1864495, -3.795924, 1, 1, 1, 1, 1,
-1.020377, 0.07317038, -1.516895, 1, 1, 1, 1, 1,
-1.014234, -1.564685, -0.733796, 1, 1, 1, 1, 1,
-1.012405, 1.477726, 0.399407, 0, 0, 1, 1, 1,
-1.008915, 0.2472982, -0.1772452, 1, 0, 0, 1, 1,
-1.007467, -0.1849451, -1.63965, 1, 0, 0, 1, 1,
-0.9919851, 0.8930085, -1.960071, 1, 0, 0, 1, 1,
-0.9881465, 0.2041973, 0.1189663, 1, 0, 0, 1, 1,
-0.9834815, -1.457511, -1.441584, 1, 0, 0, 1, 1,
-0.9786529, -2.064142, 0.1760732, 0, 0, 0, 1, 1,
-0.9782678, 1.52945, 0.05253247, 0, 0, 0, 1, 1,
-0.9719067, 2.637341, 0.8963773, 0, 0, 0, 1, 1,
-0.9632939, -1.141503, -2.485206, 0, 0, 0, 1, 1,
-0.9607117, -0.1816023, -1.448777, 0, 0, 0, 1, 1,
-0.9546421, 1.1693, -1.460568, 0, 0, 0, 1, 1,
-0.9531888, -0.4255307, -3.150311, 0, 0, 0, 1, 1,
-0.9531074, -0.8041802, -1.257988, 1, 1, 1, 1, 1,
-0.952894, 2.004303, -1.617293, 1, 1, 1, 1, 1,
-0.952768, 0.4770277, -0.7013199, 1, 1, 1, 1, 1,
-0.9339675, -0.3719088, -2.73041, 1, 1, 1, 1, 1,
-0.9318146, 1.102581, -0.954491, 1, 1, 1, 1, 1,
-0.931599, -0.142842, -1.615012, 1, 1, 1, 1, 1,
-0.9295105, 0.6567954, -3.619512, 1, 1, 1, 1, 1,
-0.927303, -0.5236478, -3.667968, 1, 1, 1, 1, 1,
-0.9237279, 1.809216, -0.9674494, 1, 1, 1, 1, 1,
-0.9217551, -1.478646, 0.03301577, 1, 1, 1, 1, 1,
-0.9195296, 0.1095216, -2.321834, 1, 1, 1, 1, 1,
-0.9172279, 0.4158128, -1.963879, 1, 1, 1, 1, 1,
-0.9136125, 2.109285, 0.3795067, 1, 1, 1, 1, 1,
-0.8940659, -0.5981523, -3.328688, 1, 1, 1, 1, 1,
-0.883925, 0.4599833, -3.977153, 1, 1, 1, 1, 1,
-0.8830038, 0.5242928, -3.63514, 0, 0, 1, 1, 1,
-0.8802294, 0.4495293, -1.018963, 1, 0, 0, 1, 1,
-0.8799338, 0.9425597, -2.152632, 1, 0, 0, 1, 1,
-0.8711034, 1.212288, -1.502827, 1, 0, 0, 1, 1,
-0.8639132, 0.4116615, -1.215081, 1, 0, 0, 1, 1,
-0.8597291, 0.6186679, -0.123972, 1, 0, 0, 1, 1,
-0.8597018, -0.8408805, -2.609964, 0, 0, 0, 1, 1,
-0.8532495, 0.6389711, -2.022968, 0, 0, 0, 1, 1,
-0.8522629, -0.06037755, -2.638446, 0, 0, 0, 1, 1,
-0.8508165, -1.78503, -2.40845, 0, 0, 0, 1, 1,
-0.8507456, -1.579018, -1.949664, 0, 0, 0, 1, 1,
-0.8436816, -0.1881109, -1.7084, 0, 0, 0, 1, 1,
-0.8376796, 2.534613, -1.526358, 0, 0, 0, 1, 1,
-0.8312016, 1.272448, -0.7488841, 1, 1, 1, 1, 1,
-0.8293878, 1.30364, 0.3391609, 1, 1, 1, 1, 1,
-0.8284031, 0.3283029, -2.228986, 1, 1, 1, 1, 1,
-0.8277966, -0.3797624, -1.961225, 1, 1, 1, 1, 1,
-0.8180509, 0.170338, -0.4283095, 1, 1, 1, 1, 1,
-0.8162446, 0.2342301, -1.861542, 1, 1, 1, 1, 1,
-0.8111741, 0.8939737, -0.08652164, 1, 1, 1, 1, 1,
-0.805251, 0.8035613, 1.693993, 1, 1, 1, 1, 1,
-0.7956987, -0.3560461, -1.319522, 1, 1, 1, 1, 1,
-0.7919456, 0.1260857, -2.672432, 1, 1, 1, 1, 1,
-0.7879152, 0.8732354, -0.5062242, 1, 1, 1, 1, 1,
-0.7867396, -0.2281818, -0.3760639, 1, 1, 1, 1, 1,
-0.7814235, -0.1818722, -0.1328209, 1, 1, 1, 1, 1,
-0.7765974, -1.01871, -3.437647, 1, 1, 1, 1, 1,
-0.7702562, -0.5951115, -2.920819, 1, 1, 1, 1, 1,
-0.7688213, 0.6866769, 0.08176606, 0, 0, 1, 1, 1,
-0.7687683, -0.6661328, -0.4666749, 1, 0, 0, 1, 1,
-0.7593524, 0.7987573, -0.01304602, 1, 0, 0, 1, 1,
-0.7579647, 0.2187185, -2.281739, 1, 0, 0, 1, 1,
-0.7537262, -0.7328684, -3.359833, 1, 0, 0, 1, 1,
-0.7536068, 0.4733364, -1.043566, 1, 0, 0, 1, 1,
-0.753236, 0.0581197, -0.05050704, 0, 0, 0, 1, 1,
-0.7478953, -0.2662014, -1.965, 0, 0, 0, 1, 1,
-0.7470835, 0.5784226, -1.67632, 0, 0, 0, 1, 1,
-0.7427214, 2.453052, -0.8890699, 0, 0, 0, 1, 1,
-0.7420144, -0.5340023, -1.739983, 0, 0, 0, 1, 1,
-0.7366335, 0.2013322, -2.409893, 0, 0, 0, 1, 1,
-0.7294373, 0.3775806, 0.5234496, 0, 0, 0, 1, 1,
-0.711894, -1.894082, -3.171648, 1, 1, 1, 1, 1,
-0.6984936, -1.464557, -2.195015, 1, 1, 1, 1, 1,
-0.6965498, -0.6743386, -1.394539, 1, 1, 1, 1, 1,
-0.6922123, -1.014455, -3.604647, 1, 1, 1, 1, 1,
-0.6867397, 1.817764, -1.586999, 1, 1, 1, 1, 1,
-0.6862401, 0.3327517, -2.54009, 1, 1, 1, 1, 1,
-0.682148, -0.4007129, -1.853311, 1, 1, 1, 1, 1,
-0.6775347, -0.3327752, -2.927103, 1, 1, 1, 1, 1,
-0.6669689, -1.308407, -3.095842, 1, 1, 1, 1, 1,
-0.6665735, -0.03406808, -1.991767, 1, 1, 1, 1, 1,
-0.6618617, -1.773866, -3.361741, 1, 1, 1, 1, 1,
-0.6597504, -1.877989, -2.918827, 1, 1, 1, 1, 1,
-0.6578642, 0.03303367, -0.05153361, 1, 1, 1, 1, 1,
-0.6571093, 0.4106706, -1.129959, 1, 1, 1, 1, 1,
-0.6568843, 1.528936, -0.9378365, 1, 1, 1, 1, 1,
-0.6542916, -0.9297404, -4.272041, 0, 0, 1, 1, 1,
-0.6529285, 0.6144684, -0.9401146, 1, 0, 0, 1, 1,
-0.6486794, 0.01464179, -0.6291676, 1, 0, 0, 1, 1,
-0.6449142, 1.818911, -1.16291, 1, 0, 0, 1, 1,
-0.6438094, -0.06573015, -1.473234, 1, 0, 0, 1, 1,
-0.6408414, -2.702061, -1.112522, 1, 0, 0, 1, 1,
-0.6403553, 1.43018, 1.250765, 0, 0, 0, 1, 1,
-0.6401664, 0.1872734, -2.455769, 0, 0, 0, 1, 1,
-0.6373766, -0.8186995, -1.495881, 0, 0, 0, 1, 1,
-0.6318526, -0.7449957, -2.373803, 0, 0, 0, 1, 1,
-0.6313604, 0.29724, -0.469155, 0, 0, 0, 1, 1,
-0.6290842, 0.5256967, -1.055195, 0, 0, 0, 1, 1,
-0.6283056, 0.4667574, -0.6740392, 0, 0, 0, 1, 1,
-0.6277498, 1.420967, -0.5620691, 1, 1, 1, 1, 1,
-0.6238168, 0.9061061, -0.003367936, 1, 1, 1, 1, 1,
-0.6209589, -0.7163187, -2.964409, 1, 1, 1, 1, 1,
-0.6133314, -0.8312569, -1.392642, 1, 1, 1, 1, 1,
-0.6105322, 0.5790761, 2.22762, 1, 1, 1, 1, 1,
-0.6095163, 0.568518, -0.5874814, 1, 1, 1, 1, 1,
-0.6082276, -0.2636444, -2.735192, 1, 1, 1, 1, 1,
-0.6046494, -0.7427181, -1.494223, 1, 1, 1, 1, 1,
-0.6034684, 0.06428275, -1.366081, 1, 1, 1, 1, 1,
-0.593208, 0.4439608, -0.2338906, 1, 1, 1, 1, 1,
-0.5897655, -0.7214506, -3.729291, 1, 1, 1, 1, 1,
-0.5867938, -1.385756, -1.839922, 1, 1, 1, 1, 1,
-0.585587, -0.07653464, -2.087871, 1, 1, 1, 1, 1,
-0.578297, 0.4265668, -1.395785, 1, 1, 1, 1, 1,
-0.5749255, -1.486872, -4.026411, 1, 1, 1, 1, 1,
-0.5745283, -0.3624308, -3.674416, 0, 0, 1, 1, 1,
-0.5744244, -0.3078642, -2.498337, 1, 0, 0, 1, 1,
-0.573713, 1.60128, -1.969851, 1, 0, 0, 1, 1,
-0.5700532, 0.2818164, -2.146938, 1, 0, 0, 1, 1,
-0.5645092, 0.2810322, -1.514899, 1, 0, 0, 1, 1,
-0.5621186, 0.8285819, -2.56117, 1, 0, 0, 1, 1,
-0.5602481, -0.2236803, -1.693598, 0, 0, 0, 1, 1,
-0.5592421, 0.9160234, -0.6468754, 0, 0, 0, 1, 1,
-0.5531708, 0.08176482, -1.493287, 0, 0, 0, 1, 1,
-0.5499828, 0.9570705, -0.8066759, 0, 0, 0, 1, 1,
-0.5373898, 0.6809014, -0.6554859, 0, 0, 0, 1, 1,
-0.5363308, -0.1773514, -0.8520729, 0, 0, 0, 1, 1,
-0.5353736, -1.562978, -2.387493, 0, 0, 0, 1, 1,
-0.5333753, -0.1597558, -1.688001, 1, 1, 1, 1, 1,
-0.5306774, -0.4943722, -0.4356264, 1, 1, 1, 1, 1,
-0.5298031, 0.1114225, -2.332218, 1, 1, 1, 1, 1,
-0.5277632, 0.6699616, -0.7686609, 1, 1, 1, 1, 1,
-0.5208155, 0.3822327, -1.061983, 1, 1, 1, 1, 1,
-0.520663, 0.8164955, 0.318081, 1, 1, 1, 1, 1,
-0.5187801, -1.288043, -3.742638, 1, 1, 1, 1, 1,
-0.5181516, 1.079565, -1.430311, 1, 1, 1, 1, 1,
-0.5108507, -1.37566, -2.223471, 1, 1, 1, 1, 1,
-0.5050179, 0.08573575, -3.020054, 1, 1, 1, 1, 1,
-0.5027565, -0.6267983, -1.12786, 1, 1, 1, 1, 1,
-0.4955573, 1.28402, -2.107336, 1, 1, 1, 1, 1,
-0.4923903, 0.1337969, -0.2358729, 1, 1, 1, 1, 1,
-0.4922163, -1.326012, -1.308285, 1, 1, 1, 1, 1,
-0.4915093, -0.1002198, -1.896989, 1, 1, 1, 1, 1,
-0.4894561, -0.851788, -2.846296, 0, 0, 1, 1, 1,
-0.486485, -0.2555357, -3.182885, 1, 0, 0, 1, 1,
-0.4855739, 0.6792199, 0.416057, 1, 0, 0, 1, 1,
-0.4830816, -1.169398, -2.298565, 1, 0, 0, 1, 1,
-0.482228, 0.9968663, -2.965279, 1, 0, 0, 1, 1,
-0.4713223, 0.4284556, 0.2354638, 1, 0, 0, 1, 1,
-0.4643712, -0.3853247, -0.8007472, 0, 0, 0, 1, 1,
-0.4584861, -0.4190642, -1.868774, 0, 0, 0, 1, 1,
-0.4578208, 0.400743, -0.3114254, 0, 0, 0, 1, 1,
-0.4572108, 1.304279, 0.1752362, 0, 0, 0, 1, 1,
-0.4559317, -0.2394022, -1.217023, 0, 0, 0, 1, 1,
-0.454594, 0.6130519, -0.527943, 0, 0, 0, 1, 1,
-0.4542425, 0.6273071, -1.579298, 0, 0, 0, 1, 1,
-0.4540398, -2.019696, -1.395387, 1, 1, 1, 1, 1,
-0.4526624, 1.355099, -1.3607, 1, 1, 1, 1, 1,
-0.4518599, 0.5399756, -1.148062, 1, 1, 1, 1, 1,
-0.4514311, -1.277061, -0.7513861, 1, 1, 1, 1, 1,
-0.4479935, -0.3975943, -1.276686, 1, 1, 1, 1, 1,
-0.445561, -0.7070707, -2.232192, 1, 1, 1, 1, 1,
-0.4448538, -0.6046816, -1.168676, 1, 1, 1, 1, 1,
-0.4434416, -1.311638, -2.534323, 1, 1, 1, 1, 1,
-0.4424904, 0.4061765, -0.6502656, 1, 1, 1, 1, 1,
-0.4413447, -0.5348219, -2.166986, 1, 1, 1, 1, 1,
-0.4395833, -0.006156382, -3.469468, 1, 1, 1, 1, 1,
-0.439276, 0.1699088, -0.7929651, 1, 1, 1, 1, 1,
-0.4383703, -0.4064545, -3.478977, 1, 1, 1, 1, 1,
-0.4348004, 0.7051043, -0.2902987, 1, 1, 1, 1, 1,
-0.4327269, -0.5659367, -2.912654, 1, 1, 1, 1, 1,
-0.4320132, 0.7901339, 0.5234503, 0, 0, 1, 1, 1,
-0.4313793, -2.277754, -3.874232, 1, 0, 0, 1, 1,
-0.4312817, 0.8707748, -1.096938, 1, 0, 0, 1, 1,
-0.4298083, -0.6580331, -2.507858, 1, 0, 0, 1, 1,
-0.4247632, 1.720536, -1.039076, 1, 0, 0, 1, 1,
-0.4242226, 1.110644, -1.49425, 1, 0, 0, 1, 1,
-0.4156446, -0.001095504, -2.473502, 0, 0, 0, 1, 1,
-0.409789, -0.02487824, -1.197946, 0, 0, 0, 1, 1,
-0.4088027, -0.1684515, -2.792566, 0, 0, 0, 1, 1,
-0.4082313, -2.101476, -2.522766, 0, 0, 0, 1, 1,
-0.4025271, 1.605999, 0.0918875, 0, 0, 0, 1, 1,
-0.400995, 1.25186, -0.2296455, 0, 0, 0, 1, 1,
-0.3967193, 0.08838005, -1.037354, 0, 0, 0, 1, 1,
-0.3964078, 0.8724493, -0.8601909, 1, 1, 1, 1, 1,
-0.3881643, -1.208814, -3.322804, 1, 1, 1, 1, 1,
-0.3806899, -0.04043509, -3.270415, 1, 1, 1, 1, 1,
-0.3783161, -0.1406147, -2.648251, 1, 1, 1, 1, 1,
-0.3767232, 0.6325232, -1.566192, 1, 1, 1, 1, 1,
-0.375632, -2.752079, -4.04553, 1, 1, 1, 1, 1,
-0.3756078, 1.691246, -0.1226259, 1, 1, 1, 1, 1,
-0.3751231, -0.4612204, -1.894846, 1, 1, 1, 1, 1,
-0.3732759, -0.2704303, -0.1928343, 1, 1, 1, 1, 1,
-0.3676237, 1.371212, 0.3774496, 1, 1, 1, 1, 1,
-0.3671289, -0.7429834, -1.359397, 1, 1, 1, 1, 1,
-0.3670501, 0.5783653, -1.559492, 1, 1, 1, 1, 1,
-0.3631298, -0.908004, -2.579808, 1, 1, 1, 1, 1,
-0.3626646, 1.051101, -0.1782886, 1, 1, 1, 1, 1,
-0.361274, -1.141081, -1.766329, 1, 1, 1, 1, 1,
-0.3594656, -0.957497, -2.253816, 0, 0, 1, 1, 1,
-0.3506373, 0.5481175, 0.7004657, 1, 0, 0, 1, 1,
-0.3484834, 0.1383394, -0.2933434, 1, 0, 0, 1, 1,
-0.3444329, 0.360257, -1.197282, 1, 0, 0, 1, 1,
-0.3397282, 1.076469, -1.923679, 1, 0, 0, 1, 1,
-0.3387747, -0.8245289, -2.238114, 1, 0, 0, 1, 1,
-0.3374786, -0.4585774, -3.25742, 0, 0, 0, 1, 1,
-0.3357374, 0.2594535, 0.02702609, 0, 0, 0, 1, 1,
-0.3341725, 0.3749182, -0.9659286, 0, 0, 0, 1, 1,
-0.3338044, 1.278394, 0.6798483, 0, 0, 0, 1, 1,
-0.3291707, 1.580736, -0.6480771, 0, 0, 0, 1, 1,
-0.3280274, 1.147922, 0.8484819, 0, 0, 0, 1, 1,
-0.3273668, -1.690218, -3.383809, 0, 0, 0, 1, 1,
-0.3261377, -0.6661886, -3.284617, 1, 1, 1, 1, 1,
-0.3230181, -0.1945913, -1.689483, 1, 1, 1, 1, 1,
-0.3206749, -1.354723e-05, -4.051592, 1, 1, 1, 1, 1,
-0.314918, 0.8392819, -1.034256, 1, 1, 1, 1, 1,
-0.3120955, -0.1203737, -1.110244, 1, 1, 1, 1, 1,
-0.3075046, -0.2807872, -2.941123, 1, 1, 1, 1, 1,
-0.3052082, -0.3207523, -1.143834, 1, 1, 1, 1, 1,
-0.3028069, 0.2929544, -0.522014, 1, 1, 1, 1, 1,
-0.3012149, 0.115109, -2.544256, 1, 1, 1, 1, 1,
-0.3010821, -1.637092, -1.948859, 1, 1, 1, 1, 1,
-0.3003751, 0.780883, -1.731005, 1, 1, 1, 1, 1,
-0.2978024, 0.7864297, -0.5709559, 1, 1, 1, 1, 1,
-0.2951722, 0.4513842, -1.415851, 1, 1, 1, 1, 1,
-0.2929541, 0.3766903, -2.096013, 1, 1, 1, 1, 1,
-0.29189, 0.2004806, -0.2519814, 1, 1, 1, 1, 1,
-0.2887922, -1.7589, -3.374125, 0, 0, 1, 1, 1,
-0.2877687, -1.762777, -4.873877, 1, 0, 0, 1, 1,
-0.2836262, 1.318732, -0.3294845, 1, 0, 0, 1, 1,
-0.2800402, 0.9397711, -0.04949727, 1, 0, 0, 1, 1,
-0.2799094, 1.347017, 0.593726, 1, 0, 0, 1, 1,
-0.2772258, 2.844433, -0.9379081, 1, 0, 0, 1, 1,
-0.2752909, -2.66043, -4.38161, 0, 0, 0, 1, 1,
-0.26866, 0.09377698, -2.115095, 0, 0, 0, 1, 1,
-0.2655997, 1.743942, 0.1402055, 0, 0, 0, 1, 1,
-0.2634071, -0.3491405, -3.530957, 0, 0, 0, 1, 1,
-0.2628313, 0.9413714, -0.02299821, 0, 0, 0, 1, 1,
-0.2607562, 0.3280354, -1.342863, 0, 0, 0, 1, 1,
-0.2600284, 0.4592429, -0.2023913, 0, 0, 0, 1, 1,
-0.2593992, 0.126072, 1.59927, 1, 1, 1, 1, 1,
-0.2586743, 0.8899743, -0.8739811, 1, 1, 1, 1, 1,
-0.256874, -0.9511944, -1.030288, 1, 1, 1, 1, 1,
-0.2555426, -0.7331735, -3.362967, 1, 1, 1, 1, 1,
-0.2518046, 0.1438574, -3.448637, 1, 1, 1, 1, 1,
-0.2455998, -0.2499171, -2.521593, 1, 1, 1, 1, 1,
-0.2434533, -0.3943437, -1.586142, 1, 1, 1, 1, 1,
-0.2427304, -0.4227329, -2.0146, 1, 1, 1, 1, 1,
-0.2372783, -0.1862207, -2.066191, 1, 1, 1, 1, 1,
-0.2363771, 0.4152612, -0.1962532, 1, 1, 1, 1, 1,
-0.2285424, -0.1035301, -3.304816, 1, 1, 1, 1, 1,
-0.2206066, -0.9174575, -1.833016, 1, 1, 1, 1, 1,
-0.2181785, -2.393574, -1.78761, 1, 1, 1, 1, 1,
-0.2172074, -2.812112, -3.077443, 1, 1, 1, 1, 1,
-0.2167832, 1.058857, 0.05547379, 1, 1, 1, 1, 1,
-0.2159322, 0.3308187, -0.9806828, 0, 0, 1, 1, 1,
-0.2111033, 0.7300142, -1.126678, 1, 0, 0, 1, 1,
-0.2092443, -0.9103107, -4.277711, 1, 0, 0, 1, 1,
-0.2034591, -1.052562, -1.381353, 1, 0, 0, 1, 1,
-0.2000928, -0.4686524, -1.293068, 1, 0, 0, 1, 1,
-0.1988657, -0.08216991, -2.315189, 1, 0, 0, 1, 1,
-0.1981559, -0.3674093, -2.772329, 0, 0, 0, 1, 1,
-0.1960249, -0.318848, -0.6866446, 0, 0, 0, 1, 1,
-0.1951778, 2.014836, -0.1268546, 0, 0, 0, 1, 1,
-0.1939026, 1.051679, -1.478517, 0, 0, 0, 1, 1,
-0.1873622, -0.6488825, -0.2976724, 0, 0, 0, 1, 1,
-0.1873562, -0.127754, -3.866216, 0, 0, 0, 1, 1,
-0.1818197, -0.4452573, -1.828432, 0, 0, 0, 1, 1,
-0.1807126, 0.8935471, -1.174881, 1, 1, 1, 1, 1,
-0.1769702, 0.9451419, 2.098568, 1, 1, 1, 1, 1,
-0.1719983, 1.549121, -0.5826712, 1, 1, 1, 1, 1,
-0.1716365, 0.4470476, -1.722683, 1, 1, 1, 1, 1,
-0.1679204, -1.266017, -4.000434, 1, 1, 1, 1, 1,
-0.1644218, -0.5907131, -4.023476, 1, 1, 1, 1, 1,
-0.1586975, 0.4272231, -1.741536, 1, 1, 1, 1, 1,
-0.151274, -0.5141854, -1.301682, 1, 1, 1, 1, 1,
-0.1511792, 0.3339528, -3.284605, 1, 1, 1, 1, 1,
-0.1507834, 1.46789, -1.275603, 1, 1, 1, 1, 1,
-0.1500949, 0.04236675, -0.027681, 1, 1, 1, 1, 1,
-0.1461334, 1.489505, -0.7537521, 1, 1, 1, 1, 1,
-0.1441181, 0.141061, -0.08300963, 1, 1, 1, 1, 1,
-0.1375252, -0.1106172, -2.422841, 1, 1, 1, 1, 1,
-0.1364746, -0.8312914, -5.259589, 1, 1, 1, 1, 1,
-0.1362348, -1.172928, -3.471519, 0, 0, 1, 1, 1,
-0.1312772, 0.2833549, 0.4046108, 1, 0, 0, 1, 1,
-0.1275273, 0.0899027, -1.398748, 1, 0, 0, 1, 1,
-0.1190524, -0.6412266, -2.557174, 1, 0, 0, 1, 1,
-0.1134942, -0.266481, -1.57879, 1, 0, 0, 1, 1,
-0.1130909, 0.802224, -1.489273, 1, 0, 0, 1, 1,
-0.1112689, 0.5913083, -0.06607372, 0, 0, 0, 1, 1,
-0.1111323, -1.218633, -1.804153, 0, 0, 0, 1, 1,
-0.1105791, -0.5644472, -2.697511, 0, 0, 0, 1, 1,
-0.1078879, -1.322718, -3.275312, 0, 0, 0, 1, 1,
-0.1056136, 0.2724082, -0.7868988, 0, 0, 0, 1, 1,
-0.102701, 0.4253235, -1.755936, 0, 0, 0, 1, 1,
-0.1018253, -1.259069, -3.317992, 0, 0, 0, 1, 1,
-0.1017696, 0.08169057, -2.433301, 1, 1, 1, 1, 1,
-0.100342, -0.3899922, -1.233227, 1, 1, 1, 1, 1,
-0.1001355, -1.696649, -1.930926, 1, 1, 1, 1, 1,
-0.09784675, 0.6540408, -1.881009, 1, 1, 1, 1, 1,
-0.09727905, 0.318196, -1.812521, 1, 1, 1, 1, 1,
-0.09663758, 1.559418, -0.7977166, 1, 1, 1, 1, 1,
-0.09637982, 0.739473, -0.6461277, 1, 1, 1, 1, 1,
-0.09608864, 0.7188386, -1.834518, 1, 1, 1, 1, 1,
-0.09546199, 0.3631518, -0.744624, 1, 1, 1, 1, 1,
-0.0918735, 0.5665974, -0.2843446, 1, 1, 1, 1, 1,
-0.08219316, 0.6703931, 1.029844, 1, 1, 1, 1, 1,
-0.07955245, -0.1195893, -2.896081, 1, 1, 1, 1, 1,
-0.06807608, 0.309905, -1.181095, 1, 1, 1, 1, 1,
-0.06354267, -1.384352, -5.10853, 1, 1, 1, 1, 1,
-0.06328071, 0.1789077, 0.03420083, 1, 1, 1, 1, 1,
-0.06254181, 0.9549605, 0.5780182, 0, 0, 1, 1, 1,
-0.05735814, -0.1252779, -3.325267, 1, 0, 0, 1, 1,
-0.05728059, 0.2397118, 0.9095695, 1, 0, 0, 1, 1,
-0.05706745, -0.2411403, -3.62537, 1, 0, 0, 1, 1,
-0.05383313, 0.6668324, -1.37485, 1, 0, 0, 1, 1,
-0.0511899, 2.514511, -0.7066339, 1, 0, 0, 1, 1,
-0.05080797, -1.910693, -1.859327, 0, 0, 0, 1, 1,
-0.05074593, 2.039226, 0.8652081, 0, 0, 0, 1, 1,
-0.04972844, -0.3485507, -2.90455, 0, 0, 0, 1, 1,
-0.045966, 0.313769, -0.8766219, 0, 0, 0, 1, 1,
-0.04242326, 0.01838966, -1.723111, 0, 0, 0, 1, 1,
-0.04223904, -0.2120556, -2.48925, 0, 0, 0, 1, 1,
-0.03358587, 0.7120941, 0.4172989, 0, 0, 0, 1, 1,
-0.03139278, 0.3545038, -0.4009383, 1, 1, 1, 1, 1,
-0.03118213, 0.1519371, -0.2132505, 1, 1, 1, 1, 1,
-0.03104578, -1.108976, -4.281896, 1, 1, 1, 1, 1,
-0.02992931, -1.508097, -3.335479, 1, 1, 1, 1, 1,
-0.02533558, -0.4565131, -2.965691, 1, 1, 1, 1, 1,
-0.02480878, -3.765735, -5.442265, 1, 1, 1, 1, 1,
-0.02060705, -0.7707199, -2.053011, 1, 1, 1, 1, 1,
-0.02044831, 0.4777207, -1.06144, 1, 1, 1, 1, 1,
-0.01784637, 0.359497, -1.005748, 1, 1, 1, 1, 1,
-0.01758108, -0.2330642, -1.517177, 1, 1, 1, 1, 1,
-0.01608782, 1.24154, -2.314519, 1, 1, 1, 1, 1,
-0.01477531, -0.4689535, -5.086432, 1, 1, 1, 1, 1,
-0.01104304, -0.452038, -4.054371, 1, 1, 1, 1, 1,
-0.007080919, 0.8868907, 0.6900442, 1, 1, 1, 1, 1,
-0.004315783, 0.3145095, 1.287694, 1, 1, 1, 1, 1,
-0.004015423, -1.05768, -4.137018, 0, 0, 1, 1, 1,
-0.002806177, -0.5844247, -3.98109, 1, 0, 0, 1, 1,
-0.001502523, 1.439746, 1.080135, 1, 0, 0, 1, 1,
0.004779945, 0.3933127, 1.133455, 1, 0, 0, 1, 1,
0.006022287, -1.580271, 4.165664, 1, 0, 0, 1, 1,
0.007605754, -1.276524, 1.855262, 1, 0, 0, 1, 1,
0.01289421, -1.085968, 2.100121, 0, 0, 0, 1, 1,
0.01375332, 0.5697942, -0.1732393, 0, 0, 0, 1, 1,
0.01514779, 0.6951277, -0.2747941, 0, 0, 0, 1, 1,
0.02213773, -0.01195557, 3.710285, 0, 0, 0, 1, 1,
0.02248787, -0.05732233, 1.300777, 0, 0, 0, 1, 1,
0.02944031, 0.9024642, 0.2353452, 0, 0, 0, 1, 1,
0.03171569, 0.8596822, -1.221646, 0, 0, 0, 1, 1,
0.03374613, 0.7596663, -0.9009941, 1, 1, 1, 1, 1,
0.03387875, 0.396595, 0.8537149, 1, 1, 1, 1, 1,
0.03536162, -0.02552936, 3.369056, 1, 1, 1, 1, 1,
0.04140675, 2.638568, 0.4504642, 1, 1, 1, 1, 1,
0.04435495, 0.9307062, -0.2299175, 1, 1, 1, 1, 1,
0.04613737, -0.8942719, 3.932034, 1, 1, 1, 1, 1,
0.04705297, -0.9031364, 2.80278, 1, 1, 1, 1, 1,
0.04895732, 1.915123, 0.4001925, 1, 1, 1, 1, 1,
0.04902169, 0.8675545, 0.5244511, 1, 1, 1, 1, 1,
0.04929554, 0.2363351, -0.311419, 1, 1, 1, 1, 1,
0.04990384, -2.276737, 2.19486, 1, 1, 1, 1, 1,
0.05195764, -0.4079135, 2.87658, 1, 1, 1, 1, 1,
0.05217349, 0.7743701, 0.6868708, 1, 1, 1, 1, 1,
0.05219283, -0.7590144, 2.727562, 1, 1, 1, 1, 1,
0.05898325, 0.08151656, 1.682603, 1, 1, 1, 1, 1,
0.06096605, 0.5813819, -0.1415035, 0, 0, 1, 1, 1,
0.06271911, 1.170615, 0.8854339, 1, 0, 0, 1, 1,
0.06369893, -0.538264, 2.988052, 1, 0, 0, 1, 1,
0.06717382, 0.9994752, 1.043523, 1, 0, 0, 1, 1,
0.07067384, 1.18024, -0.1173995, 1, 0, 0, 1, 1,
0.07136437, 0.8176878, 0.122692, 1, 0, 0, 1, 1,
0.07503627, -0.3259668, 2.266065, 0, 0, 0, 1, 1,
0.09076226, 0.5856426, 1.005134, 0, 0, 0, 1, 1,
0.09475602, 0.8365978, 0.2377642, 0, 0, 0, 1, 1,
0.09802819, -0.3253193, 3.736145, 0, 0, 0, 1, 1,
0.09805448, -0.1249211, 0.04482037, 0, 0, 0, 1, 1,
0.1029127, -0.8594001, 1.724309, 0, 0, 0, 1, 1,
0.1033339, -2.16503, 3.223057, 0, 0, 0, 1, 1,
0.1035148, 0.2388907, 1.278318, 1, 1, 1, 1, 1,
0.1035976, -1.20349, 3.720549, 1, 1, 1, 1, 1,
0.1042761, -1.103002, 3.558473, 1, 1, 1, 1, 1,
0.1044285, 0.2683148, -0.8048797, 1, 1, 1, 1, 1,
0.1082456, 0.5087087, 0.6761506, 1, 1, 1, 1, 1,
0.1091912, -0.2437453, 1.536301, 1, 1, 1, 1, 1,
0.1111449, 0.2882341, 1.117792, 1, 1, 1, 1, 1,
0.1116968, -1.617279, 3.54006, 1, 1, 1, 1, 1,
0.1125022, -0.8245755, 3.795855, 1, 1, 1, 1, 1,
0.1125991, -0.4793857, 3.202872, 1, 1, 1, 1, 1,
0.1138373, -1.372475, 2.359208, 1, 1, 1, 1, 1,
0.1143105, 0.08371396, 1.91555, 1, 1, 1, 1, 1,
0.1160124, -0.4396842, 3.409812, 1, 1, 1, 1, 1,
0.1243403, 1.133329, -2.397644, 1, 1, 1, 1, 1,
0.1253188, 1.472477, 0.1586624, 1, 1, 1, 1, 1,
0.1298843, 0.8178195, 0.8944781, 0, 0, 1, 1, 1,
0.1303065, -1.4264, 4.291625, 1, 0, 0, 1, 1,
0.1319919, -0.8491406, 3.77089, 1, 0, 0, 1, 1,
0.1336488, 0.7924613, 1.488417, 1, 0, 0, 1, 1,
0.1356124, -0.1958108, 1.93504, 1, 0, 0, 1, 1,
0.137922, 0.1111594, 0.2931318, 1, 0, 0, 1, 1,
0.139558, 0.170928, 2.375511, 0, 0, 0, 1, 1,
0.1476931, -1.128855, 2.474583, 0, 0, 0, 1, 1,
0.1527062, 0.7611492, 1.978956, 0, 0, 0, 1, 1,
0.1550712, -0.5533573, 3.295806, 0, 0, 0, 1, 1,
0.1615163, -0.9906909, 2.659978, 0, 0, 0, 1, 1,
0.1628081, -0.5490896, 3.737553, 0, 0, 0, 1, 1,
0.1636628, -0.07575722, 2.623583, 0, 0, 0, 1, 1,
0.1664679, 1.35538, 0.8700073, 1, 1, 1, 1, 1,
0.172965, 0.5909335, 0.1583122, 1, 1, 1, 1, 1,
0.1772048, -0.9384866, 1.816362, 1, 1, 1, 1, 1,
0.1784401, 1.485232, 0.009645956, 1, 1, 1, 1, 1,
0.1803731, -1.339068, 1.47453, 1, 1, 1, 1, 1,
0.1806854, -0.4951025, 2.079343, 1, 1, 1, 1, 1,
0.1843173, 0.4046679, 1.399851, 1, 1, 1, 1, 1,
0.1880594, -0.09812982, 2.03808, 1, 1, 1, 1, 1,
0.1903792, 0.781112, 0.9720832, 1, 1, 1, 1, 1,
0.2041107, 1.507052, -0.3107491, 1, 1, 1, 1, 1,
0.2048253, 0.2445891, 1.736738, 1, 1, 1, 1, 1,
0.2062033, -0.3805611, 3.570515, 1, 1, 1, 1, 1,
0.206725, -0.5393496, 3.715748, 1, 1, 1, 1, 1,
0.2086356, -0.7433105, 1.781979, 1, 1, 1, 1, 1,
0.2159936, -0.3098399, 2.542602, 1, 1, 1, 1, 1,
0.2172473, -1.135592, 2.40962, 0, 0, 1, 1, 1,
0.2195173, 0.3302982, 0.9960048, 1, 0, 0, 1, 1,
0.2270273, -0.4431719, 1.383924, 1, 0, 0, 1, 1,
0.2275725, 1.078315, 0.2686927, 1, 0, 0, 1, 1,
0.2288051, 0.07299939, 1.404659, 1, 0, 0, 1, 1,
0.2324493, 0.08605359, 1.424109, 1, 0, 0, 1, 1,
0.2380074, -0.9817648, 1.869475, 0, 0, 0, 1, 1,
0.2400438, 1.837403, -0.8234292, 0, 0, 0, 1, 1,
0.241015, 0.1210513, 0.1416186, 0, 0, 0, 1, 1,
0.2417783, -0.988088, 0.942521, 0, 0, 0, 1, 1,
0.2418441, -0.3432478, 2.827142, 0, 0, 0, 1, 1,
0.2509999, -1.313069, 2.227499, 0, 0, 0, 1, 1,
0.2535554, -0.7994965, 2.831376, 0, 0, 0, 1, 1,
0.2565558, 0.1938618, -1.951913, 1, 1, 1, 1, 1,
0.257373, -0.5227108, 1.248438, 1, 1, 1, 1, 1,
0.2575014, 0.8074687, 0.5677844, 1, 1, 1, 1, 1,
0.2577284, 0.09151465, 1.787778, 1, 1, 1, 1, 1,
0.2585361, 0.3642555, 2.138216, 1, 1, 1, 1, 1,
0.2597336, 0.8011569, -0.6806409, 1, 1, 1, 1, 1,
0.2605427, 0.9810627, 0.3600556, 1, 1, 1, 1, 1,
0.2614864, 0.488677, 1.633677, 1, 1, 1, 1, 1,
0.267974, -0.4309324, 3.883758, 1, 1, 1, 1, 1,
0.2681805, 0.7687914, 0.5733142, 1, 1, 1, 1, 1,
0.2687778, 1.870497, -0.4256287, 1, 1, 1, 1, 1,
0.2715317, 0.205575, 0.6717935, 1, 1, 1, 1, 1,
0.2740312, 0.7424592, 1.232271, 1, 1, 1, 1, 1,
0.2779406, 1.965996, -0.8145322, 1, 1, 1, 1, 1,
0.2804667, -1.185387, 1.73876, 1, 1, 1, 1, 1,
0.2817549, 0.7050857, 1.973093, 0, 0, 1, 1, 1,
0.2866288, 1.973748, 0.6516361, 1, 0, 0, 1, 1,
0.2896826, 0.2950825, 2.792622, 1, 0, 0, 1, 1,
0.290972, -0.2584865, 3.314649, 1, 0, 0, 1, 1,
0.2909844, -0.8414959, 3.183691, 1, 0, 0, 1, 1,
0.2994417, 0.8998803, 0.71965, 1, 0, 0, 1, 1,
0.3011209, 0.9346023, -0.1306895, 0, 0, 0, 1, 1,
0.3028785, 2.75275, 0.1444736, 0, 0, 0, 1, 1,
0.3029587, -0.5085935, 1.190965, 0, 0, 0, 1, 1,
0.3029768, -2.003443, 4.892588, 0, 0, 0, 1, 1,
0.3030649, 2.287414, 2.415823, 0, 0, 0, 1, 1,
0.3043149, -0.9889457, 4.268443, 0, 0, 0, 1, 1,
0.3046356, 0.7169517, 0.03759011, 0, 0, 0, 1, 1,
0.305536, 0.2478703, -2.165437, 1, 1, 1, 1, 1,
0.3094085, -1.736, 2.403131, 1, 1, 1, 1, 1,
0.3102245, -0.9516305, 2.932011, 1, 1, 1, 1, 1,
0.3137837, 0.6594481, -1.443871, 1, 1, 1, 1, 1,
0.3141723, -0.8871474, 2.046017, 1, 1, 1, 1, 1,
0.314878, 0.531993, 0.8453738, 1, 1, 1, 1, 1,
0.318069, 2.106573, 1.977702, 1, 1, 1, 1, 1,
0.3216368, 1.049361, 0.002250922, 1, 1, 1, 1, 1,
0.3217426, -0.5683452, 2.992746, 1, 1, 1, 1, 1,
0.3233581, 1.090283, 0.1766875, 1, 1, 1, 1, 1,
0.3256241, 0.01023812, 1.313096, 1, 1, 1, 1, 1,
0.3289369, 1.057654, 0.3555066, 1, 1, 1, 1, 1,
0.3394677, 1.934427, 0.6111853, 1, 1, 1, 1, 1,
0.3422483, 0.01529746, 1.790483, 1, 1, 1, 1, 1,
0.3463596, -0.7100021, 4.425011, 1, 1, 1, 1, 1,
0.3485068, 0.8580956, -1.235984, 0, 0, 1, 1, 1,
0.3486936, 1.010261, -0.6633008, 1, 0, 0, 1, 1,
0.3525901, 0.497397, 1.4962, 1, 0, 0, 1, 1,
0.3527384, 0.05274892, 1.058029, 1, 0, 0, 1, 1,
0.3543773, -0.5000234, 2.476301, 1, 0, 0, 1, 1,
0.3548394, -1.460939, 3.21493, 1, 0, 0, 1, 1,
0.355814, 0.9417098, -0.2589194, 0, 0, 0, 1, 1,
0.3635218, -0.01006198, 2.729784, 0, 0, 0, 1, 1,
0.3640068, 0.7090884, 0.7776837, 0, 0, 0, 1, 1,
0.3669474, 1.005201, 1.697441, 0, 0, 0, 1, 1,
0.3708666, 0.2249514, 1.216119, 0, 0, 0, 1, 1,
0.371985, 0.336164, 0.8686504, 0, 0, 0, 1, 1,
0.3720303, 0.6319765, -0.4301048, 0, 0, 0, 1, 1,
0.3745293, 0.02085827, 2.218328, 1, 1, 1, 1, 1,
0.3766966, -0.6106017, 3.678565, 1, 1, 1, 1, 1,
0.3767069, -0.2505417, 2.05489, 1, 1, 1, 1, 1,
0.3769365, 0.4980326, 1.106475, 1, 1, 1, 1, 1,
0.3824682, 0.560038, -0.8104926, 1, 1, 1, 1, 1,
0.3829335, -0.8791456, 2.731175, 1, 1, 1, 1, 1,
0.3872811, -1.553503, 4.363954, 1, 1, 1, 1, 1,
0.3878846, 1.790423, -0.3398213, 1, 1, 1, 1, 1,
0.3885379, -0.1809437, 0.7617067, 1, 1, 1, 1, 1,
0.3892899, -0.08439384, 2.003869, 1, 1, 1, 1, 1,
0.3905493, 0.4763586, 0.05930631, 1, 1, 1, 1, 1,
0.3918017, 1.599726, -0.3329592, 1, 1, 1, 1, 1,
0.4024823, -0.7363055, 2.317693, 1, 1, 1, 1, 1,
0.4035294, 1.363279, 0.05436846, 1, 1, 1, 1, 1,
0.4076418, -1.401494, 1.80969, 1, 1, 1, 1, 1,
0.410746, -1.37502, 2.417359, 0, 0, 1, 1, 1,
0.411207, -0.834646, 3.705524, 1, 0, 0, 1, 1,
0.4130307, 0.006433379, -0.151861, 1, 0, 0, 1, 1,
0.4300016, -0.7118102, 3.687835, 1, 0, 0, 1, 1,
0.4373676, 2.388362, 0.2523998, 1, 0, 0, 1, 1,
0.4406801, -1.361403, 3.706592, 1, 0, 0, 1, 1,
0.4426013, -0.06893734, 1.641976, 0, 0, 0, 1, 1,
0.4460619, -0.2541147, 2.234588, 0, 0, 0, 1, 1,
0.4466021, -0.9307982, 4.380649, 0, 0, 0, 1, 1,
0.4478568, -0.5000183, 1.670805, 0, 0, 0, 1, 1,
0.4561138, -0.5637056, 2.391899, 0, 0, 0, 1, 1,
0.4573749, 0.04341696, 1.117278, 0, 0, 0, 1, 1,
0.457658, -0.765699, 2.275403, 0, 0, 0, 1, 1,
0.4706634, -2.465517, 3.732429, 1, 1, 1, 1, 1,
0.4828105, 0.0404673, 3.50459, 1, 1, 1, 1, 1,
0.4856119, 0.7769561, 0.7454466, 1, 1, 1, 1, 1,
0.4869149, -1.296046, 1.784942, 1, 1, 1, 1, 1,
0.4884933, -0.9068587, 2.099866, 1, 1, 1, 1, 1,
0.4967645, -1.855765, 2.994135, 1, 1, 1, 1, 1,
0.4972475, 0.2650944, 1.478316, 1, 1, 1, 1, 1,
0.4986793, -0.6663433, 0.562831, 1, 1, 1, 1, 1,
0.5033315, 0.363402, 0.9306003, 1, 1, 1, 1, 1,
0.5140561, -0.1523023, 1.322721, 1, 1, 1, 1, 1,
0.5159749, -1.251371, 4.13636, 1, 1, 1, 1, 1,
0.517365, 0.8988025, 0.6496637, 1, 1, 1, 1, 1,
0.5229754, -0.8304694, 2.814317, 1, 1, 1, 1, 1,
0.5291482, 0.3373315, 0.6400835, 1, 1, 1, 1, 1,
0.5313295, -0.9270735, 2.21061, 1, 1, 1, 1, 1,
0.5356514, 2.599502, -0.316503, 0, 0, 1, 1, 1,
0.5369971, -0.7413307, 2.647228, 1, 0, 0, 1, 1,
0.5410109, -1.20783, 2.568835, 1, 0, 0, 1, 1,
0.5415323, 0.3851253, 1.048834, 1, 0, 0, 1, 1,
0.5482997, 0.8732468, 2.049972, 1, 0, 0, 1, 1,
0.5484396, -0.1481701, 0.4014102, 1, 0, 0, 1, 1,
0.5499124, -1.10336, 1.523095, 0, 0, 0, 1, 1,
0.5503367, -1.105397, 3.742175, 0, 0, 0, 1, 1,
0.5538067, 0.02035016, -0.3698167, 0, 0, 0, 1, 1,
0.5555234, 1.591751, 2.25112, 0, 0, 0, 1, 1,
0.5608056, -2.522502, 4.709117, 0, 0, 0, 1, 1,
0.5670303, -1.05589, 2.181162, 0, 0, 0, 1, 1,
0.5684704, -1.335578, 2.467574, 0, 0, 0, 1, 1,
0.5685647, -0.8162779, 2.230034, 1, 1, 1, 1, 1,
0.5750152, -0.7529592, 2.333964, 1, 1, 1, 1, 1,
0.5756981, -1.635609, 2.956619, 1, 1, 1, 1, 1,
0.5791723, -0.8095465, 2.100533, 1, 1, 1, 1, 1,
0.5846651, 0.8407388, 1.153651, 1, 1, 1, 1, 1,
0.5861607, 1.089011, 0.7017547, 1, 1, 1, 1, 1,
0.589761, -1.213309, 1.413357, 1, 1, 1, 1, 1,
0.5948299, 0.4567684, 0.03323462, 1, 1, 1, 1, 1,
0.5975078, -0.7150434, 2.253142, 1, 1, 1, 1, 1,
0.5976096, 0.4366622, 1.279425, 1, 1, 1, 1, 1,
0.6005736, -0.7905877, 2.086803, 1, 1, 1, 1, 1,
0.6145577, -1.234748, 2.046098, 1, 1, 1, 1, 1,
0.6190453, 0.1971734, 0.8027164, 1, 1, 1, 1, 1,
0.6211359, -0.7301561, 3.673888, 1, 1, 1, 1, 1,
0.6229594, 1.099931, 1.082706, 1, 1, 1, 1, 1,
0.6235315, -1.524336, 3.088015, 0, 0, 1, 1, 1,
0.6258829, 0.9524637, -0.449493, 1, 0, 0, 1, 1,
0.6280896, -0.848888, 2.509204, 1, 0, 0, 1, 1,
0.6368357, -2.394351, 1.840028, 1, 0, 0, 1, 1,
0.6557567, 0.01589271, 1.391538, 1, 0, 0, 1, 1,
0.6600127, -1.662593, 1.409724, 1, 0, 0, 1, 1,
0.6622987, 1.701359, 0.3245203, 0, 0, 0, 1, 1,
0.663182, 0.7070791, 1.164541, 0, 0, 0, 1, 1,
0.663422, -1.138455, 3.241452, 0, 0, 0, 1, 1,
0.6668598, -0.5220975, 1.778795, 0, 0, 0, 1, 1,
0.6729386, -1.556308, 2.776442, 0, 0, 0, 1, 1,
0.6834491, -0.2452013, 1.759957, 0, 0, 0, 1, 1,
0.6850221, 0.1415606, 1.316412, 0, 0, 0, 1, 1,
0.6883593, -0.5596262, 0.9210961, 1, 1, 1, 1, 1,
0.6885685, 1.224626, 0.7920437, 1, 1, 1, 1, 1,
0.6908438, 0.3198243, 1.979531, 1, 1, 1, 1, 1,
0.6953686, -0.26201, 1.893152, 1, 1, 1, 1, 1,
0.7086348, -0.629313, 2.802737, 1, 1, 1, 1, 1,
0.7128311, 0.7119324, 2.722394, 1, 1, 1, 1, 1,
0.715215, -0.7692836, 2.22853, 1, 1, 1, 1, 1,
0.7155221, -0.1307475, 2.089931, 1, 1, 1, 1, 1,
0.7156631, 0.9093055, 1.498147, 1, 1, 1, 1, 1,
0.7161502, 1.839909, 0.6617923, 1, 1, 1, 1, 1,
0.7167078, 0.9602435, 2.333035, 1, 1, 1, 1, 1,
0.7168394, 0.6822309, 1.302168, 1, 1, 1, 1, 1,
0.7174742, 1.302859, 1.424608, 1, 1, 1, 1, 1,
0.7176099, 1.784067, 1.672273, 1, 1, 1, 1, 1,
0.7181162, 0.1837849, 2.879268, 1, 1, 1, 1, 1,
0.7269533, 1.078974, 1.407082, 0, 0, 1, 1, 1,
0.7284231, -0.0006257041, 1.676582, 1, 0, 0, 1, 1,
0.7330656, 1.125104, -0.2024182, 1, 0, 0, 1, 1,
0.7341987, 0.07764072, 0.6658389, 1, 0, 0, 1, 1,
0.7374381, 0.8629794, 0.8072219, 1, 0, 0, 1, 1,
0.7418808, 1.506661, -0.1085064, 1, 0, 0, 1, 1,
0.7492063, 0.1102356, 1.486225, 0, 0, 0, 1, 1,
0.7500199, 0.6325404, -1.133571, 0, 0, 0, 1, 1,
0.7527178, 0.3558294, 2.514188, 0, 0, 0, 1, 1,
0.7560981, -0.423283, 1.735759, 0, 0, 0, 1, 1,
0.7565733, 1.022413, 0.8867399, 0, 0, 0, 1, 1,
0.7568885, -1.040862, 2.881649, 0, 0, 0, 1, 1,
0.7598639, -0.8123434, 2.214135, 0, 0, 0, 1, 1,
0.759936, 0.8211296, 1.96796, 1, 1, 1, 1, 1,
0.7656103, -0.3105468, 1.588611, 1, 1, 1, 1, 1,
0.7709877, -0.07489798, 2.299435, 1, 1, 1, 1, 1,
0.7787054, -0.7375944, 3.910712, 1, 1, 1, 1, 1,
0.7810209, -0.1950397, 0.9070213, 1, 1, 1, 1, 1,
0.7858374, -1.407683, 2.285195, 1, 1, 1, 1, 1,
0.7892603, 1.872524, 1.225267, 1, 1, 1, 1, 1,
0.7898067, -1.566663, 2.438141, 1, 1, 1, 1, 1,
0.7917364, 3.138816, 0.3205317, 1, 1, 1, 1, 1,
0.7930288, -0.2773867, 2.935608, 1, 1, 1, 1, 1,
0.7938083, 0.7277833, 0.7899047, 1, 1, 1, 1, 1,
0.793816, 0.8688432, -0.01332135, 1, 1, 1, 1, 1,
0.7975035, 1.643782, 0.1395601, 1, 1, 1, 1, 1,
0.7977737, 0.01268525, 0.1425776, 1, 1, 1, 1, 1,
0.8039002, -0.4427832, 2.056433, 1, 1, 1, 1, 1,
0.8108181, 0.2927726, 0.4960734, 0, 0, 1, 1, 1,
0.8138937, 1.109195, -0.1029772, 1, 0, 0, 1, 1,
0.8148603, 0.9059649, 0.6643416, 1, 0, 0, 1, 1,
0.8149591, 1.040978, -1.188894, 1, 0, 0, 1, 1,
0.8179428, 0.04143615, 1.11431, 1, 0, 0, 1, 1,
0.824192, -1.517312, 2.000405, 1, 0, 0, 1, 1,
0.8350701, -0.02476085, 2.470937, 0, 0, 0, 1, 1,
0.8360847, -0.1697787, 1.990885, 0, 0, 0, 1, 1,
0.8475409, 0.7459328, 2.017484, 0, 0, 0, 1, 1,
0.848337, 1.361729, 0.341914, 0, 0, 0, 1, 1,
0.8509755, -1.298649, 0.9492345, 0, 0, 0, 1, 1,
0.8552914, 0.9068598, -0.2516315, 0, 0, 0, 1, 1,
0.8570403, 0.8932446, 1.852822, 0, 0, 0, 1, 1,
0.8603523, -1.642917, 3.13977, 1, 1, 1, 1, 1,
0.8614029, 0.3965264, 2.668185, 1, 1, 1, 1, 1,
0.8647902, -0.01119031, 2.072062, 1, 1, 1, 1, 1,
0.8671914, 0.9627258, 2.235659, 1, 1, 1, 1, 1,
0.8708134, -0.0965909, 2.304786, 1, 1, 1, 1, 1,
0.8720218, 1.162424, 0.555499, 1, 1, 1, 1, 1,
0.8723106, 1.183188, 1.39916, 1, 1, 1, 1, 1,
0.8775234, -0.4472822, 0.3542939, 1, 1, 1, 1, 1,
0.8776432, 1.49182, 0.8895112, 1, 1, 1, 1, 1,
0.8817084, 1.075534, -0.04374144, 1, 1, 1, 1, 1,
0.8834733, -0.235845, 1.390441, 1, 1, 1, 1, 1,
0.8846269, -0.7044085, 2.750994, 1, 1, 1, 1, 1,
0.885868, 0.6919795, 0.2696045, 1, 1, 1, 1, 1,
0.8873894, -0.05467789, 4.390707, 1, 1, 1, 1, 1,
0.8932782, 0.4586712, 1.291954, 1, 1, 1, 1, 1,
0.8937676, 0.201996, 1.525114, 0, 0, 1, 1, 1,
0.9006776, -1.285366, 2.198925, 1, 0, 0, 1, 1,
0.9043704, -1.814075, 1.771994, 1, 0, 0, 1, 1,
0.9050405, -0.04595071, 2.255996, 1, 0, 0, 1, 1,
0.9060423, -0.8769749, 1.701436, 1, 0, 0, 1, 1,
0.9380838, -0.5749887, 1.704206, 1, 0, 0, 1, 1,
0.9475276, -0.7553785, 0.7844099, 0, 0, 0, 1, 1,
0.9515491, -0.3812515, 1.289062, 0, 0, 0, 1, 1,
0.9517592, -1.289879, 2.821064, 0, 0, 0, 1, 1,
0.9519231, 1.595397, 0.977213, 0, 0, 0, 1, 1,
0.9573132, -1.010308, 3.1041, 0, 0, 0, 1, 1,
0.9575468, 0.7897272, 1.663841, 0, 0, 0, 1, 1,
0.9581744, 0.1606957, 2.947967, 0, 0, 0, 1, 1,
0.9582803, -1.026866, 2.342153, 1, 1, 1, 1, 1,
0.9711245, -0.5173711, 1.291049, 1, 1, 1, 1, 1,
0.9733933, -0.4970056, 1.760221, 1, 1, 1, 1, 1,
0.9758263, -0.3474227, 2.379484, 1, 1, 1, 1, 1,
0.9768103, -0.4634877, 1.549088, 1, 1, 1, 1, 1,
0.9775181, -1.086516, 1.595077, 1, 1, 1, 1, 1,
0.9776928, 0.00578903, 0.4047301, 1, 1, 1, 1, 1,
0.9786123, -0.3325768, 1.016143, 1, 1, 1, 1, 1,
0.9788215, 0.9498818, 0.727735, 1, 1, 1, 1, 1,
0.9794617, -0.7376693, 3.689906, 1, 1, 1, 1, 1,
0.9839787, 0.005395357, 2.441168, 1, 1, 1, 1, 1,
0.9843089, 0.8731335, 2.118436, 1, 1, 1, 1, 1,
0.9903532, -2.366261, 3.612876, 1, 1, 1, 1, 1,
0.9966753, 2.196893, 0.2772886, 1, 1, 1, 1, 1,
0.998902, 0.8054793, 0.1357044, 1, 1, 1, 1, 1,
0.9997334, -0.1226926, 2.570876, 0, 0, 1, 1, 1,
1.002821, -0.7924172, 1.460195, 1, 0, 0, 1, 1,
1.003153, 1.427148, 0.9430642, 1, 0, 0, 1, 1,
1.005662, -1.856835, 5.041303, 1, 0, 0, 1, 1,
1.008244, -0.2747193, 1.289703, 1, 0, 0, 1, 1,
1.00857, 0.2449905, -0.1224168, 1, 0, 0, 1, 1,
1.01084, 0.4516407, 0.4835544, 0, 0, 0, 1, 1,
1.014753, -0.307436, 2.037311, 0, 0, 0, 1, 1,
1.019052, 0.2525997, 2.263123, 0, 0, 0, 1, 1,
1.024317, -0.3137731, 1.065061, 0, 0, 0, 1, 1,
1.024911, -0.5115551, -0.4160736, 0, 0, 0, 1, 1,
1.026645, 2.336071, -0.5323124, 0, 0, 0, 1, 1,
1.030333, 0.3313985, 1.466847, 0, 0, 0, 1, 1,
1.03491, -1.159185, 0.5889131, 1, 1, 1, 1, 1,
1.042674, -0.07117632, 1.289119, 1, 1, 1, 1, 1,
1.048024, -0.7724904, 1.473894, 1, 1, 1, 1, 1,
1.049828, -0.3671062, 2.240295, 1, 1, 1, 1, 1,
1.051364, 0.6809467, 1.351711, 1, 1, 1, 1, 1,
1.058907, -1.028841, 2.912735, 1, 1, 1, 1, 1,
1.067902, 0.1602608, 1.418752, 1, 1, 1, 1, 1,
1.068158, -1.984609, 2.786009, 1, 1, 1, 1, 1,
1.06902, 0.5896287, 1.623324, 1, 1, 1, 1, 1,
1.071073, 0.9372322, 0.4147345, 1, 1, 1, 1, 1,
1.072892, -0.1696388, 1.444199, 1, 1, 1, 1, 1,
1.07668, -0.3764075, 1.885525, 1, 1, 1, 1, 1,
1.081708, -1.446649, 0.2127588, 1, 1, 1, 1, 1,
1.084373, -0.2010856, 2.241178, 1, 1, 1, 1, 1,
1.085166, -0.6615434, 1.478186, 1, 1, 1, 1, 1,
1.086136, -0.04576208, 0.05500113, 0, 0, 1, 1, 1,
1.088766, 0.7707456, 1.309431, 1, 0, 0, 1, 1,
1.090249, 0.2842514, 1.022465, 1, 0, 0, 1, 1,
1.09561, 0.7806482, 1.044829, 1, 0, 0, 1, 1,
1.098137, 1.201649, 0.1133233, 1, 0, 0, 1, 1,
1.09841, 0.3876207, 2.305451, 1, 0, 0, 1, 1,
1.114319, -0.1441253, 2.582559, 0, 0, 0, 1, 1,
1.115257, 0.484895, 1.199287, 0, 0, 0, 1, 1,
1.117164, -1.41127, 1.933271, 0, 0, 0, 1, 1,
1.133494, -0.8027444, 1.753975, 0, 0, 0, 1, 1,
1.133617, 1.012947, 0.2087869, 0, 0, 0, 1, 1,
1.141855, -0.4967211, 1.760439, 0, 0, 0, 1, 1,
1.145487, -1.000915, 1.824425, 0, 0, 0, 1, 1,
1.146637, -0.4066281, 1.243954, 1, 1, 1, 1, 1,
1.147286, 0.5569944, 1.124695, 1, 1, 1, 1, 1,
1.151995, -0.4588272, 3.753233, 1, 1, 1, 1, 1,
1.152502, -1.145751, 2.500581, 1, 1, 1, 1, 1,
1.153055, -0.4813575, 2.018882, 1, 1, 1, 1, 1,
1.165903, -0.3624759, 2.693095, 1, 1, 1, 1, 1,
1.169301, 0.6544619, 0.8519717, 1, 1, 1, 1, 1,
1.17729, -2.218234, 3.445651, 1, 1, 1, 1, 1,
1.18014, 0.5624311, 0.6537348, 1, 1, 1, 1, 1,
1.181684, 0.8110384, 2.547968, 1, 1, 1, 1, 1,
1.183156, 1.825566, 0.5069018, 1, 1, 1, 1, 1,
1.186008, -1.266299, 2.883718, 1, 1, 1, 1, 1,
1.186641, 1.720316, 1.870152, 1, 1, 1, 1, 1,
1.194627, -0.496998, 3.9024, 1, 1, 1, 1, 1,
1.200709, 1.063944, 0.8031776, 1, 1, 1, 1, 1,
1.206765, 0.5620697, 2.757798, 0, 0, 1, 1, 1,
1.210118, 0.3549827, 1.197834, 1, 0, 0, 1, 1,
1.210374, 0.6343464, 0.7157612, 1, 0, 0, 1, 1,
1.216129, 0.9223201, 2.527897, 1, 0, 0, 1, 1,
1.221049, 1.424025, -0.2464621, 1, 0, 0, 1, 1,
1.22415, 0.4764847, -1.313433, 1, 0, 0, 1, 1,
1.229092, -0.7805203, 2.638353, 0, 0, 0, 1, 1,
1.232921, 0.06263761, 0.9520279, 0, 0, 0, 1, 1,
1.233111, 0.06047512, 3.008161, 0, 0, 0, 1, 1,
1.236887, -0.5075848, 1.498706, 0, 0, 0, 1, 1,
1.238542, -0.9774937, 0.9607896, 0, 0, 0, 1, 1,
1.240682, -1.1067, 2.137775, 0, 0, 0, 1, 1,
1.24331, 0.220056, 1.634465, 0, 0, 0, 1, 1,
1.251272, 1.183189, -0.5885372, 1, 1, 1, 1, 1,
1.260182, 3.573401, 0.2893532, 1, 1, 1, 1, 1,
1.269704, 0.8916476, 1.428824, 1, 1, 1, 1, 1,
1.271635, 0.00981089, 3.030649, 1, 1, 1, 1, 1,
1.276461, 0.9585943, 2.865927, 1, 1, 1, 1, 1,
1.280736, -0.3228889, 2.020927, 1, 1, 1, 1, 1,
1.290402, 1.420431, 2.336178, 1, 1, 1, 1, 1,
1.294449, -1.322683, 0.8162372, 1, 1, 1, 1, 1,
1.306102, -0.3522231, 2.400836, 1, 1, 1, 1, 1,
1.308107, 2.671882, 1.414949, 1, 1, 1, 1, 1,
1.31206, -0.8765814, 2.774585, 1, 1, 1, 1, 1,
1.322826, 0.6660845, -0.06988979, 1, 1, 1, 1, 1,
1.330524, 0.5849304, 1.270039, 1, 1, 1, 1, 1,
1.331423, -0.7720895, 1.449829, 1, 1, 1, 1, 1,
1.331661, -0.4195596, 0.7940276, 1, 1, 1, 1, 1,
1.336181, -1.637578, 2.356592, 0, 0, 1, 1, 1,
1.337354, 1.510392, 1.466904, 1, 0, 0, 1, 1,
1.343975, 0.9090436, -0.6923925, 1, 0, 0, 1, 1,
1.354294, -0.7092665, 3.633193, 1, 0, 0, 1, 1,
1.363652, -0.03124352, 1.519729, 1, 0, 0, 1, 1,
1.378498, 1.677427, 0.1144745, 1, 0, 0, 1, 1,
1.383053, -0.1889995, 0.7021675, 0, 0, 0, 1, 1,
1.386814, -1.119298, 3.405315, 0, 0, 0, 1, 1,
1.390136, 0.8803254, 0.928026, 0, 0, 0, 1, 1,
1.392252, -0.005365758, 1.362293, 0, 0, 0, 1, 1,
1.393286, 0.2137479, 0.7971935, 0, 0, 0, 1, 1,
1.400366, 0.4228854, 2.447966, 0, 0, 0, 1, 1,
1.40094, -0.5620039, 0.2637476, 0, 0, 0, 1, 1,
1.408608, 1.908777, 0.2366656, 1, 1, 1, 1, 1,
1.412676, 0.81649, 0.5443323, 1, 1, 1, 1, 1,
1.415276, 0.1490682, 0.7001562, 1, 1, 1, 1, 1,
1.421948, -0.2491406, 1.077272, 1, 1, 1, 1, 1,
1.425166, -0.7991267, 2.23695, 1, 1, 1, 1, 1,
1.426379, -1.061941, 2.487933, 1, 1, 1, 1, 1,
1.434957, -1.090791, 2.468983, 1, 1, 1, 1, 1,
1.436982, -0.1320126, 2.466879, 1, 1, 1, 1, 1,
1.442702, -0.248256, 0.4786615, 1, 1, 1, 1, 1,
1.445894, -0.364138, 2.00147, 1, 1, 1, 1, 1,
1.45022, -0.2886987, 0.3750508, 1, 1, 1, 1, 1,
1.47404, -0.4128229, 2.410525, 1, 1, 1, 1, 1,
1.475691, -0.9872139, 1.26972, 1, 1, 1, 1, 1,
1.477166, 0.08328341, 3.112878, 1, 1, 1, 1, 1,
1.478731, -0.3127739, 2.877619, 1, 1, 1, 1, 1,
1.487204, -0.7853087, 0.30374, 0, 0, 1, 1, 1,
1.489153, -0.3429637, 0.9698064, 1, 0, 0, 1, 1,
1.492459, -0.3510075, 3.258678, 1, 0, 0, 1, 1,
1.49291, 0.7683364, 1.580423, 1, 0, 0, 1, 1,
1.496867, 0.7270655, 2.655978, 1, 0, 0, 1, 1,
1.499294, -0.9825247, 3.001055, 1, 0, 0, 1, 1,
1.515771, -0.8165298, 2.441642, 0, 0, 0, 1, 1,
1.51683, 0.7254238, 0.008673165, 0, 0, 0, 1, 1,
1.520702, -0.08043748, 1.796188, 0, 0, 0, 1, 1,
1.527819, -0.9141702, 2.647747, 0, 0, 0, 1, 1,
1.530691, 1.766627, -1.143006, 0, 0, 0, 1, 1,
1.537243, -1.319129, 3.121612, 0, 0, 0, 1, 1,
1.546768, -0.3743558, 2.368882, 0, 0, 0, 1, 1,
1.556468, -0.8554122, 0.7849641, 1, 1, 1, 1, 1,
1.557665, 0.809939, 0.5981595, 1, 1, 1, 1, 1,
1.579713, -0.6334997, 3.068016, 1, 1, 1, 1, 1,
1.579796, -0.6034553, 2.259328, 1, 1, 1, 1, 1,
1.592091, 0.03325736, 3.219744, 1, 1, 1, 1, 1,
1.592824, 0.01765122, 1.836959, 1, 1, 1, 1, 1,
1.595681, -0.05319146, 2.276729, 1, 1, 1, 1, 1,
1.596455, -1.148924, 3.562508, 1, 1, 1, 1, 1,
1.611883, 0.7460233, 0.9525324, 1, 1, 1, 1, 1,
1.627328, -1.657306, 2.160276, 1, 1, 1, 1, 1,
1.62944, 0.1516631, 1.592151, 1, 1, 1, 1, 1,
1.632031, 0.2332376, 2.072428, 1, 1, 1, 1, 1,
1.637053, 0.9808729, -1.231424, 1, 1, 1, 1, 1,
1.656872, -0.1672881, 0.1727181, 1, 1, 1, 1, 1,
1.678841, 0.5878365, -0.1455857, 1, 1, 1, 1, 1,
1.681672, 0.8491287, 1.450572, 0, 0, 1, 1, 1,
1.695095, -0.02747238, 0.5106924, 1, 0, 0, 1, 1,
1.723494, 0.9199919, 1.644794, 1, 0, 0, 1, 1,
1.726582, -2.358273, 2.704832, 1, 0, 0, 1, 1,
1.748019, -0.05411372, 1.962062, 1, 0, 0, 1, 1,
1.758415, -0.5686219, 0.6308759, 1, 0, 0, 1, 1,
1.7794, 0.6768021, 0.9106213, 0, 0, 0, 1, 1,
1.798596, 0.91036, 0.1048279, 0, 0, 0, 1, 1,
1.800922, -0.7414617, 1.092296, 0, 0, 0, 1, 1,
1.802143, -0.568243, 3.960621, 0, 0, 0, 1, 1,
1.821742, 0.1690602, 3.570518, 0, 0, 0, 1, 1,
1.846672, -0.1906086, 1.402451, 0, 0, 0, 1, 1,
1.847067, -0.3401601, 1.341811, 0, 0, 0, 1, 1,
1.853989, -0.6444408, 2.55556, 1, 1, 1, 1, 1,
1.8672, 2.408985, 0.8966079, 1, 1, 1, 1, 1,
1.885739, -0.03453631, 2.222605, 1, 1, 1, 1, 1,
1.890275, -1.10445, 3.405032, 1, 1, 1, 1, 1,
1.896667, 0.6143221, 2.211405, 1, 1, 1, 1, 1,
1.945333, 0.9861037, 1.917907, 1, 1, 1, 1, 1,
1.952187, 1.259559, 0.9784082, 1, 1, 1, 1, 1,
1.964079, 1.786234, 0.2193437, 1, 1, 1, 1, 1,
2.001382, -0.5630612, 2.818924, 1, 1, 1, 1, 1,
2.002316, -0.6062026, 1.93226, 1, 1, 1, 1, 1,
2.011722, -0.4389767, 0.4378116, 1, 1, 1, 1, 1,
2.014927, -0.2610606, 0.80898, 1, 1, 1, 1, 1,
2.046877, -0.08146451, 2.203784, 1, 1, 1, 1, 1,
2.058882, -1.950266, 3.201266, 1, 1, 1, 1, 1,
2.100324, -0.4164685, 2.035154, 1, 1, 1, 1, 1,
2.100326, 0.8402573, -0.8048307, 0, 0, 1, 1, 1,
2.101682, -0.7621029, 1.283261, 1, 0, 0, 1, 1,
2.111311, 0.5811193, 1.053515, 1, 0, 0, 1, 1,
2.132711, 0.2942646, 1.517516, 1, 0, 0, 1, 1,
2.160324, 2.244177, 2.167934, 1, 0, 0, 1, 1,
2.184697, 0.413424, 1.442309, 1, 0, 0, 1, 1,
2.205542, 0.9924858, 0.9775916, 0, 0, 0, 1, 1,
2.212765, -1.093008, 0.7860696, 0, 0, 0, 1, 1,
2.264265, 1.476892, 1.272623, 0, 0, 0, 1, 1,
2.282954, -1.599357, 2.696639, 0, 0, 0, 1, 1,
2.290261, 0.3774494, 1.892977, 0, 0, 0, 1, 1,
2.492908, -0.60143, -0.334182, 0, 0, 0, 1, 1,
2.502071, 1.411555, 2.136701, 0, 0, 0, 1, 1,
2.589315, -0.1127113, 1.871833, 1, 1, 1, 1, 1,
2.658797, -1.885014, 1.822093, 1, 1, 1, 1, 1,
2.660824, 0.6675203, 1.970382, 1, 1, 1, 1, 1,
2.719582, 1.668412, -0.1892328, 1, 1, 1, 1, 1,
2.777819, -1.181736, 2.834656, 1, 1, 1, 1, 1,
3.619305, 0.9333124, 1.24807, 1, 1, 1, 1, 1,
4.349744, -0.5712631, 1.647085, 1, 1, 1, 1, 1
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
var radius = 9.975332;
var distance = 35.03793;
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
mvMatrix.translate( -0.715883, 0.09616733, 0.2004809 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.03793);
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
