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
-3.546834, 0.2323287, -0.7442148, 1, 0, 0, 1,
-3.455723, 0.110049, -1.121592, 1, 0.007843138, 0, 1,
-3.404184, -0.5583943, -1.089695, 1, 0.01176471, 0, 1,
-2.848648, 0.6062849, -0.824405, 1, 0.01960784, 0, 1,
-2.764543, -0.2426784, 0.1038398, 1, 0.02352941, 0, 1,
-2.72128, 0.7746464, 0.03681899, 1, 0.03137255, 0, 1,
-2.608289, -0.189141, -3.013182, 1, 0.03529412, 0, 1,
-2.578019, 0.02857152, -2.728217, 1, 0.04313726, 0, 1,
-2.470724, 0.5277818, -1.597609, 1, 0.04705882, 0, 1,
-2.450146, 1.152774, -0.4753971, 1, 0.05490196, 0, 1,
-2.323598, -0.1115798, -1.733063, 1, 0.05882353, 0, 1,
-2.250636, 1.466781, 0.2473875, 1, 0.06666667, 0, 1,
-2.201251, -1.176693, -2.122666, 1, 0.07058824, 0, 1,
-2.197133, 1.080324, -1.895074, 1, 0.07843138, 0, 1,
-2.175331, 0.1907489, -0.02086138, 1, 0.08235294, 0, 1,
-2.165409, -1.16195, -1.08488, 1, 0.09019608, 0, 1,
-2.152832, -0.5107512, -3.239829, 1, 0.09411765, 0, 1,
-2.107666, 0.1362226, -2.349932, 1, 0.1019608, 0, 1,
-2.104435, 0.07315449, 0.2551702, 1, 0.1098039, 0, 1,
-2.103415, -1.130304, -1.3127, 1, 0.1137255, 0, 1,
-2.100405, -0.3286212, -2.175354, 1, 0.1215686, 0, 1,
-2.098942, 0.8209581, -2.566021, 1, 0.1254902, 0, 1,
-2.048478, -1.107012, -3.053559, 1, 0.1333333, 0, 1,
-2.023618, 1.104148, -2.04688, 1, 0.1372549, 0, 1,
-1.98925, 1.320997, -1.525608, 1, 0.145098, 0, 1,
-1.983672, 1.213081, -2.24465, 1, 0.1490196, 0, 1,
-1.960379, 0.9334602, -1.47813, 1, 0.1568628, 0, 1,
-1.930229, -0.04884021, -0.9280325, 1, 0.1607843, 0, 1,
-1.906091, 0.2606297, -1.343717, 1, 0.1686275, 0, 1,
-1.891806, -0.3139635, -1.63019, 1, 0.172549, 0, 1,
-1.874307, 1.096927, -1.167837, 1, 0.1803922, 0, 1,
-1.86236, -0.5316183, -0.7646664, 1, 0.1843137, 0, 1,
-1.849513, -0.303305, -1.097577, 1, 0.1921569, 0, 1,
-1.826448, -1.062565, -2.140508, 1, 0.1960784, 0, 1,
-1.800803, 0.317102, -3.536205, 1, 0.2039216, 0, 1,
-1.796726, 0.2218522, -3.251347, 1, 0.2117647, 0, 1,
-1.791503, -1.026955, -1.889038, 1, 0.2156863, 0, 1,
-1.784114, 0.07370277, -0.180098, 1, 0.2235294, 0, 1,
-1.781093, -0.3804857, -0.7189755, 1, 0.227451, 0, 1,
-1.776927, 0.2977375, -1.458936, 1, 0.2352941, 0, 1,
-1.770897, -0.2159407, -3.095664, 1, 0.2392157, 0, 1,
-1.741396, 0.2304738, -2.074851, 1, 0.2470588, 0, 1,
-1.714534, -1.212555, -2.817669, 1, 0.2509804, 0, 1,
-1.690586, 0.4206536, -1.09465, 1, 0.2588235, 0, 1,
-1.679952, -0.2735771, -1.840904, 1, 0.2627451, 0, 1,
-1.670652, 0.3173626, -1.56271, 1, 0.2705882, 0, 1,
-1.665004, -0.2495346, -2.254036, 1, 0.2745098, 0, 1,
-1.663917, -0.4433907, -0.2186253, 1, 0.282353, 0, 1,
-1.658089, 0.7221332, -0.6686419, 1, 0.2862745, 0, 1,
-1.645433, -2.406973, -1.520703, 1, 0.2941177, 0, 1,
-1.636392, -0.364237, -1.740562, 1, 0.3019608, 0, 1,
-1.634656, 0.2395803, -1.811797, 1, 0.3058824, 0, 1,
-1.633172, 0.08112227, -0.3191803, 1, 0.3137255, 0, 1,
-1.631912, 0.579691, -2.703045, 1, 0.3176471, 0, 1,
-1.631757, 0.763509, -0.6353555, 1, 0.3254902, 0, 1,
-1.603525, 1.530453, -1.86604, 1, 0.3294118, 0, 1,
-1.598774, 0.3387648, -1.01667, 1, 0.3372549, 0, 1,
-1.589497, 1.110142, 0.7883691, 1, 0.3411765, 0, 1,
-1.582577, -0.9601317, -1.80709, 1, 0.3490196, 0, 1,
-1.57085, -0.08717703, -2.00764, 1, 0.3529412, 0, 1,
-1.570566, -0.6341927, -1.617639, 1, 0.3607843, 0, 1,
-1.562751, -0.06213597, -1.654337, 1, 0.3647059, 0, 1,
-1.558182, 1.785682, -1.154393, 1, 0.372549, 0, 1,
-1.556407, -3.002763, -1.675535, 1, 0.3764706, 0, 1,
-1.549782, 0.4444278, -0.6488439, 1, 0.3843137, 0, 1,
-1.549332, -0.6574203, -1.732654, 1, 0.3882353, 0, 1,
-1.536523, 0.1047162, -0.5633416, 1, 0.3960784, 0, 1,
-1.52162, -2.129533, -2.42304, 1, 0.4039216, 0, 1,
-1.517403, -0.6058881, -2.717199, 1, 0.4078431, 0, 1,
-1.512838, -0.2155764, -1.494326, 1, 0.4156863, 0, 1,
-1.505682, 0.8940154, -2.173495, 1, 0.4196078, 0, 1,
-1.502821, -0.03363575, -2.115879, 1, 0.427451, 0, 1,
-1.495739, 1.657018, -1.039374, 1, 0.4313726, 0, 1,
-1.486974, -0.4497827, 0.8265857, 1, 0.4392157, 0, 1,
-1.464415, 0.7427981, -0.2062364, 1, 0.4431373, 0, 1,
-1.457965, -1.591665, -3.278356, 1, 0.4509804, 0, 1,
-1.450263, 0.6593446, -2.955997, 1, 0.454902, 0, 1,
-1.447138, -1.395529, -2.383542, 1, 0.4627451, 0, 1,
-1.441819, -0.2756999, -1.765106, 1, 0.4666667, 0, 1,
-1.439893, 0.9579673, -1.858599, 1, 0.4745098, 0, 1,
-1.434998, -0.1484629, -1.308143, 1, 0.4784314, 0, 1,
-1.432634, 0.1997259, -1.79186, 1, 0.4862745, 0, 1,
-1.432575, 1.059705, -3.333422, 1, 0.4901961, 0, 1,
-1.426521, 0.1659387, -3.146571, 1, 0.4980392, 0, 1,
-1.413551, -0.9289302, -2.007365, 1, 0.5058824, 0, 1,
-1.406945, -0.7653837, -1.533629, 1, 0.509804, 0, 1,
-1.400175, -0.2394782, -0.2277684, 1, 0.5176471, 0, 1,
-1.398906, 0.8750553, -1.666473, 1, 0.5215687, 0, 1,
-1.370429, 0.1464537, 0.6473321, 1, 0.5294118, 0, 1,
-1.364327, -0.2948053, -2.230959, 1, 0.5333334, 0, 1,
-1.359817, 0.09193171, -0.2862508, 1, 0.5411765, 0, 1,
-1.352745, -0.1150706, -3.009656, 1, 0.5450981, 0, 1,
-1.352612, 0.7656561, -2.101095, 1, 0.5529412, 0, 1,
-1.345626, -0.662514, -1.599731, 1, 0.5568628, 0, 1,
-1.331029, -0.07003883, -2.847368, 1, 0.5647059, 0, 1,
-1.330247, -0.3367799, -1.357632, 1, 0.5686275, 0, 1,
-1.324009, -0.1931895, 0.1070313, 1, 0.5764706, 0, 1,
-1.307451, -0.9112949, -2.869579, 1, 0.5803922, 0, 1,
-1.304083, 1.810209, -1.690042, 1, 0.5882353, 0, 1,
-1.302178, 0.5988121, -2.010803, 1, 0.5921569, 0, 1,
-1.285751, -0.5745246, -2.755046, 1, 0.6, 0, 1,
-1.280321, 0.3191583, -1.634313, 1, 0.6078432, 0, 1,
-1.264207, -2.210668, -0.7976521, 1, 0.6117647, 0, 1,
-1.26299, 0.5823094, -0.6087687, 1, 0.6196079, 0, 1,
-1.256063, 0.05350188, -1.210942, 1, 0.6235294, 0, 1,
-1.254524, 0.4097295, -2.28932, 1, 0.6313726, 0, 1,
-1.234938, 1.244419, -0.5450321, 1, 0.6352941, 0, 1,
-1.230743, 0.3221754, -1.169861, 1, 0.6431373, 0, 1,
-1.230097, -1.074602, -1.857326, 1, 0.6470588, 0, 1,
-1.227943, -0.8738391, -2.214567, 1, 0.654902, 0, 1,
-1.226182, 0.4284581, 1.120414, 1, 0.6588235, 0, 1,
-1.2163, -0.7117103, -1.507661, 1, 0.6666667, 0, 1,
-1.202276, -1.490339, -2.677138, 1, 0.6705883, 0, 1,
-1.198511, -0.3820746, -3.340132, 1, 0.6784314, 0, 1,
-1.197415, -0.2087016, -0.8085843, 1, 0.682353, 0, 1,
-1.192722, -0.2337912, -1.865305, 1, 0.6901961, 0, 1,
-1.188524, -0.6736111, -2.881491, 1, 0.6941177, 0, 1,
-1.18769, 0.4775385, -1.381107, 1, 0.7019608, 0, 1,
-1.181123, 0.8403164, -2.321324, 1, 0.7098039, 0, 1,
-1.180349, 0.4362925, -0.02589431, 1, 0.7137255, 0, 1,
-1.177108, -0.2971047, -1.415994, 1, 0.7215686, 0, 1,
-1.167214, 1.701587, -0.8654801, 1, 0.7254902, 0, 1,
-1.162333, -0.2256165, -2.112689, 1, 0.7333333, 0, 1,
-1.161984, 0.5765674, -1.357034, 1, 0.7372549, 0, 1,
-1.16063, -0.6950853, -3.179563, 1, 0.7450981, 0, 1,
-1.154588, -0.7951015, -4.178589, 1, 0.7490196, 0, 1,
-1.134341, -0.2936264, -2.785226, 1, 0.7568628, 0, 1,
-1.1308, -0.487088, -2.358132, 1, 0.7607843, 0, 1,
-1.129583, -1.403003, -2.378127, 1, 0.7686275, 0, 1,
-1.129435, -1.066719, -0.5807439, 1, 0.772549, 0, 1,
-1.115923, -1.339781, -2.88828, 1, 0.7803922, 0, 1,
-1.114891, 0.2736759, -2.10794, 1, 0.7843137, 0, 1,
-1.101778, -0.8563591, -0.5363607, 1, 0.7921569, 0, 1,
-1.100851, 0.06798244, -3.430781, 1, 0.7960784, 0, 1,
-1.098026, -1.033166, -0.6311486, 1, 0.8039216, 0, 1,
-1.081908, 1.107537, -1.056297, 1, 0.8117647, 0, 1,
-1.073966, -0.01071389, -0.07672597, 1, 0.8156863, 0, 1,
-1.065465, -0.2044028, -1.903357, 1, 0.8235294, 0, 1,
-1.060229, 1.138147, -1.282765, 1, 0.827451, 0, 1,
-1.059627, 0.4634762, -2.117014, 1, 0.8352941, 0, 1,
-1.059386, 1.625091, -1.57107, 1, 0.8392157, 0, 1,
-1.058835, 1.363987, 0.6997499, 1, 0.8470588, 0, 1,
-1.058729, 1.066754, 0.1930335, 1, 0.8509804, 0, 1,
-1.048086, 0.1878437, -1.623545, 1, 0.8588235, 0, 1,
-1.046332, 0.1867172, -1.239488, 1, 0.8627451, 0, 1,
-1.043339, 1.570893, -0.05867625, 1, 0.8705882, 0, 1,
-1.042454, -0.5094349, -2.043287, 1, 0.8745098, 0, 1,
-1.038523, -0.366262, -3.184897, 1, 0.8823529, 0, 1,
-1.037555, -1.580201, -0.3455308, 1, 0.8862745, 0, 1,
-1.03204, 0.5527083, -1.732161, 1, 0.8941177, 0, 1,
-1.0285, -0.4034601, -1.859547, 1, 0.8980392, 0, 1,
-1.02717, 0.1686193, -0.3917472, 1, 0.9058824, 0, 1,
-1.025575, 0.222228, 0.08621635, 1, 0.9137255, 0, 1,
-1.022476, -0.2756928, -1.726605, 1, 0.9176471, 0, 1,
-1.019243, -1.532787, -1.653666, 1, 0.9254902, 0, 1,
-1.012006, 0.01041464, -1.975649, 1, 0.9294118, 0, 1,
-1.010585, 0.6186972, -0.9014595, 1, 0.9372549, 0, 1,
-1.010048, 0.2079789, 0.5556406, 1, 0.9411765, 0, 1,
-1.010002, 0.5235371, -0.5515182, 1, 0.9490196, 0, 1,
-1.005788, -1.698347, -2.083428, 1, 0.9529412, 0, 1,
-1.005673, -1.745399, -3.643186, 1, 0.9607843, 0, 1,
-0.9903062, 1.253586, 0.3102179, 1, 0.9647059, 0, 1,
-0.982406, -0.2029546, -0.9955047, 1, 0.972549, 0, 1,
-0.9775018, -0.1965252, -0.9543684, 1, 0.9764706, 0, 1,
-0.9774628, -1.307681, -3.411967, 1, 0.9843137, 0, 1,
-0.9694778, 1.860313, -1.274603, 1, 0.9882353, 0, 1,
-0.9654133, 0.2178651, -2.989793, 1, 0.9960784, 0, 1,
-0.956793, 2.226099, 0.1279707, 0.9960784, 1, 0, 1,
-0.9559165, 0.9508744, -1.980051, 0.9921569, 1, 0, 1,
-0.9541976, -1.001926, -1.802609, 0.9843137, 1, 0, 1,
-0.9501234, 0.6883856, -1.419825, 0.9803922, 1, 0, 1,
-0.9483583, -0.1155222, -3.264096, 0.972549, 1, 0, 1,
-0.9445134, 0.1916625, -1.379877, 0.9686275, 1, 0, 1,
-0.9404667, -0.5266172, -2.437674, 0.9607843, 1, 0, 1,
-0.9388213, -0.3095933, -1.709115, 0.9568627, 1, 0, 1,
-0.9386482, 1.213421, -0.421631, 0.9490196, 1, 0, 1,
-0.9337, 0.5113426, -2.344624, 0.945098, 1, 0, 1,
-0.9314557, 0.9293259, -0.4736138, 0.9372549, 1, 0, 1,
-0.9286916, 0.9844375, -0.3060157, 0.9333333, 1, 0, 1,
-0.9267153, 0.5039029, -1.025633, 0.9254902, 1, 0, 1,
-0.9245111, -1.337245, -1.185197, 0.9215686, 1, 0, 1,
-0.9239616, 1.30627, -1.553032, 0.9137255, 1, 0, 1,
-0.9208069, -0.5260658, -0.8127154, 0.9098039, 1, 0, 1,
-0.909193, -0.4352426, -0.8715534, 0.9019608, 1, 0, 1,
-0.908501, -2.69163, -2.592168, 0.8941177, 1, 0, 1,
-0.9014186, -0.1509859, 0.5923667, 0.8901961, 1, 0, 1,
-0.9010272, 0.2939906, -0.6209779, 0.8823529, 1, 0, 1,
-0.900631, -1.346004, -1.627439, 0.8784314, 1, 0, 1,
-0.898442, 2.0404, -1.909093, 0.8705882, 1, 0, 1,
-0.8980443, -0.01252212, -0.8441479, 0.8666667, 1, 0, 1,
-0.896533, 1.248679, -1.121301, 0.8588235, 1, 0, 1,
-0.8937487, 0.7547607, -2.150533, 0.854902, 1, 0, 1,
-0.8886807, 1.231405, 1.126215, 0.8470588, 1, 0, 1,
-0.886803, -0.1186041, -2.865449, 0.8431373, 1, 0, 1,
-0.8859363, 0.783437, -0.8229952, 0.8352941, 1, 0, 1,
-0.8845441, -0.681673, -1.589479, 0.8313726, 1, 0, 1,
-0.8777769, -1.271283, -1.378244, 0.8235294, 1, 0, 1,
-0.8772694, -0.4186736, -1.490758, 0.8196079, 1, 0, 1,
-0.8628322, 0.02229251, -1.499764, 0.8117647, 1, 0, 1,
-0.8560482, 0.2559843, -0.3156925, 0.8078431, 1, 0, 1,
-0.849344, 0.6812482, 0.2466456, 0.8, 1, 0, 1,
-0.8428183, -1.551044, -3.414041, 0.7921569, 1, 0, 1,
-0.8357415, -1.482612, -4.288819, 0.7882353, 1, 0, 1,
-0.8335167, 1.178646, 0.7007796, 0.7803922, 1, 0, 1,
-0.8332405, -0.4471105, -2.997591, 0.7764706, 1, 0, 1,
-0.8328404, 0.8639538, 0.10898, 0.7686275, 1, 0, 1,
-0.8245911, -1.443647, -1.881718, 0.7647059, 1, 0, 1,
-0.8236573, 1.476848, -0.4113004, 0.7568628, 1, 0, 1,
-0.8205593, -0.3836321, -0.7102563, 0.7529412, 1, 0, 1,
-0.8137876, 0.7079641, -1.146975, 0.7450981, 1, 0, 1,
-0.8078168, 0.4641061, -0.9957992, 0.7411765, 1, 0, 1,
-0.8049876, -0.2405823, -0.6471543, 0.7333333, 1, 0, 1,
-0.8042897, -0.6627069, -2.18602, 0.7294118, 1, 0, 1,
-0.8026531, -0.47907, -1.487882, 0.7215686, 1, 0, 1,
-0.8019522, 0.7051178, -0.2410806, 0.7176471, 1, 0, 1,
-0.7905664, 0.1753074, -1.191958, 0.7098039, 1, 0, 1,
-0.7840511, 0.07028169, -1.191897, 0.7058824, 1, 0, 1,
-0.7818676, -1.344495, -2.933283, 0.6980392, 1, 0, 1,
-0.7801423, -0.2214355, -1.886641, 0.6901961, 1, 0, 1,
-0.7674781, 0.6867664, -1.745857, 0.6862745, 1, 0, 1,
-0.7665468, -2.590033, -3.203409, 0.6784314, 1, 0, 1,
-0.760267, 0.5236009, -2.906911, 0.6745098, 1, 0, 1,
-0.7530131, 1.295856, -0.2670247, 0.6666667, 1, 0, 1,
-0.7452343, -0.2731958, -1.012385, 0.6627451, 1, 0, 1,
-0.7296988, -0.6201307, -3.910203, 0.654902, 1, 0, 1,
-0.7249457, -2.026486, -0.6597846, 0.6509804, 1, 0, 1,
-0.7230687, -0.3153814, -1.855853, 0.6431373, 1, 0, 1,
-0.7220575, 0.5131719, -1.554209, 0.6392157, 1, 0, 1,
-0.7161406, 0.3777924, -1.367783, 0.6313726, 1, 0, 1,
-0.7158945, 1.829681, 0.8729295, 0.627451, 1, 0, 1,
-0.7112367, 1.906085, -0.8311356, 0.6196079, 1, 0, 1,
-0.7087522, 0.9913457, -2.104627, 0.6156863, 1, 0, 1,
-0.7051343, -0.6983994, -0.9724908, 0.6078432, 1, 0, 1,
-0.7039158, -1.245479, -2.899206, 0.6039216, 1, 0, 1,
-0.7022103, 1.326817, 0.6085715, 0.5960785, 1, 0, 1,
-0.7009926, -0.4888147, -2.373881, 0.5882353, 1, 0, 1,
-0.6996953, 0.7223702, 0.2259234, 0.5843138, 1, 0, 1,
-0.6950108, -1.111214, -3.588635, 0.5764706, 1, 0, 1,
-0.6938071, 0.120754, -0.9611183, 0.572549, 1, 0, 1,
-0.6931257, 2.758662, 0.8974773, 0.5647059, 1, 0, 1,
-0.687624, -0.4694538, -0.1753758, 0.5607843, 1, 0, 1,
-0.6864763, 0.5227298, -0.8138769, 0.5529412, 1, 0, 1,
-0.6847397, -2.116976, -4.797245, 0.5490196, 1, 0, 1,
-0.6834946, -0.62087, -2.360529, 0.5411765, 1, 0, 1,
-0.6805842, -0.6134912, -0.5757552, 0.5372549, 1, 0, 1,
-0.6666422, 1.30205, -1.377491, 0.5294118, 1, 0, 1,
-0.6651573, 0.8260046, 0.6183621, 0.5254902, 1, 0, 1,
-0.6650953, -0.07235692, -1.222804, 0.5176471, 1, 0, 1,
-0.6641934, 0.3270776, -1.50081, 0.5137255, 1, 0, 1,
-0.6609231, -0.658664, -0.9300852, 0.5058824, 1, 0, 1,
-0.6558657, 0.8403789, -0.7054125, 0.5019608, 1, 0, 1,
-0.6552408, -0.5250218, -2.989545, 0.4941176, 1, 0, 1,
-0.653965, 1.035301, -1.466192, 0.4862745, 1, 0, 1,
-0.6520401, 0.512042, 0.531646, 0.4823529, 1, 0, 1,
-0.6399162, 0.439208, 0.9012188, 0.4745098, 1, 0, 1,
-0.6395077, 0.0148415, -3.287226, 0.4705882, 1, 0, 1,
-0.6360925, -0.6526455, -1.933956, 0.4627451, 1, 0, 1,
-0.63288, -0.7013227, -1.809376, 0.4588235, 1, 0, 1,
-0.6287889, -0.01149019, -2.198782, 0.4509804, 1, 0, 1,
-0.6244777, -0.1621667, -0.1262677, 0.4470588, 1, 0, 1,
-0.6229776, -0.3649144, -3.018467, 0.4392157, 1, 0, 1,
-0.6143565, -0.6723562, -2.058782, 0.4352941, 1, 0, 1,
-0.6122594, -0.5183268, -2.901608, 0.427451, 1, 0, 1,
-0.607111, -0.9199152, -3.919654, 0.4235294, 1, 0, 1,
-0.6021958, -1.177135, -4.255203, 0.4156863, 1, 0, 1,
-0.6014922, -1.689639, -2.482748, 0.4117647, 1, 0, 1,
-0.5975099, -1.112355, -2.361562, 0.4039216, 1, 0, 1,
-0.5973549, -0.2033424, -1.360258, 0.3960784, 1, 0, 1,
-0.592945, 0.1766168, -0.1804351, 0.3921569, 1, 0, 1,
-0.5917954, 1.087122, -1.151408, 0.3843137, 1, 0, 1,
-0.5861467, 0.8429039, -1.798305, 0.3803922, 1, 0, 1,
-0.5761829, 0.3874952, 0.06378006, 0.372549, 1, 0, 1,
-0.5746214, 0.2283195, 0.1015737, 0.3686275, 1, 0, 1,
-0.5702944, -0.5853231, -3.621846, 0.3607843, 1, 0, 1,
-0.5689474, 1.966616, 1.566797, 0.3568628, 1, 0, 1,
-0.5681484, 0.71759, -1.305303, 0.3490196, 1, 0, 1,
-0.566452, -1.154089, -1.972339, 0.345098, 1, 0, 1,
-0.5622464, -0.2264529, -4.037845, 0.3372549, 1, 0, 1,
-0.5576285, 0.8097951, -1.406451, 0.3333333, 1, 0, 1,
-0.555645, -0.397843, -2.542196, 0.3254902, 1, 0, 1,
-0.5516252, 0.6254414, 0.1683414, 0.3215686, 1, 0, 1,
-0.5496049, -0.8458037, -3.609921, 0.3137255, 1, 0, 1,
-0.5474663, 0.6710427, -0.8523508, 0.3098039, 1, 0, 1,
-0.5466847, -0.8989791, -2.381735, 0.3019608, 1, 0, 1,
-0.5456556, -0.1057998, -1.688408, 0.2941177, 1, 0, 1,
-0.5416535, 0.2493116, -1.070583, 0.2901961, 1, 0, 1,
-0.5411954, -0.1138265, -2.401894, 0.282353, 1, 0, 1,
-0.5401925, -0.6775522, -3.012543, 0.2784314, 1, 0, 1,
-0.5369023, 0.26138, -0.213734, 0.2705882, 1, 0, 1,
-0.5319049, 0.2874511, -1.939567, 0.2666667, 1, 0, 1,
-0.5308108, -0.1792821, -0.8785301, 0.2588235, 1, 0, 1,
-0.5304328, 0.006648516, -2.380304, 0.254902, 1, 0, 1,
-0.5291398, -1.676482, -3.573022, 0.2470588, 1, 0, 1,
-0.5251065, 0.8620908, -0.8643752, 0.2431373, 1, 0, 1,
-0.5191883, -0.2876952, 0.1730173, 0.2352941, 1, 0, 1,
-0.5139567, 2.623672, 0.2793178, 0.2313726, 1, 0, 1,
-0.5139126, -1.830073, -3.05172, 0.2235294, 1, 0, 1,
-0.5135042, -0.2082766, -3.61054, 0.2196078, 1, 0, 1,
-0.5049055, -1.471972, -2.649227, 0.2117647, 1, 0, 1,
-0.5025134, -0.5094061, -0.4699028, 0.2078431, 1, 0, 1,
-0.499777, 0.5170362, -2.516211, 0.2, 1, 0, 1,
-0.4992147, 0.150778, -2.50416, 0.1921569, 1, 0, 1,
-0.4973962, -0.06585083, -2.59465, 0.1882353, 1, 0, 1,
-0.4928796, 0.5530348, -0.06119005, 0.1803922, 1, 0, 1,
-0.4926419, 1.091305, 0.1516287, 0.1764706, 1, 0, 1,
-0.4918063, -1.810389, -3.835118, 0.1686275, 1, 0, 1,
-0.4914393, 0.696961, -0.2220814, 0.1647059, 1, 0, 1,
-0.4910301, 1.139087, 0.3084953, 0.1568628, 1, 0, 1,
-0.4900869, -0.2733786, -0.9295171, 0.1529412, 1, 0, 1,
-0.4867631, -1.123626, -3.012992, 0.145098, 1, 0, 1,
-0.4844646, 1.693889, 0.1363432, 0.1411765, 1, 0, 1,
-0.4837678, -0.8900137, -3.337381, 0.1333333, 1, 0, 1,
-0.4833796, -0.3697016, -1.41168, 0.1294118, 1, 0, 1,
-0.4824822, -1.774845, -5.520149, 0.1215686, 1, 0, 1,
-0.4823503, -1.635926, -3.71946, 0.1176471, 1, 0, 1,
-0.4745085, 0.99492, -0.7944229, 0.1098039, 1, 0, 1,
-0.4728166, -1.850567, -2.920482, 0.1058824, 1, 0, 1,
-0.4706239, 0.1807736, -2.797467, 0.09803922, 1, 0, 1,
-0.470106, 0.4161448, -0.8791903, 0.09019608, 1, 0, 1,
-0.4695076, 1.17531, -0.9904945, 0.08627451, 1, 0, 1,
-0.4657432, 0.05093636, -0.8373547, 0.07843138, 1, 0, 1,
-0.4643315, -0.6921688, -1.989683, 0.07450981, 1, 0, 1,
-0.4643189, -0.2990744, -2.034266, 0.06666667, 1, 0, 1,
-0.4632564, -0.7504127, -4.237888, 0.0627451, 1, 0, 1,
-0.4584261, 1.528282, -1.16112, 0.05490196, 1, 0, 1,
-0.4552616, 1.69493, 0.4953307, 0.05098039, 1, 0, 1,
-0.4513296, 0.1675238, -3.049869, 0.04313726, 1, 0, 1,
-0.4481923, 0.6611189, -0.3992272, 0.03921569, 1, 0, 1,
-0.4451532, 0.2847961, 0.9400991, 0.03137255, 1, 0, 1,
-0.4442205, 0.7711849, 1.021325, 0.02745098, 1, 0, 1,
-0.4423815, 0.5960638, -1.661392, 0.01960784, 1, 0, 1,
-0.4392963, -0.2735866, -2.379886, 0.01568628, 1, 0, 1,
-0.4339128, -0.8951426, -5.371155, 0.007843138, 1, 0, 1,
-0.4300919, -1.454979, -2.355459, 0.003921569, 1, 0, 1,
-0.4298964, 0.02524627, -1.943333, 0, 1, 0.003921569, 1,
-0.4233541, -0.013684, -3.1832, 0, 1, 0.01176471, 1,
-0.4187392, -1.01402, -1.776662, 0, 1, 0.01568628, 1,
-0.4130079, 0.1076518, -2.258872, 0, 1, 0.02352941, 1,
-0.4028537, 1.050396, -1.207616, 0, 1, 0.02745098, 1,
-0.4010358, -1.042063, -2.227501, 0, 1, 0.03529412, 1,
-0.3973465, -0.7236179, -2.808215, 0, 1, 0.03921569, 1,
-0.3973208, -0.1258663, -3.47304, 0, 1, 0.04705882, 1,
-0.3903919, -0.4008692, -2.058618, 0, 1, 0.05098039, 1,
-0.3867757, 0.6987105, -1.291035, 0, 1, 0.05882353, 1,
-0.3856366, -0.5306653, -2.941584, 0, 1, 0.0627451, 1,
-0.380089, -2.189008, -2.145888, 0, 1, 0.07058824, 1,
-0.3788518, 0.0309076, -0.521843, 0, 1, 0.07450981, 1,
-0.3785644, 0.1698981, 0.3143007, 0, 1, 0.08235294, 1,
-0.375118, -0.688922, -2.645523, 0, 1, 0.08627451, 1,
-0.3704204, -1.954557, -3.179507, 0, 1, 0.09411765, 1,
-0.3702135, 1.27826, -0.7435214, 0, 1, 0.1019608, 1,
-0.3698765, -0.8175506, -2.787125, 0, 1, 0.1058824, 1,
-0.365613, 2.134152, -1.35756, 0, 1, 0.1137255, 1,
-0.3631212, -0.4017485, -4.624444, 0, 1, 0.1176471, 1,
-0.3620892, -0.3085412, -2.279226, 0, 1, 0.1254902, 1,
-0.3617079, 0.3627801, -2.130328, 0, 1, 0.1294118, 1,
-0.3610992, 0.451893, -2.606478, 0, 1, 0.1372549, 1,
-0.3609208, -0.1530185, -1.370443, 0, 1, 0.1411765, 1,
-0.3602587, -0.03839884, -1.379285, 0, 1, 0.1490196, 1,
-0.3595245, 0.1059217, -1.99877, 0, 1, 0.1529412, 1,
-0.3588332, 1.560615, -0.7510918, 0, 1, 0.1607843, 1,
-0.3561808, -2.131023, -3.359873, 0, 1, 0.1647059, 1,
-0.3497319, -0.8746065, -2.990219, 0, 1, 0.172549, 1,
-0.3411291, -1.629239, -4.170737, 0, 1, 0.1764706, 1,
-0.3408097, 0.3414519, 0.5590141, 0, 1, 0.1843137, 1,
-0.3368215, -1.052405, -3.073594, 0, 1, 0.1882353, 1,
-0.3339203, 0.1849595, -1.828052, 0, 1, 0.1960784, 1,
-0.3309453, 0.05726902, -1.11227, 0, 1, 0.2039216, 1,
-0.3281495, 1.391484, 1.120169, 0, 1, 0.2078431, 1,
-0.3244456, 0.06241601, -0.1699483, 0, 1, 0.2156863, 1,
-0.3243649, 0.3877082, -1.215906, 0, 1, 0.2196078, 1,
-0.324095, -0.2826295, -2.035876, 0, 1, 0.227451, 1,
-0.3224334, -0.8692024, -0.8311388, 0, 1, 0.2313726, 1,
-0.321961, -0.6622326, -2.984834, 0, 1, 0.2392157, 1,
-0.3204184, -0.9091291, -3.31159, 0, 1, 0.2431373, 1,
-0.309851, -1.339659, -1.580449, 0, 1, 0.2509804, 1,
-0.305668, 1.276756, -1.773899, 0, 1, 0.254902, 1,
-0.3054802, 1.107924, -2.157039, 0, 1, 0.2627451, 1,
-0.3025167, 1.098847, -1.579346, 0, 1, 0.2666667, 1,
-0.3023325, 1.821013, -1.520296, 0, 1, 0.2745098, 1,
-0.2948996, -0.7265287, -3.012043, 0, 1, 0.2784314, 1,
-0.2947273, -1.33595, -2.382532, 0, 1, 0.2862745, 1,
-0.2946048, 0.008157128, -0.5913245, 0, 1, 0.2901961, 1,
-0.2921785, -0.2804347, -2.943285, 0, 1, 0.2980392, 1,
-0.2905604, 0.04157307, -1.674636, 0, 1, 0.3058824, 1,
-0.2874453, 0.6832028, -0.5559022, 0, 1, 0.3098039, 1,
-0.2724498, -0.2308379, -4.34043, 0, 1, 0.3176471, 1,
-0.2701996, -1.666073, -2.396219, 0, 1, 0.3215686, 1,
-0.2687276, 1.253426, -0.5308628, 0, 1, 0.3294118, 1,
-0.2667532, 1.436177, -0.7397115, 0, 1, 0.3333333, 1,
-0.2640122, 0.4552996, -0.5505555, 0, 1, 0.3411765, 1,
-0.2639049, -0.1149202, -0.7658638, 0, 1, 0.345098, 1,
-0.2607809, 0.6116294, -1.090253, 0, 1, 0.3529412, 1,
-0.2600348, -0.9218356, -2.141899, 0, 1, 0.3568628, 1,
-0.2596349, -1.180922, -3.217595, 0, 1, 0.3647059, 1,
-0.2587575, -1.158111, -1.613196, 0, 1, 0.3686275, 1,
-0.2586583, 0.4559037, -0.207264, 0, 1, 0.3764706, 1,
-0.2579084, 0.1229805, -0.6429028, 0, 1, 0.3803922, 1,
-0.2556866, 1.209345, -0.0728924, 0, 1, 0.3882353, 1,
-0.2554912, -0.6886365, -2.155985, 0, 1, 0.3921569, 1,
-0.2554393, -0.5934724, -3.753271, 0, 1, 0.4, 1,
-0.2545185, -0.1208443, -1.147082, 0, 1, 0.4078431, 1,
-0.2540261, 0.6182231, -0.9323639, 0, 1, 0.4117647, 1,
-0.2491129, -0.553733, -2.448725, 0, 1, 0.4196078, 1,
-0.2484162, -0.8020012, -2.280947, 0, 1, 0.4235294, 1,
-0.2454653, 0.4941006, -0.0465236, 0, 1, 0.4313726, 1,
-0.2448253, -0.3678193, -2.668354, 0, 1, 0.4352941, 1,
-0.2446855, 1.219438, -0.6069369, 0, 1, 0.4431373, 1,
-0.2427001, -0.03649777, -1.093903, 0, 1, 0.4470588, 1,
-0.2415728, -0.9714071, -2.912616, 0, 1, 0.454902, 1,
-0.2404616, 0.601029, -1.762921, 0, 1, 0.4588235, 1,
-0.2404131, -2.250641, -5.079691, 0, 1, 0.4666667, 1,
-0.2389879, 0.06828354, -1.562448, 0, 1, 0.4705882, 1,
-0.2377624, 0.851569, -0.7206559, 0, 1, 0.4784314, 1,
-0.2370266, 0.8635598, -0.9338538, 0, 1, 0.4823529, 1,
-0.2310351, 0.5068851, -0.6473554, 0, 1, 0.4901961, 1,
-0.2299708, 0.2556412, -0.5871805, 0, 1, 0.4941176, 1,
-0.2287738, -1.074471, -0.7399145, 0, 1, 0.5019608, 1,
-0.2286955, 1.135119, 0.5394853, 0, 1, 0.509804, 1,
-0.2273211, -1.708386, -3.666315, 0, 1, 0.5137255, 1,
-0.227218, -0.8441542, -1.98619, 0, 1, 0.5215687, 1,
-0.2228241, 0.1105509, -2.041871, 0, 1, 0.5254902, 1,
-0.2175931, -0.5580151, -3.300043, 0, 1, 0.5333334, 1,
-0.2144823, 0.6620302, -1.210753, 0, 1, 0.5372549, 1,
-0.2103994, 0.1690718, -0.6562642, 0, 1, 0.5450981, 1,
-0.205324, 0.01011001, -1.823875, 0, 1, 0.5490196, 1,
-0.2050181, -0.5825675, -3.044662, 0, 1, 0.5568628, 1,
-0.2041404, -0.446528, -0.6250769, 0, 1, 0.5607843, 1,
-0.2007114, -0.3117619, -1.627037, 0, 1, 0.5686275, 1,
-0.1969994, 0.7284928, -0.2668225, 0, 1, 0.572549, 1,
-0.1955572, 1.548449, 0.02894862, 0, 1, 0.5803922, 1,
-0.193414, -0.2244999, 0.993408, 0, 1, 0.5843138, 1,
-0.1878703, 0.5404655, -1.194843, 0, 1, 0.5921569, 1,
-0.1856125, -0.7802604, -1.394053, 0, 1, 0.5960785, 1,
-0.1841589, 0.0739885, -1.966202, 0, 1, 0.6039216, 1,
-0.1833083, -1.131167, -2.445823, 0, 1, 0.6117647, 1,
-0.1816908, 1.503505, 0.1447423, 0, 1, 0.6156863, 1,
-0.1816786, -0.5268351, -2.714991, 0, 1, 0.6235294, 1,
-0.178843, -0.9618221, -3.208653, 0, 1, 0.627451, 1,
-0.1766346, -0.4675888, -2.3334, 0, 1, 0.6352941, 1,
-0.1758589, 1.134974, 0.7702197, 0, 1, 0.6392157, 1,
-0.1757548, 0.4226824, 0.5828875, 0, 1, 0.6470588, 1,
-0.1742368, 0.8398078, -0.7432612, 0, 1, 0.6509804, 1,
-0.1652316, 0.007252207, -2.722062, 0, 1, 0.6588235, 1,
-0.1601551, -0.5480609, -3.081911, 0, 1, 0.6627451, 1,
-0.1593581, 0.2345998, -0.5128092, 0, 1, 0.6705883, 1,
-0.1588177, 1.076739, 1.891968, 0, 1, 0.6745098, 1,
-0.1551898, -0.5799353, -1.968654, 0, 1, 0.682353, 1,
-0.1466233, -0.1575717, -1.277257, 0, 1, 0.6862745, 1,
-0.1402274, 0.1442804, -1.198229, 0, 1, 0.6941177, 1,
-0.1381869, -0.4970388, -4.047896, 0, 1, 0.7019608, 1,
-0.1375594, -0.7464188, -2.221836, 0, 1, 0.7058824, 1,
-0.134171, -0.3021839, -1.986268, 0, 1, 0.7137255, 1,
-0.1339236, 1.422468, 1.084962, 0, 1, 0.7176471, 1,
-0.1323066, 0.4822969, -1.397196, 0, 1, 0.7254902, 1,
-0.1265387, 0.9391721, -0.2216507, 0, 1, 0.7294118, 1,
-0.1243702, 0.1133291, -0.642067, 0, 1, 0.7372549, 1,
-0.1240719, 0.7466198, -0.2702017, 0, 1, 0.7411765, 1,
-0.115938, 1.078113, -0.9047378, 0, 1, 0.7490196, 1,
-0.1118306, -0.8944976, -4.558456, 0, 1, 0.7529412, 1,
-0.1073551, -0.02087627, -0.5504937, 0, 1, 0.7607843, 1,
-0.1071118, 0.402018, -0.1212011, 0, 1, 0.7647059, 1,
-0.1055208, -0.3636548, -1.923543, 0, 1, 0.772549, 1,
-0.1019899, 0.588273, 0.9353012, 0, 1, 0.7764706, 1,
-0.09472117, -1.292692, -3.625841, 0, 1, 0.7843137, 1,
-0.09086148, 1.308526, -0.2402499, 0, 1, 0.7882353, 1,
-0.09066204, -1.259342, -3.338234, 0, 1, 0.7960784, 1,
-0.0874291, 0.3193716, -0.7994859, 0, 1, 0.8039216, 1,
-0.08247636, -1.00151, -3.507793, 0, 1, 0.8078431, 1,
-0.07929359, -0.4460377, -2.711035, 0, 1, 0.8156863, 1,
-0.07382728, -0.09719174, -1.863596, 0, 1, 0.8196079, 1,
-0.07323776, 0.8049611, -1.45066, 0, 1, 0.827451, 1,
-0.07125832, 0.3674508, -0.2870826, 0, 1, 0.8313726, 1,
-0.07032956, 0.4702956, -0.3047598, 0, 1, 0.8392157, 1,
-0.06455969, 0.3609199, -0.2685174, 0, 1, 0.8431373, 1,
-0.06237902, -0.8565647, -3.938, 0, 1, 0.8509804, 1,
-0.06031106, 0.7501488, 0.8696368, 0, 1, 0.854902, 1,
-0.05792313, 1.040932, 0.8253041, 0, 1, 0.8627451, 1,
-0.05429953, 0.3209326, -0.521432, 0, 1, 0.8666667, 1,
-0.05391891, -1.939579, -4.441863, 0, 1, 0.8745098, 1,
-0.05218156, -0.3680365, -2.654157, 0, 1, 0.8784314, 1,
-0.05064509, -1.393148, -3.700145, 0, 1, 0.8862745, 1,
-0.04823954, -1.347976, -1.306569, 0, 1, 0.8901961, 1,
-0.04723761, 0.5127826, 1.088585, 0, 1, 0.8980392, 1,
-0.04386534, -0.5162933, -1.549335, 0, 1, 0.9058824, 1,
-0.04249304, -0.4936903, -4.398527, 0, 1, 0.9098039, 1,
-0.04108829, -0.2130229, -5.967239, 0, 1, 0.9176471, 1,
-0.03978794, 0.04254708, -3.395751, 0, 1, 0.9215686, 1,
-0.03701806, 0.0307108, -1.619259, 0, 1, 0.9294118, 1,
-0.03559937, 0.7674456, -0.111577, 0, 1, 0.9333333, 1,
-0.03367824, -1.804254, -3.335042, 0, 1, 0.9411765, 1,
-0.03131948, 0.8321789, 0.3104392, 0, 1, 0.945098, 1,
-0.03082982, -0.2342559, -2.032357, 0, 1, 0.9529412, 1,
-0.02264452, -0.6075363, -2.928131, 0, 1, 0.9568627, 1,
-0.01870011, 1.931851, -0.2054068, 0, 1, 0.9647059, 1,
-0.01736459, -0.4474194, -2.122785, 0, 1, 0.9686275, 1,
-0.01049329, 0.9454261, -0.06890646, 0, 1, 0.9764706, 1,
-0.002553948, 0.007775926, -0.2216887, 0, 1, 0.9803922, 1,
-0.001678685, 0.9025213, -0.4700514, 0, 1, 0.9882353, 1,
-0.0004104291, 1.473476, -0.5224657, 0, 1, 0.9921569, 1,
0.001419566, -0.6676938, 3.587352, 0, 1, 1, 1,
0.003908763, 1.347844, -2.032958, 0, 0.9921569, 1, 1,
0.004246463, -0.4179181, 3.1638, 0, 0.9882353, 1, 1,
0.006653102, -0.1607718, 1.988472, 0, 0.9803922, 1, 1,
0.009197798, 0.8876423, 0.2828707, 0, 0.9764706, 1, 1,
0.01507909, 0.1585288, -0.1609159, 0, 0.9686275, 1, 1,
0.01784373, 0.1615091, -1.596171, 0, 0.9647059, 1, 1,
0.02438013, 0.8713009, -0.1834514, 0, 0.9568627, 1, 1,
0.0259013, -0.4103349, 2.110294, 0, 0.9529412, 1, 1,
0.03347218, 0.09491225, -1.639734, 0, 0.945098, 1, 1,
0.03352482, 0.1596209, 0.6378868, 0, 0.9411765, 1, 1,
0.03429695, -0.2475728, 2.740583, 0, 0.9333333, 1, 1,
0.04112076, -1.45738, 3.895757, 0, 0.9294118, 1, 1,
0.04210432, -0.1314194, 3.045835, 0, 0.9215686, 1, 1,
0.04287683, 0.4664353, -0.7306561, 0, 0.9176471, 1, 1,
0.04311082, -0.7660529, 3.577622, 0, 0.9098039, 1, 1,
0.0433952, -0.5816252, 5.736641, 0, 0.9058824, 1, 1,
0.04888398, -1.784158, 2.79053, 0, 0.8980392, 1, 1,
0.05140808, 0.4326783, -1.287838, 0, 0.8901961, 1, 1,
0.05147443, 0.6739632, -1.508853, 0, 0.8862745, 1, 1,
0.0525001, 2.316686, 1.942014, 0, 0.8784314, 1, 1,
0.05905619, -1.373275, 3.442559, 0, 0.8745098, 1, 1,
0.06147079, -0.5347211, 2.665864, 0, 0.8666667, 1, 1,
0.0660987, 0.6697618, -0.5177431, 0, 0.8627451, 1, 1,
0.06648887, -1.604189, 3.387564, 0, 0.854902, 1, 1,
0.06649784, 0.1222493, 1.622341, 0, 0.8509804, 1, 1,
0.07131384, 1.12728, -0.3719172, 0, 0.8431373, 1, 1,
0.0783598, 0.1424232, -0.1417034, 0, 0.8392157, 1, 1,
0.07913643, -1.383846, 2.438522, 0, 0.8313726, 1, 1,
0.08472277, 0.1828106, 0.04308614, 0, 0.827451, 1, 1,
0.08780292, -0.9966585, 2.881711, 0, 0.8196079, 1, 1,
0.09439534, -1.088795, 4.624909, 0, 0.8156863, 1, 1,
0.09462953, -1.343294, 2.435356, 0, 0.8078431, 1, 1,
0.0996987, -0.3475661, 2.803258, 0, 0.8039216, 1, 1,
0.1040093, 0.3517931, 0.03790832, 0, 0.7960784, 1, 1,
0.1068354, 1.166739, 0.1879949, 0, 0.7882353, 1, 1,
0.1096841, -0.995772, 3.748085, 0, 0.7843137, 1, 1,
0.112493, -0.5408589, 4.304651, 0, 0.7764706, 1, 1,
0.1154691, 1.072052, -1.999168, 0, 0.772549, 1, 1,
0.120094, 0.9165009, 0.4110575, 0, 0.7647059, 1, 1,
0.1279107, 0.7942589, -0.9397291, 0, 0.7607843, 1, 1,
0.1352353, 0.4712999, -0.4159082, 0, 0.7529412, 1, 1,
0.1360709, 0.4902355, 0.06026836, 0, 0.7490196, 1, 1,
0.1417969, -0.1458419, 1.256623, 0, 0.7411765, 1, 1,
0.1428598, -0.8062537, 1.20055, 0, 0.7372549, 1, 1,
0.1438822, -0.01123491, 2.763373, 0, 0.7294118, 1, 1,
0.1458087, 0.5867534, 0.6727221, 0, 0.7254902, 1, 1,
0.1481513, 0.3623624, 0.8565048, 0, 0.7176471, 1, 1,
0.1484075, 0.128988, -1.177163, 0, 0.7137255, 1, 1,
0.1529589, -1.534894, 4.005095, 0, 0.7058824, 1, 1,
0.1544993, -0.7963884, 2.686885, 0, 0.6980392, 1, 1,
0.1682862, -0.7495728, 3.001567, 0, 0.6941177, 1, 1,
0.1733857, 1.043187, -1.4067, 0, 0.6862745, 1, 1,
0.1762387, -0.4688534, 1.806437, 0, 0.682353, 1, 1,
0.1778432, 1.254922, -0.7577453, 0, 0.6745098, 1, 1,
0.1802206, -1.001621, 3.585071, 0, 0.6705883, 1, 1,
0.181389, 0.2367037, -0.1976759, 0, 0.6627451, 1, 1,
0.1819709, -0.5918447, 2.066087, 0, 0.6588235, 1, 1,
0.1831878, -0.1744728, 2.359266, 0, 0.6509804, 1, 1,
0.1844084, -2.278002, 3.833958, 0, 0.6470588, 1, 1,
0.1866973, 0.1502791, 1.061103, 0, 0.6392157, 1, 1,
0.1883411, 0.8513089, 0.8226334, 0, 0.6352941, 1, 1,
0.1888954, 0.9571121, 0.2360158, 0, 0.627451, 1, 1,
0.1916204, -0.2537184, 1.453359, 0, 0.6235294, 1, 1,
0.1921751, 2.107547, -1.408724, 0, 0.6156863, 1, 1,
0.1939737, -1.324572, 3.074416, 0, 0.6117647, 1, 1,
0.195524, 0.2552639, -1.308231, 0, 0.6039216, 1, 1,
0.1988873, -1.400134, 3.080161, 0, 0.5960785, 1, 1,
0.2003236, -1.07912, 3.166827, 0, 0.5921569, 1, 1,
0.2024963, -2.383714, 2.092726, 0, 0.5843138, 1, 1,
0.2062773, 0.6032801, 1.31275, 0, 0.5803922, 1, 1,
0.2068941, -1.471929, 2.814086, 0, 0.572549, 1, 1,
0.2080953, 0.7136804, -0.4453926, 0, 0.5686275, 1, 1,
0.2098285, -0.925707, 2.420676, 0, 0.5607843, 1, 1,
0.2104262, 0.4404236, 0.2328974, 0, 0.5568628, 1, 1,
0.2184498, 0.02152486, 1.909312, 0, 0.5490196, 1, 1,
0.2186276, -0.1245775, 3.031775, 0, 0.5450981, 1, 1,
0.2199392, 0.3963774, 1.155444, 0, 0.5372549, 1, 1,
0.2227214, 0.8459327, 0.1082905, 0, 0.5333334, 1, 1,
0.2231344, -1.337563, 2.15985, 0, 0.5254902, 1, 1,
0.2242463, -0.4886478, 3.473606, 0, 0.5215687, 1, 1,
0.226681, -0.8583165, 2.930375, 0, 0.5137255, 1, 1,
0.229173, -0.4124148, 2.826092, 0, 0.509804, 1, 1,
0.2306838, -1.773484, 1.164069, 0, 0.5019608, 1, 1,
0.2321775, -0.1846561, 2.667385, 0, 0.4941176, 1, 1,
0.2336545, 0.3582318, 1.584921, 0, 0.4901961, 1, 1,
0.2343445, -0.4230197, 4.205381, 0, 0.4823529, 1, 1,
0.2344545, -0.9351781, 1.452206, 0, 0.4784314, 1, 1,
0.2347166, -2.508202, 3.090708, 0, 0.4705882, 1, 1,
0.2347915, 0.01379198, 1.628985, 0, 0.4666667, 1, 1,
0.2355526, -0.8234875, 0.499575, 0, 0.4588235, 1, 1,
0.24088, 0.4181777, 0.2307106, 0, 0.454902, 1, 1,
0.2410879, 1.661807, -0.6860286, 0, 0.4470588, 1, 1,
0.2460809, 0.516305, -0.1681823, 0, 0.4431373, 1, 1,
0.2475426, -0.6030603, 1.8001, 0, 0.4352941, 1, 1,
0.2475828, 0.7726999, -0.8298105, 0, 0.4313726, 1, 1,
0.2600608, 0.8491688, -0.4952867, 0, 0.4235294, 1, 1,
0.2724314, 0.5146483, 0.8720401, 0, 0.4196078, 1, 1,
0.2781752, 0.11238, 1.522861, 0, 0.4117647, 1, 1,
0.2835505, -0.1765625, 1.720843, 0, 0.4078431, 1, 1,
0.2861286, -1.371672, 3.091004, 0, 0.4, 1, 1,
0.2878482, -0.5341657, 2.74402, 0, 0.3921569, 1, 1,
0.2894507, -0.3563165, 3.731514, 0, 0.3882353, 1, 1,
0.2896567, 0.8988768, 1.134346, 0, 0.3803922, 1, 1,
0.2972791, 0.7852705, -0.07448905, 0, 0.3764706, 1, 1,
0.2983141, 0.6013116, -2.022747, 0, 0.3686275, 1, 1,
0.3037211, -1.3798, 4.700882, 0, 0.3647059, 1, 1,
0.3065319, -0.06693417, 1.768668, 0, 0.3568628, 1, 1,
0.3109311, -1.984537, 3.476507, 0, 0.3529412, 1, 1,
0.3185063, 0.7826369, 0.03502107, 0, 0.345098, 1, 1,
0.3218445, 0.4232652, 0.4214112, 0, 0.3411765, 1, 1,
0.3223798, -3.186839, 2.130891, 0, 0.3333333, 1, 1,
0.3223862, 0.1554825, 2.640713, 0, 0.3294118, 1, 1,
0.3226199, 1.425458, -0.1943626, 0, 0.3215686, 1, 1,
0.3244254, -0.6981961, 2.735098, 0, 0.3176471, 1, 1,
0.3329515, 0.5132, -1.13156, 0, 0.3098039, 1, 1,
0.3365118, -0.4449092, 2.287653, 0, 0.3058824, 1, 1,
0.3368859, 0.9647756, -0.6544577, 0, 0.2980392, 1, 1,
0.3372912, 0.283982, 0.2720873, 0, 0.2901961, 1, 1,
0.3387885, 0.18039, 1.255995, 0, 0.2862745, 1, 1,
0.339279, 0.9731051, 1.340607, 0, 0.2784314, 1, 1,
0.3429938, 0.739652, -2.084851, 0, 0.2745098, 1, 1,
0.343369, -0.0368644, 0.7638474, 0, 0.2666667, 1, 1,
0.3450294, -1.126514, 3.264339, 0, 0.2627451, 1, 1,
0.3540305, 0.09984609, 1.706513, 0, 0.254902, 1, 1,
0.3568699, 0.3591306, 0.8574058, 0, 0.2509804, 1, 1,
0.3637152, -0.7627069, 1.912775, 0, 0.2431373, 1, 1,
0.3638057, 0.209049, 1.27507, 0, 0.2392157, 1, 1,
0.3639494, -0.1179715, 0.1130948, 0, 0.2313726, 1, 1,
0.366282, -0.2982441, 1.637074, 0, 0.227451, 1, 1,
0.3689375, -0.7456578, 3.663106, 0, 0.2196078, 1, 1,
0.3692707, 0.3603339, 0.7978309, 0, 0.2156863, 1, 1,
0.3733133, 0.4123958, -0.2702282, 0, 0.2078431, 1, 1,
0.3756324, 0.8868933, 0.382793, 0, 0.2039216, 1, 1,
0.376788, 0.07387207, 0.4695891, 0, 0.1960784, 1, 1,
0.377645, -1.031087, 3.56237, 0, 0.1882353, 1, 1,
0.3799033, -0.6804653, 2.496757, 0, 0.1843137, 1, 1,
0.3820298, -0.5460778, 3.884434, 0, 0.1764706, 1, 1,
0.3822009, 0.07328249, 1.813451, 0, 0.172549, 1, 1,
0.382569, 0.9523982, 1.091355, 0, 0.1647059, 1, 1,
0.38429, -1.101925, 1.894775, 0, 0.1607843, 1, 1,
0.3856002, 0.3641403, 0.8900258, 0, 0.1529412, 1, 1,
0.3884912, -0.3522733, 1.477555, 0, 0.1490196, 1, 1,
0.3899496, -1.076621, 3.231445, 0, 0.1411765, 1, 1,
0.3961013, 2.048928, 1.036568, 0, 0.1372549, 1, 1,
0.3965487, 0.3862406, 1.820446, 0, 0.1294118, 1, 1,
0.3974976, 0.3592691, 1.391501, 0, 0.1254902, 1, 1,
0.4024982, -1.009228, 1.79259, 0, 0.1176471, 1, 1,
0.4057918, -0.5506877, 2.8386, 0, 0.1137255, 1, 1,
0.4064162, 0.7977848, 2.331276, 0, 0.1058824, 1, 1,
0.4077698, 0.6805798, 1.436316, 0, 0.09803922, 1, 1,
0.4110326, -0.6274285, 3.086019, 0, 0.09411765, 1, 1,
0.4216186, 1.041727, 0.4913307, 0, 0.08627451, 1, 1,
0.4241649, 0.7418716, 1.458981, 0, 0.08235294, 1, 1,
0.4274952, -0.5560638, 0.707971, 0, 0.07450981, 1, 1,
0.4285701, 1.261566, 1.045924, 0, 0.07058824, 1, 1,
0.4295928, -0.5598379, 3.082747, 0, 0.0627451, 1, 1,
0.4353086, -0.1878356, 2.974813, 0, 0.05882353, 1, 1,
0.4365844, -0.1805758, 2.31657, 0, 0.05098039, 1, 1,
0.4389096, 0.5666062, 2.236301, 0, 0.04705882, 1, 1,
0.4449506, -0.1854999, 1.201005, 0, 0.03921569, 1, 1,
0.4479802, -0.2988103, 3.748831, 0, 0.03529412, 1, 1,
0.4483158, 0.1186715, 2.118769, 0, 0.02745098, 1, 1,
0.4486309, -1.053016, 2.654067, 0, 0.02352941, 1, 1,
0.4490229, -0.301897, 0.6734871, 0, 0.01568628, 1, 1,
0.4497291, 0.602706, 0.4149937, 0, 0.01176471, 1, 1,
0.4503025, -0.222994, 2.552182, 0, 0.003921569, 1, 1,
0.4508516, -2.200951, 3.154288, 0.003921569, 0, 1, 1,
0.4529712, -1.467738, 0.3029324, 0.007843138, 0, 1, 1,
0.453371, -0.7094487, 2.51311, 0.01568628, 0, 1, 1,
0.4559195, 0.09464735, 1.13031, 0.01960784, 0, 1, 1,
0.4562193, -0.3014299, 2.298125, 0.02745098, 0, 1, 1,
0.4575437, -0.579171, 0.1876789, 0.03137255, 0, 1, 1,
0.4581905, 1.323513, 0.3263551, 0.03921569, 0, 1, 1,
0.4638746, 0.3203038, 1.007016, 0.04313726, 0, 1, 1,
0.465345, -0.7905782, 4.167576, 0.05098039, 0, 1, 1,
0.4677024, 0.2660408, 0.3890186, 0.05490196, 0, 1, 1,
0.4687594, -1.098171, 3.729957, 0.0627451, 0, 1, 1,
0.4692185, 0.5752444, 0.4363779, 0.06666667, 0, 1, 1,
0.4708309, 0.1544621, 0.994554, 0.07450981, 0, 1, 1,
0.4737983, -0.3322796, 3.086497, 0.07843138, 0, 1, 1,
0.4738109, 1.562883, -0.3263458, 0.08627451, 0, 1, 1,
0.4739985, -3.45644, 3.118793, 0.09019608, 0, 1, 1,
0.4803384, -0.9997022, 2.764121, 0.09803922, 0, 1, 1,
0.4845335, 1.013285, 0.05009732, 0.1058824, 0, 1, 1,
0.4883435, 0.4635426, 1.284648, 0.1098039, 0, 1, 1,
0.4901428, -1.025479, 2.887709, 0.1176471, 0, 1, 1,
0.4920696, 0.159561, 2.923087, 0.1215686, 0, 1, 1,
0.4963838, -0.5776432, 4.69978, 0.1294118, 0, 1, 1,
0.4964156, -0.7764289, 2.244737, 0.1333333, 0, 1, 1,
0.4976569, -0.8035567, 3.475201, 0.1411765, 0, 1, 1,
0.4980547, 0.1061989, 4.159097, 0.145098, 0, 1, 1,
0.4997894, -0.321742, 0.9536306, 0.1529412, 0, 1, 1,
0.5003676, 1.420799, 1.580354, 0.1568628, 0, 1, 1,
0.5028695, -0.4299553, 1.340626, 0.1647059, 0, 1, 1,
0.5054992, -1.98726, 3.458899, 0.1686275, 0, 1, 1,
0.5062034, 0.06399459, 0.9467574, 0.1764706, 0, 1, 1,
0.5101086, -1.299859, 1.191668, 0.1803922, 0, 1, 1,
0.5119672, -1.023104, 4.677482, 0.1882353, 0, 1, 1,
0.5150051, 0.07157006, 2.813205, 0.1921569, 0, 1, 1,
0.5221752, -0.03344514, 0.256988, 0.2, 0, 1, 1,
0.5303367, 2.407276, -0.7086405, 0.2078431, 0, 1, 1,
0.5342762, -0.08769483, 0.5900298, 0.2117647, 0, 1, 1,
0.5363178, 0.04925613, 2.511408, 0.2196078, 0, 1, 1,
0.5367059, 1.377344, 0.4925177, 0.2235294, 0, 1, 1,
0.5391622, 0.9327038, 0.2695082, 0.2313726, 0, 1, 1,
0.5426538, 0.04257533, 0.4274148, 0.2352941, 0, 1, 1,
0.545584, -1.168705, 1.322433, 0.2431373, 0, 1, 1,
0.5518858, 1.096432, 0.9186362, 0.2470588, 0, 1, 1,
0.5519536, -0.2964109, 3.131287, 0.254902, 0, 1, 1,
0.5524615, 0.1886383, 1.446845, 0.2588235, 0, 1, 1,
0.5538178, -1.690777, 2.261334, 0.2666667, 0, 1, 1,
0.5578892, 0.02218996, 1.021847, 0.2705882, 0, 1, 1,
0.5614132, 0.2668339, 0.2233285, 0.2784314, 0, 1, 1,
0.5685677, -0.1889089, 1.754521, 0.282353, 0, 1, 1,
0.5761678, -0.5710647, 2.540752, 0.2901961, 0, 1, 1,
0.5767519, 2.92145, -2.369193, 0.2941177, 0, 1, 1,
0.579214, 1.203889, 0.4830101, 0.3019608, 0, 1, 1,
0.5821023, -1.844762, 5.779056, 0.3098039, 0, 1, 1,
0.5836824, -0.8374206, 0.6729619, 0.3137255, 0, 1, 1,
0.5893574, -2.483517, 2.906551, 0.3215686, 0, 1, 1,
0.5911505, 0.188509, 1.95721, 0.3254902, 0, 1, 1,
0.5988787, 1.862625, 0.3869669, 0.3333333, 0, 1, 1,
0.5996839, 0.6980308, -0.9463254, 0.3372549, 0, 1, 1,
0.6011353, 0.1017987, 2.009366, 0.345098, 0, 1, 1,
0.6033731, 2.266204, -1.355612, 0.3490196, 0, 1, 1,
0.604854, 0.8251543, 1.318676, 0.3568628, 0, 1, 1,
0.6193811, -0.08301499, 2.13029, 0.3607843, 0, 1, 1,
0.6194009, 0.6333318, 0.8052939, 0.3686275, 0, 1, 1,
0.6200374, -0.4552174, 2.702776, 0.372549, 0, 1, 1,
0.6200856, -1.681757, 3.274527, 0.3803922, 0, 1, 1,
0.6283008, -0.7625527, 4.189728, 0.3843137, 0, 1, 1,
0.6370164, -0.3398132, 3.227118, 0.3921569, 0, 1, 1,
0.6375149, -1.01248, 1.703452, 0.3960784, 0, 1, 1,
0.6411906, 0.1037691, 2.06065, 0.4039216, 0, 1, 1,
0.6447704, -0.6293764, 1.923959, 0.4117647, 0, 1, 1,
0.6522959, -1.488792, 3.131174, 0.4156863, 0, 1, 1,
0.6558601, -1.013055, 2.586054, 0.4235294, 0, 1, 1,
0.6563195, 0.5780447, 2.112949, 0.427451, 0, 1, 1,
0.6582131, 0.7090151, 2.014786, 0.4352941, 0, 1, 1,
0.6610122, 3.057787, 1.572231, 0.4392157, 0, 1, 1,
0.6630028, 1.782146, 2.219435, 0.4470588, 0, 1, 1,
0.6660287, -1.002611, 2.171223, 0.4509804, 0, 1, 1,
0.6736506, -0.7849762, 3.505259, 0.4588235, 0, 1, 1,
0.6738043, -1.284533, 3.023041, 0.4627451, 0, 1, 1,
0.6771755, -0.9158034, 3.801491, 0.4705882, 0, 1, 1,
0.678614, 1.173605, -0.337946, 0.4745098, 0, 1, 1,
0.6874306, -0.07553686, 1.730054, 0.4823529, 0, 1, 1,
0.6879773, -1.774222, 2.050517, 0.4862745, 0, 1, 1,
0.6909069, 0.1886619, 1.417998, 0.4941176, 0, 1, 1,
0.691108, 0.240397, -0.3911681, 0.5019608, 0, 1, 1,
0.6982343, 1.931628, -1.758196, 0.5058824, 0, 1, 1,
0.7023127, 0.5885503, 1.678888, 0.5137255, 0, 1, 1,
0.7043903, -1.36403, 2.886025, 0.5176471, 0, 1, 1,
0.7057276, 2.456645, -0.2938876, 0.5254902, 0, 1, 1,
0.7057913, 1.612435, -0.06641071, 0.5294118, 0, 1, 1,
0.7105641, 0.1917989, 1.692693, 0.5372549, 0, 1, 1,
0.7197021, 0.2961471, 1.756922, 0.5411765, 0, 1, 1,
0.7258024, 1.183291, 1.354405, 0.5490196, 0, 1, 1,
0.7272905, -1.129263, 3.442621, 0.5529412, 0, 1, 1,
0.7292902, -1.653935, 1.985788, 0.5607843, 0, 1, 1,
0.729809, -0.2465026, 3.194494, 0.5647059, 0, 1, 1,
0.7309952, 1.011031, 1.671376, 0.572549, 0, 1, 1,
0.7326696, -1.852203, 0.3536167, 0.5764706, 0, 1, 1,
0.7345922, -0.5850468, 0.5065897, 0.5843138, 0, 1, 1,
0.7381245, 1.900958, -0.1788898, 0.5882353, 0, 1, 1,
0.7381272, -0.03911333, 1.477872, 0.5960785, 0, 1, 1,
0.740752, -0.5833305, 3.005067, 0.6039216, 0, 1, 1,
0.7411886, -0.09429918, 1.663246, 0.6078432, 0, 1, 1,
0.7413648, 1.030217, 0.3065988, 0.6156863, 0, 1, 1,
0.7416487, -1.072705, 1.831528, 0.6196079, 0, 1, 1,
0.7441537, 1.107914, -1.297334, 0.627451, 0, 1, 1,
0.7471204, 0.4334373, 2.098522, 0.6313726, 0, 1, 1,
0.7563703, -1.12978, 3.586684, 0.6392157, 0, 1, 1,
0.7597401, 0.2692255, 1.231329, 0.6431373, 0, 1, 1,
0.7598374, 1.209199, 0.6395574, 0.6509804, 0, 1, 1,
0.7609954, 3.004656, -0.6119667, 0.654902, 0, 1, 1,
0.7662542, 0.9544775, -0.3345562, 0.6627451, 0, 1, 1,
0.7665079, -1.827795, 2.569516, 0.6666667, 0, 1, 1,
0.7689318, -0.04461638, 1.033651, 0.6745098, 0, 1, 1,
0.7727971, -0.3873913, 0.7481332, 0.6784314, 0, 1, 1,
0.77434, 0.5526893, -0.6455751, 0.6862745, 0, 1, 1,
0.7748136, -0.3110699, 2.347726, 0.6901961, 0, 1, 1,
0.775772, 0.708279, 1.415236, 0.6980392, 0, 1, 1,
0.7903529, -0.4939068, 2.52348, 0.7058824, 0, 1, 1,
0.7911949, -0.3118725, 2.59033, 0.7098039, 0, 1, 1,
0.7918378, -0.0545279, 0.621693, 0.7176471, 0, 1, 1,
0.799314, -0.3247463, 2.235505, 0.7215686, 0, 1, 1,
0.8081546, 1.419075, -0.9489753, 0.7294118, 0, 1, 1,
0.8086376, 0.1688791, 1.858976, 0.7333333, 0, 1, 1,
0.812188, -0.04210206, 0.8604714, 0.7411765, 0, 1, 1,
0.813215, -0.8960112, 2.516269, 0.7450981, 0, 1, 1,
0.8145437, 0.2725622, 3.005279, 0.7529412, 0, 1, 1,
0.8169452, -0.9970806, 1.902034, 0.7568628, 0, 1, 1,
0.8173313, -2.068216, 2.392496, 0.7647059, 0, 1, 1,
0.817787, -0.01868953, 1.948483, 0.7686275, 0, 1, 1,
0.8184308, -1.892357, 4.021902, 0.7764706, 0, 1, 1,
0.8196102, -1.267067, 4.612434, 0.7803922, 0, 1, 1,
0.8214473, 0.1293765, 1.479435, 0.7882353, 0, 1, 1,
0.8222011, -1.084213, 3.164391, 0.7921569, 0, 1, 1,
0.8260533, 0.8224552, 0.2040468, 0.8, 0, 1, 1,
0.8277617, 0.4270411, 1.066996, 0.8078431, 0, 1, 1,
0.8336983, -0.6065285, 0.795949, 0.8117647, 0, 1, 1,
0.8348446, -0.6965291, 2.5112, 0.8196079, 0, 1, 1,
0.8544726, -1.419774, 1.599603, 0.8235294, 0, 1, 1,
0.8589139, 2.280119, 0.1754106, 0.8313726, 0, 1, 1,
0.8691309, -1.044974, 1.495172, 0.8352941, 0, 1, 1,
0.8702695, -1.189604, 1.984568, 0.8431373, 0, 1, 1,
0.8729523, -0.6898953, 1.951494, 0.8470588, 0, 1, 1,
0.8767177, -1.040482, 2.321329, 0.854902, 0, 1, 1,
0.8790812, 0.6994384, 2.094556, 0.8588235, 0, 1, 1,
0.881237, -0.08590999, 2.469303, 0.8666667, 0, 1, 1,
0.8822293, -3.495806, 4.574441, 0.8705882, 0, 1, 1,
0.8852135, -0.5965996, 1.639071, 0.8784314, 0, 1, 1,
0.8920066, 0.1608389, 0.3900143, 0.8823529, 0, 1, 1,
0.8934193, -0.2828096, 2.030847, 0.8901961, 0, 1, 1,
0.894291, -0.2057481, 2.519571, 0.8941177, 0, 1, 1,
0.895892, -0.8563611, 0.2651279, 0.9019608, 0, 1, 1,
0.9001598, 1.01838, 1.60649, 0.9098039, 0, 1, 1,
0.9103729, -0.5012817, 2.948693, 0.9137255, 0, 1, 1,
0.9158404, 0.6350743, 0.8323784, 0.9215686, 0, 1, 1,
0.9236794, -0.03393251, 2.056866, 0.9254902, 0, 1, 1,
0.9304371, -0.06711634, 1.965414, 0.9333333, 0, 1, 1,
0.9320601, -0.5538641, 2.449266, 0.9372549, 0, 1, 1,
0.9326535, -1.05216, 3.285726, 0.945098, 0, 1, 1,
0.9351475, 0.6330796, 0.5257868, 0.9490196, 0, 1, 1,
0.9379169, 0.2152253, -0.3883455, 0.9568627, 0, 1, 1,
0.9408296, -1.257464, 1.942648, 0.9607843, 0, 1, 1,
0.9433361, 1.198553, 1.162831, 0.9686275, 0, 1, 1,
0.9439557, 0.8387972, -1.427637, 0.972549, 0, 1, 1,
0.9486101, 0.4457494, 1.233716, 0.9803922, 0, 1, 1,
0.9502542, -1.97159, 4.371785, 0.9843137, 0, 1, 1,
0.9605891, -0.6042449, 4.686197, 0.9921569, 0, 1, 1,
0.9661394, -0.4418793, 2.262921, 0.9960784, 0, 1, 1,
0.9757959, 0.2348318, 1.228506, 1, 0, 0.9960784, 1,
0.9759094, 0.1897235, 3.345781, 1, 0, 0.9882353, 1,
0.9790448, -0.5749363, 0.2799241, 1, 0, 0.9843137, 1,
0.9811993, 0.1233489, 1.581273, 1, 0, 0.9764706, 1,
0.9812359, 1.006262, 1.219213, 1, 0, 0.972549, 1,
0.9947487, 0.40823, 1.323943, 1, 0, 0.9647059, 1,
1.003607, 0.05876668, 2.368733, 1, 0, 0.9607843, 1,
1.005036, 1.310826, -0.4347966, 1, 0, 0.9529412, 1,
1.006445, -0.4756648, 3.228377, 1, 0, 0.9490196, 1,
1.007098, 0.3684517, -0.03929807, 1, 0, 0.9411765, 1,
1.007776, 0.2538092, 0.8735849, 1, 0, 0.9372549, 1,
1.020393, 0.6656301, 3.695519, 1, 0, 0.9294118, 1,
1.024358, -1.805304, 2.035715, 1, 0, 0.9254902, 1,
1.025151, -0.8191768, 3.224273, 1, 0, 0.9176471, 1,
1.031724, -1.235954, 3.966095, 1, 0, 0.9137255, 1,
1.038187, -0.6701083, 2.078046, 1, 0, 0.9058824, 1,
1.039333, 0.5881338, 3.191373, 1, 0, 0.9019608, 1,
1.040049, -0.01597602, 2.780866, 1, 0, 0.8941177, 1,
1.040336, -0.7920086, 2.723759, 1, 0, 0.8862745, 1,
1.05247, -0.2470205, 2.111453, 1, 0, 0.8823529, 1,
1.053048, 0.54188, 2.102986, 1, 0, 0.8745098, 1,
1.058978, 0.3471698, 0.5919895, 1, 0, 0.8705882, 1,
1.061103, 1.13642, 1.611508, 1, 0, 0.8627451, 1,
1.061125, -0.1022309, 1.06236, 1, 0, 0.8588235, 1,
1.067852, 1.287037, 0.2294466, 1, 0, 0.8509804, 1,
1.069775, -1.413329, 2.216087, 1, 0, 0.8470588, 1,
1.071256, -0.3730935, 1.941802, 1, 0, 0.8392157, 1,
1.072731, 0.2775672, 0.873843, 1, 0, 0.8352941, 1,
1.074535, 0.6737582, -0.3399167, 1, 0, 0.827451, 1,
1.079403, -0.1166591, 1.338706, 1, 0, 0.8235294, 1,
1.084051, 0.3577239, 2.001212, 1, 0, 0.8156863, 1,
1.085975, -0.5614318, 1.476123, 1, 0, 0.8117647, 1,
1.088266, 1.496387, 1.27658, 1, 0, 0.8039216, 1,
1.089649, 1.4703, -0.3698827, 1, 0, 0.7960784, 1,
1.091161, 0.07780776, 1.562761, 1, 0, 0.7921569, 1,
1.094918, -1.240121, 1.636855, 1, 0, 0.7843137, 1,
1.096153, -0.7833437, 2.693969, 1, 0, 0.7803922, 1,
1.096816, 0.8677929, 0.874435, 1, 0, 0.772549, 1,
1.099634, -2.170066, 2.926676, 1, 0, 0.7686275, 1,
1.103666, 1.11024, 0.6439844, 1, 0, 0.7607843, 1,
1.104758, 0.07097803, 1.233312, 1, 0, 0.7568628, 1,
1.105356, -1.051234, 1.665639, 1, 0, 0.7490196, 1,
1.105548, -1.026799, 0.3589454, 1, 0, 0.7450981, 1,
1.106756, -1.477052, 2.328909, 1, 0, 0.7372549, 1,
1.117771, -0.6135996, 0.4222727, 1, 0, 0.7333333, 1,
1.127755, -0.1319282, 1.991431, 1, 0, 0.7254902, 1,
1.133527, -2.682933, 1.158494, 1, 0, 0.7215686, 1,
1.138287, 1.02342, 0.7230688, 1, 0, 0.7137255, 1,
1.13894, -0.02587508, 1.794268, 1, 0, 0.7098039, 1,
1.140785, 0.6643194, 2.62466, 1, 0, 0.7019608, 1,
1.142416, -0.5456097, 2.501264, 1, 0, 0.6941177, 1,
1.143598, 0.1929747, 1.965159, 1, 0, 0.6901961, 1,
1.143626, 0.9817059, 0.6060964, 1, 0, 0.682353, 1,
1.166368, 0.4004228, -0.1887063, 1, 0, 0.6784314, 1,
1.179177, 1.100943, -0.6604878, 1, 0, 0.6705883, 1,
1.180519, -1.373389, 1.738903, 1, 0, 0.6666667, 1,
1.187731, 0.6830027, 1.025663, 1, 0, 0.6588235, 1,
1.220987, -0.5322632, 1.571024, 1, 0, 0.654902, 1,
1.22927, 1.277133, -0.608291, 1, 0, 0.6470588, 1,
1.230331, 0.08606628, 0.8669149, 1, 0, 0.6431373, 1,
1.232763, 1.415269, 1.19971, 1, 0, 0.6352941, 1,
1.23739, -1.294215, 3.49981, 1, 0, 0.6313726, 1,
1.238483, 1.197085, 2.782676, 1, 0, 0.6235294, 1,
1.24693, 0.1312494, 1.406544, 1, 0, 0.6196079, 1,
1.250137, 2.345111, -0.08537118, 1, 0, 0.6117647, 1,
1.254589, 0.07305008, 0.8712171, 1, 0, 0.6078432, 1,
1.256682, 0.3556594, 3.815764, 1, 0, 0.6, 1,
1.261957, 0.5322637, 2.153223, 1, 0, 0.5921569, 1,
1.262831, -1.067845, 3.637299, 1, 0, 0.5882353, 1,
1.266643, 0.6290797, 0.4451346, 1, 0, 0.5803922, 1,
1.272118, -1.222982, 1.59686, 1, 0, 0.5764706, 1,
1.282177, -0.6103554, 1.256328, 1, 0, 0.5686275, 1,
1.293212, -0.04366326, 0.8990505, 1, 0, 0.5647059, 1,
1.299509, 1.57522, 1.16832, 1, 0, 0.5568628, 1,
1.310683, -0.6498988, 3.349323, 1, 0, 0.5529412, 1,
1.31149, 0.1473226, 1.770853, 1, 0, 0.5450981, 1,
1.321736, -0.613584, 2.438887, 1, 0, 0.5411765, 1,
1.332515, 0.6824864, 0.8775473, 1, 0, 0.5333334, 1,
1.34577, 0.2314131, 0.5032192, 1, 0, 0.5294118, 1,
1.354895, -0.1893501, 1.441619, 1, 0, 0.5215687, 1,
1.355033, 0.3000087, 1.642809, 1, 0, 0.5176471, 1,
1.355739, -0.4992879, 2.402166, 1, 0, 0.509804, 1,
1.357783, -0.5413071, 1.191845, 1, 0, 0.5058824, 1,
1.360417, -1.554558, 2.341141, 1, 0, 0.4980392, 1,
1.362715, 1.93713, 1.927451, 1, 0, 0.4901961, 1,
1.367028, 0.9726695, 1.518776, 1, 0, 0.4862745, 1,
1.367816, 0.7301341, 1.664623, 1, 0, 0.4784314, 1,
1.368469, -0.3028986, 0.7907389, 1, 0, 0.4745098, 1,
1.374747, 0.5156275, 0.08634703, 1, 0, 0.4666667, 1,
1.379126, 0.191791, 2.10624, 1, 0, 0.4627451, 1,
1.387376, -0.8764572, 3.547885, 1, 0, 0.454902, 1,
1.394041, 0.2136997, 2.068441, 1, 0, 0.4509804, 1,
1.407591, 0.7258431, 0.03351503, 1, 0, 0.4431373, 1,
1.40957, -0.558007, 3.363811, 1, 0, 0.4392157, 1,
1.415828, 0.3732324, 1.829841, 1, 0, 0.4313726, 1,
1.422202, 1.179818, 2.233804, 1, 0, 0.427451, 1,
1.447323, -1.210302, 2.676959, 1, 0, 0.4196078, 1,
1.448824, -0.8481831, 1.975452, 1, 0, 0.4156863, 1,
1.465776, 0.09036175, 2.857283, 1, 0, 0.4078431, 1,
1.482669, -0.02014161, 1.214489, 1, 0, 0.4039216, 1,
1.486339, -2.687706, 2.178106, 1, 0, 0.3960784, 1,
1.50235, -0.42855, 2.503892, 1, 0, 0.3882353, 1,
1.521796, 0.5594355, 1.627866, 1, 0, 0.3843137, 1,
1.536959, 1.179707, 0.8550658, 1, 0, 0.3764706, 1,
1.539385, -0.6099491, 2.859945, 1, 0, 0.372549, 1,
1.540791, -1.145282, 3.664885, 1, 0, 0.3647059, 1,
1.543148, -1.482143, 0.76059, 1, 0, 0.3607843, 1,
1.554804, 0.531363, 2.583461, 1, 0, 0.3529412, 1,
1.56615, 1.080757, 2.789255, 1, 0, 0.3490196, 1,
1.603493, 1.154904, 1.360363, 1, 0, 0.3411765, 1,
1.603609, -0.8874525, 3.895774, 1, 0, 0.3372549, 1,
1.622916, 2.184792, 1.120772, 1, 0, 0.3294118, 1,
1.636386, 1.361122, 0.3652166, 1, 0, 0.3254902, 1,
1.647112, -1.847249, 2.464878, 1, 0, 0.3176471, 1,
1.658783, -0.8221385, 2.351383, 1, 0, 0.3137255, 1,
1.662746, -1.214141, 1.306124, 1, 0, 0.3058824, 1,
1.664155, -0.4672646, 2.006343, 1, 0, 0.2980392, 1,
1.697366, -1.449227, 1.84549, 1, 0, 0.2941177, 1,
1.7057, 0.2416816, 1.821267, 1, 0, 0.2862745, 1,
1.70994, -1.719963, 2.477885, 1, 0, 0.282353, 1,
1.711664, -1.379321, 1.356255, 1, 0, 0.2745098, 1,
1.712324, 1.170798, 0.8108577, 1, 0, 0.2705882, 1,
1.724593, -0.460154, 0.9098467, 1, 0, 0.2627451, 1,
1.727507, -1.629885, 2.269938, 1, 0, 0.2588235, 1,
1.74747, -0.4784844, 1.294934, 1, 0, 0.2509804, 1,
1.753093, 3.001892, 1.545445, 1, 0, 0.2470588, 1,
1.753814, 0.02065636, 0.1367763, 1, 0, 0.2392157, 1,
1.761495, 2.506511, 2.22903, 1, 0, 0.2352941, 1,
1.789566, 1.352925, 1.02615, 1, 0, 0.227451, 1,
1.819362, -0.6390889, 0.1747783, 1, 0, 0.2235294, 1,
1.82536, -1.97229, 2.185523, 1, 0, 0.2156863, 1,
1.825594, -0.800862, 0.8861871, 1, 0, 0.2117647, 1,
1.829679, 1.942174, 1.904882, 1, 0, 0.2039216, 1,
1.858324, -0.9245312, 1.302478, 1, 0, 0.1960784, 1,
1.920127, -0.2571126, 1.9318, 1, 0, 0.1921569, 1,
1.920204, -0.502707, 1.854018, 1, 0, 0.1843137, 1,
1.921996, -0.3980476, 2.610837, 1, 0, 0.1803922, 1,
1.923622, 0.03770561, 2.273892, 1, 0, 0.172549, 1,
1.927764, -1.045391, 2.067576, 1, 0, 0.1686275, 1,
1.930371, 1.281326, 1.773587, 1, 0, 0.1607843, 1,
1.943788, -0.2694643, 0.3706098, 1, 0, 0.1568628, 1,
1.94381, -0.4511358, 1.470433, 1, 0, 0.1490196, 1,
1.963045, -2.022746, 3.064955, 1, 0, 0.145098, 1,
1.982019, -0.5428795, 0.02013214, 1, 0, 0.1372549, 1,
1.989352, -0.4827038, 2.470382, 1, 0, 0.1333333, 1,
1.99784, -0.5607436, 2.811801, 1, 0, 0.1254902, 1,
2.010444, -0.1274033, -0.1732497, 1, 0, 0.1215686, 1,
2.020216, 0.8412768, 0.5655304, 1, 0, 0.1137255, 1,
2.046265, 0.2869318, 1.800387, 1, 0, 0.1098039, 1,
2.057003, -0.6006894, 1.30431, 1, 0, 0.1019608, 1,
2.063602, -0.1205829, 1.32488, 1, 0, 0.09411765, 1,
2.067232, 0.09169744, -0.8175303, 1, 0, 0.09019608, 1,
2.07523, -0.7086614, 0.6134776, 1, 0, 0.08235294, 1,
2.078574, -0.5083293, 1.683357, 1, 0, 0.07843138, 1,
2.083237, -1.155881, 1.259779, 1, 0, 0.07058824, 1,
2.10979, -0.8687752, 0.8778695, 1, 0, 0.06666667, 1,
2.113075, 1.030473, 1.114175, 1, 0, 0.05882353, 1,
2.158025, 0.7187885, 2.328021, 1, 0, 0.05490196, 1,
2.189751, -0.729187, 1.71903, 1, 0, 0.04705882, 1,
2.204608, 0.6122353, 0.4624819, 1, 0, 0.04313726, 1,
2.332162, -0.449254, 1.176233, 1, 0, 0.03529412, 1,
2.339112, 0.8051716, -0.1294132, 1, 0, 0.03137255, 1,
2.489214, 1.921123, 1.353421, 1, 0, 0.02352941, 1,
2.72247, 0.3403831, 2.841756, 1, 0, 0.01960784, 1,
3.186755, 0.125014, 0.5008775, 1, 0, 0.01176471, 1,
3.801515, -0.3591078, 3.040471, 1, 0, 0.007843138, 1
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
0.1273406, -4.606639, -7.958236, 0, -0.5, 0.5, 0.5,
0.1273406, -4.606639, -7.958236, 1, -0.5, 0.5, 0.5,
0.1273406, -4.606639, -7.958236, 1, 1.5, 0.5, 0.5,
0.1273406, -4.606639, -7.958236, 0, 1.5, 0.5, 0.5
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
-4.792379, -0.2190094, -7.958236, 0, -0.5, 0.5, 0.5,
-4.792379, -0.2190094, -7.958236, 1, -0.5, 0.5, 0.5,
-4.792379, -0.2190094, -7.958236, 1, 1.5, 0.5, 0.5,
-4.792379, -0.2190094, -7.958236, 0, 1.5, 0.5, 0.5
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
-4.792379, -4.606639, -0.09409189, 0, -0.5, 0.5, 0.5,
-4.792379, -4.606639, -0.09409189, 1, -0.5, 0.5, 0.5,
-4.792379, -4.606639, -0.09409189, 1, 1.5, 0.5, 0.5,
-4.792379, -4.606639, -0.09409189, 0, 1.5, 0.5, 0.5
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
-2, -3.594109, -6.143434,
2, -3.594109, -6.143434,
-2, -3.594109, -6.143434,
-2, -3.762864, -6.445901,
0, -3.594109, -6.143434,
0, -3.762864, -6.445901,
2, -3.594109, -6.143434,
2, -3.762864, -6.445901
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
-2, -4.100374, -7.050835, 0, -0.5, 0.5, 0.5,
-2, -4.100374, -7.050835, 1, -0.5, 0.5, 0.5,
-2, -4.100374, -7.050835, 1, 1.5, 0.5, 0.5,
-2, -4.100374, -7.050835, 0, 1.5, 0.5, 0.5,
0, -4.100374, -7.050835, 0, -0.5, 0.5, 0.5,
0, -4.100374, -7.050835, 1, -0.5, 0.5, 0.5,
0, -4.100374, -7.050835, 1, 1.5, 0.5, 0.5,
0, -4.100374, -7.050835, 0, 1.5, 0.5, 0.5,
2, -4.100374, -7.050835, 0, -0.5, 0.5, 0.5,
2, -4.100374, -7.050835, 1, -0.5, 0.5, 0.5,
2, -4.100374, -7.050835, 1, 1.5, 0.5, 0.5,
2, -4.100374, -7.050835, 0, 1.5, 0.5, 0.5
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
-3.657059, -3, -6.143434,
-3.657059, 3, -6.143434,
-3.657059, -3, -6.143434,
-3.846279, -3, -6.445901,
-3.657059, -2, -6.143434,
-3.846279, -2, -6.445901,
-3.657059, -1, -6.143434,
-3.846279, -1, -6.445901,
-3.657059, 0, -6.143434,
-3.846279, 0, -6.445901,
-3.657059, 1, -6.143434,
-3.846279, 1, -6.445901,
-3.657059, 2, -6.143434,
-3.846279, 2, -6.445901,
-3.657059, 3, -6.143434,
-3.846279, 3, -6.445901
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
-4.22472, -3, -7.050835, 0, -0.5, 0.5, 0.5,
-4.22472, -3, -7.050835, 1, -0.5, 0.5, 0.5,
-4.22472, -3, -7.050835, 1, 1.5, 0.5, 0.5,
-4.22472, -3, -7.050835, 0, 1.5, 0.5, 0.5,
-4.22472, -2, -7.050835, 0, -0.5, 0.5, 0.5,
-4.22472, -2, -7.050835, 1, -0.5, 0.5, 0.5,
-4.22472, -2, -7.050835, 1, 1.5, 0.5, 0.5,
-4.22472, -2, -7.050835, 0, 1.5, 0.5, 0.5,
-4.22472, -1, -7.050835, 0, -0.5, 0.5, 0.5,
-4.22472, -1, -7.050835, 1, -0.5, 0.5, 0.5,
-4.22472, -1, -7.050835, 1, 1.5, 0.5, 0.5,
-4.22472, -1, -7.050835, 0, 1.5, 0.5, 0.5,
-4.22472, 0, -7.050835, 0, -0.5, 0.5, 0.5,
-4.22472, 0, -7.050835, 1, -0.5, 0.5, 0.5,
-4.22472, 0, -7.050835, 1, 1.5, 0.5, 0.5,
-4.22472, 0, -7.050835, 0, 1.5, 0.5, 0.5,
-4.22472, 1, -7.050835, 0, -0.5, 0.5, 0.5,
-4.22472, 1, -7.050835, 1, -0.5, 0.5, 0.5,
-4.22472, 1, -7.050835, 1, 1.5, 0.5, 0.5,
-4.22472, 1, -7.050835, 0, 1.5, 0.5, 0.5,
-4.22472, 2, -7.050835, 0, -0.5, 0.5, 0.5,
-4.22472, 2, -7.050835, 1, -0.5, 0.5, 0.5,
-4.22472, 2, -7.050835, 1, 1.5, 0.5, 0.5,
-4.22472, 2, -7.050835, 0, 1.5, 0.5, 0.5,
-4.22472, 3, -7.050835, 0, -0.5, 0.5, 0.5,
-4.22472, 3, -7.050835, 1, -0.5, 0.5, 0.5,
-4.22472, 3, -7.050835, 1, 1.5, 0.5, 0.5,
-4.22472, 3, -7.050835, 0, 1.5, 0.5, 0.5
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
-3.657059, -3.594109, -4,
-3.657059, -3.594109, 4,
-3.657059, -3.594109, -4,
-3.846279, -3.762864, -4,
-3.657059, -3.594109, -2,
-3.846279, -3.762864, -2,
-3.657059, -3.594109, 0,
-3.846279, -3.762864, 0,
-3.657059, -3.594109, 2,
-3.846279, -3.762864, 2,
-3.657059, -3.594109, 4,
-3.846279, -3.762864, 4
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
-4.22472, -4.100374, -4, 0, -0.5, 0.5, 0.5,
-4.22472, -4.100374, -4, 1, -0.5, 0.5, 0.5,
-4.22472, -4.100374, -4, 1, 1.5, 0.5, 0.5,
-4.22472, -4.100374, -4, 0, 1.5, 0.5, 0.5,
-4.22472, -4.100374, -2, 0, -0.5, 0.5, 0.5,
-4.22472, -4.100374, -2, 1, -0.5, 0.5, 0.5,
-4.22472, -4.100374, -2, 1, 1.5, 0.5, 0.5,
-4.22472, -4.100374, -2, 0, 1.5, 0.5, 0.5,
-4.22472, -4.100374, 0, 0, -0.5, 0.5, 0.5,
-4.22472, -4.100374, 0, 1, -0.5, 0.5, 0.5,
-4.22472, -4.100374, 0, 1, 1.5, 0.5, 0.5,
-4.22472, -4.100374, 0, 0, 1.5, 0.5, 0.5,
-4.22472, -4.100374, 2, 0, -0.5, 0.5, 0.5,
-4.22472, -4.100374, 2, 1, -0.5, 0.5, 0.5,
-4.22472, -4.100374, 2, 1, 1.5, 0.5, 0.5,
-4.22472, -4.100374, 2, 0, 1.5, 0.5, 0.5,
-4.22472, -4.100374, 4, 0, -0.5, 0.5, 0.5,
-4.22472, -4.100374, 4, 1, -0.5, 0.5, 0.5,
-4.22472, -4.100374, 4, 1, 1.5, 0.5, 0.5,
-4.22472, -4.100374, 4, 0, 1.5, 0.5, 0.5
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
-3.657059, -3.594109, -6.143434,
-3.657059, 3.15609, -6.143434,
-3.657059, -3.594109, 5.95525,
-3.657059, 3.15609, 5.95525,
-3.657059, -3.594109, -6.143434,
-3.657059, -3.594109, 5.95525,
-3.657059, 3.15609, -6.143434,
-3.657059, 3.15609, 5.95525,
-3.657059, -3.594109, -6.143434,
3.911741, -3.594109, -6.143434,
-3.657059, -3.594109, 5.95525,
3.911741, -3.594109, 5.95525,
-3.657059, 3.15609, -6.143434,
3.911741, 3.15609, -6.143434,
-3.657059, 3.15609, 5.95525,
3.911741, 3.15609, 5.95525,
3.911741, -3.594109, -6.143434,
3.911741, 3.15609, -6.143434,
3.911741, -3.594109, 5.95525,
3.911741, 3.15609, 5.95525,
3.911741, -3.594109, -6.143434,
3.911741, -3.594109, 5.95525,
3.911741, 3.15609, -6.143434,
3.911741, 3.15609, 5.95525
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
var radius = 8.429964;
var distance = 37.50586;
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
mvMatrix.translate( -0.1273406, 0.2190094, 0.09409189 );
mvMatrix.scale( 1.204239, 1.350277, 0.7533581 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.50586);
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
sulfide_4-chlorophen<-read.table("sulfide_4-chlorophen.xyz", skip=1)
```

```
## Error in sulfide_4 - chlorophen <- read.table("sulfide_4-chlorophen.xyz", : object 'sulfide_4' not found
```

```r
x<-sulfide_4-chlorophen$V2
```

```
## Error in eval(expr, envir, enclos): object 'sulfide_4' not found
```

```r
y<-sulfide_4-chlorophen$V3
```

```
## Error in eval(expr, envir, enclos): object 'sulfide_4' not found
```

```r
z<-sulfide_4-chlorophen$V4
```

```
## Error in eval(expr, envir, enclos): object 'sulfide_4' not found
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
-3.546834, 0.2323287, -0.7442148, 0, 0, 1, 1, 1,
-3.455723, 0.110049, -1.121592, 1, 0, 0, 1, 1,
-3.404184, -0.5583943, -1.089695, 1, 0, 0, 1, 1,
-2.848648, 0.6062849, -0.824405, 1, 0, 0, 1, 1,
-2.764543, -0.2426784, 0.1038398, 1, 0, 0, 1, 1,
-2.72128, 0.7746464, 0.03681899, 1, 0, 0, 1, 1,
-2.608289, -0.189141, -3.013182, 0, 0, 0, 1, 1,
-2.578019, 0.02857152, -2.728217, 0, 0, 0, 1, 1,
-2.470724, 0.5277818, -1.597609, 0, 0, 0, 1, 1,
-2.450146, 1.152774, -0.4753971, 0, 0, 0, 1, 1,
-2.323598, -0.1115798, -1.733063, 0, 0, 0, 1, 1,
-2.250636, 1.466781, 0.2473875, 0, 0, 0, 1, 1,
-2.201251, -1.176693, -2.122666, 0, 0, 0, 1, 1,
-2.197133, 1.080324, -1.895074, 1, 1, 1, 1, 1,
-2.175331, 0.1907489, -0.02086138, 1, 1, 1, 1, 1,
-2.165409, -1.16195, -1.08488, 1, 1, 1, 1, 1,
-2.152832, -0.5107512, -3.239829, 1, 1, 1, 1, 1,
-2.107666, 0.1362226, -2.349932, 1, 1, 1, 1, 1,
-2.104435, 0.07315449, 0.2551702, 1, 1, 1, 1, 1,
-2.103415, -1.130304, -1.3127, 1, 1, 1, 1, 1,
-2.100405, -0.3286212, -2.175354, 1, 1, 1, 1, 1,
-2.098942, 0.8209581, -2.566021, 1, 1, 1, 1, 1,
-2.048478, -1.107012, -3.053559, 1, 1, 1, 1, 1,
-2.023618, 1.104148, -2.04688, 1, 1, 1, 1, 1,
-1.98925, 1.320997, -1.525608, 1, 1, 1, 1, 1,
-1.983672, 1.213081, -2.24465, 1, 1, 1, 1, 1,
-1.960379, 0.9334602, -1.47813, 1, 1, 1, 1, 1,
-1.930229, -0.04884021, -0.9280325, 1, 1, 1, 1, 1,
-1.906091, 0.2606297, -1.343717, 0, 0, 1, 1, 1,
-1.891806, -0.3139635, -1.63019, 1, 0, 0, 1, 1,
-1.874307, 1.096927, -1.167837, 1, 0, 0, 1, 1,
-1.86236, -0.5316183, -0.7646664, 1, 0, 0, 1, 1,
-1.849513, -0.303305, -1.097577, 1, 0, 0, 1, 1,
-1.826448, -1.062565, -2.140508, 1, 0, 0, 1, 1,
-1.800803, 0.317102, -3.536205, 0, 0, 0, 1, 1,
-1.796726, 0.2218522, -3.251347, 0, 0, 0, 1, 1,
-1.791503, -1.026955, -1.889038, 0, 0, 0, 1, 1,
-1.784114, 0.07370277, -0.180098, 0, 0, 0, 1, 1,
-1.781093, -0.3804857, -0.7189755, 0, 0, 0, 1, 1,
-1.776927, 0.2977375, -1.458936, 0, 0, 0, 1, 1,
-1.770897, -0.2159407, -3.095664, 0, 0, 0, 1, 1,
-1.741396, 0.2304738, -2.074851, 1, 1, 1, 1, 1,
-1.714534, -1.212555, -2.817669, 1, 1, 1, 1, 1,
-1.690586, 0.4206536, -1.09465, 1, 1, 1, 1, 1,
-1.679952, -0.2735771, -1.840904, 1, 1, 1, 1, 1,
-1.670652, 0.3173626, -1.56271, 1, 1, 1, 1, 1,
-1.665004, -0.2495346, -2.254036, 1, 1, 1, 1, 1,
-1.663917, -0.4433907, -0.2186253, 1, 1, 1, 1, 1,
-1.658089, 0.7221332, -0.6686419, 1, 1, 1, 1, 1,
-1.645433, -2.406973, -1.520703, 1, 1, 1, 1, 1,
-1.636392, -0.364237, -1.740562, 1, 1, 1, 1, 1,
-1.634656, 0.2395803, -1.811797, 1, 1, 1, 1, 1,
-1.633172, 0.08112227, -0.3191803, 1, 1, 1, 1, 1,
-1.631912, 0.579691, -2.703045, 1, 1, 1, 1, 1,
-1.631757, 0.763509, -0.6353555, 1, 1, 1, 1, 1,
-1.603525, 1.530453, -1.86604, 1, 1, 1, 1, 1,
-1.598774, 0.3387648, -1.01667, 0, 0, 1, 1, 1,
-1.589497, 1.110142, 0.7883691, 1, 0, 0, 1, 1,
-1.582577, -0.9601317, -1.80709, 1, 0, 0, 1, 1,
-1.57085, -0.08717703, -2.00764, 1, 0, 0, 1, 1,
-1.570566, -0.6341927, -1.617639, 1, 0, 0, 1, 1,
-1.562751, -0.06213597, -1.654337, 1, 0, 0, 1, 1,
-1.558182, 1.785682, -1.154393, 0, 0, 0, 1, 1,
-1.556407, -3.002763, -1.675535, 0, 0, 0, 1, 1,
-1.549782, 0.4444278, -0.6488439, 0, 0, 0, 1, 1,
-1.549332, -0.6574203, -1.732654, 0, 0, 0, 1, 1,
-1.536523, 0.1047162, -0.5633416, 0, 0, 0, 1, 1,
-1.52162, -2.129533, -2.42304, 0, 0, 0, 1, 1,
-1.517403, -0.6058881, -2.717199, 0, 0, 0, 1, 1,
-1.512838, -0.2155764, -1.494326, 1, 1, 1, 1, 1,
-1.505682, 0.8940154, -2.173495, 1, 1, 1, 1, 1,
-1.502821, -0.03363575, -2.115879, 1, 1, 1, 1, 1,
-1.495739, 1.657018, -1.039374, 1, 1, 1, 1, 1,
-1.486974, -0.4497827, 0.8265857, 1, 1, 1, 1, 1,
-1.464415, 0.7427981, -0.2062364, 1, 1, 1, 1, 1,
-1.457965, -1.591665, -3.278356, 1, 1, 1, 1, 1,
-1.450263, 0.6593446, -2.955997, 1, 1, 1, 1, 1,
-1.447138, -1.395529, -2.383542, 1, 1, 1, 1, 1,
-1.441819, -0.2756999, -1.765106, 1, 1, 1, 1, 1,
-1.439893, 0.9579673, -1.858599, 1, 1, 1, 1, 1,
-1.434998, -0.1484629, -1.308143, 1, 1, 1, 1, 1,
-1.432634, 0.1997259, -1.79186, 1, 1, 1, 1, 1,
-1.432575, 1.059705, -3.333422, 1, 1, 1, 1, 1,
-1.426521, 0.1659387, -3.146571, 1, 1, 1, 1, 1,
-1.413551, -0.9289302, -2.007365, 0, 0, 1, 1, 1,
-1.406945, -0.7653837, -1.533629, 1, 0, 0, 1, 1,
-1.400175, -0.2394782, -0.2277684, 1, 0, 0, 1, 1,
-1.398906, 0.8750553, -1.666473, 1, 0, 0, 1, 1,
-1.370429, 0.1464537, 0.6473321, 1, 0, 0, 1, 1,
-1.364327, -0.2948053, -2.230959, 1, 0, 0, 1, 1,
-1.359817, 0.09193171, -0.2862508, 0, 0, 0, 1, 1,
-1.352745, -0.1150706, -3.009656, 0, 0, 0, 1, 1,
-1.352612, 0.7656561, -2.101095, 0, 0, 0, 1, 1,
-1.345626, -0.662514, -1.599731, 0, 0, 0, 1, 1,
-1.331029, -0.07003883, -2.847368, 0, 0, 0, 1, 1,
-1.330247, -0.3367799, -1.357632, 0, 0, 0, 1, 1,
-1.324009, -0.1931895, 0.1070313, 0, 0, 0, 1, 1,
-1.307451, -0.9112949, -2.869579, 1, 1, 1, 1, 1,
-1.304083, 1.810209, -1.690042, 1, 1, 1, 1, 1,
-1.302178, 0.5988121, -2.010803, 1, 1, 1, 1, 1,
-1.285751, -0.5745246, -2.755046, 1, 1, 1, 1, 1,
-1.280321, 0.3191583, -1.634313, 1, 1, 1, 1, 1,
-1.264207, -2.210668, -0.7976521, 1, 1, 1, 1, 1,
-1.26299, 0.5823094, -0.6087687, 1, 1, 1, 1, 1,
-1.256063, 0.05350188, -1.210942, 1, 1, 1, 1, 1,
-1.254524, 0.4097295, -2.28932, 1, 1, 1, 1, 1,
-1.234938, 1.244419, -0.5450321, 1, 1, 1, 1, 1,
-1.230743, 0.3221754, -1.169861, 1, 1, 1, 1, 1,
-1.230097, -1.074602, -1.857326, 1, 1, 1, 1, 1,
-1.227943, -0.8738391, -2.214567, 1, 1, 1, 1, 1,
-1.226182, 0.4284581, 1.120414, 1, 1, 1, 1, 1,
-1.2163, -0.7117103, -1.507661, 1, 1, 1, 1, 1,
-1.202276, -1.490339, -2.677138, 0, 0, 1, 1, 1,
-1.198511, -0.3820746, -3.340132, 1, 0, 0, 1, 1,
-1.197415, -0.2087016, -0.8085843, 1, 0, 0, 1, 1,
-1.192722, -0.2337912, -1.865305, 1, 0, 0, 1, 1,
-1.188524, -0.6736111, -2.881491, 1, 0, 0, 1, 1,
-1.18769, 0.4775385, -1.381107, 1, 0, 0, 1, 1,
-1.181123, 0.8403164, -2.321324, 0, 0, 0, 1, 1,
-1.180349, 0.4362925, -0.02589431, 0, 0, 0, 1, 1,
-1.177108, -0.2971047, -1.415994, 0, 0, 0, 1, 1,
-1.167214, 1.701587, -0.8654801, 0, 0, 0, 1, 1,
-1.162333, -0.2256165, -2.112689, 0, 0, 0, 1, 1,
-1.161984, 0.5765674, -1.357034, 0, 0, 0, 1, 1,
-1.16063, -0.6950853, -3.179563, 0, 0, 0, 1, 1,
-1.154588, -0.7951015, -4.178589, 1, 1, 1, 1, 1,
-1.134341, -0.2936264, -2.785226, 1, 1, 1, 1, 1,
-1.1308, -0.487088, -2.358132, 1, 1, 1, 1, 1,
-1.129583, -1.403003, -2.378127, 1, 1, 1, 1, 1,
-1.129435, -1.066719, -0.5807439, 1, 1, 1, 1, 1,
-1.115923, -1.339781, -2.88828, 1, 1, 1, 1, 1,
-1.114891, 0.2736759, -2.10794, 1, 1, 1, 1, 1,
-1.101778, -0.8563591, -0.5363607, 1, 1, 1, 1, 1,
-1.100851, 0.06798244, -3.430781, 1, 1, 1, 1, 1,
-1.098026, -1.033166, -0.6311486, 1, 1, 1, 1, 1,
-1.081908, 1.107537, -1.056297, 1, 1, 1, 1, 1,
-1.073966, -0.01071389, -0.07672597, 1, 1, 1, 1, 1,
-1.065465, -0.2044028, -1.903357, 1, 1, 1, 1, 1,
-1.060229, 1.138147, -1.282765, 1, 1, 1, 1, 1,
-1.059627, 0.4634762, -2.117014, 1, 1, 1, 1, 1,
-1.059386, 1.625091, -1.57107, 0, 0, 1, 1, 1,
-1.058835, 1.363987, 0.6997499, 1, 0, 0, 1, 1,
-1.058729, 1.066754, 0.1930335, 1, 0, 0, 1, 1,
-1.048086, 0.1878437, -1.623545, 1, 0, 0, 1, 1,
-1.046332, 0.1867172, -1.239488, 1, 0, 0, 1, 1,
-1.043339, 1.570893, -0.05867625, 1, 0, 0, 1, 1,
-1.042454, -0.5094349, -2.043287, 0, 0, 0, 1, 1,
-1.038523, -0.366262, -3.184897, 0, 0, 0, 1, 1,
-1.037555, -1.580201, -0.3455308, 0, 0, 0, 1, 1,
-1.03204, 0.5527083, -1.732161, 0, 0, 0, 1, 1,
-1.0285, -0.4034601, -1.859547, 0, 0, 0, 1, 1,
-1.02717, 0.1686193, -0.3917472, 0, 0, 0, 1, 1,
-1.025575, 0.222228, 0.08621635, 0, 0, 0, 1, 1,
-1.022476, -0.2756928, -1.726605, 1, 1, 1, 1, 1,
-1.019243, -1.532787, -1.653666, 1, 1, 1, 1, 1,
-1.012006, 0.01041464, -1.975649, 1, 1, 1, 1, 1,
-1.010585, 0.6186972, -0.9014595, 1, 1, 1, 1, 1,
-1.010048, 0.2079789, 0.5556406, 1, 1, 1, 1, 1,
-1.010002, 0.5235371, -0.5515182, 1, 1, 1, 1, 1,
-1.005788, -1.698347, -2.083428, 1, 1, 1, 1, 1,
-1.005673, -1.745399, -3.643186, 1, 1, 1, 1, 1,
-0.9903062, 1.253586, 0.3102179, 1, 1, 1, 1, 1,
-0.982406, -0.2029546, -0.9955047, 1, 1, 1, 1, 1,
-0.9775018, -0.1965252, -0.9543684, 1, 1, 1, 1, 1,
-0.9774628, -1.307681, -3.411967, 1, 1, 1, 1, 1,
-0.9694778, 1.860313, -1.274603, 1, 1, 1, 1, 1,
-0.9654133, 0.2178651, -2.989793, 1, 1, 1, 1, 1,
-0.956793, 2.226099, 0.1279707, 1, 1, 1, 1, 1,
-0.9559165, 0.9508744, -1.980051, 0, 0, 1, 1, 1,
-0.9541976, -1.001926, -1.802609, 1, 0, 0, 1, 1,
-0.9501234, 0.6883856, -1.419825, 1, 0, 0, 1, 1,
-0.9483583, -0.1155222, -3.264096, 1, 0, 0, 1, 1,
-0.9445134, 0.1916625, -1.379877, 1, 0, 0, 1, 1,
-0.9404667, -0.5266172, -2.437674, 1, 0, 0, 1, 1,
-0.9388213, -0.3095933, -1.709115, 0, 0, 0, 1, 1,
-0.9386482, 1.213421, -0.421631, 0, 0, 0, 1, 1,
-0.9337, 0.5113426, -2.344624, 0, 0, 0, 1, 1,
-0.9314557, 0.9293259, -0.4736138, 0, 0, 0, 1, 1,
-0.9286916, 0.9844375, -0.3060157, 0, 0, 0, 1, 1,
-0.9267153, 0.5039029, -1.025633, 0, 0, 0, 1, 1,
-0.9245111, -1.337245, -1.185197, 0, 0, 0, 1, 1,
-0.9239616, 1.30627, -1.553032, 1, 1, 1, 1, 1,
-0.9208069, -0.5260658, -0.8127154, 1, 1, 1, 1, 1,
-0.909193, -0.4352426, -0.8715534, 1, 1, 1, 1, 1,
-0.908501, -2.69163, -2.592168, 1, 1, 1, 1, 1,
-0.9014186, -0.1509859, 0.5923667, 1, 1, 1, 1, 1,
-0.9010272, 0.2939906, -0.6209779, 1, 1, 1, 1, 1,
-0.900631, -1.346004, -1.627439, 1, 1, 1, 1, 1,
-0.898442, 2.0404, -1.909093, 1, 1, 1, 1, 1,
-0.8980443, -0.01252212, -0.8441479, 1, 1, 1, 1, 1,
-0.896533, 1.248679, -1.121301, 1, 1, 1, 1, 1,
-0.8937487, 0.7547607, -2.150533, 1, 1, 1, 1, 1,
-0.8886807, 1.231405, 1.126215, 1, 1, 1, 1, 1,
-0.886803, -0.1186041, -2.865449, 1, 1, 1, 1, 1,
-0.8859363, 0.783437, -0.8229952, 1, 1, 1, 1, 1,
-0.8845441, -0.681673, -1.589479, 1, 1, 1, 1, 1,
-0.8777769, -1.271283, -1.378244, 0, 0, 1, 1, 1,
-0.8772694, -0.4186736, -1.490758, 1, 0, 0, 1, 1,
-0.8628322, 0.02229251, -1.499764, 1, 0, 0, 1, 1,
-0.8560482, 0.2559843, -0.3156925, 1, 0, 0, 1, 1,
-0.849344, 0.6812482, 0.2466456, 1, 0, 0, 1, 1,
-0.8428183, -1.551044, -3.414041, 1, 0, 0, 1, 1,
-0.8357415, -1.482612, -4.288819, 0, 0, 0, 1, 1,
-0.8335167, 1.178646, 0.7007796, 0, 0, 0, 1, 1,
-0.8332405, -0.4471105, -2.997591, 0, 0, 0, 1, 1,
-0.8328404, 0.8639538, 0.10898, 0, 0, 0, 1, 1,
-0.8245911, -1.443647, -1.881718, 0, 0, 0, 1, 1,
-0.8236573, 1.476848, -0.4113004, 0, 0, 0, 1, 1,
-0.8205593, -0.3836321, -0.7102563, 0, 0, 0, 1, 1,
-0.8137876, 0.7079641, -1.146975, 1, 1, 1, 1, 1,
-0.8078168, 0.4641061, -0.9957992, 1, 1, 1, 1, 1,
-0.8049876, -0.2405823, -0.6471543, 1, 1, 1, 1, 1,
-0.8042897, -0.6627069, -2.18602, 1, 1, 1, 1, 1,
-0.8026531, -0.47907, -1.487882, 1, 1, 1, 1, 1,
-0.8019522, 0.7051178, -0.2410806, 1, 1, 1, 1, 1,
-0.7905664, 0.1753074, -1.191958, 1, 1, 1, 1, 1,
-0.7840511, 0.07028169, -1.191897, 1, 1, 1, 1, 1,
-0.7818676, -1.344495, -2.933283, 1, 1, 1, 1, 1,
-0.7801423, -0.2214355, -1.886641, 1, 1, 1, 1, 1,
-0.7674781, 0.6867664, -1.745857, 1, 1, 1, 1, 1,
-0.7665468, -2.590033, -3.203409, 1, 1, 1, 1, 1,
-0.760267, 0.5236009, -2.906911, 1, 1, 1, 1, 1,
-0.7530131, 1.295856, -0.2670247, 1, 1, 1, 1, 1,
-0.7452343, -0.2731958, -1.012385, 1, 1, 1, 1, 1,
-0.7296988, -0.6201307, -3.910203, 0, 0, 1, 1, 1,
-0.7249457, -2.026486, -0.6597846, 1, 0, 0, 1, 1,
-0.7230687, -0.3153814, -1.855853, 1, 0, 0, 1, 1,
-0.7220575, 0.5131719, -1.554209, 1, 0, 0, 1, 1,
-0.7161406, 0.3777924, -1.367783, 1, 0, 0, 1, 1,
-0.7158945, 1.829681, 0.8729295, 1, 0, 0, 1, 1,
-0.7112367, 1.906085, -0.8311356, 0, 0, 0, 1, 1,
-0.7087522, 0.9913457, -2.104627, 0, 0, 0, 1, 1,
-0.7051343, -0.6983994, -0.9724908, 0, 0, 0, 1, 1,
-0.7039158, -1.245479, -2.899206, 0, 0, 0, 1, 1,
-0.7022103, 1.326817, 0.6085715, 0, 0, 0, 1, 1,
-0.7009926, -0.4888147, -2.373881, 0, 0, 0, 1, 1,
-0.6996953, 0.7223702, 0.2259234, 0, 0, 0, 1, 1,
-0.6950108, -1.111214, -3.588635, 1, 1, 1, 1, 1,
-0.6938071, 0.120754, -0.9611183, 1, 1, 1, 1, 1,
-0.6931257, 2.758662, 0.8974773, 1, 1, 1, 1, 1,
-0.687624, -0.4694538, -0.1753758, 1, 1, 1, 1, 1,
-0.6864763, 0.5227298, -0.8138769, 1, 1, 1, 1, 1,
-0.6847397, -2.116976, -4.797245, 1, 1, 1, 1, 1,
-0.6834946, -0.62087, -2.360529, 1, 1, 1, 1, 1,
-0.6805842, -0.6134912, -0.5757552, 1, 1, 1, 1, 1,
-0.6666422, 1.30205, -1.377491, 1, 1, 1, 1, 1,
-0.6651573, 0.8260046, 0.6183621, 1, 1, 1, 1, 1,
-0.6650953, -0.07235692, -1.222804, 1, 1, 1, 1, 1,
-0.6641934, 0.3270776, -1.50081, 1, 1, 1, 1, 1,
-0.6609231, -0.658664, -0.9300852, 1, 1, 1, 1, 1,
-0.6558657, 0.8403789, -0.7054125, 1, 1, 1, 1, 1,
-0.6552408, -0.5250218, -2.989545, 1, 1, 1, 1, 1,
-0.653965, 1.035301, -1.466192, 0, 0, 1, 1, 1,
-0.6520401, 0.512042, 0.531646, 1, 0, 0, 1, 1,
-0.6399162, 0.439208, 0.9012188, 1, 0, 0, 1, 1,
-0.6395077, 0.0148415, -3.287226, 1, 0, 0, 1, 1,
-0.6360925, -0.6526455, -1.933956, 1, 0, 0, 1, 1,
-0.63288, -0.7013227, -1.809376, 1, 0, 0, 1, 1,
-0.6287889, -0.01149019, -2.198782, 0, 0, 0, 1, 1,
-0.6244777, -0.1621667, -0.1262677, 0, 0, 0, 1, 1,
-0.6229776, -0.3649144, -3.018467, 0, 0, 0, 1, 1,
-0.6143565, -0.6723562, -2.058782, 0, 0, 0, 1, 1,
-0.6122594, -0.5183268, -2.901608, 0, 0, 0, 1, 1,
-0.607111, -0.9199152, -3.919654, 0, 0, 0, 1, 1,
-0.6021958, -1.177135, -4.255203, 0, 0, 0, 1, 1,
-0.6014922, -1.689639, -2.482748, 1, 1, 1, 1, 1,
-0.5975099, -1.112355, -2.361562, 1, 1, 1, 1, 1,
-0.5973549, -0.2033424, -1.360258, 1, 1, 1, 1, 1,
-0.592945, 0.1766168, -0.1804351, 1, 1, 1, 1, 1,
-0.5917954, 1.087122, -1.151408, 1, 1, 1, 1, 1,
-0.5861467, 0.8429039, -1.798305, 1, 1, 1, 1, 1,
-0.5761829, 0.3874952, 0.06378006, 1, 1, 1, 1, 1,
-0.5746214, 0.2283195, 0.1015737, 1, 1, 1, 1, 1,
-0.5702944, -0.5853231, -3.621846, 1, 1, 1, 1, 1,
-0.5689474, 1.966616, 1.566797, 1, 1, 1, 1, 1,
-0.5681484, 0.71759, -1.305303, 1, 1, 1, 1, 1,
-0.566452, -1.154089, -1.972339, 1, 1, 1, 1, 1,
-0.5622464, -0.2264529, -4.037845, 1, 1, 1, 1, 1,
-0.5576285, 0.8097951, -1.406451, 1, 1, 1, 1, 1,
-0.555645, -0.397843, -2.542196, 1, 1, 1, 1, 1,
-0.5516252, 0.6254414, 0.1683414, 0, 0, 1, 1, 1,
-0.5496049, -0.8458037, -3.609921, 1, 0, 0, 1, 1,
-0.5474663, 0.6710427, -0.8523508, 1, 0, 0, 1, 1,
-0.5466847, -0.8989791, -2.381735, 1, 0, 0, 1, 1,
-0.5456556, -0.1057998, -1.688408, 1, 0, 0, 1, 1,
-0.5416535, 0.2493116, -1.070583, 1, 0, 0, 1, 1,
-0.5411954, -0.1138265, -2.401894, 0, 0, 0, 1, 1,
-0.5401925, -0.6775522, -3.012543, 0, 0, 0, 1, 1,
-0.5369023, 0.26138, -0.213734, 0, 0, 0, 1, 1,
-0.5319049, 0.2874511, -1.939567, 0, 0, 0, 1, 1,
-0.5308108, -0.1792821, -0.8785301, 0, 0, 0, 1, 1,
-0.5304328, 0.006648516, -2.380304, 0, 0, 0, 1, 1,
-0.5291398, -1.676482, -3.573022, 0, 0, 0, 1, 1,
-0.5251065, 0.8620908, -0.8643752, 1, 1, 1, 1, 1,
-0.5191883, -0.2876952, 0.1730173, 1, 1, 1, 1, 1,
-0.5139567, 2.623672, 0.2793178, 1, 1, 1, 1, 1,
-0.5139126, -1.830073, -3.05172, 1, 1, 1, 1, 1,
-0.5135042, -0.2082766, -3.61054, 1, 1, 1, 1, 1,
-0.5049055, -1.471972, -2.649227, 1, 1, 1, 1, 1,
-0.5025134, -0.5094061, -0.4699028, 1, 1, 1, 1, 1,
-0.499777, 0.5170362, -2.516211, 1, 1, 1, 1, 1,
-0.4992147, 0.150778, -2.50416, 1, 1, 1, 1, 1,
-0.4973962, -0.06585083, -2.59465, 1, 1, 1, 1, 1,
-0.4928796, 0.5530348, -0.06119005, 1, 1, 1, 1, 1,
-0.4926419, 1.091305, 0.1516287, 1, 1, 1, 1, 1,
-0.4918063, -1.810389, -3.835118, 1, 1, 1, 1, 1,
-0.4914393, 0.696961, -0.2220814, 1, 1, 1, 1, 1,
-0.4910301, 1.139087, 0.3084953, 1, 1, 1, 1, 1,
-0.4900869, -0.2733786, -0.9295171, 0, 0, 1, 1, 1,
-0.4867631, -1.123626, -3.012992, 1, 0, 0, 1, 1,
-0.4844646, 1.693889, 0.1363432, 1, 0, 0, 1, 1,
-0.4837678, -0.8900137, -3.337381, 1, 0, 0, 1, 1,
-0.4833796, -0.3697016, -1.41168, 1, 0, 0, 1, 1,
-0.4824822, -1.774845, -5.520149, 1, 0, 0, 1, 1,
-0.4823503, -1.635926, -3.71946, 0, 0, 0, 1, 1,
-0.4745085, 0.99492, -0.7944229, 0, 0, 0, 1, 1,
-0.4728166, -1.850567, -2.920482, 0, 0, 0, 1, 1,
-0.4706239, 0.1807736, -2.797467, 0, 0, 0, 1, 1,
-0.470106, 0.4161448, -0.8791903, 0, 0, 0, 1, 1,
-0.4695076, 1.17531, -0.9904945, 0, 0, 0, 1, 1,
-0.4657432, 0.05093636, -0.8373547, 0, 0, 0, 1, 1,
-0.4643315, -0.6921688, -1.989683, 1, 1, 1, 1, 1,
-0.4643189, -0.2990744, -2.034266, 1, 1, 1, 1, 1,
-0.4632564, -0.7504127, -4.237888, 1, 1, 1, 1, 1,
-0.4584261, 1.528282, -1.16112, 1, 1, 1, 1, 1,
-0.4552616, 1.69493, 0.4953307, 1, 1, 1, 1, 1,
-0.4513296, 0.1675238, -3.049869, 1, 1, 1, 1, 1,
-0.4481923, 0.6611189, -0.3992272, 1, 1, 1, 1, 1,
-0.4451532, 0.2847961, 0.9400991, 1, 1, 1, 1, 1,
-0.4442205, 0.7711849, 1.021325, 1, 1, 1, 1, 1,
-0.4423815, 0.5960638, -1.661392, 1, 1, 1, 1, 1,
-0.4392963, -0.2735866, -2.379886, 1, 1, 1, 1, 1,
-0.4339128, -0.8951426, -5.371155, 1, 1, 1, 1, 1,
-0.4300919, -1.454979, -2.355459, 1, 1, 1, 1, 1,
-0.4298964, 0.02524627, -1.943333, 1, 1, 1, 1, 1,
-0.4233541, -0.013684, -3.1832, 1, 1, 1, 1, 1,
-0.4187392, -1.01402, -1.776662, 0, 0, 1, 1, 1,
-0.4130079, 0.1076518, -2.258872, 1, 0, 0, 1, 1,
-0.4028537, 1.050396, -1.207616, 1, 0, 0, 1, 1,
-0.4010358, -1.042063, -2.227501, 1, 0, 0, 1, 1,
-0.3973465, -0.7236179, -2.808215, 1, 0, 0, 1, 1,
-0.3973208, -0.1258663, -3.47304, 1, 0, 0, 1, 1,
-0.3903919, -0.4008692, -2.058618, 0, 0, 0, 1, 1,
-0.3867757, 0.6987105, -1.291035, 0, 0, 0, 1, 1,
-0.3856366, -0.5306653, -2.941584, 0, 0, 0, 1, 1,
-0.380089, -2.189008, -2.145888, 0, 0, 0, 1, 1,
-0.3788518, 0.0309076, -0.521843, 0, 0, 0, 1, 1,
-0.3785644, 0.1698981, 0.3143007, 0, 0, 0, 1, 1,
-0.375118, -0.688922, -2.645523, 0, 0, 0, 1, 1,
-0.3704204, -1.954557, -3.179507, 1, 1, 1, 1, 1,
-0.3702135, 1.27826, -0.7435214, 1, 1, 1, 1, 1,
-0.3698765, -0.8175506, -2.787125, 1, 1, 1, 1, 1,
-0.365613, 2.134152, -1.35756, 1, 1, 1, 1, 1,
-0.3631212, -0.4017485, -4.624444, 1, 1, 1, 1, 1,
-0.3620892, -0.3085412, -2.279226, 1, 1, 1, 1, 1,
-0.3617079, 0.3627801, -2.130328, 1, 1, 1, 1, 1,
-0.3610992, 0.451893, -2.606478, 1, 1, 1, 1, 1,
-0.3609208, -0.1530185, -1.370443, 1, 1, 1, 1, 1,
-0.3602587, -0.03839884, -1.379285, 1, 1, 1, 1, 1,
-0.3595245, 0.1059217, -1.99877, 1, 1, 1, 1, 1,
-0.3588332, 1.560615, -0.7510918, 1, 1, 1, 1, 1,
-0.3561808, -2.131023, -3.359873, 1, 1, 1, 1, 1,
-0.3497319, -0.8746065, -2.990219, 1, 1, 1, 1, 1,
-0.3411291, -1.629239, -4.170737, 1, 1, 1, 1, 1,
-0.3408097, 0.3414519, 0.5590141, 0, 0, 1, 1, 1,
-0.3368215, -1.052405, -3.073594, 1, 0, 0, 1, 1,
-0.3339203, 0.1849595, -1.828052, 1, 0, 0, 1, 1,
-0.3309453, 0.05726902, -1.11227, 1, 0, 0, 1, 1,
-0.3281495, 1.391484, 1.120169, 1, 0, 0, 1, 1,
-0.3244456, 0.06241601, -0.1699483, 1, 0, 0, 1, 1,
-0.3243649, 0.3877082, -1.215906, 0, 0, 0, 1, 1,
-0.324095, -0.2826295, -2.035876, 0, 0, 0, 1, 1,
-0.3224334, -0.8692024, -0.8311388, 0, 0, 0, 1, 1,
-0.321961, -0.6622326, -2.984834, 0, 0, 0, 1, 1,
-0.3204184, -0.9091291, -3.31159, 0, 0, 0, 1, 1,
-0.309851, -1.339659, -1.580449, 0, 0, 0, 1, 1,
-0.305668, 1.276756, -1.773899, 0, 0, 0, 1, 1,
-0.3054802, 1.107924, -2.157039, 1, 1, 1, 1, 1,
-0.3025167, 1.098847, -1.579346, 1, 1, 1, 1, 1,
-0.3023325, 1.821013, -1.520296, 1, 1, 1, 1, 1,
-0.2948996, -0.7265287, -3.012043, 1, 1, 1, 1, 1,
-0.2947273, -1.33595, -2.382532, 1, 1, 1, 1, 1,
-0.2946048, 0.008157128, -0.5913245, 1, 1, 1, 1, 1,
-0.2921785, -0.2804347, -2.943285, 1, 1, 1, 1, 1,
-0.2905604, 0.04157307, -1.674636, 1, 1, 1, 1, 1,
-0.2874453, 0.6832028, -0.5559022, 1, 1, 1, 1, 1,
-0.2724498, -0.2308379, -4.34043, 1, 1, 1, 1, 1,
-0.2701996, -1.666073, -2.396219, 1, 1, 1, 1, 1,
-0.2687276, 1.253426, -0.5308628, 1, 1, 1, 1, 1,
-0.2667532, 1.436177, -0.7397115, 1, 1, 1, 1, 1,
-0.2640122, 0.4552996, -0.5505555, 1, 1, 1, 1, 1,
-0.2639049, -0.1149202, -0.7658638, 1, 1, 1, 1, 1,
-0.2607809, 0.6116294, -1.090253, 0, 0, 1, 1, 1,
-0.2600348, -0.9218356, -2.141899, 1, 0, 0, 1, 1,
-0.2596349, -1.180922, -3.217595, 1, 0, 0, 1, 1,
-0.2587575, -1.158111, -1.613196, 1, 0, 0, 1, 1,
-0.2586583, 0.4559037, -0.207264, 1, 0, 0, 1, 1,
-0.2579084, 0.1229805, -0.6429028, 1, 0, 0, 1, 1,
-0.2556866, 1.209345, -0.0728924, 0, 0, 0, 1, 1,
-0.2554912, -0.6886365, -2.155985, 0, 0, 0, 1, 1,
-0.2554393, -0.5934724, -3.753271, 0, 0, 0, 1, 1,
-0.2545185, -0.1208443, -1.147082, 0, 0, 0, 1, 1,
-0.2540261, 0.6182231, -0.9323639, 0, 0, 0, 1, 1,
-0.2491129, -0.553733, -2.448725, 0, 0, 0, 1, 1,
-0.2484162, -0.8020012, -2.280947, 0, 0, 0, 1, 1,
-0.2454653, 0.4941006, -0.0465236, 1, 1, 1, 1, 1,
-0.2448253, -0.3678193, -2.668354, 1, 1, 1, 1, 1,
-0.2446855, 1.219438, -0.6069369, 1, 1, 1, 1, 1,
-0.2427001, -0.03649777, -1.093903, 1, 1, 1, 1, 1,
-0.2415728, -0.9714071, -2.912616, 1, 1, 1, 1, 1,
-0.2404616, 0.601029, -1.762921, 1, 1, 1, 1, 1,
-0.2404131, -2.250641, -5.079691, 1, 1, 1, 1, 1,
-0.2389879, 0.06828354, -1.562448, 1, 1, 1, 1, 1,
-0.2377624, 0.851569, -0.7206559, 1, 1, 1, 1, 1,
-0.2370266, 0.8635598, -0.9338538, 1, 1, 1, 1, 1,
-0.2310351, 0.5068851, -0.6473554, 1, 1, 1, 1, 1,
-0.2299708, 0.2556412, -0.5871805, 1, 1, 1, 1, 1,
-0.2287738, -1.074471, -0.7399145, 1, 1, 1, 1, 1,
-0.2286955, 1.135119, 0.5394853, 1, 1, 1, 1, 1,
-0.2273211, -1.708386, -3.666315, 1, 1, 1, 1, 1,
-0.227218, -0.8441542, -1.98619, 0, 0, 1, 1, 1,
-0.2228241, 0.1105509, -2.041871, 1, 0, 0, 1, 1,
-0.2175931, -0.5580151, -3.300043, 1, 0, 0, 1, 1,
-0.2144823, 0.6620302, -1.210753, 1, 0, 0, 1, 1,
-0.2103994, 0.1690718, -0.6562642, 1, 0, 0, 1, 1,
-0.205324, 0.01011001, -1.823875, 1, 0, 0, 1, 1,
-0.2050181, -0.5825675, -3.044662, 0, 0, 0, 1, 1,
-0.2041404, -0.446528, -0.6250769, 0, 0, 0, 1, 1,
-0.2007114, -0.3117619, -1.627037, 0, 0, 0, 1, 1,
-0.1969994, 0.7284928, -0.2668225, 0, 0, 0, 1, 1,
-0.1955572, 1.548449, 0.02894862, 0, 0, 0, 1, 1,
-0.193414, -0.2244999, 0.993408, 0, 0, 0, 1, 1,
-0.1878703, 0.5404655, -1.194843, 0, 0, 0, 1, 1,
-0.1856125, -0.7802604, -1.394053, 1, 1, 1, 1, 1,
-0.1841589, 0.0739885, -1.966202, 1, 1, 1, 1, 1,
-0.1833083, -1.131167, -2.445823, 1, 1, 1, 1, 1,
-0.1816908, 1.503505, 0.1447423, 1, 1, 1, 1, 1,
-0.1816786, -0.5268351, -2.714991, 1, 1, 1, 1, 1,
-0.178843, -0.9618221, -3.208653, 1, 1, 1, 1, 1,
-0.1766346, -0.4675888, -2.3334, 1, 1, 1, 1, 1,
-0.1758589, 1.134974, 0.7702197, 1, 1, 1, 1, 1,
-0.1757548, 0.4226824, 0.5828875, 1, 1, 1, 1, 1,
-0.1742368, 0.8398078, -0.7432612, 1, 1, 1, 1, 1,
-0.1652316, 0.007252207, -2.722062, 1, 1, 1, 1, 1,
-0.1601551, -0.5480609, -3.081911, 1, 1, 1, 1, 1,
-0.1593581, 0.2345998, -0.5128092, 1, 1, 1, 1, 1,
-0.1588177, 1.076739, 1.891968, 1, 1, 1, 1, 1,
-0.1551898, -0.5799353, -1.968654, 1, 1, 1, 1, 1,
-0.1466233, -0.1575717, -1.277257, 0, 0, 1, 1, 1,
-0.1402274, 0.1442804, -1.198229, 1, 0, 0, 1, 1,
-0.1381869, -0.4970388, -4.047896, 1, 0, 0, 1, 1,
-0.1375594, -0.7464188, -2.221836, 1, 0, 0, 1, 1,
-0.134171, -0.3021839, -1.986268, 1, 0, 0, 1, 1,
-0.1339236, 1.422468, 1.084962, 1, 0, 0, 1, 1,
-0.1323066, 0.4822969, -1.397196, 0, 0, 0, 1, 1,
-0.1265387, 0.9391721, -0.2216507, 0, 0, 0, 1, 1,
-0.1243702, 0.1133291, -0.642067, 0, 0, 0, 1, 1,
-0.1240719, 0.7466198, -0.2702017, 0, 0, 0, 1, 1,
-0.115938, 1.078113, -0.9047378, 0, 0, 0, 1, 1,
-0.1118306, -0.8944976, -4.558456, 0, 0, 0, 1, 1,
-0.1073551, -0.02087627, -0.5504937, 0, 0, 0, 1, 1,
-0.1071118, 0.402018, -0.1212011, 1, 1, 1, 1, 1,
-0.1055208, -0.3636548, -1.923543, 1, 1, 1, 1, 1,
-0.1019899, 0.588273, 0.9353012, 1, 1, 1, 1, 1,
-0.09472117, -1.292692, -3.625841, 1, 1, 1, 1, 1,
-0.09086148, 1.308526, -0.2402499, 1, 1, 1, 1, 1,
-0.09066204, -1.259342, -3.338234, 1, 1, 1, 1, 1,
-0.0874291, 0.3193716, -0.7994859, 1, 1, 1, 1, 1,
-0.08247636, -1.00151, -3.507793, 1, 1, 1, 1, 1,
-0.07929359, -0.4460377, -2.711035, 1, 1, 1, 1, 1,
-0.07382728, -0.09719174, -1.863596, 1, 1, 1, 1, 1,
-0.07323776, 0.8049611, -1.45066, 1, 1, 1, 1, 1,
-0.07125832, 0.3674508, -0.2870826, 1, 1, 1, 1, 1,
-0.07032956, 0.4702956, -0.3047598, 1, 1, 1, 1, 1,
-0.06455969, 0.3609199, -0.2685174, 1, 1, 1, 1, 1,
-0.06237902, -0.8565647, -3.938, 1, 1, 1, 1, 1,
-0.06031106, 0.7501488, 0.8696368, 0, 0, 1, 1, 1,
-0.05792313, 1.040932, 0.8253041, 1, 0, 0, 1, 1,
-0.05429953, 0.3209326, -0.521432, 1, 0, 0, 1, 1,
-0.05391891, -1.939579, -4.441863, 1, 0, 0, 1, 1,
-0.05218156, -0.3680365, -2.654157, 1, 0, 0, 1, 1,
-0.05064509, -1.393148, -3.700145, 1, 0, 0, 1, 1,
-0.04823954, -1.347976, -1.306569, 0, 0, 0, 1, 1,
-0.04723761, 0.5127826, 1.088585, 0, 0, 0, 1, 1,
-0.04386534, -0.5162933, -1.549335, 0, 0, 0, 1, 1,
-0.04249304, -0.4936903, -4.398527, 0, 0, 0, 1, 1,
-0.04108829, -0.2130229, -5.967239, 0, 0, 0, 1, 1,
-0.03978794, 0.04254708, -3.395751, 0, 0, 0, 1, 1,
-0.03701806, 0.0307108, -1.619259, 0, 0, 0, 1, 1,
-0.03559937, 0.7674456, -0.111577, 1, 1, 1, 1, 1,
-0.03367824, -1.804254, -3.335042, 1, 1, 1, 1, 1,
-0.03131948, 0.8321789, 0.3104392, 1, 1, 1, 1, 1,
-0.03082982, -0.2342559, -2.032357, 1, 1, 1, 1, 1,
-0.02264452, -0.6075363, -2.928131, 1, 1, 1, 1, 1,
-0.01870011, 1.931851, -0.2054068, 1, 1, 1, 1, 1,
-0.01736459, -0.4474194, -2.122785, 1, 1, 1, 1, 1,
-0.01049329, 0.9454261, -0.06890646, 1, 1, 1, 1, 1,
-0.002553948, 0.007775926, -0.2216887, 1, 1, 1, 1, 1,
-0.001678685, 0.9025213, -0.4700514, 1, 1, 1, 1, 1,
-0.0004104291, 1.473476, -0.5224657, 1, 1, 1, 1, 1,
0.001419566, -0.6676938, 3.587352, 1, 1, 1, 1, 1,
0.003908763, 1.347844, -2.032958, 1, 1, 1, 1, 1,
0.004246463, -0.4179181, 3.1638, 1, 1, 1, 1, 1,
0.006653102, -0.1607718, 1.988472, 1, 1, 1, 1, 1,
0.009197798, 0.8876423, 0.2828707, 0, 0, 1, 1, 1,
0.01507909, 0.1585288, -0.1609159, 1, 0, 0, 1, 1,
0.01784373, 0.1615091, -1.596171, 1, 0, 0, 1, 1,
0.02438013, 0.8713009, -0.1834514, 1, 0, 0, 1, 1,
0.0259013, -0.4103349, 2.110294, 1, 0, 0, 1, 1,
0.03347218, 0.09491225, -1.639734, 1, 0, 0, 1, 1,
0.03352482, 0.1596209, 0.6378868, 0, 0, 0, 1, 1,
0.03429695, -0.2475728, 2.740583, 0, 0, 0, 1, 1,
0.04112076, -1.45738, 3.895757, 0, 0, 0, 1, 1,
0.04210432, -0.1314194, 3.045835, 0, 0, 0, 1, 1,
0.04287683, 0.4664353, -0.7306561, 0, 0, 0, 1, 1,
0.04311082, -0.7660529, 3.577622, 0, 0, 0, 1, 1,
0.0433952, -0.5816252, 5.736641, 0, 0, 0, 1, 1,
0.04888398, -1.784158, 2.79053, 1, 1, 1, 1, 1,
0.05140808, 0.4326783, -1.287838, 1, 1, 1, 1, 1,
0.05147443, 0.6739632, -1.508853, 1, 1, 1, 1, 1,
0.0525001, 2.316686, 1.942014, 1, 1, 1, 1, 1,
0.05905619, -1.373275, 3.442559, 1, 1, 1, 1, 1,
0.06147079, -0.5347211, 2.665864, 1, 1, 1, 1, 1,
0.0660987, 0.6697618, -0.5177431, 1, 1, 1, 1, 1,
0.06648887, -1.604189, 3.387564, 1, 1, 1, 1, 1,
0.06649784, 0.1222493, 1.622341, 1, 1, 1, 1, 1,
0.07131384, 1.12728, -0.3719172, 1, 1, 1, 1, 1,
0.0783598, 0.1424232, -0.1417034, 1, 1, 1, 1, 1,
0.07913643, -1.383846, 2.438522, 1, 1, 1, 1, 1,
0.08472277, 0.1828106, 0.04308614, 1, 1, 1, 1, 1,
0.08780292, -0.9966585, 2.881711, 1, 1, 1, 1, 1,
0.09439534, -1.088795, 4.624909, 1, 1, 1, 1, 1,
0.09462953, -1.343294, 2.435356, 0, 0, 1, 1, 1,
0.0996987, -0.3475661, 2.803258, 1, 0, 0, 1, 1,
0.1040093, 0.3517931, 0.03790832, 1, 0, 0, 1, 1,
0.1068354, 1.166739, 0.1879949, 1, 0, 0, 1, 1,
0.1096841, -0.995772, 3.748085, 1, 0, 0, 1, 1,
0.112493, -0.5408589, 4.304651, 1, 0, 0, 1, 1,
0.1154691, 1.072052, -1.999168, 0, 0, 0, 1, 1,
0.120094, 0.9165009, 0.4110575, 0, 0, 0, 1, 1,
0.1279107, 0.7942589, -0.9397291, 0, 0, 0, 1, 1,
0.1352353, 0.4712999, -0.4159082, 0, 0, 0, 1, 1,
0.1360709, 0.4902355, 0.06026836, 0, 0, 0, 1, 1,
0.1417969, -0.1458419, 1.256623, 0, 0, 0, 1, 1,
0.1428598, -0.8062537, 1.20055, 0, 0, 0, 1, 1,
0.1438822, -0.01123491, 2.763373, 1, 1, 1, 1, 1,
0.1458087, 0.5867534, 0.6727221, 1, 1, 1, 1, 1,
0.1481513, 0.3623624, 0.8565048, 1, 1, 1, 1, 1,
0.1484075, 0.128988, -1.177163, 1, 1, 1, 1, 1,
0.1529589, -1.534894, 4.005095, 1, 1, 1, 1, 1,
0.1544993, -0.7963884, 2.686885, 1, 1, 1, 1, 1,
0.1682862, -0.7495728, 3.001567, 1, 1, 1, 1, 1,
0.1733857, 1.043187, -1.4067, 1, 1, 1, 1, 1,
0.1762387, -0.4688534, 1.806437, 1, 1, 1, 1, 1,
0.1778432, 1.254922, -0.7577453, 1, 1, 1, 1, 1,
0.1802206, -1.001621, 3.585071, 1, 1, 1, 1, 1,
0.181389, 0.2367037, -0.1976759, 1, 1, 1, 1, 1,
0.1819709, -0.5918447, 2.066087, 1, 1, 1, 1, 1,
0.1831878, -0.1744728, 2.359266, 1, 1, 1, 1, 1,
0.1844084, -2.278002, 3.833958, 1, 1, 1, 1, 1,
0.1866973, 0.1502791, 1.061103, 0, 0, 1, 1, 1,
0.1883411, 0.8513089, 0.8226334, 1, 0, 0, 1, 1,
0.1888954, 0.9571121, 0.2360158, 1, 0, 0, 1, 1,
0.1916204, -0.2537184, 1.453359, 1, 0, 0, 1, 1,
0.1921751, 2.107547, -1.408724, 1, 0, 0, 1, 1,
0.1939737, -1.324572, 3.074416, 1, 0, 0, 1, 1,
0.195524, 0.2552639, -1.308231, 0, 0, 0, 1, 1,
0.1988873, -1.400134, 3.080161, 0, 0, 0, 1, 1,
0.2003236, -1.07912, 3.166827, 0, 0, 0, 1, 1,
0.2024963, -2.383714, 2.092726, 0, 0, 0, 1, 1,
0.2062773, 0.6032801, 1.31275, 0, 0, 0, 1, 1,
0.2068941, -1.471929, 2.814086, 0, 0, 0, 1, 1,
0.2080953, 0.7136804, -0.4453926, 0, 0, 0, 1, 1,
0.2098285, -0.925707, 2.420676, 1, 1, 1, 1, 1,
0.2104262, 0.4404236, 0.2328974, 1, 1, 1, 1, 1,
0.2184498, 0.02152486, 1.909312, 1, 1, 1, 1, 1,
0.2186276, -0.1245775, 3.031775, 1, 1, 1, 1, 1,
0.2199392, 0.3963774, 1.155444, 1, 1, 1, 1, 1,
0.2227214, 0.8459327, 0.1082905, 1, 1, 1, 1, 1,
0.2231344, -1.337563, 2.15985, 1, 1, 1, 1, 1,
0.2242463, -0.4886478, 3.473606, 1, 1, 1, 1, 1,
0.226681, -0.8583165, 2.930375, 1, 1, 1, 1, 1,
0.229173, -0.4124148, 2.826092, 1, 1, 1, 1, 1,
0.2306838, -1.773484, 1.164069, 1, 1, 1, 1, 1,
0.2321775, -0.1846561, 2.667385, 1, 1, 1, 1, 1,
0.2336545, 0.3582318, 1.584921, 1, 1, 1, 1, 1,
0.2343445, -0.4230197, 4.205381, 1, 1, 1, 1, 1,
0.2344545, -0.9351781, 1.452206, 1, 1, 1, 1, 1,
0.2347166, -2.508202, 3.090708, 0, 0, 1, 1, 1,
0.2347915, 0.01379198, 1.628985, 1, 0, 0, 1, 1,
0.2355526, -0.8234875, 0.499575, 1, 0, 0, 1, 1,
0.24088, 0.4181777, 0.2307106, 1, 0, 0, 1, 1,
0.2410879, 1.661807, -0.6860286, 1, 0, 0, 1, 1,
0.2460809, 0.516305, -0.1681823, 1, 0, 0, 1, 1,
0.2475426, -0.6030603, 1.8001, 0, 0, 0, 1, 1,
0.2475828, 0.7726999, -0.8298105, 0, 0, 0, 1, 1,
0.2600608, 0.8491688, -0.4952867, 0, 0, 0, 1, 1,
0.2724314, 0.5146483, 0.8720401, 0, 0, 0, 1, 1,
0.2781752, 0.11238, 1.522861, 0, 0, 0, 1, 1,
0.2835505, -0.1765625, 1.720843, 0, 0, 0, 1, 1,
0.2861286, -1.371672, 3.091004, 0, 0, 0, 1, 1,
0.2878482, -0.5341657, 2.74402, 1, 1, 1, 1, 1,
0.2894507, -0.3563165, 3.731514, 1, 1, 1, 1, 1,
0.2896567, 0.8988768, 1.134346, 1, 1, 1, 1, 1,
0.2972791, 0.7852705, -0.07448905, 1, 1, 1, 1, 1,
0.2983141, 0.6013116, -2.022747, 1, 1, 1, 1, 1,
0.3037211, -1.3798, 4.700882, 1, 1, 1, 1, 1,
0.3065319, -0.06693417, 1.768668, 1, 1, 1, 1, 1,
0.3109311, -1.984537, 3.476507, 1, 1, 1, 1, 1,
0.3185063, 0.7826369, 0.03502107, 1, 1, 1, 1, 1,
0.3218445, 0.4232652, 0.4214112, 1, 1, 1, 1, 1,
0.3223798, -3.186839, 2.130891, 1, 1, 1, 1, 1,
0.3223862, 0.1554825, 2.640713, 1, 1, 1, 1, 1,
0.3226199, 1.425458, -0.1943626, 1, 1, 1, 1, 1,
0.3244254, -0.6981961, 2.735098, 1, 1, 1, 1, 1,
0.3329515, 0.5132, -1.13156, 1, 1, 1, 1, 1,
0.3365118, -0.4449092, 2.287653, 0, 0, 1, 1, 1,
0.3368859, 0.9647756, -0.6544577, 1, 0, 0, 1, 1,
0.3372912, 0.283982, 0.2720873, 1, 0, 0, 1, 1,
0.3387885, 0.18039, 1.255995, 1, 0, 0, 1, 1,
0.339279, 0.9731051, 1.340607, 1, 0, 0, 1, 1,
0.3429938, 0.739652, -2.084851, 1, 0, 0, 1, 1,
0.343369, -0.0368644, 0.7638474, 0, 0, 0, 1, 1,
0.3450294, -1.126514, 3.264339, 0, 0, 0, 1, 1,
0.3540305, 0.09984609, 1.706513, 0, 0, 0, 1, 1,
0.3568699, 0.3591306, 0.8574058, 0, 0, 0, 1, 1,
0.3637152, -0.7627069, 1.912775, 0, 0, 0, 1, 1,
0.3638057, 0.209049, 1.27507, 0, 0, 0, 1, 1,
0.3639494, -0.1179715, 0.1130948, 0, 0, 0, 1, 1,
0.366282, -0.2982441, 1.637074, 1, 1, 1, 1, 1,
0.3689375, -0.7456578, 3.663106, 1, 1, 1, 1, 1,
0.3692707, 0.3603339, 0.7978309, 1, 1, 1, 1, 1,
0.3733133, 0.4123958, -0.2702282, 1, 1, 1, 1, 1,
0.3756324, 0.8868933, 0.382793, 1, 1, 1, 1, 1,
0.376788, 0.07387207, 0.4695891, 1, 1, 1, 1, 1,
0.377645, -1.031087, 3.56237, 1, 1, 1, 1, 1,
0.3799033, -0.6804653, 2.496757, 1, 1, 1, 1, 1,
0.3820298, -0.5460778, 3.884434, 1, 1, 1, 1, 1,
0.3822009, 0.07328249, 1.813451, 1, 1, 1, 1, 1,
0.382569, 0.9523982, 1.091355, 1, 1, 1, 1, 1,
0.38429, -1.101925, 1.894775, 1, 1, 1, 1, 1,
0.3856002, 0.3641403, 0.8900258, 1, 1, 1, 1, 1,
0.3884912, -0.3522733, 1.477555, 1, 1, 1, 1, 1,
0.3899496, -1.076621, 3.231445, 1, 1, 1, 1, 1,
0.3961013, 2.048928, 1.036568, 0, 0, 1, 1, 1,
0.3965487, 0.3862406, 1.820446, 1, 0, 0, 1, 1,
0.3974976, 0.3592691, 1.391501, 1, 0, 0, 1, 1,
0.4024982, -1.009228, 1.79259, 1, 0, 0, 1, 1,
0.4057918, -0.5506877, 2.8386, 1, 0, 0, 1, 1,
0.4064162, 0.7977848, 2.331276, 1, 0, 0, 1, 1,
0.4077698, 0.6805798, 1.436316, 0, 0, 0, 1, 1,
0.4110326, -0.6274285, 3.086019, 0, 0, 0, 1, 1,
0.4216186, 1.041727, 0.4913307, 0, 0, 0, 1, 1,
0.4241649, 0.7418716, 1.458981, 0, 0, 0, 1, 1,
0.4274952, -0.5560638, 0.707971, 0, 0, 0, 1, 1,
0.4285701, 1.261566, 1.045924, 0, 0, 0, 1, 1,
0.4295928, -0.5598379, 3.082747, 0, 0, 0, 1, 1,
0.4353086, -0.1878356, 2.974813, 1, 1, 1, 1, 1,
0.4365844, -0.1805758, 2.31657, 1, 1, 1, 1, 1,
0.4389096, 0.5666062, 2.236301, 1, 1, 1, 1, 1,
0.4449506, -0.1854999, 1.201005, 1, 1, 1, 1, 1,
0.4479802, -0.2988103, 3.748831, 1, 1, 1, 1, 1,
0.4483158, 0.1186715, 2.118769, 1, 1, 1, 1, 1,
0.4486309, -1.053016, 2.654067, 1, 1, 1, 1, 1,
0.4490229, -0.301897, 0.6734871, 1, 1, 1, 1, 1,
0.4497291, 0.602706, 0.4149937, 1, 1, 1, 1, 1,
0.4503025, -0.222994, 2.552182, 1, 1, 1, 1, 1,
0.4508516, -2.200951, 3.154288, 1, 1, 1, 1, 1,
0.4529712, -1.467738, 0.3029324, 1, 1, 1, 1, 1,
0.453371, -0.7094487, 2.51311, 1, 1, 1, 1, 1,
0.4559195, 0.09464735, 1.13031, 1, 1, 1, 1, 1,
0.4562193, -0.3014299, 2.298125, 1, 1, 1, 1, 1,
0.4575437, -0.579171, 0.1876789, 0, 0, 1, 1, 1,
0.4581905, 1.323513, 0.3263551, 1, 0, 0, 1, 1,
0.4638746, 0.3203038, 1.007016, 1, 0, 0, 1, 1,
0.465345, -0.7905782, 4.167576, 1, 0, 0, 1, 1,
0.4677024, 0.2660408, 0.3890186, 1, 0, 0, 1, 1,
0.4687594, -1.098171, 3.729957, 1, 0, 0, 1, 1,
0.4692185, 0.5752444, 0.4363779, 0, 0, 0, 1, 1,
0.4708309, 0.1544621, 0.994554, 0, 0, 0, 1, 1,
0.4737983, -0.3322796, 3.086497, 0, 0, 0, 1, 1,
0.4738109, 1.562883, -0.3263458, 0, 0, 0, 1, 1,
0.4739985, -3.45644, 3.118793, 0, 0, 0, 1, 1,
0.4803384, -0.9997022, 2.764121, 0, 0, 0, 1, 1,
0.4845335, 1.013285, 0.05009732, 0, 0, 0, 1, 1,
0.4883435, 0.4635426, 1.284648, 1, 1, 1, 1, 1,
0.4901428, -1.025479, 2.887709, 1, 1, 1, 1, 1,
0.4920696, 0.159561, 2.923087, 1, 1, 1, 1, 1,
0.4963838, -0.5776432, 4.69978, 1, 1, 1, 1, 1,
0.4964156, -0.7764289, 2.244737, 1, 1, 1, 1, 1,
0.4976569, -0.8035567, 3.475201, 1, 1, 1, 1, 1,
0.4980547, 0.1061989, 4.159097, 1, 1, 1, 1, 1,
0.4997894, -0.321742, 0.9536306, 1, 1, 1, 1, 1,
0.5003676, 1.420799, 1.580354, 1, 1, 1, 1, 1,
0.5028695, -0.4299553, 1.340626, 1, 1, 1, 1, 1,
0.5054992, -1.98726, 3.458899, 1, 1, 1, 1, 1,
0.5062034, 0.06399459, 0.9467574, 1, 1, 1, 1, 1,
0.5101086, -1.299859, 1.191668, 1, 1, 1, 1, 1,
0.5119672, -1.023104, 4.677482, 1, 1, 1, 1, 1,
0.5150051, 0.07157006, 2.813205, 1, 1, 1, 1, 1,
0.5221752, -0.03344514, 0.256988, 0, 0, 1, 1, 1,
0.5303367, 2.407276, -0.7086405, 1, 0, 0, 1, 1,
0.5342762, -0.08769483, 0.5900298, 1, 0, 0, 1, 1,
0.5363178, 0.04925613, 2.511408, 1, 0, 0, 1, 1,
0.5367059, 1.377344, 0.4925177, 1, 0, 0, 1, 1,
0.5391622, 0.9327038, 0.2695082, 1, 0, 0, 1, 1,
0.5426538, 0.04257533, 0.4274148, 0, 0, 0, 1, 1,
0.545584, -1.168705, 1.322433, 0, 0, 0, 1, 1,
0.5518858, 1.096432, 0.9186362, 0, 0, 0, 1, 1,
0.5519536, -0.2964109, 3.131287, 0, 0, 0, 1, 1,
0.5524615, 0.1886383, 1.446845, 0, 0, 0, 1, 1,
0.5538178, -1.690777, 2.261334, 0, 0, 0, 1, 1,
0.5578892, 0.02218996, 1.021847, 0, 0, 0, 1, 1,
0.5614132, 0.2668339, 0.2233285, 1, 1, 1, 1, 1,
0.5685677, -0.1889089, 1.754521, 1, 1, 1, 1, 1,
0.5761678, -0.5710647, 2.540752, 1, 1, 1, 1, 1,
0.5767519, 2.92145, -2.369193, 1, 1, 1, 1, 1,
0.579214, 1.203889, 0.4830101, 1, 1, 1, 1, 1,
0.5821023, -1.844762, 5.779056, 1, 1, 1, 1, 1,
0.5836824, -0.8374206, 0.6729619, 1, 1, 1, 1, 1,
0.5893574, -2.483517, 2.906551, 1, 1, 1, 1, 1,
0.5911505, 0.188509, 1.95721, 1, 1, 1, 1, 1,
0.5988787, 1.862625, 0.3869669, 1, 1, 1, 1, 1,
0.5996839, 0.6980308, -0.9463254, 1, 1, 1, 1, 1,
0.6011353, 0.1017987, 2.009366, 1, 1, 1, 1, 1,
0.6033731, 2.266204, -1.355612, 1, 1, 1, 1, 1,
0.604854, 0.8251543, 1.318676, 1, 1, 1, 1, 1,
0.6193811, -0.08301499, 2.13029, 1, 1, 1, 1, 1,
0.6194009, 0.6333318, 0.8052939, 0, 0, 1, 1, 1,
0.6200374, -0.4552174, 2.702776, 1, 0, 0, 1, 1,
0.6200856, -1.681757, 3.274527, 1, 0, 0, 1, 1,
0.6283008, -0.7625527, 4.189728, 1, 0, 0, 1, 1,
0.6370164, -0.3398132, 3.227118, 1, 0, 0, 1, 1,
0.6375149, -1.01248, 1.703452, 1, 0, 0, 1, 1,
0.6411906, 0.1037691, 2.06065, 0, 0, 0, 1, 1,
0.6447704, -0.6293764, 1.923959, 0, 0, 0, 1, 1,
0.6522959, -1.488792, 3.131174, 0, 0, 0, 1, 1,
0.6558601, -1.013055, 2.586054, 0, 0, 0, 1, 1,
0.6563195, 0.5780447, 2.112949, 0, 0, 0, 1, 1,
0.6582131, 0.7090151, 2.014786, 0, 0, 0, 1, 1,
0.6610122, 3.057787, 1.572231, 0, 0, 0, 1, 1,
0.6630028, 1.782146, 2.219435, 1, 1, 1, 1, 1,
0.6660287, -1.002611, 2.171223, 1, 1, 1, 1, 1,
0.6736506, -0.7849762, 3.505259, 1, 1, 1, 1, 1,
0.6738043, -1.284533, 3.023041, 1, 1, 1, 1, 1,
0.6771755, -0.9158034, 3.801491, 1, 1, 1, 1, 1,
0.678614, 1.173605, -0.337946, 1, 1, 1, 1, 1,
0.6874306, -0.07553686, 1.730054, 1, 1, 1, 1, 1,
0.6879773, -1.774222, 2.050517, 1, 1, 1, 1, 1,
0.6909069, 0.1886619, 1.417998, 1, 1, 1, 1, 1,
0.691108, 0.240397, -0.3911681, 1, 1, 1, 1, 1,
0.6982343, 1.931628, -1.758196, 1, 1, 1, 1, 1,
0.7023127, 0.5885503, 1.678888, 1, 1, 1, 1, 1,
0.7043903, -1.36403, 2.886025, 1, 1, 1, 1, 1,
0.7057276, 2.456645, -0.2938876, 1, 1, 1, 1, 1,
0.7057913, 1.612435, -0.06641071, 1, 1, 1, 1, 1,
0.7105641, 0.1917989, 1.692693, 0, 0, 1, 1, 1,
0.7197021, 0.2961471, 1.756922, 1, 0, 0, 1, 1,
0.7258024, 1.183291, 1.354405, 1, 0, 0, 1, 1,
0.7272905, -1.129263, 3.442621, 1, 0, 0, 1, 1,
0.7292902, -1.653935, 1.985788, 1, 0, 0, 1, 1,
0.729809, -0.2465026, 3.194494, 1, 0, 0, 1, 1,
0.7309952, 1.011031, 1.671376, 0, 0, 0, 1, 1,
0.7326696, -1.852203, 0.3536167, 0, 0, 0, 1, 1,
0.7345922, -0.5850468, 0.5065897, 0, 0, 0, 1, 1,
0.7381245, 1.900958, -0.1788898, 0, 0, 0, 1, 1,
0.7381272, -0.03911333, 1.477872, 0, 0, 0, 1, 1,
0.740752, -0.5833305, 3.005067, 0, 0, 0, 1, 1,
0.7411886, -0.09429918, 1.663246, 0, 0, 0, 1, 1,
0.7413648, 1.030217, 0.3065988, 1, 1, 1, 1, 1,
0.7416487, -1.072705, 1.831528, 1, 1, 1, 1, 1,
0.7441537, 1.107914, -1.297334, 1, 1, 1, 1, 1,
0.7471204, 0.4334373, 2.098522, 1, 1, 1, 1, 1,
0.7563703, -1.12978, 3.586684, 1, 1, 1, 1, 1,
0.7597401, 0.2692255, 1.231329, 1, 1, 1, 1, 1,
0.7598374, 1.209199, 0.6395574, 1, 1, 1, 1, 1,
0.7609954, 3.004656, -0.6119667, 1, 1, 1, 1, 1,
0.7662542, 0.9544775, -0.3345562, 1, 1, 1, 1, 1,
0.7665079, -1.827795, 2.569516, 1, 1, 1, 1, 1,
0.7689318, -0.04461638, 1.033651, 1, 1, 1, 1, 1,
0.7727971, -0.3873913, 0.7481332, 1, 1, 1, 1, 1,
0.77434, 0.5526893, -0.6455751, 1, 1, 1, 1, 1,
0.7748136, -0.3110699, 2.347726, 1, 1, 1, 1, 1,
0.775772, 0.708279, 1.415236, 1, 1, 1, 1, 1,
0.7903529, -0.4939068, 2.52348, 0, 0, 1, 1, 1,
0.7911949, -0.3118725, 2.59033, 1, 0, 0, 1, 1,
0.7918378, -0.0545279, 0.621693, 1, 0, 0, 1, 1,
0.799314, -0.3247463, 2.235505, 1, 0, 0, 1, 1,
0.8081546, 1.419075, -0.9489753, 1, 0, 0, 1, 1,
0.8086376, 0.1688791, 1.858976, 1, 0, 0, 1, 1,
0.812188, -0.04210206, 0.8604714, 0, 0, 0, 1, 1,
0.813215, -0.8960112, 2.516269, 0, 0, 0, 1, 1,
0.8145437, 0.2725622, 3.005279, 0, 0, 0, 1, 1,
0.8169452, -0.9970806, 1.902034, 0, 0, 0, 1, 1,
0.8173313, -2.068216, 2.392496, 0, 0, 0, 1, 1,
0.817787, -0.01868953, 1.948483, 0, 0, 0, 1, 1,
0.8184308, -1.892357, 4.021902, 0, 0, 0, 1, 1,
0.8196102, -1.267067, 4.612434, 1, 1, 1, 1, 1,
0.8214473, 0.1293765, 1.479435, 1, 1, 1, 1, 1,
0.8222011, -1.084213, 3.164391, 1, 1, 1, 1, 1,
0.8260533, 0.8224552, 0.2040468, 1, 1, 1, 1, 1,
0.8277617, 0.4270411, 1.066996, 1, 1, 1, 1, 1,
0.8336983, -0.6065285, 0.795949, 1, 1, 1, 1, 1,
0.8348446, -0.6965291, 2.5112, 1, 1, 1, 1, 1,
0.8544726, -1.419774, 1.599603, 1, 1, 1, 1, 1,
0.8589139, 2.280119, 0.1754106, 1, 1, 1, 1, 1,
0.8691309, -1.044974, 1.495172, 1, 1, 1, 1, 1,
0.8702695, -1.189604, 1.984568, 1, 1, 1, 1, 1,
0.8729523, -0.6898953, 1.951494, 1, 1, 1, 1, 1,
0.8767177, -1.040482, 2.321329, 1, 1, 1, 1, 1,
0.8790812, 0.6994384, 2.094556, 1, 1, 1, 1, 1,
0.881237, -0.08590999, 2.469303, 1, 1, 1, 1, 1,
0.8822293, -3.495806, 4.574441, 0, 0, 1, 1, 1,
0.8852135, -0.5965996, 1.639071, 1, 0, 0, 1, 1,
0.8920066, 0.1608389, 0.3900143, 1, 0, 0, 1, 1,
0.8934193, -0.2828096, 2.030847, 1, 0, 0, 1, 1,
0.894291, -0.2057481, 2.519571, 1, 0, 0, 1, 1,
0.895892, -0.8563611, 0.2651279, 1, 0, 0, 1, 1,
0.9001598, 1.01838, 1.60649, 0, 0, 0, 1, 1,
0.9103729, -0.5012817, 2.948693, 0, 0, 0, 1, 1,
0.9158404, 0.6350743, 0.8323784, 0, 0, 0, 1, 1,
0.9236794, -0.03393251, 2.056866, 0, 0, 0, 1, 1,
0.9304371, -0.06711634, 1.965414, 0, 0, 0, 1, 1,
0.9320601, -0.5538641, 2.449266, 0, 0, 0, 1, 1,
0.9326535, -1.05216, 3.285726, 0, 0, 0, 1, 1,
0.9351475, 0.6330796, 0.5257868, 1, 1, 1, 1, 1,
0.9379169, 0.2152253, -0.3883455, 1, 1, 1, 1, 1,
0.9408296, -1.257464, 1.942648, 1, 1, 1, 1, 1,
0.9433361, 1.198553, 1.162831, 1, 1, 1, 1, 1,
0.9439557, 0.8387972, -1.427637, 1, 1, 1, 1, 1,
0.9486101, 0.4457494, 1.233716, 1, 1, 1, 1, 1,
0.9502542, -1.97159, 4.371785, 1, 1, 1, 1, 1,
0.9605891, -0.6042449, 4.686197, 1, 1, 1, 1, 1,
0.9661394, -0.4418793, 2.262921, 1, 1, 1, 1, 1,
0.9757959, 0.2348318, 1.228506, 1, 1, 1, 1, 1,
0.9759094, 0.1897235, 3.345781, 1, 1, 1, 1, 1,
0.9790448, -0.5749363, 0.2799241, 1, 1, 1, 1, 1,
0.9811993, 0.1233489, 1.581273, 1, 1, 1, 1, 1,
0.9812359, 1.006262, 1.219213, 1, 1, 1, 1, 1,
0.9947487, 0.40823, 1.323943, 1, 1, 1, 1, 1,
1.003607, 0.05876668, 2.368733, 0, 0, 1, 1, 1,
1.005036, 1.310826, -0.4347966, 1, 0, 0, 1, 1,
1.006445, -0.4756648, 3.228377, 1, 0, 0, 1, 1,
1.007098, 0.3684517, -0.03929807, 1, 0, 0, 1, 1,
1.007776, 0.2538092, 0.8735849, 1, 0, 0, 1, 1,
1.020393, 0.6656301, 3.695519, 1, 0, 0, 1, 1,
1.024358, -1.805304, 2.035715, 0, 0, 0, 1, 1,
1.025151, -0.8191768, 3.224273, 0, 0, 0, 1, 1,
1.031724, -1.235954, 3.966095, 0, 0, 0, 1, 1,
1.038187, -0.6701083, 2.078046, 0, 0, 0, 1, 1,
1.039333, 0.5881338, 3.191373, 0, 0, 0, 1, 1,
1.040049, -0.01597602, 2.780866, 0, 0, 0, 1, 1,
1.040336, -0.7920086, 2.723759, 0, 0, 0, 1, 1,
1.05247, -0.2470205, 2.111453, 1, 1, 1, 1, 1,
1.053048, 0.54188, 2.102986, 1, 1, 1, 1, 1,
1.058978, 0.3471698, 0.5919895, 1, 1, 1, 1, 1,
1.061103, 1.13642, 1.611508, 1, 1, 1, 1, 1,
1.061125, -0.1022309, 1.06236, 1, 1, 1, 1, 1,
1.067852, 1.287037, 0.2294466, 1, 1, 1, 1, 1,
1.069775, -1.413329, 2.216087, 1, 1, 1, 1, 1,
1.071256, -0.3730935, 1.941802, 1, 1, 1, 1, 1,
1.072731, 0.2775672, 0.873843, 1, 1, 1, 1, 1,
1.074535, 0.6737582, -0.3399167, 1, 1, 1, 1, 1,
1.079403, -0.1166591, 1.338706, 1, 1, 1, 1, 1,
1.084051, 0.3577239, 2.001212, 1, 1, 1, 1, 1,
1.085975, -0.5614318, 1.476123, 1, 1, 1, 1, 1,
1.088266, 1.496387, 1.27658, 1, 1, 1, 1, 1,
1.089649, 1.4703, -0.3698827, 1, 1, 1, 1, 1,
1.091161, 0.07780776, 1.562761, 0, 0, 1, 1, 1,
1.094918, -1.240121, 1.636855, 1, 0, 0, 1, 1,
1.096153, -0.7833437, 2.693969, 1, 0, 0, 1, 1,
1.096816, 0.8677929, 0.874435, 1, 0, 0, 1, 1,
1.099634, -2.170066, 2.926676, 1, 0, 0, 1, 1,
1.103666, 1.11024, 0.6439844, 1, 0, 0, 1, 1,
1.104758, 0.07097803, 1.233312, 0, 0, 0, 1, 1,
1.105356, -1.051234, 1.665639, 0, 0, 0, 1, 1,
1.105548, -1.026799, 0.3589454, 0, 0, 0, 1, 1,
1.106756, -1.477052, 2.328909, 0, 0, 0, 1, 1,
1.117771, -0.6135996, 0.4222727, 0, 0, 0, 1, 1,
1.127755, -0.1319282, 1.991431, 0, 0, 0, 1, 1,
1.133527, -2.682933, 1.158494, 0, 0, 0, 1, 1,
1.138287, 1.02342, 0.7230688, 1, 1, 1, 1, 1,
1.13894, -0.02587508, 1.794268, 1, 1, 1, 1, 1,
1.140785, 0.6643194, 2.62466, 1, 1, 1, 1, 1,
1.142416, -0.5456097, 2.501264, 1, 1, 1, 1, 1,
1.143598, 0.1929747, 1.965159, 1, 1, 1, 1, 1,
1.143626, 0.9817059, 0.6060964, 1, 1, 1, 1, 1,
1.166368, 0.4004228, -0.1887063, 1, 1, 1, 1, 1,
1.179177, 1.100943, -0.6604878, 1, 1, 1, 1, 1,
1.180519, -1.373389, 1.738903, 1, 1, 1, 1, 1,
1.187731, 0.6830027, 1.025663, 1, 1, 1, 1, 1,
1.220987, -0.5322632, 1.571024, 1, 1, 1, 1, 1,
1.22927, 1.277133, -0.608291, 1, 1, 1, 1, 1,
1.230331, 0.08606628, 0.8669149, 1, 1, 1, 1, 1,
1.232763, 1.415269, 1.19971, 1, 1, 1, 1, 1,
1.23739, -1.294215, 3.49981, 1, 1, 1, 1, 1,
1.238483, 1.197085, 2.782676, 0, 0, 1, 1, 1,
1.24693, 0.1312494, 1.406544, 1, 0, 0, 1, 1,
1.250137, 2.345111, -0.08537118, 1, 0, 0, 1, 1,
1.254589, 0.07305008, 0.8712171, 1, 0, 0, 1, 1,
1.256682, 0.3556594, 3.815764, 1, 0, 0, 1, 1,
1.261957, 0.5322637, 2.153223, 1, 0, 0, 1, 1,
1.262831, -1.067845, 3.637299, 0, 0, 0, 1, 1,
1.266643, 0.6290797, 0.4451346, 0, 0, 0, 1, 1,
1.272118, -1.222982, 1.59686, 0, 0, 0, 1, 1,
1.282177, -0.6103554, 1.256328, 0, 0, 0, 1, 1,
1.293212, -0.04366326, 0.8990505, 0, 0, 0, 1, 1,
1.299509, 1.57522, 1.16832, 0, 0, 0, 1, 1,
1.310683, -0.6498988, 3.349323, 0, 0, 0, 1, 1,
1.31149, 0.1473226, 1.770853, 1, 1, 1, 1, 1,
1.321736, -0.613584, 2.438887, 1, 1, 1, 1, 1,
1.332515, 0.6824864, 0.8775473, 1, 1, 1, 1, 1,
1.34577, 0.2314131, 0.5032192, 1, 1, 1, 1, 1,
1.354895, -0.1893501, 1.441619, 1, 1, 1, 1, 1,
1.355033, 0.3000087, 1.642809, 1, 1, 1, 1, 1,
1.355739, -0.4992879, 2.402166, 1, 1, 1, 1, 1,
1.357783, -0.5413071, 1.191845, 1, 1, 1, 1, 1,
1.360417, -1.554558, 2.341141, 1, 1, 1, 1, 1,
1.362715, 1.93713, 1.927451, 1, 1, 1, 1, 1,
1.367028, 0.9726695, 1.518776, 1, 1, 1, 1, 1,
1.367816, 0.7301341, 1.664623, 1, 1, 1, 1, 1,
1.368469, -0.3028986, 0.7907389, 1, 1, 1, 1, 1,
1.374747, 0.5156275, 0.08634703, 1, 1, 1, 1, 1,
1.379126, 0.191791, 2.10624, 1, 1, 1, 1, 1,
1.387376, -0.8764572, 3.547885, 0, 0, 1, 1, 1,
1.394041, 0.2136997, 2.068441, 1, 0, 0, 1, 1,
1.407591, 0.7258431, 0.03351503, 1, 0, 0, 1, 1,
1.40957, -0.558007, 3.363811, 1, 0, 0, 1, 1,
1.415828, 0.3732324, 1.829841, 1, 0, 0, 1, 1,
1.422202, 1.179818, 2.233804, 1, 0, 0, 1, 1,
1.447323, -1.210302, 2.676959, 0, 0, 0, 1, 1,
1.448824, -0.8481831, 1.975452, 0, 0, 0, 1, 1,
1.465776, 0.09036175, 2.857283, 0, 0, 0, 1, 1,
1.482669, -0.02014161, 1.214489, 0, 0, 0, 1, 1,
1.486339, -2.687706, 2.178106, 0, 0, 0, 1, 1,
1.50235, -0.42855, 2.503892, 0, 0, 0, 1, 1,
1.521796, 0.5594355, 1.627866, 0, 0, 0, 1, 1,
1.536959, 1.179707, 0.8550658, 1, 1, 1, 1, 1,
1.539385, -0.6099491, 2.859945, 1, 1, 1, 1, 1,
1.540791, -1.145282, 3.664885, 1, 1, 1, 1, 1,
1.543148, -1.482143, 0.76059, 1, 1, 1, 1, 1,
1.554804, 0.531363, 2.583461, 1, 1, 1, 1, 1,
1.56615, 1.080757, 2.789255, 1, 1, 1, 1, 1,
1.603493, 1.154904, 1.360363, 1, 1, 1, 1, 1,
1.603609, -0.8874525, 3.895774, 1, 1, 1, 1, 1,
1.622916, 2.184792, 1.120772, 1, 1, 1, 1, 1,
1.636386, 1.361122, 0.3652166, 1, 1, 1, 1, 1,
1.647112, -1.847249, 2.464878, 1, 1, 1, 1, 1,
1.658783, -0.8221385, 2.351383, 1, 1, 1, 1, 1,
1.662746, -1.214141, 1.306124, 1, 1, 1, 1, 1,
1.664155, -0.4672646, 2.006343, 1, 1, 1, 1, 1,
1.697366, -1.449227, 1.84549, 1, 1, 1, 1, 1,
1.7057, 0.2416816, 1.821267, 0, 0, 1, 1, 1,
1.70994, -1.719963, 2.477885, 1, 0, 0, 1, 1,
1.711664, -1.379321, 1.356255, 1, 0, 0, 1, 1,
1.712324, 1.170798, 0.8108577, 1, 0, 0, 1, 1,
1.724593, -0.460154, 0.9098467, 1, 0, 0, 1, 1,
1.727507, -1.629885, 2.269938, 1, 0, 0, 1, 1,
1.74747, -0.4784844, 1.294934, 0, 0, 0, 1, 1,
1.753093, 3.001892, 1.545445, 0, 0, 0, 1, 1,
1.753814, 0.02065636, 0.1367763, 0, 0, 0, 1, 1,
1.761495, 2.506511, 2.22903, 0, 0, 0, 1, 1,
1.789566, 1.352925, 1.02615, 0, 0, 0, 1, 1,
1.819362, -0.6390889, 0.1747783, 0, 0, 0, 1, 1,
1.82536, -1.97229, 2.185523, 0, 0, 0, 1, 1,
1.825594, -0.800862, 0.8861871, 1, 1, 1, 1, 1,
1.829679, 1.942174, 1.904882, 1, 1, 1, 1, 1,
1.858324, -0.9245312, 1.302478, 1, 1, 1, 1, 1,
1.920127, -0.2571126, 1.9318, 1, 1, 1, 1, 1,
1.920204, -0.502707, 1.854018, 1, 1, 1, 1, 1,
1.921996, -0.3980476, 2.610837, 1, 1, 1, 1, 1,
1.923622, 0.03770561, 2.273892, 1, 1, 1, 1, 1,
1.927764, -1.045391, 2.067576, 1, 1, 1, 1, 1,
1.930371, 1.281326, 1.773587, 1, 1, 1, 1, 1,
1.943788, -0.2694643, 0.3706098, 1, 1, 1, 1, 1,
1.94381, -0.4511358, 1.470433, 1, 1, 1, 1, 1,
1.963045, -2.022746, 3.064955, 1, 1, 1, 1, 1,
1.982019, -0.5428795, 0.02013214, 1, 1, 1, 1, 1,
1.989352, -0.4827038, 2.470382, 1, 1, 1, 1, 1,
1.99784, -0.5607436, 2.811801, 1, 1, 1, 1, 1,
2.010444, -0.1274033, -0.1732497, 0, 0, 1, 1, 1,
2.020216, 0.8412768, 0.5655304, 1, 0, 0, 1, 1,
2.046265, 0.2869318, 1.800387, 1, 0, 0, 1, 1,
2.057003, -0.6006894, 1.30431, 1, 0, 0, 1, 1,
2.063602, -0.1205829, 1.32488, 1, 0, 0, 1, 1,
2.067232, 0.09169744, -0.8175303, 1, 0, 0, 1, 1,
2.07523, -0.7086614, 0.6134776, 0, 0, 0, 1, 1,
2.078574, -0.5083293, 1.683357, 0, 0, 0, 1, 1,
2.083237, -1.155881, 1.259779, 0, 0, 0, 1, 1,
2.10979, -0.8687752, 0.8778695, 0, 0, 0, 1, 1,
2.113075, 1.030473, 1.114175, 0, 0, 0, 1, 1,
2.158025, 0.7187885, 2.328021, 0, 0, 0, 1, 1,
2.189751, -0.729187, 1.71903, 0, 0, 0, 1, 1,
2.204608, 0.6122353, 0.4624819, 1, 1, 1, 1, 1,
2.332162, -0.449254, 1.176233, 1, 1, 1, 1, 1,
2.339112, 0.8051716, -0.1294132, 1, 1, 1, 1, 1,
2.489214, 1.921123, 1.353421, 1, 1, 1, 1, 1,
2.72247, 0.3403831, 2.841756, 1, 1, 1, 1, 1,
3.186755, 0.125014, 0.5008775, 1, 1, 1, 1, 1,
3.801515, -0.3591078, 3.040471, 1, 1, 1, 1, 1
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
var radius = 10.28244;
var distance = 36.11665;
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
mvMatrix.translate( -0.1273408, 0.2190094, 0.09409189 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.11665);
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