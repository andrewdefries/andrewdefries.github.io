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
-2.865797, -0.017406, -1.068423, 1, 0, 0, 1,
-2.625901, 0.7559413, -1.367501, 1, 0.007843138, 0, 1,
-2.492914, 0.8682913, -0.4064591, 1, 0.01176471, 0, 1,
-2.368119, -1.312281, -1.765626, 1, 0.01960784, 0, 1,
-2.355655, -0.8216311, -2.906163, 1, 0.02352941, 0, 1,
-2.345667, 0.05603992, -2.023603, 1, 0.03137255, 0, 1,
-2.322803, 0.4044441, -1.143985, 1, 0.03529412, 0, 1,
-2.254725, -0.5348302, -2.961768, 1, 0.04313726, 0, 1,
-2.223166, 0.1604997, -0.4951844, 1, 0.04705882, 0, 1,
-2.178996, 0.6634906, -0.2999389, 1, 0.05490196, 0, 1,
-2.157228, 1.78612, 0.4920177, 1, 0.05882353, 0, 1,
-2.155207, 0.1830758, -0.2419805, 1, 0.06666667, 0, 1,
-2.123797, 1.21931, -1.460121, 1, 0.07058824, 0, 1,
-2.107207, 1.070221, -0.1130825, 1, 0.07843138, 0, 1,
-2.104624, 0.5578911, -3.245893, 1, 0.08235294, 0, 1,
-2.093224, -1.250526, -1.910731, 1, 0.09019608, 0, 1,
-2.05286, 0.6660627, 0.248497, 1, 0.09411765, 0, 1,
-2.041791, 0.5924281, -1.445897, 1, 0.1019608, 0, 1,
-2.018934, 1.489186, -1.513926, 1, 0.1098039, 0, 1,
-2.009841, -0.8771858, -2.525165, 1, 0.1137255, 0, 1,
-2.002663, -0.7848518, -2.402601, 1, 0.1215686, 0, 1,
-1.981733, 0.2607403, -0.4415946, 1, 0.1254902, 0, 1,
-1.97435, -1.732615, -3.171855, 1, 0.1333333, 0, 1,
-1.971871, -0.2585395, -0.4346188, 1, 0.1372549, 0, 1,
-1.939364, -0.4114146, -2.298357, 1, 0.145098, 0, 1,
-1.919236, 2.049447, -1.292056, 1, 0.1490196, 0, 1,
-1.894951, -0.2404466, -1.281672, 1, 0.1568628, 0, 1,
-1.877758, -0.1040634, -2.714713, 1, 0.1607843, 0, 1,
-1.867903, 0.9944057, -2.232506, 1, 0.1686275, 0, 1,
-1.852528, -0.8214521, -2.59994, 1, 0.172549, 0, 1,
-1.848944, 0.9291992, -1.519631, 1, 0.1803922, 0, 1,
-1.832947, 0.223962, -2.017403, 1, 0.1843137, 0, 1,
-1.828817, 0.4145301, -1.926504, 1, 0.1921569, 0, 1,
-1.828061, -0.2763167, -0.6990525, 1, 0.1960784, 0, 1,
-1.825856, -0.3306161, -1.96723, 1, 0.2039216, 0, 1,
-1.822808, -0.6026586, -2.910902, 1, 0.2117647, 0, 1,
-1.812956, 0.5374144, -1.336019, 1, 0.2156863, 0, 1,
-1.806374, -2.652746, -3.692371, 1, 0.2235294, 0, 1,
-1.793029, 2.038436, -0.9782194, 1, 0.227451, 0, 1,
-1.787134, 0.7881033, -1.824187, 1, 0.2352941, 0, 1,
-1.77345, 0.7303462, -2.138283, 1, 0.2392157, 0, 1,
-1.763442, 2.144149, -0.5331899, 1, 0.2470588, 0, 1,
-1.761746, 0.2584136, -3.638814, 1, 0.2509804, 0, 1,
-1.745389, -1.663061, -3.477127, 1, 0.2588235, 0, 1,
-1.743774, 0.2110545, 0.9902359, 1, 0.2627451, 0, 1,
-1.729183, 0.5642956, -1.675084, 1, 0.2705882, 0, 1,
-1.716584, -2.115901, -2.103819, 1, 0.2745098, 0, 1,
-1.707472, 0.05151519, -2.407819, 1, 0.282353, 0, 1,
-1.686089, 0.1513649, -0.7383933, 1, 0.2862745, 0, 1,
-1.66927, -0.6712016, -1.829585, 1, 0.2941177, 0, 1,
-1.60355, -0.1465547, -1.89536, 1, 0.3019608, 0, 1,
-1.602899, 0.827639, -0.7543872, 1, 0.3058824, 0, 1,
-1.595571, -0.4192662, -1.196783, 1, 0.3137255, 0, 1,
-1.588121, 0.5947965, -1.988884, 1, 0.3176471, 0, 1,
-1.581174, -0.3284338, -1.972531, 1, 0.3254902, 0, 1,
-1.577461, 1.673409, -0.9700432, 1, 0.3294118, 0, 1,
-1.55928, -0.2680526, -1.088232, 1, 0.3372549, 0, 1,
-1.542789, -0.9094159, 0.06667702, 1, 0.3411765, 0, 1,
-1.526265, 0.3802263, -2.629076, 1, 0.3490196, 0, 1,
-1.525613, -0.111226, -2.291918, 1, 0.3529412, 0, 1,
-1.49695, 0.002184099, -1.912137, 1, 0.3607843, 0, 1,
-1.484694, -0.5106637, -1.939492, 1, 0.3647059, 0, 1,
-1.476791, -0.06024469, -1.333891, 1, 0.372549, 0, 1,
-1.471109, 1.408768, -1.318925, 1, 0.3764706, 0, 1,
-1.470999, 0.1406181, -2.182916, 1, 0.3843137, 0, 1,
-1.468827, 1.765438, -0.5645868, 1, 0.3882353, 0, 1,
-1.464654, -0.6622922, -1.719348, 1, 0.3960784, 0, 1,
-1.458987, 0.4734945, -0.6686482, 1, 0.4039216, 0, 1,
-1.457303, -0.5173371, -0.9151341, 1, 0.4078431, 0, 1,
-1.445529, -0.1931508, -1.478882, 1, 0.4156863, 0, 1,
-1.444698, 1.23127, -1.827056, 1, 0.4196078, 0, 1,
-1.443953, -0.1789448, -1.765465, 1, 0.427451, 0, 1,
-1.442834, -0.5498357, -3.39534, 1, 0.4313726, 0, 1,
-1.440185, 0.3294123, -1.11719, 1, 0.4392157, 0, 1,
-1.438357, -1.837508, -1.605198, 1, 0.4431373, 0, 1,
-1.438082, 0.1475447, -2.658874, 1, 0.4509804, 0, 1,
-1.437878, -0.5839823, -2.677109, 1, 0.454902, 0, 1,
-1.433914, 0.4880069, -3.326944, 1, 0.4627451, 0, 1,
-1.421686, -1.056099, -3.573497, 1, 0.4666667, 0, 1,
-1.407987, -0.3437726, -0.5152791, 1, 0.4745098, 0, 1,
-1.397744, 1.091338, -0.4353619, 1, 0.4784314, 0, 1,
-1.391731, -0.6031651, -3.04969, 1, 0.4862745, 0, 1,
-1.391091, 0.2064655, -2.628442, 1, 0.4901961, 0, 1,
-1.388492, -0.8556119, -2.982772, 1, 0.4980392, 0, 1,
-1.384886, -0.7848334, -2.562311, 1, 0.5058824, 0, 1,
-1.372666, -1.0234, -2.61454, 1, 0.509804, 0, 1,
-1.372105, 1.208445, -1.721955, 1, 0.5176471, 0, 1,
-1.370557, -0.3282057, -1.49144, 1, 0.5215687, 0, 1,
-1.354689, -1.583282, -1.473325, 1, 0.5294118, 0, 1,
-1.349909, 0.3798811, -1.342178, 1, 0.5333334, 0, 1,
-1.349295, 0.9305059, -0.362414, 1, 0.5411765, 0, 1,
-1.344203, 0.8782402, 1.014642, 1, 0.5450981, 0, 1,
-1.341923, -0.0937883, -0.5088589, 1, 0.5529412, 0, 1,
-1.34107, 0.1169951, -2.166281, 1, 0.5568628, 0, 1,
-1.330305, 0.0177487, -2.222839, 1, 0.5647059, 0, 1,
-1.321229, 0.00655919, -0.9073035, 1, 0.5686275, 0, 1,
-1.315706, -0.1850459, -0.6095231, 1, 0.5764706, 0, 1,
-1.31302, -1.079534, -0.8662282, 1, 0.5803922, 0, 1,
-1.312334, 0.1945596, -2.734198, 1, 0.5882353, 0, 1,
-1.301882, -0.2589244, -0.7749804, 1, 0.5921569, 0, 1,
-1.298125, 2.237517, -1.494912, 1, 0.6, 0, 1,
-1.288744, 1.412198, -1.959363, 1, 0.6078432, 0, 1,
-1.28804, -0.1714777, -1.009539, 1, 0.6117647, 0, 1,
-1.278164, -1.622259, -2.40743, 1, 0.6196079, 0, 1,
-1.273201, 0.1242065, 1.688952, 1, 0.6235294, 0, 1,
-1.271679, -0.6559767, -1.449299, 1, 0.6313726, 0, 1,
-1.256549, -1.322573, -2.579546, 1, 0.6352941, 0, 1,
-1.250613, 0.1748046, -1.999432, 1, 0.6431373, 0, 1,
-1.228028, -1.345023, -3.131446, 1, 0.6470588, 0, 1,
-1.218782, -0.1481766, -2.824167, 1, 0.654902, 0, 1,
-1.197539, 1.962692, 2.214376, 1, 0.6588235, 0, 1,
-1.196178, -3.161788, -1.679494, 1, 0.6666667, 0, 1,
-1.187381, 0.9094193, -0.3505073, 1, 0.6705883, 0, 1,
-1.181767, 0.6613882, -0.2408816, 1, 0.6784314, 0, 1,
-1.178366, 0.1260962, -1.505616, 1, 0.682353, 0, 1,
-1.167917, 1.030026, -1.057097, 1, 0.6901961, 0, 1,
-1.163108, 0.5342981, -0.2560821, 1, 0.6941177, 0, 1,
-1.156286, -1.591129, -2.662884, 1, 0.7019608, 0, 1,
-1.154348, -0.0864251, -1.695304, 1, 0.7098039, 0, 1,
-1.150312, -1.603558, -3.264073, 1, 0.7137255, 0, 1,
-1.143566, -0.450252, -3.201564, 1, 0.7215686, 0, 1,
-1.139241, 0.06044837, -1.206107, 1, 0.7254902, 0, 1,
-1.132714, 0.2029239, -2.668262, 1, 0.7333333, 0, 1,
-1.131068, 1.805007, -0.3563594, 1, 0.7372549, 0, 1,
-1.129501, -0.128213, -2.104853, 1, 0.7450981, 0, 1,
-1.128751, 0.1712397, -1.933942, 1, 0.7490196, 0, 1,
-1.119961, 0.7562899, -0.6745717, 1, 0.7568628, 0, 1,
-1.11631, -1.343467, -1.227123, 1, 0.7607843, 0, 1,
-1.109296, -1.637514, -1.674753, 1, 0.7686275, 0, 1,
-1.100715, 0.8075916, -0.9004732, 1, 0.772549, 0, 1,
-1.085116, -0.7558908, -2.327391, 1, 0.7803922, 0, 1,
-1.081326, -0.6007677, -2.146006, 1, 0.7843137, 0, 1,
-1.075864, -1.444754, -2.014945, 1, 0.7921569, 0, 1,
-1.074751, -2.258678, -1.253219, 1, 0.7960784, 0, 1,
-1.069052, -0.3621671, -0.3625335, 1, 0.8039216, 0, 1,
-1.067865, 0.9806013, -1.071092, 1, 0.8117647, 0, 1,
-1.065773, 0.8624396, -1.169289, 1, 0.8156863, 0, 1,
-1.063135, -1.211797, -2.225094, 1, 0.8235294, 0, 1,
-1.062769, 0.2491429, -0.7348654, 1, 0.827451, 0, 1,
-1.060807, -0.7606049, -2.971393, 1, 0.8352941, 0, 1,
-1.054954, 0.9910949, 0.4395041, 1, 0.8392157, 0, 1,
-1.053931, -1.075002, -1.623248, 1, 0.8470588, 0, 1,
-1.053281, -0.1466654, -0.6219243, 1, 0.8509804, 0, 1,
-1.05113, 1.755907, -0.7718052, 1, 0.8588235, 0, 1,
-1.046888, 0.5309101, -0.006225329, 1, 0.8627451, 0, 1,
-1.045723, -0.02656996, -1.729321, 1, 0.8705882, 0, 1,
-1.037293, -0.8205335, -3.051318, 1, 0.8745098, 0, 1,
-1.033235, -1.813741, -5.189651, 1, 0.8823529, 0, 1,
-1.032627, 2.731512, -0.9370549, 1, 0.8862745, 0, 1,
-1.030424, 0.4891765, 1.357937, 1, 0.8941177, 0, 1,
-1.020096, 0.6072062, -1.384631, 1, 0.8980392, 0, 1,
-1.018891, -0.2521038, -4.053882, 1, 0.9058824, 0, 1,
-1.018456, -2.860579, -1.875815, 1, 0.9137255, 0, 1,
-1.016944, 0.3777935, -1.736097, 1, 0.9176471, 0, 1,
-1.015018, 0.7695879, 0.302309, 1, 0.9254902, 0, 1,
-1.011822, 1.481515, 1.186422, 1, 0.9294118, 0, 1,
-1.007039, 0.720396, -0.3409741, 1, 0.9372549, 0, 1,
-1.007003, 0.7207311, -1.130306, 1, 0.9411765, 0, 1,
-1.006148, 0.194397, -2.26333, 1, 0.9490196, 0, 1,
-0.9979805, -0.5701826, -2.075153, 1, 0.9529412, 0, 1,
-0.9973038, 0.1549041, -0.3748318, 1, 0.9607843, 0, 1,
-0.9963106, -0.2366282, -4.198036, 1, 0.9647059, 0, 1,
-0.9958809, 0.3068266, -3.017446, 1, 0.972549, 0, 1,
-0.9955706, -0.5110657, -1.912355, 1, 0.9764706, 0, 1,
-0.9912083, 0.7674685, -0.9539484, 1, 0.9843137, 0, 1,
-0.9880802, 0.5764291, -1.824988, 1, 0.9882353, 0, 1,
-0.9865423, 0.9560747, -2.973481, 1, 0.9960784, 0, 1,
-0.9817215, -0.003039043, -3.110064, 0.9960784, 1, 0, 1,
-0.9803346, 0.6695024, -0.5391994, 0.9921569, 1, 0, 1,
-0.9797351, -0.8705031, -0.4783579, 0.9843137, 1, 0, 1,
-0.9670057, -0.8098402, -2.766213, 0.9803922, 1, 0, 1,
-0.9657059, 0.6147531, -0.02601598, 0.972549, 1, 0, 1,
-0.9640164, -0.7890631, -3.169631, 0.9686275, 1, 0, 1,
-0.9519333, -0.454017, -1.438514, 0.9607843, 1, 0, 1,
-0.9502512, 0.3666726, -1.690073, 0.9568627, 1, 0, 1,
-0.9433269, 0.4807922, -0.1984348, 0.9490196, 1, 0, 1,
-0.9412526, -0.6736596, -1.747724, 0.945098, 1, 0, 1,
-0.939806, 0.1621423, -1.67648, 0.9372549, 1, 0, 1,
-0.9216825, 1.313428, 0.3510916, 0.9333333, 1, 0, 1,
-0.9166197, 0.6477463, -0.1856028, 0.9254902, 1, 0, 1,
-0.9149553, 0.1247296, -1.538409, 0.9215686, 1, 0, 1,
-0.9085953, -0.6741685, -3.097702, 0.9137255, 1, 0, 1,
-0.9067367, 0.5802794, 0.1901816, 0.9098039, 1, 0, 1,
-0.9066985, 1.041752, -2.019017, 0.9019608, 1, 0, 1,
-0.9017889, 0.5386519, -0.5983946, 0.8941177, 1, 0, 1,
-0.9017776, -0.6409925, -2.104467, 0.8901961, 1, 0, 1,
-0.8947747, -0.4068076, -1.607921, 0.8823529, 1, 0, 1,
-0.8938572, 0.4426159, -1.289707, 0.8784314, 1, 0, 1,
-0.8938299, 0.6738193, -2.311162, 0.8705882, 1, 0, 1,
-0.8904013, -2.651682, -3.252444, 0.8666667, 1, 0, 1,
-0.8891684, 0.3579104, -2.381489, 0.8588235, 1, 0, 1,
-0.8873844, 0.3004352, -0.5771478, 0.854902, 1, 0, 1,
-0.8816898, -0.6442941, -1.521791, 0.8470588, 1, 0, 1,
-0.8761155, 0.4111176, -0.5334057, 0.8431373, 1, 0, 1,
-0.8671169, 0.9414592, -0.3923144, 0.8352941, 1, 0, 1,
-0.8647226, 0.565547, 0.08756506, 0.8313726, 1, 0, 1,
-0.8583288, -0.126737, -0.9447381, 0.8235294, 1, 0, 1,
-0.8525161, 1.676774, -1.490455, 0.8196079, 1, 0, 1,
-0.8514292, 1.527262, -0.529974, 0.8117647, 1, 0, 1,
-0.8450289, -1.009507, -3.246979, 0.8078431, 1, 0, 1,
-0.8435593, 1.149995, 0.3169148, 0.8, 1, 0, 1,
-0.8381163, 0.531467, -1.879301, 0.7921569, 1, 0, 1,
-0.8352628, 0.7459578, -0.5507005, 0.7882353, 1, 0, 1,
-0.8288696, -0.3992316, -3.408825, 0.7803922, 1, 0, 1,
-0.823374, 0.2029263, -1.854239, 0.7764706, 1, 0, 1,
-0.8146587, 1.177128, -0.1818043, 0.7686275, 1, 0, 1,
-0.81246, 1.12817, 1.030621, 0.7647059, 1, 0, 1,
-0.8106955, -1.000096, -0.5105477, 0.7568628, 1, 0, 1,
-0.8104532, -0.2750737, -3.132776, 0.7529412, 1, 0, 1,
-0.8030067, 0.297307, -1.082794, 0.7450981, 1, 0, 1,
-0.7966557, 0.28104, -1.706045, 0.7411765, 1, 0, 1,
-0.7902346, 0.9143791, 0.06466204, 0.7333333, 1, 0, 1,
-0.7882926, 0.412404, -3.411591, 0.7294118, 1, 0, 1,
-0.7851372, 0.288848, -2.954483, 0.7215686, 1, 0, 1,
-0.7850113, -0.5263816, -2.075037, 0.7176471, 1, 0, 1,
-0.7780022, -0.4499624, -1.471803, 0.7098039, 1, 0, 1,
-0.7758709, -0.7541018, -3.731396, 0.7058824, 1, 0, 1,
-0.7705013, -0.3773782, -1.445088, 0.6980392, 1, 0, 1,
-0.766229, -0.4957618, -1.892148, 0.6901961, 1, 0, 1,
-0.764421, -0.8258842, -2.104281, 0.6862745, 1, 0, 1,
-0.7626118, 1.042211, -0.9435524, 0.6784314, 1, 0, 1,
-0.7582861, 1.225795, -0.2805962, 0.6745098, 1, 0, 1,
-0.7562681, -1.100376, -2.992015, 0.6666667, 1, 0, 1,
-0.7433223, -1.959325, -3.786812, 0.6627451, 1, 0, 1,
-0.7389637, -0.4390135, -2.591385, 0.654902, 1, 0, 1,
-0.7365401, -1.339345, -1.57458, 0.6509804, 1, 0, 1,
-0.7306969, 0.4857078, -0.3436872, 0.6431373, 1, 0, 1,
-0.7236, -0.2086309, -1.594294, 0.6392157, 1, 0, 1,
-0.7232646, 0.04719406, -2.893068, 0.6313726, 1, 0, 1,
-0.7196447, -0.2971894, -1.023149, 0.627451, 1, 0, 1,
-0.7123864, 0.2203232, -0.7571831, 0.6196079, 1, 0, 1,
-0.7123861, -0.1867927, -2.79702, 0.6156863, 1, 0, 1,
-0.7117861, 0.6374471, 0.3591056, 0.6078432, 1, 0, 1,
-0.7091631, -1.704486, -3.76323, 0.6039216, 1, 0, 1,
-0.704973, -0.8186185, -3.012044, 0.5960785, 1, 0, 1,
-0.702437, -0.3654847, -2.56715, 0.5882353, 1, 0, 1,
-0.7008642, -0.3836105, -2.086452, 0.5843138, 1, 0, 1,
-0.6992379, -0.1343418, -3.30939, 0.5764706, 1, 0, 1,
-0.6914145, -0.9237436, -1.865571, 0.572549, 1, 0, 1,
-0.6912109, 1.269576, 0.04247152, 0.5647059, 1, 0, 1,
-0.6897079, -0.3659612, -2.610615, 0.5607843, 1, 0, 1,
-0.6757807, 0.8176979, 0.1276884, 0.5529412, 1, 0, 1,
-0.6757143, 0.9921303, 0.1446475, 0.5490196, 1, 0, 1,
-0.6689597, -0.6256189, -3.495583, 0.5411765, 1, 0, 1,
-0.6613083, 1.140026, -0.7374313, 0.5372549, 1, 0, 1,
-0.6586216, -0.1537672, -2.578985, 0.5294118, 1, 0, 1,
-0.6535952, -0.1585625, -1.681954, 0.5254902, 1, 0, 1,
-0.6515, -0.2326031, -0.7300131, 0.5176471, 1, 0, 1,
-0.6495246, -0.6382169, -1.525625, 0.5137255, 1, 0, 1,
-0.6395255, -1.58235, -3.399419, 0.5058824, 1, 0, 1,
-0.6357341, 0.6485757, -0.439742, 0.5019608, 1, 0, 1,
-0.6349784, -0.2665415, -2.067717, 0.4941176, 1, 0, 1,
-0.633149, -0.9763508, -3.12933, 0.4862745, 1, 0, 1,
-0.6275299, -0.7278845, -2.049753, 0.4823529, 1, 0, 1,
-0.6171895, 0.548306, -2.035028, 0.4745098, 1, 0, 1,
-0.6166809, 0.3247626, -0.3306163, 0.4705882, 1, 0, 1,
-0.6160473, -1.767484, -4.012475, 0.4627451, 1, 0, 1,
-0.6159779, 0.2906673, -0.5243748, 0.4588235, 1, 0, 1,
-0.6154498, -2.039781, -2.46389, 0.4509804, 1, 0, 1,
-0.606465, -0.1978977, -1.95345, 0.4470588, 1, 0, 1,
-0.6002772, 0.5058885, 0.2076202, 0.4392157, 1, 0, 1,
-0.5841292, -0.8216799, -3.816982, 0.4352941, 1, 0, 1,
-0.5795951, -0.8999843, -3.386902, 0.427451, 1, 0, 1,
-0.5753632, 0.1926155, -1.441696, 0.4235294, 1, 0, 1,
-0.5752746, 1.098738, -0.6857584, 0.4156863, 1, 0, 1,
-0.570426, -2.185995, -2.563827, 0.4117647, 1, 0, 1,
-0.5698072, -0.6578212, -3.910912, 0.4039216, 1, 0, 1,
-0.5688735, -0.7687886, 0.2351168, 0.3960784, 1, 0, 1,
-0.5626761, -0.1018688, -1.217362, 0.3921569, 1, 0, 1,
-0.5621345, 1.039661, -1.803473, 0.3843137, 1, 0, 1,
-0.5618609, -2.202776, -3.233836, 0.3803922, 1, 0, 1,
-0.5566518, -1.27825, -4.092402, 0.372549, 1, 0, 1,
-0.5562297, -0.3482111, -1.202634, 0.3686275, 1, 0, 1,
-0.5525483, -0.8126451, -1.641997, 0.3607843, 1, 0, 1,
-0.5405473, -1.408269, -1.551505, 0.3568628, 1, 0, 1,
-0.5375504, 0.5098311, -0.8504479, 0.3490196, 1, 0, 1,
-0.5356199, 1.894186, -2.110281, 0.345098, 1, 0, 1,
-0.5354998, 0.1667628, -0.1500928, 0.3372549, 1, 0, 1,
-0.5353464, -0.2249511, -1.372267, 0.3333333, 1, 0, 1,
-0.5318534, 0.7711329, -1.53036, 0.3254902, 1, 0, 1,
-0.5308452, 0.7153659, -1.537516, 0.3215686, 1, 0, 1,
-0.5305104, 1.342328, -2.181075, 0.3137255, 1, 0, 1,
-0.5296005, -0.5146028, -2.494164, 0.3098039, 1, 0, 1,
-0.5290477, -0.4005742, -2.536091, 0.3019608, 1, 0, 1,
-0.517315, -0.6925308, -2.303791, 0.2941177, 1, 0, 1,
-0.5151663, 0.9150102, 0.3670664, 0.2901961, 1, 0, 1,
-0.5135087, 1.148265, -0.7003228, 0.282353, 1, 0, 1,
-0.5126069, 0.2468105, 0.01801982, 0.2784314, 1, 0, 1,
-0.5107299, 1.206968, -0.8983046, 0.2705882, 1, 0, 1,
-0.5097342, -0.3140262, -2.837687, 0.2666667, 1, 0, 1,
-0.5089172, -0.3145181, -2.956979, 0.2588235, 1, 0, 1,
-0.5055459, 0.1344832, -3.879825, 0.254902, 1, 0, 1,
-0.5031455, 0.2145082, -4.272377, 0.2470588, 1, 0, 1,
-0.5030623, -0.9961205, -2.884022, 0.2431373, 1, 0, 1,
-0.5019615, 0.2632641, -0.3482609, 0.2352941, 1, 0, 1,
-0.4991978, 1.018833, -1.044788, 0.2313726, 1, 0, 1,
-0.4953104, 0.9241491, 0.2983434, 0.2235294, 1, 0, 1,
-0.4933168, -0.3453402, -1.820039, 0.2196078, 1, 0, 1,
-0.4891494, -0.9146608, -3.285123, 0.2117647, 1, 0, 1,
-0.4850162, -0.8541507, -3.488017, 0.2078431, 1, 0, 1,
-0.4842128, -0.4516449, -3.587406, 0.2, 1, 0, 1,
-0.4837769, 0.3454549, -1.330138, 0.1921569, 1, 0, 1,
-0.4785562, -0.1528165, -1.632184, 0.1882353, 1, 0, 1,
-0.4764242, 0.5393654, -0.518055, 0.1803922, 1, 0, 1,
-0.4761533, 1.483468, 0.08575859, 0.1764706, 1, 0, 1,
-0.4746647, -0.1573995, -1.437991, 0.1686275, 1, 0, 1,
-0.4657364, 0.6638243, -2.161796, 0.1647059, 1, 0, 1,
-0.4655527, 0.4418578, -1.518403, 0.1568628, 1, 0, 1,
-0.4638232, -0.5163102, -2.420142, 0.1529412, 1, 0, 1,
-0.4614848, -0.1066227, -2.829136, 0.145098, 1, 0, 1,
-0.4562111, 0.1665495, -1.824962, 0.1411765, 1, 0, 1,
-0.4537306, 0.6950966, -3.221903, 0.1333333, 1, 0, 1,
-0.4439759, 1.603254, 0.9936873, 0.1294118, 1, 0, 1,
-0.4433502, -0.9302506, -3.368473, 0.1215686, 1, 0, 1,
-0.4418418, -1.920438, -2.707582, 0.1176471, 1, 0, 1,
-0.4395986, -0.5850531, -3.282612, 0.1098039, 1, 0, 1,
-0.4382224, -0.3272513, -1.362018, 0.1058824, 1, 0, 1,
-0.4375383, -0.421125, -3.511369, 0.09803922, 1, 0, 1,
-0.4371407, 0.6574505, -0.6982663, 0.09019608, 1, 0, 1,
-0.4337975, -0.2067135, -1.41964, 0.08627451, 1, 0, 1,
-0.4296465, -0.2787234, -2.082262, 0.07843138, 1, 0, 1,
-0.4282373, 0.3966458, -0.9012926, 0.07450981, 1, 0, 1,
-0.4255106, -0.1806754, 0.6066428, 0.06666667, 1, 0, 1,
-0.4193781, 0.4684184, -1.341447, 0.0627451, 1, 0, 1,
-0.4193203, 1.347405, -2.86632, 0.05490196, 1, 0, 1,
-0.4184757, 1.395193, -0.8397096, 0.05098039, 1, 0, 1,
-0.4183199, -0.5636785, -2.811578, 0.04313726, 1, 0, 1,
-0.4147662, 0.8091804, -1.461204, 0.03921569, 1, 0, 1,
-0.4131705, 0.5115992, -0.002907362, 0.03137255, 1, 0, 1,
-0.4123162, -0.1084799, -1.35597, 0.02745098, 1, 0, 1,
-0.4087293, 0.1167264, -1.934036, 0.01960784, 1, 0, 1,
-0.4037341, 0.6782745, -0.3139501, 0.01568628, 1, 0, 1,
-0.3987221, -0.7515679, -1.923347, 0.007843138, 1, 0, 1,
-0.3982082, -0.8186856, -2.60077, 0.003921569, 1, 0, 1,
-0.3870783, -0.2586847, -4.20974, 0, 1, 0.003921569, 1,
-0.386041, 0.4808535, -1.277256, 0, 1, 0.01176471, 1,
-0.382949, -2.303752, -3.161099, 0, 1, 0.01568628, 1,
-0.3800129, 0.9770853, -1.201003, 0, 1, 0.02352941, 1,
-0.378022, -0.06739083, -1.627068, 0, 1, 0.02745098, 1,
-0.3723377, -0.8110178, -4.31187, 0, 1, 0.03529412, 1,
-0.3701981, 2.293321, -1.037068, 0, 1, 0.03921569, 1,
-0.3689378, -0.6087272, 0.1622882, 0, 1, 0.04705882, 1,
-0.3686166, -0.8131386, -0.4692522, 0, 1, 0.05098039, 1,
-0.3672929, 1.050767, -0.4835215, 0, 1, 0.05882353, 1,
-0.3663637, -0.04477788, -1.86716, 0, 1, 0.0627451, 1,
-0.3657479, -1.236245, -1.646008, 0, 1, 0.07058824, 1,
-0.3600444, 0.6247585, -0.1755924, 0, 1, 0.07450981, 1,
-0.3543545, -0.350511, -2.569352, 0, 1, 0.08235294, 1,
-0.3523095, 0.1492383, -3.604238, 0, 1, 0.08627451, 1,
-0.3511635, 0.561222, -0.274529, 0, 1, 0.09411765, 1,
-0.3479804, -0.8855587, -3.128812, 0, 1, 0.1019608, 1,
-0.345539, 0.2139856, -2.077801, 0, 1, 0.1058824, 1,
-0.3449738, 1.397876, -0.9780026, 0, 1, 0.1137255, 1,
-0.3429812, -0.04599618, -3.888794, 0, 1, 0.1176471, 1,
-0.3422552, -1.411279, -1.861672, 0, 1, 0.1254902, 1,
-0.34126, -0.4108694, -3.008782, 0, 1, 0.1294118, 1,
-0.3405222, 0.7289162, -0.037764, 0, 1, 0.1372549, 1,
-0.3398136, -0.4131604, -2.023959, 0, 1, 0.1411765, 1,
-0.3389862, 0.8758109, -0.5008296, 0, 1, 0.1490196, 1,
-0.3381428, -0.3395892, -2.956444, 0, 1, 0.1529412, 1,
-0.3376729, -0.2340719, 0.2451205, 0, 1, 0.1607843, 1,
-0.3365218, -0.01135963, -1.865845, 0, 1, 0.1647059, 1,
-0.3348449, -0.3241642, -0.5665182, 0, 1, 0.172549, 1,
-0.329814, 0.4424987, 0.0927813, 0, 1, 0.1764706, 1,
-0.3294858, 0.2691719, -2.09632, 0, 1, 0.1843137, 1,
-0.3256411, -0.4293835, -2.288832, 0, 1, 0.1882353, 1,
-0.325256, -0.5187621, -2.329652, 0, 1, 0.1960784, 1,
-0.3214523, 0.81591, -0.1782295, 0, 1, 0.2039216, 1,
-0.3120308, 0.3534899, 0.002692932, 0, 1, 0.2078431, 1,
-0.3117815, -0.951752, -2.687578, 0, 1, 0.2156863, 1,
-0.3117521, -0.1408249, -0.7884781, 0, 1, 0.2196078, 1,
-0.308865, -0.5116088, -1.893009, 0, 1, 0.227451, 1,
-0.3087931, 1.373507, -1.371247, 0, 1, 0.2313726, 1,
-0.3078895, 1.09228, 1.01809, 0, 1, 0.2392157, 1,
-0.3075198, 0.767772, 0.1452368, 0, 1, 0.2431373, 1,
-0.3062142, 1.035507, 0.4237675, 0, 1, 0.2509804, 1,
-0.3032483, 1.571656, 0.8244374, 0, 1, 0.254902, 1,
-0.301506, 0.1644547, 1.776429, 0, 1, 0.2627451, 1,
-0.3005766, 0.9819095, -0.5806088, 0, 1, 0.2666667, 1,
-0.2964491, -0.8492019, -2.029423, 0, 1, 0.2745098, 1,
-0.2958051, -0.4028655, -1.058643, 0, 1, 0.2784314, 1,
-0.2954272, -0.05665766, -1.744292, 0, 1, 0.2862745, 1,
-0.2916014, -1.916301, -4.226411, 0, 1, 0.2901961, 1,
-0.2885568, 1.071583, -0.428221, 0, 1, 0.2980392, 1,
-0.2853055, 0.4925609, -0.5870025, 0, 1, 0.3058824, 1,
-0.2846773, -0.002988875, -1.233607, 0, 1, 0.3098039, 1,
-0.2793145, 0.2535473, -1.084341, 0, 1, 0.3176471, 1,
-0.2748102, 0.5520044, 0.4012127, 0, 1, 0.3215686, 1,
-0.2720448, -1.887423, -3.506543, 0, 1, 0.3294118, 1,
-0.2667923, 0.7439446, -1.411918, 0, 1, 0.3333333, 1,
-0.2666933, 2.414993, -0.4854249, 0, 1, 0.3411765, 1,
-0.2625571, 0.05884866, -0.7220158, 0, 1, 0.345098, 1,
-0.262232, 1.780647, 0.467418, 0, 1, 0.3529412, 1,
-0.261597, -0.4663384, -3.418783, 0, 1, 0.3568628, 1,
-0.2606758, -0.4284824, -1.217213, 0, 1, 0.3647059, 1,
-0.2561107, -1.084432, -4.200383, 0, 1, 0.3686275, 1,
-0.2535031, -0.2815909, -2.315216, 0, 1, 0.3764706, 1,
-0.251528, -2.653074, -2.51754, 0, 1, 0.3803922, 1,
-0.2463297, 0.558287, -2.553663, 0, 1, 0.3882353, 1,
-0.2444641, 1.56952, 0.4018388, 0, 1, 0.3921569, 1,
-0.2416005, 1.241584, 2.168299, 0, 1, 0.4, 1,
-0.2413784, -0.9686577, -2.878597, 0, 1, 0.4078431, 1,
-0.2402386, 0.9496594, -0.3135056, 0, 1, 0.4117647, 1,
-0.2387145, -0.4814307, -3.371321, 0, 1, 0.4196078, 1,
-0.2364714, 1.70414, -2.128502, 0, 1, 0.4235294, 1,
-0.232795, -0.7140917, -1.726438, 0, 1, 0.4313726, 1,
-0.2324468, 0.2817959, -0.6683344, 0, 1, 0.4352941, 1,
-0.2274469, 0.8049291, 0.2081406, 0, 1, 0.4431373, 1,
-0.2266228, -0.3585422, -2.762044, 0, 1, 0.4470588, 1,
-0.2246811, 1.391276, 1.357111, 0, 1, 0.454902, 1,
-0.2233677, -0.6967615, -0.5375204, 0, 1, 0.4588235, 1,
-0.21388, -0.5795872, -3.907838, 0, 1, 0.4666667, 1,
-0.2109589, -0.2049398, -2.070069, 0, 1, 0.4705882, 1,
-0.2078185, 1.155082, 0.5749091, 0, 1, 0.4784314, 1,
-0.2077093, -1.01092, -2.036791, 0, 1, 0.4823529, 1,
-0.2072884, 0.3289011, 0.2879291, 0, 1, 0.4901961, 1,
-0.206007, -0.2427218, -2.439581, 0, 1, 0.4941176, 1,
-0.2059083, -0.3331567, -3.373302, 0, 1, 0.5019608, 1,
-0.2027907, -0.9828047, -3.314462, 0, 1, 0.509804, 1,
-0.2027355, -0.452873, -3.897862, 0, 1, 0.5137255, 1,
-0.202142, 1.025277, -0.2968719, 0, 1, 0.5215687, 1,
-0.2012616, -0.8495381, -3.899796, 0, 1, 0.5254902, 1,
-0.1957129, -1.129957, -3.232525, 0, 1, 0.5333334, 1,
-0.1822663, -0.04824485, -2.075612, 0, 1, 0.5372549, 1,
-0.1817182, -1.277003, -3.383998, 0, 1, 0.5450981, 1,
-0.1803206, 0.09288301, 0.5321794, 0, 1, 0.5490196, 1,
-0.17874, -0.02769158, -1.090505, 0, 1, 0.5568628, 1,
-0.1775619, -0.2818866, -0.9050794, 0, 1, 0.5607843, 1,
-0.1736232, -1.160272, -3.187132, 0, 1, 0.5686275, 1,
-0.1724618, -0.957423, -2.830617, 0, 1, 0.572549, 1,
-0.1705099, 0.1718486, -1.665086, 0, 1, 0.5803922, 1,
-0.1688778, -1.159361, -4.332663, 0, 1, 0.5843138, 1,
-0.1670179, 0.2255998, 0.1585865, 0, 1, 0.5921569, 1,
-0.1659806, -0.9097512, -3.532979, 0, 1, 0.5960785, 1,
-0.1633083, -0.3604877, -3.408771, 0, 1, 0.6039216, 1,
-0.161443, 0.1599098, 0.2045233, 0, 1, 0.6117647, 1,
-0.1578839, 0.2226286, 0.317042, 0, 1, 0.6156863, 1,
-0.154133, 0.5670546, 1.058835, 0, 1, 0.6235294, 1,
-0.152601, 0.577117, -0.1913576, 0, 1, 0.627451, 1,
-0.1509382, -0.2706366, -2.238416, 0, 1, 0.6352941, 1,
-0.148637, 0.8664976, 0.06266133, 0, 1, 0.6392157, 1,
-0.1434499, -0.6496044, -3.275104, 0, 1, 0.6470588, 1,
-0.1395372, 0.5799915, 1.242711, 0, 1, 0.6509804, 1,
-0.1351501, -0.6576489, -2.563863, 0, 1, 0.6588235, 1,
-0.1302366, 0.6026583, 0.04464946, 0, 1, 0.6627451, 1,
-0.1260962, 0.4204667, 1.448188, 0, 1, 0.6705883, 1,
-0.1248703, 0.5247228, -2.399036, 0, 1, 0.6745098, 1,
-0.120208, -1.948646, -1.399268, 0, 1, 0.682353, 1,
-0.1128698, 0.3511997, -0.4793992, 0, 1, 0.6862745, 1,
-0.1102389, -0.6120479, -4.403155, 0, 1, 0.6941177, 1,
-0.1082058, 0.6319894, -1.328108, 0, 1, 0.7019608, 1,
-0.1081648, -0.7911646, -4.185643, 0, 1, 0.7058824, 1,
-0.1070413, -0.8876039, -2.280399, 0, 1, 0.7137255, 1,
-0.09860758, 0.1452063, -1.288684, 0, 1, 0.7176471, 1,
-0.09367608, -0.07569268, -2.496847, 0, 1, 0.7254902, 1,
-0.09111801, 1.760519, -0.7406506, 0, 1, 0.7294118, 1,
-0.08975436, 0.5768868, -2.42975, 0, 1, 0.7372549, 1,
-0.08792041, 1.073052, -1.096311, 0, 1, 0.7411765, 1,
-0.08679724, -0.5401152, -2.362056, 0, 1, 0.7490196, 1,
-0.07857344, 1.848482, -0.907773, 0, 1, 0.7529412, 1,
-0.076179, 1.236989, -0.9300882, 0, 1, 0.7607843, 1,
-0.07080013, 0.4462337, 0.3977687, 0, 1, 0.7647059, 1,
-0.07044216, -0.2844976, -0.7046497, 0, 1, 0.772549, 1,
-0.07024639, 0.9133103, -0.8126279, 0, 1, 0.7764706, 1,
-0.06989054, 2.994833, -0.4288357, 0, 1, 0.7843137, 1,
-0.06928415, -0.4534959, -3.279588, 0, 1, 0.7882353, 1,
-0.06914735, -0.2506036, -4.207217, 0, 1, 0.7960784, 1,
-0.06709601, -1.303022, -2.691211, 0, 1, 0.8039216, 1,
-0.06625498, 0.2905301, -1.206215, 0, 1, 0.8078431, 1,
-0.06548487, 0.736506, 0.7736183, 0, 1, 0.8156863, 1,
-0.0549663, -1.104476, -3.656988, 0, 1, 0.8196079, 1,
-0.05342257, 0.4655755, -0.7136249, 0, 1, 0.827451, 1,
-0.05150373, 0.5927413, -0.460162, 0, 1, 0.8313726, 1,
-0.05029708, 0.3738562, 0.0576561, 0, 1, 0.8392157, 1,
-0.0470993, -1.811547, -3.692694, 0, 1, 0.8431373, 1,
-0.04600193, -1.59768, -3.491718, 0, 1, 0.8509804, 1,
-0.04271157, 0.911093, 0.06746708, 0, 1, 0.854902, 1,
-0.0422055, 1.975864, -1.436886, 0, 1, 0.8627451, 1,
-0.03914195, -0.4437862, -3.405923, 0, 1, 0.8666667, 1,
-0.03850233, 1.102722, -0.601516, 0, 1, 0.8745098, 1,
-0.03694965, 0.848681, -0.4052081, 0, 1, 0.8784314, 1,
-0.03436921, -0.2199947, -3.125638, 0, 1, 0.8862745, 1,
-0.02761883, -0.4338986, -3.796612, 0, 1, 0.8901961, 1,
-0.02706054, 0.9075621, 0.7135819, 0, 1, 0.8980392, 1,
-0.02404968, 0.1503493, -1.042003, 0, 1, 0.9058824, 1,
-0.02328259, 0.3549769, -2.177966, 0, 1, 0.9098039, 1,
-0.02191257, 0.5668879, -0.4805428, 0, 1, 0.9176471, 1,
-0.02068489, 0.7936243, 0.04723291, 0, 1, 0.9215686, 1,
-0.01881808, 2.262039, 0.1653229, 0, 1, 0.9294118, 1,
-0.01239767, -1.491361, -2.978614, 0, 1, 0.9333333, 1,
-0.008588098, -1.437662, -3.114908, 0, 1, 0.9411765, 1,
-0.005581658, -0.8296815, -5.413019, 0, 1, 0.945098, 1,
-0.0004955415, 1.103675, 0.5577117, 0, 1, 0.9529412, 1,
0.003729176, 0.3993753, -0.5075524, 0, 1, 0.9568627, 1,
0.008114982, -0.1666693, 2.185456, 0, 1, 0.9647059, 1,
0.01051224, 0.156592, -0.02371374, 0, 1, 0.9686275, 1,
0.01259876, -2.99628, 2.596659, 0, 1, 0.9764706, 1,
0.01571011, 0.07780597, 0.2881772, 0, 1, 0.9803922, 1,
0.02009194, -0.6194463, 3.385933, 0, 1, 0.9882353, 1,
0.02121971, -1.829472, 2.442628, 0, 1, 0.9921569, 1,
0.02794122, -0.7874023, 2.030134, 0, 1, 1, 1,
0.03016414, 0.6397361, 0.9824344, 0, 0.9921569, 1, 1,
0.03100895, -0.1910346, 3.864093, 0, 0.9882353, 1, 1,
0.03347542, 1.04464, 0.5488324, 0, 0.9803922, 1, 1,
0.03560972, 1.259733, -1.297386, 0, 0.9764706, 1, 1,
0.03652235, -1.110928, 2.659055, 0, 0.9686275, 1, 1,
0.03692978, -2.077595, 5.090904, 0, 0.9647059, 1, 1,
0.03722217, -0.03711401, 2.555568, 0, 0.9568627, 1, 1,
0.04280484, -0.3212698, 3.229968, 0, 0.9529412, 1, 1,
0.04381281, -1.310519, 2.866112, 0, 0.945098, 1, 1,
0.0440512, 1.300213, 1.336029, 0, 0.9411765, 1, 1,
0.04523166, 1.25746, 0.8343835, 0, 0.9333333, 1, 1,
0.04939505, 0.823547, -0.5750024, 0, 0.9294118, 1, 1,
0.05360163, -1.588714, 1.22508, 0, 0.9215686, 1, 1,
0.05369042, -0.4025737, 2.870818, 0, 0.9176471, 1, 1,
0.05381605, -1.312544, 3.088918, 0, 0.9098039, 1, 1,
0.05386477, -1.486344, 4.741876, 0, 0.9058824, 1, 1,
0.05466897, 0.1170916, 0.9821208, 0, 0.8980392, 1, 1,
0.05566972, 0.4264105, -1.14435, 0, 0.8901961, 1, 1,
0.05863443, -0.585357, 4.505025, 0, 0.8862745, 1, 1,
0.06107166, -0.5544708, 2.45057, 0, 0.8784314, 1, 1,
0.06257249, 0.09601795, 0.7901911, 0, 0.8745098, 1, 1,
0.06823627, 0.1401737, 1.994687, 0, 0.8666667, 1, 1,
0.06899305, -1.210992, 3.193017, 0, 0.8627451, 1, 1,
0.06939418, 0.07454272, 1.837954, 0, 0.854902, 1, 1,
0.06959851, -1.277081, 2.093577, 0, 0.8509804, 1, 1,
0.07078245, 0.0793734, 2.791943, 0, 0.8431373, 1, 1,
0.07866787, -0.2121663, 3.134596, 0, 0.8392157, 1, 1,
0.08041187, 0.6688867, 0.3469832, 0, 0.8313726, 1, 1,
0.08512142, -1.078293, 3.885906, 0, 0.827451, 1, 1,
0.09076288, -1.371123, 3.428041, 0, 0.8196079, 1, 1,
0.09493121, -0.1623016, 3.47102, 0, 0.8156863, 1, 1,
0.09502792, -0.6660554, 2.512953, 0, 0.8078431, 1, 1,
0.1026608, -0.4304612, 2.750573, 0, 0.8039216, 1, 1,
0.1063374, 0.6766602, 0.2429379, 0, 0.7960784, 1, 1,
0.1125484, -1.165073, 3.635412, 0, 0.7882353, 1, 1,
0.1143148, 0.1197923, 0.1784596, 0, 0.7843137, 1, 1,
0.1187111, 0.414875, -0.1795347, 0, 0.7764706, 1, 1,
0.1190392, 0.8669704, 0.3747858, 0, 0.772549, 1, 1,
0.1204391, 0.9876818, 2.113101, 0, 0.7647059, 1, 1,
0.1206075, -0.0603365, 2.696986, 0, 0.7607843, 1, 1,
0.1225334, 0.07681853, 0.6992652, 0, 0.7529412, 1, 1,
0.1254063, -0.1425068, 3.315022, 0, 0.7490196, 1, 1,
0.125811, 0.2900209, -1.119329, 0, 0.7411765, 1, 1,
0.130736, -0.5772032, 2.738446, 0, 0.7372549, 1, 1,
0.1308357, -1.635524, 3.321682, 0, 0.7294118, 1, 1,
0.1319056, -0.5460796, 4.792945, 0, 0.7254902, 1, 1,
0.1376665, 0.8426306, 0.1471225, 0, 0.7176471, 1, 1,
0.1416668, -1.559192, 4.990729, 0, 0.7137255, 1, 1,
0.1445816, -0.1529828, 3.392067, 0, 0.7058824, 1, 1,
0.1448029, 0.4528563, 2.342283, 0, 0.6980392, 1, 1,
0.1448809, -1.543972, 1.124666, 0, 0.6941177, 1, 1,
0.1455516, -0.9399468, 3.382588, 0, 0.6862745, 1, 1,
0.1465225, -0.9053006, 3.009545, 0, 0.682353, 1, 1,
0.1474736, -1.020165, 4.10428, 0, 0.6745098, 1, 1,
0.1505705, 2.633638, -0.2120009, 0, 0.6705883, 1, 1,
0.1519805, -1.257877, 1.610091, 0, 0.6627451, 1, 1,
0.1523049, -0.31378, 1.168709, 0, 0.6588235, 1, 1,
0.1537679, -1.099765, 2.242121, 0, 0.6509804, 1, 1,
0.1541492, -0.5267711, 2.060395, 0, 0.6470588, 1, 1,
0.1545155, 0.9748391, 0.9496006, 0, 0.6392157, 1, 1,
0.1549336, -0.2669374, 1.955649, 0, 0.6352941, 1, 1,
0.1602284, 1.156009, 0.6671355, 0, 0.627451, 1, 1,
0.1603729, 0.04997618, 1.351573, 0, 0.6235294, 1, 1,
0.1663155, 0.9989089, 1.192726, 0, 0.6156863, 1, 1,
0.1663368, 0.07698237, -0.267814, 0, 0.6117647, 1, 1,
0.1683616, 0.1067379, 1.505008, 0, 0.6039216, 1, 1,
0.1684476, -1.13297, 2.35831, 0, 0.5960785, 1, 1,
0.1687289, -1.872599, 3.052676, 0, 0.5921569, 1, 1,
0.1696298, -0.3933409, 4.377156, 0, 0.5843138, 1, 1,
0.1783652, -0.361795, 2.124007, 0, 0.5803922, 1, 1,
0.1803039, 0.7099261, 1.284239, 0, 0.572549, 1, 1,
0.1829181, 1.024229, 0.2910452, 0, 0.5686275, 1, 1,
0.1830083, 0.1921303, 0.8474078, 0, 0.5607843, 1, 1,
0.1887561, 0.9212183, -0.07732208, 0, 0.5568628, 1, 1,
0.1899994, 0.537877, 1.820004, 0, 0.5490196, 1, 1,
0.1924796, 1.405752, -0.1281495, 0, 0.5450981, 1, 1,
0.1929344, 0.9825109, 0.3786916, 0, 0.5372549, 1, 1,
0.1938312, -1.157396, 2.352721, 0, 0.5333334, 1, 1,
0.1991361, 0.278077, 1.294384, 0, 0.5254902, 1, 1,
0.1999578, 0.4121295, 0.8578784, 0, 0.5215687, 1, 1,
0.2087172, -0.04924684, 1.498888, 0, 0.5137255, 1, 1,
0.2126805, 0.7828462, -0.405295, 0, 0.509804, 1, 1,
0.21348, 0.02440396, 4.383853, 0, 0.5019608, 1, 1,
0.2139336, 1.491543, 0.7007426, 0, 0.4941176, 1, 1,
0.2150923, -0.7216108, 3.060789, 0, 0.4901961, 1, 1,
0.2166252, -0.7477745, 1.546388, 0, 0.4823529, 1, 1,
0.2215717, -1.281316, 4.681702, 0, 0.4784314, 1, 1,
0.2226594, 1.623893, -0.02310835, 0, 0.4705882, 1, 1,
0.2234431, 0.5188128, 0.5036456, 0, 0.4666667, 1, 1,
0.2241174, 1.032945, -0.8977897, 0, 0.4588235, 1, 1,
0.2244088, -0.06231559, 1.223153, 0, 0.454902, 1, 1,
0.2245828, 1.549402, -0.5476639, 0, 0.4470588, 1, 1,
0.2262711, -1.186577, 2.888712, 0, 0.4431373, 1, 1,
0.2315872, -0.7531462, 0.3122225, 0, 0.4352941, 1, 1,
0.234034, -1.592893, 2.885453, 0, 0.4313726, 1, 1,
0.2358562, 1.875519, 1.468447, 0, 0.4235294, 1, 1,
0.2364216, 1.27192, 0.4122587, 0, 0.4196078, 1, 1,
0.2365601, 1.524779, 0.4429481, 0, 0.4117647, 1, 1,
0.2367348, 1.22466, -0.2939307, 0, 0.4078431, 1, 1,
0.2368137, -0.7145985, 1.380906, 0, 0.4, 1, 1,
0.2369016, 0.7024567, 0.09317653, 0, 0.3921569, 1, 1,
0.2385096, 0.2255937, -0.3474759, 0, 0.3882353, 1, 1,
0.2408485, -0.1587477, 0.8518254, 0, 0.3803922, 1, 1,
0.2410258, 0.8690081, 1.968907, 0, 0.3764706, 1, 1,
0.244856, -0.803161, 2.468201, 0, 0.3686275, 1, 1,
0.2476742, 0.5029883, 1.044086, 0, 0.3647059, 1, 1,
0.2533312, -1.273206, 4.188211, 0, 0.3568628, 1, 1,
0.2550779, -0.3318778, 0.9113536, 0, 0.3529412, 1, 1,
0.256309, -0.7708247, 3.921818, 0, 0.345098, 1, 1,
0.2644339, -1.174743, 4.076537, 0, 0.3411765, 1, 1,
0.265951, -1.579634, 2.546663, 0, 0.3333333, 1, 1,
0.2708624, 1.720095, -0.101116, 0, 0.3294118, 1, 1,
0.2743225, 1.829262, -0.2284794, 0, 0.3215686, 1, 1,
0.283776, -0.09324425, 0.8200046, 0, 0.3176471, 1, 1,
0.2859119, -1.876281, 2.325459, 0, 0.3098039, 1, 1,
0.2897213, -0.2932495, 1.942628, 0, 0.3058824, 1, 1,
0.2913402, -0.8009326, 2.507614, 0, 0.2980392, 1, 1,
0.2934146, -0.424803, 2.749555, 0, 0.2901961, 1, 1,
0.2950966, 0.7352469, 1.507292, 0, 0.2862745, 1, 1,
0.300417, -1.339522, 1.359522, 0, 0.2784314, 1, 1,
0.3108284, 1.742236, 1.304713, 0, 0.2745098, 1, 1,
0.3112428, 0.2215314, 0.9486999, 0, 0.2666667, 1, 1,
0.3132399, -1.307079, 3.598392, 0, 0.2627451, 1, 1,
0.3135415, -0.9336621, 2.746909, 0, 0.254902, 1, 1,
0.3182285, 1.039296, 0.6538153, 0, 0.2509804, 1, 1,
0.3189825, -0.677493, 1.675262, 0, 0.2431373, 1, 1,
0.3192625, -0.0887877, 0.445207, 0, 0.2392157, 1, 1,
0.3210257, 0.3761236, 0.9545435, 0, 0.2313726, 1, 1,
0.3214946, 1.545797, -0.4302194, 0, 0.227451, 1, 1,
0.3217653, -1.152774, 3.086754, 0, 0.2196078, 1, 1,
0.3253679, -1.424867, 3.423688, 0, 0.2156863, 1, 1,
0.3258017, 0.9326025, -1.175597, 0, 0.2078431, 1, 1,
0.327906, -0.4745402, 2.209645, 0, 0.2039216, 1, 1,
0.3289597, -2.197108, 3.961058, 0, 0.1960784, 1, 1,
0.3291264, -0.2544049, 1.096764, 0, 0.1882353, 1, 1,
0.3309929, -1.702097, 2.460438, 0, 0.1843137, 1, 1,
0.3324577, -0.09460193, 2.097667, 0, 0.1764706, 1, 1,
0.3460176, -1.725675, 1.707586, 0, 0.172549, 1, 1,
0.3463975, 0.04716766, 0.9251975, 0, 0.1647059, 1, 1,
0.3478241, 0.4405411, 0.3960962, 0, 0.1607843, 1, 1,
0.3501235, -0.06996661, 1.052401, 0, 0.1529412, 1, 1,
0.351056, 0.7845528, 2.164232, 0, 0.1490196, 1, 1,
0.352134, 0.5935595, 1.693663, 0, 0.1411765, 1, 1,
0.3607604, 0.6435054, 1.627475, 0, 0.1372549, 1, 1,
0.3690668, 0.6425073, 0.9627662, 0, 0.1294118, 1, 1,
0.371305, -0.440319, 4.778302, 0, 0.1254902, 1, 1,
0.3732259, -0.6351616, 2.596918, 0, 0.1176471, 1, 1,
0.3810459, 1.635382, 0.6121912, 0, 0.1137255, 1, 1,
0.3829469, -1.362092, 3.541114, 0, 0.1058824, 1, 1,
0.3846464, 0.6311288, 1.3567, 0, 0.09803922, 1, 1,
0.3860869, 0.4322314, 1.707313, 0, 0.09411765, 1, 1,
0.3876711, -0.9480962, 1.216215, 0, 0.08627451, 1, 1,
0.3887685, 1.239966, 0.2191396, 0, 0.08235294, 1, 1,
0.390267, -0.3444535, 1.5901, 0, 0.07450981, 1, 1,
0.390761, 1.003026, 0.9401931, 0, 0.07058824, 1, 1,
0.3932755, 0.4471448, 0.8246613, 0, 0.0627451, 1, 1,
0.4030589, -0.6158041, 2.621126, 0, 0.05882353, 1, 1,
0.4040666, -0.2729991, 1.681135, 0, 0.05098039, 1, 1,
0.404538, -1.097398, 2.415458, 0, 0.04705882, 1, 1,
0.4135987, 0.7976166, -0.4710161, 0, 0.03921569, 1, 1,
0.4140335, 1.862925, -1.102164, 0, 0.03529412, 1, 1,
0.4169858, -0.01529768, 2.351597, 0, 0.02745098, 1, 1,
0.4185085, -0.5623837, 1.793717, 0, 0.02352941, 1, 1,
0.4211887, -0.6932756, 1.984318, 0, 0.01568628, 1, 1,
0.4252089, 0.822669, 1.07956, 0, 0.01176471, 1, 1,
0.427835, 2.671167, 1.924039, 0, 0.003921569, 1, 1,
0.4349598, 0.2134837, 1.134069, 0.003921569, 0, 1, 1,
0.4361334, 0.6831039, -0.1753686, 0.007843138, 0, 1, 1,
0.4408425, -1.230355, 1.738036, 0.01568628, 0, 1, 1,
0.4421017, -2.643783, 2.641074, 0.01960784, 0, 1, 1,
0.4428698, -1.039428, 1.98082, 0.02745098, 0, 1, 1,
0.4443047, 0.239359, 1.963005, 0.03137255, 0, 1, 1,
0.4448402, -0.1150838, 0.4470119, 0.03921569, 0, 1, 1,
0.4477203, 2.468117, 0.7784983, 0.04313726, 0, 1, 1,
0.447999, -1.243708, 2.643692, 0.05098039, 0, 1, 1,
0.4498778, -0.4738546, 2.382202, 0.05490196, 0, 1, 1,
0.4503039, 0.3616694, 0.176126, 0.0627451, 0, 1, 1,
0.4575563, -1.027172, 1.16996, 0.06666667, 0, 1, 1,
0.4596355, 0.5543736, 0.8433793, 0.07450981, 0, 1, 1,
0.4640916, -0.2284958, 4.616355, 0.07843138, 0, 1, 1,
0.4667838, 0.6482805, 1.095165, 0.08627451, 0, 1, 1,
0.472755, 0.5448309, 0.5897305, 0.09019608, 0, 1, 1,
0.4730172, -1.547756, 4.029596, 0.09803922, 0, 1, 1,
0.4735601, 0.09010883, 2.881201, 0.1058824, 0, 1, 1,
0.4747443, 1.912046, 0.3270603, 0.1098039, 0, 1, 1,
0.4778571, 1.378164, -0.05422763, 0.1176471, 0, 1, 1,
0.4782604, -0.8070058, 1.868363, 0.1215686, 0, 1, 1,
0.4847062, 0.9692056, 1.268495, 0.1294118, 0, 1, 1,
0.4892031, -0.2706041, 3.076924, 0.1333333, 0, 1, 1,
0.4904386, -1.380339, 2.674803, 0.1411765, 0, 1, 1,
0.4962187, 1.5531, 0.02517757, 0.145098, 0, 1, 1,
0.4973892, -0.8314575, 1.250869, 0.1529412, 0, 1, 1,
0.4980322, -0.1730161, 1.979492, 0.1568628, 0, 1, 1,
0.4980569, 2.116928, 2.02751, 0.1647059, 0, 1, 1,
0.498947, 0.4121252, 1.010445, 0.1686275, 0, 1, 1,
0.5037687, 0.6745863, 1.666768, 0.1764706, 0, 1, 1,
0.5053557, 0.9252585, 1.83539, 0.1803922, 0, 1, 1,
0.5055228, 0.6025346, 1.3132, 0.1882353, 0, 1, 1,
0.5056322, -1.754781, 4.163517, 0.1921569, 0, 1, 1,
0.5076058, -1.917331, 1.793043, 0.2, 0, 1, 1,
0.5079411, -0.5389427, 1.913312, 0.2078431, 0, 1, 1,
0.5110222, 0.4088211, 1.274012, 0.2117647, 0, 1, 1,
0.5121725, -0.1385684, 3.20327, 0.2196078, 0, 1, 1,
0.5229114, 0.6859398, 0.01527675, 0.2235294, 0, 1, 1,
0.5243391, -1.288794, 3.649088, 0.2313726, 0, 1, 1,
0.5258527, 0.9430508, 1.009827, 0.2352941, 0, 1, 1,
0.5287904, -0.4721541, 2.424458, 0.2431373, 0, 1, 1,
0.5346759, -0.5795988, 0.8920887, 0.2470588, 0, 1, 1,
0.5356913, -0.1381039, 3.272025, 0.254902, 0, 1, 1,
0.5388322, -0.8298851, 0.871137, 0.2588235, 0, 1, 1,
0.5389048, -0.1932645, 1.770255, 0.2666667, 0, 1, 1,
0.5392869, 0.1857065, 0.1212779, 0.2705882, 0, 1, 1,
0.5410225, -0.4209837, 4.126366, 0.2784314, 0, 1, 1,
0.5442783, 1.727338, 0.7113712, 0.282353, 0, 1, 1,
0.5449927, 1.900293, 1.679788, 0.2901961, 0, 1, 1,
0.5483853, -0.9760845, 2.674896, 0.2941177, 0, 1, 1,
0.557107, -0.09008866, -0.5426211, 0.3019608, 0, 1, 1,
0.5587382, -0.436759, 2.383416, 0.3098039, 0, 1, 1,
0.559321, 1.439396, -0.7021561, 0.3137255, 0, 1, 1,
0.560393, -0.05388105, 1.939381, 0.3215686, 0, 1, 1,
0.5604212, 0.1167025, 2.353755, 0.3254902, 0, 1, 1,
0.5650284, -0.1934143, 0.7042279, 0.3333333, 0, 1, 1,
0.5663294, 0.652613, 1.690618, 0.3372549, 0, 1, 1,
0.5666283, -0.156959, 3.103327, 0.345098, 0, 1, 1,
0.5673007, -0.3438739, 1.474011, 0.3490196, 0, 1, 1,
0.5759818, 0.09376998, 1.5366, 0.3568628, 0, 1, 1,
0.5787806, -0.6064175, 3.681133, 0.3607843, 0, 1, 1,
0.5837646, -0.08381151, 0.8239724, 0.3686275, 0, 1, 1,
0.5896935, -0.1974777, 3.084462, 0.372549, 0, 1, 1,
0.5953224, -0.3813179, 2.26412, 0.3803922, 0, 1, 1,
0.5958424, 1.110521, 1.041015, 0.3843137, 0, 1, 1,
0.5984099, 0.8889765, -0.3058368, 0.3921569, 0, 1, 1,
0.6062301, -0.6964544, 4.379917, 0.3960784, 0, 1, 1,
0.6086246, 1.192886, 0.6650975, 0.4039216, 0, 1, 1,
0.6140376, 0.1053176, 0.9440225, 0.4117647, 0, 1, 1,
0.6154156, 0.965496, 1.044797, 0.4156863, 0, 1, 1,
0.617038, -0.9556347, 1.722598, 0.4235294, 0, 1, 1,
0.6172552, 0.3409162, 0.8350772, 0.427451, 0, 1, 1,
0.6202212, -1.474628, 3.219518, 0.4352941, 0, 1, 1,
0.6204485, 1.337257, -0.4944023, 0.4392157, 0, 1, 1,
0.6226207, -1.757276, 3.19346, 0.4470588, 0, 1, 1,
0.6229412, -0.2684888, 2.395768, 0.4509804, 0, 1, 1,
0.6230422, -1.110056, 3.384662, 0.4588235, 0, 1, 1,
0.6239884, -0.3964884, 1.312106, 0.4627451, 0, 1, 1,
0.6241252, -0.1313446, 2.067697, 0.4705882, 0, 1, 1,
0.6282054, 0.4447517, 0.1080887, 0.4745098, 0, 1, 1,
0.6361125, -0.06531242, 2.606858, 0.4823529, 0, 1, 1,
0.6402187, 0.8538911, -0.6673566, 0.4862745, 0, 1, 1,
0.6416977, -0.8224699, 2.202414, 0.4941176, 0, 1, 1,
0.6422929, 0.7272432, 0.9522322, 0.5019608, 0, 1, 1,
0.6460194, 0.8607609, 1.659074, 0.5058824, 0, 1, 1,
0.6475771, 0.1414801, 0.251507, 0.5137255, 0, 1, 1,
0.6505394, -0.2142524, 4.349754, 0.5176471, 0, 1, 1,
0.6621051, 0.02250906, 0.4054922, 0.5254902, 0, 1, 1,
0.6631935, 0.6217278, 1.246728, 0.5294118, 0, 1, 1,
0.6725851, -1.870533, 3.625858, 0.5372549, 0, 1, 1,
0.6757066, 2.369379, 0.3376823, 0.5411765, 0, 1, 1,
0.6767985, -0.1508426, 1.766726, 0.5490196, 0, 1, 1,
0.6867921, 0.6895899, -0.5767357, 0.5529412, 0, 1, 1,
0.6909868, 1.392477, -0.6841887, 0.5607843, 0, 1, 1,
0.694387, 0.7216532, -0.6437811, 0.5647059, 0, 1, 1,
0.6955052, -1.460318, 0.8893652, 0.572549, 0, 1, 1,
0.6960716, 0.8133528, -0.9600095, 0.5764706, 0, 1, 1,
0.6993718, 1.49068, 0.1256563, 0.5843138, 0, 1, 1,
0.7129231, -0.9931067, 2.634263, 0.5882353, 0, 1, 1,
0.7132546, -0.8722065, 2.691084, 0.5960785, 0, 1, 1,
0.721617, -1.630725, 1.912681, 0.6039216, 0, 1, 1,
0.7219256, 0.366841, 1.059829, 0.6078432, 0, 1, 1,
0.7242457, 0.2518001, 1.183722, 0.6156863, 0, 1, 1,
0.7329262, 0.07510418, 2.012106, 0.6196079, 0, 1, 1,
0.7493028, 1.359821, -1.92193, 0.627451, 0, 1, 1,
0.7499477, -1.265147, 2.746683, 0.6313726, 0, 1, 1,
0.7524295, -0.2272799, 3.582947, 0.6392157, 0, 1, 1,
0.7540218, 1.674488, 1.4638, 0.6431373, 0, 1, 1,
0.755327, 0.5889569, 0.7954649, 0.6509804, 0, 1, 1,
0.7557826, -0.6488746, -0.7282375, 0.654902, 0, 1, 1,
0.7577294, 0.1208759, 0.293824, 0.6627451, 0, 1, 1,
0.7581046, -0.2679026, 1.123108, 0.6666667, 0, 1, 1,
0.7583172, -0.5254641, 1.981074, 0.6745098, 0, 1, 1,
0.7593947, 1.30007, 1.347728, 0.6784314, 0, 1, 1,
0.7616507, -0.6287468, 3.1377, 0.6862745, 0, 1, 1,
0.7626079, -0.9232252, 1.854246, 0.6901961, 0, 1, 1,
0.7637454, 0.2819996, 3.849146, 0.6980392, 0, 1, 1,
0.7643869, 1.114641, 0.09000678, 0.7058824, 0, 1, 1,
0.7651016, -0.5923032, 1.215672, 0.7098039, 0, 1, 1,
0.7657707, 0.163949, 2.14198, 0.7176471, 0, 1, 1,
0.7735591, 1.177858, 0.2040241, 0.7215686, 0, 1, 1,
0.7767327, -0.3495613, 3.080393, 0.7294118, 0, 1, 1,
0.7781224, 1.509158, 1.082617, 0.7333333, 0, 1, 1,
0.785621, 0.4286829, 0.8013104, 0.7411765, 0, 1, 1,
0.7869515, -1.155623, 2.937452, 0.7450981, 0, 1, 1,
0.7871629, -0.4872067, 2.719971, 0.7529412, 0, 1, 1,
0.7915718, -0.8160303, 2.452662, 0.7568628, 0, 1, 1,
0.7939342, -3.14706, 2.726249, 0.7647059, 0, 1, 1,
0.7939487, -1.065897, 2.278842, 0.7686275, 0, 1, 1,
0.795785, -0.8667526, 2.298223, 0.7764706, 0, 1, 1,
0.7967466, 1.089071, 1.605585, 0.7803922, 0, 1, 1,
0.7967835, -0.5128448, 1.223086, 0.7882353, 0, 1, 1,
0.7995606, -0.348499, 0.8144317, 0.7921569, 0, 1, 1,
0.8063713, 0.7298547, -0.4548796, 0.8, 0, 1, 1,
0.8108139, 0.8395689, -0.4307413, 0.8078431, 0, 1, 1,
0.8123693, -0.7581403, 1.608099, 0.8117647, 0, 1, 1,
0.8215516, 0.1621078, 1.44883, 0.8196079, 0, 1, 1,
0.8235503, -2.869239, 3.651957, 0.8235294, 0, 1, 1,
0.8246705, 3.23376, 1.193632, 0.8313726, 0, 1, 1,
0.8263917, 0.5329047, 0.01745856, 0.8352941, 0, 1, 1,
0.8314009, -2.068898, 2.990357, 0.8431373, 0, 1, 1,
0.8336575, -0.3304631, 3.566186, 0.8470588, 0, 1, 1,
0.8513151, -0.1924012, 1.668214, 0.854902, 0, 1, 1,
0.8537669, -0.5885959, 2.941614, 0.8588235, 0, 1, 1,
0.8569393, 0.4939516, 1.930041, 0.8666667, 0, 1, 1,
0.8594203, 0.6635389, 2.501548, 0.8705882, 0, 1, 1,
0.8621363, 0.1048265, 1.317504, 0.8784314, 0, 1, 1,
0.8642853, 0.6660843, -0.1389129, 0.8823529, 0, 1, 1,
0.8690276, 0.4759728, -0.1885261, 0.8901961, 0, 1, 1,
0.8696098, -0.9666381, 2.872681, 0.8941177, 0, 1, 1,
0.8712131, 0.8312671, 0.4480939, 0.9019608, 0, 1, 1,
0.8942708, -0.8654514, 3.320508, 0.9098039, 0, 1, 1,
0.8944897, 0.8813021, 1.383199, 0.9137255, 0, 1, 1,
0.8953453, 1.758659, 0.07491474, 0.9215686, 0, 1, 1,
0.9059845, -1.304104, 2.323185, 0.9254902, 0, 1, 1,
0.9063847, -0.7158772, 3.272597, 0.9333333, 0, 1, 1,
0.9130442, -0.840723, 2.611204, 0.9372549, 0, 1, 1,
0.9132738, -1.068302, 2.348108, 0.945098, 0, 1, 1,
0.9166592, 0.6500942, 0.8353125, 0.9490196, 0, 1, 1,
0.9190376, 0.4659455, 0.4150929, 0.9568627, 0, 1, 1,
0.9209676, -0.03422849, 2.357194, 0.9607843, 0, 1, 1,
0.9224639, 0.261707, 1.691956, 0.9686275, 0, 1, 1,
0.9260972, 0.2934564, 1.81703, 0.972549, 0, 1, 1,
0.9298688, -0.6028394, 3.839763, 0.9803922, 0, 1, 1,
0.9319342, -0.2499886, 2.275176, 0.9843137, 0, 1, 1,
0.9359255, 0.8337967, 1.270503, 0.9921569, 0, 1, 1,
0.9367418, -1.219605, 1.762586, 0.9960784, 0, 1, 1,
0.9369114, 0.9649328, 1.70071, 1, 0, 0.9960784, 1,
0.9410776, -0.6367118, 2.931771, 1, 0, 0.9882353, 1,
0.9416509, 0.1022624, -0.2450257, 1, 0, 0.9843137, 1,
0.9445594, -1.454046, 3.283481, 1, 0, 0.9764706, 1,
0.9454131, 0.06171706, 1.28542, 1, 0, 0.972549, 1,
0.9459392, -0.01499726, 2.150384, 1, 0, 0.9647059, 1,
0.946539, -1.433256, 2.793417, 1, 0, 0.9607843, 1,
0.9476731, 0.06091198, 2.184597, 1, 0, 0.9529412, 1,
0.9512442, -1.003866, 1.162352, 1, 0, 0.9490196, 1,
0.954066, 0.2466315, 2.147514, 1, 0, 0.9411765, 1,
0.9541823, 0.7371307, 2.112343, 1, 0, 0.9372549, 1,
0.9574488, -0.4783169, 0.613436, 1, 0, 0.9294118, 1,
0.9575925, -1.025274, 2.400471, 1, 0, 0.9254902, 1,
0.9578617, -1.61367, 2.51372, 1, 0, 0.9176471, 1,
0.9604929, 1.582663, 0.7871059, 1, 0, 0.9137255, 1,
0.9622813, -0.7622202, 1.060275, 1, 0, 0.9058824, 1,
0.9654559, 2.987632, 1.380666, 1, 0, 0.9019608, 1,
0.9695255, 0.9279881, 2.334428, 1, 0, 0.8941177, 1,
0.9697949, 1.124546, 2.561007, 1, 0, 0.8862745, 1,
0.9722903, 0.4968713, 0.6473479, 1, 0, 0.8823529, 1,
0.9812755, 0.5110716, -0.06640343, 1, 0, 0.8745098, 1,
0.9818041, 0.8575624, 2.017403, 1, 0, 0.8705882, 1,
0.9822761, -0.7255242, -0.04140262, 1, 0, 0.8627451, 1,
0.9866199, 0.04613386, 0.4268728, 1, 0, 0.8588235, 1,
0.9914242, 0.2713634, 2.840273, 1, 0, 0.8509804, 1,
0.9937849, 0.08752964, 1.239745, 1, 0, 0.8470588, 1,
0.9963831, 0.2372845, 1.797065, 1, 0, 0.8392157, 1,
0.9983597, 0.4554244, 2.377724, 1, 0, 0.8352941, 1,
0.9989217, -0.8799432, 1.757774, 1, 0, 0.827451, 1,
1.004436, 2.24947, 0.7609876, 1, 0, 0.8235294, 1,
1.008049, 0.2741242, 0.4561865, 1, 0, 0.8156863, 1,
1.010187, 1.007825, 1.563974, 1, 0, 0.8117647, 1,
1.012193, -0.6893511, 1.563579, 1, 0, 0.8039216, 1,
1.015, 1.29898, 0.6763451, 1, 0, 0.7960784, 1,
1.019865, -1.311058, 3.206547, 1, 0, 0.7921569, 1,
1.020514, -0.5498586, 0.6522229, 1, 0, 0.7843137, 1,
1.025246, 0.6774635, 2.645917, 1, 0, 0.7803922, 1,
1.034017, 0.2583423, 0.7646502, 1, 0, 0.772549, 1,
1.034083, 0.4518011, 0.3618395, 1, 0, 0.7686275, 1,
1.03985, -1.521366, -0.06305893, 1, 0, 0.7607843, 1,
1.051173, -0.4894024, 2.294212, 1, 0, 0.7568628, 1,
1.05516, 0.6844238, 1.435608, 1, 0, 0.7490196, 1,
1.060699, 0.6246741, 2.11298, 1, 0, 0.7450981, 1,
1.06702, 1.325789, 0.3617725, 1, 0, 0.7372549, 1,
1.072998, 0.7584242, 0.9899684, 1, 0, 0.7333333, 1,
1.080185, 0.5629846, 2.206795, 1, 0, 0.7254902, 1,
1.083291, 1.4318, -0.1013427, 1, 0, 0.7215686, 1,
1.088101, 0.3857951, 0.2847574, 1, 0, 0.7137255, 1,
1.091571, -0.08440778, 2.596801, 1, 0, 0.7098039, 1,
1.102705, 0.3074685, 0.9231346, 1, 0, 0.7019608, 1,
1.103935, -2.370474, 3.01867, 1, 0, 0.6941177, 1,
1.104102, 0.4663472, -0.4823766, 1, 0, 0.6901961, 1,
1.111068, 0.7475427, 2.238538, 1, 0, 0.682353, 1,
1.117725, 1.319764, 1.944982, 1, 0, 0.6784314, 1,
1.11928, 2.064867, -0.639666, 1, 0, 0.6705883, 1,
1.126813, -2.642935, 2.288559, 1, 0, 0.6666667, 1,
1.131766, 0.282857, 1.963768, 1, 0, 0.6588235, 1,
1.144829, 0.9620832, 0.7802171, 1, 0, 0.654902, 1,
1.148354, -1.22937, 1.535032, 1, 0, 0.6470588, 1,
1.153612, 0.07850547, 2.288024, 1, 0, 0.6431373, 1,
1.154679, -0.160392, 1.085406, 1, 0, 0.6352941, 1,
1.160636, -0.2333061, 0.8459811, 1, 0, 0.6313726, 1,
1.160651, -1.636243, 3.573797, 1, 0, 0.6235294, 1,
1.164332, 0.6812352, 1.878761, 1, 0, 0.6196079, 1,
1.167224, 0.1614258, 2.300177, 1, 0, 0.6117647, 1,
1.175701, -0.035011, 2.370757, 1, 0, 0.6078432, 1,
1.185567, 0.9378241, 0.08260361, 1, 0, 0.6, 1,
1.187435, 0.3183288, 0.7190205, 1, 0, 0.5921569, 1,
1.194258, 1.509508, 1.596364, 1, 0, 0.5882353, 1,
1.197524, -0.4308299, 1.304308, 1, 0, 0.5803922, 1,
1.204431, 0.7511403, 0.4547866, 1, 0, 0.5764706, 1,
1.206541, 1.221459, -0.5986894, 1, 0, 0.5686275, 1,
1.212469, -0.9750406, 3.254163, 1, 0, 0.5647059, 1,
1.216576, 2.073952, -0.3427938, 1, 0, 0.5568628, 1,
1.21772, 1.099106, 2.340117, 1, 0, 0.5529412, 1,
1.224732, -0.5352871, 2.923395, 1, 0, 0.5450981, 1,
1.225354, 2.690449, 1.366975, 1, 0, 0.5411765, 1,
1.229048, -0.3506751, 0.7740861, 1, 0, 0.5333334, 1,
1.244194, -0.158494, 1.510015, 1, 0, 0.5294118, 1,
1.249551, -1.30874, 1.798041, 1, 0, 0.5215687, 1,
1.256235, -0.08339325, 2.115214, 1, 0, 0.5176471, 1,
1.25667, 0.9145641, -0.417422, 1, 0, 0.509804, 1,
1.26016, 0.6796159, -0.705268, 1, 0, 0.5058824, 1,
1.271289, 0.757962, 0.954153, 1, 0, 0.4980392, 1,
1.273417, 0.2424006, 0.0002178444, 1, 0, 0.4901961, 1,
1.276479, -0.8510146, 1.352086, 1, 0, 0.4862745, 1,
1.282695, -0.04854022, 3.327378, 1, 0, 0.4784314, 1,
1.288408, -0.4864768, 3.359864, 1, 0, 0.4745098, 1,
1.289457, 0.3077943, -0.4293643, 1, 0, 0.4666667, 1,
1.297028, 0.5549684, 0.6642992, 1, 0, 0.4627451, 1,
1.313432, 0.8115706, -0.3738569, 1, 0, 0.454902, 1,
1.336372, 0.6199032, 0.8754342, 1, 0, 0.4509804, 1,
1.340144, 1.224894, 1.489835, 1, 0, 0.4431373, 1,
1.347594, -1.976641, 3.124027, 1, 0, 0.4392157, 1,
1.349941, -0.4353496, 2.813084, 1, 0, 0.4313726, 1,
1.364781, -0.7467061, 2.620329, 1, 0, 0.427451, 1,
1.369082, 0.5785365, -0.738651, 1, 0, 0.4196078, 1,
1.378654, 1.902659, 0.7473804, 1, 0, 0.4156863, 1,
1.388176, -0.2097105, 0.9600311, 1, 0, 0.4078431, 1,
1.419196, 0.6713251, 2.629141, 1, 0, 0.4039216, 1,
1.420156, -0.9266055, 2.238291, 1, 0, 0.3960784, 1,
1.44074, -1.031645, 1.016998, 1, 0, 0.3882353, 1,
1.452514, -0.525591, 2.870187, 1, 0, 0.3843137, 1,
1.457509, 1.116651, 1.478537, 1, 0, 0.3764706, 1,
1.47649, 1.106941, 0.8887239, 1, 0, 0.372549, 1,
1.477936, -0.6089073, 2.291386, 1, 0, 0.3647059, 1,
1.480479, 0.503451, 1.016121, 1, 0, 0.3607843, 1,
1.496625, -0.3669609, 2.524521, 1, 0, 0.3529412, 1,
1.50093, 1.873286, 1.648536, 1, 0, 0.3490196, 1,
1.503406, 0.1529599, -0.08350347, 1, 0, 0.3411765, 1,
1.507494, -0.3232618, 2.385747, 1, 0, 0.3372549, 1,
1.51232, -1.732344, 2.334446, 1, 0, 0.3294118, 1,
1.542306, 0.07149266, 1.145669, 1, 0, 0.3254902, 1,
1.545929, -0.5669994, 1.717771, 1, 0, 0.3176471, 1,
1.557576, -1.070775, 1.620864, 1, 0, 0.3137255, 1,
1.561146, 0.6634942, 2.259569, 1, 0, 0.3058824, 1,
1.563153, -0.053182, 0.4760921, 1, 0, 0.2980392, 1,
1.593596, 0.3929165, 1.920776, 1, 0, 0.2941177, 1,
1.597298, 0.8059904, 1.186222, 1, 0, 0.2862745, 1,
1.598426, -0.4046541, 2.748606, 1, 0, 0.282353, 1,
1.612402, -1.332095, 2.176871, 1, 0, 0.2745098, 1,
1.620219, 0.895008, 0.5022383, 1, 0, 0.2705882, 1,
1.628275, -0.4482097, 2.004105, 1, 0, 0.2627451, 1,
1.652164, 0.3599417, 1.528896, 1, 0, 0.2588235, 1,
1.654674, 1.071737, 1.189166, 1, 0, 0.2509804, 1,
1.660982, -0.4987849, 2.095889, 1, 0, 0.2470588, 1,
1.667639, 0.8212156, 1.088515, 1, 0, 0.2392157, 1,
1.691855, 0.1783117, 1.714656, 1, 0, 0.2352941, 1,
1.711044, 0.5216885, 0.2157309, 1, 0, 0.227451, 1,
1.712283, -0.01351717, 1.670953, 1, 0, 0.2235294, 1,
1.712832, 1.014214, -0.8275324, 1, 0, 0.2156863, 1,
1.728294, -0.5513155, 2.420961, 1, 0, 0.2117647, 1,
1.730233, 0.6172579, 1.272171, 1, 0, 0.2039216, 1,
1.740144, -1.612879, 2.138356, 1, 0, 0.1960784, 1,
1.775574, 0.760551, 1.626075, 1, 0, 0.1921569, 1,
1.777651, -0.6486142, 2.411666, 1, 0, 0.1843137, 1,
1.797176, -0.2698414, 1.697701, 1, 0, 0.1803922, 1,
1.799082, -1.442924, 2.044655, 1, 0, 0.172549, 1,
1.79961, 0.674419, 3.435178, 1, 0, 0.1686275, 1,
1.819651, -1.738385, 2.171519, 1, 0, 0.1607843, 1,
1.831811, 1.268131, 1.351326, 1, 0, 0.1568628, 1,
1.834117, -0.1139645, 0.8913018, 1, 0, 0.1490196, 1,
1.838826, 2.387207, 1.276811, 1, 0, 0.145098, 1,
1.86733, 0.6928833, 0.2127768, 1, 0, 0.1372549, 1,
1.902065, 0.8938615, 0.5280766, 1, 0, 0.1333333, 1,
1.907732, 0.4532903, 3.235521, 1, 0, 0.1254902, 1,
1.911654, 1.255883, 1.192323, 1, 0, 0.1215686, 1,
1.91865, -0.9280409, 2.31326, 1, 0, 0.1137255, 1,
1.92982, -2.335911, 2.833468, 1, 0, 0.1098039, 1,
1.97401, -1.49877, 3.637013, 1, 0, 0.1019608, 1,
2.013711, 0.3609543, 1.969711, 1, 0, 0.09411765, 1,
2.039938, 1.346705, 0.5687445, 1, 0, 0.09019608, 1,
2.068927, 0.8339055, 0.5292466, 1, 0, 0.08235294, 1,
2.091697, -1.059045, 3.264385, 1, 0, 0.07843138, 1,
2.094587, 0.2443735, 2.562401, 1, 0, 0.07058824, 1,
2.107834, 0.6758507, 3.728988, 1, 0, 0.06666667, 1,
2.142312, -1.362981, 1.404902, 1, 0, 0.05882353, 1,
2.150318, 0.1843248, 0.5989938, 1, 0, 0.05490196, 1,
2.173518, 2.014149, 1.257194, 1, 0, 0.04705882, 1,
2.205285, -0.5317093, 1.711555, 1, 0, 0.04313726, 1,
2.21263, 0.406402, 1.379907, 1, 0, 0.03529412, 1,
2.385929, 0.4156104, 0.2272559, 1, 0, 0.03137255, 1,
2.47228, -0.03442734, 0.6825341, 1, 0, 0.02352941, 1,
2.742883, 0.2813434, 1.827258, 1, 0, 0.01960784, 1,
3.016966, 0.7844269, 4.45057, 1, 0, 0.01176471, 1,
3.119279, -0.2817306, 1.60249, 1, 0, 0.007843138, 1
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
0.1267412, -4.245834, -7.193434, 0, -0.5, 0.5, 0.5,
0.1267412, -4.245834, -7.193434, 1, -0.5, 0.5, 0.5,
0.1267412, -4.245834, -7.193434, 1, 1.5, 0.5, 0.5,
0.1267412, -4.245834, -7.193434, 0, 1.5, 0.5, 0.5
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
-3.880267, 0.03598595, -7.193434, 0, -0.5, 0.5, 0.5,
-3.880267, 0.03598595, -7.193434, 1, -0.5, 0.5, 0.5,
-3.880267, 0.03598595, -7.193434, 1, 1.5, 0.5, 0.5,
-3.880267, 0.03598595, -7.193434, 0, 1.5, 0.5, 0.5
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
-3.880267, -4.245834, -0.1610575, 0, -0.5, 0.5, 0.5,
-3.880267, -4.245834, -0.1610575, 1, -0.5, 0.5, 0.5,
-3.880267, -4.245834, -0.1610575, 1, 1.5, 0.5, 0.5,
-3.880267, -4.245834, -0.1610575, 0, 1.5, 0.5, 0.5
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
-2, -3.257721, -5.570578,
3, -3.257721, -5.570578,
-2, -3.257721, -5.570578,
-2, -3.422407, -5.841054,
-1, -3.257721, -5.570578,
-1, -3.422407, -5.841054,
0, -3.257721, -5.570578,
0, -3.422407, -5.841054,
1, -3.257721, -5.570578,
1, -3.422407, -5.841054,
2, -3.257721, -5.570578,
2, -3.422407, -5.841054,
3, -3.257721, -5.570578,
3, -3.422407, -5.841054
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
-2, -3.751778, -6.382006, 0, -0.5, 0.5, 0.5,
-2, -3.751778, -6.382006, 1, -0.5, 0.5, 0.5,
-2, -3.751778, -6.382006, 1, 1.5, 0.5, 0.5,
-2, -3.751778, -6.382006, 0, 1.5, 0.5, 0.5,
-1, -3.751778, -6.382006, 0, -0.5, 0.5, 0.5,
-1, -3.751778, -6.382006, 1, -0.5, 0.5, 0.5,
-1, -3.751778, -6.382006, 1, 1.5, 0.5, 0.5,
-1, -3.751778, -6.382006, 0, 1.5, 0.5, 0.5,
0, -3.751778, -6.382006, 0, -0.5, 0.5, 0.5,
0, -3.751778, -6.382006, 1, -0.5, 0.5, 0.5,
0, -3.751778, -6.382006, 1, 1.5, 0.5, 0.5,
0, -3.751778, -6.382006, 0, 1.5, 0.5, 0.5,
1, -3.751778, -6.382006, 0, -0.5, 0.5, 0.5,
1, -3.751778, -6.382006, 1, -0.5, 0.5, 0.5,
1, -3.751778, -6.382006, 1, 1.5, 0.5, 0.5,
1, -3.751778, -6.382006, 0, 1.5, 0.5, 0.5,
2, -3.751778, -6.382006, 0, -0.5, 0.5, 0.5,
2, -3.751778, -6.382006, 1, -0.5, 0.5, 0.5,
2, -3.751778, -6.382006, 1, 1.5, 0.5, 0.5,
2, -3.751778, -6.382006, 0, 1.5, 0.5, 0.5,
3, -3.751778, -6.382006, 0, -0.5, 0.5, 0.5,
3, -3.751778, -6.382006, 1, -0.5, 0.5, 0.5,
3, -3.751778, -6.382006, 1, 1.5, 0.5, 0.5,
3, -3.751778, -6.382006, 0, 1.5, 0.5, 0.5
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
-2.955573, -3, -5.570578,
-2.955573, 3, -5.570578,
-2.955573, -3, -5.570578,
-3.109689, -3, -5.841054,
-2.955573, -2, -5.570578,
-3.109689, -2, -5.841054,
-2.955573, -1, -5.570578,
-3.109689, -1, -5.841054,
-2.955573, 0, -5.570578,
-3.109689, 0, -5.841054,
-2.955573, 1, -5.570578,
-3.109689, 1, -5.841054,
-2.955573, 2, -5.570578,
-3.109689, 2, -5.841054,
-2.955573, 3, -5.570578,
-3.109689, 3, -5.841054
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
-3.41792, -3, -6.382006, 0, -0.5, 0.5, 0.5,
-3.41792, -3, -6.382006, 1, -0.5, 0.5, 0.5,
-3.41792, -3, -6.382006, 1, 1.5, 0.5, 0.5,
-3.41792, -3, -6.382006, 0, 1.5, 0.5, 0.5,
-3.41792, -2, -6.382006, 0, -0.5, 0.5, 0.5,
-3.41792, -2, -6.382006, 1, -0.5, 0.5, 0.5,
-3.41792, -2, -6.382006, 1, 1.5, 0.5, 0.5,
-3.41792, -2, -6.382006, 0, 1.5, 0.5, 0.5,
-3.41792, -1, -6.382006, 0, -0.5, 0.5, 0.5,
-3.41792, -1, -6.382006, 1, -0.5, 0.5, 0.5,
-3.41792, -1, -6.382006, 1, 1.5, 0.5, 0.5,
-3.41792, -1, -6.382006, 0, 1.5, 0.5, 0.5,
-3.41792, 0, -6.382006, 0, -0.5, 0.5, 0.5,
-3.41792, 0, -6.382006, 1, -0.5, 0.5, 0.5,
-3.41792, 0, -6.382006, 1, 1.5, 0.5, 0.5,
-3.41792, 0, -6.382006, 0, 1.5, 0.5, 0.5,
-3.41792, 1, -6.382006, 0, -0.5, 0.5, 0.5,
-3.41792, 1, -6.382006, 1, -0.5, 0.5, 0.5,
-3.41792, 1, -6.382006, 1, 1.5, 0.5, 0.5,
-3.41792, 1, -6.382006, 0, 1.5, 0.5, 0.5,
-3.41792, 2, -6.382006, 0, -0.5, 0.5, 0.5,
-3.41792, 2, -6.382006, 1, -0.5, 0.5, 0.5,
-3.41792, 2, -6.382006, 1, 1.5, 0.5, 0.5,
-3.41792, 2, -6.382006, 0, 1.5, 0.5, 0.5,
-3.41792, 3, -6.382006, 0, -0.5, 0.5, 0.5,
-3.41792, 3, -6.382006, 1, -0.5, 0.5, 0.5,
-3.41792, 3, -6.382006, 1, 1.5, 0.5, 0.5,
-3.41792, 3, -6.382006, 0, 1.5, 0.5, 0.5
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
-2.955573, -3.257721, -4,
-2.955573, -3.257721, 4,
-2.955573, -3.257721, -4,
-3.109689, -3.422407, -4,
-2.955573, -3.257721, -2,
-3.109689, -3.422407, -2,
-2.955573, -3.257721, 0,
-3.109689, -3.422407, 0,
-2.955573, -3.257721, 2,
-3.109689, -3.422407, 2,
-2.955573, -3.257721, 4,
-3.109689, -3.422407, 4
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
-3.41792, -3.751778, -4, 0, -0.5, 0.5, 0.5,
-3.41792, -3.751778, -4, 1, -0.5, 0.5, 0.5,
-3.41792, -3.751778, -4, 1, 1.5, 0.5, 0.5,
-3.41792, -3.751778, -4, 0, 1.5, 0.5, 0.5,
-3.41792, -3.751778, -2, 0, -0.5, 0.5, 0.5,
-3.41792, -3.751778, -2, 1, -0.5, 0.5, 0.5,
-3.41792, -3.751778, -2, 1, 1.5, 0.5, 0.5,
-3.41792, -3.751778, -2, 0, 1.5, 0.5, 0.5,
-3.41792, -3.751778, 0, 0, -0.5, 0.5, 0.5,
-3.41792, -3.751778, 0, 1, -0.5, 0.5, 0.5,
-3.41792, -3.751778, 0, 1, 1.5, 0.5, 0.5,
-3.41792, -3.751778, 0, 0, 1.5, 0.5, 0.5,
-3.41792, -3.751778, 2, 0, -0.5, 0.5, 0.5,
-3.41792, -3.751778, 2, 1, -0.5, 0.5, 0.5,
-3.41792, -3.751778, 2, 1, 1.5, 0.5, 0.5,
-3.41792, -3.751778, 2, 0, 1.5, 0.5, 0.5,
-3.41792, -3.751778, 4, 0, -0.5, 0.5, 0.5,
-3.41792, -3.751778, 4, 1, -0.5, 0.5, 0.5,
-3.41792, -3.751778, 4, 1, 1.5, 0.5, 0.5,
-3.41792, -3.751778, 4, 0, 1.5, 0.5, 0.5
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
-2.955573, -3.257721, -5.570578,
-2.955573, 3.329693, -5.570578,
-2.955573, -3.257721, 5.248463,
-2.955573, 3.329693, 5.248463,
-2.955573, -3.257721, -5.570578,
-2.955573, -3.257721, 5.248463,
-2.955573, 3.329693, -5.570578,
-2.955573, 3.329693, 5.248463,
-2.955573, -3.257721, -5.570578,
3.209055, -3.257721, -5.570578,
-2.955573, -3.257721, 5.248463,
3.209055, -3.257721, 5.248463,
-2.955573, 3.329693, -5.570578,
3.209055, 3.329693, -5.570578,
-2.955573, 3.329693, 5.248463,
3.209055, 3.329693, 5.248463,
3.209055, -3.257721, -5.570578,
3.209055, 3.329693, -5.570578,
3.209055, -3.257721, 5.248463,
3.209055, 3.329693, 5.248463,
3.209055, -3.257721, -5.570578,
3.209055, -3.257721, 5.248463,
3.209055, 3.329693, -5.570578,
3.209055, 3.329693, 5.248463
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
var radius = 7.522275;
var distance = 33.46745;
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
mvMatrix.translate( -0.1267412, -0.03598595, 0.1610575 );
mvMatrix.scale( 1.319338, 1.234662, 0.7517515 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.46745);
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
sec-butylamine_2-ben<-read.table("sec-butylamine_2-ben.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-sec-butylamine_2-ben$V2
```

```
## Error in eval(expr, envir, enclos): object 'sec' not found
```

```r
y<-sec-butylamine_2-ben$V3
```

```
## Error in eval(expr, envir, enclos): object 'sec' not found
```

```r
z<-sec-butylamine_2-ben$V4
```

```
## Error in eval(expr, envir, enclos): object 'sec' not found
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
-2.865797, -0.017406, -1.068423, 0, 0, 1, 1, 1,
-2.625901, 0.7559413, -1.367501, 1, 0, 0, 1, 1,
-2.492914, 0.8682913, -0.4064591, 1, 0, 0, 1, 1,
-2.368119, -1.312281, -1.765626, 1, 0, 0, 1, 1,
-2.355655, -0.8216311, -2.906163, 1, 0, 0, 1, 1,
-2.345667, 0.05603992, -2.023603, 1, 0, 0, 1, 1,
-2.322803, 0.4044441, -1.143985, 0, 0, 0, 1, 1,
-2.254725, -0.5348302, -2.961768, 0, 0, 0, 1, 1,
-2.223166, 0.1604997, -0.4951844, 0, 0, 0, 1, 1,
-2.178996, 0.6634906, -0.2999389, 0, 0, 0, 1, 1,
-2.157228, 1.78612, 0.4920177, 0, 0, 0, 1, 1,
-2.155207, 0.1830758, -0.2419805, 0, 0, 0, 1, 1,
-2.123797, 1.21931, -1.460121, 0, 0, 0, 1, 1,
-2.107207, 1.070221, -0.1130825, 1, 1, 1, 1, 1,
-2.104624, 0.5578911, -3.245893, 1, 1, 1, 1, 1,
-2.093224, -1.250526, -1.910731, 1, 1, 1, 1, 1,
-2.05286, 0.6660627, 0.248497, 1, 1, 1, 1, 1,
-2.041791, 0.5924281, -1.445897, 1, 1, 1, 1, 1,
-2.018934, 1.489186, -1.513926, 1, 1, 1, 1, 1,
-2.009841, -0.8771858, -2.525165, 1, 1, 1, 1, 1,
-2.002663, -0.7848518, -2.402601, 1, 1, 1, 1, 1,
-1.981733, 0.2607403, -0.4415946, 1, 1, 1, 1, 1,
-1.97435, -1.732615, -3.171855, 1, 1, 1, 1, 1,
-1.971871, -0.2585395, -0.4346188, 1, 1, 1, 1, 1,
-1.939364, -0.4114146, -2.298357, 1, 1, 1, 1, 1,
-1.919236, 2.049447, -1.292056, 1, 1, 1, 1, 1,
-1.894951, -0.2404466, -1.281672, 1, 1, 1, 1, 1,
-1.877758, -0.1040634, -2.714713, 1, 1, 1, 1, 1,
-1.867903, 0.9944057, -2.232506, 0, 0, 1, 1, 1,
-1.852528, -0.8214521, -2.59994, 1, 0, 0, 1, 1,
-1.848944, 0.9291992, -1.519631, 1, 0, 0, 1, 1,
-1.832947, 0.223962, -2.017403, 1, 0, 0, 1, 1,
-1.828817, 0.4145301, -1.926504, 1, 0, 0, 1, 1,
-1.828061, -0.2763167, -0.6990525, 1, 0, 0, 1, 1,
-1.825856, -0.3306161, -1.96723, 0, 0, 0, 1, 1,
-1.822808, -0.6026586, -2.910902, 0, 0, 0, 1, 1,
-1.812956, 0.5374144, -1.336019, 0, 0, 0, 1, 1,
-1.806374, -2.652746, -3.692371, 0, 0, 0, 1, 1,
-1.793029, 2.038436, -0.9782194, 0, 0, 0, 1, 1,
-1.787134, 0.7881033, -1.824187, 0, 0, 0, 1, 1,
-1.77345, 0.7303462, -2.138283, 0, 0, 0, 1, 1,
-1.763442, 2.144149, -0.5331899, 1, 1, 1, 1, 1,
-1.761746, 0.2584136, -3.638814, 1, 1, 1, 1, 1,
-1.745389, -1.663061, -3.477127, 1, 1, 1, 1, 1,
-1.743774, 0.2110545, 0.9902359, 1, 1, 1, 1, 1,
-1.729183, 0.5642956, -1.675084, 1, 1, 1, 1, 1,
-1.716584, -2.115901, -2.103819, 1, 1, 1, 1, 1,
-1.707472, 0.05151519, -2.407819, 1, 1, 1, 1, 1,
-1.686089, 0.1513649, -0.7383933, 1, 1, 1, 1, 1,
-1.66927, -0.6712016, -1.829585, 1, 1, 1, 1, 1,
-1.60355, -0.1465547, -1.89536, 1, 1, 1, 1, 1,
-1.602899, 0.827639, -0.7543872, 1, 1, 1, 1, 1,
-1.595571, -0.4192662, -1.196783, 1, 1, 1, 1, 1,
-1.588121, 0.5947965, -1.988884, 1, 1, 1, 1, 1,
-1.581174, -0.3284338, -1.972531, 1, 1, 1, 1, 1,
-1.577461, 1.673409, -0.9700432, 1, 1, 1, 1, 1,
-1.55928, -0.2680526, -1.088232, 0, 0, 1, 1, 1,
-1.542789, -0.9094159, 0.06667702, 1, 0, 0, 1, 1,
-1.526265, 0.3802263, -2.629076, 1, 0, 0, 1, 1,
-1.525613, -0.111226, -2.291918, 1, 0, 0, 1, 1,
-1.49695, 0.002184099, -1.912137, 1, 0, 0, 1, 1,
-1.484694, -0.5106637, -1.939492, 1, 0, 0, 1, 1,
-1.476791, -0.06024469, -1.333891, 0, 0, 0, 1, 1,
-1.471109, 1.408768, -1.318925, 0, 0, 0, 1, 1,
-1.470999, 0.1406181, -2.182916, 0, 0, 0, 1, 1,
-1.468827, 1.765438, -0.5645868, 0, 0, 0, 1, 1,
-1.464654, -0.6622922, -1.719348, 0, 0, 0, 1, 1,
-1.458987, 0.4734945, -0.6686482, 0, 0, 0, 1, 1,
-1.457303, -0.5173371, -0.9151341, 0, 0, 0, 1, 1,
-1.445529, -0.1931508, -1.478882, 1, 1, 1, 1, 1,
-1.444698, 1.23127, -1.827056, 1, 1, 1, 1, 1,
-1.443953, -0.1789448, -1.765465, 1, 1, 1, 1, 1,
-1.442834, -0.5498357, -3.39534, 1, 1, 1, 1, 1,
-1.440185, 0.3294123, -1.11719, 1, 1, 1, 1, 1,
-1.438357, -1.837508, -1.605198, 1, 1, 1, 1, 1,
-1.438082, 0.1475447, -2.658874, 1, 1, 1, 1, 1,
-1.437878, -0.5839823, -2.677109, 1, 1, 1, 1, 1,
-1.433914, 0.4880069, -3.326944, 1, 1, 1, 1, 1,
-1.421686, -1.056099, -3.573497, 1, 1, 1, 1, 1,
-1.407987, -0.3437726, -0.5152791, 1, 1, 1, 1, 1,
-1.397744, 1.091338, -0.4353619, 1, 1, 1, 1, 1,
-1.391731, -0.6031651, -3.04969, 1, 1, 1, 1, 1,
-1.391091, 0.2064655, -2.628442, 1, 1, 1, 1, 1,
-1.388492, -0.8556119, -2.982772, 1, 1, 1, 1, 1,
-1.384886, -0.7848334, -2.562311, 0, 0, 1, 1, 1,
-1.372666, -1.0234, -2.61454, 1, 0, 0, 1, 1,
-1.372105, 1.208445, -1.721955, 1, 0, 0, 1, 1,
-1.370557, -0.3282057, -1.49144, 1, 0, 0, 1, 1,
-1.354689, -1.583282, -1.473325, 1, 0, 0, 1, 1,
-1.349909, 0.3798811, -1.342178, 1, 0, 0, 1, 1,
-1.349295, 0.9305059, -0.362414, 0, 0, 0, 1, 1,
-1.344203, 0.8782402, 1.014642, 0, 0, 0, 1, 1,
-1.341923, -0.0937883, -0.5088589, 0, 0, 0, 1, 1,
-1.34107, 0.1169951, -2.166281, 0, 0, 0, 1, 1,
-1.330305, 0.0177487, -2.222839, 0, 0, 0, 1, 1,
-1.321229, 0.00655919, -0.9073035, 0, 0, 0, 1, 1,
-1.315706, -0.1850459, -0.6095231, 0, 0, 0, 1, 1,
-1.31302, -1.079534, -0.8662282, 1, 1, 1, 1, 1,
-1.312334, 0.1945596, -2.734198, 1, 1, 1, 1, 1,
-1.301882, -0.2589244, -0.7749804, 1, 1, 1, 1, 1,
-1.298125, 2.237517, -1.494912, 1, 1, 1, 1, 1,
-1.288744, 1.412198, -1.959363, 1, 1, 1, 1, 1,
-1.28804, -0.1714777, -1.009539, 1, 1, 1, 1, 1,
-1.278164, -1.622259, -2.40743, 1, 1, 1, 1, 1,
-1.273201, 0.1242065, 1.688952, 1, 1, 1, 1, 1,
-1.271679, -0.6559767, -1.449299, 1, 1, 1, 1, 1,
-1.256549, -1.322573, -2.579546, 1, 1, 1, 1, 1,
-1.250613, 0.1748046, -1.999432, 1, 1, 1, 1, 1,
-1.228028, -1.345023, -3.131446, 1, 1, 1, 1, 1,
-1.218782, -0.1481766, -2.824167, 1, 1, 1, 1, 1,
-1.197539, 1.962692, 2.214376, 1, 1, 1, 1, 1,
-1.196178, -3.161788, -1.679494, 1, 1, 1, 1, 1,
-1.187381, 0.9094193, -0.3505073, 0, 0, 1, 1, 1,
-1.181767, 0.6613882, -0.2408816, 1, 0, 0, 1, 1,
-1.178366, 0.1260962, -1.505616, 1, 0, 0, 1, 1,
-1.167917, 1.030026, -1.057097, 1, 0, 0, 1, 1,
-1.163108, 0.5342981, -0.2560821, 1, 0, 0, 1, 1,
-1.156286, -1.591129, -2.662884, 1, 0, 0, 1, 1,
-1.154348, -0.0864251, -1.695304, 0, 0, 0, 1, 1,
-1.150312, -1.603558, -3.264073, 0, 0, 0, 1, 1,
-1.143566, -0.450252, -3.201564, 0, 0, 0, 1, 1,
-1.139241, 0.06044837, -1.206107, 0, 0, 0, 1, 1,
-1.132714, 0.2029239, -2.668262, 0, 0, 0, 1, 1,
-1.131068, 1.805007, -0.3563594, 0, 0, 0, 1, 1,
-1.129501, -0.128213, -2.104853, 0, 0, 0, 1, 1,
-1.128751, 0.1712397, -1.933942, 1, 1, 1, 1, 1,
-1.119961, 0.7562899, -0.6745717, 1, 1, 1, 1, 1,
-1.11631, -1.343467, -1.227123, 1, 1, 1, 1, 1,
-1.109296, -1.637514, -1.674753, 1, 1, 1, 1, 1,
-1.100715, 0.8075916, -0.9004732, 1, 1, 1, 1, 1,
-1.085116, -0.7558908, -2.327391, 1, 1, 1, 1, 1,
-1.081326, -0.6007677, -2.146006, 1, 1, 1, 1, 1,
-1.075864, -1.444754, -2.014945, 1, 1, 1, 1, 1,
-1.074751, -2.258678, -1.253219, 1, 1, 1, 1, 1,
-1.069052, -0.3621671, -0.3625335, 1, 1, 1, 1, 1,
-1.067865, 0.9806013, -1.071092, 1, 1, 1, 1, 1,
-1.065773, 0.8624396, -1.169289, 1, 1, 1, 1, 1,
-1.063135, -1.211797, -2.225094, 1, 1, 1, 1, 1,
-1.062769, 0.2491429, -0.7348654, 1, 1, 1, 1, 1,
-1.060807, -0.7606049, -2.971393, 1, 1, 1, 1, 1,
-1.054954, 0.9910949, 0.4395041, 0, 0, 1, 1, 1,
-1.053931, -1.075002, -1.623248, 1, 0, 0, 1, 1,
-1.053281, -0.1466654, -0.6219243, 1, 0, 0, 1, 1,
-1.05113, 1.755907, -0.7718052, 1, 0, 0, 1, 1,
-1.046888, 0.5309101, -0.006225329, 1, 0, 0, 1, 1,
-1.045723, -0.02656996, -1.729321, 1, 0, 0, 1, 1,
-1.037293, -0.8205335, -3.051318, 0, 0, 0, 1, 1,
-1.033235, -1.813741, -5.189651, 0, 0, 0, 1, 1,
-1.032627, 2.731512, -0.9370549, 0, 0, 0, 1, 1,
-1.030424, 0.4891765, 1.357937, 0, 0, 0, 1, 1,
-1.020096, 0.6072062, -1.384631, 0, 0, 0, 1, 1,
-1.018891, -0.2521038, -4.053882, 0, 0, 0, 1, 1,
-1.018456, -2.860579, -1.875815, 0, 0, 0, 1, 1,
-1.016944, 0.3777935, -1.736097, 1, 1, 1, 1, 1,
-1.015018, 0.7695879, 0.302309, 1, 1, 1, 1, 1,
-1.011822, 1.481515, 1.186422, 1, 1, 1, 1, 1,
-1.007039, 0.720396, -0.3409741, 1, 1, 1, 1, 1,
-1.007003, 0.7207311, -1.130306, 1, 1, 1, 1, 1,
-1.006148, 0.194397, -2.26333, 1, 1, 1, 1, 1,
-0.9979805, -0.5701826, -2.075153, 1, 1, 1, 1, 1,
-0.9973038, 0.1549041, -0.3748318, 1, 1, 1, 1, 1,
-0.9963106, -0.2366282, -4.198036, 1, 1, 1, 1, 1,
-0.9958809, 0.3068266, -3.017446, 1, 1, 1, 1, 1,
-0.9955706, -0.5110657, -1.912355, 1, 1, 1, 1, 1,
-0.9912083, 0.7674685, -0.9539484, 1, 1, 1, 1, 1,
-0.9880802, 0.5764291, -1.824988, 1, 1, 1, 1, 1,
-0.9865423, 0.9560747, -2.973481, 1, 1, 1, 1, 1,
-0.9817215, -0.003039043, -3.110064, 1, 1, 1, 1, 1,
-0.9803346, 0.6695024, -0.5391994, 0, 0, 1, 1, 1,
-0.9797351, -0.8705031, -0.4783579, 1, 0, 0, 1, 1,
-0.9670057, -0.8098402, -2.766213, 1, 0, 0, 1, 1,
-0.9657059, 0.6147531, -0.02601598, 1, 0, 0, 1, 1,
-0.9640164, -0.7890631, -3.169631, 1, 0, 0, 1, 1,
-0.9519333, -0.454017, -1.438514, 1, 0, 0, 1, 1,
-0.9502512, 0.3666726, -1.690073, 0, 0, 0, 1, 1,
-0.9433269, 0.4807922, -0.1984348, 0, 0, 0, 1, 1,
-0.9412526, -0.6736596, -1.747724, 0, 0, 0, 1, 1,
-0.939806, 0.1621423, -1.67648, 0, 0, 0, 1, 1,
-0.9216825, 1.313428, 0.3510916, 0, 0, 0, 1, 1,
-0.9166197, 0.6477463, -0.1856028, 0, 0, 0, 1, 1,
-0.9149553, 0.1247296, -1.538409, 0, 0, 0, 1, 1,
-0.9085953, -0.6741685, -3.097702, 1, 1, 1, 1, 1,
-0.9067367, 0.5802794, 0.1901816, 1, 1, 1, 1, 1,
-0.9066985, 1.041752, -2.019017, 1, 1, 1, 1, 1,
-0.9017889, 0.5386519, -0.5983946, 1, 1, 1, 1, 1,
-0.9017776, -0.6409925, -2.104467, 1, 1, 1, 1, 1,
-0.8947747, -0.4068076, -1.607921, 1, 1, 1, 1, 1,
-0.8938572, 0.4426159, -1.289707, 1, 1, 1, 1, 1,
-0.8938299, 0.6738193, -2.311162, 1, 1, 1, 1, 1,
-0.8904013, -2.651682, -3.252444, 1, 1, 1, 1, 1,
-0.8891684, 0.3579104, -2.381489, 1, 1, 1, 1, 1,
-0.8873844, 0.3004352, -0.5771478, 1, 1, 1, 1, 1,
-0.8816898, -0.6442941, -1.521791, 1, 1, 1, 1, 1,
-0.8761155, 0.4111176, -0.5334057, 1, 1, 1, 1, 1,
-0.8671169, 0.9414592, -0.3923144, 1, 1, 1, 1, 1,
-0.8647226, 0.565547, 0.08756506, 1, 1, 1, 1, 1,
-0.8583288, -0.126737, -0.9447381, 0, 0, 1, 1, 1,
-0.8525161, 1.676774, -1.490455, 1, 0, 0, 1, 1,
-0.8514292, 1.527262, -0.529974, 1, 0, 0, 1, 1,
-0.8450289, -1.009507, -3.246979, 1, 0, 0, 1, 1,
-0.8435593, 1.149995, 0.3169148, 1, 0, 0, 1, 1,
-0.8381163, 0.531467, -1.879301, 1, 0, 0, 1, 1,
-0.8352628, 0.7459578, -0.5507005, 0, 0, 0, 1, 1,
-0.8288696, -0.3992316, -3.408825, 0, 0, 0, 1, 1,
-0.823374, 0.2029263, -1.854239, 0, 0, 0, 1, 1,
-0.8146587, 1.177128, -0.1818043, 0, 0, 0, 1, 1,
-0.81246, 1.12817, 1.030621, 0, 0, 0, 1, 1,
-0.8106955, -1.000096, -0.5105477, 0, 0, 0, 1, 1,
-0.8104532, -0.2750737, -3.132776, 0, 0, 0, 1, 1,
-0.8030067, 0.297307, -1.082794, 1, 1, 1, 1, 1,
-0.7966557, 0.28104, -1.706045, 1, 1, 1, 1, 1,
-0.7902346, 0.9143791, 0.06466204, 1, 1, 1, 1, 1,
-0.7882926, 0.412404, -3.411591, 1, 1, 1, 1, 1,
-0.7851372, 0.288848, -2.954483, 1, 1, 1, 1, 1,
-0.7850113, -0.5263816, -2.075037, 1, 1, 1, 1, 1,
-0.7780022, -0.4499624, -1.471803, 1, 1, 1, 1, 1,
-0.7758709, -0.7541018, -3.731396, 1, 1, 1, 1, 1,
-0.7705013, -0.3773782, -1.445088, 1, 1, 1, 1, 1,
-0.766229, -0.4957618, -1.892148, 1, 1, 1, 1, 1,
-0.764421, -0.8258842, -2.104281, 1, 1, 1, 1, 1,
-0.7626118, 1.042211, -0.9435524, 1, 1, 1, 1, 1,
-0.7582861, 1.225795, -0.2805962, 1, 1, 1, 1, 1,
-0.7562681, -1.100376, -2.992015, 1, 1, 1, 1, 1,
-0.7433223, -1.959325, -3.786812, 1, 1, 1, 1, 1,
-0.7389637, -0.4390135, -2.591385, 0, 0, 1, 1, 1,
-0.7365401, -1.339345, -1.57458, 1, 0, 0, 1, 1,
-0.7306969, 0.4857078, -0.3436872, 1, 0, 0, 1, 1,
-0.7236, -0.2086309, -1.594294, 1, 0, 0, 1, 1,
-0.7232646, 0.04719406, -2.893068, 1, 0, 0, 1, 1,
-0.7196447, -0.2971894, -1.023149, 1, 0, 0, 1, 1,
-0.7123864, 0.2203232, -0.7571831, 0, 0, 0, 1, 1,
-0.7123861, -0.1867927, -2.79702, 0, 0, 0, 1, 1,
-0.7117861, 0.6374471, 0.3591056, 0, 0, 0, 1, 1,
-0.7091631, -1.704486, -3.76323, 0, 0, 0, 1, 1,
-0.704973, -0.8186185, -3.012044, 0, 0, 0, 1, 1,
-0.702437, -0.3654847, -2.56715, 0, 0, 0, 1, 1,
-0.7008642, -0.3836105, -2.086452, 0, 0, 0, 1, 1,
-0.6992379, -0.1343418, -3.30939, 1, 1, 1, 1, 1,
-0.6914145, -0.9237436, -1.865571, 1, 1, 1, 1, 1,
-0.6912109, 1.269576, 0.04247152, 1, 1, 1, 1, 1,
-0.6897079, -0.3659612, -2.610615, 1, 1, 1, 1, 1,
-0.6757807, 0.8176979, 0.1276884, 1, 1, 1, 1, 1,
-0.6757143, 0.9921303, 0.1446475, 1, 1, 1, 1, 1,
-0.6689597, -0.6256189, -3.495583, 1, 1, 1, 1, 1,
-0.6613083, 1.140026, -0.7374313, 1, 1, 1, 1, 1,
-0.6586216, -0.1537672, -2.578985, 1, 1, 1, 1, 1,
-0.6535952, -0.1585625, -1.681954, 1, 1, 1, 1, 1,
-0.6515, -0.2326031, -0.7300131, 1, 1, 1, 1, 1,
-0.6495246, -0.6382169, -1.525625, 1, 1, 1, 1, 1,
-0.6395255, -1.58235, -3.399419, 1, 1, 1, 1, 1,
-0.6357341, 0.6485757, -0.439742, 1, 1, 1, 1, 1,
-0.6349784, -0.2665415, -2.067717, 1, 1, 1, 1, 1,
-0.633149, -0.9763508, -3.12933, 0, 0, 1, 1, 1,
-0.6275299, -0.7278845, -2.049753, 1, 0, 0, 1, 1,
-0.6171895, 0.548306, -2.035028, 1, 0, 0, 1, 1,
-0.6166809, 0.3247626, -0.3306163, 1, 0, 0, 1, 1,
-0.6160473, -1.767484, -4.012475, 1, 0, 0, 1, 1,
-0.6159779, 0.2906673, -0.5243748, 1, 0, 0, 1, 1,
-0.6154498, -2.039781, -2.46389, 0, 0, 0, 1, 1,
-0.606465, -0.1978977, -1.95345, 0, 0, 0, 1, 1,
-0.6002772, 0.5058885, 0.2076202, 0, 0, 0, 1, 1,
-0.5841292, -0.8216799, -3.816982, 0, 0, 0, 1, 1,
-0.5795951, -0.8999843, -3.386902, 0, 0, 0, 1, 1,
-0.5753632, 0.1926155, -1.441696, 0, 0, 0, 1, 1,
-0.5752746, 1.098738, -0.6857584, 0, 0, 0, 1, 1,
-0.570426, -2.185995, -2.563827, 1, 1, 1, 1, 1,
-0.5698072, -0.6578212, -3.910912, 1, 1, 1, 1, 1,
-0.5688735, -0.7687886, 0.2351168, 1, 1, 1, 1, 1,
-0.5626761, -0.1018688, -1.217362, 1, 1, 1, 1, 1,
-0.5621345, 1.039661, -1.803473, 1, 1, 1, 1, 1,
-0.5618609, -2.202776, -3.233836, 1, 1, 1, 1, 1,
-0.5566518, -1.27825, -4.092402, 1, 1, 1, 1, 1,
-0.5562297, -0.3482111, -1.202634, 1, 1, 1, 1, 1,
-0.5525483, -0.8126451, -1.641997, 1, 1, 1, 1, 1,
-0.5405473, -1.408269, -1.551505, 1, 1, 1, 1, 1,
-0.5375504, 0.5098311, -0.8504479, 1, 1, 1, 1, 1,
-0.5356199, 1.894186, -2.110281, 1, 1, 1, 1, 1,
-0.5354998, 0.1667628, -0.1500928, 1, 1, 1, 1, 1,
-0.5353464, -0.2249511, -1.372267, 1, 1, 1, 1, 1,
-0.5318534, 0.7711329, -1.53036, 1, 1, 1, 1, 1,
-0.5308452, 0.7153659, -1.537516, 0, 0, 1, 1, 1,
-0.5305104, 1.342328, -2.181075, 1, 0, 0, 1, 1,
-0.5296005, -0.5146028, -2.494164, 1, 0, 0, 1, 1,
-0.5290477, -0.4005742, -2.536091, 1, 0, 0, 1, 1,
-0.517315, -0.6925308, -2.303791, 1, 0, 0, 1, 1,
-0.5151663, 0.9150102, 0.3670664, 1, 0, 0, 1, 1,
-0.5135087, 1.148265, -0.7003228, 0, 0, 0, 1, 1,
-0.5126069, 0.2468105, 0.01801982, 0, 0, 0, 1, 1,
-0.5107299, 1.206968, -0.8983046, 0, 0, 0, 1, 1,
-0.5097342, -0.3140262, -2.837687, 0, 0, 0, 1, 1,
-0.5089172, -0.3145181, -2.956979, 0, 0, 0, 1, 1,
-0.5055459, 0.1344832, -3.879825, 0, 0, 0, 1, 1,
-0.5031455, 0.2145082, -4.272377, 0, 0, 0, 1, 1,
-0.5030623, -0.9961205, -2.884022, 1, 1, 1, 1, 1,
-0.5019615, 0.2632641, -0.3482609, 1, 1, 1, 1, 1,
-0.4991978, 1.018833, -1.044788, 1, 1, 1, 1, 1,
-0.4953104, 0.9241491, 0.2983434, 1, 1, 1, 1, 1,
-0.4933168, -0.3453402, -1.820039, 1, 1, 1, 1, 1,
-0.4891494, -0.9146608, -3.285123, 1, 1, 1, 1, 1,
-0.4850162, -0.8541507, -3.488017, 1, 1, 1, 1, 1,
-0.4842128, -0.4516449, -3.587406, 1, 1, 1, 1, 1,
-0.4837769, 0.3454549, -1.330138, 1, 1, 1, 1, 1,
-0.4785562, -0.1528165, -1.632184, 1, 1, 1, 1, 1,
-0.4764242, 0.5393654, -0.518055, 1, 1, 1, 1, 1,
-0.4761533, 1.483468, 0.08575859, 1, 1, 1, 1, 1,
-0.4746647, -0.1573995, -1.437991, 1, 1, 1, 1, 1,
-0.4657364, 0.6638243, -2.161796, 1, 1, 1, 1, 1,
-0.4655527, 0.4418578, -1.518403, 1, 1, 1, 1, 1,
-0.4638232, -0.5163102, -2.420142, 0, 0, 1, 1, 1,
-0.4614848, -0.1066227, -2.829136, 1, 0, 0, 1, 1,
-0.4562111, 0.1665495, -1.824962, 1, 0, 0, 1, 1,
-0.4537306, 0.6950966, -3.221903, 1, 0, 0, 1, 1,
-0.4439759, 1.603254, 0.9936873, 1, 0, 0, 1, 1,
-0.4433502, -0.9302506, -3.368473, 1, 0, 0, 1, 1,
-0.4418418, -1.920438, -2.707582, 0, 0, 0, 1, 1,
-0.4395986, -0.5850531, -3.282612, 0, 0, 0, 1, 1,
-0.4382224, -0.3272513, -1.362018, 0, 0, 0, 1, 1,
-0.4375383, -0.421125, -3.511369, 0, 0, 0, 1, 1,
-0.4371407, 0.6574505, -0.6982663, 0, 0, 0, 1, 1,
-0.4337975, -0.2067135, -1.41964, 0, 0, 0, 1, 1,
-0.4296465, -0.2787234, -2.082262, 0, 0, 0, 1, 1,
-0.4282373, 0.3966458, -0.9012926, 1, 1, 1, 1, 1,
-0.4255106, -0.1806754, 0.6066428, 1, 1, 1, 1, 1,
-0.4193781, 0.4684184, -1.341447, 1, 1, 1, 1, 1,
-0.4193203, 1.347405, -2.86632, 1, 1, 1, 1, 1,
-0.4184757, 1.395193, -0.8397096, 1, 1, 1, 1, 1,
-0.4183199, -0.5636785, -2.811578, 1, 1, 1, 1, 1,
-0.4147662, 0.8091804, -1.461204, 1, 1, 1, 1, 1,
-0.4131705, 0.5115992, -0.002907362, 1, 1, 1, 1, 1,
-0.4123162, -0.1084799, -1.35597, 1, 1, 1, 1, 1,
-0.4087293, 0.1167264, -1.934036, 1, 1, 1, 1, 1,
-0.4037341, 0.6782745, -0.3139501, 1, 1, 1, 1, 1,
-0.3987221, -0.7515679, -1.923347, 1, 1, 1, 1, 1,
-0.3982082, -0.8186856, -2.60077, 1, 1, 1, 1, 1,
-0.3870783, -0.2586847, -4.20974, 1, 1, 1, 1, 1,
-0.386041, 0.4808535, -1.277256, 1, 1, 1, 1, 1,
-0.382949, -2.303752, -3.161099, 0, 0, 1, 1, 1,
-0.3800129, 0.9770853, -1.201003, 1, 0, 0, 1, 1,
-0.378022, -0.06739083, -1.627068, 1, 0, 0, 1, 1,
-0.3723377, -0.8110178, -4.31187, 1, 0, 0, 1, 1,
-0.3701981, 2.293321, -1.037068, 1, 0, 0, 1, 1,
-0.3689378, -0.6087272, 0.1622882, 1, 0, 0, 1, 1,
-0.3686166, -0.8131386, -0.4692522, 0, 0, 0, 1, 1,
-0.3672929, 1.050767, -0.4835215, 0, 0, 0, 1, 1,
-0.3663637, -0.04477788, -1.86716, 0, 0, 0, 1, 1,
-0.3657479, -1.236245, -1.646008, 0, 0, 0, 1, 1,
-0.3600444, 0.6247585, -0.1755924, 0, 0, 0, 1, 1,
-0.3543545, -0.350511, -2.569352, 0, 0, 0, 1, 1,
-0.3523095, 0.1492383, -3.604238, 0, 0, 0, 1, 1,
-0.3511635, 0.561222, -0.274529, 1, 1, 1, 1, 1,
-0.3479804, -0.8855587, -3.128812, 1, 1, 1, 1, 1,
-0.345539, 0.2139856, -2.077801, 1, 1, 1, 1, 1,
-0.3449738, 1.397876, -0.9780026, 1, 1, 1, 1, 1,
-0.3429812, -0.04599618, -3.888794, 1, 1, 1, 1, 1,
-0.3422552, -1.411279, -1.861672, 1, 1, 1, 1, 1,
-0.34126, -0.4108694, -3.008782, 1, 1, 1, 1, 1,
-0.3405222, 0.7289162, -0.037764, 1, 1, 1, 1, 1,
-0.3398136, -0.4131604, -2.023959, 1, 1, 1, 1, 1,
-0.3389862, 0.8758109, -0.5008296, 1, 1, 1, 1, 1,
-0.3381428, -0.3395892, -2.956444, 1, 1, 1, 1, 1,
-0.3376729, -0.2340719, 0.2451205, 1, 1, 1, 1, 1,
-0.3365218, -0.01135963, -1.865845, 1, 1, 1, 1, 1,
-0.3348449, -0.3241642, -0.5665182, 1, 1, 1, 1, 1,
-0.329814, 0.4424987, 0.0927813, 1, 1, 1, 1, 1,
-0.3294858, 0.2691719, -2.09632, 0, 0, 1, 1, 1,
-0.3256411, -0.4293835, -2.288832, 1, 0, 0, 1, 1,
-0.325256, -0.5187621, -2.329652, 1, 0, 0, 1, 1,
-0.3214523, 0.81591, -0.1782295, 1, 0, 0, 1, 1,
-0.3120308, 0.3534899, 0.002692932, 1, 0, 0, 1, 1,
-0.3117815, -0.951752, -2.687578, 1, 0, 0, 1, 1,
-0.3117521, -0.1408249, -0.7884781, 0, 0, 0, 1, 1,
-0.308865, -0.5116088, -1.893009, 0, 0, 0, 1, 1,
-0.3087931, 1.373507, -1.371247, 0, 0, 0, 1, 1,
-0.3078895, 1.09228, 1.01809, 0, 0, 0, 1, 1,
-0.3075198, 0.767772, 0.1452368, 0, 0, 0, 1, 1,
-0.3062142, 1.035507, 0.4237675, 0, 0, 0, 1, 1,
-0.3032483, 1.571656, 0.8244374, 0, 0, 0, 1, 1,
-0.301506, 0.1644547, 1.776429, 1, 1, 1, 1, 1,
-0.3005766, 0.9819095, -0.5806088, 1, 1, 1, 1, 1,
-0.2964491, -0.8492019, -2.029423, 1, 1, 1, 1, 1,
-0.2958051, -0.4028655, -1.058643, 1, 1, 1, 1, 1,
-0.2954272, -0.05665766, -1.744292, 1, 1, 1, 1, 1,
-0.2916014, -1.916301, -4.226411, 1, 1, 1, 1, 1,
-0.2885568, 1.071583, -0.428221, 1, 1, 1, 1, 1,
-0.2853055, 0.4925609, -0.5870025, 1, 1, 1, 1, 1,
-0.2846773, -0.002988875, -1.233607, 1, 1, 1, 1, 1,
-0.2793145, 0.2535473, -1.084341, 1, 1, 1, 1, 1,
-0.2748102, 0.5520044, 0.4012127, 1, 1, 1, 1, 1,
-0.2720448, -1.887423, -3.506543, 1, 1, 1, 1, 1,
-0.2667923, 0.7439446, -1.411918, 1, 1, 1, 1, 1,
-0.2666933, 2.414993, -0.4854249, 1, 1, 1, 1, 1,
-0.2625571, 0.05884866, -0.7220158, 1, 1, 1, 1, 1,
-0.262232, 1.780647, 0.467418, 0, 0, 1, 1, 1,
-0.261597, -0.4663384, -3.418783, 1, 0, 0, 1, 1,
-0.2606758, -0.4284824, -1.217213, 1, 0, 0, 1, 1,
-0.2561107, -1.084432, -4.200383, 1, 0, 0, 1, 1,
-0.2535031, -0.2815909, -2.315216, 1, 0, 0, 1, 1,
-0.251528, -2.653074, -2.51754, 1, 0, 0, 1, 1,
-0.2463297, 0.558287, -2.553663, 0, 0, 0, 1, 1,
-0.2444641, 1.56952, 0.4018388, 0, 0, 0, 1, 1,
-0.2416005, 1.241584, 2.168299, 0, 0, 0, 1, 1,
-0.2413784, -0.9686577, -2.878597, 0, 0, 0, 1, 1,
-0.2402386, 0.9496594, -0.3135056, 0, 0, 0, 1, 1,
-0.2387145, -0.4814307, -3.371321, 0, 0, 0, 1, 1,
-0.2364714, 1.70414, -2.128502, 0, 0, 0, 1, 1,
-0.232795, -0.7140917, -1.726438, 1, 1, 1, 1, 1,
-0.2324468, 0.2817959, -0.6683344, 1, 1, 1, 1, 1,
-0.2274469, 0.8049291, 0.2081406, 1, 1, 1, 1, 1,
-0.2266228, -0.3585422, -2.762044, 1, 1, 1, 1, 1,
-0.2246811, 1.391276, 1.357111, 1, 1, 1, 1, 1,
-0.2233677, -0.6967615, -0.5375204, 1, 1, 1, 1, 1,
-0.21388, -0.5795872, -3.907838, 1, 1, 1, 1, 1,
-0.2109589, -0.2049398, -2.070069, 1, 1, 1, 1, 1,
-0.2078185, 1.155082, 0.5749091, 1, 1, 1, 1, 1,
-0.2077093, -1.01092, -2.036791, 1, 1, 1, 1, 1,
-0.2072884, 0.3289011, 0.2879291, 1, 1, 1, 1, 1,
-0.206007, -0.2427218, -2.439581, 1, 1, 1, 1, 1,
-0.2059083, -0.3331567, -3.373302, 1, 1, 1, 1, 1,
-0.2027907, -0.9828047, -3.314462, 1, 1, 1, 1, 1,
-0.2027355, -0.452873, -3.897862, 1, 1, 1, 1, 1,
-0.202142, 1.025277, -0.2968719, 0, 0, 1, 1, 1,
-0.2012616, -0.8495381, -3.899796, 1, 0, 0, 1, 1,
-0.1957129, -1.129957, -3.232525, 1, 0, 0, 1, 1,
-0.1822663, -0.04824485, -2.075612, 1, 0, 0, 1, 1,
-0.1817182, -1.277003, -3.383998, 1, 0, 0, 1, 1,
-0.1803206, 0.09288301, 0.5321794, 1, 0, 0, 1, 1,
-0.17874, -0.02769158, -1.090505, 0, 0, 0, 1, 1,
-0.1775619, -0.2818866, -0.9050794, 0, 0, 0, 1, 1,
-0.1736232, -1.160272, -3.187132, 0, 0, 0, 1, 1,
-0.1724618, -0.957423, -2.830617, 0, 0, 0, 1, 1,
-0.1705099, 0.1718486, -1.665086, 0, 0, 0, 1, 1,
-0.1688778, -1.159361, -4.332663, 0, 0, 0, 1, 1,
-0.1670179, 0.2255998, 0.1585865, 0, 0, 0, 1, 1,
-0.1659806, -0.9097512, -3.532979, 1, 1, 1, 1, 1,
-0.1633083, -0.3604877, -3.408771, 1, 1, 1, 1, 1,
-0.161443, 0.1599098, 0.2045233, 1, 1, 1, 1, 1,
-0.1578839, 0.2226286, 0.317042, 1, 1, 1, 1, 1,
-0.154133, 0.5670546, 1.058835, 1, 1, 1, 1, 1,
-0.152601, 0.577117, -0.1913576, 1, 1, 1, 1, 1,
-0.1509382, -0.2706366, -2.238416, 1, 1, 1, 1, 1,
-0.148637, 0.8664976, 0.06266133, 1, 1, 1, 1, 1,
-0.1434499, -0.6496044, -3.275104, 1, 1, 1, 1, 1,
-0.1395372, 0.5799915, 1.242711, 1, 1, 1, 1, 1,
-0.1351501, -0.6576489, -2.563863, 1, 1, 1, 1, 1,
-0.1302366, 0.6026583, 0.04464946, 1, 1, 1, 1, 1,
-0.1260962, 0.4204667, 1.448188, 1, 1, 1, 1, 1,
-0.1248703, 0.5247228, -2.399036, 1, 1, 1, 1, 1,
-0.120208, -1.948646, -1.399268, 1, 1, 1, 1, 1,
-0.1128698, 0.3511997, -0.4793992, 0, 0, 1, 1, 1,
-0.1102389, -0.6120479, -4.403155, 1, 0, 0, 1, 1,
-0.1082058, 0.6319894, -1.328108, 1, 0, 0, 1, 1,
-0.1081648, -0.7911646, -4.185643, 1, 0, 0, 1, 1,
-0.1070413, -0.8876039, -2.280399, 1, 0, 0, 1, 1,
-0.09860758, 0.1452063, -1.288684, 1, 0, 0, 1, 1,
-0.09367608, -0.07569268, -2.496847, 0, 0, 0, 1, 1,
-0.09111801, 1.760519, -0.7406506, 0, 0, 0, 1, 1,
-0.08975436, 0.5768868, -2.42975, 0, 0, 0, 1, 1,
-0.08792041, 1.073052, -1.096311, 0, 0, 0, 1, 1,
-0.08679724, -0.5401152, -2.362056, 0, 0, 0, 1, 1,
-0.07857344, 1.848482, -0.907773, 0, 0, 0, 1, 1,
-0.076179, 1.236989, -0.9300882, 0, 0, 0, 1, 1,
-0.07080013, 0.4462337, 0.3977687, 1, 1, 1, 1, 1,
-0.07044216, -0.2844976, -0.7046497, 1, 1, 1, 1, 1,
-0.07024639, 0.9133103, -0.8126279, 1, 1, 1, 1, 1,
-0.06989054, 2.994833, -0.4288357, 1, 1, 1, 1, 1,
-0.06928415, -0.4534959, -3.279588, 1, 1, 1, 1, 1,
-0.06914735, -0.2506036, -4.207217, 1, 1, 1, 1, 1,
-0.06709601, -1.303022, -2.691211, 1, 1, 1, 1, 1,
-0.06625498, 0.2905301, -1.206215, 1, 1, 1, 1, 1,
-0.06548487, 0.736506, 0.7736183, 1, 1, 1, 1, 1,
-0.0549663, -1.104476, -3.656988, 1, 1, 1, 1, 1,
-0.05342257, 0.4655755, -0.7136249, 1, 1, 1, 1, 1,
-0.05150373, 0.5927413, -0.460162, 1, 1, 1, 1, 1,
-0.05029708, 0.3738562, 0.0576561, 1, 1, 1, 1, 1,
-0.0470993, -1.811547, -3.692694, 1, 1, 1, 1, 1,
-0.04600193, -1.59768, -3.491718, 1, 1, 1, 1, 1,
-0.04271157, 0.911093, 0.06746708, 0, 0, 1, 1, 1,
-0.0422055, 1.975864, -1.436886, 1, 0, 0, 1, 1,
-0.03914195, -0.4437862, -3.405923, 1, 0, 0, 1, 1,
-0.03850233, 1.102722, -0.601516, 1, 0, 0, 1, 1,
-0.03694965, 0.848681, -0.4052081, 1, 0, 0, 1, 1,
-0.03436921, -0.2199947, -3.125638, 1, 0, 0, 1, 1,
-0.02761883, -0.4338986, -3.796612, 0, 0, 0, 1, 1,
-0.02706054, 0.9075621, 0.7135819, 0, 0, 0, 1, 1,
-0.02404968, 0.1503493, -1.042003, 0, 0, 0, 1, 1,
-0.02328259, 0.3549769, -2.177966, 0, 0, 0, 1, 1,
-0.02191257, 0.5668879, -0.4805428, 0, 0, 0, 1, 1,
-0.02068489, 0.7936243, 0.04723291, 0, 0, 0, 1, 1,
-0.01881808, 2.262039, 0.1653229, 0, 0, 0, 1, 1,
-0.01239767, -1.491361, -2.978614, 1, 1, 1, 1, 1,
-0.008588098, -1.437662, -3.114908, 1, 1, 1, 1, 1,
-0.005581658, -0.8296815, -5.413019, 1, 1, 1, 1, 1,
-0.0004955415, 1.103675, 0.5577117, 1, 1, 1, 1, 1,
0.003729176, 0.3993753, -0.5075524, 1, 1, 1, 1, 1,
0.008114982, -0.1666693, 2.185456, 1, 1, 1, 1, 1,
0.01051224, 0.156592, -0.02371374, 1, 1, 1, 1, 1,
0.01259876, -2.99628, 2.596659, 1, 1, 1, 1, 1,
0.01571011, 0.07780597, 0.2881772, 1, 1, 1, 1, 1,
0.02009194, -0.6194463, 3.385933, 1, 1, 1, 1, 1,
0.02121971, -1.829472, 2.442628, 1, 1, 1, 1, 1,
0.02794122, -0.7874023, 2.030134, 1, 1, 1, 1, 1,
0.03016414, 0.6397361, 0.9824344, 1, 1, 1, 1, 1,
0.03100895, -0.1910346, 3.864093, 1, 1, 1, 1, 1,
0.03347542, 1.04464, 0.5488324, 1, 1, 1, 1, 1,
0.03560972, 1.259733, -1.297386, 0, 0, 1, 1, 1,
0.03652235, -1.110928, 2.659055, 1, 0, 0, 1, 1,
0.03692978, -2.077595, 5.090904, 1, 0, 0, 1, 1,
0.03722217, -0.03711401, 2.555568, 1, 0, 0, 1, 1,
0.04280484, -0.3212698, 3.229968, 1, 0, 0, 1, 1,
0.04381281, -1.310519, 2.866112, 1, 0, 0, 1, 1,
0.0440512, 1.300213, 1.336029, 0, 0, 0, 1, 1,
0.04523166, 1.25746, 0.8343835, 0, 0, 0, 1, 1,
0.04939505, 0.823547, -0.5750024, 0, 0, 0, 1, 1,
0.05360163, -1.588714, 1.22508, 0, 0, 0, 1, 1,
0.05369042, -0.4025737, 2.870818, 0, 0, 0, 1, 1,
0.05381605, -1.312544, 3.088918, 0, 0, 0, 1, 1,
0.05386477, -1.486344, 4.741876, 0, 0, 0, 1, 1,
0.05466897, 0.1170916, 0.9821208, 1, 1, 1, 1, 1,
0.05566972, 0.4264105, -1.14435, 1, 1, 1, 1, 1,
0.05863443, -0.585357, 4.505025, 1, 1, 1, 1, 1,
0.06107166, -0.5544708, 2.45057, 1, 1, 1, 1, 1,
0.06257249, 0.09601795, 0.7901911, 1, 1, 1, 1, 1,
0.06823627, 0.1401737, 1.994687, 1, 1, 1, 1, 1,
0.06899305, -1.210992, 3.193017, 1, 1, 1, 1, 1,
0.06939418, 0.07454272, 1.837954, 1, 1, 1, 1, 1,
0.06959851, -1.277081, 2.093577, 1, 1, 1, 1, 1,
0.07078245, 0.0793734, 2.791943, 1, 1, 1, 1, 1,
0.07866787, -0.2121663, 3.134596, 1, 1, 1, 1, 1,
0.08041187, 0.6688867, 0.3469832, 1, 1, 1, 1, 1,
0.08512142, -1.078293, 3.885906, 1, 1, 1, 1, 1,
0.09076288, -1.371123, 3.428041, 1, 1, 1, 1, 1,
0.09493121, -0.1623016, 3.47102, 1, 1, 1, 1, 1,
0.09502792, -0.6660554, 2.512953, 0, 0, 1, 1, 1,
0.1026608, -0.4304612, 2.750573, 1, 0, 0, 1, 1,
0.1063374, 0.6766602, 0.2429379, 1, 0, 0, 1, 1,
0.1125484, -1.165073, 3.635412, 1, 0, 0, 1, 1,
0.1143148, 0.1197923, 0.1784596, 1, 0, 0, 1, 1,
0.1187111, 0.414875, -0.1795347, 1, 0, 0, 1, 1,
0.1190392, 0.8669704, 0.3747858, 0, 0, 0, 1, 1,
0.1204391, 0.9876818, 2.113101, 0, 0, 0, 1, 1,
0.1206075, -0.0603365, 2.696986, 0, 0, 0, 1, 1,
0.1225334, 0.07681853, 0.6992652, 0, 0, 0, 1, 1,
0.1254063, -0.1425068, 3.315022, 0, 0, 0, 1, 1,
0.125811, 0.2900209, -1.119329, 0, 0, 0, 1, 1,
0.130736, -0.5772032, 2.738446, 0, 0, 0, 1, 1,
0.1308357, -1.635524, 3.321682, 1, 1, 1, 1, 1,
0.1319056, -0.5460796, 4.792945, 1, 1, 1, 1, 1,
0.1376665, 0.8426306, 0.1471225, 1, 1, 1, 1, 1,
0.1416668, -1.559192, 4.990729, 1, 1, 1, 1, 1,
0.1445816, -0.1529828, 3.392067, 1, 1, 1, 1, 1,
0.1448029, 0.4528563, 2.342283, 1, 1, 1, 1, 1,
0.1448809, -1.543972, 1.124666, 1, 1, 1, 1, 1,
0.1455516, -0.9399468, 3.382588, 1, 1, 1, 1, 1,
0.1465225, -0.9053006, 3.009545, 1, 1, 1, 1, 1,
0.1474736, -1.020165, 4.10428, 1, 1, 1, 1, 1,
0.1505705, 2.633638, -0.2120009, 1, 1, 1, 1, 1,
0.1519805, -1.257877, 1.610091, 1, 1, 1, 1, 1,
0.1523049, -0.31378, 1.168709, 1, 1, 1, 1, 1,
0.1537679, -1.099765, 2.242121, 1, 1, 1, 1, 1,
0.1541492, -0.5267711, 2.060395, 1, 1, 1, 1, 1,
0.1545155, 0.9748391, 0.9496006, 0, 0, 1, 1, 1,
0.1549336, -0.2669374, 1.955649, 1, 0, 0, 1, 1,
0.1602284, 1.156009, 0.6671355, 1, 0, 0, 1, 1,
0.1603729, 0.04997618, 1.351573, 1, 0, 0, 1, 1,
0.1663155, 0.9989089, 1.192726, 1, 0, 0, 1, 1,
0.1663368, 0.07698237, -0.267814, 1, 0, 0, 1, 1,
0.1683616, 0.1067379, 1.505008, 0, 0, 0, 1, 1,
0.1684476, -1.13297, 2.35831, 0, 0, 0, 1, 1,
0.1687289, -1.872599, 3.052676, 0, 0, 0, 1, 1,
0.1696298, -0.3933409, 4.377156, 0, 0, 0, 1, 1,
0.1783652, -0.361795, 2.124007, 0, 0, 0, 1, 1,
0.1803039, 0.7099261, 1.284239, 0, 0, 0, 1, 1,
0.1829181, 1.024229, 0.2910452, 0, 0, 0, 1, 1,
0.1830083, 0.1921303, 0.8474078, 1, 1, 1, 1, 1,
0.1887561, 0.9212183, -0.07732208, 1, 1, 1, 1, 1,
0.1899994, 0.537877, 1.820004, 1, 1, 1, 1, 1,
0.1924796, 1.405752, -0.1281495, 1, 1, 1, 1, 1,
0.1929344, 0.9825109, 0.3786916, 1, 1, 1, 1, 1,
0.1938312, -1.157396, 2.352721, 1, 1, 1, 1, 1,
0.1991361, 0.278077, 1.294384, 1, 1, 1, 1, 1,
0.1999578, 0.4121295, 0.8578784, 1, 1, 1, 1, 1,
0.2087172, -0.04924684, 1.498888, 1, 1, 1, 1, 1,
0.2126805, 0.7828462, -0.405295, 1, 1, 1, 1, 1,
0.21348, 0.02440396, 4.383853, 1, 1, 1, 1, 1,
0.2139336, 1.491543, 0.7007426, 1, 1, 1, 1, 1,
0.2150923, -0.7216108, 3.060789, 1, 1, 1, 1, 1,
0.2166252, -0.7477745, 1.546388, 1, 1, 1, 1, 1,
0.2215717, -1.281316, 4.681702, 1, 1, 1, 1, 1,
0.2226594, 1.623893, -0.02310835, 0, 0, 1, 1, 1,
0.2234431, 0.5188128, 0.5036456, 1, 0, 0, 1, 1,
0.2241174, 1.032945, -0.8977897, 1, 0, 0, 1, 1,
0.2244088, -0.06231559, 1.223153, 1, 0, 0, 1, 1,
0.2245828, 1.549402, -0.5476639, 1, 0, 0, 1, 1,
0.2262711, -1.186577, 2.888712, 1, 0, 0, 1, 1,
0.2315872, -0.7531462, 0.3122225, 0, 0, 0, 1, 1,
0.234034, -1.592893, 2.885453, 0, 0, 0, 1, 1,
0.2358562, 1.875519, 1.468447, 0, 0, 0, 1, 1,
0.2364216, 1.27192, 0.4122587, 0, 0, 0, 1, 1,
0.2365601, 1.524779, 0.4429481, 0, 0, 0, 1, 1,
0.2367348, 1.22466, -0.2939307, 0, 0, 0, 1, 1,
0.2368137, -0.7145985, 1.380906, 0, 0, 0, 1, 1,
0.2369016, 0.7024567, 0.09317653, 1, 1, 1, 1, 1,
0.2385096, 0.2255937, -0.3474759, 1, 1, 1, 1, 1,
0.2408485, -0.1587477, 0.8518254, 1, 1, 1, 1, 1,
0.2410258, 0.8690081, 1.968907, 1, 1, 1, 1, 1,
0.244856, -0.803161, 2.468201, 1, 1, 1, 1, 1,
0.2476742, 0.5029883, 1.044086, 1, 1, 1, 1, 1,
0.2533312, -1.273206, 4.188211, 1, 1, 1, 1, 1,
0.2550779, -0.3318778, 0.9113536, 1, 1, 1, 1, 1,
0.256309, -0.7708247, 3.921818, 1, 1, 1, 1, 1,
0.2644339, -1.174743, 4.076537, 1, 1, 1, 1, 1,
0.265951, -1.579634, 2.546663, 1, 1, 1, 1, 1,
0.2708624, 1.720095, -0.101116, 1, 1, 1, 1, 1,
0.2743225, 1.829262, -0.2284794, 1, 1, 1, 1, 1,
0.283776, -0.09324425, 0.8200046, 1, 1, 1, 1, 1,
0.2859119, -1.876281, 2.325459, 1, 1, 1, 1, 1,
0.2897213, -0.2932495, 1.942628, 0, 0, 1, 1, 1,
0.2913402, -0.8009326, 2.507614, 1, 0, 0, 1, 1,
0.2934146, -0.424803, 2.749555, 1, 0, 0, 1, 1,
0.2950966, 0.7352469, 1.507292, 1, 0, 0, 1, 1,
0.300417, -1.339522, 1.359522, 1, 0, 0, 1, 1,
0.3108284, 1.742236, 1.304713, 1, 0, 0, 1, 1,
0.3112428, 0.2215314, 0.9486999, 0, 0, 0, 1, 1,
0.3132399, -1.307079, 3.598392, 0, 0, 0, 1, 1,
0.3135415, -0.9336621, 2.746909, 0, 0, 0, 1, 1,
0.3182285, 1.039296, 0.6538153, 0, 0, 0, 1, 1,
0.3189825, -0.677493, 1.675262, 0, 0, 0, 1, 1,
0.3192625, -0.0887877, 0.445207, 0, 0, 0, 1, 1,
0.3210257, 0.3761236, 0.9545435, 0, 0, 0, 1, 1,
0.3214946, 1.545797, -0.4302194, 1, 1, 1, 1, 1,
0.3217653, -1.152774, 3.086754, 1, 1, 1, 1, 1,
0.3253679, -1.424867, 3.423688, 1, 1, 1, 1, 1,
0.3258017, 0.9326025, -1.175597, 1, 1, 1, 1, 1,
0.327906, -0.4745402, 2.209645, 1, 1, 1, 1, 1,
0.3289597, -2.197108, 3.961058, 1, 1, 1, 1, 1,
0.3291264, -0.2544049, 1.096764, 1, 1, 1, 1, 1,
0.3309929, -1.702097, 2.460438, 1, 1, 1, 1, 1,
0.3324577, -0.09460193, 2.097667, 1, 1, 1, 1, 1,
0.3460176, -1.725675, 1.707586, 1, 1, 1, 1, 1,
0.3463975, 0.04716766, 0.9251975, 1, 1, 1, 1, 1,
0.3478241, 0.4405411, 0.3960962, 1, 1, 1, 1, 1,
0.3501235, -0.06996661, 1.052401, 1, 1, 1, 1, 1,
0.351056, 0.7845528, 2.164232, 1, 1, 1, 1, 1,
0.352134, 0.5935595, 1.693663, 1, 1, 1, 1, 1,
0.3607604, 0.6435054, 1.627475, 0, 0, 1, 1, 1,
0.3690668, 0.6425073, 0.9627662, 1, 0, 0, 1, 1,
0.371305, -0.440319, 4.778302, 1, 0, 0, 1, 1,
0.3732259, -0.6351616, 2.596918, 1, 0, 0, 1, 1,
0.3810459, 1.635382, 0.6121912, 1, 0, 0, 1, 1,
0.3829469, -1.362092, 3.541114, 1, 0, 0, 1, 1,
0.3846464, 0.6311288, 1.3567, 0, 0, 0, 1, 1,
0.3860869, 0.4322314, 1.707313, 0, 0, 0, 1, 1,
0.3876711, -0.9480962, 1.216215, 0, 0, 0, 1, 1,
0.3887685, 1.239966, 0.2191396, 0, 0, 0, 1, 1,
0.390267, -0.3444535, 1.5901, 0, 0, 0, 1, 1,
0.390761, 1.003026, 0.9401931, 0, 0, 0, 1, 1,
0.3932755, 0.4471448, 0.8246613, 0, 0, 0, 1, 1,
0.4030589, -0.6158041, 2.621126, 1, 1, 1, 1, 1,
0.4040666, -0.2729991, 1.681135, 1, 1, 1, 1, 1,
0.404538, -1.097398, 2.415458, 1, 1, 1, 1, 1,
0.4135987, 0.7976166, -0.4710161, 1, 1, 1, 1, 1,
0.4140335, 1.862925, -1.102164, 1, 1, 1, 1, 1,
0.4169858, -0.01529768, 2.351597, 1, 1, 1, 1, 1,
0.4185085, -0.5623837, 1.793717, 1, 1, 1, 1, 1,
0.4211887, -0.6932756, 1.984318, 1, 1, 1, 1, 1,
0.4252089, 0.822669, 1.07956, 1, 1, 1, 1, 1,
0.427835, 2.671167, 1.924039, 1, 1, 1, 1, 1,
0.4349598, 0.2134837, 1.134069, 1, 1, 1, 1, 1,
0.4361334, 0.6831039, -0.1753686, 1, 1, 1, 1, 1,
0.4408425, -1.230355, 1.738036, 1, 1, 1, 1, 1,
0.4421017, -2.643783, 2.641074, 1, 1, 1, 1, 1,
0.4428698, -1.039428, 1.98082, 1, 1, 1, 1, 1,
0.4443047, 0.239359, 1.963005, 0, 0, 1, 1, 1,
0.4448402, -0.1150838, 0.4470119, 1, 0, 0, 1, 1,
0.4477203, 2.468117, 0.7784983, 1, 0, 0, 1, 1,
0.447999, -1.243708, 2.643692, 1, 0, 0, 1, 1,
0.4498778, -0.4738546, 2.382202, 1, 0, 0, 1, 1,
0.4503039, 0.3616694, 0.176126, 1, 0, 0, 1, 1,
0.4575563, -1.027172, 1.16996, 0, 0, 0, 1, 1,
0.4596355, 0.5543736, 0.8433793, 0, 0, 0, 1, 1,
0.4640916, -0.2284958, 4.616355, 0, 0, 0, 1, 1,
0.4667838, 0.6482805, 1.095165, 0, 0, 0, 1, 1,
0.472755, 0.5448309, 0.5897305, 0, 0, 0, 1, 1,
0.4730172, -1.547756, 4.029596, 0, 0, 0, 1, 1,
0.4735601, 0.09010883, 2.881201, 0, 0, 0, 1, 1,
0.4747443, 1.912046, 0.3270603, 1, 1, 1, 1, 1,
0.4778571, 1.378164, -0.05422763, 1, 1, 1, 1, 1,
0.4782604, -0.8070058, 1.868363, 1, 1, 1, 1, 1,
0.4847062, 0.9692056, 1.268495, 1, 1, 1, 1, 1,
0.4892031, -0.2706041, 3.076924, 1, 1, 1, 1, 1,
0.4904386, -1.380339, 2.674803, 1, 1, 1, 1, 1,
0.4962187, 1.5531, 0.02517757, 1, 1, 1, 1, 1,
0.4973892, -0.8314575, 1.250869, 1, 1, 1, 1, 1,
0.4980322, -0.1730161, 1.979492, 1, 1, 1, 1, 1,
0.4980569, 2.116928, 2.02751, 1, 1, 1, 1, 1,
0.498947, 0.4121252, 1.010445, 1, 1, 1, 1, 1,
0.5037687, 0.6745863, 1.666768, 1, 1, 1, 1, 1,
0.5053557, 0.9252585, 1.83539, 1, 1, 1, 1, 1,
0.5055228, 0.6025346, 1.3132, 1, 1, 1, 1, 1,
0.5056322, -1.754781, 4.163517, 1, 1, 1, 1, 1,
0.5076058, -1.917331, 1.793043, 0, 0, 1, 1, 1,
0.5079411, -0.5389427, 1.913312, 1, 0, 0, 1, 1,
0.5110222, 0.4088211, 1.274012, 1, 0, 0, 1, 1,
0.5121725, -0.1385684, 3.20327, 1, 0, 0, 1, 1,
0.5229114, 0.6859398, 0.01527675, 1, 0, 0, 1, 1,
0.5243391, -1.288794, 3.649088, 1, 0, 0, 1, 1,
0.5258527, 0.9430508, 1.009827, 0, 0, 0, 1, 1,
0.5287904, -0.4721541, 2.424458, 0, 0, 0, 1, 1,
0.5346759, -0.5795988, 0.8920887, 0, 0, 0, 1, 1,
0.5356913, -0.1381039, 3.272025, 0, 0, 0, 1, 1,
0.5388322, -0.8298851, 0.871137, 0, 0, 0, 1, 1,
0.5389048, -0.1932645, 1.770255, 0, 0, 0, 1, 1,
0.5392869, 0.1857065, 0.1212779, 0, 0, 0, 1, 1,
0.5410225, -0.4209837, 4.126366, 1, 1, 1, 1, 1,
0.5442783, 1.727338, 0.7113712, 1, 1, 1, 1, 1,
0.5449927, 1.900293, 1.679788, 1, 1, 1, 1, 1,
0.5483853, -0.9760845, 2.674896, 1, 1, 1, 1, 1,
0.557107, -0.09008866, -0.5426211, 1, 1, 1, 1, 1,
0.5587382, -0.436759, 2.383416, 1, 1, 1, 1, 1,
0.559321, 1.439396, -0.7021561, 1, 1, 1, 1, 1,
0.560393, -0.05388105, 1.939381, 1, 1, 1, 1, 1,
0.5604212, 0.1167025, 2.353755, 1, 1, 1, 1, 1,
0.5650284, -0.1934143, 0.7042279, 1, 1, 1, 1, 1,
0.5663294, 0.652613, 1.690618, 1, 1, 1, 1, 1,
0.5666283, -0.156959, 3.103327, 1, 1, 1, 1, 1,
0.5673007, -0.3438739, 1.474011, 1, 1, 1, 1, 1,
0.5759818, 0.09376998, 1.5366, 1, 1, 1, 1, 1,
0.5787806, -0.6064175, 3.681133, 1, 1, 1, 1, 1,
0.5837646, -0.08381151, 0.8239724, 0, 0, 1, 1, 1,
0.5896935, -0.1974777, 3.084462, 1, 0, 0, 1, 1,
0.5953224, -0.3813179, 2.26412, 1, 0, 0, 1, 1,
0.5958424, 1.110521, 1.041015, 1, 0, 0, 1, 1,
0.5984099, 0.8889765, -0.3058368, 1, 0, 0, 1, 1,
0.6062301, -0.6964544, 4.379917, 1, 0, 0, 1, 1,
0.6086246, 1.192886, 0.6650975, 0, 0, 0, 1, 1,
0.6140376, 0.1053176, 0.9440225, 0, 0, 0, 1, 1,
0.6154156, 0.965496, 1.044797, 0, 0, 0, 1, 1,
0.617038, -0.9556347, 1.722598, 0, 0, 0, 1, 1,
0.6172552, 0.3409162, 0.8350772, 0, 0, 0, 1, 1,
0.6202212, -1.474628, 3.219518, 0, 0, 0, 1, 1,
0.6204485, 1.337257, -0.4944023, 0, 0, 0, 1, 1,
0.6226207, -1.757276, 3.19346, 1, 1, 1, 1, 1,
0.6229412, -0.2684888, 2.395768, 1, 1, 1, 1, 1,
0.6230422, -1.110056, 3.384662, 1, 1, 1, 1, 1,
0.6239884, -0.3964884, 1.312106, 1, 1, 1, 1, 1,
0.6241252, -0.1313446, 2.067697, 1, 1, 1, 1, 1,
0.6282054, 0.4447517, 0.1080887, 1, 1, 1, 1, 1,
0.6361125, -0.06531242, 2.606858, 1, 1, 1, 1, 1,
0.6402187, 0.8538911, -0.6673566, 1, 1, 1, 1, 1,
0.6416977, -0.8224699, 2.202414, 1, 1, 1, 1, 1,
0.6422929, 0.7272432, 0.9522322, 1, 1, 1, 1, 1,
0.6460194, 0.8607609, 1.659074, 1, 1, 1, 1, 1,
0.6475771, 0.1414801, 0.251507, 1, 1, 1, 1, 1,
0.6505394, -0.2142524, 4.349754, 1, 1, 1, 1, 1,
0.6621051, 0.02250906, 0.4054922, 1, 1, 1, 1, 1,
0.6631935, 0.6217278, 1.246728, 1, 1, 1, 1, 1,
0.6725851, -1.870533, 3.625858, 0, 0, 1, 1, 1,
0.6757066, 2.369379, 0.3376823, 1, 0, 0, 1, 1,
0.6767985, -0.1508426, 1.766726, 1, 0, 0, 1, 1,
0.6867921, 0.6895899, -0.5767357, 1, 0, 0, 1, 1,
0.6909868, 1.392477, -0.6841887, 1, 0, 0, 1, 1,
0.694387, 0.7216532, -0.6437811, 1, 0, 0, 1, 1,
0.6955052, -1.460318, 0.8893652, 0, 0, 0, 1, 1,
0.6960716, 0.8133528, -0.9600095, 0, 0, 0, 1, 1,
0.6993718, 1.49068, 0.1256563, 0, 0, 0, 1, 1,
0.7129231, -0.9931067, 2.634263, 0, 0, 0, 1, 1,
0.7132546, -0.8722065, 2.691084, 0, 0, 0, 1, 1,
0.721617, -1.630725, 1.912681, 0, 0, 0, 1, 1,
0.7219256, 0.366841, 1.059829, 0, 0, 0, 1, 1,
0.7242457, 0.2518001, 1.183722, 1, 1, 1, 1, 1,
0.7329262, 0.07510418, 2.012106, 1, 1, 1, 1, 1,
0.7493028, 1.359821, -1.92193, 1, 1, 1, 1, 1,
0.7499477, -1.265147, 2.746683, 1, 1, 1, 1, 1,
0.7524295, -0.2272799, 3.582947, 1, 1, 1, 1, 1,
0.7540218, 1.674488, 1.4638, 1, 1, 1, 1, 1,
0.755327, 0.5889569, 0.7954649, 1, 1, 1, 1, 1,
0.7557826, -0.6488746, -0.7282375, 1, 1, 1, 1, 1,
0.7577294, 0.1208759, 0.293824, 1, 1, 1, 1, 1,
0.7581046, -0.2679026, 1.123108, 1, 1, 1, 1, 1,
0.7583172, -0.5254641, 1.981074, 1, 1, 1, 1, 1,
0.7593947, 1.30007, 1.347728, 1, 1, 1, 1, 1,
0.7616507, -0.6287468, 3.1377, 1, 1, 1, 1, 1,
0.7626079, -0.9232252, 1.854246, 1, 1, 1, 1, 1,
0.7637454, 0.2819996, 3.849146, 1, 1, 1, 1, 1,
0.7643869, 1.114641, 0.09000678, 0, 0, 1, 1, 1,
0.7651016, -0.5923032, 1.215672, 1, 0, 0, 1, 1,
0.7657707, 0.163949, 2.14198, 1, 0, 0, 1, 1,
0.7735591, 1.177858, 0.2040241, 1, 0, 0, 1, 1,
0.7767327, -0.3495613, 3.080393, 1, 0, 0, 1, 1,
0.7781224, 1.509158, 1.082617, 1, 0, 0, 1, 1,
0.785621, 0.4286829, 0.8013104, 0, 0, 0, 1, 1,
0.7869515, -1.155623, 2.937452, 0, 0, 0, 1, 1,
0.7871629, -0.4872067, 2.719971, 0, 0, 0, 1, 1,
0.7915718, -0.8160303, 2.452662, 0, 0, 0, 1, 1,
0.7939342, -3.14706, 2.726249, 0, 0, 0, 1, 1,
0.7939487, -1.065897, 2.278842, 0, 0, 0, 1, 1,
0.795785, -0.8667526, 2.298223, 0, 0, 0, 1, 1,
0.7967466, 1.089071, 1.605585, 1, 1, 1, 1, 1,
0.7967835, -0.5128448, 1.223086, 1, 1, 1, 1, 1,
0.7995606, -0.348499, 0.8144317, 1, 1, 1, 1, 1,
0.8063713, 0.7298547, -0.4548796, 1, 1, 1, 1, 1,
0.8108139, 0.8395689, -0.4307413, 1, 1, 1, 1, 1,
0.8123693, -0.7581403, 1.608099, 1, 1, 1, 1, 1,
0.8215516, 0.1621078, 1.44883, 1, 1, 1, 1, 1,
0.8235503, -2.869239, 3.651957, 1, 1, 1, 1, 1,
0.8246705, 3.23376, 1.193632, 1, 1, 1, 1, 1,
0.8263917, 0.5329047, 0.01745856, 1, 1, 1, 1, 1,
0.8314009, -2.068898, 2.990357, 1, 1, 1, 1, 1,
0.8336575, -0.3304631, 3.566186, 1, 1, 1, 1, 1,
0.8513151, -0.1924012, 1.668214, 1, 1, 1, 1, 1,
0.8537669, -0.5885959, 2.941614, 1, 1, 1, 1, 1,
0.8569393, 0.4939516, 1.930041, 1, 1, 1, 1, 1,
0.8594203, 0.6635389, 2.501548, 0, 0, 1, 1, 1,
0.8621363, 0.1048265, 1.317504, 1, 0, 0, 1, 1,
0.8642853, 0.6660843, -0.1389129, 1, 0, 0, 1, 1,
0.8690276, 0.4759728, -0.1885261, 1, 0, 0, 1, 1,
0.8696098, -0.9666381, 2.872681, 1, 0, 0, 1, 1,
0.8712131, 0.8312671, 0.4480939, 1, 0, 0, 1, 1,
0.8942708, -0.8654514, 3.320508, 0, 0, 0, 1, 1,
0.8944897, 0.8813021, 1.383199, 0, 0, 0, 1, 1,
0.8953453, 1.758659, 0.07491474, 0, 0, 0, 1, 1,
0.9059845, -1.304104, 2.323185, 0, 0, 0, 1, 1,
0.9063847, -0.7158772, 3.272597, 0, 0, 0, 1, 1,
0.9130442, -0.840723, 2.611204, 0, 0, 0, 1, 1,
0.9132738, -1.068302, 2.348108, 0, 0, 0, 1, 1,
0.9166592, 0.6500942, 0.8353125, 1, 1, 1, 1, 1,
0.9190376, 0.4659455, 0.4150929, 1, 1, 1, 1, 1,
0.9209676, -0.03422849, 2.357194, 1, 1, 1, 1, 1,
0.9224639, 0.261707, 1.691956, 1, 1, 1, 1, 1,
0.9260972, 0.2934564, 1.81703, 1, 1, 1, 1, 1,
0.9298688, -0.6028394, 3.839763, 1, 1, 1, 1, 1,
0.9319342, -0.2499886, 2.275176, 1, 1, 1, 1, 1,
0.9359255, 0.8337967, 1.270503, 1, 1, 1, 1, 1,
0.9367418, -1.219605, 1.762586, 1, 1, 1, 1, 1,
0.9369114, 0.9649328, 1.70071, 1, 1, 1, 1, 1,
0.9410776, -0.6367118, 2.931771, 1, 1, 1, 1, 1,
0.9416509, 0.1022624, -0.2450257, 1, 1, 1, 1, 1,
0.9445594, -1.454046, 3.283481, 1, 1, 1, 1, 1,
0.9454131, 0.06171706, 1.28542, 1, 1, 1, 1, 1,
0.9459392, -0.01499726, 2.150384, 1, 1, 1, 1, 1,
0.946539, -1.433256, 2.793417, 0, 0, 1, 1, 1,
0.9476731, 0.06091198, 2.184597, 1, 0, 0, 1, 1,
0.9512442, -1.003866, 1.162352, 1, 0, 0, 1, 1,
0.954066, 0.2466315, 2.147514, 1, 0, 0, 1, 1,
0.9541823, 0.7371307, 2.112343, 1, 0, 0, 1, 1,
0.9574488, -0.4783169, 0.613436, 1, 0, 0, 1, 1,
0.9575925, -1.025274, 2.400471, 0, 0, 0, 1, 1,
0.9578617, -1.61367, 2.51372, 0, 0, 0, 1, 1,
0.9604929, 1.582663, 0.7871059, 0, 0, 0, 1, 1,
0.9622813, -0.7622202, 1.060275, 0, 0, 0, 1, 1,
0.9654559, 2.987632, 1.380666, 0, 0, 0, 1, 1,
0.9695255, 0.9279881, 2.334428, 0, 0, 0, 1, 1,
0.9697949, 1.124546, 2.561007, 0, 0, 0, 1, 1,
0.9722903, 0.4968713, 0.6473479, 1, 1, 1, 1, 1,
0.9812755, 0.5110716, -0.06640343, 1, 1, 1, 1, 1,
0.9818041, 0.8575624, 2.017403, 1, 1, 1, 1, 1,
0.9822761, -0.7255242, -0.04140262, 1, 1, 1, 1, 1,
0.9866199, 0.04613386, 0.4268728, 1, 1, 1, 1, 1,
0.9914242, 0.2713634, 2.840273, 1, 1, 1, 1, 1,
0.9937849, 0.08752964, 1.239745, 1, 1, 1, 1, 1,
0.9963831, 0.2372845, 1.797065, 1, 1, 1, 1, 1,
0.9983597, 0.4554244, 2.377724, 1, 1, 1, 1, 1,
0.9989217, -0.8799432, 1.757774, 1, 1, 1, 1, 1,
1.004436, 2.24947, 0.7609876, 1, 1, 1, 1, 1,
1.008049, 0.2741242, 0.4561865, 1, 1, 1, 1, 1,
1.010187, 1.007825, 1.563974, 1, 1, 1, 1, 1,
1.012193, -0.6893511, 1.563579, 1, 1, 1, 1, 1,
1.015, 1.29898, 0.6763451, 1, 1, 1, 1, 1,
1.019865, -1.311058, 3.206547, 0, 0, 1, 1, 1,
1.020514, -0.5498586, 0.6522229, 1, 0, 0, 1, 1,
1.025246, 0.6774635, 2.645917, 1, 0, 0, 1, 1,
1.034017, 0.2583423, 0.7646502, 1, 0, 0, 1, 1,
1.034083, 0.4518011, 0.3618395, 1, 0, 0, 1, 1,
1.03985, -1.521366, -0.06305893, 1, 0, 0, 1, 1,
1.051173, -0.4894024, 2.294212, 0, 0, 0, 1, 1,
1.05516, 0.6844238, 1.435608, 0, 0, 0, 1, 1,
1.060699, 0.6246741, 2.11298, 0, 0, 0, 1, 1,
1.06702, 1.325789, 0.3617725, 0, 0, 0, 1, 1,
1.072998, 0.7584242, 0.9899684, 0, 0, 0, 1, 1,
1.080185, 0.5629846, 2.206795, 0, 0, 0, 1, 1,
1.083291, 1.4318, -0.1013427, 0, 0, 0, 1, 1,
1.088101, 0.3857951, 0.2847574, 1, 1, 1, 1, 1,
1.091571, -0.08440778, 2.596801, 1, 1, 1, 1, 1,
1.102705, 0.3074685, 0.9231346, 1, 1, 1, 1, 1,
1.103935, -2.370474, 3.01867, 1, 1, 1, 1, 1,
1.104102, 0.4663472, -0.4823766, 1, 1, 1, 1, 1,
1.111068, 0.7475427, 2.238538, 1, 1, 1, 1, 1,
1.117725, 1.319764, 1.944982, 1, 1, 1, 1, 1,
1.11928, 2.064867, -0.639666, 1, 1, 1, 1, 1,
1.126813, -2.642935, 2.288559, 1, 1, 1, 1, 1,
1.131766, 0.282857, 1.963768, 1, 1, 1, 1, 1,
1.144829, 0.9620832, 0.7802171, 1, 1, 1, 1, 1,
1.148354, -1.22937, 1.535032, 1, 1, 1, 1, 1,
1.153612, 0.07850547, 2.288024, 1, 1, 1, 1, 1,
1.154679, -0.160392, 1.085406, 1, 1, 1, 1, 1,
1.160636, -0.2333061, 0.8459811, 1, 1, 1, 1, 1,
1.160651, -1.636243, 3.573797, 0, 0, 1, 1, 1,
1.164332, 0.6812352, 1.878761, 1, 0, 0, 1, 1,
1.167224, 0.1614258, 2.300177, 1, 0, 0, 1, 1,
1.175701, -0.035011, 2.370757, 1, 0, 0, 1, 1,
1.185567, 0.9378241, 0.08260361, 1, 0, 0, 1, 1,
1.187435, 0.3183288, 0.7190205, 1, 0, 0, 1, 1,
1.194258, 1.509508, 1.596364, 0, 0, 0, 1, 1,
1.197524, -0.4308299, 1.304308, 0, 0, 0, 1, 1,
1.204431, 0.7511403, 0.4547866, 0, 0, 0, 1, 1,
1.206541, 1.221459, -0.5986894, 0, 0, 0, 1, 1,
1.212469, -0.9750406, 3.254163, 0, 0, 0, 1, 1,
1.216576, 2.073952, -0.3427938, 0, 0, 0, 1, 1,
1.21772, 1.099106, 2.340117, 0, 0, 0, 1, 1,
1.224732, -0.5352871, 2.923395, 1, 1, 1, 1, 1,
1.225354, 2.690449, 1.366975, 1, 1, 1, 1, 1,
1.229048, -0.3506751, 0.7740861, 1, 1, 1, 1, 1,
1.244194, -0.158494, 1.510015, 1, 1, 1, 1, 1,
1.249551, -1.30874, 1.798041, 1, 1, 1, 1, 1,
1.256235, -0.08339325, 2.115214, 1, 1, 1, 1, 1,
1.25667, 0.9145641, -0.417422, 1, 1, 1, 1, 1,
1.26016, 0.6796159, -0.705268, 1, 1, 1, 1, 1,
1.271289, 0.757962, 0.954153, 1, 1, 1, 1, 1,
1.273417, 0.2424006, 0.0002178444, 1, 1, 1, 1, 1,
1.276479, -0.8510146, 1.352086, 1, 1, 1, 1, 1,
1.282695, -0.04854022, 3.327378, 1, 1, 1, 1, 1,
1.288408, -0.4864768, 3.359864, 1, 1, 1, 1, 1,
1.289457, 0.3077943, -0.4293643, 1, 1, 1, 1, 1,
1.297028, 0.5549684, 0.6642992, 1, 1, 1, 1, 1,
1.313432, 0.8115706, -0.3738569, 0, 0, 1, 1, 1,
1.336372, 0.6199032, 0.8754342, 1, 0, 0, 1, 1,
1.340144, 1.224894, 1.489835, 1, 0, 0, 1, 1,
1.347594, -1.976641, 3.124027, 1, 0, 0, 1, 1,
1.349941, -0.4353496, 2.813084, 1, 0, 0, 1, 1,
1.364781, -0.7467061, 2.620329, 1, 0, 0, 1, 1,
1.369082, 0.5785365, -0.738651, 0, 0, 0, 1, 1,
1.378654, 1.902659, 0.7473804, 0, 0, 0, 1, 1,
1.388176, -0.2097105, 0.9600311, 0, 0, 0, 1, 1,
1.419196, 0.6713251, 2.629141, 0, 0, 0, 1, 1,
1.420156, -0.9266055, 2.238291, 0, 0, 0, 1, 1,
1.44074, -1.031645, 1.016998, 0, 0, 0, 1, 1,
1.452514, -0.525591, 2.870187, 0, 0, 0, 1, 1,
1.457509, 1.116651, 1.478537, 1, 1, 1, 1, 1,
1.47649, 1.106941, 0.8887239, 1, 1, 1, 1, 1,
1.477936, -0.6089073, 2.291386, 1, 1, 1, 1, 1,
1.480479, 0.503451, 1.016121, 1, 1, 1, 1, 1,
1.496625, -0.3669609, 2.524521, 1, 1, 1, 1, 1,
1.50093, 1.873286, 1.648536, 1, 1, 1, 1, 1,
1.503406, 0.1529599, -0.08350347, 1, 1, 1, 1, 1,
1.507494, -0.3232618, 2.385747, 1, 1, 1, 1, 1,
1.51232, -1.732344, 2.334446, 1, 1, 1, 1, 1,
1.542306, 0.07149266, 1.145669, 1, 1, 1, 1, 1,
1.545929, -0.5669994, 1.717771, 1, 1, 1, 1, 1,
1.557576, -1.070775, 1.620864, 1, 1, 1, 1, 1,
1.561146, 0.6634942, 2.259569, 1, 1, 1, 1, 1,
1.563153, -0.053182, 0.4760921, 1, 1, 1, 1, 1,
1.593596, 0.3929165, 1.920776, 1, 1, 1, 1, 1,
1.597298, 0.8059904, 1.186222, 0, 0, 1, 1, 1,
1.598426, -0.4046541, 2.748606, 1, 0, 0, 1, 1,
1.612402, -1.332095, 2.176871, 1, 0, 0, 1, 1,
1.620219, 0.895008, 0.5022383, 1, 0, 0, 1, 1,
1.628275, -0.4482097, 2.004105, 1, 0, 0, 1, 1,
1.652164, 0.3599417, 1.528896, 1, 0, 0, 1, 1,
1.654674, 1.071737, 1.189166, 0, 0, 0, 1, 1,
1.660982, -0.4987849, 2.095889, 0, 0, 0, 1, 1,
1.667639, 0.8212156, 1.088515, 0, 0, 0, 1, 1,
1.691855, 0.1783117, 1.714656, 0, 0, 0, 1, 1,
1.711044, 0.5216885, 0.2157309, 0, 0, 0, 1, 1,
1.712283, -0.01351717, 1.670953, 0, 0, 0, 1, 1,
1.712832, 1.014214, -0.8275324, 0, 0, 0, 1, 1,
1.728294, -0.5513155, 2.420961, 1, 1, 1, 1, 1,
1.730233, 0.6172579, 1.272171, 1, 1, 1, 1, 1,
1.740144, -1.612879, 2.138356, 1, 1, 1, 1, 1,
1.775574, 0.760551, 1.626075, 1, 1, 1, 1, 1,
1.777651, -0.6486142, 2.411666, 1, 1, 1, 1, 1,
1.797176, -0.2698414, 1.697701, 1, 1, 1, 1, 1,
1.799082, -1.442924, 2.044655, 1, 1, 1, 1, 1,
1.79961, 0.674419, 3.435178, 1, 1, 1, 1, 1,
1.819651, -1.738385, 2.171519, 1, 1, 1, 1, 1,
1.831811, 1.268131, 1.351326, 1, 1, 1, 1, 1,
1.834117, -0.1139645, 0.8913018, 1, 1, 1, 1, 1,
1.838826, 2.387207, 1.276811, 1, 1, 1, 1, 1,
1.86733, 0.6928833, 0.2127768, 1, 1, 1, 1, 1,
1.902065, 0.8938615, 0.5280766, 1, 1, 1, 1, 1,
1.907732, 0.4532903, 3.235521, 1, 1, 1, 1, 1,
1.911654, 1.255883, 1.192323, 0, 0, 1, 1, 1,
1.91865, -0.9280409, 2.31326, 1, 0, 0, 1, 1,
1.92982, -2.335911, 2.833468, 1, 0, 0, 1, 1,
1.97401, -1.49877, 3.637013, 1, 0, 0, 1, 1,
2.013711, 0.3609543, 1.969711, 1, 0, 0, 1, 1,
2.039938, 1.346705, 0.5687445, 1, 0, 0, 1, 1,
2.068927, 0.8339055, 0.5292466, 0, 0, 0, 1, 1,
2.091697, -1.059045, 3.264385, 0, 0, 0, 1, 1,
2.094587, 0.2443735, 2.562401, 0, 0, 0, 1, 1,
2.107834, 0.6758507, 3.728988, 0, 0, 0, 1, 1,
2.142312, -1.362981, 1.404902, 0, 0, 0, 1, 1,
2.150318, 0.1843248, 0.5989938, 0, 0, 0, 1, 1,
2.173518, 2.014149, 1.257194, 0, 0, 0, 1, 1,
2.205285, -0.5317093, 1.711555, 1, 1, 1, 1, 1,
2.21263, 0.406402, 1.379907, 1, 1, 1, 1, 1,
2.385929, 0.4156104, 0.2272559, 1, 1, 1, 1, 1,
2.47228, -0.03442734, 0.6825341, 1, 1, 1, 1, 1,
2.742883, 0.2813434, 1.827258, 1, 1, 1, 1, 1,
3.016966, 0.7844269, 4.45057, 1, 1, 1, 1, 1,
3.119279, -0.2817306, 1.60249, 1, 1, 1, 1, 1
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
var radius = 9.375762;
var distance = 32.93197;
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
mvMatrix.translate( -0.1267411, -0.03598595, 0.1610575 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.93197);
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
