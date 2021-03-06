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
-3.130392, 2.849455, -2.176521, 1, 0, 0, 1,
-2.919331, -1.339707, -1.642866, 1, 0.007843138, 0, 1,
-2.763167, 1.131948, 0.7787822, 1, 0.01176471, 0, 1,
-2.637403, -1.288179, -1.8345, 1, 0.01960784, 0, 1,
-2.544013, -1.627341, -3.614693, 1, 0.02352941, 0, 1,
-2.501018, -0.8696996, -3.085906, 1, 0.03137255, 0, 1,
-2.404464, 1.205137, 0.6824446, 1, 0.03529412, 0, 1,
-2.370252, 0.5928525, -2.233101, 1, 0.04313726, 0, 1,
-2.325958, -0.08779486, -2.039118, 1, 0.04705882, 0, 1,
-2.262045, 0.5037208, -2.234435, 1, 0.05490196, 0, 1,
-2.247663, -0.8691862, -0.997372, 1, 0.05882353, 0, 1,
-2.232929, 1.33612, -0.595898, 1, 0.06666667, 0, 1,
-2.215559, -0.05301979, -1.325989, 1, 0.07058824, 0, 1,
-2.199809, 0.433379, -1.287042, 1, 0.07843138, 0, 1,
-2.162484, 0.895193, 0.6851933, 1, 0.08235294, 0, 1,
-2.158858, -0.5590013, -2.18011, 1, 0.09019608, 0, 1,
-2.142039, 0.774961, -0.8386052, 1, 0.09411765, 0, 1,
-2.119349, -1.135902, -2.398605, 1, 0.1019608, 0, 1,
-2.106104, -0.4364678, -0.545441, 1, 0.1098039, 0, 1,
-2.077189, 0.1509504, -1.015448, 1, 0.1137255, 0, 1,
-2.058008, -1.049205, -2.141483, 1, 0.1215686, 0, 1,
-2.052273, -0.8124502, -2.859227, 1, 0.1254902, 0, 1,
-2.051068, 1.104003, -1.836913, 1, 0.1333333, 0, 1,
-1.993993, 1.613766, 0.3539222, 1, 0.1372549, 0, 1,
-1.992741, -1.223258, -1.972012, 1, 0.145098, 0, 1,
-1.977228, 0.4778036, -1.567572, 1, 0.1490196, 0, 1,
-1.972517, 0.6162522, -0.8312521, 1, 0.1568628, 0, 1,
-1.965646, 3.694514, -0.6102087, 1, 0.1607843, 0, 1,
-1.962836, 0.479276, 0.150611, 1, 0.1686275, 0, 1,
-1.960178, 0.02420691, -1.803831, 1, 0.172549, 0, 1,
-1.955803, -0.8400102, -1.633161, 1, 0.1803922, 0, 1,
-1.940098, 0.3996061, -1.115188, 1, 0.1843137, 0, 1,
-1.896776, 0.7290026, 0.1593079, 1, 0.1921569, 0, 1,
-1.857241, -0.6326138, -2.701065, 1, 0.1960784, 0, 1,
-1.807816, 1.430535, -0.9391436, 1, 0.2039216, 0, 1,
-1.80091, -0.5577901, 0.2530423, 1, 0.2117647, 0, 1,
-1.796941, -0.07151922, -1.126632, 1, 0.2156863, 0, 1,
-1.784794, -2.510018, -2.80432, 1, 0.2235294, 0, 1,
-1.768456, -0.3775384, -1.996319, 1, 0.227451, 0, 1,
-1.750679, 1.288416, 0.3848732, 1, 0.2352941, 0, 1,
-1.747315, -0.2544111, -2.329544, 1, 0.2392157, 0, 1,
-1.73811, 1.965731, -1.332783, 1, 0.2470588, 0, 1,
-1.730734, 0.8901381, -0.5225149, 1, 0.2509804, 0, 1,
-1.72305, -0.6500589, -2.715984, 1, 0.2588235, 0, 1,
-1.722984, 0.2363808, -0.6983676, 1, 0.2627451, 0, 1,
-1.702322, 1.962638, -2.373141, 1, 0.2705882, 0, 1,
-1.701405, -0.5630409, -1.341648, 1, 0.2745098, 0, 1,
-1.688285, -0.8571696, -3.883675, 1, 0.282353, 0, 1,
-1.664726, -0.9025444, -1.525512, 1, 0.2862745, 0, 1,
-1.634182, -1.421968, -2.051877, 1, 0.2941177, 0, 1,
-1.629676, 0.6521341, -1.797606, 1, 0.3019608, 0, 1,
-1.619179, -0.5592781, -1.854173, 1, 0.3058824, 0, 1,
-1.613374, -0.4386516, -2.394919, 1, 0.3137255, 0, 1,
-1.604039, -0.557615, -0.404926, 1, 0.3176471, 0, 1,
-1.589586, -0.484202, -2.717129, 1, 0.3254902, 0, 1,
-1.582925, -0.2104682, -2.428666, 1, 0.3294118, 0, 1,
-1.582223, 1.610898, -1.005238, 1, 0.3372549, 0, 1,
-1.569062, -1.486719, -3.719465, 1, 0.3411765, 0, 1,
-1.565493, -1.562557, -2.977262, 1, 0.3490196, 0, 1,
-1.560618, 1.796397, -0.9576402, 1, 0.3529412, 0, 1,
-1.560019, -0.6707055, -1.402533, 1, 0.3607843, 0, 1,
-1.533893, 0.8260193, 0.933718, 1, 0.3647059, 0, 1,
-1.523274, -0.418568, -1.893272, 1, 0.372549, 0, 1,
-1.518914, -2.91053, -2.160588, 1, 0.3764706, 0, 1,
-1.516845, 0.02246511, -2.275522, 1, 0.3843137, 0, 1,
-1.515567, -0.8633187, -1.870389, 1, 0.3882353, 0, 1,
-1.513084, 1.300092, -0.2217385, 1, 0.3960784, 0, 1,
-1.509961, 1.184089, -0.6731033, 1, 0.4039216, 0, 1,
-1.508418, 0.1708896, -2.49089, 1, 0.4078431, 0, 1,
-1.503029, -1.821576, -2.12289, 1, 0.4156863, 0, 1,
-1.490237, 1.217313, -1.656809, 1, 0.4196078, 0, 1,
-1.484645, -0.1033042, -2.245376, 1, 0.427451, 0, 1,
-1.483881, -0.1956457, -2.660357, 1, 0.4313726, 0, 1,
-1.478785, 1.328298, -0.2012347, 1, 0.4392157, 0, 1,
-1.474042, -1.990051, -0.6600331, 1, 0.4431373, 0, 1,
-1.465456, 0.1509549, -0.6611006, 1, 0.4509804, 0, 1,
-1.461786, -1.981192, -4.836669, 1, 0.454902, 0, 1,
-1.458895, -0.1925989, -2.287677, 1, 0.4627451, 0, 1,
-1.45637, -1.028805, -2.130165, 1, 0.4666667, 0, 1,
-1.432493, -0.5481157, 0.1553237, 1, 0.4745098, 0, 1,
-1.420796, -0.6594656, -2.426346, 1, 0.4784314, 0, 1,
-1.420043, 0.24774, -1.815519, 1, 0.4862745, 0, 1,
-1.418304, 0.5022186, -1.121598, 1, 0.4901961, 0, 1,
-1.407261, -0.9490319, -2.189241, 1, 0.4980392, 0, 1,
-1.405329, -0.5372243, -1.931884, 1, 0.5058824, 0, 1,
-1.405295, -0.6443088, -1.480584, 1, 0.509804, 0, 1,
-1.391749, 0.1712215, -1.713993, 1, 0.5176471, 0, 1,
-1.384655, -1.994432, -2.746147, 1, 0.5215687, 0, 1,
-1.380618, 0.08326293, -1.606869, 1, 0.5294118, 0, 1,
-1.377837, 1.871918, 1.080062, 1, 0.5333334, 0, 1,
-1.368304, 0.1759306, -0.04235892, 1, 0.5411765, 0, 1,
-1.367813, 1.349841, -0.4073354, 1, 0.5450981, 0, 1,
-1.350803, 0.1534696, -1.388827, 1, 0.5529412, 0, 1,
-1.346507, -0.8305401, -1.376849, 1, 0.5568628, 0, 1,
-1.335577, -1.005835, -2.975279, 1, 0.5647059, 0, 1,
-1.333257, -0.616098, -2.371866, 1, 0.5686275, 0, 1,
-1.320111, -1.315949, -2.074821, 1, 0.5764706, 0, 1,
-1.308368, 0.4202504, -1.163713, 1, 0.5803922, 0, 1,
-1.294418, -0.1491679, -2.787021, 1, 0.5882353, 0, 1,
-1.288981, -0.1681921, -1.943585, 1, 0.5921569, 0, 1,
-1.28218, -0.3449655, -2.738449, 1, 0.6, 0, 1,
-1.269741, 0.6202534, -1.833496, 1, 0.6078432, 0, 1,
-1.267505, 1.031718, -0.3905473, 1, 0.6117647, 0, 1,
-1.266603, -1.135411, -2.656265, 1, 0.6196079, 0, 1,
-1.262085, 1.676728, -0.8896777, 1, 0.6235294, 0, 1,
-1.25525, -0.7149379, -1.447731, 1, 0.6313726, 0, 1,
-1.249364, -0.2328216, -2.909908, 1, 0.6352941, 0, 1,
-1.244505, -0.3346689, -2.181275, 1, 0.6431373, 0, 1,
-1.239606, 1.595741, -0.4492207, 1, 0.6470588, 0, 1,
-1.236339, -0.6216936, -1.731416, 1, 0.654902, 0, 1,
-1.230692, -0.3604833, -1.068432, 1, 0.6588235, 0, 1,
-1.229416, -0.4823618, -1.600779, 1, 0.6666667, 0, 1,
-1.222453, -0.89496, -1.228671, 1, 0.6705883, 0, 1,
-1.218761, -0.8173192, -2.429185, 1, 0.6784314, 0, 1,
-1.216957, -0.4143141, -3.78458, 1, 0.682353, 0, 1,
-1.196216, -0.9065927, -2.482537, 1, 0.6901961, 0, 1,
-1.189317, 0.5697697, 0.1926285, 1, 0.6941177, 0, 1,
-1.186376, 0.2174275, -1.811538, 1, 0.7019608, 0, 1,
-1.183213, 0.5986159, 0.174981, 1, 0.7098039, 0, 1,
-1.170146, 0.5289494, -2.271323, 1, 0.7137255, 0, 1,
-1.168911, -0.9218716, -2.293438, 1, 0.7215686, 0, 1,
-1.154255, -1.978309, -2.788679, 1, 0.7254902, 0, 1,
-1.126669, 1.814869, -0.8154108, 1, 0.7333333, 0, 1,
-1.119479, -2.297986, -2.066705, 1, 0.7372549, 0, 1,
-1.110594, 0.3528447, -1.816541, 1, 0.7450981, 0, 1,
-1.101585, 0.714968, -0.593463, 1, 0.7490196, 0, 1,
-1.099092, 0.2174111, -1.546763, 1, 0.7568628, 0, 1,
-1.091792, -0.3733646, -3.025551, 1, 0.7607843, 0, 1,
-1.090292, 0.8281897, -0.7635212, 1, 0.7686275, 0, 1,
-1.088467, -0.3981665, -0.8691381, 1, 0.772549, 0, 1,
-1.07897, -1.179948, -2.448301, 1, 0.7803922, 0, 1,
-1.073598, -0.7079279, -1.664297, 1, 0.7843137, 0, 1,
-1.072296, -0.03706286, -0.7673795, 1, 0.7921569, 0, 1,
-1.070823, -1.15218, -3.228083, 1, 0.7960784, 0, 1,
-1.070235, -0.2651931, -1.923441, 1, 0.8039216, 0, 1,
-1.069506, -0.2897983, -2.556871, 1, 0.8117647, 0, 1,
-1.06579, -0.3993183, -0.9673554, 1, 0.8156863, 0, 1,
-1.062711, 0.4131494, -0.196912, 1, 0.8235294, 0, 1,
-1.059823, 1.303972, -0.05227302, 1, 0.827451, 0, 1,
-1.059348, -2.259491, -1.859734, 1, 0.8352941, 0, 1,
-1.057719, -0.3440165, -1.066434, 1, 0.8392157, 0, 1,
-1.049895, 0.8004713, -1.692911, 1, 0.8470588, 0, 1,
-1.048762, -0.8046178, -1.340522, 1, 0.8509804, 0, 1,
-1.035969, -1.700925, -2.338712, 1, 0.8588235, 0, 1,
-1.029178, -0.5246196, -1.670285, 1, 0.8627451, 0, 1,
-1.028221, -1.177152, -2.227331, 1, 0.8705882, 0, 1,
-1.025113, 0.09638217, -1.662701, 1, 0.8745098, 0, 1,
-1.017905, 0.1365987, -0.5010977, 1, 0.8823529, 0, 1,
-1.003255, 1.49751, -0.1016656, 1, 0.8862745, 0, 1,
-1.001168, 0.9541432, -0.565207, 1, 0.8941177, 0, 1,
-1.000561, -1.025409, -2.601955, 1, 0.8980392, 0, 1,
-0.9986288, 0.1013011, -0.4357525, 1, 0.9058824, 0, 1,
-0.9968697, 0.7145141, -0.2390932, 1, 0.9137255, 0, 1,
-0.992337, 0.3353145, -2.285918, 1, 0.9176471, 0, 1,
-0.9777178, -0.4808349, -2.539477, 1, 0.9254902, 0, 1,
-0.9745607, -1.955871, -2.842017, 1, 0.9294118, 0, 1,
-0.974255, 2.458393, 0.4097411, 1, 0.9372549, 0, 1,
-0.9713246, -0.02711459, -2.440224, 1, 0.9411765, 0, 1,
-0.9680139, -0.6378064, -1.464398, 1, 0.9490196, 0, 1,
-0.9352414, 0.7063906, 0.4111383, 1, 0.9529412, 0, 1,
-0.9317259, 1.436075, 0.4592806, 1, 0.9607843, 0, 1,
-0.930983, -0.2769288, -1.854963, 1, 0.9647059, 0, 1,
-0.9299827, -0.9306682, -4.012918, 1, 0.972549, 0, 1,
-0.9289461, -0.2700861, -1.447256, 1, 0.9764706, 0, 1,
-0.9279317, -1.663287, -3.62404, 1, 0.9843137, 0, 1,
-0.9269947, 0.1759581, -1.478375, 1, 0.9882353, 0, 1,
-0.9259883, 1.412743, -2.517937, 1, 0.9960784, 0, 1,
-0.9240268, 0.4470256, -0.1152004, 0.9960784, 1, 0, 1,
-0.9139823, -0.2389302, -0.9413222, 0.9921569, 1, 0, 1,
-0.9084217, 0.6756906, -0.9535843, 0.9843137, 1, 0, 1,
-0.9080914, 0.6001266, -1.093986, 0.9803922, 1, 0, 1,
-0.9050896, 1.144401, -1.660994, 0.972549, 1, 0, 1,
-0.9047325, 0.05641125, -1.685405, 0.9686275, 1, 0, 1,
-0.8950294, 0.4046021, -1.323237, 0.9607843, 1, 0, 1,
-0.8948267, -0.7287031, -1.443455, 0.9568627, 1, 0, 1,
-0.8919834, 0.6623315, -1.814994, 0.9490196, 1, 0, 1,
-0.891899, -0.7154155, -0.651355, 0.945098, 1, 0, 1,
-0.8901798, -0.1862175, -1.601122, 0.9372549, 1, 0, 1,
-0.8860164, -0.06175223, 0.4321304, 0.9333333, 1, 0, 1,
-0.8858277, 0.5375946, -1.072633, 0.9254902, 1, 0, 1,
-0.8803856, -1.332627, -4.005915, 0.9215686, 1, 0, 1,
-0.8788037, 0.05492949, -0.4553261, 0.9137255, 1, 0, 1,
-0.8761842, -1.080638, -2.884083, 0.9098039, 1, 0, 1,
-0.8742281, 0.7326463, 0.9689603, 0.9019608, 1, 0, 1,
-0.8695129, 1.401411, -0.4036464, 0.8941177, 1, 0, 1,
-0.8675758, 1.859542, -0.6468323, 0.8901961, 1, 0, 1,
-0.8609186, -1.74229, -3.071503, 0.8823529, 1, 0, 1,
-0.8522085, -1.13594, -1.985549, 0.8784314, 1, 0, 1,
-0.8521622, 0.5747678, -0.2085987, 0.8705882, 1, 0, 1,
-0.8437158, -0.4310978, -1.272408, 0.8666667, 1, 0, 1,
-0.8430734, 1.307144, -0.5797801, 0.8588235, 1, 0, 1,
-0.8358228, -0.1975465, -1.336057, 0.854902, 1, 0, 1,
-0.8346425, -0.3012275, -3.711939, 0.8470588, 1, 0, 1,
-0.832285, 2.263868, -2.658406, 0.8431373, 1, 0, 1,
-0.8307298, -0.4726764, -2.309632, 0.8352941, 1, 0, 1,
-0.8246028, -0.889845, -1.304277, 0.8313726, 1, 0, 1,
-0.8192073, -3.324489, -2.880246, 0.8235294, 1, 0, 1,
-0.8171853, -2.91983, -5.228247, 0.8196079, 1, 0, 1,
-0.815397, 0.6428273, 0.7086791, 0.8117647, 1, 0, 1,
-0.8151147, 0.4955382, -0.1597241, 0.8078431, 1, 0, 1,
-0.8118758, -0.9322035, -2.054446, 0.8, 1, 0, 1,
-0.8109518, 0.3023367, -1.883577, 0.7921569, 1, 0, 1,
-0.8094901, 0.2118815, -1.16941, 0.7882353, 1, 0, 1,
-0.8035355, -0.4615042, -3.088439, 0.7803922, 1, 0, 1,
-0.8012539, 1.638878, 0.8161585, 0.7764706, 1, 0, 1,
-0.7983188, -0.2658057, -1.031358, 0.7686275, 1, 0, 1,
-0.7963899, 0.2119508, -3.177146, 0.7647059, 1, 0, 1,
-0.7958912, -1.046554, -2.856083, 0.7568628, 1, 0, 1,
-0.7948822, 1.863689, 0.4174416, 0.7529412, 1, 0, 1,
-0.7930341, -1.359926, -1.953522, 0.7450981, 1, 0, 1,
-0.7844472, 0.154935, -3.337247, 0.7411765, 1, 0, 1,
-0.7801051, 0.6004, -1.090511, 0.7333333, 1, 0, 1,
-0.777552, 1.882006, -0.9328158, 0.7294118, 1, 0, 1,
-0.7669079, 0.645016, 0.4775835, 0.7215686, 1, 0, 1,
-0.7654973, -1.866233, -2.655035, 0.7176471, 1, 0, 1,
-0.7646925, 0.9903593, -0.5822952, 0.7098039, 1, 0, 1,
-0.7626773, -0.06768256, -1.824484, 0.7058824, 1, 0, 1,
-0.7588977, 0.5728068, -1.924057, 0.6980392, 1, 0, 1,
-0.7572498, -0.5659789, -3.054822, 0.6901961, 1, 0, 1,
-0.7548099, -1.753089, -4.65543, 0.6862745, 1, 0, 1,
-0.7520336, 0.3574754, -1.923023, 0.6784314, 1, 0, 1,
-0.7519794, 0.2273609, -2.771836, 0.6745098, 1, 0, 1,
-0.7506092, -1.471961, -3.174114, 0.6666667, 1, 0, 1,
-0.7453882, 1.387854, -0.6156278, 0.6627451, 1, 0, 1,
-0.7367932, 0.004035342, -1.215937, 0.654902, 1, 0, 1,
-0.7327637, -1.227555, -4.759267, 0.6509804, 1, 0, 1,
-0.7324072, 1.519232, -0.8578596, 0.6431373, 1, 0, 1,
-0.7298834, -0.2942547, -3.581249, 0.6392157, 1, 0, 1,
-0.7259238, -0.4692693, -2.630699, 0.6313726, 1, 0, 1,
-0.7252966, 0.4521223, -0.633352, 0.627451, 1, 0, 1,
-0.723864, 0.3810028, -1.103925, 0.6196079, 1, 0, 1,
-0.7225241, -0.949715, -3.684731, 0.6156863, 1, 0, 1,
-0.7204456, 0.8408055, -0.5630655, 0.6078432, 1, 0, 1,
-0.7197572, -0.2597753, -2.017206, 0.6039216, 1, 0, 1,
-0.7153773, -0.2151069, -2.149907, 0.5960785, 1, 0, 1,
-0.7126238, 1.21825, -1.718674, 0.5882353, 1, 0, 1,
-0.7116127, 1.331022, 0.3495835, 0.5843138, 1, 0, 1,
-0.7054441, -0.90244, -1.597811, 0.5764706, 1, 0, 1,
-0.6987092, 0.2816061, -0.4712593, 0.572549, 1, 0, 1,
-0.6983794, 0.6661707, 1.261529, 0.5647059, 1, 0, 1,
-0.6978465, -0.6371499, -0.5179373, 0.5607843, 1, 0, 1,
-0.6945824, -0.3349305, -1.449505, 0.5529412, 1, 0, 1,
-0.6926099, 0.6211637, -1.324142, 0.5490196, 1, 0, 1,
-0.6897727, -0.3865735, -1.426109, 0.5411765, 1, 0, 1,
-0.6891562, 0.6934756, -0.103502, 0.5372549, 1, 0, 1,
-0.6868364, -1.059699, -2.992998, 0.5294118, 1, 0, 1,
-0.679328, -0.2590604, -2.703257, 0.5254902, 1, 0, 1,
-0.6738957, -1.3288, -3.856085, 0.5176471, 1, 0, 1,
-0.6733837, 0.3510043, -0.4534582, 0.5137255, 1, 0, 1,
-0.6726553, 0.2330622, 0.2642167, 0.5058824, 1, 0, 1,
-0.6665453, 0.5188643, -0.7057638, 0.5019608, 1, 0, 1,
-0.6663264, -0.5437562, -2.300794, 0.4941176, 1, 0, 1,
-0.6635814, 1.536837, 0.6743109, 0.4862745, 1, 0, 1,
-0.6598058, 1.252951, 2.775147, 0.4823529, 1, 0, 1,
-0.6566198, -1.711498, -2.400064, 0.4745098, 1, 0, 1,
-0.6561423, -0.747788, -2.135959, 0.4705882, 1, 0, 1,
-0.6536089, 0.6019815, -0.805119, 0.4627451, 1, 0, 1,
-0.6506848, -0.9776825, -1.932512, 0.4588235, 1, 0, 1,
-0.6456694, 1.483211, -1.008964, 0.4509804, 1, 0, 1,
-0.643947, -0.385349, -1.761455, 0.4470588, 1, 0, 1,
-0.6414213, 0.1067509, -0.6391897, 0.4392157, 1, 0, 1,
-0.6410937, 0.1689566, -0.5403039, 0.4352941, 1, 0, 1,
-0.6375756, -0.8202246, -1.372975, 0.427451, 1, 0, 1,
-0.6255671, 0.5331845, 0.6109081, 0.4235294, 1, 0, 1,
-0.6234142, -0.985647, -2.866672, 0.4156863, 1, 0, 1,
-0.618454, -1.617121, -3.270054, 0.4117647, 1, 0, 1,
-0.612806, -1.846955, -1.705237, 0.4039216, 1, 0, 1,
-0.6088312, -0.8451619, -3.373912, 0.3960784, 1, 0, 1,
-0.608163, 0.7890602, -0.0928782, 0.3921569, 1, 0, 1,
-0.607693, 0.1266484, -3.299454, 0.3843137, 1, 0, 1,
-0.6070513, -0.6554997, -2.389233, 0.3803922, 1, 0, 1,
-0.6062756, 1.026928, -0.6731526, 0.372549, 1, 0, 1,
-0.6023666, -0.5818229, -1.760529, 0.3686275, 1, 0, 1,
-0.6021636, -0.3665577, -2.444778, 0.3607843, 1, 0, 1,
-0.6014805, -0.9639217, -3.077905, 0.3568628, 1, 0, 1,
-0.5948817, 1.046141, 0.2079699, 0.3490196, 1, 0, 1,
-0.5942901, -0.06085122, -1.789713, 0.345098, 1, 0, 1,
-0.5881479, 0.3045085, -2.980157, 0.3372549, 1, 0, 1,
-0.5842971, -1.704865, -2.507713, 0.3333333, 1, 0, 1,
-0.5823117, -0.9516555, -1.984663, 0.3254902, 1, 0, 1,
-0.5823076, -1.107874, -3.939929, 0.3215686, 1, 0, 1,
-0.5823056, 0.8257486, 0.1752363, 0.3137255, 1, 0, 1,
-0.5760782, -0.2393655, -2.18708, 0.3098039, 1, 0, 1,
-0.5759038, -1.601534, -2.997608, 0.3019608, 1, 0, 1,
-0.575491, 0.0410873, -2.610812, 0.2941177, 1, 0, 1,
-0.5751934, 0.2049322, -2.102399, 0.2901961, 1, 0, 1,
-0.5730122, -0.4603606, -2.707213, 0.282353, 1, 0, 1,
-0.5723227, -0.2008785, -1.767331, 0.2784314, 1, 0, 1,
-0.5715545, 0.5363206, -1.22336, 0.2705882, 1, 0, 1,
-0.567888, -1.052115, -2.578072, 0.2666667, 1, 0, 1,
-0.5662922, -0.3574391, -1.232167, 0.2588235, 1, 0, 1,
-0.5641993, 1.723663, 1.116243, 0.254902, 1, 0, 1,
-0.5620677, 0.6501647, -0.008975013, 0.2470588, 1, 0, 1,
-0.5585935, 1.764103, -1.18713, 0.2431373, 1, 0, 1,
-0.5533724, 1.519765, 0.5953858, 0.2352941, 1, 0, 1,
-0.5505058, -0.04289633, 0.5984222, 0.2313726, 1, 0, 1,
-0.5400445, -0.2706228, -0.6016252, 0.2235294, 1, 0, 1,
-0.5385795, -1.235603, -5.487099, 0.2196078, 1, 0, 1,
-0.5374156, 1.144211, -0.1930218, 0.2117647, 1, 0, 1,
-0.5340677, 0.08086836, -0.8994976, 0.2078431, 1, 0, 1,
-0.5331738, -0.2277582, -0.03322694, 0.2, 1, 0, 1,
-0.525364, 0.6262656, 0.0005343308, 0.1921569, 1, 0, 1,
-0.5206203, -0.6876146, -1.328222, 0.1882353, 1, 0, 1,
-0.5124672, 1.281967, 0.4141179, 0.1803922, 1, 0, 1,
-0.5104584, -0.6525972, -2.595958, 0.1764706, 1, 0, 1,
-0.5077844, 0.8800372, -2.544425, 0.1686275, 1, 0, 1,
-0.5059242, -0.3468132, -1.56247, 0.1647059, 1, 0, 1,
-0.5002882, -1.515624, -4.421255, 0.1568628, 1, 0, 1,
-0.5002601, 0.3027284, -1.183186, 0.1529412, 1, 0, 1,
-0.497578, -0.3844101, -1.903378, 0.145098, 1, 0, 1,
-0.492996, 0.02571768, -3.165704, 0.1411765, 1, 0, 1,
-0.4926447, -0.989984, -2.534678, 0.1333333, 1, 0, 1,
-0.4924355, 1.28683, -0.7208294, 0.1294118, 1, 0, 1,
-0.4922832, -1.104717, -3.733455, 0.1215686, 1, 0, 1,
-0.4912516, -0.7621399, -4.066121, 0.1176471, 1, 0, 1,
-0.4905103, -0.6605307, -1.206368, 0.1098039, 1, 0, 1,
-0.4874885, -1.002449, -1.496544, 0.1058824, 1, 0, 1,
-0.4863793, -1.78834, -2.223572, 0.09803922, 1, 0, 1,
-0.4857159, -0.4406048, -1.688777, 0.09019608, 1, 0, 1,
-0.4809121, 0.07062298, 0.9982684, 0.08627451, 1, 0, 1,
-0.4804759, 0.3601241, -1.498013, 0.07843138, 1, 0, 1,
-0.4800327, 0.07393806, -0.4697942, 0.07450981, 1, 0, 1,
-0.4790809, 0.7622035, -0.2532419, 0.06666667, 1, 0, 1,
-0.4724495, -1.499244, -2.91077, 0.0627451, 1, 0, 1,
-0.4657766, 1.007273, -0.1938352, 0.05490196, 1, 0, 1,
-0.465731, 0.1103738, -2.360951, 0.05098039, 1, 0, 1,
-0.4599906, -2.12364, -2.733919, 0.04313726, 1, 0, 1,
-0.4559135, -0.4256258, -1.594794, 0.03921569, 1, 0, 1,
-0.4536565, -0.1892089, -0.8502468, 0.03137255, 1, 0, 1,
-0.4496059, 1.159054, 0.5978117, 0.02745098, 1, 0, 1,
-0.4455792, -0.04206142, -0.8564841, 0.01960784, 1, 0, 1,
-0.4454243, -1.202784, -0.7072073, 0.01568628, 1, 0, 1,
-0.4414053, 0.5248337, -0.3918021, 0.007843138, 1, 0, 1,
-0.4405089, -0.4904245, -2.061585, 0.003921569, 1, 0, 1,
-0.4364881, 1.421847, -1.268537, 0, 1, 0.003921569, 1,
-0.4362677, 1.232947, 0.4442565, 0, 1, 0.01176471, 1,
-0.4312008, 0.1428235, -0.04443839, 0, 1, 0.01568628, 1,
-0.4310613, -1.308682, -3.541927, 0, 1, 0.02352941, 1,
-0.4303261, -1.202009, -4.410111, 0, 1, 0.02745098, 1,
-0.4251782, 2.053131, 1.691421, 0, 1, 0.03529412, 1,
-0.4230632, -0.534918, -2.393625, 0, 1, 0.03921569, 1,
-0.4177188, 1.173825, 0.5104614, 0, 1, 0.04705882, 1,
-0.4160252, -0.2513094, -2.381334, 0, 1, 0.05098039, 1,
-0.4133809, 1.053876, -0.217894, 0, 1, 0.05882353, 1,
-0.4120288, -0.8360111, -3.658299, 0, 1, 0.0627451, 1,
-0.4054057, 2.216504, -1.68113, 0, 1, 0.07058824, 1,
-0.4021343, -0.134535, -1.387629, 0, 1, 0.07450981, 1,
-0.4018912, -0.7348433, -2.34296, 0, 1, 0.08235294, 1,
-0.3994721, -1.665786, -1.790703, 0, 1, 0.08627451, 1,
-0.3929627, 0.7542725, -0.5274494, 0, 1, 0.09411765, 1,
-0.3914833, -0.163821, -3.029253, 0, 1, 0.1019608, 1,
-0.3914475, -1.135918, -1.203473, 0, 1, 0.1058824, 1,
-0.3904301, -2.723902, -2.636633, 0, 1, 0.1137255, 1,
-0.3812619, -0.4023563, -2.58459, 0, 1, 0.1176471, 1,
-0.3794408, 0.7361016, -0.6326628, 0, 1, 0.1254902, 1,
-0.3787647, -1.806411, -1.554415, 0, 1, 0.1294118, 1,
-0.3785985, -0.3610572, -3.092595, 0, 1, 0.1372549, 1,
-0.3776007, -0.9284435, -3.229101, 0, 1, 0.1411765, 1,
-0.3768021, 0.842843, -0.7990316, 0, 1, 0.1490196, 1,
-0.3721286, 0.9150422, -1.04786, 0, 1, 0.1529412, 1,
-0.3712768, 1.414196, 0.6690729, 0, 1, 0.1607843, 1,
-0.3689767, 0.9791785, -1.064388, 0, 1, 0.1647059, 1,
-0.3677957, 1.310588, -0.7911642, 0, 1, 0.172549, 1,
-0.3668728, 0.6003465, -0.2620945, 0, 1, 0.1764706, 1,
-0.3593494, -0.4132125, -2.339079, 0, 1, 0.1843137, 1,
-0.3541251, -0.3836533, -3.21473, 0, 1, 0.1882353, 1,
-0.3537996, -0.8756503, -0.9480848, 0, 1, 0.1960784, 1,
-0.3532531, -0.9709326, -1.375222, 0, 1, 0.2039216, 1,
-0.3469165, 0.2483161, -1.465639, 0, 1, 0.2078431, 1,
-0.3468688, -1.033848, -3.197211, 0, 1, 0.2156863, 1,
-0.3457626, -1.073754, -1.804026, 0, 1, 0.2196078, 1,
-0.3455548, 1.74625, -0.209019, 0, 1, 0.227451, 1,
-0.3388333, -1.195591, -4.94293, 0, 1, 0.2313726, 1,
-0.3369963, 0.3532971, -0.6730759, 0, 1, 0.2392157, 1,
-0.3359478, 0.4967276, -1.528141, 0, 1, 0.2431373, 1,
-0.3347048, -0.3379464, -2.377275, 0, 1, 0.2509804, 1,
-0.3343558, 0.547829, 0.4407464, 0, 1, 0.254902, 1,
-0.3342791, -1.158812, -4.725305, 0, 1, 0.2627451, 1,
-0.3342129, 1.256014, -0.06233033, 0, 1, 0.2666667, 1,
-0.3329726, -2.160461, -3.334677, 0, 1, 0.2745098, 1,
-0.3329088, 0.4942498, 0.9719673, 0, 1, 0.2784314, 1,
-0.3290258, 0.127692, -0.9476334, 0, 1, 0.2862745, 1,
-0.3288296, -1.413561, -2.598098, 0, 1, 0.2901961, 1,
-0.3236516, 0.3056763, -1.736506, 0, 1, 0.2980392, 1,
-0.3234164, -1.753351, -2.578498, 0, 1, 0.3058824, 1,
-0.318838, -2.084596, -2.521431, 0, 1, 0.3098039, 1,
-0.3110744, -0.01644728, -0.9883843, 0, 1, 0.3176471, 1,
-0.3100382, -0.4144647, -1.793962, 0, 1, 0.3215686, 1,
-0.3068633, -1.453786, -2.750964, 0, 1, 0.3294118, 1,
-0.3066152, -1.351869, -3.097966, 0, 1, 0.3333333, 1,
-0.3065553, 0.9969024, -0.9997987, 0, 1, 0.3411765, 1,
-0.306133, 0.007327786, -1.484125, 0, 1, 0.345098, 1,
-0.3016107, -1.759794, -3.535825, 0, 1, 0.3529412, 1,
-0.3009483, 0.9161035, -0.8040211, 0, 1, 0.3568628, 1,
-0.2936413, 1.093426, 0.6841669, 0, 1, 0.3647059, 1,
-0.2935427, -0.4533503, -3.556804, 0, 1, 0.3686275, 1,
-0.2934691, -0.6943639, -3.109827, 0, 1, 0.3764706, 1,
-0.2934399, 0.9220647, 0.1326114, 0, 1, 0.3803922, 1,
-0.2926387, 1.063863, 0.4097143, 0, 1, 0.3882353, 1,
-0.2826355, 0.191353, -0.9608943, 0, 1, 0.3921569, 1,
-0.2814141, 0.4519099, 0.01663752, 0, 1, 0.4, 1,
-0.2797076, -0.4645503, -2.176714, 0, 1, 0.4078431, 1,
-0.2783585, -0.4909253, -2.15595, 0, 1, 0.4117647, 1,
-0.273313, 0.7158102, -0.1067493, 0, 1, 0.4196078, 1,
-0.2731667, -0.04170427, -0.5907512, 0, 1, 0.4235294, 1,
-0.2720945, -1.3555, -1.761518, 0, 1, 0.4313726, 1,
-0.2701591, 2.357908, -0.105165, 0, 1, 0.4352941, 1,
-0.2682323, -0.303257, -2.075727, 0, 1, 0.4431373, 1,
-0.2670721, 0.9502887, -0.003266597, 0, 1, 0.4470588, 1,
-0.2642989, 1.678356, 1.704621, 0, 1, 0.454902, 1,
-0.259578, 1.597032, -0.2233804, 0, 1, 0.4588235, 1,
-0.2553561, -1.64092, -3.414338, 0, 1, 0.4666667, 1,
-0.2497561, -0.8757442, -2.744138, 0, 1, 0.4705882, 1,
-0.2396768, -0.4130384, -0.9634054, 0, 1, 0.4784314, 1,
-0.2377357, -0.7719309, -2.596169, 0, 1, 0.4823529, 1,
-0.2307004, -0.2163682, -1.300367, 0, 1, 0.4901961, 1,
-0.2284302, -0.3010736, -2.42396, 0, 1, 0.4941176, 1,
-0.2251639, -1.289923, -2.415362, 0, 1, 0.5019608, 1,
-0.2248089, 0.980593, 0.743956, 0, 1, 0.509804, 1,
-0.2243623, 0.5905461, -1.834832, 0, 1, 0.5137255, 1,
-0.2235624, -2.376071, -2.84362, 0, 1, 0.5215687, 1,
-0.2213511, -0.3178513, -2.582253, 0, 1, 0.5254902, 1,
-0.2151308, 0.2913313, -0.5974753, 0, 1, 0.5333334, 1,
-0.2139845, -0.9194288, -4.054815, 0, 1, 0.5372549, 1,
-0.2112776, -1.583455, -2.663279, 0, 1, 0.5450981, 1,
-0.2083792, -0.6417192, -3.291119, 0, 1, 0.5490196, 1,
-0.208245, -0.8029079, -5.247099, 0, 1, 0.5568628, 1,
-0.2076558, -0.1850305, -0.7885734, 0, 1, 0.5607843, 1,
-0.2072026, -1.02951, -2.964516, 0, 1, 0.5686275, 1,
-0.2050242, 1.493291, 0.3992489, 0, 1, 0.572549, 1,
-0.1991464, 0.1578943, -2.551194, 0, 1, 0.5803922, 1,
-0.1982017, -1.408255, -2.52649, 0, 1, 0.5843138, 1,
-0.1967973, -0.4035383, -0.8018249, 0, 1, 0.5921569, 1,
-0.1876249, -2.501113, -1.294714, 0, 1, 0.5960785, 1,
-0.1838027, -1.231421, -1.514664, 0, 1, 0.6039216, 1,
-0.1779249, -0.6017385, -3.781646, 0, 1, 0.6117647, 1,
-0.1773349, -0.746769, -2.80424, 0, 1, 0.6156863, 1,
-0.1763001, -0.3178278, -2.22667, 0, 1, 0.6235294, 1,
-0.1731753, 1.121244, -0.5126443, 0, 1, 0.627451, 1,
-0.1703417, -0.4013494, -2.032729, 0, 1, 0.6352941, 1,
-0.1673971, 0.293641, 1.552636, 0, 1, 0.6392157, 1,
-0.1664782, 0.583255, 0.008818083, 0, 1, 0.6470588, 1,
-0.1660842, 1.006554, -0.9509177, 0, 1, 0.6509804, 1,
-0.164041, 0.7169598, -0.3044414, 0, 1, 0.6588235, 1,
-0.1633172, -0.190609, -3.468994, 0, 1, 0.6627451, 1,
-0.1595427, -1.387006, -2.228175, 0, 1, 0.6705883, 1,
-0.1589336, -2.130009, -1.416045, 0, 1, 0.6745098, 1,
-0.1583021, -1.519987, -2.270395, 0, 1, 0.682353, 1,
-0.1537877, -0.2127644, -1.71574, 0, 1, 0.6862745, 1,
-0.1534775, -0.01797547, -0.6812184, 0, 1, 0.6941177, 1,
-0.1463638, 1.165728, 1.788043, 0, 1, 0.7019608, 1,
-0.143985, -1.992935, -4.467187, 0, 1, 0.7058824, 1,
-0.1394394, 0.2827679, 0.09439509, 0, 1, 0.7137255, 1,
-0.1327814, 1.6387, -0.1911656, 0, 1, 0.7176471, 1,
-0.1301775, 0.09273077, -0.613169, 0, 1, 0.7254902, 1,
-0.1293212, 1.65321, -0.6165984, 0, 1, 0.7294118, 1,
-0.1253498, 0.4795584, 1.251157, 0, 1, 0.7372549, 1,
-0.1249028, 0.3062142, -0.9380987, 0, 1, 0.7411765, 1,
-0.1232298, 0.3533249, -0.9920799, 0, 1, 0.7490196, 1,
-0.1207176, 0.1321835, -1.905663, 0, 1, 0.7529412, 1,
-0.1189041, 0.2552016, -1.14994, 0, 1, 0.7607843, 1,
-0.1179384, 0.4719726, 0.1106827, 0, 1, 0.7647059, 1,
-0.1177115, 0.4784921, -0.1118907, 0, 1, 0.772549, 1,
-0.115475, 1.287954, 0.1683476, 0, 1, 0.7764706, 1,
-0.1104789, -1.082134, -2.682141, 0, 1, 0.7843137, 1,
-0.1081817, -0.4903223, -2.527538, 0, 1, 0.7882353, 1,
-0.1049771, -0.379063, -1.462457, 0, 1, 0.7960784, 1,
-0.1021263, 0.4119816, 2.649894, 0, 1, 0.8039216, 1,
-0.1003064, 1.31589, 0.00777558, 0, 1, 0.8078431, 1,
-0.09840068, -0.6503931, -3.980804, 0, 1, 0.8156863, 1,
-0.09599691, 1.843675, -0.9342774, 0, 1, 0.8196079, 1,
-0.08596948, 0.08861424, -1.23425, 0, 1, 0.827451, 1,
-0.08491287, -0.9213607, -2.705283, 0, 1, 0.8313726, 1,
-0.0804394, 0.3641407, 1.104282, 0, 1, 0.8392157, 1,
-0.08002122, -0.5818732, -2.849702, 0, 1, 0.8431373, 1,
-0.07924524, 0.8204116, -0.6868509, 0, 1, 0.8509804, 1,
-0.0778592, -0.5768891, -2.406382, 0, 1, 0.854902, 1,
-0.0778067, 1.662839, 0.237285, 0, 1, 0.8627451, 1,
-0.0767975, -0.9880922, -3.042152, 0, 1, 0.8666667, 1,
-0.07375584, 0.2116746, 0.1312017, 0, 1, 0.8745098, 1,
-0.07347073, -0.2887708, -3.860978, 0, 1, 0.8784314, 1,
-0.07304608, 0.1009253, -2.142923, 0, 1, 0.8862745, 1,
-0.07078294, 0.5353216, 0.9040206, 0, 1, 0.8901961, 1,
-0.06890573, -0.1959243, -2.835523, 0, 1, 0.8980392, 1,
-0.06745399, 1.762173, 0.3867643, 0, 1, 0.9058824, 1,
-0.06295803, 1.026824, -1.787098, 0, 1, 0.9098039, 1,
-0.0606807, 0.4138446, -0.7907726, 0, 1, 0.9176471, 1,
-0.06000482, 1.611779, 0.7773168, 0, 1, 0.9215686, 1,
-0.05763038, -1.840631, -2.312239, 0, 1, 0.9294118, 1,
-0.05730672, 0.9570131, 1.213143, 0, 1, 0.9333333, 1,
-0.05603873, -0.7806649, -4.058723, 0, 1, 0.9411765, 1,
-0.04772545, -0.2100358, -2.4404, 0, 1, 0.945098, 1,
-0.04518983, -1.131679, -3.750074, 0, 1, 0.9529412, 1,
-0.03711579, -0.4054624, -3.865826, 0, 1, 0.9568627, 1,
-0.02993102, -0.2813681, -1.530326, 0, 1, 0.9647059, 1,
-0.02518784, 2.82412, 0.405012, 0, 1, 0.9686275, 1,
-0.02452665, 0.3849645, 0.5739956, 0, 1, 0.9764706, 1,
-0.02033801, -0.9659062, -1.886189, 0, 1, 0.9803922, 1,
-0.01955129, 0.8075866, 1.204452, 0, 1, 0.9882353, 1,
-0.0169664, -0.1475157, -1.572435, 0, 1, 0.9921569, 1,
-0.01619663, 0.9592989, -0.8935516, 0, 1, 1, 1,
-0.01301793, -1.334902, -3.800349, 0, 0.9921569, 1, 1,
-0.0127099, -0.2546166, -4.266163, 0, 0.9882353, 1, 1,
-0.0121655, 0.3384431, -0.09724912, 0, 0.9803922, 1, 1,
-0.01082435, -0.150147, -4.146871, 0, 0.9764706, 1, 1,
-0.0104659, -0.683774, -2.469913, 0, 0.9686275, 1, 1,
0.001738286, -0.3035602, 3.262611, 0, 0.9647059, 1, 1,
0.002015064, -0.7789117, 2.857655, 0, 0.9568627, 1, 1,
0.002563239, -0.3659514, 2.869954, 0, 0.9529412, 1, 1,
0.00270979, -0.3094229, 2.200658, 0, 0.945098, 1, 1,
0.004311332, 1.581653, -0.03084004, 0, 0.9411765, 1, 1,
0.004943548, -0.7084369, 3.224815, 0, 0.9333333, 1, 1,
0.005722389, -1.395613, 1.843829, 0, 0.9294118, 1, 1,
0.01067257, -1.815157, 1.821829, 0, 0.9215686, 1, 1,
0.01915705, 1.158681, -0.7391723, 0, 0.9176471, 1, 1,
0.03244384, -1.30471, 3.716635, 0, 0.9098039, 1, 1,
0.03649068, -0.2227557, 2.86372, 0, 0.9058824, 1, 1,
0.04195268, -0.2908224, 2.597991, 0, 0.8980392, 1, 1,
0.04232383, 0.8455477, -1.426404, 0, 0.8901961, 1, 1,
0.04266937, 0.2597691, 1.721452, 0, 0.8862745, 1, 1,
0.04752927, -1.297496, 3.642679, 0, 0.8784314, 1, 1,
0.04757082, -1.900167, 2.906215, 0, 0.8745098, 1, 1,
0.04923904, -0.4863983, 2.301666, 0, 0.8666667, 1, 1,
0.04954992, 0.7959043, 0.8957907, 0, 0.8627451, 1, 1,
0.05008795, -0.6533483, 2.598496, 0, 0.854902, 1, 1,
0.05012115, 0.2782295, -1.481113, 0, 0.8509804, 1, 1,
0.05016556, -0.7771424, 2.438467, 0, 0.8431373, 1, 1,
0.05118293, -1.095847, 2.72918, 0, 0.8392157, 1, 1,
0.05394435, 0.4177865, 0.8017611, 0, 0.8313726, 1, 1,
0.0569964, 0.3202747, 1.483752, 0, 0.827451, 1, 1,
0.05847124, 0.04358662, 2.229431, 0, 0.8196079, 1, 1,
0.05876658, 3.311253, -1.176956, 0, 0.8156863, 1, 1,
0.06014384, 0.5944761, -0.3985642, 0, 0.8078431, 1, 1,
0.06672178, -1.865415, 3.039227, 0, 0.8039216, 1, 1,
0.06813464, -0.7747666, 4.313983, 0, 0.7960784, 1, 1,
0.0693555, -0.3977835, 3.998626, 0, 0.7882353, 1, 1,
0.07001094, -0.9406429, 1.383311, 0, 0.7843137, 1, 1,
0.07548632, -1.044297, 4.326612, 0, 0.7764706, 1, 1,
0.08131722, 2.787089, 1.609816, 0, 0.772549, 1, 1,
0.08291996, -0.5337422, 2.943155, 0, 0.7647059, 1, 1,
0.08434169, -1.404853, 4.101095, 0, 0.7607843, 1, 1,
0.08698262, 0.003490234, 1.703426, 0, 0.7529412, 1, 1,
0.08987299, -2.113522, 2.039509, 0, 0.7490196, 1, 1,
0.09148638, -0.3986581, 1.742995, 0, 0.7411765, 1, 1,
0.09208045, 0.3941942, 2.216528, 0, 0.7372549, 1, 1,
0.09274325, 0.3444631, -1.466705, 0, 0.7294118, 1, 1,
0.09356053, -0.2280633, 3.194195, 0, 0.7254902, 1, 1,
0.09410875, -0.7836472, 2.228507, 0, 0.7176471, 1, 1,
0.095765, 0.5377682, 1.980181, 0, 0.7137255, 1, 1,
0.1052704, -0.3025195, 4.233292, 0, 0.7058824, 1, 1,
0.1074842, 0.8835828, -1.292463, 0, 0.6980392, 1, 1,
0.1096541, -0.0714206, -0.0935069, 0, 0.6941177, 1, 1,
0.1107109, 0.5813575, 1.930422, 0, 0.6862745, 1, 1,
0.1137466, 1.78509, -0.3255244, 0, 0.682353, 1, 1,
0.1155308, -0.4307042, 3.270272, 0, 0.6745098, 1, 1,
0.1158371, 0.4040983, 0.6192374, 0, 0.6705883, 1, 1,
0.1170252, 1.121642, 1.628685, 0, 0.6627451, 1, 1,
0.1186567, -0.3006521, 2.379233, 0, 0.6588235, 1, 1,
0.1257984, -0.2639738, 2.373995, 0, 0.6509804, 1, 1,
0.1260695, -0.1304742, 3.109177, 0, 0.6470588, 1, 1,
0.1267716, 0.8751162, 0.6123025, 0, 0.6392157, 1, 1,
0.1271547, 0.9202731, 1.835993, 0, 0.6352941, 1, 1,
0.1287142, 0.2521179, 1.134885, 0, 0.627451, 1, 1,
0.1340619, -1.031357, 6.003754, 0, 0.6235294, 1, 1,
0.1372226, -0.3092931, 4.316495, 0, 0.6156863, 1, 1,
0.144306, 0.08371035, 0.01831633, 0, 0.6117647, 1, 1,
0.1485157, -0.05821129, 1.467823, 0, 0.6039216, 1, 1,
0.1526207, -0.6560258, 1.620504, 0, 0.5960785, 1, 1,
0.1540799, -0.9692995, 3.241955, 0, 0.5921569, 1, 1,
0.1552419, 0.768488, -1.005318, 0, 0.5843138, 1, 1,
0.1562134, -0.1317584, 0.9136311, 0, 0.5803922, 1, 1,
0.1635774, -0.1145608, -0.0277959, 0, 0.572549, 1, 1,
0.1679461, -1.456841, 4.086959, 0, 0.5686275, 1, 1,
0.1683378, 0.133577, 3.555094, 0, 0.5607843, 1, 1,
0.1696762, -0.354032, 2.273975, 0, 0.5568628, 1, 1,
0.1761358, 1.640233, 0.5579743, 0, 0.5490196, 1, 1,
0.176209, 2.336466, -1.077247, 0, 0.5450981, 1, 1,
0.180964, -0.2090672, 3.517021, 0, 0.5372549, 1, 1,
0.1842262, 1.322241, 0.3869787, 0, 0.5333334, 1, 1,
0.1869531, -1.950207, 3.218909, 0, 0.5254902, 1, 1,
0.1881698, -0.005146306, 0.2401241, 0, 0.5215687, 1, 1,
0.1913761, -0.5223733, 2.078401, 0, 0.5137255, 1, 1,
0.1918932, -1.190508, 3.43721, 0, 0.509804, 1, 1,
0.1921612, 1.701129, -0.9071654, 0, 0.5019608, 1, 1,
0.1934037, 1.061561, -1.029229, 0, 0.4941176, 1, 1,
0.1962305, -0.3171951, 4.368261, 0, 0.4901961, 1, 1,
0.2071857, 1.250287, 0.6433062, 0, 0.4823529, 1, 1,
0.2188789, 0.4626356, -0.9275021, 0, 0.4784314, 1, 1,
0.2214561, 0.6673872, 0.3036822, 0, 0.4705882, 1, 1,
0.2242972, -1.039678, 2.588845, 0, 0.4666667, 1, 1,
0.2308581, 0.1669625, -0.8119215, 0, 0.4588235, 1, 1,
0.2322654, 1.841046, 0.9884903, 0, 0.454902, 1, 1,
0.235778, 0.09063472, 1.000156, 0, 0.4470588, 1, 1,
0.237066, -0.4177924, 1.838377, 0, 0.4431373, 1, 1,
0.2389447, 0.5909953, 0.2149418, 0, 0.4352941, 1, 1,
0.2397709, -0.3694979, 1.86914, 0, 0.4313726, 1, 1,
0.2422051, 0.8450083, -0.844736, 0, 0.4235294, 1, 1,
0.2434795, -0.2576506, 2.828991, 0, 0.4196078, 1, 1,
0.2455068, 0.9966767, -0.2867894, 0, 0.4117647, 1, 1,
0.2472286, -1.115532, 2.616765, 0, 0.4078431, 1, 1,
0.248603, 0.003575508, 1.864689, 0, 0.4, 1, 1,
0.252225, 0.1688427, 2.142282, 0, 0.3921569, 1, 1,
0.2529555, -0.8400675, 0.8944266, 0, 0.3882353, 1, 1,
0.2561901, -1.892434, 3.727597, 0, 0.3803922, 1, 1,
0.2644098, 1.448241, -0.437988, 0, 0.3764706, 1, 1,
0.2685373, 0.322624, -0.8299994, 0, 0.3686275, 1, 1,
0.2693363, -1.197804, 5.830712, 0, 0.3647059, 1, 1,
0.2706467, 1.201082, -0.3075718, 0, 0.3568628, 1, 1,
0.2713117, -1.892466, 3.682456, 0, 0.3529412, 1, 1,
0.272067, 0.3995403, 1.317594, 0, 0.345098, 1, 1,
0.2724168, -0.2506886, 0.3937198, 0, 0.3411765, 1, 1,
0.2771559, 0.5516991, 0.7127523, 0, 0.3333333, 1, 1,
0.2783861, 0.6355814, 1.367923, 0, 0.3294118, 1, 1,
0.2787919, -0.4205818, 2.571302, 0, 0.3215686, 1, 1,
0.2803182, -0.5896211, 1.61445, 0, 0.3176471, 1, 1,
0.2809286, -0.5851958, 3.443412, 0, 0.3098039, 1, 1,
0.2822341, 0.9154997, 1.601726, 0, 0.3058824, 1, 1,
0.2827229, 0.2093553, 0.09293846, 0, 0.2980392, 1, 1,
0.2844009, 1.25611, -0.08914069, 0, 0.2901961, 1, 1,
0.2853358, 0.575181, 0.5032219, 0, 0.2862745, 1, 1,
0.2857387, -0.3080253, 0.7964562, 0, 0.2784314, 1, 1,
0.2881083, 1.411577, -1.187909, 0, 0.2745098, 1, 1,
0.2884145, -0.4030561, 2.614177, 0, 0.2666667, 1, 1,
0.2914848, 0.3802264, 0.1983104, 0, 0.2627451, 1, 1,
0.2945723, -0.2019427, 2.83584, 0, 0.254902, 1, 1,
0.2961901, -0.6935696, 3.174262, 0, 0.2509804, 1, 1,
0.2984249, 0.3629552, 1.65666, 0, 0.2431373, 1, 1,
0.3008422, -1.176194, 3.153206, 0, 0.2392157, 1, 1,
0.3026638, -0.5410152, 4.103457, 0, 0.2313726, 1, 1,
0.3037254, 0.5566455, 1.108828, 0, 0.227451, 1, 1,
0.3073376, 0.1777394, 0.5921918, 0, 0.2196078, 1, 1,
0.3094744, -0.7244247, 1.57271, 0, 0.2156863, 1, 1,
0.3177981, -1.357548, 4.085335, 0, 0.2078431, 1, 1,
0.3187839, -0.1603626, 1.064734, 0, 0.2039216, 1, 1,
0.3244568, 0.5506898, 0.7742394, 0, 0.1960784, 1, 1,
0.3256474, 0.3065195, 0.2876141, 0, 0.1882353, 1, 1,
0.3269395, -0.9067943, 3.342594, 0, 0.1843137, 1, 1,
0.3289086, 1.707165, 0.4789556, 0, 0.1764706, 1, 1,
0.3320382, 0.1266685, 1.030011, 0, 0.172549, 1, 1,
0.333978, -1.170598, 4.135884, 0, 0.1647059, 1, 1,
0.3391262, -0.3013709, 2.075047, 0, 0.1607843, 1, 1,
0.339527, -0.8619501, 2.868364, 0, 0.1529412, 1, 1,
0.3397052, -0.2125317, 3.315722, 0, 0.1490196, 1, 1,
0.3412566, -1.554882, 2.995487, 0, 0.1411765, 1, 1,
0.3422134, 0.1993855, 0.6209418, 0, 0.1372549, 1, 1,
0.3444575, -0.9374955, 3.749946, 0, 0.1294118, 1, 1,
0.3461941, 1.721081, 0.2566765, 0, 0.1254902, 1, 1,
0.3483639, -2.047748, 4.044525, 0, 0.1176471, 1, 1,
0.3545705, 0.09893028, 2.015715, 0, 0.1137255, 1, 1,
0.3638555, -0.5217175, 2.274202, 0, 0.1058824, 1, 1,
0.3688958, 0.06037229, 0.7344623, 0, 0.09803922, 1, 1,
0.3705085, 0.6256118, -0.6159008, 0, 0.09411765, 1, 1,
0.3756715, -1.737579, 2.950328, 0, 0.08627451, 1, 1,
0.3775109, 1.864003, 0.9508239, 0, 0.08235294, 1, 1,
0.3801748, -1.263863, 4.172179, 0, 0.07450981, 1, 1,
0.3810255, 1.443328, -0.1608908, 0, 0.07058824, 1, 1,
0.3824156, -1.058866, 2.420314, 0, 0.0627451, 1, 1,
0.383588, -1.115981, 2.916658, 0, 0.05882353, 1, 1,
0.3853124, -1.379937, 4.102698, 0, 0.05098039, 1, 1,
0.3898449, 1.803232, -1.076912, 0, 0.04705882, 1, 1,
0.3907332, -0.4009186, -0.2472937, 0, 0.03921569, 1, 1,
0.4023995, -0.1060418, 2.927568, 0, 0.03529412, 1, 1,
0.4030045, 0.4511846, 2.123703, 0, 0.02745098, 1, 1,
0.4038954, 2.691242, 0.643793, 0, 0.02352941, 1, 1,
0.4068199, 0.6035832, 1.593159, 0, 0.01568628, 1, 1,
0.4071423, 0.2350152, 0.2774947, 0, 0.01176471, 1, 1,
0.4100797, -0.02234545, 2.02029, 0, 0.003921569, 1, 1,
0.4116127, 0.5438503, 1.421399, 0.003921569, 0, 1, 1,
0.413451, 0.2165276, 0.8903534, 0.007843138, 0, 1, 1,
0.4154461, -0.6033531, 2.140586, 0.01568628, 0, 1, 1,
0.4204287, 0.4560759, 0.2026602, 0.01960784, 0, 1, 1,
0.420457, -0.8755774, 2.772676, 0.02745098, 0, 1, 1,
0.4286269, -0.1864834, 1.512839, 0.03137255, 0, 1, 1,
0.4343508, 0.3346215, -0.8074774, 0.03921569, 0, 1, 1,
0.4366094, -1.947439, 4.723613, 0.04313726, 0, 1, 1,
0.4383509, 1.833243, -1.292823, 0.05098039, 0, 1, 1,
0.4401461, 0.9067981, 0.5907492, 0.05490196, 0, 1, 1,
0.4408548, 0.0272066, -1.505135, 0.0627451, 0, 1, 1,
0.4428883, 1.424937, 0.426859, 0.06666667, 0, 1, 1,
0.4442242, -0.2922764, 2.550466, 0.07450981, 0, 1, 1,
0.4470836, -1.189338, 3.682705, 0.07843138, 0, 1, 1,
0.4494521, -1.245949, 4.399281, 0.08627451, 0, 1, 1,
0.4518211, -0.6688666, 1.576505, 0.09019608, 0, 1, 1,
0.4521596, 0.0933852, -0.7428018, 0.09803922, 0, 1, 1,
0.4540576, 2.03525, -0.4480326, 0.1058824, 0, 1, 1,
0.4575568, -1.408963, 3.44302, 0.1098039, 0, 1, 1,
0.463279, 0.2336031, 1.119229, 0.1176471, 0, 1, 1,
0.4670897, 2.553735, -1.562152, 0.1215686, 0, 1, 1,
0.4695217, 0.4562909, -0.1433304, 0.1294118, 0, 1, 1,
0.4700054, 1.901002, 1.502095, 0.1333333, 0, 1, 1,
0.4723143, 0.5544598, 0.6086711, 0.1411765, 0, 1, 1,
0.4750049, 0.4998295, 0.7210405, 0.145098, 0, 1, 1,
0.4765267, 0.4817857, 0.2308071, 0.1529412, 0, 1, 1,
0.4812253, 1.319285, 0.5283417, 0.1568628, 0, 1, 1,
0.4853027, -0.3226595, 1.888515, 0.1647059, 0, 1, 1,
0.4870938, -0.5135574, 2.063476, 0.1686275, 0, 1, 1,
0.4878101, 0.6451181, -0.2017467, 0.1764706, 0, 1, 1,
0.4927458, 0.9687278, -0.02421018, 0.1803922, 0, 1, 1,
0.4932403, -0.7481095, 1.712852, 0.1882353, 0, 1, 1,
0.4946615, 0.2402274, 1.69976, 0.1921569, 0, 1, 1,
0.49499, 0.3531082, 0.02340127, 0.2, 0, 1, 1,
0.4955777, -0.3873969, 3.497715, 0.2078431, 0, 1, 1,
0.5009959, 1.435579, -0.06918269, 0.2117647, 0, 1, 1,
0.5085475, 1.173104, 0.7595394, 0.2196078, 0, 1, 1,
0.5093253, 0.771921, 0.0151437, 0.2235294, 0, 1, 1,
0.509745, 1.815205, 0.640146, 0.2313726, 0, 1, 1,
0.5136989, 0.1101474, 2.65684, 0.2352941, 0, 1, 1,
0.513839, -0.4760741, 1.457845, 0.2431373, 0, 1, 1,
0.5164849, 0.7224575, 2.191948, 0.2470588, 0, 1, 1,
0.5166367, 1.253903, -0.7058739, 0.254902, 0, 1, 1,
0.5217423, 0.9847013, -0.3842074, 0.2588235, 0, 1, 1,
0.5232874, -0.2138518, 0.9923055, 0.2666667, 0, 1, 1,
0.5253841, 0.196342, 0.3461202, 0.2705882, 0, 1, 1,
0.5260535, -0.1089702, 2.772599, 0.2784314, 0, 1, 1,
0.5282917, -1.716856, 4.632205, 0.282353, 0, 1, 1,
0.5290031, 0.2179206, -0.217609, 0.2901961, 0, 1, 1,
0.5329911, -1.612491, 3.139606, 0.2941177, 0, 1, 1,
0.5342163, 0.1476271, 1.334887, 0.3019608, 0, 1, 1,
0.541101, 0.4787761, 0.04879867, 0.3098039, 0, 1, 1,
0.5435176, -1.274446, 2.987999, 0.3137255, 0, 1, 1,
0.5508229, -0.9554076, 3.101184, 0.3215686, 0, 1, 1,
0.551127, -1.821614, 3.136181, 0.3254902, 0, 1, 1,
0.5513147, 0.7524834, 1.208138, 0.3333333, 0, 1, 1,
0.5519692, 0.4824169, 1.110527, 0.3372549, 0, 1, 1,
0.5655062, 0.3107871, 2.068164, 0.345098, 0, 1, 1,
0.5683855, 0.529642, 1.804874, 0.3490196, 0, 1, 1,
0.5696735, -1.13087, 1.72363, 0.3568628, 0, 1, 1,
0.571359, -1.312023, 2.081101, 0.3607843, 0, 1, 1,
0.5747802, 1.076369, 2.236428, 0.3686275, 0, 1, 1,
0.5753393, 0.07829514, 1.173675, 0.372549, 0, 1, 1,
0.5768138, -1.124512, 3.225205, 0.3803922, 0, 1, 1,
0.5813934, 1.889067, 0.6255755, 0.3843137, 0, 1, 1,
0.5825544, -0.4312043, 1.704215, 0.3921569, 0, 1, 1,
0.5894308, 0.4808465, 0.4682151, 0.3960784, 0, 1, 1,
0.5969646, -1.816286, 1.837122, 0.4039216, 0, 1, 1,
0.6031867, 0.3165917, 1.076371, 0.4117647, 0, 1, 1,
0.6032551, 0.341856, 2.498386, 0.4156863, 0, 1, 1,
0.6032824, -0.2817529, 2.369807, 0.4235294, 0, 1, 1,
0.6075322, -0.06299562, 2.352571, 0.427451, 0, 1, 1,
0.6106542, -0.09308058, 1.617974, 0.4352941, 0, 1, 1,
0.6147044, -0.2180069, 3.118285, 0.4392157, 0, 1, 1,
0.6201508, 1.382706, -0.7973012, 0.4470588, 0, 1, 1,
0.6213502, 0.4037104, 2.956205, 0.4509804, 0, 1, 1,
0.6255441, -1.605715, 0.8518448, 0.4588235, 0, 1, 1,
0.6314536, -0.7900636, 3.311337, 0.4627451, 0, 1, 1,
0.6343493, 0.3401788, 2.400702, 0.4705882, 0, 1, 1,
0.6345423, -1.150086, 2.880208, 0.4745098, 0, 1, 1,
0.63485, 0.01281136, 0.80188, 0.4823529, 0, 1, 1,
0.6356931, -0.4926758, 1.030938, 0.4862745, 0, 1, 1,
0.6360625, -0.7159834, 0.9367629, 0.4941176, 0, 1, 1,
0.6516908, 1.067871, 0.8464646, 0.5019608, 0, 1, 1,
0.6552564, 0.3634568, 1.334144, 0.5058824, 0, 1, 1,
0.6700382, -1.467736, 4.109684, 0.5137255, 0, 1, 1,
0.6710554, -1.646329, 3.444624, 0.5176471, 0, 1, 1,
0.6771141, -0.2915585, 3.551124, 0.5254902, 0, 1, 1,
0.6860989, 0.3926957, 1.149451, 0.5294118, 0, 1, 1,
0.6915665, 0.5172154, -0.2351249, 0.5372549, 0, 1, 1,
0.6921151, -0.08330626, 0.8280768, 0.5411765, 0, 1, 1,
0.6966953, 1.400322, 0.5115618, 0.5490196, 0, 1, 1,
0.6990287, 0.6574153, -0.1460464, 0.5529412, 0, 1, 1,
0.6995767, 1.235337, 1.643635, 0.5607843, 0, 1, 1,
0.7017467, -0.5622343, 1.734273, 0.5647059, 0, 1, 1,
0.7030331, 2.594493, 1.329082, 0.572549, 0, 1, 1,
0.7081324, -1.075849, 3.553023, 0.5764706, 0, 1, 1,
0.7109827, 0.3027116, 1.225794, 0.5843138, 0, 1, 1,
0.7123882, -1.354298, 3.385352, 0.5882353, 0, 1, 1,
0.7139902, -0.2172695, 1.702235, 0.5960785, 0, 1, 1,
0.7250187, -0.8361949, 4.3362, 0.6039216, 0, 1, 1,
0.7253201, -0.3111687, 4.168401, 0.6078432, 0, 1, 1,
0.7336985, 0.7720286, 0.9843084, 0.6156863, 0, 1, 1,
0.7376091, -2.265244, 3.361623, 0.6196079, 0, 1, 1,
0.7387805, -1.68676, 2.04569, 0.627451, 0, 1, 1,
0.7411563, -0.3365745, 3.177098, 0.6313726, 0, 1, 1,
0.7427021, -0.4096126, 2.398124, 0.6392157, 0, 1, 1,
0.7433705, -0.01672893, 2.052034, 0.6431373, 0, 1, 1,
0.7455665, -1.672324, 3.440668, 0.6509804, 0, 1, 1,
0.7484514, -0.2926145, 1.637118, 0.654902, 0, 1, 1,
0.7485676, -0.2983386, 2.680046, 0.6627451, 0, 1, 1,
0.7498872, -0.2285544, 0.5130912, 0.6666667, 0, 1, 1,
0.7506517, -0.2356918, 1.100536, 0.6745098, 0, 1, 1,
0.7515159, 0.01130502, 1.442639, 0.6784314, 0, 1, 1,
0.7534357, -0.3046203, 2.266983, 0.6862745, 0, 1, 1,
0.760652, 0.923744, 1.174711, 0.6901961, 0, 1, 1,
0.7643542, -1.144267, 2.504377, 0.6980392, 0, 1, 1,
0.7696545, -0.2587082, 1.232834, 0.7058824, 0, 1, 1,
0.7704243, -1.912012, 2.650689, 0.7098039, 0, 1, 1,
0.7728325, -1.897162, 3.162571, 0.7176471, 0, 1, 1,
0.7778664, -1.71643, 1.341008, 0.7215686, 0, 1, 1,
0.7783961, -0.9522304, 2.963926, 0.7294118, 0, 1, 1,
0.7830015, 1.15684, 0.9368032, 0.7333333, 0, 1, 1,
0.7834163, 3.190371, 0.8106847, 0.7411765, 0, 1, 1,
0.7843031, 0.9198632, 0.8320798, 0.7450981, 0, 1, 1,
0.7866755, 0.8001735, 0.2952594, 0.7529412, 0, 1, 1,
0.7883086, -1.538837, 4.173641, 0.7568628, 0, 1, 1,
0.7931961, -0.8683434, 3.488658, 0.7647059, 0, 1, 1,
0.7932969, 0.07821321, 2.970228, 0.7686275, 0, 1, 1,
0.794111, 2.035642, 0.07122374, 0.7764706, 0, 1, 1,
0.796389, 0.273284, 3.213534, 0.7803922, 0, 1, 1,
0.8033663, -1.601216, 2.489279, 0.7882353, 0, 1, 1,
0.8056953, -0.9437186, 2.915758, 0.7921569, 0, 1, 1,
0.8118088, 0.3860264, 2.87385, 0.8, 0, 1, 1,
0.8172547, 0.007114928, 0.5210093, 0.8078431, 0, 1, 1,
0.8218259, -1.374655, 1.301034, 0.8117647, 0, 1, 1,
0.8274352, 1.409385, 0.1854095, 0.8196079, 0, 1, 1,
0.8343908, -0.578432, 3.23337, 0.8235294, 0, 1, 1,
0.8365103, -0.9360946, 3.579827, 0.8313726, 0, 1, 1,
0.8468284, 0.1221659, 0.3662089, 0.8352941, 0, 1, 1,
0.847716, 1.540891, -0.5117285, 0.8431373, 0, 1, 1,
0.8482167, 1.53759, 0.8391867, 0.8470588, 0, 1, 1,
0.8482189, -1.348509, 1.777016, 0.854902, 0, 1, 1,
0.8532522, -0.8877016, 1.417829, 0.8588235, 0, 1, 1,
0.8577126, 0.5702685, 0.003818462, 0.8666667, 0, 1, 1,
0.863936, -0.5719405, 2.571121, 0.8705882, 0, 1, 1,
0.8656733, -0.595949, 3.110865, 0.8784314, 0, 1, 1,
0.8665803, 0.05217499, 0.3429278, 0.8823529, 0, 1, 1,
0.8685674, -0.1663732, 1.427286, 0.8901961, 0, 1, 1,
0.8694879, -1.575798, 1.810184, 0.8941177, 0, 1, 1,
0.8719438, -0.8662825, 3.374132, 0.9019608, 0, 1, 1,
0.8742349, -1.692193, 3.178766, 0.9098039, 0, 1, 1,
0.8751562, -1.968617, 3.136888, 0.9137255, 0, 1, 1,
0.8767232, -0.6083127, 2.600285, 0.9215686, 0, 1, 1,
0.8785813, -1.105686, 3.466269, 0.9254902, 0, 1, 1,
0.8881154, 1.442258, 0.005492733, 0.9333333, 0, 1, 1,
0.8896738, 0.4122766, 1.12591, 0.9372549, 0, 1, 1,
0.8944875, 1.151775, 0.9327056, 0.945098, 0, 1, 1,
0.8980516, -1.07039, 3.057656, 0.9490196, 0, 1, 1,
0.89979, -1.685667, 1.979601, 0.9568627, 0, 1, 1,
0.9005742, -0.01248333, 2.613316, 0.9607843, 0, 1, 1,
0.908484, 1.939247, -0.9509917, 0.9686275, 0, 1, 1,
0.910845, -0.9244941, 1.268195, 0.972549, 0, 1, 1,
0.9141132, 0.0605319, 1.469626, 0.9803922, 0, 1, 1,
0.9149431, 0.004517112, 1.45811, 0.9843137, 0, 1, 1,
0.9166784, -1.539084, 1.830992, 0.9921569, 0, 1, 1,
0.9192762, 0.2113789, 1.600154, 0.9960784, 0, 1, 1,
0.9215065, 0.8738472, -0.1711514, 1, 0, 0.9960784, 1,
0.9220538, -1.430953, 1.512459, 1, 0, 0.9882353, 1,
0.9240175, 0.4515584, 0.7458089, 1, 0, 0.9843137, 1,
0.9304323, -1.223017, 2.378901, 1, 0, 0.9764706, 1,
0.9348418, -0.02167061, 2.638369, 1, 0, 0.972549, 1,
0.935256, 0.3406705, 0.164816, 1, 0, 0.9647059, 1,
0.9404811, 0.5841743, 1.152773, 1, 0, 0.9607843, 1,
0.9497867, -0.2283215, 2.264128, 1, 0, 0.9529412, 1,
0.9560733, -1.161946, 1.57725, 1, 0, 0.9490196, 1,
0.9573862, 0.6642923, 0.9271321, 1, 0, 0.9411765, 1,
0.9645684, -0.9936657, 3.509085, 1, 0, 0.9372549, 1,
0.9647002, 1.861408, 0.02793829, 1, 0, 0.9294118, 1,
0.9704505, 0.6221406, 1.067423, 1, 0, 0.9254902, 1,
0.9778011, -0.9191475, 3.080243, 1, 0, 0.9176471, 1,
0.979052, 1.250633, 1.604844, 1, 0, 0.9137255, 1,
0.9832106, 0.2117947, 1.666073, 1, 0, 0.9058824, 1,
0.9841399, 0.7531844, 2.523792, 1, 0, 0.9019608, 1,
0.9843407, 0.9288229, 0.03400458, 1, 0, 0.8941177, 1,
0.9866522, 1.894859, -0.7715967, 1, 0, 0.8862745, 1,
0.9888597, 0.3743314, 0.03548623, 1, 0, 0.8823529, 1,
0.9915323, 1.002359, 0.4692577, 1, 0, 0.8745098, 1,
1.002959, 0.4637485, 3.104396, 1, 0, 0.8705882, 1,
1.005321, 2.084759, 0.8459231, 1, 0, 0.8627451, 1,
1.005603, 0.01071814, -0.1548592, 1, 0, 0.8588235, 1,
1.019115, -1.251582, 1.847068, 1, 0, 0.8509804, 1,
1.022696, -0.5351264, 2.145221, 1, 0, 0.8470588, 1,
1.022735, 0.3074549, 2.813368, 1, 0, 0.8392157, 1,
1.02667, 1.123506, 0.4793922, 1, 0, 0.8352941, 1,
1.034841, -1.166577, 0.8785403, 1, 0, 0.827451, 1,
1.035625, 0.06811585, 1.754872, 1, 0, 0.8235294, 1,
1.036055, -0.5930563, 3.220094, 1, 0, 0.8156863, 1,
1.040808, 0.6181427, 1.592604, 1, 0, 0.8117647, 1,
1.041522, -1.494476, 3.271024, 1, 0, 0.8039216, 1,
1.042392, 0.8062562, 0.4510932, 1, 0, 0.7960784, 1,
1.057905, 0.04971644, 1.981553, 1, 0, 0.7921569, 1,
1.060503, -0.0781133, -0.26704, 1, 0, 0.7843137, 1,
1.065337, 0.7135789, 1.21846, 1, 0, 0.7803922, 1,
1.084207, -0.3949143, 0.08130068, 1, 0, 0.772549, 1,
1.090789, 1.137755, 0.300208, 1, 0, 0.7686275, 1,
1.09092, 0.1319766, 2.416078, 1, 0, 0.7607843, 1,
1.091864, -0.2043113, 1.721198, 1, 0, 0.7568628, 1,
1.09402, -0.7549693, 2.139051, 1, 0, 0.7490196, 1,
1.09776, -0.6483348, 1.322218, 1, 0, 0.7450981, 1,
1.099613, -0.6164819, 1.416211, 1, 0, 0.7372549, 1,
1.100005, 1.102447, 1.152797, 1, 0, 0.7333333, 1,
1.105314, -0.3240264, 3.264462, 1, 0, 0.7254902, 1,
1.107177, 2.13974, 0.8754824, 1, 0, 0.7215686, 1,
1.110949, 1.430438, 1.468572, 1, 0, 0.7137255, 1,
1.118942, 1.014161, 1.991761, 1, 0, 0.7098039, 1,
1.135575, 1.164482, -0.3924577, 1, 0, 0.7019608, 1,
1.137089, 0.1477299, 0.8142823, 1, 0, 0.6941177, 1,
1.141819, 0.2838325, 0.5517595, 1, 0, 0.6901961, 1,
1.155683, 1.013342, 0.6568112, 1, 0, 0.682353, 1,
1.164387, 1.096437, 0.6087767, 1, 0, 0.6784314, 1,
1.166926, -0.002234459, 0.6627218, 1, 0, 0.6705883, 1,
1.170987, -0.7575502, 1.104301, 1, 0, 0.6666667, 1,
1.172244, 1.314552, 0.905275, 1, 0, 0.6588235, 1,
1.18058, 0.08068411, 3.458449, 1, 0, 0.654902, 1,
1.181842, 1.525908, 0.7564024, 1, 0, 0.6470588, 1,
1.190205, 0.1702456, 0.3263013, 1, 0, 0.6431373, 1,
1.204528, -1.468246, 3.491993, 1, 0, 0.6352941, 1,
1.205998, 0.6399019, 0.3450224, 1, 0, 0.6313726, 1,
1.21225, 0.3802045, 1.022945, 1, 0, 0.6235294, 1,
1.221713, -0.1939752, 2.632195, 1, 0, 0.6196079, 1,
1.234917, -0.3920446, 3.257933, 1, 0, 0.6117647, 1,
1.2452, 0.7448679, 0.01631098, 1, 0, 0.6078432, 1,
1.255191, -1.50194, 1.150735, 1, 0, 0.6, 1,
1.26267, 0.4880172, 2.46839, 1, 0, 0.5921569, 1,
1.26882, -1.927885, 1.808519, 1, 0, 0.5882353, 1,
1.270845, 1.340665, 0.3255687, 1, 0, 0.5803922, 1,
1.274312, -0.584479, -0.1465096, 1, 0, 0.5764706, 1,
1.281025, 0.0479906, 2.548794, 1, 0, 0.5686275, 1,
1.282155, -1.492146, 3.063457, 1, 0, 0.5647059, 1,
1.294674, -1.212414, 2.995061, 1, 0, 0.5568628, 1,
1.295923, 0.4233875, 2.447348, 1, 0, 0.5529412, 1,
1.297634, -0.02157442, 2.377018, 1, 0, 0.5450981, 1,
1.300494, -2.294727, 2.43187, 1, 0, 0.5411765, 1,
1.301403, 0.2248186, 1.79873, 1, 0, 0.5333334, 1,
1.317372, 1.785333, 0.2700511, 1, 0, 0.5294118, 1,
1.330661, -0.2737181, 4.192813, 1, 0, 0.5215687, 1,
1.34122, 1.119941, 1.046547, 1, 0, 0.5176471, 1,
1.357078, 1.429937, -0.7497145, 1, 0, 0.509804, 1,
1.358727, -0.6403475, 2.775507, 1, 0, 0.5058824, 1,
1.372655, -0.4232575, 1.560045, 1, 0, 0.4980392, 1,
1.382972, 0.4217479, 1.724698, 1, 0, 0.4901961, 1,
1.383648, 0.3546744, 0.3522187, 1, 0, 0.4862745, 1,
1.405475, 1.032774, 2.097076, 1, 0, 0.4784314, 1,
1.407768, 0.1518879, -0.5364246, 1, 0, 0.4745098, 1,
1.409094, 1.266268, 0.5796723, 1, 0, 0.4666667, 1,
1.410939, 0.6503183, 2.197351, 1, 0, 0.4627451, 1,
1.412762, -1.819743, 3.584999, 1, 0, 0.454902, 1,
1.419699, -0.8634749, 2.707135, 1, 0, 0.4509804, 1,
1.426275, -1.36586, 1.309984, 1, 0, 0.4431373, 1,
1.435004, -0.1488434, 1.618865, 1, 0, 0.4392157, 1,
1.43654, -0.2007086, 1.865895, 1, 0, 0.4313726, 1,
1.439019, -1.283675, 1.821528, 1, 0, 0.427451, 1,
1.44771, -0.8296964, 2.409187, 1, 0, 0.4196078, 1,
1.448611, -0.6993541, 1.37322, 1, 0, 0.4156863, 1,
1.45698, 0.7001484, 1.277397, 1, 0, 0.4078431, 1,
1.459773, 0.3970175, 0.3548467, 1, 0, 0.4039216, 1,
1.464037, 2.269809, 0.6952621, 1, 0, 0.3960784, 1,
1.465147, -0.480212, 1.015136, 1, 0, 0.3882353, 1,
1.470316, -0.7544581, -0.1410055, 1, 0, 0.3843137, 1,
1.484274, -1.550112, 2.480214, 1, 0, 0.3764706, 1,
1.495344, -1.652466, 3.708955, 1, 0, 0.372549, 1,
1.503372, -1.141352, 2.78487, 1, 0, 0.3647059, 1,
1.50418, -0.4894152, 1.411875, 1, 0, 0.3607843, 1,
1.518453, -2.638386, 3.067065, 1, 0, 0.3529412, 1,
1.519189, 0.8209069, 1.209227, 1, 0, 0.3490196, 1,
1.53577, 1.163148, 0.7315974, 1, 0, 0.3411765, 1,
1.539198, -0.8397368, 1.666226, 1, 0, 0.3372549, 1,
1.539506, 1.237842, 0.3947843, 1, 0, 0.3294118, 1,
1.545887, -0.6505278, 1.631583, 1, 0, 0.3254902, 1,
1.547758, 2.934098, -1.00732, 1, 0, 0.3176471, 1,
1.551026, 1.435052, 0.03675949, 1, 0, 0.3137255, 1,
1.551303, -0.9664664, 2.153545, 1, 0, 0.3058824, 1,
1.571059, 0.8294667, 2.130419, 1, 0, 0.2980392, 1,
1.574432, 1.549439, -0.1554517, 1, 0, 0.2941177, 1,
1.585882, 0.1429887, 1.037375, 1, 0, 0.2862745, 1,
1.599387, -1.471035, 4.726795, 1, 0, 0.282353, 1,
1.605572, -1.141111, 2.366879, 1, 0, 0.2745098, 1,
1.606709, -0.6315621, 1.528998, 1, 0, 0.2705882, 1,
1.610722, 0.8413516, 2.018479, 1, 0, 0.2627451, 1,
1.650428, -0.5497793, 3.284109, 1, 0, 0.2588235, 1,
1.659067, 0.8975793, 1.965975, 1, 0, 0.2509804, 1,
1.691991, -1.286826, 1.258752, 1, 0, 0.2470588, 1,
1.694097, -1.99804, 2.376646, 1, 0, 0.2392157, 1,
1.706967, 0.6210881, 3.00498, 1, 0, 0.2352941, 1,
1.718661, 0.2860003, 1.984447, 1, 0, 0.227451, 1,
1.740463, -0.3862681, 0.9579319, 1, 0, 0.2235294, 1,
1.742733, 0.1787488, 2.601517, 1, 0, 0.2156863, 1,
1.769168, 1.862453, 0.7672389, 1, 0, 0.2117647, 1,
1.780593, 0.9043348, 2.035087, 1, 0, 0.2039216, 1,
1.807967, 0.7088214, 2.710572, 1, 0, 0.1960784, 1,
1.811979, 0.1448513, 1.761298, 1, 0, 0.1921569, 1,
1.815166, -0.2773589, -0.7437867, 1, 0, 0.1843137, 1,
1.850652, 0.2056511, 0.5686192, 1, 0, 0.1803922, 1,
1.872399, -0.0797879, 1.930612, 1, 0, 0.172549, 1,
1.873816, -1.14821, 0.5434611, 1, 0, 0.1686275, 1,
1.898549, 2.425307, 1.683939, 1, 0, 0.1607843, 1,
1.943151, -1.614328, 1.320084, 1, 0, 0.1568628, 1,
1.966154, 0.09712773, 3.003195, 1, 0, 0.1490196, 1,
1.97272, -0.9518945, 1.336127, 1, 0, 0.145098, 1,
1.972942, 0.5102204, 0.9990187, 1, 0, 0.1372549, 1,
1.999299, 1.736876, 1.223048, 1, 0, 0.1333333, 1,
2.006085, -0.1621307, 1.93765, 1, 0, 0.1254902, 1,
2.050558, 2.138519, 0.654045, 1, 0, 0.1215686, 1,
2.105638, 0.6449932, 1.878033, 1, 0, 0.1137255, 1,
2.125455, -1.700718, 1.595371, 1, 0, 0.1098039, 1,
2.142443, 1.55691, 0.2855055, 1, 0, 0.1019608, 1,
2.152201, -0.9190758, -0.318142, 1, 0, 0.09411765, 1,
2.198417, 0.1617559, 2.224643, 1, 0, 0.09019608, 1,
2.22638, -0.05126015, 0.9702879, 1, 0, 0.08235294, 1,
2.243854, 0.2784499, -0.1961197, 1, 0, 0.07843138, 1,
2.258287, -0.08316337, 1.471464, 1, 0, 0.07058824, 1,
2.280243, 0.605176, 1.340475, 1, 0, 0.06666667, 1,
2.312241, -0.8549243, 0.7521785, 1, 0, 0.05882353, 1,
2.377997, -0.8047536, 3.087822, 1, 0, 0.05490196, 1,
2.387729, -1.175177, 0.6660928, 1, 0, 0.04705882, 1,
2.392992, 0.1059892, 2.198916, 1, 0, 0.04313726, 1,
2.540744, -0.3659347, 3.380309, 1, 0, 0.03529412, 1,
2.649395, -2.627818, 2.665058, 1, 0, 0.03137255, 1,
2.652294, -0.1906552, 2.3554, 1, 0, 0.02352941, 1,
2.676028, 1.908448, -0.2012741, 1, 0, 0.01960784, 1,
2.722508, 0.2814985, 1.3677, 1, 0, 0.01176471, 1,
3.166234, -0.05813278, 1.494946, 1, 0, 0.007843138, 1
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
0.01792097, -4.51421, -7.434799, 0, -0.5, 0.5, 0.5,
0.01792097, -4.51421, -7.434799, 1, -0.5, 0.5, 0.5,
0.01792097, -4.51421, -7.434799, 1, 1.5, 0.5, 0.5,
0.01792097, -4.51421, -7.434799, 0, 1.5, 0.5, 0.5
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
-4.19767, 0.1850123, -7.434799, 0, -0.5, 0.5, 0.5,
-4.19767, 0.1850123, -7.434799, 1, -0.5, 0.5, 0.5,
-4.19767, 0.1850123, -7.434799, 1, 1.5, 0.5, 0.5,
-4.19767, 0.1850123, -7.434799, 0, 1.5, 0.5, 0.5
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
-4.19767, -4.51421, 0.2583275, 0, -0.5, 0.5, 0.5,
-4.19767, -4.51421, 0.2583275, 1, -0.5, 0.5, 0.5,
-4.19767, -4.51421, 0.2583275, 1, 1.5, 0.5, 0.5,
-4.19767, -4.51421, 0.2583275, 0, 1.5, 0.5, 0.5
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
-3, -3.429774, -5.659462,
3, -3.429774, -5.659462,
-3, -3.429774, -5.659462,
-3, -3.610513, -5.955351,
-2, -3.429774, -5.659462,
-2, -3.610513, -5.955351,
-1, -3.429774, -5.659462,
-1, -3.610513, -5.955351,
0, -3.429774, -5.659462,
0, -3.610513, -5.955351,
1, -3.429774, -5.659462,
1, -3.610513, -5.955351,
2, -3.429774, -5.659462,
2, -3.610513, -5.955351,
3, -3.429774, -5.659462,
3, -3.610513, -5.955351
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
-3, -3.971992, -6.547131, 0, -0.5, 0.5, 0.5,
-3, -3.971992, -6.547131, 1, -0.5, 0.5, 0.5,
-3, -3.971992, -6.547131, 1, 1.5, 0.5, 0.5,
-3, -3.971992, -6.547131, 0, 1.5, 0.5, 0.5,
-2, -3.971992, -6.547131, 0, -0.5, 0.5, 0.5,
-2, -3.971992, -6.547131, 1, -0.5, 0.5, 0.5,
-2, -3.971992, -6.547131, 1, 1.5, 0.5, 0.5,
-2, -3.971992, -6.547131, 0, 1.5, 0.5, 0.5,
-1, -3.971992, -6.547131, 0, -0.5, 0.5, 0.5,
-1, -3.971992, -6.547131, 1, -0.5, 0.5, 0.5,
-1, -3.971992, -6.547131, 1, 1.5, 0.5, 0.5,
-1, -3.971992, -6.547131, 0, 1.5, 0.5, 0.5,
0, -3.971992, -6.547131, 0, -0.5, 0.5, 0.5,
0, -3.971992, -6.547131, 1, -0.5, 0.5, 0.5,
0, -3.971992, -6.547131, 1, 1.5, 0.5, 0.5,
0, -3.971992, -6.547131, 0, 1.5, 0.5, 0.5,
1, -3.971992, -6.547131, 0, -0.5, 0.5, 0.5,
1, -3.971992, -6.547131, 1, -0.5, 0.5, 0.5,
1, -3.971992, -6.547131, 1, 1.5, 0.5, 0.5,
1, -3.971992, -6.547131, 0, 1.5, 0.5, 0.5,
2, -3.971992, -6.547131, 0, -0.5, 0.5, 0.5,
2, -3.971992, -6.547131, 1, -0.5, 0.5, 0.5,
2, -3.971992, -6.547131, 1, 1.5, 0.5, 0.5,
2, -3.971992, -6.547131, 0, 1.5, 0.5, 0.5,
3, -3.971992, -6.547131, 0, -0.5, 0.5, 0.5,
3, -3.971992, -6.547131, 1, -0.5, 0.5, 0.5,
3, -3.971992, -6.547131, 1, 1.5, 0.5, 0.5,
3, -3.971992, -6.547131, 0, 1.5, 0.5, 0.5
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
-3.224841, -2, -5.659462,
-3.224841, 2, -5.659462,
-3.224841, -2, -5.659462,
-3.38698, -2, -5.955351,
-3.224841, 0, -5.659462,
-3.38698, 0, -5.955351,
-3.224841, 2, -5.659462,
-3.38698, 2, -5.955351
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
-3.711256, -2, -6.547131, 0, -0.5, 0.5, 0.5,
-3.711256, -2, -6.547131, 1, -0.5, 0.5, 0.5,
-3.711256, -2, -6.547131, 1, 1.5, 0.5, 0.5,
-3.711256, -2, -6.547131, 0, 1.5, 0.5, 0.5,
-3.711256, 0, -6.547131, 0, -0.5, 0.5, 0.5,
-3.711256, 0, -6.547131, 1, -0.5, 0.5, 0.5,
-3.711256, 0, -6.547131, 1, 1.5, 0.5, 0.5,
-3.711256, 0, -6.547131, 0, 1.5, 0.5, 0.5,
-3.711256, 2, -6.547131, 0, -0.5, 0.5, 0.5,
-3.711256, 2, -6.547131, 1, -0.5, 0.5, 0.5,
-3.711256, 2, -6.547131, 1, 1.5, 0.5, 0.5,
-3.711256, 2, -6.547131, 0, 1.5, 0.5, 0.5
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
-3.224841, -3.429774, -4,
-3.224841, -3.429774, 6,
-3.224841, -3.429774, -4,
-3.38698, -3.610513, -4,
-3.224841, -3.429774, -2,
-3.38698, -3.610513, -2,
-3.224841, -3.429774, 0,
-3.38698, -3.610513, 0,
-3.224841, -3.429774, 2,
-3.38698, -3.610513, 2,
-3.224841, -3.429774, 4,
-3.38698, -3.610513, 4,
-3.224841, -3.429774, 6,
-3.38698, -3.610513, 6
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
-3.711256, -3.971992, -4, 0, -0.5, 0.5, 0.5,
-3.711256, -3.971992, -4, 1, -0.5, 0.5, 0.5,
-3.711256, -3.971992, -4, 1, 1.5, 0.5, 0.5,
-3.711256, -3.971992, -4, 0, 1.5, 0.5, 0.5,
-3.711256, -3.971992, -2, 0, -0.5, 0.5, 0.5,
-3.711256, -3.971992, -2, 1, -0.5, 0.5, 0.5,
-3.711256, -3.971992, -2, 1, 1.5, 0.5, 0.5,
-3.711256, -3.971992, -2, 0, 1.5, 0.5, 0.5,
-3.711256, -3.971992, 0, 0, -0.5, 0.5, 0.5,
-3.711256, -3.971992, 0, 1, -0.5, 0.5, 0.5,
-3.711256, -3.971992, 0, 1, 1.5, 0.5, 0.5,
-3.711256, -3.971992, 0, 0, 1.5, 0.5, 0.5,
-3.711256, -3.971992, 2, 0, -0.5, 0.5, 0.5,
-3.711256, -3.971992, 2, 1, -0.5, 0.5, 0.5,
-3.711256, -3.971992, 2, 1, 1.5, 0.5, 0.5,
-3.711256, -3.971992, 2, 0, 1.5, 0.5, 0.5,
-3.711256, -3.971992, 4, 0, -0.5, 0.5, 0.5,
-3.711256, -3.971992, 4, 1, -0.5, 0.5, 0.5,
-3.711256, -3.971992, 4, 1, 1.5, 0.5, 0.5,
-3.711256, -3.971992, 4, 0, 1.5, 0.5, 0.5,
-3.711256, -3.971992, 6, 0, -0.5, 0.5, 0.5,
-3.711256, -3.971992, 6, 1, -0.5, 0.5, 0.5,
-3.711256, -3.971992, 6, 1, 1.5, 0.5, 0.5,
-3.711256, -3.971992, 6, 0, 1.5, 0.5, 0.5
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
-3.224841, -3.429774, -5.659462,
-3.224841, 3.799798, -5.659462,
-3.224841, -3.429774, 6.176117,
-3.224841, 3.799798, 6.176117,
-3.224841, -3.429774, -5.659462,
-3.224841, -3.429774, 6.176117,
-3.224841, 3.799798, -5.659462,
-3.224841, 3.799798, 6.176117,
-3.224841, -3.429774, -5.659462,
3.260683, -3.429774, -5.659462,
-3.224841, -3.429774, 6.176117,
3.260683, -3.429774, 6.176117,
-3.224841, 3.799798, -5.659462,
3.260683, 3.799798, -5.659462,
-3.224841, 3.799798, 6.176117,
3.260683, 3.799798, 6.176117,
3.260683, -3.429774, -5.659462,
3.260683, 3.799798, -5.659462,
3.260683, -3.429774, 6.176117,
3.260683, 3.799798, 6.176117,
3.260683, -3.429774, -5.659462,
3.260683, -3.429774, 6.176117,
3.260683, 3.799798, -5.659462,
3.260683, 3.799798, 6.176117
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
var radius = 8.175479;
var distance = 36.37363;
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
mvMatrix.translate( -0.01792097, -0.1850123, -0.2583275 );
mvMatrix.scale( 1.362957, 1.222685, 0.7468573 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.37363);
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
unden<-read.table("unden.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-unden$V2
```

```
## Error in eval(expr, envir, enclos): object 'unden' not found
```

```r
y<-unden$V3
```

```
## Error in eval(expr, envir, enclos): object 'unden' not found
```

```r
z<-unden$V4
```

```
## Error in eval(expr, envir, enclos): object 'unden' not found
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
-3.130392, 2.849455, -2.176521, 0, 0, 1, 1, 1,
-2.919331, -1.339707, -1.642866, 1, 0, 0, 1, 1,
-2.763167, 1.131948, 0.7787822, 1, 0, 0, 1, 1,
-2.637403, -1.288179, -1.8345, 1, 0, 0, 1, 1,
-2.544013, -1.627341, -3.614693, 1, 0, 0, 1, 1,
-2.501018, -0.8696996, -3.085906, 1, 0, 0, 1, 1,
-2.404464, 1.205137, 0.6824446, 0, 0, 0, 1, 1,
-2.370252, 0.5928525, -2.233101, 0, 0, 0, 1, 1,
-2.325958, -0.08779486, -2.039118, 0, 0, 0, 1, 1,
-2.262045, 0.5037208, -2.234435, 0, 0, 0, 1, 1,
-2.247663, -0.8691862, -0.997372, 0, 0, 0, 1, 1,
-2.232929, 1.33612, -0.595898, 0, 0, 0, 1, 1,
-2.215559, -0.05301979, -1.325989, 0, 0, 0, 1, 1,
-2.199809, 0.433379, -1.287042, 1, 1, 1, 1, 1,
-2.162484, 0.895193, 0.6851933, 1, 1, 1, 1, 1,
-2.158858, -0.5590013, -2.18011, 1, 1, 1, 1, 1,
-2.142039, 0.774961, -0.8386052, 1, 1, 1, 1, 1,
-2.119349, -1.135902, -2.398605, 1, 1, 1, 1, 1,
-2.106104, -0.4364678, -0.545441, 1, 1, 1, 1, 1,
-2.077189, 0.1509504, -1.015448, 1, 1, 1, 1, 1,
-2.058008, -1.049205, -2.141483, 1, 1, 1, 1, 1,
-2.052273, -0.8124502, -2.859227, 1, 1, 1, 1, 1,
-2.051068, 1.104003, -1.836913, 1, 1, 1, 1, 1,
-1.993993, 1.613766, 0.3539222, 1, 1, 1, 1, 1,
-1.992741, -1.223258, -1.972012, 1, 1, 1, 1, 1,
-1.977228, 0.4778036, -1.567572, 1, 1, 1, 1, 1,
-1.972517, 0.6162522, -0.8312521, 1, 1, 1, 1, 1,
-1.965646, 3.694514, -0.6102087, 1, 1, 1, 1, 1,
-1.962836, 0.479276, 0.150611, 0, 0, 1, 1, 1,
-1.960178, 0.02420691, -1.803831, 1, 0, 0, 1, 1,
-1.955803, -0.8400102, -1.633161, 1, 0, 0, 1, 1,
-1.940098, 0.3996061, -1.115188, 1, 0, 0, 1, 1,
-1.896776, 0.7290026, 0.1593079, 1, 0, 0, 1, 1,
-1.857241, -0.6326138, -2.701065, 1, 0, 0, 1, 1,
-1.807816, 1.430535, -0.9391436, 0, 0, 0, 1, 1,
-1.80091, -0.5577901, 0.2530423, 0, 0, 0, 1, 1,
-1.796941, -0.07151922, -1.126632, 0, 0, 0, 1, 1,
-1.784794, -2.510018, -2.80432, 0, 0, 0, 1, 1,
-1.768456, -0.3775384, -1.996319, 0, 0, 0, 1, 1,
-1.750679, 1.288416, 0.3848732, 0, 0, 0, 1, 1,
-1.747315, -0.2544111, -2.329544, 0, 0, 0, 1, 1,
-1.73811, 1.965731, -1.332783, 1, 1, 1, 1, 1,
-1.730734, 0.8901381, -0.5225149, 1, 1, 1, 1, 1,
-1.72305, -0.6500589, -2.715984, 1, 1, 1, 1, 1,
-1.722984, 0.2363808, -0.6983676, 1, 1, 1, 1, 1,
-1.702322, 1.962638, -2.373141, 1, 1, 1, 1, 1,
-1.701405, -0.5630409, -1.341648, 1, 1, 1, 1, 1,
-1.688285, -0.8571696, -3.883675, 1, 1, 1, 1, 1,
-1.664726, -0.9025444, -1.525512, 1, 1, 1, 1, 1,
-1.634182, -1.421968, -2.051877, 1, 1, 1, 1, 1,
-1.629676, 0.6521341, -1.797606, 1, 1, 1, 1, 1,
-1.619179, -0.5592781, -1.854173, 1, 1, 1, 1, 1,
-1.613374, -0.4386516, -2.394919, 1, 1, 1, 1, 1,
-1.604039, -0.557615, -0.404926, 1, 1, 1, 1, 1,
-1.589586, -0.484202, -2.717129, 1, 1, 1, 1, 1,
-1.582925, -0.2104682, -2.428666, 1, 1, 1, 1, 1,
-1.582223, 1.610898, -1.005238, 0, 0, 1, 1, 1,
-1.569062, -1.486719, -3.719465, 1, 0, 0, 1, 1,
-1.565493, -1.562557, -2.977262, 1, 0, 0, 1, 1,
-1.560618, 1.796397, -0.9576402, 1, 0, 0, 1, 1,
-1.560019, -0.6707055, -1.402533, 1, 0, 0, 1, 1,
-1.533893, 0.8260193, 0.933718, 1, 0, 0, 1, 1,
-1.523274, -0.418568, -1.893272, 0, 0, 0, 1, 1,
-1.518914, -2.91053, -2.160588, 0, 0, 0, 1, 1,
-1.516845, 0.02246511, -2.275522, 0, 0, 0, 1, 1,
-1.515567, -0.8633187, -1.870389, 0, 0, 0, 1, 1,
-1.513084, 1.300092, -0.2217385, 0, 0, 0, 1, 1,
-1.509961, 1.184089, -0.6731033, 0, 0, 0, 1, 1,
-1.508418, 0.1708896, -2.49089, 0, 0, 0, 1, 1,
-1.503029, -1.821576, -2.12289, 1, 1, 1, 1, 1,
-1.490237, 1.217313, -1.656809, 1, 1, 1, 1, 1,
-1.484645, -0.1033042, -2.245376, 1, 1, 1, 1, 1,
-1.483881, -0.1956457, -2.660357, 1, 1, 1, 1, 1,
-1.478785, 1.328298, -0.2012347, 1, 1, 1, 1, 1,
-1.474042, -1.990051, -0.6600331, 1, 1, 1, 1, 1,
-1.465456, 0.1509549, -0.6611006, 1, 1, 1, 1, 1,
-1.461786, -1.981192, -4.836669, 1, 1, 1, 1, 1,
-1.458895, -0.1925989, -2.287677, 1, 1, 1, 1, 1,
-1.45637, -1.028805, -2.130165, 1, 1, 1, 1, 1,
-1.432493, -0.5481157, 0.1553237, 1, 1, 1, 1, 1,
-1.420796, -0.6594656, -2.426346, 1, 1, 1, 1, 1,
-1.420043, 0.24774, -1.815519, 1, 1, 1, 1, 1,
-1.418304, 0.5022186, -1.121598, 1, 1, 1, 1, 1,
-1.407261, -0.9490319, -2.189241, 1, 1, 1, 1, 1,
-1.405329, -0.5372243, -1.931884, 0, 0, 1, 1, 1,
-1.405295, -0.6443088, -1.480584, 1, 0, 0, 1, 1,
-1.391749, 0.1712215, -1.713993, 1, 0, 0, 1, 1,
-1.384655, -1.994432, -2.746147, 1, 0, 0, 1, 1,
-1.380618, 0.08326293, -1.606869, 1, 0, 0, 1, 1,
-1.377837, 1.871918, 1.080062, 1, 0, 0, 1, 1,
-1.368304, 0.1759306, -0.04235892, 0, 0, 0, 1, 1,
-1.367813, 1.349841, -0.4073354, 0, 0, 0, 1, 1,
-1.350803, 0.1534696, -1.388827, 0, 0, 0, 1, 1,
-1.346507, -0.8305401, -1.376849, 0, 0, 0, 1, 1,
-1.335577, -1.005835, -2.975279, 0, 0, 0, 1, 1,
-1.333257, -0.616098, -2.371866, 0, 0, 0, 1, 1,
-1.320111, -1.315949, -2.074821, 0, 0, 0, 1, 1,
-1.308368, 0.4202504, -1.163713, 1, 1, 1, 1, 1,
-1.294418, -0.1491679, -2.787021, 1, 1, 1, 1, 1,
-1.288981, -0.1681921, -1.943585, 1, 1, 1, 1, 1,
-1.28218, -0.3449655, -2.738449, 1, 1, 1, 1, 1,
-1.269741, 0.6202534, -1.833496, 1, 1, 1, 1, 1,
-1.267505, 1.031718, -0.3905473, 1, 1, 1, 1, 1,
-1.266603, -1.135411, -2.656265, 1, 1, 1, 1, 1,
-1.262085, 1.676728, -0.8896777, 1, 1, 1, 1, 1,
-1.25525, -0.7149379, -1.447731, 1, 1, 1, 1, 1,
-1.249364, -0.2328216, -2.909908, 1, 1, 1, 1, 1,
-1.244505, -0.3346689, -2.181275, 1, 1, 1, 1, 1,
-1.239606, 1.595741, -0.4492207, 1, 1, 1, 1, 1,
-1.236339, -0.6216936, -1.731416, 1, 1, 1, 1, 1,
-1.230692, -0.3604833, -1.068432, 1, 1, 1, 1, 1,
-1.229416, -0.4823618, -1.600779, 1, 1, 1, 1, 1,
-1.222453, -0.89496, -1.228671, 0, 0, 1, 1, 1,
-1.218761, -0.8173192, -2.429185, 1, 0, 0, 1, 1,
-1.216957, -0.4143141, -3.78458, 1, 0, 0, 1, 1,
-1.196216, -0.9065927, -2.482537, 1, 0, 0, 1, 1,
-1.189317, 0.5697697, 0.1926285, 1, 0, 0, 1, 1,
-1.186376, 0.2174275, -1.811538, 1, 0, 0, 1, 1,
-1.183213, 0.5986159, 0.174981, 0, 0, 0, 1, 1,
-1.170146, 0.5289494, -2.271323, 0, 0, 0, 1, 1,
-1.168911, -0.9218716, -2.293438, 0, 0, 0, 1, 1,
-1.154255, -1.978309, -2.788679, 0, 0, 0, 1, 1,
-1.126669, 1.814869, -0.8154108, 0, 0, 0, 1, 1,
-1.119479, -2.297986, -2.066705, 0, 0, 0, 1, 1,
-1.110594, 0.3528447, -1.816541, 0, 0, 0, 1, 1,
-1.101585, 0.714968, -0.593463, 1, 1, 1, 1, 1,
-1.099092, 0.2174111, -1.546763, 1, 1, 1, 1, 1,
-1.091792, -0.3733646, -3.025551, 1, 1, 1, 1, 1,
-1.090292, 0.8281897, -0.7635212, 1, 1, 1, 1, 1,
-1.088467, -0.3981665, -0.8691381, 1, 1, 1, 1, 1,
-1.07897, -1.179948, -2.448301, 1, 1, 1, 1, 1,
-1.073598, -0.7079279, -1.664297, 1, 1, 1, 1, 1,
-1.072296, -0.03706286, -0.7673795, 1, 1, 1, 1, 1,
-1.070823, -1.15218, -3.228083, 1, 1, 1, 1, 1,
-1.070235, -0.2651931, -1.923441, 1, 1, 1, 1, 1,
-1.069506, -0.2897983, -2.556871, 1, 1, 1, 1, 1,
-1.06579, -0.3993183, -0.9673554, 1, 1, 1, 1, 1,
-1.062711, 0.4131494, -0.196912, 1, 1, 1, 1, 1,
-1.059823, 1.303972, -0.05227302, 1, 1, 1, 1, 1,
-1.059348, -2.259491, -1.859734, 1, 1, 1, 1, 1,
-1.057719, -0.3440165, -1.066434, 0, 0, 1, 1, 1,
-1.049895, 0.8004713, -1.692911, 1, 0, 0, 1, 1,
-1.048762, -0.8046178, -1.340522, 1, 0, 0, 1, 1,
-1.035969, -1.700925, -2.338712, 1, 0, 0, 1, 1,
-1.029178, -0.5246196, -1.670285, 1, 0, 0, 1, 1,
-1.028221, -1.177152, -2.227331, 1, 0, 0, 1, 1,
-1.025113, 0.09638217, -1.662701, 0, 0, 0, 1, 1,
-1.017905, 0.1365987, -0.5010977, 0, 0, 0, 1, 1,
-1.003255, 1.49751, -0.1016656, 0, 0, 0, 1, 1,
-1.001168, 0.9541432, -0.565207, 0, 0, 0, 1, 1,
-1.000561, -1.025409, -2.601955, 0, 0, 0, 1, 1,
-0.9986288, 0.1013011, -0.4357525, 0, 0, 0, 1, 1,
-0.9968697, 0.7145141, -0.2390932, 0, 0, 0, 1, 1,
-0.992337, 0.3353145, -2.285918, 1, 1, 1, 1, 1,
-0.9777178, -0.4808349, -2.539477, 1, 1, 1, 1, 1,
-0.9745607, -1.955871, -2.842017, 1, 1, 1, 1, 1,
-0.974255, 2.458393, 0.4097411, 1, 1, 1, 1, 1,
-0.9713246, -0.02711459, -2.440224, 1, 1, 1, 1, 1,
-0.9680139, -0.6378064, -1.464398, 1, 1, 1, 1, 1,
-0.9352414, 0.7063906, 0.4111383, 1, 1, 1, 1, 1,
-0.9317259, 1.436075, 0.4592806, 1, 1, 1, 1, 1,
-0.930983, -0.2769288, -1.854963, 1, 1, 1, 1, 1,
-0.9299827, -0.9306682, -4.012918, 1, 1, 1, 1, 1,
-0.9289461, -0.2700861, -1.447256, 1, 1, 1, 1, 1,
-0.9279317, -1.663287, -3.62404, 1, 1, 1, 1, 1,
-0.9269947, 0.1759581, -1.478375, 1, 1, 1, 1, 1,
-0.9259883, 1.412743, -2.517937, 1, 1, 1, 1, 1,
-0.9240268, 0.4470256, -0.1152004, 1, 1, 1, 1, 1,
-0.9139823, -0.2389302, -0.9413222, 0, 0, 1, 1, 1,
-0.9084217, 0.6756906, -0.9535843, 1, 0, 0, 1, 1,
-0.9080914, 0.6001266, -1.093986, 1, 0, 0, 1, 1,
-0.9050896, 1.144401, -1.660994, 1, 0, 0, 1, 1,
-0.9047325, 0.05641125, -1.685405, 1, 0, 0, 1, 1,
-0.8950294, 0.4046021, -1.323237, 1, 0, 0, 1, 1,
-0.8948267, -0.7287031, -1.443455, 0, 0, 0, 1, 1,
-0.8919834, 0.6623315, -1.814994, 0, 0, 0, 1, 1,
-0.891899, -0.7154155, -0.651355, 0, 0, 0, 1, 1,
-0.8901798, -0.1862175, -1.601122, 0, 0, 0, 1, 1,
-0.8860164, -0.06175223, 0.4321304, 0, 0, 0, 1, 1,
-0.8858277, 0.5375946, -1.072633, 0, 0, 0, 1, 1,
-0.8803856, -1.332627, -4.005915, 0, 0, 0, 1, 1,
-0.8788037, 0.05492949, -0.4553261, 1, 1, 1, 1, 1,
-0.8761842, -1.080638, -2.884083, 1, 1, 1, 1, 1,
-0.8742281, 0.7326463, 0.9689603, 1, 1, 1, 1, 1,
-0.8695129, 1.401411, -0.4036464, 1, 1, 1, 1, 1,
-0.8675758, 1.859542, -0.6468323, 1, 1, 1, 1, 1,
-0.8609186, -1.74229, -3.071503, 1, 1, 1, 1, 1,
-0.8522085, -1.13594, -1.985549, 1, 1, 1, 1, 1,
-0.8521622, 0.5747678, -0.2085987, 1, 1, 1, 1, 1,
-0.8437158, -0.4310978, -1.272408, 1, 1, 1, 1, 1,
-0.8430734, 1.307144, -0.5797801, 1, 1, 1, 1, 1,
-0.8358228, -0.1975465, -1.336057, 1, 1, 1, 1, 1,
-0.8346425, -0.3012275, -3.711939, 1, 1, 1, 1, 1,
-0.832285, 2.263868, -2.658406, 1, 1, 1, 1, 1,
-0.8307298, -0.4726764, -2.309632, 1, 1, 1, 1, 1,
-0.8246028, -0.889845, -1.304277, 1, 1, 1, 1, 1,
-0.8192073, -3.324489, -2.880246, 0, 0, 1, 1, 1,
-0.8171853, -2.91983, -5.228247, 1, 0, 0, 1, 1,
-0.815397, 0.6428273, 0.7086791, 1, 0, 0, 1, 1,
-0.8151147, 0.4955382, -0.1597241, 1, 0, 0, 1, 1,
-0.8118758, -0.9322035, -2.054446, 1, 0, 0, 1, 1,
-0.8109518, 0.3023367, -1.883577, 1, 0, 0, 1, 1,
-0.8094901, 0.2118815, -1.16941, 0, 0, 0, 1, 1,
-0.8035355, -0.4615042, -3.088439, 0, 0, 0, 1, 1,
-0.8012539, 1.638878, 0.8161585, 0, 0, 0, 1, 1,
-0.7983188, -0.2658057, -1.031358, 0, 0, 0, 1, 1,
-0.7963899, 0.2119508, -3.177146, 0, 0, 0, 1, 1,
-0.7958912, -1.046554, -2.856083, 0, 0, 0, 1, 1,
-0.7948822, 1.863689, 0.4174416, 0, 0, 0, 1, 1,
-0.7930341, -1.359926, -1.953522, 1, 1, 1, 1, 1,
-0.7844472, 0.154935, -3.337247, 1, 1, 1, 1, 1,
-0.7801051, 0.6004, -1.090511, 1, 1, 1, 1, 1,
-0.777552, 1.882006, -0.9328158, 1, 1, 1, 1, 1,
-0.7669079, 0.645016, 0.4775835, 1, 1, 1, 1, 1,
-0.7654973, -1.866233, -2.655035, 1, 1, 1, 1, 1,
-0.7646925, 0.9903593, -0.5822952, 1, 1, 1, 1, 1,
-0.7626773, -0.06768256, -1.824484, 1, 1, 1, 1, 1,
-0.7588977, 0.5728068, -1.924057, 1, 1, 1, 1, 1,
-0.7572498, -0.5659789, -3.054822, 1, 1, 1, 1, 1,
-0.7548099, -1.753089, -4.65543, 1, 1, 1, 1, 1,
-0.7520336, 0.3574754, -1.923023, 1, 1, 1, 1, 1,
-0.7519794, 0.2273609, -2.771836, 1, 1, 1, 1, 1,
-0.7506092, -1.471961, -3.174114, 1, 1, 1, 1, 1,
-0.7453882, 1.387854, -0.6156278, 1, 1, 1, 1, 1,
-0.7367932, 0.004035342, -1.215937, 0, 0, 1, 1, 1,
-0.7327637, -1.227555, -4.759267, 1, 0, 0, 1, 1,
-0.7324072, 1.519232, -0.8578596, 1, 0, 0, 1, 1,
-0.7298834, -0.2942547, -3.581249, 1, 0, 0, 1, 1,
-0.7259238, -0.4692693, -2.630699, 1, 0, 0, 1, 1,
-0.7252966, 0.4521223, -0.633352, 1, 0, 0, 1, 1,
-0.723864, 0.3810028, -1.103925, 0, 0, 0, 1, 1,
-0.7225241, -0.949715, -3.684731, 0, 0, 0, 1, 1,
-0.7204456, 0.8408055, -0.5630655, 0, 0, 0, 1, 1,
-0.7197572, -0.2597753, -2.017206, 0, 0, 0, 1, 1,
-0.7153773, -0.2151069, -2.149907, 0, 0, 0, 1, 1,
-0.7126238, 1.21825, -1.718674, 0, 0, 0, 1, 1,
-0.7116127, 1.331022, 0.3495835, 0, 0, 0, 1, 1,
-0.7054441, -0.90244, -1.597811, 1, 1, 1, 1, 1,
-0.6987092, 0.2816061, -0.4712593, 1, 1, 1, 1, 1,
-0.6983794, 0.6661707, 1.261529, 1, 1, 1, 1, 1,
-0.6978465, -0.6371499, -0.5179373, 1, 1, 1, 1, 1,
-0.6945824, -0.3349305, -1.449505, 1, 1, 1, 1, 1,
-0.6926099, 0.6211637, -1.324142, 1, 1, 1, 1, 1,
-0.6897727, -0.3865735, -1.426109, 1, 1, 1, 1, 1,
-0.6891562, 0.6934756, -0.103502, 1, 1, 1, 1, 1,
-0.6868364, -1.059699, -2.992998, 1, 1, 1, 1, 1,
-0.679328, -0.2590604, -2.703257, 1, 1, 1, 1, 1,
-0.6738957, -1.3288, -3.856085, 1, 1, 1, 1, 1,
-0.6733837, 0.3510043, -0.4534582, 1, 1, 1, 1, 1,
-0.6726553, 0.2330622, 0.2642167, 1, 1, 1, 1, 1,
-0.6665453, 0.5188643, -0.7057638, 1, 1, 1, 1, 1,
-0.6663264, -0.5437562, -2.300794, 1, 1, 1, 1, 1,
-0.6635814, 1.536837, 0.6743109, 0, 0, 1, 1, 1,
-0.6598058, 1.252951, 2.775147, 1, 0, 0, 1, 1,
-0.6566198, -1.711498, -2.400064, 1, 0, 0, 1, 1,
-0.6561423, -0.747788, -2.135959, 1, 0, 0, 1, 1,
-0.6536089, 0.6019815, -0.805119, 1, 0, 0, 1, 1,
-0.6506848, -0.9776825, -1.932512, 1, 0, 0, 1, 1,
-0.6456694, 1.483211, -1.008964, 0, 0, 0, 1, 1,
-0.643947, -0.385349, -1.761455, 0, 0, 0, 1, 1,
-0.6414213, 0.1067509, -0.6391897, 0, 0, 0, 1, 1,
-0.6410937, 0.1689566, -0.5403039, 0, 0, 0, 1, 1,
-0.6375756, -0.8202246, -1.372975, 0, 0, 0, 1, 1,
-0.6255671, 0.5331845, 0.6109081, 0, 0, 0, 1, 1,
-0.6234142, -0.985647, -2.866672, 0, 0, 0, 1, 1,
-0.618454, -1.617121, -3.270054, 1, 1, 1, 1, 1,
-0.612806, -1.846955, -1.705237, 1, 1, 1, 1, 1,
-0.6088312, -0.8451619, -3.373912, 1, 1, 1, 1, 1,
-0.608163, 0.7890602, -0.0928782, 1, 1, 1, 1, 1,
-0.607693, 0.1266484, -3.299454, 1, 1, 1, 1, 1,
-0.6070513, -0.6554997, -2.389233, 1, 1, 1, 1, 1,
-0.6062756, 1.026928, -0.6731526, 1, 1, 1, 1, 1,
-0.6023666, -0.5818229, -1.760529, 1, 1, 1, 1, 1,
-0.6021636, -0.3665577, -2.444778, 1, 1, 1, 1, 1,
-0.6014805, -0.9639217, -3.077905, 1, 1, 1, 1, 1,
-0.5948817, 1.046141, 0.2079699, 1, 1, 1, 1, 1,
-0.5942901, -0.06085122, -1.789713, 1, 1, 1, 1, 1,
-0.5881479, 0.3045085, -2.980157, 1, 1, 1, 1, 1,
-0.5842971, -1.704865, -2.507713, 1, 1, 1, 1, 1,
-0.5823117, -0.9516555, -1.984663, 1, 1, 1, 1, 1,
-0.5823076, -1.107874, -3.939929, 0, 0, 1, 1, 1,
-0.5823056, 0.8257486, 0.1752363, 1, 0, 0, 1, 1,
-0.5760782, -0.2393655, -2.18708, 1, 0, 0, 1, 1,
-0.5759038, -1.601534, -2.997608, 1, 0, 0, 1, 1,
-0.575491, 0.0410873, -2.610812, 1, 0, 0, 1, 1,
-0.5751934, 0.2049322, -2.102399, 1, 0, 0, 1, 1,
-0.5730122, -0.4603606, -2.707213, 0, 0, 0, 1, 1,
-0.5723227, -0.2008785, -1.767331, 0, 0, 0, 1, 1,
-0.5715545, 0.5363206, -1.22336, 0, 0, 0, 1, 1,
-0.567888, -1.052115, -2.578072, 0, 0, 0, 1, 1,
-0.5662922, -0.3574391, -1.232167, 0, 0, 0, 1, 1,
-0.5641993, 1.723663, 1.116243, 0, 0, 0, 1, 1,
-0.5620677, 0.6501647, -0.008975013, 0, 0, 0, 1, 1,
-0.5585935, 1.764103, -1.18713, 1, 1, 1, 1, 1,
-0.5533724, 1.519765, 0.5953858, 1, 1, 1, 1, 1,
-0.5505058, -0.04289633, 0.5984222, 1, 1, 1, 1, 1,
-0.5400445, -0.2706228, -0.6016252, 1, 1, 1, 1, 1,
-0.5385795, -1.235603, -5.487099, 1, 1, 1, 1, 1,
-0.5374156, 1.144211, -0.1930218, 1, 1, 1, 1, 1,
-0.5340677, 0.08086836, -0.8994976, 1, 1, 1, 1, 1,
-0.5331738, -0.2277582, -0.03322694, 1, 1, 1, 1, 1,
-0.525364, 0.6262656, 0.0005343308, 1, 1, 1, 1, 1,
-0.5206203, -0.6876146, -1.328222, 1, 1, 1, 1, 1,
-0.5124672, 1.281967, 0.4141179, 1, 1, 1, 1, 1,
-0.5104584, -0.6525972, -2.595958, 1, 1, 1, 1, 1,
-0.5077844, 0.8800372, -2.544425, 1, 1, 1, 1, 1,
-0.5059242, -0.3468132, -1.56247, 1, 1, 1, 1, 1,
-0.5002882, -1.515624, -4.421255, 1, 1, 1, 1, 1,
-0.5002601, 0.3027284, -1.183186, 0, 0, 1, 1, 1,
-0.497578, -0.3844101, -1.903378, 1, 0, 0, 1, 1,
-0.492996, 0.02571768, -3.165704, 1, 0, 0, 1, 1,
-0.4926447, -0.989984, -2.534678, 1, 0, 0, 1, 1,
-0.4924355, 1.28683, -0.7208294, 1, 0, 0, 1, 1,
-0.4922832, -1.104717, -3.733455, 1, 0, 0, 1, 1,
-0.4912516, -0.7621399, -4.066121, 0, 0, 0, 1, 1,
-0.4905103, -0.6605307, -1.206368, 0, 0, 0, 1, 1,
-0.4874885, -1.002449, -1.496544, 0, 0, 0, 1, 1,
-0.4863793, -1.78834, -2.223572, 0, 0, 0, 1, 1,
-0.4857159, -0.4406048, -1.688777, 0, 0, 0, 1, 1,
-0.4809121, 0.07062298, 0.9982684, 0, 0, 0, 1, 1,
-0.4804759, 0.3601241, -1.498013, 0, 0, 0, 1, 1,
-0.4800327, 0.07393806, -0.4697942, 1, 1, 1, 1, 1,
-0.4790809, 0.7622035, -0.2532419, 1, 1, 1, 1, 1,
-0.4724495, -1.499244, -2.91077, 1, 1, 1, 1, 1,
-0.4657766, 1.007273, -0.1938352, 1, 1, 1, 1, 1,
-0.465731, 0.1103738, -2.360951, 1, 1, 1, 1, 1,
-0.4599906, -2.12364, -2.733919, 1, 1, 1, 1, 1,
-0.4559135, -0.4256258, -1.594794, 1, 1, 1, 1, 1,
-0.4536565, -0.1892089, -0.8502468, 1, 1, 1, 1, 1,
-0.4496059, 1.159054, 0.5978117, 1, 1, 1, 1, 1,
-0.4455792, -0.04206142, -0.8564841, 1, 1, 1, 1, 1,
-0.4454243, -1.202784, -0.7072073, 1, 1, 1, 1, 1,
-0.4414053, 0.5248337, -0.3918021, 1, 1, 1, 1, 1,
-0.4405089, -0.4904245, -2.061585, 1, 1, 1, 1, 1,
-0.4364881, 1.421847, -1.268537, 1, 1, 1, 1, 1,
-0.4362677, 1.232947, 0.4442565, 1, 1, 1, 1, 1,
-0.4312008, 0.1428235, -0.04443839, 0, 0, 1, 1, 1,
-0.4310613, -1.308682, -3.541927, 1, 0, 0, 1, 1,
-0.4303261, -1.202009, -4.410111, 1, 0, 0, 1, 1,
-0.4251782, 2.053131, 1.691421, 1, 0, 0, 1, 1,
-0.4230632, -0.534918, -2.393625, 1, 0, 0, 1, 1,
-0.4177188, 1.173825, 0.5104614, 1, 0, 0, 1, 1,
-0.4160252, -0.2513094, -2.381334, 0, 0, 0, 1, 1,
-0.4133809, 1.053876, -0.217894, 0, 0, 0, 1, 1,
-0.4120288, -0.8360111, -3.658299, 0, 0, 0, 1, 1,
-0.4054057, 2.216504, -1.68113, 0, 0, 0, 1, 1,
-0.4021343, -0.134535, -1.387629, 0, 0, 0, 1, 1,
-0.4018912, -0.7348433, -2.34296, 0, 0, 0, 1, 1,
-0.3994721, -1.665786, -1.790703, 0, 0, 0, 1, 1,
-0.3929627, 0.7542725, -0.5274494, 1, 1, 1, 1, 1,
-0.3914833, -0.163821, -3.029253, 1, 1, 1, 1, 1,
-0.3914475, -1.135918, -1.203473, 1, 1, 1, 1, 1,
-0.3904301, -2.723902, -2.636633, 1, 1, 1, 1, 1,
-0.3812619, -0.4023563, -2.58459, 1, 1, 1, 1, 1,
-0.3794408, 0.7361016, -0.6326628, 1, 1, 1, 1, 1,
-0.3787647, -1.806411, -1.554415, 1, 1, 1, 1, 1,
-0.3785985, -0.3610572, -3.092595, 1, 1, 1, 1, 1,
-0.3776007, -0.9284435, -3.229101, 1, 1, 1, 1, 1,
-0.3768021, 0.842843, -0.7990316, 1, 1, 1, 1, 1,
-0.3721286, 0.9150422, -1.04786, 1, 1, 1, 1, 1,
-0.3712768, 1.414196, 0.6690729, 1, 1, 1, 1, 1,
-0.3689767, 0.9791785, -1.064388, 1, 1, 1, 1, 1,
-0.3677957, 1.310588, -0.7911642, 1, 1, 1, 1, 1,
-0.3668728, 0.6003465, -0.2620945, 1, 1, 1, 1, 1,
-0.3593494, -0.4132125, -2.339079, 0, 0, 1, 1, 1,
-0.3541251, -0.3836533, -3.21473, 1, 0, 0, 1, 1,
-0.3537996, -0.8756503, -0.9480848, 1, 0, 0, 1, 1,
-0.3532531, -0.9709326, -1.375222, 1, 0, 0, 1, 1,
-0.3469165, 0.2483161, -1.465639, 1, 0, 0, 1, 1,
-0.3468688, -1.033848, -3.197211, 1, 0, 0, 1, 1,
-0.3457626, -1.073754, -1.804026, 0, 0, 0, 1, 1,
-0.3455548, 1.74625, -0.209019, 0, 0, 0, 1, 1,
-0.3388333, -1.195591, -4.94293, 0, 0, 0, 1, 1,
-0.3369963, 0.3532971, -0.6730759, 0, 0, 0, 1, 1,
-0.3359478, 0.4967276, -1.528141, 0, 0, 0, 1, 1,
-0.3347048, -0.3379464, -2.377275, 0, 0, 0, 1, 1,
-0.3343558, 0.547829, 0.4407464, 0, 0, 0, 1, 1,
-0.3342791, -1.158812, -4.725305, 1, 1, 1, 1, 1,
-0.3342129, 1.256014, -0.06233033, 1, 1, 1, 1, 1,
-0.3329726, -2.160461, -3.334677, 1, 1, 1, 1, 1,
-0.3329088, 0.4942498, 0.9719673, 1, 1, 1, 1, 1,
-0.3290258, 0.127692, -0.9476334, 1, 1, 1, 1, 1,
-0.3288296, -1.413561, -2.598098, 1, 1, 1, 1, 1,
-0.3236516, 0.3056763, -1.736506, 1, 1, 1, 1, 1,
-0.3234164, -1.753351, -2.578498, 1, 1, 1, 1, 1,
-0.318838, -2.084596, -2.521431, 1, 1, 1, 1, 1,
-0.3110744, -0.01644728, -0.9883843, 1, 1, 1, 1, 1,
-0.3100382, -0.4144647, -1.793962, 1, 1, 1, 1, 1,
-0.3068633, -1.453786, -2.750964, 1, 1, 1, 1, 1,
-0.3066152, -1.351869, -3.097966, 1, 1, 1, 1, 1,
-0.3065553, 0.9969024, -0.9997987, 1, 1, 1, 1, 1,
-0.306133, 0.007327786, -1.484125, 1, 1, 1, 1, 1,
-0.3016107, -1.759794, -3.535825, 0, 0, 1, 1, 1,
-0.3009483, 0.9161035, -0.8040211, 1, 0, 0, 1, 1,
-0.2936413, 1.093426, 0.6841669, 1, 0, 0, 1, 1,
-0.2935427, -0.4533503, -3.556804, 1, 0, 0, 1, 1,
-0.2934691, -0.6943639, -3.109827, 1, 0, 0, 1, 1,
-0.2934399, 0.9220647, 0.1326114, 1, 0, 0, 1, 1,
-0.2926387, 1.063863, 0.4097143, 0, 0, 0, 1, 1,
-0.2826355, 0.191353, -0.9608943, 0, 0, 0, 1, 1,
-0.2814141, 0.4519099, 0.01663752, 0, 0, 0, 1, 1,
-0.2797076, -0.4645503, -2.176714, 0, 0, 0, 1, 1,
-0.2783585, -0.4909253, -2.15595, 0, 0, 0, 1, 1,
-0.273313, 0.7158102, -0.1067493, 0, 0, 0, 1, 1,
-0.2731667, -0.04170427, -0.5907512, 0, 0, 0, 1, 1,
-0.2720945, -1.3555, -1.761518, 1, 1, 1, 1, 1,
-0.2701591, 2.357908, -0.105165, 1, 1, 1, 1, 1,
-0.2682323, -0.303257, -2.075727, 1, 1, 1, 1, 1,
-0.2670721, 0.9502887, -0.003266597, 1, 1, 1, 1, 1,
-0.2642989, 1.678356, 1.704621, 1, 1, 1, 1, 1,
-0.259578, 1.597032, -0.2233804, 1, 1, 1, 1, 1,
-0.2553561, -1.64092, -3.414338, 1, 1, 1, 1, 1,
-0.2497561, -0.8757442, -2.744138, 1, 1, 1, 1, 1,
-0.2396768, -0.4130384, -0.9634054, 1, 1, 1, 1, 1,
-0.2377357, -0.7719309, -2.596169, 1, 1, 1, 1, 1,
-0.2307004, -0.2163682, -1.300367, 1, 1, 1, 1, 1,
-0.2284302, -0.3010736, -2.42396, 1, 1, 1, 1, 1,
-0.2251639, -1.289923, -2.415362, 1, 1, 1, 1, 1,
-0.2248089, 0.980593, 0.743956, 1, 1, 1, 1, 1,
-0.2243623, 0.5905461, -1.834832, 1, 1, 1, 1, 1,
-0.2235624, -2.376071, -2.84362, 0, 0, 1, 1, 1,
-0.2213511, -0.3178513, -2.582253, 1, 0, 0, 1, 1,
-0.2151308, 0.2913313, -0.5974753, 1, 0, 0, 1, 1,
-0.2139845, -0.9194288, -4.054815, 1, 0, 0, 1, 1,
-0.2112776, -1.583455, -2.663279, 1, 0, 0, 1, 1,
-0.2083792, -0.6417192, -3.291119, 1, 0, 0, 1, 1,
-0.208245, -0.8029079, -5.247099, 0, 0, 0, 1, 1,
-0.2076558, -0.1850305, -0.7885734, 0, 0, 0, 1, 1,
-0.2072026, -1.02951, -2.964516, 0, 0, 0, 1, 1,
-0.2050242, 1.493291, 0.3992489, 0, 0, 0, 1, 1,
-0.1991464, 0.1578943, -2.551194, 0, 0, 0, 1, 1,
-0.1982017, -1.408255, -2.52649, 0, 0, 0, 1, 1,
-0.1967973, -0.4035383, -0.8018249, 0, 0, 0, 1, 1,
-0.1876249, -2.501113, -1.294714, 1, 1, 1, 1, 1,
-0.1838027, -1.231421, -1.514664, 1, 1, 1, 1, 1,
-0.1779249, -0.6017385, -3.781646, 1, 1, 1, 1, 1,
-0.1773349, -0.746769, -2.80424, 1, 1, 1, 1, 1,
-0.1763001, -0.3178278, -2.22667, 1, 1, 1, 1, 1,
-0.1731753, 1.121244, -0.5126443, 1, 1, 1, 1, 1,
-0.1703417, -0.4013494, -2.032729, 1, 1, 1, 1, 1,
-0.1673971, 0.293641, 1.552636, 1, 1, 1, 1, 1,
-0.1664782, 0.583255, 0.008818083, 1, 1, 1, 1, 1,
-0.1660842, 1.006554, -0.9509177, 1, 1, 1, 1, 1,
-0.164041, 0.7169598, -0.3044414, 1, 1, 1, 1, 1,
-0.1633172, -0.190609, -3.468994, 1, 1, 1, 1, 1,
-0.1595427, -1.387006, -2.228175, 1, 1, 1, 1, 1,
-0.1589336, -2.130009, -1.416045, 1, 1, 1, 1, 1,
-0.1583021, -1.519987, -2.270395, 1, 1, 1, 1, 1,
-0.1537877, -0.2127644, -1.71574, 0, 0, 1, 1, 1,
-0.1534775, -0.01797547, -0.6812184, 1, 0, 0, 1, 1,
-0.1463638, 1.165728, 1.788043, 1, 0, 0, 1, 1,
-0.143985, -1.992935, -4.467187, 1, 0, 0, 1, 1,
-0.1394394, 0.2827679, 0.09439509, 1, 0, 0, 1, 1,
-0.1327814, 1.6387, -0.1911656, 1, 0, 0, 1, 1,
-0.1301775, 0.09273077, -0.613169, 0, 0, 0, 1, 1,
-0.1293212, 1.65321, -0.6165984, 0, 0, 0, 1, 1,
-0.1253498, 0.4795584, 1.251157, 0, 0, 0, 1, 1,
-0.1249028, 0.3062142, -0.9380987, 0, 0, 0, 1, 1,
-0.1232298, 0.3533249, -0.9920799, 0, 0, 0, 1, 1,
-0.1207176, 0.1321835, -1.905663, 0, 0, 0, 1, 1,
-0.1189041, 0.2552016, -1.14994, 0, 0, 0, 1, 1,
-0.1179384, 0.4719726, 0.1106827, 1, 1, 1, 1, 1,
-0.1177115, 0.4784921, -0.1118907, 1, 1, 1, 1, 1,
-0.115475, 1.287954, 0.1683476, 1, 1, 1, 1, 1,
-0.1104789, -1.082134, -2.682141, 1, 1, 1, 1, 1,
-0.1081817, -0.4903223, -2.527538, 1, 1, 1, 1, 1,
-0.1049771, -0.379063, -1.462457, 1, 1, 1, 1, 1,
-0.1021263, 0.4119816, 2.649894, 1, 1, 1, 1, 1,
-0.1003064, 1.31589, 0.00777558, 1, 1, 1, 1, 1,
-0.09840068, -0.6503931, -3.980804, 1, 1, 1, 1, 1,
-0.09599691, 1.843675, -0.9342774, 1, 1, 1, 1, 1,
-0.08596948, 0.08861424, -1.23425, 1, 1, 1, 1, 1,
-0.08491287, -0.9213607, -2.705283, 1, 1, 1, 1, 1,
-0.0804394, 0.3641407, 1.104282, 1, 1, 1, 1, 1,
-0.08002122, -0.5818732, -2.849702, 1, 1, 1, 1, 1,
-0.07924524, 0.8204116, -0.6868509, 1, 1, 1, 1, 1,
-0.0778592, -0.5768891, -2.406382, 0, 0, 1, 1, 1,
-0.0778067, 1.662839, 0.237285, 1, 0, 0, 1, 1,
-0.0767975, -0.9880922, -3.042152, 1, 0, 0, 1, 1,
-0.07375584, 0.2116746, 0.1312017, 1, 0, 0, 1, 1,
-0.07347073, -0.2887708, -3.860978, 1, 0, 0, 1, 1,
-0.07304608, 0.1009253, -2.142923, 1, 0, 0, 1, 1,
-0.07078294, 0.5353216, 0.9040206, 0, 0, 0, 1, 1,
-0.06890573, -0.1959243, -2.835523, 0, 0, 0, 1, 1,
-0.06745399, 1.762173, 0.3867643, 0, 0, 0, 1, 1,
-0.06295803, 1.026824, -1.787098, 0, 0, 0, 1, 1,
-0.0606807, 0.4138446, -0.7907726, 0, 0, 0, 1, 1,
-0.06000482, 1.611779, 0.7773168, 0, 0, 0, 1, 1,
-0.05763038, -1.840631, -2.312239, 0, 0, 0, 1, 1,
-0.05730672, 0.9570131, 1.213143, 1, 1, 1, 1, 1,
-0.05603873, -0.7806649, -4.058723, 1, 1, 1, 1, 1,
-0.04772545, -0.2100358, -2.4404, 1, 1, 1, 1, 1,
-0.04518983, -1.131679, -3.750074, 1, 1, 1, 1, 1,
-0.03711579, -0.4054624, -3.865826, 1, 1, 1, 1, 1,
-0.02993102, -0.2813681, -1.530326, 1, 1, 1, 1, 1,
-0.02518784, 2.82412, 0.405012, 1, 1, 1, 1, 1,
-0.02452665, 0.3849645, 0.5739956, 1, 1, 1, 1, 1,
-0.02033801, -0.9659062, -1.886189, 1, 1, 1, 1, 1,
-0.01955129, 0.8075866, 1.204452, 1, 1, 1, 1, 1,
-0.0169664, -0.1475157, -1.572435, 1, 1, 1, 1, 1,
-0.01619663, 0.9592989, -0.8935516, 1, 1, 1, 1, 1,
-0.01301793, -1.334902, -3.800349, 1, 1, 1, 1, 1,
-0.0127099, -0.2546166, -4.266163, 1, 1, 1, 1, 1,
-0.0121655, 0.3384431, -0.09724912, 1, 1, 1, 1, 1,
-0.01082435, -0.150147, -4.146871, 0, 0, 1, 1, 1,
-0.0104659, -0.683774, -2.469913, 1, 0, 0, 1, 1,
0.001738286, -0.3035602, 3.262611, 1, 0, 0, 1, 1,
0.002015064, -0.7789117, 2.857655, 1, 0, 0, 1, 1,
0.002563239, -0.3659514, 2.869954, 1, 0, 0, 1, 1,
0.00270979, -0.3094229, 2.200658, 1, 0, 0, 1, 1,
0.004311332, 1.581653, -0.03084004, 0, 0, 0, 1, 1,
0.004943548, -0.7084369, 3.224815, 0, 0, 0, 1, 1,
0.005722389, -1.395613, 1.843829, 0, 0, 0, 1, 1,
0.01067257, -1.815157, 1.821829, 0, 0, 0, 1, 1,
0.01915705, 1.158681, -0.7391723, 0, 0, 0, 1, 1,
0.03244384, -1.30471, 3.716635, 0, 0, 0, 1, 1,
0.03649068, -0.2227557, 2.86372, 0, 0, 0, 1, 1,
0.04195268, -0.2908224, 2.597991, 1, 1, 1, 1, 1,
0.04232383, 0.8455477, -1.426404, 1, 1, 1, 1, 1,
0.04266937, 0.2597691, 1.721452, 1, 1, 1, 1, 1,
0.04752927, -1.297496, 3.642679, 1, 1, 1, 1, 1,
0.04757082, -1.900167, 2.906215, 1, 1, 1, 1, 1,
0.04923904, -0.4863983, 2.301666, 1, 1, 1, 1, 1,
0.04954992, 0.7959043, 0.8957907, 1, 1, 1, 1, 1,
0.05008795, -0.6533483, 2.598496, 1, 1, 1, 1, 1,
0.05012115, 0.2782295, -1.481113, 1, 1, 1, 1, 1,
0.05016556, -0.7771424, 2.438467, 1, 1, 1, 1, 1,
0.05118293, -1.095847, 2.72918, 1, 1, 1, 1, 1,
0.05394435, 0.4177865, 0.8017611, 1, 1, 1, 1, 1,
0.0569964, 0.3202747, 1.483752, 1, 1, 1, 1, 1,
0.05847124, 0.04358662, 2.229431, 1, 1, 1, 1, 1,
0.05876658, 3.311253, -1.176956, 1, 1, 1, 1, 1,
0.06014384, 0.5944761, -0.3985642, 0, 0, 1, 1, 1,
0.06672178, -1.865415, 3.039227, 1, 0, 0, 1, 1,
0.06813464, -0.7747666, 4.313983, 1, 0, 0, 1, 1,
0.0693555, -0.3977835, 3.998626, 1, 0, 0, 1, 1,
0.07001094, -0.9406429, 1.383311, 1, 0, 0, 1, 1,
0.07548632, -1.044297, 4.326612, 1, 0, 0, 1, 1,
0.08131722, 2.787089, 1.609816, 0, 0, 0, 1, 1,
0.08291996, -0.5337422, 2.943155, 0, 0, 0, 1, 1,
0.08434169, -1.404853, 4.101095, 0, 0, 0, 1, 1,
0.08698262, 0.003490234, 1.703426, 0, 0, 0, 1, 1,
0.08987299, -2.113522, 2.039509, 0, 0, 0, 1, 1,
0.09148638, -0.3986581, 1.742995, 0, 0, 0, 1, 1,
0.09208045, 0.3941942, 2.216528, 0, 0, 0, 1, 1,
0.09274325, 0.3444631, -1.466705, 1, 1, 1, 1, 1,
0.09356053, -0.2280633, 3.194195, 1, 1, 1, 1, 1,
0.09410875, -0.7836472, 2.228507, 1, 1, 1, 1, 1,
0.095765, 0.5377682, 1.980181, 1, 1, 1, 1, 1,
0.1052704, -0.3025195, 4.233292, 1, 1, 1, 1, 1,
0.1074842, 0.8835828, -1.292463, 1, 1, 1, 1, 1,
0.1096541, -0.0714206, -0.0935069, 1, 1, 1, 1, 1,
0.1107109, 0.5813575, 1.930422, 1, 1, 1, 1, 1,
0.1137466, 1.78509, -0.3255244, 1, 1, 1, 1, 1,
0.1155308, -0.4307042, 3.270272, 1, 1, 1, 1, 1,
0.1158371, 0.4040983, 0.6192374, 1, 1, 1, 1, 1,
0.1170252, 1.121642, 1.628685, 1, 1, 1, 1, 1,
0.1186567, -0.3006521, 2.379233, 1, 1, 1, 1, 1,
0.1257984, -0.2639738, 2.373995, 1, 1, 1, 1, 1,
0.1260695, -0.1304742, 3.109177, 1, 1, 1, 1, 1,
0.1267716, 0.8751162, 0.6123025, 0, 0, 1, 1, 1,
0.1271547, 0.9202731, 1.835993, 1, 0, 0, 1, 1,
0.1287142, 0.2521179, 1.134885, 1, 0, 0, 1, 1,
0.1340619, -1.031357, 6.003754, 1, 0, 0, 1, 1,
0.1372226, -0.3092931, 4.316495, 1, 0, 0, 1, 1,
0.144306, 0.08371035, 0.01831633, 1, 0, 0, 1, 1,
0.1485157, -0.05821129, 1.467823, 0, 0, 0, 1, 1,
0.1526207, -0.6560258, 1.620504, 0, 0, 0, 1, 1,
0.1540799, -0.9692995, 3.241955, 0, 0, 0, 1, 1,
0.1552419, 0.768488, -1.005318, 0, 0, 0, 1, 1,
0.1562134, -0.1317584, 0.9136311, 0, 0, 0, 1, 1,
0.1635774, -0.1145608, -0.0277959, 0, 0, 0, 1, 1,
0.1679461, -1.456841, 4.086959, 0, 0, 0, 1, 1,
0.1683378, 0.133577, 3.555094, 1, 1, 1, 1, 1,
0.1696762, -0.354032, 2.273975, 1, 1, 1, 1, 1,
0.1761358, 1.640233, 0.5579743, 1, 1, 1, 1, 1,
0.176209, 2.336466, -1.077247, 1, 1, 1, 1, 1,
0.180964, -0.2090672, 3.517021, 1, 1, 1, 1, 1,
0.1842262, 1.322241, 0.3869787, 1, 1, 1, 1, 1,
0.1869531, -1.950207, 3.218909, 1, 1, 1, 1, 1,
0.1881698, -0.005146306, 0.2401241, 1, 1, 1, 1, 1,
0.1913761, -0.5223733, 2.078401, 1, 1, 1, 1, 1,
0.1918932, -1.190508, 3.43721, 1, 1, 1, 1, 1,
0.1921612, 1.701129, -0.9071654, 1, 1, 1, 1, 1,
0.1934037, 1.061561, -1.029229, 1, 1, 1, 1, 1,
0.1962305, -0.3171951, 4.368261, 1, 1, 1, 1, 1,
0.2071857, 1.250287, 0.6433062, 1, 1, 1, 1, 1,
0.2188789, 0.4626356, -0.9275021, 1, 1, 1, 1, 1,
0.2214561, 0.6673872, 0.3036822, 0, 0, 1, 1, 1,
0.2242972, -1.039678, 2.588845, 1, 0, 0, 1, 1,
0.2308581, 0.1669625, -0.8119215, 1, 0, 0, 1, 1,
0.2322654, 1.841046, 0.9884903, 1, 0, 0, 1, 1,
0.235778, 0.09063472, 1.000156, 1, 0, 0, 1, 1,
0.237066, -0.4177924, 1.838377, 1, 0, 0, 1, 1,
0.2389447, 0.5909953, 0.2149418, 0, 0, 0, 1, 1,
0.2397709, -0.3694979, 1.86914, 0, 0, 0, 1, 1,
0.2422051, 0.8450083, -0.844736, 0, 0, 0, 1, 1,
0.2434795, -0.2576506, 2.828991, 0, 0, 0, 1, 1,
0.2455068, 0.9966767, -0.2867894, 0, 0, 0, 1, 1,
0.2472286, -1.115532, 2.616765, 0, 0, 0, 1, 1,
0.248603, 0.003575508, 1.864689, 0, 0, 0, 1, 1,
0.252225, 0.1688427, 2.142282, 1, 1, 1, 1, 1,
0.2529555, -0.8400675, 0.8944266, 1, 1, 1, 1, 1,
0.2561901, -1.892434, 3.727597, 1, 1, 1, 1, 1,
0.2644098, 1.448241, -0.437988, 1, 1, 1, 1, 1,
0.2685373, 0.322624, -0.8299994, 1, 1, 1, 1, 1,
0.2693363, -1.197804, 5.830712, 1, 1, 1, 1, 1,
0.2706467, 1.201082, -0.3075718, 1, 1, 1, 1, 1,
0.2713117, -1.892466, 3.682456, 1, 1, 1, 1, 1,
0.272067, 0.3995403, 1.317594, 1, 1, 1, 1, 1,
0.2724168, -0.2506886, 0.3937198, 1, 1, 1, 1, 1,
0.2771559, 0.5516991, 0.7127523, 1, 1, 1, 1, 1,
0.2783861, 0.6355814, 1.367923, 1, 1, 1, 1, 1,
0.2787919, -0.4205818, 2.571302, 1, 1, 1, 1, 1,
0.2803182, -0.5896211, 1.61445, 1, 1, 1, 1, 1,
0.2809286, -0.5851958, 3.443412, 1, 1, 1, 1, 1,
0.2822341, 0.9154997, 1.601726, 0, 0, 1, 1, 1,
0.2827229, 0.2093553, 0.09293846, 1, 0, 0, 1, 1,
0.2844009, 1.25611, -0.08914069, 1, 0, 0, 1, 1,
0.2853358, 0.575181, 0.5032219, 1, 0, 0, 1, 1,
0.2857387, -0.3080253, 0.7964562, 1, 0, 0, 1, 1,
0.2881083, 1.411577, -1.187909, 1, 0, 0, 1, 1,
0.2884145, -0.4030561, 2.614177, 0, 0, 0, 1, 1,
0.2914848, 0.3802264, 0.1983104, 0, 0, 0, 1, 1,
0.2945723, -0.2019427, 2.83584, 0, 0, 0, 1, 1,
0.2961901, -0.6935696, 3.174262, 0, 0, 0, 1, 1,
0.2984249, 0.3629552, 1.65666, 0, 0, 0, 1, 1,
0.3008422, -1.176194, 3.153206, 0, 0, 0, 1, 1,
0.3026638, -0.5410152, 4.103457, 0, 0, 0, 1, 1,
0.3037254, 0.5566455, 1.108828, 1, 1, 1, 1, 1,
0.3073376, 0.1777394, 0.5921918, 1, 1, 1, 1, 1,
0.3094744, -0.7244247, 1.57271, 1, 1, 1, 1, 1,
0.3177981, -1.357548, 4.085335, 1, 1, 1, 1, 1,
0.3187839, -0.1603626, 1.064734, 1, 1, 1, 1, 1,
0.3244568, 0.5506898, 0.7742394, 1, 1, 1, 1, 1,
0.3256474, 0.3065195, 0.2876141, 1, 1, 1, 1, 1,
0.3269395, -0.9067943, 3.342594, 1, 1, 1, 1, 1,
0.3289086, 1.707165, 0.4789556, 1, 1, 1, 1, 1,
0.3320382, 0.1266685, 1.030011, 1, 1, 1, 1, 1,
0.333978, -1.170598, 4.135884, 1, 1, 1, 1, 1,
0.3391262, -0.3013709, 2.075047, 1, 1, 1, 1, 1,
0.339527, -0.8619501, 2.868364, 1, 1, 1, 1, 1,
0.3397052, -0.2125317, 3.315722, 1, 1, 1, 1, 1,
0.3412566, -1.554882, 2.995487, 1, 1, 1, 1, 1,
0.3422134, 0.1993855, 0.6209418, 0, 0, 1, 1, 1,
0.3444575, -0.9374955, 3.749946, 1, 0, 0, 1, 1,
0.3461941, 1.721081, 0.2566765, 1, 0, 0, 1, 1,
0.3483639, -2.047748, 4.044525, 1, 0, 0, 1, 1,
0.3545705, 0.09893028, 2.015715, 1, 0, 0, 1, 1,
0.3638555, -0.5217175, 2.274202, 1, 0, 0, 1, 1,
0.3688958, 0.06037229, 0.7344623, 0, 0, 0, 1, 1,
0.3705085, 0.6256118, -0.6159008, 0, 0, 0, 1, 1,
0.3756715, -1.737579, 2.950328, 0, 0, 0, 1, 1,
0.3775109, 1.864003, 0.9508239, 0, 0, 0, 1, 1,
0.3801748, -1.263863, 4.172179, 0, 0, 0, 1, 1,
0.3810255, 1.443328, -0.1608908, 0, 0, 0, 1, 1,
0.3824156, -1.058866, 2.420314, 0, 0, 0, 1, 1,
0.383588, -1.115981, 2.916658, 1, 1, 1, 1, 1,
0.3853124, -1.379937, 4.102698, 1, 1, 1, 1, 1,
0.3898449, 1.803232, -1.076912, 1, 1, 1, 1, 1,
0.3907332, -0.4009186, -0.2472937, 1, 1, 1, 1, 1,
0.4023995, -0.1060418, 2.927568, 1, 1, 1, 1, 1,
0.4030045, 0.4511846, 2.123703, 1, 1, 1, 1, 1,
0.4038954, 2.691242, 0.643793, 1, 1, 1, 1, 1,
0.4068199, 0.6035832, 1.593159, 1, 1, 1, 1, 1,
0.4071423, 0.2350152, 0.2774947, 1, 1, 1, 1, 1,
0.4100797, -0.02234545, 2.02029, 1, 1, 1, 1, 1,
0.4116127, 0.5438503, 1.421399, 1, 1, 1, 1, 1,
0.413451, 0.2165276, 0.8903534, 1, 1, 1, 1, 1,
0.4154461, -0.6033531, 2.140586, 1, 1, 1, 1, 1,
0.4204287, 0.4560759, 0.2026602, 1, 1, 1, 1, 1,
0.420457, -0.8755774, 2.772676, 1, 1, 1, 1, 1,
0.4286269, -0.1864834, 1.512839, 0, 0, 1, 1, 1,
0.4343508, 0.3346215, -0.8074774, 1, 0, 0, 1, 1,
0.4366094, -1.947439, 4.723613, 1, 0, 0, 1, 1,
0.4383509, 1.833243, -1.292823, 1, 0, 0, 1, 1,
0.4401461, 0.9067981, 0.5907492, 1, 0, 0, 1, 1,
0.4408548, 0.0272066, -1.505135, 1, 0, 0, 1, 1,
0.4428883, 1.424937, 0.426859, 0, 0, 0, 1, 1,
0.4442242, -0.2922764, 2.550466, 0, 0, 0, 1, 1,
0.4470836, -1.189338, 3.682705, 0, 0, 0, 1, 1,
0.4494521, -1.245949, 4.399281, 0, 0, 0, 1, 1,
0.4518211, -0.6688666, 1.576505, 0, 0, 0, 1, 1,
0.4521596, 0.0933852, -0.7428018, 0, 0, 0, 1, 1,
0.4540576, 2.03525, -0.4480326, 0, 0, 0, 1, 1,
0.4575568, -1.408963, 3.44302, 1, 1, 1, 1, 1,
0.463279, 0.2336031, 1.119229, 1, 1, 1, 1, 1,
0.4670897, 2.553735, -1.562152, 1, 1, 1, 1, 1,
0.4695217, 0.4562909, -0.1433304, 1, 1, 1, 1, 1,
0.4700054, 1.901002, 1.502095, 1, 1, 1, 1, 1,
0.4723143, 0.5544598, 0.6086711, 1, 1, 1, 1, 1,
0.4750049, 0.4998295, 0.7210405, 1, 1, 1, 1, 1,
0.4765267, 0.4817857, 0.2308071, 1, 1, 1, 1, 1,
0.4812253, 1.319285, 0.5283417, 1, 1, 1, 1, 1,
0.4853027, -0.3226595, 1.888515, 1, 1, 1, 1, 1,
0.4870938, -0.5135574, 2.063476, 1, 1, 1, 1, 1,
0.4878101, 0.6451181, -0.2017467, 1, 1, 1, 1, 1,
0.4927458, 0.9687278, -0.02421018, 1, 1, 1, 1, 1,
0.4932403, -0.7481095, 1.712852, 1, 1, 1, 1, 1,
0.4946615, 0.2402274, 1.69976, 1, 1, 1, 1, 1,
0.49499, 0.3531082, 0.02340127, 0, 0, 1, 1, 1,
0.4955777, -0.3873969, 3.497715, 1, 0, 0, 1, 1,
0.5009959, 1.435579, -0.06918269, 1, 0, 0, 1, 1,
0.5085475, 1.173104, 0.7595394, 1, 0, 0, 1, 1,
0.5093253, 0.771921, 0.0151437, 1, 0, 0, 1, 1,
0.509745, 1.815205, 0.640146, 1, 0, 0, 1, 1,
0.5136989, 0.1101474, 2.65684, 0, 0, 0, 1, 1,
0.513839, -0.4760741, 1.457845, 0, 0, 0, 1, 1,
0.5164849, 0.7224575, 2.191948, 0, 0, 0, 1, 1,
0.5166367, 1.253903, -0.7058739, 0, 0, 0, 1, 1,
0.5217423, 0.9847013, -0.3842074, 0, 0, 0, 1, 1,
0.5232874, -0.2138518, 0.9923055, 0, 0, 0, 1, 1,
0.5253841, 0.196342, 0.3461202, 0, 0, 0, 1, 1,
0.5260535, -0.1089702, 2.772599, 1, 1, 1, 1, 1,
0.5282917, -1.716856, 4.632205, 1, 1, 1, 1, 1,
0.5290031, 0.2179206, -0.217609, 1, 1, 1, 1, 1,
0.5329911, -1.612491, 3.139606, 1, 1, 1, 1, 1,
0.5342163, 0.1476271, 1.334887, 1, 1, 1, 1, 1,
0.541101, 0.4787761, 0.04879867, 1, 1, 1, 1, 1,
0.5435176, -1.274446, 2.987999, 1, 1, 1, 1, 1,
0.5508229, -0.9554076, 3.101184, 1, 1, 1, 1, 1,
0.551127, -1.821614, 3.136181, 1, 1, 1, 1, 1,
0.5513147, 0.7524834, 1.208138, 1, 1, 1, 1, 1,
0.5519692, 0.4824169, 1.110527, 1, 1, 1, 1, 1,
0.5655062, 0.3107871, 2.068164, 1, 1, 1, 1, 1,
0.5683855, 0.529642, 1.804874, 1, 1, 1, 1, 1,
0.5696735, -1.13087, 1.72363, 1, 1, 1, 1, 1,
0.571359, -1.312023, 2.081101, 1, 1, 1, 1, 1,
0.5747802, 1.076369, 2.236428, 0, 0, 1, 1, 1,
0.5753393, 0.07829514, 1.173675, 1, 0, 0, 1, 1,
0.5768138, -1.124512, 3.225205, 1, 0, 0, 1, 1,
0.5813934, 1.889067, 0.6255755, 1, 0, 0, 1, 1,
0.5825544, -0.4312043, 1.704215, 1, 0, 0, 1, 1,
0.5894308, 0.4808465, 0.4682151, 1, 0, 0, 1, 1,
0.5969646, -1.816286, 1.837122, 0, 0, 0, 1, 1,
0.6031867, 0.3165917, 1.076371, 0, 0, 0, 1, 1,
0.6032551, 0.341856, 2.498386, 0, 0, 0, 1, 1,
0.6032824, -0.2817529, 2.369807, 0, 0, 0, 1, 1,
0.6075322, -0.06299562, 2.352571, 0, 0, 0, 1, 1,
0.6106542, -0.09308058, 1.617974, 0, 0, 0, 1, 1,
0.6147044, -0.2180069, 3.118285, 0, 0, 0, 1, 1,
0.6201508, 1.382706, -0.7973012, 1, 1, 1, 1, 1,
0.6213502, 0.4037104, 2.956205, 1, 1, 1, 1, 1,
0.6255441, -1.605715, 0.8518448, 1, 1, 1, 1, 1,
0.6314536, -0.7900636, 3.311337, 1, 1, 1, 1, 1,
0.6343493, 0.3401788, 2.400702, 1, 1, 1, 1, 1,
0.6345423, -1.150086, 2.880208, 1, 1, 1, 1, 1,
0.63485, 0.01281136, 0.80188, 1, 1, 1, 1, 1,
0.6356931, -0.4926758, 1.030938, 1, 1, 1, 1, 1,
0.6360625, -0.7159834, 0.9367629, 1, 1, 1, 1, 1,
0.6516908, 1.067871, 0.8464646, 1, 1, 1, 1, 1,
0.6552564, 0.3634568, 1.334144, 1, 1, 1, 1, 1,
0.6700382, -1.467736, 4.109684, 1, 1, 1, 1, 1,
0.6710554, -1.646329, 3.444624, 1, 1, 1, 1, 1,
0.6771141, -0.2915585, 3.551124, 1, 1, 1, 1, 1,
0.6860989, 0.3926957, 1.149451, 1, 1, 1, 1, 1,
0.6915665, 0.5172154, -0.2351249, 0, 0, 1, 1, 1,
0.6921151, -0.08330626, 0.8280768, 1, 0, 0, 1, 1,
0.6966953, 1.400322, 0.5115618, 1, 0, 0, 1, 1,
0.6990287, 0.6574153, -0.1460464, 1, 0, 0, 1, 1,
0.6995767, 1.235337, 1.643635, 1, 0, 0, 1, 1,
0.7017467, -0.5622343, 1.734273, 1, 0, 0, 1, 1,
0.7030331, 2.594493, 1.329082, 0, 0, 0, 1, 1,
0.7081324, -1.075849, 3.553023, 0, 0, 0, 1, 1,
0.7109827, 0.3027116, 1.225794, 0, 0, 0, 1, 1,
0.7123882, -1.354298, 3.385352, 0, 0, 0, 1, 1,
0.7139902, -0.2172695, 1.702235, 0, 0, 0, 1, 1,
0.7250187, -0.8361949, 4.3362, 0, 0, 0, 1, 1,
0.7253201, -0.3111687, 4.168401, 0, 0, 0, 1, 1,
0.7336985, 0.7720286, 0.9843084, 1, 1, 1, 1, 1,
0.7376091, -2.265244, 3.361623, 1, 1, 1, 1, 1,
0.7387805, -1.68676, 2.04569, 1, 1, 1, 1, 1,
0.7411563, -0.3365745, 3.177098, 1, 1, 1, 1, 1,
0.7427021, -0.4096126, 2.398124, 1, 1, 1, 1, 1,
0.7433705, -0.01672893, 2.052034, 1, 1, 1, 1, 1,
0.7455665, -1.672324, 3.440668, 1, 1, 1, 1, 1,
0.7484514, -0.2926145, 1.637118, 1, 1, 1, 1, 1,
0.7485676, -0.2983386, 2.680046, 1, 1, 1, 1, 1,
0.7498872, -0.2285544, 0.5130912, 1, 1, 1, 1, 1,
0.7506517, -0.2356918, 1.100536, 1, 1, 1, 1, 1,
0.7515159, 0.01130502, 1.442639, 1, 1, 1, 1, 1,
0.7534357, -0.3046203, 2.266983, 1, 1, 1, 1, 1,
0.760652, 0.923744, 1.174711, 1, 1, 1, 1, 1,
0.7643542, -1.144267, 2.504377, 1, 1, 1, 1, 1,
0.7696545, -0.2587082, 1.232834, 0, 0, 1, 1, 1,
0.7704243, -1.912012, 2.650689, 1, 0, 0, 1, 1,
0.7728325, -1.897162, 3.162571, 1, 0, 0, 1, 1,
0.7778664, -1.71643, 1.341008, 1, 0, 0, 1, 1,
0.7783961, -0.9522304, 2.963926, 1, 0, 0, 1, 1,
0.7830015, 1.15684, 0.9368032, 1, 0, 0, 1, 1,
0.7834163, 3.190371, 0.8106847, 0, 0, 0, 1, 1,
0.7843031, 0.9198632, 0.8320798, 0, 0, 0, 1, 1,
0.7866755, 0.8001735, 0.2952594, 0, 0, 0, 1, 1,
0.7883086, -1.538837, 4.173641, 0, 0, 0, 1, 1,
0.7931961, -0.8683434, 3.488658, 0, 0, 0, 1, 1,
0.7932969, 0.07821321, 2.970228, 0, 0, 0, 1, 1,
0.794111, 2.035642, 0.07122374, 0, 0, 0, 1, 1,
0.796389, 0.273284, 3.213534, 1, 1, 1, 1, 1,
0.8033663, -1.601216, 2.489279, 1, 1, 1, 1, 1,
0.8056953, -0.9437186, 2.915758, 1, 1, 1, 1, 1,
0.8118088, 0.3860264, 2.87385, 1, 1, 1, 1, 1,
0.8172547, 0.007114928, 0.5210093, 1, 1, 1, 1, 1,
0.8218259, -1.374655, 1.301034, 1, 1, 1, 1, 1,
0.8274352, 1.409385, 0.1854095, 1, 1, 1, 1, 1,
0.8343908, -0.578432, 3.23337, 1, 1, 1, 1, 1,
0.8365103, -0.9360946, 3.579827, 1, 1, 1, 1, 1,
0.8468284, 0.1221659, 0.3662089, 1, 1, 1, 1, 1,
0.847716, 1.540891, -0.5117285, 1, 1, 1, 1, 1,
0.8482167, 1.53759, 0.8391867, 1, 1, 1, 1, 1,
0.8482189, -1.348509, 1.777016, 1, 1, 1, 1, 1,
0.8532522, -0.8877016, 1.417829, 1, 1, 1, 1, 1,
0.8577126, 0.5702685, 0.003818462, 1, 1, 1, 1, 1,
0.863936, -0.5719405, 2.571121, 0, 0, 1, 1, 1,
0.8656733, -0.595949, 3.110865, 1, 0, 0, 1, 1,
0.8665803, 0.05217499, 0.3429278, 1, 0, 0, 1, 1,
0.8685674, -0.1663732, 1.427286, 1, 0, 0, 1, 1,
0.8694879, -1.575798, 1.810184, 1, 0, 0, 1, 1,
0.8719438, -0.8662825, 3.374132, 1, 0, 0, 1, 1,
0.8742349, -1.692193, 3.178766, 0, 0, 0, 1, 1,
0.8751562, -1.968617, 3.136888, 0, 0, 0, 1, 1,
0.8767232, -0.6083127, 2.600285, 0, 0, 0, 1, 1,
0.8785813, -1.105686, 3.466269, 0, 0, 0, 1, 1,
0.8881154, 1.442258, 0.005492733, 0, 0, 0, 1, 1,
0.8896738, 0.4122766, 1.12591, 0, 0, 0, 1, 1,
0.8944875, 1.151775, 0.9327056, 0, 0, 0, 1, 1,
0.8980516, -1.07039, 3.057656, 1, 1, 1, 1, 1,
0.89979, -1.685667, 1.979601, 1, 1, 1, 1, 1,
0.9005742, -0.01248333, 2.613316, 1, 1, 1, 1, 1,
0.908484, 1.939247, -0.9509917, 1, 1, 1, 1, 1,
0.910845, -0.9244941, 1.268195, 1, 1, 1, 1, 1,
0.9141132, 0.0605319, 1.469626, 1, 1, 1, 1, 1,
0.9149431, 0.004517112, 1.45811, 1, 1, 1, 1, 1,
0.9166784, -1.539084, 1.830992, 1, 1, 1, 1, 1,
0.9192762, 0.2113789, 1.600154, 1, 1, 1, 1, 1,
0.9215065, 0.8738472, -0.1711514, 1, 1, 1, 1, 1,
0.9220538, -1.430953, 1.512459, 1, 1, 1, 1, 1,
0.9240175, 0.4515584, 0.7458089, 1, 1, 1, 1, 1,
0.9304323, -1.223017, 2.378901, 1, 1, 1, 1, 1,
0.9348418, -0.02167061, 2.638369, 1, 1, 1, 1, 1,
0.935256, 0.3406705, 0.164816, 1, 1, 1, 1, 1,
0.9404811, 0.5841743, 1.152773, 0, 0, 1, 1, 1,
0.9497867, -0.2283215, 2.264128, 1, 0, 0, 1, 1,
0.9560733, -1.161946, 1.57725, 1, 0, 0, 1, 1,
0.9573862, 0.6642923, 0.9271321, 1, 0, 0, 1, 1,
0.9645684, -0.9936657, 3.509085, 1, 0, 0, 1, 1,
0.9647002, 1.861408, 0.02793829, 1, 0, 0, 1, 1,
0.9704505, 0.6221406, 1.067423, 0, 0, 0, 1, 1,
0.9778011, -0.9191475, 3.080243, 0, 0, 0, 1, 1,
0.979052, 1.250633, 1.604844, 0, 0, 0, 1, 1,
0.9832106, 0.2117947, 1.666073, 0, 0, 0, 1, 1,
0.9841399, 0.7531844, 2.523792, 0, 0, 0, 1, 1,
0.9843407, 0.9288229, 0.03400458, 0, 0, 0, 1, 1,
0.9866522, 1.894859, -0.7715967, 0, 0, 0, 1, 1,
0.9888597, 0.3743314, 0.03548623, 1, 1, 1, 1, 1,
0.9915323, 1.002359, 0.4692577, 1, 1, 1, 1, 1,
1.002959, 0.4637485, 3.104396, 1, 1, 1, 1, 1,
1.005321, 2.084759, 0.8459231, 1, 1, 1, 1, 1,
1.005603, 0.01071814, -0.1548592, 1, 1, 1, 1, 1,
1.019115, -1.251582, 1.847068, 1, 1, 1, 1, 1,
1.022696, -0.5351264, 2.145221, 1, 1, 1, 1, 1,
1.022735, 0.3074549, 2.813368, 1, 1, 1, 1, 1,
1.02667, 1.123506, 0.4793922, 1, 1, 1, 1, 1,
1.034841, -1.166577, 0.8785403, 1, 1, 1, 1, 1,
1.035625, 0.06811585, 1.754872, 1, 1, 1, 1, 1,
1.036055, -0.5930563, 3.220094, 1, 1, 1, 1, 1,
1.040808, 0.6181427, 1.592604, 1, 1, 1, 1, 1,
1.041522, -1.494476, 3.271024, 1, 1, 1, 1, 1,
1.042392, 0.8062562, 0.4510932, 1, 1, 1, 1, 1,
1.057905, 0.04971644, 1.981553, 0, 0, 1, 1, 1,
1.060503, -0.0781133, -0.26704, 1, 0, 0, 1, 1,
1.065337, 0.7135789, 1.21846, 1, 0, 0, 1, 1,
1.084207, -0.3949143, 0.08130068, 1, 0, 0, 1, 1,
1.090789, 1.137755, 0.300208, 1, 0, 0, 1, 1,
1.09092, 0.1319766, 2.416078, 1, 0, 0, 1, 1,
1.091864, -0.2043113, 1.721198, 0, 0, 0, 1, 1,
1.09402, -0.7549693, 2.139051, 0, 0, 0, 1, 1,
1.09776, -0.6483348, 1.322218, 0, 0, 0, 1, 1,
1.099613, -0.6164819, 1.416211, 0, 0, 0, 1, 1,
1.100005, 1.102447, 1.152797, 0, 0, 0, 1, 1,
1.105314, -0.3240264, 3.264462, 0, 0, 0, 1, 1,
1.107177, 2.13974, 0.8754824, 0, 0, 0, 1, 1,
1.110949, 1.430438, 1.468572, 1, 1, 1, 1, 1,
1.118942, 1.014161, 1.991761, 1, 1, 1, 1, 1,
1.135575, 1.164482, -0.3924577, 1, 1, 1, 1, 1,
1.137089, 0.1477299, 0.8142823, 1, 1, 1, 1, 1,
1.141819, 0.2838325, 0.5517595, 1, 1, 1, 1, 1,
1.155683, 1.013342, 0.6568112, 1, 1, 1, 1, 1,
1.164387, 1.096437, 0.6087767, 1, 1, 1, 1, 1,
1.166926, -0.002234459, 0.6627218, 1, 1, 1, 1, 1,
1.170987, -0.7575502, 1.104301, 1, 1, 1, 1, 1,
1.172244, 1.314552, 0.905275, 1, 1, 1, 1, 1,
1.18058, 0.08068411, 3.458449, 1, 1, 1, 1, 1,
1.181842, 1.525908, 0.7564024, 1, 1, 1, 1, 1,
1.190205, 0.1702456, 0.3263013, 1, 1, 1, 1, 1,
1.204528, -1.468246, 3.491993, 1, 1, 1, 1, 1,
1.205998, 0.6399019, 0.3450224, 1, 1, 1, 1, 1,
1.21225, 0.3802045, 1.022945, 0, 0, 1, 1, 1,
1.221713, -0.1939752, 2.632195, 1, 0, 0, 1, 1,
1.234917, -0.3920446, 3.257933, 1, 0, 0, 1, 1,
1.2452, 0.7448679, 0.01631098, 1, 0, 0, 1, 1,
1.255191, -1.50194, 1.150735, 1, 0, 0, 1, 1,
1.26267, 0.4880172, 2.46839, 1, 0, 0, 1, 1,
1.26882, -1.927885, 1.808519, 0, 0, 0, 1, 1,
1.270845, 1.340665, 0.3255687, 0, 0, 0, 1, 1,
1.274312, -0.584479, -0.1465096, 0, 0, 0, 1, 1,
1.281025, 0.0479906, 2.548794, 0, 0, 0, 1, 1,
1.282155, -1.492146, 3.063457, 0, 0, 0, 1, 1,
1.294674, -1.212414, 2.995061, 0, 0, 0, 1, 1,
1.295923, 0.4233875, 2.447348, 0, 0, 0, 1, 1,
1.297634, -0.02157442, 2.377018, 1, 1, 1, 1, 1,
1.300494, -2.294727, 2.43187, 1, 1, 1, 1, 1,
1.301403, 0.2248186, 1.79873, 1, 1, 1, 1, 1,
1.317372, 1.785333, 0.2700511, 1, 1, 1, 1, 1,
1.330661, -0.2737181, 4.192813, 1, 1, 1, 1, 1,
1.34122, 1.119941, 1.046547, 1, 1, 1, 1, 1,
1.357078, 1.429937, -0.7497145, 1, 1, 1, 1, 1,
1.358727, -0.6403475, 2.775507, 1, 1, 1, 1, 1,
1.372655, -0.4232575, 1.560045, 1, 1, 1, 1, 1,
1.382972, 0.4217479, 1.724698, 1, 1, 1, 1, 1,
1.383648, 0.3546744, 0.3522187, 1, 1, 1, 1, 1,
1.405475, 1.032774, 2.097076, 1, 1, 1, 1, 1,
1.407768, 0.1518879, -0.5364246, 1, 1, 1, 1, 1,
1.409094, 1.266268, 0.5796723, 1, 1, 1, 1, 1,
1.410939, 0.6503183, 2.197351, 1, 1, 1, 1, 1,
1.412762, -1.819743, 3.584999, 0, 0, 1, 1, 1,
1.419699, -0.8634749, 2.707135, 1, 0, 0, 1, 1,
1.426275, -1.36586, 1.309984, 1, 0, 0, 1, 1,
1.435004, -0.1488434, 1.618865, 1, 0, 0, 1, 1,
1.43654, -0.2007086, 1.865895, 1, 0, 0, 1, 1,
1.439019, -1.283675, 1.821528, 1, 0, 0, 1, 1,
1.44771, -0.8296964, 2.409187, 0, 0, 0, 1, 1,
1.448611, -0.6993541, 1.37322, 0, 0, 0, 1, 1,
1.45698, 0.7001484, 1.277397, 0, 0, 0, 1, 1,
1.459773, 0.3970175, 0.3548467, 0, 0, 0, 1, 1,
1.464037, 2.269809, 0.6952621, 0, 0, 0, 1, 1,
1.465147, -0.480212, 1.015136, 0, 0, 0, 1, 1,
1.470316, -0.7544581, -0.1410055, 0, 0, 0, 1, 1,
1.484274, -1.550112, 2.480214, 1, 1, 1, 1, 1,
1.495344, -1.652466, 3.708955, 1, 1, 1, 1, 1,
1.503372, -1.141352, 2.78487, 1, 1, 1, 1, 1,
1.50418, -0.4894152, 1.411875, 1, 1, 1, 1, 1,
1.518453, -2.638386, 3.067065, 1, 1, 1, 1, 1,
1.519189, 0.8209069, 1.209227, 1, 1, 1, 1, 1,
1.53577, 1.163148, 0.7315974, 1, 1, 1, 1, 1,
1.539198, -0.8397368, 1.666226, 1, 1, 1, 1, 1,
1.539506, 1.237842, 0.3947843, 1, 1, 1, 1, 1,
1.545887, -0.6505278, 1.631583, 1, 1, 1, 1, 1,
1.547758, 2.934098, -1.00732, 1, 1, 1, 1, 1,
1.551026, 1.435052, 0.03675949, 1, 1, 1, 1, 1,
1.551303, -0.9664664, 2.153545, 1, 1, 1, 1, 1,
1.571059, 0.8294667, 2.130419, 1, 1, 1, 1, 1,
1.574432, 1.549439, -0.1554517, 1, 1, 1, 1, 1,
1.585882, 0.1429887, 1.037375, 0, 0, 1, 1, 1,
1.599387, -1.471035, 4.726795, 1, 0, 0, 1, 1,
1.605572, -1.141111, 2.366879, 1, 0, 0, 1, 1,
1.606709, -0.6315621, 1.528998, 1, 0, 0, 1, 1,
1.610722, 0.8413516, 2.018479, 1, 0, 0, 1, 1,
1.650428, -0.5497793, 3.284109, 1, 0, 0, 1, 1,
1.659067, 0.8975793, 1.965975, 0, 0, 0, 1, 1,
1.691991, -1.286826, 1.258752, 0, 0, 0, 1, 1,
1.694097, -1.99804, 2.376646, 0, 0, 0, 1, 1,
1.706967, 0.6210881, 3.00498, 0, 0, 0, 1, 1,
1.718661, 0.2860003, 1.984447, 0, 0, 0, 1, 1,
1.740463, -0.3862681, 0.9579319, 0, 0, 0, 1, 1,
1.742733, 0.1787488, 2.601517, 0, 0, 0, 1, 1,
1.769168, 1.862453, 0.7672389, 1, 1, 1, 1, 1,
1.780593, 0.9043348, 2.035087, 1, 1, 1, 1, 1,
1.807967, 0.7088214, 2.710572, 1, 1, 1, 1, 1,
1.811979, 0.1448513, 1.761298, 1, 1, 1, 1, 1,
1.815166, -0.2773589, -0.7437867, 1, 1, 1, 1, 1,
1.850652, 0.2056511, 0.5686192, 1, 1, 1, 1, 1,
1.872399, -0.0797879, 1.930612, 1, 1, 1, 1, 1,
1.873816, -1.14821, 0.5434611, 1, 1, 1, 1, 1,
1.898549, 2.425307, 1.683939, 1, 1, 1, 1, 1,
1.943151, -1.614328, 1.320084, 1, 1, 1, 1, 1,
1.966154, 0.09712773, 3.003195, 1, 1, 1, 1, 1,
1.97272, -0.9518945, 1.336127, 1, 1, 1, 1, 1,
1.972942, 0.5102204, 0.9990187, 1, 1, 1, 1, 1,
1.999299, 1.736876, 1.223048, 1, 1, 1, 1, 1,
2.006085, -0.1621307, 1.93765, 1, 1, 1, 1, 1,
2.050558, 2.138519, 0.654045, 0, 0, 1, 1, 1,
2.105638, 0.6449932, 1.878033, 1, 0, 0, 1, 1,
2.125455, -1.700718, 1.595371, 1, 0, 0, 1, 1,
2.142443, 1.55691, 0.2855055, 1, 0, 0, 1, 1,
2.152201, -0.9190758, -0.318142, 1, 0, 0, 1, 1,
2.198417, 0.1617559, 2.224643, 1, 0, 0, 1, 1,
2.22638, -0.05126015, 0.9702879, 0, 0, 0, 1, 1,
2.243854, 0.2784499, -0.1961197, 0, 0, 0, 1, 1,
2.258287, -0.08316337, 1.471464, 0, 0, 0, 1, 1,
2.280243, 0.605176, 1.340475, 0, 0, 0, 1, 1,
2.312241, -0.8549243, 0.7521785, 0, 0, 0, 1, 1,
2.377997, -0.8047536, 3.087822, 0, 0, 0, 1, 1,
2.387729, -1.175177, 0.6660928, 0, 0, 0, 1, 1,
2.392992, 0.1059892, 2.198916, 1, 1, 1, 1, 1,
2.540744, -0.3659347, 3.380309, 1, 1, 1, 1, 1,
2.649395, -2.627818, 2.665058, 1, 1, 1, 1, 1,
2.652294, -0.1906552, 2.3554, 1, 1, 1, 1, 1,
2.676028, 1.908448, -0.2012741, 1, 1, 1, 1, 1,
2.722508, 0.2814985, 1.3677, 1, 1, 1, 1, 1,
3.166234, -0.05813278, 1.494946, 1, 1, 1, 1, 1
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
var radius = 10.02419;
var distance = 35.20953;
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
mvMatrix.translate( -0.01792097, -0.1850123, -0.2583275 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.20953);
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
