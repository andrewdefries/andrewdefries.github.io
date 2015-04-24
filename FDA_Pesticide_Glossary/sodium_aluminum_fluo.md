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
-3.118065, -1.093439, -2.829624, 1, 0, 0, 1,
-2.944655, 0.6644506, -1.746686, 1, 0.007843138, 0, 1,
-2.766401, 0.9984508, -0.7909111, 1, 0.01176471, 0, 1,
-2.620073, -0.2568694, -3.220659, 1, 0.01960784, 0, 1,
-2.59272, 0.314987, -3.075536, 1, 0.02352941, 0, 1,
-2.592396, 0.4687796, -1.194699, 1, 0.03137255, 0, 1,
-2.566643, -1.193716, -2.637923, 1, 0.03529412, 0, 1,
-2.462494, -2.219061, -1.583688, 1, 0.04313726, 0, 1,
-2.441139, -0.7889377, -2.120674, 1, 0.04705882, 0, 1,
-2.421608, 1.190823, 0.05227407, 1, 0.05490196, 0, 1,
-2.359359, -2.203016, -3.143747, 1, 0.05882353, 0, 1,
-2.342174, 0.44366, -2.795548, 1, 0.06666667, 0, 1,
-2.335331, -1.344605, -1.34248, 1, 0.07058824, 0, 1,
-2.313508, 0.5356524, -0.6118823, 1, 0.07843138, 0, 1,
-2.303928, -0.2675101, -1.474827, 1, 0.08235294, 0, 1,
-2.301739, 0.1506945, 0.7022684, 1, 0.09019608, 0, 1,
-2.246079, -1.009166, -2.148965, 1, 0.09411765, 0, 1,
-2.219627, 0.6452143, -1.173064, 1, 0.1019608, 0, 1,
-2.218441, 0.9054285, -0.4049128, 1, 0.1098039, 0, 1,
-2.208247, 0.9120442, -0.1805571, 1, 0.1137255, 0, 1,
-2.199703, -2.071509, -1.988777, 1, 0.1215686, 0, 1,
-2.172183, 0.6163472, -1.856271, 1, 0.1254902, 0, 1,
-2.075865, -0.7326757, -1.785946, 1, 0.1333333, 0, 1,
-2.059936, -1.220651, -4.302622, 1, 0.1372549, 0, 1,
-2.002705, -0.9330254, -1.634984, 1, 0.145098, 0, 1,
-1.993156, -0.3746907, -1.853703, 1, 0.1490196, 0, 1,
-1.983612, 0.4573557, -1.871097, 1, 0.1568628, 0, 1,
-1.974661, 1.48016, -1.541259, 1, 0.1607843, 0, 1,
-1.953545, 1.299539, -1.677333, 1, 0.1686275, 0, 1,
-1.926733, 0.2599789, 0.7541988, 1, 0.172549, 0, 1,
-1.874881, 1.00903, -1.339444, 1, 0.1803922, 0, 1,
-1.808055, -0.3751361, -2.339296, 1, 0.1843137, 0, 1,
-1.807553, 1.075364, 0.203489, 1, 0.1921569, 0, 1,
-1.793249, 0.4782137, -1.10468, 1, 0.1960784, 0, 1,
-1.791017, 1.695739, -1.357204, 1, 0.2039216, 0, 1,
-1.789407, -1.076421, -3.67596, 1, 0.2117647, 0, 1,
-1.752757, 0.8106763, -1.969452, 1, 0.2156863, 0, 1,
-1.751077, -0.9699094, -1.3895, 1, 0.2235294, 0, 1,
-1.743227, -0.1061601, -1.957289, 1, 0.227451, 0, 1,
-1.737776, -0.006883595, -1.260041, 1, 0.2352941, 0, 1,
-1.736043, -1.061063, -2.984979, 1, 0.2392157, 0, 1,
-1.732196, 0.5588059, -0.4735346, 1, 0.2470588, 0, 1,
-1.732094, -1.259443, -1.379944, 1, 0.2509804, 0, 1,
-1.730351, 1.676673, -0.995402, 1, 0.2588235, 0, 1,
-1.703659, -0.02114867, -0.6077632, 1, 0.2627451, 0, 1,
-1.702887, 0.485098, -1.399822, 1, 0.2705882, 0, 1,
-1.677466, -0.3709108, -2.506266, 1, 0.2745098, 0, 1,
-1.671795, 1.224402, -2.404425, 1, 0.282353, 0, 1,
-1.657304, -0.4448733, -2.314259, 1, 0.2862745, 0, 1,
-1.650019, -1.676992, -2.399982, 1, 0.2941177, 0, 1,
-1.648158, -1.573802, -2.732249, 1, 0.3019608, 0, 1,
-1.635657, -0.2582155, -4.115236, 1, 0.3058824, 0, 1,
-1.630785, -0.8270426, -1.954321, 1, 0.3137255, 0, 1,
-1.62693, 0.5281889, -0.5649816, 1, 0.3176471, 0, 1,
-1.604895, -0.1521418, -1.057654, 1, 0.3254902, 0, 1,
-1.603349, -0.0808311, -2.973664, 1, 0.3294118, 0, 1,
-1.597336, 0.4018221, -0.6990929, 1, 0.3372549, 0, 1,
-1.559668, -2.357341, -1.925972, 1, 0.3411765, 0, 1,
-1.559379, -1.029859, -2.016575, 1, 0.3490196, 0, 1,
-1.555091, 0.4328591, -2.317164, 1, 0.3529412, 0, 1,
-1.542815, -0.03855774, -1.556644, 1, 0.3607843, 0, 1,
-1.542729, -0.3346643, -1.263059, 1, 0.3647059, 0, 1,
-1.533811, -0.8830992, -3.034902, 1, 0.372549, 0, 1,
-1.528976, -0.02598582, -2.186509, 1, 0.3764706, 0, 1,
-1.528789, -1.041239, -0.1340327, 1, 0.3843137, 0, 1,
-1.52781, 0.5121356, 0.2349581, 1, 0.3882353, 0, 1,
-1.517767, 0.8014206, -2.628231, 1, 0.3960784, 0, 1,
-1.503257, 0.1081918, -1.178258, 1, 0.4039216, 0, 1,
-1.502635, -1.224108, -3.30535, 1, 0.4078431, 0, 1,
-1.494033, 0.5123237, -0.9573755, 1, 0.4156863, 0, 1,
-1.481364, 1.029602, -2.789153, 1, 0.4196078, 0, 1,
-1.48134, 0.06089471, -2.322717, 1, 0.427451, 0, 1,
-1.472091, 1.280925, 0.7257712, 1, 0.4313726, 0, 1,
-1.4649, -0.1977692, -1.456168, 1, 0.4392157, 0, 1,
-1.460798, -2.786394, -3.665791, 1, 0.4431373, 0, 1,
-1.45755, 0.6434257, -1.195641, 1, 0.4509804, 0, 1,
-1.446999, 0.277339, -1.644769, 1, 0.454902, 0, 1,
-1.429938, 0.6068158, -1.555258, 1, 0.4627451, 0, 1,
-1.427207, -0.3050602, -0.8279369, 1, 0.4666667, 0, 1,
-1.422866, -0.8817582, -3.346091, 1, 0.4745098, 0, 1,
-1.408497, -0.4037595, -2.504895, 1, 0.4784314, 0, 1,
-1.4013, 0.3881277, -1.702316, 1, 0.4862745, 0, 1,
-1.393328, 0.4727337, -2.627383, 1, 0.4901961, 0, 1,
-1.384607, -0.1174169, -2.441774, 1, 0.4980392, 0, 1,
-1.379249, 1.448903, -0.9073063, 1, 0.5058824, 0, 1,
-1.358749, 0.3568726, -1.732808, 1, 0.509804, 0, 1,
-1.357481, 0.611304, -2.296944, 1, 0.5176471, 0, 1,
-1.354309, 0.3750741, -1.405211, 1, 0.5215687, 0, 1,
-1.351856, 0.6181241, -1.13497, 1, 0.5294118, 0, 1,
-1.350652, -0.8230543, -2.56678, 1, 0.5333334, 0, 1,
-1.346229, -1.855944, -3.97483, 1, 0.5411765, 0, 1,
-1.338466, 0.2779364, -1.428767, 1, 0.5450981, 0, 1,
-1.331861, 1.004297, -1.542956, 1, 0.5529412, 0, 1,
-1.326998, 0.6031258, -1.846108, 1, 0.5568628, 0, 1,
-1.326954, -0.8502943, -2.411902, 1, 0.5647059, 0, 1,
-1.321727, 0.637539, -1.039846, 1, 0.5686275, 0, 1,
-1.320847, 0.7408913, -1.811834, 1, 0.5764706, 0, 1,
-1.312475, -0.1166674, -2.179279, 1, 0.5803922, 0, 1,
-1.312329, 1.822516, 0.3242524, 1, 0.5882353, 0, 1,
-1.309296, 0.3805434, -3.036879, 1, 0.5921569, 0, 1,
-1.302169, 0.3249394, -0.7999616, 1, 0.6, 0, 1,
-1.297007, -0.2552927, -2.880847, 1, 0.6078432, 0, 1,
-1.29458, -0.3481292, -2.893058, 1, 0.6117647, 0, 1,
-1.289587, 0.9653819, -1.541641, 1, 0.6196079, 0, 1,
-1.280763, -0.5392165, -3.752775, 1, 0.6235294, 0, 1,
-1.2795, -0.3253327, -2.550825, 1, 0.6313726, 0, 1,
-1.273746, 0.9872177, -0.7794943, 1, 0.6352941, 0, 1,
-1.271949, 0.6348922, -1.213478, 1, 0.6431373, 0, 1,
-1.258171, 1.007083, -1.228355, 1, 0.6470588, 0, 1,
-1.243508, 1.681625, -2.301102, 1, 0.654902, 0, 1,
-1.240775, -1.669215, -1.334824, 1, 0.6588235, 0, 1,
-1.225823, -0.1542246, -3.312459, 1, 0.6666667, 0, 1,
-1.223261, -1.192991, -1.850243, 1, 0.6705883, 0, 1,
-1.222792, 2.315895, 1.360559, 1, 0.6784314, 0, 1,
-1.21575, 0.6949393, 0.2094643, 1, 0.682353, 0, 1,
-1.215449, 0.4619337, -1.520591, 1, 0.6901961, 0, 1,
-1.209429, -0.1339432, -1.942209, 1, 0.6941177, 0, 1,
-1.201426, 0.1697381, -1.595259, 1, 0.7019608, 0, 1,
-1.190181, -0.9606791, -1.542969, 1, 0.7098039, 0, 1,
-1.180716, 0.820403, 1.394028, 1, 0.7137255, 0, 1,
-1.176509, 1.363139, -1.057268, 1, 0.7215686, 0, 1,
-1.171914, -0.1246745, -2.262424, 1, 0.7254902, 0, 1,
-1.170933, -0.1532, -0.627956, 1, 0.7333333, 0, 1,
-1.140881, 0.8005944, -0.01058122, 1, 0.7372549, 0, 1,
-1.11966, 0.1103836, 0.09042555, 1, 0.7450981, 0, 1,
-1.107037, -0.03020762, -1.90359, 1, 0.7490196, 0, 1,
-1.096852, 0.3127928, 0.1497438, 1, 0.7568628, 0, 1,
-1.094396, -0.2735803, -3.225944, 1, 0.7607843, 0, 1,
-1.094172, 1.184432, -0.7763209, 1, 0.7686275, 0, 1,
-1.093897, 0.6440707, 0.01299853, 1, 0.772549, 0, 1,
-1.092418, 0.3034804, 0.02020806, 1, 0.7803922, 0, 1,
-1.086805, -0.7585312, -2.531927, 1, 0.7843137, 0, 1,
-1.086488, 0.135592, -1.645239, 1, 0.7921569, 0, 1,
-1.079315, 0.3125452, -1.91946, 1, 0.7960784, 0, 1,
-1.078336, 0.6193406, -1.830471, 1, 0.8039216, 0, 1,
-1.073835, 0.2702608, -0.638096, 1, 0.8117647, 0, 1,
-1.069964, 0.9640597, -0.3444094, 1, 0.8156863, 0, 1,
-1.063694, -1.395131, -3.490027, 1, 0.8235294, 0, 1,
-1.057826, 0.785373, -2.300439, 1, 0.827451, 0, 1,
-1.050394, 0.8152971, -2.195818, 1, 0.8352941, 0, 1,
-1.044914, 1.434515, -2.064313, 1, 0.8392157, 0, 1,
-1.04192, 1.088053, -1.634912, 1, 0.8470588, 0, 1,
-1.040022, 0.3263888, -0.3850943, 1, 0.8509804, 0, 1,
-1.038382, 0.7122433, -0.9623186, 1, 0.8588235, 0, 1,
-1.038234, 1.545757, -1.364448, 1, 0.8627451, 0, 1,
-1.03516, -0.6131068, -2.150289, 1, 0.8705882, 0, 1,
-1.03473, 0.02073735, -1.879649, 1, 0.8745098, 0, 1,
-1.029513, 0.2526138, -2.826768, 1, 0.8823529, 0, 1,
-1.020141, -1.190428, 0.1575247, 1, 0.8862745, 0, 1,
-1.013837, -1.000808, -2.83443, 1, 0.8941177, 0, 1,
-0.9914558, 0.4387839, -0.2860384, 1, 0.8980392, 0, 1,
-0.9857586, -1.603157, -1.752534, 1, 0.9058824, 0, 1,
-0.9782475, 0.564124, -0.5353261, 1, 0.9137255, 0, 1,
-0.9757196, 0.09092955, -1.19617, 1, 0.9176471, 0, 1,
-0.9744564, -0.6670697, -1.015801, 1, 0.9254902, 0, 1,
-0.9690842, 1.795643, -1.452047, 1, 0.9294118, 0, 1,
-0.966536, -0.6531241, -3.258157, 1, 0.9372549, 0, 1,
-0.9633228, -0.5572299, -3.59903, 1, 0.9411765, 0, 1,
-0.962659, 1.450264, -0.6474264, 1, 0.9490196, 0, 1,
-0.9608142, 0.8859292, -0.09413482, 1, 0.9529412, 0, 1,
-0.9544228, 0.1219147, -1.73469, 1, 0.9607843, 0, 1,
-0.944981, -0.5238577, -2.718667, 1, 0.9647059, 0, 1,
-0.9413557, -0.4022297, 0.4373576, 1, 0.972549, 0, 1,
-0.9291257, -0.821574, -3.666844, 1, 0.9764706, 0, 1,
-0.9248464, 0.8370783, -1.760535, 1, 0.9843137, 0, 1,
-0.9241225, 0.4159003, -0.8259298, 1, 0.9882353, 0, 1,
-0.9240018, 1.091252, -1.798434, 1, 0.9960784, 0, 1,
-0.9226171, 0.8306866, -2.202275, 0.9960784, 1, 0, 1,
-0.9205638, 0.6773516, -1.751875, 0.9921569, 1, 0, 1,
-0.9128472, 2.326887, -1.333089, 0.9843137, 1, 0, 1,
-0.9078915, 3.150247, 1.450941, 0.9803922, 1, 0, 1,
-0.9070152, 0.3160267, -1.251936, 0.972549, 1, 0, 1,
-0.9013862, -0.5754297, -2.328604, 0.9686275, 1, 0, 1,
-0.8896577, 0.115677, -1.327366, 0.9607843, 1, 0, 1,
-0.8849311, -1.125026, -2.035764, 0.9568627, 1, 0, 1,
-0.8790762, -1.430649, -3.056124, 0.9490196, 1, 0, 1,
-0.8788617, -0.4593225, -2.044887, 0.945098, 1, 0, 1,
-0.8786486, 0.2047979, -1.37566, 0.9372549, 1, 0, 1,
-0.8769413, -0.4161728, -1.501731, 0.9333333, 1, 0, 1,
-0.8718495, 0.1017834, 0.6486523, 0.9254902, 1, 0, 1,
-0.8652057, 0.1296207, -0.8247702, 0.9215686, 1, 0, 1,
-0.8422791, -1.116466, -2.57429, 0.9137255, 1, 0, 1,
-0.8394769, -0.03803386, -0.3649302, 0.9098039, 1, 0, 1,
-0.8261092, -0.9128679, -4.307788, 0.9019608, 1, 0, 1,
-0.8193331, 0.3285804, 0.8953409, 0.8941177, 1, 0, 1,
-0.8173568, 1.879523, -1.219794, 0.8901961, 1, 0, 1,
-0.8163299, 0.1032102, -5.196509, 0.8823529, 1, 0, 1,
-0.811762, -0.2716678, -2.12801, 0.8784314, 1, 0, 1,
-0.8088626, -2.202735, -2.354578, 0.8705882, 1, 0, 1,
-0.8085648, 0.4719875, 1.237517, 0.8666667, 1, 0, 1,
-0.8081642, 0.4838581, 0.1500388, 0.8588235, 1, 0, 1,
-0.804147, 0.5543373, -2.304859, 0.854902, 1, 0, 1,
-0.7974582, 0.4214009, 0.8175824, 0.8470588, 1, 0, 1,
-0.795462, 0.8882547, -0.2568173, 0.8431373, 1, 0, 1,
-0.7954022, 1.490607, -0.08338047, 0.8352941, 1, 0, 1,
-0.7919319, -2.229514, -2.813989, 0.8313726, 1, 0, 1,
-0.7882648, 0.02374371, -1.991742, 0.8235294, 1, 0, 1,
-0.7882175, -0.3198119, -1.861137, 0.8196079, 1, 0, 1,
-0.7857672, -1.07484, -2.883631, 0.8117647, 1, 0, 1,
-0.7832575, 1.458892, -1.144073, 0.8078431, 1, 0, 1,
-0.7821183, 0.8279544, 0.3595408, 0.8, 1, 0, 1,
-0.7808031, -1.103928, -1.361255, 0.7921569, 1, 0, 1,
-0.7799304, 0.0009129385, -2.764886, 0.7882353, 1, 0, 1,
-0.7683073, -1.673562, -2.111417, 0.7803922, 1, 0, 1,
-0.7663651, -0.514348, -1.688211, 0.7764706, 1, 0, 1,
-0.7659191, -2.016782, -3.229073, 0.7686275, 1, 0, 1,
-0.7649637, -0.4374671, -0.8165893, 0.7647059, 1, 0, 1,
-0.7647703, -0.8847523, -2.892496, 0.7568628, 1, 0, 1,
-0.7589989, -0.5043703, -2.937117, 0.7529412, 1, 0, 1,
-0.7551196, -1.295433, -2.831238, 0.7450981, 1, 0, 1,
-0.7548085, -0.3951582, -0.6902819, 0.7411765, 1, 0, 1,
-0.7537691, -0.9119258, -4.312622, 0.7333333, 1, 0, 1,
-0.7456279, -0.4258611, -1.97746, 0.7294118, 1, 0, 1,
-0.7429004, 1.296404, -0.9998671, 0.7215686, 1, 0, 1,
-0.7424901, -1.307261, -1.430437, 0.7176471, 1, 0, 1,
-0.7344037, 0.6580997, -1.756781, 0.7098039, 1, 0, 1,
-0.7322161, -0.6845343, -1.683115, 0.7058824, 1, 0, 1,
-0.7315077, 0.5737253, 0.2868335, 0.6980392, 1, 0, 1,
-0.7308301, -0.5517677, -3.166846, 0.6901961, 1, 0, 1,
-0.7294395, -0.5194308, -1.753803, 0.6862745, 1, 0, 1,
-0.7275219, -0.7097945, -2.011766, 0.6784314, 1, 0, 1,
-0.7265736, 1.70629, -0.5707403, 0.6745098, 1, 0, 1,
-0.7245287, -1.37638, -3.422734, 0.6666667, 1, 0, 1,
-0.7208021, 0.149113, 0.2207057, 0.6627451, 1, 0, 1,
-0.7092795, -1.999143, -2.299167, 0.654902, 1, 0, 1,
-0.7047897, 0.9744901, -0.470128, 0.6509804, 1, 0, 1,
-0.7035283, 0.2959131, -1.424249, 0.6431373, 1, 0, 1,
-0.7031005, 0.5499836, 0.3677354, 0.6392157, 1, 0, 1,
-0.7015532, 0.2080638, -1.05065, 0.6313726, 1, 0, 1,
-0.6924347, -0.8950281, -1.219738, 0.627451, 1, 0, 1,
-0.690864, -0.6592304, -2.299602, 0.6196079, 1, 0, 1,
-0.6800199, 0.1120717, -0.736163, 0.6156863, 1, 0, 1,
-0.6776438, -1.395799, -2.324804, 0.6078432, 1, 0, 1,
-0.6728401, -0.2405374, -2.328428, 0.6039216, 1, 0, 1,
-0.66659, 0.2840955, -1.191497, 0.5960785, 1, 0, 1,
-0.6638934, -1.770668, -3.581218, 0.5882353, 1, 0, 1,
-0.6562971, -0.7811382, -1.992904, 0.5843138, 1, 0, 1,
-0.6530663, 1.014074, -0.02227817, 0.5764706, 1, 0, 1,
-0.6491852, -0.1966851, -4.217197, 0.572549, 1, 0, 1,
-0.6482152, -0.497571, -3.143998, 0.5647059, 1, 0, 1,
-0.6451939, -1.561977, -2.825135, 0.5607843, 1, 0, 1,
-0.6427029, -1.51909, -3.21724, 0.5529412, 1, 0, 1,
-0.6396614, 1.446246, -0.232054, 0.5490196, 1, 0, 1,
-0.6373164, -0.5127673, -0.8685278, 0.5411765, 1, 0, 1,
-0.6357723, -0.3947051, -0.7620287, 0.5372549, 1, 0, 1,
-0.633817, -1.507003, -3.721405, 0.5294118, 1, 0, 1,
-0.6329793, -0.2682749, -2.170096, 0.5254902, 1, 0, 1,
-0.6313027, 1.290769, -3.077167, 0.5176471, 1, 0, 1,
-0.6283715, 0.1941806, -1.054671, 0.5137255, 1, 0, 1,
-0.6229397, -2.107535, -2.432346, 0.5058824, 1, 0, 1,
-0.6227681, -1.0796, -2.399112, 0.5019608, 1, 0, 1,
-0.620182, -0.4536595, -0.444649, 0.4941176, 1, 0, 1,
-0.6188435, -0.5298368, -3.115258, 0.4862745, 1, 0, 1,
-0.614165, -0.7217091, -2.61745, 0.4823529, 1, 0, 1,
-0.6091635, -0.2758314, -1.369089, 0.4745098, 1, 0, 1,
-0.6006269, -0.1913636, -1.584673, 0.4705882, 1, 0, 1,
-0.5934083, -0.2619929, -1.723987, 0.4627451, 1, 0, 1,
-0.5919828, -0.09034346, -2.347848, 0.4588235, 1, 0, 1,
-0.5917319, 1.302605, -0.4162307, 0.4509804, 1, 0, 1,
-0.5913985, 1.220426, -0.2309615, 0.4470588, 1, 0, 1,
-0.5902585, 1.044199, -0.8700661, 0.4392157, 1, 0, 1,
-0.5853397, 1.73386, -1.096032, 0.4352941, 1, 0, 1,
-0.5826579, 0.91341, 0.057156, 0.427451, 1, 0, 1,
-0.5809316, -1.118491, -3.292084, 0.4235294, 1, 0, 1,
-0.5801361, -0.5096239, -2.225461, 0.4156863, 1, 0, 1,
-0.5773827, -0.6539331, -3.04232, 0.4117647, 1, 0, 1,
-0.5744038, 0.2251883, -2.77144, 0.4039216, 1, 0, 1,
-0.5723121, 1.454468, -0.6251125, 0.3960784, 1, 0, 1,
-0.5680717, -0.02329274, 0.2689621, 0.3921569, 1, 0, 1,
-0.5680482, -0.3480424, -1.83863, 0.3843137, 1, 0, 1,
-0.5664335, 0.3358927, 0.4843476, 0.3803922, 1, 0, 1,
-0.5652818, 0.777844, 0.3654634, 0.372549, 1, 0, 1,
-0.5639999, 0.9178103, -1.35739, 0.3686275, 1, 0, 1,
-0.5632109, 0.06621595, -0.3640476, 0.3607843, 1, 0, 1,
-0.5629632, 1.31278, 1.226298, 0.3568628, 1, 0, 1,
-0.5612777, -0.5402269, -1.834329, 0.3490196, 1, 0, 1,
-0.561265, -0.3293441, -3.878203, 0.345098, 1, 0, 1,
-0.557788, -0.5077481, -1.920315, 0.3372549, 1, 0, 1,
-0.5573664, 1.315953, 1.407869, 0.3333333, 1, 0, 1,
-0.5555504, -0.6161321, -2.030808, 0.3254902, 1, 0, 1,
-0.5512278, 0.2304308, 0.1575209, 0.3215686, 1, 0, 1,
-0.5447242, 0.03787299, -2.521938, 0.3137255, 1, 0, 1,
-0.5433637, 0.2075295, 0.1385456, 0.3098039, 1, 0, 1,
-0.5343317, -1.373436, -2.688269, 0.3019608, 1, 0, 1,
-0.5339618, 2.654402, 1.009385, 0.2941177, 1, 0, 1,
-0.5314543, -0.5735982, -1.934575, 0.2901961, 1, 0, 1,
-0.5312653, -0.8644655, -1.493139, 0.282353, 1, 0, 1,
-0.5286834, -1.772014, -4.058893, 0.2784314, 1, 0, 1,
-0.5277907, 0.4236913, -0.92156, 0.2705882, 1, 0, 1,
-0.5236693, -0.132799, -0.8181543, 0.2666667, 1, 0, 1,
-0.5226077, 1.068104, 0.2982434, 0.2588235, 1, 0, 1,
-0.520652, 0.4546402, -0.2556147, 0.254902, 1, 0, 1,
-0.5188234, 1.441806, 1.045428, 0.2470588, 1, 0, 1,
-0.5155569, -2.000829, -2.839335, 0.2431373, 1, 0, 1,
-0.5141323, -0.2088476, -0.740986, 0.2352941, 1, 0, 1,
-0.5120024, 0.3943376, 0.2077243, 0.2313726, 1, 0, 1,
-0.5119279, -0.2230901, -3.674758, 0.2235294, 1, 0, 1,
-0.5107683, -0.285227, -3.083936, 0.2196078, 1, 0, 1,
-0.5074081, -0.005736223, -3.065565, 0.2117647, 1, 0, 1,
-0.5017937, -1.412505, -1.312881, 0.2078431, 1, 0, 1,
-0.5007137, 1.116055, -1.23002, 0.2, 1, 0, 1,
-0.5003681, 0.07206239, -0.2242725, 0.1921569, 1, 0, 1,
-0.4999525, 1.524264, 1.818659, 0.1882353, 1, 0, 1,
-0.4950155, -1.739857, -4.427166, 0.1803922, 1, 0, 1,
-0.4940901, 0.3034324, 1.182081, 0.1764706, 1, 0, 1,
-0.4924557, 1.062479, -1.539346, 0.1686275, 1, 0, 1,
-0.4909822, 0.9060749, -1.456729, 0.1647059, 1, 0, 1,
-0.4892814, 0.5485631, -0.3525722, 0.1568628, 1, 0, 1,
-0.4859626, -0.4588187, -2.106396, 0.1529412, 1, 0, 1,
-0.4852464, -0.4690972, -1.825735, 0.145098, 1, 0, 1,
-0.4848376, -0.6764052, -3.192808, 0.1411765, 1, 0, 1,
-0.4843717, 1.181754, -0.05048046, 0.1333333, 1, 0, 1,
-0.4834776, -2.5196, -3.74509, 0.1294118, 1, 0, 1,
-0.4827359, 0.260019, -1.711649, 0.1215686, 1, 0, 1,
-0.4795291, -0.8417298, -3.127432, 0.1176471, 1, 0, 1,
-0.4710932, 0.46296, -1.495503, 0.1098039, 1, 0, 1,
-0.4693353, -0.7993042, -2.499001, 0.1058824, 1, 0, 1,
-0.469259, 0.02864283, -2.370499, 0.09803922, 1, 0, 1,
-0.4692463, 0.7028396, 0.06844427, 0.09019608, 1, 0, 1,
-0.4597488, -1.555073, -4.449596, 0.08627451, 1, 0, 1,
-0.456736, -1.716599, -2.295587, 0.07843138, 1, 0, 1,
-0.4547242, -0.08514766, -2.31311, 0.07450981, 1, 0, 1,
-0.4481596, 1.730653, -0.5928943, 0.06666667, 1, 0, 1,
-0.4442909, -0.5595362, -2.127694, 0.0627451, 1, 0, 1,
-0.443279, 0.7514759, -1.633096, 0.05490196, 1, 0, 1,
-0.4380241, -1.021021, -1.511321, 0.05098039, 1, 0, 1,
-0.4370611, 0.2509415, -1.878642, 0.04313726, 1, 0, 1,
-0.4323554, 0.5460823, -0.8346313, 0.03921569, 1, 0, 1,
-0.4237652, 0.628372, -0.1668593, 0.03137255, 1, 0, 1,
-0.4184546, 0.7675373, -0.6732211, 0.02745098, 1, 0, 1,
-0.4174423, -0.2081662, -0.6223902, 0.01960784, 1, 0, 1,
-0.4163845, 1.38879, 0.681236, 0.01568628, 1, 0, 1,
-0.4161308, -1.505765, -2.633198, 0.007843138, 1, 0, 1,
-0.4151573, -0.6052396, -1.980844, 0.003921569, 1, 0, 1,
-0.4130197, 2.178759, 2.688059, 0, 1, 0.003921569, 1,
-0.3975386, 0.4025394, -1.524219, 0, 1, 0.01176471, 1,
-0.392729, 1.085448, -0.2415336, 0, 1, 0.01568628, 1,
-0.390157, -0.01378021, -0.06259654, 0, 1, 0.02352941, 1,
-0.3887641, 0.8843302, -0.7519089, 0, 1, 0.02745098, 1,
-0.3875425, 1.829368, 0.1532333, 0, 1, 0.03529412, 1,
-0.3844375, -1.063166, -1.352034, 0, 1, 0.03921569, 1,
-0.3789636, 0.2027188, -0.2767815, 0, 1, 0.04705882, 1,
-0.3709481, 0.4430589, 0.5764921, 0, 1, 0.05098039, 1,
-0.3702176, -0.6891375, -2.916069, 0, 1, 0.05882353, 1,
-0.3677014, -0.7871423, -1.499163, 0, 1, 0.0627451, 1,
-0.3669117, -1.137119, -2.729711, 0, 1, 0.07058824, 1,
-0.3666327, -0.1204171, -4.281846, 0, 1, 0.07450981, 1,
-0.3642556, 0.2620955, -0.3976775, 0, 1, 0.08235294, 1,
-0.3553366, 0.680584, 0.2192199, 0, 1, 0.08627451, 1,
-0.355263, -0.9732749, -2.557912, 0, 1, 0.09411765, 1,
-0.3411471, -0.17139, -2.637341, 0, 1, 0.1019608, 1,
-0.3318011, 0.9619318, 1.8585, 0, 1, 0.1058824, 1,
-0.3232576, 0.9739708, -1.377454, 0, 1, 0.1137255, 1,
-0.3220032, 0.1308528, -1.257613, 0, 1, 0.1176471, 1,
-0.3205798, -0.2595928, -2.451111, 0, 1, 0.1254902, 1,
-0.320475, 0.2849056, 0.4938824, 0, 1, 0.1294118, 1,
-0.3195495, 0.1939945, -1.468633, 0, 1, 0.1372549, 1,
-0.3182237, 1.421727, 0.4322299, 0, 1, 0.1411765, 1,
-0.3166334, -0.08430332, -1.817393, 0, 1, 0.1490196, 1,
-0.31601, -0.8116027, -2.345756, 0, 1, 0.1529412, 1,
-0.3143938, 0.9059229, -1.277463, 0, 1, 0.1607843, 1,
-0.3117962, -0.1900982, -1.916588, 0, 1, 0.1647059, 1,
-0.3089612, 0.3448308, 0.5902768, 0, 1, 0.172549, 1,
-0.3087634, 0.0005494257, -2.559705, 0, 1, 0.1764706, 1,
-0.3067995, 1.196204, 1.221993, 0, 1, 0.1843137, 1,
-0.3066531, 2.023757, -0.6439565, 0, 1, 0.1882353, 1,
-0.3055098, -1.039856, -1.115353, 0, 1, 0.1960784, 1,
-0.3050478, -0.1517657, -1.409498, 0, 1, 0.2039216, 1,
-0.3019753, -0.7356918, -2.211388, 0, 1, 0.2078431, 1,
-0.2993276, 0.6012573, -2.740357, 0, 1, 0.2156863, 1,
-0.2985813, -1.380144, -2.933841, 0, 1, 0.2196078, 1,
-0.2984889, -1.272483, -2.088186, 0, 1, 0.227451, 1,
-0.2982012, -1.351212, -3.013869, 0, 1, 0.2313726, 1,
-0.2920333, -1.047227, -2.958173, 0, 1, 0.2392157, 1,
-0.2816621, -0.2653497, -0.6688097, 0, 1, 0.2431373, 1,
-0.2719761, 0.7931749, 0.7381759, 0, 1, 0.2509804, 1,
-0.2698913, 0.4110296, -2.070683, 0, 1, 0.254902, 1,
-0.2684339, -0.4864193, -3.828991, 0, 1, 0.2627451, 1,
-0.2618577, 2.191346, -0.4876739, 0, 1, 0.2666667, 1,
-0.2607478, -1.049508, -5.185836, 0, 1, 0.2745098, 1,
-0.251628, -1.242884, -3.803996, 0, 1, 0.2784314, 1,
-0.2458078, -0.3452391, -3.297368, 0, 1, 0.2862745, 1,
-0.2454354, 0.0844036, -0.5835925, 0, 1, 0.2901961, 1,
-0.2439373, 0.1269252, -3.272374, 0, 1, 0.2980392, 1,
-0.2428183, 2.625853, -0.3808948, 0, 1, 0.3058824, 1,
-0.2363036, 1.835165, 0.526316, 0, 1, 0.3098039, 1,
-0.2286194, -0.2766392, -3.135391, 0, 1, 0.3176471, 1,
-0.2263504, 2.388064, 0.3681693, 0, 1, 0.3215686, 1,
-0.2201377, 0.4666343, 1.441909, 0, 1, 0.3294118, 1,
-0.2200577, -0.6920314, 0.2398956, 0, 1, 0.3333333, 1,
-0.2190734, 1.10035, 0.4449505, 0, 1, 0.3411765, 1,
-0.2184783, 0.8727169, -0.5433286, 0, 1, 0.345098, 1,
-0.21776, 0.424309, 0.2486387, 0, 1, 0.3529412, 1,
-0.2166233, -0.7085603, -2.260276, 0, 1, 0.3568628, 1,
-0.2161026, 0.7132354, -0.7490145, 0, 1, 0.3647059, 1,
-0.214242, -0.3339148, -3.009861, 0, 1, 0.3686275, 1,
-0.210842, 1.469638, 0.1642406, 0, 1, 0.3764706, 1,
-0.2106482, -2.080064, -4.139334, 0, 1, 0.3803922, 1,
-0.2078029, -0.423507, -3.071929, 0, 1, 0.3882353, 1,
-0.2069505, -0.2130017, -2.434658, 0, 1, 0.3921569, 1,
-0.2065554, -0.5323015, -4.087337, 0, 1, 0.4, 1,
-0.2064311, 0.1724428, -0.5205629, 0, 1, 0.4078431, 1,
-0.2063162, -0.8612435, -1.972541, 0, 1, 0.4117647, 1,
-0.2053417, 1.072734, -0.2353505, 0, 1, 0.4196078, 1,
-0.2047665, -0.4958686, -5.291809, 0, 1, 0.4235294, 1,
-0.2026015, 0.2396194, 0.6598625, 0, 1, 0.4313726, 1,
-0.2022967, -0.01446411, -1.461484, 0, 1, 0.4352941, 1,
-0.1983672, 2.505062, 0.9640962, 0, 1, 0.4431373, 1,
-0.1953897, 0.1277521, -0.08042542, 0, 1, 0.4470588, 1,
-0.1885995, -1.962482, -3.45208, 0, 1, 0.454902, 1,
-0.1824382, 1.727947, -1.405789, 0, 1, 0.4588235, 1,
-0.1822087, 1.400152, -1.279359, 0, 1, 0.4666667, 1,
-0.180452, -0.4747996, -3.64786, 0, 1, 0.4705882, 1,
-0.1784746, -0.8326509, -5.389081, 0, 1, 0.4784314, 1,
-0.1765372, -1.029362, -3.821795, 0, 1, 0.4823529, 1,
-0.1732436, 1.706974, 1.4767, 0, 1, 0.4901961, 1,
-0.1713974, 1.022472, -1.961982, 0, 1, 0.4941176, 1,
-0.1710316, -0.05832212, -2.055553, 0, 1, 0.5019608, 1,
-0.1646339, 0.0224155, -0.9237111, 0, 1, 0.509804, 1,
-0.1632894, 0.712104, -1.652397, 0, 1, 0.5137255, 1,
-0.1627633, 0.3819543, -0.9240201, 0, 1, 0.5215687, 1,
-0.1598442, 0.5576207, -2.096696, 0, 1, 0.5254902, 1,
-0.1577182, 0.1557678, -1.117142, 0, 1, 0.5333334, 1,
-0.1567718, -0.8228086, -4.28124, 0, 1, 0.5372549, 1,
-0.1544483, -0.4860784, -3.747495, 0, 1, 0.5450981, 1,
-0.1540562, -1.075698, -3.58612, 0, 1, 0.5490196, 1,
-0.152382, 0.8377988, -3.243844, 0, 1, 0.5568628, 1,
-0.1505068, -0.1491596, -2.932015, 0, 1, 0.5607843, 1,
-0.1503158, 1.950847, 0.5030444, 0, 1, 0.5686275, 1,
-0.1465012, -0.1845831, -3.95751, 0, 1, 0.572549, 1,
-0.1458356, 1.041783, 0.01029257, 0, 1, 0.5803922, 1,
-0.1456483, -1.120098, -4.0134, 0, 1, 0.5843138, 1,
-0.138451, -0.7599355, -2.136166, 0, 1, 0.5921569, 1,
-0.1378917, -0.4131829, -2.741819, 0, 1, 0.5960785, 1,
-0.1369286, 0.7609176, -0.3842757, 0, 1, 0.6039216, 1,
-0.1347381, -1.907739, -3.698968, 0, 1, 0.6117647, 1,
-0.1302425, -0.5904364, -4.621785, 0, 1, 0.6156863, 1,
-0.1270863, 0.2783741, 2.006833, 0, 1, 0.6235294, 1,
-0.1205844, 0.05256574, -1.522732, 0, 1, 0.627451, 1,
-0.1200842, -0.02955011, -1.575029, 0, 1, 0.6352941, 1,
-0.1200463, 2.826992, 0.7642261, 0, 1, 0.6392157, 1,
-0.1200157, 0.2285353, 0.6475626, 0, 1, 0.6470588, 1,
-0.1197392, 0.7047085, 1.271775, 0, 1, 0.6509804, 1,
-0.119204, -0.0005322885, -2.22844, 0, 1, 0.6588235, 1,
-0.1190281, -0.5975283, -2.345882, 0, 1, 0.6627451, 1,
-0.113901, 0.07950373, -1.721359, 0, 1, 0.6705883, 1,
-0.1123559, -1.551581, -4.447896, 0, 1, 0.6745098, 1,
-0.1123367, 0.2618007, -1.220332, 0, 1, 0.682353, 1,
-0.1113626, 0.2351309, 0.7141248, 0, 1, 0.6862745, 1,
-0.1019155, -0.93221, -2.860754, 0, 1, 0.6941177, 1,
-0.09889577, 1.138427, -0.05040965, 0, 1, 0.7019608, 1,
-0.09678917, 0.9154181, -0.7275854, 0, 1, 0.7058824, 1,
-0.09617634, -1.793624, -2.539185, 0, 1, 0.7137255, 1,
-0.08571942, 1.443597, -1.226101, 0, 1, 0.7176471, 1,
-0.08315054, -0.9991156, -1.962748, 0, 1, 0.7254902, 1,
-0.078228, 0.6279996, -2.171203, 0, 1, 0.7294118, 1,
-0.07775743, 0.3674684, 0.8452842, 0, 1, 0.7372549, 1,
-0.07639472, 1.960013, 1.457932, 0, 1, 0.7411765, 1,
-0.07489903, 0.5840443, 0.3490862, 0, 1, 0.7490196, 1,
-0.06931958, 1.406295, -0.5259125, 0, 1, 0.7529412, 1,
-0.06573708, -0.09786756, -2.156453, 0, 1, 0.7607843, 1,
-0.06212764, -0.127916, -4.19889, 0, 1, 0.7647059, 1,
-0.06093457, -1.731884, -1.500017, 0, 1, 0.772549, 1,
-0.05859579, -1.183774, -2.444276, 0, 1, 0.7764706, 1,
-0.05837772, -1.404298, -2.07276, 0, 1, 0.7843137, 1,
-0.05764273, 0.03349298, -0.8600928, 0, 1, 0.7882353, 1,
-0.05742225, -0.7485647, -4.119, 0, 1, 0.7960784, 1,
-0.05684894, 0.6329858, 1.549948, 0, 1, 0.8039216, 1,
-0.05610092, 0.9941915, -0.05214774, 0, 1, 0.8078431, 1,
-0.05595985, 1.783076, 0.8232831, 0, 1, 0.8156863, 1,
-0.05560948, -0.4309421, -0.7966853, 0, 1, 0.8196079, 1,
-0.05302004, 0.831469, 0.04994854, 0, 1, 0.827451, 1,
-0.05072843, 2.118557, 0.08359287, 0, 1, 0.8313726, 1,
-0.04871353, 1.332645, -1.211329, 0, 1, 0.8392157, 1,
-0.0479474, 0.7059631, -1.867637, 0, 1, 0.8431373, 1,
-0.04284047, -0.9982415, -5.14962, 0, 1, 0.8509804, 1,
-0.04014614, 0.04713156, -1.655463, 0, 1, 0.854902, 1,
-0.03684682, 0.1996816, -0.9853199, 0, 1, 0.8627451, 1,
-0.02672726, 1.724849, 0.7666615, 0, 1, 0.8666667, 1,
-0.02155115, -0.3740045, -1.87926, 0, 1, 0.8745098, 1,
-0.01586248, -0.0768949, -2.686358, 0, 1, 0.8784314, 1,
-0.01375844, 2.273604, -0.1448132, 0, 1, 0.8862745, 1,
-0.01300468, 0.50701, 0.5735404, 0, 1, 0.8901961, 1,
-0.0119031, -0.6257424, -4.512667, 0, 1, 0.8980392, 1,
-0.00963305, -0.976014, -1.59138, 0, 1, 0.9058824, 1,
-0.009572883, -0.05075711, -3.315164, 0, 1, 0.9098039, 1,
-0.007620925, -1.747137, -3.518047, 0, 1, 0.9176471, 1,
-0.005109914, -0.4594434, -2.637229, 0, 1, 0.9215686, 1,
-0.002416561, -0.8308964, -4.121116, 0, 1, 0.9294118, 1,
-0.001087109, 0.0729658, 0.2268108, 0, 1, 0.9333333, 1,
9.862013e-05, 0.664488, 0.6035796, 0, 1, 0.9411765, 1,
0.002052724, 0.4931092, -0.1684181, 0, 1, 0.945098, 1,
0.006327624, -0.4747181, 3.90481, 0, 1, 0.9529412, 1,
0.009348593, -0.5732922, 3.293842, 0, 1, 0.9568627, 1,
0.01831126, 0.9195837, -2.207877, 0, 1, 0.9647059, 1,
0.01950512, 0.4995533, -0.8504549, 0, 1, 0.9686275, 1,
0.01973924, 1.141403, 2.033839, 0, 1, 0.9764706, 1,
0.02460219, -0.1191196, 3.53926, 0, 1, 0.9803922, 1,
0.02476843, 1.170068, -0.9353993, 0, 1, 0.9882353, 1,
0.02664261, 1.342059, -0.7102436, 0, 1, 0.9921569, 1,
0.02792214, -0.2480479, 3.295637, 0, 1, 1, 1,
0.02922846, 0.07823066, -0.8411742, 0, 0.9921569, 1, 1,
0.03134282, -0.5343168, 2.485764, 0, 0.9882353, 1, 1,
0.03295689, 0.4532879, 0.847472, 0, 0.9803922, 1, 1,
0.03869368, 1.000752, 0.2493409, 0, 0.9764706, 1, 1,
0.0398444, -1.599846, 3.899088, 0, 0.9686275, 1, 1,
0.0408377, 0.7061474, 1.475221, 0, 0.9647059, 1, 1,
0.04361876, 0.3463237, -0.3305776, 0, 0.9568627, 1, 1,
0.04950446, -1.604192, 4.346907, 0, 0.9529412, 1, 1,
0.05011132, 0.5849177, -1.273732, 0, 0.945098, 1, 1,
0.05299835, 1.750208, -0.2511407, 0, 0.9411765, 1, 1,
0.05540509, -0.7586028, 1.050807, 0, 0.9333333, 1, 1,
0.05745466, 1.333486, 0.7801643, 0, 0.9294118, 1, 1,
0.06134684, -0.7085262, 4.244192, 0, 0.9215686, 1, 1,
0.0615413, 1.177604, 0.4736728, 0, 0.9176471, 1, 1,
0.06195694, -0.2266787, 2.999586, 0, 0.9098039, 1, 1,
0.06669991, -0.9845186, 3.978118, 0, 0.9058824, 1, 1,
0.06957898, -0.4614948, 3.188775, 0, 0.8980392, 1, 1,
0.07395511, 1.199834, -2.613168, 0, 0.8901961, 1, 1,
0.07472331, 0.3718428, 1.083387, 0, 0.8862745, 1, 1,
0.07599384, -0.5143234, 2.806333, 0, 0.8784314, 1, 1,
0.0784762, 1.322441, 1.112355, 0, 0.8745098, 1, 1,
0.08511601, -0.6629041, 3.020025, 0, 0.8666667, 1, 1,
0.08715808, -0.1139146, 2.556132, 0, 0.8627451, 1, 1,
0.08893932, 0.3869611, 1.020012, 0, 0.854902, 1, 1,
0.08969488, 0.7451904, 1.468028, 0, 0.8509804, 1, 1,
0.09009201, -0.572543, 2.271828, 0, 0.8431373, 1, 1,
0.09174564, -0.2936315, 1.467264, 0, 0.8392157, 1, 1,
0.0937128, -0.3490745, 2.036418, 0, 0.8313726, 1, 1,
0.1001214, -2.185091, 2.537594, 0, 0.827451, 1, 1,
0.1010332, -0.4588685, 4.248477, 0, 0.8196079, 1, 1,
0.1013576, -0.9000509, 3.61122, 0, 0.8156863, 1, 1,
0.101566, 0.4326484, 0.007847014, 0, 0.8078431, 1, 1,
0.1067612, -0.5981302, 3.405869, 0, 0.8039216, 1, 1,
0.10677, 0.7158324, 2.030643, 0, 0.7960784, 1, 1,
0.1079398, -0.2840639, 3.405658, 0, 0.7882353, 1, 1,
0.1090519, 0.3147425, 0.888138, 0, 0.7843137, 1, 1,
0.1175556, -1.985713, 3.618356, 0, 0.7764706, 1, 1,
0.120858, -1.435102, 1.750923, 0, 0.772549, 1, 1,
0.1212103, 0.1675968, 0.3387265, 0, 0.7647059, 1, 1,
0.1212146, 0.4748059, 1.395278, 0, 0.7607843, 1, 1,
0.1223164, -0.8143878, 3.236742, 0, 0.7529412, 1, 1,
0.1229862, 0.3735853, 0.5029304, 0, 0.7490196, 1, 1,
0.1340439, 1.4232, 0.7385728, 0, 0.7411765, 1, 1,
0.1342259, 0.4255565, 0.1845063, 0, 0.7372549, 1, 1,
0.1358865, 1.681209, -0.5956188, 0, 0.7294118, 1, 1,
0.1375859, 1.875218, 0.4384323, 0, 0.7254902, 1, 1,
0.1568474, 0.4650984, 0.2867856, 0, 0.7176471, 1, 1,
0.1616511, 0.3496033, -0.3830234, 0, 0.7137255, 1, 1,
0.1659737, -0.5766981, 3.030144, 0, 0.7058824, 1, 1,
0.1664763, 0.6707116, 0.9352097, 0, 0.6980392, 1, 1,
0.1665357, -1.488615, 3.366529, 0, 0.6941177, 1, 1,
0.1687972, 0.06660109, 1.197325, 0, 0.6862745, 1, 1,
0.1696818, 0.1725269, 0.6053407, 0, 0.682353, 1, 1,
0.1713214, -0.3661009, 2.922341, 0, 0.6745098, 1, 1,
0.1725097, -0.3344295, 3.742923, 0, 0.6705883, 1, 1,
0.1730922, 0.7581519, 1.446956, 0, 0.6627451, 1, 1,
0.173524, 0.5709428, 1.154431, 0, 0.6588235, 1, 1,
0.1737491, 1.11841, -0.05541446, 0, 0.6509804, 1, 1,
0.1750598, 0.5091926, 0.5604808, 0, 0.6470588, 1, 1,
0.1769843, 0.8004418, 0.4422205, 0, 0.6392157, 1, 1,
0.1791745, 1.125535, 2.540784, 0, 0.6352941, 1, 1,
0.1840175, 3.471447, 0.2383084, 0, 0.627451, 1, 1,
0.1847095, -0.3802692, 1.444224, 0, 0.6235294, 1, 1,
0.1918504, -1.914103, 1.748656, 0, 0.6156863, 1, 1,
0.1925184, -0.1949724, 2.344947, 0, 0.6117647, 1, 1,
0.1942156, -0.4032472, 1.978503, 0, 0.6039216, 1, 1,
0.1988117, 1.856841, -0.8101287, 0, 0.5960785, 1, 1,
0.2061595, -1.051266, 1.200695, 0, 0.5921569, 1, 1,
0.2065597, -0.863925, 2.424707, 0, 0.5843138, 1, 1,
0.2131741, 1.7289, -0.1364724, 0, 0.5803922, 1, 1,
0.2133414, 1.22475, 0.9873825, 0, 0.572549, 1, 1,
0.2135355, 0.04571785, 0.9554316, 0, 0.5686275, 1, 1,
0.2141291, 1.26478, 0.2913153, 0, 0.5607843, 1, 1,
0.2164088, -0.06646899, 3.04808, 0, 0.5568628, 1, 1,
0.2179002, 0.712884, 1.936343, 0, 0.5490196, 1, 1,
0.2229085, 0.869484, -0.6394522, 0, 0.5450981, 1, 1,
0.2260155, -0.07659462, 1.45979, 0, 0.5372549, 1, 1,
0.2269179, -0.4166633, 3.449131, 0, 0.5333334, 1, 1,
0.2343383, -1.026775, 2.771634, 0, 0.5254902, 1, 1,
0.2434839, -0.5301941, 3.940643, 0, 0.5215687, 1, 1,
0.247041, 1.833003, -2.660311, 0, 0.5137255, 1, 1,
0.2485693, -0.8639123, 2.68816, 0, 0.509804, 1, 1,
0.2511915, -1.150656, 2.562286, 0, 0.5019608, 1, 1,
0.2650432, -0.9612955, 1.651557, 0, 0.4941176, 1, 1,
0.2657905, -0.8789517, 2.372375, 0, 0.4901961, 1, 1,
0.2662567, -0.571075, 1.510818, 0, 0.4823529, 1, 1,
0.267348, -0.8194398, 2.634503, 0, 0.4784314, 1, 1,
0.2706843, -0.3220813, 2.050782, 0, 0.4705882, 1, 1,
0.2711543, -0.7166391, 3.581227, 0, 0.4666667, 1, 1,
0.2744313, 2.364221, -1.246944, 0, 0.4588235, 1, 1,
0.2746814, 0.92232, 1.280329, 0, 0.454902, 1, 1,
0.2756565, 0.8144305, -1.237648, 0, 0.4470588, 1, 1,
0.2781144, -0.6373305, 2.144769, 0, 0.4431373, 1, 1,
0.279467, 0.9228636, -0.7441539, 0, 0.4352941, 1, 1,
0.2815749, 0.4838461, 2.480859, 0, 0.4313726, 1, 1,
0.2828774, -0.369313, 3.485067, 0, 0.4235294, 1, 1,
0.2882235, -1.207724, 3.502395, 0, 0.4196078, 1, 1,
0.288692, 0.2073856, 0.5333533, 0, 0.4117647, 1, 1,
0.2904607, 0.2076806, -0.6097924, 0, 0.4078431, 1, 1,
0.2908219, -1.360575, 2.727994, 0, 0.4, 1, 1,
0.2931674, -0.821003, 2.118768, 0, 0.3921569, 1, 1,
0.2965063, 0.6625414, 0.68985, 0, 0.3882353, 1, 1,
0.311343, 0.4136367, -1.214782, 0, 0.3803922, 1, 1,
0.3118896, 0.9048235, 0.9963511, 0, 0.3764706, 1, 1,
0.3137376, 0.7829382, 1.196012, 0, 0.3686275, 1, 1,
0.3164193, -1.428913, 2.885293, 0, 0.3647059, 1, 1,
0.3198735, 1.007531, -0.007846339, 0, 0.3568628, 1, 1,
0.3209234, -1.930107, 4.145524, 0, 0.3529412, 1, 1,
0.3210012, -0.7757204, 1.435164, 0, 0.345098, 1, 1,
0.3213826, 0.5229648, 1.009858, 0, 0.3411765, 1, 1,
0.3214669, -0.07358457, 1.347476, 0, 0.3333333, 1, 1,
0.3216877, 0.1809259, 0.7990808, 0, 0.3294118, 1, 1,
0.3233519, 1.811254, -1.210151, 0, 0.3215686, 1, 1,
0.3243332, 0.5059091, 1.614012, 0, 0.3176471, 1, 1,
0.3256161, 0.5145118, 1.239743, 0, 0.3098039, 1, 1,
0.3362839, 0.03894999, 1.254982, 0, 0.3058824, 1, 1,
0.33693, 0.1080988, 0.9363408, 0, 0.2980392, 1, 1,
0.3381745, 0.4603814, 0.8236266, 0, 0.2901961, 1, 1,
0.3384126, 1.005014, 1.879317, 0, 0.2862745, 1, 1,
0.341439, -0.6831922, 2.620068, 0, 0.2784314, 1, 1,
0.3468546, 0.5722227, 1.638386, 0, 0.2745098, 1, 1,
0.3480024, -0.205774, 1.165542, 0, 0.2666667, 1, 1,
0.3487213, 0.8151979, 1.186099, 0, 0.2627451, 1, 1,
0.3546108, -1.853994, 3.072833, 0, 0.254902, 1, 1,
0.3555056, -1.494738, 2.252888, 0, 0.2509804, 1, 1,
0.3582903, -0.2188936, 1.632256, 0, 0.2431373, 1, 1,
0.3591616, -0.4731169, 1.943198, 0, 0.2392157, 1, 1,
0.3637156, -0.8158135, 4.185839, 0, 0.2313726, 1, 1,
0.3742792, -1.897701, 2.306038, 0, 0.227451, 1, 1,
0.374457, 0.2148033, 0.9111109, 0, 0.2196078, 1, 1,
0.3756388, 0.1193596, 0.9976547, 0, 0.2156863, 1, 1,
0.3760629, -0.1550743, 1.816522, 0, 0.2078431, 1, 1,
0.3776424, -1.012503, 2.936551, 0, 0.2039216, 1, 1,
0.3808639, 0.2533298, 1.070501, 0, 0.1960784, 1, 1,
0.3813874, -0.3600832, 1.423701, 0, 0.1882353, 1, 1,
0.3871453, -1.249158, 2.888262, 0, 0.1843137, 1, 1,
0.3892388, 0.9374994, 1.489588, 0, 0.1764706, 1, 1,
0.3907956, -0.1284089, 1.009964, 0, 0.172549, 1, 1,
0.4007409, 0.3613209, 0.7107817, 0, 0.1647059, 1, 1,
0.4013823, -0.05024435, 1.278522, 0, 0.1607843, 1, 1,
0.4024841, 1.224204, -0.4592769, 0, 0.1529412, 1, 1,
0.4066578, -0.6393346, 2.745502, 0, 0.1490196, 1, 1,
0.4070752, 0.5162116, 0.496319, 0, 0.1411765, 1, 1,
0.4089195, 1.52477, -0.4907908, 0, 0.1372549, 1, 1,
0.4119793, 1.640266, 1.591421, 0, 0.1294118, 1, 1,
0.4127124, -0.6919755, 2.539604, 0, 0.1254902, 1, 1,
0.4131103, -1.532912, 2.303956, 0, 0.1176471, 1, 1,
0.4151353, -0.6966336, 2.351214, 0, 0.1137255, 1, 1,
0.4151515, -0.4037313, 2.848097, 0, 0.1058824, 1, 1,
0.4215031, 0.5022411, 0.3085241, 0, 0.09803922, 1, 1,
0.4217302, -0.8250149, 3.44785, 0, 0.09411765, 1, 1,
0.4239254, 0.9050996, 1.615986, 0, 0.08627451, 1, 1,
0.4264528, 1.503718, 0.9564684, 0, 0.08235294, 1, 1,
0.4274964, -1.61405, 2.474427, 0, 0.07450981, 1, 1,
0.4280237, 0.42434, -0.426451, 0, 0.07058824, 1, 1,
0.4322192, 0.9044521, 0.9038892, 0, 0.0627451, 1, 1,
0.4383639, 0.9189853, 1.032668, 0, 0.05882353, 1, 1,
0.4407074, 2.281239, -0.1676484, 0, 0.05098039, 1, 1,
0.4429633, 0.1905496, 0.01642142, 0, 0.04705882, 1, 1,
0.4441199, 0.7088458, 1.606541, 0, 0.03921569, 1, 1,
0.4496471, -0.6806675, 3.16704, 0, 0.03529412, 1, 1,
0.4540566, -1.108273, 2.370981, 0, 0.02745098, 1, 1,
0.4569937, 0.05875916, 1.478326, 0, 0.02352941, 1, 1,
0.458317, -0.3049701, 1.940611, 0, 0.01568628, 1, 1,
0.4638843, 1.122389, 1.513331, 0, 0.01176471, 1, 1,
0.467366, -0.1906599, 2.371966, 0, 0.003921569, 1, 1,
0.4678501, 1.008638, -0.06914941, 0.003921569, 0, 1, 1,
0.4729924, 1.333533, -0.6610179, 0.007843138, 0, 1, 1,
0.4730002, -0.1409921, 2.140039, 0.01568628, 0, 1, 1,
0.4739301, 1.901924, 0.7855643, 0.01960784, 0, 1, 1,
0.4739764, -0.5208742, 1.287996, 0.02745098, 0, 1, 1,
0.4761235, -0.6695017, 0.6283553, 0.03137255, 0, 1, 1,
0.4764714, -0.9842862, 3.559777, 0.03921569, 0, 1, 1,
0.4802897, -1.089984, 3.848111, 0.04313726, 0, 1, 1,
0.486765, 0.07545014, 0.5008294, 0.05098039, 0, 1, 1,
0.4925366, -0.632425, 2.774462, 0.05490196, 0, 1, 1,
0.4928176, -0.3544073, 3.69676, 0.0627451, 0, 1, 1,
0.4930311, -1.386004, 2.65079, 0.06666667, 0, 1, 1,
0.494853, -0.5702633, 3.003606, 0.07450981, 0, 1, 1,
0.4954251, -1.152926, 1.277387, 0.07843138, 0, 1, 1,
0.4976694, 1.534188, 2.313417, 0.08627451, 0, 1, 1,
0.5032189, -1.525838, 2.665791, 0.09019608, 0, 1, 1,
0.503955, -0.8303007, 2.778082, 0.09803922, 0, 1, 1,
0.504848, 0.1523142, 1.214858, 0.1058824, 0, 1, 1,
0.505814, 1.597061, -0.6032124, 0.1098039, 0, 1, 1,
0.5074131, -0.7781277, 0.7032137, 0.1176471, 0, 1, 1,
0.5114157, 1.609011, -0.2398565, 0.1215686, 0, 1, 1,
0.5155383, -0.212594, 4.286956, 0.1294118, 0, 1, 1,
0.5168752, 0.04743259, 1.104416, 0.1333333, 0, 1, 1,
0.5208823, 0.7744352, 2.041131, 0.1411765, 0, 1, 1,
0.5216504, 0.09560017, 1.172175, 0.145098, 0, 1, 1,
0.5303615, -0.1608092, 0.3655571, 0.1529412, 0, 1, 1,
0.530605, 1.357004, -1.019826, 0.1568628, 0, 1, 1,
0.5312694, 0.08410097, 1.135513, 0.1647059, 0, 1, 1,
0.5324776, 0.7098689, 1.880217, 0.1686275, 0, 1, 1,
0.5373797, 0.4423399, 0.8219851, 0.1764706, 0, 1, 1,
0.5404692, 0.5717165, 0.7654043, 0.1803922, 0, 1, 1,
0.541676, -0.9731522, 1.178057, 0.1882353, 0, 1, 1,
0.5438796, 0.1018368, 1.690621, 0.1921569, 0, 1, 1,
0.5445184, 1.239054, 1.593984, 0.2, 0, 1, 1,
0.5458724, -0.06723219, 0.8285859, 0.2078431, 0, 1, 1,
0.5478102, 1.200874, 1.016559, 0.2117647, 0, 1, 1,
0.5486016, -0.5031424, 3.417161, 0.2196078, 0, 1, 1,
0.5517483, 0.5999312, 0.3582105, 0.2235294, 0, 1, 1,
0.5539458, 0.07411831, -0.4396696, 0.2313726, 0, 1, 1,
0.554115, -0.8933603, 3.343116, 0.2352941, 0, 1, 1,
0.5542603, -0.1601351, 2.262418, 0.2431373, 0, 1, 1,
0.5555866, 3.206096, -1.168415, 0.2470588, 0, 1, 1,
0.5653039, -0.1717668, 1.832984, 0.254902, 0, 1, 1,
0.5686712, -1.704474, 2.492293, 0.2588235, 0, 1, 1,
0.5693361, -0.2463243, 1.50916, 0.2666667, 0, 1, 1,
0.5701661, 0.009344354, 1.161916, 0.2705882, 0, 1, 1,
0.572282, -0.5930303, 2.410605, 0.2784314, 0, 1, 1,
0.5773849, -0.3667778, 2.728985, 0.282353, 0, 1, 1,
0.5775638, -0.2615364, 2.766541, 0.2901961, 0, 1, 1,
0.5829396, 0.2941852, 1.147093, 0.2941177, 0, 1, 1,
0.5842426, 0.8966635, 0.7404004, 0.3019608, 0, 1, 1,
0.5862954, -0.2765004, 2.154814, 0.3098039, 0, 1, 1,
0.5888697, 0.7439674, 1.114015, 0.3137255, 0, 1, 1,
0.5903205, -0.3750605, 2.372782, 0.3215686, 0, 1, 1,
0.5982184, -1.977709, 2.915127, 0.3254902, 0, 1, 1,
0.5983592, -0.4906412, 1.588464, 0.3333333, 0, 1, 1,
0.6003349, 1.490923, 0.2405236, 0.3372549, 0, 1, 1,
0.6019681, -0.2480168, 2.441608, 0.345098, 0, 1, 1,
0.6050237, -0.5449935, 0.8816202, 0.3490196, 0, 1, 1,
0.6103656, -0.4036282, 0.9754612, 0.3568628, 0, 1, 1,
0.6109291, -1.502231, 2.82418, 0.3607843, 0, 1, 1,
0.6138121, 0.891873, -0.3622512, 0.3686275, 0, 1, 1,
0.6242362, 0.8104463, 1.762754, 0.372549, 0, 1, 1,
0.6281035, 0.533601, 0.6433365, 0.3803922, 0, 1, 1,
0.6291054, -0.474903, 3.620055, 0.3843137, 0, 1, 1,
0.6332524, -0.9355887, 1.732211, 0.3921569, 0, 1, 1,
0.6342179, -0.01233276, 0.112014, 0.3960784, 0, 1, 1,
0.6358152, 0.7115569, 0.9053004, 0.4039216, 0, 1, 1,
0.6450879, -0.04123349, 2.307759, 0.4117647, 0, 1, 1,
0.6456425, -1.726057, 2.365151, 0.4156863, 0, 1, 1,
0.6506084, -0.4076458, 1.007197, 0.4235294, 0, 1, 1,
0.653945, -0.2791389, 1.045841, 0.427451, 0, 1, 1,
0.6544299, -0.3134647, 1.602146, 0.4352941, 0, 1, 1,
0.663389, -0.4698378, 2.022979, 0.4392157, 0, 1, 1,
0.6635147, 0.6087654, 0.1880976, 0.4470588, 0, 1, 1,
0.6640099, 0.2553543, -1.52317, 0.4509804, 0, 1, 1,
0.6707249, 0.2399074, 0.1715079, 0.4588235, 0, 1, 1,
0.6713439, 0.464966, 0.5111644, 0.4627451, 0, 1, 1,
0.676953, 0.5343457, 1.756018, 0.4705882, 0, 1, 1,
0.677531, 0.7662058, -0.2623656, 0.4745098, 0, 1, 1,
0.6777641, -1.048822, 1.758804, 0.4823529, 0, 1, 1,
0.6781541, 0.5673646, 1.038593, 0.4862745, 0, 1, 1,
0.6793602, 0.9618736, 1.624667, 0.4941176, 0, 1, 1,
0.6810294, 0.08880354, 1.433236, 0.5019608, 0, 1, 1,
0.6871666, 0.3272425, 0.7518854, 0.5058824, 0, 1, 1,
0.6887287, 0.4791218, 0.4089585, 0.5137255, 0, 1, 1,
0.6917999, 0.6778925, 2.680797, 0.5176471, 0, 1, 1,
0.6933435, 2.184768, -0.8382847, 0.5254902, 0, 1, 1,
0.6972527, 0.2880939, 0.9344002, 0.5294118, 0, 1, 1,
0.699459, 0.469632, 1.540244, 0.5372549, 0, 1, 1,
0.6996898, -0.6540105, 1.653491, 0.5411765, 0, 1, 1,
0.6999796, -0.02005949, 1.890811, 0.5490196, 0, 1, 1,
0.7051549, -1.564237, 3.914077, 0.5529412, 0, 1, 1,
0.7140942, -2.338417, 5.016901, 0.5607843, 0, 1, 1,
0.727109, -0.05224821, 2.042568, 0.5647059, 0, 1, 1,
0.7327735, 0.03162354, 1.394248, 0.572549, 0, 1, 1,
0.7357914, 2.344015, 1.742815, 0.5764706, 0, 1, 1,
0.7505527, -0.1358348, 3.624734, 0.5843138, 0, 1, 1,
0.7525324, 2.090997, 1.409569, 0.5882353, 0, 1, 1,
0.7526895, 0.1124157, 2.703851, 0.5960785, 0, 1, 1,
0.7532206, -0.8622062, 3.942332, 0.6039216, 0, 1, 1,
0.7573521, 0.460752, 3.051783, 0.6078432, 0, 1, 1,
0.7575585, 0.9566457, 0.07341637, 0.6156863, 0, 1, 1,
0.760546, 1.89527, 3.847532, 0.6196079, 0, 1, 1,
0.7655675, 0.7307141, 2.38354, 0.627451, 0, 1, 1,
0.7699304, 0.3114371, 0.7603617, 0.6313726, 0, 1, 1,
0.7705599, -0.4699486, 1.647306, 0.6392157, 0, 1, 1,
0.7751892, -0.309015, 2.301502, 0.6431373, 0, 1, 1,
0.7828194, 0.9898837, 2.970198, 0.6509804, 0, 1, 1,
0.7848655, 0.9036312, -0.3129242, 0.654902, 0, 1, 1,
0.7880519, -0.1159418, 2.786276, 0.6627451, 0, 1, 1,
0.788525, 1.490138, 1.787889, 0.6666667, 0, 1, 1,
0.7894126, -0.03209943, 1.406714, 0.6745098, 0, 1, 1,
0.7903796, 1.22011, 0.3348788, 0.6784314, 0, 1, 1,
0.7905137, 1.433625, -0.6726992, 0.6862745, 0, 1, 1,
0.7964075, 1.271003, 2.052466, 0.6901961, 0, 1, 1,
0.8000961, 0.6445524, -0.4770093, 0.6980392, 0, 1, 1,
0.8053007, 1.602817, -0.2886245, 0.7058824, 0, 1, 1,
0.8083636, 1.37034, 1.26747, 0.7098039, 0, 1, 1,
0.8092499, -0.1798522, 1.061884, 0.7176471, 0, 1, 1,
0.8141947, -1.310907, 2.087341, 0.7215686, 0, 1, 1,
0.8169411, -0.8403869, 2.203959, 0.7294118, 0, 1, 1,
0.8189317, 1.489637, -1.794789, 0.7333333, 0, 1, 1,
0.8199924, -0.4915582, 2.849029, 0.7411765, 0, 1, 1,
0.8227213, 0.1206962, 0.5625576, 0.7450981, 0, 1, 1,
0.8236647, -0.8997085, 2.373475, 0.7529412, 0, 1, 1,
0.8253917, -0.1282191, 2.082492, 0.7568628, 0, 1, 1,
0.8258705, -2.334203, 4.065537, 0.7647059, 0, 1, 1,
0.8281684, 1.505787, 1.364908, 0.7686275, 0, 1, 1,
0.8284925, -1.132284, 2.272302, 0.7764706, 0, 1, 1,
0.8332598, 0.3124322, -0.163194, 0.7803922, 0, 1, 1,
0.8362132, 1.86851, 0.7462358, 0.7882353, 0, 1, 1,
0.8407755, -0.4366016, 2.213556, 0.7921569, 0, 1, 1,
0.8427485, -1.222733, 3.582103, 0.8, 0, 1, 1,
0.8431875, -0.3908446, 0.7924193, 0.8078431, 0, 1, 1,
0.8445953, -0.8905303, 2.158889, 0.8117647, 0, 1, 1,
0.8538136, -1.247946, 3.152842, 0.8196079, 0, 1, 1,
0.8563994, 0.4542627, 2.341954, 0.8235294, 0, 1, 1,
0.8597237, 1.060459, 1.874245, 0.8313726, 0, 1, 1,
0.8634831, -0.3698016, 3.879664, 0.8352941, 0, 1, 1,
0.8645539, 1.570996, 0.9423875, 0.8431373, 0, 1, 1,
0.8733979, 0.1737336, 0.02855629, 0.8470588, 0, 1, 1,
0.8773482, 0.07317682, 0.4817674, 0.854902, 0, 1, 1,
0.8814005, -1.460217, 3.04698, 0.8588235, 0, 1, 1,
0.9003177, -1.198098, 2.85993, 0.8666667, 0, 1, 1,
0.9024313, 0.3132619, 0.7158528, 0.8705882, 0, 1, 1,
0.905937, -1.649441, 1.124533, 0.8784314, 0, 1, 1,
0.9107575, 0.8157104, -0.7298242, 0.8823529, 0, 1, 1,
0.915079, -0.8160471, 2.025054, 0.8901961, 0, 1, 1,
0.9158738, 1.19185, 1.087167, 0.8941177, 0, 1, 1,
0.9257372, -2.388531, 4.16455, 0.9019608, 0, 1, 1,
0.9257689, 0.2886017, 2.130443, 0.9098039, 0, 1, 1,
0.930242, 0.1456008, -0.1959897, 0.9137255, 0, 1, 1,
0.9310226, 3.255811, -0.7691669, 0.9215686, 0, 1, 1,
0.931784, 0.1970602, 1.447565, 0.9254902, 0, 1, 1,
0.9346488, -1.085412, 3.033163, 0.9333333, 0, 1, 1,
0.941879, -1.133111, 4.079962, 0.9372549, 0, 1, 1,
0.9432657, 0.9106038, 0.5605392, 0.945098, 0, 1, 1,
0.9450085, 0.253306, 0.381954, 0.9490196, 0, 1, 1,
0.951764, -0.009987341, 2.704464, 0.9568627, 0, 1, 1,
0.9553812, -2.158855, 3.456346, 0.9607843, 0, 1, 1,
0.9583513, 1.813512, 1.414624, 0.9686275, 0, 1, 1,
0.9585675, -0.1829369, 2.064691, 0.972549, 0, 1, 1,
0.9589973, -0.4413687, 1.429004, 0.9803922, 0, 1, 1,
0.9593428, 1.007204, 0.8325312, 0.9843137, 0, 1, 1,
0.9797226, 0.9169465, 1.41527, 0.9921569, 0, 1, 1,
0.9880726, 0.1942742, 0.149667, 0.9960784, 0, 1, 1,
0.9881149, 2.102932, 0.5035611, 1, 0, 0.9960784, 1,
0.9953367, 1.369723, -1.368394, 1, 0, 0.9882353, 1,
0.9958271, -0.4528292, 2.785962, 1, 0, 0.9843137, 1,
1.00325, -2.046563, 2.365289, 1, 0, 0.9764706, 1,
1.006172, -0.6639875, 2.418966, 1, 0, 0.972549, 1,
1.008603, -0.7582759, 3.032451, 1, 0, 0.9647059, 1,
1.01835, -0.3700092, 2.344722, 1, 0, 0.9607843, 1,
1.019866, 0.2468903, 3.661046, 1, 0, 0.9529412, 1,
1.022911, -0.7815391, 1.639776, 1, 0, 0.9490196, 1,
1.024114, 1.571991, 0.20004, 1, 0, 0.9411765, 1,
1.026393, -0.5608365, -1.347443, 1, 0, 0.9372549, 1,
1.029945, -0.4740979, 1.554127, 1, 0, 0.9294118, 1,
1.041523, -0.1417617, 1.923981, 1, 0, 0.9254902, 1,
1.050376, -0.6769651, 2.764153, 1, 0, 0.9176471, 1,
1.056613, -0.7202444, 1.446945, 1, 0, 0.9137255, 1,
1.061248, 0.9857231, 1.745796, 1, 0, 0.9058824, 1,
1.069308, 0.8079242, 1.208658, 1, 0, 0.9019608, 1,
1.080878, 1.425908, 1.971901, 1, 0, 0.8941177, 1,
1.084891, 0.1156681, 0.5366268, 1, 0, 0.8862745, 1,
1.099843, 1.764431, -0.6250457, 1, 0, 0.8823529, 1,
1.100277, -0.2991467, 1.511423, 1, 0, 0.8745098, 1,
1.107986, -0.02936938, 1.651323, 1, 0, 0.8705882, 1,
1.108132, -0.6910704, 2.007138, 1, 0, 0.8627451, 1,
1.109555, 0.3092986, 1.708656, 1, 0, 0.8588235, 1,
1.113948, -0.9829478, 1.101595, 1, 0, 0.8509804, 1,
1.114207, -0.7556396, 2.613862, 1, 0, 0.8470588, 1,
1.114549, 1.322362, 1.073456, 1, 0, 0.8392157, 1,
1.124281, 0.6220726, 2.347463, 1, 0, 0.8352941, 1,
1.126469, 0.3956149, 1.422586, 1, 0, 0.827451, 1,
1.130323, 0.8149174, 1.703612, 1, 0, 0.8235294, 1,
1.135738, -0.04679094, 1.296581, 1, 0, 0.8156863, 1,
1.138696, 1.022634, 1.687762, 1, 0, 0.8117647, 1,
1.143937, -0.3009458, 1.5324, 1, 0, 0.8039216, 1,
1.147478, 1.480339, 0.9720054, 1, 0, 0.7960784, 1,
1.151292, 1.988123, 0.03268932, 1, 0, 0.7921569, 1,
1.153236, -0.7866897, 0.7259927, 1, 0, 0.7843137, 1,
1.153854, -0.1494267, 1.617603, 1, 0, 0.7803922, 1,
1.158988, -1.966405, 2.074796, 1, 0, 0.772549, 1,
1.159938, -1.211099, 3.913856, 1, 0, 0.7686275, 1,
1.162904, 0.8023188, 1.574757, 1, 0, 0.7607843, 1,
1.16863, -0.4325994, 2.847537, 1, 0, 0.7568628, 1,
1.171489, 0.04950098, 0.3314795, 1, 0, 0.7490196, 1,
1.174821, 0.1432581, 2.30813, 1, 0, 0.7450981, 1,
1.180884, -2.249798, 3.809676, 1, 0, 0.7372549, 1,
1.187194, -0.6597002, 0.9912121, 1, 0, 0.7333333, 1,
1.194451, 2.189464, 0.2573394, 1, 0, 0.7254902, 1,
1.203911, 1.365369, 1.074622, 1, 0, 0.7215686, 1,
1.206119, 0.184885, 0.02841356, 1, 0, 0.7137255, 1,
1.211644, -0.9197274, 2.830304, 1, 0, 0.7098039, 1,
1.216457, 3.183805, -0.824628, 1, 0, 0.7019608, 1,
1.219093, -1.939815, 3.855268, 1, 0, 0.6941177, 1,
1.220129, 0.5142984, -0.930057, 1, 0, 0.6901961, 1,
1.220229, 0.9322274, 0.8466612, 1, 0, 0.682353, 1,
1.22422, -0.8181201, 1.884968, 1, 0, 0.6784314, 1,
1.233239, -0.8834221, 1.438299, 1, 0, 0.6705883, 1,
1.234205, 0.4999429, 2.482542, 1, 0, 0.6666667, 1,
1.237262, -0.7943343, -0.137324, 1, 0, 0.6588235, 1,
1.246905, -0.9609663, 2.530807, 1, 0, 0.654902, 1,
1.249349, 0.3113684, 2.933131, 1, 0, 0.6470588, 1,
1.252289, 0.4048184, 1.488534, 1, 0, 0.6431373, 1,
1.253654, 0.7342504, 4.025792, 1, 0, 0.6352941, 1,
1.257327, 1.173734, 1.201173, 1, 0, 0.6313726, 1,
1.258549, 0.9901026, 1.403902, 1, 0, 0.6235294, 1,
1.274088, -0.2404997, 0.7416816, 1, 0, 0.6196079, 1,
1.274165, -0.8182816, 3.716165, 1, 0, 0.6117647, 1,
1.275267, 0.9208512, 1.174306, 1, 0, 0.6078432, 1,
1.27588, -0.6615707, 1.706028, 1, 0, 0.6, 1,
1.285419, -0.7434657, 3.024289, 1, 0, 0.5921569, 1,
1.287849, -0.2742206, 1.005441, 1, 0, 0.5882353, 1,
1.305481, -0.4466495, 1.085572, 1, 0, 0.5803922, 1,
1.307967, -0.8310286, 0.7342774, 1, 0, 0.5764706, 1,
1.316694, -2.267388, 2.031062, 1, 0, 0.5686275, 1,
1.316779, -1.738365, 2.101371, 1, 0, 0.5647059, 1,
1.317929, 1.093271, 1.832093, 1, 0, 0.5568628, 1,
1.329045, -0.419153, -0.2279733, 1, 0, 0.5529412, 1,
1.335551, -0.5301425, 2.132432, 1, 0, 0.5450981, 1,
1.338555, -0.282763, 2.031579, 1, 0, 0.5411765, 1,
1.355004, -0.8469754, 1.402334, 1, 0, 0.5333334, 1,
1.357843, 0.04889541, 1.820956, 1, 0, 0.5294118, 1,
1.359127, -0.4135161, 1.20234, 1, 0, 0.5215687, 1,
1.364356, -1.874584, 1.405299, 1, 0, 0.5176471, 1,
1.368151, -1.176374, 1.242537, 1, 0, 0.509804, 1,
1.380566, -0.813444, 3.250803, 1, 0, 0.5058824, 1,
1.394573, 1.044432, -0.1529266, 1, 0, 0.4980392, 1,
1.415366, 1.527612, -0.3430673, 1, 0, 0.4901961, 1,
1.429725, 1.035875, 1.343322, 1, 0, 0.4862745, 1,
1.434569, 0.2966612, 3.361329, 1, 0, 0.4784314, 1,
1.46354, -0.21448, 0.9908755, 1, 0, 0.4745098, 1,
1.46358, -0.3699951, 1.126472, 1, 0, 0.4666667, 1,
1.493428, -0.4890985, 2.676023, 1, 0, 0.4627451, 1,
1.495309, -1.653944, 2.965901, 1, 0, 0.454902, 1,
1.504719, -0.7360535, 3.096512, 1, 0, 0.4509804, 1,
1.505307, -1.604556, 3.118939, 1, 0, 0.4431373, 1,
1.515631, 0.4359394, 1.425081, 1, 0, 0.4392157, 1,
1.516475, -0.671574, 1.873081, 1, 0, 0.4313726, 1,
1.520338, -0.1194024, 1.296172, 1, 0, 0.427451, 1,
1.535232, -1.706261, 1.957688, 1, 0, 0.4196078, 1,
1.542502, 0.7051716, 2.485247, 1, 0, 0.4156863, 1,
1.542599, 1.090783, -0.04865651, 1, 0, 0.4078431, 1,
1.546293, 1.503256, 0.6411633, 1, 0, 0.4039216, 1,
1.550605, -0.3390359, 1.459394, 1, 0, 0.3960784, 1,
1.560374, -1.125959, 0.7153109, 1, 0, 0.3882353, 1,
1.564947, 0.6821132, 0.9939012, 1, 0, 0.3843137, 1,
1.570531, 1.59315, 2.909201, 1, 0, 0.3764706, 1,
1.578988, -0.9026393, 1.059651, 1, 0, 0.372549, 1,
1.579864, 0.03061499, -0.6280945, 1, 0, 0.3647059, 1,
1.585328, 0.06156715, 0.9183235, 1, 0, 0.3607843, 1,
1.588247, 0.7441662, 1.47584, 1, 0, 0.3529412, 1,
1.59473, 0.4213181, 0.697424, 1, 0, 0.3490196, 1,
1.600674, 1.437169, -0.1634349, 1, 0, 0.3411765, 1,
1.601054, -0.1342189, 1.618025, 1, 0, 0.3372549, 1,
1.608105, 0.1221047, 2.475456, 1, 0, 0.3294118, 1,
1.611925, 1.646826, -1.021832, 1, 0, 0.3254902, 1,
1.621626, 1.615244, 0.5108344, 1, 0, 0.3176471, 1,
1.62181, 1.016799, 0.9189902, 1, 0, 0.3137255, 1,
1.625433, 1.661294, 0.2157445, 1, 0, 0.3058824, 1,
1.65286, -0.5629232, 1.847006, 1, 0, 0.2980392, 1,
1.661215, 1.201584, 0.2816412, 1, 0, 0.2941177, 1,
1.681311, -2.187059, 2.313543, 1, 0, 0.2862745, 1,
1.684285, -0.9132612, 1.472184, 1, 0, 0.282353, 1,
1.693465, -1.091047, 2.266798, 1, 0, 0.2745098, 1,
1.696836, 0.7194026, 0.3703274, 1, 0, 0.2705882, 1,
1.708537, -0.3963919, 1.719263, 1, 0, 0.2627451, 1,
1.721822, -0.006111482, 0.2761333, 1, 0, 0.2588235, 1,
1.727277, -1.782896, 2.101321, 1, 0, 0.2509804, 1,
1.734905, -0.3064485, 1.83741, 1, 0, 0.2470588, 1,
1.73613, -1.240057, 3.400949, 1, 0, 0.2392157, 1,
1.740112, 0.4414949, 2.482663, 1, 0, 0.2352941, 1,
1.767189, 2.079677, 0.4295736, 1, 0, 0.227451, 1,
1.783042, -0.5988097, 1.495922, 1, 0, 0.2235294, 1,
1.816636, -0.692799, 1.694098, 1, 0, 0.2156863, 1,
1.844556, -0.1322872, 3.37339, 1, 0, 0.2117647, 1,
1.854556, 0.942721, 1.843702, 1, 0, 0.2039216, 1,
1.870563, -1.413206, 1.50443, 1, 0, 0.1960784, 1,
1.87276, -1.044632, 1.657139, 1, 0, 0.1921569, 1,
1.88095, 0.91909, 2.187656, 1, 0, 0.1843137, 1,
1.907884, -0.3123581, 1.852418, 1, 0, 0.1803922, 1,
1.924848, -0.6142212, 2.693309, 1, 0, 0.172549, 1,
1.927233, -0.04797828, 2.543764, 1, 0, 0.1686275, 1,
1.937756, -1.14959, 4.157146, 1, 0, 0.1607843, 1,
1.950225, -2.116119, 3.550523, 1, 0, 0.1568628, 1,
1.952401, 1.350893, -0.9463121, 1, 0, 0.1490196, 1,
1.982682, -0.810346, 3.764307, 1, 0, 0.145098, 1,
1.982997, -1.359494, 2.730598, 1, 0, 0.1372549, 1,
2.013615, 0.3000132, 1.842087, 1, 0, 0.1333333, 1,
2.017672, 0.4722035, 1.548705, 1, 0, 0.1254902, 1,
2.021761, 0.1815488, 2.862739, 1, 0, 0.1215686, 1,
2.031698, -0.1187752, 0.7588702, 1, 0, 0.1137255, 1,
2.034488, 2.179043, -0.1045479, 1, 0, 0.1098039, 1,
2.045778, 0.549965, 0.9562665, 1, 0, 0.1019608, 1,
2.052373, -1.590201, 1.465751, 1, 0, 0.09411765, 1,
2.05392, 0.9718799, 2.191919, 1, 0, 0.09019608, 1,
2.056813, 0.3682189, 1.302284, 1, 0, 0.08235294, 1,
2.101091, 1.07002, 1.093491, 1, 0, 0.07843138, 1,
2.117671, 0.488969, 1.990349, 1, 0, 0.07058824, 1,
2.1243, 1.044229, 1.001831, 1, 0, 0.06666667, 1,
2.161126, -2.052727, 3.793015, 1, 0, 0.05882353, 1,
2.213888, -0.05449234, 2.09192, 1, 0, 0.05490196, 1,
2.295311, -0.7680168, 4.30236, 1, 0, 0.04705882, 1,
2.392048, -0.7167854, 0.7886668, 1, 0, 0.04313726, 1,
2.412329, 0.5093877, 1.496573, 1, 0, 0.03529412, 1,
2.473189, -0.4790189, 0.544363, 1, 0, 0.03137255, 1,
2.512033, 0.6029827, 1.343696, 1, 0, 0.02352941, 1,
2.653849, -0.5965989, 3.929062, 1, 0, 0.01960784, 1,
2.70335, -0.4924684, 1.256969, 1, 0, 0.01176471, 1,
2.82217, -0.9804649, 0.9049029, 1, 0, 0.007843138, 1
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
-0.1479477, -3.847098, -7.152895, 0, -0.5, 0.5, 0.5,
-0.1479477, -3.847098, -7.152895, 1, -0.5, 0.5, 0.5,
-0.1479477, -3.847098, -7.152895, 1, 1.5, 0.5, 0.5,
-0.1479477, -3.847098, -7.152895, 0, 1.5, 0.5, 0.5
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
-4.124935, 0.3425262, -7.152895, 0, -0.5, 0.5, 0.5,
-4.124935, 0.3425262, -7.152895, 1, -0.5, 0.5, 0.5,
-4.124935, 0.3425262, -7.152895, 1, 1.5, 0.5, 0.5,
-4.124935, 0.3425262, -7.152895, 0, 1.5, 0.5, 0.5
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
-4.124935, -3.847098, -0.1860898, 0, -0.5, 0.5, 0.5,
-4.124935, -3.847098, -0.1860898, 1, -0.5, 0.5, 0.5,
-4.124935, -3.847098, -0.1860898, 1, 1.5, 0.5, 0.5,
-4.124935, -3.847098, -0.1860898, 0, 1.5, 0.5, 0.5
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
-3, -2.880262, -5.545171,
2, -2.880262, -5.545171,
-3, -2.880262, -5.545171,
-3, -3.041401, -5.813125,
-2, -2.880262, -5.545171,
-2, -3.041401, -5.813125,
-1, -2.880262, -5.545171,
-1, -3.041401, -5.813125,
0, -2.880262, -5.545171,
0, -3.041401, -5.813125,
1, -2.880262, -5.545171,
1, -3.041401, -5.813125,
2, -2.880262, -5.545171,
2, -3.041401, -5.813125
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
-3, -3.36368, -6.349033, 0, -0.5, 0.5, 0.5,
-3, -3.36368, -6.349033, 1, -0.5, 0.5, 0.5,
-3, -3.36368, -6.349033, 1, 1.5, 0.5, 0.5,
-3, -3.36368, -6.349033, 0, 1.5, 0.5, 0.5,
-2, -3.36368, -6.349033, 0, -0.5, 0.5, 0.5,
-2, -3.36368, -6.349033, 1, -0.5, 0.5, 0.5,
-2, -3.36368, -6.349033, 1, 1.5, 0.5, 0.5,
-2, -3.36368, -6.349033, 0, 1.5, 0.5, 0.5,
-1, -3.36368, -6.349033, 0, -0.5, 0.5, 0.5,
-1, -3.36368, -6.349033, 1, -0.5, 0.5, 0.5,
-1, -3.36368, -6.349033, 1, 1.5, 0.5, 0.5,
-1, -3.36368, -6.349033, 0, 1.5, 0.5, 0.5,
0, -3.36368, -6.349033, 0, -0.5, 0.5, 0.5,
0, -3.36368, -6.349033, 1, -0.5, 0.5, 0.5,
0, -3.36368, -6.349033, 1, 1.5, 0.5, 0.5,
0, -3.36368, -6.349033, 0, 1.5, 0.5, 0.5,
1, -3.36368, -6.349033, 0, -0.5, 0.5, 0.5,
1, -3.36368, -6.349033, 1, -0.5, 0.5, 0.5,
1, -3.36368, -6.349033, 1, 1.5, 0.5, 0.5,
1, -3.36368, -6.349033, 0, 1.5, 0.5, 0.5,
2, -3.36368, -6.349033, 0, -0.5, 0.5, 0.5,
2, -3.36368, -6.349033, 1, -0.5, 0.5, 0.5,
2, -3.36368, -6.349033, 1, 1.5, 0.5, 0.5,
2, -3.36368, -6.349033, 0, 1.5, 0.5, 0.5
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
-3.207169, -2, -5.545171,
-3.207169, 3, -5.545171,
-3.207169, -2, -5.545171,
-3.36013, -2, -5.813125,
-3.207169, -1, -5.545171,
-3.36013, -1, -5.813125,
-3.207169, 0, -5.545171,
-3.36013, 0, -5.813125,
-3.207169, 1, -5.545171,
-3.36013, 1, -5.813125,
-3.207169, 2, -5.545171,
-3.36013, 2, -5.813125,
-3.207169, 3, -5.545171,
-3.36013, 3, -5.813125
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
-3.666052, -2, -6.349033, 0, -0.5, 0.5, 0.5,
-3.666052, -2, -6.349033, 1, -0.5, 0.5, 0.5,
-3.666052, -2, -6.349033, 1, 1.5, 0.5, 0.5,
-3.666052, -2, -6.349033, 0, 1.5, 0.5, 0.5,
-3.666052, -1, -6.349033, 0, -0.5, 0.5, 0.5,
-3.666052, -1, -6.349033, 1, -0.5, 0.5, 0.5,
-3.666052, -1, -6.349033, 1, 1.5, 0.5, 0.5,
-3.666052, -1, -6.349033, 0, 1.5, 0.5, 0.5,
-3.666052, 0, -6.349033, 0, -0.5, 0.5, 0.5,
-3.666052, 0, -6.349033, 1, -0.5, 0.5, 0.5,
-3.666052, 0, -6.349033, 1, 1.5, 0.5, 0.5,
-3.666052, 0, -6.349033, 0, 1.5, 0.5, 0.5,
-3.666052, 1, -6.349033, 0, -0.5, 0.5, 0.5,
-3.666052, 1, -6.349033, 1, -0.5, 0.5, 0.5,
-3.666052, 1, -6.349033, 1, 1.5, 0.5, 0.5,
-3.666052, 1, -6.349033, 0, 1.5, 0.5, 0.5,
-3.666052, 2, -6.349033, 0, -0.5, 0.5, 0.5,
-3.666052, 2, -6.349033, 1, -0.5, 0.5, 0.5,
-3.666052, 2, -6.349033, 1, 1.5, 0.5, 0.5,
-3.666052, 2, -6.349033, 0, 1.5, 0.5, 0.5,
-3.666052, 3, -6.349033, 0, -0.5, 0.5, 0.5,
-3.666052, 3, -6.349033, 1, -0.5, 0.5, 0.5,
-3.666052, 3, -6.349033, 1, 1.5, 0.5, 0.5,
-3.666052, 3, -6.349033, 0, 1.5, 0.5, 0.5
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
-3.207169, -2.880262, -4,
-3.207169, -2.880262, 4,
-3.207169, -2.880262, -4,
-3.36013, -3.041401, -4,
-3.207169, -2.880262, -2,
-3.36013, -3.041401, -2,
-3.207169, -2.880262, 0,
-3.36013, -3.041401, 0,
-3.207169, -2.880262, 2,
-3.36013, -3.041401, 2,
-3.207169, -2.880262, 4,
-3.36013, -3.041401, 4
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
-3.666052, -3.36368, -4, 0, -0.5, 0.5, 0.5,
-3.666052, -3.36368, -4, 1, -0.5, 0.5, 0.5,
-3.666052, -3.36368, -4, 1, 1.5, 0.5, 0.5,
-3.666052, -3.36368, -4, 0, 1.5, 0.5, 0.5,
-3.666052, -3.36368, -2, 0, -0.5, 0.5, 0.5,
-3.666052, -3.36368, -2, 1, -0.5, 0.5, 0.5,
-3.666052, -3.36368, -2, 1, 1.5, 0.5, 0.5,
-3.666052, -3.36368, -2, 0, 1.5, 0.5, 0.5,
-3.666052, -3.36368, 0, 0, -0.5, 0.5, 0.5,
-3.666052, -3.36368, 0, 1, -0.5, 0.5, 0.5,
-3.666052, -3.36368, 0, 1, 1.5, 0.5, 0.5,
-3.666052, -3.36368, 0, 0, 1.5, 0.5, 0.5,
-3.666052, -3.36368, 2, 0, -0.5, 0.5, 0.5,
-3.666052, -3.36368, 2, 1, -0.5, 0.5, 0.5,
-3.666052, -3.36368, 2, 1, 1.5, 0.5, 0.5,
-3.666052, -3.36368, 2, 0, 1.5, 0.5, 0.5,
-3.666052, -3.36368, 4, 0, -0.5, 0.5, 0.5,
-3.666052, -3.36368, 4, 1, -0.5, 0.5, 0.5,
-3.666052, -3.36368, 4, 1, 1.5, 0.5, 0.5,
-3.666052, -3.36368, 4, 0, 1.5, 0.5, 0.5
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
-3.207169, -2.880262, -5.545171,
-3.207169, 3.565314, -5.545171,
-3.207169, -2.880262, 5.172991,
-3.207169, 3.565314, 5.172991,
-3.207169, -2.880262, -5.545171,
-3.207169, -2.880262, 5.172991,
-3.207169, 3.565314, -5.545171,
-3.207169, 3.565314, 5.172991,
-3.207169, -2.880262, -5.545171,
2.911273, -2.880262, -5.545171,
-3.207169, -2.880262, 5.172991,
2.911273, -2.880262, 5.172991,
-3.207169, 3.565314, -5.545171,
2.911273, 3.565314, -5.545171,
-3.207169, 3.565314, 5.172991,
2.911273, 3.565314, 5.172991,
2.911273, -2.880262, -5.545171,
2.911273, 3.565314, -5.545171,
2.911273, -2.880262, 5.172991,
2.911273, 3.565314, 5.172991,
2.911273, -2.880262, -5.545171,
2.911273, -2.880262, 5.172991,
2.911273, 3.565314, -5.545171,
2.911273, 3.565314, 5.172991
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
var radius = 7.434801;
var distance = 33.07827;
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
mvMatrix.translate( 0.1479477, -0.3425262, 0.1860898 );
mvMatrix.scale( 1.31384, 1.247158, 0.7500029 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.07827);
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
sodium_aluminum_fluo<-read.table("sodium_aluminum_fluo.xyz", skip=1)
```

```
## Error in read.table("sodium_aluminum_fluo.xyz", skip = 1): duplicate 'row.names' are not allowed
```

```r
x<-sodium_aluminum_fluo$V2
```

```
## Error in eval(expr, envir, enclos): object 'sodium_aluminum_fluo' not found
```

```r
y<-sodium_aluminum_fluo$V3
```

```
## Error in eval(expr, envir, enclos): object 'sodium_aluminum_fluo' not found
```

```r
z<-sodium_aluminum_fluo$V4
```

```
## Error in eval(expr, envir, enclos): object 'sodium_aluminum_fluo' not found
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
-3.118065, -1.093439, -2.829624, 0, 0, 1, 1, 1,
-2.944655, 0.6644506, -1.746686, 1, 0, 0, 1, 1,
-2.766401, 0.9984508, -0.7909111, 1, 0, 0, 1, 1,
-2.620073, -0.2568694, -3.220659, 1, 0, 0, 1, 1,
-2.59272, 0.314987, -3.075536, 1, 0, 0, 1, 1,
-2.592396, 0.4687796, -1.194699, 1, 0, 0, 1, 1,
-2.566643, -1.193716, -2.637923, 0, 0, 0, 1, 1,
-2.462494, -2.219061, -1.583688, 0, 0, 0, 1, 1,
-2.441139, -0.7889377, -2.120674, 0, 0, 0, 1, 1,
-2.421608, 1.190823, 0.05227407, 0, 0, 0, 1, 1,
-2.359359, -2.203016, -3.143747, 0, 0, 0, 1, 1,
-2.342174, 0.44366, -2.795548, 0, 0, 0, 1, 1,
-2.335331, -1.344605, -1.34248, 0, 0, 0, 1, 1,
-2.313508, 0.5356524, -0.6118823, 1, 1, 1, 1, 1,
-2.303928, -0.2675101, -1.474827, 1, 1, 1, 1, 1,
-2.301739, 0.1506945, 0.7022684, 1, 1, 1, 1, 1,
-2.246079, -1.009166, -2.148965, 1, 1, 1, 1, 1,
-2.219627, 0.6452143, -1.173064, 1, 1, 1, 1, 1,
-2.218441, 0.9054285, -0.4049128, 1, 1, 1, 1, 1,
-2.208247, 0.9120442, -0.1805571, 1, 1, 1, 1, 1,
-2.199703, -2.071509, -1.988777, 1, 1, 1, 1, 1,
-2.172183, 0.6163472, -1.856271, 1, 1, 1, 1, 1,
-2.075865, -0.7326757, -1.785946, 1, 1, 1, 1, 1,
-2.059936, -1.220651, -4.302622, 1, 1, 1, 1, 1,
-2.002705, -0.9330254, -1.634984, 1, 1, 1, 1, 1,
-1.993156, -0.3746907, -1.853703, 1, 1, 1, 1, 1,
-1.983612, 0.4573557, -1.871097, 1, 1, 1, 1, 1,
-1.974661, 1.48016, -1.541259, 1, 1, 1, 1, 1,
-1.953545, 1.299539, -1.677333, 0, 0, 1, 1, 1,
-1.926733, 0.2599789, 0.7541988, 1, 0, 0, 1, 1,
-1.874881, 1.00903, -1.339444, 1, 0, 0, 1, 1,
-1.808055, -0.3751361, -2.339296, 1, 0, 0, 1, 1,
-1.807553, 1.075364, 0.203489, 1, 0, 0, 1, 1,
-1.793249, 0.4782137, -1.10468, 1, 0, 0, 1, 1,
-1.791017, 1.695739, -1.357204, 0, 0, 0, 1, 1,
-1.789407, -1.076421, -3.67596, 0, 0, 0, 1, 1,
-1.752757, 0.8106763, -1.969452, 0, 0, 0, 1, 1,
-1.751077, -0.9699094, -1.3895, 0, 0, 0, 1, 1,
-1.743227, -0.1061601, -1.957289, 0, 0, 0, 1, 1,
-1.737776, -0.006883595, -1.260041, 0, 0, 0, 1, 1,
-1.736043, -1.061063, -2.984979, 0, 0, 0, 1, 1,
-1.732196, 0.5588059, -0.4735346, 1, 1, 1, 1, 1,
-1.732094, -1.259443, -1.379944, 1, 1, 1, 1, 1,
-1.730351, 1.676673, -0.995402, 1, 1, 1, 1, 1,
-1.703659, -0.02114867, -0.6077632, 1, 1, 1, 1, 1,
-1.702887, 0.485098, -1.399822, 1, 1, 1, 1, 1,
-1.677466, -0.3709108, -2.506266, 1, 1, 1, 1, 1,
-1.671795, 1.224402, -2.404425, 1, 1, 1, 1, 1,
-1.657304, -0.4448733, -2.314259, 1, 1, 1, 1, 1,
-1.650019, -1.676992, -2.399982, 1, 1, 1, 1, 1,
-1.648158, -1.573802, -2.732249, 1, 1, 1, 1, 1,
-1.635657, -0.2582155, -4.115236, 1, 1, 1, 1, 1,
-1.630785, -0.8270426, -1.954321, 1, 1, 1, 1, 1,
-1.62693, 0.5281889, -0.5649816, 1, 1, 1, 1, 1,
-1.604895, -0.1521418, -1.057654, 1, 1, 1, 1, 1,
-1.603349, -0.0808311, -2.973664, 1, 1, 1, 1, 1,
-1.597336, 0.4018221, -0.6990929, 0, 0, 1, 1, 1,
-1.559668, -2.357341, -1.925972, 1, 0, 0, 1, 1,
-1.559379, -1.029859, -2.016575, 1, 0, 0, 1, 1,
-1.555091, 0.4328591, -2.317164, 1, 0, 0, 1, 1,
-1.542815, -0.03855774, -1.556644, 1, 0, 0, 1, 1,
-1.542729, -0.3346643, -1.263059, 1, 0, 0, 1, 1,
-1.533811, -0.8830992, -3.034902, 0, 0, 0, 1, 1,
-1.528976, -0.02598582, -2.186509, 0, 0, 0, 1, 1,
-1.528789, -1.041239, -0.1340327, 0, 0, 0, 1, 1,
-1.52781, 0.5121356, 0.2349581, 0, 0, 0, 1, 1,
-1.517767, 0.8014206, -2.628231, 0, 0, 0, 1, 1,
-1.503257, 0.1081918, -1.178258, 0, 0, 0, 1, 1,
-1.502635, -1.224108, -3.30535, 0, 0, 0, 1, 1,
-1.494033, 0.5123237, -0.9573755, 1, 1, 1, 1, 1,
-1.481364, 1.029602, -2.789153, 1, 1, 1, 1, 1,
-1.48134, 0.06089471, -2.322717, 1, 1, 1, 1, 1,
-1.472091, 1.280925, 0.7257712, 1, 1, 1, 1, 1,
-1.4649, -0.1977692, -1.456168, 1, 1, 1, 1, 1,
-1.460798, -2.786394, -3.665791, 1, 1, 1, 1, 1,
-1.45755, 0.6434257, -1.195641, 1, 1, 1, 1, 1,
-1.446999, 0.277339, -1.644769, 1, 1, 1, 1, 1,
-1.429938, 0.6068158, -1.555258, 1, 1, 1, 1, 1,
-1.427207, -0.3050602, -0.8279369, 1, 1, 1, 1, 1,
-1.422866, -0.8817582, -3.346091, 1, 1, 1, 1, 1,
-1.408497, -0.4037595, -2.504895, 1, 1, 1, 1, 1,
-1.4013, 0.3881277, -1.702316, 1, 1, 1, 1, 1,
-1.393328, 0.4727337, -2.627383, 1, 1, 1, 1, 1,
-1.384607, -0.1174169, -2.441774, 1, 1, 1, 1, 1,
-1.379249, 1.448903, -0.9073063, 0, 0, 1, 1, 1,
-1.358749, 0.3568726, -1.732808, 1, 0, 0, 1, 1,
-1.357481, 0.611304, -2.296944, 1, 0, 0, 1, 1,
-1.354309, 0.3750741, -1.405211, 1, 0, 0, 1, 1,
-1.351856, 0.6181241, -1.13497, 1, 0, 0, 1, 1,
-1.350652, -0.8230543, -2.56678, 1, 0, 0, 1, 1,
-1.346229, -1.855944, -3.97483, 0, 0, 0, 1, 1,
-1.338466, 0.2779364, -1.428767, 0, 0, 0, 1, 1,
-1.331861, 1.004297, -1.542956, 0, 0, 0, 1, 1,
-1.326998, 0.6031258, -1.846108, 0, 0, 0, 1, 1,
-1.326954, -0.8502943, -2.411902, 0, 0, 0, 1, 1,
-1.321727, 0.637539, -1.039846, 0, 0, 0, 1, 1,
-1.320847, 0.7408913, -1.811834, 0, 0, 0, 1, 1,
-1.312475, -0.1166674, -2.179279, 1, 1, 1, 1, 1,
-1.312329, 1.822516, 0.3242524, 1, 1, 1, 1, 1,
-1.309296, 0.3805434, -3.036879, 1, 1, 1, 1, 1,
-1.302169, 0.3249394, -0.7999616, 1, 1, 1, 1, 1,
-1.297007, -0.2552927, -2.880847, 1, 1, 1, 1, 1,
-1.29458, -0.3481292, -2.893058, 1, 1, 1, 1, 1,
-1.289587, 0.9653819, -1.541641, 1, 1, 1, 1, 1,
-1.280763, -0.5392165, -3.752775, 1, 1, 1, 1, 1,
-1.2795, -0.3253327, -2.550825, 1, 1, 1, 1, 1,
-1.273746, 0.9872177, -0.7794943, 1, 1, 1, 1, 1,
-1.271949, 0.6348922, -1.213478, 1, 1, 1, 1, 1,
-1.258171, 1.007083, -1.228355, 1, 1, 1, 1, 1,
-1.243508, 1.681625, -2.301102, 1, 1, 1, 1, 1,
-1.240775, -1.669215, -1.334824, 1, 1, 1, 1, 1,
-1.225823, -0.1542246, -3.312459, 1, 1, 1, 1, 1,
-1.223261, -1.192991, -1.850243, 0, 0, 1, 1, 1,
-1.222792, 2.315895, 1.360559, 1, 0, 0, 1, 1,
-1.21575, 0.6949393, 0.2094643, 1, 0, 0, 1, 1,
-1.215449, 0.4619337, -1.520591, 1, 0, 0, 1, 1,
-1.209429, -0.1339432, -1.942209, 1, 0, 0, 1, 1,
-1.201426, 0.1697381, -1.595259, 1, 0, 0, 1, 1,
-1.190181, -0.9606791, -1.542969, 0, 0, 0, 1, 1,
-1.180716, 0.820403, 1.394028, 0, 0, 0, 1, 1,
-1.176509, 1.363139, -1.057268, 0, 0, 0, 1, 1,
-1.171914, -0.1246745, -2.262424, 0, 0, 0, 1, 1,
-1.170933, -0.1532, -0.627956, 0, 0, 0, 1, 1,
-1.140881, 0.8005944, -0.01058122, 0, 0, 0, 1, 1,
-1.11966, 0.1103836, 0.09042555, 0, 0, 0, 1, 1,
-1.107037, -0.03020762, -1.90359, 1, 1, 1, 1, 1,
-1.096852, 0.3127928, 0.1497438, 1, 1, 1, 1, 1,
-1.094396, -0.2735803, -3.225944, 1, 1, 1, 1, 1,
-1.094172, 1.184432, -0.7763209, 1, 1, 1, 1, 1,
-1.093897, 0.6440707, 0.01299853, 1, 1, 1, 1, 1,
-1.092418, 0.3034804, 0.02020806, 1, 1, 1, 1, 1,
-1.086805, -0.7585312, -2.531927, 1, 1, 1, 1, 1,
-1.086488, 0.135592, -1.645239, 1, 1, 1, 1, 1,
-1.079315, 0.3125452, -1.91946, 1, 1, 1, 1, 1,
-1.078336, 0.6193406, -1.830471, 1, 1, 1, 1, 1,
-1.073835, 0.2702608, -0.638096, 1, 1, 1, 1, 1,
-1.069964, 0.9640597, -0.3444094, 1, 1, 1, 1, 1,
-1.063694, -1.395131, -3.490027, 1, 1, 1, 1, 1,
-1.057826, 0.785373, -2.300439, 1, 1, 1, 1, 1,
-1.050394, 0.8152971, -2.195818, 1, 1, 1, 1, 1,
-1.044914, 1.434515, -2.064313, 0, 0, 1, 1, 1,
-1.04192, 1.088053, -1.634912, 1, 0, 0, 1, 1,
-1.040022, 0.3263888, -0.3850943, 1, 0, 0, 1, 1,
-1.038382, 0.7122433, -0.9623186, 1, 0, 0, 1, 1,
-1.038234, 1.545757, -1.364448, 1, 0, 0, 1, 1,
-1.03516, -0.6131068, -2.150289, 1, 0, 0, 1, 1,
-1.03473, 0.02073735, -1.879649, 0, 0, 0, 1, 1,
-1.029513, 0.2526138, -2.826768, 0, 0, 0, 1, 1,
-1.020141, -1.190428, 0.1575247, 0, 0, 0, 1, 1,
-1.013837, -1.000808, -2.83443, 0, 0, 0, 1, 1,
-0.9914558, 0.4387839, -0.2860384, 0, 0, 0, 1, 1,
-0.9857586, -1.603157, -1.752534, 0, 0, 0, 1, 1,
-0.9782475, 0.564124, -0.5353261, 0, 0, 0, 1, 1,
-0.9757196, 0.09092955, -1.19617, 1, 1, 1, 1, 1,
-0.9744564, -0.6670697, -1.015801, 1, 1, 1, 1, 1,
-0.9690842, 1.795643, -1.452047, 1, 1, 1, 1, 1,
-0.966536, -0.6531241, -3.258157, 1, 1, 1, 1, 1,
-0.9633228, -0.5572299, -3.59903, 1, 1, 1, 1, 1,
-0.962659, 1.450264, -0.6474264, 1, 1, 1, 1, 1,
-0.9608142, 0.8859292, -0.09413482, 1, 1, 1, 1, 1,
-0.9544228, 0.1219147, -1.73469, 1, 1, 1, 1, 1,
-0.944981, -0.5238577, -2.718667, 1, 1, 1, 1, 1,
-0.9413557, -0.4022297, 0.4373576, 1, 1, 1, 1, 1,
-0.9291257, -0.821574, -3.666844, 1, 1, 1, 1, 1,
-0.9248464, 0.8370783, -1.760535, 1, 1, 1, 1, 1,
-0.9241225, 0.4159003, -0.8259298, 1, 1, 1, 1, 1,
-0.9240018, 1.091252, -1.798434, 1, 1, 1, 1, 1,
-0.9226171, 0.8306866, -2.202275, 1, 1, 1, 1, 1,
-0.9205638, 0.6773516, -1.751875, 0, 0, 1, 1, 1,
-0.9128472, 2.326887, -1.333089, 1, 0, 0, 1, 1,
-0.9078915, 3.150247, 1.450941, 1, 0, 0, 1, 1,
-0.9070152, 0.3160267, -1.251936, 1, 0, 0, 1, 1,
-0.9013862, -0.5754297, -2.328604, 1, 0, 0, 1, 1,
-0.8896577, 0.115677, -1.327366, 1, 0, 0, 1, 1,
-0.8849311, -1.125026, -2.035764, 0, 0, 0, 1, 1,
-0.8790762, -1.430649, -3.056124, 0, 0, 0, 1, 1,
-0.8788617, -0.4593225, -2.044887, 0, 0, 0, 1, 1,
-0.8786486, 0.2047979, -1.37566, 0, 0, 0, 1, 1,
-0.8769413, -0.4161728, -1.501731, 0, 0, 0, 1, 1,
-0.8718495, 0.1017834, 0.6486523, 0, 0, 0, 1, 1,
-0.8652057, 0.1296207, -0.8247702, 0, 0, 0, 1, 1,
-0.8422791, -1.116466, -2.57429, 1, 1, 1, 1, 1,
-0.8394769, -0.03803386, -0.3649302, 1, 1, 1, 1, 1,
-0.8261092, -0.9128679, -4.307788, 1, 1, 1, 1, 1,
-0.8193331, 0.3285804, 0.8953409, 1, 1, 1, 1, 1,
-0.8173568, 1.879523, -1.219794, 1, 1, 1, 1, 1,
-0.8163299, 0.1032102, -5.196509, 1, 1, 1, 1, 1,
-0.811762, -0.2716678, -2.12801, 1, 1, 1, 1, 1,
-0.8088626, -2.202735, -2.354578, 1, 1, 1, 1, 1,
-0.8085648, 0.4719875, 1.237517, 1, 1, 1, 1, 1,
-0.8081642, 0.4838581, 0.1500388, 1, 1, 1, 1, 1,
-0.804147, 0.5543373, -2.304859, 1, 1, 1, 1, 1,
-0.7974582, 0.4214009, 0.8175824, 1, 1, 1, 1, 1,
-0.795462, 0.8882547, -0.2568173, 1, 1, 1, 1, 1,
-0.7954022, 1.490607, -0.08338047, 1, 1, 1, 1, 1,
-0.7919319, -2.229514, -2.813989, 1, 1, 1, 1, 1,
-0.7882648, 0.02374371, -1.991742, 0, 0, 1, 1, 1,
-0.7882175, -0.3198119, -1.861137, 1, 0, 0, 1, 1,
-0.7857672, -1.07484, -2.883631, 1, 0, 0, 1, 1,
-0.7832575, 1.458892, -1.144073, 1, 0, 0, 1, 1,
-0.7821183, 0.8279544, 0.3595408, 1, 0, 0, 1, 1,
-0.7808031, -1.103928, -1.361255, 1, 0, 0, 1, 1,
-0.7799304, 0.0009129385, -2.764886, 0, 0, 0, 1, 1,
-0.7683073, -1.673562, -2.111417, 0, 0, 0, 1, 1,
-0.7663651, -0.514348, -1.688211, 0, 0, 0, 1, 1,
-0.7659191, -2.016782, -3.229073, 0, 0, 0, 1, 1,
-0.7649637, -0.4374671, -0.8165893, 0, 0, 0, 1, 1,
-0.7647703, -0.8847523, -2.892496, 0, 0, 0, 1, 1,
-0.7589989, -0.5043703, -2.937117, 0, 0, 0, 1, 1,
-0.7551196, -1.295433, -2.831238, 1, 1, 1, 1, 1,
-0.7548085, -0.3951582, -0.6902819, 1, 1, 1, 1, 1,
-0.7537691, -0.9119258, -4.312622, 1, 1, 1, 1, 1,
-0.7456279, -0.4258611, -1.97746, 1, 1, 1, 1, 1,
-0.7429004, 1.296404, -0.9998671, 1, 1, 1, 1, 1,
-0.7424901, -1.307261, -1.430437, 1, 1, 1, 1, 1,
-0.7344037, 0.6580997, -1.756781, 1, 1, 1, 1, 1,
-0.7322161, -0.6845343, -1.683115, 1, 1, 1, 1, 1,
-0.7315077, 0.5737253, 0.2868335, 1, 1, 1, 1, 1,
-0.7308301, -0.5517677, -3.166846, 1, 1, 1, 1, 1,
-0.7294395, -0.5194308, -1.753803, 1, 1, 1, 1, 1,
-0.7275219, -0.7097945, -2.011766, 1, 1, 1, 1, 1,
-0.7265736, 1.70629, -0.5707403, 1, 1, 1, 1, 1,
-0.7245287, -1.37638, -3.422734, 1, 1, 1, 1, 1,
-0.7208021, 0.149113, 0.2207057, 1, 1, 1, 1, 1,
-0.7092795, -1.999143, -2.299167, 0, 0, 1, 1, 1,
-0.7047897, 0.9744901, -0.470128, 1, 0, 0, 1, 1,
-0.7035283, 0.2959131, -1.424249, 1, 0, 0, 1, 1,
-0.7031005, 0.5499836, 0.3677354, 1, 0, 0, 1, 1,
-0.7015532, 0.2080638, -1.05065, 1, 0, 0, 1, 1,
-0.6924347, -0.8950281, -1.219738, 1, 0, 0, 1, 1,
-0.690864, -0.6592304, -2.299602, 0, 0, 0, 1, 1,
-0.6800199, 0.1120717, -0.736163, 0, 0, 0, 1, 1,
-0.6776438, -1.395799, -2.324804, 0, 0, 0, 1, 1,
-0.6728401, -0.2405374, -2.328428, 0, 0, 0, 1, 1,
-0.66659, 0.2840955, -1.191497, 0, 0, 0, 1, 1,
-0.6638934, -1.770668, -3.581218, 0, 0, 0, 1, 1,
-0.6562971, -0.7811382, -1.992904, 0, 0, 0, 1, 1,
-0.6530663, 1.014074, -0.02227817, 1, 1, 1, 1, 1,
-0.6491852, -0.1966851, -4.217197, 1, 1, 1, 1, 1,
-0.6482152, -0.497571, -3.143998, 1, 1, 1, 1, 1,
-0.6451939, -1.561977, -2.825135, 1, 1, 1, 1, 1,
-0.6427029, -1.51909, -3.21724, 1, 1, 1, 1, 1,
-0.6396614, 1.446246, -0.232054, 1, 1, 1, 1, 1,
-0.6373164, -0.5127673, -0.8685278, 1, 1, 1, 1, 1,
-0.6357723, -0.3947051, -0.7620287, 1, 1, 1, 1, 1,
-0.633817, -1.507003, -3.721405, 1, 1, 1, 1, 1,
-0.6329793, -0.2682749, -2.170096, 1, 1, 1, 1, 1,
-0.6313027, 1.290769, -3.077167, 1, 1, 1, 1, 1,
-0.6283715, 0.1941806, -1.054671, 1, 1, 1, 1, 1,
-0.6229397, -2.107535, -2.432346, 1, 1, 1, 1, 1,
-0.6227681, -1.0796, -2.399112, 1, 1, 1, 1, 1,
-0.620182, -0.4536595, -0.444649, 1, 1, 1, 1, 1,
-0.6188435, -0.5298368, -3.115258, 0, 0, 1, 1, 1,
-0.614165, -0.7217091, -2.61745, 1, 0, 0, 1, 1,
-0.6091635, -0.2758314, -1.369089, 1, 0, 0, 1, 1,
-0.6006269, -0.1913636, -1.584673, 1, 0, 0, 1, 1,
-0.5934083, -0.2619929, -1.723987, 1, 0, 0, 1, 1,
-0.5919828, -0.09034346, -2.347848, 1, 0, 0, 1, 1,
-0.5917319, 1.302605, -0.4162307, 0, 0, 0, 1, 1,
-0.5913985, 1.220426, -0.2309615, 0, 0, 0, 1, 1,
-0.5902585, 1.044199, -0.8700661, 0, 0, 0, 1, 1,
-0.5853397, 1.73386, -1.096032, 0, 0, 0, 1, 1,
-0.5826579, 0.91341, 0.057156, 0, 0, 0, 1, 1,
-0.5809316, -1.118491, -3.292084, 0, 0, 0, 1, 1,
-0.5801361, -0.5096239, -2.225461, 0, 0, 0, 1, 1,
-0.5773827, -0.6539331, -3.04232, 1, 1, 1, 1, 1,
-0.5744038, 0.2251883, -2.77144, 1, 1, 1, 1, 1,
-0.5723121, 1.454468, -0.6251125, 1, 1, 1, 1, 1,
-0.5680717, -0.02329274, 0.2689621, 1, 1, 1, 1, 1,
-0.5680482, -0.3480424, -1.83863, 1, 1, 1, 1, 1,
-0.5664335, 0.3358927, 0.4843476, 1, 1, 1, 1, 1,
-0.5652818, 0.777844, 0.3654634, 1, 1, 1, 1, 1,
-0.5639999, 0.9178103, -1.35739, 1, 1, 1, 1, 1,
-0.5632109, 0.06621595, -0.3640476, 1, 1, 1, 1, 1,
-0.5629632, 1.31278, 1.226298, 1, 1, 1, 1, 1,
-0.5612777, -0.5402269, -1.834329, 1, 1, 1, 1, 1,
-0.561265, -0.3293441, -3.878203, 1, 1, 1, 1, 1,
-0.557788, -0.5077481, -1.920315, 1, 1, 1, 1, 1,
-0.5573664, 1.315953, 1.407869, 1, 1, 1, 1, 1,
-0.5555504, -0.6161321, -2.030808, 1, 1, 1, 1, 1,
-0.5512278, 0.2304308, 0.1575209, 0, 0, 1, 1, 1,
-0.5447242, 0.03787299, -2.521938, 1, 0, 0, 1, 1,
-0.5433637, 0.2075295, 0.1385456, 1, 0, 0, 1, 1,
-0.5343317, -1.373436, -2.688269, 1, 0, 0, 1, 1,
-0.5339618, 2.654402, 1.009385, 1, 0, 0, 1, 1,
-0.5314543, -0.5735982, -1.934575, 1, 0, 0, 1, 1,
-0.5312653, -0.8644655, -1.493139, 0, 0, 0, 1, 1,
-0.5286834, -1.772014, -4.058893, 0, 0, 0, 1, 1,
-0.5277907, 0.4236913, -0.92156, 0, 0, 0, 1, 1,
-0.5236693, -0.132799, -0.8181543, 0, 0, 0, 1, 1,
-0.5226077, 1.068104, 0.2982434, 0, 0, 0, 1, 1,
-0.520652, 0.4546402, -0.2556147, 0, 0, 0, 1, 1,
-0.5188234, 1.441806, 1.045428, 0, 0, 0, 1, 1,
-0.5155569, -2.000829, -2.839335, 1, 1, 1, 1, 1,
-0.5141323, -0.2088476, -0.740986, 1, 1, 1, 1, 1,
-0.5120024, 0.3943376, 0.2077243, 1, 1, 1, 1, 1,
-0.5119279, -0.2230901, -3.674758, 1, 1, 1, 1, 1,
-0.5107683, -0.285227, -3.083936, 1, 1, 1, 1, 1,
-0.5074081, -0.005736223, -3.065565, 1, 1, 1, 1, 1,
-0.5017937, -1.412505, -1.312881, 1, 1, 1, 1, 1,
-0.5007137, 1.116055, -1.23002, 1, 1, 1, 1, 1,
-0.5003681, 0.07206239, -0.2242725, 1, 1, 1, 1, 1,
-0.4999525, 1.524264, 1.818659, 1, 1, 1, 1, 1,
-0.4950155, -1.739857, -4.427166, 1, 1, 1, 1, 1,
-0.4940901, 0.3034324, 1.182081, 1, 1, 1, 1, 1,
-0.4924557, 1.062479, -1.539346, 1, 1, 1, 1, 1,
-0.4909822, 0.9060749, -1.456729, 1, 1, 1, 1, 1,
-0.4892814, 0.5485631, -0.3525722, 1, 1, 1, 1, 1,
-0.4859626, -0.4588187, -2.106396, 0, 0, 1, 1, 1,
-0.4852464, -0.4690972, -1.825735, 1, 0, 0, 1, 1,
-0.4848376, -0.6764052, -3.192808, 1, 0, 0, 1, 1,
-0.4843717, 1.181754, -0.05048046, 1, 0, 0, 1, 1,
-0.4834776, -2.5196, -3.74509, 1, 0, 0, 1, 1,
-0.4827359, 0.260019, -1.711649, 1, 0, 0, 1, 1,
-0.4795291, -0.8417298, -3.127432, 0, 0, 0, 1, 1,
-0.4710932, 0.46296, -1.495503, 0, 0, 0, 1, 1,
-0.4693353, -0.7993042, -2.499001, 0, 0, 0, 1, 1,
-0.469259, 0.02864283, -2.370499, 0, 0, 0, 1, 1,
-0.4692463, 0.7028396, 0.06844427, 0, 0, 0, 1, 1,
-0.4597488, -1.555073, -4.449596, 0, 0, 0, 1, 1,
-0.456736, -1.716599, -2.295587, 0, 0, 0, 1, 1,
-0.4547242, -0.08514766, -2.31311, 1, 1, 1, 1, 1,
-0.4481596, 1.730653, -0.5928943, 1, 1, 1, 1, 1,
-0.4442909, -0.5595362, -2.127694, 1, 1, 1, 1, 1,
-0.443279, 0.7514759, -1.633096, 1, 1, 1, 1, 1,
-0.4380241, -1.021021, -1.511321, 1, 1, 1, 1, 1,
-0.4370611, 0.2509415, -1.878642, 1, 1, 1, 1, 1,
-0.4323554, 0.5460823, -0.8346313, 1, 1, 1, 1, 1,
-0.4237652, 0.628372, -0.1668593, 1, 1, 1, 1, 1,
-0.4184546, 0.7675373, -0.6732211, 1, 1, 1, 1, 1,
-0.4174423, -0.2081662, -0.6223902, 1, 1, 1, 1, 1,
-0.4163845, 1.38879, 0.681236, 1, 1, 1, 1, 1,
-0.4161308, -1.505765, -2.633198, 1, 1, 1, 1, 1,
-0.4151573, -0.6052396, -1.980844, 1, 1, 1, 1, 1,
-0.4130197, 2.178759, 2.688059, 1, 1, 1, 1, 1,
-0.3975386, 0.4025394, -1.524219, 1, 1, 1, 1, 1,
-0.392729, 1.085448, -0.2415336, 0, 0, 1, 1, 1,
-0.390157, -0.01378021, -0.06259654, 1, 0, 0, 1, 1,
-0.3887641, 0.8843302, -0.7519089, 1, 0, 0, 1, 1,
-0.3875425, 1.829368, 0.1532333, 1, 0, 0, 1, 1,
-0.3844375, -1.063166, -1.352034, 1, 0, 0, 1, 1,
-0.3789636, 0.2027188, -0.2767815, 1, 0, 0, 1, 1,
-0.3709481, 0.4430589, 0.5764921, 0, 0, 0, 1, 1,
-0.3702176, -0.6891375, -2.916069, 0, 0, 0, 1, 1,
-0.3677014, -0.7871423, -1.499163, 0, 0, 0, 1, 1,
-0.3669117, -1.137119, -2.729711, 0, 0, 0, 1, 1,
-0.3666327, -0.1204171, -4.281846, 0, 0, 0, 1, 1,
-0.3642556, 0.2620955, -0.3976775, 0, 0, 0, 1, 1,
-0.3553366, 0.680584, 0.2192199, 0, 0, 0, 1, 1,
-0.355263, -0.9732749, -2.557912, 1, 1, 1, 1, 1,
-0.3411471, -0.17139, -2.637341, 1, 1, 1, 1, 1,
-0.3318011, 0.9619318, 1.8585, 1, 1, 1, 1, 1,
-0.3232576, 0.9739708, -1.377454, 1, 1, 1, 1, 1,
-0.3220032, 0.1308528, -1.257613, 1, 1, 1, 1, 1,
-0.3205798, -0.2595928, -2.451111, 1, 1, 1, 1, 1,
-0.320475, 0.2849056, 0.4938824, 1, 1, 1, 1, 1,
-0.3195495, 0.1939945, -1.468633, 1, 1, 1, 1, 1,
-0.3182237, 1.421727, 0.4322299, 1, 1, 1, 1, 1,
-0.3166334, -0.08430332, -1.817393, 1, 1, 1, 1, 1,
-0.31601, -0.8116027, -2.345756, 1, 1, 1, 1, 1,
-0.3143938, 0.9059229, -1.277463, 1, 1, 1, 1, 1,
-0.3117962, -0.1900982, -1.916588, 1, 1, 1, 1, 1,
-0.3089612, 0.3448308, 0.5902768, 1, 1, 1, 1, 1,
-0.3087634, 0.0005494257, -2.559705, 1, 1, 1, 1, 1,
-0.3067995, 1.196204, 1.221993, 0, 0, 1, 1, 1,
-0.3066531, 2.023757, -0.6439565, 1, 0, 0, 1, 1,
-0.3055098, -1.039856, -1.115353, 1, 0, 0, 1, 1,
-0.3050478, -0.1517657, -1.409498, 1, 0, 0, 1, 1,
-0.3019753, -0.7356918, -2.211388, 1, 0, 0, 1, 1,
-0.2993276, 0.6012573, -2.740357, 1, 0, 0, 1, 1,
-0.2985813, -1.380144, -2.933841, 0, 0, 0, 1, 1,
-0.2984889, -1.272483, -2.088186, 0, 0, 0, 1, 1,
-0.2982012, -1.351212, -3.013869, 0, 0, 0, 1, 1,
-0.2920333, -1.047227, -2.958173, 0, 0, 0, 1, 1,
-0.2816621, -0.2653497, -0.6688097, 0, 0, 0, 1, 1,
-0.2719761, 0.7931749, 0.7381759, 0, 0, 0, 1, 1,
-0.2698913, 0.4110296, -2.070683, 0, 0, 0, 1, 1,
-0.2684339, -0.4864193, -3.828991, 1, 1, 1, 1, 1,
-0.2618577, 2.191346, -0.4876739, 1, 1, 1, 1, 1,
-0.2607478, -1.049508, -5.185836, 1, 1, 1, 1, 1,
-0.251628, -1.242884, -3.803996, 1, 1, 1, 1, 1,
-0.2458078, -0.3452391, -3.297368, 1, 1, 1, 1, 1,
-0.2454354, 0.0844036, -0.5835925, 1, 1, 1, 1, 1,
-0.2439373, 0.1269252, -3.272374, 1, 1, 1, 1, 1,
-0.2428183, 2.625853, -0.3808948, 1, 1, 1, 1, 1,
-0.2363036, 1.835165, 0.526316, 1, 1, 1, 1, 1,
-0.2286194, -0.2766392, -3.135391, 1, 1, 1, 1, 1,
-0.2263504, 2.388064, 0.3681693, 1, 1, 1, 1, 1,
-0.2201377, 0.4666343, 1.441909, 1, 1, 1, 1, 1,
-0.2200577, -0.6920314, 0.2398956, 1, 1, 1, 1, 1,
-0.2190734, 1.10035, 0.4449505, 1, 1, 1, 1, 1,
-0.2184783, 0.8727169, -0.5433286, 1, 1, 1, 1, 1,
-0.21776, 0.424309, 0.2486387, 0, 0, 1, 1, 1,
-0.2166233, -0.7085603, -2.260276, 1, 0, 0, 1, 1,
-0.2161026, 0.7132354, -0.7490145, 1, 0, 0, 1, 1,
-0.214242, -0.3339148, -3.009861, 1, 0, 0, 1, 1,
-0.210842, 1.469638, 0.1642406, 1, 0, 0, 1, 1,
-0.2106482, -2.080064, -4.139334, 1, 0, 0, 1, 1,
-0.2078029, -0.423507, -3.071929, 0, 0, 0, 1, 1,
-0.2069505, -0.2130017, -2.434658, 0, 0, 0, 1, 1,
-0.2065554, -0.5323015, -4.087337, 0, 0, 0, 1, 1,
-0.2064311, 0.1724428, -0.5205629, 0, 0, 0, 1, 1,
-0.2063162, -0.8612435, -1.972541, 0, 0, 0, 1, 1,
-0.2053417, 1.072734, -0.2353505, 0, 0, 0, 1, 1,
-0.2047665, -0.4958686, -5.291809, 0, 0, 0, 1, 1,
-0.2026015, 0.2396194, 0.6598625, 1, 1, 1, 1, 1,
-0.2022967, -0.01446411, -1.461484, 1, 1, 1, 1, 1,
-0.1983672, 2.505062, 0.9640962, 1, 1, 1, 1, 1,
-0.1953897, 0.1277521, -0.08042542, 1, 1, 1, 1, 1,
-0.1885995, -1.962482, -3.45208, 1, 1, 1, 1, 1,
-0.1824382, 1.727947, -1.405789, 1, 1, 1, 1, 1,
-0.1822087, 1.400152, -1.279359, 1, 1, 1, 1, 1,
-0.180452, -0.4747996, -3.64786, 1, 1, 1, 1, 1,
-0.1784746, -0.8326509, -5.389081, 1, 1, 1, 1, 1,
-0.1765372, -1.029362, -3.821795, 1, 1, 1, 1, 1,
-0.1732436, 1.706974, 1.4767, 1, 1, 1, 1, 1,
-0.1713974, 1.022472, -1.961982, 1, 1, 1, 1, 1,
-0.1710316, -0.05832212, -2.055553, 1, 1, 1, 1, 1,
-0.1646339, 0.0224155, -0.9237111, 1, 1, 1, 1, 1,
-0.1632894, 0.712104, -1.652397, 1, 1, 1, 1, 1,
-0.1627633, 0.3819543, -0.9240201, 0, 0, 1, 1, 1,
-0.1598442, 0.5576207, -2.096696, 1, 0, 0, 1, 1,
-0.1577182, 0.1557678, -1.117142, 1, 0, 0, 1, 1,
-0.1567718, -0.8228086, -4.28124, 1, 0, 0, 1, 1,
-0.1544483, -0.4860784, -3.747495, 1, 0, 0, 1, 1,
-0.1540562, -1.075698, -3.58612, 1, 0, 0, 1, 1,
-0.152382, 0.8377988, -3.243844, 0, 0, 0, 1, 1,
-0.1505068, -0.1491596, -2.932015, 0, 0, 0, 1, 1,
-0.1503158, 1.950847, 0.5030444, 0, 0, 0, 1, 1,
-0.1465012, -0.1845831, -3.95751, 0, 0, 0, 1, 1,
-0.1458356, 1.041783, 0.01029257, 0, 0, 0, 1, 1,
-0.1456483, -1.120098, -4.0134, 0, 0, 0, 1, 1,
-0.138451, -0.7599355, -2.136166, 0, 0, 0, 1, 1,
-0.1378917, -0.4131829, -2.741819, 1, 1, 1, 1, 1,
-0.1369286, 0.7609176, -0.3842757, 1, 1, 1, 1, 1,
-0.1347381, -1.907739, -3.698968, 1, 1, 1, 1, 1,
-0.1302425, -0.5904364, -4.621785, 1, 1, 1, 1, 1,
-0.1270863, 0.2783741, 2.006833, 1, 1, 1, 1, 1,
-0.1205844, 0.05256574, -1.522732, 1, 1, 1, 1, 1,
-0.1200842, -0.02955011, -1.575029, 1, 1, 1, 1, 1,
-0.1200463, 2.826992, 0.7642261, 1, 1, 1, 1, 1,
-0.1200157, 0.2285353, 0.6475626, 1, 1, 1, 1, 1,
-0.1197392, 0.7047085, 1.271775, 1, 1, 1, 1, 1,
-0.119204, -0.0005322885, -2.22844, 1, 1, 1, 1, 1,
-0.1190281, -0.5975283, -2.345882, 1, 1, 1, 1, 1,
-0.113901, 0.07950373, -1.721359, 1, 1, 1, 1, 1,
-0.1123559, -1.551581, -4.447896, 1, 1, 1, 1, 1,
-0.1123367, 0.2618007, -1.220332, 1, 1, 1, 1, 1,
-0.1113626, 0.2351309, 0.7141248, 0, 0, 1, 1, 1,
-0.1019155, -0.93221, -2.860754, 1, 0, 0, 1, 1,
-0.09889577, 1.138427, -0.05040965, 1, 0, 0, 1, 1,
-0.09678917, 0.9154181, -0.7275854, 1, 0, 0, 1, 1,
-0.09617634, -1.793624, -2.539185, 1, 0, 0, 1, 1,
-0.08571942, 1.443597, -1.226101, 1, 0, 0, 1, 1,
-0.08315054, -0.9991156, -1.962748, 0, 0, 0, 1, 1,
-0.078228, 0.6279996, -2.171203, 0, 0, 0, 1, 1,
-0.07775743, 0.3674684, 0.8452842, 0, 0, 0, 1, 1,
-0.07639472, 1.960013, 1.457932, 0, 0, 0, 1, 1,
-0.07489903, 0.5840443, 0.3490862, 0, 0, 0, 1, 1,
-0.06931958, 1.406295, -0.5259125, 0, 0, 0, 1, 1,
-0.06573708, -0.09786756, -2.156453, 0, 0, 0, 1, 1,
-0.06212764, -0.127916, -4.19889, 1, 1, 1, 1, 1,
-0.06093457, -1.731884, -1.500017, 1, 1, 1, 1, 1,
-0.05859579, -1.183774, -2.444276, 1, 1, 1, 1, 1,
-0.05837772, -1.404298, -2.07276, 1, 1, 1, 1, 1,
-0.05764273, 0.03349298, -0.8600928, 1, 1, 1, 1, 1,
-0.05742225, -0.7485647, -4.119, 1, 1, 1, 1, 1,
-0.05684894, 0.6329858, 1.549948, 1, 1, 1, 1, 1,
-0.05610092, 0.9941915, -0.05214774, 1, 1, 1, 1, 1,
-0.05595985, 1.783076, 0.8232831, 1, 1, 1, 1, 1,
-0.05560948, -0.4309421, -0.7966853, 1, 1, 1, 1, 1,
-0.05302004, 0.831469, 0.04994854, 1, 1, 1, 1, 1,
-0.05072843, 2.118557, 0.08359287, 1, 1, 1, 1, 1,
-0.04871353, 1.332645, -1.211329, 1, 1, 1, 1, 1,
-0.0479474, 0.7059631, -1.867637, 1, 1, 1, 1, 1,
-0.04284047, -0.9982415, -5.14962, 1, 1, 1, 1, 1,
-0.04014614, 0.04713156, -1.655463, 0, 0, 1, 1, 1,
-0.03684682, 0.1996816, -0.9853199, 1, 0, 0, 1, 1,
-0.02672726, 1.724849, 0.7666615, 1, 0, 0, 1, 1,
-0.02155115, -0.3740045, -1.87926, 1, 0, 0, 1, 1,
-0.01586248, -0.0768949, -2.686358, 1, 0, 0, 1, 1,
-0.01375844, 2.273604, -0.1448132, 1, 0, 0, 1, 1,
-0.01300468, 0.50701, 0.5735404, 0, 0, 0, 1, 1,
-0.0119031, -0.6257424, -4.512667, 0, 0, 0, 1, 1,
-0.00963305, -0.976014, -1.59138, 0, 0, 0, 1, 1,
-0.009572883, -0.05075711, -3.315164, 0, 0, 0, 1, 1,
-0.007620925, -1.747137, -3.518047, 0, 0, 0, 1, 1,
-0.005109914, -0.4594434, -2.637229, 0, 0, 0, 1, 1,
-0.002416561, -0.8308964, -4.121116, 0, 0, 0, 1, 1,
-0.001087109, 0.0729658, 0.2268108, 1, 1, 1, 1, 1,
9.862013e-05, 0.664488, 0.6035796, 1, 1, 1, 1, 1,
0.002052724, 0.4931092, -0.1684181, 1, 1, 1, 1, 1,
0.006327624, -0.4747181, 3.90481, 1, 1, 1, 1, 1,
0.009348593, -0.5732922, 3.293842, 1, 1, 1, 1, 1,
0.01831126, 0.9195837, -2.207877, 1, 1, 1, 1, 1,
0.01950512, 0.4995533, -0.8504549, 1, 1, 1, 1, 1,
0.01973924, 1.141403, 2.033839, 1, 1, 1, 1, 1,
0.02460219, -0.1191196, 3.53926, 1, 1, 1, 1, 1,
0.02476843, 1.170068, -0.9353993, 1, 1, 1, 1, 1,
0.02664261, 1.342059, -0.7102436, 1, 1, 1, 1, 1,
0.02792214, -0.2480479, 3.295637, 1, 1, 1, 1, 1,
0.02922846, 0.07823066, -0.8411742, 1, 1, 1, 1, 1,
0.03134282, -0.5343168, 2.485764, 1, 1, 1, 1, 1,
0.03295689, 0.4532879, 0.847472, 1, 1, 1, 1, 1,
0.03869368, 1.000752, 0.2493409, 0, 0, 1, 1, 1,
0.0398444, -1.599846, 3.899088, 1, 0, 0, 1, 1,
0.0408377, 0.7061474, 1.475221, 1, 0, 0, 1, 1,
0.04361876, 0.3463237, -0.3305776, 1, 0, 0, 1, 1,
0.04950446, -1.604192, 4.346907, 1, 0, 0, 1, 1,
0.05011132, 0.5849177, -1.273732, 1, 0, 0, 1, 1,
0.05299835, 1.750208, -0.2511407, 0, 0, 0, 1, 1,
0.05540509, -0.7586028, 1.050807, 0, 0, 0, 1, 1,
0.05745466, 1.333486, 0.7801643, 0, 0, 0, 1, 1,
0.06134684, -0.7085262, 4.244192, 0, 0, 0, 1, 1,
0.0615413, 1.177604, 0.4736728, 0, 0, 0, 1, 1,
0.06195694, -0.2266787, 2.999586, 0, 0, 0, 1, 1,
0.06669991, -0.9845186, 3.978118, 0, 0, 0, 1, 1,
0.06957898, -0.4614948, 3.188775, 1, 1, 1, 1, 1,
0.07395511, 1.199834, -2.613168, 1, 1, 1, 1, 1,
0.07472331, 0.3718428, 1.083387, 1, 1, 1, 1, 1,
0.07599384, -0.5143234, 2.806333, 1, 1, 1, 1, 1,
0.0784762, 1.322441, 1.112355, 1, 1, 1, 1, 1,
0.08511601, -0.6629041, 3.020025, 1, 1, 1, 1, 1,
0.08715808, -0.1139146, 2.556132, 1, 1, 1, 1, 1,
0.08893932, 0.3869611, 1.020012, 1, 1, 1, 1, 1,
0.08969488, 0.7451904, 1.468028, 1, 1, 1, 1, 1,
0.09009201, -0.572543, 2.271828, 1, 1, 1, 1, 1,
0.09174564, -0.2936315, 1.467264, 1, 1, 1, 1, 1,
0.0937128, -0.3490745, 2.036418, 1, 1, 1, 1, 1,
0.1001214, -2.185091, 2.537594, 1, 1, 1, 1, 1,
0.1010332, -0.4588685, 4.248477, 1, 1, 1, 1, 1,
0.1013576, -0.9000509, 3.61122, 1, 1, 1, 1, 1,
0.101566, 0.4326484, 0.007847014, 0, 0, 1, 1, 1,
0.1067612, -0.5981302, 3.405869, 1, 0, 0, 1, 1,
0.10677, 0.7158324, 2.030643, 1, 0, 0, 1, 1,
0.1079398, -0.2840639, 3.405658, 1, 0, 0, 1, 1,
0.1090519, 0.3147425, 0.888138, 1, 0, 0, 1, 1,
0.1175556, -1.985713, 3.618356, 1, 0, 0, 1, 1,
0.120858, -1.435102, 1.750923, 0, 0, 0, 1, 1,
0.1212103, 0.1675968, 0.3387265, 0, 0, 0, 1, 1,
0.1212146, 0.4748059, 1.395278, 0, 0, 0, 1, 1,
0.1223164, -0.8143878, 3.236742, 0, 0, 0, 1, 1,
0.1229862, 0.3735853, 0.5029304, 0, 0, 0, 1, 1,
0.1340439, 1.4232, 0.7385728, 0, 0, 0, 1, 1,
0.1342259, 0.4255565, 0.1845063, 0, 0, 0, 1, 1,
0.1358865, 1.681209, -0.5956188, 1, 1, 1, 1, 1,
0.1375859, 1.875218, 0.4384323, 1, 1, 1, 1, 1,
0.1568474, 0.4650984, 0.2867856, 1, 1, 1, 1, 1,
0.1616511, 0.3496033, -0.3830234, 1, 1, 1, 1, 1,
0.1659737, -0.5766981, 3.030144, 1, 1, 1, 1, 1,
0.1664763, 0.6707116, 0.9352097, 1, 1, 1, 1, 1,
0.1665357, -1.488615, 3.366529, 1, 1, 1, 1, 1,
0.1687972, 0.06660109, 1.197325, 1, 1, 1, 1, 1,
0.1696818, 0.1725269, 0.6053407, 1, 1, 1, 1, 1,
0.1713214, -0.3661009, 2.922341, 1, 1, 1, 1, 1,
0.1725097, -0.3344295, 3.742923, 1, 1, 1, 1, 1,
0.1730922, 0.7581519, 1.446956, 1, 1, 1, 1, 1,
0.173524, 0.5709428, 1.154431, 1, 1, 1, 1, 1,
0.1737491, 1.11841, -0.05541446, 1, 1, 1, 1, 1,
0.1750598, 0.5091926, 0.5604808, 1, 1, 1, 1, 1,
0.1769843, 0.8004418, 0.4422205, 0, 0, 1, 1, 1,
0.1791745, 1.125535, 2.540784, 1, 0, 0, 1, 1,
0.1840175, 3.471447, 0.2383084, 1, 0, 0, 1, 1,
0.1847095, -0.3802692, 1.444224, 1, 0, 0, 1, 1,
0.1918504, -1.914103, 1.748656, 1, 0, 0, 1, 1,
0.1925184, -0.1949724, 2.344947, 1, 0, 0, 1, 1,
0.1942156, -0.4032472, 1.978503, 0, 0, 0, 1, 1,
0.1988117, 1.856841, -0.8101287, 0, 0, 0, 1, 1,
0.2061595, -1.051266, 1.200695, 0, 0, 0, 1, 1,
0.2065597, -0.863925, 2.424707, 0, 0, 0, 1, 1,
0.2131741, 1.7289, -0.1364724, 0, 0, 0, 1, 1,
0.2133414, 1.22475, 0.9873825, 0, 0, 0, 1, 1,
0.2135355, 0.04571785, 0.9554316, 0, 0, 0, 1, 1,
0.2141291, 1.26478, 0.2913153, 1, 1, 1, 1, 1,
0.2164088, -0.06646899, 3.04808, 1, 1, 1, 1, 1,
0.2179002, 0.712884, 1.936343, 1, 1, 1, 1, 1,
0.2229085, 0.869484, -0.6394522, 1, 1, 1, 1, 1,
0.2260155, -0.07659462, 1.45979, 1, 1, 1, 1, 1,
0.2269179, -0.4166633, 3.449131, 1, 1, 1, 1, 1,
0.2343383, -1.026775, 2.771634, 1, 1, 1, 1, 1,
0.2434839, -0.5301941, 3.940643, 1, 1, 1, 1, 1,
0.247041, 1.833003, -2.660311, 1, 1, 1, 1, 1,
0.2485693, -0.8639123, 2.68816, 1, 1, 1, 1, 1,
0.2511915, -1.150656, 2.562286, 1, 1, 1, 1, 1,
0.2650432, -0.9612955, 1.651557, 1, 1, 1, 1, 1,
0.2657905, -0.8789517, 2.372375, 1, 1, 1, 1, 1,
0.2662567, -0.571075, 1.510818, 1, 1, 1, 1, 1,
0.267348, -0.8194398, 2.634503, 1, 1, 1, 1, 1,
0.2706843, -0.3220813, 2.050782, 0, 0, 1, 1, 1,
0.2711543, -0.7166391, 3.581227, 1, 0, 0, 1, 1,
0.2744313, 2.364221, -1.246944, 1, 0, 0, 1, 1,
0.2746814, 0.92232, 1.280329, 1, 0, 0, 1, 1,
0.2756565, 0.8144305, -1.237648, 1, 0, 0, 1, 1,
0.2781144, -0.6373305, 2.144769, 1, 0, 0, 1, 1,
0.279467, 0.9228636, -0.7441539, 0, 0, 0, 1, 1,
0.2815749, 0.4838461, 2.480859, 0, 0, 0, 1, 1,
0.2828774, -0.369313, 3.485067, 0, 0, 0, 1, 1,
0.2882235, -1.207724, 3.502395, 0, 0, 0, 1, 1,
0.288692, 0.2073856, 0.5333533, 0, 0, 0, 1, 1,
0.2904607, 0.2076806, -0.6097924, 0, 0, 0, 1, 1,
0.2908219, -1.360575, 2.727994, 0, 0, 0, 1, 1,
0.2931674, -0.821003, 2.118768, 1, 1, 1, 1, 1,
0.2965063, 0.6625414, 0.68985, 1, 1, 1, 1, 1,
0.311343, 0.4136367, -1.214782, 1, 1, 1, 1, 1,
0.3118896, 0.9048235, 0.9963511, 1, 1, 1, 1, 1,
0.3137376, 0.7829382, 1.196012, 1, 1, 1, 1, 1,
0.3164193, -1.428913, 2.885293, 1, 1, 1, 1, 1,
0.3198735, 1.007531, -0.007846339, 1, 1, 1, 1, 1,
0.3209234, -1.930107, 4.145524, 1, 1, 1, 1, 1,
0.3210012, -0.7757204, 1.435164, 1, 1, 1, 1, 1,
0.3213826, 0.5229648, 1.009858, 1, 1, 1, 1, 1,
0.3214669, -0.07358457, 1.347476, 1, 1, 1, 1, 1,
0.3216877, 0.1809259, 0.7990808, 1, 1, 1, 1, 1,
0.3233519, 1.811254, -1.210151, 1, 1, 1, 1, 1,
0.3243332, 0.5059091, 1.614012, 1, 1, 1, 1, 1,
0.3256161, 0.5145118, 1.239743, 1, 1, 1, 1, 1,
0.3362839, 0.03894999, 1.254982, 0, 0, 1, 1, 1,
0.33693, 0.1080988, 0.9363408, 1, 0, 0, 1, 1,
0.3381745, 0.4603814, 0.8236266, 1, 0, 0, 1, 1,
0.3384126, 1.005014, 1.879317, 1, 0, 0, 1, 1,
0.341439, -0.6831922, 2.620068, 1, 0, 0, 1, 1,
0.3468546, 0.5722227, 1.638386, 1, 0, 0, 1, 1,
0.3480024, -0.205774, 1.165542, 0, 0, 0, 1, 1,
0.3487213, 0.8151979, 1.186099, 0, 0, 0, 1, 1,
0.3546108, -1.853994, 3.072833, 0, 0, 0, 1, 1,
0.3555056, -1.494738, 2.252888, 0, 0, 0, 1, 1,
0.3582903, -0.2188936, 1.632256, 0, 0, 0, 1, 1,
0.3591616, -0.4731169, 1.943198, 0, 0, 0, 1, 1,
0.3637156, -0.8158135, 4.185839, 0, 0, 0, 1, 1,
0.3742792, -1.897701, 2.306038, 1, 1, 1, 1, 1,
0.374457, 0.2148033, 0.9111109, 1, 1, 1, 1, 1,
0.3756388, 0.1193596, 0.9976547, 1, 1, 1, 1, 1,
0.3760629, -0.1550743, 1.816522, 1, 1, 1, 1, 1,
0.3776424, -1.012503, 2.936551, 1, 1, 1, 1, 1,
0.3808639, 0.2533298, 1.070501, 1, 1, 1, 1, 1,
0.3813874, -0.3600832, 1.423701, 1, 1, 1, 1, 1,
0.3871453, -1.249158, 2.888262, 1, 1, 1, 1, 1,
0.3892388, 0.9374994, 1.489588, 1, 1, 1, 1, 1,
0.3907956, -0.1284089, 1.009964, 1, 1, 1, 1, 1,
0.4007409, 0.3613209, 0.7107817, 1, 1, 1, 1, 1,
0.4013823, -0.05024435, 1.278522, 1, 1, 1, 1, 1,
0.4024841, 1.224204, -0.4592769, 1, 1, 1, 1, 1,
0.4066578, -0.6393346, 2.745502, 1, 1, 1, 1, 1,
0.4070752, 0.5162116, 0.496319, 1, 1, 1, 1, 1,
0.4089195, 1.52477, -0.4907908, 0, 0, 1, 1, 1,
0.4119793, 1.640266, 1.591421, 1, 0, 0, 1, 1,
0.4127124, -0.6919755, 2.539604, 1, 0, 0, 1, 1,
0.4131103, -1.532912, 2.303956, 1, 0, 0, 1, 1,
0.4151353, -0.6966336, 2.351214, 1, 0, 0, 1, 1,
0.4151515, -0.4037313, 2.848097, 1, 0, 0, 1, 1,
0.4215031, 0.5022411, 0.3085241, 0, 0, 0, 1, 1,
0.4217302, -0.8250149, 3.44785, 0, 0, 0, 1, 1,
0.4239254, 0.9050996, 1.615986, 0, 0, 0, 1, 1,
0.4264528, 1.503718, 0.9564684, 0, 0, 0, 1, 1,
0.4274964, -1.61405, 2.474427, 0, 0, 0, 1, 1,
0.4280237, 0.42434, -0.426451, 0, 0, 0, 1, 1,
0.4322192, 0.9044521, 0.9038892, 0, 0, 0, 1, 1,
0.4383639, 0.9189853, 1.032668, 1, 1, 1, 1, 1,
0.4407074, 2.281239, -0.1676484, 1, 1, 1, 1, 1,
0.4429633, 0.1905496, 0.01642142, 1, 1, 1, 1, 1,
0.4441199, 0.7088458, 1.606541, 1, 1, 1, 1, 1,
0.4496471, -0.6806675, 3.16704, 1, 1, 1, 1, 1,
0.4540566, -1.108273, 2.370981, 1, 1, 1, 1, 1,
0.4569937, 0.05875916, 1.478326, 1, 1, 1, 1, 1,
0.458317, -0.3049701, 1.940611, 1, 1, 1, 1, 1,
0.4638843, 1.122389, 1.513331, 1, 1, 1, 1, 1,
0.467366, -0.1906599, 2.371966, 1, 1, 1, 1, 1,
0.4678501, 1.008638, -0.06914941, 1, 1, 1, 1, 1,
0.4729924, 1.333533, -0.6610179, 1, 1, 1, 1, 1,
0.4730002, -0.1409921, 2.140039, 1, 1, 1, 1, 1,
0.4739301, 1.901924, 0.7855643, 1, 1, 1, 1, 1,
0.4739764, -0.5208742, 1.287996, 1, 1, 1, 1, 1,
0.4761235, -0.6695017, 0.6283553, 0, 0, 1, 1, 1,
0.4764714, -0.9842862, 3.559777, 1, 0, 0, 1, 1,
0.4802897, -1.089984, 3.848111, 1, 0, 0, 1, 1,
0.486765, 0.07545014, 0.5008294, 1, 0, 0, 1, 1,
0.4925366, -0.632425, 2.774462, 1, 0, 0, 1, 1,
0.4928176, -0.3544073, 3.69676, 1, 0, 0, 1, 1,
0.4930311, -1.386004, 2.65079, 0, 0, 0, 1, 1,
0.494853, -0.5702633, 3.003606, 0, 0, 0, 1, 1,
0.4954251, -1.152926, 1.277387, 0, 0, 0, 1, 1,
0.4976694, 1.534188, 2.313417, 0, 0, 0, 1, 1,
0.5032189, -1.525838, 2.665791, 0, 0, 0, 1, 1,
0.503955, -0.8303007, 2.778082, 0, 0, 0, 1, 1,
0.504848, 0.1523142, 1.214858, 0, 0, 0, 1, 1,
0.505814, 1.597061, -0.6032124, 1, 1, 1, 1, 1,
0.5074131, -0.7781277, 0.7032137, 1, 1, 1, 1, 1,
0.5114157, 1.609011, -0.2398565, 1, 1, 1, 1, 1,
0.5155383, -0.212594, 4.286956, 1, 1, 1, 1, 1,
0.5168752, 0.04743259, 1.104416, 1, 1, 1, 1, 1,
0.5208823, 0.7744352, 2.041131, 1, 1, 1, 1, 1,
0.5216504, 0.09560017, 1.172175, 1, 1, 1, 1, 1,
0.5303615, -0.1608092, 0.3655571, 1, 1, 1, 1, 1,
0.530605, 1.357004, -1.019826, 1, 1, 1, 1, 1,
0.5312694, 0.08410097, 1.135513, 1, 1, 1, 1, 1,
0.5324776, 0.7098689, 1.880217, 1, 1, 1, 1, 1,
0.5373797, 0.4423399, 0.8219851, 1, 1, 1, 1, 1,
0.5404692, 0.5717165, 0.7654043, 1, 1, 1, 1, 1,
0.541676, -0.9731522, 1.178057, 1, 1, 1, 1, 1,
0.5438796, 0.1018368, 1.690621, 1, 1, 1, 1, 1,
0.5445184, 1.239054, 1.593984, 0, 0, 1, 1, 1,
0.5458724, -0.06723219, 0.8285859, 1, 0, 0, 1, 1,
0.5478102, 1.200874, 1.016559, 1, 0, 0, 1, 1,
0.5486016, -0.5031424, 3.417161, 1, 0, 0, 1, 1,
0.5517483, 0.5999312, 0.3582105, 1, 0, 0, 1, 1,
0.5539458, 0.07411831, -0.4396696, 1, 0, 0, 1, 1,
0.554115, -0.8933603, 3.343116, 0, 0, 0, 1, 1,
0.5542603, -0.1601351, 2.262418, 0, 0, 0, 1, 1,
0.5555866, 3.206096, -1.168415, 0, 0, 0, 1, 1,
0.5653039, -0.1717668, 1.832984, 0, 0, 0, 1, 1,
0.5686712, -1.704474, 2.492293, 0, 0, 0, 1, 1,
0.5693361, -0.2463243, 1.50916, 0, 0, 0, 1, 1,
0.5701661, 0.009344354, 1.161916, 0, 0, 0, 1, 1,
0.572282, -0.5930303, 2.410605, 1, 1, 1, 1, 1,
0.5773849, -0.3667778, 2.728985, 1, 1, 1, 1, 1,
0.5775638, -0.2615364, 2.766541, 1, 1, 1, 1, 1,
0.5829396, 0.2941852, 1.147093, 1, 1, 1, 1, 1,
0.5842426, 0.8966635, 0.7404004, 1, 1, 1, 1, 1,
0.5862954, -0.2765004, 2.154814, 1, 1, 1, 1, 1,
0.5888697, 0.7439674, 1.114015, 1, 1, 1, 1, 1,
0.5903205, -0.3750605, 2.372782, 1, 1, 1, 1, 1,
0.5982184, -1.977709, 2.915127, 1, 1, 1, 1, 1,
0.5983592, -0.4906412, 1.588464, 1, 1, 1, 1, 1,
0.6003349, 1.490923, 0.2405236, 1, 1, 1, 1, 1,
0.6019681, -0.2480168, 2.441608, 1, 1, 1, 1, 1,
0.6050237, -0.5449935, 0.8816202, 1, 1, 1, 1, 1,
0.6103656, -0.4036282, 0.9754612, 1, 1, 1, 1, 1,
0.6109291, -1.502231, 2.82418, 1, 1, 1, 1, 1,
0.6138121, 0.891873, -0.3622512, 0, 0, 1, 1, 1,
0.6242362, 0.8104463, 1.762754, 1, 0, 0, 1, 1,
0.6281035, 0.533601, 0.6433365, 1, 0, 0, 1, 1,
0.6291054, -0.474903, 3.620055, 1, 0, 0, 1, 1,
0.6332524, -0.9355887, 1.732211, 1, 0, 0, 1, 1,
0.6342179, -0.01233276, 0.112014, 1, 0, 0, 1, 1,
0.6358152, 0.7115569, 0.9053004, 0, 0, 0, 1, 1,
0.6450879, -0.04123349, 2.307759, 0, 0, 0, 1, 1,
0.6456425, -1.726057, 2.365151, 0, 0, 0, 1, 1,
0.6506084, -0.4076458, 1.007197, 0, 0, 0, 1, 1,
0.653945, -0.2791389, 1.045841, 0, 0, 0, 1, 1,
0.6544299, -0.3134647, 1.602146, 0, 0, 0, 1, 1,
0.663389, -0.4698378, 2.022979, 0, 0, 0, 1, 1,
0.6635147, 0.6087654, 0.1880976, 1, 1, 1, 1, 1,
0.6640099, 0.2553543, -1.52317, 1, 1, 1, 1, 1,
0.6707249, 0.2399074, 0.1715079, 1, 1, 1, 1, 1,
0.6713439, 0.464966, 0.5111644, 1, 1, 1, 1, 1,
0.676953, 0.5343457, 1.756018, 1, 1, 1, 1, 1,
0.677531, 0.7662058, -0.2623656, 1, 1, 1, 1, 1,
0.6777641, -1.048822, 1.758804, 1, 1, 1, 1, 1,
0.6781541, 0.5673646, 1.038593, 1, 1, 1, 1, 1,
0.6793602, 0.9618736, 1.624667, 1, 1, 1, 1, 1,
0.6810294, 0.08880354, 1.433236, 1, 1, 1, 1, 1,
0.6871666, 0.3272425, 0.7518854, 1, 1, 1, 1, 1,
0.6887287, 0.4791218, 0.4089585, 1, 1, 1, 1, 1,
0.6917999, 0.6778925, 2.680797, 1, 1, 1, 1, 1,
0.6933435, 2.184768, -0.8382847, 1, 1, 1, 1, 1,
0.6972527, 0.2880939, 0.9344002, 1, 1, 1, 1, 1,
0.699459, 0.469632, 1.540244, 0, 0, 1, 1, 1,
0.6996898, -0.6540105, 1.653491, 1, 0, 0, 1, 1,
0.6999796, -0.02005949, 1.890811, 1, 0, 0, 1, 1,
0.7051549, -1.564237, 3.914077, 1, 0, 0, 1, 1,
0.7140942, -2.338417, 5.016901, 1, 0, 0, 1, 1,
0.727109, -0.05224821, 2.042568, 1, 0, 0, 1, 1,
0.7327735, 0.03162354, 1.394248, 0, 0, 0, 1, 1,
0.7357914, 2.344015, 1.742815, 0, 0, 0, 1, 1,
0.7505527, -0.1358348, 3.624734, 0, 0, 0, 1, 1,
0.7525324, 2.090997, 1.409569, 0, 0, 0, 1, 1,
0.7526895, 0.1124157, 2.703851, 0, 0, 0, 1, 1,
0.7532206, -0.8622062, 3.942332, 0, 0, 0, 1, 1,
0.7573521, 0.460752, 3.051783, 0, 0, 0, 1, 1,
0.7575585, 0.9566457, 0.07341637, 1, 1, 1, 1, 1,
0.760546, 1.89527, 3.847532, 1, 1, 1, 1, 1,
0.7655675, 0.7307141, 2.38354, 1, 1, 1, 1, 1,
0.7699304, 0.3114371, 0.7603617, 1, 1, 1, 1, 1,
0.7705599, -0.4699486, 1.647306, 1, 1, 1, 1, 1,
0.7751892, -0.309015, 2.301502, 1, 1, 1, 1, 1,
0.7828194, 0.9898837, 2.970198, 1, 1, 1, 1, 1,
0.7848655, 0.9036312, -0.3129242, 1, 1, 1, 1, 1,
0.7880519, -0.1159418, 2.786276, 1, 1, 1, 1, 1,
0.788525, 1.490138, 1.787889, 1, 1, 1, 1, 1,
0.7894126, -0.03209943, 1.406714, 1, 1, 1, 1, 1,
0.7903796, 1.22011, 0.3348788, 1, 1, 1, 1, 1,
0.7905137, 1.433625, -0.6726992, 1, 1, 1, 1, 1,
0.7964075, 1.271003, 2.052466, 1, 1, 1, 1, 1,
0.8000961, 0.6445524, -0.4770093, 1, 1, 1, 1, 1,
0.8053007, 1.602817, -0.2886245, 0, 0, 1, 1, 1,
0.8083636, 1.37034, 1.26747, 1, 0, 0, 1, 1,
0.8092499, -0.1798522, 1.061884, 1, 0, 0, 1, 1,
0.8141947, -1.310907, 2.087341, 1, 0, 0, 1, 1,
0.8169411, -0.8403869, 2.203959, 1, 0, 0, 1, 1,
0.8189317, 1.489637, -1.794789, 1, 0, 0, 1, 1,
0.8199924, -0.4915582, 2.849029, 0, 0, 0, 1, 1,
0.8227213, 0.1206962, 0.5625576, 0, 0, 0, 1, 1,
0.8236647, -0.8997085, 2.373475, 0, 0, 0, 1, 1,
0.8253917, -0.1282191, 2.082492, 0, 0, 0, 1, 1,
0.8258705, -2.334203, 4.065537, 0, 0, 0, 1, 1,
0.8281684, 1.505787, 1.364908, 0, 0, 0, 1, 1,
0.8284925, -1.132284, 2.272302, 0, 0, 0, 1, 1,
0.8332598, 0.3124322, -0.163194, 1, 1, 1, 1, 1,
0.8362132, 1.86851, 0.7462358, 1, 1, 1, 1, 1,
0.8407755, -0.4366016, 2.213556, 1, 1, 1, 1, 1,
0.8427485, -1.222733, 3.582103, 1, 1, 1, 1, 1,
0.8431875, -0.3908446, 0.7924193, 1, 1, 1, 1, 1,
0.8445953, -0.8905303, 2.158889, 1, 1, 1, 1, 1,
0.8538136, -1.247946, 3.152842, 1, 1, 1, 1, 1,
0.8563994, 0.4542627, 2.341954, 1, 1, 1, 1, 1,
0.8597237, 1.060459, 1.874245, 1, 1, 1, 1, 1,
0.8634831, -0.3698016, 3.879664, 1, 1, 1, 1, 1,
0.8645539, 1.570996, 0.9423875, 1, 1, 1, 1, 1,
0.8733979, 0.1737336, 0.02855629, 1, 1, 1, 1, 1,
0.8773482, 0.07317682, 0.4817674, 1, 1, 1, 1, 1,
0.8814005, -1.460217, 3.04698, 1, 1, 1, 1, 1,
0.9003177, -1.198098, 2.85993, 1, 1, 1, 1, 1,
0.9024313, 0.3132619, 0.7158528, 0, 0, 1, 1, 1,
0.905937, -1.649441, 1.124533, 1, 0, 0, 1, 1,
0.9107575, 0.8157104, -0.7298242, 1, 0, 0, 1, 1,
0.915079, -0.8160471, 2.025054, 1, 0, 0, 1, 1,
0.9158738, 1.19185, 1.087167, 1, 0, 0, 1, 1,
0.9257372, -2.388531, 4.16455, 1, 0, 0, 1, 1,
0.9257689, 0.2886017, 2.130443, 0, 0, 0, 1, 1,
0.930242, 0.1456008, -0.1959897, 0, 0, 0, 1, 1,
0.9310226, 3.255811, -0.7691669, 0, 0, 0, 1, 1,
0.931784, 0.1970602, 1.447565, 0, 0, 0, 1, 1,
0.9346488, -1.085412, 3.033163, 0, 0, 0, 1, 1,
0.941879, -1.133111, 4.079962, 0, 0, 0, 1, 1,
0.9432657, 0.9106038, 0.5605392, 0, 0, 0, 1, 1,
0.9450085, 0.253306, 0.381954, 1, 1, 1, 1, 1,
0.951764, -0.009987341, 2.704464, 1, 1, 1, 1, 1,
0.9553812, -2.158855, 3.456346, 1, 1, 1, 1, 1,
0.9583513, 1.813512, 1.414624, 1, 1, 1, 1, 1,
0.9585675, -0.1829369, 2.064691, 1, 1, 1, 1, 1,
0.9589973, -0.4413687, 1.429004, 1, 1, 1, 1, 1,
0.9593428, 1.007204, 0.8325312, 1, 1, 1, 1, 1,
0.9797226, 0.9169465, 1.41527, 1, 1, 1, 1, 1,
0.9880726, 0.1942742, 0.149667, 1, 1, 1, 1, 1,
0.9881149, 2.102932, 0.5035611, 1, 1, 1, 1, 1,
0.9953367, 1.369723, -1.368394, 1, 1, 1, 1, 1,
0.9958271, -0.4528292, 2.785962, 1, 1, 1, 1, 1,
1.00325, -2.046563, 2.365289, 1, 1, 1, 1, 1,
1.006172, -0.6639875, 2.418966, 1, 1, 1, 1, 1,
1.008603, -0.7582759, 3.032451, 1, 1, 1, 1, 1,
1.01835, -0.3700092, 2.344722, 0, 0, 1, 1, 1,
1.019866, 0.2468903, 3.661046, 1, 0, 0, 1, 1,
1.022911, -0.7815391, 1.639776, 1, 0, 0, 1, 1,
1.024114, 1.571991, 0.20004, 1, 0, 0, 1, 1,
1.026393, -0.5608365, -1.347443, 1, 0, 0, 1, 1,
1.029945, -0.4740979, 1.554127, 1, 0, 0, 1, 1,
1.041523, -0.1417617, 1.923981, 0, 0, 0, 1, 1,
1.050376, -0.6769651, 2.764153, 0, 0, 0, 1, 1,
1.056613, -0.7202444, 1.446945, 0, 0, 0, 1, 1,
1.061248, 0.9857231, 1.745796, 0, 0, 0, 1, 1,
1.069308, 0.8079242, 1.208658, 0, 0, 0, 1, 1,
1.080878, 1.425908, 1.971901, 0, 0, 0, 1, 1,
1.084891, 0.1156681, 0.5366268, 0, 0, 0, 1, 1,
1.099843, 1.764431, -0.6250457, 1, 1, 1, 1, 1,
1.100277, -0.2991467, 1.511423, 1, 1, 1, 1, 1,
1.107986, -0.02936938, 1.651323, 1, 1, 1, 1, 1,
1.108132, -0.6910704, 2.007138, 1, 1, 1, 1, 1,
1.109555, 0.3092986, 1.708656, 1, 1, 1, 1, 1,
1.113948, -0.9829478, 1.101595, 1, 1, 1, 1, 1,
1.114207, -0.7556396, 2.613862, 1, 1, 1, 1, 1,
1.114549, 1.322362, 1.073456, 1, 1, 1, 1, 1,
1.124281, 0.6220726, 2.347463, 1, 1, 1, 1, 1,
1.126469, 0.3956149, 1.422586, 1, 1, 1, 1, 1,
1.130323, 0.8149174, 1.703612, 1, 1, 1, 1, 1,
1.135738, -0.04679094, 1.296581, 1, 1, 1, 1, 1,
1.138696, 1.022634, 1.687762, 1, 1, 1, 1, 1,
1.143937, -0.3009458, 1.5324, 1, 1, 1, 1, 1,
1.147478, 1.480339, 0.9720054, 1, 1, 1, 1, 1,
1.151292, 1.988123, 0.03268932, 0, 0, 1, 1, 1,
1.153236, -0.7866897, 0.7259927, 1, 0, 0, 1, 1,
1.153854, -0.1494267, 1.617603, 1, 0, 0, 1, 1,
1.158988, -1.966405, 2.074796, 1, 0, 0, 1, 1,
1.159938, -1.211099, 3.913856, 1, 0, 0, 1, 1,
1.162904, 0.8023188, 1.574757, 1, 0, 0, 1, 1,
1.16863, -0.4325994, 2.847537, 0, 0, 0, 1, 1,
1.171489, 0.04950098, 0.3314795, 0, 0, 0, 1, 1,
1.174821, 0.1432581, 2.30813, 0, 0, 0, 1, 1,
1.180884, -2.249798, 3.809676, 0, 0, 0, 1, 1,
1.187194, -0.6597002, 0.9912121, 0, 0, 0, 1, 1,
1.194451, 2.189464, 0.2573394, 0, 0, 0, 1, 1,
1.203911, 1.365369, 1.074622, 0, 0, 0, 1, 1,
1.206119, 0.184885, 0.02841356, 1, 1, 1, 1, 1,
1.211644, -0.9197274, 2.830304, 1, 1, 1, 1, 1,
1.216457, 3.183805, -0.824628, 1, 1, 1, 1, 1,
1.219093, -1.939815, 3.855268, 1, 1, 1, 1, 1,
1.220129, 0.5142984, -0.930057, 1, 1, 1, 1, 1,
1.220229, 0.9322274, 0.8466612, 1, 1, 1, 1, 1,
1.22422, -0.8181201, 1.884968, 1, 1, 1, 1, 1,
1.233239, -0.8834221, 1.438299, 1, 1, 1, 1, 1,
1.234205, 0.4999429, 2.482542, 1, 1, 1, 1, 1,
1.237262, -0.7943343, -0.137324, 1, 1, 1, 1, 1,
1.246905, -0.9609663, 2.530807, 1, 1, 1, 1, 1,
1.249349, 0.3113684, 2.933131, 1, 1, 1, 1, 1,
1.252289, 0.4048184, 1.488534, 1, 1, 1, 1, 1,
1.253654, 0.7342504, 4.025792, 1, 1, 1, 1, 1,
1.257327, 1.173734, 1.201173, 1, 1, 1, 1, 1,
1.258549, 0.9901026, 1.403902, 0, 0, 1, 1, 1,
1.274088, -0.2404997, 0.7416816, 1, 0, 0, 1, 1,
1.274165, -0.8182816, 3.716165, 1, 0, 0, 1, 1,
1.275267, 0.9208512, 1.174306, 1, 0, 0, 1, 1,
1.27588, -0.6615707, 1.706028, 1, 0, 0, 1, 1,
1.285419, -0.7434657, 3.024289, 1, 0, 0, 1, 1,
1.287849, -0.2742206, 1.005441, 0, 0, 0, 1, 1,
1.305481, -0.4466495, 1.085572, 0, 0, 0, 1, 1,
1.307967, -0.8310286, 0.7342774, 0, 0, 0, 1, 1,
1.316694, -2.267388, 2.031062, 0, 0, 0, 1, 1,
1.316779, -1.738365, 2.101371, 0, 0, 0, 1, 1,
1.317929, 1.093271, 1.832093, 0, 0, 0, 1, 1,
1.329045, -0.419153, -0.2279733, 0, 0, 0, 1, 1,
1.335551, -0.5301425, 2.132432, 1, 1, 1, 1, 1,
1.338555, -0.282763, 2.031579, 1, 1, 1, 1, 1,
1.355004, -0.8469754, 1.402334, 1, 1, 1, 1, 1,
1.357843, 0.04889541, 1.820956, 1, 1, 1, 1, 1,
1.359127, -0.4135161, 1.20234, 1, 1, 1, 1, 1,
1.364356, -1.874584, 1.405299, 1, 1, 1, 1, 1,
1.368151, -1.176374, 1.242537, 1, 1, 1, 1, 1,
1.380566, -0.813444, 3.250803, 1, 1, 1, 1, 1,
1.394573, 1.044432, -0.1529266, 1, 1, 1, 1, 1,
1.415366, 1.527612, -0.3430673, 1, 1, 1, 1, 1,
1.429725, 1.035875, 1.343322, 1, 1, 1, 1, 1,
1.434569, 0.2966612, 3.361329, 1, 1, 1, 1, 1,
1.46354, -0.21448, 0.9908755, 1, 1, 1, 1, 1,
1.46358, -0.3699951, 1.126472, 1, 1, 1, 1, 1,
1.493428, -0.4890985, 2.676023, 1, 1, 1, 1, 1,
1.495309, -1.653944, 2.965901, 0, 0, 1, 1, 1,
1.504719, -0.7360535, 3.096512, 1, 0, 0, 1, 1,
1.505307, -1.604556, 3.118939, 1, 0, 0, 1, 1,
1.515631, 0.4359394, 1.425081, 1, 0, 0, 1, 1,
1.516475, -0.671574, 1.873081, 1, 0, 0, 1, 1,
1.520338, -0.1194024, 1.296172, 1, 0, 0, 1, 1,
1.535232, -1.706261, 1.957688, 0, 0, 0, 1, 1,
1.542502, 0.7051716, 2.485247, 0, 0, 0, 1, 1,
1.542599, 1.090783, -0.04865651, 0, 0, 0, 1, 1,
1.546293, 1.503256, 0.6411633, 0, 0, 0, 1, 1,
1.550605, -0.3390359, 1.459394, 0, 0, 0, 1, 1,
1.560374, -1.125959, 0.7153109, 0, 0, 0, 1, 1,
1.564947, 0.6821132, 0.9939012, 0, 0, 0, 1, 1,
1.570531, 1.59315, 2.909201, 1, 1, 1, 1, 1,
1.578988, -0.9026393, 1.059651, 1, 1, 1, 1, 1,
1.579864, 0.03061499, -0.6280945, 1, 1, 1, 1, 1,
1.585328, 0.06156715, 0.9183235, 1, 1, 1, 1, 1,
1.588247, 0.7441662, 1.47584, 1, 1, 1, 1, 1,
1.59473, 0.4213181, 0.697424, 1, 1, 1, 1, 1,
1.600674, 1.437169, -0.1634349, 1, 1, 1, 1, 1,
1.601054, -0.1342189, 1.618025, 1, 1, 1, 1, 1,
1.608105, 0.1221047, 2.475456, 1, 1, 1, 1, 1,
1.611925, 1.646826, -1.021832, 1, 1, 1, 1, 1,
1.621626, 1.615244, 0.5108344, 1, 1, 1, 1, 1,
1.62181, 1.016799, 0.9189902, 1, 1, 1, 1, 1,
1.625433, 1.661294, 0.2157445, 1, 1, 1, 1, 1,
1.65286, -0.5629232, 1.847006, 1, 1, 1, 1, 1,
1.661215, 1.201584, 0.2816412, 1, 1, 1, 1, 1,
1.681311, -2.187059, 2.313543, 0, 0, 1, 1, 1,
1.684285, -0.9132612, 1.472184, 1, 0, 0, 1, 1,
1.693465, -1.091047, 2.266798, 1, 0, 0, 1, 1,
1.696836, 0.7194026, 0.3703274, 1, 0, 0, 1, 1,
1.708537, -0.3963919, 1.719263, 1, 0, 0, 1, 1,
1.721822, -0.006111482, 0.2761333, 1, 0, 0, 1, 1,
1.727277, -1.782896, 2.101321, 0, 0, 0, 1, 1,
1.734905, -0.3064485, 1.83741, 0, 0, 0, 1, 1,
1.73613, -1.240057, 3.400949, 0, 0, 0, 1, 1,
1.740112, 0.4414949, 2.482663, 0, 0, 0, 1, 1,
1.767189, 2.079677, 0.4295736, 0, 0, 0, 1, 1,
1.783042, -0.5988097, 1.495922, 0, 0, 0, 1, 1,
1.816636, -0.692799, 1.694098, 0, 0, 0, 1, 1,
1.844556, -0.1322872, 3.37339, 1, 1, 1, 1, 1,
1.854556, 0.942721, 1.843702, 1, 1, 1, 1, 1,
1.870563, -1.413206, 1.50443, 1, 1, 1, 1, 1,
1.87276, -1.044632, 1.657139, 1, 1, 1, 1, 1,
1.88095, 0.91909, 2.187656, 1, 1, 1, 1, 1,
1.907884, -0.3123581, 1.852418, 1, 1, 1, 1, 1,
1.924848, -0.6142212, 2.693309, 1, 1, 1, 1, 1,
1.927233, -0.04797828, 2.543764, 1, 1, 1, 1, 1,
1.937756, -1.14959, 4.157146, 1, 1, 1, 1, 1,
1.950225, -2.116119, 3.550523, 1, 1, 1, 1, 1,
1.952401, 1.350893, -0.9463121, 1, 1, 1, 1, 1,
1.982682, -0.810346, 3.764307, 1, 1, 1, 1, 1,
1.982997, -1.359494, 2.730598, 1, 1, 1, 1, 1,
2.013615, 0.3000132, 1.842087, 1, 1, 1, 1, 1,
2.017672, 0.4722035, 1.548705, 1, 1, 1, 1, 1,
2.021761, 0.1815488, 2.862739, 0, 0, 1, 1, 1,
2.031698, -0.1187752, 0.7588702, 1, 0, 0, 1, 1,
2.034488, 2.179043, -0.1045479, 1, 0, 0, 1, 1,
2.045778, 0.549965, 0.9562665, 1, 0, 0, 1, 1,
2.052373, -1.590201, 1.465751, 1, 0, 0, 1, 1,
2.05392, 0.9718799, 2.191919, 1, 0, 0, 1, 1,
2.056813, 0.3682189, 1.302284, 0, 0, 0, 1, 1,
2.101091, 1.07002, 1.093491, 0, 0, 0, 1, 1,
2.117671, 0.488969, 1.990349, 0, 0, 0, 1, 1,
2.1243, 1.044229, 1.001831, 0, 0, 0, 1, 1,
2.161126, -2.052727, 3.793015, 0, 0, 0, 1, 1,
2.213888, -0.05449234, 2.09192, 0, 0, 0, 1, 1,
2.295311, -0.7680168, 4.30236, 0, 0, 0, 1, 1,
2.392048, -0.7167854, 0.7886668, 1, 1, 1, 1, 1,
2.412329, 0.5093877, 1.496573, 1, 1, 1, 1, 1,
2.473189, -0.4790189, 0.544363, 1, 1, 1, 1, 1,
2.512033, 0.6029827, 1.343696, 1, 1, 1, 1, 1,
2.653849, -0.5965989, 3.929062, 1, 1, 1, 1, 1,
2.70335, -0.4924684, 1.256969, 1, 1, 1, 1, 1,
2.82217, -0.9804649, 0.9049029, 1, 1, 1, 1, 1
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
var radius = 9.287474;
var distance = 32.62186;
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
mvMatrix.translate( 0.1479475, -0.3425263, 0.1860898 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.62186);
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