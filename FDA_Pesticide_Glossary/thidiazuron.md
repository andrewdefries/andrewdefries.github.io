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
-2.811653, 1.584341, -1.355142, 1, 0, 0, 1,
-2.572877, 0.691759, -0.7996754, 1, 0.007843138, 0, 1,
-2.498123, 0.4274754, -0.07496385, 1, 0.01176471, 0, 1,
-2.482201, 0.4790955, 0.02986779, 1, 0.01960784, 0, 1,
-2.474631, -0.01988758, -1.115754, 1, 0.02352941, 0, 1,
-2.363173, -0.363886, -2.405171, 1, 0.03137255, 0, 1,
-2.33149, -1.12069, -1.296547, 1, 0.03529412, 0, 1,
-2.247309, 2.110148, -1.420217, 1, 0.04313726, 0, 1,
-2.212246, -0.5205007, -1.530493, 1, 0.04705882, 0, 1,
-2.199294, 0.2895567, -2.438327, 1, 0.05490196, 0, 1,
-2.158589, -0.8016381, -0.6816139, 1, 0.05882353, 0, 1,
-2.092704, -0.3926346, -2.57742, 1, 0.06666667, 0, 1,
-2.062982, -0.6868845, -4.799148, 1, 0.07058824, 0, 1,
-2.057357, 0.1743109, -2.455105, 1, 0.07843138, 0, 1,
-2.049321, 1.039075, -1.079133, 1, 0.08235294, 0, 1,
-2.037747, -0.9817196, -1.661881, 1, 0.09019608, 0, 1,
-2.037305, -0.3797932, -2.051096, 1, 0.09411765, 0, 1,
-2.016814, -0.8986247, -4.913717, 1, 0.1019608, 0, 1,
-2.008248, -0.9679841, -2.345323, 1, 0.1098039, 0, 1,
-1.998408, -0.7591128, -3.590471, 1, 0.1137255, 0, 1,
-1.964218, -0.9142752, -2.029562, 1, 0.1215686, 0, 1,
-1.956886, 0.1651002, -2.682056, 1, 0.1254902, 0, 1,
-1.955161, 0.4019746, -1.282256, 1, 0.1333333, 0, 1,
-1.95345, -0.8756568, -2.611003, 1, 0.1372549, 0, 1,
-1.93943, -0.216197, -1.31112, 1, 0.145098, 0, 1,
-1.933732, 1.362732, 0.2846897, 1, 0.1490196, 0, 1,
-1.925969, 2.928889, 0.2633418, 1, 0.1568628, 0, 1,
-1.907356, 0.03305506, -0.9198202, 1, 0.1607843, 0, 1,
-1.897394, -2.809081, -4.227611, 1, 0.1686275, 0, 1,
-1.862637, 0.7153946, -1.491578, 1, 0.172549, 0, 1,
-1.847968, 1.11679, -0.8766714, 1, 0.1803922, 0, 1,
-1.772656, 0.06269216, -0.5845132, 1, 0.1843137, 0, 1,
-1.751681, -1.095044, -2.459607, 1, 0.1921569, 0, 1,
-1.751542, 0.1316363, -0.5031101, 1, 0.1960784, 0, 1,
-1.740508, -0.8237575, -2.301429, 1, 0.2039216, 0, 1,
-1.729952, 0.3376108, -2.427748, 1, 0.2117647, 0, 1,
-1.705463, -0.3341073, -3.699713, 1, 0.2156863, 0, 1,
-1.698059, 0.4840485, -0.1682674, 1, 0.2235294, 0, 1,
-1.693875, 1.649519, 2.185257, 1, 0.227451, 0, 1,
-1.692936, -2.551838, -4.717952, 1, 0.2352941, 0, 1,
-1.67572, -2.5779, -2.141799, 1, 0.2392157, 0, 1,
-1.670464, 0.6733292, 0.1818021, 1, 0.2470588, 0, 1,
-1.669481, -2.97955, -4.485955, 1, 0.2509804, 0, 1,
-1.645429, -1.448901, -3.244464, 1, 0.2588235, 0, 1,
-1.643119, 1.037271, -0.2833405, 1, 0.2627451, 0, 1,
-1.633289, 0.05576098, -0.8412347, 1, 0.2705882, 0, 1,
-1.625457, -0.2912532, -1.448555, 1, 0.2745098, 0, 1,
-1.614585, -0.4346001, -0.4829566, 1, 0.282353, 0, 1,
-1.555988, -0.3365505, -1.248523, 1, 0.2862745, 0, 1,
-1.555008, -0.3926265, -2.503144, 1, 0.2941177, 0, 1,
-1.545325, 1.200928, -0.6258418, 1, 0.3019608, 0, 1,
-1.528868, 0.6548051, -0.09775959, 1, 0.3058824, 0, 1,
-1.527465, 0.7695575, -0.5252006, 1, 0.3137255, 0, 1,
-1.519961, -0.314073, -1.320829, 1, 0.3176471, 0, 1,
-1.518302, 0.3357702, -1.29844, 1, 0.3254902, 0, 1,
-1.503614, 0.1552445, -2.525261, 1, 0.3294118, 0, 1,
-1.470506, -0.5396442, -3.406393, 1, 0.3372549, 0, 1,
-1.462109, -0.978404, -1.176807, 1, 0.3411765, 0, 1,
-1.460778, -0.7599266, -3.046268, 1, 0.3490196, 0, 1,
-1.459362, -1.884317, -2.227242, 1, 0.3529412, 0, 1,
-1.456331, -0.3931766, -3.331935, 1, 0.3607843, 0, 1,
-1.452959, 0.2748418, 0.9209419, 1, 0.3647059, 0, 1,
-1.452639, 0.3964134, -1.567488, 1, 0.372549, 0, 1,
-1.447979, -0.3895751, -3.351698, 1, 0.3764706, 0, 1,
-1.442761, 0.3043909, -0.7411038, 1, 0.3843137, 0, 1,
-1.433504, -0.9323893, -0.9955538, 1, 0.3882353, 0, 1,
-1.433286, -0.30193, -2.731074, 1, 0.3960784, 0, 1,
-1.424496, 1.685999, 0.2563505, 1, 0.4039216, 0, 1,
-1.419878, -0.557546, -0.2403937, 1, 0.4078431, 0, 1,
-1.405357, 0.02951533, -2.658394, 1, 0.4156863, 0, 1,
-1.384759, -0.7360523, -2.421351, 1, 0.4196078, 0, 1,
-1.363456, -1.412737, -2.179356, 1, 0.427451, 0, 1,
-1.361366, 1.548902, 0.1686335, 1, 0.4313726, 0, 1,
-1.354942, 0.1382177, -1.299168, 1, 0.4392157, 0, 1,
-1.337617, 1.442134, 0.2821053, 1, 0.4431373, 0, 1,
-1.327564, 0.4008732, -1.281617, 1, 0.4509804, 0, 1,
-1.325943, -0.2304233, -1.470717, 1, 0.454902, 0, 1,
-1.314768, -0.1869058, -1.323594, 1, 0.4627451, 0, 1,
-1.306943, 0.0256692, -1.360926, 1, 0.4666667, 0, 1,
-1.297004, -0.1519097, -1.95651, 1, 0.4745098, 0, 1,
-1.265745, 0.3650104, -0.7578181, 1, 0.4784314, 0, 1,
-1.254875, -1.094992, -3.971822, 1, 0.4862745, 0, 1,
-1.244902, 0.03382131, -2.191661, 1, 0.4901961, 0, 1,
-1.242192, -1.049453, -2.48744, 1, 0.4980392, 0, 1,
-1.235938, -0.2884549, -2.918798, 1, 0.5058824, 0, 1,
-1.234512, 0.05808369, -1.800047, 1, 0.509804, 0, 1,
-1.233364, -0.5419657, -2.176483, 1, 0.5176471, 0, 1,
-1.23149, -0.2075868, -1.45199, 1, 0.5215687, 0, 1,
-1.231001, 0.02754556, -0.9375904, 1, 0.5294118, 0, 1,
-1.230414, 0.6954458, -0.9047022, 1, 0.5333334, 0, 1,
-1.226354, 1.642184, 0.6413339, 1, 0.5411765, 0, 1,
-1.220176, 0.1678286, -2.348066, 1, 0.5450981, 0, 1,
-1.217101, -0.2222596, -1.555223, 1, 0.5529412, 0, 1,
-1.216342, 0.09974325, -0.9390346, 1, 0.5568628, 0, 1,
-1.199792, 1.72736, -2.120173, 1, 0.5647059, 0, 1,
-1.198006, -1.177791, -1.707719, 1, 0.5686275, 0, 1,
-1.19534, -0.7532707, -3.014933, 1, 0.5764706, 0, 1,
-1.194709, -1.489172, -2.83504, 1, 0.5803922, 0, 1,
-1.189075, 0.5699708, -2.167243, 1, 0.5882353, 0, 1,
-1.183719, 0.662773, -0.8145503, 1, 0.5921569, 0, 1,
-1.182361, 0.6161942, -0.92015, 1, 0.6, 0, 1,
-1.180625, 0.2306723, -2.355896, 1, 0.6078432, 0, 1,
-1.179736, 1.086524, -1.454303, 1, 0.6117647, 0, 1,
-1.177785, 2.338899, 1.183687, 1, 0.6196079, 0, 1,
-1.175541, -0.395398, -2.271144, 1, 0.6235294, 0, 1,
-1.17258, -1.614856, -1.629394, 1, 0.6313726, 0, 1,
-1.171785, 0.6690473, -3.166102, 1, 0.6352941, 0, 1,
-1.164818, -0.2171788, -1.832942, 1, 0.6431373, 0, 1,
-1.163163, -0.5326793, -1.176114, 1, 0.6470588, 0, 1,
-1.161957, -1.419543, -2.06478, 1, 0.654902, 0, 1,
-1.161712, -0.237122, -0.5999951, 1, 0.6588235, 0, 1,
-1.150756, -0.9772675, -1.512647, 1, 0.6666667, 0, 1,
-1.150656, -0.04065467, -2.933452, 1, 0.6705883, 0, 1,
-1.14109, -2.028096, -2.92326, 1, 0.6784314, 0, 1,
-1.140979, -0.4687446, -1.550309, 1, 0.682353, 0, 1,
-1.130725, -0.3662868, -2.965124, 1, 0.6901961, 0, 1,
-1.12514, -0.3069501, -0.579518, 1, 0.6941177, 0, 1,
-1.116895, 0.8299774, -1.960619, 1, 0.7019608, 0, 1,
-1.114701, 0.5931246, -2.857026, 1, 0.7098039, 0, 1,
-1.108556, 0.2209935, 0.7864637, 1, 0.7137255, 0, 1,
-1.107686, -0.196351, -1.725279, 1, 0.7215686, 0, 1,
-1.100632, 0.9469156, -0.5234662, 1, 0.7254902, 0, 1,
-1.098751, -0.6196959, -3.318394, 1, 0.7333333, 0, 1,
-1.089457, -1.255946, -1.628491, 1, 0.7372549, 0, 1,
-1.089374, 1.023595, -0.04811664, 1, 0.7450981, 0, 1,
-1.089093, 0.02312265, -0.6385848, 1, 0.7490196, 0, 1,
-1.088658, -0.1195545, -1.077769, 1, 0.7568628, 0, 1,
-1.078671, -0.1686697, -2.365725, 1, 0.7607843, 0, 1,
-1.078428, 1.41586, -1.434069, 1, 0.7686275, 0, 1,
-1.076571, -0.522393, -3.007204, 1, 0.772549, 0, 1,
-1.073747, 0.63377, -0.4884615, 1, 0.7803922, 0, 1,
-1.061337, 0.8881874, -3.037142, 1, 0.7843137, 0, 1,
-1.058493, 0.4427639, -1.505924, 1, 0.7921569, 0, 1,
-1.057673, -1.336575, -1.381709, 1, 0.7960784, 0, 1,
-1.056292, 0.4251063, -1.415419, 1, 0.8039216, 0, 1,
-1.055886, 0.9345386, -0.551324, 1, 0.8117647, 0, 1,
-1.043477, -2.074753, -2.668445, 1, 0.8156863, 0, 1,
-1.039771, 0.1236357, -2.406379, 1, 0.8235294, 0, 1,
-1.036951, 1.013753, -1.347665, 1, 0.827451, 0, 1,
-1.036279, 0.9091657, -0.8798352, 1, 0.8352941, 0, 1,
-1.034125, -0.1373988, -1.475908, 1, 0.8392157, 0, 1,
-1.033843, 0.1490742, -3.056981, 1, 0.8470588, 0, 1,
-1.032168, -1.306993, -3.875435, 1, 0.8509804, 0, 1,
-1.032071, 0.831701, -1.316866, 1, 0.8588235, 0, 1,
-1.030343, 0.9466159, -2.370976, 1, 0.8627451, 0, 1,
-1.026941, -0.8259445, -1.696849, 1, 0.8705882, 0, 1,
-1.024328, 2.079521, -1.027041, 1, 0.8745098, 0, 1,
-1.015105, 2.020494, -1.953077, 1, 0.8823529, 0, 1,
-1.009303, 0.7189138, 0.7931949, 1, 0.8862745, 0, 1,
-1.00447, 0.1803027, -2.303913, 1, 0.8941177, 0, 1,
-1.002787, -0.3627366, -2.75464, 1, 0.8980392, 0, 1,
-1.002215, 0.8125481, -1.145327, 1, 0.9058824, 0, 1,
-1.002134, -0.8710809, -4.46069, 1, 0.9137255, 0, 1,
-1.001083, 0.2359654, -0.7736323, 1, 0.9176471, 0, 1,
-0.9997284, -2.089882, -2.478231, 1, 0.9254902, 0, 1,
-0.9969147, 1.20787, -0.3057758, 1, 0.9294118, 0, 1,
-0.9960756, 0.02798005, -1.071941, 1, 0.9372549, 0, 1,
-0.9940615, -0.9264145, -0.89736, 1, 0.9411765, 0, 1,
-0.9881496, 0.5724204, 0.09805039, 1, 0.9490196, 0, 1,
-0.9858496, 0.59522, -0.2100135, 1, 0.9529412, 0, 1,
-0.9717242, 0.03211487, -2.061977, 1, 0.9607843, 0, 1,
-0.9693972, -1.337024, -3.373948, 1, 0.9647059, 0, 1,
-0.9674307, 1.51883, -1.577835, 1, 0.972549, 0, 1,
-0.9638602, -0.6632611, -2.370581, 1, 0.9764706, 0, 1,
-0.9631346, -0.2739131, -2.922307, 1, 0.9843137, 0, 1,
-0.9592646, 0.4212897, -1.838637, 1, 0.9882353, 0, 1,
-0.95793, -0.06491605, -0.1085047, 1, 0.9960784, 0, 1,
-0.9573935, 1.306176, -1.906245, 0.9960784, 1, 0, 1,
-0.9572638, -1.018727, -2.633998, 0.9921569, 1, 0, 1,
-0.9542346, -0.2262432, -1.124286, 0.9843137, 1, 0, 1,
-0.9529221, 0.3074834, -1.026868, 0.9803922, 1, 0, 1,
-0.9497359, 1.113923, 0.9512997, 0.972549, 1, 0, 1,
-0.9440904, -1.313106, -4.20931, 0.9686275, 1, 0, 1,
-0.9353055, 0.2491703, 1.058688, 0.9607843, 1, 0, 1,
-0.9296374, -0.4464945, -1.712825, 0.9568627, 1, 0, 1,
-0.9291118, 0.7104443, -0.8155209, 0.9490196, 1, 0, 1,
-0.9285808, 0.09263229, 0.1999015, 0.945098, 1, 0, 1,
-0.9266391, -1.30704, -3.947235, 0.9372549, 1, 0, 1,
-0.9226801, -0.7570498, -2.70862, 0.9333333, 1, 0, 1,
-0.9212733, 1.283623, -0.1690889, 0.9254902, 1, 0, 1,
-0.9123475, 0.4697649, 0.5460553, 0.9215686, 1, 0, 1,
-0.9040738, -2.107345, -2.859611, 0.9137255, 1, 0, 1,
-0.9006609, 0.003463306, -2.057046, 0.9098039, 1, 0, 1,
-0.9003035, 0.2607784, 0.6536341, 0.9019608, 1, 0, 1,
-0.8987437, 1.113151, 0.9903181, 0.8941177, 1, 0, 1,
-0.8970784, 0.2528909, -0.7032487, 0.8901961, 1, 0, 1,
-0.8968326, 0.3724347, 1.116006, 0.8823529, 1, 0, 1,
-0.8922195, -0.4085857, -2.681968, 0.8784314, 1, 0, 1,
-0.8880401, -1.888896, -3.714476, 0.8705882, 1, 0, 1,
-0.8873113, 2.359212, -0.3490753, 0.8666667, 1, 0, 1,
-0.8831964, 0.5223319, -2.101851, 0.8588235, 1, 0, 1,
-0.8828069, 0.283812, -1.872423, 0.854902, 1, 0, 1,
-0.8784307, -0.7543033, -3.446464, 0.8470588, 1, 0, 1,
-0.8744085, -0.6236458, -2.965599, 0.8431373, 1, 0, 1,
-0.871914, 0.03155354, -2.307022, 0.8352941, 1, 0, 1,
-0.8712634, 1.978277, -0.6664905, 0.8313726, 1, 0, 1,
-0.857359, 0.3951742, -1.704376, 0.8235294, 1, 0, 1,
-0.8527991, 0.5078625, -1.401389, 0.8196079, 1, 0, 1,
-0.8509146, 0.9270089, -1.534659, 0.8117647, 1, 0, 1,
-0.8404554, 0.3187406, -2.730865, 0.8078431, 1, 0, 1,
-0.8393767, -0.3659009, -1.05074, 0.8, 1, 0, 1,
-0.8379743, 1.771138, -2.082683, 0.7921569, 1, 0, 1,
-0.8341219, 0.4539975, -2.012208, 0.7882353, 1, 0, 1,
-0.8268432, 1.122351, -1.762775, 0.7803922, 1, 0, 1,
-0.8226963, 0.6105477, -0.9513733, 0.7764706, 1, 0, 1,
-0.8178814, -0.001187008, -0.5656483, 0.7686275, 1, 0, 1,
-0.8134973, 1.218524, -1.495876, 0.7647059, 1, 0, 1,
-0.8109585, 0.6429801, -1.230969, 0.7568628, 1, 0, 1,
-0.8095951, -1.917191, -3.243654, 0.7529412, 1, 0, 1,
-0.7976092, -0.2387533, -2.76984, 0.7450981, 1, 0, 1,
-0.792835, 1.126968, -3.077453, 0.7411765, 1, 0, 1,
-0.7864689, 0.263294, -0.9216983, 0.7333333, 1, 0, 1,
-0.7859799, -0.9595227, -3.75673, 0.7294118, 1, 0, 1,
-0.7838778, -1.546586, -1.756356, 0.7215686, 1, 0, 1,
-0.7827144, -0.2240106, -3.037629, 0.7176471, 1, 0, 1,
-0.7749951, -2.08829, -0.779752, 0.7098039, 1, 0, 1,
-0.7715103, -0.3274494, -2.7939, 0.7058824, 1, 0, 1,
-0.7672198, 0.4310542, 0.2324143, 0.6980392, 1, 0, 1,
-0.7624336, -0.06310385, -1.367547, 0.6901961, 1, 0, 1,
-0.7617081, 0.4966368, -0.04200028, 0.6862745, 1, 0, 1,
-0.7599251, -0.3054086, -2.106256, 0.6784314, 1, 0, 1,
-0.7556596, -1.337722, -2.537966, 0.6745098, 1, 0, 1,
-0.7547616, 0.4278976, -1.022164, 0.6666667, 1, 0, 1,
-0.7453043, 0.1115657, -1.684307, 0.6627451, 1, 0, 1,
-0.743661, -0.4490187, -3.62797, 0.654902, 1, 0, 1,
-0.7421897, 0.3218272, -2.061484, 0.6509804, 1, 0, 1,
-0.7307233, 0.8866693, -0.3995138, 0.6431373, 1, 0, 1,
-0.7230573, -0.3519329, -2.225284, 0.6392157, 1, 0, 1,
-0.7205947, -1.075225, -2.646754, 0.6313726, 1, 0, 1,
-0.7202709, 0.9174887, -0.2239203, 0.627451, 1, 0, 1,
-0.7198901, 1.098594, -2.145314, 0.6196079, 1, 0, 1,
-0.7181661, 0.4197966, 0.8596398, 0.6156863, 1, 0, 1,
-0.7162718, -0.5484899, -1.523184, 0.6078432, 1, 0, 1,
-0.7156159, 0.5259734, -2.055916, 0.6039216, 1, 0, 1,
-0.7142538, -1.479471, -1.582015, 0.5960785, 1, 0, 1,
-0.7116267, 2.136145, -0.9587149, 0.5882353, 1, 0, 1,
-0.7114271, -1.332761, -1.90364, 0.5843138, 1, 0, 1,
-0.7105593, -1.348474, -0.05852257, 0.5764706, 1, 0, 1,
-0.7056904, -1.264382, -2.162474, 0.572549, 1, 0, 1,
-0.6975772, 1.122666, -1.863349, 0.5647059, 1, 0, 1,
-0.6968694, -1.125032, -0.6715764, 0.5607843, 1, 0, 1,
-0.6950207, 0.1339845, -1.324911, 0.5529412, 1, 0, 1,
-0.694665, -0.2555582, -2.206602, 0.5490196, 1, 0, 1,
-0.6940457, 0.7610863, -1.896017, 0.5411765, 1, 0, 1,
-0.6934836, -1.17343, -2.712849, 0.5372549, 1, 0, 1,
-0.6919451, -0.8385627, -4.240892, 0.5294118, 1, 0, 1,
-0.6904888, -0.6663334, -1.197881, 0.5254902, 1, 0, 1,
-0.6899484, -0.08280582, -1.676615, 0.5176471, 1, 0, 1,
-0.6894603, -1.008196, -2.207404, 0.5137255, 1, 0, 1,
-0.6880574, 0.6025445, -2.044946, 0.5058824, 1, 0, 1,
-0.6845867, 0.3167813, -0.2660719, 0.5019608, 1, 0, 1,
-0.6845798, 2.285056, -1.239321, 0.4941176, 1, 0, 1,
-0.6844652, 1.047452, -1.142559, 0.4862745, 1, 0, 1,
-0.6811063, 0.1831534, -2.201727, 0.4823529, 1, 0, 1,
-0.6794725, 0.6887393, -1.489359, 0.4745098, 1, 0, 1,
-0.6671937, -0.2168613, -1.623029, 0.4705882, 1, 0, 1,
-0.6630317, -0.07414046, -0.3485182, 0.4627451, 1, 0, 1,
-0.6608855, 2.094842, -2.18343, 0.4588235, 1, 0, 1,
-0.6579177, -0.3201048, -2.44999, 0.4509804, 1, 0, 1,
-0.6574204, 0.340856, -1.798328, 0.4470588, 1, 0, 1,
-0.6559945, -0.4505331, -1.97003, 0.4392157, 1, 0, 1,
-0.650786, -0.7784911, -1.273228, 0.4352941, 1, 0, 1,
-0.6496484, -1.660167, -3.187817, 0.427451, 1, 0, 1,
-0.6489425, 1.124123, -1.186095, 0.4235294, 1, 0, 1,
-0.6460118, 0.6270877, -1.933922, 0.4156863, 1, 0, 1,
-0.6458823, 1.14404, 2.107709, 0.4117647, 1, 0, 1,
-0.6453012, -0.0005628987, -0.5580343, 0.4039216, 1, 0, 1,
-0.6400388, -1.07102, -3.30374, 0.3960784, 1, 0, 1,
-0.6359082, 0.2315319, -1.408058, 0.3921569, 1, 0, 1,
-0.6339556, -0.02746714, -3.145971, 0.3843137, 1, 0, 1,
-0.6334724, -1.851045, -1.354362, 0.3803922, 1, 0, 1,
-0.6247477, 0.3267044, -0.5820205, 0.372549, 1, 0, 1,
-0.6247145, -0.2622897, -1.589826, 0.3686275, 1, 0, 1,
-0.6243212, 0.9522078, 1.426583, 0.3607843, 1, 0, 1,
-0.6223693, 0.1809884, -1.631256, 0.3568628, 1, 0, 1,
-0.6215261, 0.6977164, -0.240201, 0.3490196, 1, 0, 1,
-0.6193594, -0.8214003, -3.693564, 0.345098, 1, 0, 1,
-0.6189795, -0.3722032, -2.676443, 0.3372549, 1, 0, 1,
-0.6167606, 0.8766354, -1.557819, 0.3333333, 1, 0, 1,
-0.6083809, 0.42525, -1.263128, 0.3254902, 1, 0, 1,
-0.6068003, -0.2206014, -2.656198, 0.3215686, 1, 0, 1,
-0.6054962, -1.444578, -3.659286, 0.3137255, 1, 0, 1,
-0.5999431, -0.9786674, -1.472129, 0.3098039, 1, 0, 1,
-0.5995232, -0.2340777, -2.193118, 0.3019608, 1, 0, 1,
-0.5980142, -0.8663793, -2.772207, 0.2941177, 1, 0, 1,
-0.5976737, -0.8671489, -3.053773, 0.2901961, 1, 0, 1,
-0.5947989, 0.8973638, -1.68458, 0.282353, 1, 0, 1,
-0.5939425, -0.3595593, -3.678491, 0.2784314, 1, 0, 1,
-0.5899172, 0.05481168, -1.90015, 0.2705882, 1, 0, 1,
-0.5848245, -1.848982, -4.012665, 0.2666667, 1, 0, 1,
-0.5836632, 1.800029, 0.5439508, 0.2588235, 1, 0, 1,
-0.5824472, 0.8685849, -1.520422, 0.254902, 1, 0, 1,
-0.5822047, -0.07746185, -3.733188, 0.2470588, 1, 0, 1,
-0.5812014, -0.4243211, -1.962042, 0.2431373, 1, 0, 1,
-0.5801556, -0.7044424, -2.056466, 0.2352941, 1, 0, 1,
-0.5784939, -0.9622152, -1.834679, 0.2313726, 1, 0, 1,
-0.5747014, -1.526409, -0.9900344, 0.2235294, 1, 0, 1,
-0.5683969, -1.021758, -1.220222, 0.2196078, 1, 0, 1,
-0.5671129, -0.8838134, -2.121018, 0.2117647, 1, 0, 1,
-0.5669026, 1.399168, -0.05272283, 0.2078431, 1, 0, 1,
-0.5658689, 1.356337, -0.6429852, 0.2, 1, 0, 1,
-0.5654997, 0.3588827, 1.12708, 0.1921569, 1, 0, 1,
-0.5596831, 0.2157322, -3.115674, 0.1882353, 1, 0, 1,
-0.5567072, -0.4681919, -1.244188, 0.1803922, 1, 0, 1,
-0.552208, 0.8841429, -3.842656, 0.1764706, 1, 0, 1,
-0.5479164, -0.6410753, -1.727445, 0.1686275, 1, 0, 1,
-0.5477593, 0.3828913, -0.08427587, 0.1647059, 1, 0, 1,
-0.5462894, 1.546803, -1.186996, 0.1568628, 1, 0, 1,
-0.5460721, 0.3042705, -0.9683591, 0.1529412, 1, 0, 1,
-0.5455496, 2.736664, -1.044003, 0.145098, 1, 0, 1,
-0.5437106, -1.474968, -2.945673, 0.1411765, 1, 0, 1,
-0.5433356, 0.7323672, -0.9570946, 0.1333333, 1, 0, 1,
-0.5413948, -0.6418619, -2.312566, 0.1294118, 1, 0, 1,
-0.5379751, -0.8394166, -2.12233, 0.1215686, 1, 0, 1,
-0.5370855, -0.5142968, -2.073239, 0.1176471, 1, 0, 1,
-0.5342504, -0.7576796, -4.342245, 0.1098039, 1, 0, 1,
-0.5329148, -0.09508643, -1.257985, 0.1058824, 1, 0, 1,
-0.5317358, -1.932479, -2.875241, 0.09803922, 1, 0, 1,
-0.5291097, 1.716689, -0.07361709, 0.09019608, 1, 0, 1,
-0.5290579, 1.586731, 1.014368, 0.08627451, 1, 0, 1,
-0.5287728, 0.2746363, -0.9916078, 0.07843138, 1, 0, 1,
-0.5242409, 0.5932295, -0.1212528, 0.07450981, 1, 0, 1,
-0.518829, -1.505337, -1.87895, 0.06666667, 1, 0, 1,
-0.5166497, -0.9630632, -1.153418, 0.0627451, 1, 0, 1,
-0.5153505, 0.2719619, -2.27704, 0.05490196, 1, 0, 1,
-0.51493, 0.1344261, -1.604587, 0.05098039, 1, 0, 1,
-0.512751, 0.4446836, -1.914444, 0.04313726, 1, 0, 1,
-0.5114989, 0.3648426, -3.563678, 0.03921569, 1, 0, 1,
-0.5113666, -0.07735001, -3.327819, 0.03137255, 1, 0, 1,
-0.5105884, 1.106637, -2.382113, 0.02745098, 1, 0, 1,
-0.5094555, -2.898097, -2.705752, 0.01960784, 1, 0, 1,
-0.508798, -0.7517132, -0.7106056, 0.01568628, 1, 0, 1,
-0.505107, -2.078987, -0.5363646, 0.007843138, 1, 0, 1,
-0.5046575, 0.61648, -1.093246, 0.003921569, 1, 0, 1,
-0.5017903, 0.135562, -1.96043, 0, 1, 0.003921569, 1,
-0.4872989, 1.076679, -0.9219559, 0, 1, 0.01176471, 1,
-0.4845853, -1.201261, -2.990819, 0, 1, 0.01568628, 1,
-0.4842186, -0.4167218, -2.527576, 0, 1, 0.02352941, 1,
-0.483781, -0.4783937, -2.218242, 0, 1, 0.02745098, 1,
-0.4825991, 0.7416849, -1.050818, 0, 1, 0.03529412, 1,
-0.4774992, 1.590773, -0.5878732, 0, 1, 0.03921569, 1,
-0.4750933, 0.4522976, -0.5745226, 0, 1, 0.04705882, 1,
-0.4686724, -0.04310115, -1.634505, 0, 1, 0.05098039, 1,
-0.4679319, 0.457271, -0.9129605, 0, 1, 0.05882353, 1,
-0.4672934, -0.5972183, -3.259246, 0, 1, 0.0627451, 1,
-0.4554894, -0.03281222, -1.299147, 0, 1, 0.07058824, 1,
-0.4539596, -0.9959232, -3.753565, 0, 1, 0.07450981, 1,
-0.4501228, -0.2049508, -0.5982388, 0, 1, 0.08235294, 1,
-0.4442026, 0.247269, -0.5904132, 0, 1, 0.08627451, 1,
-0.4429083, 1.234705, -0.5605751, 0, 1, 0.09411765, 1,
-0.4359483, -0.3303275, -4.061798, 0, 1, 0.1019608, 1,
-0.4294069, -0.4307928, -2.937723, 0, 1, 0.1058824, 1,
-0.4281362, -0.9197816, -2.936256, 0, 1, 0.1137255, 1,
-0.423655, -1.111499, -2.178773, 0, 1, 0.1176471, 1,
-0.4216475, 0.6041189, 0.356044, 0, 1, 0.1254902, 1,
-0.4180961, -0.9966998, -2.073849, 0, 1, 0.1294118, 1,
-0.4166192, 1.302876, 0.1524622, 0, 1, 0.1372549, 1,
-0.40778, -0.9033275, -4.041892, 0, 1, 0.1411765, 1,
-0.4074992, 1.824824, 1.436017, 0, 1, 0.1490196, 1,
-0.4023985, -0.1545538, -1.453472, 0, 1, 0.1529412, 1,
-0.3998878, -0.9253002, -2.884428, 0, 1, 0.1607843, 1,
-0.3976211, -2.575244, -4.710087, 0, 1, 0.1647059, 1,
-0.3950857, -1.556332, -3.768357, 0, 1, 0.172549, 1,
-0.3920387, -1.303925, -3.619067, 0, 1, 0.1764706, 1,
-0.3886003, -1.083081, -1.768364, 0, 1, 0.1843137, 1,
-0.3870874, -1.040466, -4.089056, 0, 1, 0.1882353, 1,
-0.3861432, 0.3410713, -1.754596, 0, 1, 0.1960784, 1,
-0.3853221, 0.3631712, -0.841935, 0, 1, 0.2039216, 1,
-0.3837464, 1.438642, 1.06604, 0, 1, 0.2078431, 1,
-0.3797921, -0.2106618, -3.057018, 0, 1, 0.2156863, 1,
-0.3795751, -0.3957994, -2.743011, 0, 1, 0.2196078, 1,
-0.3795551, -0.6715455, -3.781445, 0, 1, 0.227451, 1,
-0.371373, 0.4476232, -1.580077, 0, 1, 0.2313726, 1,
-0.3705146, -0.8451187, -3.367639, 0, 1, 0.2392157, 1,
-0.3680423, -0.7398214, -2.761415, 0, 1, 0.2431373, 1,
-0.3644557, 0.107191, -0.6095832, 0, 1, 0.2509804, 1,
-0.3589687, -1.074116, -3.712891, 0, 1, 0.254902, 1,
-0.3584246, 0.3947804, -0.6229294, 0, 1, 0.2627451, 1,
-0.3545108, -0.4122304, -3.014066, 0, 1, 0.2666667, 1,
-0.3511935, 1.134591, 0.4188432, 0, 1, 0.2745098, 1,
-0.3508262, -0.2292778, -1.847189, 0, 1, 0.2784314, 1,
-0.3497478, -1.684484, -2.185176, 0, 1, 0.2862745, 1,
-0.3490566, -0.4967773, -2.999776, 0, 1, 0.2901961, 1,
-0.3488453, -0.02096197, -1.50026, 0, 1, 0.2980392, 1,
-0.347308, 0.1768365, -1.829867, 0, 1, 0.3058824, 1,
-0.3458234, 0.4757017, -1.152034, 0, 1, 0.3098039, 1,
-0.3400682, 0.9795456, -0.5607462, 0, 1, 0.3176471, 1,
-0.3386569, -0.458095, -2.595999, 0, 1, 0.3215686, 1,
-0.3348699, -0.5756596, -2.906379, 0, 1, 0.3294118, 1,
-0.3293249, 0.02926713, 0.1003704, 0, 1, 0.3333333, 1,
-0.3168328, -0.6945379, -2.405735, 0, 1, 0.3411765, 1,
-0.3164539, 1.137149, 0.3454078, 0, 1, 0.345098, 1,
-0.3113632, -0.661818, -2.326094, 0, 1, 0.3529412, 1,
-0.3094256, 1.123242, -0.5716653, 0, 1, 0.3568628, 1,
-0.2962631, 0.8323324, -0.311493, 0, 1, 0.3647059, 1,
-0.2868799, -0.3097653, -2.115852, 0, 1, 0.3686275, 1,
-0.2867495, 1.85348, -0.7969264, 0, 1, 0.3764706, 1,
-0.285827, 0.8774975, 0.7629135, 0, 1, 0.3803922, 1,
-0.2851163, 1.236309, -0.7269961, 0, 1, 0.3882353, 1,
-0.2848378, 0.8163217, 0.9357215, 0, 1, 0.3921569, 1,
-0.283652, 0.5528641, 0.4234323, 0, 1, 0.4, 1,
-0.2804264, 2.031343, -2.147702, 0, 1, 0.4078431, 1,
-0.2798005, -0.1560151, -4.149532, 0, 1, 0.4117647, 1,
-0.2764774, 0.9418544, -0.01457924, 0, 1, 0.4196078, 1,
-0.2743199, 0.01489796, -1.86653, 0, 1, 0.4235294, 1,
-0.2727189, -1.588899, -4.772495, 0, 1, 0.4313726, 1,
-0.2642298, 0.6728621, -0.9234684, 0, 1, 0.4352941, 1,
-0.2601642, -0.6848342, -3.337929, 0, 1, 0.4431373, 1,
-0.2579829, 1.109776, -0.7681715, 0, 1, 0.4470588, 1,
-0.2575814, -0.2687953, -3.143454, 0, 1, 0.454902, 1,
-0.2554898, 0.09176939, -4.59376, 0, 1, 0.4588235, 1,
-0.2482097, -0.7516769, -4.734066, 0, 1, 0.4666667, 1,
-0.2450529, -2.040331, -3.56676, 0, 1, 0.4705882, 1,
-0.2446906, -1.036111, -1.695211, 0, 1, 0.4784314, 1,
-0.2428001, 0.445395, 0.4537598, 0, 1, 0.4823529, 1,
-0.240627, -1.075899, -2.345592, 0, 1, 0.4901961, 1,
-0.2388281, 0.4679021, -0.1064361, 0, 1, 0.4941176, 1,
-0.2380538, 1.027538, 0.6004738, 0, 1, 0.5019608, 1,
-0.2255024, -0.5327682, -2.20066, 0, 1, 0.509804, 1,
-0.223733, 0.01657, -1.877915, 0, 1, 0.5137255, 1,
-0.2229136, -1.27268, -3.984457, 0, 1, 0.5215687, 1,
-0.2160515, 0.8908179, 0.4475441, 0, 1, 0.5254902, 1,
-0.2097114, 0.4247538, -0.2901911, 0, 1, 0.5333334, 1,
-0.2090499, 1.142969, 0.367734, 0, 1, 0.5372549, 1,
-0.2077608, 0.1749323, -0.1757119, 0, 1, 0.5450981, 1,
-0.2073023, 0.4302308, 1.544404, 0, 1, 0.5490196, 1,
-0.2069017, 0.514613, -1.566602, 0, 1, 0.5568628, 1,
-0.2057369, -1.77857, -2.883853, 0, 1, 0.5607843, 1,
-0.2047181, 0.02687958, -2.401242, 0, 1, 0.5686275, 1,
-0.2042944, 0.8538342, 0.4828408, 0, 1, 0.572549, 1,
-0.2031519, 1.75973, -0.6212561, 0, 1, 0.5803922, 1,
-0.2005887, 0.10363, -1.59126, 0, 1, 0.5843138, 1,
-0.200047, -0.7384583, -3.097188, 0, 1, 0.5921569, 1,
-0.1944304, 0.4582894, 0.9156145, 0, 1, 0.5960785, 1,
-0.1924038, -0.07851478, -1.779655, 0, 1, 0.6039216, 1,
-0.1893532, -0.7980552, -3.774018, 0, 1, 0.6117647, 1,
-0.1865724, -0.1466143, -0.4421511, 0, 1, 0.6156863, 1,
-0.1836002, -0.966696, -1.923717, 0, 1, 0.6235294, 1,
-0.1821732, -0.4989819, -1.397943, 0, 1, 0.627451, 1,
-0.1794365, 0.6998197, -1.561952, 0, 1, 0.6352941, 1,
-0.1755984, 0.3611911, -0.8058861, 0, 1, 0.6392157, 1,
-0.1730873, 0.6296733, 0.03088471, 0, 1, 0.6470588, 1,
-0.1728497, 1.621028, -0.8272893, 0, 1, 0.6509804, 1,
-0.1676483, 1.10417, -0.2082037, 0, 1, 0.6588235, 1,
-0.1650981, 0.9861773, -0.6915745, 0, 1, 0.6627451, 1,
-0.1632499, -0.8677058, -2.996045, 0, 1, 0.6705883, 1,
-0.1601735, 0.723865, 0.01985718, 0, 1, 0.6745098, 1,
-0.1584468, -2.202144, -3.498932, 0, 1, 0.682353, 1,
-0.1577783, -1.773986, -1.863273, 0, 1, 0.6862745, 1,
-0.1575483, 0.9396597, -1.019978, 0, 1, 0.6941177, 1,
-0.1575192, -0.2823087, -1.219355, 0, 1, 0.7019608, 1,
-0.1554262, -0.3392268, -2.746555, 0, 1, 0.7058824, 1,
-0.155145, 0.009636729, -0.9766268, 0, 1, 0.7137255, 1,
-0.154928, -0.3581195, -3.611612, 0, 1, 0.7176471, 1,
-0.1534536, 0.4007621, -0.5931165, 0, 1, 0.7254902, 1,
-0.1532889, -0.7733532, -2.840686, 0, 1, 0.7294118, 1,
-0.1520634, 0.7721243, 1.576256, 0, 1, 0.7372549, 1,
-0.1507339, 0.5841134, 0.4631289, 0, 1, 0.7411765, 1,
-0.1475264, 0.04687702, -0.6550714, 0, 1, 0.7490196, 1,
-0.1458875, -1.285617, -3.272089, 0, 1, 0.7529412, 1,
-0.1412189, -0.6632503, -1.280571, 0, 1, 0.7607843, 1,
-0.1377023, 0.7897551, 0.4554419, 0, 1, 0.7647059, 1,
-0.1373969, -0.7155342, -1.777037, 0, 1, 0.772549, 1,
-0.1327181, -0.01569773, -0.1924695, 0, 1, 0.7764706, 1,
-0.123537, -1.589866, -4.948958, 0, 1, 0.7843137, 1,
-0.1230936, -0.6901867, -3.345346, 0, 1, 0.7882353, 1,
-0.1229058, -0.6770492, -3.606484, 0, 1, 0.7960784, 1,
-0.1210501, -1.165537, -3.547951, 0, 1, 0.8039216, 1,
-0.1180863, -0.2560552, -3.038876, 0, 1, 0.8078431, 1,
-0.1176137, 1.415571, 0.6589915, 0, 1, 0.8156863, 1,
-0.1122008, -1.03391, -2.657405, 0, 1, 0.8196079, 1,
-0.1096794, 1.918199, -0.1908991, 0, 1, 0.827451, 1,
-0.108026, 0.7120303, -0.6207693, 0, 1, 0.8313726, 1,
-0.1076813, 2.128509, 1.593547, 0, 1, 0.8392157, 1,
-0.107591, -0.4066708, -2.141557, 0, 1, 0.8431373, 1,
-0.1064781, -1.462217, -3.456078, 0, 1, 0.8509804, 1,
-0.09887141, 0.3910617, -2.115699, 0, 1, 0.854902, 1,
-0.0924778, 0.7612186, -0.3710445, 0, 1, 0.8627451, 1,
-0.09092416, 0.5296299, 0.7865366, 0, 1, 0.8666667, 1,
-0.0899508, -2.342635, -4.060151, 0, 1, 0.8745098, 1,
-0.08586027, 0.2449121, 0.6073714, 0, 1, 0.8784314, 1,
-0.08319221, 1.109822, 0.6290355, 0, 1, 0.8862745, 1,
-0.08153231, 0.2141686, -2.09066, 0, 1, 0.8901961, 1,
-0.08070078, -0.8698421, -2.507415, 0, 1, 0.8980392, 1,
-0.07649665, -0.2680223, -4.359699, 0, 1, 0.9058824, 1,
-0.06744311, 0.8184896, 1.342075, 0, 1, 0.9098039, 1,
-0.06555811, 0.5904744, 0.5704189, 0, 1, 0.9176471, 1,
-0.06110372, -0.7822798, -5.316317, 0, 1, 0.9215686, 1,
-0.06078281, 0.60617, -0.3413879, 0, 1, 0.9294118, 1,
-0.0602714, 0.8898368, -0.06688748, 0, 1, 0.9333333, 1,
-0.05963582, 1.591468, -1.224523, 0, 1, 0.9411765, 1,
-0.05925007, 0.3443756, -0.2679918, 0, 1, 0.945098, 1,
-0.05887733, -1.5408, -3.501009, 0, 1, 0.9529412, 1,
-0.05418895, -0.2468985, -2.917563, 0, 1, 0.9568627, 1,
-0.04905676, 0.3801547, -0.4866066, 0, 1, 0.9647059, 1,
-0.04745823, 1.360512, -0.199139, 0, 1, 0.9686275, 1,
-0.04592916, 0.4764484, -0.7144599, 0, 1, 0.9764706, 1,
-0.04470149, 0.688863, -0.6863407, 0, 1, 0.9803922, 1,
-0.04417207, 0.7408531, 1.078756, 0, 1, 0.9882353, 1,
-0.04015892, 1.214899, 0.5649341, 0, 1, 0.9921569, 1,
-0.03998788, 0.8407289, 2.225218, 0, 1, 1, 1,
-0.03794954, 1.850546, 0.7941234, 0, 0.9921569, 1, 1,
-0.03263339, 0.7782021, -0.02840936, 0, 0.9882353, 1, 1,
-0.03219748, 1.13862, -0.09172369, 0, 0.9803922, 1, 1,
-0.03140337, -0.01596115, -1.595061, 0, 0.9764706, 1, 1,
-0.03067963, -1.658335, -4.16273, 0, 0.9686275, 1, 1,
-0.02610227, 0.5062658, 0.9304033, 0, 0.9647059, 1, 1,
-0.02193611, -1.538273, -3.035413, 0, 0.9568627, 1, 1,
-0.01686472, 1.229109, -0.8483192, 0, 0.9529412, 1, 1,
-0.01597656, 1.28059, -0.2156615, 0, 0.945098, 1, 1,
-0.01303572, 1.101094, -1.255186, 0, 0.9411765, 1, 1,
-0.01249622, 0.8211657, 1.426876, 0, 0.9333333, 1, 1,
-0.01246782, 0.4872326, 1.508436, 0, 0.9294118, 1, 1,
-0.01189526, 0.5367518, 0.1649204, 0, 0.9215686, 1, 1,
-0.01077345, 0.5235681, -0.471176, 0, 0.9176471, 1, 1,
-0.009760432, -0.9593756, -2.466186, 0, 0.9098039, 1, 1,
-0.008254169, -2.023489, -2.67617, 0, 0.9058824, 1, 1,
-0.006981815, -1.040237, -4.189214, 0, 0.8980392, 1, 1,
-0.00453589, 0.2387753, 1.396163, 0, 0.8901961, 1, 1,
-0.00138148, -1.476824, -3.638538, 0, 0.8862745, 1, 1,
-8.140408e-05, -0.7906084, -3.277356, 0, 0.8784314, 1, 1,
0.004654038, -0.06432514, 2.625452, 0, 0.8745098, 1, 1,
0.01040382, 0.7015737, -1.153072, 0, 0.8666667, 1, 1,
0.01180374, 1.039714, 2.080678, 0, 0.8627451, 1, 1,
0.0156471, -0.2442723, 2.169661, 0, 0.854902, 1, 1,
0.01883075, 1.794488, 0.03074005, 0, 0.8509804, 1, 1,
0.01915605, -0.1577193, 1.688854, 0, 0.8431373, 1, 1,
0.02106172, 0.798246, -0.6394981, 0, 0.8392157, 1, 1,
0.02124161, 0.2595829, -1.298765, 0, 0.8313726, 1, 1,
0.0216358, -0.2169054, 1.230835, 0, 0.827451, 1, 1,
0.02351403, -1.732603, 2.893698, 0, 0.8196079, 1, 1,
0.02645588, -0.9194503, 4.610197, 0, 0.8156863, 1, 1,
0.02879965, 0.3350213, -0.6766347, 0, 0.8078431, 1, 1,
0.02945781, -0.4856232, 2.343223, 0, 0.8039216, 1, 1,
0.03488785, 2.501848, 0.5884765, 0, 0.7960784, 1, 1,
0.03625921, -0.6785572, 4.65705, 0, 0.7882353, 1, 1,
0.03668694, 0.73844, -0.4561962, 0, 0.7843137, 1, 1,
0.03758345, 0.06887769, -1.035704, 0, 0.7764706, 1, 1,
0.03796362, 0.04395696, 1.937574, 0, 0.772549, 1, 1,
0.03945349, 1.508688, 0.9545974, 0, 0.7647059, 1, 1,
0.04403107, 1.31239, 1.240484, 0, 0.7607843, 1, 1,
0.04689315, -1.771676, 1.819318, 0, 0.7529412, 1, 1,
0.05800024, 0.3575688, 0.1404409, 0, 0.7490196, 1, 1,
0.05805598, 0.1230458, 0.6448008, 0, 0.7411765, 1, 1,
0.05808347, -0.1678652, 4.687236, 0, 0.7372549, 1, 1,
0.05899167, -0.8049843, 3.187575, 0, 0.7294118, 1, 1,
0.06078599, 0.7388709, -0.6286501, 0, 0.7254902, 1, 1,
0.06307313, 1.745435, -0.0944791, 0, 0.7176471, 1, 1,
0.06483872, -0.7799848, 3.011106, 0, 0.7137255, 1, 1,
0.0710528, -0.4321554, 1.453652, 0, 0.7058824, 1, 1,
0.07334705, 2.241581, -0.832829, 0, 0.6980392, 1, 1,
0.07464617, 0.07109324, 1.164178, 0, 0.6941177, 1, 1,
0.07722899, -1.126559, 4.289682, 0, 0.6862745, 1, 1,
0.07812805, -0.9086761, 3.615635, 0, 0.682353, 1, 1,
0.07863922, -1.367476, 2.171291, 0, 0.6745098, 1, 1,
0.08284077, 0.2266971, -0.3589422, 0, 0.6705883, 1, 1,
0.08455189, -0.2368237, 3.514192, 0, 0.6627451, 1, 1,
0.08958865, 0.1431355, 1.477095, 0, 0.6588235, 1, 1,
0.09898317, -0.3592925, 2.716388, 0, 0.6509804, 1, 1,
0.1009588, 0.4805869, 0.7623749, 0, 0.6470588, 1, 1,
0.1023008, 1.419159, 0.4438932, 0, 0.6392157, 1, 1,
0.104052, 1.618655, 0.05010242, 0, 0.6352941, 1, 1,
0.1080275, -1.101077, 3.971035, 0, 0.627451, 1, 1,
0.1095203, -0.4693548, 2.530219, 0, 0.6235294, 1, 1,
0.1096015, 1.691244, -0.1771961, 0, 0.6156863, 1, 1,
0.1103856, -1.567655, 3.195088, 0, 0.6117647, 1, 1,
0.112355, -1.027052, 3.779274, 0, 0.6039216, 1, 1,
0.1136023, 1.558597, 2.480425, 0, 0.5960785, 1, 1,
0.1173982, -0.6932622, 2.570342, 0, 0.5921569, 1, 1,
0.1180333, 0.7408624, -0.7777087, 0, 0.5843138, 1, 1,
0.1186108, 0.1306736, -0.1782649, 0, 0.5803922, 1, 1,
0.1189363, -0.7883756, 4.170171, 0, 0.572549, 1, 1,
0.1282979, 0.5121221, -1.108408, 0, 0.5686275, 1, 1,
0.1286126, 1.979176, 1.478601, 0, 0.5607843, 1, 1,
0.1308388, -0.229678, 3.802538, 0, 0.5568628, 1, 1,
0.1325207, -0.6938172, 3.466832, 0, 0.5490196, 1, 1,
0.1343427, -0.007737258, 2.267487, 0, 0.5450981, 1, 1,
0.1425241, -0.728009, 1.261361, 0, 0.5372549, 1, 1,
0.1449593, 0.6314813, 0.2904371, 0, 0.5333334, 1, 1,
0.1453472, 0.9060524, 0.1983859, 0, 0.5254902, 1, 1,
0.1492096, -0.6805773, 3.849162, 0, 0.5215687, 1, 1,
0.1521454, -0.416166, 2.845635, 0, 0.5137255, 1, 1,
0.153081, -1.384947, 4.763247, 0, 0.509804, 1, 1,
0.154738, -0.8948627, 1.441427, 0, 0.5019608, 1, 1,
0.1580441, -1.768592, 2.85507, 0, 0.4941176, 1, 1,
0.1635546, -1.6723, 2.647449, 0, 0.4901961, 1, 1,
0.1698948, -0.3467822, 4.692717, 0, 0.4823529, 1, 1,
0.1734962, -1.654622, 3.699114, 0, 0.4784314, 1, 1,
0.1780324, 2.16476, -0.356016, 0, 0.4705882, 1, 1,
0.1810915, -0.0131516, 2.221833, 0, 0.4666667, 1, 1,
0.1829163, -1.309301, 2.07632, 0, 0.4588235, 1, 1,
0.1839598, -2.009506, 4.42663, 0, 0.454902, 1, 1,
0.1875771, 2.312224, 0.2387508, 0, 0.4470588, 1, 1,
0.1882801, 0.9365631, 1.995933, 0, 0.4431373, 1, 1,
0.1900097, 0.06068217, 0.4774533, 0, 0.4352941, 1, 1,
0.1903461, -2.118684, 3.816018, 0, 0.4313726, 1, 1,
0.1916928, 0.7608457, 0.294395, 0, 0.4235294, 1, 1,
0.1918954, -1.029354, 4.643048, 0, 0.4196078, 1, 1,
0.1925347, 0.1588122, 0.9486395, 0, 0.4117647, 1, 1,
0.1998818, -1.340523, 4.171439, 0, 0.4078431, 1, 1,
0.2019334, 0.2840509, 0.5932395, 0, 0.4, 1, 1,
0.2064454, 0.5086709, 0.5695298, 0, 0.3921569, 1, 1,
0.2073831, -0.5270512, 3.560488, 0, 0.3882353, 1, 1,
0.2086036, 0.614682, -0.2011628, 0, 0.3803922, 1, 1,
0.2144409, -1.083, 2.72239, 0, 0.3764706, 1, 1,
0.2181413, 0.9614105, 0.5629571, 0, 0.3686275, 1, 1,
0.2189323, 0.4236563, 0.1356363, 0, 0.3647059, 1, 1,
0.2218627, -0.9065431, 2.262775, 0, 0.3568628, 1, 1,
0.2274881, -0.6594189, 4.249124, 0, 0.3529412, 1, 1,
0.2277359, 0.3809892, 0.9697837, 0, 0.345098, 1, 1,
0.2280109, 1.245627, 1.104115, 0, 0.3411765, 1, 1,
0.2290108, -2.698675, 3.268302, 0, 0.3333333, 1, 1,
0.246567, -0.606768, 3.319402, 0, 0.3294118, 1, 1,
0.2480784, -1.185383, 1.758974, 0, 0.3215686, 1, 1,
0.2515482, 0.8375138, 1.045658, 0, 0.3176471, 1, 1,
0.2572728, -0.04639546, -0.1978833, 0, 0.3098039, 1, 1,
0.2573549, 2.267465, 2.350736, 0, 0.3058824, 1, 1,
0.2597812, 1.865354, -1.217754, 0, 0.2980392, 1, 1,
0.2650872, 0.1329498, 3.438201, 0, 0.2901961, 1, 1,
0.2661939, 0.3283467, -0.5666794, 0, 0.2862745, 1, 1,
0.2698876, -0.5369218, 2.459951, 0, 0.2784314, 1, 1,
0.2733612, -0.7080129, 2.437295, 0, 0.2745098, 1, 1,
0.278217, -0.9686229, 2.451969, 0, 0.2666667, 1, 1,
0.2783488, 0.1497539, 0.5993651, 0, 0.2627451, 1, 1,
0.2825295, -0.2048623, 1.210318, 0, 0.254902, 1, 1,
0.2830945, -0.2946502, 1.937475, 0, 0.2509804, 1, 1,
0.2936396, -0.07593193, 1.308474, 0, 0.2431373, 1, 1,
0.294309, 0.2670222, -0.7823262, 0, 0.2392157, 1, 1,
0.2984073, 1.533168, -0.8615403, 0, 0.2313726, 1, 1,
0.2984389, -1.721069, 1.947872, 0, 0.227451, 1, 1,
0.3027269, 0.119439, 0.6642306, 0, 0.2196078, 1, 1,
0.3040441, -0.03565582, 3.239522, 0, 0.2156863, 1, 1,
0.3087379, 0.4802614, 1.480989, 0, 0.2078431, 1, 1,
0.3160703, 1.89435, -1.230842, 0, 0.2039216, 1, 1,
0.3167101, -0.1868026, 2.585716, 0, 0.1960784, 1, 1,
0.320742, 0.3588437, 1.991816, 0, 0.1882353, 1, 1,
0.322911, 1.780511, 1.023137, 0, 0.1843137, 1, 1,
0.3258834, -0.5128123, 2.557595, 0, 0.1764706, 1, 1,
0.3268333, -2.136786, 3.170642, 0, 0.172549, 1, 1,
0.3269707, -0.9316907, 2.866834, 0, 0.1647059, 1, 1,
0.3269762, 2.027098, -0.3543263, 0, 0.1607843, 1, 1,
0.331317, -0.1399671, 2.278665, 0, 0.1529412, 1, 1,
0.3324951, 0.7015736, 2.29622, 0, 0.1490196, 1, 1,
0.3329164, 0.1895354, 1.121669, 0, 0.1411765, 1, 1,
0.3331683, -0.8402061, 3.373575, 0, 0.1372549, 1, 1,
0.3365703, 1.79287, -0.5407182, 0, 0.1294118, 1, 1,
0.3414038, -0.5624803, 1.933488, 0, 0.1254902, 1, 1,
0.3420756, -1.098537, 2.941319, 0, 0.1176471, 1, 1,
0.3466148, -0.04364161, 2.63841, 0, 0.1137255, 1, 1,
0.3496075, 0.452504, 1.676034, 0, 0.1058824, 1, 1,
0.3571742, 1.042754, 0.9292909, 0, 0.09803922, 1, 1,
0.3590593, 0.04916167, 0.0074655, 0, 0.09411765, 1, 1,
0.3611641, 1.625051, -0.1894295, 0, 0.08627451, 1, 1,
0.36696, 0.9310067, 0.07015437, 0, 0.08235294, 1, 1,
0.36923, -1.401931, 1.0578, 0, 0.07450981, 1, 1,
0.3706481, 1.477024, -1.467907, 0, 0.07058824, 1, 1,
0.3722026, -0.5009784, 3.621018, 0, 0.0627451, 1, 1,
0.3756729, 0.2950721, 1.144696, 0, 0.05882353, 1, 1,
0.3773577, 1.01496, -0.996171, 0, 0.05098039, 1, 1,
0.3794563, 0.3058933, 2.303329, 0, 0.04705882, 1, 1,
0.38064, 1.847601, -1.60421, 0, 0.03921569, 1, 1,
0.3852553, 2.014332, 0.3108768, 0, 0.03529412, 1, 1,
0.3869618, 0.4151487, -0.6536482, 0, 0.02745098, 1, 1,
0.3982085, -0.252392, 1.011948, 0, 0.02352941, 1, 1,
0.4002078, 0.1378436, 1.528301, 0, 0.01568628, 1, 1,
0.4008836, 0.5223424, 1.384216, 0, 0.01176471, 1, 1,
0.4052669, 0.2875729, 0.474895, 0, 0.003921569, 1, 1,
0.4057772, -0.178128, 2.002588, 0.003921569, 0, 1, 1,
0.4104047, 0.4642243, -1.451133, 0.007843138, 0, 1, 1,
0.4108582, 1.255956, 0.8461388, 0.01568628, 0, 1, 1,
0.4140503, -1.923087, 3.571582, 0.01960784, 0, 1, 1,
0.4155622, 1.243411, -0.2407602, 0.02745098, 0, 1, 1,
0.4159102, -0.8050732, 2.307674, 0.03137255, 0, 1, 1,
0.4190277, -0.4488195, 3.287915, 0.03921569, 0, 1, 1,
0.4239657, -1.223635, 3.000041, 0.04313726, 0, 1, 1,
0.4298319, 2.659835, 0.5433335, 0.05098039, 0, 1, 1,
0.43092, 1.345096, 1.369557, 0.05490196, 0, 1, 1,
0.4392799, 1.321175, 1.887806, 0.0627451, 0, 1, 1,
0.4396222, 1.15479, -1.028172, 0.06666667, 0, 1, 1,
0.4531092, 0.02551755, -0.4995549, 0.07450981, 0, 1, 1,
0.4555268, -0.5229804, 1.901607, 0.07843138, 0, 1, 1,
0.4571574, -0.1444403, 1.846659, 0.08627451, 0, 1, 1,
0.4584151, 0.4893914, -0.4394525, 0.09019608, 0, 1, 1,
0.4584205, -0.4069161, 2.218942, 0.09803922, 0, 1, 1,
0.4604792, 0.7594787, 1.32136, 0.1058824, 0, 1, 1,
0.4685276, -0.2617934, 1.435889, 0.1098039, 0, 1, 1,
0.481755, 0.2267846, 1.462551, 0.1176471, 0, 1, 1,
0.4837538, 0.6969218, 0.8662609, 0.1215686, 0, 1, 1,
0.4855319, -1.099583, 1.59271, 0.1294118, 0, 1, 1,
0.4882162, -0.6458596, 4.148656, 0.1333333, 0, 1, 1,
0.4922521, -1.94336, 2.097988, 0.1411765, 0, 1, 1,
0.5048361, -0.4177253, 1.269336, 0.145098, 0, 1, 1,
0.5052471, 1.235932, 0.8876008, 0.1529412, 0, 1, 1,
0.5069725, 0.6023083, 0.9249439, 0.1568628, 0, 1, 1,
0.5100017, 0.1412192, 4.182591, 0.1647059, 0, 1, 1,
0.5117669, 0.8605928, 0.5142423, 0.1686275, 0, 1, 1,
0.5121037, 0.357213, 2.194038, 0.1764706, 0, 1, 1,
0.5148663, 0.3378468, -0.3542315, 0.1803922, 0, 1, 1,
0.5164004, -0.2841576, 2.02635, 0.1882353, 0, 1, 1,
0.5204533, -0.4066442, 2.428242, 0.1921569, 0, 1, 1,
0.5250703, 0.09709413, 3.048747, 0.2, 0, 1, 1,
0.527996, 0.008128206, 0.8722554, 0.2078431, 0, 1, 1,
0.5312615, -0.1007241, 1.189909, 0.2117647, 0, 1, 1,
0.5319439, 1.448461, -0.3264365, 0.2196078, 0, 1, 1,
0.5345386, 1.10367, -0.6510652, 0.2235294, 0, 1, 1,
0.5366177, -1.804495, 3.807648, 0.2313726, 0, 1, 1,
0.5385666, 0.3749223, 0.5007025, 0.2352941, 0, 1, 1,
0.5409397, -0.05643281, 1.482362, 0.2431373, 0, 1, 1,
0.5413734, -0.5831635, 3.444247, 0.2470588, 0, 1, 1,
0.5510304, -1.087251, 1.241585, 0.254902, 0, 1, 1,
0.5512251, -0.427277, 2.606796, 0.2588235, 0, 1, 1,
0.5582703, 0.7270842, 0.6598668, 0.2666667, 0, 1, 1,
0.5597955, 0.2793933, 2.011517, 0.2705882, 0, 1, 1,
0.5625086, 0.125714, 2.14943, 0.2784314, 0, 1, 1,
0.5662395, -1.034554, 3.18008, 0.282353, 0, 1, 1,
0.5751306, 0.7631292, 1.460003, 0.2901961, 0, 1, 1,
0.5763999, -2.567845, 4.776669, 0.2941177, 0, 1, 1,
0.5766752, -0.4450826, 1.195588, 0.3019608, 0, 1, 1,
0.5802876, 0.2320348, -0.01264425, 0.3098039, 0, 1, 1,
0.581592, 0.5018533, -0.06952062, 0.3137255, 0, 1, 1,
0.5856293, -1.19757, 3.032421, 0.3215686, 0, 1, 1,
0.5873939, -1.247841, 3.203503, 0.3254902, 0, 1, 1,
0.5897331, 0.1075147, 3.766774, 0.3333333, 0, 1, 1,
0.5899343, -0.2775562, 1.844049, 0.3372549, 0, 1, 1,
0.5912538, -0.4944329, 3.922712, 0.345098, 0, 1, 1,
0.5923204, -0.01838203, -1.016584, 0.3490196, 0, 1, 1,
0.5933262, -0.9031026, 3.55314, 0.3568628, 0, 1, 1,
0.5944545, 0.5722126, 1.784114, 0.3607843, 0, 1, 1,
0.5955091, -2.515315, 0.930993, 0.3686275, 0, 1, 1,
0.5975629, -1.133571, 2.094016, 0.372549, 0, 1, 1,
0.5981287, -0.3080727, 4.267087, 0.3803922, 0, 1, 1,
0.6021978, -0.666082, 1.841488, 0.3843137, 0, 1, 1,
0.6026592, 0.1471559, -1.238973, 0.3921569, 0, 1, 1,
0.6047405, -0.7362268, 1.549229, 0.3960784, 0, 1, 1,
0.6154546, 0.6456692, 0.6900619, 0.4039216, 0, 1, 1,
0.6193896, 1.328551, 1.944751, 0.4117647, 0, 1, 1,
0.6198422, -0.1524864, 0.7017801, 0.4156863, 0, 1, 1,
0.6215383, 0.9337353, -1.165827, 0.4235294, 0, 1, 1,
0.6228724, -0.9315664, 2.98198, 0.427451, 0, 1, 1,
0.6244043, -0.7872062, 2.084887, 0.4352941, 0, 1, 1,
0.6252274, -0.5086095, 1.007869, 0.4392157, 0, 1, 1,
0.626097, 1.010386, -1.150829, 0.4470588, 0, 1, 1,
0.6262186, -0.4135473, 2.80203, 0.4509804, 0, 1, 1,
0.6303047, -0.7432868, 1.145609, 0.4588235, 0, 1, 1,
0.6314188, 1.295473, 0.2360133, 0.4627451, 0, 1, 1,
0.6329833, 0.1180626, 0.3131005, 0.4705882, 0, 1, 1,
0.6358402, -1.197888, 1.021638, 0.4745098, 0, 1, 1,
0.6368638, -0.4034883, 1.879849, 0.4823529, 0, 1, 1,
0.6467544, 0.4966882, 2.718757, 0.4862745, 0, 1, 1,
0.6475245, 1.50856, 1.714257, 0.4941176, 0, 1, 1,
0.6491071, 0.9590445, 1.024672, 0.5019608, 0, 1, 1,
0.6519874, 0.4400145, 0.7905081, 0.5058824, 0, 1, 1,
0.6522602, -0.484664, 1.600352, 0.5137255, 0, 1, 1,
0.656922, 0.7818256, -0.2988322, 0.5176471, 0, 1, 1,
0.6600411, -0.05859495, 2.959761, 0.5254902, 0, 1, 1,
0.6617337, -0.8589665, 3.192724, 0.5294118, 0, 1, 1,
0.6655294, -0.0009270657, 0.9892907, 0.5372549, 0, 1, 1,
0.6666934, 0.003849192, 1.472109, 0.5411765, 0, 1, 1,
0.6696025, -0.1080207, 1.81203, 0.5490196, 0, 1, 1,
0.6784781, 0.2131379, 2.948997, 0.5529412, 0, 1, 1,
0.6815692, -0.09645094, 1.500671, 0.5607843, 0, 1, 1,
0.6848531, 0.01560711, 1.927241, 0.5647059, 0, 1, 1,
0.6853646, -0.420906, 2.38986, 0.572549, 0, 1, 1,
0.6868111, 0.2535967, 2.86096, 0.5764706, 0, 1, 1,
0.6907793, -0.8576554, 1.553841, 0.5843138, 0, 1, 1,
0.6910521, 0.8204567, 0.760614, 0.5882353, 0, 1, 1,
0.6992924, -0.4547556, 3.051605, 0.5960785, 0, 1, 1,
0.7007298, 1.344368, -1.108193, 0.6039216, 0, 1, 1,
0.7020896, 0.3141667, 2.674207, 0.6078432, 0, 1, 1,
0.7057533, -0.5792729, 1.670062, 0.6156863, 0, 1, 1,
0.7139505, -3.044949, 3.494689, 0.6196079, 0, 1, 1,
0.7149929, -0.7831535, 1.972884, 0.627451, 0, 1, 1,
0.7189532, -0.4373473, 2.434293, 0.6313726, 0, 1, 1,
0.7327064, 0.6958414, -0.7679764, 0.6392157, 0, 1, 1,
0.7330239, -0.4717547, 3.98752, 0.6431373, 0, 1, 1,
0.7336433, -0.5350536, 3.204407, 0.6509804, 0, 1, 1,
0.7359564, 0.9776664, 0.5940421, 0.654902, 0, 1, 1,
0.736288, 0.5443288, 1.474835, 0.6627451, 0, 1, 1,
0.7400414, -1.573211, 2.968875, 0.6666667, 0, 1, 1,
0.7402726, -0.4367558, 2.099802, 0.6745098, 0, 1, 1,
0.7455354, 0.07397088, 1.304213, 0.6784314, 0, 1, 1,
0.7457368, 0.3529378, 1.892667, 0.6862745, 0, 1, 1,
0.7472901, 0.008776519, 0.4733304, 0.6901961, 0, 1, 1,
0.7658529, 2.306842, 0.4640593, 0.6980392, 0, 1, 1,
0.7704757, 1.316099, 2.292737, 0.7058824, 0, 1, 1,
0.7713865, 0.3413134, 0.4638419, 0.7098039, 0, 1, 1,
0.7755833, 0.003067577, 1.762458, 0.7176471, 0, 1, 1,
0.7815223, 0.4002014, 0.6641442, 0.7215686, 0, 1, 1,
0.7866422, -0.9665692, 0.9747304, 0.7294118, 0, 1, 1,
0.7891591, -0.4956575, 3.698396, 0.7333333, 0, 1, 1,
0.7929003, 0.01778143, 2.320921, 0.7411765, 0, 1, 1,
0.7995785, -0.9290794, 4.529183, 0.7450981, 0, 1, 1,
0.8051109, 0.2486298, 0.3302015, 0.7529412, 0, 1, 1,
0.8082067, 1.839671, 1.368159, 0.7568628, 0, 1, 1,
0.8088677, 0.5222886, 0.9302527, 0.7647059, 0, 1, 1,
0.8127039, -0.3231311, 0.3560733, 0.7686275, 0, 1, 1,
0.81402, -0.4111064, 2.321716, 0.7764706, 0, 1, 1,
0.8260853, -0.2386579, 2.388685, 0.7803922, 0, 1, 1,
0.8292255, 0.321096, 1.653635, 0.7882353, 0, 1, 1,
0.8417919, 0.8959396, -0.1571874, 0.7921569, 0, 1, 1,
0.8425694, 0.1942851, 0.2036102, 0.8, 0, 1, 1,
0.8434525, 0.3691743, 2.135524, 0.8078431, 0, 1, 1,
0.8522422, -0.1955025, 2.206763, 0.8117647, 0, 1, 1,
0.8559287, -1.10948, 2.360398, 0.8196079, 0, 1, 1,
0.8574592, 0.6793486, -0.08683854, 0.8235294, 0, 1, 1,
0.860606, 1.219786, 0.6085867, 0.8313726, 0, 1, 1,
0.8639557, 0.4831082, 1.11435, 0.8352941, 0, 1, 1,
0.8651696, -0.4095093, 2.029116, 0.8431373, 0, 1, 1,
0.8661085, -0.7386112, 2.495543, 0.8470588, 0, 1, 1,
0.8728896, -1.930997, 1.532318, 0.854902, 0, 1, 1,
0.8732427, -1.374359, 3.549256, 0.8588235, 0, 1, 1,
0.8744488, -0.5002008, 3.398503, 0.8666667, 0, 1, 1,
0.8811506, 0.7983447, 1.362179, 0.8705882, 0, 1, 1,
0.8909354, -0.2672296, 2.312191, 0.8784314, 0, 1, 1,
0.8982454, -0.4603221, 2.229591, 0.8823529, 0, 1, 1,
0.8989177, 0.3771037, -0.5385824, 0.8901961, 0, 1, 1,
0.8993974, -0.8837332, 3.032767, 0.8941177, 0, 1, 1,
0.8995315, -0.4131966, 1.413078, 0.9019608, 0, 1, 1,
0.9002419, 1.358495, -0.4552863, 0.9098039, 0, 1, 1,
0.9012731, 0.1846186, 1.740811, 0.9137255, 0, 1, 1,
0.9030777, -0.1764694, 2.205498, 0.9215686, 0, 1, 1,
0.9072682, 0.6929184, 1.502525, 0.9254902, 0, 1, 1,
0.9128022, 0.3474011, -0.2106406, 0.9333333, 0, 1, 1,
0.9134685, -0.2290804, 1.404587, 0.9372549, 0, 1, 1,
0.918367, -0.6829535, 2.749188, 0.945098, 0, 1, 1,
0.920647, -1.675786, 0.1407055, 0.9490196, 0, 1, 1,
0.9211058, -0.4381966, -0.01956394, 0.9568627, 0, 1, 1,
0.9237977, 1.056615, 0.1258893, 0.9607843, 0, 1, 1,
0.9251828, 0.2066789, 1.370855, 0.9686275, 0, 1, 1,
0.9255596, 1.482412, 1.682468, 0.972549, 0, 1, 1,
0.9274967, 1.119269, 1.786124, 0.9803922, 0, 1, 1,
0.930265, 0.3188936, 0.9135746, 0.9843137, 0, 1, 1,
0.9310291, -0.357547, 1.833925, 0.9921569, 0, 1, 1,
0.93635, 1.131823, 2.269386, 0.9960784, 0, 1, 1,
0.9369044, 1.176056, -1.872192, 1, 0, 0.9960784, 1,
0.9370806, 0.6525533, -0.128726, 1, 0, 0.9882353, 1,
0.9396898, -0.466875, 2.574419, 1, 0, 0.9843137, 1,
0.9446422, 0.5152636, 1.346153, 1, 0, 0.9764706, 1,
0.945646, 1.295873, 1.561166, 1, 0, 0.972549, 1,
0.9482491, 0.6228461, 0.9691368, 1, 0, 0.9647059, 1,
0.9523332, 1.924301, 0.783416, 1, 0, 0.9607843, 1,
0.953594, -1.786794, 2.475402, 1, 0, 0.9529412, 1,
0.9537333, -0.8649737, 1.830885, 1, 0, 0.9490196, 1,
0.9588401, 0.3515003, 1.01194, 1, 0, 0.9411765, 1,
0.9641672, 0.3478698, 2.651517, 1, 0, 0.9372549, 1,
0.9644392, -0.5364569, 0.9445602, 1, 0, 0.9294118, 1,
0.9697088, 1.084547, 0.09154559, 1, 0, 0.9254902, 1,
0.9697124, 1.54296, -0.2280579, 1, 0, 0.9176471, 1,
0.9738576, 0.2380732, 1.406967, 1, 0, 0.9137255, 1,
0.9788769, -0.4382917, 2.698993, 1, 0, 0.9058824, 1,
0.9875967, -0.5281143, 2.449567, 1, 0, 0.9019608, 1,
0.9879624, 1.184107, 1.394057, 1, 0, 0.8941177, 1,
1.016973, -0.9516915, 1.34291, 1, 0, 0.8862745, 1,
1.026309, -0.2881374, 0.6943277, 1, 0, 0.8823529, 1,
1.030898, -2.723424, 2.2604, 1, 0, 0.8745098, 1,
1.031379, -0.1073418, 2.486776, 1, 0, 0.8705882, 1,
1.032341, 0.01622341, 0.3958808, 1, 0, 0.8627451, 1,
1.037732, -0.3492665, 2.245234, 1, 0, 0.8588235, 1,
1.042028, 2.554428, -0.04963864, 1, 0, 0.8509804, 1,
1.047084, 0.5965169, 0.1581078, 1, 0, 0.8470588, 1,
1.04865, 0.9157996, -1.457572, 1, 0, 0.8392157, 1,
1.059236, 0.924999, -0.2110179, 1, 0, 0.8352941, 1,
1.068909, -0.9547769, 1.970857, 1, 0, 0.827451, 1,
1.070381, 1.106932, 1.293442, 1, 0, 0.8235294, 1,
1.077461, -0.1135413, 1.452943, 1, 0, 0.8156863, 1,
1.079175, 0.4482359, 2.723484, 1, 0, 0.8117647, 1,
1.08233, -1.139741, 1.572913, 1, 0, 0.8039216, 1,
1.083146, -0.08949498, 1.409437, 1, 0, 0.7960784, 1,
1.08754, 0.2753859, 0.7764237, 1, 0, 0.7921569, 1,
1.104786, 0.02227594, 2.20443, 1, 0, 0.7843137, 1,
1.113411, -0.1530375, 1.852682, 1, 0, 0.7803922, 1,
1.120001, -0.6117643, 2.766423, 1, 0, 0.772549, 1,
1.123391, 2.157464, -0.582074, 1, 0, 0.7686275, 1,
1.127939, 1.926458, -1.318191, 1, 0, 0.7607843, 1,
1.151971, 1.027129, 0.7793165, 1, 0, 0.7568628, 1,
1.158952, 1.020759, -0.2765213, 1, 0, 0.7490196, 1,
1.16179, -2.299754, 3.469946, 1, 0, 0.7450981, 1,
1.162332, -1.713691, 2.43028, 1, 0, 0.7372549, 1,
1.168682, -0.5117078, 2.440324, 1, 0, 0.7333333, 1,
1.176654, 1.879442, 1.090323, 1, 0, 0.7254902, 1,
1.178479, -0.4883718, 2.449425, 1, 0, 0.7215686, 1,
1.18302, -0.04258353, 1.690201, 1, 0, 0.7137255, 1,
1.183307, 0.9596754, 0.8952636, 1, 0, 0.7098039, 1,
1.184814, 1.29656, 1.751234, 1, 0, 0.7019608, 1,
1.192068, 0.4781959, 0.6775016, 1, 0, 0.6941177, 1,
1.202195, -1.211405, 2.068951, 1, 0, 0.6901961, 1,
1.210252, -0.1165927, 2.165348, 1, 0, 0.682353, 1,
1.218472, 1.602559, 1.523769, 1, 0, 0.6784314, 1,
1.219904, -0.2745667, 1.27686, 1, 0, 0.6705883, 1,
1.235251, 0.9559821, 1.351617, 1, 0, 0.6666667, 1,
1.238081, -0.2533201, 1.883604, 1, 0, 0.6588235, 1,
1.246245, -0.7126758, 3.317907, 1, 0, 0.654902, 1,
1.246343, 0.09084883, 0.604829, 1, 0, 0.6470588, 1,
1.247472, -1.386921, 3.276899, 1, 0, 0.6431373, 1,
1.25426, -1.186994, 3.077588, 1, 0, 0.6352941, 1,
1.262165, -0.2605668, 2.007711, 1, 0, 0.6313726, 1,
1.266643, 1.161442, 3.072392, 1, 0, 0.6235294, 1,
1.268574, -0.6593214, 1.37254, 1, 0, 0.6196079, 1,
1.272029, -0.2264011, 2.519258, 1, 0, 0.6117647, 1,
1.279437, 0.1600773, 0.8036876, 1, 0, 0.6078432, 1,
1.290047, 0.2586078, 1.009295, 1, 0, 0.6, 1,
1.292561, -0.6532109, 2.836386, 1, 0, 0.5921569, 1,
1.295263, 0.3287826, 1.554574, 1, 0, 0.5882353, 1,
1.299838, 1.25457, 1.667221, 1, 0, 0.5803922, 1,
1.300501, -1.885097, 3.437467, 1, 0, 0.5764706, 1,
1.301199, 1.667497, 0.03040697, 1, 0, 0.5686275, 1,
1.303478, -1.25121, 1.682435, 1, 0, 0.5647059, 1,
1.313377, 1.275578, 1.147666, 1, 0, 0.5568628, 1,
1.314311, 1.308874, 1.720091, 1, 0, 0.5529412, 1,
1.314623, -1.032252, 2.034447, 1, 0, 0.5450981, 1,
1.316893, -1.085513, 2.97155, 1, 0, 0.5411765, 1,
1.317806, -0.7788649, 1.166147, 1, 0, 0.5333334, 1,
1.328166, 0.3713434, 1.359035, 1, 0, 0.5294118, 1,
1.337331, 0.7997339, 3.071487, 1, 0, 0.5215687, 1,
1.3415, 0.7219915, -0.1703335, 1, 0, 0.5176471, 1,
1.342933, 0.7243989, -0.350219, 1, 0, 0.509804, 1,
1.347464, 1.108929, 2.140194, 1, 0, 0.5058824, 1,
1.351134, 2.499148, -0.7172556, 1, 0, 0.4980392, 1,
1.353356, -0.1970269, 0.2979234, 1, 0, 0.4901961, 1,
1.356323, -0.3812348, 0.4077442, 1, 0, 0.4862745, 1,
1.381431, -2.497718, 2.98769, 1, 0, 0.4784314, 1,
1.383891, 0.2308341, 1.947206, 1, 0, 0.4745098, 1,
1.389042, 0.3130714, 2.081474, 1, 0, 0.4666667, 1,
1.394439, -0.05905143, 1.189555, 1, 0, 0.4627451, 1,
1.401239, 1.391195, 3.234907, 1, 0, 0.454902, 1,
1.404794, 0.9870479, 2.205419, 1, 0, 0.4509804, 1,
1.407514, 0.3543694, 1.020524, 1, 0, 0.4431373, 1,
1.414295, -0.1604179, 1.450537, 1, 0, 0.4392157, 1,
1.417777, -0.7900085, 1.251655, 1, 0, 0.4313726, 1,
1.42911, -0.250526, 0.8952675, 1, 0, 0.427451, 1,
1.43059, -1.336779, 1.729016, 1, 0, 0.4196078, 1,
1.439039, -0.3842881, 3.201925, 1, 0, 0.4156863, 1,
1.466267, 0.3097918, 1.467339, 1, 0, 0.4078431, 1,
1.470626, -1.331289, 1.906296, 1, 0, 0.4039216, 1,
1.479793, -0.09901308, 1.716941, 1, 0, 0.3960784, 1,
1.489618, -0.9546928, 3.592568, 1, 0, 0.3882353, 1,
1.51316, -0.3371273, 2.089687, 1, 0, 0.3843137, 1,
1.528728, -0.504021, 0.06947748, 1, 0, 0.3764706, 1,
1.539567, 0.8969907, 0.6420176, 1, 0, 0.372549, 1,
1.546203, 0.2321879, 0.4928193, 1, 0, 0.3647059, 1,
1.547961, -0.05505976, 2.507147, 1, 0, 0.3607843, 1,
1.559188, -0.3166245, 0.5859889, 1, 0, 0.3529412, 1,
1.565308, -1.494033, 1.874448, 1, 0, 0.3490196, 1,
1.576535, -1.668151, 3.337372, 1, 0, 0.3411765, 1,
1.578102, -2.40339, 3.315621, 1, 0, 0.3372549, 1,
1.579045, -0.2294025, 2.291168, 1, 0, 0.3294118, 1,
1.591696, 1.155063, 0.6673502, 1, 0, 0.3254902, 1,
1.609375, -1.312288, 0.9493292, 1, 0, 0.3176471, 1,
1.611184, -1.250892, 1.676549, 1, 0, 0.3137255, 1,
1.61998, -0.7304087, 1.512927, 1, 0, 0.3058824, 1,
1.627894, 0.6675371, 1.967718, 1, 0, 0.2980392, 1,
1.638573, -0.7814928, 1.237378, 1, 0, 0.2941177, 1,
1.645859, 1.505598, 0.9660721, 1, 0, 0.2862745, 1,
1.652177, 0.297009, 2.771968, 1, 0, 0.282353, 1,
1.665237, 1.129601, -0.953835, 1, 0, 0.2745098, 1,
1.667145, -0.8075097, 2.024944, 1, 0, 0.2705882, 1,
1.684391, 1.871392, 0.9693304, 1, 0, 0.2627451, 1,
1.691007, -1.588687, 2.929843, 1, 0, 0.2588235, 1,
1.699447, -0.5763219, 0.5042305, 1, 0, 0.2509804, 1,
1.711127, 0.2022434, 2.462517, 1, 0, 0.2470588, 1,
1.735935, 0.4324043, 1.985314, 1, 0, 0.2392157, 1,
1.74819, 1.216758, 0.2884841, 1, 0, 0.2352941, 1,
1.772657, -1.719836, 0.7179141, 1, 0, 0.227451, 1,
1.775405, -0.8318897, 2.553351, 1, 0, 0.2235294, 1,
1.804276, 0.7616053, 1.566472, 1, 0, 0.2156863, 1,
1.817055, -0.2490335, 1.790984, 1, 0, 0.2117647, 1,
1.830925, -0.5154014, 2.034885, 1, 0, 0.2039216, 1,
1.832178, -0.8164274, 2.771472, 1, 0, 0.1960784, 1,
1.857931, 0.8762127, 0.8034869, 1, 0, 0.1921569, 1,
1.865286, -0.5561257, 2.173435, 1, 0, 0.1843137, 1,
1.884121, 0.7910485, 1.574968, 1, 0, 0.1803922, 1,
1.886721, -0.3879417, 0.9001405, 1, 0, 0.172549, 1,
1.886874, -2.242917, 3.031044, 1, 0, 0.1686275, 1,
1.893339, 0.09401769, -0.1191521, 1, 0, 0.1607843, 1,
1.909682, 0.4287438, -0.3432848, 1, 0, 0.1568628, 1,
1.917464, 1.615554, 0.4203585, 1, 0, 0.1490196, 1,
1.968457, -0.4204533, 3.383237, 1, 0, 0.145098, 1,
1.987572, -1.240152, 1.241698, 1, 0, 0.1372549, 1,
2.043313, -0.951463, 2.137326, 1, 0, 0.1333333, 1,
2.051324, -1.094657, 2.368345, 1, 0, 0.1254902, 1,
2.067962, -0.2312953, 0.8320864, 1, 0, 0.1215686, 1,
2.112923, 1.341011, -0.3855121, 1, 0, 0.1137255, 1,
2.152453, -0.0794917, 1.077352, 1, 0, 0.1098039, 1,
2.173672, 0.8723131, 3.855783, 1, 0, 0.1019608, 1,
2.177434, 0.7844557, 2.074057, 1, 0, 0.09411765, 1,
2.193425, 1.058982, 0.2318876, 1, 0, 0.09019608, 1,
2.329581, -0.3351209, 1.548946, 1, 0, 0.08235294, 1,
2.365844, 0.4065621, 0.6873236, 1, 0, 0.07843138, 1,
2.394308, 0.7796383, 1.514781, 1, 0, 0.07058824, 1,
2.430903, 0.5068471, 1.020072, 1, 0, 0.06666667, 1,
2.451858, 0.758106, -0.6521443, 1, 0, 0.05882353, 1,
2.45797, -0.1044159, -0.2144801, 1, 0, 0.05490196, 1,
2.497595, -0.16888, 3.221521, 1, 0, 0.04705882, 1,
2.56854, 0.9991158, 1.372271, 1, 0, 0.04313726, 1,
2.590496, -1.344287, 2.570722, 1, 0, 0.03529412, 1,
2.591991, 0.2253574, 1.74622, 1, 0, 0.03137255, 1,
2.803006, 0.2598801, 2.483494, 1, 0, 0.02352941, 1,
2.959484, 0.07050189, 0.7796071, 1, 0, 0.01960784, 1,
3.011784, -0.8691631, 1.460912, 1, 0, 0.01176471, 1,
3.332916, -0.514361, 1.420214, 1, 0, 0.007843138, 1
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
0.2606311, -4.057515, -7.027078, 0, -0.5, 0.5, 0.5,
0.2606311, -4.057515, -7.027078, 1, -0.5, 0.5, 0.5,
0.2606311, -4.057515, -7.027078, 1, 1.5, 0.5, 0.5,
0.2606311, -4.057515, -7.027078, 0, 1.5, 0.5, 0.5
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
-3.853158, -0.05803025, -7.027078, 0, -0.5, 0.5, 0.5,
-3.853158, -0.05803025, -7.027078, 1, -0.5, 0.5, 0.5,
-3.853158, -0.05803025, -7.027078, 1, 1.5, 0.5, 0.5,
-3.853158, -0.05803025, -7.027078, 0, 1.5, 0.5, 0.5
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
-3.853158, -4.057515, -0.2698243, 0, -0.5, 0.5, 0.5,
-3.853158, -4.057515, -0.2698243, 1, -0.5, 0.5, 0.5,
-3.853158, -4.057515, -0.2698243, 1, 1.5, 0.5, 0.5,
-3.853158, -4.057515, -0.2698243, 0, 1.5, 0.5, 0.5
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
-2, -3.134557, -5.467712,
3, -3.134557, -5.467712,
-2, -3.134557, -5.467712,
-2, -3.288383, -5.727606,
-1, -3.134557, -5.467712,
-1, -3.288383, -5.727606,
0, -3.134557, -5.467712,
0, -3.288383, -5.727606,
1, -3.134557, -5.467712,
1, -3.288383, -5.727606,
2, -3.134557, -5.467712,
2, -3.288383, -5.727606,
3, -3.134557, -5.467712,
3, -3.288383, -5.727606
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
-2, -3.596036, -6.247395, 0, -0.5, 0.5, 0.5,
-2, -3.596036, -6.247395, 1, -0.5, 0.5, 0.5,
-2, -3.596036, -6.247395, 1, 1.5, 0.5, 0.5,
-2, -3.596036, -6.247395, 0, 1.5, 0.5, 0.5,
-1, -3.596036, -6.247395, 0, -0.5, 0.5, 0.5,
-1, -3.596036, -6.247395, 1, -0.5, 0.5, 0.5,
-1, -3.596036, -6.247395, 1, 1.5, 0.5, 0.5,
-1, -3.596036, -6.247395, 0, 1.5, 0.5, 0.5,
0, -3.596036, -6.247395, 0, -0.5, 0.5, 0.5,
0, -3.596036, -6.247395, 1, -0.5, 0.5, 0.5,
0, -3.596036, -6.247395, 1, 1.5, 0.5, 0.5,
0, -3.596036, -6.247395, 0, 1.5, 0.5, 0.5,
1, -3.596036, -6.247395, 0, -0.5, 0.5, 0.5,
1, -3.596036, -6.247395, 1, -0.5, 0.5, 0.5,
1, -3.596036, -6.247395, 1, 1.5, 0.5, 0.5,
1, -3.596036, -6.247395, 0, 1.5, 0.5, 0.5,
2, -3.596036, -6.247395, 0, -0.5, 0.5, 0.5,
2, -3.596036, -6.247395, 1, -0.5, 0.5, 0.5,
2, -3.596036, -6.247395, 1, 1.5, 0.5, 0.5,
2, -3.596036, -6.247395, 0, 1.5, 0.5, 0.5,
3, -3.596036, -6.247395, 0, -0.5, 0.5, 0.5,
3, -3.596036, -6.247395, 1, -0.5, 0.5, 0.5,
3, -3.596036, -6.247395, 1, 1.5, 0.5, 0.5,
3, -3.596036, -6.247395, 0, 1.5, 0.5, 0.5
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
-2.903822, -3, -5.467712,
-2.903822, 2, -5.467712,
-2.903822, -3, -5.467712,
-3.062045, -3, -5.727606,
-2.903822, -2, -5.467712,
-3.062045, -2, -5.727606,
-2.903822, -1, -5.467712,
-3.062045, -1, -5.727606,
-2.903822, 0, -5.467712,
-3.062045, 0, -5.727606,
-2.903822, 1, -5.467712,
-3.062045, 1, -5.727606,
-2.903822, 2, -5.467712,
-3.062045, 2, -5.727606
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
-3.37849, -3, -6.247395, 0, -0.5, 0.5, 0.5,
-3.37849, -3, -6.247395, 1, -0.5, 0.5, 0.5,
-3.37849, -3, -6.247395, 1, 1.5, 0.5, 0.5,
-3.37849, -3, -6.247395, 0, 1.5, 0.5, 0.5,
-3.37849, -2, -6.247395, 0, -0.5, 0.5, 0.5,
-3.37849, -2, -6.247395, 1, -0.5, 0.5, 0.5,
-3.37849, -2, -6.247395, 1, 1.5, 0.5, 0.5,
-3.37849, -2, -6.247395, 0, 1.5, 0.5, 0.5,
-3.37849, -1, -6.247395, 0, -0.5, 0.5, 0.5,
-3.37849, -1, -6.247395, 1, -0.5, 0.5, 0.5,
-3.37849, -1, -6.247395, 1, 1.5, 0.5, 0.5,
-3.37849, -1, -6.247395, 0, 1.5, 0.5, 0.5,
-3.37849, 0, -6.247395, 0, -0.5, 0.5, 0.5,
-3.37849, 0, -6.247395, 1, -0.5, 0.5, 0.5,
-3.37849, 0, -6.247395, 1, 1.5, 0.5, 0.5,
-3.37849, 0, -6.247395, 0, 1.5, 0.5, 0.5,
-3.37849, 1, -6.247395, 0, -0.5, 0.5, 0.5,
-3.37849, 1, -6.247395, 1, -0.5, 0.5, 0.5,
-3.37849, 1, -6.247395, 1, 1.5, 0.5, 0.5,
-3.37849, 1, -6.247395, 0, 1.5, 0.5, 0.5,
-3.37849, 2, -6.247395, 0, -0.5, 0.5, 0.5,
-3.37849, 2, -6.247395, 1, -0.5, 0.5, 0.5,
-3.37849, 2, -6.247395, 1, 1.5, 0.5, 0.5,
-3.37849, 2, -6.247395, 0, 1.5, 0.5, 0.5
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
-2.903822, -3.134557, -4,
-2.903822, -3.134557, 4,
-2.903822, -3.134557, -4,
-3.062045, -3.288383, -4,
-2.903822, -3.134557, -2,
-3.062045, -3.288383, -2,
-2.903822, -3.134557, 0,
-3.062045, -3.288383, 0,
-2.903822, -3.134557, 2,
-3.062045, -3.288383, 2,
-2.903822, -3.134557, 4,
-3.062045, -3.288383, 4
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
-3.37849, -3.596036, -4, 0, -0.5, 0.5, 0.5,
-3.37849, -3.596036, -4, 1, -0.5, 0.5, 0.5,
-3.37849, -3.596036, -4, 1, 1.5, 0.5, 0.5,
-3.37849, -3.596036, -4, 0, 1.5, 0.5, 0.5,
-3.37849, -3.596036, -2, 0, -0.5, 0.5, 0.5,
-3.37849, -3.596036, -2, 1, -0.5, 0.5, 0.5,
-3.37849, -3.596036, -2, 1, 1.5, 0.5, 0.5,
-3.37849, -3.596036, -2, 0, 1.5, 0.5, 0.5,
-3.37849, -3.596036, 0, 0, -0.5, 0.5, 0.5,
-3.37849, -3.596036, 0, 1, -0.5, 0.5, 0.5,
-3.37849, -3.596036, 0, 1, 1.5, 0.5, 0.5,
-3.37849, -3.596036, 0, 0, 1.5, 0.5, 0.5,
-3.37849, -3.596036, 2, 0, -0.5, 0.5, 0.5,
-3.37849, -3.596036, 2, 1, -0.5, 0.5, 0.5,
-3.37849, -3.596036, 2, 1, 1.5, 0.5, 0.5,
-3.37849, -3.596036, 2, 0, 1.5, 0.5, 0.5,
-3.37849, -3.596036, 4, 0, -0.5, 0.5, 0.5,
-3.37849, -3.596036, 4, 1, -0.5, 0.5, 0.5,
-3.37849, -3.596036, 4, 1, 1.5, 0.5, 0.5,
-3.37849, -3.596036, 4, 0, 1.5, 0.5, 0.5
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
-2.903822, -3.134557, -5.467712,
-2.903822, 3.018496, -5.467712,
-2.903822, -3.134557, 4.928063,
-2.903822, 3.018496, 4.928063,
-2.903822, -3.134557, -5.467712,
-2.903822, -3.134557, 4.928063,
-2.903822, 3.018496, -5.467712,
-2.903822, 3.018496, 4.928063,
-2.903822, -3.134557, -5.467712,
3.425084, -3.134557, -5.467712,
-2.903822, -3.134557, 4.928063,
3.425084, -3.134557, 4.928063,
-2.903822, 3.018496, -5.467712,
3.425084, 3.018496, -5.467712,
-2.903822, 3.018496, 4.928063,
3.425084, 3.018496, 4.928063,
3.425084, -3.134557, -5.467712,
3.425084, 3.018496, -5.467712,
3.425084, -3.134557, 4.928063,
3.425084, 3.018496, 4.928063,
3.425084, -3.134557, -5.467712,
3.425084, -3.134557, 4.928063,
3.425084, 3.018496, -5.467712,
3.425084, 3.018496, 4.928063
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
var radius = 7.282275;
var distance = 32.39966;
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
mvMatrix.translate( -0.2606311, 0.05803025, 0.2698243 );
mvMatrix.scale( 1.244092, 1.279647, 0.7573979 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.39966);
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
thidiazuron<-read.table("thidiazuron.xyz")
```

```
## Error in read.table("thidiazuron.xyz"): no lines available in input
```

```r
x<-thidiazuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'thidiazuron' not found
```

```r
y<-thidiazuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'thidiazuron' not found
```

```r
z<-thidiazuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'thidiazuron' not found
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
-2.811653, 1.584341, -1.355142, 0, 0, 1, 1, 1,
-2.572877, 0.691759, -0.7996754, 1, 0, 0, 1, 1,
-2.498123, 0.4274754, -0.07496385, 1, 0, 0, 1, 1,
-2.482201, 0.4790955, 0.02986779, 1, 0, 0, 1, 1,
-2.474631, -0.01988758, -1.115754, 1, 0, 0, 1, 1,
-2.363173, -0.363886, -2.405171, 1, 0, 0, 1, 1,
-2.33149, -1.12069, -1.296547, 0, 0, 0, 1, 1,
-2.247309, 2.110148, -1.420217, 0, 0, 0, 1, 1,
-2.212246, -0.5205007, -1.530493, 0, 0, 0, 1, 1,
-2.199294, 0.2895567, -2.438327, 0, 0, 0, 1, 1,
-2.158589, -0.8016381, -0.6816139, 0, 0, 0, 1, 1,
-2.092704, -0.3926346, -2.57742, 0, 0, 0, 1, 1,
-2.062982, -0.6868845, -4.799148, 0, 0, 0, 1, 1,
-2.057357, 0.1743109, -2.455105, 1, 1, 1, 1, 1,
-2.049321, 1.039075, -1.079133, 1, 1, 1, 1, 1,
-2.037747, -0.9817196, -1.661881, 1, 1, 1, 1, 1,
-2.037305, -0.3797932, -2.051096, 1, 1, 1, 1, 1,
-2.016814, -0.8986247, -4.913717, 1, 1, 1, 1, 1,
-2.008248, -0.9679841, -2.345323, 1, 1, 1, 1, 1,
-1.998408, -0.7591128, -3.590471, 1, 1, 1, 1, 1,
-1.964218, -0.9142752, -2.029562, 1, 1, 1, 1, 1,
-1.956886, 0.1651002, -2.682056, 1, 1, 1, 1, 1,
-1.955161, 0.4019746, -1.282256, 1, 1, 1, 1, 1,
-1.95345, -0.8756568, -2.611003, 1, 1, 1, 1, 1,
-1.93943, -0.216197, -1.31112, 1, 1, 1, 1, 1,
-1.933732, 1.362732, 0.2846897, 1, 1, 1, 1, 1,
-1.925969, 2.928889, 0.2633418, 1, 1, 1, 1, 1,
-1.907356, 0.03305506, -0.9198202, 1, 1, 1, 1, 1,
-1.897394, -2.809081, -4.227611, 0, 0, 1, 1, 1,
-1.862637, 0.7153946, -1.491578, 1, 0, 0, 1, 1,
-1.847968, 1.11679, -0.8766714, 1, 0, 0, 1, 1,
-1.772656, 0.06269216, -0.5845132, 1, 0, 0, 1, 1,
-1.751681, -1.095044, -2.459607, 1, 0, 0, 1, 1,
-1.751542, 0.1316363, -0.5031101, 1, 0, 0, 1, 1,
-1.740508, -0.8237575, -2.301429, 0, 0, 0, 1, 1,
-1.729952, 0.3376108, -2.427748, 0, 0, 0, 1, 1,
-1.705463, -0.3341073, -3.699713, 0, 0, 0, 1, 1,
-1.698059, 0.4840485, -0.1682674, 0, 0, 0, 1, 1,
-1.693875, 1.649519, 2.185257, 0, 0, 0, 1, 1,
-1.692936, -2.551838, -4.717952, 0, 0, 0, 1, 1,
-1.67572, -2.5779, -2.141799, 0, 0, 0, 1, 1,
-1.670464, 0.6733292, 0.1818021, 1, 1, 1, 1, 1,
-1.669481, -2.97955, -4.485955, 1, 1, 1, 1, 1,
-1.645429, -1.448901, -3.244464, 1, 1, 1, 1, 1,
-1.643119, 1.037271, -0.2833405, 1, 1, 1, 1, 1,
-1.633289, 0.05576098, -0.8412347, 1, 1, 1, 1, 1,
-1.625457, -0.2912532, -1.448555, 1, 1, 1, 1, 1,
-1.614585, -0.4346001, -0.4829566, 1, 1, 1, 1, 1,
-1.555988, -0.3365505, -1.248523, 1, 1, 1, 1, 1,
-1.555008, -0.3926265, -2.503144, 1, 1, 1, 1, 1,
-1.545325, 1.200928, -0.6258418, 1, 1, 1, 1, 1,
-1.528868, 0.6548051, -0.09775959, 1, 1, 1, 1, 1,
-1.527465, 0.7695575, -0.5252006, 1, 1, 1, 1, 1,
-1.519961, -0.314073, -1.320829, 1, 1, 1, 1, 1,
-1.518302, 0.3357702, -1.29844, 1, 1, 1, 1, 1,
-1.503614, 0.1552445, -2.525261, 1, 1, 1, 1, 1,
-1.470506, -0.5396442, -3.406393, 0, 0, 1, 1, 1,
-1.462109, -0.978404, -1.176807, 1, 0, 0, 1, 1,
-1.460778, -0.7599266, -3.046268, 1, 0, 0, 1, 1,
-1.459362, -1.884317, -2.227242, 1, 0, 0, 1, 1,
-1.456331, -0.3931766, -3.331935, 1, 0, 0, 1, 1,
-1.452959, 0.2748418, 0.9209419, 1, 0, 0, 1, 1,
-1.452639, 0.3964134, -1.567488, 0, 0, 0, 1, 1,
-1.447979, -0.3895751, -3.351698, 0, 0, 0, 1, 1,
-1.442761, 0.3043909, -0.7411038, 0, 0, 0, 1, 1,
-1.433504, -0.9323893, -0.9955538, 0, 0, 0, 1, 1,
-1.433286, -0.30193, -2.731074, 0, 0, 0, 1, 1,
-1.424496, 1.685999, 0.2563505, 0, 0, 0, 1, 1,
-1.419878, -0.557546, -0.2403937, 0, 0, 0, 1, 1,
-1.405357, 0.02951533, -2.658394, 1, 1, 1, 1, 1,
-1.384759, -0.7360523, -2.421351, 1, 1, 1, 1, 1,
-1.363456, -1.412737, -2.179356, 1, 1, 1, 1, 1,
-1.361366, 1.548902, 0.1686335, 1, 1, 1, 1, 1,
-1.354942, 0.1382177, -1.299168, 1, 1, 1, 1, 1,
-1.337617, 1.442134, 0.2821053, 1, 1, 1, 1, 1,
-1.327564, 0.4008732, -1.281617, 1, 1, 1, 1, 1,
-1.325943, -0.2304233, -1.470717, 1, 1, 1, 1, 1,
-1.314768, -0.1869058, -1.323594, 1, 1, 1, 1, 1,
-1.306943, 0.0256692, -1.360926, 1, 1, 1, 1, 1,
-1.297004, -0.1519097, -1.95651, 1, 1, 1, 1, 1,
-1.265745, 0.3650104, -0.7578181, 1, 1, 1, 1, 1,
-1.254875, -1.094992, -3.971822, 1, 1, 1, 1, 1,
-1.244902, 0.03382131, -2.191661, 1, 1, 1, 1, 1,
-1.242192, -1.049453, -2.48744, 1, 1, 1, 1, 1,
-1.235938, -0.2884549, -2.918798, 0, 0, 1, 1, 1,
-1.234512, 0.05808369, -1.800047, 1, 0, 0, 1, 1,
-1.233364, -0.5419657, -2.176483, 1, 0, 0, 1, 1,
-1.23149, -0.2075868, -1.45199, 1, 0, 0, 1, 1,
-1.231001, 0.02754556, -0.9375904, 1, 0, 0, 1, 1,
-1.230414, 0.6954458, -0.9047022, 1, 0, 0, 1, 1,
-1.226354, 1.642184, 0.6413339, 0, 0, 0, 1, 1,
-1.220176, 0.1678286, -2.348066, 0, 0, 0, 1, 1,
-1.217101, -0.2222596, -1.555223, 0, 0, 0, 1, 1,
-1.216342, 0.09974325, -0.9390346, 0, 0, 0, 1, 1,
-1.199792, 1.72736, -2.120173, 0, 0, 0, 1, 1,
-1.198006, -1.177791, -1.707719, 0, 0, 0, 1, 1,
-1.19534, -0.7532707, -3.014933, 0, 0, 0, 1, 1,
-1.194709, -1.489172, -2.83504, 1, 1, 1, 1, 1,
-1.189075, 0.5699708, -2.167243, 1, 1, 1, 1, 1,
-1.183719, 0.662773, -0.8145503, 1, 1, 1, 1, 1,
-1.182361, 0.6161942, -0.92015, 1, 1, 1, 1, 1,
-1.180625, 0.2306723, -2.355896, 1, 1, 1, 1, 1,
-1.179736, 1.086524, -1.454303, 1, 1, 1, 1, 1,
-1.177785, 2.338899, 1.183687, 1, 1, 1, 1, 1,
-1.175541, -0.395398, -2.271144, 1, 1, 1, 1, 1,
-1.17258, -1.614856, -1.629394, 1, 1, 1, 1, 1,
-1.171785, 0.6690473, -3.166102, 1, 1, 1, 1, 1,
-1.164818, -0.2171788, -1.832942, 1, 1, 1, 1, 1,
-1.163163, -0.5326793, -1.176114, 1, 1, 1, 1, 1,
-1.161957, -1.419543, -2.06478, 1, 1, 1, 1, 1,
-1.161712, -0.237122, -0.5999951, 1, 1, 1, 1, 1,
-1.150756, -0.9772675, -1.512647, 1, 1, 1, 1, 1,
-1.150656, -0.04065467, -2.933452, 0, 0, 1, 1, 1,
-1.14109, -2.028096, -2.92326, 1, 0, 0, 1, 1,
-1.140979, -0.4687446, -1.550309, 1, 0, 0, 1, 1,
-1.130725, -0.3662868, -2.965124, 1, 0, 0, 1, 1,
-1.12514, -0.3069501, -0.579518, 1, 0, 0, 1, 1,
-1.116895, 0.8299774, -1.960619, 1, 0, 0, 1, 1,
-1.114701, 0.5931246, -2.857026, 0, 0, 0, 1, 1,
-1.108556, 0.2209935, 0.7864637, 0, 0, 0, 1, 1,
-1.107686, -0.196351, -1.725279, 0, 0, 0, 1, 1,
-1.100632, 0.9469156, -0.5234662, 0, 0, 0, 1, 1,
-1.098751, -0.6196959, -3.318394, 0, 0, 0, 1, 1,
-1.089457, -1.255946, -1.628491, 0, 0, 0, 1, 1,
-1.089374, 1.023595, -0.04811664, 0, 0, 0, 1, 1,
-1.089093, 0.02312265, -0.6385848, 1, 1, 1, 1, 1,
-1.088658, -0.1195545, -1.077769, 1, 1, 1, 1, 1,
-1.078671, -0.1686697, -2.365725, 1, 1, 1, 1, 1,
-1.078428, 1.41586, -1.434069, 1, 1, 1, 1, 1,
-1.076571, -0.522393, -3.007204, 1, 1, 1, 1, 1,
-1.073747, 0.63377, -0.4884615, 1, 1, 1, 1, 1,
-1.061337, 0.8881874, -3.037142, 1, 1, 1, 1, 1,
-1.058493, 0.4427639, -1.505924, 1, 1, 1, 1, 1,
-1.057673, -1.336575, -1.381709, 1, 1, 1, 1, 1,
-1.056292, 0.4251063, -1.415419, 1, 1, 1, 1, 1,
-1.055886, 0.9345386, -0.551324, 1, 1, 1, 1, 1,
-1.043477, -2.074753, -2.668445, 1, 1, 1, 1, 1,
-1.039771, 0.1236357, -2.406379, 1, 1, 1, 1, 1,
-1.036951, 1.013753, -1.347665, 1, 1, 1, 1, 1,
-1.036279, 0.9091657, -0.8798352, 1, 1, 1, 1, 1,
-1.034125, -0.1373988, -1.475908, 0, 0, 1, 1, 1,
-1.033843, 0.1490742, -3.056981, 1, 0, 0, 1, 1,
-1.032168, -1.306993, -3.875435, 1, 0, 0, 1, 1,
-1.032071, 0.831701, -1.316866, 1, 0, 0, 1, 1,
-1.030343, 0.9466159, -2.370976, 1, 0, 0, 1, 1,
-1.026941, -0.8259445, -1.696849, 1, 0, 0, 1, 1,
-1.024328, 2.079521, -1.027041, 0, 0, 0, 1, 1,
-1.015105, 2.020494, -1.953077, 0, 0, 0, 1, 1,
-1.009303, 0.7189138, 0.7931949, 0, 0, 0, 1, 1,
-1.00447, 0.1803027, -2.303913, 0, 0, 0, 1, 1,
-1.002787, -0.3627366, -2.75464, 0, 0, 0, 1, 1,
-1.002215, 0.8125481, -1.145327, 0, 0, 0, 1, 1,
-1.002134, -0.8710809, -4.46069, 0, 0, 0, 1, 1,
-1.001083, 0.2359654, -0.7736323, 1, 1, 1, 1, 1,
-0.9997284, -2.089882, -2.478231, 1, 1, 1, 1, 1,
-0.9969147, 1.20787, -0.3057758, 1, 1, 1, 1, 1,
-0.9960756, 0.02798005, -1.071941, 1, 1, 1, 1, 1,
-0.9940615, -0.9264145, -0.89736, 1, 1, 1, 1, 1,
-0.9881496, 0.5724204, 0.09805039, 1, 1, 1, 1, 1,
-0.9858496, 0.59522, -0.2100135, 1, 1, 1, 1, 1,
-0.9717242, 0.03211487, -2.061977, 1, 1, 1, 1, 1,
-0.9693972, -1.337024, -3.373948, 1, 1, 1, 1, 1,
-0.9674307, 1.51883, -1.577835, 1, 1, 1, 1, 1,
-0.9638602, -0.6632611, -2.370581, 1, 1, 1, 1, 1,
-0.9631346, -0.2739131, -2.922307, 1, 1, 1, 1, 1,
-0.9592646, 0.4212897, -1.838637, 1, 1, 1, 1, 1,
-0.95793, -0.06491605, -0.1085047, 1, 1, 1, 1, 1,
-0.9573935, 1.306176, -1.906245, 1, 1, 1, 1, 1,
-0.9572638, -1.018727, -2.633998, 0, 0, 1, 1, 1,
-0.9542346, -0.2262432, -1.124286, 1, 0, 0, 1, 1,
-0.9529221, 0.3074834, -1.026868, 1, 0, 0, 1, 1,
-0.9497359, 1.113923, 0.9512997, 1, 0, 0, 1, 1,
-0.9440904, -1.313106, -4.20931, 1, 0, 0, 1, 1,
-0.9353055, 0.2491703, 1.058688, 1, 0, 0, 1, 1,
-0.9296374, -0.4464945, -1.712825, 0, 0, 0, 1, 1,
-0.9291118, 0.7104443, -0.8155209, 0, 0, 0, 1, 1,
-0.9285808, 0.09263229, 0.1999015, 0, 0, 0, 1, 1,
-0.9266391, -1.30704, -3.947235, 0, 0, 0, 1, 1,
-0.9226801, -0.7570498, -2.70862, 0, 0, 0, 1, 1,
-0.9212733, 1.283623, -0.1690889, 0, 0, 0, 1, 1,
-0.9123475, 0.4697649, 0.5460553, 0, 0, 0, 1, 1,
-0.9040738, -2.107345, -2.859611, 1, 1, 1, 1, 1,
-0.9006609, 0.003463306, -2.057046, 1, 1, 1, 1, 1,
-0.9003035, 0.2607784, 0.6536341, 1, 1, 1, 1, 1,
-0.8987437, 1.113151, 0.9903181, 1, 1, 1, 1, 1,
-0.8970784, 0.2528909, -0.7032487, 1, 1, 1, 1, 1,
-0.8968326, 0.3724347, 1.116006, 1, 1, 1, 1, 1,
-0.8922195, -0.4085857, -2.681968, 1, 1, 1, 1, 1,
-0.8880401, -1.888896, -3.714476, 1, 1, 1, 1, 1,
-0.8873113, 2.359212, -0.3490753, 1, 1, 1, 1, 1,
-0.8831964, 0.5223319, -2.101851, 1, 1, 1, 1, 1,
-0.8828069, 0.283812, -1.872423, 1, 1, 1, 1, 1,
-0.8784307, -0.7543033, -3.446464, 1, 1, 1, 1, 1,
-0.8744085, -0.6236458, -2.965599, 1, 1, 1, 1, 1,
-0.871914, 0.03155354, -2.307022, 1, 1, 1, 1, 1,
-0.8712634, 1.978277, -0.6664905, 1, 1, 1, 1, 1,
-0.857359, 0.3951742, -1.704376, 0, 0, 1, 1, 1,
-0.8527991, 0.5078625, -1.401389, 1, 0, 0, 1, 1,
-0.8509146, 0.9270089, -1.534659, 1, 0, 0, 1, 1,
-0.8404554, 0.3187406, -2.730865, 1, 0, 0, 1, 1,
-0.8393767, -0.3659009, -1.05074, 1, 0, 0, 1, 1,
-0.8379743, 1.771138, -2.082683, 1, 0, 0, 1, 1,
-0.8341219, 0.4539975, -2.012208, 0, 0, 0, 1, 1,
-0.8268432, 1.122351, -1.762775, 0, 0, 0, 1, 1,
-0.8226963, 0.6105477, -0.9513733, 0, 0, 0, 1, 1,
-0.8178814, -0.001187008, -0.5656483, 0, 0, 0, 1, 1,
-0.8134973, 1.218524, -1.495876, 0, 0, 0, 1, 1,
-0.8109585, 0.6429801, -1.230969, 0, 0, 0, 1, 1,
-0.8095951, -1.917191, -3.243654, 0, 0, 0, 1, 1,
-0.7976092, -0.2387533, -2.76984, 1, 1, 1, 1, 1,
-0.792835, 1.126968, -3.077453, 1, 1, 1, 1, 1,
-0.7864689, 0.263294, -0.9216983, 1, 1, 1, 1, 1,
-0.7859799, -0.9595227, -3.75673, 1, 1, 1, 1, 1,
-0.7838778, -1.546586, -1.756356, 1, 1, 1, 1, 1,
-0.7827144, -0.2240106, -3.037629, 1, 1, 1, 1, 1,
-0.7749951, -2.08829, -0.779752, 1, 1, 1, 1, 1,
-0.7715103, -0.3274494, -2.7939, 1, 1, 1, 1, 1,
-0.7672198, 0.4310542, 0.2324143, 1, 1, 1, 1, 1,
-0.7624336, -0.06310385, -1.367547, 1, 1, 1, 1, 1,
-0.7617081, 0.4966368, -0.04200028, 1, 1, 1, 1, 1,
-0.7599251, -0.3054086, -2.106256, 1, 1, 1, 1, 1,
-0.7556596, -1.337722, -2.537966, 1, 1, 1, 1, 1,
-0.7547616, 0.4278976, -1.022164, 1, 1, 1, 1, 1,
-0.7453043, 0.1115657, -1.684307, 1, 1, 1, 1, 1,
-0.743661, -0.4490187, -3.62797, 0, 0, 1, 1, 1,
-0.7421897, 0.3218272, -2.061484, 1, 0, 0, 1, 1,
-0.7307233, 0.8866693, -0.3995138, 1, 0, 0, 1, 1,
-0.7230573, -0.3519329, -2.225284, 1, 0, 0, 1, 1,
-0.7205947, -1.075225, -2.646754, 1, 0, 0, 1, 1,
-0.7202709, 0.9174887, -0.2239203, 1, 0, 0, 1, 1,
-0.7198901, 1.098594, -2.145314, 0, 0, 0, 1, 1,
-0.7181661, 0.4197966, 0.8596398, 0, 0, 0, 1, 1,
-0.7162718, -0.5484899, -1.523184, 0, 0, 0, 1, 1,
-0.7156159, 0.5259734, -2.055916, 0, 0, 0, 1, 1,
-0.7142538, -1.479471, -1.582015, 0, 0, 0, 1, 1,
-0.7116267, 2.136145, -0.9587149, 0, 0, 0, 1, 1,
-0.7114271, -1.332761, -1.90364, 0, 0, 0, 1, 1,
-0.7105593, -1.348474, -0.05852257, 1, 1, 1, 1, 1,
-0.7056904, -1.264382, -2.162474, 1, 1, 1, 1, 1,
-0.6975772, 1.122666, -1.863349, 1, 1, 1, 1, 1,
-0.6968694, -1.125032, -0.6715764, 1, 1, 1, 1, 1,
-0.6950207, 0.1339845, -1.324911, 1, 1, 1, 1, 1,
-0.694665, -0.2555582, -2.206602, 1, 1, 1, 1, 1,
-0.6940457, 0.7610863, -1.896017, 1, 1, 1, 1, 1,
-0.6934836, -1.17343, -2.712849, 1, 1, 1, 1, 1,
-0.6919451, -0.8385627, -4.240892, 1, 1, 1, 1, 1,
-0.6904888, -0.6663334, -1.197881, 1, 1, 1, 1, 1,
-0.6899484, -0.08280582, -1.676615, 1, 1, 1, 1, 1,
-0.6894603, -1.008196, -2.207404, 1, 1, 1, 1, 1,
-0.6880574, 0.6025445, -2.044946, 1, 1, 1, 1, 1,
-0.6845867, 0.3167813, -0.2660719, 1, 1, 1, 1, 1,
-0.6845798, 2.285056, -1.239321, 1, 1, 1, 1, 1,
-0.6844652, 1.047452, -1.142559, 0, 0, 1, 1, 1,
-0.6811063, 0.1831534, -2.201727, 1, 0, 0, 1, 1,
-0.6794725, 0.6887393, -1.489359, 1, 0, 0, 1, 1,
-0.6671937, -0.2168613, -1.623029, 1, 0, 0, 1, 1,
-0.6630317, -0.07414046, -0.3485182, 1, 0, 0, 1, 1,
-0.6608855, 2.094842, -2.18343, 1, 0, 0, 1, 1,
-0.6579177, -0.3201048, -2.44999, 0, 0, 0, 1, 1,
-0.6574204, 0.340856, -1.798328, 0, 0, 0, 1, 1,
-0.6559945, -0.4505331, -1.97003, 0, 0, 0, 1, 1,
-0.650786, -0.7784911, -1.273228, 0, 0, 0, 1, 1,
-0.6496484, -1.660167, -3.187817, 0, 0, 0, 1, 1,
-0.6489425, 1.124123, -1.186095, 0, 0, 0, 1, 1,
-0.6460118, 0.6270877, -1.933922, 0, 0, 0, 1, 1,
-0.6458823, 1.14404, 2.107709, 1, 1, 1, 1, 1,
-0.6453012, -0.0005628987, -0.5580343, 1, 1, 1, 1, 1,
-0.6400388, -1.07102, -3.30374, 1, 1, 1, 1, 1,
-0.6359082, 0.2315319, -1.408058, 1, 1, 1, 1, 1,
-0.6339556, -0.02746714, -3.145971, 1, 1, 1, 1, 1,
-0.6334724, -1.851045, -1.354362, 1, 1, 1, 1, 1,
-0.6247477, 0.3267044, -0.5820205, 1, 1, 1, 1, 1,
-0.6247145, -0.2622897, -1.589826, 1, 1, 1, 1, 1,
-0.6243212, 0.9522078, 1.426583, 1, 1, 1, 1, 1,
-0.6223693, 0.1809884, -1.631256, 1, 1, 1, 1, 1,
-0.6215261, 0.6977164, -0.240201, 1, 1, 1, 1, 1,
-0.6193594, -0.8214003, -3.693564, 1, 1, 1, 1, 1,
-0.6189795, -0.3722032, -2.676443, 1, 1, 1, 1, 1,
-0.6167606, 0.8766354, -1.557819, 1, 1, 1, 1, 1,
-0.6083809, 0.42525, -1.263128, 1, 1, 1, 1, 1,
-0.6068003, -0.2206014, -2.656198, 0, 0, 1, 1, 1,
-0.6054962, -1.444578, -3.659286, 1, 0, 0, 1, 1,
-0.5999431, -0.9786674, -1.472129, 1, 0, 0, 1, 1,
-0.5995232, -0.2340777, -2.193118, 1, 0, 0, 1, 1,
-0.5980142, -0.8663793, -2.772207, 1, 0, 0, 1, 1,
-0.5976737, -0.8671489, -3.053773, 1, 0, 0, 1, 1,
-0.5947989, 0.8973638, -1.68458, 0, 0, 0, 1, 1,
-0.5939425, -0.3595593, -3.678491, 0, 0, 0, 1, 1,
-0.5899172, 0.05481168, -1.90015, 0, 0, 0, 1, 1,
-0.5848245, -1.848982, -4.012665, 0, 0, 0, 1, 1,
-0.5836632, 1.800029, 0.5439508, 0, 0, 0, 1, 1,
-0.5824472, 0.8685849, -1.520422, 0, 0, 0, 1, 1,
-0.5822047, -0.07746185, -3.733188, 0, 0, 0, 1, 1,
-0.5812014, -0.4243211, -1.962042, 1, 1, 1, 1, 1,
-0.5801556, -0.7044424, -2.056466, 1, 1, 1, 1, 1,
-0.5784939, -0.9622152, -1.834679, 1, 1, 1, 1, 1,
-0.5747014, -1.526409, -0.9900344, 1, 1, 1, 1, 1,
-0.5683969, -1.021758, -1.220222, 1, 1, 1, 1, 1,
-0.5671129, -0.8838134, -2.121018, 1, 1, 1, 1, 1,
-0.5669026, 1.399168, -0.05272283, 1, 1, 1, 1, 1,
-0.5658689, 1.356337, -0.6429852, 1, 1, 1, 1, 1,
-0.5654997, 0.3588827, 1.12708, 1, 1, 1, 1, 1,
-0.5596831, 0.2157322, -3.115674, 1, 1, 1, 1, 1,
-0.5567072, -0.4681919, -1.244188, 1, 1, 1, 1, 1,
-0.552208, 0.8841429, -3.842656, 1, 1, 1, 1, 1,
-0.5479164, -0.6410753, -1.727445, 1, 1, 1, 1, 1,
-0.5477593, 0.3828913, -0.08427587, 1, 1, 1, 1, 1,
-0.5462894, 1.546803, -1.186996, 1, 1, 1, 1, 1,
-0.5460721, 0.3042705, -0.9683591, 0, 0, 1, 1, 1,
-0.5455496, 2.736664, -1.044003, 1, 0, 0, 1, 1,
-0.5437106, -1.474968, -2.945673, 1, 0, 0, 1, 1,
-0.5433356, 0.7323672, -0.9570946, 1, 0, 0, 1, 1,
-0.5413948, -0.6418619, -2.312566, 1, 0, 0, 1, 1,
-0.5379751, -0.8394166, -2.12233, 1, 0, 0, 1, 1,
-0.5370855, -0.5142968, -2.073239, 0, 0, 0, 1, 1,
-0.5342504, -0.7576796, -4.342245, 0, 0, 0, 1, 1,
-0.5329148, -0.09508643, -1.257985, 0, 0, 0, 1, 1,
-0.5317358, -1.932479, -2.875241, 0, 0, 0, 1, 1,
-0.5291097, 1.716689, -0.07361709, 0, 0, 0, 1, 1,
-0.5290579, 1.586731, 1.014368, 0, 0, 0, 1, 1,
-0.5287728, 0.2746363, -0.9916078, 0, 0, 0, 1, 1,
-0.5242409, 0.5932295, -0.1212528, 1, 1, 1, 1, 1,
-0.518829, -1.505337, -1.87895, 1, 1, 1, 1, 1,
-0.5166497, -0.9630632, -1.153418, 1, 1, 1, 1, 1,
-0.5153505, 0.2719619, -2.27704, 1, 1, 1, 1, 1,
-0.51493, 0.1344261, -1.604587, 1, 1, 1, 1, 1,
-0.512751, 0.4446836, -1.914444, 1, 1, 1, 1, 1,
-0.5114989, 0.3648426, -3.563678, 1, 1, 1, 1, 1,
-0.5113666, -0.07735001, -3.327819, 1, 1, 1, 1, 1,
-0.5105884, 1.106637, -2.382113, 1, 1, 1, 1, 1,
-0.5094555, -2.898097, -2.705752, 1, 1, 1, 1, 1,
-0.508798, -0.7517132, -0.7106056, 1, 1, 1, 1, 1,
-0.505107, -2.078987, -0.5363646, 1, 1, 1, 1, 1,
-0.5046575, 0.61648, -1.093246, 1, 1, 1, 1, 1,
-0.5017903, 0.135562, -1.96043, 1, 1, 1, 1, 1,
-0.4872989, 1.076679, -0.9219559, 1, 1, 1, 1, 1,
-0.4845853, -1.201261, -2.990819, 0, 0, 1, 1, 1,
-0.4842186, -0.4167218, -2.527576, 1, 0, 0, 1, 1,
-0.483781, -0.4783937, -2.218242, 1, 0, 0, 1, 1,
-0.4825991, 0.7416849, -1.050818, 1, 0, 0, 1, 1,
-0.4774992, 1.590773, -0.5878732, 1, 0, 0, 1, 1,
-0.4750933, 0.4522976, -0.5745226, 1, 0, 0, 1, 1,
-0.4686724, -0.04310115, -1.634505, 0, 0, 0, 1, 1,
-0.4679319, 0.457271, -0.9129605, 0, 0, 0, 1, 1,
-0.4672934, -0.5972183, -3.259246, 0, 0, 0, 1, 1,
-0.4554894, -0.03281222, -1.299147, 0, 0, 0, 1, 1,
-0.4539596, -0.9959232, -3.753565, 0, 0, 0, 1, 1,
-0.4501228, -0.2049508, -0.5982388, 0, 0, 0, 1, 1,
-0.4442026, 0.247269, -0.5904132, 0, 0, 0, 1, 1,
-0.4429083, 1.234705, -0.5605751, 1, 1, 1, 1, 1,
-0.4359483, -0.3303275, -4.061798, 1, 1, 1, 1, 1,
-0.4294069, -0.4307928, -2.937723, 1, 1, 1, 1, 1,
-0.4281362, -0.9197816, -2.936256, 1, 1, 1, 1, 1,
-0.423655, -1.111499, -2.178773, 1, 1, 1, 1, 1,
-0.4216475, 0.6041189, 0.356044, 1, 1, 1, 1, 1,
-0.4180961, -0.9966998, -2.073849, 1, 1, 1, 1, 1,
-0.4166192, 1.302876, 0.1524622, 1, 1, 1, 1, 1,
-0.40778, -0.9033275, -4.041892, 1, 1, 1, 1, 1,
-0.4074992, 1.824824, 1.436017, 1, 1, 1, 1, 1,
-0.4023985, -0.1545538, -1.453472, 1, 1, 1, 1, 1,
-0.3998878, -0.9253002, -2.884428, 1, 1, 1, 1, 1,
-0.3976211, -2.575244, -4.710087, 1, 1, 1, 1, 1,
-0.3950857, -1.556332, -3.768357, 1, 1, 1, 1, 1,
-0.3920387, -1.303925, -3.619067, 1, 1, 1, 1, 1,
-0.3886003, -1.083081, -1.768364, 0, 0, 1, 1, 1,
-0.3870874, -1.040466, -4.089056, 1, 0, 0, 1, 1,
-0.3861432, 0.3410713, -1.754596, 1, 0, 0, 1, 1,
-0.3853221, 0.3631712, -0.841935, 1, 0, 0, 1, 1,
-0.3837464, 1.438642, 1.06604, 1, 0, 0, 1, 1,
-0.3797921, -0.2106618, -3.057018, 1, 0, 0, 1, 1,
-0.3795751, -0.3957994, -2.743011, 0, 0, 0, 1, 1,
-0.3795551, -0.6715455, -3.781445, 0, 0, 0, 1, 1,
-0.371373, 0.4476232, -1.580077, 0, 0, 0, 1, 1,
-0.3705146, -0.8451187, -3.367639, 0, 0, 0, 1, 1,
-0.3680423, -0.7398214, -2.761415, 0, 0, 0, 1, 1,
-0.3644557, 0.107191, -0.6095832, 0, 0, 0, 1, 1,
-0.3589687, -1.074116, -3.712891, 0, 0, 0, 1, 1,
-0.3584246, 0.3947804, -0.6229294, 1, 1, 1, 1, 1,
-0.3545108, -0.4122304, -3.014066, 1, 1, 1, 1, 1,
-0.3511935, 1.134591, 0.4188432, 1, 1, 1, 1, 1,
-0.3508262, -0.2292778, -1.847189, 1, 1, 1, 1, 1,
-0.3497478, -1.684484, -2.185176, 1, 1, 1, 1, 1,
-0.3490566, -0.4967773, -2.999776, 1, 1, 1, 1, 1,
-0.3488453, -0.02096197, -1.50026, 1, 1, 1, 1, 1,
-0.347308, 0.1768365, -1.829867, 1, 1, 1, 1, 1,
-0.3458234, 0.4757017, -1.152034, 1, 1, 1, 1, 1,
-0.3400682, 0.9795456, -0.5607462, 1, 1, 1, 1, 1,
-0.3386569, -0.458095, -2.595999, 1, 1, 1, 1, 1,
-0.3348699, -0.5756596, -2.906379, 1, 1, 1, 1, 1,
-0.3293249, 0.02926713, 0.1003704, 1, 1, 1, 1, 1,
-0.3168328, -0.6945379, -2.405735, 1, 1, 1, 1, 1,
-0.3164539, 1.137149, 0.3454078, 1, 1, 1, 1, 1,
-0.3113632, -0.661818, -2.326094, 0, 0, 1, 1, 1,
-0.3094256, 1.123242, -0.5716653, 1, 0, 0, 1, 1,
-0.2962631, 0.8323324, -0.311493, 1, 0, 0, 1, 1,
-0.2868799, -0.3097653, -2.115852, 1, 0, 0, 1, 1,
-0.2867495, 1.85348, -0.7969264, 1, 0, 0, 1, 1,
-0.285827, 0.8774975, 0.7629135, 1, 0, 0, 1, 1,
-0.2851163, 1.236309, -0.7269961, 0, 0, 0, 1, 1,
-0.2848378, 0.8163217, 0.9357215, 0, 0, 0, 1, 1,
-0.283652, 0.5528641, 0.4234323, 0, 0, 0, 1, 1,
-0.2804264, 2.031343, -2.147702, 0, 0, 0, 1, 1,
-0.2798005, -0.1560151, -4.149532, 0, 0, 0, 1, 1,
-0.2764774, 0.9418544, -0.01457924, 0, 0, 0, 1, 1,
-0.2743199, 0.01489796, -1.86653, 0, 0, 0, 1, 1,
-0.2727189, -1.588899, -4.772495, 1, 1, 1, 1, 1,
-0.2642298, 0.6728621, -0.9234684, 1, 1, 1, 1, 1,
-0.2601642, -0.6848342, -3.337929, 1, 1, 1, 1, 1,
-0.2579829, 1.109776, -0.7681715, 1, 1, 1, 1, 1,
-0.2575814, -0.2687953, -3.143454, 1, 1, 1, 1, 1,
-0.2554898, 0.09176939, -4.59376, 1, 1, 1, 1, 1,
-0.2482097, -0.7516769, -4.734066, 1, 1, 1, 1, 1,
-0.2450529, -2.040331, -3.56676, 1, 1, 1, 1, 1,
-0.2446906, -1.036111, -1.695211, 1, 1, 1, 1, 1,
-0.2428001, 0.445395, 0.4537598, 1, 1, 1, 1, 1,
-0.240627, -1.075899, -2.345592, 1, 1, 1, 1, 1,
-0.2388281, 0.4679021, -0.1064361, 1, 1, 1, 1, 1,
-0.2380538, 1.027538, 0.6004738, 1, 1, 1, 1, 1,
-0.2255024, -0.5327682, -2.20066, 1, 1, 1, 1, 1,
-0.223733, 0.01657, -1.877915, 1, 1, 1, 1, 1,
-0.2229136, -1.27268, -3.984457, 0, 0, 1, 1, 1,
-0.2160515, 0.8908179, 0.4475441, 1, 0, 0, 1, 1,
-0.2097114, 0.4247538, -0.2901911, 1, 0, 0, 1, 1,
-0.2090499, 1.142969, 0.367734, 1, 0, 0, 1, 1,
-0.2077608, 0.1749323, -0.1757119, 1, 0, 0, 1, 1,
-0.2073023, 0.4302308, 1.544404, 1, 0, 0, 1, 1,
-0.2069017, 0.514613, -1.566602, 0, 0, 0, 1, 1,
-0.2057369, -1.77857, -2.883853, 0, 0, 0, 1, 1,
-0.2047181, 0.02687958, -2.401242, 0, 0, 0, 1, 1,
-0.2042944, 0.8538342, 0.4828408, 0, 0, 0, 1, 1,
-0.2031519, 1.75973, -0.6212561, 0, 0, 0, 1, 1,
-0.2005887, 0.10363, -1.59126, 0, 0, 0, 1, 1,
-0.200047, -0.7384583, -3.097188, 0, 0, 0, 1, 1,
-0.1944304, 0.4582894, 0.9156145, 1, 1, 1, 1, 1,
-0.1924038, -0.07851478, -1.779655, 1, 1, 1, 1, 1,
-0.1893532, -0.7980552, -3.774018, 1, 1, 1, 1, 1,
-0.1865724, -0.1466143, -0.4421511, 1, 1, 1, 1, 1,
-0.1836002, -0.966696, -1.923717, 1, 1, 1, 1, 1,
-0.1821732, -0.4989819, -1.397943, 1, 1, 1, 1, 1,
-0.1794365, 0.6998197, -1.561952, 1, 1, 1, 1, 1,
-0.1755984, 0.3611911, -0.8058861, 1, 1, 1, 1, 1,
-0.1730873, 0.6296733, 0.03088471, 1, 1, 1, 1, 1,
-0.1728497, 1.621028, -0.8272893, 1, 1, 1, 1, 1,
-0.1676483, 1.10417, -0.2082037, 1, 1, 1, 1, 1,
-0.1650981, 0.9861773, -0.6915745, 1, 1, 1, 1, 1,
-0.1632499, -0.8677058, -2.996045, 1, 1, 1, 1, 1,
-0.1601735, 0.723865, 0.01985718, 1, 1, 1, 1, 1,
-0.1584468, -2.202144, -3.498932, 1, 1, 1, 1, 1,
-0.1577783, -1.773986, -1.863273, 0, 0, 1, 1, 1,
-0.1575483, 0.9396597, -1.019978, 1, 0, 0, 1, 1,
-0.1575192, -0.2823087, -1.219355, 1, 0, 0, 1, 1,
-0.1554262, -0.3392268, -2.746555, 1, 0, 0, 1, 1,
-0.155145, 0.009636729, -0.9766268, 1, 0, 0, 1, 1,
-0.154928, -0.3581195, -3.611612, 1, 0, 0, 1, 1,
-0.1534536, 0.4007621, -0.5931165, 0, 0, 0, 1, 1,
-0.1532889, -0.7733532, -2.840686, 0, 0, 0, 1, 1,
-0.1520634, 0.7721243, 1.576256, 0, 0, 0, 1, 1,
-0.1507339, 0.5841134, 0.4631289, 0, 0, 0, 1, 1,
-0.1475264, 0.04687702, -0.6550714, 0, 0, 0, 1, 1,
-0.1458875, -1.285617, -3.272089, 0, 0, 0, 1, 1,
-0.1412189, -0.6632503, -1.280571, 0, 0, 0, 1, 1,
-0.1377023, 0.7897551, 0.4554419, 1, 1, 1, 1, 1,
-0.1373969, -0.7155342, -1.777037, 1, 1, 1, 1, 1,
-0.1327181, -0.01569773, -0.1924695, 1, 1, 1, 1, 1,
-0.123537, -1.589866, -4.948958, 1, 1, 1, 1, 1,
-0.1230936, -0.6901867, -3.345346, 1, 1, 1, 1, 1,
-0.1229058, -0.6770492, -3.606484, 1, 1, 1, 1, 1,
-0.1210501, -1.165537, -3.547951, 1, 1, 1, 1, 1,
-0.1180863, -0.2560552, -3.038876, 1, 1, 1, 1, 1,
-0.1176137, 1.415571, 0.6589915, 1, 1, 1, 1, 1,
-0.1122008, -1.03391, -2.657405, 1, 1, 1, 1, 1,
-0.1096794, 1.918199, -0.1908991, 1, 1, 1, 1, 1,
-0.108026, 0.7120303, -0.6207693, 1, 1, 1, 1, 1,
-0.1076813, 2.128509, 1.593547, 1, 1, 1, 1, 1,
-0.107591, -0.4066708, -2.141557, 1, 1, 1, 1, 1,
-0.1064781, -1.462217, -3.456078, 1, 1, 1, 1, 1,
-0.09887141, 0.3910617, -2.115699, 0, 0, 1, 1, 1,
-0.0924778, 0.7612186, -0.3710445, 1, 0, 0, 1, 1,
-0.09092416, 0.5296299, 0.7865366, 1, 0, 0, 1, 1,
-0.0899508, -2.342635, -4.060151, 1, 0, 0, 1, 1,
-0.08586027, 0.2449121, 0.6073714, 1, 0, 0, 1, 1,
-0.08319221, 1.109822, 0.6290355, 1, 0, 0, 1, 1,
-0.08153231, 0.2141686, -2.09066, 0, 0, 0, 1, 1,
-0.08070078, -0.8698421, -2.507415, 0, 0, 0, 1, 1,
-0.07649665, -0.2680223, -4.359699, 0, 0, 0, 1, 1,
-0.06744311, 0.8184896, 1.342075, 0, 0, 0, 1, 1,
-0.06555811, 0.5904744, 0.5704189, 0, 0, 0, 1, 1,
-0.06110372, -0.7822798, -5.316317, 0, 0, 0, 1, 1,
-0.06078281, 0.60617, -0.3413879, 0, 0, 0, 1, 1,
-0.0602714, 0.8898368, -0.06688748, 1, 1, 1, 1, 1,
-0.05963582, 1.591468, -1.224523, 1, 1, 1, 1, 1,
-0.05925007, 0.3443756, -0.2679918, 1, 1, 1, 1, 1,
-0.05887733, -1.5408, -3.501009, 1, 1, 1, 1, 1,
-0.05418895, -0.2468985, -2.917563, 1, 1, 1, 1, 1,
-0.04905676, 0.3801547, -0.4866066, 1, 1, 1, 1, 1,
-0.04745823, 1.360512, -0.199139, 1, 1, 1, 1, 1,
-0.04592916, 0.4764484, -0.7144599, 1, 1, 1, 1, 1,
-0.04470149, 0.688863, -0.6863407, 1, 1, 1, 1, 1,
-0.04417207, 0.7408531, 1.078756, 1, 1, 1, 1, 1,
-0.04015892, 1.214899, 0.5649341, 1, 1, 1, 1, 1,
-0.03998788, 0.8407289, 2.225218, 1, 1, 1, 1, 1,
-0.03794954, 1.850546, 0.7941234, 1, 1, 1, 1, 1,
-0.03263339, 0.7782021, -0.02840936, 1, 1, 1, 1, 1,
-0.03219748, 1.13862, -0.09172369, 1, 1, 1, 1, 1,
-0.03140337, -0.01596115, -1.595061, 0, 0, 1, 1, 1,
-0.03067963, -1.658335, -4.16273, 1, 0, 0, 1, 1,
-0.02610227, 0.5062658, 0.9304033, 1, 0, 0, 1, 1,
-0.02193611, -1.538273, -3.035413, 1, 0, 0, 1, 1,
-0.01686472, 1.229109, -0.8483192, 1, 0, 0, 1, 1,
-0.01597656, 1.28059, -0.2156615, 1, 0, 0, 1, 1,
-0.01303572, 1.101094, -1.255186, 0, 0, 0, 1, 1,
-0.01249622, 0.8211657, 1.426876, 0, 0, 0, 1, 1,
-0.01246782, 0.4872326, 1.508436, 0, 0, 0, 1, 1,
-0.01189526, 0.5367518, 0.1649204, 0, 0, 0, 1, 1,
-0.01077345, 0.5235681, -0.471176, 0, 0, 0, 1, 1,
-0.009760432, -0.9593756, -2.466186, 0, 0, 0, 1, 1,
-0.008254169, -2.023489, -2.67617, 0, 0, 0, 1, 1,
-0.006981815, -1.040237, -4.189214, 1, 1, 1, 1, 1,
-0.00453589, 0.2387753, 1.396163, 1, 1, 1, 1, 1,
-0.00138148, -1.476824, -3.638538, 1, 1, 1, 1, 1,
-8.140408e-05, -0.7906084, -3.277356, 1, 1, 1, 1, 1,
0.004654038, -0.06432514, 2.625452, 1, 1, 1, 1, 1,
0.01040382, 0.7015737, -1.153072, 1, 1, 1, 1, 1,
0.01180374, 1.039714, 2.080678, 1, 1, 1, 1, 1,
0.0156471, -0.2442723, 2.169661, 1, 1, 1, 1, 1,
0.01883075, 1.794488, 0.03074005, 1, 1, 1, 1, 1,
0.01915605, -0.1577193, 1.688854, 1, 1, 1, 1, 1,
0.02106172, 0.798246, -0.6394981, 1, 1, 1, 1, 1,
0.02124161, 0.2595829, -1.298765, 1, 1, 1, 1, 1,
0.0216358, -0.2169054, 1.230835, 1, 1, 1, 1, 1,
0.02351403, -1.732603, 2.893698, 1, 1, 1, 1, 1,
0.02645588, -0.9194503, 4.610197, 1, 1, 1, 1, 1,
0.02879965, 0.3350213, -0.6766347, 0, 0, 1, 1, 1,
0.02945781, -0.4856232, 2.343223, 1, 0, 0, 1, 1,
0.03488785, 2.501848, 0.5884765, 1, 0, 0, 1, 1,
0.03625921, -0.6785572, 4.65705, 1, 0, 0, 1, 1,
0.03668694, 0.73844, -0.4561962, 1, 0, 0, 1, 1,
0.03758345, 0.06887769, -1.035704, 1, 0, 0, 1, 1,
0.03796362, 0.04395696, 1.937574, 0, 0, 0, 1, 1,
0.03945349, 1.508688, 0.9545974, 0, 0, 0, 1, 1,
0.04403107, 1.31239, 1.240484, 0, 0, 0, 1, 1,
0.04689315, -1.771676, 1.819318, 0, 0, 0, 1, 1,
0.05800024, 0.3575688, 0.1404409, 0, 0, 0, 1, 1,
0.05805598, 0.1230458, 0.6448008, 0, 0, 0, 1, 1,
0.05808347, -0.1678652, 4.687236, 0, 0, 0, 1, 1,
0.05899167, -0.8049843, 3.187575, 1, 1, 1, 1, 1,
0.06078599, 0.7388709, -0.6286501, 1, 1, 1, 1, 1,
0.06307313, 1.745435, -0.0944791, 1, 1, 1, 1, 1,
0.06483872, -0.7799848, 3.011106, 1, 1, 1, 1, 1,
0.0710528, -0.4321554, 1.453652, 1, 1, 1, 1, 1,
0.07334705, 2.241581, -0.832829, 1, 1, 1, 1, 1,
0.07464617, 0.07109324, 1.164178, 1, 1, 1, 1, 1,
0.07722899, -1.126559, 4.289682, 1, 1, 1, 1, 1,
0.07812805, -0.9086761, 3.615635, 1, 1, 1, 1, 1,
0.07863922, -1.367476, 2.171291, 1, 1, 1, 1, 1,
0.08284077, 0.2266971, -0.3589422, 1, 1, 1, 1, 1,
0.08455189, -0.2368237, 3.514192, 1, 1, 1, 1, 1,
0.08958865, 0.1431355, 1.477095, 1, 1, 1, 1, 1,
0.09898317, -0.3592925, 2.716388, 1, 1, 1, 1, 1,
0.1009588, 0.4805869, 0.7623749, 1, 1, 1, 1, 1,
0.1023008, 1.419159, 0.4438932, 0, 0, 1, 1, 1,
0.104052, 1.618655, 0.05010242, 1, 0, 0, 1, 1,
0.1080275, -1.101077, 3.971035, 1, 0, 0, 1, 1,
0.1095203, -0.4693548, 2.530219, 1, 0, 0, 1, 1,
0.1096015, 1.691244, -0.1771961, 1, 0, 0, 1, 1,
0.1103856, -1.567655, 3.195088, 1, 0, 0, 1, 1,
0.112355, -1.027052, 3.779274, 0, 0, 0, 1, 1,
0.1136023, 1.558597, 2.480425, 0, 0, 0, 1, 1,
0.1173982, -0.6932622, 2.570342, 0, 0, 0, 1, 1,
0.1180333, 0.7408624, -0.7777087, 0, 0, 0, 1, 1,
0.1186108, 0.1306736, -0.1782649, 0, 0, 0, 1, 1,
0.1189363, -0.7883756, 4.170171, 0, 0, 0, 1, 1,
0.1282979, 0.5121221, -1.108408, 0, 0, 0, 1, 1,
0.1286126, 1.979176, 1.478601, 1, 1, 1, 1, 1,
0.1308388, -0.229678, 3.802538, 1, 1, 1, 1, 1,
0.1325207, -0.6938172, 3.466832, 1, 1, 1, 1, 1,
0.1343427, -0.007737258, 2.267487, 1, 1, 1, 1, 1,
0.1425241, -0.728009, 1.261361, 1, 1, 1, 1, 1,
0.1449593, 0.6314813, 0.2904371, 1, 1, 1, 1, 1,
0.1453472, 0.9060524, 0.1983859, 1, 1, 1, 1, 1,
0.1492096, -0.6805773, 3.849162, 1, 1, 1, 1, 1,
0.1521454, -0.416166, 2.845635, 1, 1, 1, 1, 1,
0.153081, -1.384947, 4.763247, 1, 1, 1, 1, 1,
0.154738, -0.8948627, 1.441427, 1, 1, 1, 1, 1,
0.1580441, -1.768592, 2.85507, 1, 1, 1, 1, 1,
0.1635546, -1.6723, 2.647449, 1, 1, 1, 1, 1,
0.1698948, -0.3467822, 4.692717, 1, 1, 1, 1, 1,
0.1734962, -1.654622, 3.699114, 1, 1, 1, 1, 1,
0.1780324, 2.16476, -0.356016, 0, 0, 1, 1, 1,
0.1810915, -0.0131516, 2.221833, 1, 0, 0, 1, 1,
0.1829163, -1.309301, 2.07632, 1, 0, 0, 1, 1,
0.1839598, -2.009506, 4.42663, 1, 0, 0, 1, 1,
0.1875771, 2.312224, 0.2387508, 1, 0, 0, 1, 1,
0.1882801, 0.9365631, 1.995933, 1, 0, 0, 1, 1,
0.1900097, 0.06068217, 0.4774533, 0, 0, 0, 1, 1,
0.1903461, -2.118684, 3.816018, 0, 0, 0, 1, 1,
0.1916928, 0.7608457, 0.294395, 0, 0, 0, 1, 1,
0.1918954, -1.029354, 4.643048, 0, 0, 0, 1, 1,
0.1925347, 0.1588122, 0.9486395, 0, 0, 0, 1, 1,
0.1998818, -1.340523, 4.171439, 0, 0, 0, 1, 1,
0.2019334, 0.2840509, 0.5932395, 0, 0, 0, 1, 1,
0.2064454, 0.5086709, 0.5695298, 1, 1, 1, 1, 1,
0.2073831, -0.5270512, 3.560488, 1, 1, 1, 1, 1,
0.2086036, 0.614682, -0.2011628, 1, 1, 1, 1, 1,
0.2144409, -1.083, 2.72239, 1, 1, 1, 1, 1,
0.2181413, 0.9614105, 0.5629571, 1, 1, 1, 1, 1,
0.2189323, 0.4236563, 0.1356363, 1, 1, 1, 1, 1,
0.2218627, -0.9065431, 2.262775, 1, 1, 1, 1, 1,
0.2274881, -0.6594189, 4.249124, 1, 1, 1, 1, 1,
0.2277359, 0.3809892, 0.9697837, 1, 1, 1, 1, 1,
0.2280109, 1.245627, 1.104115, 1, 1, 1, 1, 1,
0.2290108, -2.698675, 3.268302, 1, 1, 1, 1, 1,
0.246567, -0.606768, 3.319402, 1, 1, 1, 1, 1,
0.2480784, -1.185383, 1.758974, 1, 1, 1, 1, 1,
0.2515482, 0.8375138, 1.045658, 1, 1, 1, 1, 1,
0.2572728, -0.04639546, -0.1978833, 1, 1, 1, 1, 1,
0.2573549, 2.267465, 2.350736, 0, 0, 1, 1, 1,
0.2597812, 1.865354, -1.217754, 1, 0, 0, 1, 1,
0.2650872, 0.1329498, 3.438201, 1, 0, 0, 1, 1,
0.2661939, 0.3283467, -0.5666794, 1, 0, 0, 1, 1,
0.2698876, -0.5369218, 2.459951, 1, 0, 0, 1, 1,
0.2733612, -0.7080129, 2.437295, 1, 0, 0, 1, 1,
0.278217, -0.9686229, 2.451969, 0, 0, 0, 1, 1,
0.2783488, 0.1497539, 0.5993651, 0, 0, 0, 1, 1,
0.2825295, -0.2048623, 1.210318, 0, 0, 0, 1, 1,
0.2830945, -0.2946502, 1.937475, 0, 0, 0, 1, 1,
0.2936396, -0.07593193, 1.308474, 0, 0, 0, 1, 1,
0.294309, 0.2670222, -0.7823262, 0, 0, 0, 1, 1,
0.2984073, 1.533168, -0.8615403, 0, 0, 0, 1, 1,
0.2984389, -1.721069, 1.947872, 1, 1, 1, 1, 1,
0.3027269, 0.119439, 0.6642306, 1, 1, 1, 1, 1,
0.3040441, -0.03565582, 3.239522, 1, 1, 1, 1, 1,
0.3087379, 0.4802614, 1.480989, 1, 1, 1, 1, 1,
0.3160703, 1.89435, -1.230842, 1, 1, 1, 1, 1,
0.3167101, -0.1868026, 2.585716, 1, 1, 1, 1, 1,
0.320742, 0.3588437, 1.991816, 1, 1, 1, 1, 1,
0.322911, 1.780511, 1.023137, 1, 1, 1, 1, 1,
0.3258834, -0.5128123, 2.557595, 1, 1, 1, 1, 1,
0.3268333, -2.136786, 3.170642, 1, 1, 1, 1, 1,
0.3269707, -0.9316907, 2.866834, 1, 1, 1, 1, 1,
0.3269762, 2.027098, -0.3543263, 1, 1, 1, 1, 1,
0.331317, -0.1399671, 2.278665, 1, 1, 1, 1, 1,
0.3324951, 0.7015736, 2.29622, 1, 1, 1, 1, 1,
0.3329164, 0.1895354, 1.121669, 1, 1, 1, 1, 1,
0.3331683, -0.8402061, 3.373575, 0, 0, 1, 1, 1,
0.3365703, 1.79287, -0.5407182, 1, 0, 0, 1, 1,
0.3414038, -0.5624803, 1.933488, 1, 0, 0, 1, 1,
0.3420756, -1.098537, 2.941319, 1, 0, 0, 1, 1,
0.3466148, -0.04364161, 2.63841, 1, 0, 0, 1, 1,
0.3496075, 0.452504, 1.676034, 1, 0, 0, 1, 1,
0.3571742, 1.042754, 0.9292909, 0, 0, 0, 1, 1,
0.3590593, 0.04916167, 0.0074655, 0, 0, 0, 1, 1,
0.3611641, 1.625051, -0.1894295, 0, 0, 0, 1, 1,
0.36696, 0.9310067, 0.07015437, 0, 0, 0, 1, 1,
0.36923, -1.401931, 1.0578, 0, 0, 0, 1, 1,
0.3706481, 1.477024, -1.467907, 0, 0, 0, 1, 1,
0.3722026, -0.5009784, 3.621018, 0, 0, 0, 1, 1,
0.3756729, 0.2950721, 1.144696, 1, 1, 1, 1, 1,
0.3773577, 1.01496, -0.996171, 1, 1, 1, 1, 1,
0.3794563, 0.3058933, 2.303329, 1, 1, 1, 1, 1,
0.38064, 1.847601, -1.60421, 1, 1, 1, 1, 1,
0.3852553, 2.014332, 0.3108768, 1, 1, 1, 1, 1,
0.3869618, 0.4151487, -0.6536482, 1, 1, 1, 1, 1,
0.3982085, -0.252392, 1.011948, 1, 1, 1, 1, 1,
0.4002078, 0.1378436, 1.528301, 1, 1, 1, 1, 1,
0.4008836, 0.5223424, 1.384216, 1, 1, 1, 1, 1,
0.4052669, 0.2875729, 0.474895, 1, 1, 1, 1, 1,
0.4057772, -0.178128, 2.002588, 1, 1, 1, 1, 1,
0.4104047, 0.4642243, -1.451133, 1, 1, 1, 1, 1,
0.4108582, 1.255956, 0.8461388, 1, 1, 1, 1, 1,
0.4140503, -1.923087, 3.571582, 1, 1, 1, 1, 1,
0.4155622, 1.243411, -0.2407602, 1, 1, 1, 1, 1,
0.4159102, -0.8050732, 2.307674, 0, 0, 1, 1, 1,
0.4190277, -0.4488195, 3.287915, 1, 0, 0, 1, 1,
0.4239657, -1.223635, 3.000041, 1, 0, 0, 1, 1,
0.4298319, 2.659835, 0.5433335, 1, 0, 0, 1, 1,
0.43092, 1.345096, 1.369557, 1, 0, 0, 1, 1,
0.4392799, 1.321175, 1.887806, 1, 0, 0, 1, 1,
0.4396222, 1.15479, -1.028172, 0, 0, 0, 1, 1,
0.4531092, 0.02551755, -0.4995549, 0, 0, 0, 1, 1,
0.4555268, -0.5229804, 1.901607, 0, 0, 0, 1, 1,
0.4571574, -0.1444403, 1.846659, 0, 0, 0, 1, 1,
0.4584151, 0.4893914, -0.4394525, 0, 0, 0, 1, 1,
0.4584205, -0.4069161, 2.218942, 0, 0, 0, 1, 1,
0.4604792, 0.7594787, 1.32136, 0, 0, 0, 1, 1,
0.4685276, -0.2617934, 1.435889, 1, 1, 1, 1, 1,
0.481755, 0.2267846, 1.462551, 1, 1, 1, 1, 1,
0.4837538, 0.6969218, 0.8662609, 1, 1, 1, 1, 1,
0.4855319, -1.099583, 1.59271, 1, 1, 1, 1, 1,
0.4882162, -0.6458596, 4.148656, 1, 1, 1, 1, 1,
0.4922521, -1.94336, 2.097988, 1, 1, 1, 1, 1,
0.5048361, -0.4177253, 1.269336, 1, 1, 1, 1, 1,
0.5052471, 1.235932, 0.8876008, 1, 1, 1, 1, 1,
0.5069725, 0.6023083, 0.9249439, 1, 1, 1, 1, 1,
0.5100017, 0.1412192, 4.182591, 1, 1, 1, 1, 1,
0.5117669, 0.8605928, 0.5142423, 1, 1, 1, 1, 1,
0.5121037, 0.357213, 2.194038, 1, 1, 1, 1, 1,
0.5148663, 0.3378468, -0.3542315, 1, 1, 1, 1, 1,
0.5164004, -0.2841576, 2.02635, 1, 1, 1, 1, 1,
0.5204533, -0.4066442, 2.428242, 1, 1, 1, 1, 1,
0.5250703, 0.09709413, 3.048747, 0, 0, 1, 1, 1,
0.527996, 0.008128206, 0.8722554, 1, 0, 0, 1, 1,
0.5312615, -0.1007241, 1.189909, 1, 0, 0, 1, 1,
0.5319439, 1.448461, -0.3264365, 1, 0, 0, 1, 1,
0.5345386, 1.10367, -0.6510652, 1, 0, 0, 1, 1,
0.5366177, -1.804495, 3.807648, 1, 0, 0, 1, 1,
0.5385666, 0.3749223, 0.5007025, 0, 0, 0, 1, 1,
0.5409397, -0.05643281, 1.482362, 0, 0, 0, 1, 1,
0.5413734, -0.5831635, 3.444247, 0, 0, 0, 1, 1,
0.5510304, -1.087251, 1.241585, 0, 0, 0, 1, 1,
0.5512251, -0.427277, 2.606796, 0, 0, 0, 1, 1,
0.5582703, 0.7270842, 0.6598668, 0, 0, 0, 1, 1,
0.5597955, 0.2793933, 2.011517, 0, 0, 0, 1, 1,
0.5625086, 0.125714, 2.14943, 1, 1, 1, 1, 1,
0.5662395, -1.034554, 3.18008, 1, 1, 1, 1, 1,
0.5751306, 0.7631292, 1.460003, 1, 1, 1, 1, 1,
0.5763999, -2.567845, 4.776669, 1, 1, 1, 1, 1,
0.5766752, -0.4450826, 1.195588, 1, 1, 1, 1, 1,
0.5802876, 0.2320348, -0.01264425, 1, 1, 1, 1, 1,
0.581592, 0.5018533, -0.06952062, 1, 1, 1, 1, 1,
0.5856293, -1.19757, 3.032421, 1, 1, 1, 1, 1,
0.5873939, -1.247841, 3.203503, 1, 1, 1, 1, 1,
0.5897331, 0.1075147, 3.766774, 1, 1, 1, 1, 1,
0.5899343, -0.2775562, 1.844049, 1, 1, 1, 1, 1,
0.5912538, -0.4944329, 3.922712, 1, 1, 1, 1, 1,
0.5923204, -0.01838203, -1.016584, 1, 1, 1, 1, 1,
0.5933262, -0.9031026, 3.55314, 1, 1, 1, 1, 1,
0.5944545, 0.5722126, 1.784114, 1, 1, 1, 1, 1,
0.5955091, -2.515315, 0.930993, 0, 0, 1, 1, 1,
0.5975629, -1.133571, 2.094016, 1, 0, 0, 1, 1,
0.5981287, -0.3080727, 4.267087, 1, 0, 0, 1, 1,
0.6021978, -0.666082, 1.841488, 1, 0, 0, 1, 1,
0.6026592, 0.1471559, -1.238973, 1, 0, 0, 1, 1,
0.6047405, -0.7362268, 1.549229, 1, 0, 0, 1, 1,
0.6154546, 0.6456692, 0.6900619, 0, 0, 0, 1, 1,
0.6193896, 1.328551, 1.944751, 0, 0, 0, 1, 1,
0.6198422, -0.1524864, 0.7017801, 0, 0, 0, 1, 1,
0.6215383, 0.9337353, -1.165827, 0, 0, 0, 1, 1,
0.6228724, -0.9315664, 2.98198, 0, 0, 0, 1, 1,
0.6244043, -0.7872062, 2.084887, 0, 0, 0, 1, 1,
0.6252274, -0.5086095, 1.007869, 0, 0, 0, 1, 1,
0.626097, 1.010386, -1.150829, 1, 1, 1, 1, 1,
0.6262186, -0.4135473, 2.80203, 1, 1, 1, 1, 1,
0.6303047, -0.7432868, 1.145609, 1, 1, 1, 1, 1,
0.6314188, 1.295473, 0.2360133, 1, 1, 1, 1, 1,
0.6329833, 0.1180626, 0.3131005, 1, 1, 1, 1, 1,
0.6358402, -1.197888, 1.021638, 1, 1, 1, 1, 1,
0.6368638, -0.4034883, 1.879849, 1, 1, 1, 1, 1,
0.6467544, 0.4966882, 2.718757, 1, 1, 1, 1, 1,
0.6475245, 1.50856, 1.714257, 1, 1, 1, 1, 1,
0.6491071, 0.9590445, 1.024672, 1, 1, 1, 1, 1,
0.6519874, 0.4400145, 0.7905081, 1, 1, 1, 1, 1,
0.6522602, -0.484664, 1.600352, 1, 1, 1, 1, 1,
0.656922, 0.7818256, -0.2988322, 1, 1, 1, 1, 1,
0.6600411, -0.05859495, 2.959761, 1, 1, 1, 1, 1,
0.6617337, -0.8589665, 3.192724, 1, 1, 1, 1, 1,
0.6655294, -0.0009270657, 0.9892907, 0, 0, 1, 1, 1,
0.6666934, 0.003849192, 1.472109, 1, 0, 0, 1, 1,
0.6696025, -0.1080207, 1.81203, 1, 0, 0, 1, 1,
0.6784781, 0.2131379, 2.948997, 1, 0, 0, 1, 1,
0.6815692, -0.09645094, 1.500671, 1, 0, 0, 1, 1,
0.6848531, 0.01560711, 1.927241, 1, 0, 0, 1, 1,
0.6853646, -0.420906, 2.38986, 0, 0, 0, 1, 1,
0.6868111, 0.2535967, 2.86096, 0, 0, 0, 1, 1,
0.6907793, -0.8576554, 1.553841, 0, 0, 0, 1, 1,
0.6910521, 0.8204567, 0.760614, 0, 0, 0, 1, 1,
0.6992924, -0.4547556, 3.051605, 0, 0, 0, 1, 1,
0.7007298, 1.344368, -1.108193, 0, 0, 0, 1, 1,
0.7020896, 0.3141667, 2.674207, 0, 0, 0, 1, 1,
0.7057533, -0.5792729, 1.670062, 1, 1, 1, 1, 1,
0.7139505, -3.044949, 3.494689, 1, 1, 1, 1, 1,
0.7149929, -0.7831535, 1.972884, 1, 1, 1, 1, 1,
0.7189532, -0.4373473, 2.434293, 1, 1, 1, 1, 1,
0.7327064, 0.6958414, -0.7679764, 1, 1, 1, 1, 1,
0.7330239, -0.4717547, 3.98752, 1, 1, 1, 1, 1,
0.7336433, -0.5350536, 3.204407, 1, 1, 1, 1, 1,
0.7359564, 0.9776664, 0.5940421, 1, 1, 1, 1, 1,
0.736288, 0.5443288, 1.474835, 1, 1, 1, 1, 1,
0.7400414, -1.573211, 2.968875, 1, 1, 1, 1, 1,
0.7402726, -0.4367558, 2.099802, 1, 1, 1, 1, 1,
0.7455354, 0.07397088, 1.304213, 1, 1, 1, 1, 1,
0.7457368, 0.3529378, 1.892667, 1, 1, 1, 1, 1,
0.7472901, 0.008776519, 0.4733304, 1, 1, 1, 1, 1,
0.7658529, 2.306842, 0.4640593, 1, 1, 1, 1, 1,
0.7704757, 1.316099, 2.292737, 0, 0, 1, 1, 1,
0.7713865, 0.3413134, 0.4638419, 1, 0, 0, 1, 1,
0.7755833, 0.003067577, 1.762458, 1, 0, 0, 1, 1,
0.7815223, 0.4002014, 0.6641442, 1, 0, 0, 1, 1,
0.7866422, -0.9665692, 0.9747304, 1, 0, 0, 1, 1,
0.7891591, -0.4956575, 3.698396, 1, 0, 0, 1, 1,
0.7929003, 0.01778143, 2.320921, 0, 0, 0, 1, 1,
0.7995785, -0.9290794, 4.529183, 0, 0, 0, 1, 1,
0.8051109, 0.2486298, 0.3302015, 0, 0, 0, 1, 1,
0.8082067, 1.839671, 1.368159, 0, 0, 0, 1, 1,
0.8088677, 0.5222886, 0.9302527, 0, 0, 0, 1, 1,
0.8127039, -0.3231311, 0.3560733, 0, 0, 0, 1, 1,
0.81402, -0.4111064, 2.321716, 0, 0, 0, 1, 1,
0.8260853, -0.2386579, 2.388685, 1, 1, 1, 1, 1,
0.8292255, 0.321096, 1.653635, 1, 1, 1, 1, 1,
0.8417919, 0.8959396, -0.1571874, 1, 1, 1, 1, 1,
0.8425694, 0.1942851, 0.2036102, 1, 1, 1, 1, 1,
0.8434525, 0.3691743, 2.135524, 1, 1, 1, 1, 1,
0.8522422, -0.1955025, 2.206763, 1, 1, 1, 1, 1,
0.8559287, -1.10948, 2.360398, 1, 1, 1, 1, 1,
0.8574592, 0.6793486, -0.08683854, 1, 1, 1, 1, 1,
0.860606, 1.219786, 0.6085867, 1, 1, 1, 1, 1,
0.8639557, 0.4831082, 1.11435, 1, 1, 1, 1, 1,
0.8651696, -0.4095093, 2.029116, 1, 1, 1, 1, 1,
0.8661085, -0.7386112, 2.495543, 1, 1, 1, 1, 1,
0.8728896, -1.930997, 1.532318, 1, 1, 1, 1, 1,
0.8732427, -1.374359, 3.549256, 1, 1, 1, 1, 1,
0.8744488, -0.5002008, 3.398503, 1, 1, 1, 1, 1,
0.8811506, 0.7983447, 1.362179, 0, 0, 1, 1, 1,
0.8909354, -0.2672296, 2.312191, 1, 0, 0, 1, 1,
0.8982454, -0.4603221, 2.229591, 1, 0, 0, 1, 1,
0.8989177, 0.3771037, -0.5385824, 1, 0, 0, 1, 1,
0.8993974, -0.8837332, 3.032767, 1, 0, 0, 1, 1,
0.8995315, -0.4131966, 1.413078, 1, 0, 0, 1, 1,
0.9002419, 1.358495, -0.4552863, 0, 0, 0, 1, 1,
0.9012731, 0.1846186, 1.740811, 0, 0, 0, 1, 1,
0.9030777, -0.1764694, 2.205498, 0, 0, 0, 1, 1,
0.9072682, 0.6929184, 1.502525, 0, 0, 0, 1, 1,
0.9128022, 0.3474011, -0.2106406, 0, 0, 0, 1, 1,
0.9134685, -0.2290804, 1.404587, 0, 0, 0, 1, 1,
0.918367, -0.6829535, 2.749188, 0, 0, 0, 1, 1,
0.920647, -1.675786, 0.1407055, 1, 1, 1, 1, 1,
0.9211058, -0.4381966, -0.01956394, 1, 1, 1, 1, 1,
0.9237977, 1.056615, 0.1258893, 1, 1, 1, 1, 1,
0.9251828, 0.2066789, 1.370855, 1, 1, 1, 1, 1,
0.9255596, 1.482412, 1.682468, 1, 1, 1, 1, 1,
0.9274967, 1.119269, 1.786124, 1, 1, 1, 1, 1,
0.930265, 0.3188936, 0.9135746, 1, 1, 1, 1, 1,
0.9310291, -0.357547, 1.833925, 1, 1, 1, 1, 1,
0.93635, 1.131823, 2.269386, 1, 1, 1, 1, 1,
0.9369044, 1.176056, -1.872192, 1, 1, 1, 1, 1,
0.9370806, 0.6525533, -0.128726, 1, 1, 1, 1, 1,
0.9396898, -0.466875, 2.574419, 1, 1, 1, 1, 1,
0.9446422, 0.5152636, 1.346153, 1, 1, 1, 1, 1,
0.945646, 1.295873, 1.561166, 1, 1, 1, 1, 1,
0.9482491, 0.6228461, 0.9691368, 1, 1, 1, 1, 1,
0.9523332, 1.924301, 0.783416, 0, 0, 1, 1, 1,
0.953594, -1.786794, 2.475402, 1, 0, 0, 1, 1,
0.9537333, -0.8649737, 1.830885, 1, 0, 0, 1, 1,
0.9588401, 0.3515003, 1.01194, 1, 0, 0, 1, 1,
0.9641672, 0.3478698, 2.651517, 1, 0, 0, 1, 1,
0.9644392, -0.5364569, 0.9445602, 1, 0, 0, 1, 1,
0.9697088, 1.084547, 0.09154559, 0, 0, 0, 1, 1,
0.9697124, 1.54296, -0.2280579, 0, 0, 0, 1, 1,
0.9738576, 0.2380732, 1.406967, 0, 0, 0, 1, 1,
0.9788769, -0.4382917, 2.698993, 0, 0, 0, 1, 1,
0.9875967, -0.5281143, 2.449567, 0, 0, 0, 1, 1,
0.9879624, 1.184107, 1.394057, 0, 0, 0, 1, 1,
1.016973, -0.9516915, 1.34291, 0, 0, 0, 1, 1,
1.026309, -0.2881374, 0.6943277, 1, 1, 1, 1, 1,
1.030898, -2.723424, 2.2604, 1, 1, 1, 1, 1,
1.031379, -0.1073418, 2.486776, 1, 1, 1, 1, 1,
1.032341, 0.01622341, 0.3958808, 1, 1, 1, 1, 1,
1.037732, -0.3492665, 2.245234, 1, 1, 1, 1, 1,
1.042028, 2.554428, -0.04963864, 1, 1, 1, 1, 1,
1.047084, 0.5965169, 0.1581078, 1, 1, 1, 1, 1,
1.04865, 0.9157996, -1.457572, 1, 1, 1, 1, 1,
1.059236, 0.924999, -0.2110179, 1, 1, 1, 1, 1,
1.068909, -0.9547769, 1.970857, 1, 1, 1, 1, 1,
1.070381, 1.106932, 1.293442, 1, 1, 1, 1, 1,
1.077461, -0.1135413, 1.452943, 1, 1, 1, 1, 1,
1.079175, 0.4482359, 2.723484, 1, 1, 1, 1, 1,
1.08233, -1.139741, 1.572913, 1, 1, 1, 1, 1,
1.083146, -0.08949498, 1.409437, 1, 1, 1, 1, 1,
1.08754, 0.2753859, 0.7764237, 0, 0, 1, 1, 1,
1.104786, 0.02227594, 2.20443, 1, 0, 0, 1, 1,
1.113411, -0.1530375, 1.852682, 1, 0, 0, 1, 1,
1.120001, -0.6117643, 2.766423, 1, 0, 0, 1, 1,
1.123391, 2.157464, -0.582074, 1, 0, 0, 1, 1,
1.127939, 1.926458, -1.318191, 1, 0, 0, 1, 1,
1.151971, 1.027129, 0.7793165, 0, 0, 0, 1, 1,
1.158952, 1.020759, -0.2765213, 0, 0, 0, 1, 1,
1.16179, -2.299754, 3.469946, 0, 0, 0, 1, 1,
1.162332, -1.713691, 2.43028, 0, 0, 0, 1, 1,
1.168682, -0.5117078, 2.440324, 0, 0, 0, 1, 1,
1.176654, 1.879442, 1.090323, 0, 0, 0, 1, 1,
1.178479, -0.4883718, 2.449425, 0, 0, 0, 1, 1,
1.18302, -0.04258353, 1.690201, 1, 1, 1, 1, 1,
1.183307, 0.9596754, 0.8952636, 1, 1, 1, 1, 1,
1.184814, 1.29656, 1.751234, 1, 1, 1, 1, 1,
1.192068, 0.4781959, 0.6775016, 1, 1, 1, 1, 1,
1.202195, -1.211405, 2.068951, 1, 1, 1, 1, 1,
1.210252, -0.1165927, 2.165348, 1, 1, 1, 1, 1,
1.218472, 1.602559, 1.523769, 1, 1, 1, 1, 1,
1.219904, -0.2745667, 1.27686, 1, 1, 1, 1, 1,
1.235251, 0.9559821, 1.351617, 1, 1, 1, 1, 1,
1.238081, -0.2533201, 1.883604, 1, 1, 1, 1, 1,
1.246245, -0.7126758, 3.317907, 1, 1, 1, 1, 1,
1.246343, 0.09084883, 0.604829, 1, 1, 1, 1, 1,
1.247472, -1.386921, 3.276899, 1, 1, 1, 1, 1,
1.25426, -1.186994, 3.077588, 1, 1, 1, 1, 1,
1.262165, -0.2605668, 2.007711, 1, 1, 1, 1, 1,
1.266643, 1.161442, 3.072392, 0, 0, 1, 1, 1,
1.268574, -0.6593214, 1.37254, 1, 0, 0, 1, 1,
1.272029, -0.2264011, 2.519258, 1, 0, 0, 1, 1,
1.279437, 0.1600773, 0.8036876, 1, 0, 0, 1, 1,
1.290047, 0.2586078, 1.009295, 1, 0, 0, 1, 1,
1.292561, -0.6532109, 2.836386, 1, 0, 0, 1, 1,
1.295263, 0.3287826, 1.554574, 0, 0, 0, 1, 1,
1.299838, 1.25457, 1.667221, 0, 0, 0, 1, 1,
1.300501, -1.885097, 3.437467, 0, 0, 0, 1, 1,
1.301199, 1.667497, 0.03040697, 0, 0, 0, 1, 1,
1.303478, -1.25121, 1.682435, 0, 0, 0, 1, 1,
1.313377, 1.275578, 1.147666, 0, 0, 0, 1, 1,
1.314311, 1.308874, 1.720091, 0, 0, 0, 1, 1,
1.314623, -1.032252, 2.034447, 1, 1, 1, 1, 1,
1.316893, -1.085513, 2.97155, 1, 1, 1, 1, 1,
1.317806, -0.7788649, 1.166147, 1, 1, 1, 1, 1,
1.328166, 0.3713434, 1.359035, 1, 1, 1, 1, 1,
1.337331, 0.7997339, 3.071487, 1, 1, 1, 1, 1,
1.3415, 0.7219915, -0.1703335, 1, 1, 1, 1, 1,
1.342933, 0.7243989, -0.350219, 1, 1, 1, 1, 1,
1.347464, 1.108929, 2.140194, 1, 1, 1, 1, 1,
1.351134, 2.499148, -0.7172556, 1, 1, 1, 1, 1,
1.353356, -0.1970269, 0.2979234, 1, 1, 1, 1, 1,
1.356323, -0.3812348, 0.4077442, 1, 1, 1, 1, 1,
1.381431, -2.497718, 2.98769, 1, 1, 1, 1, 1,
1.383891, 0.2308341, 1.947206, 1, 1, 1, 1, 1,
1.389042, 0.3130714, 2.081474, 1, 1, 1, 1, 1,
1.394439, -0.05905143, 1.189555, 1, 1, 1, 1, 1,
1.401239, 1.391195, 3.234907, 0, 0, 1, 1, 1,
1.404794, 0.9870479, 2.205419, 1, 0, 0, 1, 1,
1.407514, 0.3543694, 1.020524, 1, 0, 0, 1, 1,
1.414295, -0.1604179, 1.450537, 1, 0, 0, 1, 1,
1.417777, -0.7900085, 1.251655, 1, 0, 0, 1, 1,
1.42911, -0.250526, 0.8952675, 1, 0, 0, 1, 1,
1.43059, -1.336779, 1.729016, 0, 0, 0, 1, 1,
1.439039, -0.3842881, 3.201925, 0, 0, 0, 1, 1,
1.466267, 0.3097918, 1.467339, 0, 0, 0, 1, 1,
1.470626, -1.331289, 1.906296, 0, 0, 0, 1, 1,
1.479793, -0.09901308, 1.716941, 0, 0, 0, 1, 1,
1.489618, -0.9546928, 3.592568, 0, 0, 0, 1, 1,
1.51316, -0.3371273, 2.089687, 0, 0, 0, 1, 1,
1.528728, -0.504021, 0.06947748, 1, 1, 1, 1, 1,
1.539567, 0.8969907, 0.6420176, 1, 1, 1, 1, 1,
1.546203, 0.2321879, 0.4928193, 1, 1, 1, 1, 1,
1.547961, -0.05505976, 2.507147, 1, 1, 1, 1, 1,
1.559188, -0.3166245, 0.5859889, 1, 1, 1, 1, 1,
1.565308, -1.494033, 1.874448, 1, 1, 1, 1, 1,
1.576535, -1.668151, 3.337372, 1, 1, 1, 1, 1,
1.578102, -2.40339, 3.315621, 1, 1, 1, 1, 1,
1.579045, -0.2294025, 2.291168, 1, 1, 1, 1, 1,
1.591696, 1.155063, 0.6673502, 1, 1, 1, 1, 1,
1.609375, -1.312288, 0.9493292, 1, 1, 1, 1, 1,
1.611184, -1.250892, 1.676549, 1, 1, 1, 1, 1,
1.61998, -0.7304087, 1.512927, 1, 1, 1, 1, 1,
1.627894, 0.6675371, 1.967718, 1, 1, 1, 1, 1,
1.638573, -0.7814928, 1.237378, 1, 1, 1, 1, 1,
1.645859, 1.505598, 0.9660721, 0, 0, 1, 1, 1,
1.652177, 0.297009, 2.771968, 1, 0, 0, 1, 1,
1.665237, 1.129601, -0.953835, 1, 0, 0, 1, 1,
1.667145, -0.8075097, 2.024944, 1, 0, 0, 1, 1,
1.684391, 1.871392, 0.9693304, 1, 0, 0, 1, 1,
1.691007, -1.588687, 2.929843, 1, 0, 0, 1, 1,
1.699447, -0.5763219, 0.5042305, 0, 0, 0, 1, 1,
1.711127, 0.2022434, 2.462517, 0, 0, 0, 1, 1,
1.735935, 0.4324043, 1.985314, 0, 0, 0, 1, 1,
1.74819, 1.216758, 0.2884841, 0, 0, 0, 1, 1,
1.772657, -1.719836, 0.7179141, 0, 0, 0, 1, 1,
1.775405, -0.8318897, 2.553351, 0, 0, 0, 1, 1,
1.804276, 0.7616053, 1.566472, 0, 0, 0, 1, 1,
1.817055, -0.2490335, 1.790984, 1, 1, 1, 1, 1,
1.830925, -0.5154014, 2.034885, 1, 1, 1, 1, 1,
1.832178, -0.8164274, 2.771472, 1, 1, 1, 1, 1,
1.857931, 0.8762127, 0.8034869, 1, 1, 1, 1, 1,
1.865286, -0.5561257, 2.173435, 1, 1, 1, 1, 1,
1.884121, 0.7910485, 1.574968, 1, 1, 1, 1, 1,
1.886721, -0.3879417, 0.9001405, 1, 1, 1, 1, 1,
1.886874, -2.242917, 3.031044, 1, 1, 1, 1, 1,
1.893339, 0.09401769, -0.1191521, 1, 1, 1, 1, 1,
1.909682, 0.4287438, -0.3432848, 1, 1, 1, 1, 1,
1.917464, 1.615554, 0.4203585, 1, 1, 1, 1, 1,
1.968457, -0.4204533, 3.383237, 1, 1, 1, 1, 1,
1.987572, -1.240152, 1.241698, 1, 1, 1, 1, 1,
2.043313, -0.951463, 2.137326, 1, 1, 1, 1, 1,
2.051324, -1.094657, 2.368345, 1, 1, 1, 1, 1,
2.067962, -0.2312953, 0.8320864, 0, 0, 1, 1, 1,
2.112923, 1.341011, -0.3855121, 1, 0, 0, 1, 1,
2.152453, -0.0794917, 1.077352, 1, 0, 0, 1, 1,
2.173672, 0.8723131, 3.855783, 1, 0, 0, 1, 1,
2.177434, 0.7844557, 2.074057, 1, 0, 0, 1, 1,
2.193425, 1.058982, 0.2318876, 1, 0, 0, 1, 1,
2.329581, -0.3351209, 1.548946, 0, 0, 0, 1, 1,
2.365844, 0.4065621, 0.6873236, 0, 0, 0, 1, 1,
2.394308, 0.7796383, 1.514781, 0, 0, 0, 1, 1,
2.430903, 0.5068471, 1.020072, 0, 0, 0, 1, 1,
2.451858, 0.758106, -0.6521443, 0, 0, 0, 1, 1,
2.45797, -0.1044159, -0.2144801, 0, 0, 0, 1, 1,
2.497595, -0.16888, 3.221521, 0, 0, 0, 1, 1,
2.56854, 0.9991158, 1.372271, 1, 1, 1, 1, 1,
2.590496, -1.344287, 2.570722, 1, 1, 1, 1, 1,
2.591991, 0.2253574, 1.74622, 1, 1, 1, 1, 1,
2.803006, 0.2598801, 2.483494, 1, 1, 1, 1, 1,
2.959484, 0.07050189, 0.7796071, 1, 1, 1, 1, 1,
3.011784, -0.8691631, 1.460912, 1, 1, 1, 1, 1,
3.332916, -0.514361, 1.420214, 1, 1, 1, 1, 1
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
var radius = 9.139875;
var distance = 32.10342;
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
mvMatrix.translate( -0.260631, 0.05803037, 0.2698243 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.10342);
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
