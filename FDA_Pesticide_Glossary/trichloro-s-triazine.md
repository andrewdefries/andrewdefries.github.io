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
-3.015064, -0.9160763, 0.3413017, 1, 0, 0, 1,
-2.988846, 0.1118914, -3.206951, 1, 0.007843138, 0, 1,
-2.865657, -0.8054761, -2.480067, 1, 0.01176471, 0, 1,
-2.778346, 1.054466, -1.181933, 1, 0.01960784, 0, 1,
-2.753772, -0.03474945, 0.07203864, 1, 0.02352941, 0, 1,
-2.7489, 0.3702359, -0.87269, 1, 0.03137255, 0, 1,
-2.529045, 0.5587918, -2.447361, 1, 0.03529412, 0, 1,
-2.507443, -0.1766979, -1.184467, 1, 0.04313726, 0, 1,
-2.452089, 0.3189398, -1.349558, 1, 0.04705882, 0, 1,
-2.40709, -0.2717199, -2.982673, 1, 0.05490196, 0, 1,
-2.342108, -0.9085154, -1.748576, 1, 0.05882353, 0, 1,
-2.288969, 1.704829, -2.789244, 1, 0.06666667, 0, 1,
-2.239614, 0.7303514, -0.7274275, 1, 0.07058824, 0, 1,
-2.181444, 0.5548725, -0.1467246, 1, 0.07843138, 0, 1,
-2.150214, 0.9800504, -2.662037, 1, 0.08235294, 0, 1,
-2.127235, -0.2322875, -1.027359, 1, 0.09019608, 0, 1,
-2.091565, 0.5819475, -0.7581612, 1, 0.09411765, 0, 1,
-2.08408, 0.9942369, -3.734533, 1, 0.1019608, 0, 1,
-2.082141, -1.506907, -2.138802, 1, 0.1098039, 0, 1,
-2.080244, -0.1590044, -0.4843473, 1, 0.1137255, 0, 1,
-2.063323, -0.1161002, -1.437945, 1, 0.1215686, 0, 1,
-2.032761, 0.2671727, -0.2932489, 1, 0.1254902, 0, 1,
-2.022663, 1.27033, -1.851523, 1, 0.1333333, 0, 1,
-2.018581, 1.693372, -0.6230134, 1, 0.1372549, 0, 1,
-2.014769, -0.1593296, -2.761383, 1, 0.145098, 0, 1,
-2.000632, -1.21386, -2.133632, 1, 0.1490196, 0, 1,
-1.998424, -0.8075203, -2.684924, 1, 0.1568628, 0, 1,
-1.989133, -0.8346932, -2.010734, 1, 0.1607843, 0, 1,
-1.975353, -1.186464, -2.063072, 1, 0.1686275, 0, 1,
-1.947105, -0.2236494, -1.145463, 1, 0.172549, 0, 1,
-1.939373, 2.425836, -0.6557114, 1, 0.1803922, 0, 1,
-1.933308, -0.6238328, -3.986665, 1, 0.1843137, 0, 1,
-1.926408, 0.6006752, -2.133473, 1, 0.1921569, 0, 1,
-1.912873, -2.396374, -1.109761, 1, 0.1960784, 0, 1,
-1.908813, -0.5381393, -1.495239, 1, 0.2039216, 0, 1,
-1.903973, -0.9425445, -3.966968, 1, 0.2117647, 0, 1,
-1.901376, 1.941509, -0.2251084, 1, 0.2156863, 0, 1,
-1.847197, -0.05153522, -0.9018595, 1, 0.2235294, 0, 1,
-1.812719, -0.7272291, -2.31305, 1, 0.227451, 0, 1,
-1.801182, -2.17038, -2.701807, 1, 0.2352941, 0, 1,
-1.760251, 2.550921, 1.521548, 1, 0.2392157, 0, 1,
-1.759489, 1.148304, -0.09090185, 1, 0.2470588, 0, 1,
-1.758885, -1.776621, -2.837521, 1, 0.2509804, 0, 1,
-1.738662, -1.592995, -3.628057, 1, 0.2588235, 0, 1,
-1.736469, -0.427914, -2.447098, 1, 0.2627451, 0, 1,
-1.731681, -0.6040703, -1.032811, 1, 0.2705882, 0, 1,
-1.726562, -0.06949344, -0.7028164, 1, 0.2745098, 0, 1,
-1.726381, -1.977026, -2.168261, 1, 0.282353, 0, 1,
-1.722323, -1.440712, -2.899619, 1, 0.2862745, 0, 1,
-1.719404, 0.7298473, 0.1428531, 1, 0.2941177, 0, 1,
-1.692145, -0.03471174, -0.1038658, 1, 0.3019608, 0, 1,
-1.686676, -0.4751969, -0.03901204, 1, 0.3058824, 0, 1,
-1.672218, 1.304435, -1.220083, 1, 0.3137255, 0, 1,
-1.622137, 1.039978, -2.366409, 1, 0.3176471, 0, 1,
-1.619337, 0.6089807, -1.610467, 1, 0.3254902, 0, 1,
-1.597792, -0.02033117, -0.1702896, 1, 0.3294118, 0, 1,
-1.583462, -0.1354842, -2.591644, 1, 0.3372549, 0, 1,
-1.577706, 1.424095, 0.4108513, 1, 0.3411765, 0, 1,
-1.573859, -0.4852413, -1.280712, 1, 0.3490196, 0, 1,
-1.562619, 1.159551, 0.3803803, 1, 0.3529412, 0, 1,
-1.546063, 1.104708, -0.5776478, 1, 0.3607843, 0, 1,
-1.54472, 0.366868, -0.0969152, 1, 0.3647059, 0, 1,
-1.538201, 0.247748, -2.382146, 1, 0.372549, 0, 1,
-1.537851, -0.9352236, -2.300967, 1, 0.3764706, 0, 1,
-1.53388, -0.9268382, -1.398494, 1, 0.3843137, 0, 1,
-1.531779, 0.594894, 0.2696914, 1, 0.3882353, 0, 1,
-1.525378, -0.4248017, -2.449843, 1, 0.3960784, 0, 1,
-1.521679, 1.020342, -0.1846142, 1, 0.4039216, 0, 1,
-1.513863, -1.086994, -1.986584, 1, 0.4078431, 0, 1,
-1.508736, -0.7484732, -3.387941, 1, 0.4156863, 0, 1,
-1.504064, 1.447477, -0.3612687, 1, 0.4196078, 0, 1,
-1.500305, -0.8180586, -0.234399, 1, 0.427451, 0, 1,
-1.493358, -0.7274743, -1.740576, 1, 0.4313726, 0, 1,
-1.492871, -1.040418, -3.181702, 1, 0.4392157, 0, 1,
-1.479149, -0.003537365, -1.379594, 1, 0.4431373, 0, 1,
-1.472403, -0.3272485, -1.799605, 1, 0.4509804, 0, 1,
-1.462358, 1.181441, 1.053092, 1, 0.454902, 0, 1,
-1.460116, -0.1771775, -0.5290253, 1, 0.4627451, 0, 1,
-1.459531, -0.998816, -2.380006, 1, 0.4666667, 0, 1,
-1.445606, 2.051403, -3.859694, 1, 0.4745098, 0, 1,
-1.429971, -0.06440824, -2.836004, 1, 0.4784314, 0, 1,
-1.416473, 0.4993879, -1.861792, 1, 0.4862745, 0, 1,
-1.408296, -0.7083703, -2.781275, 1, 0.4901961, 0, 1,
-1.407814, -0.5584321, -1.318443, 1, 0.4980392, 0, 1,
-1.407388, 0.2966844, -0.5721481, 1, 0.5058824, 0, 1,
-1.406374, -0.4126119, -1.937053, 1, 0.509804, 0, 1,
-1.399856, 1.926204, -1.449406, 1, 0.5176471, 0, 1,
-1.396508, 1.264712, -0.5405014, 1, 0.5215687, 0, 1,
-1.389566, 1.007399, -0.834437, 1, 0.5294118, 0, 1,
-1.383179, -0.4803551, -2.542161, 1, 0.5333334, 0, 1,
-1.379502, -0.2019565, -1.694085, 1, 0.5411765, 0, 1,
-1.362023, 1.260311, -0.3267537, 1, 0.5450981, 0, 1,
-1.359198, 0.08738865, -0.5163804, 1, 0.5529412, 0, 1,
-1.358145, -1.008137, -2.176377, 1, 0.5568628, 0, 1,
-1.354144, -1.028823, -1.982209, 1, 0.5647059, 0, 1,
-1.343684, 0.8621771, -2.399125, 1, 0.5686275, 0, 1,
-1.342192, 0.3238958, -0.6199175, 1, 0.5764706, 0, 1,
-1.335238, -0.2887755, -0.8909638, 1, 0.5803922, 0, 1,
-1.329497, 3.171777, 1.246682, 1, 0.5882353, 0, 1,
-1.311691, 1.705995, -1.84781, 1, 0.5921569, 0, 1,
-1.304696, -1.114517, -2.831558, 1, 0.6, 0, 1,
-1.304269, -0.3215774, -2.881333, 1, 0.6078432, 0, 1,
-1.283571, 1.1414, -0.8280895, 1, 0.6117647, 0, 1,
-1.283126, 0.2276099, -3.014653, 1, 0.6196079, 0, 1,
-1.279095, 0.3893074, -1.743966, 1, 0.6235294, 0, 1,
-1.270871, -0.5240777, -2.499853, 1, 0.6313726, 0, 1,
-1.266833, -0.3733369, -2.869723, 1, 0.6352941, 0, 1,
-1.266528, -0.1796735, -1.232263, 1, 0.6431373, 0, 1,
-1.260965, -0.4003022, -1.809999, 1, 0.6470588, 0, 1,
-1.258363, 0.4200438, -1.743892, 1, 0.654902, 0, 1,
-1.257932, -0.02390285, -0.6642377, 1, 0.6588235, 0, 1,
-1.254593, -0.1008152, -1.360207, 1, 0.6666667, 0, 1,
-1.253373, -0.8275588, -1.699085, 1, 0.6705883, 0, 1,
-1.244935, -0.193235, -2.00046, 1, 0.6784314, 0, 1,
-1.242306, -1.130963, -2.665942, 1, 0.682353, 0, 1,
-1.238946, -0.6190566, -1.867386, 1, 0.6901961, 0, 1,
-1.23511, 1.035147, -1.801998, 1, 0.6941177, 0, 1,
-1.234388, 0.343863, -0.4634838, 1, 0.7019608, 0, 1,
-1.221879, -0.4543146, -2.808648, 1, 0.7098039, 0, 1,
-1.221155, -0.6402518, -2.890998, 1, 0.7137255, 0, 1,
-1.21872, -1.722928, -1.655836, 1, 0.7215686, 0, 1,
-1.210225, 1.232524, -2.144632, 1, 0.7254902, 0, 1,
-1.210199, -2.245141, -3.734933, 1, 0.7333333, 0, 1,
-1.202111, -1.183871, -0.6882565, 1, 0.7372549, 0, 1,
-1.198632, 0.4355024, -0.8898833, 1, 0.7450981, 0, 1,
-1.164993, 0.8648228, -2.995867, 1, 0.7490196, 0, 1,
-1.163679, -0.04800611, -0.7822869, 1, 0.7568628, 0, 1,
-1.162037, 1.639925, -1.892692, 1, 0.7607843, 0, 1,
-1.158607, -0.3596804, -2.001351, 1, 0.7686275, 0, 1,
-1.157063, -0.9155103, -1.553079, 1, 0.772549, 0, 1,
-1.152057, 0.01172266, -1.617731, 1, 0.7803922, 0, 1,
-1.14757, 1.177654, 0.376425, 1, 0.7843137, 0, 1,
-1.147204, 1.297853, -0.7243122, 1, 0.7921569, 0, 1,
-1.144601, -1.376424, -3.626093, 1, 0.7960784, 0, 1,
-1.143287, -0.5103674, 0.7847982, 1, 0.8039216, 0, 1,
-1.137849, 0.03776975, -1.901574, 1, 0.8117647, 0, 1,
-1.137081, -0.5137779, -2.273988, 1, 0.8156863, 0, 1,
-1.13546, -2.63495, -2.320887, 1, 0.8235294, 0, 1,
-1.117892, 0.2042395, -1.762653, 1, 0.827451, 0, 1,
-1.111547, -0.2168916, -1.90148, 1, 0.8352941, 0, 1,
-1.107986, -0.7035299, -2.964805, 1, 0.8392157, 0, 1,
-1.098074, 0.5677736, -1.683792, 1, 0.8470588, 0, 1,
-1.097824, -2.242461, -2.129017, 1, 0.8509804, 0, 1,
-1.097803, 1.121376, -0.4792987, 1, 0.8588235, 0, 1,
-1.093217, -0.5194568, -3.128088, 1, 0.8627451, 0, 1,
-1.091352, -1.075304, -0.5427539, 1, 0.8705882, 0, 1,
-1.086204, -0.8027926, -3.6828, 1, 0.8745098, 0, 1,
-1.082205, -2.004331, -1.456525, 1, 0.8823529, 0, 1,
-1.081852, 1.754229, -0.4932707, 1, 0.8862745, 0, 1,
-1.075946, 1.196819, -0.6700054, 1, 0.8941177, 0, 1,
-1.069488, 0.1597047, -2.564823, 1, 0.8980392, 0, 1,
-1.068142, 0.1016642, -0.006851987, 1, 0.9058824, 0, 1,
-1.054725, 0.2397554, -0.8148354, 1, 0.9137255, 0, 1,
-1.048314, -0.3851349, 0.369851, 1, 0.9176471, 0, 1,
-1.048205, -0.5675146, -0.2564688, 1, 0.9254902, 0, 1,
-1.044941, -1.1268, -0.6555294, 1, 0.9294118, 0, 1,
-1.044922, 1.007924, -1.633072, 1, 0.9372549, 0, 1,
-1.034845, -0.8450704, -3.497652, 1, 0.9411765, 0, 1,
-1.032284, 0.4195702, -1.530036, 1, 0.9490196, 0, 1,
-1.028625, -0.3017823, -0.1671304, 1, 0.9529412, 0, 1,
-1.023627, 1.325056, -1.315926, 1, 0.9607843, 0, 1,
-1.008784, 1.135777, -0.645173, 1, 0.9647059, 0, 1,
-1.006569, 0.07825479, -0.5716264, 1, 0.972549, 0, 1,
-1.006557, -0.6632968, -2.303581, 1, 0.9764706, 0, 1,
-0.9979556, 1.645277, 0.135089, 1, 0.9843137, 0, 1,
-0.9963384, -0.7682766, -1.15564, 1, 0.9882353, 0, 1,
-0.9959003, 1.372863, -0.5195885, 1, 0.9960784, 0, 1,
-0.9798933, -1.42818, -3.00569, 0.9960784, 1, 0, 1,
-0.9786912, 0.9684307, -2.382571, 0.9921569, 1, 0, 1,
-0.978093, -0.06589869, -0.869082, 0.9843137, 1, 0, 1,
-0.9523383, -0.04093415, -0.8050186, 0.9803922, 1, 0, 1,
-0.9437171, 0.7890297, -3.189296, 0.972549, 1, 0, 1,
-0.9408574, 0.003327344, -2.254933, 0.9686275, 1, 0, 1,
-0.940582, -0.234101, -1.244677, 0.9607843, 1, 0, 1,
-0.9371403, 0.9062336, -2.191926, 0.9568627, 1, 0, 1,
-0.9368841, -0.1414102, -2.327382, 0.9490196, 1, 0, 1,
-0.9363333, -0.3430174, 0.3171092, 0.945098, 1, 0, 1,
-0.9334032, 0.3787154, 0.2552832, 0.9372549, 1, 0, 1,
-0.9217471, 0.5463901, -1.374272, 0.9333333, 1, 0, 1,
-0.9187785, 1.172858, -1.217272, 0.9254902, 1, 0, 1,
-0.9184387, -0.6202838, -1.069694, 0.9215686, 1, 0, 1,
-0.9167351, 1.291208, 0.9558848, 0.9137255, 1, 0, 1,
-0.9049308, -0.9383498, -1.082992, 0.9098039, 1, 0, 1,
-0.9004311, -0.03344013, -0.9020637, 0.9019608, 1, 0, 1,
-0.8989852, -0.9954484, -2.847802, 0.8941177, 1, 0, 1,
-0.8876148, -0.7232939, -2.030417, 0.8901961, 1, 0, 1,
-0.8836513, -1.608062, -1.015025, 0.8823529, 1, 0, 1,
-0.8802705, -0.3395668, -3.926279, 0.8784314, 1, 0, 1,
-0.8794703, 0.4423129, -0.7426494, 0.8705882, 1, 0, 1,
-0.8785393, 0.7965391, 0.2527819, 0.8666667, 1, 0, 1,
-0.8733221, -1.297993, -2.143605, 0.8588235, 1, 0, 1,
-0.8717918, 1.286835, -1.26106, 0.854902, 1, 0, 1,
-0.8716044, -0.07867635, -1.640124, 0.8470588, 1, 0, 1,
-0.8715104, 0.2350519, -2.876091, 0.8431373, 1, 0, 1,
-0.8693022, 1.773985, -1.4216, 0.8352941, 1, 0, 1,
-0.866654, -0.1755767, -0.5711626, 0.8313726, 1, 0, 1,
-0.8663498, -0.443054, -1.779613, 0.8235294, 1, 0, 1,
-0.8662761, -1.387301, -3.583505, 0.8196079, 1, 0, 1,
-0.8627101, 0.8716505, -1.863037, 0.8117647, 1, 0, 1,
-0.8625799, 0.02995124, -3.493548, 0.8078431, 1, 0, 1,
-0.8581824, -0.8455703, -2.273859, 0.8, 1, 0, 1,
-0.8576994, 1.655426, -0.05319939, 0.7921569, 1, 0, 1,
-0.8501755, -1.306727, -2.673779, 0.7882353, 1, 0, 1,
-0.8485588, -0.1883816, -1.551817, 0.7803922, 1, 0, 1,
-0.8470802, 0.4096783, -1.087834, 0.7764706, 1, 0, 1,
-0.8463662, 1.913452, -0.09231987, 0.7686275, 1, 0, 1,
-0.8431545, 0.5050652, 0.7238421, 0.7647059, 1, 0, 1,
-0.8424591, 0.572978, -1.159099, 0.7568628, 1, 0, 1,
-0.8378749, -0.5648333, -2.51847, 0.7529412, 1, 0, 1,
-0.835566, 0.07684862, -0.507446, 0.7450981, 1, 0, 1,
-0.83495, 0.8352128, -0.8850226, 0.7411765, 1, 0, 1,
-0.8325859, -0.9930446, -2.585694, 0.7333333, 1, 0, 1,
-0.8313983, -0.01854116, -2.378783, 0.7294118, 1, 0, 1,
-0.8292802, -1.607851, -2.15791, 0.7215686, 1, 0, 1,
-0.8269895, -0.4217302, -2.06582, 0.7176471, 1, 0, 1,
-0.8264598, -0.7004291, -2.443445, 0.7098039, 1, 0, 1,
-0.8211048, 0.7463115, -1.044269, 0.7058824, 1, 0, 1,
-0.8171668, 0.8862973, -2.431018, 0.6980392, 1, 0, 1,
-0.8152896, -0.5095356, -2.314636, 0.6901961, 1, 0, 1,
-0.8151485, -0.4468788, -3.696147, 0.6862745, 1, 0, 1,
-0.8110306, 0.08786845, -0.04890676, 0.6784314, 1, 0, 1,
-0.8085752, -0.8785003, -2.623085, 0.6745098, 1, 0, 1,
-0.8042001, -0.3071501, -0.6491489, 0.6666667, 1, 0, 1,
-0.7939689, 0.7286268, -2.102172, 0.6627451, 1, 0, 1,
-0.7936022, -1.593101, -3.218257, 0.654902, 1, 0, 1,
-0.7924712, -0.03761606, -1.484558, 0.6509804, 1, 0, 1,
-0.7891913, 0.6188363, -0.3624493, 0.6431373, 1, 0, 1,
-0.7879732, -0.7930877, -2.027644, 0.6392157, 1, 0, 1,
-0.7876658, 0.2211115, -2.434299, 0.6313726, 1, 0, 1,
-0.7751679, -0.09190256, -2.595146, 0.627451, 1, 0, 1,
-0.7671976, -0.05081595, -1.812856, 0.6196079, 1, 0, 1,
-0.7670469, -0.213791, -3.849729, 0.6156863, 1, 0, 1,
-0.7659197, -0.1608661, -3.731524, 0.6078432, 1, 0, 1,
-0.7587039, 1.129509, -0.02358422, 0.6039216, 1, 0, 1,
-0.7583911, 1.007864, -0.3976072, 0.5960785, 1, 0, 1,
-0.757883, -0.3990725, -3.126689, 0.5882353, 1, 0, 1,
-0.748074, 0.1464558, -1.776527, 0.5843138, 1, 0, 1,
-0.7433077, 0.04450896, -1.94541, 0.5764706, 1, 0, 1,
-0.7381951, 1.21575, -1.653589, 0.572549, 1, 0, 1,
-0.7372799, 0.3425591, -0.9675733, 0.5647059, 1, 0, 1,
-0.7350281, -0.612036, -0.3414668, 0.5607843, 1, 0, 1,
-0.7310661, 0.4971438, -1.782041, 0.5529412, 1, 0, 1,
-0.7203584, -2.114421, -2.063903, 0.5490196, 1, 0, 1,
-0.7130272, -0.09330356, -1.358878, 0.5411765, 1, 0, 1,
-0.712794, 1.352061, 0.1139838, 0.5372549, 1, 0, 1,
-0.712739, -0.8211023, -3.055437, 0.5294118, 1, 0, 1,
-0.7125111, -1.14016, -4.359133, 0.5254902, 1, 0, 1,
-0.7123715, -0.7122383, -1.379648, 0.5176471, 1, 0, 1,
-0.7104478, 1.833944, 0.1049869, 0.5137255, 1, 0, 1,
-0.7085219, -0.7381151, -0.975797, 0.5058824, 1, 0, 1,
-0.7030197, 1.590132, -0.9792597, 0.5019608, 1, 0, 1,
-0.6971673, -1.076805, -4.15965, 0.4941176, 1, 0, 1,
-0.6943593, -0.3365371, -2.287243, 0.4862745, 1, 0, 1,
-0.692993, -0.4097517, -2.506371, 0.4823529, 1, 0, 1,
-0.6907864, -0.5005299, -2.697276, 0.4745098, 1, 0, 1,
-0.6882873, 0.6170403, 0.9694754, 0.4705882, 1, 0, 1,
-0.6844379, -0.5526322, -1.09115, 0.4627451, 1, 0, 1,
-0.6843337, 0.7082244, -1.49025, 0.4588235, 1, 0, 1,
-0.6834368, 0.7191499, -1.348134, 0.4509804, 1, 0, 1,
-0.6800485, -0.7720445, -2.680597, 0.4470588, 1, 0, 1,
-0.6760978, 0.2869744, 0.02493703, 0.4392157, 1, 0, 1,
-0.6628512, -0.04115723, -1.852887, 0.4352941, 1, 0, 1,
-0.6614512, -0.9617195, -3.109484, 0.427451, 1, 0, 1,
-0.6568875, 0.06414992, -1.994491, 0.4235294, 1, 0, 1,
-0.6484101, 1.043326, -1.530896, 0.4156863, 1, 0, 1,
-0.6430004, 1.092495, -0.5199127, 0.4117647, 1, 0, 1,
-0.6419229, 0.5259974, 0.6630869, 0.4039216, 1, 0, 1,
-0.6412492, -0.6473457, -1.73758, 0.3960784, 1, 0, 1,
-0.6407077, -1.528889, -2.075443, 0.3921569, 1, 0, 1,
-0.6313722, -1.751521, -2.803583, 0.3843137, 1, 0, 1,
-0.6266257, -0.3125201, -1.067338, 0.3803922, 1, 0, 1,
-0.6243201, -0.8627917, -1.860727, 0.372549, 1, 0, 1,
-0.6234682, 0.3355143, -0.2238633, 0.3686275, 1, 0, 1,
-0.6200293, -0.09274472, -0.4078864, 0.3607843, 1, 0, 1,
-0.6196904, 2.126029, 1.589475, 0.3568628, 1, 0, 1,
-0.6172093, 0.9272581, -1.82206, 0.3490196, 1, 0, 1,
-0.616619, 1.305238, -0.1222328, 0.345098, 1, 0, 1,
-0.6158417, -2.17616, -1.928535, 0.3372549, 1, 0, 1,
-0.6139169, 0.2092522, -2.699456, 0.3333333, 1, 0, 1,
-0.6071653, 1.210981, -0.5448529, 0.3254902, 1, 0, 1,
-0.6065855, -1.239559, -3.613597, 0.3215686, 1, 0, 1,
-0.6051268, -0.6055671, -2.526208, 0.3137255, 1, 0, 1,
-0.6008574, 0.4973132, -1.141068, 0.3098039, 1, 0, 1,
-0.5990767, -0.6370674, -1.305209, 0.3019608, 1, 0, 1,
-0.5980085, 0.01166276, -3.747053, 0.2941177, 1, 0, 1,
-0.5952253, 0.2884758, 0.7974676, 0.2901961, 1, 0, 1,
-0.592945, -0.318349, -3.123891, 0.282353, 1, 0, 1,
-0.5927998, -0.5696985, -2.282128, 0.2784314, 1, 0, 1,
-0.5898546, -0.5016468, -1.005031, 0.2705882, 1, 0, 1,
-0.5844316, 0.353015, -0.1773771, 0.2666667, 1, 0, 1,
-0.5786377, 1.710948, 0.6273252, 0.2588235, 1, 0, 1,
-0.5778635, -0.3539443, 0.3909605, 0.254902, 1, 0, 1,
-0.5764396, -0.5080277, -1.252004, 0.2470588, 1, 0, 1,
-0.5758958, 1.340846, 0.9979278, 0.2431373, 1, 0, 1,
-0.5724872, -0.3365757, -3.539428, 0.2352941, 1, 0, 1,
-0.570238, -0.2791491, -2.648082, 0.2313726, 1, 0, 1,
-0.5695993, 0.5124931, -2.04007, 0.2235294, 1, 0, 1,
-0.5662398, -0.6146805, -3.276842, 0.2196078, 1, 0, 1,
-0.5650783, -1.913446, -3.040579, 0.2117647, 1, 0, 1,
-0.5633139, 1.140513, 0.2790664, 0.2078431, 1, 0, 1,
-0.5604634, 0.02783961, -2.965675, 0.2, 1, 0, 1,
-0.5596011, -0.6098536, -2.70611, 0.1921569, 1, 0, 1,
-0.5563293, -1.169724, -4.200828, 0.1882353, 1, 0, 1,
-0.555519, 0.8803046, -0.9303204, 0.1803922, 1, 0, 1,
-0.5540616, -0.0259392, -2.186263, 0.1764706, 1, 0, 1,
-0.5535793, 0.6478612, -0.6546323, 0.1686275, 1, 0, 1,
-0.5514106, 0.1717957, -1.991401, 0.1647059, 1, 0, 1,
-0.5487224, 0.4450738, -2.563419, 0.1568628, 1, 0, 1,
-0.547911, 1.526061, -0.9654447, 0.1529412, 1, 0, 1,
-0.5477209, -1.172196, -3.717404, 0.145098, 1, 0, 1,
-0.5471968, 0.2409881, -2.904971, 0.1411765, 1, 0, 1,
-0.5463473, 1.149476, -1.563542, 0.1333333, 1, 0, 1,
-0.5437854, 0.1488578, -1.888731, 0.1294118, 1, 0, 1,
-0.5435287, 1.518287, -1.119407, 0.1215686, 1, 0, 1,
-0.542968, 0.7812142, 0.6166229, 0.1176471, 1, 0, 1,
-0.5423973, -1.875276, -2.578596, 0.1098039, 1, 0, 1,
-0.5401917, 0.6550488, -0.4733036, 0.1058824, 1, 0, 1,
-0.5372318, -0.01598527, -0.9540197, 0.09803922, 1, 0, 1,
-0.536237, 0.09514346, -2.726542, 0.09019608, 1, 0, 1,
-0.5301039, 1.240192, 0.2004807, 0.08627451, 1, 0, 1,
-0.529075, -1.288774, -2.237698, 0.07843138, 1, 0, 1,
-0.5277336, -0.7038686, -3.235548, 0.07450981, 1, 0, 1,
-0.5263003, -0.3005601, -3.646086, 0.06666667, 1, 0, 1,
-0.5202433, -2.672744, -3.463349, 0.0627451, 1, 0, 1,
-0.5197857, 1.636248, -0.9085703, 0.05490196, 1, 0, 1,
-0.5100433, -1.445772, -3.468859, 0.05098039, 1, 0, 1,
-0.5049053, -0.3235523, -2.042891, 0.04313726, 1, 0, 1,
-0.4911976, 0.7058139, 1.100041, 0.03921569, 1, 0, 1,
-0.4854401, -0.5612156, -2.326835, 0.03137255, 1, 0, 1,
-0.481832, -0.7059125, -2.046907, 0.02745098, 1, 0, 1,
-0.4815862, -1.34545, -2.914211, 0.01960784, 1, 0, 1,
-0.4794297, 0.1141671, -2.070065, 0.01568628, 1, 0, 1,
-0.4755007, 1.016439, 0.349885, 0.007843138, 1, 0, 1,
-0.4575243, -0.05527265, -2.051247, 0.003921569, 1, 0, 1,
-0.4564168, -0.4263058, -2.181457, 0, 1, 0.003921569, 1,
-0.4563598, -0.1270006, -3.889538, 0, 1, 0.01176471, 1,
-0.4558514, 0.2863775, 0.2332288, 0, 1, 0.01568628, 1,
-0.4519464, 0.9467964, -0.7186759, 0, 1, 0.02352941, 1,
-0.4495743, 2.030465, 1.723971, 0, 1, 0.02745098, 1,
-0.4486145, -0.2336457, -1.499317, 0, 1, 0.03529412, 1,
-0.4476918, 2.501249, 0.590547, 0, 1, 0.03921569, 1,
-0.4438625, 0.3817976, -1.260795, 0, 1, 0.04705882, 1,
-0.4430249, -0.01475204, -2.451213, 0, 1, 0.05098039, 1,
-0.4344579, -0.6915178, -2.173616, 0, 1, 0.05882353, 1,
-0.43268, -0.312745, -2.125284, 0, 1, 0.0627451, 1,
-0.4325304, -0.05594299, -1.819048, 0, 1, 0.07058824, 1,
-0.4301764, -1.118545, -3.092886, 0, 1, 0.07450981, 1,
-0.4256698, -0.6090574, -1.744779, 0, 1, 0.08235294, 1,
-0.4249591, -0.4900225, -2.5229, 0, 1, 0.08627451, 1,
-0.4223068, 0.9863492, -0.1669756, 0, 1, 0.09411765, 1,
-0.4214964, -0.09683561, -1.586939, 0, 1, 0.1019608, 1,
-0.4209736, -0.8518924, -3.500383, 0, 1, 0.1058824, 1,
-0.4205733, -1.134215, -3.723498, 0, 1, 0.1137255, 1,
-0.4203882, -0.6454587, -3.527217, 0, 1, 0.1176471, 1,
-0.4162824, -0.1407916, -1.890412, 0, 1, 0.1254902, 1,
-0.4157677, -0.9243588, -0.9654899, 0, 1, 0.1294118, 1,
-0.4141387, 0.7235879, -0.817644, 0, 1, 0.1372549, 1,
-0.4133999, 0.5649769, -0.7843916, 0, 1, 0.1411765, 1,
-0.4126576, 0.8729524, -1.145062, 0, 1, 0.1490196, 1,
-0.4125503, -0.623764, -4.279464, 0, 1, 0.1529412, 1,
-0.4066915, 0.2577284, -0.6099204, 0, 1, 0.1607843, 1,
-0.406682, 0.9395669, 0.06448751, 0, 1, 0.1647059, 1,
-0.4041739, 0.09857286, -3.038347, 0, 1, 0.172549, 1,
-0.3986972, -0.1517987, -3.749639, 0, 1, 0.1764706, 1,
-0.3975973, -0.05416372, -1.086611, 0, 1, 0.1843137, 1,
-0.3971007, 0.306724, 1.507018, 0, 1, 0.1882353, 1,
-0.3969047, -0.4905883, -2.376962, 0, 1, 0.1960784, 1,
-0.3963599, 0.432121, -1.500916, 0, 1, 0.2039216, 1,
-0.3947771, 0.03003967, -0.6560138, 0, 1, 0.2078431, 1,
-0.3845468, 0.2841681, -0.5608632, 0, 1, 0.2156863, 1,
-0.3833485, 0.3722754, -0.9002962, 0, 1, 0.2196078, 1,
-0.3814338, 0.9479802, -1.608247, 0, 1, 0.227451, 1,
-0.3750915, 0.6251931, -0.8201777, 0, 1, 0.2313726, 1,
-0.3724732, -1.086907, -4.485112, 0, 1, 0.2392157, 1,
-0.3721859, -1.654787, -2.887018, 0, 1, 0.2431373, 1,
-0.3638302, -1.301531, -3.892401, 0, 1, 0.2509804, 1,
-0.3629285, -1.045993, -3.429454, 0, 1, 0.254902, 1,
-0.3620802, -1.571428, -3.064654, 0, 1, 0.2627451, 1,
-0.3620385, 1.041445, 1.145501, 0, 1, 0.2666667, 1,
-0.35895, -0.579688, -2.830319, 0, 1, 0.2745098, 1,
-0.3578975, 0.2761568, 0.5783997, 0, 1, 0.2784314, 1,
-0.3564708, 0.6734425, 0.6207235, 0, 1, 0.2862745, 1,
-0.3507531, 0.2346975, -0.2827429, 0, 1, 0.2901961, 1,
-0.3450478, 1.137679, 0.4499041, 0, 1, 0.2980392, 1,
-0.3446507, -0.7253417, -2.37505, 0, 1, 0.3058824, 1,
-0.3425073, -0.540466, -1.203807, 0, 1, 0.3098039, 1,
-0.3411425, -0.3447489, -3.41169, 0, 1, 0.3176471, 1,
-0.3349007, 0.4197176, -0.8299766, 0, 1, 0.3215686, 1,
-0.3261992, 0.8977394, -1.065357, 0, 1, 0.3294118, 1,
-0.3255964, 1.567347, -0.2766101, 0, 1, 0.3333333, 1,
-0.3254676, -0.7831345, -3.199161, 0, 1, 0.3411765, 1,
-0.3227372, -1.032832, -1.684155, 0, 1, 0.345098, 1,
-0.3097664, 0.08355696, 1.356797, 0, 1, 0.3529412, 1,
-0.3094162, -0.5537854, -1.772183, 0, 1, 0.3568628, 1,
-0.3092896, -0.1313925, -0.7650948, 0, 1, 0.3647059, 1,
-0.300005, 1.167512, -0.5816083, 0, 1, 0.3686275, 1,
-0.2996179, 0.125107, 0.1171464, 0, 1, 0.3764706, 1,
-0.2909411, 0.4445007, -1.150905, 0, 1, 0.3803922, 1,
-0.2884387, -0.0326778, -2.303074, 0, 1, 0.3882353, 1,
-0.2876337, 1.100567, -0.4663157, 0, 1, 0.3921569, 1,
-0.2823887, 0.3095995, -0.6482854, 0, 1, 0.4, 1,
-0.2817671, -1.440324, -2.07519, 0, 1, 0.4078431, 1,
-0.2787379, 0.6507301, -1.135138, 0, 1, 0.4117647, 1,
-0.2728159, 0.8167889, -2.419563, 0, 1, 0.4196078, 1,
-0.2726509, 0.8009421, -0.08047614, 0, 1, 0.4235294, 1,
-0.2667627, -1.527932, -4.267011, 0, 1, 0.4313726, 1,
-0.2569086, 0.199534, -0.8604511, 0, 1, 0.4352941, 1,
-0.2446614, 0.7483836, 0.2849956, 0, 1, 0.4431373, 1,
-0.236368, -0.2874186, -2.126097, 0, 1, 0.4470588, 1,
-0.2318893, 0.4717183, -0.2890391, 0, 1, 0.454902, 1,
-0.2308167, 0.05652557, -0.9140376, 0, 1, 0.4588235, 1,
-0.2254908, 0.3386429, -0.7785305, 0, 1, 0.4666667, 1,
-0.2238386, 1.506563, -0.06460266, 0, 1, 0.4705882, 1,
-0.2228518, 1.005808, 0.4181909, 0, 1, 0.4784314, 1,
-0.2222957, 1.111938, 0.7620653, 0, 1, 0.4823529, 1,
-0.2196642, -1.543061, -3.16274, 0, 1, 0.4901961, 1,
-0.2193894, -0.5899043, -2.308808, 0, 1, 0.4941176, 1,
-0.2188178, -0.8275031, -2.875419, 0, 1, 0.5019608, 1,
-0.2176373, -1.171453, -1.140878, 0, 1, 0.509804, 1,
-0.2174149, 0.4370661, -0.08559677, 0, 1, 0.5137255, 1,
-0.2107512, 1.503744, 0.3179279, 0, 1, 0.5215687, 1,
-0.2097961, 0.5458018, -0.9418772, 0, 1, 0.5254902, 1,
-0.2096986, 0.2479726, 1.207209, 0, 1, 0.5333334, 1,
-0.204814, 0.1287036, -0.1564706, 0, 1, 0.5372549, 1,
-0.2018313, -1.584552, -4.497836, 0, 1, 0.5450981, 1,
-0.2013947, -0.5403912, -3.263395, 0, 1, 0.5490196, 1,
-0.1988489, -0.7594389, -2.10324, 0, 1, 0.5568628, 1,
-0.1984539, -0.4126168, -4.278732, 0, 1, 0.5607843, 1,
-0.1969826, -0.005024536, -1.818902, 0, 1, 0.5686275, 1,
-0.1938027, 0.7109492, -1.244993, 0, 1, 0.572549, 1,
-0.1935148, -0.1377326, -1.842787, 0, 1, 0.5803922, 1,
-0.1931342, -1.044068, -2.203913, 0, 1, 0.5843138, 1,
-0.1909302, -0.5917333, -3.005627, 0, 1, 0.5921569, 1,
-0.1908599, -0.2318728, -4.431964, 0, 1, 0.5960785, 1,
-0.1874919, -1.308037, -2.92615, 0, 1, 0.6039216, 1,
-0.1864126, -0.8574705, -2.206226, 0, 1, 0.6117647, 1,
-0.184704, -0.9528561, -2.090108, 0, 1, 0.6156863, 1,
-0.1837475, -0.05404699, -2.297236, 0, 1, 0.6235294, 1,
-0.1822138, -1.243773, -3.074504, 0, 1, 0.627451, 1,
-0.1820968, 0.9759352, -1.985357, 0, 1, 0.6352941, 1,
-0.1762283, -0.4420751, -2.008287, 0, 1, 0.6392157, 1,
-0.1735049, -0.1703867, -4.486415, 0, 1, 0.6470588, 1,
-0.1711384, 2.213602, 0.3452036, 0, 1, 0.6509804, 1,
-0.1709014, 0.7333698, -1.698552, 0, 1, 0.6588235, 1,
-0.1697133, 0.6447118, 1.69647, 0, 1, 0.6627451, 1,
-0.169044, -1.032744, -1.897746, 0, 1, 0.6705883, 1,
-0.1654941, -1.121122, -4.187266, 0, 1, 0.6745098, 1,
-0.1654512, 0.5880497, -1.343944, 0, 1, 0.682353, 1,
-0.156673, -0.05085068, -1.490842, 0, 1, 0.6862745, 1,
-0.1553493, 0.456055, -1.078143, 0, 1, 0.6941177, 1,
-0.1545053, 1.127022, -1.64413, 0, 1, 0.7019608, 1,
-0.1452334, 0.4237643, -0.1756627, 0, 1, 0.7058824, 1,
-0.1405868, 1.315861, -0.9551762, 0, 1, 0.7137255, 1,
-0.1393343, -1.562367, -3.470163, 0, 1, 0.7176471, 1,
-0.1341409, 0.2234947, 0.5945051, 0, 1, 0.7254902, 1,
-0.1296259, 1.816663, 1.962985, 0, 1, 0.7294118, 1,
-0.1206408, 0.6115316, -0.3664362, 0, 1, 0.7372549, 1,
-0.1205946, -0.3709443, -2.756117, 0, 1, 0.7411765, 1,
-0.1189043, 0.88393, -0.4939704, 0, 1, 0.7490196, 1,
-0.11838, -0.5502658, -3.770914, 0, 1, 0.7529412, 1,
-0.1117068, -0.5764462, -2.012581, 0, 1, 0.7607843, 1,
-0.111231, -0.4764645, -2.081625, 0, 1, 0.7647059, 1,
-0.109185, -1.619731, -2.62723, 0, 1, 0.772549, 1,
-0.1085493, -0.8647653, -3.072935, 0, 1, 0.7764706, 1,
-0.1061705, 0.335418, -0.9069787, 0, 1, 0.7843137, 1,
-0.09554879, 1.700326, -0.3355369, 0, 1, 0.7882353, 1,
-0.09363967, -0.5743569, -2.772462, 0, 1, 0.7960784, 1,
-0.09274317, 0.5415231, -1.599874, 0, 1, 0.8039216, 1,
-0.09163491, 2.280905, -0.9064644, 0, 1, 0.8078431, 1,
-0.09006821, 1.65681, 0.6444494, 0, 1, 0.8156863, 1,
-0.08915981, 0.4436156, 2.108172, 0, 1, 0.8196079, 1,
-0.08648249, 0.8482553, -0.9648855, 0, 1, 0.827451, 1,
-0.08268937, -0.2312155, -3.137306, 0, 1, 0.8313726, 1,
-0.08230076, -0.5838262, -1.883417, 0, 1, 0.8392157, 1,
-0.0814511, -0.2285973, -4.360369, 0, 1, 0.8431373, 1,
-0.0780338, -1.256066, -1.729562, 0, 1, 0.8509804, 1,
-0.07725358, 0.3641616, -0.4703517, 0, 1, 0.854902, 1,
-0.07687376, -0.8550694, -3.251913, 0, 1, 0.8627451, 1,
-0.07578516, 0.6368667, -0.535863, 0, 1, 0.8666667, 1,
-0.07492314, -1.601413, -2.663821, 0, 1, 0.8745098, 1,
-0.07246909, -0.1892384, -3.272793, 0, 1, 0.8784314, 1,
-0.07134523, 0.285869, -1.410752, 0, 1, 0.8862745, 1,
-0.06981009, 1.852547, 0.6434559, 0, 1, 0.8901961, 1,
-0.06956311, -0.1280183, -4.26477, 0, 1, 0.8980392, 1,
-0.06847627, 1.598655, 0.9806121, 0, 1, 0.9058824, 1,
-0.06670637, 0.5291767, -1.264124, 0, 1, 0.9098039, 1,
-0.0643913, 0.3402815, 0.07545719, 0, 1, 0.9176471, 1,
-0.06314742, 1.500563, 0.6671674, 0, 1, 0.9215686, 1,
-0.0628875, -0.269981, -3.515587, 0, 1, 0.9294118, 1,
-0.06243413, 1.729195, -1.743479, 0, 1, 0.9333333, 1,
-0.06172437, 0.7711587, -0.1576646, 0, 1, 0.9411765, 1,
-0.06067893, 0.2213979, -1.101091, 0, 1, 0.945098, 1,
-0.06066391, 0.5033099, 0.6674953, 0, 1, 0.9529412, 1,
-0.05462325, -0.009719585, -1.258214, 0, 1, 0.9568627, 1,
-0.04502142, -0.8402073, -0.305672, 0, 1, 0.9647059, 1,
-0.04304698, -1.080344, -4.508871, 0, 1, 0.9686275, 1,
-0.04043626, 0.6758852, -0.7264923, 0, 1, 0.9764706, 1,
-0.04011217, -0.1031007, -2.506626, 0, 1, 0.9803922, 1,
-0.04006826, -0.7070504, -1.208587, 0, 1, 0.9882353, 1,
-0.03919877, 0.2517315, 0.8518593, 0, 1, 0.9921569, 1,
-0.03373226, 0.8656502, -0.1097183, 0, 1, 1, 1,
-0.0314539, 0.3609836, -1.517821, 0, 0.9921569, 1, 1,
-0.02646313, 0.2506773, 0.08714278, 0, 0.9882353, 1, 1,
-0.02509273, -2.454459, -3.423766, 0, 0.9803922, 1, 1,
-0.02191179, 0.7034597, 0.6958951, 0, 0.9764706, 1, 1,
-0.02169102, -0.2182182, -5.188636, 0, 0.9686275, 1, 1,
-0.02003341, -0.09224068, -0.7092711, 0, 0.9647059, 1, 1,
-0.01976568, 0.7670529, 0.166058, 0, 0.9568627, 1, 1,
-0.01709124, 1.740925, -0.5928228, 0, 0.9529412, 1, 1,
-0.01218774, 1.907343, -2.575455, 0, 0.945098, 1, 1,
-0.01125736, 1.132663, -0.566807, 0, 0.9411765, 1, 1,
-0.007785698, 0.4053313, -1.029699, 0, 0.9333333, 1, 1,
-0.005443673, -0.9283891, -3.517721, 0, 0.9294118, 1, 1,
-0.003824819, -2.121499, -2.635792, 0, 0.9215686, 1, 1,
-0.001185309, -0.9762793, -3.342704, 0, 0.9176471, 1, 1,
0.002053938, -0.309657, 3.241812, 0, 0.9098039, 1, 1,
0.002233807, -0.1285132, 1.946769, 0, 0.9058824, 1, 1,
0.002314731, -0.8404244, 2.262148, 0, 0.8980392, 1, 1,
0.002543648, -0.9451553, 2.373579, 0, 0.8901961, 1, 1,
0.008122331, 0.4491709, -1.200692, 0, 0.8862745, 1, 1,
0.00962457, 1.773771, -0.2951021, 0, 0.8784314, 1, 1,
0.009913111, 1.212956, 0.4324255, 0, 0.8745098, 1, 1,
0.0101668, -0.08850367, 4.946672, 0, 0.8666667, 1, 1,
0.01156487, 0.4022828, 1.240374, 0, 0.8627451, 1, 1,
0.01167246, -1.613529, 3.364033, 0, 0.854902, 1, 1,
0.01269849, -0.6215501, 2.52132, 0, 0.8509804, 1, 1,
0.01555849, 0.8526507, 1.335219, 0, 0.8431373, 1, 1,
0.01578287, 1.241656, -1.397235, 0, 0.8392157, 1, 1,
0.0236217, 0.4195261, 1.239686, 0, 0.8313726, 1, 1,
0.02388079, -0.9801635, 2.259824, 0, 0.827451, 1, 1,
0.02634067, -0.2062904, 1.967082, 0, 0.8196079, 1, 1,
0.02965616, -0.2361183, 2.919344, 0, 0.8156863, 1, 1,
0.0361204, -0.8269414, 3.292759, 0, 0.8078431, 1, 1,
0.03821237, -1.396436, 4.047719, 0, 0.8039216, 1, 1,
0.03907775, 0.4140756, -0.1802695, 0, 0.7960784, 1, 1,
0.0493699, 0.7694232, -0.187942, 0, 0.7882353, 1, 1,
0.05099656, 1.801342, -0.8597938, 0, 0.7843137, 1, 1,
0.05649114, -0.9642411, 3.165621, 0, 0.7764706, 1, 1,
0.05784198, 0.2400832, 0.3014477, 0, 0.772549, 1, 1,
0.06304244, -0.6560552, 2.235086, 0, 0.7647059, 1, 1,
0.06577595, -0.4063956, 4.008338, 0, 0.7607843, 1, 1,
0.06979349, -0.8610369, 3.534417, 0, 0.7529412, 1, 1,
0.07033284, 0.3809695, 1.449955, 0, 0.7490196, 1, 1,
0.07485395, 0.515595, -0.2839456, 0, 0.7411765, 1, 1,
0.07927519, 0.5625754, -0.9807457, 0, 0.7372549, 1, 1,
0.07956453, 1.38256, 0.7644857, 0, 0.7294118, 1, 1,
0.08246721, -1.120434, 4.260294, 0, 0.7254902, 1, 1,
0.086018, 1.146392, 0.2563892, 0, 0.7176471, 1, 1,
0.08695537, -0.9988635, 3.500778, 0, 0.7137255, 1, 1,
0.08977358, -1.756968, 5.452496, 0, 0.7058824, 1, 1,
0.09088017, -0.3436009, 4.057395, 0, 0.6980392, 1, 1,
0.09200842, 0.736155, 0.4343306, 0, 0.6941177, 1, 1,
0.0936185, -0.8646417, 3.567502, 0, 0.6862745, 1, 1,
0.09703495, 1.433167, -0.1703102, 0, 0.682353, 1, 1,
0.09813114, 1.069177, 1.764813, 0, 0.6745098, 1, 1,
0.10822, 3.234539, -0.01219679, 0, 0.6705883, 1, 1,
0.1093258, -1.089839, 6.184982, 0, 0.6627451, 1, 1,
0.1127031, 0.7806492, 2.913438, 0, 0.6588235, 1, 1,
0.1189123, -0.6945394, 3.381049, 0, 0.6509804, 1, 1,
0.1190232, -1.907488, 4.999184, 0, 0.6470588, 1, 1,
0.122356, 1.884602, -0.2577238, 0, 0.6392157, 1, 1,
0.1265149, -0.2644942, 1.157291, 0, 0.6352941, 1, 1,
0.129109, -0.2898325, 2.413124, 0, 0.627451, 1, 1,
0.1313201, 0.01452063, 1.750297, 0, 0.6235294, 1, 1,
0.1325226, 0.9362338, 0.1170224, 0, 0.6156863, 1, 1,
0.135002, 0.6565979, -0.1596897, 0, 0.6117647, 1, 1,
0.1416018, 0.5092566, -0.3330197, 0, 0.6039216, 1, 1,
0.1416895, -0.8861019, 2.436261, 0, 0.5960785, 1, 1,
0.1423575, 0.942344, 1.294321, 0, 0.5921569, 1, 1,
0.1444462, 2.258143, -2.075784, 0, 0.5843138, 1, 1,
0.149755, -0.1729492, 2.529006, 0, 0.5803922, 1, 1,
0.1525113, 0.7776194, -0.2137803, 0, 0.572549, 1, 1,
0.1563819, -0.1942687, 4.430541, 0, 0.5686275, 1, 1,
0.1565175, 1.353084, -0.3664851, 0, 0.5607843, 1, 1,
0.1577988, -1.368729, 2.51334, 0, 0.5568628, 1, 1,
0.1605203, -0.6658565, 1.860519, 0, 0.5490196, 1, 1,
0.1618114, -0.7861423, 5.806734, 0, 0.5450981, 1, 1,
0.1618903, 0.8514232, -0.008969816, 0, 0.5372549, 1, 1,
0.1625953, 0.9965605, 0.5591128, 0, 0.5333334, 1, 1,
0.1632424, -0.9189608, 3.420926, 0, 0.5254902, 1, 1,
0.163375, -0.2992725, 2.723265, 0, 0.5215687, 1, 1,
0.1704244, 0.2202355, 1.376642, 0, 0.5137255, 1, 1,
0.1751317, -1.794476, 3.832482, 0, 0.509804, 1, 1,
0.1767002, 0.02605229, 1.616505, 0, 0.5019608, 1, 1,
0.1808488, -1.695604, 3.556837, 0, 0.4941176, 1, 1,
0.1820195, 0.8444719, -0.2228343, 0, 0.4901961, 1, 1,
0.1822869, -1.213365, 2.219072, 0, 0.4823529, 1, 1,
0.1853383, -0.7737895, 3.172048, 0, 0.4784314, 1, 1,
0.1916033, 2.652664, 0.2967671, 0, 0.4705882, 1, 1,
0.1939579, 0.1355286, 1.420971, 0, 0.4666667, 1, 1,
0.1957293, 0.1271371, 1.026807, 0, 0.4588235, 1, 1,
0.1966944, -0.8176305, 1.908572, 0, 0.454902, 1, 1,
0.1991457, -0.7333671, 2.309196, 0, 0.4470588, 1, 1,
0.2013016, 0.211338, 0.564577, 0, 0.4431373, 1, 1,
0.2037999, 1.425868, 0.4614594, 0, 0.4352941, 1, 1,
0.2075137, 0.9857392, -0.8650175, 0, 0.4313726, 1, 1,
0.2154571, 1.488938, -0.01004577, 0, 0.4235294, 1, 1,
0.2273529, -0.9278134, 2.583332, 0, 0.4196078, 1, 1,
0.2275448, 0.8081698, 0.9255704, 0, 0.4117647, 1, 1,
0.2304005, 0.04706361, 1.369504, 0, 0.4078431, 1, 1,
0.2331433, -0.09328034, 1.681445, 0, 0.4, 1, 1,
0.2331663, -0.1118271, 2.074971, 0, 0.3921569, 1, 1,
0.2353353, 0.194956, 0.2939372, 0, 0.3882353, 1, 1,
0.2363394, 0.4363433, 1.462067, 0, 0.3803922, 1, 1,
0.2396429, -0.04157145, 2.079817, 0, 0.3764706, 1, 1,
0.2468329, -0.4023756, 1.372276, 0, 0.3686275, 1, 1,
0.2478608, -0.05887515, 2.493042, 0, 0.3647059, 1, 1,
0.2481131, -1.04572, 1.679542, 0, 0.3568628, 1, 1,
0.2495129, 0.9701388, -0.740663, 0, 0.3529412, 1, 1,
0.2584661, -3.038471, 2.766084, 0, 0.345098, 1, 1,
0.2612968, -1.033928, 0.1481788, 0, 0.3411765, 1, 1,
0.2635241, -0.2843012, 2.046796, 0, 0.3333333, 1, 1,
0.2643221, -0.1641467, 2.108619, 0, 0.3294118, 1, 1,
0.2650217, 0.264506, 0.6378272, 0, 0.3215686, 1, 1,
0.2680829, 0.4801202, -0.1675119, 0, 0.3176471, 1, 1,
0.2682152, 0.9219393, 1.634595, 0, 0.3098039, 1, 1,
0.2746405, -0.2578923, 2.942032, 0, 0.3058824, 1, 1,
0.2782341, -0.6970354, 3.6857, 0, 0.2980392, 1, 1,
0.2826008, 0.07130169, 2.251056, 0, 0.2901961, 1, 1,
0.2892189, -0.2670959, 3.006811, 0, 0.2862745, 1, 1,
0.2899978, 1.435087, 1.803515, 0, 0.2784314, 1, 1,
0.2912408, 0.8718848, -0.04961585, 0, 0.2745098, 1, 1,
0.3018329, 0.3627108, -0.1934789, 0, 0.2666667, 1, 1,
0.3038474, -1.464259, 4.49838, 0, 0.2627451, 1, 1,
0.304497, 2.608192, -0.7604364, 0, 0.254902, 1, 1,
0.3044997, -1.842517, 4.625575, 0, 0.2509804, 1, 1,
0.3053307, -0.09816789, 0.8888662, 0, 0.2431373, 1, 1,
0.3101271, 0.5700253, 0.2386999, 0, 0.2392157, 1, 1,
0.3108539, -1.043219, 1.536602, 0, 0.2313726, 1, 1,
0.3198192, 1.451628, 0.003381555, 0, 0.227451, 1, 1,
0.3256806, 0.7654914, 2.31249, 0, 0.2196078, 1, 1,
0.3270179, -0.4385583, 2.448361, 0, 0.2156863, 1, 1,
0.327943, -1.528826, 2.87127, 0, 0.2078431, 1, 1,
0.3337387, -1.110185, 5.193385, 0, 0.2039216, 1, 1,
0.3346951, 0.7309399, 0.01556956, 0, 0.1960784, 1, 1,
0.3421789, -0.9471492, 2.958713, 0, 0.1882353, 1, 1,
0.3429712, 0.06330968, 1.751174, 0, 0.1843137, 1, 1,
0.3461055, -0.9847206, 1.319861, 0, 0.1764706, 1, 1,
0.3481371, 0.8855565, 1.301662, 0, 0.172549, 1, 1,
0.348303, 1.333575, -0.2294995, 0, 0.1647059, 1, 1,
0.3487536, -0.01952103, 1.204624, 0, 0.1607843, 1, 1,
0.3507707, -0.4764852, 3.000761, 0, 0.1529412, 1, 1,
0.3548542, -0.1818563, 2.118588, 0, 0.1490196, 1, 1,
0.35849, -0.2580322, 1.494032, 0, 0.1411765, 1, 1,
0.3631118, -1.095562, 3.580343, 0, 0.1372549, 1, 1,
0.3642365, 1.936348, 0.1690883, 0, 0.1294118, 1, 1,
0.3654576, -0.9964413, 2.577701, 0, 0.1254902, 1, 1,
0.3656131, 0.4932674, 0.1381105, 0, 0.1176471, 1, 1,
0.3661148, 0.9892696, -0.6323947, 0, 0.1137255, 1, 1,
0.3661823, 0.2818279, 2.065611, 0, 0.1058824, 1, 1,
0.3681299, 0.7642806, 0.2940938, 0, 0.09803922, 1, 1,
0.3764842, -1.018165, 2.97111, 0, 0.09411765, 1, 1,
0.3783851, 0.138656, 0.4296066, 0, 0.08627451, 1, 1,
0.3824607, -2.050021, 3.490821, 0, 0.08235294, 1, 1,
0.3831106, 0.124573, 1.052934, 0, 0.07450981, 1, 1,
0.3846249, 0.5499247, 0.9585189, 0, 0.07058824, 1, 1,
0.3881463, 0.3205101, 0.6524363, 0, 0.0627451, 1, 1,
0.3983269, -0.1917917, 1.408545, 0, 0.05882353, 1, 1,
0.4010198, 0.9605066, 0.6236437, 0, 0.05098039, 1, 1,
0.4076645, 1.668924, -1.133691, 0, 0.04705882, 1, 1,
0.4079088, -0.5185065, 2.495334, 0, 0.03921569, 1, 1,
0.4124807, 0.7716457, 1.530301, 0, 0.03529412, 1, 1,
0.4142262, -1.113813, 2.696361, 0, 0.02745098, 1, 1,
0.4162546, -0.9968449, 3.762926, 0, 0.02352941, 1, 1,
0.4162586, -1.137629, 2.6762, 0, 0.01568628, 1, 1,
0.4235032, 0.1221339, 0.3084651, 0, 0.01176471, 1, 1,
0.4269703, -0.4871521, 2.326272, 0, 0.003921569, 1, 1,
0.4278539, 0.04827417, 1.512847, 0.003921569, 0, 1, 1,
0.4295634, 1.17653, 1.004023, 0.007843138, 0, 1, 1,
0.4314359, 0.2522005, 0.9958293, 0.01568628, 0, 1, 1,
0.43184, -0.07683979, 1.942907, 0.01960784, 0, 1, 1,
0.4326966, -0.7224634, 1.979706, 0.02745098, 0, 1, 1,
0.4335962, 0.6868219, 0.1811438, 0.03137255, 0, 1, 1,
0.4340838, 0.173934, 1.523296, 0.03921569, 0, 1, 1,
0.4356974, -1.348091, 2.542482, 0.04313726, 0, 1, 1,
0.4401374, -0.02697268, -1.099524, 0.05098039, 0, 1, 1,
0.4401408, 0.7905072, 1.790873, 0.05490196, 0, 1, 1,
0.4405005, 0.8096194, 0.3877529, 0.0627451, 0, 1, 1,
0.4428285, 0.2657306, 1.370861, 0.06666667, 0, 1, 1,
0.4443911, -1.010708, 2.339063, 0.07450981, 0, 1, 1,
0.4444433, -0.8096943, 3.141341, 0.07843138, 0, 1, 1,
0.4497062, 0.3851497, 1.574399, 0.08627451, 0, 1, 1,
0.4498827, -0.4332996, 2.459805, 0.09019608, 0, 1, 1,
0.4503894, 0.3207155, 1.467341, 0.09803922, 0, 1, 1,
0.4504231, 0.6205722, -0.9990113, 0.1058824, 0, 1, 1,
0.4551034, 1.272579, 0.1010987, 0.1098039, 0, 1, 1,
0.4593509, -0.781258, 4.204319, 0.1176471, 0, 1, 1,
0.4625147, -0.7319604, 1.345394, 0.1215686, 0, 1, 1,
0.46478, -1.430453, 2.161245, 0.1294118, 0, 1, 1,
0.4654044, 0.01272572, 2.086186, 0.1333333, 0, 1, 1,
0.4668237, 0.7188414, 0.4591664, 0.1411765, 0, 1, 1,
0.4771949, -0.5369205, 1.710908, 0.145098, 0, 1, 1,
0.4822372, 0.7958161, 0.2961153, 0.1529412, 0, 1, 1,
0.482828, 0.3239068, -1.420547, 0.1568628, 0, 1, 1,
0.4838236, 0.8074954, -1.717658, 0.1647059, 0, 1, 1,
0.4902973, -1.442206, 1.600126, 0.1686275, 0, 1, 1,
0.4911061, -0.7069986, 1.95942, 0.1764706, 0, 1, 1,
0.4950331, 0.4784198, 0.6587593, 0.1803922, 0, 1, 1,
0.4977607, 0.3677992, 3.092796, 0.1882353, 0, 1, 1,
0.5021256, 0.1730542, 0.7683152, 0.1921569, 0, 1, 1,
0.5047634, -0.5769444, 3.289678, 0.2, 0, 1, 1,
0.5060329, -0.2627863, 1.15845, 0.2078431, 0, 1, 1,
0.5142777, 0.09177446, 0.483208, 0.2117647, 0, 1, 1,
0.5178655, -1.464208, 2.158816, 0.2196078, 0, 1, 1,
0.5208513, -0.3706118, 1.268262, 0.2235294, 0, 1, 1,
0.5244876, -0.498686, 2.344644, 0.2313726, 0, 1, 1,
0.5305161, -0.9055907, 4.708619, 0.2352941, 0, 1, 1,
0.5314786, -1.161871, 4.111774, 0.2431373, 0, 1, 1,
0.5340914, -0.844821, 2.299104, 0.2470588, 0, 1, 1,
0.5449215, -0.5183666, 2.847405, 0.254902, 0, 1, 1,
0.5486018, 0.4649602, 0.3817912, 0.2588235, 0, 1, 1,
0.5522755, 1.713679, 3.499939, 0.2666667, 0, 1, 1,
0.5553147, 0.009592175, 0.9963849, 0.2705882, 0, 1, 1,
0.5574225, -0.8333147, 1.956777, 0.2784314, 0, 1, 1,
0.5772663, 0.4232463, 0.8124437, 0.282353, 0, 1, 1,
0.5852679, 0.6465375, 1.959567, 0.2901961, 0, 1, 1,
0.593829, 2.034481, 1.808406, 0.2941177, 0, 1, 1,
0.5956771, 0.1798387, 1.099011, 0.3019608, 0, 1, 1,
0.5988418, -0.3159903, 2.393433, 0.3098039, 0, 1, 1,
0.5989392, 0.4403658, 1.473554, 0.3137255, 0, 1, 1,
0.5994151, 1.240555, -0.3958062, 0.3215686, 0, 1, 1,
0.6028682, -1.660576, 2.783395, 0.3254902, 0, 1, 1,
0.6032562, 0.3816327, 2.226391, 0.3333333, 0, 1, 1,
0.6056789, 0.2135001, 0.6727589, 0.3372549, 0, 1, 1,
0.6097966, 0.3833924, 1.333788, 0.345098, 0, 1, 1,
0.6136277, 1.324898, 0.9204455, 0.3490196, 0, 1, 1,
0.6141809, 0.3422247, 1.244847, 0.3568628, 0, 1, 1,
0.6149457, 0.5567683, 2.57956, 0.3607843, 0, 1, 1,
0.6171222, -0.2602081, 2.147397, 0.3686275, 0, 1, 1,
0.6179903, -0.3513379, 5.104388, 0.372549, 0, 1, 1,
0.6184708, -1.190647, 0.6447001, 0.3803922, 0, 1, 1,
0.6223107, 0.7821744, 1.529551, 0.3843137, 0, 1, 1,
0.6276211, 0.6358508, -0.08198174, 0.3921569, 0, 1, 1,
0.6277201, 0.994169, 1.656053, 0.3960784, 0, 1, 1,
0.6306226, -0.646087, 1.367165, 0.4039216, 0, 1, 1,
0.6360358, 0.05359494, 0.6137326, 0.4117647, 0, 1, 1,
0.6370922, -0.9319262, 2.179523, 0.4156863, 0, 1, 1,
0.6374518, 2.063199, 1.204205, 0.4235294, 0, 1, 1,
0.6382911, -0.1919915, 2.218677, 0.427451, 0, 1, 1,
0.6396686, 1.440531, 0.2543685, 0.4352941, 0, 1, 1,
0.6401284, 1.735995, -0.9646414, 0.4392157, 0, 1, 1,
0.6408306, -1.72524, 2.898916, 0.4470588, 0, 1, 1,
0.6423208, -0.7039507, 1.369534, 0.4509804, 0, 1, 1,
0.647449, 0.5662465, 0.01721083, 0.4588235, 0, 1, 1,
0.652364, 0.214061, -0.2826364, 0.4627451, 0, 1, 1,
0.6539187, 0.1836339, 3.622706, 0.4705882, 0, 1, 1,
0.655584, 0.4874612, 0.5365514, 0.4745098, 0, 1, 1,
0.6570232, 0.9594489, 0.5236784, 0.4823529, 0, 1, 1,
0.6599951, 0.3632895, 2.297644, 0.4862745, 0, 1, 1,
0.6671229, 1.128171, -0.1876026, 0.4941176, 0, 1, 1,
0.6696087, 2.068826, 0.4283915, 0.5019608, 0, 1, 1,
0.6706027, -1.665883, 4.438606, 0.5058824, 0, 1, 1,
0.6782438, -1.924504, 4.529754, 0.5137255, 0, 1, 1,
0.6800929, -1.630345, 2.137269, 0.5176471, 0, 1, 1,
0.6917381, 0.0784146, 0.05013545, 0.5254902, 0, 1, 1,
0.6935314, -1.617295, 3.136725, 0.5294118, 0, 1, 1,
0.6957456, 0.8284881, -0.4086129, 0.5372549, 0, 1, 1,
0.7174402, 0.5611216, 1.701738, 0.5411765, 0, 1, 1,
0.7188987, -1.244097, 2.565503, 0.5490196, 0, 1, 1,
0.7228327, 0.3382957, 1.375406, 0.5529412, 0, 1, 1,
0.7234145, -2.81441, 3.145119, 0.5607843, 0, 1, 1,
0.7297257, 1.455282, 1.633539, 0.5647059, 0, 1, 1,
0.7378899, -1.441579, 2.07606, 0.572549, 0, 1, 1,
0.7412471, -0.5754466, 1.634604, 0.5764706, 0, 1, 1,
0.7457469, -0.339074, 2.310374, 0.5843138, 0, 1, 1,
0.7558324, 1.341963, 0.8623008, 0.5882353, 0, 1, 1,
0.7667938, 1.100903, 0.6907215, 0.5960785, 0, 1, 1,
0.7713659, -0.7597803, 2.460232, 0.6039216, 0, 1, 1,
0.771899, 0.1420462, 0.9289021, 0.6078432, 0, 1, 1,
0.7722793, 0.2013497, 0.8101869, 0.6156863, 0, 1, 1,
0.773444, 1.160762, 0.3879506, 0.6196079, 0, 1, 1,
0.7771505, -1.644353, 2.200537, 0.627451, 0, 1, 1,
0.7873723, -1.717909, 2.182753, 0.6313726, 0, 1, 1,
0.7893749, -0.4846541, 2.826391, 0.6392157, 0, 1, 1,
0.7948616, 0.694231, 1.293212, 0.6431373, 0, 1, 1,
0.7966371, -1.846739, 4.478651, 0.6509804, 0, 1, 1,
0.8046008, 0.7040948, 2.199206, 0.654902, 0, 1, 1,
0.806325, 0.1001363, -0.1034334, 0.6627451, 0, 1, 1,
0.8098366, -2.074357, 2.835876, 0.6666667, 0, 1, 1,
0.811092, -0.7513279, 5.420729, 0.6745098, 0, 1, 1,
0.8155833, -1.674145, 2.763085, 0.6784314, 0, 1, 1,
0.8156779, 0.6315144, 3.127281, 0.6862745, 0, 1, 1,
0.8199101, 0.2108107, 2.471849, 0.6901961, 0, 1, 1,
0.8205864, -0.4143746, 2.362164, 0.6980392, 0, 1, 1,
0.822417, 0.8970259, -0.9375159, 0.7058824, 0, 1, 1,
0.8335361, 0.855476, 1.525535, 0.7098039, 0, 1, 1,
0.8417566, 0.1315292, 2.788688, 0.7176471, 0, 1, 1,
0.8444946, 0.7490811, 0.2018587, 0.7215686, 0, 1, 1,
0.8461577, -0.4156892, 1.915087, 0.7294118, 0, 1, 1,
0.8498925, -0.9677656, 3.529254, 0.7333333, 0, 1, 1,
0.8511683, -0.3951558, 2.09173, 0.7411765, 0, 1, 1,
0.8585543, -0.05691928, 0.8174576, 0.7450981, 0, 1, 1,
0.8673562, 0.4270402, 2.339344, 0.7529412, 0, 1, 1,
0.8674511, -1.883404, 2.326593, 0.7568628, 0, 1, 1,
0.8701308, -1.664846, 0.8492904, 0.7647059, 0, 1, 1,
0.8701315, 0.4524384, 0.1300855, 0.7686275, 0, 1, 1,
0.8706414, 1.189713, 1.065059, 0.7764706, 0, 1, 1,
0.8762072, 0.09493033, 2.549364, 0.7803922, 0, 1, 1,
0.8857751, 0.6265382, -0.6644249, 0.7882353, 0, 1, 1,
0.8881062, -0.3124402, 3.624538, 0.7921569, 0, 1, 1,
0.8897628, 0.9231268, 0.5850335, 0.8, 0, 1, 1,
0.8899544, -1.435573, 1.597744, 0.8078431, 0, 1, 1,
0.8901268, -0.7141865, -0.1479314, 0.8117647, 0, 1, 1,
0.8903195, 2.243286, 0.2345628, 0.8196079, 0, 1, 1,
0.89671, 0.04765126, 1.351374, 0.8235294, 0, 1, 1,
0.9026291, 0.7082205, 1.361826, 0.8313726, 0, 1, 1,
0.9036543, 1.139019, 0.8220549, 0.8352941, 0, 1, 1,
0.9146206, -1.419285, 2.76857, 0.8431373, 0, 1, 1,
0.91818, -1.973025, 3.417488, 0.8470588, 0, 1, 1,
0.9208388, -0.4370578, 2.771347, 0.854902, 0, 1, 1,
0.9262202, -0.3696641, 1.007713, 0.8588235, 0, 1, 1,
0.9348791, -1.483298, 2.42173, 0.8666667, 0, 1, 1,
0.9349042, -1.591107, 0.9866152, 0.8705882, 0, 1, 1,
0.9391667, -1.043658, 3.758099, 0.8784314, 0, 1, 1,
0.9396963, -2.067704, 1.968627, 0.8823529, 0, 1, 1,
0.9426572, -1.459773, 1.780447, 0.8901961, 0, 1, 1,
0.9451345, -0.9306941, 2.163145, 0.8941177, 0, 1, 1,
0.9459347, -0.06829731, 2.562711, 0.9019608, 0, 1, 1,
0.9505659, -1.808559, 0.6831124, 0.9098039, 0, 1, 1,
0.9579264, -0.6721715, 1.01903, 0.9137255, 0, 1, 1,
0.9582319, 0.1447388, 0.04236814, 0.9215686, 0, 1, 1,
0.9662503, 0.3367176, -0.004934952, 0.9254902, 0, 1, 1,
0.9677254, -0.843387, 2.007885, 0.9333333, 0, 1, 1,
0.9758979, 0.9416555, 1.168136, 0.9372549, 0, 1, 1,
0.9771827, -0.8255402, 1.415701, 0.945098, 0, 1, 1,
0.978108, -1.607556, 3.691264, 0.9490196, 0, 1, 1,
0.9806206, -0.3468429, 2.732063, 0.9568627, 0, 1, 1,
0.9894692, 0.5492828, 0.5570134, 0.9607843, 0, 1, 1,
0.9918126, 2.310249, 0.04742549, 0.9686275, 0, 1, 1,
0.9944813, -0.7880559, 0.5686682, 0.972549, 0, 1, 1,
0.9952003, 0.4077581, 1.480968, 0.9803922, 0, 1, 1,
0.995918, 0.08369272, -0.2315452, 0.9843137, 0, 1, 1,
0.9968171, -1.956774, 3.739371, 0.9921569, 0, 1, 1,
0.9977671, 1.744602, -0.9128013, 0.9960784, 0, 1, 1,
1.005363, 0.519461, -0.2407676, 1, 0, 0.9960784, 1,
1.010339, 1.737635, 0.3569598, 1, 0, 0.9882353, 1,
1.013488, 0.8612515, -0.3515376, 1, 0, 0.9843137, 1,
1.018326, 1.139983, 1.574094, 1, 0, 0.9764706, 1,
1.019455, -0.5843692, 0.8322961, 1, 0, 0.972549, 1,
1.027248, 0.7068766, 1.102938, 1, 0, 0.9647059, 1,
1.027981, 0.8314657, 1.319202, 1, 0, 0.9607843, 1,
1.035355, 1.483254, 1.934106, 1, 0, 0.9529412, 1,
1.041132, -0.009534893, 1.078905, 1, 0, 0.9490196, 1,
1.042146, -0.04148386, 1.108849, 1, 0, 0.9411765, 1,
1.044687, 1.177991, 1.064902, 1, 0, 0.9372549, 1,
1.054008, -0.513563, 3.094207, 1, 0, 0.9294118, 1,
1.055272, -1.081274, 2.683831, 1, 0, 0.9254902, 1,
1.0637, 1.613961, 1.512343, 1, 0, 0.9176471, 1,
1.074945, -0.4171454, 2.901957, 1, 0, 0.9137255, 1,
1.079084, -0.9604841, 3.893327, 1, 0, 0.9058824, 1,
1.082841, -1.10589, 3.229936, 1, 0, 0.9019608, 1,
1.082885, -0.045355, 0.9987549, 1, 0, 0.8941177, 1,
1.083668, 0.1746265, 0.6258342, 1, 0, 0.8862745, 1,
1.090538, -0.8546945, 1.776198, 1, 0, 0.8823529, 1,
1.091971, -0.1065324, 2.55305, 1, 0, 0.8745098, 1,
1.097543, -0.6946262, 3.004062, 1, 0, 0.8705882, 1,
1.100529, 0.5904476, 0.4606756, 1, 0, 0.8627451, 1,
1.101632, 0.7972727, 0.1225529, 1, 0, 0.8588235, 1,
1.108544, -0.3481188, 3.351985, 1, 0, 0.8509804, 1,
1.109238, -0.1963088, 1.829967, 1, 0, 0.8470588, 1,
1.122007, 2.260428, -1.98271, 1, 0, 0.8392157, 1,
1.126051, 0.9310296, -0.3969538, 1, 0, 0.8352941, 1,
1.129514, -1.44165, 3.483537, 1, 0, 0.827451, 1,
1.135688, -0.8208357, 3.57957, 1, 0, 0.8235294, 1,
1.136859, -0.3756241, 2.883653, 1, 0, 0.8156863, 1,
1.144075, 0.6056869, 0.9042756, 1, 0, 0.8117647, 1,
1.148427, -1.008524, 2.970984, 1, 0, 0.8039216, 1,
1.149239, -0.5535987, 2.098139, 1, 0, 0.7960784, 1,
1.151852, -1.647277, 2.351737, 1, 0, 0.7921569, 1,
1.154115, 1.521685, 0.4854653, 1, 0, 0.7843137, 1,
1.155893, 0.06962131, -0.1387523, 1, 0, 0.7803922, 1,
1.156253, -1.868247, 1.821504, 1, 0, 0.772549, 1,
1.161125, 0.01533342, 1.605917, 1, 0, 0.7686275, 1,
1.162818, -0.9995356, 3.227622, 1, 0, 0.7607843, 1,
1.166385, 0.1561814, 0.9462248, 1, 0, 0.7568628, 1,
1.17399, -1.880013, 3.946061, 1, 0, 0.7490196, 1,
1.180472, 0.568469, 0.8661095, 1, 0, 0.7450981, 1,
1.186898, -0.6519879, 1.632243, 1, 0, 0.7372549, 1,
1.186934, -1.01856, 2.109589, 1, 0, 0.7333333, 1,
1.187606, -0.1874269, 2.154797, 1, 0, 0.7254902, 1,
1.188341, 0.0334156, 0.3758201, 1, 0, 0.7215686, 1,
1.188449, 1.747226, -0.3635993, 1, 0, 0.7137255, 1,
1.194794, 1.055688, 1.510284, 1, 0, 0.7098039, 1,
1.200463, 0.3528745, 1.344263, 1, 0, 0.7019608, 1,
1.214596, -0.431302, 2.939349, 1, 0, 0.6941177, 1,
1.233478, 1.446723, 1.30456, 1, 0, 0.6901961, 1,
1.243382, -0.05847239, 2.615473, 1, 0, 0.682353, 1,
1.244487, -1.059428, 1.275683, 1, 0, 0.6784314, 1,
1.246756, 0.9662517, 1.405166, 1, 0, 0.6705883, 1,
1.247235, -2.03137, 3.804418, 1, 0, 0.6666667, 1,
1.266884, 0.04886319, 0.08122724, 1, 0, 0.6588235, 1,
1.277209, -1.414059, 3.342754, 1, 0, 0.654902, 1,
1.277611, 1.160842, 0.1540232, 1, 0, 0.6470588, 1,
1.278111, 0.6309847, 1.401589, 1, 0, 0.6431373, 1,
1.278887, 0.3588029, 3.552876, 1, 0, 0.6352941, 1,
1.283891, 1.038027, -0.5889692, 1, 0, 0.6313726, 1,
1.287082, 0.7985971, 0.7367904, 1, 0, 0.6235294, 1,
1.289425, 0.1665287, 2.511189, 1, 0, 0.6196079, 1,
1.291689, 0.1416273, 1.656896, 1, 0, 0.6117647, 1,
1.297744, -0.05692122, 2.029948, 1, 0, 0.6078432, 1,
1.307782, -0.9492189, 1.445441, 1, 0, 0.6, 1,
1.310381, -2.11059, 2.599544, 1, 0, 0.5921569, 1,
1.311636, -0.1055742, 2.744343, 1, 0, 0.5882353, 1,
1.325029, -0.841025, 3.073616, 1, 0, 0.5803922, 1,
1.326371, 0.116291, 1.027814, 1, 0, 0.5764706, 1,
1.327672, -1.045633, 2.703035, 1, 0, 0.5686275, 1,
1.33445, 0.2714848, 1.148803, 1, 0, 0.5647059, 1,
1.334707, -1.385071, 3.333572, 1, 0, 0.5568628, 1,
1.340637, 0.7314644, 1.010899, 1, 0, 0.5529412, 1,
1.348537, 0.5336914, 1.572259, 1, 0, 0.5450981, 1,
1.351059, -0.8803, 1.802278, 1, 0, 0.5411765, 1,
1.35148, 0.1581839, 2.258596, 1, 0, 0.5333334, 1,
1.353265, -0.2125879, 3.231572, 1, 0, 0.5294118, 1,
1.359074, 0.2629732, 0.466399, 1, 0, 0.5215687, 1,
1.365961, -1.649203, 1.668102, 1, 0, 0.5176471, 1,
1.370545, -1.244189, 1.472337, 1, 0, 0.509804, 1,
1.380776, 0.8104035, 1.294675, 1, 0, 0.5058824, 1,
1.382111, 0.1926192, 0.9511822, 1, 0, 0.4980392, 1,
1.386886, 1.056484, 0.6299127, 1, 0, 0.4901961, 1,
1.389078, 0.1684157, 0.9761794, 1, 0, 0.4862745, 1,
1.404949, -0.04915145, 0.9652804, 1, 0, 0.4784314, 1,
1.405971, 1.338303, 0.8989264, 1, 0, 0.4745098, 1,
1.411042, 1.220943, 0.9793648, 1, 0, 0.4666667, 1,
1.411375, -0.2589919, 2.165109, 1, 0, 0.4627451, 1,
1.413116, -0.5234144, 0.2236213, 1, 0, 0.454902, 1,
1.419527, 0.5501678, 1.18559, 1, 0, 0.4509804, 1,
1.427223, -0.3897936, 3.278298, 1, 0, 0.4431373, 1,
1.431492, -0.8841166, 3.336475, 1, 0, 0.4392157, 1,
1.441129, 0.8061863, -0.8987278, 1, 0, 0.4313726, 1,
1.459977, -1.501857, 3.116858, 1, 0, 0.427451, 1,
1.461696, 0.2162519, 1.747706, 1, 0, 0.4196078, 1,
1.462554, 0.1607932, 0.8849926, 1, 0, 0.4156863, 1,
1.468636, 0.6984022, 0.9537216, 1, 0, 0.4078431, 1,
1.475557, 1.298272, 1.325733, 1, 0, 0.4039216, 1,
1.477983, -0.6897242, 1.703194, 1, 0, 0.3960784, 1,
1.497664, 1.370018, 0.9373648, 1, 0, 0.3882353, 1,
1.503452, -2.047184, 2.908368, 1, 0, 0.3843137, 1,
1.527597, -1.341709, 1.630274, 1, 0, 0.3764706, 1,
1.532599, -1.313387, 3.743795, 1, 0, 0.372549, 1,
1.549732, 2.735821, -0.274537, 1, 0, 0.3647059, 1,
1.551618, -1.007306, 2.078667, 1, 0, 0.3607843, 1,
1.570217, -0.6303009, 1.705205, 1, 0, 0.3529412, 1,
1.573889, -0.008298689, 1.641502, 1, 0, 0.3490196, 1,
1.583301, 0.9236271, 1.880629, 1, 0, 0.3411765, 1,
1.588178, -0.1353008, 2.447512, 1, 0, 0.3372549, 1,
1.622447, 0.05959918, 1.978699, 1, 0, 0.3294118, 1,
1.648619, -0.410596, 1.721936, 1, 0, 0.3254902, 1,
1.656139, 1.215703, 1.138613, 1, 0, 0.3176471, 1,
1.674688, -1.947406, 1.341689, 1, 0, 0.3137255, 1,
1.681305, 1.070402, 1.035825, 1, 0, 0.3058824, 1,
1.71642, -1.36521, 2.499439, 1, 0, 0.2980392, 1,
1.719092, -0.5733008, -0.6907997, 1, 0, 0.2941177, 1,
1.724158, -0.849345, 1.801625, 1, 0, 0.2862745, 1,
1.764592, -0.08549669, 0.8642347, 1, 0, 0.282353, 1,
1.765469, 1.433756, -0.8805932, 1, 0, 0.2745098, 1,
1.776626, 0.1758711, 1.013851, 1, 0, 0.2705882, 1,
1.80333, -1.937173, 4.087945, 1, 0, 0.2627451, 1,
1.803788, 1.742193, -0.8832029, 1, 0, 0.2588235, 1,
1.812011, 0.4162683, 0.2081178, 1, 0, 0.2509804, 1,
1.826005, -0.5886753, 1.597704, 1, 0, 0.2470588, 1,
1.832148, 1.237799, 1.887525, 1, 0, 0.2392157, 1,
1.835302, -1.534574, 3.766425, 1, 0, 0.2352941, 1,
1.841633, -0.03604024, 0.7806122, 1, 0, 0.227451, 1,
1.8547, -1.04799, 1.285104, 1, 0, 0.2235294, 1,
1.869588, -0.7820707, 2.549317, 1, 0, 0.2156863, 1,
1.882384, 0.2620396, 1.515346, 1, 0, 0.2117647, 1,
1.904145, 0.4627601, 0.6457188, 1, 0, 0.2039216, 1,
1.906478, 0.5527347, 1.130126, 1, 0, 0.1960784, 1,
1.921797, -0.281732, 2.438243, 1, 0, 0.1921569, 1,
1.922544, -0.404792, 2.876208, 1, 0, 0.1843137, 1,
1.928884, 0.6105782, 1.895715, 1, 0, 0.1803922, 1,
1.95822, 0.4643932, 2.156346, 1, 0, 0.172549, 1,
1.958875, 0.09747095, 2.831898, 1, 0, 0.1686275, 1,
1.95989, 0.3242067, 0.1811825, 1, 0, 0.1607843, 1,
1.968983, -0.06040029, 0.4042598, 1, 0, 0.1568628, 1,
1.982628, 0.2448245, 2.074572, 1, 0, 0.1490196, 1,
1.988478, 0.08415778, 1.162447, 1, 0, 0.145098, 1,
2.024659, 0.5272646, 2.241654, 1, 0, 0.1372549, 1,
2.0351, 1.521549, 0.5354865, 1, 0, 0.1333333, 1,
2.04526, -0.1442717, 0.9946904, 1, 0, 0.1254902, 1,
2.056221, 0.0812436, 0.9770568, 1, 0, 0.1215686, 1,
2.072413, 0.3173665, 3.134518, 1, 0, 0.1137255, 1,
2.094453, 0.4825779, 0.4793991, 1, 0, 0.1098039, 1,
2.102862, -0.6606563, 1.500065, 1, 0, 0.1019608, 1,
2.111396, 1.110109, 2.869263, 1, 0, 0.09411765, 1,
2.139916, 1.065725, 0.5296875, 1, 0, 0.09019608, 1,
2.142873, 0.4565799, 0.5315444, 1, 0, 0.08235294, 1,
2.159192, -0.4357053, 2.999782, 1, 0, 0.07843138, 1,
2.24033, -0.5725, 1.984985, 1, 0, 0.07058824, 1,
2.272304, 0.2700659, 1.739599, 1, 0, 0.06666667, 1,
2.284405, -1.073364, 1.41864, 1, 0, 0.05882353, 1,
2.308979, -0.1804704, 2.755666, 1, 0, 0.05490196, 1,
2.315202, -1.114289, 1.920467, 1, 0, 0.04705882, 1,
2.331285, -0.328943, 1.893612, 1, 0, 0.04313726, 1,
2.482617, 0.4160715, 0.4918771, 1, 0, 0.03529412, 1,
2.712346, 0.3149386, 1.11767, 1, 0, 0.03137255, 1,
2.721998, 1.152012, 1.622287, 1, 0, 0.02352941, 1,
2.757696, -0.2417856, 1.408492, 1, 0, 0.01960784, 1,
2.835018, -0.5520331, 0.6879626, 1, 0, 0.01176471, 1,
3.102509, -0.9104208, 2.070806, 1, 0, 0.007843138, 1
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
0.04372227, -4.101747, -7.116464, 0, -0.5, 0.5, 0.5,
0.04372227, -4.101747, -7.116464, 1, -0.5, 0.5, 0.5,
0.04372227, -4.101747, -7.116464, 1, 1.5, 0.5, 0.5,
0.04372227, -4.101747, -7.116464, 0, 1.5, 0.5, 0.5
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
-4.051993, 0.09803391, -7.116464, 0, -0.5, 0.5, 0.5,
-4.051993, 0.09803391, -7.116464, 1, -0.5, 0.5, 0.5,
-4.051993, 0.09803391, -7.116464, 1, 1.5, 0.5, 0.5,
-4.051993, 0.09803391, -7.116464, 0, 1.5, 0.5, 0.5
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
-4.051993, -4.101747, 0.498173, 0, -0.5, 0.5, 0.5,
-4.051993, -4.101747, 0.498173, 1, -0.5, 0.5, 0.5,
-4.051993, -4.101747, 0.498173, 1, 1.5, 0.5, 0.5,
-4.051993, -4.101747, 0.498173, 0, 1.5, 0.5, 0.5
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
-3, -3.132567, -5.35924,
3, -3.132567, -5.35924,
-3, -3.132567, -5.35924,
-3, -3.294097, -5.652111,
-2, -3.132567, -5.35924,
-2, -3.294097, -5.652111,
-1, -3.132567, -5.35924,
-1, -3.294097, -5.652111,
0, -3.132567, -5.35924,
0, -3.294097, -5.652111,
1, -3.132567, -5.35924,
1, -3.294097, -5.652111,
2, -3.132567, -5.35924,
2, -3.294097, -5.652111,
3, -3.132567, -5.35924,
3, -3.294097, -5.652111
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
-3, -3.617157, -6.237852, 0, -0.5, 0.5, 0.5,
-3, -3.617157, -6.237852, 1, -0.5, 0.5, 0.5,
-3, -3.617157, -6.237852, 1, 1.5, 0.5, 0.5,
-3, -3.617157, -6.237852, 0, 1.5, 0.5, 0.5,
-2, -3.617157, -6.237852, 0, -0.5, 0.5, 0.5,
-2, -3.617157, -6.237852, 1, -0.5, 0.5, 0.5,
-2, -3.617157, -6.237852, 1, 1.5, 0.5, 0.5,
-2, -3.617157, -6.237852, 0, 1.5, 0.5, 0.5,
-1, -3.617157, -6.237852, 0, -0.5, 0.5, 0.5,
-1, -3.617157, -6.237852, 1, -0.5, 0.5, 0.5,
-1, -3.617157, -6.237852, 1, 1.5, 0.5, 0.5,
-1, -3.617157, -6.237852, 0, 1.5, 0.5, 0.5,
0, -3.617157, -6.237852, 0, -0.5, 0.5, 0.5,
0, -3.617157, -6.237852, 1, -0.5, 0.5, 0.5,
0, -3.617157, -6.237852, 1, 1.5, 0.5, 0.5,
0, -3.617157, -6.237852, 0, 1.5, 0.5, 0.5,
1, -3.617157, -6.237852, 0, -0.5, 0.5, 0.5,
1, -3.617157, -6.237852, 1, -0.5, 0.5, 0.5,
1, -3.617157, -6.237852, 1, 1.5, 0.5, 0.5,
1, -3.617157, -6.237852, 0, 1.5, 0.5, 0.5,
2, -3.617157, -6.237852, 0, -0.5, 0.5, 0.5,
2, -3.617157, -6.237852, 1, -0.5, 0.5, 0.5,
2, -3.617157, -6.237852, 1, 1.5, 0.5, 0.5,
2, -3.617157, -6.237852, 0, 1.5, 0.5, 0.5,
3, -3.617157, -6.237852, 0, -0.5, 0.5, 0.5,
3, -3.617157, -6.237852, 1, -0.5, 0.5, 0.5,
3, -3.617157, -6.237852, 1, 1.5, 0.5, 0.5,
3, -3.617157, -6.237852, 0, 1.5, 0.5, 0.5
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
-3.106828, -3, -5.35924,
-3.106828, 3, -5.35924,
-3.106828, -3, -5.35924,
-3.264356, -3, -5.652111,
-3.106828, -2, -5.35924,
-3.264356, -2, -5.652111,
-3.106828, -1, -5.35924,
-3.264356, -1, -5.652111,
-3.106828, 0, -5.35924,
-3.264356, 0, -5.652111,
-3.106828, 1, -5.35924,
-3.264356, 1, -5.652111,
-3.106828, 2, -5.35924,
-3.264356, 2, -5.652111,
-3.106828, 3, -5.35924,
-3.264356, 3, -5.652111
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
-3.579411, -3, -6.237852, 0, -0.5, 0.5, 0.5,
-3.579411, -3, -6.237852, 1, -0.5, 0.5, 0.5,
-3.579411, -3, -6.237852, 1, 1.5, 0.5, 0.5,
-3.579411, -3, -6.237852, 0, 1.5, 0.5, 0.5,
-3.579411, -2, -6.237852, 0, -0.5, 0.5, 0.5,
-3.579411, -2, -6.237852, 1, -0.5, 0.5, 0.5,
-3.579411, -2, -6.237852, 1, 1.5, 0.5, 0.5,
-3.579411, -2, -6.237852, 0, 1.5, 0.5, 0.5,
-3.579411, -1, -6.237852, 0, -0.5, 0.5, 0.5,
-3.579411, -1, -6.237852, 1, -0.5, 0.5, 0.5,
-3.579411, -1, -6.237852, 1, 1.5, 0.5, 0.5,
-3.579411, -1, -6.237852, 0, 1.5, 0.5, 0.5,
-3.579411, 0, -6.237852, 0, -0.5, 0.5, 0.5,
-3.579411, 0, -6.237852, 1, -0.5, 0.5, 0.5,
-3.579411, 0, -6.237852, 1, 1.5, 0.5, 0.5,
-3.579411, 0, -6.237852, 0, 1.5, 0.5, 0.5,
-3.579411, 1, -6.237852, 0, -0.5, 0.5, 0.5,
-3.579411, 1, -6.237852, 1, -0.5, 0.5, 0.5,
-3.579411, 1, -6.237852, 1, 1.5, 0.5, 0.5,
-3.579411, 1, -6.237852, 0, 1.5, 0.5, 0.5,
-3.579411, 2, -6.237852, 0, -0.5, 0.5, 0.5,
-3.579411, 2, -6.237852, 1, -0.5, 0.5, 0.5,
-3.579411, 2, -6.237852, 1, 1.5, 0.5, 0.5,
-3.579411, 2, -6.237852, 0, 1.5, 0.5, 0.5,
-3.579411, 3, -6.237852, 0, -0.5, 0.5, 0.5,
-3.579411, 3, -6.237852, 1, -0.5, 0.5, 0.5,
-3.579411, 3, -6.237852, 1, 1.5, 0.5, 0.5,
-3.579411, 3, -6.237852, 0, 1.5, 0.5, 0.5
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
-3.106828, -3.132567, -4,
-3.106828, -3.132567, 6,
-3.106828, -3.132567, -4,
-3.264356, -3.294097, -4,
-3.106828, -3.132567, -2,
-3.264356, -3.294097, -2,
-3.106828, -3.132567, 0,
-3.264356, -3.294097, 0,
-3.106828, -3.132567, 2,
-3.264356, -3.294097, 2,
-3.106828, -3.132567, 4,
-3.264356, -3.294097, 4,
-3.106828, -3.132567, 6,
-3.264356, -3.294097, 6
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
"4",
"6"
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
-3.579411, -3.617157, -4, 0, -0.5, 0.5, 0.5,
-3.579411, -3.617157, -4, 1, -0.5, 0.5, 0.5,
-3.579411, -3.617157, -4, 1, 1.5, 0.5, 0.5,
-3.579411, -3.617157, -4, 0, 1.5, 0.5, 0.5,
-3.579411, -3.617157, -2, 0, -0.5, 0.5, 0.5,
-3.579411, -3.617157, -2, 1, -0.5, 0.5, 0.5,
-3.579411, -3.617157, -2, 1, 1.5, 0.5, 0.5,
-3.579411, -3.617157, -2, 0, 1.5, 0.5, 0.5,
-3.579411, -3.617157, 0, 0, -0.5, 0.5, 0.5,
-3.579411, -3.617157, 0, 1, -0.5, 0.5, 0.5,
-3.579411, -3.617157, 0, 1, 1.5, 0.5, 0.5,
-3.579411, -3.617157, 0, 0, 1.5, 0.5, 0.5,
-3.579411, -3.617157, 2, 0, -0.5, 0.5, 0.5,
-3.579411, -3.617157, 2, 1, -0.5, 0.5, 0.5,
-3.579411, -3.617157, 2, 1, 1.5, 0.5, 0.5,
-3.579411, -3.617157, 2, 0, 1.5, 0.5, 0.5,
-3.579411, -3.617157, 4, 0, -0.5, 0.5, 0.5,
-3.579411, -3.617157, 4, 1, -0.5, 0.5, 0.5,
-3.579411, -3.617157, 4, 1, 1.5, 0.5, 0.5,
-3.579411, -3.617157, 4, 0, 1.5, 0.5, 0.5,
-3.579411, -3.617157, 6, 0, -0.5, 0.5, 0.5,
-3.579411, -3.617157, 6, 1, -0.5, 0.5, 0.5,
-3.579411, -3.617157, 6, 1, 1.5, 0.5, 0.5,
-3.579411, -3.617157, 6, 0, 1.5, 0.5, 0.5
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
-3.106828, -3.132567, -5.35924,
-3.106828, 3.328635, -5.35924,
-3.106828, -3.132567, 6.355586,
-3.106828, 3.328635, 6.355586,
-3.106828, -3.132567, -5.35924,
-3.106828, -3.132567, 6.355586,
-3.106828, 3.328635, -5.35924,
-3.106828, 3.328635, 6.355586,
-3.106828, -3.132567, -5.35924,
3.194273, -3.132567, -5.35924,
-3.106828, -3.132567, 6.355586,
3.194273, -3.132567, 6.355586,
-3.106828, 3.328635, -5.35924,
3.194273, 3.328635, -5.35924,
-3.106828, 3.328635, 6.355586,
3.194273, 3.328635, 6.355586,
3.194273, -3.132567, -5.35924,
3.194273, 3.328635, -5.35924,
3.194273, -3.132567, 6.355586,
3.194273, 3.328635, 6.355586,
3.194273, -3.132567, -5.35924,
3.194273, -3.132567, 6.355586,
3.194273, 3.328635, -5.35924,
3.194273, 3.328635, 6.355586
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
var radius = 7.896563;
var distance = 35.1327;
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
mvMatrix.translate( -0.04372227, -0.09803391, -0.498173 );
mvMatrix.scale( 1.354988, 1.321414, 0.7288131 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.1327);
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
trichloro-s-triazine<-read.table("trichloro-s-triazine.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-trichloro-s-triazine$V2
```

```
## Error in eval(expr, envir, enclos): object 'trichloro' not found
```

```r
y<-trichloro-s-triazine$V3
```

```
## Error in eval(expr, envir, enclos): object 'trichloro' not found
```

```r
z<-trichloro-s-triazine$V4
```

```
## Error in eval(expr, envir, enclos): object 'trichloro' not found
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
-3.015064, -0.9160763, 0.3413017, 0, 0, 1, 1, 1,
-2.988846, 0.1118914, -3.206951, 1, 0, 0, 1, 1,
-2.865657, -0.8054761, -2.480067, 1, 0, 0, 1, 1,
-2.778346, 1.054466, -1.181933, 1, 0, 0, 1, 1,
-2.753772, -0.03474945, 0.07203864, 1, 0, 0, 1, 1,
-2.7489, 0.3702359, -0.87269, 1, 0, 0, 1, 1,
-2.529045, 0.5587918, -2.447361, 0, 0, 0, 1, 1,
-2.507443, -0.1766979, -1.184467, 0, 0, 0, 1, 1,
-2.452089, 0.3189398, -1.349558, 0, 0, 0, 1, 1,
-2.40709, -0.2717199, -2.982673, 0, 0, 0, 1, 1,
-2.342108, -0.9085154, -1.748576, 0, 0, 0, 1, 1,
-2.288969, 1.704829, -2.789244, 0, 0, 0, 1, 1,
-2.239614, 0.7303514, -0.7274275, 0, 0, 0, 1, 1,
-2.181444, 0.5548725, -0.1467246, 1, 1, 1, 1, 1,
-2.150214, 0.9800504, -2.662037, 1, 1, 1, 1, 1,
-2.127235, -0.2322875, -1.027359, 1, 1, 1, 1, 1,
-2.091565, 0.5819475, -0.7581612, 1, 1, 1, 1, 1,
-2.08408, 0.9942369, -3.734533, 1, 1, 1, 1, 1,
-2.082141, -1.506907, -2.138802, 1, 1, 1, 1, 1,
-2.080244, -0.1590044, -0.4843473, 1, 1, 1, 1, 1,
-2.063323, -0.1161002, -1.437945, 1, 1, 1, 1, 1,
-2.032761, 0.2671727, -0.2932489, 1, 1, 1, 1, 1,
-2.022663, 1.27033, -1.851523, 1, 1, 1, 1, 1,
-2.018581, 1.693372, -0.6230134, 1, 1, 1, 1, 1,
-2.014769, -0.1593296, -2.761383, 1, 1, 1, 1, 1,
-2.000632, -1.21386, -2.133632, 1, 1, 1, 1, 1,
-1.998424, -0.8075203, -2.684924, 1, 1, 1, 1, 1,
-1.989133, -0.8346932, -2.010734, 1, 1, 1, 1, 1,
-1.975353, -1.186464, -2.063072, 0, 0, 1, 1, 1,
-1.947105, -0.2236494, -1.145463, 1, 0, 0, 1, 1,
-1.939373, 2.425836, -0.6557114, 1, 0, 0, 1, 1,
-1.933308, -0.6238328, -3.986665, 1, 0, 0, 1, 1,
-1.926408, 0.6006752, -2.133473, 1, 0, 0, 1, 1,
-1.912873, -2.396374, -1.109761, 1, 0, 0, 1, 1,
-1.908813, -0.5381393, -1.495239, 0, 0, 0, 1, 1,
-1.903973, -0.9425445, -3.966968, 0, 0, 0, 1, 1,
-1.901376, 1.941509, -0.2251084, 0, 0, 0, 1, 1,
-1.847197, -0.05153522, -0.9018595, 0, 0, 0, 1, 1,
-1.812719, -0.7272291, -2.31305, 0, 0, 0, 1, 1,
-1.801182, -2.17038, -2.701807, 0, 0, 0, 1, 1,
-1.760251, 2.550921, 1.521548, 0, 0, 0, 1, 1,
-1.759489, 1.148304, -0.09090185, 1, 1, 1, 1, 1,
-1.758885, -1.776621, -2.837521, 1, 1, 1, 1, 1,
-1.738662, -1.592995, -3.628057, 1, 1, 1, 1, 1,
-1.736469, -0.427914, -2.447098, 1, 1, 1, 1, 1,
-1.731681, -0.6040703, -1.032811, 1, 1, 1, 1, 1,
-1.726562, -0.06949344, -0.7028164, 1, 1, 1, 1, 1,
-1.726381, -1.977026, -2.168261, 1, 1, 1, 1, 1,
-1.722323, -1.440712, -2.899619, 1, 1, 1, 1, 1,
-1.719404, 0.7298473, 0.1428531, 1, 1, 1, 1, 1,
-1.692145, -0.03471174, -0.1038658, 1, 1, 1, 1, 1,
-1.686676, -0.4751969, -0.03901204, 1, 1, 1, 1, 1,
-1.672218, 1.304435, -1.220083, 1, 1, 1, 1, 1,
-1.622137, 1.039978, -2.366409, 1, 1, 1, 1, 1,
-1.619337, 0.6089807, -1.610467, 1, 1, 1, 1, 1,
-1.597792, -0.02033117, -0.1702896, 1, 1, 1, 1, 1,
-1.583462, -0.1354842, -2.591644, 0, 0, 1, 1, 1,
-1.577706, 1.424095, 0.4108513, 1, 0, 0, 1, 1,
-1.573859, -0.4852413, -1.280712, 1, 0, 0, 1, 1,
-1.562619, 1.159551, 0.3803803, 1, 0, 0, 1, 1,
-1.546063, 1.104708, -0.5776478, 1, 0, 0, 1, 1,
-1.54472, 0.366868, -0.0969152, 1, 0, 0, 1, 1,
-1.538201, 0.247748, -2.382146, 0, 0, 0, 1, 1,
-1.537851, -0.9352236, -2.300967, 0, 0, 0, 1, 1,
-1.53388, -0.9268382, -1.398494, 0, 0, 0, 1, 1,
-1.531779, 0.594894, 0.2696914, 0, 0, 0, 1, 1,
-1.525378, -0.4248017, -2.449843, 0, 0, 0, 1, 1,
-1.521679, 1.020342, -0.1846142, 0, 0, 0, 1, 1,
-1.513863, -1.086994, -1.986584, 0, 0, 0, 1, 1,
-1.508736, -0.7484732, -3.387941, 1, 1, 1, 1, 1,
-1.504064, 1.447477, -0.3612687, 1, 1, 1, 1, 1,
-1.500305, -0.8180586, -0.234399, 1, 1, 1, 1, 1,
-1.493358, -0.7274743, -1.740576, 1, 1, 1, 1, 1,
-1.492871, -1.040418, -3.181702, 1, 1, 1, 1, 1,
-1.479149, -0.003537365, -1.379594, 1, 1, 1, 1, 1,
-1.472403, -0.3272485, -1.799605, 1, 1, 1, 1, 1,
-1.462358, 1.181441, 1.053092, 1, 1, 1, 1, 1,
-1.460116, -0.1771775, -0.5290253, 1, 1, 1, 1, 1,
-1.459531, -0.998816, -2.380006, 1, 1, 1, 1, 1,
-1.445606, 2.051403, -3.859694, 1, 1, 1, 1, 1,
-1.429971, -0.06440824, -2.836004, 1, 1, 1, 1, 1,
-1.416473, 0.4993879, -1.861792, 1, 1, 1, 1, 1,
-1.408296, -0.7083703, -2.781275, 1, 1, 1, 1, 1,
-1.407814, -0.5584321, -1.318443, 1, 1, 1, 1, 1,
-1.407388, 0.2966844, -0.5721481, 0, 0, 1, 1, 1,
-1.406374, -0.4126119, -1.937053, 1, 0, 0, 1, 1,
-1.399856, 1.926204, -1.449406, 1, 0, 0, 1, 1,
-1.396508, 1.264712, -0.5405014, 1, 0, 0, 1, 1,
-1.389566, 1.007399, -0.834437, 1, 0, 0, 1, 1,
-1.383179, -0.4803551, -2.542161, 1, 0, 0, 1, 1,
-1.379502, -0.2019565, -1.694085, 0, 0, 0, 1, 1,
-1.362023, 1.260311, -0.3267537, 0, 0, 0, 1, 1,
-1.359198, 0.08738865, -0.5163804, 0, 0, 0, 1, 1,
-1.358145, -1.008137, -2.176377, 0, 0, 0, 1, 1,
-1.354144, -1.028823, -1.982209, 0, 0, 0, 1, 1,
-1.343684, 0.8621771, -2.399125, 0, 0, 0, 1, 1,
-1.342192, 0.3238958, -0.6199175, 0, 0, 0, 1, 1,
-1.335238, -0.2887755, -0.8909638, 1, 1, 1, 1, 1,
-1.329497, 3.171777, 1.246682, 1, 1, 1, 1, 1,
-1.311691, 1.705995, -1.84781, 1, 1, 1, 1, 1,
-1.304696, -1.114517, -2.831558, 1, 1, 1, 1, 1,
-1.304269, -0.3215774, -2.881333, 1, 1, 1, 1, 1,
-1.283571, 1.1414, -0.8280895, 1, 1, 1, 1, 1,
-1.283126, 0.2276099, -3.014653, 1, 1, 1, 1, 1,
-1.279095, 0.3893074, -1.743966, 1, 1, 1, 1, 1,
-1.270871, -0.5240777, -2.499853, 1, 1, 1, 1, 1,
-1.266833, -0.3733369, -2.869723, 1, 1, 1, 1, 1,
-1.266528, -0.1796735, -1.232263, 1, 1, 1, 1, 1,
-1.260965, -0.4003022, -1.809999, 1, 1, 1, 1, 1,
-1.258363, 0.4200438, -1.743892, 1, 1, 1, 1, 1,
-1.257932, -0.02390285, -0.6642377, 1, 1, 1, 1, 1,
-1.254593, -0.1008152, -1.360207, 1, 1, 1, 1, 1,
-1.253373, -0.8275588, -1.699085, 0, 0, 1, 1, 1,
-1.244935, -0.193235, -2.00046, 1, 0, 0, 1, 1,
-1.242306, -1.130963, -2.665942, 1, 0, 0, 1, 1,
-1.238946, -0.6190566, -1.867386, 1, 0, 0, 1, 1,
-1.23511, 1.035147, -1.801998, 1, 0, 0, 1, 1,
-1.234388, 0.343863, -0.4634838, 1, 0, 0, 1, 1,
-1.221879, -0.4543146, -2.808648, 0, 0, 0, 1, 1,
-1.221155, -0.6402518, -2.890998, 0, 0, 0, 1, 1,
-1.21872, -1.722928, -1.655836, 0, 0, 0, 1, 1,
-1.210225, 1.232524, -2.144632, 0, 0, 0, 1, 1,
-1.210199, -2.245141, -3.734933, 0, 0, 0, 1, 1,
-1.202111, -1.183871, -0.6882565, 0, 0, 0, 1, 1,
-1.198632, 0.4355024, -0.8898833, 0, 0, 0, 1, 1,
-1.164993, 0.8648228, -2.995867, 1, 1, 1, 1, 1,
-1.163679, -0.04800611, -0.7822869, 1, 1, 1, 1, 1,
-1.162037, 1.639925, -1.892692, 1, 1, 1, 1, 1,
-1.158607, -0.3596804, -2.001351, 1, 1, 1, 1, 1,
-1.157063, -0.9155103, -1.553079, 1, 1, 1, 1, 1,
-1.152057, 0.01172266, -1.617731, 1, 1, 1, 1, 1,
-1.14757, 1.177654, 0.376425, 1, 1, 1, 1, 1,
-1.147204, 1.297853, -0.7243122, 1, 1, 1, 1, 1,
-1.144601, -1.376424, -3.626093, 1, 1, 1, 1, 1,
-1.143287, -0.5103674, 0.7847982, 1, 1, 1, 1, 1,
-1.137849, 0.03776975, -1.901574, 1, 1, 1, 1, 1,
-1.137081, -0.5137779, -2.273988, 1, 1, 1, 1, 1,
-1.13546, -2.63495, -2.320887, 1, 1, 1, 1, 1,
-1.117892, 0.2042395, -1.762653, 1, 1, 1, 1, 1,
-1.111547, -0.2168916, -1.90148, 1, 1, 1, 1, 1,
-1.107986, -0.7035299, -2.964805, 0, 0, 1, 1, 1,
-1.098074, 0.5677736, -1.683792, 1, 0, 0, 1, 1,
-1.097824, -2.242461, -2.129017, 1, 0, 0, 1, 1,
-1.097803, 1.121376, -0.4792987, 1, 0, 0, 1, 1,
-1.093217, -0.5194568, -3.128088, 1, 0, 0, 1, 1,
-1.091352, -1.075304, -0.5427539, 1, 0, 0, 1, 1,
-1.086204, -0.8027926, -3.6828, 0, 0, 0, 1, 1,
-1.082205, -2.004331, -1.456525, 0, 0, 0, 1, 1,
-1.081852, 1.754229, -0.4932707, 0, 0, 0, 1, 1,
-1.075946, 1.196819, -0.6700054, 0, 0, 0, 1, 1,
-1.069488, 0.1597047, -2.564823, 0, 0, 0, 1, 1,
-1.068142, 0.1016642, -0.006851987, 0, 0, 0, 1, 1,
-1.054725, 0.2397554, -0.8148354, 0, 0, 0, 1, 1,
-1.048314, -0.3851349, 0.369851, 1, 1, 1, 1, 1,
-1.048205, -0.5675146, -0.2564688, 1, 1, 1, 1, 1,
-1.044941, -1.1268, -0.6555294, 1, 1, 1, 1, 1,
-1.044922, 1.007924, -1.633072, 1, 1, 1, 1, 1,
-1.034845, -0.8450704, -3.497652, 1, 1, 1, 1, 1,
-1.032284, 0.4195702, -1.530036, 1, 1, 1, 1, 1,
-1.028625, -0.3017823, -0.1671304, 1, 1, 1, 1, 1,
-1.023627, 1.325056, -1.315926, 1, 1, 1, 1, 1,
-1.008784, 1.135777, -0.645173, 1, 1, 1, 1, 1,
-1.006569, 0.07825479, -0.5716264, 1, 1, 1, 1, 1,
-1.006557, -0.6632968, -2.303581, 1, 1, 1, 1, 1,
-0.9979556, 1.645277, 0.135089, 1, 1, 1, 1, 1,
-0.9963384, -0.7682766, -1.15564, 1, 1, 1, 1, 1,
-0.9959003, 1.372863, -0.5195885, 1, 1, 1, 1, 1,
-0.9798933, -1.42818, -3.00569, 1, 1, 1, 1, 1,
-0.9786912, 0.9684307, -2.382571, 0, 0, 1, 1, 1,
-0.978093, -0.06589869, -0.869082, 1, 0, 0, 1, 1,
-0.9523383, -0.04093415, -0.8050186, 1, 0, 0, 1, 1,
-0.9437171, 0.7890297, -3.189296, 1, 0, 0, 1, 1,
-0.9408574, 0.003327344, -2.254933, 1, 0, 0, 1, 1,
-0.940582, -0.234101, -1.244677, 1, 0, 0, 1, 1,
-0.9371403, 0.9062336, -2.191926, 0, 0, 0, 1, 1,
-0.9368841, -0.1414102, -2.327382, 0, 0, 0, 1, 1,
-0.9363333, -0.3430174, 0.3171092, 0, 0, 0, 1, 1,
-0.9334032, 0.3787154, 0.2552832, 0, 0, 0, 1, 1,
-0.9217471, 0.5463901, -1.374272, 0, 0, 0, 1, 1,
-0.9187785, 1.172858, -1.217272, 0, 0, 0, 1, 1,
-0.9184387, -0.6202838, -1.069694, 0, 0, 0, 1, 1,
-0.9167351, 1.291208, 0.9558848, 1, 1, 1, 1, 1,
-0.9049308, -0.9383498, -1.082992, 1, 1, 1, 1, 1,
-0.9004311, -0.03344013, -0.9020637, 1, 1, 1, 1, 1,
-0.8989852, -0.9954484, -2.847802, 1, 1, 1, 1, 1,
-0.8876148, -0.7232939, -2.030417, 1, 1, 1, 1, 1,
-0.8836513, -1.608062, -1.015025, 1, 1, 1, 1, 1,
-0.8802705, -0.3395668, -3.926279, 1, 1, 1, 1, 1,
-0.8794703, 0.4423129, -0.7426494, 1, 1, 1, 1, 1,
-0.8785393, 0.7965391, 0.2527819, 1, 1, 1, 1, 1,
-0.8733221, -1.297993, -2.143605, 1, 1, 1, 1, 1,
-0.8717918, 1.286835, -1.26106, 1, 1, 1, 1, 1,
-0.8716044, -0.07867635, -1.640124, 1, 1, 1, 1, 1,
-0.8715104, 0.2350519, -2.876091, 1, 1, 1, 1, 1,
-0.8693022, 1.773985, -1.4216, 1, 1, 1, 1, 1,
-0.866654, -0.1755767, -0.5711626, 1, 1, 1, 1, 1,
-0.8663498, -0.443054, -1.779613, 0, 0, 1, 1, 1,
-0.8662761, -1.387301, -3.583505, 1, 0, 0, 1, 1,
-0.8627101, 0.8716505, -1.863037, 1, 0, 0, 1, 1,
-0.8625799, 0.02995124, -3.493548, 1, 0, 0, 1, 1,
-0.8581824, -0.8455703, -2.273859, 1, 0, 0, 1, 1,
-0.8576994, 1.655426, -0.05319939, 1, 0, 0, 1, 1,
-0.8501755, -1.306727, -2.673779, 0, 0, 0, 1, 1,
-0.8485588, -0.1883816, -1.551817, 0, 0, 0, 1, 1,
-0.8470802, 0.4096783, -1.087834, 0, 0, 0, 1, 1,
-0.8463662, 1.913452, -0.09231987, 0, 0, 0, 1, 1,
-0.8431545, 0.5050652, 0.7238421, 0, 0, 0, 1, 1,
-0.8424591, 0.572978, -1.159099, 0, 0, 0, 1, 1,
-0.8378749, -0.5648333, -2.51847, 0, 0, 0, 1, 1,
-0.835566, 0.07684862, -0.507446, 1, 1, 1, 1, 1,
-0.83495, 0.8352128, -0.8850226, 1, 1, 1, 1, 1,
-0.8325859, -0.9930446, -2.585694, 1, 1, 1, 1, 1,
-0.8313983, -0.01854116, -2.378783, 1, 1, 1, 1, 1,
-0.8292802, -1.607851, -2.15791, 1, 1, 1, 1, 1,
-0.8269895, -0.4217302, -2.06582, 1, 1, 1, 1, 1,
-0.8264598, -0.7004291, -2.443445, 1, 1, 1, 1, 1,
-0.8211048, 0.7463115, -1.044269, 1, 1, 1, 1, 1,
-0.8171668, 0.8862973, -2.431018, 1, 1, 1, 1, 1,
-0.8152896, -0.5095356, -2.314636, 1, 1, 1, 1, 1,
-0.8151485, -0.4468788, -3.696147, 1, 1, 1, 1, 1,
-0.8110306, 0.08786845, -0.04890676, 1, 1, 1, 1, 1,
-0.8085752, -0.8785003, -2.623085, 1, 1, 1, 1, 1,
-0.8042001, -0.3071501, -0.6491489, 1, 1, 1, 1, 1,
-0.7939689, 0.7286268, -2.102172, 1, 1, 1, 1, 1,
-0.7936022, -1.593101, -3.218257, 0, 0, 1, 1, 1,
-0.7924712, -0.03761606, -1.484558, 1, 0, 0, 1, 1,
-0.7891913, 0.6188363, -0.3624493, 1, 0, 0, 1, 1,
-0.7879732, -0.7930877, -2.027644, 1, 0, 0, 1, 1,
-0.7876658, 0.2211115, -2.434299, 1, 0, 0, 1, 1,
-0.7751679, -0.09190256, -2.595146, 1, 0, 0, 1, 1,
-0.7671976, -0.05081595, -1.812856, 0, 0, 0, 1, 1,
-0.7670469, -0.213791, -3.849729, 0, 0, 0, 1, 1,
-0.7659197, -0.1608661, -3.731524, 0, 0, 0, 1, 1,
-0.7587039, 1.129509, -0.02358422, 0, 0, 0, 1, 1,
-0.7583911, 1.007864, -0.3976072, 0, 0, 0, 1, 1,
-0.757883, -0.3990725, -3.126689, 0, 0, 0, 1, 1,
-0.748074, 0.1464558, -1.776527, 0, 0, 0, 1, 1,
-0.7433077, 0.04450896, -1.94541, 1, 1, 1, 1, 1,
-0.7381951, 1.21575, -1.653589, 1, 1, 1, 1, 1,
-0.7372799, 0.3425591, -0.9675733, 1, 1, 1, 1, 1,
-0.7350281, -0.612036, -0.3414668, 1, 1, 1, 1, 1,
-0.7310661, 0.4971438, -1.782041, 1, 1, 1, 1, 1,
-0.7203584, -2.114421, -2.063903, 1, 1, 1, 1, 1,
-0.7130272, -0.09330356, -1.358878, 1, 1, 1, 1, 1,
-0.712794, 1.352061, 0.1139838, 1, 1, 1, 1, 1,
-0.712739, -0.8211023, -3.055437, 1, 1, 1, 1, 1,
-0.7125111, -1.14016, -4.359133, 1, 1, 1, 1, 1,
-0.7123715, -0.7122383, -1.379648, 1, 1, 1, 1, 1,
-0.7104478, 1.833944, 0.1049869, 1, 1, 1, 1, 1,
-0.7085219, -0.7381151, -0.975797, 1, 1, 1, 1, 1,
-0.7030197, 1.590132, -0.9792597, 1, 1, 1, 1, 1,
-0.6971673, -1.076805, -4.15965, 1, 1, 1, 1, 1,
-0.6943593, -0.3365371, -2.287243, 0, 0, 1, 1, 1,
-0.692993, -0.4097517, -2.506371, 1, 0, 0, 1, 1,
-0.6907864, -0.5005299, -2.697276, 1, 0, 0, 1, 1,
-0.6882873, 0.6170403, 0.9694754, 1, 0, 0, 1, 1,
-0.6844379, -0.5526322, -1.09115, 1, 0, 0, 1, 1,
-0.6843337, 0.7082244, -1.49025, 1, 0, 0, 1, 1,
-0.6834368, 0.7191499, -1.348134, 0, 0, 0, 1, 1,
-0.6800485, -0.7720445, -2.680597, 0, 0, 0, 1, 1,
-0.6760978, 0.2869744, 0.02493703, 0, 0, 0, 1, 1,
-0.6628512, -0.04115723, -1.852887, 0, 0, 0, 1, 1,
-0.6614512, -0.9617195, -3.109484, 0, 0, 0, 1, 1,
-0.6568875, 0.06414992, -1.994491, 0, 0, 0, 1, 1,
-0.6484101, 1.043326, -1.530896, 0, 0, 0, 1, 1,
-0.6430004, 1.092495, -0.5199127, 1, 1, 1, 1, 1,
-0.6419229, 0.5259974, 0.6630869, 1, 1, 1, 1, 1,
-0.6412492, -0.6473457, -1.73758, 1, 1, 1, 1, 1,
-0.6407077, -1.528889, -2.075443, 1, 1, 1, 1, 1,
-0.6313722, -1.751521, -2.803583, 1, 1, 1, 1, 1,
-0.6266257, -0.3125201, -1.067338, 1, 1, 1, 1, 1,
-0.6243201, -0.8627917, -1.860727, 1, 1, 1, 1, 1,
-0.6234682, 0.3355143, -0.2238633, 1, 1, 1, 1, 1,
-0.6200293, -0.09274472, -0.4078864, 1, 1, 1, 1, 1,
-0.6196904, 2.126029, 1.589475, 1, 1, 1, 1, 1,
-0.6172093, 0.9272581, -1.82206, 1, 1, 1, 1, 1,
-0.616619, 1.305238, -0.1222328, 1, 1, 1, 1, 1,
-0.6158417, -2.17616, -1.928535, 1, 1, 1, 1, 1,
-0.6139169, 0.2092522, -2.699456, 1, 1, 1, 1, 1,
-0.6071653, 1.210981, -0.5448529, 1, 1, 1, 1, 1,
-0.6065855, -1.239559, -3.613597, 0, 0, 1, 1, 1,
-0.6051268, -0.6055671, -2.526208, 1, 0, 0, 1, 1,
-0.6008574, 0.4973132, -1.141068, 1, 0, 0, 1, 1,
-0.5990767, -0.6370674, -1.305209, 1, 0, 0, 1, 1,
-0.5980085, 0.01166276, -3.747053, 1, 0, 0, 1, 1,
-0.5952253, 0.2884758, 0.7974676, 1, 0, 0, 1, 1,
-0.592945, -0.318349, -3.123891, 0, 0, 0, 1, 1,
-0.5927998, -0.5696985, -2.282128, 0, 0, 0, 1, 1,
-0.5898546, -0.5016468, -1.005031, 0, 0, 0, 1, 1,
-0.5844316, 0.353015, -0.1773771, 0, 0, 0, 1, 1,
-0.5786377, 1.710948, 0.6273252, 0, 0, 0, 1, 1,
-0.5778635, -0.3539443, 0.3909605, 0, 0, 0, 1, 1,
-0.5764396, -0.5080277, -1.252004, 0, 0, 0, 1, 1,
-0.5758958, 1.340846, 0.9979278, 1, 1, 1, 1, 1,
-0.5724872, -0.3365757, -3.539428, 1, 1, 1, 1, 1,
-0.570238, -0.2791491, -2.648082, 1, 1, 1, 1, 1,
-0.5695993, 0.5124931, -2.04007, 1, 1, 1, 1, 1,
-0.5662398, -0.6146805, -3.276842, 1, 1, 1, 1, 1,
-0.5650783, -1.913446, -3.040579, 1, 1, 1, 1, 1,
-0.5633139, 1.140513, 0.2790664, 1, 1, 1, 1, 1,
-0.5604634, 0.02783961, -2.965675, 1, 1, 1, 1, 1,
-0.5596011, -0.6098536, -2.70611, 1, 1, 1, 1, 1,
-0.5563293, -1.169724, -4.200828, 1, 1, 1, 1, 1,
-0.555519, 0.8803046, -0.9303204, 1, 1, 1, 1, 1,
-0.5540616, -0.0259392, -2.186263, 1, 1, 1, 1, 1,
-0.5535793, 0.6478612, -0.6546323, 1, 1, 1, 1, 1,
-0.5514106, 0.1717957, -1.991401, 1, 1, 1, 1, 1,
-0.5487224, 0.4450738, -2.563419, 1, 1, 1, 1, 1,
-0.547911, 1.526061, -0.9654447, 0, 0, 1, 1, 1,
-0.5477209, -1.172196, -3.717404, 1, 0, 0, 1, 1,
-0.5471968, 0.2409881, -2.904971, 1, 0, 0, 1, 1,
-0.5463473, 1.149476, -1.563542, 1, 0, 0, 1, 1,
-0.5437854, 0.1488578, -1.888731, 1, 0, 0, 1, 1,
-0.5435287, 1.518287, -1.119407, 1, 0, 0, 1, 1,
-0.542968, 0.7812142, 0.6166229, 0, 0, 0, 1, 1,
-0.5423973, -1.875276, -2.578596, 0, 0, 0, 1, 1,
-0.5401917, 0.6550488, -0.4733036, 0, 0, 0, 1, 1,
-0.5372318, -0.01598527, -0.9540197, 0, 0, 0, 1, 1,
-0.536237, 0.09514346, -2.726542, 0, 0, 0, 1, 1,
-0.5301039, 1.240192, 0.2004807, 0, 0, 0, 1, 1,
-0.529075, -1.288774, -2.237698, 0, 0, 0, 1, 1,
-0.5277336, -0.7038686, -3.235548, 1, 1, 1, 1, 1,
-0.5263003, -0.3005601, -3.646086, 1, 1, 1, 1, 1,
-0.5202433, -2.672744, -3.463349, 1, 1, 1, 1, 1,
-0.5197857, 1.636248, -0.9085703, 1, 1, 1, 1, 1,
-0.5100433, -1.445772, -3.468859, 1, 1, 1, 1, 1,
-0.5049053, -0.3235523, -2.042891, 1, 1, 1, 1, 1,
-0.4911976, 0.7058139, 1.100041, 1, 1, 1, 1, 1,
-0.4854401, -0.5612156, -2.326835, 1, 1, 1, 1, 1,
-0.481832, -0.7059125, -2.046907, 1, 1, 1, 1, 1,
-0.4815862, -1.34545, -2.914211, 1, 1, 1, 1, 1,
-0.4794297, 0.1141671, -2.070065, 1, 1, 1, 1, 1,
-0.4755007, 1.016439, 0.349885, 1, 1, 1, 1, 1,
-0.4575243, -0.05527265, -2.051247, 1, 1, 1, 1, 1,
-0.4564168, -0.4263058, -2.181457, 1, 1, 1, 1, 1,
-0.4563598, -0.1270006, -3.889538, 1, 1, 1, 1, 1,
-0.4558514, 0.2863775, 0.2332288, 0, 0, 1, 1, 1,
-0.4519464, 0.9467964, -0.7186759, 1, 0, 0, 1, 1,
-0.4495743, 2.030465, 1.723971, 1, 0, 0, 1, 1,
-0.4486145, -0.2336457, -1.499317, 1, 0, 0, 1, 1,
-0.4476918, 2.501249, 0.590547, 1, 0, 0, 1, 1,
-0.4438625, 0.3817976, -1.260795, 1, 0, 0, 1, 1,
-0.4430249, -0.01475204, -2.451213, 0, 0, 0, 1, 1,
-0.4344579, -0.6915178, -2.173616, 0, 0, 0, 1, 1,
-0.43268, -0.312745, -2.125284, 0, 0, 0, 1, 1,
-0.4325304, -0.05594299, -1.819048, 0, 0, 0, 1, 1,
-0.4301764, -1.118545, -3.092886, 0, 0, 0, 1, 1,
-0.4256698, -0.6090574, -1.744779, 0, 0, 0, 1, 1,
-0.4249591, -0.4900225, -2.5229, 0, 0, 0, 1, 1,
-0.4223068, 0.9863492, -0.1669756, 1, 1, 1, 1, 1,
-0.4214964, -0.09683561, -1.586939, 1, 1, 1, 1, 1,
-0.4209736, -0.8518924, -3.500383, 1, 1, 1, 1, 1,
-0.4205733, -1.134215, -3.723498, 1, 1, 1, 1, 1,
-0.4203882, -0.6454587, -3.527217, 1, 1, 1, 1, 1,
-0.4162824, -0.1407916, -1.890412, 1, 1, 1, 1, 1,
-0.4157677, -0.9243588, -0.9654899, 1, 1, 1, 1, 1,
-0.4141387, 0.7235879, -0.817644, 1, 1, 1, 1, 1,
-0.4133999, 0.5649769, -0.7843916, 1, 1, 1, 1, 1,
-0.4126576, 0.8729524, -1.145062, 1, 1, 1, 1, 1,
-0.4125503, -0.623764, -4.279464, 1, 1, 1, 1, 1,
-0.4066915, 0.2577284, -0.6099204, 1, 1, 1, 1, 1,
-0.406682, 0.9395669, 0.06448751, 1, 1, 1, 1, 1,
-0.4041739, 0.09857286, -3.038347, 1, 1, 1, 1, 1,
-0.3986972, -0.1517987, -3.749639, 1, 1, 1, 1, 1,
-0.3975973, -0.05416372, -1.086611, 0, 0, 1, 1, 1,
-0.3971007, 0.306724, 1.507018, 1, 0, 0, 1, 1,
-0.3969047, -0.4905883, -2.376962, 1, 0, 0, 1, 1,
-0.3963599, 0.432121, -1.500916, 1, 0, 0, 1, 1,
-0.3947771, 0.03003967, -0.6560138, 1, 0, 0, 1, 1,
-0.3845468, 0.2841681, -0.5608632, 1, 0, 0, 1, 1,
-0.3833485, 0.3722754, -0.9002962, 0, 0, 0, 1, 1,
-0.3814338, 0.9479802, -1.608247, 0, 0, 0, 1, 1,
-0.3750915, 0.6251931, -0.8201777, 0, 0, 0, 1, 1,
-0.3724732, -1.086907, -4.485112, 0, 0, 0, 1, 1,
-0.3721859, -1.654787, -2.887018, 0, 0, 0, 1, 1,
-0.3638302, -1.301531, -3.892401, 0, 0, 0, 1, 1,
-0.3629285, -1.045993, -3.429454, 0, 0, 0, 1, 1,
-0.3620802, -1.571428, -3.064654, 1, 1, 1, 1, 1,
-0.3620385, 1.041445, 1.145501, 1, 1, 1, 1, 1,
-0.35895, -0.579688, -2.830319, 1, 1, 1, 1, 1,
-0.3578975, 0.2761568, 0.5783997, 1, 1, 1, 1, 1,
-0.3564708, 0.6734425, 0.6207235, 1, 1, 1, 1, 1,
-0.3507531, 0.2346975, -0.2827429, 1, 1, 1, 1, 1,
-0.3450478, 1.137679, 0.4499041, 1, 1, 1, 1, 1,
-0.3446507, -0.7253417, -2.37505, 1, 1, 1, 1, 1,
-0.3425073, -0.540466, -1.203807, 1, 1, 1, 1, 1,
-0.3411425, -0.3447489, -3.41169, 1, 1, 1, 1, 1,
-0.3349007, 0.4197176, -0.8299766, 1, 1, 1, 1, 1,
-0.3261992, 0.8977394, -1.065357, 1, 1, 1, 1, 1,
-0.3255964, 1.567347, -0.2766101, 1, 1, 1, 1, 1,
-0.3254676, -0.7831345, -3.199161, 1, 1, 1, 1, 1,
-0.3227372, -1.032832, -1.684155, 1, 1, 1, 1, 1,
-0.3097664, 0.08355696, 1.356797, 0, 0, 1, 1, 1,
-0.3094162, -0.5537854, -1.772183, 1, 0, 0, 1, 1,
-0.3092896, -0.1313925, -0.7650948, 1, 0, 0, 1, 1,
-0.300005, 1.167512, -0.5816083, 1, 0, 0, 1, 1,
-0.2996179, 0.125107, 0.1171464, 1, 0, 0, 1, 1,
-0.2909411, 0.4445007, -1.150905, 1, 0, 0, 1, 1,
-0.2884387, -0.0326778, -2.303074, 0, 0, 0, 1, 1,
-0.2876337, 1.100567, -0.4663157, 0, 0, 0, 1, 1,
-0.2823887, 0.3095995, -0.6482854, 0, 0, 0, 1, 1,
-0.2817671, -1.440324, -2.07519, 0, 0, 0, 1, 1,
-0.2787379, 0.6507301, -1.135138, 0, 0, 0, 1, 1,
-0.2728159, 0.8167889, -2.419563, 0, 0, 0, 1, 1,
-0.2726509, 0.8009421, -0.08047614, 0, 0, 0, 1, 1,
-0.2667627, -1.527932, -4.267011, 1, 1, 1, 1, 1,
-0.2569086, 0.199534, -0.8604511, 1, 1, 1, 1, 1,
-0.2446614, 0.7483836, 0.2849956, 1, 1, 1, 1, 1,
-0.236368, -0.2874186, -2.126097, 1, 1, 1, 1, 1,
-0.2318893, 0.4717183, -0.2890391, 1, 1, 1, 1, 1,
-0.2308167, 0.05652557, -0.9140376, 1, 1, 1, 1, 1,
-0.2254908, 0.3386429, -0.7785305, 1, 1, 1, 1, 1,
-0.2238386, 1.506563, -0.06460266, 1, 1, 1, 1, 1,
-0.2228518, 1.005808, 0.4181909, 1, 1, 1, 1, 1,
-0.2222957, 1.111938, 0.7620653, 1, 1, 1, 1, 1,
-0.2196642, -1.543061, -3.16274, 1, 1, 1, 1, 1,
-0.2193894, -0.5899043, -2.308808, 1, 1, 1, 1, 1,
-0.2188178, -0.8275031, -2.875419, 1, 1, 1, 1, 1,
-0.2176373, -1.171453, -1.140878, 1, 1, 1, 1, 1,
-0.2174149, 0.4370661, -0.08559677, 1, 1, 1, 1, 1,
-0.2107512, 1.503744, 0.3179279, 0, 0, 1, 1, 1,
-0.2097961, 0.5458018, -0.9418772, 1, 0, 0, 1, 1,
-0.2096986, 0.2479726, 1.207209, 1, 0, 0, 1, 1,
-0.204814, 0.1287036, -0.1564706, 1, 0, 0, 1, 1,
-0.2018313, -1.584552, -4.497836, 1, 0, 0, 1, 1,
-0.2013947, -0.5403912, -3.263395, 1, 0, 0, 1, 1,
-0.1988489, -0.7594389, -2.10324, 0, 0, 0, 1, 1,
-0.1984539, -0.4126168, -4.278732, 0, 0, 0, 1, 1,
-0.1969826, -0.005024536, -1.818902, 0, 0, 0, 1, 1,
-0.1938027, 0.7109492, -1.244993, 0, 0, 0, 1, 1,
-0.1935148, -0.1377326, -1.842787, 0, 0, 0, 1, 1,
-0.1931342, -1.044068, -2.203913, 0, 0, 0, 1, 1,
-0.1909302, -0.5917333, -3.005627, 0, 0, 0, 1, 1,
-0.1908599, -0.2318728, -4.431964, 1, 1, 1, 1, 1,
-0.1874919, -1.308037, -2.92615, 1, 1, 1, 1, 1,
-0.1864126, -0.8574705, -2.206226, 1, 1, 1, 1, 1,
-0.184704, -0.9528561, -2.090108, 1, 1, 1, 1, 1,
-0.1837475, -0.05404699, -2.297236, 1, 1, 1, 1, 1,
-0.1822138, -1.243773, -3.074504, 1, 1, 1, 1, 1,
-0.1820968, 0.9759352, -1.985357, 1, 1, 1, 1, 1,
-0.1762283, -0.4420751, -2.008287, 1, 1, 1, 1, 1,
-0.1735049, -0.1703867, -4.486415, 1, 1, 1, 1, 1,
-0.1711384, 2.213602, 0.3452036, 1, 1, 1, 1, 1,
-0.1709014, 0.7333698, -1.698552, 1, 1, 1, 1, 1,
-0.1697133, 0.6447118, 1.69647, 1, 1, 1, 1, 1,
-0.169044, -1.032744, -1.897746, 1, 1, 1, 1, 1,
-0.1654941, -1.121122, -4.187266, 1, 1, 1, 1, 1,
-0.1654512, 0.5880497, -1.343944, 1, 1, 1, 1, 1,
-0.156673, -0.05085068, -1.490842, 0, 0, 1, 1, 1,
-0.1553493, 0.456055, -1.078143, 1, 0, 0, 1, 1,
-0.1545053, 1.127022, -1.64413, 1, 0, 0, 1, 1,
-0.1452334, 0.4237643, -0.1756627, 1, 0, 0, 1, 1,
-0.1405868, 1.315861, -0.9551762, 1, 0, 0, 1, 1,
-0.1393343, -1.562367, -3.470163, 1, 0, 0, 1, 1,
-0.1341409, 0.2234947, 0.5945051, 0, 0, 0, 1, 1,
-0.1296259, 1.816663, 1.962985, 0, 0, 0, 1, 1,
-0.1206408, 0.6115316, -0.3664362, 0, 0, 0, 1, 1,
-0.1205946, -0.3709443, -2.756117, 0, 0, 0, 1, 1,
-0.1189043, 0.88393, -0.4939704, 0, 0, 0, 1, 1,
-0.11838, -0.5502658, -3.770914, 0, 0, 0, 1, 1,
-0.1117068, -0.5764462, -2.012581, 0, 0, 0, 1, 1,
-0.111231, -0.4764645, -2.081625, 1, 1, 1, 1, 1,
-0.109185, -1.619731, -2.62723, 1, 1, 1, 1, 1,
-0.1085493, -0.8647653, -3.072935, 1, 1, 1, 1, 1,
-0.1061705, 0.335418, -0.9069787, 1, 1, 1, 1, 1,
-0.09554879, 1.700326, -0.3355369, 1, 1, 1, 1, 1,
-0.09363967, -0.5743569, -2.772462, 1, 1, 1, 1, 1,
-0.09274317, 0.5415231, -1.599874, 1, 1, 1, 1, 1,
-0.09163491, 2.280905, -0.9064644, 1, 1, 1, 1, 1,
-0.09006821, 1.65681, 0.6444494, 1, 1, 1, 1, 1,
-0.08915981, 0.4436156, 2.108172, 1, 1, 1, 1, 1,
-0.08648249, 0.8482553, -0.9648855, 1, 1, 1, 1, 1,
-0.08268937, -0.2312155, -3.137306, 1, 1, 1, 1, 1,
-0.08230076, -0.5838262, -1.883417, 1, 1, 1, 1, 1,
-0.0814511, -0.2285973, -4.360369, 1, 1, 1, 1, 1,
-0.0780338, -1.256066, -1.729562, 1, 1, 1, 1, 1,
-0.07725358, 0.3641616, -0.4703517, 0, 0, 1, 1, 1,
-0.07687376, -0.8550694, -3.251913, 1, 0, 0, 1, 1,
-0.07578516, 0.6368667, -0.535863, 1, 0, 0, 1, 1,
-0.07492314, -1.601413, -2.663821, 1, 0, 0, 1, 1,
-0.07246909, -0.1892384, -3.272793, 1, 0, 0, 1, 1,
-0.07134523, 0.285869, -1.410752, 1, 0, 0, 1, 1,
-0.06981009, 1.852547, 0.6434559, 0, 0, 0, 1, 1,
-0.06956311, -0.1280183, -4.26477, 0, 0, 0, 1, 1,
-0.06847627, 1.598655, 0.9806121, 0, 0, 0, 1, 1,
-0.06670637, 0.5291767, -1.264124, 0, 0, 0, 1, 1,
-0.0643913, 0.3402815, 0.07545719, 0, 0, 0, 1, 1,
-0.06314742, 1.500563, 0.6671674, 0, 0, 0, 1, 1,
-0.0628875, -0.269981, -3.515587, 0, 0, 0, 1, 1,
-0.06243413, 1.729195, -1.743479, 1, 1, 1, 1, 1,
-0.06172437, 0.7711587, -0.1576646, 1, 1, 1, 1, 1,
-0.06067893, 0.2213979, -1.101091, 1, 1, 1, 1, 1,
-0.06066391, 0.5033099, 0.6674953, 1, 1, 1, 1, 1,
-0.05462325, -0.009719585, -1.258214, 1, 1, 1, 1, 1,
-0.04502142, -0.8402073, -0.305672, 1, 1, 1, 1, 1,
-0.04304698, -1.080344, -4.508871, 1, 1, 1, 1, 1,
-0.04043626, 0.6758852, -0.7264923, 1, 1, 1, 1, 1,
-0.04011217, -0.1031007, -2.506626, 1, 1, 1, 1, 1,
-0.04006826, -0.7070504, -1.208587, 1, 1, 1, 1, 1,
-0.03919877, 0.2517315, 0.8518593, 1, 1, 1, 1, 1,
-0.03373226, 0.8656502, -0.1097183, 1, 1, 1, 1, 1,
-0.0314539, 0.3609836, -1.517821, 1, 1, 1, 1, 1,
-0.02646313, 0.2506773, 0.08714278, 1, 1, 1, 1, 1,
-0.02509273, -2.454459, -3.423766, 1, 1, 1, 1, 1,
-0.02191179, 0.7034597, 0.6958951, 0, 0, 1, 1, 1,
-0.02169102, -0.2182182, -5.188636, 1, 0, 0, 1, 1,
-0.02003341, -0.09224068, -0.7092711, 1, 0, 0, 1, 1,
-0.01976568, 0.7670529, 0.166058, 1, 0, 0, 1, 1,
-0.01709124, 1.740925, -0.5928228, 1, 0, 0, 1, 1,
-0.01218774, 1.907343, -2.575455, 1, 0, 0, 1, 1,
-0.01125736, 1.132663, -0.566807, 0, 0, 0, 1, 1,
-0.007785698, 0.4053313, -1.029699, 0, 0, 0, 1, 1,
-0.005443673, -0.9283891, -3.517721, 0, 0, 0, 1, 1,
-0.003824819, -2.121499, -2.635792, 0, 0, 0, 1, 1,
-0.001185309, -0.9762793, -3.342704, 0, 0, 0, 1, 1,
0.002053938, -0.309657, 3.241812, 0, 0, 0, 1, 1,
0.002233807, -0.1285132, 1.946769, 0, 0, 0, 1, 1,
0.002314731, -0.8404244, 2.262148, 1, 1, 1, 1, 1,
0.002543648, -0.9451553, 2.373579, 1, 1, 1, 1, 1,
0.008122331, 0.4491709, -1.200692, 1, 1, 1, 1, 1,
0.00962457, 1.773771, -0.2951021, 1, 1, 1, 1, 1,
0.009913111, 1.212956, 0.4324255, 1, 1, 1, 1, 1,
0.0101668, -0.08850367, 4.946672, 1, 1, 1, 1, 1,
0.01156487, 0.4022828, 1.240374, 1, 1, 1, 1, 1,
0.01167246, -1.613529, 3.364033, 1, 1, 1, 1, 1,
0.01269849, -0.6215501, 2.52132, 1, 1, 1, 1, 1,
0.01555849, 0.8526507, 1.335219, 1, 1, 1, 1, 1,
0.01578287, 1.241656, -1.397235, 1, 1, 1, 1, 1,
0.0236217, 0.4195261, 1.239686, 1, 1, 1, 1, 1,
0.02388079, -0.9801635, 2.259824, 1, 1, 1, 1, 1,
0.02634067, -0.2062904, 1.967082, 1, 1, 1, 1, 1,
0.02965616, -0.2361183, 2.919344, 1, 1, 1, 1, 1,
0.0361204, -0.8269414, 3.292759, 0, 0, 1, 1, 1,
0.03821237, -1.396436, 4.047719, 1, 0, 0, 1, 1,
0.03907775, 0.4140756, -0.1802695, 1, 0, 0, 1, 1,
0.0493699, 0.7694232, -0.187942, 1, 0, 0, 1, 1,
0.05099656, 1.801342, -0.8597938, 1, 0, 0, 1, 1,
0.05649114, -0.9642411, 3.165621, 1, 0, 0, 1, 1,
0.05784198, 0.2400832, 0.3014477, 0, 0, 0, 1, 1,
0.06304244, -0.6560552, 2.235086, 0, 0, 0, 1, 1,
0.06577595, -0.4063956, 4.008338, 0, 0, 0, 1, 1,
0.06979349, -0.8610369, 3.534417, 0, 0, 0, 1, 1,
0.07033284, 0.3809695, 1.449955, 0, 0, 0, 1, 1,
0.07485395, 0.515595, -0.2839456, 0, 0, 0, 1, 1,
0.07927519, 0.5625754, -0.9807457, 0, 0, 0, 1, 1,
0.07956453, 1.38256, 0.7644857, 1, 1, 1, 1, 1,
0.08246721, -1.120434, 4.260294, 1, 1, 1, 1, 1,
0.086018, 1.146392, 0.2563892, 1, 1, 1, 1, 1,
0.08695537, -0.9988635, 3.500778, 1, 1, 1, 1, 1,
0.08977358, -1.756968, 5.452496, 1, 1, 1, 1, 1,
0.09088017, -0.3436009, 4.057395, 1, 1, 1, 1, 1,
0.09200842, 0.736155, 0.4343306, 1, 1, 1, 1, 1,
0.0936185, -0.8646417, 3.567502, 1, 1, 1, 1, 1,
0.09703495, 1.433167, -0.1703102, 1, 1, 1, 1, 1,
0.09813114, 1.069177, 1.764813, 1, 1, 1, 1, 1,
0.10822, 3.234539, -0.01219679, 1, 1, 1, 1, 1,
0.1093258, -1.089839, 6.184982, 1, 1, 1, 1, 1,
0.1127031, 0.7806492, 2.913438, 1, 1, 1, 1, 1,
0.1189123, -0.6945394, 3.381049, 1, 1, 1, 1, 1,
0.1190232, -1.907488, 4.999184, 1, 1, 1, 1, 1,
0.122356, 1.884602, -0.2577238, 0, 0, 1, 1, 1,
0.1265149, -0.2644942, 1.157291, 1, 0, 0, 1, 1,
0.129109, -0.2898325, 2.413124, 1, 0, 0, 1, 1,
0.1313201, 0.01452063, 1.750297, 1, 0, 0, 1, 1,
0.1325226, 0.9362338, 0.1170224, 1, 0, 0, 1, 1,
0.135002, 0.6565979, -0.1596897, 1, 0, 0, 1, 1,
0.1416018, 0.5092566, -0.3330197, 0, 0, 0, 1, 1,
0.1416895, -0.8861019, 2.436261, 0, 0, 0, 1, 1,
0.1423575, 0.942344, 1.294321, 0, 0, 0, 1, 1,
0.1444462, 2.258143, -2.075784, 0, 0, 0, 1, 1,
0.149755, -0.1729492, 2.529006, 0, 0, 0, 1, 1,
0.1525113, 0.7776194, -0.2137803, 0, 0, 0, 1, 1,
0.1563819, -0.1942687, 4.430541, 0, 0, 0, 1, 1,
0.1565175, 1.353084, -0.3664851, 1, 1, 1, 1, 1,
0.1577988, -1.368729, 2.51334, 1, 1, 1, 1, 1,
0.1605203, -0.6658565, 1.860519, 1, 1, 1, 1, 1,
0.1618114, -0.7861423, 5.806734, 1, 1, 1, 1, 1,
0.1618903, 0.8514232, -0.008969816, 1, 1, 1, 1, 1,
0.1625953, 0.9965605, 0.5591128, 1, 1, 1, 1, 1,
0.1632424, -0.9189608, 3.420926, 1, 1, 1, 1, 1,
0.163375, -0.2992725, 2.723265, 1, 1, 1, 1, 1,
0.1704244, 0.2202355, 1.376642, 1, 1, 1, 1, 1,
0.1751317, -1.794476, 3.832482, 1, 1, 1, 1, 1,
0.1767002, 0.02605229, 1.616505, 1, 1, 1, 1, 1,
0.1808488, -1.695604, 3.556837, 1, 1, 1, 1, 1,
0.1820195, 0.8444719, -0.2228343, 1, 1, 1, 1, 1,
0.1822869, -1.213365, 2.219072, 1, 1, 1, 1, 1,
0.1853383, -0.7737895, 3.172048, 1, 1, 1, 1, 1,
0.1916033, 2.652664, 0.2967671, 0, 0, 1, 1, 1,
0.1939579, 0.1355286, 1.420971, 1, 0, 0, 1, 1,
0.1957293, 0.1271371, 1.026807, 1, 0, 0, 1, 1,
0.1966944, -0.8176305, 1.908572, 1, 0, 0, 1, 1,
0.1991457, -0.7333671, 2.309196, 1, 0, 0, 1, 1,
0.2013016, 0.211338, 0.564577, 1, 0, 0, 1, 1,
0.2037999, 1.425868, 0.4614594, 0, 0, 0, 1, 1,
0.2075137, 0.9857392, -0.8650175, 0, 0, 0, 1, 1,
0.2154571, 1.488938, -0.01004577, 0, 0, 0, 1, 1,
0.2273529, -0.9278134, 2.583332, 0, 0, 0, 1, 1,
0.2275448, 0.8081698, 0.9255704, 0, 0, 0, 1, 1,
0.2304005, 0.04706361, 1.369504, 0, 0, 0, 1, 1,
0.2331433, -0.09328034, 1.681445, 0, 0, 0, 1, 1,
0.2331663, -0.1118271, 2.074971, 1, 1, 1, 1, 1,
0.2353353, 0.194956, 0.2939372, 1, 1, 1, 1, 1,
0.2363394, 0.4363433, 1.462067, 1, 1, 1, 1, 1,
0.2396429, -0.04157145, 2.079817, 1, 1, 1, 1, 1,
0.2468329, -0.4023756, 1.372276, 1, 1, 1, 1, 1,
0.2478608, -0.05887515, 2.493042, 1, 1, 1, 1, 1,
0.2481131, -1.04572, 1.679542, 1, 1, 1, 1, 1,
0.2495129, 0.9701388, -0.740663, 1, 1, 1, 1, 1,
0.2584661, -3.038471, 2.766084, 1, 1, 1, 1, 1,
0.2612968, -1.033928, 0.1481788, 1, 1, 1, 1, 1,
0.2635241, -0.2843012, 2.046796, 1, 1, 1, 1, 1,
0.2643221, -0.1641467, 2.108619, 1, 1, 1, 1, 1,
0.2650217, 0.264506, 0.6378272, 1, 1, 1, 1, 1,
0.2680829, 0.4801202, -0.1675119, 1, 1, 1, 1, 1,
0.2682152, 0.9219393, 1.634595, 1, 1, 1, 1, 1,
0.2746405, -0.2578923, 2.942032, 0, 0, 1, 1, 1,
0.2782341, -0.6970354, 3.6857, 1, 0, 0, 1, 1,
0.2826008, 0.07130169, 2.251056, 1, 0, 0, 1, 1,
0.2892189, -0.2670959, 3.006811, 1, 0, 0, 1, 1,
0.2899978, 1.435087, 1.803515, 1, 0, 0, 1, 1,
0.2912408, 0.8718848, -0.04961585, 1, 0, 0, 1, 1,
0.3018329, 0.3627108, -0.1934789, 0, 0, 0, 1, 1,
0.3038474, -1.464259, 4.49838, 0, 0, 0, 1, 1,
0.304497, 2.608192, -0.7604364, 0, 0, 0, 1, 1,
0.3044997, -1.842517, 4.625575, 0, 0, 0, 1, 1,
0.3053307, -0.09816789, 0.8888662, 0, 0, 0, 1, 1,
0.3101271, 0.5700253, 0.2386999, 0, 0, 0, 1, 1,
0.3108539, -1.043219, 1.536602, 0, 0, 0, 1, 1,
0.3198192, 1.451628, 0.003381555, 1, 1, 1, 1, 1,
0.3256806, 0.7654914, 2.31249, 1, 1, 1, 1, 1,
0.3270179, -0.4385583, 2.448361, 1, 1, 1, 1, 1,
0.327943, -1.528826, 2.87127, 1, 1, 1, 1, 1,
0.3337387, -1.110185, 5.193385, 1, 1, 1, 1, 1,
0.3346951, 0.7309399, 0.01556956, 1, 1, 1, 1, 1,
0.3421789, -0.9471492, 2.958713, 1, 1, 1, 1, 1,
0.3429712, 0.06330968, 1.751174, 1, 1, 1, 1, 1,
0.3461055, -0.9847206, 1.319861, 1, 1, 1, 1, 1,
0.3481371, 0.8855565, 1.301662, 1, 1, 1, 1, 1,
0.348303, 1.333575, -0.2294995, 1, 1, 1, 1, 1,
0.3487536, -0.01952103, 1.204624, 1, 1, 1, 1, 1,
0.3507707, -0.4764852, 3.000761, 1, 1, 1, 1, 1,
0.3548542, -0.1818563, 2.118588, 1, 1, 1, 1, 1,
0.35849, -0.2580322, 1.494032, 1, 1, 1, 1, 1,
0.3631118, -1.095562, 3.580343, 0, 0, 1, 1, 1,
0.3642365, 1.936348, 0.1690883, 1, 0, 0, 1, 1,
0.3654576, -0.9964413, 2.577701, 1, 0, 0, 1, 1,
0.3656131, 0.4932674, 0.1381105, 1, 0, 0, 1, 1,
0.3661148, 0.9892696, -0.6323947, 1, 0, 0, 1, 1,
0.3661823, 0.2818279, 2.065611, 1, 0, 0, 1, 1,
0.3681299, 0.7642806, 0.2940938, 0, 0, 0, 1, 1,
0.3764842, -1.018165, 2.97111, 0, 0, 0, 1, 1,
0.3783851, 0.138656, 0.4296066, 0, 0, 0, 1, 1,
0.3824607, -2.050021, 3.490821, 0, 0, 0, 1, 1,
0.3831106, 0.124573, 1.052934, 0, 0, 0, 1, 1,
0.3846249, 0.5499247, 0.9585189, 0, 0, 0, 1, 1,
0.3881463, 0.3205101, 0.6524363, 0, 0, 0, 1, 1,
0.3983269, -0.1917917, 1.408545, 1, 1, 1, 1, 1,
0.4010198, 0.9605066, 0.6236437, 1, 1, 1, 1, 1,
0.4076645, 1.668924, -1.133691, 1, 1, 1, 1, 1,
0.4079088, -0.5185065, 2.495334, 1, 1, 1, 1, 1,
0.4124807, 0.7716457, 1.530301, 1, 1, 1, 1, 1,
0.4142262, -1.113813, 2.696361, 1, 1, 1, 1, 1,
0.4162546, -0.9968449, 3.762926, 1, 1, 1, 1, 1,
0.4162586, -1.137629, 2.6762, 1, 1, 1, 1, 1,
0.4235032, 0.1221339, 0.3084651, 1, 1, 1, 1, 1,
0.4269703, -0.4871521, 2.326272, 1, 1, 1, 1, 1,
0.4278539, 0.04827417, 1.512847, 1, 1, 1, 1, 1,
0.4295634, 1.17653, 1.004023, 1, 1, 1, 1, 1,
0.4314359, 0.2522005, 0.9958293, 1, 1, 1, 1, 1,
0.43184, -0.07683979, 1.942907, 1, 1, 1, 1, 1,
0.4326966, -0.7224634, 1.979706, 1, 1, 1, 1, 1,
0.4335962, 0.6868219, 0.1811438, 0, 0, 1, 1, 1,
0.4340838, 0.173934, 1.523296, 1, 0, 0, 1, 1,
0.4356974, -1.348091, 2.542482, 1, 0, 0, 1, 1,
0.4401374, -0.02697268, -1.099524, 1, 0, 0, 1, 1,
0.4401408, 0.7905072, 1.790873, 1, 0, 0, 1, 1,
0.4405005, 0.8096194, 0.3877529, 1, 0, 0, 1, 1,
0.4428285, 0.2657306, 1.370861, 0, 0, 0, 1, 1,
0.4443911, -1.010708, 2.339063, 0, 0, 0, 1, 1,
0.4444433, -0.8096943, 3.141341, 0, 0, 0, 1, 1,
0.4497062, 0.3851497, 1.574399, 0, 0, 0, 1, 1,
0.4498827, -0.4332996, 2.459805, 0, 0, 0, 1, 1,
0.4503894, 0.3207155, 1.467341, 0, 0, 0, 1, 1,
0.4504231, 0.6205722, -0.9990113, 0, 0, 0, 1, 1,
0.4551034, 1.272579, 0.1010987, 1, 1, 1, 1, 1,
0.4593509, -0.781258, 4.204319, 1, 1, 1, 1, 1,
0.4625147, -0.7319604, 1.345394, 1, 1, 1, 1, 1,
0.46478, -1.430453, 2.161245, 1, 1, 1, 1, 1,
0.4654044, 0.01272572, 2.086186, 1, 1, 1, 1, 1,
0.4668237, 0.7188414, 0.4591664, 1, 1, 1, 1, 1,
0.4771949, -0.5369205, 1.710908, 1, 1, 1, 1, 1,
0.4822372, 0.7958161, 0.2961153, 1, 1, 1, 1, 1,
0.482828, 0.3239068, -1.420547, 1, 1, 1, 1, 1,
0.4838236, 0.8074954, -1.717658, 1, 1, 1, 1, 1,
0.4902973, -1.442206, 1.600126, 1, 1, 1, 1, 1,
0.4911061, -0.7069986, 1.95942, 1, 1, 1, 1, 1,
0.4950331, 0.4784198, 0.6587593, 1, 1, 1, 1, 1,
0.4977607, 0.3677992, 3.092796, 1, 1, 1, 1, 1,
0.5021256, 0.1730542, 0.7683152, 1, 1, 1, 1, 1,
0.5047634, -0.5769444, 3.289678, 0, 0, 1, 1, 1,
0.5060329, -0.2627863, 1.15845, 1, 0, 0, 1, 1,
0.5142777, 0.09177446, 0.483208, 1, 0, 0, 1, 1,
0.5178655, -1.464208, 2.158816, 1, 0, 0, 1, 1,
0.5208513, -0.3706118, 1.268262, 1, 0, 0, 1, 1,
0.5244876, -0.498686, 2.344644, 1, 0, 0, 1, 1,
0.5305161, -0.9055907, 4.708619, 0, 0, 0, 1, 1,
0.5314786, -1.161871, 4.111774, 0, 0, 0, 1, 1,
0.5340914, -0.844821, 2.299104, 0, 0, 0, 1, 1,
0.5449215, -0.5183666, 2.847405, 0, 0, 0, 1, 1,
0.5486018, 0.4649602, 0.3817912, 0, 0, 0, 1, 1,
0.5522755, 1.713679, 3.499939, 0, 0, 0, 1, 1,
0.5553147, 0.009592175, 0.9963849, 0, 0, 0, 1, 1,
0.5574225, -0.8333147, 1.956777, 1, 1, 1, 1, 1,
0.5772663, 0.4232463, 0.8124437, 1, 1, 1, 1, 1,
0.5852679, 0.6465375, 1.959567, 1, 1, 1, 1, 1,
0.593829, 2.034481, 1.808406, 1, 1, 1, 1, 1,
0.5956771, 0.1798387, 1.099011, 1, 1, 1, 1, 1,
0.5988418, -0.3159903, 2.393433, 1, 1, 1, 1, 1,
0.5989392, 0.4403658, 1.473554, 1, 1, 1, 1, 1,
0.5994151, 1.240555, -0.3958062, 1, 1, 1, 1, 1,
0.6028682, -1.660576, 2.783395, 1, 1, 1, 1, 1,
0.6032562, 0.3816327, 2.226391, 1, 1, 1, 1, 1,
0.6056789, 0.2135001, 0.6727589, 1, 1, 1, 1, 1,
0.6097966, 0.3833924, 1.333788, 1, 1, 1, 1, 1,
0.6136277, 1.324898, 0.9204455, 1, 1, 1, 1, 1,
0.6141809, 0.3422247, 1.244847, 1, 1, 1, 1, 1,
0.6149457, 0.5567683, 2.57956, 1, 1, 1, 1, 1,
0.6171222, -0.2602081, 2.147397, 0, 0, 1, 1, 1,
0.6179903, -0.3513379, 5.104388, 1, 0, 0, 1, 1,
0.6184708, -1.190647, 0.6447001, 1, 0, 0, 1, 1,
0.6223107, 0.7821744, 1.529551, 1, 0, 0, 1, 1,
0.6276211, 0.6358508, -0.08198174, 1, 0, 0, 1, 1,
0.6277201, 0.994169, 1.656053, 1, 0, 0, 1, 1,
0.6306226, -0.646087, 1.367165, 0, 0, 0, 1, 1,
0.6360358, 0.05359494, 0.6137326, 0, 0, 0, 1, 1,
0.6370922, -0.9319262, 2.179523, 0, 0, 0, 1, 1,
0.6374518, 2.063199, 1.204205, 0, 0, 0, 1, 1,
0.6382911, -0.1919915, 2.218677, 0, 0, 0, 1, 1,
0.6396686, 1.440531, 0.2543685, 0, 0, 0, 1, 1,
0.6401284, 1.735995, -0.9646414, 0, 0, 0, 1, 1,
0.6408306, -1.72524, 2.898916, 1, 1, 1, 1, 1,
0.6423208, -0.7039507, 1.369534, 1, 1, 1, 1, 1,
0.647449, 0.5662465, 0.01721083, 1, 1, 1, 1, 1,
0.652364, 0.214061, -0.2826364, 1, 1, 1, 1, 1,
0.6539187, 0.1836339, 3.622706, 1, 1, 1, 1, 1,
0.655584, 0.4874612, 0.5365514, 1, 1, 1, 1, 1,
0.6570232, 0.9594489, 0.5236784, 1, 1, 1, 1, 1,
0.6599951, 0.3632895, 2.297644, 1, 1, 1, 1, 1,
0.6671229, 1.128171, -0.1876026, 1, 1, 1, 1, 1,
0.6696087, 2.068826, 0.4283915, 1, 1, 1, 1, 1,
0.6706027, -1.665883, 4.438606, 1, 1, 1, 1, 1,
0.6782438, -1.924504, 4.529754, 1, 1, 1, 1, 1,
0.6800929, -1.630345, 2.137269, 1, 1, 1, 1, 1,
0.6917381, 0.0784146, 0.05013545, 1, 1, 1, 1, 1,
0.6935314, -1.617295, 3.136725, 1, 1, 1, 1, 1,
0.6957456, 0.8284881, -0.4086129, 0, 0, 1, 1, 1,
0.7174402, 0.5611216, 1.701738, 1, 0, 0, 1, 1,
0.7188987, -1.244097, 2.565503, 1, 0, 0, 1, 1,
0.7228327, 0.3382957, 1.375406, 1, 0, 0, 1, 1,
0.7234145, -2.81441, 3.145119, 1, 0, 0, 1, 1,
0.7297257, 1.455282, 1.633539, 1, 0, 0, 1, 1,
0.7378899, -1.441579, 2.07606, 0, 0, 0, 1, 1,
0.7412471, -0.5754466, 1.634604, 0, 0, 0, 1, 1,
0.7457469, -0.339074, 2.310374, 0, 0, 0, 1, 1,
0.7558324, 1.341963, 0.8623008, 0, 0, 0, 1, 1,
0.7667938, 1.100903, 0.6907215, 0, 0, 0, 1, 1,
0.7713659, -0.7597803, 2.460232, 0, 0, 0, 1, 1,
0.771899, 0.1420462, 0.9289021, 0, 0, 0, 1, 1,
0.7722793, 0.2013497, 0.8101869, 1, 1, 1, 1, 1,
0.773444, 1.160762, 0.3879506, 1, 1, 1, 1, 1,
0.7771505, -1.644353, 2.200537, 1, 1, 1, 1, 1,
0.7873723, -1.717909, 2.182753, 1, 1, 1, 1, 1,
0.7893749, -0.4846541, 2.826391, 1, 1, 1, 1, 1,
0.7948616, 0.694231, 1.293212, 1, 1, 1, 1, 1,
0.7966371, -1.846739, 4.478651, 1, 1, 1, 1, 1,
0.8046008, 0.7040948, 2.199206, 1, 1, 1, 1, 1,
0.806325, 0.1001363, -0.1034334, 1, 1, 1, 1, 1,
0.8098366, -2.074357, 2.835876, 1, 1, 1, 1, 1,
0.811092, -0.7513279, 5.420729, 1, 1, 1, 1, 1,
0.8155833, -1.674145, 2.763085, 1, 1, 1, 1, 1,
0.8156779, 0.6315144, 3.127281, 1, 1, 1, 1, 1,
0.8199101, 0.2108107, 2.471849, 1, 1, 1, 1, 1,
0.8205864, -0.4143746, 2.362164, 1, 1, 1, 1, 1,
0.822417, 0.8970259, -0.9375159, 0, 0, 1, 1, 1,
0.8335361, 0.855476, 1.525535, 1, 0, 0, 1, 1,
0.8417566, 0.1315292, 2.788688, 1, 0, 0, 1, 1,
0.8444946, 0.7490811, 0.2018587, 1, 0, 0, 1, 1,
0.8461577, -0.4156892, 1.915087, 1, 0, 0, 1, 1,
0.8498925, -0.9677656, 3.529254, 1, 0, 0, 1, 1,
0.8511683, -0.3951558, 2.09173, 0, 0, 0, 1, 1,
0.8585543, -0.05691928, 0.8174576, 0, 0, 0, 1, 1,
0.8673562, 0.4270402, 2.339344, 0, 0, 0, 1, 1,
0.8674511, -1.883404, 2.326593, 0, 0, 0, 1, 1,
0.8701308, -1.664846, 0.8492904, 0, 0, 0, 1, 1,
0.8701315, 0.4524384, 0.1300855, 0, 0, 0, 1, 1,
0.8706414, 1.189713, 1.065059, 0, 0, 0, 1, 1,
0.8762072, 0.09493033, 2.549364, 1, 1, 1, 1, 1,
0.8857751, 0.6265382, -0.6644249, 1, 1, 1, 1, 1,
0.8881062, -0.3124402, 3.624538, 1, 1, 1, 1, 1,
0.8897628, 0.9231268, 0.5850335, 1, 1, 1, 1, 1,
0.8899544, -1.435573, 1.597744, 1, 1, 1, 1, 1,
0.8901268, -0.7141865, -0.1479314, 1, 1, 1, 1, 1,
0.8903195, 2.243286, 0.2345628, 1, 1, 1, 1, 1,
0.89671, 0.04765126, 1.351374, 1, 1, 1, 1, 1,
0.9026291, 0.7082205, 1.361826, 1, 1, 1, 1, 1,
0.9036543, 1.139019, 0.8220549, 1, 1, 1, 1, 1,
0.9146206, -1.419285, 2.76857, 1, 1, 1, 1, 1,
0.91818, -1.973025, 3.417488, 1, 1, 1, 1, 1,
0.9208388, -0.4370578, 2.771347, 1, 1, 1, 1, 1,
0.9262202, -0.3696641, 1.007713, 1, 1, 1, 1, 1,
0.9348791, -1.483298, 2.42173, 1, 1, 1, 1, 1,
0.9349042, -1.591107, 0.9866152, 0, 0, 1, 1, 1,
0.9391667, -1.043658, 3.758099, 1, 0, 0, 1, 1,
0.9396963, -2.067704, 1.968627, 1, 0, 0, 1, 1,
0.9426572, -1.459773, 1.780447, 1, 0, 0, 1, 1,
0.9451345, -0.9306941, 2.163145, 1, 0, 0, 1, 1,
0.9459347, -0.06829731, 2.562711, 1, 0, 0, 1, 1,
0.9505659, -1.808559, 0.6831124, 0, 0, 0, 1, 1,
0.9579264, -0.6721715, 1.01903, 0, 0, 0, 1, 1,
0.9582319, 0.1447388, 0.04236814, 0, 0, 0, 1, 1,
0.9662503, 0.3367176, -0.004934952, 0, 0, 0, 1, 1,
0.9677254, -0.843387, 2.007885, 0, 0, 0, 1, 1,
0.9758979, 0.9416555, 1.168136, 0, 0, 0, 1, 1,
0.9771827, -0.8255402, 1.415701, 0, 0, 0, 1, 1,
0.978108, -1.607556, 3.691264, 1, 1, 1, 1, 1,
0.9806206, -0.3468429, 2.732063, 1, 1, 1, 1, 1,
0.9894692, 0.5492828, 0.5570134, 1, 1, 1, 1, 1,
0.9918126, 2.310249, 0.04742549, 1, 1, 1, 1, 1,
0.9944813, -0.7880559, 0.5686682, 1, 1, 1, 1, 1,
0.9952003, 0.4077581, 1.480968, 1, 1, 1, 1, 1,
0.995918, 0.08369272, -0.2315452, 1, 1, 1, 1, 1,
0.9968171, -1.956774, 3.739371, 1, 1, 1, 1, 1,
0.9977671, 1.744602, -0.9128013, 1, 1, 1, 1, 1,
1.005363, 0.519461, -0.2407676, 1, 1, 1, 1, 1,
1.010339, 1.737635, 0.3569598, 1, 1, 1, 1, 1,
1.013488, 0.8612515, -0.3515376, 1, 1, 1, 1, 1,
1.018326, 1.139983, 1.574094, 1, 1, 1, 1, 1,
1.019455, -0.5843692, 0.8322961, 1, 1, 1, 1, 1,
1.027248, 0.7068766, 1.102938, 1, 1, 1, 1, 1,
1.027981, 0.8314657, 1.319202, 0, 0, 1, 1, 1,
1.035355, 1.483254, 1.934106, 1, 0, 0, 1, 1,
1.041132, -0.009534893, 1.078905, 1, 0, 0, 1, 1,
1.042146, -0.04148386, 1.108849, 1, 0, 0, 1, 1,
1.044687, 1.177991, 1.064902, 1, 0, 0, 1, 1,
1.054008, -0.513563, 3.094207, 1, 0, 0, 1, 1,
1.055272, -1.081274, 2.683831, 0, 0, 0, 1, 1,
1.0637, 1.613961, 1.512343, 0, 0, 0, 1, 1,
1.074945, -0.4171454, 2.901957, 0, 0, 0, 1, 1,
1.079084, -0.9604841, 3.893327, 0, 0, 0, 1, 1,
1.082841, -1.10589, 3.229936, 0, 0, 0, 1, 1,
1.082885, -0.045355, 0.9987549, 0, 0, 0, 1, 1,
1.083668, 0.1746265, 0.6258342, 0, 0, 0, 1, 1,
1.090538, -0.8546945, 1.776198, 1, 1, 1, 1, 1,
1.091971, -0.1065324, 2.55305, 1, 1, 1, 1, 1,
1.097543, -0.6946262, 3.004062, 1, 1, 1, 1, 1,
1.100529, 0.5904476, 0.4606756, 1, 1, 1, 1, 1,
1.101632, 0.7972727, 0.1225529, 1, 1, 1, 1, 1,
1.108544, -0.3481188, 3.351985, 1, 1, 1, 1, 1,
1.109238, -0.1963088, 1.829967, 1, 1, 1, 1, 1,
1.122007, 2.260428, -1.98271, 1, 1, 1, 1, 1,
1.126051, 0.9310296, -0.3969538, 1, 1, 1, 1, 1,
1.129514, -1.44165, 3.483537, 1, 1, 1, 1, 1,
1.135688, -0.8208357, 3.57957, 1, 1, 1, 1, 1,
1.136859, -0.3756241, 2.883653, 1, 1, 1, 1, 1,
1.144075, 0.6056869, 0.9042756, 1, 1, 1, 1, 1,
1.148427, -1.008524, 2.970984, 1, 1, 1, 1, 1,
1.149239, -0.5535987, 2.098139, 1, 1, 1, 1, 1,
1.151852, -1.647277, 2.351737, 0, 0, 1, 1, 1,
1.154115, 1.521685, 0.4854653, 1, 0, 0, 1, 1,
1.155893, 0.06962131, -0.1387523, 1, 0, 0, 1, 1,
1.156253, -1.868247, 1.821504, 1, 0, 0, 1, 1,
1.161125, 0.01533342, 1.605917, 1, 0, 0, 1, 1,
1.162818, -0.9995356, 3.227622, 1, 0, 0, 1, 1,
1.166385, 0.1561814, 0.9462248, 0, 0, 0, 1, 1,
1.17399, -1.880013, 3.946061, 0, 0, 0, 1, 1,
1.180472, 0.568469, 0.8661095, 0, 0, 0, 1, 1,
1.186898, -0.6519879, 1.632243, 0, 0, 0, 1, 1,
1.186934, -1.01856, 2.109589, 0, 0, 0, 1, 1,
1.187606, -0.1874269, 2.154797, 0, 0, 0, 1, 1,
1.188341, 0.0334156, 0.3758201, 0, 0, 0, 1, 1,
1.188449, 1.747226, -0.3635993, 1, 1, 1, 1, 1,
1.194794, 1.055688, 1.510284, 1, 1, 1, 1, 1,
1.200463, 0.3528745, 1.344263, 1, 1, 1, 1, 1,
1.214596, -0.431302, 2.939349, 1, 1, 1, 1, 1,
1.233478, 1.446723, 1.30456, 1, 1, 1, 1, 1,
1.243382, -0.05847239, 2.615473, 1, 1, 1, 1, 1,
1.244487, -1.059428, 1.275683, 1, 1, 1, 1, 1,
1.246756, 0.9662517, 1.405166, 1, 1, 1, 1, 1,
1.247235, -2.03137, 3.804418, 1, 1, 1, 1, 1,
1.266884, 0.04886319, 0.08122724, 1, 1, 1, 1, 1,
1.277209, -1.414059, 3.342754, 1, 1, 1, 1, 1,
1.277611, 1.160842, 0.1540232, 1, 1, 1, 1, 1,
1.278111, 0.6309847, 1.401589, 1, 1, 1, 1, 1,
1.278887, 0.3588029, 3.552876, 1, 1, 1, 1, 1,
1.283891, 1.038027, -0.5889692, 1, 1, 1, 1, 1,
1.287082, 0.7985971, 0.7367904, 0, 0, 1, 1, 1,
1.289425, 0.1665287, 2.511189, 1, 0, 0, 1, 1,
1.291689, 0.1416273, 1.656896, 1, 0, 0, 1, 1,
1.297744, -0.05692122, 2.029948, 1, 0, 0, 1, 1,
1.307782, -0.9492189, 1.445441, 1, 0, 0, 1, 1,
1.310381, -2.11059, 2.599544, 1, 0, 0, 1, 1,
1.311636, -0.1055742, 2.744343, 0, 0, 0, 1, 1,
1.325029, -0.841025, 3.073616, 0, 0, 0, 1, 1,
1.326371, 0.116291, 1.027814, 0, 0, 0, 1, 1,
1.327672, -1.045633, 2.703035, 0, 0, 0, 1, 1,
1.33445, 0.2714848, 1.148803, 0, 0, 0, 1, 1,
1.334707, -1.385071, 3.333572, 0, 0, 0, 1, 1,
1.340637, 0.7314644, 1.010899, 0, 0, 0, 1, 1,
1.348537, 0.5336914, 1.572259, 1, 1, 1, 1, 1,
1.351059, -0.8803, 1.802278, 1, 1, 1, 1, 1,
1.35148, 0.1581839, 2.258596, 1, 1, 1, 1, 1,
1.353265, -0.2125879, 3.231572, 1, 1, 1, 1, 1,
1.359074, 0.2629732, 0.466399, 1, 1, 1, 1, 1,
1.365961, -1.649203, 1.668102, 1, 1, 1, 1, 1,
1.370545, -1.244189, 1.472337, 1, 1, 1, 1, 1,
1.380776, 0.8104035, 1.294675, 1, 1, 1, 1, 1,
1.382111, 0.1926192, 0.9511822, 1, 1, 1, 1, 1,
1.386886, 1.056484, 0.6299127, 1, 1, 1, 1, 1,
1.389078, 0.1684157, 0.9761794, 1, 1, 1, 1, 1,
1.404949, -0.04915145, 0.9652804, 1, 1, 1, 1, 1,
1.405971, 1.338303, 0.8989264, 1, 1, 1, 1, 1,
1.411042, 1.220943, 0.9793648, 1, 1, 1, 1, 1,
1.411375, -0.2589919, 2.165109, 1, 1, 1, 1, 1,
1.413116, -0.5234144, 0.2236213, 0, 0, 1, 1, 1,
1.419527, 0.5501678, 1.18559, 1, 0, 0, 1, 1,
1.427223, -0.3897936, 3.278298, 1, 0, 0, 1, 1,
1.431492, -0.8841166, 3.336475, 1, 0, 0, 1, 1,
1.441129, 0.8061863, -0.8987278, 1, 0, 0, 1, 1,
1.459977, -1.501857, 3.116858, 1, 0, 0, 1, 1,
1.461696, 0.2162519, 1.747706, 0, 0, 0, 1, 1,
1.462554, 0.1607932, 0.8849926, 0, 0, 0, 1, 1,
1.468636, 0.6984022, 0.9537216, 0, 0, 0, 1, 1,
1.475557, 1.298272, 1.325733, 0, 0, 0, 1, 1,
1.477983, -0.6897242, 1.703194, 0, 0, 0, 1, 1,
1.497664, 1.370018, 0.9373648, 0, 0, 0, 1, 1,
1.503452, -2.047184, 2.908368, 0, 0, 0, 1, 1,
1.527597, -1.341709, 1.630274, 1, 1, 1, 1, 1,
1.532599, -1.313387, 3.743795, 1, 1, 1, 1, 1,
1.549732, 2.735821, -0.274537, 1, 1, 1, 1, 1,
1.551618, -1.007306, 2.078667, 1, 1, 1, 1, 1,
1.570217, -0.6303009, 1.705205, 1, 1, 1, 1, 1,
1.573889, -0.008298689, 1.641502, 1, 1, 1, 1, 1,
1.583301, 0.9236271, 1.880629, 1, 1, 1, 1, 1,
1.588178, -0.1353008, 2.447512, 1, 1, 1, 1, 1,
1.622447, 0.05959918, 1.978699, 1, 1, 1, 1, 1,
1.648619, -0.410596, 1.721936, 1, 1, 1, 1, 1,
1.656139, 1.215703, 1.138613, 1, 1, 1, 1, 1,
1.674688, -1.947406, 1.341689, 1, 1, 1, 1, 1,
1.681305, 1.070402, 1.035825, 1, 1, 1, 1, 1,
1.71642, -1.36521, 2.499439, 1, 1, 1, 1, 1,
1.719092, -0.5733008, -0.6907997, 1, 1, 1, 1, 1,
1.724158, -0.849345, 1.801625, 0, 0, 1, 1, 1,
1.764592, -0.08549669, 0.8642347, 1, 0, 0, 1, 1,
1.765469, 1.433756, -0.8805932, 1, 0, 0, 1, 1,
1.776626, 0.1758711, 1.013851, 1, 0, 0, 1, 1,
1.80333, -1.937173, 4.087945, 1, 0, 0, 1, 1,
1.803788, 1.742193, -0.8832029, 1, 0, 0, 1, 1,
1.812011, 0.4162683, 0.2081178, 0, 0, 0, 1, 1,
1.826005, -0.5886753, 1.597704, 0, 0, 0, 1, 1,
1.832148, 1.237799, 1.887525, 0, 0, 0, 1, 1,
1.835302, -1.534574, 3.766425, 0, 0, 0, 1, 1,
1.841633, -0.03604024, 0.7806122, 0, 0, 0, 1, 1,
1.8547, -1.04799, 1.285104, 0, 0, 0, 1, 1,
1.869588, -0.7820707, 2.549317, 0, 0, 0, 1, 1,
1.882384, 0.2620396, 1.515346, 1, 1, 1, 1, 1,
1.904145, 0.4627601, 0.6457188, 1, 1, 1, 1, 1,
1.906478, 0.5527347, 1.130126, 1, 1, 1, 1, 1,
1.921797, -0.281732, 2.438243, 1, 1, 1, 1, 1,
1.922544, -0.404792, 2.876208, 1, 1, 1, 1, 1,
1.928884, 0.6105782, 1.895715, 1, 1, 1, 1, 1,
1.95822, 0.4643932, 2.156346, 1, 1, 1, 1, 1,
1.958875, 0.09747095, 2.831898, 1, 1, 1, 1, 1,
1.95989, 0.3242067, 0.1811825, 1, 1, 1, 1, 1,
1.968983, -0.06040029, 0.4042598, 1, 1, 1, 1, 1,
1.982628, 0.2448245, 2.074572, 1, 1, 1, 1, 1,
1.988478, 0.08415778, 1.162447, 1, 1, 1, 1, 1,
2.024659, 0.5272646, 2.241654, 1, 1, 1, 1, 1,
2.0351, 1.521549, 0.5354865, 1, 1, 1, 1, 1,
2.04526, -0.1442717, 0.9946904, 1, 1, 1, 1, 1,
2.056221, 0.0812436, 0.9770568, 0, 0, 1, 1, 1,
2.072413, 0.3173665, 3.134518, 1, 0, 0, 1, 1,
2.094453, 0.4825779, 0.4793991, 1, 0, 0, 1, 1,
2.102862, -0.6606563, 1.500065, 1, 0, 0, 1, 1,
2.111396, 1.110109, 2.869263, 1, 0, 0, 1, 1,
2.139916, 1.065725, 0.5296875, 1, 0, 0, 1, 1,
2.142873, 0.4565799, 0.5315444, 0, 0, 0, 1, 1,
2.159192, -0.4357053, 2.999782, 0, 0, 0, 1, 1,
2.24033, -0.5725, 1.984985, 0, 0, 0, 1, 1,
2.272304, 0.2700659, 1.739599, 0, 0, 0, 1, 1,
2.284405, -1.073364, 1.41864, 0, 0, 0, 1, 1,
2.308979, -0.1804704, 2.755666, 0, 0, 0, 1, 1,
2.315202, -1.114289, 1.920467, 0, 0, 0, 1, 1,
2.331285, -0.328943, 1.893612, 1, 1, 1, 1, 1,
2.482617, 0.4160715, 0.4918771, 1, 1, 1, 1, 1,
2.712346, 0.3149386, 1.11767, 1, 1, 1, 1, 1,
2.721998, 1.152012, 1.622287, 1, 1, 1, 1, 1,
2.757696, -0.2417856, 1.408492, 1, 1, 1, 1, 1,
2.835018, -0.5520331, 0.6879626, 1, 1, 1, 1, 1,
3.102509, -0.9104208, 2.070806, 1, 1, 1, 1, 1
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
var radius = 9.733467;
var distance = 34.18839;
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
mvMatrix.translate( -0.04372239, -0.09803391, -0.498173 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.18839);
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
