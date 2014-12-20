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
-3.171437, -0.867179, -0.7425991, 1, 0, 0, 1,
-3.144028, -1.143729, -0.5211316, 1, 0.007843138, 0, 1,
-3.125616, 0.4641238, -2.135658, 1, 0.01176471, 0, 1,
-3.019553, -1.71633, -2.071253, 1, 0.01960784, 0, 1,
-2.997508, 1.392449, -0.1796724, 1, 0.02352941, 0, 1,
-2.867793, 1.06845, 0.150177, 1, 0.03137255, 0, 1,
-2.849567, 0.8844535, -0.8370694, 1, 0.03529412, 0, 1,
-2.703003, 0.4682593, -0.3584261, 1, 0.04313726, 0, 1,
-2.588262, 0.364079, 0.04374139, 1, 0.04705882, 0, 1,
-2.550228, 1.432769, -0.09539024, 1, 0.05490196, 0, 1,
-2.503135, -0.8178144, -2.873972, 1, 0.05882353, 0, 1,
-2.483423, -0.4881425, -2.013622, 1, 0.06666667, 0, 1,
-2.343915, 0.2997616, -1.385726, 1, 0.07058824, 0, 1,
-2.329579, -0.347723, -3.484807, 1, 0.07843138, 0, 1,
-2.305542, -0.5875864, -3.059593, 1, 0.08235294, 0, 1,
-2.28221, 0.7932797, -0.8439531, 1, 0.09019608, 0, 1,
-2.274135, 0.3755444, 0.06685733, 1, 0.09411765, 0, 1,
-2.270571, -1.492991, -2.797529, 1, 0.1019608, 0, 1,
-2.24853, -0.1654603, -2.093893, 1, 0.1098039, 0, 1,
-2.241461, -0.1908494, -2.673409, 1, 0.1137255, 0, 1,
-2.225855, -0.1270141, -0.5020795, 1, 0.1215686, 0, 1,
-2.225676, 0.3251187, -1.236151, 1, 0.1254902, 0, 1,
-2.194582, -0.9042977, -2.828331, 1, 0.1333333, 0, 1,
-2.190123, 1.108871, -1.605063, 1, 0.1372549, 0, 1,
-2.155699, -1.022618, -1.471126, 1, 0.145098, 0, 1,
-2.145793, 0.5974064, -1.065624, 1, 0.1490196, 0, 1,
-2.06791, -0.6684525, -0.352847, 1, 0.1568628, 0, 1,
-2.054407, 0.6638651, -1.839866, 1, 0.1607843, 0, 1,
-2.049804, 0.1151789, -2.307208, 1, 0.1686275, 0, 1,
-2.020973, 1.852923, -1.667624, 1, 0.172549, 0, 1,
-1.985211, -0.004833711, -2.874996, 1, 0.1803922, 0, 1,
-1.965696, -0.3161054, -1.219479, 1, 0.1843137, 0, 1,
-1.962821, 0.05424706, -2.68556, 1, 0.1921569, 0, 1,
-1.935537, 0.2534157, -1.251839, 1, 0.1960784, 0, 1,
-1.916674, 1.217368, 0.4105443, 1, 0.2039216, 0, 1,
-1.90217, 0.02005631, -1.599472, 1, 0.2117647, 0, 1,
-1.857087, -0.7517909, -1.699437, 1, 0.2156863, 0, 1,
-1.779295, -1.168255, -1.612356, 1, 0.2235294, 0, 1,
-1.755853, -0.8787636, -2.181035, 1, 0.227451, 0, 1,
-1.70945, -0.8353998, -0.1650638, 1, 0.2352941, 0, 1,
-1.695759, -0.7263081, -0.931284, 1, 0.2392157, 0, 1,
-1.680948, -0.1109465, -2.165088, 1, 0.2470588, 0, 1,
-1.678838, 0.9697881, -1.389597, 1, 0.2509804, 0, 1,
-1.653055, 0.526637, -1.673425, 1, 0.2588235, 0, 1,
-1.63184, 0.7556062, 0.5929356, 1, 0.2627451, 0, 1,
-1.611845, -0.1933804, 0.5016369, 1, 0.2705882, 0, 1,
-1.610155, 0.2283798, -3.980347, 1, 0.2745098, 0, 1,
-1.602335, -0.1324743, -0.9456242, 1, 0.282353, 0, 1,
-1.593682, 0.5787752, -1.97592, 1, 0.2862745, 0, 1,
-1.591382, 0.8599672, -1.235158, 1, 0.2941177, 0, 1,
-1.590479, -1.694435, -1.446639, 1, 0.3019608, 0, 1,
-1.58617, 0.5087168, -1.662764, 1, 0.3058824, 0, 1,
-1.572207, -1.113665, -3.63746, 1, 0.3137255, 0, 1,
-1.568782, 0.04192284, -2.003632, 1, 0.3176471, 0, 1,
-1.56857, 0.961555, -0.378031, 1, 0.3254902, 0, 1,
-1.558185, 0.00311321, -2.00868, 1, 0.3294118, 0, 1,
-1.552928, -0.4041609, -1.38121, 1, 0.3372549, 0, 1,
-1.54965, 0.7165951, -3.402481, 1, 0.3411765, 0, 1,
-1.548215, 0.892461, -0.4689865, 1, 0.3490196, 0, 1,
-1.546695, 0.7288533, -1.044761, 1, 0.3529412, 0, 1,
-1.54567, 0.6457618, -2.41446, 1, 0.3607843, 0, 1,
-1.53063, 0.3244404, -1.617218, 1, 0.3647059, 0, 1,
-1.529718, 0.1072917, -1.101313, 1, 0.372549, 0, 1,
-1.528046, -0.7665491, -1.527897, 1, 0.3764706, 0, 1,
-1.512069, -0.415909, -0.5120023, 1, 0.3843137, 0, 1,
-1.509477, -0.9809718, -1.875626, 1, 0.3882353, 0, 1,
-1.503645, 0.5878003, -1.923508, 1, 0.3960784, 0, 1,
-1.498291, 0.1067441, -1.984681, 1, 0.4039216, 0, 1,
-1.494139, 1.449564, -1.424434, 1, 0.4078431, 0, 1,
-1.486776, -0.4224399, -3.016109, 1, 0.4156863, 0, 1,
-1.480176, 1.209569, -0.3778942, 1, 0.4196078, 0, 1,
-1.46544, 1.123995, -1.047369, 1, 0.427451, 0, 1,
-1.426711, -0.5186606, -0.8340313, 1, 0.4313726, 0, 1,
-1.425737, 0.6606553, -1.164207, 1, 0.4392157, 0, 1,
-1.413545, -0.3516641, -0.5613981, 1, 0.4431373, 0, 1,
-1.406417, 1.576043, -1.629466, 1, 0.4509804, 0, 1,
-1.404171, -1.076965, -2.707738, 1, 0.454902, 0, 1,
-1.396882, -1.175484, -2.234437, 1, 0.4627451, 0, 1,
-1.387873, 0.2834765, -2.232417, 1, 0.4666667, 0, 1,
-1.376127, -1.818343, -3.123549, 1, 0.4745098, 0, 1,
-1.361879, 0.1275906, -1.842308, 1, 0.4784314, 0, 1,
-1.34552, 0.4650523, -2.729481, 1, 0.4862745, 0, 1,
-1.334607, 0.9681031, -2.119761, 1, 0.4901961, 0, 1,
-1.334248, -0.1628109, -1.392265, 1, 0.4980392, 0, 1,
-1.330026, -0.985149, -1.292066, 1, 0.5058824, 0, 1,
-1.326576, 0.9480264, -0.8571784, 1, 0.509804, 0, 1,
-1.322053, -2.232685, -1.889003, 1, 0.5176471, 0, 1,
-1.301728, 0.7868052, -1.80006, 1, 0.5215687, 0, 1,
-1.300149, -0.236297, -3.434508, 1, 0.5294118, 0, 1,
-1.297652, 0.02348254, -0.9088125, 1, 0.5333334, 0, 1,
-1.293315, 0.6456006, -1.69987, 1, 0.5411765, 0, 1,
-1.291101, -0.609813, -1.728886, 1, 0.5450981, 0, 1,
-1.284688, 2.097742, -0.2338655, 1, 0.5529412, 0, 1,
-1.278537, -1.282868, -2.533204, 1, 0.5568628, 0, 1,
-1.272637, -0.5678224, -2.422529, 1, 0.5647059, 0, 1,
-1.269448, 0.7038368, -1.69268, 1, 0.5686275, 0, 1,
-1.261585, -0.8432751, -1.44642, 1, 0.5764706, 0, 1,
-1.256487, -1.64616, -4.482767, 1, 0.5803922, 0, 1,
-1.248393, 0.1080788, -1.043231, 1, 0.5882353, 0, 1,
-1.225222, -0.3150633, -2.483022, 1, 0.5921569, 0, 1,
-1.22145, -0.4333451, -1.426372, 1, 0.6, 0, 1,
-1.208649, 0.5366616, -1.619817, 1, 0.6078432, 0, 1,
-1.207122, 1.37265, -0.05325211, 1, 0.6117647, 0, 1,
-1.202518, 0.08764295, -1.42131, 1, 0.6196079, 0, 1,
-1.197489, -1.552006, -2.590727, 1, 0.6235294, 0, 1,
-1.197319, 1.414291, 1.52275, 1, 0.6313726, 0, 1,
-1.192958, -0.4300713, -1.529535, 1, 0.6352941, 0, 1,
-1.180846, -0.5231082, -2.145558, 1, 0.6431373, 0, 1,
-1.175491, -0.07916301, -1.118225, 1, 0.6470588, 0, 1,
-1.174983, -0.4674215, -1.797002, 1, 0.654902, 0, 1,
-1.171005, 0.1247346, -0.6820142, 1, 0.6588235, 0, 1,
-1.165502, 1.274452, 0.7979862, 1, 0.6666667, 0, 1,
-1.164418, 1.035341, -0.5542916, 1, 0.6705883, 0, 1,
-1.162683, 0.03750796, -0.8392678, 1, 0.6784314, 0, 1,
-1.141006, 1.427696, 0.01493154, 1, 0.682353, 0, 1,
-1.131631, -0.277803, -2.324413, 1, 0.6901961, 0, 1,
-1.131593, -1.259722, -3.286478, 1, 0.6941177, 0, 1,
-1.127185, -0.0977746, -1.521735, 1, 0.7019608, 0, 1,
-1.125545, 0.1510206, -0.9022133, 1, 0.7098039, 0, 1,
-1.122708, 0.5623457, -2.279604, 1, 0.7137255, 0, 1,
-1.122304, -0.9288976, -2.485181, 1, 0.7215686, 0, 1,
-1.113035, 1.129364, -0.002541855, 1, 0.7254902, 0, 1,
-1.093665, -0.06701368, -2.910243, 1, 0.7333333, 0, 1,
-1.088727, -1.117369, -2.189846, 1, 0.7372549, 0, 1,
-1.080689, -0.9964866, -0.4406237, 1, 0.7450981, 0, 1,
-1.079742, 0.3275591, -1.122621, 1, 0.7490196, 0, 1,
-1.078851, 0.2436073, -2.591517, 1, 0.7568628, 0, 1,
-1.078071, -1.522312, -5.258599, 1, 0.7607843, 0, 1,
-1.072494, -1.006612, -3.80598, 1, 0.7686275, 0, 1,
-1.07112, -1.34151, -2.246541, 1, 0.772549, 0, 1,
-1.069685, -1.008786, -2.160132, 1, 0.7803922, 0, 1,
-1.064402, -1.101394, -2.608406, 1, 0.7843137, 0, 1,
-1.06233, -1.093678, -2.339057, 1, 0.7921569, 0, 1,
-1.061617, -1.108259, -4.035106, 1, 0.7960784, 0, 1,
-1.056947, 0.2571681, -2.07662, 1, 0.8039216, 0, 1,
-1.055487, 0.2321075, 0.07555983, 1, 0.8117647, 0, 1,
-1.054116, 0.7624355, 0.16224, 1, 0.8156863, 0, 1,
-1.050317, 0.3075013, -1.445078, 1, 0.8235294, 0, 1,
-1.041428, -0.5259822, -3.127224, 1, 0.827451, 0, 1,
-1.040384, 0.2361725, -0.2959851, 1, 0.8352941, 0, 1,
-1.035049, 2.348135, -0.8419161, 1, 0.8392157, 0, 1,
-1.029343, 0.5825393, -1.510911, 1, 0.8470588, 0, 1,
-1.02927, -0.01592898, -2.649619, 1, 0.8509804, 0, 1,
-1.020929, 0.2466888, -1.906793, 1, 0.8588235, 0, 1,
-1.009326, -0.3689685, -1.594135, 1, 0.8627451, 0, 1,
-1.007692, 0.8202437, 0.07336519, 1, 0.8705882, 0, 1,
-1.003776, 0.1318847, -2.736398, 1, 0.8745098, 0, 1,
-0.9997042, 0.597029, -1.581089, 1, 0.8823529, 0, 1,
-0.9815392, -0.7485222, -3.11136, 1, 0.8862745, 0, 1,
-0.9777265, -0.9636067, -1.6357, 1, 0.8941177, 0, 1,
-0.9758582, 0.5548428, -0.8459038, 1, 0.8980392, 0, 1,
-0.9719455, -1.248021, -0.3632804, 1, 0.9058824, 0, 1,
-0.9691232, -0.2680669, -2.113858, 1, 0.9137255, 0, 1,
-0.9553384, 0.544465, -0.1701051, 1, 0.9176471, 0, 1,
-0.9521852, -0.7963349, -2.994804, 1, 0.9254902, 0, 1,
-0.9466125, 0.6095412, 0.2212419, 1, 0.9294118, 0, 1,
-0.9439825, 0.2192012, -2.940482, 1, 0.9372549, 0, 1,
-0.9421284, 0.4282155, -0.8949149, 1, 0.9411765, 0, 1,
-0.9421065, 0.3991241, -0.9042357, 1, 0.9490196, 0, 1,
-0.9411559, -0.9432517, -3.254614, 1, 0.9529412, 0, 1,
-0.9401515, 0.1398082, -2.425493, 1, 0.9607843, 0, 1,
-0.9344836, 0.7979442, -1.148279, 1, 0.9647059, 0, 1,
-0.9332797, 0.1562795, -1.899326, 1, 0.972549, 0, 1,
-0.9328403, -1.619023, -3.489448, 1, 0.9764706, 0, 1,
-0.9325533, 0.8454898, 1.544319, 1, 0.9843137, 0, 1,
-0.9199671, -1.276472, -2.629967, 1, 0.9882353, 0, 1,
-0.9182048, 0.8295532, -0.7670581, 1, 0.9960784, 0, 1,
-0.91351, 0.5553902, -1.279025, 0.9960784, 1, 0, 1,
-0.911285, -0.08579668, -1.715185, 0.9921569, 1, 0, 1,
-0.9098167, 0.2411194, -1.501143, 0.9843137, 1, 0, 1,
-0.9079325, 0.8701553, 0.3994604, 0.9803922, 1, 0, 1,
-0.9063169, 1.08715, -1.742816, 0.972549, 1, 0, 1,
-0.9010602, 0.3878861, -0.9646356, 0.9686275, 1, 0, 1,
-0.8980576, -0.6505844, -1.088426, 0.9607843, 1, 0, 1,
-0.8965028, -1.500693, -3.132099, 0.9568627, 1, 0, 1,
-0.8876077, 1.181903, -3.504575, 0.9490196, 1, 0, 1,
-0.8812783, -0.2028462, -1.329693, 0.945098, 1, 0, 1,
-0.878349, -1.277261, -2.366842, 0.9372549, 1, 0, 1,
-0.8756957, 0.02532607, -2.947763, 0.9333333, 1, 0, 1,
-0.8732318, 0.05557606, -1.036888, 0.9254902, 1, 0, 1,
-0.8721867, -0.1325186, -2.312683, 0.9215686, 1, 0, 1,
-0.8632522, -1.322721, -3.813773, 0.9137255, 1, 0, 1,
-0.8562482, 0.6442335, -0.7752463, 0.9098039, 1, 0, 1,
-0.8531421, -2.611054, -3.799825, 0.9019608, 1, 0, 1,
-0.8517163, -0.4958276, -0.2935475, 0.8941177, 1, 0, 1,
-0.8501437, -0.5858001, -2.151566, 0.8901961, 1, 0, 1,
-0.8492838, 0.1186411, -2.591899, 0.8823529, 1, 0, 1,
-0.8483461, -0.5208054, -1.293427, 0.8784314, 1, 0, 1,
-0.8479159, -0.9366773, -3.256673, 0.8705882, 1, 0, 1,
-0.8421506, -1.495405, -1.733195, 0.8666667, 1, 0, 1,
-0.8407338, -0.3281454, -3.654372, 0.8588235, 1, 0, 1,
-0.8400665, -0.2573224, -2.470413, 0.854902, 1, 0, 1,
-0.8384327, 0.3871024, -0.5410753, 0.8470588, 1, 0, 1,
-0.8381624, -0.2348573, -0.794376, 0.8431373, 1, 0, 1,
-0.8352624, -0.8788486, -1.223481, 0.8352941, 1, 0, 1,
-0.8260392, 1.416349, -0.9474517, 0.8313726, 1, 0, 1,
-0.824848, -1.381798, -2.019621, 0.8235294, 1, 0, 1,
-0.8214965, 0.4035873, -0.7139945, 0.8196079, 1, 0, 1,
-0.819099, 0.7513402, -0.9226885, 0.8117647, 1, 0, 1,
-0.8133795, 0.6525769, 0.8480886, 0.8078431, 1, 0, 1,
-0.8125004, -1.023942, -3.41011, 0.8, 1, 0, 1,
-0.8083175, -0.9215981, -5.258702, 0.7921569, 1, 0, 1,
-0.8080214, 0.002472515, -1.048348, 0.7882353, 1, 0, 1,
-0.7986968, -0.3365541, -2.668219, 0.7803922, 1, 0, 1,
-0.7976681, 0.9174718, 0.2863338, 0.7764706, 1, 0, 1,
-0.7901354, -0.6636439, -3.14602, 0.7686275, 1, 0, 1,
-0.7821467, 0.07787655, -1.212241, 0.7647059, 1, 0, 1,
-0.7821121, -0.09021282, -1.213613, 0.7568628, 1, 0, 1,
-0.7801127, 0.5031663, -0.6676287, 0.7529412, 1, 0, 1,
-0.7752965, 1.724829, -1.607008, 0.7450981, 1, 0, 1,
-0.7729479, -0.05785846, -0.277179, 0.7411765, 1, 0, 1,
-0.7626687, 0.2064944, -1.291552, 0.7333333, 1, 0, 1,
-0.7626352, -0.9198205, -2.219409, 0.7294118, 1, 0, 1,
-0.7624391, 0.5670496, -0.5934881, 0.7215686, 1, 0, 1,
-0.7523211, 1.040684, -1.26715, 0.7176471, 1, 0, 1,
-0.7450248, -0.1302303, -2.987487, 0.7098039, 1, 0, 1,
-0.7424197, -0.04189511, 0.4395609, 0.7058824, 1, 0, 1,
-0.7359568, 1.304722, -2.160915, 0.6980392, 1, 0, 1,
-0.7332464, -0.7092634, -1.112304, 0.6901961, 1, 0, 1,
-0.7321293, 0.01787844, -2.443656, 0.6862745, 1, 0, 1,
-0.7286553, 0.5143188, -0.4035984, 0.6784314, 1, 0, 1,
-0.723853, 1.23355, -1.168586, 0.6745098, 1, 0, 1,
-0.7228237, 0.6535161, -0.679045, 0.6666667, 1, 0, 1,
-0.7194435, -0.1600612, -0.8595184, 0.6627451, 1, 0, 1,
-0.7179949, -0.03019913, -1.372084, 0.654902, 1, 0, 1,
-0.71107, -0.1809667, -2.464514, 0.6509804, 1, 0, 1,
-0.7055622, -1.440169, -1.576239, 0.6431373, 1, 0, 1,
-0.7053879, -0.634658, -0.394048, 0.6392157, 1, 0, 1,
-0.6975254, -0.4305483, -3.022018, 0.6313726, 1, 0, 1,
-0.6895441, 0.1653821, -3.279796, 0.627451, 1, 0, 1,
-0.6874207, -0.1422619, -2.783128, 0.6196079, 1, 0, 1,
-0.6867518, 1.259936, -1.328649, 0.6156863, 1, 0, 1,
-0.6855727, -0.3307405, -2.159836, 0.6078432, 1, 0, 1,
-0.685429, -0.3937888, -2.236681, 0.6039216, 1, 0, 1,
-0.6831492, -0.4618221, -1.203843, 0.5960785, 1, 0, 1,
-0.6818119, 0.2697294, -0.8175206, 0.5882353, 1, 0, 1,
-0.6811138, 0.6258892, -1.566743, 0.5843138, 1, 0, 1,
-0.6787106, 0.3706114, -1.120841, 0.5764706, 1, 0, 1,
-0.6780571, -0.05209032, -1.529977, 0.572549, 1, 0, 1,
-0.6776813, 0.4622596, -0.3827779, 0.5647059, 1, 0, 1,
-0.6754114, 0.04253133, -1.651472, 0.5607843, 1, 0, 1,
-0.6718455, -0.1164396, -1.513257, 0.5529412, 1, 0, 1,
-0.6682936, 0.05017081, -1.262404, 0.5490196, 1, 0, 1,
-0.6649267, -1.30005, -1.022857, 0.5411765, 1, 0, 1,
-0.6617212, -0.6426639, -3.825906, 0.5372549, 1, 0, 1,
-0.6601694, 0.2452966, -1.860031, 0.5294118, 1, 0, 1,
-0.6594559, 0.2951383, -2.574975, 0.5254902, 1, 0, 1,
-0.6592808, 0.6481739, 0.004488583, 0.5176471, 1, 0, 1,
-0.6581641, 0.1356107, -1.229144, 0.5137255, 1, 0, 1,
-0.6571645, -1.741446, -2.845978, 0.5058824, 1, 0, 1,
-0.6554659, -0.5984895, -2.047586, 0.5019608, 1, 0, 1,
-0.6523339, -1.190088, -3.447308, 0.4941176, 1, 0, 1,
-0.6486375, 1.578025, 2.204465, 0.4862745, 1, 0, 1,
-0.6449721, 1.253773, 0.2192546, 0.4823529, 1, 0, 1,
-0.6414232, 0.658741, -3.528357, 0.4745098, 1, 0, 1,
-0.6413121, 0.4994763, -0.1929102, 0.4705882, 1, 0, 1,
-0.6339369, -1.469071, -3.484634, 0.4627451, 1, 0, 1,
-0.6305875, -1.6262, -3.377728, 0.4588235, 1, 0, 1,
-0.6305117, -1.043795, -1.36921, 0.4509804, 1, 0, 1,
-0.6292486, -1.107252, -2.638649, 0.4470588, 1, 0, 1,
-0.6185818, 0.4354543, -0.9701486, 0.4392157, 1, 0, 1,
-0.618273, -0.9202066, -3.50929, 0.4352941, 1, 0, 1,
-0.6095768, -0.6838433, -3.002633, 0.427451, 1, 0, 1,
-0.6069811, -0.5252255, -1.690758, 0.4235294, 1, 0, 1,
-0.6035579, 1.932763, -0.6492462, 0.4156863, 1, 0, 1,
-0.602057, 1.970424, 1.361849, 0.4117647, 1, 0, 1,
-0.6012471, 0.3353451, -1.747897, 0.4039216, 1, 0, 1,
-0.600361, -1.800879, -3.682969, 0.3960784, 1, 0, 1,
-0.5984496, -0.1903012, -1.66351, 0.3921569, 1, 0, 1,
-0.5962278, 0.3193118, -1.422644, 0.3843137, 1, 0, 1,
-0.5954702, 0.05163814, -3.747628, 0.3803922, 1, 0, 1,
-0.5950711, 0.96108, -1.377721, 0.372549, 1, 0, 1,
-0.5863588, -0.5254466, -2.156102, 0.3686275, 1, 0, 1,
-0.5744392, 0.9751924, -0.6252055, 0.3607843, 1, 0, 1,
-0.5633508, 0.7311091, -2.85868, 0.3568628, 1, 0, 1,
-0.5625651, -0.3604796, -2.114321, 0.3490196, 1, 0, 1,
-0.5617973, 0.2716095, -3.061095, 0.345098, 1, 0, 1,
-0.5606422, 0.09575659, -2.772302, 0.3372549, 1, 0, 1,
-0.5563403, 0.3679147, 0.009256762, 0.3333333, 1, 0, 1,
-0.5550005, -0.06520076, -2.534598, 0.3254902, 1, 0, 1,
-0.5526875, 0.128603, -0.3185277, 0.3215686, 1, 0, 1,
-0.5505506, -0.1084526, -2.553046, 0.3137255, 1, 0, 1,
-0.5491605, -0.7150597, -1.579676, 0.3098039, 1, 0, 1,
-0.546334, 0.06200498, -2.598538, 0.3019608, 1, 0, 1,
-0.5433971, -0.3015738, -1.322672, 0.2941177, 1, 0, 1,
-0.5393693, 0.1844849, -1.593248, 0.2901961, 1, 0, 1,
-0.5390705, -0.3237266, -2.676147, 0.282353, 1, 0, 1,
-0.538285, -0.9588532, -3.579332, 0.2784314, 1, 0, 1,
-0.5380805, 1.280689, -1.351091, 0.2705882, 1, 0, 1,
-0.5298923, 0.3291224, -1.579707, 0.2666667, 1, 0, 1,
-0.5288573, 0.8333638, 0.1904096, 0.2588235, 1, 0, 1,
-0.5280054, 0.485037, -0.6674543, 0.254902, 1, 0, 1,
-0.5233164, -0.3851263, -1.031912, 0.2470588, 1, 0, 1,
-0.5167679, 0.8133075, -1.361965, 0.2431373, 1, 0, 1,
-0.5140416, -0.4187071, -0.5126457, 0.2352941, 1, 0, 1,
-0.5124865, -0.9753969, -3.208114, 0.2313726, 1, 0, 1,
-0.5100108, -0.8608761, -3.27655, 0.2235294, 1, 0, 1,
-0.5057132, 1.057731, -1.323374, 0.2196078, 1, 0, 1,
-0.4942284, 0.8092031, -0.9117839, 0.2117647, 1, 0, 1,
-0.4937992, 0.7090957, 0.004811977, 0.2078431, 1, 0, 1,
-0.4909473, 1.029257, 0.237524, 0.2, 1, 0, 1,
-0.4905963, -0.1374497, -2.226846, 0.1921569, 1, 0, 1,
-0.4889456, 0.7425717, 0.4122994, 0.1882353, 1, 0, 1,
-0.4879567, -0.06576323, -1.706589, 0.1803922, 1, 0, 1,
-0.4874099, -1.721534, -2.370435, 0.1764706, 1, 0, 1,
-0.4873046, -0.4940746, -3.253309, 0.1686275, 1, 0, 1,
-0.4835042, -2.862811, -3.766377, 0.1647059, 1, 0, 1,
-0.4813919, -0.004872323, -2.322427, 0.1568628, 1, 0, 1,
-0.4807233, 0.2094592, 0.0260797, 0.1529412, 1, 0, 1,
-0.4793388, 0.1975117, -1.881652, 0.145098, 1, 0, 1,
-0.4783203, -0.5036922, -2.677953, 0.1411765, 1, 0, 1,
-0.4772977, -0.8330105, -2.035428, 0.1333333, 1, 0, 1,
-0.4750879, -0.1873831, -1.04441, 0.1294118, 1, 0, 1,
-0.4746935, -0.8132909, -1.92843, 0.1215686, 1, 0, 1,
-0.4713467, 2.577693, 1.230725, 0.1176471, 1, 0, 1,
-0.471333, -0.650356, -3.411212, 0.1098039, 1, 0, 1,
-0.4690667, 0.3510621, -2.324791, 0.1058824, 1, 0, 1,
-0.4627885, -1.468614, -3.575798, 0.09803922, 1, 0, 1,
-0.4610769, 1.138836, -0.2236714, 0.09019608, 1, 0, 1,
-0.459323, 0.8628174, 0.07400347, 0.08627451, 1, 0, 1,
-0.4550864, -1.242614, -3.238764, 0.07843138, 1, 0, 1,
-0.4522553, 0.7545452, -1.486576, 0.07450981, 1, 0, 1,
-0.4514183, -0.8854128, -3.497218, 0.06666667, 1, 0, 1,
-0.4468937, 1.316385, 0.1078449, 0.0627451, 1, 0, 1,
-0.44423, 0.756398, 0.2211526, 0.05490196, 1, 0, 1,
-0.4412832, 0.3963353, 0.1343987, 0.05098039, 1, 0, 1,
-0.4405465, -2.105198, -4.131858, 0.04313726, 1, 0, 1,
-0.4361045, 0.9189346, -1.044452, 0.03921569, 1, 0, 1,
-0.4360747, 0.1891851, -2.770656, 0.03137255, 1, 0, 1,
-0.4352202, 0.6066685, 0.2532778, 0.02745098, 1, 0, 1,
-0.4341977, 0.4023989, -0.5519947, 0.01960784, 1, 0, 1,
-0.4332151, 0.3007466, -0.9506582, 0.01568628, 1, 0, 1,
-0.4330927, -0.4099424, -0.9774351, 0.007843138, 1, 0, 1,
-0.4329244, 1.586691, -0.8245177, 0.003921569, 1, 0, 1,
-0.432602, -0.8148425, -2.738791, 0, 1, 0.003921569, 1,
-0.4279467, -0.9927673, -3.057719, 0, 1, 0.01176471, 1,
-0.4266469, 0.06058554, -0.3299664, 0, 1, 0.01568628, 1,
-0.4265538, -0.9904547, -2.460607, 0, 1, 0.02352941, 1,
-0.4205038, 0.20104, -2.132109, 0, 1, 0.02745098, 1,
-0.4200752, 1.434871, -0.2284347, 0, 1, 0.03529412, 1,
-0.4182606, -0.9648077, -2.362395, 0, 1, 0.03921569, 1,
-0.4181785, -0.1363992, -2.019033, 0, 1, 0.04705882, 1,
-0.4138211, 0.199512, -2.030091, 0, 1, 0.05098039, 1,
-0.4109822, -0.296069, -2.932343, 0, 1, 0.05882353, 1,
-0.4103596, 0.4144197, -1.497374, 0, 1, 0.0627451, 1,
-0.409177, -1.988626, -3.170185, 0, 1, 0.07058824, 1,
-0.4089942, 0.656197, -1.708923, 0, 1, 0.07450981, 1,
-0.4083468, -0.8033028, -1.57866, 0, 1, 0.08235294, 1,
-0.4035009, -2.11797, -3.593785, 0, 1, 0.08627451, 1,
-0.4034009, 0.2793083, 0.4913085, 0, 1, 0.09411765, 1,
-0.4023406, -0.555509, -3.871485, 0, 1, 0.1019608, 1,
-0.3989882, 0.2538996, -1.972815, 0, 1, 0.1058824, 1,
-0.3979406, -0.8757529, -1.973445, 0, 1, 0.1137255, 1,
-0.3958815, 0.009700664, -0.9462708, 0, 1, 0.1176471, 1,
-0.3939588, 0.3773686, 0.8058732, 0, 1, 0.1254902, 1,
-0.3934706, -1.152923, -3.179121, 0, 1, 0.1294118, 1,
-0.3902619, 0.68546, 0.354816, 0, 1, 0.1372549, 1,
-0.3864402, 0.510534, 0.9118934, 0, 1, 0.1411765, 1,
-0.3798983, -1.127616, -2.219082, 0, 1, 0.1490196, 1,
-0.3731788, -0.5711756, -4.378012, 0, 1, 0.1529412, 1,
-0.3714617, -1.124266, -3.757557, 0, 1, 0.1607843, 1,
-0.3701254, 1.685235, 0.01179711, 0, 1, 0.1647059, 1,
-0.368757, 1.254047, 0.154129, 0, 1, 0.172549, 1,
-0.3674898, 0.6975746, -1.077739, 0, 1, 0.1764706, 1,
-0.3659904, 1.627295, -1.050373, 0, 1, 0.1843137, 1,
-0.3620942, -0.5678298, -2.025496, 0, 1, 0.1882353, 1,
-0.3576442, 1.986374, -2.329425, 0, 1, 0.1960784, 1,
-0.3572263, 2.650026, -0.9887061, 0, 1, 0.2039216, 1,
-0.3543627, -0.07706138, -2.009283, 0, 1, 0.2078431, 1,
-0.3481086, -0.685549, -2.409483, 0, 1, 0.2156863, 1,
-0.3465205, 0.592539, -0.6490552, 0, 1, 0.2196078, 1,
-0.3445386, -0.07742649, -2.824786, 0, 1, 0.227451, 1,
-0.344133, 1.792575, -1.071141, 0, 1, 0.2313726, 1,
-0.3437076, -0.9487812, -2.533897, 0, 1, 0.2392157, 1,
-0.3424965, 0.09322239, -1.552009, 0, 1, 0.2431373, 1,
-0.3383496, 0.2761517, 0.167028, 0, 1, 0.2509804, 1,
-0.33204, 0.3546034, -0.3752856, 0, 1, 0.254902, 1,
-0.331381, -0.3749969, -1.35415, 0, 1, 0.2627451, 1,
-0.3302398, -0.0005037871, -0.8926027, 0, 1, 0.2666667, 1,
-0.3292143, 0.2047427, 0.667374, 0, 1, 0.2745098, 1,
-0.32804, 0.2538466, 0.2473522, 0, 1, 0.2784314, 1,
-0.3272161, -1.323786, -1.423085, 0, 1, 0.2862745, 1,
-0.3220709, 0.0679793, -2.044134, 0, 1, 0.2901961, 1,
-0.3205989, 0.111047, -0.2447679, 0, 1, 0.2980392, 1,
-0.3204589, 0.715318, -0.4313942, 0, 1, 0.3058824, 1,
-0.3186869, -0.3135662, -1.074324, 0, 1, 0.3098039, 1,
-0.3094146, 0.9142668, 0.1840278, 0, 1, 0.3176471, 1,
-0.3062959, 0.3503988, -1.328297, 0, 1, 0.3215686, 1,
-0.3061395, 1.099441, -1.124318, 0, 1, 0.3294118, 1,
-0.3047518, 0.03187768, -1.150187, 0, 1, 0.3333333, 1,
-0.3015583, 1.382678, 0.2704599, 0, 1, 0.3411765, 1,
-0.3006593, 1.247747, -0.5886993, 0, 1, 0.345098, 1,
-0.2955239, -1.28026, -2.755323, 0, 1, 0.3529412, 1,
-0.2926583, -0.1819134, -2.690077, 0, 1, 0.3568628, 1,
-0.2836347, 0.7698994, 0.5891089, 0, 1, 0.3647059, 1,
-0.282272, -0.2933679, -4.174474, 0, 1, 0.3686275, 1,
-0.2799323, -1.308177, -3.229173, 0, 1, 0.3764706, 1,
-0.2792248, -0.6782927, -3.240258, 0, 1, 0.3803922, 1,
-0.279057, -0.01080604, -0.1355952, 0, 1, 0.3882353, 1,
-0.278393, -0.03942451, -0.06880049, 0, 1, 0.3921569, 1,
-0.2699405, 1.802722, -0.6792604, 0, 1, 0.4, 1,
-0.2681045, 0.7419581, -2.15064, 0, 1, 0.4078431, 1,
-0.2663407, -0.814844, -2.750958, 0, 1, 0.4117647, 1,
-0.2610093, 0.8992507, 0.707721, 0, 1, 0.4196078, 1,
-0.2606498, -0.8817917, -0.996355, 0, 1, 0.4235294, 1,
-0.2587988, 1.585208, -1.523366, 0, 1, 0.4313726, 1,
-0.2568674, 0.6683599, 0.2194201, 0, 1, 0.4352941, 1,
-0.2548092, -1.812818, -2.695792, 0, 1, 0.4431373, 1,
-0.2523001, -0.1586808, -0.8513466, 0, 1, 0.4470588, 1,
-0.251532, 0.2563933, -1.023627, 0, 1, 0.454902, 1,
-0.2495842, 0.3259349, 0.4704721, 0, 1, 0.4588235, 1,
-0.2476279, 0.1014053, 0.3047654, 0, 1, 0.4666667, 1,
-0.245816, 1.203526, -1.933383, 0, 1, 0.4705882, 1,
-0.2420837, -0.2561259, -2.590716, 0, 1, 0.4784314, 1,
-0.2387625, 0.1719553, -1.173886, 0, 1, 0.4823529, 1,
-0.2349332, 1.43576, -0.05825245, 0, 1, 0.4901961, 1,
-0.2317723, -0.7970094, -3.073427, 0, 1, 0.4941176, 1,
-0.2287863, -0.6166276, -1.387855, 0, 1, 0.5019608, 1,
-0.2246229, -0.02386318, -2.085698, 0, 1, 0.509804, 1,
-0.2212344, -0.450314, -2.29662, 0, 1, 0.5137255, 1,
-0.2195761, 0.4951358, -0.6856501, 0, 1, 0.5215687, 1,
-0.2172924, -0.73688, -2.195822, 0, 1, 0.5254902, 1,
-0.2166223, 0.07452743, -1.072818, 0, 1, 0.5333334, 1,
-0.2158044, 1.617543, -0.2085804, 0, 1, 0.5372549, 1,
-0.2126104, 0.05080717, -1.709559, 0, 1, 0.5450981, 1,
-0.2109765, 0.6155096, -0.316444, 0, 1, 0.5490196, 1,
-0.2093714, 0.217106, -0.3826992, 0, 1, 0.5568628, 1,
-0.2085944, 0.8435009, -0.777789, 0, 1, 0.5607843, 1,
-0.197215, 0.9428855, 0.6063797, 0, 1, 0.5686275, 1,
-0.1896474, -1.151326, -2.247509, 0, 1, 0.572549, 1,
-0.1840469, -2.002025, -3.170386, 0, 1, 0.5803922, 1,
-0.1791299, -0.6006213, -3.520158, 0, 1, 0.5843138, 1,
-0.1777031, -0.3125083, -2.305591, 0, 1, 0.5921569, 1,
-0.1772522, 0.2926135, -1.451462, 0, 1, 0.5960785, 1,
-0.1739222, -0.09104472, -5.284194, 0, 1, 0.6039216, 1,
-0.1735257, 0.6342767, 0.3879648, 0, 1, 0.6117647, 1,
-0.168524, 0.8513876, 0.7938297, 0, 1, 0.6156863, 1,
-0.1671726, -0.6530955, -4.166505, 0, 1, 0.6235294, 1,
-0.1671664, 0.301833, 0.783812, 0, 1, 0.627451, 1,
-0.1654519, 0.196398, -0.9988003, 0, 1, 0.6352941, 1,
-0.1651486, 1.207555, -1.434479, 0, 1, 0.6392157, 1,
-0.1645851, -0.3221616, -2.19579, 0, 1, 0.6470588, 1,
-0.1635912, -0.0190238, -1.055542, 0, 1, 0.6509804, 1,
-0.1617356, -1.12867, -3.527981, 0, 1, 0.6588235, 1,
-0.1612693, -0.9174004, -2.796745, 0, 1, 0.6627451, 1,
-0.1575322, 2.160931, -1.076238, 0, 1, 0.6705883, 1,
-0.1557146, 1.691694, -0.04670702, 0, 1, 0.6745098, 1,
-0.1552446, -1.328171, -1.916155, 0, 1, 0.682353, 1,
-0.1543575, -0.8550909, -2.831394, 0, 1, 0.6862745, 1,
-0.1503817, 0.5190084, -0.3100078, 0, 1, 0.6941177, 1,
-0.1492556, -1.883898, -3.823277, 0, 1, 0.7019608, 1,
-0.1461952, -1.309277, -3.715922, 0, 1, 0.7058824, 1,
-0.1448015, -1.812799, -0.8665706, 0, 1, 0.7137255, 1,
-0.1439564, -0.9903917, -2.83986, 0, 1, 0.7176471, 1,
-0.1432023, -0.5663379, -4.526918, 0, 1, 0.7254902, 1,
-0.143171, -0.3168162, -4.891749, 0, 1, 0.7294118, 1,
-0.1421444, 1.525657, 0.1691187, 0, 1, 0.7372549, 1,
-0.1391061, 1.038967, -0.2985183, 0, 1, 0.7411765, 1,
-0.1289942, -0.04281119, -2.556339, 0, 1, 0.7490196, 1,
-0.1276134, -0.4939071, -3.82239, 0, 1, 0.7529412, 1,
-0.1218657, 0.6041281, 0.7185575, 0, 1, 0.7607843, 1,
-0.1213988, -0.1538443, -2.435506, 0, 1, 0.7647059, 1,
-0.1173928, -1.837129, -4.794026, 0, 1, 0.772549, 1,
-0.1165325, -0.7266532, -1.694084, 0, 1, 0.7764706, 1,
-0.1163319, 1.128654, -0.267827, 0, 1, 0.7843137, 1,
-0.112158, -1.671667, -2.556858, 0, 1, 0.7882353, 1,
-0.1066954, -0.2100333, -2.247174, 0, 1, 0.7960784, 1,
-0.1055362, 0.5608381, -0.6527938, 0, 1, 0.8039216, 1,
-0.1048801, 0.6348101, 0.2137235, 0, 1, 0.8078431, 1,
-0.1032047, -0.3971554, -2.785773, 0, 1, 0.8156863, 1,
-0.1021845, -0.2090469, -3.159902, 0, 1, 0.8196079, 1,
-0.1005143, -0.6993392, -2.470869, 0, 1, 0.827451, 1,
-0.09113241, -1.028933, -3.513905, 0, 1, 0.8313726, 1,
-0.08816706, 0.2612718, -0.3224624, 0, 1, 0.8392157, 1,
-0.08578153, -0.1633319, -4.070539, 0, 1, 0.8431373, 1,
-0.08281493, -0.3225793, -2.219182, 0, 1, 0.8509804, 1,
-0.08143727, -1.061511, -4.546351, 0, 1, 0.854902, 1,
-0.08128778, 0.8880184, 1.198413, 0, 1, 0.8627451, 1,
-0.07918055, 1.421203, -0.5013822, 0, 1, 0.8666667, 1,
-0.07066775, 0.5168837, 0.005004856, 0, 1, 0.8745098, 1,
-0.06993331, -0.141735, -2.514502, 0, 1, 0.8784314, 1,
-0.06853557, -0.8021573, -2.860168, 0, 1, 0.8862745, 1,
-0.06450685, 0.8020386, -0.8889978, 0, 1, 0.8901961, 1,
-0.0631333, -0.3916438, -3.107611, 0, 1, 0.8980392, 1,
-0.06243237, 0.7947263, 0.915446, 0, 1, 0.9058824, 1,
-0.06210076, -0.08946696, -3.498081, 0, 1, 0.9098039, 1,
-0.06124843, -1.027085, -2.522462, 0, 1, 0.9176471, 1,
-0.05716687, -0.8810716, -3.251179, 0, 1, 0.9215686, 1,
-0.05588774, 0.3011478, -1.687113, 0, 1, 0.9294118, 1,
-0.04955085, -0.5156493, -1.233716, 0, 1, 0.9333333, 1,
-0.04409483, 1.522138, 1.624259, 0, 1, 0.9411765, 1,
-0.0432439, -1.840914, -4.005025, 0, 1, 0.945098, 1,
-0.04298424, -1.036978, -3.873092, 0, 1, 0.9529412, 1,
-0.04199708, 0.244083, -0.7733337, 0, 1, 0.9568627, 1,
-0.04074161, -1.76827, -3.31427, 0, 1, 0.9647059, 1,
-0.03750334, -0.449976, -4.449384, 0, 1, 0.9686275, 1,
-0.03494485, 2.183444, 1.322334, 0, 1, 0.9764706, 1,
-0.02497276, 0.119858, 0.9341773, 0, 1, 0.9803922, 1,
-0.02231665, 0.06136697, 0.0380152, 0, 1, 0.9882353, 1,
-0.021052, -0.4144126, -1.718044, 0, 1, 0.9921569, 1,
-0.02000078, -1.282668, -1.877809, 0, 1, 1, 1,
-0.01666358, 1.192059, -1.664362, 0, 0.9921569, 1, 1,
-0.01402209, -1.523534, -2.262379, 0, 0.9882353, 1, 1,
-0.01205927, -0.2018109, -4.646516, 0, 0.9803922, 1, 1,
-0.007756098, -2.103288, -2.329324, 0, 0.9764706, 1, 1,
-0.006811069, -0.4818408, -2.599647, 0, 0.9686275, 1, 1,
-0.002642524, -0.01492741, -2.412256, 0, 0.9647059, 1, 1,
-0.002291229, -0.6382743, -3.991268, 0, 0.9568627, 1, 1,
-0.0008679666, 2.050759, 0.5663532, 0, 0.9529412, 1, 1,
-0.0008324247, -0.8892246, -4.940271, 0, 0.945098, 1, 1,
0.005554261, 0.2306081, -0.8177627, 0, 0.9411765, 1, 1,
0.01656018, -1.069554, 3.147968, 0, 0.9333333, 1, 1,
0.01704045, -0.6288992, 3.641699, 0, 0.9294118, 1, 1,
0.01809954, 1.968726, -1.267551, 0, 0.9215686, 1, 1,
0.02116103, -0.3425704, 3.888926, 0, 0.9176471, 1, 1,
0.02126871, -1.34368, 3.358395, 0, 0.9098039, 1, 1,
0.02174635, 0.877566, -0.03413101, 0, 0.9058824, 1, 1,
0.02208395, 0.425544, 0.5533477, 0, 0.8980392, 1, 1,
0.02298966, -0.1913813, 2.942267, 0, 0.8901961, 1, 1,
0.02459787, 2.345585, 0.804835, 0, 0.8862745, 1, 1,
0.02869458, 0.2709826, 1.684252, 0, 0.8784314, 1, 1,
0.02972352, -0.2601402, 3.119868, 0, 0.8745098, 1, 1,
0.03175502, 0.8696661, 1.260072, 0, 0.8666667, 1, 1,
0.03308569, 1.241799, 1.041892, 0, 0.8627451, 1, 1,
0.04252763, -1.480171, 3.436936, 0, 0.854902, 1, 1,
0.04285271, 0.8338334, -2.049862, 0, 0.8509804, 1, 1,
0.04908438, -0.2957544, 2.757463, 0, 0.8431373, 1, 1,
0.05017669, 0.196367, 0.2800645, 0, 0.8392157, 1, 1,
0.05473801, 0.8228187, 1.734429, 0, 0.8313726, 1, 1,
0.05687033, 0.07643718, 1.798277, 0, 0.827451, 1, 1,
0.05688698, -0.9691091, 2.778592, 0, 0.8196079, 1, 1,
0.0570903, 0.7897063, -0.4743778, 0, 0.8156863, 1, 1,
0.05714968, 1.512776, 1.378325, 0, 0.8078431, 1, 1,
0.05793832, -1.189796, 2.889632, 0, 0.8039216, 1, 1,
0.05862179, -0.3099307, 1.530836, 0, 0.7960784, 1, 1,
0.05951526, -0.002778571, 1.354555, 0, 0.7882353, 1, 1,
0.06009914, -0.5286933, 4.214874, 0, 0.7843137, 1, 1,
0.06150897, -0.8251348, 1.212637, 0, 0.7764706, 1, 1,
0.06460544, -0.5853799, 1.787178, 0, 0.772549, 1, 1,
0.06589577, -1.463276, 2.774961, 0, 0.7647059, 1, 1,
0.06697928, 0.7870386, 0.7471945, 0, 0.7607843, 1, 1,
0.06779567, 1.399944, -0.2743065, 0, 0.7529412, 1, 1,
0.06940665, -0.4175381, 2.704201, 0, 0.7490196, 1, 1,
0.07010616, 0.08362449, -0.1067166, 0, 0.7411765, 1, 1,
0.07105745, -2.543334, 3.263464, 0, 0.7372549, 1, 1,
0.07481205, 0.1261679, -0.8646827, 0, 0.7294118, 1, 1,
0.07518382, -0.7831255, 3.087978, 0, 0.7254902, 1, 1,
0.07820895, -0.06405833, 4.436049, 0, 0.7176471, 1, 1,
0.07888185, 0.3233891, 0.600095, 0, 0.7137255, 1, 1,
0.08360159, 0.9031945, 1.299235, 0, 0.7058824, 1, 1,
0.09244759, -0.4450297, 2.893598, 0, 0.6980392, 1, 1,
0.09267183, -0.3471769, 3.800909, 0, 0.6941177, 1, 1,
0.09441426, 1.182533, 0.9284389, 0, 0.6862745, 1, 1,
0.09571056, 0.006781059, 2.736367, 0, 0.682353, 1, 1,
0.09688168, -0.6910773, 5.375144, 0, 0.6745098, 1, 1,
0.09885589, 0.2340347, 1.239303, 0, 0.6705883, 1, 1,
0.10315, 0.2826517, 0.6449743, 0, 0.6627451, 1, 1,
0.1042378, 0.3649381, -1.454387, 0, 0.6588235, 1, 1,
0.1081203, -1.26751, 2.917143, 0, 0.6509804, 1, 1,
0.1103193, 0.3269305, 2.049372, 0, 0.6470588, 1, 1,
0.1116774, -0.6448314, 3.061576, 0, 0.6392157, 1, 1,
0.1121989, 0.1946321, 1.510552, 0, 0.6352941, 1, 1,
0.1271348, 0.02592609, 1.371691, 0, 0.627451, 1, 1,
0.1285496, 0.02932903, 1.796951, 0, 0.6235294, 1, 1,
0.1297238, 1.421167, -0.9777501, 0, 0.6156863, 1, 1,
0.1299856, -0.6332197, 2.184352, 0, 0.6117647, 1, 1,
0.1344747, 0.2161314, 0.2399227, 0, 0.6039216, 1, 1,
0.1366262, 0.8945953, 0.02828004, 0, 0.5960785, 1, 1,
0.1393126, -0.1576828, 2.500519, 0, 0.5921569, 1, 1,
0.1394677, 0.6401429, -1.236817, 0, 0.5843138, 1, 1,
0.1512711, -0.4866343, 4.144092, 0, 0.5803922, 1, 1,
0.1524895, -0.4973206, 3.283678, 0, 0.572549, 1, 1,
0.1651892, 1.292742, 0.4373247, 0, 0.5686275, 1, 1,
0.1656291, -0.2004454, 2.678066, 0, 0.5607843, 1, 1,
0.1658263, 0.08875406, 2.377069, 0, 0.5568628, 1, 1,
0.1666297, -0.7629718, 2.820991, 0, 0.5490196, 1, 1,
0.1676396, 1.009317, 2.188353, 0, 0.5450981, 1, 1,
0.1700835, -0.9058914, 3.758162, 0, 0.5372549, 1, 1,
0.1707489, 0.05843565, 0.2601777, 0, 0.5333334, 1, 1,
0.1715848, -0.7143863, 4.252678, 0, 0.5254902, 1, 1,
0.1788701, 0.1301754, 0.663353, 0, 0.5215687, 1, 1,
0.1852868, 0.02200539, 1.820106, 0, 0.5137255, 1, 1,
0.1873767, 1.116491, -1.070153, 0, 0.509804, 1, 1,
0.189547, 0.8815684, 2.07217, 0, 0.5019608, 1, 1,
0.1922767, -0.9969401, 4.364874, 0, 0.4941176, 1, 1,
0.1936477, -0.61123, 4.130958, 0, 0.4901961, 1, 1,
0.1956451, -0.6910453, 3.407534, 0, 0.4823529, 1, 1,
0.196482, 1.018104, 0.3538941, 0, 0.4784314, 1, 1,
0.1968807, 1.015147, -1.367171, 0, 0.4705882, 1, 1,
0.2007812, 2.294716, -0.7660652, 0, 0.4666667, 1, 1,
0.203235, -0.3094068, 1.970423, 0, 0.4588235, 1, 1,
0.2037487, 0.7898223, 0.516923, 0, 0.454902, 1, 1,
0.2122817, -0.1767119, 1.49943, 0, 0.4470588, 1, 1,
0.2142608, -2.285801, 2.892972, 0, 0.4431373, 1, 1,
0.2155767, 0.5972143, -0.4297452, 0, 0.4352941, 1, 1,
0.2179089, -1.892096, 3.165168, 0, 0.4313726, 1, 1,
0.2184563, 0.2828836, 1.978, 0, 0.4235294, 1, 1,
0.2187777, 1.406375, -0.5916638, 0, 0.4196078, 1, 1,
0.2222533, 0.6884395, 0.6484062, 0, 0.4117647, 1, 1,
0.2223352, 0.07352643, 0.8313166, 0, 0.4078431, 1, 1,
0.2284495, -1.809245, 4.555253, 0, 0.4, 1, 1,
0.2312775, -1.458968, 2.56117, 0, 0.3921569, 1, 1,
0.2318644, 1.113587, 1.227844, 0, 0.3882353, 1, 1,
0.2340435, -0.3550292, 3.465681, 0, 0.3803922, 1, 1,
0.2361712, 1.15922, -0.07378934, 0, 0.3764706, 1, 1,
0.2363748, -0.9911533, 1.328204, 0, 0.3686275, 1, 1,
0.2369304, 0.8474481, 1.114467, 0, 0.3647059, 1, 1,
0.2385385, -1.25824, 3.092071, 0, 0.3568628, 1, 1,
0.2393296, -1.630268, 1.733905, 0, 0.3529412, 1, 1,
0.2404748, -0.9325936, 3.315087, 0, 0.345098, 1, 1,
0.247276, 1.089219, -1.161929, 0, 0.3411765, 1, 1,
0.2490189, -0.09820165, 2.663646, 0, 0.3333333, 1, 1,
0.2492688, 0.6991105, -1.816943, 0, 0.3294118, 1, 1,
0.2525069, -0.7019005, 2.674828, 0, 0.3215686, 1, 1,
0.2526217, 0.6826515, 0.5221593, 0, 0.3176471, 1, 1,
0.2527145, -0.8720486, 2.267784, 0, 0.3098039, 1, 1,
0.2574394, -0.2276831, 3.594746, 0, 0.3058824, 1, 1,
0.2575166, 2.409023, -1.371515, 0, 0.2980392, 1, 1,
0.2592476, -0.5767729, 2.237022, 0, 0.2901961, 1, 1,
0.2627513, 0.9776928, -0.3286116, 0, 0.2862745, 1, 1,
0.2637558, -0.5086483, 3.079489, 0, 0.2784314, 1, 1,
0.2642382, -1.410243, 2.568831, 0, 0.2745098, 1, 1,
0.2672359, 1.283375, 0.04030672, 0, 0.2666667, 1, 1,
0.270733, 0.6591305, 1.88684, 0, 0.2627451, 1, 1,
0.2746879, 0.7228119, 1.294127, 0, 0.254902, 1, 1,
0.2755141, 0.4915648, 1.160574, 0, 0.2509804, 1, 1,
0.2766277, 0.8477369, -0.5282468, 0, 0.2431373, 1, 1,
0.2768733, 0.1295348, 1.538937, 0, 0.2392157, 1, 1,
0.2791018, 0.2653463, -0.06101632, 0, 0.2313726, 1, 1,
0.2851031, 0.4048935, 1.859647, 0, 0.227451, 1, 1,
0.2875091, 0.288686, 0.9536675, 0, 0.2196078, 1, 1,
0.2941261, 0.3579423, 0.7019628, 0, 0.2156863, 1, 1,
0.29796, 0.341447, 0.842938, 0, 0.2078431, 1, 1,
0.3041209, 0.6979819, 0.2547659, 0, 0.2039216, 1, 1,
0.3056367, 1.730324, -0.09895094, 0, 0.1960784, 1, 1,
0.3096029, -1.539568, 1.815366, 0, 0.1882353, 1, 1,
0.309626, -0.6446919, 2.211945, 0, 0.1843137, 1, 1,
0.3101206, 0.2081047, 0.06680033, 0, 0.1764706, 1, 1,
0.3112184, 2.063058, -0.3556135, 0, 0.172549, 1, 1,
0.316229, 0.9643821, -0.04248169, 0, 0.1647059, 1, 1,
0.3176258, -1.780982, 3.188578, 0, 0.1607843, 1, 1,
0.3180555, 1.358876, 0.2670045, 0, 0.1529412, 1, 1,
0.3195574, -0.7357593, 1.333509, 0, 0.1490196, 1, 1,
0.3214588, -0.7846122, 2.799526, 0, 0.1411765, 1, 1,
0.3233728, 1.685628, -0.05581794, 0, 0.1372549, 1, 1,
0.325318, -1.87057, 4.334682, 0, 0.1294118, 1, 1,
0.3276169, -0.786113, 3.27478, 0, 0.1254902, 1, 1,
0.3302682, 0.6884981, 0.7493988, 0, 0.1176471, 1, 1,
0.3354376, 1.027744, 0.2015227, 0, 0.1137255, 1, 1,
0.335647, -0.1239459, 3.226632, 0, 0.1058824, 1, 1,
0.3372548, 0.2298262, -0.3760027, 0, 0.09803922, 1, 1,
0.3431983, -1.513596, 4.910324, 0, 0.09411765, 1, 1,
0.3436876, -0.936885, 4.25428, 0, 0.08627451, 1, 1,
0.3487835, 0.389264, 0.7635143, 0, 0.08235294, 1, 1,
0.3499695, -0.8563929, 0.31121, 0, 0.07450981, 1, 1,
0.3503898, 0.9176179, -1.733231, 0, 0.07058824, 1, 1,
0.3526299, 1.566884, 0.6882835, 0, 0.0627451, 1, 1,
0.355864, -0.4105943, 2.374222, 0, 0.05882353, 1, 1,
0.3606783, 1.279351, 0.4358673, 0, 0.05098039, 1, 1,
0.3749509, 1.04278, -1.142863, 0, 0.04705882, 1, 1,
0.3753564, 0.3707999, 1.284621, 0, 0.03921569, 1, 1,
0.3768824, -0.1444603, 1.244016, 0, 0.03529412, 1, 1,
0.3778776, -0.421848, 1.509179, 0, 0.02745098, 1, 1,
0.3809878, -0.2566222, 1.195642, 0, 0.02352941, 1, 1,
0.3822738, 1.245556, -0.1057651, 0, 0.01568628, 1, 1,
0.3854287, -0.146822, 1.52207, 0, 0.01176471, 1, 1,
0.3865549, 0.02443723, 2.073393, 0, 0.003921569, 1, 1,
0.3883808, 0.3409043, 0.3338979, 0.003921569, 0, 1, 1,
0.3895695, 1.550758, 0.4356768, 0.007843138, 0, 1, 1,
0.3903187, 0.7834324, 1.19909, 0.01568628, 0, 1, 1,
0.4011919, -0.2739634, 1.433312, 0.01960784, 0, 1, 1,
0.4021267, 1.428293, -0.01423991, 0.02745098, 0, 1, 1,
0.4032586, -0.8231323, 2.720456, 0.03137255, 0, 1, 1,
0.403666, -1.150263, 2.952812, 0.03921569, 0, 1, 1,
0.4056449, -1.138125, 2.789796, 0.04313726, 0, 1, 1,
0.4061536, -0.3039261, 4.970908, 0.05098039, 0, 1, 1,
0.4086216, -0.1132868, 0.2637321, 0.05490196, 0, 1, 1,
0.412031, 0.1422779, 1.739278, 0.0627451, 0, 1, 1,
0.4161895, 1.294776, 1.493677, 0.06666667, 0, 1, 1,
0.4185353, -1.062321, 3.951555, 0.07450981, 0, 1, 1,
0.4189922, -0.3973206, 2.24897, 0.07843138, 0, 1, 1,
0.4195606, 2.12888, -0.6642022, 0.08627451, 0, 1, 1,
0.422571, 1.338378, 1.596417, 0.09019608, 0, 1, 1,
0.4258623, -1.181479, 1.71003, 0.09803922, 0, 1, 1,
0.4305049, 0.9017687, 0.2377162, 0.1058824, 0, 1, 1,
0.4328535, -0.9421876, 0.4436053, 0.1098039, 0, 1, 1,
0.4383584, 0.1052373, 2.671825, 0.1176471, 0, 1, 1,
0.4404248, -1.169, 2.865301, 0.1215686, 0, 1, 1,
0.4408782, 1.341123, 1.260609, 0.1294118, 0, 1, 1,
0.4409904, 0.8825407, 0.7240781, 0.1333333, 0, 1, 1,
0.4427293, -0.4179251, 1.904814, 0.1411765, 0, 1, 1,
0.443208, -0.6071069, 3.046278, 0.145098, 0, 1, 1,
0.4445943, -0.737792, 3.745663, 0.1529412, 0, 1, 1,
0.4471449, 0.1129198, 1.141693, 0.1568628, 0, 1, 1,
0.4482315, 0.2350571, 1.492758, 0.1647059, 0, 1, 1,
0.4490714, 0.7374942, 0.03583183, 0.1686275, 0, 1, 1,
0.4526533, -0.7292035, 1.587195, 0.1764706, 0, 1, 1,
0.4547268, -0.5369932, 1.151889, 0.1803922, 0, 1, 1,
0.4566177, 0.03615795, 0.8294268, 0.1882353, 0, 1, 1,
0.457287, 0.005252791, 1.632204, 0.1921569, 0, 1, 1,
0.4601267, 0.9481292, -0.000796105, 0.2, 0, 1, 1,
0.4647879, 0.8394528, 0.3404898, 0.2078431, 0, 1, 1,
0.4657035, -1.525465, 2.304122, 0.2117647, 0, 1, 1,
0.4696412, 1.292524, -0.6617116, 0.2196078, 0, 1, 1,
0.4724323, -0.2896377, 0.7769331, 0.2235294, 0, 1, 1,
0.4773356, 0.949741, 1.740935, 0.2313726, 0, 1, 1,
0.4781649, 0.7917576, 1.383826, 0.2352941, 0, 1, 1,
0.483169, -0.3800221, 1.266916, 0.2431373, 0, 1, 1,
0.4870039, 0.6129131, 0.8085353, 0.2470588, 0, 1, 1,
0.4881225, -1.376634, 3.118547, 0.254902, 0, 1, 1,
0.4946917, 0.3363929, 1.217321, 0.2588235, 0, 1, 1,
0.4949085, -1.690028, 4.848704, 0.2666667, 0, 1, 1,
0.4983787, 1.044107, -0.3574204, 0.2705882, 0, 1, 1,
0.4984005, -1.167862, 3.61396, 0.2784314, 0, 1, 1,
0.4998034, 0.3200052, 1.50901, 0.282353, 0, 1, 1,
0.499854, 1.596719, -0.8213092, 0.2901961, 0, 1, 1,
0.5007405, 0.4516841, 1.821907, 0.2941177, 0, 1, 1,
0.5021614, 0.8149111, -1.653188, 0.3019608, 0, 1, 1,
0.5114364, -1.322033, 2.498854, 0.3098039, 0, 1, 1,
0.5150199, 1.397766, 0.4029854, 0.3137255, 0, 1, 1,
0.5194032, -1.477808, 3.214403, 0.3215686, 0, 1, 1,
0.521983, 1.340665, 0.169144, 0.3254902, 0, 1, 1,
0.5238176, 0.7933545, -0.4777232, 0.3333333, 0, 1, 1,
0.5244727, -0.01426798, 2.381343, 0.3372549, 0, 1, 1,
0.5256056, -1.060181, 3.500453, 0.345098, 0, 1, 1,
0.5270116, -0.3283837, 1.503376, 0.3490196, 0, 1, 1,
0.5277905, -1.046093, 1.69275, 0.3568628, 0, 1, 1,
0.5286701, -0.8922771, 1.622508, 0.3607843, 0, 1, 1,
0.5292294, 0.7611212, 0.717726, 0.3686275, 0, 1, 1,
0.5329426, 0.8923489, 1.612868, 0.372549, 0, 1, 1,
0.5369639, -1.185691, 4.755253, 0.3803922, 0, 1, 1,
0.5378444, 2.045145, 2.276479, 0.3843137, 0, 1, 1,
0.5408065, -1.785465, 3.779917, 0.3921569, 0, 1, 1,
0.5438157, -1.538134, 1.230987, 0.3960784, 0, 1, 1,
0.5474401, -0.1097874, 2.56006, 0.4039216, 0, 1, 1,
0.5517666, -1.903522, 3.086966, 0.4117647, 0, 1, 1,
0.5578752, -0.5711697, 3.795073, 0.4156863, 0, 1, 1,
0.5583764, -0.03439224, 1.126337, 0.4235294, 0, 1, 1,
0.5697742, 0.6557031, 1.331363, 0.427451, 0, 1, 1,
0.5794273, 1.187629, 0.6562881, 0.4352941, 0, 1, 1,
0.5872608, -1.618218, 3.499773, 0.4392157, 0, 1, 1,
0.5875059, -0.7111851, 2.378464, 0.4470588, 0, 1, 1,
0.5891461, 0.173258, 0.1023358, 0.4509804, 0, 1, 1,
0.5904029, 0.6774827, -0.6054385, 0.4588235, 0, 1, 1,
0.5909044, 3.47219, -0.03857716, 0.4627451, 0, 1, 1,
0.591898, 1.027195, -0.7834744, 0.4705882, 0, 1, 1,
0.5926712, -0.7416728, 2.57616, 0.4745098, 0, 1, 1,
0.6045416, 1.43283, 1.080649, 0.4823529, 0, 1, 1,
0.6059349, -0.5280027, 1.490559, 0.4862745, 0, 1, 1,
0.6077895, 0.1678797, 1.158717, 0.4941176, 0, 1, 1,
0.6083936, 1.237058, -1.732306, 0.5019608, 0, 1, 1,
0.608535, -0.7918285, 1.333528, 0.5058824, 0, 1, 1,
0.6101244, -0.6361663, 1.840358, 0.5137255, 0, 1, 1,
0.6149219, -0.00868826, 3.972855, 0.5176471, 0, 1, 1,
0.617163, 1.164186, 0.5078168, 0.5254902, 0, 1, 1,
0.622068, -1.176415, 4.640523, 0.5294118, 0, 1, 1,
0.6276892, 2.02861, 0.1075104, 0.5372549, 0, 1, 1,
0.6369673, -1.067431, 2.654812, 0.5411765, 0, 1, 1,
0.6377634, 0.5295679, -0.3082075, 0.5490196, 0, 1, 1,
0.6381284, -1.259793, 2.684173, 0.5529412, 0, 1, 1,
0.6411461, -0.3347489, 3.492086, 0.5607843, 0, 1, 1,
0.6516278, -2.24055, 4.596033, 0.5647059, 0, 1, 1,
0.6533706, 1.028271, 0.6670031, 0.572549, 0, 1, 1,
0.6629182, -0.6170182, 2.993682, 0.5764706, 0, 1, 1,
0.6631225, 2.100606, 2.499017, 0.5843138, 0, 1, 1,
0.6718218, -0.06017631, 2.976514, 0.5882353, 0, 1, 1,
0.6740902, 0.3583644, 0.7740372, 0.5960785, 0, 1, 1,
0.6756771, -1.007462, 2.75422, 0.6039216, 0, 1, 1,
0.6757708, 1.135827, 0.4435897, 0.6078432, 0, 1, 1,
0.6869318, 0.2655662, 1.335737, 0.6156863, 0, 1, 1,
0.6892809, -0.0950423, 2.119176, 0.6196079, 0, 1, 1,
0.6914244, -0.9633322, 3.702274, 0.627451, 0, 1, 1,
0.7115297, -0.4294673, 2.09133, 0.6313726, 0, 1, 1,
0.7139512, 0.2125692, 0.3379577, 0.6392157, 0, 1, 1,
0.7163965, -0.707539, 3.664086, 0.6431373, 0, 1, 1,
0.7206933, -1.210051, 1.810399, 0.6509804, 0, 1, 1,
0.7207432, -0.5847454, 3.765538, 0.654902, 0, 1, 1,
0.7275454, -0.9733624, 3.216021, 0.6627451, 0, 1, 1,
0.7278675, 1.700463, -0.1651694, 0.6666667, 0, 1, 1,
0.7282623, 1.413941, 2.745081, 0.6745098, 0, 1, 1,
0.7289445, 0.3433506, 0.5371893, 0.6784314, 0, 1, 1,
0.7317392, 0.8792734, 0.004063081, 0.6862745, 0, 1, 1,
0.7364189, -1.635463, 2.074801, 0.6901961, 0, 1, 1,
0.743122, -1.322467, 0.4992203, 0.6980392, 0, 1, 1,
0.7500208, 0.2972374, 0.5852225, 0.7058824, 0, 1, 1,
0.7503283, -0.397212, 2.269482, 0.7098039, 0, 1, 1,
0.7529632, -0.9055296, 3.487569, 0.7176471, 0, 1, 1,
0.753472, 0.1975007, 1.222216, 0.7215686, 0, 1, 1,
0.7541556, -0.5041854, 4.333658, 0.7294118, 0, 1, 1,
0.756658, -0.7360671, 2.300901, 0.7333333, 0, 1, 1,
0.757411, 0.7894402, 2.068063, 0.7411765, 0, 1, 1,
0.7584823, 0.05811248, -0.4000485, 0.7450981, 0, 1, 1,
0.7604775, 0.2582287, 0.568673, 0.7529412, 0, 1, 1,
0.7638769, 1.99494, 0.1934469, 0.7568628, 0, 1, 1,
0.7706369, 0.06151803, 1.268454, 0.7647059, 0, 1, 1,
0.7715697, 2.034775, 2.106064, 0.7686275, 0, 1, 1,
0.7729724, -0.7350118, 3.013634, 0.7764706, 0, 1, 1,
0.7792233, -0.2130769, 0.8959311, 0.7803922, 0, 1, 1,
0.7816834, -1.463538, 2.712872, 0.7882353, 0, 1, 1,
0.7824905, -0.872857, 1.76116, 0.7921569, 0, 1, 1,
0.7873321, -0.3847812, 3.191872, 0.8, 0, 1, 1,
0.7893775, 0.2998316, -1.239346, 0.8078431, 0, 1, 1,
0.7907825, -1.802871, 2.624097, 0.8117647, 0, 1, 1,
0.7937275, -1.978451, 4.437554, 0.8196079, 0, 1, 1,
0.7986138, -1.44458, 2.333187, 0.8235294, 0, 1, 1,
0.8031866, -0.1410979, 2.451787, 0.8313726, 0, 1, 1,
0.8079323, -0.2692894, 2.529459, 0.8352941, 0, 1, 1,
0.8080048, -0.5703333, 2.56715, 0.8431373, 0, 1, 1,
0.8082477, 0.5703201, 2.921784, 0.8470588, 0, 1, 1,
0.8160344, 0.4522742, 1.244257, 0.854902, 0, 1, 1,
0.8176907, -0.07725867, 1.114899, 0.8588235, 0, 1, 1,
0.820816, 1.103293, -0.6996045, 0.8666667, 0, 1, 1,
0.8212085, -0.9416112, 2.055835, 0.8705882, 0, 1, 1,
0.8229331, -1.136295, 3.845539, 0.8784314, 0, 1, 1,
0.8236742, 0.08000457, 1.573414, 0.8823529, 0, 1, 1,
0.8240814, 0.2206698, 0.7899467, 0.8901961, 0, 1, 1,
0.8382257, -0.02886913, 2.891572, 0.8941177, 0, 1, 1,
0.8417631, -1.046252, 1.967935, 0.9019608, 0, 1, 1,
0.8561204, 1.447605, 0.224663, 0.9098039, 0, 1, 1,
0.8625764, 1.178695, 2.197973, 0.9137255, 0, 1, 1,
0.8638816, -0.5725837, 2.7477, 0.9215686, 0, 1, 1,
0.8644562, 1.749208, 0.05567252, 0.9254902, 0, 1, 1,
0.865433, 1.387851, -0.549372, 0.9333333, 0, 1, 1,
0.8666966, -1.472041, 3.391381, 0.9372549, 0, 1, 1,
0.8698338, -1.240211, 1.327327, 0.945098, 0, 1, 1,
0.8731669, -0.9700818, 3.517337, 0.9490196, 0, 1, 1,
0.8756827, 1.057871, 1.021822, 0.9568627, 0, 1, 1,
0.8960066, 0.219373, 1.249964, 0.9607843, 0, 1, 1,
0.8976906, -0.3448964, 2.141963, 0.9686275, 0, 1, 1,
0.8979212, 0.06729326, 0.996592, 0.972549, 0, 1, 1,
0.9012263, 0.06857917, 1.106524, 0.9803922, 0, 1, 1,
0.9029491, -0.8865733, 2.3266, 0.9843137, 0, 1, 1,
0.9046945, 0.3120537, 1.964646, 0.9921569, 0, 1, 1,
0.9111435, 0.1203867, 2.899665, 0.9960784, 0, 1, 1,
0.9184316, 0.6688936, 1.294871, 1, 0, 0.9960784, 1,
0.9198956, 1.297099, -0.8373427, 1, 0, 0.9882353, 1,
0.9221646, 0.718368, 1.153917, 1, 0, 0.9843137, 1,
0.9246557, 0.4823186, 1.211695, 1, 0, 0.9764706, 1,
0.9343251, 2.850378, 0.6249256, 1, 0, 0.972549, 1,
0.9358426, -1.594061, 1.742311, 1, 0, 0.9647059, 1,
0.9428383, 0.4166715, 4.342749, 1, 0, 0.9607843, 1,
0.9542308, 1.360154, 1.293342, 1, 0, 0.9529412, 1,
0.9597093, 2.204705, -0.7985098, 1, 0, 0.9490196, 1,
0.9613002, 0.6371397, 1.464057, 1, 0, 0.9411765, 1,
0.9694937, 0.1193147, 0.5055609, 1, 0, 0.9372549, 1,
0.9781646, 0.6088383, -0.189953, 1, 0, 0.9294118, 1,
0.9817357, 0.245604, 2.28525, 1, 0, 0.9254902, 1,
0.9864078, 0.9518059, -0.7065797, 1, 0, 0.9176471, 1,
0.9873629, 0.2982246, 2.051955, 1, 0, 0.9137255, 1,
0.9883589, -0.788139, 1.944793, 1, 0, 0.9058824, 1,
0.9963806, -0.044404, -1.246609, 1, 0, 0.9019608, 1,
0.9963826, -1.621575, 1.949716, 1, 0, 0.8941177, 1,
0.9977895, -0.4249018, 1.608701, 1, 0, 0.8862745, 1,
1.002129, 0.5078394, 0.1552249, 1, 0, 0.8823529, 1,
1.015362, -0.5289856, 2.292696, 1, 0, 0.8745098, 1,
1.020062, -1.318136, 2.80337, 1, 0, 0.8705882, 1,
1.0223, -0.1826313, 3.321448, 1, 0, 0.8627451, 1,
1.031634, -0.9780016, 2.373594, 1, 0, 0.8588235, 1,
1.03466, 1.419663, 0.8499998, 1, 0, 0.8509804, 1,
1.035071, 1.018011, 2.884874, 1, 0, 0.8470588, 1,
1.040774, -1.30522, 2.779213, 1, 0, 0.8392157, 1,
1.048742, -0.3011731, 2.721272, 1, 0, 0.8352941, 1,
1.052124, -1.754589, 0.8983905, 1, 0, 0.827451, 1,
1.058366, -1.83519, 1.374175, 1, 0, 0.8235294, 1,
1.058385, -0.2758628, 1.256409, 1, 0, 0.8156863, 1,
1.060281, -0.0675241, 3.419538, 1, 0, 0.8117647, 1,
1.060456, 0.2276623, 3.719424, 1, 0, 0.8039216, 1,
1.061749, 0.9564829, 1.751018, 1, 0, 0.7960784, 1,
1.066215, 0.4622625, 1.08639, 1, 0, 0.7921569, 1,
1.066644, 1.86967, 0.138832, 1, 0, 0.7843137, 1,
1.067001, 0.3819858, 1.008298, 1, 0, 0.7803922, 1,
1.070922, -0.2641907, 1.877484, 1, 0, 0.772549, 1,
1.073649, -1.60866, 3.628927, 1, 0, 0.7686275, 1,
1.075535, 0.2136989, 2.377107, 1, 0, 0.7607843, 1,
1.078459, 0.5084837, 0.4925551, 1, 0, 0.7568628, 1,
1.085936, 0.8610126, 1.145428, 1, 0, 0.7490196, 1,
1.089955, 1.092369, 1.830753, 1, 0, 0.7450981, 1,
1.092735, -0.6816981, 1.535801, 1, 0, 0.7372549, 1,
1.096701, 0.5914273, 1.773897, 1, 0, 0.7333333, 1,
1.098831, 1.111689, 1.116749, 1, 0, 0.7254902, 1,
1.103315, -1.836378, 2.457763, 1, 0, 0.7215686, 1,
1.110498, 0.8116975, 0.6701404, 1, 0, 0.7137255, 1,
1.11368, 0.3357936, -0.2137709, 1, 0, 0.7098039, 1,
1.120476, 0.2629409, 0.1953699, 1, 0, 0.7019608, 1,
1.125276, 0.5479741, 1.319599, 1, 0, 0.6941177, 1,
1.12642, 1.020877, 2.027396, 1, 0, 0.6901961, 1,
1.142184, 1.562537, 0.8814033, 1, 0, 0.682353, 1,
1.146043, -1.467242, 3.01622, 1, 0, 0.6784314, 1,
1.146704, 0.2549533, 1.734978, 1, 0, 0.6705883, 1,
1.151239, -0.4470479, 0.8958312, 1, 0, 0.6666667, 1,
1.172438, 1.766379, 1.826874, 1, 0, 0.6588235, 1,
1.176794, -0.02491206, 2.542736, 1, 0, 0.654902, 1,
1.177252, 0.2343333, 0.6655211, 1, 0, 0.6470588, 1,
1.18047, 0.6355186, 0.2618241, 1, 0, 0.6431373, 1,
1.182111, 0.9338857, 0.3287587, 1, 0, 0.6352941, 1,
1.206458, -0.8262025, 0.3751216, 1, 0, 0.6313726, 1,
1.214769, 0.3301791, 2.592334, 1, 0, 0.6235294, 1,
1.219777, 1.188617, 1.199047, 1, 0, 0.6196079, 1,
1.229698, -0.7919309, 3.97476, 1, 0, 0.6117647, 1,
1.237113, -1.217938, 1.22684, 1, 0, 0.6078432, 1,
1.256812, -1.475786, 2.231664, 1, 0, 0.6, 1,
1.267288, 0.1692774, 1.317488, 1, 0, 0.5921569, 1,
1.267828, -0.1393439, 2.060552, 1, 0, 0.5882353, 1,
1.273871, 1.511449, 0.3342228, 1, 0, 0.5803922, 1,
1.274833, 0.04146419, 2.186186, 1, 0, 0.5764706, 1,
1.279307, -0.6333644, 2.684767, 1, 0, 0.5686275, 1,
1.294538, 0.9824314, -0.31019, 1, 0, 0.5647059, 1,
1.295961, -2.120061, 1.73331, 1, 0, 0.5568628, 1,
1.296934, -0.9399737, 2.455495, 1, 0, 0.5529412, 1,
1.302164, 1.301382, -0.3024904, 1, 0, 0.5450981, 1,
1.317427, -0.5382226, 3.325718, 1, 0, 0.5411765, 1,
1.31935, 0.5745732, 2.626511, 1, 0, 0.5333334, 1,
1.324975, 0.08453361, 0.6408486, 1, 0, 0.5294118, 1,
1.32763, 0.7857485, 1.78771, 1, 0, 0.5215687, 1,
1.337319, 0.09033724, 0.6238004, 1, 0, 0.5176471, 1,
1.338709, -0.1811101, 0.7875101, 1, 0, 0.509804, 1,
1.348626, -0.5469339, 2.26212, 1, 0, 0.5058824, 1,
1.353397, 0.2737384, 3.477252, 1, 0, 0.4980392, 1,
1.359316, -1.044566, 2.754308, 1, 0, 0.4901961, 1,
1.36156, 1.24764, 0.1413664, 1, 0, 0.4862745, 1,
1.366144, -1.411483, 1.740941, 1, 0, 0.4784314, 1,
1.366434, 0.1777467, 0.741261, 1, 0, 0.4745098, 1,
1.368162, -0.07363714, 0.238714, 1, 0, 0.4666667, 1,
1.370062, -0.705539, 2.603606, 1, 0, 0.4627451, 1,
1.383676, -0.8598841, 2.924111, 1, 0, 0.454902, 1,
1.396676, -0.6040722, 3.345928, 1, 0, 0.4509804, 1,
1.399345, -0.8767008, 2.877975, 1, 0, 0.4431373, 1,
1.401433, 0.9480188, -1.052637, 1, 0, 0.4392157, 1,
1.406102, 0.4146665, 0.5225526, 1, 0, 0.4313726, 1,
1.408391, 0.9171613, 1.608506, 1, 0, 0.427451, 1,
1.409609, -0.9873718, 2.587653, 1, 0, 0.4196078, 1,
1.417478, 0.383662, 1.47807, 1, 0, 0.4156863, 1,
1.437521, -1.930617, 4.299768, 1, 0, 0.4078431, 1,
1.440713, -0.5742093, 1.547689, 1, 0, 0.4039216, 1,
1.473048, -0.5078856, 1.47077, 1, 0, 0.3960784, 1,
1.48032, 0.8512593, 1.689313, 1, 0, 0.3882353, 1,
1.496629, -0.9747811, 2.660189, 1, 0, 0.3843137, 1,
1.502648, 0.7636851, 1.413487, 1, 0, 0.3764706, 1,
1.507498, -0.7495668, 3.019788, 1, 0, 0.372549, 1,
1.515397, -0.8424203, 1.425775, 1, 0, 0.3647059, 1,
1.528366, 1.417455, 1.24563, 1, 0, 0.3607843, 1,
1.538841, -0.1383167, 1.610524, 1, 0, 0.3529412, 1,
1.555203, 0.01012786, 2.324534, 1, 0, 0.3490196, 1,
1.579203, 1.678391, -0.3189268, 1, 0, 0.3411765, 1,
1.590068, 0.1236532, 0.614507, 1, 0, 0.3372549, 1,
1.600356, 1.021276, 1.152699, 1, 0, 0.3294118, 1,
1.604464, 0.4007481, 1.142052, 1, 0, 0.3254902, 1,
1.607833, -0.1681371, 2.237717, 1, 0, 0.3176471, 1,
1.632802, 0.7193776, 1.54239, 1, 0, 0.3137255, 1,
1.644806, 1.196402, 2.838469, 1, 0, 0.3058824, 1,
1.646683, -0.4688516, 2.121375, 1, 0, 0.2980392, 1,
1.653755, -1.020295, 2.789547, 1, 0, 0.2941177, 1,
1.659431, -0.292614, 1.912464, 1, 0, 0.2862745, 1,
1.681431, -0.1226176, 1.595912, 1, 0, 0.282353, 1,
1.681562, 1.306118, 0.817582, 1, 0, 0.2745098, 1,
1.687547, 0.6321565, 2.034565, 1, 0, 0.2705882, 1,
1.689043, -1.06189, 1.905847, 1, 0, 0.2627451, 1,
1.690143, -1.479329, 2.811627, 1, 0, 0.2588235, 1,
1.695998, 0.08528566, 1.272459, 1, 0, 0.2509804, 1,
1.716323, -1.355854, 2.26304, 1, 0, 0.2470588, 1,
1.721139, -0.1292394, 0.7222125, 1, 0, 0.2392157, 1,
1.731916, -0.5000769, 2.005985, 1, 0, 0.2352941, 1,
1.73452, 0.06216075, 2.480286, 1, 0, 0.227451, 1,
1.736124, -0.4249325, 1.636168, 1, 0, 0.2235294, 1,
1.736273, 1.065344, 1.430947, 1, 0, 0.2156863, 1,
1.742952, 0.6153582, 2.137028, 1, 0, 0.2117647, 1,
1.803357, -0.6401469, 1.915299, 1, 0, 0.2039216, 1,
1.80571, -1.729817, 3.087856, 1, 0, 0.1960784, 1,
1.814673, -0.1045739, 1.116496, 1, 0, 0.1921569, 1,
1.829534, -0.9283455, 3.39934, 1, 0, 0.1843137, 1,
1.836736, -1.143147, 3.328295, 1, 0, 0.1803922, 1,
1.85269, 1.520267, -0.2911218, 1, 0, 0.172549, 1,
1.867425, 0.5122694, 1.09205, 1, 0, 0.1686275, 1,
1.868066, -1.396198, 2.974786, 1, 0, 0.1607843, 1,
1.878439, -0.3557729, 3.536337, 1, 0, 0.1568628, 1,
1.891219, 1.060758, 0.489402, 1, 0, 0.1490196, 1,
1.897061, -0.1355447, 1.259568, 1, 0, 0.145098, 1,
1.903957, -0.9379084, 2.045436, 1, 0, 0.1372549, 1,
1.911725, -0.6237708, 1.745428, 1, 0, 0.1333333, 1,
1.919366, -1.036592, 1.759039, 1, 0, 0.1254902, 1,
1.934295, 0.5827045, 1.084979, 1, 0, 0.1215686, 1,
1.992969, 0.7976542, 3.015212, 1, 0, 0.1137255, 1,
1.995706, -0.7643493, 2.73405, 1, 0, 0.1098039, 1,
2.137112, 0.9840354, 0.8663969, 1, 0, 0.1019608, 1,
2.148503, 0.09391253, 2.718489, 1, 0, 0.09411765, 1,
2.183415, -0.4075755, 0.6200941, 1, 0, 0.09019608, 1,
2.243177, 0.09643181, 0.9724708, 1, 0, 0.08235294, 1,
2.270625, 0.4268928, 3.089818, 1, 0, 0.07843138, 1,
2.316618, 0.7066409, 0.817847, 1, 0, 0.07058824, 1,
2.365852, 2.120149, 0.852092, 1, 0, 0.06666667, 1,
2.42885, -0.01697686, 0.5837198, 1, 0, 0.05882353, 1,
2.445189, 0.4881814, -0.1441991, 1, 0, 0.05490196, 1,
2.449405, -1.247542, 2.843298, 1, 0, 0.04705882, 1,
2.457662, 0.9685763, 0.3110263, 1, 0, 0.04313726, 1,
2.579003, 0.9458029, 0.6509139, 1, 0, 0.03529412, 1,
2.630059, 0.1083026, 0.4819113, 1, 0, 0.03137255, 1,
2.674667, -0.5538737, 2.15037, 1, 0, 0.02352941, 1,
2.722304, -0.167284, -0.4340852, 1, 0, 0.01960784, 1,
2.916247, -0.371457, 1.352082, 1, 0, 0.01176471, 1,
3.212392, 1.133861, 2.520172, 1, 0, 0.007843138, 1
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
0.02047753, -3.936594, -7.090951, 0, -0.5, 0.5, 0.5,
0.02047753, -3.936594, -7.090951, 1, -0.5, 0.5, 0.5,
0.02047753, -3.936594, -7.090951, 1, 1.5, 0.5, 0.5,
0.02047753, -3.936594, -7.090951, 0, 1.5, 0.5, 0.5
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
-4.253496, 0.3046896, -7.090951, 0, -0.5, 0.5, 0.5,
-4.253496, 0.3046896, -7.090951, 1, -0.5, 0.5, 0.5,
-4.253496, 0.3046896, -7.090951, 1, 1.5, 0.5, 0.5,
-4.253496, 0.3046896, -7.090951, 0, 1.5, 0.5, 0.5
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
-4.253496, -3.936594, 0.04547524, 0, -0.5, 0.5, 0.5,
-4.253496, -3.936594, 0.04547524, 1, -0.5, 0.5, 0.5,
-4.253496, -3.936594, 0.04547524, 1, 1.5, 0.5, 0.5,
-4.253496, -3.936594, 0.04547524, 0, 1.5, 0.5, 0.5
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
-3, -2.957836, -5.444084,
3, -2.957836, -5.444084,
-3, -2.957836, -5.444084,
-3, -3.120962, -5.718562,
-2, -2.957836, -5.444084,
-2, -3.120962, -5.718562,
-1, -2.957836, -5.444084,
-1, -3.120962, -5.718562,
0, -2.957836, -5.444084,
0, -3.120962, -5.718562,
1, -2.957836, -5.444084,
1, -3.120962, -5.718562,
2, -2.957836, -5.444084,
2, -3.120962, -5.718562,
3, -2.957836, -5.444084,
3, -3.120962, -5.718562
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
-3, -3.447215, -6.267518, 0, -0.5, 0.5, 0.5,
-3, -3.447215, -6.267518, 1, -0.5, 0.5, 0.5,
-3, -3.447215, -6.267518, 1, 1.5, 0.5, 0.5,
-3, -3.447215, -6.267518, 0, 1.5, 0.5, 0.5,
-2, -3.447215, -6.267518, 0, -0.5, 0.5, 0.5,
-2, -3.447215, -6.267518, 1, -0.5, 0.5, 0.5,
-2, -3.447215, -6.267518, 1, 1.5, 0.5, 0.5,
-2, -3.447215, -6.267518, 0, 1.5, 0.5, 0.5,
-1, -3.447215, -6.267518, 0, -0.5, 0.5, 0.5,
-1, -3.447215, -6.267518, 1, -0.5, 0.5, 0.5,
-1, -3.447215, -6.267518, 1, 1.5, 0.5, 0.5,
-1, -3.447215, -6.267518, 0, 1.5, 0.5, 0.5,
0, -3.447215, -6.267518, 0, -0.5, 0.5, 0.5,
0, -3.447215, -6.267518, 1, -0.5, 0.5, 0.5,
0, -3.447215, -6.267518, 1, 1.5, 0.5, 0.5,
0, -3.447215, -6.267518, 0, 1.5, 0.5, 0.5,
1, -3.447215, -6.267518, 0, -0.5, 0.5, 0.5,
1, -3.447215, -6.267518, 1, -0.5, 0.5, 0.5,
1, -3.447215, -6.267518, 1, 1.5, 0.5, 0.5,
1, -3.447215, -6.267518, 0, 1.5, 0.5, 0.5,
2, -3.447215, -6.267518, 0, -0.5, 0.5, 0.5,
2, -3.447215, -6.267518, 1, -0.5, 0.5, 0.5,
2, -3.447215, -6.267518, 1, 1.5, 0.5, 0.5,
2, -3.447215, -6.267518, 0, 1.5, 0.5, 0.5,
3, -3.447215, -6.267518, 0, -0.5, 0.5, 0.5,
3, -3.447215, -6.267518, 1, -0.5, 0.5, 0.5,
3, -3.447215, -6.267518, 1, 1.5, 0.5, 0.5,
3, -3.447215, -6.267518, 0, 1.5, 0.5, 0.5
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
-3.267195, -2, -5.444084,
-3.267195, 3, -5.444084,
-3.267195, -2, -5.444084,
-3.431578, -2, -5.718562,
-3.267195, -1, -5.444084,
-3.431578, -1, -5.718562,
-3.267195, 0, -5.444084,
-3.431578, 0, -5.718562,
-3.267195, 1, -5.444084,
-3.431578, 1, -5.718562,
-3.267195, 2, -5.444084,
-3.431578, 2, -5.718562,
-3.267195, 3, -5.444084,
-3.431578, 3, -5.718562
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
-3.760345, -2, -6.267518, 0, -0.5, 0.5, 0.5,
-3.760345, -2, -6.267518, 1, -0.5, 0.5, 0.5,
-3.760345, -2, -6.267518, 1, 1.5, 0.5, 0.5,
-3.760345, -2, -6.267518, 0, 1.5, 0.5, 0.5,
-3.760345, -1, -6.267518, 0, -0.5, 0.5, 0.5,
-3.760345, -1, -6.267518, 1, -0.5, 0.5, 0.5,
-3.760345, -1, -6.267518, 1, 1.5, 0.5, 0.5,
-3.760345, -1, -6.267518, 0, 1.5, 0.5, 0.5,
-3.760345, 0, -6.267518, 0, -0.5, 0.5, 0.5,
-3.760345, 0, -6.267518, 1, -0.5, 0.5, 0.5,
-3.760345, 0, -6.267518, 1, 1.5, 0.5, 0.5,
-3.760345, 0, -6.267518, 0, 1.5, 0.5, 0.5,
-3.760345, 1, -6.267518, 0, -0.5, 0.5, 0.5,
-3.760345, 1, -6.267518, 1, -0.5, 0.5, 0.5,
-3.760345, 1, -6.267518, 1, 1.5, 0.5, 0.5,
-3.760345, 1, -6.267518, 0, 1.5, 0.5, 0.5,
-3.760345, 2, -6.267518, 0, -0.5, 0.5, 0.5,
-3.760345, 2, -6.267518, 1, -0.5, 0.5, 0.5,
-3.760345, 2, -6.267518, 1, 1.5, 0.5, 0.5,
-3.760345, 2, -6.267518, 0, 1.5, 0.5, 0.5,
-3.760345, 3, -6.267518, 0, -0.5, 0.5, 0.5,
-3.760345, 3, -6.267518, 1, -0.5, 0.5, 0.5,
-3.760345, 3, -6.267518, 1, 1.5, 0.5, 0.5,
-3.760345, 3, -6.267518, 0, 1.5, 0.5, 0.5
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
-3.267195, -2.957836, -4,
-3.267195, -2.957836, 4,
-3.267195, -2.957836, -4,
-3.431578, -3.120962, -4,
-3.267195, -2.957836, -2,
-3.431578, -3.120962, -2,
-3.267195, -2.957836, 0,
-3.431578, -3.120962, 0,
-3.267195, -2.957836, 2,
-3.431578, -3.120962, 2,
-3.267195, -2.957836, 4,
-3.431578, -3.120962, 4
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
-3.760345, -3.447215, -4, 0, -0.5, 0.5, 0.5,
-3.760345, -3.447215, -4, 1, -0.5, 0.5, 0.5,
-3.760345, -3.447215, -4, 1, 1.5, 0.5, 0.5,
-3.760345, -3.447215, -4, 0, 1.5, 0.5, 0.5,
-3.760345, -3.447215, -2, 0, -0.5, 0.5, 0.5,
-3.760345, -3.447215, -2, 1, -0.5, 0.5, 0.5,
-3.760345, -3.447215, -2, 1, 1.5, 0.5, 0.5,
-3.760345, -3.447215, -2, 0, 1.5, 0.5, 0.5,
-3.760345, -3.447215, 0, 0, -0.5, 0.5, 0.5,
-3.760345, -3.447215, 0, 1, -0.5, 0.5, 0.5,
-3.760345, -3.447215, 0, 1, 1.5, 0.5, 0.5,
-3.760345, -3.447215, 0, 0, 1.5, 0.5, 0.5,
-3.760345, -3.447215, 2, 0, -0.5, 0.5, 0.5,
-3.760345, -3.447215, 2, 1, -0.5, 0.5, 0.5,
-3.760345, -3.447215, 2, 1, 1.5, 0.5, 0.5,
-3.760345, -3.447215, 2, 0, 1.5, 0.5, 0.5,
-3.760345, -3.447215, 4, 0, -0.5, 0.5, 0.5,
-3.760345, -3.447215, 4, 1, -0.5, 0.5, 0.5,
-3.760345, -3.447215, 4, 1, 1.5, 0.5, 0.5,
-3.760345, -3.447215, 4, 0, 1.5, 0.5, 0.5
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
-3.267195, -2.957836, -5.444084,
-3.267195, 3.567215, -5.444084,
-3.267195, -2.957836, 5.535034,
-3.267195, 3.567215, 5.535034,
-3.267195, -2.957836, -5.444084,
-3.267195, -2.957836, 5.535034,
-3.267195, 3.567215, -5.444084,
-3.267195, 3.567215, 5.535034,
-3.267195, -2.957836, -5.444084,
3.30815, -2.957836, -5.444084,
-3.267195, -2.957836, 5.535034,
3.30815, -2.957836, 5.535034,
-3.267195, 3.567215, -5.444084,
3.30815, 3.567215, -5.444084,
-3.267195, 3.567215, 5.535034,
3.30815, 3.567215, 5.535034,
3.30815, -2.957836, -5.444084,
3.30815, 3.567215, -5.444084,
3.30815, -2.957836, 5.535034,
3.30815, 3.567215, 5.535034,
3.30815, -2.957836, -5.444084,
3.30815, -2.957836, 5.535034,
3.30815, 3.567215, -5.444084,
3.30815, 3.567215, 5.535034
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
var radius = 7.670617;
var distance = 34.12745;
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
mvMatrix.translate( -0.02047753, -0.3046896, -0.04547524 );
mvMatrix.scale( 1.261321, 1.271043, 0.7553996 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.12745);
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
tolfenpyrad<-read.table("tolfenpyrad.xyz")
```

```
## Error in read.table("tolfenpyrad.xyz"): no lines available in input
```

```r
x<-tolfenpyrad$V2
```

```
## Error in eval(expr, envir, enclos): object 'tolfenpyrad' not found
```

```r
y<-tolfenpyrad$V3
```

```
## Error in eval(expr, envir, enclos): object 'tolfenpyrad' not found
```

```r
z<-tolfenpyrad$V4
```

```
## Error in eval(expr, envir, enclos): object 'tolfenpyrad' not found
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
-3.171437, -0.867179, -0.7425991, 0, 0, 1, 1, 1,
-3.144028, -1.143729, -0.5211316, 1, 0, 0, 1, 1,
-3.125616, 0.4641238, -2.135658, 1, 0, 0, 1, 1,
-3.019553, -1.71633, -2.071253, 1, 0, 0, 1, 1,
-2.997508, 1.392449, -0.1796724, 1, 0, 0, 1, 1,
-2.867793, 1.06845, 0.150177, 1, 0, 0, 1, 1,
-2.849567, 0.8844535, -0.8370694, 0, 0, 0, 1, 1,
-2.703003, 0.4682593, -0.3584261, 0, 0, 0, 1, 1,
-2.588262, 0.364079, 0.04374139, 0, 0, 0, 1, 1,
-2.550228, 1.432769, -0.09539024, 0, 0, 0, 1, 1,
-2.503135, -0.8178144, -2.873972, 0, 0, 0, 1, 1,
-2.483423, -0.4881425, -2.013622, 0, 0, 0, 1, 1,
-2.343915, 0.2997616, -1.385726, 0, 0, 0, 1, 1,
-2.329579, -0.347723, -3.484807, 1, 1, 1, 1, 1,
-2.305542, -0.5875864, -3.059593, 1, 1, 1, 1, 1,
-2.28221, 0.7932797, -0.8439531, 1, 1, 1, 1, 1,
-2.274135, 0.3755444, 0.06685733, 1, 1, 1, 1, 1,
-2.270571, -1.492991, -2.797529, 1, 1, 1, 1, 1,
-2.24853, -0.1654603, -2.093893, 1, 1, 1, 1, 1,
-2.241461, -0.1908494, -2.673409, 1, 1, 1, 1, 1,
-2.225855, -0.1270141, -0.5020795, 1, 1, 1, 1, 1,
-2.225676, 0.3251187, -1.236151, 1, 1, 1, 1, 1,
-2.194582, -0.9042977, -2.828331, 1, 1, 1, 1, 1,
-2.190123, 1.108871, -1.605063, 1, 1, 1, 1, 1,
-2.155699, -1.022618, -1.471126, 1, 1, 1, 1, 1,
-2.145793, 0.5974064, -1.065624, 1, 1, 1, 1, 1,
-2.06791, -0.6684525, -0.352847, 1, 1, 1, 1, 1,
-2.054407, 0.6638651, -1.839866, 1, 1, 1, 1, 1,
-2.049804, 0.1151789, -2.307208, 0, 0, 1, 1, 1,
-2.020973, 1.852923, -1.667624, 1, 0, 0, 1, 1,
-1.985211, -0.004833711, -2.874996, 1, 0, 0, 1, 1,
-1.965696, -0.3161054, -1.219479, 1, 0, 0, 1, 1,
-1.962821, 0.05424706, -2.68556, 1, 0, 0, 1, 1,
-1.935537, 0.2534157, -1.251839, 1, 0, 0, 1, 1,
-1.916674, 1.217368, 0.4105443, 0, 0, 0, 1, 1,
-1.90217, 0.02005631, -1.599472, 0, 0, 0, 1, 1,
-1.857087, -0.7517909, -1.699437, 0, 0, 0, 1, 1,
-1.779295, -1.168255, -1.612356, 0, 0, 0, 1, 1,
-1.755853, -0.8787636, -2.181035, 0, 0, 0, 1, 1,
-1.70945, -0.8353998, -0.1650638, 0, 0, 0, 1, 1,
-1.695759, -0.7263081, -0.931284, 0, 0, 0, 1, 1,
-1.680948, -0.1109465, -2.165088, 1, 1, 1, 1, 1,
-1.678838, 0.9697881, -1.389597, 1, 1, 1, 1, 1,
-1.653055, 0.526637, -1.673425, 1, 1, 1, 1, 1,
-1.63184, 0.7556062, 0.5929356, 1, 1, 1, 1, 1,
-1.611845, -0.1933804, 0.5016369, 1, 1, 1, 1, 1,
-1.610155, 0.2283798, -3.980347, 1, 1, 1, 1, 1,
-1.602335, -0.1324743, -0.9456242, 1, 1, 1, 1, 1,
-1.593682, 0.5787752, -1.97592, 1, 1, 1, 1, 1,
-1.591382, 0.8599672, -1.235158, 1, 1, 1, 1, 1,
-1.590479, -1.694435, -1.446639, 1, 1, 1, 1, 1,
-1.58617, 0.5087168, -1.662764, 1, 1, 1, 1, 1,
-1.572207, -1.113665, -3.63746, 1, 1, 1, 1, 1,
-1.568782, 0.04192284, -2.003632, 1, 1, 1, 1, 1,
-1.56857, 0.961555, -0.378031, 1, 1, 1, 1, 1,
-1.558185, 0.00311321, -2.00868, 1, 1, 1, 1, 1,
-1.552928, -0.4041609, -1.38121, 0, 0, 1, 1, 1,
-1.54965, 0.7165951, -3.402481, 1, 0, 0, 1, 1,
-1.548215, 0.892461, -0.4689865, 1, 0, 0, 1, 1,
-1.546695, 0.7288533, -1.044761, 1, 0, 0, 1, 1,
-1.54567, 0.6457618, -2.41446, 1, 0, 0, 1, 1,
-1.53063, 0.3244404, -1.617218, 1, 0, 0, 1, 1,
-1.529718, 0.1072917, -1.101313, 0, 0, 0, 1, 1,
-1.528046, -0.7665491, -1.527897, 0, 0, 0, 1, 1,
-1.512069, -0.415909, -0.5120023, 0, 0, 0, 1, 1,
-1.509477, -0.9809718, -1.875626, 0, 0, 0, 1, 1,
-1.503645, 0.5878003, -1.923508, 0, 0, 0, 1, 1,
-1.498291, 0.1067441, -1.984681, 0, 0, 0, 1, 1,
-1.494139, 1.449564, -1.424434, 0, 0, 0, 1, 1,
-1.486776, -0.4224399, -3.016109, 1, 1, 1, 1, 1,
-1.480176, 1.209569, -0.3778942, 1, 1, 1, 1, 1,
-1.46544, 1.123995, -1.047369, 1, 1, 1, 1, 1,
-1.426711, -0.5186606, -0.8340313, 1, 1, 1, 1, 1,
-1.425737, 0.6606553, -1.164207, 1, 1, 1, 1, 1,
-1.413545, -0.3516641, -0.5613981, 1, 1, 1, 1, 1,
-1.406417, 1.576043, -1.629466, 1, 1, 1, 1, 1,
-1.404171, -1.076965, -2.707738, 1, 1, 1, 1, 1,
-1.396882, -1.175484, -2.234437, 1, 1, 1, 1, 1,
-1.387873, 0.2834765, -2.232417, 1, 1, 1, 1, 1,
-1.376127, -1.818343, -3.123549, 1, 1, 1, 1, 1,
-1.361879, 0.1275906, -1.842308, 1, 1, 1, 1, 1,
-1.34552, 0.4650523, -2.729481, 1, 1, 1, 1, 1,
-1.334607, 0.9681031, -2.119761, 1, 1, 1, 1, 1,
-1.334248, -0.1628109, -1.392265, 1, 1, 1, 1, 1,
-1.330026, -0.985149, -1.292066, 0, 0, 1, 1, 1,
-1.326576, 0.9480264, -0.8571784, 1, 0, 0, 1, 1,
-1.322053, -2.232685, -1.889003, 1, 0, 0, 1, 1,
-1.301728, 0.7868052, -1.80006, 1, 0, 0, 1, 1,
-1.300149, -0.236297, -3.434508, 1, 0, 0, 1, 1,
-1.297652, 0.02348254, -0.9088125, 1, 0, 0, 1, 1,
-1.293315, 0.6456006, -1.69987, 0, 0, 0, 1, 1,
-1.291101, -0.609813, -1.728886, 0, 0, 0, 1, 1,
-1.284688, 2.097742, -0.2338655, 0, 0, 0, 1, 1,
-1.278537, -1.282868, -2.533204, 0, 0, 0, 1, 1,
-1.272637, -0.5678224, -2.422529, 0, 0, 0, 1, 1,
-1.269448, 0.7038368, -1.69268, 0, 0, 0, 1, 1,
-1.261585, -0.8432751, -1.44642, 0, 0, 0, 1, 1,
-1.256487, -1.64616, -4.482767, 1, 1, 1, 1, 1,
-1.248393, 0.1080788, -1.043231, 1, 1, 1, 1, 1,
-1.225222, -0.3150633, -2.483022, 1, 1, 1, 1, 1,
-1.22145, -0.4333451, -1.426372, 1, 1, 1, 1, 1,
-1.208649, 0.5366616, -1.619817, 1, 1, 1, 1, 1,
-1.207122, 1.37265, -0.05325211, 1, 1, 1, 1, 1,
-1.202518, 0.08764295, -1.42131, 1, 1, 1, 1, 1,
-1.197489, -1.552006, -2.590727, 1, 1, 1, 1, 1,
-1.197319, 1.414291, 1.52275, 1, 1, 1, 1, 1,
-1.192958, -0.4300713, -1.529535, 1, 1, 1, 1, 1,
-1.180846, -0.5231082, -2.145558, 1, 1, 1, 1, 1,
-1.175491, -0.07916301, -1.118225, 1, 1, 1, 1, 1,
-1.174983, -0.4674215, -1.797002, 1, 1, 1, 1, 1,
-1.171005, 0.1247346, -0.6820142, 1, 1, 1, 1, 1,
-1.165502, 1.274452, 0.7979862, 1, 1, 1, 1, 1,
-1.164418, 1.035341, -0.5542916, 0, 0, 1, 1, 1,
-1.162683, 0.03750796, -0.8392678, 1, 0, 0, 1, 1,
-1.141006, 1.427696, 0.01493154, 1, 0, 0, 1, 1,
-1.131631, -0.277803, -2.324413, 1, 0, 0, 1, 1,
-1.131593, -1.259722, -3.286478, 1, 0, 0, 1, 1,
-1.127185, -0.0977746, -1.521735, 1, 0, 0, 1, 1,
-1.125545, 0.1510206, -0.9022133, 0, 0, 0, 1, 1,
-1.122708, 0.5623457, -2.279604, 0, 0, 0, 1, 1,
-1.122304, -0.9288976, -2.485181, 0, 0, 0, 1, 1,
-1.113035, 1.129364, -0.002541855, 0, 0, 0, 1, 1,
-1.093665, -0.06701368, -2.910243, 0, 0, 0, 1, 1,
-1.088727, -1.117369, -2.189846, 0, 0, 0, 1, 1,
-1.080689, -0.9964866, -0.4406237, 0, 0, 0, 1, 1,
-1.079742, 0.3275591, -1.122621, 1, 1, 1, 1, 1,
-1.078851, 0.2436073, -2.591517, 1, 1, 1, 1, 1,
-1.078071, -1.522312, -5.258599, 1, 1, 1, 1, 1,
-1.072494, -1.006612, -3.80598, 1, 1, 1, 1, 1,
-1.07112, -1.34151, -2.246541, 1, 1, 1, 1, 1,
-1.069685, -1.008786, -2.160132, 1, 1, 1, 1, 1,
-1.064402, -1.101394, -2.608406, 1, 1, 1, 1, 1,
-1.06233, -1.093678, -2.339057, 1, 1, 1, 1, 1,
-1.061617, -1.108259, -4.035106, 1, 1, 1, 1, 1,
-1.056947, 0.2571681, -2.07662, 1, 1, 1, 1, 1,
-1.055487, 0.2321075, 0.07555983, 1, 1, 1, 1, 1,
-1.054116, 0.7624355, 0.16224, 1, 1, 1, 1, 1,
-1.050317, 0.3075013, -1.445078, 1, 1, 1, 1, 1,
-1.041428, -0.5259822, -3.127224, 1, 1, 1, 1, 1,
-1.040384, 0.2361725, -0.2959851, 1, 1, 1, 1, 1,
-1.035049, 2.348135, -0.8419161, 0, 0, 1, 1, 1,
-1.029343, 0.5825393, -1.510911, 1, 0, 0, 1, 1,
-1.02927, -0.01592898, -2.649619, 1, 0, 0, 1, 1,
-1.020929, 0.2466888, -1.906793, 1, 0, 0, 1, 1,
-1.009326, -0.3689685, -1.594135, 1, 0, 0, 1, 1,
-1.007692, 0.8202437, 0.07336519, 1, 0, 0, 1, 1,
-1.003776, 0.1318847, -2.736398, 0, 0, 0, 1, 1,
-0.9997042, 0.597029, -1.581089, 0, 0, 0, 1, 1,
-0.9815392, -0.7485222, -3.11136, 0, 0, 0, 1, 1,
-0.9777265, -0.9636067, -1.6357, 0, 0, 0, 1, 1,
-0.9758582, 0.5548428, -0.8459038, 0, 0, 0, 1, 1,
-0.9719455, -1.248021, -0.3632804, 0, 0, 0, 1, 1,
-0.9691232, -0.2680669, -2.113858, 0, 0, 0, 1, 1,
-0.9553384, 0.544465, -0.1701051, 1, 1, 1, 1, 1,
-0.9521852, -0.7963349, -2.994804, 1, 1, 1, 1, 1,
-0.9466125, 0.6095412, 0.2212419, 1, 1, 1, 1, 1,
-0.9439825, 0.2192012, -2.940482, 1, 1, 1, 1, 1,
-0.9421284, 0.4282155, -0.8949149, 1, 1, 1, 1, 1,
-0.9421065, 0.3991241, -0.9042357, 1, 1, 1, 1, 1,
-0.9411559, -0.9432517, -3.254614, 1, 1, 1, 1, 1,
-0.9401515, 0.1398082, -2.425493, 1, 1, 1, 1, 1,
-0.9344836, 0.7979442, -1.148279, 1, 1, 1, 1, 1,
-0.9332797, 0.1562795, -1.899326, 1, 1, 1, 1, 1,
-0.9328403, -1.619023, -3.489448, 1, 1, 1, 1, 1,
-0.9325533, 0.8454898, 1.544319, 1, 1, 1, 1, 1,
-0.9199671, -1.276472, -2.629967, 1, 1, 1, 1, 1,
-0.9182048, 0.8295532, -0.7670581, 1, 1, 1, 1, 1,
-0.91351, 0.5553902, -1.279025, 1, 1, 1, 1, 1,
-0.911285, -0.08579668, -1.715185, 0, 0, 1, 1, 1,
-0.9098167, 0.2411194, -1.501143, 1, 0, 0, 1, 1,
-0.9079325, 0.8701553, 0.3994604, 1, 0, 0, 1, 1,
-0.9063169, 1.08715, -1.742816, 1, 0, 0, 1, 1,
-0.9010602, 0.3878861, -0.9646356, 1, 0, 0, 1, 1,
-0.8980576, -0.6505844, -1.088426, 1, 0, 0, 1, 1,
-0.8965028, -1.500693, -3.132099, 0, 0, 0, 1, 1,
-0.8876077, 1.181903, -3.504575, 0, 0, 0, 1, 1,
-0.8812783, -0.2028462, -1.329693, 0, 0, 0, 1, 1,
-0.878349, -1.277261, -2.366842, 0, 0, 0, 1, 1,
-0.8756957, 0.02532607, -2.947763, 0, 0, 0, 1, 1,
-0.8732318, 0.05557606, -1.036888, 0, 0, 0, 1, 1,
-0.8721867, -0.1325186, -2.312683, 0, 0, 0, 1, 1,
-0.8632522, -1.322721, -3.813773, 1, 1, 1, 1, 1,
-0.8562482, 0.6442335, -0.7752463, 1, 1, 1, 1, 1,
-0.8531421, -2.611054, -3.799825, 1, 1, 1, 1, 1,
-0.8517163, -0.4958276, -0.2935475, 1, 1, 1, 1, 1,
-0.8501437, -0.5858001, -2.151566, 1, 1, 1, 1, 1,
-0.8492838, 0.1186411, -2.591899, 1, 1, 1, 1, 1,
-0.8483461, -0.5208054, -1.293427, 1, 1, 1, 1, 1,
-0.8479159, -0.9366773, -3.256673, 1, 1, 1, 1, 1,
-0.8421506, -1.495405, -1.733195, 1, 1, 1, 1, 1,
-0.8407338, -0.3281454, -3.654372, 1, 1, 1, 1, 1,
-0.8400665, -0.2573224, -2.470413, 1, 1, 1, 1, 1,
-0.8384327, 0.3871024, -0.5410753, 1, 1, 1, 1, 1,
-0.8381624, -0.2348573, -0.794376, 1, 1, 1, 1, 1,
-0.8352624, -0.8788486, -1.223481, 1, 1, 1, 1, 1,
-0.8260392, 1.416349, -0.9474517, 1, 1, 1, 1, 1,
-0.824848, -1.381798, -2.019621, 0, 0, 1, 1, 1,
-0.8214965, 0.4035873, -0.7139945, 1, 0, 0, 1, 1,
-0.819099, 0.7513402, -0.9226885, 1, 0, 0, 1, 1,
-0.8133795, 0.6525769, 0.8480886, 1, 0, 0, 1, 1,
-0.8125004, -1.023942, -3.41011, 1, 0, 0, 1, 1,
-0.8083175, -0.9215981, -5.258702, 1, 0, 0, 1, 1,
-0.8080214, 0.002472515, -1.048348, 0, 0, 0, 1, 1,
-0.7986968, -0.3365541, -2.668219, 0, 0, 0, 1, 1,
-0.7976681, 0.9174718, 0.2863338, 0, 0, 0, 1, 1,
-0.7901354, -0.6636439, -3.14602, 0, 0, 0, 1, 1,
-0.7821467, 0.07787655, -1.212241, 0, 0, 0, 1, 1,
-0.7821121, -0.09021282, -1.213613, 0, 0, 0, 1, 1,
-0.7801127, 0.5031663, -0.6676287, 0, 0, 0, 1, 1,
-0.7752965, 1.724829, -1.607008, 1, 1, 1, 1, 1,
-0.7729479, -0.05785846, -0.277179, 1, 1, 1, 1, 1,
-0.7626687, 0.2064944, -1.291552, 1, 1, 1, 1, 1,
-0.7626352, -0.9198205, -2.219409, 1, 1, 1, 1, 1,
-0.7624391, 0.5670496, -0.5934881, 1, 1, 1, 1, 1,
-0.7523211, 1.040684, -1.26715, 1, 1, 1, 1, 1,
-0.7450248, -0.1302303, -2.987487, 1, 1, 1, 1, 1,
-0.7424197, -0.04189511, 0.4395609, 1, 1, 1, 1, 1,
-0.7359568, 1.304722, -2.160915, 1, 1, 1, 1, 1,
-0.7332464, -0.7092634, -1.112304, 1, 1, 1, 1, 1,
-0.7321293, 0.01787844, -2.443656, 1, 1, 1, 1, 1,
-0.7286553, 0.5143188, -0.4035984, 1, 1, 1, 1, 1,
-0.723853, 1.23355, -1.168586, 1, 1, 1, 1, 1,
-0.7228237, 0.6535161, -0.679045, 1, 1, 1, 1, 1,
-0.7194435, -0.1600612, -0.8595184, 1, 1, 1, 1, 1,
-0.7179949, -0.03019913, -1.372084, 0, 0, 1, 1, 1,
-0.71107, -0.1809667, -2.464514, 1, 0, 0, 1, 1,
-0.7055622, -1.440169, -1.576239, 1, 0, 0, 1, 1,
-0.7053879, -0.634658, -0.394048, 1, 0, 0, 1, 1,
-0.6975254, -0.4305483, -3.022018, 1, 0, 0, 1, 1,
-0.6895441, 0.1653821, -3.279796, 1, 0, 0, 1, 1,
-0.6874207, -0.1422619, -2.783128, 0, 0, 0, 1, 1,
-0.6867518, 1.259936, -1.328649, 0, 0, 0, 1, 1,
-0.6855727, -0.3307405, -2.159836, 0, 0, 0, 1, 1,
-0.685429, -0.3937888, -2.236681, 0, 0, 0, 1, 1,
-0.6831492, -0.4618221, -1.203843, 0, 0, 0, 1, 1,
-0.6818119, 0.2697294, -0.8175206, 0, 0, 0, 1, 1,
-0.6811138, 0.6258892, -1.566743, 0, 0, 0, 1, 1,
-0.6787106, 0.3706114, -1.120841, 1, 1, 1, 1, 1,
-0.6780571, -0.05209032, -1.529977, 1, 1, 1, 1, 1,
-0.6776813, 0.4622596, -0.3827779, 1, 1, 1, 1, 1,
-0.6754114, 0.04253133, -1.651472, 1, 1, 1, 1, 1,
-0.6718455, -0.1164396, -1.513257, 1, 1, 1, 1, 1,
-0.6682936, 0.05017081, -1.262404, 1, 1, 1, 1, 1,
-0.6649267, -1.30005, -1.022857, 1, 1, 1, 1, 1,
-0.6617212, -0.6426639, -3.825906, 1, 1, 1, 1, 1,
-0.6601694, 0.2452966, -1.860031, 1, 1, 1, 1, 1,
-0.6594559, 0.2951383, -2.574975, 1, 1, 1, 1, 1,
-0.6592808, 0.6481739, 0.004488583, 1, 1, 1, 1, 1,
-0.6581641, 0.1356107, -1.229144, 1, 1, 1, 1, 1,
-0.6571645, -1.741446, -2.845978, 1, 1, 1, 1, 1,
-0.6554659, -0.5984895, -2.047586, 1, 1, 1, 1, 1,
-0.6523339, -1.190088, -3.447308, 1, 1, 1, 1, 1,
-0.6486375, 1.578025, 2.204465, 0, 0, 1, 1, 1,
-0.6449721, 1.253773, 0.2192546, 1, 0, 0, 1, 1,
-0.6414232, 0.658741, -3.528357, 1, 0, 0, 1, 1,
-0.6413121, 0.4994763, -0.1929102, 1, 0, 0, 1, 1,
-0.6339369, -1.469071, -3.484634, 1, 0, 0, 1, 1,
-0.6305875, -1.6262, -3.377728, 1, 0, 0, 1, 1,
-0.6305117, -1.043795, -1.36921, 0, 0, 0, 1, 1,
-0.6292486, -1.107252, -2.638649, 0, 0, 0, 1, 1,
-0.6185818, 0.4354543, -0.9701486, 0, 0, 0, 1, 1,
-0.618273, -0.9202066, -3.50929, 0, 0, 0, 1, 1,
-0.6095768, -0.6838433, -3.002633, 0, 0, 0, 1, 1,
-0.6069811, -0.5252255, -1.690758, 0, 0, 0, 1, 1,
-0.6035579, 1.932763, -0.6492462, 0, 0, 0, 1, 1,
-0.602057, 1.970424, 1.361849, 1, 1, 1, 1, 1,
-0.6012471, 0.3353451, -1.747897, 1, 1, 1, 1, 1,
-0.600361, -1.800879, -3.682969, 1, 1, 1, 1, 1,
-0.5984496, -0.1903012, -1.66351, 1, 1, 1, 1, 1,
-0.5962278, 0.3193118, -1.422644, 1, 1, 1, 1, 1,
-0.5954702, 0.05163814, -3.747628, 1, 1, 1, 1, 1,
-0.5950711, 0.96108, -1.377721, 1, 1, 1, 1, 1,
-0.5863588, -0.5254466, -2.156102, 1, 1, 1, 1, 1,
-0.5744392, 0.9751924, -0.6252055, 1, 1, 1, 1, 1,
-0.5633508, 0.7311091, -2.85868, 1, 1, 1, 1, 1,
-0.5625651, -0.3604796, -2.114321, 1, 1, 1, 1, 1,
-0.5617973, 0.2716095, -3.061095, 1, 1, 1, 1, 1,
-0.5606422, 0.09575659, -2.772302, 1, 1, 1, 1, 1,
-0.5563403, 0.3679147, 0.009256762, 1, 1, 1, 1, 1,
-0.5550005, -0.06520076, -2.534598, 1, 1, 1, 1, 1,
-0.5526875, 0.128603, -0.3185277, 0, 0, 1, 1, 1,
-0.5505506, -0.1084526, -2.553046, 1, 0, 0, 1, 1,
-0.5491605, -0.7150597, -1.579676, 1, 0, 0, 1, 1,
-0.546334, 0.06200498, -2.598538, 1, 0, 0, 1, 1,
-0.5433971, -0.3015738, -1.322672, 1, 0, 0, 1, 1,
-0.5393693, 0.1844849, -1.593248, 1, 0, 0, 1, 1,
-0.5390705, -0.3237266, -2.676147, 0, 0, 0, 1, 1,
-0.538285, -0.9588532, -3.579332, 0, 0, 0, 1, 1,
-0.5380805, 1.280689, -1.351091, 0, 0, 0, 1, 1,
-0.5298923, 0.3291224, -1.579707, 0, 0, 0, 1, 1,
-0.5288573, 0.8333638, 0.1904096, 0, 0, 0, 1, 1,
-0.5280054, 0.485037, -0.6674543, 0, 0, 0, 1, 1,
-0.5233164, -0.3851263, -1.031912, 0, 0, 0, 1, 1,
-0.5167679, 0.8133075, -1.361965, 1, 1, 1, 1, 1,
-0.5140416, -0.4187071, -0.5126457, 1, 1, 1, 1, 1,
-0.5124865, -0.9753969, -3.208114, 1, 1, 1, 1, 1,
-0.5100108, -0.8608761, -3.27655, 1, 1, 1, 1, 1,
-0.5057132, 1.057731, -1.323374, 1, 1, 1, 1, 1,
-0.4942284, 0.8092031, -0.9117839, 1, 1, 1, 1, 1,
-0.4937992, 0.7090957, 0.004811977, 1, 1, 1, 1, 1,
-0.4909473, 1.029257, 0.237524, 1, 1, 1, 1, 1,
-0.4905963, -0.1374497, -2.226846, 1, 1, 1, 1, 1,
-0.4889456, 0.7425717, 0.4122994, 1, 1, 1, 1, 1,
-0.4879567, -0.06576323, -1.706589, 1, 1, 1, 1, 1,
-0.4874099, -1.721534, -2.370435, 1, 1, 1, 1, 1,
-0.4873046, -0.4940746, -3.253309, 1, 1, 1, 1, 1,
-0.4835042, -2.862811, -3.766377, 1, 1, 1, 1, 1,
-0.4813919, -0.004872323, -2.322427, 1, 1, 1, 1, 1,
-0.4807233, 0.2094592, 0.0260797, 0, 0, 1, 1, 1,
-0.4793388, 0.1975117, -1.881652, 1, 0, 0, 1, 1,
-0.4783203, -0.5036922, -2.677953, 1, 0, 0, 1, 1,
-0.4772977, -0.8330105, -2.035428, 1, 0, 0, 1, 1,
-0.4750879, -0.1873831, -1.04441, 1, 0, 0, 1, 1,
-0.4746935, -0.8132909, -1.92843, 1, 0, 0, 1, 1,
-0.4713467, 2.577693, 1.230725, 0, 0, 0, 1, 1,
-0.471333, -0.650356, -3.411212, 0, 0, 0, 1, 1,
-0.4690667, 0.3510621, -2.324791, 0, 0, 0, 1, 1,
-0.4627885, -1.468614, -3.575798, 0, 0, 0, 1, 1,
-0.4610769, 1.138836, -0.2236714, 0, 0, 0, 1, 1,
-0.459323, 0.8628174, 0.07400347, 0, 0, 0, 1, 1,
-0.4550864, -1.242614, -3.238764, 0, 0, 0, 1, 1,
-0.4522553, 0.7545452, -1.486576, 1, 1, 1, 1, 1,
-0.4514183, -0.8854128, -3.497218, 1, 1, 1, 1, 1,
-0.4468937, 1.316385, 0.1078449, 1, 1, 1, 1, 1,
-0.44423, 0.756398, 0.2211526, 1, 1, 1, 1, 1,
-0.4412832, 0.3963353, 0.1343987, 1, 1, 1, 1, 1,
-0.4405465, -2.105198, -4.131858, 1, 1, 1, 1, 1,
-0.4361045, 0.9189346, -1.044452, 1, 1, 1, 1, 1,
-0.4360747, 0.1891851, -2.770656, 1, 1, 1, 1, 1,
-0.4352202, 0.6066685, 0.2532778, 1, 1, 1, 1, 1,
-0.4341977, 0.4023989, -0.5519947, 1, 1, 1, 1, 1,
-0.4332151, 0.3007466, -0.9506582, 1, 1, 1, 1, 1,
-0.4330927, -0.4099424, -0.9774351, 1, 1, 1, 1, 1,
-0.4329244, 1.586691, -0.8245177, 1, 1, 1, 1, 1,
-0.432602, -0.8148425, -2.738791, 1, 1, 1, 1, 1,
-0.4279467, -0.9927673, -3.057719, 1, 1, 1, 1, 1,
-0.4266469, 0.06058554, -0.3299664, 0, 0, 1, 1, 1,
-0.4265538, -0.9904547, -2.460607, 1, 0, 0, 1, 1,
-0.4205038, 0.20104, -2.132109, 1, 0, 0, 1, 1,
-0.4200752, 1.434871, -0.2284347, 1, 0, 0, 1, 1,
-0.4182606, -0.9648077, -2.362395, 1, 0, 0, 1, 1,
-0.4181785, -0.1363992, -2.019033, 1, 0, 0, 1, 1,
-0.4138211, 0.199512, -2.030091, 0, 0, 0, 1, 1,
-0.4109822, -0.296069, -2.932343, 0, 0, 0, 1, 1,
-0.4103596, 0.4144197, -1.497374, 0, 0, 0, 1, 1,
-0.409177, -1.988626, -3.170185, 0, 0, 0, 1, 1,
-0.4089942, 0.656197, -1.708923, 0, 0, 0, 1, 1,
-0.4083468, -0.8033028, -1.57866, 0, 0, 0, 1, 1,
-0.4035009, -2.11797, -3.593785, 0, 0, 0, 1, 1,
-0.4034009, 0.2793083, 0.4913085, 1, 1, 1, 1, 1,
-0.4023406, -0.555509, -3.871485, 1, 1, 1, 1, 1,
-0.3989882, 0.2538996, -1.972815, 1, 1, 1, 1, 1,
-0.3979406, -0.8757529, -1.973445, 1, 1, 1, 1, 1,
-0.3958815, 0.009700664, -0.9462708, 1, 1, 1, 1, 1,
-0.3939588, 0.3773686, 0.8058732, 1, 1, 1, 1, 1,
-0.3934706, -1.152923, -3.179121, 1, 1, 1, 1, 1,
-0.3902619, 0.68546, 0.354816, 1, 1, 1, 1, 1,
-0.3864402, 0.510534, 0.9118934, 1, 1, 1, 1, 1,
-0.3798983, -1.127616, -2.219082, 1, 1, 1, 1, 1,
-0.3731788, -0.5711756, -4.378012, 1, 1, 1, 1, 1,
-0.3714617, -1.124266, -3.757557, 1, 1, 1, 1, 1,
-0.3701254, 1.685235, 0.01179711, 1, 1, 1, 1, 1,
-0.368757, 1.254047, 0.154129, 1, 1, 1, 1, 1,
-0.3674898, 0.6975746, -1.077739, 1, 1, 1, 1, 1,
-0.3659904, 1.627295, -1.050373, 0, 0, 1, 1, 1,
-0.3620942, -0.5678298, -2.025496, 1, 0, 0, 1, 1,
-0.3576442, 1.986374, -2.329425, 1, 0, 0, 1, 1,
-0.3572263, 2.650026, -0.9887061, 1, 0, 0, 1, 1,
-0.3543627, -0.07706138, -2.009283, 1, 0, 0, 1, 1,
-0.3481086, -0.685549, -2.409483, 1, 0, 0, 1, 1,
-0.3465205, 0.592539, -0.6490552, 0, 0, 0, 1, 1,
-0.3445386, -0.07742649, -2.824786, 0, 0, 0, 1, 1,
-0.344133, 1.792575, -1.071141, 0, 0, 0, 1, 1,
-0.3437076, -0.9487812, -2.533897, 0, 0, 0, 1, 1,
-0.3424965, 0.09322239, -1.552009, 0, 0, 0, 1, 1,
-0.3383496, 0.2761517, 0.167028, 0, 0, 0, 1, 1,
-0.33204, 0.3546034, -0.3752856, 0, 0, 0, 1, 1,
-0.331381, -0.3749969, -1.35415, 1, 1, 1, 1, 1,
-0.3302398, -0.0005037871, -0.8926027, 1, 1, 1, 1, 1,
-0.3292143, 0.2047427, 0.667374, 1, 1, 1, 1, 1,
-0.32804, 0.2538466, 0.2473522, 1, 1, 1, 1, 1,
-0.3272161, -1.323786, -1.423085, 1, 1, 1, 1, 1,
-0.3220709, 0.0679793, -2.044134, 1, 1, 1, 1, 1,
-0.3205989, 0.111047, -0.2447679, 1, 1, 1, 1, 1,
-0.3204589, 0.715318, -0.4313942, 1, 1, 1, 1, 1,
-0.3186869, -0.3135662, -1.074324, 1, 1, 1, 1, 1,
-0.3094146, 0.9142668, 0.1840278, 1, 1, 1, 1, 1,
-0.3062959, 0.3503988, -1.328297, 1, 1, 1, 1, 1,
-0.3061395, 1.099441, -1.124318, 1, 1, 1, 1, 1,
-0.3047518, 0.03187768, -1.150187, 1, 1, 1, 1, 1,
-0.3015583, 1.382678, 0.2704599, 1, 1, 1, 1, 1,
-0.3006593, 1.247747, -0.5886993, 1, 1, 1, 1, 1,
-0.2955239, -1.28026, -2.755323, 0, 0, 1, 1, 1,
-0.2926583, -0.1819134, -2.690077, 1, 0, 0, 1, 1,
-0.2836347, 0.7698994, 0.5891089, 1, 0, 0, 1, 1,
-0.282272, -0.2933679, -4.174474, 1, 0, 0, 1, 1,
-0.2799323, -1.308177, -3.229173, 1, 0, 0, 1, 1,
-0.2792248, -0.6782927, -3.240258, 1, 0, 0, 1, 1,
-0.279057, -0.01080604, -0.1355952, 0, 0, 0, 1, 1,
-0.278393, -0.03942451, -0.06880049, 0, 0, 0, 1, 1,
-0.2699405, 1.802722, -0.6792604, 0, 0, 0, 1, 1,
-0.2681045, 0.7419581, -2.15064, 0, 0, 0, 1, 1,
-0.2663407, -0.814844, -2.750958, 0, 0, 0, 1, 1,
-0.2610093, 0.8992507, 0.707721, 0, 0, 0, 1, 1,
-0.2606498, -0.8817917, -0.996355, 0, 0, 0, 1, 1,
-0.2587988, 1.585208, -1.523366, 1, 1, 1, 1, 1,
-0.2568674, 0.6683599, 0.2194201, 1, 1, 1, 1, 1,
-0.2548092, -1.812818, -2.695792, 1, 1, 1, 1, 1,
-0.2523001, -0.1586808, -0.8513466, 1, 1, 1, 1, 1,
-0.251532, 0.2563933, -1.023627, 1, 1, 1, 1, 1,
-0.2495842, 0.3259349, 0.4704721, 1, 1, 1, 1, 1,
-0.2476279, 0.1014053, 0.3047654, 1, 1, 1, 1, 1,
-0.245816, 1.203526, -1.933383, 1, 1, 1, 1, 1,
-0.2420837, -0.2561259, -2.590716, 1, 1, 1, 1, 1,
-0.2387625, 0.1719553, -1.173886, 1, 1, 1, 1, 1,
-0.2349332, 1.43576, -0.05825245, 1, 1, 1, 1, 1,
-0.2317723, -0.7970094, -3.073427, 1, 1, 1, 1, 1,
-0.2287863, -0.6166276, -1.387855, 1, 1, 1, 1, 1,
-0.2246229, -0.02386318, -2.085698, 1, 1, 1, 1, 1,
-0.2212344, -0.450314, -2.29662, 1, 1, 1, 1, 1,
-0.2195761, 0.4951358, -0.6856501, 0, 0, 1, 1, 1,
-0.2172924, -0.73688, -2.195822, 1, 0, 0, 1, 1,
-0.2166223, 0.07452743, -1.072818, 1, 0, 0, 1, 1,
-0.2158044, 1.617543, -0.2085804, 1, 0, 0, 1, 1,
-0.2126104, 0.05080717, -1.709559, 1, 0, 0, 1, 1,
-0.2109765, 0.6155096, -0.316444, 1, 0, 0, 1, 1,
-0.2093714, 0.217106, -0.3826992, 0, 0, 0, 1, 1,
-0.2085944, 0.8435009, -0.777789, 0, 0, 0, 1, 1,
-0.197215, 0.9428855, 0.6063797, 0, 0, 0, 1, 1,
-0.1896474, -1.151326, -2.247509, 0, 0, 0, 1, 1,
-0.1840469, -2.002025, -3.170386, 0, 0, 0, 1, 1,
-0.1791299, -0.6006213, -3.520158, 0, 0, 0, 1, 1,
-0.1777031, -0.3125083, -2.305591, 0, 0, 0, 1, 1,
-0.1772522, 0.2926135, -1.451462, 1, 1, 1, 1, 1,
-0.1739222, -0.09104472, -5.284194, 1, 1, 1, 1, 1,
-0.1735257, 0.6342767, 0.3879648, 1, 1, 1, 1, 1,
-0.168524, 0.8513876, 0.7938297, 1, 1, 1, 1, 1,
-0.1671726, -0.6530955, -4.166505, 1, 1, 1, 1, 1,
-0.1671664, 0.301833, 0.783812, 1, 1, 1, 1, 1,
-0.1654519, 0.196398, -0.9988003, 1, 1, 1, 1, 1,
-0.1651486, 1.207555, -1.434479, 1, 1, 1, 1, 1,
-0.1645851, -0.3221616, -2.19579, 1, 1, 1, 1, 1,
-0.1635912, -0.0190238, -1.055542, 1, 1, 1, 1, 1,
-0.1617356, -1.12867, -3.527981, 1, 1, 1, 1, 1,
-0.1612693, -0.9174004, -2.796745, 1, 1, 1, 1, 1,
-0.1575322, 2.160931, -1.076238, 1, 1, 1, 1, 1,
-0.1557146, 1.691694, -0.04670702, 1, 1, 1, 1, 1,
-0.1552446, -1.328171, -1.916155, 1, 1, 1, 1, 1,
-0.1543575, -0.8550909, -2.831394, 0, 0, 1, 1, 1,
-0.1503817, 0.5190084, -0.3100078, 1, 0, 0, 1, 1,
-0.1492556, -1.883898, -3.823277, 1, 0, 0, 1, 1,
-0.1461952, -1.309277, -3.715922, 1, 0, 0, 1, 1,
-0.1448015, -1.812799, -0.8665706, 1, 0, 0, 1, 1,
-0.1439564, -0.9903917, -2.83986, 1, 0, 0, 1, 1,
-0.1432023, -0.5663379, -4.526918, 0, 0, 0, 1, 1,
-0.143171, -0.3168162, -4.891749, 0, 0, 0, 1, 1,
-0.1421444, 1.525657, 0.1691187, 0, 0, 0, 1, 1,
-0.1391061, 1.038967, -0.2985183, 0, 0, 0, 1, 1,
-0.1289942, -0.04281119, -2.556339, 0, 0, 0, 1, 1,
-0.1276134, -0.4939071, -3.82239, 0, 0, 0, 1, 1,
-0.1218657, 0.6041281, 0.7185575, 0, 0, 0, 1, 1,
-0.1213988, -0.1538443, -2.435506, 1, 1, 1, 1, 1,
-0.1173928, -1.837129, -4.794026, 1, 1, 1, 1, 1,
-0.1165325, -0.7266532, -1.694084, 1, 1, 1, 1, 1,
-0.1163319, 1.128654, -0.267827, 1, 1, 1, 1, 1,
-0.112158, -1.671667, -2.556858, 1, 1, 1, 1, 1,
-0.1066954, -0.2100333, -2.247174, 1, 1, 1, 1, 1,
-0.1055362, 0.5608381, -0.6527938, 1, 1, 1, 1, 1,
-0.1048801, 0.6348101, 0.2137235, 1, 1, 1, 1, 1,
-0.1032047, -0.3971554, -2.785773, 1, 1, 1, 1, 1,
-0.1021845, -0.2090469, -3.159902, 1, 1, 1, 1, 1,
-0.1005143, -0.6993392, -2.470869, 1, 1, 1, 1, 1,
-0.09113241, -1.028933, -3.513905, 1, 1, 1, 1, 1,
-0.08816706, 0.2612718, -0.3224624, 1, 1, 1, 1, 1,
-0.08578153, -0.1633319, -4.070539, 1, 1, 1, 1, 1,
-0.08281493, -0.3225793, -2.219182, 1, 1, 1, 1, 1,
-0.08143727, -1.061511, -4.546351, 0, 0, 1, 1, 1,
-0.08128778, 0.8880184, 1.198413, 1, 0, 0, 1, 1,
-0.07918055, 1.421203, -0.5013822, 1, 0, 0, 1, 1,
-0.07066775, 0.5168837, 0.005004856, 1, 0, 0, 1, 1,
-0.06993331, -0.141735, -2.514502, 1, 0, 0, 1, 1,
-0.06853557, -0.8021573, -2.860168, 1, 0, 0, 1, 1,
-0.06450685, 0.8020386, -0.8889978, 0, 0, 0, 1, 1,
-0.0631333, -0.3916438, -3.107611, 0, 0, 0, 1, 1,
-0.06243237, 0.7947263, 0.915446, 0, 0, 0, 1, 1,
-0.06210076, -0.08946696, -3.498081, 0, 0, 0, 1, 1,
-0.06124843, -1.027085, -2.522462, 0, 0, 0, 1, 1,
-0.05716687, -0.8810716, -3.251179, 0, 0, 0, 1, 1,
-0.05588774, 0.3011478, -1.687113, 0, 0, 0, 1, 1,
-0.04955085, -0.5156493, -1.233716, 1, 1, 1, 1, 1,
-0.04409483, 1.522138, 1.624259, 1, 1, 1, 1, 1,
-0.0432439, -1.840914, -4.005025, 1, 1, 1, 1, 1,
-0.04298424, -1.036978, -3.873092, 1, 1, 1, 1, 1,
-0.04199708, 0.244083, -0.7733337, 1, 1, 1, 1, 1,
-0.04074161, -1.76827, -3.31427, 1, 1, 1, 1, 1,
-0.03750334, -0.449976, -4.449384, 1, 1, 1, 1, 1,
-0.03494485, 2.183444, 1.322334, 1, 1, 1, 1, 1,
-0.02497276, 0.119858, 0.9341773, 1, 1, 1, 1, 1,
-0.02231665, 0.06136697, 0.0380152, 1, 1, 1, 1, 1,
-0.021052, -0.4144126, -1.718044, 1, 1, 1, 1, 1,
-0.02000078, -1.282668, -1.877809, 1, 1, 1, 1, 1,
-0.01666358, 1.192059, -1.664362, 1, 1, 1, 1, 1,
-0.01402209, -1.523534, -2.262379, 1, 1, 1, 1, 1,
-0.01205927, -0.2018109, -4.646516, 1, 1, 1, 1, 1,
-0.007756098, -2.103288, -2.329324, 0, 0, 1, 1, 1,
-0.006811069, -0.4818408, -2.599647, 1, 0, 0, 1, 1,
-0.002642524, -0.01492741, -2.412256, 1, 0, 0, 1, 1,
-0.002291229, -0.6382743, -3.991268, 1, 0, 0, 1, 1,
-0.0008679666, 2.050759, 0.5663532, 1, 0, 0, 1, 1,
-0.0008324247, -0.8892246, -4.940271, 1, 0, 0, 1, 1,
0.005554261, 0.2306081, -0.8177627, 0, 0, 0, 1, 1,
0.01656018, -1.069554, 3.147968, 0, 0, 0, 1, 1,
0.01704045, -0.6288992, 3.641699, 0, 0, 0, 1, 1,
0.01809954, 1.968726, -1.267551, 0, 0, 0, 1, 1,
0.02116103, -0.3425704, 3.888926, 0, 0, 0, 1, 1,
0.02126871, -1.34368, 3.358395, 0, 0, 0, 1, 1,
0.02174635, 0.877566, -0.03413101, 0, 0, 0, 1, 1,
0.02208395, 0.425544, 0.5533477, 1, 1, 1, 1, 1,
0.02298966, -0.1913813, 2.942267, 1, 1, 1, 1, 1,
0.02459787, 2.345585, 0.804835, 1, 1, 1, 1, 1,
0.02869458, 0.2709826, 1.684252, 1, 1, 1, 1, 1,
0.02972352, -0.2601402, 3.119868, 1, 1, 1, 1, 1,
0.03175502, 0.8696661, 1.260072, 1, 1, 1, 1, 1,
0.03308569, 1.241799, 1.041892, 1, 1, 1, 1, 1,
0.04252763, -1.480171, 3.436936, 1, 1, 1, 1, 1,
0.04285271, 0.8338334, -2.049862, 1, 1, 1, 1, 1,
0.04908438, -0.2957544, 2.757463, 1, 1, 1, 1, 1,
0.05017669, 0.196367, 0.2800645, 1, 1, 1, 1, 1,
0.05473801, 0.8228187, 1.734429, 1, 1, 1, 1, 1,
0.05687033, 0.07643718, 1.798277, 1, 1, 1, 1, 1,
0.05688698, -0.9691091, 2.778592, 1, 1, 1, 1, 1,
0.0570903, 0.7897063, -0.4743778, 1, 1, 1, 1, 1,
0.05714968, 1.512776, 1.378325, 0, 0, 1, 1, 1,
0.05793832, -1.189796, 2.889632, 1, 0, 0, 1, 1,
0.05862179, -0.3099307, 1.530836, 1, 0, 0, 1, 1,
0.05951526, -0.002778571, 1.354555, 1, 0, 0, 1, 1,
0.06009914, -0.5286933, 4.214874, 1, 0, 0, 1, 1,
0.06150897, -0.8251348, 1.212637, 1, 0, 0, 1, 1,
0.06460544, -0.5853799, 1.787178, 0, 0, 0, 1, 1,
0.06589577, -1.463276, 2.774961, 0, 0, 0, 1, 1,
0.06697928, 0.7870386, 0.7471945, 0, 0, 0, 1, 1,
0.06779567, 1.399944, -0.2743065, 0, 0, 0, 1, 1,
0.06940665, -0.4175381, 2.704201, 0, 0, 0, 1, 1,
0.07010616, 0.08362449, -0.1067166, 0, 0, 0, 1, 1,
0.07105745, -2.543334, 3.263464, 0, 0, 0, 1, 1,
0.07481205, 0.1261679, -0.8646827, 1, 1, 1, 1, 1,
0.07518382, -0.7831255, 3.087978, 1, 1, 1, 1, 1,
0.07820895, -0.06405833, 4.436049, 1, 1, 1, 1, 1,
0.07888185, 0.3233891, 0.600095, 1, 1, 1, 1, 1,
0.08360159, 0.9031945, 1.299235, 1, 1, 1, 1, 1,
0.09244759, -0.4450297, 2.893598, 1, 1, 1, 1, 1,
0.09267183, -0.3471769, 3.800909, 1, 1, 1, 1, 1,
0.09441426, 1.182533, 0.9284389, 1, 1, 1, 1, 1,
0.09571056, 0.006781059, 2.736367, 1, 1, 1, 1, 1,
0.09688168, -0.6910773, 5.375144, 1, 1, 1, 1, 1,
0.09885589, 0.2340347, 1.239303, 1, 1, 1, 1, 1,
0.10315, 0.2826517, 0.6449743, 1, 1, 1, 1, 1,
0.1042378, 0.3649381, -1.454387, 1, 1, 1, 1, 1,
0.1081203, -1.26751, 2.917143, 1, 1, 1, 1, 1,
0.1103193, 0.3269305, 2.049372, 1, 1, 1, 1, 1,
0.1116774, -0.6448314, 3.061576, 0, 0, 1, 1, 1,
0.1121989, 0.1946321, 1.510552, 1, 0, 0, 1, 1,
0.1271348, 0.02592609, 1.371691, 1, 0, 0, 1, 1,
0.1285496, 0.02932903, 1.796951, 1, 0, 0, 1, 1,
0.1297238, 1.421167, -0.9777501, 1, 0, 0, 1, 1,
0.1299856, -0.6332197, 2.184352, 1, 0, 0, 1, 1,
0.1344747, 0.2161314, 0.2399227, 0, 0, 0, 1, 1,
0.1366262, 0.8945953, 0.02828004, 0, 0, 0, 1, 1,
0.1393126, -0.1576828, 2.500519, 0, 0, 0, 1, 1,
0.1394677, 0.6401429, -1.236817, 0, 0, 0, 1, 1,
0.1512711, -0.4866343, 4.144092, 0, 0, 0, 1, 1,
0.1524895, -0.4973206, 3.283678, 0, 0, 0, 1, 1,
0.1651892, 1.292742, 0.4373247, 0, 0, 0, 1, 1,
0.1656291, -0.2004454, 2.678066, 1, 1, 1, 1, 1,
0.1658263, 0.08875406, 2.377069, 1, 1, 1, 1, 1,
0.1666297, -0.7629718, 2.820991, 1, 1, 1, 1, 1,
0.1676396, 1.009317, 2.188353, 1, 1, 1, 1, 1,
0.1700835, -0.9058914, 3.758162, 1, 1, 1, 1, 1,
0.1707489, 0.05843565, 0.2601777, 1, 1, 1, 1, 1,
0.1715848, -0.7143863, 4.252678, 1, 1, 1, 1, 1,
0.1788701, 0.1301754, 0.663353, 1, 1, 1, 1, 1,
0.1852868, 0.02200539, 1.820106, 1, 1, 1, 1, 1,
0.1873767, 1.116491, -1.070153, 1, 1, 1, 1, 1,
0.189547, 0.8815684, 2.07217, 1, 1, 1, 1, 1,
0.1922767, -0.9969401, 4.364874, 1, 1, 1, 1, 1,
0.1936477, -0.61123, 4.130958, 1, 1, 1, 1, 1,
0.1956451, -0.6910453, 3.407534, 1, 1, 1, 1, 1,
0.196482, 1.018104, 0.3538941, 1, 1, 1, 1, 1,
0.1968807, 1.015147, -1.367171, 0, 0, 1, 1, 1,
0.2007812, 2.294716, -0.7660652, 1, 0, 0, 1, 1,
0.203235, -0.3094068, 1.970423, 1, 0, 0, 1, 1,
0.2037487, 0.7898223, 0.516923, 1, 0, 0, 1, 1,
0.2122817, -0.1767119, 1.49943, 1, 0, 0, 1, 1,
0.2142608, -2.285801, 2.892972, 1, 0, 0, 1, 1,
0.2155767, 0.5972143, -0.4297452, 0, 0, 0, 1, 1,
0.2179089, -1.892096, 3.165168, 0, 0, 0, 1, 1,
0.2184563, 0.2828836, 1.978, 0, 0, 0, 1, 1,
0.2187777, 1.406375, -0.5916638, 0, 0, 0, 1, 1,
0.2222533, 0.6884395, 0.6484062, 0, 0, 0, 1, 1,
0.2223352, 0.07352643, 0.8313166, 0, 0, 0, 1, 1,
0.2284495, -1.809245, 4.555253, 0, 0, 0, 1, 1,
0.2312775, -1.458968, 2.56117, 1, 1, 1, 1, 1,
0.2318644, 1.113587, 1.227844, 1, 1, 1, 1, 1,
0.2340435, -0.3550292, 3.465681, 1, 1, 1, 1, 1,
0.2361712, 1.15922, -0.07378934, 1, 1, 1, 1, 1,
0.2363748, -0.9911533, 1.328204, 1, 1, 1, 1, 1,
0.2369304, 0.8474481, 1.114467, 1, 1, 1, 1, 1,
0.2385385, -1.25824, 3.092071, 1, 1, 1, 1, 1,
0.2393296, -1.630268, 1.733905, 1, 1, 1, 1, 1,
0.2404748, -0.9325936, 3.315087, 1, 1, 1, 1, 1,
0.247276, 1.089219, -1.161929, 1, 1, 1, 1, 1,
0.2490189, -0.09820165, 2.663646, 1, 1, 1, 1, 1,
0.2492688, 0.6991105, -1.816943, 1, 1, 1, 1, 1,
0.2525069, -0.7019005, 2.674828, 1, 1, 1, 1, 1,
0.2526217, 0.6826515, 0.5221593, 1, 1, 1, 1, 1,
0.2527145, -0.8720486, 2.267784, 1, 1, 1, 1, 1,
0.2574394, -0.2276831, 3.594746, 0, 0, 1, 1, 1,
0.2575166, 2.409023, -1.371515, 1, 0, 0, 1, 1,
0.2592476, -0.5767729, 2.237022, 1, 0, 0, 1, 1,
0.2627513, 0.9776928, -0.3286116, 1, 0, 0, 1, 1,
0.2637558, -0.5086483, 3.079489, 1, 0, 0, 1, 1,
0.2642382, -1.410243, 2.568831, 1, 0, 0, 1, 1,
0.2672359, 1.283375, 0.04030672, 0, 0, 0, 1, 1,
0.270733, 0.6591305, 1.88684, 0, 0, 0, 1, 1,
0.2746879, 0.7228119, 1.294127, 0, 0, 0, 1, 1,
0.2755141, 0.4915648, 1.160574, 0, 0, 0, 1, 1,
0.2766277, 0.8477369, -0.5282468, 0, 0, 0, 1, 1,
0.2768733, 0.1295348, 1.538937, 0, 0, 0, 1, 1,
0.2791018, 0.2653463, -0.06101632, 0, 0, 0, 1, 1,
0.2851031, 0.4048935, 1.859647, 1, 1, 1, 1, 1,
0.2875091, 0.288686, 0.9536675, 1, 1, 1, 1, 1,
0.2941261, 0.3579423, 0.7019628, 1, 1, 1, 1, 1,
0.29796, 0.341447, 0.842938, 1, 1, 1, 1, 1,
0.3041209, 0.6979819, 0.2547659, 1, 1, 1, 1, 1,
0.3056367, 1.730324, -0.09895094, 1, 1, 1, 1, 1,
0.3096029, -1.539568, 1.815366, 1, 1, 1, 1, 1,
0.309626, -0.6446919, 2.211945, 1, 1, 1, 1, 1,
0.3101206, 0.2081047, 0.06680033, 1, 1, 1, 1, 1,
0.3112184, 2.063058, -0.3556135, 1, 1, 1, 1, 1,
0.316229, 0.9643821, -0.04248169, 1, 1, 1, 1, 1,
0.3176258, -1.780982, 3.188578, 1, 1, 1, 1, 1,
0.3180555, 1.358876, 0.2670045, 1, 1, 1, 1, 1,
0.3195574, -0.7357593, 1.333509, 1, 1, 1, 1, 1,
0.3214588, -0.7846122, 2.799526, 1, 1, 1, 1, 1,
0.3233728, 1.685628, -0.05581794, 0, 0, 1, 1, 1,
0.325318, -1.87057, 4.334682, 1, 0, 0, 1, 1,
0.3276169, -0.786113, 3.27478, 1, 0, 0, 1, 1,
0.3302682, 0.6884981, 0.7493988, 1, 0, 0, 1, 1,
0.3354376, 1.027744, 0.2015227, 1, 0, 0, 1, 1,
0.335647, -0.1239459, 3.226632, 1, 0, 0, 1, 1,
0.3372548, 0.2298262, -0.3760027, 0, 0, 0, 1, 1,
0.3431983, -1.513596, 4.910324, 0, 0, 0, 1, 1,
0.3436876, -0.936885, 4.25428, 0, 0, 0, 1, 1,
0.3487835, 0.389264, 0.7635143, 0, 0, 0, 1, 1,
0.3499695, -0.8563929, 0.31121, 0, 0, 0, 1, 1,
0.3503898, 0.9176179, -1.733231, 0, 0, 0, 1, 1,
0.3526299, 1.566884, 0.6882835, 0, 0, 0, 1, 1,
0.355864, -0.4105943, 2.374222, 1, 1, 1, 1, 1,
0.3606783, 1.279351, 0.4358673, 1, 1, 1, 1, 1,
0.3749509, 1.04278, -1.142863, 1, 1, 1, 1, 1,
0.3753564, 0.3707999, 1.284621, 1, 1, 1, 1, 1,
0.3768824, -0.1444603, 1.244016, 1, 1, 1, 1, 1,
0.3778776, -0.421848, 1.509179, 1, 1, 1, 1, 1,
0.3809878, -0.2566222, 1.195642, 1, 1, 1, 1, 1,
0.3822738, 1.245556, -0.1057651, 1, 1, 1, 1, 1,
0.3854287, -0.146822, 1.52207, 1, 1, 1, 1, 1,
0.3865549, 0.02443723, 2.073393, 1, 1, 1, 1, 1,
0.3883808, 0.3409043, 0.3338979, 1, 1, 1, 1, 1,
0.3895695, 1.550758, 0.4356768, 1, 1, 1, 1, 1,
0.3903187, 0.7834324, 1.19909, 1, 1, 1, 1, 1,
0.4011919, -0.2739634, 1.433312, 1, 1, 1, 1, 1,
0.4021267, 1.428293, -0.01423991, 1, 1, 1, 1, 1,
0.4032586, -0.8231323, 2.720456, 0, 0, 1, 1, 1,
0.403666, -1.150263, 2.952812, 1, 0, 0, 1, 1,
0.4056449, -1.138125, 2.789796, 1, 0, 0, 1, 1,
0.4061536, -0.3039261, 4.970908, 1, 0, 0, 1, 1,
0.4086216, -0.1132868, 0.2637321, 1, 0, 0, 1, 1,
0.412031, 0.1422779, 1.739278, 1, 0, 0, 1, 1,
0.4161895, 1.294776, 1.493677, 0, 0, 0, 1, 1,
0.4185353, -1.062321, 3.951555, 0, 0, 0, 1, 1,
0.4189922, -0.3973206, 2.24897, 0, 0, 0, 1, 1,
0.4195606, 2.12888, -0.6642022, 0, 0, 0, 1, 1,
0.422571, 1.338378, 1.596417, 0, 0, 0, 1, 1,
0.4258623, -1.181479, 1.71003, 0, 0, 0, 1, 1,
0.4305049, 0.9017687, 0.2377162, 0, 0, 0, 1, 1,
0.4328535, -0.9421876, 0.4436053, 1, 1, 1, 1, 1,
0.4383584, 0.1052373, 2.671825, 1, 1, 1, 1, 1,
0.4404248, -1.169, 2.865301, 1, 1, 1, 1, 1,
0.4408782, 1.341123, 1.260609, 1, 1, 1, 1, 1,
0.4409904, 0.8825407, 0.7240781, 1, 1, 1, 1, 1,
0.4427293, -0.4179251, 1.904814, 1, 1, 1, 1, 1,
0.443208, -0.6071069, 3.046278, 1, 1, 1, 1, 1,
0.4445943, -0.737792, 3.745663, 1, 1, 1, 1, 1,
0.4471449, 0.1129198, 1.141693, 1, 1, 1, 1, 1,
0.4482315, 0.2350571, 1.492758, 1, 1, 1, 1, 1,
0.4490714, 0.7374942, 0.03583183, 1, 1, 1, 1, 1,
0.4526533, -0.7292035, 1.587195, 1, 1, 1, 1, 1,
0.4547268, -0.5369932, 1.151889, 1, 1, 1, 1, 1,
0.4566177, 0.03615795, 0.8294268, 1, 1, 1, 1, 1,
0.457287, 0.005252791, 1.632204, 1, 1, 1, 1, 1,
0.4601267, 0.9481292, -0.000796105, 0, 0, 1, 1, 1,
0.4647879, 0.8394528, 0.3404898, 1, 0, 0, 1, 1,
0.4657035, -1.525465, 2.304122, 1, 0, 0, 1, 1,
0.4696412, 1.292524, -0.6617116, 1, 0, 0, 1, 1,
0.4724323, -0.2896377, 0.7769331, 1, 0, 0, 1, 1,
0.4773356, 0.949741, 1.740935, 1, 0, 0, 1, 1,
0.4781649, 0.7917576, 1.383826, 0, 0, 0, 1, 1,
0.483169, -0.3800221, 1.266916, 0, 0, 0, 1, 1,
0.4870039, 0.6129131, 0.8085353, 0, 0, 0, 1, 1,
0.4881225, -1.376634, 3.118547, 0, 0, 0, 1, 1,
0.4946917, 0.3363929, 1.217321, 0, 0, 0, 1, 1,
0.4949085, -1.690028, 4.848704, 0, 0, 0, 1, 1,
0.4983787, 1.044107, -0.3574204, 0, 0, 0, 1, 1,
0.4984005, -1.167862, 3.61396, 1, 1, 1, 1, 1,
0.4998034, 0.3200052, 1.50901, 1, 1, 1, 1, 1,
0.499854, 1.596719, -0.8213092, 1, 1, 1, 1, 1,
0.5007405, 0.4516841, 1.821907, 1, 1, 1, 1, 1,
0.5021614, 0.8149111, -1.653188, 1, 1, 1, 1, 1,
0.5114364, -1.322033, 2.498854, 1, 1, 1, 1, 1,
0.5150199, 1.397766, 0.4029854, 1, 1, 1, 1, 1,
0.5194032, -1.477808, 3.214403, 1, 1, 1, 1, 1,
0.521983, 1.340665, 0.169144, 1, 1, 1, 1, 1,
0.5238176, 0.7933545, -0.4777232, 1, 1, 1, 1, 1,
0.5244727, -0.01426798, 2.381343, 1, 1, 1, 1, 1,
0.5256056, -1.060181, 3.500453, 1, 1, 1, 1, 1,
0.5270116, -0.3283837, 1.503376, 1, 1, 1, 1, 1,
0.5277905, -1.046093, 1.69275, 1, 1, 1, 1, 1,
0.5286701, -0.8922771, 1.622508, 1, 1, 1, 1, 1,
0.5292294, 0.7611212, 0.717726, 0, 0, 1, 1, 1,
0.5329426, 0.8923489, 1.612868, 1, 0, 0, 1, 1,
0.5369639, -1.185691, 4.755253, 1, 0, 0, 1, 1,
0.5378444, 2.045145, 2.276479, 1, 0, 0, 1, 1,
0.5408065, -1.785465, 3.779917, 1, 0, 0, 1, 1,
0.5438157, -1.538134, 1.230987, 1, 0, 0, 1, 1,
0.5474401, -0.1097874, 2.56006, 0, 0, 0, 1, 1,
0.5517666, -1.903522, 3.086966, 0, 0, 0, 1, 1,
0.5578752, -0.5711697, 3.795073, 0, 0, 0, 1, 1,
0.5583764, -0.03439224, 1.126337, 0, 0, 0, 1, 1,
0.5697742, 0.6557031, 1.331363, 0, 0, 0, 1, 1,
0.5794273, 1.187629, 0.6562881, 0, 0, 0, 1, 1,
0.5872608, -1.618218, 3.499773, 0, 0, 0, 1, 1,
0.5875059, -0.7111851, 2.378464, 1, 1, 1, 1, 1,
0.5891461, 0.173258, 0.1023358, 1, 1, 1, 1, 1,
0.5904029, 0.6774827, -0.6054385, 1, 1, 1, 1, 1,
0.5909044, 3.47219, -0.03857716, 1, 1, 1, 1, 1,
0.591898, 1.027195, -0.7834744, 1, 1, 1, 1, 1,
0.5926712, -0.7416728, 2.57616, 1, 1, 1, 1, 1,
0.6045416, 1.43283, 1.080649, 1, 1, 1, 1, 1,
0.6059349, -0.5280027, 1.490559, 1, 1, 1, 1, 1,
0.6077895, 0.1678797, 1.158717, 1, 1, 1, 1, 1,
0.6083936, 1.237058, -1.732306, 1, 1, 1, 1, 1,
0.608535, -0.7918285, 1.333528, 1, 1, 1, 1, 1,
0.6101244, -0.6361663, 1.840358, 1, 1, 1, 1, 1,
0.6149219, -0.00868826, 3.972855, 1, 1, 1, 1, 1,
0.617163, 1.164186, 0.5078168, 1, 1, 1, 1, 1,
0.622068, -1.176415, 4.640523, 1, 1, 1, 1, 1,
0.6276892, 2.02861, 0.1075104, 0, 0, 1, 1, 1,
0.6369673, -1.067431, 2.654812, 1, 0, 0, 1, 1,
0.6377634, 0.5295679, -0.3082075, 1, 0, 0, 1, 1,
0.6381284, -1.259793, 2.684173, 1, 0, 0, 1, 1,
0.6411461, -0.3347489, 3.492086, 1, 0, 0, 1, 1,
0.6516278, -2.24055, 4.596033, 1, 0, 0, 1, 1,
0.6533706, 1.028271, 0.6670031, 0, 0, 0, 1, 1,
0.6629182, -0.6170182, 2.993682, 0, 0, 0, 1, 1,
0.6631225, 2.100606, 2.499017, 0, 0, 0, 1, 1,
0.6718218, -0.06017631, 2.976514, 0, 0, 0, 1, 1,
0.6740902, 0.3583644, 0.7740372, 0, 0, 0, 1, 1,
0.6756771, -1.007462, 2.75422, 0, 0, 0, 1, 1,
0.6757708, 1.135827, 0.4435897, 0, 0, 0, 1, 1,
0.6869318, 0.2655662, 1.335737, 1, 1, 1, 1, 1,
0.6892809, -0.0950423, 2.119176, 1, 1, 1, 1, 1,
0.6914244, -0.9633322, 3.702274, 1, 1, 1, 1, 1,
0.7115297, -0.4294673, 2.09133, 1, 1, 1, 1, 1,
0.7139512, 0.2125692, 0.3379577, 1, 1, 1, 1, 1,
0.7163965, -0.707539, 3.664086, 1, 1, 1, 1, 1,
0.7206933, -1.210051, 1.810399, 1, 1, 1, 1, 1,
0.7207432, -0.5847454, 3.765538, 1, 1, 1, 1, 1,
0.7275454, -0.9733624, 3.216021, 1, 1, 1, 1, 1,
0.7278675, 1.700463, -0.1651694, 1, 1, 1, 1, 1,
0.7282623, 1.413941, 2.745081, 1, 1, 1, 1, 1,
0.7289445, 0.3433506, 0.5371893, 1, 1, 1, 1, 1,
0.7317392, 0.8792734, 0.004063081, 1, 1, 1, 1, 1,
0.7364189, -1.635463, 2.074801, 1, 1, 1, 1, 1,
0.743122, -1.322467, 0.4992203, 1, 1, 1, 1, 1,
0.7500208, 0.2972374, 0.5852225, 0, 0, 1, 1, 1,
0.7503283, -0.397212, 2.269482, 1, 0, 0, 1, 1,
0.7529632, -0.9055296, 3.487569, 1, 0, 0, 1, 1,
0.753472, 0.1975007, 1.222216, 1, 0, 0, 1, 1,
0.7541556, -0.5041854, 4.333658, 1, 0, 0, 1, 1,
0.756658, -0.7360671, 2.300901, 1, 0, 0, 1, 1,
0.757411, 0.7894402, 2.068063, 0, 0, 0, 1, 1,
0.7584823, 0.05811248, -0.4000485, 0, 0, 0, 1, 1,
0.7604775, 0.2582287, 0.568673, 0, 0, 0, 1, 1,
0.7638769, 1.99494, 0.1934469, 0, 0, 0, 1, 1,
0.7706369, 0.06151803, 1.268454, 0, 0, 0, 1, 1,
0.7715697, 2.034775, 2.106064, 0, 0, 0, 1, 1,
0.7729724, -0.7350118, 3.013634, 0, 0, 0, 1, 1,
0.7792233, -0.2130769, 0.8959311, 1, 1, 1, 1, 1,
0.7816834, -1.463538, 2.712872, 1, 1, 1, 1, 1,
0.7824905, -0.872857, 1.76116, 1, 1, 1, 1, 1,
0.7873321, -0.3847812, 3.191872, 1, 1, 1, 1, 1,
0.7893775, 0.2998316, -1.239346, 1, 1, 1, 1, 1,
0.7907825, -1.802871, 2.624097, 1, 1, 1, 1, 1,
0.7937275, -1.978451, 4.437554, 1, 1, 1, 1, 1,
0.7986138, -1.44458, 2.333187, 1, 1, 1, 1, 1,
0.8031866, -0.1410979, 2.451787, 1, 1, 1, 1, 1,
0.8079323, -0.2692894, 2.529459, 1, 1, 1, 1, 1,
0.8080048, -0.5703333, 2.56715, 1, 1, 1, 1, 1,
0.8082477, 0.5703201, 2.921784, 1, 1, 1, 1, 1,
0.8160344, 0.4522742, 1.244257, 1, 1, 1, 1, 1,
0.8176907, -0.07725867, 1.114899, 1, 1, 1, 1, 1,
0.820816, 1.103293, -0.6996045, 1, 1, 1, 1, 1,
0.8212085, -0.9416112, 2.055835, 0, 0, 1, 1, 1,
0.8229331, -1.136295, 3.845539, 1, 0, 0, 1, 1,
0.8236742, 0.08000457, 1.573414, 1, 0, 0, 1, 1,
0.8240814, 0.2206698, 0.7899467, 1, 0, 0, 1, 1,
0.8382257, -0.02886913, 2.891572, 1, 0, 0, 1, 1,
0.8417631, -1.046252, 1.967935, 1, 0, 0, 1, 1,
0.8561204, 1.447605, 0.224663, 0, 0, 0, 1, 1,
0.8625764, 1.178695, 2.197973, 0, 0, 0, 1, 1,
0.8638816, -0.5725837, 2.7477, 0, 0, 0, 1, 1,
0.8644562, 1.749208, 0.05567252, 0, 0, 0, 1, 1,
0.865433, 1.387851, -0.549372, 0, 0, 0, 1, 1,
0.8666966, -1.472041, 3.391381, 0, 0, 0, 1, 1,
0.8698338, -1.240211, 1.327327, 0, 0, 0, 1, 1,
0.8731669, -0.9700818, 3.517337, 1, 1, 1, 1, 1,
0.8756827, 1.057871, 1.021822, 1, 1, 1, 1, 1,
0.8960066, 0.219373, 1.249964, 1, 1, 1, 1, 1,
0.8976906, -0.3448964, 2.141963, 1, 1, 1, 1, 1,
0.8979212, 0.06729326, 0.996592, 1, 1, 1, 1, 1,
0.9012263, 0.06857917, 1.106524, 1, 1, 1, 1, 1,
0.9029491, -0.8865733, 2.3266, 1, 1, 1, 1, 1,
0.9046945, 0.3120537, 1.964646, 1, 1, 1, 1, 1,
0.9111435, 0.1203867, 2.899665, 1, 1, 1, 1, 1,
0.9184316, 0.6688936, 1.294871, 1, 1, 1, 1, 1,
0.9198956, 1.297099, -0.8373427, 1, 1, 1, 1, 1,
0.9221646, 0.718368, 1.153917, 1, 1, 1, 1, 1,
0.9246557, 0.4823186, 1.211695, 1, 1, 1, 1, 1,
0.9343251, 2.850378, 0.6249256, 1, 1, 1, 1, 1,
0.9358426, -1.594061, 1.742311, 1, 1, 1, 1, 1,
0.9428383, 0.4166715, 4.342749, 0, 0, 1, 1, 1,
0.9542308, 1.360154, 1.293342, 1, 0, 0, 1, 1,
0.9597093, 2.204705, -0.7985098, 1, 0, 0, 1, 1,
0.9613002, 0.6371397, 1.464057, 1, 0, 0, 1, 1,
0.9694937, 0.1193147, 0.5055609, 1, 0, 0, 1, 1,
0.9781646, 0.6088383, -0.189953, 1, 0, 0, 1, 1,
0.9817357, 0.245604, 2.28525, 0, 0, 0, 1, 1,
0.9864078, 0.9518059, -0.7065797, 0, 0, 0, 1, 1,
0.9873629, 0.2982246, 2.051955, 0, 0, 0, 1, 1,
0.9883589, -0.788139, 1.944793, 0, 0, 0, 1, 1,
0.9963806, -0.044404, -1.246609, 0, 0, 0, 1, 1,
0.9963826, -1.621575, 1.949716, 0, 0, 0, 1, 1,
0.9977895, -0.4249018, 1.608701, 0, 0, 0, 1, 1,
1.002129, 0.5078394, 0.1552249, 1, 1, 1, 1, 1,
1.015362, -0.5289856, 2.292696, 1, 1, 1, 1, 1,
1.020062, -1.318136, 2.80337, 1, 1, 1, 1, 1,
1.0223, -0.1826313, 3.321448, 1, 1, 1, 1, 1,
1.031634, -0.9780016, 2.373594, 1, 1, 1, 1, 1,
1.03466, 1.419663, 0.8499998, 1, 1, 1, 1, 1,
1.035071, 1.018011, 2.884874, 1, 1, 1, 1, 1,
1.040774, -1.30522, 2.779213, 1, 1, 1, 1, 1,
1.048742, -0.3011731, 2.721272, 1, 1, 1, 1, 1,
1.052124, -1.754589, 0.8983905, 1, 1, 1, 1, 1,
1.058366, -1.83519, 1.374175, 1, 1, 1, 1, 1,
1.058385, -0.2758628, 1.256409, 1, 1, 1, 1, 1,
1.060281, -0.0675241, 3.419538, 1, 1, 1, 1, 1,
1.060456, 0.2276623, 3.719424, 1, 1, 1, 1, 1,
1.061749, 0.9564829, 1.751018, 1, 1, 1, 1, 1,
1.066215, 0.4622625, 1.08639, 0, 0, 1, 1, 1,
1.066644, 1.86967, 0.138832, 1, 0, 0, 1, 1,
1.067001, 0.3819858, 1.008298, 1, 0, 0, 1, 1,
1.070922, -0.2641907, 1.877484, 1, 0, 0, 1, 1,
1.073649, -1.60866, 3.628927, 1, 0, 0, 1, 1,
1.075535, 0.2136989, 2.377107, 1, 0, 0, 1, 1,
1.078459, 0.5084837, 0.4925551, 0, 0, 0, 1, 1,
1.085936, 0.8610126, 1.145428, 0, 0, 0, 1, 1,
1.089955, 1.092369, 1.830753, 0, 0, 0, 1, 1,
1.092735, -0.6816981, 1.535801, 0, 0, 0, 1, 1,
1.096701, 0.5914273, 1.773897, 0, 0, 0, 1, 1,
1.098831, 1.111689, 1.116749, 0, 0, 0, 1, 1,
1.103315, -1.836378, 2.457763, 0, 0, 0, 1, 1,
1.110498, 0.8116975, 0.6701404, 1, 1, 1, 1, 1,
1.11368, 0.3357936, -0.2137709, 1, 1, 1, 1, 1,
1.120476, 0.2629409, 0.1953699, 1, 1, 1, 1, 1,
1.125276, 0.5479741, 1.319599, 1, 1, 1, 1, 1,
1.12642, 1.020877, 2.027396, 1, 1, 1, 1, 1,
1.142184, 1.562537, 0.8814033, 1, 1, 1, 1, 1,
1.146043, -1.467242, 3.01622, 1, 1, 1, 1, 1,
1.146704, 0.2549533, 1.734978, 1, 1, 1, 1, 1,
1.151239, -0.4470479, 0.8958312, 1, 1, 1, 1, 1,
1.172438, 1.766379, 1.826874, 1, 1, 1, 1, 1,
1.176794, -0.02491206, 2.542736, 1, 1, 1, 1, 1,
1.177252, 0.2343333, 0.6655211, 1, 1, 1, 1, 1,
1.18047, 0.6355186, 0.2618241, 1, 1, 1, 1, 1,
1.182111, 0.9338857, 0.3287587, 1, 1, 1, 1, 1,
1.206458, -0.8262025, 0.3751216, 1, 1, 1, 1, 1,
1.214769, 0.3301791, 2.592334, 0, 0, 1, 1, 1,
1.219777, 1.188617, 1.199047, 1, 0, 0, 1, 1,
1.229698, -0.7919309, 3.97476, 1, 0, 0, 1, 1,
1.237113, -1.217938, 1.22684, 1, 0, 0, 1, 1,
1.256812, -1.475786, 2.231664, 1, 0, 0, 1, 1,
1.267288, 0.1692774, 1.317488, 1, 0, 0, 1, 1,
1.267828, -0.1393439, 2.060552, 0, 0, 0, 1, 1,
1.273871, 1.511449, 0.3342228, 0, 0, 0, 1, 1,
1.274833, 0.04146419, 2.186186, 0, 0, 0, 1, 1,
1.279307, -0.6333644, 2.684767, 0, 0, 0, 1, 1,
1.294538, 0.9824314, -0.31019, 0, 0, 0, 1, 1,
1.295961, -2.120061, 1.73331, 0, 0, 0, 1, 1,
1.296934, -0.9399737, 2.455495, 0, 0, 0, 1, 1,
1.302164, 1.301382, -0.3024904, 1, 1, 1, 1, 1,
1.317427, -0.5382226, 3.325718, 1, 1, 1, 1, 1,
1.31935, 0.5745732, 2.626511, 1, 1, 1, 1, 1,
1.324975, 0.08453361, 0.6408486, 1, 1, 1, 1, 1,
1.32763, 0.7857485, 1.78771, 1, 1, 1, 1, 1,
1.337319, 0.09033724, 0.6238004, 1, 1, 1, 1, 1,
1.338709, -0.1811101, 0.7875101, 1, 1, 1, 1, 1,
1.348626, -0.5469339, 2.26212, 1, 1, 1, 1, 1,
1.353397, 0.2737384, 3.477252, 1, 1, 1, 1, 1,
1.359316, -1.044566, 2.754308, 1, 1, 1, 1, 1,
1.36156, 1.24764, 0.1413664, 1, 1, 1, 1, 1,
1.366144, -1.411483, 1.740941, 1, 1, 1, 1, 1,
1.366434, 0.1777467, 0.741261, 1, 1, 1, 1, 1,
1.368162, -0.07363714, 0.238714, 1, 1, 1, 1, 1,
1.370062, -0.705539, 2.603606, 1, 1, 1, 1, 1,
1.383676, -0.8598841, 2.924111, 0, 0, 1, 1, 1,
1.396676, -0.6040722, 3.345928, 1, 0, 0, 1, 1,
1.399345, -0.8767008, 2.877975, 1, 0, 0, 1, 1,
1.401433, 0.9480188, -1.052637, 1, 0, 0, 1, 1,
1.406102, 0.4146665, 0.5225526, 1, 0, 0, 1, 1,
1.408391, 0.9171613, 1.608506, 1, 0, 0, 1, 1,
1.409609, -0.9873718, 2.587653, 0, 0, 0, 1, 1,
1.417478, 0.383662, 1.47807, 0, 0, 0, 1, 1,
1.437521, -1.930617, 4.299768, 0, 0, 0, 1, 1,
1.440713, -0.5742093, 1.547689, 0, 0, 0, 1, 1,
1.473048, -0.5078856, 1.47077, 0, 0, 0, 1, 1,
1.48032, 0.8512593, 1.689313, 0, 0, 0, 1, 1,
1.496629, -0.9747811, 2.660189, 0, 0, 0, 1, 1,
1.502648, 0.7636851, 1.413487, 1, 1, 1, 1, 1,
1.507498, -0.7495668, 3.019788, 1, 1, 1, 1, 1,
1.515397, -0.8424203, 1.425775, 1, 1, 1, 1, 1,
1.528366, 1.417455, 1.24563, 1, 1, 1, 1, 1,
1.538841, -0.1383167, 1.610524, 1, 1, 1, 1, 1,
1.555203, 0.01012786, 2.324534, 1, 1, 1, 1, 1,
1.579203, 1.678391, -0.3189268, 1, 1, 1, 1, 1,
1.590068, 0.1236532, 0.614507, 1, 1, 1, 1, 1,
1.600356, 1.021276, 1.152699, 1, 1, 1, 1, 1,
1.604464, 0.4007481, 1.142052, 1, 1, 1, 1, 1,
1.607833, -0.1681371, 2.237717, 1, 1, 1, 1, 1,
1.632802, 0.7193776, 1.54239, 1, 1, 1, 1, 1,
1.644806, 1.196402, 2.838469, 1, 1, 1, 1, 1,
1.646683, -0.4688516, 2.121375, 1, 1, 1, 1, 1,
1.653755, -1.020295, 2.789547, 1, 1, 1, 1, 1,
1.659431, -0.292614, 1.912464, 0, 0, 1, 1, 1,
1.681431, -0.1226176, 1.595912, 1, 0, 0, 1, 1,
1.681562, 1.306118, 0.817582, 1, 0, 0, 1, 1,
1.687547, 0.6321565, 2.034565, 1, 0, 0, 1, 1,
1.689043, -1.06189, 1.905847, 1, 0, 0, 1, 1,
1.690143, -1.479329, 2.811627, 1, 0, 0, 1, 1,
1.695998, 0.08528566, 1.272459, 0, 0, 0, 1, 1,
1.716323, -1.355854, 2.26304, 0, 0, 0, 1, 1,
1.721139, -0.1292394, 0.7222125, 0, 0, 0, 1, 1,
1.731916, -0.5000769, 2.005985, 0, 0, 0, 1, 1,
1.73452, 0.06216075, 2.480286, 0, 0, 0, 1, 1,
1.736124, -0.4249325, 1.636168, 0, 0, 0, 1, 1,
1.736273, 1.065344, 1.430947, 0, 0, 0, 1, 1,
1.742952, 0.6153582, 2.137028, 1, 1, 1, 1, 1,
1.803357, -0.6401469, 1.915299, 1, 1, 1, 1, 1,
1.80571, -1.729817, 3.087856, 1, 1, 1, 1, 1,
1.814673, -0.1045739, 1.116496, 1, 1, 1, 1, 1,
1.829534, -0.9283455, 3.39934, 1, 1, 1, 1, 1,
1.836736, -1.143147, 3.328295, 1, 1, 1, 1, 1,
1.85269, 1.520267, -0.2911218, 1, 1, 1, 1, 1,
1.867425, 0.5122694, 1.09205, 1, 1, 1, 1, 1,
1.868066, -1.396198, 2.974786, 1, 1, 1, 1, 1,
1.878439, -0.3557729, 3.536337, 1, 1, 1, 1, 1,
1.891219, 1.060758, 0.489402, 1, 1, 1, 1, 1,
1.897061, -0.1355447, 1.259568, 1, 1, 1, 1, 1,
1.903957, -0.9379084, 2.045436, 1, 1, 1, 1, 1,
1.911725, -0.6237708, 1.745428, 1, 1, 1, 1, 1,
1.919366, -1.036592, 1.759039, 1, 1, 1, 1, 1,
1.934295, 0.5827045, 1.084979, 0, 0, 1, 1, 1,
1.992969, 0.7976542, 3.015212, 1, 0, 0, 1, 1,
1.995706, -0.7643493, 2.73405, 1, 0, 0, 1, 1,
2.137112, 0.9840354, 0.8663969, 1, 0, 0, 1, 1,
2.148503, 0.09391253, 2.718489, 1, 0, 0, 1, 1,
2.183415, -0.4075755, 0.6200941, 1, 0, 0, 1, 1,
2.243177, 0.09643181, 0.9724708, 0, 0, 0, 1, 1,
2.270625, 0.4268928, 3.089818, 0, 0, 0, 1, 1,
2.316618, 0.7066409, 0.817847, 0, 0, 0, 1, 1,
2.365852, 2.120149, 0.852092, 0, 0, 0, 1, 1,
2.42885, -0.01697686, 0.5837198, 0, 0, 0, 1, 1,
2.445189, 0.4881814, -0.1441991, 0, 0, 0, 1, 1,
2.449405, -1.247542, 2.843298, 0, 0, 0, 1, 1,
2.457662, 0.9685763, 0.3110263, 1, 1, 1, 1, 1,
2.579003, 0.9458029, 0.6509139, 1, 1, 1, 1, 1,
2.630059, 0.1083026, 0.4819113, 1, 1, 1, 1, 1,
2.674667, -0.5538737, 2.15037, 1, 1, 1, 1, 1,
2.722304, -0.167284, -0.4340852, 1, 1, 1, 1, 1,
2.916247, -0.371457, 1.352082, 1, 1, 1, 1, 1,
3.212392, 1.133861, 2.520172, 1, 1, 1, 1, 1
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
var radius = 9.526591;
var distance = 33.46175;
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
mvMatrix.translate( -0.02047729, -0.3046895, -0.04547524 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.46175);
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
