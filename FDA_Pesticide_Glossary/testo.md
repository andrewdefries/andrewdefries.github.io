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
-3.412424, -0.0340909, -2.219869, 1, 0, 0, 1,
-2.920422, -0.3424763, 0.3387124, 1, 0.007843138, 0, 1,
-2.83538, -0.3188021, -3.216903, 1, 0.01176471, 0, 1,
-2.684768, -0.178137, 0.03972171, 1, 0.01960784, 0, 1,
-2.576717, -0.1315973, -1.677771, 1, 0.02352941, 0, 1,
-2.529068, 0.6194938, 0.2077142, 1, 0.03137255, 0, 1,
-2.46814, 0.9890041, -2.389853, 1, 0.03529412, 0, 1,
-2.383168, -0.1730811, -1.615055, 1, 0.04313726, 0, 1,
-2.371562, -1.36339, -1.942472, 1, 0.04705882, 0, 1,
-2.344339, 1.345657, -2.109497, 1, 0.05490196, 0, 1,
-2.301513, -0.8095487, -0.884317, 1, 0.05882353, 0, 1,
-2.242225, -0.05373836, -1.440164, 1, 0.06666667, 0, 1,
-2.239222, 0.3845545, 0.1588106, 1, 0.07058824, 0, 1,
-2.219059, -0.7380887, -2.355544, 1, 0.07843138, 0, 1,
-2.217948, -0.2711371, -2.432846, 1, 0.08235294, 0, 1,
-2.117507, 0.2061763, -2.044156, 1, 0.09019608, 0, 1,
-2.1146, -2.643436, -3.013575, 1, 0.09411765, 0, 1,
-2.031373, 1.97121, -3.303473, 1, 0.1019608, 0, 1,
-2.020153, -2.099689, -0.5645037, 1, 0.1098039, 0, 1,
-2.017476, 1.543212, -1.457866, 1, 0.1137255, 0, 1,
-2.017101, -0.1978853, -2.547052, 1, 0.1215686, 0, 1,
-1.999012, 0.9370369, -1.269732, 1, 0.1254902, 0, 1,
-1.988455, -0.6747094, -1.414635, 1, 0.1333333, 0, 1,
-1.873706, -0.1294402, -1.687103, 1, 0.1372549, 0, 1,
-1.864329, -0.4367666, -2.478606, 1, 0.145098, 0, 1,
-1.862497, 1.239044, -1.754872, 1, 0.1490196, 0, 1,
-1.859839, 0.1797052, -2.848887, 1, 0.1568628, 0, 1,
-1.842449, -1.036853, -2.047987, 1, 0.1607843, 0, 1,
-1.818292, -0.3826247, -1.842414, 1, 0.1686275, 0, 1,
-1.8105, -2.299899, -3.251487, 1, 0.172549, 0, 1,
-1.738881, 1.15854, 0.4645947, 1, 0.1803922, 0, 1,
-1.734035, 0.815769, -0.4328212, 1, 0.1843137, 0, 1,
-1.730506, 0.3612179, -1.277498, 1, 0.1921569, 0, 1,
-1.726009, 0.3889861, -0.9919674, 1, 0.1960784, 0, 1,
-1.713417, -1.139752, -3.418084, 1, 0.2039216, 0, 1,
-1.691176, -0.5262928, -1.970328, 1, 0.2117647, 0, 1,
-1.66882, 0.8360168, -1.066136, 1, 0.2156863, 0, 1,
-1.665843, 1.718159, 0.5147823, 1, 0.2235294, 0, 1,
-1.658649, -1.803118, -3.129027, 1, 0.227451, 0, 1,
-1.650796, 0.1221689, -0.5885673, 1, 0.2352941, 0, 1,
-1.645279, 0.1820391, -1.363128, 1, 0.2392157, 0, 1,
-1.58534, -0.978347, -2.821594, 1, 0.2470588, 0, 1,
-1.582957, -0.6635865, 0.3099956, 1, 0.2509804, 0, 1,
-1.582758, 0.2453892, -2.052336, 1, 0.2588235, 0, 1,
-1.577606, 1.571716, -0.4203596, 1, 0.2627451, 0, 1,
-1.576463, 1.109597, -1.347429, 1, 0.2705882, 0, 1,
-1.573434, 0.2851213, -1.585058, 1, 0.2745098, 0, 1,
-1.564597, 0.5520118, -0.86322, 1, 0.282353, 0, 1,
-1.553597, -0.06107805, -5.104858, 1, 0.2862745, 0, 1,
-1.553521, -0.3035745, -2.015, 1, 0.2941177, 0, 1,
-1.553199, -0.9032763, -2.389529, 1, 0.3019608, 0, 1,
-1.548709, 0.1144874, -0.7631449, 1, 0.3058824, 0, 1,
-1.531677, -1.524876, -3.806042, 1, 0.3137255, 0, 1,
-1.529659, -0.4657899, -1.639418, 1, 0.3176471, 0, 1,
-1.528179, 0.4698209, -0.6023309, 1, 0.3254902, 0, 1,
-1.525896, 0.1811174, -2.79349, 1, 0.3294118, 0, 1,
-1.494452, -0.3059997, 0.02460344, 1, 0.3372549, 0, 1,
-1.486037, 0.4489914, -0.04645643, 1, 0.3411765, 0, 1,
-1.484768, 0.7197307, -3.086264, 1, 0.3490196, 0, 1,
-1.467599, 0.8302337, -0.1464489, 1, 0.3529412, 0, 1,
-1.465082, -0.4821907, -2.03765, 1, 0.3607843, 0, 1,
-1.454677, -0.8534865, -3.731091, 1, 0.3647059, 0, 1,
-1.445499, 1.597888, 0.1760308, 1, 0.372549, 0, 1,
-1.442133, 0.6749213, -2.744944, 1, 0.3764706, 0, 1,
-1.437728, -0.4553493, 0.4194916, 1, 0.3843137, 0, 1,
-1.428981, 0.8376026, -2.256694, 1, 0.3882353, 0, 1,
-1.426857, -1.870056, -4.125411, 1, 0.3960784, 0, 1,
-1.422441, -0.3551898, -1.666154, 1, 0.4039216, 0, 1,
-1.421012, -0.5794308, -3.6512, 1, 0.4078431, 0, 1,
-1.419455, -0.2635352, -1.698709, 1, 0.4156863, 0, 1,
-1.413033, -0.3054141, -1.651824, 1, 0.4196078, 0, 1,
-1.410061, -1.402379, -2.168574, 1, 0.427451, 0, 1,
-1.403053, -0.4474445, -1.195365, 1, 0.4313726, 0, 1,
-1.380576, 0.5178999, -2.678244, 1, 0.4392157, 0, 1,
-1.363886, -0.3867069, -2.132388, 1, 0.4431373, 0, 1,
-1.355467, 0.2061924, -1.525403, 1, 0.4509804, 0, 1,
-1.352544, -1.129246, -2.500102, 1, 0.454902, 0, 1,
-1.340721, -0.7561558, -0.1579229, 1, 0.4627451, 0, 1,
-1.334038, 1.39546, -0.04819746, 1, 0.4666667, 0, 1,
-1.325712, 0.2700415, -0.8538854, 1, 0.4745098, 0, 1,
-1.325283, -0.1847481, 0.2843158, 1, 0.4784314, 0, 1,
-1.310517, -0.4757276, -1.640655, 1, 0.4862745, 0, 1,
-1.300076, 0.9471825, -3.242451, 1, 0.4901961, 0, 1,
-1.299774, 1.970505, -0.8705119, 1, 0.4980392, 0, 1,
-1.298678, 1.659833, -1.577331, 1, 0.5058824, 0, 1,
-1.294574, 2.163232, -0.4931041, 1, 0.509804, 0, 1,
-1.287459, -0.3367118, -0.6843646, 1, 0.5176471, 0, 1,
-1.284774, -0.5350615, -2.087159, 1, 0.5215687, 0, 1,
-1.276802, -1.966349, -1.934431, 1, 0.5294118, 0, 1,
-1.258481, -1.777914, -2.149407, 1, 0.5333334, 0, 1,
-1.251186, 0.09839402, -2.84516, 1, 0.5411765, 0, 1,
-1.244362, -0.8955593, -2.57634, 1, 0.5450981, 0, 1,
-1.243375, -0.8587272, -1.976245, 1, 0.5529412, 0, 1,
-1.241888, -0.8449266, -1.010221, 1, 0.5568628, 0, 1,
-1.228169, 0.0820406, -1.777547, 1, 0.5647059, 0, 1,
-1.224011, -0.78229, -2.815752, 1, 0.5686275, 0, 1,
-1.217573, 0.6708172, 0.5234899, 1, 0.5764706, 0, 1,
-1.211669, -1.593561, -3.594942, 1, 0.5803922, 0, 1,
-1.208542, 1.108475, -0.2621496, 1, 0.5882353, 0, 1,
-1.20674, 0.3256045, -0.3774164, 1, 0.5921569, 0, 1,
-1.204549, -1.305593, -3.278229, 1, 0.6, 0, 1,
-1.203364, 1.01794, -0.2056465, 1, 0.6078432, 0, 1,
-1.198086, 0.8937958, 0.08049814, 1, 0.6117647, 0, 1,
-1.19329, 0.01113473, -2.570195, 1, 0.6196079, 0, 1,
-1.192476, 0.6784512, -2.497515, 1, 0.6235294, 0, 1,
-1.186319, 0.493227, -1.07738, 1, 0.6313726, 0, 1,
-1.175566, -1.030805, -4.083533, 1, 0.6352941, 0, 1,
-1.173242, 0.4499893, -1.285629, 1, 0.6431373, 0, 1,
-1.160677, -0.08908611, -3.430837, 1, 0.6470588, 0, 1,
-1.154228, 1.160892, 1.074243, 1, 0.654902, 0, 1,
-1.152074, 0.7342477, 0.2239855, 1, 0.6588235, 0, 1,
-1.144005, -0.734257, -2.392282, 1, 0.6666667, 0, 1,
-1.141181, -1.247685, -2.836812, 1, 0.6705883, 0, 1,
-1.141003, 0.5525908, -1.004274, 1, 0.6784314, 0, 1,
-1.134459, 0.3503937, -2.337849, 1, 0.682353, 0, 1,
-1.132489, -0.7783783, -3.345357, 1, 0.6901961, 0, 1,
-1.128664, -1.254689, -1.797431, 1, 0.6941177, 0, 1,
-1.127857, -1.484865, -3.075463, 1, 0.7019608, 0, 1,
-1.119849, 1.302684, 0.5322058, 1, 0.7098039, 0, 1,
-1.113287, -0.2981282, -2.004408, 1, 0.7137255, 0, 1,
-1.113206, -0.1729866, -0.8066142, 1, 0.7215686, 0, 1,
-1.110555, -0.9545186, -1.581932, 1, 0.7254902, 0, 1,
-1.103072, -3.281701, -2.873537, 1, 0.7333333, 0, 1,
-1.101031, 0.1720813, -0.1552847, 1, 0.7372549, 0, 1,
-1.099098, 1.313958, -1.395913, 1, 0.7450981, 0, 1,
-1.09708, 0.2985329, 0.08461446, 1, 0.7490196, 0, 1,
-1.087882, 1.109333, -1.342595, 1, 0.7568628, 0, 1,
-1.070018, 1.098899, -0.2821103, 1, 0.7607843, 0, 1,
-1.069365, -0.6936834, -3.865604, 1, 0.7686275, 0, 1,
-1.069039, -0.3906735, -1.905462, 1, 0.772549, 0, 1,
-1.065545, 0.1365871, -3.282083, 1, 0.7803922, 0, 1,
-1.062471, -0.6937972, -2.247089, 1, 0.7843137, 0, 1,
-1.055848, -1.671087, -2.350688, 1, 0.7921569, 0, 1,
-1.055736, -1.975062, -1.738926, 1, 0.7960784, 0, 1,
-1.053406, -0.1911633, -0.5416996, 1, 0.8039216, 0, 1,
-1.052418, 2.978341, 0.605006, 1, 0.8117647, 0, 1,
-1.039319, -0.7833496, -2.840606, 1, 0.8156863, 0, 1,
-1.024343, -1.93465, -0.6345859, 1, 0.8235294, 0, 1,
-1.022301, -0.4986235, -2.058146, 1, 0.827451, 0, 1,
-1.022236, -1.743352, -2.835299, 1, 0.8352941, 0, 1,
-1.021615, 0.08100874, -3.612844, 1, 0.8392157, 0, 1,
-1.017325, 1.375882, -1.793507, 1, 0.8470588, 0, 1,
-1.013954, -0.2718264, -0.9875681, 1, 0.8509804, 0, 1,
-1.013008, -0.7239321, -2.286131, 1, 0.8588235, 0, 1,
-1.011596, -1.284591, -2.883407, 1, 0.8627451, 0, 1,
-1.002472, -0.609791, -2.963738, 1, 0.8705882, 0, 1,
-1.001629, -0.7698429, -3.98751, 1, 0.8745098, 0, 1,
-0.991432, 0.00487167, -1.181689, 1, 0.8823529, 0, 1,
-0.9776832, 0.5489328, -0.4939677, 1, 0.8862745, 0, 1,
-0.9724603, -1.500021, -2.769983, 1, 0.8941177, 0, 1,
-0.9710429, 0.1611211, -0.8707913, 1, 0.8980392, 0, 1,
-0.9647238, -0.6094555, -2.249316, 1, 0.9058824, 0, 1,
-0.963522, 0.5799066, -2.281355, 1, 0.9137255, 0, 1,
-0.9628233, 0.2045208, -3.293745, 1, 0.9176471, 0, 1,
-0.9584841, 1.417295, 0.9881333, 1, 0.9254902, 0, 1,
-0.9580675, -0.5747929, -1.896392, 1, 0.9294118, 0, 1,
-0.9543345, 0.2274231, -2.73345, 1, 0.9372549, 0, 1,
-0.9487585, 0.4810095, -0.9918303, 1, 0.9411765, 0, 1,
-0.9478325, -0.02662201, -0.7981338, 1, 0.9490196, 0, 1,
-0.9468907, -1.507963, -0.8904805, 1, 0.9529412, 0, 1,
-0.9329125, -0.2898673, 0.1145039, 1, 0.9607843, 0, 1,
-0.9303998, -1.16888, -1.320289, 1, 0.9647059, 0, 1,
-0.9118212, -0.4985035, -2.107512, 1, 0.972549, 0, 1,
-0.906917, -0.402299, -2.107514, 1, 0.9764706, 0, 1,
-0.9062103, -0.1581735, -2.33079, 1, 0.9843137, 0, 1,
-0.8994267, -1.606343, -3.061839, 1, 0.9882353, 0, 1,
-0.8990335, -1.092096, -2.628761, 1, 0.9960784, 0, 1,
-0.8883963, -0.3794894, -3.721756, 0.9960784, 1, 0, 1,
-0.8866556, -1.536463, -3.041396, 0.9921569, 1, 0, 1,
-0.8866314, 1.08252, -0.6690633, 0.9843137, 1, 0, 1,
-0.8845279, 1.15978, 1.261529, 0.9803922, 1, 0, 1,
-0.8737176, 0.2270745, -1.102518, 0.972549, 1, 0, 1,
-0.8680259, 1.211694, 0.4349774, 0.9686275, 1, 0, 1,
-0.8678166, 1.900635, -0.1638657, 0.9607843, 1, 0, 1,
-0.8623524, -0.8976393, -2.978088, 0.9568627, 1, 0, 1,
-0.8622903, 0.006228728, -3.333854, 0.9490196, 1, 0, 1,
-0.8576775, -1.484362, -2.459608, 0.945098, 1, 0, 1,
-0.8551354, 0.318427, -1.102927, 0.9372549, 1, 0, 1,
-0.849402, 0.03489184, 0.3243003, 0.9333333, 1, 0, 1,
-0.8473704, -0.02136511, -2.906922, 0.9254902, 1, 0, 1,
-0.8440211, -0.9367325, -1.525763, 0.9215686, 1, 0, 1,
-0.8342472, 1.153357, 0.4692436, 0.9137255, 1, 0, 1,
-0.8318557, 0.3756364, -1.894985, 0.9098039, 1, 0, 1,
-0.8300098, -0.7082717, -0.4846339, 0.9019608, 1, 0, 1,
-0.8223119, -1.588541, -3.327278, 0.8941177, 1, 0, 1,
-0.8218246, -0.02556038, -2.025326, 0.8901961, 1, 0, 1,
-0.8216009, -0.5151319, -3.42391, 0.8823529, 1, 0, 1,
-0.8209082, 0.2027824, -1.321616, 0.8784314, 1, 0, 1,
-0.8208185, -0.4517909, -2.593143, 0.8705882, 1, 0, 1,
-0.815423, -0.1554503, -2.266444, 0.8666667, 1, 0, 1,
-0.8142273, -0.3240816, -3.084988, 0.8588235, 1, 0, 1,
-0.8083969, -1.783804, -1.979828, 0.854902, 1, 0, 1,
-0.8068577, -1.904075, -2.919532, 0.8470588, 1, 0, 1,
-0.8040447, 1.795783, -1.229735, 0.8431373, 1, 0, 1,
-0.8019477, -1.176516, -4.186626, 0.8352941, 1, 0, 1,
-0.7940449, -0.3581303, -1.496359, 0.8313726, 1, 0, 1,
-0.7937473, -0.8776718, -3.075718, 0.8235294, 1, 0, 1,
-0.791584, -0.9461915, -3.297126, 0.8196079, 1, 0, 1,
-0.7902315, -0.4244545, -1.29122, 0.8117647, 1, 0, 1,
-0.784978, 0.3981454, -1.337756, 0.8078431, 1, 0, 1,
-0.7767036, -0.2163979, -1.826718, 0.8, 1, 0, 1,
-0.7630021, -0.6726224, -2.770058, 0.7921569, 1, 0, 1,
-0.7603099, -0.7697132, -2.184893, 0.7882353, 1, 0, 1,
-0.7453995, 1.517795, -0.7386051, 0.7803922, 1, 0, 1,
-0.7421844, 0.6669983, -0.2214942, 0.7764706, 1, 0, 1,
-0.7388873, 1.070759, -1.205623, 0.7686275, 1, 0, 1,
-0.7388426, 0.08279624, -2.408321, 0.7647059, 1, 0, 1,
-0.7125883, 1.04057, 2.806001, 0.7568628, 1, 0, 1,
-0.7088603, 0.7297865, -0.9324624, 0.7529412, 1, 0, 1,
-0.6954898, 0.9136328, 0.7168733, 0.7450981, 1, 0, 1,
-0.6918402, 0.5506735, -3.190851, 0.7411765, 1, 0, 1,
-0.6894069, 1.07907, -0.270549, 0.7333333, 1, 0, 1,
-0.6884184, 0.7185847, 1.051748, 0.7294118, 1, 0, 1,
-0.6864005, -0.5065525, -1.612952, 0.7215686, 1, 0, 1,
-0.683504, 0.01712024, -1.213898, 0.7176471, 1, 0, 1,
-0.6829986, 0.3120093, -2.419759, 0.7098039, 1, 0, 1,
-0.672642, -0.07389177, -1.232079, 0.7058824, 1, 0, 1,
-0.672376, -1.385505, -3.370634, 0.6980392, 1, 0, 1,
-0.669407, -1.740084, -2.491876, 0.6901961, 1, 0, 1,
-0.667555, -0.2434862, -1.951402, 0.6862745, 1, 0, 1,
-0.6637582, -0.1852589, -2.054604, 0.6784314, 1, 0, 1,
-0.657681, 1.047686, -0.5035526, 0.6745098, 1, 0, 1,
-0.6563621, 0.4765051, -1.89714, 0.6666667, 1, 0, 1,
-0.6530415, 0.4002514, -1.110955, 0.6627451, 1, 0, 1,
-0.6482049, -0.2044358, -2.425581, 0.654902, 1, 0, 1,
-0.6440842, -0.7045885, -1.509981, 0.6509804, 1, 0, 1,
-0.6425607, 0.6994215, -0.256197, 0.6431373, 1, 0, 1,
-0.6387656, 0.984139, 0.7479314, 0.6392157, 1, 0, 1,
-0.6359189, 1.658115, -0.6025509, 0.6313726, 1, 0, 1,
-0.6315114, -1.039004, -4.078583, 0.627451, 1, 0, 1,
-0.6312662, -0.5138906, -2.505484, 0.6196079, 1, 0, 1,
-0.6266574, 0.8242792, 0.5887228, 0.6156863, 1, 0, 1,
-0.6235039, 0.8598601, -0.873627, 0.6078432, 1, 0, 1,
-0.6223888, -0.9723073, -3.530146, 0.6039216, 1, 0, 1,
-0.6209909, -0.07095557, -0.8577273, 0.5960785, 1, 0, 1,
-0.6178477, 0.8477333, -0.5545186, 0.5882353, 1, 0, 1,
-0.6174062, -0.09957102, -0.4020255, 0.5843138, 1, 0, 1,
-0.6158322, -1.226661, -1.065024, 0.5764706, 1, 0, 1,
-0.6152416, -0.8732805, -4.514015, 0.572549, 1, 0, 1,
-0.6146662, 1.98894, -2.457505, 0.5647059, 1, 0, 1,
-0.6135566, 0.737055, -1.419606, 0.5607843, 1, 0, 1,
-0.6089112, -0.9825269, -2.166492, 0.5529412, 1, 0, 1,
-0.608291, 0.4310966, -2.145495, 0.5490196, 1, 0, 1,
-0.6032526, -1.813594, -3.69169, 0.5411765, 1, 0, 1,
-0.5993975, 1.11152, -0.6373648, 0.5372549, 1, 0, 1,
-0.5961709, 1.313316, -1.539883, 0.5294118, 1, 0, 1,
-0.5919151, -0.5230282, -0.8861376, 0.5254902, 1, 0, 1,
-0.591377, -0.807197, -3.813792, 0.5176471, 1, 0, 1,
-0.5879542, -1.184854, -4.332672, 0.5137255, 1, 0, 1,
-0.5847234, -0.2675158, -1.84368, 0.5058824, 1, 0, 1,
-0.5832917, 0.1492025, -0.3803769, 0.5019608, 1, 0, 1,
-0.5813659, -0.07626293, -1.999623, 0.4941176, 1, 0, 1,
-0.579329, 0.8695381, 0.8598002, 0.4862745, 1, 0, 1,
-0.579099, 0.02323254, -2.667003, 0.4823529, 1, 0, 1,
-0.579013, 0.342251, 0.4649097, 0.4745098, 1, 0, 1,
-0.5777328, -0.4945489, -2.003804, 0.4705882, 1, 0, 1,
-0.5772946, 0.05675454, -0.9193285, 0.4627451, 1, 0, 1,
-0.5721799, 0.7539562, -0.9132512, 0.4588235, 1, 0, 1,
-0.5689784, 0.2082219, 0.3588144, 0.4509804, 1, 0, 1,
-0.566901, -1.966357, -3.029303, 0.4470588, 1, 0, 1,
-0.5552447, 0.06524977, -2.065741, 0.4392157, 1, 0, 1,
-0.5528234, -0.7105972, -1.175919, 0.4352941, 1, 0, 1,
-0.5436156, -0.4386723, -1.320421, 0.427451, 1, 0, 1,
-0.5419706, -0.3841337, -1.840313, 0.4235294, 1, 0, 1,
-0.5392893, -0.07700289, -1.613401, 0.4156863, 1, 0, 1,
-0.5359756, 0.2987195, 0.5279539, 0.4117647, 1, 0, 1,
-0.5259089, 2.35908, 0.5015296, 0.4039216, 1, 0, 1,
-0.5251088, 0.050705, -2.370833, 0.3960784, 1, 0, 1,
-0.5228894, 0.4993881, -0.6009369, 0.3921569, 1, 0, 1,
-0.5079594, -1.390367, -1.847406, 0.3843137, 1, 0, 1,
-0.5077344, -1.517921, -1.138517, 0.3803922, 1, 0, 1,
-0.5076318, 0.6346774, -1.141757, 0.372549, 1, 0, 1,
-0.5051264, 0.4318708, -0.5843325, 0.3686275, 1, 0, 1,
-0.4998631, 0.302586, -0.5157566, 0.3607843, 1, 0, 1,
-0.4978668, -0.9953371, -2.935224, 0.3568628, 1, 0, 1,
-0.4973746, 0.7881351, 0.8928389, 0.3490196, 1, 0, 1,
-0.4942099, -0.167988, -3.000906, 0.345098, 1, 0, 1,
-0.4906678, -0.5508443, -2.376437, 0.3372549, 1, 0, 1,
-0.4890608, 0.3127557, -0.3263568, 0.3333333, 1, 0, 1,
-0.4819399, 1.75601, 0.0696914, 0.3254902, 1, 0, 1,
-0.481394, -0.5589893, -1.658386, 0.3215686, 1, 0, 1,
-0.480592, -0.0666028, -0.8705993, 0.3137255, 1, 0, 1,
-0.4779057, 1.084285, -1.168752, 0.3098039, 1, 0, 1,
-0.4771292, 0.1400757, -0.7976272, 0.3019608, 1, 0, 1,
-0.4722422, -1.167872, -1.943833, 0.2941177, 1, 0, 1,
-0.4701672, 0.2707611, -0.4643041, 0.2901961, 1, 0, 1,
-0.4654692, 1.60153, -1.915729, 0.282353, 1, 0, 1,
-0.4638371, -0.3691563, -1.676337, 0.2784314, 1, 0, 1,
-0.4629886, 0.8078877, -2.26986, 0.2705882, 1, 0, 1,
-0.4627782, 1.362834, -1.698932, 0.2666667, 1, 0, 1,
-0.4598305, 0.3479319, 0.5103089, 0.2588235, 1, 0, 1,
-0.4588945, 0.1050074, -1.738176, 0.254902, 1, 0, 1,
-0.4530542, -0.4677921, -2.578622, 0.2470588, 1, 0, 1,
-0.4500232, 0.2792443, -0.8993037, 0.2431373, 1, 0, 1,
-0.448908, 0.1275616, -2.772756, 0.2352941, 1, 0, 1,
-0.4482151, -1.280963, -3.259076, 0.2313726, 1, 0, 1,
-0.4457945, -0.4305977, -3.165225, 0.2235294, 1, 0, 1,
-0.4449058, -1.731365, -2.892616, 0.2196078, 1, 0, 1,
-0.4434682, 0.8479768, -0.8401026, 0.2117647, 1, 0, 1,
-0.4401633, 1.753397, -0.4483549, 0.2078431, 1, 0, 1,
-0.4379179, 0.8123258, -0.8159684, 0.2, 1, 0, 1,
-0.4363865, 0.7088898, 1.129047, 0.1921569, 1, 0, 1,
-0.4339086, -0.6829304, -2.905007, 0.1882353, 1, 0, 1,
-0.4291188, -1.659531, -1.758829, 0.1803922, 1, 0, 1,
-0.4289332, 0.09282984, -1.684679, 0.1764706, 1, 0, 1,
-0.428597, 0.895916, -0.3679102, 0.1686275, 1, 0, 1,
-0.426647, -0.3784678, -2.015685, 0.1647059, 1, 0, 1,
-0.4260404, 1.511339, -2.425854, 0.1568628, 1, 0, 1,
-0.4231747, -0.8460619, -1.741299, 0.1529412, 1, 0, 1,
-0.4202979, -1.271529, -2.800784, 0.145098, 1, 0, 1,
-0.4188861, 0.01143887, -2.695911, 0.1411765, 1, 0, 1,
-0.4177534, -0.453908, -1.669045, 0.1333333, 1, 0, 1,
-0.4120963, -1.811235, -3.683764, 0.1294118, 1, 0, 1,
-0.407417, 1.114814, 0.4630786, 0.1215686, 1, 0, 1,
-0.4017286, 0.3378814, -0.1909686, 0.1176471, 1, 0, 1,
-0.3993721, 0.1034391, 1.236519, 0.1098039, 1, 0, 1,
-0.3977515, 0.5102676, -2.755329, 0.1058824, 1, 0, 1,
-0.3973646, -1.240048, -2.524623, 0.09803922, 1, 0, 1,
-0.3934209, -0.0006613557, -0.419013, 0.09019608, 1, 0, 1,
-0.3898392, -0.1800055, -3.033149, 0.08627451, 1, 0, 1,
-0.3896201, 1.935365, -0.7719268, 0.07843138, 1, 0, 1,
-0.3891188, 0.3378029, 0.2191935, 0.07450981, 1, 0, 1,
-0.3885378, -1.479804, -3.230047, 0.06666667, 1, 0, 1,
-0.3840544, 0.2958689, 0.02778604, 0.0627451, 1, 0, 1,
-0.3805121, -0.9684949, -3.026421, 0.05490196, 1, 0, 1,
-0.3780402, 0.04179521, -0.7716032, 0.05098039, 1, 0, 1,
-0.3756083, -0.9166245, -3.596512, 0.04313726, 1, 0, 1,
-0.3691767, 0.3241305, -0.1692853, 0.03921569, 1, 0, 1,
-0.3678314, -0.4058895, -3.259422, 0.03137255, 1, 0, 1,
-0.3670342, -2.806636, -2.965992, 0.02745098, 1, 0, 1,
-0.3628522, 1.08227, -1.983148, 0.01960784, 1, 0, 1,
-0.3571163, -0.09420517, -0.8111401, 0.01568628, 1, 0, 1,
-0.3552229, 1.183942, 0.8675835, 0.007843138, 1, 0, 1,
-0.3545034, -0.09603494, -1.512676, 0.003921569, 1, 0, 1,
-0.3503413, 0.5744275, -2.048435, 0, 1, 0.003921569, 1,
-0.349109, 1.002247, 0.4953486, 0, 1, 0.01176471, 1,
-0.3481775, -0.2013873, -2.803002, 0, 1, 0.01568628, 1,
-0.3382195, -0.7662513, -3.01926, 0, 1, 0.02352941, 1,
-0.3349382, 1.037901, -1.057946, 0, 1, 0.02745098, 1,
-0.3278224, 0.590552, -0.1188486, 0, 1, 0.03529412, 1,
-0.3262295, 0.04773584, -1.769876, 0, 1, 0.03921569, 1,
-0.3260559, 1.798187, -1.3018, 0, 1, 0.04705882, 1,
-0.3195834, -0.8269973, -3.610206, 0, 1, 0.05098039, 1,
-0.3192168, 0.679259, 0.9169726, 0, 1, 0.05882353, 1,
-0.3024022, -0.6779735, -4.387861, 0, 1, 0.0627451, 1,
-0.2980586, 1.180518, -1.703808, 0, 1, 0.07058824, 1,
-0.2978237, -1.096494, -3.470838, 0, 1, 0.07450981, 1,
-0.2949073, -1.240121, -2.722752, 0, 1, 0.08235294, 1,
-0.2897657, 0.1248918, 1.397401, 0, 1, 0.08627451, 1,
-0.2866285, 1.105428, 0.1868244, 0, 1, 0.09411765, 1,
-0.2842316, -1.11627, -1.941848, 0, 1, 0.1019608, 1,
-0.2799007, -0.4880389, -2.176163, 0, 1, 0.1058824, 1,
-0.2779871, -0.194935, -1.416342, 0, 1, 0.1137255, 1,
-0.2765914, 0.4331787, -0.4375153, 0, 1, 0.1176471, 1,
-0.2734576, 1.190357, -1.354905, 0, 1, 0.1254902, 1,
-0.268555, -0.975098, -3.127585, 0, 1, 0.1294118, 1,
-0.2657043, 2.950717, -0.9966042, 0, 1, 0.1372549, 1,
-0.2642459, -0.4627058, -2.757241, 0, 1, 0.1411765, 1,
-0.2621881, -0.1527253, -2.67128, 0, 1, 0.1490196, 1,
-0.2601472, -2.006601, -2.761475, 0, 1, 0.1529412, 1,
-0.2576343, 2.773335, 0.8449807, 0, 1, 0.1607843, 1,
-0.2529897, -0.548457, -2.289334, 0, 1, 0.1647059, 1,
-0.2524199, -0.7620109, -2.192857, 0, 1, 0.172549, 1,
-0.2522767, -0.2837749, -0.8515993, 0, 1, 0.1764706, 1,
-0.2517745, 0.4329356, 1.006261, 0, 1, 0.1843137, 1,
-0.2494111, -0.9422467, -2.779585, 0, 1, 0.1882353, 1,
-0.2456928, 0.0697903, -1.094069, 0, 1, 0.1960784, 1,
-0.2450155, -0.9447203, -3.435899, 0, 1, 0.2039216, 1,
-0.24371, 0.4882206, -1.022974, 0, 1, 0.2078431, 1,
-0.2409509, 0.6160839, -0.5787312, 0, 1, 0.2156863, 1,
-0.2403152, 0.6996106, -1.971193, 0, 1, 0.2196078, 1,
-0.2370228, -1.537092, -2.222646, 0, 1, 0.227451, 1,
-0.2365501, 1.437871, 0.1931833, 0, 1, 0.2313726, 1,
-0.2364503, -0.7696921, -3.72862, 0, 1, 0.2392157, 1,
-0.233554, -1.079474, -4.20971, 0, 1, 0.2431373, 1,
-0.2330619, 0.849928, -1.623474, 0, 1, 0.2509804, 1,
-0.230372, -0.1656317, -1.747399, 0, 1, 0.254902, 1,
-0.2292208, -1.607116, -3.759251, 0, 1, 0.2627451, 1,
-0.2278051, -0.2425153, -3.546603, 0, 1, 0.2666667, 1,
-0.2236607, -0.001767217, -1.568515, 0, 1, 0.2745098, 1,
-0.2210871, 2.376898, 0.1245751, 0, 1, 0.2784314, 1,
-0.2205985, 0.42041, 0.01213499, 0, 1, 0.2862745, 1,
-0.220532, 0.3273309, -1.404849, 0, 1, 0.2901961, 1,
-0.2192192, -2.742178, -2.770717, 0, 1, 0.2980392, 1,
-0.2179984, -1.28412, -3.433529, 0, 1, 0.3058824, 1,
-0.2167175, 0.7118178, 0.3005123, 0, 1, 0.3098039, 1,
-0.2163548, -1.800889, -2.544283, 0, 1, 0.3176471, 1,
-0.2129572, -0.1691752, -1.925892, 0, 1, 0.3215686, 1,
-0.2074808, -0.9815096, -0.4035347, 0, 1, 0.3294118, 1,
-0.205846, 0.6418884, -1.60478, 0, 1, 0.3333333, 1,
-0.1993927, -1.166589, -2.531061, 0, 1, 0.3411765, 1,
-0.1873389, -0.2998585, -3.030949, 0, 1, 0.345098, 1,
-0.1871471, -1.920128, -4.357267, 0, 1, 0.3529412, 1,
-0.1868704, -0.255949, -2.810884, 0, 1, 0.3568628, 1,
-0.1831045, -0.4957145, -2.302434, 0, 1, 0.3647059, 1,
-0.1784795, 0.9479989, -0.2671465, 0, 1, 0.3686275, 1,
-0.1727765, 1.161097, 0.2755777, 0, 1, 0.3764706, 1,
-0.1725615, -0.4502988, -2.462819, 0, 1, 0.3803922, 1,
-0.1566368, 2.489098, -0.6583144, 0, 1, 0.3882353, 1,
-0.1505507, -1.918535, -2.044924, 0, 1, 0.3921569, 1,
-0.1477503, 0.7024768, -0.7930341, 0, 1, 0.4, 1,
-0.146769, 1.337248, 0.9326409, 0, 1, 0.4078431, 1,
-0.1397616, -0.2221661, -5.23545, 0, 1, 0.4117647, 1,
-0.136548, 1.063679, -0.1634486, 0, 1, 0.4196078, 1,
-0.13556, -1.739114, -4.528342, 0, 1, 0.4235294, 1,
-0.1335406, 0.1959733, -0.5106452, 0, 1, 0.4313726, 1,
-0.1313844, 2.354476, -0.60138, 0, 1, 0.4352941, 1,
-0.1312919, 0.09744326, 0.5168513, 0, 1, 0.4431373, 1,
-0.1279453, -1.06756, -2.144238, 0, 1, 0.4470588, 1,
-0.1222859, 1.767536, -0.2082212, 0, 1, 0.454902, 1,
-0.1174333, -0.6610318, -1.648415, 0, 1, 0.4588235, 1,
-0.1166472, 2.34991, 0.2042679, 0, 1, 0.4666667, 1,
-0.1164049, 1.510459, -0.574187, 0, 1, 0.4705882, 1,
-0.1162563, 0.7471158, -0.514234, 0, 1, 0.4784314, 1,
-0.1158972, 0.1145736, 0.4575156, 0, 1, 0.4823529, 1,
-0.1150386, 0.7486102, -0.614585, 0, 1, 0.4901961, 1,
-0.1141326, -0.1138554, -1.406537, 0, 1, 0.4941176, 1,
-0.1080328, -1.037902, -3.354369, 0, 1, 0.5019608, 1,
-0.1028586, 0.6927925, -1.337286, 0, 1, 0.509804, 1,
-0.09989569, -0.4854221, -3.82547, 0, 1, 0.5137255, 1,
-0.09819188, -1.057815, -2.494697, 0, 1, 0.5215687, 1,
-0.09814989, -1.10609, -3.074586, 0, 1, 0.5254902, 1,
-0.09716347, -2.059757, -2.145796, 0, 1, 0.5333334, 1,
-0.09275834, -1.951871, -2.436861, 0, 1, 0.5372549, 1,
-0.0918515, 0.9138005, 0.08438089, 0, 1, 0.5450981, 1,
-0.09142384, 0.6555226, -1.057124, 0, 1, 0.5490196, 1,
-0.08860826, -0.6468872, -3.071605, 0, 1, 0.5568628, 1,
-0.08698309, 0.774871, 0.7983936, 0, 1, 0.5607843, 1,
-0.08299135, 1.576297, -1.005428, 0, 1, 0.5686275, 1,
-0.07664477, 0.7131529, -2.04181, 0, 1, 0.572549, 1,
-0.07541568, 0.4197828, 0.1858689, 0, 1, 0.5803922, 1,
-0.07421501, -0.09157646, -1.856539, 0, 1, 0.5843138, 1,
-0.07401241, -0.1401263, -1.272145, 0, 1, 0.5921569, 1,
-0.06831654, -0.1249198, -1.443046, 0, 1, 0.5960785, 1,
-0.06755842, -1.643338, -4.46255, 0, 1, 0.6039216, 1,
-0.06710587, -1.162886, -1.296303, 0, 1, 0.6117647, 1,
-0.06628953, -0.1193367, -3.181574, 0, 1, 0.6156863, 1,
-0.06263519, -2.088907, -2.630937, 0, 1, 0.6235294, 1,
-0.06104032, -0.1082765, -3.224342, 0, 1, 0.627451, 1,
-0.06018991, -2.460246, -4.002985, 0, 1, 0.6352941, 1,
-0.05954289, 1.25731, 0.02225697, 0, 1, 0.6392157, 1,
-0.05489307, 0.4052846, 0.8276091, 0, 1, 0.6470588, 1,
-0.05050356, 0.5593878, -1.147554, 0, 1, 0.6509804, 1,
-0.04309354, -0.9989423, -3.147245, 0, 1, 0.6588235, 1,
-0.04260133, 0.4907227, -0.4184611, 0, 1, 0.6627451, 1,
-0.03862568, -0.1876228, -3.834416, 0, 1, 0.6705883, 1,
-0.03798901, 0.6319818, -1.373618, 0, 1, 0.6745098, 1,
-0.03595992, -0.2678164, -1.297896, 0, 1, 0.682353, 1,
-0.03280911, -0.9279993, -2.588366, 0, 1, 0.6862745, 1,
-0.02857103, -0.1913538, -3.554414, 0, 1, 0.6941177, 1,
-0.0280801, -0.8493788, -2.630311, 0, 1, 0.7019608, 1,
-0.02786558, -0.05208208, -2.819816, 0, 1, 0.7058824, 1,
-0.02661306, -0.04462285, -2.036954, 0, 1, 0.7137255, 1,
-0.02441612, 2.269991, -0.1743087, 0, 1, 0.7176471, 1,
-0.02362585, 0.7744007, 0.4283432, 0, 1, 0.7254902, 1,
-0.01957813, 0.8730904, -0.9730246, 0, 1, 0.7294118, 1,
-0.01548418, -0.3742596, -4.90781, 0, 1, 0.7372549, 1,
-0.01358459, 1.378154, 0.8183532, 0, 1, 0.7411765, 1,
-0.01242714, 0.4971666, -0.2084415, 0, 1, 0.7490196, 1,
-0.01218448, 0.2638447, -0.7198866, 0, 1, 0.7529412, 1,
-0.01094352, -0.8876786, -3.30153, 0, 1, 0.7607843, 1,
-0.009841943, 1.003546, 0.3161097, 0, 1, 0.7647059, 1,
-0.006885862, -0.2250012, -5.806646, 0, 1, 0.772549, 1,
-0.006166943, -2.176477, -2.144523, 0, 1, 0.7764706, 1,
-0.004861458, 1.423666, 0.6686392, 0, 1, 0.7843137, 1,
-0.001794559, -0.6596906, -3.470069, 0, 1, 0.7882353, 1,
0.002794602, -0.737406, 1.478533, 0, 1, 0.7960784, 1,
0.008392064, -0.08343155, 1.381253, 0, 1, 0.8039216, 1,
0.00987233, 0.5763433, 1.682463, 0, 1, 0.8078431, 1,
0.0103258, -0.9091901, 2.584162, 0, 1, 0.8156863, 1,
0.01077791, -1.429232, 2.567504, 0, 1, 0.8196079, 1,
0.02054152, -0.07495363, 2.369226, 0, 1, 0.827451, 1,
0.02189917, 0.7585282, -0.9806239, 0, 1, 0.8313726, 1,
0.0248854, -1.759986, 4.024808, 0, 1, 0.8392157, 1,
0.02644165, 1.069103, 0.5514817, 0, 1, 0.8431373, 1,
0.03091172, -1.917288, 2.2786, 0, 1, 0.8509804, 1,
0.03132173, 1.960264, -0.978738, 0, 1, 0.854902, 1,
0.03351192, -1.94185, 3.431883, 0, 1, 0.8627451, 1,
0.03535251, 2.052197, 1.125176, 0, 1, 0.8666667, 1,
0.03594163, 0.2665929, -1.552685, 0, 1, 0.8745098, 1,
0.03988341, -1.512274, 3.227096, 0, 1, 0.8784314, 1,
0.04043879, -0.3557155, 2.521954, 0, 1, 0.8862745, 1,
0.04422193, -0.6238381, 3.41632, 0, 1, 0.8901961, 1,
0.04491605, 0.06639033, 0.9561683, 0, 1, 0.8980392, 1,
0.04770523, -0.5278057, 2.9902, 0, 1, 0.9058824, 1,
0.04965773, -0.1550568, 3.256995, 0, 1, 0.9098039, 1,
0.05184593, -1.036792, 3.863537, 0, 1, 0.9176471, 1,
0.05854945, -0.4096552, 4.594277, 0, 1, 0.9215686, 1,
0.05917009, 0.4072392, -1.110673, 0, 1, 0.9294118, 1,
0.05938007, 0.3507158, -0.333964, 0, 1, 0.9333333, 1,
0.06112028, -1.29419, 4.148743, 0, 1, 0.9411765, 1,
0.0664447, 1.123742, -0.4672649, 0, 1, 0.945098, 1,
0.06668022, -2.079986, 4.187783, 0, 1, 0.9529412, 1,
0.06734095, 0.155693, -0.5455977, 0, 1, 0.9568627, 1,
0.07656597, 1.862954, -0.2362171, 0, 1, 0.9647059, 1,
0.07785873, -0.5627746, 2.189479, 0, 1, 0.9686275, 1,
0.07797951, 0.9284388, 2.656249, 0, 1, 0.9764706, 1,
0.07820973, 0.3920433, -0.5224063, 0, 1, 0.9803922, 1,
0.08044469, -0.754019, 2.483886, 0, 1, 0.9882353, 1,
0.08390902, -1.02519, 3.217515, 0, 1, 0.9921569, 1,
0.08539985, -1.027788, 3.961975, 0, 1, 1, 1,
0.08821752, 1.318206, 0.3050319, 0, 0.9921569, 1, 1,
0.08901457, -1.781633, 1.711856, 0, 0.9882353, 1, 1,
0.09024017, -0.06233913, 2.941812, 0, 0.9803922, 1, 1,
0.09866057, -0.4005767, 2.146106, 0, 0.9764706, 1, 1,
0.09956513, 0.4744179, -0.651298, 0, 0.9686275, 1, 1,
0.09959139, -0.4375644, 3.456435, 0, 0.9647059, 1, 1,
0.0997094, 0.8096123, -0.1545965, 0, 0.9568627, 1, 1,
0.1025254, -1.741998, 2.379283, 0, 0.9529412, 1, 1,
0.1039459, -0.307891, 2.418043, 0, 0.945098, 1, 1,
0.1093116, 1.658164, 0.1206046, 0, 0.9411765, 1, 1,
0.1095618, 2.141037, 0.8319186, 0, 0.9333333, 1, 1,
0.1119861, 0.1725914, 2.08935, 0, 0.9294118, 1, 1,
0.1149098, 0.722817, 0.3451918, 0, 0.9215686, 1, 1,
0.1157457, -0.8284431, 5.29818, 0, 0.9176471, 1, 1,
0.1188169, -0.2305767, 1.733831, 0, 0.9098039, 1, 1,
0.1194138, -0.7735202, 2.18237, 0, 0.9058824, 1, 1,
0.1253413, 1.379799, 0.03801483, 0, 0.8980392, 1, 1,
0.1256263, -0.7598704, 3.64712, 0, 0.8901961, 1, 1,
0.1284423, -0.5358623, 2.454502, 0, 0.8862745, 1, 1,
0.1289423, -0.1455751, 3.696703, 0, 0.8784314, 1, 1,
0.131006, 0.6927994, -0.7619561, 0, 0.8745098, 1, 1,
0.1321773, -0.09937309, 0.7067789, 0, 0.8666667, 1, 1,
0.1336491, -0.01308773, 2.68263, 0, 0.8627451, 1, 1,
0.1500701, -0.02110521, 0.8431983, 0, 0.854902, 1, 1,
0.1534187, -0.6843929, 1.199013, 0, 0.8509804, 1, 1,
0.1543979, 1.584005, 0.4161938, 0, 0.8431373, 1, 1,
0.1562243, 0.1937773, 1.16792, 0, 0.8392157, 1, 1,
0.1622723, 2.022515, 0.1485421, 0, 0.8313726, 1, 1,
0.1631163, 0.01617834, 0.8876456, 0, 0.827451, 1, 1,
0.1683103, 0.9713572, -0.227635, 0, 0.8196079, 1, 1,
0.1687287, 0.6640694, -0.4838227, 0, 0.8156863, 1, 1,
0.1705527, 0.8441985, -1.773209, 0, 0.8078431, 1, 1,
0.1729817, -0.259221, 2.475066, 0, 0.8039216, 1, 1,
0.1736289, 0.4117698, -2.101869, 0, 0.7960784, 1, 1,
0.177751, 2.177949, -0.3123601, 0, 0.7882353, 1, 1,
0.1784649, -0.1081734, 2.921537, 0, 0.7843137, 1, 1,
0.1803053, 0.001920414, 0.3056239, 0, 0.7764706, 1, 1,
0.1809534, 0.4395367, 2.707376, 0, 0.772549, 1, 1,
0.1850831, 2.684285, 0.4799213, 0, 0.7647059, 1, 1,
0.1894217, -1.498993, 3.822558, 0, 0.7607843, 1, 1,
0.1906716, -0.9181386, 3.311278, 0, 0.7529412, 1, 1,
0.1923297, 0.6543595, 0.8784712, 0, 0.7490196, 1, 1,
0.196096, -0.8740888, 2.93133, 0, 0.7411765, 1, 1,
0.1976651, 0.9017591, -0.3636827, 0, 0.7372549, 1, 1,
0.20283, 0.2565804, -0.4621146, 0, 0.7294118, 1, 1,
0.2046684, -1.49921, 1.471249, 0, 0.7254902, 1, 1,
0.2060782, -0.05146439, 3.628431, 0, 0.7176471, 1, 1,
0.2071584, 0.4814225, 0.3303268, 0, 0.7137255, 1, 1,
0.2099038, 0.730805, 0.6666759, 0, 0.7058824, 1, 1,
0.2120174, -0.07307792, -0.45886, 0, 0.6980392, 1, 1,
0.2176765, 1.295015, 1.523811, 0, 0.6941177, 1, 1,
0.2196036, 0.463589, -0.9378376, 0, 0.6862745, 1, 1,
0.2212722, -0.4215231, 0.7098694, 0, 0.682353, 1, 1,
0.222812, -0.200217, 1.41781, 0, 0.6745098, 1, 1,
0.2234613, 1.509476, -0.3830067, 0, 0.6705883, 1, 1,
0.2237545, -0.02796179, 0.5746187, 0, 0.6627451, 1, 1,
0.2240193, -0.4658043, 2.971066, 0, 0.6588235, 1, 1,
0.2258424, -0.6613219, 3.723319, 0, 0.6509804, 1, 1,
0.2270363, -1.417737, 1.886907, 0, 0.6470588, 1, 1,
0.2351119, 0.1080931, 0.9869375, 0, 0.6392157, 1, 1,
0.23525, 0.5525882, 0.4268348, 0, 0.6352941, 1, 1,
0.2367146, -0.3957351, 2.478735, 0, 0.627451, 1, 1,
0.2447345, -0.473704, 1.664084, 0, 0.6235294, 1, 1,
0.2463482, 1.434488, 0.1718759, 0, 0.6156863, 1, 1,
0.2470184, 1.000844, 0.7784704, 0, 0.6117647, 1, 1,
0.2476208, 7.024445e-05, 1.138795, 0, 0.6039216, 1, 1,
0.2482285, 0.6173797, 0.9146652, 0, 0.5960785, 1, 1,
0.2492192, 0.7607188, -1.088281, 0, 0.5921569, 1, 1,
0.2525572, -2.864605, 2.198554, 0, 0.5843138, 1, 1,
0.2527956, -1.004291, 1.552817, 0, 0.5803922, 1, 1,
0.2530292, -0.4989478, 2.752448, 0, 0.572549, 1, 1,
0.2569447, 1.350483, 0.5872751, 0, 0.5686275, 1, 1,
0.2649682, 1.761284, 1.715948, 0, 0.5607843, 1, 1,
0.2672317, -1.371297, 4.212641, 0, 0.5568628, 1, 1,
0.2672343, -0.0264718, 1.105445, 0, 0.5490196, 1, 1,
0.2717196, -0.2701338, 1.705908, 0, 0.5450981, 1, 1,
0.2800555, -1.004754, 3.948415, 0, 0.5372549, 1, 1,
0.2908517, -0.3728662, 1.851841, 0, 0.5333334, 1, 1,
0.2913255, 0.1649939, 1.298877, 0, 0.5254902, 1, 1,
0.2931452, 2.024189, 1.243295, 0, 0.5215687, 1, 1,
0.2959291, -0.8722557, 0.7164631, 0, 0.5137255, 1, 1,
0.2963096, -0.1995764, 2.217334, 0, 0.509804, 1, 1,
0.2974143, -1.000104, 3.297857, 0, 0.5019608, 1, 1,
0.2974932, -0.08786988, 0.3673907, 0, 0.4941176, 1, 1,
0.2986304, -0.4238102, 2.100758, 0, 0.4901961, 1, 1,
0.2987964, 1.683959, -0.2871999, 0, 0.4823529, 1, 1,
0.3006513, -0.9590149, 3.617747, 0, 0.4784314, 1, 1,
0.301304, 0.1397824, 2.474356, 0, 0.4705882, 1, 1,
0.3016118, -0.3716457, 3.479912, 0, 0.4666667, 1, 1,
0.3043531, -1.665498, 3.296804, 0, 0.4588235, 1, 1,
0.3060479, 0.3100338, 0.4506878, 0, 0.454902, 1, 1,
0.3080586, -0.01655568, 0.3788371, 0, 0.4470588, 1, 1,
0.3101663, 0.5344689, 2.176039, 0, 0.4431373, 1, 1,
0.3179499, 0.1965226, 0.1541086, 0, 0.4352941, 1, 1,
0.3238719, 1.403385, -0.3782895, 0, 0.4313726, 1, 1,
0.3265495, 0.01965616, 2.043643, 0, 0.4235294, 1, 1,
0.3285506, -1.347302, 3.706317, 0, 0.4196078, 1, 1,
0.3298093, 0.4274556, 0.4682611, 0, 0.4117647, 1, 1,
0.3328135, 1.432561, -0.6782976, 0, 0.4078431, 1, 1,
0.3339902, -0.7384959, 3.038543, 0, 0.4, 1, 1,
0.3360201, -0.009610312, 2.467821, 0, 0.3921569, 1, 1,
0.3373535, -0.2363387, 4.336654, 0, 0.3882353, 1, 1,
0.3384672, 0.9135006, 1.401916, 0, 0.3803922, 1, 1,
0.3416524, -1.240552, 2.616065, 0, 0.3764706, 1, 1,
0.353133, 0.50512, 0.9316728, 0, 0.3686275, 1, 1,
0.3540239, -1.235738, 3.178341, 0, 0.3647059, 1, 1,
0.3545149, 1.834669, -0.8912759, 0, 0.3568628, 1, 1,
0.35723, 1.276298, 1.030496, 0, 0.3529412, 1, 1,
0.3590644, -0.1502745, 4.74587, 0, 0.345098, 1, 1,
0.3645702, 0.6296336, 1.043811, 0, 0.3411765, 1, 1,
0.3661259, 0.04828418, 1.851568, 0, 0.3333333, 1, 1,
0.3671412, 0.4214413, 1.357039, 0, 0.3294118, 1, 1,
0.3675898, -1.169298, 2.504973, 0, 0.3215686, 1, 1,
0.3679766, 1.485176, 2.095901, 0, 0.3176471, 1, 1,
0.3684331, -3.25203, 3.76598, 0, 0.3098039, 1, 1,
0.3712137, -0.2377619, 2.200146, 0, 0.3058824, 1, 1,
0.3768025, -0.1364691, 1.438922, 0, 0.2980392, 1, 1,
0.3777933, -0.1522274, 1.396274, 0, 0.2901961, 1, 1,
0.378668, -0.4894998, 1.749878, 0, 0.2862745, 1, 1,
0.3792701, -1.024254, 3.653947, 0, 0.2784314, 1, 1,
0.3801783, -1.376358, 3.650491, 0, 0.2745098, 1, 1,
0.3820434, -0.7482001, 3.2901, 0, 0.2666667, 1, 1,
0.3863104, 0.6915121, -0.8292342, 0, 0.2627451, 1, 1,
0.3900747, 0.4261892, 1.688715, 0, 0.254902, 1, 1,
0.3923472, -1.851619, 3.557852, 0, 0.2509804, 1, 1,
0.4020042, 0.8068929, 0.7562741, 0, 0.2431373, 1, 1,
0.4025648, 2.034611, 1.076114, 0, 0.2392157, 1, 1,
0.4052148, 0.4852729, 1.840377, 0, 0.2313726, 1, 1,
0.4134623, -0.08151294, 1.781443, 0, 0.227451, 1, 1,
0.4136066, 0.5513599, -0.3038257, 0, 0.2196078, 1, 1,
0.4151475, 0.4221285, 0.2393159, 0, 0.2156863, 1, 1,
0.416503, -1.504686, 3.422356, 0, 0.2078431, 1, 1,
0.4171247, 0.3749168, -0.2702554, 0, 0.2039216, 1, 1,
0.4280039, -0.9944149, 2.629083, 0, 0.1960784, 1, 1,
0.4291056, 1.338452, 0.3501298, 0, 0.1882353, 1, 1,
0.4291425, 0.695606, 0.5210193, 0, 0.1843137, 1, 1,
0.4296267, 0.8354449, -1.238643, 0, 0.1764706, 1, 1,
0.4309065, 0.001559009, 2.522994, 0, 0.172549, 1, 1,
0.4321605, 1.817659, -1.141303, 0, 0.1647059, 1, 1,
0.4328439, -1.206137, 3.147539, 0, 0.1607843, 1, 1,
0.4335477, -1.679419, 4.393471, 0, 0.1529412, 1, 1,
0.4362834, -1.141038, 1.81183, 0, 0.1490196, 1, 1,
0.4377546, 0.7383776, -0.07160302, 0, 0.1411765, 1, 1,
0.4450251, 0.6946369, 0.7093712, 0, 0.1372549, 1, 1,
0.4474649, 0.2418962, 1.293239, 0, 0.1294118, 1, 1,
0.4509195, -1.894442, 2.850928, 0, 0.1254902, 1, 1,
0.451897, -0.3667019, 0.4019621, 0, 0.1176471, 1, 1,
0.4527925, 1.507284, 0.8701541, 0, 0.1137255, 1, 1,
0.4575925, -0.3864964, 3.528158, 0, 0.1058824, 1, 1,
0.4576757, -0.1770125, 3.961229, 0, 0.09803922, 1, 1,
0.4600504, -0.1717959, 1.443789, 0, 0.09411765, 1, 1,
0.4628925, -0.218788, 0.3630871, 0, 0.08627451, 1, 1,
0.4662464, 0.2742329, 0.5060337, 0, 0.08235294, 1, 1,
0.4674365, -1.238903, 2.42892, 0, 0.07450981, 1, 1,
0.4680265, 0.242525, 2.132947, 0, 0.07058824, 1, 1,
0.4712895, 0.2533081, -0.4041255, 0, 0.0627451, 1, 1,
0.4737978, -0.002960735, 0.4816116, 0, 0.05882353, 1, 1,
0.4743631, 0.1950347, 1.163407, 0, 0.05098039, 1, 1,
0.4840392, -0.6491887, 1.72224, 0, 0.04705882, 1, 1,
0.4850145, 0.1229214, 1.700184, 0, 0.03921569, 1, 1,
0.4974269, 0.399756, 2.254258, 0, 0.03529412, 1, 1,
0.4993788, -0.3054836, 3.115861, 0, 0.02745098, 1, 1,
0.5020524, -0.3626681, 2.041263, 0, 0.02352941, 1, 1,
0.5026331, 0.6330245, 0.03648163, 0, 0.01568628, 1, 1,
0.5039987, -0.6879894, 2.522559, 0, 0.01176471, 1, 1,
0.5043079, -0.3576875, 2.51408, 0, 0.003921569, 1, 1,
0.5052537, -1.272133, 2.901876, 0.003921569, 0, 1, 1,
0.5053049, 0.3245583, 1.726375, 0.007843138, 0, 1, 1,
0.5056261, 1.503034, 0.3148783, 0.01568628, 0, 1, 1,
0.505767, 0.5026358, 2.163727, 0.01960784, 0, 1, 1,
0.5058987, -0.190655, 1.447047, 0.02745098, 0, 1, 1,
0.5068419, -0.428188, 1.9705, 0.03137255, 0, 1, 1,
0.5076872, -1.280434, 1.758303, 0.03921569, 0, 1, 1,
0.507929, -0.3124862, 1.379164, 0.04313726, 0, 1, 1,
0.5115374, 1.745353, -0.886347, 0.05098039, 0, 1, 1,
0.5176521, -0.611131, 1.87542, 0.05490196, 0, 1, 1,
0.5214199, 1.15914, 1.126865, 0.0627451, 0, 1, 1,
0.5219634, 1.162154, 0.9562857, 0.06666667, 0, 1, 1,
0.5227631, 1.351108, -0.685326, 0.07450981, 0, 1, 1,
0.5257615, -0.2335359, 2.544901, 0.07843138, 0, 1, 1,
0.5268791, -0.4672422, 2.343623, 0.08627451, 0, 1, 1,
0.5303024, -1.900796, 2.262143, 0.09019608, 0, 1, 1,
0.5308863, -0.5460755, 3.049627, 0.09803922, 0, 1, 1,
0.5338287, -0.5914782, 1.402668, 0.1058824, 0, 1, 1,
0.5407425, -0.7545731, 1.941544, 0.1098039, 0, 1, 1,
0.5534492, 0.8374775, -0.1048366, 0.1176471, 0, 1, 1,
0.5623163, -0.9981821, 3.146311, 0.1215686, 0, 1, 1,
0.5625813, -0.2600679, 0.6560409, 0.1294118, 0, 1, 1,
0.5643133, -0.4707709, 2.900889, 0.1333333, 0, 1, 1,
0.5688073, 1.372247, 1.126042, 0.1411765, 0, 1, 1,
0.568968, 1.088097, -0.6732394, 0.145098, 0, 1, 1,
0.5692845, -0.5522738, 1.082857, 0.1529412, 0, 1, 1,
0.5695501, 0.8294886, -0.7350582, 0.1568628, 0, 1, 1,
0.5717645, -0.5498796, 2.394895, 0.1647059, 0, 1, 1,
0.5725248, -0.5236287, 2.226715, 0.1686275, 0, 1, 1,
0.5738571, 1.124691, -0.6145487, 0.1764706, 0, 1, 1,
0.5752334, 1.622981, 0.2806862, 0.1803922, 0, 1, 1,
0.5767095, -0.3996459, 2.92715, 0.1882353, 0, 1, 1,
0.5812593, -1.100126, 2.441879, 0.1921569, 0, 1, 1,
0.5871307, -0.3281097, 2.456511, 0.2, 0, 1, 1,
0.5898222, 1.867454, -0.1371589, 0.2078431, 0, 1, 1,
0.5923203, 1.045809, 1.400594, 0.2117647, 0, 1, 1,
0.5927951, -0.624841, 1.79555, 0.2196078, 0, 1, 1,
0.5932179, -0.2239365, 2.010728, 0.2235294, 0, 1, 1,
0.594063, 1.103362, 1.236754, 0.2313726, 0, 1, 1,
0.5944099, -0.7668161, 2.793457, 0.2352941, 0, 1, 1,
0.6040939, -0.007808766, 3.016919, 0.2431373, 0, 1, 1,
0.6088266, -1.525808, 2.895093, 0.2470588, 0, 1, 1,
0.6095584, 0.874733, 1.214556, 0.254902, 0, 1, 1,
0.6230727, 0.9999257, -0.06394982, 0.2588235, 0, 1, 1,
0.6231071, -1.27657, 3.972733, 0.2666667, 0, 1, 1,
0.6270922, 0.9817658, 0.756849, 0.2705882, 0, 1, 1,
0.6319107, 0.1431449, 2.506476, 0.2784314, 0, 1, 1,
0.632178, -0.2218612, 4.251552, 0.282353, 0, 1, 1,
0.632297, -0.5011432, 1.004682, 0.2901961, 0, 1, 1,
0.6370159, -0.8177013, 1.482798, 0.2941177, 0, 1, 1,
0.6381183, 0.7693774, 1.979471, 0.3019608, 0, 1, 1,
0.6398503, 1.939441, -0.5391662, 0.3098039, 0, 1, 1,
0.6488774, -1.210682, 3.247457, 0.3137255, 0, 1, 1,
0.660542, 0.5493048, 0.1455002, 0.3215686, 0, 1, 1,
0.6615248, -1.077607, 3.682396, 0.3254902, 0, 1, 1,
0.6668175, 0.9473713, -0.4726343, 0.3333333, 0, 1, 1,
0.6702865, 0.5027748, 1.132554, 0.3372549, 0, 1, 1,
0.6739379, -1.341593, 3.377415, 0.345098, 0, 1, 1,
0.6766914, 0.8967419, -0.7829754, 0.3490196, 0, 1, 1,
0.6782277, -0.2065177, 2.362924, 0.3568628, 0, 1, 1,
0.6782304, -1.898457, 1.604784, 0.3607843, 0, 1, 1,
0.6789083, -0.4393157, 3.812146, 0.3686275, 0, 1, 1,
0.6805344, -2.446903, 2.93716, 0.372549, 0, 1, 1,
0.6837862, 0.5582101, 0.568053, 0.3803922, 0, 1, 1,
0.6858204, -0.226458, 1.671033, 0.3843137, 0, 1, 1,
0.6878222, 0.2370643, 0.3374817, 0.3921569, 0, 1, 1,
0.6946489, 0.7291995, 0.7066916, 0.3960784, 0, 1, 1,
0.6952034, 1.041288, 1.456655, 0.4039216, 0, 1, 1,
0.696592, -0.1582182, 2.063549, 0.4117647, 0, 1, 1,
0.703889, -0.1792586, 4.801538, 0.4156863, 0, 1, 1,
0.7050597, -1.188614, 0.934819, 0.4235294, 0, 1, 1,
0.7058443, -1.36035, 4.355052, 0.427451, 0, 1, 1,
0.7118858, 0.4873653, -0.02492427, 0.4352941, 0, 1, 1,
0.7123186, -1.216694, 3.404782, 0.4392157, 0, 1, 1,
0.7149858, -0.5899847, 1.497969, 0.4470588, 0, 1, 1,
0.7176688, 1.985552, 1.083818, 0.4509804, 0, 1, 1,
0.7249672, 1.860554, 0.3087187, 0.4588235, 0, 1, 1,
0.7290792, -0.9612049, 1.648191, 0.4627451, 0, 1, 1,
0.7342349, -1.594517, 2.214897, 0.4705882, 0, 1, 1,
0.7369885, 1.1886, 1.138929, 0.4745098, 0, 1, 1,
0.7400387, -0.3728381, 0.3293772, 0.4823529, 0, 1, 1,
0.746381, -0.1056978, 2.234492, 0.4862745, 0, 1, 1,
0.7513487, 1.617294, 2.25062, 0.4941176, 0, 1, 1,
0.7533144, -0.7097946, 1.173453, 0.5019608, 0, 1, 1,
0.7536559, -0.5544696, 2.394954, 0.5058824, 0, 1, 1,
0.7650616, -1.843853, 3.152166, 0.5137255, 0, 1, 1,
0.7654112, 2.24585, 0.3556162, 0.5176471, 0, 1, 1,
0.7662026, 1.109787, 1.354437, 0.5254902, 0, 1, 1,
0.7666598, 1.490266, 1.433234, 0.5294118, 0, 1, 1,
0.767778, -0.9788009, 3.642302, 0.5372549, 0, 1, 1,
0.7708016, -0.7123702, 4.582493, 0.5411765, 0, 1, 1,
0.7720073, 1.144763, 0.4305203, 0.5490196, 0, 1, 1,
0.7738392, -0.1580966, 1.925091, 0.5529412, 0, 1, 1,
0.7740793, -1.906318, 4.163539, 0.5607843, 0, 1, 1,
0.7754837, 0.6786616, 1.401479, 0.5647059, 0, 1, 1,
0.7792232, -0.450374, 0.3153709, 0.572549, 0, 1, 1,
0.7798254, -0.1045416, 2.150357, 0.5764706, 0, 1, 1,
0.7818282, 2.202786, 0.9214418, 0.5843138, 0, 1, 1,
0.7888972, 0.9463516, 0.7187568, 0.5882353, 0, 1, 1,
0.7905344, 0.8220491, -0.4952041, 0.5960785, 0, 1, 1,
0.7906179, 0.6934384, 2.652595, 0.6039216, 0, 1, 1,
0.7940862, 0.7756273, 1.594777, 0.6078432, 0, 1, 1,
0.7990733, 0.3610083, 1.119826, 0.6156863, 0, 1, 1,
0.8042041, 0.220118, 2.476797, 0.6196079, 0, 1, 1,
0.8052486, -1.14589, 2.727645, 0.627451, 0, 1, 1,
0.8105735, 0.6441131, 0.192425, 0.6313726, 0, 1, 1,
0.8163587, -1.528699, 2.811727, 0.6392157, 0, 1, 1,
0.819568, -0.8199884, 1.344217, 0.6431373, 0, 1, 1,
0.8222854, 0.6784241, 0.7424264, 0.6509804, 0, 1, 1,
0.8237104, -0.4922344, 1.025562, 0.654902, 0, 1, 1,
0.8257863, -1.209494, 2.763876, 0.6627451, 0, 1, 1,
0.8302282, -0.2526083, 2.948377, 0.6666667, 0, 1, 1,
0.8328176, 0.9091788, 0.4421006, 0.6745098, 0, 1, 1,
0.8338025, 1.301929, 1.533646, 0.6784314, 0, 1, 1,
0.8341737, -0.5232936, 1.487652, 0.6862745, 0, 1, 1,
0.835952, 0.06860483, 0.9409422, 0.6901961, 0, 1, 1,
0.8373462, 1.128491, -1.499344, 0.6980392, 0, 1, 1,
0.8405422, 0.7593133, 1.160907, 0.7058824, 0, 1, 1,
0.8511597, 1.765334, 1.564553, 0.7098039, 0, 1, 1,
0.8545216, -0.4595361, 0.796576, 0.7176471, 0, 1, 1,
0.8573847, 1.186738, 0.4239772, 0.7215686, 0, 1, 1,
0.8598343, 0.4268939, 1.138079, 0.7294118, 0, 1, 1,
0.8600336, -1.366684, 1.390796, 0.7333333, 0, 1, 1,
0.8645618, -0.1092848, 1.961409, 0.7411765, 0, 1, 1,
0.8647475, -0.6747783, 1.914881, 0.7450981, 0, 1, 1,
0.8655148, 0.3380544, 3.324545, 0.7529412, 0, 1, 1,
0.8679813, -0.3008492, 1.739244, 0.7568628, 0, 1, 1,
0.8701562, 1.531379, -0.2254459, 0.7647059, 0, 1, 1,
0.8747471, -0.6205766, 3.427801, 0.7686275, 0, 1, 1,
0.8759094, 0.7819547, 0.972127, 0.7764706, 0, 1, 1,
0.885799, 0.03171214, 0.5966542, 0.7803922, 0, 1, 1,
0.9070325, -1.135728, 1.136942, 0.7882353, 0, 1, 1,
0.9173537, -1.303941, 4.700841, 0.7921569, 0, 1, 1,
0.9200802, 0.9200639, -0.2627163, 0.8, 0, 1, 1,
0.9217686, -2.242985, 2.792643, 0.8078431, 0, 1, 1,
0.9230963, -0.713447, 4.000041, 0.8117647, 0, 1, 1,
0.9249169, -1.41418, 2.02096, 0.8196079, 0, 1, 1,
0.9311918, -0.4089496, 2.671722, 0.8235294, 0, 1, 1,
0.9321939, -0.3016328, 2.933769, 0.8313726, 0, 1, 1,
0.9332845, 0.6830096, 0.009541886, 0.8352941, 0, 1, 1,
0.9402295, -0.5957727, 2.137387, 0.8431373, 0, 1, 1,
0.9455358, 0.08948293, 0.1742582, 0.8470588, 0, 1, 1,
0.9478267, -0.6087079, 2.633917, 0.854902, 0, 1, 1,
0.9492784, -0.7393499, 3.416175, 0.8588235, 0, 1, 1,
0.9498442, 1.551158, -0.6602938, 0.8666667, 0, 1, 1,
0.9503725, 0.8281435, 0.6876708, 0.8705882, 0, 1, 1,
0.9526359, 1.041848, 0.7173322, 0.8784314, 0, 1, 1,
0.9533724, -0.9488033, 0.348285, 0.8823529, 0, 1, 1,
0.9591478, -0.4529735, 1.25234, 0.8901961, 0, 1, 1,
0.9593689, -1.267948, 2.461394, 0.8941177, 0, 1, 1,
0.9607004, 0.5627109, 0.3790257, 0.9019608, 0, 1, 1,
0.9627181, 0.2526634, 0.5319336, 0.9098039, 0, 1, 1,
0.9635884, 2.364358, -0.07992005, 0.9137255, 0, 1, 1,
0.9670815, 1.131556, -1.062227, 0.9215686, 0, 1, 1,
0.9678513, 0.9031743, 2.143285, 0.9254902, 0, 1, 1,
0.9750126, 0.4427651, 1.550027, 0.9333333, 0, 1, 1,
0.9755496, 0.1515967, 1.081648, 0.9372549, 0, 1, 1,
0.9791102, -1.68142, 1.845077, 0.945098, 0, 1, 1,
0.9846722, -1.19081, 1.593021, 0.9490196, 0, 1, 1,
0.9856566, 2.0124, 0.7025905, 0.9568627, 0, 1, 1,
0.9892806, -0.6530979, 4.05475, 0.9607843, 0, 1, 1,
0.9906504, -0.8325204, 2.055829, 0.9686275, 0, 1, 1,
0.9948124, -0.605135, 3.479369, 0.972549, 0, 1, 1,
0.9960352, 0.2112269, 3.072276, 0.9803922, 0, 1, 1,
0.996803, -0.6936515, 3.645198, 0.9843137, 0, 1, 1,
1.001806, -1.123187, 3.611567, 0.9921569, 0, 1, 1,
1.003219, -0.05482151, 0.3235011, 0.9960784, 0, 1, 1,
1.004767, -0.9917411, 1.65881, 1, 0, 0.9960784, 1,
1.013205, -1.761945, 4.095223, 1, 0, 0.9882353, 1,
1.015978, -0.7436638, 0.6975668, 1, 0, 0.9843137, 1,
1.021851, -0.2192345, 1.870325, 1, 0, 0.9764706, 1,
1.024098, -0.9491313, 2.23956, 1, 0, 0.972549, 1,
1.027463, -0.4987602, 1.695448, 1, 0, 0.9647059, 1,
1.033161, 0.1642691, 2.506375, 1, 0, 0.9607843, 1,
1.035479, -0.2005354, 2.251765, 1, 0, 0.9529412, 1,
1.039515, 1.206416, 2.428524, 1, 0, 0.9490196, 1,
1.040574, 0.05932095, 0.5701827, 1, 0, 0.9411765, 1,
1.041566, -2.270639, 3.117766, 1, 0, 0.9372549, 1,
1.042572, 0.520565, 0.8847025, 1, 0, 0.9294118, 1,
1.042944, 0.8046767, 0.7381687, 1, 0, 0.9254902, 1,
1.050734, -0.7020227, 1.738211, 1, 0, 0.9176471, 1,
1.054078, -0.3500478, 2.737773, 1, 0, 0.9137255, 1,
1.054915, -0.4492409, 4.614073, 1, 0, 0.9058824, 1,
1.065482, -1.394122, 4.140082, 1, 0, 0.9019608, 1,
1.068433, 1.001067, -0.620512, 1, 0, 0.8941177, 1,
1.068855, 0.4505148, -0.6700543, 1, 0, 0.8862745, 1,
1.069485, -1.01034, 3.274453, 1, 0, 0.8823529, 1,
1.070959, -0.02195074, 1.096894, 1, 0, 0.8745098, 1,
1.07953, -0.1991876, 0.4760705, 1, 0, 0.8705882, 1,
1.082247, 0.2690009, 2.256393, 1, 0, 0.8627451, 1,
1.083588, -1.243255, 2.83203, 1, 0, 0.8588235, 1,
1.084423, -0.2175406, 0.9571438, 1, 0, 0.8509804, 1,
1.087249, 1.411091, 1.27144, 1, 0, 0.8470588, 1,
1.092542, -0.1687356, 0.9769837, 1, 0, 0.8392157, 1,
1.097697, -0.2668072, 2.150646, 1, 0, 0.8352941, 1,
1.1005, -1.674996, 2.266848, 1, 0, 0.827451, 1,
1.102385, 1.197925, -0.732667, 1, 0, 0.8235294, 1,
1.104121, 0.02308043, 2.892164, 1, 0, 0.8156863, 1,
1.108136, -1.997108, 1.772275, 1, 0, 0.8117647, 1,
1.112509, -0.8287255, -0.470126, 1, 0, 0.8039216, 1,
1.118241, 0.1377666, 2.259437, 1, 0, 0.7960784, 1,
1.124779, 1.267607, 0.9168445, 1, 0, 0.7921569, 1,
1.12592, -1.614086, 0.4576382, 1, 0, 0.7843137, 1,
1.140658, -0.5931899, 2.567237, 1, 0, 0.7803922, 1,
1.142563, -0.5383467, 1.885132, 1, 0, 0.772549, 1,
1.145482, -0.4175315, 1.627239, 1, 0, 0.7686275, 1,
1.14646, -0.5869782, 2.01012, 1, 0, 0.7607843, 1,
1.152824, 1.054412, 0.1093142, 1, 0, 0.7568628, 1,
1.15905, 0.7398188, 1.482443, 1, 0, 0.7490196, 1,
1.165339, 1.7756, 1.686648, 1, 0, 0.7450981, 1,
1.166665, 0.9509826, 1.682048, 1, 0, 0.7372549, 1,
1.172969, 1.293881, 1.168969, 1, 0, 0.7333333, 1,
1.174124, -2.640677, 2.677715, 1, 0, 0.7254902, 1,
1.178067, -1.515835, 2.918944, 1, 0, 0.7215686, 1,
1.180565, 0.4487105, -0.01261265, 1, 0, 0.7137255, 1,
1.184739, 1.885089, -0.2254374, 1, 0, 0.7098039, 1,
1.189984, -1.254885, 3.142444, 1, 0, 0.7019608, 1,
1.200434, 0.9162785, 1.872195, 1, 0, 0.6941177, 1,
1.202861, 0.2349029, 1.545203, 1, 0, 0.6901961, 1,
1.203168, 1.229703, 4.646669, 1, 0, 0.682353, 1,
1.215314, 0.2772172, 0.8855062, 1, 0, 0.6784314, 1,
1.215411, 0.5845503, 0.9596791, 1, 0, 0.6705883, 1,
1.215895, -0.1820996, 3.985654, 1, 0, 0.6666667, 1,
1.219756, 0.8925409, 1.675227, 1, 0, 0.6588235, 1,
1.231937, 1.062576, 1.024057, 1, 0, 0.654902, 1,
1.234225, 1.542071, 0.4734607, 1, 0, 0.6470588, 1,
1.236658, -1.245985, 1.409244, 1, 0, 0.6431373, 1,
1.242238, -0.008875834, 1.521176, 1, 0, 0.6352941, 1,
1.244473, -0.02262655, 2.058196, 1, 0, 0.6313726, 1,
1.24533, -1.29628, 2.492565, 1, 0, 0.6235294, 1,
1.249257, 1.189067, 0.05567011, 1, 0, 0.6196079, 1,
1.250631, 2.629218, -0.9071935, 1, 0, 0.6117647, 1,
1.266313, 1.671974, -0.4652452, 1, 0, 0.6078432, 1,
1.282464, -0.8518436, 1.808952, 1, 0, 0.6, 1,
1.285135, 0.02918948, 1.916041, 1, 0, 0.5921569, 1,
1.286714, 0.2675693, 3.078071, 1, 0, 0.5882353, 1,
1.290683, -0.4772006, 1.931442, 1, 0, 0.5803922, 1,
1.293499, 0.7739169, 2.31345, 1, 0, 0.5764706, 1,
1.298277, -0.5341267, 1.40743, 1, 0, 0.5686275, 1,
1.299542, 0.1994872, 0.7330297, 1, 0, 0.5647059, 1,
1.300457, -1.762796, 3.622084, 1, 0, 0.5568628, 1,
1.312571, -0.4148469, 0.2558644, 1, 0, 0.5529412, 1,
1.313841, -0.5322768, 0.6999717, 1, 0, 0.5450981, 1,
1.328975, -2.904902, 1.536112, 1, 0, 0.5411765, 1,
1.345533, -0.0330395, 2.099771, 1, 0, 0.5333334, 1,
1.361253, 0.1624451, 0.1924548, 1, 0, 0.5294118, 1,
1.364485, 0.334176, 1.245844, 1, 0, 0.5215687, 1,
1.379305, -0.7779486, 1.033771, 1, 0, 0.5176471, 1,
1.383997, 1.906092, 0.2361279, 1, 0, 0.509804, 1,
1.399333, -0.9704588, 2.215239, 1, 0, 0.5058824, 1,
1.409498, -0.3816161, 2.112451, 1, 0, 0.4980392, 1,
1.416647, 0.08078162, 1.826181, 1, 0, 0.4901961, 1,
1.429569, -0.3692954, 2.190278, 1, 0, 0.4862745, 1,
1.436794, -0.995043, 1.734618, 1, 0, 0.4784314, 1,
1.442456, 0.5333926, 0.08709276, 1, 0, 0.4745098, 1,
1.455289, 0.2639399, 3.62183, 1, 0, 0.4666667, 1,
1.460041, 0.9312581, 0.415103, 1, 0, 0.4627451, 1,
1.470133, -0.890079, 2.72909, 1, 0, 0.454902, 1,
1.486177, 0.9069126, 2.737199, 1, 0, 0.4509804, 1,
1.489323, 0.4750479, -0.4204452, 1, 0, 0.4431373, 1,
1.496486, 0.3065945, 0.07342481, 1, 0, 0.4392157, 1,
1.499901, -1.244243, 1.488415, 1, 0, 0.4313726, 1,
1.504806, -0.1145137, 1.726125, 1, 0, 0.427451, 1,
1.515131, 1.256439, -1.076087, 1, 0, 0.4196078, 1,
1.522484, 0.9290997, 1.356371, 1, 0, 0.4156863, 1,
1.532209, 0.3307264, 1.202418, 1, 0, 0.4078431, 1,
1.55789, -1.101877, 1.363849, 1, 0, 0.4039216, 1,
1.56981, -3.679249, 4.613571, 1, 0, 0.3960784, 1,
1.5817, -0.2573752, 0.1899249, 1, 0, 0.3882353, 1,
1.590122, 0.1304763, 1.446314, 1, 0, 0.3843137, 1,
1.593561, -0.06454475, 1.331191, 1, 0, 0.3764706, 1,
1.595455, -1.585193, 3.024349, 1, 0, 0.372549, 1,
1.60232, 1.580561, 1.180568, 1, 0, 0.3647059, 1,
1.607228, 0.3119048, 1.450549, 1, 0, 0.3607843, 1,
1.609773, 1.420617, -0.1821445, 1, 0, 0.3529412, 1,
1.657735, 0.6860037, 0.8866875, 1, 0, 0.3490196, 1,
1.667161, -0.04270079, 0.642315, 1, 0, 0.3411765, 1,
1.674936, 0.6197968, -0.4087229, 1, 0, 0.3372549, 1,
1.69548, -1.902296, 3.358562, 1, 0, 0.3294118, 1,
1.718838, -0.2007891, 1.906927, 1, 0, 0.3254902, 1,
1.724371, 0.4019344, -0.3948337, 1, 0, 0.3176471, 1,
1.72855, -1.297492, 1.837541, 1, 0, 0.3137255, 1,
1.740613, -0.6372339, 3.735571, 1, 0, 0.3058824, 1,
1.743782, 2.671633, 2.01003, 1, 0, 0.2980392, 1,
1.744175, -0.4403886, 2.447255, 1, 0, 0.2941177, 1,
1.746728, -1.3657, 1.434297, 1, 0, 0.2862745, 1,
1.748494, -0.9998083, 3.303432, 1, 0, 0.282353, 1,
1.760855, -0.18072, 0.277664, 1, 0, 0.2745098, 1,
1.765365, 0.2604871, -0.661301, 1, 0, 0.2705882, 1,
1.794331, 1.615804, 0.6750615, 1, 0, 0.2627451, 1,
1.822739, 0.6925016, 1.009254, 1, 0, 0.2588235, 1,
1.836325, -0.7698576, 2.873919, 1, 0, 0.2509804, 1,
1.850672, -0.1310922, 0.8896598, 1, 0, 0.2470588, 1,
1.851734, -2.535757, 3.269116, 1, 0, 0.2392157, 1,
1.854347, -0.370414, 1.951462, 1, 0, 0.2352941, 1,
1.856066, -0.2761407, 1.565259, 1, 0, 0.227451, 1,
1.875237, -0.6262265, 3.24822, 1, 0, 0.2235294, 1,
1.927919, 1.393991, 0.1209818, 1, 0, 0.2156863, 1,
1.938697, -0.009805299, 1.842644, 1, 0, 0.2117647, 1,
1.946535, 0.1469569, 3.242843, 1, 0, 0.2039216, 1,
1.953772, -1.836111, 1.89645, 1, 0, 0.1960784, 1,
1.990566, 0.255698, 2.628506, 1, 0, 0.1921569, 1,
1.996253, 0.03370141, 1.495281, 1, 0, 0.1843137, 1,
2.004678, 1.536464, -0.0971144, 1, 0, 0.1803922, 1,
2.018395, 0.04049177, 1.38085, 1, 0, 0.172549, 1,
2.02958, -0.02165622, 0.6046259, 1, 0, 0.1686275, 1,
2.031235, -0.0102838, 1.491287, 1, 0, 0.1607843, 1,
2.044998, -0.4020919, 2.498342, 1, 0, 0.1568628, 1,
2.063679, 0.3360308, -0.6264182, 1, 0, 0.1490196, 1,
2.064071, 0.3367981, 1.566993, 1, 0, 0.145098, 1,
2.0881, -0.6067408, 1.432396, 1, 0, 0.1372549, 1,
2.10587, 0.8686295, 0.6898248, 1, 0, 0.1333333, 1,
2.106539, -0.1021167, 4.358645, 1, 0, 0.1254902, 1,
2.107192, 0.44344, 0.5845245, 1, 0, 0.1215686, 1,
2.129137, -0.9222991, 2.951523, 1, 0, 0.1137255, 1,
2.188904, -0.2610458, 0.6711887, 1, 0, 0.1098039, 1,
2.194836, 1.052595, 2.917289, 1, 0, 0.1019608, 1,
2.239533, 0.3370319, 1.736634, 1, 0, 0.09411765, 1,
2.249025, 0.8591876, 0.5476714, 1, 0, 0.09019608, 1,
2.270158, -0.5044873, 2.031196, 1, 0, 0.08235294, 1,
2.316028, 0.4423369, 0.6449521, 1, 0, 0.07843138, 1,
2.347017, 0.9744583, 1.543236, 1, 0, 0.07058824, 1,
2.385142, 0.2442834, 2.051723, 1, 0, 0.06666667, 1,
2.416666, 0.8928359, 1.009629, 1, 0, 0.05882353, 1,
2.496603, 0.1056559, 1.777819, 1, 0, 0.05490196, 1,
2.535253, -1.818134, 3.425133, 1, 0, 0.04705882, 1,
2.542533, 0.07881901, 3.101234, 1, 0, 0.04313726, 1,
2.681122, 0.7722167, 1.886987, 1, 0, 0.03529412, 1,
2.682673, 0.6996344, 1.762644, 1, 0, 0.03137255, 1,
2.698635, 0.1087992, 1.745337, 1, 0, 0.02352941, 1,
2.956296, -1.052364, 3.08057, 1, 0, 0.01960784, 1,
2.977865, -0.559997, 1.715849, 1, 0, 0.01176471, 1,
3.275801, -0.3489767, 2.305841, 1, 0, 0.007843138, 1
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
-0.06831145, -4.807711, -7.688914, 0, -0.5, 0.5, 0.5,
-0.06831145, -4.807711, -7.688914, 1, -0.5, 0.5, 0.5,
-0.06831145, -4.807711, -7.688914, 1, 1.5, 0.5, 0.5,
-0.06831145, -4.807711, -7.688914, 0, 1.5, 0.5, 0.5
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
-4.546078, -0.350454, -7.688914, 0, -0.5, 0.5, 0.5,
-4.546078, -0.350454, -7.688914, 1, -0.5, 0.5, 0.5,
-4.546078, -0.350454, -7.688914, 1, 1.5, 0.5, 0.5,
-4.546078, -0.350454, -7.688914, 0, 1.5, 0.5, 0.5
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
-4.546078, -4.807711, -0.2542329, 0, -0.5, 0.5, 0.5,
-4.546078, -4.807711, -0.2542329, 1, -0.5, 0.5, 0.5,
-4.546078, -4.807711, -0.2542329, 1, 1.5, 0.5, 0.5,
-4.546078, -4.807711, -0.2542329, 0, 1.5, 0.5, 0.5
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
-3, -3.779113, -5.973218,
3, -3.779113, -5.973218,
-3, -3.779113, -5.973218,
-3, -3.950546, -6.259168,
-2, -3.779113, -5.973218,
-2, -3.950546, -6.259168,
-1, -3.779113, -5.973218,
-1, -3.950546, -6.259168,
0, -3.779113, -5.973218,
0, -3.950546, -6.259168,
1, -3.779113, -5.973218,
1, -3.950546, -6.259168,
2, -3.779113, -5.973218,
2, -3.950546, -6.259168,
3, -3.779113, -5.973218,
3, -3.950546, -6.259168
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
-3, -4.293412, -6.831066, 0, -0.5, 0.5, 0.5,
-3, -4.293412, -6.831066, 1, -0.5, 0.5, 0.5,
-3, -4.293412, -6.831066, 1, 1.5, 0.5, 0.5,
-3, -4.293412, -6.831066, 0, 1.5, 0.5, 0.5,
-2, -4.293412, -6.831066, 0, -0.5, 0.5, 0.5,
-2, -4.293412, -6.831066, 1, -0.5, 0.5, 0.5,
-2, -4.293412, -6.831066, 1, 1.5, 0.5, 0.5,
-2, -4.293412, -6.831066, 0, 1.5, 0.5, 0.5,
-1, -4.293412, -6.831066, 0, -0.5, 0.5, 0.5,
-1, -4.293412, -6.831066, 1, -0.5, 0.5, 0.5,
-1, -4.293412, -6.831066, 1, 1.5, 0.5, 0.5,
-1, -4.293412, -6.831066, 0, 1.5, 0.5, 0.5,
0, -4.293412, -6.831066, 0, -0.5, 0.5, 0.5,
0, -4.293412, -6.831066, 1, -0.5, 0.5, 0.5,
0, -4.293412, -6.831066, 1, 1.5, 0.5, 0.5,
0, -4.293412, -6.831066, 0, 1.5, 0.5, 0.5,
1, -4.293412, -6.831066, 0, -0.5, 0.5, 0.5,
1, -4.293412, -6.831066, 1, -0.5, 0.5, 0.5,
1, -4.293412, -6.831066, 1, 1.5, 0.5, 0.5,
1, -4.293412, -6.831066, 0, 1.5, 0.5, 0.5,
2, -4.293412, -6.831066, 0, -0.5, 0.5, 0.5,
2, -4.293412, -6.831066, 1, -0.5, 0.5, 0.5,
2, -4.293412, -6.831066, 1, 1.5, 0.5, 0.5,
2, -4.293412, -6.831066, 0, 1.5, 0.5, 0.5,
3, -4.293412, -6.831066, 0, -0.5, 0.5, 0.5,
3, -4.293412, -6.831066, 1, -0.5, 0.5, 0.5,
3, -4.293412, -6.831066, 1, 1.5, 0.5, 0.5,
3, -4.293412, -6.831066, 0, 1.5, 0.5, 0.5
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
-3.512748, -3, -5.973218,
-3.512748, 2, -5.973218,
-3.512748, -3, -5.973218,
-3.684969, -3, -6.259168,
-3.512748, -2, -5.973218,
-3.684969, -2, -6.259168,
-3.512748, -1, -5.973218,
-3.684969, -1, -6.259168,
-3.512748, 0, -5.973218,
-3.684969, 0, -6.259168,
-3.512748, 1, -5.973218,
-3.684969, 1, -6.259168,
-3.512748, 2, -5.973218,
-3.684969, 2, -6.259168
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
-4.029413, -3, -6.831066, 0, -0.5, 0.5, 0.5,
-4.029413, -3, -6.831066, 1, -0.5, 0.5, 0.5,
-4.029413, -3, -6.831066, 1, 1.5, 0.5, 0.5,
-4.029413, -3, -6.831066, 0, 1.5, 0.5, 0.5,
-4.029413, -2, -6.831066, 0, -0.5, 0.5, 0.5,
-4.029413, -2, -6.831066, 1, -0.5, 0.5, 0.5,
-4.029413, -2, -6.831066, 1, 1.5, 0.5, 0.5,
-4.029413, -2, -6.831066, 0, 1.5, 0.5, 0.5,
-4.029413, -1, -6.831066, 0, -0.5, 0.5, 0.5,
-4.029413, -1, -6.831066, 1, -0.5, 0.5, 0.5,
-4.029413, -1, -6.831066, 1, 1.5, 0.5, 0.5,
-4.029413, -1, -6.831066, 0, 1.5, 0.5, 0.5,
-4.029413, 0, -6.831066, 0, -0.5, 0.5, 0.5,
-4.029413, 0, -6.831066, 1, -0.5, 0.5, 0.5,
-4.029413, 0, -6.831066, 1, 1.5, 0.5, 0.5,
-4.029413, 0, -6.831066, 0, 1.5, 0.5, 0.5,
-4.029413, 1, -6.831066, 0, -0.5, 0.5, 0.5,
-4.029413, 1, -6.831066, 1, -0.5, 0.5, 0.5,
-4.029413, 1, -6.831066, 1, 1.5, 0.5, 0.5,
-4.029413, 1, -6.831066, 0, 1.5, 0.5, 0.5,
-4.029413, 2, -6.831066, 0, -0.5, 0.5, 0.5,
-4.029413, 2, -6.831066, 1, -0.5, 0.5, 0.5,
-4.029413, 2, -6.831066, 1, 1.5, 0.5, 0.5,
-4.029413, 2, -6.831066, 0, 1.5, 0.5, 0.5
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
-3.512748, -3.779113, -4,
-3.512748, -3.779113, 4,
-3.512748, -3.779113, -4,
-3.684969, -3.950546, -4,
-3.512748, -3.779113, -2,
-3.684969, -3.950546, -2,
-3.512748, -3.779113, 0,
-3.684969, -3.950546, 0,
-3.512748, -3.779113, 2,
-3.684969, -3.950546, 2,
-3.512748, -3.779113, 4,
-3.684969, -3.950546, 4
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
-4.029413, -4.293412, -4, 0, -0.5, 0.5, 0.5,
-4.029413, -4.293412, -4, 1, -0.5, 0.5, 0.5,
-4.029413, -4.293412, -4, 1, 1.5, 0.5, 0.5,
-4.029413, -4.293412, -4, 0, 1.5, 0.5, 0.5,
-4.029413, -4.293412, -2, 0, -0.5, 0.5, 0.5,
-4.029413, -4.293412, -2, 1, -0.5, 0.5, 0.5,
-4.029413, -4.293412, -2, 1, 1.5, 0.5, 0.5,
-4.029413, -4.293412, -2, 0, 1.5, 0.5, 0.5,
-4.029413, -4.293412, 0, 0, -0.5, 0.5, 0.5,
-4.029413, -4.293412, 0, 1, -0.5, 0.5, 0.5,
-4.029413, -4.293412, 0, 1, 1.5, 0.5, 0.5,
-4.029413, -4.293412, 0, 0, 1.5, 0.5, 0.5,
-4.029413, -4.293412, 2, 0, -0.5, 0.5, 0.5,
-4.029413, -4.293412, 2, 1, -0.5, 0.5, 0.5,
-4.029413, -4.293412, 2, 1, 1.5, 0.5, 0.5,
-4.029413, -4.293412, 2, 0, 1.5, 0.5, 0.5,
-4.029413, -4.293412, 4, 0, -0.5, 0.5, 0.5,
-4.029413, -4.293412, 4, 1, -0.5, 0.5, 0.5,
-4.029413, -4.293412, 4, 1, 1.5, 0.5, 0.5,
-4.029413, -4.293412, 4, 0, 1.5, 0.5, 0.5
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
-3.512748, -3.779113, -5.973218,
-3.512748, 3.078205, -5.973218,
-3.512748, -3.779113, 5.464753,
-3.512748, 3.078205, 5.464753,
-3.512748, -3.779113, -5.973218,
-3.512748, -3.779113, 5.464753,
-3.512748, 3.078205, -5.973218,
-3.512748, 3.078205, 5.464753,
-3.512748, -3.779113, -5.973218,
3.376125, -3.779113, -5.973218,
-3.512748, -3.779113, 5.464753,
3.376125, -3.779113, 5.464753,
-3.512748, 3.078205, -5.973218,
3.376125, 3.078205, -5.973218,
-3.512748, 3.078205, 5.464753,
3.376125, 3.078205, 5.464753,
3.376125, -3.779113, -5.973218,
3.376125, 3.078205, -5.973218,
3.376125, -3.779113, 5.464753,
3.376125, 3.078205, 5.464753,
3.376125, -3.779113, -5.973218,
3.376125, -3.779113, 5.464753,
3.376125, 3.078205, -5.973218,
3.376125, 3.078205, 5.464753
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
var radius = 8.015163;
var distance = 35.66037;
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
mvMatrix.translate( 0.06831145, 0.350454, 0.2542329 );
mvMatrix.scale( 1.257993, 1.263782, 0.7576651 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.66037);
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
testo<-read.table("testo.xyz")
```

```
## Error in read.table("testo.xyz"): no lines available in input
```

```r
x<-testo$V2
```

```
## Error in eval(expr, envir, enclos): object 'testo' not found
```

```r
y<-testo$V3
```

```
## Error in eval(expr, envir, enclos): object 'testo' not found
```

```r
z<-testo$V4
```

```
## Error in eval(expr, envir, enclos): object 'testo' not found
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
-3.412424, -0.0340909, -2.219869, 0, 0, 1, 1, 1,
-2.920422, -0.3424763, 0.3387124, 1, 0, 0, 1, 1,
-2.83538, -0.3188021, -3.216903, 1, 0, 0, 1, 1,
-2.684768, -0.178137, 0.03972171, 1, 0, 0, 1, 1,
-2.576717, -0.1315973, -1.677771, 1, 0, 0, 1, 1,
-2.529068, 0.6194938, 0.2077142, 1, 0, 0, 1, 1,
-2.46814, 0.9890041, -2.389853, 0, 0, 0, 1, 1,
-2.383168, -0.1730811, -1.615055, 0, 0, 0, 1, 1,
-2.371562, -1.36339, -1.942472, 0, 0, 0, 1, 1,
-2.344339, 1.345657, -2.109497, 0, 0, 0, 1, 1,
-2.301513, -0.8095487, -0.884317, 0, 0, 0, 1, 1,
-2.242225, -0.05373836, -1.440164, 0, 0, 0, 1, 1,
-2.239222, 0.3845545, 0.1588106, 0, 0, 0, 1, 1,
-2.219059, -0.7380887, -2.355544, 1, 1, 1, 1, 1,
-2.217948, -0.2711371, -2.432846, 1, 1, 1, 1, 1,
-2.117507, 0.2061763, -2.044156, 1, 1, 1, 1, 1,
-2.1146, -2.643436, -3.013575, 1, 1, 1, 1, 1,
-2.031373, 1.97121, -3.303473, 1, 1, 1, 1, 1,
-2.020153, -2.099689, -0.5645037, 1, 1, 1, 1, 1,
-2.017476, 1.543212, -1.457866, 1, 1, 1, 1, 1,
-2.017101, -0.1978853, -2.547052, 1, 1, 1, 1, 1,
-1.999012, 0.9370369, -1.269732, 1, 1, 1, 1, 1,
-1.988455, -0.6747094, -1.414635, 1, 1, 1, 1, 1,
-1.873706, -0.1294402, -1.687103, 1, 1, 1, 1, 1,
-1.864329, -0.4367666, -2.478606, 1, 1, 1, 1, 1,
-1.862497, 1.239044, -1.754872, 1, 1, 1, 1, 1,
-1.859839, 0.1797052, -2.848887, 1, 1, 1, 1, 1,
-1.842449, -1.036853, -2.047987, 1, 1, 1, 1, 1,
-1.818292, -0.3826247, -1.842414, 0, 0, 1, 1, 1,
-1.8105, -2.299899, -3.251487, 1, 0, 0, 1, 1,
-1.738881, 1.15854, 0.4645947, 1, 0, 0, 1, 1,
-1.734035, 0.815769, -0.4328212, 1, 0, 0, 1, 1,
-1.730506, 0.3612179, -1.277498, 1, 0, 0, 1, 1,
-1.726009, 0.3889861, -0.9919674, 1, 0, 0, 1, 1,
-1.713417, -1.139752, -3.418084, 0, 0, 0, 1, 1,
-1.691176, -0.5262928, -1.970328, 0, 0, 0, 1, 1,
-1.66882, 0.8360168, -1.066136, 0, 0, 0, 1, 1,
-1.665843, 1.718159, 0.5147823, 0, 0, 0, 1, 1,
-1.658649, -1.803118, -3.129027, 0, 0, 0, 1, 1,
-1.650796, 0.1221689, -0.5885673, 0, 0, 0, 1, 1,
-1.645279, 0.1820391, -1.363128, 0, 0, 0, 1, 1,
-1.58534, -0.978347, -2.821594, 1, 1, 1, 1, 1,
-1.582957, -0.6635865, 0.3099956, 1, 1, 1, 1, 1,
-1.582758, 0.2453892, -2.052336, 1, 1, 1, 1, 1,
-1.577606, 1.571716, -0.4203596, 1, 1, 1, 1, 1,
-1.576463, 1.109597, -1.347429, 1, 1, 1, 1, 1,
-1.573434, 0.2851213, -1.585058, 1, 1, 1, 1, 1,
-1.564597, 0.5520118, -0.86322, 1, 1, 1, 1, 1,
-1.553597, -0.06107805, -5.104858, 1, 1, 1, 1, 1,
-1.553521, -0.3035745, -2.015, 1, 1, 1, 1, 1,
-1.553199, -0.9032763, -2.389529, 1, 1, 1, 1, 1,
-1.548709, 0.1144874, -0.7631449, 1, 1, 1, 1, 1,
-1.531677, -1.524876, -3.806042, 1, 1, 1, 1, 1,
-1.529659, -0.4657899, -1.639418, 1, 1, 1, 1, 1,
-1.528179, 0.4698209, -0.6023309, 1, 1, 1, 1, 1,
-1.525896, 0.1811174, -2.79349, 1, 1, 1, 1, 1,
-1.494452, -0.3059997, 0.02460344, 0, 0, 1, 1, 1,
-1.486037, 0.4489914, -0.04645643, 1, 0, 0, 1, 1,
-1.484768, 0.7197307, -3.086264, 1, 0, 0, 1, 1,
-1.467599, 0.8302337, -0.1464489, 1, 0, 0, 1, 1,
-1.465082, -0.4821907, -2.03765, 1, 0, 0, 1, 1,
-1.454677, -0.8534865, -3.731091, 1, 0, 0, 1, 1,
-1.445499, 1.597888, 0.1760308, 0, 0, 0, 1, 1,
-1.442133, 0.6749213, -2.744944, 0, 0, 0, 1, 1,
-1.437728, -0.4553493, 0.4194916, 0, 0, 0, 1, 1,
-1.428981, 0.8376026, -2.256694, 0, 0, 0, 1, 1,
-1.426857, -1.870056, -4.125411, 0, 0, 0, 1, 1,
-1.422441, -0.3551898, -1.666154, 0, 0, 0, 1, 1,
-1.421012, -0.5794308, -3.6512, 0, 0, 0, 1, 1,
-1.419455, -0.2635352, -1.698709, 1, 1, 1, 1, 1,
-1.413033, -0.3054141, -1.651824, 1, 1, 1, 1, 1,
-1.410061, -1.402379, -2.168574, 1, 1, 1, 1, 1,
-1.403053, -0.4474445, -1.195365, 1, 1, 1, 1, 1,
-1.380576, 0.5178999, -2.678244, 1, 1, 1, 1, 1,
-1.363886, -0.3867069, -2.132388, 1, 1, 1, 1, 1,
-1.355467, 0.2061924, -1.525403, 1, 1, 1, 1, 1,
-1.352544, -1.129246, -2.500102, 1, 1, 1, 1, 1,
-1.340721, -0.7561558, -0.1579229, 1, 1, 1, 1, 1,
-1.334038, 1.39546, -0.04819746, 1, 1, 1, 1, 1,
-1.325712, 0.2700415, -0.8538854, 1, 1, 1, 1, 1,
-1.325283, -0.1847481, 0.2843158, 1, 1, 1, 1, 1,
-1.310517, -0.4757276, -1.640655, 1, 1, 1, 1, 1,
-1.300076, 0.9471825, -3.242451, 1, 1, 1, 1, 1,
-1.299774, 1.970505, -0.8705119, 1, 1, 1, 1, 1,
-1.298678, 1.659833, -1.577331, 0, 0, 1, 1, 1,
-1.294574, 2.163232, -0.4931041, 1, 0, 0, 1, 1,
-1.287459, -0.3367118, -0.6843646, 1, 0, 0, 1, 1,
-1.284774, -0.5350615, -2.087159, 1, 0, 0, 1, 1,
-1.276802, -1.966349, -1.934431, 1, 0, 0, 1, 1,
-1.258481, -1.777914, -2.149407, 1, 0, 0, 1, 1,
-1.251186, 0.09839402, -2.84516, 0, 0, 0, 1, 1,
-1.244362, -0.8955593, -2.57634, 0, 0, 0, 1, 1,
-1.243375, -0.8587272, -1.976245, 0, 0, 0, 1, 1,
-1.241888, -0.8449266, -1.010221, 0, 0, 0, 1, 1,
-1.228169, 0.0820406, -1.777547, 0, 0, 0, 1, 1,
-1.224011, -0.78229, -2.815752, 0, 0, 0, 1, 1,
-1.217573, 0.6708172, 0.5234899, 0, 0, 0, 1, 1,
-1.211669, -1.593561, -3.594942, 1, 1, 1, 1, 1,
-1.208542, 1.108475, -0.2621496, 1, 1, 1, 1, 1,
-1.20674, 0.3256045, -0.3774164, 1, 1, 1, 1, 1,
-1.204549, -1.305593, -3.278229, 1, 1, 1, 1, 1,
-1.203364, 1.01794, -0.2056465, 1, 1, 1, 1, 1,
-1.198086, 0.8937958, 0.08049814, 1, 1, 1, 1, 1,
-1.19329, 0.01113473, -2.570195, 1, 1, 1, 1, 1,
-1.192476, 0.6784512, -2.497515, 1, 1, 1, 1, 1,
-1.186319, 0.493227, -1.07738, 1, 1, 1, 1, 1,
-1.175566, -1.030805, -4.083533, 1, 1, 1, 1, 1,
-1.173242, 0.4499893, -1.285629, 1, 1, 1, 1, 1,
-1.160677, -0.08908611, -3.430837, 1, 1, 1, 1, 1,
-1.154228, 1.160892, 1.074243, 1, 1, 1, 1, 1,
-1.152074, 0.7342477, 0.2239855, 1, 1, 1, 1, 1,
-1.144005, -0.734257, -2.392282, 1, 1, 1, 1, 1,
-1.141181, -1.247685, -2.836812, 0, 0, 1, 1, 1,
-1.141003, 0.5525908, -1.004274, 1, 0, 0, 1, 1,
-1.134459, 0.3503937, -2.337849, 1, 0, 0, 1, 1,
-1.132489, -0.7783783, -3.345357, 1, 0, 0, 1, 1,
-1.128664, -1.254689, -1.797431, 1, 0, 0, 1, 1,
-1.127857, -1.484865, -3.075463, 1, 0, 0, 1, 1,
-1.119849, 1.302684, 0.5322058, 0, 0, 0, 1, 1,
-1.113287, -0.2981282, -2.004408, 0, 0, 0, 1, 1,
-1.113206, -0.1729866, -0.8066142, 0, 0, 0, 1, 1,
-1.110555, -0.9545186, -1.581932, 0, 0, 0, 1, 1,
-1.103072, -3.281701, -2.873537, 0, 0, 0, 1, 1,
-1.101031, 0.1720813, -0.1552847, 0, 0, 0, 1, 1,
-1.099098, 1.313958, -1.395913, 0, 0, 0, 1, 1,
-1.09708, 0.2985329, 0.08461446, 1, 1, 1, 1, 1,
-1.087882, 1.109333, -1.342595, 1, 1, 1, 1, 1,
-1.070018, 1.098899, -0.2821103, 1, 1, 1, 1, 1,
-1.069365, -0.6936834, -3.865604, 1, 1, 1, 1, 1,
-1.069039, -0.3906735, -1.905462, 1, 1, 1, 1, 1,
-1.065545, 0.1365871, -3.282083, 1, 1, 1, 1, 1,
-1.062471, -0.6937972, -2.247089, 1, 1, 1, 1, 1,
-1.055848, -1.671087, -2.350688, 1, 1, 1, 1, 1,
-1.055736, -1.975062, -1.738926, 1, 1, 1, 1, 1,
-1.053406, -0.1911633, -0.5416996, 1, 1, 1, 1, 1,
-1.052418, 2.978341, 0.605006, 1, 1, 1, 1, 1,
-1.039319, -0.7833496, -2.840606, 1, 1, 1, 1, 1,
-1.024343, -1.93465, -0.6345859, 1, 1, 1, 1, 1,
-1.022301, -0.4986235, -2.058146, 1, 1, 1, 1, 1,
-1.022236, -1.743352, -2.835299, 1, 1, 1, 1, 1,
-1.021615, 0.08100874, -3.612844, 0, 0, 1, 1, 1,
-1.017325, 1.375882, -1.793507, 1, 0, 0, 1, 1,
-1.013954, -0.2718264, -0.9875681, 1, 0, 0, 1, 1,
-1.013008, -0.7239321, -2.286131, 1, 0, 0, 1, 1,
-1.011596, -1.284591, -2.883407, 1, 0, 0, 1, 1,
-1.002472, -0.609791, -2.963738, 1, 0, 0, 1, 1,
-1.001629, -0.7698429, -3.98751, 0, 0, 0, 1, 1,
-0.991432, 0.00487167, -1.181689, 0, 0, 0, 1, 1,
-0.9776832, 0.5489328, -0.4939677, 0, 0, 0, 1, 1,
-0.9724603, -1.500021, -2.769983, 0, 0, 0, 1, 1,
-0.9710429, 0.1611211, -0.8707913, 0, 0, 0, 1, 1,
-0.9647238, -0.6094555, -2.249316, 0, 0, 0, 1, 1,
-0.963522, 0.5799066, -2.281355, 0, 0, 0, 1, 1,
-0.9628233, 0.2045208, -3.293745, 1, 1, 1, 1, 1,
-0.9584841, 1.417295, 0.9881333, 1, 1, 1, 1, 1,
-0.9580675, -0.5747929, -1.896392, 1, 1, 1, 1, 1,
-0.9543345, 0.2274231, -2.73345, 1, 1, 1, 1, 1,
-0.9487585, 0.4810095, -0.9918303, 1, 1, 1, 1, 1,
-0.9478325, -0.02662201, -0.7981338, 1, 1, 1, 1, 1,
-0.9468907, -1.507963, -0.8904805, 1, 1, 1, 1, 1,
-0.9329125, -0.2898673, 0.1145039, 1, 1, 1, 1, 1,
-0.9303998, -1.16888, -1.320289, 1, 1, 1, 1, 1,
-0.9118212, -0.4985035, -2.107512, 1, 1, 1, 1, 1,
-0.906917, -0.402299, -2.107514, 1, 1, 1, 1, 1,
-0.9062103, -0.1581735, -2.33079, 1, 1, 1, 1, 1,
-0.8994267, -1.606343, -3.061839, 1, 1, 1, 1, 1,
-0.8990335, -1.092096, -2.628761, 1, 1, 1, 1, 1,
-0.8883963, -0.3794894, -3.721756, 1, 1, 1, 1, 1,
-0.8866556, -1.536463, -3.041396, 0, 0, 1, 1, 1,
-0.8866314, 1.08252, -0.6690633, 1, 0, 0, 1, 1,
-0.8845279, 1.15978, 1.261529, 1, 0, 0, 1, 1,
-0.8737176, 0.2270745, -1.102518, 1, 0, 0, 1, 1,
-0.8680259, 1.211694, 0.4349774, 1, 0, 0, 1, 1,
-0.8678166, 1.900635, -0.1638657, 1, 0, 0, 1, 1,
-0.8623524, -0.8976393, -2.978088, 0, 0, 0, 1, 1,
-0.8622903, 0.006228728, -3.333854, 0, 0, 0, 1, 1,
-0.8576775, -1.484362, -2.459608, 0, 0, 0, 1, 1,
-0.8551354, 0.318427, -1.102927, 0, 0, 0, 1, 1,
-0.849402, 0.03489184, 0.3243003, 0, 0, 0, 1, 1,
-0.8473704, -0.02136511, -2.906922, 0, 0, 0, 1, 1,
-0.8440211, -0.9367325, -1.525763, 0, 0, 0, 1, 1,
-0.8342472, 1.153357, 0.4692436, 1, 1, 1, 1, 1,
-0.8318557, 0.3756364, -1.894985, 1, 1, 1, 1, 1,
-0.8300098, -0.7082717, -0.4846339, 1, 1, 1, 1, 1,
-0.8223119, -1.588541, -3.327278, 1, 1, 1, 1, 1,
-0.8218246, -0.02556038, -2.025326, 1, 1, 1, 1, 1,
-0.8216009, -0.5151319, -3.42391, 1, 1, 1, 1, 1,
-0.8209082, 0.2027824, -1.321616, 1, 1, 1, 1, 1,
-0.8208185, -0.4517909, -2.593143, 1, 1, 1, 1, 1,
-0.815423, -0.1554503, -2.266444, 1, 1, 1, 1, 1,
-0.8142273, -0.3240816, -3.084988, 1, 1, 1, 1, 1,
-0.8083969, -1.783804, -1.979828, 1, 1, 1, 1, 1,
-0.8068577, -1.904075, -2.919532, 1, 1, 1, 1, 1,
-0.8040447, 1.795783, -1.229735, 1, 1, 1, 1, 1,
-0.8019477, -1.176516, -4.186626, 1, 1, 1, 1, 1,
-0.7940449, -0.3581303, -1.496359, 1, 1, 1, 1, 1,
-0.7937473, -0.8776718, -3.075718, 0, 0, 1, 1, 1,
-0.791584, -0.9461915, -3.297126, 1, 0, 0, 1, 1,
-0.7902315, -0.4244545, -1.29122, 1, 0, 0, 1, 1,
-0.784978, 0.3981454, -1.337756, 1, 0, 0, 1, 1,
-0.7767036, -0.2163979, -1.826718, 1, 0, 0, 1, 1,
-0.7630021, -0.6726224, -2.770058, 1, 0, 0, 1, 1,
-0.7603099, -0.7697132, -2.184893, 0, 0, 0, 1, 1,
-0.7453995, 1.517795, -0.7386051, 0, 0, 0, 1, 1,
-0.7421844, 0.6669983, -0.2214942, 0, 0, 0, 1, 1,
-0.7388873, 1.070759, -1.205623, 0, 0, 0, 1, 1,
-0.7388426, 0.08279624, -2.408321, 0, 0, 0, 1, 1,
-0.7125883, 1.04057, 2.806001, 0, 0, 0, 1, 1,
-0.7088603, 0.7297865, -0.9324624, 0, 0, 0, 1, 1,
-0.6954898, 0.9136328, 0.7168733, 1, 1, 1, 1, 1,
-0.6918402, 0.5506735, -3.190851, 1, 1, 1, 1, 1,
-0.6894069, 1.07907, -0.270549, 1, 1, 1, 1, 1,
-0.6884184, 0.7185847, 1.051748, 1, 1, 1, 1, 1,
-0.6864005, -0.5065525, -1.612952, 1, 1, 1, 1, 1,
-0.683504, 0.01712024, -1.213898, 1, 1, 1, 1, 1,
-0.6829986, 0.3120093, -2.419759, 1, 1, 1, 1, 1,
-0.672642, -0.07389177, -1.232079, 1, 1, 1, 1, 1,
-0.672376, -1.385505, -3.370634, 1, 1, 1, 1, 1,
-0.669407, -1.740084, -2.491876, 1, 1, 1, 1, 1,
-0.667555, -0.2434862, -1.951402, 1, 1, 1, 1, 1,
-0.6637582, -0.1852589, -2.054604, 1, 1, 1, 1, 1,
-0.657681, 1.047686, -0.5035526, 1, 1, 1, 1, 1,
-0.6563621, 0.4765051, -1.89714, 1, 1, 1, 1, 1,
-0.6530415, 0.4002514, -1.110955, 1, 1, 1, 1, 1,
-0.6482049, -0.2044358, -2.425581, 0, 0, 1, 1, 1,
-0.6440842, -0.7045885, -1.509981, 1, 0, 0, 1, 1,
-0.6425607, 0.6994215, -0.256197, 1, 0, 0, 1, 1,
-0.6387656, 0.984139, 0.7479314, 1, 0, 0, 1, 1,
-0.6359189, 1.658115, -0.6025509, 1, 0, 0, 1, 1,
-0.6315114, -1.039004, -4.078583, 1, 0, 0, 1, 1,
-0.6312662, -0.5138906, -2.505484, 0, 0, 0, 1, 1,
-0.6266574, 0.8242792, 0.5887228, 0, 0, 0, 1, 1,
-0.6235039, 0.8598601, -0.873627, 0, 0, 0, 1, 1,
-0.6223888, -0.9723073, -3.530146, 0, 0, 0, 1, 1,
-0.6209909, -0.07095557, -0.8577273, 0, 0, 0, 1, 1,
-0.6178477, 0.8477333, -0.5545186, 0, 0, 0, 1, 1,
-0.6174062, -0.09957102, -0.4020255, 0, 0, 0, 1, 1,
-0.6158322, -1.226661, -1.065024, 1, 1, 1, 1, 1,
-0.6152416, -0.8732805, -4.514015, 1, 1, 1, 1, 1,
-0.6146662, 1.98894, -2.457505, 1, 1, 1, 1, 1,
-0.6135566, 0.737055, -1.419606, 1, 1, 1, 1, 1,
-0.6089112, -0.9825269, -2.166492, 1, 1, 1, 1, 1,
-0.608291, 0.4310966, -2.145495, 1, 1, 1, 1, 1,
-0.6032526, -1.813594, -3.69169, 1, 1, 1, 1, 1,
-0.5993975, 1.11152, -0.6373648, 1, 1, 1, 1, 1,
-0.5961709, 1.313316, -1.539883, 1, 1, 1, 1, 1,
-0.5919151, -0.5230282, -0.8861376, 1, 1, 1, 1, 1,
-0.591377, -0.807197, -3.813792, 1, 1, 1, 1, 1,
-0.5879542, -1.184854, -4.332672, 1, 1, 1, 1, 1,
-0.5847234, -0.2675158, -1.84368, 1, 1, 1, 1, 1,
-0.5832917, 0.1492025, -0.3803769, 1, 1, 1, 1, 1,
-0.5813659, -0.07626293, -1.999623, 1, 1, 1, 1, 1,
-0.579329, 0.8695381, 0.8598002, 0, 0, 1, 1, 1,
-0.579099, 0.02323254, -2.667003, 1, 0, 0, 1, 1,
-0.579013, 0.342251, 0.4649097, 1, 0, 0, 1, 1,
-0.5777328, -0.4945489, -2.003804, 1, 0, 0, 1, 1,
-0.5772946, 0.05675454, -0.9193285, 1, 0, 0, 1, 1,
-0.5721799, 0.7539562, -0.9132512, 1, 0, 0, 1, 1,
-0.5689784, 0.2082219, 0.3588144, 0, 0, 0, 1, 1,
-0.566901, -1.966357, -3.029303, 0, 0, 0, 1, 1,
-0.5552447, 0.06524977, -2.065741, 0, 0, 0, 1, 1,
-0.5528234, -0.7105972, -1.175919, 0, 0, 0, 1, 1,
-0.5436156, -0.4386723, -1.320421, 0, 0, 0, 1, 1,
-0.5419706, -0.3841337, -1.840313, 0, 0, 0, 1, 1,
-0.5392893, -0.07700289, -1.613401, 0, 0, 0, 1, 1,
-0.5359756, 0.2987195, 0.5279539, 1, 1, 1, 1, 1,
-0.5259089, 2.35908, 0.5015296, 1, 1, 1, 1, 1,
-0.5251088, 0.050705, -2.370833, 1, 1, 1, 1, 1,
-0.5228894, 0.4993881, -0.6009369, 1, 1, 1, 1, 1,
-0.5079594, -1.390367, -1.847406, 1, 1, 1, 1, 1,
-0.5077344, -1.517921, -1.138517, 1, 1, 1, 1, 1,
-0.5076318, 0.6346774, -1.141757, 1, 1, 1, 1, 1,
-0.5051264, 0.4318708, -0.5843325, 1, 1, 1, 1, 1,
-0.4998631, 0.302586, -0.5157566, 1, 1, 1, 1, 1,
-0.4978668, -0.9953371, -2.935224, 1, 1, 1, 1, 1,
-0.4973746, 0.7881351, 0.8928389, 1, 1, 1, 1, 1,
-0.4942099, -0.167988, -3.000906, 1, 1, 1, 1, 1,
-0.4906678, -0.5508443, -2.376437, 1, 1, 1, 1, 1,
-0.4890608, 0.3127557, -0.3263568, 1, 1, 1, 1, 1,
-0.4819399, 1.75601, 0.0696914, 1, 1, 1, 1, 1,
-0.481394, -0.5589893, -1.658386, 0, 0, 1, 1, 1,
-0.480592, -0.0666028, -0.8705993, 1, 0, 0, 1, 1,
-0.4779057, 1.084285, -1.168752, 1, 0, 0, 1, 1,
-0.4771292, 0.1400757, -0.7976272, 1, 0, 0, 1, 1,
-0.4722422, -1.167872, -1.943833, 1, 0, 0, 1, 1,
-0.4701672, 0.2707611, -0.4643041, 1, 0, 0, 1, 1,
-0.4654692, 1.60153, -1.915729, 0, 0, 0, 1, 1,
-0.4638371, -0.3691563, -1.676337, 0, 0, 0, 1, 1,
-0.4629886, 0.8078877, -2.26986, 0, 0, 0, 1, 1,
-0.4627782, 1.362834, -1.698932, 0, 0, 0, 1, 1,
-0.4598305, 0.3479319, 0.5103089, 0, 0, 0, 1, 1,
-0.4588945, 0.1050074, -1.738176, 0, 0, 0, 1, 1,
-0.4530542, -0.4677921, -2.578622, 0, 0, 0, 1, 1,
-0.4500232, 0.2792443, -0.8993037, 1, 1, 1, 1, 1,
-0.448908, 0.1275616, -2.772756, 1, 1, 1, 1, 1,
-0.4482151, -1.280963, -3.259076, 1, 1, 1, 1, 1,
-0.4457945, -0.4305977, -3.165225, 1, 1, 1, 1, 1,
-0.4449058, -1.731365, -2.892616, 1, 1, 1, 1, 1,
-0.4434682, 0.8479768, -0.8401026, 1, 1, 1, 1, 1,
-0.4401633, 1.753397, -0.4483549, 1, 1, 1, 1, 1,
-0.4379179, 0.8123258, -0.8159684, 1, 1, 1, 1, 1,
-0.4363865, 0.7088898, 1.129047, 1, 1, 1, 1, 1,
-0.4339086, -0.6829304, -2.905007, 1, 1, 1, 1, 1,
-0.4291188, -1.659531, -1.758829, 1, 1, 1, 1, 1,
-0.4289332, 0.09282984, -1.684679, 1, 1, 1, 1, 1,
-0.428597, 0.895916, -0.3679102, 1, 1, 1, 1, 1,
-0.426647, -0.3784678, -2.015685, 1, 1, 1, 1, 1,
-0.4260404, 1.511339, -2.425854, 1, 1, 1, 1, 1,
-0.4231747, -0.8460619, -1.741299, 0, 0, 1, 1, 1,
-0.4202979, -1.271529, -2.800784, 1, 0, 0, 1, 1,
-0.4188861, 0.01143887, -2.695911, 1, 0, 0, 1, 1,
-0.4177534, -0.453908, -1.669045, 1, 0, 0, 1, 1,
-0.4120963, -1.811235, -3.683764, 1, 0, 0, 1, 1,
-0.407417, 1.114814, 0.4630786, 1, 0, 0, 1, 1,
-0.4017286, 0.3378814, -0.1909686, 0, 0, 0, 1, 1,
-0.3993721, 0.1034391, 1.236519, 0, 0, 0, 1, 1,
-0.3977515, 0.5102676, -2.755329, 0, 0, 0, 1, 1,
-0.3973646, -1.240048, -2.524623, 0, 0, 0, 1, 1,
-0.3934209, -0.0006613557, -0.419013, 0, 0, 0, 1, 1,
-0.3898392, -0.1800055, -3.033149, 0, 0, 0, 1, 1,
-0.3896201, 1.935365, -0.7719268, 0, 0, 0, 1, 1,
-0.3891188, 0.3378029, 0.2191935, 1, 1, 1, 1, 1,
-0.3885378, -1.479804, -3.230047, 1, 1, 1, 1, 1,
-0.3840544, 0.2958689, 0.02778604, 1, 1, 1, 1, 1,
-0.3805121, -0.9684949, -3.026421, 1, 1, 1, 1, 1,
-0.3780402, 0.04179521, -0.7716032, 1, 1, 1, 1, 1,
-0.3756083, -0.9166245, -3.596512, 1, 1, 1, 1, 1,
-0.3691767, 0.3241305, -0.1692853, 1, 1, 1, 1, 1,
-0.3678314, -0.4058895, -3.259422, 1, 1, 1, 1, 1,
-0.3670342, -2.806636, -2.965992, 1, 1, 1, 1, 1,
-0.3628522, 1.08227, -1.983148, 1, 1, 1, 1, 1,
-0.3571163, -0.09420517, -0.8111401, 1, 1, 1, 1, 1,
-0.3552229, 1.183942, 0.8675835, 1, 1, 1, 1, 1,
-0.3545034, -0.09603494, -1.512676, 1, 1, 1, 1, 1,
-0.3503413, 0.5744275, -2.048435, 1, 1, 1, 1, 1,
-0.349109, 1.002247, 0.4953486, 1, 1, 1, 1, 1,
-0.3481775, -0.2013873, -2.803002, 0, 0, 1, 1, 1,
-0.3382195, -0.7662513, -3.01926, 1, 0, 0, 1, 1,
-0.3349382, 1.037901, -1.057946, 1, 0, 0, 1, 1,
-0.3278224, 0.590552, -0.1188486, 1, 0, 0, 1, 1,
-0.3262295, 0.04773584, -1.769876, 1, 0, 0, 1, 1,
-0.3260559, 1.798187, -1.3018, 1, 0, 0, 1, 1,
-0.3195834, -0.8269973, -3.610206, 0, 0, 0, 1, 1,
-0.3192168, 0.679259, 0.9169726, 0, 0, 0, 1, 1,
-0.3024022, -0.6779735, -4.387861, 0, 0, 0, 1, 1,
-0.2980586, 1.180518, -1.703808, 0, 0, 0, 1, 1,
-0.2978237, -1.096494, -3.470838, 0, 0, 0, 1, 1,
-0.2949073, -1.240121, -2.722752, 0, 0, 0, 1, 1,
-0.2897657, 0.1248918, 1.397401, 0, 0, 0, 1, 1,
-0.2866285, 1.105428, 0.1868244, 1, 1, 1, 1, 1,
-0.2842316, -1.11627, -1.941848, 1, 1, 1, 1, 1,
-0.2799007, -0.4880389, -2.176163, 1, 1, 1, 1, 1,
-0.2779871, -0.194935, -1.416342, 1, 1, 1, 1, 1,
-0.2765914, 0.4331787, -0.4375153, 1, 1, 1, 1, 1,
-0.2734576, 1.190357, -1.354905, 1, 1, 1, 1, 1,
-0.268555, -0.975098, -3.127585, 1, 1, 1, 1, 1,
-0.2657043, 2.950717, -0.9966042, 1, 1, 1, 1, 1,
-0.2642459, -0.4627058, -2.757241, 1, 1, 1, 1, 1,
-0.2621881, -0.1527253, -2.67128, 1, 1, 1, 1, 1,
-0.2601472, -2.006601, -2.761475, 1, 1, 1, 1, 1,
-0.2576343, 2.773335, 0.8449807, 1, 1, 1, 1, 1,
-0.2529897, -0.548457, -2.289334, 1, 1, 1, 1, 1,
-0.2524199, -0.7620109, -2.192857, 1, 1, 1, 1, 1,
-0.2522767, -0.2837749, -0.8515993, 1, 1, 1, 1, 1,
-0.2517745, 0.4329356, 1.006261, 0, 0, 1, 1, 1,
-0.2494111, -0.9422467, -2.779585, 1, 0, 0, 1, 1,
-0.2456928, 0.0697903, -1.094069, 1, 0, 0, 1, 1,
-0.2450155, -0.9447203, -3.435899, 1, 0, 0, 1, 1,
-0.24371, 0.4882206, -1.022974, 1, 0, 0, 1, 1,
-0.2409509, 0.6160839, -0.5787312, 1, 0, 0, 1, 1,
-0.2403152, 0.6996106, -1.971193, 0, 0, 0, 1, 1,
-0.2370228, -1.537092, -2.222646, 0, 0, 0, 1, 1,
-0.2365501, 1.437871, 0.1931833, 0, 0, 0, 1, 1,
-0.2364503, -0.7696921, -3.72862, 0, 0, 0, 1, 1,
-0.233554, -1.079474, -4.20971, 0, 0, 0, 1, 1,
-0.2330619, 0.849928, -1.623474, 0, 0, 0, 1, 1,
-0.230372, -0.1656317, -1.747399, 0, 0, 0, 1, 1,
-0.2292208, -1.607116, -3.759251, 1, 1, 1, 1, 1,
-0.2278051, -0.2425153, -3.546603, 1, 1, 1, 1, 1,
-0.2236607, -0.001767217, -1.568515, 1, 1, 1, 1, 1,
-0.2210871, 2.376898, 0.1245751, 1, 1, 1, 1, 1,
-0.2205985, 0.42041, 0.01213499, 1, 1, 1, 1, 1,
-0.220532, 0.3273309, -1.404849, 1, 1, 1, 1, 1,
-0.2192192, -2.742178, -2.770717, 1, 1, 1, 1, 1,
-0.2179984, -1.28412, -3.433529, 1, 1, 1, 1, 1,
-0.2167175, 0.7118178, 0.3005123, 1, 1, 1, 1, 1,
-0.2163548, -1.800889, -2.544283, 1, 1, 1, 1, 1,
-0.2129572, -0.1691752, -1.925892, 1, 1, 1, 1, 1,
-0.2074808, -0.9815096, -0.4035347, 1, 1, 1, 1, 1,
-0.205846, 0.6418884, -1.60478, 1, 1, 1, 1, 1,
-0.1993927, -1.166589, -2.531061, 1, 1, 1, 1, 1,
-0.1873389, -0.2998585, -3.030949, 1, 1, 1, 1, 1,
-0.1871471, -1.920128, -4.357267, 0, 0, 1, 1, 1,
-0.1868704, -0.255949, -2.810884, 1, 0, 0, 1, 1,
-0.1831045, -0.4957145, -2.302434, 1, 0, 0, 1, 1,
-0.1784795, 0.9479989, -0.2671465, 1, 0, 0, 1, 1,
-0.1727765, 1.161097, 0.2755777, 1, 0, 0, 1, 1,
-0.1725615, -0.4502988, -2.462819, 1, 0, 0, 1, 1,
-0.1566368, 2.489098, -0.6583144, 0, 0, 0, 1, 1,
-0.1505507, -1.918535, -2.044924, 0, 0, 0, 1, 1,
-0.1477503, 0.7024768, -0.7930341, 0, 0, 0, 1, 1,
-0.146769, 1.337248, 0.9326409, 0, 0, 0, 1, 1,
-0.1397616, -0.2221661, -5.23545, 0, 0, 0, 1, 1,
-0.136548, 1.063679, -0.1634486, 0, 0, 0, 1, 1,
-0.13556, -1.739114, -4.528342, 0, 0, 0, 1, 1,
-0.1335406, 0.1959733, -0.5106452, 1, 1, 1, 1, 1,
-0.1313844, 2.354476, -0.60138, 1, 1, 1, 1, 1,
-0.1312919, 0.09744326, 0.5168513, 1, 1, 1, 1, 1,
-0.1279453, -1.06756, -2.144238, 1, 1, 1, 1, 1,
-0.1222859, 1.767536, -0.2082212, 1, 1, 1, 1, 1,
-0.1174333, -0.6610318, -1.648415, 1, 1, 1, 1, 1,
-0.1166472, 2.34991, 0.2042679, 1, 1, 1, 1, 1,
-0.1164049, 1.510459, -0.574187, 1, 1, 1, 1, 1,
-0.1162563, 0.7471158, -0.514234, 1, 1, 1, 1, 1,
-0.1158972, 0.1145736, 0.4575156, 1, 1, 1, 1, 1,
-0.1150386, 0.7486102, -0.614585, 1, 1, 1, 1, 1,
-0.1141326, -0.1138554, -1.406537, 1, 1, 1, 1, 1,
-0.1080328, -1.037902, -3.354369, 1, 1, 1, 1, 1,
-0.1028586, 0.6927925, -1.337286, 1, 1, 1, 1, 1,
-0.09989569, -0.4854221, -3.82547, 1, 1, 1, 1, 1,
-0.09819188, -1.057815, -2.494697, 0, 0, 1, 1, 1,
-0.09814989, -1.10609, -3.074586, 1, 0, 0, 1, 1,
-0.09716347, -2.059757, -2.145796, 1, 0, 0, 1, 1,
-0.09275834, -1.951871, -2.436861, 1, 0, 0, 1, 1,
-0.0918515, 0.9138005, 0.08438089, 1, 0, 0, 1, 1,
-0.09142384, 0.6555226, -1.057124, 1, 0, 0, 1, 1,
-0.08860826, -0.6468872, -3.071605, 0, 0, 0, 1, 1,
-0.08698309, 0.774871, 0.7983936, 0, 0, 0, 1, 1,
-0.08299135, 1.576297, -1.005428, 0, 0, 0, 1, 1,
-0.07664477, 0.7131529, -2.04181, 0, 0, 0, 1, 1,
-0.07541568, 0.4197828, 0.1858689, 0, 0, 0, 1, 1,
-0.07421501, -0.09157646, -1.856539, 0, 0, 0, 1, 1,
-0.07401241, -0.1401263, -1.272145, 0, 0, 0, 1, 1,
-0.06831654, -0.1249198, -1.443046, 1, 1, 1, 1, 1,
-0.06755842, -1.643338, -4.46255, 1, 1, 1, 1, 1,
-0.06710587, -1.162886, -1.296303, 1, 1, 1, 1, 1,
-0.06628953, -0.1193367, -3.181574, 1, 1, 1, 1, 1,
-0.06263519, -2.088907, -2.630937, 1, 1, 1, 1, 1,
-0.06104032, -0.1082765, -3.224342, 1, 1, 1, 1, 1,
-0.06018991, -2.460246, -4.002985, 1, 1, 1, 1, 1,
-0.05954289, 1.25731, 0.02225697, 1, 1, 1, 1, 1,
-0.05489307, 0.4052846, 0.8276091, 1, 1, 1, 1, 1,
-0.05050356, 0.5593878, -1.147554, 1, 1, 1, 1, 1,
-0.04309354, -0.9989423, -3.147245, 1, 1, 1, 1, 1,
-0.04260133, 0.4907227, -0.4184611, 1, 1, 1, 1, 1,
-0.03862568, -0.1876228, -3.834416, 1, 1, 1, 1, 1,
-0.03798901, 0.6319818, -1.373618, 1, 1, 1, 1, 1,
-0.03595992, -0.2678164, -1.297896, 1, 1, 1, 1, 1,
-0.03280911, -0.9279993, -2.588366, 0, 0, 1, 1, 1,
-0.02857103, -0.1913538, -3.554414, 1, 0, 0, 1, 1,
-0.0280801, -0.8493788, -2.630311, 1, 0, 0, 1, 1,
-0.02786558, -0.05208208, -2.819816, 1, 0, 0, 1, 1,
-0.02661306, -0.04462285, -2.036954, 1, 0, 0, 1, 1,
-0.02441612, 2.269991, -0.1743087, 1, 0, 0, 1, 1,
-0.02362585, 0.7744007, 0.4283432, 0, 0, 0, 1, 1,
-0.01957813, 0.8730904, -0.9730246, 0, 0, 0, 1, 1,
-0.01548418, -0.3742596, -4.90781, 0, 0, 0, 1, 1,
-0.01358459, 1.378154, 0.8183532, 0, 0, 0, 1, 1,
-0.01242714, 0.4971666, -0.2084415, 0, 0, 0, 1, 1,
-0.01218448, 0.2638447, -0.7198866, 0, 0, 0, 1, 1,
-0.01094352, -0.8876786, -3.30153, 0, 0, 0, 1, 1,
-0.009841943, 1.003546, 0.3161097, 1, 1, 1, 1, 1,
-0.006885862, -0.2250012, -5.806646, 1, 1, 1, 1, 1,
-0.006166943, -2.176477, -2.144523, 1, 1, 1, 1, 1,
-0.004861458, 1.423666, 0.6686392, 1, 1, 1, 1, 1,
-0.001794559, -0.6596906, -3.470069, 1, 1, 1, 1, 1,
0.002794602, -0.737406, 1.478533, 1, 1, 1, 1, 1,
0.008392064, -0.08343155, 1.381253, 1, 1, 1, 1, 1,
0.00987233, 0.5763433, 1.682463, 1, 1, 1, 1, 1,
0.0103258, -0.9091901, 2.584162, 1, 1, 1, 1, 1,
0.01077791, -1.429232, 2.567504, 1, 1, 1, 1, 1,
0.02054152, -0.07495363, 2.369226, 1, 1, 1, 1, 1,
0.02189917, 0.7585282, -0.9806239, 1, 1, 1, 1, 1,
0.0248854, -1.759986, 4.024808, 1, 1, 1, 1, 1,
0.02644165, 1.069103, 0.5514817, 1, 1, 1, 1, 1,
0.03091172, -1.917288, 2.2786, 1, 1, 1, 1, 1,
0.03132173, 1.960264, -0.978738, 0, 0, 1, 1, 1,
0.03351192, -1.94185, 3.431883, 1, 0, 0, 1, 1,
0.03535251, 2.052197, 1.125176, 1, 0, 0, 1, 1,
0.03594163, 0.2665929, -1.552685, 1, 0, 0, 1, 1,
0.03988341, -1.512274, 3.227096, 1, 0, 0, 1, 1,
0.04043879, -0.3557155, 2.521954, 1, 0, 0, 1, 1,
0.04422193, -0.6238381, 3.41632, 0, 0, 0, 1, 1,
0.04491605, 0.06639033, 0.9561683, 0, 0, 0, 1, 1,
0.04770523, -0.5278057, 2.9902, 0, 0, 0, 1, 1,
0.04965773, -0.1550568, 3.256995, 0, 0, 0, 1, 1,
0.05184593, -1.036792, 3.863537, 0, 0, 0, 1, 1,
0.05854945, -0.4096552, 4.594277, 0, 0, 0, 1, 1,
0.05917009, 0.4072392, -1.110673, 0, 0, 0, 1, 1,
0.05938007, 0.3507158, -0.333964, 1, 1, 1, 1, 1,
0.06112028, -1.29419, 4.148743, 1, 1, 1, 1, 1,
0.0664447, 1.123742, -0.4672649, 1, 1, 1, 1, 1,
0.06668022, -2.079986, 4.187783, 1, 1, 1, 1, 1,
0.06734095, 0.155693, -0.5455977, 1, 1, 1, 1, 1,
0.07656597, 1.862954, -0.2362171, 1, 1, 1, 1, 1,
0.07785873, -0.5627746, 2.189479, 1, 1, 1, 1, 1,
0.07797951, 0.9284388, 2.656249, 1, 1, 1, 1, 1,
0.07820973, 0.3920433, -0.5224063, 1, 1, 1, 1, 1,
0.08044469, -0.754019, 2.483886, 1, 1, 1, 1, 1,
0.08390902, -1.02519, 3.217515, 1, 1, 1, 1, 1,
0.08539985, -1.027788, 3.961975, 1, 1, 1, 1, 1,
0.08821752, 1.318206, 0.3050319, 1, 1, 1, 1, 1,
0.08901457, -1.781633, 1.711856, 1, 1, 1, 1, 1,
0.09024017, -0.06233913, 2.941812, 1, 1, 1, 1, 1,
0.09866057, -0.4005767, 2.146106, 0, 0, 1, 1, 1,
0.09956513, 0.4744179, -0.651298, 1, 0, 0, 1, 1,
0.09959139, -0.4375644, 3.456435, 1, 0, 0, 1, 1,
0.0997094, 0.8096123, -0.1545965, 1, 0, 0, 1, 1,
0.1025254, -1.741998, 2.379283, 1, 0, 0, 1, 1,
0.1039459, -0.307891, 2.418043, 1, 0, 0, 1, 1,
0.1093116, 1.658164, 0.1206046, 0, 0, 0, 1, 1,
0.1095618, 2.141037, 0.8319186, 0, 0, 0, 1, 1,
0.1119861, 0.1725914, 2.08935, 0, 0, 0, 1, 1,
0.1149098, 0.722817, 0.3451918, 0, 0, 0, 1, 1,
0.1157457, -0.8284431, 5.29818, 0, 0, 0, 1, 1,
0.1188169, -0.2305767, 1.733831, 0, 0, 0, 1, 1,
0.1194138, -0.7735202, 2.18237, 0, 0, 0, 1, 1,
0.1253413, 1.379799, 0.03801483, 1, 1, 1, 1, 1,
0.1256263, -0.7598704, 3.64712, 1, 1, 1, 1, 1,
0.1284423, -0.5358623, 2.454502, 1, 1, 1, 1, 1,
0.1289423, -0.1455751, 3.696703, 1, 1, 1, 1, 1,
0.131006, 0.6927994, -0.7619561, 1, 1, 1, 1, 1,
0.1321773, -0.09937309, 0.7067789, 1, 1, 1, 1, 1,
0.1336491, -0.01308773, 2.68263, 1, 1, 1, 1, 1,
0.1500701, -0.02110521, 0.8431983, 1, 1, 1, 1, 1,
0.1534187, -0.6843929, 1.199013, 1, 1, 1, 1, 1,
0.1543979, 1.584005, 0.4161938, 1, 1, 1, 1, 1,
0.1562243, 0.1937773, 1.16792, 1, 1, 1, 1, 1,
0.1622723, 2.022515, 0.1485421, 1, 1, 1, 1, 1,
0.1631163, 0.01617834, 0.8876456, 1, 1, 1, 1, 1,
0.1683103, 0.9713572, -0.227635, 1, 1, 1, 1, 1,
0.1687287, 0.6640694, -0.4838227, 1, 1, 1, 1, 1,
0.1705527, 0.8441985, -1.773209, 0, 0, 1, 1, 1,
0.1729817, -0.259221, 2.475066, 1, 0, 0, 1, 1,
0.1736289, 0.4117698, -2.101869, 1, 0, 0, 1, 1,
0.177751, 2.177949, -0.3123601, 1, 0, 0, 1, 1,
0.1784649, -0.1081734, 2.921537, 1, 0, 0, 1, 1,
0.1803053, 0.001920414, 0.3056239, 1, 0, 0, 1, 1,
0.1809534, 0.4395367, 2.707376, 0, 0, 0, 1, 1,
0.1850831, 2.684285, 0.4799213, 0, 0, 0, 1, 1,
0.1894217, -1.498993, 3.822558, 0, 0, 0, 1, 1,
0.1906716, -0.9181386, 3.311278, 0, 0, 0, 1, 1,
0.1923297, 0.6543595, 0.8784712, 0, 0, 0, 1, 1,
0.196096, -0.8740888, 2.93133, 0, 0, 0, 1, 1,
0.1976651, 0.9017591, -0.3636827, 0, 0, 0, 1, 1,
0.20283, 0.2565804, -0.4621146, 1, 1, 1, 1, 1,
0.2046684, -1.49921, 1.471249, 1, 1, 1, 1, 1,
0.2060782, -0.05146439, 3.628431, 1, 1, 1, 1, 1,
0.2071584, 0.4814225, 0.3303268, 1, 1, 1, 1, 1,
0.2099038, 0.730805, 0.6666759, 1, 1, 1, 1, 1,
0.2120174, -0.07307792, -0.45886, 1, 1, 1, 1, 1,
0.2176765, 1.295015, 1.523811, 1, 1, 1, 1, 1,
0.2196036, 0.463589, -0.9378376, 1, 1, 1, 1, 1,
0.2212722, -0.4215231, 0.7098694, 1, 1, 1, 1, 1,
0.222812, -0.200217, 1.41781, 1, 1, 1, 1, 1,
0.2234613, 1.509476, -0.3830067, 1, 1, 1, 1, 1,
0.2237545, -0.02796179, 0.5746187, 1, 1, 1, 1, 1,
0.2240193, -0.4658043, 2.971066, 1, 1, 1, 1, 1,
0.2258424, -0.6613219, 3.723319, 1, 1, 1, 1, 1,
0.2270363, -1.417737, 1.886907, 1, 1, 1, 1, 1,
0.2351119, 0.1080931, 0.9869375, 0, 0, 1, 1, 1,
0.23525, 0.5525882, 0.4268348, 1, 0, 0, 1, 1,
0.2367146, -0.3957351, 2.478735, 1, 0, 0, 1, 1,
0.2447345, -0.473704, 1.664084, 1, 0, 0, 1, 1,
0.2463482, 1.434488, 0.1718759, 1, 0, 0, 1, 1,
0.2470184, 1.000844, 0.7784704, 1, 0, 0, 1, 1,
0.2476208, 7.024445e-05, 1.138795, 0, 0, 0, 1, 1,
0.2482285, 0.6173797, 0.9146652, 0, 0, 0, 1, 1,
0.2492192, 0.7607188, -1.088281, 0, 0, 0, 1, 1,
0.2525572, -2.864605, 2.198554, 0, 0, 0, 1, 1,
0.2527956, -1.004291, 1.552817, 0, 0, 0, 1, 1,
0.2530292, -0.4989478, 2.752448, 0, 0, 0, 1, 1,
0.2569447, 1.350483, 0.5872751, 0, 0, 0, 1, 1,
0.2649682, 1.761284, 1.715948, 1, 1, 1, 1, 1,
0.2672317, -1.371297, 4.212641, 1, 1, 1, 1, 1,
0.2672343, -0.0264718, 1.105445, 1, 1, 1, 1, 1,
0.2717196, -0.2701338, 1.705908, 1, 1, 1, 1, 1,
0.2800555, -1.004754, 3.948415, 1, 1, 1, 1, 1,
0.2908517, -0.3728662, 1.851841, 1, 1, 1, 1, 1,
0.2913255, 0.1649939, 1.298877, 1, 1, 1, 1, 1,
0.2931452, 2.024189, 1.243295, 1, 1, 1, 1, 1,
0.2959291, -0.8722557, 0.7164631, 1, 1, 1, 1, 1,
0.2963096, -0.1995764, 2.217334, 1, 1, 1, 1, 1,
0.2974143, -1.000104, 3.297857, 1, 1, 1, 1, 1,
0.2974932, -0.08786988, 0.3673907, 1, 1, 1, 1, 1,
0.2986304, -0.4238102, 2.100758, 1, 1, 1, 1, 1,
0.2987964, 1.683959, -0.2871999, 1, 1, 1, 1, 1,
0.3006513, -0.9590149, 3.617747, 1, 1, 1, 1, 1,
0.301304, 0.1397824, 2.474356, 0, 0, 1, 1, 1,
0.3016118, -0.3716457, 3.479912, 1, 0, 0, 1, 1,
0.3043531, -1.665498, 3.296804, 1, 0, 0, 1, 1,
0.3060479, 0.3100338, 0.4506878, 1, 0, 0, 1, 1,
0.3080586, -0.01655568, 0.3788371, 1, 0, 0, 1, 1,
0.3101663, 0.5344689, 2.176039, 1, 0, 0, 1, 1,
0.3179499, 0.1965226, 0.1541086, 0, 0, 0, 1, 1,
0.3238719, 1.403385, -0.3782895, 0, 0, 0, 1, 1,
0.3265495, 0.01965616, 2.043643, 0, 0, 0, 1, 1,
0.3285506, -1.347302, 3.706317, 0, 0, 0, 1, 1,
0.3298093, 0.4274556, 0.4682611, 0, 0, 0, 1, 1,
0.3328135, 1.432561, -0.6782976, 0, 0, 0, 1, 1,
0.3339902, -0.7384959, 3.038543, 0, 0, 0, 1, 1,
0.3360201, -0.009610312, 2.467821, 1, 1, 1, 1, 1,
0.3373535, -0.2363387, 4.336654, 1, 1, 1, 1, 1,
0.3384672, 0.9135006, 1.401916, 1, 1, 1, 1, 1,
0.3416524, -1.240552, 2.616065, 1, 1, 1, 1, 1,
0.353133, 0.50512, 0.9316728, 1, 1, 1, 1, 1,
0.3540239, -1.235738, 3.178341, 1, 1, 1, 1, 1,
0.3545149, 1.834669, -0.8912759, 1, 1, 1, 1, 1,
0.35723, 1.276298, 1.030496, 1, 1, 1, 1, 1,
0.3590644, -0.1502745, 4.74587, 1, 1, 1, 1, 1,
0.3645702, 0.6296336, 1.043811, 1, 1, 1, 1, 1,
0.3661259, 0.04828418, 1.851568, 1, 1, 1, 1, 1,
0.3671412, 0.4214413, 1.357039, 1, 1, 1, 1, 1,
0.3675898, -1.169298, 2.504973, 1, 1, 1, 1, 1,
0.3679766, 1.485176, 2.095901, 1, 1, 1, 1, 1,
0.3684331, -3.25203, 3.76598, 1, 1, 1, 1, 1,
0.3712137, -0.2377619, 2.200146, 0, 0, 1, 1, 1,
0.3768025, -0.1364691, 1.438922, 1, 0, 0, 1, 1,
0.3777933, -0.1522274, 1.396274, 1, 0, 0, 1, 1,
0.378668, -0.4894998, 1.749878, 1, 0, 0, 1, 1,
0.3792701, -1.024254, 3.653947, 1, 0, 0, 1, 1,
0.3801783, -1.376358, 3.650491, 1, 0, 0, 1, 1,
0.3820434, -0.7482001, 3.2901, 0, 0, 0, 1, 1,
0.3863104, 0.6915121, -0.8292342, 0, 0, 0, 1, 1,
0.3900747, 0.4261892, 1.688715, 0, 0, 0, 1, 1,
0.3923472, -1.851619, 3.557852, 0, 0, 0, 1, 1,
0.4020042, 0.8068929, 0.7562741, 0, 0, 0, 1, 1,
0.4025648, 2.034611, 1.076114, 0, 0, 0, 1, 1,
0.4052148, 0.4852729, 1.840377, 0, 0, 0, 1, 1,
0.4134623, -0.08151294, 1.781443, 1, 1, 1, 1, 1,
0.4136066, 0.5513599, -0.3038257, 1, 1, 1, 1, 1,
0.4151475, 0.4221285, 0.2393159, 1, 1, 1, 1, 1,
0.416503, -1.504686, 3.422356, 1, 1, 1, 1, 1,
0.4171247, 0.3749168, -0.2702554, 1, 1, 1, 1, 1,
0.4280039, -0.9944149, 2.629083, 1, 1, 1, 1, 1,
0.4291056, 1.338452, 0.3501298, 1, 1, 1, 1, 1,
0.4291425, 0.695606, 0.5210193, 1, 1, 1, 1, 1,
0.4296267, 0.8354449, -1.238643, 1, 1, 1, 1, 1,
0.4309065, 0.001559009, 2.522994, 1, 1, 1, 1, 1,
0.4321605, 1.817659, -1.141303, 1, 1, 1, 1, 1,
0.4328439, -1.206137, 3.147539, 1, 1, 1, 1, 1,
0.4335477, -1.679419, 4.393471, 1, 1, 1, 1, 1,
0.4362834, -1.141038, 1.81183, 1, 1, 1, 1, 1,
0.4377546, 0.7383776, -0.07160302, 1, 1, 1, 1, 1,
0.4450251, 0.6946369, 0.7093712, 0, 0, 1, 1, 1,
0.4474649, 0.2418962, 1.293239, 1, 0, 0, 1, 1,
0.4509195, -1.894442, 2.850928, 1, 0, 0, 1, 1,
0.451897, -0.3667019, 0.4019621, 1, 0, 0, 1, 1,
0.4527925, 1.507284, 0.8701541, 1, 0, 0, 1, 1,
0.4575925, -0.3864964, 3.528158, 1, 0, 0, 1, 1,
0.4576757, -0.1770125, 3.961229, 0, 0, 0, 1, 1,
0.4600504, -0.1717959, 1.443789, 0, 0, 0, 1, 1,
0.4628925, -0.218788, 0.3630871, 0, 0, 0, 1, 1,
0.4662464, 0.2742329, 0.5060337, 0, 0, 0, 1, 1,
0.4674365, -1.238903, 2.42892, 0, 0, 0, 1, 1,
0.4680265, 0.242525, 2.132947, 0, 0, 0, 1, 1,
0.4712895, 0.2533081, -0.4041255, 0, 0, 0, 1, 1,
0.4737978, -0.002960735, 0.4816116, 1, 1, 1, 1, 1,
0.4743631, 0.1950347, 1.163407, 1, 1, 1, 1, 1,
0.4840392, -0.6491887, 1.72224, 1, 1, 1, 1, 1,
0.4850145, 0.1229214, 1.700184, 1, 1, 1, 1, 1,
0.4974269, 0.399756, 2.254258, 1, 1, 1, 1, 1,
0.4993788, -0.3054836, 3.115861, 1, 1, 1, 1, 1,
0.5020524, -0.3626681, 2.041263, 1, 1, 1, 1, 1,
0.5026331, 0.6330245, 0.03648163, 1, 1, 1, 1, 1,
0.5039987, -0.6879894, 2.522559, 1, 1, 1, 1, 1,
0.5043079, -0.3576875, 2.51408, 1, 1, 1, 1, 1,
0.5052537, -1.272133, 2.901876, 1, 1, 1, 1, 1,
0.5053049, 0.3245583, 1.726375, 1, 1, 1, 1, 1,
0.5056261, 1.503034, 0.3148783, 1, 1, 1, 1, 1,
0.505767, 0.5026358, 2.163727, 1, 1, 1, 1, 1,
0.5058987, -0.190655, 1.447047, 1, 1, 1, 1, 1,
0.5068419, -0.428188, 1.9705, 0, 0, 1, 1, 1,
0.5076872, -1.280434, 1.758303, 1, 0, 0, 1, 1,
0.507929, -0.3124862, 1.379164, 1, 0, 0, 1, 1,
0.5115374, 1.745353, -0.886347, 1, 0, 0, 1, 1,
0.5176521, -0.611131, 1.87542, 1, 0, 0, 1, 1,
0.5214199, 1.15914, 1.126865, 1, 0, 0, 1, 1,
0.5219634, 1.162154, 0.9562857, 0, 0, 0, 1, 1,
0.5227631, 1.351108, -0.685326, 0, 0, 0, 1, 1,
0.5257615, -0.2335359, 2.544901, 0, 0, 0, 1, 1,
0.5268791, -0.4672422, 2.343623, 0, 0, 0, 1, 1,
0.5303024, -1.900796, 2.262143, 0, 0, 0, 1, 1,
0.5308863, -0.5460755, 3.049627, 0, 0, 0, 1, 1,
0.5338287, -0.5914782, 1.402668, 0, 0, 0, 1, 1,
0.5407425, -0.7545731, 1.941544, 1, 1, 1, 1, 1,
0.5534492, 0.8374775, -0.1048366, 1, 1, 1, 1, 1,
0.5623163, -0.9981821, 3.146311, 1, 1, 1, 1, 1,
0.5625813, -0.2600679, 0.6560409, 1, 1, 1, 1, 1,
0.5643133, -0.4707709, 2.900889, 1, 1, 1, 1, 1,
0.5688073, 1.372247, 1.126042, 1, 1, 1, 1, 1,
0.568968, 1.088097, -0.6732394, 1, 1, 1, 1, 1,
0.5692845, -0.5522738, 1.082857, 1, 1, 1, 1, 1,
0.5695501, 0.8294886, -0.7350582, 1, 1, 1, 1, 1,
0.5717645, -0.5498796, 2.394895, 1, 1, 1, 1, 1,
0.5725248, -0.5236287, 2.226715, 1, 1, 1, 1, 1,
0.5738571, 1.124691, -0.6145487, 1, 1, 1, 1, 1,
0.5752334, 1.622981, 0.2806862, 1, 1, 1, 1, 1,
0.5767095, -0.3996459, 2.92715, 1, 1, 1, 1, 1,
0.5812593, -1.100126, 2.441879, 1, 1, 1, 1, 1,
0.5871307, -0.3281097, 2.456511, 0, 0, 1, 1, 1,
0.5898222, 1.867454, -0.1371589, 1, 0, 0, 1, 1,
0.5923203, 1.045809, 1.400594, 1, 0, 0, 1, 1,
0.5927951, -0.624841, 1.79555, 1, 0, 0, 1, 1,
0.5932179, -0.2239365, 2.010728, 1, 0, 0, 1, 1,
0.594063, 1.103362, 1.236754, 1, 0, 0, 1, 1,
0.5944099, -0.7668161, 2.793457, 0, 0, 0, 1, 1,
0.6040939, -0.007808766, 3.016919, 0, 0, 0, 1, 1,
0.6088266, -1.525808, 2.895093, 0, 0, 0, 1, 1,
0.6095584, 0.874733, 1.214556, 0, 0, 0, 1, 1,
0.6230727, 0.9999257, -0.06394982, 0, 0, 0, 1, 1,
0.6231071, -1.27657, 3.972733, 0, 0, 0, 1, 1,
0.6270922, 0.9817658, 0.756849, 0, 0, 0, 1, 1,
0.6319107, 0.1431449, 2.506476, 1, 1, 1, 1, 1,
0.632178, -0.2218612, 4.251552, 1, 1, 1, 1, 1,
0.632297, -0.5011432, 1.004682, 1, 1, 1, 1, 1,
0.6370159, -0.8177013, 1.482798, 1, 1, 1, 1, 1,
0.6381183, 0.7693774, 1.979471, 1, 1, 1, 1, 1,
0.6398503, 1.939441, -0.5391662, 1, 1, 1, 1, 1,
0.6488774, -1.210682, 3.247457, 1, 1, 1, 1, 1,
0.660542, 0.5493048, 0.1455002, 1, 1, 1, 1, 1,
0.6615248, -1.077607, 3.682396, 1, 1, 1, 1, 1,
0.6668175, 0.9473713, -0.4726343, 1, 1, 1, 1, 1,
0.6702865, 0.5027748, 1.132554, 1, 1, 1, 1, 1,
0.6739379, -1.341593, 3.377415, 1, 1, 1, 1, 1,
0.6766914, 0.8967419, -0.7829754, 1, 1, 1, 1, 1,
0.6782277, -0.2065177, 2.362924, 1, 1, 1, 1, 1,
0.6782304, -1.898457, 1.604784, 1, 1, 1, 1, 1,
0.6789083, -0.4393157, 3.812146, 0, 0, 1, 1, 1,
0.6805344, -2.446903, 2.93716, 1, 0, 0, 1, 1,
0.6837862, 0.5582101, 0.568053, 1, 0, 0, 1, 1,
0.6858204, -0.226458, 1.671033, 1, 0, 0, 1, 1,
0.6878222, 0.2370643, 0.3374817, 1, 0, 0, 1, 1,
0.6946489, 0.7291995, 0.7066916, 1, 0, 0, 1, 1,
0.6952034, 1.041288, 1.456655, 0, 0, 0, 1, 1,
0.696592, -0.1582182, 2.063549, 0, 0, 0, 1, 1,
0.703889, -0.1792586, 4.801538, 0, 0, 0, 1, 1,
0.7050597, -1.188614, 0.934819, 0, 0, 0, 1, 1,
0.7058443, -1.36035, 4.355052, 0, 0, 0, 1, 1,
0.7118858, 0.4873653, -0.02492427, 0, 0, 0, 1, 1,
0.7123186, -1.216694, 3.404782, 0, 0, 0, 1, 1,
0.7149858, -0.5899847, 1.497969, 1, 1, 1, 1, 1,
0.7176688, 1.985552, 1.083818, 1, 1, 1, 1, 1,
0.7249672, 1.860554, 0.3087187, 1, 1, 1, 1, 1,
0.7290792, -0.9612049, 1.648191, 1, 1, 1, 1, 1,
0.7342349, -1.594517, 2.214897, 1, 1, 1, 1, 1,
0.7369885, 1.1886, 1.138929, 1, 1, 1, 1, 1,
0.7400387, -0.3728381, 0.3293772, 1, 1, 1, 1, 1,
0.746381, -0.1056978, 2.234492, 1, 1, 1, 1, 1,
0.7513487, 1.617294, 2.25062, 1, 1, 1, 1, 1,
0.7533144, -0.7097946, 1.173453, 1, 1, 1, 1, 1,
0.7536559, -0.5544696, 2.394954, 1, 1, 1, 1, 1,
0.7650616, -1.843853, 3.152166, 1, 1, 1, 1, 1,
0.7654112, 2.24585, 0.3556162, 1, 1, 1, 1, 1,
0.7662026, 1.109787, 1.354437, 1, 1, 1, 1, 1,
0.7666598, 1.490266, 1.433234, 1, 1, 1, 1, 1,
0.767778, -0.9788009, 3.642302, 0, 0, 1, 1, 1,
0.7708016, -0.7123702, 4.582493, 1, 0, 0, 1, 1,
0.7720073, 1.144763, 0.4305203, 1, 0, 0, 1, 1,
0.7738392, -0.1580966, 1.925091, 1, 0, 0, 1, 1,
0.7740793, -1.906318, 4.163539, 1, 0, 0, 1, 1,
0.7754837, 0.6786616, 1.401479, 1, 0, 0, 1, 1,
0.7792232, -0.450374, 0.3153709, 0, 0, 0, 1, 1,
0.7798254, -0.1045416, 2.150357, 0, 0, 0, 1, 1,
0.7818282, 2.202786, 0.9214418, 0, 0, 0, 1, 1,
0.7888972, 0.9463516, 0.7187568, 0, 0, 0, 1, 1,
0.7905344, 0.8220491, -0.4952041, 0, 0, 0, 1, 1,
0.7906179, 0.6934384, 2.652595, 0, 0, 0, 1, 1,
0.7940862, 0.7756273, 1.594777, 0, 0, 0, 1, 1,
0.7990733, 0.3610083, 1.119826, 1, 1, 1, 1, 1,
0.8042041, 0.220118, 2.476797, 1, 1, 1, 1, 1,
0.8052486, -1.14589, 2.727645, 1, 1, 1, 1, 1,
0.8105735, 0.6441131, 0.192425, 1, 1, 1, 1, 1,
0.8163587, -1.528699, 2.811727, 1, 1, 1, 1, 1,
0.819568, -0.8199884, 1.344217, 1, 1, 1, 1, 1,
0.8222854, 0.6784241, 0.7424264, 1, 1, 1, 1, 1,
0.8237104, -0.4922344, 1.025562, 1, 1, 1, 1, 1,
0.8257863, -1.209494, 2.763876, 1, 1, 1, 1, 1,
0.8302282, -0.2526083, 2.948377, 1, 1, 1, 1, 1,
0.8328176, 0.9091788, 0.4421006, 1, 1, 1, 1, 1,
0.8338025, 1.301929, 1.533646, 1, 1, 1, 1, 1,
0.8341737, -0.5232936, 1.487652, 1, 1, 1, 1, 1,
0.835952, 0.06860483, 0.9409422, 1, 1, 1, 1, 1,
0.8373462, 1.128491, -1.499344, 1, 1, 1, 1, 1,
0.8405422, 0.7593133, 1.160907, 0, 0, 1, 1, 1,
0.8511597, 1.765334, 1.564553, 1, 0, 0, 1, 1,
0.8545216, -0.4595361, 0.796576, 1, 0, 0, 1, 1,
0.8573847, 1.186738, 0.4239772, 1, 0, 0, 1, 1,
0.8598343, 0.4268939, 1.138079, 1, 0, 0, 1, 1,
0.8600336, -1.366684, 1.390796, 1, 0, 0, 1, 1,
0.8645618, -0.1092848, 1.961409, 0, 0, 0, 1, 1,
0.8647475, -0.6747783, 1.914881, 0, 0, 0, 1, 1,
0.8655148, 0.3380544, 3.324545, 0, 0, 0, 1, 1,
0.8679813, -0.3008492, 1.739244, 0, 0, 0, 1, 1,
0.8701562, 1.531379, -0.2254459, 0, 0, 0, 1, 1,
0.8747471, -0.6205766, 3.427801, 0, 0, 0, 1, 1,
0.8759094, 0.7819547, 0.972127, 0, 0, 0, 1, 1,
0.885799, 0.03171214, 0.5966542, 1, 1, 1, 1, 1,
0.9070325, -1.135728, 1.136942, 1, 1, 1, 1, 1,
0.9173537, -1.303941, 4.700841, 1, 1, 1, 1, 1,
0.9200802, 0.9200639, -0.2627163, 1, 1, 1, 1, 1,
0.9217686, -2.242985, 2.792643, 1, 1, 1, 1, 1,
0.9230963, -0.713447, 4.000041, 1, 1, 1, 1, 1,
0.9249169, -1.41418, 2.02096, 1, 1, 1, 1, 1,
0.9311918, -0.4089496, 2.671722, 1, 1, 1, 1, 1,
0.9321939, -0.3016328, 2.933769, 1, 1, 1, 1, 1,
0.9332845, 0.6830096, 0.009541886, 1, 1, 1, 1, 1,
0.9402295, -0.5957727, 2.137387, 1, 1, 1, 1, 1,
0.9455358, 0.08948293, 0.1742582, 1, 1, 1, 1, 1,
0.9478267, -0.6087079, 2.633917, 1, 1, 1, 1, 1,
0.9492784, -0.7393499, 3.416175, 1, 1, 1, 1, 1,
0.9498442, 1.551158, -0.6602938, 1, 1, 1, 1, 1,
0.9503725, 0.8281435, 0.6876708, 0, 0, 1, 1, 1,
0.9526359, 1.041848, 0.7173322, 1, 0, 0, 1, 1,
0.9533724, -0.9488033, 0.348285, 1, 0, 0, 1, 1,
0.9591478, -0.4529735, 1.25234, 1, 0, 0, 1, 1,
0.9593689, -1.267948, 2.461394, 1, 0, 0, 1, 1,
0.9607004, 0.5627109, 0.3790257, 1, 0, 0, 1, 1,
0.9627181, 0.2526634, 0.5319336, 0, 0, 0, 1, 1,
0.9635884, 2.364358, -0.07992005, 0, 0, 0, 1, 1,
0.9670815, 1.131556, -1.062227, 0, 0, 0, 1, 1,
0.9678513, 0.9031743, 2.143285, 0, 0, 0, 1, 1,
0.9750126, 0.4427651, 1.550027, 0, 0, 0, 1, 1,
0.9755496, 0.1515967, 1.081648, 0, 0, 0, 1, 1,
0.9791102, -1.68142, 1.845077, 0, 0, 0, 1, 1,
0.9846722, -1.19081, 1.593021, 1, 1, 1, 1, 1,
0.9856566, 2.0124, 0.7025905, 1, 1, 1, 1, 1,
0.9892806, -0.6530979, 4.05475, 1, 1, 1, 1, 1,
0.9906504, -0.8325204, 2.055829, 1, 1, 1, 1, 1,
0.9948124, -0.605135, 3.479369, 1, 1, 1, 1, 1,
0.9960352, 0.2112269, 3.072276, 1, 1, 1, 1, 1,
0.996803, -0.6936515, 3.645198, 1, 1, 1, 1, 1,
1.001806, -1.123187, 3.611567, 1, 1, 1, 1, 1,
1.003219, -0.05482151, 0.3235011, 1, 1, 1, 1, 1,
1.004767, -0.9917411, 1.65881, 1, 1, 1, 1, 1,
1.013205, -1.761945, 4.095223, 1, 1, 1, 1, 1,
1.015978, -0.7436638, 0.6975668, 1, 1, 1, 1, 1,
1.021851, -0.2192345, 1.870325, 1, 1, 1, 1, 1,
1.024098, -0.9491313, 2.23956, 1, 1, 1, 1, 1,
1.027463, -0.4987602, 1.695448, 1, 1, 1, 1, 1,
1.033161, 0.1642691, 2.506375, 0, 0, 1, 1, 1,
1.035479, -0.2005354, 2.251765, 1, 0, 0, 1, 1,
1.039515, 1.206416, 2.428524, 1, 0, 0, 1, 1,
1.040574, 0.05932095, 0.5701827, 1, 0, 0, 1, 1,
1.041566, -2.270639, 3.117766, 1, 0, 0, 1, 1,
1.042572, 0.520565, 0.8847025, 1, 0, 0, 1, 1,
1.042944, 0.8046767, 0.7381687, 0, 0, 0, 1, 1,
1.050734, -0.7020227, 1.738211, 0, 0, 0, 1, 1,
1.054078, -0.3500478, 2.737773, 0, 0, 0, 1, 1,
1.054915, -0.4492409, 4.614073, 0, 0, 0, 1, 1,
1.065482, -1.394122, 4.140082, 0, 0, 0, 1, 1,
1.068433, 1.001067, -0.620512, 0, 0, 0, 1, 1,
1.068855, 0.4505148, -0.6700543, 0, 0, 0, 1, 1,
1.069485, -1.01034, 3.274453, 1, 1, 1, 1, 1,
1.070959, -0.02195074, 1.096894, 1, 1, 1, 1, 1,
1.07953, -0.1991876, 0.4760705, 1, 1, 1, 1, 1,
1.082247, 0.2690009, 2.256393, 1, 1, 1, 1, 1,
1.083588, -1.243255, 2.83203, 1, 1, 1, 1, 1,
1.084423, -0.2175406, 0.9571438, 1, 1, 1, 1, 1,
1.087249, 1.411091, 1.27144, 1, 1, 1, 1, 1,
1.092542, -0.1687356, 0.9769837, 1, 1, 1, 1, 1,
1.097697, -0.2668072, 2.150646, 1, 1, 1, 1, 1,
1.1005, -1.674996, 2.266848, 1, 1, 1, 1, 1,
1.102385, 1.197925, -0.732667, 1, 1, 1, 1, 1,
1.104121, 0.02308043, 2.892164, 1, 1, 1, 1, 1,
1.108136, -1.997108, 1.772275, 1, 1, 1, 1, 1,
1.112509, -0.8287255, -0.470126, 1, 1, 1, 1, 1,
1.118241, 0.1377666, 2.259437, 1, 1, 1, 1, 1,
1.124779, 1.267607, 0.9168445, 0, 0, 1, 1, 1,
1.12592, -1.614086, 0.4576382, 1, 0, 0, 1, 1,
1.140658, -0.5931899, 2.567237, 1, 0, 0, 1, 1,
1.142563, -0.5383467, 1.885132, 1, 0, 0, 1, 1,
1.145482, -0.4175315, 1.627239, 1, 0, 0, 1, 1,
1.14646, -0.5869782, 2.01012, 1, 0, 0, 1, 1,
1.152824, 1.054412, 0.1093142, 0, 0, 0, 1, 1,
1.15905, 0.7398188, 1.482443, 0, 0, 0, 1, 1,
1.165339, 1.7756, 1.686648, 0, 0, 0, 1, 1,
1.166665, 0.9509826, 1.682048, 0, 0, 0, 1, 1,
1.172969, 1.293881, 1.168969, 0, 0, 0, 1, 1,
1.174124, -2.640677, 2.677715, 0, 0, 0, 1, 1,
1.178067, -1.515835, 2.918944, 0, 0, 0, 1, 1,
1.180565, 0.4487105, -0.01261265, 1, 1, 1, 1, 1,
1.184739, 1.885089, -0.2254374, 1, 1, 1, 1, 1,
1.189984, -1.254885, 3.142444, 1, 1, 1, 1, 1,
1.200434, 0.9162785, 1.872195, 1, 1, 1, 1, 1,
1.202861, 0.2349029, 1.545203, 1, 1, 1, 1, 1,
1.203168, 1.229703, 4.646669, 1, 1, 1, 1, 1,
1.215314, 0.2772172, 0.8855062, 1, 1, 1, 1, 1,
1.215411, 0.5845503, 0.9596791, 1, 1, 1, 1, 1,
1.215895, -0.1820996, 3.985654, 1, 1, 1, 1, 1,
1.219756, 0.8925409, 1.675227, 1, 1, 1, 1, 1,
1.231937, 1.062576, 1.024057, 1, 1, 1, 1, 1,
1.234225, 1.542071, 0.4734607, 1, 1, 1, 1, 1,
1.236658, -1.245985, 1.409244, 1, 1, 1, 1, 1,
1.242238, -0.008875834, 1.521176, 1, 1, 1, 1, 1,
1.244473, -0.02262655, 2.058196, 1, 1, 1, 1, 1,
1.24533, -1.29628, 2.492565, 0, 0, 1, 1, 1,
1.249257, 1.189067, 0.05567011, 1, 0, 0, 1, 1,
1.250631, 2.629218, -0.9071935, 1, 0, 0, 1, 1,
1.266313, 1.671974, -0.4652452, 1, 0, 0, 1, 1,
1.282464, -0.8518436, 1.808952, 1, 0, 0, 1, 1,
1.285135, 0.02918948, 1.916041, 1, 0, 0, 1, 1,
1.286714, 0.2675693, 3.078071, 0, 0, 0, 1, 1,
1.290683, -0.4772006, 1.931442, 0, 0, 0, 1, 1,
1.293499, 0.7739169, 2.31345, 0, 0, 0, 1, 1,
1.298277, -0.5341267, 1.40743, 0, 0, 0, 1, 1,
1.299542, 0.1994872, 0.7330297, 0, 0, 0, 1, 1,
1.300457, -1.762796, 3.622084, 0, 0, 0, 1, 1,
1.312571, -0.4148469, 0.2558644, 0, 0, 0, 1, 1,
1.313841, -0.5322768, 0.6999717, 1, 1, 1, 1, 1,
1.328975, -2.904902, 1.536112, 1, 1, 1, 1, 1,
1.345533, -0.0330395, 2.099771, 1, 1, 1, 1, 1,
1.361253, 0.1624451, 0.1924548, 1, 1, 1, 1, 1,
1.364485, 0.334176, 1.245844, 1, 1, 1, 1, 1,
1.379305, -0.7779486, 1.033771, 1, 1, 1, 1, 1,
1.383997, 1.906092, 0.2361279, 1, 1, 1, 1, 1,
1.399333, -0.9704588, 2.215239, 1, 1, 1, 1, 1,
1.409498, -0.3816161, 2.112451, 1, 1, 1, 1, 1,
1.416647, 0.08078162, 1.826181, 1, 1, 1, 1, 1,
1.429569, -0.3692954, 2.190278, 1, 1, 1, 1, 1,
1.436794, -0.995043, 1.734618, 1, 1, 1, 1, 1,
1.442456, 0.5333926, 0.08709276, 1, 1, 1, 1, 1,
1.455289, 0.2639399, 3.62183, 1, 1, 1, 1, 1,
1.460041, 0.9312581, 0.415103, 1, 1, 1, 1, 1,
1.470133, -0.890079, 2.72909, 0, 0, 1, 1, 1,
1.486177, 0.9069126, 2.737199, 1, 0, 0, 1, 1,
1.489323, 0.4750479, -0.4204452, 1, 0, 0, 1, 1,
1.496486, 0.3065945, 0.07342481, 1, 0, 0, 1, 1,
1.499901, -1.244243, 1.488415, 1, 0, 0, 1, 1,
1.504806, -0.1145137, 1.726125, 1, 0, 0, 1, 1,
1.515131, 1.256439, -1.076087, 0, 0, 0, 1, 1,
1.522484, 0.9290997, 1.356371, 0, 0, 0, 1, 1,
1.532209, 0.3307264, 1.202418, 0, 0, 0, 1, 1,
1.55789, -1.101877, 1.363849, 0, 0, 0, 1, 1,
1.56981, -3.679249, 4.613571, 0, 0, 0, 1, 1,
1.5817, -0.2573752, 0.1899249, 0, 0, 0, 1, 1,
1.590122, 0.1304763, 1.446314, 0, 0, 0, 1, 1,
1.593561, -0.06454475, 1.331191, 1, 1, 1, 1, 1,
1.595455, -1.585193, 3.024349, 1, 1, 1, 1, 1,
1.60232, 1.580561, 1.180568, 1, 1, 1, 1, 1,
1.607228, 0.3119048, 1.450549, 1, 1, 1, 1, 1,
1.609773, 1.420617, -0.1821445, 1, 1, 1, 1, 1,
1.657735, 0.6860037, 0.8866875, 1, 1, 1, 1, 1,
1.667161, -0.04270079, 0.642315, 1, 1, 1, 1, 1,
1.674936, 0.6197968, -0.4087229, 1, 1, 1, 1, 1,
1.69548, -1.902296, 3.358562, 1, 1, 1, 1, 1,
1.718838, -0.2007891, 1.906927, 1, 1, 1, 1, 1,
1.724371, 0.4019344, -0.3948337, 1, 1, 1, 1, 1,
1.72855, -1.297492, 1.837541, 1, 1, 1, 1, 1,
1.740613, -0.6372339, 3.735571, 1, 1, 1, 1, 1,
1.743782, 2.671633, 2.01003, 1, 1, 1, 1, 1,
1.744175, -0.4403886, 2.447255, 1, 1, 1, 1, 1,
1.746728, -1.3657, 1.434297, 0, 0, 1, 1, 1,
1.748494, -0.9998083, 3.303432, 1, 0, 0, 1, 1,
1.760855, -0.18072, 0.277664, 1, 0, 0, 1, 1,
1.765365, 0.2604871, -0.661301, 1, 0, 0, 1, 1,
1.794331, 1.615804, 0.6750615, 1, 0, 0, 1, 1,
1.822739, 0.6925016, 1.009254, 1, 0, 0, 1, 1,
1.836325, -0.7698576, 2.873919, 0, 0, 0, 1, 1,
1.850672, -0.1310922, 0.8896598, 0, 0, 0, 1, 1,
1.851734, -2.535757, 3.269116, 0, 0, 0, 1, 1,
1.854347, -0.370414, 1.951462, 0, 0, 0, 1, 1,
1.856066, -0.2761407, 1.565259, 0, 0, 0, 1, 1,
1.875237, -0.6262265, 3.24822, 0, 0, 0, 1, 1,
1.927919, 1.393991, 0.1209818, 0, 0, 0, 1, 1,
1.938697, -0.009805299, 1.842644, 1, 1, 1, 1, 1,
1.946535, 0.1469569, 3.242843, 1, 1, 1, 1, 1,
1.953772, -1.836111, 1.89645, 1, 1, 1, 1, 1,
1.990566, 0.255698, 2.628506, 1, 1, 1, 1, 1,
1.996253, 0.03370141, 1.495281, 1, 1, 1, 1, 1,
2.004678, 1.536464, -0.0971144, 1, 1, 1, 1, 1,
2.018395, 0.04049177, 1.38085, 1, 1, 1, 1, 1,
2.02958, -0.02165622, 0.6046259, 1, 1, 1, 1, 1,
2.031235, -0.0102838, 1.491287, 1, 1, 1, 1, 1,
2.044998, -0.4020919, 2.498342, 1, 1, 1, 1, 1,
2.063679, 0.3360308, -0.6264182, 1, 1, 1, 1, 1,
2.064071, 0.3367981, 1.566993, 1, 1, 1, 1, 1,
2.0881, -0.6067408, 1.432396, 1, 1, 1, 1, 1,
2.10587, 0.8686295, 0.6898248, 1, 1, 1, 1, 1,
2.106539, -0.1021167, 4.358645, 1, 1, 1, 1, 1,
2.107192, 0.44344, 0.5845245, 0, 0, 1, 1, 1,
2.129137, -0.9222991, 2.951523, 1, 0, 0, 1, 1,
2.188904, -0.2610458, 0.6711887, 1, 0, 0, 1, 1,
2.194836, 1.052595, 2.917289, 1, 0, 0, 1, 1,
2.239533, 0.3370319, 1.736634, 1, 0, 0, 1, 1,
2.249025, 0.8591876, 0.5476714, 1, 0, 0, 1, 1,
2.270158, -0.5044873, 2.031196, 0, 0, 0, 1, 1,
2.316028, 0.4423369, 0.6449521, 0, 0, 0, 1, 1,
2.347017, 0.9744583, 1.543236, 0, 0, 0, 1, 1,
2.385142, 0.2442834, 2.051723, 0, 0, 0, 1, 1,
2.416666, 0.8928359, 1.009629, 0, 0, 0, 1, 1,
2.496603, 0.1056559, 1.777819, 0, 0, 0, 1, 1,
2.535253, -1.818134, 3.425133, 0, 0, 0, 1, 1,
2.542533, 0.07881901, 3.101234, 1, 1, 1, 1, 1,
2.681122, 0.7722167, 1.886987, 1, 1, 1, 1, 1,
2.682673, 0.6996344, 1.762644, 1, 1, 1, 1, 1,
2.698635, 0.1087992, 1.745337, 1, 1, 1, 1, 1,
2.956296, -1.052364, 3.08057, 1, 1, 1, 1, 1,
2.977865, -0.559997, 1.715849, 1, 1, 1, 1, 1,
3.275801, -0.3489767, 2.305841, 1, 1, 1, 1, 1
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
var radius = 9.872088;
var distance = 34.67529;
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
mvMatrix.translate( 0.06831145, 0.3504539, 0.2542329 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.67529);
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
